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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  SFContentBlockerNoExtensionFound = 1;
  SFContentBlockerNoAttachmentFound = 2;
  SFContentBlockerLoadingInterrupted = 3;
  SSReadingListErrorURLSchemeNotAllowed = 1;

type

  // ===== Forward declarations =====
{$M+}
  SFContentBlockerManager = interface;
  SFSafariViewControllerDelegate = interface;
  SFSafariViewController = interface;
  SSReadingList = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  SFContentBlockerErrorCode = NSInteger;
  TSafariServicesCompletionHandler = procedure(param1: NSError) of object;
  SSReadingListErrorCode = NSInteger;
  // ===== Interface declarations =====

  SFContentBlockerManagerClass = interface(NSObjectClass)
    ['{94BF17BD-4DA7-4446-B327-57F28622A166}']
    { class } procedure reloadContentBlockerWithIdentifier(identifier: NSString;
      completionHandler: TSafariServicesCompletionHandler); cdecl;
  end;

  SFContentBlockerManager = interface(NSObject)
    ['{7401F107-850D-4736-A9F5-745E56E93901}']
  end;

  TSFContentBlockerManager = class
    (TOCGenericImport<SFContentBlockerManagerClass, SFContentBlockerManager>)
  end;

  PSFContentBlockerManager = Pointer;

  SFSafariViewControllerClass = interface(UIViewControllerClass)
    ['{42C51848-7D34-4D7B-A36C-90F69FF006C4}']
  end;

  SFSafariViewController = interface(UIViewController)
    ['{127A8D1E-D068-432D-975E-C1246F49EB92}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    [MethodName('initWithURL:entersReaderIfAvailable:')]
    function initWithURLEntersReaderIfAvailable(URL: NSURL;
      entersReaderIfAvailable: Boolean): Pointer { instancetype }; cdecl;
    [MethodName('initWithURL:')]
    function initWithURL(URL: NSURL): Pointer { instancetype }; cdecl;
  end;

  TSFSafariViewController = class(TOCGenericImport<SFSafariViewControllerClass,
    SFSafariViewController>)
  end;

  PSFSafariViewController = Pointer;

  SSReadingListClass = interface(NSObjectClass)
    ['{BD663A99-430E-4FFE-B55B-B2BA1BF01C90}']
    { class } function defaultReadingList: SSReadingList; cdecl;
    { class } function supportsURL(URL: NSURL): Boolean; cdecl;
  end;

  SSReadingList = interface(NSObject)
    ['{995BDDFF-AD60-425F-AF83-D7D7DF36EB2E}']
    function addReadingListItemWithURL(URL: NSURL; title: NSString;
      previewText: NSString; error: NSError): Boolean; cdecl;
  end;

  TSSReadingList = class(TOCGenericImport<SSReadingListClass, SSReadingList>)
  end;

  PSSReadingList = Pointer;

  // ===== Protocol declarations =====

  SFSafariViewControllerDelegate = interface(IObjectiveC)
    ['{2192FE6E-19BD-4494-828F-84FC6212C98E}']
    [MethodName('safariViewController:activityItemsForURL:title:')]
    function safariViewControllerActivityItemsForURLTitle
      (controller: SFSafariViewController; activityItemsForURL: NSURL;
      title: NSString): NSArray; cdecl;
    procedure safariViewControllerDidFinish(controller
      : SFSafariViewController); cdecl;
    [MethodName('safariViewController:didCompleteInitialLoad:')]
    procedure safariViewControllerDidCompleteInitialLoad
      (controller: SFSafariViewController;
      didCompleteInitialLoad: Boolean); cdecl;
  end;

  // ===== Exported string consts =====

function SFContentBlockerErrorDomain: NSString;
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

function SFContentBlockerErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libSafariServices,
    'SFContentBlockerErrorDomain');
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
