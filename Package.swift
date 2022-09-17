// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LimitedOrderedSet",
    products: [
        .library(
            name: "LimitedOrderedSet",
            targets: ["LimitedOrderedSet"]),
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-collections", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "LimitedOrderedSet",
            dependencies: [.product(name: "OrderedCollections", package: "swift-collections")]),
        .testTarget(
            name: "LimitedOrderedSetTests",
            dependencies: ["LimitedOrderedSet"]),
    ]
)
