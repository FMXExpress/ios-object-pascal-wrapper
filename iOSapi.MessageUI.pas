{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework MessageUI
//

unit iOSapi.MessageUI;

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
  MFMailComposeResultCancelled = 0;
  MFMailComposeResultSaved = 1;
  MFMailComposeResultSent = 2;
  MFMailComposeResultFailed = 3;
  MFMailComposeErrorCodeSaveFailed = 0;
  MFMailComposeErrorCodeSendFailed = 1;
  MessageComposeResultCancelled = 0;
  MessageComposeResultSent = 1;
  MessageComposeResultFailed = 2;

type

  // ===== Forward declarations =====
{$M+}
  MFMailComposeViewControllerDelegate = interface;
  MFMailComposeViewController = interface;
  MFMessageComposeViewControllerDelegate = interface;
  MFMessageComposeViewController = interface;

  // ===== Framework typedefs =====
{$M+}
  MFMailComposeResult = Cardinal;
  MFMailComposeErrorCode = Cardinal;
  MessageComposeResult = Cardinal;
  // ===== Interface declarations =====

  MFMailComposeViewControllerClass = interface(UINavigationControllerClass)
    ['{23041F7D-6F10-4351-BE7C-C606BF9A8165}']
    { class } function canSendMail: Boolean; cdecl;
  end;

  MFMailComposeViewController = interface(UINavigationController)
    ['{F4D14FF1-B13C-4BCE-A5BA-84F05CE11E94}']
    procedure setMailComposeDelegate(mailComposeDelegate: Pointer); cdecl;
    function mailComposeDelegate: Pointer; cdecl;
    procedure setSubject(subject: NSString); cdecl;
    procedure setToRecipients(toRecipients: NSArray); cdecl;
    procedure setCcRecipients(ccRecipients: NSArray); cdecl;
    procedure setBccRecipients(bccRecipients: NSArray); cdecl;
    procedure setMessageBody(body: NSString; isHTML: Boolean); cdecl;
    procedure addAttachmentData(attachment: NSData; mimeType: NSString;
      fileName: NSString); cdecl;
  end;

  TMFMailComposeViewController = class
    (TOCGenericImport<MFMailComposeViewControllerClass,
    MFMailComposeViewController>)
  end;

  PMFMailComposeViewController = Pointer;

  MFMessageComposeViewControllerClass = interface(UINavigationControllerClass)
    ['{EDF3ABDC-3B86-4274-804F-2E7B38B9D3BF}']
    { class } function canSendText: Boolean; cdecl;
    { class } function canSendSubject: Boolean; cdecl;
    { class } function canSendAttachments: Boolean; cdecl;
    { class } function isSupportedAttachmentUTI(uti: NSString): Boolean; cdecl;
  end;

  MFMessageComposeViewController = interface(UINavigationController)
    ['{658B22D4-708A-4A95-B5F3-DB8B5C4943CF}']
    procedure setMessageComposeDelegate(messageComposeDelegate: Pointer); cdecl;
    function messageComposeDelegate: Pointer; cdecl;
    procedure disableUserAttachments; cdecl;
    procedure setRecipients(recipients: NSArray); cdecl;
    function recipients: NSArray; cdecl;
    procedure setBody(body: NSString); cdecl;
    function body: NSString; cdecl;
    procedure setSubject(subject: NSString); cdecl;
    function subject: NSString; cdecl;
    function attachments: NSArray; cdecl;
    function addAttachmentURL(attachmentURL: NSURL;
      withAlternateFilename: NSString): Boolean; cdecl;
    function addAttachmentData(attachmentData: NSData; typeIdentifier: NSString;
      fileName: NSString): Boolean; cdecl;
  end;

  TMFMessageComposeViewController = class
    (TOCGenericImport<MFMessageComposeViewControllerClass,
    MFMessageComposeViewController>)
  end;

  PMFMessageComposeViewController = Pointer;

  // ===== Protocol declarations =====

  MFMailComposeViewControllerDelegate = interface(IObjectiveC)
    ['{27703958-2E37-4491-8D21-CF7BD14DB724}']
    procedure mailComposeController(controller: MFMailComposeViewController;
      didFinishWithResult: MFMailComposeResult; error: NSError); cdecl;
  end;

  MFMessageComposeViewControllerDelegate = interface(IObjectiveC)
    ['{5B8114E8-DA1B-40FD-9D01-E81BC4B31978}']
    procedure messageComposeViewController(controller
      : MFMessageComposeViewController;
      didFinishWithResult: MessageComposeResult); cdecl;
  end;

  // ===== Exported string consts =====

function MFMailComposeErrorDomain: NSString;
function MFMessageComposeViewControllerAttachmentURL: NSString;
function MFMessageComposeViewControllerAttachmentAlternateFilename: NSString;
function MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification
  : NSString;
function MFMessageComposeViewControllerTextMessageAvailabilityKey: NSString;


// ===== External functions =====

const
  libMessageUI = '/System/Library/Frameworks/MessageUI.framework/MessageUI';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  MessageUIModule: THandle;

{$ENDIF IOS}

function MFMailComposeErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libMessageUI, 'MFMailComposeErrorDomain');
end;

function MFMessageComposeViewControllerAttachmentURL: NSString;
begin
  Result := CocoaNSStringConst(libMessageUI,
    'MFMessageComposeViewControllerAttachmentURL');
end;

function MFMessageComposeViewControllerAttachmentAlternateFilename: NSString;
begin
  Result := CocoaNSStringConst(libMessageUI,
    'MFMessageComposeViewControllerAttachmentAlternateFilename');
end;

function MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification
  : NSString;
begin
  Result := CocoaNSStringConst(libMessageUI,
    'MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification');
end;

function MFMessageComposeViewControllerTextMessageAvailabilityKey: NSString;
begin
  Result := CocoaNSStringConst(libMessageUI,
    'MFMessageComposeViewControllerTextMessageAvailabilityKey');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MessageUIModule := dlopen(MarshaledAString(libMessageUI), RTLD_LAZY);

finalization

dlclose(MessageUIModule);
{$ENDIF IOS}

end.
