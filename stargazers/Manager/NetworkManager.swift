//
//  NetworkManager.swift
//  stargazers
//
//  Created by PieroAdmin on 03/10/22.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case badRequest
    case notLoggedIn
    case decodingError
}



/// Manager for all network calls
class NetworkManager: ObservableObject {
    
    
    /// Get the list of repository found for specified name
    /// - Parameter repoName: the search string
    /// - Returns: list of repositories found
    func searchRepository(_ repoName: String) async throws -> [Repository] {
        
        let requestBuilder = RequestBuilder(Costant.searchRepository)
        requestBuilder.addQuery(name: "q", value: repoName)
        requestBuilder.addQuery(name: "sort", value: "stars")
        guard let request = requestBuilder.buildRequest() else {
            throw NetworkError.badRequest
        }
        let (data, httpResponse) = try await URLSession.shared.data(for: request)
        guard let httpResponse = httpResponse as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }

        guard let response = try? JSONDecoder().decode(EnvelopResponse<Repository>.self, from: data) else {
            throw NetworkError.decodingError
        }
        return response.items
    }
    
    /// Get the list of stargazers found for specified repository
    /// - Parameters:
    ///   - repo: repository name
    ///   - owner: repository owner
    /// - Returns: list of stargazer 
    func getStargazer(forRepo repo: String, ownedBy owner: Owner) async throws -> [Stargazer] {
        let requestBuilder = RequestBuilder(Costant.getStargazers)
        requestBuilder.addPathParameters(owner.login, repo)
        guard let request = requestBuilder.buildRequest() else {
            throw NetworkError.badRequest
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        guard let stargazers = try? JSONDecoder().decode([Stargazer].self, from: data) else {
            throw NetworkError.decodingError
        }
        return stargazers
    }
    
}

