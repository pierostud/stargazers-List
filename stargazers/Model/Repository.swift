//
//  Repository.swift
//  stargazers
//
//  Created by PieroAdmin on 04/10/22.
//

import Foundation

struct EnvelopResponse<T: Codable>: Codable {
    var items: [T]
}

struct Repository: Codable, Identifiable {
    /// Repository id
    var id: Int
    /// Repository name
    var name: String
    /// Repository fullName, means ownerName/repositoryName
    var fullName: String
    /// Repository owner
    var owner: Owner
    /// Repository description
    var desc: String?
    /// number of stargazers
    var stars: Int
    /// Repository language
    var language: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case fullName = "full_name"
        case owner = "owner"
        case desc = "description"
        case stars = "stargazers_count"
        case language = "language"
    }
}

extension Repository {
    static let preview = Repository(id: 76954504,
                                    name: "react-tetris",
                                    fullName: "chvin/react-tetris",
                                    owner: .preview,
                                    desc: "Use React, Redux, Immutable to code Tetris. 🎮",
                                    stars: 1920,
                                    language: "C++")
    
    static let preview1 = Repository(id: 7695404,
                                    name: "react-tetris",
                                    fullName: "taylor/tinytetris",
                                    owner: .preview,
                                    desc: "80x23 terminal tetris",
                                    stars: 1920,
                                    language: "C++")
}
