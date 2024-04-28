//
//  Created by Bojan on 28.4.24.
//

import Foundation

struct Commit: Identifiable, Codable {
    var id: String { nodeId }
    var nodeId: String
    var commit: CommitDetail
    
    enum CodingKeys: String, CodingKey {
        case nodeId = "node_id", commit
    }
    
    struct CommitDetail: Codable {
        var author: Author
        var message: String
        
        struct Author: Codable {
            var name: String
            var date: Date
        }
    }
}
