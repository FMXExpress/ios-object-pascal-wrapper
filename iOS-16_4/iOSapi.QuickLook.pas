{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework QuickLook
//

unit iOSapi.QuickLook;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  QLPreviewItemEditingModeDisabled = 0;
  QLPreviewItemEditingModeUpdateContents = 1;
  QLPreviewItemEditingModeCreateCopy = 2;

type

  // ===== Forward declarations =====
{$M+}
  QLFilePreviewRequest = interface;
  QLPreviewItem = interface;
  QLPreviewControllerDelegate = interface;
  QLPreviewControllerDataSource = interface;
  QLPreviewController = interface;
  QLPreviewReply = interface;
  QLPreviewingController = interface;
  QLPreviewConvenienceAdditions = interface;
  QLPreviewProvider = interface;
  QLPreviewReplyAttachment = interface;
  QLPreviewSceneOptions = interface;
  QLPreviewSceneActivationConfiguration = interface;
  QLFileThumbnailRequest = interface;
  QLThumbnailReply = interface;
  QLThumbnailProvider = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  QLPreviewItemEditingMode = NSInteger;
  CGFloat = Single;
  PCGFloat = ^CGFloat;

  CGPoint = record
    x: CGFloat;
    y: CGFloat;
  end;

  PCGPoint = ^CGPoint;

  CGSize = record
    width: CGFloat;
    height: CGFloat;
  end;

  PCGSize = ^CGSize;

  CGRect = record
    origin: CGPoint;
    size: CGSize;
  end;

  PCGRect = ^CGRect;

  TQuickLookCompletionHandler = procedure(param1: NSError) of object;
  TQuickLookCompletionHandler1 = procedure(param1: QLPreviewReply;
    param2: NSError) of object;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  NSStringEncoding = NSUInteger;
  PNSStringEncoding = ^NSStringEncoding;
  CGContextRef = Pointer;
  PCGContextRef = ^CGContextRef;
  TQuickLookDrawingBlock = function(param1: CGContextRef;
    param2: QLPreviewReply; param3: NSError): Boolean; cdecl;
  TQuickLookDataCreationBlock = function(param1: QLPreviewReply;
    param2: NSError): NSData; cdecl;
  TQuickLookCompletionHandler2 = procedure(param1: QLThumbnailReply;
    param2: NSError) of object;
  TQuickLookDrawingBlock1 = function(param1: CGContextRef): Boolean; cdecl;
  TQuickLookCurrentContextDrawingBlock = function(): Boolean; cdecl;
  // ===== Interface declarations =====

  QLFilePreviewRequestClass = interface(NSObjectClass)
    ['{7F53D697-EAE7-46AC-90DE-8D04DA3EE567}']
  end;

  QLFilePreviewRequest = interface(NSObject)
    ['{C30DEBCE-24D0-491D-B74D-2EE1C425195C}']
    function fileURL: NSURL; cdecl;
  end;

  TQLFilePreviewRequest = class(TOCGenericImport<QLFilePreviewRequestClass,
    QLFilePreviewRequest>)
  end;

  PQLFilePreviewRequest = Pointer;

  QLPreviewControllerClass = interface(UIViewControllerClass)
    ['{1595CB53-4104-4114-B4A0-901A8D86A5C8}']
    { class } function canPreviewItem(item: Pointer): Boolean; cdecl;
  end;

  QLPreviewController = interface(UIViewController)
    ['{942D671D-B82E-4D4D-A6A6-732256722702}']
    procedure setDataSource(dataSource: Pointer); cdecl;
    function dataSource: Pointer; cdecl;
    procedure reloadData; cdecl;
    procedure refreshCurrentPreviewItem; cdecl;
    procedure setCurrentPreviewItemIndex(currentPreviewItemIndex
      : NSInteger); cdecl;
    function currentPreviewItemIndex: NSInteger; cdecl;
    function currentPreviewItem: Pointer; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
  end;

  TQLPreviewController = class(TOCGenericImport<QLPreviewControllerClass,
    QLPreviewController>)
  end;

  PQLPreviewController = Pointer;

  QLPreviewReplyClass = interface(NSObjectClass)
    ['{57253B22-3095-42C1-8354-52BCA83FA801}']
  end;

  QLPreviewReply = interface(NSObject)
    ['{ECE4C12B-BF6C-4BC7-B290-7AC776D74BD2}']
    procedure setStringEncoding(stringEncoding: NSStringEncoding); cdecl;
    function stringEncoding: NSStringEncoding; cdecl;
    procedure setAttachments(attachments: NSDictionary); cdecl;
    function attachments: NSDictionary; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    function initWithContextSize(contextSize: CGSize; isBitmap: Boolean;
      drawingBlock: TQuickLookDrawingBlock): Pointer { instancetype }; cdecl;
    function initWithFileURL(fileURL: NSURL): Pointer { instancetype }; cdecl;
    function initWithDataOfContentType(contentType: UTType; contentSize: CGSize;
      dataCreationBlock: TQuickLookDataCreationBlock)
      : Pointer { instancetype }; cdecl;
    function initForPDFWithPageSize(defaultPageSize: CGSize;
      documentCreationBlock: Pointer): Pointer { instancetype }; cdecl;
  end;

  TQLPreviewReply = class(TOCGenericImport<QLPreviewReplyClass, QLPreviewReply>)
  end;

  PQLPreviewReply = Pointer;

  QLPreviewConvenienceAdditions = interface(IObjectiveC)
    ['{46D96190-DBEB-4F4C-8106-BD29203EF57D}']
  end;

  QLPreviewProviderClass = interface(NSObjectClass)
    ['{ADF8F461-7448-40F0-B30E-EC4FE4B07C0C}']
  end;

  QLPreviewProvider = interface(NSObject)
    ['{44058C7F-3476-4A28-884C-6E472218290E}']
  end;

  TQLPreviewProvider = class(TOCGenericImport<QLPreviewProviderClass,
    QLPreviewProvider>)
  end;

  PQLPreviewProvider = Pointer;

  QLPreviewReplyAttachmentClass = interface(NSObjectClass)
    ['{747A7BC3-D120-4A73-9672-CBF197D0DEC1}']
  end;

  QLPreviewReplyAttachment = interface(NSObject)
    ['{7C7F87A6-C250-459D-A8C5-5F4F1ED2851A}']
    function data: NSData; cdecl;
    function contentType: UTType; cdecl;
    function initWithData(data: NSData; contentType: UTType)
      : Pointer { instancetype }; cdecl;
  end;

  TQLPreviewReplyAttachment = class
    (TOCGenericImport<QLPreviewReplyAttachmentClass, QLPreviewReplyAttachment>)
  end;

  PQLPreviewReplyAttachment = Pointer;

  QLPreviewSceneOptionsClass = interface(NSObjectClass)
    ['{DE6B51BD-2E74-4B7B-8C8B-F14CB1FE2762}']
  end;

  QLPreviewSceneOptions = interface(NSObject)
    ['{6E6E31B8-44E6-49C8-9602-60A44F7A21B2}']
    procedure setInitialPreviewIndex(initialPreviewIndex: NSInteger); cdecl;
    function initialPreviewIndex: NSInteger; cdecl;
  end;

  TQLPreviewSceneOptions = class(TOCGenericImport<QLPreviewSceneOptionsClass,
    QLPreviewSceneOptions>)
  end;

  PQLPreviewSceneOptions = Pointer;

  QLPreviewSceneActivationConfigurationClass = interface
    (UIWindowSceneActivationConfigurationClass)
    ['{25786C89-67E3-46EC-A11B-34D7D694E5DF}']
  end;

  QLPreviewSceneActivationConfiguration = interface
    (UIWindowSceneActivationConfiguration)
    ['{F05F1283-55CE-4DF7-8514-70565CEA67D4}']
    function initWithItemsAtURLs(urls: NSArray; options: QLPreviewSceneOptions)
      : Pointer { instancetype }; cdecl;
  end;

  TQLPreviewSceneActivationConfiguration = class
    (TOCGenericImport<QLPreviewSceneActivationConfigurationClass,
    QLPreviewSceneActivationConfiguration>)
  end;

  PQLPreviewSceneActivationConfiguration = Pointer;

  QLFileThumbnailRequestClass = interface(NSObjectClass)
    ['{4F29ABBF-6D3F-464E-A63E-2F9AE2E48D85}']
  end;

  QLFileThumbnailRequest = interface(NSObject)
    ['{489060C7-CBDC-4513-93C6-9EEF464294EE}']
    function maximumSize: CGSize; cdecl;
    function minimumSize: CGSize; cdecl;
    function scale: CGFloat; cdecl;
    function fileURL: NSURL; cdecl;
  end;

  TQLFileThumbnailRequest = class(TOCGenericImport<QLFileThumbnailRequestClass,
    QLFileThumbnailRequest>)
  end;

  PQLFileThumbnailRequest = Pointer;

  QLThumbnailReplyClass = interface(NSObjectClass)
    ['{8BE529F7-2F9E-4F14-8C67-4D41C9CD3778}']
    [MethodName('replyWithContextSize:drawingBlock:')]
    { class } function replyWithContextSizeDrawingBlock(contextSize: CGSize;
      drawingBlock: TQuickLookDrawingBlock1): Pointer { instancetype }; cdecl;
    [MethodName('replyWithContextSize:currentContextDrawingBlock:')]
    { class } function replyWithContextSizeCurrentContextDrawingBlock
      (contextSize: CGSize; currentContextDrawingBlock
      : TQuickLookCurrentContextDrawingBlock): Pointer { instancetype }; cdecl;
    { class } function replyWithImageFileURL(fileURL: NSURL)
      : Pointer { instancetype }; cdecl;
  end;

  QLThumbnailReply = interface(NSObject)
    ['{270B453E-ADCD-4DB7-B3E0-15A07EC8D852}']
  end;

  TQLThumbnailReply = class(TOCGenericImport<QLThumbnailReplyClass,
    QLThumbnailReply>)
  end;

  PQLThumbnailReply = Pointer;

  QLThumbnailProviderClass = interface(NSObjectClass)
    ['{52FB203F-9D12-4C37-A542-CCEFFF113370}']
  end;

  QLThumbnailProvider = interface(NSObject)
    ['{84FDCBDD-6270-4053-80BD-C3267F968CF1}']
    procedure provideThumbnailForFileRequest(request: QLFileThumbnailRequest;
      completionHandler: TQuickLookCompletionHandler2); cdecl;
  end;

  TQLThumbnailProvider = class(TOCGenericImport<QLThumbnailProviderClass,
    QLThumbnailProvider>)
  end;

  PQLThumbnailProvider = Pointer;

  // ===== Protocol declarations =====

  QLPreviewItem = interface(IObjectiveC)
    ['{0279AA2C-3B55-4867-8A8D-7603C3C3F454}']
    function previewItemURL: NSURL; cdecl;
    function previewItemTitle: NSString; cdecl;
  end;

  QLPreviewControllerDelegate = interface(IObjectiveC)
    ['{AFF6D101-48E1-4E74-A3AD-A041C229D1BF}']
    procedure previewControllerWillDismiss(controller
      : QLPreviewController); cdecl;
    procedure previewControllerDidDismiss(controller
      : QLPreviewController); cdecl;
    [MethodName('previewController:shouldOpenURL:forPreviewItem:')]
    function previewControllerShouldOpenURLForPreviewItem
      (controller: QLPreviewController; shouldOpenURL: NSURL;
      forPreviewItem: Pointer): Boolean; cdecl;
    [MethodName('previewController:frameForPreviewItem:inSourceView:')]
    function previewControllerFrameForPreviewItemInSourceView
      (controller: QLPreviewController; frameForPreviewItem: Pointer;
      inSourceView: UIView): CGRect; cdecl;
    [MethodName('previewController:transitionImageForPreviewItem:contentRect:')]
    function previewControllerTransitionImageForPreviewItemContentRect
      (controller: QLPreviewController; transitionImageForPreviewItem: Pointer;
      contentRect: PCGRect): UIImage; cdecl;
    [MethodName('previewController:transitionViewForPreviewItem:')]
    function previewControllerTransitionViewForPreviewItem
      (controller: QLPreviewController; transitionViewForPreviewItem: Pointer)
      : UIView; cdecl;
    [MethodName('previewController:editingModeForPreviewItem:')]
    function previewControllerEditingModeForPreviewItem
      (controller: QLPreviewController; editingModeForPreviewItem: Pointer)
      : QLPreviewItemEditingMode; cdecl;
    [MethodName('previewController:didUpdateContentsOfPreviewItem:')]
    procedure previewControllerDidUpdateContentsOfPreviewItem
      (controller: QLPreviewController;
      didUpdateContentsOfPreviewItem: Pointer); cdecl;
    [MethodName('previewController:didSaveEditedCopyOfPreviewItem:atURL:')]
    procedure previewControllerDidSaveEditedCopyOfPreviewItemAtURL
      (controller: QLPreviewController; didSaveEditedCopyOfPreviewItem: Pointer;
      atURL: NSURL); cdecl;
  end;

  QLPreviewControllerDataSource = interface(IObjectiveC)
    ['{C871A1F2-7C39-45BB-B27E-5CBA1711A140}']
    function numberOfPreviewItemsInPreviewController
      (controller: QLPreviewController): NSInteger; cdecl;
    function previewController(controller: QLPreviewController;
      previewItemAtIndex: NSInteger): Pointer; cdecl;
  end;

  QLPreviewingController = interface(IObjectiveC)
    ['{5EB04904-59D4-4EBF-B2CC-3E5FA730E42D}']
    procedure preparePreviewOfSearchableItemWithIdentifier(identifier: NSString;
      queryString: NSString;
      completionHandler: TQuickLookCompletionHandler); cdecl;
    procedure preparePreviewOfFileAtURL(url: NSURL;
      completionHandler: TQuickLookCompletionHandler); cdecl;
    procedure providePreviewForFileRequest(request: QLFilePreviewRequest;
      completionHandler: TQuickLookCompletionHandler1); cdecl;
  end;

  // ===== External functions =====

const
  libQuickLook = '/System/Library/Frameworks/QuickLook.framework/QuickLook';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  QuickLookModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

QuickLookModule := dlopen(MarshaledAString(libQuickLook), RTLD_LAZY);

finalization

dlclose(QuickLookModule);
{$ENDIF IOS}

end.
