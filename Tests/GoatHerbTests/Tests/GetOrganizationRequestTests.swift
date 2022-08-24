// Copyright © 2022 Brian Drelling. All rights reserved.

import GoatHerb
import XCTest

final class GetOrganizationRequestTests: BaseTestCase {
    /// Ensures that a call to <https://api.github.com/orgs/swift-kipple> succeeds.
    func testRequestSucceeds() async throws {
        let organization = try await self.gitHub.getOrganization("swift-kipple")

        XCTAssertEqual(organization.apiURL, "https://api.github.com/orgs/swift-kipple")
        XCTAssertEqual(organization.avatarURL, "https://avatars.githubusercontent.com/u/108965235?v=4")
        XCTAssertEqual(organization.company, nil)
        XCTAssertEqual(organization.description, "Kipple is a collection of Swift packages and plugins providing common Swift functionality for getting your projects off the ground.")
        XCTAssertEqual(organization.email, nil)
        XCTAssertEqual(organization.eventsURL, "https://api.github.com/orgs/swift-kipple/events")
        XCTAssertEqual(organization.hasOrganizationProjects, true)
        XCTAssertEqual(organization.hasRepositoryProjects, false)
        XCTAssertEqual(organization.hooksURL, "https://api.github.com/orgs/swift-kipple/hooks")
        XCTAssertEqual(organization.htmlURL, "https://github.com/swift-kipple")
        XCTAssertEqual(organization.id, 108965235)
        XCTAssertEqual(organization.issuesURL, "https://api.github.com/orgs/swift-kipple/issues")
        XCTAssertEqual(organization.isVerified, false)
        XCTAssertEqual(organization.location, nil)
        XCTAssertEqual(organization.name, "Kipple")
        XCTAssertEqual(organization.nodeID, "O_kgDOBn6tcw")
        XCTAssertEqual(organization.publicMembersURL, "https://api.github.com/orgs/swift-kipple/public_members{/member}")
        XCTAssertEqual(organization.repositoriesURL, "https://api.github.com/orgs/swift-kipple/repos")
        XCTAssertEqual(organization.slug, "swift-kipple")
        XCTAssertEqual(organization.twitterUsername, "bdrelling")
        XCTAssertEqual(organization.type, .organization)
        XCTAssertEqual(organization.websiteURL, "https://briandrelling.com")
        
        // We will always know our exact create date.
        
        let createDate = try XCTUnwrap(Date(year: 2022, month: 7, day: 9, hour: 2, minute: 23, second: 32, timeZone: "GMT"))
        XCTAssertEqual(organization.createDate, createDate)
        
        // These properties are too variable, but we can at least evaluate the type.
        XCTAssertGreaterThanOrEqual(organization.numberOfFollowers, 0)
        XCTAssertGreaterThanOrEqual(organization.numberOfPublicGists, 0)
        XCTAssertGreaterThanOrEqual(organization.numberOfPublicRepositories, 0)
        XCTAssertGreaterThanOrEqual(organization.numberOfUsersFollowed, 0)
        
        // Our update date will also change too often, so instead just compare it with a
        // minimum date to ensure no error has occurred in parsing or fething.
        let minimumUpdateDate = try XCTUnwrap(Date(year: 2022, month: 8, day: 1, timeZone: "GMT"))
        XCTAssertGreaterThan(organization.updateDate, minimumUpdateDate)
    }
}
