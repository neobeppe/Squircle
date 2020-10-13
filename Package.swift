// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Squircle",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "Squircle", targets: ["Squircle"]),
    ],
    targets: [
        .target(
            name: "Squircle",
            path: "Squircle"),
    ]
)
