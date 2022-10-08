//
//  RepoListView.swift
//  stargazers
//
//  Created by PieroAdmin on 04/10/22.
//

import SwiftUI

struct RepoListView: View {
    @State var repos: [RepositoryViewModel] = []
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                ForEach(repos, id: \.id) { repo in
                        RepoCardView(repository: repo)
                        .shadow(radius: 10)
                }
            }
            .padding()
        }
    }
}

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView(repos: [.preview, .preview1])
    }
}
