// Copyright © 2022 Brian Drelling. All rights reserved.

public struct RateLimit: Codable {
    public let resources: [String: Resource]
    public let rate: Resource

    public struct Resource: Codable {
        public let limit: Int
        public let remaining: Int
        public let reset: Int
        public let used: Int

        // The "resource" property here has been intentionally disabled because it only appears in unauthenticated requests.
        // public let resource: String
    }
}
