//
//  Created by Bojan on 28.4.24.
//

import SwiftUI

/// A view for displaying list of commits for a GitHub user and a GitHub repository.
struct CommitsView: View {
    @StateObject private var viewModel = CommitsViewModel()
    
    var user: String
    var repository: String
    
    var body: some View {
        LoadingView(isLoading: $viewModel.isLoading) {
            List(viewModel.commits) { commit in
                commitView(for: commit)
            }
            .listStyle(PlainListStyle())
        }
        .onAppear {
            viewModel.getCommits(for: user, repository: repository)
        }
        .navigationTitle("commits.title".localized)
    }
    
    @ViewBuilder
    func commitView(for commit: Commit) -> some View {
        VStack(alignment: .leading) {
            Text(commit.commit.author.date.string(dateStyle: .medium, timeStyle: .medium))
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(commit.commit.message)
                .font(.headline)
            
            Text(commit.commit.author.name)
                .font(.subheadline)
        }
        .frame(minHeight: 44)
    }
}
