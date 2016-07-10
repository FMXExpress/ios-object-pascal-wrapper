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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.Foundation,
  iOSapi.UIKit;

type

  // ===== Forward declarations =====
{$M+}
  QLPreviewItem = interface;
  QLPreviewControllerDelegate = interface;
  QLPreviewControllerDataSource = interface;
  QLPreviewController = interface;
  QLPreviewConvenienceAdditions = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  CGFloat = Single;
  CGPoint = CGPoint = record x: CGFloat;
y:
CGFloat;
end;
PCGPoint = ^CGPoint;;
CGSize = CGSize = record width: CGFloat;
height:
CGFloat;
end;
PCGSize = ^CGSize;;
CGRect = CGRect = record origin: CGPoint;
size:
CGSize;
end;
PCGRect = ^CGRect;;
// ===== Interface declarations =====

QLPreviewControllerClass = interface(UIViewControllerClass)
  ['{E21A292A-9CDD-409D-ABFE-A54329315034}']
{ class } function canPreviewItem(item: Pointer): Boolean;
cdecl;
end;
QLPreviewController = interface(UIViewController)
  ['{5621F000-E0B2-4249-8EAB-C252E39C41F1}']
procedure setDataSource(dataSource: Pointer);
cdecl;

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

          TQLPreviewController = class
            (TOCGenericImport<QLPreviewControllerClass, QLPreviewController>)
          end;
      PQLPreviewController = Pointer;

      QLPreviewConvenienceAdditions = interface(IObjectiveC)
        ['{96090CBB-055D-400F-89C2-DB2CD6202710}']
      end;

  // ===== Protocol declarations =====

  QLPreviewItem = interface(IObjectiveC)
    ['{A154E505-79A1-47F0-9E24-72B7CC6CC1AC}']
  function previewItemURL: NSURL;
  cdecl;
    function previewItemTitle: NSString; cdecl;
    end;

QLPreviewControllerDelegate = interface(IObjectiveC)
  ['{E2E10D58-F498-4A6E-8DC2-6E8C4E35523C}']
procedure previewControllerWillDismiss(controller: QLPreviewController);
cdecl;
  procedure previewControllerDidDismiss(controller: QLPreviewController); cdecl;
  [MethodName('previewController:shouldOpenURL:forPreviewItem:')]
    function previewControllerShouldOpenURLForPreviewItem
      (controller: QLPreviewController; shouldOpenURL: NSURL;
      forPreviewItem: Pointer): Boolean; cdecl;
    [MethodName('previewController:frameForPreviewItem:inSourceView:')]
      function previewControllerFrameForPreviewItemInSourceView
        (controller: QLPreviewController; frameForPreviewItem: Pointer;
        inSourceView: UIView): CGRect; cdecl;
      [MethodName
        ('previewController:transitionImageForPreviewItem:contentRect:')]
        function previewControllerTransitionImageForPreviewItemContentRect
          (controller: QLPreviewController;
          transitionImageForPreviewItem: Pointer; contentRect: Pointer)
          : UIImage; cdecl;
        end;

    QLPreviewControllerDataSource = interface(IObjectiveC)
      ['{45F98891-8756-4F5E-860F-8AA7D0A11725}']
    function numberOfPreviewItemsInPreviewController
      (controller: QLPreviewController): NSInteger;
    cdecl;
      function previewController(controller: QLPreviewController;
        previewItemAtIndex: NSInteger): Pointer; cdecl;
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
