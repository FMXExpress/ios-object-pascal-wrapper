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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
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
  PLPALENABLE = ^LPALENABLE;
  LPALDISABLE = procedure(param1: ALenum); cdecl;
  PLPALDISABLE = ^LPALDISABLE;
  LPALISENABLED = function(param1: ALenum): ALboolean; cdecl;
  PLPALISENABLED = ^LPALISENABLED;
  LPALGETSTRING = function(param1: ALenum): PALchar; cdecl;
  PLPALGETSTRING = ^LPALGETSTRING;
  LPALGETBOOLEANV = procedure(param1: ALenum; param2: PALboolean); cdecl;
  PLPALGETBOOLEANV = ^LPALGETBOOLEANV;
  LPALGETINTEGERV = procedure(param1: ALenum; param2: PALint); cdecl;
  PLPALGETINTEGERV = ^LPALGETINTEGERV;
  LPALGETFLOATV = procedure(param1: ALenum; param2: PALfloat); cdecl;
  PLPALGETFLOATV = ^LPALGETFLOATV;
  LPALGETDOUBLEV = procedure(param1: ALenum; param2: PALdouble); cdecl;
  PLPALGETDOUBLEV = ^LPALGETDOUBLEV;
  LPALGETBOOLEAN = function(param1: ALenum): ALboolean; cdecl;
  PLPALGETBOOLEAN = ^LPALGETBOOLEAN;
  LPALGETINTEGER = function(param1: ALenum): ALint; cdecl;
  PLPALGETINTEGER = ^LPALGETINTEGER;
  LPALGETFLOAT = function(param1: ALenum): ALfloat; cdecl;
  PLPALGETFLOAT = ^LPALGETFLOAT;
  LPALGETDOUBLE = function(param1: ALenum): ALdouble; cdecl;
  PLPALGETDOUBLE = ^LPALGETDOUBLE;
  LPALGETERROR = function(): ALenum; cdecl;
  PLPALGETERROR = ^LPALGETERROR;
  LPALISEXTENSIONPRESENT = function(param1: PALchar): ALboolean; cdecl;
  PLPALISEXTENSIONPRESENT = ^LPALISEXTENSIONPRESENT;
  LPALGETPROCADDRESS = function(param1: PALchar): Pointer; cdecl;
  PLPALGETPROCADDRESS = ^LPALGETPROCADDRESS;
  LPALGETENUMVALUE = function(param1: PALchar): ALenum; cdecl;
  PLPALGETENUMVALUE = ^LPALGETENUMVALUE;
  LPALLISTENERF = procedure(param1: ALenum; param2: ALfloat); cdecl;
  PLPALLISTENERF = ^LPALLISTENERF;
  LPALLISTENER3F = procedure(param1: ALenum; param2: ALfloat; param3: ALfloat;
    param4: ALfloat); cdecl;
  PLPALLISTENER3F = ^LPALLISTENER3F;
  LPALLISTENERFV = procedure(param1: ALenum; param2: PALfloat); cdecl;
  PLPALLISTENERFV = ^LPALLISTENERFV;
  LPALLISTENERI = procedure(param1: ALenum; param2: ALint); cdecl;
  PLPALLISTENERI = ^LPALLISTENERI;
  LPALLISTENER3I = procedure(param1: ALenum; param2: ALint; param3: ALint;
    param4: ALint); cdecl;
  PLPALLISTENER3I = ^LPALLISTENER3I;
  LPALLISTENERIV = procedure(param1: ALenum; param2: PALint); cdecl;
  PLPALLISTENERIV = ^LPALLISTENERIV;
  LPALGETLISTENERF = procedure(param1: ALenum; param2: PALfloat); cdecl;
  PLPALGETLISTENERF = ^LPALGETLISTENERF;
  LPALGETLISTENER3F = procedure(param1: ALenum; param2: PALfloat;
    param3: PALfloat; param4: PALfloat); cdecl;
  PLPALGETLISTENER3F = ^LPALGETLISTENER3F;
  LPALGETLISTENERFV = procedure(param1: ALenum; param2: PALfloat); cdecl;
  PLPALGETLISTENERFV = ^LPALGETLISTENERFV;
  LPALGETLISTENERI = procedure(param1: ALenum; param2: PALint); cdecl;
  PLPALGETLISTENERI = ^LPALGETLISTENERI;
  LPALGETLISTENER3I = procedure(param1: ALenum; param2: PALint; param3: PALint;
    param4: PALint); cdecl;
  PLPALGETLISTENER3I = ^LPALGETLISTENER3I;
  LPALGETLISTENERIV = procedure(param1: ALenum; param2: PALint); cdecl;
  PLPALGETLISTENERIV = ^LPALGETLISTENERIV;
  LPALGENSOURCES = procedure(param1: ALsizei; param2: PALuint); cdecl;
  PLPALGENSOURCES = ^LPALGENSOURCES;
  LPALDELETESOURCES = procedure(param1: ALsizei; param2: PALuint); cdecl;
  PLPALDELETESOURCES = ^LPALDELETESOURCES;
  LPALISSOURCE = function(param1: ALuint): ALboolean; cdecl;
  PLPALISSOURCE = ^LPALISSOURCE;
  LPALSOURCEF = procedure(param1: ALuint; param2: ALenum;
    param3: ALfloat); cdecl;
  PLPALSOURCEF = ^LPALSOURCEF;
  LPALSOURCE3F = procedure(param1: ALuint; param2: ALenum; param3: ALfloat;
    param4: ALfloat; param5: ALfloat); cdecl;
  PLPALSOURCE3F = ^LPALSOURCE3F;
  LPALSOURCEFV = procedure(param1: ALuint; param2: ALenum;
    param3: PALfloat); cdecl;
  PLPALSOURCEFV = ^LPALSOURCEFV;
  LPALSOURCEI = procedure(param1: ALuint; param2: ALenum; param3: ALint); cdecl;
  PLPALSOURCEI = ^LPALSOURCEI;
  LPALSOURCE3I = procedure(param1: ALuint; param2: ALenum; param3: ALint;
    param4: ALint; param5: ALint); cdecl;
  PLPALSOURCE3I = ^LPALSOURCE3I;
  LPALSOURCEIV = procedure(param1: ALuint; param2: ALenum;
    param3: PALint); cdecl;
  PLPALSOURCEIV = ^LPALSOURCEIV;
  LPALGETSOURCEF = procedure(param1: ALuint; param2: ALenum;
    param3: PALfloat); cdecl;
  PLPALGETSOURCEF = ^LPALGETSOURCEF;
  LPALGETSOURCE3F = procedure(param1: ALuint; param2: ALenum; param3: PALfloat;
    param4: PALfloat; param5: PALfloat); cdecl;
  PLPALGETSOURCE3F = ^LPALGETSOURCE3F;
  LPALGETSOURCEFV = procedure(param1: ALuint; param2: ALenum;
    param3: PALfloat); cdecl;
  PLPALGETSOURCEFV = ^LPALGETSOURCEFV;
  LPALGETSOURCEI = procedure(param1: ALuint; param2: ALenum;
    param3: PALint); cdecl;
  PLPALGETSOURCEI = ^LPALGETSOURCEI;
  LPALGETSOURCE3I = procedure(param1: ALuint; param2: ALenum; param3: PALint;
    param4: PALint; param5: PALint); cdecl;
  PLPALGETSOURCE3I = ^LPALGETSOURCE3I;
  LPALGETSOURCEIV = procedure(param1: ALuint; param2: ALenum;
    param3: PALint); cdecl;
  PLPALGETSOURCEIV = ^LPALGETSOURCEIV;
  LPALSOURCEPLAYV = procedure(param1: ALsizei; param2: PALuint); cdecl;
  PLPALSOURCEPLAYV = ^LPALSOURCEPLAYV;
  LPALSOURCESTOPV = procedure(param1: ALsizei; param2: PALuint); cdecl;
  PLPALSOURCESTOPV = ^LPALSOURCESTOPV;
  LPALSOURCEREWINDV = procedure(param1: ALsizei; param2: PALuint); cdecl;
  PLPALSOURCEREWINDV = ^LPALSOURCEREWINDV;
  LPALSOURCEPAUSEV = procedure(param1: ALsizei; param2: PALuint); cdecl;
  PLPALSOURCEPAUSEV = ^LPALSOURCEPAUSEV;
  LPALSOURCEPLAY = procedure(param1: ALuint); cdecl;
  PLPALSOURCEPLAY = ^LPALSOURCEPLAY;
  LPALSOURCESTOP = procedure(param1: ALuint); cdecl;
  PLPALSOURCESTOP = ^LPALSOURCESTOP;
  LPALSOURCEREWIND = procedure(param1: ALuint); cdecl;
  PLPALSOURCEREWIND = ^LPALSOURCEREWIND;
  LPALSOURCEPAUSE = procedure(param1: ALuint); cdecl;
  PLPALSOURCEPAUSE = ^LPALSOURCEPAUSE;
  LPALSOURCEQUEUEBUFFERS = procedure(param1: ALuint; param2: ALsizei;
    param3: PALuint); cdecl;
  PLPALSOURCEQUEUEBUFFERS = ^LPALSOURCEQUEUEBUFFERS;
  LPALSOURCEUNQUEUEBUFFERS = procedure(param1: ALuint; param2: ALsizei;
    param3: PALuint); cdecl;
  PLPALSOURCEUNQUEUEBUFFERS = ^LPALSOURCEUNQUEUEBUFFERS;
  LPALGENBUFFERS = procedure(param1: ALsizei; param2: PALuint); cdecl;
  PLPALGENBUFFERS = ^LPALGENBUFFERS;
  LPALDELETEBUFFERS = procedure(param1: ALsizei; param2: PALuint); cdecl;
  PLPALDELETEBUFFERS = ^LPALDELETEBUFFERS;
  LPALISBUFFER = function(param1: ALuint): ALboolean; cdecl;
  PLPALISBUFFER = ^LPALISBUFFER;
  LPALBUFFERDATA = procedure(param1: ALuint; param2: ALenum; param3: PALvoid;
    param4: ALsizei; param5: ALsizei); cdecl;
  PLPALBUFFERDATA = ^LPALBUFFERDATA;
  LPALBUFFERF = procedure(param1: ALuint; param2: ALenum;
    param3: ALfloat); cdecl;
  PLPALBUFFERF = ^LPALBUFFERF;
  LPALBUFFER3F = procedure(param1: ALuint; param2: ALenum; param3: ALfloat;
    param4: ALfloat; param5: ALfloat); cdecl;
  PLPALBUFFER3F = ^LPALBUFFER3F;
  LPALBUFFERFV = procedure(param1: ALuint; param2: ALenum;
    param3: PALfloat); cdecl;
  PLPALBUFFERFV = ^LPALBUFFERFV;
  LPALBUFFERI = procedure(param1: ALuint; param2: ALenum; param3: ALint); cdecl;
  PLPALBUFFERI = ^LPALBUFFERI;
  LPALBUFFER3I = procedure(param1: ALuint; param2: ALenum; param3: ALint;
    param4: ALint; param5: ALint); cdecl;
  PLPALBUFFER3I = ^LPALBUFFER3I;
  LPALBUFFERIV = procedure(param1: ALuint; param2: ALenum;
    param3: PALint); cdecl;
  PLPALBUFFERIV = ^LPALBUFFERIV;
  LPALGETBUFFERF = procedure(param1: ALuint; param2: ALenum;
    param3: PALfloat); cdecl;
  PLPALGETBUFFERF = ^LPALGETBUFFERF;
  LPALGETBUFFER3F = procedure(param1: ALuint; param2: ALenum; param3: PALfloat;
    param4: PALfloat; param5: PALfloat); cdecl;
  PLPALGETBUFFER3F = ^LPALGETBUFFER3F;
  LPALGETBUFFERFV = procedure(param1: ALuint; param2: ALenum;
    param3: PALfloat); cdecl;
  PLPALGETBUFFERFV = ^LPALGETBUFFERFV;
  LPALGETBUFFERI = procedure(param1: ALuint; param2: ALenum;
    param3: PALint); cdecl;
  PLPALGETBUFFERI = ^LPALGETBUFFERI;
  LPALGETBUFFER3I = procedure(param1: ALuint; param2: ALenum; param3: PALint;
    param4: PALint; param5: PALint); cdecl;
  PLPALGETBUFFER3I = ^LPALGETBUFFER3I;
  LPALGETBUFFERIV = procedure(param1: ALuint; param2: ALenum;
    param3: PALint); cdecl;
  PLPALGETBUFFERIV = ^LPALGETBUFFERIV;
  LPALDOPPLERFACTOR = procedure(param1: ALfloat); cdecl;
  PLPALDOPPLERFACTOR = ^LPALDOPPLERFACTOR;
  LPALDOPPLERVELOCITY = procedure(param1: ALfloat); cdecl;
  PLPALDOPPLERVELOCITY = ^LPALDOPPLERVELOCITY;
  LPALSPEEDOFSOUND = procedure(param1: ALfloat); cdecl;
  PLPALSPEEDOFSOUND = ^LPALSPEEDOFSOUND;
  LPALDISTANCEMODEL = procedure(param1: ALenum); cdecl;
  PLPALDISTANCEMODEL = ^LPALDISTANCEMODEL;

  ALCdevice_struct = record
  end;

  PALCdevice_struct = ^ALCdevice_struct;
  ALCdevice = ALCdevice_struct;
  PALCdevice = ^ALCdevice;

  ALCcontext_struct = record
  end;

  PALCcontext_struct = ^ALCcontext_struct;
  ALCcontext = ALCcontext_struct;
  PALCcontext = ^ALCcontext;

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

  LPALCCREATECONTEXT = function(param1: Pointer; param2: PALCint)
    : Pointer; cdecl;
  PLPALCCREATECONTEXT = ^LPALCCREATECONTEXT;
  LPALCMAKECONTEXTCURRENT = function(param1: Pointer): ALCboolean; cdecl;
  PLPALCMAKECONTEXTCURRENT = ^LPALCMAKECONTEXTCURRENT;
  LPALCPROCESSCONTEXT = procedure(param1: Pointer); cdecl;
  PLPALCPROCESSCONTEXT = ^LPALCPROCESSCONTEXT;
  LPALCSUSPENDCONTEXT = procedure(param1: Pointer); cdecl;
  PLPALCSUSPENDCONTEXT = ^LPALCSUSPENDCONTEXT;
  LPALCDESTROYCONTEXT = procedure(param1: Pointer); cdecl;
  PLPALCDESTROYCONTEXT = ^LPALCDESTROYCONTEXT;
  LPALCGETCURRENTCONTEXT = function(): Pointer; cdecl;
  PLPALCGETCURRENTCONTEXT = ^LPALCGETCURRENTCONTEXT;
  LPALCGETCONTEXTSDEVICE = function(param1: Pointer): Pointer; cdecl;
  PLPALCGETCONTEXTSDEVICE = ^LPALCGETCONTEXTSDEVICE;
  LPALCOPENDEVICE = function(param1: PALCchar): Pointer; cdecl;
  PLPALCOPENDEVICE = ^LPALCOPENDEVICE;
  LPALCCLOSEDEVICE = function(param1: Pointer): ALCboolean; cdecl;
  PLPALCCLOSEDEVICE = ^LPALCCLOSEDEVICE;
  LPALCGETERROR = function(param1: Pointer): ALCenum; cdecl;
  PLPALCGETERROR = ^LPALCGETERROR;
  LPALCISEXTENSIONPRESENT = function(param1: Pointer; param2: PALCchar)
    : ALCboolean; cdecl;
  PLPALCISEXTENSIONPRESENT = ^LPALCISEXTENSIONPRESENT;
  LPALCGETPROCADDRESS = function(param1: Pointer; param2: PALCchar)
    : Pointer; cdecl;
  PLPALCGETPROCADDRESS = ^LPALCGETPROCADDRESS;
  LPALCGETENUMVALUE = function(param1: Pointer; param2: PALCchar)
    : ALCenum; cdecl;
  PLPALCGETENUMVALUE = ^LPALCGETENUMVALUE;
  LPALCGETSTRING = function(param1: Pointer; param2: ALCenum): PALCchar; cdecl;
  PLPALCGETSTRING = ^LPALCGETSTRING;
  LPALCGETINTEGERV = procedure(param1: Pointer; param2: ALCenum;
    param3: ALCsizei; param4: PALCint); cdecl;
  PLPALCGETINTEGERV = ^LPALCGETINTEGERV;
  LPALCCAPTUREOPENDEVICE = function(param1: PALCchar; param2: ALCuint;
    param3: ALCenum; param4: ALCsizei): Pointer; cdecl;
  PLPALCCAPTUREOPENDEVICE = ^LPALCCAPTUREOPENDEVICE;
  LPALCCAPTURECLOSEDEVICE = function(param1: Pointer): ALCboolean; cdecl;
  PLPALCCAPTURECLOSEDEVICE = ^LPALCCAPTURECLOSEDEVICE;
  LPALCCAPTURESTART = procedure(param1: Pointer); cdecl;
  PLPALCCAPTURESTART = ^LPALCCAPTURESTART;
  LPALCCAPTURESTOP = procedure(param1: Pointer); cdecl;
  PLPALCCAPTURESTOP = ^LPALCCAPTURESTOP;
  LPALCCAPTURESAMPLES = procedure(param1: Pointer; param2: PALCvoid;
    param3: ALCsizei); cdecl;
  PLPALCCAPTURESAMPLES = ^LPALCCAPTURESAMPLES;
  alBufferDataStaticProcPtr = procedure(param1: ALint; param2: ALenum;
    param3: PALvoid; param4: ALsizei; param5: ALsizei); cdecl;
  PalBufferDataStaticProcPtr = ^alBufferDataStaticProcPtr;
  alcMacOSXRenderingQualityProcPtr = procedure(param1: ALint); cdecl;
  PalcMacOSXRenderingQualityProcPtr = ^alcMacOSXRenderingQualityProcPtr;
  alMacOSXRenderChannelCountProcPtr = procedure(param1: ALint); cdecl;
  PalMacOSXRenderChannelCountProcPtr = ^alMacOSXRenderChannelCountProcPtr;
  alcMacOSXMixerMaxiumumBussesProcPtr = procedure(param1: ALint); cdecl;
  PalcMacOSXMixerMaxiumumBussesProcPtr = ^alcMacOSXMixerMaxiumumBussesProcPtr;
  alcMacOSXMixerOutputRateProcPtr = procedure(param1: ALdouble); cdecl;
  PalcMacOSXMixerOutputRateProcPtr = ^alcMacOSXMixerOutputRateProcPtr;
  alcMacOSXGetRenderingQualityProcPtr = function(): ALint; cdecl;
  PalcMacOSXGetRenderingQualityProcPtr = ^alcMacOSXGetRenderingQualityProcPtr;
  alMacOSXGetRenderChannelCountProcPtr = function(): ALint; cdecl;
  PalMacOSXGetRenderChannelCountProcPtr = ^alMacOSXGetRenderChannelCountProcPtr;
  alcMacOSXGetMixerMaxiumumBussesProcPtr = function(): ALint; cdecl;
  PalcMacOSXGetMixerMaxiumumBussesProcPtr = ^
    alcMacOSXGetMixerMaxiumumBussesProcPtr;
  alcMacOSXGetMixerOutputRateProcPtr = function(): ALdouble; cdecl;
  PalcMacOSXGetMixerOutputRateProcPtr = ^alcMacOSXGetMixerOutputRateProcPtr;
  alSourceRenderingQualityProcPtr = procedure(param1: ALuint;
    param2: ALint); cdecl;
  PalSourceRenderingQualityProcPtr = ^alSourceRenderingQualityProcPtr;
  alSourceGetRenderingQualityProcPtr = function(param1: ALuint): ALint; cdecl;
  PalSourceGetRenderingQualityProcPtr = ^alSourceGetRenderingQualityProcPtr;
  alSourceNotificationProc = procedure(param1: ALuint; param2: ALuint;
    param3: PALvoid); cdecl;
  PalSourceNotificationProc = ^alSourceNotificationProc;
  alSourceAddNotificationProcPtr = function(param1: ALuint; param2: ALuint;
    param3: alSourceNotificationProc; param4: PALvoid): ALenum; cdecl;
  PalSourceAddNotificationProcPtr = ^alSourceAddNotificationProcPtr;
  alSourceRemoveNotificationProcPtr = procedure(param1: ALuint; param2: ALuint;
    param3: alSourceNotificationProc; param4: PALvoid); cdecl;
  PalSourceRemoveNotificationProcPtr = ^alSourceRemoveNotificationProcPtr;
  alcASAGetSourceProcPtr = function(param1: ALuint; param2: ALuint;
    param3: PALvoid; param4: PALuint): ALenum; cdecl;
  PalcASAGetSourceProcPtr = ^alcASAGetSourceProcPtr;
  alcASASetSourceProcPtr = function(param1: ALuint; param2: ALuint;
    param3: PALvoid; param4: ALuint): ALenum; cdecl;
  PalcASASetSourceProcPtr = ^alcASASetSourceProcPtr;
  alcASAGetListenerProcPtr = function(param1: ALuint; param2: PALvoid;
    param3: PALuint): ALenum; cdecl;
  PalcASAGetListenerProcPtr = ^alcASAGetListenerProcPtr;
  alcASASetListenerProcPtr = function(param1: ALuint; param2: PALvoid;
    param3: ALuint): ALenum; cdecl;
  PalcASASetListenerProcPtr = ^alcASASetListenerProcPtr;
  alcOutputCapturerPrepareProcPtr = procedure(param1: ALCuint; param2: ALCenum;
    param3: ALCsizei); cdecl;
  PalcOutputCapturerPrepareProcPtr = ^alcOutputCapturerPrepareProcPtr;
  alcOutputCapturerStartProcPtr = procedure(); cdecl;
  PalcOutputCapturerStartProcPtr = ^alcOutputCapturerStartProcPtr;
  alcOutputCapturerStopProcPtr = procedure(); cdecl;
  PalcOutputCapturerStopProcPtr = ^alcOutputCapturerStopProcPtr;
  alcOutputCapturerAvailableSamplesProcPtr = function(): ALint; cdecl;
  PalcOutputCapturerAvailableSamplesProcPtr = ^
    alcOutputCapturerAvailableSamplesProcPtr;
  alcOutputCapturerSamplesProcPtr = procedure(param1: PALCvoid;
    param2: ALCsizei); cdecl;
  PalcOutputCapturerSamplesProcPtr = ^alcOutputCapturerSamplesProcPtr;
  // ===== External functions =====

