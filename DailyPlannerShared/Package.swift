// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DailyPlannerShared",
    platforms: [
        .iOS(.v17),     // Changed from .v26 to .v17
        .watchOS(.v10)  // Changed from .v26 to .v10
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DailyPlannerShared",
            targets: ["DailyPlannerShared"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DailyPlannerShared"
        ),
        .testTarget(
            name: "DailyPlannerSharedTests",
            dependencies: ["DailyPlannerShared"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
