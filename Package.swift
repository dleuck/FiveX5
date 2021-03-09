// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "FiveX5",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13)
    ],
    products: [
        .library(
            name: "FiveX5",
            targets: ["FiveX5"]),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
        // .package(url: "https://github.com/dleuck/KiCore.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "FiveX5",
            dependencies: []),
            // dependencies: ["KiCore"]),
        .testTarget(
            name: "FiveX5Tests",
            dependencies: ["FiveX5"]),
    ]
)
