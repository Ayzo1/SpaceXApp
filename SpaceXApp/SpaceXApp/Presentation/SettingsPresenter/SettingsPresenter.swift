import Foundation

final class SettingsPresenter: SettingsPresenterProtocol {
	
	weak var view: SettingsViewProtocol?
	var settingsService: SettingsServiceProtocol?
	
	// MARK: - init
	
	init(view: SettingsViewProtocol) {
		self.view = view
		guard let service: SettingsServiceProtocol = ServiceLocator.shared.resolve() else {
			return
		}
		settingsService = service
	}
	
	// MARK: - SettingsPresenterProtocol
	
	func heightValueChanged(currentValue: Int) {
		settingsService?.changeHeightSettings(newValue: currentValue)
	}
	
	func diameterValueChanged(currentValue: Int) {
		settingsService?.changeDiameterSettings(newValue: currentValue)
	}
	
	func massValueChanged(currentValue: Int) {
		settingsService?.changeMassSettings(newValue: currentValue)
	}
	
	func payloadsValueChanged(currentValue: Int) {
		settingsService?.changePayloadsSettings(newValue: currentValue)
	}
	
	func getHeightSettings() -> Int {
		guard let service = settingsService else {
			return 0
		}
		switch service.currentHeightSettings {
		case .m:
			return 0
		case .ft:
			return 1
		}
	}
	
	func getDiameterSettings() -> Int {
		guard let service = settingsService else {
			return 0
		}
		switch service.currentDiameterSettings {
		case .m:
			return 0
		case .ft:
			return 1
		}
	}
	
	func getMassSettings() -> Int {
		guard let service = settingsService else {
			return 0
		}
		switch service.currentMassSettings {
		case .kg:
			return 0
		case .lb:
			return 1
		}
	}
	
	func getPayloadsSettings() -> Int {
		guard let service = settingsService else {
			return 0
		}
		switch service.currentPayloadsSettings {
		case .kg:
			return 0
		case .lb:
			return 1
		}
	}
}
