{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework MediaToolbox
//

unit iOSapi.MediaToolbox;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.CoreMedia,
  iOSapi.Foundation;

const
  kMTAudioProcessingTapCreationFlag_PreEffects = (1 shl 0);
  kMTAudioProcessingTapCreationFlag_PostEffects = (1 shl 1);
  kMTAudioProcessingTapFlag_StartOfStream = (1 shl 8);
  kMTAudioProcessingTapFlag_EndOfStream = (1 shl 9);
  kMTAudioProcessingTapCallbacksVersion_0 = 0;

type
  // ===== Framework typedefs =====
{$M+}
  MTAudioProcessingTapRef = Pointer;
  PMTAudioProcessingTapRef = ^MTAudioProcessingTapRef;
  CFTypeID = LongWord;
  PCFTypeID = ^CFTypeID;

  MTAudioProcessingTapCreationFlags = LongWord;
  PMTAudioProcessingTapCreationFlags = ^MTAudioProcessingTapCreationFlags;
  MTAudioProcessingTapFlags = LongWord;
  PMTAudioProcessingTapFlags = ^MTAudioProcessingTapFlags;
  MTAudioProcessingTapInitCallback = procedure(param1: MTAudioProcessingTapRef;
    param2: Pointer; param3: Pointer); cdecl;
  PMTAudioProcessingTapInitCallback = ^MTAudioProcessingTapInitCallback;
  MTAudioProcessingTapFinalizeCallback = procedure
    (param1: MTAudioProcessingTapRef); cdecl;
  PMTAudioProcessingTapFinalizeCallback = ^MTAudioProcessingTapFinalizeCallback;
  CFIndex = LongInt;
  PCFIndex = ^CFIndex;

  CMItemCount = CFIndex;
  PCMItemCount = ^CMItemCount;
  MTAudioProcessingTapPrepareCallback = procedure
    (param1: MTAudioProcessingTapRef; param2: CMItemCount;
    param3: PInteger); cdecl;
  PMTAudioProcessingTapPrepareCallback = ^MTAudioProcessingTapPrepareCallback;
  MTAudioProcessingTapUnprepareCallback = procedure
    (param1: MTAudioProcessingTapRef); cdecl;
  PMTAudioProcessingTapUnprepareCallback = ^
    MTAudioProcessingTapUnprepareCallback;
  MTAudioProcessingTapProcessCallback = procedure
    (param1: MTAudioProcessingTapRef; param2: CMItemCount;
    param3: MTAudioProcessingTapFlags; param4: PInteger; param5: PCMItemCount;
    param6: PMTAudioProcessingTapFlags); cdecl;
  PMTAudioProcessingTapProcessCallback = ^MTAudioProcessingTapProcessCallback;

  MTAudioProcessingTapCallbacks = record
    version: Integer;
    clientInfo: Pointer;
    init: MTAudioProcessingTapInitCallback;
    finalize: MTAudioProcessingTapFinalizeCallback;
    prepare: MTAudioProcessingTapPrepareCallback;
    unprepare: MTAudioProcessingTapUnprepareCallback;
    process: MTAudioProcessingTapProcessCallback;
  end;

  PMTAudioProcessingTapCallbacks = ^MTAudioProcessingTapCallbacks;

  CFAllocatorRef = Pointer;
  PCFAllocatorRef = ^CFAllocatorRef;
  OSStatus = Int32;
  POSStatus = ^OSStatus;
  FourCharCode = UInt32;
  PFourCharCode = ^FourCharCode;
  CMMediaType = FourCharCode;
  PCMMediaType = ^CMMediaType;
  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  // ===== External functions =====

const
  libMediaToolbox =
    '/System/Library/Frameworks/MediaToolbox.framework/MediaToolbox';
function MTAudioProcessingTapGetTypeID: CFTypeID; cdecl;
  external libMediaToolbox name _PU + 'MTAudioProcessingTapGetTypeID';
function MTAudioProcessingTapCreate(allocator: CFAllocatorRef;
  callbacks: PMTAudioProcessingTapCallbacks;
  flags: MTAudioProcessingTapCreationFlags; tapOut: PMTAudioProcessingTapRef)
  : OSStatus; cdecl; external libMediaToolbox name _PU +
  'MTAudioProcessingTapCreate';
function MTAudioProcessingTapGetStorage(tap: MTAudioProcessingTapRef): Pointer;
  cdecl; external libMediaToolbox name _PU + 'MTAudioProcessingTapGetStorage';
function MTAudioProcessingTapGetSourceAudio(tap: MTAudioProcessingTapRef;
  numberFrames: CMItemCount; bufferListInOut: PInteger;
  flagsOut: PMTAudioProcessingTapFlags; timeRangeOut: Pointer;
  numberFramesOut: PCMItemCount): OSStatus; cdecl;
  external libMediaToolbox name _PU + 'MTAudioProcessingTapGetSourceAudio';
function MTCopyLocalizedNameForMediaType(mediaType: CMMediaType): CFStringRef;
  cdecl; external libMediaToolbox name _PU + 'MTCopyLocalizedNameForMediaType';
function MTCopyLocalizedNameForMediaSubType(mediaType: CMMediaType;
  mediaSubType: FourCharCode): CFStringRef; cdecl;
  external libMediaToolbox name _PU + 'MTCopyLocalizedNameForMediaSubType';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  MediaToolboxModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MediaToolboxModule := dlopen(MarshaledAString(libMediaToolbox), RTLD_LAZY);

finalization

dlclose(MediaToolboxModule);
{$ENDIF IOS}

end.
