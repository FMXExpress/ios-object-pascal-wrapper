{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework iAd
//

unit iOSapi.iAd;

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
  ADClientErrorUnknown = 0;
  ADClientErrorTrackingRestrictedOrDenied = 1;
  ADClientErrorLimitAdTracking = ADClientErrorTrackingRestrictedOrDenied;
  ADClientErrorMissingData = 2;
  ADClientErrorCorruptResponse = 3;
  ADClientErrorRequestClientError = 4;
  ADClientErrorRequestServerError = 5;
  ADClientErrorRequestNetworkError = 6;
  ADClientErrorUnsupportedPlatform = 7;

type

  // ===== Forward declarations =====
{$M+}
  ADClient = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  ADClientError = NSInteger;
  TiAdCompletionHandler = procedure(param1: NSDictionary; param2: NSError)
    of object;
  // ===== Interface declarations =====

  ADClientClass = interface(NSObjectClass)
    ['{EF561626-C23D-4FA9-9A55-74A2794C905B}']
    { class } function sharedClient: ADClient; cdecl;
  end;

  ADClient = interface(NSObject)
    ['{CE82872D-36A2-4927-A868-6C263B4AC84A}']
    procedure requestAttributionDetailsWithBlock(completionHandler
      : TiAdCompletionHandler); cdecl;
    procedure addClientToSegments(segmentIdentifiers: NSArray;
      replaceExisting: Boolean); cdecl;
  end;

  TADClient = class(TOCGenericImport<ADClientClass, ADClient>)
  end;

  PADClient = Pointer;

  // ===== Exported string consts =====

function ADClientErrorDomain: NSString;
function __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_15_0: Pointer;


// ===== External functions =====

const
  libiAd = '/System/Library/Frameworks/iAd.framework/iAd';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  iAdModule: THandle;

{$ENDIF IOS}

function ADClientErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libiAd, 'ADClientErrorDomain');
end;

function __AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_15_0: Pointer;
begin
  Result := CocoaPointerConst(libiAd,
    '__AVAILABILITY_INTERNAL__IPHONE_7_1_DEP__IPHONE_15_0');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

iAdModule := dlopen(MarshaledAString(libiAd), RTLD_LAZY);

finalization

dlclose(iAdModule);
{$ENDIF IOS}

end.
