{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework GameController
//

unit iOSapi.GameController;

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
  iOSapi.Foundation;

const
  GCControllerPlayerIndexUnset = -1;
  GCControllerPlayerIndex1 = 0;
  GCControllerPlayerIndex2 = 1;
  GCControllerPlayerIndex3 = 2;
  GCControllerPlayerIndex4 = 3;

type

  // ===== Forward declarations =====
{$M+}
  GCControllerElement = interface;
  GCControllerAxisInput = interface;
  GCControllerButtonInput = interface;
  GCControllerDirectionPad = interface;
  GCController = interface;
  GCMotion = interface;
  GCGamepadSnapshot = interface;
  GCGamepad = interface;
  GCExtendedGamepadSnapshot = interface;
  GCExtendedGamepad = interface;

  // ===== Framework typedefs =====
{$M+}
  GCControllerAxisValueChangedHandler = procedure(param1: GCControllerAxisInput;
    param2: Single) of object;
  GCControllerButtonValueChangedHandler = procedure
    (param1: GCControllerButtonInput; param2: Single; param3: Boolean)
    of object;
  GCControllerDirectionPadValueChangedHandler = procedure
    (param1: GCControllerDirectionPad; param2: Single; param3: Single)
    of object;

  GCAcceleration = record
    x: Double;
    y: Double;
    z: Double;
  end;

  PGCAcceleration = ^GCAcceleration;

  GCRotationRate = record
    x: Double;
    y: Double;
    z: Double;
  end;

  PGCRotationRate = ^GCRotationRate;

  GCEulerAngles = record
    pitch: Double;
    yaw: Double;
    roll: Double;
  end;

  PGCEulerAngles = ^GCEulerAngles;

  GCQuaternion = record
    x: Double;
    y: Double;
    z: Double;
    w: Double;
  end;

  PGCQuaternion = ^GCQuaternion;

  GCMotionValueChangedHandler = procedure(param1: GCMotion) of object;
  GCGamepadValueChangedHandler = procedure(param1: GCGamepad;
    param2: GCControllerElement) of object;

  GCGamepadSnapShotDataV100 = record
    version: Word;
    size: Word;
    dpadX: Single;
    dpadY: Single;
    buttonA: Single;
    buttonB: Single;
    buttonX: Single;
    buttonY: Single;
    leftShoulder: Single;
    rightShoulder: Single;
  end;

  PGCGamepadSnapShotDataV100 = ^GCGamepadSnapShotDataV100;

  GCExtendedGamepadValueChangedHandler = procedure(param1: GCExtendedGamepad;
    param2: GCControllerElement) of object;

  GCExtendedGamepadSnapShotDataV100 = record
    version: Word;
    size: Word;
    dpadX: Single;
    dpadY: Single;
    buttonA: Single;
    buttonB: Single;
    buttonX: Single;
    buttonY: Single;
    leftShoulder: Single;
    rightShoulder: Single;
    leftThumbstickX: Single;
    leftThumbstickY: Single;
    rightThumbstickX: Single;
    rightThumbstickY: Single;
    leftTrigger: Single;
    rightTrigger: Single;
  end;

  PGCExtendedGamepadSnapShotDataV100 = ^GCExtendedGamepadSnapShotDataV100;

  NSInteger = Integer;
  GCControllerPlayerIndex = NSInteger;
  TGameControllerControllerPausedHandler = procedure(param1: GCController)
    of object;
  dispatch_queue_t = Pointer;
  TGameControllerCompletionHandler = procedure() of object;
  // ===== Interface declarations =====

  GCControllerElementClass = interface(NSObjectClass)
    ['{BCE6E982-1113-45F1-BF5A-7398B3DC6522}']
  end;

  GCControllerElement = interface(NSObject)
    ['{5558A6F5-5B93-460F-9EEE-67D8ABE761C3}']
    function collection: GCControllerElement; cdecl;
    function isAnalog: Boolean; cdecl;
  end;

  TGCControllerElement = class(TOCGenericImport<GCControllerElementClass,
    GCControllerElement>)
  end;

  PGCControllerElement = Pointer;

  GCControllerAxisInputClass = interface(GCControllerElementClass)
    ['{63B82044-6B61-410C-BF4B-B738DF132425}']
  end;

  GCControllerAxisInput = interface(GCControllerElement)
    ['{75B051DF-AE4A-42E5-89FF-BCE83171D43E}']
    procedure setValueChangedHandler(valueChangedHandler
      : GCControllerAxisValueChangedHandler); cdecl;
    function valueChangedHandler: GCControllerAxisValueChangedHandler; cdecl;
    function value: Single; cdecl;
  end;

  TGCControllerAxisInput = class(TOCGenericImport<GCControllerAxisInputClass,
    GCControllerAxisInput>)
  end;

  PGCControllerAxisInput = Pointer;

  GCControllerButtonInputClass = interface(GCControllerElementClass)
    ['{AC64A74F-2BD0-4C31-AA30-6CD79E5BEECA}']
  end;

  GCControllerButtonInput = interface(GCControllerElement)
    ['{CFF571FA-EFC6-4767-868F-D224CDA973A5}']
    procedure setValueChangedHandler(valueChangedHandler
      : GCControllerButtonValueChangedHandler); cdecl;
    function valueChangedHandler: GCControllerButtonValueChangedHandler; cdecl;
    procedure setPressedChangedHandler(pressedChangedHandler
      : GCControllerButtonValueChangedHandler); cdecl;
    function pressedChangedHandler
      : GCControllerButtonValueChangedHandler; cdecl;
    function value: Single; cdecl;
    function isPressed: Boolean; cdecl;
  end;

  TGCControllerButtonInput = class
    (TOCGenericImport<GCControllerButtonInputClass, GCControllerButtonInput>)
  end;

  PGCControllerButtonInput = Pointer;

  GCControllerDirectionPadClass = interface(GCControllerElementClass)
    ['{874D6436-E98B-455C-A638-486B6E81368F}']
  end;

  GCControllerDirectionPad = interface(GCControllerElement)
    ['{AED5D5E5-AFF7-4485-8793-2F8DB949F8AA}']
    procedure setValueChangedHandler(valueChangedHandler
      : GCControllerDirectionPadValueChangedHandler); cdecl;
    function valueChangedHandler
      : GCControllerDirectionPadValueChangedHandler; cdecl;
    function xAxis: GCControllerAxisInput; cdecl;
    function yAxis: GCControllerAxisInput; cdecl;
    function up: GCControllerButtonInput; cdecl;
    function down: GCControllerButtonInput; cdecl;
    function left: GCControllerButtonInput; cdecl;
    function right: GCControllerButtonInput; cdecl;
  end;

  TGCControllerDirectionPad = class
    (TOCGenericImport<GCControllerDirectionPadClass, GCControllerDirectionPad>)
  end;

  PGCControllerDirectionPad = Pointer;

  GCControllerClass = interface(NSObjectClass)
    ['{B3A8970C-D48C-4573-8EE1-CA3E0C8B3131}']
    { class } function controllers: NSArray; cdecl;
    { class } procedure startWirelessControllerDiscoveryWithCompletionHandler
      (completionHandler: TGameControllerCompletionHandler); cdecl;
    { class } procedure stopWirelessControllerDiscovery; cdecl;
  end;

  GCController = interface(NSObject)
    ['{509E1075-472B-4EF2-AFD5-1B9F72F53392}']
    procedure setControllerPausedHandler(controllerPausedHandler
      : TGameControllerControllerPausedHandler); cdecl;
    function controllerPausedHandler
      : TGameControllerControllerPausedHandler; cdecl;
    procedure setHandlerQueue(handlerQueue: dispatch_queue_t); cdecl;
    function handlerQueue: dispatch_queue_t; cdecl;
    function vendorName: NSString; cdecl;
    function isAttachedToDevice: Boolean; cdecl;
    procedure setPlayerIndex(playerIndex: GCControllerPlayerIndex); cdecl;
    function playerIndex: GCControllerPlayerIndex; cdecl;
    function gamepad: GCGamepad; cdecl;
    function extendedGamepad: GCExtendedGamepad; cdecl;
    function motion: GCMotion; cdecl;
  end;

  TGCController = class(TOCGenericImport<GCControllerClass, GCController>)
  end;

  PGCController = Pointer;

  GCMotionClass = interface(NSObjectClass)
    ['{0B719BED-8967-4F01-9432-758F4AB25485}']
  end;

  GCMotion = interface(NSObject)
    ['{115831CF-A047-4490-898E-4D13932A890D}']
    function controller: GCController; cdecl;
    procedure setValueChangedHandler(valueChangedHandler
      : GCMotionValueChangedHandler); cdecl;
    function valueChangedHandler: GCMotionValueChangedHandler; cdecl;
    function gravity: GCAcceleration; cdecl;
    function userAcceleration: GCAcceleration; cdecl;
    function attitude: GCQuaternion; cdecl;
    function rotationRate: GCRotationRate; cdecl;
  end;

  TGCMotion = class(TOCGenericImport<GCMotionClass, GCMotion>)
  end;

  PGCMotion = Pointer;

  GCGamepadClass = interface(NSObjectClass)
    ['{64285A07-E7F0-44A9-AA22-37C2BB606131}']
  end;

  GCGamepad = interface(NSObject)
    ['{71F1553A-C67F-4AD1-8ED9-15495C635CB1}']
    function controller: GCController; cdecl;
    procedure setValueChangedHandler(valueChangedHandler
      : GCGamepadValueChangedHandler); cdecl;
    function valueChangedHandler: GCGamepadValueChangedHandler; cdecl;
    function saveSnapshot: GCGamepadSnapshot; cdecl;
    function dpad: GCControllerDirectionPad; cdecl;
    function buttonA: GCControllerButtonInput; cdecl;
    function buttonB: GCControllerButtonInput; cdecl;
    function buttonX: GCControllerButtonInput; cdecl;
    function buttonY: GCControllerButtonInput; cdecl;
    function leftShoulder: GCControllerButtonInput; cdecl;
    function rightShoulder: GCControllerButtonInput; cdecl;
  end;

  TGCGamepad = class(TOCGenericImport<GCGamepadClass, GCGamepad>)
  end;

  PGCGamepad = Pointer;

  GCGamepadSnapshotClass = interface(GCGamepadClass)
    ['{417E958B-00B7-4406-9CF7-0226C882C151}']
  end;

  GCGamepadSnapshot = interface(GCGamepad)
    ['{D6426123-A7D8-4A7E-A233-61D00B5B3F34}']
    procedure setSnapshotData(snapshotData: NSData); cdecl;
    function snapshotData: NSData; cdecl;
    function initWithSnapshotData(data: NSData)
      : Pointer { instancetype }; cdecl;
    function initWithController(controller: GCController; snapshotData: NSData)
      : Pointer { instancetype }; cdecl;
  end;

  TGCGamepadSnapshot = class(TOCGenericImport<GCGamepadSnapshotClass,
    GCGamepadSnapshot>)
  end;

  PGCGamepadSnapshot = Pointer;

  GCExtendedGamepadClass = interface(NSObjectClass)
    ['{DFB4C092-CF51-4F41-836C-1379200531BA}']
  end;

  GCExtendedGamepad = interface(NSObject)
    ['{671F4483-0955-447E-9D04-14F8CF138416}']
    function controller: GCController; cdecl;
    procedure setValueChangedHandler(valueChangedHandler
      : GCExtendedGamepadValueChangedHandler); cdecl;
    function valueChangedHandler: GCExtendedGamepadValueChangedHandler; cdecl;
    function saveSnapshot: GCExtendedGamepadSnapshot; cdecl;
    function dpad: GCControllerDirectionPad; cdecl;
    function buttonA: GCControllerButtonInput; cdecl;
    function buttonB: GCControllerButtonInput; cdecl;
    function buttonX: GCControllerButtonInput; cdecl;
    function buttonY: GCControllerButtonInput; cdecl;
    function leftThumbstick: GCControllerDirectionPad; cdecl;
    function rightThumbstick: GCControllerDirectionPad; cdecl;
    function leftShoulder: GCControllerButtonInput; cdecl;
    function rightShoulder: GCControllerButtonInput; cdecl;
    function leftTrigger: GCControllerButtonInput; cdecl;
    function rightTrigger: GCControllerButtonInput; cdecl;
  end;

  TGCExtendedGamepad = class(TOCGenericImport<GCExtendedGamepadClass,
    GCExtendedGamepad>)
  end;

  PGCExtendedGamepad = Pointer;

  GCExtendedGamepadSnapshotClass = interface(GCExtendedGamepadClass)
    ['{83FAE440-03EA-4981-9D51-9FB3B2E5C9DB}']
  end;

  GCExtendedGamepadSnapshot = interface(GCExtendedGamepad)
    ['{3F0D15C1-47F9-4AB4-9459-398E40FF462D}']
    procedure setSnapshotData(snapshotData: NSData); cdecl;
    function snapshotData: NSData; cdecl;
    function initWithSnapshotData(data: NSData)
      : Pointer { instancetype }; cdecl;
    function initWithController(controller: GCController; snapshotData: NSData)
      : Pointer { instancetype }; cdecl;
  end;

  TGCExtendedGamepadSnapshot = class
    (TOCGenericImport<GCExtendedGamepadSnapshotClass,
    GCExtendedGamepadSnapshot>)
  end;

  PGCExtendedGamepadSnapshot = Pointer;

  // ===== Exported string consts =====

function GCControllerDidConnectNotification: NSString;
function GCControllerDidDisconnectNotification: NSString;


// ===== External functions =====

const
  libGameController =
    '/System/Library/Frameworks/GameController.framework/GameController';
function GCGamepadSnapShotDataV100FromNSData(snapshotData: Pointer;
  data: Pointer { NSData } ): Boolean; cdecl;
  external libGameController name _PU + 'GCGamepadSnapShotDataV100FromNSData';
function NSDataFromGCGamepadSnapShotDataV100(snapshotData: Pointer)
  : Pointer { NSData }; cdecl;
  external libGameController name _PU + 'NSDataFromGCGamepadSnapShotDataV100';
function GCExtendedGamepadSnapShotDataV100FromNSData(snapshotData: Pointer;
  data: Pointer { NSData } ): Boolean; cdecl;
  external libGameController name _PU +
  'GCExtendedGamepadSnapShotDataV100FromNSData';
function NSDataFromGCExtendedGamepadSnapShotDataV100(snapshotData: Pointer)
  : Pointer { NSData }; cdecl;
  external libGameController name _PU +
  'NSDataFromGCExtendedGamepadSnapShotDataV100';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  GameControllerModule: THandle;

{$ENDIF IOS}

function GCControllerDidConnectNotification: NSString;
begin
  Result := CocoaNSStringConst(libGameController,
    'GCControllerDidConnectNotification');
end;

function GCControllerDidDisconnectNotification: NSString;
begin
  Result := CocoaNSStringConst(libGameController,
    'GCControllerDidDisconnectNotification');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

GameControllerModule := dlopen(MarshaledAString(libGameController), RTLD_LAZY);

finalization

dlclose(GameControllerModule);
{$ENDIF IOS}

end.
