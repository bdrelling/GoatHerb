// Copyright © 2022 Brian Drelling. All rights reserved.

import Foundation

/// Represents a GitHub user.
///
/// For an example request, see <https://api.github.com/users/bdrelling>.
public struct User: Equatable {
    public let apiURL: String
    public let avatarURL: String
    public let bio: String?
    public let company: String?
    public let createDate: Date
    public let email: String?
    public let eventsURL: String
    public let followersURL: String
    public let followingURL: String
    public let gistsURL: String
    public let gravatarID: String?
    public let htmlURL: String
    public let id: Int
    public let isHireable: String?
    public let isSiteAdmin: Bool
    public let location: String?
    public let name: String?
    public let nodeID: String
    public let numberOfFollowers: Int
    public let numberOfPublicGists: Int
    public let numberOfPublicRepositories: Int
    public let numberOfUsersFollowed: Int
    public let organizationsURL: String
    public let receivedEventsURL: String
    public let repositoriesURL: String
    public let starredURL: String
    public let subscriptionsURL: String
    public let twitterUsername: String?
    public let type: OwnerType
    public let updateDate: Date
    public let username: String
    public let websiteURL: String?
}

// MARK: - Extensions

extension User: Codable {
    enum CodingKeys: String, CodingKey {
        case apiURL = "url"
        case avatarURL = "avatar_url"
        case bio
        case company
        case createDate = "created_at"
        case email
        case eventsURL = "events_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case gravatarID = "gravatar_id"
        case htmlURL = "html_url"
        case id
        case isHireable = "hireable"
        case isSiteAdmin = "site_admin"
        case location
        case name
        case nodeID = "node_id"
        case numberOfPublicGists = "public_gists"
        case numberOfPublicRepositories = "public_repos"
        case numberOfFollowers = "followers"
        case numberOfUsersFollowed = "following"
        case organizationsURL = "organizations_url"
        case receivedEventsURL = "received_events_url"
        case repositoriesURL = "repos_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case twitterUsername = "twitter_username"
        case type
        case updateDate = "updated_at"
        case username = "login"
        case websiteURL = "blog"
    }
}
