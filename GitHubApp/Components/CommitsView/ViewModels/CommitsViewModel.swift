//
//  Created by Bojan on 28.4.24.
//

import Foundation

/// ViewModel for handling the commits.
class CommitsViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var commits: [Commit] = []
    @Published var error: Error?
    
    func getCommits(for user: String, repository: String) {
        isLoading = true
        
        Service<[Commit]>().makeRequest(endpoint: Endpoint.getCommits(for: user, repository: repository)).request { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading = false
            
            switch result {
            case .success(let commits):
                self.commits = commits.sorted { $0.commit.author.date > $1.commit.author.date }
                
                self.error = nil
            case .failure(let error):
                self.error = error
            }
        }
    }
}