const
  libOpenAL = '/System/Library/Frameworks/OpenAL.framework/OpenAL';
procedure alEnable(capability: ALenum); cdecl;
  external libOpenAL name _PU + 'alEnable';
procedure alDisable(capability: ALenum); cdecl;
  external libOpenAL name _PU + 'alDisable';
function alIsEnabled(capability: ALenum): ALboolean; cdecl;
  external libOpenAL name _PU + 'alIsEnabled';
function alGetString(param: ALenum): PALchar; cdecl;
  external libOpenAL name _PU + 'alGetString';
procedure alGetBooleanv(param: ALenum; data: PALboolean); cdecl;
  external libOpenAL name _PU + 'alGetBooleanv';
procedure alGetIntegerv(param: ALenum; data: PALint); cdecl;
  external libOpenAL name _PU + 'alGetIntegerv';
procedure alGetFloatv(param: ALenum; data: PALfloat); cdecl;
  external libOpenAL name _PU + 'alGetFloatv';
procedure alGetDoublev(param: ALenum; data: PALdouble); cdecl;
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
function alIsExtensionPresent(extname: PALchar): ALboolean; cdecl;
  external libOpenAL name _PU + 'alIsExtensionPresent';
function alGetProcAddress(fname: PALchar): Pointer; cdecl;
  external libOpenAL name _PU + 'alGetProcAddress';
