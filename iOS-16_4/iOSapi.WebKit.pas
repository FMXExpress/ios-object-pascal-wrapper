{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework WebKit
//

unit iOSapi.WebKit;

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
  iOSapi.Security,
  iOSapi.UIKit;

const
  WKDownloadRedirectPolicyCancel = 0;
  WKDownloadRedirectPolicyAllow = 1;
  WKErrorUnknown = 1;
  WKErrorWebContentProcessTerminated = 2;
  WKErrorWebViewInvalidated = 3;
  WKErrorJavaScriptExceptionOccurred = 4;
  WKErrorJavaScriptResultTypeIsUnsupported = 5;
  WKErrorContentRuleListStoreCompileFailed = 6;
  WKErrorContentRuleListStoreLookUpFailed = 7;
  WKErrorContentRuleListStoreRemoveFailed = 8;
  WKErrorContentRuleListStoreVersionMismatch = 9;
  WKErrorAttributedStringContentFailedToLoad = 10;
  WKErrorAttributedStringContentLoadTimedOut = 11;
  WKErrorJavaScriptInvalidFrameTarget = 12;
  WKErrorNavigationAppBoundDomain = 13;
  WKErrorJavaScriptAppBoundDomain = 14;
  WKErrorDuplicateCredential = 15;
  WKErrorMalformedCredential = 16;
  WKErrorCredentialNotFound = 17;
  WKMediaPlaybackStateNone = 0;
  WKMediaPlaybackStatePlaying = 1;
  WKMediaPlaybackStatePaused = 2;
  WKMediaPlaybackStateSuspended = 3;
  WKMediaCaptureStateNone = 0;
  WKMediaCaptureStateActive = 1;
  WKMediaCaptureStateMuted = 2;
  WKFullscreenStateNotInFullscreen = 0;
  WKFullscreenStateEnteringFullscreen = 1;
  WKFullscreenStateInFullscreen = 2;
  WKFullscreenStateExitingFullscreen = 3;
  WKContentModeRecommended = 0;
  WKContentModeMobile = 1;
  WKContentModeDesktop = 2;
  WKNavigationTypeLinkActivated = 0;
  WKNavigationTypeFormSubmitted = 1;
  WKNavigationTypeBackForward = 2;
  WKNavigationTypeReload = 3;
  WKNavigationTypeFormResubmitted = 4;
  WKNavigationTypeOther = -1;
  WKNavigationActionPolicyCancel = 0;
  WKNavigationActionPolicyAllow = 1;
  WKNavigationActionPolicyDownload = 2;
  WKNavigationResponsePolicyCancel = 0;
  WKNavigationResponsePolicyAllow = 1;
  WKNavigationResponsePolicyDownload = 2;
  WKPermissionDecisionPrompt = 0;
  WKPermissionDecisionGrant = 1;
  WKPermissionDecisionDeny = 2;
  WKMediaCaptureTypeCamera = 0;
  WKMediaCaptureTypeMicrophone = 1;
  WKMediaCaptureTypeCameraAndMicrophone = 2;
  WKDialogResultShowDefault = 1;
  WKDialogResultAskAgain = 2;
  WKDialogResultHandled = 3;
  WKUserScriptInjectionTimeAtDocumentStart = 0;
  WKUserScriptInjectionTimeAtDocumentEnd = 1;
  WKDataDetectorTypeNone = 0;
  WKDataDetectorTypePhoneNumber = 1 shl 0;
  WKDataDetectorTypeLink = 1 shl 1;
  WKDataDetectorTypeAddress = 1 shl 2;
  WKDataDetectorTypeCalendarEvent = 1 shl 3;
  WKDataDetectorTypeTrackingNumber = 1 shl 4;
  WKDataDetectorTypeFlightNumber = 1 shl 5;
  WKDataDetectorTypeLookupSuggestion = 1 shl 6;
  WKDataDetectorTypeAll = 4294967295;
  WKDataDetectorTypeSpotlightSuggestion = WKDataDetectorTypeLookupSuggestion;
  WKSelectionGranularityDynamic = 0;
  WKSelectionGranularityCharacter = 1;
  WKAudiovisualMediaTypeNone = 0;
  WKAudiovisualMediaTypeAudio = 1 shl 0;
  WKAudiovisualMediaTypeVideo = 1 shl 1;
  WKAudiovisualMediaTypeAll = 4294967295;

type

  // ===== Forward declarations =====
{$M+}
  NSAttributedStringWebKitAdditions = interface;
  WKBackForwardListItem = interface;
  WKBackForwardList = interface;
  WKContentRuleList = interface;
  WKContentRuleListStore = interface;
  WKContentWorld = interface;
  WKContextMenuElementInfo = interface;
  WKFrameInfo = interface;
  WKWebView = interface;
  WKDownloadDelegate = interface;
  WKDownload = interface;
  WKFindConfiguration = interface;
  WKFindResult = interface;
  WKSecurityOrigin = interface;
  WKNavigation = interface;
  WKPDFConfiguration = interface;
  WKSnapshotConfiguration = interface;
  WKWebViewConfiguration = interface;
  WKNavigationDelegate = interface;
  WKUIDelegate = interface;
  WKHTTPCookieStore = interface;
  WKHTTPCookieStoreObserver = interface;
  WKWebpagePreferences = interface;
  WKNavigationAction = interface;
  WKNavigationResponse = interface;
  WKPreferences = interface;
  WKPreviewActionItem = interface;
  WKPreviewElementInfo = interface;
  WKProcessPool = interface;
  WKScriptMessage = interface;
  WKUserContentController = interface;
  WKScriptMessageHandler = interface;
  WKScriptMessageHandlerWithReply = interface;
  WKWindowFeatures = interface;
  WKURLSchemeTask = interface;
  WKURLSchemeHandler = interface;
  WKUserScript = interface;
  WKWebsiteDataStore = interface;
  WKWebsiteDataRecord = interface;

  // ===== Framework typedefs =====
{$M+}
  NSAttributedStringDocumentReadingOptionKey = NSString;
  PNSAttributedStringDocumentReadingOptionKey = ^
    NSAttributedStringDocumentReadingOptionKey;
  NSAttributedStringCompletionHandler = procedure(param1: NSAttributedString;
    param2: NSDictionary; param3: NSError) of object;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  TWebKitCompletionHandler = procedure(param1: WKContentRuleList;
    param2: NSError) of object;
  TWebKitCompletionHandler1 = procedure(param1: NSError) of object;
  TWebKitCompletionHandler2 = procedure(param1: NSArray) of object;
  TWebKitCompletionHandler3 = procedure(param1: NSData) of object;
  WKDownloadRedirectPolicy = NSInteger;
  TWebKitCompletionHandler4 = procedure(param1: NSURL) of object;
  TWebKitDecisionHandler = procedure(param1: WKDownloadRedirectPolicy)
    of object;
  NSURLSessionAuthChallengeDisposition = NSInteger;
  TWebKitCompletionHandler5 = procedure
    (param1: NSURLSessionAuthChallengeDisposition; param2: NSURLCredential)
    of object;
  WKErrorCode = NSInteger;
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

  SecTrustRef = Pointer;
  PSecTrustRef = ^SecTrustRef;
  TWebKitCompletionHandler6 = procedure(param1: Pointer; param2: NSError)
    of object;
  TWebKitCompletionHandler7 = procedure(param1: Integer; param2: NSError)
    of object;
  TWebKitCompletionHandler8 = procedure() of object;
  WKMediaPlaybackState = NSInteger;
  TWebKitCompletionHandler9 = procedure(param1: WKMediaPlaybackState) of object;
  WKMediaCaptureState = NSInteger;
  TWebKitCompletionHandler10 = procedure(param1: UIImage; param2: NSError)
    of object;
  TWebKitCompletionHandler11 = procedure(param1: NSData; param2: NSError)
    of object;
  TWebKitCompletionHandler12 = procedure(param1: WKFindResult) of object;
  TWebKitCompletionHandler13 = procedure(param1: WKDownload) of object;
  WKFullscreenState = NSInteger;

  UIEdgeInsets = record
    top: CGFloat;
    left: CGFloat;
    bottom: CGFloat;
    right: CGFloat;
  end;

  PUIEdgeInsets = ^UIEdgeInsets;

  WKContentMode = NSInteger;
  WKNavigationType = NSInteger;
  WKNavigationActionPolicy = NSInteger;
  WKNavigationResponsePolicy = NSInteger;
  TWebKitDecisionHandler1 = procedure(param1: WKNavigationActionPolicy)
    of object;
  TWebKitDecisionHandler2 = procedure(param1: WKNavigationActionPolicy;
    param2: WKWebpagePreferences) of object;
  TWebKitDecisionHandler3 = procedure(param1: WKNavigationResponsePolicy)
    of object;
  TWebKitShouldAllowDeprecatedTLS = procedure(param1: Boolean) of object;
  TWebKitReplyHandler = procedure(param1: Pointer; param2: NSString) of object;
  WKPermissionDecision = NSInteger;
  WKMediaCaptureType = NSInteger;
  WKDialogResult = NSInteger;
  TWebKitCompletionHandler14 = procedure(param1: NSString) of object;
  TWebKitDecisionHandler4 = procedure(param1: WKPermissionDecision) of object;
  TWebKitCompletionHandler15 = procedure(param1: UIContextMenuConfiguration)
    of object;
  TWebKitCompletionHandler16 = procedure(param1: WKDialogResult) of object;
  WKUserScriptInjectionTime = NSInteger;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  WKDataDetectorTypes = NSUInteger;
  WKSelectionGranularity = NSInteger;
  WKAudiovisualMediaTypes = NSUInteger;
  // ===== Interface declarations =====

  NSAttributedStringWebKitAdditions = interface(IObjectiveC)
    ['{7EAA1E7B-0FE4-456B-B265-CF7829412C0A}']
    procedure loadFromHTMLWithRequest(request: NSURLRequest;
      options: NSDictionary;
      completionHandler: NSAttributedStringCompletionHandler); cdecl;
    procedure loadFromHTMLWithFileURL(fileURL: NSURL; options: NSDictionary;
      completionHandler: NSAttributedStringCompletionHandler); cdecl;
    procedure loadFromHTMLWithString(&string: NSString; options: NSDictionary;
      completionHandler: NSAttributedStringCompletionHandler); cdecl;
    procedure loadFromHTMLWithData(data: NSData; options: NSDictionary;
      completionHandler: NSAttributedStringCompletionHandler); cdecl;
  end;

  WKBackForwardListItemClass = interface(NSObjectClass)
    ['{EBB1FE7F-A317-461A-8C98-4BB4E4BB98CA}']
  end;

  WKBackForwardListItem = interface(NSObject)
    ['{3DC9EBEF-5ACE-4CA8-B72A-50AB06A4DF4E}']
    function URL: NSURL; cdecl;
    function title: NSString; cdecl;
    function initialURL: NSURL; cdecl;
  end;

  TWKBackForwardListItem = class(TOCGenericImport<WKBackForwardListItemClass,
    WKBackForwardListItem>)
  end;

  PWKBackForwardListItem = Pointer;

  WKBackForwardListClass = interface(NSObjectClass)
    ['{B5B138E1-8821-47D1-91BB-B4CD7E70AD73}']
  end;

  WKBackForwardList = interface(NSObject)
    ['{06F2E37D-DDA9-4748-B3C3-AC684BB935A8}']
    function currentItem: WKBackForwardListItem; cdecl;
    function backItem: WKBackForwardListItem; cdecl;
    function forwardItem: WKBackForwardListItem; cdecl;
    function itemAtIndex(index: NSInteger): WKBackForwardListItem; cdecl;
    function backList: NSArray; cdecl;
    function forwardList: NSArray; cdecl;
  end;

  TWKBackForwardList = class(TOCGenericImport<WKBackForwardListClass,
    WKBackForwardList>)
  end;

  PWKBackForwardList = Pointer;

  WKContentRuleListClass = interface(NSObjectClass)
    ['{39984066-BA88-43A1-B0DC-0830A418463F}']
  end;

  WKContentRuleList = interface(NSObject)
    ['{27EE1F58-3EAF-4B60-B2B4-5850FBCD8DED}']
    function identifier: NSString; cdecl;
  end;

  TWKContentRuleList = class(TOCGenericImport<WKContentRuleListClass,
    WKContentRuleList>)
  end;

  PWKContentRuleList = Pointer;

  WKContentRuleListStoreClass = interface(NSObjectClass)
    ['{B1B9DA07-58CA-46F1-A681-C22E71559294}']
    { class } function defaultStore: Pointer { instancetype }; cdecl;
    { class } function storeWithURL(URL: NSURL)
      : Pointer { instancetype }; cdecl;
  end;

  WKContentRuleListStore = interface(NSObject)
    ['{F82C9187-1D03-4A88-B9F2-F5F3B592A9E1}']
    procedure compileContentRuleListForIdentifier(identifier: NSString;
      encodedContentRuleList: NSString;
      completionHandler: TWebKitCompletionHandler); cdecl;
    procedure lookUpContentRuleListForIdentifier(identifier: NSString;
      completionHandler: TWebKitCompletionHandler); cdecl;
    procedure removeContentRuleListForIdentifier(identifier: NSString;
      completionHandler: TWebKitCompletionHandler1); cdecl;
    procedure getAvailableContentRuleListIdentifiers(completionHandler
      : TWebKitCompletionHandler2); cdecl;
  end;

  TWKContentRuleListStore = class(TOCGenericImport<WKContentRuleListStoreClass,
    WKContentRuleListStore>)
  end;

  PWKContentRuleListStore = Pointer;

  WKContentWorldClass = interface(NSObjectClass)
    ['{B52AD320-0B81-4993-9D7B-53DDD89832F4}']
    { class } function worldWithName(name: NSString): WKContentWorld; cdecl;
  end;

  WKContentWorld = interface(NSObject)
    ['{EA4866A8-572E-45AC-85E0-4034773FC36C}']
    procedure setPageWorld(pageWorld: WKContentWorld); cdecl;
    function pageWorld: WKContentWorld; cdecl;
    procedure setDefaultClientWorld(defaultClientWorld: WKContentWorld); cdecl;
    function defaultClientWorld: WKContentWorld; cdecl;
    function name: NSString; cdecl;
  end;

  TWKContentWorld = class(TOCGenericImport<WKContentWorldClass, WKContentWorld>)
  end;

  PWKContentWorld = Pointer;

  WKContextMenuElementInfoClass = interface(NSObjectClass)
    ['{01029E7B-5BFB-4977-8355-49D4595C7CDC}']
  end;

  WKContextMenuElementInfo = interface(NSObject)
    ['{F13D0E38-8528-49F9-8D6B-B85AB8528952}']
    function linkURL: NSURL; cdecl;
  end;

  TWKContextMenuElementInfo = class
    (TOCGenericImport<WKContextMenuElementInfoClass, WKContextMenuElementInfo>)
  end;

  PWKContextMenuElementInfo = Pointer;

  WKFrameInfoClass = interface(NSObjectClass)
    ['{6057C8DA-824C-40F3-A4BE-519EC35D26CC}']
  end;

  WKFrameInfo = interface(NSObject)
    ['{E2A9C289-3D51-4B85-867C-4BBD47CEAC86}']
    function isMainFrame: Boolean; cdecl;
    function request: NSURLRequest; cdecl;
    function securityOrigin: WKSecurityOrigin; cdecl;
    function webView: WKWebView; cdecl;
  end;

  TWKFrameInfo = class(TOCGenericImport<WKFrameInfoClass, WKFrameInfo>)
  end;

  PWKFrameInfo = Pointer;

  WKWebViewClass = interface(UIViewClass)
    ['{9CFC9D78-B95B-42AA-9E86-CE44DE5BE213}']
    { class } function handlesURLScheme(urlScheme: NSString): Boolean; cdecl;
  end;

  WKWebView = interface(UIView)
    ['{68F921F0-4754-44A3-8A26-C05F6A175C09}']
    function configuration: WKWebViewConfiguration; cdecl;
    procedure setNavigationDelegate(navigationDelegate: Pointer); cdecl;
    function navigationDelegate: Pointer; cdecl;
    procedure setUIDelegate(UIDelegate: Pointer); cdecl;
    function UIDelegate: Pointer; cdecl;
    function backForwardList: WKBackForwardList; cdecl;
    function initWithFrame(frame: CGRect; configuration: WKWebViewConfiguration)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function loadRequest(request: NSURLRequest): WKNavigation; cdecl;
    function loadFileURL(URL: NSURL; allowingReadAccessToURL: NSURL)
      : WKNavigation; cdecl;
    function loadHTMLString(&string: NSString; baseURL: NSURL)
      : WKNavigation; cdecl;
    function loadData(data: NSData; MIMEType: NSString;
      characterEncodingName: NSString; baseURL: NSURL): WKNavigation; cdecl;
    function goToBackForwardListItem(item: WKBackForwardListItem)
      : WKNavigation; cdecl;
    function title: NSString; cdecl;
    function URL: NSURL; cdecl;
    function isLoading: Boolean; cdecl;
    function estimatedProgress: Double; cdecl;
    function hasOnlySecureContent: Boolean; cdecl;
    function serverTrust: SecTrustRef; cdecl;
    function canGoBack: Boolean; cdecl;
    function canGoForward: Boolean; cdecl;
    function goBack: WKNavigation; cdecl;
    function goForward: WKNavigation; cdecl;
    function reload: WKNavigation; cdecl;
    function reloadFromOrigin: WKNavigation; cdecl;
    procedure stopLoading; cdecl;
    [MethodName('evaluateJavaScript:completionHandler:')]
    procedure evaluateJavaScriptCompletionHandler(javaScriptString: NSString;
      completionHandler: TWebKitCompletionHandler6); cdecl;
    [MethodName('evaluateJavaScript:inFrame:inContentWorld:completionHandler:')]
    procedure evaluateJavaScriptInFrameInContentWorldCompletionHandler
      (javaScriptString: NSString; inFrame: WKFrameInfo;
      inContentWorld: WKContentWorld;
      completionHandler: TWebKitCompletionHandler6); cdecl;
    procedure callAsyncJavaScript(functionBody: NSString;
      arguments: NSDictionary; inFrame: WKFrameInfo;
      inContentWorld: WKContentWorld;
      completionHandler: TWebKitCompletionHandler7); cdecl;
    procedure closeAllMediaPresentationsWithCompletionHandler(completionHandler
      : TWebKitCompletionHandler8); cdecl;
    procedure closeAllMediaPresentations; cdecl;
    procedure pauseAllMediaPlaybackWithCompletionHandler(completionHandler
      : TWebKitCompletionHandler8); cdecl;
    procedure pauseAllMediaPlayback(completionHandler
      : TWebKitCompletionHandler8); cdecl;
    procedure setAllMediaPlaybackSuspended(suspended: Boolean;
      completionHandler: TWebKitCompletionHandler8); cdecl;
    procedure resumeAllMediaPlayback(completionHandler
      : TWebKitCompletionHandler8); cdecl;
    procedure suspendAllMediaPlayback(completionHandler
      : TWebKitCompletionHandler8); cdecl;
    procedure requestMediaPlaybackStateWithCompletionHandler(completionHandler
      : TWebKitCompletionHandler9); cdecl;
    procedure requestMediaPlaybackState(completionHandler
      : TWebKitCompletionHandler9); cdecl;
    function cameraCaptureState: WKMediaCaptureState; cdecl;
    function microphoneCaptureState: WKMediaCaptureState; cdecl;
    procedure setCameraCaptureState(state: WKMediaCaptureState;
      completionHandler: TWebKitCompletionHandler8); cdecl;
    procedure setMicrophoneCaptureState(state: WKMediaCaptureState;
      completionHandler: TWebKitCompletionHandler8); cdecl;
    procedure takeSnapshotWithConfiguration(snapshotConfiguration
      : WKSnapshotConfiguration;
      completionHandler: TWebKitCompletionHandler10); cdecl;
    procedure createPDFWithConfiguration(pdfConfiguration: WKPDFConfiguration;
      completionHandler: TWebKitCompletionHandler11); cdecl;
    procedure createWebArchiveDataWithCompletionHandler(completionHandler
      : TWebKitCompletionHandler11); cdecl;
    procedure setAllowsBackForwardNavigationGestures
      (allowsBackForwardNavigationGestures: Boolean); cdecl;
    function allowsBackForwardNavigationGestures: Boolean; cdecl;
    procedure setCustomUserAgent(customUserAgent: NSString); cdecl;
    function customUserAgent: NSString; cdecl;
    procedure setAllowsLinkPreview(allowsLinkPreview: Boolean); cdecl;
    function allowsLinkPreview: Boolean; cdecl;
    function scrollView: UIScrollView; cdecl;
    procedure setPageZoom(pageZoom: CGFloat); cdecl;
    function pageZoom: CGFloat; cdecl;
    procedure findString(&string: NSString;
      withConfiguration: WKFindConfiguration;
      completionHandler: TWebKitCompletionHandler12); cdecl;
    procedure startDownloadUsingRequest(request: NSURLRequest;
      completionHandler: TWebKitCompletionHandler13); cdecl;
    procedure resumeDownloadFromResumeData(resumeData: NSData;
      completionHandler: TWebKitCompletionHandler13); cdecl;
    procedure setMediaType(mediaType: NSString); cdecl;
    function mediaType: NSString; cdecl;
    procedure setInteractionState(interactionState: Pointer); cdecl;
    function interactionState: Pointer; cdecl;
    [MethodName('loadSimulatedRequest:response:responseData:')]
    function loadSimulatedRequestResponseResponseData(request: NSURLRequest;
      response: NSURLResponse; responseData: NSData): WKNavigation; cdecl;
    [MethodName('loadSimulatedRequest:withResponse:responseData:')]
    function loadSimulatedRequestWithResponseResponseData(request: NSURLRequest;
      withResponse: NSURLResponse; responseData: NSData): WKNavigation; cdecl;
    function loadFileRequest(request: NSURLRequest;
      allowingReadAccessToURL: NSURL): WKNavigation; cdecl;
    [MethodName('loadSimulatedRequest:responseHTMLString:')]
    function loadSimulatedRequestResponseHTMLString(request: NSURLRequest;
      responseHTMLString: NSString): WKNavigation; cdecl;
    [MethodName('loadSimulatedRequest:withResponseHTMLString:')]
    function loadSimulatedRequestWithResponseHTMLString(request: NSURLRequest;
      withResponseHTMLString: NSString): WKNavigation; cdecl;
    function themeColor: UIColor; cdecl;
    procedure setUnderPageBackgroundColor(underPageBackgroundColor
      : UIColor); cdecl;
    function underPageBackgroundColor: UIColor; cdecl;
    function fullscreenState: WKFullscreenState; cdecl;
    function minimumViewportInset: UIEdgeInsets; cdecl;
    function maximumViewportInset: UIEdgeInsets; cdecl;
    procedure setMinimumViewportInset(minimumViewportInset: UIEdgeInsets;
      maximumViewportInset: UIEdgeInsets); cdecl;
    procedure setFindInteractionEnabled(findInteractionEnabled: Boolean); cdecl;
    function isFindInteractionEnabled: Boolean; cdecl;
    function findInteraction: UIFindInteraction; cdecl;
    procedure setInspectable(inspectable: Boolean); cdecl;
    function isInspectable: Boolean; cdecl;
    function certificateChain: NSArray; cdecl;
  end;

  TWKWebView = class(TOCGenericImport<WKWebViewClass, WKWebView>)
  end;

  PWKWebView = Pointer;

  WKDownloadClass = interface(NSObjectClass)
    ['{E6ECCAAB-5D62-4BF5-97F9-1398C898BF5E}']
  end;

  WKDownload = interface(NSObject)
    ['{3B89A9F0-E9B0-4FD3-93B9-4CF502A679F9}']
    function originalRequest: NSURLRequest; cdecl;
    function webView: WKWebView; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure cancel(completionHandler: TWebKitCompletionHandler3); cdecl;
  end;

  TWKDownload = class(TOCGenericImport<WKDownloadClass, WKDownload>)
  end;

  PWKDownload = Pointer;

  WKFindConfigurationClass = interface(NSObjectClass)
    ['{1483BE3C-FE28-4D82-9B10-719717C864A2}']
  end;

  WKFindConfiguration = interface(NSObject)
    ['{07DA6ACE-3E83-4127-83A7-B98A5BAC4026}']
    procedure setBackwards(backwards: Boolean); cdecl;
    function backwards: Boolean; cdecl;
    procedure setCaseSensitive(caseSensitive: Boolean); cdecl;
    function caseSensitive: Boolean; cdecl;
    procedure setWraps(wraps: Boolean); cdecl;
    function wraps: Boolean; cdecl;
  end;

  TWKFindConfiguration = class(TOCGenericImport<WKFindConfigurationClass,
    WKFindConfiguration>)
  end;

  PWKFindConfiguration = Pointer;

  WKFindResultClass = interface(NSObjectClass)
    ['{8208DCE9-68F5-4316-BB27-C7B5B6F4B61F}']
  end;

  WKFindResult = interface(NSObject)
    ['{C088A218-B68B-44BA-99A9-DAE0E9F05BBD}']
    function matchFound: Boolean; cdecl;
  end;

  TWKFindResult = class(TOCGenericImport<WKFindResultClass, WKFindResult>)
  end;

  PWKFindResult = Pointer;

  WKSecurityOriginClass = interface(NSObjectClass)
    ['{C31CDD4F-3A3F-4877-8C72-30D27FED2FE8}']
  end;

  WKSecurityOrigin = interface(NSObject)
    ['{A79A37FB-7D3B-48F1-A839-8ED325A959BD}']
    function protocol: NSString; cdecl;
    function host: NSString; cdecl;
    function port: NSInteger; cdecl;
  end;

  TWKSecurityOrigin = class(TOCGenericImport<WKSecurityOriginClass,
    WKSecurityOrigin>)
  end;

  PWKSecurityOrigin = Pointer;

  WKNavigationClass = interface(NSObjectClass)
    ['{C92E5B63-D9E8-43EB-BC95-6F9EDE01090D}']
  end;

  WKNavigation = interface(NSObject)
    ['{6CA26B13-404A-49EA-813B-FE98DB8690AA}']
    function effectiveContentMode: WKContentMode; cdecl;
  end;

  TWKNavigation = class(TOCGenericImport<WKNavigationClass, WKNavigation>)
  end;

  PWKNavigation = Pointer;

  WKPDFConfigurationClass = interface(NSObjectClass)
    ['{0EF1D73F-7131-4F69-BBB8-EB8A5DBBCF08}']
  end;

  WKPDFConfiguration = interface(NSObject)
    ['{F7B159A5-1EB4-47FA-A1C1-5FF0B9272B5D}']
    procedure setRect(rect: CGRect); cdecl;
    function rect: CGRect; cdecl;
  end;

  TWKPDFConfiguration = class(TOCGenericImport<WKPDFConfigurationClass,
    WKPDFConfiguration>)
  end;

  PWKPDFConfiguration = Pointer;

  WKSnapshotConfigurationClass = interface(NSObjectClass)
    ['{49B05DE1-0CF8-4936-A35F-256EAA31A31A}']
  end;

  WKSnapshotConfiguration = interface(NSObject)
    ['{B89BD5DC-2CC4-4343-A5EA-88086A4FB0AD}']
    procedure setRect(rect: CGRect); cdecl;
    function rect: CGRect; cdecl;
    procedure setSnapshotWidth(snapshotWidth: NSNumber); cdecl;
    function snapshotWidth: NSNumber; cdecl;
    procedure setAfterScreenUpdates(afterScreenUpdates: Boolean); cdecl;
    function afterScreenUpdates: Boolean; cdecl;
  end;

  TWKSnapshotConfiguration = class
    (TOCGenericImport<WKSnapshotConfigurationClass, WKSnapshotConfiguration>)
  end;

  PWKSnapshotConfiguration = Pointer;

  WKWebViewConfigurationClass = interface(NSObjectClass)
    ['{171CD3B3-4BED-472A-AF19-CF2AD5E958A9}']
  end;

  WKWebViewConfiguration = interface(NSObject)
    ['{9912520C-FD6C-4276-B866-EBA362CE2820}']
    procedure setProcessPool(processPool: WKProcessPool); cdecl;
    function processPool: WKProcessPool; cdecl;
    procedure setPreferences(preferences: WKPreferences); cdecl;
    function preferences: WKPreferences; cdecl;
    procedure setUserContentController(userContentController
      : WKUserContentController); cdecl;
    function userContentController: WKUserContentController; cdecl;
    procedure setWebsiteDataStore(websiteDataStore: WKWebsiteDataStore); cdecl;
    function websiteDataStore: WKWebsiteDataStore; cdecl;
    procedure setSuppressesIncrementalRendering(suppressesIncrementalRendering
      : Boolean); cdecl;
    function suppressesIncrementalRendering: Boolean; cdecl;
    procedure setApplicationNameForUserAgent(applicationNameForUserAgent
      : NSString); cdecl;
    function applicationNameForUserAgent: NSString; cdecl;
    procedure setAllowsAirPlayForMediaPlayback(allowsAirPlayForMediaPlayback
      : Boolean); cdecl;
    function allowsAirPlayForMediaPlayback: Boolean; cdecl;
    procedure setUpgradeKnownHostsToHTTPS(upgradeKnownHostsToHTTPS
      : Boolean); cdecl;
    function upgradeKnownHostsToHTTPS: Boolean; cdecl;
    procedure setMediaTypesRequiringUserActionForPlayback
      (mediaTypesRequiringUserActionForPlayback
      : WKAudiovisualMediaTypes); cdecl;
    function mediaTypesRequiringUserActionForPlayback
      : WKAudiovisualMediaTypes; cdecl;
    procedure setDefaultWebpagePreferences(defaultWebpagePreferences
      : WKWebpagePreferences); cdecl;
    function defaultWebpagePreferences: WKWebpagePreferences; cdecl;
    procedure setLimitsNavigationsToAppBoundDomains
      (limitsNavigationsToAppBoundDomains: Boolean); cdecl;
    function limitsNavigationsToAppBoundDomains: Boolean; cdecl;
    procedure setAllowsInlineMediaPlayback(allowsInlineMediaPlayback
      : Boolean); cdecl;
    function allowsInlineMediaPlayback: Boolean; cdecl;
    procedure setSelectionGranularity(selectionGranularity
      : WKSelectionGranularity); cdecl;
    function selectionGranularity: WKSelectionGranularity; cdecl;
    procedure setAllowsPictureInPictureMediaPlayback
      (allowsPictureInPictureMediaPlayback: Boolean); cdecl;
    function allowsPictureInPictureMediaPlayback: Boolean; cdecl;
    procedure setDataDetectorTypes(dataDetectorTypes
      : WKDataDetectorTypes); cdecl;
    function dataDetectorTypes: WKDataDetectorTypes; cdecl;
    procedure setIgnoresViewportScaleLimits(ignoresViewportScaleLimits
      : Boolean); cdecl;
    function ignoresViewportScaleLimits: Boolean; cdecl;
    procedure setURLSchemeHandler(urlSchemeHandler: Pointer;
      forURLScheme: NSString); cdecl;
    function urlSchemeHandlerForURLScheme(urlScheme: NSString): Pointer; cdecl;
    procedure setMediaPlaybackRequiresUserAction(mediaPlaybackRequiresUserAction
      : Boolean); cdecl;
    function mediaPlaybackRequiresUserAction: Boolean; cdecl;
    procedure setMediaPlaybackAllowsAirPlay(mediaPlaybackAllowsAirPlay
      : Boolean); cdecl;
    function mediaPlaybackAllowsAirPlay: Boolean; cdecl;
    procedure setRequiresUserActionForMediaPlayback
      (requiresUserActionForMediaPlayback: Boolean); cdecl;
    function requiresUserActionForMediaPlayback: Boolean; cdecl;
  end;

  TWKWebViewConfiguration = class(TOCGenericImport<WKWebViewConfigurationClass,
    WKWebViewConfiguration>)
  end;

  PWKWebViewConfiguration = Pointer;

  WKHTTPCookieStoreClass = interface(NSObjectClass)
    ['{51F90EFB-ABBD-47D6-9A33-A85A2138A90A}']
  end;

  WKHTTPCookieStore = interface(NSObject)
    ['{C7E4833B-327A-44B7-8548-44D5D31C2212}']
    procedure getAllCookies(completionHandler
      : TWebKitCompletionHandler2); cdecl;
    procedure setCookie(cookie: NSHTTPCookie;
      completionHandler: TWebKitCompletionHandler8); cdecl;
    procedure deleteCookie(cookie: NSHTTPCookie;
      completionHandler: TWebKitCompletionHandler8); cdecl;
    procedure addObserver(observer: Pointer); cdecl;
    procedure removeObserver(observer: Pointer); cdecl;
  end;

  TWKHTTPCookieStore = class(TOCGenericImport<WKHTTPCookieStoreClass,
    WKHTTPCookieStore>)
  end;

  PWKHTTPCookieStore = Pointer;

  WKWebpagePreferencesClass = interface(NSObjectClass)
    ['{371B670B-A3E9-4D8B-8935-3D868EB33E4F}']
  end;

  WKWebpagePreferences = interface(NSObject)
    ['{4A26B39C-089F-40EB-9608-0937E805BA65}']
    procedure setPreferredContentMode(preferredContentMode
      : WKContentMode); cdecl;
    function preferredContentMode: WKContentMode; cdecl;
    procedure setAllowsContentJavaScript(allowsContentJavaScript
      : Boolean); cdecl;
    function allowsContentJavaScript: Boolean; cdecl;
    procedure setLockdownModeEnabled(lockdownModeEnabled: Boolean); cdecl;
    function isLockdownModeEnabled: Boolean; cdecl;
  end;

  TWKWebpagePreferences = class(TOCGenericImport<WKWebpagePreferencesClass,
    WKWebpagePreferences>)
  end;

  PWKWebpagePreferences = Pointer;

  WKNavigationActionClass = interface(NSObjectClass)
    ['{CD42F306-C1AE-4588-9894-3302128F7B79}']
  end;

  WKNavigationAction = interface(NSObject)
    ['{3621CB08-4249-4EAE-9AA5-4071EFC92E00}']
    function sourceFrame: WKFrameInfo; cdecl;
    function targetFrame: WKFrameInfo; cdecl;
    function navigationType: WKNavigationType; cdecl;
    function request: NSURLRequest; cdecl;
    function shouldPerformDownload: Boolean; cdecl;
  end;

  TWKNavigationAction = class(TOCGenericImport<WKNavigationActionClass,
    WKNavigationAction>)
  end;

  PWKNavigationAction = Pointer;

  WKNavigationResponseClass = interface(NSObjectClass)
    ['{ACDAA43C-86FD-48CC-BA87-9CA5C65B6344}']
  end;

  WKNavigationResponse = interface(NSObject)
    ['{96A7A8BF-400B-4A77-96B1-4C2FDA05D9E7}']
    function isForMainFrame: Boolean; cdecl;
    function response: NSURLResponse; cdecl;
    function canShowMIMEType: Boolean; cdecl;
  end;

  TWKNavigationResponse = class(TOCGenericImport<WKNavigationResponseClass,
    WKNavigationResponse>)
  end;

  PWKNavigationResponse = Pointer;

  WKPreferencesClass = interface(NSObjectClass)
    ['{C11F361A-85BD-48A5-B364-D94352368B10}']
  end;

  WKPreferences = interface(NSObject)
    ['{559F123C-8F61-45E9-804E-0D69953382E0}']
    procedure setMinimumFontSize(minimumFontSize: CGFloat); cdecl;
    function minimumFontSize: CGFloat; cdecl;
    procedure setJavaScriptCanOpenWindowsAutomatically
      (javaScriptCanOpenWindowsAutomatically: Boolean); cdecl;
    function javaScriptCanOpenWindowsAutomatically: Boolean; cdecl;
    procedure setFraudulentWebsiteWarningEnabled(fraudulentWebsiteWarningEnabled
      : Boolean); cdecl;
    function isFraudulentWebsiteWarningEnabled: Boolean; cdecl;
    procedure setShouldPrintBackgrounds(shouldPrintBackgrounds: Boolean); cdecl;
    function shouldPrintBackgrounds: Boolean; cdecl;
    procedure setTextInteractionEnabled(textInteractionEnabled: Boolean); cdecl;
    function isTextInteractionEnabled: Boolean; cdecl;
    procedure setSiteSpecificQuirksModeEnabled(siteSpecificQuirksModeEnabled
      : Boolean); cdecl;
    function isSiteSpecificQuirksModeEnabled: Boolean; cdecl;
    procedure setElementFullscreenEnabled(elementFullscreenEnabled
      : Boolean); cdecl;
    function isElementFullscreenEnabled: Boolean; cdecl;
    procedure setJavaScriptEnabled(javaScriptEnabled: Boolean); cdecl;
    function javaScriptEnabled: Boolean; cdecl;
  end;

  TWKPreferences = class(TOCGenericImport<WKPreferencesClass, WKPreferences>)
  end;

  PWKPreferences = Pointer;

  WKPreviewElementInfoClass = interface(NSObjectClass)
    ['{F01C26FB-E773-40E6-85F4-08328CCE612A}']
  end;

  WKPreviewElementInfo = interface(NSObject)
    ['{02AEA54A-F776-473A-9B6E-E092BC5668A7}']
    function linkURL: NSURL; cdecl;
  end;

  TWKPreviewElementInfo = class(TOCGenericImport<WKPreviewElementInfoClass,
    WKPreviewElementInfo>)
  end;

  PWKPreviewElementInfo = Pointer;

  WKProcessPoolClass = interface(NSObjectClass)
    ['{4F908772-0AD6-4CFB-AF6D-4BEA49A09879}']
  end;

  WKProcessPool = interface(NSObject)
    ['{6A2AFCD3-C00B-4F04-A0D7-656B87CDF642}']
  end;

  TWKProcessPool = class(TOCGenericImport<WKProcessPoolClass, WKProcessPool>)
  end;

  PWKProcessPool = Pointer;

  WKScriptMessageClass = interface(NSObjectClass)
    ['{A5BD2952-0362-4158-B285-1198B2EE8B54}']
  end;

  WKScriptMessage = interface(NSObject)
    ['{31099CDE-B577-475A-AA0A-F5F368AAD52A}']
    function body: Pointer; cdecl;
    function webView: WKWebView; cdecl;
    function frameInfo: WKFrameInfo; cdecl;
    function name: NSString; cdecl;
    function world: WKContentWorld; cdecl;
  end;

  TWKScriptMessage = class(TOCGenericImport<WKScriptMessageClass,
    WKScriptMessage>)
  end;

  PWKScriptMessage = Pointer;

  WKUserContentControllerClass = interface(NSObjectClass)
    ['{E35ACE58-C2BF-47B3-99D0-EC015F18A7BD}']
  end;

  WKUserContentController = interface(NSObject)
    ['{1FBDA87B-2A84-4FE7-94BA-F84FF4ECF229}']
    function userScripts: NSArray; cdecl;
    procedure addUserScript(userScript: WKUserScript); cdecl;
    procedure removeAllUserScripts; cdecl;
    [MethodName('addScriptMessageHandler:contentWorld:name:')]
    procedure addScriptMessageHandlerContentWorldName(scriptMessageHandler
      : Pointer; contentWorld: WKContentWorld; name: NSString); cdecl;
    procedure addScriptMessageHandlerWithReply(scriptMessageHandlerWithReply
      : Pointer; contentWorld: WKContentWorld; name: NSString); cdecl;
    [MethodName('addScriptMessageHandler:name:')]
    procedure addScriptMessageHandlerName(scriptMessageHandler: Pointer;
      name: NSString); cdecl;
    [MethodName('removeScriptMessageHandlerForName:contentWorld:')]
    procedure removeScriptMessageHandlerForNameContentWorld(name: NSString;
      contentWorld: WKContentWorld); cdecl;
    [MethodName('removeScriptMessageHandlerForName:')]
    procedure removeScriptMessageHandlerForName(name: NSString); cdecl;
    procedure removeAllScriptMessageHandlersFromContentWorld
      (contentWorld: WKContentWorld); cdecl;
    procedure removeAllScriptMessageHandlers; cdecl;
    procedure addContentRuleList(contentRuleList: WKContentRuleList); cdecl;
    procedure removeContentRuleList(contentRuleList: WKContentRuleList); cdecl;
    procedure removeAllContentRuleLists; cdecl;
  end;

  TWKUserContentController = class
    (TOCGenericImport<WKUserContentControllerClass, WKUserContentController>)
  end;

  PWKUserContentController = Pointer;

  WKWindowFeaturesClass = interface(NSObjectClass)
    ['{53CE4324-6D7B-429C-9398-FEBAC0B09E45}']
  end;

  WKWindowFeatures = interface(NSObject)
    ['{53CAC82D-9511-4D5E-868A-F565884FFDA5}']
    function menuBarVisibility: NSNumber; cdecl;
    function statusBarVisibility: NSNumber; cdecl;
    function toolbarsVisibility: NSNumber; cdecl;
    function allowsResizing: NSNumber; cdecl;
    function x: NSNumber; cdecl;
    function y: NSNumber; cdecl;
    function width: NSNumber; cdecl;
    function height: NSNumber; cdecl;
  end;

  TWKWindowFeatures = class(TOCGenericImport<WKWindowFeaturesClass,
    WKWindowFeatures>)
  end;

  PWKWindowFeatures = Pointer;

  WKUserScriptClass = interface(NSObjectClass)
    ['{14BA9764-84B8-4712-9944-50BB12CD0A9E}']
  end;

  WKUserScript = interface(NSObject)
    ['{4D977D23-AF6D-4D70-ACB7-B758F6CE8460}']
    function source: NSString; cdecl;
    function injectionTime: WKUserScriptInjectionTime; cdecl;
    function isForMainFrameOnly: Boolean; cdecl;
    [MethodName('initWithSource:injectionTime:forMainFrameOnly:')]
    function initWithSourceInjectionTimeForMainFrameOnly(source: NSString;
      injectionTime: WKUserScriptInjectionTime; forMainFrameOnly: Boolean)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('initWithSource:injectionTime:forMainFrameOnly:inContentWorld:')]
    function initWithSourceInjectionTimeForMainFrameOnlyInContentWorld
      (source: NSString; injectionTime: WKUserScriptInjectionTime;
      forMainFrameOnly: Boolean; inContentWorld: WKContentWorld)
      : Pointer { instancetype }; cdecl;
  end;

  TWKUserScript = class(TOCGenericImport<WKUserScriptClass, WKUserScript>)
  end;

  PWKUserScript = Pointer;

  WKWebsiteDataStoreClass = interface(NSObjectClass)
    ['{9C41C4E5-AA30-4B07-97CE-421F1B37384E}']
    { class } function defaultDataStore: WKWebsiteDataStore; cdecl;
    { class } function nonPersistentDataStore: WKWebsiteDataStore; cdecl;
    { class } function allWebsiteDataTypes: NSSet; cdecl;
  end;

  WKWebsiteDataStore = interface(NSObject)
    ['{FBCB5F53-FEBA-4A10-9B2C-8D0FEB1F8274}']
    function isPersistent: Boolean; cdecl;
    procedure fetchDataRecordsOfTypes(dataTypes: NSSet;
      completionHandler: TWebKitCompletionHandler2); cdecl;
    [MethodName('removeDataOfTypes:forDataRecords:completionHandler:')]
    procedure removeDataOfTypesForDataRecordsCompletionHandler(dataTypes: NSSet;
      forDataRecords: NSArray;
      completionHandler: TWebKitCompletionHandler8); cdecl;
    [MethodName('removeDataOfTypes:modifiedSince:completionHandler:')]
    procedure removeDataOfTypesModifiedSinceCompletionHandler(dataTypes: NSSet;
      modifiedSince: NSDate;
      completionHandler: TWebKitCompletionHandler8); cdecl;
    function httpCookieStore: WKHTTPCookieStore; cdecl;
  end;

  TWKWebsiteDataStore = class(TOCGenericImport<WKWebsiteDataStoreClass,
    WKWebsiteDataStore>)
  end;

  PWKWebsiteDataStore = Pointer;

  WKWebsiteDataRecordClass = interface(NSObjectClass)
    ['{B2410253-AF60-4DE8-BE8C-8FB04646A6E1}']
  end;

  WKWebsiteDataRecord = interface(NSObject)
    ['{E09D78B6-2861-4B6D-9EAF-C17E98060F1C}']
    function displayName: NSString; cdecl;
    function dataTypes: NSSet; cdecl;
  end;

  TWKWebsiteDataRecord = class(TOCGenericImport<WKWebsiteDataRecordClass,
    WKWebsiteDataRecord>)
  end;

  PWKWebsiteDataRecord = Pointer;

  // ===== Protocol declarations =====

  WKDownloadDelegate = interface(IObjectiveC)
    ['{2231814F-E319-4D88-BD42-EAC77136DDC7}']
    [MethodName
      ('download:decideDestinationUsingResponse:suggestedFilename:completionHandler:')
      ]
    procedure downloadDecideDestinationUsingResponseSuggestedFilenameCompletionHandler
      (download: WKDownload; decideDestinationUsingResponse: NSURLResponse;
      suggestedFilename: NSString;
      completionHandler: TWebKitCompletionHandler4); cdecl;
    [MethodName
      ('download:willPerformHTTPRedirection:newRequest:decisionHandler:')]
    procedure downloadWillPerformHTTPRedirectionNewRequestDecisionHandler
      (download: WKDownload; willPerformHTTPRedirection: NSHTTPURLResponse;
      newRequest: NSURLRequest; decisionHandler: TWebKitDecisionHandler); cdecl;
    [MethodName
      ('download:didReceiveAuthenticationChallenge:completionHandler:')]
    procedure downloadDidReceiveAuthenticationChallengeCompletionHandler
      (download: WKDownload; didReceiveAuthenticationChallenge
      : NSURLAuthenticationChallenge;
      completionHandler: TWebKitCompletionHandler5); cdecl;
    procedure downloadDidFinish(download: WKDownload); cdecl;
    [MethodName('download:didFailWithError:resumeData:')]
    procedure downloadDidFailWithErrorResumeData(download: WKDownload;
      didFailWithError: NSError; resumeData: NSData); cdecl;
  end;

  WKNavigationDelegate = interface(IObjectiveC)
    ['{7CD1172C-0BD6-4B52-A866-57D94774F385}']
    [MethodName('webView:decidePolicyForNavigationAction:decisionHandler:')]
    procedure webViewDecidePolicyForNavigationActionDecisionHandler
      (webView: WKWebView; decidePolicyForNavigationAction: WKNavigationAction;
      decisionHandler: TWebKitDecisionHandler1); cdecl;
    [MethodName
      ('webView:decidePolicyForNavigationAction:preferences:decisionHandler:')]
    procedure webViewDecidePolicyForNavigationActionPreferencesDecisionHandler
      (webView: WKWebView; decidePolicyForNavigationAction: WKNavigationAction;
      preferences: WKWebpagePreferences;
      decisionHandler: TWebKitDecisionHandler2); cdecl;
    [MethodName('webView:decidePolicyForNavigationResponse:decisionHandler:')]
    procedure webViewDecidePolicyForNavigationResponseDecisionHandler
      (webView: WKWebView; decidePolicyForNavigationResponse
      : WKNavigationResponse; decisionHandler: TWebKitDecisionHandler3); cdecl;
    [MethodName('webView:didStartProvisionalNavigation:')]
    procedure webViewDidStartProvisionalNavigation(webView: WKWebView;
      didStartProvisionalNavigation: WKNavigation); cdecl;
    [MethodName('webView:didReceiveServerRedirectForProvisionalNavigation:')]
    procedure webViewDidReceiveServerRedirectForProvisionalNavigation
      (webView: WKWebView; didReceiveServerRedirectForProvisionalNavigation
      : WKNavigation); cdecl;
    [MethodName('webView:didFailProvisionalNavigation:withError:')]
    procedure webViewDidFailProvisionalNavigationWithError(webView: WKWebView;
      didFailProvisionalNavigation: WKNavigation; withError: NSError); cdecl;
    [MethodName('webView:didCommitNavigation:')]
    procedure webViewDidCommitNavigation(webView: WKWebView;
      didCommitNavigation: WKNavigation); cdecl;
    [MethodName('webView:didFinishNavigation:')]
    procedure webViewDidFinishNavigation(webView: WKWebView;
      didFinishNavigation: WKNavigation); cdecl;
    [MethodName('webView:didFailNavigation:withError:')]
    procedure webViewDidFailNavigationWithError(webView: WKWebView;
      didFailNavigation: WKNavigation; withError: NSError); cdecl;
    [MethodName('webView:didReceiveAuthenticationChallenge:completionHandler:')]
    procedure webViewDidReceiveAuthenticationChallengeCompletionHandler
      (webView: WKWebView; didReceiveAuthenticationChallenge
      : NSURLAuthenticationChallenge;
      completionHandler: TWebKitCompletionHandler5); cdecl;
    procedure webViewWebContentProcessDidTerminate(webView: WKWebView); cdecl;
    [MethodName('webView:authenticationChallenge:shouldAllowDeprecatedTLS:')]
    procedure webViewAuthenticationChallengeShouldAllowDeprecatedTLS
      (webView: WKWebView;
      authenticationChallenge: NSURLAuthenticationChallenge;
      shouldAllowDeprecatedTLS: TWebKitShouldAllowDeprecatedTLS); cdecl;
    [MethodName('webView:navigationAction:didBecomeDownload:')]
    procedure webViewNavigationActionDidBecomeDownload(webView: WKWebView;
      navigationAction: WKNavigationAction;
      didBecomeDownload: WKDownload); cdecl;
    [MethodName('webView:navigationResponse:didBecomeDownload:')]
    procedure webViewNavigationResponseDidBecomeDownload(webView: WKWebView;
      navigationResponse: WKNavigationResponse;
      didBecomeDownload: WKDownload); cdecl;
  end;

  WKUIDelegate = interface(IObjectiveC)
    ['{971F36E8-6C25-49D1-8887-108F5DE443B9}']
    [MethodName
      ('webView:createWebViewWithConfiguration:forNavigationAction:windowFeatures:')
      ]
    function webViewCreateWebViewWithConfigurationForNavigationActionWindowFeatures
      (webView: WKWebView; createWebViewWithConfiguration
      : WKWebViewConfiguration; forNavigationAction: WKNavigationAction;
      windowFeatures: WKWindowFeatures): WKWebView; cdecl;
    procedure webViewDidClose(webView: WKWebView); cdecl;
    [MethodName
      ('webView:runJavaScriptAlertPanelWithMessage:initiatedByFrame:completionHandler:')
      ]
    procedure webViewRunJavaScriptAlertPanelWithMessageInitiatedByFrameCompletionHandler
      (webView: WKWebView; runJavaScriptAlertPanelWithMessage: NSString;
      initiatedByFrame: WKFrameInfo;
      completionHandler: TWebKitCompletionHandler8); cdecl;
    [MethodName
      ('webView:runJavaScriptConfirmPanelWithMessage:initiatedByFrame:completionHandler:')
      ]
    procedure webViewRunJavaScriptConfirmPanelWithMessageInitiatedByFrameCompletionHandler
      (webView: WKWebView; runJavaScriptConfirmPanelWithMessage: NSString;
      initiatedByFrame: WKFrameInfo;
      completionHandler: TWebKitShouldAllowDeprecatedTLS); cdecl;
    [MethodName
      ('webView:runJavaScriptTextInputPanelWithPrompt:defaultText:initiatedByFrame:completionHandler:')
      ]
    procedure webViewRunJavaScriptTextInputPanelWithPromptDefaultTextInitiatedByFrameCompletionHandler
      (webView: WKWebView; runJavaScriptTextInputPanelWithPrompt: NSString;
      defaultText: NSString; initiatedByFrame: WKFrameInfo;
      completionHandler: TWebKitCompletionHandler14); cdecl;
    [MethodName
      ('webView:requestMediaCapturePermissionForOrigin:initiatedByFrame:type:decisionHandler:')
      ]
    procedure webViewRequestMediaCapturePermissionForOriginInitiatedByFrameTypeDecisionHandler
      (webView: WKWebView; requestMediaCapturePermissionForOrigin
      : WKSecurityOrigin; initiatedByFrame: WKFrameInfo;
      &type: WKMediaCaptureType;
      decisionHandler: TWebKitDecisionHandler4); cdecl;
    [MethodName
      ('webView:requestDeviceOrientationAndMotionPermissionForOrigin:initiatedByFrame:decisionHandler:')
      ]
    procedure webViewRequestDeviceOrientationAndMotionPermissionForOriginInitiatedByFrameDecisionHandler
      (webView: WKWebView; requestDeviceOrientationAndMotionPermissionForOrigin
      : WKSecurityOrigin; initiatedByFrame: WKFrameInfo;
      decisionHandler: TWebKitDecisionHandler4); cdecl;
    [MethodName('webView:shouldPreviewElement:')]
    function webViewShouldPreviewElement(webView: WKWebView;
      shouldPreviewElement: WKPreviewElementInfo): Boolean; cdecl;
    [MethodName('webView:previewingViewControllerForElement:defaultActions:')]
    function webViewPreviewingViewControllerForElementDefaultActions
      (webView: WKWebView; previewingViewControllerForElement
      : WKPreviewElementInfo; defaultActions: NSArray): UIViewController; cdecl;
    [MethodName('webView:commitPreviewingViewController:')]
    procedure webViewCommitPreviewingViewController(webView: WKWebView;
      commitPreviewingViewController: UIViewController); cdecl;
    [MethodName
      ('webView:contextMenuConfigurationForElement:completionHandler:')]
    procedure webViewContextMenuConfigurationForElementCompletionHandler
      (webView: WKWebView; contextMenuConfigurationForElement
      : WKContextMenuElementInfo;
      completionHandler: TWebKitCompletionHandler15); cdecl;
    [MethodName('webView:contextMenuWillPresentForElement:')]
    procedure webViewContextMenuWillPresentForElement(webView: WKWebView;
      contextMenuWillPresentForElement: WKContextMenuElementInfo); cdecl;
    [MethodName('webView:contextMenuForElement:willCommitWithAnimator:')]
    procedure webViewContextMenuForElementWillCommitWithAnimator
      (webView: WKWebView; contextMenuForElement: WKContextMenuElementInfo;
      willCommitWithAnimator: Pointer); cdecl;
    [MethodName('webView:contextMenuDidEndForElement:')]
    procedure webViewContextMenuDidEndForElement(webView: WKWebView;
      contextMenuDidEndForElement: WKContextMenuElementInfo); cdecl;
    [MethodName('webView:showLockdownModeFirstUseMessage:completionHandler:')]
    procedure webViewShowLockdownModeFirstUseMessageCompletionHandler
      (webView: WKWebView; showLockdownModeFirstUseMessage: NSString;
      completionHandler: TWebKitCompletionHandler16); cdecl;
    [MethodName('webView:willPresentEditMenuWithAnimator:')]
    procedure webViewWillPresentEditMenuWithAnimator(webView: WKWebView;
      willPresentEditMenuWithAnimator: Pointer); cdecl;
    [MethodName('webView:willDismissEditMenuWithAnimator:')]
    procedure webViewWillDismissEditMenuWithAnimator(webView: WKWebView;
      willDismissEditMenuWithAnimator: Pointer); cdecl;
  end;

  WKHTTPCookieStoreObserver = interface(IObjectiveC)
    ['{094003C9-B01C-47B7-82DF-A6F3A124F9E1}']
    procedure cookiesDidChangeInCookieStore(cookieStore
      : WKHTTPCookieStore); cdecl;
  end;

  WKPreviewActionItem = interface(IObjectiveC)
    ['{51FA40A0-3958-4912-AE44-6115BD1D3543}']
    function identifier: NSString; cdecl;
  end;

  WKScriptMessageHandler = interface(IObjectiveC)
    ['{6CB08497-06E5-44D6-99CF-9FF8B77E3AD8}']
    procedure userContentController(userContentController
      : WKUserContentController;
      didReceiveScriptMessage: WKScriptMessage); cdecl;
  end;

  WKScriptMessageHandlerWithReply = interface(IObjectiveC)
    ['{50ECC0F4-3B02-4800-9B10-146F2471CEF1}']
    procedure userContentController(userContentController
      : WKUserContentController; didReceiveScriptMessage: WKScriptMessage;
      replyHandler: TWebKitReplyHandler); cdecl;
  end;

  WKURLSchemeTask = interface(IObjectiveC)
    ['{AD044A5F-05BD-4FC8-8C00-E201FEB250CD}']
    function request: NSURLRequest; cdecl;
    procedure didReceiveResponse(response: NSURLResponse); cdecl;
    procedure didReceiveData(data: NSData); cdecl;
    procedure didFinish; cdecl;
    procedure didFailWithError(error: NSError); cdecl;
  end;

  WKURLSchemeHandler = interface(IObjectiveC)
    ['{7C3F13A7-5C70-4216-8040-CAFBF902FD3F}']
    [MethodName('webView:startURLSchemeTask:')]
    procedure webViewStartURLSchemeTask(webView: WKWebView;
      startURLSchemeTask: Pointer); cdecl;
    [MethodName('webView:stopURLSchemeTask:')]
    procedure webViewStopURLSchemeTask(webView: WKWebView;
      stopURLSchemeTask: Pointer); cdecl;
  end;

  // ===== Exported string consts =====

