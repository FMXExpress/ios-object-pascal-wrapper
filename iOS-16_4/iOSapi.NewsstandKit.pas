{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework NewsstandKit
//

unit iOSapi.NewsstandKit;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

const
  NKIssueContentStatusNone = 0;
  NKIssueContentStatusDownloading = 1;
  NKIssueContentStatusAvailable = 2;

type

  // ===== Forward declarations =====
{$M+}
  NKIssue = interface;
  NKAssetDownload = interface;
  NKLibrary = interface;
  NKAssetDownloadAdditions = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  NKIssueContentStatus = NSInteger;
  // ===== Interface declarations =====

  NKIssueClass = interface(NSObjectClass)
    ['{3862C39F-4360-423C-8282-92799F9AE938}']
  end;

  NKIssue = interface(NSObject)
    ['{990A8425-E7ED-43EE-8D8D-8A6824CE4536}']
    function downloadingAssets: NSArray; cdecl;
    function contentURL: NSURL; cdecl;
    function status: NKIssueContentStatus; cdecl;
    function name: NSString; cdecl;
    function date: NSDate; cdecl;
    function addAssetWithRequest(request: NSURLRequest): NKAssetDownload; cdecl;
  end;

  TNKIssue = class(TOCGenericImport<NKIssueClass, NKIssue>)
  end;

  PNKIssue = Pointer;

  NKAssetDownloadClass = interface(NSObjectClass)
    ['{111A2D5E-57F2-4B05-8255-CCE0697BA6B0}']
  end;

  NKAssetDownload = interface(NSObject)
    ['{CD6A9C0C-8CAE-4F4A-BA3F-B5E8842A3BDD}']
    function issue: NKIssue; cdecl;
    function identifier: NSString; cdecl;
    procedure setUserInfo(userInfo: NSDictionary); cdecl;
    function userInfo: NSDictionary; cdecl;
    function URLRequest: NSURLRequest; cdecl;
    function downloadWithDelegate(delegate: Pointer): NSURLConnection; cdecl;
  end;

  TNKAssetDownload = class(TOCGenericImport<NKAssetDownloadClass,
    NKAssetDownload>)
  end;

  PNKAssetDownload = Pointer;

  NKLibraryClass = interface(NSObjectClass)
    ['{EC77DF93-FECB-4D03-BBAC-71B7DE3D3679}']
    { class } function sharedLibrary: NKLibrary; cdecl;
  end;

  NKLibrary = interface(NSObject)
    ['{E6783674-8819-40EE-8324-F97DB788225A}']
    function issues: NSArray; cdecl;
    function downloadingAssets: NSArray; cdecl;
    procedure setCurrentlyReadingIssue(currentlyReadingIssue: NKIssue); cdecl;
    function currentlyReadingIssue: NKIssue; cdecl;
    function issueWithName(name: NSString): NKIssue; cdecl;
    function addIssueWithName(name: NSString; date: NSDate): NKIssue; cdecl;
    procedure removeIssue(issue: NKIssue); cdecl;
  end;

  TNKLibrary = class(TOCGenericImport<NKLibraryClass, NKLibrary>)
  end;

  PNKLibrary = Pointer;

  NKAssetDownloadAdditions = interface(IObjectiveC)
    ['{D42A4126-13EA-469D-95F4-B1715DE00F0F}']
    function newsstandAssetDownload: NKAssetDownload; cdecl;
  end;

  // ===== Exported string consts =====

function NKIssueDownloadCompletedNotification: NSString;
function __AVAILABILITY_INTERNAL__IPHONE_: Pointer;


// ===== External functions =====

const
  libNewsstandKit =
    '/System/Library/Frameworks/NewsstandKit.framework/NewsstandKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  NewsstandKitModule: THandle;

{$ENDIF IOS}

function NKIssueDownloadCompletedNotification: NSString;
begin
  Result := CocoaNSStringConst(libNewsstandKit,
    'NKIssueDownloadCompletedNotification');
end;

function __AVAILABILITY_INTERNAL__IPHONE_: Pointer;
begin
  Result := CocoaPointerConst(libNewsstandKit,
    '__AVAILABILITY_INTERNAL__IPHONE_');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

NewsstandKitModule := dlopen(MarshaledAString(libNewsstandKit), RTLD_LAZY);

finalization

dlclose(NewsstandKitModule);
{$ENDIF IOS}

end.
