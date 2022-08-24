// Copyright © 2022 Brian Drelling. All rights reserved.

@testable import GoatHerb
import XCTest

final class GetOrganizationRequestTests: BaseTestCase {
    func testRequestSucceeds() async throws {
        let request = GetOrganizationRequest(organization: "swift-kipple")
        let response = try await self.client.response(for: request)

        XCTAssertEqual(response.apiURL, "https://api.github.com/orgs/swift-kipple")
        XCTAssertEqual(response.avatarURL, "https://avatars.githubusercontent.com/u/108965235?v=4")
        XCTAssertEqual(response.company, nil)
        XCTAssertEqual(response.description, "Kipple is a collection of Swift packages and plugins providing common Swift functionality for getting your projects off the ground.")
        XCTAssertEqual(response.email, nil)
        XCTAssertEqual(response.eventsURL, "https://api.github.com/orgs/swift-kipple/events")
        XCTAssertEqual(response.hasOrganizationProjects, true)
        XCTAssertEqual(response.hasRepositoryProjects, false)
        XCTAssertEqual(response.hooksURL, "https://api.github.com/orgs/swift-kipple/hooks")
        XCTAssertEqual(response.htmlURL, "https://github.com/swift-kipple")
        XCTAssertEqual(response.issuesURL, "https://api.github.com/orgs/swift-kipple/issues")
        XCTAssertEqual(response.id, 108965235)
        XCTAssertEqual(response.isVerified, false)
        XCTAssertEqual(response.location, nil)
        XCTAssertEqual(response.name, "Kipple")
        XCTAssertEqual(response.nodeID, "O_kgDOBn6tcw")
        
        XCTAssertEqual(response.publicMembersURL, "https://api.github.com/orgs/swift-kipple/public_members{/member}")
        XCTAssertEqual(response.repositoriesURL, "https://api.github.com/orgs/swift-kipple/repos")
        XCTAssertEqual(response.slug, "swift-kipple")
        XCTAssertEqual(response.twitterUsername, "bdrelling")
        XCTAssertEqual(response.type, "Organization")
        XCTAssertEqual(response.websiteURL, "https://briandrelling.com")
        
        // We will always know our exact create date.
        
        let createDate = try XCTUnwrap(Date(year: 2022, month: 7, day: 9, hour: 2, minute: 23, second: 32, timeZone: "GMT"))
        XCTAssertEqual(response.createDate, createDate)
        
        // These properties are too variable, but they will never be zero or nil.
        XCTAssertEqual(response.numberOfFollowers, 0)
        XCTAssertEqual(response.numberOfPublicGists, 0)
        XCTAssertGreaterThan(response.numberOfPublicRepositories, 0)
        XCTAssertEqual(response.numberOfUsersFollowed, 0)
        
        // Our update date will also change too often, so instead just compare it with a
        // minimum date to ensure no error has occurred in parsing or fething.
        let minimumUpdateDate = try XCTUnwrap(Date(year: 2022, month: 08, day: 01, timeZone: "GMT"))
        XCTAssertNotNil(response.updateDate)
        XCTAssertGreaterThan(response.updateDate, minimumUpdateDate)
    }
}
