{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreMedia
//

unit iOSapi.CoreMedia;

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
  iOSapi.AudioToolbox,
  iOSapi.CocoaTypes,
  iOSapi.CoreAudio,
  iOSapi.CoreGraphics,
  iOSapi.CoreVideo,
  iOSapi.Foundation;

const
  kCMPersistentTrackID_Invalid = 0;
  kCMAttachmentMode_ShouldNotPropagate = 0;
  kCMAttachmentMode_ShouldPropagate = 1;
  kCMTimeFlags_Valid = 1 shl 0;
  kCMTimeFlags_HasBeenRounded = 1 shl 1;
  kCMTimeFlags_PositiveInfinity = 1 shl 2;
  kCMTimeFlags_NegativeInfinity = 1 shl 3;
  kCMTimeFlags_Indefinite = 1 shl 4;
  kCMTimeFlags_ImpliedValueFlagsMask = kCMTimeFlags_PositiveInfinity or
    kCMTimeFlags_NegativeInfinity or kCMTimeFlags_Indefinite;
  kCMTimeRoundingMethod_RoundHalfAwayFromZero = 1;
  kCMTimeRoundingMethod_RoundTowardZero = 2;
  kCMTimeRoundingMethod_RoundAwayFromZero = 3;
  kCMTimeRoundingMethod_QuickTime = 4;
  kCMTimeRoundingMethod_RoundTowardPositiveInfinity = 5;
  kCMTimeRoundingMethod_RoundTowardNegativeInfinity = 6;
  kCMTimeRoundingMethod_Default = kCMTimeRoundingMethod_RoundHalfAwayFromZero;
  kCMClockError_MissingRequiredParameter = -12745;
  kCMClockError_InvalidParameter = -12746;
  kCMClockError_AllocationFailed = -12747;
  kCMClockError_UnsupportedOperation = -12756;
  kCMTimebaseError_MissingRequiredParameter = -12748;
  kCMTimebaseError_InvalidParameter = -12749;
  kCMTimebaseError_AllocationFailed = -12750;
  kCMTimebaseError_TimerIntervalTooShort = -12751;
  kCMTimebaseError_ReadOnly = -12757;
  kCMSyncError_MissingRequiredParameter = -12752;
  kCMSyncError_InvalidParameter = -12753;
  kCMSyncError_AllocationFailed = -12754;
  kCMSyncError_RateMustBeNonZero = -12755;
  kCMBlockBufferNoErr = 0;
  kCMBlockBufferStructureAllocationFailedErr = -12700;
  kCMBlockBufferBlockAllocationFailedErr = -12701;
  kCMBlockBufferBadCustomBlockSourceErr = -12702;
  kCMBlockBufferBadOffsetParameterErr = -12703;
  kCMBlockBufferBadLengthParameterErr = -12704;
  kCMBlockBufferBadPointerParameterErr = -12705;
  kCMBlockBufferEmptyBBufErr = -12706;
  kCMBlockBufferUnallocatedBlockErr = -12707;
  kCMBlockBufferInsufficientSpaceErr = -12708;
  kCMBlockBufferAssureMemoryNowFlag = (1 shl 0);
  kCMBlockBufferAlwaysCopyDataFlag = (1 shl 1);
  kCMBlockBufferDontOptimizeDepthFlag = (1 shl 2);
  kCMBlockBufferPermitEmptyReferenceFlag = (1 shl 3);
  kCMBlockBufferCustomBlockSourceVersion = 0;
  kCMBufferQueueError_AllocationFailed = -12760;
  kCMBufferQueueError_RequiredParameterMissing = -12761;
  kCMBufferQueueError_InvalidCMBufferCallbacksStruct = -12762;
  kCMBufferQueueError_EnqueueAfterEndOfData = -12763;
  kCMBufferQueueError_QueueIsFull = -12764;
  kCMBufferQueueError_BadTriggerDuration = -12765;
  kCMBufferQueueError_CannotModifyQueueFromTriggerCallback = -12766;
  kCMBufferQueueError_InvalidTriggerCondition = -12767;
  kCMBufferQueueError_InvalidTriggerToken = -12768;
  kCMBufferQueueError_InvalidBuffer = -12769;
  kCMBufferQueueTrigger_WhenDurationBecomesLessThan = 1;
  kCMBufferQueueTrigger_WhenDurationBecomesLessThanOrEqualTo = 2;
  kCMBufferQueueTrigger_WhenDurationBecomesGreaterThan = 3;
  kCMBufferQueueTrigger_WhenDurationBecomesGreaterThanOrEqualTo = 4;
  kCMBufferQueueTrigger_WhenMinPresentationTimeStampChanges = 5;
  kCMBufferQueueTrigger_WhenMaxPresentationTimeStampChanges = 6;
  kCMBufferQueueTrigger_WhenDataBecomesReady = 7;
  kCMBufferQueueTrigger_WhenEndOfDataReached = 8;
  kCMBufferQueueTrigger_WhenReset = 9;
  kCMBufferQueueTrigger_WhenBufferCountBecomesLessThan = 10;
  kCMBufferQueueTrigger_WhenBufferCountBecomesGreaterThan = 11;
  kCMBufferQueueTrigger_WhenDurationBecomesGreaterThanOrEqualToAndBufferCountBecomesGreaterThan =
    12;
  kCMFormatDescriptionError_InvalidParameter = -12710;
  kCMFormatDescriptionError_AllocationFailed = -12711;
  kCMFormatDescriptionError_ValueNotAvailable = -12718;
  kCMMediaType_Video = 1986618469;
  kCMMediaType_Audio = 1936684398;
  kCMMediaType_Muxed = 1836415096;
  kCMMediaType_Text = 1952807028;
  kCMMediaType_ClosedCaption = 1668047728;
  kCMMediaType_Subtitle = 1935832172;
  kCMMediaType_TimeCode = 1953325924;
  kCMMediaType_Metadata = 1835365473;
  kCMAudioCodecType_AAC_LCProtected = 1885430115;
  kCMAudioCodecType_AAC_AudibleProtected = 1633771875;
  kCMAudioFormatDescriptionMask_StreamBasicDescription = (1 shl 0);
  kCMAudioFormatDescriptionMask_MagicCookie = (1 shl 1);
  kCMAudioFormatDescriptionMask_ChannelLayout = (1 shl 2);
  kCMAudioFormatDescriptionMask_Extensions = (1 shl 3);
  kCMAudioFormatDescriptionMask_All =
    kCMAudioFormatDescriptionMask_StreamBasicDescription or
    kCMAudioFormatDescriptionMask_MagicCookie or
    kCMAudioFormatDescriptionMask_ChannelLayout or
    kCMAudioFormatDescriptionMask_Extensions;
  kCMPixelFormat_32ARGB = 32;
  kCMPixelFormat_32BGRA = 1111970369;
  kCMPixelFormat_24RGB = 24;
  kCMPixelFormat_16BE555 = 16;
  kCMPixelFormat_16BE565 = 1110783541;
  kCMPixelFormat_16LE555 = 1278555445;
  kCMPixelFormat_16LE565 = 1278555701;
  kCMPixelFormat_16LE5551 = 892679473;
  kCMPixelFormat_422YpCbCr8 = 846624121;
  kCMPixelFormat_422YpCbCr8_yuvs = 2037741171;
  kCMPixelFormat_444YpCbCr8 = 1983066168;
  kCMPixelFormat_4444YpCbCrA8 = 1983131704;
  kCMPixelFormat_422YpCbCr16 = 1983000886;
  kCMPixelFormat_422YpCbCr10 = 1983000880;
  kCMPixelFormat_444YpCbCr10 = 1983131952;
  kCMPixelFormat_8IndexedGray_WhiteIsZero = 40;
  kCMVideoCodecType_422YpCbCr8 = kCMPixelFormat_422YpCbCr8;
  kCMVideoCodecType_Animation = 1919706400;
  kCMVideoCodecType_Cinepak = 1668704612;
  kCMVideoCodecType_JPEG = 1785750887;
  kCMVideoCodecType_JPEG_OpenDML = 1684890161;
  kCMVideoCodecType_SorensonVideo = 1398165809;
  kCMVideoCodecType_SorensonVideo3 = 1398165811;
  kCMVideoCodecType_H263 = 1748121139;
  kCMVideoCodecType_H264 = 1635148593;
  kCMVideoCodecType_HEVC = 1752589105;
  kCMVideoCodecType_MPEG4Video = 1836070006;
  kCMVideoCodecType_MPEG2Video = 1836069494;
  kCMVideoCodecType_MPEG1Video = 1836069238;
  kCMVideoCodecType_DVCNTSC = 1685480224;
  kCMVideoCodecType_DVCPAL = 1685480304;
  kCMVideoCodecType_DVCProPAL = 1685483632;
  kCMVideoCodecType_DVCPro50NTSC = 1685468526;
  kCMVideoCodecType_DVCPro50PAL = 1685468528;
  kCMVideoCodecType_DVCPROHD720p60 = 1685481584;
  kCMVideoCodecType_DVCPROHD720p50 = 1685481585;
  kCMVideoCodecType_DVCPROHD1080i60 = 1685481526;
  kCMVideoCodecType_DVCPROHD1080i50 = 1685481525;
  kCMVideoCodecType_DVCPROHD1080p30 = 1685481523;
  kCMVideoCodecType_DVCPROHD1080p25 = 1685481522;
  kCMVideoCodecType_AppleProRes4444 = 1634743400;
  kCMVideoCodecType_AppleProRes422HQ = 1634755432;
  kCMVideoCodecType_AppleProRes422 = 1634755438;
  kCMVideoCodecType_AppleProRes422LT = 1634755443;
  kCMVideoCodecType_AppleProRes422Proxy = 1634755439;
  kCMMPEG2VideoProfile_HDV_720p30 = 1751414321;
  kCMMPEG2VideoProfile_HDV_1080i60 = 1751414322;
  kCMMPEG2VideoProfile_HDV_1080i50 = 1751414323;
  kCMMPEG2VideoProfile_HDV_720p24 = 1751414324;
  kCMMPEG2VideoProfile_HDV_720p25 = 1751414325;
  kCMMPEG2VideoProfile_HDV_1080p24 = 1751414326;
  kCMMPEG2VideoProfile_HDV_1080p25 = 1751414327;
  kCMMPEG2VideoProfile_HDV_1080p30 = 1751414328;
  kCMMPEG2VideoProfile_HDV_720p60 = 1751414329;
  kCMMPEG2VideoProfile_HDV_720p50 = 1751414369;
  kCMMPEG2VideoProfile_XDCAM_HD_1080i60_VBR35 = 2019849778;
  kCMMPEG2VideoProfile_XDCAM_HD_1080i50_VBR35 = 2019849779;
  kCMMPEG2VideoProfile_XDCAM_HD_1080p24_VBR35 = 2019849782;
  kCMMPEG2VideoProfile_XDCAM_HD_1080p25_VBR35 = 2019849783;
  kCMMPEG2VideoProfile_XDCAM_HD_1080p30_VBR35 = 2019849784;
  kCMMPEG2VideoProfile_XDCAM_EX_720p24_VBR35 = 2019849780;
  kCMMPEG2VideoProfile_XDCAM_EX_720p25_VBR35 = 2019849781;
  kCMMPEG2VideoProfile_XDCAM_EX_720p30_VBR35 = 2019849777;
  kCMMPEG2VideoProfile_XDCAM_EX_720p50_VBR35 = 2019849825;
  kCMMPEG2VideoProfile_XDCAM_EX_720p60_VBR35 = 2019849785;
  kCMMPEG2VideoProfile_XDCAM_EX_1080i60_VBR35 = 2019849826;
  kCMMPEG2VideoProfile_XDCAM_EX_1080i50_VBR35 = 2019849827;
  kCMMPEG2VideoProfile_XDCAM_EX_1080p24_VBR35 = 2019849828;
  kCMMPEG2VideoProfile_XDCAM_EX_1080p25_VBR35 = 2019849829;
  kCMMPEG2VideoProfile_XDCAM_EX_1080p30_VBR35 = 2019849830;
  kCMMPEG2VideoProfile_XDCAM_HD422_720p50_CBR50 = 2019833185;
  kCMMPEG2VideoProfile_XDCAM_HD422_720p60_CBR50 = 2019833145;
  kCMMPEG2VideoProfile_XDCAM_HD422_1080i60_CBR50 = 2019833186;
  kCMMPEG2VideoProfile_XDCAM_HD422_1080i50_CBR50 = 2019833187;
  kCMMPEG2VideoProfile_XDCAM_HD422_1080p24_CBR50 = 2019833188;
  kCMMPEG2VideoProfile_XDCAM_HD422_1080p25_CBR50 = 2019833189;
  kCMMPEG2VideoProfile_XDCAM_HD422_1080p30_CBR50 = 2019833190;
  kCMMPEG2VideoProfile_XDCAM_HD_540p = 2019846244;
  kCMMPEG2VideoProfile_XDCAM_HD422_540p = 2019846194;
  kCMMPEG2VideoProfile_XDCAM_HD422_720p24_CBR50 = 2019833140;
  kCMMPEG2VideoProfile_XDCAM_HD422_720p25_CBR50 = 2019833141;
  kCMMPEG2VideoProfile_XDCAM_HD422_720p30_CBR50 = 2019833137;
  kCMMPEG2VideoProfile_XF = 2019981873;
  kCMMuxedStreamType_MPEG1System = 1836069235;
  kCMMuxedStreamType_MPEG2Transport = 1836069492;
  kCMMuxedStreamType_MPEG2Program = 1836069488;
  kCMMuxedStreamType_DV = 1685463072;
  kCMClosedCaptionFormatType_CEA608 = 1664495672;
  kCMClosedCaptionFormatType_CEA708 = 1664561208;
  kCMClosedCaptionFormatType_ATSC = 1635017571;
  kCMTextFormatType_QTText = 1952807028;
  kCMTextFormatType_3GText = 1954034535;
  kCMTextDisplayFlag_scrollIn = 32;
  kCMTextDisplayFlag_scrollOut = 64;
  kCMTextDisplayFlag_scrollDirectionMask = 384;
  kCMTextDisplayFlag_scrollDirection_bottomToTop = 0;
  kCMTextDisplayFlag_scrollDirection_rightToLeft = 128;
  kCMTextDisplayFlag_scrollDirection_topToBottom = 256;
  kCMTextDisplayFlag_scrollDirection_leftToRight = 384;
  kCMTextDisplayFlag_continuousKaraoke = 2048;
  kCMTextDisplayFlag_writeTextVertically = 131072;
  kCMTextDisplayFlag_fillTextRegion = 262144;
  kCMTextDisplayFlag_obeySubtitleFormatting = 536870912;
  kCMTextDisplayFlag_forcedSubtitlesPresent = 1073741824;
  kCMTextDisplayFlag_allSubtitlesForced = 2147483648;
  kCMTextJustification_left_top = 0;
  kCMTextJustification_centered = 1;
  kCMTextJustification_bottom_right = -1;
  kCMSubtitleFormatType_3GText = 1954034535;
  kCMSubtitleFormatType_WebVTT = 2004251764;
  kCMTimeCodeFormatType_TimeCode32 = 1953325924;
  kCMTimeCodeFormatType_TimeCode64 = 1952658996;
  kCMTimeCodeFormatType_Counter32 = 1668166450;
  kCMTimeCodeFormatType_Counter64 = 1668167220;
  kCMTimeCodeFlag_DropFrame = 1 shl 0;
  kCMTimeCodeFlag_24HourMax = 1 shl 1;
  kCMTimeCodeFlag_NegTimesOK = 1 shl 2;
  kCMMetadataFormatType_ICY = 1768126752;
  kCMMetadataFormatType_ID3 = 1768174368;
  kCMMetadataFormatType_Boxed = 1835360888;
  kCMFormatDescriptionBridgeError_InvalidParameter = -12712;
  kCMFormatDescriptionBridgeError_AllocationFailed = -12713;
  kCMFormatDescriptionBridgeError_InvalidSerializedSampleDescription = -12714;
  kCMFormatDescriptionBridgeError_InvalidFormatDescription = -12715;
  kCMFormatDescriptionBridgeError_IncompatibleFormatDescription = -12716;
  kCMFormatDescriptionBridgeError_UnsupportedSampleDescriptionFlavor = -12717;
  kCMFormatDescriptionBridgeError_InvalidSlice = -12719;
  kCMMetadataIdentifierError_AllocationFailed = -16300;
  kCMMetadataIdentifierError_RequiredParameterMissing = -16301;
  kCMMetadataIdentifierError_BadKey = -16302;
  kCMMetadataIdentifierError_BadKeyLength = -16303;
  kCMMetadataIdentifierError_BadKeyType = -16304;
  kCMMetadataIdentifierError_BadNumberKey = -16305;
  kCMMetadataIdentifierError_BadKeySpace = -16306;
  kCMMetadataIdentifierError_BadIdentifier = -16307;
  kCMMetadataIdentifierError_NoKeyValueAvailable = -16308;
  kCMMetadataDataTypeRegistryError_AllocationFailed = -16310;
  kCMMetadataDataTypeRegistryError_RequiredParameterMissing = -16311;
  kCMMetadataDataTypeRegistryError_BadDataTypeIdentifier = -16312;
  kCMMetadataDataTypeRegistryError_DataTypeAlreadyRegistered = -16313;
  kCMMetadataDataTypeRegistryError_RequiresConformingBaseType = -16314;
  kCMMetadataDataTypeRegistryError_MultipleConformingBaseTypes = -16315;
  kCMSampleBufferError_AllocationFailed = -12730;
  kCMSampleBufferError_RequiredParameterMissing = -12731;
  kCMSampleBufferError_AlreadyHasDataBuffer = -12732;
  kCMSampleBufferError_BufferNotReady = -12733;
  kCMSampleBufferError_SampleIndexOutOfRange = -12734;
  kCMSampleBufferError_BufferHasNoSampleSizes = -12735;
  kCMSampleBufferError_BufferHasNoSampleTimingInfo = -12736;
  kCMSampleBufferError_ArrayTooSmall = -12737;
  kCMSampleBufferError_InvalidEntryCount = -12738;
  kCMSampleBufferError_CannotSubdivide = -12739;
  kCMSampleBufferError_SampleTimingInfoInvalid = -12740;
  kCMSampleBufferError_InvalidMediaTypeForOperation = -12741;
  kCMSampleBufferError_InvalidSampleData = -12742;
  kCMSampleBufferError_InvalidMediaFormat = -12743;
  kCMSampleBufferError_Invalidated = -12744;
  kCMSampleBufferError_DataFailed = -16750;
  kCMSampleBufferError_DataCanceled = -16751;
  kCMSampleBufferFlag_AudioBufferList_Assure16ByteAlignment = (1 shl 0);
  kCMSimpleQueueError_AllocationFailed = -12770;
  kCMSimpleQueueError_RequiredParameterMissing = -12771;
  kCMSimpleQueueError_ParameterOutOfRange = -12772;
  kCMSimpleQueueError_QueueIsFull = -12773;

type
  // ===== Framework typedefs =====
{$M+}
  CMItemCount = LongInt;
  PCMItemCount = ^CMItemCount;

  CMItemIndex = LongInt;
  PCMItemIndex = ^CMItemIndex;

  CMPersistentTrackID = Int32;
  CFTypeRef = Pointer;
  CMAttachmentBearerRef = CFTypeRef;
  CMAttachmentMode = LongWord;
  CFStringRef = Pointer;
  CFAllocatorRef = Pointer;
  CFDictionaryRef = Pointer;
  CMTimeValue = Int64;
  CMTimeScale = Int32;
  CMTimeEpoch = Int64;
  CMTimeFlags = LongWord;

  CMTime = record
    value: CMTimeValue;
    timescale: CMTimeScale;
    flags: CMTimeFlags;
    epoch: CMTimeEpoch;
  end;

  PCMTime = ^CMTime;

  CMTimeRoundingMethod = LongWord;
  CMClockRef = Pointer;
  CMTimebaseRef = Pointer;
  CMClockOrTimebaseRef = CFTypeRef;
  CFTypeID = LongWord;
  OSStatus = Int32;
  Boolean = Byte;
  CFRunLoopTimerRef = Pointer;
  CFRunLoopRef = Pointer;
  CMBlockBufferFlags = LongWord;
  CMBlockBufferRef = Pointer;
  __darwin_size_t = LongWord;
  TCoreMediaAllocateBlock = function(param1: Pointer; param2: LongWord)
    : Pointer; cdecl;
  TCoreMediaFreeBlock = procedure(param1: Pointer; param2: Pointer;
    param3: LongWord); cdecl;

  CMBlockBufferCustomBlockSource = record
    version: LongWord;
    AllocateBlock: TCoreMediaAllocateBlock;
    FreeBlock: TCoreMediaFreeBlock;
    refCon: Pointer;
  end;

  PCMBlockBufferCustomBlockSource = ^CMBlockBufferCustomBlockSource;

  CMBufferQueueRef = Pointer;
  CMBufferRef = CFTypeRef;
  CMBufferGetTimeCallback = function(param1: CMBufferRef; param2: Pointer)
    : CMTime; cdecl;
  CMBufferGetBooleanCallback = function(param1: CMBufferRef; param2: Pointer)
    : Boolean; cdecl;
  CFIndex = LongInt;
  CFComparisonResult = CFIndex;
  CMBufferCompareCallback = function(param1: CMBufferRef; param2: CMBufferRef;
    param3: Pointer): CFComparisonResult; cdecl;
  CMBufferGetSizeCallback = function(param1: CMBufferRef; param2: Pointer)
    : LongWord; cdecl;

  CMBufferCallbacks = record
    version: LongWord;
    refCon: Pointer;
    getDecodeTimeStamp: CMBufferGetTimeCallback;
    getPresentationTimeStamp: CMBufferGetTimeCallback;
    getDuration: CMBufferGetTimeCallback;
    isDataReady: CMBufferGetBooleanCallback;
    compare: CMBufferCompareCallback;
    dataBecameReadyNotification: CFStringRef;
    getSize: CMBufferGetSizeCallback;
  end;

  PCMBufferCallbacks = ^CMBufferCallbacks;

  TCoreMediaCallback = procedure(param1: CMBufferRef; param2: Pointer); cdecl;
  CMBufferQueueTriggerToken = Pointer;
  CMBufferQueueTriggerCallback = procedure(param1: Pointer;
    param2: CMBufferQueueTriggerToken); cdecl;
  CMBufferQueueTriggerCondition = Int32;
  TCoreMediaCallback1 = function(param1: CMBufferRef; param2: Pointer)
    : OSStatus; cdecl;
  CMBufferValidationCallback = function(param1: CMBufferQueueRef;
    param2: CMBufferRef; param3: Pointer): OSStatus; cdecl;
  CMFormatDescriptionRef = Pointer;
  FourCharCode = UInt32;
  CMMediaType = FourCharCode;
  CFPropertyListRef = CFTypeRef;
  CMAudioCodecType = FourCharCode;
  CMAudioFormatDescriptionRef = CMFormatDescriptionRef;
  CFArrayRef = Pointer;
  CMAudioFormatDescriptionMask = LongWord;
  CMVideoFormatDescriptionRef = CMFormatDescriptionRef;
  CMPixelFormatType = FourCharCode;
  CMVideoCodecType = FourCharCode;

  CMVideoDimensions = record
    width: Int32;
    height: Int32;
  end;

  PCMVideoDimensions = ^CMVideoDimensions;

  CVBufferRef = Pointer;
  CVImageBufferRef = CVBufferRef;
  CGFloat = Single;
  CGSize = CGSize = record width: CGFloat;
height:
CGFloat;
end;
PCGSize = ^CGSize;;
CGPoint = CGPoint = record x: CGFloat;
y:
CGFloat;
end;
PCGPoint = ^CGPoint;;
CGRect = CGRect = record origin: CGPoint;
size:
CGSize;
end;
PCGRect = ^CGRect;;
CMMuxedFormatDescriptionRef = CMFormatDescriptionRef;
CMMuxedStreamType = FourCharCode;
CMClosedCaptionFormatDescriptionRef = CMFormatDescriptionRef;
CMClosedCaptionFormatType = FourCharCode;
CMTextFormatDescriptionRef = CMFormatDescriptionRef;
CMTextFormatType = FourCharCode;
CMTextDisplayFlags = LongWord;
CMTextJustificationValue = Int8;
CMSubtitleFormatType = FourCharCode;
CMTimeCodeFormatDescriptionRef = CMFormatDescriptionRef;
CMTimeCodeFormatType = FourCharCode;
CMMetadataFormatDescriptionRef = CMFormatDescriptionRef;
CMMetadataFormatType = FourCharCode;
OSType = FourCharCode;
CFStringEncoding = UInt32;
CMMemoryPoolRef = Pointer;
CMSampleBufferRef = Pointer;

CMSampleTimingInfo = record duration: CMTime;
presentationTimeStamp:
CMTime;
decodeTimeStamp:
CMTime;
end;
PCMSampleTimingInfo = ^CMSampleTimingInfo;

CMSampleBufferMakeDataReadyCallback =
function(param1: CMSampleBufferRef; param2: Pointer): OSStatus;
cdecl;
CFRange = record location: CFIndex;
length:
CFIndex;
end;;
CMSampleBufferInvalidateCallback =
procedure(param1: CMSampleBufferRef; param2: UInt64);
cdecl;
CMSampleBufferInvalidateHandler =
procedure(param1: CMSampleBufferRef) of object;
TCoreMediaCallback2 =
function(param1: CMSampleBufferRef; param2: CMItemCount; param3: Pointer)
  : OSStatus;
cdecl;
TCoreMediaHandler =
function(param1: CMSampleBufferRef; param2: CMItemCount): OSStatus;
cdecl;
CMSimpleQueueRef = Pointer;

CMTimeRange = record start: CMTime;
duration:
CMTime;
end;
PCMTimeRange = ^CMTimeRange;

CMTimeMapping = record source: CMTimeRange;
target:
CMTimeRange;
end;
PCMTimeMapping = ^CMTimeMapping;

// ===== Exported string consts =====

function kCMTimeInvalid: Pointer;
  function kCMTimeIndefinite: Pointer;
    function kCMTimePositiveInfinity: Pointer;
      function kCMTimeNegativeInfinity: Pointer;
        function kCMTimeZero: Pointer;
          function kCMTimeValueKey: Pointer;
            function kCMTimeScaleKey: Pointer;
              function kCMTimeEpochKey: Pointer;
                function kCMTimeFlagsKey: Pointer;
                  function kCMTimebaseNotification_EffectiveRateChanged
                    : Pointer;
                    function kCMTimebaseNotification_TimeJumped: Pointer;
                      function kCMTimebaseNotificationKey_EventTime: Pointer;
                        function kCMFormatDescriptionExtension_OriginalCompressionSettings
                          : Pointer;
                          function kCMFormatDescriptionExtension_SampleDescriptionExtensionAtoms
                            : Pointer;
                            function kCMFormatDescriptionExtension_VerbatimSampleDescription
                              : Pointer;
                              function kCMFormatDescriptionExtension_VerbatimISOSampleEntry
                                : Pointer;
                                function kCMFormatDescriptionExtension_FormatName
                                  : Pointer;
                                  function kCMFormatDescriptionExtension_Depth
                                    : Pointer;
                                    function kCMFormatDescriptionExtension_CleanAperture
                                      : Pointer;
                                      function kCMFormatDescriptionKey_CleanApertureWidth
                                        : Pointer;
                                        function kCMFormatDescriptionKey_CleanApertureHeight
                                        : Pointer;
                                        function kCMFormatDescriptionKey_CleanApertureHorizontalOffset
                                        : Pointer;
                                        function kCMFormatDescriptionKey_CleanApertureVerticalOffset
                                        : Pointer;
                                        function kCMFormatDescriptionKey_CleanApertureWidthRational
                                        : Pointer;
                                        function kCMFormatDescriptionKey_CleanApertureHeightRational
                                        : Pointer;
                                        function kCMFormatDescriptionKey_CleanApertureHorizontalOffsetRational
                                        : Pointer;
                                        function kCMFormatDescriptionKey_CleanApertureVerticalOffsetRational
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_FieldCount
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_FieldDetail
                                        : Pointer;
                                        function kCMFormatDescriptionFieldDetail_TemporalTopFirst
                                        : Pointer;
                                        function kCMFormatDescriptionFieldDetail_TemporalBottomFirst
                                        : Pointer;
                                        function kCMFormatDescriptionFieldDetail_SpatialFirstLineEarly
                                        : Pointer;
                                        function kCMFormatDescriptionFieldDetail_SpatialFirstLineLate
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_PixelAspectRatio
                                        : Pointer;
                                        function kCMFormatDescriptionKey_PixelAspectRatioHorizontalSpacing
                                        : Pointer;
                                        function kCMFormatDescriptionKey_PixelAspectRatioVerticalSpacing
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_ColorPrimaries
                                        : Pointer;
                                        function kCMFormatDescriptionColorPrimaries_ITU_R_709_2
                                        : Pointer;
                                        function kCMFormatDescriptionColorPrimaries_EBU_3213
                                        : Pointer;
                                        function kCMFormatDescriptionColorPrimaries_SMPTE_C
                                        : Pointer;
                                        function kCMFormatDescriptionColorPrimaries_DCI_P3
                                        : Pointer;
                                        function kCMFormatDescriptionColorPrimaries_P3_D65
                                        : Pointer;
                                        function kCMFormatDescriptionColorPrimaries_ITU_R_2020
                                        : Pointer;
                                        function kCMFormatDescriptionColorPrimaries_P22
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_TransferFunction
                                        : Pointer;
                                        function kCMFormatDescriptionTransferFunction_ITU_R_709_2
                                        : Pointer;
                                        function kCMFormatDescriptionTransferFunction_SMPTE_240M_1995
                                        : Pointer;
                                        function kCMFormatDescriptionTransferFunction_UseGamma
                                        : Pointer;
                                        function kCMFormatDescriptionTransferFunction_ITU_R_2020
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_GammaLevel
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_YCbCrMatrix
                                        : Pointer;
                                        function kCMFormatDescriptionYCbCrMatrix_ITU_R_709_2
                                        : Pointer;
                                        function kCMFormatDescriptionYCbCrMatrix_ITU_R_601_4
                                        : Pointer;
                                        function kCMFormatDescriptionYCbCrMatrix_SMPTE_240M_1995
                                        : Pointer;
                                        function kCMFormatDescriptionYCbCrMatrix_ITU_R_2020
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_FullRangeVideo
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_ICCProfile
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_BytesPerRow
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_ChromaLocationTopField
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_ChromaLocationBottomField
                                        : Pointer;
                                        function kCMFormatDescriptionChromaLocation_Left
                                        : Pointer;
                                        function kCMFormatDescriptionChromaLocation_Center
                                        : Pointer;
                                        function kCMFormatDescriptionChromaLocation_TopLeft
                                        : Pointer;
                                        function kCMFormatDescriptionChromaLocation_Top
                                        : Pointer;
                                        function kCMFormatDescriptionChromaLocation_BottomLeft
                                        : Pointer;
                                        function kCMFormatDescriptionChromaLocation_Bottom
                                        : Pointer;
                                        function kCMFormatDescriptionChromaLocation_DV420
                                        : Pointer;
                                        function kCMFormatDescriptionConformsToMPEG2VideoProfile
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_TemporalQuality
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_SpatialQuality
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_VerbatimImageDescription
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_Version
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_RevisionLevel
                                        : Pointer;
                                        function kCMFormatDescriptionExtension_Vendor
                                        : Pointer;
                                        function kCMFormatDescriptionVendor_Apple
                                        : Pointer;
                                        function kCMTextFormatDescriptionExtension_DisplayFlags
                                        : Pointer;
                                        function kCMTextFormatDescriptionExtension_BackgroundColor
                                        : Pointer;
                                        function kCMTextFormatDescriptionColor_Red
                                        : Pointer;
                                        function kCMTextFormatDescriptionColor_Green
                                        : Pointer;
                                        function kCMTextFormatDescriptionColor_Blue
                                        : Pointer;
                                        function kCMTextFormatDescriptionColor_Alpha
                                        : Pointer;
                                        function kCMTextFormatDescriptionExtension_DefaultTextBox
                                        : Pointer;
                                        function kCMTextFormatDescriptionRect_Top
                                        : Pointer;
                                        function kCMTextFormatDescriptionRect_Left
                                        : Pointer;
                                        function kCMTextFormatDescriptionRect_Bottom
                                        : Pointer;
                                        function kCMTextFormatDescriptionRect_Right
                                        : Pointer;
                                        function kCMTextFormatDescriptionExtension_DefaultStyle
                                        : Pointer;
                                        function kCMTextFormatDescriptionStyle_StartChar
                                        : Pointer;
                                        function kCMTextFormatDescriptionStyle_Font
                                        : Pointer;
                                        function kCMTextFormatDescriptionStyle_FontFace
                                        : Pointer;
                                        function kCMTextFormatDescriptionStyle_ForegroundColor
                                        : Pointer;
                                        function kCMTextFormatDescriptionStyle_FontSize
                                        : Pointer;
                                        function kCMTextFormatDescriptionExtension_HorizontalJustification
                                        : Pointer;
                                        function kCMTextFormatDescriptionExtension_VerticalJustification
                                        : Pointer;
                                        function kCMTextFormatDescriptionStyle_EndChar
                                        : Pointer;
                                        function kCMTextFormatDescriptionExtension_FontTable
                                        : Pointer;
                                        function kCMTextFormatDescriptionExtension_TextJustification
                                        : Pointer;
                                        function kCMTextFormatDescriptionStyle_Height
                                        : Pointer;
                                        function kCMTextFormatDescriptionStyle_Ascent
                                        : Pointer;
                                        function kCMTextFormatDescriptionExtension_DefaultFontName
                                        : Pointer;
                                        function kCMTimeCodeFormatDescriptionExtension_SourceReferenceName
                                        : Pointer;
                                        function kCMTimeCodeFormatDescriptionKey_Value
                                        : Pointer;
                                        function kCMTimeCodeFormatDescriptionKey_LangCode
                                        : Pointer;
                                        function kCMFormatDescriptionExtensionKey_MetadataKeyTable
                                        : Pointer;
                                        function kCMMetadataFormatDescriptionKey_Namespace
                                        : Pointer;
                                        function kCMMetadataFormatDescriptionKey_Value
                                        : Pointer;
                                        function kCMMetadataFormatDescriptionKey_LocalID
                                        : Pointer;
                                        function kCMMetadataFormatDescriptionKey_DataType
                                        : Pointer;
                                        function kCMMetadataFormatDescriptionKey_DataTypeNamespace
                                        : Pointer;
                                        function kCMMetadataFormatDescriptionKey_ConformingDataTypes
                                        : Pointer;
                                        function kCMMetadataFormatDescriptionKey_LanguageTag
                                        : Pointer;
                                        function kCMMetadataFormatDescriptionKey_StructuralDependency
                                        : Pointer;
                                        function kCMMetadataFormatDescription_StructuralDependencyKey_DependencyIsInvalidFlag
                                        : Pointer;
                                        function kCMMetadataFormatDescriptionMetadataSpecificationKey_Identifier
                                        : Pointer;
                                        function kCMMetadataFormatDescriptionMetadataSpecificationKey_DataType
                                        : Pointer;
                                        function kCMMetadataFormatDescriptionMetadataSpecificationKey_ExtendedLanguageTag
                                        : Pointer;
                                        function kCMMetadataFormatDescriptionMetadataSpecificationKey_StructuralDependency
                                        : Pointer;
                                        function kCMImageDescriptionFlavor_QuickTimeMovie
                                        : Pointer;
                                        function kCMImageDescriptionFlavor_ISOFamily
                                        : Pointer;
                                        function kCMImageDescriptionFlavor_3GPFamily
                                        : Pointer;
                                        function kCMSoundDescriptionFlavor_QuickTimeMovie
                                        : Pointer;
                                        function kCMSoundDescriptionFlavor_QuickTimeMovieV2
                                        : Pointer;
                                        function kCMSoundDescriptionFlavor_ISOFamily
                                        : Pointer;
                                        function kCMSoundDescriptionFlavor_3GPFamily
                                        : Pointer;
                                        function kCMMemoryPoolOption_AgeOutPeriod
                                        : Pointer;
                                        function kCMMetadataKeySpace_QuickTimeUserData
                                        : Pointer;
                                        function kCMMetadataKeySpace_ISOUserData
                                        : Pointer;
                                        function kCMMetadataKeySpace_QuickTimeMetadata
                                        : Pointer;
                                        function kCMMetadataKeySpace_iTunes
                                        : Pointer;
                                        function kCMMetadataKeySpace_ID3
                                        : Pointer;
                                        function kCMMetadataKeySpace_Icy
                                        : Pointer;
                                        function kCMMetadataKeySpace_HLSDateRange
                                        : Pointer;
                                        function kCMMetadataIdentifier_QuickTimeMetadataLocation_ISO6709
                                        : Pointer;
                                        function kCMMetadataIdentifier_QuickTimeMetadataDirection_Facing
                                        : Pointer;
                                        function kCMMetadataIdentifier_QuickTimeMetadataPreferredAffineTransform
                                        : Pointer;
                                        function kCMMetadataIdentifier_QuickTimeMetadataVideoOrientation
                                        : Pointer;
                                        function kCMMetadataBaseDataType_RawData
                                        : Pointer;
                                        function kCMMetadataBaseDataType_UTF8
                                        : Pointer;
                                        function kCMMetadataBaseDataType_UTF16
                                        : Pointer;
                                        function kCMMetadataBaseDataType_GIF
                                        : Pointer;
                                        function kCMMetadataBaseDataType_JPEG
                                        : Pointer;
                                        function kCMMetadataBaseDataType_PNG
                                        : Pointer;
                                        function kCMMetadataBaseDataType_BMP
                                        : Pointer;
                                        function kCMMetadataBaseDataType_Float32
                                        : Pointer;
                                        function kCMMetadataBaseDataType_Float64
                                        : Pointer;
                                        function kCMMetadataBaseDataType_SInt8
                                        : Pointer;
                                        function kCMMetadataBaseDataType_SInt16
                                        : Pointer;
                                        function kCMMetadataBaseDataType_SInt32
                                        : Pointer;
                                        function kCMMetadataBaseDataType_SInt64
                                        : Pointer;
                                        function kCMMetadataBaseDataType_UInt8
                                        : Pointer;
                                        function kCMMetadataBaseDataType_UInt16
                                        : Pointer;
                                        function kCMMetadataBaseDataType_UInt32
                                        : Pointer;
                                        function kCMMetadataBaseDataType_UInt64
                                        : Pointer;
                                        function kCMMetadataBaseDataType_PointF32
                                        : Pointer;
                                        function kCMMetadataBaseDataType_DimensionsF32
                                        : Pointer;
                                        function kCMMetadataBaseDataType_RectF32
                                        : Pointer;
                                        function kCMMetadataBaseDataType_AffineTransformF64
                                        : Pointer;
                                        function kCMMetadataBaseDataType_PolygonF32
                                        : Pointer;
                                        function kCMMetadataBaseDataType_PolylineF32
                                        : Pointer;
                                        function kCMMetadataBaseDataType_JSON
                                        : Pointer;
                                        function kCMMetadataDataType_QuickTimeMetadataLocation_ISO6709
                                        : Pointer;
                                        function kCMMetadataDataType_QuickTimeMetadataDirection
                                        : Pointer;
                                        function kCMTimingInfoInvalid: Pointer;
                                        function kCMSampleBufferNotification_DataBecameReady
                                        : Pointer;
                                        function kCMSampleBufferNotification_DataFailed
                                        : Pointer;
                                        function kCMSampleBufferNotificationParameter_OSStatus
                                        : Pointer;
                                        function kCMSampleBufferConduitNotification_InhibitOutputUntil
                                        : Pointer;
                                        function kCMSampleBufferConduitNotificationParameter_ResumeTag
                                        : Pointer;
                                        function kCMSampleBufferConduitNotification_ResetOutput
                                        : Pointer;
                                        function kCMSampleBufferConduitNotification_UpcomingOutputPTSRangeChanged
                                        : Pointer;
                                        function kCMSampleBufferConduitNotificationParameter_UpcomingOutputPTSRangeMayOverlapQueuedOutputPTSRange
                                        : Pointer;
                                        function kCMSampleBufferConduitNotificationParameter_MinUpcomingOutputPTS
                                        : Pointer;
                                        function kCMSampleBufferConduitNotificationParameter_MaxUpcomingOutputPTS
                                        : Pointer;
                                        function kCMSampleBufferConsumerNotification_BufferConsumed
                                        : Pointer;
                                        function kCMSampleAttachmentKey_NotSync
                                        : Pointer;
                                        function kCMSampleAttachmentKey_PartialSync
                                        : Pointer;
                                        function kCMSampleAttachmentKey_HasRedundantCoding
                                        : Pointer;
                                        function kCMSampleAttachmentKey_IsDependedOnByOthers
                                        : Pointer;
                                        function kCMSampleAttachmentKey_DependsOnOthers
                                        : Pointer;
                                        function kCMSampleAttachmentKey_EarlierDisplayTimesAllowed
                                        : Pointer;
                                        function kCMSampleAttachmentKey_DisplayImmediately
                                        : Pointer;
                                        function kCMSampleAttachmentKey_DoNotDisplay
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_ResetDecoderBeforeDecoding
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_DrainAfterDecoding
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_PostNotificationWhenConsumed
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_ResumeOutput
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_TransitionID
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_TrimDurationAtStart
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_TrimDurationAtEnd
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_SpeedMultiplier
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_Reverse
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_FillDiscontinuitiesWithSilence
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_EmptyMedia
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_PermanentEmptyMedia
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_DisplayEmptyMediaImmediately
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_EndsPreviousSampleDuration
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_SampleReferenceURL
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_SampleReferenceByteOffset
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_GradualDecoderRefresh
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_DroppedFrameReason
                                        : Pointer;
                                        function kCMSampleBufferDroppedFrameReason_FrameWasLate
                                        : Pointer;
                                        function kCMSampleBufferDroppedFrameReason_OutOfBuffers
                                        : Pointer;
                                        function kCMSampleBufferDroppedFrameReason_Discontinuity
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_DroppedFrameReasonInfo
                                        : Pointer;
                                        function kCMSampleBufferDroppedFrameReasonInfo_CameraModeSwitch
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_StillImageLensStabilizationInfo
                                        : Pointer;
                                        function kCMSampleBufferLensStabilizationInfo_Active
                                        : Pointer;
                                        function kCMSampleBufferLensStabilizationInfo_OutOfRange
                                        : Pointer;
                                        function kCMSampleBufferLensStabilizationInfo_Unavailable
                                        : Pointer;
                                        function kCMSampleBufferLensStabilizationInfo_Off
                                        : Pointer;
                                        function kCMSampleBufferAttachmentKey_ForceKeyFrame
                                        : Pointer;
                                        function kCMTextMarkupAttribute_ForegroundColorARGB
                                        : Pointer;
                                        function kCMTextMarkupAttribute_BackgroundColorARGB
                                        : Pointer;
                                        function kCMTextMarkupAttribute_CharacterBackgroundColorARGB
                                        : Pointer;
                                        function kCMTextMarkupAttribute_BoldStyle
                                        : Pointer;
                                        function kCMTextMarkupAttribute_ItalicStyle
                                        : Pointer;
                                        function kCMTextMarkupAttribute_UnderlineStyle
                                        : Pointer;
                                        function kCMTextMarkupAttribute_FontFamilyName
                                        : Pointer;
                                        function kCMTextMarkupAttribute_GenericFontFamilyName
                                        : Pointer;
                                        function kCMTextMarkupGenericFontName_Default
                                        : Pointer;
                                        function kCMTextMarkupGenericFontName_Serif
                                        : Pointer;
                                        function kCMTextMarkupGenericFontName_SansSerif
                                        : Pointer;
                                        function kCMTextMarkupGenericFontName_Monospace
                                        : Pointer;
                                        function kCMTextMarkupGenericFontName_ProportionalSerif
                                        : Pointer;
                                        function kCMTextMarkupGenericFontName_ProportionalSansSerif
                                        : Pointer;
                                        function kCMTextMarkupGenericFontName_MonospaceSerif
                                        : Pointer;
                                        function kCMTextMarkupGenericFontName_MonospaceSansSerif
                                        : Pointer;
                                        function kCMTextMarkupGenericFontName_Casual
                                        : Pointer;
                                        function kCMTextMarkupGenericFontName_Cursive
                                        : Pointer;
                                        function kCMTextMarkupGenericFontName_Fantasy
                                        : Pointer;
                                        function kCMTextMarkupGenericFontName_SmallCapital
                                        : Pointer;
                                        function kCMTextMarkupAttribute_BaseFontSizePercentageRelativeToVideoHeight
                                        : Pointer;
                                        function kCMTextMarkupAttribute_RelativeFontSize
                                        : Pointer;
                                        function kCMTextMarkupAttribute_VerticalLayout
                                        : Pointer;
                                        function kCMTextVerticalLayout_LeftToRight
                                        : Pointer;
                                        function kCMTextVerticalLayout_RightToLeft
                                        : Pointer;
                                        function kCMTextMarkupAttribute_Alignment
                                        : Pointer;
                                        function kCMTextMarkupAlignmentType_Start
                                        : Pointer;
                                        function kCMTextMarkupAlignmentType_Middle
                                        : Pointer;
                                        function kCMTextMarkupAlignmentType_End
                                        : Pointer;
                                        function kCMTextMarkupAlignmentType_Left
                                        : Pointer;
                                        function kCMTextMarkupAlignmentType_Right
                                        : Pointer;
                                        function kCMTextMarkupAttribute_TextPositionPercentageRelativeToWritingDirection
                                        : Pointer;
                                        function kCMTextMarkupAttribute_OrthogonalLinePositionPercentageRelativeToWritingDirection
                                        : Pointer;
                                        function kCMTextMarkupAttribute_WritingDirectionSizePercentage
                                        : Pointer;
                                        function kCMTextMarkupAttribute_CharacterEdgeStyle
                                        : Pointer;
                                        function kCMTextMarkupCharacterEdgeStyle_None
                                        : Pointer;
                                        function kCMTextMarkupCharacterEdgeStyle_Raised
                                        : Pointer;
                                        function kCMTextMarkupCharacterEdgeStyle_Depressed
                                        : Pointer;
                                        function kCMTextMarkupCharacterEdgeStyle_Uniform
                                        : Pointer;
                                        function kCMTextMarkupCharacterEdgeStyle_DropShadow
                                        : Pointer;
                                        function kCMTimeRangeZero: Pointer;
                                        function kCMTimeRangeInvalid: Pointer;
                                        function kCMTimeRangeStartKey: Pointer;
                                        function kCMTimeRangeDurationKey
                                        : Pointer;
                                        function kCMTimeMappingInvalid: Pointer;
                                        function kCMTimeMappingSourceKey
                                        : Pointer;
                                        function kCMTimeMappingTargetKey
                                        : Pointer;


                                        // ===== External functions =====

                                        const
                                        libCoreMedia =
                                        '/System/Library/Frameworks/CoreMedia.framework/CoreMedia';
                                        procedure CMSetAttachment
                                        (target: CMAttachmentBearerRef;
                                        key: CFStringRef; value: CFTypeRef;
                                        attachmentMode: CMAttachmentMode);
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSetAttachment';
                                        function CMGetAttachment
                                        (target: CMAttachmentBearerRef;
                                        key: CFStringRef;
                                        attachmentModeOut: PLongWord)
                                        : CFTypeRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMGetAttachment';
                                        procedure CMRemoveAttachment
                                        (target: CMAttachmentBearerRef;
                                        key: CFStringRef); cdecl;
                                        external libCoreMedia name _PU +
                                        'CMRemoveAttachment';
                                        procedure CMRemoveAllAttachments
                                        (target: CMAttachmentBearerRef); cdecl;
                                        external libCoreMedia name _PU +
                                        'CMRemoveAllAttachments';
                                        function CMCopyDictionaryOfAttachments
                                        (allocator: CFAllocatorRef;
                                        target: CMAttachmentBearerRef;
                                        attachmentMode: CMAttachmentMode)
                                        : CFDictionaryRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMCopyDictionaryOfAttachments';
                                        procedure CMSetAttachments
                                        (target: CMAttachmentBearerRef;
                                        theAttachments: CFDictionaryRef;
                                        attachmentMode: CMAttachmentMode);
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSetAttachments';
                                        procedure CMPropagateAttachments
                                        (source: CMAttachmentBearerRef;
                                        destination: CMAttachmentBearerRef);
                                        cdecl; external libCoreMedia name _PU +
                                        'CMPropagateAttachments';
                                        function CMTimeMake(value: Int64;
                                        timescale: Int32): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeMake';
                                        function CMTimeMakeWithEpoch
                                        (value: Int64; timescale: Int32;
                                        epoch: Int64): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeMakeWithEpoch';
                                        function CMTimeMakeWithSeconds
                                        (seconds: Double;
                                        preferredTimeScale: Int32): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimeMakeWithSeconds';
                                        function CMTimeGetSeconds(time: CMTime)
                                        : Double; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeGetSeconds';
                                        function CMTimeConvertScale
                                        (time: CMTime; newTimescale: Int32;
                                        method: CMTimeRoundingMethod): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimeConvertScale';
                                        function CMTimeAdd(addend1: CMTime;
                                        addend2: CMTime): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeAdd';
                                        function CMTimeSubtract(minuend: CMTime;
                                        subtrahend: CMTime): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeSubtract';
                                        function CMTimeMultiply(time: CMTime;
                                        multiplier: Int32): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeMultiply';
                                        function CMTimeMultiplyByFloat64
                                        (time: CMTime; multiplier: Double)
                                        : CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeMultiplyByFloat64';
                                        function CMTimeMultiplyByRatio
                                        (time: CMTime; multiplier: Int32;
                                        divisor: Int32): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeMultiplyByRatio';
                                        function CMTimeCompare(time1: CMTime;
                                        time2: CMTime): Int32; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeCompare';
                                        function CMTimeMinimum(time1: CMTime;
                                        time2: CMTime): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeMinimum';
                                        function CMTimeMaximum(time1: CMTime;
                                        time2: CMTime): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeMaximum';
                                        function CMTimeAbsoluteValue
                                        (time: CMTime): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeAbsoluteValue';
                                        function CMTimeCopyAsDictionary
                                        (time: CMTime;
                                        allocator: CFAllocatorRef)
                                        : CFDictionaryRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeCopyAsDictionary';
                                        function CMTimeMakeFromDictionary
                                        (dict: CFDictionaryRef): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeMakeFromDictionary';
                                        function CMTimeCopyDescription
                                        (allocator: CFAllocatorRef;
                                        time: CMTime): CFStringRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeCopyDescription';
                                        procedure CMTimeShow(time: CMTime);
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimeShow';
                                        function CMClockGetTypeID: CFTypeID;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMClockGetTypeID';
                                        function CMClockGetHostTimeClock
                                        : CMClockRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMClockGetHostTimeClock';
                                        function CMClockConvertHostTimeToSystemUnits
                                        (hostTime: CMTime): UInt64; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMClockConvertHostTimeToSystemUnits';
                                        function CMClockMakeHostTimeFromSystemUnits
                                        (hostTime: UInt64): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMClockMakeHostTimeFromSystemUnits';
                                        function CMClockGetTime
                                        (clock: CMClockRef): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMClockGetTime';
                                        function CMClockGetAnchorTime
                                        (clock: CMClockRef;
                                        outClockTime: Pointer;
                                        outReferenceClockTime: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMClockGetAnchorTime';
                                        function CMClockMightDrift
                                        (clock: CMClockRef;
                                        otherClock: CMClockRef): Boolean; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMClockMightDrift';
                                        procedure CMClockInvalidate
                                        (clock: CMClockRef); cdecl;
                                        external libCoreMedia name _PU +
                                        'CMClockInvalidate';
                                        function CMTimebaseGetTypeID: CFTypeID;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseGetTypeID';
                                        function CMTimebaseCreateWithMasterClock
                                        (allocator: CFAllocatorRef;
                                        masterClock: CMClockRef;
                                        timebaseOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseCreateWithMasterClock';
                                        function CMTimebaseCreateWithMasterTimebase
                                        (allocator: CFAllocatorRef;
                                        masterTimebase: CMTimebaseRef;
                                        timebaseOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseCreateWithMasterTimebase';
                                        function CMTimebaseCopyMasterTimebase
                                        (timebase: CMTimebaseRef)
                                        : CMTimebaseRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseCopyMasterTimebase';
                                        function CMTimebaseCopyMasterClock
                                        (timebase: CMTimebaseRef): CMClockRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseCopyMasterClock';
                                        function CMTimebaseCopyMaster
                                        (timebase: CMTimebaseRef)
                                        : CMClockOrTimebaseRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseCopyMaster';
                                        function CMTimebaseCopyUltimateMasterClock
                                        (timebase: CMTimebaseRef): CMClockRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseCopyUltimateMasterClock';
                                        function CMTimebaseGetMasterTimebase
                                        (timebase: CMTimebaseRef)
                                        : CMTimebaseRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseGetMasterTimebase';
                                        function CMTimebaseGetMasterClock
                                        (timebase: CMTimebaseRef): CMClockRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseGetMasterClock';
                                        function CMTimebaseGetMaster
                                        (timebase: CMTimebaseRef)
                                        : CMClockOrTimebaseRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseGetMaster';
                                        function CMTimebaseGetUltimateMasterClock
                                        (timebase: CMTimebaseRef): CMClockRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseGetUltimateMasterClock';
                                        function CMTimebaseGetTime
                                        (timebase: CMTimebaseRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseGetTime';
                                        function CMTimebaseGetTimeWithTimeScale
                                        (timebase: CMTimebaseRef;
                                        timescale: CMTimeScale;
                                        method: CMTimeRoundingMethod): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseGetTimeWithTimeScale';
                                        function CMTimebaseSetTime
                                        (timebase: CMTimebaseRef; time: CMTime)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseSetTime';
                                        function CMTimebaseSetAnchorTime
                                        (timebase: CMTimebaseRef;
                                        timebaseTime: CMTime;
                                        immediateMasterTime: CMTime): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseSetAnchorTime';
                                        function CMTimebaseGetRate
                                        (timebase: CMTimebaseRef): Double;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseGetRate';
                                        function CMTimebaseGetTimeAndRate
                                        (timebase: CMTimebaseRef;
                                        outTime: Pointer; outRate: PDouble)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseGetTimeAndRate';
                                        function CMTimebaseSetRate
                                        (timebase: CMTimebaseRef; rate: Double)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseSetRate';
                                        function CMTimebaseSetRateAndAnchorTime
                                        (timebase: CMTimebaseRef; rate: Double;
                                        timebaseTime: CMTime;
                                        immediateMasterTime: CMTime): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseSetRateAndAnchorTime';
                                        function CMTimebaseGetEffectiveRate
                                        (timebase: CMTimebaseRef): Double;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseGetEffectiveRate';
                                        function CMTimebaseAddTimer
                                        (timebase: CMTimebaseRef;
                                        timer: CFRunLoopTimerRef;
                                        runloop: CFRunLoopRef): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseAddTimer';
                                        function CMTimebaseRemoveTimer
                                        (timebase: CMTimebaseRef;
                                        timer: CFRunLoopTimerRef): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseRemoveTimer';
                                        function CMTimebaseSetTimerNextFireTime
                                        (timebase: CMTimebaseRef;
                                        timer: CFRunLoopTimerRef;
                                        fireTime: CMTime; flags: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseSetTimerNextFireTime';
                                        function CMTimebaseSetTimerToFireImmediately
                                        (timebase: CMTimebaseRef;
                                        timer: CFRunLoopTimerRef): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseSetTimerToFireImmediately';
                                        function CMTimebaseAddTimerDispatchSource
                                        (timebase: CMTimebaseRef;
                                        timerSource
                                        : Pointer { dispatch_source_t } )
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseAddTimerDispatchSource';
                                        function CMTimebaseRemoveTimerDispatchSource
                                        (timebase: CMTimebaseRef;
                                        timerSource
                                        : Pointer { dispatch_source_t } )
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseRemoveTimerDispatchSource';
                                        function CMTimebaseSetTimerDispatchSourceNextFireTime
                                        (timebase: CMTimebaseRef;
                                        timerSource
                                        : Pointer { dispatch_source_t };
                                        fireTime: CMTime; flags: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseSetTimerDispatchSourceNextFireTime';
                                        function CMTimebaseSetTimerDispatchSourceToFireImmediately
                                        (timebase: CMTimebaseRef;
                                        timerSource
                                        : Pointer { dispatch_source_t } )
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimebaseSetTimerDispatchSourceToFireImmediately';
                                        function CMSyncGetRelativeRate
                                        (ofClockOrTimebase
                                        : CMClockOrTimebaseRef;
                                        relativeToClockOrTimebase
                                        : CMClockOrTimebaseRef): Double; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSyncGetRelativeRate';
                                        function CMSyncGetRelativeRateAndAnchorTime
                                        (ofClockOrTimebase
                                        : CMClockOrTimebaseRef;
                                        relativeToClockOrTimebase
                                        : CMClockOrTimebaseRef;
                                        outRelativeRate: PDouble;
                                        outOfClockOrTimebaseAnchorTime: Pointer;
                                        outRelativeToClockOrTimebaseAnchorTime
                                        : Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSyncGetRelativeRateAndAnchorTime';
                                        function CMSyncConvertTime(time: CMTime;
                                        fromClockOrTimebase
                                        : CMClockOrTimebaseRef;
                                        toClockOrTimebase: CMClockOrTimebaseRef)
                                        : CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSyncConvertTime';
                                        function CMSyncMightDrift
                                        (clockOrTimebase1: CMClockOrTimebaseRef;
                                        clockOrTimebase2: CMClockOrTimebaseRef)
                                        : Boolean; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSyncMightDrift';
                                        function CMSyncGetTime(clockOrTimebase
                                        : CMClockOrTimebaseRef): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSyncGetTime';
                                        function CMTimebaseNotificationBarrier
                                        (timebase: CMTimebaseRef): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimebaseNotificationBarrier';
                                        function CMAudioClockCreate
                                        (allocator: CFAllocatorRef;
                                        clockOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMAudioClockCreate';
                                        function CMBlockBufferCreateEmpty
                                        (structureAllocator: CFAllocatorRef;
                                        subBlockCapacity: LongWord;
                                        flags: CMBlockBufferFlags;
                                        newBBufOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBlockBufferCreateEmpty';
                                        function CMBlockBufferCreateWithMemoryBlock
                                        (structureAllocator: CFAllocatorRef;
                                        memoryBlock: Pointer;
                                        blockLength: LongWord;
                                        blockAllocator: CFAllocatorRef;
                                        customBlockSource: Pointer;
                                        offsetToData: LongWord;
                                        dataLength: LongWord;
                                        flags: CMBlockBufferFlags;
                                        newBBufOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBlockBufferCreateWithMemoryBlock';
                                        function CMBlockBufferCreateWithBufferReference
                                        (structureAllocator: CFAllocatorRef;
                                        targetBuffer: CMBlockBufferRef;
                                        offsetToData: LongWord;
                                        dataLength: LongWord;
                                        flags: CMBlockBufferFlags;
                                        newBBufOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBlockBufferCreateWithBufferReference';
                                        function CMBlockBufferCreateContiguous
                                        (structureAllocator: CFAllocatorRef;
                                        sourceBuffer: CMBlockBufferRef;
                                        blockAllocator: CFAllocatorRef;
                                        customBlockSource: Pointer;
                                        offsetToData: LongWord;
                                        dataLength: LongWord;
                                        flags: CMBlockBufferFlags;
                                        newBBufOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBlockBufferCreateContiguous';
                                        function CMBlockBufferGetTypeID
                                        : CFTypeID; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBlockBufferGetTypeID';
                                        function CMBlockBufferAppendMemoryBlock
                                        (theBuffer: CMBlockBufferRef;
                                        memoryBlock: Pointer;
                                        blockLength: LongWord;
                                        blockAllocator: CFAllocatorRef;
                                        customBlockSource: Pointer;
                                        offsetToData: LongWord;
                                        dataLength: LongWord;
                                        flags: CMBlockBufferFlags): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBlockBufferAppendMemoryBlock';
                                        function CMBlockBufferAppendBufferReference
                                        (theBuffer: CMBlockBufferRef;
                                        targetBBuf: CMBlockBufferRef;
                                        offsetToData: LongWord;
                                        dataLength: LongWord;
                                        flags: CMBlockBufferFlags): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBlockBufferAppendBufferReference';
                                        function CMBlockBufferAssureBlockMemory
                                        (theBuffer: CMBlockBufferRef): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBlockBufferAssureBlockMemory';
                                        function CMBlockBufferAccessDataBytes
                                        (theBuffer: CMBlockBufferRef;
                                        offset: LongWord; length: LongWord;
                                        temporaryBlock: Pointer;
                                        returnedPointer: MarshaledAString)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBlockBufferAccessDataBytes';
                                        function CMBlockBufferCopyDataBytes
                                        (theSourceBuffer: CMBlockBufferRef;
                                        offsetToData: LongWord;
                                        dataLength: LongWord;
                                        destination: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBlockBufferCopyDataBytes';
                                        function CMBlockBufferReplaceDataBytes
                                        (sourceBytes: Pointer;
                                        destinationBuffer: CMBlockBufferRef;
                                        offsetIntoDestination: LongWord;
                                        dataLength: LongWord): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBlockBufferReplaceDataBytes';
                                        function CMBlockBufferFillDataBytes
                                        (fillByte: Byte;
                                        destinationBuffer: CMBlockBufferRef;
                                        offsetIntoDestination: LongWord;
                                        dataLength: LongWord): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBlockBufferFillDataBytes';
                                        function CMBlockBufferGetDataPointer
                                        (theBuffer: CMBlockBufferRef;
                                        offset: LongWord;
                                        lengthAtOffset: PLongWord;
                                        totalLength: PLongWord;
                                        dataPointer: MarshaledAString)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBlockBufferGetDataPointer';
                                        function CMBlockBufferGetDataLength
                                        (theBuffer: CMBlockBufferRef): LongWord;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBlockBufferGetDataLength';
                                        function CMBlockBufferIsRangeContiguous
                                        (theBuffer: CMBlockBufferRef;
                                        offset: LongWord; length: LongWord)
                                        : Boolean; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBlockBufferIsRangeContiguous';
                                        function CMBlockBufferIsEmpty
                                        (theBuffer: CMBlockBufferRef): Boolean;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBlockBufferIsEmpty';
                                        function CMBufferQueueGetCallbacksForUnsortedSampleBuffers
                                        : Pointer; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBufferQueueGetCallbacksForUnsortedSampleBuffers';
                                        function CMBufferQueueGetCallbacksForSampleBuffersSortedByOutputPTS
                                        : Pointer; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBufferQueueGetCallbacksForSampleBuffersSortedByOutputPTS';
                                        function CMBufferQueueCreate
                                        (allocator: CFAllocatorRef;
                                        capacity: CMItemCount;
                                        callbacks: Pointer; queueOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBufferQueueCreate';
                                        function CMBufferQueueGetTypeID
                                        : CFTypeID; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBufferQueueGetTypeID';
                                        function CMBufferQueueEnqueue
                                        (queue: CMBufferQueueRef;
                                        buf: CMBufferRef): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBufferQueueEnqueue';
                                        function CMBufferQueueDequeueAndRetain
                                        (queue: CMBufferQueueRef): CMBufferRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueDequeueAndRetain';
                                        function CMBufferQueueDequeueIfDataReadyAndRetain
                                        (queue: CMBufferQueueRef): CMBufferRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueDequeueIfDataReadyAndRetain';
                                        function CMBufferQueueGetHead
                                        (queue: CMBufferQueueRef): CMBufferRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueGetHead';
                                        function CMBufferQueueIsEmpty
                                        (queue: CMBufferQueueRef): Boolean;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueIsEmpty';
                                        function CMBufferQueueMarkEndOfData
                                        (queue: CMBufferQueueRef): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueMarkEndOfData';
                                        function CMBufferQueueContainsEndOfData
                                        (queue: CMBufferQueueRef): Boolean;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueContainsEndOfData';
                                        function CMBufferQueueIsAtEndOfData
                                        (queue: CMBufferQueueRef): Boolean;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueIsAtEndOfData';
                                        function CMBufferQueueReset
                                        (queue: CMBufferQueueRef): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueReset';
                                        function CMBufferQueueResetWithCallback
                                        (queue: CMBufferQueueRef;
                                        callback: TCoreMediaCallback;
                                        refCon: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBufferQueueResetWithCallback';
                                        function CMBufferQueueGetBufferCount
                                        (queue: CMBufferQueueRef): CMItemCount;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueGetBufferCount';
                                        function CMBufferQueueGetDuration
                                        (queue: CMBufferQueueRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueGetDuration';
                                        function CMBufferQueueGetMinDecodeTimeStamp
                                        (queue: CMBufferQueueRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueGetMinDecodeTimeStamp';
                                        function CMBufferQueueGetFirstDecodeTimeStamp
                                        (queue: CMBufferQueueRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueGetFirstDecodeTimeStamp';
                                        function CMBufferQueueGetMinPresentationTimeStamp
                                        (queue: CMBufferQueueRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueGetMinPresentationTimeStamp';
                                        function CMBufferQueueGetFirstPresentationTimeStamp
                                        (queue: CMBufferQueueRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueGetFirstPresentationTimeStamp';
                                        function CMBufferQueueGetMaxPresentationTimeStamp
                                        (queue: CMBufferQueueRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueGetMaxPresentationTimeStamp';
                                        function CMBufferQueueGetEndPresentationTimeStamp
                                        (queue: CMBufferQueueRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueGetEndPresentationTimeStamp';
                                        function CMBufferQueueGetTotalSize
                                        (queue: CMBufferQueueRef): LongWord;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueGetTotalSize';
                                        function CMBufferQueueInstallTrigger
                                        (queue: CMBufferQueueRef;
                                        triggerCallback
                                        : CMBufferQueueTriggerCallback;
                                        triggerRefcon: Pointer;
                                        triggerCondition
                                        : CMBufferQueueTriggerCondition;
                                        triggerTime: CMTime;
                                        triggerTokenOut: Pointer): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueInstallTrigger';
                                        function CMBufferQueueInstallTriggerWithIntegerThreshold
                                        (queue: CMBufferQueueRef;
                                        triggerCallback
                                        : CMBufferQueueTriggerCallback;
                                        triggerRefcon: Pointer;
                                        triggerCondition
                                        : CMBufferQueueTriggerCondition;
                                        triggerThreshold: CMItemCount;
                                        triggerTokenOut: Pointer): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueInstallTriggerWithIntegerThreshold';
                                        function CMBufferQueueRemoveTrigger
                                        (queue: CMBufferQueueRef;
                                        triggerToken: CMBufferQueueTriggerToken)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBufferQueueRemoveTrigger';
                                        function CMBufferQueueTestTrigger
                                        (queue: CMBufferQueueRef;
                                        triggerToken: CMBufferQueueTriggerToken)
                                        : Boolean; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBufferQueueTestTrigger';
                                        function CMBufferQueueCallForEachBuffer
                                        (queue: CMBufferQueueRef;
                                        callback: TCoreMediaCallback1;
                                        refCon: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMBufferQueueCallForEachBuffer';
                                        function CMBufferQueueSetValidationCallback
                                        (queue: CMBufferQueueRef;
                                        validationCallback
                                        : CMBufferValidationCallback;
                                        validationRefCon: Pointer): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMBufferQueueSetValidationCallback';
                                        function CMFormatDescriptionCreate
                                        (allocator: CFAllocatorRef;
                                        mediaType: CMMediaType;
                                        mediaSubtype: FourCharCode;
                                        extensions: CFDictionaryRef;
                                        descOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMFormatDescriptionCreate';
                                        function CMFormatDescriptionGetTypeID
                                        : CFTypeID; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMFormatDescriptionGetTypeID';
                                        function CMFormatDescriptionEqual
                                        (desc1: CMFormatDescriptionRef;
                                        desc2: CMFormatDescriptionRef): Boolean;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMFormatDescriptionEqual';
                                        function CMFormatDescriptionEqualIgnoringExtensionKeys
                                        (desc1: CMFormatDescriptionRef;
                                        desc2: CMFormatDescriptionRef;
                                        formatDescriptionExtensionKeysToIgnore
                                        : CFTypeRef;
                                        sampleDescriptionExtensionAtomKeysToIgnore
                                        : CFTypeRef): Boolean; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMFormatDescriptionEqualIgnoringExtensionKeys';
                                        function CMFormatDescriptionGetMediaType
                                        (desc: CMFormatDescriptionRef)
                                        : CMMediaType; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMFormatDescriptionGetMediaType';
                                        function CMFormatDescriptionGetMediaSubType
                                        (desc: CMFormatDescriptionRef)
                                        : FourCharCode; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMFormatDescriptionGetMediaSubType';
                                        function CMFormatDescriptionGetExtensions
                                        (desc: CMFormatDescriptionRef)
                                        : CFDictionaryRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMFormatDescriptionGetExtensions';
                                        function CMFormatDescriptionGetExtension
                                        (desc: CMFormatDescriptionRef;
                                        extensionKey: CFStringRef)
                                        : CFPropertyListRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMFormatDescriptionGetExtension';
                                        function CMAudioFormatDescriptionCreate
                                        (allocator: CFAllocatorRef;
                                        asbd: Pointer; layoutSize: LongWord;
                                        layout: Pointer;
                                        magicCookieSize: LongWord;
                                        magicCookie: Pointer;
                                        extensions: CFDictionaryRef;
                                        outDesc: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMAudioFormatDescriptionCreate';
                                        function CMAudioFormatDescriptionGetStreamBasicDescription
                                        (desc: CMAudioFormatDescriptionRef)
                                        : Pointer; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMAudioFormatDescriptionGetStreamBasicDescription';
                                        function CMAudioFormatDescriptionGetMagicCookie
                                        (desc: CMAudioFormatDescriptionRef;
                                        cookieSizeOut: PLongWord): Pointer;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMAudioFormatDescriptionGetMagicCookie';
                                        function CMAudioFormatDescriptionGetChannelLayout
                                        (desc: CMAudioFormatDescriptionRef;
                                        layoutSize: PLongWord): Pointer; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMAudioFormatDescriptionGetChannelLayout';
                                        function CMAudioFormatDescriptionGetFormatList
                                        (desc: CMAudioFormatDescriptionRef;
                                        formatListSize: PLongWord): Pointer;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMAudioFormatDescriptionGetFormatList';
                                        function CMAudioFormatDescriptionGetRichestDecodableFormat
                                        (desc: CMAudioFormatDescriptionRef)
                                        : Pointer; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMAudioFormatDescriptionGetRichestDecodableFormat';
                                        function CMAudioFormatDescriptionGetMostCompatibleFormat
                                        (desc: CMAudioFormatDescriptionRef)
                                        : Pointer; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMAudioFormatDescriptionGetMostCompatibleFormat';
                                        function CMAudioFormatDescriptionCreateSummary
                                        (allocator: CFAllocatorRef;
                                        formatDescriptionArray: CFArrayRef;
                                        flags: LongWord;
                                        summaryFormatDescriptionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMAudioFormatDescriptionCreateSummary';
                                        function CMAudioFormatDescriptionEqual
                                        (desc1: CMAudioFormatDescriptionRef;
                                        desc2: CMAudioFormatDescriptionRef;
                                        equalityMask
                                        : CMAudioFormatDescriptionMask;
                                        equalityMaskOut: PLongWord): Boolean;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMAudioFormatDescriptionEqual';
                                        function CMVideoFormatDescriptionCreate
                                        (allocator: CFAllocatorRef;
                                        codecType: CMVideoCodecType;
                                        width: Int32; height: Int32;
                                        extensions: CFDictionaryRef;
                                        outDesc: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMVideoFormatDescriptionCreate';
                                        function CMVideoFormatDescriptionCreateForImageBuffer
                                        (allocator: CFAllocatorRef;
                                        imageBuffer: CVImageBufferRef;
                                        outDesc: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMVideoFormatDescriptionCreateForImageBuffer';
                                        function CMVideoFormatDescriptionCreateFromH264ParameterSets
                                        (allocator: CFAllocatorRef;
                                        parameterSetCount: LongWord;
                                        parameterSetPointers: PByte;
                                        parameterSetSizes: PLongWord;
                                        NALUnitHeaderLength: Integer;
                                        formatDescriptionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMVideoFormatDescriptionCreateFromH264ParameterSets';
                                        function CMVideoFormatDescriptionGetH264ParameterSetAtIndex
                                        (videoDesc: CMFormatDescriptionRef;
                                        parameterSetIndex: LongWord;
                                        parameterSetPointerOut: PByte;
                                        parameterSetSizeOut: PLongWord;
                                        parameterSetCountOut: PLongWord;
                                        NALUnitHeaderLengthOut: PInteger)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMVideoFormatDescriptionGetH264ParameterSetAtIndex';
                                        function CMVideoFormatDescriptionGetDimensions
                                        (videoDesc: CMVideoFormatDescriptionRef)
                                        : CMVideoDimensions; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMVideoFormatDescriptionGetDimensions';
                                        function CMVideoFormatDescriptionGetPresentationDimensions
                                        (videoDesc: CMVideoFormatDescriptionRef;
                                        usePixelAspectRatio: Boolean;
                                        useCleanAperture: Boolean): CGSize;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMVideoFormatDescriptionGetPresentationDimensions';
                                        function CMVideoFormatDescriptionGetCleanAperture
                                        (videoDesc: CMVideoFormatDescriptionRef;
                                        originIsAtTopLeft: Boolean): CGRect;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMVideoFormatDescriptionGetCleanAperture';
                                        function CMVideoFormatDescriptionGetExtensionKeysCommonWithImageBuffers
                                        : CFArrayRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMVideoFormatDescriptionGetExtensionKeysCommonWithImageBuffers';
                                        function CMVideoFormatDescriptionMatchesImageBuffer
                                        (desc: CMVideoFormatDescriptionRef;
                                        imageBuffer: CVImageBufferRef): Boolean;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMVideoFormatDescriptionMatchesImageBuffer';
                                        function CMMuxedFormatDescriptionCreate
                                        (allocator: CFAllocatorRef;
                                        muxType: CMMuxedStreamType;
                                        extensions: CFDictionaryRef;
                                        outDesc: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMuxedFormatDescriptionCreate';
                                        function CMTextFormatDescriptionGetDisplayFlags
                                        (desc: CMFormatDescriptionRef;
                                        outDisplayFlags: PLongWord): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTextFormatDescriptionGetDisplayFlags';
                                        function CMTextFormatDescriptionGetJustification
                                        (desc: CMFormatDescriptionRef;
                                        outHorizontalJust: signed char *;
                                        outVerticalJust: signed char * )
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTextFormatDescriptionGetJustification';
                                        function CMTextFormatDescriptionGetDefaultTextBox
                                        (desc: CMFormatDescriptionRef;
                                        originIsAtTopLeft: Boolean;
                                        heightOfTextTrack: CGFloat;
                                        outDefaultTextBox: Pointer): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTextFormatDescriptionGetDefaultTextBox';
                                        function CMTextFormatDescriptionGetDefaultStyle
                                        (desc: CMFormatDescriptionRef;
                                        outLocalFontID: PWord; outBold: PByte;
                                        outItalic: PByte; outUnderline: PByte;
                                        outFontSize: PCGFloat;
                                        outColorComponents: CGFloat): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTextFormatDescriptionGetDefaultStyle';
                                        function CMTextFormatDescriptionGetFontName
                                        (desc: CMFormatDescriptionRef;
                                        localFontID: Word; outFontName: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTextFormatDescriptionGetFontName';
                                        function CMTimeCodeFormatDescriptionCreate
                                        (allocator: CFAllocatorRef;
                                        timeCodeFormatType
                                        : CMTimeCodeFormatType;
                                        frameDuration: CMTime;
                                        frameQuanta: LongWord;
                                        tcFlags: LongWord;
                                        extensions: CFDictionaryRef;
                                        descOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeCodeFormatDescriptionCreate';
                                        function CMTimeCodeFormatDescriptionGetFrameDuration
                                        (timeCodeFormatDescription
                                        : CMTimeCodeFormatDescriptionRef)
                                        : CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeCodeFormatDescriptionGetFrameDuration';
                                        function CMTimeCodeFormatDescriptionGetFrameQuanta
                                        (timeCodeFormatDescription
                                        : CMTimeCodeFormatDescriptionRef)
                                        : LongWord; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeCodeFormatDescriptionGetFrameQuanta';
                                        function CMTimeCodeFormatDescriptionGetTimeCodeFlags
                                        (desc: CMTimeCodeFormatDescriptionRef)
                                        : LongWord; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeCodeFormatDescriptionGetTimeCodeFlags';
                                        function CMMetadataFormatDescriptionCreateWithKeys
                                        (allocator: CFAllocatorRef;
                                        metadataType: CMMetadataFormatType;
                                        keys: CFArrayRef; outDesc: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataFormatDescriptionCreateWithKeys';
                                        function CMMetadataFormatDescriptionCreateWithMetadataSpecifications
                                        (allocator: CFAllocatorRef;
                                        metadataType: CMMetadataFormatType;
                                        metadataSpecifications: CFArrayRef;
                                        outDesc: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataFormatDescriptionCreateWithMetadataSpecifications';
                                        function CMMetadataFormatDescriptionCreateWithMetadataFormatDescriptionAndMetadataSpecifications
                                        (allocator: CFAllocatorRef;
                                        srcDesc: CMMetadataFormatDescriptionRef;
                                        metadataSpecifications: CFArrayRef;
                                        outDesc: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataFormatDescriptionCreateWithMetadataFormatDescriptionAndMetadataSpecifications';
                                        function CMMetadataFormatDescriptionCreateByMergingMetadataFormatDescriptions
                                        (allocator: CFAllocatorRef;
                                        srcDesc1: CMMetadataFormatDescriptionRef;
                                        srcDesc2: CMMetadataFormatDescriptionRef;
                                        outDesc: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataFormatDescriptionCreateByMergingMetadataFormatDescriptions';
                                        function CMMetadataFormatDescriptionGetKeyWithLocalID
                                        (desc: CMMetadataFormatDescriptionRef;
                                        localKeyID: OSType): CFDictionaryRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMMetadataFormatDescriptionGetKeyWithLocalID';
                                        function CMMetadataFormatDescriptionGetIdentifiers
                                        (desc: CMMetadataFormatDescriptionRef)
                                        : CFArrayRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataFormatDescriptionGetIdentifiers';
                                        function CMVideoFormatDescriptionCreateFromBigEndianImageDescriptionData
                                        (allocator: CFAllocatorRef;
                                        imageDescriptionData: PByte;
                                        imageDescriptionSize: LongWord;
                                        imageDescriptionStringEncoding
                                        : CFStringEncoding;
                                        imageDescriptionFlavor: CFStringRef;
                                        videoFormatDescriptionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMVideoFormatDescriptionCreateFromBigEndianImageDescriptionData';
                                        function CMVideoFormatDescriptionCreateFromBigEndianImageDescriptionBlockBuffer
                                        (allocator: CFAllocatorRef;
                                        imageDescriptionBlockBuffer
                                        : CMBlockBufferRef;
                                        imageDescriptionStringEncoding
                                        : CFStringEncoding;
                                        imageDescriptionFlavor: CFStringRef;
                                        videoFormatDescriptionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMVideoFormatDescriptionCreateFromBigEndianImageDescriptionBlockBuffer';
                                        function CMVideoFormatDescriptionCopyAsBigEndianImageDescriptionBlockBuffer
                                        (allocator: CFAllocatorRef;
                                        videoFormatDescription
                                        : CMVideoFormatDescriptionRef;
                                        imageDescriptionStringEncoding
                                        : CFStringEncoding;
                                        imageDescriptionFlavor: CFStringRef;
                                        imageDescriptionBlockBufferOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMVideoFormatDescriptionCopyAsBigEndianImageDescriptionBlockBuffer';
                                        function CMSwapBigEndianImageDescriptionToHost
                                        (imageDescriptionData: PByte;
                                        imageDescriptionSize: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSwapBigEndianImageDescriptionToHost';
                                        function CMSwapHostEndianImageDescriptionToBig
                                        (imageDescriptionData: PByte;
                                        imageDescriptionSize: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSwapHostEndianImageDescriptionToBig';
                                        function CMAudioFormatDescriptionCreateFromBigEndianSoundDescriptionData
                                        (allocator: CFAllocatorRef;
                                        soundDescriptionData: PByte;
                                        soundDescriptionSize: LongWord;
                                        soundDescriptionFlavor: CFStringRef;
                                        audioFormatDescriptionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMAudioFormatDescriptionCreateFromBigEndianSoundDescriptionData';
                                        function CMAudioFormatDescriptionCreateFromBigEndianSoundDescriptionBlockBuffer
                                        (allocator: CFAllocatorRef;
                                        soundDescriptionBlockBuffer
                                        : CMBlockBufferRef;
                                        soundDescriptionFlavor: CFStringRef;
                                        audioFormatDescriptionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMAudioFormatDescriptionCreateFromBigEndianSoundDescriptionBlockBuffer';
                                        function CMAudioFormatDescriptionCopyAsBigEndianSoundDescriptionBlockBuffer
                                        (allocator: CFAllocatorRef;
                                        audioFormatDescription
                                        : CMAudioFormatDescriptionRef;
                                        soundDescriptionFlavor: CFStringRef;
                                        soundDescriptionBlockBufferOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMAudioFormatDescriptionCopyAsBigEndianSoundDescriptionBlockBuffer';
                                        function CMDoesBigEndianSoundDescriptionRequireLegacyCBRSampleTableLayout
                                        (soundDescriptionBlockBuffer
                                        : CMBlockBufferRef;
                                        soundDescriptionFlavor: CFStringRef)
                                        : Boolean; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMDoesBigEndianSoundDescriptionRequireLegacyCBRSampleTableLayout';
                                        function CMSwapBigEndianSoundDescriptionToHost
                                        (soundDescriptionData: PByte;
                                        soundDescriptionSize: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSwapBigEndianSoundDescriptionToHost';
                                        function CMSwapHostEndianSoundDescriptionToBig
                                        (soundDescriptionData: PByte;
                                        soundDescriptionSize: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSwapHostEndianSoundDescriptionToBig';
                                        function CMTextFormatDescriptionCreateFromBigEndianTextDescriptionData
                                        (allocator: CFAllocatorRef;
                                        textDescriptionData: PByte;
                                        textDescriptionSize: LongWord;
                                        textDescriptionFlavor: CFStringRef;
                                        mediaType: CMMediaType;
                                        textFormatDescriptionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTextFormatDescriptionCreateFromBigEndianTextDescriptionData';
                                        function CMTextFormatDescriptionCreateFromBigEndianTextDescriptionBlockBuffer
                                        (allocator: CFAllocatorRef;
                                        textDescriptionBlockBuffer
                                        : CMBlockBufferRef;
                                        textDescriptionFlavor: CFStringRef;
                                        mediaType: CMMediaType;
                                        textFormatDescriptionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTextFormatDescriptionCreateFromBigEndianTextDescriptionBlockBuffer';
                                        function CMTextFormatDescriptionCopyAsBigEndianTextDescriptionBlockBuffer
                                        (allocator: CFAllocatorRef;
                                        textFormatDescription
                                        : CMTextFormatDescriptionRef;
                                        textDescriptionFlavor: CFStringRef;
                                        textDescriptionBlockBufferOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTextFormatDescriptionCopyAsBigEndianTextDescriptionBlockBuffer';
                                        function CMSwapBigEndianTextDescriptionToHost
                                        (textDescriptionData: PByte;
                                        textDescriptionSize: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSwapBigEndianTextDescriptionToHost';
                                        function CMSwapHostEndianTextDescriptionToBig
                                        (textDescriptionData: PByte;
                                        textDescriptionSize: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSwapHostEndianTextDescriptionToBig';
                                        function CMClosedCaptionFormatDescriptionCreateFromBigEndianClosedCaptionDescriptionData
                                        (allocator: CFAllocatorRef;
                                        closedCaptionDescriptionData: PByte;
                                        closedCaptionDescriptionSize: LongWord;
                                        closedCaptionDescriptionFlavor
                                        : CFStringRef;
                                        closedCaptionFormatDescriptionOut
                                        : Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMClosedCaptionFormatDescriptionCreateFromBigEndianClosedCaptionDescriptionData';
                                        function CMClosedCaptionFormatDescriptionCreateFromBigEndianClosedCaptionDescriptionBlockBuffer
                                        (allocator: CFAllocatorRef;
                                        closedCaptionDescriptionBlockBuffer
                                        : CMBlockBufferRef;
                                        closedCaptionDescriptionFlavor
                                        : CFStringRef;
                                        closedCaptionFormatDescriptionOut
                                        : Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMClosedCaptionFormatDescriptionCreateFromBigEndianClosedCaptionDescriptionBlockBuffer';
                                        function CMClosedCaptionFormatDescriptionCopyAsBigEndianClosedCaptionDescriptionBlockBuffer
                                        (allocator: CFAllocatorRef;
                                        closedCaptionFormatDescription
                                        : CMClosedCaptionFormatDescriptionRef;
                                        closedCaptionDescriptionFlavor
                                        : CFStringRef;
                                        closedCaptionDescriptionBlockBufferOut
                                        : Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMClosedCaptionFormatDescriptionCopyAsBigEndianClosedCaptionDescriptionBlockBuffer';
                                        function CMSwapBigEndianClosedCaptionDescriptionToHost
                                        (closedCaptionDescriptionData: PByte;
                                        closedCaptionDescriptionSize: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSwapBigEndianClosedCaptionDescriptionToHost';
                                        function CMSwapHostEndianClosedCaptionDescriptionToBig
                                        (closedCaptionDescriptionData: PByte;
                                        closedCaptionDescriptionSize: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSwapHostEndianClosedCaptionDescriptionToBig';
                                        function CMTimeCodeFormatDescriptionCreateFromBigEndianTimeCodeDescriptionData
                                        (allocator: CFAllocatorRef;
                                        timeCodeDescriptionData: PByte;
                                        timeCodeDescriptionSize: LongWord;
                                        timeCodeDescriptionFlavor: CFStringRef;
                                        timeCodeFormatDescriptionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeCodeFormatDescriptionCreateFromBigEndianTimeCodeDescriptionData';
                                        function CMTimeCodeFormatDescriptionCreateFromBigEndianTimeCodeDescriptionBlockBuffer
                                        (allocator: CFAllocatorRef;
                                        timeCodeDescriptionBlockBuffer
                                        : CMBlockBufferRef;
                                        timeCodeDescriptionFlavor: CFStringRef;
                                        timeCodeFormatDescriptionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeCodeFormatDescriptionCreateFromBigEndianTimeCodeDescriptionBlockBuffer';
                                        function CMTimeCodeFormatDescriptionCopyAsBigEndianTimeCodeDescriptionBlockBuffer
                                        (allocator: CFAllocatorRef;
                                        timeCodeFormatDescription
                                        : CMTimeCodeFormatDescriptionRef;
                                        timeCodeDescriptionFlavor: CFStringRef;
                                        timeCodeDescriptionBlockBufferOut
                                        : Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeCodeFormatDescriptionCopyAsBigEndianTimeCodeDescriptionBlockBuffer';
                                        function CMSwapBigEndianTimeCodeDescriptionToHost
                                        (timeCodeDescriptionData: PByte;
                                        timeCodeDescriptionSize: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSwapBigEndianTimeCodeDescriptionToHost';
                                        function CMSwapHostEndianTimeCodeDescriptionToBig
                                        (timeCodeDescriptionData: PByte;
                                        timeCodeDescriptionSize: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSwapHostEndianTimeCodeDescriptionToBig';
                                        function CMMetadataFormatDescriptionCreateFromBigEndianMetadataDescriptionData
                                        (allocator: CFAllocatorRef;
                                        metadataDescriptionData: PByte;
                                        metadataDescriptionSize: LongWord;
                                        metadataDescriptionFlavor: CFStringRef;
                                        metadataFormatDescriptionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataFormatDescriptionCreateFromBigEndianMetadataDescriptionData';
                                        function CMMetadataFormatDescriptionCreateFromBigEndianMetadataDescriptionBlockBuffer
                                        (allocator: CFAllocatorRef;
                                        metadataDescriptionBlockBuffer
                                        : CMBlockBufferRef;
                                        metadataDescriptionFlavor: CFStringRef;
                                        metadataFormatDescriptionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataFormatDescriptionCreateFromBigEndianMetadataDescriptionBlockBuffer';
                                        function CMMetadataFormatDescriptionCopyAsBigEndianMetadataDescriptionBlockBuffer
                                        (allocator: CFAllocatorRef;
                                        metadataFormatDescription
                                        : CMMetadataFormatDescriptionRef;
                                        metadataDescriptionFlavor: CFStringRef;
                                        metadataDescriptionBlockBufferOut
                                        : Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataFormatDescriptionCopyAsBigEndianMetadataDescriptionBlockBuffer';
                                        function CMSwapBigEndianMetadataDescriptionToHost
                                        (metadataDescriptionData: PByte;
                                        metadataDescriptionSize: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSwapBigEndianMetadataDescriptionToHost';
                                        function CMSwapHostEndianMetadataDescriptionToBig
                                        (metadataDescriptionData: PByte;
                                        metadataDescriptionSize: LongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSwapHostEndianMetadataDescriptionToBig';
                                        function CMMemoryPoolGetTypeID
                                        : CFTypeID; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMemoryPoolGetTypeID';
                                        function CMMemoryPoolCreate
                                        (options: CFDictionaryRef)
                                        : CMMemoryPoolRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMemoryPoolCreate';
                                        function CMMemoryPoolGetAllocator
                                        (pool: CMMemoryPoolRef): CFAllocatorRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMMemoryPoolGetAllocator';
                                        procedure CMMemoryPoolFlush
                                        (pool: CMMemoryPoolRef); cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMemoryPoolFlush';
                                        procedure CMMemoryPoolInvalidate
                                        (pool: CMMemoryPoolRef); cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMemoryPoolInvalidate';
                                        function CMMetadataCreateIdentifierForKeyAndKeySpace
                                        (allocator: CFAllocatorRef;
                                        key: CFTypeRef; keySpace: CFStringRef;
                                        identifierOut: Pointer): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMMetadataCreateIdentifierForKeyAndKeySpace';
                                        function CMMetadataCreateKeyFromIdentifier
                                        (allocator: CFAllocatorRef;
                                        identifier: CFStringRef;
                                        keyOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataCreateKeyFromIdentifier';
                                        function CMMetadataCreateKeyFromIdentifierAsCFData
                                        (allocator: CFAllocatorRef;
                                        identifier: CFStringRef;
                                        keyOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataCreateKeyFromIdentifierAsCFData';
                                        function CMMetadataCreateKeySpaceFromIdentifier
                                        (allocator: CFAllocatorRef;
                                        identifier: CFStringRef;
                                        keySpaceOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataCreateKeySpaceFromIdentifier';
                                        function CMMetadataDataTypeRegistryRegisterDataType
                                        (dataType: CFStringRef;
                                        description: CFStringRef;
                                        conformingDataTypes: CFArrayRef)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataDataTypeRegistryRegisterDataType';
                                        function CMMetadataDataTypeRegistryDataTypeIsRegistered
                                        (dataType: CFStringRef): Boolean; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataDataTypeRegistryDataTypeIsRegistered';
                                        function CMMetadataDataTypeRegistryGetDataTypeDescription
                                        (dataType: CFStringRef): CFStringRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMMetadataDataTypeRegistryGetDataTypeDescription';
                                        function CMMetadataDataTypeRegistryGetConformingDataTypes
                                        (dataType: CFStringRef): CFArrayRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMMetadataDataTypeRegistryGetConformingDataTypes';
                                        function CMMetadataDataTypeRegistryDataTypeConformsToDataType
                                        (dataType: CFStringRef;
                                        conformsToDataType: CFStringRef)
                                        : Boolean; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataDataTypeRegistryDataTypeConformsToDataType';
                                        function CMMetadataDataTypeRegistryGetBaseDataTypes
                                        : CFArrayRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataDataTypeRegistryGetBaseDataTypes';
                                        function CMMetadataDataTypeRegistryDataTypeIsBaseDataType
                                        (dataType: CFStringRef): Boolean; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMMetadataDataTypeRegistryDataTypeIsBaseDataType';
                                        function CMMetadataDataTypeRegistryGetBaseDataTypeForConformingDataType
                                        (dataType: CFStringRef): CFStringRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMMetadataDataTypeRegistryGetBaseDataTypeForConformingDataType';
                                        function CMSampleBufferCreate
                                        (allocator: CFAllocatorRef;
                                        dataBuffer: CMBlockBufferRef;
                                        dataReady: Boolean;
                                        makeDataReadyCallback
                                        : CMSampleBufferMakeDataReadyCallback;
                                        makeDataReadyRefcon: Pointer;
                                        formatDescription
                                        : CMFormatDescriptionRef;
                                        numSamples: CMItemCount;
                                        numSampleTimingEntries: CMItemCount;
                                        sampleTimingArray: Pointer;
                                        numSampleSizeEntries: CMItemCount;
                                        sampleSizeArray: PLongWord;
                                        sBufOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferCreate';
                                        function CMSampleBufferCreateReady
                                        (allocator: CFAllocatorRef;
                                        dataBuffer: CMBlockBufferRef;
                                        formatDescription
                                        : CMFormatDescriptionRef;
                                        numSamples: CMItemCount;
                                        numSampleTimingEntries: CMItemCount;
                                        sampleTimingArray: Pointer;
                                        numSampleSizeEntries: CMItemCount;
                                        sampleSizeArray: PLongWord;
                                        sBufOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferCreateReady';
                                        function CMAudioSampleBufferCreateWithPacketDescriptions
                                        (allocator: CFAllocatorRef;
                                        dataBuffer: CMBlockBufferRef;
                                        dataReady: Boolean;
                                        makeDataReadyCallback
                                        : CMSampleBufferMakeDataReadyCallback;
                                        makeDataReadyRefcon: Pointer;
                                        formatDescription
                                        : CMFormatDescriptionRef;
                                        numSamples: CMItemCount;
                                        sbufPTS: CMTime;
                                        packetDescriptions: Pointer;
                                        sBufOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMAudioSampleBufferCreateWithPacketDescriptions';
                                        function CMAudioSampleBufferCreateReadyWithPacketDescriptions
                                        (allocator: CFAllocatorRef;
                                        dataBuffer: CMBlockBufferRef;
                                        formatDescription
                                        : CMFormatDescriptionRef;
                                        numSamples: CMItemCount;
                                        sbufPTS: CMTime;
                                        packetDescriptions: Pointer;
                                        sBufOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMAudioSampleBufferCreateReadyWithPacketDescriptions';
                                        function CMSampleBufferCreateForImageBuffer
                                        (allocator: CFAllocatorRef;
                                        imageBuffer: CVImageBufferRef;
                                        dataReady: Boolean;
                                        makeDataReadyCallback
                                        : CMSampleBufferMakeDataReadyCallback;
                                        makeDataReadyRefcon: Pointer;
                                        formatDescription
                                        : CMVideoFormatDescriptionRef;
                                        sampleTiming: Pointer; sBufOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferCreateForImageBuffer';
                                        function CMSampleBufferCreateReadyWithImageBuffer
                                        (allocator: CFAllocatorRef;
                                        imageBuffer: CVImageBufferRef;
                                        formatDescription
                                        : CMVideoFormatDescriptionRef;
                                        sampleTiming: Pointer; sBufOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferCreateReadyWithImageBuffer';
                                        function CMSampleBufferCreateCopy
                                        (allocator: CFAllocatorRef;
                                        sbuf: CMSampleBufferRef;
                                        sbufCopyOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferCreateCopy';
                                        function CMSampleBufferCreateCopyWithNewTiming
                                        (allocator: CFAllocatorRef;
                                        originalSBuf: CMSampleBufferRef;
                                        numSampleTimingEntries: CMItemCount;
                                        sampleTimingArray: Pointer;
                                        sbufCopyOut: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferCreateCopyWithNewTiming';
                                        function CMSampleBufferCopySampleBufferForRange
                                        (allocator: CFAllocatorRef;
                                        sbuf: CMSampleBufferRef;
                                        sampleRange: CFRange; sBufOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferCopySampleBufferForRange';
                                        function CMSampleBufferGetTypeID
                                        : CFTypeID; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferGetTypeID';
                                        function CMSampleBufferSetDataBuffer
                                        (sbuf: CMSampleBufferRef;
                                        dataBuffer: CMBlockBufferRef): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferSetDataBuffer';
                                        function CMSampleBufferGetDataBuffer
                                        (sbuf: CMSampleBufferRef)
                                        : CMBlockBufferRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferGetDataBuffer';
                                        function CMSampleBufferGetImageBuffer
                                        (sbuf: CMSampleBufferRef)
                                        : CVImageBufferRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferGetImageBuffer';
                                        function CMSampleBufferSetDataBufferFromAudioBufferList
                                        (sbuf: CMSampleBufferRef;
                                        bbufStructAllocator: CFAllocatorRef;
                                        bbufMemoryAllocator: CFAllocatorRef;
                                        flags: LongWord; bufferList: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferSetDataBufferFromAudioBufferList';
                                        function CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer
                                        (sbuf: CMSampleBufferRef;
                                        bufferListSizeNeededOut: PLongWord;
                                        bufferListOut: Pointer;
                                        bufferListSize: LongWord;
                                        bbufStructAllocator: CFAllocatorRef;
                                        bbufMemoryAllocator: CFAllocatorRef;
                                        flags: LongWord;
                                        blockBufferOut: Pointer): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer';
                                        function CMSampleBufferGetAudioStreamPacketDescriptions
                                        (sbuf: CMSampleBufferRef;
                                        packetDescriptionsSize: LongWord;
                                        packetDescriptionsOut: Pointer;
                                        packetDescriptionsSizeNeededOut
                                        : PLongWord): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferGetAudioStreamPacketDescriptions';
                                        function CMSampleBufferGetAudioStreamPacketDescriptionsPtr
                                        (sbuf: CMSampleBufferRef;
                                        packetDescriptionsPtrOut: Pointer;
                                        packetDescriptionsSizeOut: PLongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferGetAudioStreamPacketDescriptionsPtr';
                                        function CMSampleBufferCopyPCMDataIntoAudioBufferList
                                        (sbuf: CMSampleBufferRef;
                                        frameOffset: Int32; numFrames: Int32;
                                        bufferList: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferCopyPCMDataIntoAudioBufferList';
                                        function CMSampleBufferSetDataReady
                                        (sbuf: CMSampleBufferRef): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferSetDataReady';
                                        function CMSampleBufferDataIsReady
                                        (sbuf: CMSampleBufferRef): Boolean;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferDataIsReady';
                                        function CMSampleBufferSetDataFailed
                                        (sbuf: CMSampleBufferRef;
                                        status: OSStatus): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferSetDataFailed';
                                        function CMSampleBufferHasDataFailed
                                        (sbuf: CMSampleBufferRef;
                                        statusOut: PLongInt): Boolean; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferHasDataFailed';
                                        function CMSampleBufferMakeDataReady
                                        (sbuf: CMSampleBufferRef): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferMakeDataReady';
                                        function CMSampleBufferTrackDataReadiness
                                        (sbuf: CMSampleBufferRef;
                                        sbufToTrack: CMSampleBufferRef)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferTrackDataReadiness';
                                        function CMSampleBufferInvalidate
                                        (sbuf: CMSampleBufferRef): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferInvalidate';
                                        function CMSampleBufferSetInvalidateCallback
                                        (sbuf: CMSampleBufferRef;
                                        invalidateCallback
                                        : CMSampleBufferInvalidateCallback;
                                        invalidateRefCon: UInt64): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferSetInvalidateCallback';
                                        function CMSampleBufferSetInvalidateHandler
                                        (sbuf: CMSampleBufferRef;
                                        invalidateHandler
                                        : CMSampleBufferInvalidateHandler)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferSetInvalidateHandler';
                                        function CMSampleBufferIsValid
                                        (sbuf: CMSampleBufferRef): Boolean;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferIsValid';
                                        function CMSampleBufferGetNumSamples
                                        (sbuf: CMSampleBufferRef): CMItemCount;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferGetNumSamples';
                                        function CMSampleBufferGetDuration
                                        (sbuf: CMSampleBufferRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferGetDuration';
                                        function CMSampleBufferGetPresentationTimeStamp
                                        (sbuf: CMSampleBufferRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferGetPresentationTimeStamp';
                                        function CMSampleBufferGetDecodeTimeStamp
                                        (sbuf: CMSampleBufferRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferGetDecodeTimeStamp';
                                        function CMSampleBufferGetOutputDuration
                                        (sbuf: CMSampleBufferRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferGetOutputDuration';
                                        function CMSampleBufferGetOutputPresentationTimeStamp
                                        (sbuf: CMSampleBufferRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferGetOutputPresentationTimeStamp';
                                        function CMSampleBufferSetOutputPresentationTimeStamp
                                        (sbuf: CMSampleBufferRef;
                                        outputPresentationTimeStamp: CMTime)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferSetOutputPresentationTimeStamp';
                                        function CMSampleBufferGetOutputDecodeTimeStamp
                                        (sbuf: CMSampleBufferRef): CMTime;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferGetOutputDecodeTimeStamp';
                                        function CMSampleBufferGetSampleTimingInfoArray
                                        (sbuf: CMSampleBufferRef;
                                        timingArrayEntries: CMItemCount;
                                        timingArrayOut: Pointer;
                                        timingArrayEntriesNeededOut: PLongInt)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferGetSampleTimingInfoArray';
                                        function CMSampleBufferGetOutputSampleTimingInfoArray
                                        (sbuf: CMSampleBufferRef;
                                        timingArrayEntries: CMItemCount;
                                        timingArrayOut: Pointer;
                                        timingArrayEntriesNeededOut: PLongInt)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferGetOutputSampleTimingInfoArray';
                                        function CMSampleBufferGetSampleTimingInfo
                                        (sbuf: CMSampleBufferRef;
                                        sampleIndex: CMItemIndex;
                                        timingInfoOut: Pointer): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferGetSampleTimingInfo';
                                        function CMSampleBufferGetSampleSizeArray
                                        (sbuf: CMSampleBufferRef;
                                        sizeArrayEntries: CMItemCount;
                                        sizeArrayOut: PLongWord;
                                        sizeArrayEntriesNeededOut: PLongInt)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferGetSampleSizeArray';
                                        function CMSampleBufferGetSampleSize
                                        (sbuf: CMSampleBufferRef;
                                        sampleIndex: CMItemIndex): LongWord;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferGetSampleSize';
                                        function CMSampleBufferGetTotalSampleSize
                                        (sbuf: CMSampleBufferRef): LongWord;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferGetTotalSampleSize';
                                        function CMSampleBufferGetFormatDescription
                                        (sbuf: CMSampleBufferRef)
                                        : CMFormatDescriptionRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferGetFormatDescription';
                                        function CMSampleBufferGetSampleAttachmentsArray
                                        (sbuf: CMSampleBufferRef;
                                        createIfNecessary: Boolean): CFArrayRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferGetSampleAttachmentsArray';
                                        function CMSampleBufferCallForEachSample
                                        (sbuf: CMSampleBufferRef;
                                        callback: TCoreMediaCallback2;
                                        refCon: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSampleBufferCallForEachSample';
                                        function CMSampleBufferCallBlockForEachSample
                                        (sbuf: CMSampleBufferRef;
                                        handler: TCoreMediaHandler): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSampleBufferCallBlockForEachSample';
                                        function CMSimpleQueueGetTypeID
                                        : CFTypeID; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSimpleQueueGetTypeID';
                                        function CMSimpleQueueCreate
                                        (allocator: CFAllocatorRef;
                                        capacity: Int32; queueOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSimpleQueueCreate';
                                        function CMSimpleQueueEnqueue
                                        (queue: CMSimpleQueueRef;
                                        element: Pointer): OSStatus; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSimpleQueueEnqueue';
                                        function CMSimpleQueueDequeue
                                        (queue: CMSimpleQueueRef): Pointer;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSimpleQueueDequeue';
                                        function CMSimpleQueueGetHead
                                        (queue: CMSimpleQueueRef): Pointer;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSimpleQueueGetHead';
                                        function CMSimpleQueueReset
                                        (queue: CMSimpleQueueRef): OSStatus;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMSimpleQueueReset';
                                        function CMSimpleQueueGetCapacity
                                        (queue: CMSimpleQueueRef): Int32; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSimpleQueueGetCapacity';
                                        function CMSimpleQueueGetCount
                                        (queue: CMSimpleQueueRef): Int32; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMSimpleQueueGetCount';
                                        function CMTimeRangeMake(start: CMTime;
                                        duration: CMTime): CMTimeRange; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeRangeMake';
                                        function CMTimeRangeGetUnion
                                        (range1: CMTimeRange;
                                        range2: CMTimeRange): CMTimeRange;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimeRangeGetUnion';
                                        function CMTimeRangeGetIntersection
                                        (range1: CMTimeRange;
                                        range2: CMTimeRange): CMTimeRange;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimeRangeGetIntersection';
                                        function CMTimeRangeEqual
                                        (range1: CMTimeRange;
                                        range2: CMTimeRange): Boolean; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeRangeEqual';
                                        function CMTimeRangeContainsTime
                                        (range: CMTimeRange; time: CMTime)
                                        : Boolean; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeRangeContainsTime';
                                        function CMTimeRangeContainsTimeRange
                                        (range1: CMTimeRange;
                                        range2: CMTimeRange): Boolean; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeRangeContainsTimeRange';
                                        function CMTimeRangeGetEnd
                                        (range: CMTimeRange): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeRangeGetEnd';
                                        function CMTimeMapTimeFromRangeToRange
                                        (t: CMTime; fromRange: CMTimeRange;
                                        toRange: CMTimeRange): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeMapTimeFromRangeToRange';
                                        function CMTimeClampToRange
                                        (time: CMTime; range: CMTimeRange)
                                        : CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeClampToRange';
                                        function CMTimeMapDurationFromRangeToRange
                                        (dur: CMTime; fromRange: CMTimeRange;
                                        toRange: CMTimeRange): CMTime; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeMapDurationFromRangeToRange';
                                        function CMTimeRangeFromTimeToTime
                                        (start: CMTime; &end: CMTime)
                                        : CMTimeRange; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeRangeFromTimeToTime';
                                        function CMTimeRangeCopyAsDictionary
                                        (range: CMTimeRange;
                                        allocator: CFAllocatorRef)
                                        : CFDictionaryRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeRangeCopyAsDictionary';
                                        function CMTimeRangeMakeFromDictionary
                                        (dict: CFDictionaryRef): CMTimeRange;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimeRangeMakeFromDictionary';
                                        function CMTimeRangeCopyDescription
                                        (allocator: CFAllocatorRef;
                                        range: CMTimeRange): CFStringRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeRangeCopyDescription';
                                        procedure CMTimeRangeShow
                                        (range: CMTimeRange); cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeRangeShow';
                                        function CMTimeMappingMake
                                        (source: CMTimeRange;
                                        target: CMTimeRange): CMTimeMapping;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimeMappingMake';
                                        function CMTimeMappingMakeEmpty
                                        (target: CMTimeRange): CMTimeMapping;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimeMappingMakeEmpty';
                                        function CMTimeMappingCopyAsDictionary
                                        (mapping: CMTimeMapping;
                                        allocator: CFAllocatorRef)
                                        : CFDictionaryRef; cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeMappingCopyAsDictionary';
                                        function CMTimeMappingMakeFromDictionary
                                        (dict: CFDictionaryRef): CMTimeMapping;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimeMappingMakeFromDictionary';
                                        function CMTimeMappingCopyDescription
                                        (allocator: CFAllocatorRef;
                                        mapping: CMTimeMapping): CFStringRef;
                                        cdecl; external libCoreMedia name _PU +
                                        'CMTimeMappingCopyDescription';
                                        procedure CMTimeMappingShow
                                        (mapping: CMTimeMapping); cdecl;
                                        external libCoreMedia name _PU +
                                        'CMTimeMappingShow';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreMediaModule: THandle;

{$ENDIF IOS}

function kCMTimeInvalid: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeInvalid');
end;

function kCMTimeIndefinite: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeIndefinite');
end;

function kCMTimePositiveInfinity: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimePositiveInfinity');
end;

function kCMTimeNegativeInfinity: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeNegativeInfinity');
end;

function kCMTimeZero: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeZero');
end;

function kCMTimeValueKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeValueKey');
end;

function kCMTimeScaleKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeScaleKey');
end;

function kCMTimeEpochKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeEpochKey');
end;

function kCMTimeFlagsKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeFlagsKey');
end;

function kCMTimebaseNotification_EffectiveRateChanged: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTimebaseNotification_EffectiveRateChanged');
end;

function kCMTimebaseNotification_TimeJumped: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTimebaseNotification_TimeJumped');
end;

function kCMTimebaseNotificationKey_EventTime: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTimebaseNotificationKey_EventTime');
end;

function kCMFormatDescriptionExtension_OriginalCompressionSettings: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_OriginalCompressionSettings');
end;

function kCMFormatDescriptionExtension_SampleDescriptionExtensionAtoms: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_SampleDescriptionExtensionAtoms');
end;

function kCMFormatDescriptionExtension_VerbatimSampleDescription: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_VerbatimSampleDescription');
end;

function kCMFormatDescriptionExtension_VerbatimISOSampleEntry: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_VerbatimISOSampleEntry');
end;

function kCMFormatDescriptionExtension_FormatName: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_FormatName');
end;

function kCMFormatDescriptionExtension_Depth: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_Depth');
end;

function kCMFormatDescriptionExtension_CleanAperture: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_CleanAperture');
end;

function kCMFormatDescriptionKey_CleanApertureWidth: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionKey_CleanApertureWidth');
end;

function kCMFormatDescriptionKey_CleanApertureHeight: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionKey_CleanApertureHeight');
end;

function kCMFormatDescriptionKey_CleanApertureHorizontalOffset: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionKey_CleanApertureHorizontalOffset');
end;

function kCMFormatDescriptionKey_CleanApertureVerticalOffset: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionKey_CleanApertureVerticalOffset');
end;

function kCMFormatDescriptionKey_CleanApertureWidthRational: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionKey_CleanApertureWidthRational');
end;

function kCMFormatDescriptionKey_CleanApertureHeightRational: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionKey_CleanApertureHeightRational');
end;

function kCMFormatDescriptionKey_CleanApertureHorizontalOffsetRational: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionKey_CleanApertureHorizontalOffsetRational');
end;

function kCMFormatDescriptionKey_CleanApertureVerticalOffsetRational: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionKey_CleanApertureVerticalOffsetRational');
end;

function kCMFormatDescriptionExtension_FieldCount: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_FieldCount');
end;

function kCMFormatDescriptionExtension_FieldDetail: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_FieldDetail');
end;

function kCMFormatDescriptionFieldDetail_TemporalTopFirst: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionFieldDetail_TemporalTopFirst');
end;

function kCMFormatDescriptionFieldDetail_TemporalBottomFirst: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionFieldDetail_TemporalBottomFirst');
end;

function kCMFormatDescriptionFieldDetail_SpatialFirstLineEarly: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionFieldDetail_SpatialFirstLineEarly');
end;

function kCMFormatDescriptionFieldDetail_SpatialFirstLineLate: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionFieldDetail_SpatialFirstLineLate');
end;

function kCMFormatDescriptionExtension_PixelAspectRatio: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_PixelAspectRatio');
end;

function kCMFormatDescriptionKey_PixelAspectRatioHorizontalSpacing: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionKey_PixelAspectRatioHorizontalSpacing');
end;

function kCMFormatDescriptionKey_PixelAspectRatioVerticalSpacing: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionKey_PixelAspectRatioVerticalSpacing');
end;

function kCMFormatDescriptionExtension_ColorPrimaries: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_ColorPrimaries');
end;

function kCMFormatDescriptionColorPrimaries_ITU_R_709_2: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionColorPrimaries_ITU_R_709_2');
end;

function kCMFormatDescriptionColorPrimaries_EBU_3213: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionColorPrimaries_EBU_3213');
end;

function kCMFormatDescriptionColorPrimaries_SMPTE_C: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionColorPrimaries_SMPTE_C');
end;

function kCMFormatDescriptionColorPrimaries_DCI_P3: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionColorPrimaries_DCI_P3');
end;

function kCMFormatDescriptionColorPrimaries_P3_D65: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionColorPrimaries_P3_D65');
end;

function kCMFormatDescriptionColorPrimaries_ITU_R_2020: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionColorPrimaries_ITU_R_2020');
end;

function kCMFormatDescriptionColorPrimaries_P22: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionColorPrimaries_P22');
end;

function kCMFormatDescriptionExtension_TransferFunction: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_TransferFunction');
end;

function kCMFormatDescriptionTransferFunction_ITU_R_709_2: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionTransferFunction_ITU_R_709_2');
end;

function kCMFormatDescriptionTransferFunction_SMPTE_240M_1995: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionTransferFunction_SMPTE_240M_1995');
end;

function kCMFormatDescriptionTransferFunction_UseGamma: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionTransferFunction_UseGamma');
end;

function kCMFormatDescriptionTransferFunction_ITU_R_2020: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionTransferFunction_ITU_R_2020');
end;

function kCMFormatDescriptionExtension_GammaLevel: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_GammaLevel');
end;

function kCMFormatDescriptionExtension_YCbCrMatrix: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_YCbCrMatrix');
end;

function kCMFormatDescriptionYCbCrMatrix_ITU_R_709_2: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionYCbCrMatrix_ITU_R_709_2');
end;

function kCMFormatDescriptionYCbCrMatrix_ITU_R_601_4: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionYCbCrMatrix_ITU_R_601_4');
end;

function kCMFormatDescriptionYCbCrMatrix_SMPTE_240M_1995: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionYCbCrMatrix_SMPTE_240M_1995');
end;

function kCMFormatDescriptionYCbCrMatrix_ITU_R_2020: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionYCbCrMatrix_ITU_R_2020');
end;

function kCMFormatDescriptionExtension_FullRangeVideo: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_FullRangeVideo');
end;

function kCMFormatDescriptionExtension_ICCProfile: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_ICCProfile');
end;

function kCMFormatDescriptionExtension_BytesPerRow: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_BytesPerRow');
end;

function kCMFormatDescriptionExtension_ChromaLocationTopField: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_ChromaLocationTopField');
end;

function kCMFormatDescriptionExtension_ChromaLocationBottomField: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_ChromaLocationBottomField');
end;

function kCMFormatDescriptionChromaLocation_Left: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionChromaLocation_Left');
end;

function kCMFormatDescriptionChromaLocation_Center: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionChromaLocation_Center');
end;

function kCMFormatDescriptionChromaLocation_TopLeft: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionChromaLocation_TopLeft');
end;

function kCMFormatDescriptionChromaLocation_Top: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionChromaLocation_Top');
end;

function kCMFormatDescriptionChromaLocation_BottomLeft: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionChromaLocation_BottomLeft');
end;

function kCMFormatDescriptionChromaLocation_Bottom: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionChromaLocation_Bottom');
end;

function kCMFormatDescriptionChromaLocation_DV420: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionChromaLocation_DV420');
end;

function kCMFormatDescriptionConformsToMPEG2VideoProfile: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionConformsToMPEG2VideoProfile');
end;

function kCMFormatDescriptionExtension_TemporalQuality: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_TemporalQuality');
end;

function kCMFormatDescriptionExtension_SpatialQuality: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_SpatialQuality');
end;

function kCMFormatDescriptionExtension_VerbatimImageDescription: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_VerbatimImageDescription');
end;

function kCMFormatDescriptionExtension_Version: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_Version');
end;

function kCMFormatDescriptionExtension_RevisionLevel: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_RevisionLevel');
end;

function kCMFormatDescriptionExtension_Vendor: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtension_Vendor');
end;

function kCMFormatDescriptionVendor_Apple: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMFormatDescriptionVendor_Apple');
end;

function kCMTextFormatDescriptionExtension_DisplayFlags: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionExtension_DisplayFlags');
end;

function kCMTextFormatDescriptionExtension_BackgroundColor: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionExtension_BackgroundColor');
end;

function kCMTextFormatDescriptionColor_Red: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionColor_Red');
end;

function kCMTextFormatDescriptionColor_Green: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionColor_Green');
end;

function kCMTextFormatDescriptionColor_Blue: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionColor_Blue');
end;

function kCMTextFormatDescriptionColor_Alpha: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionColor_Alpha');
end;

function kCMTextFormatDescriptionExtension_DefaultTextBox: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionExtension_DefaultTextBox');
end;

function kCMTextFormatDescriptionRect_Top: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTextFormatDescriptionRect_Top');
end;

function kCMTextFormatDescriptionRect_Left: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionRect_Left');
end;

function kCMTextFormatDescriptionRect_Bottom: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionRect_Bottom');
end;

function kCMTextFormatDescriptionRect_Right: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionRect_Right');
end;

function kCMTextFormatDescriptionExtension_DefaultStyle: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionExtension_DefaultStyle');
end;

function kCMTextFormatDescriptionStyle_StartChar: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionStyle_StartChar');
end;

function kCMTextFormatDescriptionStyle_Font: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionStyle_Font');
end;

function kCMTextFormatDescriptionStyle_FontFace: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionStyle_FontFace');
end;

function kCMTextFormatDescriptionStyle_ForegroundColor: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionStyle_ForegroundColor');
end;

function kCMTextFormatDescriptionStyle_FontSize: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionStyle_FontSize');
end;

function kCMTextFormatDescriptionExtension_HorizontalJustification: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionExtension_HorizontalJustification');
end;

function kCMTextFormatDescriptionExtension_VerticalJustification: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionExtension_VerticalJustification');
end;

function kCMTextFormatDescriptionStyle_EndChar: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionStyle_EndChar');
end;

function kCMTextFormatDescriptionExtension_FontTable: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionExtension_FontTable');
end;

function kCMTextFormatDescriptionExtension_TextJustification: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionExtension_TextJustification');
end;

function kCMTextFormatDescriptionStyle_Height: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionStyle_Height');
end;

function kCMTextFormatDescriptionStyle_Ascent: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionStyle_Ascent');
end;

function kCMTextFormatDescriptionExtension_DefaultFontName: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextFormatDescriptionExtension_DefaultFontName');
end;

function kCMTimeCodeFormatDescriptionExtension_SourceReferenceName: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTimeCodeFormatDescriptionExtension_SourceReferenceName');
end;

function kCMTimeCodeFormatDescriptionKey_Value: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTimeCodeFormatDescriptionKey_Value');
end;

function kCMTimeCodeFormatDescriptionKey_LangCode: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTimeCodeFormatDescriptionKey_LangCode');
end;

function kCMFormatDescriptionExtensionKey_MetadataKeyTable: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMFormatDescriptionExtensionKey_MetadataKeyTable');
end;

function kCMMetadataFormatDescriptionKey_Namespace: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataFormatDescriptionKey_Namespace');
end;

function kCMMetadataFormatDescriptionKey_Value: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataFormatDescriptionKey_Value');
end;

function kCMMetadataFormatDescriptionKey_LocalID: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataFormatDescriptionKey_LocalID');
end;

function kCMMetadataFormatDescriptionKey_DataType: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataFormatDescriptionKey_DataType');
end;

function kCMMetadataFormatDescriptionKey_DataTypeNamespace: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataFormatDescriptionKey_DataTypeNamespace');
end;

function kCMMetadataFormatDescriptionKey_ConformingDataTypes: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataFormatDescriptionKey_ConformingDataTypes');
end;

function kCMMetadataFormatDescriptionKey_LanguageTag: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataFormatDescriptionKey_LanguageTag');
end;

function kCMMetadataFormatDescriptionKey_StructuralDependency: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataFormatDescriptionKey_StructuralDependency');
end;

function kCMMetadataFormatDescription_StructuralDependencyKey_DependencyIsInvalidFlag
  : Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataFormatDescription_StructuralDependencyKey_DependencyIsInvalidFlag');
end;

function kCMMetadataFormatDescriptionMetadataSpecificationKey_Identifier
  : Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataFormatDescriptionMetadataSpecificationKey_Identifier');
end;

function kCMMetadataFormatDescriptionMetadataSpecificationKey_DataType: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataFormatDescriptionMetadataSpecificationKey_DataType');
end;

function kCMMetadataFormatDescriptionMetadataSpecificationKey_ExtendedLanguageTag
  : Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataFormatDescriptionMetadataSpecificationKey_ExtendedLanguageTag');
end;

function kCMMetadataFormatDescriptionMetadataSpecificationKey_StructuralDependency
  : Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataFormatDescriptionMetadataSpecificationKey_StructuralDependency');
end;

function kCMImageDescriptionFlavor_QuickTimeMovie: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMImageDescriptionFlavor_QuickTimeMovie');
end;

function kCMImageDescriptionFlavor_ISOFamily: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMImageDescriptionFlavor_ISOFamily');
end;

function kCMImageDescriptionFlavor_3GPFamily: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMImageDescriptionFlavor_3GPFamily');
end;

function kCMSoundDescriptionFlavor_QuickTimeMovie: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSoundDescriptionFlavor_QuickTimeMovie');
end;

function kCMSoundDescriptionFlavor_QuickTimeMovieV2: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSoundDescriptionFlavor_QuickTimeMovieV2');
end;

function kCMSoundDescriptionFlavor_ISOFamily: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSoundDescriptionFlavor_ISOFamily');
end;

function kCMSoundDescriptionFlavor_3GPFamily: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSoundDescriptionFlavor_3GPFamily');
end;

function kCMMemoryPoolOption_AgeOutPeriod: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMemoryPoolOption_AgeOutPeriod');
end;

function kCMMetadataKeySpace_QuickTimeUserData: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataKeySpace_QuickTimeUserData');
end;

function kCMMetadataKeySpace_ISOUserData: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataKeySpace_ISOUserData');
end;

function kCMMetadataKeySpace_QuickTimeMetadata: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataKeySpace_QuickTimeMetadata');
end;

function kCMMetadataKeySpace_iTunes: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataKeySpace_iTunes');
end;

function kCMMetadataKeySpace_ID3: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataKeySpace_ID3');
end;

function kCMMetadataKeySpace_Icy: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataKeySpace_Icy');
end;

function kCMMetadataKeySpace_HLSDateRange: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataKeySpace_HLSDateRange');
end;

function kCMMetadataIdentifier_QuickTimeMetadataLocation_ISO6709: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataIdentifier_QuickTimeMetadataLocation_ISO6709');
end;

function kCMMetadataIdentifier_QuickTimeMetadataDirection_Facing: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataIdentifier_QuickTimeMetadataDirection_Facing');
end;

function kCMMetadataIdentifier_QuickTimeMetadataPreferredAffineTransform
  : Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataIdentifier_QuickTimeMetadataPreferredAffineTransform');
end;

function kCMMetadataIdentifier_QuickTimeMetadataVideoOrientation: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataIdentifier_QuickTimeMetadataVideoOrientation');
end;

function kCMMetadataBaseDataType_RawData: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_RawData');
end;

function kCMMetadataBaseDataType_UTF8: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_UTF8');
end;

function kCMMetadataBaseDataType_UTF16: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_UTF16');
end;

function kCMMetadataBaseDataType_GIF: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_GIF');
end;

function kCMMetadataBaseDataType_JPEG: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_JPEG');
end;

function kCMMetadataBaseDataType_PNG: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_PNG');
end;

function kCMMetadataBaseDataType_BMP: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_BMP');
end;

function kCMMetadataBaseDataType_Float32: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_Float32');
end;

function kCMMetadataBaseDataType_Float64: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_Float64');
end;

function kCMMetadataBaseDataType_SInt8: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_SInt8');
end;

function kCMMetadataBaseDataType_SInt16: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_SInt16');
end;

function kCMMetadataBaseDataType_SInt32: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_SInt32');
end;

function kCMMetadataBaseDataType_SInt64: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_SInt64');
end;

function kCMMetadataBaseDataType_UInt8: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_UInt8');
end;

function kCMMetadataBaseDataType_UInt16: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_UInt16');
end;

function kCMMetadataBaseDataType_UInt32: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_UInt32');
end;

function kCMMetadataBaseDataType_UInt64: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_UInt64');
end;

function kCMMetadataBaseDataType_PointF32: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_PointF32');
end;

function kCMMetadataBaseDataType_DimensionsF32: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataBaseDataType_DimensionsF32');
end;

function kCMMetadataBaseDataType_RectF32: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_RectF32');
end;

function kCMMetadataBaseDataType_AffineTransformF64: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataBaseDataType_AffineTransformF64');
end;

function kCMMetadataBaseDataType_PolygonF32: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataBaseDataType_PolygonF32');
end;

function kCMMetadataBaseDataType_PolylineF32: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataBaseDataType_PolylineF32');
end;

function kCMMetadataBaseDataType_JSON: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMMetadataBaseDataType_JSON');
end;

function kCMMetadataDataType_QuickTimeMetadataLocation_ISO6709: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataDataType_QuickTimeMetadataLocation_ISO6709');
end;

function kCMMetadataDataType_QuickTimeMetadataDirection: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMMetadataDataType_QuickTimeMetadataDirection');
end;

function kCMTimingInfoInvalid: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimingInfoInvalid');
end;

function kCMSampleBufferNotification_DataBecameReady: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferNotification_DataBecameReady');
end;

function kCMSampleBufferNotification_DataFailed: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferNotification_DataFailed');
end;

function kCMSampleBufferNotificationParameter_OSStatus: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferNotificationParameter_OSStatus');
end;

function kCMSampleBufferConduitNotification_InhibitOutputUntil: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferConduitNotification_InhibitOutputUntil');
end;

function kCMSampleBufferConduitNotificationParameter_ResumeTag: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferConduitNotificationParameter_ResumeTag');
end;

function kCMSampleBufferConduitNotification_ResetOutput: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferConduitNotification_ResetOutput');
end;

function kCMSampleBufferConduitNotification_UpcomingOutputPTSRangeChanged
  : Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferConduitNotification_UpcomingOutputPTSRangeChanged');
end;

function kCMSampleBufferConduitNotificationParameter_UpcomingOutputPTSRangeMayOverlapQueuedOutputPTSRange
  : Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferConduitNotificationParameter_UpcomingOutputPTSRangeMayOverlapQueuedOutputPTSRange');
end;

function kCMSampleBufferConduitNotificationParameter_MinUpcomingOutputPTS
  : Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferConduitNotificationParameter_MinUpcomingOutputPTS');
end;

function kCMSampleBufferConduitNotificationParameter_MaxUpcomingOutputPTS
  : Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferConduitNotificationParameter_MaxUpcomingOutputPTS');
end;

function kCMSampleBufferConsumerNotification_BufferConsumed: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferConsumerNotification_BufferConsumed');
end;

function kCMSampleAttachmentKey_NotSync: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMSampleAttachmentKey_NotSync');
end;

function kCMSampleAttachmentKey_PartialSync: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleAttachmentKey_PartialSync');
end;

function kCMSampleAttachmentKey_HasRedundantCoding: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleAttachmentKey_HasRedundantCoding');
end;

function kCMSampleAttachmentKey_IsDependedOnByOthers: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleAttachmentKey_IsDependedOnByOthers');
end;

function kCMSampleAttachmentKey_DependsOnOthers: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleAttachmentKey_DependsOnOthers');
end;

function kCMSampleAttachmentKey_EarlierDisplayTimesAllowed: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleAttachmentKey_EarlierDisplayTimesAllowed');
end;

function kCMSampleAttachmentKey_DisplayImmediately: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleAttachmentKey_DisplayImmediately');
end;

function kCMSampleAttachmentKey_DoNotDisplay: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleAttachmentKey_DoNotDisplay');
end;

function kCMSampleBufferAttachmentKey_ResetDecoderBeforeDecoding: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_ResetDecoderBeforeDecoding');
end;

function kCMSampleBufferAttachmentKey_DrainAfterDecoding: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_DrainAfterDecoding');
end;

function kCMSampleBufferAttachmentKey_PostNotificationWhenConsumed: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_PostNotificationWhenConsumed');
end;

function kCMSampleBufferAttachmentKey_ResumeOutput: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_ResumeOutput');
end;

function kCMSampleBufferAttachmentKey_TransitionID: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_TransitionID');
end;

function kCMSampleBufferAttachmentKey_TrimDurationAtStart: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_TrimDurationAtStart');
end;

function kCMSampleBufferAttachmentKey_TrimDurationAtEnd: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_TrimDurationAtEnd');
end;

function kCMSampleBufferAttachmentKey_SpeedMultiplier: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_SpeedMultiplier');
end;

function kCMSampleBufferAttachmentKey_Reverse: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_Reverse');
end;

function kCMSampleBufferAttachmentKey_FillDiscontinuitiesWithSilence: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_FillDiscontinuitiesWithSilence');
end;

function kCMSampleBufferAttachmentKey_EmptyMedia: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_EmptyMedia');
end;

function kCMSampleBufferAttachmentKey_PermanentEmptyMedia: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_PermanentEmptyMedia');
end;

function kCMSampleBufferAttachmentKey_DisplayEmptyMediaImmediately: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_DisplayEmptyMediaImmediately');
end;

function kCMSampleBufferAttachmentKey_EndsPreviousSampleDuration: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_EndsPreviousSampleDuration');
end;

function kCMSampleBufferAttachmentKey_SampleReferenceURL: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_SampleReferenceURL');
end;

function kCMSampleBufferAttachmentKey_SampleReferenceByteOffset: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_SampleReferenceByteOffset');
end;

function kCMSampleBufferAttachmentKey_GradualDecoderRefresh: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_GradualDecoderRefresh');
end;

function kCMSampleBufferAttachmentKey_DroppedFrameReason: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_DroppedFrameReason');
end;

function kCMSampleBufferDroppedFrameReason_FrameWasLate: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferDroppedFrameReason_FrameWasLate');
end;

function kCMSampleBufferDroppedFrameReason_OutOfBuffers: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferDroppedFrameReason_OutOfBuffers');
end;

function kCMSampleBufferDroppedFrameReason_Discontinuity: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferDroppedFrameReason_Discontinuity');
end;

function kCMSampleBufferAttachmentKey_DroppedFrameReasonInfo: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_DroppedFrameReasonInfo');
end;

function kCMSampleBufferDroppedFrameReasonInfo_CameraModeSwitch: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferDroppedFrameReasonInfo_CameraModeSwitch');
end;

function kCMSampleBufferAttachmentKey_StillImageLensStabilizationInfo: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_StillImageLensStabilizationInfo');
end;

function kCMSampleBufferLensStabilizationInfo_Active: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferLensStabilizationInfo_Active');
end;

function kCMSampleBufferLensStabilizationInfo_OutOfRange: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferLensStabilizationInfo_OutOfRange');
end;

function kCMSampleBufferLensStabilizationInfo_Unavailable: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferLensStabilizationInfo_Unavailable');
end;

function kCMSampleBufferLensStabilizationInfo_Off: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferLensStabilizationInfo_Off');
end;

function kCMSampleBufferAttachmentKey_ForceKeyFrame: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMSampleBufferAttachmentKey_ForceKeyFrame');
end;

function kCMTextMarkupAttribute_ForegroundColorARGB: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_ForegroundColorARGB');
end;

function kCMTextMarkupAttribute_BackgroundColorARGB: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_BackgroundColorARGB');
end;

function kCMTextMarkupAttribute_CharacterBackgroundColorARGB: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_CharacterBackgroundColorARGB');
end;

function kCMTextMarkupAttribute_BoldStyle: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTextMarkupAttribute_BoldStyle');
end;

function kCMTextMarkupAttribute_ItalicStyle: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_ItalicStyle');
end;

function kCMTextMarkupAttribute_UnderlineStyle: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_UnderlineStyle');
end;

function kCMTextMarkupAttribute_FontFamilyName: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_FontFamilyName');
end;

function kCMTextMarkupAttribute_GenericFontFamilyName: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_GenericFontFamilyName');
end;

function kCMTextMarkupGenericFontName_Default: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupGenericFontName_Default');
end;

function kCMTextMarkupGenericFontName_Serif: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupGenericFontName_Serif');
end;

function kCMTextMarkupGenericFontName_SansSerif: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupGenericFontName_SansSerif');
end;

function kCMTextMarkupGenericFontName_Monospace: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupGenericFontName_Monospace');
end;

function kCMTextMarkupGenericFontName_ProportionalSerif: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupGenericFontName_ProportionalSerif');
end;

function kCMTextMarkupGenericFontName_ProportionalSansSerif: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupGenericFontName_ProportionalSansSerif');
end;

function kCMTextMarkupGenericFontName_MonospaceSerif: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupGenericFontName_MonospaceSerif');
end;

function kCMTextMarkupGenericFontName_MonospaceSansSerif: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupGenericFontName_MonospaceSansSerif');
end;

function kCMTextMarkupGenericFontName_Casual: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupGenericFontName_Casual');
end;

function kCMTextMarkupGenericFontName_Cursive: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupGenericFontName_Cursive');
end;

function kCMTextMarkupGenericFontName_Fantasy: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupGenericFontName_Fantasy');
end;

function kCMTextMarkupGenericFontName_SmallCapital: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupGenericFontName_SmallCapital');
end;

function kCMTextMarkupAttribute_BaseFontSizePercentageRelativeToVideoHeight
  : Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_BaseFontSizePercentageRelativeToVideoHeight');
end;

function kCMTextMarkupAttribute_RelativeFontSize: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_RelativeFontSize');
end;

function kCMTextMarkupAttribute_VerticalLayout: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_VerticalLayout');
end;

function kCMTextVerticalLayout_LeftToRight: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextVerticalLayout_LeftToRight');
end;

function kCMTextVerticalLayout_RightToLeft: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextVerticalLayout_RightToLeft');
end;

function kCMTextMarkupAttribute_Alignment: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTextMarkupAttribute_Alignment');
end;

function kCMTextMarkupAlignmentType_Start: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTextMarkupAlignmentType_Start');
end;

function kCMTextMarkupAlignmentType_Middle: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAlignmentType_Middle');
end;

function kCMTextMarkupAlignmentType_End: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTextMarkupAlignmentType_End');
end;

function kCMTextMarkupAlignmentType_Left: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTextMarkupAlignmentType_Left');
end;

function kCMTextMarkupAlignmentType_Right: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTextMarkupAlignmentType_Right');
end;

function kCMTextMarkupAttribute_TextPositionPercentageRelativeToWritingDirection
  : Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_TextPositionPercentageRelativeToWritingDirection');
end;

function kCMTextMarkupAttribute_OrthogonalLinePositionPercentageRelativeToWritingDirection
  : Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_OrthogonalLinePositionPercentageRelativeToWritingDirection');
end;

function kCMTextMarkupAttribute_WritingDirectionSizePercentage: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_WritingDirectionSizePercentage');
end;

function kCMTextMarkupAttribute_CharacterEdgeStyle: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupAttribute_CharacterEdgeStyle');
end;

function kCMTextMarkupCharacterEdgeStyle_None: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupCharacterEdgeStyle_None');
end;

function kCMTextMarkupCharacterEdgeStyle_Raised: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupCharacterEdgeStyle_Raised');
end;

function kCMTextMarkupCharacterEdgeStyle_Depressed: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupCharacterEdgeStyle_Depressed');
end;

function kCMTextMarkupCharacterEdgeStyle_Uniform: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupCharacterEdgeStyle_Uniform');
end;

function kCMTextMarkupCharacterEdgeStyle_DropShadow: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia,
    'kCMTextMarkupCharacterEdgeStyle_DropShadow');
end;

function kCMTimeRangeZero: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeRangeZero');
end;

function kCMTimeRangeInvalid: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeRangeInvalid');
end;

function kCMTimeRangeStartKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeRangeStartKey');
end;

function kCMTimeRangeDurationKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeRangeDurationKey');
end;

function kCMTimeMappingInvalid: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeMappingInvalid');
end;

function kCMTimeMappingSourceKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeMappingSourceKey');
end;

function kCMTimeMappingTargetKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreMedia, 'kCMTimeMappingTargetKey');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreMediaModule := dlopen(MarshaledAString(libCoreMedia), RTLD_LAZY);

finalization

dlclose(CoreMediaModule);
{$ENDIF IOS}

end.
