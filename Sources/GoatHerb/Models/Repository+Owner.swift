// Copyright © 2022 Brian Drelling. All rights reserved.

import Foundation

/// Represents a GitHub user.
///
/// For an example request, see <https://api.github.com/users/bdrelling>.
public extension Repository {
    struct Owner {
        public let apiURL: String
        public let avatarURL: String
        public let eventsURL: String
        public let followersURL: String
        public let followingURL: String
        public let gistsURL: String
        public let gravatarID: String?
        public let htmlURL: String
        public let id: Int
        public let isSiteAdmin: Bool
        public let nodeID: String
        public let organizationsURL: String
        public let receivedEventsURL: String
        public let repositoriesURL: String
        public let starredURL: String
        public let subscriptionsURL: String
        public let type: OwnerType
        public let username: String
    }
}

// MARK: - Supporting Types

public enum OwnerType: String, Codable {
    case organization = "Organization"
    case user = "User"
}

// MARK: - Extensions

extension Repository.Owner: Codable {
    enum CodingKeys: String, CodingKey {
        case apiURL = "url"
        case avatarURL = "avatar_url"
        case eventsURL = "events_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case gravatarID = "gravatar_id"
        case htmlURL = "html_url"
        case id
        case isSiteAdmin = "site_admin"
        case nodeID = "node_id"
        case organizationsURL = "organizations_url"
        case receivedEventsURL = "received_events_url"
        case repositoriesURL = "repos_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case type
        case username = "login"
    }
}
