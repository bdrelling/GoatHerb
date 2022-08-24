// Copyright © 2022 Brian Drelling. All rights reserved.

import GoatHerb
import KippleNetworking
import XCTest

class BaseTestCase: XCTestCase {
    let dispatcher: NetworkRequestDispatching = .universal

    private(set) lazy var gitHub = GitHub(dispatcher: self.dispatcher)
}
