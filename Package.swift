// swift-tools-version: 6.2

import PackageDescription

extension String {
    static let rfc3492: Self = "RFC 3492"
}

extension Target.Dependency {
    static var rfc3492: Self { .target(name: .rfc3492) }
}

let package = Package(
    name: "swift-rfc-3492",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11)
    ],
    products: [
        .library(
            name: .rfc3492,
            targets: [.rfc3492]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: .rfc3492,
            dependencies: []
        ),
        .testTarget(
            name: .rfc3492.tests,
            dependencies: [.rfc3492]
        ),
    ],
    swiftLanguageModes: [.v6]
)

extension String {
    var tests: Self { self + " Tests" }
}

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    let existing = target.swiftSettings ?? []
    target.swiftSettings = existing + [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility")
    ]
}
