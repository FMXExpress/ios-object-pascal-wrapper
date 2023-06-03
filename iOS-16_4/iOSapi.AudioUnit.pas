{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework AudioUnit
//

unit iOSapi.AudioUnit;

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
  iOSapi.UIKit;

// ===== External functions =====

const
  libAudioUnit = '/System/Library/Frameworks/AudioUnit.framework/AudioUnit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AudioUnitModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

AudioUnitModule := dlopen(MarshaledAString(libAudioUnit), RTLD_LAZY);

finalization

dlclose(AudioUnitModule);
{$ENDIF IOS}

end.
