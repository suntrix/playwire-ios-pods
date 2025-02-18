iOS Change Log
==============

Version 9.3.0 *(2023-5-4)*
----------------------------
Improvements:
- Added support for Open Measurement SDK.

Notes:
- Includes new ChartboostSDKResources.bundle.


Version 9.2.0 *(2023-1-9)*
----------------------------
Improvements:
- Enabled bidding.
- Internal improvements.
- Removed setMuted method from public API.
- Product custom pages Support for SKAdNetwork attributions.
- Support SKAdNetwork 4.0.

Notes:
- Xcode 14.1 required.


Version 9.1.0 *(2022-9-22)*
----------------------------
Improvements:
- Added support for SKOverlay.
- Added support to SKAdNetwork attributions using SKOverlay.
- Update user agent right after we detect the OS changed.
- Loading the SKStoreProductViewController, improved presentation latency for App Store App Sheet.
- Added support for auto displaying the App Store App Sheet when a video ad transitions to the end card.

Fixes:
- Fixed closing the App Store App Sheet while is loading, made the app unresponsive.


Version 9.0.0 *(2022-5-25)*
----------------------------
Improvements:
- Updated SDK packaging to xcframework.
- Added new data use consent APIs for COPPA and LGPD law compliance.
- Modified startWithAppID:appSignature:completion: method to return an error in its completion instead of a boolean. Be sure to update your implementation of this completion since your logic may now be reversed.
- Showing an ad now requires a non-null UIViewController to be passed.
- Added clearCache method to all ad types.
- Added didRecordImpression: method to CHBAdDelegate. It should be used instead of didShowAd:error: to identify when an impression is to be tracked.
- Removed banner auto-refresh functionality. Auto-refresh should be handled on the mediation layer.
- Removed banner implicit load when showing a non-cached ad functionality. Banners now behave same as interstitial and rewarded ads: a show request without a prior successful cache will fail.
- Improved error objects to inherit from NSError. They now can be passed as NSError arguments without any translation.
- Modified mediation API to take a string mediation name instead of an enum case.

Fixes:
- Fixed user agent string sent on ad requests could have unexpected values on certain iPads.
- Fixed handling of edge cases for SKAN view-through ad impressions on iOS 15.
- Fixed minor visual glitch when presenting ads under certain conditions.

Notes:
- Chartboost SDK now uses Swift. Its module and umbrella header have been renamed to "ChartboostSDK".
- Removed support for ARMv7s architecture.
- Removed deprecated methods.
- Removed predefined location constants.


Version 8.5.0 *(2021-6-7)*
----------------------------
Improvements:
- Internal improvements on video caching.

Fixes:
- Fixed issue that would in some cases cause a crash when accessing system APIs.


Version 8.4.2 *(2021-5-1)*
----------------------------
Improvements:
- Added support for SKAdNetwork 2.2.
- Internal improvements.


Version 8.4.1 *(2021-2-12)*
----------------------------
Improvements:
- Internal improvements.


Version 8.4.0 *(2020-11-27)*
----------------------------
Improvements:
- Added `adID` to events passed in ad delegate methods. It uniquely identifies an ad.

Fixes:
- Fixed threading-related crash when accessing some system APIs.
- Prevented crashes when running on unsupported OS versions. Chartboost method calls will just be ignored.


