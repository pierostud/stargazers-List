//
//  stargazersApp.swift
//  stargazers
//
//  Created by PieroAdmin on 03/10/22.
//

import SwiftUI
import netfox

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        NFX.sharedInstance().start()
        return true
    }
}

@main
struct StargazersApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject private var repositoryVM = RepositoryVM()
    
    var body: some Scene {
        WindowGroup {
            RepoSearchScreen()
                .environmentObject(repositoryVM)
        }
    }
}
