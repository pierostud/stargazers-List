//
//  ContentView.swift
//  stargazers
//
//  Created by PieroAdmin on 03/10/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var n: RepositoryVM
    @State private var searchString = ""
     
    var body: some View {
        NavigationView {
            
            VStack {
                TextField("Search for repository", text: $searchString)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .onSubmit {
                        Task {
                            await n.searchRepo(for: searchString)
                        }
                    }
                    .navigationTitle("Repositories")
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        ForEach(n.repositories, id: \.id) { repo in
                                RepoCardView(repository: repo)
                                .shadow(radius: 10)
                                .padding(.vertical, 6)
                        }
                    }
                    .padding()
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
