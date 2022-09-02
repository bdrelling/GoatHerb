// Copyright © 2022 Brian Drelling. All rights reserved.

import Foundation
import GoatHerb
import KippleNetworking
import Logging
import XCTest

class BaseTestCase: XCTestCase {
    let dispatcher: NetworkRequestDispatching = .universal

    let logger: Logger? = {
        if ProcessInfo.processInfo.environment["CI"] == nil {
            return .debug("GoatHerbTests")
        } else {
            return nil
        }
    }()

    /// A GitHub client that detects an access token from the environment.
    private(set) lazy var gitHub = GitHub(dispatcher: self.dispatcher, logger: self.logger)

    /// A GitHub client that _never_ detects an access token from the environment.
    private(set) lazy var gitHubUnauthenticated = GitHub(dispatcher: self.dispatcher, logger: self.logger, shouldUseEnvironment: false)
}
