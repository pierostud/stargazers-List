//
//  StargazersLisScreen.swift
//  stargazers
//
//  Created by PieroAdmin on 05/10/22.
//

import SwiftUI

struct StargazersLisScreen: View {
    @StateObject var vm = StargazersVM()
    var repository: RepositoryViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Stargazers list")
                    .font(.headline)
                Spacer()
            }.padding()
            
            ScrollView(.vertical) {
                VStack {
                    ForEach(vm.stargazers, id: \.id) { s in
                        StargazerCardView(stargazer: s)
                    }
                }
            }
            .navigationTitle("\(repository.name)")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await vm.getStargares(for: repository)
        }
        }
    }
}

struct StargazersLisScreen_Previews: PreviewProvider {
    static var previews: some View {
        StargazersLisScreen(repository: .preview)
    }
}
