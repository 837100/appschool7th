import ProjectDescription

let bundleId = "kr.co.sg.837100.HelloTuist"

let appTarget = Target.target(
    name: "HelloTuist",
    destinations: .iOS,
    product: .app,
    bundleId: "bundleId",
    infoPlist: .extendingDefault(
        with: [
            "UILaunchScreen": [
                "UIColorName": "",
                "UIImageName": "",
            ],
        ]
    ),
    sources: ["HelloTuist/Sources/**"],
    resources: ["HelloTuist/Resources/**"],
    dependencies: [
        .target(name: "ProductFeature"),
    ]
)

let testTarget = Target.target(
    name: "HelloTuistTests",
    destinations: .iOS,
    product: .unitTests,
    bundleId: "io.tuist.HelloTuistTests",
    infoPlist: .default,
    sources: ["HelloTuist/Tests/**"],
    resources: [],
    dependencies: [.target(name: "HelloTuist")]
)

// MARK: Modules
let productFeatureModule = Target.target(
    name: "ProductFeature",
    destinations: .iOS,
    product: .framework,
    bundleId: "\(bundleId).ProductFeature",
    infoPlist: .default,
    sources: ["Modules/ProductFeature/Sources/**"],
    dependencies: [ .target(name: "Network")])

let networkModule = Target.target(
    name: "Network",
    destinations: .iOS,
    product: .framework,
    bundleId: "\(bundleId).Network",
    infoPlist: .default,
    sources: ["Modules/Network/Sources/**"],
    dependencies: [.package(product: "Alamofire"),] )

let networkTests = Target.target(
    name: "NetworkTests",
    destinations: .iOS,
    product: .unitTests,
    bundleId: "\(bundleId).NetworkTests",
    infoPlist: .default,
    sources: ["Modules/Network/Tests/**"],
    dependencies: [.target(name: "Network"),] )

let project = Project(
    name: "HelloTuist",
    targets: [
        appTarget,
        testTarget,
        productFeatureModule,
        networkModule,
        networkTests
    ]
)
