// Copyright © 2022 Brian Drelling. All rights reserved.

import GoatHerb
import XCTest

protocol RepositoryValidating: XCTestCase {}

// MARK: - Extensions

extension RepositoryValidating {
    func validate(_ repositories: [Repository], shouldHavePermissions: Bool = true) throws {
        // Ensure at least one repository is returned.
        XCTAssertGreaterThan(repositories.count, 0)

        // Validate each repository with a standard set of checks.
        try repositories.forEach { try self.validate($0, shouldHavePermissions: shouldHavePermissions) }
    }

    func validate(_ repository: Repository, shouldHavePermissions: Bool = true) throws {
        // Ensure that the ID, which is a positive integer, is deserialized properly.
        XCTAssertGreaterThan(repository.id, 0, repository.fullName)

        // The name should match the second half of the full name.
        let name = try XCTUnwrap(repository.fullName.split(separator: "/").last)
        XCTAssertEqual(repository.name, String(name), repository.fullName)

        // We only only deal in public repositories, for now. If that ever changes, we can update this test.
        XCTAssertEqual(repository.visibility, "public", repository.fullName)
        XCTAssertEqual(repository.isPrivate, false, repository.fullName)

        // All URLs should follow the same basic template.
        XCTAssertEqual(repository.apiURL, "https://api.github.com/repos/\(repository.fullName)", repository.fullName)
        XCTAssertEqual(repository.archiveURL, "https://api.github.com/repos/\(repository.fullName)/{archive_format}{/ref}", repository.fullName)
        XCTAssertEqual(repository.assigneesURL, "https://api.github.com/repos/\(repository.fullName)/assignees{/user}", repository.fullName)
        XCTAssertEqual(repository.blobsURL, "https://api.github.com/repos/\(repository.fullName)/git/blobs{/sha}", repository.fullName)
        XCTAssertEqual(repository.branchesURL, "https://api.github.com/repos/\(repository.fullName)/branches{/branch}", repository.fullName)
        XCTAssertEqual(repository.cloneURL, "https://github.com/\(repository.fullName).git", repository.fullName)
        XCTAssertEqual(repository.collaboratorsURL, "https://api.github.com/repos/\(repository.fullName)/collaborators{/collaborator}", repository.fullName)
        XCTAssertEqual(repository.commentsURL, "https://api.github.com/repos/\(repository.fullName)/comments{/number}", repository.fullName)
        XCTAssertEqual(repository.commitsURL, "https://api.github.com/repos/\(repository.fullName)/commits{/sha}", repository.fullName)
        XCTAssertEqual(repository.compareURL, "https://api.github.com/repos/\(repository.fullName)/compare/{base}...{head}", repository.fullName)
        XCTAssertEqual(repository.contentsURL, "https://api.github.com/repos/\(repository.fullName)/contents/{+path}", repository.fullName)
        XCTAssertEqual(repository.contributorsURL, "https://api.github.com/repos/\(repository.fullName)/contributors", repository.fullName)
        XCTAssertEqual(repository.deploymentsURL, "https://api.github.com/repos/\(repository.fullName)/deployments", repository.fullName)
        XCTAssertEqual(repository.downloadsURL, "https://api.github.com/repos/\(repository.fullName)/downloads", repository.fullName)
        XCTAssertEqual(repository.eventsURL, "https://api.github.com/repos/\(repository.fullName)/events", repository.fullName)
        XCTAssertEqual(repository.forksURL, "https://api.github.com/repos/\(repository.fullName)/forks", repository.fullName)
        XCTAssertEqual(repository.gitCommitsURL, "https://api.github.com/repos/\(repository.fullName)/git/commits{/sha}", repository.fullName)
        XCTAssertEqual(repository.gitRefsURL, "https://api.github.com/repos/\(repository.fullName)/git/refs{/sha}", repository.fullName)
        XCTAssertEqual(repository.gitTagsURL, "https://api.github.com/repos/\(repository.fullName)/git/tags{/sha}", repository.fullName)
        XCTAssertEqual(repository.gitURL, "git://github.com/\(repository.fullName).git", repository.fullName)
        XCTAssertEqual(repository.hooksURL, "https://api.github.com/repos/\(repository.fullName)/hooks", repository.fullName)
        XCTAssertEqual(repository.htmlURL, "https://github.com/\(repository.fullName)", repository.fullName)
        XCTAssertEqual(repository.issueCommentURL, "https://api.github.com/repos/\(repository.fullName)/issues/comments{/number}", repository.fullName)
        XCTAssertEqual(repository.issueEventsURL, "https://api.github.com/repos/\(repository.fullName)/issues/events{/number}", repository.fullName)
        XCTAssertEqual(repository.issuesURL, "https://api.github.com/repos/\(repository.fullName)/issues{/number}", repository.fullName)
        XCTAssertEqual(repository.keysURL, "https://api.github.com/repos/\(repository.fullName)/keys{/key_id}", repository.fullName)
        XCTAssertEqual(repository.labelsURL, "https://api.github.com/repos/\(repository.fullName)/labels{/name}", repository.fullName)
        XCTAssertEqual(repository.languagesURL, "https://api.github.com/repos/\(repository.fullName)/languages", repository.fullName)
        XCTAssertEqual(repository.mergesURL, "https://api.github.com/repos/\(repository.fullName)/merges", repository.fullName)
        XCTAssertEqual(repository.milestonesURL, "https://api.github.com/repos/\(repository.fullName)/milestones{/number}", repository.fullName)
        XCTAssertEqual(repository.notificationsURL, "https://api.github.com/repos/\(repository.fullName)/notifications{?since,all,participating}", repository.fullName)
        XCTAssertEqual(repository.pullsURL, "https://api.github.com/repos/\(repository.fullName)/pulls{/number}", repository.fullName)
        XCTAssertEqual(repository.releasesURL, "https://api.github.com/repos/\(repository.fullName)/releases{/id}", repository.fullName)
        XCTAssertEqual(repository.sshURL, "git@github.com:\(repository.fullName).git", repository.fullName)
        XCTAssertEqual(repository.stargazersURL, "https://api.github.com/repos/\(repository.fullName)/stargazers", repository.fullName)
        XCTAssertEqual(repository.statusesURL, "https://api.github.com/repos/\(repository.fullName)/statuses/{sha}", repository.fullName)
        XCTAssertEqual(repository.subscribersURL, "https://api.github.com/repos/\(repository.fullName)/subscribers", repository.fullName)
        XCTAssertEqual(repository.subscriptionURL, "https://api.github.com/repos/\(repository.fullName)/subscription", repository.fullName)
        XCTAssertEqual(repository.svnURL, "https://github.com/\(repository.fullName)", repository.fullName)
        XCTAssertEqual(repository.tagsURL, "https://api.github.com/repos/\(repository.fullName)/tags", repository.fullName)
        XCTAssertEqual(repository.teamsURL, "https://api.github.com/repos/\(repository.fullName)/teams", repository.fullName)
        XCTAssertEqual(repository.treesURL, "https://api.github.com/repos/\(repository.fullName)/git/trees{/sha}", repository.fullName)

        // All of these values should be 0 or greater,
        // but they change too often to evaluate across all repositories.
        XCTAssertGreaterThanOrEqual(repository.numberOfForks, 0, repository.fullName)
        XCTAssertGreaterThanOrEqual(repository.numberOfOpenIssues, 0, repository.fullName)
        XCTAssertGreaterThanOrEqual(repository.numberOfStargazers, 0, repository.fullName)
        XCTAssertGreaterThanOrEqual(repository.numberOfWatchers, 0, repository.fullName)
        XCTAssertGreaterThanOrEqual(repository.topics.count, 0, repository.fullName)

        // Size should always be greater than 0
        XCTAssertGreaterThan(repository.size, 0, repository.fullName)

        // Our dates will also change too often, so instead just compare it with a
        // minimum date to ensure no error has occurred in parsing or fething.
        let minimumDate = try XCTUnwrap(Date(year: 2010, month: 1, day: 1, timeZone: "GMT"), repository.fullName)
        XCTAssertGreaterThan(repository.createDate, minimumDate, repository.fullName)
        XCTAssertGreaterThan(repository.updateDate, minimumDate, repository.fullName)
        XCTAssertGreaterThan(repository.pushDate, minimumDate, repository.fullName)

        // All organization repositories should have permissions.
        if shouldHavePermissions, repository.owner.type == .organization {
            let permissions = try XCTUnwrap(repository.permissions, repository.fullName)

            // All repositories are public, so these permissions are always consistent.
            XCTAssertEqual(permissions.admin, false, repository.fullName)
            XCTAssertEqual(permissions.maintain, false, repository.fullName)
            XCTAssertEqual(permissions.push, false, repository.fullName)
            XCTAssertEqual(permissions.triage, false, repository.fullName)
            XCTAssertEqual(permissions.pull, true, repository.fullName)
        }

        // Validate the owner of the repository.
        try self.validate(repository.owner)
    }

