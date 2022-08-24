# GoatHerb

[![CI Status](https://github.com/bdrelling/GoatHerb/actions/workflows/tests.yml/badge.svg)](https://github.com/bdrelling/GoatHerb/actions/workflows/tests.yml)
![Code Coverage](https://img.shields.io/badge/coverage-100%25-success)
[![Latest Release](https://img.shields.io/github/v/tag/bdrelling/GoatHerb?color=blue&label=latest)](https://github.com/bdrelling/GoatHerb/releases)
[![Swift Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbdrelling%2FGoatHerb%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/bdrelling/GoatHerb)
[![Platform Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbdrelling%2FGoatHerb%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/bdrelling/GoatHerb)
[![License](https://img.shields.io/github/license/bdrelling/GoatHerb)](https://github.com/bdrelling/GoatHerb/blob/main/LICENSE)

**GoatHerb** is a cross-platform Swift library for accessing **publicly available information** in the GitHub API.

## Features

### Cross-Platform Support

- [x] iOS
- [x] macOS
- [x] tvOS
- [x] watchOS
- [x] Linux _(optimized for Server-side Swift)_

> Most cross-platform SDKs simply replace Foundation's `URLSession` with SwiftNIO's `AsyncHTTPClient` and call it a day. Not GoatHerb! GoatHerb is built on top of [KippleNetworking](https://github.com/swift-kipple/Networking), which intelligently chooses between Foundation's `URLSession` or SwiftNIO's `AsyncHTTPClient` depending on the platform, ensuring optimal networking for the platform it's running on.

### GitHub API

- [x] Get User
- [x] Get Organization
- [x] Get User Repositories
- [x] Get Organization Repositories
- [x] Get Repository

> That's it for now! If you're looking for a more feature-complete SDK, check out [the list of GitHub SDKs on Swift Package Index](https://swiftpackageindex.com/search?query=GitHub).

## Out of Scope

GoatHerb wasn't designed to wrap the entire GitHub API. Instead, GoatHerb specializes in publicly available information that you can get _without_ API authentication.

As such, the following features are out of scope:

- Authentication
- Private Repositories
- GitHub Enterprise

> Disappointed? No worries! There are [numerous Swift GitHub SDKs available](https://swiftpackageindex.com/search?query=GitHub) to take your pick from.

## Contributing

Discussions, issues, and pull requests are more than welcome! I'm happy to extend the functionality of this library, with respect to the features listed in the [Out of Scope](#out-of-scope) section.

If opening a pull request, please ensure that the package retains 100% code coverage.

## Credits

Special thanks to [@boiarqin](https://github.com/boiarqin) for providing me with an unforgettable repository name.

## License

This project is released under the MIT license. See [LICENSE](/LICENSE) for details.
