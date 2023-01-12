// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "GoatHerb",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(name: "GoatHerb", targets: ["GoatHerb"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-kipple/Diagnostics", .upToNextMinor(from: "0.2.0")),
        .package(url: "https://github.com/swift-kipple/Networking", .upToNextMinor(from: "0.3.0")),
    ],
    targets: [
        // Product Targets
        .target(
            name: "GoatHerb",
            dependencies: [
                .product(name: "KippleDiagnostics", package: "Diagnostics"),
                .product(name: "KippleNetworking", package: "Networking"),
            ]
        ),
        // Test Targets
        .testTarget(
            name: "GoatHerbTests",
            dependencies: [
                .target(name: "GoatHerb"),
            ]
        ),
    ]
)