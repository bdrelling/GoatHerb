// Copyright © 2022 Brian Drelling. All rights reserved.

import KippleNetworking

/// Fetches a GitHub organization..
///
/// For an example request, see <https://api.github.com/orgs/swift-kipple>.
public struct GetOrganizationRequest: Request, ResponseAnticipating {
    public typealias Response = Organization
    
    public let path: String

    public init(org organization: String) {
        self.path = "/orgs/\(organization)"
    }
}

// MARK: - Extensions

public extension GitHub {
    func getOrganization(_ organization: String) async throws -> GetOrganizationRequest.Response {
        try await self.request(GetOrganizationRequest(org: organization))
    }
}
