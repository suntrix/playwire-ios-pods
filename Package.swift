// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "PlaywireSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Playwire",
            targets: ["_Playwire"]
        ),
        .library(
            name: "Playwire_Coppa",
            targets: ["_Playwire_Coppa"]
        ),
        .library(
            name: "Playwire_Total",
            targets: ["_Playwire_Total"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            name: "Firebase",
            url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks.git",
            .exact("10.11.0")
        ),
        .package(
            name: "AdsGlobalPackage",
            url: "https://github.com/bytedance/AdsGlobalPackage",
            .exact("5.2.0-release.6")
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "_Playwire",
            dependencies: [
                "Playwire",
                .product(name: "Google-Mobile-Ads-SDK", package: "Firebase"),
                .product(name: "FirebaseAnalytics", package: "Firebase")
            ],
            path: "Sources/_Playwire"
        ),
        .target(
            name: "_Playwire_Coppa",
            dependencies: [
                "_Playwire",
                "Playwire_COPPA",
                "_GoogleMobileAdsMediationAdColony",
                "_GoogleMobileAdsMediationChartboost",
                "_GoogleMobileAdsMediationInMobi",
                "_GoogleMobileAdsMediationIronSource",
                "_GoogleMobileAdsMediationVungle"
            ],
            path: "Sources/_Playwire_Coppa"
        ),
        .target(
            name: "_Playwire_Total",
            dependencies: [
                "_Playwire_Coppa",
                "Playwire_NonCOPPA",
                "PrebidMobile",
                "_AmazonPublisherServicesSDK",
                "_GoogleMobileAdsMediationFyber",
                "GoogleMobileAdsMediationPangle",
                .product(name: "AdsGlobalPackage", package: "AdsGlobalPackage"),
                "_GoogleMobileAdsMediationAppLovin"
            ],
            path: "Sources/_Playwire_Total"
        ),


        .target(
            name: "_GoogleMobileAdsMediationAdColony",
            dependencies: [
                "GoogleMobileAdsMediationAdColony",
                "_AdColony"
            ],
            path: "Sources/_GoogleMobileAdsMediationAdColony"
        ),
        .target(
            name: "_AdColony",
            dependencies: [
                "AdColony"
            ],
            path: "Sources/_AdColony",
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("JavaScriptCore"),
                .linkedFramework("MessageUI"),
                .linkedFramework("CoreServices"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("SafariServices"),
                .linkedLibrary("z"),
                .linkedLibrary("sqlite3")
            ]
        ),

        .target(
            name: "_GoogleMobileAdsMediationChartboost",
            dependencies: [
                "GoogleMobileAdsMediationChartboost",
                "_ChartboostSDK"
            ],
            path: "Sources/_GoogleMobileAdsMediationChartboost"
        ),
        .target(
            name: "_ChartboostSDK",
            dependencies: [
                "ChartboostSDK"
            ],
            path: "Sources/_ChartboostSDK",
            resources: [.copy("ChartboostSDKResources.bundle")],
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("StoreKit"),
                .linkedFramework("Foundation"),
                .linkedFramework("UIKit"),
                .linkedFramework("WebKit"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("SafariServices"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("AppTrackingTransparency"),
                .unsafeFlags(["-ObjC"])
            ]
        ),

        .target(
            name: "_GoogleMobileAdsMediationInMobi",
            dependencies: [
                "GoogleMobileAdsMediationInMobi",
                "_InMobiSDK-Swift"
            ],
            path: "Sources/_GoogleMobileAdsMediationInMobi"
        ),
        .target(
            name: "_InMobiSDK-Swift",
            dependencies: [
                "InMobiSDK-Swift"
            ],
            path: "Sources/_InMobiSDK-Swift",
            linkerSettings: [
                .linkedFramework("WebKit"),
                .linkedLibrary("sqlite3.0"),
                .unsafeFlags(["-ObjC"])
            ]
        ),

        .target(
            name: "_GoogleMobileAdsMediationIronSource",
            dependencies: [
                "GoogleMobileAdsMediationIronSource",
                "_IronSourceSDK"
            ],
            path: "Sources/_GoogleMobileAdsMediationIronSource"
        ),
        .target(
            name: "_IronSourceSDK",
            dependencies: [
                "IronSourceSDK"
            ],
            path: "Sources/_IronSourceSDK",
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("Foundation"),
                .linkedFramework("MobileCoreServices"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("Security"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedLibrary("z"),
                .unsafeFlags(["-ObjC"])
            ]
        ),

        .target(
            name: "_GoogleMobileAdsMediationVungle",
            dependencies: [
                "GoogleMobileAdsMediationVungle",
                "_VungleSDK-iOS"
            ],
            path: "Sources/_GoogleMobileAdsMediationVungle"
        ),
        .target(
            name: "_VungleSDK-iOS",
            dependencies: [
                "VungleSDK-iOS"
            ],
            path: "Sources/_VungleSDK-iOS",
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("MediaPlayer"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("WebKit"),
                .linkedFramework("UIKit"),
                .linkedFramework("Foundation"),
                .linkedLibrary("z"),
                .unsafeFlags(["-ObjC"])
            ]
        ),

        .target(
            name: "_AmazonPublisherServicesSDK",
            dependencies: [
                "APSAdMobAdapter",
                "DTBiOSSDK"
            ],
            path: "Sources/_AmazonPublisherServicesSDK",
            linkerSettings: [
                .linkedFramework("CoreLocation"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("MediaPlayer"),
                .linkedFramework("StoreKit"),
                .linkedFramework("QuartzCore")
            ]
        ),

        .target(
            name: "_GoogleMobileAdsMediationFyber",
            dependencies: [
                "GoogleMobileAdsMediationFyber",
                "Fyber_Marketplace_SDK"
            ],
            path: "Sources/_GoogleMobileAdsMediationFyber"
        ),
        .target(
            name: "_Fyber_Marketplace_SDK",
            dependencies: [
                "Fyber_Marketplace_SDK"
            ],
            path: "Sources/_Fyber_Marketplace_SDK",
            linkerSettings: [
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("MediaPlayer"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("StoreKit"),
                .linkedFramework("AdSupport"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("WebKit"),
                .linkedLibrary("xml2.2")
            ]
        ),

        .target(
            name: "_GoogleMobileAdsMediationAppLovin",
            dependencies: [
                "GoogleMobileAdsMediationAppLovin",
                "AppLovinSDK"
            ],
            path: "Sources/_GoogleMobileAdsMediationAppLovin"
        ),
        .target(
            name: "_AppLovinSDK",
            dependencies: [
                "AppLovinSDK"
            ],
            path: "Sources/_Fyber_Marketplace_SDK",
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("MessageUI"),
                .linkedFramework("SafariServices"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("WebKit"),
                .linkedLibrary("z"),
                .unsafeFlags(["-ObjC"])
            ]
        ),


        .binaryTarget(
            name: "Playwire",
            path: "sdks/Playwire.xcframework"
        ),
        .binaryTarget(
            name: "Playwire_COPPA",
            path: "sdks/Playwire_COPPA.xcframework"
        ),
        .binaryTarget(
            name: "Playwire_NonCOPPA",
            path: "sdks/Playwire_NonCOPPA.xcframework"
        ),
        .binaryTarget(
            name: "PrebidMobile",
            path: "sdks/PrebidMobile.xcframework"
        ),

        .binaryTarget(
            name: "GoogleMobileAdsMediationAdColony",
            url: "https://dl.google.com/googleadmobadssdk/mediation/ios/adcolony/AdColonyAdapter-4.9.0.2.zip",
            checksum: "4a3a4c6b5cb550482b629edb8caec61108f9ed598d1dde65ca33a097f4fdfa8c"
        ),
        .binaryTarget(
            name: "AdColony",
            url: "https://github.com/AdColony/AdColony-iOS-SDK/archive/refs/tags/v4.9.0.zip",
            checksum: "406f90dec5f290fb577267a886a8c010d6624158f9ae0e3fb3aa8ef9e8e5d2ae"
        ),

        .binaryTarget(
            name: "GoogleMobileAdsMediationChartboost",
            url: "https://dl.google.com/googleadmobadssdk/mediation/ios/chartboost/ChartboostAdapter-9.3.0.0.zip",
            checksum: "2ae1aea1893d21c9beac45a0b8bef4c87a4fe77e80b76a3fb3f1d679335ce483"
        ),
        .binaryTarget(
            name: "ChartboostSDK",
            path: "dependencies/Chartboost-iOS-9.3.0/ChartboostSDK.xcframework"
        ),

        .binaryTarget(
            name: "GoogleMobileAdsMediationInMobi",
            url: "https://dl.google.com/googleadmobadssdk/mediation/ios/inmobi/InMobiAdapter-10.5.4.0.zip",
            checksum: "abdf3696194119d9ac242fb41bf0ed72361b22861d81bf1694a7baabef1b9733"
        ),
        .binaryTarget(
            name: "InMobiSDK-Swift",
            url: "https://dl.inmobi.com/inmobi-sdk/IM/InMobi-iOS-SDK-10.5.4.zip",
            checksum: "f47e1165811c03de1c93dee72635a90cf72b349a0450ef6ebf0ce3d5ac75846b"
        ),

        .binaryTarget(
            name: "GoogleMobileAdsMediationIronSource",
            url: "https://dl.google.com/googleadmobadssdk/mediation/ios/ironsource/IronSourceAdapter-7.3.0.0.0.zip",
            checksum: "d4401ba70453a80ea9d9117d87c211b3deab2f91f9d2062bb0ac602f605b08ad"
        ),
        .binaryTarget(
            name: "IronSourceSDK",
            url: "https://raw.githubusercontent.com/ironsource-mobile/iOS-sdk/master/7.3.0/IronSource7.3.0.zip",
            checksum: "f8af8ab477ae2019eb8482b8307a5db747775141320005b5295cabd410572ae0"
        ),

        .binaryTarget(
            name: "GoogleMobileAdsMediationVungle",
            url: "https://dl.google.com/googleadmobadssdk/mediation/ios/vungle/VungleAdapter-6.12.3.0.zip",
            checksum: "227846be7e66a4dc3b53eb614aa36139c008ea2664760de15826cd6bb736b87f"
        ),
        .binaryTarget(
            name: "VungleSDK-iOS",
            path: "dependencies/VungleSDK-iOS-6.12.3/VungleSDK.xcframework"
        ),

        .binaryTarget(
            name: "APSAdMobAdapter",
            path: "dependencies/APS_iOS_SDK-4.7.1/APSAdMobAdapter.xcframework"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            path: "dependencies/APS_iOS_SDK-4.7.1/DTBiOSSDK.xcframework"
        ),

        .binaryTarget(
            name: "GoogleMobileAdsMediationFyber",
            url: "https://dl.google.com/googleadmobadssdk/mediation/ios/dtexchange/DTExchangeAdapter-8.2.1.0.zip",
            checksum: "a633ba032f61b9d84b6b8fdf9fa5c2870948a2887095b4830a31f7bd98c84f26"
        ),
        .binaryTarget(
            name: "Fyber_Marketplace_SDK",
            url: "https://github.com/inner-active/InneractiveAdSDK-iOS/archive/refs/heads/8.2.1.zip",
            checksum: "eb497900558fc273616d5e0ae189f1acfc24a1331062da1a5c85cd52b32508cd"
        ),

        .binaryTarget(
            name: "GoogleMobileAdsMediationPangle",
            url: "https://dl.google.com/googleadmobadssdk/mediation/ios/pangle/PangleAdapter-5.1.1.0.0.zip",
            checksum: "d5ec299bcf25cb210db3af406be738cd40f2fa8e11fa0a4109d27353178d550f"
        ),

        .binaryTarget(
            name: "GoogleMobileAdsMediationAppLovin",
            url: "https://dl.google.com/googleadmobadssdk/mediation/ios/applovin/AppLovinAdapter-11.9.0.0.zip",
            checksum: "cb9c4fabb24cda63394e5de05bea5aa73c684923e453cfdd0d4cef18e1aed081"
        ),
        .binaryTarget(
            name: "AppLovinSDK",
            url: "https://artifacts.applovin.com/ios/com/applovin/applovin-sdk/applovin-ios-sdk-11.9.0.zip",
            checksum: "0fc13c7b760b96a879aef234cf5894c3e5865ddf0a5152f4b94e5ca9737fd672"
        ),
    ]
)
