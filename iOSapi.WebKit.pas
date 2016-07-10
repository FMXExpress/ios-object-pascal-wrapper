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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  WKErrorUnknown = 1;
  WKErrorWebContentProcessTerminated = 2;
  WKErrorWebViewInvalidated = 3;
  WKErrorJavaScriptExceptionOccurred = 4;
  WKErrorJavaScriptResultTypeIsUnsupported = 5;
  WKNavigationTypeLinkActivated = 0;
  WKNavigationTypeFormSubmitted = 1;
  WKNavigationTypeBackForward = 2;
  WKNavigationTypeReload = 3;
  WKNavigationTypeFormResubmitted = 4;
  WKNavigationTypeOther = -1;
  WKNavigationActionPolicyCancel = 0;
  WKNavigationActionPolicyAllow = 1;
  WKNavigationResponsePolicyCancel = 0;
  WKNavigationResponsePolicyAllow = 1;
  WKUserScriptInjectionTimeAtDocumentStart = 0;
  WKUserScriptInjectionTimeAtDocumentEnd = 1;
  WKSelectionGranularityDynamic = 0;
  WKSelectionGranularityCharacter = 1;

type

  // ===== Forward declarations =====
{$M+}
  WKBackForwardListItem = interface;
  WKBackForwardList = interface;
  WKSecurityOrigin = interface;
  WKFrameInfo = interface;
  WKNavigation = interface;
  WKNavigationAction = interface;
  WKNavigationResponse = interface;
  WKWebView = interface;
  WKNavigationDelegate = interface;
  WKPreferences = interface;
  WKProcessPool = interface;
  WKScriptMessage = interface;
  WKUserContentController = interface;
  WKScriptMessageHandler = interface;
  WKWebViewConfiguration = interface;
  WKWindowFeatures = interface;
  WKUIDelegate = interface;
  WKUserScript = interface;
  WKWebsiteDataStore = interface;
  WKWebsiteDataRecord = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  WKErrorCode = NSInteger;
  WKNavigationType = NSInteger;
  WKNavigationActionPolicy = NSInteger;
  WKNavigationResponsePolicy = NSInteger;
  TWebKitDecisionHandler = procedure(param1: WKNavigationActionPolicy)
    of object;
  TWebKitDecisionHandler1 = procedure(param1: WKNavigationResponsePolicy)
    of object;
  NSURLSessionAuthChallengeDisposition = NSInteger;
  TWebKitCompletionHandler = procedure
    (param1: NSURLSessionAuthChallengeDisposition; param2: NSURLCredential)
    of object;
  CGFloat = Single;
  TWebKitCompletionHandler1 = procedure() of object;
  TWebKitCompletionHandler2 = procedure(param1: Boolean) of object;
  TWebKitCompletionHandler3 = procedure(param1: NSString) of object;
  WKUserScriptInjectionTime = NSInteger;
  CGPoint = CGPoint = record x: CGFloat;
y:
CGFloat;
end;
PCGPoint = ^CGPoint;;
CGSize = CGSize = record width: CGFloat;
height:
CGFloat;
end;
PCGSize = ^CGSize;;
CGRect = CGRect = record origin: CGPoint;
size:
CGSize;
end;
PCGRect = ^CGRect;;
TWebKitCompletionHandler4 =
procedure(param1: Pointer; param2: NSError) of object;
WKSelectionGranularity = NSInteger;
TWebKitCompletionHandler5 =
procedure(param1: NSArray) of object;
// ===== Interface declarations =====

WKBackForwardListItemClass = interface(NSObjectClass)
  ['{9B73937F-E15A-4398-B558-826509F45415}']
end;
WKBackForwardListItem = interface(NSObject)
  ['{61ED3CC1-727D-4956-B340-166FD8C3C97B}']
function URL: NSURL;
cdecl;

function title: NSString; cdecl;
  function initialURL: NSURL; cdecl;
  end;

TWKBackForwardListItem = class(TOCGenericImport<WKBackForwardListItemClass,
  WKBackForwardListItem>)
end;
PWKBackForwardListItem = Pointer;

