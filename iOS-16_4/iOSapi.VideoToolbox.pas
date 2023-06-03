{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework VideoToolbox
//

unit iOSapi.VideoToolbox;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.CoreMedia,
  iOSapi.CoreVideo,
  iOSapi.Foundation;

const
  kVTUnlimitedFrameDelayCount = -1;
  kVTPropertyNotSupportedErr = -12900;
  kVTPropertyReadOnlyErr = -12901;
  kVTParameterErr = -12902;
  kVTInvalidSessionErr = -12903;
  kVTAllocationFailedErr = -12904;
  kVTPixelTransferNotSupportedErr = -12905;
  kVTCouldNotFindVideoDecoderErr = -12906;
  kVTCouldNotCreateInstanceErr = -12907;
  kVTCouldNotFindVideoEncoderErr = -12908;
  kVTVideoDecoderBadDataErr = -12909;
  kVTVideoDecoderUnsupportedDataFormatErr = -12910;
  kVTVideoDecoderMalfunctionErr = -12911;
  kVTVideoEncoderMalfunctionErr = -12912;
  kVTVideoDecoderNotAvailableNowErr = -12913;
  kVTImageRotationNotSupportedErr = -12914;
  kVTPixelRotationNotSupportedErr = -12914;
  kVTVideoEncoderNotAvailableNowErr = -12915;
  kVTFormatDescriptionChangeNotSupportedErr = -12916;
  kVTInsufficientSourceColorDataErr = -12917;
  kVTCouldNotCreateColorCorrectionDataErr = -12918;
  kVTColorSyncTransformConvertFailedErr = -12919;
  kVTVideoDecoderAuthorizationErr = -12210;
  kVTVideoEncoderAuthorizationErr = -12211;
  kVTColorCorrectionPixelTransferFailedErr = -12212;
  kVTMultiPassStorageIdentifierMismatchErr = -12213;
  kVTMultiPassStorageInvalidErr = -12214;
  kVTFrameSiloInvalidTimeStampErr = -12215;
  kVTFrameSiloInvalidTimeRangeErr = -12216;
  kVTCouldNotFindTemporalFilterErr = -12217;
  kVTPixelTransferNotPermittedErr = -12218;
  kVTColorCorrectionImageRotationFailedErr = -12219;
  kVTVideoDecoderRemovedErr = -17690;
  kVTSessionMalfunctionErr = -17691;
  kVTVideoDecoderNeedsRosettaErr = -17692;
  kVTVideoEncoderNeedsRosettaErr = -17693;
  kVTVideoDecoderReferenceMissingErr = -17694;
  kVTVideoDecoderCallbackMessagingErr = -17695;
  kVTVideoDecoderUnknownErr = -17696;
  kVTDecodeFrame_EnableAsynchronousDecompression = 1 shl 0;
  kVTDecodeFrame_DoNotOutputFrame = 1 shl 1;
  kVTDecodeFrame_1xRealTimePlayback = 1 shl 2;
  kVTDecodeFrame_EnableTemporalProcessing = 1 shl 3;
  kVTDecodeInfo_Asynchronous = 1 shl 0;
  kVTDecodeInfo_FrameDropped = 1 shl 1;
  kVTDecodeInfo_ImageBufferModifiable = 1 shl 2;
  kVTEncodeInfo_Asynchronous = 1 shl 0;
  kVTEncodeInfo_FrameDropped = 1 shl 1;
  kVTCompressionSessionBeginFinalPass = 1 shl 0;

type
  // ===== Framework typedefs =====
{$M+}
  VTInt32Point = record
    x: Int32;
    y: Int32;
  end;

  PVTInt32Point = ^VTInt32Point;

  VTInt32Size = record
    width: Int32;
    height: Int32;
  end;

  PVTInt32Size = ^VTInt32Size;

  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  VTDecodeFrameFlags = LongWord;
  VTDecodeInfoFlags = UInt32;
  VTEncodeInfoFlags = UInt32;
  CFTypeRef = Pointer;
  PCFTypeRef = ^CFTypeRef;
  VTSessionRef = CFTypeRef;
  PVTSessionRef = ^VTSessionRef;
  OSStatus = Int32;
  POSStatus = ^OSStatus;
  CFAllocatorRef = Pointer;
  PCFAllocatorRef = ^CFAllocatorRef;
  CFDictionaryRef = Pointer;
  PCFDictionaryRef = ^CFDictionaryRef;
  VTCompressionSessionRef = Pointer;
  PVTCompressionSessionRef = ^VTCompressionSessionRef;
  CMSampleBufferRef = Pointer;
  PCMSampleBufferRef = ^CMSampleBufferRef;
  VTCompressionOutputCallback = procedure(param1: Pointer; param2: Pointer;
    param3: OSStatus; param4: VTEncodeInfoFlags;
    param5: CMSampleBufferRef); cdecl;
  PVTCompressionOutputCallback = ^VTCompressionOutputCallback;
  FourCharCode = UInt32;
  PFourCharCode = ^FourCharCode;
  CMVideoCodecType = FourCharCode;
  PCMVideoCodecType = ^CMVideoCodecType;
  CFTypeID = LongWord;
  PCFTypeID = ^CFTypeID;

  CVPixelBufferPoolRef = Pointer;
  PCVPixelBufferPoolRef = ^CVPixelBufferPoolRef;
  CVBufferRef = Pointer;
  PCVBufferRef = ^CVBufferRef;
  CVImageBufferRef = CVBufferRef;
  PCVImageBufferRef = ^CVImageBufferRef;
  CMTimeValue = Int64;
  PCMTimeValue = ^CMTimeValue;
  CMTimeScale = Int32;
  PCMTimeScale = ^CMTimeScale;
  CMTimeFlags = LongWord;
  CMTimeEpoch = Int64;
  PCMTimeEpoch = ^CMTimeEpoch;

  CMTime = record
    value: CMTimeValue;
    timescale: CMTimeScale;
    flags: CMTimeFlags;
    epoch: CMTimeEpoch;
  end;

  PCMTime = ^CMTime;

  VTCompressionOutputHandler = procedure(param1: OSStatus;
    param2: VTEncodeInfoFlags; param3: CMSampleBufferRef) of object;
  VTCompressionSessionOptionFlags = LongWord;
  VTDecompressionSessionRef = Pointer;
  PVTDecompressionSessionRef = ^VTDecompressionSessionRef;
  VTDecompressionOutputCallback = procedure(param1: Pointer; param2: Pointer;
    param3: OSStatus; param4: VTDecodeInfoFlags; param5: CVImageBufferRef;
    param6: CMTime; param7: CMTime); cdecl;
  PVTDecompressionOutputCallback = ^VTDecompressionOutputCallback;

  VTDecompressionOutputCallbackRecord = record
    decompressionOutputCallback: VTDecompressionOutputCallback;
    decompressionOutputRefCon: Pointer;
  end;

  PVTDecompressionOutputCallbackRecord = ^VTDecompressionOutputCallbackRecord;

  CMFormatDescriptionRef = Pointer;
  PCMFormatDescriptionRef = ^CMFormatDescriptionRef;
  CMVideoFormatDescriptionRef = CMFormatDescriptionRef;
  PCMVideoFormatDescriptionRef = ^CMVideoFormatDescriptionRef;
  VTDecompressionOutputHandler = procedure(param1: OSStatus;
    param2: VTDecodeInfoFlags; param3: CVImageBufferRef; param4: CMTime;
    param5: CMTime) of object;
  Boolean = Byte;
  PBoolean = ^Boolean;

  VTFrameSiloRef = Pointer;
  PVTFrameSiloRef = ^VTFrameSiloRef;
  CFURLRef = Pointer;
  PCFURLRef = ^CFURLRef;

  CMTimeRange = record
    start: CMTime;
    duration: CMTime;
  end;

  PCMTimeRange = ^CMTimeRange;

  CFIndex = LongInt;
  PCFIndex = ^CFIndex;

  CMItemCount = CFIndex;
  PCMItemCount = ^CMItemCount;
  TVideoToolboxCallback = function(param1: Pointer; param2: CMSampleBufferRef)
    : OSStatus; cdecl;
  TVideoToolboxHandler = function(param1: CMSampleBufferRef): OSStatus; cdecl;
  VTMultiPassStorageRef = Pointer;
  PVTMultiPassStorageRef = ^VTMultiPassStorageRef;
  CVPixelBufferRef = CVImageBufferRef;
  PCVPixelBufferRef = ^CVPixelBufferRef;
  VTPixelTransferSessionRef = Pointer;
  PVTPixelTransferSessionRef = ^VTPixelTransferSessionRef;
  VTPixelRotationSessionRef = Pointer;
  PVTPixelRotationSessionRef = ^VTPixelRotationSessionRef;
  // ===== Exported string consts =====

function kVTCompressionPropertyKey_NumberOfPendingFrames: Pointer;
function kVTCompressionPropertyKey_PixelBufferPoolIsShared: Pointer;
function kVTCompressionPropertyKey_VideoEncoderPixelBufferAttributes: Pointer;
function kVTCompressionPropertyKey_MaxKeyFrameInterval: Pointer;
function kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration: Pointer;
function kVTCompressionPropertyKey_AllowTemporalCompression: Pointer;
function kVTCompressionPropertyKey_AllowFrameReordering: Pointer;
function kVTCompressionPropertyKey_AllowOpenGOP: Pointer;
function kVTCompressionPropertyKey_AverageBitRate: Pointer;
function kVTCompressionPropertyKey_DataRateLimits: Pointer;
function kVTCompressionPropertyKey_Quality: Pointer;
function kVTCompressionPropertyKey_TargetQualityForAlpha: Pointer;
function kVTCompressionPropertyKey_MoreFramesBeforeStart: Pointer;
function kVTCompressionPropertyKey_MoreFramesAfterEnd: Pointer;
function kVTCompressionPropertyKey_PrioritizeEncodingSpeedOverQuality: Pointer;
function kVTCompressionPropertyKey_ConstantBitRate: Pointer;
function kVTCompressionPropertyKey_EstimatedAverageBytesPerFrame: Pointer;
function kVTCompressionPropertyKey_ProfileLevel: Pointer;
function kVTProfileLevel_HEVC_Main_AutoLevel: Pointer;
function kVTProfileLevel_HEVC_Main10_AutoLevel: Pointer;
function kVTProfileLevel_HEVC_Main42210_AutoLevel: Pointer;
function kVTProfileLevel_H264_Baseline_1_3: Pointer;
function kVTProfileLevel_H264_Baseline_3_0: Pointer;
function kVTProfileLevel_H264_Baseline_3_1: Pointer;
function kVTProfileLevel_H264_Baseline_3_2: Pointer;
function kVTProfileLevel_H264_Baseline_4_0: Pointer;
function kVTProfileLevel_H264_Baseline_4_1: Pointer;
function kVTProfileLevel_H264_Baseline_4_2: Pointer;
function kVTProfileLevel_H264_Baseline_5_0: Pointer;
function kVTProfileLevel_H264_Baseline_5_1: Pointer;
function kVTProfileLevel_H264_Baseline_5_2: Pointer;
function kVTProfileLevel_H264_Baseline_AutoLevel: Pointer;
function kVTProfileLevel_H264_ConstrainedBaseline_AutoLevel: Pointer;
function kVTProfileLevel_H264_Main_3_0: Pointer;
function kVTProfileLevel_H264_Main_3_1: Pointer;
function kVTProfileLevel_H264_Main_3_2: Pointer;
function kVTProfileLevel_H264_Main_4_0: Pointer;
function kVTProfileLevel_H264_Main_4_1: Pointer;
function kVTProfileLevel_H264_Main_4_2: Pointer;
function kVTProfileLevel_H264_Main_5_0: Pointer;
function kVTProfileLevel_H264_Main_5_1: Pointer;
function kVTProfileLevel_H264_Main_5_2: Pointer;
function kVTProfileLevel_H264_Main_AutoLevel: Pointer;
function kVTProfileLevel_H264_Extended_5_0: Pointer;
function kVTProfileLevel_H264_Extended_AutoLevel: Pointer;
function kVTProfileLevel_H264_High_3_0: Pointer;
function kVTProfileLevel_H264_High_3_1: Pointer;
function kVTProfileLevel_H264_High_3_2: Pointer;
function kVTProfileLevel_H264_High_4_0: Pointer;
function kVTProfileLevel_H264_High_4_1: Pointer;
function kVTProfileLevel_H264_High_4_2: Pointer;
function kVTProfileLevel_H264_High_5_0: Pointer;
function kVTProfileLevel_H264_High_5_1: Pointer;
function kVTProfileLevel_H264_High_5_2: Pointer;
function kVTProfileLevel_H264_High_AutoLevel: Pointer;
function kVTProfileLevel_H264_ConstrainedHigh_AutoLevel: Pointer;
function kVTProfileLevel_MP4V_Simple_L0: Pointer;
function kVTProfileLevel_MP4V_Simple_L1: Pointer;
function kVTProfileLevel_MP4V_Simple_L2: Pointer;
function kVTProfileLevel_MP4V_Simple_L3: Pointer;
function kVTProfileLevel_MP4V_Main_L2: Pointer;
function kVTProfileLevel_MP4V_Main_L3: Pointer;
function kVTProfileLevel_MP4V_Main_L4: Pointer;
function kVTProfileLevel_MP4V_AdvancedSimple_L0: Pointer;
function kVTProfileLevel_MP4V_AdvancedSimple_L1: Pointer;
function kVTProfileLevel_MP4V_AdvancedSimple_L2: Pointer;
function kVTProfileLevel_MP4V_AdvancedSimple_L3: Pointer;
function kVTProfileLevel_MP4V_AdvancedSimple_L4: Pointer;
function kVTProfileLevel_H263_Profile0_Level10: Pointer;
function kVTProfileLevel_H263_Profile0_Level45: Pointer;
function kVTProfileLevel_H263_Profile3_Level45: Pointer;
function kVTCompressionPropertyKey_OutputBitDepth: Pointer;
function kVTCompressionPropertyKey_HDRMetadataInsertionMode: Pointer;
function kVTHDRMetadataInsertionMode_None: Pointer;
function kVTHDRMetadataInsertionMode_Auto: Pointer;
function kVTCompressionPropertyKey_H264EntropyMode: Pointer;
function kVTH264EntropyMode_CAVLC: Pointer;
function kVTH264EntropyMode_CABAC: Pointer;
function kVTCompressionPropertyKey_Depth: Pointer;
function kVTCompressionPropertyKey_PreserveAlphaChannel: Pointer;
function kVTCompressionPropertyKey_MaxFrameDelayCount: Pointer;
function kVTCompressionPropertyKey_MaxH264SliceBytes: Pointer;
function kVTCompressionPropertyKey_RealTime: Pointer;
function kVTCompressionPropertyKey_MaximizePowerEfficiency: Pointer;
function kVTCompressionPropertyKey_SourceFrameCount: Pointer;
function kVTCompressionPropertyKey_ExpectedFrameRate: Pointer;
function kVTCompressionPropertyKey_BaseLayerFrameRateFraction: Pointer;
function kVTCompressionPropertyKey_BaseLayerBitRateFraction: Pointer;
function kVTCompressionPropertyKey_ExpectedDuration: Pointer;
function kVTCompressionPropertyKey_BaseLayerFrameRate: Pointer;
function kVTCompressionPropertyKey_ReferenceBufferCount: Pointer;
function kVTVideoEncoderSpecification_RequiredEncoderGPURegistryID: Pointer;
function kVTVideoEncoderSpecification_PreferredEncoderGPURegistryID: Pointer;
function kVTCompressionPropertyKey_UsingGPURegistryID: Pointer;
function kVTCompressionPropertyKey_SupportsBaseFrameQP: Pointer;
function kVTEncodeFrameOptionKey_ForceKeyFrame: Pointer;
function kVTEncodeFrameOptionKey_BaseFrameQP: Pointer;
function kVTCompressionPropertyKey_CleanAperture: Pointer;
function kVTCompressionPropertyKey_PixelAspectRatio: Pointer;
function kVTCompressionPropertyKey_FieldCount: Pointer;
function kVTCompressionPropertyKey_FieldDetail: Pointer;
function kVTCompressionPropertyKey_AspectRatio16x9: Pointer;
function kVTCompressionPropertyKey_ProgressiveScan: Pointer;
function kVTCompressionPropertyKey_ColorPrimaries: Pointer;
function kVTCompressionPropertyKey_TransferFunction: Pointer;
function kVTCompressionPropertyKey_YCbCrMatrix: Pointer;
function kVTCompressionPropertyKey_ICCProfile: Pointer;
function kVTCompressionPropertyKey_MasteringDisplayColorVolume: Pointer;
function kVTCompressionPropertyKey_ContentLightLevelInfo: Pointer;
function kVTCompressionPropertyKey_GammaLevel: Pointer;
function kVTCompressionPropertyKey_AlphaChannelMode: Pointer;
function kVTAlphaChannelMode_StraightAlpha: Pointer;
function kVTAlphaChannelMode_PremultipliedAlpha: Pointer;
function kVTCompressionPropertyKey_PixelTransferProperties: Pointer;
function kVTCompressionPropertyKey_MultiPassStorage: Pointer;
function kVTCompressionPropertyKey_EncoderID: Pointer;
function kVTCompressionPropertyKey_PreserveDynamicHDRMetadata: Pointer;
function kVTVideoEncoderSpecification_EnableLowLatencyRateControl: Pointer;
function kVTCompressionPropertyKey_MaxAllowedFrameQP: Pointer;
function kVTCompressionPropertyKey_MinAllowedFrameQP: Pointer;
function kVTCompressionPropertyKey_EnableLTR: Pointer;
function kVTEncodeFrameOptionKey_AcknowledgedLTRTokens: Pointer;
function kVTEncodeFrameOptionKey_ForceLTRRefresh: Pointer;
function kVTSampleAttachmentKey_RequireLTRAcknowledgementToken: Pointer;
function kVTPropertyTypeKey: Pointer;
function kVTPropertyType_Enumeration: Pointer;
function kVTPropertyType_Boolean: Pointer;
function kVTPropertyType_Number: Pointer;
function kVTPropertyReadWriteStatusKey: Pointer;
function kVTPropertyReadWriteStatus_ReadOnly: Pointer;
function kVTPropertyReadWriteStatus_ReadWrite: Pointer;
function kVTPropertyShouldBeSerializedKey: Pointer;
function kVTPropertySupportedValueMinimumKey: Pointer;
function kVTPropertySupportedValueMaximumKey: Pointer;
function kVTPropertySupportedValueListKey: Pointer;
function kVTPropertyDocumentationKey: Pointer;
function kVTVideoEncoderSpecification_EncoderID: Pointer;
function kVTDecompressionPropertyKey_PixelBufferPool: Pointer;
function kVTDecompressionPropertyKey_PixelBufferPoolIsShared: Pointer;
function kVTDecompressionPropertyKey_OutputPoolRequestedMinimumBufferCount
  : Pointer;
function kVTDecompressionPropertyKey_NumberOfFramesBeingDecoded: Pointer;
function kVTDecompressionPropertyKey_MinOutputPresentationTimeStampOfFramesBeingDecoded
  : Pointer;
function kVTDecompressionPropertyKey_MaxOutputPresentationTimeStampOfFramesBeingDecoded
  : Pointer;
function kVTDecompressionPropertyKey_ContentHasInterframeDependencies: Pointer;
function kVTDecompressionPropertyKey_RealTime: Pointer;
function kVTDecompressionPropertyKey_MaximizePowerEfficiency: Pointer;
function kVTDecompressionPropertyKey_ThreadCount: Pointer;
function kVTDecompressionPropertyKey_FieldMode: Pointer;
function kVTDecompressionProperty_FieldMode_BothFields: Pointer;
function kVTDecompressionProperty_FieldMode_TopFieldOnly: Pointer;
function kVTDecompressionProperty_FieldMode_BottomFieldOnly: Pointer;
function kVTDecompressionProperty_FieldMode_SingleField: Pointer;
function kVTDecompressionProperty_FieldMode_DeinterlaceFields: Pointer;
function kVTDecompressionPropertyKey_DeinterlaceMode: Pointer;
function kVTDecompressionProperty_DeinterlaceMode_VerticalFilter: Pointer;
function kVTDecompressionProperty_DeinterlaceMode_Temporal: Pointer;
function kVTDecompressionPropertyKey_ReducedResolutionDecode: Pointer;
function kVTDecompressionResolutionKey_Width: Pointer;
function kVTDecompressionResolutionKey_Height: Pointer;
function kVTDecompressionPropertyKey_ReducedCoefficientDecode: Pointer;
function kVTDecompressionPropertyKey_ReducedFrameDelivery: Pointer;
function kVTDecompressionPropertyKey_OnlyTheseFrames: Pointer;
function kVTDecompressionProperty_OnlyTheseFrames_AllFrames: Pointer;
function kVTDecompressionProperty_OnlyTheseFrames_NonDroppableFrames: Pointer;
function kVTDecompressionProperty_OnlyTheseFrames_IFrames: Pointer;
function kVTDecompressionProperty_OnlyTheseFrames_KeyFrames: Pointer;
function kVTDecompressionProperty_TemporalLevelLimit: Pointer;
function kVTDecompressionPropertyKey_SuggestedQualityOfServiceTiers: Pointer;
function kVTDecompressionPropertyKey_SupportedPixelFormatsOrderedByQuality
  : Pointer;
function kVTDecompressionPropertyKey_SupportedPixelFormatsOrderedByPerformance
  : Pointer;
function kVTDecompressionPropertyKey_PixelFormatsWithReducedResolutionSupport
  : Pointer;
function kVTDecompressionPropertyKey_PixelTransferProperties: Pointer;
function kVTVideoDecoderSpecification_RequiredDecoderGPURegistryID: Pointer;
function kVTVideoDecoderSpecification_PreferredDecoderGPURegistryID: Pointer;
function kVTDecompressionPropertyKey_UsingGPURegistryID: Pointer;
function kVTDecompressionPropertyKey_PropagatePerFrameHDRDisplayMetadata
  : Pointer;
function kVTMultiPassStorageCreationOption_DoNotDelete: Pointer;
function kVTVideoEncoderListOption_IncludeStandardDefinitionDVEncoders: Pointer;
function kVTVideoEncoderList_CodecType: Pointer;
function kVTVideoEncoderList_EncoderID: Pointer;
function kVTVideoEncoderList_CodecName: Pointer;
function kVTVideoEncoderList_EncoderName: Pointer;
function kVTVideoEncoderList_DisplayName: Pointer;
function kVTVideoEncoderList_GPURegistryID: Pointer;
function kVTVideoEncoderList_SupportedSelectionProperties: Pointer;
function kVTVideoEncoderList_PerformanceRating: Pointer;
function kVTVideoEncoderList_QualityRating: Pointer;
function kVTVideoEncoderList_InstanceLimit: Pointer;
function kVTVideoEncoderList_IsHardwareAccelerated: Pointer;
function kVTVideoEncoderList_SupportsFrameReordering: Pointer;
function kVTVideoEncoderList_SupportsMultiPass: Pointer;
function kVTPixelTransferPropertyKey_ScalingMode: Pointer;
function kVTScalingMode_Normal: Pointer;
function kVTScalingMode_CropSourceToCleanAperture: Pointer;
function kVTScalingMode_Letterbox: Pointer;
function kVTScalingMode_Trim: Pointer;
function kVTPixelTransferPropertyKey_DestinationCleanAperture: Pointer;
function kVTPixelTransferPropertyKey_DestinationPixelAspectRatio: Pointer;
function kVTPixelTransferPropertyKey_DownsamplingMode: Pointer;
function kVTDownsamplingMode_Decimate: Pointer;
function kVTDownsamplingMode_Average: Pointer;
function kVTPixelTransferPropertyKey_DestinationColorPrimaries: Pointer;
function kVTPixelTransferPropertyKey_DestinationTransferFunction: Pointer;
function kVTPixelTransferPropertyKey_DestinationICCProfile: Pointer;
function kVTPixelTransferPropertyKey_DestinationYCbCrMatrix: Pointer;
function kVTPixelTransferPropertyKey_RealTime: Pointer;
function kVTPixelRotationPropertyKey_Rotation: Pointer;
function kVTRotation_0: Pointer;
function kVTRotation_CW90: Pointer;
function kVTRotation_180: Pointer;
function kVTRotation_CCW90: Pointer;
function kVTPixelRotationPropertyKey_FlipHorizontalOrientation: Pointer;
function kVTPixelRotationPropertyKey_FlipVerticalOrientation: Pointer;


// ===== External functions =====

const
  libVideoToolbox =
    '/System/Library/Frameworks/VideoToolbox.framework/VideoToolbox';
function VTSessionCopySupportedPropertyDictionary(session: VTSessionRef;
  supportedPropertyDictionaryOut: Pointer): OSStatus; cdecl;
  external libVideoToolbox name _PU +
  'VTSessionCopySupportedPropertyDictionary';
function VTSessionSetProperty(session: VTSessionRef; propertyKey: CFStringRef;
  propertyValue: CFTypeRef): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTSessionSetProperty';
function VTSessionCopyProperty(session: VTSessionRef; propertyKey: CFStringRef;
  allocator: CFAllocatorRef; propertyValueOut: Pointer): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTSessionCopyProperty';
function VTSessionSetProperties(session: VTSessionRef;
  propertyDictionary: CFDictionaryRef): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTSessionSetProperties';
function VTSessionCopySerializableProperties(session: VTSessionRef;
  allocator: CFAllocatorRef; dictionaryOut: PCFDictionaryRef): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTSessionCopySerializableProperties';
function VTCompressionSessionCreate(allocator: CFAllocatorRef; width: Int32;
  height: Int32; codecType: CMVideoCodecType;
  encoderSpecification: CFDictionaryRef;
  sourceImageBufferAttributes: CFDictionaryRef;
  compressedDataAllocator: CFAllocatorRef;
  outputCallback: VTCompressionOutputCallback; outputCallbackRefCon: Pointer;
  compressionSessionOut: PVTCompressionSessionRef): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTCompressionSessionCreate';
procedure VTCompressionSessionInvalidate(session: VTCompressionSessionRef);
  cdecl; external libVideoToolbox name _PU + 'VTCompressionSessionInvalidate';
function VTCompressionSessionGetTypeID: CFTypeID; cdecl;
  external libVideoToolbox name _PU + 'VTCompressionSessionGetTypeID';
function VTCompressionSessionGetPixelBufferPool
  (session: VTCompressionSessionRef): CVPixelBufferPoolRef; cdecl;
  external libVideoToolbox name _PU + 'VTCompressionSessionGetPixelBufferPool';
function VTCompressionSessionPrepareToEncodeFrames
  (session: VTCompressionSessionRef): OSStatus; cdecl;
  external libVideoToolbox name _PU +
  'VTCompressionSessionPrepareToEncodeFrames';
function VTCompressionSessionEncodeFrame(session: VTCompressionSessionRef;
  imageBuffer: CVImageBufferRef; presentationTimeStamp: CMTime;
  duration: CMTime; frameProperties: CFDictionaryRef;
  sourceFrameRefcon: Pointer; infoFlagsOut: PVTEncodeInfoFlags): OSStatus;
  cdecl; external libVideoToolbox name _PU + 'VTCompressionSessionEncodeFrame';
function VTCompressionSessionEncodeFrameWithOutputHandler
  (session: VTCompressionSessionRef; imageBuffer: CVImageBufferRef;
  presentationTimeStamp: CMTime; duration: CMTime;
  frameProperties: CFDictionaryRef; infoFlagsOut: PVTEncodeInfoFlags;
  outputHandler: VTCompressionOutputHandler): OSStatus; cdecl;
  external libVideoToolbox name _PU +
  'VTCompressionSessionEncodeFrameWithOutputHandler';
function VTCompressionSessionCompleteFrames(session: VTCompressionSessionRef;
  completeUntilPresentationTimeStamp: CMTime): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTCompressionSessionCompleteFrames';
function VTCompressionSessionBeginPass(session: VTCompressionSessionRef;
  beginPassFlags: VTCompressionSessionOptionFlags; reserved: PLongWord)
  : OSStatus; cdecl; external libVideoToolbox name _PU +
  'VTCompressionSessionBeginPass';
function VTCompressionSessionEndPass(session: VTCompressionSessionRef;
  furtherPassesRequestedOut: PByte; reserved: PLongWord): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTCompressionSessionEndPass';
function VTCompressionSessionGetTimeRangesForNextPass
  (session: VTCompressionSessionRef; timeRangeCountOut: PLongInt;
  timeRangeArrayOut: Pointer): OSStatus; cdecl;
  external libVideoToolbox name _PU +
  'VTCompressionSessionGetTimeRangesForNextPass';
function VTDecompressionSessionCreate(allocator: CFAllocatorRef;
  videoFormatDescription: CMVideoFormatDescriptionRef;
  videoDecoderSpecification: CFDictionaryRef;
  destinationImageBufferAttributes: CFDictionaryRef;
  outputCallback: PVTDecompressionOutputCallbackRecord;
  decompressionSessionOut: PVTDecompressionSessionRef): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTDecompressionSessionCreate';
procedure VTDecompressionSessionInvalidate(session: VTDecompressionSessionRef);
  cdecl; external libVideoToolbox name _PU + 'VTDecompressionSessionInvalidate';
function VTDecompressionSessionGetTypeID: CFTypeID; cdecl;
  external libVideoToolbox name _PU + 'VTDecompressionSessionGetTypeID';
function VTDecompressionSessionDecodeFrame(session: VTDecompressionSessionRef;
  sampleBuffer: CMSampleBufferRef; decodeFlags: VTDecodeFrameFlags;
  sourceFrameRefcon: Pointer; infoFlagsOut: PVTDecodeInfoFlags): OSStatus;
  cdecl; external libVideoToolbox name _PU +
  'VTDecompressionSessionDecodeFrame';
function VTDecompressionSessionDecodeFrameWithOutputHandler
  (session: VTDecompressionSessionRef; sampleBuffer: CMSampleBufferRef;
  decodeFlags: VTDecodeFrameFlags; infoFlagsOut: PVTDecodeInfoFlags;
  outputHandler: VTDecompressionOutputHandler): OSStatus; cdecl;
  external libVideoToolbox name _PU +
  'VTDecompressionSessionDecodeFrameWithOutputHandler';
function VTDecompressionSessionFinishDelayedFrames
  (session: VTDecompressionSessionRef): OSStatus; cdecl;
  external libVideoToolbox name _PU +
  'VTDecompressionSessionFinishDelayedFrames';
function VTDecompressionSessionCanAcceptFormatDescription
  (session: VTDecompressionSessionRef; newFormatDesc: CMFormatDescriptionRef)
  : Boolean; cdecl; external libVideoToolbox name _PU +
  'VTDecompressionSessionCanAcceptFormatDescription';
function VTDecompressionSessionWaitForAsynchronousFrames
  (session: VTDecompressionSessionRef): OSStatus; cdecl;
  external libVideoToolbox name _PU +
  'VTDecompressionSessionWaitForAsynchronousFrames';
function VTDecompressionSessionCopyBlackPixelBuffer
  (session: VTDecompressionSessionRef; pixelBufferOut: PCVImageBufferRef)
  : OSStatus; cdecl; external libVideoToolbox name _PU +
  'VTDecompressionSessionCopyBlackPixelBuffer';
function VTIsHardwareDecodeSupported(codecType: CMVideoCodecType): Boolean;
  cdecl; external libVideoToolbox name _PU + 'VTIsHardwareDecodeSupported';
function VTFrameSiloGetTypeID: CFTypeID; cdecl;
  external libVideoToolbox name _PU + 'VTFrameSiloGetTypeID';
function VTFrameSiloCreate(allocator: CFAllocatorRef; fileURL: CFURLRef;
  timeRange: CMTimeRange; options: CFDictionaryRef;
  frameSiloOut: PVTFrameSiloRef): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTFrameSiloCreate';
function VTFrameSiloAddSampleBuffer(silo: VTFrameSiloRef;
  sampleBuffer: CMSampleBufferRef): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTFrameSiloAddSampleBuffer';
function VTFrameSiloSetTimeRangesForNextPass(silo: VTFrameSiloRef;
  timeRangeCount: CMItemCount; timeRangeArray: PCMTimeRange): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTFrameSiloSetTimeRangesForNextPass';
function VTFrameSiloGetProgressOfCurrentPass(silo: VTFrameSiloRef;
  progressOut: PSingle): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTFrameSiloGetProgressOfCurrentPass';
function VTFrameSiloCallFunctionForEachSampleBuffer(silo: VTFrameSiloRef;
  timeRange: CMTimeRange; refcon: Pointer; callback: TVideoToolboxCallback)
  : OSStatus; cdecl; external libVideoToolbox name _PU +
  'VTFrameSiloCallFunctionForEachSampleBuffer';
function VTFrameSiloCallBlockForEachSampleBuffer(silo: VTFrameSiloRef;
  timeRange: CMTimeRange; handler: TVideoToolboxHandler): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTFrameSiloCallBlockForEachSampleBuffer';
function VTMultiPassStorageGetTypeID: CFTypeID; cdecl;
  external libVideoToolbox name _PU + 'VTMultiPassStorageGetTypeID';
function VTMultiPassStorageCreate(allocator: CFAllocatorRef; fileURL: CFURLRef;
  timeRange: CMTimeRange; options: CFDictionaryRef;
  multiPassStorageOut: PVTMultiPassStorageRef): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTMultiPassStorageCreate';
function VTMultiPassStorageClose(multiPassStorage: VTMultiPassStorageRef)
  : OSStatus; cdecl; external libVideoToolbox name _PU +
  'VTMultiPassStorageClose';
function VTCopyVideoEncoderList(options: CFDictionaryRef;
  listOfVideoEncodersOut: Pointer): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTCopyVideoEncoderList';
function VTCopySupportedPropertyDictionaryForEncoder(width: Int32;
  height: Int32; codecType: CMVideoCodecType;
  encoderSpecification: CFDictionaryRef; encoderIDOut: PCFStringRef;
  supportedPropertiesOut: PCFDictionaryRef): OSStatus; cdecl;
  external libVideoToolbox name _PU +
  'VTCopySupportedPropertyDictionaryForEncoder';
function VTCreateCGImageFromCVPixelBuffer(pixelBuffer: CVPixelBufferRef;
  options: CFDictionaryRef; imageOut: Pointer): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTCreateCGImageFromCVPixelBuffer';
procedure VTRegisterSupplementalVideoDecoderIfAvailable
  (codecType: CMVideoCodecType); cdecl;
  external libVideoToolbox name _PU +
  'VTRegisterSupplementalVideoDecoderIfAvailable';
function VTPixelTransferSessionCreate(allocator: CFAllocatorRef;
  pixelTransferSessionOut: PVTPixelTransferSessionRef): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTPixelTransferSessionCreate';
procedure VTPixelTransferSessionInvalidate(session: VTPixelTransferSessionRef);
  cdecl; external libVideoToolbox name _PU + 'VTPixelTransferSessionInvalidate';
function VTPixelTransferSessionGetTypeID: CFTypeID; cdecl;
  external libVideoToolbox name _PU + 'VTPixelTransferSessionGetTypeID';
function VTPixelTransferSessionTransferImage(session: VTPixelTransferSessionRef;
  sourceBuffer: CVPixelBufferRef; destinationBuffer: CVPixelBufferRef)
  : OSStatus; cdecl; external libVideoToolbox name _PU +
  'VTPixelTransferSessionTransferImage';
function VTPixelRotationSessionCreate(allocator: CFAllocatorRef;
  pixelRotationSessionOut: PVTPixelRotationSessionRef): OSStatus; cdecl;
  external libVideoToolbox name _PU + 'VTPixelRotationSessionCreate';
procedure VTPixelRotationSessionInvalidate(session: VTPixelRotationSessionRef);
  cdecl; external libVideoToolbox name _PU + 'VTPixelRotationSessionInvalidate';
function VTPixelRotationSessionGetTypeID: CFTypeID; cdecl;
  external libVideoToolbox name _PU + 'VTPixelRotationSessionGetTypeID';
function VTPixelRotationSessionRotateImage(session: VTPixelRotationSessionRef;
  sourceBuffer: CVPixelBufferRef; destinationBuffer: CVPixelBufferRef)
  : OSStatus; cdecl; external libVideoToolbox name _PU +
  'VTPixelRotationSessionRotateImage';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  VideoToolboxModule: THandle;

{$ENDIF IOS}

function kVTCompressionPropertyKey_NumberOfPendingFrames: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_NumberOfPendingFrames');
end;

function kVTCompressionPropertyKey_PixelBufferPoolIsShared: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_PixelBufferPoolIsShared');
end;

function kVTCompressionPropertyKey_VideoEncoderPixelBufferAttributes: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_VideoEncoderPixelBufferAttributes');
end;

function kVTCompressionPropertyKey_MaxKeyFrameInterval: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_MaxKeyFrameInterval');
end;

function kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration');
end;

function kVTCompressionPropertyKey_AllowTemporalCompression: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_AllowTemporalCompression');
end;

function kVTCompressionPropertyKey_AllowFrameReordering: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_AllowFrameReordering');
end;

function kVTCompressionPropertyKey_AllowOpenGOP: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_AllowOpenGOP');
end;

function kVTCompressionPropertyKey_AverageBitRate: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_AverageBitRate');
end;

function kVTCompressionPropertyKey_DataRateLimits: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_DataRateLimits');
end;

function kVTCompressionPropertyKey_Quality: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_Quality');
end;

function kVTCompressionPropertyKey_TargetQualityForAlpha: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_TargetQualityForAlpha');
end;

function kVTCompressionPropertyKey_MoreFramesBeforeStart: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_MoreFramesBeforeStart');
end;

function kVTCompressionPropertyKey_MoreFramesAfterEnd: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_MoreFramesAfterEnd');
end;

function kVTCompressionPropertyKey_PrioritizeEncodingSpeedOverQuality: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_PrioritizeEncodingSpeedOverQuality');
end;

function kVTCompressionPropertyKey_ConstantBitRate: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_ConstantBitRate');
end;

function kVTCompressionPropertyKey_EstimatedAverageBytesPerFrame: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_EstimatedAverageBytesPerFrame');
end;

function kVTCompressionPropertyKey_ProfileLevel: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_ProfileLevel');
end;

function kVTProfileLevel_HEVC_Main_AutoLevel: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_HEVC_Main_AutoLevel');
end;

function kVTProfileLevel_HEVC_Main10_AutoLevel: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_HEVC_Main10_AutoLevel');
end;

function kVTProfileLevel_HEVC_Main42210_AutoLevel: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_HEVC_Main42210_AutoLevel');
end;

function kVTProfileLevel_H264_Baseline_1_3: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Baseline_1_3');
end;

function kVTProfileLevel_H264_Baseline_3_0: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Baseline_3_0');
end;

function kVTProfileLevel_H264_Baseline_3_1: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Baseline_3_1');
end;

function kVTProfileLevel_H264_Baseline_3_2: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Baseline_3_2');
end;

function kVTProfileLevel_H264_Baseline_4_0: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Baseline_4_0');
end;

function kVTProfileLevel_H264_Baseline_4_1: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Baseline_4_1');
end;

function kVTProfileLevel_H264_Baseline_4_2: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Baseline_4_2');
end;

function kVTProfileLevel_H264_Baseline_5_0: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Baseline_5_0');
end;

function kVTProfileLevel_H264_Baseline_5_1: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Baseline_5_1');
end;

function kVTProfileLevel_H264_Baseline_5_2: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Baseline_5_2');
end;

function kVTProfileLevel_H264_Baseline_AutoLevel: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Baseline_AutoLevel');
end;

function kVTProfileLevel_H264_ConstrainedBaseline_AutoLevel: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_ConstrainedBaseline_AutoLevel');
end;

function kVTProfileLevel_H264_Main_3_0: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_Main_3_0');
end;

function kVTProfileLevel_H264_Main_3_1: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_Main_3_1');
end;

function kVTProfileLevel_H264_Main_3_2: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_Main_3_2');
end;

function kVTProfileLevel_H264_Main_4_0: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_Main_4_0');
end;

function kVTProfileLevel_H264_Main_4_1: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_Main_4_1');
end;

function kVTProfileLevel_H264_Main_4_2: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_Main_4_2');
end;

function kVTProfileLevel_H264_Main_5_0: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_Main_5_0');
end;

function kVTProfileLevel_H264_Main_5_1: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_Main_5_1');
end;

function kVTProfileLevel_H264_Main_5_2: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_Main_5_2');
end;

function kVTProfileLevel_H264_Main_AutoLevel: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Main_AutoLevel');
end;

function kVTProfileLevel_H264_Extended_5_0: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Extended_5_0');
end;

function kVTProfileLevel_H264_Extended_AutoLevel: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_Extended_AutoLevel');
end;

function kVTProfileLevel_H264_High_3_0: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_High_3_0');
end;

function kVTProfileLevel_H264_High_3_1: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_High_3_1');
end;

function kVTProfileLevel_H264_High_3_2: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_High_3_2');
end;

function kVTProfileLevel_H264_High_4_0: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_High_4_0');
end;

function kVTProfileLevel_H264_High_4_1: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_High_4_1');
end;

function kVTProfileLevel_H264_High_4_2: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_High_4_2');
end;

function kVTProfileLevel_H264_High_5_0: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_High_5_0');
end;

function kVTProfileLevel_H264_High_5_1: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_High_5_1');
end;

function kVTProfileLevel_H264_High_5_2: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_H264_High_5_2');
end;

function kVTProfileLevel_H264_High_AutoLevel: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_High_AutoLevel');
end;

function kVTProfileLevel_H264_ConstrainedHigh_AutoLevel: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H264_ConstrainedHigh_AutoLevel');
end;

function kVTProfileLevel_MP4V_Simple_L0: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_MP4V_Simple_L0');
end;

function kVTProfileLevel_MP4V_Simple_L1: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_MP4V_Simple_L1');
end;

function kVTProfileLevel_MP4V_Simple_L2: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_MP4V_Simple_L2');
end;

function kVTProfileLevel_MP4V_Simple_L3: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_MP4V_Simple_L3');
end;

function kVTProfileLevel_MP4V_Main_L2: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_MP4V_Main_L2');
end;

function kVTProfileLevel_MP4V_Main_L3: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_MP4V_Main_L3');
end;

function kVTProfileLevel_MP4V_Main_L4: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTProfileLevel_MP4V_Main_L4');
end;

function kVTProfileLevel_MP4V_AdvancedSimple_L0: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_MP4V_AdvancedSimple_L0');
end;

function kVTProfileLevel_MP4V_AdvancedSimple_L1: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_MP4V_AdvancedSimple_L1');
end;

function kVTProfileLevel_MP4V_AdvancedSimple_L2: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_MP4V_AdvancedSimple_L2');
end;

function kVTProfileLevel_MP4V_AdvancedSimple_L3: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_MP4V_AdvancedSimple_L3');
end;

function kVTProfileLevel_MP4V_AdvancedSimple_L4: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_MP4V_AdvancedSimple_L4');
end;

function kVTProfileLevel_H263_Profile0_Level10: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H263_Profile0_Level10');
end;

function kVTProfileLevel_H263_Profile0_Level45: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H263_Profile0_Level45');
end;

function kVTProfileLevel_H263_Profile3_Level45: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTProfileLevel_H263_Profile3_Level45');
end;

function kVTCompressionPropertyKey_OutputBitDepth: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_OutputBitDepth');
end;

function kVTCompressionPropertyKey_HDRMetadataInsertionMode: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_HDRMetadataInsertionMode');
end;

function kVTHDRMetadataInsertionMode_None: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTHDRMetadataInsertionMode_None');
end;

function kVTHDRMetadataInsertionMode_Auto: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTHDRMetadataInsertionMode_Auto');
end;

function kVTCompressionPropertyKey_H264EntropyMode: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_H264EntropyMode');
end;

function kVTH264EntropyMode_CAVLC: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTH264EntropyMode_CAVLC');
end;

function kVTH264EntropyMode_CABAC: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTH264EntropyMode_CABAC');
end;

function kVTCompressionPropertyKey_Depth: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_Depth');
end;

function kVTCompressionPropertyKey_PreserveAlphaChannel: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_PreserveAlphaChannel');
end;

function kVTCompressionPropertyKey_MaxFrameDelayCount: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_MaxFrameDelayCount');
end;

function kVTCompressionPropertyKey_MaxH264SliceBytes: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_MaxH264SliceBytes');
end;

function kVTCompressionPropertyKey_RealTime: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_RealTime');
end;

function kVTCompressionPropertyKey_MaximizePowerEfficiency: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_MaximizePowerEfficiency');
end;

function kVTCompressionPropertyKey_SourceFrameCount: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_SourceFrameCount');
end;

function kVTCompressionPropertyKey_ExpectedFrameRate: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_ExpectedFrameRate');
end;

function kVTCompressionPropertyKey_BaseLayerFrameRateFraction: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_BaseLayerFrameRateFraction');
end;

function kVTCompressionPropertyKey_BaseLayerBitRateFraction: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_BaseLayerBitRateFraction');
end;

function kVTCompressionPropertyKey_ExpectedDuration: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_ExpectedDuration');
end;

function kVTCompressionPropertyKey_BaseLayerFrameRate: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_BaseLayerFrameRate');
end;

function kVTCompressionPropertyKey_ReferenceBufferCount: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_ReferenceBufferCount');
end;

function kVTVideoEncoderSpecification_RequiredEncoderGPURegistryID: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderSpecification_RequiredEncoderGPURegistryID');
end;

function kVTVideoEncoderSpecification_PreferredEncoderGPURegistryID: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderSpecification_PreferredEncoderGPURegistryID');
end;

function kVTCompressionPropertyKey_UsingGPURegistryID: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_UsingGPURegistryID');
end;

function kVTCompressionPropertyKey_SupportsBaseFrameQP: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_SupportsBaseFrameQP');
end;

function kVTEncodeFrameOptionKey_ForceKeyFrame: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTEncodeFrameOptionKey_ForceKeyFrame');
end;

function kVTEncodeFrameOptionKey_BaseFrameQP: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTEncodeFrameOptionKey_BaseFrameQP');
end;

function kVTCompressionPropertyKey_CleanAperture: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_CleanAperture');
end;

function kVTCompressionPropertyKey_PixelAspectRatio: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_PixelAspectRatio');
end;

function kVTCompressionPropertyKey_FieldCount: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_FieldCount');
end;

function kVTCompressionPropertyKey_FieldDetail: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_FieldDetail');
end;

function kVTCompressionPropertyKey_AspectRatio16x9: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_AspectRatio16x9');
end;

function kVTCompressionPropertyKey_ProgressiveScan: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_ProgressiveScan');
end;

function kVTCompressionPropertyKey_ColorPrimaries: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_ColorPrimaries');
end;

function kVTCompressionPropertyKey_TransferFunction: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_TransferFunction');
end;

function kVTCompressionPropertyKey_YCbCrMatrix: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_YCbCrMatrix');
end;

function kVTCompressionPropertyKey_ICCProfile: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_ICCProfile');
end;

function kVTCompressionPropertyKey_MasteringDisplayColorVolume: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_MasteringDisplayColorVolume');
end;

function kVTCompressionPropertyKey_ContentLightLevelInfo: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_ContentLightLevelInfo');
end;

function kVTCompressionPropertyKey_GammaLevel: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_GammaLevel');
end;

function kVTCompressionPropertyKey_AlphaChannelMode: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_AlphaChannelMode');
end;

function kVTAlphaChannelMode_StraightAlpha: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTAlphaChannelMode_StraightAlpha');
end;

function kVTAlphaChannelMode_PremultipliedAlpha: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTAlphaChannelMode_PremultipliedAlpha');
end;

function kVTCompressionPropertyKey_PixelTransferProperties: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_PixelTransferProperties');
end;

function kVTCompressionPropertyKey_MultiPassStorage: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_MultiPassStorage');
end;

function kVTCompressionPropertyKey_EncoderID: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_EncoderID');
end;

function kVTCompressionPropertyKey_PreserveDynamicHDRMetadata: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_PreserveDynamicHDRMetadata');
end;

function kVTVideoEncoderSpecification_EnableLowLatencyRateControl: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderSpecification_EnableLowLatencyRateControl');
end;

function kVTCompressionPropertyKey_MaxAllowedFrameQP: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_MaxAllowedFrameQP');
end;

function kVTCompressionPropertyKey_MinAllowedFrameQP: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_MinAllowedFrameQP');
end;

function kVTCompressionPropertyKey_EnableLTR: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_EnableLTR');
end;

function kVTEncodeFrameOptionKey_AcknowledgedLTRTokens: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTEncodeFrameOptionKey_AcknowledgedLTRTokens');
end;

function kVTEncodeFrameOptionKey_ForceLTRRefresh: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTEncodeFrameOptionKey_ForceLTRRefresh');
end;

function kVTSampleAttachmentKey_RequireLTRAcknowledgementToken: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTSampleAttachmentKey_RequireLTRAcknowledgementToken');
end;

function kVTPropertyTypeKey: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTPropertyTypeKey');
end;

function kVTPropertyType_Enumeration: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTPropertyType_Enumeration');
end;

function kVTPropertyType_Boolean: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTPropertyType_Boolean');
end;

function kVTPropertyType_Number: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTPropertyType_Number');
end;

function kVTPropertyReadWriteStatusKey: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTPropertyReadWriteStatusKey');
end;

function kVTPropertyReadWriteStatus_ReadOnly: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPropertyReadWriteStatus_ReadOnly');
end;

function kVTPropertyReadWriteStatus_ReadWrite: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPropertyReadWriteStatus_ReadWrite');
end;

function kVTPropertyShouldBeSerializedKey: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPropertyShouldBeSerializedKey');
end;

function kVTPropertySupportedValueMinimumKey: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPropertySupportedValueMinimumKey');
end;

function kVTPropertySupportedValueMaximumKey: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPropertySupportedValueMaximumKey');
end;

function kVTPropertySupportedValueListKey: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPropertySupportedValueListKey');
end;

function kVTPropertyDocumentationKey: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTPropertyDocumentationKey');
end;

function kVTVideoEncoderSpecification_EncoderID: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderSpecification_EncoderID');
end;

function kVTDecompressionPropertyKey_PixelBufferPool: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_PixelBufferPool');
end;

function kVTDecompressionPropertyKey_PixelBufferPoolIsShared: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_PixelBufferPoolIsShared');
end;

function kVTDecompressionPropertyKey_OutputPoolRequestedMinimumBufferCount
  : Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_OutputPoolRequestedMinimumBufferCount');
end;

function kVTDecompressionPropertyKey_NumberOfFramesBeingDecoded: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_NumberOfFramesBeingDecoded');
end;

function kVTDecompressionPropertyKey_MinOutputPresentationTimeStampOfFramesBeingDecoded
  : Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_MinOutputPresentationTimeStampOfFramesBeingDecoded');
end;

function kVTDecompressionPropertyKey_MaxOutputPresentationTimeStampOfFramesBeingDecoded
  : Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_MaxOutputPresentationTimeStampOfFramesBeingDecoded');
end;

function kVTDecompressionPropertyKey_ContentHasInterframeDependencies: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_ContentHasInterframeDependencies');
end;

function kVTDecompressionPropertyKey_RealTime: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_RealTime');
end;

function kVTDecompressionPropertyKey_MaximizePowerEfficiency: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_MaximizePowerEfficiency');
end;

function kVTDecompressionPropertyKey_ThreadCount: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_ThreadCount');
end;

function kVTDecompressionPropertyKey_FieldMode: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_FieldMode');
end;

function kVTDecompressionProperty_FieldMode_BothFields: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionProperty_FieldMode_BothFields');
end;

function kVTDecompressionProperty_FieldMode_TopFieldOnly: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionProperty_FieldMode_TopFieldOnly');
end;

function kVTDecompressionProperty_FieldMode_BottomFieldOnly: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionProperty_FieldMode_BottomFieldOnly');
end;

function kVTDecompressionProperty_FieldMode_SingleField: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionProperty_FieldMode_SingleField');
end;

function kVTDecompressionProperty_FieldMode_DeinterlaceFields: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionProperty_FieldMode_DeinterlaceFields');
end;

function kVTDecompressionPropertyKey_DeinterlaceMode: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_DeinterlaceMode');
end;

function kVTDecompressionProperty_DeinterlaceMode_VerticalFilter: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionProperty_DeinterlaceMode_VerticalFilter');
end;

function kVTDecompressionProperty_DeinterlaceMode_Temporal: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionProperty_DeinterlaceMode_Temporal');
end;

function kVTDecompressionPropertyKey_ReducedResolutionDecode: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_ReducedResolutionDecode');
end;

function kVTDecompressionResolutionKey_Width: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionResolutionKey_Width');
end;

function kVTDecompressionResolutionKey_Height: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionResolutionKey_Height');
end;

function kVTDecompressionPropertyKey_ReducedCoefficientDecode: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_ReducedCoefficientDecode');
end;

function kVTDecompressionPropertyKey_ReducedFrameDelivery: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_ReducedFrameDelivery');
end;

function kVTDecompressionPropertyKey_OnlyTheseFrames: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_OnlyTheseFrames');
end;

function kVTDecompressionProperty_OnlyTheseFrames_AllFrames: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionProperty_OnlyTheseFrames_AllFrames');
end;

function kVTDecompressionProperty_OnlyTheseFrames_NonDroppableFrames: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionProperty_OnlyTheseFrames_NonDroppableFrames');
end;

function kVTDecompressionProperty_OnlyTheseFrames_IFrames: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionProperty_OnlyTheseFrames_IFrames');
end;

function kVTDecompressionProperty_OnlyTheseFrames_KeyFrames: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionProperty_OnlyTheseFrames_KeyFrames');
end;

function kVTDecompressionProperty_TemporalLevelLimit: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionProperty_TemporalLevelLimit');
end;

function kVTDecompressionPropertyKey_SuggestedQualityOfServiceTiers: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_SuggestedQualityOfServiceTiers');
end;

function kVTDecompressionPropertyKey_SupportedPixelFormatsOrderedByQuality
  : Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_SupportedPixelFormatsOrderedByQuality');
end;

function kVTDecompressionPropertyKey_SupportedPixelFormatsOrderedByPerformance
  : Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_SupportedPixelFormatsOrderedByPerformance');
end;

function kVTDecompressionPropertyKey_PixelFormatsWithReducedResolutionSupport
  : Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_PixelFormatsWithReducedResolutionSupport');
end;

function kVTDecompressionPropertyKey_PixelTransferProperties: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_PixelTransferProperties');
end;

function kVTVideoDecoderSpecification_RequiredDecoderGPURegistryID: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoDecoderSpecification_RequiredDecoderGPURegistryID');
end;

function kVTVideoDecoderSpecification_PreferredDecoderGPURegistryID: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoDecoderSpecification_PreferredDecoderGPURegistryID');
end;

function kVTDecompressionPropertyKey_UsingGPURegistryID: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_UsingGPURegistryID');
end;

function kVTDecompressionPropertyKey_PropagatePerFrameHDRDisplayMetadata
  : Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTDecompressionPropertyKey_PropagatePerFrameHDRDisplayMetadata');
end;

function kVTMultiPassStorageCreationOption_DoNotDelete: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTMultiPassStorageCreationOption_DoNotDelete');
end;

function kVTVideoEncoderListOption_IncludeStandardDefinitionDVEncoders: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderListOption_IncludeStandardDefinitionDVEncoders');
end;

function kVTVideoEncoderList_CodecType: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTVideoEncoderList_CodecType');
end;

function kVTVideoEncoderList_EncoderID: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTVideoEncoderList_EncoderID');
end;

function kVTVideoEncoderList_CodecName: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTVideoEncoderList_CodecName');
end;

function kVTVideoEncoderList_EncoderName: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderList_EncoderName');
end;

function kVTVideoEncoderList_DisplayName: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderList_DisplayName');
end;

function kVTVideoEncoderList_GPURegistryID: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderList_GPURegistryID');
end;

function kVTVideoEncoderList_SupportedSelectionProperties: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderList_SupportedSelectionProperties');
end;

function kVTVideoEncoderList_PerformanceRating: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderList_PerformanceRating');
end;

function kVTVideoEncoderList_QualityRating: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderList_QualityRating');
end;

function kVTVideoEncoderList_InstanceLimit: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderList_InstanceLimit');
end;

function kVTVideoEncoderList_IsHardwareAccelerated: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderList_IsHardwareAccelerated');
end;

function kVTVideoEncoderList_SupportsFrameReordering: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderList_SupportsFrameReordering');
end;

function kVTVideoEncoderList_SupportsMultiPass: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTVideoEncoderList_SupportsMultiPass');
end;

function kVTPixelTransferPropertyKey_ScalingMode: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPixelTransferPropertyKey_ScalingMode');
end;

function kVTScalingMode_Normal: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTScalingMode_Normal');
end;

function kVTScalingMode_CropSourceToCleanAperture: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTScalingMode_CropSourceToCleanAperture');
end;

function kVTScalingMode_Letterbox: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTScalingMode_Letterbox');
end;

function kVTScalingMode_Trim: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTScalingMode_Trim');
end;

function kVTPixelTransferPropertyKey_DestinationCleanAperture: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPixelTransferPropertyKey_DestinationCleanAperture');
end;

function kVTPixelTransferPropertyKey_DestinationPixelAspectRatio: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPixelTransferPropertyKey_DestinationPixelAspectRatio');
end;

function kVTPixelTransferPropertyKey_DownsamplingMode: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPixelTransferPropertyKey_DownsamplingMode');
end;

function kVTDownsamplingMode_Decimate: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTDownsamplingMode_Decimate');
end;

function kVTDownsamplingMode_Average: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTDownsamplingMode_Average');
end;

function kVTPixelTransferPropertyKey_DestinationColorPrimaries: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPixelTransferPropertyKey_DestinationColorPrimaries');
end;

function kVTPixelTransferPropertyKey_DestinationTransferFunction: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPixelTransferPropertyKey_DestinationTransferFunction');
end;

function kVTPixelTransferPropertyKey_DestinationICCProfile: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPixelTransferPropertyKey_DestinationICCProfile');
end;

function kVTPixelTransferPropertyKey_DestinationYCbCrMatrix: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPixelTransferPropertyKey_DestinationYCbCrMatrix');
end;

function kVTPixelTransferPropertyKey_RealTime: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPixelTransferPropertyKey_RealTime');
end;

function kVTPixelRotationPropertyKey_Rotation: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPixelRotationPropertyKey_Rotation');
end;

function kVTRotation_0: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTRotation_0');
end;

function kVTRotation_CW90: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTRotation_CW90');
end;

function kVTRotation_180: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTRotation_180');
end;

function kVTRotation_CCW90: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox, 'kVTRotation_CCW90');
end;

function kVTPixelRotationPropertyKey_FlipHorizontalOrientation: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPixelRotationPropertyKey_FlipHorizontalOrientation');
end;

function kVTPixelRotationPropertyKey_FlipVerticalOrientation: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPixelRotationPropertyKey_FlipVerticalOrientation');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

VideoToolboxModule := dlopen(MarshaledAString(libVideoToolbox), RTLD_LAZY);

finalization

dlclose(VideoToolboxModule);
{$ENDIF IOS}

end.
