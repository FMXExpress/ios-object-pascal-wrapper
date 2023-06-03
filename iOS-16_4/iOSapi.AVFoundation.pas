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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.CoreMedia,
  iOSapi.CoreVideo,
  iOSapi.Foundation,
  iOSapi.ImageIO,
  iOSapi.MediaToolbox,
  iOSapi.QuartzCore;

const
  AVKeyValueStatusUnknown = 0;
  AVKeyValueStatusLoading = 1;
  AVKeyValueStatusLoaded = 2;
  AVKeyValueStatusFailed = 3;
  AVKeyValueStatusCancelled = 4;
  AVContentKeyRequestStatusRequestingResponse = 0;
  AVContentKeyRequestStatusReceivedResponse = 1;
  AVContentKeyRequestStatusRenewed = 2;
  AVContentKeyRequestStatusRetried = 3;
  AVContentKeyRequestStatusCancelled = 4;
  AVContentKeyRequestStatusFailed = 5;
  AVAssetReferenceRestrictionForbidNone = 0;
  AVAssetReferenceRestrictionForbidRemoteReferenceToLocal = (1 shl 0);
  AVAssetReferenceRestrictionForbidLocalReferenceToRemote = (1 shl 1);
  AVAssetReferenceRestrictionForbidCrossSiteReference = (1 shl 2);
  AVAssetReferenceRestrictionForbidLocalReferenceToLocal = (1 shl 3);
  AVAssetReferenceRestrictionForbidAll = 65535;
  AVAssetReferenceRestrictionDefaultPolicy =
    AVAssetReferenceRestrictionForbidLocalReferenceToRemote;
  AVAudioSpatializationFormatNone = 0;
  AVAudioSpatializationFormatMonoAndStereo = 3;
  AVAudioSpatializationFormatMultichannel = 4;
  AVAudioSpatializationFormatMonoStereoAndMultichannel = 7;
  AVAssetExportSessionStatusUnknown = 0;
  AVAssetExportSessionStatusWaiting = 1;
  AVAssetExportSessionStatusExporting = 2;
  AVAssetExportSessionStatusCompleted = 3;
  AVAssetExportSessionStatusFailed = 4;
  AVAssetExportSessionStatusCancelled = 5;
  AVAssetTrackGroupOutputHandlingNone = 0;
  AVAssetTrackGroupOutputHandlingPreserveAlternateTracks = (1 shl 0);
  AVAssetTrackGroupOutputHandlingDefaultPolicy =
    AVAssetTrackGroupOutputHandlingNone;
  AVAssetImageGeneratorSucceeded = 0;
  AVAssetImageGeneratorFailed = 1;
  AVAssetImageGeneratorCancelled = 2;
  AVAssetReaderStatusUnknown = 0;
  AVAssetReaderStatusReading = 1;
  AVAssetReaderStatusCompleted = 2;
  AVAssetReaderStatusFailed = 3;
  AVAssetReaderStatusCancelled = 4;
  AVAssetSegmentTypeInitialization = 1;
  AVAssetSegmentTypeSeparable = 2;
  AVAssetWriterStatusUnknown = 0;
  AVAssetWriterStatusWriting = 1;
  AVAssetWriterStatusCompleted = 2;
  AVAssetWriterStatusFailed = 3;
  AVAssetWriterStatusCancelled = 4;
  AVCaptureDevicePositionUnspecified = 0;
  AVCaptureDevicePositionBack = 1;
  AVCaptureDevicePositionFront = 2;
  AVCapturePrimaryConstituentDeviceSwitchingBehaviorUnsupported = 0;
  AVCapturePrimaryConstituentDeviceSwitchingBehaviorAuto = 1;
  AVCapturePrimaryConstituentDeviceSwitchingBehaviorRestricted = 2;
  AVCapturePrimaryConstituentDeviceSwitchingBehaviorLocked = 3;
  AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditionNone = 0;
  AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditionVideoZoomChanged =
    1 shl 0;
  AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditionFocusModeChanged =
    1 shl 1;
  AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditionExposureModeChanged =
    1 shl 2;
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
  AVCaptureDeviceTransportControlsNotPlayingMode = 0;
  AVCaptureDeviceTransportControlsPlayingMode = 1;
  AVCaptureColorSpace_sRGB = 0;
  AVCaptureColorSpace_P3_D65 = 1;
  AVCaptureColorSpace_HLG_BT2020 = 2;
  AVCaptureCenterStageControlModeUser = 0;
  AVCaptureCenterStageControlModeApp = 1;
  AVCaptureCenterStageControlModeCooperative = 2;
  AVCaptureMicrophoneModeStandard = 0;
  AVCaptureMicrophoneModeWideSpectrum = 1;
  AVCaptureMicrophoneModeVoiceIsolation = 2;
  AVCaptureSystemUserInterfaceVideoEffects = 1;
  AVCaptureSystemUserInterfaceMicrophoneModes = 2;
  AVCaptureVideoStabilizationModeOff = 0;
  AVCaptureVideoStabilizationModeStandard = 1;
  AVCaptureVideoStabilizationModeCinematic = 2;
  AVCaptureVideoStabilizationModeCinematicExtended = 3;
  AVCaptureVideoStabilizationModeAuto = -1;
  AVCaptureAutoFocusSystemNone = 0;
  AVCaptureAutoFocusSystemContrastDetection = 1;
  AVCaptureAutoFocusSystemPhaseDetection = 2;
  AVCaptureSessionInterruptionReasonVideoDeviceNotAvailableInBackground = 1;
  AVCaptureSessionInterruptionReasonAudioDeviceInUseByAnotherClient = 2;
  AVCaptureSessionInterruptionReasonVideoDeviceInUseByAnotherClient = 3;
  AVCaptureSessionInterruptionReasonVideoDeviceNotAvailableWithMultipleForegroundApps =
    4;
  AVCaptureSessionInterruptionReasonVideoDeviceNotAvailableDueToSystemPressure =
    5;
  AVCaptureVideoOrientationPortrait = 1;
  AVCaptureVideoOrientationPortraitUpsideDown = 2;
  AVCaptureVideoOrientationLandscapeRight = 3;
  AVCaptureVideoOrientationLandscapeLeft = 4;
  AVVideoFieldModeBoth = 0;
  AVVideoFieldModeTopOnly = 1;
  AVVideoFieldModeBottomOnly = 2;
  AVVideoFieldModeDeinterlace = 3;
  AVCaptureOutputDataDroppedReasonNone = 0;
  AVCaptureOutputDataDroppedReasonLateData = 1;
  AVCaptureOutputDataDroppedReasonOutOfBuffers = 2;
  AVCaptureOutputDataDroppedReasonDiscontinuity = 3;
  AVCapturePhotoQualityPrioritizationSpeed = 1;
  AVCapturePhotoQualityPrioritizationBalanced = 2;
  AVCapturePhotoQualityPrioritizationQuality = 3;
  AVCaptureLensStabilizationStatusUnsupported = 0;
  AVCaptureLensStabilizationStatusOff = 1;
  AVCaptureLensStabilizationStatusActive = 2;
  AVCaptureLensStabilizationStatusOutOfRange = 3;
  AVCaptureLensStabilizationStatusUnavailable = 4;
  AVCaptureSystemPressureFactorNone = 0;
  AVCaptureSystemPressureFactorSystemTemperature = (1 shl 0);
  AVCaptureSystemPressureFactorPeakPower = (1 shl 1);
  AVCaptureSystemPressureFactorDepthModuleTemperature = (1 shl 2);
  AVDepthDataQualityLow = 0;
  AVDepthDataQualityHigh = 1;
  AVDepthDataAccuracyRelative = 0;
  AVDepthDataAccuracyAbsolute = 1;
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
  AVErrorCreateContentKeyRequestFailed = -11860;
  AVErrorUnsupportedOutputSettings = -11861;
  AVErrorOperationNotAllowed = -11862;
  AVErrorContentIsUnavailable = -11863;
  AVErrorFormatUnsupported = -11864;
  AVErrorMalformedDepth = -11865;
  AVErrorContentNotUpdated = -11866;
  AVErrorNoLongerPlayable = -11867;
  AVErrorNoCompatibleAlternatesForExternalDisplay = -11868;
  AVErrorNoSourceTrack = -11869;
  AVErrorExternalPlaybackNotSupportedForAsset = -11870;
  AVErrorOperationNotSupportedForPreset = -11871;
  AVErrorSessionHardwareCostOverage = -11872;
  AVErrorUnsupportedDeviceActiveFormat = -11873;
  AVErrorIncorrectlyConfigured = -11875;
  AVErrorSegmentStartedWithNonSyncSample = -11876;
  AVErrorRosettaNotInstalled = -11877;
  AVErrorOperationCancelled = -11878;
  AVErrorContentKeyRequestCancelled = -11879;
  AVErrorInvalidSampleCursor = -11880;
  AVErrorFailedToLoadSampleData = -11881;
  AVErrorAirPlayReceiverTemporarilyUnavailable = -11882;
  AVErrorEncodeFailed = -11883;
  AVErrorSandboxExtensionDenied = -11884;
  AVMovieWritingAddMovieHeaderToDestination = 0;
  AVMovieWritingTruncateDestinationToMovieHeaderOnly = (1 shl 0);
  AVPlayerStatusUnknown = 0;
  AVPlayerStatusReadyToPlay = 1;
  AVPlayerStatusFailed = 2;
  AVPlayerTimeControlStatusPaused = 0;
  AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate = 1;
  AVPlayerTimeControlStatusPlaying = 2;
  AVPlayerActionAtItemEndAdvance = 0;
  AVPlayerActionAtItemEndPause = 1;
  AVPlayerActionAtItemEndNone = 2;
  AVPlayerHDRModeHLG = 1;
  AVPlayerHDRModeHDR10 = 2;
  AVPlayerHDRModeDolbyVision = 4;
  AVPlayerAudiovisualBackgroundPlaybackPolicyAutomatic = 1;
  AVPlayerAudiovisualBackgroundPlaybackPolicyPauses = 2;
  AVPlayerAudiovisualBackgroundPlaybackPolicyContinuesIfPossible = 3;
  AVDelegatingPlaybackCoordinatorRateChangeOptionPlayImmediately = (1 shl 0);
  AVDelegatingPlaybackCoordinatorSeekOptionResumeImmediately = (1 shl 0);
  AVPlayerItemStatusUnknown = 0;
  AVPlayerItemStatusReadyToPlay = 1;
  AVPlayerItemStatusFailed = 2;
  AVVariantPreferenceNone = 0;
  AVVariantPreferenceScalabilityToLosslessAudio = 1 shl 0;
  AVPlayerLooperStatusUnknown = 0;
  AVPlayerLooperStatusReady = 1;
  AVPlayerLooperStatusFailed = 2;
  AVPlayerLooperStatusCancelled = 3;
  AVPlayerInterstitialEventRestrictionNone = 0;
  AVPlayerInterstitialEventRestrictionConstrainsSeekingForwardInPrimaryContent =
    (1 shl 0);
  AVPlayerInterstitialEventRestrictionRequiresPlaybackAtPreferredRateForAdvancement =
    (1 shl 2);
  AVPlayerInterstitialEventRestrictionDefaultPolicy =
    AVPlayerInterstitialEventRestrictionNone;
  AVPlayerInterstitialEventAssetListResponseStatusAvailable = 0;
  AVPlayerInterstitialEventAssetListResponseStatusCleared = 1;
  AVPlayerInterstitialEventAssetListResponseStatusUnavailable = 2;
  AVQueuedSampleBufferRenderingStatusUnknown = 0;
  AVQueuedSampleBufferRenderingStatusRendering = 1;
  AVQueuedSampleBufferRenderingStatusFailed = 2;
  AVSampleBufferRequestDirectionForward = +1;
  AVSampleBufferRequestDirectionNone = 0;
  AVSampleBufferRequestDirectionReverse = -1;
  AVSampleBufferRequestModeImmediate = 0;
  AVSampleBufferRequestModeScheduled = 1;
  AVSampleBufferRequestModeOpportunistic = 2;

type

  // ===== Forward declarations =====
{$M+}
  AVAsynchronousKeyValueLoading = interface;
  AVContentKeyRequest = interface;
  AVContentKeyResponse = interface;
  AVPersistableContentKeyRequest = interface;
  AVContentKeyRecipient = interface;
  AVContentKeySessionDelegate = interface;
  AVContentKeySpecifier = interface;
  AVContentKey = interface;
  AVContentKeySession = interface;
  AVMediaSelectionOption = interface;
  AVAssetVariantVideoAttributes = interface;
  AVAssetVariantAudioAttributes = interface;
  AVAssetVariantAudioRenditionSpecificAttributes = interface;
  AVAssetVariant = interface;
  AVAssetVariantQualifier = interface;
  AVAssetTrack = interface;
  AVFragmentedAssetTrack = interface;
  AVMetadataItem = interface;
  AVMediaSelection = interface;
  AVCompositionTrack = interface;
  AVDisplayCriteria = interface;
  AVAsset = interface;
  AVAssetTrackGroup = interface;
  AVTimedMetadataGroup = interface;
  AVMediaSelectionGroup = interface;
  AVURLAsset = interface;
  AVAssetResourceLoader = interface;
  AVAssetCache = interface;
  AVFragmentMinding = interface;
  AVFragmentedAsset = interface;
  AVFragmentedAssetMinder = interface;
  AVAssetDownloadStorageManagementPolicy = interface;
  AVAssetDownloadStorageManager = interface;
  AVMutableAssetDownloadStorageManagementPolicy = interface;
  AVMutableMediaSelection = interface;
  AVAssetDownloadContentConfiguration = interface;
  AVAssetDownloadTask = interface;
  AVAssetDownloadConfiguration = interface;
  AVAggregateAssetDownloadTask = interface;
  AVAssetDownloadDelegate = interface;
  AVAssetDownloadURLSession = interface;
  AVAudioMix = interface;
  AVVideoComposition = interface;
  AVMetadataItemFilter = interface;
  AVVideoCompositing = interface;
  AVAssetExportSession = interface;
  AVAssetImageGenerator = interface;
  AVAssetPlaybackAssistant = interface;
  AVAssetReaderOutput = interface;
  AVAssetReader = interface;
  AVMetadataGroup = interface;
  AVMutableTimedMetadataGroup = interface;
  AVDateRangeMetadataGroup = interface;
  AVMutableDateRangeMetadataGroup = interface;
  AVAsynchronousVideoCompositionRequest = interface;
  AVVideoCompositionInstruction = interface;
  AVVideoCompositionRenderContext = interface;
  AVVideoCompositionRenderHint = interface;
  AVAsynchronousCIImageFilteringRequest = interface;
  AVVideoCompositionCoreAnimationTool = interface;
  AVVideoCompositionLayerInstruction = interface;
  AVMutableVideoComposition = interface;
  AVMutableVideoCompositionInstruction = interface;
  AVMutableVideoCompositionLayerInstruction = interface;
  AVVideoCompositionValidationHandling = interface;
  AVAudioMixInputParameters = interface;
  AVAssetReaderCaptionValidationHandling = interface;
  AVAssetReaderTrackOutput = interface;
  AVAssetReaderAudioMixOutput = interface;
  AVAssetReaderVideoCompositionOutput = interface;
  AVAssetReaderOutputMetadataAdaptor = interface;
  AVAssetReaderOutputCaptionAdaptor = interface;
  AVAssetReaderSampleReferenceOutput = interface;
  AVAssetResourceLoaderDelegate = interface;
  AVAssetResourceLoadingRequest = interface;
  AVAssetResourceRenewalRequest = interface;
  AVAssetResourceLoadingRequestor = interface;
  AVAssetResourceLoadingContentInformationRequest = interface;
  AVAssetResourceLoadingDataRequest = interface;
  AVAssetSegmentTrackReport = interface;
  AVAssetSegmentReportSampleInformation = interface;
  AVAssetSegmentReport = interface;
  AVAssetTrackSegment = interface;
  AVSampleCursor = interface;
  AVAssetWriterInput = interface;
  AVAssetWriter = interface;
  AVAssetWriterInputGroup = interface;
  AVAssetWriterDelegate = interface;
  AVAssetWriterInputPassDescription = interface;
  AVAssetWriterInputPixelBufferAdaptor = interface;
  AVAssetWriterInputMetadataAdaptor = interface;
  AVAssetWriterInputCaptionAdaptor = interface;
  AVMutableAudioMix = interface;
  AVPlayerItemTrack = interface;
  AVMutableAudioMixInputParameters = interface;
  AVCameraCalibrationData = interface;
  AVCaptureDeviceFormat = interface;
  AVCaptureDeviceInputSource = interface;
  AVCaptureSystemPressureState = interface;
  AVCaptureDevice = interface;
  AVCaptureDeviceDiscoverySession = interface;
  AVFrameRateRange = interface;
  AVCaptureOutput = interface;
  AVCaptureInput = interface;
  AVCaptureConnection = interface;
  AVCaptureSession = interface;
  AVCaptureMultiCamSession = interface;
  AVCaptureAudioChannel = interface;
  AVCaptureVideoPreviewLayer = interface;
  AVCaptureInputPort = interface;
  AVMetadataObject = interface;
  AVCaptureAudioDataOutputSampleBufferDelegate = interface;
  AVCaptureAudioDataOutput = interface;
  AVCaptureAudioPreviewOutput = interface;
  AVDepthData = interface;
  AVCaptureDepthDataOutputDelegate = interface;
  AVCaptureDepthDataOutput = interface;
  AVCaptureFileOutputDelegate = interface;
  AVCaptureFileOutputRecordingDelegate = interface;
  AVCaptureFileOutput = interface;
  AVCaptureMovieFileOutput = interface;
  AVCaptureAudioFileOutput = interface;
  AVMetadataBodyObject = interface;
  AVMetadataHumanBodyObject = interface;
  AVMetadataCatBodyObject = interface;
  AVMetadataDogBodyObject = interface;
  AVMetadataSalientObject = interface;
  AVMetadataFaceObject = interface;
  AVMetadataMachineReadableCodeObject = interface;
  AVCaptureMetadataOutputObjectsDelegate = interface;
  AVCaptureMetadataOutput = interface;
  AVSemanticSegmentationMatte = interface;
  AVCapturePhotoSettings = interface;
  AVCapturePhotoBracketSettings = interface;
  AVCaptureResolvedPhotoSettings = interface;
  AVCaptureBracketedStillImageSettings = interface;
  AVPortraitEffectsMatte = interface;
  AVCapturePhotoCaptureDelegate = interface;
  AVCapturePhotoOutput = interface;
  AVCapturePhoto = interface;
  AVCapturePhotoFileDataRepresentationCustomizer = interface;
  AVCaptureStillImageOutput = interface;
  AVCaptureManualExposureBracketedStillImageSettings = interface;
  AVCaptureAutoExposureBracketedStillImageSettings = interface;
  AVCaptureVideoDataOutputSampleBufferDelegate = interface;
  AVCaptureVideoDataOutput = interface;
  AVCaptureSynchronizedDataCollection = interface;
  AVCaptureDataOutputSynchronizerDelegate = interface;
  AVCaptureDataOutputSynchronizer = interface;
  AVCaptureSynchronizedData = interface;
  AVCaptureSynchronizedSampleBufferData = interface;
  AVCaptureSynchronizedMetadataObjectData = interface;
  AVCaptureSynchronizedDepthData = interface;
  AVCaptureDeskViewApplicationLaunchConfiguration = interface;
  AVCaptureDeskViewApplication = interface;
  AVCaptureDeviceInput = interface;
  AVCaptureScreenInput = interface;
  AVCaptureMetadataInput = interface;
  AVComposition = interface;
  AVCompositionTrackFormatDescriptionReplacement = interface;
  AVCompositionTrackSegment = interface;
  AVMutableCompositionTrack = interface;
  AVMutableComposition = interface;
  AVMutableMetadataItem = interface;
  AVMetadataItemValueRequest = interface;
  AVMediaDataStorage = interface;
  AVMovieTrack = interface;
  AVMutableMovieTrack = interface;
  AVFragmentedMovieTrack = interface;
  AVMovie = interface;
  AVMutableMovie = interface;
  AVFragmentedMovie = interface;
  AVFragmentedMovieMinder = interface;
  AVOutputSettingsAssistant = interface;
  AVPlayerItem = interface;
  AVPlayerPlaybackCoordinator = interface;
  AVPlayer = interface;
  AVPlayerMediaSelectionCriteria = interface;
  AVQueuePlayer = interface;
  AVPlaybackCoordinator = interface;
  AVCoordinatedPlaybackParticipant = interface;
  AVCoordinatedPlaybackSuspension = interface;
  AVPlayerPlaybackCoordinatorDelegate = interface;
  AVPlaybackCoordinatorPlaybackControlDelegate = interface;
  AVDelegatingPlaybackCoordinator = interface;
  AVDelegatingPlaybackCoordinatorPlayCommand = interface;
  AVDelegatingPlaybackCoordinatorPauseCommand = interface;
  AVDelegatingPlaybackCoordinatorSeekCommand = interface;
  AVDelegatingPlaybackCoordinatorBufferingCommand = interface;
  AVDelegatingPlaybackCoordinatorPlaybackControlCommand = interface;
  AVTextStyleRule = interface;
  AVPlayerItemAccessLog = interface;
  AVPlayerItemErrorLog = interface;
  AVPlayerItemOutput = interface;
  AVPlayerItemMediaDataCollector = interface;
  AVPlayerItemAccessLogEvent = interface;
  AVPlayerItemErrorLogEvent = interface;
  AVPlayerItemMetadataCollectorPushDelegate = interface;
  AVPlayerItemMetadataCollector = interface;
  AVPlayerItemOutputPullDelegate = interface;
  AVPlayerItemVideoOutput = interface;
  AVPlayerItemLegibleOutputPushDelegate = interface;
  AVPlayerItemLegibleOutput = interface;
  AVPlayerItemOutputPushDelegate = interface;
  AVPlayerItemMetadataOutputPushDelegate = interface;
  AVPlayerItemMetadataOutput = interface;
  AVPlayerLayer = interface;
  AVPlayerLooper = interface;
  AVPlayerInterstitialEvent = interface;
  AVPlayerInterstitialEventMonitor = interface;
  AVPlayerInterstitialEventController = interface;
  AVQueuedSampleBufferRendering = interface;
  AVRouteDetector = interface;
  AVSampleBufferAudioRenderer = interface;
  AVSampleBufferDisplayLayer = interface;
  AVSampleBufferRenderSynchronizer = interface;
  AVSampleBufferRequest = interface;
  AVSampleBufferGeneratorBatch = interface;
  AVSampleBufferGenerator = interface;
  AVSynchronizedLayer = interface;
  NSValueAVFoundationExtensions = interface;
  AVTimeCoding = interface;
  NSValueCMVideoDimensionsExtensions = interface;

  // ===== Framework typedefs =====
{$M+}
  CFTimeInterval = Double;
  PCFTimeInterval = ^CFTimeInterval;

  AVLayerVideoGravity = NSString;
  PAVLayerVideoGravity = ^AVLayerVideoGravity;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  AVKeyValueStatus = NSInteger;
  TAVFoundationCompletionHandler = procedure() of object;
  AVContentKeySystem = NSString;
  PAVContentKeySystem = ^AVContentKeySystem;
  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;
  TAVFoundationCompletionHandler1 = procedure(param1: NSData; param2: NSError)
    of object;
  AVContentKeySessionServerPlaybackContextOption = NSString;
  PAVContentKeySessionServerPlaybackContextOption = ^
    AVContentKeySessionServerPlaybackContextOption;
  AVContentKeyRequestRetryReason = NSString;
  PAVContentKeyRequestRetryReason = ^AVContentKeyRequestRetryReason;
  AVContentKeyRequestStatus = NSInteger;
  CMSampleBufferRef = Pointer;
  PCMSampleBufferRef = ^CMSampleBufferRef;
  AVMediaType = NSString;
  PAVMediaType = ^AVMediaType;
  AVVideoRange = NSString;
  PAVVideoRange = ^AVVideoRange;
  AVMediaCharacteristic = NSString;
  PAVMediaCharacteristic = ^AVMediaCharacteristic;
  AVFileType = NSString;
  PAVFileType = ^AVFileType;
  AVFileTypeProfile = NSString;
  PAVFileTypeProfile = ^AVFileTypeProfile;
  AVMetadataFormat = NSString;
  PAVMetadataFormat = ^AVMetadataFormat;
  AVMetadataKeySpace = NSString;
  PAVMetadataKeySpace = ^AVMetadataKeySpace;
  AVMetadataKey = NSString;
  PAVMetadataKey = ^AVMetadataKey;
  AVMetadataExtraAttributeKey = NSString;
  PAVMetadataExtraAttributeKey = ^AVMetadataExtraAttributeKey;
  AVVideoCodecType = NSString;
  PAVVideoCodecType = ^AVVideoCodecType;
  AVVideoApertureMode = NSString;
  PAVVideoApertureMode = ^AVVideoApertureMode;
  CGFloat = Single;
  PCGFloat = ^CGFloat;

  CGSize = record
    width: CGFloat;
    height: CGFloat;
  end;

  PCGSize = ^CGSize;

  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  NSPredicateOperatorType = NSUInteger;
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

  CGAffineTransform = record
    a: CGFloat;
    b: CGFloat;
    c: CGFloat;
    d: CGFloat;
    tx: CGFloat;
    ty: CGFloat;
  end;

  PCGAffineTransform = ^CGAffineTransform;

  AVAssetReferenceRestrictions = NSUInteger;
  CMPersistentTrackID = Int32;
  PCMPersistentTrackID = ^CMPersistentTrackID;
  TAVFoundationCompletionHandler2 = procedure(param1: AVAssetTrack;
    param2: NSError) of object;
  TAVFoundationCompletionHandler3 = procedure(param1: NSArray; param2: NSError)
    of object;
  TAVFoundationCompletionHandler4 = procedure(param1: AVMediaSelectionGroup;
    param2: NSError) of object;
  TAVFoundationCompletionHandler5 = procedure(param1: AVFragmentedAssetTrack;
    param2: NSError) of object;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  AVAssetDownloadedAssetEvictionPriority = NSString;
  PAVAssetDownloadedAssetEvictionPriority = ^
    AVAssetDownloadedAssetEvictionPriority;

  CMTimeRange = record
    start: CMTime;
    duration: CMTime;
  end;

  PCMTimeRange = ^CMTimeRange;

  AVAudioTimePitchAlgorithm = NSString;
  PAVAudioTimePitchAlgorithm = ^AVAudioTimePitchAlgorithm;
  AVAudioSpatializationFormats = NSUInteger;
  AVAssetExportSessionStatus = NSInteger;
  AVAssetTrackGroupOutputHandling = NSUInteger;
  TAVFoundationCompletionHandler6 = procedure(param1: Boolean) of object;
  TAVFoundationHandler = procedure(param1: NSArray) of object;
  TAVFoundationHandler1 = procedure(param1: CMTime; param2: NSError) of object;
  TAVFoundationHandler2 = procedure(param1: Int64; param2: NSError) of object;
  AVAssetImageGeneratorApertureMode = NSString;
  PAVAssetImageGeneratorApertureMode = ^AVAssetImageGeneratorApertureMode;
  AVAssetImageGeneratorResult = NSInteger;
  CGImageRef = Pointer;
  PCGImageRef = ^CGImageRef;
  AVAssetImageGeneratorCompletionHandler = procedure(param1: CMTime;
    param2: CGImageRef; param3: CMTime; param4: AVAssetImageGeneratorResult;
    param5: NSError) of object;
  TAVFoundationCompletionHandler7 = procedure(param1: CGImageRef;
    param2: CMTime; param3: NSError) of object;
  AVAssetPlaybackConfigurationOption = NSString;
  PAVAssetPlaybackConfigurationOption = ^AVAssetPlaybackConfigurationOption;
  AVAssetReaderStatus = NSInteger;
  CMFormatDescriptionRef = Pointer;
  PCMFormatDescriptionRef = ^CMFormatDescriptionRef;
  CMMetadataFormatDescriptionRef = CMFormatDescriptionRef;
  PCMMetadataFormatDescriptionRef = ^CMMetadataFormatDescriptionRef;

  AVPixelAspectRatio = record
    horizontalSpacing: NSInteger;
    verticalSpacing: NSInteger;
  end;

  PAVPixelAspectRatio = ^AVPixelAspectRatio;

  AVEdgeWidths = record
    left: CGFloat;
    top: CGFloat;
    right: CGFloat;
    bottom: CGFloat;
  end;

  PAVEdgeWidths = ^AVEdgeWidths;

  CVBufferRef = Pointer;
  PCVBufferRef = ^CVBufferRef;
  CVImageBufferRef = CVBufferRef;
  PCVImageBufferRef = ^CVImageBufferRef;
  CVPixelBufferRef = CVImageBufferRef;
  PCVPixelBufferRef = ^CVPixelBufferRef;
  TAVFoundationCompletionHandler8 = procedure(param1: AVVideoComposition;
    param2: NSError) of object;
  TAVFoundationApplyingCIFiltersWithHandler = procedure
    (param1: AVAsynchronousCIImageFilteringRequest) of object;
  TAVFoundationCompletionHandler9 = procedure(param1: AVMutableVideoComposition;
    param2: NSError) of object;
  CGColorRef = Pointer;
  PCGColorRef = ^CGColorRef;

  CGPoint = record
    x: CGFloat;
    y: CGFloat;
  end;

  PCGPoint = ^CGPoint;

  CGRect = record
    origin: CGPoint;
    size: CGSize;
  end;

  PCGRect = ^CGRect;

  TAVFoundationCompletionHandler10 = procedure(param1: CMPersistentTrackID;
    param2: NSError) of object;
  TAVFoundationCompletionHandler11 = procedure(param1: Boolean; param2: NSError)
    of object;
  AVAssetSegmentType = NSInteger;

  CMTimeMapping = record
    source: CMTimeRange;
    target: CMTimeRange;
  end;

  PCMTimeMapping = ^CMTimeMapping;

  TAVFoundationCompletionHandler12 = procedure(param1: AVAssetTrackSegment;
    param2: NSError) of object;
  AVTrackAssociationType = NSString;
  PAVTrackAssociationType = ^AVTrackAssociationType;
  AVAssetWriterStatus = NSInteger;
  AVAssetWriterInputMediaDataLocation = NSString;
  PAVAssetWriterInputMediaDataLocation = ^AVAssetWriterInputMediaDataLocation;
  CVPixelBufferPoolRef = Pointer;
  PCVPixelBufferPoolRef = ^CVPixelBufferPoolRef;
  MTAudioProcessingTapRef = Pointer;
  PMTAudioProcessingTapRef = ^MTAudioProcessingTapRef;
  simd_float3 = - - < Type : : ExtVector >;
  Psimd_float3 = ^simd_float3;

  simd_float3x3 = record
    columns: array [0 .. 2] of simd_float3;
  end;

  Psimd_float3x3 = ^simd_float3x3;

  matrix_float3x3 = simd_float3x3;

  simd_float4x3 = record
    columns: array [0 .. 3] of simd_float3;
  end;

  Psimd_float4x3 = ^simd_float4x3;

  matrix_float4x3 = simd_float4x3;

  AVCaptureSessionPreset = NSString;
  PAVCaptureSessionPreset = ^AVCaptureSessionPreset;
  AVCaptureDevicePosition = NSInteger;
  AVCaptureDeviceType = NSString;
  PAVCaptureDeviceType = ^AVCaptureDeviceType;
  AVCapturePrimaryConstituentDeviceSwitchingBehavior = NSInteger;
  AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions =
    NSUInteger;
  AVCaptureFlashMode = NSInteger;
  AVCaptureTorchMode = NSInteger;
  AVCaptureFocusMode = NSInteger;
  AVCaptureAutoFocusRangeRestriction = NSInteger;
  TAVFoundationCompletionHandler13 = procedure(param1: CMTime) of object;
  AVCaptureExposureMode = NSInteger;
  AVCaptureWhiteBalanceMode = NSInteger;

  AVCaptureWhiteBalanceGains = record
    redGain: Single;
    greenGain: Single;
    blueGain: Single;
  end;

  PAVCaptureWhiteBalanceGains = ^AVCaptureWhiteBalanceGains;

  AVCaptureWhiteBalanceChromaticityValues = record
    x: Single;
    y: Single;
  end;

  PAVCaptureWhiteBalanceChromaticityValues = ^
    AVCaptureWhiteBalanceChromaticityValues;

  AVCaptureWhiteBalanceTemperatureAndTintValues = record
    temperature: Single;
    tint: Single;
  end;

  PAVCaptureWhiteBalanceTemperatureAndTintValues = ^
    AVCaptureWhiteBalanceTemperatureAndTintValues;

  AVAuthorizationStatus = NSInteger;
  AVCaptureDeviceTransportControlsSpeed = Single;
  PAVCaptureDeviceTransportControlsSpeed = ^
    AVCaptureDeviceTransportControlsSpeed;

  AVCaptureDeviceTransportControlsPlaybackMode = NSInteger;
  AVCaptureColorSpace = NSInteger;
  AVCaptureCenterStageControlMode = NSInteger;
  AVCaptureMicrophoneMode = NSInteger;
  AVCaptureSystemUserInterface = NSInteger;
  AVCaptureVideoStabilizationMode = NSInteger;
  AVCaptureAutoFocusSystem = NSInteger;

  CMVideoDimensions = record
    width: Int32;
    height: Int32;
  end;

  PCMVideoDimensions = ^CMVideoDimensions;

  AVCaptureSessionInterruptionReason = NSInteger;
  AVCaptureVideoOrientation = NSInteger;
  CMClockRef = Pointer;
  PCMClockRef = ^CMClockRef;
  AVVideoFieldMode = NSInteger;
  AVCaptureOutputDataDroppedReason = NSInteger;
  AVMetadataObjectType = NSString;
  PAVMetadataObjectType = ^AVMetadataObjectType;
  AVSemanticSegmentationMatteType = NSString;
  PAVSemanticSegmentationMatteType = ^AVSemanticSegmentationMatteType;
  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  CGImagePropertyOrientation = LongWord;
  FourCharCode = UInt32;
  PFourCharCode = ^FourCharCode;
  OSType = FourCharCode;
  POSType = ^OSType;
  AVCapturePhotoQualityPrioritization = NSInteger;
  AVCaptureLensStabilizationStatus = NSInteger;
  TAVFoundationCompletionHandler14 = procedure(param1: CMSampleBufferRef;
    param2: NSError) of object;
  TAVFoundationCompletionHandler15 = procedure(param1: CMSampleBufferRef;
    param2: AVCaptureBracketedStillImageSettings; param3: NSError) of object;
  TAVFoundationCompletionHandler16 = procedure(param1: NSError) of object;
  AVCaptureSystemPressureLevel = NSString;
  PAVCaptureSystemPressureLevel = ^AVCaptureSystemPressureLevel;
  AVCaptureSystemPressureFactors = NSUInteger;
  TAVFoundationCompletionHandler17 = procedure(param1: AVCompositionTrack;
    param2: NSError) of object;
  TAVFoundationCompletionHandler18 = procedure
    (param1: AVMutableCompositionTrack; param2: NSError) of object;
  AVDepthDataQuality = NSInteger;
  AVDepthDataAccuracy = NSInteger;
  NSErrorDomain = NSString;
  PNSErrorDomain = ^NSErrorDomain;
  AVError = NSInteger;
  AVMetadataIdentifier = NSString;
  PAVMetadataIdentifier = ^AVMetadataIdentifier;
  TAVFoundationValueLoadingHandler = procedure
    (param1: AVMetadataItemValueRequest) of object;
  AVMovieWritingOptions = NSUInteger;
  TAVFoundationCompletionHandler19 = procedure(param1: AVMovieTrack;
    param2: NSError) of object;
  TAVFoundationCompletionHandler20 = procedure(param1: AVMutableMovieTrack;
    param2: NSError) of object;
  TAVFoundationCompletionHandler21 = procedure(param1: AVFragmentedMovieTrack;
    param2: NSError) of object;
  AVOutputSettingsPreset = NSString;
  PAVOutputSettingsPreset = ^AVOutputSettingsPreset;
  CMAudioFormatDescriptionRef = CMFormatDescriptionRef;
  PCMAudioFormatDescriptionRef = ^CMAudioFormatDescriptionRef;
  CMVideoFormatDescriptionRef = CMFormatDescriptionRef;
  PCMVideoFormatDescriptionRef = ^CMVideoFormatDescriptionRef;
  AVPlayerStatus = NSInteger;
  NSNotificationName = NSString;
  PNSNotificationName = ^NSNotificationName;
  AVPlayerRateDidChangeReason = NSString;
  PAVPlayerRateDidChangeReason = ^AVPlayerRateDidChangeReason;
  AVPlayerTimeControlStatus = NSInteger;
  AVPlayerWaitingReason = NSString;
  PAVPlayerWaitingReason = ^AVPlayerWaitingReason;
  AVPlayerActionAtItemEnd = NSInteger;
  AVPlayerHDRMode = NSInteger;
  AVPlayerAudiovisualBackgroundPlaybackPolicy = NSInteger;
  AVCoordinatedPlaybackSuspensionReason = NSString;
  PAVCoordinatedPlaybackSuspensionReason = ^
    AVCoordinatedPlaybackSuspensionReason;
  AVDelegatingPlaybackCoordinatorRateChangeOptions = NSUInteger;
  AVDelegatingPlaybackCoordinatorSeekOptions = NSUInteger;
  CMTimebaseRef = Pointer;
  PCMTimebaseRef = ^CMTimebaseRef;
  AVPlayerItemStatus = NSInteger;
  AVVariantPreferences = NSUInteger;
  NSStringEncoding = NSUInteger;
  PNSStringEncoding = ^NSStringEncoding;
  AVPlayerItemLegibleOutputTextStylingResolution = NSString;
  PAVPlayerItemLegibleOutputTextStylingResolution = ^
    AVPlayerItemLegibleOutputTextStylingResolution;
  AVPlayerLooperStatus = NSInteger;
  AVPlayerInterstitialEventRestrictions = NSUInteger;
  AVPlayerInterstitialEventCue = NSString;
  PAVPlayerInterstitialEventCue = ^AVPlayerInterstitialEventCue;
  AVPlayerInterstitialEventAssetListResponseStatus = NSInteger;
  AVQueuedSampleBufferRenderingStatus = NSInteger;
  NSComparisonResult = NSInteger;

  AVSampleCursorSyncInfo = record
    sampleIsFullSync: Boolean;
    sampleIsPartialSync: Boolean;
    sampleIsDroppable: Boolean;
  end;

  PAVSampleCursorSyncInfo = ^AVSampleCursorSyncInfo;

  AVSampleCursorDependencyInfo = record
    sampleIndicatesWhetherItHasDependentSamples: Boolean;
    sampleHasDependentSamples: Boolean;
    sampleIndicatesWhetherItDependsOnOthers: Boolean;
    sampleDependsOnOthers: Boolean;
    sampleIndicatesWhetherItHasRedundantCoding: Boolean;
    sampleHasRedundantCoding: Boolean;
  end;

  PAVSampleCursorDependencyInfo = ^AVSampleCursorDependencyInfo;

  AVSampleCursorAudioDependencyInfo = record
    audioSampleIsIndependentlyDecodable: Boolean;
    audioSamplePacketRefreshCount: NSInteger;
  end;

  PAVSampleCursorAudioDependencyInfo = ^AVSampleCursorAudioDependencyInfo;

  AVSampleCursorStorageRange = record
    offset: Int64;
    length: Int64;
  end;

  PAVSampleCursorStorageRange = ^AVSampleCursorStorageRange;

  AVSampleCursorChunkInfo = record
    chunkSampleCount: Int64;
    chunkHasUniformSampleSizes: Boolean;
    chunkHasUniformSampleDurations: Boolean;
    chunkHasUniformFormatDescriptions: Boolean;
  end;

  PAVSampleCursorChunkInfo = ^AVSampleCursorChunkInfo;

  AVSampleBufferRequestDirection = NSInteger;
  AVSampleBufferRequestMode = NSInteger;
  // ===== Interface declarations =====

  AVContentKeyRequestClass = interface(NSObjectClass)
    ['{4A01FA69-7722-4156-AB8F-A3155F218C3D}']
  end;

  AVContentKeyRequest = interface(NSObject)
    ['{A05D12D3-9EC4-46E6-9E5F-A11BD8148CA8}']
    function status: AVContentKeyRequestStatus; cdecl;
    function error: NSError; cdecl;
    function identifier: Pointer; cdecl;
    function initializationData: NSData; cdecl;
    function options: NSDictionary; cdecl;
    function canProvidePersistableContentKey: Boolean; cdecl;
    function contentKeySpecifier: AVContentKeySpecifier; cdecl;
    function contentKey: AVContentKey; cdecl;
    procedure makeStreamingContentKeyRequestDataForApp(appIdentifier: NSData;
      contentIdentifier: NSData; options: NSDictionary;
      completionHandler: TAVFoundationCompletionHandler1); cdecl;
    procedure processContentKeyResponse(keyResponse
      : AVContentKeyResponse); cdecl;
    procedure processContentKeyResponseError(error: NSError); cdecl;
    procedure respondByRequestingPersistableContentKeyRequest; cdecl;
    function respondByRequestingPersistableContentKeyRequestAndReturnError
      (outError: NSError): Boolean; cdecl;
    function renewsExpiringResponseData: Boolean; cdecl;
  end;

  TAVContentKeyRequest = class(TOCGenericImport<AVContentKeyRequestClass,
    AVContentKeyRequest>)
  end;

  PAVContentKeyRequest = Pointer;

  AVContentKeyResponseClass = interface(NSObjectClass)
    ['{2266D8EF-DFDA-4725-8C46-A55409711E9E}']
    { class } function contentKeyResponseWithFairPlayStreamingKeyResponseData
      (keyResponseData: NSData): Pointer { instancetype }; cdecl;
    { class } function contentKeyResponseWithClearKeyData(keyData: NSData;
      initializationVector: NSData): Pointer { instancetype }; cdecl;
    { class } function contentKeyResponseWithAuthorizationTokenData
      (authorizationTokenData: NSData): Pointer { instancetype }; cdecl;
  end;

  AVContentKeyResponse = interface(NSObject)
    ['{55BEA866-0E60-47AD-BBFF-FC33ED144DF6}']
  end;

  TAVContentKeyResponse = class(TOCGenericImport<AVContentKeyResponseClass,
    AVContentKeyResponse>)
  end;

  PAVContentKeyResponse = Pointer;

  AVPersistableContentKeyRequestClass = interface(AVContentKeyRequestClass)
    ['{7D6457BC-6208-4513-8DB7-1577B994D123}']
  end;

  AVPersistableContentKeyRequest = interface(AVContentKeyRequest)
    ['{5A0554C3-E284-4D71-82CF-CBFF4CA8FD61}']
    function persistableContentKeyFromKeyVendorResponse(keyVendorResponse
      : NSData; options: NSDictionary; error: NSError): NSData; cdecl;
  end;

  TAVPersistableContentKeyRequest = class
    (TOCGenericImport<AVPersistableContentKeyRequestClass,
    AVPersistableContentKeyRequest>)
  end;

  PAVPersistableContentKeyRequest = Pointer;

  AVContentKeySpecifierClass = interface(NSObjectClass)
    ['{B9043328-F0C5-4283-8691-FD6902F71532}']
    { class } function contentKeySpecifierForKeySystem
      (keySystem: AVContentKeySystem; identifier: Pointer;
      options: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  AVContentKeySpecifier = interface(NSObject)
    ['{22A04506-B817-4822-9E92-DEB89EDB4095}']
    function initForKeySystem(keySystem: AVContentKeySystem;
      identifier: Pointer; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function keySystem: AVContentKeySystem; cdecl;
    function identifier: Pointer; cdecl;
    function options: NSDictionary; cdecl;
  end;

  TAVContentKeySpecifier = class(TOCGenericImport<AVContentKeySpecifierClass,
    AVContentKeySpecifier>)
  end;

  PAVContentKeySpecifier = Pointer;

  AVContentKeyClass = interface(NSObjectClass)
    ['{7594D60C-5B60-4939-A07D-D803940754E8}']
  end;

  AVContentKey = interface(NSObject)
    ['{2E9B555C-2C1A-40E1-B806-AF0B9E670988}']
    function contentKeySpecifier: AVContentKeySpecifier; cdecl;
  end;

  TAVContentKey = class(TOCGenericImport<AVContentKeyClass, AVContentKey>)
  end;

  PAVContentKey = Pointer;

  AVContentKeySessionClass = interface(NSObjectClass)
    ['{8E422EE9-7217-455D-B934-99B9E77F4BF6}']
    [MethodName('contentKeySessionWithKeySystem:')]
    { class } function contentKeySessionWithKeySystem
      (keySystem: AVContentKeySystem): Pointer { instancetype }; cdecl;
    [MethodName('contentKeySessionWithKeySystem:storageDirectoryAtURL:')]
    { class } function contentKeySessionWithKeySystemStorageDirectoryAtURL
      (keySystem: AVContentKeySystem; storageDirectoryAtURL: NSURL)
      : Pointer { instancetype }; cdecl;
    { class } function pendingExpiredSessionReportsWithAppIdentifier
      (appIdentifier: NSData; storageDirectoryAtURL: NSURL): NSArray; cdecl;
    { class } procedure removePendingExpiredSessionReports(expiredSessionReports
      : NSArray; withAppIdentifier: NSData;
      storageDirectoryAtURL: NSURL); cdecl;
  end;

  AVContentKeySession = interface(NSObject)
    ['{167B5846-1B1B-4782-B307-633B1A8FAFB3}']
    procedure setDelegate(delegate: Pointer; queue: dispatch_queue_t); cdecl;
    function delegate: Pointer; cdecl;
    function delegateQueue: dispatch_queue_t; cdecl;
    function storageURL: NSURL; cdecl;
    function keySystem: AVContentKeySystem; cdecl;
    procedure expire; cdecl;
    function contentProtectionSessionIdentifier: NSData; cdecl;
    procedure processContentKeyRequestWithIdentifier(identifier: Pointer;
      initializationData: NSData; options: NSDictionary); cdecl;
    procedure renewExpiringResponseDataForContentKeyRequest(contentKeyRequest
      : AVContentKeyRequest); cdecl;
    procedure makeSecureTokenForExpirationDateOfPersistableContentKey
      (persistableContentKeyData: NSData;
      completionHandler: TAVFoundationCompletionHandler1); cdecl;
    procedure invalidatePersistableContentKey(persistableContentKeyData: NSData;
      options: NSDictionary;
      completionHandler: TAVFoundationCompletionHandler1); cdecl;
    procedure invalidateAllPersistableContentKeysForApp(appIdentifier: NSData;
      options: NSDictionary;
      completionHandler: TAVFoundationCompletionHandler1); cdecl;
    procedure addContentKeyRecipient(recipient: Pointer); cdecl;
    procedure removeContentKeyRecipient(recipient: Pointer); cdecl;
    function contentKeyRecipients: NSArray; cdecl;
  end;

  TAVContentKeySession = class(TOCGenericImport<AVContentKeySessionClass,
    AVContentKeySession>)
  end;

  PAVContentKeySession = Pointer;

  AVMediaSelectionOptionClass = interface(NSObjectClass)
    ['{1E0D8AC0-C630-4FB3-9436-48A632C4137E}']
  end;

  AVMediaSelectionOption = interface(NSObject)
    ['{C7E1E363-B925-4B10-8D98-A467E5B90F50}']
    function mediaType: AVMediaType; cdecl;
    function mediaSubTypes: NSArray; cdecl;
    function hasMediaCharacteristic(mediaCharacteristic: AVMediaCharacteristic)
      : Boolean; cdecl;
    function isPlayable: Boolean; cdecl;
    function extendedLanguageTag: NSString; cdecl;
    function locale: NSLocale; cdecl;
    function commonMetadata: NSArray; cdecl;
    function availableMetadataFormats: NSArray; cdecl;
    function metadataForFormat(format: NSString): NSArray; cdecl;
    function associatedMediaSelectionOptionInMediaSelectionGroup
      (mediaSelectionGroup: AVMediaSelectionGroup)
      : AVMediaSelectionOption; cdecl;
    function propertyList: Pointer; cdecl;
    function displayNameWithLocale(locale: NSLocale): NSString; cdecl;
    function displayName: NSString; cdecl;
  end;

  TAVMediaSelectionOption = class(TOCGenericImport<AVMediaSelectionOptionClass,
    AVMediaSelectionOption>)
  end;

  PAVMediaSelectionOption = Pointer;

  AVAssetVariantVideoAttributesClass = interface(NSObjectClass)
    ['{CD2AF132-C8C6-4A7C-B804-8892513E65FD}']
  end;

  AVAssetVariantVideoAttributes = interface(NSObject)
    ['{928D8352-C36A-48AD-AFD6-573259CA84BF}']
    function videoRange: AVVideoRange; cdecl;
    function codecTypes: NSArray; cdecl;
    function presentationSize: CGSize; cdecl;
    function nominalFrameRate: Double; cdecl;
  end;

  TAVAssetVariantVideoAttributes = class
    (TOCGenericImport<AVAssetVariantVideoAttributesClass,
    AVAssetVariantVideoAttributes>)
  end;

  PAVAssetVariantVideoAttributes = Pointer;

  AVAssetVariantAudioAttributesClass = interface(NSObjectClass)
    ['{EFF9B5A4-C7DA-4E89-B8FB-F25104B92472}']
  end;

  AVAssetVariantAudioAttributes = interface(NSObject)
    ['{BBB69216-3D30-4D18-9961-B530C9CF753F}']
    function formatIDs: NSArray; cdecl;
    function renditionSpecificAttributesForMediaOption(mediaSelectionOption
      : AVMediaSelectionOption)
      : AVAssetVariantAudioRenditionSpecificAttributes; cdecl;
  end;

  TAVAssetVariantAudioAttributes = class
    (TOCGenericImport<AVAssetVariantAudioAttributesClass,
    AVAssetVariantAudioAttributes>)
  end;

  PAVAssetVariantAudioAttributes = Pointer;

  AVAssetVariantAudioRenditionSpecificAttributesClass = interface(NSObjectClass)
    ['{93B44B15-7125-4D4E-9EF2-D085D4427BD7}']
  end;

  AVAssetVariantAudioRenditionSpecificAttributes = interface(NSObject)
    ['{A4F93CC7-4F28-499E-B4BE-42FA202EBECE}']
    function channelCount: NSInteger; cdecl;
  end;

  TAVAssetVariantAudioRenditionSpecificAttributes = class
    (TOCGenericImport<AVAssetVariantAudioRenditionSpecificAttributesClass,
    AVAssetVariantAudioRenditionSpecificAttributes>)
  end;

  PAVAssetVariantAudioRenditionSpecificAttributes = Pointer;

  AVAssetVariantClass = interface(NSObjectClass)
    ['{EA3CF1B1-D8E5-43FA-96D7-E77938AAEA62}']
  end;

  AVAssetVariant = interface(NSObject)
    ['{1A6B239E-5B35-41FB-BCE7-EC1EA99C01FB}']
    function peakBitRate: Double; cdecl;
    function averageBitRate: Double; cdecl;
    function videoAttributes: AVAssetVariantVideoAttributes; cdecl;
    function audioAttributes: AVAssetVariantAudioAttributes; cdecl;
  end;

  TAVAssetVariant = class(TOCGenericImport<AVAssetVariantClass, AVAssetVariant>)
  end;

  PAVAssetVariant = Pointer;

  AVAssetVariantQualifierClass = interface(NSObjectClass)
    ['{3EE98A1E-378E-489D-A92D-AADBAC127554}']
    { class } function assetVariantQualifierWithPredicate
      (predicate: NSPredicate): Pointer { instancetype }; cdecl;
    { class } function assetVariantQualifierWithVariant(variant: AVAssetVariant)
      : Pointer { instancetype }; cdecl;
    { class } function predicateForChannelCount(channelCount: NSInteger;
      mediaSelectionOption: AVMediaSelectionOption;
      operatorType: NSPredicateOperatorType): NSPredicate; cdecl;
    { class } function predicateForPresentationWidth(width: CGFloat;
      operatorType: NSPredicateOperatorType): NSPredicate; cdecl;
    { class } function predicateForPresentationHeight(height: CGFloat;
      operatorType: NSPredicateOperatorType): NSPredicate; cdecl;
  end;

  AVAssetVariantQualifier = interface(NSObject)
    ['{FA3CB997-CEF3-4A60-AD49-9D8778DDDC6F}']
  end;

  TAVAssetVariantQualifier = class
    (TOCGenericImport<AVAssetVariantQualifierClass, AVAssetVariantQualifier>)
  end;

  PAVAssetVariantQualifier = Pointer;

  AVAssetTrackClass = interface(NSObjectClass)
    ['{EFC4BFF8-FA38-4390-AAD0-ADCE3DD80BD3}']
  end;

  AVAssetTrack = interface(NSObject)
    ['{AAB4FC95-773C-4A3A-B821-28DEF6B17E6D}']
    function asset: AVAsset; cdecl;
    function trackID: CMPersistentTrackID; cdecl;
    function mediaType: AVMediaType; cdecl;
    function formatDescriptions: NSArray; cdecl;
    function isPlayable: Boolean; cdecl;
    function isDecodable: Boolean; cdecl;
    function isEnabled: Boolean; cdecl;
    function isSelfContained: Boolean; cdecl;
    function totalSampleDataLength: Int64; cdecl;
    function hasMediaCharacteristic(mediaCharacteristic: AVMediaCharacteristic)
      : Boolean; cdecl;
    function timeRange: CMTimeRange; cdecl;
    function naturalTimeScale: CMTimeScale; cdecl;
    function estimatedDataRate: Single; cdecl;
    function languageCode: NSString; cdecl;
    function extendedLanguageTag: NSString; cdecl;
    function naturalSize: CGSize; cdecl;
    function preferredTransform: CGAffineTransform; cdecl;
    function preferredVolume: Single; cdecl;
    function hasAudioSampleDependencies: Boolean; cdecl;
    function nominalFrameRate: Single; cdecl;
    function minFrameDuration: CMTime; cdecl;
    function requiresFrameReordering: Boolean; cdecl;
    function segments: NSArray; cdecl;
    function segmentForTrackTime(trackTime: CMTime): AVAssetTrackSegment; cdecl;
    procedure loadSegmentForTrackTime(trackTime: CMTime;
      completionHandler: TAVFoundationCompletionHandler12); cdecl;
    function samplePresentationTimeForTrackTime(trackTime: CMTime)
      : CMTime; cdecl;
    procedure loadSamplePresentationTimeForTrackTime(trackTime: CMTime;
      completionHandler: TAVFoundationHandler1); cdecl;
    function commonMetadata: NSArray; cdecl;
    function metadata: NSArray; cdecl;
    function availableMetadataFormats: NSArray; cdecl;
    function metadataForFormat(format: AVMetadataFormat): NSArray; cdecl;
    procedure loadMetadataForFormat(format: AVMetadataFormat;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function availableTrackAssociationTypes: NSArray; cdecl;
    function associatedTracksOfType(trackAssociationType
      : AVTrackAssociationType): NSArray; cdecl;
    procedure loadAssociatedTracksOfType(trackAssociationType
      : AVTrackAssociationType;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function canProvideSampleCursors: Boolean; cdecl;
    function makeSampleCursorWithPresentationTimeStamp(presentationTimeStamp
      : CMTime): AVSampleCursor; cdecl;
    function makeSampleCursorAtFirstSampleInDecodeOrder: AVSampleCursor; cdecl;
    function makeSampleCursorAtLastSampleInDecodeOrder: AVSampleCursor; cdecl;
  end;

  TAVAssetTrack = class(TOCGenericImport<AVAssetTrackClass, AVAssetTrack>)
  end;

  PAVAssetTrack = Pointer;

  AVFragmentedAssetTrackClass = interface(AVAssetTrackClass)
    ['{D9DA6AB1-69FE-4D18-BBE7-0A57B773E9A9}']
  end;

  AVFragmentedAssetTrack = interface(AVAssetTrack)
    ['{B4AB2708-40BA-4BA3-8A0B-A10544E48165}']
  end;

  TAVFragmentedAssetTrack = class(TOCGenericImport<AVFragmentedAssetTrackClass,
    AVFragmentedAssetTrack>)
  end;

  PAVFragmentedAssetTrack = Pointer;

  AVMetadataItemClass = interface(NSObjectClass)
    ['{A4FB971E-E8AC-4B86-B758-67707FB4625D}']
    [MethodName
      ('metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:')
      ]
    { class } function
      metadataItemsFromArrayFilteredAndSortedAccordingToPreferredLanguages
      (metadataItems: NSArray; filteredAndSortedAccordingToPreferredLanguages
      : NSArray): NSArray; cdecl;
    [MethodName('metadataItemsFromArray:filteredByIdentifier:')]
    { class } function metadataItemsFromArrayFilteredByIdentifier
      (metadataItems: NSArray; filteredByIdentifier: AVMetadataIdentifier)
      : NSArray; cdecl;
    [MethodName('metadataItemsFromArray:filteredByMetadataItemFilter:')]
    { class } function metadataItemsFromArrayFilteredByMetadataItemFilter
      (metadataItems: NSArray;
      filteredByMetadataItemFilter: AVMetadataItemFilter): NSArray; cdecl;
    { class } function identifierForKey(key: Pointer;
      keySpace: AVMetadataKeySpace): AVMetadataIdentifier; cdecl;
    { class } function keySpaceForIdentifier(identifier: AVMetadataIdentifier)
      : AVMetadataKeySpace; cdecl;
    { class } function keyForIdentifier(identifier: AVMetadataIdentifier)
      : Pointer; cdecl;
    { class } function metadataItemWithPropertiesOfMetadataItem
      (metadataItem: AVMetadataItem;
      valueLoadingHandler: TAVFoundationValueLoadingHandler)
      : AVMetadataItem; cdecl;
    [MethodName('metadataItemsFromArray:withLocale:')]
    { class } function metadataItemsFromArrayWithLocale(metadataItems: NSArray;
      withLocale: NSLocale): NSArray; cdecl;
    [MethodName('metadataItemsFromArray:withKey:keySpace:')]
    { class } function metadataItemsFromArrayWithKeyKeySpace
      (metadataItems: NSArray; withKey: Pointer; keySpace: AVMetadataKeySpace)
      : NSArray; cdecl;
  end;

  AVMetadataItem = interface(NSObject)
    ['{BA7CE56A-C1C3-4C9B-A424-1220214E7C32}']
    function identifier: AVMetadataIdentifier; cdecl;
    function extendedLanguageTag: NSString; cdecl;
    function locale: NSLocale; cdecl;
    function time: CMTime; cdecl;
    function duration: CMTime; cdecl;
    function dataType: NSString; cdecl;
    function value: Pointer; cdecl;
    function extraAttributes: NSDictionary; cdecl;
    function startDate: NSDate; cdecl;
    function stringValue: NSString; cdecl;
    function numberValue: NSNumber; cdecl;
    function dateValue: NSDate; cdecl;
    function dataValue: NSData; cdecl;
    function statusOfValueForKey(key: NSString; error: NSError)
      : AVKeyValueStatus; cdecl;
    procedure loadValuesAsynchronouslyForKeys(keys: NSArray;
      completionHandler: TAVFoundationCompletionHandler); cdecl;
    function key: Pointer; cdecl;
    function commonKey: AVMetadataKey; cdecl;
    function keySpace: AVMetadataKeySpace; cdecl;
  end;

  TAVMetadataItem = class(TOCGenericImport<AVMetadataItemClass, AVMetadataItem>)
  end;

  PAVMetadataItem = Pointer;

  AVMediaSelectionClass = interface(NSObjectClass)
    ['{772F5870-CF37-4722-91E2-329E5E48D3F4}']
  end;

  AVMediaSelection = interface(NSObject)
    ['{1B610C03-5B51-4494-AFAE-80BDC4F98A43}']
    function asset: AVAsset; cdecl;
    function selectedMediaOptionInMediaSelectionGroup(mediaSelectionGroup
      : AVMediaSelectionGroup): AVMediaSelectionOption; cdecl;
    function mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup
      (mediaSelectionGroup: AVMediaSelectionGroup): Boolean; cdecl;
  end;

  TAVMediaSelection = class(TOCGenericImport<AVMediaSelectionClass,
    AVMediaSelection>)
  end;

  PAVMediaSelection = Pointer;

  AVCompositionTrackClass = interface(AVAssetTrackClass)
    ['{7616616F-FB5F-40A3-A721-BCF119772457}']
  end;

  AVCompositionTrack = interface(AVAssetTrack)
    ['{738FDFD4-9836-4A56-A93B-4FF34C229D66}']
    function segments: NSArray; cdecl;
    function segmentForTrackTime(trackTime: CMTime)
      : AVCompositionTrackSegment; cdecl;
    function formatDescriptionReplacements: NSArray; cdecl;
    function hasMediaCharacteristic(mediaCharacteristic: AVMediaCharacteristic)
      : Boolean; cdecl;
    function samplePresentationTimeForTrackTime(trackTime: CMTime)
      : CMTime; cdecl;
    function metadataForFormat(format: AVMetadataFormat): NSArray; cdecl;
    function associatedTracksOfType(trackAssociationType
      : AVTrackAssociationType): NSArray; cdecl;
  end;

  TAVCompositionTrack = class(TOCGenericImport<AVCompositionTrackClass,
    AVCompositionTrack>)
  end;

  PAVCompositionTrack = Pointer;

  AVDisplayCriteriaClass = interface(NSObjectClass)
    ['{9C503318-2ECD-4E0A-9BED-D770D9014A29}']
  end;

  AVDisplayCriteria = interface(NSObject)
    ['{5E9F14C1-2D7D-41FE-B878-0B4A20D8B098}']
  end;

  TAVDisplayCriteria = class(TOCGenericImport<AVDisplayCriteriaClass,
    AVDisplayCriteria>)
  end;

  PAVDisplayCriteria = Pointer;

  AVAssetClass = interface(NSObjectClass)
    ['{19ED5223-BBA9-4A13-93BC-2490B9088AC8}']
    { class } function assetWithURL(URL: NSURL)
      : Pointer { instancetype }; cdecl;
  end;

  AVAsset = interface(NSObject)
    ['{B7821CA7-B327-4065-8435-54E7297518B9}']
    function duration: CMTime; cdecl;
    function preferredRate: Single; cdecl;
    function preferredVolume: Single; cdecl;
    function preferredTransform: CGAffineTransform; cdecl;
    function naturalSize: CGSize; cdecl;
    function preferredDisplayCriteria: AVDisplayCriteria; cdecl;
    function minimumTimeOffsetFromLive: CMTime; cdecl;
    function providesPreciseDurationAndTiming: Boolean; cdecl;
    procedure cancelLoading; cdecl;
    function referenceRestrictions: AVAssetReferenceRestrictions; cdecl;
    function tracks: NSArray; cdecl;
    function trackWithTrackID(trackID: CMPersistentTrackID)
      : AVAssetTrack; cdecl;
    procedure loadTrackWithTrackID(trackID: CMPersistentTrackID;
      completionHandler: TAVFoundationCompletionHandler2); cdecl;
    function tracksWithMediaType(mediaType: AVMediaType): NSArray; cdecl;
    procedure loadTracksWithMediaType(mediaType: AVMediaType;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function tracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic): NSArray; cdecl;
    procedure loadTracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function trackGroups: NSArray; cdecl;
    function creationDate: AVMetadataItem; cdecl;
    function lyrics: NSString; cdecl;
    function commonMetadata: NSArray; cdecl;
    function metadata: NSArray; cdecl;
    function availableMetadataFormats: NSArray; cdecl;
    function metadataForFormat(format: AVMetadataFormat): NSArray; cdecl;
    procedure loadMetadataForFormat(format: AVMetadataFormat;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function availableChapterLocales: NSArray; cdecl;
    function chapterMetadataGroupsWithTitleLocale(locale: NSLocale;
      containingItemsWithCommonKeys: NSArray): NSArray; cdecl;
    procedure loadChapterMetadataGroupsWithTitleLocale(locale: NSLocale;
      containingItemsWithCommonKeys: NSArray;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function chapterMetadataGroupsBestMatchingPreferredLanguages
      (preferredLanguages: NSArray): NSArray; cdecl;
    procedure loadChapterMetadataGroupsBestMatchingPreferredLanguages
      (preferredLanguages: NSArray;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function availableMediaCharacteristicsWithMediaSelectionOptions
      : NSArray; cdecl;
    function mediaSelectionGroupForMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic): AVMediaSelectionGroup; cdecl;
    procedure loadMediaSelectionGroupForMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic;
      completionHandler: TAVFoundationCompletionHandler4); cdecl;
    function preferredMediaSelection: AVMediaSelection; cdecl;
    function allMediaSelections: NSArray; cdecl;
    function hasProtectedContent: Boolean; cdecl;
    function canContainFragments: Boolean; cdecl;
    function containsFragments: Boolean; cdecl;
    function overallDurationHint: CMTime; cdecl;
    function isPlayable: Boolean; cdecl;
    function isExportable: Boolean; cdecl;
    function isReadable: Boolean; cdecl;
    function isComposable: Boolean; cdecl;
    function isCompatibleWithSavedPhotosAlbum: Boolean; cdecl;
    function isCompatibleWithAirPlayVideo: Boolean; cdecl;
    function unusedTrackID: CMPersistentTrackID; cdecl;
    procedure findUnusedTrackIDWithCompletionHandler(completionHandler
      : TAVFoundationCompletionHandler10); cdecl;
  end;

  TAVAsset = class(TOCGenericImport<AVAssetClass, AVAsset>)
  end;

  PAVAsset = Pointer;

  AVAssetTrackGroupClass = interface(NSObjectClass)
    ['{E0EC7D7A-DB6B-423B-9E38-BE3FC38FCE69}']
  end;

  AVAssetTrackGroup = interface(NSObject)
    ['{1C2B3A87-073D-47F5-93A0-5140D73067D7}']
    function trackIDs: NSArray; cdecl;
  end;

  TAVAssetTrackGroup = class(TOCGenericImport<AVAssetTrackGroupClass,
    AVAssetTrackGroup>)
  end;

  PAVAssetTrackGroup = Pointer;

  AVMetadataGroupClass = interface(NSObjectClass)
    ['{347C517B-C49B-4B61-8EF1-478F74596659}']
  end;

  AVMetadataGroup = interface(NSObject)
    ['{03045815-33BE-424B-9B7D-1432008A8789}']
    function items: NSArray; cdecl;
    function classifyingLabel: NSString; cdecl;
    function uniqueID: NSString; cdecl;
  end;

  TAVMetadataGroup = class(TOCGenericImport<AVMetadataGroupClass,
    AVMetadataGroup>)
  end;

  PAVMetadataGroup = Pointer;

  AVTimedMetadataGroupClass = interface(AVMetadataGroupClass)
    ['{82A122EB-2A33-40EA-8CE5-242C44B5682F}']
  end;

  AVTimedMetadataGroup = interface(AVMetadataGroup)
    ['{8CFBB3CF-B0DD-4E3F-AAB7-5E124AE4224C}']
    function initWithItems(items: NSArray; timeRange: CMTimeRange)
      : Pointer { instancetype }; cdecl;
    function initWithSampleBuffer(sampleBuffer: CMSampleBufferRef)
      : Pointer { instancetype }; cdecl;
    function timeRange: CMTimeRange; cdecl;
    function items: NSArray; cdecl;
    function copyFormatDescription: CMMetadataFormatDescriptionRef; cdecl;
  end;

  TAVTimedMetadataGroup = class(TOCGenericImport<AVTimedMetadataGroupClass,
    AVTimedMetadataGroup>)
  end;

  PAVTimedMetadataGroup = Pointer;

  AVMediaSelectionGroupClass = interface(NSObjectClass)
    ['{02AD7912-E503-4492-B527-DEFD619AFF6A}']
    { class } function playableMediaSelectionOptionsFromArray
      (mediaSelectionOptions: NSArray): NSArray; cdecl;
    [MethodName
      ('mediaSelectionOptionsFromArray:filteredAndSortedAccordingToPreferredLanguages:')
      ]
    { class } function
      mediaSelectionOptionsFromArrayFilteredAndSortedAccordingToPreferredLanguages
      (mediaSelectionOptions: NSArray;
      filteredAndSortedAccordingToPreferredLanguages: NSArray): NSArray; cdecl;
    [MethodName('mediaSelectionOptionsFromArray:withLocale:')]
    { class } function mediaSelectionOptionsFromArrayWithLocale
      (mediaSelectionOptions: NSArray; withLocale: NSLocale): NSArray; cdecl;
    [MethodName('mediaSelectionOptionsFromArray:withMediaCharacteristics:')]
    { class } function mediaSelectionOptionsFromArrayWithMediaCharacteristics
      (mediaSelectionOptions: NSArray; withMediaCharacteristics: NSArray)
      : NSArray; cdecl;
    [MethodName('mediaSelectionOptionsFromArray:withoutMediaCharacteristics:')]
    { class } function mediaSelectionOptionsFromArrayWithoutMediaCharacteristics
      (mediaSelectionOptions: NSArray; withoutMediaCharacteristics: NSArray)
      : NSArray; cdecl;
  end;

  AVMediaSelectionGroup = interface(NSObject)
    ['{EF3C5396-9706-4D50-A0E9-1B4AFDB277F8}']
    function options: NSArray; cdecl;
    function defaultOption: AVMediaSelectionOption; cdecl;
    function allowsEmptySelection: Boolean; cdecl;
    function mediaSelectionOptionWithPropertyList(plist: Pointer)
      : AVMediaSelectionOption; cdecl;
  end;

  TAVMediaSelectionGroup = class(TOCGenericImport<AVMediaSelectionGroupClass,
    AVMediaSelectionGroup>)
  end;

  PAVMediaSelectionGroup = Pointer;

  AVURLAssetClass = interface(AVAssetClass)
    ['{78F87961-2A9E-4683-82FE-B5E65B529DD7}']
    { class } function audiovisualTypes: NSArray; cdecl;
    { class } function audiovisualMIMETypes: NSArray; cdecl;
    { class } function isPlayableExtendedMIMEType(extendedMIMEType: NSString)
      : Boolean; cdecl;
    { class } function URLAssetWithURL(URL: NSURL; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  AVURLAsset = interface(AVAsset)
    ['{DAC8E4D9-E183-47F5-A6DE-73EC7D395781}']
    function initWithURL(URL: NSURL; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function URL: NSURL; cdecl;
    function httpSessionIdentifier: NSUUID; cdecl;
    function resourceLoader: AVAssetResourceLoader; cdecl;
    function assetCache: AVAssetCache; cdecl;
    function compatibleTrackForCompositionTrack(compositionTrack
      : AVCompositionTrack): AVAssetTrack; cdecl;
    procedure findCompatibleTrackForCompositionTrack(compositionTrack
      : AVCompositionTrack;
      completionHandler: TAVFoundationCompletionHandler2); cdecl;
    function variants: NSArray; cdecl;
    function mayRequireContentKeysForMediaDataProcessing: Boolean; cdecl;
  end;

  TAVURLAsset = class(TOCGenericImport<AVURLAssetClass, AVURLAsset>)
  end;

  PAVURLAsset = Pointer;

  AVAssetResourceLoaderClass = interface(NSObjectClass)
    ['{CB7D1E94-28E2-4D54-9410-FD153C347A27}']
  end;

  AVAssetResourceLoader = interface(NSObject)
    ['{B1F7D9EF-7F1D-4CCD-97B3-9686317FCCA8}']
    procedure setDelegate(delegate: Pointer; queue: dispatch_queue_t); cdecl;
    function delegate: Pointer; cdecl;
    function delegateQueue: dispatch_queue_t; cdecl;
    procedure setPreloadsEligibleContentKeys(preloadsEligibleContentKeys
      : Boolean); cdecl;
    function preloadsEligibleContentKeys: Boolean; cdecl;
  end;

  TAVAssetResourceLoader = class(TOCGenericImport<AVAssetResourceLoaderClass,
    AVAssetResourceLoader>)
  end;

  PAVAssetResourceLoader = Pointer;

  AVAssetCacheClass = interface(NSObjectClass)
    ['{6BB18325-251A-4632-8683-9780F4A11CA7}']
  end;

  AVAssetCache = interface(NSObject)
    ['{52CCD70E-1892-4C3C-A3C1-714DA284317E}']
    function isPlayableOffline: Boolean; cdecl;
    function mediaSelectionOptionsInMediaSelectionGroup(mediaSelectionGroup
      : AVMediaSelectionGroup): NSArray; cdecl;
  end;

  TAVAssetCache = class(TOCGenericImport<AVAssetCacheClass, AVAssetCache>)
  end;

  PAVAssetCache = Pointer;

  AVFragmentedAssetClass = interface(AVURLAssetClass)
    ['{D95A0E24-BE55-4047-BA37-E6B76CEA8123}']
    { class } function fragmentedAssetWithURL(URL: NSURL; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  AVFragmentedAsset = interface(AVURLAsset)
    ['{385E3DA4-C094-444E-B2E5-53194180867F}']
    function tracks: NSArray; cdecl;
    function trackWithTrackID(trackID: CMPersistentTrackID)
      : AVFragmentedAssetTrack; cdecl;
    procedure loadTrackWithTrackID(trackID: CMPersistentTrackID;
      completionHandler: TAVFoundationCompletionHandler5); cdecl;
    function tracksWithMediaType(mediaType: AVMediaType): NSArray; cdecl;
    procedure loadTracksWithMediaType(mediaType: AVMediaType;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function tracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic): NSArray; cdecl;
    procedure loadTracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
  end;

  TAVFragmentedAsset = class(TOCGenericImport<AVFragmentedAssetClass,
    AVFragmentedAsset>)
  end;

  PAVFragmentedAsset = Pointer;

  AVFragmentedAssetMinderClass = interface(NSObjectClass)
    ['{B8F9FD24-473C-48D0-8502-1D6EB7E5C211}']
    { class } function fragmentedAssetMinderWithAsset(asset: AVAsset;
      mindingInterval: NSTimeInterval): Pointer { instancetype }; cdecl;
  end;

  AVFragmentedAssetMinder = interface(NSObject)
    ['{093042F1-2FF5-4CE9-9FE3-C68CDF3E9E65}']
    function initWithAsset(asset: AVAsset; mindingInterval: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
    procedure setMindingInterval(mindingInterval: NSTimeInterval); cdecl;
    function mindingInterval: NSTimeInterval; cdecl;
    function assets: NSArray; cdecl;
    procedure addFragmentedAsset(asset: AVAsset); cdecl;
    procedure removeFragmentedAsset(asset: AVAsset); cdecl;
  end;

  TAVFragmentedAssetMinder = class
    (TOCGenericImport<AVFragmentedAssetMinderClass, AVFragmentedAssetMinder>)
  end;

  PAVFragmentedAssetMinder = Pointer;

  AVAssetDownloadStorageManagementPolicyClass = interface(NSObjectClass)
    ['{19298AB6-D674-447E-9B46-7C1374DEA74C}']
  end;

  AVAssetDownloadStorageManagementPolicy = interface(NSObject)
    ['{13666208-B303-4788-A721-E7CE412A378E}']
    function priority: AVAssetDownloadedAssetEvictionPriority; cdecl;
    function expirationDate: NSDate; cdecl;
  end;

  TAVAssetDownloadStorageManagementPolicy = class
    (TOCGenericImport<AVAssetDownloadStorageManagementPolicyClass,
    AVAssetDownloadStorageManagementPolicy>)
  end;

  PAVAssetDownloadStorageManagementPolicy = Pointer;

  AVAssetDownloadStorageManagerClass = interface(NSObjectClass)
    ['{94E85DB5-7DAC-4C1B-B82E-6461CC421ABA}']
    { class } function sharedDownloadStorageManager
      : AVAssetDownloadStorageManager; cdecl;
  end;

  AVAssetDownloadStorageManager = interface(NSObject)
    ['{9BD20488-76B7-4808-B161-F5B43BB531FF}']
    procedure setStorageManagementPolicy(storageManagementPolicy
      : AVAssetDownloadStorageManagementPolicy; forURL: NSURL); cdecl;
    function storageManagementPolicyForURL(downloadStorageURL: NSURL)
      : AVAssetDownloadStorageManagementPolicy; cdecl;
  end;

  TAVAssetDownloadStorageManager = class
    (TOCGenericImport<AVAssetDownloadStorageManagerClass,
    AVAssetDownloadStorageManager>)
  end;

  PAVAssetDownloadStorageManager = Pointer;

  AVMutableAssetDownloadStorageManagementPolicyClass = interface
    (AVAssetDownloadStorageManagementPolicyClass)
    ['{03EC9D02-575D-4DE7-8255-97D4CE563F5B}']
  end;

  AVMutableAssetDownloadStorageManagementPolicy = interface
    (AVAssetDownloadStorageManagementPolicy)
    ['{CE3BADAE-2A4D-4B9A-BCAF-974A59AE0404}']
    procedure setPriority(priority
      : AVAssetDownloadedAssetEvictionPriority); cdecl;
    function priority: AVAssetDownloadedAssetEvictionPriority; cdecl;
    procedure setExpirationDate(expirationDate: NSDate); cdecl;
    function expirationDate: NSDate; cdecl;
  end;

  TAVMutableAssetDownloadStorageManagementPolicy = class
    (TOCGenericImport<AVMutableAssetDownloadStorageManagementPolicyClass,
    AVMutableAssetDownloadStorageManagementPolicy>)
  end;

  PAVMutableAssetDownloadStorageManagementPolicy = Pointer;

  AVMutableMediaSelectionClass = interface(AVMediaSelectionClass)
    ['{7A938C53-EDEF-488E-BB0C-0D3C6975C8FD}']
  end;

  AVMutableMediaSelection = interface(AVMediaSelection)
    ['{0584EC10-8FE5-4CBA-8B16-F3852A062B79}']
    procedure selectMediaOption(mediaSelectionOption: AVMediaSelectionOption;
      inMediaSelectionGroup: AVMediaSelectionGroup); cdecl;
  end;

  TAVMutableMediaSelection = class
    (TOCGenericImport<AVMutableMediaSelectionClass, AVMutableMediaSelection>)
  end;

  PAVMutableMediaSelection = Pointer;

  AVAssetDownloadContentConfigurationClass = interface(NSObjectClass)
    ['{6C81D7C9-FFAE-4378-9E88-72EDB1CAB21A}']
  end;

  AVAssetDownloadContentConfiguration = interface(NSObject)
    ['{4DE918D4-49F6-4F97-B0CE-35061D702C8E}']
    procedure setVariantQualifiers(variantQualifiers: NSArray); cdecl;
    function variantQualifiers: NSArray; cdecl;
    procedure setMediaSelections(mediaSelections: NSArray); cdecl;
    function mediaSelections: NSArray; cdecl;
  end;

  TAVAssetDownloadContentConfiguration = class
    (TOCGenericImport<AVAssetDownloadContentConfigurationClass,
    AVAssetDownloadContentConfiguration>)
  end;

  PAVAssetDownloadContentConfiguration = Pointer;

  AVAssetDownloadTaskClass = interface(NSURLSessionTaskClass)
    ['{9940EDBC-A4C5-41C2-BC84-722A4CAE9A57}']
  end;

  AVAssetDownloadTask = interface(NSURLSessionTask)
    ['{AE9E00F5-938C-44D9-99B3-8F0C45EA4943}']
    function URLAsset: AVURLAsset; cdecl;
    function destinationURL: NSURL; cdecl;
    function options: NSDictionary; cdecl;
    function loadedTimeRanges: NSArray; cdecl;
  end;

  TAVAssetDownloadTask = class(TOCGenericImport<AVAssetDownloadTaskClass,
    AVAssetDownloadTask>)
  end;

  PAVAssetDownloadTask = Pointer;

  AVAssetDownloadConfigurationClass = interface(NSObjectClass)
    ['{502F8B54-3327-4B05-9558-0798C1064187}']
    { class } function downloadConfigurationWithAsset(asset: AVURLAsset;
      title: NSString): Pointer { instancetype }; cdecl;
  end;

  AVAssetDownloadConfiguration = interface(NSObject)
    ['{24C7B124-181D-4AF8-BEA0-A260E06F3F77}']
    procedure setArtworkData(artworkData: NSData); cdecl;
    function artworkData: NSData; cdecl;
    function primaryContentConfiguration
      : AVAssetDownloadContentConfiguration; cdecl;
    procedure setAuxiliaryContentConfigurations(auxiliaryContentConfigurations
      : NSArray); cdecl;
    function auxiliaryContentConfigurations: NSArray; cdecl;
    procedure setOptimizesAuxiliaryContentConfigurations
      (optimizesAuxiliaryContentConfigurations: Boolean); cdecl;
    function optimizesAuxiliaryContentConfigurations: Boolean; cdecl;
  end;

  TAVAssetDownloadConfiguration = class
    (TOCGenericImport<AVAssetDownloadConfigurationClass,
    AVAssetDownloadConfiguration>)
  end;

  PAVAssetDownloadConfiguration = Pointer;

  AVAggregateAssetDownloadTaskClass = interface(NSURLSessionTaskClass)
    ['{F9205A9E-01E5-4347-B206-ABEFE8DA1547}']
  end;

  AVAggregateAssetDownloadTask = interface(NSURLSessionTask)
    ['{DD2841CA-4146-4EC7-9632-AC36BF9B0288}']
    function URLAsset: AVURLAsset; cdecl;
  end;

  TAVAggregateAssetDownloadTask = class
    (TOCGenericImport<AVAggregateAssetDownloadTaskClass,
    AVAggregateAssetDownloadTask>)
  end;

  PAVAggregateAssetDownloadTask = Pointer;

  AVAssetDownloadURLSessionClass = interface(NSURLSessionClass)
    ['{D50559DE-B4C8-4688-B58D-1241980E48F3}']
    { class } function sessionWithConfiguration(configuration
      : NSURLSessionConfiguration; assetDownloadDelegate: Pointer;
      delegateQueue: NSOperationQueue): AVAssetDownloadURLSession; cdecl;
  end;

  AVAssetDownloadURLSession = interface(NSURLSession)
    ['{13088B7F-D591-4476-86F5-5402B3AB7C26}']
    [MethodName('assetDownloadTaskWithURLAsset:destinationURL:options:')]
    function assetDownloadTaskWithURLAssetDestinationURLOptions
      (URLAsset: AVURLAsset; destinationURL: NSURL; options: NSDictionary)
      : AVAssetDownloadTask; cdecl;
    [MethodName
      ('assetDownloadTaskWithURLAsset:assetTitle:assetArtworkData:options:')]
    function assetDownloadTaskWithURLAssetAssetTitleAssetArtworkDataOptions
      (URLAsset: AVURLAsset; assetTitle: NSString; assetArtworkData: NSData;
      options: NSDictionary): AVAssetDownloadTask; cdecl;
    function aggregateAssetDownloadTaskWithURLAsset(URLAsset: AVURLAsset;
      mediaSelections: NSArray; assetTitle: NSString; assetArtworkData: NSData;
      options: NSDictionary): AVAggregateAssetDownloadTask; cdecl;
    function assetDownloadTaskWithConfiguration(downloadConfiguration
      : AVAssetDownloadConfiguration): AVAssetDownloadTask; cdecl;
  end;

  TAVAssetDownloadURLSession = class
    (TOCGenericImport<AVAssetDownloadURLSessionClass,
    AVAssetDownloadURLSession>)
  end;

  PAVAssetDownloadURLSession = Pointer;

  AVAudioMixClass = interface(NSObjectClass)
    ['{5CA2724C-0DF1-4CE7-8B3B-CCEF178B051D}']
  end;

  AVAudioMix = interface(NSObject)
    ['{7ACF7F07-E555-47F9-ABC6-EFE254296986}']
    function inputParameters: NSArray; cdecl;
  end;

  TAVAudioMix = class(TOCGenericImport<AVAudioMixClass, AVAudioMix>)
  end;

  PAVAudioMix = Pointer;

  AVVideoCompositionClass = interface(NSObjectClass)
    ['{208501BE-3D06-4386-9334-904B9C7AB281}']
    [MethodName('videoCompositionWithPropertiesOfAsset:')]
    { class } function videoCompositionWithPropertiesOfAsset(asset: AVAsset)
      : AVVideoComposition; cdecl;
    [MethodName('videoCompositionWithPropertiesOfAsset:completionHandler:')]
    { class } procedure videoCompositionWithPropertiesOfAssetCompletionHandler
      (asset: AVAsset;
      completionHandler: TAVFoundationCompletionHandler8); cdecl;
    [MethodName('videoCompositionWithAsset:applyingCIFiltersWithHandler:')]
    { class } function videoCompositionWithAssetApplyingCIFiltersWithHandler
      (asset: AVAsset; applyingCIFiltersWithHandler
      : TAVFoundationApplyingCIFiltersWithHandler): AVVideoComposition; cdecl;
    [MethodName
      ('videoCompositionWithAsset:applyingCIFiltersWithHandler:completionHandler:')
      ]
    { class } procedure
      videoCompositionWithAssetApplyingCIFiltersWithHandlerCompletionHandler
      (asset: AVAsset; applyingCIFiltersWithHandler
      : TAVFoundationApplyingCIFiltersWithHandler;
      completionHandler: TAVFoundationCompletionHandler8); cdecl;
  end;

  AVVideoComposition = interface(NSObject)
    ['{4C001711-874A-423B-9567-DDF164D66950}']
    function customVideoCompositorClass: Pointer; cdecl;
    function frameDuration: CMTime; cdecl;
    function sourceTrackIDForFrameTiming: CMPersistentTrackID; cdecl;
    function renderSize: CGSize; cdecl;
    function renderScale: Single; cdecl;
    function instructions: NSArray; cdecl;
    function animationTool: AVVideoCompositionCoreAnimationTool; cdecl;
    function sourceSampleDataTrackIDs: NSArray; cdecl;
    function colorPrimaries: NSString; cdecl;
    function colorYCbCrMatrix: NSString; cdecl;
    function colorTransferFunction: NSString; cdecl;
    function isValidForAsset(asset: AVAsset; timeRange: CMTimeRange;
      validationDelegate: Pointer): Boolean; cdecl;
    procedure determineValidityForAsset(asset: AVAsset; timeRange: CMTimeRange;
      validationDelegate: Pointer;
      completionHandler: TAVFoundationCompletionHandler11); cdecl;
  end;

  TAVVideoComposition = class(TOCGenericImport<AVVideoCompositionClass,
    AVVideoComposition>)
  end;

  PAVVideoComposition = Pointer;

  AVMetadataItemFilterClass = interface(NSObjectClass)
    ['{6580956F-BA93-4AA4-9052-BCAEEE7EABE3}']
    { class } function metadataItemFilterForSharing
      : AVMetadataItemFilter; cdecl;
  end;

  AVMetadataItemFilter = interface(NSObject)
    ['{46E630CE-9235-47C0-B330-9A42060C8E4B}']
  end;

  TAVMetadataItemFilter = class(TOCGenericImport<AVMetadataItemFilterClass,
    AVMetadataItemFilter>)
  end;

  PAVMetadataItemFilter = Pointer;

  AVAssetExportSessionClass = interface(NSObjectClass)
    ['{B34CDB0D-7C20-4E33-A0E3-C15FB30A26D0}']
    { class } function exportSessionWithAsset(asset: AVAsset;
      presetName: NSString): Pointer { instancetype }; cdecl;
    { class } function allExportPresets: NSArray; cdecl;
    { class } function exportPresetsCompatibleWithAsset(asset: AVAsset)
      : NSArray; cdecl;
    { class } procedure determineCompatibilityOfExportPreset
      (presetName: NSString; withAsset: AVAsset; outputFileType: AVFileType;
      completionHandler: TAVFoundationCompletionHandler6); cdecl;
  end;

  AVAssetExportSession = interface(NSObject)
    ['{47E368A2-A37B-499B-8D55-8F52DC0615E1}']
    function initWithAsset(asset: AVAsset; presetName: NSString)
      : Pointer { instancetype }; cdecl;
    function presetName: NSString; cdecl;
    function asset: AVAsset; cdecl;
    procedure setOutputFileType(outputFileType: AVFileType); cdecl;
    function outputFileType: AVFileType; cdecl;
    procedure setOutputURL(outputURL: NSURL); cdecl;
    function outputURL: NSURL; cdecl;
    procedure setShouldOptimizeForNetworkUse(shouldOptimizeForNetworkUse
      : Boolean); cdecl;
    function shouldOptimizeForNetworkUse: Boolean; cdecl;
    function status: AVAssetExportSessionStatus; cdecl;
    function error: NSError; cdecl;
    procedure exportAsynchronouslyWithCompletionHandler
      (handler: TAVFoundationCompletionHandler); cdecl;
    function progress: Single; cdecl;
    procedure cancelExport; cdecl;
    function supportedFileTypes: NSArray; cdecl;
    procedure determineCompatibleFileTypesWithCompletionHandler
      (handler: TAVFoundationHandler); cdecl;
    procedure setTimeRange(timeRange: CMTimeRange); cdecl;
    function timeRange: CMTimeRange; cdecl;
    function maxDuration: CMTime; cdecl;
    function estimatedOutputFileLength: Int64; cdecl;
    procedure setFileLengthLimit(fileLengthLimit: Int64); cdecl;
    function fileLengthLimit: Int64; cdecl;
    procedure estimateMaximumDurationWithCompletionHandler
      (handler: TAVFoundationHandler1); cdecl;
    procedure estimateOutputFileLengthWithCompletionHandler
      (handler: TAVFoundationHandler2); cdecl;
    procedure setMetadata(metadata: NSArray); cdecl;
    function metadata: NSArray; cdecl;
    procedure setMetadataItemFilter(metadataItemFilter
      : AVMetadataItemFilter); cdecl;
    function metadataItemFilter: AVMetadataItemFilter; cdecl;
    procedure setAudioTimePitchAlgorithm(audioTimePitchAlgorithm
      : AVAudioTimePitchAlgorithm); cdecl;
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
    procedure setAudioMix(audioMix: AVAudioMix); cdecl;
    function audioMix: AVAudioMix; cdecl;
    procedure setVideoComposition(videoComposition: AVVideoComposition); cdecl;
    function videoComposition: AVVideoComposition; cdecl;
    function customVideoCompositor: Pointer; cdecl;
    procedure setAudioTrackGroupHandling(audioTrackGroupHandling
      : AVAssetTrackGroupOutputHandling); cdecl;
    function audioTrackGroupHandling: AVAssetTrackGroupOutputHandling; cdecl;
    procedure setCanPerformMultiplePassesOverSourceMediaData
      (canPerformMultiplePassesOverSourceMediaData: Boolean); cdecl;
    function canPerformMultiplePassesOverSourceMediaData: Boolean; cdecl;
    procedure setDirectoryForTemporaryFiles(directoryForTemporaryFiles
      : NSURL); cdecl;
    function directoryForTemporaryFiles: NSURL; cdecl;
  end;

  TAVAssetExportSession = class(TOCGenericImport<AVAssetExportSessionClass,
    AVAssetExportSession>)
  end;

  PAVAssetExportSession = Pointer;

  AVAssetImageGeneratorClass = interface(NSObjectClass)
    ['{E8E4E6D2-B006-414F-9DCC-8547AD8F3557}']
    { class } function assetImageGeneratorWithAsset(asset: AVAsset)
      : Pointer { instancetype }; cdecl;
  end;

  AVAssetImageGenerator = interface(NSObject)
    ['{D7B1EFF3-0AA1-4626-9A88-A72F6D54C932}']
    function asset: AVAsset; cdecl;
    procedure setAppliesPreferredTrackTransform(appliesPreferredTrackTransform
      : Boolean); cdecl;
    function appliesPreferredTrackTransform: Boolean; cdecl;
    procedure setMaximumSize(maximumSize: CGSize); cdecl;
    function maximumSize: CGSize; cdecl;
    procedure setApertureMode(apertureMode
      : AVAssetImageGeneratorApertureMode); cdecl;
    function apertureMode: AVAssetImageGeneratorApertureMode; cdecl;
    procedure setVideoComposition(videoComposition: AVVideoComposition); cdecl;
    function videoComposition: AVVideoComposition; cdecl;
    function customVideoCompositor: Pointer; cdecl;
    procedure setRequestedTimeToleranceBefore(requestedTimeToleranceBefore
      : CMTime); cdecl;
    function requestedTimeToleranceBefore: CMTime; cdecl;
    procedure setRequestedTimeToleranceAfter(requestedTimeToleranceAfter
      : CMTime); cdecl;
    function requestedTimeToleranceAfter: CMTime; cdecl;
    function initWithAsset(asset: AVAsset): Pointer { instancetype }; cdecl;
    function copyCGImageAtTime(requestedTime: CMTime; actualTime: PCMTime;
      error: NSError): CGImageRef; cdecl;
    procedure generateCGImagesAsynchronouslyForTimes(requestedTimes: NSArray;
      completionHandler: AVAssetImageGeneratorCompletionHandler); cdecl;
    procedure generateCGImageAsynchronouslyForTime(requestedTime: CMTime;
      completionHandler: TAVFoundationCompletionHandler7); cdecl;
    procedure cancelAllCGImageGeneration; cdecl;
  end;

  TAVAssetImageGenerator = class(TOCGenericImport<AVAssetImageGeneratorClass,
    AVAssetImageGenerator>)
  end;

  PAVAssetImageGenerator = Pointer;

  AVAssetPlaybackAssistantClass = interface(NSObjectClass)
    ['{CDF3A6CB-D4B5-418F-9F9A-8795C2D54010}']
    { class } function assetPlaybackAssistantWithAsset(asset: AVAsset)
      : Pointer { instancetype }; cdecl;
  end;

  AVAssetPlaybackAssistant = interface(NSObject)
    ['{22F9A47F-051A-4AE9-8405-F2A0E6EA3308}']
    procedure loadPlaybackConfigurationOptionsWithCompletionHandler
      (completionHandler: TAVFoundationHandler); cdecl;
  end;

  TAVAssetPlaybackAssistant = class
    (TOCGenericImport<AVAssetPlaybackAssistantClass, AVAssetPlaybackAssistant>)
  end;

  PAVAssetPlaybackAssistant = Pointer;

  AVAssetReaderOutputClass = interface(NSObjectClass)
    ['{27155181-AD83-4D6F-89D7-699694BB6CB8}']
  end;

  AVAssetReaderOutput = interface(NSObject)
    ['{070311D8-8E3C-48CF-AEFC-859D0274C545}']
    function mediaType: AVMediaType; cdecl;
    procedure setAlwaysCopiesSampleData(alwaysCopiesSampleData: Boolean); cdecl;
    function alwaysCopiesSampleData: Boolean; cdecl;
    function copyNextSampleBuffer: CMSampleBufferRef; cdecl;
    procedure setSupportsRandomAccess(supportsRandomAccess: Boolean); cdecl;
    function supportsRandomAccess: Boolean; cdecl;
    procedure resetForReadingTimeRanges(timeRanges: NSArray); cdecl;
    procedure markConfigurationAsFinal; cdecl;
  end;

  TAVAssetReaderOutput = class(TOCGenericImport<AVAssetReaderOutputClass,
    AVAssetReaderOutput>)
  end;

  PAVAssetReaderOutput = Pointer;

  AVAssetReaderClass = interface(NSObjectClass)
    ['{CA87E31F-F9D5-4EB1-B71D-6215AA28B9E7}']
    { class } function assetReaderWithAsset(asset: AVAsset; error: NSError)
      : Pointer { instancetype }; cdecl;
  end;

  AVAssetReader = interface(NSObject)
    ['{D0B66765-C4FB-4927-B856-5056E77A692B}']
    function initWithAsset(asset: AVAsset; error: NSError)
      : Pointer { instancetype }; cdecl;
    function asset: AVAsset; cdecl;
    function status: AVAssetReaderStatus; cdecl;
    function error: NSError; cdecl;
    procedure setTimeRange(timeRange: CMTimeRange); cdecl;
    function timeRange: CMTimeRange; cdecl;
    function outputs: NSArray; cdecl;
    function canAddOutput(output: AVAssetReaderOutput): Boolean; cdecl;
    procedure addOutput(output: AVAssetReaderOutput); cdecl;
    function startReading: Boolean; cdecl;
    procedure cancelReading; cdecl;
  end;

  TAVAssetReader = class(TOCGenericImport<AVAssetReaderClass, AVAssetReader>)
  end;

  PAVAssetReader = Pointer;

  AVMutableTimedMetadataGroupClass = interface(AVTimedMetadataGroupClass)
    ['{3F25AC9B-B727-48B6-9D6E-CA0BB6B06C0E}']
  end;

  AVMutableTimedMetadataGroup = interface(AVTimedMetadataGroup)
    ['{7C8FF7A9-3816-4127-9ADF-6CDA67E91FF2}']
    procedure setTimeRange(timeRange: CMTimeRange); cdecl;
    function timeRange: CMTimeRange; cdecl;
    procedure setItems(items: NSArray); cdecl;
    function items: NSArray; cdecl;
  end;

  TAVMutableTimedMetadataGroup = class
    (TOCGenericImport<AVMutableTimedMetadataGroupClass,
    AVMutableTimedMetadataGroup>)
  end;

  PAVMutableTimedMetadataGroup = Pointer;

  AVDateRangeMetadataGroupClass = interface(AVMetadataGroupClass)
    ['{8F0DEEF0-9A92-4487-881D-164B5814DD76}']
  end;

  AVDateRangeMetadataGroup = interface(AVMetadataGroup)
    ['{98D9BF8E-77C6-47D2-8700-3069FB842043}']
    function initWithItems(items: NSArray; startDate: NSDate; endDate: NSDate)
      : Pointer { instancetype }; cdecl;
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function items: NSArray; cdecl;
  end;

  TAVDateRangeMetadataGroup = class
    (TOCGenericImport<AVDateRangeMetadataGroupClass, AVDateRangeMetadataGroup>)
  end;

  PAVDateRangeMetadataGroup = Pointer;

  AVMutableDateRangeMetadataGroupClass = interface
    (AVDateRangeMetadataGroupClass)
    ['{FA4F628E-2A84-4C91-9F77-DED3E348D1DA}']
  end;

  AVMutableDateRangeMetadataGroup = interface(AVDateRangeMetadataGroup)
    ['{6E87010C-F1A8-424B-B181-322551EE1548}']
    procedure setStartDate(startDate: NSDate); cdecl;
    function startDate: NSDate; cdecl;
    procedure setEndDate(endDate: NSDate); cdecl;
    function endDate: NSDate; cdecl;
    procedure setItems(items: NSArray); cdecl;
    function items: NSArray; cdecl;
  end;

  TAVMutableDateRangeMetadataGroup = class
    (TOCGenericImport<AVMutableDateRangeMetadataGroupClass,
    AVMutableDateRangeMetadataGroup>)
  end;

  PAVMutableDateRangeMetadataGroup = Pointer;

  AVAsynchronousVideoCompositionRequestClass = interface(NSObjectClass)
    ['{43B873E3-7C9A-45FE-B749-E670D800F787}']
  end;

  AVAsynchronousVideoCompositionRequest = interface(NSObject)
    ['{7C99BAFF-7B2E-4A8B-98DC-1CCD0D139EEC}']
    function renderContext: AVVideoCompositionRenderContext; cdecl;
    function compositionTime: CMTime; cdecl;
    function sourceTrackIDs: NSArray; cdecl;
    function sourceSampleDataTrackIDs: NSArray; cdecl;
    function videoCompositionInstruction: Pointer; cdecl;
    function sourceFrameByTrackID(trackID: CMPersistentTrackID)
      : CVPixelBufferRef; cdecl;
    function sourceSampleBufferByTrackID(trackID: CMPersistentTrackID)
      : CMSampleBufferRef; cdecl;
    function sourceTimedMetadataByTrackID(trackID: CMPersistentTrackID)
      : AVTimedMetadataGroup; cdecl;
    procedure finishWithComposedVideoFrame(composedVideoFrame
      : CVPixelBufferRef); cdecl;
    procedure finishWithError(error: NSError); cdecl;
    procedure finishCancelledRequest; cdecl;
  end;

  TAVAsynchronousVideoCompositionRequest = class
    (TOCGenericImport<AVAsynchronousVideoCompositionRequestClass,
    AVAsynchronousVideoCompositionRequest>)
  end;

  PAVAsynchronousVideoCompositionRequest = Pointer;

  AVVideoCompositionRenderContextClass = interface(NSObjectClass)
    ['{F5D47F05-CC30-4706-ADDA-C44C70F8574B}']
  end;

  AVVideoCompositionRenderContext = interface(NSObject)
    ['{3403764C-07A2-4881-8A94-2BE33DDD31EB}']
    function size: CGSize; cdecl;
    function renderTransform: CGAffineTransform; cdecl;
    function renderScale: Single; cdecl;
    function pixelAspectRatio: AVPixelAspectRatio; cdecl;
    function edgeWidths: AVEdgeWidths; cdecl;
    function highQualityRendering: Boolean; cdecl;
    function videoComposition: AVVideoComposition; cdecl;
    function newPixelBuffer: CVPixelBufferRef; cdecl;
  end;

  TAVVideoCompositionRenderContext = class
    (TOCGenericImport<AVVideoCompositionRenderContextClass,
    AVVideoCompositionRenderContext>)
  end;

  PAVVideoCompositionRenderContext = Pointer;

  AVVideoCompositionRenderHintClass = interface(NSObjectClass)
    ['{9ABEEA09-C1A7-4AA7-9833-6B206452C1C8}']
  end;

  AVVideoCompositionRenderHint = interface(NSObject)
    ['{151436C7-1497-46E6-8BB4-77B04D26BFA2}']
    function startCompositionTime: CMTime; cdecl;
    function endCompositionTime: CMTime; cdecl;
  end;

  TAVVideoCompositionRenderHint = class
    (TOCGenericImport<AVVideoCompositionRenderHintClass,
    AVVideoCompositionRenderHint>)
  end;

  PAVVideoCompositionRenderHint = Pointer;

  AVAsynchronousCIImageFilteringRequestClass = interface(NSObjectClass)
    ['{41ED24DE-106D-4DE7-950B-BAF5B6E66C2B}']
  end;

  AVAsynchronousCIImageFilteringRequest = interface(NSObject)
    ['{95295D6B-A6DF-4CC8-9243-4DEAF8C3636C}']
    function renderSize: CGSize; cdecl;
    function compositionTime: CMTime; cdecl;
    function sourceImage: CIImage; cdecl;
    procedure finishWithImage(filteredImage: CIImage;
      context: CIContext); cdecl;
    procedure finishWithError(error: NSError); cdecl;
  end;

  TAVAsynchronousCIImageFilteringRequest = class
    (TOCGenericImport<AVAsynchronousCIImageFilteringRequestClass,
    AVAsynchronousCIImageFilteringRequest>)
  end;

  PAVAsynchronousCIImageFilteringRequest = Pointer;

  AVVideoCompositionCoreAnimationToolClass = interface(NSObjectClass)
    ['{2783895A-39FF-48B0-B84C-546CA44D0D42}']
    { class } function videoCompositionCoreAnimationToolWithAdditionalLayer
      (layer: CALayer; asTrackID: CMPersistentTrackID)
      : Pointer { instancetype }; cdecl;
    { class } function
      videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer
      (videoLayer: CALayer; inLayer: CALayer): Pointer { instancetype }; cdecl;
    { class } function
      videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayers
      (videoLayers: NSArray; inLayer: CALayer): Pointer { instancetype }; cdecl;
  end;

  AVVideoCompositionCoreAnimationTool = interface(NSObject)
    ['{8AB652FC-A8C0-4631-A9BB-045FA734EBBB}']
  end;

  TAVVideoCompositionCoreAnimationTool = class
    (TOCGenericImport<AVVideoCompositionCoreAnimationToolClass,
    AVVideoCompositionCoreAnimationTool>)
  end;

  PAVVideoCompositionCoreAnimationTool = Pointer;

  AVVideoCompositionLayerInstructionClass = interface(NSObjectClass)
    ['{81310393-2A43-49B0-AD8F-BFF8C83BEED9}']
  end;

  AVVideoCompositionLayerInstruction = interface(NSObject)
    ['{B85E730D-6B69-4248-B22D-887A64548747}']
    function trackID: CMPersistentTrackID; cdecl;
    function getTransformRampForTime(time: CMTime;
      startTransform: PCGAffineTransform; endTransform: PCGAffineTransform;
      timeRange: PCMTimeRange): Boolean; cdecl;
    function getOpacityRampForTime(time: CMTime; startOpacity: PSingle;
      endOpacity: PSingle; timeRange: PCMTimeRange): Boolean; cdecl;
    function getCropRectangleRampForTime(time: CMTime;
      startCropRectangle: Pointer; endCropRectangle: Pointer;
      timeRange: PCMTimeRange): Boolean; cdecl;
  end;

  TAVVideoCompositionLayerInstruction = class
    (TOCGenericImport<AVVideoCompositionLayerInstructionClass,
    AVVideoCompositionLayerInstruction>)
  end;

  PAVVideoCompositionLayerInstruction = Pointer;

  AVVideoCompositionInstruction = interface(IObjectiveC)
    ['{A2DE39D7-50C3-4DAB-8F31-3F7A55A5D70E}']
    function timeRange: CMTimeRange; cdecl;
    function enablePostProcessing: Boolean; cdecl;
    function containsTweening: Boolean; cdecl;
    function requiredSourceTrackIDs: NSArray; cdecl;
    function passthroughTrackID: CMPersistentTrackID; cdecl;
    function requiredSourceSampleDataTrackIDs: NSArray; cdecl;
    function backgroundColor: CGColorRef; cdecl;
    function layerInstructions: NSArray; cdecl;
  end;

  AVMutableVideoCompositionClass = interface(AVVideoCompositionClass)
    ['{0CE38821-73DA-486E-A22A-218FB60CF0B0}']
    { class } function videoComposition: AVMutableVideoComposition; cdecl;
    [MethodName('videoCompositionWithPropertiesOfAsset:')]
    { class } function videoCompositionWithPropertiesOfAsset(asset: AVAsset)
      : AVMutableVideoComposition; cdecl;
    [MethodName('videoCompositionWithPropertiesOfAsset:completionHandler:')]
    { class } procedure videoCompositionWithPropertiesOfAssetCompletionHandler
      (asset: AVAsset;
      completionHandler: TAVFoundationCompletionHandler9); cdecl;
    [MethodName('videoCompositionWithPropertiesOfAsset:prototypeInstruction:')]
    { class } function videoCompositionWithPropertiesOfAssetPrototypeInstruction
      (asset: AVAsset; prototypeInstruction: AVVideoCompositionInstruction)
      : AVMutableVideoComposition; cdecl;
    [MethodName
      ('videoCompositionWithPropertiesOfAsset:prototypeInstruction:completionHandler:')
      ]
    { class } procedure
      videoCompositionWithPropertiesOfAssetPrototypeInstructionCompletionHandler
      (asset: AVAsset; prototypeInstruction: AVVideoCompositionInstruction;
      completionHandler: TAVFoundationCompletionHandler9); cdecl;
    [MethodName('videoCompositionWithAsset:applyingCIFiltersWithHandler:')]
    { class } function videoCompositionWithAssetApplyingCIFiltersWithHandler
      (asset: AVAsset; applyingCIFiltersWithHandler
      : TAVFoundationApplyingCIFiltersWithHandler)
      : AVMutableVideoComposition; cdecl;
    [MethodName
      ('videoCompositionWithAsset:applyingCIFiltersWithHandler:completionHandler:')
      ]
    { class } procedure
      videoCompositionWithAssetApplyingCIFiltersWithHandlerCompletionHandler
      (asset: AVAsset; applyingCIFiltersWithHandler
      : TAVFoundationApplyingCIFiltersWithHandler;
      completionHandler: TAVFoundationCompletionHandler9); cdecl;
  end;

  AVMutableVideoComposition = interface(AVVideoComposition)
    ['{E59A4C00-C788-4821-97F3-A048EEEDF41E}']
    procedure setCustomVideoCompositorClass(customVideoCompositorClass
      : Pointer); cdecl;
    function customVideoCompositorClass: Pointer; cdecl;
    procedure setFrameDuration(frameDuration: CMTime); cdecl;
    function frameDuration: CMTime; cdecl;
    procedure setSourceTrackIDForFrameTiming(sourceTrackIDForFrameTiming
      : CMPersistentTrackID); cdecl;
    function sourceTrackIDForFrameTiming: CMPersistentTrackID; cdecl;
    procedure setRenderSize(renderSize: CGSize); cdecl;
    function renderSize: CGSize; cdecl;
    procedure setRenderScale(renderScale: Single); cdecl;
    function renderScale: Single; cdecl;
    procedure setInstructions(instructions: NSArray); cdecl;
    function instructions: NSArray; cdecl;
    procedure setAnimationTool(animationTool
      : AVVideoCompositionCoreAnimationTool); cdecl;
    function animationTool: AVVideoCompositionCoreAnimationTool; cdecl;
    procedure setSourceSampleDataTrackIDs(sourceSampleDataTrackIDs
      : NSArray); cdecl;
    function sourceSampleDataTrackIDs: NSArray; cdecl;
    procedure setColorPrimaries(colorPrimaries: NSString); cdecl;
    function colorPrimaries: NSString; cdecl;
    procedure setColorYCbCrMatrix(colorYCbCrMatrix: NSString); cdecl;
    function colorYCbCrMatrix: NSString; cdecl;
    procedure setColorTransferFunction(colorTransferFunction: NSString); cdecl;
    function colorTransferFunction: NSString; cdecl;
  end;

  TAVMutableVideoComposition = class
    (TOCGenericImport<AVMutableVideoCompositionClass,
    AVMutableVideoComposition>)
  end;

  PAVMutableVideoComposition = Pointer;

  AVMutableVideoCompositionInstructionClass = interface
    (AVVideoCompositionInstructionClass)
    ['{CEECAF85-CF7E-4328-AC8C-D1C23614CB16}']
    { class } function videoCompositionInstruction
      : Pointer { instancetype }; cdecl;
  end;

  AVMutableVideoCompositionInstruction = interface
    (AVVideoCompositionInstruction)
    ['{321EF3EC-7C71-4F67-97D5-FAB9C7C9D49D}']
    procedure setTimeRange(timeRange: CMTimeRange); cdecl;
    function timeRange: CMTimeRange; cdecl;
    procedure setBackgroundColor(backgroundColor: CGColorRef); cdecl;
    function backgroundColor: CGColorRef; cdecl;
    procedure setLayerInstructions(layerInstructions: NSArray); cdecl;
    function layerInstructions: NSArray; cdecl;
    procedure setEnablePostProcessing(enablePostProcessing: Boolean); cdecl;
    function enablePostProcessing: Boolean; cdecl;
    procedure setRequiredSourceSampleDataTrackIDs
      (requiredSourceSampleDataTrackIDs: NSArray); cdecl;
    function requiredSourceSampleDataTrackIDs: NSArray; cdecl;
  end;

  TAVMutableVideoCompositionInstruction = class
    (TOCGenericImport<AVMutableVideoCompositionInstructionClass,
    AVMutableVideoCompositionInstruction>)
  end;

  PAVMutableVideoCompositionInstruction = Pointer;

  AVMutableVideoCompositionLayerInstructionClass = interface
    (AVVideoCompositionLayerInstructionClass)
    ['{CD71B982-4E44-431D-A230-23484EA3F90C}']
    { class } function videoCompositionLayerInstructionWithAssetTrack
      (track: AVAssetTrack): Pointer { instancetype }; cdecl;
    { class } function videoCompositionLayerInstruction
      : Pointer { instancetype }; cdecl;
  end;

  AVMutableVideoCompositionLayerInstruction = interface
    (AVVideoCompositionLayerInstruction)
    ['{1D4514F0-86CF-4345-A7FB-3EB1D2340BD3}']
    procedure setTrackID(trackID: CMPersistentTrackID); cdecl;
    function trackID: CMPersistentTrackID; cdecl;
    procedure setTransformRampFromStartTransform(startTransform
      : CGAffineTransform; toEndTransform: CGAffineTransform;
      timeRange: CMTimeRange); cdecl;
    procedure setTransform(transform: CGAffineTransform; atTime: CMTime); cdecl;
    procedure setOpacityRampFromStartOpacity(startOpacity: Single;
      toEndOpacity: Single; timeRange: CMTimeRange); cdecl;
    procedure setOpacity(opacity: Single; atTime: CMTime); cdecl;
    procedure setCropRectangleRampFromStartCropRectangle(startCropRectangle
      : CGRect; toEndCropRectangle: CGRect; timeRange: CMTimeRange); cdecl;
    procedure setCropRectangle(cropRectangle: CGRect; atTime: CMTime); cdecl;
  end;

  TAVMutableVideoCompositionLayerInstruction = class
    (TOCGenericImport<AVMutableVideoCompositionLayerInstructionClass,
    AVMutableVideoCompositionLayerInstruction>)
  end;

  PAVMutableVideoCompositionLayerInstruction = Pointer;

  AVAudioMixInputParametersClass = interface(NSObjectClass)
    ['{67808B25-414F-4B3C-A6AF-13CFDF0B0648}']
  end;

  AVAudioMixInputParameters = interface(NSObject)
    ['{13557F5A-4041-405C-B167-53B190040C9F}']
    function trackID: CMPersistentTrackID; cdecl;
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
    function audioTapProcessor: MTAudioProcessingTapRef; cdecl;
    function getVolumeRampForTime(time: CMTime; startVolume: PSingle;
      endVolume: PSingle; timeRange: PCMTimeRange): Boolean; cdecl;
  end;

  TAVAudioMixInputParameters = class
    (TOCGenericImport<AVAudioMixInputParametersClass,
    AVAudioMixInputParameters>)
  end;

  PAVAudioMixInputParameters = Pointer;

  AVAssetReaderTrackOutputClass = interface(AVAssetReaderOutputClass)
    ['{41194B7A-DFB7-4343-BF6C-6186A11AD464}']
    { class } function assetReaderTrackOutputWithTrack(track: AVAssetTrack;
      outputSettings: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  AVAssetReaderTrackOutput = interface(AVAssetReaderOutput)
    ['{D3442BDB-7C7D-4C8B-B7D3-68E1BEF761FD}']
    function initWithTrack(track: AVAssetTrack; outputSettings: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function track: AVAssetTrack; cdecl;
    function outputSettings: NSDictionary; cdecl;
    procedure setAudioTimePitchAlgorithm(audioTimePitchAlgorithm
      : AVAudioTimePitchAlgorithm); cdecl;
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
  end;

  TAVAssetReaderTrackOutput = class
    (TOCGenericImport<AVAssetReaderTrackOutputClass, AVAssetReaderTrackOutput>)
  end;

  PAVAssetReaderTrackOutput = Pointer;

  AVAssetReaderAudioMixOutputClass = interface(AVAssetReaderOutputClass)
    ['{F312C851-56C3-417F-BD0D-CA69F432D1CA}']
    { class } function assetReaderAudioMixOutputWithAudioTracks
      (audioTracks: NSArray; audioSettings: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  AVAssetReaderAudioMixOutput = interface(AVAssetReaderOutput)
    ['{B3F4D907-97A8-44AC-827D-C300B853B2F3}']
    function initWithAudioTracks(audioTracks: NSArray;
      audioSettings: NSDictionary): Pointer { instancetype }; cdecl;
    function audioTracks: NSArray; cdecl;
    function audioSettings: NSDictionary; cdecl;
    procedure setAudioMix(audioMix: AVAudioMix); cdecl;
    function audioMix: AVAudioMix; cdecl;
    procedure setAudioTimePitchAlgorithm(audioTimePitchAlgorithm
      : AVAudioTimePitchAlgorithm); cdecl;
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
  end;

  TAVAssetReaderAudioMixOutput = class
    (TOCGenericImport<AVAssetReaderAudioMixOutputClass,
    AVAssetReaderAudioMixOutput>)
  end;

  PAVAssetReaderAudioMixOutput = Pointer;

  AVAssetReaderVideoCompositionOutputClass = interface(AVAssetReaderOutputClass)
    ['{095B645B-2120-4899-B41E-7B1753E54DCE}']
    { class } function assetReaderVideoCompositionOutputWithVideoTracks
      (videoTracks: NSArray; videoSettings: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  AVAssetReaderVideoCompositionOutput = interface(AVAssetReaderOutput)
    ['{3DF4B9AB-80E2-4A0D-AE94-A700E79838FE}']
    function initWithVideoTracks(videoTracks: NSArray;
      videoSettings: NSDictionary): Pointer { instancetype }; cdecl;
    function videoTracks: NSArray; cdecl;
    function videoSettings: NSDictionary; cdecl;
    procedure setVideoComposition(videoComposition: AVVideoComposition); cdecl;
    function videoComposition: AVVideoComposition; cdecl;
    function customVideoCompositor: Pointer; cdecl;
  end;

  TAVAssetReaderVideoCompositionOutput = class
    (TOCGenericImport<AVAssetReaderVideoCompositionOutputClass,
    AVAssetReaderVideoCompositionOutput>)
  end;

  PAVAssetReaderVideoCompositionOutput = Pointer;

  AVAssetReaderOutputMetadataAdaptorClass = interface(NSObjectClass)
    ['{D5D51012-8E86-43EF-B608-E9B4B7766C8B}']
    { class } function
      assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput
      (trackOutput: AVAssetReaderTrackOutput): Pointer { instancetype }; cdecl;
  end;

  AVAssetReaderOutputMetadataAdaptor = interface(NSObject)
    ['{7726FBD4-26C0-4BD8-9263-24CCB972EF0C}']
    function initWithAssetReaderTrackOutput(trackOutput
      : AVAssetReaderTrackOutput): Pointer { instancetype }; cdecl;
    function assetReaderTrackOutput: AVAssetReaderTrackOutput; cdecl;
    function nextTimedMetadataGroup: AVTimedMetadataGroup; cdecl;
  end;

  TAVAssetReaderOutputMetadataAdaptor = class
    (TOCGenericImport<AVAssetReaderOutputMetadataAdaptorClass,
    AVAssetReaderOutputMetadataAdaptor>)
  end;

  PAVAssetReaderOutputMetadataAdaptor = Pointer;

  AVAssetReaderOutputCaptionAdaptorClass = interface(NSObjectClass)
    ['{EC8A6053-2129-4AF5-AFCE-755A746B36AF}']
    { class } function assetReaderOutputCaptionAdaptorWithAssetReaderTrackOutput
      (trackOutput: AVAssetReaderTrackOutput): Pointer { instancetype }; cdecl;
  end;

  AVAssetReaderOutputCaptionAdaptor = interface(NSObject)
    ['{D1F2513F-8547-40E2-ACA6-38BB8B8E4E98}']
    function initWithAssetReaderTrackOutput(trackOutput
      : AVAssetReaderTrackOutput): Pointer { instancetype }; cdecl;
    function assetReaderTrackOutput: AVAssetReaderTrackOutput; cdecl;
    function nextCaptionGroup: AVCaptionGroup; cdecl;
    function captionsNotPresentInPreviousGroupsInCaptionGroup
      (captionGroup: AVCaptionGroup): NSArray; cdecl;
    procedure setValidationDelegate(validationDelegate: Pointer); cdecl;
    function validationDelegate: Pointer; cdecl;
  end;

  TAVAssetReaderOutputCaptionAdaptor = class
    (TOCGenericImport<AVAssetReaderOutputCaptionAdaptorClass,
    AVAssetReaderOutputCaptionAdaptor>)
  end;

  PAVAssetReaderOutputCaptionAdaptor = Pointer;

  AVAssetReaderSampleReferenceOutputClass = interface(AVAssetReaderOutputClass)
    ['{99D2AFED-EE77-4082-80A8-62B05DD21D63}']
    { class } function assetReaderSampleReferenceOutputWithTrack
      (track: AVAssetTrack): Pointer { instancetype }; cdecl;
  end;

  AVAssetReaderSampleReferenceOutput = interface(AVAssetReaderOutput)
    ['{0B291FE1-2A5D-435F-80CF-F6162BE667AA}']
    function initWithTrack(track: AVAssetTrack)
      : Pointer { instancetype }; cdecl;
    function track: AVAssetTrack; cdecl;
  end;

  TAVAssetReaderSampleReferenceOutput = class
    (TOCGenericImport<AVAssetReaderSampleReferenceOutputClass,
    AVAssetReaderSampleReferenceOutput>)
  end;

  PAVAssetReaderSampleReferenceOutput = Pointer;

  AVAssetResourceLoadingRequestClass = interface(NSObjectClass)
    ['{A2ED5C9F-969D-4635-B7F2-C42D58877DC0}']
  end;

  AVAssetResourceLoadingRequest = interface(NSObject)
    ['{AA3463FC-A048-4D77-9157-A2762568378D}']
    function request: NSURLRequest; cdecl;
    function isFinished: Boolean; cdecl;
    function isCancelled: Boolean; cdecl;
    function contentInformationRequest
      : AVAssetResourceLoadingContentInformationRequest; cdecl;
    function dataRequest: AVAssetResourceLoadingDataRequest; cdecl;
    procedure setResponse(response: NSURLResponse); cdecl;
    function response: NSURLResponse; cdecl;
    procedure setRedirect(redirect: NSURLRequest); cdecl;
    function redirect: NSURLRequest; cdecl;
    function requestor: AVAssetResourceLoadingRequestor; cdecl;
    procedure finishLoading; cdecl;
    procedure finishLoadingWithError(error: NSError); cdecl;
    function streamingContentKeyRequestDataForApp(appIdentifier: NSData;
      contentIdentifier: NSData; options: NSDictionary; error: NSError)
      : NSData; cdecl;
    function persistentContentKeyFromKeyVendorResponse(keyVendorResponse
      : NSData; options: NSDictionary; error: NSError): NSData; cdecl;
    procedure finishLoadingWithResponse(response: NSURLResponse; data: NSData;
      redirect: NSURLRequest); cdecl;
  end;

  TAVAssetResourceLoadingRequest = class
    (TOCGenericImport<AVAssetResourceLoadingRequestClass,
    AVAssetResourceLoadingRequest>)
  end;

  PAVAssetResourceLoadingRequest = Pointer;

  AVAssetResourceRenewalRequestClass = interface
    (AVAssetResourceLoadingRequestClass)
    ['{E3A1DF9E-9E28-4E49-9A4A-A189820F8CF9}']
  end;

  AVAssetResourceRenewalRequest = interface(AVAssetResourceLoadingRequest)
    ['{965036FA-890B-45F3-BC30-FF1AB7C73FE0}']
  end;

  TAVAssetResourceRenewalRequest = class
    (TOCGenericImport<AVAssetResourceRenewalRequestClass,
    AVAssetResourceRenewalRequest>)
  end;

  PAVAssetResourceRenewalRequest = Pointer;

  AVAssetResourceLoadingRequestorClass = interface(NSObjectClass)
    ['{26F9388E-44ED-42FA-95F9-1CF9EAD436F2}']
  end;

  AVAssetResourceLoadingRequestor = interface(NSObject)
    ['{CDFA3631-D1C1-4749-BCB9-E82D87904180}']
    function providesExpiredSessionReports: Boolean; cdecl;
  end;

  TAVAssetResourceLoadingRequestor = class
    (TOCGenericImport<AVAssetResourceLoadingRequestorClass,
    AVAssetResourceLoadingRequestor>)
  end;

  PAVAssetResourceLoadingRequestor = Pointer;

  AVAssetResourceLoadingContentInformationRequestClass = interface
    (NSObjectClass)
    ['{659C13A1-8135-4C8D-B9E1-AF15D3104B26}']
  end;

  AVAssetResourceLoadingContentInformationRequest = interface(NSObject)
    ['{E56495B5-E3EA-456B-8347-AED01141A1C6}']
    procedure setContentType(contentType: NSString); cdecl;
    function contentType: NSString; cdecl;
    function allowedContentTypes: NSArray; cdecl;
    procedure setContentLength(contentLength: Int64); cdecl;
    function contentLength: Int64; cdecl;
    procedure setByteRangeAccessSupported(byteRangeAccessSupported
      : Boolean); cdecl;
    function isByteRangeAccessSupported: Boolean; cdecl;
    procedure setRenewalDate(renewalDate: NSDate); cdecl;
    function renewalDate: NSDate; cdecl;
    procedure setEntireLengthAvailableOnDemand(entireLengthAvailableOnDemand
      : Boolean); cdecl;
    function isEntireLengthAvailableOnDemand: Boolean; cdecl;
  end;

  TAVAssetResourceLoadingContentInformationRequest = class
    (TOCGenericImport<AVAssetResourceLoadingContentInformationRequestClass,
    AVAssetResourceLoadingContentInformationRequest>)
  end;

  PAVAssetResourceLoadingContentInformationRequest = Pointer;

  AVAssetResourceLoadingDataRequestClass = interface(NSObjectClass)
    ['{08F9BAA1-6C6B-4C10-9EEF-16E72D371D1A}']
  end;

  AVAssetResourceLoadingDataRequest = interface(NSObject)
    ['{9B46E34F-ED14-4244-BC64-5725AFE2366A}']
    function requestedOffset: Int64; cdecl;
    function requestedLength: NSInteger; cdecl;
    function requestsAllDataToEndOfResource: Boolean; cdecl;
    function currentOffset: Int64; cdecl;
    procedure respondWithData(data: NSData); cdecl;
  end;

  TAVAssetResourceLoadingDataRequest = class
    (TOCGenericImport<AVAssetResourceLoadingDataRequestClass,
    AVAssetResourceLoadingDataRequest>)
  end;

  PAVAssetResourceLoadingDataRequest = Pointer;

  AVAssetSegmentTrackReportClass = interface(NSObjectClass)
    ['{B7ACFC9E-D379-4500-8E8C-22F1557275CF}']
  end;

  AVAssetSegmentTrackReport = interface(NSObject)
    ['{98E74C65-821D-4CE7-B808-E828F1393917}']
    function trackID: CMPersistentTrackID; cdecl;
    function mediaType: AVMediaType; cdecl;
    function earliestPresentationTimeStamp: CMTime; cdecl;
    function duration: CMTime; cdecl;
    function firstVideoSampleInformation
      : AVAssetSegmentReportSampleInformation; cdecl;
  end;

  TAVAssetSegmentTrackReport = class
    (TOCGenericImport<AVAssetSegmentTrackReportClass,
    AVAssetSegmentTrackReport>)
  end;

  PAVAssetSegmentTrackReport = Pointer;

  AVAssetSegmentReportSampleInformationClass = interface(NSObjectClass)
    ['{EEA2527E-847F-4B8A-B19E-756D87AFD2E0}']
  end;

  AVAssetSegmentReportSampleInformation = interface(NSObject)
    ['{85B5A28D-E926-44A5-8CBA-3D76561305A2}']
    function presentationTimeStamp: CMTime; cdecl;
    function offset: NSInteger; cdecl;
    function length: NSInteger; cdecl;
    function isSyncSample: Boolean; cdecl;
  end;

  TAVAssetSegmentReportSampleInformation = class
    (TOCGenericImport<AVAssetSegmentReportSampleInformationClass,
    AVAssetSegmentReportSampleInformation>)
  end;

  PAVAssetSegmentReportSampleInformation = Pointer;

  AVAssetSegmentReportClass = interface(NSObjectClass)
    ['{1F185629-D7F8-4597-A8E2-DE2A0260A322}']
  end;

  AVAssetSegmentReport = interface(NSObject)
    ['{4C8B478F-9C2E-4797-AD9D-54E5484AE5F3}']
    function segmentType: AVAssetSegmentType; cdecl;
    function trackReports: NSArray; cdecl;
  end;

  TAVAssetSegmentReport = class(TOCGenericImport<AVAssetSegmentReportClass,
    AVAssetSegmentReport>)
  end;

  PAVAssetSegmentReport = Pointer;

  AVAssetTrackSegmentClass = interface(NSObjectClass)
    ['{AF96CFC3-6442-4F37-846C-72913FE24F2E}']
  end;

  AVAssetTrackSegment = interface(NSObject)
    ['{75E1E60C-F09D-4CAA-B09B-9D901B0B2192}']
    function timeMapping: CMTimeMapping; cdecl;
    function isEmpty: Boolean; cdecl;
  end;

  TAVAssetTrackSegment = class(TOCGenericImport<AVAssetTrackSegmentClass,
    AVAssetTrackSegment>)
  end;

  PAVAssetTrackSegment = Pointer;

  AVSampleCursorClass = interface(NSObjectClass)
    ['{3005D22D-1093-4486-BCF8-CAEF27257364}']
  end;

  AVSampleCursor = interface(NSObject)
    ['{B6F03B07-AEE1-4067-9824-E7DB139BCFFD}']
    function stepInDecodeOrderByCount(stepCount: Int64): Int64; cdecl;
    function stepInPresentationOrderByCount(stepCount: Int64): Int64; cdecl;
    function stepByDecodeTime(deltaDecodeTime: CMTime; wasPinned: PBoolean)
      : CMTime; cdecl;
    function stepByPresentationTime(deltaPresentationTime: CMTime;
      wasPinned: PBoolean): CMTime; cdecl;
    function presentationTimeStamp: CMTime; cdecl;
    function decodeTimeStamp: CMTime; cdecl;
    function comparePositionInDecodeOrderWithPositionOfCursor
      (cursor: AVSampleCursor): NSComparisonResult; cdecl;
    function samplesWithEarlierDecodeTimeStampsMayHaveLaterPresentationTimeStampsThanCursor
      (cursor: AVSampleCursor): Boolean; cdecl;
    function samplesWithLaterDecodeTimeStampsMayHaveEarlierPresentationTimeStampsThanCursor
      (cursor: AVSampleCursor): Boolean; cdecl;
    function currentSampleDuration: CMTime; cdecl;
    function copyCurrentSampleFormatDescription: CMFormatDescriptionRef; cdecl;
    function currentSampleSyncInfo: AVSampleCursorSyncInfo; cdecl;
    function currentSampleDependencyInfo: AVSampleCursorDependencyInfo; cdecl;
    function currentSampleDependencyAttachments: NSDictionary; cdecl;
    function currentSampleAudioDependencyInfo
      : AVSampleCursorAudioDependencyInfo; cdecl;
    function samplesRequiredForDecoderRefresh: NSInteger; cdecl;
    function currentChunkStorageURL: NSURL; cdecl;
    function currentChunkStorageRange: AVSampleCursorStorageRange; cdecl;
    function currentChunkInfo: AVSampleCursorChunkInfo; cdecl;
    function currentSampleIndexInChunk: Int64; cdecl;
    function currentSampleStorageRange: AVSampleCursorStorageRange; cdecl;
  end;

  TAVSampleCursor = class(TOCGenericImport<AVSampleCursorClass, AVSampleCursor>)
  end;

  PAVSampleCursor = Pointer;

  AVAssetWriterInputClass = interface(NSObjectClass)
    ['{88431C02-BFFE-432D-B828-1D5DD1A110E2}']
    [MethodName('assetWriterInputWithMediaType:outputSettings:')]
    { class } function assetWriterInputWithMediaTypeOutputSettings
      (mediaType: AVMediaType; outputSettings: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('assetWriterInputWithMediaType:outputSettings:sourceFormatHint:')]
    { class } function
      assetWriterInputWithMediaTypeOutputSettingsSourceFormatHint
      (mediaType: AVMediaType; outputSettings: NSDictionary;
      sourceFormatHint: CMFormatDescriptionRef)
      : Pointer { instancetype }; cdecl;
  end;

  AVAssetWriterInput = interface(NSObject)
    ['{F1C2D14B-52A2-4040-9556-4495B0F5D5EA}']
    [MethodName('initWithMediaType:outputSettings:')]
    function initWithMediaTypeOutputSettings(mediaType: AVMediaType;
      outputSettings: NSDictionary): Pointer { instancetype }; cdecl;
    [MethodName('initWithMediaType:outputSettings:sourceFormatHint:')]
    function initWithMediaTypeOutputSettingsSourceFormatHint
      (mediaType: AVMediaType; outputSettings: NSDictionary;
      sourceFormatHint: CMFormatDescriptionRef)
      : Pointer { instancetype }; cdecl;
    function mediaType: AVMediaType; cdecl;
    function outputSettings: NSDictionary; cdecl;
    function sourceFormatHint: CMFormatDescriptionRef; cdecl;
    procedure setMetadata(metadata: NSArray); cdecl;
    function metadata: NSArray; cdecl;
    function isReadyForMoreMediaData: Boolean; cdecl;
    procedure setExpectsMediaDataInRealTime(expectsMediaDataInRealTime
      : Boolean); cdecl;
    function expectsMediaDataInRealTime: Boolean; cdecl;
    procedure requestMediaDataWhenReadyOnQueue(queue: dispatch_queue_t;
      usingBlock: TAVFoundationCompletionHandler); cdecl;
    function appendSampleBuffer(sampleBuffer: CMSampleBufferRef)
      : Boolean; cdecl;
    procedure markAsFinished; cdecl;
    procedure setLanguageCode(languageCode: NSString); cdecl;
    function languageCode: NSString; cdecl;
    procedure setExtendedLanguageTag(extendedLanguageTag: NSString); cdecl;
    function extendedLanguageTag: NSString; cdecl;
    procedure setNaturalSize(naturalSize: CGSize); cdecl;
    function naturalSize: CGSize; cdecl;
    procedure setTransform(transform: CGAffineTransform); cdecl;
    function transform: CGAffineTransform; cdecl;
    procedure setPreferredVolume(preferredVolume: Single); cdecl;
    function preferredVolume: Single; cdecl;
    procedure setMarksOutputTrackAsEnabled(marksOutputTrackAsEnabled
      : Boolean); cdecl;
    function marksOutputTrackAsEnabled: Boolean; cdecl;
    procedure setMediaTimeScale(mediaTimeScale: CMTimeScale); cdecl;
    function mediaTimeScale: CMTimeScale; cdecl;
    procedure setPreferredMediaChunkDuration(preferredMediaChunkDuration
      : CMTime); cdecl;
    function preferredMediaChunkDuration: CMTime; cdecl;
    procedure setPreferredMediaChunkAlignment(preferredMediaChunkAlignment
      : NSInteger); cdecl;
    function preferredMediaChunkAlignment: NSInteger; cdecl;
    procedure setSampleReferenceBaseURL(sampleReferenceBaseURL: NSURL); cdecl;
    function sampleReferenceBaseURL: NSURL; cdecl;
    procedure setMediaDataLocation(mediaDataLocation
      : AVAssetWriterInputMediaDataLocation); cdecl;
    function mediaDataLocation: AVAssetWriterInputMediaDataLocation; cdecl;
    function canAddTrackAssociationWithTrackOfInput(input: AVAssetWriterInput;
      &type: NSString): Boolean; cdecl;
    procedure addTrackAssociationWithTrackOfInput(input: AVAssetWriterInput;
      &type: NSString); cdecl;
    procedure setPerformsMultiPassEncodingIfSupported
      (performsMultiPassEncodingIfSupported: Boolean); cdecl;
    function performsMultiPassEncodingIfSupported: Boolean; cdecl;
    function canPerformMultiplePasses: Boolean; cdecl;
    function currentPassDescription: AVAssetWriterInputPassDescription; cdecl;
    procedure respondToEachPassDescriptionOnQueue(queue: dispatch_queue_t;
      usingBlock: Pointer { dispatch_block_t } ); cdecl;
    procedure markCurrentPassAsFinished; cdecl;
  end;

  TAVAssetWriterInput = class(TOCGenericImport<AVAssetWriterInputClass,
    AVAssetWriterInput>)
  end;

  PAVAssetWriterInput = Pointer;

  AVAssetWriterClass = interface(NSObjectClass)
    ['{7647D78A-CAD6-4973-AB52-8DBF3DB05CBC}']
    { class } function assetWriterWithURL(outputURL: NSURL;
      fileType: AVFileType; error: NSError): Pointer { instancetype }; cdecl;
  end;

  AVAssetWriter = interface(NSObject)
    ['{5825CFF5-BB17-45F7-BD0C-D419808EAFC0}']
    function initWithURL(outputURL: NSURL; fileType: AVFileType; error: NSError)
      : Pointer { instancetype }; cdecl;
    function initWithContentType(outputContentType: Pointer)
      : Pointer { instancetype }; cdecl;
    function outputURL: NSURL; cdecl;
    function outputFileType: AVFileType; cdecl;
    function availableMediaTypes: NSArray; cdecl;
    function status: AVAssetWriterStatus; cdecl;
    function error: NSError; cdecl;
    procedure setMetadata(metadata: NSArray); cdecl;
    function metadata: NSArray; cdecl;
    procedure setShouldOptimizeForNetworkUse(shouldOptimizeForNetworkUse
      : Boolean); cdecl;
    function shouldOptimizeForNetworkUse: Boolean; cdecl;
    procedure setDirectoryForTemporaryFiles(directoryForTemporaryFiles
      : NSURL); cdecl;
    function directoryForTemporaryFiles: NSURL; cdecl;
    function inputs: NSArray; cdecl;
    function canApplyOutputSettings(outputSettings: NSDictionary;
      forMediaType: AVMediaType): Boolean; cdecl;
    function canAddInput(input: AVAssetWriterInput): Boolean; cdecl;
    procedure addInput(input: AVAssetWriterInput); cdecl;
    function startWriting: Boolean; cdecl;
    procedure startSessionAtSourceTime(startTime: CMTime); cdecl;
    procedure endSessionAtSourceTime(endTime: CMTime); cdecl;
    procedure cancelWriting; cdecl;
    function finishWriting: Boolean; cdecl;
    procedure finishWritingWithCompletionHandler
      (handler: TAVFoundationCompletionHandler); cdecl;
    procedure setMovieFragmentInterval(movieFragmentInterval: CMTime); cdecl;
    function movieFragmentInterval: CMTime; cdecl;
    procedure setInitialMovieFragmentSequenceNumber
      (initialMovieFragmentSequenceNumber: NSInteger); cdecl;
    function initialMovieFragmentSequenceNumber: NSInteger; cdecl;
    procedure setProducesCombinableFragments(producesCombinableFragments
      : Boolean); cdecl;
    function producesCombinableFragments: Boolean; cdecl;
    procedure setOverallDurationHint(overallDurationHint: CMTime); cdecl;
    function overallDurationHint: CMTime; cdecl;
    procedure setMovieTimeScale(movieTimeScale: CMTimeScale); cdecl;
    function movieTimeScale: CMTimeScale; cdecl;
    function canAddInputGroup(inputGroup: AVAssetWriterInputGroup)
      : Boolean; cdecl;
    procedure addInputGroup(inputGroup: AVAssetWriterInputGroup); cdecl;
    function inputGroups: NSArray; cdecl;
    procedure setPreferredOutputSegmentInterval(preferredOutputSegmentInterval
      : CMTime); cdecl;
    function preferredOutputSegmentInterval: CMTime; cdecl;
    procedure setInitialSegmentStartTime(initialSegmentStartTime
      : CMTime); cdecl;
    function initialSegmentStartTime: CMTime; cdecl;
    procedure setOutputFileTypeProfile(outputFileTypeProfile
      : AVFileTypeProfile); cdecl;
    function outputFileTypeProfile: AVFileTypeProfile; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure flushSegment; cdecl;
  end;

  TAVAssetWriter = class(TOCGenericImport<AVAssetWriterClass, AVAssetWriter>)
  end;

  PAVAssetWriter = Pointer;

  AVAssetWriterInputGroupClass = interface(AVMediaSelectionGroupClass)
    ['{296C1993-3779-41E0-9F23-79D666492631}']
    { class } function assetWriterInputGroupWithInputs(inputs: NSArray;
      defaultInput: AVAssetWriterInput): Pointer { instancetype }; cdecl;
  end;

  AVAssetWriterInputGroup = interface(AVMediaSelectionGroup)
    ['{2C459CB8-8284-40D4-9C06-B421340C0274}']
    function initWithInputs(inputs: NSArray; defaultInput: AVAssetWriterInput)
      : Pointer { instancetype }; cdecl;
    function inputs: NSArray; cdecl;
    function defaultInput: AVAssetWriterInput; cdecl;
  end;

  TAVAssetWriterInputGroup = class
    (TOCGenericImport<AVAssetWriterInputGroupClass, AVAssetWriterInputGroup>)
  end;

  PAVAssetWriterInputGroup = Pointer;

  AVAssetWriterInputPassDescriptionClass = interface(NSObjectClass)
    ['{E4F136C5-9963-40E4-97A4-97998A6D601A}']
  end;

  AVAssetWriterInputPassDescription = interface(NSObject)
    ['{B05B4B28-95CF-47F0-9D44-A61B7D2D0792}']
    function sourceTimeRanges: NSArray; cdecl;
  end;

  TAVAssetWriterInputPassDescription = class
    (TOCGenericImport<AVAssetWriterInputPassDescriptionClass,
    AVAssetWriterInputPassDescription>)
  end;

  PAVAssetWriterInputPassDescription = Pointer;

  AVAssetWriterInputPixelBufferAdaptorClass = interface(NSObjectClass)
    ['{75B8FF84-D878-463A-875C-CCCF2E386445}']
    { class } function assetWriterInputPixelBufferAdaptorWithAssetWriterInput
      (input: AVAssetWriterInput; sourcePixelBufferAttributes: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  AVAssetWriterInputPixelBufferAdaptor = interface(NSObject)
    ['{CA56C523-FA84-4E06-B076-37B2E8BDF1EA}']
    function initWithAssetWriterInput(input: AVAssetWriterInput;
      sourcePixelBufferAttributes: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function assetWriterInput: AVAssetWriterInput; cdecl;
    function sourcePixelBufferAttributes: NSDictionary; cdecl;
    function pixelBufferPool: CVPixelBufferPoolRef; cdecl;
    function appendPixelBuffer(pixelBuffer: CVPixelBufferRef;
      withPresentationTime: CMTime): Boolean; cdecl;
  end;

  TAVAssetWriterInputPixelBufferAdaptor = class
    (TOCGenericImport<AVAssetWriterInputPixelBufferAdaptorClass,
    AVAssetWriterInputPixelBufferAdaptor>)
  end;

  PAVAssetWriterInputPixelBufferAdaptor = Pointer;

  AVAssetWriterInputMetadataAdaptorClass = interface(NSObjectClass)
    ['{6F576E33-0B8B-45B9-9B80-AB1C167866F1}']
    { class } function assetWriterInputMetadataAdaptorWithAssetWriterInput
      (input: AVAssetWriterInput): Pointer { instancetype }; cdecl;
  end;

  AVAssetWriterInputMetadataAdaptor = interface(NSObject)
    ['{65CB62F3-207A-4F6C-AAD1-54231D408D1F}']
    function initWithAssetWriterInput(input: AVAssetWriterInput)
      : Pointer { instancetype }; cdecl;
    function assetWriterInput: AVAssetWriterInput; cdecl;
    function appendTimedMetadataGroup(timedMetadataGroup: AVTimedMetadataGroup)
      : Boolean; cdecl;
  end;

  TAVAssetWriterInputMetadataAdaptor = class
    (TOCGenericImport<AVAssetWriterInputMetadataAdaptorClass,
    AVAssetWriterInputMetadataAdaptor>)
  end;

  PAVAssetWriterInputMetadataAdaptor = Pointer;

  AVAssetWriterInputCaptionAdaptorClass = interface(NSObjectClass)
    ['{408924B1-86BE-492A-A190-1FB02B8342A2}']
    { class } function assetWriterInputCaptionAdaptorWithAssetWriterInput
      (input: AVAssetWriterInput): Pointer { instancetype }; cdecl;
  end;

  AVAssetWriterInputCaptionAdaptor = interface(NSObject)
    ['{9A8DD017-8B49-4E0A-BB41-C8D4BFCEB159}']
    function initWithAssetWriterInput(input: AVAssetWriterInput)
      : Pointer { instancetype }; cdecl;
    function assetWriterInput: AVAssetWriterInput; cdecl;
    function appendCaption(caption: AVCaption): Boolean; cdecl;
    function appendCaptionGroup(captionGroup: AVCaptionGroup): Boolean; cdecl;
  end;

  TAVAssetWriterInputCaptionAdaptor = class
    (TOCGenericImport<AVAssetWriterInputCaptionAdaptorClass,
    AVAssetWriterInputCaptionAdaptor>)
  end;

  PAVAssetWriterInputCaptionAdaptor = Pointer;

  AVMutableAudioMixClass = interface(AVAudioMixClass)
    ['{ACA18DAC-46F1-45A9-9BFF-E06B9A86397E}']
    { class } function audioMix: Pointer { instancetype }; cdecl;
  end;

  AVMutableAudioMix = interface(AVAudioMix)
    ['{834AF861-12C9-4C68-B194-F29FDA0BBD13}']
    procedure setInputParameters(inputParameters: NSArray); cdecl;
    function inputParameters: NSArray; cdecl;
  end;

  TAVMutableAudioMix = class(TOCGenericImport<AVMutableAudioMixClass,
    AVMutableAudioMix>)
  end;

  PAVMutableAudioMix = Pointer;

  AVPlayerItemTrackClass = interface(NSObjectClass)
    ['{FF42C706-E39A-475C-8F59-24D7842414F7}']
  end;

  AVPlayerItemTrack = interface(NSObject)
    ['{5DD124B9-F112-4B13-8E79-817BA784D302}']
    function assetTrack: AVAssetTrack; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    function currentVideoFrameRate: Single; cdecl;
  end;

  TAVPlayerItemTrack = class(TOCGenericImport<AVPlayerItemTrackClass,
    AVPlayerItemTrack>)
  end;

  PAVPlayerItemTrack = Pointer;

  AVMutableAudioMixInputParametersClass = interface
    (AVAudioMixInputParametersClass)
    ['{6565E4CB-DA37-4D3B-B841-968410A8889F}']
    { class } function audioMixInputParametersWithTrack(track: AVAssetTrack)
      : Pointer { instancetype }; cdecl;
    { class } function audioMixInputParameters: Pointer { instancetype }; cdecl;
  end;

  AVMutableAudioMixInputParameters = interface(AVAudioMixInputParameters)
    ['{3D5D211D-0735-48AC-ACEB-0514BE7E3F93}']
    procedure setTrackID(trackID: CMPersistentTrackID); cdecl;
    function trackID: CMPersistentTrackID; cdecl;
    procedure setAudioTimePitchAlgorithm(audioTimePitchAlgorithm
      : AVAudioTimePitchAlgorithm); cdecl;
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
    procedure setAudioTapProcessor(audioTapProcessor
      : MTAudioProcessingTapRef); cdecl;
    function audioTapProcessor: MTAudioProcessingTapRef; cdecl;
    procedure setVolumeRampFromStartVolume(startVolume: Single;
      toEndVolume: Single; timeRange: CMTimeRange); cdecl;
    procedure setVolume(volume: Single; atTime: CMTime); cdecl;
  end;

  TAVMutableAudioMixInputParameters = class
    (TOCGenericImport<AVMutableAudioMixInputParametersClass,
    AVMutableAudioMixInputParameters>)
  end;

  PAVMutableAudioMixInputParameters = Pointer;

  AVCameraCalibrationDataClass = interface(NSObjectClass)
    ['{26DC613E-965C-4517-9795-021CF2E1DB34}']
  end;

  AVCameraCalibrationData = interface(NSObject)
    ['{E3E3F93B-FA57-4475-B742-7A2D566D3078}']
    function intrinsicMatrix: matrix_float3x3; cdecl;
    function intrinsicMatrixReferenceDimensions: CGSize; cdecl;
    function extrinsicMatrix: matrix_float4x3; cdecl;
    function pixelSize: Single; cdecl;
    function lensDistortionLookupTable: NSData; cdecl;
    function inverseLensDistortionLookupTable: NSData; cdecl;
    function lensDistortionCenter: CGPoint; cdecl;
  end;

  TAVCameraCalibrationData = class
    (TOCGenericImport<AVCameraCalibrationDataClass, AVCameraCalibrationData>)
  end;

  PAVCameraCalibrationData = Pointer;

  AVCaptureDeviceFormatClass = interface(NSObjectClass)
    ['{EDF83977-D05B-467B-95EF-96BE56E76CA1}']
  end;

  AVCaptureDeviceFormat = interface(NSObject)
    ['{2B1B2802-44F7-4097-B1DE-31095FDBD321}']
    function mediaType: AVMediaType; cdecl;
    function formatDescription: CMFormatDescriptionRef; cdecl;
    function videoSupportedFrameRateRanges: NSArray; cdecl;
    function videoFieldOfView: Single; cdecl;
    function isVideoBinned: Boolean; cdecl;
    function isVideoStabilizationModeSupported(videoStabilizationMode
      : AVCaptureVideoStabilizationMode): Boolean; cdecl;
    function isVideoStabilizationSupported: Boolean; cdecl;
    function videoMaxZoomFactor: CGFloat; cdecl;
    function videoZoomFactorUpscaleThreshold: CGFloat; cdecl;
    function minExposureDuration: CMTime; cdecl;
    function maxExposureDuration: CMTime; cdecl;
    function minISO: Single; cdecl;
    function maxISO: Single; cdecl;
    function isGlobalToneMappingSupported: Boolean; cdecl;
    function isVideoHDRSupported: Boolean; cdecl;
    function highResolutionStillImageDimensions: CMVideoDimensions; cdecl;
    function isHighPhotoQualitySupported: Boolean; cdecl;
    function isHighestPhotoQualitySupported: Boolean; cdecl;
    function autoFocusSystem: AVCaptureAutoFocusSystem; cdecl;
    function supportedColorSpaces: NSArray; cdecl;
    function videoMinZoomFactorForDepthDataDelivery: CGFloat; cdecl;
    function videoMaxZoomFactorForDepthDataDelivery: CGFloat; cdecl;
    function supportedVideoZoomFactorsForDepthDataDelivery: NSArray; cdecl;
    function supportedDepthDataFormats: NSArray; cdecl;
    function unsupportedCaptureOutputClasses: NSArray; cdecl;
    function supportedMaxPhotoDimensions: NSArray; cdecl;
    function secondaryNativeResolutionZoomFactors: NSArray; cdecl;
    function isPortraitEffectsMatteStillImageDeliverySupported: Boolean; cdecl;
    function isMultiCamSupported: Boolean; cdecl;
    function geometricDistortionCorrectedVideoFieldOfView: Single; cdecl;
    function isCenterStageSupported: Boolean; cdecl;
    function videoMinZoomFactorForCenterStage: CGFloat; cdecl;
    function videoMaxZoomFactorForCenterStage: CGFloat; cdecl;
    function videoFrameRateRangeForCenterStage: AVFrameRateRange; cdecl;
    function isPortraitEffectSupported: Boolean; cdecl;
    function videoFrameRateRangeForPortraitEffect: AVFrameRateRange; cdecl;
    function isStudioLightSupported: Boolean; cdecl;
    function videoFrameRateRangeForStudioLight: AVFrameRateRange; cdecl;
  end;

  TAVCaptureDeviceFormat = class(TOCGenericImport<AVCaptureDeviceFormatClass,
    AVCaptureDeviceFormat>)
  end;

  PAVCaptureDeviceFormat = Pointer;

  AVCaptureDeviceInputSourceClass = interface(NSObjectClass)
    ['{C9C9C614-976F-4DDB-927B-E7AAE8D86C82}']
  end;

  AVCaptureDeviceInputSource = interface(NSObject)
    ['{CB39AFC6-962B-4A8E-A13A-F66A06CE2102}']
    function inputSourceID: NSString; cdecl;
    function localizedName: NSString; cdecl;
  end;

  TAVCaptureDeviceInputSource = class
    (TOCGenericImport<AVCaptureDeviceInputSourceClass,
    AVCaptureDeviceInputSource>)
  end;

  PAVCaptureDeviceInputSource = Pointer;

  AVCaptureSystemPressureStateClass = interface(NSObjectClass)
    ['{F6E2E176-61F0-4573-8117-611091E49829}']
  end;

  AVCaptureSystemPressureState = interface(NSObject)
    ['{4317D9F0-3101-41BB-8233-C67798C5BF9A}']
    function level: AVCaptureSystemPressureLevel; cdecl;
    function factors: AVCaptureSystemPressureFactors; cdecl;
  end;

  TAVCaptureSystemPressureState = class
    (TOCGenericImport<AVCaptureSystemPressureStateClass,
    AVCaptureSystemPressureState>)
  end;

  PAVCaptureSystemPressureState = Pointer;

  AVCaptureDeviceClass = interface(NSObjectClass)
    ['{21F41308-49A3-4EB6-BDD7-45B912BC5C63}']
    { class } function devices: NSArray; cdecl;
    { class } function devicesWithMediaType(mediaType: AVMediaType)
      : NSArray; cdecl;
    { class } function defaultDeviceWithMediaType(mediaType: AVMediaType)
      : AVCaptureDevice; cdecl;
    { class } function deviceWithUniqueID(deviceUniqueID: NSString)
      : AVCaptureDevice; cdecl;
    { class } function defaultDeviceWithDeviceType
      (deviceType: AVCaptureDeviceType; mediaType: AVMediaType;
      position: AVCaptureDevicePosition): AVCaptureDevice; cdecl;
    { class } function authorizationStatusForMediaType(mediaType: AVMediaType)
      : AVAuthorizationStatus; cdecl;
    { class } procedure requestAccessForMediaType(mediaType: AVMediaType;
      completionHandler: TAVFoundationCompletionHandler6); cdecl;
    { class } function extrinsicMatrixFromDevice(fromDevice: AVCaptureDevice;
      toDevice: AVCaptureDevice): NSData; cdecl;
    { class } procedure showSystemUserInterface(systemUserInterface
      : AVCaptureSystemUserInterface); cdecl;
  end;

  AVCaptureDevice = interface(NSObject)
    ['{A3AEC8DD-8A46-4325-A20D-5155FF6C3A8B}']
    function uniqueID: NSString; cdecl;
    function modelID: NSString; cdecl;
    function localizedName: NSString; cdecl;
    function manufacturer: NSString; cdecl;
    function transportType: Int32; cdecl;
    function hasMediaType(mediaType: AVMediaType): Boolean; cdecl;
    function lockForConfiguration(outError: NSError): Boolean; cdecl;
    procedure unlockForConfiguration; cdecl;
    function supportsAVCaptureSessionPreset(preset: AVCaptureSessionPreset)
      : Boolean; cdecl;
    function isConnected: Boolean; cdecl;
    function isInUseByAnotherApplication: Boolean; cdecl;
    function isSuspended: Boolean; cdecl;
    function linkedDevices: NSArray; cdecl;
    function formats: NSArray; cdecl;
    procedure setActiveFormat(activeFormat: AVCaptureDeviceFormat); cdecl;
    function activeFormat: AVCaptureDeviceFormat; cdecl;
    procedure setActiveVideoMinFrameDuration(activeVideoMinFrameDuration
      : CMTime); cdecl;
    function activeVideoMinFrameDuration: CMTime; cdecl;
    procedure setActiveVideoMaxFrameDuration(activeVideoMaxFrameDuration
      : CMTime); cdecl;
    function activeVideoMaxFrameDuration: CMTime; cdecl;
    function inputSources: NSArray; cdecl;
    procedure setActiveInputSource(activeInputSource
      : AVCaptureDeviceInputSource); cdecl;
    function activeInputSource: AVCaptureDeviceInputSource; cdecl;
    function position: AVCaptureDevicePosition; cdecl;
    function deviceType: AVCaptureDeviceType; cdecl;
    procedure setUserPreferredCamera(userPreferredCamera
      : AVCaptureDevice); cdecl;
    function userPreferredCamera: AVCaptureDevice; cdecl;
    procedure setSystemPreferredCamera(systemPreferredCamera
      : AVCaptureDevice); cdecl;
    function systemPreferredCamera: AVCaptureDevice; cdecl;
    function systemPressureState: AVCaptureSystemPressureState; cdecl;
    function isVirtualDevice: Boolean; cdecl;
    function constituentDevices: NSArray; cdecl;
    function virtualDeviceSwitchOverVideoZoomFactors: NSArray; cdecl;
    procedure setPrimaryConstituentDeviceSwitchingBehavior(switchingBehavior
      : AVCapturePrimaryConstituentDeviceSwitchingBehavior;
      restrictedSwitchingBehaviorConditions
      : AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions);
      cdecl;
    function primaryConstituentDeviceSwitchingBehavior
      : AVCapturePrimaryConstituentDeviceSwitchingBehavior; cdecl;
    function primaryConstituentDeviceRestrictedSwitchingBehaviorConditions
      : AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions;
      cdecl;
    function activePrimaryConstituentDeviceSwitchingBehavior
      : AVCapturePrimaryConstituentDeviceSwitchingBehavior; cdecl;
    function activePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions
      : AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions;
      cdecl;
    function activePrimaryConstituentDevice: AVCaptureDevice; cdecl;
    function supportedFallbackPrimaryConstituentDevices: NSArray; cdecl;
    procedure setFallbackPrimaryConstituentDevices
      (fallbackPrimaryConstituentDevices: NSArray); cdecl;
    function fallbackPrimaryConstituentDevices: NSArray; cdecl;
    function hasFlash: Boolean; cdecl;
    function isFlashAvailable: Boolean; cdecl;
    function isFlashActive: Boolean; cdecl;
    function isFlashModeSupported(flashMode: AVCaptureFlashMode)
      : Boolean; cdecl;
    procedure setFlashMode(flashMode: AVCaptureFlashMode); cdecl;
    function flashMode: AVCaptureFlashMode; cdecl;
    function hasTorch: Boolean; cdecl;
    function isTorchAvailable: Boolean; cdecl;
    function isTorchActive: Boolean; cdecl;
    function torchLevel: Single; cdecl;
    function isTorchModeSupported(torchMode: AVCaptureTorchMode)
      : Boolean; cdecl;
    procedure setTorchMode(torchMode: AVCaptureTorchMode); cdecl;
    function torchMode: AVCaptureTorchMode; cdecl;
    function setTorchModeOnWithLevel(torchLevel: Single; error: NSError)
      : Boolean; cdecl;
    function isFocusModeSupported(focusMode: AVCaptureFocusMode)
      : Boolean; cdecl;
    function isLockingFocusWithCustomLensPositionSupported: Boolean; cdecl;
    procedure setFocusMode(focusMode: AVCaptureFocusMode); cdecl;
    function focusMode: AVCaptureFocusMode; cdecl;
    function isFocusPointOfInterestSupported: Boolean; cdecl;
    procedure setFocusPointOfInterest(focusPointOfInterest: CGPoint); cdecl;
    function focusPointOfInterest: CGPoint; cdecl;
    function isAdjustingFocus: Boolean; cdecl;
    function isAutoFocusRangeRestrictionSupported: Boolean; cdecl;
    procedure setAutoFocusRangeRestriction(autoFocusRangeRestriction
      : AVCaptureAutoFocusRangeRestriction); cdecl;
    function autoFocusRangeRestriction
      : AVCaptureAutoFocusRangeRestriction; cdecl;
    function isSmoothAutoFocusSupported: Boolean; cdecl;
    procedure setSmoothAutoFocusEnabled(smoothAutoFocusEnabled: Boolean); cdecl;
    function isSmoothAutoFocusEnabled: Boolean; cdecl;
    procedure setAutomaticallyAdjustsFaceDrivenAutoFocusEnabled
      (automaticallyAdjustsFaceDrivenAutoFocusEnabled: Boolean); cdecl;
    function automaticallyAdjustsFaceDrivenAutoFocusEnabled: Boolean; cdecl;
    procedure setFaceDrivenAutoFocusEnabled(faceDrivenAutoFocusEnabled
      : Boolean); cdecl;
    function isFaceDrivenAutoFocusEnabled: Boolean; cdecl;
    function lensPosition: Single; cdecl;
    procedure setFocusModeLockedWithLensPosition(lensPosition: Single;
      completionHandler: TAVFoundationCompletionHandler13); cdecl;
    function minimumFocusDistance: NSInteger; cdecl;
    function isExposureModeSupported(exposureMode: AVCaptureExposureMode)
      : Boolean; cdecl;
    procedure setExposureMode(exposureMode: AVCaptureExposureMode); cdecl;
    function exposureMode: AVCaptureExposureMode; cdecl;
    function isExposurePointOfInterestSupported: Boolean; cdecl;
    procedure setExposurePointOfInterest(exposurePointOfInterest
      : CGPoint); cdecl;
    function exposurePointOfInterest: CGPoint; cdecl;
    procedure setAutomaticallyAdjustsFaceDrivenAutoExposureEnabled
      (automaticallyAdjustsFaceDrivenAutoExposureEnabled: Boolean); cdecl;
    function automaticallyAdjustsFaceDrivenAutoExposureEnabled: Boolean; cdecl;
    procedure setFaceDrivenAutoExposureEnabled(faceDrivenAutoExposureEnabled
      : Boolean); cdecl;
    function isFaceDrivenAutoExposureEnabled: Boolean; cdecl;
    procedure setActiveMaxExposureDuration(activeMaxExposureDuration
      : CMTime); cdecl;
    function activeMaxExposureDuration: CMTime; cdecl;
    function isAdjustingExposure: Boolean; cdecl;
    function lensAperture: Single; cdecl;
    function exposureDuration: CMTime; cdecl;
    function ISO: Single; cdecl;
    procedure setExposureModeCustomWithDuration(duration: CMTime; ISO: Single;
      completionHandler: TAVFoundationCompletionHandler13); cdecl;
    function exposureTargetOffset: Single; cdecl;
    function exposureTargetBias: Single; cdecl;
    function minExposureTargetBias: Single; cdecl;
    function maxExposureTargetBias: Single; cdecl;
    procedure setExposureTargetBias(bias: Single;
      completionHandler: TAVFoundationCompletionHandler13); cdecl;
    procedure setGlobalToneMappingEnabled(globalToneMappingEnabled
      : Boolean); cdecl;
    function isGlobalToneMappingEnabled: Boolean; cdecl;
    function isWhiteBalanceModeSupported(whiteBalanceMode
      : AVCaptureWhiteBalanceMode): Boolean; cdecl;
    function isLockingWhiteBalanceWithCustomDeviceGainsSupported
      : Boolean; cdecl;
    procedure setWhiteBalanceMode(whiteBalanceMode
      : AVCaptureWhiteBalanceMode); cdecl;
    function whiteBalanceMode: AVCaptureWhiteBalanceMode; cdecl;
    function isAdjustingWhiteBalance: Boolean; cdecl;
    function deviceWhiteBalanceGains: AVCaptureWhiteBalanceGains; cdecl;
    function grayWorldDeviceWhiteBalanceGains
      : AVCaptureWhiteBalanceGains; cdecl;
    function maxWhiteBalanceGain: Single; cdecl;
    procedure setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains
      (whiteBalanceGains: AVCaptureWhiteBalanceGains;
      completionHandler: TAVFoundationCompletionHandler13); cdecl;
    function chromaticityValuesForDeviceWhiteBalanceGains(whiteBalanceGains
      : AVCaptureWhiteBalanceGains)
      : AVCaptureWhiteBalanceChromaticityValues; cdecl;
    function deviceWhiteBalanceGainsForChromaticityValues(chromaticityValues
      : AVCaptureWhiteBalanceChromaticityValues)
      : AVCaptureWhiteBalanceGains; cdecl;
    function temperatureAndTintValuesForDeviceWhiteBalanceGains
      (whiteBalanceGains: AVCaptureWhiteBalanceGains)
      : AVCaptureWhiteBalanceTemperatureAndTintValues; cdecl;
    function deviceWhiteBalanceGainsForTemperatureAndTintValues
      (tempAndTintValues: AVCaptureWhiteBalanceTemperatureAndTintValues)
      : AVCaptureWhiteBalanceGains; cdecl;
    procedure setSubjectAreaChangeMonitoringEnabled
      (subjectAreaChangeMonitoringEnabled: Boolean); cdecl;
    function isSubjectAreaChangeMonitoringEnabled: Boolean; cdecl;
    function isLowLightBoostSupported: Boolean; cdecl;
    function isLowLightBoostEnabled: Boolean; cdecl;
    procedure setAutomaticallyEnablesLowLightBoostWhenAvailable
      (automaticallyEnablesLowLightBoostWhenAvailable: Boolean); cdecl;
    function automaticallyEnablesLowLightBoostWhenAvailable: Boolean; cdecl;
    procedure setVideoZoomFactor(videoZoomFactor: CGFloat); cdecl;
    function videoZoomFactor: CGFloat; cdecl;
    procedure rampToVideoZoomFactor(factor: CGFloat; withRate: Single); cdecl;
    function isRampingVideoZoom: Boolean; cdecl;
    procedure cancelVideoZoomRamp; cdecl;
    function dualCameraSwitchOverVideoZoomFactor: CGFloat; cdecl;
    function transportControlsSupported: Boolean; cdecl;
    function transportControlsPlaybackMode
      : AVCaptureDeviceTransportControlsPlaybackMode; cdecl;
    function transportControlsSpeed
      : AVCaptureDeviceTransportControlsSpeed; cdecl;
    procedure setTransportControlsPlaybackMode
      (mode: AVCaptureDeviceTransportControlsPlaybackMode;
      speed: AVCaptureDeviceTransportControlsSpeed); cdecl;
    procedure setAutomaticallyAdjustsVideoHDREnabled
      (automaticallyAdjustsVideoHDREnabled: Boolean); cdecl;
    function automaticallyAdjustsVideoHDREnabled: Boolean; cdecl;
    procedure setVideoHDREnabled(videoHDREnabled: Boolean); cdecl;
    function isVideoHDREnabled: Boolean; cdecl;
    procedure setActiveColorSpace(activeColorSpace: AVCaptureColorSpace); cdecl;
    function activeColorSpace: AVCaptureColorSpace; cdecl;
    procedure setActiveDepthDataFormat(activeDepthDataFormat
      : AVCaptureDeviceFormat); cdecl;
    function activeDepthDataFormat: AVCaptureDeviceFormat; cdecl;
    procedure setActiveDepthDataMinFrameDuration(activeDepthDataMinFrameDuration
      : CMTime); cdecl;
    function activeDepthDataMinFrameDuration: CMTime; cdecl;
    function minAvailableVideoZoomFactor: CGFloat; cdecl;
    function maxAvailableVideoZoomFactor: CGFloat; cdecl;
    function isGeometricDistortionCorrectionSupported: Boolean; cdecl;
    procedure setGeometricDistortionCorrectionEnabled
      (geometricDistortionCorrectionEnabled: Boolean); cdecl;
    function isGeometricDistortionCorrectionEnabled: Boolean; cdecl;
    procedure setCenterStageControlMode(centerStageControlMode
      : AVCaptureCenterStageControlMode); cdecl;
    function centerStageControlMode: AVCaptureCenterStageControlMode; cdecl;
    procedure setCenterStageEnabled(centerStageEnabled: Boolean); cdecl;
    function centerStageEnabled: Boolean; cdecl;
    function isCenterStageActive: Boolean; cdecl;
    function isCenterStageRectOfInterestSupported: Boolean; cdecl;
    procedure setCenterStageRectOfInterest(centerStageRectOfInterest
      : CGRect); cdecl;
    function centerStageRectOfInterest: CGRect; cdecl;
    procedure setPortraitEffectEnabled(portraitEffectEnabled: Boolean); cdecl;
    function portraitEffectEnabled: Boolean; cdecl;
    function isPortraitEffectActive: Boolean; cdecl;
    function isContinuityCamera: Boolean; cdecl;
    function companionDeskViewCamera: AVCaptureDevice; cdecl;
    procedure setPreferredMicrophoneMode(preferredMicrophoneMode
      : AVCaptureMicrophoneMode); cdecl;
    function preferredMicrophoneMode: AVCaptureMicrophoneMode; cdecl;
    procedure setActiveMicrophoneMode(activeMicrophoneMode
      : AVCaptureMicrophoneMode); cdecl;
    function activeMicrophoneMode: AVCaptureMicrophoneMode; cdecl;
    procedure setStudioLightEnabled(studioLightEnabled: Boolean); cdecl;
    function studioLightEnabled: Boolean; cdecl;
    function isStudioLightActive: Boolean; cdecl;
  end;

  TAVCaptureDevice = class(TOCGenericImport<AVCaptureDeviceClass,
    AVCaptureDevice>)
  end;

  PAVCaptureDevice = Pointer;

  AVCaptureDeviceDiscoverySessionClass = interface(NSObjectClass)
    ['{F8AA097C-D150-47B4-8CC1-F4ACF07BA3C9}']
    { class } function discoverySessionWithDeviceTypes(deviceTypes: NSArray;
      mediaType: AVMediaType; position: AVCaptureDevicePosition)
      : Pointer { instancetype }; cdecl;
  end;

  AVCaptureDeviceDiscoverySession = interface(NSObject)
    ['{0D94AEAE-32E1-4FDA-B0B8-19A2B8B7696C}']
    function devices: NSArray; cdecl;
    function supportedMultiCamDeviceSets: NSArray; cdecl;
  end;

  TAVCaptureDeviceDiscoverySession = class
    (TOCGenericImport<AVCaptureDeviceDiscoverySessionClass,
    AVCaptureDeviceDiscoverySession>)
  end;

  PAVCaptureDeviceDiscoverySession = Pointer;

  AVFrameRateRangeClass = interface(NSObjectClass)
    ['{6D338BF2-9C20-412C-98B3-F29FCE3766AC}']
  end;

  AVFrameRateRange = interface(NSObject)
    ['{CF170EDE-28E1-4A4F-9022-53C5CD6AA79D}']
    function minFrameRate: Double; cdecl;
    function maxFrameRate: Double; cdecl;
    function maxFrameDuration: CMTime; cdecl;
    function minFrameDuration: CMTime; cdecl;
  end;

  TAVFrameRateRange = class(TOCGenericImport<AVFrameRateRangeClass,
    AVFrameRateRange>)
  end;

  PAVFrameRateRange = Pointer;

  AVCaptureOutputClass = interface(NSObjectClass)
    ['{133168E8-5236-45CA-AEAA-4363D4FED017}']
  end;

  AVCaptureOutput = interface(NSObject)
    ['{D71EC689-B370-4B56-A5EE-CE11D5251F26}']
    function connections: NSArray; cdecl;
    function connectionWithMediaType(mediaType: AVMediaType)
      : AVCaptureConnection; cdecl;
    function transformedMetadataObjectForMetadataObject(metadataObject
      : AVMetadataObject; connection: AVCaptureConnection)
      : AVMetadataObject; cdecl;
    function metadataOutputRectOfInterestForRect(rectInOutputCoordinates
      : CGRect): CGRect; cdecl;
    function rectForMetadataOutputRectOfInterest(rectInMetadataOutputCoordinates
      : CGRect): CGRect; cdecl;
  end;

  TAVCaptureOutput = class(TOCGenericImport<AVCaptureOutputClass,
    AVCaptureOutput>)
  end;

  PAVCaptureOutput = Pointer;

  AVCaptureInputClass = interface(NSObjectClass)
    ['{96089093-B00D-4A9C-B23A-8ECF6BA963CE}']
  end;

  AVCaptureInput = interface(NSObject)
    ['{598FEF70-0BC6-4402-99BE-C0736C4A324B}']
    function ports: NSArray; cdecl;
  end;

  TAVCaptureInput = class(TOCGenericImport<AVCaptureInputClass, AVCaptureInput>)
  end;

  PAVCaptureInput = Pointer;

  AVCaptureConnectionClass = interface(NSObjectClass)
    ['{4D687F48-7D18-453A-B9E8-694C7223B577}']
    { class } function connectionWithInputPorts(ports: NSArray;
      output: AVCaptureOutput): Pointer { instancetype }; cdecl;
    { class } function connectionWithInputPort(port: AVCaptureInputPort;
      videoPreviewLayer: AVCaptureVideoPreviewLayer)
      : Pointer { instancetype }; cdecl;
  end;

  AVCaptureConnection = interface(NSObject)
    ['{30EBDA25-894F-4DC1-8C25-32A57D68FD85}']
    function initWithInputPorts(ports: NSArray; output: AVCaptureOutput)
      : Pointer { instancetype }; cdecl;
    function initWithInputPort(port: AVCaptureInputPort;
      videoPreviewLayer: AVCaptureVideoPreviewLayer)
      : Pointer { instancetype }; cdecl;
    function inputPorts: NSArray; cdecl;
    function output: AVCaptureOutput; cdecl;
    function videoPreviewLayer: AVCaptureVideoPreviewLayer; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    function isActive: Boolean; cdecl;
    function audioChannels: NSArray; cdecl;
    function isVideoMirroringSupported: Boolean; cdecl;
    procedure setVideoMirrored(videoMirrored: Boolean); cdecl;
    function isVideoMirrored: Boolean; cdecl;
    procedure setAutomaticallyAdjustsVideoMirroring
      (automaticallyAdjustsVideoMirroring: Boolean); cdecl;
    function automaticallyAdjustsVideoMirroring: Boolean; cdecl;
    function isVideoOrientationSupported: Boolean; cdecl;
    procedure setVideoOrientation(videoOrientation
      : AVCaptureVideoOrientation); cdecl;
    function videoOrientation: AVCaptureVideoOrientation; cdecl;
    function isVideoFieldModeSupported: Boolean; cdecl;
    procedure setVideoFieldMode(videoFieldMode: AVVideoFieldMode); cdecl;
    function videoFieldMode: AVVideoFieldMode; cdecl;
    function isVideoMinFrameDurationSupported: Boolean; cdecl;
    procedure setVideoMinFrameDuration(videoMinFrameDuration: CMTime); cdecl;
    function videoMinFrameDuration: CMTime; cdecl;
    function isVideoMaxFrameDurationSupported: Boolean; cdecl;
    procedure setVideoMaxFrameDuration(videoMaxFrameDuration: CMTime); cdecl;
    function videoMaxFrameDuration: CMTime; cdecl;
    function videoMaxScaleAndCropFactor: CGFloat; cdecl;
    procedure setVideoScaleAndCropFactor(videoScaleAndCropFactor
      : CGFloat); cdecl;
    function videoScaleAndCropFactor: CGFloat; cdecl;
    procedure setPreferredVideoStabilizationMode(preferredVideoStabilizationMode
      : AVCaptureVideoStabilizationMode); cdecl;
    function preferredVideoStabilizationMode
      : AVCaptureVideoStabilizationMode; cdecl;
    function activeVideoStabilizationMode
      : AVCaptureVideoStabilizationMode; cdecl;
    function isVideoStabilizationSupported: Boolean; cdecl;
    function isVideoStabilizationEnabled: Boolean; cdecl;
    procedure setEnablesVideoStabilizationWhenAvailable
      (enablesVideoStabilizationWhenAvailable: Boolean); cdecl;
    function enablesVideoStabilizationWhenAvailable: Boolean; cdecl;
    function isCameraIntrinsicMatrixDeliverySupported: Boolean; cdecl;
    procedure setCameraIntrinsicMatrixDeliveryEnabled
      (cameraIntrinsicMatrixDeliveryEnabled: Boolean); cdecl;
    function isCameraIntrinsicMatrixDeliveryEnabled: Boolean; cdecl;
  end;

  TAVCaptureConnection = class(TOCGenericImport<AVCaptureConnectionClass,
    AVCaptureConnection>)
  end;

  PAVCaptureConnection = Pointer;

  AVCaptureSessionClass = interface(NSObjectClass)
    ['{E51BD2DD-9714-4A5D-86E6-78FE08CFAD38}']
  end;

  AVCaptureSession = interface(NSObject)
    ['{21F11C6E-EA0E-42D8-AF14-617ABE293573}']
    function canSetSessionPreset(preset: AVCaptureSessionPreset)
      : Boolean; cdecl;
    procedure setSessionPreset(sessionPreset: AVCaptureSessionPreset); cdecl;
    function sessionPreset: AVCaptureSessionPreset; cdecl;
    function inputs: NSArray; cdecl;
    function canAddInput(input: AVCaptureInput): Boolean; cdecl;
    procedure addInput(input: AVCaptureInput); cdecl;
    procedure removeInput(input: AVCaptureInput); cdecl;
    function outputs: NSArray; cdecl;
    function canAddOutput(output: AVCaptureOutput): Boolean; cdecl;
    procedure addOutput(output: AVCaptureOutput); cdecl;
    procedure removeOutput(output: AVCaptureOutput); cdecl;
    procedure addInputWithNoConnections(input: AVCaptureInput); cdecl;
    procedure addOutputWithNoConnections(output: AVCaptureOutput); cdecl;
    function connections: NSArray; cdecl;
    function canAddConnection(connection: AVCaptureConnection): Boolean; cdecl;
    procedure addConnection(connection: AVCaptureConnection); cdecl;
    procedure removeConnection(connection: AVCaptureConnection); cdecl;
    procedure beginConfiguration; cdecl;
    procedure commitConfiguration; cdecl;
    function isRunning: Boolean; cdecl;
    function isInterrupted: Boolean; cdecl;
    function isMultitaskingCameraAccessSupported: Boolean; cdecl;
    procedure setMultitaskingCameraAccessEnabled(multitaskingCameraAccessEnabled
      : Boolean); cdecl;
    function isMultitaskingCameraAccessEnabled: Boolean; cdecl;
    procedure setUsesApplicationAudioSession(usesApplicationAudioSession
      : Boolean); cdecl;
    function usesApplicationAudioSession: Boolean; cdecl;
    procedure setAutomaticallyConfiguresApplicationAudioSession
      (automaticallyConfiguresApplicationAudioSession: Boolean); cdecl;
    function automaticallyConfiguresApplicationAudioSession: Boolean; cdecl;
    procedure setAutomaticallyConfiguresCaptureDeviceForWideColor
      (automaticallyConfiguresCaptureDeviceForWideColor: Boolean); cdecl;
    function automaticallyConfiguresCaptureDeviceForWideColor: Boolean; cdecl;
    procedure startRunning; cdecl;
    procedure stopRunning; cdecl;
    function synchronizationClock: CMClockRef; cdecl;
    function masterClock: CMClockRef; cdecl;
    function hardwareCost: Single; cdecl;
  end;

  TAVCaptureSession = class(TOCGenericImport<AVCaptureSessionClass,
    AVCaptureSession>)
  end;

  PAVCaptureSession = Pointer;

  AVCaptureMultiCamSessionClass = interface(AVCaptureSessionClass)
    ['{1C2954E8-6422-4D31-8DB5-490C93ABF5C7}']
  end;

  AVCaptureMultiCamSession = interface(AVCaptureSession)
    ['{EE35DEAA-8E20-4A5B-9317-5BBC4A6562A7}']
    procedure setMultiCamSupported(multiCamSupported: Boolean); cdecl;
    function multiCamSupported: Boolean; cdecl;
    function hardwareCost: Single; cdecl;
    function systemPressureCost: Single; cdecl;
  end;

  TAVCaptureMultiCamSession = class
    (TOCGenericImport<AVCaptureMultiCamSessionClass, AVCaptureMultiCamSession>)
  end;

  PAVCaptureMultiCamSession = Pointer;

  AVCaptureAudioChannelClass = interface(NSObjectClass)
    ['{0F4A15E6-FB70-452A-8BAC-C46FE979A197}']
  end;

  AVCaptureAudioChannel = interface(NSObject)
    ['{CF4E0CBD-AB9D-4D1E-BC94-50B0E4DF07CC}']
    function averagePowerLevel: Single; cdecl;
    function peakHoldLevel: Single; cdecl;
    procedure setVolume(volume: Single); cdecl;
    function volume: Single; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
  end;

  TAVCaptureAudioChannel = class(TOCGenericImport<AVCaptureAudioChannelClass,
    AVCaptureAudioChannel>)
  end;

  PAVCaptureAudioChannel = Pointer;

  AVCaptureVideoPreviewLayerClass = interface(CALayerClass)
    ['{6238EB61-AA1B-44ED-A936-29C7207924B3}']
    { class } function layerWithSession(session: AVCaptureSession)
      : Pointer { instancetype }; cdecl;
    { class } function layerWithSessionWithNoConnection
      (session: AVCaptureSession): Pointer { instancetype }; cdecl;
  end;

  AVCaptureVideoPreviewLayer = interface(CALayer)
    ['{756C7EC5-8394-488D-9350-A6B515C48DFC}']
    function initWithSession(session: AVCaptureSession)
      : Pointer { instancetype }; cdecl;
    function initWithSessionWithNoConnection(session: AVCaptureSession)
      : Pointer { instancetype }; cdecl;
    procedure setSession(session: AVCaptureSession); cdecl;
    function session: AVCaptureSession; cdecl;
    procedure setSessionWithNoConnection(session: AVCaptureSession); cdecl;
    function connection: AVCaptureConnection; cdecl;
    procedure setVideoGravity(videoGravity: AVLayerVideoGravity); cdecl;
    function videoGravity: AVLayerVideoGravity; cdecl;
    function isPreviewing: Boolean; cdecl;
    function captureDevicePointOfInterestForPoint(pointInLayer: CGPoint)
      : CGPoint; cdecl;
    function pointForCaptureDevicePointOfInterest(captureDevicePointOfInterest
      : CGPoint): CGPoint; cdecl;
    function metadataOutputRectOfInterestForRect(rectInLayerCoordinates: CGRect)
      : CGRect; cdecl;
    function rectForMetadataOutputRectOfInterest(rectInMetadataOutputCoordinates
      : CGRect): CGRect; cdecl;
    function transformedMetadataObjectForMetadataObject(metadataObject
      : AVMetadataObject): AVMetadataObject; cdecl;
    function isOrientationSupported: Boolean; cdecl;
    procedure setOrientation(orientation: AVCaptureVideoOrientation); cdecl;
    function orientation: AVCaptureVideoOrientation; cdecl;
    function isMirroringSupported: Boolean; cdecl;
    procedure setAutomaticallyAdjustsMirroring(automaticallyAdjustsMirroring
      : Boolean); cdecl;
    function automaticallyAdjustsMirroring: Boolean; cdecl;
    procedure setMirrored(mirrored: Boolean); cdecl;
    function isMirrored: Boolean; cdecl;
  end;

  TAVCaptureVideoPreviewLayer = class
    (TOCGenericImport<AVCaptureVideoPreviewLayerClass,
    AVCaptureVideoPreviewLayer>)
  end;

  PAVCaptureVideoPreviewLayer = Pointer;

  AVCaptureInputPortClass = interface(NSObjectClass)
    ['{4FE15270-B6FD-4E37-AF02-EDE501CE8A8F}']
  end;

  AVCaptureInputPort = interface(NSObject)
    ['{985AA945-9E31-40E5-8205-2B94D4F9A7C5}']
    function input: AVCaptureInput; cdecl;
    function mediaType: AVMediaType; cdecl;
    function formatDescription: CMFormatDescriptionRef; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    function clock: CMClockRef; cdecl;
    function sourceDeviceType: AVCaptureDeviceType; cdecl;
    function sourceDevicePosition: AVCaptureDevicePosition; cdecl;
  end;

  TAVCaptureInputPort = class(TOCGenericImport<AVCaptureInputPortClass,
    AVCaptureInputPort>)
  end;

  PAVCaptureInputPort = Pointer;

  AVMetadataObjectClass = interface(NSObjectClass)
    ['{375339E4-D84E-4317-8214-BCC23AB907EC}']
  end;

  AVMetadataObject = interface(NSObject)
    ['{2941F0F9-B983-458B-8C97-8D69054374EB}']
    function time: CMTime; cdecl;
    function duration: CMTime; cdecl;
    function bounds: CGRect; cdecl;
    function &type: AVMetadataObjectType; cdecl;
  end;

  TAVMetadataObject = class(TOCGenericImport<AVMetadataObjectClass,
    AVMetadataObject>)
  end;

  PAVMetadataObject = Pointer;

  AVCaptureAudioDataOutputClass = interface(AVCaptureOutputClass)
    ['{287B07ED-961B-4C32-89BB-3376FF0CD3E6}']
  end;

  AVCaptureAudioDataOutput = interface(AVCaptureOutput)
    ['{7117020F-0D66-4D36-B3C0-D53B00BFD20E}']
    procedure setSampleBufferDelegate(sampleBufferDelegate: Pointer;
      queue: dispatch_queue_t); cdecl;
    function sampleBufferDelegate: Pointer; cdecl;
    function sampleBufferCallbackQueue: dispatch_queue_t; cdecl;
    procedure setAudioSettings(audioSettings: NSDictionary); cdecl;
    function audioSettings: NSDictionary; cdecl;
    function recommendedAudioSettingsForAssetWriterWithOutputFileType
      (outputFileType: AVFileType): NSDictionary; cdecl;
  end;

  TAVCaptureAudioDataOutput = class
    (TOCGenericImport<AVCaptureAudioDataOutputClass, AVCaptureAudioDataOutput>)
  end;

  PAVCaptureAudioDataOutput = Pointer;

  AVCaptureAudioPreviewOutputClass = interface(AVCaptureOutputClass)
    ['{76568275-0544-4A86-BFD9-FB88084FCAB5}']
  end;

  AVCaptureAudioPreviewOutput = interface(AVCaptureOutput)
    ['{2B16913E-754E-471C-9C80-C74241DF5FCA}']
    procedure setOutputDeviceUniqueID(outputDeviceUniqueID: NSString); cdecl;
    function outputDeviceUniqueID: NSString; cdecl;
    procedure setVolume(volume: Single); cdecl;
    function volume: Single; cdecl;
  end;

  TAVCaptureAudioPreviewOutput = class
    (TOCGenericImport<AVCaptureAudioPreviewOutputClass,
    AVCaptureAudioPreviewOutput>)
  end;

  PAVCaptureAudioPreviewOutput = Pointer;

  AVDepthDataClass = interface(NSObjectClass)
    ['{CA6688F9-C10B-49E0-8B85-81F73E3C53C9}']
    { class } function depthDataFromDictionaryRepresentation
      (imageSourceAuxDataInfoDictionary: NSDictionary; error: NSError)
      : Pointer { instancetype }; cdecl;
  end;

  AVDepthData = interface(NSObject)
    ['{08411FE6-8AFF-4AB9-B69B-2B37C8C1F416}']
    function depthDataByConvertingToDepthDataType(depthDataType: OSType)
      : Pointer { instancetype }; cdecl;
    function depthDataByApplyingExifOrientation(exifOrientation
      : CGImagePropertyOrientation): Pointer { instancetype }; cdecl;
    function depthDataByReplacingDepthDataMapWithPixelBuffer
      (pixelBuffer: CVPixelBufferRef; error: NSError)
      : Pointer { instancetype }; cdecl;
    function availableDepthDataTypes: NSArray; cdecl;
    function dictionaryRepresentationForAuxiliaryDataType(outAuxDataType
      : NSString): NSDictionary; cdecl;
    function depthDataType: OSType; cdecl;
    function depthDataMap: CVPixelBufferRef; cdecl;
    function depthDataQuality: AVDepthDataQuality; cdecl;
    function isDepthDataFiltered: Boolean; cdecl;
    function depthDataAccuracy: AVDepthDataAccuracy; cdecl;
    function cameraCalibrationData: AVCameraCalibrationData; cdecl;
  end;

  TAVDepthData = class(TOCGenericImport<AVDepthDataClass, AVDepthData>)
  end;

  PAVDepthData = Pointer;

  AVCaptureDepthDataOutputClass = interface(AVCaptureOutputClass)
    ['{6E7A7399-9BEA-49F1-B5A4-7A5247B9B28C}']
  end;

  AVCaptureDepthDataOutput = interface(AVCaptureOutput)
    ['{D620113D-6506-436E-82CD-0A41FC36BE9D}']
    procedure setDelegate(delegate: Pointer;
      callbackQueue: dispatch_queue_t); cdecl;
    function delegate: Pointer; cdecl;
    function delegateCallbackQueue: dispatch_queue_t; cdecl;
    procedure setAlwaysDiscardsLateDepthData(alwaysDiscardsLateDepthData
      : Boolean); cdecl;
    function alwaysDiscardsLateDepthData: Boolean; cdecl;
    procedure setFilteringEnabled(filteringEnabled: Boolean); cdecl;
    function isFilteringEnabled: Boolean; cdecl;
  end;

  TAVCaptureDepthDataOutput = class
    (TOCGenericImport<AVCaptureDepthDataOutputClass, AVCaptureDepthDataOutput>)
  end;

  PAVCaptureDepthDataOutput = Pointer;

  AVCaptureFileOutputClass = interface(AVCaptureOutputClass)
    ['{0C477E81-CD47-43B2-BFCC-BD8BC5D7A60D}']
  end;

  AVCaptureFileOutput = interface(AVCaptureOutput)
    ['{E4C50C98-58EA-4056-91E4-1B3AA02F4F9B}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function outputFileURL: NSURL; cdecl;
    procedure startRecordingToOutputFileURL(outputFileURL: NSURL;
      recordingDelegate: Pointer); cdecl;
    procedure stopRecording; cdecl;
    function isRecording: Boolean; cdecl;
    function isRecordingPaused: Boolean; cdecl;
    procedure pauseRecording; cdecl;
    procedure resumeRecording; cdecl;
    function recordedDuration: CMTime; cdecl;
    function recordedFileSize: Int64; cdecl;
    procedure setMaxRecordedDuration(maxRecordedDuration: CMTime); cdecl;
    function maxRecordedDuration: CMTime; cdecl;
    procedure setMaxRecordedFileSize(maxRecordedFileSize: Int64); cdecl;
    function maxRecordedFileSize: Int64; cdecl;
    procedure setMinFreeDiskSpaceLimit(minFreeDiskSpaceLimit: Int64); cdecl;
    function minFreeDiskSpaceLimit: Int64; cdecl;
  end;

  TAVCaptureFileOutput = class(TOCGenericImport<AVCaptureFileOutputClass,
    AVCaptureFileOutput>)
  end;

  PAVCaptureFileOutput = Pointer;

  AVCaptureMovieFileOutputClass = interface(AVCaptureFileOutputClass)
    ['{68DDAAA3-E926-4217-A8EB-9EF534E80937}']
  end;

  AVCaptureMovieFileOutput = interface(AVCaptureFileOutput)
    ['{FA9E864C-CCE4-4DCC-8F62-4474754C6A4E}']
    procedure setMovieFragmentInterval(movieFragmentInterval: CMTime); cdecl;
    function movieFragmentInterval: CMTime; cdecl;
    procedure setMetadata(metadata: NSArray); cdecl;
    function metadata: NSArray; cdecl;
    function availableVideoCodecTypes: NSArray; cdecl;
    function supportedOutputSettingsKeysForConnection
      (connection: AVCaptureConnection): NSArray; cdecl;
    function outputSettingsForConnection(connection: AVCaptureConnection)
      : NSDictionary; cdecl;
    procedure setOutputSettings(outputSettings: NSDictionary;
      forConnection: AVCaptureConnection); cdecl;
    function recordsVideoOrientationAndMirroringChangesAsMetadataTrackForConnection
      (connection: AVCaptureConnection): Boolean; cdecl;
    procedure setRecordsVideoOrientationAndMirroringChanges(doRecordChanges
      : Boolean; asMetadataTrackForConnection: AVCaptureConnection); cdecl;
    procedure setPrimaryConstituentDeviceSwitchingBehaviorForRecordingEnabled
      (primaryConstituentDeviceSwitchingBehaviorForRecordingEnabled
      : Boolean); cdecl;
    function isPrimaryConstituentDeviceSwitchingBehaviorForRecordingEnabled
      : Boolean; cdecl;
    procedure setPrimaryConstituentDeviceSwitchingBehaviorForRecording
      (switchingBehavior: AVCapturePrimaryConstituentDeviceSwitchingBehavior;
      restrictedSwitchingBehaviorConditions
      : AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions);
      cdecl;
    function primaryConstituentDeviceSwitchingBehaviorForRecording
      : AVCapturePrimaryConstituentDeviceSwitchingBehavior; cdecl;
    function primaryConstituentDeviceRestrictedSwitchingBehaviorConditionsForRecording
      : AVCapturePrimaryConstituentDeviceRestrictedSwitchingBehaviorConditions;
      cdecl;
  end;

  TAVCaptureMovieFileOutput = class
    (TOCGenericImport<AVCaptureMovieFileOutputClass, AVCaptureMovieFileOutput>)
  end;

  PAVCaptureMovieFileOutput = Pointer;

  AVCaptureAudioFileOutputClass = interface(AVCaptureFileOutputClass)
    ['{489CE9D1-3510-47A5-877B-0CA6E99E2D07}']
    { class } function availableOutputFileTypes: NSArray; cdecl;
  end;

  AVCaptureAudioFileOutput = interface(AVCaptureFileOutput)
    ['{DB9ECBE2-41A5-4F72-8299-D1FF568F1799}']
    procedure startRecordingToOutputFileURL(outputFileURL: NSURL;
      outputFileType: AVFileType; recordingDelegate: Pointer); cdecl;
    procedure setMetadata(metadata: NSArray); cdecl;
    function metadata: NSArray; cdecl;
    procedure setAudioSettings(audioSettings: NSDictionary); cdecl;
    function audioSettings: NSDictionary; cdecl;
  end;

  TAVCaptureAudioFileOutput = class
    (TOCGenericImport<AVCaptureAudioFileOutputClass, AVCaptureAudioFileOutput>)
  end;

  PAVCaptureAudioFileOutput = Pointer;

  AVMetadataBodyObjectClass = interface(AVMetadataObjectClass)
    ['{BFB8566C-2EC8-41CF-96D2-4AD13A008EE8}']
  end;

  AVMetadataBodyObject = interface(AVMetadataObject)
    ['{63B97493-08D9-4155-883E-ACB94490A3C4}']
    function bodyID: NSInteger; cdecl;
  end;

  TAVMetadataBodyObject = class(TOCGenericImport<AVMetadataBodyObjectClass,
    AVMetadataBodyObject>)
  end;

  PAVMetadataBodyObject = Pointer;

  AVMetadataHumanBodyObjectClass = interface(AVMetadataBodyObjectClass)
    ['{2AF488C5-5EBC-4F40-BB13-9631F4C5F07A}']
  end;

  AVMetadataHumanBodyObject = interface(AVMetadataBodyObject)
    ['{67ECA11E-E3EE-4028-99FE-DCB403D4723B}']
  end;

  TAVMetadataHumanBodyObject = class
    (TOCGenericImport<AVMetadataHumanBodyObjectClass,
    AVMetadataHumanBodyObject>)
  end;

  PAVMetadataHumanBodyObject = Pointer;

  AVMetadataCatBodyObjectClass = interface(AVMetadataBodyObjectClass)
    ['{231E1B45-370B-479B-98FA-F0AB8A61062D}']
  end;

  AVMetadataCatBodyObject = interface(AVMetadataBodyObject)
    ['{2B52D9FF-48AD-4559-A418-1887A72C91B6}']
  end;

  TAVMetadataCatBodyObject = class
    (TOCGenericImport<AVMetadataCatBodyObjectClass, AVMetadataCatBodyObject>)
  end;

  PAVMetadataCatBodyObject = Pointer;

  AVMetadataDogBodyObjectClass = interface(AVMetadataBodyObjectClass)
    ['{63F4D209-F610-4FDB-9808-166549934012}']
  end;

  AVMetadataDogBodyObject = interface(AVMetadataBodyObject)
    ['{7736D038-8E52-4FD7-A0AD-A1A2969A3FAF}']
  end;

  TAVMetadataDogBodyObject = class
    (TOCGenericImport<AVMetadataDogBodyObjectClass, AVMetadataDogBodyObject>)
  end;

  PAVMetadataDogBodyObject = Pointer;

  AVMetadataSalientObjectClass = interface(AVMetadataObjectClass)
    ['{D80B07B2-1E2A-41FB-8FEE-5A2021856C2D}']
  end;

  AVMetadataSalientObject = interface(AVMetadataObject)
    ['{D9741B03-54E3-436C-AC8A-0FC0A28CC8E2}']
    function objectID: NSInteger; cdecl;
  end;

  TAVMetadataSalientObject = class
    (TOCGenericImport<AVMetadataSalientObjectClass, AVMetadataSalientObject>)
  end;

  PAVMetadataSalientObject = Pointer;

  AVMetadataFaceObjectClass = interface(AVMetadataObjectClass)
    ['{6C87FB08-6CB7-4C15-AB55-7968F038DD12}']
  end;

  AVMetadataFaceObject = interface(AVMetadataObject)
    ['{0F7CC2E2-B8CE-49D5-A088-92B501924CA5}']
    function faceID: NSInteger; cdecl;
    function hasRollAngle: Boolean; cdecl;
    function rollAngle: CGFloat; cdecl;
    function hasYawAngle: Boolean; cdecl;
    function yawAngle: CGFloat; cdecl;
  end;

  TAVMetadataFaceObject = class(TOCGenericImport<AVMetadataFaceObjectClass,
    AVMetadataFaceObject>)
  end;

  PAVMetadataFaceObject = Pointer;

  AVMetadataMachineReadableCodeObjectClass = interface(AVMetadataObjectClass)
    ['{0E5CBCBA-D608-45CC-AF26-5D716EBF9292}']
  end;

  AVMetadataMachineReadableCodeObject = interface(AVMetadataObject)
    ['{8BCD2AB0-AF75-48E4-83FC-B720FBA66EBE}']
    function corners: NSArray; cdecl;
    function stringValue: NSString; cdecl;
    function descriptor: CIBarcodeDescriptor; cdecl;
  end;

  TAVMetadataMachineReadableCodeObject = class
    (TOCGenericImport<AVMetadataMachineReadableCodeObjectClass,
    AVMetadataMachineReadableCodeObject>)
  end;

  PAVMetadataMachineReadableCodeObject = Pointer;

  AVCaptureMetadataOutputClass = interface(AVCaptureOutputClass)
    ['{38D5BBBF-10EC-488A-8024-2346CB365B12}']
  end;

  AVCaptureMetadataOutput = interface(AVCaptureOutput)
    ['{701363D7-4A6B-415F-A19C-6E0F96A0B927}']
    procedure setMetadataObjectsDelegate(objectsDelegate: Pointer;
      queue: dispatch_queue_t); cdecl;
    function metadataObjectsDelegate: Pointer; cdecl;
    function metadataObjectsCallbackQueue: dispatch_queue_t; cdecl;
    function availableMetadataObjectTypes: NSArray; cdecl;
    procedure setMetadataObjectTypes(metadataObjectTypes: NSArray); cdecl;
    function metadataObjectTypes: NSArray; cdecl;
    procedure setRectOfInterest(rectOfInterest: CGRect); cdecl;
    function rectOfInterest: CGRect; cdecl;
  end;

  TAVCaptureMetadataOutput = class
    (TOCGenericImport<AVCaptureMetadataOutputClass, AVCaptureMetadataOutput>)
  end;

  PAVCaptureMetadataOutput = Pointer;

  AVSemanticSegmentationMatteClass = interface(NSObjectClass)
    ['{5B68405E-AFFE-4234-AEB8-120213EA60A2}']
    { class } function semanticSegmentationMatteFromImageSourceAuxiliaryDataType
      (imageSourceAuxiliaryDataType: CFStringRef;
      dictionaryRepresentation: NSDictionary; error: NSError)
      : Pointer { instancetype }; cdecl;
  end;

  AVSemanticSegmentationMatte = interface(NSObject)
    ['{0C0B808A-5C12-435D-B7F4-9B7DA99D105D}']
    function matteType: AVSemanticSegmentationMatteType; cdecl;
    function semanticSegmentationMatteByApplyingExifOrientation(exifOrientation
      : CGImagePropertyOrientation): Pointer { instancetype }; cdecl;
    function semanticSegmentationMatteByReplacingSemanticSegmentationMatteWithPixelBuffer
      (pixelBuffer: CVPixelBufferRef; error: NSError)
      : Pointer { instancetype }; cdecl;
    function dictionaryRepresentationForAuxiliaryDataType(outAuxDataType
      : NSString): NSDictionary; cdecl;
    function pixelFormatType: OSType; cdecl;
    function mattingImage: CVPixelBufferRef; cdecl;
  end;

  TAVSemanticSegmentationMatte = class
    (TOCGenericImport<AVSemanticSegmentationMatteClass,
    AVSemanticSegmentationMatte>)
  end;

  PAVSemanticSegmentationMatte = Pointer;

  AVCapturePhotoSettingsClass = interface(NSObjectClass)
    ['{1A822B4A-728C-42AA-9F5D-5BF8F2A2843F}']
    { class } function photoSettings: Pointer { instancetype }; cdecl;
    { class } function photoSettingsWithFormat(format: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('photoSettingsWithRawPixelFormatType:')]
    { class } function photoSettingsWithRawPixelFormatType(rawPixelFormatType
      : OSType): Pointer { instancetype }; cdecl;
    [MethodName('photoSettingsWithRawPixelFormatType:processedFormat:')]
    { class } function photoSettingsWithRawPixelFormatTypeProcessedFormat
      (rawPixelFormatType: OSType; processedFormat: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('photoSettingsWithRawPixelFormatType:rawFileType:processedFormat:processedFileType:')
      ]
    { class } function
      photoSettingsWithRawPixelFormatTypeRawFileTypeProcessedFormatProcessedFileType
      (rawPixelFormatType: OSType; rawFileType: AVFileType;
      processedFormat: NSDictionary; processedFileType: AVFileType)
      : Pointer { instancetype }; cdecl;
    { class } function photoSettingsFromPhotoSettings(photoSettings
      : AVCapturePhotoSettings): Pointer { instancetype }; cdecl;
  end;

  AVCapturePhotoSettings = interface(NSObject)
    ['{EE069238-41C9-4E57-A49F-F57793B21FF0}']
    function uniqueID: Int64; cdecl;
    function format: NSDictionary; cdecl;
    function processedFileType: AVFileType; cdecl;
    function rawPhotoPixelFormatType: OSType; cdecl;
    function rawFileType: AVFileType; cdecl;
    procedure setFlashMode(flashMode: AVCaptureFlashMode); cdecl;
    function flashMode: AVCaptureFlashMode; cdecl;
    procedure setAutoRedEyeReductionEnabled(autoRedEyeReductionEnabled
      : Boolean); cdecl;
    function isAutoRedEyeReductionEnabled: Boolean; cdecl;
    procedure setPhotoQualityPrioritization(photoQualityPrioritization
      : AVCapturePhotoQualityPrioritization); cdecl;
    function photoQualityPrioritization
      : AVCapturePhotoQualityPrioritization; cdecl;
    procedure setAutoStillImageStabilizationEnabled
      (autoStillImageStabilizationEnabled: Boolean); cdecl;
    function isAutoStillImageStabilizationEnabled: Boolean; cdecl;
    procedure setAutoVirtualDeviceFusionEnabled(autoVirtualDeviceFusionEnabled
      : Boolean); cdecl;
    function isAutoVirtualDeviceFusionEnabled: Boolean; cdecl;
    procedure setAutoDualCameraFusionEnabled(autoDualCameraFusionEnabled
      : Boolean); cdecl;
    function isAutoDualCameraFusionEnabled: Boolean; cdecl;
    procedure setVirtualDeviceConstituentPhotoDeliveryEnabledDevices
      (virtualDeviceConstituentPhotoDeliveryEnabledDevices: NSArray); cdecl;
    function virtualDeviceConstituentPhotoDeliveryEnabledDevices
      : NSArray; cdecl;
    procedure setDualCameraDualPhotoDeliveryEnabled
      (dualCameraDualPhotoDeliveryEnabled: Boolean); cdecl;
    function isDualCameraDualPhotoDeliveryEnabled: Boolean; cdecl;
    procedure setHighResolutionPhotoEnabled(highResolutionPhotoEnabled
      : Boolean); cdecl;
    function isHighResolutionPhotoEnabled: Boolean; cdecl;
    procedure setMaxPhotoDimensions(maxPhotoDimensions
      : CMVideoDimensions); cdecl;
    function maxPhotoDimensions: CMVideoDimensions; cdecl;
    procedure setDepthDataDeliveryEnabled(depthDataDeliveryEnabled
      : Boolean); cdecl;
    function isDepthDataDeliveryEnabled: Boolean; cdecl;
    procedure setEmbedsDepthDataInPhoto(embedsDepthDataInPhoto: Boolean); cdecl;
    function embedsDepthDataInPhoto: Boolean; cdecl;
    procedure setDepthDataFiltered(depthDataFiltered: Boolean); cdecl;
    function isDepthDataFiltered: Boolean; cdecl;
    procedure setCameraCalibrationDataDeliveryEnabled
      (cameraCalibrationDataDeliveryEnabled: Boolean); cdecl;
    function isCameraCalibrationDataDeliveryEnabled: Boolean; cdecl;
    procedure setPortraitEffectsMatteDeliveryEnabled
      (portraitEffectsMatteDeliveryEnabled: Boolean); cdecl;
    function isPortraitEffectsMatteDeliveryEnabled: Boolean; cdecl;
    procedure setEmbedsPortraitEffectsMatteInPhoto
      (embedsPortraitEffectsMatteInPhoto: Boolean); cdecl;
    function embedsPortraitEffectsMatteInPhoto: Boolean; cdecl;
    procedure setEnabledSemanticSegmentationMatteTypes
      (enabledSemanticSegmentationMatteTypes: NSArray); cdecl;
    function enabledSemanticSegmentationMatteTypes: NSArray; cdecl;
    procedure setEmbedsSemanticSegmentationMattesInPhoto
      (embedsSemanticSegmentationMattesInPhoto: Boolean); cdecl;
    function embedsSemanticSegmentationMattesInPhoto: Boolean; cdecl;
    procedure setMetadata(metadata: NSDictionary); cdecl;
    function metadata: NSDictionary; cdecl;
    procedure setLivePhotoMovieFileURL(livePhotoMovieFileURL: NSURL); cdecl;
    function livePhotoMovieFileURL: NSURL; cdecl;
    procedure setLivePhotoVideoCodecType(livePhotoVideoCodecType
      : AVVideoCodecType); cdecl;
    function livePhotoVideoCodecType: AVVideoCodecType; cdecl;
    procedure setLivePhotoMovieMetadata(livePhotoMovieMetadata: NSArray); cdecl;
    function livePhotoMovieMetadata: NSArray; cdecl;
    function availablePreviewPhotoPixelFormatTypes: NSArray; cdecl;
    procedure setPreviewPhotoFormat(previewPhotoFormat: NSDictionary); cdecl;
    function previewPhotoFormat: NSDictionary; cdecl;
    function availableEmbeddedThumbnailPhotoCodecTypes: NSArray; cdecl;
    procedure setEmbeddedThumbnailPhotoFormat(embeddedThumbnailPhotoFormat
      : NSDictionary); cdecl;
    function embeddedThumbnailPhotoFormat: NSDictionary; cdecl;
    function availableRawEmbeddedThumbnailPhotoCodecTypes: NSArray; cdecl;
    procedure setRawEmbeddedThumbnailPhotoFormat(rawEmbeddedThumbnailPhotoFormat
      : NSDictionary); cdecl;
    function rawEmbeddedThumbnailPhotoFormat: NSDictionary; cdecl;
    procedure setAutoContentAwareDistortionCorrectionEnabled
      (autoContentAwareDistortionCorrectionEnabled: Boolean); cdecl;
    function isAutoContentAwareDistortionCorrectionEnabled: Boolean; cdecl;
  end;

  TAVCapturePhotoSettings = class(TOCGenericImport<AVCapturePhotoSettingsClass,
    AVCapturePhotoSettings>)
  end;

  PAVCapturePhotoSettings = Pointer;

  AVCapturePhotoBracketSettingsClass = interface(AVCapturePhotoSettingsClass)
    ['{AA279ED6-E013-4E81-AC96-DB9983586995}']
    [MethodName
      ('photoBracketSettingsWithRawPixelFormatType:processedFormat:bracketedSettings:')
      ]
    { class } function
      photoBracketSettingsWithRawPixelFormatTypeProcessedFormatBracketedSettings
      (rawPixelFormatType: OSType; processedFormat: NSDictionary;
      bracketedSettings: NSArray): Pointer { instancetype }; cdecl;
    [MethodName
      ('photoBracketSettingsWithRawPixelFormatType:rawFileType:processedFormat:processedFileType:bracketedSettings:')
      ]
    { class } function
      photoBracketSettingsWithRawPixelFormatTypeRawFileTypeProcessedFormatProcessedFileTypeBracketedSettings
      (rawPixelFormatType: OSType; rawFileType: AVFileType;
      processedFormat: NSDictionary; processedFileType: AVFileType;
      bracketedSettings: NSArray): Pointer { instancetype }; cdecl;
  end;

  AVCapturePhotoBracketSettings = interface(AVCapturePhotoSettings)
    ['{DF071461-12CB-43F3-AF05-C8458BD9962D}']
    function bracketedSettings: NSArray; cdecl;
    procedure setLensStabilizationEnabled(lensStabilizationEnabled
      : Boolean); cdecl;
    function isLensStabilizationEnabled: Boolean; cdecl;
  end;

  TAVCapturePhotoBracketSettings = class
    (TOCGenericImport<AVCapturePhotoBracketSettingsClass,
    AVCapturePhotoBracketSettings>)
  end;

  PAVCapturePhotoBracketSettings = Pointer;

  AVCaptureResolvedPhotoSettingsClass = interface(NSObjectClass)
    ['{D5010719-ED1B-44B2-9BBD-FADC2F32B058}']
  end;

  AVCaptureResolvedPhotoSettings = interface(NSObject)
    ['{9175DA07-3F07-4B2B-A9CC-3A5C3A6FDBCB}']
    function uniqueID: Int64; cdecl;
    function photoDimensions: CMVideoDimensions; cdecl;
    function rawPhotoDimensions: CMVideoDimensions; cdecl;
    function previewDimensions: CMVideoDimensions; cdecl;
    function embeddedThumbnailDimensions: CMVideoDimensions; cdecl;
    function rawEmbeddedThumbnailDimensions: CMVideoDimensions; cdecl;
    function portraitEffectsMatteDimensions: CMVideoDimensions; cdecl;
    function dimensionsForSemanticSegmentationMatteOfType
      (semanticSegmentationMatteType: AVSemanticSegmentationMatteType)
      : CMVideoDimensions; cdecl;
    function livePhotoMovieDimensions: CMVideoDimensions; cdecl;
    function isFlashEnabled: Boolean; cdecl;
    function isRedEyeReductionEnabled: Boolean; cdecl;
    function isStillImageStabilizationEnabled: Boolean; cdecl;
    function isVirtualDeviceFusionEnabled: Boolean; cdecl;
    function isDualCameraFusionEnabled: Boolean; cdecl;
    function expectedPhotoCount: NSUInteger; cdecl;
    function photoProcessingTimeRange: CMTimeRange; cdecl;
    function isContentAwareDistortionCorrectionEnabled: Boolean; cdecl;
  end;

  TAVCaptureResolvedPhotoSettings = class
    (TOCGenericImport<AVCaptureResolvedPhotoSettingsClass,
    AVCaptureResolvedPhotoSettings>)
  end;

  PAVCaptureResolvedPhotoSettings = Pointer;

  AVCaptureBracketedStillImageSettingsClass = interface(NSObjectClass)
    ['{86373E7C-5511-4CF4-B282-B9196FD3557E}']
  end;

  AVCaptureBracketedStillImageSettings = interface(NSObject)
    ['{CC90246A-54AC-448C-AEB5-8D44A87B206F}']
  end;

  TAVCaptureBracketedStillImageSettings = class
    (TOCGenericImport<AVCaptureBracketedStillImageSettingsClass,
    AVCaptureBracketedStillImageSettings>)
  end;

  PAVCaptureBracketedStillImageSettings = Pointer;

  AVPortraitEffectsMatteClass = interface(NSObjectClass)
    ['{E8A9C5BF-BFE7-425E-B09D-365C6070524E}']
    { class } function portraitEffectsMatteFromDictionaryRepresentation
      (imageSourceAuxDataInfoDictionary: NSDictionary; error: NSError)
      : Pointer { instancetype }; cdecl;
  end;

  AVPortraitEffectsMatte = interface(NSObject)
    ['{D0F3435F-74AF-4921-BCD9-A999E882B20A}']
    function portraitEffectsMatteByApplyingExifOrientation(exifOrientation
      : CGImagePropertyOrientation): Pointer { instancetype }; cdecl;
    function portraitEffectsMatteByReplacingPortraitEffectsMatteWithPixelBuffer
      (pixelBuffer: CVPixelBufferRef; error: NSError)
      : Pointer { instancetype }; cdecl;
    function dictionaryRepresentationForAuxiliaryDataType(outAuxDataType
      : NSString): NSDictionary; cdecl;
    function pixelFormatType: OSType; cdecl;
    function mattingImage: CVPixelBufferRef; cdecl;
  end;

  TAVPortraitEffectsMatte = class(TOCGenericImport<AVPortraitEffectsMatteClass,
    AVPortraitEffectsMatte>)
  end;

  PAVPortraitEffectsMatte = Pointer;

  AVCapturePhotoOutputClass = interface(AVCaptureOutputClass)
    ['{890BEAE6-A23D-45D4-B1BC-A8DB5AACD321}']
    { class } function isBayerRAWPixelFormat(pixelFormat: OSType)
      : Boolean; cdecl;
    { class } function isAppleProRAWPixelFormat(pixelFormat: OSType)
      : Boolean; cdecl;
    { class } function JPEGPhotoDataRepresentationForJPEGSampleBuffer
      (JPEGSampleBuffer: CMSampleBufferRef;
      previewPhotoSampleBuffer: CMSampleBufferRef): NSData; cdecl;
    { class } function DNGPhotoDataRepresentationForRawSampleBuffer
      (rawSampleBuffer: CMSampleBufferRef;
      previewPhotoSampleBuffer: CMSampleBufferRef): NSData; cdecl;
  end;

  AVCapturePhotoOutput = interface(AVCaptureOutput)
    ['{2BE30FCB-8DDA-402E-AD51-254ADA55017C}']
    procedure capturePhotoWithSettings(settings: AVCapturePhotoSettings;
      delegate: Pointer); cdecl;
    function preparedPhotoSettingsArray: NSArray; cdecl;
    procedure setPreparedPhotoSettingsArray(preparedPhotoSettingsArray: NSArray;
      completionHandler: TAVFoundationCompletionHandler11); cdecl;
    function availablePhotoPixelFormatTypes: NSArray; cdecl;
    function availablePhotoCodecTypes: NSArray; cdecl;
    function isAppleProRAWSupported: Boolean; cdecl;
    procedure setAppleProRAWEnabled(appleProRAWEnabled: Boolean); cdecl;
    function isAppleProRAWEnabled: Boolean; cdecl;
    function availableRawPhotoPixelFormatTypes: NSArray; cdecl;
    function availablePhotoFileTypes: NSArray; cdecl;
    function availableRawPhotoFileTypes: NSArray; cdecl;
    function supportedPhotoPixelFormatTypesForFileType(fileType: AVFileType)
      : NSArray; cdecl;
    function supportedPhotoCodecTypesForFileType(fileType: AVFileType)
      : NSArray; cdecl;
    function supportedRawPhotoPixelFormatTypesForFileType(fileType: AVFileType)
      : NSArray; cdecl;
    procedure setMaxPhotoQualityPrioritization(maxPhotoQualityPrioritization
      : AVCapturePhotoQualityPrioritization); cdecl;
    function maxPhotoQualityPrioritization
      : AVCapturePhotoQualityPrioritization; cdecl;
    function isStillImageStabilizationSupported: Boolean; cdecl;
    function isStillImageStabilizationScene: Boolean; cdecl;
    function isVirtualDeviceFusionSupported: Boolean; cdecl;
    function isDualCameraFusionSupported: Boolean; cdecl;
    function isVirtualDeviceConstituentPhotoDeliverySupported: Boolean; cdecl;
    function isDualCameraDualPhotoDeliverySupported: Boolean; cdecl;
    procedure setVirtualDeviceConstituentPhotoDeliveryEnabled
      (virtualDeviceConstituentPhotoDeliveryEnabled: Boolean); cdecl;
    function isVirtualDeviceConstituentPhotoDeliveryEnabled: Boolean; cdecl;
    procedure setDualCameraDualPhotoDeliveryEnabled
      (dualCameraDualPhotoDeliveryEnabled: Boolean); cdecl;
    function isDualCameraDualPhotoDeliveryEnabled: Boolean; cdecl;
    function isCameraCalibrationDataDeliverySupported: Boolean; cdecl;
    function supportedFlashModes: NSArray; cdecl;
    function isAutoRedEyeReductionSupported: Boolean; cdecl;
    function isFlashScene: Boolean; cdecl;
    procedure setPhotoSettingsForSceneMonitoring(photoSettingsForSceneMonitoring
      : AVCapturePhotoSettings); cdecl;
    function photoSettingsForSceneMonitoring: AVCapturePhotoSettings; cdecl;
    procedure setHighResolutionCaptureEnabled(highResolutionCaptureEnabled
      : Boolean); cdecl;
    function isHighResolutionCaptureEnabled: Boolean; cdecl;
    procedure setMaxPhotoDimensions(maxPhotoDimensions
      : CMVideoDimensions); cdecl;
    function maxPhotoDimensions: CMVideoDimensions; cdecl;
    function maxBracketedCapturePhotoCount: NSUInteger; cdecl;
    function isLensStabilizationDuringBracketedCaptureSupported: Boolean; cdecl;
    function isLivePhotoCaptureSupported: Boolean; cdecl;
    procedure setLivePhotoCaptureEnabled(livePhotoCaptureEnabled
      : Boolean); cdecl;
    function isLivePhotoCaptureEnabled: Boolean; cdecl;
    procedure setLivePhotoCaptureSuspended(livePhotoCaptureSuspended
      : Boolean); cdecl;
    function isLivePhotoCaptureSuspended: Boolean; cdecl;
    procedure setPreservesLivePhotoCaptureSuspendedOnSessionStop
      (preservesLivePhotoCaptureSuspendedOnSessionStop: Boolean); cdecl;
    function preservesLivePhotoCaptureSuspendedOnSessionStop: Boolean; cdecl;
    procedure setLivePhotoAutoTrimmingEnabled(livePhotoAutoTrimmingEnabled
      : Boolean); cdecl;
    function isLivePhotoAutoTrimmingEnabled: Boolean; cdecl;
    function availableLivePhotoVideoCodecTypes: NSArray; cdecl;
    function isContentAwareDistortionCorrectionSupported: Boolean; cdecl;
    procedure setContentAwareDistortionCorrectionEnabled
      (contentAwareDistortionCorrectionEnabled: Boolean); cdecl;
    function isContentAwareDistortionCorrectionEnabled: Boolean; cdecl;
    function isDepthDataDeliverySupported: Boolean; cdecl;
    procedure setDepthDataDeliveryEnabled(depthDataDeliveryEnabled
      : Boolean); cdecl;
    function isDepthDataDeliveryEnabled: Boolean; cdecl;
    function isPortraitEffectsMatteDeliverySupported: Boolean; cdecl;
    procedure setPortraitEffectsMatteDeliveryEnabled
      (portraitEffectsMatteDeliveryEnabled: Boolean); cdecl;
    function isPortraitEffectsMatteDeliveryEnabled: Boolean; cdecl;
    function availableSemanticSegmentationMatteTypes: NSArray; cdecl;
    procedure setEnabledSemanticSegmentationMatteTypes
      (enabledSemanticSegmentationMatteTypes: NSArray); cdecl;
    function enabledSemanticSegmentationMatteTypes: NSArray; cdecl;
  end;

  TAVCapturePhotoOutput = class(TOCGenericImport<AVCapturePhotoOutputClass,
    AVCapturePhotoOutput>)
  end;

  PAVCapturePhotoOutput = Pointer;

  AVCapturePhotoClass = interface(NSObjectClass)
    ['{097DE4D0-2DD5-4655-A32F-AEF8A154ACA6}']
  end;

  AVCapturePhoto = interface(NSObject)
    ['{8101FC3C-4A4F-4B8C-8A35-50B1045180E3}']
    function timestamp: CMTime; cdecl;
    function isRawPhoto: Boolean; cdecl;
    function pixelBuffer: CVPixelBufferRef; cdecl;
    function previewPixelBuffer: CVPixelBufferRef; cdecl;
    function embeddedThumbnailPhotoFormat: NSDictionary; cdecl;
    function depthData: AVDepthData; cdecl;
    function portraitEffectsMatte: AVPortraitEffectsMatte; cdecl;
    function semanticSegmentationMatteForType(semanticSegmentationMatteType
      : AVSemanticSegmentationMatteType): AVSemanticSegmentationMatte; cdecl;
    function metadata: NSDictionary; cdecl;
    function cameraCalibrationData: AVCameraCalibrationData; cdecl;
    function resolvedSettings: AVCaptureResolvedPhotoSettings; cdecl;
    function photoCount: NSInteger; cdecl;
    function sourceDeviceType: AVCaptureDeviceType; cdecl;
    function fileDataRepresentation: NSData; cdecl;
    function fileDataRepresentationWithCustomizer(customizer: Pointer)
      : NSData; cdecl;
    function fileDataRepresentationWithReplacementMetadata(replacementMetadata
      : NSDictionary; replacementEmbeddedThumbnailPhotoFormat: NSDictionary;
      replacementEmbeddedThumbnailPixelBuffer: CVPixelBufferRef;
      replacementDepthData: AVDepthData): NSData; cdecl;
    function CGImageRepresentation: CGImageRef; cdecl;
    function previewCGImageRepresentation: CGImageRef; cdecl;
    function bracketSettings: AVCaptureBracketedStillImageSettings; cdecl;
    function sequenceCount: NSInteger; cdecl;
    function lensStabilizationStatus: AVCaptureLensStabilizationStatus; cdecl;
  end;

  TAVCapturePhoto = class(TOCGenericImport<AVCapturePhotoClass, AVCapturePhoto>)
  end;

  PAVCapturePhoto = Pointer;

  AVCaptureStillImageOutputClass = interface(AVCaptureOutputClass)
    ['{CFFF78B4-1205-4B98-AC0D-DC7FA3EB85D1}']
    { class } function jpegStillImageNSDataRepresentation(JPEGSampleBuffer
      : CMSampleBufferRef): NSData; cdecl;
  end;

  AVCaptureStillImageOutput = interface(AVCaptureOutput)
    ['{A2DDAF2B-63A4-4D93-837B-A70F318ECF4D}']
    procedure setOutputSettings(outputSettings: NSDictionary); cdecl;
    function outputSettings: NSDictionary; cdecl;
    function availableImageDataCVPixelFormatTypes: NSArray; cdecl;
    function availableImageDataCodecTypes: NSArray; cdecl;
    function isStillImageStabilizationSupported: Boolean; cdecl;
    procedure setAutomaticallyEnablesStillImageStabilizationWhenAvailable
      (automaticallyEnablesStillImageStabilizationWhenAvailable
      : Boolean); cdecl;
    function automaticallyEnablesStillImageStabilizationWhenAvailable
      : Boolean; cdecl;
    function isStillImageStabilizationActive: Boolean; cdecl;
    procedure setHighResolutionStillImageOutputEnabled
      (highResolutionStillImageOutputEnabled: Boolean); cdecl;
    function isHighResolutionStillImageOutputEnabled: Boolean; cdecl;
    function isCapturingStillImage: Boolean; cdecl;
    procedure captureStillImageAsynchronouslyFromConnection
      (connection: AVCaptureConnection;
      completionHandler: TAVFoundationCompletionHandler14); cdecl;
    function maxBracketedCaptureStillImageCount: NSUInteger; cdecl;
    function isLensStabilizationDuringBracketedCaptureSupported: Boolean; cdecl;
    procedure setLensStabilizationDuringBracketedCaptureEnabled
      (lensStabilizationDuringBracketedCaptureEnabled: Boolean); cdecl;
    function isLensStabilizationDuringBracketedCaptureEnabled: Boolean; cdecl;
    procedure prepareToCaptureStillImageBracketFromConnection
      (connection: AVCaptureConnection; withSettingsArray: NSArray;
      completionHandler: TAVFoundationCompletionHandler11); cdecl;
    procedure captureStillImageBracketAsynchronouslyFromConnection
      (connection: AVCaptureConnection; withSettingsArray: NSArray;
      completionHandler: TAVFoundationCompletionHandler15); cdecl;
  end;

  TAVCaptureStillImageOutput = class
    (TOCGenericImport<AVCaptureStillImageOutputClass,
    AVCaptureStillImageOutput>)
  end;

  PAVCaptureStillImageOutput = Pointer;

  AVCaptureManualExposureBracketedStillImageSettingsClass = interface
    (AVCaptureBracketedStillImageSettingsClass)
    ['{166D8B13-78CE-40B8-AC52-9248766C056D}']
    { class } function manualExposureSettingsWithExposureDuration
      (duration: CMTime; ISO: Single): Pointer { instancetype }; cdecl;
  end;

  AVCaptureManualExposureBracketedStillImageSettings = interface
    (AVCaptureBracketedStillImageSettings)
    ['{AE3B00FB-9CC8-4E3A-B45D-41A2DAC086C2}']
    function exposureDuration: CMTime; cdecl;
    function ISO: Single; cdecl;
  end;

  TAVCaptureManualExposureBracketedStillImageSettings = class
    (TOCGenericImport<AVCaptureManualExposureBracketedStillImageSettingsClass,
    AVCaptureManualExposureBracketedStillImageSettings>)
  end;

  PAVCaptureManualExposureBracketedStillImageSettings = Pointer;

  AVCaptureAutoExposureBracketedStillImageSettingsClass = interface
    (AVCaptureBracketedStillImageSettingsClass)
    ['{19E05DBC-B618-42C8-8FE8-63C0ACA4D730}']
    { class } function autoExposureSettingsWithExposureTargetBias
      (exposureTargetBias: Single): Pointer { instancetype }; cdecl;
  end;

  AVCaptureAutoExposureBracketedStillImageSettings = interface
    (AVCaptureBracketedStillImageSettings)
    ['{08B03462-0967-46AD-96F7-22E34F5C8208}']
    function exposureTargetBias: Single; cdecl;
  end;

  TAVCaptureAutoExposureBracketedStillImageSettings = class
    (TOCGenericImport<AVCaptureAutoExposureBracketedStillImageSettingsClass,
    AVCaptureAutoExposureBracketedStillImageSettings>)
  end;

  PAVCaptureAutoExposureBracketedStillImageSettings = Pointer;

  AVCaptureVideoDataOutputClass = interface(AVCaptureOutputClass)
    ['{2F0A0F63-06E4-4667-A1FB-2476352A1E88}']
  end;

  AVCaptureVideoDataOutput = interface(AVCaptureOutput)
    ['{E8F9FD81-1D7D-4739-86DA-7087E0BAF19E}']
    procedure setSampleBufferDelegate(sampleBufferDelegate: Pointer;
      queue: dispatch_queue_t); cdecl;
    function sampleBufferDelegate: Pointer; cdecl;
    function sampleBufferCallbackQueue: dispatch_queue_t; cdecl;
    procedure setVideoSettings(videoSettings: NSDictionary); cdecl;
    function videoSettings: NSDictionary; cdecl;
    function recommendedVideoSettingsForAssetWriterWithOutputFileType
      (outputFileType: AVFileType): NSDictionary; cdecl;
    function availableVideoCodecTypesForAssetWriterWithOutputFileType
      (outputFileType: AVFileType): NSArray; cdecl;
    function recommendedVideoSettingsForVideoCodecType(videoCodecType
      : AVVideoCodecType; assetWriterOutputFileType: AVFileType)
      : NSDictionary; cdecl;
    function availableVideoCVPixelFormatTypes: NSArray; cdecl;
    function availableVideoCodecTypes: NSArray; cdecl;
    procedure setMinFrameDuration(minFrameDuration: CMTime); cdecl;
    function minFrameDuration: CMTime; cdecl;
    procedure setAlwaysDiscardsLateVideoFrames(alwaysDiscardsLateVideoFrames
      : Boolean); cdecl;
    function alwaysDiscardsLateVideoFrames: Boolean; cdecl;
    procedure setAutomaticallyConfiguresOutputBufferDimensions
      (automaticallyConfiguresOutputBufferDimensions: Boolean); cdecl;
    function automaticallyConfiguresOutputBufferDimensions: Boolean; cdecl;
    procedure setDeliversPreviewSizedOutputBuffers
      (deliversPreviewSizedOutputBuffers: Boolean); cdecl;
    function deliversPreviewSizedOutputBuffers: Boolean; cdecl;
  end;

  TAVCaptureVideoDataOutput = class
    (TOCGenericImport<AVCaptureVideoDataOutputClass, AVCaptureVideoDataOutput>)
  end;

  PAVCaptureVideoDataOutput = Pointer;

  AVCaptureSynchronizedDataCollectionClass = interface(NSObjectClass)
    ['{274C1090-56C7-44CB-8EB1-9B5B954B6B09}']
  end;

  AVCaptureSynchronizedDataCollection = interface(NSObject)
    ['{44F3E9EB-B9E4-4693-BB80-E47AA97AFB88}']
    function synchronizedDataForCaptureOutput(captureOutput: AVCaptureOutput)
      : AVCaptureSynchronizedData; cdecl;
    function objectForKeyedSubscript(key: AVCaptureOutput)
      : AVCaptureSynchronizedData; cdecl;
    function count: NSUInteger; cdecl;
  end;

  TAVCaptureSynchronizedDataCollection = class
    (TOCGenericImport<AVCaptureSynchronizedDataCollectionClass,
    AVCaptureSynchronizedDataCollection>)
  end;

  PAVCaptureSynchronizedDataCollection = Pointer;

  AVCaptureDataOutputSynchronizerClass = interface(NSObjectClass)
    ['{53BFB544-6FF9-4EF3-8790-C03B0A9926DD}']
  end;

  AVCaptureDataOutputSynchronizer = interface(NSObject)
    ['{59F38470-8535-49A7-86B3-57812AFCB939}']
    function initWithDataOutputs(dataOutputs: NSArray)
      : Pointer { instancetype }; cdecl;
    function dataOutputs: NSArray; cdecl;
    procedure setDelegate(delegate: Pointer; queue: dispatch_queue_t); cdecl;
    function delegate: Pointer; cdecl;
    function delegateCallbackQueue: dispatch_queue_t; cdecl;
  end;

  TAVCaptureDataOutputSynchronizer = class
    (TOCGenericImport<AVCaptureDataOutputSynchronizerClass,
    AVCaptureDataOutputSynchronizer>)
  end;

  PAVCaptureDataOutputSynchronizer = Pointer;

  AVCaptureSynchronizedDataClass = interface(NSObjectClass)
    ['{5EB5A645-A832-47A7-A323-F0A380613D59}']
  end;

  AVCaptureSynchronizedData = interface(NSObject)
    ['{55F91DD1-B43A-496A-A33A-9E970A09D263}']
    function timestamp: CMTime; cdecl;
  end;

  TAVCaptureSynchronizedData = class
    (TOCGenericImport<AVCaptureSynchronizedDataClass,
    AVCaptureSynchronizedData>)
  end;

  PAVCaptureSynchronizedData = Pointer;

  AVCaptureSynchronizedSampleBufferDataClass = interface
    (AVCaptureSynchronizedDataClass)
    ['{05C1869C-47FC-40FF-8594-7484FA4B0AB7}']
  end;

  AVCaptureSynchronizedSampleBufferData = interface(AVCaptureSynchronizedData)
    ['{9C36C334-5E84-4F81-AE82-7E15FCC40A1F}']
    function sampleBuffer: CMSampleBufferRef; cdecl;
    function sampleBufferWasDropped: Boolean; cdecl;
    function droppedReason: AVCaptureOutputDataDroppedReason; cdecl;
  end;

  TAVCaptureSynchronizedSampleBufferData = class
    (TOCGenericImport<AVCaptureSynchronizedSampleBufferDataClass,
    AVCaptureSynchronizedSampleBufferData>)
  end;

  PAVCaptureSynchronizedSampleBufferData = Pointer;

  AVCaptureSynchronizedMetadataObjectDataClass = interface
    (AVCaptureSynchronizedDataClass)
    ['{ADB687C0-3FE3-4964-91E1-13A3A0CCDC24}']
  end;

  AVCaptureSynchronizedMetadataObjectData = interface(AVCaptureSynchronizedData)
    ['{10B120ED-BCC2-42E1-898C-64306015AEDE}']
    function metadataObjects: NSArray; cdecl;
  end;

  TAVCaptureSynchronizedMetadataObjectData = class
    (TOCGenericImport<AVCaptureSynchronizedMetadataObjectDataClass,
    AVCaptureSynchronizedMetadataObjectData>)
  end;

  PAVCaptureSynchronizedMetadataObjectData = Pointer;

  AVCaptureSynchronizedDepthDataClass = interface
    (AVCaptureSynchronizedDataClass)
    ['{32F6CB6D-E1C3-4A0B-996D-1A23092675CF}']
  end;

  AVCaptureSynchronizedDepthData = interface(AVCaptureSynchronizedData)
    ['{8B3B3E2C-562B-44B1-A5BF-6000423AF2FC}']
    function depthData: AVDepthData; cdecl;
    function depthDataWasDropped: Boolean; cdecl;
    function droppedReason: AVCaptureOutputDataDroppedReason; cdecl;
  end;

  TAVCaptureSynchronizedDepthData = class
    (TOCGenericImport<AVCaptureSynchronizedDepthDataClass,
    AVCaptureSynchronizedDepthData>)
  end;

  PAVCaptureSynchronizedDepthData = Pointer;

  AVCaptureDeskViewApplicationLaunchConfigurationClass = interface
    (NSObjectClass)
    ['{563042BA-78AD-4625-9A54-1CBDC035ACD0}']
  end;

  AVCaptureDeskViewApplicationLaunchConfiguration = interface(NSObject)
    ['{3757BE68-4BE2-4484-8E3C-EC0D6E99507A}']
    procedure setMainWindowFrame(mainWindowFrame: CGRect); cdecl;
    function mainWindowFrame: CGRect; cdecl;
    procedure setRequiresSetUpModeCompletion(requiresSetUpModeCompletion
      : Boolean); cdecl;
    function requiresSetUpModeCompletion: Boolean; cdecl;
  end;

  TAVCaptureDeskViewApplicationLaunchConfiguration = class
    (TOCGenericImport<AVCaptureDeskViewApplicationLaunchConfigurationClass,
    AVCaptureDeskViewApplicationLaunchConfiguration>)
  end;

  PAVCaptureDeskViewApplicationLaunchConfiguration = Pointer;

  AVCaptureDeskViewApplicationClass = interface(NSObjectClass)
    ['{7E134719-E4B5-4DD3-B392-1D8DB64A38D6}']
  end;

  AVCaptureDeskViewApplication = interface(NSObject)
    ['{09DCB9E7-D8C3-4725-AB4C-66919F0C533D}']
    procedure presentWithCompletionHandler(completionHandler
      : TAVFoundationCompletionHandler16); cdecl;
    procedure presentWithLaunchConfiguration(launchConfiguration
      : AVCaptureDeskViewApplicationLaunchConfiguration;
      completionHandler: TAVFoundationCompletionHandler16); cdecl;
  end;

  TAVCaptureDeskViewApplication = class
    (TOCGenericImport<AVCaptureDeskViewApplicationClass,
    AVCaptureDeskViewApplication>)
  end;

  PAVCaptureDeskViewApplication = Pointer;

  AVCaptureDeviceInputClass = interface(AVCaptureInputClass)
    ['{E318B55D-8F72-4408-B0A7-0E88A80C26F4}']
    { class } function deviceInputWithDevice(device: AVCaptureDevice;
      error: NSError): Pointer { instancetype }; cdecl;
  end;

  AVCaptureDeviceInput = interface(AVCaptureInput)
    ['{3FF9AB83-B036-4B61-B875-D11ECA0A6F97}']
    function initWithDevice(device: AVCaptureDevice; error: NSError)
      : Pointer { instancetype }; cdecl;
    function device: AVCaptureDevice; cdecl;
    procedure setUnifiedAutoExposureDefaultsEnabled
      (unifiedAutoExposureDefaultsEnabled: Boolean); cdecl;
    function unifiedAutoExposureDefaultsEnabled: Boolean; cdecl;
    function portsWithMediaType(mediaType: AVMediaType;
      sourceDeviceType: AVCaptureDeviceType;
      sourceDevicePosition: AVCaptureDevicePosition): NSArray; cdecl;
    procedure setVideoMinFrameDurationOverride(videoMinFrameDurationOverride
      : CMTime); cdecl;
    function videoMinFrameDurationOverride: CMTime; cdecl;
  end;

  TAVCaptureDeviceInput = class(TOCGenericImport<AVCaptureDeviceInputClass,
    AVCaptureDeviceInput>)
  end;

  PAVCaptureDeviceInput = Pointer;

  AVCaptureScreenInputClass = interface(AVCaptureInputClass)
    ['{05E65B15-2EC1-411A-BA43-227B16248B81}']
  end;

  AVCaptureScreenInput = interface(AVCaptureInput)
    ['{4E2A370C-DD5F-455B-9E44-DD7C10F0877A}']
    procedure setMinFrameDuration(minFrameDuration: CMTime); cdecl;
    function minFrameDuration: CMTime; cdecl;
    procedure setCropRect(cropRect: CGRect); cdecl;
    function cropRect: CGRect; cdecl;
    procedure setScaleFactor(scaleFactor: CGFloat); cdecl;
    function scaleFactor: CGFloat; cdecl;
    procedure setCapturesMouseClicks(capturesMouseClicks: Boolean); cdecl;
    function capturesMouseClicks: Boolean; cdecl;
    procedure setCapturesCursor(capturesCursor: Boolean); cdecl;
    function capturesCursor: Boolean; cdecl;
    procedure setRemovesDuplicateFrames(removesDuplicateFrames: Boolean); cdecl;
    function removesDuplicateFrames: Boolean; cdecl;
  end;

  TAVCaptureScreenInput = class(TOCGenericImport<AVCaptureScreenInputClass,
    AVCaptureScreenInput>)
  end;

  PAVCaptureScreenInput = Pointer;

  AVCaptureMetadataInputClass = interface(AVCaptureInputClass)
    ['{D730D437-4194-4628-BC66-FF85E0EDD201}']
    { class } function metadataInputWithFormatDescription
      (desc: CMMetadataFormatDescriptionRef; clock: CMClockRef)
      : Pointer { instancetype }; cdecl;
  end;

  AVCaptureMetadataInput = interface(AVCaptureInput)
    ['{97753796-71FB-4516-9136-B8B2E2E9CB62}']
    function initWithFormatDescription(desc: CMMetadataFormatDescriptionRef;
      clock: CMClockRef): Pointer { instancetype }; cdecl;
    function appendTimedMetadataGroup(metadata: AVTimedMetadataGroup;
      error: NSError): Boolean; cdecl;
  end;

  TAVCaptureMetadataInput = class(TOCGenericImport<AVCaptureMetadataInputClass,
    AVCaptureMetadataInput>)
  end;

  PAVCaptureMetadataInput = Pointer;

  AVCompositionClass = interface(AVAssetClass)
    ['{4B647FAF-C547-4E1F-98A4-0DFC189E7F8F}']
  end;

  AVComposition = interface(AVAsset)
    ['{9EB5FF98-67CC-4A3B-BCCC-3C24E8CE57C1}']
    function tracks: NSArray; cdecl;
    function naturalSize: CGSize; cdecl;
    function URLAssetInitializationOptions: NSDictionary; cdecl;
    function trackWithTrackID(trackID: CMPersistentTrackID)
      : AVCompositionTrack; cdecl;
    procedure loadTrackWithTrackID(trackID: CMPersistentTrackID;
      completionHandler: TAVFoundationCompletionHandler17); cdecl;
    function tracksWithMediaType(mediaType: AVMediaType): NSArray; cdecl;
    procedure loadTracksWithMediaType(mediaType: AVMediaType;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function tracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic): NSArray; cdecl;
    procedure loadTracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function metadataForFormat(format: AVMetadataFormat): NSArray; cdecl;
    function chapterMetadataGroupsWithTitleLocale(locale: NSLocale;
      containingItemsWithCommonKeys: NSArray): NSArray; cdecl;
    function chapterMetadataGroupsBestMatchingPreferredLanguages
      (preferredLanguages: NSArray): NSArray; cdecl;
    function mediaSelectionGroupForMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic): AVMediaSelectionGroup; cdecl;
    function unusedTrackID: CMPersistentTrackID; cdecl;
  end;

  TAVComposition = class(TOCGenericImport<AVCompositionClass, AVComposition>)
  end;

  PAVComposition = Pointer;

  AVCompositionTrackFormatDescriptionReplacementClass = interface(NSObjectClass)
    ['{0DFBDC09-963A-4B4E-A1F7-71A113FFB2EE}']
  end;

  AVCompositionTrackFormatDescriptionReplacement = interface(NSObject)
    ['{3599DFC0-3E84-4B5C-854A-4A6EE0CD9D61}']
    function originalFormatDescription: CMFormatDescriptionRef; cdecl;
    function replacementFormatDescription: CMFormatDescriptionRef; cdecl;
  end;

  TAVCompositionTrackFormatDescriptionReplacement = class
    (TOCGenericImport<AVCompositionTrackFormatDescriptionReplacementClass,
    AVCompositionTrackFormatDescriptionReplacement>)
  end;

  PAVCompositionTrackFormatDescriptionReplacement = Pointer;

  AVCompositionTrackSegmentClass = interface(AVAssetTrackSegmentClass)
    ['{9327FC12-CD79-472D-B63A-EB20AA27FF55}']
    { class } function compositionTrackSegmentWithURL(URL: NSURL;
      trackID: CMPersistentTrackID; sourceTimeRange: CMTimeRange;
      targetTimeRange: CMTimeRange): Pointer { instancetype }; cdecl;
    { class } function compositionTrackSegmentWithTimeRange
      (timeRange: CMTimeRange): Pointer { instancetype }; cdecl;
  end;

  AVCompositionTrackSegment = interface(AVAssetTrackSegment)
    ['{DE4DE94F-BCEC-4408-8145-7AA063CACCC7}']
    function initWithURL(URL: NSURL; trackID: CMPersistentTrackID;
      sourceTimeRange: CMTimeRange; targetTimeRange: CMTimeRange)
      : Pointer { instancetype }; cdecl;
    function initWithTimeRange(timeRange: CMTimeRange)
      : Pointer { instancetype }; cdecl;
    function isEmpty: Boolean; cdecl;
    function sourceURL: NSURL; cdecl;
    function sourceTrackID: CMPersistentTrackID; cdecl;
  end;

  TAVCompositionTrackSegment = class
    (TOCGenericImport<AVCompositionTrackSegmentClass,
    AVCompositionTrackSegment>)
  end;

  PAVCompositionTrackSegment = Pointer;

  AVMutableCompositionTrackClass = interface(AVCompositionTrackClass)
    ['{82701915-7ABB-472D-8BDF-BBE946D8A9F8}']
  end;

  AVMutableCompositionTrack = interface(AVCompositionTrack)
    ['{6EED28EA-8829-48A9-8BD8-7CEDB7F1F189}']
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    procedure setNaturalTimeScale(naturalTimeScale: CMTimeScale); cdecl;
    function naturalTimeScale: CMTimeScale; cdecl;
    procedure setLanguageCode(languageCode: NSString); cdecl;
    function languageCode: NSString; cdecl;
    procedure setExtendedLanguageTag(extendedLanguageTag: NSString); cdecl;
    function extendedLanguageTag: NSString; cdecl;
    procedure setPreferredTransform(preferredTransform
      : CGAffineTransform); cdecl;
    function preferredTransform: CGAffineTransform; cdecl;
    procedure setPreferredVolume(preferredVolume: Single); cdecl;
    function preferredVolume: Single; cdecl;
    procedure setSegments(segments: NSArray); cdecl;
    function segments: NSArray; cdecl;
    function insertTimeRange(timeRange: CMTimeRange; ofTrack: AVAssetTrack;
      atTime: CMTime; error: NSError): Boolean; cdecl;
    function insertTimeRanges(timeRanges: NSArray; ofTracks: NSArray;
      atTime: CMTime; error: NSError): Boolean; cdecl;
    procedure insertEmptyTimeRange(timeRange: CMTimeRange); cdecl;
    procedure removeTimeRange(timeRange: CMTimeRange); cdecl;
    procedure scaleTimeRange(timeRange: CMTimeRange; toDuration: CMTime); cdecl;
    function validateTrackSegments(trackSegments: NSArray; error: NSError)
      : Boolean; cdecl;
    procedure addTrackAssociationToTrack(compositionTrack: AVCompositionTrack;
      &type: AVTrackAssociationType); cdecl;
    procedure removeTrackAssociationToTrack(compositionTrack
      : AVCompositionTrack; &type: AVTrackAssociationType); cdecl;
    procedure replaceFormatDescription(originalFormatDescription
      : CMFormatDescriptionRef;
      withFormatDescription: CMFormatDescriptionRef); cdecl;
  end;

  TAVMutableCompositionTrack = class
    (TOCGenericImport<AVMutableCompositionTrackClass,
    AVMutableCompositionTrack>)
  end;

  PAVMutableCompositionTrack = Pointer;

  AVMutableCompositionClass = interface(AVCompositionClass)
    ['{6860CCB5-D4E7-4B9B-91AB-34A31F156869}']
    { class } function composition: Pointer { instancetype }; cdecl;
    { class } function compositionWithURLAssetInitializationOptions
      (URLAssetInitializationOptions: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  AVMutableComposition = interface(AVComposition)
    ['{23C8E5C6-763B-4964-A7AC-ECBC193E4C68}']
    function tracks: NSArray; cdecl;
    procedure setNaturalSize(naturalSize: CGSize); cdecl;
    function naturalSize: CGSize; cdecl;
    [MethodName('insertTimeRange:ofAsset:atTime:error:')]
    function insertTimeRangeOfAssetAtTimeError(timeRange: CMTimeRange;
      ofAsset: AVAsset; atTime: CMTime; error: NSError): Boolean; cdecl;
    [MethodName('insertTimeRange:ofAsset:atTime:completionHandler:')]
    procedure insertTimeRangeOfAssetAtTimeCompletionHandler
      (timeRange: CMTimeRange; ofAsset: AVAsset; atTime: CMTime;
      completionHandler: TAVFoundationCompletionHandler16); cdecl;
    procedure insertEmptyTimeRange(timeRange: CMTimeRange); cdecl;
    procedure removeTimeRange(timeRange: CMTimeRange); cdecl;
    procedure scaleTimeRange(timeRange: CMTimeRange; toDuration: CMTime); cdecl;
    function addMutableTrackWithMediaType(mediaType: AVMediaType;
      preferredTrackID: CMPersistentTrackID): AVMutableCompositionTrack; cdecl;
    procedure removeTrack(track: AVCompositionTrack); cdecl;
    function mutableTrackCompatibleWithTrack(track: AVAssetTrack)
      : AVMutableCompositionTrack; cdecl;
    function trackWithTrackID(trackID: CMPersistentTrackID)
      : AVMutableCompositionTrack; cdecl;
    procedure loadTrackWithTrackID(trackID: CMPersistentTrackID;
      completionHandler: TAVFoundationCompletionHandler18); cdecl;
    function tracksWithMediaType(mediaType: AVMediaType): NSArray; cdecl;
    procedure loadTracksWithMediaType(mediaType: AVMediaType;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function tracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic): NSArray; cdecl;
    procedure loadTracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
  end;

  TAVMutableComposition = class(TOCGenericImport<AVMutableCompositionClass,
    AVMutableComposition>)
  end;

  PAVMutableComposition = Pointer;

  AVMutableMetadataItemClass = interface(AVMetadataItemClass)
    ['{9E85B68C-8496-4B5A-8018-5D18841460DB}']
    { class } function metadataItem: AVMutableMetadataItem; cdecl;
  end;

  AVMutableMetadataItem = interface(AVMetadataItem)
    ['{79B63C86-3E59-4CE7-8D93-ED88CE27A183}']
    procedure setIdentifier(identifier: AVMetadataIdentifier); cdecl;
    function identifier: AVMetadataIdentifier; cdecl;
    procedure setExtendedLanguageTag(extendedLanguageTag: NSString); cdecl;
    function extendedLanguageTag: NSString; cdecl;
    procedure setLocale(locale: NSLocale); cdecl;
    function locale: NSLocale; cdecl;
    procedure setTime(time: CMTime); cdecl;
    function time: CMTime; cdecl;
    procedure setDuration(duration: CMTime); cdecl;
    function duration: CMTime; cdecl;
    procedure setDataType(dataType: NSString); cdecl;
    function dataType: NSString; cdecl;
    procedure setValue(value: Pointer); cdecl;
    function value: Pointer; cdecl;
    procedure setExtraAttributes(extraAttributes: NSDictionary); cdecl;
    function extraAttributes: NSDictionary; cdecl;
    procedure setStartDate(startDate: NSDate); cdecl;
    function startDate: NSDate; cdecl;
    procedure setKeySpace(keySpace: AVMetadataKeySpace); cdecl;
    function keySpace: AVMetadataKeySpace; cdecl;
    procedure setKey(key: Pointer); cdecl;
    function key: Pointer; cdecl;
  end;

  TAVMutableMetadataItem = class(TOCGenericImport<AVMutableMetadataItemClass,
    AVMutableMetadataItem>)
  end;

  PAVMutableMetadataItem = Pointer;

  AVMetadataItemValueRequestClass = interface(NSObjectClass)
    ['{C822131C-6904-4AE9-BE93-18980E293FCD}']
  end;

  AVMetadataItemValueRequest = interface(NSObject)
    ['{1E98F61B-2AB9-45E6-9524-CAEA90908F3A}']
    function metadataItem: AVMetadataItem; cdecl;
    procedure respondWithValue(value: Pointer); cdecl;
    procedure respondWithError(error: NSError); cdecl;
  end;

  TAVMetadataItemValueRequest = class
    (TOCGenericImport<AVMetadataItemValueRequestClass,
    AVMetadataItemValueRequest>)
  end;

  PAVMetadataItemValueRequest = Pointer;

  AVMediaDataStorageClass = interface(NSObjectClass)
    ['{F9480D5E-6F47-4316-8A16-05FA011F689D}']
  end;

  AVMediaDataStorage = interface(NSObject)
    ['{6B41A625-7DA4-487C-95DF-2ED85F2019CD}']
    function initWithURL(URL: NSURL; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function URL: NSURL; cdecl;
  end;

  TAVMediaDataStorage = class(TOCGenericImport<AVMediaDataStorageClass,
    AVMediaDataStorage>)
  end;

  PAVMediaDataStorage = Pointer;

  AVMovieTrackClass = interface(AVAssetTrackClass)
    ['{1637081A-9E91-4464-B6B6-9C76A4C5CEF2}']
  end;

  AVMovieTrack = interface(AVAssetTrack)
    ['{2F377ABD-6FD8-4484-96C4-9C1BDDF809A9}']
    function mediaPresentationTimeRange: CMTimeRange; cdecl;
    function mediaDecodeTimeRange: CMTimeRange; cdecl;
    function alternateGroupID: NSInteger; cdecl;
    function mediaDataStorage: AVMediaDataStorage; cdecl;
  end;

  TAVMovieTrack = class(TOCGenericImport<AVMovieTrackClass, AVMovieTrack>)
  end;

  PAVMovieTrack = Pointer;

  AVMutableMovieTrackClass = interface(AVMovieTrackClass)
    ['{FFD82D40-1D69-4B47-A512-F0331949CB67}']
  end;

  AVMutableMovieTrack = interface(AVMovieTrack)
    ['{8CD213D6-4A40-46B4-A0E9-A3079E79CA9F}']
    procedure setMediaDataStorage(mediaDataStorage: AVMediaDataStorage); cdecl;
    function mediaDataStorage: AVMediaDataStorage; cdecl;
    procedure setSampleReferenceBaseURL(sampleReferenceBaseURL: NSURL); cdecl;
    function sampleReferenceBaseURL: NSURL; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    procedure setAlternateGroupID(alternateGroupID: NSInteger); cdecl;
    function alternateGroupID: NSInteger; cdecl;
    procedure setModified(modified: Boolean); cdecl;
    function isModified: Boolean; cdecl;
    function hasProtectedContent: Boolean; cdecl;
    procedure setTimescale(timescale: CMTimeScale); cdecl;
    function timescale: CMTimeScale; cdecl;
    procedure setLanguageCode(languageCode: NSString); cdecl;
    function languageCode: NSString; cdecl;
    procedure setExtendedLanguageTag(extendedLanguageTag: NSString); cdecl;
    function extendedLanguageTag: NSString; cdecl;
    procedure setNaturalSize(naturalSize: CGSize); cdecl;
    function naturalSize: CGSize; cdecl;
    procedure setPreferredTransform(preferredTransform
      : CGAffineTransform); cdecl;
    function preferredTransform: CGAffineTransform; cdecl;
    procedure setLayer(layer: NSInteger); cdecl;
    function layer: NSInteger; cdecl;
    procedure setCleanApertureDimensions(cleanApertureDimensions
      : CGSize); cdecl;
    function cleanApertureDimensions: CGSize; cdecl;
    procedure setProductionApertureDimensions(productionApertureDimensions
      : CGSize); cdecl;
    function productionApertureDimensions: CGSize; cdecl;
    procedure setEncodedPixelsDimensions(encodedPixelsDimensions
      : CGSize); cdecl;
    function encodedPixelsDimensions: CGSize; cdecl;
    procedure setPreferredVolume(preferredVolume: Single); cdecl;
    function preferredVolume: Single; cdecl;
    procedure setPreferredMediaChunkSize(preferredMediaChunkSize
      : NSInteger); cdecl;
    function preferredMediaChunkSize: NSInteger; cdecl;
    procedure setPreferredMediaChunkDuration(preferredMediaChunkDuration
      : CMTime); cdecl;
    function preferredMediaChunkDuration: CMTime; cdecl;
    procedure setPreferredMediaChunkAlignment(preferredMediaChunkAlignment
      : NSInteger); cdecl;
    function preferredMediaChunkAlignment: NSInteger; cdecl;
    function insertTimeRange(timeRange: CMTimeRange; ofTrack: AVAssetTrack;
      atTime: CMTime; copySampleData: Boolean; error: NSError): Boolean; cdecl;
    procedure insertEmptyTimeRange(timeRange: CMTimeRange); cdecl;
    procedure removeTimeRange(timeRange: CMTimeRange); cdecl;
    procedure scaleTimeRange(timeRange: CMTimeRange; toDuration: CMTime); cdecl;
    procedure setMetadata(metadata: NSArray); cdecl;
    function metadata: NSArray; cdecl;
    procedure addTrackAssociationToTrack(movieTrack: AVMovieTrack;
      &type: AVTrackAssociationType); cdecl;
    procedure removeTrackAssociationToTrack(movieTrack: AVMovieTrack;
      &type: AVTrackAssociationType); cdecl;
    procedure replaceFormatDescription(formatDescription
      : CMFormatDescriptionRef;
      withFormatDescription: CMFormatDescriptionRef); cdecl;
    function appendSampleBuffer(sampleBuffer: CMSampleBufferRef;
      decodeTime: PCMTime; presentationTime: PCMTime; error: NSError)
      : Boolean; cdecl;
    function insertMediaTimeRange(mediaTimeRange: CMTimeRange;
      intoTimeRange: CMTimeRange): Boolean; cdecl;
    function hasMediaCharacteristic(mediaCharacteristic: AVMediaCharacteristic)
      : Boolean; cdecl;
    function segmentForTrackTime(trackTime: CMTime): AVAssetTrackSegment; cdecl;
    function samplePresentationTimeForTrackTime(trackTime: CMTime)
      : CMTime; cdecl;
    function metadataForFormat(format: AVMetadataFormat): NSArray; cdecl;
    function associatedTracksOfType(trackAssociationType
      : AVTrackAssociationType): NSArray; cdecl;
  end;

  TAVMutableMovieTrack = class(TOCGenericImport<AVMutableMovieTrackClass,
    AVMutableMovieTrack>)
  end;

  PAVMutableMovieTrack = Pointer;

  AVFragmentedMovieTrackClass = interface(AVMovieTrackClass)
    ['{E7115E20-60FB-4534-87B2-AACC1A7BC205}']
  end;

  AVFragmentedMovieTrack = interface(AVMovieTrack)
    ['{0963348D-479C-4077-8315-7A526EF6920C}']
  end;

  TAVFragmentedMovieTrack = class(TOCGenericImport<AVFragmentedMovieTrackClass,
    AVFragmentedMovieTrack>)
  end;

  PAVFragmentedMovieTrack = Pointer;

  AVMovieClass = interface(AVAssetClass)
    ['{2659EB58-E4CB-4865-BE22-4E5C45C2DCE8}']
    { class } function movieTypes: NSArray; cdecl;
    { class } function movieWithURL(URL: NSURL; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    { class } function movieWithData(data: NSData; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  AVMovie = interface(AVAsset)
    ['{EC08F47D-68D2-4FA6-8A24-E305BBBECD07}']
    function initWithURL(URL: NSURL; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function initWithData(data: NSData; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function URL: NSURL; cdecl;
    function data: NSData; cdecl;
    function defaultMediaDataStorage: AVMediaDataStorage; cdecl;
    function tracks: NSArray; cdecl;
    function canContainMovieFragments: Boolean; cdecl;
    function containsMovieFragments: Boolean; cdecl;
    function movieHeaderWithFileType(fileType: AVFileType; error: NSError)
      : NSData; cdecl;
    function writeMovieHeaderToURL(URL: NSURL; fileType: AVFileType;
      options: AVMovieWritingOptions; error: NSError): Boolean; cdecl;
    function isCompatibleWithFileType(fileType: AVFileType): Boolean; cdecl;
    function trackWithTrackID(trackID: CMPersistentTrackID)
      : AVMovieTrack; cdecl;
    procedure loadTrackWithTrackID(trackID: CMPersistentTrackID;
      completionHandler: TAVFoundationCompletionHandler19); cdecl;
    function tracksWithMediaType(mediaType: AVMediaType): NSArray; cdecl;
    procedure loadTracksWithMediaType(mediaType: AVMediaType;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function tracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic): NSArray; cdecl;
    procedure loadTracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
  end;

  TAVMovie = class(TOCGenericImport<AVMovieClass, AVMovie>)
  end;

  PAVMovie = Pointer;

  AVMutableMovieClass = interface(AVMovieClass)
    ['{C6FB4BD9-73BD-41D1-9979-EBB872522D66}']
    { class } function movieWithURL(URL: NSURL; options: NSDictionary;
      error: NSError): Pointer { instancetype }; cdecl;
    { class } function movieWithData(data: NSData; options: NSDictionary;
      error: NSError): Pointer { instancetype }; cdecl;
    { class } function movieWithSettingsFromMovie(movie: AVMovie;
      options: NSDictionary; error: NSError): Pointer { instancetype }; cdecl;
  end;

  AVMutableMovie = interface(AVMovie)
    ['{B4715505-85DD-4A50-8F07-45B9AE83C6BF}']
    function initWithURL(URL: NSURL; options: NSDictionary; error: NSError)
      : Pointer { instancetype }; cdecl;
    function initWithData(data: NSData; options: NSDictionary; error: NSError)
      : Pointer { instancetype }; cdecl;
    function initWithSettingsFromMovie(movie: AVMovie; options: NSDictionary;
      error: NSError): Pointer { instancetype }; cdecl;
    procedure setPreferredRate(preferredRate: Single); cdecl;
    function preferredRate: Single; cdecl;
    procedure setPreferredVolume(preferredVolume: Single); cdecl;
    function preferredVolume: Single; cdecl;
    procedure setPreferredTransform(preferredTransform
      : CGAffineTransform); cdecl;
    function preferredTransform: CGAffineTransform; cdecl;
    procedure setTimescale(timescale: CMTimeScale); cdecl;
    function timescale: CMTimeScale; cdecl;
    function tracks: NSArray; cdecl;
    procedure setModified(modified: Boolean); cdecl;
    function isModified: Boolean; cdecl;
    procedure setDefaultMediaDataStorage(defaultMediaDataStorage
      : AVMediaDataStorage); cdecl;
    function defaultMediaDataStorage: AVMediaDataStorage; cdecl;
    procedure setInterleavingPeriod(interleavingPeriod: CMTime); cdecl;
    function interleavingPeriod: CMTime; cdecl;
    function insertTimeRange(timeRange: CMTimeRange; ofAsset: AVAsset;
      atTime: CMTime; copySampleData: Boolean; error: NSError): Boolean; cdecl;
    procedure insertEmptyTimeRange(timeRange: CMTimeRange); cdecl;
    procedure removeTimeRange(timeRange: CMTimeRange); cdecl;
    procedure scaleTimeRange(timeRange: CMTimeRange; toDuration: CMTime); cdecl;
    function mutableTrackCompatibleWithTrack(track: AVAssetTrack)
      : AVMutableMovieTrack; cdecl;
    function addMutableTrackWithMediaType(mediaType: AVMediaType;
      copySettingsFromTrack: AVAssetTrack; options: NSDictionary)
      : AVMutableMovieTrack; cdecl;
    function addMutableTracksCopyingSettingsFromTracks(existingTracks: NSArray;
      options: NSDictionary): NSArray; cdecl;
    procedure removeTrack(track: AVMovieTrack); cdecl;
    procedure setMetadata(metadata: NSArray); cdecl;
    function metadata: NSArray; cdecl;
    function trackWithTrackID(trackID: CMPersistentTrackID)
      : AVMutableMovieTrack; cdecl;
    procedure loadTrackWithTrackID(trackID: CMPersistentTrackID;
      completionHandler: TAVFoundationCompletionHandler20); cdecl;
    function tracksWithMediaType(mediaType: AVMediaType): NSArray; cdecl;
    procedure loadTracksWithMediaType(mediaType: AVMediaType;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function tracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic): NSArray; cdecl;
    procedure loadTracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function metadataForFormat(format: AVMetadataFormat): NSArray; cdecl;
    function chapterMetadataGroupsWithTitleLocale(locale: NSLocale;
      containingItemsWithCommonKeys: NSArray): NSArray; cdecl;
    function chapterMetadataGroupsBestMatchingPreferredLanguages
      (preferredLanguages: NSArray): NSArray; cdecl;
    function mediaSelectionGroupForMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic): AVMediaSelectionGroup; cdecl;
    function unusedTrackID: CMPersistentTrackID; cdecl;
  end;

  TAVMutableMovie = class(TOCGenericImport<AVMutableMovieClass, AVMutableMovie>)
  end;

  PAVMutableMovie = Pointer;

  AVFragmentedMovieClass = interface(AVMovieClass)
    ['{931AB4C5-FDF3-4FFF-8F0C-7F1B0CC2D83B}']
  end;

  AVFragmentedMovie = interface(AVMovie)
    ['{BBD5652E-B12D-4E00-8F71-2A1938B7892A}']
    function tracks: NSArray; cdecl;
    function trackWithTrackID(trackID: CMPersistentTrackID)
      : AVFragmentedMovieTrack; cdecl;
    procedure loadTrackWithTrackID(trackID: CMPersistentTrackID;
      completionHandler: TAVFoundationCompletionHandler21); cdecl;
    function tracksWithMediaType(mediaType: AVMediaType): NSArray; cdecl;
    procedure loadTracksWithMediaType(mediaType: AVMediaType;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
    function tracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic): NSArray; cdecl;
    procedure loadTracksWithMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic;
      completionHandler: TAVFoundationCompletionHandler3); cdecl;
  end;

  TAVFragmentedMovie = class(TOCGenericImport<AVFragmentedMovieClass,
    AVFragmentedMovie>)
  end;

  PAVFragmentedMovie = Pointer;

  AVFragmentedMovieMinderClass = interface(AVFragmentedAssetMinderClass)
    ['{AF4755C8-DA83-4A38-BB07-4CA89F6295A9}']
    { class } function fragmentedMovieMinderWithMovie(movie: AVFragmentedMovie;
      mindingInterval: NSTimeInterval): Pointer { instancetype }; cdecl;
  end;

  AVFragmentedMovieMinder = interface(AVFragmentedAssetMinder)
    ['{D4697261-D92B-4006-AC2C-FA7BE1C39BB5}']
    function initWithMovie(movie: AVFragmentedMovie;
      mindingInterval: NSTimeInterval): Pointer { instancetype }; cdecl;
    procedure setMindingInterval(mindingInterval: NSTimeInterval); cdecl;
    function mindingInterval: NSTimeInterval; cdecl;
    function movies: NSArray; cdecl;
    procedure addFragmentedMovie(movie: AVFragmentedMovie); cdecl;
    procedure removeFragmentedMovie(movie: AVFragmentedMovie); cdecl;
  end;

  TAVFragmentedMovieMinder = class
    (TOCGenericImport<AVFragmentedMovieMinderClass, AVFragmentedMovieMinder>)
  end;

  PAVFragmentedMovieMinder = Pointer;

  AVOutputSettingsAssistantClass = interface(NSObjectClass)
    ['{38C97E92-14F4-4772-ACB3-A10959AAC823}']
    { class } function availableOutputSettingsPresets: NSArray; cdecl;
    { class } function outputSettingsAssistantWithPreset(presetIdentifier
      : AVOutputSettingsPreset): Pointer { instancetype }; cdecl;
  end;

  AVOutputSettingsAssistant = interface(NSObject)
    ['{C1BB1DFD-232B-47AF-9A4E-6755CB242B85}']
    function audioSettings: NSDictionary; cdecl;
    function videoSettings: NSDictionary; cdecl;
    function outputFileType: AVFileType; cdecl;
    procedure setSourceAudioFormat(sourceAudioFormat
      : CMAudioFormatDescriptionRef); cdecl;
    function sourceAudioFormat: CMAudioFormatDescriptionRef; cdecl;
    procedure setSourceVideoFormat(sourceVideoFormat
      : CMVideoFormatDescriptionRef); cdecl;
    function sourceVideoFormat: CMVideoFormatDescriptionRef; cdecl;
    procedure setSourceVideoAverageFrameDuration(sourceVideoAverageFrameDuration
      : CMTime); cdecl;
    function sourceVideoAverageFrameDuration: CMTime; cdecl;
    procedure setSourceVideoMinFrameDuration(sourceVideoMinFrameDuration
      : CMTime); cdecl;
    function sourceVideoMinFrameDuration: CMTime; cdecl;
  end;

  TAVOutputSettingsAssistant = class
    (TOCGenericImport<AVOutputSettingsAssistantClass,
    AVOutputSettingsAssistant>)
  end;

  PAVOutputSettingsAssistant = Pointer;

  AVPlayerItemClass = interface(NSObjectClass)
    ['{06ACAB47-702D-430F-A0AD-00D5D55E5A3A}']
    { class } function playerItemWithURL(URL: NSURL)
      : Pointer { instancetype }; cdecl;
    [MethodName('playerItemWithAsset:')]
    { class } function playerItemWithAsset(asset: AVAsset)
      : Pointer { instancetype }; cdecl;
    [MethodName('playerItemWithAsset:automaticallyLoadedAssetKeys:')]
    { class } function playerItemWithAssetAutomaticallyLoadedAssetKeys
      (asset: AVAsset; automaticallyLoadedAssetKeys: NSArray)
      : Pointer { instancetype }; cdecl;
  end;

  AVPlayerItem = interface(NSObject)
    ['{B946AD7F-21FB-49FF-802B-37CAA631096E}']
    function initWithURL(URL: NSURL): Pointer { instancetype }; cdecl;
    [MethodName('initWithAsset:')]
    function initWithAsset(asset: AVAsset): Pointer { instancetype }; cdecl;
    [MethodName('initWithAsset:automaticallyLoadedAssetKeys:')]
    function initWithAssetAutomaticallyLoadedAssetKeys(asset: AVAsset;
      automaticallyLoadedAssetKeys: NSArray): Pointer { instancetype }; cdecl;
    function copyWithZone(zone: Pointer): Pointer; cdecl;
    function copy: Pointer; cdecl;
    function status: AVPlayerItemStatus; cdecl;
    function error: NSError; cdecl;
    function asset: AVAsset; cdecl;
    function tracks: NSArray; cdecl;
    function duration: CMTime; cdecl;
    function presentationSize: CGSize; cdecl;
    function timedMetadata: NSArray; cdecl;
    function automaticallyLoadedAssetKeys: NSArray; cdecl;
    function canPlayFastForward: Boolean; cdecl;
    function canPlaySlowForward: Boolean; cdecl;
    function canPlayReverse: Boolean; cdecl;
    function canPlaySlowReverse: Boolean; cdecl;
    function canPlayFastReverse: Boolean; cdecl;
    function canStepForward: Boolean; cdecl;
    function canStepBackward: Boolean; cdecl;
    procedure setConfiguredTimeOffsetFromLive(configuredTimeOffsetFromLive
      : CMTime); cdecl;
    function configuredTimeOffsetFromLive: CMTime; cdecl;
    function recommendedTimeOffsetFromLive: CMTime; cdecl;
    procedure setAutomaticallyPreservesTimeOffsetFromLive
      (automaticallyPreservesTimeOffsetFromLive: Boolean); cdecl;
    function automaticallyPreservesTimeOffsetFromLive: Boolean; cdecl;
    function currentTime: CMTime; cdecl;
    procedure setForwardPlaybackEndTime(forwardPlaybackEndTime: CMTime); cdecl;
    function forwardPlaybackEndTime: CMTime; cdecl;
    procedure setReversePlaybackEndTime(reversePlaybackEndTime: CMTime); cdecl;
    function reversePlaybackEndTime: CMTime; cdecl;
    function seekableTimeRanges: NSArray; cdecl;
    [MethodName('seekToTime:completionHandler:')]
    procedure seekToTimeCompletionHandler(time: CMTime;
      completionHandler: TAVFoundationCompletionHandler6); cdecl;
    [MethodName('seekToTime:toleranceBefore:toleranceAfter:completionHandler:')]
    procedure seekToTimeToleranceBeforeToleranceAfterCompletionHandler
      (time: CMTime; toleranceBefore: CMTime; toleranceAfter: CMTime;
      completionHandler: TAVFoundationCompletionHandler6); cdecl;
    procedure cancelPendingSeeks; cdecl;
    function currentDate: NSDate; cdecl;
    [MethodName('seekToDate:completionHandler:')]
    function seekToDateCompletionHandler(date: NSDate;
      completionHandler: TAVFoundationCompletionHandler6): Boolean; cdecl;
    procedure stepByCount(stepCount: NSInteger); cdecl;
    function timebase: CMTimebaseRef; cdecl;
    procedure setVideoComposition(videoComposition: AVVideoComposition); cdecl;
    function videoComposition: AVVideoComposition; cdecl;
    function customVideoCompositor: Pointer; cdecl;
    procedure setSeekingWaitsForVideoCompositionRendering
      (seekingWaitsForVideoCompositionRendering: Boolean); cdecl;
    function seekingWaitsForVideoCompositionRendering: Boolean; cdecl;
    procedure setTextStyleRules(textStyleRules: NSArray); cdecl;
    function textStyleRules: NSArray; cdecl;
    procedure setVideoApertureMode(videoApertureMode
      : AVVideoApertureMode); cdecl;
    function videoApertureMode: AVVideoApertureMode; cdecl;
    procedure setAppliesPerFrameHDRDisplayMetadata
      (appliesPerFrameHDRDisplayMetadata: Boolean); cdecl;
    function appliesPerFrameHDRDisplayMetadata: Boolean; cdecl;
    procedure setAudioTimePitchAlgorithm(audioTimePitchAlgorithm
      : AVAudioTimePitchAlgorithm); cdecl;
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
    procedure setAudioSpatializationAllowed(audioSpatializationAllowed
      : Boolean); cdecl;
    function isAudioSpatializationAllowed: Boolean; cdecl;
    procedure setAllowedAudioSpatializationFormats
      (allowedAudioSpatializationFormats: AVAudioSpatializationFormats); cdecl;
    function allowedAudioSpatializationFormats
      : AVAudioSpatializationFormats; cdecl;
    procedure setAudioMix(audioMix: AVAudioMix); cdecl;
    function audioMix: AVAudioMix; cdecl;
    function loadedTimeRanges: NSArray; cdecl;
    function isPlaybackLikelyToKeepUp: Boolean; cdecl;
    function isPlaybackBufferFull: Boolean; cdecl;
    function isPlaybackBufferEmpty: Boolean; cdecl;
    procedure setCanUseNetworkResourcesForLiveStreamingWhilePaused
      (canUseNetworkResourcesForLiveStreamingWhilePaused: Boolean); cdecl;
    function canUseNetworkResourcesForLiveStreamingWhilePaused: Boolean; cdecl;
    procedure setPreferredForwardBufferDuration(preferredForwardBufferDuration
      : NSTimeInterval); cdecl;
    function preferredForwardBufferDuration: NSTimeInterval; cdecl;
    procedure setPreferredPeakBitRate(preferredPeakBitRate: Double); cdecl;
    function preferredPeakBitRate: Double; cdecl;
    procedure setPreferredPeakBitRateForExpensiveNetworks
      (preferredPeakBitRateForExpensiveNetworks: Double); cdecl;
    function preferredPeakBitRateForExpensiveNetworks: Double; cdecl;
    procedure setPreferredMaximumResolution(preferredMaximumResolution
      : CGSize); cdecl;
    function preferredMaximumResolution: CGSize; cdecl;
    procedure setPreferredMaximumResolutionForExpensiveNetworks
      (preferredMaximumResolutionForExpensiveNetworks: CGSize); cdecl;
    function preferredMaximumResolutionForExpensiveNetworks: CGSize; cdecl;
    procedure setStartsOnFirstEligibleVariant(startsOnFirstEligibleVariant
      : Boolean); cdecl;
    function startsOnFirstEligibleVariant: Boolean; cdecl;
    procedure setVariantPreferences(variantPreferences
      : AVVariantPreferences); cdecl;
    function variantPreferences: AVVariantPreferences; cdecl;
    procedure selectMediaOption(mediaSelectionOption: AVMediaSelectionOption;
      inMediaSelectionGroup: AVMediaSelectionGroup); cdecl;
    procedure selectMediaOptionAutomaticallyInMediaSelectionGroup
      (mediaSelectionGroup: AVMediaSelectionGroup); cdecl;
    function currentMediaSelection: AVMediaSelection; cdecl;
    function accessLog: AVPlayerItemAccessLog; cdecl;
    function errorLog: AVPlayerItemErrorLog; cdecl;
    procedure addOutput(output: AVPlayerItemOutput); cdecl;
    procedure removeOutput(output: AVPlayerItemOutput); cdecl;
    function outputs: NSArray; cdecl;
    procedure addMediaDataCollector(collector
      : AVPlayerItemMediaDataCollector); cdecl;
    procedure removeMediaDataCollector(collector
      : AVPlayerItemMediaDataCollector); cdecl;
    function mediaDataCollectors: NSArray; cdecl;
    [MethodName('seekToTime:')]
    procedure seekToTime(time: CMTime); cdecl;
    [MethodName('seekToTime:toleranceBefore:toleranceAfter:')]
    procedure seekToTimeToleranceBeforeToleranceAfter(time: CMTime;
      toleranceBefore: CMTime; toleranceAfter: CMTime); cdecl;
    [MethodName('seekToDate:')]
    function seekToDate(date: NSDate): Boolean; cdecl;
    function selectedMediaOptionInMediaSelectionGroup(mediaSelectionGroup
      : AVMediaSelectionGroup): AVMediaSelectionOption; cdecl;
    procedure setAutomaticallyHandlesInterstitialEvents
      (automaticallyHandlesInterstitialEvents: Boolean); cdecl;
    function automaticallyHandlesInterstitialEvents: Boolean; cdecl;
    function templatePlayerItem: AVPlayerItem; cdecl;
  end;

  TAVPlayerItem = class(TOCGenericImport<AVPlayerItemClass, AVPlayerItem>)
  end;

  PAVPlayerItem = Pointer;

  AVPlaybackCoordinatorClass = interface(NSObjectClass)
    ['{0FEE6F30-B8AD-4F5C-9664-A4B8938F4AC9}']
  end;

  AVPlaybackCoordinator = interface(NSObject)
    ['{4DE56B90-4973-4025-9134-71F390EB1AF0}']
    function otherParticipants: NSArray; cdecl;
    function suspensionReasons: NSArray; cdecl;
    function beginSuspensionForReason(suspensionReason
      : AVCoordinatedPlaybackSuspensionReason)
      : AVCoordinatedPlaybackSuspension; cdecl;
    function expectedItemTimeAtHostTime(hostClockTime: CMTime): CMTime; cdecl;
    procedure setParticipantLimit(participantLimit: NSInteger;
      forWaitingOutSuspensionsWithReason
      : AVCoordinatedPlaybackSuspensionReason); cdecl;
    function participantLimitForWaitingOutSuspensionsWithReason
      (reason: AVCoordinatedPlaybackSuspensionReason): NSInteger; cdecl;
    procedure setSuspensionReasonsThatTriggerWaiting
      (suspensionReasonsThatTriggerWaiting: NSArray); cdecl;
    function suspensionReasonsThatTriggerWaiting: NSArray; cdecl;
    procedure setPauseSnapsToMediaTimeOfOriginator
      (pauseSnapsToMediaTimeOfOriginator: Boolean); cdecl;
    function pauseSnapsToMediaTimeOfOriginator: Boolean; cdecl;
  end;

  TAVPlaybackCoordinator = class(TOCGenericImport<AVPlaybackCoordinatorClass,
    AVPlaybackCoordinator>)
  end;

  PAVPlaybackCoordinator = Pointer;

  AVPlayerPlaybackCoordinatorClass = interface(AVPlaybackCoordinatorClass)
    ['{92E1B49D-2611-451B-BBC7-5231C42E2AC3}']
  end;

  AVPlayerPlaybackCoordinator = interface(AVPlaybackCoordinator)
    ['{B0091DED-59F4-4353-AF63-A019A8D06216}']
    function player: AVPlayer; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
  end;

  TAVPlayerPlaybackCoordinator = class
    (TOCGenericImport<AVPlayerPlaybackCoordinatorClass,
    AVPlayerPlaybackCoordinator>)
  end;

  PAVPlayerPlaybackCoordinator = Pointer;

  AVPlayerClass = interface(NSObjectClass)
    ['{4DFAF1AF-9FD0-4AF9-A36B-7467BBD70218}']
    { class } function playerWithURL(URL: NSURL)
      : Pointer { instancetype }; cdecl;
    { class } function playerWithPlayerItem(item: AVPlayerItem)
      : Pointer { instancetype }; cdecl;
  end;

  AVPlayer = interface(NSObject)
    ['{E8CB1EAB-7975-4E3D-9A46-6B6A75DD46EB}']
    function initWithURL(URL: NSURL): Pointer { instancetype }; cdecl;
    function initWithPlayerItem(item: AVPlayerItem)
      : Pointer { instancetype }; cdecl;
    function status: AVPlayerStatus; cdecl;
    function error: NSError; cdecl;
    [MethodName('setRate:')]
    procedure setRate(rate: Single); cdecl;
    function rate: Single; cdecl;
    procedure setDefaultRate(defaultRate: Single); cdecl;
    function defaultRate: Single; cdecl;
    procedure play; cdecl;
    procedure pause; cdecl;
    function timeControlStatus: AVPlayerTimeControlStatus; cdecl;
    function reasonForWaitingToPlay: AVPlayerWaitingReason; cdecl;
    procedure playImmediatelyAtRate(rate: Single); cdecl;
    function currentItem: AVPlayerItem; cdecl;
    procedure replaceCurrentItemWithPlayerItem(item: AVPlayerItem); cdecl;
    procedure setActionAtItemEnd(actionAtItemEnd
      : AVPlayerActionAtItemEnd); cdecl;
    function actionAtItemEnd: AVPlayerActionAtItemEnd; cdecl;
    function currentTime: CMTime; cdecl;
    [MethodName('seekToDate:')]
    procedure seekToDate(date: NSDate); cdecl;
    [MethodName('seekToDate:completionHandler:')]
    procedure seekToDateCompletionHandler(date: NSDate;
      completionHandler: TAVFoundationCompletionHandler6); cdecl;
    [MethodName('seekToTime:')]
    procedure seekToTime(time: CMTime); cdecl;
    [MethodName('seekToTime:toleranceBefore:toleranceAfter:')]
    procedure seekToTimeToleranceBeforeToleranceAfter(time: CMTime;
      toleranceBefore: CMTime; toleranceAfter: CMTime); cdecl;
    [MethodName('seekToTime:completionHandler:')]
    procedure seekToTimeCompletionHandler(time: CMTime;
      completionHandler: TAVFoundationCompletionHandler6); cdecl;
    [MethodName('seekToTime:toleranceBefore:toleranceAfter:completionHandler:')]
    procedure seekToTimeToleranceBeforeToleranceAfterCompletionHandler
      (time: CMTime; toleranceBefore: CMTime; toleranceAfter: CMTime;
      completionHandler: TAVFoundationCompletionHandler6); cdecl;
    procedure setAutomaticallyWaitsToMinimizeStalling
      (automaticallyWaitsToMinimizeStalling: Boolean); cdecl;
    function automaticallyWaitsToMinimizeStalling: Boolean; cdecl;
    [MethodName('setRate:time:atHostTime:')]
    procedure setRateTimeAtHostTime(rate: Single; time: CMTime;
      atHostTime: CMTime); cdecl;
    procedure prerollAtRate(rate: Single;
      completionHandler: TAVFoundationCompletionHandler6); cdecl;
    procedure cancelPendingPrerolls; cdecl;
    procedure setSourceClock(sourceClock: CMClockRef); cdecl;
    function sourceClock: CMClockRef; cdecl;
    function addPeriodicTimeObserverForInterval(interval: CMTime;
      queue: dispatch_queue_t; usingBlock: TAVFoundationCompletionHandler13)
      : Pointer; cdecl;
    function addBoundaryTimeObserverForTimes(times: NSArray;
      queue: dispatch_queue_t; usingBlock: TAVFoundationCompletionHandler)
      : Pointer; cdecl;
    procedure removeTimeObserver(observer: Pointer); cdecl;
    procedure setVolume(volume: Single); cdecl;
    function volume: Single; cdecl;
    procedure setMuted(muted: Boolean); cdecl;
    function isMuted: Boolean; cdecl;
    procedure setAppliesMediaSelectionCriteriaAutomatically
      (appliesMediaSelectionCriteriaAutomatically: Boolean); cdecl;
    function appliesMediaSelectionCriteriaAutomatically: Boolean; cdecl;
    procedure setMediaSelectionCriteria
      (criteria: AVPlayerMediaSelectionCriteria;
      forMediaCharacteristic: AVMediaCharacteristic); cdecl;
    function mediaSelectionCriteriaForMediaCharacteristic(mediaCharacteristic
      : AVMediaCharacteristic): AVPlayerMediaSelectionCriteria; cdecl;
    procedure setAudioOutputDeviceUniqueID(audioOutputDeviceUniqueID
      : NSString); cdecl;
    function audioOutputDeviceUniqueID: NSString; cdecl;
    procedure setAllowsExternalPlayback(allowsExternalPlayback: Boolean); cdecl;
    function allowsExternalPlayback: Boolean; cdecl;
    function isExternalPlaybackActive: Boolean; cdecl;
    procedure setUsesExternalPlaybackWhileExternalScreenIsActive
      (usesExternalPlaybackWhileExternalScreenIsActive: Boolean); cdecl;
    function usesExternalPlaybackWhileExternalScreenIsActive: Boolean; cdecl;
    procedure setExternalPlaybackVideoGravity(externalPlaybackVideoGravity
      : AVLayerVideoGravity); cdecl;
    function externalPlaybackVideoGravity: AVLayerVideoGravity; cdecl;
    procedure setAllowsAirPlayVideo(allowsAirPlayVideo: Boolean); cdecl;
    function allowsAirPlayVideo: Boolean; cdecl;
    function isAirPlayVideoActive: Boolean; cdecl;
    procedure setUsesAirPlayVideoWhileAirPlayScreenIsActive
      (usesAirPlayVideoWhileAirPlayScreenIsActive: Boolean); cdecl;
    function usesAirPlayVideoWhileAirPlayScreenIsActive: Boolean; cdecl;
    function outputObscuredDueToInsufficientExternalProtection: Boolean; cdecl;
    procedure setAvailableHDRModes(availableHDRModes: AVPlayerHDRMode); cdecl;
    function availableHDRModes: AVPlayerHDRMode; cdecl;
    procedure setEligibleForHDRPlayback(eligibleForHDRPlayback: Boolean); cdecl;
    function eligibleForHDRPlayback: Boolean; cdecl;
    procedure setPreferredVideoDecoderGPURegistryID
      (preferredVideoDecoderGPURegistryID: UInt64); cdecl;
    function preferredVideoDecoderGPURegistryID: UInt64; cdecl;
    procedure setPreventsDisplaySleepDuringVideoPlayback
      (preventsDisplaySleepDuringVideoPlayback: Boolean); cdecl;
    function preventsDisplaySleepDuringVideoPlayback: Boolean; cdecl;
    procedure setAudiovisualBackgroundPlaybackPolicy
      (audiovisualBackgroundPlaybackPolicy
      : AVPlayerAudiovisualBackgroundPlaybackPolicy); cdecl;
    function audiovisualBackgroundPlaybackPolicy
      : AVPlayerAudiovisualBackgroundPlaybackPolicy; cdecl;
    function playbackCoordinator: AVPlayerPlaybackCoordinator; cdecl;
    procedure setClosedCaptionDisplayEnabled(closedCaptionDisplayEnabled
      : Boolean); cdecl;
    function isClosedCaptionDisplayEnabled: Boolean; cdecl;
    procedure setMasterClock(masterClock: CMClockRef); cdecl;
    function masterClock: CMClockRef; cdecl;
  end;

  TAVPlayer = class(TOCGenericImport<AVPlayerClass, AVPlayer>)
  end;

  PAVPlayer = Pointer;

  AVPlayerMediaSelectionCriteriaClass = interface(NSObjectClass)
    ['{096512B5-BC45-4418-99B8-FB364837FBFB}']
  end;

  AVPlayerMediaSelectionCriteria = interface(NSObject)
    ['{2D297EF1-F3DC-4DAA-89BB-28CAB261502B}']
    function preferredLanguages: NSArray; cdecl;
    function preferredMediaCharacteristics: NSArray; cdecl;
    function principalMediaCharacteristics: NSArray; cdecl;
    function initWithPreferredLanguages(preferredLanguages: NSArray;
      preferredMediaCharacteristics: NSArray): Pointer { instancetype }; cdecl;
    function initWithPrincipalMediaCharacteristics(principalMediaCharacteristics
      : NSArray; preferredLanguages: NSArray;
      preferredMediaCharacteristics: NSArray): Pointer { instancetype }; cdecl;
  end;

  TAVPlayerMediaSelectionCriteria = class
    (TOCGenericImport<AVPlayerMediaSelectionCriteriaClass,
    AVPlayerMediaSelectionCriteria>)
  end;

  PAVPlayerMediaSelectionCriteria = Pointer;

  AVQueuePlayerClass = interface(AVPlayerClass)
    ['{8B89C91F-5EB8-4A74-A016-06301F5ABAAA}']
    { class } function queuePlayerWithItems(items: NSArray)
      : Pointer { instancetype }; cdecl;
  end;

  AVQueuePlayer = interface(AVPlayer)
    ['{3CA27DE1-BC89-4590-8953-5591C7211E3D}']
    function initWithItems(items: NSArray): AVQueuePlayer; cdecl;
    function items: NSArray; cdecl;
    procedure advanceToNextItem; cdecl;
    function canInsertItem(item: AVPlayerItem; afterItem: AVPlayerItem)
      : Boolean; cdecl;
    procedure insertItem(item: AVPlayerItem; afterItem: AVPlayerItem); cdecl;
    procedure removeItem(item: AVPlayerItem); cdecl;
    procedure removeAllItems; cdecl;
  end;

  TAVQueuePlayer = class(TOCGenericImport<AVQueuePlayerClass, AVQueuePlayer>)
  end;

  PAVQueuePlayer = Pointer;

  AVCoordinatedPlaybackParticipantClass = interface(NSObjectClass)
    ['{9CA61621-64F4-47D3-8205-E8FDF078180B}']
  end;

  AVCoordinatedPlaybackParticipant = interface(NSObject)
    ['{A1A82D61-D107-4038-B16A-B140F1853904}']
    function suspensionReasons: NSArray; cdecl;
    function isReadyToPlay: Boolean; cdecl;
    function identifier: NSUUID; cdecl;
  end;

  TAVCoordinatedPlaybackParticipant = class
    (TOCGenericImport<AVCoordinatedPlaybackParticipantClass,
    AVCoordinatedPlaybackParticipant>)
  end;

  PAVCoordinatedPlaybackParticipant = Pointer;

  AVCoordinatedPlaybackSuspensionClass = interface(NSObjectClass)
    ['{00817048-0C11-4338-B8A0-B03DB1C4B06C}']
  end;

  AVCoordinatedPlaybackSuspension = interface(NSObject)
    ['{AAEFA36F-9320-4F07-9248-3FB05B3F0DF7}']
    function reason: AVCoordinatedPlaybackSuspensionReason; cdecl;
    function beginDate: NSDate; cdecl;
    procedure &end; cdecl;
    procedure endProposingNewTime(time: CMTime); cdecl;
  end;

  TAVCoordinatedPlaybackSuspension = class
    (TOCGenericImport<AVCoordinatedPlaybackSuspensionClass,
    AVCoordinatedPlaybackSuspension>)
  end;

  PAVCoordinatedPlaybackSuspension = Pointer;

  AVDelegatingPlaybackCoordinatorClass = interface(AVPlaybackCoordinatorClass)
    ['{15563872-8851-4C4D-ACF0-1649B9362165}']
  end;

  AVDelegatingPlaybackCoordinator = interface(AVPlaybackCoordinator)
    ['{CCF38211-1862-4850-A8EA-8AB572113BE3}']
    function initWithPlaybackControlDelegate(playbackControlDelegate: Pointer)
      : Pointer { instancetype }; cdecl;
    function playbackControlDelegate: Pointer; cdecl;
    procedure coordinateRateChangeToRate(rate: Single;
      options: AVDelegatingPlaybackCoordinatorRateChangeOptions); cdecl;
    procedure coordinateSeekToTime(time: CMTime;
      options: AVDelegatingPlaybackCoordinatorSeekOptions); cdecl;
    procedure transitionToItemWithIdentifier(itemIdentifier: NSString;
      proposingInitialTimingBasedOnTimebase: CMTimebaseRef); cdecl;
    function currentItemIdentifier: NSString; cdecl;
    procedure reapplyCurrentItemStateToPlaybackControlDelegate; cdecl;
  end;

  TAVDelegatingPlaybackCoordinator = class
    (TOCGenericImport<AVDelegatingPlaybackCoordinatorClass,
    AVDelegatingPlaybackCoordinator>)
  end;

  PAVDelegatingPlaybackCoordinator = Pointer;

  AVDelegatingPlaybackCoordinatorPlaybackControlCommandClass = interface
    (NSObjectClass)
    ['{3D5B77F7-963C-4129-BC3A-1B7AB22ADF0A}']
  end;

  AVDelegatingPlaybackCoordinatorPlaybackControlCommand = interface(NSObject)
    ['{C123DE31-3D0C-4897-9E87-013840724F04}']
    function originator: AVCoordinatedPlaybackParticipant; cdecl;
    function expectedCurrentItemIdentifier: NSString; cdecl;
  end;

  TAVDelegatingPlaybackCoordinatorPlaybackControlCommand = class
    (TOCGenericImport<
    AVDelegatingPlaybackCoordinatorPlaybackControlCommandClass,
    AVDelegatingPlaybackCoordinatorPlaybackControlCommand>)
  end;

  PAVDelegatingPlaybackCoordinatorPlaybackControlCommand = Pointer;

  AVDelegatingPlaybackCoordinatorPlayCommandClass = interface
    (AVDelegatingPlaybackCoordinatorPlaybackControlCommandClass)
    ['{FDB8E28B-8B67-4D57-A462-149A483E279B}']
  end;

  AVDelegatingPlaybackCoordinatorPlayCommand = interface
    (AVDelegatingPlaybackCoordinatorPlaybackControlCommand)
    ['{E59ADF9F-AB73-4ACD-B148-477D975745F3}']
    function rate: Single; cdecl;
    function itemTime: CMTime; cdecl;
    function hostClockTime: CMTime; cdecl;
  end;

  TAVDelegatingPlaybackCoordinatorPlayCommand = class
    (TOCGenericImport<AVDelegatingPlaybackCoordinatorPlayCommandClass,
    AVDelegatingPlaybackCoordinatorPlayCommand>)
  end;

  PAVDelegatingPlaybackCoordinatorPlayCommand = Pointer;

  AVDelegatingPlaybackCoordinatorPauseCommandClass = interface
    (AVDelegatingPlaybackCoordinatorPlaybackControlCommandClass)
    ['{7FA9DACD-FC09-423D-92E2-25C4B3E08239}']
  end;

  AVDelegatingPlaybackCoordinatorPauseCommand = interface
    (AVDelegatingPlaybackCoordinatorPlaybackControlCommand)
    ['{6F22C999-F734-4EC3-B0AA-5B63F4DB6802}']
    function shouldBufferInAnticipationOfPlayback: Boolean; cdecl;
    function anticipatedPlaybackRate: Single; cdecl;
  end;

  TAVDelegatingPlaybackCoordinatorPauseCommand = class
    (TOCGenericImport<AVDelegatingPlaybackCoordinatorPauseCommandClass,
    AVDelegatingPlaybackCoordinatorPauseCommand>)
  end;

  PAVDelegatingPlaybackCoordinatorPauseCommand = Pointer;

  AVDelegatingPlaybackCoordinatorSeekCommandClass = interface
    (AVDelegatingPlaybackCoordinatorPlaybackControlCommandClass)
    ['{8F2C1F24-5EDA-4A10-8754-0D721704DDCA}']
  end;

  AVDelegatingPlaybackCoordinatorSeekCommand = interface
    (AVDelegatingPlaybackCoordinatorPlaybackControlCommand)
    ['{012B595D-26F3-447F-8420-4F2A7D5D2FAC}']
    function itemTime: CMTime; cdecl;
    function shouldBufferInAnticipationOfPlayback: Boolean; cdecl;
    function anticipatedPlaybackRate: Single; cdecl;
    function completionDueDate: NSDate; cdecl;
  end;

  TAVDelegatingPlaybackCoordinatorSeekCommand = class
    (TOCGenericImport<AVDelegatingPlaybackCoordinatorSeekCommandClass,
    AVDelegatingPlaybackCoordinatorSeekCommand>)
  end;

  PAVDelegatingPlaybackCoordinatorSeekCommand = Pointer;

  AVDelegatingPlaybackCoordinatorBufferingCommandClass = interface
    (AVDelegatingPlaybackCoordinatorPlaybackControlCommandClass)
    ['{29387DE5-544A-4FAA-B684-64417DE8E516}']
  end;

  AVDelegatingPlaybackCoordinatorBufferingCommand = interface
    (AVDelegatingPlaybackCoordinatorPlaybackControlCommand)
    ['{5EA044A0-9327-46C7-A088-50B40BE3C608}']
    function anticipatedPlaybackRate: Single; cdecl;
    function completionDueDate: NSDate; cdecl;
  end;

  TAVDelegatingPlaybackCoordinatorBufferingCommand = class
    (TOCGenericImport<AVDelegatingPlaybackCoordinatorBufferingCommandClass,
    AVDelegatingPlaybackCoordinatorBufferingCommand>)
  end;

  PAVDelegatingPlaybackCoordinatorBufferingCommand = Pointer;

  AVTextStyleRuleClass = interface(NSObjectClass)
    ['{52024A29-9362-454A-9254-B85DFF9F4E11}']
    { class } function propertyListForTextStyleRules(textStyleRules: NSArray)
      : Pointer; cdecl;
    { class } function textStyleRulesFromPropertyList(plist: Pointer)
      : NSArray; cdecl;
    [MethodName('textStyleRuleWithTextMarkupAttributes:')]
    { class } function textStyleRuleWithTextMarkupAttributes
      (textMarkupAttributes: NSDictionary): AVTextStyleRule; cdecl;
    [MethodName('textStyleRuleWithTextMarkupAttributes:textSelector:')]
    { class } function textStyleRuleWithTextMarkupAttributesTextSelector
      (textMarkupAttributes: NSDictionary; textSelector: NSString)
      : AVTextStyleRule; cdecl;
  end;

  AVTextStyleRule = interface(NSObject)
    ['{A9A94BAD-A9B0-4673-86E1-D919968560C4}']
    [MethodName('initWithTextMarkupAttributes:')]
    function initWithTextMarkupAttributes(textMarkupAttributes: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithTextMarkupAttributes:textSelector:')]
    function initWithTextMarkupAttributesTextSelector(textMarkupAttributes
      : NSDictionary; textSelector: NSString): Pointer { instancetype }; cdecl;
    function textMarkupAttributes: NSDictionary; cdecl;
    function textSelector: NSString; cdecl;
  end;

  TAVTextStyleRule = class(TOCGenericImport<AVTextStyleRuleClass,
    AVTextStyleRule>)
  end;

  PAVTextStyleRule = Pointer;

  AVPlayerItemAccessLogClass = interface(NSObjectClass)
    ['{E47549EF-4BBD-4064-A57E-48B9874543BC}']
  end;

  AVPlayerItemAccessLog = interface(NSObject)
    ['{5D62625B-A171-4958-BB71-63E3E0BE78B3}']
    function extendedLogData: NSData; cdecl;
    function extendedLogDataStringEncoding: NSStringEncoding; cdecl;
    function events: NSArray; cdecl;
  end;

  TAVPlayerItemAccessLog = class(TOCGenericImport<AVPlayerItemAccessLogClass,
    AVPlayerItemAccessLog>)
  end;

  PAVPlayerItemAccessLog = Pointer;

  AVPlayerItemErrorLogClass = interface(NSObjectClass)
    ['{CEC69730-85CC-42E8-955E-F46AE6FF6B74}']
  end;

  AVPlayerItemErrorLog = interface(NSObject)
    ['{CCAC107B-FC52-4033-B334-37DBAD0BEA9D}']
    function extendedLogData: NSData; cdecl;
    function extendedLogDataStringEncoding: NSStringEncoding; cdecl;
    function events: NSArray; cdecl;
  end;

  TAVPlayerItemErrorLog = class(TOCGenericImport<AVPlayerItemErrorLogClass,
    AVPlayerItemErrorLog>)
  end;

  PAVPlayerItemErrorLog = Pointer;

  AVPlayerItemOutputClass = interface(NSObjectClass)
    ['{CA5FD28E-DE12-4C5E-B959-8C704DD81596}']
  end;

  AVPlayerItemOutput = interface(NSObject)
    ['{C6C6699C-3F05-4C38-97F6-9951FC8BF039}']
    function itemTimeForHostTime(hostTimeInSeconds: CFTimeInterval)
      : CMTime; cdecl;
    function itemTimeForMachAbsoluteTime(machAbsoluteTime: Int64)
      : CMTime; cdecl;
    procedure setSuppressesPlayerRendering(suppressesPlayerRendering
      : Boolean); cdecl;
    function suppressesPlayerRendering: Boolean; cdecl;
  end;

  TAVPlayerItemOutput = class(TOCGenericImport<AVPlayerItemOutputClass,
    AVPlayerItemOutput>)
  end;

  PAVPlayerItemOutput = Pointer;

  AVPlayerItemMediaDataCollectorClass = interface(NSObjectClass)
    ['{448DF4CF-C6DE-43C2-A1EC-A998022CC74B}']
  end;

  AVPlayerItemMediaDataCollector = interface(NSObject)
    ['{1702BBD6-F39B-428D-8EA1-B80141645DEE}']
  end;

  TAVPlayerItemMediaDataCollector = class
    (TOCGenericImport<AVPlayerItemMediaDataCollectorClass,
    AVPlayerItemMediaDataCollector>)
  end;

  PAVPlayerItemMediaDataCollector = Pointer;

  AVPlayerItemAccessLogEventClass = interface(NSObjectClass)
    ['{C2E8BA99-664A-48A4-8E59-F9CBA721ECF8}']
  end;

  AVPlayerItemAccessLogEvent = interface(NSObject)
    ['{C83EF5EB-FFC9-4791-9E84-D4FA0E2C796F}']
    function numberOfSegmentsDownloaded: NSInteger; cdecl;
    function numberOfMediaRequests: NSInteger; cdecl;
    function playbackStartDate: NSDate; cdecl;
    function URI: NSString; cdecl;
    function serverAddress: NSString; cdecl;
    function numberOfServerAddressChanges: NSInteger; cdecl;
    function playbackSessionID: NSString; cdecl;
    function playbackStartOffset: NSTimeInterval; cdecl;
    function segmentsDownloadedDuration: NSTimeInterval; cdecl;
    function durationWatched: NSTimeInterval; cdecl;
    function numberOfStalls: NSInteger; cdecl;
    function numberOfBytesTransferred: Int64; cdecl;
    function transferDuration: NSTimeInterval; cdecl;
    function observedBitrate: Double; cdecl;
    function indicatedBitrate: Double; cdecl;
    function indicatedAverageBitrate: Double; cdecl;
    function averageVideoBitrate: Double; cdecl;
    function averageAudioBitrate: Double; cdecl;
    function numberOfDroppedVideoFrames: NSInteger; cdecl;
    function startupTime: NSTimeInterval; cdecl;
    function downloadOverdue: NSInteger; cdecl;
    function observedMaxBitrate: Double; cdecl;
    function observedMinBitrate: Double; cdecl;
    function observedBitrateStandardDeviation: Double; cdecl;
    function playbackType: NSString; cdecl;
    function mediaRequestsWWAN: NSInteger; cdecl;
    function switchBitrate: Double; cdecl;
  end;

  TAVPlayerItemAccessLogEvent = class
    (TOCGenericImport<AVPlayerItemAccessLogEventClass,
    AVPlayerItemAccessLogEvent>)
  end;

  PAVPlayerItemAccessLogEvent = Pointer;

  AVPlayerItemErrorLogEventClass = interface(NSObjectClass)
    ['{A7AA4A26-03FD-4C5D-BB28-4F8B5A6CA41B}']
  end;

  AVPlayerItemErrorLogEvent = interface(NSObject)
    ['{DAA42239-C0B8-444A-A7B4-F8E2124F8839}']
    function date: NSDate; cdecl;
    function URI: NSString; cdecl;
    function serverAddress: NSString; cdecl;
    function playbackSessionID: NSString; cdecl;
    function errorStatusCode: NSInteger; cdecl;
    function errorDomain: NSString; cdecl;
    function errorComment: NSString; cdecl;
  end;

  TAVPlayerItemErrorLogEvent = class
    (TOCGenericImport<AVPlayerItemErrorLogEventClass,
    AVPlayerItemErrorLogEvent>)
  end;

  PAVPlayerItemErrorLogEvent = Pointer;

  AVPlayerItemMetadataCollectorClass = interface
    (AVPlayerItemMediaDataCollectorClass)
    ['{81D0FD01-5DEC-4C54-9D75-8E71A2ADE08E}']
  end;

  AVPlayerItemMetadataCollector = interface(AVPlayerItemMediaDataCollector)
    ['{7ABFCD60-36A1-45F7-AEFD-FED9004189DC}']
    function initWithIdentifiers(identifiers: NSArray;
      classifyingLabels: NSArray): Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer; queue: dispatch_queue_t); cdecl;
    function delegate: Pointer; cdecl;
    function delegateQueue: dispatch_queue_t; cdecl;
  end;

  TAVPlayerItemMetadataCollector = class
    (TOCGenericImport<AVPlayerItemMetadataCollectorClass,
    AVPlayerItemMetadataCollector>)
  end;

  PAVPlayerItemMetadataCollector = Pointer;

  AVPlayerItemVideoOutputClass = interface(AVPlayerItemOutputClass)
    ['{F8F7831E-A561-4D25-B8F1-8383622444EC}']
  end;

  AVPlayerItemVideoOutput = interface(AVPlayerItemOutput)
    ['{F556E9B3-AD56-425A-AA5F-6846116EF95E}']
    function initWithPixelBufferAttributes(pixelBufferAttributes: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function initWithOutputSettings(outputSettings: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function hasNewPixelBufferForItemTime(itemTime: CMTime): Boolean; cdecl;
    function copyPixelBufferForItemTime(itemTime: CMTime;
      itemTimeForDisplay: PCMTime): CVPixelBufferRef; cdecl;
    procedure setDelegate(delegate: Pointer; queue: dispatch_queue_t); cdecl;
    procedure requestNotificationOfMediaDataChangeWithAdvanceInterval
      (interval: NSTimeInterval); cdecl;
    function delegate: Pointer; cdecl;
    function delegateQueue: dispatch_queue_t; cdecl;
  end;

  TAVPlayerItemVideoOutput = class
    (TOCGenericImport<AVPlayerItemVideoOutputClass, AVPlayerItemVideoOutput>)
  end;

  PAVPlayerItemVideoOutput = Pointer;

  AVPlayerItemLegibleOutputClass = interface(AVPlayerItemOutputClass)
    ['{80ACFE67-BD70-4090-8AD1-B06588943F67}']
  end;

  AVPlayerItemLegibleOutput = interface(AVPlayerItemOutput)
    ['{875B6D96-A739-49AA-9A34-9BB9AADA28A6}']
    procedure setDelegate(delegate: Pointer; queue: dispatch_queue_t); cdecl;
    function delegate: Pointer; cdecl;
    function delegateQueue: dispatch_queue_t; cdecl;
    procedure setAdvanceIntervalForDelegateInvocation
      (advanceIntervalForDelegateInvocation: NSTimeInterval); cdecl;
    function advanceIntervalForDelegateInvocation: NSTimeInterval; cdecl;
    function initWithMediaSubtypesForNativeRepresentation(subtypes: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setTextStylingResolution(textStylingResolution
      : AVPlayerItemLegibleOutputTextStylingResolution); cdecl;
    function textStylingResolution
      : AVPlayerItemLegibleOutputTextStylingResolution; cdecl;
  end;

  TAVPlayerItemLegibleOutput = class
    (TOCGenericImport<AVPlayerItemLegibleOutputClass,
    AVPlayerItemLegibleOutput>)
  end;

  PAVPlayerItemLegibleOutput = Pointer;

  AVPlayerItemMetadataOutputClass = interface(AVPlayerItemOutputClass)
    ['{B648AF93-9295-4B12-AC3D-BC82DC1088FD}']
  end;

  AVPlayerItemMetadataOutput = interface(AVPlayerItemOutput)
    ['{A0D42F8D-C4AC-45E0-A8C9-5738D8D6F22B}']
    function initWithIdentifiers(identifiers: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer; queue: dispatch_queue_t); cdecl;
    function delegate: Pointer; cdecl;
    function delegateQueue: dispatch_queue_t; cdecl;
    procedure setAdvanceIntervalForDelegateInvocation
      (advanceIntervalForDelegateInvocation: NSTimeInterval); cdecl;
    function advanceIntervalForDelegateInvocation: NSTimeInterval; cdecl;
  end;

  TAVPlayerItemMetadataOutput = class
    (TOCGenericImport<AVPlayerItemMetadataOutputClass,
    AVPlayerItemMetadataOutput>)
  end;

  PAVPlayerItemMetadataOutput = Pointer;

  AVPlayerLayerClass = interface(CALayerClass)
    ['{6A84E13C-E948-4DD3-9099-57EA6389809A}']
    { class } function playerLayerWithPlayer(player: AVPlayer)
      : AVPlayerLayer; cdecl;
  end;

  AVPlayerLayer = interface(CALayer)
    ['{C5FA8688-91C9-4188-9E6E-2436C739D34E}']
    procedure setPlayer(player: AVPlayer); cdecl;
    function player: AVPlayer; cdecl;
    procedure setVideoGravity(videoGravity: AVLayerVideoGravity); cdecl;
    function videoGravity: AVLayerVideoGravity; cdecl;
    function isReadyForDisplay: Boolean; cdecl;
    function videoRect: CGRect; cdecl;
    procedure setPixelBufferAttributes(pixelBufferAttributes
      : NSDictionary); cdecl;
    function pixelBufferAttributes: NSDictionary; cdecl;
    function copyDisplayedPixelBuffer: CVPixelBufferRef; cdecl;
  end;

  TAVPlayerLayer = class(TOCGenericImport<AVPlayerLayerClass, AVPlayerLayer>)
  end;

  PAVPlayerLayer = Pointer;

  AVPlayerLooperClass = interface(NSObjectClass)
    ['{C6A4A461-6AF1-4723-B921-12DDD4853A87}']
    [MethodName('playerLooperWithPlayer:templateItem:timeRange:')]
    { class } function playerLooperWithPlayerTemplateItemTimeRange
      (player: AVQueuePlayer; templateItem: AVPlayerItem;
      timeRange: CMTimeRange): Pointer { instancetype }; cdecl;
    [MethodName('playerLooperWithPlayer:templateItem:')]
    { class } function playerLooperWithPlayerTemplateItem(player: AVQueuePlayer;
      templateItem: AVPlayerItem): Pointer { instancetype }; cdecl;
  end;

  AVPlayerLooper = interface(NSObject)
    ['{18E947F6-2C53-43D7-8955-A9BEF2EF418C}']
    function initWithPlayer(player: AVQueuePlayer; templateItem: AVPlayerItem;
      timeRange: CMTimeRange): Pointer { instancetype }; cdecl;
    function status: AVPlayerLooperStatus; cdecl;
    function error: NSError; cdecl;
    procedure disableLooping; cdecl;
    function loopCount: NSInteger; cdecl;
    function loopingPlayerItems: NSArray; cdecl;
  end;

  TAVPlayerLooper = class(TOCGenericImport<AVPlayerLooperClass, AVPlayerLooper>)
  end;

  PAVPlayerLooper = Pointer;

  AVPlayerInterstitialEventClass = interface(NSObjectClass)
    ['{3AE0546F-EE25-4561-924A-F1C0B57689C0}']
    [MethodName
      ('interstitialEventWithPrimaryItem:identifier:time:templateItems:restrictions:resumptionOffset:playoutLimit:userDefinedAttributes:')
      ]
    { class } function
      interstitialEventWithPrimaryItemIdentifierTimeTemplateItemsRestrictionsResumptionOffsetPlayoutLimitUserDefinedAttributes
      (primaryItem: AVPlayerItem; identifier: NSString; time: CMTime;
      templateItems: NSArray;
      restrictions: AVPlayerInterstitialEventRestrictions;
      resumptionOffset: CMTime; playoutLimit: CMTime;
      userDefinedAttributes: NSDictionary): Pointer { instancetype }; cdecl;
    [MethodName
      ('interstitialEventWithPrimaryItem:identifier:date:templateItems:restrictions:resumptionOffset:playoutLimit:userDefinedAttributes:')
      ]
    { class } function
      interstitialEventWithPrimaryItemIdentifierDateTemplateItemsRestrictionsResumptionOffsetPlayoutLimitUserDefinedAttributes
      (primaryItem: AVPlayerItem; identifier: NSString; date: NSDate;
      templateItems: NSArray;
      restrictions: AVPlayerInterstitialEventRestrictions;
      resumptionOffset: CMTime; playoutLimit: CMTime;
      userDefinedAttributes: NSDictionary): Pointer { instancetype }; cdecl;
    [MethodName('interstitialEventWithPrimaryItem:time:')]
    { class } function interstitialEventWithPrimaryItemTime
      (primaryItem: AVPlayerItem; time: CMTime)
      : Pointer { instancetype }; cdecl;
    [MethodName('interstitialEventWithPrimaryItem:date:')]
    { class } function interstitialEventWithPrimaryItemDate
      (primaryItem: AVPlayerItem; date: NSDate)
      : Pointer { instancetype }; cdecl;
  end;

  AVPlayerInterstitialEvent = interface(NSObject)
    ['{54F3A1F4-7363-43C3-801A-82194ACF837E}']
    function primaryItem: AVPlayerItem; cdecl;
    function identifier: NSString; cdecl;
    function time: CMTime; cdecl;
    function date: NSDate; cdecl;
    function templateItems: NSArray; cdecl;
    function restrictions: AVPlayerInterstitialEventRestrictions; cdecl;
    function resumptionOffset: CMTime; cdecl;
    function playoutLimit: CMTime; cdecl;
    function alignsStartWithPrimarySegmentBoundary: Boolean; cdecl;
    function alignsResumptionWithPrimarySegmentBoundary: Boolean; cdecl;
    function cue: AVPlayerInterstitialEventCue; cdecl;
    function willPlayOnce: Boolean; cdecl;
    function userDefinedAttributes: NSDictionary; cdecl;
    function assetListResponse: NSDictionary; cdecl;
    procedure setPrimaryItem(primaryItem: AVPlayerItem); cdecl;
    procedure setIdentifier(identifier: NSString); cdecl;
    procedure setTime(time: CMTime); cdecl;
    procedure setDate(date: NSDate); cdecl;
    procedure setTemplateItems(templateItems: NSArray); cdecl;
    procedure setRestrictions(restrictions
      : AVPlayerInterstitialEventRestrictions); cdecl;
    procedure setResumptionOffset(resumptionOffset: CMTime); cdecl;
    procedure setPlayoutLimit(playoutLimit: CMTime); cdecl;
    procedure setAlignsStartWithPrimarySegmentBoundary
      (alignsStartWithPrimarySegmentBoundary: Boolean); cdecl;
    procedure setAlignsResumptionWithPrimarySegmentBoundary
      (alignsResumptionWithPrimarySegmentBoundary: Boolean); cdecl;
    procedure setCue(cue: AVPlayerInterstitialEventCue); cdecl;
    procedure setWillPlayOnce(willPlayOnce: Boolean); cdecl;
    procedure setUserDefinedAttributes(userDefinedAttributes
      : NSDictionary); cdecl;
  end;

  TAVPlayerInterstitialEvent = class
    (TOCGenericImport<AVPlayerInterstitialEventClass,
    AVPlayerInterstitialEvent>)
  end;

  PAVPlayerInterstitialEvent = Pointer;

  AVPlayerInterstitialEventMonitorClass = interface(NSObjectClass)
    ['{B7B6DF62-C673-40D0-AF5B-5CAA2084D20B}']
    { class } function interstitialEventMonitorWithPrimaryPlayer
      (primaryPlayer: AVPlayer): Pointer { instancetype }; cdecl;
  end;

  AVPlayerInterstitialEventMonitor = interface(NSObject)
    ['{F32EF585-AB24-4357-9350-26ACED40D9B4}']
    function initWithPrimaryPlayer(primaryPlayer: AVPlayer)
      : Pointer { instancetype }; cdecl;
    function primaryPlayer: AVPlayer; cdecl;
    function interstitialPlayer: AVQueuePlayer; cdecl;
    function events: NSArray; cdecl;
    function currentEvent: AVPlayerInterstitialEvent; cdecl;
  end;

  TAVPlayerInterstitialEventMonitor = class
    (TOCGenericImport<AVPlayerInterstitialEventMonitorClass,
    AVPlayerInterstitialEventMonitor>)
  end;

  PAVPlayerInterstitialEventMonitor = Pointer;

  AVPlayerInterstitialEventControllerClass = interface
    (AVPlayerInterstitialEventMonitorClass)
    ['{95D4FFB6-D8FB-4A3D-9918-5161418DF164}']
    { class } function interstitialEventControllerWithPrimaryPlayer
      (primaryPlayer: AVPlayer): Pointer { instancetype }; cdecl;
  end;

  AVPlayerInterstitialEventController = interface
    (AVPlayerInterstitialEventMonitor)
    ['{FD45F6A3-B5F1-4111-AAF4-3D727C3ECDD8}']
    function initWithPrimaryPlayer(primaryPlayer: AVPlayer)
      : Pointer { instancetype }; cdecl;
    procedure setEvents(events: NSArray); cdecl;
    function events: NSArray; cdecl;
    procedure cancelCurrentEventWithResumptionOffset(resumptionOffset
      : CMTime); cdecl;
  end;

  TAVPlayerInterstitialEventController = class
    (TOCGenericImport<AVPlayerInterstitialEventControllerClass,
    AVPlayerInterstitialEventController>)
  end;

  PAVPlayerInterstitialEventController = Pointer;

  AVRouteDetectorClass = interface(NSObjectClass)
    ['{55560BA8-50C3-434A-9136-7057B9DDBC6D}']
  end;

  AVRouteDetector = interface(NSObject)
    ['{AC762212-F48B-4B1C-BDAD-8C55E66B1B64}']
    procedure setRouteDetectionEnabled(routeDetectionEnabled: Boolean); cdecl;
    function isRouteDetectionEnabled: Boolean; cdecl;
    function multipleRoutesDetected: Boolean; cdecl;
    procedure setDetectsCustomRoutes(detectsCustomRoutes: Boolean); cdecl;
    function detectsCustomRoutes: Boolean; cdecl;
  end;

  TAVRouteDetector = class(TOCGenericImport<AVRouteDetectorClass,
    AVRouteDetector>)
  end;

  PAVRouteDetector = Pointer;

  AVSampleBufferAudioRendererClass = interface(NSObjectClass)
    ['{CB4BA05D-B3B6-4500-8E5D-58E81813AADC}']
  end;

  AVSampleBufferAudioRenderer = interface(NSObject)
    ['{018AB8A4-4447-4B46-BA3A-365D525A466E}']
    function status: AVQueuedSampleBufferRenderingStatus; cdecl;
    function error: NSError; cdecl;
    procedure setAudioOutputDeviceUniqueID(audioOutputDeviceUniqueID
      : NSString); cdecl;
    function audioOutputDeviceUniqueID: NSString; cdecl;
    procedure setAudioTimePitchAlgorithm(audioTimePitchAlgorithm
      : AVAudioTimePitchAlgorithm); cdecl;
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
    procedure setAllowedAudioSpatializationFormats
      (allowedAudioSpatializationFormats: AVAudioSpatializationFormats); cdecl;
    function allowedAudioSpatializationFormats
      : AVAudioSpatializationFormats; cdecl;
    procedure setVolume(volume: Single); cdecl;
    function volume: Single; cdecl;
    procedure setMuted(muted: Boolean); cdecl;
    function isMuted: Boolean; cdecl;
    procedure flushFromSourceTime(time: CMTime;
      completionHandler: TAVFoundationCompletionHandler6); cdecl;
  end;

  TAVSampleBufferAudioRenderer = class
    (TOCGenericImport<AVSampleBufferAudioRendererClass,
    AVSampleBufferAudioRenderer>)
  end;

  PAVSampleBufferAudioRenderer = Pointer;

  AVSampleBufferDisplayLayerClass = interface(CALayerClass)
    ['{BE6AAFC0-B911-4846-8DE4-52157D312357}']
  end;

  AVSampleBufferDisplayLayer = interface(CALayer)
    ['{BA26F183-14AE-4D16-A93A-3532DC1D4909}']
    procedure setControlTimebase(controlTimebase: CMTimebaseRef); cdecl;
    function controlTimebase: CMTimebaseRef; cdecl;
    procedure setVideoGravity(videoGravity: AVLayerVideoGravity); cdecl;
    function videoGravity: AVLayerVideoGravity; cdecl;
    function status: AVQueuedSampleBufferRenderingStatus; cdecl;
    function error: NSError; cdecl;
    procedure enqueueSampleBuffer(sampleBuffer: CMSampleBufferRef); cdecl;
    procedure flush; cdecl;
    procedure flushAndRemoveImage; cdecl;
    function requiresFlushToResumeDecoding: Boolean; cdecl;
    function isReadyForMoreMediaData: Boolean; cdecl;
    procedure requestMediaDataWhenReadyOnQueue(queue: dispatch_queue_t;
      usingBlock: TAVFoundationCompletionHandler); cdecl;
    procedure stopRequestingMediaData; cdecl;
    procedure setPreventsCapture(preventsCapture: Boolean); cdecl;
    function preventsCapture: Boolean; cdecl;
    procedure setPreventsDisplaySleepDuringVideoPlayback
      (preventsDisplaySleepDuringVideoPlayback: Boolean); cdecl;
    function preventsDisplaySleepDuringVideoPlayback: Boolean; cdecl;
    function outputObscuredDueToInsufficientExternalProtection: Boolean; cdecl;
  end;

  TAVSampleBufferDisplayLayer = class
    (TOCGenericImport<AVSampleBufferDisplayLayerClass,
    AVSampleBufferDisplayLayer>)
  end;

  PAVSampleBufferDisplayLayer = Pointer;

  AVSampleBufferRenderSynchronizerClass = interface(NSObjectClass)
    ['{1F109F15-A09C-4508-A066-614EED259609}']
  end;

  AVSampleBufferRenderSynchronizer = interface(NSObject)
    ['{5D0A17A9-559B-478C-9ACF-285F1A6CF106}']
    function timebase: CMTimebaseRef; cdecl;
    [MethodName('setRate:')]
    procedure setRate(rate: Single); cdecl;
    function rate: Single; cdecl;
    function currentTime: CMTime; cdecl;
    [MethodName('setRate:time:')]
    procedure setRateTime(rate: Single; time: CMTime); cdecl;
    [MethodName('setRate:time:atHostTime:')]
    procedure setRateTimeAtHostTime(rate: Single; time: CMTime;
      atHostTime: CMTime); cdecl;
    procedure setDelaysRateChangeUntilHasSufficientMediaData
      (delaysRateChangeUntilHasSufficientMediaData: Boolean); cdecl;
    function delaysRateChangeUntilHasSufficientMediaData: Boolean; cdecl;
    function renderers: NSArray; cdecl;
    procedure addRenderer(renderer: Pointer); cdecl;
    procedure removeRenderer(renderer: Pointer; atTime: CMTime;
      completionHandler: TAVFoundationCompletionHandler6); cdecl;
    function addPeriodicTimeObserverForInterval(interval: CMTime;
      queue: dispatch_queue_t; usingBlock: TAVFoundationCompletionHandler13)
      : Pointer; cdecl;
    function addBoundaryTimeObserverForTimes(times: NSArray;
      queue: dispatch_queue_t; usingBlock: TAVFoundationCompletionHandler)
      : Pointer; cdecl;
    procedure removeTimeObserver(observer: Pointer); cdecl;
  end;

  TAVSampleBufferRenderSynchronizer = class
    (TOCGenericImport<AVSampleBufferRenderSynchronizerClass,
    AVSampleBufferRenderSynchronizer>)
  end;

  PAVSampleBufferRenderSynchronizer = Pointer;

  AVSampleBufferRequestClass = interface(NSObjectClass)
    ['{B95A36B8-4311-4FF7-BAEB-1FA2808A48AC}']
  end;

  AVSampleBufferRequest = interface(NSObject)
    ['{51D488EF-1C47-4D1A-B74B-9D4F97FA41AD}']
    function initWithStartCursor(startCursor: AVSampleCursor)
      : Pointer { instancetype }; cdecl;
    function startCursor: AVSampleCursor; cdecl;
    procedure setDirection(direction: AVSampleBufferRequestDirection); cdecl;
    function direction: AVSampleBufferRequestDirection; cdecl;
    procedure setLimitCursor(limitCursor: AVSampleCursor); cdecl;
    function limitCursor: AVSampleCursor; cdecl;
    procedure setPreferredMinSampleCount(preferredMinSampleCount
      : NSInteger); cdecl;
    function preferredMinSampleCount: NSInteger; cdecl;
    procedure setMaxSampleCount(maxSampleCount: NSInteger); cdecl;
    function maxSampleCount: NSInteger; cdecl;
    procedure setMode(mode: AVSampleBufferRequestMode); cdecl;
    function mode: AVSampleBufferRequestMode; cdecl;
    procedure setOverrideTime(overrideTime: CMTime); cdecl;
    function overrideTime: CMTime; cdecl;
  end;

  TAVSampleBufferRequest = class(TOCGenericImport<AVSampleBufferRequestClass,
    AVSampleBufferRequest>)
  end;

  PAVSampleBufferRequest = Pointer;

  AVSampleBufferGeneratorBatchClass = interface(NSObjectClass)
    ['{05FAAD1E-8296-4CE2-A266-CAFD5583896D}']
  end;

  AVSampleBufferGeneratorBatch = interface(NSObject)
    ['{6B14E7E6-A23A-4063-9B6D-10DF8969EB02}']
    procedure makeDataReadyWithCompletionHandler(completionHandler
      : TAVFoundationCompletionHandler16); cdecl;
    procedure cancel; cdecl;
  end;

  TAVSampleBufferGeneratorBatch = class
    (TOCGenericImport<AVSampleBufferGeneratorBatchClass,
    AVSampleBufferGeneratorBatch>)
  end;

  PAVSampleBufferGeneratorBatch = Pointer;

  AVSampleBufferGeneratorClass = interface(NSObjectClass)
    ['{57519E45-0384-4250-A0D0-C96995B0DADA}']
    { class } procedure notifyOfDataReadyForSampleBuffer
      (sbuf: CMSampleBufferRef;
      completionHandler: TAVFoundationCompletionHandler11); cdecl;
  end;

  AVSampleBufferGenerator = interface(NSObject)
    ['{0EAAF0C7-4A68-42BA-8F72-7A6D1208A561}']
    function initWithAsset(asset: AVAsset; timebase: CMTimebaseRef)
      : Pointer { instancetype }; cdecl;
    [MethodName('createSampleBufferForRequest:error:')]
    function createSampleBufferForRequestError(request: AVSampleBufferRequest;
      error: NSError): CMSampleBufferRef; cdecl;
    [MethodName('createSampleBufferForRequest:')]
    function createSampleBufferForRequest(request: AVSampleBufferRequest)
      : CMSampleBufferRef; cdecl;
    function makeBatch: AVSampleBufferGeneratorBatch; cdecl;
    [MethodName('createSampleBufferForRequest:addingToBatch:error:')]
    function createSampleBufferForRequestAddingToBatchError
      (request: AVSampleBufferRequest;
      addingToBatch: AVSampleBufferGeneratorBatch; error: NSError)
      : CMSampleBufferRef; cdecl;
  end;

  TAVSampleBufferGenerator = class
    (TOCGenericImport<AVSampleBufferGeneratorClass, AVSampleBufferGenerator>)
  end;

  PAVSampleBufferGenerator = Pointer;

  AVSynchronizedLayerClass = interface(CALayerClass)
    ['{88CC1D9B-8DCA-4337-B3BB-DF428F253F58}']
    { class } function synchronizedLayerWithPlayerItem(playerItem: AVPlayerItem)
      : AVSynchronizedLayer; cdecl;
  end;

  AVSynchronizedLayer = interface(CALayer)
    ['{17E30D41-4F78-4C6B-BFF0-EB08D241198B}']
    procedure setPlayerItem(playerItem: AVPlayerItem); cdecl;
    function playerItem: AVPlayerItem; cdecl;
  end;

  TAVSynchronizedLayer = class(TOCGenericImport<AVSynchronizedLayerClass,
    AVSynchronizedLayer>)
  end;

  PAVSynchronizedLayer = Pointer;

  NSValueAVFoundationExtensions = interface(IObjectiveC)
    ['{FD390D0B-1ED1-42AE-BB7F-EDC82E3B0795}']
    function valueWithCMTime(time: CMTime): NSValue; cdecl;
    function CMTimeValue: CMTime; cdecl;
    function valueWithCMTimeRange(timeRange: CMTimeRange): NSValue; cdecl;
    function CMTimeRangeValue: CMTimeRange; cdecl;
    function valueWithCMTimeMapping(timeMapping: CMTimeMapping): NSValue; cdecl;
    function CMTimeMappingValue: CMTimeMapping; cdecl;
  end;

  AVTimeCoding = interface(IObjectiveC)
    ['{96A42F79-7B16-484E-BDDD-A43342F89109}']
    procedure encodeCMTime(time: CMTime; forKey: NSString); cdecl;
    function decodeCMTimeForKey(key: NSString): CMTime; cdecl;
    procedure encodeCMTimeRange(timeRange: CMTimeRange;
      forKey: NSString); cdecl;
    function decodeCMTimeRangeForKey(key: NSString): CMTimeRange; cdecl;
    procedure encodeCMTimeMapping(timeMapping: CMTimeMapping;
      forKey: NSString); cdecl;
    function decodeCMTimeMappingForKey(key: NSString): CMTimeMapping; cdecl;
  end;

  NSValueCMVideoDimensionsExtensions = interface(IObjectiveC)
    ['{F37B0042-EF85-4226-BAB1-0639F72DD7A7}']
    function valueWithCMVideoDimensions(dimensions: CMVideoDimensions)
      : NSValue; cdecl;
    function CMVideoDimensionsValue: CMVideoDimensions; cdecl;
  end;

  // ===== Protocol declarations =====

  AVAsynchronousKeyValueLoading = interface(IObjectiveC)
    ['{30B60C34-8E7E-427E-8425-65FDCD84D518}']
    function statusOfValueForKey(key: NSString; error: NSError)
      : AVKeyValueStatus; cdecl;
    procedure loadValuesAsynchronouslyForKeys(keys: NSArray;
      completionHandler: TAVFoundationCompletionHandler); cdecl;
  end;

  AVContentKeyRecipient = interface(IObjectiveC)
    ['{EAC3E44B-CA51-49A1-9F8E-CADE0A4F86B3}']
    procedure contentKeySession(contentKeySession: AVContentKeySession;
      didProvideContentKey: AVContentKey); cdecl;
    function mayRequireContentKeysForMediaDataProcessing: Boolean; cdecl;
  end;

  AVContentKeySessionDelegate = interface(IObjectiveC)
    ['{B81444BE-12C5-4664-900E-7E5D18A89A7E}']
    [MethodName('contentKeySession:didProvideContentKeyRequest:')]
    procedure contentKeySessionDidProvideContentKeyRequest
      (session: AVContentKeySession;
      didProvideContentKeyRequest: AVContentKeyRequest); cdecl;
    [MethodName('contentKeySession:didProvideRenewingContentKeyRequest:')]
    procedure contentKeySessionDidProvideRenewingContentKeyRequest
      (session: AVContentKeySession; didProvideRenewingContentKeyRequest
      : AVContentKeyRequest); cdecl;
    [MethodName('contentKeySession:didProvidePersistableContentKeyRequest:')]
    procedure contentKeySessionDidProvidePersistableContentKeyRequest
      (session: AVContentKeySession; didProvidePersistableContentKeyRequest
      : AVPersistableContentKeyRequest); cdecl;
    [MethodName
      ('contentKeySession:didUpdatePersistableContentKey:forContentKeyIdentifier:')
      ]
    procedure contentKeySessionDidUpdatePersistableContentKeyForContentKeyIdentifier
      (session: AVContentKeySession; didUpdatePersistableContentKey: NSData;
      forContentKeyIdentifier: Pointer); cdecl;
    [MethodName('contentKeySession:contentKeyRequest:didFailWithError:')]
    procedure contentKeySessionContentKeyRequestDidFailWithError
      (session: AVContentKeySession; contentKeyRequest: AVContentKeyRequest;
      didFailWithError: NSError); cdecl;
    [MethodName('contentKeySession:shouldRetryContentKeyRequest:reason:')]
    function contentKeySessionShouldRetryContentKeyRequestReason
      (session: AVContentKeySession;
      shouldRetryContentKeyRequest: AVContentKeyRequest;
      reason: AVContentKeyRequestRetryReason): Boolean; cdecl;
    [MethodName('contentKeySession:contentKeyRequestDidSucceed:')]
    procedure contentKeySessionContentKeyRequestDidSucceed
      (session: AVContentKeySession;
      contentKeyRequestDidSucceed: AVContentKeyRequest); cdecl;
    procedure contentKeySessionContentProtectionSessionIdentifierDidChange
      (session: AVContentKeySession); cdecl;
    procedure contentKeySessionDidGenerateExpiredSessionReport
      (session: AVContentKeySession); cdecl;
  end;

  AVFragmentMinding = interface(IObjectiveC)
    ['{BAD26B61-CC3F-4BEC-847A-9D33DDEDD41F}']
    function isAssociatedWithFragmentMinder: Boolean; cdecl;
  end;

  AVAssetDownloadDelegate = interface(IObjectiveC)
    ['{5E140195-2DC5-4791-AC7F-6CA2F6B30D31}']
    [MethodName('URLSession:assetDownloadTask:didFinishDownloadingToURL:')]
    procedure URLSessionAssetDownloadTaskDidFinishDownloadingToURL
      (session: NSURLSession; assetDownloadTask: AVAssetDownloadTask;
      didFinishDownloadingToURL: NSURL); cdecl;
    [MethodName
      ('URLSession:assetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:')
      ]
    procedure URLSessionAssetDownloadTaskDidLoadTimeRangeTotalTimeRangesLoadedTimeRangeExpectedToLoad
      (session: NSURLSession; assetDownloadTask: AVAssetDownloadTask;
      didLoadTimeRange: CMTimeRange; totalTimeRangesLoaded: NSArray;
      timeRangeExpectedToLoad: CMTimeRange); cdecl;
    [MethodName('URLSession:assetDownloadTask:didResolveMediaSelection:')]
    procedure URLSessionAssetDownloadTaskDidResolveMediaSelection
      (session: NSURLSession; assetDownloadTask: AVAssetDownloadTask;
      didResolveMediaSelection: AVMediaSelection); cdecl;
    [MethodName('URLSession:aggregateAssetDownloadTask:willDownloadToURL:')]
    procedure URLSessionAggregateAssetDownloadTaskWillDownloadToURL
      (session: NSURLSession;
      aggregateAssetDownloadTask: AVAggregateAssetDownloadTask;
      willDownloadToURL: NSURL); cdecl;
    [MethodName
      ('URLSession:aggregateAssetDownloadTask:didCompleteForMediaSelection:')]
    procedure URLSessionAggregateAssetDownloadTaskDidCompleteForMediaSelection
      (session: NSURLSession;
      aggregateAssetDownloadTask: AVAggregateAssetDownloadTask;
      didCompleteForMediaSelection: AVMediaSelection); cdecl;
    [MethodName
      ('URLSession:aggregateAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelection:')
      ]
    procedure URLSessionAggregateAssetDownloadTaskDidLoadTimeRangeTotalTimeRangesLoadedTimeRangeExpectedToLoadForMediaSelection
      (session: NSURLSession;
      aggregateAssetDownloadTask: AVAggregateAssetDownloadTask;
      didLoadTimeRange: CMTimeRange; totalTimeRangesLoaded: NSArray;
      timeRangeExpectedToLoad: CMTimeRange;
      forMediaSelection: AVMediaSelection); cdecl;
    [MethodName('URLSession:assetDownloadTask:willDownloadVariants:')]
    procedure URLSessionAssetDownloadTaskWillDownloadVariants
      (session: NSURLSession; assetDownloadTask: AVAssetDownloadTask;
      willDownloadVariants: NSArray); cdecl;
  end;

  AVVideoCompositing = interface(IObjectiveC)
    ['{15881E4F-4487-48D9-985F-FE39E7E777CC}']
    function sourcePixelBufferAttributes: NSDictionary; cdecl;
    function requiredPixelBufferAttributesForRenderContext: NSDictionary; cdecl;
    procedure renderContextChanged(newRenderContext
      : AVVideoCompositionRenderContext); cdecl;
    procedure startVideoCompositionRequest(asyncVideoCompositionRequest
      : AVAsynchronousVideoCompositionRequest); cdecl;
    procedure cancelAllPendingVideoCompositionRequests; cdecl;
    function supportsWideColorSourceFrames: Boolean; cdecl;
    function supportsHDRSourceFrames: Boolean; cdecl;
    function canConformColorOfSourceFrames: Boolean; cdecl;
    procedure anticipateRenderingUsingHint(renderHint
      : AVVideoCompositionRenderHint); cdecl;
    procedure prerollForRenderingUsingHint(renderHint
      : AVVideoCompositionRenderHint); cdecl;
  end;

  AVVideoCompositionValidationHandling = interface(IObjectiveC)
    ['{23A8B1A6-B750-4193-A22A-9F0139A42574}']
    [MethodName
      ('videoComposition:shouldContinueValidatingAfterFindingInvalidValueForKey:')
      ]
    function videoCompositionShouldContinueValidatingAfterFindingInvalidValueForKey
      (videoComposition: AVVideoComposition;
      shouldContinueValidatingAfterFindingInvalidValueForKey: NSString)
      : Boolean; cdecl;
    [MethodName
      ('videoComposition:shouldContinueValidatingAfterFindingEmptyTimeRange:')]
    function videoCompositionShouldContinueValidatingAfterFindingEmptyTimeRange
      (videoComposition: AVVideoComposition;
      shouldContinueValidatingAfterFindingEmptyTimeRange: CMTimeRange)
      : Boolean; cdecl;
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
      shouldContinueValidatingAfterFindingInvalidTrackIDInInstruction: Pointer;
      layerInstruction: AVVideoCompositionLayerInstruction; asset: AVAsset)
      : Boolean; cdecl;
  end;

  AVAssetReaderCaptionValidationHandling = interface(IObjectiveC)
    ['{CF170563-1B5D-4D29-B20A-61FE1FBDD8C8}']
    procedure captionAdaptor(adaptor: AVAssetReaderOutputCaptionAdaptor;
      didVendCaption: AVCaption; skippingUnsupportedSourceSyntaxElements
      : NSArray); cdecl;
  end;

  AVAssetResourceLoaderDelegate = interface(IObjectiveC)
    ['{BB8E7DE0-4BBF-41F8-83B7-EF844F31B628}']
    [MethodName('resourceLoader:shouldWaitForLoadingOfRequestedResource:')]
    function resourceLoaderShouldWaitForLoadingOfRequestedResource
      (resourceLoader: AVAssetResourceLoader;
      shouldWaitForLoadingOfRequestedResource: AVAssetResourceLoadingRequest)
      : Boolean; cdecl;
    [MethodName('resourceLoader:shouldWaitForRenewalOfRequestedResource:')]
    function resourceLoaderShouldWaitForRenewalOfRequestedResource
      (resourceLoader: AVAssetResourceLoader;
      shouldWaitForRenewalOfRequestedResource: AVAssetResourceRenewalRequest)
      : Boolean; cdecl;
    [MethodName('resourceLoader:didCancelLoadingRequest:')]
    procedure resourceLoaderDidCancelLoadingRequest(resourceLoader
      : AVAssetResourceLoader;
      didCancelLoadingRequest: AVAssetResourceLoadingRequest); cdecl;
    [MethodName
      ('resourceLoader:shouldWaitForResponseToAuthenticationChallenge:')]
    function resourceLoaderShouldWaitForResponseToAuthenticationChallenge
      (resourceLoader: AVAssetResourceLoader;
      shouldWaitForResponseToAuthenticationChallenge
      : NSURLAuthenticationChallenge): Boolean; cdecl;
    [MethodName('resourceLoader:didCancelAuthenticationChallenge:')]
    procedure resourceLoaderDidCancelAuthenticationChallenge(resourceLoader
      : AVAssetResourceLoader; didCancelAuthenticationChallenge
      : NSURLAuthenticationChallenge); cdecl;
  end;

  AVAssetWriterDelegate = interface(IObjectiveC)
    ['{54C5FE94-C1C6-40EA-BDC7-D9C049DEB2A2}']
    [MethodName('assetWriter:didOutputSegmentData:segmentType:segmentReport:')]
    procedure assetWriterDidOutputSegmentDataSegmentTypeSegmentReport
      (writer: AVAssetWriter; didOutputSegmentData: NSData;
      segmentType: AVAssetSegmentType;
      segmentReport: AVAssetSegmentReport); cdecl;
    [MethodName('assetWriter:didOutputSegmentData:segmentType:')]
    procedure assetWriterDidOutputSegmentDataSegmentType(writer: AVAssetWriter;
      didOutputSegmentData: NSData; segmentType: AVAssetSegmentType); cdecl;
  end;

  AVCaptureAudioDataOutputSampleBufferDelegate = interface(IObjectiveC)
    ['{3F14E7DD-2E4F-432E-AE75-5553AF3F9F17}']
    procedure captureOutput(output: AVCaptureOutput;
      didOutputSampleBuffer: CMSampleBufferRef;
      fromConnection: AVCaptureConnection); cdecl;
  end;

  AVCaptureDepthDataOutputDelegate = interface(IObjectiveC)
    ['{658C4811-D418-433C-A500-A4327013FC6A}']
    [MethodName('depthDataOutput:didOutputDepthData:timestamp:connection:')]
    procedure depthDataOutputDidOutputDepthDataTimestampConnection
      (output: AVCaptureDepthDataOutput; didOutputDepthData: AVDepthData;
      timestamp: CMTime; connection: AVCaptureConnection); cdecl;
    [MethodName
      ('depthDataOutput:didDropDepthData:timestamp:connection:reason:')]
    procedure depthDataOutputDidDropDepthDataTimestampConnectionReason
      (output: AVCaptureDepthDataOutput; didDropDepthData: AVDepthData;
      timestamp: CMTime; connection: AVCaptureConnection;
      reason: AVCaptureOutputDataDroppedReason); cdecl;
  end;

  AVCaptureFileOutputDelegate = interface(IObjectiveC)
    ['{F73ED033-0E50-454B-9CBC-693204B756B0}']
    function captureOutputShouldProvideSampleAccurateRecordingStart
      (output: AVCaptureOutput): Boolean; cdecl;
    procedure captureOutput(output: AVCaptureFileOutput;
      didOutputSampleBuffer: CMSampleBufferRef;
      fromConnection: AVCaptureConnection); cdecl;
  end;

  AVCaptureFileOutputRecordingDelegate = interface(IObjectiveC)
    ['{F5925005-BE6E-42F6-AF79-74C1DFD362BC}']
    [MethodName
      ('captureOutput:didStartRecordingToOutputFileAtURL:fromConnections:')]
    procedure captureOutputDidStartRecordingToOutputFileAtURLFromConnections
      (output: AVCaptureFileOutput; didStartRecordingToOutputFileAtURL: NSURL;
      fromConnections: NSArray); cdecl;
    [MethodName
      ('captureOutput:didPauseRecordingToOutputFileAtURL:fromConnections:')]
    procedure captureOutputDidPauseRecordingToOutputFileAtURLFromConnections
      (output: AVCaptureFileOutput; didPauseRecordingToOutputFileAtURL: NSURL;
      fromConnections: NSArray); cdecl;
    [MethodName
      ('captureOutput:didResumeRecordingToOutputFileAtURL:fromConnections:')]
    procedure captureOutputDidResumeRecordingToOutputFileAtURLFromConnections
      (output: AVCaptureFileOutput; didResumeRecordingToOutputFileAtURL: NSURL;
      fromConnections: NSArray); cdecl;
    [MethodName
      ('captureOutput:willFinishRecordingToOutputFileAtURL:fromConnections:error:')
      ]
    procedure captureOutputWillFinishRecordingToOutputFileAtURLFromConnectionsError
      (output: AVCaptureFileOutput; willFinishRecordingToOutputFileAtURL: NSURL;
      fromConnections: NSArray; error: NSError); cdecl;
    [MethodName
      ('captureOutput:didFinishRecordingToOutputFileAtURL:fromConnections:error:')
      ]
    procedure captureOutputDidFinishRecordingToOutputFileAtURLFromConnectionsError
      (output: AVCaptureFileOutput; didFinishRecordingToOutputFileAtURL: NSURL;
      fromConnections: NSArray; error: NSError); cdecl;
  end;

  AVCaptureMetadataOutputObjectsDelegate = interface(IObjectiveC)
    ['{E43EE896-D92E-4B82-B91E-00AE9529E752}']
    procedure captureOutput(output: AVCaptureOutput;
      didOutputMetadataObjects: NSArray;
      fromConnection: AVCaptureConnection); cdecl;
  end;

  AVCapturePhotoCaptureDelegate = interface(IObjectiveC)
    ['{72D66C62-4302-4B4A-AB11-1EFCEC350964}']
    [MethodName('captureOutput:willBeginCaptureForResolvedSettings:')]
    procedure captureOutputWillBeginCaptureForResolvedSettings
      (output: AVCapturePhotoOutput; willBeginCaptureForResolvedSettings
      : AVCaptureResolvedPhotoSettings); cdecl;
    [MethodName('captureOutput:willCapturePhotoForResolvedSettings:')]
    procedure captureOutputWillCapturePhotoForResolvedSettings
      (output: AVCapturePhotoOutput; willCapturePhotoForResolvedSettings
      : AVCaptureResolvedPhotoSettings); cdecl;
    [MethodName('captureOutput:didCapturePhotoForResolvedSettings:')]
    procedure captureOutputDidCapturePhotoForResolvedSettings
      (output: AVCapturePhotoOutput;
      didCapturePhotoForResolvedSettings
      : AVCaptureResolvedPhotoSettings); cdecl;
    [MethodName('captureOutput:didFinishProcessingPhoto:error:')]
    procedure captureOutputDidFinishProcessingPhotoError
      (output: AVCapturePhotoOutput; didFinishProcessingPhoto: AVCapturePhoto;
      error: NSError); cdecl;
    [MethodName
      ('captureOutput:didFinishProcessingPhotoSampleBuffer:previewPhotoSampleBuffer:resolvedSettings:bracketSettings:error:')
      ]
    procedure captureOutputDidFinishProcessingPhotoSampleBufferPreviewPhotoSampleBufferResolvedSettingsBracketSettingsError
      (output: AVCapturePhotoOutput; didFinishProcessingPhotoSampleBuffer
      : CMSampleBufferRef; previewPhotoSampleBuffer: CMSampleBufferRef;
      resolvedSettings: AVCaptureResolvedPhotoSettings;
      bracketSettings: AVCaptureBracketedStillImageSettings;
      error: NSError); cdecl;
    [MethodName
      ('captureOutput:didFinishProcessingRawPhotoSampleBuffer:previewPhotoSampleBuffer:resolvedSettings:bracketSettings:error:')
      ]
    procedure captureOutputDidFinishProcessingRawPhotoSampleBufferPreviewPhotoSampleBufferResolvedSettingsBracketSettingsError
      (output: AVCapturePhotoOutput; didFinishProcessingRawPhotoSampleBuffer
      : CMSampleBufferRef; previewPhotoSampleBuffer: CMSampleBufferRef;
      resolvedSettings: AVCaptureResolvedPhotoSettings;
      bracketSettings: AVCaptureBracketedStillImageSettings;
      error: NSError); cdecl;
    [MethodName
      ('captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:')
      ]
    procedure captureOutputDidFinishRecordingLivePhotoMovieForEventualFileAtURLResolvedSettings
      (output: AVCapturePhotoOutput;
      didFinishRecordingLivePhotoMovieForEventualFileAtURL: NSURL;
      resolvedSettings: AVCaptureResolvedPhotoSettings); cdecl;
    [MethodName
      ('captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:resolvedSettings:error:')
      ]
    procedure captureOutputDidFinishProcessingLivePhotoToMovieFileAtURLDurationPhotoDisplayTimeResolvedSettingsError
      (output: AVCapturePhotoOutput;
      didFinishProcessingLivePhotoToMovieFileAtURL: NSURL; duration: CMTime;
      photoDisplayTime: CMTime;
      resolvedSettings: AVCaptureResolvedPhotoSettings; error: NSError); cdecl;
    [MethodName('captureOutput:didFinishCaptureForResolvedSettings:error:')]
    procedure captureOutputDidFinishCaptureForResolvedSettingsError
      (output: AVCapturePhotoOutput; didFinishCaptureForResolvedSettings
      : AVCaptureResolvedPhotoSettings; error: NSError); cdecl;
  end;

  AVCapturePhotoFileDataRepresentationCustomizer = interface(IObjectiveC)
    ['{2E0EBE72-4EE8-441B-9E3F-6EC2F48E8C65}']
    function replacementMetadataForPhoto(photo: AVCapturePhoto)
      : NSDictionary; cdecl;
    function replacementEmbeddedThumbnailPixelBufferWithPhotoFormat
      (replacementEmbeddedThumbnailPhotoFormatOut: NSDictionary;
      forPhoto: AVCapturePhoto): CVPixelBufferRef; cdecl;
    function replacementDepthDataForPhoto(photo: AVCapturePhoto)
      : AVDepthData; cdecl;
    function replacementPortraitEffectsMatteForPhoto(photo: AVCapturePhoto)
      : AVPortraitEffectsMatte; cdecl;
    function replacementSemanticSegmentationMatteOfType
      (semanticSegmentationMatteType: AVSemanticSegmentationMatteType;
      forPhoto: AVCapturePhoto): AVSemanticSegmentationMatte; cdecl;
    function replacementAppleProRAWCompressionSettingsForPhoto
      (photo: AVCapturePhoto; defaultSettings: NSDictionary;
      maximumBitDepth: NSInteger): NSDictionary; cdecl;
  end;

  AVCaptureVideoDataOutputSampleBufferDelegate = interface(IObjectiveC)
    ['{2C39BE30-BF1E-4276-A9D9-A6D34B3D3F4E}']
    [MethodName('captureOutput:didOutputSampleBuffer:fromConnection:')]
    procedure captureOutputDidOutputSampleBufferFromConnection
      (output: AVCaptureOutput; didOutputSampleBuffer: CMSampleBufferRef;
      fromConnection: AVCaptureConnection); cdecl;
    [MethodName('captureOutput:didDropSampleBuffer:fromConnection:')]
    procedure captureOutputDidDropSampleBufferFromConnection
      (output: AVCaptureOutput; didDropSampleBuffer: CMSampleBufferRef;
      fromConnection: AVCaptureConnection); cdecl;
  end;

  AVCaptureDataOutputSynchronizerDelegate = interface(IObjectiveC)
    ['{A57A9B5B-FD01-46B4-AE90-42E07C95A387}']
    procedure dataOutputSynchronizer(synchronizer
      : AVCaptureDataOutputSynchronizer;
      didOutputSynchronizedDataCollection
      : AVCaptureSynchronizedDataCollection); cdecl;
  end;

  AVPlayerPlaybackCoordinatorDelegate = interface(IObjectiveC)
    ['{3FF9A379-D69E-4EE0-999A-27411483F953}']
    [MethodName('playbackCoordinator:identifierForPlayerItem:')]
    function playbackCoordinatorIdentifierForPlayerItem
      (coordinator: AVPlayerPlaybackCoordinator;
      identifierForPlayerItem: AVPlayerItem): NSString; cdecl;
    [MethodName('playbackCoordinator:interstitialTimeRangesForPlayerItem:')]
    function playbackCoordinatorInterstitialTimeRangesForPlayerItem
      (coordinator: AVPlayerPlaybackCoordinator;
      interstitialTimeRangesForPlayerItem: AVPlayerItem): NSArray; cdecl;
  end;

  AVPlaybackCoordinatorPlaybackControlDelegate = interface(IObjectiveC)
    ['{B0A37674-CD6C-4195-AFEB-BBABDB0B30E9}']
    [MethodName('playbackCoordinator:didIssuePlayCommand:completionHandler:')]
    procedure playbackCoordinatorDidIssuePlayCommandCompletionHandler
      (coordinator: AVDelegatingPlaybackCoordinator;
      didIssuePlayCommand: AVDelegatingPlaybackCoordinatorPlayCommand;
      completionHandler: TAVFoundationCompletionHandler); cdecl;
    [MethodName('playbackCoordinator:didIssuePauseCommand:completionHandler:')]
    procedure playbackCoordinatorDidIssuePauseCommandCompletionHandler
      (coordinator: AVDelegatingPlaybackCoordinator;
      didIssuePauseCommand: AVDelegatingPlaybackCoordinatorPauseCommand;
      completionHandler: TAVFoundationCompletionHandler); cdecl;
    [MethodName('playbackCoordinator:didIssueSeekCommand:completionHandler:')]
    procedure playbackCoordinatorDidIssueSeekCommandCompletionHandler
      (coordinator: AVDelegatingPlaybackCoordinator;
      didIssueSeekCommand: AVDelegatingPlaybackCoordinatorSeekCommand;
      completionHandler: TAVFoundationCompletionHandler); cdecl;
    [MethodName
      ('playbackCoordinator:didIssueBufferingCommand:completionHandler:')]
    procedure playbackCoordinatorDidIssueBufferingCommandCompletionHandler
      (coordinator: AVDelegatingPlaybackCoordinator;
      didIssueBufferingCommand: AVDelegatingPlaybackCoordinatorBufferingCommand;
      completionHandler: TAVFoundationCompletionHandler); cdecl;
  end;

  AVPlayerItemMetadataCollectorPushDelegate = interface(IObjectiveC)
    ['{68EC11B6-CE76-4E3A-8C72-58A67F435206}']
    procedure metadataCollector(metadataCollector
      : AVPlayerItemMetadataCollector;
      didCollectDateRangeMetadataGroups: NSArray;
      indexesOfNewGroups: NSIndexSet;
      indexesOfModifiedGroups: NSIndexSet); cdecl;
  end;

  AVPlayerItemOutputPullDelegate = interface(IObjectiveC)
    ['{EBEBBB35-3058-4E4E-89ED-DB713B460BC6}']
    procedure outputMediaDataWillChange(sender: AVPlayerItemOutput); cdecl;
    procedure outputSequenceWasFlushed(output: AVPlayerItemOutput); cdecl;
  end;

  AVPlayerItemLegibleOutputPushDelegate = interface(IObjectiveC)
    ['{C07C6238-C8CE-415C-8F8F-2C31D90465F6}']
    procedure legibleOutput(output: AVPlayerItemLegibleOutput;
      didOutputAttributedStrings: NSArray; nativeSampleBuffers: NSArray;
      forItemTime: CMTime); cdecl;
  end;

  AVPlayerItemOutputPushDelegate = interface(IObjectiveC)
    ['{1EEC0DA6-33C1-46D0-BC97-75C1F8223AF8}']
    procedure outputSequenceWasFlushed(output: AVPlayerItemOutput); cdecl;
  end;

  AVPlayerItemMetadataOutputPushDelegate = interface(IObjectiveC)
    ['{386521A0-0A08-4642-A046-759CCCE0B253}']
    procedure metadataOutput(output: AVPlayerItemMetadataOutput;
      didOutputTimedMetadataGroups: NSArray;
      fromPlayerItemTrack: AVPlayerItemTrack); cdecl;
  end;

  AVQueuedSampleBufferRendering = interface(IObjectiveC)
    ['{47E24B66-844C-48D7-97E3-5F0D52EE041B}']
    function timebase: CMTimebaseRef; cdecl;
    procedure enqueueSampleBuffer(sampleBuffer: CMSampleBufferRef); cdecl;
    procedure flush; cdecl;
    function isReadyForMoreMediaData: Boolean; cdecl;
    procedure requestMediaDataWhenReadyOnQueue(queue: dispatch_queue_t;
      usingBlock: TAVFoundationCompletionHandler); cdecl;
    procedure stopRequestingMediaData; cdecl;
    function hasSufficientMediaDataForReliablePlaybackStart: Boolean; cdecl;
  end;

  // ===== Exported string consts =====

function AVCoreAnimationBeginTimeAtZero: Pointer;
function AVLayerVideoGravityResizeAspect: Pointer;
function AVLayerVideoGravityResizeAspectFill: Pointer;
function AVLayerVideoGravityResize: Pointer;
function AVContentKeySystemFairPlayStreaming: Pointer;
function AVContentKeySystemClearKey: Pointer;
function AVContentKeySystemAuthorizationToken: Pointer;
function AVContentKeySessionServerPlaybackContextOptionProtocolVersions
  : Pointer;
function AVContentKeySessionServerPlaybackContextOptionServerChallenge: Pointer;
function AVContentKeyRequestRetryReasonTimedOut: Pointer;
function AVContentKeyRequestRetryReasonReceivedResponseWithExpiredLease
  : Pointer;
function AVContentKeyRequestRetryReasonReceivedObsoleteContentKey: Pointer;
function AVContentKeyRequestRequiresValidationDataInSecureTokenKey: NSString;
function AVContentKeyRequestProtocolVersionsKey: NSString;
function AVMediaTypeVideo: Pointer;
function AVMediaTypeAudio: Pointer;
function AVMediaTypeText: Pointer;
function AVMediaTypeClosedCaption: Pointer;
function AVMediaTypeSubtitle: Pointer;
function AVMediaTypeTimecode: Pointer;
function AVMediaTypeMetadata: Pointer;
function AVMediaTypeMuxed: Pointer;
function AVVideoRangeSDR: Pointer;
function AVVideoRangeHLG: Pointer;
function AVVideoRangePQ: Pointer;
function AVMediaTypeMetadataObject: Pointer;
function AVMediaTypeDepthData: Pointer;
function AVMediaCharacteristicVisual: Pointer;
function AVMediaCharacteristicAudible: Pointer;
function AVMediaCharacteristicLegible: Pointer;
function AVMediaCharacteristicFrameBased: Pointer;
function AVMediaCharacteristicUsesWideGamutColorSpace: Pointer;
function AVMediaCharacteristicContainsHDRVideo: Pointer;
function AVMediaCharacteristicContainsAlphaChannel: Pointer;
function AVMediaCharacteristicIsMainProgramContent: Pointer;
function AVMediaCharacteristicIsAuxiliaryContent: Pointer;
function AVMediaCharacteristicIsOriginalContent: Pointer;
function AVMediaCharacteristicContainsOnlyForcedSubtitles: Pointer;
function AVMediaCharacteristicTranscribesSpokenDialogForAccessibility: Pointer;
function AVMediaCharacteristicDescribesMusicAndSoundForAccessibility: Pointer;
function AVMediaCharacteristicEasyToRead: Pointer;
function AVMediaCharacteristicDescribesVideoForAccessibility: Pointer;
function AVMediaCharacteristicLanguageTranslation: Pointer;
function AVMediaCharacteristicDubbedTranslation: Pointer;
function AVMediaCharacteristicVoiceOverTranslation: Pointer;
function AVFileTypeQuickTimeMovie: Pointer;
function AVFileTypeMPEG4: Pointer;
function AVFileTypeAppleM4V: Pointer;
function AVFileTypeAppleM4A: Pointer;
function AVFileType3GPP: Pointer;
function AVFileType3GPP2: Pointer;
function AVFileTypeCoreAudioFormat: Pointer;
function AVFileTypeWAVE: Pointer;
function AVFileTypeAIFF: Pointer;
function AVFileTypeAIFC: Pointer;
function AVFileTypeAMR: Pointer;
function AVFileTypeMPEGLayer3: Pointer;
function AVFileTypeSunAU: Pointer;
function AVFileTypeAC3: Pointer;
function AVFileTypeEnhancedAC3: Pointer;
function AVFileTypeJPEG: Pointer;
function AVFileTypeDNG: Pointer;
function AVFileTypeHEIC: Pointer;
function AVFileTypeAVCI: Pointer;
function AVFileTypeHEIF: Pointer;
function AVFileTypeTIFF: Pointer;
function AVFileTypeAppleiTT: Pointer;
function AVFileTypeSCC: Pointer;
function AVStreamingKeyDeliveryContentKeyType: NSString;
function AVStreamingKeyDeliveryPersistentContentKeyType: NSString;
function AVFileTypeProfileMPEG4AppleHLS: Pointer;
function AVFileTypeProfileMPEG4CMAFCompliant: Pointer;
function AVMetadataKeySpaceCommon: Pointer;
function AVMetadataCommonKeyTitle: Pointer;
function AVMetadataCommonKeyCreator: Pointer;
function AVMetadataCommonKeySubject: Pointer;
function AVMetadataCommonKeyDescription: Pointer;
function AVMetadataCommonKeyPublisher: Pointer;
function AVMetadataCommonKeyContributor: Pointer;
function AVMetadataCommonKeyCreationDate: Pointer;
function AVMetadataCommonKeyLastModifiedDate: Pointer;
function AVMetadataCommonKeyType: Pointer;
function AVMetadataCommonKeyFormat: Pointer;
function AVMetadataCommonKeyIdentifier: Pointer;
function AVMetadataCommonKeySource: Pointer;
function AVMetadataCommonKeyLanguage: Pointer;
function AVMetadataCommonKeyRelation: Pointer;
function AVMetadataCommonKeyLocation: Pointer;
function AVMetadataCommonKeyCopyrights: Pointer;
function AVMetadataCommonKeyAlbumName: Pointer;
function AVMetadataCommonKeyAuthor: Pointer;
function AVMetadataCommonKeyArtist: Pointer;
function AVMetadataCommonKeyArtwork: Pointer;
function AVMetadataCommonKeyMake: Pointer;
function AVMetadataCommonKeyModel: Pointer;
function AVMetadataCommonKeySoftware: Pointer;
function AVMetadataCommonKeyAccessibilityDescription: Pointer;
function AVMetadataFormatQuickTimeUserData: Pointer;
function AVMetadataKeySpaceQuickTimeUserData: Pointer;
function AVMetadataQuickTimeUserDataKeyAlbum: Pointer;
function AVMetadataQuickTimeUserDataKeyArranger: Pointer;
function AVMetadataQuickTimeUserDataKeyArtist: Pointer;
function AVMetadataQuickTimeUserDataKeyAuthor: Pointer;
function AVMetadataQuickTimeUserDataKeyChapter: Pointer;
function AVMetadataQuickTimeUserDataKeyComment: Pointer;
function AVMetadataQuickTimeUserDataKeyComposer: Pointer;
function AVMetadataQuickTimeUserDataKeyCopyright: Pointer;
function AVMetadataQuickTimeUserDataKeyCreationDate: Pointer;
function AVMetadataQuickTimeUserDataKeyDescription: Pointer;
function AVMetadataQuickTimeUserDataKeyDirector: Pointer;
function AVMetadataQuickTimeUserDataKeyDisclaimer: Pointer;
function AVMetadataQuickTimeUserDataKeyEncodedBy: Pointer;
function AVMetadataQuickTimeUserDataKeyFullName: Pointer;
function AVMetadataQuickTimeUserDataKeyGenre: Pointer;
function AVMetadataQuickTimeUserDataKeyHostComputer: Pointer;
function AVMetadataQuickTimeUserDataKeyInformation: Pointer;
function AVMetadataQuickTimeUserDataKeyKeywords: Pointer;
function AVMetadataQuickTimeUserDataKeyMake: Pointer;
function AVMetadataQuickTimeUserDataKeyModel: Pointer;
function AVMetadataQuickTimeUserDataKeyOriginalArtist: Pointer;
function AVMetadataQuickTimeUserDataKeyOriginalFormat: Pointer;
function AVMetadataQuickTimeUserDataKeyOriginalSource: Pointer;
function AVMetadataQuickTimeUserDataKeyPerformers: Pointer;
function AVMetadataQuickTimeUserDataKeyProducer: Pointer;
function AVMetadataQuickTimeUserDataKeyPublisher: Pointer;
function AVMetadataQuickTimeUserDataKeyProduct: Pointer;
function AVMetadataQuickTimeUserDataKeySoftware: Pointer;
function AVMetadataQuickTimeUserDataKeySpecialPlaybackRequirements: Pointer;
function AVMetadataQuickTimeUserDataKeyTrack: Pointer;
function AVMetadataQuickTimeUserDataKeyWarning: Pointer;
function AVMetadataQuickTimeUserDataKeyWriter: Pointer;
function AVMetadataQuickTimeUserDataKeyURLLink: Pointer;
function AVMetadataQuickTimeUserDataKeyLocationISO6709: Pointer;
function AVMetadataQuickTimeUserDataKeyTrackName: Pointer;
function AVMetadataQuickTimeUserDataKeyCredits: Pointer;
function AVMetadataQuickTimeUserDataKeyPhonogramRights: Pointer;
function AVMetadataQuickTimeUserDataKeyTaggedCharacteristic: Pointer;
function AVMetadataQuickTimeUserDataKeyAccessibilityDescription: Pointer;
function AVMetadataFormatISOUserData: Pointer;
function AVMetadataKeySpaceISOUserData: Pointer;
function AVMetadataISOUserDataKeyCopyright: Pointer;
function AVMetadataISOUserDataKeyTaggedCharacteristic: Pointer;
function AVMetadataISOUserDataKeyDate: Pointer;
function AVMetadataISOUserDataKeyAccessibilityDescription: Pointer;
function AVMetadata3GPUserDataKeyCopyright: Pointer;
function AVMetadata3GPUserDataKeyAuthor: Pointer;
function AVMetadata3GPUserDataKeyPerformer: Pointer;
function AVMetadata3GPUserDataKeyGenre: Pointer;
function AVMetadata3GPUserDataKeyRecordingYear: Pointer;
function AVMetadata3GPUserDataKeyLocation: Pointer;
function AVMetadata3GPUserDataKeyTitle: Pointer;
function AVMetadata3GPUserDataKeyDescription: Pointer;
function AVMetadata3GPUserDataKeyCollection: Pointer;
function AVMetadata3GPUserDataKeyUserRating: Pointer;
function AVMetadata3GPUserDataKeyThumbnail: Pointer;
function AVMetadata3GPUserDataKeyAlbumAndTrack: Pointer;
function AVMetadata3GPUserDataKeyKeywordList: Pointer;
function AVMetadata3GPUserDataKeyMediaClassification: Pointer;
function AVMetadata3GPUserDataKeyMediaRating: Pointer;
function AVMetadataFormatQuickTimeMetadata: Pointer;
function AVMetadataKeySpaceQuickTimeMetadata: Pointer;
function AVMetadataQuickTimeMetadataKeyAuthor: Pointer;
function AVMetadataQuickTimeMetadataKeyComment: Pointer;
function AVMetadataQuickTimeMetadataKeyCopyright: Pointer;
function AVMetadataQuickTimeMetadataKeyCreationDate: Pointer;
function AVMetadataQuickTimeMetadataKeyDirector: Pointer;
function AVMetadataQuickTimeMetadataKeyDisplayName: Pointer;
function AVMetadataQuickTimeMetadataKeyInformation: Pointer;
function AVMetadataQuickTimeMetadataKeyKeywords: Pointer;
function AVMetadataQuickTimeMetadataKeyProducer: Pointer;
function AVMetadataQuickTimeMetadataKeyPublisher: Pointer;
function AVMetadataQuickTimeMetadataKeyAlbum: Pointer;
function AVMetadataQuickTimeMetadataKeyArtist: Pointer;
function AVMetadataQuickTimeMetadataKeyArtwork: Pointer;
function AVMetadataQuickTimeMetadataKeyDescription: Pointer;
function AVMetadataQuickTimeMetadataKeySoftware: Pointer;
function AVMetadataQuickTimeMetadataKeyYear: Pointer;
function AVMetadataQuickTimeMetadataKeyGenre: Pointer;
function AVMetadataQuickTimeMetadataKeyiXML: Pointer;
function AVMetadataQuickTimeMetadataKeyLocationISO6709: Pointer;
function AVMetadataQuickTimeMetadataKeyMake: Pointer;
function AVMetadataQuickTimeMetadataKeyModel: Pointer;
function AVMetadataQuickTimeMetadataKeyArranger: Pointer;
function AVMetadataQuickTimeMetadataKeyEncodedBy: Pointer;
function AVMetadataQuickTimeMetadataKeyOriginalArtist: Pointer;
function AVMetadataQuickTimeMetadataKeyPerformer: Pointer;
function AVMetadataQuickTimeMetadataKeyComposer: Pointer;
function AVMetadataQuickTimeMetadataKeyCredits: Pointer;
function AVMetadataQuickTimeMetadataKeyPhonogramRights: Pointer;
function AVMetadataQuickTimeMetadataKeyCameraIdentifier: Pointer;
function AVMetadataQuickTimeMetadataKeyCameraFrameReadoutTime: Pointer;
function AVMetadataQuickTimeMetadataKeyTitle: Pointer;
function AVMetadataQuickTimeMetadataKeyCollectionUser: Pointer;
function AVMetadataQuickTimeMetadataKeyRatingUser: Pointer;
function AVMetadataQuickTimeMetadataKeyLocationName: Pointer;
function AVMetadataQuickTimeMetadataKeyLocationBody: Pointer;
function AVMetadataQuickTimeMetadataKeyLocationNote: Pointer;
function AVMetadataQuickTimeMetadataKeyLocationRole: Pointer;
function AVMetadataQuickTimeMetadataKeyLocationDate: Pointer;
function AVMetadataQuickTimeMetadataKeyDirectionFacing: Pointer;
function AVMetadataQuickTimeMetadataKeyDirectionMotion: Pointer;
function AVMetadataQuickTimeMetadataKeyContentIdentifier: Pointer;
function AVMetadataQuickTimeMetadataKeyAccessibilityDescription: Pointer;
function AVMetadataQuickTimeMetadataKeyIsMontage: Pointer;
function AVMetadataFormatiTunesMetadata: Pointer;
function AVMetadataKeySpaceiTunes: Pointer;
function AVMetadataiTunesMetadataKeyAlbum: Pointer;
function AVMetadataiTunesMetadataKeyArtist: Pointer;
function AVMetadataiTunesMetadataKeyUserComment: Pointer;
function AVMetadataiTunesMetadataKeyCoverArt: Pointer;
function AVMetadataiTunesMetadataKeyCopyright: Pointer;
function AVMetadataiTunesMetadataKeyReleaseDate: Pointer;
function AVMetadataiTunesMetadataKeyEncodedBy: Pointer;
function AVMetadataiTunesMetadataKeyPredefinedGenre: Pointer;
function AVMetadataiTunesMetadataKeyUserGenre: Pointer;
function AVMetadataiTunesMetadataKeySongName: Pointer;
function AVMetadataiTunesMetadataKeyTrackSubTitle: Pointer;
function AVMetadataiTunesMetadataKeyEncodingTool: Pointer;
function AVMetadataiTunesMetadataKeyComposer: Pointer;
function AVMetadataiTunesMetadataKeyAlbumArtist: Pointer;
function AVMetadataiTunesMetadataKeyAccountKind: Pointer;
function AVMetadataiTunesMetadataKeyAppleID: Pointer;
function AVMetadataiTunesMetadataKeyArtistID: Pointer;
function AVMetadataiTunesMetadataKeySongID: Pointer;
function AVMetadataiTunesMetadataKeyDiscCompilation: Pointer;
function AVMetadataiTunesMetadataKeyDiscNumber: Pointer;
function AVMetadataiTunesMetadataKeyGenreID: Pointer;
function AVMetadataiTunesMetadataKeyGrouping: Pointer;
function AVMetadataiTunesMetadataKeyPlaylistID: Pointer;
function AVMetadataiTunesMetadataKeyContentRating: Pointer;
function AVMetadataiTunesMetadataKeyBeatsPerMin: Pointer;
function AVMetadataiTunesMetadataKeyTrackNumber: Pointer;
function AVMetadataiTunesMetadataKeyArtDirector: Pointer;
function AVMetadataiTunesMetadataKeyArranger: Pointer;
function AVMetadataiTunesMetadataKeyAuthor: Pointer;
function AVMetadataiTunesMetadataKeyLyrics: Pointer;
function AVMetadataiTunesMetadataKeyAcknowledgement: Pointer;
function AVMetadataiTunesMetadataKeyConductor: Pointer;
function AVMetadataiTunesMetadataKeyDescription: Pointer;
function AVMetadataiTunesMetadataKeyDirector: Pointer;
function AVMetadataiTunesMetadataKeyEQ: Pointer;
function AVMetadataiTunesMetadataKeyLinerNotes: Pointer;
function AVMetadataiTunesMetadataKeyRecordCompany: Pointer;
function AVMetadataiTunesMetadataKeyOriginalArtist: Pointer;
function AVMetadataiTunesMetadataKeyPhonogramRights: Pointer;
function AVMetadataiTunesMetadataKeyProducer: Pointer;
function AVMetadataiTunesMetadataKeyPerformer: Pointer;
function AVMetadataiTunesMetadataKeyPublisher: Pointer;
function AVMetadataiTunesMetadataKeySoundEngineer: Pointer;
function AVMetadataiTunesMetadataKeySoloist: Pointer;
function AVMetadataiTunesMetadataKeyCredits: Pointer;
function AVMetadataiTunesMetadataKeyThanks: Pointer;
function AVMetadataiTunesMetadataKeyOnlineExtras: Pointer;
function AVMetadataiTunesMetadataKeyExecProducer: Pointer;
function AVMetadataFormatID3Metadata: Pointer;
function AVMetadataKeySpaceID3: Pointer;
function AVMetadataID3MetadataKeyAudioEncryption: Pointer;
function AVMetadataID3MetadataKeyAttachedPicture: Pointer;
function AVMetadataID3MetadataKeyAudioSeekPointIndex: Pointer;
function AVMetadataID3MetadataKeyComments: Pointer;
function AVMetadataID3MetadataKeyCommercial: Pointer;
function AVMetadataID3MetadataKeyCommerical: Pointer;
function AVMetadataID3MetadataKeyEncryption: Pointer;
function AVMetadataID3MetadataKeyEqualization: Pointer;
function AVMetadataID3MetadataKeyEqualization2: Pointer;
function AVMetadataID3MetadataKeyEventTimingCodes: Pointer;
function AVMetadataID3MetadataKeyGeneralEncapsulatedObject: Pointer;
function AVMetadataID3MetadataKeyGroupIdentifier: Pointer;
function AVMetadataID3MetadataKeyInvolvedPeopleList_v23: Pointer;
function AVMetadataID3MetadataKeyLink: Pointer;
function AVMetadataID3MetadataKeyMusicCDIdentifier: Pointer;
function AVMetadataID3MetadataKeyMPEGLocationLookupTable: Pointer;
function AVMetadataID3MetadataKeyOwnership: Pointer;
function AVMetadataID3MetadataKeyPrivate: Pointer;
function AVMetadataID3MetadataKeyPlayCounter: Pointer;
function AVMetadataID3MetadataKeyPopularimeter: Pointer;
function AVMetadataID3MetadataKeyPositionSynchronization: Pointer;
function AVMetadataID3MetadataKeyRecommendedBufferSize: Pointer;
function AVMetadataID3MetadataKeyRelativeVolumeAdjustment: Pointer;
function AVMetadataID3MetadataKeyRelativeVolumeAdjustment2: Pointer;
function AVMetadataID3MetadataKeyReverb: Pointer;
function AVMetadataID3MetadataKeySeek: Pointer;
function AVMetadataID3MetadataKeySignature: Pointer;
function AVMetadataID3MetadataKeySynchronizedLyric: Pointer;
function AVMetadataID3MetadataKeySynchronizedTempoCodes: Pointer;
function AVMetadataID3MetadataKeyAlbumTitle: Pointer;
function AVMetadataID3MetadataKeyBeatsPerMinute: Pointer;
function AVMetadataID3MetadataKeyComposer: Pointer;
function AVMetadataID3MetadataKeyContentType: Pointer;
function AVMetadataID3MetadataKeyCopyright: Pointer;
function AVMetadataID3MetadataKeyDate: Pointer;
function AVMetadataID3MetadataKeyEncodingTime: Pointer;
function AVMetadataID3MetadataKeyPlaylistDelay: Pointer;
function AVMetadataID3MetadataKeyOriginalReleaseTime: Pointer;
function AVMetadataID3MetadataKeyRecordingTime: Pointer;
function AVMetadataID3MetadataKeyReleaseTime: Pointer;
function AVMetadataID3MetadataKeyTaggingTime: Pointer;
function AVMetadataID3MetadataKeyEncodedBy: Pointer;
function AVMetadataID3MetadataKeyLyricist: Pointer;
function AVMetadataID3MetadataKeyFileType: Pointer;
function AVMetadataID3MetadataKeyTime: Pointer;
function AVMetadataID3MetadataKeyInvolvedPeopleList_v24: Pointer;
function AVMetadataID3MetadataKeyContentGroupDescription: Pointer;
function AVMetadataID3MetadataKeyTitleDescription: Pointer;
function AVMetadataID3MetadataKeySubTitle: Pointer;
function AVMetadataID3MetadataKeyInitialKey: Pointer;
function AVMetadataID3MetadataKeyLanguage: Pointer;
function AVMetadataID3MetadataKeyLength: Pointer;
function AVMetadataID3MetadataKeyMusicianCreditsList: Pointer;
function AVMetadataID3MetadataKeyMediaType: Pointer;
function AVMetadataID3MetadataKeyMood: Pointer;
function AVMetadataID3MetadataKeyOriginalAlbumTitle: Pointer;
function AVMetadataID3MetadataKeyOriginalFilename: Pointer;
function AVMetadataID3MetadataKeyOriginalLyricist: Pointer;
function AVMetadataID3MetadataKeyOriginalArtist: Pointer;
function AVMetadataID3MetadataKeyOriginalReleaseYear: Pointer;
function AVMetadataID3MetadataKeyFileOwner: Pointer;
function AVMetadataID3MetadataKeyLeadPerformer: Pointer;
function AVMetadataID3MetadataKeyBand: Pointer;
function AVMetadataID3MetadataKeyConductor: Pointer;
function AVMetadataID3MetadataKeyModifiedBy: Pointer;
function AVMetadataID3MetadataKeyPartOfASet: Pointer;
function AVMetadataID3MetadataKeyProducedNotice: Pointer;
function AVMetadataID3MetadataKeyPublisher: Pointer;
function AVMetadataID3MetadataKeyTrackNumber: Pointer;
function AVMetadataID3MetadataKeyRecordingDates: Pointer;
function AVMetadataID3MetadataKeyInternetRadioStationName: Pointer;
function AVMetadataID3MetadataKeyInternetRadioStationOwner: Pointer;
function AVMetadataID3MetadataKeySize: Pointer;
function AVMetadataID3MetadataKeyAlbumSortOrder: Pointer;
function AVMetadataID3MetadataKeyPerformerSortOrder: Pointer;
function AVMetadataID3MetadataKeyTitleSortOrder: Pointer;
function AVMetadataID3MetadataKeyInternationalStandardRecordingCode: Pointer;
function AVMetadataID3MetadataKeyEncodedWith: Pointer;
function AVMetadataID3MetadataKeySetSubtitle: Pointer;
function AVMetadataID3MetadataKeyYear: Pointer;
function AVMetadataID3MetadataKeyUserText: Pointer;
function AVMetadataID3MetadataKeyUniqueFileIdentifier: Pointer;
function AVMetadataID3MetadataKeyTermsOfUse: Pointer;
function AVMetadataID3MetadataKeyUnsynchronizedLyric: Pointer;
function AVMetadataID3MetadataKeyCommercialInformation: Pointer;
function AVMetadataID3MetadataKeyCopyrightInformation: Pointer;
function AVMetadataID3MetadataKeyOfficialAudioFileWebpage: Pointer;
function AVMetadataID3MetadataKeyOfficialArtistWebpage: Pointer;
function AVMetadataID3MetadataKeyOfficialAudioSourceWebpage: Pointer;
function AVMetadataID3MetadataKeyOfficialInternetRadioStationHomepage: Pointer;
function AVMetadataID3MetadataKeyPayment: Pointer;
function AVMetadataID3MetadataKeyOfficialPublisherWebpage: Pointer;
function AVMetadataID3MetadataKeyUserURL: Pointer;
function AVMetadataKeySpaceIcy: Pointer;
function AVMetadataIcyMetadataKeyStreamTitle: Pointer;
function AVMetadataIcyMetadataKeyStreamURL: Pointer;
function AVMetadataFormatHLSMetadata: Pointer;
function AVMetadataKeySpaceHLSDateRange: Pointer;
function AVMetadataKeySpaceAudioFile: Pointer;
function AVMetadataFormatUnknown: Pointer;
function AVMetadataExtraAttributeValueURIKey: Pointer;
function AVMetadataExtraAttributeBaseURIKey: Pointer;
function AVMetadataExtraAttributeInfoKey: Pointer;
function AVVideoCodecKey: NSString;
function AVVideoCodecTypeHEVC: Pointer;
function AVVideoCodecTypeH264: Pointer;
function AVVideoCodecTypeJPEG: Pointer;
function AVVideoCodecTypeAppleProRes4444: Pointer;
function AVVideoCodecTypeAppleProRes422: Pointer;
function AVVideoCodecTypeAppleProRes422HQ: Pointer;
function AVVideoCodecTypeAppleProRes422LT: Pointer;
function AVVideoCodecTypeAppleProRes422Proxy: Pointer;
function AVVideoCodecTypeHEVCWithAlpha: Pointer;
function AVVideoCodecHEVC: NSString;
function AVVideoCodecH264: NSString;
function AVVideoCodecJPEG: NSString;
function AVVideoCodecAppleProRes4444: NSString;
function AVVideoCodecAppleProRes422: NSString;
function AVVideoWidthKey: NSString;
function AVVideoHeightKey: NSString;
function AVVideoPixelAspectRatioKey: NSString;
function AVVideoPixelAspectRatioHorizontalSpacingKey: NSString;
function AVVideoPixelAspectRatioVerticalSpacingKey: NSString;
function AVVideoCleanApertureKey: NSString;
function AVVideoCleanApertureWidthKey: NSString;
function AVVideoCleanApertureHeightKey: NSString;
function AVVideoCleanApertureHorizontalOffsetKey: NSString;
function AVVideoCleanApertureVerticalOffsetKey: NSString;
function AVVideoScalingModeKey: NSString;
function AVVideoScalingModeFit: NSString;
function AVVideoScalingModeResize: NSString;
function AVVideoScalingModeResizeAspect: NSString;
function AVVideoScalingModeResizeAspectFill: NSString;
function AVVideoColorPropertiesKey: NSString;
function AVVideoColorPrimariesKey: NSString;
function AVVideoColorPrimaries_ITU_R_709_2: NSString;
function AVVideoColorPrimaries_EBU_3213: NSString;
function AVVideoColorPrimaries_SMPTE_C: NSString;
function AVVideoColorPrimaries_P3_D65: NSString;
function AVVideoColorPrimaries_ITU_R_2020: NSString;
function AVVideoTransferFunctionKey: NSString;
function AVVideoTransferFunction_ITU_R_709_2: NSString;
function AVVideoTransferFunction_SMPTE_240M_1995: NSString;
function AVVideoTransferFunction_SMPTE_ST_2084_PQ: NSString;
function AVVideoTransferFunction_ITU_R_2100_HLG: NSString;
function AVVideoTransferFunction_Linear: NSString;
function AVVideoYCbCrMatrixKey: NSString;
function AVVideoYCbCrMatrix_ITU_R_709_2: NSString;
function AVVideoYCbCrMatrix_ITU_R_601_4: NSString;
function AVVideoYCbCrMatrix_SMPTE_240M_1995: NSString;
function AVVideoYCbCrMatrix_ITU_R_2020: NSString;
function AVVideoAllowWideColorKey: NSString;
function AVVideoCompressionPropertiesKey: NSString;
function AVVideoAverageBitRateKey: NSString;
function AVVideoQualityKey: NSString;
function AVVideoMaxKeyFrameIntervalKey: NSString;
function AVVideoMaxKeyFrameIntervalDurationKey: NSString;
function AVVideoAppleProRAWBitDepthKey: NSString;
function AVVideoAllowFrameReorderingKey: NSString;
function AVVideoProfileLevelKey: NSString;
function AVVideoProfileLevelH264Baseline30: NSString;
function AVVideoProfileLevelH264Baseline31: NSString;
function AVVideoProfileLevelH264Baseline41: NSString;
function AVVideoProfileLevelH264BaselineAutoLevel: NSString;
function AVVideoProfileLevelH264Main30: NSString;
function AVVideoProfileLevelH264Main31: NSString;
function AVVideoProfileLevelH264Main32: NSString;
function AVVideoProfileLevelH264Main41: NSString;
function AVVideoProfileLevelH264MainAutoLevel: NSString;
function AVVideoProfileLevelH264High40: NSString;
function AVVideoProfileLevelH264High41: NSString;
function AVVideoProfileLevelH264HighAutoLevel: NSString;
function AVVideoH264EntropyModeKey: NSString;
function AVVideoH264EntropyModeCAVLC: NSString;
function AVVideoH264EntropyModeCABAC: NSString;
function AVVideoExpectedSourceFrameRateKey: NSString;
function AVVideoAverageNonDroppableFrameRateKey: NSString;
function AVVideoDecompressionPropertiesKey: NSString;
function AVVideoEncoderSpecificationKey: NSString;
function AVVideoApertureModeCleanAperture: Pointer;
function AVVideoApertureModeProductionAperture: Pointer;
function AVVideoApertureModeEncodedPixels: Pointer;
function AVURLAssetPreferPreciseDurationAndTimingKey: NSString;
function AVURLAssetReferenceRestrictionsKey: NSString;
function AVURLAssetHTTPCookiesKey: NSString;
function AVURLAssetAllowsCellularAccessKey: NSString;
function AVURLAssetAllowsExpensiveNetworkAccessKey: NSString;
function AVURLAssetAllowsConstrainedNetworkAccessKey: NSString;
function AVURLAssetShouldSupportAliasDataReferencesKey: NSString;
function AVURLAssetURLRequestAttributionKey: NSString;
function AVURLAssetHTTPUserAgentKey: NSString;
function AVURLAssetPrimarySessionIdentifierKey: NSString;
function AVAssetDurationDidChangeNotification: NSString;
function AVAssetContainsFragmentsDidChangeNotification: NSString;
function AVAssetWasDefragmentedNotification: NSString;
function AVAssetChapterMetadataGroupsDidChangeNotification: NSString;
function AVAssetMediaSelectionGroupsDidChangeNotification: NSString;
function AVAssetDownloadedAssetEvictionPriorityImportant: Pointer;
function AVAssetDownloadedAssetEvictionPriorityDefault: Pointer;
function AVAssetDownloadTaskMinimumRequiredMediaBitrateKey: NSString;
function AVAssetDownloadTaskMinimumRequiredPresentationSizeKey: NSString;
function AVAssetDownloadTaskMediaSelectionKey: NSString;
function AVAssetDownloadTaskMediaSelectionPrefersMultichannelKey: NSString;
function AVAssetDownloadTaskPrefersLosslessAudioKey: NSString;
function AVAssetDownloadTaskPrefersHDRKey: NSString;
function AVAudioTimePitchAlgorithmLowQualityZeroLatency: Pointer;
function AVAudioTimePitchAlgorithmTimeDomain: Pointer;
function AVAudioTimePitchAlgorithmSpectral: Pointer;
function AVAudioTimePitchAlgorithmVarispeed: Pointer;
function AVAssetExportPresetLowQuality: NSString;
function AVAssetExportPresetMediumQuality: NSString;
function AVAssetExportPresetHighestQuality: NSString;
function AVAssetExportPresetHEVCHighestQuality: NSString;
function AVAssetExportPresetHEVCHighestQualityWithAlpha: NSString;
function AVAssetExportPreset640x480: NSString;
function AVAssetExportPreset960x540: NSString;
function AVAssetExportPreset1280x720: NSString;
function AVAssetExportPreset1920x1080: NSString;
function AVAssetExportPreset3840x2160: NSString;
function AVAssetExportPresetHEVC1920x1080: NSString;
function AVAssetExportPresetHEVC1920x1080WithAlpha: NSString;
function AVAssetExportPresetHEVC3840x2160: NSString;
function AVAssetExportPresetHEVC3840x2160WithAlpha: NSString;
function AVAssetExportPresetHEVC7680x4320: NSString;
function AVAssetExportPresetAppleM4A: NSString;
function AVAssetExportPresetPassthrough: NSString;
function AVAssetExportPresetAppleProRes422LPCM: NSString;
function AVAssetExportPresetAppleProRes4444LPCM: NSString;
function AVAssetImageGeneratorApertureModeCleanAperture: Pointer;
function AVAssetImageGeneratorApertureModeProductionAperture: Pointer;
function AVAssetImageGeneratorApertureModeEncodedPixels: Pointer;
function AVAssetPlaybackConfigurationOptionStereoVideo: Pointer;
function AVAssetPlaybackConfigurationOptionStereoMultiviewVideo: Pointer;
function AVAssetResourceLoadingRequestStreamingContentKeyRequestRequiresPersistentKey
  : NSString;
function AVTrackAssociationTypeAudioFallback: Pointer;
function AVTrackAssociationTypeChapterList: Pointer;
function AVTrackAssociationTypeForcedSubtitlesOnly: Pointer;
function AVTrackAssociationTypeSelectionFollower: Pointer;
function AVTrackAssociationTypeTimecode: Pointer;
function AVTrackAssociationTypeMetadataReferent: Pointer;
function AVAssetTrackTimeRangeDidChangeNotification: NSString;
function AVAssetTrackSegmentsDidChangeNotification: NSString;
function AVAssetTrackTrackAssociationsDidChangeNotification: NSString;
function AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData
  : Pointer;
function AVAssetWriterInputMediaDataLocationBeforeMainMediaDataNotInterleaved
  : Pointer;
function AVCaptureSessionPresetPhoto: Pointer;
function AVCaptureSessionPresetHigh: Pointer;
function AVCaptureSessionPresetMedium: Pointer;
function AVCaptureSessionPresetLow: Pointer;
function AVCaptureSessionPreset320x240: Pointer;
function AVCaptureSessionPreset352x288: Pointer;
function AVCaptureSessionPreset640x480: Pointer;
function AVCaptureSessionPreset960x540: Pointer;
function AVCaptureSessionPreset1280x720: Pointer;
function AVCaptureSessionPreset1920x1080: Pointer;
function AVCaptureSessionPreset3840x2160: Pointer;
function AVCaptureSessionPresetiFrame960x540: Pointer;
function AVCaptureSessionPresetiFrame1280x720: Pointer;
function AVCaptureSessionPresetInputPriority: Pointer;
function AVCaptureDeviceWasConnectedNotification: NSString;
function AVCaptureDeviceWasDisconnectedNotification: NSString;
function AVCaptureDeviceSubjectAreaDidChangeNotification: NSString;
function AVCaptureDeviceTypeExternalUnknown: Pointer;
function AVCaptureDeviceTypeBuiltInMicrophone: Pointer;
function AVCaptureDeviceTypeBuiltInWideAngleCamera: Pointer;
function AVCaptureDeviceTypeBuiltInTelephotoCamera: Pointer;
function AVCaptureDeviceTypeBuiltInUltraWideCamera: Pointer;
function AVCaptureDeviceTypeBuiltInDualCamera: Pointer;
function AVCaptureDeviceTypeBuiltInDualWideCamera: Pointer;
function AVCaptureDeviceTypeBuiltInTripleCamera: Pointer;
function AVCaptureDeviceTypeBuiltInTrueDepthCamera: Pointer;
function AVCaptureDeviceTypeBuiltInLiDARDepthCamera: Pointer;
function AVCaptureDeviceTypeDeskViewCamera: Pointer;
function AVCaptureDeviceTypeBuiltInDuoCamera: Pointer;
function AVCaptureMaxAvailableTorchLevel: Pointer;
function AVCaptureLensPositionCurrent: Pointer;
function AVCaptureExposureDurationCurrent: Pointer;
function AVCaptureISOCurrent: Pointer;
function AVCaptureExposureTargetBiasCurrent: Pointer;
function AVCaptureWhiteBalanceGainsCurrent: Pointer;
function AVCaptureSessionRuntimeErrorNotification: NSString;
function AVCaptureSessionErrorKey: NSString;
function AVCaptureSessionDidStartRunningNotification: NSString;
function AVCaptureSessionDidStopRunningNotification: NSString;
function AVCaptureSessionWasInterruptedNotification: NSString;
function AVCaptureSessionInterruptionReasonKey: NSString;
function AVCaptureSessionInterruptionSystemPressureStateKey: NSString;
function AVCaptureSessionInterruptionEndedNotification: NSString;
function AVMetadataObjectTypeHumanBody: Pointer;
function AVMetadataObjectTypeCatBody: Pointer;
function AVMetadataObjectTypeDogBody: Pointer;
function AVMetadataObjectTypeSalientObject: Pointer;
function AVMetadataObjectTypeFace: Pointer;
function AVMetadataObjectTypeUPCECode: Pointer;
function AVMetadataObjectTypeCode39Code: Pointer;
function AVMetadataObjectTypeCode39Mod43Code: Pointer;
function AVMetadataObjectTypeEAN13Code: Pointer;
function AVMetadataObjectTypeEAN8Code: Pointer;
function AVMetadataObjectTypeCode93Code: Pointer;
function AVMetadataObjectTypeCode128Code: Pointer;
function AVMetadataObjectTypePDF417Code: Pointer;
function AVMetadataObjectTypeQRCode: Pointer;
function AVMetadataObjectTypeAztecCode: Pointer;
function AVMetadataObjectTypeInterleaved2of5Code: Pointer;
function AVMetadataObjectTypeITF14Code: Pointer;
function AVMetadataObjectTypeDataMatrixCode: Pointer;
function AVMetadataObjectTypeCodabarCode: Pointer;
function AVMetadataObjectTypeGS1DataBarCode: Pointer;
function AVMetadataObjectTypeGS1DataBarExpandedCode: Pointer;
function AVMetadataObjectTypeGS1DataBarLimitedCode: Pointer;
function AVMetadataObjectTypeMicroQRCode: Pointer;
function AVMetadataObjectTypeMicroPDF417Code: Pointer;
function AVSemanticSegmentationMatteTypeSkin: Pointer;
function AVSemanticSegmentationMatteTypeHair: Pointer;
function AVSemanticSegmentationMatteTypeTeeth: Pointer;
function AVSemanticSegmentationMatteTypeGlasses: Pointer;
function AVCaptureInputPortFormatDescriptionDidChangeNotification: NSString;
function AVCaptureSystemPressureLevelNominal: Pointer;
function AVCaptureSystemPressureLevelFair: Pointer;
function AVCaptureSystemPressureLevelSerious: Pointer;
function AVCaptureSystemPressureLevelCritical: Pointer;
function AVCaptureSystemPressureLevelShutdown: Pointer;
function AVFoundationErrorDomain: Pointer;
function AVErrorDeviceKey: NSString;
function AVErrorTimeKey: NSString;
function AVErrorFileSizeKey: NSString;
function AVErrorPIDKey: NSString;
function AVErrorRecordingSuccessfullyFinishedKey: NSString;
function AVErrorMediaTypeKey: NSString;
function AVErrorMediaSubTypeKey: NSString;
function AVErrorPresentationTimeStampKey: NSString;
function AVErrorPersistentTrackIDKey: NSString;
function AVErrorFileTypeKey: NSString;
function AVMetadataCommonIdentifierTitle: Pointer;
function AVMetadataCommonIdentifierCreator: Pointer;
function AVMetadataCommonIdentifierSubject: Pointer;
function AVMetadataCommonIdentifierDescription: Pointer;
function AVMetadataCommonIdentifierPublisher: Pointer;
function AVMetadataCommonIdentifierContributor: Pointer;
function AVMetadataCommonIdentifierCreationDate: Pointer;
function AVMetadataCommonIdentifierLastModifiedDate: Pointer;
function AVMetadataCommonIdentifierType: Pointer;
function AVMetadataCommonIdentifierFormat: Pointer;
function AVMetadataCommonIdentifierAssetIdentifier: Pointer;
function AVMetadataCommonIdentifierSource: Pointer;
function AVMetadataCommonIdentifierLanguage: Pointer;
function AVMetadataCommonIdentifierRelation: Pointer;
function AVMetadataCommonIdentifierLocation: Pointer;
function AVMetadataCommonIdentifierCopyrights: Pointer;
function AVMetadataCommonIdentifierAlbumName: Pointer;
function AVMetadataCommonIdentifierAuthor: Pointer;
function AVMetadataCommonIdentifierArtist: Pointer;
function AVMetadataCommonIdentifierArtwork: Pointer;
function AVMetadataCommonIdentifierMake: Pointer;
function AVMetadataCommonIdentifierModel: Pointer;
function AVMetadataCommonIdentifierSoftware: Pointer;
function AVMetadataCommonIdentifierAccessibilityDescription: Pointer;
function AVMetadataIdentifierQuickTimeUserDataAlbum: Pointer;
function AVMetadataIdentifierQuickTimeUserDataArranger: Pointer;
function AVMetadataIdentifierQuickTimeUserDataArtist: Pointer;
function AVMetadataIdentifierQuickTimeUserDataAuthor: Pointer;
function AVMetadataIdentifierQuickTimeUserDataChapter: Pointer;
function AVMetadataIdentifierQuickTimeUserDataComment: Pointer;
function AVMetadataIdentifierQuickTimeUserDataComposer: Pointer;
function AVMetadataIdentifierQuickTimeUserDataCopyright: Pointer;
function AVMetadataIdentifierQuickTimeUserDataCreationDate: Pointer;
function AVMetadataIdentifierQuickTimeUserDataDescription: Pointer;
function AVMetadataIdentifierQuickTimeUserDataDirector: Pointer;
function AVMetadataIdentifierQuickTimeUserDataDisclaimer: Pointer;
function AVMetadataIdentifierQuickTimeUserDataEncodedBy: Pointer;
function AVMetadataIdentifierQuickTimeUserDataFullName: Pointer;
function AVMetadataIdentifierQuickTimeUserDataGenre: Pointer;
function AVMetadataIdentifierQuickTimeUserDataHostComputer: Pointer;
function AVMetadataIdentifierQuickTimeUserDataInformation: Pointer;
function AVMetadataIdentifierQuickTimeUserDataKeywords: Pointer;
function AVMetadataIdentifierQuickTimeUserDataMake: Pointer;
function AVMetadataIdentifierQuickTimeUserDataModel: Pointer;
function AVMetadataIdentifierQuickTimeUserDataOriginalArtist: Pointer;
function AVMetadataIdentifierQuickTimeUserDataOriginalFormat: Pointer;
function AVMetadataIdentifierQuickTimeUserDataOriginalSource: Pointer;
function AVMetadataIdentifierQuickTimeUserDataPerformers: Pointer;
function AVMetadataIdentifierQuickTimeUserDataProducer: Pointer;
function AVMetadataIdentifierQuickTimeUserDataPublisher: Pointer;
function AVMetadataIdentifierQuickTimeUserDataProduct: Pointer;
function AVMetadataIdentifierQuickTimeUserDataSoftware: Pointer;
function AVMetadataIdentifierQuickTimeUserDataSpecialPlaybackRequirements
  : Pointer;
function AVMetadataIdentifierQuickTimeUserDataTrack: Pointer;
function AVMetadataIdentifierQuickTimeUserDataWarning: Pointer;
function AVMetadataIdentifierQuickTimeUserDataWriter: Pointer;
function AVMetadataIdentifierQuickTimeUserDataURLLink: Pointer;
function AVMetadataIdentifierQuickTimeUserDataLocationISO6709: Pointer;
function AVMetadataIdentifierQuickTimeUserDataTrackName: Pointer;
function AVMetadataIdentifierQuickTimeUserDataCredits: Pointer;
function AVMetadataIdentifierQuickTimeUserDataPhonogramRights: Pointer;
function AVMetadataIdentifierQuickTimeUserDataTaggedCharacteristic: Pointer;
function AVMetadataIdentifierQuickTimeUserDataAccessibilityDescription: Pointer;
function AVMetadataIdentifierISOUserDataCopyright: Pointer;
function AVMetadataIdentifierISOUserDataDate: Pointer;
function AVMetadataIdentifierISOUserDataTaggedCharacteristic: Pointer;
function AVMetadataIdentifierISOUserDataAccessibilityDescription: Pointer;
function AVMetadataIdentifier3GPUserDataCopyright: Pointer;
function AVMetadataIdentifier3GPUserDataAuthor: Pointer;
function AVMetadataIdentifier3GPUserDataPerformer: Pointer;
function AVMetadataIdentifier3GPUserDataGenre: Pointer;
function AVMetadataIdentifier3GPUserDataRecordingYear: Pointer;
function AVMetadataIdentifier3GPUserDataLocation: Pointer;
function AVMetadataIdentifier3GPUserDataTitle: Pointer;
function AVMetadataIdentifier3GPUserDataDescription: Pointer;
function AVMetadataIdentifier3GPUserDataCollection: Pointer;
function AVMetadataIdentifier3GPUserDataUserRating: Pointer;
function AVMetadataIdentifier3GPUserDataThumbnail: Pointer;
function AVMetadataIdentifier3GPUserDataAlbumAndTrack: Pointer;
function AVMetadataIdentifier3GPUserDataKeywordList: Pointer;
function AVMetadataIdentifier3GPUserDataMediaClassification: Pointer;
function AVMetadataIdentifier3GPUserDataMediaRating: Pointer;
function AVMetadataIdentifierQuickTimeMetadataAuthor: Pointer;
function AVMetadataIdentifierQuickTimeMetadataComment: Pointer;
function AVMetadataIdentifierQuickTimeMetadataCopyright: Pointer;
function AVMetadataIdentifierQuickTimeMetadataCreationDate: Pointer;
function AVMetadataIdentifierQuickTimeMetadataDirector: Pointer;
function AVMetadataIdentifierQuickTimeMetadataDisplayName: Pointer;
function AVMetadataIdentifierQuickTimeMetadataInformation: Pointer;
function AVMetadataIdentifierQuickTimeMetadataKeywords: Pointer;
function AVMetadataIdentifierQuickTimeMetadataProducer: Pointer;
function AVMetadataIdentifierQuickTimeMetadataPublisher: Pointer;
function AVMetadataIdentifierQuickTimeMetadataAlbum: Pointer;
function AVMetadataIdentifierQuickTimeMetadataArtist: Pointer;
function AVMetadataIdentifierQuickTimeMetadataArtwork: Pointer;
function AVMetadataIdentifierQuickTimeMetadataDescription: Pointer;
function AVMetadataIdentifierQuickTimeMetadataSoftware: Pointer;
function AVMetadataIdentifierQuickTimeMetadataYear: Pointer;
function AVMetadataIdentifierQuickTimeMetadataGenre: Pointer;
function AVMetadataIdentifierQuickTimeMetadataiXML: Pointer;
function AVMetadataIdentifierQuickTimeMetadataLocationISO6709: Pointer;
function AVMetadataIdentifierQuickTimeMetadataMake: Pointer;
function AVMetadataIdentifierQuickTimeMetadataModel: Pointer;
function AVMetadataIdentifierQuickTimeMetadataArranger: Pointer;
function AVMetadataIdentifierQuickTimeMetadataEncodedBy: Pointer;
function AVMetadataIdentifierQuickTimeMetadataOriginalArtist: Pointer;
function AVMetadataIdentifierQuickTimeMetadataPerformer: Pointer;
function AVMetadataIdentifierQuickTimeMetadataComposer: Pointer;
function AVMetadataIdentifierQuickTimeMetadataCredits: Pointer;
function AVMetadataIdentifierQuickTimeMetadataPhonogramRights: Pointer;
function AVMetadataIdentifierQuickTimeMetadataCameraIdentifier: Pointer;
function AVMetadataIdentifierQuickTimeMetadataCameraFrameReadoutTime: Pointer;
function AVMetadataIdentifierQuickTimeMetadataTitle: Pointer;
function AVMetadataIdentifierQuickTimeMetadataCollectionUser: Pointer;
function AVMetadataIdentifierQuickTimeMetadataRatingUser: Pointer;
function AVMetadataIdentifierQuickTimeMetadataLocationName: Pointer;
function AVMetadataIdentifierQuickTimeMetadataLocationBody: Pointer;
function AVMetadataIdentifierQuickTimeMetadataLocationNote: Pointer;
function AVMetadataIdentifierQuickTimeMetadataLocationRole: Pointer;
function AVMetadataIdentifierQuickTimeMetadataLocationDate: Pointer;
function AVMetadataIdentifierQuickTimeMetadataDirectionFacing: Pointer;
function AVMetadataIdentifierQuickTimeMetadataDirectionMotion: Pointer;
function AVMetadataIdentifierQuickTimeMetadataPreferredAffineTransform: Pointer;
function AVMetadataIdentifierQuickTimeMetadataDetectedFace: Pointer;
function AVMetadataIdentifierQuickTimeMetadataDetectedHumanBody: Pointer;
function AVMetadataIdentifierQuickTimeMetadataDetectedCatBody: Pointer;
function AVMetadataIdentifierQuickTimeMetadataDetectedDogBody: Pointer;
function AVMetadataIdentifierQuickTimeMetadataDetectedSalientObject: Pointer;
function AVMetadataIdentifierQuickTimeMetadataVideoOrientation: Pointer;
function AVMetadataIdentifierQuickTimeMetadataContentIdentifier: Pointer;
function AVMetadataIdentifierQuickTimeMetadataAccessibilityDescription: Pointer;
function AVMetadataIdentifierQuickTimeMetadataIsMontage: Pointer;
function AVMetadataIdentifierQuickTimeMetadataAutoLivePhoto: Pointer;
function AVMetadataIdentifierQuickTimeMetadataLivePhotoVitalityScore: Pointer;
function AVMetadataIdentifierQuickTimeMetadataLivePhotoVitalityScoringVersion
  : Pointer;
function AVMetadataIdentifierQuickTimeMetadataSpatialOverCaptureQualityScore
  : Pointer;
function AVMetadataIdentifierQuickTimeMetadataSpatialOverCaptureQualityScoringVersion
  : Pointer;
function AVMetadataIdentifierQuickTimeMetadataLocationHorizontalAccuracyInMeters
  : Pointer;
function AVMetadataIdentifieriTunesMetadataAlbum: Pointer;
function AVMetadataIdentifieriTunesMetadataArtist: Pointer;
function AVMetadataIdentifieriTunesMetadataUserComment: Pointer;
function AVMetadataIdentifieriTunesMetadataCoverArt: Pointer;
function AVMetadataIdentifieriTunesMetadataCopyright: Pointer;
function AVMetadataIdentifieriTunesMetadataReleaseDate: Pointer;
function AVMetadataIdentifieriTunesMetadataEncodedBy: Pointer;
function AVMetadataIdentifieriTunesMetadataPredefinedGenre: Pointer;
function AVMetadataIdentifieriTunesMetadataUserGenre: Pointer;
function AVMetadataIdentifieriTunesMetadataSongName: Pointer;
function AVMetadataIdentifieriTunesMetadataTrackSubTitle: Pointer;
function AVMetadataIdentifieriTunesMetadataEncodingTool: Pointer;
function AVMetadataIdentifieriTunesMetadataComposer: Pointer;
function AVMetadataIdentifieriTunesMetadataAlbumArtist: Pointer;
function AVMetadataIdentifieriTunesMetadataAccountKind: Pointer;
function AVMetadataIdentifieriTunesMetadataAppleID: Pointer;
function AVMetadataIdentifieriTunesMetadataArtistID: Pointer;
function AVMetadataIdentifieriTunesMetadataSongID: Pointer;
function AVMetadataIdentifieriTunesMetadataDiscCompilation: Pointer;
function AVMetadataIdentifieriTunesMetadataDiscNumber: Pointer;
function AVMetadataIdentifieriTunesMetadataGenreID: Pointer;
function AVMetadataIdentifieriTunesMetadataGrouping: Pointer;
function AVMetadataIdentifieriTunesMetadataPlaylistID: Pointer;
function AVMetadataIdentifieriTunesMetadataContentRating: Pointer;
function AVMetadataIdentifieriTunesMetadataBeatsPerMin: Pointer;
function AVMetadataIdentifieriTunesMetadataTrackNumber: Pointer;
function AVMetadataIdentifieriTunesMetadataArtDirector: Pointer;
function AVMetadataIdentifieriTunesMetadataArranger: Pointer;
function AVMetadataIdentifieriTunesMetadataAuthor: Pointer;
function AVMetadataIdentifieriTunesMetadataLyrics: Pointer;
function AVMetadataIdentifieriTunesMetadataAcknowledgement: Pointer;
function AVMetadataIdentifieriTunesMetadataConductor: Pointer;
function AVMetadataIdentifieriTunesMetadataDescription: Pointer;
function AVMetadataIdentifieriTunesMetadataDirector: Pointer;
function AVMetadataIdentifieriTunesMetadataEQ: Pointer;
function AVMetadataIdentifieriTunesMetadataLinerNotes: Pointer;
function AVMetadataIdentifieriTunesMetadataRecordCompany: Pointer;
function AVMetadataIdentifieriTunesMetadataOriginalArtist: Pointer;
function AVMetadataIdentifieriTunesMetadataPhonogramRights: Pointer;
function AVMetadataIdentifieriTunesMetadataProducer: Pointer;
function AVMetadataIdentifieriTunesMetadataPerformer: Pointer;
function AVMetadataIdentifieriTunesMetadataPublisher: Pointer;
function AVMetadataIdentifieriTunesMetadataSoundEngineer: Pointer;
function AVMetadataIdentifieriTunesMetadataSoloist: Pointer;
function AVMetadataIdentifieriTunesMetadataCredits: Pointer;
function AVMetadataIdentifieriTunesMetadataThanks: Pointer;
function AVMetadataIdentifieriTunesMetadataOnlineExtras: Pointer;
function AVMetadataIdentifieriTunesMetadataExecProducer: Pointer;
function AVMetadataIdentifierID3MetadataAudioEncryption: Pointer;
function AVMetadataIdentifierID3MetadataAttachedPicture: Pointer;
function AVMetadataIdentifierID3MetadataAudioSeekPointIndex: Pointer;
function AVMetadataIdentifierID3MetadataComments: Pointer;
function AVMetadataIdentifierID3MetadataCommercial: Pointer;
function AVMetadataIdentifierID3MetadataCommerical: Pointer;
function AVMetadataIdentifierID3MetadataEncryption: Pointer;
function AVMetadataIdentifierID3MetadataEqualization: Pointer;
function AVMetadataIdentifierID3MetadataEqualization2: Pointer;
function AVMetadataIdentifierID3MetadataEventTimingCodes: Pointer;
function AVMetadataIdentifierID3MetadataGeneralEncapsulatedObject: Pointer;
function AVMetadataIdentifierID3MetadataGroupIdentifier: Pointer;
function AVMetadataIdentifierID3MetadataInvolvedPeopleList_v23: Pointer;
function AVMetadataIdentifierID3MetadataLink: Pointer;
function AVMetadataIdentifierID3MetadataMusicCDIdentifier: Pointer;
function AVMetadataIdentifierID3MetadataMPEGLocationLookupTable: Pointer;
function AVMetadataIdentifierID3MetadataOwnership: Pointer;
function AVMetadataIdentifierID3MetadataPrivate: Pointer;
function AVMetadataIdentifierID3MetadataPlayCounter: Pointer;
function AVMetadataIdentifierID3MetadataPopularimeter: Pointer;
function AVMetadataIdentifierID3MetadataPositionSynchronization: Pointer;
function AVMetadataIdentifierID3MetadataRecommendedBufferSize: Pointer;
function AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment: Pointer;
function AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment2: Pointer;
function AVMetadataIdentifierID3MetadataReverb: Pointer;
function AVMetadataIdentifierID3MetadataSeek: Pointer;
function AVMetadataIdentifierID3MetadataSignature: Pointer;
function AVMetadataIdentifierID3MetadataSynchronizedLyric: Pointer;
function AVMetadataIdentifierID3MetadataSynchronizedTempoCodes: Pointer;
function AVMetadataIdentifierID3MetadataAlbumTitle: Pointer;
function AVMetadataIdentifierID3MetadataBeatsPerMinute: Pointer;
function AVMetadataIdentifierID3MetadataComposer: Pointer;
function AVMetadataIdentifierID3MetadataContentType: Pointer;
function AVMetadataIdentifierID3MetadataCopyright: Pointer;
function AVMetadataIdentifierID3MetadataDate: Pointer;
function AVMetadataIdentifierID3MetadataEncodingTime: Pointer;
function AVMetadataIdentifierID3MetadataPlaylistDelay: Pointer;
function AVMetadataIdentifierID3MetadataOriginalReleaseTime: Pointer;
function AVMetadataIdentifierID3MetadataRecordingTime: Pointer;
function AVMetadataIdentifierID3MetadataReleaseTime: Pointer;
function AVMetadataIdentifierID3MetadataTaggingTime: Pointer;
function AVMetadataIdentifierID3MetadataEncodedBy: Pointer;
function AVMetadataIdentifierID3MetadataLyricist: Pointer;
function AVMetadataIdentifierID3MetadataFileType: Pointer;
function AVMetadataIdentifierID3MetadataTime: Pointer;
function AVMetadataIdentifierID3MetadataInvolvedPeopleList_v24: Pointer;
function AVMetadataIdentifierID3MetadataContentGroupDescription: Pointer;
function AVMetadataIdentifierID3MetadataTitleDescription: Pointer;
function AVMetadataIdentifierID3MetadataSubTitle: Pointer;
function AVMetadataIdentifierID3MetadataInitialKey: Pointer;
function AVMetadataIdentifierID3MetadataLanguage: Pointer;
function AVMetadataIdentifierID3MetadataLength: Pointer;
function AVMetadataIdentifierID3MetadataMusicianCreditsList: Pointer;
function AVMetadataIdentifierID3MetadataMediaType: Pointer;
function AVMetadataIdentifierID3MetadataMood: Pointer;
function AVMetadataIdentifierID3MetadataOriginalAlbumTitle: Pointer;
function AVMetadataIdentifierID3MetadataOriginalFilename: Pointer;
function AVMetadataIdentifierID3MetadataOriginalLyricist: Pointer;
function AVMetadataIdentifierID3MetadataOriginalArtist: Pointer;
function AVMetadataIdentifierID3MetadataOriginalReleaseYear: Pointer;
function AVMetadataIdentifierID3MetadataFileOwner: Pointer;
function AVMetadataIdentifierID3MetadataLeadPerformer: Pointer;
function AVMetadataIdentifierID3MetadataBand: Pointer;
function AVMetadataIdentifierID3MetadataConductor: Pointer;
function AVMetadataIdentifierID3MetadataModifiedBy: Pointer;
function AVMetadataIdentifierID3MetadataPartOfASet: Pointer;
function AVMetadataIdentifierID3MetadataProducedNotice: Pointer;
function AVMetadataIdentifierID3MetadataPublisher: Pointer;
function AVMetadataIdentifierID3MetadataTrackNumber: Pointer;
function AVMetadataIdentifierID3MetadataRecordingDates: Pointer;
function AVMetadataIdentifierID3MetadataInternetRadioStationName: Pointer;
function AVMetadataIdentifierID3MetadataInternetRadioStationOwner: Pointer;
function AVMetadataIdentifierID3MetadataSize: Pointer;
function AVMetadataIdentifierID3MetadataAlbumSortOrder: Pointer;
function AVMetadataIdentifierID3MetadataPerformerSortOrder: Pointer;
function AVMetadataIdentifierID3MetadataTitleSortOrder: Pointer;
function AVMetadataIdentifierID3MetadataInternationalStandardRecordingCode
  : Pointer;
function AVMetadataIdentifierID3MetadataEncodedWith: Pointer;
function AVMetadataIdentifierID3MetadataSetSubtitle: Pointer;
function AVMetadataIdentifierID3MetadataYear: Pointer;
function AVMetadataIdentifierID3MetadataUserText: Pointer;
function AVMetadataIdentifierID3MetadataUniqueFileIdentifier: Pointer;
function AVMetadataIdentifierID3MetadataTermsOfUse: Pointer;
function AVMetadataIdentifierID3MetadataUnsynchronizedLyric: Pointer;
function AVMetadataIdentifierID3MetadataCommercialInformation: Pointer;
function AVMetadataIdentifierID3MetadataCopyrightInformation: Pointer;
function AVMetadataIdentifierID3MetadataOfficialAudioFileWebpage: Pointer;
function AVMetadataIdentifierID3MetadataOfficialArtistWebpage: Pointer;
function AVMetadataIdentifierID3MetadataOfficialAudioSourceWebpage: Pointer;
function AVMetadataIdentifierID3MetadataOfficialInternetRadioStationHomepage
  : Pointer;
function AVMetadataIdentifierID3MetadataPayment: Pointer;
function AVMetadataIdentifierID3MetadataOfficialPublisherWebpage: Pointer;
function AVMetadataIdentifierID3MetadataUserURL: Pointer;
function AVMetadataIdentifierIcyMetadataStreamTitle: Pointer;
function AVMetadataIdentifierIcyMetadataStreamURL: Pointer;
function AVFragmentedMovieTrackTimeRangeDidChangeNotification: NSString;
function AVFragmentedMovieTrackSegmentsDidChangeNotification: NSString;
function AVFragmentedMovieTrackTotalSampleDataLengthDidChangeNotification
  : NSString;
function AVMovieReferenceRestrictionsKey: NSString;
function AVMovieShouldSupportAliasDataReferencesKey: NSString;
function AVFragmentedMovieContainsMovieFragmentsDidChangeNotification: NSString;
function AVFragmentedMovieDurationDidChangeNotification: NSString;
function AVFragmentedMovieWasDefragmentedNotification: NSString;
function AVOutputSettingsPreset640x480: Pointer;
function AVOutputSettingsPreset960x540: Pointer;
function AVOutputSettingsPreset1280x720: Pointer;
function AVOutputSettingsPreset1920x1080: Pointer;
function AVOutputSettingsPreset3840x2160: Pointer;
function AVOutputSettingsPresetHEVC1920x1080: Pointer;
function AVOutputSettingsPresetHEVC1920x1080WithAlpha: Pointer;
function AVOutputSettingsPresetHEVC3840x2160: Pointer;
function AVOutputSettingsPresetHEVC3840x2160WithAlpha: Pointer;
function AVOutputSettingsPresetHEVC7680x4320: Pointer;
function AVPlayerRateDidChangeNotification: Pointer;
function AVPlayerRateDidChangeReasonKey: NSString;
function AVPlayerRateDidChangeOriginatingParticipantKey: NSString;
function AVPlayerRateDidChangeReasonSetRateCalled: Pointer;
function AVPlayerRateDidChangeReasonSetRateFailed: Pointer;
function AVPlayerRateDidChangeReasonAudioSessionInterrupted: Pointer;
function AVPlayerRateDidChangeReasonAppBackgrounded: Pointer;
function AVPlayerWaitingToMinimizeStallsReason: Pointer;
function AVPlayerWaitingWhileEvaluatingBufferingRateReason: Pointer;
function AVPlayerWaitingWithNoItemToPlayReason: Pointer;
function AVPlayerWaitingForCoordinatedPlaybackReason: Pointer;
function AVPlayerAvailableHDRModesDidChangeNotification: Pointer;
function AVPlayerEligibleForHDRPlaybackDidChangeNotification: Pointer;
function AVCoordinatedPlaybackSuspensionReasonAudioSessionInterrupted: Pointer;
function AVCoordinatedPlaybackSuspensionReasonStallRecovery: Pointer;
function AVCoordinatedPlaybackSuspensionReasonPlayingInterstitial: Pointer;
function AVCoordinatedPlaybackSuspensionReasonCoordinatedPlaybackNotPossible
  : Pointer;
function AVCoordinatedPlaybackSuspensionReasonUserActionRequired: Pointer;
function AVCoordinatedPlaybackSuspensionReasonUserIsChangingCurrentTime
  : Pointer;
function AVPlaybackCoordinatorOtherParticipantsDidChangeNotification: Pointer;
function AVPlaybackCoordinatorSuspensionReasonsDidChangeNotification: Pointer;
function AVPlayerItemTimeJumpedNotification: Pointer;
function AVPlayerItemDidPlayToEndTimeNotification: NSString;
function AVPlayerItemFailedToPlayToEndTimeNotification: NSString;
function AVPlayerItemPlaybackStalledNotification: NSString;
function AVPlayerItemNewAccessLogEntryNotification: NSString;
function AVPlayerItemNewErrorLogEntryNotification: NSString;
function AVPlayerItemRecommendedTimeOffsetFromLiveDidChangeNotification
  : Pointer;
function AVPlayerItemMediaSelectionDidChangeNotification: Pointer;
function AVPlayerItemFailedToPlayToEndTimeErrorKey: NSString;
function AVPlayerItemTimeJumpedOriginatingParticipantKey: NSString;
function AVPlayerItemLegibleOutputTextStylingResolutionDefault: Pointer;
function AVPlayerItemLegibleOutputTextStylingResolutionSourceAndRulesOnly
  : Pointer;
function AVPlayerInterstitialEventNoCue: Pointer;
function AVPlayerInterstitialEventJoinCue: Pointer;
function AVPlayerInterstitialEventLeaveCue: Pointer;
function AVPlayerInterstitialEventMonitorEventsDidChangeNotification: Pointer;
function AVPlayerInterstitialEventMonitorCurrentEventDidChangeNotification
  : Pointer;
function AVPlayerInterstitialEventMonitorAssetListResponseStatusDidChangeNotification
  : Pointer;
function AVPlayerInterstitialEventMonitorAssetListResponseStatusDidChangeEventKey
  : NSString;
function AVPlayerInterstitialEventMonitorAssetListResponseStatusDidChangeStatusKey
  : NSString;
function AVPlayerInterstitialEventMonitorAssetListResponseStatusDidChangeErrorKey
  : NSString;
function AVPlayerWaitingDuringInterstitialEventReason: Pointer;
function AVRouteDetectorMultipleRoutesDetectedDidChangeNotification: Pointer;
function AVSampleBufferAudioRendererWasFlushedAutomaticallyNotification
  : Pointer;
function AVSampleBufferAudioRendererOutputConfigurationDidChangeNotification
  : Pointer;
function AVSampleBufferAudioRendererFlushTimeKey: NSString;
function AVSampleBufferDisplayLayerFailedToDecodeNotification: NSString;
function AVSampleBufferDisplayLayerFailedToDecodeNotificationErrorKey: NSString;
function AVSampleBufferDisplayLayerRequiresFlushToResumeDecodingDidChangeNotification
  : Pointer;
function AVSampleBufferDisplayLayerOutputObscuredDueToInsufficientExternalProtectionDidChangeNotification
  : Pointer;
function AVSampleBufferRenderSynchronizerRateDidChangeNotification: Pointer;


// ===== External functions =====

const
  libAVFoundation =
    '/System/Library/Frameworks/AVFoundation.framework/AVFoundation';
function AVSampleBufferAttachContentKey(sbuf: CMSampleBufferRef;
  contentKey: Pointer { AVContentKey }; outError: Pointer { NSError } )
  : Boolean; cdecl; external libAVFoundation name _PU +
  'AVSampleBufferAttachContentKey';
function AVMakeRectWithAspectRatioInsideRect(aspectRatio: CGSize;
  boundingRect: CGRect): CGRect; cdecl;
  external libAVFoundation name _PU + 'AVMakeRectWithAspectRatioInsideRect';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AVFoundationModule: THandle;

{$ENDIF IOS}

function AVContentKeyRequestRequiresValidationDataInSecureTokenKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVContentKeyRequestRequiresValidationDataInSecureTokenKey');
end;

function AVContentKeyRequestProtocolVersionsKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVContentKeyRequestProtocolVersionsKey');
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

function AVVideoCodecKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecKey');
end;

function AVVideoCodecHEVC: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecHEVC');
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

function AVVideoColorPropertiesKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoColorPropertiesKey');
end;

function AVVideoColorPrimariesKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoColorPrimariesKey');
end;

function AVVideoColorPrimaries_ITU_R_709_2: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoColorPrimaries_ITU_R_709_2');
end;

function AVVideoColorPrimaries_EBU_3213: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoColorPrimaries_EBU_3213');
end;

function AVVideoColorPrimaries_SMPTE_C: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoColorPrimaries_SMPTE_C');
end;

function AVVideoColorPrimaries_P3_D65: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoColorPrimaries_P3_D65');
end;

function AVVideoColorPrimaries_ITU_R_2020: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoColorPrimaries_ITU_R_2020');
end;

function AVVideoTransferFunctionKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoTransferFunctionKey');
end;

function AVVideoTransferFunction_ITU_R_709_2: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoTransferFunction_ITU_R_709_2');
end;

function AVVideoTransferFunction_SMPTE_240M_1995: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoTransferFunction_SMPTE_240M_1995');
end;

function AVVideoTransferFunction_SMPTE_ST_2084_PQ: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoTransferFunction_SMPTE_ST_2084_PQ');
end;

function AVVideoTransferFunction_ITU_R_2100_HLG: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoTransferFunction_ITU_R_2100_HLG');
end;

function AVVideoTransferFunction_Linear: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoTransferFunction_Linear');
end;

function AVVideoYCbCrMatrixKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoYCbCrMatrixKey');
end;

function AVVideoYCbCrMatrix_ITU_R_709_2: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoYCbCrMatrix_ITU_R_709_2');
end;

function AVVideoYCbCrMatrix_ITU_R_601_4: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoYCbCrMatrix_ITU_R_601_4');
end;

function AVVideoYCbCrMatrix_SMPTE_240M_1995: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoYCbCrMatrix_SMPTE_240M_1995');
end;

function AVVideoYCbCrMatrix_ITU_R_2020: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoYCbCrMatrix_ITU_R_2020');
end;

function AVVideoAllowWideColorKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoAllowWideColorKey');
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

function AVVideoAppleProRAWBitDepthKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoAppleProRAWBitDepthKey');
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

function AVVideoDecompressionPropertiesKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoDecompressionPropertiesKey');
end;

function AVVideoEncoderSpecificationKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVVideoEncoderSpecificationKey');
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

function AVURLAssetAllowsCellularAccessKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVURLAssetAllowsCellularAccessKey');
end;

function AVURLAssetAllowsExpensiveNetworkAccessKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVURLAssetAllowsExpensiveNetworkAccessKey');
end;

function AVURLAssetAllowsConstrainedNetworkAccessKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVURLAssetAllowsConstrainedNetworkAccessKey');
end;

function AVURLAssetShouldSupportAliasDataReferencesKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVURLAssetShouldSupportAliasDataReferencesKey');
end;

function AVURLAssetURLRequestAttributionKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVURLAssetURLRequestAttributionKey');
end;

function AVURLAssetHTTPUserAgentKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVURLAssetHTTPUserAgentKey');
end;

function AVURLAssetPrimarySessionIdentifierKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVURLAssetPrimarySessionIdentifierKey');
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

function AVAssetDownloadTaskMinimumRequiredPresentationSizeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetDownloadTaskMinimumRequiredPresentationSizeKey');
end;

function AVAssetDownloadTaskMediaSelectionKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetDownloadTaskMediaSelectionKey');
end;

function AVAssetDownloadTaskMediaSelectionPrefersMultichannelKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetDownloadTaskMediaSelectionPrefersMultichannelKey');
end;

function AVAssetDownloadTaskPrefersLosslessAudioKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetDownloadTaskPrefersLosslessAudioKey');
end;

function AVAssetDownloadTaskPrefersHDRKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetDownloadTaskPrefersHDRKey');
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

function AVAssetExportPresetHEVCHighestQuality: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetExportPresetHEVCHighestQuality');
end;

function AVAssetExportPresetHEVCHighestQualityWithAlpha: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetExportPresetHEVCHighestQualityWithAlpha');
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

function AVAssetExportPresetHEVC1920x1080: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetExportPresetHEVC1920x1080');
end;

function AVAssetExportPresetHEVC1920x1080WithAlpha: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetExportPresetHEVC1920x1080WithAlpha');
end;

function AVAssetExportPresetHEVC3840x2160: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetExportPresetHEVC3840x2160');
end;

function AVAssetExportPresetHEVC3840x2160WithAlpha: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetExportPresetHEVC3840x2160WithAlpha');
end;

function AVAssetExportPresetHEVC7680x4320: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetExportPresetHEVC7680x4320');
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

function AVAssetExportPresetAppleProRes422LPCM: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetExportPresetAppleProRes422LPCM');
end;

function AVAssetExportPresetAppleProRes4444LPCM: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetExportPresetAppleProRes4444LPCM');
end;

function AVAssetResourceLoadingRequestStreamingContentKeyRequestRequiresPersistentKey
  : NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVAssetResourceLoadingRequestStreamingContentKeyRequestRequiresPersistentKey');
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

function AVCaptureSessionInterruptionSystemPressureStateKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionInterruptionSystemPressureStateKey');
end;

function AVCaptureSessionInterruptionEndedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureSessionInterruptionEndedNotification');
end;

function AVCaptureInputPortFormatDescriptionDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVCaptureInputPortFormatDescriptionDidChangeNotification');
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

function AVFragmentedMovieTrackTimeRangeDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVFragmentedMovieTrackTimeRangeDidChangeNotification');
end;

function AVFragmentedMovieTrackSegmentsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVFragmentedMovieTrackSegmentsDidChangeNotification');
end;

function AVFragmentedMovieTrackTotalSampleDataLengthDidChangeNotification
  : NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVFragmentedMovieTrackTotalSampleDataLengthDidChangeNotification');
end;

function AVMovieReferenceRestrictionsKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMovieReferenceRestrictionsKey');
end;

function AVMovieShouldSupportAliasDataReferencesKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVMovieShouldSupportAliasDataReferencesKey');
end;

function AVFragmentedMovieContainsMovieFragmentsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVFragmentedMovieContainsMovieFragmentsDidChangeNotification');
end;

function AVFragmentedMovieDurationDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVFragmentedMovieDurationDidChangeNotification');
end;

function AVFragmentedMovieWasDefragmentedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVFragmentedMovieWasDefragmentedNotification');
end;

function AVPlayerRateDidChangeReasonKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerRateDidChangeReasonKey');
end;

function AVPlayerRateDidChangeOriginatingParticipantKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerRateDidChangeOriginatingParticipantKey');
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

function AVPlayerItemTimeJumpedOriginatingParticipantKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerItemTimeJumpedOriginatingParticipantKey');
end;

function AVPlayerInterstitialEventMonitorAssetListResponseStatusDidChangeEventKey
  : NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerInterstitialEventMonitorAssetListResponseStatusDidChangeEventKey');
end;

function AVPlayerInterstitialEventMonitorAssetListResponseStatusDidChangeStatusKey
  : NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerInterstitialEventMonitorAssetListResponseStatusDidChangeStatusKey');
end;

function AVPlayerInterstitialEventMonitorAssetListResponseStatusDidChangeErrorKey
  : NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVPlayerInterstitialEventMonitorAssetListResponseStatusDidChangeErrorKey');
end;

function AVSampleBufferAudioRendererFlushTimeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation,
    'AVSampleBufferAudioRendererFlushTimeKey');
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

function AVCoreAnimationBeginTimeAtZero: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCoreAnimationBeginTimeAtZero');
end;

function AVLayerVideoGravityResizeAspect: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVLayerVideoGravityResizeAspect');
end;

function AVLayerVideoGravityResizeAspectFill: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVLayerVideoGravityResizeAspectFill');
end;

function AVLayerVideoGravityResize: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVLayerVideoGravityResize');
end;

function AVContentKeySystemFairPlayStreaming: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVContentKeySystemFairPlayStreaming');
end;

function AVContentKeySystemClearKey: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVContentKeySystemClearKey');
end;

function AVContentKeySystemAuthorizationToken: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVContentKeySystemAuthorizationToken');
end;

function AVContentKeySessionServerPlaybackContextOptionProtocolVersions
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVContentKeySessionServerPlaybackContextOptionProtocolVersions');
end;

function AVContentKeySessionServerPlaybackContextOptionServerChallenge: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVContentKeySessionServerPlaybackContextOptionServerChallenge');
end;

function AVContentKeyRequestRetryReasonTimedOut: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVContentKeyRequestRetryReasonTimedOut');
end;

function AVContentKeyRequestRetryReasonReceivedResponseWithExpiredLease
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVContentKeyRequestRetryReasonReceivedResponseWithExpiredLease');
end;

function AVContentKeyRequestRetryReasonReceivedObsoleteContentKey: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVContentKeyRequestRetryReasonReceivedObsoleteContentKey');
end;

function AVMediaTypeVideo: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMediaTypeVideo');
end;

function AVMediaTypeAudio: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMediaTypeAudio');
end;

function AVMediaTypeText: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMediaTypeText');
end;

function AVMediaTypeClosedCaption: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMediaTypeClosedCaption');
end;

function AVMediaTypeSubtitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMediaTypeSubtitle');
end;

function AVMediaTypeTimecode: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMediaTypeTimecode');
end;

function AVMediaTypeMetadata: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMediaTypeMetadata');
end;

function AVMediaTypeMuxed: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMediaTypeMuxed');
end;

function AVVideoRangeSDR: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVVideoRangeSDR');
end;

function AVVideoRangeHLG: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVVideoRangeHLG');
end;

function AVVideoRangePQ: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVVideoRangePQ');
end;

function AVMediaTypeMetadataObject: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMediaTypeMetadataObject');
end;

function AVMediaTypeDepthData: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMediaTypeDepthData');
end;

function AVMediaCharacteristicVisual: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMediaCharacteristicVisual');
end;

function AVMediaCharacteristicAudible: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMediaCharacteristicAudible');
end;

function AVMediaCharacteristicLegible: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMediaCharacteristicLegible');
end;

function AVMediaCharacteristicFrameBased: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicFrameBased');
end;

function AVMediaCharacteristicUsesWideGamutColorSpace: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicUsesWideGamutColorSpace');
end;

function AVMediaCharacteristicContainsHDRVideo: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicContainsHDRVideo');
end;

function AVMediaCharacteristicContainsAlphaChannel: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicContainsAlphaChannel');
end;

function AVMediaCharacteristicIsMainProgramContent: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicIsMainProgramContent');
end;

function AVMediaCharacteristicIsAuxiliaryContent: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicIsAuxiliaryContent');
end;

function AVMediaCharacteristicIsOriginalContent: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicIsOriginalContent');
end;

function AVMediaCharacteristicContainsOnlyForcedSubtitles: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicContainsOnlyForcedSubtitles');
end;

function AVMediaCharacteristicTranscribesSpokenDialogForAccessibility: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicTranscribesSpokenDialogForAccessibility');
end;

function AVMediaCharacteristicDescribesMusicAndSoundForAccessibility: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicDescribesMusicAndSoundForAccessibility');
end;

function AVMediaCharacteristicEasyToRead: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicEasyToRead');
end;

function AVMediaCharacteristicDescribesVideoForAccessibility: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicDescribesVideoForAccessibility');
end;

function AVMediaCharacteristicLanguageTranslation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicLanguageTranslation');
end;

function AVMediaCharacteristicDubbedTranslation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicDubbedTranslation');
end;

function AVMediaCharacteristicVoiceOverTranslation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMediaCharacteristicVoiceOverTranslation');
end;

function AVFileTypeQuickTimeMovie: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeQuickTimeMovie');
end;

function AVFileTypeMPEG4: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeMPEG4');
end;

function AVFileTypeAppleM4V: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeAppleM4V');
end;

function AVFileTypeAppleM4A: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeAppleM4A');
end;

function AVFileType3GPP: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileType3GPP');
end;

function AVFileType3GPP2: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileType3GPP2');
end;

function AVFileTypeCoreAudioFormat: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeCoreAudioFormat');
end;

function AVFileTypeWAVE: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeWAVE');
end;

function AVFileTypeAIFF: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeAIFF');
end;

function AVFileTypeAIFC: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeAIFC');
end;

function AVFileTypeAMR: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeAMR');
end;

function AVFileTypeMPEGLayer3: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeMPEGLayer3');
end;

function AVFileTypeSunAU: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeSunAU');
end;

function AVFileTypeAC3: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeAC3');
end;

function AVFileTypeEnhancedAC3: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeEnhancedAC3');
end;

function AVFileTypeJPEG: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeJPEG');
end;

function AVFileTypeDNG: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeDNG');
end;

function AVFileTypeHEIC: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeHEIC');
end;

function AVFileTypeAVCI: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeAVCI');
end;

function AVFileTypeHEIF: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeHEIF');
end;

function AVFileTypeTIFF: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeTIFF');
end;

function AVFileTypeAppleiTT: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeAppleiTT');
end;

function AVFileTypeSCC: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFileTypeSCC');
end;

function AVFileTypeProfileMPEG4AppleHLS: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVFileTypeProfileMPEG4AppleHLS');
end;

function AVFileTypeProfileMPEG4CMAFCompliant: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVFileTypeProfileMPEG4CMAFCompliant');
end;

function AVMetadataKeySpaceCommon: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataKeySpaceCommon');
end;

function AVMetadataCommonKeyTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyTitle');
end;

function AVMetadataCommonKeyCreator: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyCreator');
end;

function AVMetadataCommonKeySubject: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeySubject');
end;

function AVMetadataCommonKeyDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonKeyDescription');
end;

function AVMetadataCommonKeyPublisher: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyPublisher');
end;

function AVMetadataCommonKeyContributor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonKeyContributor');
end;

function AVMetadataCommonKeyCreationDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonKeyCreationDate');
end;

function AVMetadataCommonKeyLastModifiedDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonKeyLastModifiedDate');
end;

function AVMetadataCommonKeyType: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyType');
end;

function AVMetadataCommonKeyFormat: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyFormat');
end;

function AVMetadataCommonKeyIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyIdentifier');
end;

function AVMetadataCommonKeySource: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeySource');
end;

function AVMetadataCommonKeyLanguage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyLanguage');
end;

function AVMetadataCommonKeyRelation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyRelation');
end;

function AVMetadataCommonKeyLocation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyLocation');
end;

function AVMetadataCommonKeyCopyrights: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyCopyrights');
end;

function AVMetadataCommonKeyAlbumName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyAlbumName');
end;

function AVMetadataCommonKeyAuthor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyAuthor');
end;

function AVMetadataCommonKeyArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyArtist');
end;

function AVMetadataCommonKeyArtwork: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyArtwork');
end;

function AVMetadataCommonKeyMake: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyMake');
end;

function AVMetadataCommonKeyModel: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeyModel');
end;

function AVMetadataCommonKeySoftware: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataCommonKeySoftware');
end;

function AVMetadataCommonKeyAccessibilityDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonKeyAccessibilityDescription');
end;

function AVMetadataFormatQuickTimeUserData: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataFormatQuickTimeUserData');
end;

function AVMetadataKeySpaceQuickTimeUserData: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataKeySpaceQuickTimeUserData');
end;

function AVMetadataQuickTimeUserDataKeyAlbum: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyAlbum');
end;

function AVMetadataQuickTimeUserDataKeyArranger: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyArranger');
end;

function AVMetadataQuickTimeUserDataKeyArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyArtist');
end;

function AVMetadataQuickTimeUserDataKeyAuthor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyAuthor');
end;

function AVMetadataQuickTimeUserDataKeyChapter: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyChapter');
end;

function AVMetadataQuickTimeUserDataKeyComment: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyComment');
end;

function AVMetadataQuickTimeUserDataKeyComposer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyComposer');
end;

function AVMetadataQuickTimeUserDataKeyCopyright: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyCopyright');
end;

function AVMetadataQuickTimeUserDataKeyCreationDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyCreationDate');
end;

function AVMetadataQuickTimeUserDataKeyDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyDescription');
end;

function AVMetadataQuickTimeUserDataKeyDirector: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyDirector');
end;

function AVMetadataQuickTimeUserDataKeyDisclaimer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyDisclaimer');
end;

function AVMetadataQuickTimeUserDataKeyEncodedBy: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyEncodedBy');
end;

function AVMetadataQuickTimeUserDataKeyFullName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyFullName');
end;

function AVMetadataQuickTimeUserDataKeyGenre: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyGenre');
end;

function AVMetadataQuickTimeUserDataKeyHostComputer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyHostComputer');
end;

function AVMetadataQuickTimeUserDataKeyInformation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyInformation');
end;

function AVMetadataQuickTimeUserDataKeyKeywords: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyKeywords');
end;

function AVMetadataQuickTimeUserDataKeyMake: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyMake');
end;

function AVMetadataQuickTimeUserDataKeyModel: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyModel');
end;

function AVMetadataQuickTimeUserDataKeyOriginalArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyOriginalArtist');
end;

function AVMetadataQuickTimeUserDataKeyOriginalFormat: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyOriginalFormat');
end;

function AVMetadataQuickTimeUserDataKeyOriginalSource: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyOriginalSource');
end;

function AVMetadataQuickTimeUserDataKeyPerformers: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyPerformers');
end;

function AVMetadataQuickTimeUserDataKeyProducer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyProducer');
end;

function AVMetadataQuickTimeUserDataKeyPublisher: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyPublisher');
end;

function AVMetadataQuickTimeUserDataKeyProduct: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyProduct');
end;

function AVMetadataQuickTimeUserDataKeySoftware: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeySoftware');
end;

function AVMetadataQuickTimeUserDataKeySpecialPlaybackRequirements: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeySpecialPlaybackRequirements');
end;

function AVMetadataQuickTimeUserDataKeyTrack: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyTrack');
end;

function AVMetadataQuickTimeUserDataKeyWarning: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyWarning');
end;

function AVMetadataQuickTimeUserDataKeyWriter: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyWriter');
end;

function AVMetadataQuickTimeUserDataKeyURLLink: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyURLLink');
end;

function AVMetadataQuickTimeUserDataKeyLocationISO6709: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyLocationISO6709');
end;

function AVMetadataQuickTimeUserDataKeyTrackName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyTrackName');
end;

function AVMetadataQuickTimeUserDataKeyCredits: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyCredits');
end;

function AVMetadataQuickTimeUserDataKeyPhonogramRights: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyPhonogramRights');
end;

function AVMetadataQuickTimeUserDataKeyTaggedCharacteristic: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyTaggedCharacteristic');
end;

function AVMetadataQuickTimeUserDataKeyAccessibilityDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeUserDataKeyAccessibilityDescription');
end;

function AVMetadataFormatISOUserData: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataFormatISOUserData');
end;

function AVMetadataKeySpaceISOUserData: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataKeySpaceISOUserData');
end;

function AVMetadataISOUserDataKeyCopyright: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataISOUserDataKeyCopyright');
end;

function AVMetadataISOUserDataKeyTaggedCharacteristic: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataISOUserDataKeyTaggedCharacteristic');
end;

function AVMetadataISOUserDataKeyDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataISOUserDataKeyDate');
end;

function AVMetadataISOUserDataKeyAccessibilityDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataISOUserDataKeyAccessibilityDescription');
end;

function AVMetadata3GPUserDataKeyCopyright: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyCopyright');
end;

function AVMetadata3GPUserDataKeyAuthor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyAuthor');
end;

function AVMetadata3GPUserDataKeyPerformer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyPerformer');
end;

function AVMetadata3GPUserDataKeyGenre: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadata3GPUserDataKeyGenre');
end;

function AVMetadata3GPUserDataKeyRecordingYear: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyRecordingYear');
end;

function AVMetadata3GPUserDataKeyLocation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyLocation');
end;

function AVMetadata3GPUserDataKeyTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadata3GPUserDataKeyTitle');
end;

function AVMetadata3GPUserDataKeyDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyDescription');
end;

function AVMetadata3GPUserDataKeyCollection: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyCollection');
end;

function AVMetadata3GPUserDataKeyUserRating: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyUserRating');
end;

function AVMetadata3GPUserDataKeyThumbnail: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyThumbnail');
end;

function AVMetadata3GPUserDataKeyAlbumAndTrack: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyAlbumAndTrack');
end;

function AVMetadata3GPUserDataKeyKeywordList: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyKeywordList');
end;

function AVMetadata3GPUserDataKeyMediaClassification: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyMediaClassification');
end;

function AVMetadata3GPUserDataKeyMediaRating: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadata3GPUserDataKeyMediaRating');
end;

function AVMetadataFormatQuickTimeMetadata: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataFormatQuickTimeMetadata');
end;

function AVMetadataKeySpaceQuickTimeMetadata: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataKeySpaceQuickTimeMetadata');
end;

function AVMetadataQuickTimeMetadataKeyAuthor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyAuthor');
end;

function AVMetadataQuickTimeMetadataKeyComment: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyComment');
end;

function AVMetadataQuickTimeMetadataKeyCopyright: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyCopyright');
end;

function AVMetadataQuickTimeMetadataKeyCreationDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyCreationDate');
end;

function AVMetadataQuickTimeMetadataKeyDirector: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyDirector');
end;

function AVMetadataQuickTimeMetadataKeyDisplayName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyDisplayName');
end;

function AVMetadataQuickTimeMetadataKeyInformation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyInformation');
end;

function AVMetadataQuickTimeMetadataKeyKeywords: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyKeywords');
end;

function AVMetadataQuickTimeMetadataKeyProducer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyProducer');
end;

function AVMetadataQuickTimeMetadataKeyPublisher: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyPublisher');
end;

function AVMetadataQuickTimeMetadataKeyAlbum: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyAlbum');
end;

function AVMetadataQuickTimeMetadataKeyArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyArtist');
end;

function AVMetadataQuickTimeMetadataKeyArtwork: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyArtwork');
end;

function AVMetadataQuickTimeMetadataKeyDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyDescription');
end;

function AVMetadataQuickTimeMetadataKeySoftware: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeySoftware');
end;

function AVMetadataQuickTimeMetadataKeyYear: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyYear');
end;

function AVMetadataQuickTimeMetadataKeyGenre: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyGenre');
end;

function AVMetadataQuickTimeMetadataKeyiXML: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyiXML');
end;

function AVMetadataQuickTimeMetadataKeyLocationISO6709: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyLocationISO6709');
end;

function AVMetadataQuickTimeMetadataKeyMake: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyMake');
end;

function AVMetadataQuickTimeMetadataKeyModel: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyModel');
end;

function AVMetadataQuickTimeMetadataKeyArranger: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyArranger');
end;

function AVMetadataQuickTimeMetadataKeyEncodedBy: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyEncodedBy');
end;

function AVMetadataQuickTimeMetadataKeyOriginalArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyOriginalArtist');
end;

function AVMetadataQuickTimeMetadataKeyPerformer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyPerformer');
end;

function AVMetadataQuickTimeMetadataKeyComposer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyComposer');
end;

function AVMetadataQuickTimeMetadataKeyCredits: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyCredits');
end;

function AVMetadataQuickTimeMetadataKeyPhonogramRights: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyPhonogramRights');
end;

function AVMetadataQuickTimeMetadataKeyCameraIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyCameraIdentifier');
end;

function AVMetadataQuickTimeMetadataKeyCameraFrameReadoutTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyCameraFrameReadoutTime');
end;

function AVMetadataQuickTimeMetadataKeyTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyTitle');
end;

function AVMetadataQuickTimeMetadataKeyCollectionUser: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyCollectionUser');
end;

function AVMetadataQuickTimeMetadataKeyRatingUser: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyRatingUser');
end;

function AVMetadataQuickTimeMetadataKeyLocationName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyLocationName');
end;

function AVMetadataQuickTimeMetadataKeyLocationBody: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyLocationBody');
end;

function AVMetadataQuickTimeMetadataKeyLocationNote: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyLocationNote');
end;

function AVMetadataQuickTimeMetadataKeyLocationRole: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyLocationRole');
end;

function AVMetadataQuickTimeMetadataKeyLocationDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyLocationDate');
end;

function AVMetadataQuickTimeMetadataKeyDirectionFacing: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyDirectionFacing');
end;

function AVMetadataQuickTimeMetadataKeyDirectionMotion: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyDirectionMotion');
end;

function AVMetadataQuickTimeMetadataKeyContentIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyContentIdentifier');
end;

function AVMetadataQuickTimeMetadataKeyAccessibilityDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyAccessibilityDescription');
end;

function AVMetadataQuickTimeMetadataKeyIsMontage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataQuickTimeMetadataKeyIsMontage');
end;

function AVMetadataFormatiTunesMetadata: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataFormatiTunesMetadata');
end;

function AVMetadataKeySpaceiTunes: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataKeySpaceiTunes');
end;

function AVMetadataiTunesMetadataKeyAlbum: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyAlbum');
end;

function AVMetadataiTunesMetadataKeyArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyArtist');
end;

function AVMetadataiTunesMetadataKeyUserComment: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyUserComment');
end;

function AVMetadataiTunesMetadataKeyCoverArt: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyCoverArt');
end;

function AVMetadataiTunesMetadataKeyCopyright: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyCopyright');
end;

function AVMetadataiTunesMetadataKeyReleaseDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyReleaseDate');
end;

function AVMetadataiTunesMetadataKeyEncodedBy: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyEncodedBy');
end;

function AVMetadataiTunesMetadataKeyPredefinedGenre: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyPredefinedGenre');
end;

function AVMetadataiTunesMetadataKeyUserGenre: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyUserGenre');
end;

function AVMetadataiTunesMetadataKeySongName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeySongName');
end;

function AVMetadataiTunesMetadataKeyTrackSubTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyTrackSubTitle');
end;

function AVMetadataiTunesMetadataKeyEncodingTool: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyEncodingTool');
end;

function AVMetadataiTunesMetadataKeyComposer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyComposer');
end;

function AVMetadataiTunesMetadataKeyAlbumArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyAlbumArtist');
end;

function AVMetadataiTunesMetadataKeyAccountKind: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyAccountKind');
end;

function AVMetadataiTunesMetadataKeyAppleID: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyAppleID');
end;

function AVMetadataiTunesMetadataKeyArtistID: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyArtistID');
end;

function AVMetadataiTunesMetadataKeySongID: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeySongID');
end;

function AVMetadataiTunesMetadataKeyDiscCompilation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyDiscCompilation');
end;

function AVMetadataiTunesMetadataKeyDiscNumber: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyDiscNumber');
end;

function AVMetadataiTunesMetadataKeyGenreID: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyGenreID');
end;

function AVMetadataiTunesMetadataKeyGrouping: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyGrouping');
end;

function AVMetadataiTunesMetadataKeyPlaylistID: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyPlaylistID');
end;

function AVMetadataiTunesMetadataKeyContentRating: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyContentRating');
end;

function AVMetadataiTunesMetadataKeyBeatsPerMin: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyBeatsPerMin');
end;

function AVMetadataiTunesMetadataKeyTrackNumber: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyTrackNumber');
end;

function AVMetadataiTunesMetadataKeyArtDirector: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyArtDirector');
end;

function AVMetadataiTunesMetadataKeyArranger: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyArranger');
end;

function AVMetadataiTunesMetadataKeyAuthor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyAuthor');
end;

function AVMetadataiTunesMetadataKeyLyrics: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyLyrics');
end;

function AVMetadataiTunesMetadataKeyAcknowledgement: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyAcknowledgement');
end;

function AVMetadataiTunesMetadataKeyConductor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyConductor');
end;

function AVMetadataiTunesMetadataKeyDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyDescription');
end;

function AVMetadataiTunesMetadataKeyDirector: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyDirector');
end;

function AVMetadataiTunesMetadataKeyEQ: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyEQ');
end;

function AVMetadataiTunesMetadataKeyLinerNotes: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyLinerNotes');
end;

function AVMetadataiTunesMetadataKeyRecordCompany: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyRecordCompany');
end;

function AVMetadataiTunesMetadataKeyOriginalArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyOriginalArtist');
end;

function AVMetadataiTunesMetadataKeyPhonogramRights: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyPhonogramRights');
end;

function AVMetadataiTunesMetadataKeyProducer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyProducer');
end;

function AVMetadataiTunesMetadataKeyPerformer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyPerformer');
end;

function AVMetadataiTunesMetadataKeyPublisher: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyPublisher');
end;

function AVMetadataiTunesMetadataKeySoundEngineer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeySoundEngineer');
end;

function AVMetadataiTunesMetadataKeySoloist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeySoloist');
end;

function AVMetadataiTunesMetadataKeyCredits: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyCredits');
end;

function AVMetadataiTunesMetadataKeyThanks: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyThanks');
end;

function AVMetadataiTunesMetadataKeyOnlineExtras: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyOnlineExtras');
end;

function AVMetadataiTunesMetadataKeyExecProducer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataiTunesMetadataKeyExecProducer');
end;

function AVMetadataFormatID3Metadata: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataFormatID3Metadata');
end;

function AVMetadataKeySpaceID3: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataKeySpaceID3');
end;

function AVMetadataID3MetadataKeyAudioEncryption: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyAudioEncryption');
end;

function AVMetadataID3MetadataKeyAttachedPicture: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyAttachedPicture');
end;

function AVMetadataID3MetadataKeyAudioSeekPointIndex: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyAudioSeekPointIndex');
end;

function AVMetadataID3MetadataKeyComments: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyComments');
end;

function AVMetadataID3MetadataKeyCommercial: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyCommercial');
end;

function AVMetadataID3MetadataKeyCommerical: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyCommerical');
end;

function AVMetadataID3MetadataKeyEncryption: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEncryption');
end;

function AVMetadataID3MetadataKeyEqualization: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEqualization');
end;

function AVMetadataID3MetadataKeyEqualization2: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEqualization2');
end;

function AVMetadataID3MetadataKeyEventTimingCodes: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEventTimingCodes');
end;

function AVMetadataID3MetadataKeyGeneralEncapsulatedObject: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyGeneralEncapsulatedObject');
end;

function AVMetadataID3MetadataKeyGroupIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyGroupIdentifier');
end;

function AVMetadataID3MetadataKeyInvolvedPeopleList_v23: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyInvolvedPeopleList_v23');
end;

function AVMetadataID3MetadataKeyLink: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataID3MetadataKeyLink');
end;

function AVMetadataID3MetadataKeyMusicCDIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyMusicCDIdentifier');
end;

function AVMetadataID3MetadataKeyMPEGLocationLookupTable: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyMPEGLocationLookupTable');
end;

function AVMetadataID3MetadataKeyOwnership: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOwnership');
end;

function AVMetadataID3MetadataKeyPrivate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPrivate');
end;

function AVMetadataID3MetadataKeyPlayCounter: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPlayCounter');
end;

function AVMetadataID3MetadataKeyPopularimeter: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPopularimeter');
end;

function AVMetadataID3MetadataKeyPositionSynchronization: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPositionSynchronization');
end;

function AVMetadataID3MetadataKeyRecommendedBufferSize: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyRecommendedBufferSize');
end;

function AVMetadataID3MetadataKeyRelativeVolumeAdjustment: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyRelativeVolumeAdjustment');
end;

function AVMetadataID3MetadataKeyRelativeVolumeAdjustment2: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyRelativeVolumeAdjustment2');
end;

function AVMetadataID3MetadataKeyReverb: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyReverb');
end;

function AVMetadataID3MetadataKeySeek: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataID3MetadataKeySeek');
end;

function AVMetadataID3MetadataKeySignature: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeySignature');
end;

function AVMetadataID3MetadataKeySynchronizedLyric: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeySynchronizedLyric');
end;

function AVMetadataID3MetadataKeySynchronizedTempoCodes: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeySynchronizedTempoCodes');
end;

function AVMetadataID3MetadataKeyAlbumTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyAlbumTitle');
end;

function AVMetadataID3MetadataKeyBeatsPerMinute: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyBeatsPerMinute');
end;

function AVMetadataID3MetadataKeyComposer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyComposer');
end;

function AVMetadataID3MetadataKeyContentType: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyContentType');
end;

function AVMetadataID3MetadataKeyCopyright: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyCopyright');
end;

function AVMetadataID3MetadataKeyDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataID3MetadataKeyDate');
end;

function AVMetadataID3MetadataKeyEncodingTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEncodingTime');
end;

function AVMetadataID3MetadataKeyPlaylistDelay: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPlaylistDelay');
end;

function AVMetadataID3MetadataKeyOriginalReleaseTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOriginalReleaseTime');
end;

function AVMetadataID3MetadataKeyRecordingTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyRecordingTime');
end;

function AVMetadataID3MetadataKeyReleaseTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyReleaseTime');
end;

function AVMetadataID3MetadataKeyTaggingTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyTaggingTime');
end;

function AVMetadataID3MetadataKeyEncodedBy: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEncodedBy');
end;

function AVMetadataID3MetadataKeyLyricist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyLyricist');
end;

function AVMetadataID3MetadataKeyFileType: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyFileType');
end;

function AVMetadataID3MetadataKeyTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataID3MetadataKeyTime');
end;

function AVMetadataID3MetadataKeyInvolvedPeopleList_v24: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyInvolvedPeopleList_v24');
end;

function AVMetadataID3MetadataKeyContentGroupDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyContentGroupDescription');
end;

function AVMetadataID3MetadataKeyTitleDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyTitleDescription');
end;

function AVMetadataID3MetadataKeySubTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeySubTitle');
end;

function AVMetadataID3MetadataKeyInitialKey: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyInitialKey');
end;

function AVMetadataID3MetadataKeyLanguage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyLanguage');
end;

function AVMetadataID3MetadataKeyLength: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyLength');
end;

function AVMetadataID3MetadataKeyMusicianCreditsList: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyMusicianCreditsList');
end;

function AVMetadataID3MetadataKeyMediaType: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyMediaType');
end;

function AVMetadataID3MetadataKeyMood: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataID3MetadataKeyMood');
end;

function AVMetadataID3MetadataKeyOriginalAlbumTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOriginalAlbumTitle');
end;

function AVMetadataID3MetadataKeyOriginalFilename: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOriginalFilename');
end;

function AVMetadataID3MetadataKeyOriginalLyricist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOriginalLyricist');
end;

function AVMetadataID3MetadataKeyOriginalArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOriginalArtist');
end;

function AVMetadataID3MetadataKeyOriginalReleaseYear: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOriginalReleaseYear');
end;

function AVMetadataID3MetadataKeyFileOwner: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyFileOwner');
end;

function AVMetadataID3MetadataKeyLeadPerformer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyLeadPerformer');
end;

function AVMetadataID3MetadataKeyBand: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataID3MetadataKeyBand');
end;

function AVMetadataID3MetadataKeyConductor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyConductor');
end;

function AVMetadataID3MetadataKeyModifiedBy: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyModifiedBy');
end;

function AVMetadataID3MetadataKeyPartOfASet: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPartOfASet');
end;

function AVMetadataID3MetadataKeyProducedNotice: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyProducedNotice');
end;

function AVMetadataID3MetadataKeyPublisher: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPublisher');
end;

function AVMetadataID3MetadataKeyTrackNumber: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyTrackNumber');
end;

function AVMetadataID3MetadataKeyRecordingDates: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyRecordingDates');
end;

function AVMetadataID3MetadataKeyInternetRadioStationName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyInternetRadioStationName');
end;

function AVMetadataID3MetadataKeyInternetRadioStationOwner: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyInternetRadioStationOwner');
end;

function AVMetadataID3MetadataKeySize: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataID3MetadataKeySize');
end;

function AVMetadataID3MetadataKeyAlbumSortOrder: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyAlbumSortOrder');
end;

function AVMetadataID3MetadataKeyPerformerSortOrder: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPerformerSortOrder');
end;

function AVMetadataID3MetadataKeyTitleSortOrder: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyTitleSortOrder');
end;

function AVMetadataID3MetadataKeyInternationalStandardRecordingCode: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyInternationalStandardRecordingCode');
end;

function AVMetadataID3MetadataKeyEncodedWith: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyEncodedWith');
end;

function AVMetadataID3MetadataKeySetSubtitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeySetSubtitle');
end;

function AVMetadataID3MetadataKeyYear: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataID3MetadataKeyYear');
end;

function AVMetadataID3MetadataKeyUserText: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyUserText');
end;

function AVMetadataID3MetadataKeyUniqueFileIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyUniqueFileIdentifier');
end;

function AVMetadataID3MetadataKeyTermsOfUse: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyTermsOfUse');
end;

function AVMetadataID3MetadataKeyUnsynchronizedLyric: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyUnsynchronizedLyric');
end;

function AVMetadataID3MetadataKeyCommercialInformation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyCommercialInformation');
end;

function AVMetadataID3MetadataKeyCopyrightInformation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyCopyrightInformation');
end;

function AVMetadataID3MetadataKeyOfficialAudioFileWebpage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOfficialAudioFileWebpage');
end;

function AVMetadataID3MetadataKeyOfficialArtistWebpage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOfficialArtistWebpage');
end;

function AVMetadataID3MetadataKeyOfficialAudioSourceWebpage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOfficialAudioSourceWebpage');
end;

function AVMetadataID3MetadataKeyOfficialInternetRadioStationHomepage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOfficialInternetRadioStationHomepage');
end;

function AVMetadataID3MetadataKeyPayment: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyPayment');
end;

function AVMetadataID3MetadataKeyOfficialPublisherWebpage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyOfficialPublisherWebpage');
end;

function AVMetadataID3MetadataKeyUserURL: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataID3MetadataKeyUserURL');
end;

function AVMetadataKeySpaceIcy: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataKeySpaceIcy');
end;

function AVMetadataIcyMetadataKeyStreamTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIcyMetadataKeyStreamTitle');
end;

function AVMetadataIcyMetadataKeyStreamURL: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIcyMetadataKeyStreamURL');
end;

function AVMetadataFormatHLSMetadata: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataFormatHLSMetadata');
end;

function AVMetadataKeySpaceHLSDateRange: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataKeySpaceHLSDateRange');
end;

function AVMetadataKeySpaceAudioFile: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataKeySpaceAudioFile');
end;

function AVMetadataFormatUnknown: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataFormatUnknown');
end;

function AVMetadataExtraAttributeValueURIKey: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataExtraAttributeValueURIKey');
end;

function AVMetadataExtraAttributeBaseURIKey: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataExtraAttributeBaseURIKey');
end;

function AVMetadataExtraAttributeInfoKey: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataExtraAttributeInfoKey');
end;

function AVVideoCodecTypeHEVC: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVVideoCodecTypeHEVC');
end;

function AVVideoCodecTypeH264: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVVideoCodecTypeH264');
end;

function AVVideoCodecTypeJPEG: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVVideoCodecTypeJPEG');
end;

function AVVideoCodecTypeAppleProRes4444: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVVideoCodecTypeAppleProRes4444');
end;

function AVVideoCodecTypeAppleProRes422: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVVideoCodecTypeAppleProRes422');
end;

function AVVideoCodecTypeAppleProRes422HQ: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVVideoCodecTypeAppleProRes422HQ');
end;

function AVVideoCodecTypeAppleProRes422LT: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVVideoCodecTypeAppleProRes422LT');
end;

function AVVideoCodecTypeAppleProRes422Proxy: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVVideoCodecTypeAppleProRes422Proxy');
end;

function AVVideoCodecTypeHEVCWithAlpha: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVVideoCodecTypeHEVCWithAlpha');
end;

function AVVideoApertureModeCleanAperture: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVVideoApertureModeCleanAperture');
end;

function AVVideoApertureModeProductionAperture: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVVideoApertureModeProductionAperture');
end;

function AVVideoApertureModeEncodedPixels: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVVideoApertureModeEncodedPixels');
end;

function AVAssetDownloadedAssetEvictionPriorityImportant: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVAssetDownloadedAssetEvictionPriorityImportant');
end;

function AVAssetDownloadedAssetEvictionPriorityDefault: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVAssetDownloadedAssetEvictionPriorityDefault');
end;

function AVAudioTimePitchAlgorithmLowQualityZeroLatency: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVAudioTimePitchAlgorithmLowQualityZeroLatency');
end;

function AVAudioTimePitchAlgorithmTimeDomain: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVAudioTimePitchAlgorithmTimeDomain');
end;

function AVAudioTimePitchAlgorithmSpectral: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVAudioTimePitchAlgorithmSpectral');
end;

function AVAudioTimePitchAlgorithmVarispeed: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVAudioTimePitchAlgorithmVarispeed');
end;

function AVAssetImageGeneratorApertureModeCleanAperture: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVAssetImageGeneratorApertureModeCleanAperture');
end;

function AVAssetImageGeneratorApertureModeProductionAperture: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVAssetImageGeneratorApertureModeProductionAperture');
end;

function AVAssetImageGeneratorApertureModeEncodedPixels: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVAssetImageGeneratorApertureModeEncodedPixels');
end;

function AVAssetPlaybackConfigurationOptionStereoVideo: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVAssetPlaybackConfigurationOptionStereoVideo');
end;

function AVAssetPlaybackConfigurationOptionStereoMultiviewVideo: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVAssetPlaybackConfigurationOptionStereoMultiviewVideo');
end;

function AVTrackAssociationTypeAudioFallback: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVTrackAssociationTypeAudioFallback');
end;

function AVTrackAssociationTypeChapterList: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVTrackAssociationTypeChapterList');
end;

function AVTrackAssociationTypeForcedSubtitlesOnly: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVTrackAssociationTypeForcedSubtitlesOnly');
end;

function AVTrackAssociationTypeSelectionFollower: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVTrackAssociationTypeSelectionFollower');
end;

function AVTrackAssociationTypeTimecode: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVTrackAssociationTypeTimecode');
end;

function AVTrackAssociationTypeMetadataReferent: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVTrackAssociationTypeMetadataReferent');
end;

function AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData');
end;

function AVAssetWriterInputMediaDataLocationBeforeMainMediaDataNotInterleaved
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVAssetWriterInputMediaDataLocationBeforeMainMediaDataNotInterleaved');
end;

function AVCaptureSessionPresetPhoto: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVCaptureSessionPresetPhoto');
end;

function AVCaptureSessionPresetHigh: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVCaptureSessionPresetHigh');
end;

function AVCaptureSessionPresetMedium: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVCaptureSessionPresetMedium');
end;

function AVCaptureSessionPresetLow: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVCaptureSessionPresetLow');
end;

function AVCaptureSessionPreset320x240: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVCaptureSessionPreset320x240');
end;

function AVCaptureSessionPreset352x288: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVCaptureSessionPreset352x288');
end;

function AVCaptureSessionPreset640x480: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVCaptureSessionPreset640x480');
end;

function AVCaptureSessionPreset960x540: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVCaptureSessionPreset960x540');
end;

function AVCaptureSessionPreset1280x720: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureSessionPreset1280x720');
end;

function AVCaptureSessionPreset1920x1080: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureSessionPreset1920x1080');
end;

function AVCaptureSessionPreset3840x2160: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureSessionPreset3840x2160');
end;

function AVCaptureSessionPresetiFrame960x540: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureSessionPresetiFrame960x540');
end;

function AVCaptureSessionPresetiFrame1280x720: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureSessionPresetiFrame1280x720');
end;

function AVCaptureSessionPresetInputPriority: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureSessionPresetInputPriority');
end;

function AVCaptureDeviceTypeExternalUnknown: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureDeviceTypeExternalUnknown');
end;

function AVCaptureDeviceTypeBuiltInMicrophone: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureDeviceTypeBuiltInMicrophone');
end;

function AVCaptureDeviceTypeBuiltInWideAngleCamera: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureDeviceTypeBuiltInWideAngleCamera');
end;

function AVCaptureDeviceTypeBuiltInTelephotoCamera: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureDeviceTypeBuiltInTelephotoCamera');
end;

function AVCaptureDeviceTypeBuiltInUltraWideCamera: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureDeviceTypeBuiltInUltraWideCamera');
end;

function AVCaptureDeviceTypeBuiltInDualCamera: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureDeviceTypeBuiltInDualCamera');
end;

function AVCaptureDeviceTypeBuiltInDualWideCamera: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureDeviceTypeBuiltInDualWideCamera');
end;

function AVCaptureDeviceTypeBuiltInTripleCamera: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureDeviceTypeBuiltInTripleCamera');
end;

function AVCaptureDeviceTypeBuiltInTrueDepthCamera: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureDeviceTypeBuiltInTrueDepthCamera');
end;

function AVCaptureDeviceTypeBuiltInLiDARDepthCamera: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureDeviceTypeBuiltInLiDARDepthCamera');
end;

function AVCaptureDeviceTypeDeskViewCamera: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureDeviceTypeDeskViewCamera');
end;

function AVCaptureDeviceTypeBuiltInDuoCamera: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureDeviceTypeBuiltInDuoCamera');
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

function AVMetadataObjectTypeHumanBody: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataObjectTypeHumanBody');
end;

function AVMetadataObjectTypeCatBody: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataObjectTypeCatBody');
end;

function AVMetadataObjectTypeDogBody: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataObjectTypeDogBody');
end;

function AVMetadataObjectTypeSalientObject: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypeSalientObject');
end;

function AVMetadataObjectTypeFace: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataObjectTypeFace');
end;

function AVMetadataObjectTypeUPCECode: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataObjectTypeUPCECode');
end;

function AVMetadataObjectTypeCode39Code: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypeCode39Code');
end;

function AVMetadataObjectTypeCode39Mod43Code: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypeCode39Mod43Code');
end;

function AVMetadataObjectTypeEAN13Code: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataObjectTypeEAN13Code');
end;

function AVMetadataObjectTypeEAN8Code: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataObjectTypeEAN8Code');
end;

function AVMetadataObjectTypeCode93Code: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypeCode93Code');
end;

function AVMetadataObjectTypeCode128Code: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypeCode128Code');
end;

function AVMetadataObjectTypePDF417Code: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypePDF417Code');
end;

function AVMetadataObjectTypeQRCode: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataObjectTypeQRCode');
end;

function AVMetadataObjectTypeAztecCode: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataObjectTypeAztecCode');
end;

function AVMetadataObjectTypeInterleaved2of5Code: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypeInterleaved2of5Code');
end;

function AVMetadataObjectTypeITF14Code: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVMetadataObjectTypeITF14Code');
end;

function AVMetadataObjectTypeDataMatrixCode: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypeDataMatrixCode');
end;

function AVMetadataObjectTypeCodabarCode: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypeCodabarCode');
end;

function AVMetadataObjectTypeGS1DataBarCode: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypeGS1DataBarCode');
end;

function AVMetadataObjectTypeGS1DataBarExpandedCode: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypeGS1DataBarExpandedCode');
end;

function AVMetadataObjectTypeGS1DataBarLimitedCode: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypeGS1DataBarLimitedCode');
end;

function AVMetadataObjectTypeMicroQRCode: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypeMicroQRCode');
end;

function AVMetadataObjectTypeMicroPDF417Code: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataObjectTypeMicroPDF417Code');
end;

function AVSemanticSegmentationMatteTypeSkin: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVSemanticSegmentationMatteTypeSkin');
end;

function AVSemanticSegmentationMatteTypeHair: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVSemanticSegmentationMatteTypeHair');
end;

function AVSemanticSegmentationMatteTypeTeeth: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVSemanticSegmentationMatteTypeTeeth');
end;

function AVSemanticSegmentationMatteTypeGlasses: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVSemanticSegmentationMatteTypeGlasses');
end;

function AVCaptureSystemPressureLevelNominal: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureSystemPressureLevelNominal');
end;

function AVCaptureSystemPressureLevelFair: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureSystemPressureLevelFair');
end;

function AVCaptureSystemPressureLevelSerious: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureSystemPressureLevelSerious');
end;

function AVCaptureSystemPressureLevelCritical: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureSystemPressureLevelCritical');
end;

function AVCaptureSystemPressureLevelShutdown: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCaptureSystemPressureLevelShutdown');
end;

function AVFoundationErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVFoundationErrorDomain');
end;

function AVMetadataCommonIdentifierTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierTitle');
end;

function AVMetadataCommonIdentifierCreator: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierCreator');
end;

function AVMetadataCommonIdentifierSubject: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierSubject');
end;

function AVMetadataCommonIdentifierDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierDescription');
end;

function AVMetadataCommonIdentifierPublisher: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierPublisher');
end;

function AVMetadataCommonIdentifierContributor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierContributor');
end;

function AVMetadataCommonIdentifierCreationDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierCreationDate');
end;

function AVMetadataCommonIdentifierLastModifiedDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierLastModifiedDate');
end;

function AVMetadataCommonIdentifierType: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierType');
end;

function AVMetadataCommonIdentifierFormat: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierFormat');
end;

function AVMetadataCommonIdentifierAssetIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierAssetIdentifier');
end;

function AVMetadataCommonIdentifierSource: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierSource');
end;

function AVMetadataCommonIdentifierLanguage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierLanguage');
end;

function AVMetadataCommonIdentifierRelation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierRelation');
end;

function AVMetadataCommonIdentifierLocation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierLocation');
end;

function AVMetadataCommonIdentifierCopyrights: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierCopyrights');
end;

function AVMetadataCommonIdentifierAlbumName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierAlbumName');
end;

function AVMetadataCommonIdentifierAuthor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierAuthor');
end;

function AVMetadataCommonIdentifierArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierArtist');
end;

function AVMetadataCommonIdentifierArtwork: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierArtwork');
end;

function AVMetadataCommonIdentifierMake: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierMake');
end;

function AVMetadataCommonIdentifierModel: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierModel');
end;

function AVMetadataCommonIdentifierSoftware: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierSoftware');
end;

function AVMetadataCommonIdentifierAccessibilityDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataCommonIdentifierAccessibilityDescription');
end;

function AVMetadataIdentifierQuickTimeUserDataAlbum: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataAlbum');
end;

function AVMetadataIdentifierQuickTimeUserDataArranger: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataArranger');
end;

function AVMetadataIdentifierQuickTimeUserDataArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataArtist');
end;

function AVMetadataIdentifierQuickTimeUserDataAuthor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataAuthor');
end;

function AVMetadataIdentifierQuickTimeUserDataChapter: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataChapter');
end;

function AVMetadataIdentifierQuickTimeUserDataComment: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataComment');
end;

function AVMetadataIdentifierQuickTimeUserDataComposer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataComposer');
end;

function AVMetadataIdentifierQuickTimeUserDataCopyright: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataCopyright');
end;

function AVMetadataIdentifierQuickTimeUserDataCreationDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataCreationDate');
end;

function AVMetadataIdentifierQuickTimeUserDataDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataDescription');
end;

function AVMetadataIdentifierQuickTimeUserDataDirector: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataDirector');
end;

function AVMetadataIdentifierQuickTimeUserDataDisclaimer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataDisclaimer');
end;

function AVMetadataIdentifierQuickTimeUserDataEncodedBy: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataEncodedBy');
end;

function AVMetadataIdentifierQuickTimeUserDataFullName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataFullName');
end;

function AVMetadataIdentifierQuickTimeUserDataGenre: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataGenre');
end;

function AVMetadataIdentifierQuickTimeUserDataHostComputer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataHostComputer');
end;

function AVMetadataIdentifierQuickTimeUserDataInformation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataInformation');
end;

function AVMetadataIdentifierQuickTimeUserDataKeywords: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataKeywords');
end;

function AVMetadataIdentifierQuickTimeUserDataMake: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataMake');
end;

function AVMetadataIdentifierQuickTimeUserDataModel: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataModel');
end;

function AVMetadataIdentifierQuickTimeUserDataOriginalArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataOriginalArtist');
end;

function AVMetadataIdentifierQuickTimeUserDataOriginalFormat: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataOriginalFormat');
end;

function AVMetadataIdentifierQuickTimeUserDataOriginalSource: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataOriginalSource');
end;

function AVMetadataIdentifierQuickTimeUserDataPerformers: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataPerformers');
end;

function AVMetadataIdentifierQuickTimeUserDataProducer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataProducer');
end;

function AVMetadataIdentifierQuickTimeUserDataPublisher: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataPublisher');
end;

function AVMetadataIdentifierQuickTimeUserDataProduct: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataProduct');
end;

function AVMetadataIdentifierQuickTimeUserDataSoftware: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataSoftware');
end;

function AVMetadataIdentifierQuickTimeUserDataSpecialPlaybackRequirements
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataSpecialPlaybackRequirements');
end;

function AVMetadataIdentifierQuickTimeUserDataTrack: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataTrack');
end;

function AVMetadataIdentifierQuickTimeUserDataWarning: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataWarning');
end;

function AVMetadataIdentifierQuickTimeUserDataWriter: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataWriter');
end;

function AVMetadataIdentifierQuickTimeUserDataURLLink: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataURLLink');
end;

function AVMetadataIdentifierQuickTimeUserDataLocationISO6709: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataLocationISO6709');
end;

function AVMetadataIdentifierQuickTimeUserDataTrackName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataTrackName');
end;

function AVMetadataIdentifierQuickTimeUserDataCredits: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataCredits');
end;

function AVMetadataIdentifierQuickTimeUserDataPhonogramRights: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataPhonogramRights');
end;

function AVMetadataIdentifierQuickTimeUserDataTaggedCharacteristic: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataTaggedCharacteristic');
end;

function AVMetadataIdentifierQuickTimeUserDataAccessibilityDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeUserDataAccessibilityDescription');
end;

function AVMetadataIdentifierISOUserDataCopyright: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierISOUserDataCopyright');
end;

function AVMetadataIdentifierISOUserDataDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierISOUserDataDate');
end;

function AVMetadataIdentifierISOUserDataTaggedCharacteristic: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierISOUserDataTaggedCharacteristic');
end;

function AVMetadataIdentifierISOUserDataAccessibilityDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierISOUserDataAccessibilityDescription');
end;

function AVMetadataIdentifier3GPUserDataCopyright: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataCopyright');
end;

function AVMetadataIdentifier3GPUserDataAuthor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataAuthor');
end;

function AVMetadataIdentifier3GPUserDataPerformer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataPerformer');
end;

function AVMetadataIdentifier3GPUserDataGenre: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataGenre');
end;

function AVMetadataIdentifier3GPUserDataRecordingYear: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataRecordingYear');
end;

function AVMetadataIdentifier3GPUserDataLocation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataLocation');
end;

function AVMetadataIdentifier3GPUserDataTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataTitle');
end;

function AVMetadataIdentifier3GPUserDataDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataDescription');
end;

function AVMetadataIdentifier3GPUserDataCollection: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataCollection');
end;

function AVMetadataIdentifier3GPUserDataUserRating: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataUserRating');
end;

function AVMetadataIdentifier3GPUserDataThumbnail: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataThumbnail');
end;

function AVMetadataIdentifier3GPUserDataAlbumAndTrack: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataAlbumAndTrack');
end;

function AVMetadataIdentifier3GPUserDataKeywordList: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataKeywordList');
end;

function AVMetadataIdentifier3GPUserDataMediaClassification: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataMediaClassification');
end;

function AVMetadataIdentifier3GPUserDataMediaRating: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifier3GPUserDataMediaRating');
end;

function AVMetadataIdentifierQuickTimeMetadataAuthor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataAuthor');
end;

function AVMetadataIdentifierQuickTimeMetadataComment: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataComment');
end;

function AVMetadataIdentifierQuickTimeMetadataCopyright: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataCopyright');
end;

function AVMetadataIdentifierQuickTimeMetadataCreationDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataCreationDate');
end;

function AVMetadataIdentifierQuickTimeMetadataDirector: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDirector');
end;

function AVMetadataIdentifierQuickTimeMetadataDisplayName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDisplayName');
end;

function AVMetadataIdentifierQuickTimeMetadataInformation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataInformation');
end;

function AVMetadataIdentifierQuickTimeMetadataKeywords: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataKeywords');
end;

function AVMetadataIdentifierQuickTimeMetadataProducer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataProducer');
end;

function AVMetadataIdentifierQuickTimeMetadataPublisher: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataPublisher');
end;

function AVMetadataIdentifierQuickTimeMetadataAlbum: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataAlbum');
end;

function AVMetadataIdentifierQuickTimeMetadataArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataArtist');
end;

function AVMetadataIdentifierQuickTimeMetadataArtwork: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataArtwork');
end;

function AVMetadataIdentifierQuickTimeMetadataDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDescription');
end;

function AVMetadataIdentifierQuickTimeMetadataSoftware: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataSoftware');
end;

function AVMetadataIdentifierQuickTimeMetadataYear: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataYear');
end;

function AVMetadataIdentifierQuickTimeMetadataGenre: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataGenre');
end;

function AVMetadataIdentifierQuickTimeMetadataiXML: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataiXML');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationISO6709: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLocationISO6709');
end;

function AVMetadataIdentifierQuickTimeMetadataMake: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataMake');
end;

function AVMetadataIdentifierQuickTimeMetadataModel: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataModel');
end;

function AVMetadataIdentifierQuickTimeMetadataArranger: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataArranger');
end;

function AVMetadataIdentifierQuickTimeMetadataEncodedBy: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataEncodedBy');
end;

function AVMetadataIdentifierQuickTimeMetadataOriginalArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataOriginalArtist');
end;

function AVMetadataIdentifierQuickTimeMetadataPerformer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataPerformer');
end;

function AVMetadataIdentifierQuickTimeMetadataComposer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataComposer');
end;

function AVMetadataIdentifierQuickTimeMetadataCredits: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataCredits');
end;

function AVMetadataIdentifierQuickTimeMetadataPhonogramRights: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataPhonogramRights');
end;

function AVMetadataIdentifierQuickTimeMetadataCameraIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataCameraIdentifier');
end;

function AVMetadataIdentifierQuickTimeMetadataCameraFrameReadoutTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataCameraFrameReadoutTime');
end;

function AVMetadataIdentifierQuickTimeMetadataTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataTitle');
end;

function AVMetadataIdentifierQuickTimeMetadataCollectionUser: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataCollectionUser');
end;

function AVMetadataIdentifierQuickTimeMetadataRatingUser: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataRatingUser');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLocationName');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationBody: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLocationBody');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationNote: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLocationNote');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationRole: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLocationRole');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLocationDate');
end;

function AVMetadataIdentifierQuickTimeMetadataDirectionFacing: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDirectionFacing');
end;

function AVMetadataIdentifierQuickTimeMetadataDirectionMotion: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDirectionMotion');
end;

function AVMetadataIdentifierQuickTimeMetadataPreferredAffineTransform: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataPreferredAffineTransform');
end;

function AVMetadataIdentifierQuickTimeMetadataDetectedFace: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDetectedFace');
end;

function AVMetadataIdentifierQuickTimeMetadataDetectedHumanBody: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDetectedHumanBody');
end;

function AVMetadataIdentifierQuickTimeMetadataDetectedCatBody: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDetectedCatBody');
end;

function AVMetadataIdentifierQuickTimeMetadataDetectedDogBody: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDetectedDogBody');
end;

function AVMetadataIdentifierQuickTimeMetadataDetectedSalientObject: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataDetectedSalientObject');
end;

function AVMetadataIdentifierQuickTimeMetadataVideoOrientation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataVideoOrientation');
end;

function AVMetadataIdentifierQuickTimeMetadataContentIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataContentIdentifier');
end;

function AVMetadataIdentifierQuickTimeMetadataAccessibilityDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataAccessibilityDescription');
end;

function AVMetadataIdentifierQuickTimeMetadataIsMontage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataIsMontage');
end;

function AVMetadataIdentifierQuickTimeMetadataAutoLivePhoto: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataAutoLivePhoto');
end;

function AVMetadataIdentifierQuickTimeMetadataLivePhotoVitalityScore: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLivePhotoVitalityScore');
end;

function AVMetadataIdentifierQuickTimeMetadataLivePhotoVitalityScoringVersion
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLivePhotoVitalityScoringVersion');
end;

function AVMetadataIdentifierQuickTimeMetadataSpatialOverCaptureQualityScore
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataSpatialOverCaptureQualityScore');
end;

function AVMetadataIdentifierQuickTimeMetadataSpatialOverCaptureQualityScoringVersion
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataSpatialOverCaptureQualityScoringVersion');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationHorizontalAccuracyInMeters
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierQuickTimeMetadataLocationHorizontalAccuracyInMeters');
end;

function AVMetadataIdentifieriTunesMetadataAlbum: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataAlbum');
end;

function AVMetadataIdentifieriTunesMetadataArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataArtist');
end;

function AVMetadataIdentifieriTunesMetadataUserComment: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataUserComment');
end;

function AVMetadataIdentifieriTunesMetadataCoverArt: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataCoverArt');
end;

function AVMetadataIdentifieriTunesMetadataCopyright: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataCopyright');
end;

function AVMetadataIdentifieriTunesMetadataReleaseDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataReleaseDate');
end;

function AVMetadataIdentifieriTunesMetadataEncodedBy: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataEncodedBy');
end;

function AVMetadataIdentifieriTunesMetadataPredefinedGenre: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataPredefinedGenre');
end;

function AVMetadataIdentifieriTunesMetadataUserGenre: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataUserGenre');
end;

function AVMetadataIdentifieriTunesMetadataSongName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataSongName');
end;

function AVMetadataIdentifieriTunesMetadataTrackSubTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataTrackSubTitle');
end;

function AVMetadataIdentifieriTunesMetadataEncodingTool: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataEncodingTool');
end;

function AVMetadataIdentifieriTunesMetadataComposer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataComposer');
end;

function AVMetadataIdentifieriTunesMetadataAlbumArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataAlbumArtist');
end;

function AVMetadataIdentifieriTunesMetadataAccountKind: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataAccountKind');
end;

function AVMetadataIdentifieriTunesMetadataAppleID: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataAppleID');
end;

function AVMetadataIdentifieriTunesMetadataArtistID: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataArtistID');
end;

function AVMetadataIdentifieriTunesMetadataSongID: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataSongID');
end;

function AVMetadataIdentifieriTunesMetadataDiscCompilation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataDiscCompilation');
end;

function AVMetadataIdentifieriTunesMetadataDiscNumber: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataDiscNumber');
end;

function AVMetadataIdentifieriTunesMetadataGenreID: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataGenreID');
end;

function AVMetadataIdentifieriTunesMetadataGrouping: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataGrouping');
end;

function AVMetadataIdentifieriTunesMetadataPlaylistID: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataPlaylistID');
end;

function AVMetadataIdentifieriTunesMetadataContentRating: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataContentRating');
end;

function AVMetadataIdentifieriTunesMetadataBeatsPerMin: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataBeatsPerMin');
end;

function AVMetadataIdentifieriTunesMetadataTrackNumber: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataTrackNumber');
end;

function AVMetadataIdentifieriTunesMetadataArtDirector: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataArtDirector');
end;

function AVMetadataIdentifieriTunesMetadataArranger: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataArranger');
end;

function AVMetadataIdentifieriTunesMetadataAuthor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataAuthor');
end;

function AVMetadataIdentifieriTunesMetadataLyrics: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataLyrics');
end;

function AVMetadataIdentifieriTunesMetadataAcknowledgement: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataAcknowledgement');
end;

function AVMetadataIdentifieriTunesMetadataConductor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataConductor');
end;

function AVMetadataIdentifieriTunesMetadataDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataDescription');
end;

function AVMetadataIdentifieriTunesMetadataDirector: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataDirector');
end;

function AVMetadataIdentifieriTunesMetadataEQ: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataEQ');
end;

function AVMetadataIdentifieriTunesMetadataLinerNotes: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataLinerNotes');
end;

function AVMetadataIdentifieriTunesMetadataRecordCompany: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataRecordCompany');
end;

function AVMetadataIdentifieriTunesMetadataOriginalArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataOriginalArtist');
end;

function AVMetadataIdentifieriTunesMetadataPhonogramRights: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataPhonogramRights');
end;

function AVMetadataIdentifieriTunesMetadataProducer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataProducer');
end;

function AVMetadataIdentifieriTunesMetadataPerformer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataPerformer');
end;

function AVMetadataIdentifieriTunesMetadataPublisher: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataPublisher');
end;

function AVMetadataIdentifieriTunesMetadataSoundEngineer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataSoundEngineer');
end;

function AVMetadataIdentifieriTunesMetadataSoloist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataSoloist');
end;

function AVMetadataIdentifieriTunesMetadataCredits: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataCredits');
end;

function AVMetadataIdentifieriTunesMetadataThanks: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataThanks');
end;

function AVMetadataIdentifieriTunesMetadataOnlineExtras: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataOnlineExtras');
end;

function AVMetadataIdentifieriTunesMetadataExecProducer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifieriTunesMetadataExecProducer');
end;

function AVMetadataIdentifierID3MetadataAudioEncryption: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataAudioEncryption');
end;

function AVMetadataIdentifierID3MetadataAttachedPicture: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataAttachedPicture');
end;

function AVMetadataIdentifierID3MetadataAudioSeekPointIndex: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataAudioSeekPointIndex');
end;

function AVMetadataIdentifierID3MetadataComments: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataComments');
end;

function AVMetadataIdentifierID3MetadataCommercial: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataCommercial');
end;

function AVMetadataIdentifierID3MetadataCommerical: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataCommerical');
end;

function AVMetadataIdentifierID3MetadataEncryption: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEncryption');
end;

function AVMetadataIdentifierID3MetadataEqualization: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEqualization');
end;

function AVMetadataIdentifierID3MetadataEqualization2: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEqualization2');
end;

function AVMetadataIdentifierID3MetadataEventTimingCodes: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEventTimingCodes');
end;

function AVMetadataIdentifierID3MetadataGeneralEncapsulatedObject: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataGeneralEncapsulatedObject');
end;

function AVMetadataIdentifierID3MetadataGroupIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataGroupIdentifier');
end;

function AVMetadataIdentifierID3MetadataInvolvedPeopleList_v23: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataInvolvedPeopleList_v23');
end;

function AVMetadataIdentifierID3MetadataLink: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataLink');
end;

function AVMetadataIdentifierID3MetadataMusicCDIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataMusicCDIdentifier');
end;

function AVMetadataIdentifierID3MetadataMPEGLocationLookupTable: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataMPEGLocationLookupTable');
end;

function AVMetadataIdentifierID3MetadataOwnership: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOwnership');
end;

function AVMetadataIdentifierID3MetadataPrivate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPrivate');
end;

function AVMetadataIdentifierID3MetadataPlayCounter: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPlayCounter');
end;

function AVMetadataIdentifierID3MetadataPopularimeter: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPopularimeter');
end;

function AVMetadataIdentifierID3MetadataPositionSynchronization: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPositionSynchronization');
end;

function AVMetadataIdentifierID3MetadataRecommendedBufferSize: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataRecommendedBufferSize');
end;

function AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment');
end;

function AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment2: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment2');
end;

function AVMetadataIdentifierID3MetadataReverb: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataReverb');
end;

function AVMetadataIdentifierID3MetadataSeek: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSeek');
end;

function AVMetadataIdentifierID3MetadataSignature: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSignature');
end;

function AVMetadataIdentifierID3MetadataSynchronizedLyric: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSynchronizedLyric');
end;

function AVMetadataIdentifierID3MetadataSynchronizedTempoCodes: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSynchronizedTempoCodes');
end;

function AVMetadataIdentifierID3MetadataAlbumTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataAlbumTitle');
end;

function AVMetadataIdentifierID3MetadataBeatsPerMinute: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataBeatsPerMinute');
end;

function AVMetadataIdentifierID3MetadataComposer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataComposer');
end;

function AVMetadataIdentifierID3MetadataContentType: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataContentType');
end;

function AVMetadataIdentifierID3MetadataCopyright: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataCopyright');
end;

function AVMetadataIdentifierID3MetadataDate: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataDate');
end;

function AVMetadataIdentifierID3MetadataEncodingTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEncodingTime');
end;

function AVMetadataIdentifierID3MetadataPlaylistDelay: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPlaylistDelay');
end;

function AVMetadataIdentifierID3MetadataOriginalReleaseTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOriginalReleaseTime');
end;

function AVMetadataIdentifierID3MetadataRecordingTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataRecordingTime');
end;

function AVMetadataIdentifierID3MetadataReleaseTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataReleaseTime');
end;

function AVMetadataIdentifierID3MetadataTaggingTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataTaggingTime');
end;

function AVMetadataIdentifierID3MetadataEncodedBy: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEncodedBy');
end;

function AVMetadataIdentifierID3MetadataLyricist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataLyricist');
end;

function AVMetadataIdentifierID3MetadataFileType: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataFileType');
end;

function AVMetadataIdentifierID3MetadataTime: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataTime');
end;

function AVMetadataIdentifierID3MetadataInvolvedPeopleList_v24: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataInvolvedPeopleList_v24');
end;

function AVMetadataIdentifierID3MetadataContentGroupDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataContentGroupDescription');
end;

function AVMetadataIdentifierID3MetadataTitleDescription: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataTitleDescription');
end;

function AVMetadataIdentifierID3MetadataSubTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSubTitle');
end;

function AVMetadataIdentifierID3MetadataInitialKey: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataInitialKey');
end;

function AVMetadataIdentifierID3MetadataLanguage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataLanguage');
end;

function AVMetadataIdentifierID3MetadataLength: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataLength');
end;

function AVMetadataIdentifierID3MetadataMusicianCreditsList: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataMusicianCreditsList');
end;

function AVMetadataIdentifierID3MetadataMediaType: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataMediaType');
end;

function AVMetadataIdentifierID3MetadataMood: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataMood');
end;

function AVMetadataIdentifierID3MetadataOriginalAlbumTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOriginalAlbumTitle');
end;

function AVMetadataIdentifierID3MetadataOriginalFilename: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOriginalFilename');
end;

function AVMetadataIdentifierID3MetadataOriginalLyricist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOriginalLyricist');
end;

function AVMetadataIdentifierID3MetadataOriginalArtist: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOriginalArtist');
end;

function AVMetadataIdentifierID3MetadataOriginalReleaseYear: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOriginalReleaseYear');
end;

function AVMetadataIdentifierID3MetadataFileOwner: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataFileOwner');
end;

function AVMetadataIdentifierID3MetadataLeadPerformer: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataLeadPerformer');
end;

function AVMetadataIdentifierID3MetadataBand: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataBand');
end;

function AVMetadataIdentifierID3MetadataConductor: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataConductor');
end;

function AVMetadataIdentifierID3MetadataModifiedBy: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataModifiedBy');
end;

function AVMetadataIdentifierID3MetadataPartOfASet: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPartOfASet');
end;

function AVMetadataIdentifierID3MetadataProducedNotice: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataProducedNotice');
end;

function AVMetadataIdentifierID3MetadataPublisher: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPublisher');
end;

function AVMetadataIdentifierID3MetadataTrackNumber: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataTrackNumber');
end;

function AVMetadataIdentifierID3MetadataRecordingDates: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataRecordingDates');
end;

function AVMetadataIdentifierID3MetadataInternetRadioStationName: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataInternetRadioStationName');
end;

function AVMetadataIdentifierID3MetadataInternetRadioStationOwner: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataInternetRadioStationOwner');
end;

function AVMetadataIdentifierID3MetadataSize: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSize');
end;

function AVMetadataIdentifierID3MetadataAlbumSortOrder: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataAlbumSortOrder');
end;

function AVMetadataIdentifierID3MetadataPerformerSortOrder: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPerformerSortOrder');
end;

function AVMetadataIdentifierID3MetadataTitleSortOrder: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataTitleSortOrder');
end;

function AVMetadataIdentifierID3MetadataInternationalStandardRecordingCode
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataInternationalStandardRecordingCode');
end;

function AVMetadataIdentifierID3MetadataEncodedWith: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataEncodedWith');
end;

function AVMetadataIdentifierID3MetadataSetSubtitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataSetSubtitle');
end;

function AVMetadataIdentifierID3MetadataYear: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataYear');
end;

function AVMetadataIdentifierID3MetadataUserText: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataUserText');
end;

function AVMetadataIdentifierID3MetadataUniqueFileIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataUniqueFileIdentifier');
end;

function AVMetadataIdentifierID3MetadataTermsOfUse: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataTermsOfUse');
end;

function AVMetadataIdentifierID3MetadataUnsynchronizedLyric: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataUnsynchronizedLyric');
end;

function AVMetadataIdentifierID3MetadataCommercialInformation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataCommercialInformation');
end;

function AVMetadataIdentifierID3MetadataCopyrightInformation: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataCopyrightInformation');
end;

function AVMetadataIdentifierID3MetadataOfficialAudioFileWebpage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOfficialAudioFileWebpage');
end;

function AVMetadataIdentifierID3MetadataOfficialArtistWebpage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOfficialArtistWebpage');
end;

function AVMetadataIdentifierID3MetadataOfficialAudioSourceWebpage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOfficialAudioSourceWebpage');
end;

function AVMetadataIdentifierID3MetadataOfficialInternetRadioStationHomepage
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOfficialInternetRadioStationHomepage');
end;

function AVMetadataIdentifierID3MetadataPayment: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataPayment');
end;

function AVMetadataIdentifierID3MetadataOfficialPublisherWebpage: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataOfficialPublisherWebpage');
end;

function AVMetadataIdentifierID3MetadataUserURL: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierID3MetadataUserURL');
end;

function AVMetadataIdentifierIcyMetadataStreamTitle: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierIcyMetadataStreamTitle');
end;

function AVMetadataIdentifierIcyMetadataStreamURL: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVMetadataIdentifierIcyMetadataStreamURL');
end;

function AVOutputSettingsPreset640x480: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVOutputSettingsPreset640x480');
end;

function AVOutputSettingsPreset960x540: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation, 'AVOutputSettingsPreset960x540');
end;

function AVOutputSettingsPreset1280x720: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVOutputSettingsPreset1280x720');
end;

function AVOutputSettingsPreset1920x1080: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVOutputSettingsPreset1920x1080');
end;

function AVOutputSettingsPreset3840x2160: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVOutputSettingsPreset3840x2160');
end;

function AVOutputSettingsPresetHEVC1920x1080: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVOutputSettingsPresetHEVC1920x1080');
end;

function AVOutputSettingsPresetHEVC1920x1080WithAlpha: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVOutputSettingsPresetHEVC1920x1080WithAlpha');
end;

function AVOutputSettingsPresetHEVC3840x2160: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVOutputSettingsPresetHEVC3840x2160');
end;

function AVOutputSettingsPresetHEVC3840x2160WithAlpha: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVOutputSettingsPresetHEVC3840x2160WithAlpha');
end;

function AVOutputSettingsPresetHEVC7680x4320: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVOutputSettingsPresetHEVC7680x4320');
end;

function AVPlayerRateDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerRateDidChangeNotification');
end;

function AVPlayerRateDidChangeReasonSetRateCalled: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerRateDidChangeReasonSetRateCalled');
end;

function AVPlayerRateDidChangeReasonSetRateFailed: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerRateDidChangeReasonSetRateFailed');
end;

function AVPlayerRateDidChangeReasonAudioSessionInterrupted: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerRateDidChangeReasonAudioSessionInterrupted');
end;

function AVPlayerRateDidChangeReasonAppBackgrounded: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerRateDidChangeReasonAppBackgrounded');
end;

function AVPlayerWaitingToMinimizeStallsReason: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerWaitingToMinimizeStallsReason');
end;

function AVPlayerWaitingWhileEvaluatingBufferingRateReason: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerWaitingWhileEvaluatingBufferingRateReason');
end;

function AVPlayerWaitingWithNoItemToPlayReason: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerWaitingWithNoItemToPlayReason');
end;

function AVPlayerWaitingForCoordinatedPlaybackReason: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerWaitingForCoordinatedPlaybackReason');
end;

function AVPlayerAvailableHDRModesDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerAvailableHDRModesDidChangeNotification');
end;

function AVPlayerEligibleForHDRPlaybackDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerEligibleForHDRPlaybackDidChangeNotification');
end;

function AVCoordinatedPlaybackSuspensionReasonAudioSessionInterrupted: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCoordinatedPlaybackSuspensionReasonAudioSessionInterrupted');
end;

function AVCoordinatedPlaybackSuspensionReasonStallRecovery: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCoordinatedPlaybackSuspensionReasonStallRecovery');
end;

function AVCoordinatedPlaybackSuspensionReasonPlayingInterstitial: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCoordinatedPlaybackSuspensionReasonPlayingInterstitial');
end;

function AVCoordinatedPlaybackSuspensionReasonCoordinatedPlaybackNotPossible
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCoordinatedPlaybackSuspensionReasonCoordinatedPlaybackNotPossible');
end;

function AVCoordinatedPlaybackSuspensionReasonUserActionRequired: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCoordinatedPlaybackSuspensionReasonUserActionRequired');
end;

function AVCoordinatedPlaybackSuspensionReasonUserIsChangingCurrentTime
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVCoordinatedPlaybackSuspensionReasonUserIsChangingCurrentTime');
end;

function AVPlaybackCoordinatorOtherParticipantsDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlaybackCoordinatorOtherParticipantsDidChangeNotification');
end;

function AVPlaybackCoordinatorSuspensionReasonsDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlaybackCoordinatorSuspensionReasonsDidChangeNotification');
end;

function AVPlayerItemTimeJumpedNotification: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerItemTimeJumpedNotification');
end;

function AVPlayerItemRecommendedTimeOffsetFromLiveDidChangeNotification
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerItemRecommendedTimeOffsetFromLiveDidChangeNotification');
end;

function AVPlayerItemMediaSelectionDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerItemMediaSelectionDidChangeNotification');
end;

function AVPlayerItemLegibleOutputTextStylingResolutionDefault: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerItemLegibleOutputTextStylingResolutionDefault');
end;

function AVPlayerItemLegibleOutputTextStylingResolutionSourceAndRulesOnly
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerItemLegibleOutputTextStylingResolutionSourceAndRulesOnly');
end;

function AVPlayerInterstitialEventNoCue: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerInterstitialEventNoCue');
end;

function AVPlayerInterstitialEventJoinCue: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerInterstitialEventJoinCue');
end;

function AVPlayerInterstitialEventLeaveCue: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerInterstitialEventLeaveCue');
end;

function AVPlayerInterstitialEventMonitorEventsDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerInterstitialEventMonitorEventsDidChangeNotification');
end;

function AVPlayerInterstitialEventMonitorCurrentEventDidChangeNotification
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerInterstitialEventMonitorCurrentEventDidChangeNotification');
end;

function AVPlayerInterstitialEventMonitorAssetListResponseStatusDidChangeNotification
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerInterstitialEventMonitorAssetListResponseStatusDidChangeNotification');
end;

function AVPlayerWaitingDuringInterstitialEventReason: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVPlayerWaitingDuringInterstitialEventReason');
end;

function AVRouteDetectorMultipleRoutesDetectedDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVRouteDetectorMultipleRoutesDetectedDidChangeNotification');
end;

function AVSampleBufferAudioRendererWasFlushedAutomaticallyNotification
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVSampleBufferAudioRendererWasFlushedAutomaticallyNotification');
end;

function AVSampleBufferAudioRendererOutputConfigurationDidChangeNotification
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVSampleBufferAudioRendererOutputConfigurationDidChangeNotification');
end;

function AVSampleBufferDisplayLayerRequiresFlushToResumeDecodingDidChangeNotification
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVSampleBufferDisplayLayerRequiresFlushToResumeDecodingDidChangeNotification');
end;

function AVSampleBufferDisplayLayerOutputObscuredDueToInsufficientExternalProtectionDidChangeNotification
  : Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVSampleBufferDisplayLayerOutputObscuredDueToInsufficientExternalProtectionDidChangeNotification');
end;

function AVSampleBufferRenderSynchronizerRateDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libAVFoundation,
    'AVSampleBufferRenderSynchronizerRateDidChangeNotification');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

AVFoundationModule := dlopen(MarshaledAString(libAVFoundation), RTLD_LAZY);

finalization

dlclose(AVFoundationModule);
{$ENDIF IOS}

end.
