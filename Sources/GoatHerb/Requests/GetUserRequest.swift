// Copyright © 2022 Brian Drelling. All rights reserved.

import KippleNetworking

public struct GetUserRequest: Request, ResponseAnticipating {
    public typealias Response = User
    
    public let path: String

    public init(username: String) {
        self.path = "/users/\(username)"
    }
}

// MARK: - Extensions

public extension GitHub {
    func getUser(_ username: String) async throws -> GetUserRequest.Response {
        try await self.request(GetUserRequest(username: username))
    }
}
