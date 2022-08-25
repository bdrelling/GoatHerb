// Copyright © 2022 Brian Drelling. All rights reserved.

import GoatHerb
import XCTest

final class GetRepositoriesRequestTests: BaseTestCase, RepositoryValidating {
    /// Ensures that a call to <https://api.github.com/users/bdrelling/repos> succeeds.
    func testUserRepositoriesRequestSucceeds() async throws {
        let repositories = try await self.gitHub.getRepositories(user: "bdrelling")
        try self.validate(repositories)
    }

    /// Ensures that a call to <https://api.github.com/orgs/swift-kipple/repos> succeeds.
    func testOrganizationRepositoriesRequestSucceeds() async throws {
        let repositories = try await self.gitHub.getRepositories(org: "swift-kipple")
        try self.validate(repositories)
    }
}
