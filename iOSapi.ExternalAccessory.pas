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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
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
  EAWiFiUnconfiguredAccessory = interface;
  EAWiFiUnconfiguredAccessoryBrowserDelegate = interface;
  EAWiFiUnconfiguredAccessoryBrowser = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  EABluetoothAccessoryPickerErrorCode = NSInteger;
  EABluetoothAccessoryPickerCompletion = procedure(param1: NSError) of object;
  NSUInteger = Cardinal;
  EAWiFiUnconfiguredAccessoryProperties = NSUInteger;
  EAWiFiUnconfiguredAccessoryBrowserState = NSInteger;
  EAWiFiUnconfiguredAccessoryConfigurationStatus = NSInteger;
  dispatch_queue_t = Pointer;
  // ===== Interface declarations =====

  EAWiFiUnconfiguredAccessoryClass = interface(NSObjectClass)
    ['{2FAC18D8-549D-4B25-8AC8-9C3535207230}']
  end;

  EAWiFiUnconfiguredAccessory = interface(NSObject)
    ['{1395986B-793F-4F40-8745-30614F04B2FD}']
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
    ['{912FC18C-57E2-4948-84FD-7D3E12A37ED1}']
  end;

  EAWiFiUnconfiguredAccessoryBrowser = interface(NSObject)
    ['{9CED06A9-BB97-43E2-8F86-DD1FA0C6EA5A}']
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
    ['{5A05CE63-6708-4989-8E13-852619C56D3B}']
    procedure accessoryDidDisconnect(accessory: Pointer); cdecl;
  end;

  EAWiFiUnconfiguredAccessoryBrowserDelegate = interface(IObjectiveC)
    ['{2F6ED635-D17A-4EA3-BEF8-5C2BCDA526CB}']
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

function NSString: Pointer;
function NSString: Pointer;
function NSString: Pointer;
function NSString: Pointer;
function NSString: Pointer;


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

function NSString: Pointer;
begin
  Result := CocoaPointerConst(libExternalAccessory, 'NSString');
end;

function NSString: Pointer;
begin
  Result := CocoaPointerConst(libExternalAccessory, 'NSString');
end;

function NSString: Pointer;
begin
  Result := CocoaPointerConst(libExternalAccessory, 'NSString');
end;

function NSString: Pointer;
begin
  Result := CocoaPointerConst(libExternalAccessory, 'NSString');
end;

function NSString: Pointer;
begin
  Result := CocoaPointerConst(libExternalAccessory, 'NSString');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

ExternalAccessoryModule := dlopen(MarshaledAString(libExternalAccessory),
  RTLD_LAZY);

finalization

dlclose(ExternalAccessoryModule);
{$ENDIF IOS}

end.
