{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreAudioKit
//

unit iOSapi.CoreAudioKit;

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
  iOSapi.AudioUnit,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.Foundation,
  iOSapi.UIKit;

type

  // ===== Forward declarations =====
{$M+}
  AUViewController = interface;
  AUAudioUnit_ViewController = interface;
  CABTMIDICentralViewController = interface;
  CABTMIDILocalPeripheralViewController = interface;
  CAInterAppAudioSwitcherView = interface;
  CAInterAppAudioTransportView = interface;

  // ===== Framework typedefs =====
{$M+}
  AUViewControllerBase = UIViewController;
  TCoreAudioKitCompletionHandler = procedure(param1: AUViewControllerBase)
    of object;
  AudioComponentInstance = Pointer;
  AudioUnit = AudioComponentInstance;
  CGFloat = Single;
  // ===== Interface declarations =====

  AUViewControllerClass = interface(UIViewControllerClass)
    ['{C07A29AC-CE9C-4F66-8FB1-53F71344CABA}']
  end;

  AUViewController = interface(UIViewController)
    ['{99F17CA7-0F72-4B77-80FD-5914F77E971E}']
  end;

  TAUViewController = class(TOCGenericImport<AUViewControllerClass,
    AUViewController>)
  end;

  PAUViewController = Pointer;

  AUAudioUnit_ViewController = interface(IObjectiveC)
    ['{145AA248-0948-4E04-A0C1-B6A50A89B685}']
    procedure requestViewControllerWithCompletionHandler(completionHandler
      : TCoreAudioKitCompletionHandler); cdecl;
  end;

  CABTMIDICentralViewControllerClass = interface(UITableViewControllerClass)
    ['{6536170A-ECFE-4F06-9DCF-F734E2BECE00}']
  end;

  CABTMIDICentralViewController = interface(UITableViewController)
    ['{D4A5A069-4BBD-4D79-9965-286A4F5339E3}']
  end;

  TCABTMIDICentralViewController = class
    (TOCGenericImport<CABTMIDICentralViewControllerClass,
    CABTMIDICentralViewController>)
  end;

  PCABTMIDICentralViewController = Pointer;

  CABTMIDILocalPeripheralViewControllerClass = interface(UIViewControllerClass)
    ['{44EE236B-E60B-471B-9BCA-042F3DCE70FC}']
  end;

  CABTMIDILocalPeripheralViewController = interface(UIViewController)
    ['{DF96F955-8A63-4AC2-8ACC-CB4D8116AB78}']
  end;

  TCABTMIDILocalPeripheralViewController = class
    (TOCGenericImport<CABTMIDILocalPeripheralViewControllerClass,
    CABTMIDILocalPeripheralViewController>)
  end;

  PCABTMIDILocalPeripheralViewController = Pointer;

  CAInterAppAudioSwitcherViewClass = interface(UIViewClass)
    ['{2A26C9C9-402C-4E01-BE34-CA8C99ADBB8A}']
  end;

  CAInterAppAudioSwitcherView = interface(UIView)
    ['{EBFBD867-415C-471F-B381-DCA32134AD16}']
    procedure setShowingAppNames(showingAppNames: Boolean); cdecl;
    function isShowingAppNames: Boolean; cdecl;
    procedure setOutputAudioUnit(au: AudioUnit); cdecl;
    function contentWidth: CGFloat; cdecl;
  end;

  TCAInterAppAudioSwitcherView = class
    (TOCGenericImport<CAInterAppAudioSwitcherViewClass,
    CAInterAppAudioSwitcherView>)
  end;

  PCAInterAppAudioSwitcherView = Pointer;

  CAInterAppAudioTransportViewClass = interface(UIViewClass)
    ['{B59AA9A5-3AF0-44BC-AC19-284A7EF9E0B3}']
  end;

  CAInterAppAudioTransportView = interface(UIView)
    ['{D64FA21F-1BDA-4CA1-B211-6CC71970B509}']
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    function isPlaying: Boolean; cdecl;
    function isRecording: Boolean; cdecl;
    function isConnected: Boolean; cdecl;
    procedure setLabelColor(labelColor: UIColor); cdecl;
    function labelColor: UIColor; cdecl;
    procedure setCurrentTimeLabelFont(currentTimeLabelFont: UIFont); cdecl;
    function currentTimeLabelFont: UIFont; cdecl;
    procedure setRewindButtonColor(rewindButtonColor: UIColor); cdecl;
    function rewindButtonColor: UIColor; cdecl;
    procedure setPlayButtonColor(playButtonColor: UIColor); cdecl;
    function playButtonColor: UIColor; cdecl;
    procedure setPauseButtonColor(pauseButtonColor: UIColor); cdecl;
    function pauseButtonColor: UIColor; cdecl;
    procedure setRecordButtonColor(recordButtonColor: UIColor); cdecl;
    function recordButtonColor: UIColor; cdecl;
    procedure setOutputAudioUnit(au: AudioUnit); cdecl;
  end;

  TCAInterAppAudioTransportView = class
    (TOCGenericImport<CAInterAppAudioTransportViewClass,
    CAInterAppAudioTransportView>)
  end;

  PCAInterAppAudioTransportView = Pointer;

  // ===== External functions =====

const
  libCoreAudioKit =
    '/System/Library/Frameworks/CoreAudioKit.framework/CoreAudioKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreAudioKitModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreAudioKitModule := dlopen(MarshaledAString(libCoreAudioKit), RTLD_LAZY);

finalization

dlclose(CoreAudioKitModule);
{$ENDIF IOS}

end.
