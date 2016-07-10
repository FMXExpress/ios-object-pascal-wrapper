{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework PushKit
//

unit iOSapi.PushKit;

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

type

  // ===== Forward declarations =====
{$M+}
  PKPushCredentials = interface;
  PKPushPayload = interface;
  PKPushRegistryDelegate = interface;
  PKPushRegistry = interface;

  // ===== Framework typedefs =====
{$M+}
  dispatch_queue_t = Pointer;
  // ===== Interface declarations =====

  PKPushCredentialsClass = interface(NSObjectClass)
    ['{CD9399CE-EEA2-4A94-8680-1B8EEF468ED0}']
  end;

  PKPushCredentials = interface(NSObject)
    ['{FA94AD35-A118-4EB8-90DD-AB9C084617BE}']
    function &type: NSString; cdecl;
    function token: NSData; cdecl;
  end;

  TPKPushCredentials = class(TOCGenericImport<PKPushCredentialsClass,
    PKPushCredentials>)
  end;

  PPKPushCredentials = Pointer;

  PKPushPayloadClass = interface(NSObjectClass)
    ['{579EED35-845B-49B8-B52A-23D0AED4F154}']
  end;

  PKPushPayload = interface(NSObject)
    ['{8C4DFED0-FB16-41ED-ABB1-9F969F1FABF9}']
    function &type: NSString; cdecl;
    function dictionaryPayload: NSDictionary; cdecl;
  end;

  TPKPushPayload = class(TOCGenericImport<PKPushPayloadClass, PKPushPayload>)
  end;

  PPKPushPayload = Pointer;

  PKPushRegistryClass = interface(NSObjectClass)
    ['{F8264110-A4BA-48F0-B27B-A9025BF3C400}']
  end;

  PKPushRegistry = interface(NSObject)
    ['{5D555774-EC0B-45D1-B3D2-23803C02E0A0}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setDesiredPushTypes(desiredPushTypes: NSSet); cdecl;
    function desiredPushTypes: NSSet; cdecl;
    function pushTokenForType(&type: NSString): NSData; cdecl;
    function initWithQueue(queue: dispatch_queue_t)
      : Pointer { instancetype }; cdecl;
  end;

  TPKPushRegistry = class(TOCGenericImport<PKPushRegistryClass, PKPushRegistry>)
  end;

  PPKPushRegistry = Pointer;

  // ===== Protocol declarations =====

  PKPushRegistryDelegate = interface(IObjectiveC)
    ['{81D5E7D8-7042-407C-8D97-793C5DE0E374}']
    [MethodName('pushRegistry:didUpdatePushCredentials:forType:')]
    procedure pushRegistryDidUpdatePushCredentialsForType
      (registry: PKPushRegistry; didUpdatePushCredentials: PKPushCredentials;
      forType: NSString); cdecl;
    [MethodName('pushRegistry:didReceiveIncomingPushWithPayload:forType:')]
    procedure pushRegistryDidReceiveIncomingPushWithPayloadForType
      (registry: PKPushRegistry; didReceiveIncomingPushWithPayload
      : PKPushPayload; forType: NSString); cdecl;
    [MethodName('pushRegistry:didInvalidatePushTokenForType:')]
    procedure pushRegistryDidInvalidatePushTokenForType
      (registry: PKPushRegistry;
      didInvalidatePushTokenForType: NSString); cdecl;
  end;

  // ===== Exported string consts =====

function PKPushTypeVoIP: NSString;
function PKPushTypeComplication: NSString;


// ===== External functions =====

const
  libPushKit = '/System/Library/Frameworks/PushKit.framework/PushKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  PushKitModule: THandle;

{$ENDIF IOS}

function PKPushTypeVoIP: NSString;
begin
  Result := CocoaNSStringConst(libPushKit, 'PKPushTypeVoIP');
end;

function PKPushTypeComplication: NSString;
begin
  Result := CocoaNSStringConst(libPushKit, 'PKPushTypeComplication');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

PushKitModule := dlopen(MarshaledAString(libPushKit), RTLD_LAZY);

finalization

dlclose(PushKitModule);
{$ENDIF IOS}

end.
