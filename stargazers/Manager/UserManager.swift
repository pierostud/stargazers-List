//
//  UserManager.swift
//  stargazers
//
//  Created by PieroAdmin on 07/10/22.
//

import Foundation
import SwiftUI

struct UserManager {
    static let userKey = "user"
    let userDefault: UserDefaults
    
    var current: User? {
        if let jsonData = userDefault.data(forKey: UserManager.userKey) {
            if let user = try? JSONDecoder().decode(User.self, from: jsonData) {
                return user
            }
        }
        return nil
    }
    
    var isLoggedIn: Bool {
        return (current?.username != nil && current?.password != nil )
    }
    
    func save(_ user: User) {
        if let jsonData = try? JSONEncoder().encode(user) {
            userDefault.set(jsonData, forKey: UserManager.userKey)
        }
    }
}

extension UserManager {
    init(_ userDefault: UserDefaults = .standard) {
        self.userDefault = userDefault
    }
}
