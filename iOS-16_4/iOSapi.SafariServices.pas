{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework SafariServices
//

unit iOSapi.SafariServices;

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
  SFAuthenticationErrorCanceledLogin = 1;
  SFErrorNoExtensionFound = 1;
  SFErrorNoAttachmentFound = 2;
  SFErrorLoadingInterrupted = 3;
  SFContentBlockerNoExtensionFound = SFErrorNoExtensionFound;
  SFContentBlockerNoAttachmentFound = SFErrorNoAttachmentFound;
  SFContentBlockerLoadingInterrupted = SFErrorLoadingInterrupted;
  SFSafariViewControllerDismissButtonStyleDone = 0;
  SFSafariViewControllerDismissButtonStyleClose = 1;
  SFSafariViewControllerDismissButtonStyleCancel = 2;
  SSReadingListErrorURLSchemeNotAllowed = 1;

type

  // ===== Forward declarations =====
{$M+}
  SFAuthenticationSession = interface;
  SFContentBlockerState = interface;
  SFContentBlockerManager = interface;
  SFSafariViewControllerConfiguration = interface;
  SFSafariViewControllerPrewarmingToken = interface;
  SFSafariViewControllerDelegate = interface;
  SFSafariViewController = interface;
  SFSafariViewControllerActivityButton = interface;
  SFSafariViewControllerDataStore = interface;
  SSReadingList = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  SFAuthenticationError = NSInteger;
  SFAuthenticationCompletionHandler = procedure(param1: NSURL; param2: NSError)
    of object;
  SFErrorCode = NSInteger;
  SFContentBlockerErrorCode = NSInteger;
  TSafariServicesCompletionHandler = procedure(param1: NSError) of object;
  TSafariServicesCompletionHandler1 = procedure(param1: SFContentBlockerState;
    param2: NSError) of object;
  SFSafariViewControllerDismissButtonStyle = NSInteger;
  TSafariServicesCompletion = procedure() of object;
  SSReadingListErrorCode = NSInteger;
  // ===== Interface declarations =====

  SFAuthenticationSessionClass = interface(NSObjectClass)
    ['{828111A5-5901-44BB-8488-3D9F29E13DEE}']
  end;

  SFAuthenticationSession = interface(NSObject)
    ['{85A1CD19-F7AA-4244-B3A7-8569B3EA0656}']
    function initWithURL(URL: NSURL; callbackURLScheme: NSString;
      completionHandler: SFAuthenticationCompletionHandler)
      : Pointer { instancetype }; cdecl;
    function start: Boolean; cdecl;
    procedure cancel; cdecl;
  end;

  TSFAuthenticationSession = class
    (TOCGenericImport<SFAuthenticationSessionClass, SFAuthenticationSession>)
  end;

  PSFAuthenticationSession = Pointer;

  SFContentBlockerStateClass = interface(NSObjectClass)
    ['{854A68B0-552D-4D1C-A725-D5CA1EDC4BBF}']
  end;

  SFContentBlockerState = interface(NSObject)
    ['{31681063-3872-416E-849F-1031B1DEBC0F}']
    function isEnabled: Boolean; cdecl;
  end;

  TSFContentBlockerState = class(TOCGenericImport<SFContentBlockerStateClass,
    SFContentBlockerState>)
  end;

  PSFContentBlockerState = Pointer;

  SFContentBlockerManagerClass = interface(NSObjectClass)
    ['{C1A36C67-3751-49B0-9339-BDEC007E7FF8}']
    { class } procedure reloadContentBlockerWithIdentifier(identifier: NSString;
      completionHandler: TSafariServicesCompletionHandler); cdecl;
    { class } procedure getStateOfContentBlockerWithIdentifier
      (identifier: NSString;
      completionHandler: TSafariServicesCompletionHandler1); cdecl;
  end;

  SFContentBlockerManager = interface(NSObject)
    ['{6F485228-4520-4DEC-9A70-54E4147330D9}']
  end;

  TSFContentBlockerManager = class
    (TOCGenericImport<SFContentBlockerManagerClass, SFContentBlockerManager>)
  end;

  PSFContentBlockerManager = Pointer;

  SFSafariViewControllerConfigurationClass = interface(NSObjectClass)
    ['{95E8E4B1-8526-4B32-84C3-9D2A543C5C4F}']
  end;

  SFSafariViewControllerConfiguration = interface(NSObject)
    ['{4CC2B84E-9AC1-4EFA-88B6-BFAF4674B940}']
    procedure setEntersReaderIfAvailable(entersReaderIfAvailable
      : Boolean); cdecl;
    function entersReaderIfAvailable: Boolean; cdecl;
    procedure setBarCollapsingEnabled(barCollapsingEnabled: Boolean); cdecl;
    function barCollapsingEnabled: Boolean; cdecl;
    procedure setActivityButton(activityButton
      : SFSafariViewControllerActivityButton); cdecl;
    function activityButton: SFSafariViewControllerActivityButton; cdecl;
    procedure setEventAttribution(eventAttribution: UIEventAttribution); cdecl;
    function eventAttribution: UIEventAttribution; cdecl;
  end;

  TSFSafariViewControllerConfiguration = class
    (TOCGenericImport<SFSafariViewControllerConfigurationClass,
    SFSafariViewControllerConfiguration>)
  end;

  PSFSafariViewControllerConfiguration = Pointer;

  SFSafariViewControllerPrewarmingTokenClass = interface(NSObjectClass)
    ['{0CBC6A81-6E4F-48A5-8975-29BD2D3715C6}']
  end;

  SFSafariViewControllerPrewarmingToken = interface(NSObject)
    ['{871E7A29-7B7F-4CB2-A6FE-CBCA5C0F973C}']
    procedure invalidate; cdecl;
  end;

  TSFSafariViewControllerPrewarmingToken = class
    (TOCGenericImport<SFSafariViewControllerPrewarmingTokenClass,
    SFSafariViewControllerPrewarmingToken>)
  end;

  PSFSafariViewControllerPrewarmingToken = Pointer;

  SFSafariViewControllerClass = interface(UIViewControllerClass)
    ['{D9C33C37-F109-40AC-9E78-34ED830F250D}']
    { class } function prewarmConnectionsToURLs(URLs: NSArray)
      : SFSafariViewControllerPrewarmingToken; cdecl;
  end;

  SFSafariViewController = interface(UIViewController)
    ['{B3B946F1-4B82-4EB3-8BC7-79635487324F}']
    [MethodName('initWithURL:configuration:')]
    function initWithURLConfiguration(URL: NSURL;
      configuration: SFSafariViewControllerConfiguration)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithURL:entersReaderIfAvailable:')]
    function initWithURLEntersReaderIfAvailable(URL: NSURL;
      entersReaderIfAvailable: Boolean): Pointer { instancetype }; cdecl;
    [MethodName('initWithURL:')]
    function initWithURL(URL: NSURL): Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function configuration: SFSafariViewControllerConfiguration; cdecl;
    procedure setPreferredBarTintColor(preferredBarTintColor: UIColor); cdecl;
    function preferredBarTintColor: UIColor; cdecl;
    procedure setPreferredControlTintColor(preferredControlTintColor
      : UIColor); cdecl;
    function preferredControlTintColor: UIColor; cdecl;
    procedure setDismissButtonStyle(dismissButtonStyle
      : SFSafariViewControllerDismissButtonStyle); cdecl;
    function dismissButtonStyle
      : SFSafariViewControllerDismissButtonStyle; cdecl;
  end;

  TSFSafariViewController = class(TOCGenericImport<SFSafariViewControllerClass,
    SFSafariViewController>)
  end;

  PSFSafariViewController = Pointer;

  SFSafariViewControllerActivityButtonClass = interface(NSObjectClass)
    ['{4BD9A2DC-602E-429F-8858-781ECA514912}']
  end;

  SFSafariViewControllerActivityButton = interface(NSObject)
    ['{8FEB89C4-F78F-4F6F-8AAE-9B6A21B9F126}']
    function initWithTemplateImage(templateImage: UIImage;
      extensionIdentifier: NSString): Pointer { instancetype }; cdecl;
    function templateImage: UIImage; cdecl;
    function extensionIdentifier: NSString; cdecl;
  end;

  TSFSafariViewControllerActivityButton = class
    (TOCGenericImport<SFSafariViewControllerActivityButtonClass,
    SFSafariViewControllerActivityButton>)
  end;

  PSFSafariViewControllerActivityButton = Pointer;

  SFSafariViewControllerDataStoreClass = interface(NSObjectClass)
    ['{5A4A41CB-C30C-4CEE-8AAE-EC3445B5562A}']
  end;

  SFSafariViewControllerDataStore = interface(NSObject)
    ['{AC2D34BF-21EA-45B0-9DC2-5B2FC4358A8B}']
    procedure setDefaultDataStore(defaultDataStore
      : SFSafariViewControllerDataStore); cdecl;
    function defaultDataStore: SFSafariViewControllerDataStore; cdecl;
    procedure clearWebsiteDataWithCompletionHandler
      (completion: TSafariServicesCompletion); cdecl;
  end;

  TSFSafariViewControllerDataStore = class
    (TOCGenericImport<SFSafariViewControllerDataStoreClass,
    SFSafariViewControllerDataStore>)
  end;

  PSFSafariViewControllerDataStore = Pointer;

  SSReadingListClass = interface(NSObjectClass)
    ['{C5C9394D-6048-4932-876F-D541EA4E5351}']
    { class } function defaultReadingList: SSReadingList; cdecl;
    { class } function supportsURL(URL: NSURL): Boolean; cdecl;
  end;

  SSReadingList = interface(NSObject)
    ['{37978302-4E3B-4F5C-9C95-08E4D6BBB80D}']
    function addReadingListItemWithURL(URL: NSURL; title: NSString;
      previewText: NSString; error: NSError): Boolean; cdecl;
  end;

  TSSReadingList = class(TOCGenericImport<SSReadingListClass, SSReadingList>)
  end;

  PSSReadingList = Pointer;

  // ===== Protocol declarations =====

  SFSafariViewControllerDelegate = interface(IObjectiveC)
    ['{3FF3F418-9A5E-4D03-A889-91BEF72301B1}']
    [MethodName('safariViewController:activityItemsForURL:title:')]
    function safariViewControllerActivityItemsForURLTitle
      (controller: SFSafariViewController; activityItemsForURL: NSURL;
      title: NSString): NSArray; cdecl;
    [MethodName('safariViewController:excludedActivityTypesForURL:title:')]
    function safariViewControllerExcludedActivityTypesForURLTitle
      (controller: SFSafariViewController; excludedActivityTypesForURL: NSURL;
      title: NSString): NSArray; cdecl;
    procedure safariViewControllerDidFinish(controller
      : SFSafariViewController); cdecl;
    [MethodName('safariViewController:didCompleteInitialLoad:')]
    procedure safariViewControllerDidCompleteInitialLoad
      (controller: SFSafariViewController;
      didCompleteInitialLoad: Boolean); cdecl;
    [MethodName('safariViewController:initialLoadDidRedirectToURL:')]
    procedure safariViewControllerInitialLoadDidRedirectToURL
      (controller: SFSafariViewController;
      initialLoadDidRedirectToURL: NSURL); cdecl;
    procedure safariViewControllerWillOpenInBrowser
      (controller: SFSafariViewController); cdecl;
  end;

  // ===== Exported string consts =====

function SFAuthenticationErrorDomain: NSString;
function SFErrorDomain: NSString;
function SFContentBlockerErrorDomain: NSString;
function SFExtensionMessageKey: NSString;
function SSReadingListErrorDomain: NSString;


// ===== External functions =====

const
  libSafariServices =
    '/System/Library/Frameworks/SafariServices.framework/SafariServices';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  SafariServicesModule: THandle;

{$ENDIF IOS}

function SFAuthenticationErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libSafariServices,
    'SFAuthenticationErrorDomain');
end;

function SFErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libSafariServices, 'SFErrorDomain');
end;

function SFContentBlockerErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libSafariServices,
    'SFContentBlockerErrorDomain');
end;

function SFExtensionMessageKey: NSString;
begin
  Result := CocoaNSStringConst(libSafariServices, 'SFExtensionMessageKey');
end;

function SSReadingListErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libSafariServices, 'SSReadingListErrorDomain');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

SafariServicesModule := dlopen(MarshaledAString(libSafariServices), RTLD_LAZY);

finalization

dlclose(SafariServicesModule);
{$ENDIF IOS}

end.
