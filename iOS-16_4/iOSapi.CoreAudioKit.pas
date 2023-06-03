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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.AudioToolbox,
  iOSapi.CocoaTypes,
  iOSapi.Foundation,
  iOSapi.UIKit;

type

  // ===== Forward declarations =====
{$M+}
  AUViewController = interface;
  AUAudioUnitViewConfiguration = interface;
  AUAudioUnit_ViewController = interface;
  AUGenericViewController = interface;
  CABTMIDICentralViewController = interface;
  CABTMIDILocalPeripheralViewController = interface;
  CAInterAppAudioSwitcherView = interface;
  CAInterAppAudioTransportView = interface;

  // ===== Framework typedefs =====
{$M+}
  AUViewControllerBase = UIViewController;
  PAUViewControllerBase = ^AUViewControllerBase;
  CGFloat = Single;
  PCGFloat = ^CGFloat;

  TCoreAudioKitCompletionHandler = procedure(param1: AUViewControllerBase)
    of object;
  AUViewColor = UIColor;
  PAUViewColor = ^AUViewColor;
  AudioComponentInstance = Pointer;
  PAudioComponentInstance = ^AudioComponentInstance;
  AudioUnit = AudioComponentInstance;
  PAudioUnit = ^AudioUnit;
  // ===== Interface declarations =====

  AUViewControllerClass = interface(UIViewControllerClass)
    ['{47E53F23-C4E2-4927-BBF3-5417939431D8}']
  end;

  AUViewController = interface(UIViewController)
    ['{B18DDF95-AAA2-44E4-9EB4-09BF51C919FA}']
  end;

  TAUViewController = class(TOCGenericImport<AUViewControllerClass,
    AUViewController>)
  end;

  PAUViewController = Pointer;

  AUAudioUnitViewConfigurationClass = interface(NSObjectClass)
    ['{5D19C609-4809-4775-981C-CD582C923EFA}']
  end;

  AUAudioUnitViewConfiguration = interface(NSObject)
    ['{CD55F601-A196-40AF-B470-97775A222748}']
    function initWithWidth(width: CGFloat; height: CGFloat;
      hostHasController: Boolean): Pointer { instancetype }; cdecl;
    function width: CGFloat; cdecl;
    function height: CGFloat; cdecl;
    function hostHasController: Boolean; cdecl;
  end;

  TAUAudioUnitViewConfiguration = class
    (TOCGenericImport<AUAudioUnitViewConfigurationClass,
    AUAudioUnitViewConfiguration>)
  end;

  PAUAudioUnitViewConfiguration = Pointer;

  AUAudioUnit_ViewController = interface(IObjectiveC)
    ['{D1A14E66-6A28-4134-85A0-85614131B0AE}']
    procedure requestViewControllerWithCompletionHandler(completionHandler
      : TCoreAudioKitCompletionHandler); cdecl;
    function supportedViewConfigurations(availableViewConfigurations: NSArray)
      : NSIndexSet; cdecl;
    procedure selectViewConfiguration(viewConfiguration
      : AUAudioUnitViewConfiguration); cdecl;
  end;

  AUGenericViewControllerClass = interface(UIViewControllerClass)
    ['{23E5B91A-CB8D-497E-A727-65FA323A38BB}']
  end;

  AUGenericViewController = interface(UIViewController)
    ['{F4C6208A-A819-4E39-B7E1-FEDD9592D8A0}']
    procedure setAuAudioUnit(auAudioUnit: auAudioUnit); cdecl;
    function auAudioUnit: auAudioUnit; cdecl;
  end;

  TAUGenericViewController = class
    (TOCGenericImport<AUGenericViewControllerClass, AUGenericViewController>)
  end;

  PAUGenericViewController = Pointer;

  CABTMIDICentralViewControllerClass = interface(UITableViewControllerClass)
    ['{AA4629E7-B269-4465-BD83-F93B85789C62}']
  end;

  CABTMIDICentralViewController = interface(UITableViewController)
    ['{B56D16AD-8B7D-4E68-BFED-7B2595AF3129}']
  end;

  TCABTMIDICentralViewController = class
    (TOCGenericImport<CABTMIDICentralViewControllerClass,
    CABTMIDICentralViewController>)
  end;

  PCABTMIDICentralViewController = Pointer;

  CABTMIDILocalPeripheralViewControllerClass = interface(UIViewControllerClass)
    ['{D1B1EC6E-D49E-4F79-AFC5-125761E4B21F}']
  end;

  CABTMIDILocalPeripheralViewController = interface(UIViewController)
    ['{52D52154-0505-4D21-8B4F-5F48FB552B45}']
  end;

  TCABTMIDILocalPeripheralViewController = class
    (TOCGenericImport<CABTMIDILocalPeripheralViewControllerClass,
    CABTMIDILocalPeripheralViewController>)
  end;

  PCABTMIDILocalPeripheralViewController = Pointer;

  CAInterAppAudioSwitcherViewClass = interface(UIViewClass)
    ['{EB28C04D-2FB7-49F9-8615-D045AF40AAAA}']
  end;

  CAInterAppAudioSwitcherView = interface(UIView)
    ['{1DA43094-1442-42AB-87CC-5BD76F100F32}']
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
    ['{7F12469D-6ED4-43B0-B1F1-8556A2011EED}']
  end;

  CAInterAppAudioTransportView = interface(UIView)
    ['{57478B96-DEDC-4CAB-B7A4-4D312B4CE80B}']
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
