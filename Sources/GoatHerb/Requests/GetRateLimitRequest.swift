// Copyright © 2022 Brian Drelling. All rights reserved.

import Foundation

// Copyright © 2022 Brian Drelling. All rights reserved.

import KippleNetworking

/// Gets the rate limit for the currently authenticated user.
///
/// For an example request, see <https://api.github.com/rate_limit>.
public struct GetRateLimitRequest: Request, ResponseAnticipating {
    public typealias Response = RateLimit

    public let path = "/rate-limit"

    public init() {}
}

// MARK: - Extensions

public extension GitHub {
    func getRateLimit() async throws -> GetRateLimitRequest.Response {
        try await self.request(GetRateLimitRequest())
    }
}
