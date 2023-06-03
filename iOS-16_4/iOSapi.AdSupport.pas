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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

type

  // ===== Forward declarations =====
{$M+}
  ASIdentifierManager = interface;

  // ===== Interface declarations =====

  ASIdentifierManagerClass = interface(NSObjectClass)
    ['{04B5015E-27EC-4314-9847-3E4F54B2A98C}']
    { class } function sharedManager: ASIdentifierManager; cdecl;
  end;

  ASIdentifierManager = interface(NSObject)
    ['{D547E829-78D3-4E7E-A49C-C941814158D7}']
    function advertisingIdentifier: NSUUID; cdecl;
    function isAdvertisingTrackingEnabled: Boolean; cdecl;
    procedure clearAdvertisingIdentifier; cdecl;
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
