//
//  Created by Bojan on 28.4.24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

struct Endpoint {
    var method: HTTPMethod
    var path: String
    var url: URL {
        guard var components = URLComponents(string: SERVER_URL) else {
            preconditionFailure("Invalid server URL")
        }

        components.path = path
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}
