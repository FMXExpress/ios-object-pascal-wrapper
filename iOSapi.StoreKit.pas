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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  SKCloudServiceAuthorizationStatusNotDetermined = 0;
  SKCloudServiceAuthorizationStatusDenied = 1;
  SKCloudServiceAuthorizationStatusRestricted = 2;
  SKCloudServiceAuthorizationStatusAuthorized = 3;
  SKCloudServiceCapabilityNone = 0;
  SKCloudServiceCapabilityMusicCatalogPlayback = 1 shl 0;
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
  SKPaymentTransactionStatePurchasing = 0;
  SKPaymentTransactionStatePurchased = 1;
  SKPaymentTransactionStateFailed = 2;
  SKPaymentTransactionStateRestored = 3;
  SKPaymentTransactionStateDeferred = 4;

type

  // ===== Forward declarations =====
{$M+}
  SKCloudServiceController = interface;
  SKPaymentTransaction = interface;
  SKDownload = interface;
  SKProduct = interface;
  SKPayment = interface;
  SKMutablePayment = interface;
  SKPaymentTransactionObserver = interface;
  SKPaymentQueue = interface;
  SKRequestDelegate = interface;
  SKRequest = interface;
  SKProductsRequest = interface;
  SKProductsResponse = interface;
  SKProductsRequestDelegate = interface;
  SKReceiptRefreshRequest = interface;
  SKStoreProductViewControllerDelegate = interface;
  SKStoreProductViewController = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  SKCloudServiceAuthorizationStatus = NSInteger;
  NSUInteger = Cardinal;
  SKCloudServiceCapability = NSUInteger;
  TStoreKitHandler = procedure(param1: SKCloudServiceAuthorizationStatus)
    of object;
  TStoreKitCompletionHandler = procedure(param1: NSString; param2: NSError)
    of object;
  TStoreKitCompletionHandler1 = procedure(param1: SKCloudServiceCapability;
    param2: NSError) of object;
  SKDownloadState = NSInteger;
  NSTimeInterval = Double;
  SKErrorCode = NSInteger;
  SKPaymentTransactionState = NSInteger;
  TStoreKitCompletionBlock = procedure(param1: Boolean; param2: NSError)
    of object;
  // ===== Interface declarations =====

  SKCloudServiceControllerClass = interface(NSObjectClass)
    ['{A375C1B0-41D0-4A6D-AFC6-F904EE5DA4F2}']
    { class } function authorizationStatus
      : SKCloudServiceAuthorizationStatus; cdecl;
    { class } procedure requestAuthorization(handler: TStoreKitHandler); cdecl;
  end;

  SKCloudServiceController = interface(NSObject)
    ['{6A9F1B91-62B7-4DF5-8CA1-E8F26D2BD789}']
    procedure requestStorefrontIdentifierWithCompletionHandler(completionHandler
      : TStoreKitCompletionHandler); cdecl;
    procedure requestCapabilitiesWithCompletionHandler(completionHandler
      : TStoreKitCompletionHandler1); cdecl;
  end;

  TSKCloudServiceController = class
    (TOCGenericImport<SKCloudServiceControllerClass, SKCloudServiceController>)
  end;

  PSKCloudServiceController = Pointer;

  SKPaymentTransactionClass = interface(NSObjectClass)
    ['{8B4E4369-4ABF-47EB-8A6E-5F8068598DB3}']
  end;

  SKPaymentTransaction = interface(NSObject)
    ['{48A3CAF7-5A70-42CB-977F-539E7901442A}']
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
    ['{067AF632-8A57-4FCA-A1EB-1F723C99C7FD}']
  end;

  SKDownload = interface(NSObject)
    ['{6856EEBC-30E6-4717-B93A-948E75BC7020}']
    function downloadState: SKDownloadState; cdecl;
    function contentLength: Int64; cdecl;
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

  SKProductClass = interface(NSObjectClass)
    ['{BF260CF0-355E-4E42-A565-E53B40363E3A}']
  end;

  SKProduct = interface(NSObject)
    ['{2F7D815A-24C5-43B8-9584-2D4A4152346F}']
    function localizedDescription: NSString; cdecl;
    function localizedTitle: NSString; cdecl;
    function price: NSDecimalNumber; cdecl;
    function priceLocale: NSLocale; cdecl;
    function productIdentifier: NSString; cdecl;
    function isDownloadable: Boolean; cdecl;
    function downloadContentLengths: NSArray; cdecl;
    function downloadContentVersion: NSString; cdecl;
  end;

  TSKProduct = class(TOCGenericImport<SKProductClass, SKProduct>)
  end;

  PSKProduct = Pointer;

  SKPaymentClass = interface(NSObjectClass)
    ['{7CE5B0E0-E81E-44FE-A3AC-F6F6C6946669}']
    { class } function paymentWithProduct(product: SKProduct)
      : Pointer { instancetype }; cdecl;
    { class } function paymentWithProductIdentifier(identifier: NSString)
      : Pointer; cdecl;
  end;

  SKPayment = interface(NSObject)
    ['{3558F823-963F-4613-880A-47749DC4CE4F}']
    function productIdentifier: NSString; cdecl;
    function requestData: NSData; cdecl;
    function quantity: NSInteger; cdecl;
    function applicationUsername: NSString; cdecl;
    function simulatesAskToBuyInSandbox: Boolean; cdecl;
  end;

  TSKPayment = class(TOCGenericImport<SKPaymentClass, SKPayment>)
  end;

  PSKPayment = Pointer;

  SKMutablePaymentClass = interface(SKPaymentClass)
    ['{8591D0F5-677E-4ABF-8725-8A38B270AB5B}']
  end;

  SKMutablePayment = interface(SKPayment)
    ['{807C56B7-DE75-40EF-82B5-05231067E766}']
    procedure setApplicationUsername(applicationUsername: NSString); cdecl;
    function applicationUsername: NSString; cdecl;
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

  SKPaymentQueueClass = interface(NSObjectClass)
    ['{88710408-99C6-4A45-A35F-9F3886B1A665}']
    { class } function defaultQueue: Pointer { instancetype }; cdecl;
    { class } function canMakePayments: Boolean; cdecl;
  end;

  SKPaymentQueue = interface(NSObject)
    ['{7DD55197-A495-4DC0-B5AC-4C94EE97F811}']
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
    function transactions: NSArray; cdecl;
  end;

  TSKPaymentQueue = class(TOCGenericImport<SKPaymentQueueClass, SKPaymentQueue>)
  end;

  PSKPaymentQueue = Pointer;

  SKRequestClass = interface(NSObjectClass)
    ['{82CA6C86-011B-49ED-BF7C-A367BC967117}']
  end;

  SKRequest = interface(NSObject)
    ['{7F345B9B-EFBC-4D75-A769-DDFFE06DA535}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure cancel; cdecl;
    procedure start; cdecl;
  end;

  TSKRequest = class(TOCGenericImport<SKRequestClass, SKRequest>)
  end;

  PSKRequest = Pointer;

  SKProductsRequestClass = interface(SKRequestClass)
    ['{F4118B31-25DF-4C86-B7B1-E88073168600}']
  end;

  SKProductsRequest = interface(SKRequest)
    ['{80EC6DD6-8B9D-416E-9130-62F14CCEE65C}']
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
    ['{2FDD94C6-8F0D-44EF-BE63-E13A58179DE2}']
  end;

  SKProductsResponse = interface(NSObject)
    ['{B6BEDE77-CD1B-41CF-8A48-D29F6625CDCF}']
    function products: NSArray; cdecl;
    function invalidProductIdentifiers: NSArray; cdecl;
  end;

  TSKProductsResponse = class(TOCGenericImport<SKProductsResponseClass,
    SKProductsResponse>)
  end;

  PSKProductsResponse = Pointer;

  SKReceiptRefreshRequestClass = interface(SKRequestClass)
    ['{6C7CB0C5-FD99-41DD-B164-2A5A88A55468}']
  end;

  SKReceiptRefreshRequest = interface(SKRequest)
    ['{BDF19771-61A0-406E-8EFE-5808D7959435}']
    function initWithReceiptProperties(properties: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function receiptProperties: NSDictionary; cdecl;
  end;

  TSKReceiptRefreshRequest = class
    (TOCGenericImport<SKReceiptRefreshRequestClass, SKReceiptRefreshRequest>)
  end;

  PSKReceiptRefreshRequest = Pointer;

  SKStoreProductViewControllerClass = interface(UIViewControllerClass)
    ['{3950A2BE-3596-4CD5-B25B-1A788F37C768}']
  end;

  SKStoreProductViewController = interface(UIViewController)
    ['{AC89BFCC-F0E7-425D-8DC0-791CDA79ACC7}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure loadProductWithParameters(parameters: NSDictionary;
      completionBlock: TStoreKitCompletionBlock); cdecl;
  end;

  TSKStoreProductViewController = class
    (TOCGenericImport<SKStoreProductViewControllerClass,
    SKStoreProductViewController>)
  end;

  PSKStoreProductViewController = Pointer;

  // ===== Protocol declarations =====

  SKPaymentTransactionObserver = interface(IObjectiveC)
    ['{1090ED20-B6B6-4749-AD2A-AF90E76E9099}']
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
  end;

  SKRequestDelegate = interface(IObjectiveC)
    ['{4ECBFC64-29AB-4529-9753-0C4EB0178212}']
    procedure requestDidFinish(request: SKRequest); cdecl;
    procedure request(request: SKRequest; didFailWithError: NSError); cdecl;
  end;

  SKProductsRequestDelegate = interface(IObjectiveC)
    ['{7820B198-17BA-4183-8112-6F57E489BC09}']
    procedure productsRequest(request: SKProductsRequest;
      didReceiveResponse: SKProductsResponse); cdecl;
  end;

  SKStoreProductViewControllerDelegate = interface(IObjectiveC)
    ['{FCC996FF-1052-4EDE-AC3F-0B7E495AAD7E}']
    procedure productViewControllerDidFinish(viewController
      : SKStoreProductViewController); cdecl;
  end;

  // ===== Exported string consts =====

function SKStorefrontIdentifierDidChangeNotification: NSString;
function SKCloudServiceCapabilitiesDidChangeNotification: NSString;
function SKDownloadTimeRemainingUnknown: Pointer;
function SKErrorDomain: NSString;
function SKReceiptPropertyIsExpired: NSString;
function SKReceiptPropertyIsRevoked: NSString;
function SKReceiptPropertyIsVolumePurchase: NSString;
function SKStoreProductParameterITunesItemIdentifier: NSString;
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

function SKStorefrontIdentifierDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKStorefrontIdentifierDidChangeNotification');
end;

function SKCloudServiceCapabilitiesDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libStoreKit,
    'SKCloudServiceCapabilitiesDidChangeNotification');
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
