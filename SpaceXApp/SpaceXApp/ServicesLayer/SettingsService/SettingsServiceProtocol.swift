import Foundation

protocol SettingsServiceProtocol {
	
	var delegate: SettingsServiceDelegate? { get set }
	
	var currentHeightSettings: RocketHeight { get }
	var currentDiameterSettings: RocketDiameter { get }
	var currentMassSettings: RocketMass { get }
	var currentPayloadsSettings: RocketPayloads { get }
	
	func changeHeightSettings(newValue: Int)
	func changeDiameterSettings(newValue: Int)
	func changeMassSettings(newValue: Int)
	func changePayloadsSettings(newValue: Int)
}
