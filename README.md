# GoatHerb

[![CI Status](https://github.com/bdrelling/GoatHerb/actions/workflows/tests.yml/badge.svg)](https://github.com/bdrelling/GoatHerb/actions/workflows/tests.yml)
![Code Coverage](https://img.shields.io/badge/coverage-98%25-success)
[![Latest Release](https://img.shields.io/github/v/tag/bdrelling/GoatHerb?color=blue&label=latest)](https://github.com/bdrelling/GoatHerb/tags)
[![Swift Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbdrelling%2FGoatHerb%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/bdrelling/GoatHerb)
[![Platform Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbdrelling%2FGoatHerb%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/bdrelling/GoatHerb)
[![License](https://img.shields.io/github/license/bdrelling/GoatHerb)](https://github.com/bdrelling/GoatHerb/blob/main/LICENSE)

**GoatHerb** is a cross-platform Swift library for accessing the GitHub API.

## Features

### General

- [x] Compatible with [swift-log](https://github.com/apple/swift-log).
- [x] Full concurrency (async/await) support.
- [x] Cross-platform support:
  - [x] iOS
  - [x] macOS
  - [x] tvOS
  - [x] watchOS
  - [x] Linux _(optimized for Server-side Swift)_

> Most cross-platform SDKs simply replace Foundation's `URLSession` with SwiftNIO's `AsyncHTTPClient` and call it a day. Not GoatHerb! GoatHerb is built on top of [KippleNetworking](https://github.com/swift-kipple/Networking), which intelligently chooses between Foundation's `URLSession` or SwiftNIO's `AsyncHTTPClient` depending on the platform, ensuring optimal networking for the platform it's running on.

### GitHub API

- [x] Get Rate Limit
- [x] Get User
- [x] Get Organization
- [x] Get User Repositories
- [x] Get Organization Repositories
- [x] Get Repository

> That's it for now! If you're looking for a more feature-complete SDK, check out [the list of GitHub SDKs on Swift Package Index](https://swiftpackageindex.com/search?query=GitHub).

## Usage

Create a `GitHub` object.

```swift
let gitHub = GitHub()
```

You can optionally provide an `accessToken` in the initializer, or via setting the `GITHUB_ACCESS_TOKEN` or `GITHUB_TOKEN` environment variable.

```swift
let gitHub = GitHub(accessToken: "<token>")
```

From there, requests are extremely straight-forward. Here are some examples:

```swift
// Get a user.
let user = try await self.gitHub.getUser("bdrelling")

// Get an organization.
let organization = try await self.gitHub.getOrganization("swift-kipple")

// Get all repositories for a user.
let repositories = try await self.gitHub.getRepositories(user: "bdrelling")

// Get all repositories for an organization.
let repositories = try await self.gitHub.getRepositories(org: "swift-kipple")
```

## Contributing

Discussions, issues, and pull requests are more than welcome! I'm happy to extend the functionality of this library, with respect to the features listed in the [Out of Scope](#out-of-scope) section.

If opening a pull request, please ensure that the package retains _as close to_ 100% code coverage as possible.

## Credits

Special thanks to [@boiarqin](https://github.com/boiarqin) for providing me with an unforgettable repository name.

## License

This project is released under the MIT license. See [LICENSE](/LICENSE) for details.
