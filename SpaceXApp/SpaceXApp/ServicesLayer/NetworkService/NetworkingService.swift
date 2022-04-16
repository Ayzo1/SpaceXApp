import Foundation

final class NetworkingService: NetworkingServiceProtocol {
    
    // MARK: - Properties
    
    private let configuration: URLSessionConfiguration = .default
    private lazy var urlSession: URLSession = .init(configuration: configuration)
    
    // MARK: - Initializers

    init() {
            
    }
    
    // MARK: - NetworkingServiceProtocol
        
    public func fetchFromUrl(url: URL, successComplete: @escaping (Data) -> Void, falilure: @escaping (Error?) -> Void) {
        let request: URLRequest = .init(url: url)
        let dataTask = urlSession.dataTask(with: request) {data, response, error in
            guard (response as? HTTPURLResponse)?.statusCode == 200,
                let data = data,
                error == nil
            else {
                falilure(error)
                return
            }
            successComplete(data)
        }
        dataTask.resume()
    }
}
