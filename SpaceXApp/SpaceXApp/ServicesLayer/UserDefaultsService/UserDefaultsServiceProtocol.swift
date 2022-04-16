protocol UserDefaultsServiceProtocol {

	func saveForKey(text: String, key: String)
	func getForKey(key: String) -> String?
}
