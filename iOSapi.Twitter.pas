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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
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
  SLRequestMethod = NSInteger;
  TWRequestMethod = SLRequestMethod;
  SLRequestHandler = procedure(param1: NSData; param2: NSHTTPURLResponse;
    param3: NSError) of object;
  TWRequestHandler = SLRequestHandler;
  SLComposeViewControllerResult = NSInteger;
  TWTweetComposeViewControllerResult = SLComposeViewControllerResult;
  SLComposeViewControllerCompletionHandler = procedure
    (param1: SLComposeViewControllerResult) of object;
  TWTweetComposeViewControllerCompletionHandler =
    SLComposeViewControllerCompletionHandler;
  // ===== Interface declarations =====

  TWRequestClass = interface(NSObjectClass)
    ['{5BC53F4A-66E0-4178-A352-DF3B7FF01416}']
  end;

  TWRequest = interface(NSObject)
    ['{1C968E2E-0CA2-44CC-97B0-7C19EF5C6BD4}']
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
    ['{CAEDF7B8-3434-4025-968C-D74C97207A07}']
    { class } function canSendTweet: Boolean; cdecl;
  end;

  TWTweetComposeViewController = interface(UIViewController)
    ['{3CAD83D4-171D-446E-AF39-DABF79C46B35}']
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
