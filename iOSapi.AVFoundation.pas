{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework AVFoundation
//

unit iOSapi.AVFoundation;

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
  iOSapi.AudioUnit,
  iOSapi.CocoaTypes,
  iOSapi.CoreAudio,
  iOSapi.CoreGraphics,
  iOSapi.CoreMIDI,
  iOSapi.CoreMedia,
  iOSapi.CoreVideo,
  iOSapi.Foundation,
  iOSapi.MediaToolbox,
  iOSapi.QuartzCore;

const
  AVKeyValueStatusUnknown = 0;
  AVKeyValueStatusLoading = 1;
  AVKeyValueStatusLoaded = 2;
  AVKeyValueStatusFailed = 3;
  AVKeyValueStatusCancelled = 4;
  AVAssetReferenceRestrictionForbidNone = 0;
  AVAssetReferenceRestrictionForbidRemoteReferenceToLocal = (1 shl 0);
  AVAssetReferenceRestrictionForbidLocalReferenceToRemote = (1 shl 1);
  AVAssetReferenceRestrictionForbidCrossSiteReference = (1 shl 2);
  AVAssetReferenceRestrictionForbidLocalReferenceToLocal = (1 shl 3);
  AVAssetReferenceRestrictionForbidAll = 65535;
  AVAssetExportSessionStatusUnknown = 0;
  AVAssetExportSessionStatusWaiting = 1;
  AVAssetExportSessionStatusExporting = 2;
  AVAssetExportSessionStatusCompleted = 3;
  AVAssetExportSessionStatusFailed = 4;
  AVAssetExportSessionStatusCancelled = 5;
  AVAssetImageGeneratorSucceeded = 0;
  AVAssetImageGeneratorFailed = 1;
  AVAssetImageGeneratorCancelled = 2;
  AVAssetReaderStatusUnknown = 0;
  AVAssetReaderStatusReading = 1;
  AVAssetReaderStatusCompleted = 2;
  AVAssetReaderStatusFailed = 3;
  AVAssetReaderStatusCancelled = 4;
  AVAssetWriterStatusUnknown = 0;
  AVAssetWriterStatusWriting = 1;
  AVAssetWriterStatusCompleted = 2;
  AVAssetWriterStatusFailed = 3;
  AVAssetWriterStatusCancelled = 4;
  AVAudioOtherFormat = 0;
  AVAudioPCMFormatFloat32 = 1;
  AVAudioPCMFormatFloat64 = 2;
  AVAudioPCMFormatInt16 = 3;
  AVAudioPCMFormatInt32 = 4;
  AVAudioConverterPrimeMethod_Pre = 0;
  AVAudioConverterPrimeMethod_Normal = 1;
  AVAudioConverterPrimeMethod_None = 2;
  AVAudioConverterInputStatus_HaveData = 0;
  AVAudioConverterInputStatus_NoDataNow = 1;
  AVAudioConverterInputStatus_EndOfStream = 2;
  AVAudioConverterOutputStatus_HaveData = 0;
  AVAudioConverterOutputStatus_InputRanDry = 1;
  AVAudioConverterOutputStatus_EndOfStream = 2;
  AVAudioConverterOutputStatus_Error = 3;
  AVAudioUnitReverbPresetSmallRoom = 0;
  AVAudioUnitReverbPresetMediumRoom = 1;
  AVAudioUnitReverbPresetLargeRoom = 2;
  AVAudioUnitReverbPresetMediumHall = 3;
  AVAudioUnitReverbPresetLargeHall = 4;
  AVAudioUnitReverbPresetPlate = 5;
  AVAudioUnitReverbPresetMediumChamber = 6;
  AVAudioUnitReverbPresetLargeChamber = 7;
  AVAudioUnitReverbPresetCathedral = 8;
  AVAudioUnitReverbPresetLargeRoom2 = 9;
  AVAudioUnitReverbPresetMediumHall2 = 10;
  AVAudioUnitReverbPresetMediumHall3 = 11;
  AVAudioUnitReverbPresetLargeHall2 = 12;
  AVAudioUnitEQFilterTypeParametric = 0;
  AVAudioUnitEQFilterTypeLowPass = 1;
  AVAudioUnitEQFilterTypeHighPass = 2;
  AVAudioUnitEQFilterTypeResonantLowPass = 3;
  AVAudioUnitEQFilterTypeResonantHighPass = 4;
  AVAudioUnitEQFilterTypeBandPass = 5;
  AVAudioUnitEQFilterTypeBandStop = 6;
  AVAudioUnitEQFilterTypeLowShelf = 7;
  AVAudioUnitEQFilterTypeHighShelf = 8;
  AVAudioUnitEQFilterTypeResonantLowShelf = 9;
  AVAudioUnitEQFilterTypeResonantHighShelf = 10;
  AVAudio3DMixingRenderingAlgorithmEqualPowerPanning = 0;
  AVAudio3DMixingRenderingAlgorithmSphericalHead = 1;
  AVAudio3DMixingRenderingAlgorithmHRTF = 2;
  AVAudio3DMixingRenderingAlgorithmSoundField = 3;
  AVAudio3DMixingRenderingAlgorithmStereoPassThrough = 5;
  AVAudioEnvironmentDistanceAttenuationModelExponential = 1;
  AVAudioEnvironmentDistanceAttenuationModelInverse = 2;
  AVAudioEnvironmentDistanceAttenuationModelLinear = 3;
  AVAudioQualityMin = 0;
  AVAudioQualityLow = 32;
  AVAudioQualityMedium = 64;
  AVAudioQualityHigh = 96;
  AVAudioQualityMax = 127;
  AVAudioPlayerNodeBufferLoops = 1 shl 0;
  AVAudioPlayerNodeBufferInterrupts = 1 shl 1;
  AVAudioPlayerNodeBufferInterruptsAtLoop = 1 shl 2;
  AVMusicSequenceLoadSMF_PreserveTracks = 0;
  AVMusicSequenceLoadSMF_ChannelsToTracks = (1 shl 0);
  AVMusicTrackLoopCountForever = -1;
  AVAudioSessionInterruptionOptionShouldResume = 1;
  AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation = 1;
  AVAudioSessionPortOverrideNone = 0;
  AVAudioSessionPortOverrideSpeaker = 1936747378;
  AVAudioSessionRouteChangeReasonUnknown = 0;
  AVAudioSessionRouteChangeReasonNewDeviceAvailable = 1;
  AVAudioSessionRouteChangeReasonOldDeviceUnavailable = 2;
  AVAudioSessionRouteChangeReasonCategoryChange = 3;
  AVAudioSessionRouteChangeReasonOverride = 4;
  AVAudioSessionRouteChangeReasonWakeFromSleep = 6;
  AVAudioSessionRouteChangeReasonNoSuitableRouteForCategory = 7;
  AVAudioSessionRouteChangeReasonRouteConfigurationChange = 8;
  AVAudioSessionCategoryOptionMixWithOthers = 1;
  AVAudioSessionCategoryOptionDuckOthers = 2;
  AVAudioSessionCategoryOptionAllowBluetooth = 4;
  AVAudioSessionCategoryOptionDefaultToSpeaker = 8;
  AVAudioSessionCategoryOptionInterruptSpokenAudioAndMixWithOthers = 17;
  AVAudioSessionInterruptionTypeBegan = 1;
  AVAudioSessionInterruptionTypeEnded = 0;
  AVAudioSessionSilenceSecondaryAudioHintTypeBegin = 1;
  AVAudioSessionSilenceSecondaryAudioHintTypeEnd = 0;
  AVAudioSessionRecordPermissionUndetermined = 1970168948;
  AVAudioSessionRecordPermissionDenied = 1684369017;
  AVAudioSessionRecordPermissionGranted = 1735552628;
  AVAudioSessionErrorCodeNone = 0;
  AVAudioSessionErrorCodeMediaServicesFailed = 1836282486;
  AVAudioSessionErrorCodeIsBusy = 560030580;
  AVAudioSessionErrorCodeIncompatibleCategory = 560161140;
  AVAudioSessionErrorCodeCannotInterruptOthers = 560557684;
  AVAudioSessionErrorCodeMissingEntitlement = 1701737535;
  AVAudioSessionErrorCodeSiriIsRecording = 1936290409;
  AVAudioSessionErrorCodeCannotStartPlaying = 561015905;
  AVAudioSessionErrorCodeCannotStartRecording = 561145187;
  AVAudioSessionErrorCodeBadParam = -50;
  AVAudioSessionErrorInsufficientPriority = 561017449;
  AVAudioSessionErrorCodeResourceNotAvailable = 561145203;
  AVAudioSessionErrorCodeUnspecified = 2003329396;
  AVAudioSessionInterruptionFlags_ShouldResume = 1;
  AVAudioSessionSetActiveFlags_NotifyOthersOnDeactivation = 1;
  AVAudioUnitDistortionPresetDrumsBitBrush = 0;
  AVAudioUnitDistortionPresetDrumsBufferBeats = 1;
  AVAudioUnitDistortionPresetDrumsLoFi = 2;
  AVAudioUnitDistortionPresetMultiBrokenSpeaker = 3;
  AVAudioUnitDistortionPresetMultiCellphoneConcert = 4;
  AVAudioUnitDistortionPresetMultiDecimated1 = 5;
  AVAudioUnitDistortionPresetMultiDecimated2 = 6;
  AVAudioUnitDistortionPresetMultiDecimated3 = 7;
  AVAudioUnitDistortionPresetMultiDecimated4 = 8;
  AVAudioUnitDistortionPresetMultiDistortedFunk = 9;
  AVAudioUnitDistortionPresetMultiDistortedCubed = 10;
  AVAudioUnitDistortionPresetMultiDistortedSquared = 11;
  AVAudioUnitDistortionPresetMultiEcho1 = 12;
  AVAudioUnitDistortionPresetMultiEcho2 = 13;
  AVAudioUnitDistortionPresetMultiEchoTight1 = 14;
  AVAudioUnitDistortionPresetMultiEchoTight2 = 15;
  AVAudioUnitDistortionPresetMultiEverythingIsBroken = 16;
  AVAudioUnitDistortionPresetSpeechAlienChatter = 17;
  AVAudioUnitDistortionPresetSpeechCosmicInterference = 18;
  AVAudioUnitDistortionPresetSpeechGoldenPi = 19;
  AVAudioUnitDistortionPresetSpeechRadioTower = 20;
  AVAudioUnitDistortionPresetSpeechWaves = 21;
  AVCaptureDevicePositionUnspecified = 0;
  AVCaptureDevicePositionBack = 1;
  AVCaptureDevicePositionFront = 2;
  AVCaptureFlashModeOff = 0;
  AVCaptureFlashModeOn = 1;
  AVCaptureFlashModeAuto = 2;
  AVCaptureTorchModeOff = 0;
  AVCaptureTorchModeOn = 1;
  AVCaptureTorchModeAuto = 2;
  AVCaptureFocusModeLocked = 0;
  AVCaptureFocusModeAutoFocus = 1;
  AVCaptureFocusModeContinuousAutoFocus = 2;
  AVCaptureAutoFocusRangeRestrictionNone = 0;
  AVCaptureAutoFocusRangeRestrictionNear = 1;
  AVCaptureAutoFocusRangeRestrictionFar = 2;
  AVCaptureExposureModeLocked = 0;
  AVCaptureExposureModeAutoExpose = 1;
  AVCaptureExposureModeContinuousAutoExposure = 2;
  AVCaptureExposureModeCustom = 3;
  AVCaptureWhiteBalanceModeLocked = 0;
  AVCaptureWhiteBalanceModeAutoWhiteBalance = 1;
  AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance = 2;
  AVAuthorizationStatusNotDetermined = 0;
  AVAuthorizationStatusRestricted = 1;
  AVAuthorizationStatusDenied = 2;
  AVAuthorizationStatusAuthorized = 3;
  AVCaptureVideoStabilizationModeOff = 0;
  AVCaptureVideoStabilizationModeStandard = 1;
  AVCaptureVideoStabilizationModeCinematic = 2;
  AVCaptureVideoStabilizationModeAuto = -1;
  AVCaptureAutoFocusSystemNone = 0;
  AVCaptureAutoFocusSystemContrastDetection = 1;
  AVCaptureAutoFocusSystemPhaseDetection = 2;
  AVCaptureSessionInterruptionReasonVideoDeviceNotAvailableInBackground = 1;
  AVCaptureSessionInterruptionReasonAudioDeviceInUseByAnotherClient = 2;
  AVCaptureSessionInterruptionReasonVideoDeviceInUseByAnotherClient = 3;
  AVCaptureSessionInterruptionReasonVideoDeviceNotAvailableWithMultipleForegroundApps =
    4;
  AVCaptureVideoOrientationPortrait = 1;
  AVCaptureVideoOrientationPortraitUpsideDown = 2;
  AVCaptureVideoOrientationLandscapeRight = 3;
  AVCaptureVideoOrientationLandscapeLeft = 4;
  AVVideoFieldModeBoth = 0;
  AVVideoFieldModeTopOnly = 1;
  AVVideoFieldModeBottomOnly = 2;
  AVVideoFieldModeDeinterlace = 3;
  AVErrorUnknown = -11800;
  AVErrorOutOfMemory = -11801;
  AVErrorSessionNotRunning = -11803;
  AVErrorDeviceAlreadyUsedByAnotherSession = -11804;
  AVErrorNoDataCaptured = -11805;
  AVErrorSessionConfigurationChanged = -11806;
  AVErrorDiskFull = -11807;
  AVErrorDeviceWasDisconnected = -11808;
  AVErrorMediaChanged = -11809;
  AVErrorMaximumDurationReached = -11810;
  AVErrorMaximumFileSizeReached = -11811;
  AVErrorMediaDiscontinuity = -11812;
  AVErrorMaximumNumberOfSamplesForFileFormatReached = -11813;
  AVErrorDeviceNotConnected = -11814;
  AVErrorDeviceInUseByAnotherApplication = -11815;
  AVErrorDeviceLockedForConfigurationByAnotherProcess = -11817;
  AVErrorSessionWasInterrupted = -11818;
  AVErrorMediaServicesWereReset = -11819;
  AVErrorExportFailed = -11820;
  AVErrorDecodeFailed = -11821;
  AVErrorInvalidSourceMedia = -11822;
  AVErrorFileAlreadyExists = -11823;
  AVErrorCompositionTrackSegmentsNotContiguous = -11824;
  AVErrorInvalidCompositionTrackSegmentDuration = -11825;
  AVErrorInvalidCompositionTrackSegmentSourceStartTime = -11826;
  AVErrorInvalidCompositionTrackSegmentSourceDuration = -11827;
  AVErrorFileFormatNotRecognized = -11828;
  AVErrorFileFailedToParse = -11829;
  AVErrorMaximumStillImageCaptureRequestsExceeded = -11830;
  AVErrorContentIsProtected = -11831;
  AVErrorNoImageAtTime = -11832;
  AVErrorDecoderNotFound = -11833;
  AVErrorEncoderNotFound = -11834;
  AVErrorContentIsNotAuthorized = -11835;
  AVErrorApplicationIsNotAuthorized = -11836;
  AVErrorDeviceIsNotAvailableInBackground = -11837;
  AVErrorOperationNotSupportedForAsset = -11838;
  AVErrorDecoderTemporarilyUnavailable = -11839;
  AVErrorEncoderTemporarilyUnavailable = -11840;
  AVErrorInvalidVideoComposition = -11841;
  AVErrorReferenceForbiddenByReferencePolicy = -11842;
  AVErrorInvalidOutputURLPathExtension = -11843;
  AVErrorScreenCaptureFailed = -11844;
  AVErrorDisplayWasDisabled = -11845;
  AVErrorTorchLevelUnavailable = -11846;
  AVErrorOperationInterrupted = -11847;
  AVErrorIncompatibleAsset = -11848;
  AVErrorFailedToLoadMediaData = -11849;
  AVErrorServerIncorrectlyConfigured = -11850;
  AVErrorApplicationIsNotAuthorizedToUseDevice = -11852;
  AVErrorFailedToParse = -11853;
  AVErrorFileTypeDoesNotSupportSampleReferences = -11854;
  AVErrorUndecodableMediaData = -11855;
  AVErrorAirPlayControllerRequiresInternet = -11856;
  AVErrorAirPlayReceiverRequiresInternet = -11857;
  AVErrorVideoCompositorFailed = -11858;
  AVErrorRecordingAlreadyInProgress = -11859;
  AVSpeechBoundaryImmediate = 0;
  AVSpeechBoundaryWord = 1;
  AVSpeechSynthesisVoiceQualityDefault = 1;
  AVSpeechSynthesisVoiceQualityEnhanced = 2;
  AVPlayerStatusUnknown = 0;
  AVPlayerStatusReadyToPlay = 1;
  AVPlayerStatusFailed = 2;
  AVPlayerActionAtItemEndAdvance = 0;
  AVPlayerActionAtItemEndPause = 1;
  AVPlayerActionAtItemEndNone = 2;
  AVPlayerItemStatusUnknown = 0;
  AVPlayerItemStatusReadyToPlay = 1;
  AVPlayerItemStatusFailed = 2;
  AVQueuedSampleBufferRenderingStatusUnknown = 0;
  AVQueuedSampleBufferRenderingStatusRendering = 1;
  AVQueuedSampleBufferRenderingStatusFailed = 2;

type

  // ===== Forward declarations =====
{$M+}
  AVAsynchronousKeyValueLoading = interface;
  AVAssetTrack = interface;
  AVFragmentedAssetTrack = interface;
  AVMetadataItem = interface;
  AVMediaSelection = interface;
  AVCompositionTrack = interface;
  AVAsset = interface;
  AVAssetTrackGroup = interface;
  AVTimedMetadataGroup = interface;
  AVMediaSelectionGroup = interface;
  AVURLAsset = interface;
  AVAssetResourceLoader = interface;
  AVFragmentMinding = interface;
  AVFragmentedAsset = interface;
  AVFragmentedAssetMinder = interface;
  AVMediaSelectionOption = interface;
  AVMutableMediaSelection = interface;
  AVAssetDownloadTask = interface;
  AVAssetDownloadDelegate = interface;
  AVAssetDownloadURLSession = interface;
  AVAudioMix = interface;
  AVVideoComposition = interface;
  AVMetadataItemFilter = interface;
  AVVideoCompositing = interface;
  AVAssetExportSession = interface;
  AVAssetImageGenerator = interface;
  AVAssetReaderOutput = interface;
  AVAssetReader = interface;
  AVAsynchronousVideoCompositionRequest = interface;
  AVVideoCompositionInstruction = interface;
  AVVideoCompositionRenderContext = interface;
  AVAsynchronousCIImageFilteringRequest = interface;
  AVVideoCompositionCoreAnimationTool = interface;
  AVVideoCompositionLayerInstruction = interface;
  AVMutableVideoComposition = interface;
  AVMutableVideoCompositionInstruction = interface;
  AVMutableVideoCompositionLayerInstruction = interface;
  AVVideoCompositionValidationHandling = interface;
  AVAudioMixInputParameters = interface;
  AVAssetReaderTrackOutput = interface;
  AVAssetReaderAudioMixOutput = interface;
  AVAssetReaderVideoCompositionOutput = interface;
  AVAssetReaderOutputMetadataAdaptor = interface;
  AVAssetReaderSampleReferenceOutput = interface;
  AVAssetResourceLoaderDelegate = interface;
  AVAssetResourceLoadingRequest = interface;
  AVAssetResourceRenewalRequest = interface;
  AVAssetResourceLoadingContentInformationRequest = interface;
  AVAssetResourceLoadingDataRequest = interface;
  AVAssetTrackSegment = interface;
  AVAssetWriterInput = interface;
  AVAssetWriter = interface;
  AVAssetWriterInputGroup = interface;
  AVAssetWriterInputPassDescription = interface;
  AVAssetWriterInputPixelBufferAdaptor = interface;
  AVAssetWriterInputMetadataAdaptor = interface;
  AVAudioFormat = interface;
  AVAudioBuffer = interface;
  AVAudioPCMBuffer = interface;
  AVAudioCompressedBuffer = interface;
  AVAudioChannelLayout = interface;
  AVAudioNode = interface;
  AVAudioConnectionPoint = interface;
  AVAudioConverter = interface;
  AVAudioInputNode = interface;
  AVAudioOutputNode = interface;
  AVAudioMixerNode = interface;
  AVAudioEngine = interface;
  AVAudioTime = interface;
  AVAudioUnit = interface;
  AVAudioUnitEffect = interface;
  AVAudioUnitReverb = interface;
  AVAudioUnitEQFilterParameters = interface;
  AVAudioUnitEQ = interface;
  AVAudioMixingDestination = interface;
  AVAudioStereoMixing = interface;
  AVAudio3DMixing = interface;
  AVAudioMixing = interface;
  AVAudioEnvironmentDistanceAttenuationParameters = interface;
  AVAudioEnvironmentReverbParameters = interface;
  AVAudioEnvironmentNode = interface;
  AVAudioFile = interface;
  AVAudioIONode = interface;
  AVMutableAudioMix = interface;
  AVPlayerItemTrack = interface;
  AVMutableAudioMixInputParameters = interface;
  AVAudioSessionChannelDescription = interface;
  AVAudioPlayerDelegate = interface;
  AVAudioPlayer = interface;
  AVAudioPlayerNode = interface;
  AVAudioRecorderDelegate = interface;
  AVAudioRecorder = interface;
  AVMusicTrack = interface;
  AVAudioSequencer = interface;
  AVAudioSessionDelegate = interface;
  AVAudioSessionPortDescription = interface;
  AVAudioSessionRouteDescription = interface;
  AVAudioSessionDataSourceDescription = interface;
  AVAudioSession = interface;
  AVAudioUnitComponent = interface;
  AVAudioUnitComponentManager = interface;
  AVAudioUnitDelay = interface;
  AVAudioUnitDistortion = interface;
  AVAudioUnitGenerator = interface;
  AVAudioUnitMIDIInstrument = interface;
  AVAudioUnitSampler = interface;
  AVAudioUnitTimeEffect = interface;
  AVAudioUnitTimePitch = interface;
  AVAudioUnitVarispeed = interface;
  AVCaptureDeviceFormat = interface;
  AVCaptureDevice = interface;
  AVFrameRateRange = interface;
  AVCaptureInputPort = interface;
  AVCaptureInput = interface;
  AVCaptureDeviceInput = interface;
  AVCaptureMetadataInput = interface;
  AVCaptureOutput = interface;
  AVCaptureConnection = interface;
  AVCaptureSession = interface;
  AVCaptureAudioChannel = interface;
  AVCaptureVideoPreviewLayer = interface;
  AVMetadataObject = interface;
  AVCaptureVideoDataOutputSampleBufferDelegate = interface;
  AVCaptureVideoDataOutput = interface;
  AVCaptureAudioDataOutputSampleBufferDelegate = interface;
  AVCaptureAudioDataOutput = interface;
  AVCaptureFileOutputRecordingDelegate = interface;
  AVCaptureFileOutput = interface;
  AVCaptureMovieFileOutput = interface;
  AVCaptureStillImageOutput = interface;
  AVCaptureBracketedStillImageSettings = interface;
  AVCaptureManualExposureBracketedStillImageSettings = interface;
  AVCaptureAutoExposureBracketedStillImageSettings = interface;
  AVCaptureMetadataOutputObjectsDelegate = interface;
  AVCaptureMetadataOutput = interface;
  AVComposition = interface;
  AVCompositionTrackSegment = interface;
  AVMutableCompositionTrack = interface;
  AVMutableComposition = interface;
  AVMIDIPlayer = interface;
  AVSpeechSynthesizerDelegate = interface;
  AVSpeechSynthesisVoice = interface;
  AVSpeechUtterance = interface;
  AVSpeechSynthesizer = interface;
  AVMutableMetadataItem = interface;
  AVMetadataItemValueRequest = interface;
  AVMetadataFaceObject = interface;
  AVMetadataMachineReadableCodeObject = interface;
  AVOutputSettingsAssistant = interface;
  AVPlayerItem = interface;
  AVPlayer = interface;
  AVPlayerMediaSelectionCriteria = interface;
  AVQueuePlayer = interface;
  AVTextStyleRule = interface;
  AVPlayerItemAccessLog = interface;
  AVPlayerItemErrorLog = interface;
  AVPlayerItemOutput = interface;
  AVPlayerItemMediaDataCollector = interface;
  AVPlayerItemAccessLogEvent = interface;
  AVPlayerItemErrorLogEvent = interface;
  AVPlayerItemMetadataCollectorPushDelegate = interface;
  AVDateRangeMetadataGroup = interface;
  AVPlayerItemMetadataCollector = interface;
  AVPlayerItemOutputPullDelegate = interface;
  AVPlayerItemVideoOutput = interface;
  AVPlayerItemLegibleOutputPushDelegate = interface;
  AVPlayerItemLegibleOutput = interface;
  AVPlayerItemOutputPushDelegate = interface;
  AVPlayerItemMetadataOutputPushDelegate = interface;
  AVPlayerItemMetadataOutput = interface;
  AVPlayerLayer = interface;
  AVSampleBufferDisplayLayer = interface;
  AVSynchronizedLayer = interface;
  NSValueAVFoundationExtensions = interface;
  AVTimeCoding = interface;
  AVMetadataGroup = interface;
  AVMutableTimedMetadataGroup = interface;
  AVMutableDateRangeMetadataGroup = interface;

  // ===== Framework typedefs =====
{$M+}
  CFTimeInterval = Double;
  NSInteger = Integer;
  AVKeyValueStatus = NSInteger;
  TAVFoundationCompletionHandler = procedure() of object;
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
CGFloat = Single;
CGAffineTransform = CGAffineTransform = record a: CGFloat;
b:
CGFloat;
c:
CGFloat;
d:
CGFloat;
tx:
CGFloat;
ty:
CGFloat;
end;
PCGAffineTransform = ^CGAffineTransform;;
CGSize = CGSize = record width: CGFloat;
height:
CGFloat;
end;
PCGSize = ^CGSize;;
NSUInteger = Cardinal;
AVAssetReferenceRestrictions = NSUInteger;
CMPersistentTrackID = Int32;
NSTimeInterval = Double;
CMTimeRange = record start: CMTime;
duration:
CMTime;
end;;
AVAssetExportSessionStatus = NSInteger;
TAVFoundationCompletionHandler1 =
procedure(param1: Boolean) of object;
TAVFoundationHandler =
procedure(param1: NSArray) of object;
AVAssetImageGeneratorResult = NSInteger;
CGImageRef = Pointer;
AVAssetImageGeneratorCompletionHandler =
procedure(param1: CMTime; param2: CGImageRef; param3: CMTime;
  param4: AVAssetImageGeneratorResult; param5: NSError) of object;
AVAssetReaderStatus = NSInteger;

AVPixelAspectRatio = record horizontalSpacing: NSInteger;
verticalSpacing:
NSInteger;
end;
PAVPixelAspectRatio = ^AVPixelAspectRatio;

AVEdgeWidths = record left: CGFloat;
top:
CGFloat;
right:
CGFloat;
bottom:
CGFloat;
end;
PAVEdgeWidths = ^AVEdgeWidths;

CVBufferRef = Pointer;
CVImageBufferRef = CVBufferRef;
CVPixelBufferRef = CVImageBufferRef;
TAVFoundationApplyingCIFiltersWithHandler =
procedure(param1: AVAsynchronousCIImageFilteringRequest) of object;
CGColorRef = Pointer;
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
CMSampleBufferRef = Pointer;
dispatch_queue_t = Pointer;
CMTimeMapping = record source: CMTimeRange;
target:
CMTimeRange;
end;;
AVAssetWriterStatus = NSInteger;
CMFormatDescriptionRef = Pointer;
CVPixelBufferPoolRef = Pointer;
AVAudioFramePosition = Int64;
AVAudioFrameCount = LongWord;
AVAudioPacketCount = LongWord;
AVAudioChannelCount = LongWord;
AVAudioNodeCompletionHandler =
procedure() of object;
AVAudioNodeBus = NSUInteger;

AVAudio3DPoint = record x: Single;
y:
Single;
z:
Single;
end;
PAVAudio3DPoint = ^AVAudio3DPoint;

AVAudio3DVector = AVAudio3DPoint;

AVAudio3DVectorOrientation = record forward: AVAudio3DVector;
up:
AVAudio3DVector;
end;
PAVAudio3DVectorOrientation = ^AVAudio3DVectorOrientation;

AVAudio3DAngularOrientation = record yaw: Single;
pitch:
Single;
roll:
Single;
end;
PAVAudio3DAngularOrientation = ^AVAudio3DAngularOrientation;

AudioChannelLayoutTag = UInt32;
AudioChannelBitmap = UInt32;
AudioChannelLabel = UInt32;
AudioChannelFlags = UInt32;
AudioChannelDescription = AudioChannelDescription = record mChannelLabel
  : AudioChannelLabel;
mChannelFlags:
AudioChannelFlags;
mCoordinates:
array [0 .. 2] of Single;
end;
PAudioChannelDescription = ^AudioChannelDescription;;
AVAudioCommonFormat = NSUInteger;
AudioFormatID = UInt32;
AudioFormatFlags = UInt32;
CMAudioFormatDescriptionRef = CMFormatDescriptionRef;
AVAudioConverterPrimeMethod = NSInteger;

AVAudioConverterPrimeInfo = record leadingFrames: AVAudioFrameCount;
trailingFrames:
AVAudioFrameCount;
end;
PAVAudioConverterPrimeInfo = ^AVAudioConverterPrimeInfo;

AVAudioConverterInputStatus = NSInteger;
AVAudioConverterOutputStatus = NSInteger;
AVAudioConverterInputBlock =
function(param1: AVAudioPacketCount; param2: NSInteger): AVAudioBuffer;
cdecl;
MusicSequence = Pointer;
AVAudioNodeTapBlock =
procedure(param1: AVAudioPCMBuffer; param2: AVAudioTime) of object;
FourCharCode = UInt32;
OSType = FourCharCode;
AudioComponentDescription = AudioComponentDescription = record
  componentType: OSType;
componentSubType:
OSType;
componentManufacturer:
OSType;
componentFlags:
UInt32;
componentFlagsMask:
UInt32;
end;
PAudioComponentDescription = ^AudioComponentDescription;;
AudioComponentInstantiationOptions = UInt32;
TAVFoundationCompletionHandler2 =
procedure(param1: AVAudioUnit; param2: NSError) of object;
AudioComponentInstance = Pointer;
AudioUnit = AudioComponentInstance;
AVAudioUnitReverbPreset = NSInteger;
AVAudioUnitEQFilterType = NSInteger;
AVAudio3DMixingRenderingAlgorithm = NSInteger;
AVAudioEnvironmentDistanceAttenuationModel = NSInteger;
MTAudioProcessingTapRef = Pointer;
AVAudioQuality = NSInteger;
AVAudioPlayerNodeBufferOptions = NSUInteger;
AVMusicTimeStamp = Double;
AVMusicSequenceLoadOptions = NSUInteger;

_AVBeatRange = record start: AVMusicTimeStamp;
length:
AVMusicTimeStamp;
end;
P_AVBeatRange = ^_AVBeatRange;
AVBeatRange = _AVBeatRange;

MIDIObjectRef = UInt32;
MIDIEndpointRef = MIDIObjectRef;
AVMusicTrackLoopCount = NSInteger;
AVAudioSessionInterruptionOptions = NSUInteger;
AVAudioSessionSetActiveOptions = NSUInteger;
AVAudioSessionPortOverride = NSUInteger;
AVAudioSessionRouteChangeReason = NSUInteger;
AVAudioSessionCategoryOptions = NSUInteger;
AVAudioSessionInterruptionType = NSUInteger;
AVAudioSessionSilenceSecondaryAudioHintType = NSUInteger;
AVAudioSessionRecordPermission = NSUInteger;
AVAudioSessionErrorCode = NSInteger;
PermissionBlock =
procedure(param1: Boolean) of object;
SMPTETimeType = UInt32;
SMPTETimeFlags = UInt32;
SMPTETime = SMPTETime = record mSubframes: Int16;
mSubframeDivisor:
Int16;
mCounter:
UInt32;
mType:
SMPTETimeType;
mFlags:
SMPTETimeFlags;
mHours:
Int16;
mMinutes:
Int16;
mSeconds:
Int16;
mFrames:
Int16;
end;
PSMPTETime = ^SMPTETime;;
AudioTimeStampFlags = UInt32;
AudioTimeStamp = AudioTimeStamp = record mSampleTime: Double;
mHostTime:
UInt64;
mRateScalar:
Double;
mWordClockTime:
UInt64;
mSMPTETime:
SMPTETime;
mFlags:
AudioTimeStampFlags;
mReserved:
UInt32;
end;
PAudioTimeStamp = ^AudioTimeStamp;;
AudioComponent = Pointer;
TAVFoundationTestHandler =
function(param1: AVAudioUnitComponent; param2: PBoolean): Boolean;
cdecl;
AVAudioUnitDistortionPreset = NSInteger;
AVCaptureDevicePosition = NSInteger;
AVCaptureFlashMode = NSInteger;
AVCaptureTorchMode = NSInteger;
AVCaptureFocusMode = NSInteger;
AVCaptureAutoFocusRangeRestriction = NSInteger;
TAVFoundationCompletionHandler3 =
procedure(param1: CMTime) of object;
AVCaptureExposureMode = NSInteger;
AVCaptureWhiteBalanceMode = NSInteger;

AVCaptureWhiteBalanceGains = record redGain: Single;
greenGain:
Single;
blueGain:
Single;
end;
PAVCaptureWhiteBalanceGains = ^AVCaptureWhiteBalanceGains;

AVCaptureWhiteBalanceChromaticityValues = record x: Single;
y:
Single;
end;
PAVCaptureWhiteBalanceChromaticityValues = ^
  AVCaptureWhiteBalanceChromaticityValues;

AVCaptureWhiteBalanceTemperatureAndTintValues = record temperature: Single;
tint:
Single;
end;
PAVCaptureWhiteBalanceTemperatureAndTintValues = ^
  AVCaptureWhiteBalanceTemperatureAndTintValues;

AVAuthorizationStatus = NSInteger;
AVCaptureVideoStabilizationMode = NSInteger;
AVCaptureAutoFocusSystem = NSInteger;
CMVideoDimensions = record width: Int32;
height:
Int32;
end;;
CMClockRef = Pointer;
CMMetadataFormatDescriptionRef = CMFormatDescriptionRef;
AVCaptureSessionInterruptionReason = NSInteger;
AVCaptureVideoOrientation = NSInteger;
AVVideoFieldMode = NSInteger;
TAVFoundationCompletionHandler4 =
procedure(param1: CMSampleBufferRef; param2: NSError) of object;
TAVFoundationCompletionHandler5 =
procedure(param1: Boolean; param2: NSError) of object;
TAVFoundationCompletionHandler6 =
procedure(param1: CMSampleBufferRef;
  param2: AVCaptureBracketedStillImageSettings; param3: NSError) of object;
AVError = NSInteger;
AVMIDIPlayerCompletionHandler =
procedure() of object;
AVSpeechBoundary = NSInteger;
AVSpeechSynthesisVoiceQuality = NSInteger;
NSRange = _NSRange = record location: NSUInteger;
length:
NSUInteger;
end;
P_NSRange = ^_NSRange;;
TAVFoundationValueLoadingHandler =
procedure(param1: AVMetadataItemValueRequest) of object;
CMVideoFormatDescriptionRef = CMFormatDescriptionRef;
AVPlayerStatus = NSInteger;
AVPlayerActionAtItemEnd = NSInteger;
AVPlayerItemStatus = NSInteger;
CMTimebaseRef = Pointer;
NSStringEncoding = NSUInteger;
AVQueuedSampleBufferRenderingStatus = NSInteger;
// ===== Interface declarations =====

AVAssetTrackClass = interface(NSObjectClass)
  ['{985D81CE-A70B-4718-8001-14B343752462}']
end;
AVAssetTrack = interface(NSObject)['{4F7487E9-FDF8-46DC-9DF9-53CA90B3211A}']
function asset: AVAsset;
cdecl;

function trackID: CMPersistentTrackID; cdecl;
  function mediaType: NSString; cdecl;
    function formatDescriptions: NSArray; cdecl;
      function isPlayable: Boolean; cdecl;
        function isEnabled: Boolean; cdecl;
          function isSelfContained: Boolean; cdecl;
            function totalSampleDataLength: Int64; cdecl;
              function hasMediaCharacteristic(mediaCharacteristic: NSString)
                : Boolean; cdecl;
                function timeRange: CMTimeRange; cdecl;
                  function naturalTimeScale: CMTimeScale; cdecl;
                    function estimatedDataRate: Single; cdecl;
                      function languageCode: NSString; cdecl;
                        function extendedLanguageTag: NSString; cdecl;
                          function naturalSize: CGSize; cdecl;
                            function preferredTransform
                              : CGAffineTransform; cdecl;
                              function preferredVolume: Single; cdecl;
                                function nominalFrameRate: Single; cdecl;
                                  function minFrameDuration: CMTime; cdecl;
                                    function requiresFrameReordering
                                      : Boolean; cdecl;
                                      function segments: NSArray; cdecl;
                                        function segmentForTrackTime
                                        (trackTime: CMTime)
                                        : AVAssetTrackSegment; cdecl;
                                        function samplePresentationTimeForTrackTime
                                        (trackTime: CMTime): CMTime; cdecl;
                                        function commonMetadata: NSArray; cdecl;
                                        function metadata: NSArray; cdecl;
                                        function availableMetadataFormats
                                        : NSArray; cdecl;
                                        function metadataForFormat
                                        (format: NSString): NSArray; cdecl;
                                        function availableTrackAssociationTypes
                                        : NSArray; cdecl;
                                        function associatedTracksOfType
                                        (trackAssociationType: NSString)
                                        : NSArray; cdecl;
                                        end;

                                        TAVAssetTrack = class
                                        (TOCGenericImport<AVAssetTrackClass,
                                        AVAssetTrack>)
                                        end;
                                        PAVAssetTrack = Pointer;

                                        AVFragmentedAssetTrackClass = interface
                                        (AVAssetTrackClass)
                                        ['{A2E6DDC7-7F93-4EA5-92A1-B6892FFA8965}']
                                        end;
                                        AVFragmentedAssetTrack = interface
                                        (AVAssetTrack)
                                        ['{5792C40F-A356-4D15-A6B4-9C6FA760557D}']
                                        end;

                                      TAVFragmentedAssetTrack = class
                                        (TOCGenericImport<
                                        AVFragmentedAssetTrackClass,
                                        AVFragmentedAssetTrack>)
                                      end;
                                  PAVFragmentedAssetTrack = Pointer;

                                  AVMetadataItemClass = interface(NSObjectClass)
                                    ['{6D6BB780-808B-43AC-856F-2FF771B152EE}']
                                    [MethodName
                                    ('metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:')
                                    ]
                                  { class } function
                                    metadataItemsFromArrayFilteredAndSortedAccordingToPreferredLanguages
                                    (metadataItems: NSArray;
                                    filteredAndSortedAccordingToPreferredLanguages
                                    : NSArray): NSArray;
                                  cdecl;
                                  [MethodName
                                    ('metadataItemsFromArray:filteredByIdentifier:')
                                    ]
                                  { class } function
                                      metadataItemsFromArrayFilteredByIdentifier
                                      (metadataItems: NSArray;
                                      filteredByIdentifier: NSString)
                                      : NSArray; cdecl;
                                    [MethodName
                                      ('metadataItemsFromArray:filteredByMetadataItemFilter:')
                                      ]
                                    { class } function
                                        metadataItemsFromArrayFilteredByMetadataItemFilter
                                        (metadataItems: NSArray;
                                        filteredByMetadataItemFilter
                                        : AVMetadataItemFilter): NSArray; cdecl;
                                      { class } function identifierForKey
                                        (key: Pointer; keySpace: NSString)
                                        : NSString; cdecl;
                                        { class } function keySpaceForIdentifier
                                        (identifier: NSString): NSString; cdecl;
                                        { class } function keyForIdentifier
                                        (identifier: NSString): Pointer; cdecl;
                                        { class } function
                                        metadataItemWithPropertiesOfMetadataItem
                                        (metadataItem: AVMetadataItem;
                                        valueLoadingHandler
                                        : TAVFoundationValueLoadingHandler)
                                        : AVMetadataItem; cdecl;
                                        [MethodName
                                        ('metadataItemsFromArray:withLocale:')]
                                        { class } function
                                        metadataItemsFromArrayWithLocale
                                        (metadataItems: NSArray;
                                        withLocale: NSLocale): NSArray; cdecl;
                                        [MethodName
                                        ('metadataItemsFromArray:withKey:keySpace:')
                                        ]
                                        { class } function
                                        metadataItemsFromArrayWithKeyKeySpace
                                        (metadataItems: NSArray;
                                        withKey: Pointer; keySpace: NSString)
                                        : NSArray; cdecl;
                                        end;
                                        AVMetadataItem = interface(NSObject)
                                        ['{DB35FEE2-BD39-4DB5-BADE-3D9CA5A11719}']
                                        function identifier: NSString;
                                        cdecl;
                                        function extendedLanguageTag
                                        : NSString; cdecl;
                                        function locale: NSLocale; cdecl;
                                        function time: CMTime; cdecl;
                                        function duration: CMTime; cdecl;
                                        function dataType: NSString; cdecl;
                                        function value: Pointer; cdecl;
                                        function extraAttributes
                                        : NSDictionary; cdecl;
                                        function startDate: NSDate; cdecl;
                                        function stringValue: NSString; cdecl;
                                        function numberValue: NSNumber; cdecl;
                                        function dateValue: NSDate; cdecl;
                                        function dataValue: NSData; cdecl;
                                        function statusOfValueForKey
                                        (key: NSString; error: NSError)
                                        : AVKeyValueStatus; cdecl;
                                        procedure loadValuesAsynchronouslyForKeys
                                        (keys: NSArray;
                                        completionHandler
                                        : TAVFoundationCompletionHandler);
                                        cdecl;
                                        function key: Pointer; cdecl;
                                        function commonKey: NSString; cdecl;
                                        function keySpace: NSString; cdecl;
                                        end;

                                        TAVMetadataItem = class
                                        (TOCGenericImport<AVMetadataItemClass,
                                        AVMetadataItem>)
                                        end;
                                        PAVMetadataItem = Pointer;

                                        AVMediaSelectionClass = interface
                                        (NSObjectClass)
                                        ['{49B88B63-EAE1-4366-A3B2-122E9FD49FD5}']
                                        end;
                                        AVMediaSelection = interface(NSObject)
                                        ['{F896C5D4-27FF-4F9F-BA8E-C38966DFDF1D}']
                                        function asset: AVAsset;
                                        cdecl;
                                        function selectedMediaOptionInMediaSelectionGroup
                                        (mediaSelectionGroup
                                        : AVMediaSelectionGroup)
                                        : AVMediaSelectionOption; cdecl;
                                        function mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup
                                        (mediaSelectionGroup
                                        : AVMediaSelectionGroup)
                                        : Boolean; cdecl;
                                        end;

                                        TAVMediaSelection = class
                                        (TOCGenericImport<AVMediaSelectionClass,
                                        AVMediaSelection>)
                                        end;
                                        PAVMediaSelection = Pointer;

                                        AVCompositionTrackClass = interface
                                        (AVAssetTrackClass)
                                        ['{624F955D-E492-43AE-A989-8686D06F8D43}']
                                        end;
                                        AVCompositionTrack = interface
                                        (AVAssetTrack)
                                        ['{A8620007-A1DE-494F-BE93-23ADD92281E8}']
                                        function segments: NSArray;
                                        cdecl;
                                        end;

                                        TAVCompositionTrack = class
                                        (TOCGenericImport<
                                        AVCompositionTrackClass,
                                        AVCompositionTrack>)
                                        end;
                                        PAVCompositionTrack = Pointer;

                                        AVAssetClass = interface(NSObjectClass)
                                        ['{300AA975-7D6D-458C-9279-7FC0D9F59860}']
                                        { class } function assetWithURL
                                        (URL: NSURL): Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVAsset = interface(NSObject)
                                        ['{9337CBBD-A560-47AB-8F4D-025092BDEF32}']
                                        function duration: CMTime;
                                        cdecl;
                                        function preferredRate: Single; cdecl;
                                        function preferredVolume: Single; cdecl;
                                        function preferredTransform
                                        : CGAffineTransform; cdecl;
                                        function naturalSize: CGSize; cdecl;
                                        function providesPreciseDurationAndTiming
                                        : Boolean; cdecl;
                                        procedure cancelLoading; cdecl;
                                        function referenceRestrictions
                                        : AVAssetReferenceRestrictions; cdecl;
                                        function tracks: NSArray; cdecl;
                                        function trackWithTrackID
                                        (trackID: CMPersistentTrackID)
                                        : AVAssetTrack; cdecl;
                                        function tracksWithMediaType
                                        (mediaType: NSString): NSArray; cdecl;
                                        function tracksWithMediaCharacteristic
                                        (mediaCharacteristic: NSString)
                                        : NSArray; cdecl;
                                        function trackGroups: NSArray; cdecl;
                                        function creationDate
                                        : AVMetadataItem; cdecl;
                                        function lyrics: NSString; cdecl;
                                        function commonMetadata: NSArray; cdecl;
                                        function metadata: NSArray; cdecl;
                                        function availableMetadataFormats
                                        : NSArray; cdecl;
                                        function metadataForFormat
                                        (format: NSString): NSArray; cdecl;
                                        function availableChapterLocales
                                        : NSArray; cdecl;
                                        function chapterMetadataGroupsWithTitleLocale
                                        (locale: NSLocale;
                                        containingItemsWithCommonKeys: NSArray)
                                        : NSArray; cdecl;
                                        function chapterMetadataGroupsBestMatchingPreferredLanguages
                                        (preferredLanguages: NSArray)
                                        : NSArray; cdecl;
                                        function availableMediaCharacteristicsWithMediaSelectionOptions
                                        : NSArray; cdecl;
                                        function mediaSelectionGroupForMediaCharacteristic
                                        (mediaCharacteristic: NSString)
                                        : AVMediaSelectionGroup; cdecl;
                                        function preferredMediaSelection
                                        : AVMediaSelection; cdecl;
                                        function hasProtectedContent
                                        : Boolean; cdecl;
                                        function canContainFragments
                                        : Boolean; cdecl;
                                        function containsFragments
                                        : Boolean; cdecl;
                                        function isPlayable: Boolean; cdecl;
                                        function isExportable: Boolean; cdecl;
                                        function isReadable: Boolean; cdecl;
                                        function isComposable: Boolean; cdecl;
                                        function isCompatibleWithSavedPhotosAlbum
                                        : Boolean; cdecl;
                                        function isCompatibleWithAirPlayVideo
                                        : Boolean; cdecl;
                                        function unusedTrackID
                                        : CMPersistentTrackID; cdecl;
                                        end;

                                        TAVAsset = class
                                        (TOCGenericImport<
                                        AVAssetClass, AVAsset>)
                                        end;
                                        PAVAsset = Pointer;

                                        AVAssetTrackGroupClass = interface
                                        (NSObjectClass)
                                        ['{25BFA7DD-7E89-4BE4-82C9-517C38CBC9E8}']
                                        end;
                                        AVAssetTrackGroup = interface(NSObject)
                                        ['{3013F9DA-ABEA-45CD-8BE6-8A6F861B630B}']
                                        function trackIDs: NSArray;
                                        cdecl;
                                        end;

                                        TAVAssetTrackGroup = class
                                        (TOCGenericImport<
                                        AVAssetTrackGroupClass,
                                        AVAssetTrackGroup>)
                                        end;
                                        PAVAssetTrackGroup = Pointer;

                                        AVMetadataGroupClass = interface
                                        (NSObjectClass)
                                        ['{B8E1D94A-598C-4A04-82FC-19828F28CEF5}']
                                        end;
                                        AVMetadataGroup = interface(NSObject)
                                        ['{F41D61CE-9385-4FC5-8597-D03FBE09E893}']
                                        function items: NSArray;
                                        cdecl;
                                        function classifyingLabel
                                        : NSString; cdecl;
                                        function uniqueID: NSString; cdecl;
                                        end;

                                        TAVMetadataGroup = class
                                        (TOCGenericImport<AVMetadataGroupClass,
                                        AVMetadataGroup>)
                                        end;
                                        PAVMetadataGroup = Pointer;

                                        AVTimedMetadataGroupClass = interface
                                        (AVMetadataGroupClass)
                                        ['{79E4AEF7-FDEA-4A2F-AE60-A55197557AFF}']
                                        end;
                                        AVTimedMetadataGroup = interface
                                        (AVMetadataGroup)
                                        ['{CE88B8D8-CC00-41E6-BB16-842B4F520335}']
                                        function initWithItems(items: NSArray;
                                        timeRange: CMTimeRange)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithSampleBuffer
                                        (sampleBuffer: CMSampleBufferRef)
                                        : Pointer { instancetype }; cdecl;
                                        function timeRange: CMTimeRange; cdecl;
                                        function items: NSArray; cdecl;
                                        function copyFormatDescription
                                        : CMMetadataFormatDescriptionRef; cdecl;
                                        end;

                                        TAVTimedMetadataGroup = class
                                        (TOCGenericImport<
                                        AVTimedMetadataGroupClass,
                                        AVTimedMetadataGroup>)
                                        end;
                                        PAVTimedMetadataGroup = Pointer;

                                        AVMediaSelectionGroupClass = interface
                                        (NSObjectClass)
                                        ['{207D17B4-59AD-4F29-987C-BDAAC3501CF6}']
                                        { class } function
                                        playableMediaSelectionOptionsFromArray
                                        (mediaSelectionOptions: NSArray)
                                        : NSArray;
                                        cdecl;
                                        [MethodName
                                        ('mediaSelectionOptionsFromArray:filteredAndSortedAccordingToPreferredLanguages:')
                                        ]
                                        { class } function
                                        mediaSelectionOptionsFromArrayFilteredAndSortedAccordingToPreferredLanguages
                                        (mediaSelectionOptions: NSArray;
                                        filteredAndSortedAccordingToPreferredLanguages
                                        : NSArray): NSArray; cdecl;
                                        [MethodName
                                        ('mediaSelectionOptionsFromArray:withLocale:')
                                        ]
                                        { class } function
                                        mediaSelectionOptionsFromArrayWithLocale
                                        (mediaSelectionOptions: NSArray;
                                        withLocale: NSLocale): NSArray; cdecl;
                                        [MethodName
                                        ('mediaSelectionOptionsFromArray:withMediaCharacteristics:')
                                        ]
                                        { class } function
                                        mediaSelectionOptionsFromArrayWithMediaCharacteristics
                                        (mediaSelectionOptions: NSArray;
                                        withMediaCharacteristics: NSArray)
                                        : NSArray; cdecl;
                                        [MethodName
                                        ('mediaSelectionOptionsFromArray:withoutMediaCharacteristics:')
                                        ]
                                        { class } function
                                        mediaSelectionOptionsFromArrayWithoutMediaCharacteristics
                                        (mediaSelectionOptions: NSArray;
                                        withoutMediaCharacteristics: NSArray)
                                        : NSArray; cdecl;
                                        end;
                                        AVMediaSelectionGroup = interface
                                        (NSObject)
                                        ['{B66A4A2D-5702-4A1F-BE39-D2DA6F557190}']
                                        function options: NSArray;
                                        cdecl;
                                        function defaultOption
                                        : AVMediaSelectionOption; cdecl;
                                        function allowsEmptySelection
                                        : Boolean; cdecl;
                                        function mediaSelectionOptionWithPropertyList
                                        (plist: Pointer)
                                        : AVMediaSelectionOption; cdecl;
                                        end;

                                        TAVMediaSelectionGroup = class
                                        (TOCGenericImport<
                                        AVMediaSelectionGroupClass,
                                        AVMediaSelectionGroup>)
                                        end;
                                        PAVMediaSelectionGroup = Pointer;

                                        AVURLAssetClass = interface
                                        (AVAssetClass)
                                        ['{D6A4CCA3-1B85-40B6-A3A1-31A86C846262}']
                                        { class } function audiovisualTypes
                                        : NSArray;
                                        cdecl;
                                        { class } function audiovisualMIMETypes
                                        : NSArray; cdecl;
                                        { class } function
                                        isPlayableExtendedMIMEType
                                        (extendedMIMEType: NSString)
                                        : Boolean; cdecl;
                                        { class } function URLAssetWithURL
                                        (URL: NSURL; options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        AVURLAsset = interface(AVAsset)
                                        ['{FD235FAF-B623-433A-9863-5FA0695FDD3A}']
                                        function initWithURL(URL: NSURL;
                                        options: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function URL: NSURL; cdecl;
                                        function resourceLoader
                                        : AVAssetResourceLoader; cdecl;
                                        function compatibleTrackForCompositionTrack
                                        (compositionTrack: AVCompositionTrack)
                                        : AVAssetTrack; cdecl;
                                        end;

                                        TAVURLAsset = class
                                        (TOCGenericImport<AVURLAssetClass,
                                        AVURLAsset>)
                                        end;
                                        PAVURLAsset = Pointer;

                                        AVAssetResourceLoaderClass = interface
                                        (NSObjectClass)
                                        ['{0517D32F-A7CE-4B23-9367-8EB6780B9ABA}']
                                        end;
                                        AVAssetResourceLoader = interface
                                        (NSObject)
                                        ['{FDA5A5C5-0E0B-4992-9618-0396C31158D5}']
                                        procedure setDelegate(delegate: Pointer;
                                        queue: dispatch_queue_t);
                                        cdecl;
                                        function delegate: Pointer; cdecl;
                                        function delegateQueue
                                        : dispatch_queue_t; cdecl;
                                        procedure setPreloadsEligibleContentKeys
                                        (preloadsEligibleContentKeys
                                        : Boolean); cdecl;
                                        function preloadsEligibleContentKeys
                                        : Boolean; cdecl;
                                        end;

                                        TAVAssetResourceLoader = class
                                        (TOCGenericImport<
                                        AVAssetResourceLoaderClass,
                                        AVAssetResourceLoader>)
                                        end;
                                        PAVAssetResourceLoader = Pointer;

                                        AVFragmentedAssetClass = interface
                                        (AVURLAssetClass)
                                        ['{5FA7238D-EB3C-4343-A594-1DEDAB691712}']
                                        { class } function
                                        fragmentedAssetWithURL(URL: NSURL;
                                        options: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVFragmentedAsset = interface
                                        (AVURLAsset)
                                        ['{61070D8C-C99E-4455-8365-52C4F0B91FE6}']
                                        function tracks: NSArray;
                                        cdecl;
                                        function trackWithTrackID
                                        (trackID: CMPersistentTrackID)
                                        : AVFragmentedAssetTrack; cdecl;
                                        function tracksWithMediaType
                                        (mediaType: NSString): NSArray; cdecl;
                                        function tracksWithMediaCharacteristic
                                        (mediaCharacteristic: NSString)
                                        : NSArray; cdecl;
                                        end;

                                        TAVFragmentedAsset = class
                                        (TOCGenericImport<
                                        AVFragmentedAssetClass,
                                        AVFragmentedAsset>)
                                        end;
                                        PAVFragmentedAsset = Pointer;

                                        AVFragmentedAssetMinderClass = interface
                                        (NSObjectClass)
                                        ['{1BE69FFB-BC3B-4E57-BB5E-DBE996E86686}']
                                        { class } function
                                        fragmentedAssetMinderWithAsset
                                        (asset: AVAsset;
                                        mindingInterval: NSTimeInterval)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVFragmentedAssetMinder = interface
                                        (NSObject)
                                        ['{CA008EA9-E659-4CF4-AB28-587C438CC52A}']
                                        procedure setMindingInterval
                                        (mindingInterval: NSTimeInterval);
                                        cdecl;
                                        function mindingInterval
                                        : NSTimeInterval; cdecl;
                                        function assets: NSArray; cdecl;
                                        procedure addFragmentedAsset
                                        (asset: AVAsset); cdecl;
                                        procedure removeFragmentedAsset
                                        (asset: AVAsset); cdecl;
                                        end;

                                        TAVFragmentedAssetMinder = class
                                        (TOCGenericImport<
                                        AVFragmentedAssetMinderClass,
                                        AVFragmentedAssetMinder>)
                                        end;
                                        PAVFragmentedAssetMinder = Pointer;

                                        AVMediaSelectionOptionClass = interface
                                        (NSObjectClass)
                                        ['{DCA5A5F9-8E3A-4E1F-9ABC-AD9DA6EC8800}']
                                        end;
                                        AVMediaSelectionOption = interface
                                        (NSObject)
                                        ['{BD19CDBD-057A-4ACF-91C9-D930DD2282C8}']
                                        function mediaType: NSString;
                                        cdecl;
                                        function mediaSubTypes: NSArray; cdecl;
                                        function hasMediaCharacteristic
                                        (mediaCharacteristic: NSString)
                                        : Boolean; cdecl;
                                        function isPlayable: Boolean; cdecl;
                                        function extendedLanguageTag
                                        : NSString; cdecl;
                                        function locale: NSLocale; cdecl;
                                        function commonMetadata: NSArray; cdecl;
                                        function availableMetadataFormats
                                        : NSArray; cdecl;
                                        function metadataForFormat
                                        (format: NSString): NSArray; cdecl;
                                        function associatedMediaSelectionOptionInMediaSelectionGroup
                                        (mediaSelectionGroup
                                        : AVMediaSelectionGroup)
                                        : AVMediaSelectionOption; cdecl;
                                        function propertyList: Pointer; cdecl;
                                        function displayNameWithLocale
                                        (locale: NSLocale): NSString; cdecl;
                                        function displayName: NSString; cdecl;
                                        end;

                                        TAVMediaSelectionOption = class
                                        (TOCGenericImport<
                                        AVMediaSelectionOptionClass,
                                        AVMediaSelectionOption>)
                                        end;
                                        PAVMediaSelectionOption = Pointer;

                                        AVMutableMediaSelectionClass = interface
                                        (AVMediaSelectionClass)
                                        ['{B6509CE1-AC9B-42E7-88B8-ECB0FE7588DA}']
                                        end;
                                        AVMutableMediaSelection = interface
                                        (AVMediaSelection)
                                        ['{6AC2EBB2-1F2E-4544-9402-B38142A259C8}']
                                        procedure selectMediaOption
                                        (mediaSelectionOption
                                        : AVMediaSelectionOption;
                                        inMediaSelectionGroup
                                        : AVMediaSelectionGroup);
                                        cdecl;
                                        end;

                                        TAVMutableMediaSelection = class
                                        (TOCGenericImport<
                                        AVMutableMediaSelectionClass,
                                        AVMutableMediaSelection>)
                                        end;
                                        PAVMutableMediaSelection = Pointer;

                                        AVAssetDownloadTaskClass = interface
                                        (NSURLSessionTaskClass)
                                        ['{801EBDAC-4A90-40FC-93C1-4DFD15FED810}']
                                        end;
                                        AVAssetDownloadTask = interface
                                        (NSURLSessionTask)
                                        ['{2DDE7EBC-DDE5-4A00-AE9E-2CC212EE8C3A}']
                                        function URLAsset: AVURLAsset;
                                        cdecl;
                                        function destinationURL: NSURL; cdecl;
                                        function options: NSDictionary; cdecl;
                                        function loadedTimeRanges
                                        : NSArray; cdecl;
                                        end;

                                        TAVAssetDownloadTask = class
                                        (TOCGenericImport<
                                        AVAssetDownloadTaskClass,
                                        AVAssetDownloadTask>)
                                        end;
                                        PAVAssetDownloadTask = Pointer;

                                        AVAssetDownloadURLSessionClass =
                                        interface(NSURLSessionClass)
                                        ['{2F8AA66D-65E1-4B19-8A1C-DEFD053D5874}']
                                        { class } function
                                        sessionWithConfiguration
                                        (configuration
                                        : NSURLSessionConfiguration;
                                        assetDownloadDelegate: Pointer;
                                        delegateQueue: NSOperationQueue)
                                        : AVAssetDownloadURLSession;
                                        cdecl;
                                        end;
                                        AVAssetDownloadURLSession = interface
                                        (NSURLSession)
                                        ['{0455D3A1-A2D0-4A7E-B74D-A89CF3516C0B}']
                                        function assetDownloadTaskWithURLAsset
                                        (URLAsset: AVURLAsset;
                                        destinationURL: NSURL;
                                        options: NSDictionary)
                                        : AVAssetDownloadTask;
                                        cdecl;
                                        end;

                                        TAVAssetDownloadURLSession = class
                                        (TOCGenericImport<
                                        AVAssetDownloadURLSessionClass,
                                        AVAssetDownloadURLSession>)
                                        end;
                                        PAVAssetDownloadURLSession = Pointer;

                                        AVAudioMixClass = interface
                                        (NSObjectClass)
                                        ['{6CC5F698-4A3A-4893-A115-E1109A2D431E}']
                                        end;
                                        AVAudioMix = interface(NSObject)
                                        ['{B19EC0C4-5761-43AD-8DB4-58B6D7A9D4B4}']
                                        function inputParameters: NSArray;
                                        cdecl;
                                        end;

                                        TAVAudioMix = class
                                        (TOCGenericImport<AVAudioMixClass,
                                        AVAudioMix>)
                                        end;
                                        PAVAudioMix = Pointer;

                                        AVVideoCompositionClass = interface
                                        (NSObjectClass)
                                        ['{E6754CB1-171F-4B68-8084-31A0B0090555}']
                                        { class } function
                                        videoCompositionWithPropertiesOfAsset
                                        (asset: AVAsset): AVVideoComposition;
                                        cdecl;
                                        { class } function
                                        videoCompositionWithAsset
                                        (asset: AVAsset;
                                        applyingCIFiltersWithHandler
                                        : TAVFoundationApplyingCIFiltersWithHandler)
                                        : AVVideoComposition; cdecl;
                                        end;
                                        AVVideoComposition = interface(NSObject)
                                        ['{DB7C36B6-7BAD-4C2D-99B9-00359070B502}']
                                        function customVideoCompositorClass
                                        : Pointer;
                                        cdecl;
                                        function frameDuration: CMTime; cdecl;
                                        function renderSize: CGSize; cdecl;
                                        function renderScale: Single; cdecl;
                                        function instructions: NSArray; cdecl;
                                        function animationTool
                                        : AVVideoCompositionCoreAnimationTool;
                                        cdecl;
                                        function isValidForAsset(asset: AVAsset;
                                        timeRange: CMTimeRange;
                                        validationDelegate: Pointer)
                                        : Boolean; cdecl;
                                        end;

                                        TAVVideoComposition = class
                                        (TOCGenericImport<
                                        AVVideoCompositionClass,
                                        AVVideoComposition>)
                                        end;
                                        PAVVideoComposition = Pointer;

                                        AVMetadataItemFilterClass = interface
                                        (NSObjectClass)
                                        ['{0FBABCA7-0A62-4891-80AA-2B1DB78C8A5F}']
                                        { class } function
                                        metadataItemFilterForSharing
                                        : AVMetadataItemFilter;
                                        cdecl;
                                        end;
                                        AVMetadataItemFilter = interface
                                        (NSObject)
                                        ['{6A8AC12F-E9B1-4A09-8144-5871F01A50F9}']
                                        end;

                                    TAVMetadataItemFilter = class
                                      (TOCGenericImport<
                                      AVMetadataItemFilterClass,
                                      AVMetadataItemFilter>)
                                    end;
                                PAVMetadataItemFilter = Pointer;

                                AVAssetExportSessionClass = interface
                                  (NSObjectClass)
                                  ['{CF301246-A9BE-400C-98AA-3DDC2E3AD2F5}']
                                { class } function exportSessionWithAsset
                                  (asset: AVAsset; presetName: NSString)
                                  : Pointer { instancetype };
                                cdecl;
                                { class } function allExportPresets
                                    : NSArray; cdecl;
                                  { class } function
                                      exportPresetsCompatibleWithAsset
                                      (asset: AVAsset): NSArray; cdecl;
                                    { class } procedure
                                        determineCompatibilityOfExportPreset
                                        (presetName: NSString;
                                        withAsset: AVAsset;
                                        outputFileType: NSString;
                                        completionHandler
                                        : TAVFoundationCompletionHandler1);
                                        cdecl;
                                      end;
                                  AVAssetExportSession = interface(NSObject)
                                    ['{DEC7739F-BB91-4961-8712-0DAD6B8D9650}']
                                  function initWithAsset(asset: AVAsset;
                                    presetName: NSString)
                                    : Pointer { instancetype };
                                  cdecl;
                                    function presetName: NSString; cdecl;
                                      function asset: AVAsset; cdecl;
                                        procedure setOutputFileType
                                        (outputFileType: NSString); cdecl;
                                        function outputFileType
                                        : NSString; cdecl;
                                        procedure setOutputURL
                                        (outputURL: NSURL); cdecl;
                                        function outputURL: NSURL; cdecl;
                                        procedure setShouldOptimizeForNetworkUse
                                        (shouldOptimizeForNetworkUse
                                        : Boolean); cdecl;
                                        function shouldOptimizeForNetworkUse
                                        : Boolean; cdecl;
                                        function status
                                        : AVAssetExportSessionStatus; cdecl;
                                        function error: NSError; cdecl;
                                        procedure exportAsynchronouslyWithCompletionHandler
                                        (handler: TAVFoundationCompletionHandler);
                                        cdecl;
                                        function progress: Single; cdecl;
                                        procedure cancelExport; cdecl;
                                        function supportedFileTypes
                                        : NSArray; cdecl;
                                        procedure determineCompatibleFileTypesWithCompletionHandler
                                        (handler: TAVFoundationHandler); cdecl;
                                        procedure setTimeRange
                                        (timeRange: CMTimeRange); cdecl;
                                        function timeRange: CMTimeRange; cdecl;
                                        function maxDuration: CMTime; cdecl;
                                        function estimatedOutputFileLength
                                        : Int64; cdecl;
                                        procedure setFileLengthLimit
                                        (fileLengthLimit: Int64); cdecl;
                                        function fileLengthLimit: Int64; cdecl;
                                        procedure setMetadata
                                        (metadata: NSArray); cdecl;
                                        function metadata: NSArray; cdecl;
                                        procedure setMetadataItemFilter
                                        (metadataItemFilter
                                        : AVMetadataItemFilter); cdecl;
                                        function metadataItemFilter
                                        : AVMetadataItemFilter; cdecl;
                                        procedure setAudioTimePitchAlgorithm
                                        (audioTimePitchAlgorithm
                                        : NSString); cdecl;
                                        function audioTimePitchAlgorithm
                                        : NSString; cdecl;
                                        procedure setAudioMix
                                        (audioMix: AVAudioMix); cdecl;
                                        function audioMix: AVAudioMix; cdecl;
                                        procedure setVideoComposition
                                        (videoComposition
                                        : AVVideoComposition); cdecl;
                                        function videoComposition
                                        : AVVideoComposition; cdecl;
                                        function customVideoCompositor
                                        : Pointer; cdecl;
                                        procedure setCanPerformMultiplePassesOverSourceMediaData
                                        (canPerformMultiplePassesOverSourceMediaData
                                        : Boolean); cdecl;
                                        function canPerformMultiplePassesOverSourceMediaData
                                        : Boolean; cdecl;
                                        procedure setDirectoryForTemporaryFiles
                                        (directoryForTemporaryFiles
                                        : NSURL); cdecl;
                                        function directoryForTemporaryFiles
                                        : NSURL; cdecl;
                                        end;

                                        TAVAssetExportSession = class
                                        (TOCGenericImport<
                                        AVAssetExportSessionClass,
                                        AVAssetExportSession>)
                                        end;
                                        PAVAssetExportSession = Pointer;

                                        AVAssetImageGeneratorClass = interface
                                        (NSObjectClass)
                                        ['{D44F5A07-3F5C-4D78-A280-49DF002A21D9}']
                                        { class } function
                                        assetImageGeneratorWithAsset
                                        (asset: AVAsset)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVAssetImageGenerator = interface
                                        (NSObject)
                                        ['{5B6E535C-14B2-481A-9F11-931B6E58BFFF}']
                                        function asset: AVAsset;
                                        cdecl;
                                        procedure setAppliesPreferredTrackTransform
                                        (appliesPreferredTrackTransform
                                        : Boolean); cdecl;
                                        function appliesPreferredTrackTransform
                                        : Boolean; cdecl;
                                        procedure setMaximumSize
                                        (maximumSize: CGSize); cdecl;
                                        function maximumSize: CGSize; cdecl;
                                        procedure setApertureMode
                                        (apertureMode: NSString); cdecl;
                                        function apertureMode: NSString; cdecl;
                                        procedure setVideoComposition
                                        (videoComposition
                                        : AVVideoComposition); cdecl;
                                        function videoComposition
                                        : AVVideoComposition; cdecl;
                                        function customVideoCompositor
                                        : Pointer; cdecl;
                                        procedure setRequestedTimeToleranceBefore
                                        (requestedTimeToleranceBefore
                                        : CMTime); cdecl;
                                        function requestedTimeToleranceBefore
                                        : CMTime; cdecl;
                                        procedure setRequestedTimeToleranceAfter
                                        (requestedTimeToleranceAfter
                                        : CMTime); cdecl;
                                        function requestedTimeToleranceAfter
                                        : CMTime; cdecl;
                                        function initWithAsset(asset: AVAsset)
                                        : Pointer { instancetype }; cdecl;
                                        function copyCGImageAtTime
                                        (requestedTime: CMTime;
                                        actualTime: Pointer; error: NSError)
                                        : CGImageRef; cdecl;
                                        procedure generateCGImagesAsynchronouslyForTimes
                                        (requestedTimes: NSArray;
                                        completionHandler
                                        : AVAssetImageGeneratorCompletionHandler);
                                        cdecl;
                                        procedure cancelAllCGImageGeneration;
                                        cdecl;
                                        end;

                                        TAVAssetImageGenerator = class
                                        (TOCGenericImport<
                                        AVAssetImageGeneratorClass,
                                        AVAssetImageGenerator>)
                                        end;
                                        PAVAssetImageGenerator = Pointer;

                                        AVAssetReaderOutputClass = interface
                                        (NSObjectClass)
                                        ['{D4F6F1EF-5761-4331-87A0-6EB20CF5F5E3}']
                                        end;
                                        AVAssetReaderOutput = interface
                                        (NSObject)
                                        ['{FFA37A60-5A5D-4132-A62D-88DD0748280A}']
                                        function mediaType: NSString;
                                        cdecl;
                                        procedure setAlwaysCopiesSampleData
                                        (alwaysCopiesSampleData
                                        : Boolean); cdecl;
                                        function alwaysCopiesSampleData
                                        : Boolean; cdecl;
                                        function copyNextSampleBuffer
                                        : CMSampleBufferRef; cdecl;
                                        procedure setSupportsRandomAccess
                                        (supportsRandomAccess: Boolean); cdecl;
                                        function supportsRandomAccess
                                        : Boolean; cdecl;
                                        procedure resetForReadingTimeRanges
                                        (timeRanges: NSArray); cdecl;
                                        procedure markConfigurationAsFinal;
                                        cdecl;
                                        end;

                                        TAVAssetReaderOutput = class
                                        (TOCGenericImport<
                                        AVAssetReaderOutputClass,
                                        AVAssetReaderOutput>)
                                        end;
                                        PAVAssetReaderOutput = Pointer;

                                        AVAssetReaderClass = interface
                                        (NSObjectClass)
                                        ['{1E2E59B9-005E-4166-A9A2-3D5155E700F3}']
                                        { class } function assetReaderWithAsset
                                        (asset: AVAsset; error: NSError)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVAssetReader = interface(NSObject)
                                        ['{49211EB5-2A86-4CBC-8FE7-0D7A6D764F50}']
                                        function initWithAsset(asset: AVAsset;
                                        error: NSError)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function asset: AVAsset; cdecl;
                                        function status
                                        : AVAssetReaderStatus; cdecl;
                                        function error: NSError; cdecl;
                                        procedure setTimeRange
                                        (timeRange: CMTimeRange); cdecl;
                                        function timeRange: CMTimeRange; cdecl;
                                        function outputs: NSArray; cdecl;
                                        function canAddOutput
                                        (output: AVAssetReaderOutput)
                                        : Boolean; cdecl;
                                        procedure addOutput
                                        (output: AVAssetReaderOutput); cdecl;
                                        function startReading: Boolean; cdecl;
                                        procedure cancelReading; cdecl;
                                        end;

                                        TAVAssetReader = class
                                        (TOCGenericImport<AVAssetReaderClass,
                                        AVAssetReader>)
                                        end;
                                        PAVAssetReader = Pointer;

                                        AVAsynchronousVideoCompositionRequestClass =
                                        interface(NSObjectClass)
                                        ['{D6DB93CC-8FCE-4E1F-BA00-0E9507782EB4}']
                                        end;
                                        AVAsynchronousVideoCompositionRequest =
                                        interface(NSObject)
                                        ['{848337A4-F995-43A0-BFC1-4C3EFF6916A9}']
                                        function renderContext
                                        : AVVideoCompositionRenderContext;
                                        cdecl;
                                        function compositionTime: CMTime; cdecl;
                                        function sourceTrackIDs: NSArray; cdecl;
                                        function videoCompositionInstruction
                                        : Pointer; cdecl;
                                        function sourceFrameByTrackID
                                        (trackID: CMPersistentTrackID)
                                        : CVPixelBufferRef; cdecl;
                                        procedure finishWithComposedVideoFrame
                                        (composedVideoFrame
                                        : CVPixelBufferRef); cdecl;
                                        procedure finishWithError
                                        (error: NSError); cdecl;
                                        procedure finishCancelledRequest; cdecl;
                                        end;

                                        TAVAsynchronousVideoCompositionRequest =
                                        class(TOCGenericImport<
                                        AVAsynchronousVideoCompositionRequestClass,
                                        AVAsynchronousVideoCompositionRequest>)
                                        end;
                                        PAVAsynchronousVideoCompositionRequest =
                                        Pointer;

                                        AVVideoCompositionRenderContextClass =
                                        interface(NSObjectClass)
                                        ['{C3F4CEBC-E301-4F3E-84BC-2E22487E2ADF}']
                                        end;
                                        AVVideoCompositionRenderContext =
                                        interface(NSObject)
                                        ['{E70716F9-D64A-43A9-88CF-C3729F52C3B5}']
                                        function size: CGSize;
                                        cdecl;
                                        function renderTransform
                                        : CGAffineTransform; cdecl;
                                        function renderScale: Single; cdecl;
                                        function pixelAspectRatio
                                        : AVPixelAspectRatio; cdecl;
                                        function edgeWidths
                                        : AVEdgeWidths; cdecl;
                                        function highQualityRendering
                                        : Boolean; cdecl;
                                        function videoComposition
                                        : AVVideoComposition; cdecl;
                                        function newPixelBuffer
                                        : CVPixelBufferRef; cdecl;
                                        end;

                                        TAVVideoCompositionRenderContext = class
                                        (TOCGenericImport<
                                        AVVideoCompositionRenderContextClass,
                                        AVVideoCompositionRenderContext>)
                                        end;
                                        PAVVideoCompositionRenderContext =
                                        Pointer;

                                        AVAsynchronousCIImageFilteringRequestClass =
                                        interface(NSObjectClass)
                                        ['{66DAFE8D-1BD6-4497-AF26-C8E9DB85517B}']
                                        end;
                                        AVAsynchronousCIImageFilteringRequest =
                                        interface(NSObject)
                                        ['{34ED2646-7CAB-4231-9653-7E6B37C2B387}']
                                        function renderSize: CGSize;
                                        cdecl;
                                        function compositionTime: CMTime; cdecl;
                                        function sourceImage: CIImage; cdecl;
                                        procedure finishWithImage
                                        (filteredImage: CIImage;
                                        context: CIContext); cdecl;
                                        procedure finishWithError
                                        (error: NSError); cdecl;
                                        end;

                                        TAVAsynchronousCIImageFilteringRequest =
                                        class(TOCGenericImport<
                                        AVAsynchronousCIImageFilteringRequestClass,
                                        AVAsynchronousCIImageFilteringRequest>)
                                        end;
                                        PAVAsynchronousCIImageFilteringRequest =
                                        Pointer;

                                        AVVideoCompositionCoreAnimationToolClass =
                                        interface(NSObjectClass)
                                        ['{F761B3A2-FC0B-42F3-9295-AA536FE32DC7}']
                                        { class } function
                                        videoCompositionCoreAnimationToolWithAdditionalLayer
                                        (layer: CALayer;
                                        asTrackID: CMPersistentTrackID)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer
                                        (videoLayer: CALayer; inLayer: CALayer)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function
                                        videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayers
                                        (videoLayers: NSArray; inLayer: CALayer)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        AVVideoCompositionCoreAnimationTool =
                                        interface(NSObject)
                                        ['{6878C862-E709-4DDC-B4CC-A9EFEC518DE9}']
                                        end;

                                        TAVVideoCompositionCoreAnimationTool =
                                        class(TOCGenericImport<
                                        AVVideoCompositionCoreAnimationToolClass,
                                        AVVideoCompositionCoreAnimationTool>)
                                        end;
                                        PAVVideoCompositionCoreAnimationTool =
                                        Pointer;

                                        AVVideoCompositionLayerInstructionClass =
                                        interface(NSObjectClass)
                                        ['{871C27EA-86B9-43BF-8ADE-9968F6D1D2BA}']
                                        end;
                                        AVVideoCompositionLayerInstruction =
                                        interface(NSObject)
                                        ['{5DD8D666-77F3-45CF-8CBB-7A416FBFF7A5}']
                                        function trackID: CMPersistentTrackID;
                                        cdecl;
                                        function getTransformRampForTime
                                        (time: CMTime; startTransform: Pointer;
                                        endTransform: Pointer;
                                        timeRange: Pointer): Boolean; cdecl;
                                        function getOpacityRampForTime
                                        (time: CMTime; startOpacity: PSingle;
                                        endOpacity: PSingle; timeRange: Pointer)
                                        : Boolean; cdecl;
                                        function getCropRectangleRampForTime
                                        (time: CMTime;
                                        startCropRectangle: Pointer;
                                        endCropRectangle: Pointer;
                                        timeRange: Pointer): Boolean; cdecl;
                                        end;

                                        TAVVideoCompositionLayerInstruction =
                                        class(TOCGenericImport<
                                        AVVideoCompositionLayerInstructionClass,
                                        AVVideoCompositionLayerInstruction>)
                                        end;
                                        PAVVideoCompositionLayerInstruction =
                                        Pointer;

                                        AVVideoCompositionInstruction =
                                        interface(IObjectiveC)
                                        ['{DEB7DEA4-F49B-4EA7-AE4B-7C7E5FA2989F}']
                                        function timeRange: CMTimeRange;
                                        cdecl;
                                        function enablePostProcessing
                                        : Boolean; cdecl;
                                        function containsTweening
                                        : Boolean; cdecl;
                                        function requiredSourceTrackIDs
                                        : NSArray; cdecl;
                                        function passthroughTrackID
                                        : CMPersistentTrackID; cdecl;
                                        function backgroundColor
                                        : CGColorRef; cdecl;
                                        function layerInstructions
                                        : NSArray; cdecl;
                                        end;

                                        AVMutableVideoCompositionClass =
                                        interface(AVVideoCompositionClass)
                                        ['{BCFBEAEF-026E-44C8-BCEA-C8395D72DD44}']
                                        { class } function videoComposition
                                        : AVMutableVideoComposition;
                                        cdecl;
                                        { class } function
                                        videoCompositionWithPropertiesOfAsset
                                        (asset: AVAsset)
                                        : AVMutableVideoComposition; cdecl;
                                        { class } function
                                        videoCompositionWithAsset
                                        (asset: AVAsset;
                                        applyingCIFiltersWithHandler
                                        : TAVFoundationApplyingCIFiltersWithHandler)
                                        : AVMutableVideoComposition; cdecl;
                                        end;
                                        AVMutableVideoComposition = interface
                                        (AVVideoComposition)
                                        ['{7DC4CC86-7B17-4824-8A14-F38FE61143DE}']
                                        procedure setCustomVideoCompositorClass
                                        (customVideoCompositorClass: Pointer);
                                        cdecl;
                                        function customVideoCompositorClass
                                        : Pointer; cdecl;
                                        procedure setFrameDuration
                                        (frameDuration: CMTime); cdecl;
                                        function frameDuration: CMTime; cdecl;
                                        procedure setRenderSize
                                        (renderSize: CGSize); cdecl;
                                        function renderSize: CGSize; cdecl;
                                        procedure setRenderScale
                                        (renderScale: Single); cdecl;
                                        function renderScale: Single; cdecl;
                                        procedure setInstructions
                                        (instructions: NSArray); cdecl;
                                        function instructions: NSArray; cdecl;
                                        procedure setAnimationTool
                                        (animationTool
                                        : AVVideoCompositionCoreAnimationTool);
                                        cdecl;
                                        function animationTool
                                        : AVVideoCompositionCoreAnimationTool;
                                        cdecl;
                                        end;

                                        TAVMutableVideoComposition = class
                                        (TOCGenericImport<
                                        AVMutableVideoCompositionClass,
                                        AVMutableVideoComposition>)
                                        end;
                                        PAVMutableVideoComposition = Pointer;

                                        AVMutableVideoCompositionInstructionClass =
                                        interface(
                                        AVVideoCompositionInstructionClass)
                                        ['{20D77116-D54D-43E8-8688-0B490927E786}']
                                        { class } function
                                        videoCompositionInstruction
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVMutableVideoCompositionInstruction =
                                        interface(AVVideoCompositionInstruction)
                                        ['{93356AC6-75C0-4BAA-808F-C6685A7A7E59}']
                                        procedure setTimeRange
                                        (timeRange: CMTimeRange);
                                        cdecl;
                                        function timeRange: CMTimeRange; cdecl;
                                        procedure setBackgroundColor
                                        (backgroundColor: CGColorRef); cdecl;
                                        function backgroundColor
                                        : CGColorRef; cdecl;
                                        procedure setLayerInstructions
                                        (layerInstructions: NSArray); cdecl;
                                        function layerInstructions
                                        : NSArray; cdecl;
                                        procedure setEnablePostProcessing
                                        (enablePostProcessing: Boolean); cdecl;
                                        function enablePostProcessing
                                        : Boolean; cdecl;
                                        end;

                                        TAVMutableVideoCompositionInstruction =
                                        class(TOCGenericImport<
                                        AVMutableVideoCompositionInstructionClass,
                                        AVMutableVideoCompositionInstruction>)
                                        end;
                                        PAVMutableVideoCompositionInstruction =
                                        Pointer;

                                        AVMutableVideoCompositionLayerInstructionClass =
                                        interface(
                                        AVVideoCompositionLayerInstructionClass)
                                        ['{A8814CBD-8319-4FF7-8504-D8C1B34F77E0}']
                                        { class } function
                                        videoCompositionLayerInstructionWithAssetTrack
                                        (track: AVAssetTrack)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        videoCompositionLayerInstruction
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        AVMutableVideoCompositionLayerInstruction =
                                        interface(
                                        AVVideoCompositionLayerInstruction)
                                        ['{6C92646E-6948-4DE8-9C6B-FAF25FCED442}']
                                        procedure setTrackID
                                        (trackID: CMPersistentTrackID);
                                        cdecl;
                                        function trackID
                                        : CMPersistentTrackID; cdecl;
                                        procedure setTransformRampFromStartTransform
                                        (startTransform: CGAffineTransform;
                                        toEndTransform: CGAffineTransform;
                                        timeRange: CMTimeRange); cdecl;
                                        procedure setTransform
                                        (transform: CGAffineTransform;
                                        atTime: CMTime); cdecl;
                                        procedure setOpacityRampFromStartOpacity
                                        (startOpacity: Single;
                                        toEndOpacity: Single;
                                        timeRange: CMTimeRange); cdecl;
                                        procedure setOpacity(opacity: Single;
                                        atTime: CMTime); cdecl;
                                        procedure setCropRectangleRampFromStartCropRectangle
                                        (startCropRectangle: CGRect;
                                        toEndCropRectangle: CGRect;
                                        timeRange: CMTimeRange); cdecl;
                                        procedure setCropRectangle
                                        (cropRectangle: CGRect;
                                        atTime: CMTime); cdecl;
                                        end;

                                        TAVMutableVideoCompositionLayerInstruction =
                                        class(TOCGenericImport<
                                        AVMutableVideoCompositionLayerInstructionClass,
                                        AVMutableVideoCompositionLayerInstruction>)
                                        end;
                                        PAVMutableVideoCompositionLayerInstruction =
                                        Pointer;

                                        AVAudioMixInputParametersClass =
                                        interface(NSObjectClass)
                                        ['{D74F45F0-EA84-49A2-A000-DF68E0E61B4A}']
                                        end;
                                        AVAudioMixInputParameters = interface
                                        (NSObject)
                                        ['{0D6AEB6B-DDE4-4FF0-80AC-00D95FBB1A9E}']
                                        function trackID: CMPersistentTrackID;
                                        cdecl;
                                        function audioTimePitchAlgorithm
                                        : NSString; cdecl;
                                        function audioTapProcessor
                                        : MTAudioProcessingTapRef; cdecl;
                                        function getVolumeRampForTime
                                        (time: CMTime; startVolume: PSingle;
                                        endVolume: PSingle; timeRange: Pointer)
                                        : Boolean; cdecl;
                                        end;

                                        TAVAudioMixInputParameters = class
                                        (TOCGenericImport<
                                        AVAudioMixInputParametersClass,
                                        AVAudioMixInputParameters>)
                                        end;
                                        PAVAudioMixInputParameters = Pointer;

                                        AVAssetReaderTrackOutputClass =
                                        interface(AVAssetReaderOutputClass)
                                        ['{00AD80BA-E8E1-4B19-B74A-528CD9D55489}']
                                        { class } function
                                        assetReaderTrackOutputWithTrack
                                        (track: AVAssetTrack;
                                        outputSettings: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVAssetReaderTrackOutput = interface
                                        (AVAssetReaderOutput)
                                        ['{9AA0F0CD-8104-46F8-88CA-7F748E9529CB}']
                                        function initWithTrack
                                        (track: AVAssetTrack;
                                        outputSettings: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function track: AVAssetTrack; cdecl;
                                        function outputSettings
                                        : NSDictionary; cdecl;
                                        procedure setAudioTimePitchAlgorithm
                                        (audioTimePitchAlgorithm
                                        : NSString); cdecl;
                                        function audioTimePitchAlgorithm
                                        : NSString; cdecl;
                                        end;

                                        TAVAssetReaderTrackOutput = class
                                        (TOCGenericImport<
                                        AVAssetReaderTrackOutputClass,
                                        AVAssetReaderTrackOutput>)
                                        end;
                                        PAVAssetReaderTrackOutput = Pointer;

                                        AVAssetReaderAudioMixOutputClass =
                                        interface(AVAssetReaderOutputClass)
                                        ['{4080933D-FF6C-4CCD-B5C2-877C19F4A62E}']
                                        { class } function
                                        assetReaderAudioMixOutputWithAudioTracks
                                        (audioTracks: NSArray;
                                        audioSettings: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVAssetReaderAudioMixOutput = interface
                                        (AVAssetReaderOutput)
                                        ['{AADB8382-1709-4452-A82C-32D042CDCD8A}']
                                        function initWithAudioTracks
                                        (audioTracks: NSArray;
                                        audioSettings: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function audioTracks: NSArray; cdecl;
                                        function audioSettings
                                        : NSDictionary; cdecl;
                                        procedure setAudioMix
                                        (audioMix: AVAudioMix); cdecl;
                                        function audioMix: AVAudioMix; cdecl;
                                        procedure setAudioTimePitchAlgorithm
                                        (audioTimePitchAlgorithm
                                        : NSString); cdecl;
                                        function audioTimePitchAlgorithm
                                        : NSString; cdecl;
                                        end;

                                        TAVAssetReaderAudioMixOutput = class
                                        (TOCGenericImport<
                                        AVAssetReaderAudioMixOutputClass,
                                        AVAssetReaderAudioMixOutput>)
                                        end;
                                        PAVAssetReaderAudioMixOutput = Pointer;

                                        AVAssetReaderVideoCompositionOutputClass =
                                        interface(AVAssetReaderOutputClass)
                                        ['{3C8AF630-14BE-4FEE-87F7-DE5DD538D25D}']
                                        { class } function
                                        assetReaderVideoCompositionOutputWithVideoTracks
                                        (videoTracks: NSArray;
                                        videoSettings: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVAssetReaderVideoCompositionOutput =
                                        interface(AVAssetReaderOutput)
                                        ['{513F7F26-889C-420A-82C1-AA67765B34B6}']
                                        function initWithVideoTracks
                                        (videoTracks: NSArray;
                                        videoSettings: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function videoTracks: NSArray; cdecl;
                                        function videoSettings
                                        : NSDictionary; cdecl;
                                        procedure setVideoComposition
                                        (videoComposition
                                        : AVVideoComposition); cdecl;
                                        function videoComposition
                                        : AVVideoComposition; cdecl;
                                        function customVideoCompositor
                                        : Pointer; cdecl;
                                        end;

                                        TAVAssetReaderVideoCompositionOutput =
                                        class(TOCGenericImport<
                                        AVAssetReaderVideoCompositionOutputClass,
                                        AVAssetReaderVideoCompositionOutput>)
                                        end;
                                        PAVAssetReaderVideoCompositionOutput =
                                        Pointer;

                                        AVAssetReaderOutputMetadataAdaptorClass =
                                        interface(NSObjectClass)
                                        ['{22E3833F-C1D0-4E7A-BC37-75BCA45AE5E6}']
                                        { class } function
                                        assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput
                                        (trackOutput: AVAssetReaderTrackOutput)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVAssetReaderOutputMetadataAdaptor =
                                        interface(NSObject)
                                        ['{A233F753-5B31-4DA6-8E43-B6922B7663BB}']
                                        function initWithAssetReaderTrackOutput
                                        (trackOutput: AVAssetReaderTrackOutput)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function assetReaderTrackOutput
                                        : AVAssetReaderTrackOutput; cdecl;
                                        function nextTimedMetadataGroup
                                        : AVTimedMetadataGroup; cdecl;
                                        end;

                                        TAVAssetReaderOutputMetadataAdaptor =
                                        class(TOCGenericImport<
                                        AVAssetReaderOutputMetadataAdaptorClass,
                                        AVAssetReaderOutputMetadataAdaptor>)
                                        end;
                                        PAVAssetReaderOutputMetadataAdaptor =
                                        Pointer;

                                        AVAssetReaderSampleReferenceOutputClass =
                                        interface(AVAssetReaderOutputClass)
                                        ['{A9BF538B-57CE-444F-8121-4DBDF5CF5042}']
                                        { class } function
                                        assetReaderSampleReferenceOutputWithTrack
                                        (track: AVAssetTrack)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVAssetReaderSampleReferenceOutput =
                                        interface(AVAssetReaderOutput)
                                        ['{5C844AA6-49BD-41D8-BB76-C8369D5EAD6B}']
                                        function initWithTrack
                                        (track: AVAssetTrack)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function track: AVAssetTrack; cdecl;
                                        end;

                                        TAVAssetReaderSampleReferenceOutput =
                                        class(TOCGenericImport<
                                        AVAssetReaderSampleReferenceOutputClass,
                                        AVAssetReaderSampleReferenceOutput>)
                                        end;
                                        PAVAssetReaderSampleReferenceOutput =
                                        Pointer;

                                        AVAssetResourceLoadingRequestClass =
                                        interface(NSObjectClass)
                                        ['{B4093574-7153-4CD3-8A17-5DDA06DB192E}']
                                        end;
                                        AVAssetResourceLoadingRequest =
                                        interface(NSObject)
                                        ['{642457C7-D67C-495C-A6AD-0668BF042506}']
                                        function request: NSURLRequest;
                                        cdecl;
                                        function isFinished: Boolean; cdecl;
                                        function isCancelled: Boolean; cdecl;
                                        function contentInformationRequest
                                        : AVAssetResourceLoadingContentInformationRequest;
                                        cdecl;
                                        function dataRequest
                                        : AVAssetResourceLoadingDataRequest;
                                        cdecl;
                                        procedure setResponse
                                        (response: NSURLResponse); cdecl;
                                        function response: NSURLResponse; cdecl;
                                        procedure setRedirect
                                        (redirect: NSURLRequest); cdecl;
                                        function redirect: NSURLRequest; cdecl;
                                        procedure finishLoading; cdecl;
                                        procedure finishLoadingWithError
                                        (error: NSError); cdecl;
                                        function streamingContentKeyRequestDataForApp
                                        (appIdentifier: NSData;
                                        contentIdentifier: NSData;
                                        options: NSDictionary; error: NSError)
                                        : NSData; cdecl;
                                        function persistentContentKeyFromKeyVendorResponse
                                        (keyVendorResponse: NSData;
                                        options: NSDictionary; error: NSError)
                                        : NSData; cdecl;
                                        procedure finishLoadingWithResponse
                                        (response: NSURLResponse; data: NSData;
                                        redirect: NSURLRequest); cdecl;
                                        end;

                                        TAVAssetResourceLoadingRequest = class
                                        (TOCGenericImport<
                                        AVAssetResourceLoadingRequestClass,
                                        AVAssetResourceLoadingRequest>)
                                        end;
                                        PAVAssetResourceLoadingRequest =
                                        Pointer;

                                        AVAssetResourceRenewalRequestClass =
                                        interface(
                                        AVAssetResourceLoadingRequestClass)
                                        ['{5A94FA8B-253D-4B09-B3BF-D35CF4337845}']
                                        end;
                                        AVAssetResourceRenewalRequest =
                                        interface(AVAssetResourceLoadingRequest)
                                        ['{528A9828-4B91-4F34-8E8C-C9017ED05AAC}']
                                        end;

                                        TAVAssetResourceRenewalRequest = class
                                        (TOCGenericImport<
                                        AVAssetResourceRenewalRequestClass,
                                        AVAssetResourceRenewalRequest>)
                                        end;
                                        PAVAssetResourceRenewalRequest =
                                        Pointer;

                                        AVAssetResourceLoadingContentInformationRequestClass =
                                        interface(NSObjectClass)
                                        ['{A626C68C-D76D-4B93-8E59-D77BA3F15BB9}']
                                        end;
                                        AVAssetResourceLoadingContentInformationRequest =
                                        interface(NSObject)
                                        ['{EF28E27C-E371-47D0-9A61-F5D58F83E907}']
                                        procedure setContentType
                                        (contentType: NSString);
                                        cdecl;
                                        function contentType: NSString; cdecl;
                                        procedure setContentLength
                                        (contentLength: Int64); cdecl;
                                        function contentLength: Int64; cdecl;
                                        procedure setByteRangeAccessSupported
                                        (byteRangeAccessSupported
                                        : Boolean); cdecl;
                                        function isByteRangeAccessSupported
                                        : Boolean; cdecl;
                                        procedure setRenewalDate
                                        (renewalDate: NSDate); cdecl;
                                        function renewalDate: NSDate; cdecl;
                                        end;

                                        TAVAssetResourceLoadingContentInformationRequest =
                                        class(TOCGenericImport<
                                        AVAssetResourceLoadingContentInformationRequestClass,
                                        AVAssetResourceLoadingContentInformationRequest>)
                                        end;
                                        PAVAssetResourceLoadingContentInformationRequest =
                                        Pointer;

                                        AVAssetResourceLoadingDataRequestClass =
                                        interface(NSObjectClass)
                                        ['{F53A3AC5-E56F-4B89-A1BA-8F5ACF47FA75}']
                                        end;
                                        AVAssetResourceLoadingDataRequest =
                                        interface(NSObject)
                                        ['{177801D5-A10F-4197-BCFA-EA943CF6237F}']
                                        function requestedOffset: Int64;
                                        cdecl;
                                        function requestedLength
                                        : NSInteger; cdecl;
                                        function requestsAllDataToEndOfResource
                                        : Boolean; cdecl;
                                        function currentOffset: Int64; cdecl;
                                        procedure respondWithData
                                        (data: NSData); cdecl;
                                        end;

                                        TAVAssetResourceLoadingDataRequest =
                                        class(TOCGenericImport<
                                        AVAssetResourceLoadingDataRequestClass,
                                        AVAssetResourceLoadingDataRequest>)
                                        end;
                                        PAVAssetResourceLoadingDataRequest =
                                        Pointer;

                                        AVAssetTrackSegmentClass = interface
                                        (NSObjectClass)
                                        ['{5AD8F72F-6DA4-4D50-A889-BDA0369DCF1A}']
                                        end;
                                        AVAssetTrackSegment = interface
                                        (NSObject)
                                        ['{4DD01246-CD0E-4A84-9C8B-25BB52881EF5}']
                                        function timeMapping: CMTimeMapping;
                                        cdecl;
                                        function isEmpty: Boolean; cdecl;
                                        end;

                                        TAVAssetTrackSegment = class
                                        (TOCGenericImport<
                                        AVAssetTrackSegmentClass,
                                        AVAssetTrackSegment>)
                                        end;
                                        PAVAssetTrackSegment = Pointer;

                                        AVAssetWriterInputClass = interface
                                        (NSObjectClass)
                                        ['{CA249957-DF42-4A4C-95E5-26242E9CD1EA}']
                                        [MethodName
                                        ('assetWriterInputWithMediaType:outputSettings:')
                                        ]
                                        { class } function
                                        assetWriterInputWithMediaTypeOutputSettings
                                        (mediaType: NSString;
                                        outputSettings: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('assetWriterInputWithMediaType:outputSettings:sourceFormatHint:')
                                        ]
                                        { class } function
                                        assetWriterInputWithMediaTypeOutputSettingsSourceFormatHint
                                        (mediaType: NSString;
                                        outputSettings: NSDictionary;
                                        sourceFormatHint
                                        : CMFormatDescriptionRef)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        AVAssetWriterInput = interface(NSObject)
                                        ['{76B67F2F-F85A-42DC-B1B1-96A6FA3BCE6E}']
                                        [MethodName
                                        ('initWithMediaType:outputSettings:')]
                                        function initWithMediaTypeOutputSettings
                                        (mediaType: NSString;
                                        outputSettings: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('initWithMediaType:outputSettings:sourceFormatHint:')
                                        ]
                                        function initWithMediaTypeOutputSettingsSourceFormatHint
                                        (mediaType: NSString;
                                        outputSettings: NSDictionary;
                                        sourceFormatHint
                                        : CMFormatDescriptionRef)
                                        : Pointer { instancetype }; cdecl;
                                        function mediaType: NSString; cdecl;
                                        function outputSettings
                                        : NSDictionary; cdecl;
                                        function sourceFormatHint
                                        : CMFormatDescriptionRef; cdecl;
                                        procedure setMetadata
                                        (metadata: NSArray); cdecl;
                                        function metadata: NSArray; cdecl;
                                        function isReadyForMoreMediaData
                                        : Boolean; cdecl;
                                        procedure setExpectsMediaDataInRealTime
                                        (expectsMediaDataInRealTime
                                        : Boolean); cdecl;
                                        function expectsMediaDataInRealTime
                                        : Boolean; cdecl;
                                        procedure requestMediaDataWhenReadyOnQueue
                                        (queue: dispatch_queue_t;
                                        usingBlock
                                        : TAVFoundationCompletionHandler);
                                        cdecl;
                                        function appendSampleBuffer
                                        (sampleBuffer: CMSampleBufferRef)
                                        : Boolean; cdecl;
                                        procedure markAsFinished; cdecl;
                                        procedure setLanguageCode
                                        (languageCode: NSString); cdecl;
                                        function languageCode: NSString; cdecl;
                                        procedure setExtendedLanguageTag
                                        (extendedLanguageTag: NSString); cdecl;
                                        function extendedLanguageTag
                                        : NSString; cdecl;
                                        procedure setNaturalSize
                                        (naturalSize: CGSize); cdecl;
                                        function naturalSize: CGSize; cdecl;
                                        procedure setTransform
                                        (transform: CGAffineTransform); cdecl;
                                        function transform
                                        : CGAffineTransform; cdecl;
                                        procedure setPreferredVolume
                                        (preferredVolume: Single); cdecl;
                                        function preferredVolume: Single; cdecl;
                                        procedure setMarksOutputTrackAsEnabled
                                        (marksOutputTrackAsEnabled
                                        : Boolean); cdecl;
                                        function marksOutputTrackAsEnabled
                                        : Boolean; cdecl;
                                        procedure setMediaTimeScale
                                        (mediaTimeScale: CMTimeScale); cdecl;
                                        function mediaTimeScale
                                        : CMTimeScale; cdecl;
                                        procedure setPreferredMediaChunkDuration
                                        (preferredMediaChunkDuration
                                        : CMTime); cdecl;
                                        function preferredMediaChunkDuration
                                        : CMTime; cdecl;
                                        procedure setPreferredMediaChunkAlignment
                                        (preferredMediaChunkAlignment
                                        : NSInteger); cdecl;
                                        function preferredMediaChunkAlignment
                                        : NSInteger; cdecl;
                                        procedure setSampleReferenceBaseURL
                                        (sampleReferenceBaseURL: NSURL); cdecl;
                                        function sampleReferenceBaseURL
                                        : NSURL; cdecl;
                                        function canAddTrackAssociationWithTrackOfInput
                                        (input: AVAssetWriterInput;
                                        &type: NSString): Boolean; cdecl;
                                        procedure addTrackAssociationWithTrackOfInput
                                        (input: AVAssetWriterInput;
                                        &type: NSString); cdecl;
                                        procedure setPerformsMultiPassEncodingIfSupported
                                        (performsMultiPassEncodingIfSupported
                                        : Boolean); cdecl;
                                        function performsMultiPassEncodingIfSupported
                                        : Boolean; cdecl;
                                        function canPerformMultiplePasses
                                        : Boolean; cdecl;
                                        function currentPassDescription
                                        : AVAssetWriterInputPassDescription;
                                        cdecl;
                                        procedure respondToEachPassDescriptionOnQueue
                                        (queue: dispatch_queue_t;
                                        usingBlock
                                        : Pointer { dispatch_block_t } ); cdecl;
                                        procedure markCurrentPassAsFinished;
                                        cdecl;
                                        end;

                                        TAVAssetWriterInput = class
                                        (TOCGenericImport<
                                        AVAssetWriterInputClass,
                                        AVAssetWriterInput>)
                                        end;
                                        PAVAssetWriterInput = Pointer;

                                        AVAssetWriterClass = interface
                                        (NSObjectClass)
                                        ['{735773CE-400B-4EF3-B9EA-50814FFEA473}']
                                        { class } function assetWriterWithURL
                                        (outputURL: NSURL; fileType: NSString;
                                        error: NSError)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVAssetWriter = interface(NSObject)
                                        ['{F3E3438D-5A2C-4771-A8FF-8A1197052DEA}']
                                        function initWithURL(outputURL: NSURL;
                                        fileType: NSString; error: NSError)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function outputURL: NSURL; cdecl;
                                        function outputFileType
                                        : NSString; cdecl;
                                        function availableMediaTypes
                                        : NSArray; cdecl;
                                        function status
                                        : AVAssetWriterStatus; cdecl;
                                        function error: NSError; cdecl;
                                        procedure setMetadata
                                        (metadata: NSArray); cdecl;
                                        function metadata: NSArray; cdecl;
                                        procedure setShouldOptimizeForNetworkUse
                                        (shouldOptimizeForNetworkUse
                                        : Boolean); cdecl;
                                        function shouldOptimizeForNetworkUse
                                        : Boolean; cdecl;
                                        procedure setDirectoryForTemporaryFiles
                                        (directoryForTemporaryFiles
                                        : NSURL); cdecl;
                                        function directoryForTemporaryFiles
                                        : NSURL; cdecl;
                                        function inputs: NSArray; cdecl;
                                        function canApplyOutputSettings
                                        (outputSettings: NSDictionary;
                                        forMediaType: NSString): Boolean; cdecl;
                                        function canAddInput
                                        (input: AVAssetWriterInput)
                                        : Boolean; cdecl;
                                        procedure addInput
                                        (input: AVAssetWriterInput); cdecl;
                                        function startWriting: Boolean; cdecl;
                                        procedure startSessionAtSourceTime
                                        (startTime: CMTime); cdecl;
                                        procedure endSessionAtSourceTime
                                        (endTime: CMTime); cdecl;
                                        procedure cancelWriting; cdecl;
                                        function finishWriting: Boolean; cdecl;
                                        procedure finishWritingWithCompletionHandler
                                        (handler: TAVFoundationCompletionHandler);
                                        cdecl;
                                        procedure setMovieFragmentInterval
                                        (movieFragmentInterval: CMTime); cdecl;
                                        function movieFragmentInterval
                                        : CMTime; cdecl;
                                        procedure setOverallDurationHint
                                        (overallDurationHint: CMTime); cdecl;
                                        function overallDurationHint
                                        : CMTime; cdecl;
                                        procedure setMovieTimeScale
                                        (movieTimeScale: CMTimeScale); cdecl;
                                        function movieTimeScale
                                        : CMTimeScale; cdecl;
                                        function canAddInputGroup
                                        (inputGroup: AVAssetWriterInputGroup)
                                        : Boolean; cdecl;
                                        procedure addInputGroup
                                        (inputGroup
                                        : AVAssetWriterInputGroup); cdecl;
                                        function inputGroups: NSArray; cdecl;
                                        end;

                                        TAVAssetWriter = class
                                        (TOCGenericImport<AVAssetWriterClass,
                                        AVAssetWriter>)
                                        end;
                                        PAVAssetWriter = Pointer;

                                        AVAssetWriterInputGroupClass = interface
                                        (AVMediaSelectionGroupClass)
                                        ['{970698BD-434F-482D-BA6C-30FA0C42B664}']
                                        { class } function
                                        assetWriterInputGroupWithInputs
                                        (inputs: NSArray;
                                        defaultInput: AVAssetWriterInput)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVAssetWriterInputGroup = interface
                                        (AVMediaSelectionGroup)
                                        ['{9A3491AD-5269-4066-96FD-83855138FF57}']
                                        function initWithInputs(inputs: NSArray;
                                        defaultInput: AVAssetWriterInput)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function inputs: NSArray; cdecl;
                                        function defaultInput
                                        : AVAssetWriterInput; cdecl;
                                        end;

                                        TAVAssetWriterInputGroup = class
                                        (TOCGenericImport<
                                        AVAssetWriterInputGroupClass,
                                        AVAssetWriterInputGroup>)
                                        end;
                                        PAVAssetWriterInputGroup = Pointer;

                                        AVAssetWriterInputPassDescriptionClass =
                                        interface(NSObjectClass)
                                        ['{7040A109-0A8D-43E5-A325-85EFBC19A1DD}']
                                        end;
                                        AVAssetWriterInputPassDescription =
                                        interface(NSObject)
                                        ['{5C0FEE6E-A212-4F61-8CFC-67B94E17CABA}']
                                        function sourceTimeRanges: NSArray;
                                        cdecl;
                                        end;

                                        TAVAssetWriterInputPassDescription =
                                        class(TOCGenericImport<
                                        AVAssetWriterInputPassDescriptionClass,
                                        AVAssetWriterInputPassDescription>)
                                        end;
                                        PAVAssetWriterInputPassDescription =
                                        Pointer;

                                        AVAssetWriterInputPixelBufferAdaptorClass =
                                        interface(NSObjectClass)
                                        ['{2445634D-D715-4F1E-BA3E-993AFB694095}']
                                        { class } function
                                        assetWriterInputPixelBufferAdaptorWithAssetWriterInput
                                        (input: AVAssetWriterInput;
                                        sourcePixelBufferAttributes
                                        : NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVAssetWriterInputPixelBufferAdaptor =
                                        interface(NSObject)
                                        ['{CAAF160A-AC5B-46B2-9647-0B8D3AC0CC42}']
                                        function initWithAssetWriterInput
                                        (input: AVAssetWriterInput;
                                        sourcePixelBufferAttributes
                                        : NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function assetWriterInput
                                        : AVAssetWriterInput; cdecl;
                                        function sourcePixelBufferAttributes
                                        : NSDictionary; cdecl;
                                        function pixelBufferPool
                                        : CVPixelBufferPoolRef; cdecl;
                                        function appendPixelBuffer
                                        (pixelBuffer: CVPixelBufferRef;
                                        withPresentationTime: CMTime)
                                        : Boolean; cdecl;
                                        end;

                                        TAVAssetWriterInputPixelBufferAdaptor =
                                        class(TOCGenericImport<
                                        AVAssetWriterInputPixelBufferAdaptorClass,
                                        AVAssetWriterInputPixelBufferAdaptor>)
                                        end;
                                        PAVAssetWriterInputPixelBufferAdaptor =
                                        Pointer;

                                        AVAssetWriterInputMetadataAdaptorClass =
                                        interface(NSObjectClass)
                                        ['{E90048F5-B267-456A-866D-2DE06E7054BB}']
                                        { class } function
                                        assetWriterInputMetadataAdaptorWithAssetWriterInput
                                        (input: AVAssetWriterInput)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVAssetWriterInputMetadataAdaptor =
                                        interface(NSObject)
                                        ['{73FDC1E8-C358-4B62-8FB7-4EA4436C5BF8}']
                                        function initWithAssetWriterInput
                                        (input: AVAssetWriterInput)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function assetWriterInput
                                        : AVAssetWriterInput; cdecl;
                                        function appendTimedMetadataGroup
                                        (timedMetadataGroup
                                        : AVTimedMetadataGroup): Boolean; cdecl;
                                        end;

                                        TAVAssetWriterInputMetadataAdaptor =
                                        class(TOCGenericImport<
                                        AVAssetWriterInputMetadataAdaptorClass,
                                        AVAssetWriterInputMetadataAdaptor>)
                                        end;
                                        PAVAssetWriterInputMetadataAdaptor =
                                        Pointer;

                                        AVAudioFormatClass = interface
                                        (NSObjectClass)
                                        ['{A62F5834-7F02-4865-B229-C0A80BE13BB6}']
                                        end;
                                        AVAudioFormat = interface(NSObject)
                                        ['{D35BFE42-D340-4761-9D55-0F52117EFF7F}']
                                        [MethodName
                                        ('initWithStreamDescription:')]
                                        function initWithStreamDescription
                                        (asbd: Pointer)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('initWithStreamDescription:channelLayout:')
                                        ]
                                        function initWithStreamDescriptionChannelLayout
                                        (asbd: Pointer;
                                        channelLayout: AVAudioChannelLayout)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initStandardFormatWithSampleRate:channels:')
                                        ]
                                        function initStandardFormatWithSampleRateChannels
                                        (sampleRate: Double;
                                        channels: AVAudioChannelCount)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initStandardFormatWithSampleRate:channelLayout:')
                                        ]
                                        function initStandardFormatWithSampleRateChannelLayout
                                        (sampleRate: Double;
                                        channelLayout: AVAudioChannelLayout)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithCommonFormat:sampleRate:channels:interleaved:')
                                        ]
                                        function initWithCommonFormatSampleRateChannelsInterleaved
                                        (format: AVAudioCommonFormat;
                                        sampleRate: Double;
                                        channels: AVAudioChannelCount;
                                        interleaved: Boolean)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithCommonFormat:sampleRate:interleaved:channelLayout:')
                                        ]
                                        function initWithCommonFormatSampleRateInterleavedChannelLayout
                                        (format: AVAudioCommonFormat;
                                        sampleRate: Double;
                                        interleaved: Boolean;
                                        channelLayout: AVAudioChannelLayout)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithSettings
                                        (settings: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithCMAudioFormatDescription
                                        (formatDescription
                                        : CMAudioFormatDescriptionRef)
                                        : Pointer { instancetype }; cdecl;
                                        function isEqual(&object: Pointer)
                                        : Boolean; cdecl;
                                        function isStandard: Boolean; cdecl;
                                        function commonFormat
                                        : AVAudioCommonFormat; cdecl;
                                        function channelCount
                                        : AVAudioChannelCount; cdecl;
                                        function sampleRate: Double; cdecl;
                                        function isInterleaved: Boolean; cdecl;
                                        function streamDescription
                                        : Pointer; cdecl;
                                        function channelLayout
                                        : AVAudioChannelLayout; cdecl;
                                        function settings: NSDictionary; cdecl;
                                        function formatDescription
                                        : CMAudioFormatDescriptionRef; cdecl;
                                        end;

                                        TAVAudioFormat = class
                                        (TOCGenericImport<AVAudioFormatClass,
                                        AVAudioFormat>)
                                        end;
                                        PAVAudioFormat = Pointer;

                                        AVAudioBufferClass = interface
                                        (NSObjectClass)
                                        ['{B23E8807-33C2-4577-A08D-B64375AA4F18}']
                                        end;
                                        AVAudioBuffer = interface(NSObject)
                                        ['{37B83ED0-5B30-450B-9CF1-9485100697D2}']
                                        function format: AVAudioFormat;
                                        cdecl;
                                        function audioBufferList
                                        : Pointer; cdecl;
                                        function mutableAudioBufferList
                                        : Pointer; cdecl;
                                        end;

                                        TAVAudioBuffer = class
                                        (TOCGenericImport<AVAudioBufferClass,
                                        AVAudioBuffer>)
                                        end;
                                        PAVAudioBuffer = Pointer;

                                        AVAudioPCMBufferClass = interface
                                        (AVAudioBufferClass)
                                        ['{34A2F787-5D22-4A55-A107-7BE9A891E398}']
                                        end;
                                        AVAudioPCMBuffer = interface
                                        (AVAudioBuffer)
                                        ['{3A12D462-6093-4036-9C39-871D8BFE85B0}']
                                        function initWithPCMFormat
                                        (format: AVAudioFormat;
                                        frameCapacity: AVAudioFrameCount)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function frameCapacity
                                        : AVAudioFrameCount; cdecl;
                                        procedure setFrameLength
                                        (frameLength: AVAudioFrameCount); cdecl;
                                        function frameLength
                                        : AVAudioFrameCount; cdecl;
                                        function stride: NSUInteger; cdecl;
                                        function floatChannelData
                                        : PSingle; cdecl;
                                        function int16ChannelData
                                        : PSmallInt; cdecl;
                                        function int32ChannelData
                                        : PInt32; cdecl;
                                        end;

                                        TAVAudioPCMBuffer = class
                                        (TOCGenericImport<AVAudioPCMBufferClass,
                                        AVAudioPCMBuffer>)
                                        end;
                                        PAVAudioPCMBuffer = Pointer;

                                        AVAudioCompressedBufferClass = interface
                                        (AVAudioBufferClass)
                                        ['{2602D2C4-CFB1-428B-A88F-A3973321CEFE}']
                                        end;
                                        AVAudioCompressedBuffer = interface
                                        (AVAudioBuffer)
                                        ['{7861318D-073A-4C5F-B5A1-95327077E401}']
                                        [MethodName
                                        ('initWithFormat:packetCapacity:maximumPacketSize:')
                                        ]
                                        function initWithFormatPacketCapacityMaximumPacketSize
                                        (format: AVAudioFormat;
                                        packetCapacity: AVAudioPacketCount;
                                        maximumPacketSize: NSInteger)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('initWithFormat:packetCapacity:')]
                                        function initWithFormatPacketCapacity
                                        (format: AVAudioFormat;
                                        packetCapacity: AVAudioPacketCount)
                                        : Pointer { instancetype }; cdecl;
                                        function packetCapacity
                                        : AVAudioPacketCount; cdecl;
                                        procedure setPacketCount
                                        (packetCount
                                        : AVAudioPacketCount); cdecl;
                                        function packetCount
                                        : AVAudioPacketCount; cdecl;
                                        function maximumPacketSize
                                        : NSInteger; cdecl;
                                        function data: Pointer; cdecl;
                                        function packetDescriptions
                                        : Pointer; cdecl;
                                        end;

                                        TAVAudioCompressedBuffer = class
                                        (TOCGenericImport<
                                        AVAudioCompressedBufferClass,
                                        AVAudioCompressedBuffer>)
                                        end;
                                        PAVAudioCompressedBuffer = Pointer;

                                        AVAudioChannelLayoutClass = interface
                                        (NSObjectClass)
                                        ['{580D06C0-1629-469E-855D-497ECC33D5C2}']
                                        { class } function layoutWithLayoutTag
                                        (layoutTag: AudioChannelLayoutTag)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function layoutWithLayout
                                        (layout: Pointer)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        AVAudioChannelLayout = interface
                                        (NSObject)
                                        ['{8D0C89A4-D0B5-4BBE-BD50-880850FA10A0}']
                                        function initWithLayoutTag
                                        (layoutTag: AudioChannelLayoutTag)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithLayout(layout: Pointer)
                                        : Pointer { instancetype }; cdecl;
                                        function isEqual(&object: Pointer)
                                        : Boolean; cdecl;
                                        function layoutTag
                                        : AudioChannelLayoutTag; cdecl;
                                        function layout: Pointer; cdecl;
                                        function channelCount
                                        : AVAudioChannelCount; cdecl;
                                        end;

                                        TAVAudioChannelLayout = class
                                        (TOCGenericImport<
                                        AVAudioChannelLayoutClass,
                                        AVAudioChannelLayout>)
                                        end;
                                        PAVAudioChannelLayout = Pointer;

                                        AVAudioNodeClass = interface
                                        (NSObjectClass)
                                        ['{21722977-32A3-45A1-BFC7-76F941CD6938}']
                                        end;
                                        AVAudioNode = interface(NSObject)
                                        ['{11656A78-8C99-4377-9A63-AFD58DC4CA74}']
                                        procedure reset;
                                        cdecl;
                                        function inputFormatForBus
                                        (bus: AVAudioNodeBus)
                                        : AVAudioFormat; cdecl;
                                        function outputFormatForBus
                                        (bus: AVAudioNodeBus)
                                        : AVAudioFormat; cdecl;
                                        function nameForInputBus
                                        (bus: AVAudioNodeBus): NSString; cdecl;
                                        function nameForOutputBus
                                        (bus: AVAudioNodeBus): NSString; cdecl;
                                        procedure installTapOnBus
                                        (bus: AVAudioNodeBus;
                                        bufferSize: AVAudioFrameCount;
                                        format: AVAudioFormat;
                                        block: AVAudioNodeTapBlock); cdecl;
                                        procedure removeTapOnBus
                                        (bus: AVAudioNodeBus); cdecl;
                                        function engine: AVAudioEngine; cdecl;
                                        function numberOfInputs
                                        : NSUInteger; cdecl;
                                        function numberOfOutputs
                                        : NSUInteger; cdecl;
                                        function lastRenderTime
                                        : AVAudioTime; cdecl;
                                        end;

                                        TAVAudioNode = class
                                        (TOCGenericImport<AVAudioNodeClass,
                                        AVAudioNode>)
                                        end;
                                        PAVAudioNode = Pointer;

                                        AVAudioConnectionPointClass = interface
                                        (NSObjectClass)
                                        ['{AC74BE3C-50AD-4588-9162-C5C00B4FE9BF}']
                                        end;
                                        AVAudioConnectionPoint = interface
                                        (NSObject)
                                        ['{4ED578FA-149C-4E86-A700-5ED9F7FC50D8}']
                                        function initWithNode(node: AVAudioNode;
                                        bus: AVAudioNodeBus)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function node: AVAudioNode; cdecl;
                                        function bus: AVAudioNodeBus; cdecl;
                                        end;

                                        TAVAudioConnectionPoint = class
                                        (TOCGenericImport<
                                        AVAudioConnectionPointClass,
                                        AVAudioConnectionPoint>)
                                        end;
                                        PAVAudioConnectionPoint = Pointer;

                                        AVAudioConverterClass = interface
                                        (NSObjectClass)
                                        ['{3ADFFB0C-6458-4A44-BF97-A9167E953283}']
                                        end;
                                        AVAudioConverter = interface(NSObject)
                                        ['{FDAB432F-E62C-461B-A241-81A4ADECE51A}']
                                        function initFromFormat
                                        (fromFormat: AVAudioFormat;
                                        toFormat: AVAudioFormat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure reset; cdecl;
                                        function inputFormat
                                        : AVAudioFormat; cdecl;
                                        function outputFormat
                                        : AVAudioFormat; cdecl;
                                        procedure setChannelMap
                                        (channelMap: NSArray); cdecl;
                                        function channelMap: NSArray; cdecl;
                                        procedure setMagicCookie
                                        (magicCookie: NSData); cdecl;
                                        function magicCookie: NSData; cdecl;
                                        procedure setDownmix
                                        (downmix: Boolean); cdecl;
                                        function downmix: Boolean; cdecl;
                                        procedure setDither
                                        (dither: Boolean); cdecl;
                                        function dither: Boolean; cdecl;
                                        procedure setSampleRateConverterQuality
                                        (sampleRateConverterQuality
                                        : NSInteger); cdecl;
                                        function sampleRateConverterQuality
                                        : NSInteger; cdecl;
                                        procedure setSampleRateConverterAlgorithm
                                        (sampleRateConverterAlgorithm
                                        : NSString); cdecl;
                                        function sampleRateConverterAlgorithm
                                        : NSString; cdecl;
                                        procedure setPrimeMethod
                                        (primeMethod
                                        : AVAudioConverterPrimeMethod); cdecl;
                                        function primeMethod
                                        : AVAudioConverterPrimeMethod; cdecl;
                                        procedure setPrimeInfo
                                        (primeInfo
                                        : AVAudioConverterPrimeInfo); cdecl;
                                        function primeInfo
                                        : AVAudioConverterPrimeInfo; cdecl;
                                        [MethodName
                                        ('convertToBuffer:fromBuffer:error:')]
                                        function convertToBufferFromBufferError
                                        (outputBuffer: AVAudioPCMBuffer;
                                        fromBuffer: AVAudioPCMBuffer;
                                        error: NSError): Boolean; cdecl;
                                        [MethodName
                                        ('convertToBuffer:error:withInputFromBlock:')
                                        ]
                                        function convertToBufferErrorWithInputFromBlock
                                        (outputBuffer: AVAudioBuffer;
                                        error: NSError;
                                        withInputFromBlock
                                        : AVAudioConverterInputBlock)
                                        : AVAudioConverterOutputStatus; cdecl;
                                        procedure setBitRate
                                        (bitRate: NSInteger); cdecl;
                                        function bitRate: NSInteger; cdecl;
                                        procedure setBitRateStrategy
                                        (bitRateStrategy: NSString); cdecl;
                                        function bitRateStrategy
                                        : NSString; cdecl;
                                        function maximumOutputPacketSize
                                        : NSInteger; cdecl;
                                        function availableEncodeBitRates
                                        : NSArray; cdecl;
                                        function applicableEncodeBitRates
                                        : NSArray; cdecl;
                                        function availableEncodeSampleRates
                                        : NSArray; cdecl;
                                        function applicableEncodeSampleRates
                                        : NSArray; cdecl;
                                        function availableEncodeChannelLayoutTags
                                        : NSArray; cdecl;
                                        end;

                                        TAVAudioConverter = class
                                        (TOCGenericImport<AVAudioConverterClass,
                                        AVAudioConverter>)
                                        end;
                                        PAVAudioConverter = Pointer;

                                        AVAudioIONodeClass = interface
                                        (AVAudioNodeClass)
                                        ['{2636C130-C876-4AF8-920B-DDABA2DB2E64}']
                                        end;
                                        AVAudioIONode = interface(AVAudioNode)
                                        ['{DC6D2CCA-B037-46DF-B1E9-A401762AD1E0}']
                                        function presentationLatency
                                        : NSTimeInterval;
                                        cdecl;
                                        function AudioUnit: AudioUnit; cdecl;
                                        end;

                                        TAVAudioIONode = class
                                        (TOCGenericImport<AVAudioIONodeClass,
                                        AVAudioIONode>)
                                        end;
                                        PAVAudioIONode = Pointer;

                                        AVAudioInputNodeClass = interface
                                        (AVAudioIONodeClass)
                                        ['{DFC0309C-6A45-4E80-B7E6-DC561338D7F7}']
                                        end;
                                        AVAudioInputNode = interface
                                        (AVAudioIONode)
                                        ['{CD515AA6-0D6F-48C9-9120-2046AA9A4E89}']
                                        end;

                                        TAVAudioInputNode = class
                                        (TOCGenericImport<AVAudioInputNodeClass,
                                        AVAudioInputNode>)
                                        end;
                                        PAVAudioInputNode = Pointer;

                                        AVAudioOutputNodeClass = interface
                                        (AVAudioIONodeClass)
                                        ['{86676913-B211-4C2C-AC9A-4F350C70E4E8}']
                                        end;
                                        AVAudioOutputNode = interface
                                        (AVAudioIONode)
                                        ['{5ACB2082-F0DA-4715-ADE1-2F7E1C9CAA2A}']
                                        end;

                                        TAVAudioOutputNode = class
                                        (TOCGenericImport<
                                        AVAudioOutputNodeClass,
                                        AVAudioOutputNode>)
                                        end;
                                        PAVAudioOutputNode = Pointer;

                                        AVAudioMixerNodeClass = interface
                                        (AVAudioNodeClass)
                                        ['{93451594-4813-44E1-93E5-BFDD045EA099}']
                                        end;
                                        AVAudioMixerNode = interface
                                        (AVAudioNode)
                                        ['{8D5CCD0C-20BD-46B0-B4B3-27A8E4CE3F59}']
                                        procedure setOutputVolume
                                        (outputVolume: Single);
                                        cdecl;
                                        function outputVolume: Single; cdecl;
                                        function nextAvailableInputBus
                                        : AVAudioNodeBus; cdecl;
                                        end;

                                        TAVAudioMixerNode = class
                                        (TOCGenericImport<AVAudioMixerNodeClass,
                                        AVAudioMixerNode>)
                                        end;
                                        PAVAudioMixerNode = Pointer;

                                        AVAudioEngineClass = interface
                                        (NSObjectClass)
                                        ['{BEFC942E-8364-40B1-871A-736F0A61F410}']
                                        end;
                                        AVAudioEngine = interface(NSObject)
                                        ['{9B9AE4FD-1502-40D4-A69F-5EC5DF62AB91}']
                                        function init: Pointer { instancetype };
                                        cdecl;
                                        procedure attachNode
                                        (node: AVAudioNode); cdecl;
                                        procedure detachNode
                                        (node: AVAudioNode); cdecl;
                                        [MethodName
                                        ('connect:to:fromBus:toBus:format:')]
                                        procedure connectToFromBusToBusFormat
                                        (node1: AVAudioNode; &to: AVAudioNode;
                                        fromBus: AVAudioNodeBus;
                                        toBus: AVAudioNodeBus;
                                        format: AVAudioFormat); cdecl;
                                        [MethodName('connect:to:format:')]
                                        procedure connectToFormat
                                        (node1: AVAudioNode; &to: AVAudioNode;
                                        format: AVAudioFormat); cdecl;
                                        [MethodName
                                        ('connect:toConnectionPoints:fromBus:format:')
                                        ]
                                        procedure connectToConnectionPointsFromBusFormat
                                        (sourceNode: AVAudioNode;
                                        toConnectionPoints: NSArray;
                                        fromBus: AVAudioNodeBus;
                                        format: AVAudioFormat); cdecl;
                                        [MethodName('disconnectNodeInput:bus:')]
                                        procedure disconnectNodeInputBus
                                        (node: AVAudioNode;
                                        bus: AVAudioNodeBus); cdecl;
                                        [MethodName('disconnectNodeInput:')]
                                        procedure disconnectNodeInput
                                        (node: AVAudioNode); cdecl;
                                        [MethodName
                                        ('disconnectNodeOutput:bus:')]
                                        procedure disconnectNodeOutputBus
                                        (node: AVAudioNode;
                                        bus: AVAudioNodeBus); cdecl;
                                        [MethodName('disconnectNodeOutput:')]
                                        procedure disconnectNodeOutput
                                        (node: AVAudioNode); cdecl;
                                        procedure prepare; cdecl;
                                        function startAndReturnError
                                        (outError: NSError): Boolean; cdecl;
                                        procedure pause; cdecl;
                                        procedure reset; cdecl;
                                        procedure stop; cdecl;
                                        function inputConnectionPointForNode
                                        (node: AVAudioNode;
                                        inputBus: AVAudioNodeBus)
                                        : AVAudioConnectionPoint; cdecl;
                                        function outputConnectionPointsForNode
                                        (node: AVAudioNode;
                                        outputBus: AVAudioNodeBus)
                                        : NSArray; cdecl;
                                        procedure setMusicSequence
                                        (MusicSequence: MusicSequence); cdecl;
                                        function MusicSequence
                                        : MusicSequence; cdecl;
                                        function outputNode
                                        : AVAudioOutputNode; cdecl;
                                        function inputNode
                                        : AVAudioInputNode; cdecl;
                                        function mainMixerNode
                                        : AVAudioMixerNode; cdecl;
                                        function isRunning: Boolean; cdecl;
                                        end;

                                        TAVAudioEngine = class
                                        (TOCGenericImport<AVAudioEngineClass,
                                        AVAudioEngine>)
                                        end;
                                        PAVAudioEngine = Pointer;

                                        AVAudioTimeClass = interface
                                        (NSObjectClass)
                                        ['{67A24235-1B21-42A2-AC19-31F6FA6387B5}']
                                        { class } function
                                        timeWithAudioTimeStamp(ts: Pointer;
                                        sampleRate: Double)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName('timeWithHostTime:')]
                                        { class } function timeWithHostTime
                                        (hostTime: UInt64)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function timeWithSampleTime
                                        (sampleTime: AVAudioFramePosition;
                                        atRate: Double)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('timeWithHostTime:sampleTime:atRate:')]
                                        { class } function
                                        timeWithHostTimeSampleTimeAtRate
                                        (hostTime: UInt64;
                                        sampleTime: AVAudioFramePosition;
                                        atRate: Double)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function hostTimeForSeconds
                                        (seconds: NSTimeInterval)
                                        : UInt64; cdecl;
                                        { class } function secondsForHostTime
                                        (hostTime: UInt64)
                                        : NSTimeInterval; cdecl;
                                        end;
                                        AVAudioTime = interface(NSObject)
                                        ['{98C8AFF6-498E-4B42-A542-832BF7F10381}']
                                        function initWithAudioTimeStamp
                                        (ts: Pointer; sampleRate: Double)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName('initWithHostTime:')]
                                        function initWithHostTime
                                        (hostTime: UInt64)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithSampleTime
                                        (sampleTime: AVAudioFramePosition;
                                        atRate: Double)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithHostTime:sampleTime:atRate:')]
                                        function initWithHostTimeSampleTimeAtRate
                                        (hostTime: UInt64;
                                        sampleTime: AVAudioFramePosition;
                                        atRate: Double)
                                        : Pointer { instancetype }; cdecl;
                                        function extrapolateTimeFromAnchor
                                        (anchorTime: AVAudioTime)
                                        : AVAudioTime; cdecl;
                                        function isHostTimeValid
                                        : Boolean; cdecl;
                                        function hostTime: UInt64; cdecl;
                                        function isSampleTimeValid
                                        : Boolean; cdecl;
                                        function sampleTime
                                        : AVAudioFramePosition; cdecl;
                                        function sampleRate: Double; cdecl;
                                        function AudioTimeStamp
                                        : AudioTimeStamp; cdecl;
                                        end;

                                        TAVAudioTime = class
                                        (TOCGenericImport<AVAudioTimeClass,
                                        AVAudioTime>)
                                        end;
                                        PAVAudioTime = Pointer;

                                        AVAudioUnitClass = interface
                                        (AVAudioNodeClass)
                                        ['{A011DEA4-A84E-40CD-957B-0F94B09264AC}']
                                        { class } procedure
                                        instantiateWithComponentDescription
                                        (AudioComponentDescription
                                        : AudioComponentDescription;
                                        options: AudioComponentInstantiationOptions;
                                        completionHandler
                                        : TAVFoundationCompletionHandler2);
                                        cdecl;
                                        end;
                                        AVAudioUnit = interface(AVAudioNode)
                                        ['{25CB8CD2-DE3A-4B3E-AF27-5D5AEA191C94}']
                                        function loadAudioUnitPresetAtURL
                                        (URL: NSURL; error: NSError): Boolean;
                                        cdecl;
                                        function AudioComponentDescription
                                        : AudioComponentDescription; cdecl;
                                        function AudioUnit: AudioUnit; cdecl;
                                        function AUAudioUnit
                                        : AUAudioUnit; cdecl;
                                        function name: NSString; cdecl;
                                        function manufacturerName
                                        : NSString; cdecl;
                                        function version: NSUInteger; cdecl;
                                        end;

                                        TAVAudioUnit = class
                                        (TOCGenericImport<AVAudioUnitClass,
                                        AVAudioUnit>)
                                        end;
                                        PAVAudioUnit = Pointer;

                                        AVAudioUnitEffectClass = interface
                                        (AVAudioUnitClass)
                                        ['{DF7F1548-75B0-441E-A352-B074E8F06534}']
                                        end;
                                        AVAudioUnitEffect = interface
                                        (AVAudioUnit)
                                        ['{148E6317-4DC5-4CC0-AD34-FCC5A61BC43E}']
                                        function initWithAudioComponentDescription
                                        (AudioComponentDescription
                                        : AudioComponentDescription)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setBypass
                                        (bypass: Boolean); cdecl;
                                        function bypass: Boolean; cdecl;
                                        end;

                                        TAVAudioUnitEffect = class
                                        (TOCGenericImport<
                                        AVAudioUnitEffectClass,
                                        AVAudioUnitEffect>)
                                        end;
                                        PAVAudioUnitEffect = Pointer;

                                        AVAudioUnitReverbClass = interface
                                        (AVAudioUnitEffectClass)
                                        ['{F01DDCE1-DE73-4A96-BACC-1D92A4251129}']
                                        end;
                                        AVAudioUnitReverb = interface
                                        (AVAudioUnitEffect)
                                        ['{F35B1E88-B3EB-4096-9148-1B7E03C55645}']
                                        procedure loadFactoryPreset
                                        (preset: AVAudioUnitReverbPreset);
                                        cdecl;
                                        procedure setWetDryMix
                                        (wetDryMix: Single); cdecl;
                                        function wetDryMix: Single; cdecl;
                                        end;

                                        TAVAudioUnitReverb = class
                                        (TOCGenericImport<
                                        AVAudioUnitReverbClass,
                                        AVAudioUnitReverb>)
                                        end;
                                        PAVAudioUnitReverb = Pointer;

                                        AVAudioUnitEQFilterParametersClass =
                                        interface(NSObjectClass)
                                        ['{E0533B9B-3FA2-4C50-84C0-E05B202BFEAF}']
                                        end;
                                        AVAudioUnitEQFilterParameters =
                                        interface(NSObject)
                                        ['{6C700B05-5F30-46DD-91EF-A162FF22D637}']
                                        procedure setFilterType
                                        (filterType: AVAudioUnitEQFilterType);
                                        cdecl;
                                        function filterType
                                        : AVAudioUnitEQFilterType; cdecl;
                                        procedure setFrequency
                                        (frequency: Single); cdecl;
                                        function frequency: Single; cdecl;
                                        procedure setBandwidth
                                        (bandwidth: Single); cdecl;
                                        function bandwidth: Single; cdecl;
                                        procedure setGain(gain: Single); cdecl;
                                        function gain: Single; cdecl;
                                        procedure setBypass
                                        (bypass: Boolean); cdecl;
                                        function bypass: Boolean; cdecl;
                                        end;

                                        TAVAudioUnitEQFilterParameters = class
                                        (TOCGenericImport<
                                        AVAudioUnitEQFilterParametersClass,
                                        AVAudioUnitEQFilterParameters>)
                                        end;
                                        PAVAudioUnitEQFilterParameters =
                                        Pointer;

                                        AVAudioUnitEQClass = interface
                                        (AVAudioUnitEffectClass)
                                        ['{09AEAB57-C95F-47D8-8A3D-9A321404128E}']
                                        end;
                                        AVAudioUnitEQ = interface
                                        (AVAudioUnitEffect)
                                        ['{3DF9CA1F-0FCA-4ADD-9DDB-62574C407AFF}']
                                        function initWithNumberOfBands
                                        (numberOfBands: NSUInteger)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function bands: NSArray; cdecl;
                                        procedure setGlobalGain
                                        (globalGain: Single); cdecl;
                                        function globalGain: Single; cdecl;
                                        end;

                                        TAVAudioUnitEQ = class
                                        (TOCGenericImport<AVAudioUnitEQClass,
                                        AVAudioUnitEQ>)
                                        end;
                                        PAVAudioUnitEQ = Pointer;

                                        AVAudioMixingDestinationClass =
                                        interface(NSObjectClass)
                                        ['{E08BCD23-C754-449A-AA91-BBC0AF9F0E1C}']
                                        end;
                                        AVAudioMixingDestination = interface
                                        (NSObject)
                                        ['{02E5F590-35E2-4406-8AED-D6004FB9A61C}']
                                        function connectionPoint
                                        : AVAudioConnectionPoint;
                                        cdecl;
                                        end;

                                        TAVAudioMixingDestination = class
                                        (TOCGenericImport<
                                        AVAudioMixingDestinationClass,
                                        AVAudioMixingDestination>)
                                        end;
                                        PAVAudioMixingDestination = Pointer;

                                        AVAudioEnvironmentDistanceAttenuationParametersClass =
                                        interface(NSObjectClass)
                                        ['{8110DFA1-684F-433B-A05B-8BE8D87DBD7E}']
                                        end;
                                        AVAudioEnvironmentDistanceAttenuationParameters =
                                        interface(NSObject)
                                        ['{8827A0B9-2FDC-4494-817F-7AAD99A20395}']
                                        procedure setDistanceAttenuationModel
                                        (distanceAttenuationModel
                                        : AVAudioEnvironmentDistanceAttenuationModel);
                                        cdecl;
                                        function distanceAttenuationModel
                                        : AVAudioEnvironmentDistanceAttenuationModel;
                                        cdecl;
                                        procedure setReferenceDistance
                                        (referenceDistance: Single); cdecl;
                                        function referenceDistance
                                        : Single; cdecl;
                                        procedure setMaximumDistance
                                        (maximumDistance: Single); cdecl;
                                        function maximumDistance: Single; cdecl;
                                        procedure setRolloffFactor
                                        (rolloffFactor: Single); cdecl;
                                        function rolloffFactor: Single; cdecl;
                                        end;

                                        TAVAudioEnvironmentDistanceAttenuationParameters =
                                        class(TOCGenericImport<
                                        AVAudioEnvironmentDistanceAttenuationParametersClass,
                                        AVAudioEnvironmentDistanceAttenuationParameters>)
                                        end;
                                        PAVAudioEnvironmentDistanceAttenuationParameters =
                                        Pointer;

                                        AVAudioEnvironmentReverbParametersClass =
                                        interface(NSObjectClass)
                                        ['{48897DC4-7C60-4D00-8584-EF3DBDE2051F}']
                                        end;
                                        AVAudioEnvironmentReverbParameters =
                                        interface(NSObject)
                                        ['{4AAEEB29-17A2-4E49-B957-BBBAA1D3E898}']
                                        procedure setEnable(enable: Boolean);
                                        cdecl;
                                        function enable: Boolean; cdecl;
                                        procedure setLevel
                                        (level: Single); cdecl;
                                        function level: Single; cdecl;
                                        function filterParameters
                                        : AVAudioUnitEQFilterParameters; cdecl;
                                        procedure loadFactoryReverbPreset
                                        (preset: AVAudioUnitReverbPreset);
                                        cdecl;
                                        end;

                                        TAVAudioEnvironmentReverbParameters =
                                        class(TOCGenericImport<
                                        AVAudioEnvironmentReverbParametersClass,
                                        AVAudioEnvironmentReverbParameters>)
                                        end;
                                        PAVAudioEnvironmentReverbParameters =
                                        Pointer;

                                        AVAudioEnvironmentNodeClass = interface
                                        (AVAudioNodeClass)
                                        ['{68C2E2D5-34C1-418A-B082-892B08386C22}']
                                        end;
                                        AVAudioEnvironmentNode = interface
                                        (AVAudioNode)
                                        ['{AFB94F74-FA49-4A64-86A2-D721E878DB92}']
                                        procedure setOutputVolume
                                        (outputVolume: Single);
                                        cdecl;
                                        function outputVolume: Single; cdecl;
                                        function nextAvailableInputBus
                                        : AVAudioNodeBus; cdecl;
                                        procedure setListenerPosition
                                        (listenerPosition
                                        : AVAudio3DPoint); cdecl;
                                        function listenerPosition
                                        : AVAudio3DPoint; cdecl;
                                        procedure setListenerVectorOrientation
                                        (listenerVectorOrientation
                                        : AVAudio3DVectorOrientation); cdecl;
                                        function listenerVectorOrientation
                                        : AVAudio3DVectorOrientation; cdecl;
                                        procedure setListenerAngularOrientation
                                        (listenerAngularOrientation
                                        : AVAudio3DAngularOrientation); cdecl;
                                        function listenerAngularOrientation
                                        : AVAudio3DAngularOrientation; cdecl;
                                        function distanceAttenuationParameters
                                        : AVAudioEnvironmentDistanceAttenuationParameters;
                                        cdecl;
                                        function reverbParameters
                                        : AVAudioEnvironmentReverbParameters;
                                        cdecl;
                                        function applicableRenderingAlgorithms
                                        : NSArray; cdecl;
                                        end;

                                        TAVAudioEnvironmentNode = class
                                        (TOCGenericImport<
                                        AVAudioEnvironmentNodeClass,
                                        AVAudioEnvironmentNode>)
                                        end;
                                        PAVAudioEnvironmentNode = Pointer;

                                        AVAudioFileClass = interface
                                        (NSObjectClass)
                                        ['{8A73F4E0-EFBD-4A5E-8B04-AAD9E623AD91}']
                                        end;
                                        AVAudioFile = interface(NSObject)
                                        ['{E9C8FDD2-A1FF-4623-BFC0-6AF9F074C97A}']
                                        [MethodName('initForReading:error:')]
                                        function initForReadingError
                                        (fileURL: NSURL; error: NSError)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('initForReading:commonFormat:interleaved:error:')
                                        ]
                                        function initForReadingCommonFormatInterleavedError
                                        (fileURL: NSURL;
                                        commonFormat: AVAudioCommonFormat;
                                        interleaved: Boolean; error: NSError)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initForWriting:settings:error:')]
                                        function initForWritingSettingsError
                                        (fileURL: NSURL; settings: NSDictionary;
                                        error: NSError)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initForWriting:settings:commonFormat:interleaved:error:')
                                        ]
                                        function initForWritingSettingsCommonFormatInterleavedError
                                        (fileURL: NSURL; settings: NSDictionary;
                                        commonFormat: AVAudioCommonFormat;
                                        interleaved: Boolean; error: NSError)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('readIntoBuffer:error:')]
                                        function readIntoBufferError
                                        (buffer: AVAudioPCMBuffer;
                                        error: NSError): Boolean; cdecl;
                                        [MethodName
                                        ('readIntoBuffer:frameCount:error:')]
                                        function readIntoBufferFrameCountError
                                        (buffer: AVAudioPCMBuffer;
                                        frameCount: AVAudioFrameCount;
                                        error: NSError): Boolean; cdecl;
                                        function writeFromBuffer
                                        (buffer: AVAudioPCMBuffer;
                                        error: NSError): Boolean; cdecl;
                                        function URL: NSURL; cdecl;
                                        function fileFormat
                                        : AVAudioFormat; cdecl;
                                        function processingFormat
                                        : AVAudioFormat; cdecl;
                                        function length
                                        : AVAudioFramePosition; cdecl;
                                        procedure setFramePosition
                                        (framePosition
                                        : AVAudioFramePosition); cdecl;
                                        function framePosition
                                        : AVAudioFramePosition; cdecl;
                                        end;

                                        TAVAudioFile = class
                                        (TOCGenericImport<AVAudioFileClass,
                                        AVAudioFile>)
                                        end;
                                        PAVAudioFile = Pointer;

                                        AVMutableAudioMixClass = interface
                                        (AVAudioMixClass)
                                        ['{1A4D94F8-A5AC-415E-9D6E-B56A46A2EA2D}']
                                        { class } function audioMix
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVMutableAudioMix = interface
                                        (AVAudioMix)
                                        ['{3C7708AC-DA5C-4179-A78E-225F0FA69E26}']
                                        procedure setInputParameters
                                        (inputParameters: NSArray);
                                        cdecl;
                                        function inputParameters
                                        : NSArray; cdecl;
                                        end;

                                        TAVMutableAudioMix = class
                                        (TOCGenericImport<
                                        AVMutableAudioMixClass,
                                        AVMutableAudioMix>)
                                        end;
                                        PAVMutableAudioMix = Pointer;

                                        AVPlayerItemTrackClass = interface
                                        (NSObjectClass)
                                        ['{049C30E5-0AA7-417E-B5DC-87C07A65CC7B}']
                                        end;
                                        AVPlayerItemTrack = interface(NSObject)
                                        ['{55E54CD6-0240-4F1F-9F04-5BCE0FFD4E90}']
                                        function assetTrack: AVAssetTrack;
                                        cdecl;
                                        procedure setEnabled
                                        (enabled: Boolean); cdecl;
                                        function isEnabled: Boolean; cdecl;
                                        function currentVideoFrameRate
                                        : Single; cdecl;
                                        end;

                                        TAVPlayerItemTrack = class
                                        (TOCGenericImport<
                                        AVPlayerItemTrackClass,
                                        AVPlayerItemTrack>)
                                        end;
                                        PAVPlayerItemTrack = Pointer;

                                        AVMutableAudioMixInputParametersClass =
                                        interface(
                                        AVAudioMixInputParametersClass)
                                        ['{DBC3EEC3-07CD-4273-9B5B-ACCD2280DEFF}']
                                        { class } function
                                        audioMixInputParametersWithTrack
                                        (track: AVAssetTrack)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        audioMixInputParameters
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        AVMutableAudioMixInputParameters =
                                        interface(AVAudioMixInputParameters)
                                        ['{7FD0834A-8ED1-4F68-9292-F4967A9AD2B6}']
                                        procedure setTrackID
                                        (trackID: CMPersistentTrackID);
                                        cdecl;
                                        function trackID
                                        : CMPersistentTrackID; cdecl;
                                        procedure setAudioTimePitchAlgorithm
                                        (audioTimePitchAlgorithm
                                        : NSString); cdecl;
                                        function audioTimePitchAlgorithm
                                        : NSString; cdecl;
                                        procedure setAudioTapProcessor
                                        (audioTapProcessor
                                        : MTAudioProcessingTapRef); cdecl;
                                        function audioTapProcessor
                                        : MTAudioProcessingTapRef; cdecl;
                                        procedure setVolumeRampFromStartVolume
                                        (startVolume: Single;
                                        toEndVolume: Single;
                                        timeRange: CMTimeRange); cdecl;
                                        procedure setVolume(volume: Single;
                                        atTime: CMTime); cdecl;
                                        end;

                                        TAVMutableAudioMixInputParameters =
                                        class(TOCGenericImport<
                                        AVMutableAudioMixInputParametersClass,
                                        AVMutableAudioMixInputParameters>)
                                        end;
                                        PAVMutableAudioMixInputParameters =
                                        Pointer;

                                        AVAudioSessionChannelDescriptionClass =
                                        interface(NSObjectClass)
                                        ['{4B3717EE-1CE0-4D85-B15C-F6BFB262C551}']
                                        end;
                                        AVAudioSessionChannelDescription =
                                        interface(NSObject)
                                        ['{B173CC61-ECF7-421D-80B5-28E3D8C34ACA}']
                                        function channelName: NSString;
                                        cdecl;
                                        function owningPortUID: NSString; cdecl;
                                        function channelNumber
                                        : NSUInteger; cdecl;
                                        function channelLabel
                                        : AudioChannelLabel; cdecl;
                                        end;

                                        TAVAudioSessionChannelDescription =
                                        class(TOCGenericImport<
                                        AVAudioSessionChannelDescriptionClass,
                                        AVAudioSessionChannelDescription>)
                                        end;
                                        PAVAudioSessionChannelDescription =
                                        Pointer;

                                        AVAudioPlayerClass = interface
                                        (NSObjectClass)
                                        ['{A8F96BE9-A393-4A23-AF7C-9721A0BC263E}']
                                        end;
                                        AVAudioPlayer = interface(NSObject)
                                        ['{2264741B-0A45-4FE3-A5A1-C50C024D2D65}']
                                        [MethodName
                                        ('initWithContentsOfURL:error:')]
                                        function initWithContentsOfURLError
                                        (URL: NSURL; error: NSError)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName('initWithData:error:')]
                                        function initWithDataError(data: NSData;
                                        error: NSError)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithContentsOfURL:fileTypeHint:error:')
                                        ]
                                        function initWithContentsOfURLFileTypeHintError
                                        (URL: NSURL; fileTypeHint: NSString;
                                        error: NSError)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithData:fileTypeHint:error:')]
                                        function initWithDataFileTypeHintError
                                        (data: NSData; fileTypeHint: NSString;
                                        error: NSError)
                                        : Pointer { instancetype }; cdecl;
                                        function prepareToPlay: Boolean; cdecl;
                                        function play: Boolean; cdecl;
                                        function playAtTime
                                        (time: NSTimeInterval): Boolean; cdecl;
                                        procedure pause; cdecl;
                                        procedure stop; cdecl;
                                        function isPlaying: Boolean; cdecl;
                                        function numberOfChannels
                                        : NSUInteger; cdecl;
                                        function duration
                                        : NSTimeInterval; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        function URL: NSURL; cdecl;
                                        function data: NSData; cdecl;
                                        procedure setPan(pan: Single); cdecl;
                                        function pan: Single; cdecl;
                                        procedure setVolume
                                        (volume: Single); cdecl;
                                        function volume: Single; cdecl;
                                        procedure setEnableRate
                                        (enableRate: Boolean); cdecl;
                                        function enableRate: Boolean; cdecl;
                                        procedure setRate(rate: Single); cdecl;
                                        function rate: Single; cdecl;
                                        procedure setCurrentTime
                                        (currentTime: NSTimeInterval); cdecl;
                                        function currentTime
                                        : NSTimeInterval; cdecl;
                                        function deviceCurrentTime
                                        : NSTimeInterval; cdecl;
                                        procedure setNumberOfLoops
                                        (numberOfLoops: NSInteger); cdecl;
                                        function numberOfLoops
                                        : NSInteger; cdecl;
                                        function settings: NSDictionary; cdecl;
                                        procedure setMeteringEnabled
                                        (meteringEnabled: Boolean); cdecl;
                                        function isMeteringEnabled
                                        : Boolean; cdecl;
                                        procedure updateMeters; cdecl;
                                        function peakPowerForChannel
                                        (channelNumber: NSUInteger)
                                        : Single; cdecl;
                                        function averagePowerForChannel
                                        (channelNumber: NSUInteger)
                                        : Single; cdecl;
                                        procedure setChannelAssignments
                                        (channelAssignments: NSArray); cdecl;
                                        function channelAssignments
                                        : NSArray; cdecl;
                                        end;

                                        TAVAudioPlayer = class
                                        (TOCGenericImport<AVAudioPlayerClass,
                                        AVAudioPlayer>)
                                        end;
                                        PAVAudioPlayer = Pointer;

                                        AVAudioPlayerNodeClass = interface
                                        (AVAudioNodeClass)
                                        ['{7D61A1FE-B9B0-4380-AAF2-5CE060B87265}']
                                        end;
                                        AVAudioPlayerNode = interface
                                        (AVAudioNode)
                                        ['{49E4FE6E-4EC9-4DC7-990C-9E7B412A39C0}']
                                        [MethodName
                                        ('scheduleBuffer:completionHandler:')]
                                        procedure scheduleBufferCompletionHandler
                                        (buffer: AVAudioPCMBuffer;
                                        completionHandler
                                        : AVAudioNodeCompletionHandler);
                                        cdecl;
                                        [MethodName
                                        ('scheduleBuffer:atTime:options:completionHandler:')
                                        ]
                                        procedure scheduleBufferAtTimeOptionsCompletionHandler
                                        (buffer: AVAudioPCMBuffer;
                                        atTime: AVAudioTime;
                                        options: AVAudioPlayerNodeBufferOptions;
                                        completionHandler
                                        : AVAudioNodeCompletionHandler); cdecl;
                                        procedure scheduleFile
                                        (&file: AVAudioFile;
                                        atTime: AVAudioTime;
                                        completionHandler
                                        : AVAudioNodeCompletionHandler); cdecl;
                                        procedure scheduleSegment
                                        (&file: AVAudioFile;
                                        startingFrame: AVAudioFramePosition;
                                        frameCount: AVAudioFrameCount;
                                        atTime: AVAudioTime;
                                        completionHandler
                                        : AVAudioNodeCompletionHandler); cdecl;
                                        procedure stop; cdecl;
                                        procedure prepareWithFrameCount
                                        (frameCount: AVAudioFrameCount); cdecl;
                                        procedure play; cdecl;
                                        procedure playAtTime
                                        (when: AVAudioTime); cdecl;
                                        procedure pause; cdecl;
                                        function nodeTimeForPlayerTime
                                        (playerTime: AVAudioTime)
                                        : AVAudioTime; cdecl;
                                        function playerTimeForNodeTime
                                        (nodeTime: AVAudioTime)
                                        : AVAudioTime; cdecl;
                                        function isPlaying: Boolean; cdecl;
                                        end;

                                        TAVAudioPlayerNode = class
                                        (TOCGenericImport<
                                        AVAudioPlayerNodeClass,
                                        AVAudioPlayerNode>)
                                        end;
                                        PAVAudioPlayerNode = Pointer;

                                        AVAudioRecorderClass = interface
                                        (NSObjectClass)
                                        ['{1A569511-D6A9-4575-8B1F-DA86F817FB72}']
                                        end;
                                        AVAudioRecorder = interface(NSObject)
                                        ['{61E18E1F-F057-41F2-8A08-1AD2DB343CBF}']
                                        function initWithURL(URL: NSURL;
                                        settings: NSDictionary; error: NSError)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function prepareToRecord
                                        : Boolean; cdecl;
                                        function &record: Boolean; cdecl;
                                        [MethodName('recordAtTime:')]
                                        function recordAtTime
                                        (time: NSTimeInterval): Boolean; cdecl;
                                        function recordForDuration
                                        (duration: NSTimeInterval)
                                        : Boolean; cdecl;
                                        [MethodName
                                        ('recordAtTime:forDuration:')]
                                        function recordAtTimeForDuration
                                        (time: NSTimeInterval;
                                        forDuration: NSTimeInterval)
                                        : Boolean; cdecl;
                                        procedure pause; cdecl;
                                        procedure stop; cdecl;
                                        function deleteRecording
                                        : Boolean; cdecl;
                                        function isRecording: Boolean; cdecl;
                                        function URL: NSURL; cdecl;
                                        function settings: NSDictionary; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        function currentTime
                                        : NSTimeInterval; cdecl;
                                        function deviceCurrentTime
                                        : NSTimeInterval; cdecl;
                                        procedure setMeteringEnabled
                                        (meteringEnabled: Boolean); cdecl;
                                        function isMeteringEnabled
                                        : Boolean; cdecl;
                                        procedure updateMeters; cdecl;
                                        function peakPowerForChannel
                                        (channelNumber: NSUInteger)
                                        : Single; cdecl;
                                        function averagePowerForChannel
                                        (channelNumber: NSUInteger)
                                        : Single; cdecl;
                                        procedure setChannelAssignments
                                        (channelAssignments: NSArray); cdecl;
                                        function channelAssignments
                                        : NSArray; cdecl;
                                        end;

                                        TAVAudioRecorder = class
                                        (TOCGenericImport<AVAudioRecorderClass,
                                        AVAudioRecorder>)
                                        end;
                                        PAVAudioRecorder = Pointer;

                                        AVMusicTrackClass = interface
                                        (NSObjectClass)
                                        ['{04D222CD-9538-4CC5-B32D-3466F31A1787}']
                                        end;
                                        AVMusicTrack = interface(NSObject)
                                        ['{7F3F0A83-F264-4AD8-B1A4-CF2CAFB3520E}']
                                        procedure setDestinationAudioUnit
                                        (destinationAudioUnit: AVAudioUnit);
                                        cdecl;
                                        function destinationAudioUnit
                                        : AVAudioUnit; cdecl;
                                        procedure setDestinationMIDIEndpoint
                                        (destinationMIDIEndpoint
                                        : MIDIEndpointRef); cdecl;
                                        function destinationMIDIEndpoint
                                        : MIDIEndpointRef; cdecl;
                                        procedure setLoopRange
                                        (loopRange: AVBeatRange); cdecl;
                                        function loopRange: AVBeatRange; cdecl;
                                        procedure setLoopingEnabled
                                        (loopingEnabled: Boolean); cdecl;
                                        function isLoopingEnabled
                                        : Boolean; cdecl;
                                        procedure setNumberOfLoops
                                        (numberOfLoops: NSInteger); cdecl;
                                        function numberOfLoops
                                        : NSInteger; cdecl;
                                        procedure setOffsetTime
                                        (offsetTime: AVMusicTimeStamp); cdecl;
                                        function offsetTime
                                        : AVMusicTimeStamp; cdecl;
                                        procedure setMuted
                                        (muted: Boolean); cdecl;
                                        function isMuted: Boolean; cdecl;
                                        procedure setSoloed
                                        (soloed: Boolean); cdecl;
                                        function isSoloed: Boolean; cdecl;
                                        procedure setLengthInBeats
                                        (lengthInBeats
                                        : AVMusicTimeStamp); cdecl;
                                        function lengthInBeats
                                        : AVMusicTimeStamp; cdecl;
                                        procedure setLengthInSeconds
                                        (lengthInSeconds
                                        : NSTimeInterval); cdecl;
                                        function lengthInSeconds
                                        : NSTimeInterval; cdecl;
                                        function timeResolution
                                        : NSUInteger; cdecl;
                                        end;

                                        TAVMusicTrack = class
                                        (TOCGenericImport<AVMusicTrackClass,
                                        AVMusicTrack>)
                                        end;
                                        PAVMusicTrack = Pointer;

                                        AVAudioSequencerClass = interface
                                        (NSObjectClass)
                                        ['{A59BC907-A17B-4ED9-8D75-E12597215928}']
                                        end;
                                        AVAudioSequencer = interface(NSObject)
                                        ['{EEBB32EC-2CB5-43E6-AC52-9145C458FC27}']
                                        function init: Pointer { instancetype };
                                        cdecl;
                                        function initWithAudioEngine
                                        (engine: AVAudioEngine)
                                        : Pointer { instancetype }; cdecl;
                                        function loadFromURL(fileURL: NSURL;
                                        options: AVMusicSequenceLoadOptions;
                                        error: NSError): Boolean; cdecl;
                                        function loadFromData(data: NSData;
                                        options: AVMusicSequenceLoadOptions;
                                        error: NSError): Boolean; cdecl;
                                        function writeToURL(fileURL: NSURL;
                                        SMPTEResolution: NSInteger;
                                        replaceExisting: Boolean;
                                        error: NSError): Boolean; cdecl;
                                        function dataWithSMPTEResolution
                                        (SMPTEResolution: NSInteger;
                                        error: NSError): NSData; cdecl;
                                        function secondsForBeats
                                        (beats: AVMusicTimeStamp)
                                        : NSTimeInterval; cdecl;
                                        function beatsForSeconds
                                        (seconds: NSTimeInterval)
                                        : AVMusicTimeStamp; cdecl;
                                        function tracks: NSArray; cdecl;
                                        function tempoTrack
                                        : AVMusicTrack; cdecl;
                                        function userInfo: NSDictionary; cdecl;
                                        procedure setCurrentPositionInSeconds
                                        (currentPositionInSeconds
                                        : NSTimeInterval); cdecl;
                                        function currentPositionInSeconds
                                        : NSTimeInterval; cdecl;
                                        procedure setCurrentPositionInBeats
                                        (currentPositionInBeats
                                        : NSTimeInterval); cdecl;
                                        function currentPositionInBeats
                                        : NSTimeInterval; cdecl;
                                        function isPlaying: Boolean; cdecl;
                                        procedure setRate(rate: Single); cdecl;
                                        function rate: Single; cdecl;
                                        function hostTimeForBeats
                                        (inBeats: AVMusicTimeStamp;
                                        error: NSError): UInt64; cdecl;
                                        function beatsForHostTime
                                        (inHostTime: UInt64; error: NSError)
                                        : AVMusicTimeStamp; cdecl;
                                        procedure prepareToPlay; cdecl;
                                        function startAndReturnError
                                        (outError: NSError): Boolean; cdecl;
                                        procedure stop; cdecl;
                                        end;

                                        TAVAudioSequencer = class
                                        (TOCGenericImport<AVAudioSequencerClass,
                                        AVAudioSequencer>)
                                        end;
                                        PAVAudioSequencer = Pointer;

                                        AVAudioSessionPortDescriptionClass =
                                        interface(NSObjectClass)
                                        ['{DB0E2DC2-3DDD-47FA-BBF9-472AC985FB75}']
                                        end;
                                        AVAudioSessionPortDescription =
                                        interface(NSObject)
                                        ['{BFB428FE-AA40-4404-9F7C-5E9126E87F4A}']
                                        function portType: NSString;
                                        cdecl;
                                        function portName: NSString; cdecl;
                                        function UID: NSString; cdecl;
                                        function channels: NSArray; cdecl;
                                        function dataSources: NSArray; cdecl;
                                        function selectedDataSource
                                        : AVAudioSessionDataSourceDescription;
                                        cdecl;
                                        function preferredDataSource
                                        : AVAudioSessionDataSourceDescription;
                                        cdecl;
                                        function setPreferredDataSource
                                        (dataSource
                                        : AVAudioSessionDataSourceDescription;
                                        error: NSError): Boolean; cdecl;
                                        end;

                                        TAVAudioSessionPortDescription = class
                                        (TOCGenericImport<
                                        AVAudioSessionPortDescriptionClass,
                                        AVAudioSessionPortDescription>)
                                        end;
                                        PAVAudioSessionPortDescription =
                                        Pointer;

                                        AVAudioSessionRouteDescriptionClass =
                                        interface(NSObjectClass)
                                        ['{CA083291-245E-491A-8525-AE3F74630EB1}']
                                        end;
                                        AVAudioSessionRouteDescription =
                                        interface(NSObject)
                                        ['{11076D5A-A930-467A-B849-410C891EE578}']
                                        function inputs: NSArray;
                                        cdecl;
                                        function outputs: NSArray; cdecl;
                                        end;

                                        TAVAudioSessionRouteDescription = class
                                        (TOCGenericImport<
                                        AVAudioSessionRouteDescriptionClass,
                                        AVAudioSessionRouteDescription>)
                                        end;
                                        PAVAudioSessionRouteDescription =
                                        Pointer;

                                        AVAudioSessionDataSourceDescriptionClass =
                                        interface(NSObjectClass)
                                        ['{8DF1D38B-4810-4A24-B827-06FDEF0BF47C}']
                                        end;
                                        AVAudioSessionDataSourceDescription =
                                        interface(NSObject)
                                        ['{0AB178DB-7F77-4795-AEBA-8D79CCC9FC97}']
                                        function dataSourceID: NSNumber;
                                        cdecl;
                                        function dataSourceName
                                        : NSString; cdecl;
                                        function location: NSString; cdecl;
                                        function orientation: NSString; cdecl;
                                        function supportedPolarPatterns
                                        : NSArray; cdecl;
                                        function selectedPolarPattern
                                        : NSString; cdecl;
                                        function preferredPolarPattern
                                        : NSString; cdecl;
                                        function setPreferredPolarPattern
                                        (pattern: NSString; error: NSError)
                                        : Boolean; cdecl;
                                        end;

                                        TAVAudioSessionDataSourceDescription =
                                        class(TOCGenericImport<
                                        AVAudioSessionDataSourceDescriptionClass,
                                        AVAudioSessionDataSourceDescription>)
                                        end;
                                        PAVAudioSessionDataSourceDescription =
                                        Pointer;

                                        AVAudioSessionClass = interface
                                        (NSObjectClass)
                                        ['{3EDA465D-37AE-4364-9BB0-944492493639}']
                                        { class } function sharedInstance
                                        : AVAudioSession;
                                        cdecl;
                                        end;
                                        AVAudioSession = interface(NSObject)
                                        ['{77E8C63F-AA3B-44A7-8745-B01069D2EC43}']
                                        [MethodName('setActive:error:')]
                                        function setActiveError(active: Boolean;
                                        error: NSError): Boolean;
                                        cdecl;
                                        [MethodName
                                        ('setActive:withOptions:error:')]
                                        function setActiveWithOptionsError
                                        (active: Boolean;
                                        withOptions
                                        : AVAudioSessionSetActiveOptions;
                                        error: NSError): Boolean; cdecl;
                                        function availableCategories
                                        : NSArray; cdecl;
                                        [MethodName('setCategory:error:')]
                                        function setCategoryError
                                        (category: NSString; error: NSError)
                                        : Boolean; cdecl;
                                        [MethodName
                                        ('setCategory:withOptions:error:')]
                                        function setCategoryWithOptionsError
                                        (category: NSString;
                                        withOptions
                                        : AVAudioSessionCategoryOptions;
                                        error: NSError): Boolean; cdecl;
                                        function category: NSString; cdecl;
                                        function recordPermission
                                        : AVAudioSessionRecordPermission; cdecl;
                                        procedure requestRecordPermission
                                        (response: PermissionBlock); cdecl;
                                        function categoryOptions
                                        : AVAudioSessionCategoryOptions; cdecl;
                                        function availableModes: NSArray; cdecl;
                                        function setMode(mode: NSString;
                                        error: NSError): Boolean; cdecl;
                                        function mode: NSString; cdecl;
                                        function overrideOutputAudioPort
                                        (portOverride
                                        : AVAudioSessionPortOverride;
                                        error: NSError): Boolean; cdecl;
                                        function isOtherAudioPlaying
                                        : Boolean; cdecl;
                                        function secondaryAudioShouldBeSilencedHint
                                        : Boolean; cdecl;
                                        function currentRoute
                                        : AVAudioSessionRouteDescription; cdecl;
                                        function setPreferredInput
                                        (inPort: AVAudioSessionPortDescription;
                                        error: NSError): Boolean; cdecl;
                                        function preferredInput
                                        : AVAudioSessionPortDescription; cdecl;
                                        function availableInputs
                                        : NSArray; cdecl;
                                        function setPreferredSampleRate
                                        (sampleRate: Double; error: NSError)
                                        : Boolean; cdecl;
                                        function preferredSampleRate
                                        : Double; cdecl;
                                        function setPreferredIOBufferDuration
                                        (duration: NSTimeInterval;
                                        error: NSError): Boolean; cdecl;
                                        function preferredIOBufferDuration
                                        : NSTimeInterval; cdecl;
                                        function setPreferredInputNumberOfChannels
                                        (count: NSInteger; error: NSError)
                                        : Boolean; cdecl;
                                        function preferredInputNumberOfChannels
                                        : NSInteger; cdecl;
                                        function setPreferredOutputNumberOfChannels
                                        (count: NSInteger; error: NSError)
                                        : Boolean; cdecl;
                                        function preferredOutputNumberOfChannels
                                        : NSInteger; cdecl;
                                        function maximumInputNumberOfChannels
                                        : NSInteger; cdecl;
                                        function maximumOutputNumberOfChannels
                                        : NSInteger; cdecl;
                                        function setInputGain(gain: Single;
                                        error: NSError): Boolean; cdecl;
                                        function inputGain: Single; cdecl;
                                        function isInputGainSettable
                                        : Boolean; cdecl;
                                        function isInputAvailable
                                        : Boolean; cdecl;
                                        function inputDataSources
                                        : NSArray; cdecl;
                                        function inputDataSource
                                        : AVAudioSessionDataSourceDescription;
                                        cdecl;
                                        function setInputDataSource
                                        (dataSource
                                        : AVAudioSessionDataSourceDescription;
                                        error: NSError): Boolean; cdecl;
                                        function outputDataSources
                                        : NSArray; cdecl;
                                        function outputDataSource
                                        : AVAudioSessionDataSourceDescription;
                                        cdecl;
                                        function setOutputDataSource
                                        (dataSource
                                        : AVAudioSessionDataSourceDescription;
                                        error: NSError): Boolean; cdecl;
                                        function sampleRate: Double; cdecl;
                                        function inputNumberOfChannels
                                        : NSInteger; cdecl;
                                        function outputNumberOfChannels
                                        : NSInteger; cdecl;
                                        function outputVolume: Single; cdecl;
                                        function inputLatency
                                        : NSTimeInterval; cdecl;
                                        function outputLatency
                                        : NSTimeInterval; cdecl;
                                        function IOBufferDuration
                                        : NSTimeInterval; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        [MethodName
                                        ('setActive:withFlags:error:')]
                                        function setActiveWithFlagsError
                                        (active: Boolean; withFlags: NSInteger;
                                        error: NSError): Boolean; cdecl;
                                        function inputIsAvailable
                                        : Boolean; cdecl;
                                        function currentHardwareSampleRate
                                        : Double; cdecl;
                                        function currentHardwareInputNumberOfChannels
                                        : NSInteger; cdecl;
                                        function currentHardwareOutputNumberOfChannels
                                        : NSInteger; cdecl;
                                        function setPreferredHardwareSampleRate
                                        (sampleRate: Double; error: NSError)
                                        : Boolean; cdecl;
                                        function preferredHardwareSampleRate
                                        : Double; cdecl;
                                        end;

                                        TAVAudioSession = class
                                        (TOCGenericImport<AVAudioSessionClass,
                                        AVAudioSession>)
                                        end;
                                        PAVAudioSession = Pointer;

                                        AVAudioUnitComponentClass = interface
                                        (NSObjectClass)
                                        ['{63ABBEEA-34D3-4534-8DCF-F5F282964E89}']
                                        end;
                                        AVAudioUnitComponent = interface
                                        (NSObject)
                                        ['{D6CD2231-2DAF-4F48-800F-79A0CAC14619}']
                                        function name: NSString;
                                        cdecl;
                                        function typeName: NSString; cdecl;
                                        function localizedTypeName
                                        : NSString; cdecl;
                                        function manufacturerName
                                        : NSString; cdecl;
                                        function version: NSUInteger; cdecl;
                                        function versionString: NSString; cdecl;
                                        function componentURL: NSURL; cdecl;
                                        function availableArchitectures
                                        : NSArray; cdecl;
                                        function isSandboxSafe: Boolean; cdecl;
                                        function hasMIDIInput: Boolean; cdecl;
                                        function hasMIDIOutput: Boolean; cdecl;
                                        function AudioComponent
                                        : AudioComponent; cdecl;
                                        procedure setUserTagNames
                                        (userTagNames: NSArray); cdecl;
                                        function userTagNames: NSArray; cdecl;
                                        function allTagNames: NSArray; cdecl;
                                        function AudioComponentDescription
                                        : AudioComponentDescription; cdecl;
                                        function iconURL: NSURL; cdecl;
                                        function passesAUVal: Boolean; cdecl;
                                        function hasCustomView: Boolean; cdecl;
                                        function configurationDictionary
                                        : NSDictionary; cdecl;
                                        function supportsNumberInputChannels
                                        (numInputChannels: NSInteger;
                                        outputChannels: NSInteger)
                                        : Boolean; cdecl;
                                        end;

                                        TAVAudioUnitComponent = class
                                        (TOCGenericImport<
                                        AVAudioUnitComponentClass,
                                        AVAudioUnitComponent>)
                                        end;
                                        PAVAudioUnitComponent = Pointer;

                                        AVAudioUnitComponentManagerClass =
                                        interface(NSObjectClass)
                                        ['{6908151F-6620-418D-A711-E17E24A8D9B0}']
                                        { class } function
                                        sharedAudioUnitComponentManager
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVAudioUnitComponentManager = interface
                                        (NSObject)
                                        ['{EDC5D9F8-3884-4B92-A695-085C99A1335C}']
                                        function tagNames: NSArray;
                                        cdecl;
                                        function standardLocalizedTagNames
                                        : NSArray; cdecl;
                                        function componentsMatchingPredicate
                                        (predicate: NSPredicate)
                                        : NSArray; cdecl;
                                        function componentsPassingTest
                                        (testHandler: TAVFoundationTestHandler)
                                        : NSArray; cdecl;
                                        function componentsMatchingDescription
                                        (desc: AudioComponentDescription)
                                        : NSArray; cdecl;
                                        end;

                                        TAVAudioUnitComponentManager = class
                                        (TOCGenericImport<
                                        AVAudioUnitComponentManagerClass,
                                        AVAudioUnitComponentManager>)
                                        end;
                                        PAVAudioUnitComponentManager = Pointer;

                                        AVAudioUnitDelayClass = interface
                                        (AVAudioUnitEffectClass)
                                        ['{A1578284-19A0-4FFB-BFC8-5D54AD7CDAF1}']
                                        end;
                                        AVAudioUnitDelay = interface
                                        (AVAudioUnitEffect)
                                        ['{B3B4B42F-FC32-467B-BFE5-4EE89B4B6372}']
                                        procedure setDelayTime
                                        (delayTime: NSTimeInterval);
                                        cdecl;
                                        function delayTime
                                        : NSTimeInterval; cdecl;
                                        procedure setFeedback
                                        (feedback: Single); cdecl;
                                        function feedback: Single; cdecl;
                                        procedure setLowPassCutoff
                                        (lowPassCutoff: Single); cdecl;
                                        function lowPassCutoff: Single; cdecl;
                                        procedure setWetDryMix
                                        (wetDryMix: Single); cdecl;
                                        function wetDryMix: Single; cdecl;
                                        end;

                                        TAVAudioUnitDelay = class
                                        (TOCGenericImport<AVAudioUnitDelayClass,
                                        AVAudioUnitDelay>)
                                        end;
                                        PAVAudioUnitDelay = Pointer;

                                        AVAudioUnitDistortionClass = interface
                                        (AVAudioUnitEffectClass)
                                        ['{2395BB8D-C10B-4C53-90DF-1D84E7954232}']
                                        end;
                                        AVAudioUnitDistortion = interface
                                        (AVAudioUnitEffect)
                                        ['{473AC1D2-D9A4-4C71-ACE1-17D2CD4971F7}']
                                        procedure loadFactoryPreset
                                        (preset: AVAudioUnitDistortionPreset);
                                        cdecl;
                                        procedure setPreGain
                                        (preGain: Single); cdecl;
                                        function preGain: Single; cdecl;
                                        procedure setWetDryMix
                                        (wetDryMix: Single); cdecl;
                                        function wetDryMix: Single; cdecl;
                                        end;

                                        TAVAudioUnitDistortion = class
                                        (TOCGenericImport<
                                        AVAudioUnitDistortionClass,
                                        AVAudioUnitDistortion>)
                                        end;
                                        PAVAudioUnitDistortion = Pointer;

                                        AVAudioUnitGeneratorClass = interface
                                        (AVAudioUnitClass)
                                        ['{3C1571E1-289A-4F8B-8701-951D48236852}']
                                        end;
                                        AVAudioUnitGenerator = interface
                                        (AVAudioUnit)
                                        ['{9340F629-DCC0-4846-80FC-9FC8479B311D}']
                                        function initWithAudioComponentDescription
                                        (AudioComponentDescription
                                        : AudioComponentDescription)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setBypass
                                        (bypass: Boolean); cdecl;
                                        function bypass: Boolean; cdecl;
                                        end;

                                        TAVAudioUnitGenerator = class
                                        (TOCGenericImport<
                                        AVAudioUnitGeneratorClass,
                                        AVAudioUnitGenerator>)
                                        end;
                                        PAVAudioUnitGenerator = Pointer;

                                        AVAudioUnitMIDIInstrumentClass =
                                        interface(AVAudioUnitClass)
                                        ['{5E1A1CA6-450F-402E-87DD-5CD61502D2F7}']
                                        end;
                                        AVAudioUnitMIDIInstrument = interface
                                        (AVAudioUnit)
                                        ['{D77DB194-CBBE-4AD7-A2BE-D50FB90FDCDF}']
                                        function initWithAudioComponentDescription
                                        (description: AudioComponentDescription)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure startNote(note: Byte;
                                        withVelocity: Byte;
                                        onChannel: Byte); cdecl;
                                        procedure stopNote(note: Byte;
                                        onChannel: Byte); cdecl;
                                        procedure sendController
                                        (controller: Byte; withValue: Byte;
                                        onChannel: Byte); cdecl;
                                        procedure sendPitchBend(pitchbend: Word;
                                        onChannel: Byte); cdecl;
                                        procedure sendPressure(pressure: Byte;
                                        onChannel: Byte); cdecl;
                                        procedure sendPressureForKey(key: Byte;
                                        withValue: Byte;
                                        onChannel: Byte); cdecl;
                                        [MethodName
                                        ('sendProgramChange:onChannel:')]
                                        procedure sendProgramChangeOnChannel
                                        (&program: Byte;
                                        onChannel: Byte); cdecl;
                                        [MethodName
                                        ('sendProgramChange:bankMSB:bankLSB:onChannel:')
                                        ]
                                        procedure sendProgramChangeBankMSBBankLSBOnChannel
                                        (&program: Byte; bankMSB: Byte;
                                        bankLSB: Byte; onChannel: Byte); cdecl;
                                        [MethodName
                                        ('sendMIDIEvent:data1:data2:')]
                                        procedure sendMIDIEventData1Data2
                                        (midiStatus: Byte; data1: Byte;
                                        data2: Byte); cdecl;
                                        [MethodName('sendMIDIEvent:data1:')]
                                        procedure sendMIDIEventData1
                                        (midiStatus: Byte; data1: Byte); cdecl;
                                        procedure sendMIDISysExEvent
                                        (midiData: NSData); cdecl;
                                        end;

                                        TAVAudioUnitMIDIInstrument = class
                                        (TOCGenericImport<
                                        AVAudioUnitMIDIInstrumentClass,
                                        AVAudioUnitMIDIInstrument>)
                                        end;
                                        PAVAudioUnitMIDIInstrument = Pointer;

                                        AVAudioUnitSamplerClass = interface
                                        (AVAudioUnitMIDIInstrumentClass)
                                        ['{BA52A07F-5225-42A3-84C7-BA247E492EF7}']
                                        end;
                                        AVAudioUnitSampler = interface
                                        (AVAudioUnitMIDIInstrument)
                                        ['{6982A9AC-6C55-40AB-8BD9-3E0892440BE0}']
                                        function loadSoundBankInstrumentAtURL
                                        (bankURL: NSURL; &program: Byte;
                                        bankMSB: Byte; bankLSB: Byte;
                                        error: NSError): Boolean;
                                        cdecl;
                                        function loadInstrumentAtURL
                                        (instrumentURL: NSURL; error: NSError)
                                        : Boolean; cdecl;
                                        function loadAudioFilesAtURLs
                                        (audioFiles: NSArray; error: NSError)
                                        : Boolean; cdecl;
                                        procedure setStereoPan
                                        (stereoPan: Single); cdecl;
                                        function stereoPan: Single; cdecl;
                                        procedure setMasterGain
                                        (masterGain: Single); cdecl;
                                        function masterGain: Single; cdecl;
                                        procedure setGlobalTuning
                                        (globalTuning: Single); cdecl;
                                        function globalTuning: Single; cdecl;
                                        end;

                                        TAVAudioUnitSampler = class
                                        (TOCGenericImport<
                                        AVAudioUnitSamplerClass,
                                        AVAudioUnitSampler>)
                                        end;
                                        PAVAudioUnitSampler = Pointer;

                                        AVAudioUnitTimeEffectClass = interface
                                        (AVAudioUnitClass)
                                        ['{6A2231DD-1A56-4928-BDFA-7ED6792BD168}']
                                        end;
                                        AVAudioUnitTimeEffect = interface
                                        (AVAudioUnit)
                                        ['{4E4ECC19-D94B-4A0B-9DCF-BB46D8F0963A}']
                                        function initWithAudioComponentDescription
                                        (AudioComponentDescription
                                        : AudioComponentDescription)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setBypass
                                        (bypass: Boolean); cdecl;
                                        function bypass: Boolean; cdecl;
                                        end;

                                        TAVAudioUnitTimeEffect = class
                                        (TOCGenericImport<
                                        AVAudioUnitTimeEffectClass,
                                        AVAudioUnitTimeEffect>)
                                        end;
                                        PAVAudioUnitTimeEffect = Pointer;

                                        AVAudioUnitTimePitchClass = interface
                                        (AVAudioUnitTimeEffectClass)
                                        ['{FD87E01D-D26C-43BD-BC43-8D53AA0988D7}']
                                        end;
                                        AVAudioUnitTimePitch = interface
                                        (AVAudioUnitTimeEffect)
                                        ['{AED8FC2D-C28A-452B-8BD5-C777706E3A56}']
                                        procedure setRate(rate: Single);
                                        cdecl;
                                        function rate: Single; cdecl;
                                        procedure setPitch
                                        (pitch: Single); cdecl;
                                        function pitch: Single; cdecl;
                                        procedure setOverlap
                                        (overlap: Single); cdecl;
                                        function overlap: Single; cdecl;
                                        end;

                                        TAVAudioUnitTimePitch = class
                                        (TOCGenericImport<
                                        AVAudioUnitTimePitchClass,
                                        AVAudioUnitTimePitch>)
                                        end;
                                        PAVAudioUnitTimePitch = Pointer;

                                        AVAudioUnitVarispeedClass = interface
                                        (AVAudioUnitTimeEffectClass)
                                        ['{E893152F-B3C5-4066-ACB2-84F77A67F68B}']
                                        end;
                                        AVAudioUnitVarispeed = interface
                                        (AVAudioUnitTimeEffect)
                                        ['{B6FA748E-2EC0-49EB-9CED-25F9293E13B0}']
                                        procedure setRate(rate: Single);
                                        cdecl;
                                        function rate: Single; cdecl;
                                        end;

                                        TAVAudioUnitVarispeed = class
                                        (TOCGenericImport<
                                        AVAudioUnitVarispeedClass,
                                        AVAudioUnitVarispeed>)
                                        end;
                                        PAVAudioUnitVarispeed = Pointer;

                                        AVCaptureDeviceFormatClass = interface
                                        (NSObjectClass)
                                        ['{6F7282A2-44D7-4BB9-8192-4CAA13A0BCBA}']
                                        end;
                                        AVCaptureDeviceFormat = interface
                                        (NSObject)
                                        ['{ACEFE156-FC15-4AAF-BE63-C62DC479424A}']
                                        function mediaType: NSString;
                                        cdecl;
                                        function formatDescription
                                        : CMFormatDescriptionRef; cdecl;
                                        function videoSupportedFrameRateRanges
                                        : NSArray; cdecl;
                                        function videoFieldOfView
                                        : Single; cdecl;
                                        function isVideoBinned: Boolean; cdecl;
                                        function isVideoStabilizationModeSupported
                                        (videoStabilizationMode
                                        : AVCaptureVideoStabilizationMode)
                                        : Boolean; cdecl;
                                        function isVideoStabilizationSupported
                                        : Boolean; cdecl;
                                        function videoMaxZoomFactor
                                        : CGFloat; cdecl;
                                        function videoZoomFactorUpscaleThreshold
                                        : CGFloat; cdecl;
                                        function minExposureDuration
                                        : CMTime; cdecl;
                                        function maxExposureDuration
                                        : CMTime; cdecl;
                                        function minISO: Single; cdecl;
                                        function maxISO: Single; cdecl;
                                        function isVideoHDRSupported
                                        : Boolean; cdecl;
                                        function highResolutionStillImageDimensions
                                        : CMVideoDimensions; cdecl;
                                        function autoFocusSystem
                                        : AVCaptureAutoFocusSystem; cdecl;
                                        end;

                                        TAVCaptureDeviceFormat = class
                                        (TOCGenericImport<
                                        AVCaptureDeviceFormatClass,
                                        AVCaptureDeviceFormat>)
                                        end;
                                        PAVCaptureDeviceFormat = Pointer;

                                        AVCaptureDeviceClass = interface
                                        (NSObjectClass)
                                        ['{ACBC6773-6B13-458C-8B05-AB85DCDD6A9A}']
                                        { class } function devices: NSArray;
                                        cdecl;
                                        { class } function devicesWithMediaType
                                        (mediaType: NSString): NSArray; cdecl;
                                        { class } function
                                        defaultDeviceWithMediaType
                                        (mediaType: NSString)
                                        : AVCaptureDevice; cdecl;
                                        { class } function deviceWithUniqueID
                                        (deviceUniqueID: NSString)
                                        : AVCaptureDevice; cdecl;
                                        { class } function
                                        authorizationStatusForMediaType
                                        (mediaType: NSString)
                                        : AVAuthorizationStatus; cdecl;
                                        { class } procedure
                                        requestAccessForMediaType
                                        (mediaType: NSString;
                                        completionHandler
                                        : TAVFoundationCompletionHandler1);
                                        cdecl;
                                        end;
                                        AVCaptureDevice = interface(NSObject)
                                        ['{43EC15AE-5A42-4D47-8BB8-4B47BAA57CFB}']
                                        function uniqueID: NSString;
                                        cdecl;
                                        function modelID: NSString; cdecl;
                                        function localizedName: NSString; cdecl;
                                        function hasMediaType
                                        (mediaType: NSString): Boolean; cdecl;
                                        function lockForConfiguration
                                        (outError: NSError): Boolean; cdecl;
                                        procedure unlockForConfiguration; cdecl;
                                        function supportsAVCaptureSessionPreset
                                        (preset: NSString): Boolean; cdecl;
                                        function isConnected: Boolean; cdecl;
                                        function formats: NSArray; cdecl;
                                        procedure setActiveFormat
                                        (activeFormat
                                        : AVCaptureDeviceFormat); cdecl;
                                        function activeFormat
                                        : AVCaptureDeviceFormat; cdecl;
                                        procedure setActiveVideoMinFrameDuration
                                        (activeVideoMinFrameDuration
                                        : CMTime); cdecl;
                                        function activeVideoMinFrameDuration
                                        : CMTime; cdecl;
                                        procedure setActiveVideoMaxFrameDuration
                                        (activeVideoMaxFrameDuration
                                        : CMTime); cdecl;
                                        function activeVideoMaxFrameDuration
                                        : CMTime; cdecl;
                                        function position
                                        : AVCaptureDevicePosition; cdecl;
                                        function hasFlash: Boolean; cdecl;
                                        function isFlashAvailable
                                        : Boolean; cdecl;
                                        function isFlashActive: Boolean; cdecl;
                                        function isFlashModeSupported
                                        (flashMode: AVCaptureFlashMode)
                                        : Boolean; cdecl;
                                        procedure setFlashMode
                                        (flashMode: AVCaptureFlashMode); cdecl;
                                        function flashMode
                                        : AVCaptureFlashMode; cdecl;
                                        function hasTorch: Boolean; cdecl;
                                        function isTorchAvailable
                                        : Boolean; cdecl;
                                        function isTorchActive: Boolean; cdecl;
                                        function torchLevel: Single; cdecl;
                                        function isTorchModeSupported
                                        (torchMode: AVCaptureTorchMode)
                                        : Boolean; cdecl;
                                        procedure setTorchMode
                                        (torchMode: AVCaptureTorchMode); cdecl;
                                        function torchMode
                                        : AVCaptureTorchMode; cdecl;
                                        function setTorchModeOnWithLevel
                                        (torchLevel: Single; error: NSError)
                                        : Boolean; cdecl;
                                        function isFocusModeSupported
                                        (focusMode: AVCaptureFocusMode)
                                        : Boolean; cdecl;
                                        procedure setFocusMode
                                        (focusMode: AVCaptureFocusMode); cdecl;
                                        function focusMode
                                        : AVCaptureFocusMode; cdecl;
                                        function isFocusPointOfInterestSupported
                                        : Boolean; cdecl;
                                        procedure setFocusPointOfInterest
                                        (focusPointOfInterest: CGPoint); cdecl;
                                        function focusPointOfInterest
                                        : CGPoint; cdecl;
                                        function isAdjustingFocus
                                        : Boolean; cdecl;
                                        function isAutoFocusRangeRestrictionSupported
                                        : Boolean; cdecl;
                                        procedure setAutoFocusRangeRestriction
                                        (autoFocusRangeRestriction
                                        : AVCaptureAutoFocusRangeRestriction);
                                        cdecl;
                                        function autoFocusRangeRestriction
                                        : AVCaptureAutoFocusRangeRestriction;
                                        cdecl;
                                        function isSmoothAutoFocusSupported
                                        : Boolean; cdecl;
                                        procedure setSmoothAutoFocusEnabled
                                        (smoothAutoFocusEnabled
                                        : Boolean); cdecl;
                                        function isSmoothAutoFocusEnabled
                                        : Boolean; cdecl;
                                        function lensPosition: Single; cdecl;
                                        procedure setFocusModeLockedWithLensPosition
                                        (lensPosition: Single;
                                        completionHandler
                                        : TAVFoundationCompletionHandler3);
                                        cdecl;
                                        function isExposureModeSupported
                                        (exposureMode: AVCaptureExposureMode)
                                        : Boolean; cdecl;
                                        procedure setExposureMode
                                        (exposureMode
                                        : AVCaptureExposureMode); cdecl;
                                        function exposureMode
                                        : AVCaptureExposureMode; cdecl;
                                        function isExposurePointOfInterestSupported
                                        : Boolean; cdecl;
                                        procedure setExposurePointOfInterest
                                        (exposurePointOfInterest
                                        : CGPoint); cdecl;
                                        function exposurePointOfInterest
                                        : CGPoint; cdecl;
                                        function isAdjustingExposure
                                        : Boolean; cdecl;
                                        function lensAperture: Single; cdecl;
                                        function exposureDuration
                                        : CMTime; cdecl;
                                        function ISO: Single; cdecl;
                                        procedure setExposureModeCustomWithDuration
                                        (duration: CMTime; ISO: Single;
                                        completionHandler
                                        : TAVFoundationCompletionHandler3);
                                        cdecl;
                                        function exposureTargetOffset
                                        : Single; cdecl;
                                        function exposureTargetBias
                                        : Single; cdecl;
                                        function minExposureTargetBias
                                        : Single; cdecl;
                                        function maxExposureTargetBias
                                        : Single; cdecl;
                                        procedure setExposureTargetBias
                                        (bias: Single;
                                        completionHandler
                                        : TAVFoundationCompletionHandler3);
                                        cdecl;
                                        function isWhiteBalanceModeSupported
                                        (whiteBalanceMode
                                        : AVCaptureWhiteBalanceMode)
                                        : Boolean; cdecl;
                                        procedure setWhiteBalanceMode
                                        (whiteBalanceMode
                                        : AVCaptureWhiteBalanceMode); cdecl;
                                        function whiteBalanceMode
                                        : AVCaptureWhiteBalanceMode; cdecl;
                                        function isAdjustingWhiteBalance
                                        : Boolean; cdecl;
                                        function deviceWhiteBalanceGains
                                        : AVCaptureWhiteBalanceGains; cdecl;
                                        function grayWorldDeviceWhiteBalanceGains
                                        : AVCaptureWhiteBalanceGains; cdecl;
                                        function maxWhiteBalanceGain
                                        : Single; cdecl;
                                        procedure setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains
                                        (whiteBalanceGains
                                        : AVCaptureWhiteBalanceGains;
                                        completionHandler
                                        : TAVFoundationCompletionHandler3);
                                        cdecl;
                                        function chromaticityValuesForDeviceWhiteBalanceGains
                                        (whiteBalanceGains
                                        : AVCaptureWhiteBalanceGains)
                                        : AVCaptureWhiteBalanceChromaticityValues;
                                        cdecl;
                                        function deviceWhiteBalanceGainsForChromaticityValues
                                        (chromaticityValues
                                        : AVCaptureWhiteBalanceChromaticityValues)
                                        : AVCaptureWhiteBalanceGains; cdecl;
                                        function temperatureAndTintValuesForDeviceWhiteBalanceGains
                                        (whiteBalanceGains
                                        : AVCaptureWhiteBalanceGains)
                                        : AVCaptureWhiteBalanceTemperatureAndTintValues;
                                        cdecl;
                                        function deviceWhiteBalanceGainsForTemperatureAndTintValues
                                        (tempAndTintValues
                                        : AVCaptureWhiteBalanceTemperatureAndTintValues)
                                        : AVCaptureWhiteBalanceGains; cdecl;
                                        procedure setSubjectAreaChangeMonitoringEnabled
                                        (subjectAreaChangeMonitoringEnabled
                                        : Boolean); cdecl;
                                        function isSubjectAreaChangeMonitoringEnabled
                                        : Boolean; cdecl;
                                        function isLowLightBoostSupported
                                        : Boolean; cdecl;
                                        function isLowLightBoostEnabled
                                        : Boolean; cdecl;
                                        procedure setAutomaticallyEnablesLowLightBoostWhenAvailable
                                        (automaticallyEnablesLowLightBoostWhenAvailable
                                        : Boolean); cdecl;
                                        function automaticallyEnablesLowLightBoostWhenAvailable
                                        : Boolean; cdecl;
                                        procedure setVideoZoomFactor
                                        (videoZoomFactor: CGFloat); cdecl;
                                        function videoZoomFactor
                                        : CGFloat; cdecl;
                                        procedure rampToVideoZoomFactor
                                        (factor: CGFloat;
                                        withRate: Single); cdecl;
                                        function isRampingVideoZoom
                                        : Boolean; cdecl;
                                        procedure cancelVideoZoomRamp; cdecl;
                                        procedure setAutomaticallyAdjustsVideoHDREnabled
                                        (automaticallyAdjustsVideoHDREnabled
                                        : Boolean); cdecl;
                                        function automaticallyAdjustsVideoHDREnabled
                                        : Boolean; cdecl;
                                        procedure setVideoHDREnabled
                                        (videoHDREnabled: Boolean); cdecl;
                                        function isVideoHDREnabled
                                        : Boolean; cdecl;
                                        end;

                                        TAVCaptureDevice = class
                                        (TOCGenericImport<AVCaptureDeviceClass,
                                        AVCaptureDevice>)
                                        end;
                                        PAVCaptureDevice = Pointer;

                                        AVFrameRateRangeClass = interface
                                        (NSObjectClass)
                                        ['{F5D04057-A3D9-45C6-A15E-20971E010602}']
                                        end;
                                        AVFrameRateRange = interface(NSObject)
                                        ['{D3F12A71-631F-430C-984A-2B35EA22C61E}']
                                        function minFrameRate: Double;
                                        cdecl;
                                        function maxFrameRate: Double; cdecl;
                                        function maxFrameDuration
                                        : CMTime; cdecl;
                                        function minFrameDuration
                                        : CMTime; cdecl;
                                        end;

                                        TAVFrameRateRange = class
                                        (TOCGenericImport<AVFrameRateRangeClass,
                                        AVFrameRateRange>)
                                        end;
                                        PAVFrameRateRange = Pointer;

                                        AVCaptureInputPortClass = interface
                                        (NSObjectClass)
                                        ['{8132D3CA-BB5E-4200-B794-0E7BEBCF10BC}']
                                        end;
                                        AVCaptureInputPort = interface(NSObject)
                                        ['{E72F4EFC-2C89-401C-99A6-714DB3C950F9}']
                                        function input: AVCaptureInput;
                                        cdecl;
                                        function mediaType: NSString; cdecl;
                                        function formatDescription
                                        : CMFormatDescriptionRef; cdecl;
                                        procedure setEnabled
                                        (enabled: Boolean); cdecl;
                                        function isEnabled: Boolean; cdecl;
                                        function clock: CMClockRef; cdecl;
                                        end;

                                        TAVCaptureInputPort = class
                                        (TOCGenericImport<
                                        AVCaptureInputPortClass,
                                        AVCaptureInputPort>)
                                        end;
                                        PAVCaptureInputPort = Pointer;

                                        AVCaptureInputClass = interface
                                        (NSObjectClass)
                                        ['{87CA3380-A634-4895-8795-F735D414252F}']
                                        end;
                                        AVCaptureInput = interface(NSObject)
                                        ['{63436FBD-9D7D-42A1-9209-923DD4A1874B}']
                                        function ports: NSArray;
                                        cdecl;
                                        end;

                                        TAVCaptureInput = class
                                        (TOCGenericImport<AVCaptureInputClass,
                                        AVCaptureInput>)
                                        end;
                                        PAVCaptureInput = Pointer;

                                        AVCaptureDeviceInputClass = interface
                                        (AVCaptureInputClass)
                                        ['{2F8B27DF-13F6-4CC5-BA56-CD92709CC3EF}']
                                        { class } function deviceInputWithDevice
                                        (device: AVCaptureDevice;
                                        error: NSError)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVCaptureDeviceInput = interface
                                        (AVCaptureInput)
                                        ['{39E5A139-D779-461D-9739-15256EC8BDDC}']
                                        function initWithDevice
                                        (device: AVCaptureDevice;
                                        error: NSError)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function device: AVCaptureDevice; cdecl;
                                        end;

                                        TAVCaptureDeviceInput = class
                                        (TOCGenericImport<
                                        AVCaptureDeviceInputClass,
                                        AVCaptureDeviceInput>)
                                        end;
                                        PAVCaptureDeviceInput = Pointer;

                                        AVCaptureMetadataInputClass = interface
                                        (AVCaptureInputClass)
                                        ['{904177D7-9F78-43F8-886A-703A752DEEFF}']
                                        { class } function
                                        metadataInputWithFormatDescription
                                        (desc: CMMetadataFormatDescriptionRef;
                                        clock: CMClockRef)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVCaptureMetadataInput = interface
                                        (AVCaptureInput)
                                        ['{7E72F97C-3CA2-4FAD-8304-0D2023ACB418}']
                                        function initWithFormatDescription
                                        (desc: CMMetadataFormatDescriptionRef;
                                        clock: CMClockRef)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function appendTimedMetadataGroup
                                        (metadata: AVTimedMetadataGroup;
                                        error: NSError): Boolean; cdecl;
                                        end;

                                        TAVCaptureMetadataInput = class
                                        (TOCGenericImport<
                                        AVCaptureMetadataInputClass,
                                        AVCaptureMetadataInput>)
                                        end;
                                        PAVCaptureMetadataInput = Pointer;

                                        AVCaptureOutputClass = interface
                                        (NSObjectClass)
                                        ['{3068F1A0-B555-446D-8F5A-B7A0AB929394}']
                                        end;
                                        AVCaptureOutput = interface(NSObject)
                                        ['{3D064C39-6C49-47FB-8781-4290364B000E}']
                                        function connections: NSArray;
                                        cdecl;
                                        function connectionWithMediaType
                                        (mediaType: NSString)
                                        : AVCaptureConnection; cdecl;
                                        function transformedMetadataObjectForMetadataObject
                                        (metadataObject: AVMetadataObject;
                                        connection: AVCaptureConnection)
                                        : AVMetadataObject; cdecl;
                                        function metadataOutputRectOfInterestForRect
                                        (rectInOutputCoordinates: CGRect)
                                        : CGRect; cdecl;
                                        function rectForMetadataOutputRectOfInterest
                                        (rectInMetadataOutputCoordinates
                                        : CGRect): CGRect; cdecl;
                                        end;

                                        TAVCaptureOutput = class
                                        (TOCGenericImport<AVCaptureOutputClass,
                                        AVCaptureOutput>)
                                        end;
                                        PAVCaptureOutput = Pointer;

                                        AVCaptureConnectionClass = interface
                                        (NSObjectClass)
                                        ['{A8A5E9DA-1621-4A3B-AD04-6B77C7AD49A0}']
                                        { class } function
                                        connectionWithInputPorts(ports: NSArray;
                                        output: AVCaptureOutput)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        connectionWithInputPort
                                        (port: AVCaptureInputPort;
                                        videoPreviewLayer
                                        : AVCaptureVideoPreviewLayer)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        AVCaptureConnection = interface
                                        (NSObject)
                                        ['{B52EC346-1A52-41A9-8E24-F3487D297772}']
                                        function initWithInputPorts
                                        (ports: NSArray;
                                        output: AVCaptureOutput)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithInputPort
                                        (port: AVCaptureInputPort;
                                        videoPreviewLayer
                                        : AVCaptureVideoPreviewLayer)
                                        : Pointer { instancetype }; cdecl;
                                        function inputPorts: NSArray; cdecl;
                                        function output: AVCaptureOutput; cdecl;
                                        function videoPreviewLayer
                                        : AVCaptureVideoPreviewLayer; cdecl;
                                        procedure setEnabled
                                        (enabled: Boolean); cdecl;
                                        function isEnabled: Boolean; cdecl;
                                        function isActive: Boolean; cdecl;
                                        function audioChannels: NSArray; cdecl;
                                        function isVideoMirroringSupported
                                        : Boolean; cdecl;
                                        procedure setVideoMirrored
                                        (videoMirrored: Boolean); cdecl;
                                        function isVideoMirrored
                                        : Boolean; cdecl;
                                        procedure setAutomaticallyAdjustsVideoMirroring
                                        (automaticallyAdjustsVideoMirroring
                                        : Boolean); cdecl;
                                        function automaticallyAdjustsVideoMirroring
                                        : Boolean; cdecl;
                                        function isVideoOrientationSupported
                                        : Boolean; cdecl;
                                        procedure setVideoOrientation
                                        (videoOrientation
                                        : AVCaptureVideoOrientation); cdecl;
                                        function videoOrientation
                                        : AVCaptureVideoOrientation; cdecl;
                                        function isVideoMinFrameDurationSupported
                                        : Boolean; cdecl;
                                        procedure setVideoMinFrameDuration
                                        (videoMinFrameDuration: CMTime); cdecl;
                                        function videoMinFrameDuration
                                        : CMTime; cdecl;
                                        function isVideoMaxFrameDurationSupported
                                        : Boolean; cdecl;
                                        procedure setVideoMaxFrameDuration
                                        (videoMaxFrameDuration: CMTime); cdecl;
                                        function videoMaxFrameDuration
                                        : CMTime; cdecl;
                                        function videoMaxScaleAndCropFactor
                                        : CGFloat; cdecl;
                                        procedure setVideoScaleAndCropFactor
                                        (videoScaleAndCropFactor
                                        : CGFloat); cdecl;
                                        function videoScaleAndCropFactor
                                        : CGFloat; cdecl;
                                        procedure setPreferredVideoStabilizationMode
                                        (preferredVideoStabilizationMode
                                        : AVCaptureVideoStabilizationMode);
                                        cdecl;
                                        function preferredVideoStabilizationMode
                                        : AVCaptureVideoStabilizationMode;
                                        cdecl;
                                        function activeVideoStabilizationMode
                                        : AVCaptureVideoStabilizationMode;
                                        cdecl;
                                        function isVideoStabilizationSupported
                                        : Boolean; cdecl;
                                        function isVideoStabilizationEnabled
                                        : Boolean; cdecl;
                                        procedure setEnablesVideoStabilizationWhenAvailable
                                        (enablesVideoStabilizationWhenAvailable
                                        : Boolean); cdecl;
                                        function enablesVideoStabilizationWhenAvailable
                                        : Boolean; cdecl;
                                        end;

                                        TAVCaptureConnection = class
                                        (TOCGenericImport<
                                        AVCaptureConnectionClass,
                                        AVCaptureConnection>)
                                        end;
                                        PAVCaptureConnection = Pointer;

                                        AVCaptureSessionClass = interface
                                        (NSObjectClass)
                                        ['{9E95DD54-9355-4689-89E9-4B1C39CE6164}']
                                        end;
                                        AVCaptureSession = interface(NSObject)
                                        ['{AAA1F864-A9FD-44C6-801C-E1E5A726059B}']
                                        function canSetSessionPreset
                                        (preset: NSString): Boolean;
                                        cdecl;
                                        procedure setSessionPreset
                                        (sessionPreset: NSString); cdecl;
                                        function sessionPreset: NSString; cdecl;
                                        function inputs: NSArray; cdecl;
                                        function canAddInput
                                        (input: AVCaptureInput): Boolean; cdecl;
                                        procedure addInput
                                        (input: AVCaptureInput); cdecl;
                                        procedure removeInput
                                        (input: AVCaptureInput); cdecl;
                                        function outputs: NSArray; cdecl;
                                        function canAddOutput
                                        (output: AVCaptureOutput)
                                        : Boolean; cdecl;
                                        procedure addOutput
                                        (output: AVCaptureOutput); cdecl;
                                        procedure removeOutput
                                        (output: AVCaptureOutput); cdecl;
                                        procedure addInputWithNoConnections
                                        (input: AVCaptureInput); cdecl;
                                        procedure addOutputWithNoConnections
                                        (output: AVCaptureOutput); cdecl;
                                        function canAddConnection
                                        (connection: AVCaptureConnection)
                                        : Boolean; cdecl;
                                        procedure addConnection
                                        (connection
                                        : AVCaptureConnection); cdecl;
                                        procedure removeConnection
                                        (connection
                                        : AVCaptureConnection); cdecl;
                                        procedure beginConfiguration; cdecl;
                                        procedure commitConfiguration; cdecl;
                                        function isRunning: Boolean; cdecl;
                                        function isInterrupted: Boolean; cdecl;
                                        procedure setUsesApplicationAudioSession
                                        (usesApplicationAudioSession
                                        : Boolean); cdecl;
                                        function usesApplicationAudioSession
                                        : Boolean; cdecl;
                                        procedure setAutomaticallyConfiguresApplicationAudioSession
                                        (automaticallyConfiguresApplicationAudioSession
                                        : Boolean); cdecl;
                                        function automaticallyConfiguresApplicationAudioSession
                                        : Boolean; cdecl;
                                        procedure startRunning; cdecl;
                                        procedure stopRunning; cdecl;
                                        function masterClock: CMClockRef; cdecl;
                                        end;

                                        TAVCaptureSession = class
                                        (TOCGenericImport<AVCaptureSessionClass,
                                        AVCaptureSession>)
                                        end;
                                        PAVCaptureSession = Pointer;

                                        AVCaptureAudioChannelClass = interface
                                        (NSObjectClass)
                                        ['{E4DBEE9E-677B-403D-BBA6-186635C1B4A6}']
                                        end;
                                        AVCaptureAudioChannel = interface
                                        (NSObject)
                                        ['{C08B1FEA-92DF-4497-B17A-3FF74D0FB3CA}']
                                        function averagePowerLevel: Single;
                                        cdecl;
                                        function peakHoldLevel: Single; cdecl;
                                        end;

                                        TAVCaptureAudioChannel = class
                                        (TOCGenericImport<
                                        AVCaptureAudioChannelClass,
                                        AVCaptureAudioChannel>)
                                        end;
                                        PAVCaptureAudioChannel = Pointer;

                                        AVCaptureVideoPreviewLayerClass =
                                        interface(CALayerClass)
                                        ['{A92BE03C-35C1-4A13-AB2D-6B5A4C785331}']
                                        { class } function layerWithSession
                                        (session: AVCaptureSession)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        layerWithSessionWithNoConnection
                                        (session: AVCaptureSession)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        AVCaptureVideoPreviewLayer = interface
                                        (CALayer)[
                                        '{D37BDA91-61D3-4474-A8DE-C0551BB1CE74}']
                                        function initWithSession
                                        (session: AVCaptureSession)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithSessionWithNoConnection
                                        (session: AVCaptureSession)
                                        : Pointer { instancetype }; cdecl;
                                        procedure setSession
                                        (session: AVCaptureSession); cdecl;
                                        function session
                                        : AVCaptureSession; cdecl;
                                        procedure setSessionWithNoConnection
                                        (session: AVCaptureSession); cdecl;
                                        function connection
                                        : AVCaptureConnection; cdecl;
                                        procedure setVideoGravity
                                        (videoGravity: NSString); cdecl;
                                        function videoGravity: NSString; cdecl;
                                        function captureDevicePointOfInterestForPoint
                                        (pointInLayer: CGPoint): CGPoint; cdecl;
                                        function pointForCaptureDevicePointOfInterest
                                        (captureDevicePointOfInterest: CGPoint)
                                        : CGPoint; cdecl;
                                        function metadataOutputRectOfInterestForRect
                                        (rectInLayerCoordinates: CGRect)
                                        : CGRect; cdecl;
                                        function rectForMetadataOutputRectOfInterest
                                        (rectInMetadataOutputCoordinates
                                        : CGRect): CGRect; cdecl;
                                        function transformedMetadataObjectForMetadataObject
                                        (metadataObject: AVMetadataObject)
                                        : AVMetadataObject; cdecl;
                                        function isOrientationSupported
                                        : Boolean; cdecl;
                                        procedure setOrientation
                                        (orientation
                                        : AVCaptureVideoOrientation); cdecl;
                                        function orientation
                                        : AVCaptureVideoOrientation; cdecl;
                                        function isMirroringSupported
                                        : Boolean; cdecl;
                                        procedure setAutomaticallyAdjustsMirroring
                                        (automaticallyAdjustsMirroring
                                        : Boolean); cdecl;
                                        function automaticallyAdjustsMirroring
                                        : Boolean; cdecl;
                                        procedure setMirrored
                                        (mirrored: Boolean); cdecl;
                                        function isMirrored: Boolean; cdecl;
                                        end;

                                        TAVCaptureVideoPreviewLayer = class
                                        (TOCGenericImport<
                                        AVCaptureVideoPreviewLayerClass,
                                        AVCaptureVideoPreviewLayer>)
                                        end;
                                        PAVCaptureVideoPreviewLayer = Pointer;

                                        AVMetadataObjectClass = interface
                                        (NSObjectClass)
                                        ['{C837491F-A2D8-4B92-B344-90AE795F97AB}']
                                        end;
                                        AVMetadataObject = interface(NSObject)
                                        ['{CA4AE328-DCFE-4405-9179-AA60185A8879}']
                                        function time: CMTime;
                                        cdecl;
                                        function duration: CMTime; cdecl;
                                        function bounds: CGRect; cdecl;
                                        function &type: NSString; cdecl;
                                        end;

                                        TAVMetadataObject = class
                                        (TOCGenericImport<AVMetadataObjectClass,
                                        AVMetadataObject>)
                                        end;
                                        PAVMetadataObject = Pointer;

                                        AVCaptureVideoDataOutputClass =
                                        interface(AVCaptureOutputClass)
                                        ['{9162BCB1-BC09-49E4-91EB-E198ED8ACDAB}']
                                        end;
                                        AVCaptureVideoDataOutput = interface
                                        (AVCaptureOutput)
                                        ['{66981D48-68F0-463F-AA3B-5E4BAD227550}']
                                        procedure setSampleBufferDelegate
                                        (sampleBufferDelegate: Pointer;
                                        queue: dispatch_queue_t);
                                        cdecl;
                                        function sampleBufferDelegate
                                        : Pointer; cdecl;
                                        function sampleBufferCallbackQueue
                                        : dispatch_queue_t; cdecl;
                                        procedure setVideoSettings
                                        (videoSettings: NSDictionary); cdecl;
                                        function videoSettings
                                        : NSDictionary; cdecl;
                                        function recommendedVideoSettingsForAssetWriterWithOutputFileType
                                        (outputFileType: NSString)
                                        : NSDictionary; cdecl;
                                        function availableVideoCVPixelFormatTypes
                                        : NSArray; cdecl;
                                        function availableVideoCodecTypes
                                        : NSArray; cdecl;
                                        procedure setMinFrameDuration
                                        (minFrameDuration: CMTime); cdecl;
                                        function minFrameDuration
                                        : CMTime; cdecl;
                                        procedure setAlwaysDiscardsLateVideoFrames
                                        (alwaysDiscardsLateVideoFrames
                                        : Boolean); cdecl;
                                        function alwaysDiscardsLateVideoFrames
                                        : Boolean; cdecl;
                                        end;

                                        TAVCaptureVideoDataOutput = class
                                        (TOCGenericImport<
                                        AVCaptureVideoDataOutputClass,
                                        AVCaptureVideoDataOutput>)
                                        end;
                                        PAVCaptureVideoDataOutput = Pointer;

                                        AVCaptureAudioDataOutputClass =
                                        interface(AVCaptureOutputClass)
                                        ['{931A5543-12FA-4DC2-8637-3D57AED81AB5}']
                                        end;
                                        AVCaptureAudioDataOutput = interface
                                        (AVCaptureOutput)
                                        ['{B3D30318-E5F5-4F21-91EA-4611435B0C4E}']
                                        procedure setSampleBufferDelegate
                                        (sampleBufferDelegate: Pointer;
                                        queue: dispatch_queue_t);
                                        cdecl;
                                        function sampleBufferDelegate
                                        : Pointer; cdecl;
                                        function sampleBufferCallbackQueue
                                        : dispatch_queue_t; cdecl;
                                        function recommendedAudioSettingsForAssetWriterWithOutputFileType
                                        (outputFileType: NSString)
                                        : NSDictionary; cdecl;
                                        end;

                                        TAVCaptureAudioDataOutput = class
                                        (TOCGenericImport<
                                        AVCaptureAudioDataOutputClass,
                                        AVCaptureAudioDataOutput>)
                                        end;
                                        PAVCaptureAudioDataOutput = Pointer;

                                        AVCaptureFileOutputClass = interface
                                        (AVCaptureOutputClass)
                                        ['{2DFED1AA-142B-4434-8C2C-9571B809EC73}']
                                        end;
                                        AVCaptureFileOutput = interface
                                        (AVCaptureOutput)
                                        ['{DFC2DDB5-B230-4F88-9E4E-36B617F5E929}']
                                        function outputFileURL: NSURL;
                                        cdecl;
                                        procedure startRecordingToOutputFileURL
                                        (outputFileURL: NSURL;
                                        recordingDelegate: Pointer); cdecl;
                                        procedure stopRecording; cdecl;
                                        function isRecording: Boolean; cdecl;
                                        function recordedDuration
                                        : CMTime; cdecl;
                                        function recordedFileSize: Int64; cdecl;
                                        procedure setMaxRecordedDuration
                                        (maxRecordedDuration: CMTime); cdecl;
                                        function maxRecordedDuration
                                        : CMTime; cdecl;
                                        procedure setMaxRecordedFileSize
                                        (maxRecordedFileSize: Int64); cdecl;
                                        function maxRecordedFileSize
                                        : Int64; cdecl;
                                        procedure setMinFreeDiskSpaceLimit
                                        (minFreeDiskSpaceLimit: Int64); cdecl;
                                        function minFreeDiskSpaceLimit
                                        : Int64; cdecl;
                                        end;

                                        TAVCaptureFileOutput = class
                                        (TOCGenericImport<
                                        AVCaptureFileOutputClass,
                                        AVCaptureFileOutput>)
                                        end;
                                        PAVCaptureFileOutput = Pointer;

                                        AVCaptureMovieFileOutputClass =
                                        interface(AVCaptureFileOutputClass)
                                        ['{79D67E93-8DF6-44B1-A670-43547E2EC087}']
                                        end;
                                        AVCaptureMovieFileOutput = interface
                                        (AVCaptureFileOutput)
                                        ['{FE73894C-D494-49E7-896B-B55B549E28FD}']
                                        procedure setMovieFragmentInterval
                                        (movieFragmentInterval: CMTime);
                                        cdecl;
                                        function movieFragmentInterval
                                        : CMTime; cdecl;
                                        procedure setMetadata
                                        (metadata: NSArray); cdecl;
                                        function metadata: NSArray; cdecl;
                                        function recordsVideoOrientationAndMirroringChangesAsMetadataTrackForConnection
                                        (connection: AVCaptureConnection)
                                        : Boolean; cdecl;
                                        procedure setRecordsVideoOrientationAndMirroringChanges
                                        (doRecordChanges: Boolean;
                                        asMetadataTrackForConnection
                                        : AVCaptureConnection); cdecl;
                                        end;

                                        TAVCaptureMovieFileOutput = class
                                        (TOCGenericImport<
                                        AVCaptureMovieFileOutputClass,
                                        AVCaptureMovieFileOutput>)
                                        end;
                                        PAVCaptureMovieFileOutput = Pointer;

                                        AVCaptureStillImageOutputClass =
                                        interface(AVCaptureOutputClass)
                                        ['{8F3DC6E6-16A8-4A30-8233-9CAE235325E4}']
                                        { class } function
                                        jpegStillImageNSDataRepresentation
                                        (jpegSampleBuffer
                                        : CMSampleBufferRef): NSData;
                                        cdecl;
                                        end;
                                        AVCaptureStillImageOutput = interface
                                        (AVCaptureOutput)
                                        ['{DB40A0E6-AA80-4599-A2D6-F26670848842}']
                                        procedure setOutputSettings
                                        (outputSettings: NSDictionary);
                                        cdecl;
                                        function outputSettings
                                        : NSDictionary; cdecl;
                                        function availableImageDataCVPixelFormatTypes
                                        : NSArray; cdecl;
                                        function availableImageDataCodecTypes
                                        : NSArray; cdecl;
                                        function isStillImageStabilizationSupported
                                        : Boolean; cdecl;
                                        procedure setAutomaticallyEnablesStillImageStabilizationWhenAvailable
                                        (automaticallyEnablesStillImageStabilizationWhenAvailable
                                        : Boolean); cdecl;
                                        function automaticallyEnablesStillImageStabilizationWhenAvailable
                                        : Boolean; cdecl;
                                        function isStillImageStabilizationActive
                                        : Boolean; cdecl;
                                        procedure setHighResolutionStillImageOutputEnabled
                                        (highResolutionStillImageOutputEnabled
                                        : Boolean); cdecl;
                                        function isHighResolutionStillImageOutputEnabled
                                        : Boolean; cdecl;
                                        function isCapturingStillImage
                                        : Boolean; cdecl;
                                        procedure captureStillImageAsynchronouslyFromConnection
                                        (connection: AVCaptureConnection;
                                        completionHandler
                                        : TAVFoundationCompletionHandler4);
                                        cdecl;
                                        function maxBracketedCaptureStillImageCount
                                        : NSUInteger; cdecl;
                                        function isLensStabilizationDuringBracketedCaptureSupported
                                        : Boolean; cdecl;
                                        procedure setLensStabilizationDuringBracketedCaptureEnabled
                                        (lensStabilizationDuringBracketedCaptureEnabled
                                        : Boolean); cdecl;
                                        function isLensStabilizationDuringBracketedCaptureEnabled
                                        : Boolean; cdecl;
                                        procedure prepareToCaptureStillImageBracketFromConnection
                                        (connection: AVCaptureConnection;
                                        withSettingsArray: NSArray;
                                        completionHandler
                                        : TAVFoundationCompletionHandler5);
                                        cdecl;
                                        procedure captureStillImageBracketAsynchronouslyFromConnection
                                        (connection: AVCaptureConnection;
                                        withSettingsArray: NSArray;
                                        completionHandler
                                        : TAVFoundationCompletionHandler6);
                                        cdecl;
                                        end;

                                        TAVCaptureStillImageOutput = class
                                        (TOCGenericImport<
                                        AVCaptureStillImageOutputClass,
                                        AVCaptureStillImageOutput>)
                                        end;
                                        PAVCaptureStillImageOutput = Pointer;

                                        AVCaptureBracketedStillImageSettingsClass =
                                        interface(NSObjectClass)
                                        ['{9885688F-70E7-4457-A198-88E3B804A756}']
                                        end;
                                        AVCaptureBracketedStillImageSettings =
                                        interface(NSObject)
                                        ['{B02CE233-AB49-4AC6-BA01-A7A9A786C22E}']
                                        end;

                                        TAVCaptureBracketedStillImageSettings =
                                        class(TOCGenericImport<
                                        AVCaptureBracketedStillImageSettingsClass,
                                        AVCaptureBracketedStillImageSettings>)
                                        end;
                                        PAVCaptureBracketedStillImageSettings =
                                        Pointer;

                                        AVCaptureManualExposureBracketedStillImageSettingsClass =
                                        interface(
                                        AVCaptureBracketedStillImageSettingsClass)
                                        ['{22F94D87-C604-41A8-802A-0682424715F9}']
                                        { class } function
                                        manualExposureSettingsWithExposureDuration
                                        (duration: CMTime; ISO: Single)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVCaptureManualExposureBracketedStillImageSettings =
                                        interface(
                                        AVCaptureBracketedStillImageSettings)
                                        ['{ACA0A700-5BBF-4787-BB8C-6940C88F0802}']
                                        function exposureDuration: CMTime;
                                        cdecl;
                                        function ISO: Single; cdecl;
                                        end;

                                        TAVCaptureManualExposureBracketedStillImageSettings =
                                        class(TOCGenericImport<
                                        AVCaptureManualExposureBracketedStillImageSettingsClass,
                                        AVCaptureManualExposureBracketedStillImageSettings>)
                                        end;
                                        PAVCaptureManualExposureBracketedStillImageSettings =
                                        Pointer;

                                        AVCaptureAutoExposureBracketedStillImageSettingsClass =
                                        interface(
                                        AVCaptureBracketedStillImageSettingsClass)
                                        ['{015C6A2A-ABD6-4D31-82B3-C999A855DDD8}']
                                        { class } function
                                        autoExposureSettingsWithExposureTargetBias
                                        (exposureTargetBias: Single)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVCaptureAutoExposureBracketedStillImageSettings =
                                        interface(
                                        AVCaptureBracketedStillImageSettings)
                                        ['{1AF09FE5-D3FE-44F5-82A5-A9268A3FEE22}']
                                        function exposureTargetBias: Single;
                                        cdecl;
                                        end;

                                        TAVCaptureAutoExposureBracketedStillImageSettings =
                                        class(TOCGenericImport<
                                        AVCaptureAutoExposureBracketedStillImageSettingsClass,
                                        AVCaptureAutoExposureBracketedStillImageSettings>)
                                        end;
                                        PAVCaptureAutoExposureBracketedStillImageSettings =
                                        Pointer;

                                        AVCaptureMetadataOutputClass = interface
                                        (AVCaptureOutputClass)
                                        ['{924E6A3F-648C-4B7E-B5F8-3AEDD8D941F7}']
                                        end;
                                        AVCaptureMetadataOutput = interface
                                        (AVCaptureOutput)
                                        ['{A921C85F-9B1F-4973-BD08-0D06531DE089}']
                                        procedure setMetadataObjectsDelegate
                                        (objectsDelegate: Pointer;
                                        queue: dispatch_queue_t);
                                        cdecl;
                                        function metadataObjectsDelegate
                                        : Pointer; cdecl;
                                        function metadataObjectsCallbackQueue
                                        : dispatch_queue_t; cdecl;
                                        function availableMetadataObjectTypes
                                        : NSArray; cdecl;
                                        procedure setMetadataObjectTypes
                                        (metadataObjectTypes: NSArray); cdecl;
                                        function metadataObjectTypes
                                        : NSArray; cdecl;
                                        procedure setRectOfInterest
                                        (rectOfInterest: CGRect); cdecl;
                                        function rectOfInterest: CGRect; cdecl;
                                        end;

                                        TAVCaptureMetadataOutput = class
                                        (TOCGenericImport<
                                        AVCaptureMetadataOutputClass,
                                        AVCaptureMetadataOutput>)
                                        end;
                                        PAVCaptureMetadataOutput = Pointer;

                                        AVCompositionClass = interface
                                        (AVAssetClass)
                                        ['{1A4B7994-5973-4276-AF6B-B3B3ACB5E97B}']
                                        end;
                                        AVComposition = interface(AVAsset)
                                        ['{C75CDAFC-AC02-4E5A-8ACD-D59439CFB568}']
                                        function tracks: NSArray;
                                        cdecl;
                                        function naturalSize: CGSize; cdecl;
                                        function URLAssetInitializationOptions
                                        : NSDictionary; cdecl;
                                        function trackWithTrackID
                                        (trackID: CMPersistentTrackID)
                                        : AVCompositionTrack; cdecl;
                                        function tracksWithMediaType
                                        (mediaType: NSString): NSArray; cdecl;
                                        function tracksWithMediaCharacteristic
                                        (mediaCharacteristic: NSString)
                                        : NSArray; cdecl;
                                        end;

                                        TAVComposition = class
                                        (TOCGenericImport<AVCompositionClass,
                                        AVComposition>)
                                        end;
                                        PAVComposition = Pointer;

                                        AVCompositionTrackSegmentClass =
                                        interface(AVAssetTrackSegmentClass)
                                        ['{6E8B43A5-CAD5-4DFD-9500-09D1E6FB1A23}']
                                        { class } function
                                        compositionTrackSegmentWithURL
                                        (URL: NSURL;
                                        trackID: CMPersistentTrackID;
                                        sourceTimeRange: CMTimeRange;
                                        targetTimeRange: CMTimeRange)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        compositionTrackSegmentWithTimeRange
                                        (timeRange: CMTimeRange)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        AVCompositionTrackSegment = interface
                                        (AVAssetTrackSegment)
                                        ['{CB58FD12-239E-4315-829C-353D36F6D453}']
                                        function initWithURL(URL: NSURL;
                                        trackID: CMPersistentTrackID;
                                        sourceTimeRange: CMTimeRange;
                                        targetTimeRange: CMTimeRange)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithTimeRange
                                        (timeRange: CMTimeRange)
                                        : Pointer { instancetype }; cdecl;
                                        function isEmpty: Boolean; cdecl;
                                        function sourceURL: NSURL; cdecl;
                                        function sourceTrackID
                                        : CMPersistentTrackID; cdecl;
                                        end;

                                        TAVCompositionTrackSegment = class
                                        (TOCGenericImport<
                                        AVCompositionTrackSegmentClass,
                                        AVCompositionTrackSegment>)
                                        end;
                                        PAVCompositionTrackSegment = Pointer;

                                        AVMutableCompositionTrackClass =
                                        interface(AVCompositionTrackClass)
                                        ['{03B0E57C-66A8-4F20-8901-EDCAD2591CC5}']
                                        end;
                                        AVMutableCompositionTrack = interface
                                        (AVCompositionTrack)
                                        ['{944B1963-A6CA-4F58-9E6E-ACC5597648E4}']
                                        procedure setNaturalTimeScale
                                        (naturalTimeScale: CMTimeScale);
                                        cdecl;
                                        function naturalTimeScale
                                        : CMTimeScale; cdecl;
                                        procedure setLanguageCode
                                        (languageCode: NSString); cdecl;
                                        function languageCode: NSString; cdecl;
                                        procedure setExtendedLanguageTag
                                        (extendedLanguageTag: NSString); cdecl;
                                        function extendedLanguageTag
                                        : NSString; cdecl;
                                        procedure setPreferredTransform
                                        (preferredTransform
                                        : CGAffineTransform); cdecl;
                                        function preferredTransform
                                        : CGAffineTransform; cdecl;
                                        procedure setPreferredVolume
                                        (preferredVolume: Single); cdecl;
                                        function preferredVolume: Single; cdecl;
                                        procedure setSegments
                                        (segments: NSArray); cdecl;
                                        function segments: NSArray; cdecl;
                                        function insertTimeRange
                                        (timeRange: CMTimeRange;
                                        ofTrack: AVAssetTrack; atTime: CMTime;
                                        error: NSError): Boolean; cdecl;
                                        function insertTimeRanges
                                        (timeRanges: NSArray; ofTracks: NSArray;
                                        atTime: CMTime; error: NSError)
                                        : Boolean; cdecl;
                                        procedure insertEmptyTimeRange
                                        (timeRange: CMTimeRange); cdecl;
                                        procedure removeTimeRange
                                        (timeRange: CMTimeRange); cdecl;
                                        procedure scaleTimeRange
                                        (timeRange: CMTimeRange;
                                        toDuration: CMTime); cdecl;
                                        function validateTrackSegments
                                        (trackSegments: NSArray; error: NSError)
                                        : Boolean; cdecl;
                                        end;

                                        TAVMutableCompositionTrack = class
                                        (TOCGenericImport<
                                        AVMutableCompositionTrackClass,
                                        AVMutableCompositionTrack>)
                                        end;
                                        PAVMutableCompositionTrack = Pointer;

                                        AVMutableCompositionClass = interface
                                        (AVCompositionClass)
                                        ['{DB9881A0-04DE-47E9-895A-99875A035D01}']
                                        { class } function composition
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        compositionWithURLAssetInitializationOptions
                                        (URLAssetInitializationOptions
                                        : NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        AVMutableComposition = interface
                                        (AVComposition)
                                        ['{F85E0B51-0E64-4851-B25F-2B13F099DACB}']
                                        function tracks: NSArray;
                                        cdecl;
                                        procedure setNaturalSize
                                        (naturalSize: CGSize); cdecl;
                                        function naturalSize: CGSize; cdecl;
                                        function insertTimeRange
                                        (timeRange: CMTimeRange;
                                        ofAsset: AVAsset; atTime: CMTime;
                                        error: NSError): Boolean; cdecl;
                                        procedure insertEmptyTimeRange
                                        (timeRange: CMTimeRange); cdecl;
                                        procedure removeTimeRange
                                        (timeRange: CMTimeRange); cdecl;
                                        procedure scaleTimeRange
                                        (timeRange: CMTimeRange;
                                        toDuration: CMTime); cdecl;
                                        function addMutableTrackWithMediaType
                                        (mediaType: NSString;
                                        preferredTrackID: CMPersistentTrackID)
                                        : AVMutableCompositionTrack; cdecl;
                                        procedure removeTrack
                                        (track: AVCompositionTrack); cdecl;
                                        function mutableTrackCompatibleWithTrack
                                        (track: AVAssetTrack)
                                        : AVMutableCompositionTrack; cdecl;
                                        function trackWithTrackID
                                        (trackID: CMPersistentTrackID)
                                        : AVMutableCompositionTrack; cdecl;
                                        function tracksWithMediaType
                                        (mediaType: NSString): NSArray; cdecl;
                                        function tracksWithMediaCharacteristic
                                        (mediaCharacteristic: NSString)
                                        : NSArray; cdecl;
                                        end;

                                        TAVMutableComposition = class
                                        (TOCGenericImport<
                                        AVMutableCompositionClass,
                                        AVMutableComposition>)
                                        end;
                                        PAVMutableComposition = Pointer;

                                        AVMIDIPlayerClass = interface
                                        (NSObjectClass)
                                        ['{3DB6056F-63AB-4569-A7DE-F6C03DCBC8BA}']
                                        end;
                                        AVMIDIPlayer = interface(NSObject)
                                        ['{90BB83A1-6594-4F86-8B88-243501D1A713}']
                                        function initWithContentsOfURL
                                        (inURL: NSURL; soundBankURL: NSURL;
                                        error: NSError)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithData(data: NSData;
                                        soundBankURL: NSURL; error: NSError)
                                        : Pointer { instancetype }; cdecl;
                                        procedure prepareToPlay; cdecl;
                                        procedure play(completionHandler
                                        : AVMIDIPlayerCompletionHandler); cdecl;
                                        procedure stop; cdecl;
                                        function duration
                                        : NSTimeInterval; cdecl;
                                        function isPlaying: Boolean; cdecl;
                                        procedure setRate(rate: Single); cdecl;
                                        function rate: Single; cdecl;
                                        procedure setCurrentPosition
                                        (currentPosition
                                        : NSTimeInterval); cdecl;
                                        function currentPosition
                                        : NSTimeInterval; cdecl;
                                        end;

                                        TAVMIDIPlayer = class
                                        (TOCGenericImport<AVMIDIPlayerClass,
                                        AVMIDIPlayer>)
                                        end;
                                        PAVMIDIPlayer = Pointer;

                                        AVSpeechSynthesisVoiceClass = interface
                                        (NSObjectClass)
                                        ['{9C21592B-2EA4-4BB0-9AD7-9DF90E7466F6}']
                                        { class } function speechVoices
                                        : NSArray;
                                        cdecl;
                                        { class } function currentLanguageCode
                                        : NSString; cdecl;
                                        { class } function voiceWithLanguage
                                        (languageCode: NSString)
                                        : AVSpeechSynthesisVoice; cdecl;
                                        { class } function voiceWithIdentifier
                                        (identifier: NSString)
                                        : AVSpeechSynthesisVoice; cdecl;
                                        end;
                                        AVSpeechSynthesisVoice = interface
                                        (NSObject)
                                        ['{4046A14D-7A0A-47E6-B321-FA3960765CB1}']
                                        function language: NSString;
                                        cdecl;
                                        function identifier: NSString; cdecl;
                                        function name: NSString; cdecl;
                                        function quality
                                        : AVSpeechSynthesisVoiceQuality; cdecl;
                                        end;

                                        TAVSpeechSynthesisVoice = class
                                        (TOCGenericImport<
                                        AVSpeechSynthesisVoiceClass,
                                        AVSpeechSynthesisVoice>)
                                        end;
                                        PAVSpeechSynthesisVoice = Pointer;

                                        AVSpeechUtteranceClass = interface
                                        (NSObjectClass)
                                        ['{46C41CA1-B26B-4927-A8E2-4561086013B5}']
                                        { class } function
                                        speechUtteranceWithString
                                        (&string: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVSpeechUtterance = interface(NSObject)
                                        ['{7F258E3A-C3EE-4725-AA03-0425E2DB727D}']
                                        function initWithString
                                        (&string: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setVoice
                                        (voice: AVSpeechSynthesisVoice); cdecl;
                                        function voice
                                        : AVSpeechSynthesisVoice; cdecl;
                                        function speechString: NSString; cdecl;
                                        procedure setRate(rate: Single); cdecl;
                                        function rate: Single; cdecl;
                                        procedure setPitchMultiplier
                                        (pitchMultiplier: Single); cdecl;
                                        function pitchMultiplier: Single; cdecl;
                                        procedure setVolume
                                        (volume: Single); cdecl;
                                        function volume: Single; cdecl;
                                        procedure setPreUtteranceDelay
                                        (preUtteranceDelay
                                        : NSTimeInterval); cdecl;
                                        function preUtteranceDelay
                                        : NSTimeInterval; cdecl;
                                        procedure setPostUtteranceDelay
                                        (postUtteranceDelay
                                        : NSTimeInterval); cdecl;
                                        function postUtteranceDelay
                                        : NSTimeInterval; cdecl;
                                        end;

                                        TAVSpeechUtterance = class
                                        (TOCGenericImport<
                                        AVSpeechUtteranceClass,
                                        AVSpeechUtterance>)
                                        end;
                                        PAVSpeechUtterance = Pointer;

                                        AVSpeechSynthesizerClass = interface
                                        (NSObjectClass)
                                        ['{749A881C-274B-426B-AA20-6190F1E8BBF6}']
                                        end;
                                        AVSpeechSynthesizer = interface
                                        (NSObject)
                                        ['{00A308F9-8806-47D1-84B0-D8E7AE75A69C}']
                                        procedure setDelegate
                                        (delegate: Pointer);
                                        cdecl;
                                        function delegate: Pointer; cdecl;
                                        function isSpeaking: Boolean; cdecl;
                                        function isPaused: Boolean; cdecl;
                                        procedure speakUtterance
                                        (utterance: AVSpeechUtterance); cdecl;
                                        function stopSpeakingAtBoundary
                                        (boundary: AVSpeechBoundary)
                                        : Boolean; cdecl;
                                        function pauseSpeakingAtBoundary
                                        (boundary: AVSpeechBoundary)
                                        : Boolean; cdecl;
                                        function continueSpeaking
                                        : Boolean; cdecl;
                                        end;

                                        TAVSpeechSynthesizer = class
                                        (TOCGenericImport<
                                        AVSpeechSynthesizerClass,
                                        AVSpeechSynthesizer>)
                                        end;
                                        PAVSpeechSynthesizer = Pointer;

                                        AVMutableMetadataItemClass = interface
                                        (AVMetadataItemClass)
                                        ['{A8CCAE7B-995C-4A2D-A3D5-8E0DCDD98D8B}']
                                        { class } function metadataItem
                                        : AVMutableMetadataItem;
                                        cdecl;
                                        end;
                                        AVMutableMetadataItem = interface
                                        (AVMetadataItem)
                                        ['{F13D4615-009C-4814-8909-1D6386F500B4}']
                                        procedure setIdentifier
                                        (identifier: NSString);
                                        cdecl;
                                        function identifier: NSString; cdecl;
                                        procedure setExtendedLanguageTag
                                        (extendedLanguageTag: NSString); cdecl;
                                        function extendedLanguageTag
                                        : NSString; cdecl;
                                        procedure setLocale
                                        (locale: NSLocale); cdecl;
                                        function locale: NSLocale; cdecl;
                                        procedure setTime(time: CMTime); cdecl;
                                        function time: CMTime; cdecl;
                                        procedure setDuration
                                        (duration: CMTime); cdecl;
                                        function duration: CMTime; cdecl;
                                        procedure setDataType
                                        (dataType: NSString); cdecl;
                                        function dataType: NSString; cdecl;
                                        procedure setValue
                                        (value: Pointer); cdecl;
                                        function value: Pointer; cdecl;
                                        procedure setExtraAttributes
                                        (extraAttributes: NSDictionary); cdecl;
                                        function extraAttributes
                                        : NSDictionary; cdecl;
                                        procedure setStartDate
                                        (startDate: NSDate); cdecl;
                                        function startDate: NSDate; cdecl;
                                        procedure setKeySpace
                                        (keySpace: NSString); cdecl;
                                        function keySpace: NSString; cdecl;
                                        procedure setKey(key: Pointer); cdecl;
                                        function key: Pointer; cdecl;
                                        end;

                                        TAVMutableMetadataItem = class
                                        (TOCGenericImport<
                                        AVMutableMetadataItemClass,
                                        AVMutableMetadataItem>)
                                        end;
                                        PAVMutableMetadataItem = Pointer;

                                        AVMetadataItemValueRequestClass =
                                        interface(NSObjectClass)
                                        ['{1464A97C-EBEF-4644-8EA3-9B7FA00C6AAF}']
                                        end;
                                        AVMetadataItemValueRequest = interface
                                        (NSObject)
                                        ['{9FDFDF0F-67F1-4CE0-9494-6E00C5FDA0AF}']
                                        function metadataItem: AVMetadataItem;
                                        cdecl;
                                        procedure respondWithValue
                                        (value: Pointer); cdecl;
                                        procedure respondWithError
                                        (error: NSError); cdecl;
                                        end;

                                        TAVMetadataItemValueRequest = class
                                        (TOCGenericImport<
                                        AVMetadataItemValueRequestClass,
                                        AVMetadataItemValueRequest>)
                                        end;
                                        PAVMetadataItemValueRequest = Pointer;

                                        AVMetadataFaceObjectClass = interface
                                        (AVMetadataObjectClass)
                                        ['{5CCAAF74-B351-4D4E-8B90-6B50DBA480D9}']
                                        end;
                                        AVMetadataFaceObject = interface
                                        (AVMetadataObject)
                                        ['{B5467E87-EC32-4550-877C-E105A163A978}']
                                        function faceID: NSInteger;
                                        cdecl;
                                        function hasRollAngle: Boolean; cdecl;
                                        function rollAngle: CGFloat; cdecl;
                                        function hasYawAngle: Boolean; cdecl;
                                        function yawAngle: CGFloat; cdecl;
                                        end;

                                        TAVMetadataFaceObject = class
                                        (TOCGenericImport<
                                        AVMetadataFaceObjectClass,
                                        AVMetadataFaceObject>)
                                        end;
                                        PAVMetadataFaceObject = Pointer;

                                        AVMetadataMachineReadableCodeObjectClass =
                                        interface(AVMetadataObjectClass)
                                        ['{C00E429C-6C0E-49CF-B50C-91F0222FEBEA}']
                                        end;
                                        AVMetadataMachineReadableCodeObject =
                                        interface(AVMetadataObject)
                                        ['{61A1BBCF-DAAC-4840-A0E7-1436AA87A6B6}']
                                        function corners: NSArray;
                                        cdecl;
                                        function stringValue: NSString; cdecl;
                                        end;

                                        TAVMetadataMachineReadableCodeObject =
                                        class(TOCGenericImport<
                                        AVMetadataMachineReadableCodeObjectClass,
                                        AVMetadataMachineReadableCodeObject>)
                                        end;
                                        PAVMetadataMachineReadableCodeObject =
                                        Pointer;

                                        AVOutputSettingsAssistantClass =
                                        interface(NSObjectClass)
                                        ['{EB004A52-3FB8-4A47-8AF7-D246014A5740}']
                                        { class } function
                                        availableOutputSettingsPresets: NSArray;
                                        cdecl;
                                        { class } function
                                        outputSettingsAssistantWithPreset
                                        (presetIdentifier: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        AVOutputSettingsAssistant = interface
                                        (NSObject)
                                        ['{2D6D0318-AD70-4DD5-B435-0F4177350A28}']
                                        function audioSettings: NSDictionary;
                                        cdecl;
                                        function videoSettings
                                        : NSDictionary; cdecl;
                                        function outputFileType
                                        : NSString; cdecl;
                                        procedure setSourceAudioFormat
                                        (sourceAudioFormat
                                        : CMAudioFormatDescriptionRef); cdecl;
                                        function sourceAudioFormat
                                        : CMAudioFormatDescriptionRef; cdecl;
                                        procedure setSourceVideoFormat
                                        (sourceVideoFormat
                                        : CMVideoFormatDescriptionRef); cdecl;
                                        function sourceVideoFormat
                                        : CMVideoFormatDescriptionRef; cdecl;
                                        procedure setSourceVideoAverageFrameDuration
                                        (sourceVideoAverageFrameDuration
                                        : CMTime); cdecl;
                                        function sourceVideoAverageFrameDuration
                                        : CMTime; cdecl;
                                        procedure setSourceVideoMinFrameDuration
                                        (sourceVideoMinFrameDuration
                                        : CMTime); cdecl;
                                        function sourceVideoMinFrameDuration
                                        : CMTime; cdecl;
                                        end;

                                        TAVOutputSettingsAssistant = class
                                        (TOCGenericImport<
                                        AVOutputSettingsAssistantClass,
                                        AVOutputSettingsAssistant>)
                                        end;
                                        PAVOutputSettingsAssistant = Pointer;

                                        AVPlayerItemClass = interface
                                        (NSObjectClass)
                                        ['{43DF08F5-8C1B-43E4-B5A0-974F0FF6CD8B}']
                                        { class } function playerItemWithURL
                                        (URL: NSURL): AVPlayerItem;
                                        cdecl;
                                        [MethodName('playerItemWithAsset:')]
                                        { class } function playerItemWithAsset
                                        (asset: AVAsset): AVPlayerItem; cdecl;
                                        [MethodName
                                        ('playerItemWithAsset:automaticallyLoadedAssetKeys:')
                                        ]
                                        { class } function
                                        playerItemWithAssetAutomaticallyLoadedAssetKeys
                                        (asset: AVAsset;
                                        automaticallyLoadedAssetKeys: NSArray)
                                        : AVPlayerItem; cdecl;
                                        end;
                                        AVPlayerItem = interface(NSObject)
                                        ['{C41B3179-A7C1-477C-B9B1-7C03C39B0FB8}']
                                        function initWithURL(URL: NSURL)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName('initWithAsset:')]
                                        function initWithAsset(asset: AVAsset)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithAsset:automaticallyLoadedAssetKeys:')
                                        ]
                                        function initWithAssetAutomaticallyLoadedAssetKeys
                                        (asset: AVAsset;
                                        automaticallyLoadedAssetKeys: NSArray)
                                        : Pointer { instancetype }; cdecl;
                                        function status
                                        : AVPlayerItemStatus; cdecl;
                                        function error: NSError; cdecl;
                                        function asset: AVAsset; cdecl;
                                        function tracks: NSArray; cdecl;
                                        function duration: CMTime; cdecl;
                                        function presentationSize
                                        : CGSize; cdecl;
                                        function timedMetadata: NSArray; cdecl;
                                        function automaticallyLoadedAssetKeys
                                        : NSArray; cdecl;
                                        function canPlayFastForward
                                        : Boolean; cdecl;
                                        function canPlaySlowForward
                                        : Boolean; cdecl;
                                        function canPlayReverse: Boolean; cdecl;
                                        function canPlaySlowReverse
                                        : Boolean; cdecl;
                                        function canPlayFastReverse
                                        : Boolean; cdecl;
                                        function canStepForward: Boolean; cdecl;
                                        function canStepBackward
                                        : Boolean; cdecl;
                                        function currentTime: CMTime; cdecl;
                                        procedure setForwardPlaybackEndTime
                                        (forwardPlaybackEndTime: CMTime); cdecl;
                                        function forwardPlaybackEndTime
                                        : CMTime; cdecl;
                                        procedure setReversePlaybackEndTime
                                        (reversePlaybackEndTime: CMTime); cdecl;
                                        function reversePlaybackEndTime
                                        : CMTime; cdecl;
                                        function seekableTimeRanges
                                        : NSArray; cdecl;
                                        [MethodName('seekToTime:')]
                                        procedure seekToTime
                                        (time: CMTime); cdecl;
                                        [MethodName
                                        ('seekToTime:completionHandler:')]
                                        procedure seekToTimeCompletionHandler
                                        (time: CMTime;
                                        completionHandler
                                        : TAVFoundationCompletionHandler1);
                                        cdecl;
                                        [MethodName
                                        ('seekToTime:toleranceBefore:toleranceAfter:')
                                        ]
                                        procedure seekToTimeToleranceBeforeToleranceAfter
                                        (time: CMTime; toleranceBefore: CMTime;
                                        toleranceAfter: CMTime); cdecl;
                                        [MethodName
                                        ('seekToTime:toleranceBefore:toleranceAfter:completionHandler:')
                                        ]
                                        procedure seekToTimeToleranceBeforeToleranceAfterCompletionHandler
                                        (time: CMTime; toleranceBefore: CMTime;
                                        toleranceAfter: CMTime;
                                        completionHandler
                                        : TAVFoundationCompletionHandler1);
                                        cdecl;
                                        procedure cancelPendingSeeks; cdecl;
                                        function currentDate: NSDate; cdecl;
                                        [MethodName('seekToDate:')]
                                        function seekToDate(date: NSDate)
                                        : Boolean; cdecl;
                                        [MethodName
                                        ('seekToDate:completionHandler:')]
                                        function seekToDateCompletionHandler
                                        (date: NSDate;
                                        completionHandler
                                        : TAVFoundationCompletionHandler1)
                                        : Boolean; cdecl;
                                        procedure stepByCount
                                        (stepCount: NSInteger); cdecl;
                                        function timebase: CMTimebaseRef; cdecl;
                                        procedure setVideoComposition
                                        (videoComposition
                                        : AVVideoComposition); cdecl;
                                        function videoComposition
                                        : AVVideoComposition; cdecl;
                                        function customVideoCompositor
                                        : Pointer; cdecl;
                                        procedure setSeekingWaitsForVideoCompositionRendering
                                        (seekingWaitsForVideoCompositionRendering
                                        : Boolean); cdecl;
                                        function seekingWaitsForVideoCompositionRendering
                                        : Boolean; cdecl;
                                        procedure setTextStyleRules
                                        (textStyleRules: NSArray); cdecl;
                                        function textStyleRules: NSArray; cdecl;
                                        procedure setAudioTimePitchAlgorithm
                                        (audioTimePitchAlgorithm
                                        : NSString); cdecl;
                                        function audioTimePitchAlgorithm
                                        : NSString; cdecl;
                                        procedure setAudioMix
                                        (audioMix: AVAudioMix); cdecl;
                                        function audioMix: AVAudioMix; cdecl;
                                        function loadedTimeRanges
                                        : NSArray; cdecl;
                                        function isPlaybackLikelyToKeepUp
                                        : Boolean; cdecl;
                                        function isPlaybackBufferFull
                                        : Boolean; cdecl;
                                        function isPlaybackBufferEmpty
                                        : Boolean; cdecl;
                                        procedure setCanUseNetworkResourcesForLiveStreamingWhilePaused
                                        (canUseNetworkResourcesForLiveStreamingWhilePaused
                                        : Boolean); cdecl;
                                        function canUseNetworkResourcesForLiveStreamingWhilePaused
                                        : Boolean; cdecl;
                                        procedure setPreferredPeakBitRate
                                        (preferredPeakBitRate: Double); cdecl;
                                        function preferredPeakBitRate
                                        : Double; cdecl;
                                        procedure selectMediaOption
                                        (mediaSelectionOption
                                        : AVMediaSelectionOption;
                                        inMediaSelectionGroup
                                        : AVMediaSelectionGroup); cdecl;
                                        procedure selectMediaOptionAutomaticallyInMediaSelectionGroup
                                        (mediaSelectionGroup
                                        : AVMediaSelectionGroup); cdecl;
                                        function selectedMediaOptionInMediaSelectionGroup
                                        (mediaSelectionGroup
                                        : AVMediaSelectionGroup)
                                        : AVMediaSelectionOption; cdecl;
                                        function currentMediaSelection
                                        : AVMediaSelection; cdecl;
                                        function accessLog
                                        : AVPlayerItemAccessLog; cdecl;
                                        function errorLog
                                        : AVPlayerItemErrorLog; cdecl;
                                        procedure addOutput
                                        (output: AVPlayerItemOutput); cdecl;
                                        procedure removeOutput
                                        (output: AVPlayerItemOutput); cdecl;
                                        function outputs: NSArray; cdecl;
                                        procedure addMediaDataCollector
                                        (collector
                                        : AVPlayerItemMediaDataCollector);
                                        cdecl;
                                        procedure removeMediaDataCollector
                                        (collector
                                        : AVPlayerItemMediaDataCollector);
                                        cdecl;
                                        function mediaDataCollectors
                                        : NSArray; cdecl;
                                        end;

                                        TAVPlayerItem = class
                                        (TOCGenericImport<AVPlayerItemClass,
                                        AVPlayerItem>)
                                        end;
                                        PAVPlayerItem = Pointer;

                                        AVPlayerClass = interface(NSObjectClass)
                                        ['{CED2B132-9FAF-4150-B272-09D54CA43D79}']
                                        { class } function playerWithURL
                                        (URL: NSURL): Pointer { instancetype };
                                        cdecl;
                                        { class } function playerWithPlayerItem
                                        (item: AVPlayerItem)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        AVPlayer = interface(NSObject)
                                        ['{10511CD4-30F3-4C84-82E4-EED1AE583B4A}']
                                        function initWithURL(URL: NSURL)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithPlayerItem
                                        (item: AVPlayerItem)
                                        : Pointer { instancetype }; cdecl;
                                        function status: AVPlayerStatus; cdecl;
                                        function error: NSError; cdecl;
                                        [MethodName('setRate:')]
                                        procedure setRate(rate: Single); cdecl;
                                        function rate: Single; cdecl;
                                        procedure play; cdecl;
                                        procedure pause; cdecl;
                                        function currentItem
                                        : AVPlayerItem; cdecl;
                                        procedure replaceCurrentItemWithPlayerItem
                                        (item: AVPlayerItem); cdecl;
                                        procedure setActionAtItemEnd
                                        (actionAtItemEnd
                                        : AVPlayerActionAtItemEnd); cdecl;
                                        function actionAtItemEnd
                                        : AVPlayerActionAtItemEnd; cdecl;
                                        function currentTime: CMTime; cdecl;
                                        [MethodName('seekToDate:')]
                                        procedure seekToDate
                                        (date: NSDate); cdecl;
                                        [MethodName
                                        ('seekToDate:completionHandler:')]
                                        procedure seekToDateCompletionHandler
                                        (date: NSDate;
                                        completionHandler
                                        : TAVFoundationCompletionHandler1);
                                        cdecl;
                                        [MethodName('seekToTime:')]
                                        procedure seekToTime
                                        (time: CMTime); cdecl;
                                        [MethodName
                                        ('seekToTime:toleranceBefore:toleranceAfter:')
                                        ]
                                        procedure seekToTimeToleranceBeforeToleranceAfter
                                        (time: CMTime; toleranceBefore: CMTime;
                                        toleranceAfter: CMTime); cdecl;
                                        [MethodName
                                        ('seekToTime:completionHandler:')]
                                        procedure seekToTimeCompletionHandler
                                        (time: CMTime;
                                        completionHandler
                                        : TAVFoundationCompletionHandler1);
                                        cdecl;
                                        [MethodName
                                        ('seekToTime:toleranceBefore:toleranceAfter:completionHandler:')
                                        ]
                                        procedure seekToTimeToleranceBeforeToleranceAfterCompletionHandler
                                        (time: CMTime; toleranceBefore: CMTime;
                                        toleranceAfter: CMTime;
                                        completionHandler
                                        : TAVFoundationCompletionHandler1);
                                        cdecl;
                                        [MethodName('setRate:time:atHostTime:')]
                                        procedure setRateTimeAtHostTime
                                        (rate: Single; time: CMTime;
                                        atHostTime: CMTime); cdecl;
                                        procedure prerollAtRate(rate: Single;
                                        completionHandler
                                        : TAVFoundationCompletionHandler1);
                                        cdecl;
                                        procedure cancelPendingPrerolls; cdecl;
                                        procedure setMasterClock
                                        (masterClock: CMClockRef); cdecl;
                                        function masterClock: CMClockRef; cdecl;
                                        function addPeriodicTimeObserverForInterval
                                        (interval: CMTime;
                                        queue: dispatch_queue_t;
                                        usingBlock
                                        : TAVFoundationCompletionHandler3)
                                        : Pointer; cdecl;
                                        function addBoundaryTimeObserverForTimes
                                        (times: NSArray;
                                        queue: dispatch_queue_t;
                                        usingBlock
                                        : TAVFoundationCompletionHandler)
                                        : Pointer; cdecl;
                                        procedure removeTimeObserver
                                        (observer: Pointer); cdecl;
                                        procedure setVolume
                                        (volume: Single); cdecl;
                                        function volume: Single; cdecl;
                                        procedure setMuted
                                        (muted: Boolean); cdecl;
                                        function isMuted: Boolean; cdecl;
                                        procedure setClosedCaptionDisplayEnabled
                                        (closedCaptionDisplayEnabled
                                        : Boolean); cdecl;
                                        function isClosedCaptionDisplayEnabled
                                        : Boolean; cdecl;
                                        procedure setAppliesMediaSelectionCriteriaAutomatically
                                        (appliesMediaSelectionCriteriaAutomatically
                                        : Boolean); cdecl;
                                        function appliesMediaSelectionCriteriaAutomatically
                                        : Boolean; cdecl;
                                        procedure setMediaSelectionCriteria
                                        (criteria:
                                        AVPlayerMediaSelectionCriteria;
                                        forMediaCharacteristic
                                        : NSString); cdecl;
                                        function mediaSelectionCriteriaForMediaCharacteristic
                                        (mediaCharacteristic: NSString)
                                        : AVPlayerMediaSelectionCriteria; cdecl;
                                        procedure setAudioOutputDeviceUniqueID
                                        (audioOutputDeviceUniqueID
                                        : NSString); cdecl;
                                        function audioOutputDeviceUniqueID
                                        : NSString; cdecl;
                                        procedure setAllowsExternalPlayback
                                        (allowsExternalPlayback
                                        : Boolean); cdecl;
                                        function allowsExternalPlayback
                                        : Boolean; cdecl;
                                        function isExternalPlaybackActive
                                        : Boolean; cdecl;
                                        procedure setUsesExternalPlaybackWhileExternalScreenIsActive
                                        (usesExternalPlaybackWhileExternalScreenIsActive
                                        : Boolean); cdecl;
                                        function usesExternalPlaybackWhileExternalScreenIsActive
                                        : Boolean; cdecl;
                                        procedure setExternalPlaybackVideoGravity
                                        (externalPlaybackVideoGravity
                                        : NSString); cdecl;
                                        function externalPlaybackVideoGravity
                                        : NSString; cdecl;
                                        procedure setAllowsAirPlayVideo
                                        (allowsAirPlayVideo: Boolean); cdecl;
                                        function allowsAirPlayVideo
                                        : Boolean; cdecl;
                                        function isAirPlayVideoActive
                                        : Boolean; cdecl;
                                        procedure setUsesAirPlayVideoWhileAirPlayScreenIsActive
                                        (usesAirPlayVideoWhileAirPlayScreenIsActive
                                        : Boolean); cdecl;
                                        function usesAirPlayVideoWhileAirPlayScreenIsActive
                                        : Boolean; cdecl;
                                        function outputObscuredDueToInsufficientExternalProtection
                                        : Boolean; cdecl;
                                        end;

                                        TAVPlayer = class
                                        (TOCGenericImport<AVPlayerClass,
                                        AVPlayer>)
                                        end;
                                        PAVPlayer = Pointer;

                                        AVPlayerMediaSelectionCriteriaClass =
                                        interface(NSObjectClass)
                                        ['{E06AA706-F920-44AB-A03B-9D838AB3192E}']
                                        end;
                                        AVPlayerMediaSelectionCriteria =
                                        interface(NSObject)
                                        ['{DE7AF54F-8801-45C5-A7A7-F72D5C0E2DE6}']
                                        function preferredLanguages: NSArray;
                                        cdecl;
                                        function preferredMediaCharacteristics
                                        : NSArray; cdecl;
                                        function initWithPreferredLanguages
                                        (preferredLanguages: NSArray;
                                        preferredMediaCharacteristics: NSArray)
                                        : Pointer { instancetype }; cdecl;
                                        end;

                                        TAVPlayerMediaSelectionCriteria = class
                                        (TOCGenericImport<
                                        AVPlayerMediaSelectionCriteriaClass,
                                        AVPlayerMediaSelectionCriteria>)
                                        end;
                                        PAVPlayerMediaSelectionCriteria =
                                        Pointer;

                                        AVQueuePlayerClass = interface
                                        (AVPlayerClass)
                                        ['{2C2B0DF5-5A70-45E1-840F-F169A854B7BE}']
                                        { class } function queuePlayerWithItems
                                        (items: NSArray)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        AVQueuePlayer = interface(AVPlayer)
                                        ['{F2CDA71D-420F-44F7-94E9-EA0E8B030A66}']
                                        function initWithItems(items: NSArray)
                                        : AVQueuePlayer;
                                        cdecl;
                                        function items: NSArray; cdecl;
                                        procedure advanceToNextItem; cdecl;
                                        function canInsertItem
                                        (item: AVPlayerItem;
                                        afterItem: AVPlayerItem)
                                        : Boolean; cdecl;
                                        procedure insertItem(item: AVPlayerItem;
                                        afterItem: AVPlayerItem); cdecl;
                                        procedure removeItem
                                        (item: AVPlayerItem); cdecl;
                                        procedure removeAllItems; cdecl;
                                        end;

                                        TAVQueuePlayer = class
                                        (TOCGenericImport<AVQueuePlayerClass,
                                        AVQueuePlayer>)
                                        end;
                                        PAVQueuePlayer = Pointer;

                                        AVTextStyleRuleClass = interface
                                        (NSObjectClass)
                                        ['{8E29A4A0-A9A5-485E-BC9C-E3AA381CE2EB}']
                                        { class } function
                                        propertyListForTextStyleRules
                                        (textStyleRules: NSArray): Pointer;
                                        cdecl;
                                        { class } function
                                        textStyleRulesFromPropertyList
                                        (plist: Pointer): NSArray; cdecl;
                                        [MethodName
                                        ('textStyleRuleWithTextMarkupAttributes:')
                                        ]
                                        { class } function
                                        textStyleRuleWithTextMarkupAttributes
                                        (textMarkupAttributes: NSDictionary)
                                        : AVTextStyleRule; cdecl;
                                        [MethodName
                                        ('textStyleRuleWithTextMarkupAttributes:textSelector:')
                                        ]
                                        { class } function
                                        textStyleRuleWithTextMarkupAttributesTextSelector
                                        (textMarkupAttributes: NSDictionary;
                                        textSelector: NSString)
                                        : AVTextStyleRule; cdecl;
                                        end;
                                        AVTextStyleRule = interface(NSObject)
                                        ['{6165FC56-43AD-4175-848B-C479E22EB742}']
                                        [MethodName
                                        ('initWithTextMarkupAttributes:')]
                                        function initWithTextMarkupAttributes
                                        (textMarkupAttributes: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('initWithTextMarkupAttributes:textSelector:')
                                        ]
                                        function initWithTextMarkupAttributesTextSelector
                                        (textMarkupAttributes: NSDictionary;
                                        textSelector: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        function textMarkupAttributes
                                        : NSDictionary; cdecl;
                                        function textSelector: NSString; cdecl;
                                        end;

                                        TAVTextStyleRule = class
                                        (TOCGenericImport<AVTextStyleRuleClass,
                                        AVTextStyleRule>)
                                        end;
                                        PAVTextStyleRule = Pointer;

                                        AVPlayerItemAccessLogClass = interface
                                        (NSObjectClass)
                                        ['{3C45C0B2-E67E-4BEA-A21F-F97BEFAFA1EC}']
                                        end;
                                        AVPlayerItemAccessLog = interface
                                        (NSObject)
                                        ['{B80A3955-D96E-4F09-B309-038D53CC32DE}']
                                        function extendedLogData: NSData;
                                        cdecl;
                                        function extendedLogDataStringEncoding
                                        : NSStringEncoding; cdecl;
                                        function events: NSArray; cdecl;
                                        end;

                                        TAVPlayerItemAccessLog = class
                                        (TOCGenericImport<
                                        AVPlayerItemAccessLogClass,
                                        AVPlayerItemAccessLog>)
                                        end;
                                        PAVPlayerItemAccessLog = Pointer;

                                        AVPlayerItemErrorLogClass = interface
                                        (NSObjectClass)
                                        ['{9B44D4E8-E950-4B94-BCE7-BC3601FC46A7}']
                                        end;
                                        AVPlayerItemErrorLog = interface
                                        (NSObject)
                                        ['{45FD44B6-FBED-4220-B45A-4BF122B0F379}']
                                        function extendedLogData: NSData;
                                        cdecl;
                                        function extendedLogDataStringEncoding
                                        : NSStringEncoding; cdecl;
                                        function events: NSArray; cdecl;
                                        end;

                                        TAVPlayerItemErrorLog = class
                                        (TOCGenericImport<
                                        AVPlayerItemErrorLogClass,
                                        AVPlayerItemErrorLog>)
                                        end;
                                        PAVPlayerItemErrorLog = Pointer;

                                        AVPlayerItemOutputClass = interface
                                        (NSObjectClass)
                                        ['{7BCB9CB9-8947-450E-93AD-60B1615BCF6F}']
                                        end;
                                        AVPlayerItemOutput = interface(NSObject)
                                        ['{02AEDD68-C558-4CD5-8BF3-4EE3A6623794}']
                                        function itemTimeForHostTime
                                        (hostTimeInSeconds
                                        : CFTimeInterval): CMTime;
                                        cdecl;
                                        function itemTimeForMachAbsoluteTime
                                        (machAbsoluteTime: Int64)
                                        : CMTime; cdecl;
                                        procedure setSuppressesPlayerRendering
                                        (suppressesPlayerRendering
                                        : Boolean); cdecl;
                                        function suppressesPlayerRendering
                                        : Boolean; cdecl;
                                        end;

                                        TAVPlayerItemOutput = class
                                        (TOCGenericImport<
                                        AVPlayerItemOutputClass,
                                        AVPlayerItemOutput>)
                                        end;
                                        PAVPlayerItemOutput = Pointer;

                                        AVPlayerItemMediaDataCollectorClass =
                                        interface(NSObjectClass)
                                        ['{52B07DF8-2E39-4F02-8D28-A9C72EED4D37}']
                                        end;
                                        AVPlayerItemMediaDataCollector =
                                        interface(NSObject)
                                        ['{384CE57D-8F29-48D2-9FB3-2D75635C3FE8}']
                                        end;

                                        TAVPlayerItemMediaDataCollector = class
                                        (TOCGenericImport<
                                        AVPlayerItemMediaDataCollectorClass,
                                        AVPlayerItemMediaDataCollector>)
                                        end;
                                        PAVPlayerItemMediaDataCollector =
                                        Pointer;

                                        AVPlayerItemAccessLogEventClass =
                                        interface(NSObjectClass)
                                        ['{80FA3D9B-D441-439F-BB5A-1B491FA3202A}']
                                        end;
                                        AVPlayerItemAccessLogEvent = interface
                                        (NSObject)
                                        ['{DD11210C-1F07-4D51-A816-A58B289109FB}']
                                        function numberOfSegmentsDownloaded
                                        : NSInteger;
                                        cdecl;
                                        function numberOfMediaRequests
                                        : NSInteger; cdecl;
                                        function playbackStartDate
                                        : NSDate; cdecl;
                                        function URI: NSString; cdecl;
                                        function serverAddress: NSString; cdecl;
                                        function numberOfServerAddressChanges
                                        : NSInteger; cdecl;
                                        function playbackSessionID
                                        : NSString; cdecl;
                                        function playbackStartOffset
                                        : NSTimeInterval; cdecl;
                                        function segmentsDownloadedDuration
                                        : NSTimeInterval; cdecl;
                                        function durationWatched
                                        : NSTimeInterval; cdecl;
                                        function numberOfStalls
                                        : NSInteger; cdecl;
                                        function numberOfBytesTransferred
                                        : Int64; cdecl;
                                        function transferDuration
                                        : NSTimeInterval; cdecl;
                                        function observedBitrate: Double; cdecl;
                                        function indicatedBitrate
                                        : Double; cdecl;
                                        function numberOfDroppedVideoFrames
                                        : NSInteger; cdecl;
                                        function startupTime
                                        : NSTimeInterval; cdecl;
                                        function downloadOverdue
                                        : NSInteger; cdecl;
                                        function observedMaxBitrate
                                        : Double; cdecl;
                                        function observedMinBitrate
                                        : Double; cdecl;
                                        function observedBitrateStandardDeviation
                                        : Double; cdecl;
                                        function playbackType: NSString; cdecl;
                                        function mediaRequestsWWAN
                                        : NSInteger; cdecl;
                                        function switchBitrate: Double; cdecl;
                                        end;

                                        TAVPlayerItemAccessLogEvent = class
                                        (TOCGenericImport<
                                        AVPlayerItemAccessLogEventClass,
                                        AVPlayerItemAccessLogEvent>)
                                        end;
                                        PAVPlayerItemAccessLogEvent = Pointer;

                                        AVPlayerItemErrorLogEventClass =
                                        interface(NSObjectClass)
                                        ['{4883ECA9-E1E0-4511-8B2F-1B7CEAE8010A}']
                                        end;
                                        AVPlayerItemErrorLogEvent = interface
                                        (NSObject)
                                        ['{A5E3607D-8E38-4344-A884-F55B60E4FA83}']
                                        function date: NSDate;
                                        cdecl;
                                        function URI: NSString; cdecl;
                                        function serverAddress: NSString; cdecl;
                                        function playbackSessionID
                                        : NSString; cdecl;
                                        function errorStatusCode
                                        : NSInteger; cdecl;
                                        function errorDomain: NSString; cdecl;
                                        function errorComment: NSString; cdecl;
                                        end;

                                        TAVPlayerItemErrorLogEvent = class
                                        (TOCGenericImport<
                                        AVPlayerItemErrorLogEventClass,
                                        AVPlayerItemErrorLogEvent>)
                                        end;
                                        PAVPlayerItemErrorLogEvent = Pointer;

                                        AVDateRangeMetadataGroupClass =
                                        interface(AVMetadataGroupClass)
                                        ['{99888B83-5122-43AF-8CCF-8C00CD6143DD}']
                                        end;
                                        AVDateRangeMetadataGroup = interface
                                        (AVMetadataGroup)
                                        ['{19A1A01C-2AF2-481B-A220-2576775D5379}']
                                        function initWithItems(items: NSArray;
                                        startDate: NSDate; endDate: NSDate)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function startDate: NSDate; cdecl;
                                        function endDate: NSDate; cdecl;
                                        function items: NSArray; cdecl;
                                        end;

                                        TAVDateRangeMetadataGroup = class
                                        (TOCGenericImport<
                                        AVDateRangeMetadataGroupClass,
                                        AVDateRangeMetadataGroup>)
                                        end;
                                        PAVDateRangeMetadataGroup = Pointer;

                                        AVPlayerItemMetadataCollectorClass =
                                        interface(
                                        AVPlayerItemMediaDataCollectorClass)
                                        ['{F414A088-F51D-4E18-99D4-0970D56ED759}']
                                        end;
                                        AVPlayerItemMetadataCollector =
                                        interface(
                                        AVPlayerItemMediaDataCollector)
                                        ['{26F0F72A-087D-4F4B-AC31-54F426CDE02D}']
                                        function initWithIdentifiers
                                        (identifiers: NSArray;
                                        classifyingLabels: NSArray)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setDelegate(delegate: Pointer;
                                        queue: dispatch_queue_t); cdecl;
                                        function delegate: Pointer; cdecl;
                                        function delegateQueue
                                        : dispatch_queue_t; cdecl;
                                        end;

                                        TAVPlayerItemMetadataCollector = class
                                        (TOCGenericImport<
                                        AVPlayerItemMetadataCollectorClass,
                                        AVPlayerItemMetadataCollector>)
                                        end;
                                        PAVPlayerItemMetadataCollector =
                                        Pointer;

                                        AVPlayerItemVideoOutputClass = interface
                                        (AVPlayerItemOutputClass)
                                        ['{EF68339E-0D8B-4622-9A87-3C03BCBDCAC0}']
                                        end;
                                        AVPlayerItemVideoOutput = interface
                                        (AVPlayerItemOutput)
                                        ['{843BDEFA-994B-4FBB-ABF1-F4A34CFA559D}']
                                        function initWithPixelBufferAttributes
                                        (pixelBufferAttributes: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function hasNewPixelBufferForItemTime
                                        (itemTime: CMTime): Boolean; cdecl;
                                        function copyPixelBufferForItemTime
                                        (itemTime: CMTime;
                                        itemTimeForDisplay: Pointer)
                                        : CVPixelBufferRef; cdecl;
                                        procedure setDelegate(delegate: Pointer;
                                        queue: dispatch_queue_t); cdecl;
                                        procedure requestNotificationOfMediaDataChangeWithAdvanceInterval
                                        (interval: NSTimeInterval); cdecl;
                                        function delegate: Pointer; cdecl;
                                        function delegateQueue
                                        : dispatch_queue_t; cdecl;
                                        end;

                                        TAVPlayerItemVideoOutput = class
                                        (TOCGenericImport<
                                        AVPlayerItemVideoOutputClass,
                                        AVPlayerItemVideoOutput>)
                                        end;
                                        PAVPlayerItemVideoOutput = Pointer;

                                        AVPlayerItemLegibleOutputClass =
                                        interface(AVPlayerItemOutputClass)
                                        ['{CE83BEFD-41A5-45C2-8596-CFE2BDF0B4A8}']
                                        end;
                                        AVPlayerItemLegibleOutput = interface
                                        (AVPlayerItemOutput)
                                        ['{AD19EC2D-E0E5-4E48-AB35-B1D85C9B1DBF}']
                                        procedure setDelegate(delegate: Pointer;
                                        queue: dispatch_queue_t);
                                        cdecl;
                                        function delegate: Pointer; cdecl;
                                        function delegateQueue
                                        : dispatch_queue_t; cdecl;
                                        procedure setAdvanceIntervalForDelegateInvocation
                                        (advanceIntervalForDelegateInvocation
                                        : NSTimeInterval); cdecl;
                                        function advanceIntervalForDelegateInvocation
                                        : NSTimeInterval; cdecl;
                                        function initWithMediaSubtypesForNativeRepresentation
                                        (subtypes: NSArray)
                                        : Pointer { instancetype }; cdecl;
                                        procedure setTextStylingResolution
                                        (textStylingResolution
                                        : NSString); cdecl;
                                        function textStylingResolution
                                        : NSString; cdecl;
                                        end;

                                        TAVPlayerItemLegibleOutput = class
                                        (TOCGenericImport<
                                        AVPlayerItemLegibleOutputClass,
                                        AVPlayerItemLegibleOutput>)
                                        end;
                                        PAVPlayerItemLegibleOutput = Pointer;

                                        AVPlayerItemMetadataOutputClass =
                                        interface(AVPlayerItemOutputClass)
                                        ['{0B76132F-2021-41B6-80B9-EB0C4D3E4AD6}']
                                        end;
                                        AVPlayerItemMetadataOutput = interface
                                        (AVPlayerItemOutput)
                                        ['{73F2CC18-6136-4972-B059-27D76B43A7DD}']
                                        function initWithIdentifiers
                                        (identifiers: NSArray)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setDelegate(delegate: Pointer;
                                        queue: dispatch_queue_t); cdecl;
                                        function delegate: Pointer; cdecl;
                                        function delegateQueue
                                        : dispatch_queue_t; cdecl;
                                        procedure setAdvanceIntervalForDelegateInvocation
                                        (advanceIntervalForDelegateInvocation
                                        : NSTimeInterval); cdecl;
                                        function advanceIntervalForDelegateInvocation
                                        : NSTimeInterval; cdecl;
                                        end;

                                        TAVPlayerItemMetadataOutput = class
                                        (TOCGenericImport<
                                        AVPlayerItemMetadataOutputClass,
                                        AVPlayerItemMetadataOutput>)
                                        end;
                                        PAVPlayerItemMetadataOutput = Pointer;

                                        AVPlayerLayerClass = interface
                                        (CALayerClass)
                                        ['{382947D1-14B2-43D2-8A59-CEEF4832AB21}']
                                        { class } function playerLayerWithPlayer
                                        (player: AVPlayer): AVPlayerLayer;
                                        cdecl;
                                        end;
                                        AVPlayerLayer = interface(CALayer)
                                        ['{62D3B62F-F9C4-4CEB-83D5-7E062CD682B2}']
                                        procedure setPlayer(player: AVPlayer);
                                        cdecl;
                                        function player: AVPlayer; cdecl;
                                        procedure setVideoGravity
                                        (videoGravity: NSString); cdecl;
                                        function videoGravity: NSString; cdecl;
                                        function isReadyForDisplay
                                        : Boolean; cdecl;
                                        function videoRect: CGRect; cdecl;
                                        procedure setPixelBufferAttributes
                                        (pixelBufferAttributes
                                        : NSDictionary); cdecl;
                                        function pixelBufferAttributes
                                        : NSDictionary; cdecl;
                                        end;

                                        TAVPlayerLayer = class
                                        (TOCGenericImport<AVPlayerLayerClass,
                                        AVPlayerLayer>)
                                        end;
                                        PAVPlayerLayer = Pointer;

                                        AVSampleBufferDisplayLayerClass =
                                        interface(CALayerClass)
                                        ['{C57876D5-3C7D-4156-9AD7-A289B99DCDE6}']
                                        end;
                                        AVSampleBufferDisplayLayer = interface
                                        (CALayer)[
                                        '{AD566E44-8A84-472E-99E5-FF9D9C4366B0}']
                                        procedure setControlTimebase
                                        (controlTimebase: CMTimebaseRef);
                                        cdecl;
                                        function controlTimebase
                                        : CMTimebaseRef; cdecl;
                                        procedure setVideoGravity
                                        (videoGravity: NSString); cdecl;
                                        function videoGravity: NSString; cdecl;
                                        function status
                                        : AVQueuedSampleBufferRenderingStatus;
                                        cdecl;
                                        function error: NSError; cdecl;
                                        procedure enqueueSampleBuffer
                                        (sampleBuffer
                                        : CMSampleBufferRef); cdecl;
                                        procedure flush; cdecl;
                                        procedure flushAndRemoveImage; cdecl;
                                        function isReadyForMoreMediaData
                                        : Boolean; cdecl;
                                        procedure requestMediaDataWhenReadyOnQueue
                                        (queue: dispatch_queue_t;
                                        usingBlock
                                        : TAVFoundationCompletionHandler);
                                        cdecl;
                                        procedure stopRequestingMediaData;
                                        cdecl;
                                        end;

                                        TAVSampleBufferDisplayLayer = class
                                        (TOCGenericImport<
                                        AVSampleBufferDisplayLayerClass,
                                        AVSampleBufferDisplayLayer>)
                                        end;
                                        PAVSampleBufferDisplayLayer = Pointer;

                                        AVSynchronizedLayerClass = interface
                                        (CALayerClass)
                                        ['{DB26D617-C3C8-4141-BC40-8B025E920669}']
                                        { class } function
                                        synchronizedLayerWithPlayerItem
                                        (playerItem: AVPlayerItem)
                                        : AVSynchronizedLayer;
                                        cdecl;
                                        end;
                                        AVSynchronizedLayer = interface(CALayer)
                                        ['{24A3C5F5-E013-48E8-9E86-BC00F436746A}']
                                        procedure setPlayerItem
                                        (playerItem: AVPlayerItem);
                                        cdecl;
                                        function playerItem
                                        : AVPlayerItem; cdecl;
                                        end;

                                        TAVSynchronizedLayer = class
                                        (TOCGenericImport<
                                        AVSynchronizedLayerClass,
                                        AVSynchronizedLayer>)
                                        end;
                                        PAVSynchronizedLayer = Pointer;

                                        NSValueAVFoundationExtensions =
                                        interface(IObjectiveC)
                                        ['{0C562F90-C397-4051-AE3B-EC7DBB4C98BA}']
                                        function valueWithCMTime(time: CMTime)
                                        : NSValue;
                                        cdecl;
                                        function CMTimeValue: CMTime; cdecl;
                                        function valueWithCMTimeRange
                                        (timeRange: CMTimeRange)
                                        : NSValue; cdecl;
                                        function CMTimeRangeValue
                                        : CMTimeRange; cdecl;
                                        function valueWithCMTimeMapping
                                        (timeMapping: CMTimeMapping)
                                        : NSValue; cdecl;
                                        function CMTimeMappingValue
                                        : CMTimeMapping; cdecl;
                                        end;

                                        AVTimeCoding = interface(IObjectiveC)
                                        ['{C733E5A2-D952-45F6-8CF9-21BC35506ABE}']
                                        procedure encodeCMTime(time: CMTime;
                                        forKey: NSString);
                                        cdecl;
                                        function decodeCMTimeForKey
                                        (key: NSString): CMTime; cdecl;
                                        procedure encodeCMTimeRange
                                        (timeRange: CMTimeRange;
                                        forKey: NSString); cdecl;
                                        function decodeCMTimeRangeForKey
                                        (key: NSString): CMTimeRange; cdecl;
                                        procedure encodeCMTimeMapping
                                        (timeMapping: CMTimeMapping;
                                        forKey: NSString); cdecl;
                                        function decodeCMTimeMappingForKey
                                        (key: NSString): CMTimeMapping; cdecl;
                                        end;

                                        AVMutableTimedMetadataGroupClass =
                                        interface(AVTimedMetadataGroupClass)
                                        ['{08F88A8A-D5D3-40EB-A394-4415931D0587}']
                                        end;
                                        AVMutableTimedMetadataGroup = interface
                                        (AVTimedMetadataGroup)
                                        ['{BFF1C9B0-6A2A-44F0-91B9-D0AAF10BA565}']
                                        procedure setTimeRange
                                        (timeRange: CMTimeRange);
                                        cdecl;
                                        function timeRange: CMTimeRange; cdecl;
                                        procedure setItems
                                        (items: NSArray); cdecl;
                                        function items: NSArray; cdecl;
                                        end;

                                        TAVMutableTimedMetadataGroup = class
                                        (TOCGenericImport<
                                        AVMutableTimedMetadataGroupClass,
                                        AVMutableTimedMetadataGroup>)
                                        end;
                                        PAVMutableTimedMetadataGroup = Pointer;

                                        AVMutableDateRangeMetadataGroupClass =
                                        interface(AVDateRangeMetadataGroupClass)
                                        ['{BC1F86E7-22E4-4576-951C-BD18E892BB25}']
                                        end;
                                        AVMutableDateRangeMetadataGroup =
                                        interface(AVDateRangeMetadataGroup)
                                        ['{28984CE5-492C-45C5-B4E8-812A64AFE22C}']
                                        procedure setStartDate
                                        (startDate: NSDate);
                                        cdecl;
                                        function startDate: NSDate; cdecl;
                                        procedure setEndDate
                                        (endDate: NSDate); cdecl;
                                        function endDate: NSDate; cdecl;
                                        procedure setItems
                                        (items: NSArray); cdecl;
                                        function items: NSArray; cdecl;
                                        end;

                                        TAVMutableDateRangeMetadataGroup = class
                                        (TOCGenericImport<
                                        AVMutableDateRangeMetadataGroupClass,
                                        AVMutableDateRangeMetadataGroup>)
                                        end;
                                        PAVMutableDateRangeMetadataGroup =
                                        Pointer;

                                        // ===== Protocol declarations =====

                                        AVAsynchronousKeyValueLoading =
                                        interface(IObjectiveC)
                                        ['{F280061C-703C-45D4-94DD-B65A6ED718CE}']
                                        function statusOfValueForKey
                                        (key: NSString; error: NSError)
                                        : AVKeyValueStatus;
                                        cdecl;
                                        procedure loadValuesAsynchronouslyForKeys
                                        (keys: NSArray;
                                        completionHandler
                                        : TAVFoundationCompletionHandler);
                                        cdecl;
                                        end;

                                        AVFragmentMinding = interface
                                        (IObjectiveC)
                                        ['{67B10A39-7339-43F6-8A73-1E0CC7C4FDDE}']
                                        function isAssociatedWithFragmentMinder
                                        : Boolean;
                                        cdecl;
                                        end;

                                        AVAssetDownloadDelegate = interface
                                        (IObjectiveC)
                                        ['{347BE2B5-C055-4F77-A9B0-1C77E36037F8}']
                                        [MethodName
                                        ('URLSession:assetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:')
                                        ]
                                        procedure URLSessionAssetDownloadTaskDidLoadTimeRangeTotalTimeRangesLoadedTimeRangeExpectedToLoad
                                        (session: NSURLSession;
                                        assetDownloadTask: AVAssetDownloadTask;
                                        didLoadTimeRange: CMTimeRange;
                                        totalTimeRangesLoaded: NSArray;
                                        timeRangeExpectedToLoad: CMTimeRange);
                                        cdecl;
                                        [MethodName
                                        ('URLSession:assetDownloadTask:didResolveMediaSelection:')
                                        ]
                                        procedure URLSessionAssetDownloadTaskDidResolveMediaSelection
                                        (session: NSURLSession;
                                        assetDownloadTask: AVAssetDownloadTask;
                                        didResolveMediaSelection
                                        : AVMediaSelection); cdecl;
                                        end;

                                        AVVideoCompositing = interface
                                        (IObjectiveC)
                                        ['{EB081AE2-B34C-4C3A-AF38-C66A971902E4}']
                                        function sourcePixelBufferAttributes
                                        : NSDictionary;
                                        cdecl;
                                        function requiredPixelBufferAttributesForRenderContext
                                        : NSDictionary; cdecl;
                                        procedure renderContextChanged
                                        (newRenderContext
                                        : AVVideoCompositionRenderContext);
                                        cdecl;
                                        procedure startVideoCompositionRequest
                                        (asyncVideoCompositionRequest
                                        : AVAsynchronousVideoCompositionRequest);
                                        cdecl;
                                        procedure cancelAllPendingVideoCompositionRequests;
                                        cdecl;
                                        end;

                                        AVVideoCompositionValidationHandling =
                                        interface(IObjectiveC)
                                        ['{5888DE5E-74AA-41BA-8331-61948C0FD11D}']
                                        [MethodName
                                        ('videoComposition:shouldContinueValidatingAfterFindingInvalidValueForKey:')
                                        ]
                                        function videoCompositionShouldContinueValidatingAfterFindingInvalidValueForKey
                                        (videoComposition: AVVideoComposition;
                                        shouldContinueValidatingAfterFindingInvalidValueForKey
                                        : NSString): Boolean;
                                        cdecl;
                                        [MethodName
                                        ('videoComposition:shouldContinueValidatingAfterFindingEmptyTimeRange:')
                                        ]
                                        function videoCompositionShouldContinueValidatingAfterFindingEmptyTimeRange
                                        (videoComposition: AVVideoComposition;
                                        shouldContinueValidatingAfterFindingEmptyTimeRange
                                        : CMTimeRange): Boolean; cdecl;
                                        [MethodName
                                        ('videoComposition:shouldContinueValidatingAfterFindingInvalidTimeRangeInInstruction:')
                                        ]
                                        function videoCompositionShouldContinueValidatingAfterFindingInvalidTimeRangeInInstruction
                                        (videoComposition: AVVideoComposition;
                                        shouldContinueValidatingAfterFindingInvalidTimeRangeInInstruction
                                        : Pointer): Boolean; cdecl;
                                        [MethodName
                                        ('videoComposition:shouldContinueValidatingAfterFindingInvalidTrackIDInInstruction:layerInstruction:asset:')
                                        ]
                                        function videoCompositionShouldContinueValidatingAfterFindingInvalidTrackIDInInstructionLayerInstructionAsset
                                        (videoComposition: AVVideoComposition;
                                        shouldContinueValidatingAfterFindingInvalidTrackIDInInstruction
                                        : Pointer;
                                        layerInstruction
                                        : AVVideoCompositionLayerInstruction;
                                        asset: AVAsset): Boolean; cdecl;
                                        end;

                                        AVAssetResourceLoaderDelegate =
                                        interface(IObjectiveC)
                                        ['{FAE82993-1671-4BB6-994C-88B32E469D65}']
                                        [MethodName
                                        ('resourceLoader:shouldWaitForLoadingOfRequestedResource:')
                                        ]
                                        function resourceLoaderShouldWaitForLoadingOfRequestedResource
                                        (resourceLoader: AVAssetResourceLoader;
                                        shouldWaitForLoadingOfRequestedResource
                                        : AVAssetResourceLoadingRequest)
                                        : Boolean;
                                        cdecl;
                                        [MethodName
                                        ('resourceLoader:shouldWaitForRenewalOfRequestedResource:')
                                        ]
                                        function resourceLoaderShouldWaitForRenewalOfRequestedResource
                                        (resourceLoader: AVAssetResourceLoader;
                                        shouldWaitForRenewalOfRequestedResource
                                        : AVAssetResourceRenewalRequest)
                                        : Boolean; cdecl;
                                        [MethodName
                                        ('resourceLoader:didCancelLoadingRequest:')
                                        ]
                                        procedure resourceLoaderDidCancelLoadingRequest
                                        (resourceLoader: AVAssetResourceLoader;
                                        didCancelLoadingRequest
                                        : AVAssetResourceLoadingRequest); cdecl;
                                        [MethodName
                                        ('resourceLoader:shouldWaitForResponseToAuthenticationChallenge:')
                                        ]
                                        function resourceLoaderShouldWaitForResponseToAuthenticationChallenge
                                        (resourceLoader: AVAssetResourceLoader;
                                        shouldWaitForResponseToAuthenticationChallenge
                                        : NSURLAuthenticationChallenge)
                                        : Boolean; cdecl;
                                        [MethodName
                                        ('resourceLoader:didCancelAuthenticationChallenge:')
                                        ]
                                        procedure resourceLoaderDidCancelAuthenticationChallenge
                                        (resourceLoader: AVAssetResourceLoader;
                                        didCancelAuthenticationChallenge
                                        : NSURLAuthenticationChallenge); cdecl;
                                        end;

                                        AVAudioStereoMixing = interface
                                        (IObjectiveC)
                                        ['{6D8EE683-F4FD-43DD-BD8F-A5522B9D5C42}']
                                        procedure setPan(pan: Single);
                                        cdecl;
                                        function pan: Single; cdecl;
                                        end;

                                        AVAudio3DMixing = interface(IObjectiveC)
                                        ['{01E2B56F-379A-4BDE-B041-747253F87CCF}']
                                        procedure setRenderingAlgorithm
                                        (renderingAlgorithm
                                        : AVAudio3DMixingRenderingAlgorithm);
                                        cdecl;
                                        function renderingAlgorithm
                                        : AVAudio3DMixingRenderingAlgorithm;
                                        cdecl;
                                        procedure setRate(rate: Single); cdecl;
                                        function rate: Single; cdecl;
                                        procedure setReverbBlend
                                        (reverbBlend: Single); cdecl;
                                        function reverbBlend: Single; cdecl;
                                        procedure setObstruction
                                        (obstruction: Single); cdecl;
                                        function obstruction: Single; cdecl;
                                        procedure setOcclusion
                                        (occlusion: Single); cdecl;
                                        function occlusion: Single; cdecl;
                                        procedure setPosition
                                        (position: AVAudio3DPoint); cdecl;
                                        function position
                                        : AVAudio3DPoint; cdecl;
                                        end;

                                        AVAudioMixing = interface(IObjectiveC)
                                        ['{0DFBFCEA-016D-4AE6-B01B-3EBC3FE09476}']
                                        function destinationForMixer
                                        (mixer: AVAudioNode;
                                        bus: AVAudioNodeBus)
                                        : AVAudioMixingDestination;
                                        cdecl;
                                        procedure setVolume
                                        (volume: Single); cdecl;
                                        function volume: Single; cdecl;
                                        end;

                                        AVAudioPlayerDelegate = interface
                                        (IObjectiveC)
                                        ['{4B4DB8F1-2D28-44C2-A618-8B63078F0ED5}']
                                        procedure audioPlayerDidFinishPlaying
                                        (player: AVAudioPlayer;
                                        successfully: Boolean);
                                        cdecl;
                                        procedure audioPlayerDecodeErrorDidOccur
                                        (player: AVAudioPlayer;
                                        error: NSError); cdecl;
                                        procedure audioPlayerBeginInterruption
                                        (player: AVAudioPlayer); cdecl;
                                        [MethodName
                                        ('audioPlayerEndInterruption:withOptions:')
                                        ]
                                        procedure audioPlayerEndInterruptionWithOptions
                                        (player: AVAudioPlayer;
                                        withOptions: NSUInteger); cdecl;
                                        [MethodName
                                        ('audioPlayerEndInterruption:withFlags:')
                                        ]
                                        procedure audioPlayerEndInterruptionWithFlags
                                        (player: AVAudioPlayer;
                                        withFlags: NSUInteger); cdecl;
                                        [MethodName
                                        ('audioPlayerEndInterruption:')]
                                        procedure audioPlayerEndInterruption
                                        (player: AVAudioPlayer); cdecl;
                                        end;

                                        AVAudioRecorderDelegate = interface
                                        (IObjectiveC)
                                        ['{DB508298-3F40-4FFA-994E-0D2DA2120857}']
                                        procedure audioRecorderDidFinishRecording
                                        (recorder: AVAudioRecorder;
                                        successfully: Boolean);
                                        cdecl;
                                        procedure audioRecorderEncodeErrorDidOccur
                                        (recorder: AVAudioRecorder;
                                        error: NSError); cdecl;
                                        procedure audioRecorderBeginInterruption
                                        (recorder: AVAudioRecorder); cdecl;
                                        [MethodName
                                        ('audioRecorderEndInterruption:withOptions:')
                                        ]
                                        procedure audioRecorderEndInterruptionWithOptions
                                        (recorder: AVAudioRecorder;
                                        withOptions: NSUInteger); cdecl;
                                        [MethodName
                                        ('audioRecorderEndInterruption:withFlags:')
                                        ]
                                        procedure audioRecorderEndInterruptionWithFlags
                                        (recorder: AVAudioRecorder;
                                        withFlags: NSUInteger); cdecl;
                                        [MethodName
                                        ('audioRecorderEndInterruption:')]
                                        procedure audioRecorderEndInterruption
                                        (recorder: AVAudioRecorder); cdecl;
                                        end;

                                        AVAudioSessionDelegate = interface
                                        (IObjectiveC)
                                        ['{096D85C5-E39E-4A7B-BF1D-CD6BAC223B0C}']
                                        procedure beginInterruption;
                                        cdecl;
                                        procedure endInterruptionWithFlags
                                        (flags: NSUInteger); cdecl;
                                        procedure endInterruption; cdecl;
                                        procedure inputIsAvailableChanged
                                        (isInputAvailable: Boolean); cdecl;
                                        end;

                                        AVCaptureVideoDataOutputSampleBufferDelegate =
                                        interface(IObjectiveC)
                                        ['{09B55A28-8DF4-4CB3-95D5-BBC8E8018735}']
                                        [MethodName
                                        ('captureOutput:didOutputSampleBuffer:fromConnection:')
                                        ]
                                        procedure captureOutputDidOutputSampleBufferFromConnection
                                        (captureOutput: AVCaptureOutput;
                                        didOutputSampleBuffer
                                        : CMSampleBufferRef;
                                        fromConnection: AVCaptureConnection);
                                        cdecl;
                                        [MethodName
                                        ('captureOutput:didDropSampleBuffer:fromConnection:')
                                        ]
                                        procedure captureOutputDidDropSampleBufferFromConnection
                                        (captureOutput: AVCaptureOutput;
                                        didDropSampleBuffer: CMSampleBufferRef;
                                        fromConnection
                                        : AVCaptureConnection); cdecl;
                                        end;

                                        AVCaptureAudioDataOutputSampleBufferDelegate =
                                        interface(IObjectiveC)
                                        ['{BFEF98FA-FB24-426A-84DA-8C66A54CBF03}']
                                        procedure captureOutput
                                        (captureOutput: AVCaptureOutput;
                                        didOutputSampleBuffer
                                        : CMSampleBufferRef;
                                        fromConnection: AVCaptureConnection);
                                        cdecl;
                                        end;

                                        AVCaptureFileOutputRecordingDelegate =
                                        interface(IObjectiveC)
                                        ['{D6B81262-1EC6-41A8-87A7-73BCC87D2D65}']
                                        [MethodName
                                        ('captureOutput:didStartRecordingToOutputFileAtURL:fromConnections:')
                                        ]
                                        procedure captureOutputDidStartRecordingToOutputFileAtURLFromConnections
                                        (captureOutput: AVCaptureFileOutput;
                                        didStartRecordingToOutputFileAtURL
                                        : NSURL; fromConnections: NSArray);
                                        cdecl;
                                        [MethodName
                                        ('captureOutput:didFinishRecordingToOutputFileAtURL:fromConnections:error:')
                                        ]
                                        procedure captureOutputDidFinishRecordingToOutputFileAtURLFromConnectionsError
                                        (captureOutput: AVCaptureFileOutput;
                                        didFinishRecordingToOutputFileAtURL
                                        : NSURL; fromConnections: NSArray;
                                        error: NSError); cdecl;
                                        end;

                                        AVCaptureMetadataOutputObjectsDelegate =
                                        interface(IObjectiveC)
                                        ['{A4022D49-F374-43E7-80C4-AA7E22D6AE45}']
                                        procedure captureOutput
                                        (captureOutput: AVCaptureOutput;
                                        didOutputMetadataObjects: NSArray;
                                        fromConnection: AVCaptureConnection);
                                        cdecl;
                                        end;

                                        AVSpeechSynthesizerDelegate = interface
                                        (IObjectiveC)
                                        ['{9978E4F1-53FC-49F6-BA50-C0A1CA727360}']
                                        [MethodName
                                        ('speechSynthesizer:didStartSpeechUtterance:')
                                        ]
                                        procedure speechSynthesizerDidStartSpeechUtterance
                                        (synthesizer: AVSpeechSynthesizer;
                                        didStartSpeechUtterance
                                        : AVSpeechUtterance);
                                        cdecl;
                                        [MethodName
                                        ('speechSynthesizer:didFinishSpeechUtterance:')
                                        ]
                                        procedure speechSynthesizerDidFinishSpeechUtterance
                                        (synthesizer: AVSpeechSynthesizer;
                                        didFinishSpeechUtterance
                                        : AVSpeechUtterance); cdecl;
                                        [MethodName
                                        ('speechSynthesizer:didPauseSpeechUtterance:')
                                        ]
                                        procedure speechSynthesizerDidPauseSpeechUtterance
                                        (synthesizer: AVSpeechSynthesizer;
                                        didPauseSpeechUtterance
                                        : AVSpeechUtterance); cdecl;
                                        [MethodName
                                        ('speechSynthesizer:didContinueSpeechUtterance:')
                                        ]
                                        procedure speechSynthesizerDidContinueSpeechUtterance
                                        (synthesizer: AVSpeechSynthesizer;
                                        didContinueSpeechUtterance
                                        : AVSpeechUtterance); cdecl;
                                        [MethodName
                                        ('speechSynthesizer:didCancelSpeechUtterance:')
                                        ]
                                        procedure speechSynthesizerDidCancelSpeechUtterance
                                        (synthesizer: AVSpeechSynthesizer;
                                        didCancelSpeechUtterance
                                        : AVSpeechUtterance); cdecl;
                                        [MethodName
                                        ('speechSynthesizer:willSpeakRangeOfSpeechString:utterance:')
                                        ]
                                        procedure speechSynthesizerWillSpeakRangeOfSpeechStringUtterance
                                        (synthesizer: AVSpeechSynthesizer;
                                        willSpeakRangeOfSpeechString: NSRange;
                                        utterance: AVSpeechUtterance); cdecl;
                                        end;

                                        AVPlayerItemMetadataCollectorPushDelegate =
                                        interface(IObjectiveC)
                                        ['{AACC1957-CA12-432B-8779-BA2FF36F4CF1}']
                                        procedure metadataCollector
                                        (metadataCollector
                                        : AVPlayerItemMetadataCollector;
                                        didCollectDateRangeMetadataGroups
                                        : NSArray;
                                        indexesOfNewGroups: NSIndexSet;
                                        indexesOfModifiedGroups: NSIndexSet);
                                        cdecl;
                                        end;

                                        AVPlayerItemOutputPullDelegate =
                                        interface(IObjectiveC)
                                        ['{05D7FACB-8B51-48D8-BCF0-649E018170A7}']
                                        procedure outputMediaDataWillChange
                                        (sender: AVPlayerItemOutput);
                                        cdecl;
                                        procedure outputSequenceWasFlushed
                                        (output: AVPlayerItemOutput); cdecl;
                                        end;

                                        AVPlayerItemLegibleOutputPushDelegate =
                                        interface(IObjectiveC)
                                        ['{EFB90200-E905-412B-8F89-5A0CB0BC9E21}']
                                        procedure legibleOutput
                                        (output: AVPlayerItemLegibleOutput;
                                        didOutputAttributedStrings: NSArray;
                                        nativeSampleBuffers: NSArray;
                                        forItemTime: CMTime);
                                        cdecl;
                                        end;

                                        AVPlayerItemOutputPushDelegate =
                                        interface(IObjectiveC)
                                        ['{69616A81-3A33-4047-B5D2-6C86747512A2}']
                                        procedure outputSequenceWasFlushed
                                        (output: AVPlayerItemOutput);
                                        cdecl;
                                        end;

                                        AVPlayerItemMetadataOutputPushDelegate =
                                        interface(IObjectiveC)
                                        ['{ABFE1D19-DA1D-4ACC-8FE1-1A63616CA8B8}']
                                        procedure metadataOutput
                                        (output: AVPlayerItemMetadataOutput;
                                        didOutputTimedMetadataGroups: NSArray;
                                        fromPlayerItemTrack: AVPlayerItemTrack);
                                        cdecl;
                                        end;

                                        // ===== Exported string consts =====

                                        function AVCoreAnimationBeginTimeAtZero
                                        : Pointer;
                                        function AVLayerVideoGravityResizeAspect
                                        : NSString;
                                        function AVLayerVideoGravityResizeAspectFill
                                        : NSString;
                                        function AVLayerVideoGravityResize
                                        : NSString;
                                        function AVURLAssetPreferPreciseDurationAndTimingKey
                                        : NSString;
                                        function AVURLAssetReferenceRestrictionsKey
                                        : NSString;
                                        function AVURLAssetHTTPCookiesKey
                                        : NSString;
                                        function AVAssetDurationDidChangeNotification
                                        : NSString;
                                        function AVAssetContainsFragmentsDidChangeNotification
                                        : NSString;
                                        function AVAssetWasDefragmentedNotification
                                        : NSString;
                                        function AVAssetChapterMetadataGroupsDidChangeNotification
                                        : NSString;
                                        function AVAssetMediaSelectionGroupsDidChangeNotification
                                        : NSString;
                                        function AVAssetDownloadTaskMinimumRequiredMediaBitrateKey
                                        : NSString;
                                        function AVAssetDownloadTaskMediaSelectionKey
                                        : NSString;
                                        function AVAssetExportPresetLowQuality
                                        : NSString;
                                        function AVAssetExportPresetMediumQuality
                                        : NSString;
                                        function AVAssetExportPresetHighestQuality
                                        : NSString;
                                        function AVAssetExportPreset640x480
                                        : NSString;
                                        function AVAssetExportPreset960x540
                                        : NSString;
                                        function AVAssetExportPreset1280x720
                                        : NSString;
                                        function AVAssetExportPreset1920x1080
                                        : NSString;
                                        function AVAssetExportPreset3840x2160
                                        : NSString;
                                        function AVAssetExportPresetAppleM4A
                                        : NSString;
                                        function AVAssetExportPresetPassthrough
                                        : NSString;
                                        function AVAssetImageGeneratorApertureModeCleanAperture
                                        : NSString;
                                        function AVAssetImageGeneratorApertureModeProductionAperture
                                        : NSString;
                                        function AVAssetImageGeneratorApertureModeEncodedPixels
                                        : NSString;
                                        function AVAssetResourceLoadingRequestStreamingContentKeyRequestRequiresPersistentKey
                                        : NSString;
                                        function AVTrackAssociationTypeAudioFallback
                                        : NSString;
                                        function AVTrackAssociationTypeChapterList
                                        : NSString;
                                        function AVTrackAssociationTypeForcedSubtitlesOnly
                                        : NSString;
                                        function AVTrackAssociationTypeSelectionFollower
                                        : NSString;
                                        function AVTrackAssociationTypeTimecode
                                        : NSString;
                                        function AVTrackAssociationTypeMetadataReferent
                                        : NSString;
                                        function AVAssetTrackTimeRangeDidChangeNotification
                                        : NSString;
                                        function AVAssetTrackSegmentsDidChangeNotification
                                        : NSString;
                                        function AVAssetTrackTrackAssociationsDidChangeNotification
                                        : NSString;
                                        function AVAudioEngineConfigurationChangeNotification
                                        : NSString;
                                        function AVFormatIDKey: NSString;
                                        function AVSampleRateKey: NSString;
                                        function AVNumberOfChannelsKey
                                        : NSString;
                                        function AVLinearPCMBitDepthKey
                                        : NSString;
                                        function AVLinearPCMIsBigEndianKey
                                        : NSString;
                                        function AVLinearPCMIsFloatKey
                                        : NSString;
                                        function AVLinearPCMIsNonInterleaved
                                        : NSString;
                                        function AVEncoderAudioQualityKey
                                        : NSString;
                                        function AVEncoderAudioQualityForVBRKey
                                        : NSString;
                                        function AVEncoderBitRateKey: NSString;
                                        function AVEncoderBitRatePerChannelKey
                                        : NSString;
                                        function AVEncoderBitRateStrategyKey
                                        : NSString;
                                        function AVEncoderBitDepthHintKey
                                        : NSString;
                                        function AVSampleRateConverterAlgorithmKey
                                        : NSString;
                                        function AVSampleRateConverterAudioQualityKey
                                        : NSString;
                                        function AVChannelLayoutKey: NSString;
                                        function AVAudioBitRateStrategy_Constant
                                        : NSString;
                                        function AVAudioBitRateStrategy_LongTermAverage
                                        : NSString;
                                        function AVAudioBitRateStrategy_VariableConstrained
                                        : NSString;
                                        function AVAudioBitRateStrategy_Variable
                                        : NSString;
                                        function AVSampleRateConverterAlgorithm_Normal
                                        : NSString;
                                        function AVSampleRateConverterAlgorithm_Mastering
                                        : NSString;
                                        function AVAudioTimePitchAlgorithmLowQualityZeroLatency
                                        : NSString;
                                        function AVAudioTimePitchAlgorithmTimeDomain
                                        : NSString;
                                        function AVAudioTimePitchAlgorithmSpectral
                                        : NSString;
                                        function AVAudioTimePitchAlgorithmVarispeed
                                        : NSString;
                                        function AVAudioSessionInterruptionNotification
                                        : NSString;
                                        function AVAudioSessionRouteChangeNotification
                                        : NSString;
                                        function AVAudioSessionMediaServicesWereLostNotification
                                        : NSString;
                                        function AVAudioSessionMediaServicesWereResetNotification
                                        : NSString;
                                        function AVAudioSessionSilenceSecondaryAudioHintNotification
                                        : NSString;
                                        function AVAudioSessionInterruptionTypeKey
                                        : NSString;
                                        function AVAudioSessionInterruptionOptionKey
                                        : NSString;
                                        function AVAudioSessionRouteChangeReasonKey
                                        : NSString;
                                        function AVAudioSessionRouteChangePreviousRouteKey
                                        : NSString;
                                        function AVAudioSessionSilenceSecondaryAudioHintTypeKey
                                        : NSString;
                                        function AVAudioSessionCategoryAmbient
                                        : NSString;
                                        function AVAudioSessionCategorySoloAmbient
                                        : NSString;
                                        function AVAudioSessionCategoryPlayback
                                        : NSString;
                                        function AVAudioSessionCategoryRecord
                                        : NSString;
                                        function AVAudioSessionCategoryPlayAndRecord
                                        : NSString;
                                        function AVAudioSessionCategoryAudioProcessing
                                        : NSString;
                                        function AVAudioSessionCategoryMultiRoute
                                        : NSString;
                                        function AVAudioSessionModeDefault
                                        : NSString;
                                        function AVAudioSessionModeVoiceChat
                                        : NSString;
                                        function AVAudioSessionModeGameChat
                                        : NSString;
                                        function AVAudioSessionModeVideoRecording
                                        : NSString;
                                        function AVAudioSessionModeMeasurement
                                        : NSString;
                                        function AVAudioSessionModeMoviePlayback
                                        : NSString;
                                        function AVAudioSessionModeVideoChat
                                        : NSString;
                                        function AVAudioSessionModeSpokenAudio
                                        : NSString;
                                        function AVAudioSessionPortLineIn
                                        : NSString;
                                        function AVAudioSessionPortBuiltInMic
                                        : NSString;
                                        function AVAudioSessionPortHeadsetMic
                                        : NSString;
                                        function AVAudioSessionPortLineOut
                                        : NSString;
                                        function AVAudioSessionPortHeadphones
                                        : NSString;
                                        function AVAudioSessionPortBluetoothA2DP
                                        : NSString;
                                        function AVAudioSessionPortBuiltInReceiver
                                        : NSString;
                                        function AVAudioSessionPortBuiltInSpeaker
                                        : NSString;
                                        function AVAudioSessionPortHDMI
                                        : NSString;
                                        function AVAudioSessionPortAirPlay
                                        : NSString;
                                        function AVAudioSessionPortBluetoothLE
                                        : NSString;
                                        function AVAudioSessionPortBluetoothHFP
                                        : NSString;
                                        function AVAudioSessionPortUSBAudio
                                        : NSString;
                                        function AVAudioSessionPortCarAudio
                                        : NSString;
                                        function AVAudioSessionLocationUpper
                                        : NSString;
                                        function AVAudioSessionLocationLower
                                        : NSString;
                                        function AVAudioSessionOrientationTop
                                        : NSString;
                                        function AVAudioSessionOrientationBottom
                                        : NSString;
                                        function AVAudioSessionOrientationFront
                                        : NSString;
                                        function AVAudioSessionOrientationBack
                                        : NSString;
                                        function AVAudioSessionOrientationLeft
                                        : NSString;
                                        function AVAudioSessionOrientationRight
                                        : NSString;
                                        function AVAudioSessionPolarPatternOmnidirectional
                                        : NSString;
                                        function AVAudioSessionPolarPatternCardioid
                                        : NSString;
                                        function AVAudioSessionPolarPatternSubcardioid
                                        : NSString;
                                        function AVAudioUnitTypeOutput
                                        : NSString;
                                        function AVAudioUnitTypeMusicDevice
                                        : NSString;
                                        function AVAudioUnitTypeMusicEffect
                                        : NSString;
                                        function AVAudioUnitTypeFormatConverter
                                        : NSString;
                                        function AVAudioUnitTypeEffect
                                        : NSString;
                                        function AVAudioUnitTypeMixer: NSString;
                                        function AVAudioUnitTypePanner
                                        : NSString;
                                        function AVAudioUnitTypeGenerator
                                        : NSString;
                                        function AVAudioUnitTypeOfflineEffect
                                        : NSString;
                                        function AVAudioUnitTypeMIDIProcessor
                                        : NSString;
                                        function AVAudioUnitManufacturerNameApple
                                        : NSString;
                                        function AVAudioUnitComponentTagsDidChangeNotification
                                        : NSString;
                                        function AVCaptureDeviceWasConnectedNotification
                                        : NSString;
                                        function AVCaptureDeviceWasDisconnectedNotification
                                        : NSString;
                                        function AVCaptureDeviceSubjectAreaDidChangeNotification
                                        : NSString;
                                        function AVCaptureMaxAvailableTorchLevel
                                        : Pointer;
                                        function AVCaptureLensPositionCurrent
                                        : Pointer;
                                        function AVCaptureExposureDurationCurrent
                                        : Pointer;
                                        function AVCaptureISOCurrent: Pointer;
                                        function AVCaptureExposureTargetBiasCurrent
                                        : Pointer;
                                        function AVCaptureWhiteBalanceGainsCurrent
                                        : Pointer;
                                        function AVCaptureInputPortFormatDescriptionDidChangeNotification
                                        : NSString;
                                        function AVCaptureSessionRuntimeErrorNotification
                                        : NSString;
                                        function AVCaptureSessionErrorKey
                                        : NSString;
                                        function AVCaptureSessionDidStartRunningNotification
                                        : NSString;
                                        function AVCaptureSessionDidStopRunningNotification
                                        : NSString;
                                        function AVCaptureSessionWasInterruptedNotification
                                        : NSString;
                                        function AVCaptureSessionInterruptionReasonKey
                                        : NSString;
                                        function AVCaptureSessionInterruptionEndedNotification
                                        : NSString;
                                        function AVCaptureSessionPresetPhoto
                                        : NSString;
                                        function AVCaptureSessionPresetHigh
                                        : NSString;
                                        function AVCaptureSessionPresetMedium
                                        : NSString;
                                        function AVCaptureSessionPresetLow
                                        : NSString;
                                        function AVCaptureSessionPreset352x288
                                        : NSString;
                                        function AVCaptureSessionPreset640x480
                                        : NSString;
                                        function AVCaptureSessionPreset1280x720
                                        : NSString;
                                        function AVCaptureSessionPreset1920x1080
                                        : NSString;
                                        function AVCaptureSessionPreset3840x2160
                                        : NSString;
                                        function AVCaptureSessionPresetiFrame960x540
                                        : NSString;
                                        function AVCaptureSessionPresetiFrame1280x720
                                        : NSString;
                                        function AVCaptureSessionPresetInputPriority
                                        : NSString;
                                        function AVFoundationErrorDomain
                                        : NSString;
                                        function AVErrorDeviceKey: NSString;
                                        function AVErrorTimeKey: NSString;
                                        function AVErrorFileSizeKey: NSString;
                                        function AVErrorPIDKey: NSString;
                                        function AVErrorRecordingSuccessfullyFinishedKey
                                        : NSString;
                                        function AVErrorMediaTypeKey: NSString;
                                        function AVErrorMediaSubTypeKey
                                        : NSString;
                                        function AVErrorPresentationTimeStampKey
                                        : NSString;
                                        function AVErrorPersistentTrackIDKey
                                        : NSString;
                                        function AVErrorFileTypeKey: NSString;
                                        function AVSpeechUtteranceMinimumSpeechRate
                                        : Pointer;
                                        function AVSpeechUtteranceMaximumSpeechRate
                                        : Pointer;
                                        function AVSpeechUtteranceDefaultSpeechRate
                                        : Pointer;
                                        function AVSpeechSynthesisVoiceIdentifierAlex
                                        : NSString;
                                        function AVMediaTypeVideo: NSString;
                                        function AVMediaTypeAudio: NSString;
                                        function AVMediaTypeText: NSString;
                                        function AVMediaTypeClosedCaption
                                        : NSString;
                                        function AVMediaTypeSubtitle: NSString;
                                        function AVMediaTypeTimecode: NSString;
                                        function AVMediaTypeMetadata: NSString;
                                        function AVMediaTypeMuxed: NSString;
                                        function AVMediaTypeMetadataObject
                                        : NSString;
                                        function AVMediaCharacteristicVisual
                                        : NSString;
                                        function AVMediaCharacteristicAudible
                                        : NSString;
                                        function AVMediaCharacteristicLegible
                                        : NSString;
                                        function AVMediaCharacteristicFrameBased
                                        : NSString;
                                        function AVMediaCharacteristicIsMainProgramContent
                                        : NSString;
                                        function AVMediaCharacteristicIsAuxiliaryContent
                                        : NSString;
                                        function AVMediaCharacteristicContainsOnlyForcedSubtitles
                                        : NSString;
                                        function AVMediaCharacteristicTranscribesSpokenDialogForAccessibility
                                        : NSString;
                                        function AVMediaCharacteristicDescribesMusicAndSoundForAccessibility
                                        : NSString;
                                        function AVMediaCharacteristicEasyToRead
                                        : NSString;
                                        function AVMediaCharacteristicDescribesVideoForAccessibility
                                        : NSString;
                                        function AVMediaCharacteristicLanguageTranslation
                                        : NSString;
                                        function AVMediaCharacteristicDubbedTranslation
                                        : NSString;
                                        function AVMediaCharacteristicVoiceOverTranslation
                                        : NSString;
                                        function AVFileTypeQuickTimeMovie
                                        : NSString;
                                        function AVFileTypeMPEG4: NSString;
                                        function AVFileTypeAppleM4V: NSString;
                                        function AVFileTypeAppleM4A: NSString;
                                        function AVFileType3GPP: NSString;
                                        function AVFileType3GPP2: NSString;
                                        function AVFileTypeCoreAudioFormat
                                        : NSString;
                                        function AVFileTypeWAVE: NSString;
                                        function AVFileTypeAIFF: NSString;
                                        function AVFileTypeAIFC: NSString;
                                        function AVFileTypeAMR: NSString;
                                        function AVFileTypeMPEGLayer3: NSString;
                                        function AVFileTypeSunAU: NSString;
                                        function AVFileTypeAC3: NSString;
                                        function AVFileTypeEnhancedAC3
                                        : NSString;
                                        function AVStreamingKeyDeliveryContentKeyType
                                        : NSString;
                                        function AVStreamingKeyDeliveryPersistentContentKeyType
                                        : NSString;
                                        function AVMetadataKeySpaceCommon
                                        : NSString;
                                        function AVMetadataCommonKeyTitle
                                        : NSString;
                                        function AVMetadataCommonKeyCreator
                                        : NSString;
                                        function AVMetadataCommonKeySubject
                                        : NSString;
                                        function AVMetadataCommonKeyDescription
                                        : NSString;
                                        function AVMetadataCommonKeyPublisher
                                        : NSString;
                                        function AVMetadataCommonKeyContributor
                                        : NSString;
                                        function AVMetadataCommonKeyCreationDate
                                        : NSString;
                                        function AVMetadataCommonKeyLastModifiedDate
                                        : NSString;
                                        function AVMetadataCommonKeyType
                                        : NSString;
                                        function AVMetadataCommonKeyFormat
                                        : NSString;
                                        function AVMetadataCommonKeyIdentifier
                                        : NSString;
                                        function AVMetadataCommonKeySource
                                        : NSString;
                                        function AVMetadataCommonKeyLanguage
                                        : NSString;
                                        function AVMetadataCommonKeyRelation
                                        : NSString;
                                        function AVMetadataCommonKeyLocation
                                        : NSString;
                                        function AVMetadataCommonKeyCopyrights
                                        : NSString;
                                        function AVMetadataCommonKeyAlbumName
                                        : NSString;
                                        function AVMetadataCommonKeyAuthor
                                        : NSString;
                                        function AVMetadataCommonKeyArtist
                                        : NSString;
                                        function AVMetadataCommonKeyArtwork
                                        : NSString;
                                        function AVMetadataCommonKeyMake
                                        : NSString;
                                        function AVMetadataCommonKeyModel
                                        : NSString;
                                        function AVMetadataCommonKeySoftware
                                        : NSString;
                                        function AVMetadataFormatQuickTimeUserData
                                        : NSString;
                                        function AVMetadataKeySpaceQuickTimeUserData
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyAlbum
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyArranger
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyArtist
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyAuthor
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyChapter
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyComment
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyComposer
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyCopyright
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyCreationDate
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyDescription
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyDirector
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyDisclaimer
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyEncodedBy
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyFullName
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyGenre
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyHostComputer
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyInformation
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyKeywords
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyMake
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyModel
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyOriginalArtist
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyOriginalFormat
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyOriginalSource
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyPerformers
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyProducer
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyPublisher
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyProduct
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeySoftware
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeySpecialPlaybackRequirements
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyTrack
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyWarning
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyWriter
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyURLLink
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyLocationISO6709
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyTrackName
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyCredits
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyPhonogramRights
                                        : NSString;
                                        function AVMetadataQuickTimeUserDataKeyTaggedCharacteristic
                                        : NSString;
                                        function AVMetadataFormatISOUserData
                                        : NSString;
                                        function AVMetadataKeySpaceISOUserData
                                        : NSString;
                                        function AVMetadataISOUserDataKeyCopyright
                                        : NSString;
                                        function AVMetadataISOUserDataKeyTaggedCharacteristic
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyCopyright
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyAuthor
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyPerformer
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyGenre
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyRecordingYear
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyLocation
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyTitle
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyDescription
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyCollection
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyUserRating
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyThumbnail
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyAlbumAndTrack
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyKeywordList
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyMediaClassification
                                        : NSString;
                                        function AVMetadata3GPUserDataKeyMediaRating
                                        : NSString;
                                        function AVMetadataFormatQuickTimeMetadata
                                        : NSString;
                                        function AVMetadataKeySpaceQuickTimeMetadata
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyAuthor
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyComment
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyCopyright
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyCreationDate
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyDirector
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyDisplayName
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyInformation
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyKeywords
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyProducer
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyPublisher
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyAlbum
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyArtist
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyArtwork
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyDescription
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeySoftware
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyYear
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyGenre
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyiXML
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyLocationISO6709
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyMake
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyModel
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyArranger
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyEncodedBy
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyOriginalArtist
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyPerformer
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyComposer
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyCredits
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyPhonogramRights
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyCameraIdentifier
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyCameraFrameReadoutTime
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyTitle
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyCollectionUser
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyRatingUser
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyLocationName
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyLocationBody
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyLocationNote
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyLocationRole
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyLocationDate
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyDirectionFacing
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyDirectionMotion
                                        : NSString;
                                        function AVMetadataQuickTimeMetadataKeyContentIdentifier
                                        : NSString;
                                        function AVMetadataFormatiTunesMetadata
                                        : NSString;
                                        function AVMetadataKeySpaceiTunes
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyAlbum
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyArtist
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyUserComment
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyCoverArt
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyCopyright
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyReleaseDate
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyEncodedBy
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyPredefinedGenre
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyUserGenre
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeySongName
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyTrackSubTitle
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyEncodingTool
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyComposer
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyAlbumArtist
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyAccountKind
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyAppleID
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyArtistID
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeySongID
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyDiscCompilation
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyDiscNumber
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyGenreID
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyGrouping
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyPlaylistID
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyContentRating
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyBeatsPerMin
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyTrackNumber
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyArtDirector
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyArranger
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyAuthor
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyLyrics
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyAcknowledgement
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyConductor
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyDescription
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyDirector
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyEQ
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyLinerNotes
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyRecordCompany
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyOriginalArtist
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyPhonogramRights
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyProducer
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyPerformer
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyPublisher
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeySoundEngineer
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeySoloist
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyCredits
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyThanks
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyOnlineExtras
                                        : NSString;
                                        function AVMetadataiTunesMetadataKeyExecProducer
                                        : NSString;
                                        function AVMetadataFormatID3Metadata
                                        : NSString;
                                        function AVMetadataKeySpaceID3
                                        : NSString;
                                        function AVMetadataID3MetadataKeyAudioEncryption
                                        : NSString;
                                        function AVMetadataID3MetadataKeyAttachedPicture
                                        : NSString;
                                        function AVMetadataID3MetadataKeyAudioSeekPointIndex
                                        : NSString;
                                        function AVMetadataID3MetadataKeyComments
                                        : NSString;
                                        function AVMetadataID3MetadataKeyCommercial
                                        : NSString;
                                        function AVMetadataID3MetadataKeyCommerical
                                        : NSString;
                                        function AVMetadataID3MetadataKeyEncryption
                                        : NSString;
                                        function AVMetadataID3MetadataKeyEqualization
                                        : NSString;
                                        function AVMetadataID3MetadataKeyEqualization2
                                        : NSString;
                                        function AVMetadataID3MetadataKeyEventTimingCodes
                                        : NSString;
                                        function AVMetadataID3MetadataKeyGeneralEncapsulatedObject
                                        : NSString;
                                        function AVMetadataID3MetadataKeyGroupIdentifier
                                        : NSString;
                                        function AVMetadataID3MetadataKeyInvolvedPeopleList_v23
                                        : NSString;
                                        function AVMetadataID3MetadataKeyLink
                                        : NSString;
                                        function AVMetadataID3MetadataKeyMusicCDIdentifier
                                        : NSString;
                                        function AVMetadataID3MetadataKeyMPEGLocationLookupTable
                                        : NSString;
                                        function AVMetadataID3MetadataKeyOwnership
                                        : NSString;
                                        function AVMetadataID3MetadataKeyPrivate
                                        : NSString;
                                        function AVMetadataID3MetadataKeyPlayCounter
                                        : NSString;
                                        function AVMetadataID3MetadataKeyPopularimeter
                                        : NSString;
                                        function AVMetadataID3MetadataKeyPositionSynchronization
                                        : NSString;
                                        function AVMetadataID3MetadataKeyRecommendedBufferSize
                                        : NSString;
                                        function AVMetadataID3MetadataKeyRelativeVolumeAdjustment
                                        : NSString;
                                        function AVMetadataID3MetadataKeyRelativeVolumeAdjustment2
                                        : NSString;
                                        function AVMetadataID3MetadataKeyReverb
                                        : NSString;
                                        function AVMetadataID3MetadataKeySeek
                                        : NSString;
                                        function AVMetadataID3MetadataKeySignature
                                        : NSString;
                                        function AVMetadataID3MetadataKeySynchronizedLyric
                                        : NSString;
                                        function AVMetadataID3MetadataKeySynchronizedTempoCodes
                                        : NSString;
                                        function AVMetadataID3MetadataKeyAlbumTitle
                                        : NSString;
                                        function AVMetadataID3MetadataKeyBeatsPerMinute
                                        : NSString;
                                        function AVMetadataID3MetadataKeyComposer
                                        : NSString;
                                        function AVMetadataID3MetadataKeyContentType
                                        : NSString;
                                        function AVMetadataID3MetadataKeyCopyright
                                        : NSString;
                                        function AVMetadataID3MetadataKeyDate
                                        : NSString;
                                        function AVMetadataID3MetadataKeyEncodingTime
                                        : NSString;
                                        function AVMetadataID3MetadataKeyPlaylistDelay
                                        : NSString;
                                        function AVMetadataID3MetadataKeyOriginalReleaseTime
                                        : NSString;
                                        function AVMetadataID3MetadataKeyRecordingTime
                                        : NSString;
                                        function AVMetadataID3MetadataKeyReleaseTime
                                        : NSString;
                                        function AVMetadataID3MetadataKeyTaggingTime
                                        : NSString;
                                        function AVMetadataID3MetadataKeyEncodedBy
                                        : NSString;
                                        function AVMetadataID3MetadataKeyLyricist
                                        : NSString;
                                        function AVMetadataID3MetadataKeyFileType
                                        : NSString;
                                        function AVMetadataID3MetadataKeyTime
                                        : NSString;
                                        function AVMetadataID3MetadataKeyInvolvedPeopleList_v24
                                        : NSString;
                                        function AVMetadataID3MetadataKeyContentGroupDescription
                                        : NSString;
                                        function AVMetadataID3MetadataKeyTitleDescription
                                        : NSString;
                                        function AVMetadataID3MetadataKeySubTitle
                                        : NSString;
                                        function AVMetadataID3MetadataKeyInitialKey
                                        : NSString;
                                        function AVMetadataID3MetadataKeyLanguage
                                        : NSString;
                                        function AVMetadataID3MetadataKeyLength
                                        : NSString;
                                        function AVMetadataID3MetadataKeyMusicianCreditsList
                                        : NSString;
                                        function AVMetadataID3MetadataKeyMediaType
                                        : NSString;
                                        function AVMetadataID3MetadataKeyMood
                                        : NSString;
                                        function AVMetadataID3MetadataKeyOriginalAlbumTitle
                                        : NSString;
                                        function AVMetadataID3MetadataKeyOriginalFilename
                                        : NSString;
                                        function AVMetadataID3MetadataKeyOriginalLyricist
                                        : NSString;
                                        function AVMetadataID3MetadataKeyOriginalArtist
                                        : NSString;
                                        function AVMetadataID3MetadataKeyOriginalReleaseYear
                                        : NSString;
                                        function AVMetadataID3MetadataKeyFileOwner
                                        : NSString;
                                        function AVMetadataID3MetadataKeyLeadPerformer
                                        : NSString;
                                        function AVMetadataID3MetadataKeyBand
                                        : NSString;
                                        function AVMetadataID3MetadataKeyConductor
                                        : NSString;
                                        function AVMetadataID3MetadataKeyModifiedBy
                                        : NSString;
                                        function AVMetadataID3MetadataKeyPartOfASet
                                        : NSString;
                                        function AVMetadataID3MetadataKeyProducedNotice
                                        : NSString;
                                        function AVMetadataID3MetadataKeyPublisher
                                        : NSString;
                                        function AVMetadataID3MetadataKeyTrackNumber
                                        : NSString;
                                        function AVMetadataID3MetadataKeyRecordingDates
                                        : NSString;
                                        function AVMetadataID3MetadataKeyInternetRadioStationName
                                        : NSString;
                                        function AVMetadataID3MetadataKeyInternetRadioStationOwner
                                        : NSString;
                                        function AVMetadataID3MetadataKeySize
                                        : NSString;
                                        function AVMetadataID3MetadataKeyAlbumSortOrder
                                        : NSString;
                                        function AVMetadataID3MetadataKeyPerformerSortOrder
                                        : NSString;
                                        function AVMetadataID3MetadataKeyTitleSortOrder
                                        : NSString;
                                        function AVMetadataID3MetadataKeyInternationalStandardRecordingCode
                                        : NSString;
                                        function AVMetadataID3MetadataKeyEncodedWith
                                        : NSString;
                                        function AVMetadataID3MetadataKeySetSubtitle
                                        : NSString;
                                        function AVMetadataID3MetadataKeyYear
                                        : NSString;
                                        function AVMetadataID3MetadataKeyUserText
                                        : NSString;
                                        function AVMetadataID3MetadataKeyUniqueFileIdentifier
                                        : NSString;
                                        function AVMetadataID3MetadataKeyTermsOfUse
                                        : NSString;
                                        function AVMetadataID3MetadataKeyUnsynchronizedLyric
                                        : NSString;
                                        function AVMetadataID3MetadataKeyCommercialInformation
                                        : NSString;
                                        function AVMetadataID3MetadataKeyCopyrightInformation
                                        : NSString;
                                        function AVMetadataID3MetadataKeyOfficialAudioFileWebpage
                                        : NSString;
                                        function AVMetadataID3MetadataKeyOfficialArtistWebpage
                                        : NSString;
                                        function AVMetadataID3MetadataKeyOfficialAudioSourceWebpage
                                        : NSString;
                                        function AVMetadataID3MetadataKeyOfficialInternetRadioStationHomepage
                                        : NSString;
                                        function AVMetadataID3MetadataKeyPayment
                                        : NSString;
                                        function AVMetadataID3MetadataKeyOfficialPublisherWebpage
                                        : NSString;
                                        function AVMetadataID3MetadataKeyUserURL
                                        : NSString;
                                        function AVMetadataKeySpaceIcy
                                        : NSString;
                                        function AVMetadataIcyMetadataKeyStreamTitle
                                        : NSString;
                                        function AVMetadataIcyMetadataKeyStreamURL
                                        : NSString;
                                        function AVMetadataFormatHLSMetadata
                                        : NSString;
                                        function AVMetadataKeySpaceHLSDateRange
                                        : NSString;
                                        function AVMetadataExtraAttributeValueURIKey
                                        : NSString;
                                        function AVMetadataExtraAttributeBaseURIKey
                                        : NSString;
                                        function AVMetadataExtraAttributeInfoKey
                                        : NSString;
                                        function AVMetadataCommonIdentifierTitle
                                        : NSString;
                                        function AVMetadataCommonIdentifierCreator
                                        : NSString;
                                        function AVMetadataCommonIdentifierSubject
                                        : NSString;
                                        function AVMetadataCommonIdentifierDescription
                                        : NSString;
                                        function AVMetadataCommonIdentifierPublisher
                                        : NSString;
                                        function AVMetadataCommonIdentifierContributor
                                        : NSString;
                                        function AVMetadataCommonIdentifierCreationDate
                                        : NSString;
                                        function AVMetadataCommonIdentifierLastModifiedDate
                                        : NSString;
                                        function AVMetadataCommonIdentifierType
                                        : NSString;
                                        function AVMetadataCommonIdentifierFormat
                                        : NSString;
                                        function AVMetadataCommonIdentifierAssetIdentifier
                                        : NSString;
                                        function AVMetadataCommonIdentifierSource
                                        : NSString;
                                        function AVMetadataCommonIdentifierLanguage
                                        : NSString;
                                        function AVMetadataCommonIdentifierRelation
                                        : NSString;
                                        function AVMetadataCommonIdentifierLocation
                                        : NSString;
                                        function AVMetadataCommonIdentifierCopyrights
                                        : NSString;
                                        function AVMetadataCommonIdentifierAlbumName
                                        : NSString;
                                        function AVMetadataCommonIdentifierAuthor
                                        : NSString;
                                        function AVMetadataCommonIdentifierArtist
                                        : NSString;
                                        function AVMetadataCommonIdentifierArtwork
                                        : NSString;
                                        function AVMetadataCommonIdentifierMake
                                        : NSString;
                                        function AVMetadataCommonIdentifierModel
                                        : NSString;
                                        function AVMetadataCommonIdentifierSoftware
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataAlbum
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataArranger
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataArtist
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataAuthor
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataChapter
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataComment
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataComposer
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataCopyright
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataCreationDate
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataDescription
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataDirector
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataDisclaimer
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataEncodedBy
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataFullName
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataGenre
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataHostComputer
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataInformation
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataKeywords
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataMake
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataModel
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataOriginalArtist
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataOriginalFormat
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataOriginalSource
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataPerformers
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataProducer
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataPublisher
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataProduct
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataSoftware
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataSpecialPlaybackRequirements
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataTrack
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataWarning
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataWriter
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataURLLink
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataLocationISO6709
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataTrackName
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataCredits
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataPhonogramRights
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeUserDataTaggedCharacteristic
                                        : NSString;
                                        function AVMetadataIdentifierISOUserDataCopyright
                                        : NSString;
                                        function AVMetadataIdentifierISOUserDataTaggedCharacteristic
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataCopyright
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataAuthor
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataPerformer
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataGenre
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataRecordingYear
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataLocation
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataTitle
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataDescription
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataCollection
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataUserRating
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataThumbnail
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataAlbumAndTrack
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataKeywordList
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataMediaClassification
                                        : NSString;
                                        function AVMetadataIdentifier3GPUserDataMediaRating
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataAuthor
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataComment
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataCopyright
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataCreationDate
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataDirector
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataDisplayName
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataInformation
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataKeywords
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataProducer
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataPublisher
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataAlbum
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataArtist
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataArtwork
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataDescription
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataSoftware
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataYear
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataGenre
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataiXML
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataLocationISO6709
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataMake
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataModel
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataArranger
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataEncodedBy
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataOriginalArtist
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataPerformer
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataComposer
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataCredits
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataPhonogramRights
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataCameraIdentifier
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataCameraFrameReadoutTime
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataTitle
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataCollectionUser
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataRatingUser
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataLocationName
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataLocationBody
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataLocationNote
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataLocationRole
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataLocationDate
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataDirectionFacing
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataDirectionMotion
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataPreferredAffineTransform
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataDetectedFace
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataVideoOrientation
                                        : NSString;
                                        function AVMetadataIdentifierQuickTimeMetadataContentIdentifier
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataAlbum
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataArtist
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataUserComment
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataCoverArt
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataCopyright
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataReleaseDate
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataEncodedBy
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataPredefinedGenre
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataUserGenre
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataSongName
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataTrackSubTitle
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataEncodingTool
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataComposer
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataAlbumArtist
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataAccountKind
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataAppleID
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataArtistID
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataSongID
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataDiscCompilation
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataDiscNumber
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataGenreID
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataGrouping
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataPlaylistID
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataContentRating
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataBeatsPerMin
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataTrackNumber
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataArtDirector
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataArranger
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataAuthor
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataLyrics
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataAcknowledgement
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataConductor
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataDescription
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataDirector
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataEQ
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataLinerNotes
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataRecordCompany
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataOriginalArtist
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataPhonogramRights
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataProducer
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataPerformer
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataPublisher
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataSoundEngineer
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataSoloist
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataCredits
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataThanks
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataOnlineExtras
                                        : NSString;
                                        function AVMetadataIdentifieriTunesMetadataExecProducer
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataAudioEncryption
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataAttachedPicture
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataAudioSeekPointIndex
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataComments
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataCommercial
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataCommerical
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataEncryption
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataEqualization
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataEqualization2
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataEventTimingCodes
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataGeneralEncapsulatedObject
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataGroupIdentifier
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataInvolvedPeopleList_v23
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataLink
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataMusicCDIdentifier
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataMPEGLocationLookupTable
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataOwnership
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataPrivate
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataPlayCounter
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataPopularimeter
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataPositionSynchronization
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataRecommendedBufferSize
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment2
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataReverb
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataSeek
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataSignature
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataSynchronizedLyric
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataSynchronizedTempoCodes
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataAlbumTitle
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataBeatsPerMinute
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataComposer
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataContentType
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataCopyright
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataDate
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataEncodingTime
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataPlaylistDelay
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataOriginalReleaseTime
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataRecordingTime
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataReleaseTime
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataTaggingTime
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataEncodedBy
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataLyricist
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataFileType
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataTime
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataInvolvedPeopleList_v24
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataContentGroupDescription
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataTitleDescription
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataSubTitle
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataInitialKey
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataLanguage
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataLength
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataMusicianCreditsList
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataMediaType
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataMood
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataOriginalAlbumTitle
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataOriginalFilename
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataOriginalLyricist
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataOriginalArtist
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataOriginalReleaseYear
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataFileOwner
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataLeadPerformer
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataBand
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataConductor
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataModifiedBy
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataPartOfASet
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataProducedNotice
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataPublisher
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataTrackNumber
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataRecordingDates
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataInternetRadioStationName
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataInternetRadioStationOwner
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataSize
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataAlbumSortOrder
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataPerformerSortOrder
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataTitleSortOrder
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataInternationalStandardRecordingCode
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataEncodedWith
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataSetSubtitle
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataYear
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataUserText
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataUniqueFileIdentifier
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataTermsOfUse
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataUnsynchronizedLyric
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataCommercialInformation
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataCopyrightInformation
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataOfficialAudioFileWebpage
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataOfficialArtistWebpage
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataOfficialAudioSourceWebpage
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataOfficialInternetRadioStationHomepage
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataPayment
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataOfficialPublisherWebpage
                                        : NSString;
                                        function AVMetadataIdentifierID3MetadataUserURL
                                        : NSString;
                                        function AVMetadataIdentifierIcyMetadataStreamTitle
                                        : NSString;
                                        function AVMetadataIdentifierIcyMetadataStreamURL
                                        : NSString;
                                        function AVMetadataObjectTypeFace
                                        : NSString;
                                        function AVMetadataObjectTypeUPCECode
                                        : NSString;
                                        function AVMetadataObjectTypeCode39Code
                                        : NSString;
                                        function AVMetadataObjectTypeCode39Mod43Code
                                        : NSString;
                                        function AVMetadataObjectTypeEAN13Code
                                        : NSString;
                                        function AVMetadataObjectTypeEAN8Code
                                        : NSString;
                                        function AVMetadataObjectTypeCode93Code
                                        : NSString;
                                        function AVMetadataObjectTypeCode128Code
                                        : NSString;
                                        function AVMetadataObjectTypePDF417Code
                                        : NSString;
                                        function AVMetadataObjectTypeQRCode
                                        : NSString;
                                        function AVMetadataObjectTypeAztecCode
                                        : NSString;
                                        function AVMetadataObjectTypeInterleaved2of5Code
                                        : NSString;
                                        function AVMetadataObjectTypeITF14Code
                                        : NSString;
                                        function AVMetadataObjectTypeDataMatrixCode
                                        : NSString;
                                        function AVOutputSettingsPreset640x480
                                        : NSString;
                                        function AVOutputSettingsPreset960x540
                                        : NSString;
                                        function AVOutputSettingsPreset1280x720
                                        : NSString;
                                        function AVOutputSettingsPreset1920x1080
                                        : NSString;
                                        function AVOutputSettingsPreset3840x2160
                                        : NSString;
                                        function AVPlayerItemTimeJumpedNotification
                                        : NSString;
                                        function AVPlayerItemDidPlayToEndTimeNotification
                                        : NSString;
                                        function AVPlayerItemFailedToPlayToEndTimeNotification
                                        : NSString;
                                        function AVPlayerItemPlaybackStalledNotification
                                        : NSString;
                                        function AVPlayerItemNewAccessLogEntryNotification
                                        : NSString;
                                        function AVPlayerItemNewErrorLogEntryNotification
                                        : NSString;
                                        function AVPlayerItemFailedToPlayToEndTimeErrorKey
                                        : NSString;
                                        function AVPlayerItemLegibleOutputTextStylingResolutionDefault
                                        : NSString;
                                        function AVPlayerItemLegibleOutputTextStylingResolutionSourceAndRulesOnly
                                        : NSString;
                                        function AVSampleBufferDisplayLayerFailedToDecodeNotification
                                        : NSString;
                                        function AVSampleBufferDisplayLayerFailedToDecodeNotificationErrorKey
                                        : NSString;
                                        function AVVideoCodecKey: NSString;
                                        function AVVideoCodecH264: NSString;
                                        function AVVideoCodecJPEG: NSString;
                                        function AVVideoCodecAppleProRes4444
                                        : NSString;
                                        function AVVideoCodecAppleProRes422
                                        : NSString;
                                        function AVVideoWidthKey: NSString;
                                        function AVVideoHeightKey: NSString;
                                        function AVVideoPixelAspectRatioKey
                                        : NSString;
                                        function AVVideoPixelAspectRatioHorizontalSpacingKey
                                        : NSString;
                                        function AVVideoPixelAspectRatioVerticalSpacingKey
                                        : NSString;
                                        function AVVideoCleanApertureKey
                                        : NSString;
                                        function AVVideoCleanApertureWidthKey
                                        : NSString;
                                        function AVVideoCleanApertureHeightKey
                                        : NSString;
                                        function AVVideoCleanApertureHorizontalOffsetKey
                                        : NSString;
                                        function AVVideoCleanApertureVerticalOffsetKey
                                        : NSString;
                                        function AVVideoScalingModeKey
                                        : NSString;
                                        function AVVideoScalingModeFit
                                        : NSString;
                                        function AVVideoScalingModeResize
                                        : NSString;
                                        function AVVideoScalingModeResizeAspect
                                        : NSString;
                                        function AVVideoScalingModeResizeAspectFill
                                        : NSString;
                                        function AVVideoCompressionPropertiesKey
                                        : NSString;
                                        function AVVideoAverageBitRateKey
                                        : NSString;
                                        function AVVideoQualityKey: NSString;
                                        function AVVideoMaxKeyFrameIntervalKey
                                        : NSString;
                                        function AVVideoMaxKeyFrameIntervalDurationKey
                                        : NSString;
                                        function AVVideoAllowFrameReorderingKey
                                        : NSString;
                                        function AVVideoProfileLevelKey
                                        : NSString;
                                        function AVVideoProfileLevelH264Baseline30
                                        : NSString;
                                        function AVVideoProfileLevelH264Baseline31
                                        : NSString;
                                        function AVVideoProfileLevelH264Baseline41
                                        : NSString;
                                        function AVVideoProfileLevelH264BaselineAutoLevel
                                        : NSString;
                                        function AVVideoProfileLevelH264Main30
                                        : NSString;
                                        function AVVideoProfileLevelH264Main31
                                        : NSString;
                                        function AVVideoProfileLevelH264Main32
                                        : NSString;
                                        function AVVideoProfileLevelH264Main41
                                        : NSString;
                                        function AVVideoProfileLevelH264MainAutoLevel
                                        : NSString;
                                        function AVVideoProfileLevelH264High40
                                        : NSString;
                                        function AVVideoProfileLevelH264High41
                                        : NSString;
                                        function AVVideoProfileLevelH264HighAutoLevel
                                        : NSString;
                                        function AVVideoH264EntropyModeKey
                                        : NSString;
                                        function AVVideoH264EntropyModeCAVLC
                                        : NSString;
                                        function AVVideoH264EntropyModeCABAC
                                        : NSString;
                                        function AVVideoExpectedSourceFrameRateKey
                                        : NSString;
                                        function AVVideoAverageNonDroppableFrameRateKey
                                        : NSString;
                                        function AVVideoEncoderSpecificationKey
                                        : NSString;


                                        // ===== External functions =====

                                        const
                                        libAVFoundation =
                                        '/System/Library/Frameworks/AVFoundation.framework/AVFoundation';
                                        function AVAudioMake3DPoint(x: Single;
                                        y: Single; z: Single): AVAudio3DPoint;
                                        cdecl; external libAVFoundation name _PU
                                        + 'AVAudioMake3DPoint';
                                        function AVAudioMake3DVector(x: Single;
                                        y: Single; z: Single): AVAudio3DVector;
                                        cdecl; external libAVFoundation name _PU
                                        + 'AVAudioMake3DVector';
                                        function AVAudioMake3DVectorOrientation
                                        (forward: AVAudio3DVector;
                                        up: AVAudio3DVector)
                                        : AVAudio3DVectorOrientation; cdecl;
                                        external libAVFoundation name _PU +
                                        'AVAudioMake3DVectorOrientation';
                                        function AVAudioMake3DAngularOrientation
                                        (yaw: Single; pitch: Single;
                                        roll: Single)
                                        : AVAudio3DAngularOrientation; cdecl;
                                        external libAVFoundation name _PU +
                                        'AVAudioMake3DAngularOrientation';
                                        function AVMakeBeatRange
                                        (startBeat: AVMusicTimeStamp;
                                        lengthInBeats: AVMusicTimeStamp)
                                        : AVBeatRange; cdecl;
                                        external libAVFoundation name _PU +
                                        'AVMakeBeatRange';
                                        function AVMakeRectWithAspectRatioInsideRect
                                        (aspectRatio: CGSize;
                                        boundingRect: CGRect): CGRect; cdecl;
                                        external libAVFoundation name _PU +
                                        'AVMakeRectWithAspectRatioInsideRect';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AVFoundationModule: THandle;

{$ENDIF IOS}

function AVLayerVideoGravityResizeAspect: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVLayerVideoGravityResizeAspect');
end;

function AVLayerVideoGravityResizeAspectFill: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVLayerVideoGravityResizeAspectFill');
end;

function AVLayerVideoGravityResize: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVLayerVideoGravityResize');
end;

function AVURLAssetPreferPreciseDurationAndTimingKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVURLAssetPreferPreciseDurationAndTimingKey');
end;

function AVURLAssetReferenceRestrictionsKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVURLAssetReferenceRestrictionsKey');
end;

function AVURLAssetHTTPCookiesKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVURLAssetHTTPCookiesKey');
end;

function AVAssetDurationDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetDurationDidChangeNotification');
end;

function AVAssetContainsFragmentsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetContainsFragmentsDidChangeNotification');
end;

function AVAssetWasDefragmentedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetWasDefragmentedNotification');
end;

function AVAssetChapterMetadataGroupsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetChapterMetadataGroupsDidChangeNotification');
end;

function AVAssetMediaSelectionGroupsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetMediaSelectionGroupsDidChangeNotification');
end;

function AVAssetDownloadTaskMinimumRequiredMediaBitrateKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetDownloadTaskMinimumRequiredMediaBitrateKey');
end;

function AVAssetDownloadTaskMediaSelectionKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetDownloadTaskMediaSelectionKey');
end;

function AVAssetExportPresetLowQuality: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetExportPresetLowQuality');
end;

function AVAssetExportPresetMediumQuality: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetExportPresetMediumQuality');
end;

function AVAssetExportPresetHighestQuality: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetExportPresetHighestQuality');
end;

function AVAssetExportPreset640x480: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPreset640x480');
end;

function AVAssetExportPreset960x540: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPreset960x540');
end;

function AVAssetExportPreset1280x720: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPreset1280x720');
end;

function AVAssetExportPreset1920x1080: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPreset1920x1080');
end;

function AVAssetExportPreset3840x2160: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPreset3840x2160');
end;

function AVAssetExportPresetAppleM4A: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetAppleM4A');
end;

function AVAssetExportPresetPassthrough: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetExportPresetPassthrough');
end;

function AVAssetImageGeneratorApertureModeCleanAperture: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetImageGeneratorApertureModeCleanAperture');
end;

function AVAssetImageGeneratorApertureModeProductionAperture: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetImageGeneratorApertureModeProductionAperture');
end;

function AVAssetImageGeneratorApertureModeEncodedPixels: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetImageGeneratorApertureModeEncodedPixels');
end;

function AVAssetResourceLoadingRequestStreamingContentKeyRequestRequiresPersistentKey
  : NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetResourceLoadingRequestStreamingContentKeyRequestRequiresPersistentKey');
end;

function AVTrackAssociationTypeAudioFallback: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVTrackAssociationTypeAudioFallback');
end;

function AVTrackAssociationTypeChapterList: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVTrackAssociationTypeChapterList');
end;

function AVTrackAssociationTypeForcedSubtitlesOnly: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVTrackAssociationTypeForcedSubtitlesOnly');
end;

function AVTrackAssociationTypeSelectionFollower: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVTrackAssociationTypeSelectionFollower');
end;

function AVTrackAssociationTypeTimecode: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVTrackAssociationTypeTimecode');
end;

function AVTrackAssociationTypeMetadataReferent: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVTrackAssociationTypeMetadataReferent');
end;

function AVAssetTrackTimeRangeDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetTrackTimeRangeDidChangeNotification');
end;

function AVAssetTrackSegmentsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetTrackSegmentsDidChangeNotification');
end;

function AVAssetTrackTrackAssociationsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetTrackTrackAssociationsDidChangeNotification');
end;

function AVAudioEngineConfigurationChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioEngineConfigurationChangeNotification');
end;

function AVFormatIDKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFormatIDKey');
end;

function AVSampleRateKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSampleRateKey');
end;

function AVNumberOfChannelsKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVNumberOfChannelsKey');
end;

function AVLinearPCMBitDepthKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVLinearPCMBitDepthKey');
end;

function AVLinearPCMIsBigEndianKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVLinearPCMIsBigEndianKey');
end;

function AVLinearPCMIsFloatKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVLinearPCMIsFloatKey');
end;

function AVLinearPCMIsNonInterleaved: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVLinearPCMIsNonInterleaved');
end;

function AVEncoderAudioQualityKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVEncoderAudioQualityKey');
end;

function AVEncoderAudioQualityForVBRKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVEncoderAudioQualityForVBRKey');
end;

function AVEncoderBitRateKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVEncoderBitRateKey');
end;

function AVEncoderBitRatePerChannelKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVEncoderBitRatePerChannelKey');
end;

function AVEncoderBitRateStrategyKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVEncoderBitRateStrategyKey');
end;

function AVEncoderBitDepthHintKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVEncoderBitDepthHintKey');
end;

function AVSampleRateConverterAlgorithmKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVSampleRateConverterAlgorithmKey');
end;

function AVSampleRateConverterAudioQualityKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVSampleRateConverterAudioQualityKey');
end;

function AVChannelLayoutKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVChannelLayoutKey');
end;

function AVAudioBitRateStrategy_Constant: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioBitRateStrategy_Constant');
end;

function AVAudioBitRateStrategy_LongTermAverage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioBitRateStrategy_LongTermAverage');
end;

function AVAudioBitRateStrategy_VariableConstrained: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioBitRateStrategy_VariableConstrained');
end;

function AVAudioBitRateStrategy_Variable: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioBitRateStrategy_Variable');
end;

function AVSampleRateConverterAlgorithm_Normal: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVSampleRateConverterAlgorithm_Normal');
end;

function AVSampleRateConverterAlgorithm_Mastering: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVSampleRateConverterAlgorithm_Mastering');
end;

function AVAudioTimePitchAlgorithmLowQualityZeroLatency: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioTimePitchAlgorithmLowQualityZeroLatency');
end;

function AVAudioTimePitchAlgorithmTimeDomain: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioTimePitchAlgorithmTimeDomain');
end;

function AVAudioTimePitchAlgorithmSpectral: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioTimePitchAlgorithmSpectral');
end;

function AVAudioTimePitchAlgorithmVarispeed: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioTimePitchAlgorithmVarispeed');
end;

function AVAudioSessionInterruptionNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionInterruptionNotification');
end;

function AVAudioSessionRouteChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionRouteChangeNotification');
end;

function AVAudioSessionMediaServicesWereLostNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionMediaServicesWereLostNotification');
end;

function AVAudioSessionMediaServicesWereResetNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionMediaServicesWereResetNotification');
end;

function AVAudioSessionSilenceSecondaryAudioHintNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionSilenceSecondaryAudioHintNotification');
end;

function AVAudioSessionInterruptionTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionInterruptionTypeKey');
end;

function AVAudioSessionInterruptionOptionKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionInterruptionOptionKey');
end;

function AVAudioSessionRouteChangeReasonKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionRouteChangeReasonKey');
end;

function AVAudioSessionRouteChangePreviousRouteKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionRouteChangePreviousRouteKey');
end;

function AVAudioSessionSilenceSecondaryAudioHintTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionSilenceSecondaryAudioHintTypeKey');
end;

function AVAudioSessionCategoryAmbient: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionCategoryAmbient');
end;

function AVAudioSessionCategorySoloAmbient: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionCategorySoloAmbient');
end;

function AVAudioSessionCategoryPlayback: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionCategoryPlayback');
end;

function AVAudioSessionCategoryRecord: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionCategoryRecord');
end;

function AVAudioSessionCategoryPlayAndRecord: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionCategoryPlayAndRecord');
end;

function AVAudioSessionCategoryAudioProcessing: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionCategoryAudioProcessing');
end;

function AVAudioSessionCategoryMultiRoute: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionCategoryMultiRoute');
end;

function AVAudioSessionModeDefault: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionModeDefault');
end;

function AVAudioSessionModeVoiceChat: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionModeVoiceChat');
end;

function AVAudioSessionModeGameChat: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionModeGameChat');
end;

function AVAudioSessionModeVideoRecording: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionModeVideoRecording');
end;

function AVAudioSessionModeMeasurement: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionModeMeasurement');
end;

function AVAudioSessionModeMoviePlayback: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionModeMoviePlayback');
end;

function AVAudioSessionModeVideoChat: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionModeVideoChat');
end;

function AVAudioSessionModeSpokenAudio: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionModeSpokenAudio');
end;

function AVAudioSessionPortLineIn: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionPortLineIn');
end;

function AVAudioSessionPortBuiltInMic: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionPortBuiltInMic');
end;

function AVAudioSessionPortHeadsetMic: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionPortHeadsetMic');
end;

function AVAudioSessionPortLineOut: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionPortLineOut');
end;

function AVAudioSessionPortHeadphones: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionPortHeadphones');
end;

function AVAudioSessionPortBluetoothA2DP: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionPortBluetoothA2DP');
end;

function AVAudioSessionPortBuiltInReceiver: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionPortBuiltInReceiver');
end;

function AVAudioSessionPortBuiltInSpeaker: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionPortBuiltInSpeaker');
end;

function AVAudioSessionPortHDMI: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionPortHDMI');
end;

function AVAudioSessionPortAirPlay: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionPortAirPlay');
end;

function AVAudioSessionPortBluetoothLE: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionPortBluetoothLE');
end;

function AVAudioSessionPortBluetoothHFP: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionPortBluetoothHFP');
end;

function AVAudioSessionPortUSBAudio: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionPortUSBAudio');
end;

function AVAudioSessionPortCarAudio: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionPortCarAudio');
end;

function AVAudioSessionLocationUpper: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionLocationUpper');
end;

function AVAudioSessionLocationLower: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionLocationLower');
end;

function AVAudioSessionOrientationTop: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioSessionOrientationTop');
end;

function AVAudioSessionOrientationBottom: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionOrientationBottom');
end;

function AVAudioSessionOrientationFront: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionOrientationFront');
end;

function AVAudioSessionOrientationBack: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionOrientationBack');
end;

function AVAudioSessionOrientationLeft: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionOrientationLeft');
end;

function AVAudioSessionOrientationRight: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionOrientationRight');
end;

function AVAudioSessionPolarPatternOmnidirectional: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionPolarPatternOmnidirectional');
end;

function AVAudioSessionPolarPatternCardioid: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionPolarPatternCardioid');
end;

function AVAudioSessionPolarPatternSubcardioid: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioSessionPolarPatternSubcardioid');
end;

function AVAudioUnitTypeOutput: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeOutput');
end;

function AVAudioUnitTypeMusicDevice: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeMusicDevice');
end;

function AVAudioUnitTypeMusicEffect: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeMusicEffect');
end;

function AVAudioUnitTypeFormatConverter: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioUnitTypeFormatConverter');
end;

function AVAudioUnitTypeEffect: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeEffect');
end;

function AVAudioUnitTypeMixer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeMixer');
end;

function AVAudioUnitTypePanner: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypePanner');
end;

function AVAudioUnitTypeGenerator: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeGenerator');
end;

function AVAudioUnitTypeOfflineEffect: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeOfflineEffect');
end;

function AVAudioUnitTypeMIDIProcessor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeMIDIProcessor');
end;

function AVAudioUnitManufacturerNameApple: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioUnitManufacturerNameApple');
end;

function AVAudioUnitComponentTagsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAudioUnitComponentTagsDidChangeNotification');
end;

function AVCaptureDeviceWasConnectedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureDeviceWasConnectedNotification');
end;

function AVCaptureDeviceWasDisconnectedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureDeviceWasDisconnectedNotification');
end;

function AVCaptureDeviceSubjectAreaDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureDeviceSubjectAreaDidChangeNotification');
end;

function AVCaptureInputPortFormatDescriptionDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureInputPortFormatDescriptionDidChangeNotification');
end;

function AVCaptureSessionRuntimeErrorNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionRuntimeErrorNotification');
end;

function AVCaptureSessionErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionErrorKey');
end;

function AVCaptureSessionDidStartRunningNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionDidStartRunningNotification');
end;

function AVCaptureSessionDidStopRunningNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionDidStopRunningNotification');
end;

function AVCaptureSessionWasInterruptedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionWasInterruptedNotification');
end;

function AVCaptureSessionInterruptionReasonKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionInterruptionReasonKey');
end;

function AVCaptureSessionInterruptionEndedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionInterruptionEndedNotification');
end;

function AVCaptureSessionPresetPhoto: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPresetPhoto');
end;

function AVCaptureSessionPresetHigh: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPresetHigh');
end;

function AVCaptureSessionPresetMedium: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPresetMedium');
end;

function AVCaptureSessionPresetLow: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPresetLow');
end;

function AVCaptureSessionPreset352x288: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionPreset352x288');
end;

function AVCaptureSessionPreset640x480: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionPreset640x480');
end;

function AVCaptureSessionPreset1280x720: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionPreset1280x720');
end;

function AVCaptureSessionPreset1920x1080: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionPreset1920x1080');
end;

function AVCaptureSessionPreset3840x2160: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionPreset3840x2160');
end;

function AVCaptureSessionPresetiFrame960x540: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionPresetiFrame960x540');
end;

function AVCaptureSessionPresetiFrame1280x720: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionPresetiFrame1280x720');
end;

function AVCaptureSessionPresetInputPriority: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionPresetInputPriority');
end;

function AVFoundationErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFoundationErrorDomain');
end;

function AVErrorDeviceKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorDeviceKey');
end;

function AVErrorTimeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorTimeKey');
end;

function AVErrorFileSizeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorFileSizeKey');
end;

function AVErrorPIDKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorPIDKey');
end;

function AVErrorRecordingSuccessfullyFinishedKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVErrorRecordingSuccessfullyFinishedKey');
end;

function AVErrorMediaTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorMediaTypeKey');
end;

function AVErrorMediaSubTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorMediaSubTypeKey');
end;

function AVErrorPresentationTimeStampKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVErrorPresentationTimeStampKey');
end;

function AVErrorPersistentTrackIDKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorPersistentTrackIDKey');
end;

function AVErrorFileTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorFileTypeKey');
end;

function AVSpeechSynthesisVoiceIdentifierAlex: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVSpeechSynthesisVoiceIdentifierAlex');
end;

function AVMediaTypeVideo: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeVideo');
end;

function AVMediaTypeAudio: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeAudio');
end;

function AVMediaTypeText: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeText');
end;

function AVMediaTypeClosedCaption: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeClosedCaption');
end;

function AVMediaTypeSubtitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeSubtitle');
end;

function AVMediaTypeTimecode: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeTimecode');
end;

function AVMediaTypeMetadata: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeMetadata');
end;

function AVMediaTypeMuxed: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeMuxed');
end;

function AVMediaTypeMetadataObject: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeMetadataObject');
end;

function AVMediaCharacteristicVisual: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicVisual');
end;

function AVMediaCharacteristicAudible: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicAudible');
end;

function AVMediaCharacteristicLegible: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicLegible');
end;

function AVMediaCharacteristicFrameBased: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMediaCharacteristicFrameBased');
end;

function AVMediaCharacteristicIsMainProgramContent: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMediaCharacteristicIsMainProgramContent');
end;

function AVMediaCharacteristicIsAuxiliaryContent: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMediaCharacteristicIsAuxiliaryContent');
end;

function AVMediaCharacteristicContainsOnlyForcedSubtitles: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMediaCharacteristicContainsOnlyForcedSubtitles');
end;

function AVMediaCharacteristicTranscribesSpokenDialogForAccessibility: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMediaCharacteristicTranscribesSpokenDialogForAccessibility');
end;

function AVMediaCharacteristicDescribesMusicAndSoundForAccessibility: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMediaCharacteristicDescribesMusicAndSoundForAccessibility');
end;

function AVMediaCharacteristicEasyToRead: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMediaCharacteristicEasyToRead');
end;

function AVMediaCharacteristicDescribesVideoForAccessibility: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMediaCharacteristicDescribesVideoForAccessibility');
end;

function AVMediaCharacteristicLanguageTranslation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMediaCharacteristicLanguageTranslation');
end;

function AVMediaCharacteristicDubbedTranslation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMediaCharacteristicDubbedTranslation');
end;

function AVMediaCharacteristicVoiceOverTranslation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMediaCharacteristicVoiceOverTranslation');
end;

function AVFileTypeQuickTimeMovie: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeQuickTimeMovie');
end;

function AVFileTypeMPEG4: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeMPEG4');
end;

function AVFileTypeAppleM4V: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeAppleM4V');
end;

function AVFileTypeAppleM4A: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeAppleM4A');
end;

function AVFileType3GPP: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileType3GPP');
end;

function AVFileType3GPP2: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileType3GPP2');
end;

function AVFileTypeCoreAudioFormat: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeCoreAudioFormat');
end;

function AVFileTypeWAVE: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeWAVE');
end;

function AVFileTypeAIFF: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeAIFF');
end;

function AVFileTypeAIFC: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeAIFC');
end;

function AVFileTypeAMR: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeAMR');
end;

function AVFileTypeMPEGLayer3: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeMPEGLayer3');
end;

function AVFileTypeSunAU: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeSunAU');
end;

function AVFileTypeAC3: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeAC3');
end;

function AVFileTypeEnhancedAC3: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeEnhancedAC3');
end;

function AVStreamingKeyDeliveryContentKeyType: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVStreamingKeyDeliveryContentKeyType');
end;

function AVStreamingKeyDeliveryPersistentContentKeyType: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVStreamingKeyDeliveryPersistentContentKeyType');
end;

function AVMetadataKeySpaceCommon: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataKeySpaceCommon');
end;

function AVMetadataCommonKeyTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyTitle');
end;

function AVMetadataCommonKeyCreator: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyCreator');
end;

function AVMetadataCommonKeySubject: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeySubject');
end;

function AVMetadataCommonKeyDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonKeyDescription');
end;

function AVMetadataCommonKeyPublisher: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyPublisher');
end;

function AVMetadataCommonKeyContributor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonKeyContributor');
end;

function AVMetadataCommonKeyCreationDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonKeyCreationDate');
end;

function AVMetadataCommonKeyLastModifiedDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonKeyLastModifiedDate');
end;

function AVMetadataCommonKeyType: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyType');
end;

function AVMetadataCommonKeyFormat: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyFormat');
end;

function AVMetadataCommonKeyIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonKeyIdentifier');
end;

function AVMetadataCommonKeySource: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeySource');
end;

function AVMetadataCommonKeyLanguage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyLanguage');
end;

function AVMetadataCommonKeyRelation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyRelation');
end;

function AVMetadataCommonKeyLocation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyLocation');
end;

function AVMetadataCommonKeyCopyrights: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonKeyCopyrights');
end;

function AVMetadataCommonKeyAlbumName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyAlbumName');
end;

function AVMetadataCommonKeyAuthor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyAuthor');
end;

function AVMetadataCommonKeyArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyArtist');
end;

function AVMetadataCommonKeyArtwork: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyArtwork');
end;

function AVMetadataCommonKeyMake: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyMake');
end;

function AVMetadataCommonKeyModel: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyModel');
end;

function AVMetadataCommonKeySoftware: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeySoftware');
end;

function AVMetadataFormatQuickTimeUserData: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataFormatQuickTimeUserData');
end;

function AVMetadataKeySpaceQuickTimeUserData: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataKeySpaceQuickTimeUserData');
end;

function AVMetadataQuickTimeUserDataKeyAlbum: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyAlbum');
end;

function AVMetadataQuickTimeUserDataKeyArranger: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyArranger');
end;

function AVMetadataQuickTimeUserDataKeyArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyArtist');
end;

function AVMetadataQuickTimeUserDataKeyAuthor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyAuthor');
end;

function AVMetadataQuickTimeUserDataKeyChapter: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyChapter');
end;

function AVMetadataQuickTimeUserDataKeyComment: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyComment');
end;

function AVMetadataQuickTimeUserDataKeyComposer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyComposer');
end;

function AVMetadataQuickTimeUserDataKeyCopyright: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyCopyright');
end;

function AVMetadataQuickTimeUserDataKeyCreationDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyCreationDate');
end;

function AVMetadataQuickTimeUserDataKeyDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyDescription');
end;

function AVMetadataQuickTimeUserDataKeyDirector: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyDirector');
end;

function AVMetadataQuickTimeUserDataKeyDisclaimer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyDisclaimer');
end;

function AVMetadataQuickTimeUserDataKeyEncodedBy: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyEncodedBy');
end;

function AVMetadataQuickTimeUserDataKeyFullName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyFullName');
end;

function AVMetadataQuickTimeUserDataKeyGenre: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyGenre');
end;

function AVMetadataQuickTimeUserDataKeyHostComputer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyHostComputer');
end;

function AVMetadataQuickTimeUserDataKeyInformation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyInformation');
end;

function AVMetadataQuickTimeUserDataKeyKeywords: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyKeywords');
end;

function AVMetadataQuickTimeUserDataKeyMake: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyMake');
end;

function AVMetadataQuickTimeUserDataKeyModel: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyModel');
end;

function AVMetadataQuickTimeUserDataKeyOriginalArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyOriginalArtist');
end;

function AVMetadataQuickTimeUserDataKeyOriginalFormat: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyOriginalFormat');
end;

function AVMetadataQuickTimeUserDataKeyOriginalSource: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyOriginalSource');
end;

function AVMetadataQuickTimeUserDataKeyPerformers: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyPerformers');
end;

function AVMetadataQuickTimeUserDataKeyProducer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyProducer');
end;

function AVMetadataQuickTimeUserDataKeyPublisher: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyPublisher');
end;

function AVMetadataQuickTimeUserDataKeyProduct: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyProduct');
end;

function AVMetadataQuickTimeUserDataKeySoftware: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeySoftware');
end;

function AVMetadataQuickTimeUserDataKeySpecialPlaybackRequirements: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeySpecialPlaybackRequirements');
end;

function AVMetadataQuickTimeUserDataKeyTrack: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyTrack');
end;

function AVMetadataQuickTimeUserDataKeyWarning: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyWarning');
end;

function AVMetadataQuickTimeUserDataKeyWriter: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyWriter');
end;

function AVMetadataQuickTimeUserDataKeyURLLink: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyURLLink');
end;

function AVMetadataQuickTimeUserDataKeyLocationISO6709: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyLocationISO6709');
end;

function AVMetadataQuickTimeUserDataKeyTrackName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyTrackName');
end;

function AVMetadataQuickTimeUserDataKeyCredits: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyCredits');
end;

function AVMetadataQuickTimeUserDataKeyPhonogramRights: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyPhonogramRights');
end;

function AVMetadataQuickTimeUserDataKeyTaggedCharacteristic: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyTaggedCharacteristic');
end;

function AVMetadataFormatISOUserData: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataFormatISOUserData');
end;

function AVMetadataKeySpaceISOUserData: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataKeySpaceISOUserData');
end;

function AVMetadataISOUserDataKeyCopyright: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataISOUserDataKeyCopyright');
end;

function AVMetadataISOUserDataKeyTaggedCharacteristic: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataISOUserDataKeyTaggedCharacteristic');
end;

function AVMetadata3GPUserDataKeyCopyright: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyCopyright');
end;

function AVMetadata3GPUserDataKeyAuthor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyAuthor');
end;

function AVMetadata3GPUserDataKeyPerformer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyPerformer');
end;

function AVMetadata3GPUserDataKeyGenre: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyGenre');
end;

function AVMetadata3GPUserDataKeyRecordingYear: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyRecordingYear');
end;

function AVMetadata3GPUserDataKeyLocation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyLocation');
end;

function AVMetadata3GPUserDataKeyTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyTitle');
end;

function AVMetadata3GPUserDataKeyDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyDescription');
end;

function AVMetadata3GPUserDataKeyCollection: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyCollection');
end;

function AVMetadata3GPUserDataKeyUserRating: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyUserRating');
end;

function AVMetadata3GPUserDataKeyThumbnail: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyThumbnail');
end;

function AVMetadata3GPUserDataKeyAlbumAndTrack: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyAlbumAndTrack');
end;

function AVMetadata3GPUserDataKeyKeywordList: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyKeywordList');
end;

function AVMetadata3GPUserDataKeyMediaClassification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyMediaClassification');
end;

function AVMetadata3GPUserDataKeyMediaRating: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyMediaRating');
end;

function AVMetadataFormatQuickTimeMetadata: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataFormatQuickTimeMetadata');
end;

function AVMetadataKeySpaceQuickTimeMetadata: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataKeySpaceQuickTimeMetadata');
end;

function AVMetadataQuickTimeMetadataKeyAuthor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyAuthor');
end;

function AVMetadataQuickTimeMetadataKeyComment: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyComment');
end;

function AVMetadataQuickTimeMetadataKeyCopyright: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyCopyright');
end;

function AVMetadataQuickTimeMetadataKeyCreationDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyCreationDate');
end;

function AVMetadataQuickTimeMetadataKeyDirector: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyDirector');
end;

function AVMetadataQuickTimeMetadataKeyDisplayName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyDisplayName');
end;

function AVMetadataQuickTimeMetadataKeyInformation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyInformation');
end;

function AVMetadataQuickTimeMetadataKeyKeywords: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyKeywords');
end;

function AVMetadataQuickTimeMetadataKeyProducer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyProducer');
end;

function AVMetadataQuickTimeMetadataKeyPublisher: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyPublisher');
end;

function AVMetadataQuickTimeMetadataKeyAlbum: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyAlbum');
end;

function AVMetadataQuickTimeMetadataKeyArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyArtist');
end;

function AVMetadataQuickTimeMetadataKeyArtwork: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyArtwork');
end;

function AVMetadataQuickTimeMetadataKeyDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyDescription');
end;

function AVMetadataQuickTimeMetadataKeySoftware: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeySoftware');
end;

function AVMetadataQuickTimeMetadataKeyYear: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyYear');
end;

function AVMetadataQuickTimeMetadataKeyGenre: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyGenre');
end;

function AVMetadataQuickTimeMetadataKeyiXML: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyiXML');
end;

function AVMetadataQuickTimeMetadataKeyLocationISO6709: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyLocationISO6709');
end;

function AVMetadataQuickTimeMetadataKeyMake: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyMake');
end;

function AVMetadataQuickTimeMetadataKeyModel: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyModel');
end;

function AVMetadataQuickTimeMetadataKeyArranger: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyArranger');
end;

function AVMetadataQuickTimeMetadataKeyEncodedBy: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyEncodedBy');
end;

function AVMetadataQuickTimeMetadataKeyOriginalArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyOriginalArtist');
end;

function AVMetadataQuickTimeMetadataKeyPerformer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyPerformer');
end;

function AVMetadataQuickTimeMetadataKeyComposer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyComposer');
end;

function AVMetadataQuickTimeMetadataKeyCredits: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyCredits');
end;

function AVMetadataQuickTimeMetadataKeyPhonogramRights: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyPhonogramRights');
end;

function AVMetadataQuickTimeMetadataKeyCameraIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyCameraIdentifier');
end;

function AVMetadataQuickTimeMetadataKeyCameraFrameReadoutTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyCameraFrameReadoutTime');
end;

function AVMetadataQuickTimeMetadataKeyTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyTitle');
end;

function AVMetadataQuickTimeMetadataKeyCollectionUser: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyCollectionUser');
end;

function AVMetadataQuickTimeMetadataKeyRatingUser: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyRatingUser');
end;

function AVMetadataQuickTimeMetadataKeyLocationName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyLocationName');
end;

function AVMetadataQuickTimeMetadataKeyLocationBody: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyLocationBody');
end;

function AVMetadataQuickTimeMetadataKeyLocationNote: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyLocationNote');
end;

function AVMetadataQuickTimeMetadataKeyLocationRole: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyLocationRole');
end;

function AVMetadataQuickTimeMetadataKeyLocationDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyLocationDate');
end;

function AVMetadataQuickTimeMetadataKeyDirectionFacing: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyDirectionFacing');
end;

function AVMetadataQuickTimeMetadataKeyDirectionMotion: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyDirectionMotion');
end;

function AVMetadataQuickTimeMetadataKeyContentIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyContentIdentifier');
end;

function AVMetadataFormatiTunesMetadata: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataFormatiTunesMetadata');
end;

function AVMetadataKeySpaceiTunes: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataKeySpaceiTunes');
end;

function AVMetadataiTunesMetadataKeyAlbum: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyAlbum');
end;

function AVMetadataiTunesMetadataKeyArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyArtist');
end;

function AVMetadataiTunesMetadataKeyUserComment: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyUserComment');
end;

function AVMetadataiTunesMetadataKeyCoverArt: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyCoverArt');
end;

function AVMetadataiTunesMetadataKeyCopyright: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyCopyright');
end;

function AVMetadataiTunesMetadataKeyReleaseDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyReleaseDate');
end;

function AVMetadataiTunesMetadataKeyEncodedBy: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyEncodedBy');
end;

function AVMetadataiTunesMetadataKeyPredefinedGenre: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyPredefinedGenre');
end;

function AVMetadataiTunesMetadataKeyUserGenre: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyUserGenre');
end;

function AVMetadataiTunesMetadataKeySongName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeySongName');
end;

function AVMetadataiTunesMetadataKeyTrackSubTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyTrackSubTitle');
end;

function AVMetadataiTunesMetadataKeyEncodingTool: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyEncodingTool');
end;

function AVMetadataiTunesMetadataKeyComposer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyComposer');
end;

function AVMetadataiTunesMetadataKeyAlbumArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyAlbumArtist');
end;

function AVMetadataiTunesMetadataKeyAccountKind: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyAccountKind');
end;

function AVMetadataiTunesMetadataKeyAppleID: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyAppleID');
end;

function AVMetadataiTunesMetadataKeyArtistID: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyArtistID');
end;

function AVMetadataiTunesMetadataKeySongID: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeySongID');
end;

function AVMetadataiTunesMetadataKeyDiscCompilation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyDiscCompilation');
end;

function AVMetadataiTunesMetadataKeyDiscNumber: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyDiscNumber');
end;

function AVMetadataiTunesMetadataKeyGenreID: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyGenreID');
end;

function AVMetadataiTunesMetadataKeyGrouping: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyGrouping');
end;

function AVMetadataiTunesMetadataKeyPlaylistID: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyPlaylistID');
end;

function AVMetadataiTunesMetadataKeyContentRating: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyContentRating');
end;

function AVMetadataiTunesMetadataKeyBeatsPerMin: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyBeatsPerMin');
end;

function AVMetadataiTunesMetadataKeyTrackNumber: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyTrackNumber');
end;

function AVMetadataiTunesMetadataKeyArtDirector: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyArtDirector');
end;

function AVMetadataiTunesMetadataKeyArranger: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyArranger');
end;

function AVMetadataiTunesMetadataKeyAuthor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyAuthor');
end;

function AVMetadataiTunesMetadataKeyLyrics: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyLyrics');
end;

function AVMetadataiTunesMetadataKeyAcknowledgement: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyAcknowledgement');
end;

function AVMetadataiTunesMetadataKeyConductor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyConductor');
end;

function AVMetadataiTunesMetadataKeyDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyDescription');
end;

function AVMetadataiTunesMetadataKeyDirector: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyDirector');
end;

function AVMetadataiTunesMetadataKeyEQ: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyEQ');
end;

function AVMetadataiTunesMetadataKeyLinerNotes: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyLinerNotes');
end;

function AVMetadataiTunesMetadataKeyRecordCompany: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyRecordCompany');
end;

function AVMetadataiTunesMetadataKeyOriginalArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyOriginalArtist');
end;

function AVMetadataiTunesMetadataKeyPhonogramRights: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyPhonogramRights');
end;

function AVMetadataiTunesMetadataKeyProducer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyProducer');
end;

function AVMetadataiTunesMetadataKeyPerformer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyPerformer');
end;

function AVMetadataiTunesMetadataKeyPublisher: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyPublisher');
end;

function AVMetadataiTunesMetadataKeySoundEngineer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeySoundEngineer');
end;

function AVMetadataiTunesMetadataKeySoloist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeySoloist');
end;

function AVMetadataiTunesMetadataKeyCredits: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyCredits');
end;

function AVMetadataiTunesMetadataKeyThanks: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyThanks');
end;

function AVMetadataiTunesMetadataKeyOnlineExtras: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyOnlineExtras');
end;

function AVMetadataiTunesMetadataKeyExecProducer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyExecProducer');
end;

function AVMetadataFormatID3Metadata: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataFormatID3Metadata');
end;

function AVMetadataKeySpaceID3: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataKeySpaceID3');
end;

function AVMetadataID3MetadataKeyAudioEncryption: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyAudioEncryption');
end;

function AVMetadataID3MetadataKeyAttachedPicture: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyAttachedPicture');
end;

function AVMetadataID3MetadataKeyAudioSeekPointIndex: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyAudioSeekPointIndex');
end;

function AVMetadataID3MetadataKeyComments: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyComments');
end;

function AVMetadataID3MetadataKeyCommercial: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyCommercial');
end;

function AVMetadataID3MetadataKeyCommerical: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyCommerical');
end;

function AVMetadataID3MetadataKeyEncryption: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEncryption');
end;

function AVMetadataID3MetadataKeyEqualization: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEqualization');
end;

function AVMetadataID3MetadataKeyEqualization2: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEqualization2');
end;

function AVMetadataID3MetadataKeyEventTimingCodes: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEventTimingCodes');
end;

function AVMetadataID3MetadataKeyGeneralEncapsulatedObject: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyGeneralEncapsulatedObject');
end;

function AVMetadataID3MetadataKeyGroupIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyGroupIdentifier');
end;

function AVMetadataID3MetadataKeyInvolvedPeopleList_v23: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyInvolvedPeopleList_v23');
end;

function AVMetadataID3MetadataKeyLink: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyLink');
end;

function AVMetadataID3MetadataKeyMusicCDIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyMusicCDIdentifier');
end;

function AVMetadataID3MetadataKeyMPEGLocationLookupTable: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyMPEGLocationLookupTable');
end;

function AVMetadataID3MetadataKeyOwnership: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOwnership');
end;

function AVMetadataID3MetadataKeyPrivate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPrivate');
end;

function AVMetadataID3MetadataKeyPlayCounter: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPlayCounter');
end;

function AVMetadataID3MetadataKeyPopularimeter: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPopularimeter');
end;

function AVMetadataID3MetadataKeyPositionSynchronization: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPositionSynchronization');
end;

function AVMetadataID3MetadataKeyRecommendedBufferSize: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyRecommendedBufferSize');
end;

function AVMetadataID3MetadataKeyRelativeVolumeAdjustment: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyRelativeVolumeAdjustment');
end;

function AVMetadataID3MetadataKeyRelativeVolumeAdjustment2: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyRelativeVolumeAdjustment2');
end;

function AVMetadataID3MetadataKeyReverb: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyReverb');
end;

function AVMetadataID3MetadataKeySeek: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeySeek');
end;

function AVMetadataID3MetadataKeySignature: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeySignature');
end;

function AVMetadataID3MetadataKeySynchronizedLyric: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeySynchronizedLyric');
end;

function AVMetadataID3MetadataKeySynchronizedTempoCodes: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeySynchronizedTempoCodes');
end;

function AVMetadataID3MetadataKeyAlbumTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyAlbumTitle');
end;

function AVMetadataID3MetadataKeyBeatsPerMinute: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyBeatsPerMinute');
end;

function AVMetadataID3MetadataKeyComposer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyComposer');
end;

function AVMetadataID3MetadataKeyContentType: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyContentType');
end;

function AVMetadataID3MetadataKeyCopyright: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyCopyright');
end;

function AVMetadataID3MetadataKeyDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyDate');
end;

function AVMetadataID3MetadataKeyEncodingTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEncodingTime');
end;

function AVMetadataID3MetadataKeyPlaylistDelay: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPlaylistDelay');
end;

function AVMetadataID3MetadataKeyOriginalReleaseTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOriginalReleaseTime');
end;

function AVMetadataID3MetadataKeyRecordingTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyRecordingTime');
end;

function AVMetadataID3MetadataKeyReleaseTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyReleaseTime');
end;

function AVMetadataID3MetadataKeyTaggingTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyTaggingTime');
end;

function AVMetadataID3MetadataKeyEncodedBy: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEncodedBy');
end;

function AVMetadataID3MetadataKeyLyricist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyLyricist');
end;

function AVMetadataID3MetadataKeyFileType: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyFileType');
end;

function AVMetadataID3MetadataKeyTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyTime');
end;

function AVMetadataID3MetadataKeyInvolvedPeopleList_v24: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyInvolvedPeopleList_v24');
end;

function AVMetadataID3MetadataKeyContentGroupDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyContentGroupDescription');
end;

function AVMetadataID3MetadataKeyTitleDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyTitleDescription');
end;

function AVMetadataID3MetadataKeySubTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeySubTitle');
end;

function AVMetadataID3MetadataKeyInitialKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyInitialKey');
end;

function AVMetadataID3MetadataKeyLanguage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyLanguage');
end;

function AVMetadataID3MetadataKeyLength: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyLength');
end;

function AVMetadataID3MetadataKeyMusicianCreditsList: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyMusicianCreditsList');
end;

function AVMetadataID3MetadataKeyMediaType: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyMediaType');
end;

function AVMetadataID3MetadataKeyMood: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyMood');
end;

function AVMetadataID3MetadataKeyOriginalAlbumTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOriginalAlbumTitle');
end;

function AVMetadataID3MetadataKeyOriginalFilename: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOriginalFilename');
end;

function AVMetadataID3MetadataKeyOriginalLyricist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOriginalLyricist');
end;

function AVMetadataID3MetadataKeyOriginalArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOriginalArtist');
end;

function AVMetadataID3MetadataKeyOriginalReleaseYear: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOriginalReleaseYear');
end;

function AVMetadataID3MetadataKeyFileOwner: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyFileOwner');
end;

function AVMetadataID3MetadataKeyLeadPerformer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyLeadPerformer');
end;

function AVMetadataID3MetadataKeyBand: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyBand');
end;

function AVMetadataID3MetadataKeyConductor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyConductor');
end;

function AVMetadataID3MetadataKeyModifiedBy: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyModifiedBy');
end;

function AVMetadataID3MetadataKeyPartOfASet: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPartOfASet');
end;

function AVMetadataID3MetadataKeyProducedNotice: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyProducedNotice');
end;

function AVMetadataID3MetadataKeyPublisher: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPublisher');
end;

function AVMetadataID3MetadataKeyTrackNumber: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyTrackNumber');
end;

function AVMetadataID3MetadataKeyRecordingDates: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyRecordingDates');
end;

function AVMetadataID3MetadataKeyInternetRadioStationName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyInternetRadioStationName');
end;

function AVMetadataID3MetadataKeyInternetRadioStationOwner: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyInternetRadioStationOwner');
end;

function AVMetadataID3MetadataKeySize: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeySize');
end;

function AVMetadataID3MetadataKeyAlbumSortOrder: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyAlbumSortOrder');
end;

function AVMetadataID3MetadataKeyPerformerSortOrder: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPerformerSortOrder');
end;

function AVMetadataID3MetadataKeyTitleSortOrder: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyTitleSortOrder');
end;

function AVMetadataID3MetadataKeyInternationalStandardRecordingCode: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyInternationalStandardRecordingCode');
end;

function AVMetadataID3MetadataKeyEncodedWith: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEncodedWith');
end;

function AVMetadataID3MetadataKeySetSubtitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeySetSubtitle');
end;

function AVMetadataID3MetadataKeyYear: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyYear');
end;

function AVMetadataID3MetadataKeyUserText: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyUserText');
end;

function AVMetadataID3MetadataKeyUniqueFileIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyUniqueFileIdentifier');
end;

function AVMetadataID3MetadataKeyTermsOfUse: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyTermsOfUse');
end;

function AVMetadataID3MetadataKeyUnsynchronizedLyric: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyUnsynchronizedLyric');
end;

function AVMetadataID3MetadataKeyCommercialInformation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyCommercialInformation');
end;

function AVMetadataID3MetadataKeyCopyrightInformation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyCopyrightInformation');
end;

function AVMetadataID3MetadataKeyOfficialAudioFileWebpage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOfficialAudioFileWebpage');
end;

function AVMetadataID3MetadataKeyOfficialArtistWebpage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOfficialArtistWebpage');
end;

function AVMetadataID3MetadataKeyOfficialAudioSourceWebpage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOfficialAudioSourceWebpage');
end;

function AVMetadataID3MetadataKeyOfficialInternetRadioStationHomepage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOfficialInternetRadioStationHomepage');
end;

function AVMetadataID3MetadataKeyPayment: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPayment');
end;

function AVMetadataID3MetadataKeyOfficialPublisherWebpage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOfficialPublisherWebpage');
end;

function AVMetadataID3MetadataKeyUserURL: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataID3MetadataKeyUserURL');
end;

function AVMetadataKeySpaceIcy: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataKeySpaceIcy');
end;

function AVMetadataIcyMetadataKeyStreamTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIcyMetadataKeyStreamTitle');
end;

function AVMetadataIcyMetadataKeyStreamURL: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIcyMetadataKeyStreamURL');
end;

function AVMetadataFormatHLSMetadata: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataFormatHLSMetadata');
end;

function AVMetadataKeySpaceHLSDateRange: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataKeySpaceHLSDateRange');
end;

function AVMetadataExtraAttributeValueURIKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataExtraAttributeValueURIKey');
end;

function AVMetadataExtraAttributeBaseURIKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataExtraAttributeBaseURIKey');
end;

function AVMetadataExtraAttributeInfoKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataExtraAttributeInfoKey');
end;

function AVMetadataCommonIdentifierTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierTitle');
end;

function AVMetadataCommonIdentifierCreator: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierCreator');
end;

function AVMetadataCommonIdentifierSubject: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierSubject');
end;

function AVMetadataCommonIdentifierDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierDescription');
end;

function AVMetadataCommonIdentifierPublisher: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierPublisher');
end;

function AVMetadataCommonIdentifierContributor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierContributor');
end;

function AVMetadataCommonIdentifierCreationDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierCreationDate');
end;

function AVMetadataCommonIdentifierLastModifiedDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierLastModifiedDate');
end;

function AVMetadataCommonIdentifierType: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierType');
end;

function AVMetadataCommonIdentifierFormat: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierFormat');
end;

function AVMetadataCommonIdentifierAssetIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierAssetIdentifier');
end;

function AVMetadataCommonIdentifierSource: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierSource');
end;

function AVMetadataCommonIdentifierLanguage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierLanguage');
end;

function AVMetadataCommonIdentifierRelation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierRelation');
end;

function AVMetadataCommonIdentifierLocation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierLocation');
end;

function AVMetadataCommonIdentifierCopyrights: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierCopyrights');
end;

function AVMetadataCommonIdentifierAlbumName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierAlbumName');
end;

function AVMetadataCommonIdentifierAuthor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierAuthor');
end;

function AVMetadataCommonIdentifierArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierArtist');
end;

function AVMetadataCommonIdentifierArtwork: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierArtwork');
end;

function AVMetadataCommonIdentifierMake: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierMake');
end;

function AVMetadataCommonIdentifierModel: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierModel');
end;

function AVMetadataCommonIdentifierSoftware: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataCommonIdentifierSoftware');
end;

function AVMetadataIdentifierQuickTimeUserDataAlbum: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataAlbum');
end;

function AVMetadataIdentifierQuickTimeUserDataArranger: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataArranger');
end;

function AVMetadataIdentifierQuickTimeUserDataArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataArtist');
end;

function AVMetadataIdentifierQuickTimeUserDataAuthor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataAuthor');
end;

function AVMetadataIdentifierQuickTimeUserDataChapter: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataChapter');
end;

function AVMetadataIdentifierQuickTimeUserDataComment: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataComment');
end;

function AVMetadataIdentifierQuickTimeUserDataComposer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataComposer');
end;

function AVMetadataIdentifierQuickTimeUserDataCopyright: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataCopyright');
end;

function AVMetadataIdentifierQuickTimeUserDataCreationDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataCreationDate');
end;

function AVMetadataIdentifierQuickTimeUserDataDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataDescription');
end;

function AVMetadataIdentifierQuickTimeUserDataDirector: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataDirector');
end;

function AVMetadataIdentifierQuickTimeUserDataDisclaimer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataDisclaimer');
end;

function AVMetadataIdentifierQuickTimeUserDataEncodedBy: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataEncodedBy');
end;

function AVMetadataIdentifierQuickTimeUserDataFullName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataFullName');
end;

function AVMetadataIdentifierQuickTimeUserDataGenre: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataGenre');
end;

function AVMetadataIdentifierQuickTimeUserDataHostComputer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataHostComputer');
end;

function AVMetadataIdentifierQuickTimeUserDataInformation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataInformation');
end;

function AVMetadataIdentifierQuickTimeUserDataKeywords: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataKeywords');
end;

function AVMetadataIdentifierQuickTimeUserDataMake: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataMake');
end;

function AVMetadataIdentifierQuickTimeUserDataModel: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataModel');
end;

function AVMetadataIdentifierQuickTimeUserDataOriginalArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataOriginalArtist');
end;

function AVMetadataIdentifierQuickTimeUserDataOriginalFormat: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataOriginalFormat');
end;

function AVMetadataIdentifierQuickTimeUserDataOriginalSource: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataOriginalSource');
end;

function AVMetadataIdentifierQuickTimeUserDataPerformers: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataPerformers');
end;

function AVMetadataIdentifierQuickTimeUserDataProducer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataProducer');
end;

function AVMetadataIdentifierQuickTimeUserDataPublisher: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataPublisher');
end;

function AVMetadataIdentifierQuickTimeUserDataProduct: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataProduct');
end;

function AVMetadataIdentifierQuickTimeUserDataSoftware: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataSoftware');
end;

function AVMetadataIdentifierQuickTimeUserDataSpecialPlaybackRequirements
  : NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataSpecialPlaybackRequirements');
end;

function AVMetadataIdentifierQuickTimeUserDataTrack: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataTrack');
end;

function AVMetadataIdentifierQuickTimeUserDataWarning: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataWarning');
end;

function AVMetadataIdentifierQuickTimeUserDataWriter: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataWriter');
end;

function AVMetadataIdentifierQuickTimeUserDataURLLink: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataURLLink');
end;

function AVMetadataIdentifierQuickTimeUserDataLocationISO6709: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataLocationISO6709');
end;

function AVMetadataIdentifierQuickTimeUserDataTrackName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataTrackName');
end;

function AVMetadataIdentifierQuickTimeUserDataCredits: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataCredits');
end;

function AVMetadataIdentifierQuickTimeUserDataPhonogramRights: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataPhonogramRights');
end;

function AVMetadataIdentifierQuickTimeUserDataTaggedCharacteristic: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataTaggedCharacteristic');
end;

function AVMetadataIdentifierISOUserDataCopyright: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierISOUserDataCopyright');
end;

function AVMetadataIdentifierISOUserDataTaggedCharacteristic: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierISOUserDataTaggedCharacteristic');
end;

function AVMetadataIdentifier3GPUserDataCopyright: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataCopyright');
end;

function AVMetadataIdentifier3GPUserDataAuthor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataAuthor');
end;

function AVMetadataIdentifier3GPUserDataPerformer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataPerformer');
end;

function AVMetadataIdentifier3GPUserDataGenre: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataGenre');
end;

function AVMetadataIdentifier3GPUserDataRecordingYear: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataRecordingYear');
end;

function AVMetadataIdentifier3GPUserDataLocation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataLocation');
end;

function AVMetadataIdentifier3GPUserDataTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataTitle');
end;

function AVMetadataIdentifier3GPUserDataDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataDescription');
end;

function AVMetadataIdentifier3GPUserDataCollection: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataCollection');
end;

function AVMetadataIdentifier3GPUserDataUserRating: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataUserRating');
end;

function AVMetadataIdentifier3GPUserDataThumbnail: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataThumbnail');
end;

function AVMetadataIdentifier3GPUserDataAlbumAndTrack: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataAlbumAndTrack');
end;

function AVMetadataIdentifier3GPUserDataKeywordList: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataKeywordList');
end;

function AVMetadataIdentifier3GPUserDataMediaClassification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataMediaClassification');
end;

function AVMetadataIdentifier3GPUserDataMediaRating: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataMediaRating');
end;

function AVMetadataIdentifierQuickTimeMetadataAuthor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataAuthor');
end;

function AVMetadataIdentifierQuickTimeMetadataComment: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataComment');
end;

function AVMetadataIdentifierQuickTimeMetadataCopyright: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataCopyright');
end;

function AVMetadataIdentifierQuickTimeMetadataCreationDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataCreationDate');
end;

function AVMetadataIdentifierQuickTimeMetadataDirector: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDirector');
end;

function AVMetadataIdentifierQuickTimeMetadataDisplayName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDisplayName');
end;

function AVMetadataIdentifierQuickTimeMetadataInformation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataInformation');
end;

function AVMetadataIdentifierQuickTimeMetadataKeywords: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataKeywords');
end;

function AVMetadataIdentifierQuickTimeMetadataProducer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataProducer');
end;

function AVMetadataIdentifierQuickTimeMetadataPublisher: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataPublisher');
end;

function AVMetadataIdentifierQuickTimeMetadataAlbum: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataAlbum');
end;

function AVMetadataIdentifierQuickTimeMetadataArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataArtist');
end;

function AVMetadataIdentifierQuickTimeMetadataArtwork: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataArtwork');
end;

function AVMetadataIdentifierQuickTimeMetadataDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDescription');
end;

function AVMetadataIdentifierQuickTimeMetadataSoftware: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataSoftware');
end;

function AVMetadataIdentifierQuickTimeMetadataYear: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataYear');
end;

function AVMetadataIdentifierQuickTimeMetadataGenre: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataGenre');
end;

function AVMetadataIdentifierQuickTimeMetadataiXML: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataiXML');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationISO6709: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLocationISO6709');
end;

function AVMetadataIdentifierQuickTimeMetadataMake: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataMake');
end;

function AVMetadataIdentifierQuickTimeMetadataModel: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataModel');
end;

function AVMetadataIdentifierQuickTimeMetadataArranger: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataArranger');
end;

function AVMetadataIdentifierQuickTimeMetadataEncodedBy: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataEncodedBy');
end;

function AVMetadataIdentifierQuickTimeMetadataOriginalArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataOriginalArtist');
end;

function AVMetadataIdentifierQuickTimeMetadataPerformer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataPerformer');
end;

function AVMetadataIdentifierQuickTimeMetadataComposer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataComposer');
end;

function AVMetadataIdentifierQuickTimeMetadataCredits: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataCredits');
end;

function AVMetadataIdentifierQuickTimeMetadataPhonogramRights: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataPhonogramRights');
end;

function AVMetadataIdentifierQuickTimeMetadataCameraIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataCameraIdentifier');
end;

function AVMetadataIdentifierQuickTimeMetadataCameraFrameReadoutTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataCameraFrameReadoutTime');
end;

function AVMetadataIdentifierQuickTimeMetadataTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataTitle');
end;

function AVMetadataIdentifierQuickTimeMetadataCollectionUser: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataCollectionUser');
end;

function AVMetadataIdentifierQuickTimeMetadataRatingUser: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataRatingUser');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLocationName');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationBody: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLocationBody');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationNote: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLocationNote');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationRole: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLocationRole');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLocationDate');
end;

function AVMetadataIdentifierQuickTimeMetadataDirectionFacing: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDirectionFacing');
end;

function AVMetadataIdentifierQuickTimeMetadataDirectionMotion: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDirectionMotion');
end;

function AVMetadataIdentifierQuickTimeMetadataPreferredAffineTransform
  : NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataPreferredAffineTransform');
end;

function AVMetadataIdentifierQuickTimeMetadataDetectedFace: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDetectedFace');
end;

function AVMetadataIdentifierQuickTimeMetadataVideoOrientation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataVideoOrientation');
end;

function AVMetadataIdentifierQuickTimeMetadataContentIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataContentIdentifier');
end;

function AVMetadataIdentifieriTunesMetadataAlbum: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataAlbum');
end;

function AVMetadataIdentifieriTunesMetadataArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataArtist');
end;

function AVMetadataIdentifieriTunesMetadataUserComment: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataUserComment');
end;

function AVMetadataIdentifieriTunesMetadataCoverArt: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataCoverArt');
end;

function AVMetadataIdentifieriTunesMetadataCopyright: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataCopyright');
end;

function AVMetadataIdentifieriTunesMetadataReleaseDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataReleaseDate');
end;

function AVMetadataIdentifieriTunesMetadataEncodedBy: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataEncodedBy');
end;

function AVMetadataIdentifieriTunesMetadataPredefinedGenre: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataPredefinedGenre');
end;

function AVMetadataIdentifieriTunesMetadataUserGenre: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataUserGenre');
end;

function AVMetadataIdentifieriTunesMetadataSongName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataSongName');
end;

function AVMetadataIdentifieriTunesMetadataTrackSubTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataTrackSubTitle');
end;

function AVMetadataIdentifieriTunesMetadataEncodingTool: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataEncodingTool');
end;

function AVMetadataIdentifieriTunesMetadataComposer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataComposer');
end;

function AVMetadataIdentifieriTunesMetadataAlbumArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataAlbumArtist');
end;

function AVMetadataIdentifieriTunesMetadataAccountKind: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataAccountKind');
end;

function AVMetadataIdentifieriTunesMetadataAppleID: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataAppleID');
end;

function AVMetadataIdentifieriTunesMetadataArtistID: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataArtistID');
end;

function AVMetadataIdentifieriTunesMetadataSongID: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataSongID');
end;

function AVMetadataIdentifieriTunesMetadataDiscCompilation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataDiscCompilation');
end;

function AVMetadataIdentifieriTunesMetadataDiscNumber: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataDiscNumber');
end;

function AVMetadataIdentifieriTunesMetadataGenreID: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataGenreID');
end;

function AVMetadataIdentifieriTunesMetadataGrouping: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataGrouping');
end;

function AVMetadataIdentifieriTunesMetadataPlaylistID: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataPlaylistID');
end;

function AVMetadataIdentifieriTunesMetadataContentRating: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataContentRating');
end;

function AVMetadataIdentifieriTunesMetadataBeatsPerMin: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataBeatsPerMin');
end;

function AVMetadataIdentifieriTunesMetadataTrackNumber: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataTrackNumber');
end;

function AVMetadataIdentifieriTunesMetadataArtDirector: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataArtDirector');
end;

function AVMetadataIdentifieriTunesMetadataArranger: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataArranger');
end;

function AVMetadataIdentifieriTunesMetadataAuthor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataAuthor');
end;

function AVMetadataIdentifieriTunesMetadataLyrics: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataLyrics');
end;

function AVMetadataIdentifieriTunesMetadataAcknowledgement: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataAcknowledgement');
end;

function AVMetadataIdentifieriTunesMetadataConductor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataConductor');
end;

function AVMetadataIdentifieriTunesMetadataDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataDescription');
end;

function AVMetadataIdentifieriTunesMetadataDirector: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataDirector');
end;

function AVMetadataIdentifieriTunesMetadataEQ: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataEQ');
end;

function AVMetadataIdentifieriTunesMetadataLinerNotes: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataLinerNotes');
end;

function AVMetadataIdentifieriTunesMetadataRecordCompany: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataRecordCompany');
end;

function AVMetadataIdentifieriTunesMetadataOriginalArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataOriginalArtist');
end;

function AVMetadataIdentifieriTunesMetadataPhonogramRights: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataPhonogramRights');
end;

function AVMetadataIdentifieriTunesMetadataProducer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataProducer');
end;

function AVMetadataIdentifieriTunesMetadataPerformer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataPerformer');
end;

function AVMetadataIdentifieriTunesMetadataPublisher: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataPublisher');
end;

function AVMetadataIdentifieriTunesMetadataSoundEngineer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataSoundEngineer');
end;

function AVMetadataIdentifieriTunesMetadataSoloist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataSoloist');
end;

function AVMetadataIdentifieriTunesMetadataCredits: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataCredits');
end;

function AVMetadataIdentifieriTunesMetadataThanks: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataThanks');
end;

function AVMetadataIdentifieriTunesMetadataOnlineExtras: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataOnlineExtras');
end;

function AVMetadataIdentifieriTunesMetadataExecProducer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataExecProducer');
end;

function AVMetadataIdentifierID3MetadataAudioEncryption: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataAudioEncryption');
end;

function AVMetadataIdentifierID3MetadataAttachedPicture: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataAttachedPicture');
end;

function AVMetadataIdentifierID3MetadataAudioSeekPointIndex: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataAudioSeekPointIndex');
end;

function AVMetadataIdentifierID3MetadataComments: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataComments');
end;

function AVMetadataIdentifierID3MetadataCommercial: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataCommercial');
end;

function AVMetadataIdentifierID3MetadataCommerical: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataCommerical');
end;

function AVMetadataIdentifierID3MetadataEncryption: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEncryption');
end;

function AVMetadataIdentifierID3MetadataEqualization: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEqualization');
end;

function AVMetadataIdentifierID3MetadataEqualization2: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEqualization2');
end;

function AVMetadataIdentifierID3MetadataEventTimingCodes: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEventTimingCodes');
end;

function AVMetadataIdentifierID3MetadataGeneralEncapsulatedObject: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataGeneralEncapsulatedObject');
end;

function AVMetadataIdentifierID3MetadataGroupIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataGroupIdentifier');
end;

function AVMetadataIdentifierID3MetadataInvolvedPeopleList_v23: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataInvolvedPeopleList_v23');
end;

function AVMetadataIdentifierID3MetadataLink: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataLink');
end;

function AVMetadataIdentifierID3MetadataMusicCDIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataMusicCDIdentifier');
end;

function AVMetadataIdentifierID3MetadataMPEGLocationLookupTable: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataMPEGLocationLookupTable');
end;

function AVMetadataIdentifierID3MetadataOwnership: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOwnership');
end;

function AVMetadataIdentifierID3MetadataPrivate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPrivate');
end;

function AVMetadataIdentifierID3MetadataPlayCounter: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPlayCounter');
end;

function AVMetadataIdentifierID3MetadataPopularimeter: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPopularimeter');
end;

function AVMetadataIdentifierID3MetadataPositionSynchronization: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPositionSynchronization');
end;

function AVMetadataIdentifierID3MetadataRecommendedBufferSize: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataRecommendedBufferSize');
end;

function AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment');
end;

function AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment2: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment2');
end;

function AVMetadataIdentifierID3MetadataReverb: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataReverb');
end;

function AVMetadataIdentifierID3MetadataSeek: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSeek');
end;

function AVMetadataIdentifierID3MetadataSignature: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSignature');
end;

function AVMetadataIdentifierID3MetadataSynchronizedLyric: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSynchronizedLyric');
end;

function AVMetadataIdentifierID3MetadataSynchronizedTempoCodes: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSynchronizedTempoCodes');
end;

function AVMetadataIdentifierID3MetadataAlbumTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataAlbumTitle');
end;

function AVMetadataIdentifierID3MetadataBeatsPerMinute: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataBeatsPerMinute');
end;

function AVMetadataIdentifierID3MetadataComposer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataComposer');
end;

function AVMetadataIdentifierID3MetadataContentType: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataContentType');
end;

function AVMetadataIdentifierID3MetadataCopyright: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataCopyright');
end;

function AVMetadataIdentifierID3MetadataDate: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataDate');
end;

function AVMetadataIdentifierID3MetadataEncodingTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEncodingTime');
end;

function AVMetadataIdentifierID3MetadataPlaylistDelay: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPlaylistDelay');
end;

function AVMetadataIdentifierID3MetadataOriginalReleaseTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOriginalReleaseTime');
end;

function AVMetadataIdentifierID3MetadataRecordingTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataRecordingTime');
end;

function AVMetadataIdentifierID3MetadataReleaseTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataReleaseTime');
end;

function AVMetadataIdentifierID3MetadataTaggingTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataTaggingTime');
end;

function AVMetadataIdentifierID3MetadataEncodedBy: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEncodedBy');
end;

function AVMetadataIdentifierID3MetadataLyricist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataLyricist');
end;

function AVMetadataIdentifierID3MetadataFileType: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataFileType');
end;

function AVMetadataIdentifierID3MetadataTime: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataTime');
end;

function AVMetadataIdentifierID3MetadataInvolvedPeopleList_v24: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataInvolvedPeopleList_v24');
end;

function AVMetadataIdentifierID3MetadataContentGroupDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataContentGroupDescription');
end;

function AVMetadataIdentifierID3MetadataTitleDescription: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataTitleDescription');
end;

function AVMetadataIdentifierID3MetadataSubTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSubTitle');
end;

function AVMetadataIdentifierID3MetadataInitialKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataInitialKey');
end;

function AVMetadataIdentifierID3MetadataLanguage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataLanguage');
end;

function AVMetadataIdentifierID3MetadataLength: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataLength');
end;

function AVMetadataIdentifierID3MetadataMusicianCreditsList: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataMusicianCreditsList');
end;

function AVMetadataIdentifierID3MetadataMediaType: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataMediaType');
end;

function AVMetadataIdentifierID3MetadataMood: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataMood');
end;

function AVMetadataIdentifierID3MetadataOriginalAlbumTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOriginalAlbumTitle');
end;

function AVMetadataIdentifierID3MetadataOriginalFilename: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOriginalFilename');
end;

function AVMetadataIdentifierID3MetadataOriginalLyricist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOriginalLyricist');
end;

function AVMetadataIdentifierID3MetadataOriginalArtist: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOriginalArtist');
end;

function AVMetadataIdentifierID3MetadataOriginalReleaseYear: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOriginalReleaseYear');
end;

function AVMetadataIdentifierID3MetadataFileOwner: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataFileOwner');
end;

function AVMetadataIdentifierID3MetadataLeadPerformer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataLeadPerformer');
end;

function AVMetadataIdentifierID3MetadataBand: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataBand');
end;

function AVMetadataIdentifierID3MetadataConductor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataConductor');
end;

function AVMetadataIdentifierID3MetadataModifiedBy: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataModifiedBy');
end;

function AVMetadataIdentifierID3MetadataPartOfASet: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPartOfASet');
end;

function AVMetadataIdentifierID3MetadataProducedNotice: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataProducedNotice');
end;

function AVMetadataIdentifierID3MetadataPublisher: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPublisher');
end;

function AVMetadataIdentifierID3MetadataTrackNumber: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataTrackNumber');
end;

function AVMetadataIdentifierID3MetadataRecordingDates: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataRecordingDates');
end;

function AVMetadataIdentifierID3MetadataInternetRadioStationName: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataInternetRadioStationName');
end;

function AVMetadataIdentifierID3MetadataInternetRadioStationOwner: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataInternetRadioStationOwner');
end;

function AVMetadataIdentifierID3MetadataSize: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSize');
end;

function AVMetadataIdentifierID3MetadataAlbumSortOrder: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataAlbumSortOrder');
end;

function AVMetadataIdentifierID3MetadataPerformerSortOrder: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPerformerSortOrder');
end;

function AVMetadataIdentifierID3MetadataTitleSortOrder: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataTitleSortOrder');
end;

function AVMetadataIdentifierID3MetadataInternationalStandardRecordingCode
  : NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataInternationalStandardRecordingCode');
end;

function AVMetadataIdentifierID3MetadataEncodedWith: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEncodedWith');
end;

function AVMetadataIdentifierID3MetadataSetSubtitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSetSubtitle');
end;

function AVMetadataIdentifierID3MetadataYear: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataYear');
end;

function AVMetadataIdentifierID3MetadataUserText: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataUserText');
end;

function AVMetadataIdentifierID3MetadataUniqueFileIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataUniqueFileIdentifier');
end;

function AVMetadataIdentifierID3MetadataTermsOfUse: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataTermsOfUse');
end;

function AVMetadataIdentifierID3MetadataUnsynchronizedLyric: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataUnsynchronizedLyric');
end;

function AVMetadataIdentifierID3MetadataCommercialInformation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataCommercialInformation');
end;

function AVMetadataIdentifierID3MetadataCopyrightInformation: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataCopyrightInformation');
end;

function AVMetadataIdentifierID3MetadataOfficialAudioFileWebpage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOfficialAudioFileWebpage');
end;

function AVMetadataIdentifierID3MetadataOfficialArtistWebpage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOfficialArtistWebpage');
end;

function AVMetadataIdentifierID3MetadataOfficialAudioSourceWebpage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOfficialAudioSourceWebpage');
end;

function AVMetadataIdentifierID3MetadataOfficialInternetRadioStationHomepage
  : NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOfficialInternetRadioStationHomepage');
end;

function AVMetadataIdentifierID3MetadataPayment: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPayment');
end;

function AVMetadataIdentifierID3MetadataOfficialPublisherWebpage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOfficialPublisherWebpage');
end;

function AVMetadataIdentifierID3MetadataUserURL: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataUserURL');
end;

function AVMetadataIdentifierIcyMetadataStreamTitle: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierIcyMetadataStreamTitle');
end;

function AVMetadataIdentifierIcyMetadataStreamURL: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataIdentifierIcyMetadataStreamURL');
end;

function AVMetadataObjectTypeFace: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeFace');
end;

function AVMetadataObjectTypeUPCECode: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeUPCECode');
end;

function AVMetadataObjectTypeCode39Code: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataObjectTypeCode39Code');
end;

function AVMetadataObjectTypeCode39Mod43Code: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataObjectTypeCode39Mod43Code');
end;

function AVMetadataObjectTypeEAN13Code: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataObjectTypeEAN13Code');
end;

function AVMetadataObjectTypeEAN8Code: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeEAN8Code');
end;

function AVMetadataObjectTypeCode93Code: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataObjectTypeCode93Code');
end;

function AVMetadataObjectTypeCode128Code: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataObjectTypeCode128Code');
end;

function AVMetadataObjectTypePDF417Code: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataObjectTypePDF417Code');
end;

function AVMetadataObjectTypeQRCode: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeQRCode');
end;

function AVMetadataObjectTypeAztecCode: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataObjectTypeAztecCode');
end;

function AVMetadataObjectTypeInterleaved2of5Code: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataObjectTypeInterleaved2of5Code');
end;

function AVMetadataObjectTypeITF14Code: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataObjectTypeITF14Code');
end;

function AVMetadataObjectTypeDataMatrixCode: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMetadataObjectTypeDataMatrixCode');
end;

function AVOutputSettingsPreset640x480: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVOutputSettingsPreset640x480');
end;

function AVOutputSettingsPreset960x540: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVOutputSettingsPreset960x540');
end;

function AVOutputSettingsPreset1280x720: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVOutputSettingsPreset1280x720');
end;

function AVOutputSettingsPreset1920x1080: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVOutputSettingsPreset1920x1080');
end;

function AVOutputSettingsPreset3840x2160: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVOutputSettingsPreset3840x2160');
end;

function AVPlayerItemTimeJumpedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerItemTimeJumpedNotification');
end;

function AVPlayerItemDidPlayToEndTimeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerItemDidPlayToEndTimeNotification');
end;

function AVPlayerItemFailedToPlayToEndTimeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerItemFailedToPlayToEndTimeNotification');
end;

function AVPlayerItemPlaybackStalledNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerItemPlaybackStalledNotification');
end;

function AVPlayerItemNewAccessLogEntryNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerItemNewAccessLogEntryNotification');
end;

function AVPlayerItemNewErrorLogEntryNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerItemNewErrorLogEntryNotification');
end;

function AVPlayerItemFailedToPlayToEndTimeErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerItemFailedToPlayToEndTimeErrorKey');
end;

function AVPlayerItemLegibleOutputTextStylingResolutionDefault: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerItemLegibleOutputTextStylingResolutionDefault');
end;

function AVPlayerItemLegibleOutputTextStylingResolutionSourceAndRulesOnly
  : NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerItemLegibleOutputTextStylingResolutionSourceAndRulesOnly');
end;

function AVSampleBufferDisplayLayerFailedToDecodeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVSampleBufferDisplayLayerFailedToDecodeNotification');
end;

function AVSampleBufferDisplayLayerFailedToDecodeNotificationErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVSampleBufferDisplayLayerFailedToDecodeNotificationErrorKey');
end;

function AVVideoCodecKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecKey');
end;

function AVVideoCodecH264: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecH264');
end;

function AVVideoCodecJPEG: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecJPEG');
end;

function AVVideoCodecAppleProRes4444: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecAppleProRes4444');
end;

function AVVideoCodecAppleProRes422: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecAppleProRes422');
end;

function AVVideoWidthKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoWidthKey');
end;

function AVVideoHeightKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoHeightKey');
end;

function AVVideoPixelAspectRatioKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoPixelAspectRatioKey');
end;

function AVVideoPixelAspectRatioHorizontalSpacingKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoPixelAspectRatioHorizontalSpacingKey');
end;

function AVVideoPixelAspectRatioVerticalSpacingKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoPixelAspectRatioVerticalSpacingKey');
end;

function AVVideoCleanApertureKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCleanApertureKey');
end;

function AVVideoCleanApertureWidthKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCleanApertureWidthKey');
end;

function AVVideoCleanApertureHeightKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoCleanApertureHeightKey');
end;

function AVVideoCleanApertureHorizontalOffsetKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoCleanApertureHorizontalOffsetKey');
end;

function AVVideoCleanApertureVerticalOffsetKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoCleanApertureVerticalOffsetKey');
end;

function AVVideoScalingModeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoScalingModeKey');
end;

function AVVideoScalingModeFit: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoScalingModeFit');
end;

function AVVideoScalingModeResize: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoScalingModeResize');
end;

function AVVideoScalingModeResizeAspect: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoScalingModeResizeAspect');
end;

function AVVideoScalingModeResizeAspectFill: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoScalingModeResizeAspectFill');
end;

function AVVideoCompressionPropertiesKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoCompressionPropertiesKey');
end;

function AVVideoAverageBitRateKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoAverageBitRateKey');
end;

function AVVideoQualityKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoQualityKey');
end;

function AVVideoMaxKeyFrameIntervalKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoMaxKeyFrameIntervalKey');
end;

function AVVideoMaxKeyFrameIntervalDurationKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoMaxKeyFrameIntervalDurationKey');
end;

function AVVideoAllowFrameReorderingKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoAllowFrameReorderingKey');
end;

function AVVideoProfileLevelKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelKey');
end;

function AVVideoProfileLevelH264Baseline30: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoProfileLevelH264Baseline30');
end;

function AVVideoProfileLevelH264Baseline31: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoProfileLevelH264Baseline31');
end;

function AVVideoProfileLevelH264Baseline41: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoProfileLevelH264Baseline41');
end;

function AVVideoProfileLevelH264BaselineAutoLevel: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoProfileLevelH264BaselineAutoLevel');
end;

function AVVideoProfileLevelH264Main30: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoProfileLevelH264Main30');
end;

function AVVideoProfileLevelH264Main31: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoProfileLevelH264Main31');
end;

function AVVideoProfileLevelH264Main32: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoProfileLevelH264Main32');
end;

function AVVideoProfileLevelH264Main41: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoProfileLevelH264Main41');
end;

function AVVideoProfileLevelH264MainAutoLevel: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoProfileLevelH264MainAutoLevel');
end;

function AVVideoProfileLevelH264High40: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoProfileLevelH264High40');
end;

function AVVideoProfileLevelH264High41: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoProfileLevelH264High41');
end;

function AVVideoProfileLevelH264HighAutoLevel: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoProfileLevelH264HighAutoLevel');
end;

function AVVideoH264EntropyModeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoH264EntropyModeKey');
end;

function AVVideoH264EntropyModeCAVLC: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoH264EntropyModeCAVLC');
end;

function AVVideoH264EntropyModeCABAC: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoH264EntropyModeCABAC');
end;

function AVVideoExpectedSourceFrameRateKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoExpectedSourceFrameRateKey');
end;

function AVVideoAverageNonDroppableFrameRateKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoAverageNonDroppableFrameRateKey');
end;

function AVVideoEncoderSpecificationKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoEncoderSpecificationKey');
end;

function AVCoreAnimationBeginTimeAtZero: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCoreAnimationBeginTimeAtZero');
end;

function AVCaptureMaxAvailableTorchLevel: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureMaxAvailableTorchLevel');
end;

function AVCaptureLensPositionCurrent: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVCaptureLensPositionCurrent');
end;

function AVCaptureExposureDurationCurrent: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureExposureDurationCurrent');
end;

function AVCaptureISOCurrent: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVCaptureISOCurrent');
end;

function AVCaptureExposureTargetBiasCurrent: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureExposureTargetBiasCurrent');
end;

function AVCaptureWhiteBalanceGainsCurrent: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureWhiteBalanceGainsCurrent');
end;

function AVSpeechUtteranceMinimumSpeechRate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVSpeechUtteranceMinimumSpeechRate');
end;

function AVSpeechUtteranceMaximumSpeechRate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVSpeechUtteranceMaximumSpeechRate');
end;

function AVSpeechUtteranceDefaultSpeechRate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVSpeechUtteranceDefaultSpeechRate');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

AVFoundationModule := dlopen(MarshaledAString(libAVFoundation), RTLD_LAZY);

finalization

dlclose(AVFoundationModule);
{$ENDIF IOS}

end.
