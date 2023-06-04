{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework Twitter
//

unit iOSapi.Twitter;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.Accounts,
  iOSapi.CocoaTypes,
  iOSapi.Foundation,
  iOSapi.Social,
  iOSapi.UIKit;

const
  TWRequestMethodGET = SLRequestMethodGET;
  TWRequestMethodPOST = SLRequestMethodPOST;
  TWRequestMethodDELETE = SLRequestMethodDELETE;
  TWTweetComposeViewControllerResultCancelled =
    SLComposeViewControllerResultCancelled;
  TWTweetComposeViewControllerResultDone = SLComposeViewControllerResultDone;

type

  // ===== Forward declarations =====
{$M+}
  TWRequest = interface;
  TWTweetComposeViewController = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  SLRequestMethod = NSInteger;
  TWRequestMethod = SLRequestMethod;
  PTWRequestMethod = ^TWRequestMethod;
  SLRequestHandler = procedure(param1: NSData; param2: NSHTTPURLResponse;
    param3: NSError) of object;
  TWRequestHandler = SLRequestHandler;
  SLComposeViewControllerResult = NSInteger;
  TWTweetComposeViewControllerResult = SLComposeViewControllerResult;
  PTWTweetComposeViewControllerResult = ^TWTweetComposeViewControllerResult;
  SLComposeViewControllerCompletionHandler = procedure
    (param1: SLComposeViewControllerResult) of object;
  TWTweetComposeViewControllerCompletionHandler =
    SLComposeViewControllerCompletionHandler;
  // ===== Interface declarations =====

  TWRequestClass = interface(NSObjectClass)
    ['{D198AB62-03BF-4E9F-A13F-EC9680F7EAAA}']
  end;

  TWRequest = interface(NSObject)
    ['{64CCDA81-A654-4CDE-8257-942FB9ECF987}']
    function initWithURL(url: NSURL; parameters: NSDictionary;
      requestMethod: TWRequestMethod): Pointer; cdecl;
    procedure setAccount(account: ACAccount); cdecl;
    function account: ACAccount; cdecl;
    function requestMethod: TWRequestMethod; cdecl;
    function url: NSURL; cdecl;
    function parameters: NSDictionary; cdecl;
    procedure addMultiPartData(data: NSData; withName: NSString;
      &type: NSString); cdecl;
    function signedURLRequest: NSURLRequest; cdecl;
    procedure performRequestWithHandler(handler: TWRequestHandler); cdecl;
  end;

  TTWRequest = class(TOCGenericImport<TWRequestClass, TWRequest>)
  end;

  PTWRequest = Pointer;

  TWTweetComposeViewControllerClass = interface(UIViewControllerClass)
    ['{9C87FD42-3D64-4CE0-B391-25491CE33334}']
    { class } function canSendTweet: Boolean; cdecl;
  end;

  TWTweetComposeViewController = interface(UIViewController)
    ['{8AD00FDF-7D3E-44BD-93E9-50C925F68215}']
    function setInitialText(text: NSString): Boolean; cdecl;
    function addImage(image: UIImage): Boolean; cdecl;
    function removeAllImages: Boolean; cdecl;
    function addURL(url: NSURL): Boolean; cdecl;
    function removeAllURLs: Boolean; cdecl;
    procedure setCompletionHandler(completionHandler
      : TWTweetComposeViewControllerCompletionHandler); cdecl;
    function completionHandler
      : TWTweetComposeViewControllerCompletionHandler; cdecl;
  end;

  TTWTweetComposeViewController = class
    (TOCGenericImport<TWTweetComposeViewControllerClass,
    TWTweetComposeViewController>)
  end;

  PTWTweetComposeViewController = Pointer;

  // ===== External functions =====

const
  libTwitter = '/System/Library/Frameworks/Twitter.framework/Twitter';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  TwitterModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

TwitterModule := dlopen(MarshaledAString(libTwitter), RTLD_LAZY);

finalization

dlclose(TwitterModule);
{$ENDIF IOS}

end.
