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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
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
  PHPickerConfigurationAssetRepresentationModeAutomatic = 0;
  PHPickerConfigurationAssetRepresentationModeCurrent = 1;
  PHPickerConfigurationAssetRepresentationModeCompatible = 2;
  PHPickerConfigurationSelectionDefault = 0;
  PHPickerConfigurationSelectionOrdered = 1;

type

  // ===== Forward declarations =====
{$M+}
  PHContentEditingController = interface;
  PHLivePhotoViewDelegate = interface;
  PHLivePhotoView = interface;
  PHPickerFilter = interface;
  PHPickerConfiguration = interface;
  PHPickerResult = interface;
  PHPickerViewController = interface;
  PHPickerViewControllerDelegate = interface;
  PhotosUISupport = interface;

  // ===== Framework typedefs =====
{$M+}
  TPhotosUICompletionHandler = procedure(param1: PHContentEditingOutput)
    of object;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  PHLivePhotoBadgeOptions = NSUInteger;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  PHLivePhotoViewPlaybackStyle = NSInteger;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  PHPickerConfigurationAssetRepresentationMode = NSInteger;
  PHPickerConfigurationSelection = NSInteger;
  PHAssetPlaybackStyle = NSInteger;
  TPhotosUICompletionHandler1 = procedure(param1: NSArray) of object;
  // ===== Interface declarations =====

  PHLivePhotoViewClass = interface(UIViewClass)
    ['{E172960A-8DEE-4957-B43C-1FEA976E0695}']
    { class } function livePhotoBadgeImageWithOptions
      (badgeOptions: PHLivePhotoBadgeOptions): UIImage; cdecl;
  end;

  PHLivePhotoView = interface(UIView)
    ['{01A9A664-A76E-45E8-9ACB-A631D9A94EFE}']
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

  PHPickerFilterClass = interface(NSObjectClass)
    ['{0CDA438F-0BE2-499C-8F6A-88BEEBF775A1}']
    { class } function playbackStyleFilter(playbackStyle: PHAssetPlaybackStyle)
      : PHPickerFilter; cdecl;
    { class } function anyFilterMatchingSubfilters(subfilters: NSArray)
      : PHPickerFilter; cdecl;
    { class } function allFilterMatchingSubfilters(subfilters: NSArray)
      : PHPickerFilter; cdecl;
    { class } function notFilterOfSubfilter(subfilter: PHPickerFilter)
      : PHPickerFilter; cdecl;
  end;

  PHPickerFilter = interface(NSObject)
    ['{2EC1E1F7-2C92-43E1-842F-E669C631F488}']
    procedure setImagesFilter(imagesFilter: PHPickerFilter); cdecl;
    function imagesFilter: PHPickerFilter; cdecl;
    procedure setVideosFilter(videosFilter: PHPickerFilter); cdecl;
    function videosFilter: PHPickerFilter; cdecl;
    procedure setLivePhotosFilter(livePhotosFilter: PHPickerFilter); cdecl;
    function livePhotosFilter: PHPickerFilter; cdecl;
    procedure setDepthEffectPhotosFilter(depthEffectPhotosFilter
      : PHPickerFilter); cdecl;
    function depthEffectPhotosFilter: PHPickerFilter; cdecl;
    procedure setBurstsFilter(burstsFilter: PHPickerFilter); cdecl;
    function burstsFilter: PHPickerFilter; cdecl;
    procedure setPanoramasFilter(panoramasFilter: PHPickerFilter); cdecl;
    function panoramasFilter: PHPickerFilter; cdecl;
    procedure setScreenshotsFilter(screenshotsFilter: PHPickerFilter); cdecl;
    function screenshotsFilter: PHPickerFilter; cdecl;
    procedure setScreenRecordingsFilter(screenRecordingsFilter
      : PHPickerFilter); cdecl;
    function screenRecordingsFilter: PHPickerFilter; cdecl;
    procedure setCinematicVideosFilter(cinematicVideosFilter
      : PHPickerFilter); cdecl;
    function cinematicVideosFilter: PHPickerFilter; cdecl;
    procedure setSlomoVideosFilter(slomoVideosFilter: PHPickerFilter); cdecl;
    function slomoVideosFilter: PHPickerFilter; cdecl;
    procedure setTimelapseVideosFilter(timelapseVideosFilter
      : PHPickerFilter); cdecl;
    function timelapseVideosFilter: PHPickerFilter; cdecl;
  end;

  TPHPickerFilter = class(TOCGenericImport<PHPickerFilterClass, PHPickerFilter>)
  end;

  PPHPickerFilter = Pointer;

  PHPickerConfigurationClass = interface(NSObjectClass)
    ['{3DFE371A-D76B-49CE-A1BA-6CF8D43E33CD}']
  end;

  PHPickerConfiguration = interface(NSObject)
    ['{3656A4D0-055D-4901-B418-BE5750C46BC9}']
    procedure setPreferredAssetRepresentationMode
      (preferredAssetRepresentationMode
      : PHPickerConfigurationAssetRepresentationMode); cdecl;
    function preferredAssetRepresentationMode
      : PHPickerConfigurationAssetRepresentationMode; cdecl;
    procedure setSelection(selection: PHPickerConfigurationSelection); cdecl;
    function selection: PHPickerConfigurationSelection; cdecl;
    procedure setSelectionLimit(selectionLimit: NSInteger); cdecl;
    function selectionLimit: NSInteger; cdecl;
    procedure setFilter(filter: PHPickerFilter); cdecl;
    function filter: PHPickerFilter; cdecl;
    procedure setPreselectedAssetIdentifiers(preselectedAssetIdentifiers
      : NSArray); cdecl;
    function preselectedAssetIdentifiers: NSArray; cdecl;
    function initWithPhotoLibrary(photoLibrary: PHPhotoLibrary)
      : Pointer { instancetype }; cdecl;
    function init: Pointer { instancetype }; cdecl;
  end;

  TPHPickerConfiguration = class(TOCGenericImport<PHPickerConfigurationClass,
    PHPickerConfiguration>)
  end;

  PPHPickerConfiguration = Pointer;

  PHPickerResultClass = interface(NSObjectClass)
    ['{6381AFD9-6082-49EA-81D8-4117968AFAD5}']
  end;

  PHPickerResult = interface(NSObject)
    ['{545327D8-CFBF-4829-9217-9D81788E9189}']
    function itemProvider: NSItemProvider; cdecl;
    function assetIdentifier: NSString; cdecl;
  end;

  TPHPickerResult = class(TOCGenericImport<PHPickerResultClass, PHPickerResult>)
  end;

  PPHPickerResult = Pointer;

  PHPickerViewControllerClass = interface(UIViewControllerClass)
    ['{7A541495-54F2-473D-BB3C-05C1A53F3790}']
  end;

  PHPickerViewController = interface(UIViewController)
    ['{A94849B7-4EBA-44A0-ACCB-C3F9FD7C3482}']
    function configuration: PHPickerConfiguration; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function initWithConfiguration(configuration: PHPickerConfiguration)
      : Pointer { instancetype }; cdecl;
    procedure deselectAssetsWithIdentifiers(identifiers: NSArray); cdecl;
    procedure moveAssetWithIdentifier(identifier: NSString;
      afterAssetWithIdentifier: NSString); cdecl;
  end;

  TPHPickerViewController = class(TOCGenericImport<PHPickerViewControllerClass,
    PHPickerViewController>)
  end;

  PPHPickerViewController = Pointer;

  PhotosUISupport = interface(IObjectiveC)
    ['{2C585B72-3D99-4620-B3EA-60E3DEADE4F2}']
    [MethodName('presentLimitedLibraryPickerFromViewController:')]
    procedure presentLimitedLibraryPickerFromViewController
      (controller: UIViewController); cdecl;
    [MethodName
      ('presentLimitedLibraryPickerFromViewController:completionHandler:')]
    procedure presentLimitedLibraryPickerFromViewControllerCompletionHandler
      (controller: UIViewController;
      completionHandler: TPhotosUICompletionHandler1); cdecl;
  end;

  // ===== Protocol declarations =====

  PHContentEditingController = interface(IObjectiveC)
    ['{BA082176-F753-4E3C-8B60-4EFCE262BDBE}']
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
    ['{C78CC81B-F404-4AB8-BB80-E57590214331}']
    [MethodName('livePhotoView:canBeginPlaybackWithStyle:')]
    function livePhotoViewCanBeginPlaybackWithStyle(livePhotoView
      : PHLivePhotoView; canBeginPlaybackWithStyle
      : PHLivePhotoViewPlaybackStyle): Boolean; cdecl;
    [MethodName('livePhotoView:willBeginPlaybackWithStyle:')]
    procedure livePhotoViewWillBeginPlaybackWithStyle(livePhotoView
      : PHLivePhotoView; willBeginPlaybackWithStyle
      : PHLivePhotoViewPlaybackStyle); cdecl;
    [MethodName('livePhotoView:didEndPlaybackWithStyle:')]
    procedure livePhotoViewDidEndPlaybackWithStyle(livePhotoView
      : PHLivePhotoView; didEndPlaybackWithStyle
      : PHLivePhotoViewPlaybackStyle); cdecl;
    [MethodName('livePhotoView:extraMinimumTouchDurationForTouch:withStyle:')]
    function livePhotoViewExtraMinimumTouchDurationForTouchWithStyle
      (livePhotoView: PHLivePhotoView;
      extraMinimumTouchDurationForTouch: UITouch;
      withStyle: PHLivePhotoViewPlaybackStyle): NSTimeInterval; cdecl;
  end;

  PHPickerViewControllerDelegate = interface(IObjectiveC)
    ['{2AB93D0E-4078-403B-B7BA-EC774BA5A63A}']
    procedure picker(picker: PHPickerViewController;
      didFinishPicking: NSArray); cdecl;
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
