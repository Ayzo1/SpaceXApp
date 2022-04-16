import Foundation

final class UserDefaultsService: UserDefaultsServiceProtocol {

	private let defaults = UserDefaults.standard

	func saveForKey(text: String, key: String) {
		defaults.setValue(text, forKey: key)
	}

	func getForKey(key: String) -> String? {
		return defaults.string(forKey: key)
	}
}
