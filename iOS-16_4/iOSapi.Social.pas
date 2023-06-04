{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework Social
//

unit iOSapi.Social;

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
  iOSapi.UIKit;

const
  SLComposeViewControllerResultCancelled = 0;
  SLComposeViewControllerResultDone = 1;
  SLRequestMethodGET = 0;
  SLRequestMethodPOST = 1;
  SLRequestMethodDELETE = 2;
  SLRequestMethodPUT = 3;

type

  // ===== Forward declarations =====
{$M+}
  SLComposeServiceViewController = interface;
  SLComposeSheetConfigurationItem = interface;
  SLComposeViewController = interface;
  SLRequest = interface;

  // ===== Framework typedefs =====
{$M+}
  SLComposeSheetConfigurationItemTapHandler = procedure() of object;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  SLComposeViewControllerResult = NSInteger;
  SLComposeViewControllerCompletionHandler = procedure
    (param1: SLComposeViewControllerResult) of object;
  SLRequestMethod = NSInteger;
  SLRequestHandler = procedure(param1: NSData; param2: NSHTTPURLResponse;
    param3: NSError) of object;
  // ===== Interface declarations =====

  SLComposeServiceViewControllerClass = interface(UIViewControllerClass)
    ['{AA9CA082-ADC8-45E5-8CBA-42991538E628}']
  end;

  SLComposeServiceViewController = interface(UIViewController)
    ['{24FF5ADD-A129-45B6-8FEC-BE70ED731D98}']
    procedure presentationAnimationDidFinish; cdecl;
    function textView: UITextView; cdecl;
    function contentText: NSString; cdecl;
    procedure setPlaceholder(placeholder: NSString); cdecl;
    function placeholder: NSString; cdecl;
    procedure didSelectPost; cdecl;
    procedure didSelectCancel; cdecl;
    procedure cancel; cdecl;
    function isContentValid: Boolean; cdecl;
    procedure validateContent; cdecl;
    procedure setCharactersRemaining(charactersRemaining: NSNumber); cdecl;
    function charactersRemaining: NSNumber; cdecl;
    function configurationItems: NSArray; cdecl;
    procedure reloadConfigurationItems; cdecl;
    procedure pushConfigurationViewController(viewController
      : UIViewController); cdecl;
    procedure popConfigurationViewController; cdecl;
    function loadPreviewView: UIView; cdecl;
    procedure setAutoCompletionViewController(autoCompletionViewController
      : UIViewController); cdecl;
    function autoCompletionViewController: UIViewController; cdecl;
  end;

  TSLComposeServiceViewController = class
    (TOCGenericImport<SLComposeServiceViewControllerClass,
    SLComposeServiceViewController>)
  end;

  PSLComposeServiceViewController = Pointer;

  SLComposeSheetConfigurationItemClass = interface(NSObjectClass)
    ['{8E0B9CBF-404D-40DA-BE59-A35EE7848D1C}']
  end;

  SLComposeSheetConfigurationItem = interface(NSObject)
    ['{B4E6BD23-9A43-487C-94FD-A2288B4838DB}']
    function init: Pointer { instancetype }; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setValue(value: NSString); cdecl;
    function value: NSString; cdecl;
    procedure setValuePending(valuePending: Boolean); cdecl;
    function valuePending: Boolean; cdecl;
    procedure setTapHandler(tapHandler
      : SLComposeSheetConfigurationItemTapHandler); cdecl;
    function tapHandler: SLComposeSheetConfigurationItemTapHandler; cdecl;
  end;

  TSLComposeSheetConfigurationItem = class
    (TOCGenericImport<SLComposeSheetConfigurationItemClass,
    SLComposeSheetConfigurationItem>)
  end;

  PSLComposeSheetConfigurationItem = Pointer;

  SLComposeViewControllerClass = interface(UIViewControllerClass)
    ['{A13E123A-22FD-419F-A8DA-DA86DB854821}']
    { class } function isAvailableForServiceType(serviceType: NSString)
      : Boolean; cdecl;
    { class } function composeViewControllerForServiceType
      (serviceType: NSString): SLComposeViewController; cdecl;
  end;

  SLComposeViewController = interface(UIViewController)
    ['{FC7BE346-2C10-4D32-8985-8B14BD1DC6CF}']
    function serviceType: NSString; cdecl;
    function setInitialText(text: NSString): Boolean; cdecl;
    function addImage(image: UIImage): Boolean; cdecl;
    function removeAllImages: Boolean; cdecl;
    function addURL(url: NSURL): Boolean; cdecl;
    function removeAllURLs: Boolean; cdecl;
    procedure setCompletionHandler(completionHandler
      : SLComposeViewControllerCompletionHandler); cdecl;
    function completionHandler: SLComposeViewControllerCompletionHandler; cdecl;
  end;

  TSLComposeViewController = class
    (TOCGenericImport<SLComposeViewControllerClass, SLComposeViewController>)
  end;

  PSLComposeViewController = Pointer;

  SLRequestClass = interface(NSObjectClass)
    ['{9F71A0A7-8D84-4ED4-8479-B2E6F940D98C}']
    { class } function requestForServiceType(serviceType: NSString;
      requestMethod: SLRequestMethod; url: NSURL; parameters: NSDictionary)
      : SLRequest; cdecl;
  end;

  SLRequest = interface(NSObject)
    ['{BC4E365D-389D-49C4-B874-D0820B034D72}']
    procedure setAccount(account: ACAccount); cdecl;
    function account: ACAccount; cdecl;
    function requestMethod: SLRequestMethod; cdecl;
    function url: NSURL; cdecl;
    function parameters: NSDictionary; cdecl;
    procedure addMultipartData(data: NSData; withName: NSString;
      &type: NSString; filename: NSString); cdecl;
    function preparedURLRequest: NSURLRequest; cdecl;
    procedure performRequestWithHandler(handler: SLRequestHandler); cdecl;
  end;

  TSLRequest = class(TOCGenericImport<SLRequestClass, SLRequest>)
  end;

  PSLRequest = Pointer;

  // ===== Exported string consts =====

function SLServiceTypeTwitter: NSString;
function SLServiceTypeFacebook: NSString;
function SLServiceTypeSinaWeibo: NSString;
function SLServiceTypeTencentWeibo: NSString;
function SLServiceTypeLinkedIn: NSString;


// ===== External functions =====

const
  libSocial = '/System/Library/Frameworks/Social.framework/Social';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  SocialModule: THandle;

{$ENDIF IOS}

function SLServiceTypeTwitter: NSString;
begin
  Result := CocoaNSStringConst(libSocial, 'SLServiceTypeTwitter');
end;

function SLServiceTypeFacebook: NSString;
begin
  Result := CocoaNSStringConst(libSocial, 'SLServiceTypeFacebook');
end;

function SLServiceTypeSinaWeibo: NSString;
begin
  Result := CocoaNSStringConst(libSocial, 'SLServiceTypeSinaWeibo');
end;

function SLServiceTypeTencentWeibo: NSString;
begin
  Result := CocoaNSStringConst(libSocial, 'SLServiceTypeTencentWeibo');
end;

function SLServiceTypeLinkedIn: NSString;
begin
  Result := CocoaNSStringConst(libSocial, 'SLServiceTypeLinkedIn');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

SocialModule := dlopen(MarshaledAString(libSocial), RTLD_LAZY);

finalization

dlclose(SocialModule);
{$ENDIF IOS}

end.
