{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework StoreKit
//

unit iOSapi.StoreKit;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  SKANErrorImpressionMissingRequiredValue = 0;
  SKANErrorUnsupported = 1;
  SKANErrorAdNetworkIdMissing = 2;
  SKANErrorMismatchedSourceAppId = 3;
  SKANErrorImpressionNotFound = 4;
  SKANErrorInvalidCampaignId = 5;
  SKANErrorInvalidConversionValue = 6;
  SKANErrorInvalidSourceAppId = 7;
  SKANErrorInvalidAdvertisedAppId = 8;
  SKANErrorInvalidVersion = 9;
  SKANErrorUnknown = 10;
  SKANErrorImpressionTooShort = 11;
  SKCloudServiceAuthorizationStatusNotDetermined = 0;
  SKCloudServiceAuthorizationStatusDenied = 1;
  SKCloudServiceAuthorizationStatusRestricted = 2;
  SKCloudServiceAuthorizationStatusAuthorized = 3;
  SKCloudServiceCapabilityNone = 0;
  SKCloudServiceCapabilityMusicCatalogPlayback = 1 shl 0;
  SKCloudServiceCapabilityMusicCatalogSubscriptionEligible = 1 shl 1;
  SKCloudServiceCapabilityAddToCloudMusicLibrary = 1 shl 8;
  SKDownloadStateWaiting = 0;
  SKDownloadStateActive = 1;
  SKDownloadStatePaused = 2;
  SKDownloadStateFinished = 3;
  SKDownloadStateFailed = 4;
  SKDownloadStateCancelled = 5;
  SKErrorUnknown = 0;
  SKErrorClientInvalid = 1;
  SKErrorPaymentCancelled = 2;
  SKErrorPaymentInvalid = 3;
  SKErrorPaymentNotAllowed = 4;
  SKErrorStoreProductNotAvailable = 5;
  SKErrorCloudServicePermissionDenied = 6;
  SKErrorCloudServiceNetworkConnectionFailed = 7;
  SKErrorCloudServiceRevoked = 8;
  SKErrorPrivacyAcknowledgementRequired = 9;
  SKErrorUnauthorizedRequestData = 10;
  SKErrorInvalidOfferIdentifier = 11;
  SKErrorInvalidSignature = 12;
  SKErrorMissingOfferParams = 13;
  SKErrorInvalidOfferPrice = 14;
  SKErrorOverlayCancelled = 15;
  SKErrorOverlayInvalidConfiguration = 16;
  SKErrorOverlayTimeout = 17;
  SKErrorIneligibleForOffer = 18;
  SKErrorUnsupportedPlatform = 19;
  SKErrorOverlayPresentedInBackgroundScene = 20;
  SKOverlayPositionBottom = 0;
  SKOverlayPositionBottomRaised = 1;
  SKPaymentTransactionStatePurchasing = 0;
  SKPaymentTransactionStatePurchased = 1;
  SKPaymentTransactionStateFailed = 2;
  SKPaymentTransactionStateRestored = 3;
  SKPaymentTransactionStateDeferred = 4;
  SKProductPeriodUnitDay = 0;
  SKProductPeriodUnitWeek = 1;
  SKProductPeriodUnitMonth = 2;
  SKProductPeriodUnitYear = 3;
  SKProductDiscountPaymentModePayAsYouGo = 0;
  SKProductDiscountPaymentModePayUpFront = 1;
  SKProductDiscountPaymentModeFreeTrial = 2;
  SKProductDiscountTypeIntroductory = 0;
  SKProductDiscountTypeSubscription = 1;
  SKProductStorePromotionVisibilityDefault = 0;
  SKProductStorePromotionVisibilityShow = 1;
  SKProductStorePromotionVisibilityHide = 2;

type

  // ===== Forward declarations =====
{$M+}
  SKAdImpression = interface;
  SKAdNetwork = interface;
  SKArcadeService = interface;
  SKCloudServiceController = interface;
  SKCloudServiceSetupViewControllerDelegate = interface;
  SKCloudServiceSetupViewController = interface;
  SKPaymentTransaction = interface;
  SKDownload = interface;
  SKOverlay = interface;
  SKOverlayTransitionContext = interface;
  SKOverlayDelegate = interface;
  SKOverlayConfiguration = interface;
  SKOverlayAppConfiguration = interface;
  SKOverlayAppClipConfiguration = interface;
  SKProduct = interface;
  SKPaymentDiscount = interface;
  SKPayment = interface;
  SKMutablePayment = interface;
  SKStorefront = interface;
  SKPaymentQueueDelegate = interface;
  SKPaymentTransactionObserver = interface;
  SKPaymentQueue = interface;
  SKProductDiscount = interface;
  SKProductSubscriptionPeriod = interface;
  SKRequestDelegate = interface;
  SKRequest = interface;
  SKProductsRequest = interface;
  SKProductsResponse = interface;
  SKProductsRequestDelegate = interface;
  SKProductStorePromotionController = interface;
  SKReceiptRefreshRequest = interface;
  SKStoreProductViewControllerDelegate = interface;
  SKStoreProductViewController = interface;
  SKStoreReviewController = interface;

  // ===== Framework typedefs =====
{$M+}
  SKAdNetworkCoarseConversionValue = NSString;
  PSKAdNetworkCoarseConversionValue = ^SKAdNetworkCoarseConversionValue;
  TStoreKitCompletionHandler = procedure(param1: NSError) of object;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  SKANError = NSInteger;
  TStoreKitResultHandler = procedure(param1: NSData; param2: LongWord;
    param3: NSData; param4: LongWord; param5: NSError) of object;
  SKCloudServiceAuthorizationStatus = NSInteger;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  SKCloudServiceCapability = NSUInteger;
  TStoreKitCompletionHandler1 = procedure
    (param1: SKCloudServiceAuthorizationStatus) of object;
  TStoreKitCompletionHandler2 = procedure(param1: SKCloudServiceCapability;
    param2: NSError) of object;
  TStoreKitCompletionHandler3 = procedure(param1: NSString; param2: NSError)
    of object;
  NSNotificationName = NSString;
  PNSNotificationName = ^NSNotificationName;
  SKCloudServiceSetupOptionsKey = NSString;
  PSKCloudServiceSetupOptionsKey = ^SKCloudServiceSetupOptionsKey;
  SKCloudServiceSetupAction = NSString;
  PSKCloudServiceSetupAction = ^SKCloudServiceSetupAction;
  SKCloudServiceSetupMessageIdentifier = NSString;
  PSKCloudServiceSetupMessageIdentifier = ^SKCloudServiceSetupMessageIdentifier;
  TStoreKitCompletionHandler4 = procedure(param1: Boolean; param2: NSError)
    of object;
  SKDownloadState = NSInteger;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  SKErrorCode = NSInteger;
  SKOverlayPosition = NSInteger;
  TStoreKitBlock = procedure() of object;
  CGFloat = Single;
  PCGFloat = ^CGFloat;

  CGPoint = record
    x: CGFloat;
    y: CGFloat;
  end;

  PCGPoint = ^CGPoint;

  CGSize = record
    width: CGFloat;
    height: CGFloat;
  end;

  PCGSize = ^CGSize;

  CGRect = record
    origin: CGPoint;
    size: CGSize;
  end;

  PCGRect = ^CGRect;

  SKPaymentTransactionState = NSInteger;
  SKProductPeriodUnit = NSUInteger;
  SKProductDiscountPaymentMode = NSUInteger;
  SKProductDiscountType = NSUInteger;
  SKProductStorePromotionVisibility = NSInteger;
  TStoreKitCompletionHandler5 = procedure
    (param1: SKProductStorePromotionVisibility; param2: NSError) of object;
  TStoreKitCompletionHandler6 = procedure(param1: NSArray; param2: NSError)
    of object;
  // ===== Interface declarations =====

  SKAdImpressionClass = interface(NSObjectClass)
    ['{42C93D72-CFD6-4178-BCA7-8FE19C7ADFB8}']
  end;

  SKAdImpression = interface(NSObject)
    ['{B8209529-7556-4B7F-813E-5F6222EFC41F}']
    function initWithSourceAppStoreItemIdentifier(sourceAppStoreItemIdentifier
      : NSNumber; advertisedAppStoreItemIdentifier: NSNumber;
      adNetworkIdentifier: NSString; adCampaignIdentifier: NSNumber;
      adImpressionIdentifier: NSString; timestamp: NSNumber;
      signature: NSString; version: NSString): Pointer { instancetype }; cdecl;
    procedure setSourceAppStoreItemIdentifier(sourceAppStoreItemIdentifier
      : NSNumber); cdecl;
    function sourceAppStoreItemIdentifier: NSNumber; cdecl;
    procedure setAdvertisedAppStoreItemIdentifier
      (advertisedAppStoreItemIdentifier: NSNumber); cdecl;
    function advertisedAppStoreItemIdentifier: NSNumber; cdecl;
    procedure setAdNetworkIdentifier(adNetworkIdentifier: NSString); cdecl;
    function adNetworkIdentifier: NSString; cdecl;
    procedure setAdCampaignIdentifier(adCampaignIdentifier: NSNumber); cdecl;
    function adCampaignIdentifier: NSNumber; cdecl;
    procedure setSourceIdentifier(sourceIdentifier: NSNumber); cdecl;
    function sourceIdentifier: NSNumber; cdecl;
    procedure setAdImpressionIdentifier(adImpressionIdentifier
      : NSString); cdecl;
    function adImpressionIdentifier: NSString; cdecl;
    procedure setAdType(adType: NSString); cdecl;
    function adType: NSString; cdecl;
    procedure setAdDescription(adDescription: NSString); cdecl;
    function adDescription: NSString; cdecl;
    procedure setAdPurchaserName(adPurchaserName: NSString); cdecl;
    function adPurchaserName: NSString; cdecl;
    procedure setTimestamp(timestamp: NSNumber); cdecl;
    function timestamp: NSNumber; cdecl;
    procedure setSignature(signature: NSString); cdecl;
    function signature: NSString; cdecl;
    procedure setVersion(version: NSString); cdecl;
    function version: NSString; cdecl;
  end;

  TSKAdImpression = class(TOCGenericImport<SKAdImpressionClass, SKAdImpression>)
  end;

  PSKAdImpression = Pointer;

  SKAdNetworkClass = interface(NSObjectClass)
    ['{14A23176-4E95-4CE7-A105-3EB0163C1EE4}']
    { class } procedure startImpression(impression: SKAdImpression;
      completionHandler: TStoreKitCompletionHandler); cdecl;
    { class } procedure endImpression(impression: SKAdImpression;
      completionHandler: TStoreKitCompletionHandler); cdecl;
    { class } procedure registerAppForAdNetworkAttribution; cdecl;
    { class } procedure updateConversionValue(conversionValue
      : NSInteger); cdecl;
    [MethodName('updatePostbackConversionValue:completionHandler:')]
    { class } procedure updatePostbackConversionValueCompletionHandler
      (conversionValue: NSInteger;
      completionHandler: TStoreKitCompletionHandler); cdecl;
    [MethodName('updatePostbackConversionValue:coarseValue:completionHandler:')]
    { class } procedure
      updatePostbackConversionValueCoarseValueCompletionHandler
      (fineValue: NSInteger; coarseValue: SKAdNetworkCoarseConversionValue;
      completionHandler: TStoreKitCompletionHandler); cdecl;
    [MethodName
      ('updatePostbackConversionValue:coarseValue:lockWindow:completionHandler:')
      ]
    { class } procedure
      updatePostbackConversionValueCoarseValueLockWindowCompletionHandler
      (fineValue: NSInteger; coarseValue: SKAdNetworkCoarseConversionValue;
      lockWindow: Boolean;
      completionHandler: TStoreKitCompletionHandler); cdecl;
  end;

  SKAdNetwork = interface(NSObject)
    ['{B3D86AE1-214A-4352-AB8D-5F5761A38F3F}']
  end;

  TSKAdNetwork = class(TOCGenericImport<SKAdNetworkClass, SKAdNetwork>)
  end;

  PSKAdNetwork = Pointer;

  SKArcadeServiceClass = interface(NSObjectClass)
    ['{C9FCFC61-0845-4EE8-88E5-DBB98C5CC548}']
    { class } procedure registerArcadeAppWithRandomFromLib
      (randomFromLib: NSData; randomFromLibLength: LongWord;
      resultHandler: TStoreKitResultHandler); cdecl;
    { class } procedure arcadeSubscriptionStatusWithNonce(nonce: UInt64;
      resultHandler: TStoreKitResultHandler); cdecl;
    { class } procedure repairArcadeApp; cdecl;
  end;

  SKArcadeService = interface(NSObject)
    ['{9621C7C6-90B1-4BD0-8C50-F23F48A15799}']
  end;

  TSKArcadeService = class(TOCGenericImport<SKArcadeServiceClass,
    SKArcadeService>)
  end;

  PSKArcadeService = Pointer;

  SKCloudServiceControllerClass = interface(NSObjectClass)
    ['{02224F0A-7D87-4146-BFC4-DBBDE3C374A0}']
    { class } function authorizationStatus
      : SKCloudServiceAuthorizationStatus; cdecl;
    { class } procedure requestAuthorization(completionHandler
      : TStoreKitCompletionHandler1); cdecl;
  end;

  SKCloudServiceController = interface(NSObject)
    ['{9D6AF857-9558-4DB6-935F-8B4664646E3B}']
    procedure requestCapabilitiesWithCompletionHandler(completionHandler
      : TStoreKitCompletionHandler2); cdecl;
    procedure requestStorefrontCountryCodeWithCompletionHandler
      (completionHandler: TStoreKitCompletionHandler3); cdecl;
    procedure requestStorefrontIdentifierWithCompletionHandler(completionHandler
      : TStoreKitCompletionHandler3); cdecl;
    procedure requestUserTokenForDeveloperToken(developerToken: NSString;
      completionHandler: TStoreKitCompletionHandler3); cdecl;
    procedure requestPersonalizationTokenForClientToken(clientToken: NSString;
      withCompletionHandler: TStoreKitCompletionHandler3); cdecl;
  end;

  TSKCloudServiceController = class
    (TOCGenericImport<SKCloudServiceControllerClass, SKCloudServiceController>)
  end;

  PSKCloudServiceController = Pointer;

  SKCloudServiceSetupViewControllerClass = interface(UIViewControllerClass)
    ['{92744F96-6854-4423-8263-CCA4502BD966}']
  end;

  SKCloudServiceSetupViewController = interface(UIViewController)
    ['{23A96079-A08A-4D37-8998-E7243ED8374C}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure loadWithOptions(options: NSDictionary;
      completionHandler: TStoreKitCompletionHandler4); cdecl;
  end;

  TSKCloudServiceSetupViewController = class
    (TOCGenericImport<SKCloudServiceSetupViewControllerClass,
    SKCloudServiceSetupViewController>)
  end;

  PSKCloudServiceSetupViewController = Pointer;

  SKPaymentTransactionClass = interface(NSObjectClass)
    ['{F1DDEAB7-9CEE-4866-B7AA-ACD9FCC1F2D9}']
  end;

  SKPaymentTransaction = interface(NSObject)
    ['{EAB609A1-DC37-4524-B56D-65E77540FFE1}']
    function error: NSError; cdecl;
    function originalTransaction: SKPaymentTransaction; cdecl;
    function payment: SKPayment; cdecl;
    function downloads: NSArray; cdecl;
    function transactionDate: NSDate; cdecl;
    function transactionIdentifier: NSString; cdecl;
    function transactionReceipt: NSData; cdecl;
    function transactionState: SKPaymentTransactionState; cdecl;
  end;

  TSKPaymentTransaction = class(TOCGenericImport<SKPaymentTransactionClass,
    SKPaymentTransaction>)
  end;

  PSKPaymentTransaction = Pointer;

  SKDownloadClass = interface(NSObjectClass)
    ['{1A048AF3-276D-4058-BF1D-7748DF9E3A70}']
    { class } function contentURLForProductID(productID: NSString)
      : NSURL; cdecl;
    { class } procedure deleteContentForProductID(productID: NSString); cdecl;
  end;

  SKDownload = interface(NSObject)
    ['{831CC986-9563-46EC-BF71-F49588B9D002}']
    function state: SKDownloadState; cdecl;
    function downloadState: SKDownloadState; cdecl;
    function contentLength: Int64; cdecl;
    function expectedContentLength: Int64; cdecl;
    function contentIdentifier: NSString; cdecl;
    function contentURL: NSURL; cdecl;
    function contentVersion: NSString; cdecl;
    function error: NSError; cdecl;
    function progress: Single; cdecl;
    function timeRemaining: NSTimeInterval; cdecl;
    function transaction: SKPaymentTransaction; cdecl;
  end;

  TSKDownload = class(TOCGenericImport<SKDownloadClass, SKDownload>)
  end;

  PSKDownload = Pointer;

  SKOverlayClass = interface(NSObjectClass)
    ['{CD5C7432-A684-433B-9511-D0E2558415BA}']
    { class } procedure dismissOverlayInScene(scene: UIWindowScene); cdecl;
  end;

  SKOverlay = interface(NSObject)
    ['{BB28B1BD-8DCC-4ED8-8A4E-A97E5D2AAB42}']
    function initWithConfiguration(configuration: SKOverlayConfiguration)
      : Pointer { instancetype }; cdecl;
    procedure presentInScene(scene: UIWindowScene); cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function configuration: SKOverlayConfiguration; cdecl;
  end;

  TSKOverlay = class(TOCGenericImport<SKOverlayClass, SKOverlay>)
  end;

  PSKOverlay = Pointer;

  SKOverlayTransitionContextClass = interface(NSObjectClass)
    ['{565FCB4E-7466-41E8-90A1-1B8FDA48286D}']
  end;

  SKOverlayTransitionContext = interface(NSObject)
    ['{92324C6F-5665-49CC-BA87-EB13B4F21B1D}']
    procedure addAnimationBlock(block: TStoreKitBlock); cdecl;
    function startFrame: CGRect; cdecl;
    function endFrame: CGRect; cdecl;
  end;

  TSKOverlayTransitionContext = class
    (TOCGenericImport<SKOverlayTransitionContextClass,
    SKOverlayTransitionContext>)
  end;

  PSKOverlayTransitionContext = Pointer;

  SKOverlayConfigurationClass = interface(NSObjectClass)
    ['{25F16A6F-8234-4CF0-9082-FA272B78B63A}']
  end;

  SKOverlayConfiguration = interface(NSObject)
    ['{CCD09209-5FC5-49D8-B881-1D4A680A5C50}']
  end;

  TSKOverlayConfiguration = class(TOCGenericImport<SKOverlayConfigurationClass,
    SKOverlayConfiguration>)
  end;

  PSKOverlayConfiguration = Pointer;

  SKOverlayAppConfigurationClass = interface(SKOverlayConfigurationClass)
    ['{426C5E9E-361F-4A81-B83F-CC669618FDC9}']
  end;

  SKOverlayAppConfiguration = interface(SKOverlayConfiguration)
    ['{C34300CD-4A48-468C-B4B9-ED7BA1792118}']
    function initWithAppIdentifier(appIdentifier: NSString;
      position: SKOverlayPosition): Pointer { instancetype }; cdecl;
    procedure setAppIdentifier(appIdentifier: NSString); cdecl;
    function appIdentifier: NSString; cdecl;
    procedure setCampaignToken(campaignToken: NSString); cdecl;
    function campaignToken: NSString; cdecl;
    procedure setProviderToken(providerToken: NSString); cdecl;
    function providerToken: NSString; cdecl;
    procedure setCustomProductPageIdentifier(customProductPageIdentifier
      : NSString); cdecl;
    function customProductPageIdentifier: NSString; cdecl;
    procedure setLatestReleaseID(latestReleaseID: NSString); cdecl;
    function latestReleaseID: NSString; cdecl;
    procedure setPosition(position: SKOverlayPosition); cdecl;
    function position: SKOverlayPosition; cdecl;
    procedure setUserDismissible(userDismissible: Boolean); cdecl;
    function userDismissible: Boolean; cdecl;
    procedure setAdditionalValue(value: Pointer; forKey: NSString); cdecl;
    function additionalValueForKey(key: NSString): Pointer; cdecl;
    procedure setAdImpression(impression: SKAdImpression); cdecl;
  end;

  TSKOverlayAppConfiguration = class
    (TOCGenericImport<SKOverlayAppConfigurationClass,
    SKOverlayAppConfiguration>)
  end;

  PSKOverlayAppConfiguration = Pointer;

  SKOverlayAppClipConfigurationClass = interface(SKOverlayConfigurationClass)
    ['{C04F586C-8DDA-4BEC-BE6E-F18F8D6632C2}']
  end;

  SKOverlayAppClipConfiguration = interface(SKOverlayConfiguration)
    ['{6FBC974D-F8AD-4E14-B0E9-E4798C96D922}']
    function initWithPosition(position: SKOverlayPosition)
      : Pointer { instancetype }; cdecl;
    procedure setCampaignToken(campaignToken: NSString); cdecl;
    function campaignToken: NSString; cdecl;
    procedure setProviderToken(providerToken: NSString); cdecl;
    function providerToken: NSString; cdecl;
    procedure setCustomProductPageIdentifier(customProductPageIdentifier
      : NSString); cdecl;
    function customProductPageIdentifier: NSString; cdecl;
    procedure setLatestReleaseID(latestReleaseID: NSString); cdecl;
    function latestReleaseID: NSString; cdecl;
    procedure setPosition(position: SKOverlayPosition); cdecl;
    function position: SKOverlayPosition; cdecl;
    procedure setAdditionalValue(value: Pointer; forKey: NSString); cdecl;
    function additionalValueForKey(key: NSString): Pointer; cdecl;
  end;

  TSKOverlayAppClipConfiguration = class
    (TOCGenericImport<SKOverlayAppClipConfigurationClass,
    SKOverlayAppClipConfiguration>)
  end;

  PSKOverlayAppClipConfiguration = Pointer;

  SKProductClass = interface(NSObjectClass)
    ['{BAF72567-2361-43C9-A204-521EDD553124}']
  end;

  SKProduct = interface(NSObject)
    ['{4F40BA4F-151A-4B40-9988-A53788E2770A}']
    function localizedDescription: NSString; cdecl;
    function localizedTitle: NSString; cdecl;
    function price: NSDecimalNumber; cdecl;
    function priceLocale: NSLocale; cdecl;
    function productIdentifier: NSString; cdecl;
    function isDownloadable: Boolean; cdecl;
    function downloadable: Boolean; cdecl;
    function isFamilyShareable: Boolean; cdecl;
    function contentLengths: NSArray; cdecl;
    function downloadContentLengths: NSArray; cdecl;
    function contentVersion: NSString; cdecl;
    function downloadContentVersion: NSString; cdecl;
    function subscriptionPeriod: SKProductSubscriptionPeriod; cdecl;
    function introductoryPrice: SKProductDiscount; cdecl;
    function subscriptionGroupIdentifier: NSString; cdecl;
    function discounts: NSArray; cdecl;
  end;

  TSKProduct = class(TOCGenericImport<SKProductClass, SKProduct>)
  end;

  PSKProduct = Pointer;

  SKPaymentDiscountClass = interface(NSObjectClass)
    ['{9055CEAA-626C-4FC6-949F-26E4726BFE32}']
  end;

  SKPaymentDiscount = interface(NSObject)
    ['{638E18E0-0B74-450E-A895-ACC1C565A50A}']
    function initWithIdentifier(identifier: NSString; keyIdentifier: NSString;
      nonce: NSUUID; signature: NSString; timestamp: NSNumber)
      : Pointer { instancetype }; cdecl;
    function identifier: NSString; cdecl;
    function keyIdentifier: NSString; cdecl;
    function nonce: NSUUID; cdecl;
    function signature: NSString; cdecl;
    function timestamp: NSNumber; cdecl;
  end;

  TSKPaymentDiscount = class(TOCGenericImport<SKPaymentDiscountClass,
    SKPaymentDiscount>)
  end;

  PSKPaymentDiscount = Pointer;

  SKPaymentClass = interface(NSObjectClass)
    ['{DA8FB0D1-FB37-42C4-9959-1A71650A6042}']
    { class } function paymentWithProduct(product: SKProduct)
      : Pointer { instancetype }; cdecl;
    { class } function paymentWithProductIdentifier(identifier: NSString)
      : Pointer; cdecl;
  end;

  SKPayment = interface(NSObject)
    ['{29C349AC-82AD-4AA0-81B3-BD8BF717CBA9}']
    function productIdentifier: NSString; cdecl;
    function requestData: NSData; cdecl;
    function quantity: NSInteger; cdecl;
    function applicationUsername: NSString; cdecl;
    function simulatesAskToBuyInSandbox: Boolean; cdecl;
    function paymentDiscount: SKPaymentDiscount; cdecl;
  end;

  TSKPayment = class(TOCGenericImport<SKPaymentClass, SKPayment>)
  end;

  PSKPayment = Pointer;

  SKMutablePaymentClass = interface(SKPaymentClass)
    ['{6F9688E6-2087-4800-B6C7-D9801D857A27}']
  end;

  SKMutablePayment = interface(SKPayment)
    ['{2778B421-0D86-48C4-BE2C-6307A0193557}']
    procedure setApplicationUsername(applicationUsername: NSString); cdecl;
    function applicationUsername: NSString; cdecl;
    procedure setPaymentDiscount(paymentDiscount: SKPaymentDiscount); cdecl;
    function paymentDiscount: SKPaymentDiscount; cdecl;
    procedure setProductIdentifier(productIdentifier: NSString); cdecl;
    function productIdentifier: NSString; cdecl;
    procedure setQuantity(quantity: NSInteger); cdecl;
    function quantity: NSInteger; cdecl;
    procedure setRequestData(requestData: NSData); cdecl;
    function requestData: NSData; cdecl;
    procedure setSimulatesAskToBuyInSandbox(simulatesAskToBuyInSandbox
      : Boolean); cdecl;
    function simulatesAskToBuyInSandbox: Boolean; cdecl;
  end;

  TSKMutablePayment = class(TOCGenericImport<SKMutablePaymentClass,
    SKMutablePayment>)
  end;

  PSKMutablePayment = Pointer;

  SKStorefrontClass = interface(NSObjectClass)
    ['{4454A37A-C4F8-4919-9A06-BBED1F2EA4FC}']
  end;

  SKStorefront = interface(NSObject)
    ['{162D9CE9-9468-4B09-B353-F2770774CD3B}']
    function countryCode: NSString; cdecl;
    function identifier: NSString; cdecl;
  end;

  TSKStorefront = class(TOCGenericImport<SKStorefrontClass, SKStorefront>)
  end;

  PSKStorefront = Pointer;

  SKPaymentQueueClass = interface(NSObjectClass)
    ['{020435E2-D774-4882-AC39-606D07FE14D9}']
    { class } function defaultQueue: Pointer { instancetype }; cdecl;
    { class } function canMakePayments: Boolean; cdecl;
  end;

  SKPaymentQueue = interface(NSObject)
    ['{3E129537-5FA4-4A46-9FE9-F4B4A91CEE5A}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function storefront: SKStorefront; cdecl;
    procedure addPayment(payment: SKPayment); cdecl;
    procedure restoreCompletedTransactions; cdecl;
    procedure restoreCompletedTransactionsWithApplicationUsername
      (username: NSString); cdecl;
    procedure finishTransaction(transaction: SKPaymentTransaction); cdecl;
    procedure startDownloads(downloads: NSArray); cdecl;
    procedure pauseDownloads(downloads: NSArray); cdecl;
    procedure resumeDownloads(downloads: NSArray); cdecl;
    procedure cancelDownloads(downloads: NSArray); cdecl;
    procedure addTransactionObserver(observer: Pointer); cdecl;
    procedure removeTransactionObserver(observer: Pointer); cdecl;
    function transactionObservers: NSArray; cdecl;
    function transactions: NSArray; cdecl;
    procedure showPriceConsentIfNeeded; cdecl;
    procedure presentCodeRedemptionSheet; cdecl;
  end;

  TSKPaymentQueue = class(TOCGenericImport<SKPaymentQueueClass, SKPaymentQueue>)
  end;

  PSKPaymentQueue = Pointer;

  SKProductDiscountClass = interface(NSObjectClass)
    ['{11857191-3773-48B6-8F6D-410B33AE47D0}']
  end;

  SKProductDiscount = interface(NSObject)
    ['{C30EFF48-A079-4584-A479-E8679556DBA0}']
    function price: NSDecimalNumber; cdecl;
    function priceLocale: NSLocale; cdecl;
    function identifier: NSString; cdecl;
    function subscriptionPeriod: SKProductSubscriptionPeriod; cdecl;
    function numberOfPeriods: NSUInteger; cdecl;
    function paymentMode: SKProductDiscountPaymentMode; cdecl;
    function &type: SKProductDiscountType; cdecl;
  end;

  TSKProductDiscount = class(TOCGenericImport<SKProductDiscountClass,
    SKProductDiscount>)
  end;

  PSKProductDiscount = Pointer;

  SKProductSubscriptionPeriodClass = interface(NSObjectClass)
    ['{3ED99A65-F805-4A75-B3F7-354507FFE90E}']
  end;

  SKProductSubscriptionPeriod = interface(NSObject)
    ['{1A654356-C9A7-4DC2-B8DF-AD9A64733E31}']
    function numberOfUnits: NSUInteger; cdecl;
    function &unit: SKProductPeriodUnit; cdecl;
  end;

  TSKProductSubscriptionPeriod = class
    (TOCGenericImport<SKProductSubscriptionPeriodClass,
    SKProductSubscriptionPeriod>)
  end;

  PSKProductSubscriptionPeriod = Pointer;

  SKRequestClass = interface(NSObjectClass)
    ['{E2FC461C-AC04-41DE-B584-1DCF1C43EAB5}']
  end;

  SKRequest = interface(NSObject)
    ['{6F68C7A1-68BA-4BDF-A7FF-99CF118AD75D}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure cancel; cdecl;
    procedure start; cdecl;
  end;

  TSKRequest = class(TOCGenericImport<SKRequestClass, SKRequest>)
  end;

  PSKRequest = Pointer;

  SKProductsRequestClass = interface(SKRequestClass)
    ['{826AB1B6-7BFF-4AD0-9F50-B0493329E8A9}']
  end;

  SKProductsRequest = interface(SKRequest)
    ['{85DC39D3-5ABF-46A1-9439-7AD8C011830B}']
    function initWithProductIdentifiers(productIdentifiers: NSSet)
      : Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
  end;

  TSKProductsRequest = class(TOCGenericImport<SKProductsRequestClass,
    SKProductsRequest>)
  end;

  PSKProductsRequest = Pointer;

  SKProductsResponseClass = interface(NSObjectClass)
    ['{EA828130-A336-4778-A0A3-4CE67BDE779D}']
  end;

  SKProductsResponse = interface(NSObject)
    ['{AE77F1DE-EC02-4BAF-9493-032DC722B833}']
    function products: NSArray; cdecl;
    function invalidProductIdentifiers: NSArray; cdecl;
  end;

  TSKProductsResponse = class(TOCGenericImport<SKProductsResponseClass,
    SKProductsResponse>)
  end;

  PSKProductsResponse = Pointer;

  SKProductStorePromotionControllerClass = interface(NSObjectClass)
    ['{24414417-2B22-45B1-9026-12CDFED58730}']
    { class } function defaultController: Pointer { instancetype }; cdecl;
  end;

  SKProductStorePromotionController = interface(NSObject)
    ['{0C6EB4CA-8484-4F9C-BD9D-B59957F1E4F9}']
    procedure fetchStorePromotionVisibilityForProduct(product: SKProduct;
      completionHandler: TStoreKitCompletionHandler5); cdecl;
    procedure updateStorePromotionVisibility(promotionVisibility
      : SKProductStorePromotionVisibility; forProduct: SKProduct;
      completionHandler: TStoreKitCompletionHandler); cdecl;
    procedure fetchStorePromotionOrderWithCompletionHandler(completionHandler
      : TStoreKitCompletionHandler6); cdecl;
    procedure updateStorePromotionOrder(promotionOrder: NSArray;
      completionHandler: TStoreKitCompletionHandler); cdecl;
  end;

  TSKProductStorePromotionController = class
    (TOCGenericImport<SKProductStorePromotionControllerClass,
    SKProductStorePromotionController>)
  end;

  PSKProductStorePromotionController = Pointer;

  SKReceiptRefreshRequestClass = interface(SKRequestClass)
    ['{05C542D0-F39F-47BF-A436-1B2B6E57C06A}']
  end;

  SKReceiptRefreshRequest = interface(SKRequest)
    ['{194336E4-E9AA-4570-8D3F-B030CE5B7DB4}']
    function initWithReceiptProperties(properties: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function receiptProperties: NSDictionary; cdecl;
  end;

  TSKReceiptRefreshRequest = class
    (TOCGenericImport<SKReceiptRefreshRequestClass, SKReceiptRefreshRequest>)
  end;

  PSKReceiptRefreshRequest = Pointer;

  SKStoreProductViewControllerClass = interface(UIViewControllerClass)
    ['{87EA9C35-289A-4A52-AA03-8F275E31E332}']
  end;

  SKStoreProductViewController = interface(UIViewController)
    ['{CD628C90-AD15-43D5-BA68-36FB51167342}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    [MethodName('loadProductWithParameters:completionBlock:')]
    procedure loadProductWithParametersCompletionBlock(parameters: NSDictionary;
      completionBlock: TStoreKitCompletionHandler4); cdecl;
    [MethodName('loadProductWithParameters:impression:completionBlock:')]
    procedure loadProductWithParametersImpressionCompletionBlock
      (parameters: NSDictionary; impression: SKAdImpression;
      completionBlock: TStoreKitCompletionHandler4); cdecl;
  end;

  TSKStoreProductViewController = class
    (TOCGenericImport<SKStoreProductViewControllerClass,
    SKStoreProductViewController>)
  end;

  PSKStoreProductViewController = Pointer;

  SKStoreReviewControllerClass = interface(NSObjectClass)
    ['{781E2B9C-2521-4F38-ACEE-7A3E10233A1C}']
    { class } procedure requestReview; cdecl;
    { class } procedure requestReviewInScene(windowScene: UIWindowScene); cdecl;
  end;

  SKStoreReviewController = interface(NSObject)
    ['{73AE417E-47BB-489D-A9D2-510C6AF05CA9}']
  end;

  TSKStoreReviewController = class
    (TOCGenericImport<SKStoreReviewControllerClass, SKStoreReviewController>)
  end;

  PSKStoreReviewController = Pointer;

  // ===== Protocol declarations =====

  SKCloudServiceSetupViewControllerDelegate = interface(IObjectiveC)
    ['{021E6093-76B9-4B6F-8C27-BE759924B4A6}']
    procedure cloudServiceSetupViewControllerDidDismiss
      (cloudServiceSetupViewController
      : SKCloudServiceSetupViewController); cdecl;
  end;

  SKOverlayDelegate = interface(IObjectiveC)
    ['{9358DBC2-F8A1-4E1D-9A7C-7CDC7D7C5635}']
    [MethodName('storeOverlay:didFailToLoadWithError:')]
    procedure storeOverlayDidFailToLoadWithError(overlay: SKOverlay;
      didFailToLoadWithError: NSError); cdecl;
    [MethodName('storeOverlay:willStartPresentation:')]
    procedure storeOverlayWillStartPresentation(overlay: SKOverlay;
      willStartPresentation: SKOverlayTransitionContext); cdecl;
    [MethodName('storeOverlay:didFinishPresentation:')]
    procedure storeOverlayDidFinishPresentation(overlay: SKOverlay;
      didFinishPresentation: SKOverlayTransitionContext); cdecl;
    [MethodName('storeOverlay:willStartDismissal:')]
    procedure storeOverlayWillStartDismissal(overlay: SKOverlay;
      willStartDismissal: SKOverlayTransitionContext); cdecl;
    [MethodName('storeOverlay:didFinishDismissal:')]
    procedure storeOverlayDidFinishDismissal(overlay: SKOverlay;
      didFinishDismissal: SKOverlayTransitionContext); cdecl;
  end;

  SKPaymentQueueDelegate = interface(IObjectiveC)
    ['{B5CE77B0-2956-4E47-BC9A-F0E980C42256}']
    function paymentQueue(paymentQueue: SKPaymentQueue;
      shouldContinueTransaction: SKPaymentTransaction;
      inStorefront: SKStorefront): Boolean; cdecl;
    function paymentQueueShouldShowPriceConsent(paymentQueue: SKPaymentQueue)
      : Boolean; cdecl;
  end;

  SKPaymentTransactionObserver = interface(IObjectiveC)
    ['{29EF553B-5990-4BC6-B8B4-FC3A0F52CDC3}']
    [MethodName('paymentQueue:updatedTransactions:')]
    procedure paymentQueueUpdatedTransactions(queue: SKPaymentQueue;
      updatedTransactions: NSArray); cdecl;
    [MethodName('paymentQueue:removedTransactions:')]
    procedure paymentQueueRemovedTransactions(queue: SKPaymentQueue;
      removedTransactions: NSArray); cdecl;
    [MethodName('paymentQueue:restoreCompletedTransactionsFailedWithError:')]
    procedure paymentQueueRestoreCompletedTransactionsFailedWithError
      (queue: SKPaymentQueue; restoreCompletedTransactionsFailedWithError
      : NSError); cdecl;
    procedure paymentQueueRestoreCompletedTransactionsFinished
      (queue: SKPaymentQueue); cdecl;
    [MethodName('paymentQueue:updatedDownloads:')]
    procedure paymentQueueUpdatedDownloads(queue: SKPaymentQueue;
      updatedDownloads: NSArray); cdecl;
    [MethodName('paymentQueue:shouldAddStorePayment:forProduct:')]
    function paymentQueueShouldAddStorePaymentForProduct(queue: SKPaymentQueue;
      shouldAddStorePayment: SKPayment; forProduct: SKProduct): Boolean; cdecl;
    procedure paymentQueueDidChangeStorefront(queue: SKPaymentQueue); cdecl;
    [MethodName('paymentQueue:didRevokeEntitlementsForProductIdentifiers:')]
    procedure paymentQueueDidRevokeEntitlementsForProductIdentifiers
      (queue: SKPaymentQueue; didRevokeEntitlementsForProductIdentifiers
      : NSArray); cdecl;
  end;

  SKRequestDelegate = interface(IObjectiveC)
    ['{89DAB360-9848-4F4E-B4FF-690DAEF22BCF}']
    procedure requestDidFinish(request: SKRequest); cdecl;
    procedure request(request: SKRequest; didFailWithError: NSError); cdecl;
  end;

  SKProductsRequestDelegate = interface(IObjectiveC)
    ['{0D163F23-3D6B-4CE0-BEB5-F92289DB4762}']
    procedure productsRequest(request: SKProductsRequest;
      didReceiveResponse: SKProductsResponse); cdecl;
  end;

  SKStoreProductViewControllerDelegate = interface(IObjectiveC)
    ['{A2678905-19CD-4CAB-BC45-A687A4BA4C43}']
    procedure productViewControllerDidFinish(viewController
      : SKStoreProductViewController); cdecl;
  end;

  // ===== Exported string consts =====

function SKAdNetworkCoarseConversionValueHigh: Pointer;
function SKAdNetworkCoarseConversionValueMedium: Pointer;
function SKAdNetworkCoarseConversionValueLow: Pointer;
function SKStoreProductParameterAdNetworkAttributionSignature: NSString;
function SKStoreProductParameterAdNetworkCampaignIdentifier: NSString;
function SKStoreProductParameterAdNetworkSourceIdentifier: NSString;
function SKStoreProductParameterAdNetworkIdentifier: NSString;
function SKStoreProductParameterAdNetworkNonce: NSString;
function SKStoreProductParameterAdNetworkTimestamp: NSString;
function SKStoreProductParameterAdNetworkSourceAppStoreIdentifier: NSString;
function SKStoreProductParameterAdNetworkVersion: NSString;
function SKANErrorDomain: NSString;
function SKCloudServiceCapabilitiesDidChangeNotification: Pointer;
function SKStorefrontCountryCodeDidChangeNotification: Pointer;
function SKStorefrontIdentifierDidChangeNotification: Pointer;
function SKCloudServiceSetupOptionsActionKey: Pointer;
function SKCloudServiceSetupOptionsITunesItemIdentifierKey: Pointer;
function SKCloudServiceSetupOptionsAffiliateTokenKey: Pointer;
function SKCloudServiceSetupOptionsCampaignTokenKey: Pointer;
function SKCloudServiceSetupOptionsMessageIdentifierKey: Pointer;
function SKCloudServiceSetupActionSubscribe: Pointer;
function SKCloudServiceSetupMessageIdentifierJoin: Pointer;
function SKCloudServiceSetupMessageIdentifierConnect: Pointer;
function SKCloudServiceSetupMessageIdentifierAddMusic: Pointer;
function SKCloudServiceSetupMessageIdentifierPlayMusic: Pointer;
function SKDownloadTimeRemainingUnknown: Pointer;
function SKErrorDomain: NSString;
function SKReceiptPropertyIsExpired: NSString;
function SKReceiptPropertyIsRevoked: NSString;
function SKReceiptPropertyIsVolumePurchase: NSString;
function SKStoreProductParameterITunesItemIdentifier: NSString;
function SKStoreProductParameterProductIdentifier: NSString;
function SKStoreProductParameterCustomProductPageIdentifier: NSString;
function SKStoreProductParameterAffiliateToken: NSString;
function SKStoreProductParameterCampaignToken: NSString;
function SKStoreProductParameterProviderToken: NSString;
function SKStoreProductParameterAdvertisingPartnerToken: NSString;


// ===== External functions =====

const
  libStoreKit = '/System/Library/Frameworks/StoreKit.framework/StoreKit';
procedure SKTerminateForInvalidReceipt; cdecl;
  external libStoreKit name _PU + 'SKTerminateForInvalidReceipt';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  StoreKitModule: THandle;

{$ENDIF IOS}

function SKStoreProductParameterAdNetworkAttributionSignature: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterAdNetworkAttributionSignature');
end;

function SKStoreProductParameterAdNetworkCampaignIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterAdNetworkCampaignIdentifier');
end;

function SKStoreProductParameterAdNetworkSourceIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterAdNetworkSourceIdentifier');
end;

function SKStoreProductParameterAdNetworkIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterAdNetworkIdentifier');
end;

function SKStoreProductParameterAdNetworkNonce: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterAdNetworkNonce');
end;

function SKStoreProductParameterAdNetworkTimestamp: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterAdNetworkTimestamp');
end;

function SKStoreProductParameterAdNetworkSourceAppStoreIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterAdNetworkSourceAppStoreIdentifier');
end;

function SKStoreProductParameterAdNetworkVersion: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterAdNetworkVersion');
end;

function SKANErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit, 'SKANErrorDomain');
end;

function SKErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit, 'SKErrorDomain');
end;

function SKReceiptPropertyIsExpired: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit, 'SKReceiptPropertyIsExpired');
end;

function SKReceiptPropertyIsRevoked: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit, 'SKReceiptPropertyIsRevoked');
end;

function SKReceiptPropertyIsVolumePurchase: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKReceiptPropertyIsVolumePurchase');
end;

function SKStoreProductParameterITunesItemIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterITunesItemIdentifier');
end;

function SKStoreProductParameterProductIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterProductIdentifier');
end;

function SKStoreProductParameterCustomProductPageIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterCustomProductPageIdentifier');
end;

function SKStoreProductParameterAffiliateToken: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterAffiliateToken');
end;

function SKStoreProductParameterCampaignToken: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterCampaignToken');
end;

function SKStoreProductParameterProviderToken: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterProviderToken');
end;

function SKStoreProductParameterAdvertisingPartnerToken: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStoreProductParameterAdvertisingPartnerToken');
end;

function SKAdNetworkCoarseConversionValueHigh: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKAdNetworkCoarseConversionValueHigh');
end;

function SKAdNetworkCoarseConversionValueMedium: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKAdNetworkCoarseConversionValueMedium');
end;

function SKAdNetworkCoarseConversionValueLow: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKAdNetworkCoarseConversionValueLow');
end;

function SKCloudServiceCapabilitiesDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKCloudServiceCapabilitiesDidChangeNotification');
end;

function SKStorefrontCountryCodeDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKStorefrontCountryCodeDidChangeNotification');
end;

function SKStorefrontIdentifierDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKStorefrontIdentifierDidChangeNotification');
end;

function SKCloudServiceSetupOptionsActionKey: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKCloudServiceSetupOptionsActionKey');
end;

function SKCloudServiceSetupOptionsITunesItemIdentifierKey: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKCloudServiceSetupOptionsITunesItemIdentifierKey');
end;

function SKCloudServiceSetupOptionsAffiliateTokenKey: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKCloudServiceSetupOptionsAffiliateTokenKey');
end;

function SKCloudServiceSetupOptionsCampaignTokenKey: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKCloudServiceSetupOptionsCampaignTokenKey');
end;

function SKCloudServiceSetupOptionsMessageIdentifierKey: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKCloudServiceSetupOptionsMessageIdentifierKey');
end;

function SKCloudServiceSetupActionSubscribe: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKCloudServiceSetupActionSubscribe');
end;

function SKCloudServiceSetupMessageIdentifierJoin: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKCloudServiceSetupMessageIdentifierJoin');
end;

function SKCloudServiceSetupMessageIdentifierConnect: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKCloudServiceSetupMessageIdentifierConnect');
end;

function SKCloudServiceSetupMessageIdentifierAddMusic: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKCloudServiceSetupMessageIdentifierAddMusic');
end;

function SKCloudServiceSetupMessageIdentifierPlayMusic: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit,
    'SKCloudServiceSetupMessageIdentifierPlayMusic');
end;

function SKDownloadTimeRemainingUnknown: Pointer;
begin
  Result := CocoaPointerConst(libStoreKit, 'SKDownloadTimeRemainingUnknown');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

StoreKitModule := dlopen(MarshaledAString(libStoreKit), RTLD_LAZY);

finalization

dlclose(StoreKitModule);
{$ENDIF IOS}

end.
