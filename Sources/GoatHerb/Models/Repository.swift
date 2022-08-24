//
//  File.swift
//  
//
//  Created by Brian Drelling on 8/24/22.
//

import Foundation

/// Represents a GitHub repository.
///
/// For example requests, see:
///   - <https://api.github.com/users/bdrelling/repos>
///   - <https://api.github.com/orgs/swift-kipple/repos>
public struct Repository {
    public let allowsForking: Bool
    public let apiURL: String
    public let archiveURL: String
    public let assigneesURL: String
    public let blobsURL: String
    public let branchesURL: String
    public let cloneURL: String
    public let collaboratorsURL: String
    public let commentsURL: String
    public let commitsURL: String
    public let compareURL: String
    public let contentsURL: String
    public let contributorsURL: String
    public let createDate: Date
    public let defaultBranch: String
    public let deploymentsURL: String
    public let description: String?
    public let downloadsURL: String
    public let eventsURL: String
    public let forksURL: String
    public let fullName: String
    public let gitCommitsURL: String
    public let gitRefsURL: String
    public let gitTagsURL: String
    public let gitURL: String
    public let hasDownloads: Bool
    public let hasIssues: Bool
    public let hasPages: Bool
    public let hasProjects: Bool
    public let hasWiki: Bool
    public let hooksURL: String
    public let htmlURL: String
    public let id: Int
    public let isTemplate: Bool
    public let isArchived: Bool
    public let isDisabled: Bool
    public let isFork: Bool
    public let isPrivate: Bool
    public let issueCommentURL: String
    public let issueEventsURL: String
    public let issuesURL: String
    public let isWebCommitSignoffRequired: Bool
    public let keysURL: String
    public let labelsURL: String
    public let language: String?
    public let languagesURL: String
    public let license: License?
    public let mergesURL: String
    public let milestonesURL: String
    public let mirrorURL: String?
    public let name: String
    public let nodeID: String
    public let notificationsURL: String
    public let numberOfForks: Int
    public let numberOfOpenIssues: Int
    public let numberOfStargazers: Int
    public let numberOfWatchers: Int
    public let owner: Owner
    public let pullsURL: String
    public let pushDate: Date
    public let releasesURL: String
    public let size: Int
    public let sshURL: String
    public let stargazersURL: String
    public let statusesURL: String
    public let subscribersURL: String
    public let subscriptionURL: String
    public let svnURL: String
    public let tagsURL: String
    public let teamsURL: String
    public let topics: [String]
    public let treesURL: String
    public let updateDate: Date
    public let visibility: String
    public let websiteURL: String?
    
    /// A set of permissions related to this repository.
    /// Permissions are only applicable for `Organization` repositories.
    public let permissions: Permissions?
}

// MARK: - Extensions

extension Repository: Codable {
    enum CodingKeys: String, CodingKey {
        case allowsForking = "allow_forking"
        case apiURL = "url"
        case archiveURL = "archive_url"
        case assigneesURL = "assignees_url"
        case blobsURL = "blobs_url"
        case branchesURL = "branches_url"
        case cloneURL = "clone_url"
        case collaboratorsURL = "collaborators_url"
        case commentsURL = "comments_url"
        case commitsURL = "commits_url"
        case compareURL = "compare_url"
        case contentsURL = "contents_url"
        case contributorsURL = "contributors_url"
        case createDate = "created_at"
        case defaultBranch = "default_branch"
        case deploymentsURL = "deployments_url"
        case description
        case downloadsURL = "downloads_url"
        case eventsURL = "events_url"
        case forksURL = "forks_url"
        case fullName = "full_name"
        case gitCommitsURL = "git_commits_url"
        case gitRefsURL = "git_refs_url"
        case gitTagsURL = "git_tags_url"
        case gitURL = "git_url"
        case hasDownloads = "has_downloads"
        case hasIssues = "has_issues"
        case hasPages = "has_pages"
        case hasProjects = "has_projects"
        case hasWiki = "has_wiki"
        case hooksURL = "hooks_url"
        case htmlURL = "html_url"
        case id
        case isTemplate = "is_template"
        case isArchived = "archived"
        case isDisabled = "disabled"
        case isFork = "fork"
        case isPrivate = "private"
        case issueCommentURL = "issue_comment_url"
        case issueEventsURL = "issue_events_url"
        case issuesURL = "issues_url"
        case isWebCommitSignoffRequired = "web_commit_signoff_required"
        case keysURL = "keys_url"
        case labelsURL = "labels_url"
        case language
        case languagesURL = "languages_url"
        case license
        case mergesURL = "merges_url"
        case milestonesURL = "milestones_url"
        case mirrorURL = "mirror_url"
        case name
        case nodeID = "node_id"
        case notificationsURL = "notifications_url"
        case numberOfForks = "forks_count"
        case numberOfOpenIssues = "open_issues_count"
        case numberOfStargazers = "stargazers_count"
        case numberOfWatchers = "watchers_count"
        case owner
        case permissions
        case pullsURL = "pulls_url"
        case pushDate = "pushed_at"
        case releasesURL = "releases_url"
        case size
        case sshURL = "ssh_url"
        case stargazersURL = "stargazers_url"
        case statusesURL = "statuses_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case svnURL = "svn_url"
        case tagsURL = "tags_url"
        case teamsURL = "teams_url"
        case topics
        case treesURL = "trees_url"
        case updateDate = "updated_at"
        case visibility
        case websiteURL = "homepage"
    }
}
