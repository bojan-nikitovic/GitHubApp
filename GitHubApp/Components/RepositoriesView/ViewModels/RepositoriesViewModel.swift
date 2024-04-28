//
//  Created by Bojan on 28.4.24.
//

import Foundation

/// ViewModel for handling the repositories.
class RepositoriesViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var repositories: [Repository] = []
    @Published var error: Error?
    
    func getRepositories(for user: String) {
        isLoading = true
        
        Service<[Repository]>().makeRequest(endpoint: Endpoint.getRepositories(for: user)).request { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading = false
            
            switch result {
            case .success(let repositories):
                self.repositories = repositories
                
                self.error = nil
            case .failure(let error):
                self.error = error
            }
        }
    }
}
