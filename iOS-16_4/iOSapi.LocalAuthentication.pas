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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation,
  iOSapi.Security;

const
  LAPolicyDeviceOwnerAuthenticationWithBiometrics = 1;
  LAPolicyDeviceOwnerAuthentication = 2;
  LAPolicyDeviceOwnerAuthenticationWithWatch = 3;
  LAPolicyDeviceOwnerAuthenticationWithBiometricsOrWatch = 4;
  LAPolicyDeviceOwnerAuthenticationWithWristDetection = 5;
  LACredentialTypeApplicationPassword = 0;
  LACredentialTypeSmartCardPIN = -3;
  LAAccessControlOperationCreateItem = 0;
  LAAccessControlOperationUseItem = 1;
  LAAccessControlOperationCreateKey = 2;
  LAAccessControlOperationUseKeySign = 3;
  LAAccessControlOperationUseKeyDecrypt = 4;
  LAAccessControlOperationUseKeyKeyExchange = 5;
  LABiometryTypeNone = 0;
  LABiometryNone = LABiometryTypeNone;
  LABiometryTypeTouchID = 1;
  LABiometryTypeFaceID = 2;
  LAErrorAuthenticationFailed = -1;
  LAErrorUserCancel = -2;
  LAErrorUserFallback = -3;
  LAErrorSystemCancel = -4;
  LAErrorPasscodeNotSet = -5;
  LAErrorTouchIDNotAvailable = -4;
  __AVAILABILITY_INTERNAL__IPHONE_8_0_DEP__IPHONE_11_0 = -6;
  LAErrorTouchIDNotEnrolled = -5;
  LAErrorTouchIDLockout = 0;
  __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_11_0 = -8;
  LAErrorAppCancel = -9;
  LAErrorInvalidContext = -10;
  LAErrorBiometryNotAvailable = -6;
  LAErrorBiometryNotEnrolled = -7;
  LAErrorBiometryLockout = -8;
  LAErrorNotInteractive = -1004;
  LAErrorWatchNotAvailable = -11;
  LAErrorBiometryNotPaired = -12;
  LAErrorBiometryDisconnected = -13;
  LAErrorInvalidDimensions = -14;
  LARightStateUnknown = 0;
  LARightStateAuthorizing = 1;
  LARightStateAuthorized = 2;
  LARightStateNotAuthorized = 3;

