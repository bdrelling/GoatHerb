// Copyright © 2022 Brian Drelling. All rights reserved.

import KippleNetworking

/// Fetches GitHub repositories for a `User` or `Organization`.
///
/// For example requests, see:
///   - <https://api.github.com/users/bdrelling/repos>
///   - <https://api.github.com/orgs/swift-kipple/repos>
public struct GetRepositoriesRequest: Request, ResponseAnticipating {
    public typealias Response = [Repository]
    
    public let path: String
    
    public init(org organization: String) {
        self.path = "/orgs/\(organization)/repos"
    }
    
    public init(user username: String) {
        self.path = "/users/\(username)/repos"
    }
}

// MARK: - Extensions

public extension GitHub {
    func getRepositories(org organization: String) async throws -> GetRepositoriesRequest.Response {
        try await self.request(GetRepositoriesRequest(org: organization))
    }
    
    func getRepositories(user username: String) async throws -> GetRepositoriesRequest.Response {
        try await self.request(GetRepositoriesRequest(user: username))
    }
}
