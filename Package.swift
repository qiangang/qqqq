// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "dddddddd",
    
    platforms: [
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "dddddddd",
            targets: ["dddddddd"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/AgoraIO/AgoraRtcEngine_iOS.git", .upToNextMajor(from: "4.6.0")),
        
//        .package(url: "https://github.com/AgoraIO/AgoraRtm_Apple.git", branch: "2.2.5_lite"),
//        .package(url: "https://github.com/AgoraIO/AgoraRtm_Apple.git", .upToNextMajor(from: "2.2.4")),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "dddddddd",
            dependencies: [
//                .product(name: "Alamofire", package: "Alamofire"),
//                .product(name: "SDWebImage", package: "SDWebImage"),
//                .product(name: "CryptoSwift", package: "CryptoSwift"),
            ]
        )
    ]
)
