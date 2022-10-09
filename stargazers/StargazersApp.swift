//
//  stargazersApp.swift
//  stargazers
//
//  Created by PieroAdmin on 03/10/22.
//

import SwiftUI


@main
struct StargazersApp: App {
    @ObservedObject private var repositoryVM = RepositoryVM()
    
    var body: some Scene {
        WindowGroup {
            RepoSearchScreen()
                .environmentObject(repositoryVM)
        }
    }
}
