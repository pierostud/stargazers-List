//
//  Stargazer.swift
//  stargazers
//
//  Created by PieroAdmin on 05/10/22.
//

import Foundation

/// Model to decode startgazer object from network response
struct Stargazer: Codable, Identifiable {
    /// stargazer username
    let login: String
    /// stargazer id
    let id: Int
    private let avatar: String?
    /// stargazer github page
    let htmlUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case avatar = "avatar_url"
        case htmlUrl = "html_url"
    }
}

extension Stargazer {
    /// The URL of stargazer image
    var avatarUrl: URL? {
        if let avatar = avatar {
            return URL(string: avatar)
        }
        return nil
    }
}

extension Stargazer {
    static let preview = Stargazer(login: "zapletnev", id: 1358172, avatar: "https://avatars.githubusercontent.com/u/1358172?v=4", htmlUrl: nil)
}
