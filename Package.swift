// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "RKExtensions",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "RKExtensions",
            targets: ["RKExtensions"]),
    ],
    targets: [
        .target(
            name: "RKExtensions",
            dependencies: []),
        .testTarget(
            name: "RKExtensionsTests",
            dependencies: ["RKExtensions"]),
    ]
)
