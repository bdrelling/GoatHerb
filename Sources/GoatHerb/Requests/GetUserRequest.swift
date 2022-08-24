// Copyright © 2022 Brian Drelling. All rights reserved.

import KippleNetworking

/// Fetches a GitHub user.
///
/// For an example request, see <https://api.github.com/users/bdrelling>.
public struct GetUserRequest: Request, ResponseAnticipating {
    public typealias Response = User
    
    public let path: String

    public init(user username: String) {
        self.path = "/users/\(username)"
    }
}

// MARK: - Extensions

public extension GitHub {
    func getUser(_ username: String) async throws -> GetUserRequest.Response {
        try await self.request(GetUserRequest(user: username))
    }
}
