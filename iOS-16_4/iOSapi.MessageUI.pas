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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
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
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  MFMailComposeResult = NSInteger;
  NSErrorDomain = NSString;
  PNSErrorDomain = ^NSErrorDomain;
  MFMailComposeErrorCode = NSInteger;
  MessageComposeResult = NSInteger;
  // ===== Interface declarations =====

  MFMailComposeViewControllerClass = interface(UINavigationControllerClass)
    ['{48900D35-78E5-461A-B6C3-18C3758CFA2B}']
    { class } function canSendMail: Boolean; cdecl;
  end;

  MFMailComposeViewController = interface(UINavigationController)
    ['{6132C279-AF15-4D2B-9D2D-9274F76D3877}']
    procedure setMailComposeDelegate(mailComposeDelegate: Pointer); cdecl;
    function mailComposeDelegate: Pointer; cdecl;
    procedure setSubject(subject: NSString); cdecl;
    procedure setToRecipients(toRecipients: NSArray); cdecl;
    procedure setCcRecipients(ccRecipients: NSArray); cdecl;
    procedure setBccRecipients(bccRecipients: NSArray); cdecl;
    procedure setMessageBody(body: NSString; isHTML: Boolean); cdecl;
    procedure addAttachmentData(attachment: NSData; mimeType: NSString;
      fileName: NSString); cdecl;
    procedure setPreferredSendingEmailAddress(emailAddress: NSString); cdecl;
  end;

  TMFMailComposeViewController = class
    (TOCGenericImport<MFMailComposeViewControllerClass,
    MFMailComposeViewController>)
  end;

  PMFMailComposeViewController = Pointer;

  MFMessageComposeViewControllerClass = interface(UINavigationControllerClass)
    ['{A4B28EEE-F1BC-454E-96CD-6222B013BE5F}']
    { class } function canSendText: Boolean; cdecl;
    { class } function canSendSubject: Boolean; cdecl;
    { class } function canSendAttachments: Boolean; cdecl;
    { class } function isSupportedAttachmentUTI(uti: NSString): Boolean; cdecl;
  end;

  MFMessageComposeViewController = interface(UINavigationController)
    ['{973448C6-6EA1-47EB-87DE-61DBB5274753}']
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
    procedure setMessage(message: MSMessage); cdecl;
    function message: MSMessage; cdecl;
    function addAttachmentURL(attachmentURL: NSURL;
      withAlternateFilename: NSString): Boolean; cdecl;
    function addAttachmentData(attachmentData: NSData; typeIdentifier: NSString;
      fileName: NSString): Boolean; cdecl;
    function insertCollaborationItemProvider(itemProvider: NSItemProvider)
      : Boolean; cdecl;
  end;

  TMFMessageComposeViewController = class
    (TOCGenericImport<MFMessageComposeViewControllerClass,
    MFMessageComposeViewController>)
  end;

  PMFMessageComposeViewController = Pointer;

  // ===== Protocol declarations =====

  MFMailComposeViewControllerDelegate = interface(IObjectiveC)
    ['{BCCF8E32-DBE5-45A4-A8B8-5B14E60F2D6F}']
    procedure mailComposeController(controller: MFMailComposeViewController;
      didFinishWithResult: MFMailComposeResult; error: NSError); cdecl;
  end;

  MFMessageComposeViewControllerDelegate = interface(IObjectiveC)
    ['{1F9C32BB-4077-452B-9B6C-32B6D1F03C81}']
    procedure messageComposeViewController(controller
      : MFMessageComposeViewController;
      didFinishWithResult: MessageComposeResult); cdecl;
  end;

  // ===== Exported string consts =====

function MFMailComposeErrorDomain: Pointer;
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

function MFMailComposeErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libMessageUI, 'MFMailComposeErrorDomain');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MessageUIModule := dlopen(MarshaledAString(libMessageUI), RTLD_LAZY);

finalization

dlclose(MessageUIModule);
{$ENDIF IOS}

end.