type

  // ===== Forward declarations =====
{$M+}
  LAContext = interface;
  LAAuthenticationRequirement = interface;
  LARightDelegate = interface;
  LARight = interface;
  LASecret = interface;
  LAPrivateKey = interface;
  LAPersistedRight = interface;
  LAPublicKey = interface;
  LABiometryFallbackRequirement = interface;
  LARightStore = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  LAPolicy = NSInteger;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  TLocalAuthenticationReply = procedure(param1: Boolean; param2: NSError)
    of object;
  LACredentialType = NSInteger;
  SecAccessControlRef = Pointer;
  PSecAccessControlRef = ^SecAccessControlRef;
  LAAccessControlOperation = NSInteger;
  LABiometryType = NSInteger;
  LAError = NSInteger;
  LARightState = NSInteger;
  TLocalAuthenticationCompletion = procedure(param1: NSError) of object;
  TLocalAuthenticationHandler = procedure() of object;
  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  SecKeyAlgorithm = CFStringRef;
  PSecKeyAlgorithm = ^SecKeyAlgorithm;
  TLocalAuthenticationCompletion1 = procedure(param1: NSData; param2: NSError)
    of object;
  TLocalAuthenticationCompletion2 = procedure(param1: LAPersistedRight;
    param2: NSError) of object;
  // ===== Interface declarations =====

  LAContextClass = interface(NSObjectClass)
    ['{576557B1-7E82-4247-B2E3-0048281509CE}']
  end;

  LAContext = interface(NSObject)
    ['{7EE6F69C-AEE6-47FA-B990-7ED80BC37DB7}']
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
    procedure setLocalizedCancelTitle(localizedCancelTitle: NSString); cdecl;
    function localizedCancelTitle: NSString; cdecl;
    function evaluatedPolicyDomainState: NSData; cdecl;
    procedure setTouchIDAuthenticationAllowableReuseDuration
      (touchIDAuthenticationAllowableReuseDuration: NSTimeInterval); cdecl;
    function touchIDAuthenticationAllowableReuseDuration: NSTimeInterval; cdecl;
    procedure setLocalizedReason(localizedReason: NSString); cdecl;
    function localizedReason: NSString; cdecl;
    procedure setInteractionNotAllowed(interactionNotAllowed: Boolean); cdecl;
    function interactionNotAllowed: Boolean; cdecl;
    function biometryType: LABiometryType; cdecl;
  end;

  TLAContext = class(TOCGenericImport<LAContextClass, LAContext>)
  end;

  PLAContext = Pointer;

  LAAuthenticationRequirementClass = interface(NSObjectClass)
    ['{002BA29E-42CE-4ADD-93A4-1A0F45F22420}']
    { class } function biometryRequirementWithFallback
      (fallback: LABiometryFallbackRequirement)
      : Pointer { instancetype }; cdecl;
  end;

  LAAuthenticationRequirement = interface(NSObject)
    ['{12DD1268-FCD1-47D7-80FC-716BCCF3A48D}']
    procedure setDefaultRequirement(defaultRequirement
      : LAAuthenticationRequirement); cdecl;
    function defaultRequirement: LAAuthenticationRequirement; cdecl;
    procedure setBiometryRequirement(biometryRequirement
      : LAAuthenticationRequirement); cdecl;
    function biometryRequirement: LAAuthenticationRequirement; cdecl;
    procedure setBiometryCurrentSetRequirement(biometryCurrentSetRequirement
      : LAAuthenticationRequirement); cdecl;
    function biometryCurrentSetRequirement: LAAuthenticationRequirement; cdecl;
  end;

  TLAAuthenticationRequirement = class
    (TOCGenericImport<LAAuthenticationRequirementClass,
    LAAuthenticationRequirement>)
  end;

  PLAAuthenticationRequirement = Pointer;

  LARightClass = interface(NSObjectClass)
    ['{BE550A97-F18B-42D4-A7E3-7BCD7D41D934}']
  end;

  LARight = interface(NSObject)
    ['{0FF8F61B-0797-4D6C-AC67-069C89D26439}']
    function state: LARightState; cdecl;
    procedure setTag(tag: NSInteger); cdecl;
    function tag: NSInteger; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithRequirement(requirement: LAAuthenticationRequirement)
      : Pointer { instancetype }; cdecl;
    procedure authorizeWithLocalizedReason(localizedReason: NSString;
      completion: TLocalAuthenticationCompletion); cdecl;
    procedure checkCanAuthorizeWithCompletion
      (handler: TLocalAuthenticationCompletion); cdecl;
    procedure deauthorizeWithCompletion
      (handler: TLocalAuthenticationHandler); cdecl;
  end;

  TLARight = class(TOCGenericImport<LARightClass, LARight>)
  end;

  PLARight = Pointer;

  LASecretClass = interface(NSObjectClass)
    ['{12CE7B8E-7F10-43D1-B9F4-BAFCFB24E59E}']
  end;

  LASecret = interface(NSObject)
    ['{FE3D1C09-E983-4D74-AAAF-067217D34EF2}']
    procedure loadDataWithCompletion
      (handler: TLocalAuthenticationCompletion1); cdecl;
  end;

  TLASecret = class(TOCGenericImport<LASecretClass, LASecret>)
  end;

  PLASecret = Pointer;

  LAPrivateKeyClass = interface(NSObjectClass)
    ['{A73AD122-AA81-41CF-9CB8-3F85AE9BA49B}']
  end;

  LAPrivateKey = interface(NSObject)
    ['{F9043396-0CBE-4B10-B1C7-D24D02EAA460}']
    function publicKey: LAPublicKey; cdecl;
    procedure signData(data: NSData; SecKeyAlgorithm: SecKeyAlgorithm;
      completion: TLocalAuthenticationCompletion1); cdecl;
    function canSignUsingSecKeyAlgorithm(algorithm: SecKeyAlgorithm)
      : Boolean; cdecl;
    procedure decryptData(data: NSData; SecKeyAlgorithm: SecKeyAlgorithm;
      completion: TLocalAuthenticationCompletion1); cdecl;
    function canDecryptUsingSecKeyAlgorithm(algorithm: SecKeyAlgorithm)
      : Boolean; cdecl;
    procedure exchangeKeysWithPublicKey(publicKey: NSData;
      SecKeyAlgorithm: SecKeyAlgorithm; secKeyParameters: NSDictionary;
      completion: TLocalAuthenticationCompletion1); cdecl;
    function canExchangeKeysUsingSecKeyAlgorithm(algorithm: SecKeyAlgorithm)
      : Boolean; cdecl;
  end;

  TLAPrivateKey = class(TOCGenericImport<LAPrivateKeyClass, LAPrivateKey>)
  end;

  PLAPrivateKey = Pointer;

  LAPersistedRightClass = interface(LARightClass)
    ['{8D1184A4-A7F2-480E-B667-52D0040C28AD}']
  end;

  LAPersistedRight = interface(LARight)
    ['{BD53FF1E-5887-4A76-A344-6477454C46D9}']
    function key: LAPrivateKey; cdecl;
    function secret: LASecret; cdecl;
  end;

  TLAPersistedRight = class(TOCGenericImport<LAPersistedRightClass,
    LAPersistedRight>)
  end;

  PLAPersistedRight = Pointer;

  LAPublicKeyClass = interface(NSObjectClass)
    ['{8D09A04F-BCDE-4990-B02E-027FCBD563F4}']
  end;

  LAPublicKey = interface(NSObject)
    ['{D5ED188F-3885-4819-A717-77E54D8DFB41}']
    procedure exportBytesWithCompletion
      (handler: TLocalAuthenticationCompletion1); cdecl;
    procedure encryptData(data: NSData; SecKeyAlgorithm: SecKeyAlgorithm;
      completion: TLocalAuthenticationCompletion1); cdecl;
    function canEncryptUsingSecKeyAlgorithm(algorithm: SecKeyAlgorithm)
      : Boolean; cdecl;
    procedure verifyData(signedData: NSData; signature: NSData;
      SecKeyAlgorithm: SecKeyAlgorithm;
      completion: TLocalAuthenticationCompletion); cdecl;
    function canVerifyUsingSecKeyAlgorithm(algorithm: SecKeyAlgorithm)
      : Boolean; cdecl;
  end;

  TLAPublicKey = class(TOCGenericImport<LAPublicKeyClass, LAPublicKey>)
  end;

  PLAPublicKey = Pointer;

  LABiometryFallbackRequirementClass = interface(NSObjectClass)
    ['{A6FD2598-9E35-4502-8204-D6AB6B67A405}']
  end;

  LABiometryFallbackRequirement = interface(NSObject)
    ['{45BAEB78-8DA7-41F4-A60F-A7F8C31CD890}']
    procedure setDefaultRequirement(defaultRequirement
      : LABiometryFallbackRequirement); cdecl;
    function defaultRequirement: LABiometryFallbackRequirement; cdecl;
    procedure setDevicePasscodeRequirement(devicePasscodeRequirement
      : LABiometryFallbackRequirement); cdecl;
    function devicePasscodeRequirement: LABiometryFallbackRequirement; cdecl;
  end;

  TLABiometryFallbackRequirement = class
    (TOCGenericImport<LABiometryFallbackRequirementClass,
    LABiometryFallbackRequirement>)
  end;

  PLABiometryFallbackRequirement = Pointer;

  LARightStoreClass = interface(NSObjectClass)
    ['{DA5674AA-8A60-412E-9C25-2AE7089BA2A5}']
  end;

  LARightStore = interface(NSObject)
    ['{32FD8688-C98A-4EAD-8A9A-65938EBB7136}']
    procedure setSharedStore(sharedStore: LARightStore); cdecl;
    function sharedStore: LARightStore; cdecl;
    procedure rightForIdentifier(identifier: NSString;
      completion: TLocalAuthenticationCompletion2); cdecl;
    [MethodName('saveRight:identifier:completion:')]
    procedure saveRightIdentifierCompletion(right: LARight;
      identifier: NSString; completion: TLocalAuthenticationCompletion2); cdecl;
    [MethodName('saveRight:identifier:secret:completion:')]
    procedure saveRightIdentifierSecretCompletion(right: LARight;
      identifier: NSString; secret: NSData;
      completion: TLocalAuthenticationCompletion2); cdecl;
    procedure removeRight(right: LAPersistedRight;
      completion: TLocalAuthenticationCompletion); cdecl;
    procedure removeRightForIdentifier(identifier: NSString;
      completion: TLocalAuthenticationCompletion); cdecl;
    procedure removeAllRightsWithCompletion
      (handler: TLocalAuthenticationCompletion); cdecl;
  end;

  TLARightStore = class(TOCGenericImport<LARightStoreClass, LARightStore>)
  end;

  PLARightStore = Pointer;

  // ===== Protocol declarations =====

  LARightDelegate = interface(IObjectiveC)
    ['{00AD05FA-580F-45A4-AB20-428E0186B839}']
  end;

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
