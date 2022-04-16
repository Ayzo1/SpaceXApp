import Foundation

final class SettingsService: SettingsServiceProtocol {
	
	// MARK: - Private Properies
	
	weak var delegate: SettingsServiceDelegate?
	private var userDefaultsService: UserDefaultsServiceProtocol = UserDefaultsService()
	
	// MARK: - Properies
	
	var currentHeightSettings: RocketHeight
	var currentDiameterSettings: RocketDiameter
	var currentMassSettings: RocketMass
	var currentPayloadsSettings: RocketPayloads
	
	// MARK: - init
	
	init() {
		currentHeightSettings = RocketHeight(rawValue: userDefaultsService.getForKey(key: "heightSettings") ?? "m") ?? .m
		currentDiameterSettings = RocketDiameter(rawValue: userDefaultsService.getForKey(key: "diameterSettings") ?? "m") ?? .m
		currentMassSettings = RocketMass(rawValue: userDefaultsService.getForKey(key: "massSettings") ?? "kg") ?? .kg
		currentPayloadsSettings = RocketPayloads(rawValue: userDefaultsService.getForKey(key: "payloadsSettings") ?? "kg") ?? .kg
	}
	
	// MARK: - SettingsServiceProtocol
	
	func changeHeightSettings(newValue: Int) {
		switch newValue {
		case 0:
			currentHeightSettings = .m
		case 1:
			currentHeightSettings = .ft
		default:
			currentHeightSettings = .m
		}
		userDefaultsService.saveForKey(text: currentHeightSettings.rawValue, key: "heightSettings")
		delegate?.heightSettingsChanged()
	}
	
	func changeDiameterSettings(newValue: Int) {
		switch newValue {
		case 0:
			currentDiameterSettings = .m
		case 1:
			currentDiameterSettings = .ft
		default:
			currentDiameterSettings = .m
		}
		userDefaultsService.saveForKey(text: currentDiameterSettings.rawValue, key: "diameterSettings")
		delegate?.diameterSettingsChanged()
	}
	
	func changeMassSettings(newValue: Int) {
		switch newValue {
		case 0:
			currentMassSettings = .kg
		case 1:
			currentMassSettings = .lb
		default:
			currentMassSettings = .kg
		}
		userDefaultsService.saveForKey(text: currentMassSettings.rawValue, key: "massSettings")
		delegate?.massSettingsChanged()
	}
	
	func changePayloadsSettings(newValue: Int) {
		switch newValue {
		case 0:
			currentPayloadsSettings = .kg
		case 1:
			currentPayloadsSettings = .lb
		default:
			currentPayloadsSettings = .kg
		}
		userDefaultsService.saveForKey(text: currentPayloadsSettings.rawValue, key: "payloadsSettings")
		delegate?.payloadsSettingsChanged()
	}
}
