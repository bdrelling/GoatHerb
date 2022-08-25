// Copyright © 2022 Brian Drelling. All rights reserved.

import GoatHerb
import XCTest

final class GetUserRequestTests: BaseTestCase {
    /// Ensures that a call to <https://api.github.com/users/bdrelling> succeeds.
    func testRequestSucceeds() async throws {
        let user = try await self.gitHub.getUser("bdrelling")

        XCTAssertEqual(user.apiURL, "https://api.github.com/users/bdrelling")
        XCTAssertEqual(user.avatarURL, "https://avatars.githubusercontent.com/u/3022693?v=4")
        XCTAssertEqual(user.bio, "I make apps, games, and music. The trick is never sleeping. He/Him.")
        XCTAssertEqual(user.company, nil)
        XCTAssertEqual(user.email, nil)
        XCTAssertEqual(user.eventsURL, "https://api.github.com/users/bdrelling/events{/privacy}")
        XCTAssertEqual(user.followersURL, "https://api.github.com/users/bdrelling/followers")
        XCTAssertEqual(user.followingURL, "https://api.github.com/users/bdrelling/following{/other_user}")
        XCTAssertEqual(user.gistsURL, "https://api.github.com/users/bdrelling/gists{/gist_id}")
        XCTAssertEqual(user.gravatarID, "")
        XCTAssertEqual(user.htmlURL, "https://github.com/bdrelling")
        XCTAssertEqual(user.id, 3022693)
        XCTAssertEqual(user.isHireable, nil)
        XCTAssertEqual(user.isSiteAdmin, false)
        XCTAssertEqual(user.location, "Chicago, IL")
        XCTAssertEqual(user.name, "Brian Drelling")
        XCTAssertEqual(user.nodeID, "MDQ6VXNlcjMwMjI2OTM=")
        XCTAssertEqual(user.organizationsURL, "https://api.github.com/users/bdrelling/orgs")
        XCTAssertEqual(user.receivedEventsURL, "https://api.github.com/users/bdrelling/received_events")
        XCTAssertEqual(user.repositoriesURL, "https://api.github.com/users/bdrelling/repos")
        XCTAssertEqual(user.starredURL, "https://api.github.com/users/bdrelling/starred{/owner}{/repo}")
        XCTAssertEqual(user.subscriptionsURL, "https://api.github.com/users/bdrelling/subscriptions")
        XCTAssertEqual(user.twitterUsername, "bdrelling")
        XCTAssertEqual(user.type, .user)
        XCTAssertEqual(user.username, "bdrelling")
        XCTAssertEqual(user.websiteURL, "https://briandrelling.com")

        // We will always know our exact create date.
        let createDate = try XCTUnwrap(Date(year: 2012, month: 12, day: 12, hour: 6, minute: 22, second: 27, timeZone: "GMT"))
        XCTAssertEqual(user.createDate, createDate)

        // These properties are too variable, but we can at least evaluate the type.
        XCTAssertGreaterThan(user.numberOfFollowers, 0)
        XCTAssertGreaterThan(user.numberOfPublicGists, 0)
        XCTAssertGreaterThan(user.numberOfPublicRepositories, 0)
        XCTAssertGreaterThan(user.numberOfUsersFollowed, 0)

        // Our update date will also change too often, so instead just compare it with a
        // minimum date to ensure no error has occurred in parsing or fething.
        let minimumUpdateDate = try XCTUnwrap(Date(year: 2022, month: 8, day: 1, timeZone: "GMT"))
        XCTAssertGreaterThan(user.updateDate, minimumUpdateDate)
    }
}