function alGetEnumValue(ename: PALchar): ALenum; cdecl;
  external libOpenAL name _PU + 'alGetEnumValue';
procedure alListenerf(param: ALenum; value: ALfloat); cdecl;
  external libOpenAL name _PU + 'alListenerf';
procedure alListener3f(param: ALenum; value1: ALfloat; value2: ALfloat;
  value3: ALfloat); cdecl; external libOpenAL name _PU + 'alListener3f';
procedure alListenerfv(param: ALenum; values: PALfloat); cdecl;
  external libOpenAL name _PU + 'alListenerfv';
procedure alListeneri(param: ALenum; value: ALint); cdecl;
  external libOpenAL name _PU + 'alListeneri';
procedure alListener3i(param: ALenum; value1: ALint; value2: ALint;
  value3: ALint); cdecl; external libOpenAL name _PU + 'alListener3i';
procedure alListeneriv(param: ALenum; values: PALint); cdecl;
  external libOpenAL name _PU + 'alListeneriv';
procedure alGetListenerf(param: ALenum; value: PALfloat); cdecl;
  external libOpenAL name _PU + 'alGetListenerf';
procedure alGetListener3f(param: ALenum; value1: PALfloat; value2: PALfloat;
  value3: PALfloat); cdecl; external libOpenAL name _PU + 'alGetListener3f';
