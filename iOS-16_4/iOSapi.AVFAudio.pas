{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework AVFAudio
//

unit iOSapi.AVFAudio;

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
  libAVFAudio = '/System/Library/Frameworks/AVFAudio.framework/AVFAudio';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AVFAudioModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

AVFAudioModule := dlopen(MarshaledAString(libAVFAudio), RTLD_LAZY);

finalization

dlclose(AVFAudioModule);
{$ENDIF IOS}

end.
