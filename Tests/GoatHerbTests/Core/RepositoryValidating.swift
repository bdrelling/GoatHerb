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
        XCTAssertGreaterThan(repository.id, 0)

        // The name should match the second half of the full name.
        let name = try XCTUnwrap(repository.fullName.split(separator: "/").last)
        XCTAssertEqual(repository.name, String(name))

        // We only only deal in public repositories, for now. If that ever changes, we can update this test.
        XCTAssertEqual(repository.visibility, "public")
        XCTAssertEqual(repository.isPrivate, false)

        // All URLs should follow the same basic template.
        XCTAssertEqual(repository.apiURL, "https://api.github.com/repos/\(repository.fullName)")
        XCTAssertEqual(repository.archiveURL, "https://api.github.com/repos/\(repository.fullName)/{archive_format}{/ref}")
        XCTAssertEqual(repository.assigneesURL, "https://api.github.com/repos/\(repository.fullName)/assignees{/user}")
        XCTAssertEqual(repository.blobsURL, "https://api.github.com/repos/\(repository.fullName)/git/blobs{/sha}")
        XCTAssertEqual(repository.branchesURL, "https://api.github.com/repos/\(repository.fullName)/branches{/branch}")
        XCTAssertEqual(repository.cloneURL, "https://github.com/\(repository.fullName).git")
        XCTAssertEqual(repository.collaboratorsURL, "https://api.github.com/repos/\(repository.fullName)/collaborators{/collaborator}")
        XCTAssertEqual(repository.commentsURL, "https://api.github.com/repos/\(repository.fullName)/comments{/number}")
        XCTAssertEqual(repository.commitsURL, "https://api.github.com/repos/\(repository.fullName)/commits{/sha}")
        XCTAssertEqual(repository.compareURL, "https://api.github.com/repos/\(repository.fullName)/compare/{base}...{head}")
        XCTAssertEqual(repository.contentsURL, "https://api.github.com/repos/\(repository.fullName)/contents/{+path}")
        XCTAssertEqual(repository.contributorsURL, "https://api.github.com/repos/\(repository.fullName)/contributors")
        XCTAssertEqual(repository.deploymentsURL, "https://api.github.com/repos/\(repository.fullName)/deployments")
        XCTAssertEqual(repository.downloadsURL, "https://api.github.com/repos/\(repository.fullName)/downloads")
        XCTAssertEqual(repository.eventsURL, "https://api.github.com/repos/\(repository.fullName)/events")
        XCTAssertEqual(repository.forksURL, "https://api.github.com/repos/\(repository.fullName)/forks")
        XCTAssertEqual(repository.gitCommitsURL, "https://api.github.com/repos/\(repository.fullName)/git/commits{/sha}")
        XCTAssertEqual(repository.gitRefsURL, "https://api.github.com/repos/\(repository.fullName)/git/refs{/sha}")
        XCTAssertEqual(repository.gitTagsURL, "https://api.github.com/repos/\(repository.fullName)/git/tags{/sha}")
        XCTAssertEqual(repository.gitURL, "git://github.com/\(repository.fullName).git")
        XCTAssertEqual(repository.hooksURL, "https://api.github.com/repos/\(repository.fullName)/hooks")
        XCTAssertEqual(repository.htmlURL, "https://github.com/\(repository.fullName)")
        XCTAssertEqual(repository.issueCommentURL, "https://api.github.com/repos/\(repository.fullName)/issues/comments{/number}")
        XCTAssertEqual(repository.issueEventsURL, "https://api.github.com/repos/\(repository.fullName)/issues/events{/number}")
        XCTAssertEqual(repository.issuesURL, "https://api.github.com/repos/\(repository.fullName)/issues{/number}")
        XCTAssertEqual(repository.keysURL, "https://api.github.com/repos/\(repository.fullName)/keys{/key_id}")
        XCTAssertEqual(repository.labelsURL, "https://api.github.com/repos/\(repository.fullName)/labels{/name}")
        XCTAssertEqual(repository.languagesURL, "https://api.github.com/repos/\(repository.fullName)/languages")
        XCTAssertEqual(repository.mergesURL, "https://api.github.com/repos/\(repository.fullName)/merges")
        XCTAssertEqual(repository.milestonesURL, "https://api.github.com/repos/\(repository.fullName)/milestones{/number}")
        XCTAssertEqual(repository.notificationsURL, "https://api.github.com/repos/\(repository.fullName)/notifications{?since,all,participating}")
        XCTAssertEqual(repository.pullsURL, "https://api.github.com/repos/\(repository.fullName)/pulls{/number}")
        XCTAssertEqual(repository.releasesURL, "https://api.github.com/repos/\(repository.fullName)/releases{/id}")
        XCTAssertEqual(repository.sshURL, "git@github.com:\(repository.fullName).git")
        XCTAssertEqual(repository.stargazersURL, "https://api.github.com/repos/\(repository.fullName)/stargazers")
        XCTAssertEqual(repository.statusesURL, "https://api.github.com/repos/\(repository.fullName)/statuses/{sha}")
        XCTAssertEqual(repository.subscribersURL, "https://api.github.com/repos/\(repository.fullName)/subscribers")
        XCTAssertEqual(repository.subscriptionURL, "https://api.github.com/repos/\(repository.fullName)/subscription")
        XCTAssertEqual(repository.svnURL, "https://github.com/\(repository.fullName)")
        XCTAssertEqual(repository.tagsURL, "https://api.github.com/repos/\(repository.fullName)/tags")
        XCTAssertEqual(repository.teamsURL, "https://api.github.com/repos/\(repository.fullName)/teams")
        XCTAssertEqual(repository.treesURL, "https://api.github.com/repos/\(repository.fullName)/git/trees{/sha}")

        // All of these values should be 0 or greater,
        // but they change too often to evaluate across all repositories.
        XCTAssertGreaterThanOrEqual(repository.numberOfForks, 0)
        XCTAssertGreaterThanOrEqual(repository.numberOfOpenIssues, 0)
        XCTAssertGreaterThanOrEqual(repository.numberOfStargazers, 0)
        XCTAssertGreaterThanOrEqual(repository.numberOfWatchers, 0)
        XCTAssertGreaterThanOrEqual(repository.topics.count, 0)

        // Size should always be greater than 0
        XCTAssertGreaterThan(repository.size, 0)

        // Our dates will also change too often, so instead just compare it with a
        // minimum date to ensure no error has occurred in parsing or fething.
        let minimumDate = try XCTUnwrap(Date(year: 2010, month: 1, day: 1, timeZone: "GMT"))
        XCTAssertGreaterThan(repository.createDate, minimumDate)
        XCTAssertGreaterThan(repository.updateDate, minimumDate)
        XCTAssertGreaterThan(repository.pushDate, minimumDate)

        // Certain repositories should not have a license.
        // .github = GitHub meta repository
        // manager_readme = README repository
        // <username> = README user profile repository
        if ![".github", "manager_readme", repository.owner.username].contains(repository.name) {
            XCTAssertNotNil(repository.license)
        }

        // All organization repositories should have permissions.
        if shouldHavePermissions, repository.owner.type == .organization {
            let permissions = try XCTUnwrap(repository.permissions, repository.fullName)

            // All repositories are public, so these permissions are always consistent.
            XCTAssertEqual(permissions.admin, false)
            XCTAssertEqual(permissions.maintain, false)
            XCTAssertEqual(permissions.push, false)
            XCTAssertEqual(permissions.triage, false)
            XCTAssertEqual(permissions.pull, true)
        }

        // Validate the owner of the repository.
        try self.validate(repository.owner)
    }

    func validate(_ owner: Repository.Owner) throws {
        // Evaluate all URLs, which should follow the same basic template.
        // Note that organization owners use the "users/<username>" path as well, for some reason.
        XCTAssertEqual(owner.avatarURL, "https://avatars.githubusercontent.com/u/\(owner.id)?v=4")
        XCTAssertEqual(owner.apiURL, "https://api.github.com/users/\(owner.username)")
        XCTAssertEqual(owner.htmlURL, "https://github.com/\(owner.username)")
        XCTAssertEqual(owner.followersURL, "https://api.github.com/users/\(owner.username)/followers")
        XCTAssertEqual(owner.followingURL, "https://api.github.com/users/\(owner.username)/following{/other_user}")
        XCTAssertEqual(owner.gistsURL, "https://api.github.com/users/\(owner.username)/gists{/gist_id}")
        XCTAssertEqual(owner.starredURL, "https://api.github.com/users/\(owner.username)/starred{/owner}{/repo}")
        XCTAssertEqual(owner.subscriptionsURL, "https://api.github.com/users/\(owner.username)/subscriptions")
        XCTAssertEqual(owner.organizationsURL, "https://api.github.com/users/\(owner.username)/orgs")
        XCTAssertEqual(owner.repositoriesURL, "https://api.github.com/users/\(owner.username)/repos")
        XCTAssertEqual(owner.eventsURL, "https://api.github.com/users/\(owner.username)/events{/privacy}")
        XCTAssertEqual(owner.receivedEventsURL, "https://api.github.com/users/\(owner.username)/received_events")

        // The users and organizations references in these tests are not and will never be site admins.
        XCTAssertEqual(owner.isSiteAdmin, false)
    }
}
