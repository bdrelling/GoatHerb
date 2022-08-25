// Copyright © 2022 Brian Drelling. All rights reserved.

public extension Repository {
    struct License: Codable {
        public let key: String
        public let name: String
        public let nodeID: String
        public let spdxID: String
        public let url: String

        enum CodingKeys: String, CodingKey {
            case key
            case name
            case nodeID = "node_id"
            case spdxID = "spdx_id"
            case url
        }
    }
}
