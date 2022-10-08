//
//  RepositoryVM.swift
//  stargazers
//
//  Created by PieroAdmin on 03/10/22.
//

import Foundation
import SwiftUI

@MainActor
class RepositoryVM: ObservableObject {
    @Published var repositories:[RepositoryViewModel] = []
    let net = NetworkManager()
    
    func searchRepo(for name: String) async {
        do {
            let repos = try await net.searchRepository(name)
            repositories = repos.map(RepositoryViewModel.init)
        } catch {
            print("Errore \(error)")
        }
    }
    
}

struct RepositoryViewModel: Identifiable {
    
    private var repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    var id: Int {
        repository.id
    }
    
    var name: String {
        repository.name
    }
    /// Repository fullName, means ownerName/repositoryName
    var fullName: String {
        repository.fullName
    }
    /// Repository owner
    var owner: Owner {
        repository.owner
    }
    /// Repository description
    var desc: String? {
        repository.desc
    }
    /// number of stargazers
    var stars: Int {
        repository.stars
    }
    /// Repository language
    var language: String? {
        repository.language
    }

}

extension RepositoryViewModel {
    static let preview = RepositoryViewModel(repository: .preview)
    static let preview1 = RepositoryViewModel(repository: .preview1)
}
