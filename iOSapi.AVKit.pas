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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  AVKitErrorUnknown = -1000;
  AVKitErrorPictureInPictureStartFailed = -1001;

type

  // ===== Forward declarations =====
{$M+}
  AVPictureInPictureControllerDelegate = interface;
  AVPictureInPictureController = interface;
  AVPlayerViewControllerDelegate = interface;
  AVPlayerViewController = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  AVKitError = NSInteger;
  TAVKitRestoreUserInterfaceForPictureInPictureStopWithCompletionHandler =
    procedure(param1: Boolean) of object;
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

AVPictureInPictureControllerClass = interface(NSObjectClass)
  ['{D04BB352-D373-4339-80C2-23A78A2D8871}']
{ class } function isPictureInPictureSupported: Boolean;
cdecl;

{ class } function pictureInPictureButtonStartImageCompatibleWithTraitCollection
  (traitCollection: UITraitCollection): UIImage; cdecl;
{ class } function pictureInPictureButtonStopImageCompatibleWithTraitCollection
    (traitCollection: UITraitCollection): UIImage; cdecl;
  end;
AVPictureInPictureController = interface(NSObject)
  ['{7F9F4DB5-F0EA-42E5-BD9D-DF080E286390}']
function initWithPlayerLayer(playerLayer: AVPlayerLayer)
  : Pointer { instancetype };
cdecl;

function playerLayer: AVPlayerLayer; cdecl;
  procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
      procedure startPictureInPicture; cdecl;
        procedure stopPictureInPicture; cdecl;
          function isPictureInPicturePossible: Boolean; cdecl;
            function isPictureInPictureActive: Boolean; cdecl;
              function isPictureInPictureSuspended: Boolean; cdecl;
              end;

          TAVPictureInPictureController = class
            (TOCGenericImport<AVPictureInPictureControllerClass,
            AVPictureInPictureController>)
          end;
      PAVPictureInPictureController = Pointer;

      AVPlayerViewControllerClass = interface(UIViewControllerClass)
        ['{FF5FC14F-89CA-4411-B0C4-1B36F7A021BD}']
      end;
  AVPlayerViewController = interface(UIViewController)
    ['{1228EDFA-FC29-4AC7-8E9B-3378EC863D72}']
  procedure setPlayer(player: AVPlayer);
  cdecl;
    function player: AVPlayer; cdecl;
      procedure setShowsPlaybackControls(showsPlaybackControls: Boolean); cdecl;
        function showsPlaybackControls: Boolean; cdecl;
          procedure setVideoGravity(videoGravity: NSString); cdecl;
            function videoGravity: NSString; cdecl;
              function isReadyForDisplay: Boolean; cdecl;
                function videoBounds: CGRect; cdecl;
                  function contentOverlayView: UIView; cdecl;
                    procedure setAllowsPictureInPicturePlayback
                      (allowsPictureInPicturePlayback: Boolean); cdecl;
                      function allowsPictureInPicturePlayback: Boolean; cdecl;
                        procedure setDelegate(delegate: Pointer); cdecl;
                          function delegate: Pointer; cdecl;
                          end;

                      TAVPlayerViewController = class
                        (TOCGenericImport<AVPlayerViewControllerClass,
                        AVPlayerViewController>)
                      end;
                  PAVPlayerViewController = Pointer;

                  // ===== Protocol declarations =====

                  AVPictureInPictureControllerDelegate = interface(IObjectiveC)
                    ['{FCA64854-EB86-4F63-8C9F-45FAA5901EB0}']
                  procedure pictureInPictureControllerWillStartPictureInPicture
                    (pictureInPictureController: AVPictureInPictureController);
                  cdecl;
                    procedure pictureInPictureControllerDidStartPictureInPicture
                      (pictureInPictureController
                      : AVPictureInPictureController); cdecl;
                    [MethodName
                      ('pictureInPictureController:failedToStartPictureInPictureWithError:')
                      ]
                      procedure pictureInPictureControllerFailedToStartPictureInPictureWithError
                        (pictureInPictureController
                        : AVPictureInPictureController;
                        failedToStartPictureInPictureWithError: NSError); cdecl;
                        procedure pictureInPictureControllerWillStopPictureInPicture
                          (pictureInPictureController
                          : AVPictureInPictureController); cdecl;
                          procedure pictureInPictureControllerDidStopPictureInPicture
                            (pictureInPictureController
                            : AVPictureInPictureController); cdecl;
                          [MethodName
                            ('pictureInPictureController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:')
                            ]
                            procedure pictureInPictureControllerRestoreUserInterfaceForPictureInPictureStopWithCompletionHandler
                              (pictureInPictureController
                              : AVPictureInPictureController;
                              restoreUserInterfaceForPictureInPictureStopWithCompletionHandler
                              : TAVKitRestoreUserInterfaceForPictureInPictureStopWithCompletionHandler);
                              cdecl;
                            end;

                        AVPlayerViewControllerDelegate = interface(IObjectiveC)
                          ['{8FB8AD96-8ADB-4521-A591-16E61D9FC81F}']
                        procedure playerViewControllerWillStartPictureInPicture
                          (playerViewController: AVPlayerViewController);
                        cdecl;
                          procedure playerViewControllerDidStartPictureInPicture
                            (playerViewController
                            : AVPlayerViewController); cdecl;
                          [MethodName
                            ('playerViewController:failedToStartPictureInPictureWithError:')
                            ]
                            procedure playerViewControllerFailedToStartPictureInPictureWithError
                              (playerViewController: AVPlayerViewController;
                              failedToStartPictureInPictureWithError
                              : NSError); cdecl;
                              procedure playerViewControllerWillStopPictureInPicture
                                (playerViewController
                                : AVPlayerViewController); cdecl;
                                procedure playerViewControllerDidStopPictureInPicture
                                  (playerViewController
                                  : AVPlayerViewController); cdecl;
                                  function playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart
                                    (playerViewController
                                    : AVPlayerViewController): Boolean; cdecl;
                                  [MethodName
                                    ('playerViewController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:')
                                    ]
                                    procedure playerViewControllerRestoreUserInterfaceForPictureInPictureStopWithCompletionHandler
                                      (playerViewController
                                      : AVPlayerViewController;
                                      restoreUserInterfaceForPictureInPictureStopWithCompletionHandler
                                      : TAVKitRestoreUserInterfaceForPictureInPictureStopWithCompletionHandler);
                                      cdecl;
                                    end;

                                // ===== Exported string consts =====

                                  function AVKitErrorDomain: NSString;


                                  // ===== External functions =====

                                  const
                                    libAVKit =
                                      '/System/Library/Frameworks/AVKit.framework/AVKit';

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
