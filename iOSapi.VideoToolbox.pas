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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
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
  CFStringRef = Pointer;
  VTDecodeFrameFlags = LongWord;
  VTDecodeInfoFlags = UInt32;
  VTEncodeInfoFlags = UInt32;
  CFTypeRef = Pointer;
  VTSessionRef = CFTypeRef;
  OSStatus = Int32;
  CFAllocatorRef = Pointer;
  CFDictionaryRef = Pointer;
  VTCompressionSessionRef = Pointer;
  CMSampleBufferRef = Pointer;
  VTCompressionOutputCallback = procedure(param1: Pointer; param2: Pointer;
    param3: OSStatus; param4: VTEncodeInfoFlags;
    param5: CMSampleBufferRef); cdecl;
  FourCharCode = UInt32;
  CMVideoCodecType = FourCharCode;
  CFTypeID = LongWord;
  CVPixelBufferPoolRef = Pointer;
  CVBufferRef = Pointer;
  CVImageBufferRef = CVBufferRef;
  CMTimeValue = Int64;
  CMTimeScale = Int32;
  CMTimeFlags = LongWord;
  CMTimeEpoch = Int64;

  CMTime = record
    value: CMTimeValue;
    timescale: CMTimeScale;
    flags: CMTimeFlags;
    epoch: CMTimeEpoch;
  end;;
VTCompressionOutputHandler =
procedure(param1: OSStatus; param2: VTEncodeInfoFlags;
  param3: CMSampleBufferRef) of object;
VTCompressionSessionOptionFlags = LongWord;
VTDecompressionSessionRef = Pointer;
VTDecompressionOutputCallback =
procedure(param1: Pointer; param2: Pointer; param3: OSStatus;
  param4: VTDecodeInfoFlags; param5: CVImageBufferRef; param6: CMTime;
  param7: CMTime);
cdecl;

VTDecompressionOutputCallbackRecord = record decompressionOutputCallback
  : VTDecompressionOutputCallback;
decompressionOutputRefCon:
Pointer;
end;
PVTDecompressionOutputCallbackRecord = ^VTDecompressionOutputCallbackRecord;

CMFormatDescriptionRef = Pointer;
CMVideoFormatDescriptionRef = CMFormatDescriptionRef;
VTDecompressionOutputHandler =
procedure(param1: OSStatus; param2: VTDecodeInfoFlags; param3: CVImageBufferRef;
  param4: CMTime; param5: CMTime) of object;
Boolean = Byte;
VTFrameSiloRef = Pointer;
CFURLRef = Pointer;
CMTimeRange = record start: CMTime;
duration:
CMTime;
end;;
CMItemCount = LongInt;
TVideoToolboxCallback =
function(param1: Pointer; param2: CMSampleBufferRef): OSStatus;
cdecl;
TVideoToolboxHandler =
function(param1: CMSampleBufferRef): OSStatus;
cdecl;
VTMultiPassStorageRef = Pointer;
CVPixelBufferRef = CVImageBufferRef;
// ===== Exported string consts =====