procedure alGetListenerfv(param: ALenum; values: PALfloat); cdecl;
  external libOpenAL name _PU + 'alGetListenerfv';
procedure alGetListeneri(param: ALenum; value: PALint); cdecl;
  external libOpenAL name _PU + 'alGetListeneri';
procedure alGetListener3i(param: ALenum; value1: PALint; value2: PALint;
  value3: PALint); cdecl; external libOpenAL name _PU + 'alGetListener3i';
procedure alGetListeneriv(param: ALenum; values: PALint); cdecl;
  external libOpenAL name _PU + 'alGetListeneriv';
procedure alGenSources(n: ALsizei; sources: PALuint); cdecl;
  external libOpenAL name _PU + 'alGenSources';
procedure alDeleteSources(n: ALsizei; sources: PALuint); cdecl;
  external libOpenAL name _PU + 'alDeleteSources';
function alIsSource(sid: ALuint): ALboolean; cdecl;
  external libOpenAL name _PU + 'alIsSource';
procedure alSourcef(sid: ALuint; param: ALenum; value: ALfloat); cdecl;
  external libOpenAL name _PU + 'alSourcef';
procedure alSource3f(sid: ALuint; param: ALenum; value1: ALfloat;
  value2: ALfloat; value3: ALfloat); cdecl;
  external libOpenAL name _PU + 'alSource3f';
