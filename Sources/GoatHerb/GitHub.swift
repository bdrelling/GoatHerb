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
    public let hasAccessToken: Bool

    // MARK: Initializers

    public init(accessToken: String? = nil, dispatcher: NetworkRequestDispatching = .universal, logger: Logger? = nil, shouldUseEnvironment: Bool = true) {
        // If the access token was passed in explicitly, use that.
        // Otherwise, unless environment detection was disabled, check the environment for the applicable key.
        let accessToken = accessToken ?? (shouldUseEnvironment ? Self.accessTokenFromEnvironment() : nil)

        // Whether or not the GitHub client is using an access token when making requests.
        self.hasAccessToken = accessToken?.isEmpty == false

        self.client = .init(environment: Self.environment(accessToken: accessToken), dispatcher: dispatcher, logger: logger)
    }

    // MARK: Requests

    public func request<T>(_ request: T) async throws -> T.Response where T: ResponseAnticipating {
        try await self.client.requestDecoded(request).result
    }

    // MARK: Utilities

    public static func environment(accessToken: String? = nil) -> Environment {
        var headers: [HTTPHeader: String] = [
            .userAgent: "GoatHerb",
        ]

        if let accessToken = accessToken {
            headers[.authorization] = "Bearer \(accessToken)"
        }

        return .init(
            baseURL: Self.baseURL,
            headers: headers
        )
    }

    /// Convenience method for checking various environment keys, all of which are fairly common across CI environments.
    private static func accessTokenFromEnvironment() -> String? {
        if let token = ProcessInfo.processInfo.environment["GITHUB_ACCESS_TOKEN"] {
            return token
        } else if let token = ProcessInfo.processInfo.environment["GITHUB_TOKEN"] {
            return token
        } else {
            return nil
        }
    }
}
