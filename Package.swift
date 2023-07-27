// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "AppsPanelSDK",
    products: [
//        .library(
//            name: "AppsPanelSDKv5",
//            targets: ["AppsPanelSDKv5"]
//        ),
        .library(
            name: "AppsPanelSDK",
            targets: ["AppsPanelSDKWrapper"]
        )
    ],
    dependencies: [
        .package(name: "Alamofire", url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0")),
        .package(name: "KeychainAccess", url: "https://github.com/kishikawakatsumi/KeychainAccess.git", from: "4.0.0"),
        .package(name: "Swift-JWT", url: "https://github.com/Kitura/Swift-JWT.git", .upToNextMinor(from: "3.6.200"))
    ],
    targets: [
            .binaryTarget(
                name: "AppsPanelSDK",
                url: "https://github.com/aoapnl/AppsPanelSDKPackage/releases/download/5.3.2/AppsPanelSDK.xcframework.zip",
                checksum: "5840d848a4541f46513ed7bfdffb33e7e5545afb922c3f1d486f6f19f08edf9f"
            ),
            .target(
                name: "AppsPanelSDKWrapper",
                dependencies: [.target(name: "AppsPanelSDK"),
                               "Alamofire",
                               .product(name: "KeychainAccess", package: "KeychainAccess"),
                               .product(name: "SwiftJWT", package: "Swift-JWT")],
                path: ".",
                sources: [
                    "Sources/Test.swift"
                ],
                swiftSettings: [
                        .unsafeFlags(["-target", "arm64-apple-ios11.0"]),  // Ceci spécifie la version minimum d'iOS pour ce target spécifique
                    ]
            ),
    //        .target(
    //            name: "AppsPanelSDKv5",
    //            dependencies: ["AppsPanelSDK"],
    //            path: ".",
    //            sources: [
    //                "Sources/Test.swift"
    //            ]
    //        ),
            .testTarget(
                name: "AppsPanelSDKTests",
                dependencies: ["AppsPanelSDKWrapper"]
            ),
        ]
)
