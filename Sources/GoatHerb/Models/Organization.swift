// Copyright © 2022 Brian Drelling. All rights reserved.

import Foundation

/// Represents a GitHub organization..
///
/// For an example request, see <https://api.github.com/orgs/swift-kipple>.
public struct Organization: Equatable {
    public let apiURL: String
    public let avatarURL: String
    public let company: String?
    public let createDate: Date
    public let description: String?
    public let email: String?
    public let eventsURL: String
    public let hasOrganizationProjects: Bool
    public let hasRepositoryProjects: Bool
    public let hooksURL: String
    public let htmlURL: String
    public let id: Int
    public let issuesURL: String
    public let isVerified: Bool
    public let location: String?
    public let membersURL: String
    public let name: String
    public let nodeID: String
    public let numberOfFollowers: Int
    public let numberOfPublicGists: Int
    public let numberOfPublicRepositories: Int
    public let numberOfUsersFollowed: Int
    public let publicMembersURL: String
    public let repositoriesURL: String
    public let slug: String
    public let twitterUsername: String?
    public let type: OwnerType
    public let updateDate: Date
    public let websiteURL: String
}

// MARK: - Extensions

extension Organization: Codable {
    enum CodingKeys: String, CodingKey {
        case apiURL = "url"
        case avatarURL = "avatar_url"
        case company
        case createDate = "created_at"
        case description
        case email
        case eventsURL = "events_url"
        case hasOrganizationProjects = "has_organization_projects"
        case hasRepositoryProjects = "has_repository_projects"
        case hooksURL = "hooks_url"
        case htmlURL = "html_url"
        case id
        case issuesURL = "issues_url"
        case isVerified = "is_verified"
        case location
        case membersURL = "members_url"
        case name
        case nodeID = "node_id"
        case numberOfFollowers = "followers"
        case numberOfPublicGists = "public_gists"
        case numberOfPublicRepositories = "public_repos"
        case numberOfUsersFollowed = "following"
        case publicMembersURL = "public_members_url"
        case repositoriesURL = "repos_url"
        case slug = "login"
        case twitterUsername = "twitter_username"
        case type
        case updateDate = "updated_at"
        case websiteURL = "blog"
    }
}
