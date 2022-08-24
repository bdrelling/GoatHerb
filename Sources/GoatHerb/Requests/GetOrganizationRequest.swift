// Copyright © 2022 Brian Drelling. All rights reserved.

import KippleNetworking

public struct GetOrganizationRequest: Request, ResponseAnticipating {
    public typealias Response = Organization
    
    public let path: String

    public init(organization: String) {
        self.path = "/orgs/\(organization)"
    }
}

// MARK: - Extensions

public extension GitHub {
    func getOrganization(_ organization: String) async throws -> GetOrganizationRequest.Response {
        try await self.request(GetOrganizationRequest(organization: organization))
    }
}
