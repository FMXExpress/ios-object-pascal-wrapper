{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework LocalAuthentication
//

unit iOSapi.LocalAuthentication;

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
  iOSapi.Foundation,
  iOSapi.Security;

const
  LAPolicyDeviceOwnerAuthenticationWithBiometrics = 1;
  LAPolicyDeviceOwnerAuthentication = 2;
  LACredentialTypeApplicationPassword = 0;
  LAAccessControlOperationCreateItem = 0;
  LAAccessControlOperationUseItem = 1;
  LAAccessControlOperationCreateKey = 2;
  LAAccessControlOperationUseKeySign = 3;
  LAErrorAuthenticationFailed = -1;
  LAErrorUserCancel = -2;
  LAErrorUserFallback = -3;
  LAErrorSystemCancel = -4;
  LAErrorPasscodeNotSet = -5;
  LAErrorTouchIDNotAvailable = -6;
  LAErrorTouchIDNotEnrolled = -7;
  LAErrorTouchIDLockout = -8;
  LAErrorAppCancel = -9;
  LAErrorInvalidContext = -10;

type

  // ===== Forward declarations =====
{$M+}
  LAContext = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  LAPolicy = NSInteger;
  NSTimeInterval = Double;
  TLocalAuthenticationReply = procedure(param1: Boolean; param2: NSError)
    of object;
  LACredentialType = NSInteger;
  SecAccessControlRef = Pointer;
  LAAccessControlOperation = NSInteger;
  LAError = NSInteger;
  // ===== Interface declarations =====

  LAContextClass = interface(NSObjectClass)
    ['{90938FAC-60C5-43A2-A3C8-3CEA6626BA7C}']
  end;

  LAContext = interface(NSObject)
    ['{1E809F4B-33BA-4683-84FB-80345F1D89DE}']
    function canEvaluatePolicy(policy: LAPolicy; error: NSError)
      : Boolean; cdecl;
    procedure evaluatePolicy(policy: LAPolicy; localizedReason: NSString;
      reply: TLocalAuthenticationReply); cdecl;
    procedure invalidate; cdecl;
    function setCredential(credential: NSData; &type: LACredentialType)
      : Boolean; cdecl;
    function isCredentialSet(&type: LACredentialType): Boolean; cdecl;
    procedure evaluateAccessControl(accessControl: SecAccessControlRef;
      operation: LAAccessControlOperation; localizedReason: NSString;
      reply: TLocalAuthenticationReply); cdecl;
    procedure setLocalizedFallbackTitle(localizedFallbackTitle
      : NSString); cdecl;
    function localizedFallbackTitle: NSString; cdecl;
    procedure setMaxBiometryFailures(maxBiometryFailures: NSNumber); cdecl;
    function maxBiometryFailures: NSNumber; cdecl;
    function evaluatedPolicyDomainState: NSData; cdecl;
    procedure setTouchIDAuthenticationAllowableReuseDuration
      (touchIDAuthenticationAllowableReuseDuration: NSTimeInterval); cdecl;
    function touchIDAuthenticationAllowableReuseDuration: NSTimeInterval; cdecl;
  end;

  TLAContext = class(TOCGenericImport<LAContextClass, LAContext>)
  end;

  PLAContext = Pointer;

  // ===== Exported string consts =====

function LATouchIDAuthenticationMaximumAllowableReuseDuration: Pointer;
function LAErrorDomain: NSString;


// ===== External functions =====

const
  libLocalAuthentication =
    '/System/Library/Frameworks/LocalAuthentication.framework/LocalAuthentication';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  LocalAuthenticationModule: THandle;

{$ENDIF IOS}

function LAErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libLocalAuthentication, 'LAErrorDomain');
end;

function LATouchIDAuthenticationMaximumAllowableReuseDuration: Pointer;
begin
  Result := CocoaPointerConst(libLocalAuthentication,
    'LATouchIDAuthenticationMaximumAllowableReuseDuration');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

LocalAuthenticationModule := dlopen(MarshaledAString(libLocalAuthentication),
  RTLD_LAZY);

finalization

dlclose(LocalAuthenticationModule);
{$ENDIF IOS}

end.
