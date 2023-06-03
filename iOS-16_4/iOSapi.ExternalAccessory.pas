{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework ExternalAccessory
//

unit iOSapi.ExternalAccessory;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

const
  EAConnectionIDNone = 0;
  EABluetoothAccessoryPickerAlreadyConnected = 0;
  EABluetoothAccessoryPickerResultNotFound = 1;
  EABluetoothAccessoryPickerResultCancelled = 2;
  EABluetoothAccessoryPickerResultFailed = 3;
  EAWiFiUnconfiguredAccessoryPropertySupportsAirPlay = (1 shl 0);
  EAWiFiUnconfiguredAccessoryPropertySupportsAirPrint = (1 shl 1);
  EAWiFiUnconfiguredAccessoryPropertySupportsHomeKit = (1 shl 2);
  EAWiFiUnconfiguredAccessoryBrowserStateWiFiUnavailable = 0;
  EAWiFiUnconfiguredAccessoryBrowserStateStopped = 1;
  EAWiFiUnconfiguredAccessoryBrowserStateSearching = 2;
  EAWiFiUnconfiguredAccessoryBrowserStateConfiguring = 3;
  EAWiFiUnconfiguredAccessoryConfigurationStatusSuccess = 0;
  EAWiFiUnconfiguredAccessoryConfigurationStatusUserCancelledConfiguration = 1;
  EAWiFiUnconfiguredAccessoryConfigurationStatusFailed = 2;

type

  // ===== Forward declarations =====
{$M+}
  EAAccessoryDelegate = interface;
  EAAccessory = interface;
  EAAccessoryManager = interface;
  EASession = interface;
  EAWiFiUnconfiguredAccessory = interface;
  EAWiFiUnconfiguredAccessoryBrowserDelegate = interface;
  EAWiFiUnconfiguredAccessoryBrowser = interface;

  // ===== Framework typedefs =====
{$M+}
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  EABluetoothAccessoryPickerErrorCode = NSInteger;
  EABluetoothAccessoryPickerCompletion = procedure(param1: NSError) of object;
  EAWiFiUnconfiguredAccessoryProperties = NSUInteger;
  EAWiFiUnconfiguredAccessoryBrowserState = NSInteger;
  EAWiFiUnconfiguredAccessoryConfigurationStatus = NSInteger;
  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;
  // ===== Interface declarations =====

  EAAccessoryClass = interface(NSObjectClass)
    ['{002B713B-1B14-4A15-B3BB-0E9B44994996}']
  end;

  EAAccessory = interface(NSObject)
    ['{C16EF115-E26B-46D2-9347-79F718749170}']
    function isConnected: Boolean; cdecl;
    function connectionID: NSUInteger; cdecl;
    function manufacturer: NSString; cdecl;
    function name: NSString; cdecl;
    function modelNumber: NSString; cdecl;
    function serialNumber: NSString; cdecl;
    function firmwareRevision: NSString; cdecl;
    function hardwareRevision: NSString; cdecl;
    function dockType: NSString; cdecl;
    function protocolStrings: NSArray; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
  end;

  TEAAccessory = class(TOCGenericImport<EAAccessoryClass, EAAccessory>)
  end;

  PEAAccessory = Pointer;

  EAAccessoryManagerClass = interface(NSObjectClass)
    ['{C524AEC6-536C-4BD5-B007-58635A9A69CC}']
    { class } function sharedAccessoryManager: EAAccessoryManager; cdecl;
  end;

  EAAccessoryManager = interface(NSObject)
    ['{9836DF91-AED4-4B50-A3C3-F5B0F507B970}']
    procedure showBluetoothAccessoryPickerWithNameFilter(predicate: NSPredicate;
      completion: EABluetoothAccessoryPickerCompletion); cdecl;
    procedure registerForLocalNotifications; cdecl;
    procedure unregisterForLocalNotifications; cdecl;
    function connectedAccessories: NSArray; cdecl;
  end;

  TEAAccessoryManager = class(TOCGenericImport<EAAccessoryManagerClass,
    EAAccessoryManager>)
  end;

  PEAAccessoryManager = Pointer;

  EASessionClass = interface(NSObjectClass)
    ['{A41AC492-CDAE-46DF-94AF-412FFCD78461}']
  end;

  EASession = interface(NSObject)
    ['{08DA892A-6341-4641-9DC0-BED4916CF8A1}']
    function initWithAccessory(accessory: EAAccessory; forProtocol: NSString)
      : Pointer { instancetype }; cdecl;
    function accessory: EAAccessory; cdecl;
    function protocolString: NSString; cdecl;
    function inputStream: NSInputStream; cdecl;
    function outputStream: NSOutputStream; cdecl;
  end;

  TEASession = class(TOCGenericImport<EASessionClass, EASession>)
  end;

  PEASession = Pointer;

  EAWiFiUnconfiguredAccessoryClass = interface(NSObjectClass)
    ['{9BA741BE-EC1C-4FAA-B1A2-7EFBF0CB8AE9}']
  end;

  EAWiFiUnconfiguredAccessory = interface(NSObject)
    ['{6618DB79-D9FB-4207-9D0F-302EE7577B00}']
    function name: NSString; cdecl;
    function manufacturer: NSString; cdecl;
    function model: NSString; cdecl;
    function ssid: NSString; cdecl;
    function macAddress: NSString; cdecl;
    function properties: EAWiFiUnconfiguredAccessoryProperties; cdecl;
  end;

  TEAWiFiUnconfiguredAccessory = class
    (TOCGenericImport<EAWiFiUnconfiguredAccessoryClass,
    EAWiFiUnconfiguredAccessory>)
  end;

  PEAWiFiUnconfiguredAccessory = Pointer;

  EAWiFiUnconfiguredAccessoryBrowserClass = interface(NSObjectClass)
    ['{92FFB6C6-1B37-4C78-B858-E02E0A5627E7}']
  end;

  EAWiFiUnconfiguredAccessoryBrowser = interface(NSObject)
    ['{541BA38D-DC5D-4B86-BD4A-24331F43DE0B}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function unconfiguredAccessories: NSSet; cdecl;
    function initWithDelegate(delegate: Pointer; queue: dispatch_queue_t)
      : Pointer { instancetype }; cdecl;
    procedure startSearchingForUnconfiguredAccessoriesMatchingPredicate
      (predicate: NSPredicate); cdecl;
    procedure stopSearchingForUnconfiguredAccessories; cdecl;
    procedure configureAccessory(accessory: EAWiFiUnconfiguredAccessory;
      withConfigurationUIOnViewController: UIViewController); cdecl;
  end;

  TEAWiFiUnconfiguredAccessoryBrowser = class
    (TOCGenericImport<EAWiFiUnconfiguredAccessoryBrowserClass,
    EAWiFiUnconfiguredAccessoryBrowser>)
  end;

  PEAWiFiUnconfiguredAccessoryBrowser = Pointer;

  // ===== Protocol declarations =====

  EAAccessoryDelegate = interface(IObjectiveC)
    ['{D7BEAEA7-A6C7-4A3B-AF91-575DAF2EF308}']
    procedure accessoryDidDisconnect(accessory: EAAccessory); cdecl;
  end;

  EAWiFiUnconfiguredAccessoryBrowserDelegate = interface(IObjectiveC)
    ['{2C9B8308-BD1C-45E9-9396-6C020E6C5E53}']
    [MethodName('accessoryBrowser:didUpdateState:')]
    procedure accessoryBrowserDidUpdateState
      (browser: EAWiFiUnconfiguredAccessoryBrowser;
      didUpdateState: EAWiFiUnconfiguredAccessoryBrowserState); cdecl;
    [MethodName('accessoryBrowser:didFindUnconfiguredAccessories:')]
    procedure accessoryBrowserDidFindUnconfiguredAccessories
      (browser: EAWiFiUnconfiguredAccessoryBrowser;
      didFindUnconfiguredAccessories: NSSet); cdecl;
    [MethodName('accessoryBrowser:didRemoveUnconfiguredAccessories:')]
    procedure accessoryBrowserDidRemoveUnconfiguredAccessories
      (browser: EAWiFiUnconfiguredAccessoryBrowser;
      didRemoveUnconfiguredAccessories: NSSet); cdecl;
    [MethodName('accessoryBrowser:didFinishConfiguringAccessory:withStatus:')]
    procedure accessoryBrowserDidFinishConfiguringAccessoryWithStatus
      (browser: EAWiFiUnconfiguredAccessoryBrowser;
      didFinishConfiguringAccessory: EAWiFiUnconfiguredAccessory;
      withStatus: EAWiFiUnconfiguredAccessoryConfigurationStatus); cdecl;
  end;

  // ===== Exported string consts =====

function EABluetoothAccessoryPickerErrorDomain: NSString;
function EAAccessoryDidConnectNotification: NSString;
function EAAccessoryDidDisconnectNotification: NSString;
function EAAccessoryKey: NSString;
function EAAccessorySelectedKey: NSString;


// ===== External functions =====

const
  libExternalAccessory =
    '/System/Library/Frameworks/ExternalAccessory.framework/ExternalAccessory';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  ExternalAccessoryModule: THandle;

{$ENDIF IOS}

function EABluetoothAccessoryPickerErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libExternalAccessory,
    'EABluetoothAccessoryPickerErrorDomain');
end;

function EAAccessoryDidConnectNotification: NSString;
begin
  Result := CocoaNSStringConst(libExternalAccessory,
    'EAAccessoryDidConnectNotification');
end;

function EAAccessoryDidDisconnectNotification: NSString;
begin
  Result := CocoaNSStringConst(libExternalAccessory,
    'EAAccessoryDidDisconnectNotification');
end;

function EAAccessoryKey: NSString;
begin
  Result := CocoaNSStringConst(libExternalAccessory, 'EAAccessoryKey');
end;

function EAAccessorySelectedKey: NSString;
begin
  Result := CocoaNSStringConst(libExternalAccessory, 'EAAccessorySelectedKey');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

ExternalAccessoryModule := dlopen(MarshaledAString(libExternalAccessory),
  RTLD_LAZY);

finalization

dlclose(ExternalAccessoryModule);
{$ENDIF IOS}

end.