function kVTCompressionPropertyKey_NumberOfPendingFrames: Pointer;
  function kVTCompressionPropertyKey_PixelBufferPoolIsShared: Pointer;
    function kVTCompressionPropertyKey_VideoEncoderPixelBufferAttributes
      : Pointer;
      function kVTCompressionPropertyKey_MaxKeyFrameInterval: Pointer;
        function kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration: Pointer;
          function kVTCompressionPropertyKey_AllowTemporalCompression: Pointer;
            function kVTCompressionPropertyKey_AllowFrameReordering: Pointer;
              function kVTCompressionPropertyKey_AverageBitRate: Pointer;
                function kVTCompressionPropertyKey_DataRateLimits: Pointer;
                  function kVTCompressionPropertyKey_Quality: Pointer;
                    function kVTCompressionPropertyKey_MoreFramesBeforeStart
                      : Pointer;
                      function kVTCompressionPropertyKey_MoreFramesAfterEnd
                        : Pointer;
                        function kVTCompressionPropertyKey_ProfileLevel
                          : Pointer;
                          function kVTProfileLevel_H264_Baseline_1_3: Pointer;
                            function kVTProfileLevel_H264_Baseline_3_0: Pointer;
                              function kVTProfileLevel_H264_Baseline_3_1
                                : Pointer;
                                function kVTProfileLevel_H264_Baseline_3_2
                                  : Pointer;
                                  function kVTProfileLevel_H264_Baseline_4_0
                                    : Pointer;
                                    function kVTProfileLevel_H264_Baseline_4_1
                                      : Pointer;
                                      function kVTProfileLevel_H264_Baseline_4_2
                                        : Pointer;
                                        function kVTProfileLevel_H264_Baseline_5_0
                                        : Pointer;
                                        function kVTProfileLevel_H264_Baseline_5_1
                                        : Pointer;
                                        function kVTProfileLevel_H264_Baseline_5_2
                                        : Pointer;
                                        function kVTProfileLevel_H264_Baseline_AutoLevel
                                        : Pointer;
                                        function kVTProfileLevel_H264_Main_3_0
                                        : Pointer;
                                        function kVTProfileLevel_H264_Main_3_1
                                        : Pointer;
                                        function kVTProfileLevel_H264_Main_3_2
                                        : Pointer;
                                        function kVTProfileLevel_H264_Main_4_0
                                        : Pointer;
                                        function kVTProfileLevel_H264_Main_4_1
                                        : Pointer;
                                        function kVTProfileLevel_H264_Main_4_2
                                        : Pointer;
                                        function kVTProfileLevel_H264_Main_5_0
                                        : Pointer;
                                        function kVTProfileLevel_H264_Main_5_1
                                        : Pointer;
                                        function kVTProfileLevel_H264_Main_5_2
                                        : Pointer;
                                        function kVTProfileLevel_H264_Main_AutoLevel
                                        : Pointer;
                                        function kVTProfileLevel_H264_Extended_5_0
                                        : Pointer;
                                        function kVTProfileLevel_H264_Extended_AutoLevel
                                        : Pointer;
                                        function kVTProfileLevel_H264_High_3_0
                                        : Pointer;
                                        function kVTProfileLevel_H264_High_3_1
                                        : Pointer;
                                        function kVTProfileLevel_H264_High_3_2
                                        : Pointer;
                                        function kVTProfileLevel_H264_High_4_0
                                        : Pointer;
                                        function kVTProfileLevel_H264_High_4_1
                                        : Pointer;
                                        function kVTProfileLevel_H264_High_4_2
                                        : Pointer;
                                        function kVTProfileLevel_H264_High_5_0
                                        : Pointer;
                                        function kVTProfileLevel_H264_High_5_1
                                        : Pointer;
                                        function kVTProfileLevel_H264_High_5_2
                                        : Pointer;
                                        function kVTProfileLevel_H264_High_AutoLevel
                                        : Pointer;
                                        function kVTProfileLevel_MP4V_Simple_L0
                                        : Pointer;
                                        function kVTProfileLevel_MP4V_Simple_L1
                                        : Pointer;
                                        function kVTProfileLevel_MP4V_Simple_L2
                                        : Pointer;
                                        function kVTProfileLevel_MP4V_Simple_L3
                                        : Pointer;
                                        function kVTProfileLevel_MP4V_Main_L2
                                        : Pointer;
                                        function kVTProfileLevel_MP4V_Main_L3
                                        : Pointer;
                                        function kVTProfileLevel_MP4V_Main_L4
                                        : Pointer;
                                        function kVTProfileLevel_MP4V_AdvancedSimple_L0
                                        : Pointer;
                                        function kVTProfileLevel_MP4V_AdvancedSimple_L1
                                        : Pointer;
                                        function kVTProfileLevel_MP4V_AdvancedSimple_L2
                                        : Pointer;
                                        function kVTProfileLevel_MP4V_AdvancedSimple_L3
                                        : Pointer;
                                        function kVTProfileLevel_MP4V_AdvancedSimple_L4
                                        : Pointer;
                                        function kVTProfileLevel_H263_Profile0_Level10
                                        : Pointer;
                                        function kVTProfileLevel_H263_Profile0_Level45
                                        : Pointer;
                                        function kVTProfileLevel_H263_Profile3_Level45
                                        : Pointer;
                                        function kVTCompressionPropertyKey_H264EntropyMode
                                        : Pointer;
                                        function kVTH264EntropyMode_CAVLC
                                        : Pointer;
                                        function kVTH264EntropyMode_CABAC
                                        : Pointer;
                                        function kVTCompressionPropertyKey_Depth
                                        : Pointer;
                                        function kVTCompressionPropertyKey_MaxFrameDelayCount
                                        : Pointer;
                                        function kVTCompressionPropertyKey_MaxH264SliceBytes
                                        : Pointer;
                                        function kVTCompressionPropertyKey_RealTime
                                        : Pointer;
                                        function kVTCompressionPropertyKey_SourceFrameCount
                                        : Pointer;
                                        function kVTCompressionPropertyKey_ExpectedFrameRate
                                        : Pointer;
                                        function kVTCompressionPropertyKey_ExpectedDuration
                                        : Pointer;
                                        function kVTEncodeFrameOptionKey_ForceKeyFrame
                                        : Pointer;
                                        function kVTCompressionPropertyKey_CleanAperture
                                        : Pointer;
                                        function kVTCompressionPropertyKey_PixelAspectRatio
                                        : Pointer;
                                        function kVTCompressionPropertyKey_FieldCount
                                        : Pointer;
                                        function kVTCompressionPropertyKey_FieldDetail
                                        : Pointer;
                                        function kVTCompressionPropertyKey_AspectRatio16x9
                                        : Pointer;
                                        function kVTCompressionPropertyKey_ProgressiveScan
                                        : Pointer;
                                        function kVTCompressionPropertyKey_ColorPrimaries
                                        : Pointer;
                                        function kVTCompressionPropertyKey_TransferFunction
                                        : Pointer;
                                        function kVTCompressionPropertyKey_YCbCrMatrix
                                        : Pointer;
                                        function kVTCompressionPropertyKey_ICCProfile
                                        : Pointer;
                                        function kVTCompressionPropertyKey_PixelTransferProperties
                                        : Pointer;
                                        function kVTCompressionPropertyKey_MultiPassStorage
                                        : Pointer;
                                        function kVTPropertyTypeKey: Pointer;
                                        function kVTPropertyType_Enumeration
                                        : Pointer;
                                        function kVTPropertyType_Boolean
                                        : Pointer;
                                        function kVTPropertyType_Number
                                        : Pointer;
                                        function kVTPropertyReadWriteStatusKey
                                        : Pointer;
                                        function kVTPropertyReadWriteStatus_ReadOnly
                                        : Pointer;
                                        function kVTPropertyReadWriteStatus_ReadWrite
                                        : Pointer;
                                        function kVTPropertyShouldBeSerializedKey
                                        : Pointer;
                                        function kVTPropertySupportedValueMinimumKey
                                        : Pointer;
                                        function kVTPropertySupportedValueMaximumKey
                                        : Pointer;
                                        function kVTPropertySupportedValueListKey
                                        : Pointer;
                                        function kVTPropertyDocumentationKey
                                        : Pointer;
                                        function kVTVideoEncoderSpecification_EncoderID
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_PixelBufferPool
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_PixelBufferPoolIsShared
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_OutputPoolRequestedMinimumBufferCount
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_NumberOfFramesBeingDecoded
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_MinOutputPresentationTimeStampOfFramesBeingDecoded
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_MaxOutputPresentationTimeStampOfFramesBeingDecoded
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_ContentHasInterframeDependencies
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_RealTime
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_ThreadCount
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_FieldMode
                                        : Pointer;
                                        function kVTDecompressionProperty_FieldMode_BothFields
                                        : Pointer;
                                        function kVTDecompressionProperty_FieldMode_TopFieldOnly
                                        : Pointer;
                                        function kVTDecompressionProperty_FieldMode_BottomFieldOnly
                                        : Pointer;
                                        function kVTDecompressionProperty_FieldMode_SingleField
                                        : Pointer;
                                        function kVTDecompressionProperty_FieldMode_DeinterlaceFields
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_DeinterlaceMode
                                        : Pointer;
                                        function kVTDecompressionProperty_DeinterlaceMode_VerticalFilter
                                        : Pointer;
                                        function kVTDecompressionProperty_DeinterlaceMode_Temporal
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_ReducedResolutionDecode
                                        : Pointer;
                                        function kVTDecompressionResolutionKey_Width
                                        : Pointer;
                                        function kVTDecompressionResolutionKey_Height
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_ReducedCoefficientDecode
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_ReducedFrameDelivery
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_OnlyTheseFrames
                                        : Pointer;
                                        function kVTDecompressionProperty_OnlyTheseFrames_AllFrames
                                        : Pointer;
                                        function kVTDecompressionProperty_OnlyTheseFrames_NonDroppableFrames
                                        : Pointer;
                                        function kVTDecompressionProperty_OnlyTheseFrames_IFrames
                                        : Pointer;
                                        function kVTDecompressionProperty_OnlyTheseFrames_KeyFrames
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_SuggestedQualityOfServiceTiers
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_SupportedPixelFormatsOrderedByQuality
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_SupportedPixelFormatsOrderedByPerformance
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_PixelFormatsWithReducedResolutionSupport
                                        : Pointer;
                                        function kVTDecompressionPropertyKey_PixelTransferProperties
                                        : Pointer;
                                        function kVTMultiPassStorageCreationOption_DoNotDelete
                                        : Pointer;
                                        function kVTVideoEncoderList_CodecType
                                        : Pointer;
                                        function kVTVideoEncoderList_EncoderID
                                        : Pointer;
                                        function kVTVideoEncoderList_CodecName
                                        : Pointer;
                                        function kVTVideoEncoderList_EncoderName
                                        : Pointer;
                                        function kVTVideoEncoderList_DisplayName
                                        : Pointer;
                                        function kVTPixelTransferPropertyKey_ScalingMode
                                        : Pointer;
                                        function kVTScalingMode_Normal: Pointer;
                                        function kVTScalingMode_CropSourceToCleanAperture
                                        : Pointer;
                                        function kVTScalingMode_Letterbox
                                        : Pointer;
                                        function kVTScalingMode_Trim: Pointer;
                                        function kVTPixelTransferPropertyKey_DestinationCleanAperture
                                        : Pointer;
                                        function kVTPixelTransferPropertyKey_DestinationPixelAspectRatio
                                        : Pointer;
                                        function kVTPixelTransferPropertyKey_DownsamplingMode
                                        : Pointer;
                                        function kVTDownsamplingMode_Decimate
                                        : Pointer;
                                        function kVTDownsamplingMode_Average
                                        : Pointer;
                                        function kVTPixelTransferPropertyKey_DestinationYCbCrMatrix
                                        : Pointer;


                                        // ===== External functions =====

                                        const
                                        libVideoToolbox =
                                        '/System/Library/Frameworks/VideoToolbox.framework/VideoToolbox';
                                        function VTSessionCopySupportedPropertyDictionary
                                        (session: VTSessionRef;
                                        supportedPropertyDictionaryOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTSessionCopySupportedPropertyDictionary';
                                        function VTSessionSetProperty
                                        (session: VTSessionRef;
                                        propertyKey: CFStringRef;
                                        propertyValue: CFTypeRef): OSStatus;
                                        cdecl; external libVideoToolbox name _PU
                                        + 'VTSessionSetProperty';
                                        function VTSessionCopyProperty
                                        (session: VTSessionRef;
                                        propertyKey: CFStringRef;
                                        allocator: CFAllocatorRef;
                                        propertyValueOut: Pointer): OSStatus;
                                        cdecl; external libVideoToolbox name _PU
                                        + 'VTSessionCopyProperty';
                                        function VTSessionSetProperties
                                        (session: VTSessionRef;
                                        propertyDictionary: CFDictionaryRef)
                                        : OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTSessionSetProperties';
                                        function VTSessionCopySerializableProperties
                                        (session: VTSessionRef;
                                        allocator: CFAllocatorRef;
                                        dictionaryOut: Pointer): OSStatus;
                                        cdecl; external libVideoToolbox name _PU
                                        + 'VTSessionCopySerializableProperties';
                                        function VTCompressionSessionCreate
                                        (allocator: CFAllocatorRef;
                                        width: Int32; height: Int32;
                                        codecType: CMVideoCodecType;
                                        encoderSpecification: CFDictionaryRef;
                                        sourceImageBufferAttributes
                                        : CFDictionaryRef;
                                        compressedDataAllocator: CFAllocatorRef;
                                        outputCallback
                                        : VTCompressionOutputCallback;
                                        outputCallbackRefCon: Pointer;
                                        compressionSessionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTCompressionSessionCreate';
                                        procedure VTCompressionSessionInvalidate
                                        (session: VTCompressionSessionRef);
                                        cdecl; external libVideoToolbox name _PU
                                        + 'VTCompressionSessionInvalidate';
                                        function VTCompressionSessionGetTypeID
                                        : CFTypeID; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTCompressionSessionGetTypeID';
                                        function VTCompressionSessionGetPixelBufferPool
                                        (session: VTCompressionSessionRef)
                                        : CVPixelBufferPoolRef; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTCompressionSessionGetPixelBufferPool';
                                        function VTCompressionSessionPrepareToEncodeFrames
                                        (session: VTCompressionSessionRef)
                                        : OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTCompressionSessionPrepareToEncodeFrames';
                                        function VTCompressionSessionEncodeFrame
                                        (session: VTCompressionSessionRef;
                                        imageBuffer: CVImageBufferRef;
                                        presentationTimeStamp: CMTime;
                                        duration: CMTime;
                                        frameProperties: CFDictionaryRef;
                                        sourceFrameRefCon: Pointer;
                                        infoFlagsOut: UInt32): OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTCompressionSessionEncodeFrame';
                                        function VTCompressionSessionEncodeFrameWithOutputHandler
                                        (session: VTCompressionSessionRef;
                                        imageBuffer: CVImageBufferRef;
                                        presentationTimeStamp: CMTime;
                                        duration: CMTime;
                                        frameProperties: CFDictionaryRef;
                                        infoFlagsOut: UInt32;
                                        outputHandler
                                        : VTCompressionOutputHandler): OSStatus;
                                        cdecl; external libVideoToolbox name _PU
                                        + 'VTCompressionSessionEncodeFrameWithOutputHandler';
                                        function VTCompressionSessionCompleteFrames
                                        (session: VTCompressionSessionRef;
                                        completeUntilPresentationTimeStamp
                                        : CMTime): OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTCompressionSessionCompleteFrames';
                                        function VTCompressionSessionBeginPass
                                        (session: VTCompressionSessionRef;
                                        beginPassFlags
                                        : VTCompressionSessionOptionFlags;
                                        reserved: PLongWord): OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTCompressionSessionBeginPass';
                                        function VTCompressionSessionEndPass
                                        (session: VTCompressionSessionRef;
                                        furtherPassesRequestedOut: PByte;
                                        reserved: PLongWord): OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTCompressionSessionEndPass';
                                        function VTCompressionSessionGetTimeRangesForNextPass
                                        (session: VTCompressionSessionRef;
                                        timeRangeCountOut: PLongInt;
                                        timeRangeArrayOut: Pointer): OSStatus;
                                        cdecl; external libVideoToolbox name _PU
                                        + 'VTCompressionSessionGetTimeRangesForNextPass';
                                        function VTDecompressionSessionCreate
                                        (allocator: CFAllocatorRef;
                                        videoFormatDescription
                                        : CMVideoFormatDescriptionRef;
                                        videoDecoderSpecification
                                        : CFDictionaryRef;
                                        destinationImageBufferAttributes
                                        : CFDictionaryRef;
                                        outputCallback: Pointer;
                                        decompressionSessionOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTDecompressionSessionCreate';
                                        procedure VTDecompressionSessionInvalidate
                                        (session: VTDecompressionSessionRef);
                                        cdecl; external libVideoToolbox name _PU
                                        + 'VTDecompressionSessionInvalidate';
                                        function VTDecompressionSessionGetTypeID
                                        : CFTypeID; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTDecompressionSessionGetTypeID';
                                        function VTDecompressionSessionDecodeFrame
                                        (session: VTDecompressionSessionRef;
                                        sampleBuffer: CMSampleBufferRef;
                                        decodeFlags: VTDecodeFrameFlags;
                                        sourceFrameRefCon: Pointer;
                                        infoFlagsOut: UInt32): OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTDecompressionSessionDecodeFrame';
                                        function VTDecompressionSessionDecodeFrameWithOutputHandler
                                        (session: VTDecompressionSessionRef;
                                        sampleBuffer: CMSampleBufferRef;
                                        decodeFlags: VTDecodeFrameFlags;
                                        infoFlagsOut: UInt32;
                                        outputHandler
                                        : VTDecompressionOutputHandler)
                                        : OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTDecompressionSessionDecodeFrameWithOutputHandler';
                                        function VTDecompressionSessionFinishDelayedFrames
                                        (session: VTDecompressionSessionRef)
                                        : OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTDecompressionSessionFinishDelayedFrames';
                                        function VTDecompressionSessionCanAcceptFormatDescription
                                        (session: VTDecompressionSessionRef;
                                        newFormatDesc: CMFormatDescriptionRef)
                                        : Boolean; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTDecompressionSessionCanAcceptFormatDescription';
                                        function VTDecompressionSessionWaitForAsynchronousFrames
                                        (session: VTDecompressionSessionRef)
                                        : OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTDecompressionSessionWaitForAsynchronousFrames';
                                        function VTDecompressionSessionCopyBlackPixelBuffer
                                        (session: VTDecompressionSessionRef;
                                        pixelBufferOut: Pointer): OSStatus;
                                        cdecl; external libVideoToolbox name _PU
                                        + 'VTDecompressionSessionCopyBlackPixelBuffer';
                                        function VTFrameSiloGetTypeID: CFTypeID;
                                        cdecl; external libVideoToolbox name _PU
                                        + 'VTFrameSiloGetTypeID';
                                        function VTFrameSiloCreate
                                        (allocator: CFAllocatorRef;
                                        fileURL: CFURLRef;
                                        timeRange: CMTimeRange;
                                        options: CFDictionaryRef;
                                        siloOut: Pointer): OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTFrameSiloCreate';
                                        function VTFrameSiloAddSampleBuffer
                                        (silo: VTFrameSiloRef;
                                        sampleBuffer: CMSampleBufferRef)
                                        : OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTFrameSiloAddSampleBuffer';
                                        function VTFrameSiloSetTimeRangesForNextPass
                                        (silo: VTFrameSiloRef;
                                        timeRangeCount: CMItemCount;
                                        timeRangeArray: Pointer): OSStatus;
                                        cdecl; external libVideoToolbox name _PU
                                        + 'VTFrameSiloSetTimeRangesForNextPass';
                                        function VTFrameSiloGetProgressOfCurrentPass
                                        (silo: VTFrameSiloRef;
                                        progressOut: PSingle): OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTFrameSiloGetProgressOfCurrentPass';
                                        function VTFrameSiloCallFunctionForEachSampleBuffer
                                        (silo: VTFrameSiloRef;
                                        timeRange: CMTimeRange;
                                        callbackInfo: Pointer;
                                        callback: TVideoToolboxCallback)
                                        : OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTFrameSiloCallFunctionForEachSampleBuffer';
                                        function VTFrameSiloCallBlockForEachSampleBuffer
                                        (silo: VTFrameSiloRef;
                                        timeRange: CMTimeRange;
                                        handler: TVideoToolboxHandler)
                                        : OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTFrameSiloCallBlockForEachSampleBuffer';
                                        function VTMultiPassStorageGetTypeID
                                        : CFTypeID; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTMultiPassStorageGetTypeID';
                                        function VTMultiPassStorageCreate
                                        (allocator: CFAllocatorRef;
                                        fileURL: CFURLRef;
                                        timeRange: CMTimeRange;
                                        options: CFDictionaryRef;
                                        multiPassStorageOut: Pointer): OSStatus;
                                        cdecl; external libVideoToolbox name _PU
                                        + 'VTMultiPassStorageCreate';
                                        function VTMultiPassStorageClose
                                        (multiPassStorage
                                        : VTMultiPassStorageRef): OSStatus;
                                        cdecl; external libVideoToolbox name _PU
                                        + 'VTMultiPassStorageClose';
                                        function VTCopyVideoEncoderList
                                        (options: CFDictionaryRef;
                                        listOfVideoEncodersOut: Pointer)
                                        : OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTCopyVideoEncoderList';
                                        function VTCreateCGImageFromCVPixelBuffer
                                        (pixelBuffer: CVPixelBufferRef;
                                        options: CFDictionaryRef;
                                        imageOut: Pointer): OSStatus; cdecl;
                                        external libVideoToolbox name _PU +
                                        'VTCreateCGImageFromCVPixelBuffer';

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

function kVTCompressionPropertyKey_ProfileLevel: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_ProfileLevel');
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

function kVTCompressionPropertyKey_ExpectedDuration: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTCompressionPropertyKey_ExpectedDuration');
end;

function kVTEncodeFrameOptionKey_ForceKeyFrame: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTEncodeFrameOptionKey_ForceKeyFrame');
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

function kVTMultiPassStorageCreationOption_DoNotDelete: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTMultiPassStorageCreationOption_DoNotDelete');
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

function kVTPixelTransferPropertyKey_DestinationYCbCrMatrix: Pointer;
begin
  Result := CocoaPointerConst(libVideoToolbox,
    'kVTPixelTransferPropertyKey_DestinationYCbCrMatrix');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

VideoToolboxModule := dlopen(MarshaledAString(libVideoToolbox), RTLD_LAZY);

finalization

dlclose(VideoToolboxModule);
{$ENDIF IOS}

end.
