// Copyright © 2022 Brian Drelling. All rights reserved.

import Foundation
import KippleNetworking

public final class GitHub {
    // MARK: Constants

    /// The base URL of the GitHub REST API.
    ///
    /// Documentation for the API can be found [here](https://docs.github.com/en/rest).
    public static let baseURL = "https://api.github.com"

    // MARK: Properties

    public let client: HTTPClient

    // MARK: Initializers

    public init(dispatcher: NetworkRequestDispatching = .universal) {
        self.client = .init(environment: Self.environment(), dispatcher: dispatcher)
    }

    // MARK: Requests

    public func request<T>(_ request: T) async throws -> T.Response where T: ResponseAnticipating {
        try await self.client.requestDecoded(request).result
    }

    // MARK: Utilities

    public static func environment() -> Environment {
        .init(
            baseURL: Self.baseURL
        )
    }
}
