// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-rfc-3986",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11)
    ],
    products: [
        .library(
            name: "RFC 3986",
            targets: ["RFC 3986"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-standards", from: "0.1.0"),
        .package(path: "../swift-incits-4-1986")
    ],
    targets: [
        .target(
            name: "RFC 3986",
            dependencies: [
                .product(name: "Standards", package: "swift-standards"),
                .product(name: "INCITS 4 1986", package: "swift-incits-4-1986")
            ]
        ),
        .testTarget(
            name: "RFC 3986 Tests",
            dependencies: ["RFC 3986"]
        )
    ]
)

for target in package.targets {
    target.swiftSettings?.append(
        contentsOf: [
            .enableUpcomingFeature("MemberImportVisibility")
        ]
    )
}
