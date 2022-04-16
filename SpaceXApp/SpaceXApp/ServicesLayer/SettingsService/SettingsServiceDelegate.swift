import Foundation

protocol SettingsServiceDelegate: AnyObject {
	
	func heightSettingsChanged()
	func diameterSettingsChanged()
	func massSettingsChanged()
	func payloadsSettingsChanged()
}
