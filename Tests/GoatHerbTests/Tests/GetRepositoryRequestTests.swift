// Copyright © 2022 Brian Drelling. All rights reserved.

@testable import GoatHerb
import XCTest

final class GetRepositoryRequestTests: BaseTestCase, RepositoryValidating {
    /// Ensures that a call to <https://api.github.com/repos/bdrelling/GoatHerb> succeeds.
    func testUserRepositoriesRequestSucceeds() async throws {
        let repository = try await self.gitHub.getRepository(name: "bdrelling/GoatHerb")
        
        // Validate the repository's specific properties.
        XCTAssertEqual(repository.allowsForking, true)
        XCTAssertEqual(repository.description, "Cross-platform Swift library for accessing the GitHub API.")
        XCTAssertEqual(repository.fullName, "bdrelling/GoatHerb")
        XCTAssertEqual(repository.hasDownloads, true)
        XCTAssertEqual(repository.hasIssues, true)
        XCTAssertEqual(repository.hasPages, false)
        XCTAssertEqual(repository.hasProjects, false)
        XCTAssertEqual(repository.hasWiki, false)
        XCTAssertEqual(repository.id, 528231319)
        XCTAssertEqual(repository.isArchived, false)
        XCTAssertEqual(repository.isDisabled, false)
        XCTAssertEqual(repository.isFork, false)
        XCTAssertEqual(repository.isTemplate, false)
        XCTAssertEqual(repository.isWebCommitSignoffRequired, true)
        XCTAssertEqual(repository.language, "Swift")
        XCTAssertEqual(repository.mirrorURL, nil)
        XCTAssertEqual(repository.nodeID, "R_kgDOH3wrlw")
        XCTAssertEqual(repository.websiteURL, "")
        
        // We will always know our exact create date.
        let createDate = try XCTUnwrap(Date(year: 2022, month: 8, day: 24, hour: 2, minute: 8, second: 4, timeZone: "GMT"))
        XCTAssertEqual(repository.createDate, createDate)
        
        // Validate the license, which should be MIT.
        let license = try XCTUnwrap(repository.license)
        XCTAssertEqual(license.key, "mit")
        XCTAssertEqual(license.name, "MIT License")
        XCTAssertEqual(license.nodeID, "MDc6TGljZW5zZTEz")
        XCTAssertEqual(license.spdxID, "MIT")
        XCTAssertEqual(license.url, "https://api.github.com/licenses/mit")
        
        // Validate the owner.
        let owner = repository.owner
        XCTAssertEqual(owner.username, "bdrelling")
        XCTAssertEqual(owner.id, 3022693)
        XCTAssertEqual(owner.nodeID, "MDQ6VXNlcjMwMjI2OTM=")
        XCTAssertEqual(owner.gravatarID, "")
        XCTAssertEqual(owner.type, .user)
        
        // Validate the repository using general rules.
        // Individual repository requests don't include permissions.
        try self.validate(repository, shouldHavePermissions: false)
    }
    
    /// Ensures that a call to <https://api.github.com/repos/swift-kipple/Networking> succeeds.
    func testOrganizationRepositoriesRequestSucceeds() async throws {
        let repository = try await self.gitHub.getRepository(name: "swift-kipple/Networking")
        
        // Validate the repository's specific properties.
        XCTAssertEqual(repository.allowsForking, true)
        XCTAssertEqual(repository.description, "A Swift cross-platform (Apple and Linux) networking library.")
        XCTAssertEqual(repository.fullName, "swift-kipple/Networking")
        XCTAssertEqual(repository.hasDownloads, true)
        XCTAssertEqual(repository.hasIssues, true)
        XCTAssertEqual(repository.hasPages, false)
        XCTAssertEqual(repository.hasProjects, false)
        XCTAssertEqual(repository.hasWiki, false)
        XCTAssertEqual(repository.id, 510545591)
        XCTAssertEqual(repository.isArchived, false)
        XCTAssertEqual(repository.isDisabled, false)
        XCTAssertEqual(repository.isFork, false)
        XCTAssertEqual(repository.isTemplate, false)
        XCTAssertEqual(repository.isWebCommitSignoffRequired, true)
        XCTAssertEqual(repository.language, "Swift")
        XCTAssertEqual(repository.mirrorURL, nil)
        XCTAssertEqual(repository.nodeID, "R_kgDOHm5Otw")
        XCTAssertEqual(repository.websiteURL, "https://swiftpackageindex.com/swift-kipple/Networking")
        
        // We will always know our exact create date.
        let createDate = try XCTUnwrap(Date(year: 2022, month: 7, day: 5, hour: 1, minute: 9, second: 14, timeZone: "GMT"))
        XCTAssertEqual(repository.createDate, createDate)
        
        // Validate the license, which should be MIT.
        let license = try XCTUnwrap(repository.license)
        XCTAssertEqual(license.key, "mit")
        XCTAssertEqual(license.name, "MIT License")
        XCTAssertEqual(license.nodeID, "MDc6TGljZW5zZTEz")
        XCTAssertEqual(license.spdxID, "MIT")
        XCTAssertEqual(license.url, "https://api.github.com/licenses/mit")
        
        // Validate the owner.
        let owner = repository.owner
        XCTAssertEqual(owner.username, "swift-kipple")
        XCTAssertEqual(owner.id, 108965235)
        XCTAssertEqual(owner.nodeID, "O_kgDOBn6tcw")
        XCTAssertEqual(owner.gravatarID, "")
        XCTAssertEqual(owner.type, .organization)
        
        // Validate the repository using general rules.
        // Individual repository requests don't include permissions.
        try self.validate(repository, shouldHavePermissions: false)
    }
}
