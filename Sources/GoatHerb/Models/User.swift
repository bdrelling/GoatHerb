import Foundation

public struct User: Codable {
    let username: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let apiURL: String
    let htmlURL: String
    let followersURL: String
    let followingURL: String
    let gistsURL: String
    let starredURL: String
    let subscriptionsURL: String
    let organizationsURL: String
    let repositoriesURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let isSiteAdmin: Bool
    let name: String
    let company: String?
    let websiteURL: String
    let location: String
    let email: String?
    let isHireable: String?
    let bio: String
    let twitterUsername: String
    let numberOfPublicRepositories: Int
    let numberOfPublicGists: Int
    let numberOfFollowers: Int
    let numberOfUsersFollowed: Int
    let createDate: Date
    let updateDate: Date
    
    enum CodingKeys: String, CodingKey {
        case username = "login"
        case id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case apiURL = "url"
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case repositoriesURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case isSiteAdmin = "site_admin"
        case name
        case company
        case websiteURL = "blog"
        case location
        case email
        case isHireable = "hireable"
        case bio
        case twitterUsername = "twitter_username"
        case numberOfPublicRepositories = "public_repos"
        case numberOfPublicGists = "public_gists"
        case numberOfFollowers = "followers"
        case numberOfUsersFollowed = "following"
        case createDate = "created_at"
        case updateDate = "updated_at"
    }
}
