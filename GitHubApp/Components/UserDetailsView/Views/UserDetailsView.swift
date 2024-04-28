//
//  Created by Bojan on 28.4.24.
//

import SwiftUI

/// A view for displaying detailed information about a GitHub user.
struct UserDetailsView: View {
    @StateObject private var viewModel = UserDetailsViewModel()
    
    var body: some View {
        LoadingView(isLoading: $viewModel.isLoading) {
            Unwrap(viewModel.user) { user in
                NavigationLink(destination: RepositoriesView(username: user.login)) {
                    userDetailsView(for: user)
                }
            }
        }
        .onAppear {
            viewModel.getUserDetails(for: USERNAME)
        }
        .navigationTitle("user_details.title".localized)
    }
    
    @ViewBuilder
    func userDetailsView(for user: User) -> some View {
        VStack(alignment: .center) {
            Unwrap(user.avatarUrl) { avatarUrl in
                ImageView(url: avatarUrl)
                    .frame(width: 100, height: 100)
            }
            
            Unwrap(user.name ?? user.login) { name in
                Text(name)
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.black)
            }
            
            Unwrap(user.company) { company in
                Text(company)
                    .font(.headline)
                    .foregroundStyle(Color.black)
            }
        }
        .padding()
        .border(Color.black, width: 1)
    }
}