procedure alSourcefv(sid: ALuint; param: ALenum; values: PALfloat); cdecl;
  external libOpenAL name _PU + 'alSourcefv';
procedure alSourcei(sid: ALuint; param: ALenum; value: ALint); cdecl;
  external libOpenAL name _PU + 'alSourcei';
procedure alSource3i(sid: ALuint; param: ALenum; value1: ALint; value2: ALint;
  value3: ALint); cdecl; external libOpenAL name _PU + 'alSource3i';
procedure alSourceiv(sid: ALuint; param: ALenum; values: PALint); cdecl;
  external libOpenAL name _PU + 'alSourceiv';
procedure alGetSourcef(sid: ALuint; param: ALenum; value: PALfloat); cdecl;
  external libOpenAL name _PU + 'alGetSourcef';
procedure alGetSource3f(sid: ALuint; param: ALenum; value1: PALfloat;
  value2: PALfloat; value3: PALfloat); cdecl;
  external libOpenAL name _PU + 'alGetSource3f';
procedure alGetSourcefv(sid: ALuint; param: ALenum; values: PALfloat); cdecl;
  external libOpenAL name _PU + 'alGetSourcefv';
procedure alGetSourcei(sid: ALuint; param: ALenum; value: PALint); cdecl;
  external libOpenAL name _PU + 'alGetSourcei';
