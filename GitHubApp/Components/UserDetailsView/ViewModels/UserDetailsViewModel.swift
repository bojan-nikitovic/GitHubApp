//
//  Created by Bojan on 28.4.24.
//

import Foundation

/// ViewModel for handling the user details.
class UserDetailsViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var user: User?
    @Published var error: Error?
    
    func getUserDetails(for user: String) {
        isLoading = true
        
        Service<User>().makeRequest(endpoint: Endpoint.getUserDetails(for: user)).request { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading = false
            
            switch result {
            case .success(let user):
                self.user = user
                
                self.error = nil
            case .failure(let error):
                self.error = error
            }
        }
    }
}