function NSReadAccessURLDocumentOption: Pointer;
function WKErrorDomain: NSString;
function WKPreviewActionItemIdentifierOpen: NSString;
function WKPreviewActionItemIdentifierAddToReadingList: NSString;
function WKPreviewActionItemIdentifierCopy: NSString;
function WKPreviewActionItemIdentifierShare: NSString;
function WKWebsiteDataTypeFetchCache: NSString;
function WKWebsiteDataTypeDiskCache: NSString;
function WKWebsiteDataTypeMemoryCache: NSString;
function WKWebsiteDataTypeOfflineWebApplicationCache: NSString;
function WKWebsiteDataTypeCookies: NSString;
function WKWebsiteDataTypeSessionStorage: NSString;
function WKWebsiteDataTypeLocalStorage: NSString;
function WKWebsiteDataTypeWebSQLDatabases: NSString;
function WKWebsiteDataTypeIndexedDBDatabases: NSString;
function WKWebsiteDataTypeServiceWorkerRegistrations: NSString;
function WKWebsiteDataTypeFileSystem: NSString;


// ===== External functions =====

const
  libWebKit = '/System/Library/Frameworks/WebKit.framework/WebKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  WebKitModule: THandle;

{$ENDIF IOS}

function WKErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libWebKit, 'WKErrorDomain');
end;