procedure alGetSource3i(sid: ALuint; param: ALenum; value1: PALint;
  value2: PALint; value3: PALint); cdecl;
  external libOpenAL name _PU + 'alGetSource3i';
procedure alGetSourceiv(sid: ALuint; param: ALenum; values: PALint); cdecl;
  external libOpenAL name _PU + 'alGetSourceiv';
procedure alSourcePlayv(ns: ALsizei; sids: PALuint); cdecl;
  external libOpenAL name _PU + 'alSourcePlayv';
procedure alSourceStopv(ns: ALsizei; sids: PALuint); cdecl;
  external libOpenAL name _PU + 'alSourceStopv';
procedure alSourceRewindv(ns: ALsizei; sids: PALuint); cdecl;
  external libOpenAL name _PU + 'alSourceRewindv';
procedure alSourcePausev(ns: ALsizei; sids: PALuint); cdecl;
  external libOpenAL name _PU + 'alSourcePausev';
procedure alSourcePlay(sid: ALuint); cdecl;
  external libOpenAL name _PU + 'alSourcePlay';
procedure alSourceStop(sid: ALuint); cdecl;
  external libOpenAL name _PU + 'alSourceStop';
procedure alSourceRewind(sid: ALuint); cdecl;
  external libOpenAL name _PU + 'alSourceRewind';