    func validate(_ owner: Repository.Owner) throws {
        // Evaluate all URLs, which should follow the same basic template.
        // Note that organization owners use the "users/<username>" path as well, for some reason.
        XCTAssertEqual(owner.avatarURL, "https://avatars.githubusercontent.com/u/\(owner.id)?v=4", owner.username)
        XCTAssertEqual(owner.apiURL, "https://api.github.com/users/\(owner.username)", owner.username)
        XCTAssertEqual(owner.htmlURL, "https://github.com/\(owner.username)", owner.username)
        XCTAssertEqual(owner.followersURL, "https://api.github.com/users/\(owner.username)/followers", owner.username)
        XCTAssertEqual(owner.followingURL, "https://api.github.com/users/\(owner.username)/following{/other_user}", owner.username)
        XCTAssertEqual(owner.gistsURL, "https://api.github.com/users/\(owner.username)/gists{/gist_id}", owner.username)
        XCTAssertEqual(owner.starredURL, "https://api.github.com/users/\(owner.username)/starred{/owner}{/repo}", owner.username)
        XCTAssertEqual(owner.subscriptionsURL, "https://api.github.com/users/\(owner.username)/subscriptions", owner.username)
        XCTAssertEqual(owner.organizationsURL, "https://api.github.com/users/\(owner.username)/orgs", owner.username)
        XCTAssertEqual(owner.repositoriesURL, "https://api.github.com/users/\(owner.username)/repos", owner.username)
        XCTAssertEqual(owner.eventsURL, "https://api.github.com/users/\(owner.username)/events{/privacy}", owner.username)
        XCTAssertEqual(owner.receivedEventsURL, "https://api.github.com/users/\(owner.username)/received_events", owner.username)

        // The users and organizations references in these tests are not and will never be site admins.
        XCTAssertEqual(owner.isSiteAdmin, false)
    }
}
