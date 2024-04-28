//
//  Created by Bojan on 28.4.24.
//

import SwiftUI

/// A view for displaying list of repositories for a GitHub user.
struct RepositoriesView: View {
    @StateObject private var viewModel = RepositoriesViewModel()
    
    var username: String
    
    var body: some View {
        LoadingView(isLoading: $viewModel.isLoading) {
            List(viewModel.repositories) { repository in
                NavigationLink(destination: CommitsView(user: username, repository: repository.name)) {
                    repositoryView(for: repository)
                }
            }
            .listStyle(PlainListStyle())
        }
        .onAppear {
            viewModel.getRepositories(for: username)
        }
        .navigationTitle("repositories.title".localized)
    }
    
    @ViewBuilder
    func repositoryView(for repository: Repository) -> some View {
        VStack(alignment: .leading) {
            Text(repository.name)
                .font(.headline)
            
            Unwrap(repository.description) { description in
                Text(description)
                    .font(.subheadline)
            }
        }
        .frame(minHeight: 44)
    }
}
