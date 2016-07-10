{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreTelephony
//

unit iOSapi.CoreTelephony;

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
  kCTErrorDomainNoError = 0;
  kCTErrorDomainPOSIX = 1;
  kCTErrorDomainMach = 2;
  kCTCellularDataRestrictedStateUnknown = 0;
  kCTCellularDataRestricted = 1;
  kCTCellularDataNotRestricted = 2;

type

  // ===== Forward declarations =====
{$M+}
  CTCall = interface;
  CTCallCenter = interface;
  CTCarrier = interface;
  CTCellularData = interface;
  CTSubscriber = interface;
  CTSubscriberInfo = interface;
  CTTelephonyNetworkInfo = interface;

  // ===== Framework typedefs =====
{$M+}

  CTError = record
    domain: Int32;
    error: Int32;
  end;

  PCTError = ^CTError;

  TCoreTelephonyCallEventHandler = procedure(param1: CTCall) of object;
  NSUInteger = Cardinal;
  CTCellularDataRestrictedState = NSUInteger;
  CellularDataRestrictionDidUpdateNotifier = procedure
    (param1: CTCellularDataRestrictedState) of object;
  TCoreTelephonySubscriberCellularProviderDidUpdateNotifier = procedure
    (param1: CTCarrier) of object;
  // ===== Interface declarations =====

  CTCallClass = interface(NSObjectClass)
    ['{7333E325-C817-4441-9597-11429D0BACCA}']
  end;

  CTCall = interface(NSObject)
    ['{94C077D3-2A92-444B-9CB1-54A9C7114131}']
    function callState: NSString; cdecl;
    function callID: NSString; cdecl;
  end;

  TCTCall = class(TOCGenericImport<CTCallClass, CTCall>)
  end;

  PCTCall = Pointer;

  CTCallCenterClass = interface(NSObjectClass)
    ['{8A3FDBD1-343B-403C-AD0C-3812FF0E17F8}']
  end;

  CTCallCenter = interface(NSObject)
    ['{A0D57431-40AD-4832-A8B3-FCF236AFDBD6}']
    function currentCalls: NSSet; cdecl;
    procedure setCallEventHandler(callEventHandler
      : TCoreTelephonyCallEventHandler); cdecl;
    function callEventHandler: TCoreTelephonyCallEventHandler; cdecl;
  end;

  TCTCallCenter = class(TOCGenericImport<CTCallCenterClass, CTCallCenter>)
  end;

  PCTCallCenter = Pointer;

  CTCarrierClass = interface(NSObjectClass)
    ['{C2D9CBAA-D783-488B-8638-E2D02FACC836}']
  end;

  CTCarrier = interface(NSObject)
    ['{A5F148CA-6205-44A4-A8EA-D9F3766A4240}']
    function carrierName: NSString; cdecl;
    function mobileCountryCode: NSString; cdecl;
    function mobileNetworkCode: NSString; cdecl;
    function isoCountryCode: NSString; cdecl;
    function allowsVOIP: Boolean; cdecl;
  end;

  TCTCarrier = class(TOCGenericImport<CTCarrierClass, CTCarrier>)
  end;

  PCTCarrier = Pointer;

  CTCellularDataClass = interface(NSObjectClass)
    ['{B140FD4E-8197-4C0A-96B4-E4B4054AF4C0}']
  end;

  CTCellularData = interface(NSObject)
    ['{50A49764-F89C-4042-BC23-7FA90ACB13B3}']
    procedure setCellularDataRestrictionDidUpdateNotifier
      (CellularDataRestrictionDidUpdateNotifier
      : CellularDataRestrictionDidUpdateNotifier); cdecl;
    function CellularDataRestrictionDidUpdateNotifier
      : CellularDataRestrictionDidUpdateNotifier; cdecl;
    function restrictedState: CTCellularDataRestrictedState; cdecl;
  end;

  TCTCellularData = class(TOCGenericImport<CTCellularDataClass, CTCellularData>)
  end;

  PCTCellularData = Pointer;

  CTSubscriberClass = interface(NSObjectClass)
    ['{CBC3E2BE-DE15-418C-84EF-62E564258E04}']
  end;

  CTSubscriber = interface(NSObject)
    ['{16467BE6-040D-4693-BACA-D0C48B50326F}']
    function carrierToken: NSData; cdecl;
  end;

  TCTSubscriber = class(TOCGenericImport<CTSubscriberClass, CTSubscriber>)
  end;

  PCTSubscriber = Pointer;

  CTSubscriberInfoClass = interface(NSObjectClass)
    ['{5A1B2051-7BFD-4C90-A337-BBEA9666380F}']
    { class } function subscriber: CTSubscriber; cdecl;
  end;

  CTSubscriberInfo = interface(NSObject)
    ['{F7FF8555-0158-456A-8147-D179191E7DF7}']
  end;

  TCTSubscriberInfo = class(TOCGenericImport<CTSubscriberInfoClass,
    CTSubscriberInfo>)
  end;

  PCTSubscriberInfo = Pointer;

  CTTelephonyNetworkInfoClass = interface(NSObjectClass)
    ['{7F830403-94F6-4C9E-8107-293AA4ECDC1B}']
  end;

  CTTelephonyNetworkInfo = interface(NSObject)
    ['{7D3F1DB8-199D-4802-B5C0-6C55E8500C80}']
    function subscriberCellularProvider: CTCarrier; cdecl;
    procedure setSubscriberCellularProviderDidUpdateNotifier
      (subscriberCellularProviderDidUpdateNotifier
      : TCoreTelephonySubscriberCellularProviderDidUpdateNotifier); cdecl;
    function subscriberCellularProviderDidUpdateNotifier
      : TCoreTelephonySubscriberCellularProviderDidUpdateNotifier; cdecl;
    function currentRadioAccessTechnology: NSString; cdecl;
  end;

  TCTTelephonyNetworkInfo = class(TOCGenericImport<CTTelephonyNetworkInfoClass,
    CTTelephonyNetworkInfo>)
  end;

  PCTTelephonyNetworkInfo = Pointer;

  // ===== Exported string consts =====

function CTCallStateDialing: NSString;
function CTCallStateIncoming: NSString;
function CTCallStateConnected: NSString;
function CTCallStateDisconnected: NSString;
function CTSubscriberTokenRefreshed: NSString;
function CTRadioAccessTechnologyDidChangeNotification: NSString;
function CTRadioAccessTechnologyGPRS: NSString;
function CTRadioAccessTechnologyEdge: NSString;
function CTRadioAccessTechnologyWCDMA: NSString;
function CTRadioAccessTechnologyHSDPA: NSString;
function CTRadioAccessTechnologyHSUPA: NSString;
function CTRadioAccessTechnologyCDMA1x: NSString;
function CTRadioAccessTechnologyCDMAEVDORev0: NSString;
function CTRadioAccessTechnologyCDMAEVDORevA: NSString;
function CTRadioAccessTechnologyCDMAEVDORevB: NSString;
function CTRadioAccessTechnologyeHRPD: NSString;
function CTRadioAccessTechnologyLTE: NSString;


// ===== External functions =====

const
  libCoreTelephony =
    '/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreTelephonyModule: THandle;

{$ENDIF IOS}

function CTCallStateDialing: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony, 'CTCallStateDialing');
end;

