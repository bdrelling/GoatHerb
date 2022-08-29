// Copyright © 2022 Brian Drelling. All rights reserved.

import GoatHerb
import XCTest

final class GetRateLimitRequestTests: BaseTestCase {
    /// Ensures that a call to <https://api.github.com/rate_limit> succeeds.
    func testRequestSucceeds() async throws {
        let rateLimit = try await self.gitHub.getRateLimit()

        XCTAssertEqual(rateLimit.rate.resource, "core")
        XCTAssertEqual(rateLimit.rate.limit, 60)

        XCTAssertEqual(rateLimit.resources.count, 4)
    }
}
