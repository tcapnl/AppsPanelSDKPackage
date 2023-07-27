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
            targets: ["AppsPanelSDK"]
        )
    ],
    dependencies: [
        .package(name: "Alamofire", url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0")),
        .package(name: "KeychainAccess", url: "https://github.com/kishikawakatsumi/KeychainAccess.git", from: "4.0.0"),
        .package(name: "Swift-JWT", url: "https://github.com/Kitura/Swift-JWT.git", .upToNextMinor(from: "3.6.200"))
    ],
    targets: [
            
            .target(
                name: "AppsPanelSDK",
                dependencies: [
                                "Alamofire",
                                "KeychainAccess",
                               .product(name: "SwiftJWT", package: "Swift-JWT")],
                path: ".",
                sources: [
                    "Sources/Test.swift"
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
                dependencies: ["AppsPanelSDK"]
            ),
        ]
)
