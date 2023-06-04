{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework AVKit
//

unit iOSapi.AVKit;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.AVFoundation,
  iOSapi.CocoaTypes,
  iOSapi.CoreMedia,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  AVKitErrorUnknown = -1000;
  AVKitErrorPictureInPictureStartFailed = -1001;
  AVAudioSessionRouteSelectionNone = 0;
  AVAudioSessionRouteSelectionLocal = 1;
  AVAudioSessionRouteSelectionExternal = 2;
  AVRoutePickerViewButtonStyleSystem = 0;
  AVRoutePickerViewButtonStylePlain = 1;
  AVRoutePickerViewButtonStyleCustom = 2;

type

  // ===== Forward declarations =====
{$M+}
  AVInterstitialTimeRange = interface;
  AVPictureInPictureControllerContentSource = interface;
  AVPictureInPictureControllerDelegate = interface;
  AVPictureInPictureController = interface;
  AVPictureInPictureSampleBufferPlaybackDelegate = interface;
  AVPictureInPictureVideoCallViewController = interface;
  AVPlaybackSpeed = interface;
  AVKitAdditions = interface;
  AVPlayerViewControllerDelegate = interface;
  AVPlayerViewController = interface;
  AVRoutePickerViewDelegate = interface;
  AVRoutePickerView = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  AVKitError = NSInteger;
  CMTimeValue = Int64;
  PCMTimeValue = ^CMTimeValue;
  CMTimeScale = Int32;
  PCMTimeScale = ^CMTimeScale;
  CMTimeFlags = LongWord;
  CMTimeEpoch = Int64;
  PCMTimeEpoch = ^CMTimeEpoch;

  CMTime = record
    value: CMTimeValue;
    timescale: CMTimeScale;
    flags: CMTimeFlags;
    epoch: CMTimeEpoch;
  end;

  PCMTime = ^CMTime;

  CMTimeRange = record
    start: CMTime;
    duration: CMTime;
  end;

  PCMTimeRange = ^CMTimeRange;

  TAVKitRestoreUserInterfaceForPictureInPictureStopWithCompletionHandler =
    procedure(param1: Boolean) of object;

  CMVideoDimensions = record
    width: Int32;
    height: Int32;
  end;

  PCMVideoDimensions = ^CMVideoDimensions;

  TAVKitCompletionHandler = procedure() of object;
  AVLayerVideoGravity = NSString;
  PAVLayerVideoGravity = ^AVLayerVideoGravity;
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

  AVAudioSessionRouteSelection = NSInteger;
  AVRoutePickerViewButtonStyle = NSInteger;
  // ===== Interface declarations =====

  AVInterstitialTimeRangeClass = interface(NSObjectClass)
    ['{2D243899-CEDB-4768-A620-3076CEC16B85}']
  end;

  AVInterstitialTimeRange = interface(NSObject)
    ['{B9342292-365C-4D2D-9AA2-FC1C145BED19}']
    function initWithTimeRange(timeRange: CMTimeRange)
      : Pointer { instancetype }; cdecl;
    function timeRange: CMTimeRange; cdecl;
  end;

  TAVInterstitialTimeRange = class
    (TOCGenericImport<AVInterstitialTimeRangeClass, AVInterstitialTimeRange>)
  end;

  PAVInterstitialTimeRange = Pointer;

  AVPictureInPictureControllerContentSourceClass = interface(NSObjectClass)
    ['{94A24444-4C75-45E9-A1C7-F1904D15A33E}']
  end;

  AVPictureInPictureControllerContentSource = interface(NSObject)
    ['{FAA79DA1-CC5F-418C-8AA1-CCC40FBD8ACE}']
    function initWithPlayerLayer(playerLayer: AVPlayerLayer)
      : Pointer { instancetype }; cdecl;
    function playerLayer: AVPlayerLayer; cdecl;
    function initWithSampleBufferDisplayLayer(sampleBufferDisplayLayer
      : AVSampleBufferDisplayLayer; playbackDelegate: Pointer)
      : Pointer { instancetype }; cdecl;
    function sampleBufferDisplayLayer: AVSampleBufferDisplayLayer; cdecl;
    function sampleBufferPlaybackDelegate: Pointer; cdecl;
    function initWithActiveVideoCallSourceView(sourceView: UIView;
      contentViewController: AVPictureInPictureVideoCallViewController)
      : Pointer { instancetype }; cdecl;
    function activeVideoCallSourceView: UIView; cdecl;
    function activeVideoCallContentViewController
      : AVPictureInPictureVideoCallViewController; cdecl;
  end;

  TAVPictureInPictureControllerContentSource = class
    (TOCGenericImport<AVPictureInPictureControllerContentSourceClass,
    AVPictureInPictureControllerContentSource>)
  end;

  PAVPictureInPictureControllerContentSource = Pointer;

  AVPictureInPictureControllerClass = interface(NSObjectClass)
    ['{4FB563DA-DF51-4DAA-8E9D-B774F033C608}']
    { class } function isPictureInPictureSupported: Boolean; cdecl;
    { class } function
      pictureInPictureButtonStartImageCompatibleWithTraitCollection
      (traitCollection: UITraitCollection): UIImage; cdecl;
    { class } function
      pictureInPictureButtonStopImageCompatibleWithTraitCollection
      (traitCollection: UITraitCollection): UIImage; cdecl;
  end;

  AVPictureInPictureController = interface(NSObject)
    ['{775CDDF5-330E-44BD-87C1-F4EFE1F987CA}']
    procedure setPictureInPictureButtonStartImage
      (pictureInPictureButtonStartImage: UIImage); cdecl;
    function pictureInPictureButtonStartImage: UIImage; cdecl;
    procedure setPictureInPictureButtonStopImage(pictureInPictureButtonStopImage
      : UIImage); cdecl;
    function pictureInPictureButtonStopImage: UIImage; cdecl;
    function initWithContentSource(contentSource
      : AVPictureInPictureControllerContentSource)
      : Pointer { instancetype }; cdecl;
    function initWithPlayerLayer(playerLayer: AVPlayerLayer)
      : Pointer { instancetype }; cdecl;
    procedure setContentSource(contentSource
      : AVPictureInPictureControllerContentSource); cdecl;
    function contentSource: AVPictureInPictureControllerContentSource; cdecl;
    function playerLayer: AVPlayerLayer; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure startPictureInPicture; cdecl;
    procedure stopPictureInPicture; cdecl;
    function isPictureInPicturePossible: Boolean; cdecl;
    function isPictureInPictureActive: Boolean; cdecl;
    function isPictureInPictureSuspended: Boolean; cdecl;
    function canStopPictureInPicture: Boolean; cdecl;
    procedure setRequiresLinearPlayback(requiresLinearPlayback: Boolean); cdecl;
    function requiresLinearPlayback: Boolean; cdecl;
    procedure setCanStartPictureInPictureAutomaticallyFromInline
      (canStartPictureInPictureAutomaticallyFromInline: Boolean); cdecl;
    function canStartPictureInPictureAutomaticallyFromInline: Boolean; cdecl;
    procedure invalidatePlaybackState; cdecl;
  end;

  TAVPictureInPictureController = class
    (TOCGenericImport<AVPictureInPictureControllerClass,
    AVPictureInPictureController>)
  end;

  PAVPictureInPictureController = Pointer;

  AVPictureInPictureVideoCallViewControllerClass = interface
    (UIViewControllerClass)
    ['{A9BE17BE-A80D-4851-A6D4-D88674032DC8}']
  end;

  AVPictureInPictureVideoCallViewController = interface(UIViewController)
    ['{2F833F54-B097-4E24-8273-F42F8D8C944B}']
  end;

  TAVPictureInPictureVideoCallViewController = class
    (TOCGenericImport<AVPictureInPictureVideoCallViewControllerClass,
    AVPictureInPictureVideoCallViewController>)
  end;

  PAVPictureInPictureVideoCallViewController = Pointer;

  AVPlaybackSpeedClass = interface(NSObjectClass)
    ['{15CE09C3-EFCA-4B52-B5B0-AF1D7CF5E47E}']
  end;

  AVPlaybackSpeed = interface(NSObject)
    ['{83DC7BE1-2D7B-4DCA-B7D8-F6AAC44BE0FE}']
    function systemDefaultSpeeds: NSArray; cdecl;
    function initWithRate(rate: Single; localizedName: NSString)
      : Pointer { instancetype }; cdecl;
    function rate: Single; cdecl;
    function localizedName: NSString; cdecl;
    function localizedNumericName: NSString; cdecl;
  end;

  TAVPlaybackSpeed = class(TOCGenericImport<AVPlaybackSpeedClass,
    AVPlaybackSpeed>)
  end;

  PAVPlaybackSpeed = Pointer;

  AVKitAdditions = interface(IObjectiveC)
    ['{71D94D14-A590-4658-BEAF-438BEEC62714}']
    procedure setExternalMetadata(externalMetadata: NSArray); cdecl;
    function externalMetadata: NSArray; cdecl;
    function interstitialTimeRanges: NSArray; cdecl;
  end;

  AVPlayerViewControllerClass = interface(UIViewControllerClass)
    ['{002D8E1A-F290-4F1D-86B5-79FA8D303B96}']
  end;

  AVPlayerViewController = interface(UIViewController)
    ['{08399528-37FC-44E3-BF93-7479AA0B8A48}']
    procedure setPlayer(player: AVPlayer); cdecl;
    function player: AVPlayer; cdecl;
    procedure setShowsPlaybackControls(showsPlaybackControls: Boolean); cdecl;
    function showsPlaybackControls: Boolean; cdecl;
    procedure setShowsTimecodes(showsTimecodes: Boolean); cdecl;
    function showsTimecodes: Boolean; cdecl;
    procedure setVideoGravity(videoGravity: AVLayerVideoGravity); cdecl;
    function videoGravity: AVLayerVideoGravity; cdecl;
    function isReadyForDisplay: Boolean; cdecl;
    function videoBounds: CGRect; cdecl;
    function contentOverlayView: UIView; cdecl;
    procedure setAllowsPictureInPicturePlayback(allowsPictureInPicturePlayback
      : Boolean); cdecl;
    function allowsPictureInPicturePlayback: Boolean; cdecl;
    procedure setAllowsVideoFrameAnalysis(allowsVideoFrameAnalysis
      : Boolean); cdecl;
    function allowsVideoFrameAnalysis: Boolean; cdecl;
    procedure setCanStartPictureInPictureAutomaticallyFromInline
      (canStartPictureInPictureAutomaticallyFromInline: Boolean); cdecl;
    function canStartPictureInPictureAutomaticallyFromInline: Boolean; cdecl;
    procedure setUpdatesNowPlayingInfoCenter(updatesNowPlayingInfoCenter
      : Boolean); cdecl;
    function updatesNowPlayingInfoCenter: Boolean; cdecl;
    procedure setEntersFullScreenWhenPlaybackBegins
      (entersFullScreenWhenPlaybackBegins: Boolean); cdecl;
    function entersFullScreenWhenPlaybackBegins: Boolean; cdecl;
    procedure setExitsFullScreenWhenPlaybackEnds(exitsFullScreenWhenPlaybackEnds
      : Boolean); cdecl;
    function exitsFullScreenWhenPlaybackEnds: Boolean; cdecl;
    procedure setRequiresLinearPlayback(requiresLinearPlayback: Boolean); cdecl;
    function requiresLinearPlayback: Boolean; cdecl;
    procedure setPixelBufferAttributes(pixelBufferAttributes
      : NSDictionary); cdecl;
    function pixelBufferAttributes: NSDictionary; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setSpeeds(speeds: NSArray); cdecl;
    function speeds: NSArray; cdecl;
    function selectedSpeed: AVPlaybackSpeed; cdecl;
    procedure selectSpeed(speed: AVPlaybackSpeed); cdecl;
  end;

  TAVPlayerViewController = class(TOCGenericImport<AVPlayerViewControllerClass,
    AVPlayerViewController>)
  end;

  PAVPlayerViewController = Pointer;

  AVRoutePickerViewClass = interface(UIViewClass)
    ['{CE0D5B61-F758-4ED7-987B-322D154ADC82}']
  end;

  AVRoutePickerView = interface(UIView)
    ['{3C06A7A4-B427-417E-98E3-E91E8F15F683}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setActiveTintColor(activeTintColor: UIColor); cdecl;
    function activeTintColor: UIColor; cdecl;
    procedure setRoutePickerButtonStyle(routePickerButtonStyle
      : AVRoutePickerViewButtonStyle); cdecl;
    function routePickerButtonStyle: AVRoutePickerViewButtonStyle; cdecl;
    procedure setPrioritizesVideoDevices(prioritizesVideoDevices
      : Boolean); cdecl;
    function prioritizesVideoDevices: Boolean; cdecl;
    procedure setCustomRoutingController(customRoutingController
      : AVCustomRoutingController); cdecl;
    function customRoutingController: AVCustomRoutingController; cdecl;
  end;

  TAVRoutePickerView = class(TOCGenericImport<AVRoutePickerViewClass,
    AVRoutePickerView>)
  end;

  PAVRoutePickerView = Pointer;

  // ===== Protocol declarations =====

  AVPictureInPictureControllerDelegate = interface(IObjectiveC)
    ['{6562EF39-B920-474B-8D87-10F3CBEC0281}']
    procedure pictureInPictureControllerWillStartPictureInPicture
      (pictureInPictureController: AVPictureInPictureController); cdecl;
    procedure pictureInPictureControllerDidStartPictureInPicture
      (pictureInPictureController: AVPictureInPictureController); cdecl;
    [MethodName
      ('pictureInPictureController:failedToStartPictureInPictureWithError:')]
    procedure pictureInPictureControllerFailedToStartPictureInPictureWithError
      (pictureInPictureController: AVPictureInPictureController;
      failedToStartPictureInPictureWithError: NSError); cdecl;
    procedure pictureInPictureControllerWillStopPictureInPicture
      (pictureInPictureController: AVPictureInPictureController); cdecl;
    procedure pictureInPictureControllerDidStopPictureInPicture
      (pictureInPictureController: AVPictureInPictureController); cdecl;
    [MethodName
      ('pictureInPictureController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:')
      ]
    procedure pictureInPictureControllerRestoreUserInterfaceForPictureInPictureStopWithCompletionHandler
      (pictureInPictureController: AVPictureInPictureController;
      restoreUserInterfaceForPictureInPictureStopWithCompletionHandler
      : TAVKitRestoreUserInterfaceForPictureInPictureStopWithCompletionHandler);
      cdecl;
  end;

  AVPictureInPictureSampleBufferPlaybackDelegate = interface(IObjectiveC)
    ['{97F960EE-FCF0-4998-A5BF-F065FB60D3A6}']
    [MethodName('pictureInPictureController:setPlaying:')]
    procedure pictureInPictureControllerSetPlaying(pictureInPictureController
      : AVPictureInPictureController; setPlaying: Boolean); cdecl;
    function pictureInPictureControllerTimeRangeForPlayback
      (pictureInPictureController: AVPictureInPictureController)
      : CMTimeRange; cdecl;
    function pictureInPictureControllerIsPlaybackPaused
      (pictureInPictureController: AVPictureInPictureController)
      : Boolean; cdecl;
    [MethodName('pictureInPictureController:didTransitionToRenderSize:')]
    procedure pictureInPictureControllerDidTransitionToRenderSize
      (pictureInPictureController: AVPictureInPictureController;
      didTransitionToRenderSize: CMVideoDimensions); cdecl;
    [MethodName('pictureInPictureController:skipByInterval:completionHandler:')]
    procedure pictureInPictureControllerSkipByIntervalCompletionHandler
      (pictureInPictureController: AVPictureInPictureController;
      skipByInterval: CMTime;
      completionHandler: TAVKitCompletionHandler); cdecl;
    function pictureInPictureControllerShouldProhibitBackgroundAudioPlayback
      (pictureInPictureController: AVPictureInPictureController)
      : Boolean; cdecl;
  end;

  AVPlayerViewControllerDelegate = interface(IObjectiveC)
    ['{6BDEC933-8B4B-45BF-8C19-BC892A2D92A3}']
    [MethodName
      ('playerViewController:willBeginFullScreenPresentationWithAnimationCoordinator:')
      ]
    procedure playerViewControllerWillBeginFullScreenPresentationWithAnimationCoordinator
      (playerViewController: AVPlayerViewController;
      willBeginFullScreenPresentationWithAnimationCoordinator: Pointer); cdecl;
    [MethodName
      ('playerViewController:willEndFullScreenPresentationWithAnimationCoordinator:')
      ]
    procedure playerViewControllerWillEndFullScreenPresentationWithAnimationCoordinator
      (playerViewController: AVPlayerViewController;
      willEndFullScreenPresentationWithAnimationCoordinator: Pointer); cdecl;
    [MethodName
      ('playerViewController:restoreUserInterfaceForFullScreenExitWithCompletionHandler:')
      ]
    procedure playerViewControllerRestoreUserInterfaceForFullScreenExitWithCompletionHandler
      (playerViewController: AVPlayerViewController;
      restoreUserInterfaceForFullScreenExitWithCompletionHandler
      : TAVKitRestoreUserInterfaceForPictureInPictureStopWithCompletionHandler);
      cdecl;
    procedure playerViewControllerWillStartPictureInPicture(playerViewController
      : AVPlayerViewController); cdecl;
    procedure playerViewControllerDidStartPictureInPicture(playerViewController
      : AVPlayerViewController); cdecl;
    [MethodName('playerViewController:failedToStartPictureInPictureWithError:')]
    procedure playerViewControllerFailedToStartPictureInPictureWithError
      (playerViewController: AVPlayerViewController;
      failedToStartPictureInPictureWithError: NSError); cdecl;
    procedure playerViewControllerWillStopPictureInPicture(playerViewController
      : AVPlayerViewController); cdecl;
    procedure playerViewControllerDidStopPictureInPicture(playerViewController
      : AVPlayerViewController); cdecl;
    function playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart
      (playerViewController: AVPlayerViewController): Boolean; cdecl;
    [MethodName
      ('playerViewController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:')
      ]
    procedure playerViewControllerRestoreUserInterfaceForPictureInPictureStopWithCompletionHandler
      (playerViewController: AVPlayerViewController;
      restoreUserInterfaceForPictureInPictureStopWithCompletionHandler
      : TAVKitRestoreUserInterfaceForPictureInPictureStopWithCompletionHandler);
      cdecl;
    [MethodName('playerViewController:willPresentInterstitialTimeRange:')]
    procedure playerViewControllerWillPresentInterstitialTimeRange
      (playerViewController: AVPlayerViewController;
      willPresentInterstitialTimeRange: AVInterstitialTimeRange); cdecl;
    [MethodName('playerViewController:didPresentInterstitialTimeRange:')]
    procedure playerViewControllerDidPresentInterstitialTimeRange
      (playerViewController: AVPlayerViewController;
      didPresentInterstitialTimeRange: AVInterstitialTimeRange); cdecl;
  end;

  AVRoutePickerViewDelegate = interface(IObjectiveC)
    ['{33476CAB-8B82-47AF-A131-8DFEF5BD56CE}']
    procedure routePickerViewWillBeginPresentingRoutes(routePickerView
      : AVRoutePickerView); cdecl;
    procedure routePickerViewDidEndPresentingRoutes(routePickerView
      : AVRoutePickerView); cdecl;
  end;

  // ===== Exported string consts =====

function AVKitErrorDomain: NSString;


// ===== External functions =====

const
  libAVKit = '/System/Library/Frameworks/AVKit.framework/AVKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AVKitModule: THandle;

{$ENDIF IOS}

function AVKitErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libAVKit, 'AVKitErrorDomain');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

AVKitModule := dlopen(MarshaledAString(libAVKit), RTLD_LAZY);

finalization

dlclose(AVKitModule);
{$ENDIF IOS}

end.
