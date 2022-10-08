//
//  StargazersVM.swift
//  stargazers
//
//  Created by PieroAdmin on 05/10/22.
//

import Foundation
import SwiftUI

@MainActor
class StargazersVM: ObservableObject {
    @Published var stargazers:[StargazerViewModel] = []
    let net = NetworkManager()
    
    func getStargares(for repo: RepositoryViewModel) async {
        do {
            let stargazers = try await net.getStargazer(forRepo: repo.name, ownedBy: repo.owner)
            self.stargazers = stargazers.map(StargazerViewModel.init)
        } catch {
            print("Errore \(error)")
        }
    }
}

struct StargazerViewModel: Identifiable {
    
    private var stargazer: Stargazer
    
    init(stargazer: Stargazer) {
        self.stargazer = stargazer
    }
    
    var login: String {
        stargazer.login
    }
    var id: Int {
        stargazer.id
    }
    
    var avatarUrl: URL? {
        stargazer.avatarUrl
    }
    
    var htmlUrl: String? {
        stargazer.htmlUrl
    }

}

extension StargazerViewModel {
    static let preview = StargazerViewModel(stargazer: .preview)
}
