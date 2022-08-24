// Copyright © 2022 Brian Drelling. All rights reserved.

import GoatHerb
import KippleNetworking
import XCTest

class BaseTestCase: XCTestCase {
    let dispatcher: NetworkRequestDispatching = .universal

    private(set) lazy var environment: Environment = GitHub.environment()
    private(set) lazy var client: HTTPClient = .init(environment: self.environment, dispatcher: self.dispatcher)
}