function WKPreviewActionItemIdentifierOpen: NSString;
begin
  Result := CocoaNSStringConst(libWebKit, 'WKPreviewActionItemIdentifierOpen');
end;

function WKPreviewActionItemIdentifierAddToReadingList: NSString;
begin
  Result := CocoaNSStringConst(libWebKit,
    'WKPreviewActionItemIdentifierAddToReadingList');
end;

function WKPreviewActionItemIdentifierCopy: NSString;
begin
  Result := CocoaNSStringConst(libWebKit, 'WKPreviewActionItemIdentifierCopy');
end;

function WKPreviewActionItemIdentifierShare: NSString;
begin
  Result := CocoaNSStringConst(libWebKit, 'WKPreviewActionItemIdentifierShare');
end;

function WKWebsiteDataTypeFetchCache: NSString;
begin
  Result := CocoaNSStringConst(libWebKit, 'WKWebsiteDataTypeFetchCache');
end;

function WKWebsiteDataTypeDiskCache: NSString;
begin
  Result := CocoaNSStringConst(libWebKit, 'WKWebsiteDataTypeDiskCache');
end;

function WKWebsiteDataTypeMemoryCache: NSString;
begin
  Result := CocoaNSStringConst(libWebKit, 'WKWebsiteDataTypeMemoryCache');
