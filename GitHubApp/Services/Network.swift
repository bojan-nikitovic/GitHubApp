//
//  Created by Bojan on 28.4.24.
//

import Combine
import Foundation
import UIKit

// A set to store all active subscriptions, preventing them from being deallocated prematurely.
var subscriptions = Set<AnyCancellable>()

/// A generic service class that handles network requests for any decodable type.
class Service<T : Decodable> {
    /// Creates a network request to the specified endpoint and returns a publisher that emits the requested decodable type.
    /// - Parameter endpoint: The `Endpoint` instance containing URL and method information.
    /// - Returns: A publisher that emits a single value of type `T` or an error.
    func makeRequest(endpoint: Endpoint) -> AnyPublisher<T, Error> {
        return Network.makeRequest(type: T.self, endpoint: endpoint)
            .eraseToAnyPublisher()
    }
}

/// A network layer class that handles the creation and execution of network requests.
final class Network {
    /// Creates and performs a URLSession task for a given endpoint and decodable type.
    /// - Parameters:
    ///   - type: The type of the decodable model that the response data will be decoded to.
    ///   - endpoint: The `Endpoint` instance containing URL and method to construct the URLRequest.
    /// - Returns: A publisher that will attempt to map and decode the fetched data into the specified decodable type.
    class func makeRequest<T: Decodable>(type: T.Type, endpoint: Endpoint) -> Publishers.Decode<Publishers.MapError<Publishers.TryMap<URLSession.DataTaskPublisher, Data>, Error>, T, JSONDecoder> {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.method.rawValue
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 300.0
        let session = URLSession(configuration: config, delegate: nil, delegateQueue: nil)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                return data
            }
            .mapError { error -> Error in
                return error
            }
            .decode(type: T.self, decoder: decoder)
    }
}

extension AnyPublisher {
    /// Adds a subscriber with completion and value handlers to this publisher.
    /// - Parameter completion: A closure that is called when the publisher completes, either with a final value or with an error.
    func request(completion: @escaping ((Result<Output, Error>) -> Void)) {
        sink { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            case .finished: break
            }
        } receiveValue: { result in
            DispatchQueue.main.async {
                completion(.success(result))
            }
        }.store(in: &subscriptions)
    }
}
