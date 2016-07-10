{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework AdSupport
//

unit iOSapi.AdSupport;

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
  ASIdentifierManager = interface;

  // ===== Interface declarations =====

  ASIdentifierManagerClass = interface(NSObjectClass)
    ['{7FDE511A-AD7C-4218-A85C-AA4A3B45913B}']
    { class } function sharedManager: ASIdentifierManager; cdecl;
  end;

  ASIdentifierManager = interface(NSObject)
    ['{DF6B7B58-B8A4-4672-9552-C61786F0DAAE}']
    function advertisingIdentifier: NSUUID; cdecl;
    function isAdvertisingTrackingEnabled: Boolean; cdecl;
  end;

  TASIdentifierManager = class(TOCGenericImport<ASIdentifierManagerClass,
    ASIdentifierManager>)
  end;

  PASIdentifierManager = Pointer;

  // ===== External functions =====

const
  libAdSupport = '/System/Library/Frameworks/AdSupport.framework/AdSupport';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AdSupportModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

AdSupportModule := dlopen(MarshaledAString(libAdSupport), RTLD_LAZY);

finalization

dlclose(AdSupportModule);
{$ENDIF IOS}

end.
