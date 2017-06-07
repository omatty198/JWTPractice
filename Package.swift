// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "JWTPractice",
    targets: [],
    dependencies: [
		  .Package(url: "https://github.com/vapor/jwt.git", majorVersion: 1)
    ]

)
