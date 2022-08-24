public extension Repository {
    struct Permissions: Codable {
        public let admin: Bool
        public let maintain: Bool
        public let push: Bool
        public let triage: Bool
        public let pull: Bool
    }
}
