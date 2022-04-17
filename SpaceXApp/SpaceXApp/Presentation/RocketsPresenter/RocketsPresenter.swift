import Foundation

final class RocketsPresenter: RocketsPresenterProtocol {
	
	weak var view: RocketsViewProtocol?
	
	// MARK: - Private properties
	
	private var rockets: [DBRocket] = [DBRocket]()
	private var settingsService: SettingsServiceProtocol?
	private var coreDataStack: CoreDataStackProtocol?
	
	// MARK: - init
	
	init(view: RocketsViewProtocol) {
		self.view = view
		guard let service: SettingsServiceProtocol = ServiceLocator.shared.resolve() else {
			return
		}
		settingsService = service
		settingsService?.delegate = self
		
		guard let coreDataStack: CoreDataStackProtocol = ServiceLocator.shared.resolve() else {
			return
		}
		self.coreDataStack = coreDataStack
		self.rockets = coreDataStack.fetch(fetchRequest: DBRocket.fetchRequest())
		
		downloadRockets()
	}
	
	// MARK: - PrivateMethods
	
	private func downloadRockets() {
		
		guard let url = URL(string: Constants.rocketsStringURL) else {
			return
		}
		let networkService = NetworkingService()
		networkService.fetchFromUrl(url: url) { [weak self] data in
			guard let coreDataStack = self?.coreDataStack else {
				return
			}
			coreDataStack.performSave() { context in
				let decoder = JSONDecoder()
				decoder.userInfo[CodingUserInfoKey.context!] = context
				
				do {
					_ = try decoder.decode([DBRocket].self, from: data)
				} catch {
					print(error.localizedDescription)
				}
			} successSave: {
				guard let dbRockets = self?.coreDataStack?.fetch(fetchRequest: DBRocket.fetchRequest()) else {
					return
				}
				self?.rockets = dbRockets
				self?.view?.updateValues()
			}
		} falilure: { (error) in
			print(error?.localizedDescription ?? "error")
		}
	}
	