WKBackForwardListClass = interface(NSObjectClass)
  ['{75867AAE-0E28-406D-B431-9187E2339922}']
end;
WKBackForwardList = interface(NSObject)
  ['{9D71CDC0-4BB0-4332-8CD9-6042DB219DDE}']
function currentItem: WKBackForwardListItem;
cdecl;

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

WKSecurityOriginClass = interface(NSObjectClass)
  ['{47B2A7A4-DAEA-4E9E-8CB6-089100C5D7CD}']
end;
WKSecurityOrigin = interface(NSObject)['{344B0337-3830-4FA3-B72C-BF61CE983617}']
function protocol: NSString;
cdecl;

function host: NSString; cdecl;
  function port: NSInteger; cdecl;
  end;

TWKSecurityOrigin = class(TOCGenericImport<WKSecurityOriginClass,
  WKSecurityOrigin>)
end;
PWKSecurityOrigin = Pointer;

WKFrameInfoClass = interface(NSObjectClass)
  ['{066D870D-499D-477D-95ED-334164723ADC}']
end;
WKFrameInfo = interface(NSObject)['{B01CFD97-4CBB-440A-9E6E-A5443C58BA36}']
function isMainFrame: Boolean;
cdecl;

function request: NSURLRequest; cdecl;
  function securityOrigin: WKSecurityOrigin; cdecl;
  end;

TWKFrameInfo = class(TOCGenericImport<WKFrameInfoClass, WKFrameInfo>)
end;
PWKFrameInfo = Pointer;

WKNavigationClass = interface(NSObjectClass)
  ['{EBC82E8B-E8FA-4345-B95C-BC04ADEC4154}']
end;
WKNavigation = interface(NSObject)['{F8573D00-BACE-4B05-853A-45BBD467C7FD}']
end;

TWKNavigation = class(TOCGenericImport<WKNavigationClass, WKNavigation>)
end;
PWKNavigation = Pointer;

WKNavigationActionClass = interface(NSObjectClass)
  ['{9A0DAB84-F109-4F71-A47B-C0AB90C63238}']
end;
WKNavigationAction = interface(NSObject)
  ['{6BC34366-4E4A-485A-B339-B87C9E8521D8}']
function sourceFrame: WKFrameInfo;
cdecl;

function targetFrame: WKFrameInfo; cdecl;
  function navigationType: WKNavigationType; cdecl;
    function request: NSURLRequest; cdecl;
    end;

TWKNavigationAction = class(TOCGenericImport<WKNavigationActionClass,
  WKNavigationAction>)
end;
PWKNavigationAction = Pointer;

WKNavigationResponseClass = interface(NSObjectClass)
  ['{E7D41A1E-7147-480D-955D-61F8D8A68BCC}']
end;
WKNavigationResponse = interface(NSObject)
  ['{1E933BA9-E654-401E-99E4-50E301A25DB5}']
function isForMainFrame: Boolean;
cdecl;

function response: NSURLResponse; cdecl;
  function canShowMIMEType: Boolean; cdecl;
  end;

TWKNavigationResponse = class(TOCGenericImport<WKNavigationResponseClass,
  WKNavigationResponse>)
end;
PWKNavigationResponse = Pointer;

WKWebViewClass = interface(UIViewClass)
  ['{79C96747-3BDA-4274-A984-B66E9DCC0C47}']
end;
WKWebView = interface(UIView)['{6B4B6A44-E7D8-4821-B68A-70440B023AA5}']
function configuration: WKWebViewConfiguration;
cdecl;

