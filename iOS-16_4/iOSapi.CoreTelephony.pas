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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

const
  kCTErrorDomainNoError = 0;
  kCTErrorDomainPOSIX = 1;
  kCTErrorDomainMach = 2;
  kCTCellularDataRestrictedStateUnknown = 0;
  kCTCellularDataRestricted = 1;
  kCTCellularDataNotRestricted = 2;
  CTCellularPlanProvisioningAddPlanResultUnknown = 0;
  CTCellularPlanProvisioningAddPlanResultFail = 1;
  CTCellularPlanProvisioningAddPlanResultSuccess = 2;

type

  // ===== Forward declarations =====
{$M+}
  CTCall = interface;
  CTCallCenter = interface;
  CTCarrier = interface;
  CTCellularData = interface;
  CTCellularPlanProvisioningRequest = interface;
  CTCellularPlanProvisioning = interface;
  CTSubscriber = interface;
  CTSubscriberDelegate = interface;
  CTSubscriberInfo = interface;
  CTTelephonyNetworkInfoDelegate = interface;
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
  PNSUInteger = ^NSUInteger;

  CTCellularDataRestrictedState = NSUInteger;
  CellularDataRestrictionDidUpdateNotifier = procedure
    (param1: CTCellularDataRestrictedState) of object;
  CTCellularPlanProvisioningAddPlanResult = NSUInteger;
  TCoreTelephonyCompletionHandler = procedure
    (param1: CTCellularPlanProvisioningAddPlanResult) of object;
  TCoreTelephonyServiceSubscriberCellularProvidersDidUpdateNotifier = procedure
    (param1: NSString) of object;
  TCoreTelephonySubscriberCellularProviderDidUpdateNotifier = procedure
    (param1: CTCarrier) of object;
  // ===== Interface declarations =====

  CTCallClass = interface(NSObjectClass)
    ['{9E9A7384-0CFF-436B-8F1B-D9B86CB595E6}']
  end;

  CTCall = interface(NSObject)
    ['{52F9D0DD-CA2B-4F4F-BAD1-2DA5B655F29C}']
    function callState: NSString; cdecl;
    function callID: NSString; cdecl;
  end;

  TCTCall = class(TOCGenericImport<CTCallClass, CTCall>)
  end;

  PCTCall = Pointer;

  CTCallCenterClass = interface(NSObjectClass)
    ['{E493DBA1-C46C-4337-9222-C1030F770FBB}']
  end;

  CTCallCenter = interface(NSObject)
    ['{7AD1F131-D5ED-430B-888E-95C0102E11BB}']
    function currentCalls: NSSet; cdecl;
    procedure setCallEventHandler(callEventHandler
      : TCoreTelephonyCallEventHandler); cdecl;
    function callEventHandler: TCoreTelephonyCallEventHandler; cdecl;
  end;

  TCTCallCenter = class(TOCGenericImport<CTCallCenterClass, CTCallCenter>)
  end;

  PCTCallCenter = Pointer;

  CTCarrierClass = interface(NSObjectClass)
    ['{1769D19A-973C-460C-BA93-819C56B0D2EF}']
  end;

  CTCarrier = interface(NSObject)
    ['{4BBCBFF1-B30D-4812-A175-FD68E6389605}']
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
    ['{5E50C0BE-0D7F-4A45-8E8E-950D7E75D89A}']
  end;

  CTCellularData = interface(NSObject)
    ['{6031BE59-8DDD-4EE7-9120-15B60B52FCC9}']
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

  CTCellularPlanProvisioningRequestClass = interface(NSObjectClass)
    ['{42264CDC-F7D8-41BC-8CC3-B4ACFB414092}']
  end;

  CTCellularPlanProvisioningRequest = interface(NSObject)
    ['{1D2EA0F5-6E67-4D5F-B80C-054C5017D848}']
    procedure setAddress(address: NSString); cdecl;
    function address: NSString; cdecl;
    procedure setMatchingID(matchingID: NSString); cdecl;
    function matchingID: NSString; cdecl;
    procedure setOID(OID: NSString); cdecl;
    function OID: NSString; cdecl;
    procedure setConfirmationCode(confirmationCode: NSString); cdecl;
    function confirmationCode: NSString; cdecl;
    procedure setICCID(ICCID: NSString); cdecl;
    function ICCID: NSString; cdecl;
    procedure setEID(EID: NSString); cdecl;
    function EID: NSString; cdecl;
  end;

  TCTCellularPlanProvisioningRequest = class
    (TOCGenericImport<CTCellularPlanProvisioningRequestClass,
    CTCellularPlanProvisioningRequest>)
  end;

  PCTCellularPlanProvisioningRequest = Pointer;

  CTCellularPlanProvisioningClass = interface(NSObjectClass)
    ['{6E29C5C2-64E3-49A4-8C7A-1CA76B822F9A}']
  end;

  CTCellularPlanProvisioning = interface(NSObject)
    ['{6E44CDA2-9C1A-4EAD-806F-0B72C5615E0E}']
    function supportsEmbeddedSIM: Boolean; cdecl;
    function supportsCellularPlan: Boolean; cdecl;
    procedure addPlanWith(request: CTCellularPlanProvisioningRequest;
      completionHandler: TCoreTelephonyCompletionHandler); cdecl;
  end;

  TCTCellularPlanProvisioning = class
    (TOCGenericImport<CTCellularPlanProvisioningClass,
    CTCellularPlanProvisioning>)
  end;

  PCTCellularPlanProvisioning = Pointer;

  CTSubscriberClass = interface(NSObjectClass)
    ['{A029A5D5-0579-43F1-AD6C-24CEE337D455}']
  end;

  CTSubscriber = interface(NSObject)
    ['{60176DFE-F043-4FF5-A93C-649A855A6990}']
    function carrierToken: NSData; cdecl;
    function identifier: NSString; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
  end;

  TCTSubscriber = class(TOCGenericImport<CTSubscriberClass, CTSubscriber>)
  end;

  PCTSubscriber = Pointer;

  CTSubscriberInfoClass = interface(NSObjectClass)
    ['{BC49C8FA-5561-4A74-A39B-2055676C7F31}']
    { class } function subscribers: NSArray; cdecl;
    { class } function subscriber: CTSubscriber; cdecl;
  end;

  CTSubscriberInfo = interface(NSObject)
    ['{E6FB141D-3D7A-449D-9B1B-3D4A08E2E92D}']
  end;

  TCTSubscriberInfo = class(TOCGenericImport<CTSubscriberInfoClass,
    CTSubscriberInfo>)
  end;

  PCTSubscriberInfo = Pointer;

  CTTelephonyNetworkInfoClass = interface(NSObjectClass)
    ['{D8D5E3C3-0032-4208-B1C9-9AFCA569373C}']
  end;

  CTTelephonyNetworkInfo = interface(NSObject)
    ['{D2D3C639-9439-46CA-AC57-8279D2965978}']
    function dataServiceIdentifier: NSString; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function serviceSubscriberCellularProviders: NSDictionary; cdecl;
    function subscriberCellularProvider: CTCarrier; cdecl;
    procedure setServiceSubscriberCellularProvidersDidUpdateNotifier
      (serviceSubscriberCellularProvidersDidUpdateNotifier
      : TCoreTelephonyServiceSubscriberCellularProvidersDidUpdateNotifier);
      cdecl;
    function serviceSubscriberCellularProvidersDidUpdateNotifier
      : TCoreTelephonyServiceSubscriberCellularProvidersDidUpdateNotifier;
      cdecl;
    procedure setSubscriberCellularProviderDidUpdateNotifier
      (subscriberCellularProviderDidUpdateNotifier
      : TCoreTelephonySubscriberCellularProviderDidUpdateNotifier); cdecl;
    function subscriberCellularProviderDidUpdateNotifier
      : TCoreTelephonySubscriberCellularProviderDidUpdateNotifier; cdecl;
    function serviceCurrentRadioAccessTechnology: NSDictionary; cdecl;
    function currentRadioAccessTechnology: NSString; cdecl;
  end;

  TCTTelephonyNetworkInfo = class(TOCGenericImport<CTTelephonyNetworkInfoClass,
    CTTelephonyNetworkInfo>)
  end;

  PCTTelephonyNetworkInfo = Pointer;

  // ===== Protocol declarations =====

  CTSubscriberDelegate = interface(IObjectiveC)
    ['{D1F4AC1C-D46F-4358-9F68-8F9861741481}']
    procedure subscriberTokenRefreshed(subscriber: CTSubscriber); cdecl;
  end;

  CTTelephonyNetworkInfoDelegate = interface(IObjectiveC)
    ['{DE0841C8-0A30-428E-88C2-996E5D090917}']
    procedure dataServiceIdentifierDidChange(identifier: NSString); cdecl;
  end;

  // ===== Exported string consts =====

function CTCallStateDialing: NSString;
function CTCallStateIncoming: NSString;
function CTCallStateConnected: NSString;
function CTCallStateDisconnected: NSString;
function CTSubscriberTokenRefreshed: NSString;
function CTServiceRadioAccessTechnologyDidChangeNotification: NSString;
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
function CTRadioAccessTechnologyNRNSA: NSString;
function CTRadioAccessTechnologyNR: NSString;


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

function CTServiceRadioAccessTechnologyDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony,
    'CTServiceRadioAccessTechnologyDidChangeNotification');
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

function CTRadioAccessTechnologyNRNSA: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony,
    'CTRadioAccessTechnologyNRNSA');
end;

function CTRadioAccessTechnologyNR: NSString;
begin
  Result := CocoaNSStringConst(libCoreTelephony, 'CTRadioAccessTechnologyNR');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreTelephonyModule := dlopen(MarshaledAString(libCoreTelephony), RTLD_LAZY);

finalization

dlclose(CoreTelephonyModule);
{$ENDIF IOS}

end.
