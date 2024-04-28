//
//  Created by Bojan on 28.4.24.
//

import Foundation

extension Endpoint {
    static func getCommits(for user: String, repository: String) -> Self {
        return Endpoint(method: .get, path: "/repos/\(user)/\(repository)/commits")
    }
}
