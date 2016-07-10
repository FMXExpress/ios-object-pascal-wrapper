{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework OpenAL
//

unit iOSapi.OpenAL;

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
  // ===== Framework typedefs =====
{$M+}
  ALboolean = Byte;
  PALboolean = ^ALboolean;

  ALchar = Byte;
  PALchar = ^ALchar;

  ALbyte = Byte;
  PALbyte = ^ALbyte;

  ALubyte = Byte;
  PALubyte = ^ALubyte;

  ALshort = SmallInt;
  PALshort = ^ALshort;

  ALushort = Word;
  PALushort = ^ALushort;

  ALint = Integer;
  PALint = ^ALint;

  ALuint = Cardinal;
  PALuint = ^ALuint;

  ALsizei = Integer;
  PALsizei = ^ALsizei;

  ALenum = Integer;
  PALenum = ^ALenum;

  ALfloat = Single;
  PALfloat = ^ALfloat;

  ALdouble = Double;
  PALdouble = ^ALdouble;

  ALvoid = Pointer;
  PALvoid = ^ALvoid;

  LPALENABLE = procedure(param1: ALenum); cdecl;
  LPALDISABLE = procedure(param1: ALenum); cdecl;
  LPALISENABLED = function(param1: ALenum): ALboolean; cdecl;
  LPALGETSTRING = function(param1: ALenum): MarshaledAString; cdecl;
  LPALGETBOOLEANV = procedure(param1: ALenum; param2: MarshaledAString); cdecl;
  LPALGETINTEGERV = procedure(param1: ALenum; param2: PInteger); cdecl;
  LPALGETFLOATV = procedure(param1: ALenum; param2: PSingle); cdecl;
  LPALGETDOUBLEV = procedure(param1: ALenum; param2: PDouble); cdecl;
  LPALGETBOOLEAN = function(param1: ALenum): ALboolean; cdecl;
  LPALGETINTEGER = function(param1: ALenum): ALint; cdecl;
  LPALGETFLOAT = function(param1: ALenum): ALfloat; cdecl;
  LPALGETDOUBLE = function(param1: ALenum): ALdouble; cdecl;
  LPALGETERROR = function(): ALenum; cdecl;
  LPALISEXTENSIONPRESENT = function(param1: MarshaledAString): ALboolean; cdecl;
  LPALGETPROCADDRESS = function(param1: MarshaledAString): Pointer; cdecl;
  LPALGETENUMVALUE = function(param1: MarshaledAString): ALenum; cdecl;
  LPALLISTENERF = procedure(param1: ALenum; param2: ALfloat); cdecl;
  LPALLISTENER3F = procedure(param1: ALenum; param2: ALfloat; param3: ALfloat;
    param4: ALfloat); cdecl;
  LPALLISTENERFV = procedure(param1: ALenum; param2: PSingle); cdecl;
  LPALLISTENERI = procedure(param1: ALenum; param2: ALint); cdecl;
  LPALLISTENER3I = procedure(param1: ALenum; param2: ALint; param3: ALint;
    param4: ALint); cdecl;
  LPALLISTENERIV = procedure(param1: ALenum; param2: PInteger); cdecl;
  LPALGETLISTENERF = procedure(param1: ALenum; param2: PSingle); cdecl;
  LPALGETLISTENER3F = procedure(param1: ALenum; param2: PSingle;
    param3: PSingle; param4: PSingle); cdecl;
  LPALGETLISTENERFV = procedure(param1: ALenum; param2: PSingle); cdecl;
  LPALGETLISTENERI = procedure(param1: ALenum; param2: PInteger); cdecl;
  LPALGETLISTENER3I = procedure(param1: ALenum; param2: PInteger;
    param3: PInteger; param4: PInteger); cdecl;
  LPALGETLISTENERIV = procedure(param1: ALenum; param2: PInteger); cdecl;
  LPALGENSOURCES = procedure(param1: ALsizei; param2: PCardinal); cdecl;
  LPALDELETESOURCES = procedure(param1: ALsizei; param2: PCardinal); cdecl;
  LPALISSOURCE = function(param1: ALuint): ALboolean; cdecl;
  LPALSOURCEF = procedure(param1: ALuint; param2: ALenum;
    param3: ALfloat); cdecl;
  LPALSOURCE3F = procedure(param1: ALuint; param2: ALenum; param3: ALfloat;
    param4: ALfloat; param5: ALfloat); cdecl;
  LPALSOURCEFV = procedure(param1: ALuint; param2: ALenum;
    param3: PSingle); cdecl;
  LPALSOURCEI = procedure(param1: ALuint; param2: ALenum; param3: ALint); cdecl;
  LPALSOURCE3I = procedure(param1: ALuint; param2: ALenum; param3: ALint;
    param4: ALint; param5: ALint); cdecl;
  LPALSOURCEIV = procedure(param1: ALuint; param2: ALenum;
    param3: PInteger); cdecl;
  LPALGETSOURCEF = procedure(param1: ALuint; param2: ALenum;
    param3: PSingle); cdecl;
  LPALGETSOURCE3F = procedure(param1: ALuint; param2: ALenum; param3: PSingle;
    param4: PSingle; param5: PSingle); cdecl;
  LPALGETSOURCEFV = procedure(param1: ALuint; param2: ALenum;
    param3: PSingle); cdecl;
  LPALGETSOURCEI = procedure(param1: ALuint; param2: ALenum;
    param3: PInteger); cdecl;
  LPALGETSOURCE3I = procedure(param1: ALuint; param2: ALenum; param3: PInteger;
    param4: PInteger; param5: PInteger); cdecl;
  LPALGETSOURCEIV = procedure(param1: ALuint; param2: ALenum;
    param3: PInteger); cdecl;
  LPALSOURCEPLAYV = procedure(param1: ALsizei; param2: PCardinal); cdecl;
  LPALSOURCESTOPV = procedure(param1: ALsizei; param2: PCardinal); cdecl;
  LPALSOURCEREWINDV = procedure(param1: ALsizei; param2: PCardinal); cdecl;
  LPALSOURCEPAUSEV = procedure(param1: ALsizei; param2: PCardinal); cdecl;
  LPALSOURCEPLAY = procedure(param1: ALuint); cdecl;
  LPALSOURCESTOP = procedure(param1: ALuint); cdecl;
  LPALSOURCEREWIND = procedure(param1: ALuint); cdecl;
  LPALSOURCEPAUSE = procedure(param1: ALuint); cdecl;
  LPALSOURCEQUEUEBUFFERS = procedure(param1: ALuint; param2: ALsizei;
    param3: PCardinal); cdecl;
  LPALSOURCEUNQUEUEBUFFERS = procedure(param1: ALuint; param2: ALsizei;
    param3: PCardinal); cdecl;
  LPALGENBUFFERS = procedure(param1: ALsizei; param2: PCardinal); cdecl;
  LPALDELETEBUFFERS = procedure(param1: ALsizei; param2: PCardinal); cdecl;
  LPALISBUFFER = function(param1: ALuint): ALboolean; cdecl;
  LPALBUFFERDATA = procedure(param1: ALuint; param2: ALenum; param3: Pointer;
    param4: ALsizei; param5: ALsizei); cdecl;
  LPALBUFFERF = procedure(param1: ALuint; param2: ALenum;
    param3: ALfloat); cdecl;
  LPALBUFFER3F = procedure(param1: ALuint; param2: ALenum; param3: ALfloat;
    param4: ALfloat; param5: ALfloat); cdecl;
  LPALBUFFERFV = procedure(param1: ALuint; param2: ALenum;
    param3: PSingle); cdecl;
  LPALBUFFERI = procedure(param1: ALuint; param2: ALenum; param3: ALint); cdecl;
  LPALBUFFER3I = procedure(param1: ALuint; param2: ALenum; param3: ALint;
    param4: ALint; param5: ALint); cdecl;
  LPALBUFFERIV = procedure(param1: ALuint; param2: ALenum;
    param3: PInteger); cdecl;
  LPALGETBUFFERF = procedure(param1: ALuint; param2: ALenum;
    param3: PSingle); cdecl;
  LPALGETBUFFER3F = procedure(param1: ALuint; param2: ALenum; param3: PSingle;
    param4: PSingle; param5: PSingle); cdecl;
  LPALGETBUFFERFV = procedure(param1: ALuint; param2: ALenum;
    param3: PSingle); cdecl;
  LPALGETBUFFERI = procedure(param1: ALuint; param2: ALenum;
    param3: PInteger); cdecl;
  LPALGETBUFFER3I = procedure(param1: ALuint; param2: ALenum; param3: PInteger;
    param4: PInteger; param5: PInteger); cdecl;
  LPALGETBUFFERIV = procedure(param1: ALuint; param2: ALenum;
    param3: PInteger); cdecl;
  LPALDOPPLERFACTOR = procedure(param1: ALfloat); cdecl;
  LPALDOPPLERVELOCITY = procedure(param1: ALfloat); cdecl;
  LPALSPEEDOFSOUND = procedure(param1: ALfloat); cdecl;
  LPALDISTANCEMODEL = procedure(param1: ALenum); cdecl;

  ALCdevice_struct = record
  end;

  PALCdevice_struct = ^ALCdevice_struct;
  ALCdevice = ALCdevice_struct;

  ALCcontext_struct = record
  end;

  PALCcontext_struct = ^ALCcontext_struct;
  ALCcontext = ALCcontext_struct;

  ALCboolean = Byte;
  PALCboolean = ^ALCboolean;

  ALCchar = Byte;
  PALCchar = ^ALCchar;

  ALCbyte = Byte;
  PALCbyte = ^ALCbyte;

  ALCubyte = Byte;
  PALCubyte = ^ALCubyte;

  ALCshort = SmallInt;
  PALCshort = ^ALCshort;

  ALCushort = Word;
  PALCushort = ^ALCushort;

  ALCint = Integer;
  PALCint = ^ALCint;

  ALCuint = Cardinal;
  PALCuint = ^ALCuint;

  ALCsizei = Integer;
  PALCsizei = ^ALCsizei;

  ALCenum = Integer;
  PALCenum = ^ALCenum;

  ALCfloat = Single;
  PALCfloat = ^ALCfloat;

  ALCdouble = Double;
  PALCdouble = ^ALCdouble;

  ALCvoid = Pointer;
  PALCvoid = ^ALCvoid;

  LPALCCREATECONTEXT = function(param1: Pointer; param2: PInteger)
    : Pointer; cdecl;
  LPALCMAKECONTEXTCURRENT = function(param1: Pointer): ALCboolean; cdecl;
  LPALCPROCESSCONTEXT = procedure(param1: Pointer); cdecl;
  LPALCSUSPENDCONTEXT = procedure(param1: Pointer); cdecl;
  LPALCDESTROYCONTEXT = procedure(param1: Pointer); cdecl;
  LPALCGETCURRENTCONTEXT = function(): Pointer; cdecl;
  LPALCGETCONTEXTSDEVICE = function(param1: Pointer): Pointer; cdecl;
  LPALCOPENDEVICE = function(param1: MarshaledAString): Pointer; cdecl;
  LPALCCLOSEDEVICE = function(param1: Pointer): ALCboolean; cdecl;
  LPALCGETERROR = function(param1: Pointer): ALCenum; cdecl;
  LPALCISEXTENSIONPRESENT = function(param1: Pointer; param2: MarshaledAString)
    : ALCboolean; cdecl;
  LPALCGETPROCADDRESS = function(param1: Pointer; param2: MarshaledAString)
    : Pointer; cdecl;
  LPALCGETENUMVALUE = function(param1: Pointer; param2: MarshaledAString)
    : ALCenum; cdecl;
  LPALCGETSTRING = function(param1: Pointer; param2: ALCenum)
    : MarshaledAString; cdecl;
  LPALCGETINTEGERV = procedure(param1: Pointer; param2: ALCenum;
    param3: ALCsizei; param4: PInteger); cdecl;
  LPALCCAPTUREOPENDEVICE = function(param1: MarshaledAString; param2: ALCuint;
    param3: ALCenum; param4: ALCsizei): Pointer; cdecl;
  LPALCCAPTURECLOSEDEVICE = function(param1: Pointer): ALCboolean; cdecl;
  LPALCCAPTURESTART = procedure(param1: Pointer); cdecl;
  LPALCCAPTURESTOP = procedure(param1: Pointer); cdecl;
  LPALCCAPTURESAMPLES = procedure(param1: Pointer; param2: Pointer;
    param3: ALCsizei); cdecl;
  alBufferDataStaticProcPtr = procedure(param1: ALint; param2: ALenum;
    param3: Pointer; param4: ALsizei; param5: ALsizei); cdecl;
  alcMacOSXRenderingQualityProcPtr = procedure(param1: ALint); cdecl;
  alMacOSXRenderChannelCountProcPtr = procedure(param1: ALint); cdecl;
  alcMacOSXMixerMaxiumumBussesProcPtr = procedure(param1: ALint); cdecl;
  alcMacOSXMixerOutputRateProcPtr = procedure(param1: ALdouble); cdecl;
  alcMacOSXGetRenderingQualityProcPtr = function(): ALint; cdecl;
  alMacOSXGetRenderChannelCountProcPtr = function(): ALint; cdecl;
  alcMacOSXGetMixerMaxiumumBussesProcPtr = function(): ALint; cdecl;
  alcMacOSXGetMixerOutputRateProcPtr = function(): ALdouble; cdecl;
  alSourceRenderingQualityProcPtr = procedure(param1: ALuint;
    param2: ALint); cdecl;
  alSourceGetRenderingQualityProcPtr = function(param1: ALuint): ALint; cdecl;
  alSourceNotificationProc = procedure(param1: ALuint; param2: ALuint;
    param3: Pointer); cdecl;
  alSourceAddNotificationProcPtr = function(param1: ALuint; param2: ALuint;
    param3: alSourceNotificationProc; param4: Pointer): ALenum; cdecl;
  alSourceRemoveNotificationProcPtr = procedure(param1: ALuint; param2: ALuint;
    param3: alSourceNotificationProc; param4: Pointer); cdecl;
  alcASAGetSourceProcPtr = function(param1: ALuint; param2: ALuint;
    param3: Pointer; param4: PCardinal): ALenum; cdecl;
  alcASASetSourceProcPtr = function(param1: ALuint; param2: ALuint;
    param3: Pointer; param4: ALuint): ALenum; cdecl;
  alcASAGetListenerProcPtr = function(param1: ALuint; param2: Pointer;
    param3: PCardinal): ALenum; cdecl;
  alcASASetListenerProcPtr = function(param1: ALuint; param2: Pointer;
    param3: ALuint): ALenum; cdecl;
  alcOutputCapturerPrepareProcPtr = procedure(param1: ALCuint; param2: ALCenum;
    param3: ALCsizei); cdecl;
  alcOutputCapturerStartProcPtr = procedure(); cdecl;
  alcOutputCapturerStopProcPtr = procedure(); cdecl;
  alcOutputCapturerAvailableSamplesProcPtr = function(): ALint; cdecl;
  alcOutputCapturerSamplesProcPtr = procedure(param1: Pointer;
    param2: ALCsizei); cdecl;
  // ===== External functions =====

const
  libOpenAL = '/System/Library/Frameworks/OpenAL.framework/OpenAL';
procedure alEnable(capability: ALenum); cdecl;
  external libOpenAL name _PU + 'alEnable';
procedure alDisable(capability: ALenum); cdecl;
  external libOpenAL name _PU + 'alDisable';
function alIsEnabled(capability: ALenum): ALboolean; cdecl;
  external libOpenAL name _PU + 'alIsEnabled';
function alGetString(param: ALenum): MarshaledAString; cdecl;
  external libOpenAL name _PU + 'alGetString';
procedure alGetBooleanv(param: ALenum; data: MarshaledAString); cdecl;
  external libOpenAL name _PU + 'alGetBooleanv';
procedure alGetIntegerv(param: ALenum; data: PInteger); cdecl;
  external libOpenAL name _PU + 'alGetIntegerv';
procedure alGetFloatv(param: ALenum; data: PSingle); cdecl;
  external libOpenAL name _PU + 'alGetFloatv';
procedure alGetDoublev(param: ALenum; data: PDouble); cdecl;
  external libOpenAL name _PU + 'alGetDoublev';
function alGetBoolean(param: ALenum): ALboolean; cdecl;
  external libOpenAL name _PU + 'alGetBoolean';
function alGetInteger(param: ALenum): ALint; cdecl;
  external libOpenAL name _PU + 'alGetInteger';
function alGetFloat(param: ALenum): ALfloat; cdecl;
  external libOpenAL name _PU + 'alGetFloat';
function alGetDouble(param: ALenum): ALdouble; cdecl;
  external libOpenAL name _PU + 'alGetDouble';
function alGetError: ALenum; cdecl; external libOpenAL name _PU + 'alGetError';
function alIsExtensionPresent(extname: MarshaledAString): ALboolean; cdecl;
  external libOpenAL name _PU + 'alIsExtensionPresent';
function alGetProcAddress(fname: MarshaledAString): Pointer; cdecl;
  external libOpenAL name _PU + 'alGetProcAddress';
function alGetEnumValue(ename: MarshaledAString): ALenum; cdecl;
  external libOpenAL name _PU + 'alGetEnumValue';
procedure alListenerf(param: ALenum; value: ALfloat); cdecl;
  external libOpenAL name _PU + 'alListenerf';
procedure alListener3f(param: ALenum; value1: ALfloat; value2: ALfloat;
  value3: ALfloat); cdecl; external libOpenAL name _PU + 'alListener3f';
procedure alListenerfv(param: ALenum; values: PSingle); cdecl;
  external libOpenAL name _PU + 'alListenerfv';
procedure alListeneri(param: ALenum; value: ALint); cdecl;
  external libOpenAL name _PU + 'alListeneri';
procedure alListener3i(param: ALenum; value1: ALint; value2: ALint;
  value3: ALint); cdecl; external libOpenAL name _PU + 'alListener3i';
procedure alListeneriv(param: ALenum; values: PInteger); cdecl;
  external libOpenAL name _PU + 'alListeneriv';
procedure alGetListenerf(param: ALenum; value: PSingle); cdecl;
  external libOpenAL name _PU + 'alGetListenerf';
procedure alGetListener3f(param: ALenum; value1: PSingle; value2: PSingle;
  value3: PSingle); cdecl; external libOpenAL name _PU + 'alGetListener3f';
procedure alGetListenerfv(param: ALenum; values: PSingle); cdecl;
  external libOpenAL name _PU + 'alGetListenerfv';
procedure alGetListeneri(param: ALenum; value: PInteger); cdecl;
  external libOpenAL name _PU + 'alGetListeneri';
procedure alGetListener3i(param: ALenum; value1: PInteger; value2: PInteger;
  value3: PInteger); cdecl; external libOpenAL name _PU + 'alGetListener3i';
procedure alGetListeneriv(param: ALenum; values: PInteger); cdecl;
  external libOpenAL name _PU + 'alGetListeneriv';
procedure alGenSources(n: ALsizei; sources: PCardinal); cdecl;
  external libOpenAL name _PU + 'alGenSources';
procedure alDeleteSources(n: ALsizei; sources: PCardinal); cdecl;
  external libOpenAL name _PU + 'alDeleteSources';
function alIsSource(sid: ALuint): ALboolean; cdecl;
  external libOpenAL name _PU + 'alIsSource';
procedure alSourcef(sid: ALuint; param: ALenum; value: ALfloat); cdecl;
  external libOpenAL name _PU + 'alSourcef';
procedure alSource3f(sid: ALuint; param: ALenum; value1: ALfloat;
  value2: ALfloat; value3: ALfloat); cdecl;
  external libOpenAL name _PU + 'alSource3f';
procedure alSourcefv(sid: ALuint; param: ALenum; values: PSingle); cdecl;
  external libOpenAL name _PU + 'alSourcefv';
procedure alSourcei(sid: ALuint; param: ALenum; value: ALint); cdecl;
  external libOpenAL name _PU + 'alSourcei';
procedure alSource3i(sid: ALuint; param: ALenum; value1: ALint; value2: ALint;
  value3: ALint); cdecl; external libOpenAL name _PU + 'alSource3i';
procedure alSourceiv(sid: ALuint; param: ALenum; values: PInteger); cdecl;
  external libOpenAL name _PU + 'alSourceiv';
procedure alGetSourcef(sid: ALuint; param: ALenum; value: PSingle); cdecl;
  external libOpenAL name _PU + 'alGetSourcef';
procedure alGetSource3f(sid: ALuint; param: ALenum; value1: PSingle;
  value2: PSingle; value3: PSingle); cdecl;
  external libOpenAL name _PU + 'alGetSource3f';
procedure alGetSourcefv(sid: ALuint; param: ALenum; values: PSingle); cdecl;
  external libOpenAL name _PU + 'alGetSourcefv';
procedure alGetSourcei(sid: ALuint; param: ALenum; value: PInteger); cdecl;
  external libOpenAL name _PU + 'alGetSourcei';
procedure alGetSource3i(sid: ALuint; param: ALenum; value1: PInteger;
  value2: PInteger; value3: PInteger); cdecl;
  external libOpenAL name _PU + 'alGetSource3i';
procedure alGetSourceiv(sid: ALuint; param: ALenum; values: PInteger); cdecl;
  external libOpenAL name _PU + 'alGetSourceiv';
procedure alSourcePlayv(ns: ALsizei; sids: PCardinal); cdecl;
  external libOpenAL name _PU + 'alSourcePlayv';
procedure alSourceStopv(ns: ALsizei; sids: PCardinal); cdecl;
  external libOpenAL name _PU + 'alSourceStopv';
procedure alSourceRewindv(ns: ALsizei; sids: PCardinal); cdecl;
  external libOpenAL name _PU + 'alSourceRewindv';
procedure alSourcePausev(ns: ALsizei; sids: PCardinal); cdecl;
  external libOpenAL name _PU + 'alSourcePausev';
procedure alSourcePlay(sid: ALuint); cdecl;
  external libOpenAL name _PU + 'alSourcePlay';
procedure alSourceStop(sid: ALuint); cdecl;
  external libOpenAL name _PU + 'alSourceStop';
procedure alSourceRewind(sid: ALuint); cdecl;
  external libOpenAL name _PU + 'alSourceRewind';
procedure alSourcePause(sid: ALuint); cdecl;
  external libOpenAL name _PU + 'alSourcePause';
procedure alSourceQueueBuffers(sid: ALuint; numEntries: ALsizei;
  bids: PCardinal); cdecl; external libOpenAL name _PU + 'alSourceQueueBuffers';
procedure alSourceUnqueueBuffers(sid: ALuint; numEntries: ALsizei;
  bids: PCardinal); cdecl;
  external libOpenAL name _PU + 'alSourceUnqueueBuffers';
procedure alGenBuffers(n: ALsizei; buffers: PCardinal); cdecl;
  external libOpenAL name _PU + 'alGenBuffers';
procedure alDeleteBuffers(n: ALsizei; buffers: PCardinal); cdecl;
  external libOpenAL name _PU + 'alDeleteBuffers';
function alIsBuffer(bid: ALuint): ALboolean; cdecl;
  external libOpenAL name _PU + 'alIsBuffer';
procedure alBufferData(bid: ALuint; format: ALenum; data: Pointer;
  size: ALsizei; freq: ALsizei); cdecl;
  external libOpenAL name _PU + 'alBufferData';
procedure alBufferf(bid: ALuint; param: ALenum; value: ALfloat); cdecl;
  external libOpenAL name _PU + 'alBufferf';
procedure alBuffer3f(bid: ALuint; param: ALenum; value1: ALfloat;
  value2: ALfloat; value3: ALfloat); cdecl;
  external libOpenAL name _PU + 'alBuffer3f';
procedure alBufferfv(bid: ALuint; param: ALenum; values: PSingle); cdecl;
  external libOpenAL name _PU + 'alBufferfv';
procedure alBufferi(bid: ALuint; param: ALenum; value: ALint); cdecl;
  external libOpenAL name _PU + 'alBufferi';
procedure alBuffer3i(bid: ALuint; param: ALenum; value1: ALint; value2: ALint;
  value3: ALint); cdecl; external libOpenAL name _PU + 'alBuffer3i';
procedure alBufferiv(bid: ALuint; param: ALenum; values: PInteger); cdecl;
  external libOpenAL name _PU + 'alBufferiv';
procedure alGetBufferf(bid: ALuint; param: ALenum; value: PSingle); cdecl;
  external libOpenAL name _PU + 'alGetBufferf';
procedure alGetBuffer3f(bid: ALuint; param: ALenum; value1: PSingle;
  value2: PSingle; value3: PSingle); cdecl;
  external libOpenAL name _PU + 'alGetBuffer3f';
procedure alGetBufferfv(bid: ALuint; param: ALenum; values: PSingle); cdecl;
  external libOpenAL name _PU + 'alGetBufferfv';
procedure alGetBufferi(bid: ALuint; param: ALenum; value: PInteger); cdecl;
  external libOpenAL name _PU + 'alGetBufferi';
procedure alGetBuffer3i(bid: ALuint; param: ALenum; value1: PInteger;
  value2: PInteger; value3: PInteger); cdecl;
  external libOpenAL name _PU + 'alGetBuffer3i';
procedure alGetBufferiv(bid: ALuint; param: ALenum; values: PInteger); cdecl;
  external libOpenAL name _PU + 'alGetBufferiv';
procedure alDopplerFactor(value: ALfloat); cdecl;
  external libOpenAL name _PU + 'alDopplerFactor';
procedure alDopplerVelocity(value: ALfloat); cdecl;
  external libOpenAL name _PU + 'alDopplerVelocity';
procedure alSpeedOfSound(value: ALfloat); cdecl;
  external libOpenAL name _PU + 'alSpeedOfSound';
procedure alDistanceModel(distanceModel: ALenum); cdecl;
  external libOpenAL name _PU + 'alDistanceModel';
function alcCreateContext(device: Pointer; attrlist: PInteger): Pointer; cdecl;
  external libOpenAL name _PU + 'alcCreateContext';
function alcMakeContextCurrent(context: Pointer): ALCboolean; cdecl;
  external libOpenAL name _PU + 'alcMakeContextCurrent';
procedure alcProcessContext(context: Pointer); cdecl;
  external libOpenAL name _PU + 'alcProcessContext';
procedure alcSuspendContext(context: Pointer); cdecl;
  external libOpenAL name _PU + 'alcSuspendContext';
procedure alcDestroyContext(context: Pointer); cdecl;
  external libOpenAL name _PU + 'alcDestroyContext';
function alcGetCurrentContext: Pointer; cdecl;
  external libOpenAL name _PU + 'alcGetCurrentContext';
function alcGetContextsDevice(context: Pointer): Pointer; cdecl;
  external libOpenAL name _PU + 'alcGetContextsDevice';
function alcOpenDevice(devicename: MarshaledAString): Pointer; cdecl;
  external libOpenAL name _PU + 'alcOpenDevice';
function alcCloseDevice(device: Pointer): ALCboolean; cdecl;
  external libOpenAL name _PU + 'alcCloseDevice';
function alcGetError(device: Pointer): ALCenum; cdecl;
  external libOpenAL name _PU + 'alcGetError';
function alcIsExtensionPresent(device: Pointer; extname: MarshaledAString)
  : ALCboolean; cdecl; external libOpenAL name _PU + 'alcIsExtensionPresent';
function alcGetProcAddress(device: Pointer; funcname: MarshaledAString)
  : Pointer; cdecl; external libOpenAL name _PU + 'alcGetProcAddress';
function alcGetEnumValue(device: Pointer; enumname: MarshaledAString): ALCenum;
  cdecl; external libOpenAL name _PU + 'alcGetEnumValue';
function alcGetString(device: Pointer; param: ALCenum): MarshaledAString; cdecl;
  external libOpenAL name _PU + 'alcGetString';
procedure alcGetIntegerv(device: Pointer; param: ALCenum; size: ALCsizei;
  data: PInteger); cdecl; external libOpenAL name _PU + 'alcGetIntegerv';
function alcCaptureOpenDevice(devicename: MarshaledAString; frequency: ALCuint;
  format: ALCenum; buffersize: ALCsizei): Pointer; cdecl;
  external libOpenAL name _PU + 'alcCaptureOpenDevice';
function alcCaptureCloseDevice(device: Pointer): ALCboolean; cdecl;
  external libOpenAL name _PU + 'alcCaptureCloseDevice';
procedure alcCaptureStart(device: Pointer); cdecl;
  external libOpenAL name _PU + 'alcCaptureStart';
procedure alcCaptureStop(device: Pointer); cdecl;
  external libOpenAL name _PU + 'alcCaptureStop';
procedure alcCaptureSamples(device: Pointer; buffer: Pointer;
  samples: ALCsizei); cdecl; external libOpenAL name _PU + 'alcCaptureSamples';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  OpenALModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

OpenALModule := dlopen(MarshaledAString(libOpenAL), RTLD_LAZY);

finalization

dlclose(OpenALModule);
{$ENDIF IOS}

end.