Version 8.3.1 *(2020-9-14)*
----------------------------
Improvements:
- Added support for iOS 14 and SKAdNetwork.
    - Apps should register Chartboost network ID plus additional network IDs in their Info.plist file
    - More info on [Chartboost help](https://answers.chartboost.com/en-us/child_article/ios).

Fixes:
- Solved issue where setting the logging level to verbose as the first method call would cause a crash.

Notes:
- The minimum supported version is now iOS 10.0


Version 8.2.1 *(2020-8-10)*
----------------------------
- Internal improvements.


Version 8.2.0 *(2020-6-2)*
----------------------------
Improvements:
- Added new data use consent API with CCPA compliance support.
- The `didShowAd:error:` ad delegate method is now called only once for `CHBInterstitial` and `CHBRewarded` ads. If some error happens after the ad is presented, it will be reported through a new property in the event passed on the `didDismissAd:` delegate callback.
- The `didEarnReward:` delegate callback is now called before a rewarded ad is dismissed due to some error. Note that it won't be called if the ad presentation fails (`didShowAd:error:` is called with an error). 
- Added support for backend-side ad muting.
- The `setMuted:` method now works both before and after the SDK is started.

Fixes:
- Solved issue where showing the AppStore sheet on click would silently dismiss an ad. AppStore sheet is now enabled again.
- Device user agent field sent in API requests is now always up to date.
- Solved Reachability issues that in some cases would cause a crash.
- Solved banner issues that in some cases would cause a crash.
- Prevented unnecessary API requests when the SDK is started.

Notes:
- Removed `restrictDataCollection:` method.
- Deprecated `getPIDataUseConsent` and `setPIDataUseConsent:`.


Version 8.1.0 *(2020-1-30)*
----------------------------
Improvements:
- New API for interstitial and rewarded ads: `CHBInterstitial` and `CHBRewarded`. Chartboost can now be used via multiple mediations in the same app, as long as they use these new APIs. Every ad has now its own delegate, and will hide the status bar automatically when shown if View Controller-based status bar appearance is enabled.
- New `startWithAppId:appSignature:completion:` SDK initialization method.
- SDK initialization is now immediate in most cases (for both the new and the deprecated initialization methods).
- New APIs for caching an ad using a Chartboost OpenRTB bid response.

Fixes:
- If an ad is automatically dismissed right after clicked, the `didClick` delegate method is called before `didDismiss` now.

Notes:
- Deprecated `ChartboostDelegate`, `startWithAppId:appSignature:delegate:`, `isAnyViewVisible`, `hasInterstitial:`, `hasRewardedVideo:`, `cacheInterstitial:`, `showInterstitial:`, `cacheRewardedVideo:`, `showRewardedVideo:`, `setDelegate:`, `didPassAgeGate:`, `handleOpenURL:sourceApplication:`, `handleOpenURL:sourceApplication:annotation:`, `setShouldRequestInterstitialsInFirstSession:`, `setShouldPauseClickForConfirmation:`, `setAutoCacheAds:`, `getAutoCacheAds`.


Version 8.0.4 *(2019-11-27)*
----------------------------
Fixes:
- Fixed bug that would cause a crash when a banner was being removed in certain situations.


Version 8.0.3 *(2019-10-29)*
----------------------------
Improvements:
- Improved compatibility with iOS 13.
- Removed usage of UIWebView.
- Removed support for MOAT.
- Added `MAX` and `Fairbid` to the list of predefined `CBMediation` values. 

Notes:
- This version does no longer support iOS 8.


Version 8.0.1 *(2019-7-16)*
----------------------------
This version brings all the new features from 8.0.0, including banners, plus some bug fixes and improvements.


Version 8.0 *(2019-6-10)*
----------------------------

Improvements:
- New banner ad type. More info on [Chartboost help](https://answers.chartboost.com/en-us/child_article/ios).
- Updated logging. Logs are now more descriptive and better distributed by logging level.

Fixes:
- ChartboostDelegate `didInitialize:(BOOL)status` method now called only once after SDK initialization, either in case of success or failure. 

Notes:
- Deprecated `cacheInPlay:`, `hasInPlay:` and `getInPlay:`.

Version 7.5 *(2019-4-4)*
----------------------------
Improvements:
- Updated `setMediation:withVersion:` method to include a third parameter `adapterVersion`.
- Ad dismiss after click behavior is now defined by the backend. Currently ads won't be dismissed with some exceptions for playables.
Fixes:
- Clicks that show the App Store app sheet will now get properly attributed.
Notes:
- Deprecated `setStatusBarBehavior:`.

Version 7.3.1 *(2019-2-25)*
----------------------------
Fixes:
- setMuted: now works as expected.
- Resolved potential crash when changing the mute setting.

Version 7.3.0 *(2018-9-07)*
----------------------------
Improvements:
- Improved GDPR handling.

Fixes:
- startWithAppId can now reccover from failed initialization.
- didFailToLoad delegate will now be called in the event of CBLoadErrorInternetUnavailable error.

Notes:
- New API for handling GDPR + (void)setPIDataUseConsent:(CBPIDataUseConsent)consent;
- API restrictDataCollection has been deprecated.

Version 7.2.0 *(2018-5-01)*
----------------------------
Improvements:
- Improved appsheet behavior for smoother UX.
- Added restrictDataCollection method to support GDPR requirements.
- Added setMuted method to sync Chartboost ad mute status with in-game mute capability.

Notes:
- To enable GDPR data collection restrictions, call the restrictDataCollection method with the appropriate value for users who are EU Data Subjects. This method should be called before startWithAppId.
- AVFoundation is now a required framework.
- Xcode 8.x has been deprecated. Sorry, we cannot support Xcode versions below 9.0.

Version 7.1.2 *(2018-3-6)*
----------------------------
Improvements:
- SDK no longer collects IDFV.

Fixes:
- Resolved potential crash with Unity 2017.

Notes:
- Xcode 8.x is being deprecated. Sorry, we cannot support Xcode versions below 9.0 in future SDK releases.

Version 7.1.1 *(2018-2-23)*
----------------------------
Improvements:
- Better handling of iPhone X unsafe areas. Ads will now be letterboxed in black.

Fixes:
- All first ads shown by Chartboost now respect the mute switch.
- didDismissInterstital/Rewarded is no longer called when shouldDisplayIntertitial/Rewarded delegate returns NO.

Notes:
- Xcode 8.x is being deprecated. Sorry, we cannot support Xcode versions below 9.0 in future SDK releases.

Version 7.1.0 *(2018-2-6)*
----------------------------
Improvements:
- Enabled Moat viewability technology to allow serving of brand-based ads.
- Added more examples of delegate callbacks in the Example App.

Fixes:
- Fixed rare crash involving Reachability.
- Fixed rare crash involving DisplayManger.
- App Sheet now displays properly.

Notes:
- Added CHAMoatMobileAppKit.framework to project along with Chartboost.framework to enable brand ad support.

Version 7.0.4 *(2017-11-15)*
----------------------------
Fixes:
- Completed view events now fire properly for rewarded video.
- Fixed missing iTunes ID issue.
- Fixed rare configuration issue.

Version 7.0.3 *(2017-10-27)*
----------------------------
Fixes:
- didCloseInterstitial delegate now fires when ad is closed.
- didCloseRewardedVideo delegate now fires when ad is closed. 
- didDismissInterstitial delegate now fires when ad is removed from UI.
- didDismissRewardedVideo delegate now fires when ad is removed from UI. 
- Fixed issue that prevented clicks while age gate is enabled.

Version 7.0.2 *(2017-10-20)*
----------------------------
Improvements:
- Completed ads are now dismissed when the user clicks through.
- Added comment for custom age gate.
- Users can now download assets into arbitrary sub-directories.
- Added CBLoadErrorInternetUnavailableAtShow.

Fixes:
- Impression trackers now fire for Exchange ads.
- SDK now sends mediation values.
- Devices running below iOS 10 now use UIWebView.
- Stale assets are now deleted.
- Fixed deadlock issue with click delivery.
- Fixed multitasking mode on the iPad in iOS 11.

Notes:
- iOS 7 is no longer supported.
- WebKit is now a required framework.

Version 7.0.1 *(2017-09-14)*
----------------------------
Improvements:
- iOS 9+ ads now use WKWebView instead of UIWebView for better performance and memory usage.
- Any UIView-based object can be used as a custom age gate screen.
- SDK has been tested with iOS 11.
- SDK is compiled with Xcode 9 GM.

Fixes:
- Ad unit will pause for age gate.
- Improved cache size reduction.
- Added UIKit import to Chartboost.h
- Fixed compatibility issue between some exchange ads and WKWebView.
- Fixed thread watchdog issue.

Notes:
- Dropped support for iOS 7.
- WebKit is now a required framework.

Version 7.0.0 *(2017-08-30)*
----------------------------
SDK 7.0.0 is a major release that focuses on quality and stability while adding several new features.

API Changes
- Removed MoreApps support and deprecated API methods.
- hasMoreApps: will now return false.
- cacheMoreApps: is no-op.
- showMoreApps: is no-op.
- Added willDisplayInterstitial delegate.

Fixes
- iOS Runtime Exception: NSUserDefaults.
- Added clearer ad server messaging.
- Removed all instances of method swizzling.

Improvements
- Rewrote Ad Unit State Manager and Download Manager.
- Implemented better support for Exchange ads.
- Implemented better support for interactive ads.
- Improved prefetch.
- Decreased size of Chartboost Library.

Version 6.6.3 *(2017-05-01)*
----------------------------
Fixes:
- didCache and has delegates are no longer called when the ad is not ready to be displayed.
- Fixed timing issue where prefetch calls at bootup might negatively affect get calls.


Version 6.6.2 *(2017-03-02)*
----------------------------
Fixes & Improvements:
- No longer freezes after backgrounding when post-roll is shown.
- Removed MoreApps from Sample/Example project.
- Clarified ad server error messaging when no publisher campaigns are available.
- Modified NSUserDefaults category to resolve name-collisions with other SDKs.


Version 6.6.1 *(2017-01-04)*
----------------------------
Features:
- App Transport Security (ATS) added to Chartboost Example Project. ATS improves user security and privacy by requiring apps to use secure network connections over HTTPS.

Fixes & Improvements:
- Video no longer freezes when app is backgrounded.
- Reachability reports are more accurate.


Version 6.6.0 *(2016-11-03)*
----------------------------
Important:
- This library is built using Xcode 8 with bitcode enabled. In order to use it with prior versions of Xcode (including 7.3.1), bitcode must be disabled.
- iOS 6 is no longer supported. iOS 7.0 is the minimum supported iOS version.

*Features*
- Added support for AerServ.

*Fixes*
- Black background now remains when a video ad is playing.
- App no longer freezes when backgrounding after a video plays.
- MoreApps now respect the status bar app settings.

*Improvements*
- Improved the rendering performance when rotating an ad.


Version 6.5.1 *(2016-09-20)*
----------------------------
Important:
- iOS 6 is no longer supported. iOS 7.0 is the minimum supported iOS version.

*Fixes*
- Fixed bug that prevented MoreApps from showing.

Version 6.5.0 *(2016-09-12)*
----------------------------
Important:
- iOS 6 is no longer supported. iOS 7.0 is the minimum supported iOS version.

*Updates*
- Networking stack has been upgraded to AFNetworking 3.0.
- Added features to help support iOS changes to limit ad tracking.
- iOS 10 compatibility.
*Fixes*
- Fixed IFV reporting bug.
- Fixed bug that could retain a bad ad unit in the cache.
- Fixed bug that could send an inaccurate list of local videos to the server.
- Changed timeout for bad ad units to 3 seconds to avoid excessive loading bar wait time.

Version 6.4.7 *(2016-07-25)*
----------------------------
Fixes:
- Cache folders combined and various timing changes implemented to avoid possible issues with delivering impressions.
- Video file sizes are now checked during download and maintenance to prevent corruption.
- Framework file in the Example project has been replaced with a reference to the file in order to reduce download size.

Version 6.4.6 *(2016-06-22)*
----------------------------
- With this SDK we will begin rolling out a brand new Chartboost Video experience, tailored specially for games. Upgrade now!
- We've also improved key features like video caching, memory management, and data usage for optimal SDK performance.
- Various Bug Fixes

Version 6.4.4 *(2016-05-4)*
----------------------------
- With this SDK we will begin rolling out a brand new Chartboost Video experience, tailored specially for games. Upgrade now!
- We've also improved key features like video caching, memory management, and data usage for optimal SDK performance.
- Various Bug Fixes

Version 6.4.3 *(2016-03-31)*
----------------------------
- With this SDK we will begin rolling out a brand new Chartboost Video experience, tailored specially for games. Upgrade now!
- We've also improved key features like video caching, memory management, and data usage for optimal SDK performance.
- Various Bug Fixes
- This version is a variation of SDK version 6.4.0 for developers who need to build on older versions of Xcode. This SDK version does not have bitcode support.

Version 6.4.2 *(2016-03-31)*
----------------------------
- With this SDK we will begin rolling out a brand new Chartboost Video experience, tailored specially for games. Upgrade now!
- We've also improved key features like video caching, memory management, and data usage for optimal SDK performance.
- Various Bug Fixes

Version 6.4.1 *(2016-03-14)*
----------------------------
- With this SDK we will begin rolling out a brand new Chartboost Video experience, tailored specially for games. Upgrade now!
- We've also improved key features like video caching, memory management, and data usage for optimal SDK performance.
- This version is a variation of SDK version 6.4.0 for developers who need to build on older versions of Xcode. This SDK version does not have bitcode support.

Version 6.4.0 *(2016-03-14)*
----------------------------
- With this SDK we will begin rolling out a brand new Chartboost Video experience, tailored specially for games. Upgrade now!
- We've also improved key features like video caching, memory management, and data usage for optimal SDK performance.

*Features & Improvements:*
- Calls to 'cacheInterstitial' and 'cacheRewarded' have been optimized to require less memory.
- Interstitials will now fail gracefully instead of showing with missing assets.
- Added a retry mechanism for downloading failed assets.
- Closing the "loading" view has moved to the main thread.

*Fixes:*
- Updated documentation to use 'hasInterstitial' instead of 'hasCachedInterstitial.'

Version 6.3.1 *(2016-02-08)*
------------------------------
- Upgrade now to enable Chartboost's behind-the-scenes video optimization.
- This version is a variation of SDK version 6.3.0 for developers who need to build on older versions of Xcode. This SDK version does not have bitcode support.


Version 6.3.0 *(2016-02-08)*
------------------------------
- Upgrade now to enable Chartboost's behind-the-scenes video optimization.

*Improvements:*
- Certain network request failures no longer cause a crash.


Version 6.2.1 *(2016-01-18)*
----------------------------
Variation of 6.2.0 for developers needing to build on older versions of xcode. This SDK version does not have bitcode support.


Version 6.2.0 *(2016-01-18)*
----------------------------
Features:

- New method 'getSDKVersion' returns the current version of the Chartboost SDK.
- New method 'setDelegate' changes the Chartboost delegate object.
- New method 'setAutoIAPTracking' replaces the need to call trackInAppPurchaseEvent. If enabled, Chartboost will listen for purchase events

Improvements:

- Added imports to Foundation and UIKit in Chartboost.h.

Fixes:

- Fixed a crash when running with Address Sanitizer.
- Fixed an issue with a blank ad appearing if the device was rotated into an unsupported orientation.
- Fixed an issue where MoreApps or a blank screen would sometimes be displayed when attempting to show an interstitial ad.


Version 6.1.2 *(2015-11-20)*
----------------------------

Fixes:
- Fixed a crash on startup due to CoreData not being able to initialize. Happened most frequent if device was out of memory.


Version 6.1.1 *(2015-11-12)*
----------------------------
Variation of 6.1.0 for developers needing to build on older versions of xcode. This SDK version does not have bitcode support.


Version 6.1.0 *(2015-11-12)*
----------------------------

Improvements:

- Added support for iOS9 split screen mode.

- Added didInitialize delegate that is called when Chartboost has been initialized. Replaces didPrefetchVideo.

Fixes:

- Fixed a rare crash when reopening the application when an ad was just displayed.
- The delegate didPrefetchVideo is only called once.


Version 6.0.1 *(2015-10-13)*
----------------------------

Fixes:

- Calls to cacheInterstitial and cacheRewardedVideo retry again when there is nothing in the video cache
- Xcode 7.0.1 would not archive with bitcode enabled
- Fixed build warnings with bitcode enabled

Version 6.0.0 *(2015-10-12)*
----------------------------

Features:

- Video experience rebuilt from the ground up, upgrade to this SDK to enable Chartboost's behind-the-scenes video optimization (highly recommended!)
- Removed deprecated Chartboost Newsfeed.

Fixes:

- cacheRewardedVideo would stop audio of the playing video.
- pulling headphones out during the confirmation screen of rewarded videos no longer starts the video.
- accepting or declining a phonecall during the confirmation screen of rewarded videos no longer starts the video.

Improvements:

- setMediation now uses enumerated constants for partners.

Version 5.5.5 *(2015-09-23)*
----------------------------

Fixes:
- Fixed a z-order issue with Unity version 5.1.1+.
- setMediation now uses enumerated constants for partners.
- Reworked delegates to run on main thread.

Version 5.5.4 *(2015-09-01)*
----------------------------

Features:

Fixes:

Improvements:

- Bitcode support for iOS 9.

Version 5.5.3 *(2015-07-28)*
----------------------------

Features:

Fixes:

- Fix to include the armv7s slice.

Improvements:

Version 5.5.1 *(2015-07-08)*
----------------------------

Features:

Fixes:

- Fixed an issue that crashed or hung the SDK during initialization.

Improvements:

- Chartboost example application now supports clicking on the inPlay ad.


Version 5.5.0 *(2015-06-28)*
----------------------------

Features:

Fixes:

- Fixed bug that prevented video ads from resuming/being dismissed after incoming phone calls.  
- Corrected video prefetcher behavior to prevent unwanted deletions of videos prior to show calls.
- Fixed bug that prevented proper caching of new MoreApps data after the first call.
- Suppressed erroneous CoreData unable to load `CBHTTPRequestEntity` warning message.  

Improvements:

- Rewarded videos no longer need to wait until the video prefetcher is complete before showing an existing video.
- Mediation partners can call `setMediation:withVersion` to set the library name and version.
- AFNetworking library updated to version 2.5.4.
- Sample app supports portrait rotation.


Version 5.4.0 *(2015-06-01)*
----------------------------

Features:

- Added additional argument to `setFramework` to allow framework developers to add a version string. (Unity `4.6.0f1`, for example).

Fixes:

- `didPrefetchVideo` now returns when video prefetching is complete. Once this call returns, you can show rewarded videoes.

Improvements:

- Added `timezone` to `/api/install` call `REQUEST` body.

Version 5.3.0 *(2015-05-06)*
----------------------------

Features:

- Added [Weeby](http://www.weeby.co) to available frameworks.

Fixes:

- Fix issue where video ad-types would stall after a declined phone call.

Improvements:

- Native iOS SDK now sends the version of the Unity wrapper SDK along with every request.
- Added `"rooted_device":true` or `"rooted_device":false` to `/api/install` call `REQUEST` body to detect jailbroken devices.

Version 5.2.1 *(2015-04-09)*
----------------------------

Features:

Fixes:

- Fix issue for CoreData crash occuring on the first bootup of an app.
- Fix an issue for a symbol collision on `audioRouteChangeListenerCallback` with other third party SDKs.
- Fix issue for more apps not resizing when changing orientation.

Improvements:

Version 5.2.0 *(2015-04-03)*
----------------------------

Features:

- Add a developer facing function, `closeImpression`, to force close any visible impression and or loading views.
- Added a new method to CBAnalytics `trackInAppPurchaseEventWithString` that acts like the `trackInAppPurchaseEvent` but takes a string instead of raw receipt data to allow frameworks to pass in base64 encoded receipts.
- PIA Level Tracking available in CBAnalytics

Fixes:

- Fix headphone unplug pausing rewarded video & video interstitial campaigns. This would lead to a deadlock situation in rewarded video and poor user experience in video interstitial
- Change the conditions for when we fire the didFailToLoadRewardedVideo delegate. It will now fire if a rewarded video is requested before prefetching finishes.
- When setShouldDisplayLoadingViewForMoreApps is set to YES, the loading view was not being displayed in a timely manner. This is now fixed by running it on the main thread.
- Fixed an issue with age gate being covered up by rewarded video & video interstitial ad types. The impression will pause and disappear so the user can complete age gate and re-appear and resume after a user selection.

Improvements:

- New Core Data backed persistence layer for the Chartboost request manager
- New way for SDK to batch requests for an endpoint. Cuts down on outgoing network requests. Only enabled for level tracking

Version 5.1.5 *(2015-03-13)*
----------------------------

Features:

- Add ability to have the rewarded video pre-roll (confirmation screen) be fullscreen

Fixes:

- Fix issue where close buttons for video were not working on startup.

Improvements:


Version 5.1.4 *(2015-03-04)*
----------------------------

Features:

- Added a new method 'setStatusBarBehavior' to control how fullscreen video ads interact with the status bar.

Fixes:

- Fix for duplicate calls to the creative url from the SDK. This should fix issues with third party click tracking reporting click numbers twice what we report.
- Fix for max ads not being respected when campaign is set to show once per hour and autocache is set to YES. There is now a small delay after successful show call.
- Fix issue for interstitial video and rewarded video calling didDismissInterstitial or didDismissRewardedVideo during a click event.
- Fix issue where didClickInterstitial not firing for interstitial video.
- Fix issue where close buttons for fullscreen video were appearing behing the status bar.

Improvements:

- Added the location parameter, when available, to more relevant network requests. This should provide more information to analytics.

Version 5.1.3 *(2015-01-16)*
----------------------------

Features:

Fixes:

- Disabled request retries by default, fix for multithreaded crashes
- Fix for when the device is in an orientation we do not have assets for. Instead of failing silently a CBLoadError is now called.  

Improvements:

- Better inplay caching
- Added orientation information to api-click, and video-complete calls. Allows for better analytics
- Remove hardcoded affiliate token. Now pulled from the server
- Added example usage of isAnyViewVisible: delegate method into the sample project
- Added inplay button to the chartboost example app
- Improved logging for when someone tries to show a rewarded video with prefetching disabled. Instead of failing silently a CBLoadError is called.

Version 5.1.2 *(2014-12-05)*
----------------------------

Features:

Fixes:

- Fix CBAppCall crash if no resource path sent with URL.
- Fix bug with SKStoreProductViewController crashing due to race condition.
- Fix SKStoreProductViewController rotation issue with Unity.
- Fix concurrency issue in CBConfig.

Improvements:

Version 5.1.1 *(2014-12-01)*
----------------------------

Features:

Fixes:

- Fix build for armv7s architectures.

Improvements:

Version 5.1.0 *(2014-11-20)*
----------------------------

Features:

Fixes:

- Fix race condition between actions for video on replay.
- Fix loading screen causing issues with video and app sheet.
- Fix interstitial video close button appearing at incorrect time in portrait orientation.
- Fix rewarded video autoplays when previous display of video is dismissed instead of watched.
- Fix api/config not executing on soft bootups.
- Fix close button clipping the video player in corner.
- Fix api/install not being sent for soft bootups.
- Fix for various crashes due to memory pressure and concurrency.
- Fix for api/track executing on hidden files for older devices.
- Fix for rotating iPhone 6/6+ can cause video to display off screen.
- Fix for incorrect error code enumerations being used.
- Fix loading view not appearing for more apps page on slow connections.
- Fix crash in CBAnalytics if sent an invalid NSDecimalNumber.

Improvements:

- Added new framework tracking values for Cordova and CocoonJS.
- Added new API to check visibility of Chartboost UI.
- Changed delegate callbacks for click and close to be sent after closing or clicking the impression.
- Changed autocache calls to delay execution for better performance.

Version 5.0.3 *(2014-09-30)*
----------------------------

- Bugfixes and stability improvements.

Version 5.0.2 *(2014-09-12)*
----------------------------

- Added functionality to close loading view if taking too long.
- Bugfixes and stability improvements.

Version 5.0.1 *(2014-09-09)*
----------------------------

- Bugfixes and stability improvements.

Version 5.0.0 *(2014-09-03)*
----------------------------

- Public video release.
- Update Chartboost SDK interface to use static methods.
- Remove deprecated Chartboost Store.
- New ChartboostExample project.
- Many delegate methods moved to setter and getter functions.
- Introduce new Chartboost display methods that accept a UIViewController.
- Full SKProductsViewController support added.
- CBPostInstallAnalyticsTracker renamed to CBAnalytics.
- Reduce overall size of SDK.
- Dynamically load symbols and frameworks.
- Remove external dependencies.
- Enable logging in DEBUG builds via environment variable.
- Bugfixes and stability improvements.

Version 4.5.1 *(2014-07-18)*
----------------------------

- Fixes for Store.
- Fixes for session tracking and for invalid data types.

Version 4.5.0 *(2014-06-16)*
----------------------------

- Newsfeed publicly available.
- Post Install Analytics publicly available.

Version 4.4.1 *(2014-05-20)*
----------------------------

- Chartboost now supports x86_64 architectures (64 bit simulator)

Version 4.4.0 *(2014-05-17)*
----------------------------

- New MoreApps: Location support, new look and feel, custom headers
- Updates to video beta, optimizations, portrait support
- New Chartboost initialization method: startWithAppId:appSignature:delegate:
- Automatic caching enabled after show calls.
- Deprecated default location API calls.
- Beta Products support: inPlay and News Feed.
- New delegate method (didFailToRecordClick:withError:). Called when a click is registered, but the user is not fowrwarded to the App Store
- Orientation improvements: an ad will now be displayed at any orientation it
claims supporting, when the current orientation is not.

Version 4.2.0 *(2014-03-25)*
----------------------------

- New library (CBPostInstallAnalyticsTracker) made available to track IAP.
- Apple non-default frameworks (Quartzcore, System Configuration, Store Kit and
Ad Support) don't have to be linked manually anymore.
- Carrier information added to default request parameters
- Changed Locations for caching interstitials and more apps to an defined list.
Locations are now a list of enum values that can be found in the Chartboost.h file.
- App Sheet support for More Apps.

Version 4.1.0 *(2014-02-17)*
----------------------------

- Interstitials and More Apps will change orientation with the device if the
app supports multiple orientations.
- Server responses are now validated and will fail if any field is not correct.
- More Apps header background is now built from a tilable image.
- An Age Gate can now be added after an interstitial has been clicked. Use the
delegate method `shouldPauseClickForConfirmation:` to activate it.
- Interstitial background is now blurred if the device & OS support it.
- Fixed break statement missing in the example project.
- Fixed issue with the vendor id.
- Fixed massive memory leak, thorough refactor.

Version 4.0.0 *(2014-01-13)*
----------------------------

- Bundle file scanning is now an option in the header, controlled by a boolean
property set to false by default
- Files in the cache folder will be now deleted if they have not been  used for
7 days
- Rate limiting of requests: only 3 interstitial requests per 90s per location
are allowed
- Error delegate methods now take an `enum` describing the error
- When an interstitial is not loaded because of first session interstitials
being disabled, it now triggers the failure delegate.
- When an interstitial is shown on the wrong orientation, it now also triggers
an error.
- User-agent updated to allow wrappers to suffix User-agent.
- Add new session analytics tools to the SDK.
- User-agent updated to allow wrappers to suffix User-agent
- New delegate method, to be called when the App Store sheet is dismissed.
- Completely removing deprecated library, `CBAnalytics`.
- New example project is now part of the sdk download package
- When attempting to load an interstitial without having started a session, an
error is triggered
- The Chartboost Store

Version 4.0.0-b7 *(2013-10-08)*
-------------------------------

- Auto-upsell
- Logging improvements, log level controllable via env variable
- Misc bug fixes

Version 4.0.0-b6 *(2013-06-28)*
-------------------------------

- Improved `localizedPriceForItem` to support caching
- Fixed crashing bug with `localizedPriceForItem` on iOS 5

Version 4.0.0-b5 *(2013-06-05)*
-------------------------------

- Improved `subscribeToStoreView`.

Version 4.0.0-b4 *(2013-06-05)*
-------------------------------

- Fixed bug when default balance is not retained.

Version 4.0.0-b3 *(2013-06-05)*
-------------------------------

- Fixed bug where new status code would not be allowed by mask.
- Removed `initializeStore` from CBStore.h.
- Completed `triggersImmediately` support for `subscribeToStoreView` to show content right away.

Version 4.0.0-b2 *(2013-06-04)*
-------------------------------

- Fixed memory leak in IAP manager.
- Fixed bug where no callback when the pruchase is unsafe.

Version 4.0.0-b1 *(2013-05-31)*
-------------------------------

- Initial release of the Store.
- New logging framework.


Version 3.3.1 *(2013-10-29)*
----------------------------

- Fixed bug causing More Apps page crashes on iOS 7
- Fix crashes on iOS 5 devices related to the new 64-bit support
- New Feature: Xcode 5 now automatically displays integration tips (defined in **chartboost.h**), contextually presenting them while you code

Version 3.3.0 *(2013-10-17)*
----------------------------

- Fully compatible with iOS 7 64-bit-only projects. Maintains support for 32-bit projects and iOS 5.1+ devices.

Version 3.2.2 *(2013-10-08)*
----------------------------

- Added a new public method (`dismissChartboostView`) to dismiss an interstitial or More Apps view programmatically
- Fixed a bug causing indefinite loading after More Apps page clicks while in Airplane Mode
- Fixed a crash bug that would occur if the SDK received corrupt image data
- Fixed bug affecting display of More Apps button labels on iOS 7 devices
- Fixed bug causing crashes when user clicked interstitial with no iTunes URL set via the dashboard

Version 3.2.1 *(2013-05-23)*
----------------------------

- Improved long term memory management
- Better handles clicks on interstitials with malformed URLs
- Increased stability on repeated calls to hasCachedInterstitial
- Fixed issue where dismiss button could be pressed multiple times on a single interstitial
- Replaced third party JSON lib with Apple internal JSON serializer
- Compatible only with iOS 5.0+. If you need iOS 4.3+ compatibility, use SDK version 3.2 below

Version 3.2.0 *(2013-05-24)*
----------------------------

- Minimum OS version: iOS 5.0
- __UDID method removed__. Use this SDK in any apps submitted to the App Store after May 1st, 2013.
- More Apps page better handles long app names
- Handles showing an interstitial at the same time as the Game Center login prompt
- Better time-outs on intermittent internet
- No longer shows blank interstitials when app orientation is misconfigured server-side
- Added support for targeting interstitials by language
- The window property has been changed to root view
- CBAnalytics beta features removed

**Note:** "Unique" column of App Analytics temporarily shows 0 for apps using SDK v3.2. Please use "Installs" or "Bootups" for reference.

Version 3.1.1 *(2013-02-26)*
----------------------------

- Stability improvements for apps with over 300mb of bundled assets
- Fixed rare visual glitch where interstitial positions itself incorrectly
relative to status bar after app rotation

Version 3.1.0 *(2012-10-12)*
----------------------------

- Added support for the iOS 6 App Sheet so your users can download apps without
ever leaving your app! You must include StoreKit.framework for access to the
App Sheet. We are rolling out this feature in phases, apply for access via
[bizdev@chartboost.com](mailto:bizdev@chartboost.com).
- More apps status bar fixed, now auto-adjusts position when status bar is
visible
- Fixed rare crasher in CBCrypto
- Note: This version and all versions in the future are compatible with iOS
version 4.3 and higher ONLY (armv7 and armv7s).

Version 3.0.7 *(2012-10-22)*
----------------------------

- **REQUIRED: You must include AdSupport.framework for access to the
identifierForAdvertising**
- Added compatibility with Xcode 4.5 and armv7s. This SDK includes armv6, armv7,
and armv7s
- Fixed shouldRequestInterstitialsInFirstSession delegate method; now requests
interstitials only after 2nd startSession call
- Internal API upgrades

Version 3.0.6 *(2012-09-13)*
----------------------------

- Automatic interstitial caching now uses a version fallback if your app does
not include CFBundleShortVersionString in the info.plist. For best
interstitial caching, add CFBundleShortVersionString key and value to your
info.plist.

Version 3.0.5 *(2012-08-28)*
----------------------------

- Fixed rare crash in web image caching library

Version 3.0.4 *(2012-08-16)*
----------------------------

- Added SDK support for targeting Wi-fi devices

Version 3.0.3 *(2012-07-31)*
----------------------------

- Removed automatic removal of interstitials and more apps view when
backgrounding app

Version 3.0.2 *(2012-07-20)*
----------------------------

- Improves click tracking in race conditions
- Fixes issue where cached ads appear during backgrounding
- Fixed JSON crasher in CB Analytics

Version 3.0.1 *(2012-07-06)*
----------------------------

- Improved compatibility with iOS version 4.0 - 4.2

Version 3.0.0 *(2012-07-02)*
----------------------------

- Mandatory updates:
- Delegate methods now return location strings (no longer pass in a view)
-- i.e. didFailToLoadInterstitial will pass in the specific location
identifier that failed
- Removed methods: loadInterstitial, install -- now use showInterstitial,
startSession
- Requirement: rename ChartBoost class to Chartboost (lowercase b, no
camelCase) Feeling hardcore? Run this bash command in your project
directory to update camelcase ChartBoost in all your files:

```bash
for ext in '*.m' '*.h' '*.c' '*.mm'; do find . -name "$ext" -exec sed -i '' 's/ChartBoost/Chartboost/g' '{}' \; ; done
```

- New native interstitials: faster, less memory
- New native More Apps page: faster, less memory, less network activity
- Asset caching: individual assets are cached and only downloaded if they don't
exist in cache -- all assets stored in caches folder so the OS handles memory
appropriately
- Cache expiration: cached interstitials automatically expire after 24 hours
- Multi orientation support: if your app works in both orientations, simply
select both (landscape and portrait) in the dashboard
- Orientation override: SDK detects orientation using the statusbar location,
you may override this detection
- UDID replacement: iOS 6 compatible
- New delegate methods:
- didCacheInterstitial: called when an interstitial is successfully cached
from the server, interstitial location identifier passed in
- didCacheMoreApps: called when the more apps page is successfully cached
from the server
- shouldRequestInterstitialsInFirstSession: default is YES, you may
override to NO if you don't want interstitials displayed until after the
2nd startSession (for compliance with Human Interface Guidelines)
- Version notifications: if a new version of the SDK is released, you'll get
a version notification in the Xcode console if current device is iPhone
Simulator
- Bundle assets: you may include frame and cross promotion assets into your
binary
- Bug fixes:
- Displaying interstitial no longer fails when there is no appDelegate
window property
- Fixed memory leaks
- SDK supported - coming soon to the dashboard:
- Interstitial animations: four, configurable from the dashboard
- Retina support for interstitials and more apps
- New cell types: regular, featured, webview
