// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SocketRocket",
    platforms: [
        .iOS("11.0"),
        .macOS("10.13"),
        .tvOS("11.0")
    ],
    products: [
        .library(
            name: "SocketRocket",
            targets: ["SocketRocket"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SocketRocket",
            path: "SocketRocket",
            exclude: [],
            sources: ["."],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                .define("USE_ICU_CORE", to: "1")
            ],
            linkerSettings: [
                .linkedFramework("CFNetwork", .when(platforms: [.iOS, .tvOS])),
                .linkedFramework("Security"),
                .linkedFramework("CoreServices", .when(platforms: [.macOS])),
                .linkedLibrary("icucore")
            ]
        )
    ]
)
