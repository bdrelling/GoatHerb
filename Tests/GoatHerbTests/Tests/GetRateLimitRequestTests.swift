// Copyright © 2022 Brian Drelling. All rights reserved.

import GoatHerb
import XCTest

final class GetRateLimitRequestTests: BaseTestCase {
    /// Ensures that an _authenticated_ call to <https://api.github.com/rate_limit> succeeds.
    func testAuthenticatedRequestSucceeds() async throws {
        // Skip this test if the access token is not detected.
        try XCTSkipIf(!self.gitHub.hasAccessToken)
        
        let rateLimit = try await self.gitHub.getRateLimit()

        // Ensure the number of resources haven't changed.
        XCTAssertEqual(rateLimit.resources.count, 9)
        
        // Double-check the allowances for "core", which also shouldn't change often.
        XCTAssertEqual(rateLimit.rate.limit, 5000)
    }
    
    /// Ensures that an _unauthenticated_ call to <https://api.github.com/rate_limit> succeeds.
    func testUnauthenticatedRequestSucceeds() async throws {
        let rateLimit = try await self.gitHubUnauthenticated.getRateLimit()

        // Ensure the number of resources haven't changed.
        XCTAssertEqual(rateLimit.resources.count, 4)
        
        // Double-check the allowances for "core", which also shouldn't change often.
        XCTAssertEqual(rateLimit.rate.limit, 60)
    }
}
