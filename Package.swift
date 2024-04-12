// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TabBar",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "TabBar",
            targets: ["TabBar"]
        )
    ],
    targets: [
        .target(name: "TabBar")
    ]
)