	private func formateDate(stringDate: String) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "ru_RU")
		dateFormatter.dateFormat = "yyyy-MM-dd"
		guard let date = dateFormatter.date(from: stringDate) else {
			return stringDate
		}
		dateFormatter.dateFormat = "d MMMM, yyyy"
		return dateFormatter.string(from: date)
	}
	
	private func configurateHeight(rocket index: Int) -> (value: String, name: String) {
		guard let height = rockets[index].height else {
			return (value: "", name: "Высота, ft")
		}
		guard let service = settingsService else {
			return (value: String(height.feet), name: "Высота, ft")
		}
		if service.currentHeightSettings == .m {
			return (
				value: String(height.meters),
				name: "Высота, \(service.currentHeightSettings.rawValue)")
		} else {
			return (
				value: String(height.feet),
				name: "Высота, \(service.currentHeightSettings.rawValue)")
		}
	}
	
	private func configurateDiameter(rocket index: Int) -> (value: String, name: String) {
		guard let diameter = rockets[index].diameter else {
			return (value: "0", name: "Диаметр, ft")
		}
		guard let service = settingsService else {
			return (value: String(diameter.feet), name: "Диаметр, ft")
		}
		if service.currentDiameterSettings == .m {
			return (
				value: String(diameter.meters),
				name: "Диаметр, \(service.currentDiameterSettings.rawValue)")
		} else {
			return (
				value: String(diameter.feet),
				name: "Диаметр, \(service.currentDiameterSettings.rawValue)")
		}
	}
	
	private func configurateMass(rocket index: Int) -> (value: String, name: String) {
		guard let mass = rockets[index].mass else {
			return (value: "", name: "Масса, ft")
		}
		guard let service = settingsService else {
			return (value: String(mass.kg), name: "Масса, kg")
		}
		if service.currentMassSettings == .kg {
			return (
				value: String(mass.kg),
				name: "Масса, \(service.currentMassSettings.rawValue)")
		} else {
			return (
				value: String(mass.lb),
				name: "Масса, \(service.currentMassSettings.rawValue)")
		}
	}
	
	private func configuratePayload(rocket index: Int) -> (value: String, name: String) {
		guard let payloads = rockets[index].payloads?.allObjects as? [DBPayload] else {
			return (value: "", name: "Высота, ft")
		}
		if payloads.isEmpty { return (value: "", name: "Нагрузка, ft") }
		guard let service = settingsService else {
			return (value: String(payloads[0].kg), name: "Нагрузка, kg")
		}
		if service.currentPayloadsSettings == .kg {
			return (
				value: String(payloads[0].kg),
				name: "Нагрузка, \(service.currentPayloadsSettings.rawValue)")
		} else {
			return (
				value: String(payloads[0].lb),
				name: "Нагрузка, \(service.currentPayloadsSettings.rawValue)")
		}
	}
	
	// MARK: - RocketsPresenterProtocol
	
	func getRocketId(for index: Int) -> String {
		return rockets[index].id ?? ""
	}
	
	func getRocketName(for index: Int) -> String {
		return rockets[index].name ?? ""
	}
	
	func getPagesCount() -> Int {
		return rockets.count
	}
	
	func getRocketInfo(for index: Int) -> (firstLaunch: String, country: String, launchCost: String) {
		
		let rocket = rockets[index]
		let cost = rocket.launchCost
		
		let costInMillions = cost / 1000000
		let date = formateDate(stringDate: rocket.firstFlight ?? "")
		
		return (firstLaunch: date, country: rocket.country ?? "", launchCost: String(costInMillions))
	}
	
	func getFirstStageInfo(for index: Int) -> (engiensCount: String, massOfFuel: String, burnTime: String) {
		let rocket = rockets[index]
		let firstStage = rocket.firstStage
		let engines = String(firstStage?.engines ?? 0)
		
		return (engiensCount: engines, massOfFuel: String(firstStage?.fuelAmountTons ?? 0), burnTime: String(firstStage?.burnTime ?? 0))
	}
	
	func getSecondStageInfo(for index: Int) -> (engiensCount: String, massOfFuel: String, burnTime: String) {
		let rocket = rockets[index]
		let secondStage = rocket.secondStage
		
		return (engiensCount: String(secondStage?.engines ?? 0), massOfFuel: String(secondStage?.fuelAmountTons ?? 0), burnTime: String(secondStage?.burnTime ?? 0))
	}
	
	func getImageURL(for index: Int) -> URL? {
		
		guard let stringUrl = rockets[index].images?.first else {
			return nil
		}
		guard let url = URL(string: stringUrl) else {
			return nil
		}

		return url
	}
	
	func getCharacteristicsCount() -> Int {
		if rockets.isEmpty {
			return 0
		}
		return 4
	}
	
	func getCharacterictics(for rocketIndex: Int, characteristicIndex: Int) -> (value: String, name: String) {
				
		switch characteristicIndex {
		case 0:
			return configurateHeight(rocket: rocketIndex)
		case 1:
			return configurateDiameter(rocket: rocketIndex)
		case 2:
			return configurateMass(rocket: rocketIndex)
		case 3:
			return configuratePayload(rocket: rocketIndex)
		default:
			return (value: "", name: "")
		}
	}
}

extension RocketsPresenter: SettingsServiceDelegate {
	func heightSettingsChanged() {
		let indexPath = IndexPath(row: 0, section: 0)
		view?.reloadCollectionViewCell(indexPaths: [indexPath])
	}
	
	func diameterSettingsChanged() {
		let indexPath = IndexPath(row: 1, section: 0)
		view?.reloadCollectionViewCell(indexPaths: [indexPath])
	}
	
	func massSettingsChanged() {
		let indexPath = IndexPath(row: 2, section: 0)
		view?.reloadCollectionViewCell(indexPaths: [indexPath])
	}
	
	func payloadsSettingsChanged() {
		let indexPath = IndexPath(row: 3, section: 0)
		view?.reloadCollectionViewCell(indexPaths: [indexPath])
	}
}
