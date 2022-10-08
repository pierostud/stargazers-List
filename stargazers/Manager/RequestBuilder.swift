//
//  RequestBuilder.swift
//  stargazers
//
//  Created by PieroAdmin on 05/10/22.
//

import Foundation

/// Used by NetworkManager in order to create network request
class RequestBuilder {
    /// the URL for network request
    public var url: URL? {
        if let url = urlComps.url {
            return url
        }
        return nil
    }
    
    /// The request
    public var request: URLRequest? {
        var request = URLRequest(url: self.urlComps.url!)
        if isAuthRequest {
            request.addValue(makeAuthorizationString(), forHTTPHeaderField: "Authorization")
        }
        return request
    }
    
    private var urlComps: URLComponents
    private var path: String
    private var queryItems = [URLQueryItem]()
    private var isPathParametersAdded = false
    private var isAuthRequest = false
    
    /// The RequestBuilder class is used to create network URLRequest
    /// - Parameter path: network endpoint
    required init(_ path: String) {
        self.path = path
        self.urlComps = URLComponents()
        self.urlComps.scheme = "https"
        self.urlComps.host = Costant.serverAddress
        self.urlComps.path = self.path
    }
    
    /// If needed this func can add a basic auth (username and password)
    /// in request
    public func addAuth() {
        isAuthRequest = true
    }
    
    /// Add one query item
    /// - Parameters:
    ///   - n: query name
    ///   - v: query value
    public func addQuery(name n: String, value v: String) {
        self.queryItems.append(URLQueryItem(name: n, value: v))
    }
    
    /// Add a variadic number of parameters to a endpoint path.
    /// The original path must follow a specific sintax where $$ is
    /// the parameter to add
    /// - Parameter parameters: a list of string parameters
    public func addPathParameters(_ parameters: String...) {
        let substr = path.split(separator: "$$")
        if substr.isEmpty == false, parameters.count != (substr.count - 1) {
            return
        }
        
        let str = parameters.enumerated().reduce(substr[0]) { (accumulate, current) in
            return accumulate + (current.1 + substr[current.0 + 1])
        }
        path = String(str)
        isPathParametersAdded = true
    }
    
    
    /// Make the request
    /// - Returns: the reuest builded
    public func buildRequest() -> URLRequest? {
        if queryItems.isEmpty == false {
            urlComps.queryItems = queryItems
        }
        urlComps.path = self.path
        let substr = path.split(separator: "$$")
        if substr.count > 1 && isPathParametersAdded == false {
            return nil
        }

        return self.request
    }
    
    private func makeAuthorizationString() -> String {
        let userManager = UserManager()
        guard let user = userManager.current else { return "" }
        let username = user.username
        let password = user.password
        
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        return "Basic \(base64LoginString)"
    }
    
}

