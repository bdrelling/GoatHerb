// Copyright © 2022 Brian Drelling. All rights reserved.

import Foundation
import GoatHerb
import KippleNetworking
import Logging
import XCTest

class BaseTestCase: XCTestCase {
    private let dispatcher: NetworkRequestDispatching = .universal

    /// Our debug logger, which will print JSON responses to the terminal.
    /// There is no private data accessible, as the only access tokens used for testing are restricted, read-only tokens.
    private let logger: Logger = .debug("GoatHerbTests")

    /// A GitHub client that detects an access token from the environment.
    private(set) lazy var gitHub = GitHub(dispatcher: self.dispatcher, logger: self.logger)

    /// A GitHub client that _never_ detects an access token from the environment.
    private(set) lazy var gitHubUnauthenticated = GitHub(dispatcher: self.dispatcher, logger: self.logger, shouldUseEnvironment: false)
}
