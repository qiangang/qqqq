// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Taleo_General",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Taleo_General",
            targets: ["Taleo_General"]),
    ],
    dependencies: [
        // 在这里重新添加你之前的第三方依赖
        .package(path: "/Users/admin/Desktop/Tale/Taleoops/Package_net/myNetTool"),
        .package(url: "https://github.com/AgoraIO/AgoraRtcEngine_iOS.git", .exact("4.3.0")),
        .package(url: "https://github.com/rongcloud/RongCloudIM-iOS", .exact("5.24.2")),
        .package(url: "https://github.com/SnapKit/SnapKit.git", .exact("5.7.1")),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Taleo_General",
            dependencies: [
                .product(name: "Package_net", package: "myNetTool"),
                .product(name: "RtcBasic", package: "AgoraRtcEngine_iOS"),
                .product(name: "IMLibCore", package: "RongCloudIM-iOS"),
                .product(name: "SnapKit", package: "SnapKit"),
            ],
            resources: [
                .process("PPP_generalXibs_PPP"),
            ]
        )
    ],
    swiftLanguageModes: [.v5]
)
