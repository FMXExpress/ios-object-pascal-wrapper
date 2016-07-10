{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework PhotosUI
//

unit iOSapi.PhotosUI;

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
  iOSapi.Photos,
  iOSapi.UIKit;

const
  PHLivePhotoBadgeOptionsOverContent = 1 shl 0;
  PHLivePhotoBadgeOptionsLiveOff = 1 shl 1;
  PHLivePhotoViewPlaybackStyleUndefined = 0;
  PHLivePhotoViewPlaybackStyleFull = 1;
  PHLivePhotoViewPlaybackStyleHint = 2;

type

  // ===== Forward declarations =====
{$M+}
  PHContentEditingController = interface;
  PHLivePhotoViewDelegate = interface;
  PHLivePhotoView = interface;

  // ===== Framework typedefs =====
{$M+}
  TPhotosUICompletionHandler = procedure(param1: PHContentEditingOutput)
    of object;
  NSUInteger = Cardinal;
  PHLivePhotoBadgeOptions = NSUInteger;
  NSInteger = Integer;
  PHLivePhotoViewPlaybackStyle = NSInteger;
  // ===== Interface declarations =====

  PHLivePhotoViewClass = interface(UIViewClass)
    ['{27503C3A-CCFF-4050-94CE-43E5D90C90D0}']
    { class } function livePhotoBadgeImageWithOptions
      (badgeOptions: PHLivePhotoBadgeOptions): UIImage; cdecl;
  end;

  PHLivePhotoView = interface(UIView)
    ['{91F057A9-55FA-46CE-9B0C-91C33B3A8858}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setLivePhoto(livePhoto: PHLivePhoto); cdecl;
    function livePhoto: PHLivePhoto; cdecl;
    procedure setMuted(muted: Boolean); cdecl;
    function isMuted: Boolean; cdecl;
    function playbackGestureRecognizer: UIGestureRecognizer; cdecl;
    procedure startPlaybackWithStyle(playbackStyle
      : PHLivePhotoViewPlaybackStyle); cdecl;
    procedure stopPlayback; cdecl;
  end;

  TPHLivePhotoView = class(TOCGenericImport<PHLivePhotoViewClass,
    PHLivePhotoView>)
  end;

  PPHLivePhotoView = Pointer;

  // ===== Protocol declarations =====

  PHContentEditingController = interface(IObjectiveC)
    ['{1E07EA30-0E2F-4FEE-873F-7FFC65DDB3F3}']
    function canHandleAdjustmentData(adjustmentData: PHAdjustmentData)
      : Boolean; cdecl;
    procedure startContentEditingWithInput(contentEditingInput
      : PHContentEditingInput; placeholderImage: UIImage); cdecl;
    procedure finishContentEditingWithCompletionHandler(completionHandler
      : TPhotosUICompletionHandler); cdecl;
    procedure cancelContentEditing; cdecl;
    function shouldShowCancelConfirmation: Boolean; cdecl;
  end;

  PHLivePhotoViewDelegate = interface(IObjectiveC)
    ['{55CB9CA4-0D09-4C93-B9E1-76F0469AACC2}']
    [MethodName('livePhotoView:willBeginPlaybackWithStyle:')]
    procedure livePhotoViewWillBeginPlaybackWithStyle(livePhotoView
      : PHLivePhotoView; willBeginPlaybackWithStyle
      : PHLivePhotoViewPlaybackStyle); cdecl;
    [MethodName('livePhotoView:didEndPlaybackWithStyle:')]
    procedure livePhotoViewDidEndPlaybackWithStyle(livePhotoView
      : PHLivePhotoView; didEndPlaybackWithStyle
      : PHLivePhotoViewPlaybackStyle); cdecl;
  end;

  // ===== External functions =====

const
  libPhotosUI = '/System/Library/Frameworks/PhotosUI.framework/PhotosUI';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  PhotosUIModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

PhotosUIModule := dlopen(MarshaledAString(libPhotosUI), RTLD_LAZY);

finalization

dlclose(PhotosUIModule);
{$ENDIF IOS}

end.
