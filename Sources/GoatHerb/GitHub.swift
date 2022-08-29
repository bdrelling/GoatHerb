// Copyright © 2022 Brian Drelling. All rights reserved.

import Foundation
import KippleDiagnostics
import KippleNetworking
import Logging

public final class GitHub {
    // MARK: Constants

    /// The base URL of the GitHub REST API.
    ///
    /// Documentation for the API can be found [here](https://docs.github.com/en/rest).
    public static let baseURL = "https://api.github.com"

    // MARK: Properties

    public let client: HTTPClient

    // MARK: Initializers

    public init(personalAccessToken: String? = nil, dispatcher: NetworkRequestDispatching = .universal, logger: Logger? = nil) {
        // If the personal access token was passed in explicitly, use that. Otherwise, check the environment for the applicable key.
        let personalAccessToken = personalAccessToken ?? ProcessInfo.processInfo.environment["GITHUB_ACCESS_TOKEN"]

        self.client = .init(environment: Self.environment(personalAccessToken: personalAccessToken), dispatcher: dispatcher, logger: logger)
    }

    // MARK: Requests

    public func request<T>(_ request: T) async throws -> T.Response where T: ResponseAnticipating {
        try await self.client.requestDecoded(request).result
    }

    // MARK: Utilities

    public static func environment(personalAccessToken: String? = nil) -> Environment {
        var headers: [HTTPHeader: String] = [:]

        if let personalAccessToken = personalAccessToken {
            headers[.authorization] = "Bearer \(personalAccessToken)"
        }

        return .init(
            baseURL: Self.baseURL,
            headers: headers
        )
    }
}
