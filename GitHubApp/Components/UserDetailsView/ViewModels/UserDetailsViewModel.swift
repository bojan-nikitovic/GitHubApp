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
        self.user = User(id: 0, login: "bojan-nikitovic", company: "Company Name")
    }
}
