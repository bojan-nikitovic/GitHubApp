//
//  Created by Bojan on 28.4.24.
//

import Foundation

struct User: Identifiable, Codable {
    var id: Int
    var login: String
    var name: String?
    var avatarUrl: String?
    var company: String?
    
    enum CodingKeys: String, CodingKey {
        case id, login, name, avatarUrl = "avatar_url", company
    }
}
