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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
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
  PKPushType = NSString;
  PPKPushType = ^PKPushType;
  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;
  TPushKitWithCompletionHandler = procedure() of object;
  // ===== Interface declarations =====

  PKPushCredentialsClass = interface(NSObjectClass)
    ['{3D25ED18-383E-4005-9267-008707C3A377}']
  end;

  PKPushCredentials = interface(NSObject)
    ['{46BADA68-C8D3-4D24-8F9B-D09D0136D916}']
    function &type: PKPushType; cdecl;
    function token: NSData; cdecl;
  end;

  TPKPushCredentials = class(TOCGenericImport<PKPushCredentialsClass,
    PKPushCredentials>)
  end;

  PPKPushCredentials = Pointer;

  PKPushPayloadClass = interface(NSObjectClass)
    ['{78791817-3FBB-47B9-8A93-B32208D5763E}']
  end;

  PKPushPayload = interface(NSObject)
    ['{339807B6-838B-402E-B111-A16D95342C5E}']
    function &type: PKPushType; cdecl;
    function dictionaryPayload: NSDictionary; cdecl;
  end;

  TPKPushPayload = class(TOCGenericImport<PKPushPayloadClass, PKPushPayload>)
  end;

  PPKPushPayload = Pointer;

  PKPushRegistryClass = interface(NSObjectClass)
    ['{8554AD1C-BC41-4820-92A5-D6D35CD9B2A7}']
  end;

  PKPushRegistry = interface(NSObject)
    ['{7C433B18-9EAE-480E-AB4B-AB1F8884DA6A}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setDesiredPushTypes(desiredPushTypes: NSSet); cdecl;
    function desiredPushTypes: NSSet; cdecl;
    function pushTokenForType(&type: PKPushType): NSData; cdecl;
    function initWithQueue(queue: dispatch_queue_t)
      : Pointer { instancetype }; cdecl;
  end;

  TPKPushRegistry = class(TOCGenericImport<PKPushRegistryClass, PKPushRegistry>)
  end;

  PPKPushRegistry = Pointer;

  // ===== Protocol declarations =====

  PKPushRegistryDelegate = interface(IObjectiveC)
    ['{1DCD4854-BEBC-4CD1-8D36-967B34C3161F}']
    [MethodName('pushRegistry:didUpdatePushCredentials:forType:')]
    procedure pushRegistryDidUpdatePushCredentialsForType
      (registry: PKPushRegistry; didUpdatePushCredentials: PKPushCredentials;
      forType: PKPushType); cdecl;
    [MethodName('pushRegistry:didReceiveIncomingPushWithPayload:forType:')]
    procedure pushRegistryDidReceiveIncomingPushWithPayloadForType
      (registry: PKPushRegistry; didReceiveIncomingPushWithPayload
      : PKPushPayload; forType: PKPushType); cdecl;
    [MethodName
      ('pushRegistry:didReceiveIncomingPushWithPayload:forType:withCompletionHandler:')
      ]
    procedure pushRegistryDidReceiveIncomingPushWithPayloadForTypeWithCompletionHandler
      (registry: PKPushRegistry; didReceiveIncomingPushWithPayload
      : PKPushPayload; forType: PKPushType;
      withCompletionHandler: TPushKitWithCompletionHandler); cdecl;
    [MethodName('pushRegistry:didInvalidatePushTokenForType:')]
    procedure pushRegistryDidInvalidatePushTokenForType
      (registry: PKPushRegistry;
      didInvalidatePushTokenForType: PKPushType); cdecl;
  end;

  // ===== Exported string consts =====

function PKPushTypeVoIP: Pointer;
function PKPushTypeComplication: Pointer;
function PKPushTypeFileProvider: Pointer;


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

function PKPushTypeVoIP: Pointer;
begin
  Result := CocoaPointerConst(libPushKit, 'PKPushTypeVoIP');
end;

function PKPushTypeComplication: Pointer;
begin
  Result := CocoaPointerConst(libPushKit, 'PKPushTypeComplication');
end;

function PKPushTypeFileProvider: Pointer;
begin
  Result := CocoaPointerConst(libPushKit, 'PKPushTypeFileProvider');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

PushKitModule := dlopen(MarshaledAString(libPushKit), RTLD_LAZY);

finalization

dlclose(PushKitModule);
{$ENDIF IOS}

end.
