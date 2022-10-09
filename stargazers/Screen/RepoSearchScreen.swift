//
//  RepoSearchScreen.swift
//  stargazers
//
//  Created by PieroAdmin on 04/10/22.
//

import SwiftUI

struct RepoSearchScreen: View {
    @EnvironmentObject var n: RepositoryVM
    @State private var searchString = ""
    
    var body: some View {
        NavigationView {
            
            VStack {
                SearchBarView(placeholder: "Search for repository", searchText: $searchString)
                    .onSubmit {
                        Task {
                            await n.searchRepo(for: searchString)
                        }
                    }
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        ForEach(n.repositories, id: \.id) { repo in
                            NavigationLink(destination: {
                                StargazersLisScreen(repository: repo)
                            }, label: {
                                RepoCardView(repository: repo)
                            })
                                
                        }
                    }
                    .padding()
                }
                .navigationTitle("Repositories")
            }
            WelcomeView()
        }
    }
}

struct RepoSearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        RepoSearchScreen()
            .environmentObject(RepositoryVM())
    }
}
