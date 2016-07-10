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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
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
  NKIssueContentStatus = NSInteger;
  // ===== Interface declarations =====

  NKIssueClass = interface(NSObjectClass)
    ['{C970D91A-0681-48F7-8A8A-30C4006807E2}']
  end;

  NKIssue = interface(NSObject)
    ['{ECF5C8AD-3FC3-4C11-87D5-03E680F3DF71}']
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
    ['{5BB85842-6154-4EB0-AEF6-5218A1F5BB26}']
  end;

  NKAssetDownload = interface(NSObject)
    ['{7ED0D4AF-6228-4F77-9617-F4227325843D}']
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
    ['{240B1757-0555-45AB-A62B-2B672E8E997A}']
    { class } function sharedLibrary: NKLibrary; cdecl;
  end;

  NKLibrary = interface(NSObject)
    ['{6B64BA48-5607-47AF-A0C4-8F71F1AD2AB1}']
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
    ['{87ECE995-B2B3-4437-9EF1-9C2F2EBE0735}']
    function newsstandAssetDownload: NKAssetDownload; cdecl;
  end;

  // ===== Exported string consts =====

function NKIssueDownloadCompletedNotification: NSString;


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

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

NewsstandKitModule := dlopen(MarshaledAString(libNewsstandKit), RTLD_LAZY);

finalization

dlclose(NewsstandKitModule);
{$ENDIF IOS}

end.