procedure alSourcePause(sid: ALuint); cdecl;
  external libOpenAL name _PU + 'alSourcePause';
procedure alSourceQueueBuffers(sid: ALuint; numEntries: ALsizei; bids: PALuint);
  cdecl; external libOpenAL name _PU + 'alSourceQueueBuffers';
procedure alSourceUnqueueBuffers(sid: ALuint; numEntries: ALsizei;
  bids: PALuint); cdecl; external libOpenAL name _PU + 'alSourceUnqueueBuffers';
procedure alGenBuffers(n: ALsizei; buffers: PALuint); cdecl;
  external libOpenAL name _PU + 'alGenBuffers';
procedure alDeleteBuffers(n: ALsizei; buffers: PALuint); cdecl;
  external libOpenAL name _PU + 'alDeleteBuffers';
function alIsBuffer(bid: ALuint): ALboolean; cdecl;
  external libOpenAL name _PU + 'alIsBuffer';
procedure alBufferData(bid: ALuint; format: ALenum; data: PALvoid;
  size: ALsizei; freq: ALsizei); cdecl;
  external libOpenAL name _PU + 'alBufferData';
procedure alBufferf(bid: ALuint; param: ALenum; value: ALfloat); cdecl;
  external libOpenAL name _PU + 'alBufferf';
