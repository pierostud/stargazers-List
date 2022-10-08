//
//  Owner.swift
//  stargazers
//
//  Created by PieroAdmin on 04/10/22.
//

import Foundation

struct Owner: Codable {
    /// owner username of repository
    var login: String
    /// url of owner image
    var avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatarUrl = "avatar_url"
    }
}

extension Owner {
    static let preview = Owner(login: "chvin", avatarUrl: "https://avatars.githubusercontent.com/u/5383506?v=4")
}
