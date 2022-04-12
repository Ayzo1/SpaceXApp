import Foundation

protocol NetworkingServiceProtocol {
    
    func fetchFromUrl(url: URL, successComplete: @escaping (Data) -> Void, falilure: @escaping (Error?) -> Void)
}
