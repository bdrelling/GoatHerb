// Copyright © 2022 Brian Drelling. All rights reserved.

import KippleNetworking

/// Fetches a GitHub repository.
///
/// For example requests, see:
///   - <https://api.github.com/repos/bdrelling/GoatHerb>
///   - <https://api.github.com/repos/swift-kipple/Networking>
public struct GetRepositoryRequest: Request, ResponseAnticipating {
    public typealias Response = Repository
    
    public let path: String
    
    public init(name: String) {
        self.path = "/repos/\(name)"
    }
}

// MARK: - Extensions

public extension GitHub {
    func getRepository(name: String) async throws -> GetRepositoryRequest.Response {
        try await self.request(GetRepositoryRequest(name: name))
    }
}