function CTCallStateIncoming: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony, 'CTCallStateIncoming');
end;

function CTCallStateConnected: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony, 'CTCallStateConnected');
end;

function CTCallStateDisconnected: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony, 'CTCallStateDisconnected');
end;

function CTSubscriberTokenRefreshed: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony, 'CTSubscriberTokenRefreshed');
end;

function CTRadioAccessTechnologyDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony,
    'CTRadioAccessTechnologyDidChangeNotification');
end;

function CTRadioAccessTechnologyGPRS: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony, 'CTRadioAccessTechnologyGPRS');
end;

function CTRadioAccessTechnologyEdge: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony, 'CTRadioAccessTechnologyEdge');
end;

function CTRadioAccessTechnologyWCDMA: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony,
    'CTRadioAccessTechnologyWCDMA');
end;

function CTRadioAccessTechnologyHSDPA: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony,
    'CTRadioAccessTechnologyHSDPA');
end;

function CTRadioAccessTechnologyHSUPA: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony,
    'CTRadioAccessTechnologyHSUPA');
end;

function CTRadioAccessTechnologyCDMA1x: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony,
    'CTRadioAccessTechnologyCDMA1x');
end;

function CTRadioAccessTechnologyCDMAEVDORev0: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony,
    'CTRadioAccessTechnologyCDMAEVDORev0');
end;

function CTRadioAccessTechnologyCDMAEVDORevA: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony,
    'CTRadioAccessTechnologyCDMAEVDORevA');
end;

function CTRadioAccessTechnologyCDMAEVDORevB: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony,
    'CTRadioAccessTechnologyCDMAEVDORevB');
end;

function CTRadioAccessTechnologyeHRPD: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony,
    'CTRadioAccessTechnologyeHRPD');
end;

function CTRadioAccessTechnologyLTE: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony, 'CTRadioAccessTechnologyLTE');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreTelephonyModule := dlopen(MarshaledAString(libCoreTelephony), RTLD_LAZY);

finalization

dlclose(CoreTelephonyModule);
{$ENDIF IOS}

end.