procedure alBuffer3f(bid: ALuint; param: ALenum; value1: ALfloat;
  value2: ALfloat; value3: ALfloat); cdecl;
  external libOpenAL name _PU + 'alBuffer3f';
procedure alBufferfv(bid: ALuint; param: ALenum; values: PALfloat); cdecl;
  external libOpenAL name _PU + 'alBufferfv';
procedure alBufferi(bid: ALuint; param: ALenum; value: ALint); cdecl;
  external libOpenAL name _PU + 'alBufferi';
procedure alBuffer3i(bid: ALuint; param: ALenum; value1: ALint; value2: ALint;
  value3: ALint); cdecl; external libOpenAL name _PU + 'alBuffer3i';
procedure alBufferiv(bid: ALuint; param: ALenum; values: PALint); cdecl;
  external libOpenAL name _PU + 'alBufferiv';
procedure alGetBufferf(bid: ALuint; param: ALenum; value: PALfloat); cdecl;
  external libOpenAL name _PU + 'alGetBufferf';
procedure alGetBuffer3f(bid: ALuint; param: ALenum; value1: PALfloat;
  value2: PALfloat; value3: PALfloat); cdecl;
  external libOpenAL name _PU + 'alGetBuffer3f';
procedure alGetBufferfv(bid: ALuint; param: ALenum; values: PALfloat); cdecl;
  external libOpenAL name _PU + 'alGetBufferfv';
procedure alGetBufferi(bid: ALuint; param: ALenum; value: PALint); cdecl;
  external libOpenAL name _PU + 'alGetBufferi';
procedure alGetBuffer3i(bid: ALuint; param: ALenum; value1: PALint;
  value2: PALint; value3: PALint); cdecl;
  external libOpenAL name _PU + 'alGetBuffer3i';
procedure alGetBufferiv(bid: ALuint; param: ALenum; values: PALint); cdecl;
  external libOpenAL name _PU + 'alGetBufferiv';
procedure alDopplerFactor(value: ALfloat); cdecl;
  external libOpenAL name _PU + 'alDopplerFactor';
procedure alDopplerVelocity(value: ALfloat); cdecl;
  external libOpenAL name _PU + 'alDopplerVelocity';
procedure alSpeedOfSound(value: ALfloat); cdecl;
  external libOpenAL name _PU + 'alSpeedOfSound';
procedure alDistanceModel(distanceModel: ALenum); cdecl;
  external libOpenAL name _PU + 'alDistanceModel';
function alcCreateContext(device: Pointer; attrlist: PALCint): Pointer; cdecl;
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
function alcOpenDevice(devicename: PALCchar): Pointer; cdecl;
  external libOpenAL name _PU + 'alcOpenDevice';
function alcCloseDevice(device: Pointer): ALCboolean; cdecl;
  external libOpenAL name _PU + 'alcCloseDevice';
function alcGetError(device: Pointer): ALCenum; cdecl;
  external libOpenAL name _PU + 'alcGetError';
function alcIsExtensionPresent(device: Pointer; extname: PALCchar): ALCboolean;
  cdecl; external libOpenAL name _PU + 'alcIsExtensionPresent';
function alcGetProcAddress(device: Pointer; funcname: PALCchar): Pointer; cdecl;
  external libOpenAL name _PU + 'alcGetProcAddress';
function alcGetEnumValue(device: Pointer; enumname: PALCchar): ALCenum; cdecl;
  external libOpenAL name _PU + 'alcGetEnumValue';
function alcGetString(device: Pointer; param: ALCenum): PALCchar; cdecl;
  external libOpenAL name _PU + 'alcGetString';
procedure alcGetIntegerv(device: Pointer; param: ALCenum; size: ALCsizei;
  data: PALCint); cdecl; external libOpenAL name _PU + 'alcGetIntegerv';
function alcCaptureOpenDevice(devicename: PALCchar; frequency: ALCuint;
  format: ALCenum; buffersize: ALCsizei): Pointer; cdecl;
  external libOpenAL name _PU + 'alcCaptureOpenDevice';
function alcCaptureCloseDevice(device: Pointer): ALCboolean; cdecl;
  external libOpenAL name _PU + 'alcCaptureCloseDevice';
procedure alcCaptureStart(device: Pointer); cdecl;
  external libOpenAL name _PU + 'alcCaptureStart';
procedure alcCaptureStop(device: Pointer); cdecl;
  external libOpenAL name _PU + 'alcCaptureStop';
procedure alcCaptureSamples(device: Pointer; buffer: PALCvoid;
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
