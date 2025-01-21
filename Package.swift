// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SwiftCExportTest",
    
    products: [
        .library(
            name: "SwiftCExportTest",
//            type: .dynamic,
            targets: [ "SwiftCExportTest" ]
        ),
        
        .executable(name: "CDemo",
                    targets: [ "CDemo" ])
    ],
    
    targets: [
        .target(
            name: "CDefinitions"
        ),
        
        .target(
            name: "SwiftCExportTest",
            dependencies: [ "CDefinitions" ]
        ),
        
        .executableTarget(name: "CDemo",
                          dependencies: [ "SwiftCExportTest", "CDefinitions" ]),
        
        .testTarget(
            name: "SwiftTests",
            dependencies: [ "SwiftCExportTest" ]
        ),
        
        .testTarget(
            name: "CTests",
            dependencies: [ "SwiftCExportTest" ]
        )
    ]
)
