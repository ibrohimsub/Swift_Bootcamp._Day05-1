// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day05",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
       .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
    ],
    targets: [
        .executableTarget(
            name: "Day05",
            dependencies: []),
        .executableTarget(
            name: "ex01",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
            ]),
        .executableTarget(
            name: "ex02",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
            ]),
        .executableTarget(
            name: "ex03",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
            ]),
        .executableTarget(
            name: "ex04",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
            ]),
        .executableTarget(
            name: "ex05",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
            ]),
        .executableTarget(
            name: "ex06",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
            ]),
        .executableTarget(
            name: "ex07",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
            ]),
        .executableTarget(
            name: "ex08",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
            ]),
        .executableTarget(
            name: "ex09",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
            ]),
        .executableTarget(
            name: "ex10",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
            ]),
        .testTarget(
            name: "Day05Tests",
            dependencies: ["Day05"]),
    ]
)
