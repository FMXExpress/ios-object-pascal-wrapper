{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework MobileCoreServices
//

unit iOSapi.MobileCoreServices;

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

// ===== External functions =====

const
  libMobileCoreServices =
    '/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  MobileCoreServicesModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MobileCoreServicesModule := dlopen(MarshaledAString(libMobileCoreServices),
  RTLD_LAZY);

finalization

dlclose(MobileCoreServicesModule);
{$ENDIF IOS}

end.
