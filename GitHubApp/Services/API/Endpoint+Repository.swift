//
//  Created by Bojan on 28.4.24.
//

import Foundation

extension Endpoint {
    static func getRepositories(for user: String) -> Self {
        return Endpoint(method: .get, path: "/users/\(user)/repos")
    }
}