end;

function WKWebsiteDataTypeOfflineWebApplicationCache: NSString;
begin
  Result := CocoaNSStringConst(libWebKit,
    'WKWebsiteDataTypeOfflineWebApplicationCache');
end;

function WKWebsiteDataTypeCookies: NSString;
begin
  Result := CocoaNSStringConst(libWebKit, 'WKWebsiteDataTypeCookies');
end;

function WKWebsiteDataTypeSessionStorage: NSString;
begin
  Result := CocoaNSStringConst(libWebKit, 'WKWebsiteDataTypeSessionStorage');
end;

function WKWebsiteDataTypeLocalStorage: NSString;
begin
  Result := CocoaNSStringConst(libWebKit, 'WKWebsiteDataTypeLocalStorage');
end;

function WKWebsiteDataTypeWebSQLDatabases: NSString;
begin
  Result := CocoaNSStringConst(libWebKit, 'WKWebsiteDataTypeWebSQLDatabases');
end;

function WKWebsiteDataTypeIndexedDBDatabases: NSString;
begin
  Result := CocoaNSStringConst(libWebKit,
    'WKWebsiteDataTypeIndexedDBDatabases');
end;

function WKWebsiteDataTypeServiceWorkerRegistrations: NSString;
begin
  Result := CocoaNSStringConst(libWebKit,
    'WKWebsiteDataTypeServiceWorkerRegistrations');
end;

function WKWebsiteDataTypeFileSystem: NSString;
begin
  Result := CocoaNSStringConst(libWebKit, 'WKWebsiteDataTypeFileSystem');
end;

function NSReadAccessURLDocumentOption: Pointer;
begin
  Result := CocoaPointerConst(libWebKit, 'NSReadAccessURLDocumentOption');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

WebKitModule := dlopen(MarshaledAString(libWebKit), RTLD_LAZY);

finalization

dlclose(WebKitModule);
{$ENDIF IOS}

end.
