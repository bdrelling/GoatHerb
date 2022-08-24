// Copyright © 2022 Brian Drelling. All rights reserved.

@testable import GoatHerb
import XCTest

final class GetUserRequestTests: BaseTestCase {
    func testRequestSucceeds() async throws {
        let request = GetUserRequest(username: "bdrelling")
        let response = try await self.client.response(for: request)

        XCTAssertEqual(response.username, "bdrelling")
        XCTAssertEqual(response.id, 3022693)
        XCTAssertEqual(response.nodeID, "MDQ6VXNlcjMwMjI2OTM=")
        XCTAssertEqual(response.avatarURL, "https://avatars.githubusercontent.com/u/3022693?v=4")
        XCTAssertEqual(response.gravatarID, "")
        XCTAssertEqual(response.apiURL, "https://api.github.com/users/bdrelling")
        XCTAssertEqual(response.htmlURL, "https://github.com/bdrelling")
        XCTAssertEqual(response.followersURL, "https://api.github.com/users/bdrelling/followers")
        XCTAssertEqual(response.followersURL, "https://api.github.com/users/bdrelling/followers")
        XCTAssertEqual(response.followingURL, "https://api.github.com/users/bdrelling/following{/other_user}")
        XCTAssertEqual(response.gistsURL, "https://api.github.com/users/bdrelling/gists{/gist_id}")
        XCTAssertEqual(response.starredURL, "https://api.github.com/users/bdrelling/starred{/owner}{/repo}")
        XCTAssertEqual(response.subscriptionsURL, "https://api.github.com/users/bdrelling/subscriptions")
        XCTAssertEqual(response.organizationsURL, "https://api.github.com/users/bdrelling/orgs")
        XCTAssertEqual(response.repositoriesURL, "https://api.github.com/users/bdrelling/repos")
        XCTAssertEqual(response.eventsURL, "https://api.github.com/users/bdrelling/events{/privacy}")
        XCTAssertEqual(response.receivedEventsURL, "https://api.github.com/users/bdrelling/received_events")
        XCTAssertEqual(response.type, "User")
        XCTAssertEqual(response.isSiteAdmin, false)
        XCTAssertEqual(response.name, "Brian Drelling")
        XCTAssertEqual(response.company, nil)
        XCTAssertEqual(response.websiteURL, "briandrelling.com")
        XCTAssertEqual(response.location, "Chicago, IL")
        XCTAssertEqual(response.email, nil)
        XCTAssertEqual(response.isHireable, nil)
        XCTAssertEqual(response.bio, "I make apps, games, and music. The trick is never sleeping. He/Him.")
        XCTAssertEqual(response.twitterUsername, "bdrelling")
        
        // We will always know our exact create date.
        
        let createDate = try XCTUnwrap(Date(year: 2012, month: 12, day: 12, hour: 6, minute: 22, second: 27, timeZone: "GMT"))
        XCTAssertEqual(response.createDate, createDate)
        
        // These properties are too variable, but they will never be zero or nil.
        XCTAssertGreaterThan(response.numberOfPublicRepositories, 0)
        XCTAssertGreaterThan(response.numberOfPublicGists, 0)
        XCTAssertGreaterThan(response.numberOfFollowers, 0)
        XCTAssertGreaterThan(response.numberOfUsersFollowed, 0)
        
        // Our update date will also change too often, so instead just compare it with a
        // minimum date to ensure no error has occurred in parsing or fething.
        let minimumUpdateDate = try XCTUnwrap(Date(year: 2022, month: 08, day: 01, timeZone: "GMT"))
        XCTAssertNotNil(response.updateDate)
        XCTAssertGreaterThan(response.updateDate, minimumUpdateDate)
    }
}