procedure setNavigationDelegate(navigationDelegate: Pointer); cdecl;
  function navigationDelegate: Pointer; cdecl;
    procedure setUIDelegate(UIDelegate: Pointer); cdecl;
      function UIDelegate: Pointer; cdecl;
        function backForwardList: WKBackForwardList; cdecl;
          function initWithFrame(frame: CGRect;
            configuration: WKWebViewConfiguration)
            : Pointer { instancetype }; cdecl;
            function loadRequest(request: NSURLRequest): WKNavigation; cdecl;
              function loadFileURL(URL: NSURL; allowingReadAccessToURL: NSURL)
                : WKNavigation; cdecl;
                function loadHTMLString(&string: NSString; baseURL: NSURL)
                  : WKNavigation; cdecl;
                  function loadData(data: NSData; MIMEType: NSString;
                    characterEncodingName: NSString; baseURL: NSURL)
                    : WKNavigation; cdecl;
                    function goToBackForwardListItem
                      (item: WKBackForwardListItem): WKNavigation; cdecl;
                      function title: NSString; cdecl;
                        function URL: NSURL; cdecl;
                          function isLoading: Boolean; cdecl;
                            function estimatedProgress: Double; cdecl;
                              function hasOnlySecureContent: Boolean; cdecl;
                                function certificateChain: NSArray; cdecl;
                                  function canGoBack: Boolean; cdecl;
                                    function canGoForward: Boolean; cdecl;
                                      function goBack: WKNavigation; cdecl;
                                        function goForward: WKNavigation; cdecl;
                                        function reload: WKNavigation; cdecl;
                                        function reloadFromOrigin
                                        : WKNavigation; cdecl;
                                        procedure stopLoading; cdecl;
                                        procedure evaluateJavaScript
                                        (javaScriptString: NSString;
                                        completionHandler
                                        : TWebKitCompletionHandler4); cdecl;
                                        procedure setAllowsBackForwardNavigationGestures
                                        (allowsBackForwardNavigationGestures
                                        : Boolean); cdecl;
                                        function allowsBackForwardNavigationGestures
                                        : Boolean; cdecl;
                                        procedure setCustomUserAgent
                                        (customUserAgent: NSString); cdecl;
                                        function customUserAgent
                                        : NSString; cdecl;
                                        procedure setAllowsLinkPreview
                                        (allowsLinkPreview: Boolean); cdecl;
                                        function allowsLinkPreview
                                        : Boolean; cdecl;
                                        function scrollView
                                        : UIScrollView; cdecl;
                                        end;

                                        TWKWebView = class
                                        (TOCGenericImport<WKWebViewClass,
                                        WKWebView>)
                                        end;
                                        PWKWebView = Pointer;

                                        WKPreferencesClass = interface
                                        (NSObjectClass)
                                        ['{D212698E-D060-4F7B-B660-07B1F7018FEC}']
                                        end;
                                        WKPreferences = interface(NSObject)
                                        ['{8F5F3991-2C90-4830-BCAC-4979CA252416}']
                                        procedure setMinimumFontSize
                                        (minimumFontSize: CGFloat);
                                        cdecl;
                                        function minimumFontSize
                                        : CGFloat; cdecl;
                                        procedure setJavaScriptEnabled
                                        (javaScriptEnabled: Boolean); cdecl;
                                        function javaScriptEnabled
                                        : Boolean; cdecl;
                                        procedure setJavaScriptCanOpenWindowsAutomatically
                                        (javaScriptCanOpenWindowsAutomatically
                                        : Boolean); cdecl;
                                        function javaScriptCanOpenWindowsAutomatically
                                        : Boolean; cdecl;
                                        end;

                                        TWKPreferences = class
                                        (TOCGenericImport<WKPreferencesClass,
                                        WKPreferences>)
                                        end;
                                        PWKPreferences = Pointer;

                                        WKProcessPoolClass = interface
                                        (NSObjectClass)
                                        ['{068C3FB2-3801-4852-B199-CC79090C179D}']
                                        end;
                                        WKProcessPool = interface(NSObject)
                                        ['{B2B51468-C14A-4B2D-A1EA-D2757FF0481D}']
                                        end;

                                        TWKProcessPool = class
                                        (TOCGenericImport<WKProcessPoolClass,
                                        WKProcessPool>)
                                        end;
                                        PWKProcessPool = Pointer;

                                        WKScriptMessageClass = interface
                                        (NSObjectClass)
                                        ['{FA7DE6DC-B331-482C-8EF7-6AB9DCD9AB77}']
                                        end;
                                    WKScriptMessage = interface(NSObject)
                                      ['{EF2C8CBD-6E49-4180-9377-AB02EC1C3941}']
                                    function body: Pointer;
                                    cdecl;
                                      function webView: WKWebView; cdecl;
                                        function frameInfo: WKFrameInfo; cdecl;
                                        function name: NSString; cdecl;
                                        end;

                                      TWKScriptMessage = class
                                        (TOCGenericImport<WKScriptMessageClass,
                                        WKScriptMessage>)
                                      end;
                                  PWKScriptMessage = Pointer;

                                  WKUserContentControllerClass = interface
                                    (NSObjectClass)
                                    ['{E27B0135-45BE-428C-ACE2-C8748118CF3D}']
                                  end;
                              WKUserContentController = interface(NSObject)
                                ['{A8E90C86-9DA4-49DE-9927-132DDB3498B1}']
                              function userScripts: NSArray;
                              cdecl;
                                procedure addUserScript
                                  (userScript: WKUserScript); cdecl;
                                  procedure removeAllUserScripts; cdecl;
                                    procedure addScriptMessageHandler
                                      (scriptMessageHandler: Pointer;
                                      name: NSString); cdecl;
                                      procedure removeScriptMessageHandlerForName
                                        (name: NSString); cdecl;
                                      end;

                                  TWKUserContentController = class
                                    (TOCGenericImport<
                                    WKUserContentControllerClass,
                                    WKUserContentController>)
                                  end;
                              PWKUserContentController = Pointer;

                              WKWebViewConfigurationClass = interface
                                (NSObjectClass)
                                ['{F7914E17-B34F-4822-9BDC-374010DA8346}']
                              end;
                          WKWebViewConfiguration = interface(NSObject)
                            ['{BD1A8EFB-9848-4233-BA0B-2CC29648EEBE}']
                          procedure setProcessPool(processPool: WKProcessPool);
                          cdecl;
                            function processPool: WKProcessPool; cdecl;
                              procedure setPreferences
                                (preferences: WKPreferences); cdecl;
                                function preferences: WKPreferences; cdecl;
                                  procedure setUserContentController
                                    (userContentController
                                    : WKUserContentController); cdecl;
                                    function userContentController
                                      : WKUserContentController; cdecl;
                                      procedure setWebsiteDataStore
                                        (websiteDataStore
                                        : WKWebsiteDataStore); cdecl;
                                        function websiteDataStore
                                        : WKWebsiteDataStore; cdecl;
                                        procedure setSuppressesIncrementalRendering
                                        (suppressesIncrementalRendering
                                        : Boolean); cdecl;
                                        function suppressesIncrementalRendering
                                        : Boolean; cdecl;
                                        procedure setApplicationNameForUserAgent
                                        (applicationNameForUserAgent
                                        : NSString); cdecl;
                                        function applicationNameForUserAgent
                                        : NSString; cdecl;
                                        procedure setAllowsAirPlayForMediaPlayback
                                        (allowsAirPlayForMediaPlayback
                                        : Boolean); cdecl;
                                        function allowsAirPlayForMediaPlayback
                                        : Boolean; cdecl;
                                        procedure setAllowsInlineMediaPlayback
                                        (allowsInlineMediaPlayback
                                        : Boolean); cdecl;
                                        function allowsInlineMediaPlayback
                                        : Boolean; cdecl;
                                        procedure setRequiresUserActionForMediaPlayback
                                        (requiresUserActionForMediaPlayback
                                        : Boolean); cdecl;
                                        function requiresUserActionForMediaPlayback
                                        : Boolean; cdecl;
                                        procedure setSelectionGranularity
                                        (selectionGranularity
                                        : WKSelectionGranularity); cdecl;
                                        function selectionGranularity
                                        : WKSelectionGranularity; cdecl;
                                        procedure setAllowsPictureInPictureMediaPlayback
                                        (allowsPictureInPictureMediaPlayback
                                        : Boolean); cdecl;
                                        function allowsPictureInPictureMediaPlayback
                                        : Boolean; cdecl;
                                        procedure setMediaPlaybackRequiresUserAction
                                        (mediaPlaybackRequiresUserAction
                                        : Boolean); cdecl;
                                        function mediaPlaybackRequiresUserAction
                                        : Boolean; cdecl;
                                        procedure setMediaPlaybackAllowsAirPlay
                                        (mediaPlaybackAllowsAirPlay
                                        : Boolean); cdecl;
                                        function mediaPlaybackAllowsAirPlay
                                        : Boolean; cdecl;
                                        end;

                                        TWKWebViewConfiguration = class
                                        (TOCGenericImport<
                                        WKWebViewConfigurationClass,
                                        WKWebViewConfiguration>)
                                        end;
                                        PWKWebViewConfiguration = Pointer;

                                        WKWindowFeaturesClass = interface
                                        (NSObjectClass)
                                        ['{E6D19834-8324-4109-8D95-D2AADB3FA451}']
                                        end;
                                        WKWindowFeatures = interface(NSObject)
                                        ['{7E402D41-FBE2-4A2A-89B6-A0CE1E3055E7}']
                                        function menuBarVisibility: NSNumber;
                                        cdecl;
                                        function statusBarVisibility
                                        : NSNumber; cdecl;
                                        function toolbarsVisibility
                                        : NSNumber; cdecl;
                                        function allowsResizing
                                        : NSNumber; cdecl;
                                        function x: NSNumber; cdecl;
                                        function y: NSNumber; cdecl;
                                        function width: NSNumber; cdecl;
                                        function height: NSNumber; cdecl;
                                        end;

                                        TWKWindowFeatures = class
                                        (TOCGenericImport<WKWindowFeaturesClass,
                                        WKWindowFeatures>)
                                        end;
                                        PWKWindowFeatures = Pointer;

                                        WKUserScriptClass = interface
                                        (NSObjectClass)
                                        ['{A253E134-A3D0-4794-A472-580FB7B2D9FA}']
                                        end;
                                        WKUserScript = interface(NSObject)
                                        ['{172661FE-78F9-41C1-8768-F645602979E4}']
                                        function source: NSString;
                                        cdecl;
                                        function injectionTime
                                        : WKUserScriptInjectionTime; cdecl;
                                        function isForMainFrameOnly
                                        : Boolean; cdecl;
                                        function initWithSource
                                        (source: NSString;
                                        injectionTime
                                        : WKUserScriptInjectionTime;
                                        forMainFrameOnly: Boolean)
                                        : Pointer { instancetype }; cdecl;
                                        end;

                                        TWKUserScript = class
                                        (TOCGenericImport<WKUserScriptClass,
                                        WKUserScript>)
                                        end;
                                        PWKUserScript = Pointer;

                                        WKWebsiteDataStoreClass = interface
                                        (NSObjectClass)
                                        ['{F5E9A7BD-1E5B-48DB-8B90-EA35EA1C42FF}']
                                        { class } function defaultDataStore
                                        : WKWebsiteDataStore;
                                        cdecl;
                                        { class } function
                                        nonPersistentDataStore
                                        : WKWebsiteDataStore; cdecl;
                                        { class } function allWebsiteDataTypes
                                        : NSSet; cdecl;
                                        end;
                                        WKWebsiteDataStore = interface(NSObject)
                                        ['{D35B36F9-1C27-4391-BD8D-F913F2D5A7C1}']
                                        function isPersistent: Boolean;
                                        cdecl;
                                        procedure fetchDataRecordsOfTypes
                                        (dataTypes: NSSet;
                                        completionHandler
                                        : TWebKitCompletionHandler5); cdecl;
                                        [MethodName
                                        ('removeDataOfTypes:forDataRecords:completionHandler:')
                                        ]
                                        procedure removeDataOfTypesForDataRecordsCompletionHandler
                                        (dataTypes: NSSet;
                                        forDataRecords: NSArray;
                                        completionHandler
                                        : TWebKitCompletionHandler1); cdecl;
                                        [MethodName
                                        ('removeDataOfTypes:modifiedSince:completionHandler:')
                                        ]
                                        procedure removeDataOfTypesModifiedSinceCompletionHandler
                                        (websiteDataTypes: NSSet;
                                        modifiedSince: NSDate;
                                        completionHandler
                                        : TWebKitCompletionHandler1); cdecl;
                                        end;

                                        TWKWebsiteDataStore = class
                                        (TOCGenericImport<
                                        WKWebsiteDataStoreClass,
                                        WKWebsiteDataStore>)
                                        end;
                                        PWKWebsiteDataStore = Pointer;

                                        WKWebsiteDataRecordClass = interface
                                        (NSObjectClass)
                                        ['{5632E132-CABC-4885-9BFD-8B336AFF423B}']
                                        end;
                                        WKWebsiteDataRecord = interface
                                        (NSObject)
                                        ['{735CF82C-DE55-4513-8506-D42FDAACB334}']
                                        function displayName: NSString;
                                        cdecl;
                                        function dataTypes: NSSet; cdecl;
                                        end;

                                        TWKWebsiteDataRecord = class
                                        (TOCGenericImport<
                                        WKWebsiteDataRecordClass,
                                        WKWebsiteDataRecord>)
                                        end;
                                        PWKWebsiteDataRecord = Pointer;

                                        // ===== Protocol declarations =====

                                        WKNavigationDelegate = interface
                                        (IObjectiveC)
                                        ['{1875641B-73F5-486A-A77E-80F4DE3EA3D1}']
                                        [MethodName
                                        ('webView:decidePolicyForNavigationAction:decisionHandler:')
                                        ]
                                        procedure webViewDecidePolicyForNavigationActionDecisionHandler
                                        (webView: WKWebView;
                                        decidePolicyForNavigationAction
                                        : WKNavigationAction;
                                        decisionHandler
                                        : TWebKitDecisionHandler);
                                        cdecl;
                                        [MethodName
                                        ('webView:decidePolicyForNavigationResponse:decisionHandler:')
                                        ]
                                        procedure webViewDecidePolicyForNavigationResponseDecisionHandler
                                        (webView: WKWebView;
                                        decidePolicyForNavigationResponse
                                        : WKNavigationResponse;
                                        decisionHandler
                                        : TWebKitDecisionHandler1); cdecl;
                                        [MethodName
                                        ('webView:didStartProvisionalNavigation:')
                                        ]
                                        procedure webViewDidStartProvisionalNavigation
                                        (webView: WKWebView;
                                        didStartProvisionalNavigation
                                        : WKNavigation); cdecl;
                                        [MethodName
                                        ('webView:didReceiveServerRedirectForProvisionalNavigation:')
                                        ]
                                        procedure webViewDidReceiveServerRedirectForProvisionalNavigation
                                        (webView: WKWebView;
                                        didReceiveServerRedirectForProvisionalNavigation
                                        : WKNavigation); cdecl;
                                        [MethodName
                                        ('webView:didFailProvisionalNavigation:withError:')
                                        ]
                                        procedure webViewDidFailProvisionalNavigationWithError
                                        (webView: WKWebView;
                                        didFailProvisionalNavigation
                                        : WKNavigation;
                                        withError: NSError); cdecl;
                                        [MethodName
                                        ('webView:didCommitNavigation:')]
                                        procedure webViewDidCommitNavigation
                                        (webView: WKWebView;
                                        didCommitNavigation
                                        : WKNavigation); cdecl;
                                        [MethodName
                                        ('webView:didFinishNavigation:')]
                                        procedure webViewDidFinishNavigation
                                        (webView: WKWebView;
                                        didFinishNavigation
                                        : WKNavigation); cdecl;
                                        [MethodName
                                        ('webView:didFailNavigation:withError:')
                                        ]
                                        procedure webViewDidFailNavigationWithError
                                        (webView: WKWebView;
                                        didFailNavigation: WKNavigation;
                                        withError: NSError); cdecl;
                                        [MethodName
                                        ('webView:didReceiveAuthenticationChallenge:completionHandler:')
                                        ]
                                        procedure webViewDidReceiveAuthenticationChallengeCompletionHandler
                                        (webView: WKWebView;
                                        didReceiveAuthenticationChallenge
                                        : NSURLAuthenticationChallenge;
                                        completionHandler
                                        : TWebKitCompletionHandler); cdecl;
                                        procedure webViewWebContentProcessDidTerminate
                                        (webView: WKWebView); cdecl;
                                        end;

                                        WKScriptMessageHandler = interface
                                        (IObjectiveC)
                                        ['{F661E4D9-6630-43AF-8552-DD42FA1C3CCC}']
                                        procedure userContentController
                                        (userContentController
                                        : WKUserContentController;
                                        didReceiveScriptMessage
                                        : WKScriptMessage);
                                        cdecl;
                                        end;

                                        WKUIDelegate = interface(IObjectiveC)
                                        ['{B5B6F77E-D131-4E2A-A151-BB1CF1198E19}']
                                        [MethodName
                                        ('webView:createWebViewWithConfiguration:forNavigationAction:windowFeatures:')
                                        ]
                                        function webViewCreateWebViewWithConfigurationForNavigationActionWindowFeatures
                                        (webView: WKWebView;
                                        createWebViewWithConfiguration
                                        : WKWebViewConfiguration;
                                        forNavigationAction: WKNavigationAction;
                                        windowFeatures: WKWindowFeatures)
                                        : WKWebView;
                                        cdecl;
                                        procedure webViewDidClose
                                        (webView: WKWebView); cdecl;
                                        [MethodName
                                        ('webView:runJavaScriptAlertPanelWithMessage:initiatedByFrame:completionHandler:')
                                        ]
                                        procedure webViewRunJavaScriptAlertPanelWithMessageInitiatedByFrameCompletionHandler
                                        (webView: WKWebView;
                                        runJavaScriptAlertPanelWithMessage
                                        : NSString;
                                        initiatedByFrame: WKFrameInfo;
                                        completionHandler
                                        : TWebKitCompletionHandler1); cdecl;
                                        [MethodName
                                        ('webView:runJavaScriptConfirmPanelWithMessage:initiatedByFrame:completionHandler:')
                                        ]
                                        procedure webViewRunJavaScriptConfirmPanelWithMessageInitiatedByFrameCompletionHandler
                                        (webView: WKWebView;
                                        runJavaScriptConfirmPanelWithMessage
                                        : NSString;
                                        initiatedByFrame: WKFrameInfo;
                                        completionHandler
                                        : TWebKitCompletionHandler2); cdecl;
                                        [MethodName
                                        ('webView:runJavaScriptTextInputPanelWithPrompt:defaultText:initiatedByFrame:completionHandler:')
                                        ]
                                        procedure webViewRunJavaScriptTextInputPanelWithPromptDefaultTextInitiatedByFrameCompletionHandler
                                        (webView: WKWebView;
                                        runJavaScriptTextInputPanelWithPrompt
                                        : NSString; defaultText: NSString;
                                        initiatedByFrame: WKFrameInfo;
                                        completionHandler
                                        : TWebKitCompletionHandler3); cdecl;
                                        end;

                                        // ===== Exported string consts =====

                                        function WKErrorDomain: NSString;
                                        function WKWebsiteDataTypeDiskCache
                                        : NSString;
                                        function WKWebsiteDataTypeMemoryCache
                                        : NSString;
                                        function WKWebsiteDataTypeOfflineWebApplicationCache
                                        : NSString;
                                        function WKWebsiteDataTypeCookies
                                        : NSString;
                                        function WKWebsiteDataTypeSessionStorage
                                        : NSString;
                                        function WKWebsiteDataTypeLocalStorage
                                        : NSString;
                                        function WKWebsiteDataTypeWebSQLDatabases
                                        : NSString;
                                        function WKWebsiteDataTypeIndexedDBDatabases
                                        : NSString;


                                        // ===== External functions =====

                                        const
                                        libWebKit =
                                        '/System/Library/Frameworks/WebKit.framework/WebKit';

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

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

WebKitModule := dlopen(MarshaledAString(libWebKit), RTLD_LAZY);

finalization

dlclose(WebKitModule);
{$ENDIF IOS}

end.
