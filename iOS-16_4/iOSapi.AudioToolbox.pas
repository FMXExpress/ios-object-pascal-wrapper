{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework AudioToolbox
//

unit iOSapi.AudioToolbox;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.CoreMIDI,
  iOSapi.Foundation;

const
  kAudioComponentFlag_Unsearchable = 1;
  kAudioComponentFlag_SandboxSafe = 2;
  kAudioComponentFlag_IsV3AudioUnit = 4;
  kAudioComponentFlag_RequiresAsyncInstantiation = 8;
  kAudioComponentFlag_CanLoadInProcess = 16;
  kAudioComponentInstantiation_LoadOutOfProcess = 1;
  kAudioComponentInstantiation_LoadInProcess = 2;
  kAudioComponentInstantiation_LoadedRemotely = 1 shl 31;
  kAudioComponentValidationResult_Unknown = 0;
  kAudioComponentValidationResult_Passed = 1;
  kAudioComponentValidationResult_Failed = 2;
  kAudioComponentValidationResult_TimedOut = 3;
  kAudioComponentValidationResult_UnauthorizedError_Open = 4;
  kAudioComponentValidationResult_UnauthorizedError_Init = 5;
  kAudioUnitType_Output = 1635086197;
  kAudioUnitType_MusicDevice = 1635085685;
  kAudioUnitType_MusicEffect = 1635085670;
  kAudioUnitType_FormatConverter = 1635083875;
  kAudioUnitType_Effect = 1635083896;
  kAudioUnitType_Mixer = 1635085688;
  kAudioUnitType_Panner = 1635086446;
  kAudioUnitType_Generator = 1635084142;
  kAudioUnitType_OfflineEffect = 1635086188;
  kAudioUnitType_MIDIProcessor = 1635085673;
  kAudioUnitType_SpeechSynthesizer = 1635087216;
  kAudioUnitType_RemoteEffect = 1635086968;
  kAudioUnitType_RemoteGenerator = 1635086951;
  kAudioUnitType_RemoteInstrument = 1635086953;
  kAudioUnitType_RemoteMusicEffect = 1635086957;
  kAudioUnitManufacturer_Apple = 1634758764;
  kAudioUnitSubType_GenericOutput = 1734700658;
  kAudioUnitSubType_VoiceProcessingIO = 1987078511;
  kAudioUnitSubType_RemoteIO = 1919512419;
  kAudioUnitSubType_Sampler = 1935764848;
  kAudioUnitSubType_MIDISynth = 1836284270;
  kAudioUnitSubType_AUConverter = 1668247158;
  kAudioUnitSubType_Varispeed = 1986097769;
  kAudioUnitSubType_DeferredRenderer = 1684366962;
  kAudioUnitSubType_Splitter = 1936747636;
  kAudioUnitSubType_MultiSplitter = 1836281964;
  kAudioUnitSubType_Merger = 1835364967;
  kAudioUnitSubType_NewTimePitch = 1853191280;
  kAudioUnitSubType_AUiPodTimeOther = 1768977519;
  kAudioUnitSubType_RoundTripAAC = 1918984547;
  kAudioUnitSubType_TimePitch = 1953329268;
  kAudioUnitSubType_AUiPodTime = 1768977517;
  kAudioUnitSubType_PeakLimiter = 1819112562;
  kAudioUnitSubType_DynamicsProcessor = 1684237680;
  kAudioUnitSubType_LowPassFilter = 1819304307;
  kAudioUnitSubType_HighPassFilter = 1752195443;
  kAudioUnitSubType_BandPassFilter = 1651532147;
  kAudioUnitSubType_HighShelfFilter = 1752393830;
  kAudioUnitSubType_LowShelfFilter = 1819502694;
  kAudioUnitSubType_ParametricEQ = 1886217585;
  kAudioUnitSubType_Distortion = 1684632436;
  kAudioUnitSubType_Delay = 1684368505;
  kAudioUnitSubType_SampleDelay = 1935961209;
  kAudioUnitSubType_NBandEQ = 1851942257;
  kAudioUnitSubType_Reverb2 = 1920361010;
  kAudioUnitSubType_AUSoundIsolation = 1987012979;
  kAudioUnitSubType_AUiPodEQ = 1768973681;
  kAudioUnitSubType_MultiChannelMixer = 1835232632;
  kAudioUnitSubType_MatrixMixer = 1836608888;
  kAudioUnitSubType_SpatialMixer = 862217581;
  kAudioUnitSubType_AU3DMixerEmbedded = 862217581;
  kAudioUnitSubType_ScheduledSoundPlayer = 1936945260;
  kAudioUnitSubType_AudioFilePlayer = 1634103404;
  kAudioUnitRenderAction_PreRender = (1 shl 2);
  kAudioUnitRenderAction_PostRender = (1 shl 3);
  kAudioUnitRenderAction_OutputIsSilence = (1 shl 4);
  kAudioOfflineUnitRenderAction_Preflight = (1 shl 5);
  kAudioOfflineUnitRenderAction_Render = (1 shl 6);
  kAudioOfflineUnitRenderAction_Complete = (1 shl 7);
  kAudioUnitRenderAction_PostRenderError = (1 shl 8);
  kAudioUnitRenderAction_DoNotCheckRenderArgs = (1 shl 9);
  kAudioUnitErr_InvalidProperty = -10879;
  kAudioUnitErr_InvalidParameter = -10878;
  kAudioUnitErr_InvalidElement = -10877;
  kAudioUnitErr_NoConnection = -10876;
  kAudioUnitErr_FailedInitialization = -10875;
  kAudioUnitErr_TooManyFramesToProcess = -10874;
  kAudioUnitErr_InvalidFile = -10871;
  kAudioUnitErr_UnknownFileType = -10870;
  kAudioUnitErr_FileNotSpecified = -10869;
  kAudioUnitErr_FormatNotSupported = -10868;
  kAudioUnitErr_Uninitialized = -10867;
  kAudioUnitErr_InvalidScope = -10866;
  kAudioUnitErr_PropertyNotWritable = -10865;
  kAudioUnitErr_CannotDoInCurrentContext = -10863;
  kAudioUnitErr_InvalidPropertyValue = -10851;
  kAudioUnitErr_PropertyNotInUse = -10850;
  kAudioUnitErr_Initialized = -10849;
  kAudioUnitErr_InvalidOfflineRender = -10848;
  kAudioUnitErr_Unauthorized = -10847;
  kAudioUnitErr_MIDIOutputBufferFull = -66753;
  kAudioComponentErr_InstanceTimedOut = -66754;
  kAudioComponentErr_InstanceInvalidated = -66749;
  kAudioUnitErr_RenderTimeout = -66745;
  kAudioUnitErr_ExtensionNotFound = -66744;
  kAudioUnitErr_InvalidParameterValue = -66743;
  kAudioUnitErr_InvalidFilePath = -66742;
  kAudioUnitErr_MissingKey = -66741;
  kAudioComponentErr_DuplicateDescription = -66752;
  kAudioComponentErr_UnsupportedType = -66751;
  kAudioComponentErr_TooManyInstances = -66750;
  kAudioComponentErr_NotPermitted = -66748;
  kAudioComponentErr_InitializationTimedOut = -66747;
  kAudioComponentErr_InvalidFormat = -66746;
  kParameterEvent_Immediate = 1;
  kParameterEvent_Ramped = 2;
  kAudioUnitRange = 0;
  kAudioUnitInitializeSelect = 1;
  kAudioUnitUninitializeSelect = 2;
  kAudioUnitGetPropertyInfoSelect = 3;
  kAudioUnitGetPropertySelect = 4;
  kAudioUnitSetPropertySelect = 5;
  kAudioUnitAddPropertyListenerSelect = 10;
  kAudioUnitRemovePropertyListenerSelect = 11;
  kAudioUnitRemovePropertyListenerWithUserDataSelect = 18;
  kAudioUnitAddRenderNotifySelect = 15;
  kAudioUnitRemoveRenderNotifySelect = 16;
  kAudioUnitGetParameterSelect = 6;
  kAudioUnitSetParameterSelect = 7;
  kAudioUnitScheduleParametersSelect = 17;
  kAudioUnitRenderSelect = 14;
  kAudioUnitResetSelect = 9;
  kAudioUnitComplexRenderSelect = 19;
  kAudioUnitProcessSelect = 20;
  kAudioUnitProcessMultipleSelect = 21;
  kAudioUnitErr_IllegalInstrument = -10873;
  kAudioUnitErr_InstrumentTypeNotFound = -10872;
  kAudioUnitScope_Global = 0;
  kAudioUnitScope_Input = 1;
  kAudioUnitScope_Output = 2;
  kAudioUnitScope_Group = 3;
  kAudioUnitScope_Part = 4;
  kAudioUnitScope_Note = 5;
  kAudioUnitScope_Layer = 6;
  kAudioUnitScope_LayerItem = 7;
  kAudioUnitProperty_ClassInfo = 0;
  kAudioUnitProperty_MakeConnection = 1;
  kAudioUnitProperty_SampleRate = 2;
  kAudioUnitProperty_ParameterList = 3;
  kAudioUnitProperty_ParameterInfo = 4;
  kAudioUnitProperty_CPULoad = 6;
  kAudioUnitProperty_StreamFormat = 8;
  kAudioUnitProperty_ElementCount = 11;
  kAudioUnitProperty_Latency = 12;
  kAudioUnitProperty_SupportedNumChannels = 13;
  kAudioUnitProperty_MaximumFramesPerSlice = 14;
  kAudioUnitProperty_ParameterValueStrings = 16;
  kAudioUnitProperty_AudioChannelLayout = 19;
  kAudioUnitProperty_TailTime = 20;
  kAudioUnitProperty_BypassEffect = 21;
  kAudioUnitProperty_LastRenderError = 22;
  kAudioUnitProperty_SetRenderCallback = 23;
  kAudioUnitProperty_FactoryPresets = 24;
  kAudioUnitProperty_RenderQuality = 26;
  kAudioUnitProperty_HostCallbacks = 27;
  kAudioUnitProperty_InPlaceProcessing = 29;
  kAudioUnitProperty_ElementName = 30;
  kAudioUnitProperty_SupportedChannelLayoutTags = 32;
  kAudioUnitProperty_PresentPreset = 36;
  kAudioUnitProperty_DependentParameters = 45;
  kAudioUnitProperty_InputSamplesInOutput = 49;
  kAudioUnitProperty_ShouldAllocateBuffer = 51;
  kAudioUnitProperty_FrequencyResponse = 52;
  kAudioUnitProperty_ParameterHistoryInfo = 53;
  kAudioUnitProperty_NickName = 54;
  kAudioUnitProperty_OfflineRender = 37;
  kAudioUnitProperty_ParameterIDName = 34;
  kAudioUnitProperty_ParameterStringFromValue = 33;
  kAudioUnitProperty_ParameterClumpName = 35;
  kAudioUnitProperty_ParameterValueFromString = 38;
  kAudioUnitProperty_ContextName = 25;
  kAudioUnitProperty_PresentationLatency = 40;
  kAudioUnitProperty_ClassInfoFromDocument = 50;
  kAudioUnitProperty_RequestViewController = 56;
  kAudioUnitProperty_ParametersForOverview = 57;
  kAudioUnitProperty_SupportsMPE = 58;
  kAudioUnitProperty_RenderContextObserver = 60;
  kAudioUnitProperty_LastRenderSampleTime = 61;
  kAudioUnitProperty_LoadedOutOfProcess = 62;
  kAudioUnitProperty_MIDIOutputCallbackInfo = 47;
  kAudioUnitProperty_MIDIOutputCallback = 48;
  kAudioUnitProperty_MIDIOutputEventListCallback = 63;
  kAudioUnitProperty_AudioUnitMIDIProtocol = 64;
  kAudioUnitProperty_HostMIDIProtocol = 65;
  kAudioUnitProperty_MIDIOutputBufferSizeHint = 66;
  kAudioUnitProperty_RemoteControlEventListener = 100;
  kAudioUnitProperty_IsInterAppConnected = 101;
  kAudioUnitProperty_PeerURL = 102;
  kRenderQuality_Max = 127;
  kRenderQuality_High = 96;
  kRenderQuality_Medium = 64;
  kRenderQuality_Low = 32;
  kRenderQuality_Min = 0;
  kNumberOfResponseFrequencies = 1024;
  kAudioUnitParameterUnit_Generic = 0;
  kAudioUnitParameterUnit_Indexed = 1;
  kAudioUnitParameterUnit_Boolean = 2;
  kAudioUnitParameterUnit_Percent = 3;
  kAudioUnitParameterUnit_Seconds = 4;
  kAudioUnitParameterUnit_SampleFrames = 5;
  kAudioUnitParameterUnit_Phase = 6;
  kAudioUnitParameterUnit_Rate = 7;
  kAudioUnitParameterUnit_Hertz = 8;
  kAudioUnitParameterUnit_Cents = 9;
  kAudioUnitParameterUnit_RelativeSemiTones = 10;
  kAudioUnitParameterUnit_MIDINoteNumber = 11;
  kAudioUnitParameterUnit_MIDIController = 12;
  kAudioUnitParameterUnit_Decibels = 13;
  kAudioUnitParameterUnit_LinearGain = 14;
  kAudioUnitParameterUnit_Degrees = 15;
  kAudioUnitParameterUnit_EqualPowerCrossfade = 16;
  kAudioUnitParameterUnit_MixerFaderCurve1 = 17;
  kAudioUnitParameterUnit_Pan = 18;
  kAudioUnitParameterUnit_Meters = 19;
  kAudioUnitParameterUnit_AbsoluteCents = 20;
  kAudioUnitParameterUnit_Octaves = 21;
  kAudioUnitParameterUnit_BPM = 22;
  kAudioUnitParameterUnit_Beats = 23;
  kAudioUnitParameterUnit_Milliseconds = 24;
  kAudioUnitParameterUnit_Ratio = 25;
  kAudioUnitParameterUnit_CustomUnit = 26;
  kAudioUnitParameterUnit_MIDI2Controller = 27;
  kAudioUnitParameterFlag_CFNameRelease = (1 shl 4);
  kAudioUnitParameterFlag_OmitFromPresets = (1 shl 13);
  kAudioUnitParameterFlag_PlotHistory = (1 shl 14);
  kAudioUnitParameterFlag_MeterReadOnly = (1 shl 15);
  kAudioUnitParameterFlag_DisplayMask = (7 shl 16) or (1 shl 22);
  kAudioUnitParameterFlag_DisplaySquareRoot = (1 shl 16);
  kAudioUnitParameterFlag_DisplaySquared = (2 shl 16);
  kAudioUnitParameterFlag_DisplayCubed = (3 shl 16);
  kAudioUnitParameterFlag_DisplayCubeRoot = (4 shl 16);
  kAudioUnitParameterFlag_DisplayExponential = (5 shl 16);
  kAudioUnitParameterFlag_HasClump = (1 shl 20);
  kAudioUnitParameterFlag_ValuesHaveStrings = (1 shl 21);
  kAudioUnitParameterFlag_DisplayLogarithmic = (1 shl 22);
  kAudioUnitParameterFlag_IsHighResolution = (1 shl 23);
  kAudioUnitParameterFlag_NonRealTime = (1 shl 24);
  kAudioUnitParameterFlag_CanRamp = (1 shl 25);
  kAudioUnitParameterFlag_ExpertMode = (1 shl 26);
  kAudioUnitParameterFlag_HasCFNameString = (1 shl 27);
  kAudioUnitParameterFlag_IsGlobalMeta = (1 shl 28);
  kAudioUnitParameterFlag_IsElementMeta = (1 shl 29);
  kAudioUnitParameterFlag_IsReadable = (1 shl 30);
  kAudioUnitParameterFlag_IsWritable = (1 shl 31);
  kAudioUnitClumpID_System = 0;
  kAudioUnitParameterName_Full = -1;
  kAudioUnitRemoteControlEvent_TogglePlayPause = 1;
  kAudioUnitRemoteControlEvent_ToggleRecord = 2;
  kAudioUnitRemoteControlEvent_Rewind = 3;
  kAudioUnitProperty_SampleRateConverterComplexity = 3014;
  kAudioUnitSampleRateConverterComplexity_Linear = 1818848869;
  kAudioUnitSampleRateConverterComplexity_Normal = 1852797549;
  kAudioUnitSampleRateConverterComplexity_Mastering = 1650553971;
  kAudioOutputUnitProperty_CurrentDevice = 2000;
  kAudioOutputUnitProperty_IsRunning = 2001;
  kAudioOutputUnitProperty_ChannelMap = 2002;
  kAudioOutputUnitProperty_EnableIO = 2003;
  kAudioOutputUnitProperty_StartTime = 2004;
  kAudioOutputUnitProperty_SetInputCallback = 2005;
  kAudioOutputUnitProperty_HasIO = 2006;
  kAudioOutputUnitProperty_StartTimestampsAtZero = 2007;
  kAudioOutputUnitProperty_OSWorkgroup = 2015;
  kAudioOutputUnitProperty_MIDICallbacks = 2010;
  kAudioOutputUnitProperty_HostReceivesRemoteControlEvents = 2011;
  kAudioOutputUnitProperty_RemoteControlToHost = 2012;
  kAudioOutputUnitProperty_HostTransportState = 2013;
  kAudioOutputUnitProperty_NodeComponentDescription = 2014;
  kAUVoiceIOProperty_BypassVoiceProcessing = 2100;
  kAUVoiceIOProperty_VoiceProcessingEnableAGC = 2101;
  kAUVoiceIOProperty_MuteOutput = 2104;
  kAUVoiceIOSpeechActivityHasStarted = 0;
  kAUVoiceIOSpeechActivityHasEnded = 1;
  kAUVoiceIOProperty_MutedSpeechActivityEventListener = 2106;
  kAUVoiceIOProperty_DuckNonVoiceAudio = 2102;
  kAUVoiceIOProperty_VoiceProcessingQuality = 2103;
  kAUNBandEQProperty_NumberOfBands = 2200;
  kAUNBandEQProperty_MaxNumberOfBands = 2201;
  kAUNBandEQProperty_BiquadCoefficients = 2203;
  kAudioUnitProperty_MeteringMode = 3007;
  kAudioUnitProperty_MatrixLevels = 3006;
  kAudioUnitProperty_MatrixDimensions = 3009;
  kAudioUnitProperty_MeterClipping = 3011;
  kAudioUnitProperty_InputAnchorTimeStamp = 3016;
  kAudioUnitProperty_ReverbRoomType = 10;
  kAudioUnitProperty_UsesInternalReverb = 1005;
  kAudioUnitProperty_SpatializationAlgorithm = 3000;
  kAudioUnitProperty_SpatialMixerRenderingFlags = 3003;
  kAudioUnitProperty_SpatialMixerSourceMode = 3005;
  kAudioUnitProperty_SpatialMixerDistanceParams = 3010;
  kAudioUnitProperty_SpatialMixerAttenuationCurve = 3013;
  kAudioUnitProperty_SpatialMixerOutputType = 3100;
  kAudioUnitProperty_SpatialMixerPointSourceInHeadMode = 3103;
  kAudioUnitProperty_SpatialMixerEnableHeadTracking = 3111;
  kAudioUnitProperty_SpatialMixerPersonalizedHRTFMode = 3113;
  kSpatializationAlgorithm_EqualPowerPanning = 0;
  kSpatializationAlgorithm_SphericalHead = 1;
  kSpatializationAlgorithm_HRTF = 2;
  kSpatializationAlgorithm_SoundField = 3;
  kSpatializationAlgorithm_VectorBasedPanning = 4;
  kSpatializationAlgorithm_StereoPassThrough = 5;
  kSpatializationAlgorithm_HRTFHQ = 6;
  kSpatializationAlgorithm_UseOutputType = 7;
  kSpatialMixerSourceMode_SpatializeIfMono = 0;
  kSpatialMixerSourceMode_Bypass = 1;
  kSpatialMixerSourceMode_PointSource = 2;
  kSpatialMixerSourceMode_AmbienceBed = 3;
  kReverbRoomType_SmallRoom = 0;
  kReverbRoomType_MediumRoom = 1;
  kReverbRoomType_LargeRoom = 2;
  kReverbRoomType_MediumHall = 3;
  kReverbRoomType_LargeHall = 4;
  kReverbRoomType_Plate = 5;
  kReverbRoomType_MediumChamber = 6;
  kReverbRoomType_LargeChamber = 7;
  kReverbRoomType_Cathedral = 8;
  kReverbRoomType_LargeRoom2 = 9;
  kReverbRoomType_MediumHall2 = 10;
  kReverbRoomType_MediumHall3 = 11;
  kReverbRoomType_LargeHall2 = 12;
  kSpatialMixerAttenuationCurve_Power = 0;
  kSpatialMixerAttenuationCurve_Exponential = 1;
  kSpatialMixerAttenuationCurve_Inverse = 2;
  kSpatialMixerAttenuationCurve_Linear = 3;
  kSpatialMixerRenderingFlags_InterAuralDelay = (1 shl 0);
  kSpatialMixerRenderingFlags_DistanceAttenuation = (1 shl 2);
  kSpatialMixerPersonalizedHRTFMode_Off = 0;
  kSpatialMixerPersonalizedHRTFMode_On = 1;
  kSpatialMixerPersonalizedHRTFMode_Auto = 2;
  kSpatialMixerOutputType_Headphones = 1;
  kSpatialMixerOutputType_BuiltInSpeakers = 2;
  kSpatialMixerOutputType_ExternalSpeakers = 3;
  kSpatialMixerPointSourceInHeadMode_Mono = 0;
  kSpatialMixerPointSourceInHeadMode_Bypass = 1;
  kAudioUnitProperty_3DMixerDistanceParams = 3010;
  kAudioUnitProperty_3DMixerAttenuationCurve = 3013;
  kAudioUnitProperty_DopplerShift = 3002;
  kAudioUnitProperty_3DMixerRenderingFlags = 3003;
  kAudioUnitProperty_3DMixerDistanceAtten = 3004;
  kAudioUnitProperty_ReverbPreset = 3012;
  k3DMixerRenderingFlags_InterAuralDelay = (1 shl 0);
  k3DMixerRenderingFlags_DopplerShift = (1 shl 1);
  k3DMixerRenderingFlags_DistanceAttenuation = (1 shl 2);
  k3DMixerRenderingFlags_DistanceFilter = (1 shl 3);
  k3DMixerRenderingFlags_DistanceDiffusion = (1 shl 4);
  k3DMixerRenderingFlags_LinearDistanceAttenuation = (1 shl 5);
  k3DMixerRenderingFlags_ConstantReverbBlend = (1 shl 6);
  k3DMixerAttenuationCurve_Power = 0;
  k3DMixerAttenuationCurve_Exponential = 1;
  k3DMixerAttenuationCurve_Inverse = 2;
  k3DMixerAttenuationCurve_Linear = 3;
  kAudioUnitProperty_ScheduleAudioSlice = 3300;
  kAudioUnitProperty_ScheduleStartTimeStamp = 3301;
  kAudioUnitProperty_CurrentPlayTime = 3302;
  kScheduledAudioSliceFlag_Complete = 1;
  kScheduledAudioSliceFlag_BeganToRender = 2;
  kScheduledAudioSliceFlag_BeganToRenderLate = 4;
  kScheduledAudioSliceFlag_Loop = 8;
  kScheduledAudioSliceFlag_Interrupt = 16;
  kScheduledAudioSliceFlag_InterruptAtLoop = 32;
  kAudioUnitProperty_ScheduledFileIDs = 3310;
  kAudioUnitProperty_ScheduledFileRegion = 3311;
  kAudioUnitProperty_ScheduledFilePrime = 3312;
  kAudioUnitProperty_ScheduledFileBufferSizeFrames = 3313;
  kAudioUnitProperty_ScheduledFileNumberBuffers = 3314;
  kMusicDeviceProperty_InstrumentName = 1001;
  kMusicDeviceProperty_InstrumentNumber = 1004;
  kMusicDeviceProperty_InstrumentCount = 1000;
  kMusicDeviceProperty_BankName = 1007;
  kMusicDeviceProperty_SoundBankURL = 1100;
  kAUMIDISynthProperty_EnablePreload = 4119;
  kAUSamplerProperty_LoadInstrument = 4102;
  kAUSamplerProperty_LoadAudioFiles = 4101;
  kInstrumentType_DLSPreset = 1;
  kInstrumentType_SF2Preset = kInstrumentType_DLSPreset;
  kInstrumentType_AUPreset = 2;
  kInstrumentType_Audiofile = 3;
  kInstrumentType_EXS24 = 4;
  kAUSampler_DefaultPercussionBankMSB = 120;
  kAUSampler_DefaultMelodicBankMSB = 121;
  kAUSampler_DefaultBankLSB = 0;
  kAudioUnitProperty_DeferredRendererPullSize = 3320;
  kAudioUnitProperty_DeferredRendererExtraLatency = 3321;
  kAudioUnitProperty_DeferredRendererWaitFrames = 3322;
  kAUSamplerProperty_LoadPresetFromBank = 4100;
  kAUSamplerProperty_BankAndPreset = kAUSamplerProperty_LoadPresetFromBank;
  AUParameterAutomationEventTypeValue = 0;
  AUParameterAutomationEventTypeTouch = 1;
  AUParameterAutomationEventTypeRelease = 2;
  AUEventSampleTimeImmediate = AUEventSampleTime(18446744069414584320);
  AUAudioUnitBusTypeInput = 1;
  AUAudioUnitBusTypeOutput = 2;
  AUHostTransportStateChanged = 1;
  AUHostTransportStateMoving = 2;
  AUHostTransportStateRecording = 4;
  AUHostTransportStateCycling = 8;
  AURenderEventParameter = 1;
  AURenderEventParameterRamp = 2;
  AURenderEventMIDI = 8;
  AURenderEventMIDISysEx = 9;
  AURenderEventMIDIEventList = 10;
  kAudioCodecPropertySupportedInputFormats = 1768320291;
  kAudioCodecPropertySupportedOutputFormats = 1868983587;
  kAudioCodecPropertyAvailableInputSampleRates = 1634300786;
  kAudioCodecPropertyAvailableOutputSampleRates = 1634694002;
  kAudioCodecPropertyAvailableBitRateRange = 1633841780;
  kAudioCodecPropertyMinimumNumberInputPackets = 1835952496;
  kAudioCodecPropertyMinimumNumberOutputPackets = 1835954032;
  kAudioCodecPropertyAvailableNumberChannels = 1668116067;
  kAudioCodecPropertyDoesSampleRateConversion = 1819112035;
  kAudioCodecPropertyAvailableInputChannelLayoutTags = 1634296684;
  kAudioCodecPropertyAvailableOutputChannelLayoutTags = 1634689900;
  kAudioCodecPropertyInputFormatsForOutputFormat = 1768305775;
  kAudioCodecPropertyOutputFormatsForInputFormat = 1868969065;
  kAudioCodecPropertyFormatInfo = 1633904233;
  kAudioCodecPropertyInputBufferSize = 1952609638;
  kAudioCodecPropertyPacketFrameSize = 1885432678;
  kAudioCodecPropertyHasVariablePacketByteSizes = 1987078975;
  kAudioCodecPropertyEmploysDependentPackets = 1685089087;
  kAudioCodecPropertyMaximumPacketByteSize = 1885432674;
  kAudioCodecPropertyPacketSizeLimitForVBR = 1885432684;
  kAudioCodecPropertyCurrentInputFormat = 1768320372;
  kAudioCodecPropertyCurrentOutputFormat = 1868983668;
  kAudioCodecPropertyMagicCookie = 1802857321;
  kAudioCodecPropertyUsedInputBufferSize = 1969386854;
  kAudioCodecPropertyIsInitialized = 1768843636;
  kAudioCodecPropertyCurrentTargetBitRate = 1651663220;
  kAudioCodecPropertyCurrentInputSampleRate = 1667855218;
  kAudioCodecPropertyCurrentOutputSampleRate = 1668248434;
  kAudioCodecPropertyQualitySetting = 1936876401;
  kAudioCodecPropertyApplicableBitRateRange = 1651668065;
  kAudioCodecPropertyRecommendedBitRateRange = 1651668082;
  kAudioCodecPropertyApplicableInputSampleRates = 1769173601;
  kAudioCodecPropertyApplicableOutputSampleRates = 1869836897;
  kAudioCodecPropertyPaddedZeros = 1885430832;
  kAudioCodecPropertyPrimeMethod = 1886547309;
  kAudioCodecPropertyPrimeInfo = 1886546285;
  kAudioCodecPropertyCurrentInputChannelLayout = 1768123424;
  kAudioCodecPropertyCurrentOutputChannelLayout = 1868786720;
  kAudioCodecPropertySettings = 1633907488;
  kAudioCodecPropertyFormatList = 1633904236;
  kAudioCodecPropertyBitRateControlMode = 1633903206;
  kAudioCodecPropertySoundQualityForVBR = 1986163313;
  kAudioCodecPropertyBitRateForVBR = 1986163298;
  kAudioCodecPropertyDelayMode = 1684893540;
  kAudioCodecPropertyAdjustLocalQuality = 1584488812;
  kAudioCodecPropertyProgramTargetLevel = 1886418028;
  kAudioCodecPropertyDynamicRangeControlMode = 1835299427;
  kAudioCodecPropertyProgramTargetLevelConstant = 1886678115;
  kAudioCodecQuality_Max = 127;
  kAudioCodecQuality_High = 96;
  kAudioCodecQuality_Medium = 64;
  kAudioCodecQuality_Low = 32;
  kAudioCodecQuality_Min = 0;
  kAudioCodecPrimeMethod_Pre = 0;
  kAudioCodecPrimeMethod_Normal = 1;
  kAudioCodecPrimeMethod_None = 2;
  kAudioCodecBitRateControlMode_Constant = 0;
  kAudioCodecBitRateControlMode_LongTermAverage = 1;
  kAudioCodecBitRateControlMode_VariableConstrained = 2;
  kAudioCodecBitRateControlMode_Variable = 3;
  kAudioCodecDelayMode_Compatibility = 0;
  kAudioCodecDelayMode_Minimum = 1;
  kAudioCodecDelayMode_Optimal = 2;
  kProgramTargetLevel_None = 0;
  kProgramTargetLevel_Minus31dB = 1;
  kProgramTargetLevel_Minus23dB = 2;
  kProgramTargetLevel_Minus20dB = 3;
  kDynamicRangeControlMode_None = 0;
  kDynamicRangeControlMode_Light = 1;
  kDynamicRangeControlMode_Heavy = 2;
  kAudioSettingsFlags_ExpertParameter = (1 shl 0);
  kAudioSettingsFlags_InvisibleParameter = (1 shl 1);
  kAudioSettingsFlags_MetaParameter = (1 shl 2);
  kAudioSettingsFlags_UserInterfaceParameter = (1 shl 3);
  kAudioCodecProduceOutputPacketFailure = 1;
  kAudioCodecProduceOutputPacketSuccess = 2;
  kAudioCodecProduceOutputPacketSuccessHasMore = 3;
  kAudioCodecProduceOutputPacketNeedsMoreInputData = 4;
  kAudioCodecProduceOutputPacketAtEOF = 5;
  kAudioCodecProduceOutputPacketSuccessConcealed = 6;
  kAudioCodecGetPropertyInfoSelect = 1;
  kAudioCodecGetPropertySelect = 2;
  kAudioCodecSetPropertySelect = 3;
  kAudioCodecInitializeSelect = 4;
  kAudioCodecUninitializeSelect = 5;
  kAudioCodecAppendInputDataSelect = 6;
  kAudioCodecProduceOutputDataSelect = 7;
  kAudioCodecResetSelect = 8;
  kAudioCodecAppendInputBufferListSelect = 9;
  kAudioCodecProduceOutputBufferListSelect = 10;
  kAudioCodecNoError = 0;
  kAudioCodecUnspecifiedError = 2003329396;
  kAudioCodecUnknownPropertyError = 2003332927;
  kAudioCodecBadPropertySizeError = 561211770;
  kAudioCodecIllegalOperationError = 1852797029;
  kAudioCodecUnsupportedFormatError = 560226676;
  kAudioCodecStateError = 561214580;
  kAudioCodecNotEnoughBufferSpaceError = 560100710;
  kAudioCodecBadDataError = 1650549857;
  kAudioCodecPropertyMinimumDelayMode = 1835296108;
  kAudioCodecPropertyNameCFString = 1819173229;
  kAudioCodecPropertyManufacturerCFString = 1819107691;
  kAudioCodecPropertyFormatCFString = 1818652530;
  kAudioCodecPropertyRequiresPacketDescription = 1885432676;
  kAudioCodecPropertyAvailableBitRates = 1651668003;
  kAudioCodecExtendFrequencies = 1633903974;
  kAudioCodecUseRecommendedSampleRate = 1970434930;
  kAudioCodecOutputPrecedence = 1869639794;
  kAudioCodecBitRateFormat = kAudioCodecPropertyBitRateControlMode;
  kAudioCodecDoesSampleRateConversion =
    kAudioCodecPropertyDoesSampleRateConversion;
  kAudioCodecInputFormatsForOutputFormat =
    kAudioCodecPropertyInputFormatsForOutputFormat;
  kAudioCodecOutputFormatsForInputFormat =
    kAudioCodecPropertyOutputFormatsForInputFormat;
  kAudioCodecPropertyInputChannelLayout =
    kAudioCodecPropertyCurrentInputChannelLayout;
  kAudioCodecPropertyOutputChannelLayout =
    kAudioCodecPropertyCurrentOutputChannelLayout;
  kAudioCodecPropertyAvailableInputChannelLayouts =
    kAudioCodecPropertyAvailableInputChannelLayoutTags;
  kAudioCodecPropertyAvailableOutputChannelLayouts =
    kAudioCodecPropertyAvailableOutputChannelLayoutTags;
  kAudioCodecPropertyZeroFramesPadded = kAudioCodecPropertyPaddedZeros;
  kAudioCodecBitRateFormat_CBR = kAudioCodecBitRateControlMode_Constant;
  kAudioCodecBitRateFormat_ABR = kAudioCodecBitRateControlMode_LongTermAverage;
  kAudioCodecBitRateFormat_VBR =
    kAudioCodecBitRateControlMode_VariableConstrained;
  kAudioCodecOutputPrecedenceNone = 0;
  kAudioCodecOutputPrecedenceBitRate = 1;
  kAudioCodecOutputPrecedenceSampleRate = 2;
  kHintBasic = 0;
  kHintAdvanced = 1;
  kHintHidden = 2;
  kAudioConverterPropertyMinimumInputBufferSize = 1835623027;
  kAudioConverterPropertyMinimumOutputBufferSize = 1836016243;
  kAudioConverterPropertyMaximumInputPacketSize = 2020175987;
  kAudioConverterPropertyMaximumOutputPacketSize = 2020569203;
  kAudioConverterPropertyCalculateInputBufferSize = 1667850867;
  kAudioConverterPropertyCalculateOutputBufferSize = 1668244083;
  kAudioConverterPropertyInputCodecParameters = 1768121456;
  kAudioConverterPropertyOutputCodecParameters = 1868784752;
  kAudioConverterSampleRateConverterComplexity = 1936876385;
  kAudioConverterSampleRateConverterQuality = 1936876401;
  kAudioConverterSampleRateConverterInitialPhase = 1936876400;
  kAudioConverterCodecQuality = 1667527029;
  kAudioConverterPrimeMethod = 1886547309;
  kAudioConverterPrimeInfo = 1886546285;
  kAudioConverterChannelMap = 1667788144;
  kAudioConverterDecompressionMagicCookie = 1684891491;
  kAudioConverterCompressionMagicCookie = 1668114275;
  kAudioConverterEncodeBitRate = 1651663220;
  kAudioConverterEncodeAdjustableSampleRate = 1634366322;
  kAudioConverterInputChannelLayout = 1768123424;
  kAudioConverterOutputChannelLayout = 1868786720;
  kAudioConverterApplicableEncodeBitRates = 1634034290;
  kAudioConverterAvailableEncodeBitRates = 1986355826;
  kAudioConverterApplicableEncodeSampleRates = 1634038642;
  kAudioConverterAvailableEncodeSampleRates = 1986360178;
  kAudioConverterAvailableEncodeChannelLayoutTags = 1634034540;
  kAudioConverterCurrentOutputStreamDescription = 1633906532;
  kAudioConverterCurrentInputStreamDescription = 1633904996;
  kAudioConverterPropertySettings = 1633906803;
  kAudioConverterPropertyBitDepthHint = 1633903204;
  kAudioConverterPropertyFormatList = 1718383476;
  kAudioConverterQuality_Max = 127;
  kAudioConverterQuality_High = 96;
  kAudioConverterQuality_Medium = 64;
  kAudioConverterQuality_Low = 32;
  kAudioConverterQuality_Min = 0;
  kAudioConverterSampleRateConverterComplexity_Linear = 1818848869;
  kAudioConverterSampleRateConverterComplexity_Normal = 1852797549;
  kAudioConverterSampleRateConverterComplexity_Mastering = 1650553971;
  kAudioConverterSampleRateConverterComplexity_MinimumPhase = 1835626096;
  kConverterPrimeMethod_Pre = 0;
  kConverterPrimeMethod_Normal = 1;
  kConverterPrimeMethod_None = 2;
  kAudioConverterErr_FormatNotSupported = 1718449215;
  kAudioConverterErr_OperationNotSupported = 1869627199;
  kAudioConverterErr_PropertyNotSupported = 1886547824;
  kAudioConverterErr_InvalidInputSize = 1768846202;
  kAudioConverterErr_InvalidOutputSize = 1869902714;
  kAudioConverterErr_UnspecifiedError = 2003329396;
  kAudioConverterErr_BadPropertySizeError = 561211770;
  kAudioConverterErr_RequiresPacketDescriptionsError = 561015652;
  kAudioConverterErr_InputSampleRateOutOfRange = 560558962;
  kAudioConverterErr_OutputSampleRateOutOfRange = 560952178;
  kAudioConverterErr_HardwareInUse = 1752656245;
  kAudioConverterErr_NoHardwarePermission = 1885696621;
  kAudioConverterPropertyMaximumInputBufferSize = 2020172403;
  kAudioConverterSampleRateConverterAlgorithm = 1936876393;
  kAudioConverterPropertyCanResumeFromInterruption = 1668441705;
  kAudioFileAIFFType = 1095321158;
  kAudioFileAIFCType = 1095321155;
  kAudioFileWAVEType = 1463899717;
  kAudioFileRF64Type = 1380333108;
  kAudioFileBW64Type = 1113011764;
  kAudioFileWave64Type = 1463170150;
  kAudioFileSoundDesigner2Type = 1399075430;
  kAudioFileNextType = 1315264596;
  kAudioFileMP3Type = 1297106739;
  kAudioFileMP2Type = 1297106738;
  kAudioFileMP1Type = 1297106737;
  kAudioFileAC3Type = 1633889587;
  kAudioFileAAC_ADTSType = 1633973363;
  kAudioFileMPEG4Type = 1836069990;
  kAudioFileM4AType = 1832149350;
  kAudioFileM4BType = 1832149606;
  kAudioFileCAFType = 1667327590;
  kAudioFile3GPType = 862417008;
  kAudioFile3GP2Type = 862416946;
  kAudioFileAMRType = 1634562662;
  kAudioFileFLACType = 1718378851;
  kAudioFileLATMInLOASType = 1819238771;
  kAudioFileUnspecifiedError = 2003334207;
  kAudioFileUnsupportedFileTypeError = 1954115647;
  kAudioFileUnsupportedDataFormatError = 1718449215;
  kAudioFileUnsupportedPropertyError = 1886681407;
  kAudioFileBadPropertySizeError = 561211770;
  kAudioFilePermissionsError = 1886547263;
  kAudioFileNotOptimizedError = 1869640813;
  kAudioFileInvalidChunkError = 1667787583;
  kAudioFileDoesNotAllow64BitDataSizeError = 1868981823;
  kAudioFileInvalidPacketOffsetError = 1885563711;
  kAudioFileInvalidPacketDependencyError = 1684369471;
  kAudioFileInvalidFileError = 1685348671;
  kAudioFileOperationNotSupportedError = 1869627199;
  kAudioFileNotOpenError = -38;
  kAudioFileEndOfFileError = -39;
  kAudioFilePositionError = -40;
  kAudioFileFileNotFoundError = -43;
  kAudioFileFlags_EraseFile = 1;
  kAudioFileFlags_DontPageAlignAudioData = 2;
  kAudioFileReadPermission = 1;
  kAudioFileWritePermission = 2;
  kAudioFileReadWritePermission = 3;
  kAudioFileLoopDirection_NoLooping = 0;
  kAudioFileLoopDirection_Forward = 1;
  kAudioFileLoopDirection_ForwardAndBackward = 2;
  kAudioFileLoopDirection_Backward = 3;
  kAudioFileMarkerType_Generic = 0;
  kAudioFileRegionFlag_LoopEnable = 1;
  kAudioFileRegionFlag_PlayForward = 2;
  kAudioFileRegionFlag_PlayBackward = 4;
  kBytePacketTranslationFlag_IsEstimate = 1;
  kAudioFilePropertyFileFormat = 1717988724;
  kAudioFilePropertyDataFormat = 1684434292;
  kAudioFilePropertyIsOptimized = 1869640813;
  kAudioFilePropertyMagicCookieData = 1835493731;
  kAudioFilePropertyAudioDataByteCount = 1650683508;
  kAudioFilePropertyAudioDataPacketCount = 1885564532;
  kAudioFilePropertyMaximumPacketSize = 1886616165;
  kAudioFilePropertyDataOffset = 1685022310;
  kAudioFilePropertyChannelLayout = 1668112752;
  kAudioFilePropertyDeferSizeUpdates = 1685289589;
  kAudioFilePropertyDataFormatName = 1718512997;
  kAudioFilePropertyMarkerList = 1835756659;
  kAudioFilePropertyRegionList = 1919380595;
  kAudioFilePropertyPacketToFrame = 1886086770;
  kAudioFilePropertyFrameToPacket = 1718775915;
  kAudioFilePropertyRestrictsRandomAccess = 1920098672;
  kAudioFilePropertyPacketToRollDistance = 1886089836;
  kAudioFilePropertyPreviousIndependentPacket = 1885957732;
  kAudioFilePropertyNextIndependentPacket = 1852403300;
  kAudioFilePropertyPacketToDependencyInfo = 1886086256;
  kAudioFilePropertyPacketToByte = 1886085753;
  kAudioFilePropertyByteToPacket = 1652125803;
  kAudioFilePropertyChunkIDs = 1667787108;
  kAudioFilePropertyInfoDictionary = 1768842863;
  kAudioFilePropertyPacketTableInfo = 1886283375;
  kAudioFilePropertyFormatList = 1718383476;
  kAudioFilePropertyPacketSizeUpperBound = 1886090594;
  kAudioFilePropertyPacketRangeByteCountUpperBound = 1886549346;
  kAudioFilePropertyReserveDuration = 1920168566;
  kAudioFilePropertyEstimatedDuration = 1701082482;
  kAudioFilePropertyBitRate = 1651663220;
  kAudioFilePropertyID3Tag = 1768174452;
  kAudioFilePropertyID3TagOffset = 1768174447;
  kAudioFilePropertySourceBitDepth = 1935832164;
  kAudioFilePropertyAlbumArtwork = 1633776244;
  kAudioFilePropertyAudioTrackCount = 1635017588;
  kAudioFilePropertyUseAudioTrack = 1969321067;
  kAudioFileGlobalInfo_ReadableTypes = 1634103910;
  kAudioFileGlobalInfo_WritableTypes = 1634105190;
  kAudioFileGlobalInfo_FileTypeName = 1718906477;
  kAudioFileGlobalInfo_AvailableStreamDescriptionsForFormat = 1935960420;
  kAudioFileGlobalInfo_AvailableFormatIDs = 1718446436;
  kAudioFileGlobalInfo_AllExtensions = 1634498676;
  kAudioFileGlobalInfo_AllHFSTypeCodes = 1634231923;
  kAudioFileGlobalInfo_AllUTIs = 1635087465;
  kAudioFileGlobalInfo_AllMIMETypes = 1634560365;
  kAudioFileGlobalInfo_ExtensionsForType = 1717926004;
  kAudioFileGlobalInfo_HFSTypeCodesForType = 1718118003;
  kAudioFileGlobalInfo_UTIsForType = 1718973545;
  kAudioFileGlobalInfo_MIMETypesForType = 1718446445;
  kAudioFileGlobalInfo_TypesForMIMEType = 1953327469;
  kAudioFileGlobalInfo_TypesForUTI = 1953854569;
  kAudioFileGlobalInfo_TypesForHFSTypeCode = 1952999027;
  kAudioFileGlobalInfo_TypesForExtension = 1952807028;
  kAudioFileStreamPropertyFlag_PropertyIsCached = 1;
  kAudioFileStreamPropertyFlag_CacheProperty = 2;
  kAudioFileStreamParseFlag_Discontinuity = 1;
  kAudioFileStreamSeekFlag_OffsetIsEstimated = 1;
  kAudioFileStreamError_UnsupportedFileType = 1954115647;
  kAudioFileStreamError_UnsupportedDataFormat = 1718449215;
  kAudioFileStreamError_UnsupportedProperty = 1886681407;
  kAudioFileStreamError_BadPropertySize = 561211770;
  kAudioFileStreamError_NotOptimized = 1869640813;
  kAudioFileStreamError_InvalidPacketOffset = 1885563711;
  kAudioFileStreamError_InvalidFile = 1685348671;
  kAudioFileStreamError_ValueUnknown = 1970170687;
  kAudioFileStreamError_DataUnavailable = 1836020325;
  kAudioFileStreamError_IllegalOperation = 1852797029;
  kAudioFileStreamError_UnspecifiedError = 2003334207;
  kAudioFileStreamError_DiscontinuityCantRecover = 1685283617;
  kAudioFileStreamProperty_ReadyToProducePackets = 1919247481;
  kAudioFileStreamProperty_FileFormat = 1717988724;
  kAudioFileStreamProperty_DataFormat = 1684434292;
  kAudioFileStreamProperty_FormatList = 1718383476;
  kAudioFileStreamProperty_MagicCookieData = 1835493731;
  kAudioFileStreamProperty_AudioDataByteCount = 1650683508;
  kAudioFileStreamProperty_AudioDataPacketCount = 1885564532;
  kAudioFileStreamProperty_MaximumPacketSize = 1886616165;
  kAudioFileStreamProperty_DataOffset = 1685022310;
  kAudioFileStreamProperty_ChannelLayout = 1668112752;
  kAudioFileStreamProperty_PacketToFrame = 1886086770;
  kAudioFileStreamProperty_FrameToPacket = 1718775915;
  kAudioFileStreamProperty_RestrictsRandomAccess = 1920098672;
  kAudioFileStreamProperty_PacketToRollDistance = 1886089836;
  kAudioFileStreamProperty_PreviousIndependentPacket = 1885957732;
  kAudioFileStreamProperty_NextIndependentPacket = 1852403300;
  kAudioFileStreamProperty_PacketToDependencyInfo = 1886086256;
  kAudioFileStreamProperty_PacketToByte = 1886085753;
  kAudioFileStreamProperty_ByteToPacket = 1652125803;
  kAudioFileStreamProperty_PacketTableInfo = 1886283375;
  kAudioFileStreamProperty_PacketSizeUpperBound = 1886090594;
  kAudioFileStreamProperty_AverageBytesPerPacket = 1633841264;
  kAudioFileStreamProperty_BitRate = 1651663220;
  kAudioFileStreamProperty_InfoDictionary = 1768842863;
  kPanningMode_SoundField = 3;
  kPanningMode_VectorBasedPanning = 4;
  kAudioBalanceFadeType_MaxUnityGain = 0;
  kAudioBalanceFadeType_EqualPower = 1;
  kAudioFormatProperty_FormatInfo = 1718449257;
  kAudioFormatProperty_FormatName = 1718509933;
  kAudioFormatProperty_EncodeFormatIDs = 1633906534;
  kAudioFormatProperty_DecodeFormatIDs = 1633904998;
  kAudioFormatProperty_FormatList = 1718383476;
  kAudioFormatProperty_ASBDFromESDS = 1702064996;
  kAudioFormatProperty_ChannelLayoutFromESDS = 1702060908;
  kAudioFormatProperty_OutputFormatList = 1868983411;
  kAudioFormatProperty_FirstPlayableFormatFromList = 1718642284;
  kAudioFormatProperty_FormatIsVBR = 1719034482;
  kAudioFormatProperty_FormatIsExternallyFramed = 1717925990;
  kAudioFormatProperty_FormatEmploysDependentPackets = 1717855600;
  kAudioFormatProperty_FormatIsEncrypted = 1668446576;
  kAudioFormatProperty_Encoders = 1635149166;
  kAudioFormatProperty_Decoders = 1635148901;
  kAudioFormatProperty_AvailableEncodeBitRates = 1634034290;
  kAudioFormatProperty_AvailableEncodeSampleRates = 1634038642;
  kAudioFormatProperty_AvailableEncodeChannelLayoutTags = 1634034540;
  kAudioFormatProperty_AvailableEncodeNumberChannels = 1635151459;
  kAudioFormatProperty_AvailableDecodeNumberChannels = 1633971811;
  kAudioFormatProperty_ASBDFromMPEGPacket = 1633971568;
  kAudioFormatProperty_BitmapForLayoutTag = 1651340391;
  kAudioFormatProperty_MatrixMixMap = 1835884912;
  kAudioFormatProperty_ChannelMap = 1667788144;
  kAudioFormatProperty_NumberOfChannelsForLayout = 1852008557;
  kAudioFormatProperty_AreChannelLayoutsEquivalent = 1667786097;
  kAudioFormatProperty_ChannelLayoutHash = 1667786849;
  kAudioFormatProperty_ValidateChannelLayout = 1986093932;
  kAudioFormatProperty_ChannelLayoutForTag = 1668116588;
  kAudioFormatProperty_TagForChannelLayout = 1668116596;
  kAudioFormatProperty_ChannelLayoutName = 1819242093;
  kAudioFormatProperty_ChannelLayoutSimpleName = 1819504237;
  kAudioFormatProperty_ChannelLayoutForBitmap = 1668116578;
  kAudioFormatProperty_ChannelName = 1668178285;
  kAudioFormatProperty_ChannelShortName = 1668509293;
  kAudioFormatProperty_TagsForNumberOfChannels = 1952540515;
  kAudioFormatProperty_PanningMatrix = 1885433453;
  kAudioFormatProperty_BalanceFade = 1650551910;
  kAudioFormatProperty_ID3TagSize = 1768174451;
  kAudioFormatProperty_ID3TagToDictionary = 1768174436;
  kAudioFormatProperty_HardwareCodecCapabilities = 1752654691;
  kAudioDecoderComponentType = 1633969507;
  kAudioEncoderComponentType = 1634037347;
  kAppleSoftwareAudioCodecManufacturer = 1634758764;
  kAppleHardwareAudioCodecManufacturer = 1634756727;
  kAudioFormatUnspecifiedError = 2003329396;
  kAudioFormatUnsupportedPropertyError = 1886547824;
  kAudioFormatBadPropertySizeError = 561211770;
  kAudioFormatBadSpecifierSizeError = 561213539;
  kAudioFormatUnsupportedDataFormatError = 1718449215;
  kAudioFormatUnknownFormatError = 560360820;
  kAudioOutputUnitRange = 512;
  kAudioOutputUnitStartSelect = 513;
  kAudioOutputUnitStopSelect = 514;
  kAudioQueueErr_InvalidBuffer = -66687;
  kAudioQueueErr_BufferEmpty = -66686;
  kAudioQueueErr_DisposalPending = -66685;
  kAudioQueueErr_InvalidProperty = -66684;
  kAudioQueueErr_InvalidPropertySize = -66683;
  kAudioQueueErr_InvalidParameter = -66682;
  kAudioQueueErr_CannotStart = -66681;
  kAudioQueueErr_InvalidDevice = -66680;
  kAudioQueueErr_BufferInQueue = -66679;
  kAudioQueueErr_InvalidRunState = -66678;
  kAudioQueueErr_InvalidQueueType = -66677;
  kAudioQueueErr_Permissions = -66676;
  kAudioQueueErr_InvalidPropertyValue = -66675;
  kAudioQueueErr_PrimeTimedOut = -66674;
  kAudioQueueErr_CodecNotFound = -66673;
  kAudioQueueErr_InvalidCodecAccess = -66672;
  kAudioQueueErr_QueueInvalidated = -66671;
  kAudioQueueErr_TooManyTaps = -66670;
  kAudioQueueErr_InvalidTapContext = -66669;
  kAudioQueueErr_RecordUnderrun = -66668;
  kAudioQueueErr_InvalidTapType = -66667;
  kAudioQueueErr_BufferEnqueuedTwice = -66666;
  kAudioQueueErr_CannotStartYet = -66665;
  kAudioQueueErr_EnqueueDuringReset = -66632;
  kAudioQueueErr_InvalidOfflineMode = -66626;
  kAudioQueueProperty_IsRunning = 1634824814;
  kAudioQueueDeviceProperty_SampleRate = 1634825074;
  kAudioQueueDeviceProperty_NumberChannels = 1634821219;
  kAudioQueueProperty_CurrentDevice = 1634820964;
  kAudioQueueProperty_MagicCookie = 1634823523;
  kAudioQueueProperty_MaximumOutputPacketSize = 2020569203;
  kAudioQueueProperty_StreamDescription = 1634821748;
  kAudioQueueProperty_ChannelLayout = 1634820972;
  kAudioQueueProperty_EnableLevelMetering = 1634823525;
  kAudioQueueProperty_CurrentLevelMeter = 1634823542;
  kAudioQueueProperty_CurrentLevelMeterDB = 1634823524;
  kAudioQueueProperty_DecodeBufferSizeFrames = 1684234854;
  kAudioQueueProperty_ConverterError = 1902343781;
  kAudioQueueProperty_EnableTimePitch = 1902081136;
  kAudioQueueProperty_TimePitchAlgorithm = 1903456353;
  kAudioQueueProperty_TimePitchBypass = 1903456354;
  kAudioQueueTimePitchAlgorithm_Spectral = 1936745827;
  kAudioQueueTimePitchAlgorithm_TimeDomain = 1953064047;
  kAudioQueueTimePitchAlgorithm_Varispeed = 1987276900;
  kAudioQueueTimePitchAlgorithm_LowQualityZeroLatency = 1819376236;
  kAudioQueueProperty_HardwareCodecPolicy = 1634820976;
  kAudioQueueHardwareCodecPolicy_Default = 0;
  kAudioQueueHardwareCodecPolicy_UseSoftwareOnly = 1;
  kAudioQueueHardwareCodecPolicy_UseHardwareOnly = 2;
  kAudioQueueHardwareCodecPolicy_PreferSoftware = 3;
  kAudioQueueHardwareCodecPolicy_PreferHardware = 4;
  kAudioQueueProperty_ChannelAssignments = 1634820961;
  kAudioQueueParam_Volume = 1;
  kAudioQueueParam_PlayRate = 2;
  kAudioQueueParam_Pitch = 3;
  kAudioQueueParam_VolumeRampTime = 4;
  kAudioQueueParam_Pan = 13;
  kAudioQueueProcessingTap_PreEffects = (1 shl 0);
  kAudioQueueProcessingTap_PostEffects = (1 shl 1);
  kAudioQueueProcessingTap_Siphon = (1 shl 2);
  kAudioQueueProcessingTap_StartOfStream = (1 shl 8);
  kAudioQueueProcessingTap_EndOfStream = (1 shl 9);
  kAudioSessionNoError = 0;
  kAudioSessionNotInitialized = 560557673;
  kAudioSessionAlreadyInitialized = 1768843636;
  kAudioSessionInitializationError = 1768843583;
  kAudioSessionUnsupportedPropertyError = 1886681407;
  kAudioSessionBadPropertySizeError = 561211770;
  kAudioSessionNotActiveError = 560030580;
  kAudioServicesNoHardwareError = 1852794999;
  kAudioSessionNoCategorySet = 1063477620;
  kAudioSessionIncompatibleCategory = 560161140;
  kAudioSessionUnspecifiedError = 2003329396;
  kAudioSessionBeginInterruption = 1;
  kAudioSessionEndInterruption = 0;
  kAudioSessionCategory_AmbientSound = 1634558569;
  kAudioSessionCategory_SoloAmbientSound = 1936682095;
  kAudioSessionCategory_MediaPlayback = 1835361385;
  kAudioSessionCategory_RecordAudio = 1919247201;
  kAudioSessionCategory_PlayAndRecord = 1886151026;
  kAudioSessionCategory_AudioProcessing = 1886547811;
  kAudioSessionOverrideAudioRoute_None = 0;
  kAudioSessionOverrideAudioRoute_Speaker = 1936747378;
  kAudioSessionRouteChangeReason_Unknown = 0;
  kAudioSessionRouteChangeReason_NewDeviceAvailable = 1;
  kAudioSessionRouteChangeReason_OldDeviceUnavailable = 2;
  kAudioSessionRouteChangeReason_CategoryChange = 3;
  kAudioSessionRouteChangeReason_Override = 4;
  kAudioSessionRouteChangeReason_WakeFromSleep = 6;
  kAudioSessionRouteChangeReason_NoSuitableRouteForCategory = 7;
  kAudioSessionRouteChangeReason_RouteConfigurationChange = 8;
  kAudioSessionInterruptionType_ShouldResume = 1769108333;
  kAudioSessionInterruptionType_ShouldNotResume = 561148781;
  kAudioSessionMode_Default = 1684434036;
  kAudioSessionMode_VoiceChat = 1986225012;
  kAudioSessionMode_VideoRecording = 1987208036;
  kAudioSessionMode_Measurement = 1836281204;
  kAudioSessionMode_GameChat = 1735222132;
  kAudioSessionProperty_PreferredHardwareSampleRate = 1752658802;
  kAudioSessionProperty_PreferredHardwareIOBufferDuration = 1768907364;
  kAudioSessionProperty_AudioCategory = 1633902964;
  kAudioSessionProperty_AudioRouteChange = 1919902568;
  kAudioSessionProperty_CurrentHardwareSampleRate = 1667789682;
  kAudioSessionProperty_CurrentHardwareInputNumberChannels = 1667787107;
  kAudioSessionProperty_CurrentHardwareOutputNumberChannels = 1667788643;
  kAudioSessionProperty_CurrentHardwareOutputVolume = 1667788662;
  kAudioSessionProperty_CurrentHardwareInputLatency = 1667853428;
  kAudioSessionProperty_CurrentHardwareOutputLatency = 1668246644;
  kAudioSessionProperty_CurrentHardwareIOBufferDuration = 1667785316;
  kAudioSessionProperty_OtherAudioIsPlaying = 1869899890;
  kAudioSessionProperty_OverrideAudioRoute = 1870033508;
  kAudioSessionProperty_AudioInputAvailable = 1634296182;
  kAudioSessionProperty_ServerDied = 1684628836;
  kAudioSessionProperty_OtherMixableAudioShouldDuck = 1685414763;
  kAudioSessionProperty_OverrideCategoryMixWithOthers = 1668114808;
  kAudioSessionProperty_OverrideCategoryDefaultToSpeaker = 1668509803;
  kAudioSessionProperty_OverrideCategoryEnableBluetoothInput = 1667394677;
  kAudioSessionProperty_InterruptionType = 1954115685;
  kAudioSessionProperty_Mode = 1836016741;
  kAudioSessionProperty_InputSources = 1936876403;
  kAudioSessionProperty_OutputDestinations = 1685288051;
  kAudioSessionProperty_InputSource = 1769173603;
  kAudioSessionProperty_OutputDestination = 1868854132;
  kAudioSessionProperty_InputGainAvailable = 1768382838;
  kAudioSessionProperty_InputGainScalar = 1768387427;
  kAudioSessionProperty_AudioRouteDescription = 1668440434;
  kAudioSessionSetActiveFlag_NotifyOthersOnDeactivation = (1 shl 0);
  kAudioSessionCategory_UserInterfaceSoundEffects = 1969841784;
  kAudioSessionCategory_LiveAudio = 1818850917;
  kAudioSessionProperty_AudioRoute = 1919907188;
  kAudioServicesNoError = 0;
  kAudioServicesUnsupportedPropertyError = 1886681407;
  kAudioServicesBadPropertySizeError = 561211770;
  kAudioServicesBadSpecifierSizeError = 561213539;
  kAudioServicesSystemSoundUnspecifiedError = -1500;
  kAudioServicesSystemSoundClientTimedOutError = -1501;
  kAudioServicesSystemSoundExceededMaximumDurationError = -1502;
  kSystemSoundID_Vibrate = 4095;
  kAudioServicesPropertyIsUISound = 1769174377;
  kAudioServicesPropertyCompletePlaybackIfAppDies = 1768318057;
  kAUGroupParameterID_Volume = 7;
  kAUGroupParameterID_Sustain = 64;
  kAUGroupParameterID_Sostenuto = 66;
  kAUGroupParameterID_AllNotesOff = 123;
  kAUGroupParameterID_ModWheel = 1;
  kAUGroupParameterID_PitchBend = 224;
  kAUGroupParameterID_AllSoundOff = 120;
  kAUGroupParameterID_ResetAllControllers = 121;
  kAUGroupParameterID_Pan = 10;
  kAUGroupParameterID_Foot = 4;
  kAUGroupParameterID_ChannelPressure = 208;
  kAUGroupParameterID_KeyPressure = 160;
  kAUGroupParameterID_Expression = 11;
  kAUGroupParameterID_DataEntry = 6;
  kAUGroupParameterID_Volume_LSB = kAUGroupParameterID_Volume + 32;
  kAUGroupParameterID_ModWheel_LSB = kAUGroupParameterID_ModWheel + 32;
  kAUGroupParameterID_Pan_LSB = kAUGroupParameterID_Pan + 32;
  kAUGroupParameterID_Foot_LSB = kAUGroupParameterID_Foot + 32;
  kAUGroupParameterID_Expression_LSB = kAUGroupParameterID_Expression + 32;
  kAUGroupParameterID_DataEntry_LSB = kAUGroupParameterID_DataEntry + 32;
  kAUGroupParameterID_KeyPressure_FirstKey = 256;
  kAUGroupParameterID_KeyPressure_LastKey = 383;
  kSpatialMixerParam_Azimuth = 0;
  kSpatialMixerParam_Elevation = 1;
  kSpatialMixerParam_Distance = 2;
  kSpatialMixerParam_Gain = 3;
  kSpatialMixerParam_PlaybackRate = 4;
  kSpatialMixerParam_Enable = 5;
  kSpatialMixerParam_MinGain = 6;
  kSpatialMixerParam_MaxGain = 7;
  kSpatialMixerParam_ReverbBlend = 8;
  kSpatialMixerParam_GlobalReverbGain = 9;
  kSpatialMixerParam_OcclusionAttenuation = 10;
  kSpatialMixerParam_ObstructionAttenuation = 11;
  kSpatialMixerParam_HeadYaw = 19;
  kSpatialMixerParam_HeadPitch = 20;
  kSpatialMixerParam_HeadRoll = 21;
  kReverbParam_FilterFrequency = 14;
  kReverbParam_FilterBandwidth = 15;
  kReverbParam_FilterGain = 16;
  kReverbParam_FilterType = 17;
  kReverbParam_FilterEnable = 18;
  k3DMixerParam_Azimuth = 0;
  k3DMixerParam_Elevation = 1;
  k3DMixerParam_Distance = 2;
  k3DMixerParam_Gain = 3;
  k3DMixerParam_PlaybackRate = 4;
  k3DMixerParam_BusEnable = 20;
  k3DMixerParam_MinGainInDecibels = 21;
  k3DMixerParam_MaxGainInDecibels = 22;
  k3DMixerParam_DryWetReverbBlend = 23;
  k3DMixerParam_GlobalReverbGainInDecibels = 24;
  k3DMixerParam_OcclusionAttenuationInDecibels = 25;
  k3DMixerParam_ObstructionAttenuationInDecibels = 26;
  k3DMixerParam_Enable = 5;
  k3DMixerParam_MinGain = 6;
  k3DMixerParam_MaxGain = 7;
  k3DMixerParam_ReverbBlend = 8;
  k3DMixerParam_GlobalReverbGain = 9;
  k3DMixerParam_OcclusionAttenuation = 10;
  k3DMixerParam_ObstructionAttenuation = 11;
  k3DMixerParam_PreAveragePower = 1000;
  k3DMixerParam_PrePeakHoldLevel = 2000;
  k3DMixerParam_PostAveragePower = 3000;
  k3DMixerParam_PostPeakHoldLevel = 4000;
  kMultiChannelMixerParam_Volume = 0;
  kMultiChannelMixerParam_Enable = 1;
  kMultiChannelMixerParam_Pan = 2;
  kMultiChannelMixerParam_PreAveragePower = 1000;
  kMultiChannelMixerParam_PrePeakHoldLevel = 2000;
  kMultiChannelMixerParam_PostAveragePower = 3000;
  kMultiChannelMixerParam_PostPeakHoldLevel = 4000;
  kMatrixMixerParam_Volume = 0;
  kMatrixMixerParam_Enable = 1;
  kMatrixMixerParam_PreAveragePower = 1000;
  kMatrixMixerParam_PrePeakHoldLevel = 2000;
  kMatrixMixerParam_PostAveragePower = 3000;
  kMatrixMixerParam_PostPeakHoldLevel = 4000;
  kMatrixMixerParam_PreAveragePowerLinear = 5000;
  kMatrixMixerParam_PrePeakHoldLevelLinear = 6000;
  kMatrixMixerParam_PostAveragePowerLinear = 7000;
  kMatrixMixerParam_PostPeakHoldLevelLinear = 8000;
  kHALOutputParam_Volume = 14;
  kTimePitchParam_Rate = 0;
  kTimePitchParam_Pitch = 1;
  kTimePitchParam_EffectBlend = 2;
  kNewTimePitchParam_Rate = 0;
  kNewTimePitchParam_Pitch = 1;
  kNewTimePitchParam_Smoothness = 4;
  kNewTimePitchParam_Overlap = kNewTimePitchParam_Smoothness;
  kNewTimePitchParam_EnableSpectralCoherence = 6;
  kNewTimePitchParam_EnablePeakLocking =
    kNewTimePitchParam_EnableSpectralCoherence;
  kNewTimePitchParam_EnableTransientPreservation = 7;
  kAUSamplerParam_Gain = 900;
  kAUSamplerParam_CoarseTuning = 901;
  kAUSamplerParam_FineTuning = 902;
  kAUSamplerParam_Pan = 903;
  kBandpassParam_CenterFrequency = 0;
  kBandpassParam_Bandwidth = 1;
  kHipassParam_CutoffFrequency = 0;
  kHipassParam_Resonance = 1;
  kLowPassParam_CutoffFrequency = 0;
  kLowPassParam_Resonance = 1;
  kHighShelfParam_CutOffFrequency = 0;
  kHighShelfParam_Gain = 1;
  kAULowShelfParam_CutoffFrequency = 0;
  kAULowShelfParam_Gain = 1;
  kParametricEQParam_CenterFreq = 0;
  kParametricEQParam_Q = 1;
  kParametricEQParam_Gain = 2;
  kLimiterParam_AttackTime = 0;
  kLimiterParam_DecayTime = 1;
  kLimiterParam_PreGain = 2;
  kDynamicsProcessorParam_Threshold = 0;
  kDynamicsProcessorParam_HeadRoom = 1;
  kDynamicsProcessorParam_ExpansionRatio = 2;
  kDynamicsProcessorParam_ExpansionThreshold = 3;
  kDynamicsProcessorParam_AttackTime = 4;
  kDynamicsProcessorParam_ReleaseTime = 5;
  kDynamicsProcessorParam_OverallGain = 6;
  kDynamicsProcessorParam_MasterGain = kDynamicsProcessorParam_OverallGain;
  kDynamicsProcessorParam_CompressionAmount = 1000;
  kDynamicsProcessorParam_InputAmplitude = 2000;
  kDynamicsProcessorParam_OutputAmplitude = 3000;
  kVarispeedParam_PlaybackRate = 0;
  kVarispeedParam_PlaybackCents = 1;
  kDistortionParam_Delay = 0;
  kDistortionParam_Decay = 1;
  kDistortionParam_DelayMix = 2;
  kDistortionParam_Decimation = 3;
  kDistortionParam_Rounding = 4;
  kDistortionParam_DecimationMix = 5;
  kDistortionParam_LinearTerm = 6;
  kDistortionParam_SquaredTerm = 7;
  kDistortionParam_CubicTerm = 8;
  kDistortionParam_PolynomialMix = 9;
  kDistortionParam_RingModFreq1 = 10;
  kDistortionParam_RingModFreq2 = 11;
  kDistortionParam_RingModBalance = 12;
  kDistortionParam_RingModMix = 13;
  kDistortionParam_SoftClipGain = 14;
  kDistortionParam_FinalMix = 15;
  kDelayParam_WetDryMix = 0;
  kDelayParam_DelayTime = 1;
  kDelayParam_Feedback = 2;
  kDelayParam_LopassCutoff = 3;
  kSampleDelayParam_DelayFrames = 0;
  kAUNBandEQParam_GlobalGain = 0;
  kAUNBandEQParam_BypassBand = 1000;
  kAUNBandEQParam_FilterType = 2000;
  kAUNBandEQParam_Frequency = 3000;
  kAUNBandEQParam_Gain = 4000;
  kAUNBandEQParam_Bandwidth = 5000;
  kAUNBandEQFilterType_Parametric = 0;
  kAUNBandEQFilterType_2ndOrderButterworthLowPass = 1;
  kAUNBandEQFilterType_2ndOrderButterworthHighPass = 2;
  kAUNBandEQFilterType_ResonantLowPass = 3;
  kAUNBandEQFilterType_ResonantHighPass = 4;
  kAUNBandEQFilterType_BandPass = 5;
  kAUNBandEQFilterType_BandStop = 6;
  kAUNBandEQFilterType_LowShelf = 7;
  kAUNBandEQFilterType_HighShelf = 8;
  kAUNBandEQFilterType_ResonantLowShelf = 9;
  kAUNBandEQFilterType_ResonantHighShelf = 10;
  kNumAUNBandEQFilterTypes = 11;
  kRoundTripAACParam_Format = 0;
  kRoundTripAACParam_EncodingStrategy = 1;
  kRoundTripAACParam_RateOrQuality = 2;
  kAUSoundIsolationParam_WetDryMixPercent = 0;
  kAUSoundIsolationParam_SoundToIsolate = 1;
  kAUSoundIsolationSoundType_Voice = 1;
  kRandomParam_BoundA = 0;
  kRandomParam_BoundB = 1;
  kRandomParam_Curve = 2;
  kReverb2Param_DryWetMix = 0;
  kReverb2Param_Gain = 1;
  kReverb2Param_MinDelayTime = 2;
  kReverb2Param_MaxDelayTime = 3;
  kReverb2Param_DecayTimeAt0Hz = 4;
  kReverb2Param_DecayTimeAtNyquist = 5;
  kReverb2Param_RandomizeReflections = 6;
  kMusicNoteEvent_UseGroupInstrument = 4294967295;
  kMusicNoteEvent_Unused = 4294967295;
  kMusicDeviceRange = 256;
  kMusicDeviceMIDIEventSelect = 257;
  kMusicDeviceSysExSelect = 258;
  kMusicDevicePrepareInstrumentSelect = 259;
  kMusicDeviceReleaseInstrumentSelect = 260;
  kMusicDeviceStartNoteSelect = 261;
  kMusicDeviceStopNoteSelect = 262;
  kMusicDeviceMIDIEventListSelect = 263;
  kAUGraphErr_NodeNotFound = -10860;
  kAUGraphErr_InvalidConnection = -10861;
  kAUGraphErr_OutputNodeErr = -10862;
  kAUGraphErr_CannotDoInCurrentContext = -10863;
  kAUGraphErr_InvalidAudioUnit = -10864;
  kAUNodeInteraction_Connection = 1;
  kAUNodeInteraction_InputCallback = 2;
  kAUParameterListener_AnyParameter = 4294967295;
  kAudioUnitEvent_ParameterValueChange = 0;
  kAudioUnitEvent_BeginParameterChangeGesture = 1;
  kAudioUnitEvent_EndParameterChangeGesture = 2;
  kAudioUnitEvent_PropertyChange = 3;
  kCAF_FileType = 1667327590;
  kCAF_FileVersion_Initial = 1;
  kCAF_StreamDescriptionChunkID = 1684370275;
  kCAF_AudioDataChunkID = 1684108385;
  kCAF_ChannelLayoutChunkID = 1667785070;
  kCAF_FillerChunkID = 1718773093;
  kCAF_MarkerChunkID = 1835102827;
  kCAF_RegionChunkID = 1919248238;
  kCAF_InstrumentChunkID = 1768846196;
  kCAF_MagicCookieID = 1802857321;
  kCAF_InfoStringsChunkID = 1768842863;
  kCAF_EditCommentsChunkID = 1701077876;
  kCAF_PacketTableChunkID = 1885432692;
  kCAF_StringsChunkID = 1937011303;
  kCAF_UUIDChunkID = 1970628964;
  kCAF_PeakChunkID = 1885692267;
  kCAF_OverviewChunkID = 1870034551;
  kCAF_MIDIChunkID = 1835623529;
  kCAF_UMIDChunkID = 1970104676;
  kCAF_FormatListID = 1818522467;
  kCAF_iXMLChunkID = 1767394636;
  kCAFLinearPCMFormatFlagIsFloat = (1 shl 0);
  kCAFLinearPCMFormatFlagIsLittleEndian = (1 shl 1);
  kCAFMarkerType_Generic = 0;
  kCAFMarkerType_ProgramStart = 1885496679;
  kCAFMarkerType_ProgramEnd = 1885695588;
  kCAFMarkerType_TrackStart = 1952605543;
  kCAFMarkerType_TrackEnd = 1952804452;
  kCAFMarkerType_Index = 1768842360;
  kCAFMarkerType_RegionStart = 1919051111;
  kCAFMarkerType_RegionEnd = 1919250020;
  kCAFMarkerType_RegionSyncPoint = 1920170339;
  kCAFMarkerType_SelectionStart = 1935828327;
  kCAFMarkerType_SelectionEnd = 1936027236;
  kCAFMarkerType_EditSourceBegin = 1667392871;
  kCAFMarkerType_EditSourceEnd = 1667591780;
  kCAFMarkerType_EditDestinationBegin = 1684170087;
  kCAFMarkerType_EditDestinationEnd = 1684368996;
  kCAFMarkerType_SustainLoopStart = 1936482919;
  kCAFMarkerType_SustainLoopEnd = 1936483694;
  kCAFMarkerType_ReleaseLoopStart = 1919705703;
  kCAFMarkerType_ReleaseLoopEnd = 1919706478;
  kCAFMarkerType_SavedPlayPosition = 1936747641;
  kCAFMarkerType_Tempo = 1953329263;
  kCAFMarkerType_TimeSignature = 1953720679;
  kCAFMarkerType_KeySignature = 1802725735;
  kCAF_SMPTE_TimeTypeNone = 0;
  kCAF_SMPTE_TimeType24 = 1;
  kCAF_SMPTE_TimeType25 = 2;
  kCAF_SMPTE_TimeType30Drop = 3;
  kCAF_SMPTE_TimeType30 = 4;
  kCAF_SMPTE_TimeType2997 = 5;
  kCAF_SMPTE_TimeType2997Drop = 6;
  kCAF_SMPTE_TimeType60 = 7;
  kCAF_SMPTE_TimeType5994 = 8;
  kCAF_SMPTE_TimeType60Drop = 9;
  kCAF_SMPTE_TimeType5994Drop = 10;
  kCAF_SMPTE_TimeType50 = 11;
  kCAF_SMPTE_TimeType2398 = 12;
  kCAFRegionFlag_LoopEnable = 1;
  kCAFRegionFlag_PlayForward = 2;
  kCAFRegionFlag_PlayBackward = 4;
  kExtAudioFilePacketTableInfoOverride_UseFileValue = -1;
  kExtAudioFilePacketTableInfoOverride_UseFileValueIfValid = -2;
  kExtAudioFileProperty_FileDataFormat = 1717988724;
  kExtAudioFileProperty_FileChannelLayout = 1717791855;
  kExtAudioFileProperty_ClientDataFormat = 1667657076;
  kExtAudioFileProperty_ClientChannelLayout = 1667460207;
  kExtAudioFileProperty_CodecManufacturer = 1668112750;
  kExtAudioFileProperty_AudioConverter = 1633906294;
  kExtAudioFileProperty_AudioFile = 1634101612;
  kExtAudioFileProperty_FileMaxPacketSize = 1718448243;
  kExtAudioFileProperty_ClientMaxPacketSize = 1668116595;
  kExtAudioFileProperty_FileLengthFrames = 593916525;
  kExtAudioFileProperty_ConverterConfig = 1633903462;
  kExtAudioFileProperty_IOBufferSizeBytes = 1768907379;
  kExtAudioFileProperty_IOBuffer = 1768907366;
  kExtAudioFileProperty_PacketTable = 2020635753;
  kExtAudioFileError_InvalidProperty = -66561;
  kExtAudioFileError_InvalidPropertySize = -66562;
  kExtAudioFileError_NonPCMClientFormat = -66563;
  kExtAudioFileError_InvalidChannelMap = -66564;
  kExtAudioFileError_InvalidOperationOrder = -66565;
  kExtAudioFileError_InvalidDataFormat = -66566;
  kExtAudioFileError_MaxPacketSizeUnknown = -66567;
  kExtAudioFileError_InvalidSeek = -66568;
  kExtAudioFileError_AsyncWriteTooLarge = -66569;
  kExtAudioFileError_AsyncWriteBufferOverflow = -66570;
  kExtAudioFileError_CodecUnavailableInputConsumed = -66559;
  kExtAudioFileError_CodecUnavailableInputNotConsumed = -66560;
  kMusicEventType_NULL = 0;
  kMusicEventType_ExtendedNote = 1;
  kMusicEventType_ExtendedTempo = 3;
  kMusicEventType_User = 4;
  kMusicEventType_Meta = 5;
  kMusicEventType_MIDINoteMessage = 6;
  kMusicEventType_MIDIChannelMessage = 7;
  kMusicEventType_MIDIRawData = 8;
  kMusicEventType_Parameter = 9;
  kMusicEventType_AUPreset = 10;
  kMusicSequenceLoadSMF_PreserveTracks = 0;
  kMusicSequenceLoadSMF_ChannelsToTracks = (1 shl 0);
  kMusicSequenceType_Beats = 1650811252;
  kMusicSequenceType_Seconds = 1936024435;
  kMusicSequenceType_Samples = 1935764848;
  kMusicSequenceFile_AnyType = 0;
  kMusicSequenceFile_MIDIType = 1835623529;
  kMusicSequenceFile_iMelodyType = 1768777068;
  kMusicSequenceFileFlags_Default = 0;
  kMusicSequenceFileFlags_EraseFile = 1;
  kAudioToolboxErr_InvalidSequenceType = -10846;
  kAudioToolboxErr_TrackIndexError = -10859;
  kAudioToolboxErr_TrackNotFound = -10858;
  kAudioToolboxErr_EndOfTrack = -10857;
  kAudioToolboxErr_StartOfTrack = -10856;
  kAudioToolboxErr_IllegalTrackDestination = -10855;
  kAudioToolboxErr_NoSequence = -10854;
  kAudioToolboxErr_InvalidEventType = -10853;
  kAudioToolboxErr_InvalidPlayerState = -10852;
  kAudioToolboxErr_CannotDoInCurrentContext = -10863;
  kAudioToolboxError_NoTrackDestination = -66720;
  kSequenceTrackProperty_LoopInfo = 0;
  kSequenceTrackProperty_OffsetTime = 1;
  kSequenceTrackProperty_MuteStatus = 2;
  kSequenceTrackProperty_SoloStatus = 3;
  kSequenceTrackProperty_AutomatedParameters = 4;
  kSequenceTrackProperty_TrackLength = 5;
  kSequenceTrackProperty_TimeResolution = 6;

type

  // ===== Forward declarations =====
{$M+}
  AUParameter = interface;
  AUParameterNode = interface;
  AUParameterGroup = interface;
  AUParameterTree = interface;
  AUAudioUnitBusArray = interface;
  AUAudioUnitBus = interface;
  AUAudioUnitPreset = interface;
  AUAudioUnitFactory = interface;
  AUMessageChannel = interface;
  AUAudioUnit = interface;
  AUAudioUnitV2Bridge = interface;

  // ===== Framework typedefs =====
{$M+}
  AudioComponentFlags = UInt32;
  AudioComponentInstantiationOptions = UInt32;
  FourCharCode = UInt32;
  PFourCharCode = ^FourCharCode;
  OSType = FourCharCode;
  POSType = ^OSType;

  AudioComponentDescription = record
    componentType: OSType;
    componentSubType: OSType;
    componentManufacturer: OSType;
    componentFlags: UInt32;
    componentFlagsMask: UInt32;
  end;

  PAudioComponentDescription = ^AudioComponentDescription;

  AudioComponent = Pointer;
  PAudioComponent = ^AudioComponent;
  AudioComponentInstance = Pointer;
  PAudioComponentInstance = ^AudioComponentInstance;
  OSStatus = Int32;
  POSStatus = ^OSStatus;
  AudioComponentMethod = function(param1: Pointer): OSStatus; cdecl;
  PAudioComponentMethod = ^AudioComponentMethod;
  TAudioToolboxOpen = function(param1: Pointer; param2: AudioComponentInstance)
    : OSStatus; cdecl;
  TAudioToolboxClose = function(param1: Pointer): OSStatus; cdecl;
  TAudioToolboxLookup = function(param1: Int16): AudioComponentMethod; cdecl;

  AudioComponentPlugInInterface = record
    Open: TAudioToolboxOpen;
    Close: TAudioToolboxClose;
    Lookup: TAudioToolboxLookup;
    reserved: Pointer;
  end;

  PAudioComponentPlugInInterface = ^AudioComponentPlugInInterface;

  AudioComponentFactoryFunction = function(param1: PAudioComponentDescription)
    : PAudioComponentPlugInInterface; cdecl;
  PAudioComponentFactoryFunction = ^AudioComponentFactoryFunction;
  TAudioToolboxInCompletionHandler = procedure(param1: AudioComponentInstance;
    param2: OSStatus) of object;
  Boolean = Byte;
  PBoolean = ^Boolean;

  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  AudioComponentValidationResult = UInt32;
  CFDictionaryRef = Pointer;
  PCFDictionaryRef = ^CFDictionaryRef;
  TAudioToolboxInCompletionHandler1 = procedure
    (param1: AudioComponentValidationResult; param2: CFDictionaryRef) of object;
  AudioUnit = AudioComponentInstance;
  PAudioUnit = ^AudioUnit;
  AudioUnitRenderActionFlags = UInt32;
  AudioUnitPropertyID = UInt32;
  PAudioUnitPropertyID = ^AudioUnitPropertyID;
  AudioUnitScope = UInt32;
  PAudioUnitScope = ^AudioUnitScope;
  AudioUnitElement = UInt32;
  PAudioUnitElement = ^AudioUnitElement;
  AudioUnitParameterID = UInt32;
  PAudioUnitParameterID = ^AudioUnitParameterID;
  AudioUnitParameterValue = Single;
  PAudioUnitParameterValue = ^AudioUnitParameterValue;
  AUParameterEventType = UInt32;

  AudioUnitParameterEvent = record
    scope: AudioUnitScope;
    element: AudioUnitElement;
    parameter: AudioUnitParameterID;
    eventType: AUParameterEventType;
    case Integer of
      0:
        (startBufferOffset: Int32;
          durationInFrames: UInt32;
          startValue: AudioUnitParameterValue;
          endValue: AudioUnitParameterValue;
        );
      1:
        (bufferOffset: UInt32;
          value: AudioUnitParameterValue;
        );

  end;

  PAudioUnitParameterEvent = ^AudioUnitParameterEvent;

  AudioUnitParameter = record
    mAudioUnit: AudioUnit;
    mParameterID: AudioUnitParameterID;
    mScope: AudioUnitScope;
    mElement: AudioUnitElement;
  end;

  PAudioUnitParameter = ^AudioUnitParameter;

  AudioUnitProperty = record
    mAudioUnit: AudioUnit;
    mPropertyID: AudioUnitPropertyID;
    mScope: AudioUnitScope;
    mElement: AudioUnitElement;
  end;

  PAudioUnitProperty = ^AudioUnitProperty;

  AURenderCallback = function(param1: Pointer;
    param2: PAudioUnitRenderActionFlags; param3: PInteger; param4: UInt32;
    param5: UInt32; param6: PInteger): OSStatus; cdecl;
  PAURenderCallback = ^AURenderCallback;
  AudioUnitPropertyListenerProc = procedure(param1: Pointer; param2: AudioUnit;
    param3: AudioUnitPropertyID; param4: AudioUnitScope;
    param5: AudioUnitElement); cdecl;
  PAudioUnitPropertyListenerProc = ^AudioUnitPropertyListenerProc;
  AUInputSamplesInOutputCallback = procedure(param1: Pointer; param2: PInteger;
    param3: Double; param4: Double); cdecl;
  PAUInputSamplesInOutputCallback = ^AUInputSamplesInOutputCallback;
  CFTimeInterval = Double;
  PCFTimeInterval = ^CFTimeInterval;

  CFAbsoluteTime = CFTimeInterval;
  PCFAbsoluteTime = ^CFAbsoluteTime;
  CFArrayRef = Pointer;
  PCFArrayRef = ^CFArrayRef;
  AudioUnitInitializeProc = function(param1: Pointer): OSStatus; cdecl;
  PAudioUnitInitializeProc = ^AudioUnitInitializeProc;
  AudioUnitUninitializeProc = function(param1: Pointer): OSStatus; cdecl;
  PAudioUnitUninitializeProc = ^AudioUnitUninitializeProc;
  AudioUnitGetPropertyInfoProc = function(param1: Pointer;
    param2: AudioUnitPropertyID; param3: AudioUnitScope;
    param4: AudioUnitElement; param5: PLongWord; param6: PBoolean)
    : OSStatus; cdecl;
  PAudioUnitGetPropertyInfoProc = ^AudioUnitGetPropertyInfoProc;
  AudioUnitGetPropertyProc = function(param1: Pointer;
    param2: AudioUnitPropertyID; param3: AudioUnitScope;
    param4: AudioUnitElement; param5: Pointer; param6: PLongWord)
    : OSStatus; cdecl;
  PAudioUnitGetPropertyProc = ^AudioUnitGetPropertyProc;
  AudioUnitSetPropertyProc = function(param1: Pointer;
    param2: AudioUnitPropertyID; param3: AudioUnitScope;
    param4: AudioUnitElement; param5: Pointer; param6: UInt32): OSStatus; cdecl;
  PAudioUnitSetPropertyProc = ^AudioUnitSetPropertyProc;
  AudioUnitAddPropertyListenerProc = function(param1: Pointer;
    param2: AudioUnitPropertyID; param3: AudioUnitPropertyListenerProc;
    param4: Pointer): OSStatus; cdecl;
  PAudioUnitAddPropertyListenerProc = ^AudioUnitAddPropertyListenerProc;
  AudioUnitRemovePropertyListenerProc = function(param1: Pointer;
    param2: AudioUnitPropertyID; param3: AudioUnitPropertyListenerProc)
    : OSStatus; cdecl;
  PAudioUnitRemovePropertyListenerProc = ^AudioUnitRemovePropertyListenerProc;
  AudioUnitRemovePropertyListenerWithUserDataProc = function(param1: Pointer;
    param2: AudioUnitPropertyID; param3: AudioUnitPropertyListenerProc;
    param4: Pointer): OSStatus; cdecl;
  PAudioUnitRemovePropertyListenerWithUserDataProc = ^
    AudioUnitRemovePropertyListenerWithUserDataProc;
  AudioUnitAddRenderNotifyProc = function(param1: Pointer;
    param2: AURenderCallback; param3: Pointer): OSStatus; cdecl;
  PAudioUnitAddRenderNotifyProc = ^AudioUnitAddRenderNotifyProc;
  AudioUnitRemoveRenderNotifyProc = function(param1: Pointer;
    param2: AURenderCallback; param3: Pointer): OSStatus; cdecl;
  PAudioUnitRemoveRenderNotifyProc = ^AudioUnitRemoveRenderNotifyProc;
  AudioUnitScheduleParametersProc = function(param1: Pointer;
    param2: PAudioUnitParameterEvent; param3: UInt32): OSStatus; cdecl;
  PAudioUnitScheduleParametersProc = ^AudioUnitScheduleParametersProc;
  AudioUnitResetProc = function(param1: Pointer; param2: AudioUnitScope;
    param3: AudioUnitElement): OSStatus; cdecl;
  PAudioUnitResetProc = ^AudioUnitResetProc;
  AudioUnitComplexRenderProc = function(param1: Pointer;
    param2: PAudioUnitRenderActionFlags; param3: PInteger; param4: UInt32;
    param5: UInt32; param6: PLongWord; param7: PInteger; param8: PInteger;
    param9: Pointer; param10: PLongWord): OSStatus; cdecl;
  PAudioUnitComplexRenderProc = ^AudioUnitComplexRenderProc;
  AudioUnitProcessProc = function(param1: Pointer;
    param2: PAudioUnitRenderActionFlags; param3: PInteger; param4: UInt32;
    param5: PInteger): OSStatus; cdecl;
  PAudioUnitProcessProc = ^AudioUnitProcessProc;
  AudioUnitProcessMultipleProc = function(param1: Pointer;
    param2: PAudioUnitRenderActionFlags; param3: PInteger; param4: UInt32;
    param5: UInt32; param6: PInteger; param7: UInt32; param8: PInteger)
    : OSStatus; cdecl;
  PAudioUnitProcessMultipleProc = ^AudioUnitProcessMultipleProc;
  AudioUnitGetParameterProc = function(param1: Pointer;
    param2: AudioUnitParameterID; param3: AudioUnitScope;
    param4: AudioUnitElement; param5: PAudioUnitParameterValue)
    : OSStatus; cdecl;
  PAudioUnitGetParameterProc = ^AudioUnitGetParameterProc;
  AudioUnitSetParameterProc = function(param1: Pointer;
    param2: AudioUnitParameterID; param3: AudioUnitScope;
    param4: AudioUnitElement; param5: AudioUnitParameterValue; param6: UInt32)
    : OSStatus; cdecl;
  PAudioUnitSetParameterProc = ^AudioUnitSetParameterProc;
  AudioUnitRenderProc = function(param1: Pointer;
    param2: PAudioUnitRenderActionFlags; param3: PInteger; param4: UInt32;
    param5: UInt32; param6: PInteger): OSStatus; cdecl;
  PAudioUnitRenderProc = ^AudioUnitRenderProc;

  AudioUnitConnection = record
    sourceAudioUnit: AudioUnit;
    sourceOutputNumber: UInt32;
    destInputNumber: UInt32;
  end;

  PAudioUnitConnection = ^AudioUnitConnection;

  AUChannelInfo = record
    inChannels: Int16;
    outChannels: Int16;
  end;

  PAUChannelInfo = ^AUChannelInfo;

  AudioUnitExternalBuffer = record
    buffer: PByte;
    size: UInt32;
  end;

  PAudioUnitExternalBuffer = ^AudioUnitExternalBuffer;

  AURenderCallbackStruct = record
    inputProc: AURenderCallback;
    inputProcRefCon: Pointer;
  end;

  PAURenderCallbackStruct = ^AURenderCallbackStruct;

  AUPreset = record
    presetNumber: Int32;
    presetName: CFStringRef;
  end;

  PAUPreset = ^AUPreset;

  AudioUnitFrequencyResponseBin = record
    mFrequency: Double;
    mMagnitude: Double;
  end;

  PAudioUnitFrequencyResponseBin = ^AudioUnitFrequencyResponseBin;

  HostCallback_GetBeatAndTempo = function(param1: Pointer; param2: PDouble;
    param3: PDouble): OSStatus; cdecl;
  PHostCallback_GetBeatAndTempo = ^HostCallback_GetBeatAndTempo;
  HostCallback_GetMusicalTimeLocation = function(param1: Pointer;
    param2: PLongWord; param3: PSingle; param4: PLongWord; param5: PDouble)
    : OSStatus; cdecl;
  PHostCallback_GetMusicalTimeLocation = ^HostCallback_GetMusicalTimeLocation;
  HostCallback_GetTransportState = function(param1: Pointer; param2: PBoolean;
    param3: PBoolean; param4: PDouble; param5: PBoolean; param6: PDouble;
    param7: PDouble): OSStatus; cdecl;
  PHostCallback_GetTransportState = ^HostCallback_GetTransportState;
  HostCallback_GetTransportState2 = function(param1: Pointer; param2: PBoolean;
    param3: PBoolean; param4: PBoolean; param5: PDouble; param6: PBoolean;
    param7: PDouble; param8: PDouble): OSStatus; cdecl;
  PHostCallback_GetTransportState2 = ^HostCallback_GetTransportState2;

  HostCallbackInfo = record
    hostUserData: Pointer;
    beatAndTempoProc: HostCallback_GetBeatAndTempo;
    musicalTimeLocationProc: HostCallback_GetMusicalTimeLocation;
    transportStateProc: HostCallback_GetTransportState;
    transportStateProc2: HostCallback_GetTransportState2;
  end;

  PHostCallbackInfo = ^HostCallbackInfo;

  AUDependentParameter = record
    mScope: AudioUnitScope;
    mParameterID: AudioUnitParameterID;
  end;

  PAUDependentParameter = ^AUDependentParameter;

  AUMIDIOutputCallback = function(param1: Pointer; param2: PInteger;
    param3: UInt32; param4: Pointer): OSStatus; cdecl;
  PAUMIDIOutputCallback = ^AUMIDIOutputCallback;

  AUMIDIOutputCallbackStruct = record
    midiOutputCallback: AUMIDIOutputCallback;
    userData: Pointer;
  end;

  PAUMIDIOutputCallbackStruct = ^AUMIDIOutputCallbackStruct;

  AUInputSamplesInOutputCallbackStruct = record
    inputToOutputCallback: AUInputSamplesInOutputCallback;
    userData: Pointer;
  end;

  PAUInputSamplesInOutputCallbackStruct = ^AUInputSamplesInOutputCallbackStruct;

  AudioUnitParameterHistoryInfo = record
    updatesPerSecond: Single;
    historyDurationInSeconds: Single;
  end;

  PAudioUnitParameterHistoryInfo = ^AudioUnitParameterHistoryInfo;

  os_workgroup_t = Pointer;
  Pos_workgroup_t = ^os_workgroup_t;

  AudioUnitRenderContext = record
    workgroup: os_workgroup_t;
    reserved: array [0 .. 5] of LongWord;
  end;

  PAudioUnitRenderContext = ^AudioUnitRenderContext;

  AURenderContextObserver = procedure(param1: PAudioUnitRenderContext)
    of object;
  AUEventSampleTime = Int64;
  PAUEventSampleTime = ^AUEventSampleTime;
  AUMIDIEventListBlock = function(param1: AUEventSampleTime; param2: Byte;
    param3: Pointer): OSStatus; cdecl;
  AudioUnitParameterUnit = UInt32;
  AudioUnitParameterOptions = UInt32;

  AudioUnitParameterInfo = record
    name: array [0 .. 51] of Byte;
    unitName: CFStringRef;
    clumpID: UInt32;
    cfNameString: CFStringRef;
    &unit: AudioUnitParameterUnit;
    minValue: AudioUnitParameterValue;
    maxValue: AudioUnitParameterValue;
    defaultValue: AudioUnitParameterValue;
    flags: AudioUnitParameterOptions;
  end;

  PAudioUnitParameterInfo = ^AudioUnitParameterInfo;

  AudioUnitParameterNameInfo = record
    inID: AudioUnitParameterID;
    inDesiredLength: Int32;
    outName: CFStringRef;
  end;

  PAudioUnitParameterNameInfo = ^AudioUnitParameterNameInfo;

  AudioUnitParameterIDName = AudioUnitParameterNameInfo;
  PAudioUnitParameterIDName = ^AudioUnitParameterIDName;

  AudioUnitParameterStringFromValue = record
    inParamID: AudioUnitParameterID;
    inValue: PAudioUnitParameterValue;
    outString: CFStringRef;
  end;

  PAudioUnitParameterStringFromValue = ^AudioUnitParameterStringFromValue;

  AudioUnitParameterValueFromString = record
    inParamID: AudioUnitParameterID;
    inString: CFStringRef;
    outValue: AudioUnitParameterValue;
  end;

  PAudioUnitParameterValueFromString = ^AudioUnitParameterValueFromString;

  AudioUnitRemoteControlEvent = UInt32;
  AudioUnitRemoteControlEventListener = procedure
    (param1: AudioUnitRemoteControlEvent) of object;
  TAudioToolboxMIDIEventProc = procedure(param1: Pointer; param2: UInt32;
    param3: UInt32; param4: UInt32; param5: UInt32); cdecl;
  TAudioToolboxMIDISysExProc = procedure(param1: Pointer; param2: PByte;
    param3: UInt32); cdecl;

  AudioOutputUnitMIDICallbacks = record
    userData: Pointer;
    MIDIEventProc: TAudioToolboxMIDIEventProc;
    MIDISysExProc: TAudioToolboxMIDISysExProc;
  end;

  PAudioOutputUnitMIDICallbacks = ^AudioOutputUnitMIDICallbacks;

  AudioOutputUnitStartAtTimeParams = record
    mTimestamp: Integer;
    mFlags: UInt32;
  end;

  PAudioOutputUnitStartAtTimeParams = ^AudioOutputUnitStartAtTimeParams;

  AUVoiceIOSpeechActivityEvent = UInt32;
  AUVoiceIOMutedSpeechActivityEventListener = procedure
    (param1: AUVoiceIOSpeechActivityEvent) of object;

  AudioUnitMeterClipping = record
    peakValueSinceLastCall: Single;
    sawInfinity: Boolean;
    sawNotANumber: Boolean;
  end;

  PAudioUnitMeterClipping = ^AudioUnitMeterClipping;

  AUSpatializationAlgorithm = UInt32;
  AUSpatialMixerSourceMode = UInt32;
  AUReverbRoomType = UInt32;
  AUSpatialMixerAttenuationCurve = UInt32;

  MixerDistanceParams = record
    mReferenceDistance: Single;
    mMaxDistance: Single;
    mMaxAttenuation: Single;
  end;

  PMixerDistanceParams = ^MixerDistanceParams;

  AUSpatialMixerRenderingFlags = UInt32;
  AUSpatialMixerPersonalizedHRTFMode = UInt32;
  AUSpatialMixerOutputType = UInt32;
  AUSpatialMixerPointSourceInHeadMode = UInt32;
  AU3DMixerRenderingFlags = UInt32;
  AU3DMixerAttenuationCurve = UInt32;
  AUScheduledAudioSliceFlags = UInt32;
  ScheduledAudioSliceCompletionProc = procedure(param1: Pointer;
    param2: Pointer); cdecl;
  PScheduledAudioSliceCompletionProc = ^ScheduledAudioSliceCompletionProc;

  ScheduledAudioSlice = record
    mTimestamp: Integer;
    mCompletionProc: ScheduledAudioSliceCompletionProc;
    mCompletionProcUserData: Pointer;
    mFlags: AUScheduledAudioSliceFlags;
    mReserved: UInt32;
    mReserved2: Pointer;
    mNumberFrames: UInt32;
    mBufferList: PInteger;
  end;

  PScheduledAudioSlice = ^ScheduledAudioSlice;

  ScheduledAudioFileRegionCompletionProc = procedure(param1: Pointer;
    param2: Pointer; param3: OSStatus); cdecl;
  PScheduledAudioFileRegionCompletionProc = ^
    ScheduledAudioFileRegionCompletionProc;

  ScheduledAudioFileRegion = record
    mTimestamp: Integer;
    mCompletionProc: ScheduledAudioFileRegionCompletionProc;
    mCompletionProcUserData: Pointer;
    mAudioFile: Pointer;
    mLoopCount: UInt32;
    mStartFrame: Int64;
    mFramesToPlay: UInt32;
  end;

  PScheduledAudioFileRegion = ^ScheduledAudioFileRegion;

  CFURLRef = Pointer;
  PCFURLRef = ^CFURLRef;

  AUSamplerInstrumentData = record
    fileURL: CFURLRef;
    instrumentType: Byte;
    bankMSB: Byte;
    bankLSB: Byte;
    presetID: Byte;
  end;

  PAUSamplerInstrumentData = ^AUSamplerInstrumentData;

  AUSamplerBankPresetData = record
    bankURL: CFURLRef;
    bankMSB: Byte;
    bankLSB: Byte;
    presetID: Byte;
    reserved: Byte;
  end;

  PAUSamplerBankPresetData = ^AUSamplerBankPresetData;

  AUValue = Single;
  PAUValue = ^AUValue;

  AUParameterAddress = UInt64;
  PAUParameterAddress = ^AUParameterAddress;
  AUParameterAutomationEventType = LongWord;

  AURecordedParameterEvent = record
    hostTime: UInt64;
    address: AUParameterAddress;
    value: AUValue;
  end;

  PAURecordedParameterEvent = ^AURecordedParameterEvent;

  AUParameterAutomationEvent = record
    hostTime: UInt64;
    address: AUParameterAddress;
    value: AUValue;
    eventType: AUParameterAutomationEventType;
    reserved: UInt64;
  end;

  PAUParameterAutomationEvent = ^AUParameterAutomationEvent;

  AUParameterObserver = procedure(param1: AUParameterAddress; param2: AUValue)
    of object;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  AUParameterRecordingObserver = procedure(param1: NSInteger;
    param2: PAURecordedParameterEvent) of object;
  AUParameterAutomationObserver = procedure(param1: NSInteger;
    param2: PAUParameterAutomationEvent) of object;
  AUParameterObserverToken = Pointer;
  PAUParameterObserverToken = ^AUParameterObserverToken;
  MIDIChannelNumber = Byte;
  PMIDIChannelNumber = ^MIDIChannelNumber;
  AUAudioUnitStatus = OSStatus;
  PAUAudioUnitStatus = ^AUAudioUnitStatus;
  AUAudioFrameCount = LongWord;
  PAUAudioFrameCount = ^AUAudioFrameCount;
  AUAudioChannelCount = LongWord;
  PAUAudioChannelCount = ^AUAudioChannelCount;
  AUAudioUnitBusType = NSInteger;
  AURenderPullInputBlock = function(param1: PAudioUnitRenderActionFlags;
    param2: PInteger; param3: AUAudioFrameCount; param4: NSInteger;
    param5: PInteger): AUAudioUnitStatus; cdecl;
  AURenderBlock = function(param1: PAudioUnitRenderActionFlags;
    param2: PInteger; param3: AUAudioFrameCount; param4: NSInteger;
    param5: PInteger; param6: AURenderPullInputBlock): AUAudioUnitStatus; cdecl;
  AURenderObserver = procedure(param1: AudioUnitRenderActionFlags;
    param2: PInteger; param3: AUAudioFrameCount; param4: NSInteger) of object;
  AUScheduleParameterBlock = procedure(param1: AUEventSampleTime;
    param2: AUAudioFrameCount; param3: AUParameterAddress; param4: AUValue)
    of object;
  AUScheduleMIDIEventBlock = procedure(param1: AUEventSampleTime; param2: Byte;
    param3: NSInteger; param4: PByte) of object;
  AUMIDIOutputEventBlock = function(param1: AUEventSampleTime; param2: Byte;
    param3: NSInteger; param4: PByte): OSStatus; cdecl;
  AUHostMusicalContextBlock = function(param1: PDouble; param2: PDouble;
    param3: PNSInteger; param4: PDouble; param5: PNSInteger; param6: PDouble)
    : Boolean; cdecl;
  AUMIDICIProfileChangedBlock = procedure(param1: Byte;
    param2: MIDIChannelNumber; param3: MIDICIProfile; param4: Boolean)
    of object;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  AUHostTransportStateFlags = NSUInteger;
  AUHostTransportStateBlock = function(param1: PAUHostTransportStateFlags;
    param2: PDouble; param3: PDouble; param4: PDouble): Boolean; cdecl;
  TAudioToolboxCompletionHandler = procedure(param1: AUAudioUnit;
    param2: NSError) of object;
  MIDIProtocolID = Int32;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  AUInputHandler = procedure(param1: PAudioUnitRenderActionFlags;
    param2: PInteger; param3: AUAudioFrameCount; param4: NSInteger) of object;
  NSKeyValueObservingOptions = NSUInteger;
  CallHostBlock = function(param1: NSDictionary): NSDictionary; cdecl;
  AURenderEventType = Byte;

  AURenderEventHeader = record
    next: Pointer;
    eventSampleTime: AUEventSampleTime;
    eventType: AURenderEventType;
    reserved: Byte;
  end;

  PAURenderEventHeader = ^AURenderEventHeader;

  AUParameterEvent = record
    next: Pointer;
    eventSampleTime: AUEventSampleTime;
    eventType: AURenderEventType;
    reserved: array [0 .. 2] of Byte;
    rampDurationSampleFrames: AUAudioFrameCount;
    parameterAddress: AUParameterAddress;
    value: AUValue;
  end;

  PAUParameterEvent = ^AUParameterEvent;

  AUMIDIEvent = record
    next: Pointer;
    eventSampleTime: AUEventSampleTime;
    eventType: AURenderEventType;
    reserved: Byte;
    length: Word;
    cable: Byte;
    data: array [0 .. 2] of Byte;
  end;

  PAUMIDIEvent = ^AUMIDIEvent;

  MIDITimeStamp = UInt64;
  PMIDITimeStamp = ^MIDITimeStamp;

  MIDIEventPacket = record
    timeStamp: MIDITimeStamp;
    wordCount: UInt32;
    words: array [0 .. 63] of UInt32;
  end;

  PMIDIEventPacket = ^MIDIEventPacket;

  MIDIEventList = record
    protocol: MIDIProtocolID;
    numPackets: UInt32;
    packet: array [0 .. 0] of MIDIEventPacket;
  end;

  PMIDIEventList = ^MIDIEventList;

  AUMIDIEventList = record
    next: Pointer;
    eventSampleTime: AUEventSampleTime;
    eventType: AURenderEventType;
    reserved: Byte;
    cable: Byte;
    eventList: MIDIEventList;
  end;

  PAUMIDIEventList = ^AUMIDIEventList;

  AURenderEvent = record
    case Integer of
      0:
        (head: AURenderEventHeader);
      1:
        (parameter: AUParameterEvent);
      2:
        (MIDI: AUMIDIEvent);
      3:
        (MIDIEventsList: AUMIDIEventList);
  end;

  PAURenderEvent = ^AURenderEvent;

  AUInternalRenderBlock = function(param1: PAudioUnitRenderActionFlags;
    param2: PInteger; param3: AUAudioFrameCount; param4: NSInteger;
    param5: PInteger; param6: PAURenderEvent; param7: AURenderPullInputBlock)
    : AUAudioUnitStatus; cdecl;
  AUImplementorValueObserver = procedure(param1: AUParameter; param2: AUValue)
    of object;
  AUImplementorValueProvider = function(param1: AUParameter): AUValue; cdecl;
  AUImplementorStringFromValueCallback = function(param1: AUParameter;
    param2: PAUValue): NSString; cdecl;
  AUImplementorValueFromStringCallback = function(param1: AUParameter;
    param2: NSString): AUValue; cdecl;
  AUImplementorDisplayNameWithLengthCallback = function(param1: AUParameterNode;
    param2: NSInteger): NSString; cdecl;
  AudioCodec = AudioComponentInstance;
  PAudioCodec = ^AudioCodec;
  AudioCodecPropertyID = UInt32;
  PAudioCodecPropertyID = ^AudioCodecPropertyID;

  AudioCodecMagicCookieInfo = record
    mMagicCookieSize: UInt32;
    mMagicCookie: Pointer;
  end;

  PAudioCodecMagicCookieInfo = ^AudioCodecMagicCookieInfo;

  AudioCodecPrimeInfo = record
    leadingFrames: UInt32;
    trailingFrames: UInt32;
  end;

  PAudioCodecPrimeInfo = ^AudioCodecPrimeInfo;

  AudioSettingsFlags = UInt32;
  AudioCodecGetPropertyInfoProc = function(param1: Pointer;
    param2: AudioCodecPropertyID; param3: PLongWord; param4: PBoolean)
    : OSStatus; cdecl;
  PAudioCodecGetPropertyInfoProc = ^AudioCodecGetPropertyInfoProc;
  AudioCodecGetPropertyProc = function(param1: Pointer;
    param2: AudioCodecPropertyID; param3: PLongWord; param4: Pointer)
    : OSStatus; cdecl;
  PAudioCodecGetPropertyProc = ^AudioCodecGetPropertyProc;
  AudioCodecSetPropertyProc = function(param1: Pointer;
    param2: AudioCodecPropertyID; param3: UInt32; param4: Pointer)
    : OSStatus; cdecl;
  PAudioCodecSetPropertyProc = ^AudioCodecSetPropertyProc;
  AudioCodecInitializeProc = function(param1: Pointer; param2: PInteger;
    param3: PInteger; param4: Pointer; param5: UInt32): OSStatus; cdecl;
  PAudioCodecInitializeProc = ^AudioCodecInitializeProc;
  AudioCodecUninitializeProc = function(param1: Pointer): OSStatus; cdecl;
  PAudioCodecUninitializeProc = ^AudioCodecUninitializeProc;
  AudioCodecAppendInputDataProc = function(param1: Pointer; param2: Pointer;
    param3: PLongWord; param4: PLongWord; param5: PInteger): OSStatus; cdecl;
  PAudioCodecAppendInputDataProc = ^AudioCodecAppendInputDataProc;
  AudioCodecProduceOutputPacketsProc = function(param1: Pointer;
    param2: Pointer; param3: PLongWord; param4: PLongWord; param5: PInteger;
    param6: PLongWord): OSStatus; cdecl;
  PAudioCodecProduceOutputPacketsProc = ^AudioCodecProduceOutputPacketsProc;
  AudioCodecResetProc = function(param1: Pointer): OSStatus; cdecl;
  PAudioCodecResetProc = ^AudioCodecResetProc;
  AudioCodecAppendInputBufferListProc = function(param1: Pointer;
    param2: PInteger; param3: PLongWord; param4: PInteger; param5: PLongWord)
    : OSStatus; cdecl;
  PAudioCodecAppendInputBufferListProc = ^AudioCodecAppendInputBufferListProc;
  AudioCodecProduceOutputBufferListProc = function(param1: Pointer;
    param2: PInteger; param3: PLongWord; param4: PInteger; param5: PLongWord)
    : OSStatus; cdecl;
  PAudioCodecProduceOutputBufferListProc = ^
    AudioCodecProduceOutputBufferListProc;
  MagicCookieInfo = AudioCodecMagicCookieInfo;
  PMagicCookieInfo = ^MagicCookieInfo;

  AudioConverterRef = Pointer;
  PAudioConverterRef = ^AudioConverterRef;
  AudioConverterPropertyID = UInt32;
  PAudioConverterPropertyID = ^AudioConverterPropertyID;

  AudioConverterPrimeInfo = record
    leadingFrames: UInt32;
    trailingFrames: UInt32;
  end;

  PAudioConverterPrimeInfo = ^AudioConverterPrimeInfo;

  AudioConverterComplexInputDataProc = function(param1: AudioConverterRef;
    param2: PLongWord; param3: PInteger; param4: PInteger; param5: Pointer)
    : OSStatus; cdecl;
  PAudioConverterComplexInputDataProc = ^AudioConverterComplexInputDataProc;
  AudioConverterInputDataProc = function(param1: AudioConverterRef;
    param2: PLongWord; param3: Pointer; param4: Pointer): OSStatus; cdecl;
  PAudioConverterInputDataProc = ^AudioConverterInputDataProc;
  AudioFileTypeID = UInt32;
  PAudioFileTypeID = ^AudioFileTypeID;
  AudioFileFlags = UInt32;
  AudioFilePermissions = Int8;
  AudioFileID = Pointer;
  PAudioFileID = ^AudioFileID;
  AudioFilePropertyID = UInt32;
  PAudioFilePropertyID = ^AudioFilePropertyID;

  AudioFile_SMPTE_Time = record
    mHours: Int8;
    mMinutes: Byte;
    mSeconds: Byte;
    mFrames: Byte;
    mSubFrameSampleOffset: UInt32;
  end;

  PAudioFile_SMPTE_Time = ^AudioFile_SMPTE_Time;

  AudioFileMarker = record
    mFramePosition: Double;
    mName: CFStringRef;
    mMarkerID: Int32;
    mSMPTETime: AudioFile_SMPTE_Time;
    mType: UInt32;
    mReserved: UInt16;
    mChannel: UInt16;
  end;

  PAudioFileMarker = ^AudioFileMarker;

  AudioFileMarkerList = record
    mSMPTE_TimeType: UInt32;
    mNumberMarkers: UInt32;
    mMarkers: array [0 .. 0] of AudioFileMarker;
  end;

  PAudioFileMarkerList = ^AudioFileMarkerList;

  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  AudioFileRegionFlags = UInt32;

  AudioFileRegion = record
    mRegionID: UInt32;
    mName: CFStringRef;
    mFlags: AudioFileRegionFlags;
    mNumberMarkers: UInt32;
    mMarkers: array [0 .. 0] of AudioFileMarker;
  end;

  PAudioFileRegion = ^AudioFileRegion;

  AudioFileRegionList = record
    mSMPTE_TimeType: UInt32;
    mNumberRegions: UInt32;
    mRegions: array [0 .. 0] of AudioFileRegion;
  end;

  PAudioFileRegionList = ^AudioFileRegionList;

  AudioFramePacketTranslation = record
    mFrame: Int64;
    mPacket: Int64;
    mFrameOffsetInPacket: UInt32;
  end;

  PAudioFramePacketTranslation = ^AudioFramePacketTranslation;

  AudioBytePacketTranslationFlags = UInt32;

  AudioBytePacketTranslation = record
    mByte: Int64;
    mPacket: Int64;
    mByteOffsetInPacket: UInt32;
    mFlags: AudioBytePacketTranslationFlags;
  end;

  PAudioBytePacketTranslation = ^AudioBytePacketTranslation;

  AudioFilePacketTableInfo = record
    mNumberValidFrames: Int64;
    mPrimingFrames: Int32;
    mRemainderFrames: Int32;
  end;

  PAudioFilePacketTableInfo = ^AudioFilePacketTableInfo;

  AudioPacketRangeByteCountTranslation = record
    mPacket: Int64;
    mPacketCount: Int64;
    mByteCountUpperBound: Int64;
  end;

  PAudioPacketRangeByteCountTranslation = ^AudioPacketRangeByteCountTranslation;

  AudioPacketRollDistanceTranslation = record
    mPacket: Int64;
    mRollDistance: Int64;
  end;

  PAudioPacketRollDistanceTranslation = ^AudioPacketRollDistanceTranslation;

  AudioIndependentPacketTranslation = record
    mPacket: Int64;
    mIndependentlyDecodablePacket: Int64;
  end;

  PAudioIndependentPacketTranslation = ^AudioIndependentPacketTranslation;

  AudioPacketDependencyInfoTranslation = record
    mPacket: Int64;
    mIsIndependentlyDecodable: UInt32;
    mNumberPrerollPackets: UInt32;
  end;

  PAudioPacketDependencyInfoTranslation = ^AudioPacketDependencyInfoTranslation;

  AudioFile_ReadProc = function(param1: Pointer; param2: Int64; param3: UInt32;
    param4: Pointer; param5: PLongWord): OSStatus; cdecl;
  PAudioFile_ReadProc = ^AudioFile_ReadProc;
  AudioFile_WriteProc = function(param1: Pointer; param2: Int64; param3: UInt32;
    param4: Pointer; param5: PLongWord): OSStatus; cdecl;
  PAudioFile_WriteProc = ^AudioFile_WriteProc;
  AudioFile_GetSizeProc = function(param1: Pointer): Int64; cdecl;
  PAudioFile_GetSizeProc = ^AudioFile_GetSizeProc;
  AudioFile_SetSizeProc = function(param1: Pointer; param2: Int64)
    : OSStatus; cdecl;
  PAudioFile_SetSizeProc = ^AudioFile_SetSizeProc;

  AudioFileTypeAndFormatID = record
    mFileType: AudioFileTypeID;
    mFormatID: UInt32;
  end;

  PAudioFileTypeAndFormatID = ^AudioFileTypeAndFormatID;

  AudioFileStreamPropertyFlags = UInt32;
  AudioFileStreamParseFlags = UInt32;
  AudioFileStreamSeekFlags = UInt32;
  AudioFileStreamPropertyID = UInt32;
  PAudioFileStreamPropertyID = ^AudioFileStreamPropertyID;
  AudioFileStreamID = Pointer;
  PAudioFileStreamID = ^AudioFileStreamID;
  AudioFileStream_PropertyListenerProc = procedure(param1: Pointer;
    param2: AudioFileStreamID; param3: AudioFileStreamPropertyID;
    param4: PAudioFileStreamPropertyFlags); cdecl;
  PAudioFileStream_PropertyListenerProc = ^AudioFileStream_PropertyListenerProc;
  AudioFileStream_PacketsProc = procedure(param1: Pointer; param2: UInt32;
    param3: UInt32; param4: Pointer; param5: PInteger); cdecl;
  PAudioFileStream_PacketsProc = ^AudioFileStream_PacketsProc;
  AudioFormatPropertyID = UInt32;
  PAudioFormatPropertyID = ^AudioFormatPropertyID;
  AudioPanningMode = UInt32;

  AudioPanningInfo = record
    mPanningMode: AudioPanningMode;
    mCoordinateFlags: UInt32;
    mCoordinates: array [0 .. 2] of Single;
    mGainScale: Single;
    mOutputChannelMap: PInteger;
  end;

  PAudioPanningInfo = ^AudioPanningInfo;

  AudioBalanceFadeType = UInt32;

  AudioBalanceFade = record
    mLeftRightBalance: Single;
    mBackFrontFade: Single;
    mType: AudioBalanceFadeType;
    mChannelLayout: PInteger;
  end;

  PAudioBalanceFade = ^AudioBalanceFade;

  AudioFormatInfo = record
    mASBD: Integer;
    mMagicCookie: Pointer;
    mMagicCookieSize: UInt32;
  end;

  PAudioFormatInfo = ^AudioFormatInfo;

  ExtendedAudioFormatInfo = record
    mASBD: Integer;
    mMagicCookie: Pointer;
    mMagicCookieSize: UInt32;
    mClassDescription: Integer;
  end;

  PExtendedAudioFormatInfo = ^ExtendedAudioFormatInfo;

  AudioOutputUnitStartProc = function(param1: Pointer): OSStatus; cdecl;
  PAudioOutputUnitStartProc = ^AudioOutputUnitStartProc;
  AudioOutputUnitStopProc = function(param1: Pointer): OSStatus; cdecl;
  PAudioOutputUnitStopProc = ^AudioOutputUnitStopProc;
  AudioQueuePropertyID = UInt32;
  PAudioQueuePropertyID = ^AudioQueuePropertyID;
  AudioQueueParameterID = UInt32;
  PAudioQueueParameterID = ^AudioQueueParameterID;
  AudioQueueParameterValue = Single;
  PAudioQueueParameterValue = ^AudioQueueParameterValue;
  AudioQueueRef = Pointer;
  PAudioQueueRef = ^AudioQueueRef;
  AudioQueueTimelineRef = Pointer;
  PAudioQueueTimelineRef = ^AudioQueueTimelineRef;
  AudioQueueProcessingTapFlags = UInt32;

  AudioQueueBuffer = record
    mAudioDataBytesCapacity: UInt32;
    mAudioData: Pointer;
    mAudioDataByteSize: UInt32;
    mUserData: Pointer;
    mPacketDescriptionCapacity: UInt32;
    mPacketDescriptions: PInteger;
    mPacketDescriptionCount: UInt32;
  end;

  PAudioQueueBuffer = ^AudioQueueBuffer;

  AudioQueueBufferRef = PAudioQueueBuffer;
  PAudioQueueBufferRef = ^AudioQueueBufferRef;

  AudioQueueParameterEvent = record
    mID: AudioQueueParameterID;
    mValue: AudioQueueParameterValue;
  end;

  PAudioQueueParameterEvent = ^AudioQueueParameterEvent;

  AudioQueueLevelMeterState = record
    mAveragePower: Single;
    mPeakPower: Single;
  end;

  PAudioQueueLevelMeterState = ^AudioQueueLevelMeterState;

  AudioQueueProcessingTapRef = Pointer;
  PAudioQueueProcessingTapRef = ^AudioQueueProcessingTapRef;

  AudioQueueChannelAssignment = record
    mDeviceUID: CFStringRef;
    mChannelNumber: UInt32;
  end;

  PAudioQueueChannelAssignment = ^AudioQueueChannelAssignment;

  AudioQueueOutputCallbackBlock = procedure(param1: AudioQueueRef;
    param2: AudioQueueBufferRef) of object;
  AudioQueueInputCallbackBlock = procedure(param1: AudioQueueRef;
    param2: AudioQueueBufferRef; param3: PInteger; param4: UInt32;
    param5: PInteger) of object;
  AudioQueueOutputCallback = procedure(param1: Pointer; param2: AudioQueueRef;
    param3: AudioQueueBufferRef); cdecl;
  PAudioQueueOutputCallback = ^AudioQueueOutputCallback;
  AudioQueueInputCallback = procedure(param1: Pointer; param2: AudioQueueRef;
    param3: AudioQueueBufferRef; param4: PInteger; param5: UInt32;
    param6: PInteger); cdecl;
  PAudioQueueInputCallback = ^AudioQueueInputCallback;
  AudioQueuePropertyListenerProc = procedure(param1: Pointer;
    param2: AudioQueueRef; param3: AudioQueuePropertyID); cdecl;
  PAudioQueuePropertyListenerProc = ^AudioQueuePropertyListenerProc;
  AudioQueueProcessingTapCallback = procedure(param1: Pointer;
    param2: AudioQueueProcessingTapRef; param3: UInt32; param4: PInteger;
    param5: PAudioQueueProcessingTapFlags; param6: PLongWord;
    param7: PInteger); cdecl;
  PAudioQueueProcessingTapCallback = ^AudioQueueProcessingTapCallback;
  CFRunLoopRef = Pointer;
  PCFRunLoopRef = ^CFRunLoopRef;
  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;
  AudioSessionPropertyID = UInt32;
  PAudioSessionPropertyID = ^AudioSessionPropertyID;
  AudioSessionInterruptionType = UInt32;
  PAudioSessionInterruptionType = ^AudioSessionInterruptionType;
  AudioSessionInterruptionListener = procedure(param1: Pointer;
    param2: UInt32); cdecl;
  PAudioSessionInterruptionListener = ^AudioSessionInterruptionListener;
  AudioSessionPropertyListener = procedure(param1: Pointer;
    param2: AudioSessionPropertyID; param3: UInt32; param4: Pointer); cdecl;
  PAudioSessionPropertyListener = ^AudioSessionPropertyListener;
  SystemSoundID = UInt32;
  PSystemSoundID = ^SystemSoundID;
  AudioServicesPropertyID = UInt32;
  PAudioServicesPropertyID = ^AudioServicesPropertyID;
  AudioServicesSystemSoundCompletionProc = procedure(param1: SystemSoundID;
    param2: Pointer); cdecl;
  PAudioServicesSystemSoundCompletionProc = ^
    AudioServicesSystemSoundCompletionProc;
  TAudioToolboxInCompletionBlock = procedure() of object;
  MusicDeviceInstrumentID = UInt32;
  PMusicDeviceInstrumentID = ^MusicDeviceInstrumentID;

  MusicDeviceStdNoteParams = record
    argCount: UInt32;
    mPitch: Single;
    mVelocity: Single;
  end;

  PMusicDeviceStdNoteParams = ^MusicDeviceStdNoteParams;

  NoteParamsControlValue = record
    mID: AudioUnitParameterID;
    mValue: AudioUnitParameterValue;
  end;

  PNoteParamsControlValue = ^NoteParamsControlValue;

  MusicDeviceNoteParams = record
    argCount: UInt32;
    mPitch: Single;
    mVelocity: Single;
    mControls: array [0 .. 0] of NoteParamsControlValue;
  end;

  PMusicDeviceNoteParams = ^MusicDeviceNoteParams;

  MusicDeviceGroupID = UInt32;
  PMusicDeviceGroupID = ^MusicDeviceGroupID;
  NoteInstanceID = UInt32;
  PNoteInstanceID = ^NoteInstanceID;
  MusicDeviceComponent = AudioComponentInstance;
  PMusicDeviceComponent = ^MusicDeviceComponent;
  MusicDeviceMIDIEventProc = function(param1: Pointer; param2: UInt32;
    param3: UInt32; param4: UInt32; param5: UInt32): OSStatus; cdecl;
  PMusicDeviceMIDIEventProc = ^MusicDeviceMIDIEventProc;
  MusicDeviceSysExProc = function(param1: Pointer; param2: PByte;
    param3: UInt32): OSStatus; cdecl;
  PMusicDeviceSysExProc = ^MusicDeviceSysExProc;
  MusicDeviceStartNoteProc = function(param1: Pointer;
    param2: MusicDeviceInstrumentID; param3: MusicDeviceGroupID;
    param4: PNoteInstanceID; param5: UInt32; param6: PMusicDeviceNoteParams)
    : OSStatus; cdecl;
  PMusicDeviceStartNoteProc = ^MusicDeviceStartNoteProc;
  MusicDeviceStopNoteProc = function(param1: Pointer;
    param2: MusicDeviceGroupID; param3: NoteInstanceID; param4: UInt32)
    : OSStatus; cdecl;
  PMusicDeviceStopNoteProc = ^MusicDeviceStopNoteProc;
  AUGraph = Pointer;
  PAUGraph = ^AUGraph;
  AUNode = Int32;
  PAUNode = ^AUNode;

  AudioUnitNodeConnection = record
    sourceNode: AUNode;
    sourceOutputNumber: UInt32;
    destNode: AUNode;
    destInputNumber: UInt32;
  end;

  PAudioUnitNodeConnection = ^AudioUnitNodeConnection;

  AUNodeConnection = AudioUnitNodeConnection;
  PAUNodeConnection = ^AUNodeConnection;

  AUNodeRenderCallback = record
    destNode: AUNode;
    destInputNumber: AudioUnitElement;
    cback: AURenderCallbackStruct;
  end;

  PAUNodeRenderCallback = ^AUNodeRenderCallback;

  AUNodeInteraction = record
    nodeInteractionType: UInt32;
    case Integer of
      0:
        (connection: AUNodeConnection);
      1:
        (inputCallback: AUNodeRenderCallback);

  end;

  PAUNodeInteraction = ^AUNodeInteraction;

  AudioUnitEventType = UInt32;
  AUParameterListenerRef = Pointer;
  PAUParameterListenerRef = ^AUParameterListenerRef;
  AUEventListenerRef = AUParameterListenerRef;
  PAUEventListenerRef = ^AUEventListenerRef;

  AudioUnitEvent = record
    mEventType: AudioUnitEventType;
    case Integer of
      0:
        (mParameter: AudioUnitParameter);
      1:
        (mProperty: AudioUnitProperty);

  end;

  PAudioUnitEvent = ^AudioUnitEvent;

  AUParameterListenerBlock = procedure(param1: Pointer;
    param2: PAudioUnitParameter; param3: AudioUnitParameterValue) of object;
  AUEventListenerBlock = procedure(param1: Pointer; param2: PAudioUnitEvent;
    param3: UInt64; param4: AudioUnitParameterValue) of object;
  AUParameterListenerProc = procedure(param1: Pointer; param2: Pointer;
    param3: PAudioUnitParameter; param4: AudioUnitParameterValue); cdecl;
  PAUParameterListenerProc = ^AUParameterListenerProc;
  AUEventListenerProc = procedure(param1: Pointer; param2: Pointer;
    param3: PAudioUnitEvent; param4: UInt64;
    param5: AudioUnitParameterValue); cdecl;
  PAUEventListenerProc = ^AUEventListenerProc;
  os_clockid_t = LongWord;
  os_workgroup_attr_t = Pointer;
  Pos_workgroup_attr_t = ^os_workgroup_attr_t;
  os_workgroup_interval_t = os_workgroup_t;
  Pos_workgroup_interval_t = ^os_workgroup_interval_t;

  CAFFileHeader = record
    mFileType: UInt32;
    mFileVersion: UInt16;
    mFileFlags: UInt16;
  end;

  PCAFFileHeader = ^CAFFileHeader;

  CAFChunkHeader = record
    mChunkType: UInt32;
    mChunkSize: Int64;
  end;

  PCAFChunkHeader = ^CAFChunkHeader;

  CAF_UUID_ChunkHeader = record
    mHeader: CAFChunkHeader;
    mUUID: array [0 .. 15] of Byte;
  end;

  PCAF_UUID_ChunkHeader = ^CAF_UUID_ChunkHeader;

  CAFFormatFlags = UInt32;

  CAFAudioDescription = record
    mSampleRate: Double;
    mFormatID: UInt32;
    mFormatFlags: CAFFormatFlags;
    mBytesPerPacket: UInt32;
    mFramesPerPacket: UInt32;
    mChannelsPerFrame: UInt32;
    mBitsPerChannel: UInt32;
  end;

  PCAFAudioDescription = ^CAFAudioDescription;

  CAFPacketTableHeader = record
    mNumberPackets: Int64;
    mNumberValidFrames: Int64;
    mPrimingFrames: Int32;
    mRemainderFrames: Int32;
    mPacketDescriptions: array [0 .. 0] of Byte;
  end;

  PCAFPacketTableHeader = ^CAFPacketTableHeader;

  CAFDataChunk = record
    mEditCount: UInt32;
    mData: array [0 .. 0] of Byte;
  end;

  PCAFDataChunk = ^CAFDataChunk;

  CAF_SMPTE_Time = record
    mHours: Int8;
    mMinutes: Int8;
    mSeconds: Int8;
    mFrames: Int8;
    mSubFrameSampleOffset: UInt32;
  end;

  PCAF_SMPTE_Time = ^CAF_SMPTE_Time;

  CAFMarker = record
    mType: UInt32;
    mFramePosition: Double;
    mMarkerID: UInt32;
    mSMPTETime: CAF_SMPTE_Time;
    mChannel: UInt32;
  end;

  PCAFMarker = ^CAFMarker;

  CAFMarkerChunk = record
    mSMPTE_TimeType: UInt32;
    mNumberMarkers: UInt32;
    mMarkers: array [0 .. 0] of CAFMarker;
  end;

  PCAFMarkerChunk = ^CAFMarkerChunk;

  CAFRegionFlags = UInt32;

  CAFRegion = record
    mRegionID: UInt32;
    mFlags: CAFRegionFlags;
    mNumberMarkers: UInt32;
    mMarkers: array [0 .. 0] of CAFMarker;
  end;

  PCAFRegion = ^CAFRegion;

  CAFRegionChunk = record
    mSMPTE_TimeType: UInt32;
    mNumberRegions: UInt32;
    mRegions: array [0 .. 0] of CAFRegion;
  end;

  PCAFRegionChunk = ^CAFRegionChunk;

  CAFInstrumentChunk = record
    mBaseNote: Single;
    mMIDILowNote: Byte;
    mMIDIHighNote: Byte;
    mMIDILowVelocity: Byte;
    mMIDIHighVelocity: Byte;
    mdBGain: Single;
    mStartRegionID: UInt32;
    mSustainRegionID: UInt32;
    mReleaseRegionID: UInt32;
    mInstrumentID: UInt32;
  end;

  PCAFInstrumentChunk = ^CAFInstrumentChunk;

  CAFStringID = record
    mStringID: UInt32;
    mStringStartByteOffset: Int64;
  end;

  PCAFStringID = ^CAFStringID;

  CAFStrings = record
    mNumEntries: UInt32;
    mStringsIDs: array [0 .. 0] of CAFStringID;
  end;

  PCAFStrings = ^CAFStrings;

  CAFInfoStrings = record
    mNumEntries: UInt32;
  end;

  PCAFInfoStrings = ^CAFInfoStrings;

  CAFPositionPeak = record
    mValue: Single;
    mFrameNumber: UInt64;
  end;

  PCAFPositionPeak = ^CAFPositionPeak;

  CAFPeakChunk = record
    mEditCount: UInt32;
    mPeaks: array [0 .. 0] of CAFPositionPeak;
  end;

  PCAFPeakChunk = ^CAFPeakChunk;

  CAFOverviewSample = record
    mMinValue: Int16;
    mMaxValue: Int16;
  end;

  PCAFOverviewSample = ^CAFOverviewSample;

  CAFOverviewChunk = record
    mEditCount: UInt32;
    mNumFramesPerOVWSample: UInt32;
    mData: array [0 .. 0] of CAFOverviewSample;
  end;

  PCAFOverviewChunk = ^CAFOverviewChunk;

  CAFUMIDChunk = record
    mBytes: array [0 .. 63] of Byte;
  end;

  PCAFUMIDChunk = ^CAFUMIDChunk;

  ExtAudioFileRef = Pointer;
  PExtAudioFileRef = ^ExtAudioFileRef;
  ExtAudioFilePacketTableInfoOverride = Int32;
  PExtAudioFilePacketTableInfoOverride = ^ExtAudioFilePacketTableInfoOverride;
  ExtAudioFilePropertyID = UInt32;
  PExtAudioFilePropertyID = ^ExtAudioFilePropertyID;
  MusicEventType = UInt32;
  PMusicEventType = ^MusicEventType;
  MusicSequenceLoadFlags = UInt32;
  MusicSequenceType = UInt32;
  MusicSequenceFileTypeID = UInt32;
  MusicSequenceFileFlags = UInt32;
  MusicTimeStamp = Double;
  PMusicTimeStamp = ^MusicTimeStamp;

  MIDINoteMessage = record
    channel: Byte;
    note: Byte;
    velocity: Byte;
    releaseVelocity: Byte;
    duration: Single;
  end;

  PMIDINoteMessage = ^MIDINoteMessage;

  MIDIChannelMessage = record
    status: Byte;
    data1: Byte;
    data2: Byte;
    reserved: Byte;
  end;

  PMIDIChannelMessage = ^MIDIChannelMessage;

  MIDIRawData = record
    length: UInt32;
    data: array [0 .. 0] of Byte;
  end;

  PMIDIRawData = ^MIDIRawData;

  MIDIMetaEvent = record
    metaEventType: Byte;
    unused1: Byte;
    unused2: Byte;
    unused3: Byte;
    dataLength: UInt32;
    data: array [0 .. 0] of Byte;
  end;

  PMIDIMetaEvent = ^MIDIMetaEvent;

  MusicEventUserData = record
    length: UInt32;
    data: array [0 .. 0] of Byte;
  end;

  PMusicEventUserData = ^MusicEventUserData;

  ExtendedNoteOnEvent = record
    instrumentID: MusicDeviceInstrumentID;
    groupID: MusicDeviceGroupID;
    duration: Single;
    extendedParams: MusicDeviceNoteParams;
  end;

  PExtendedNoteOnEvent = ^ExtendedNoteOnEvent;

  ParameterEvent = record
    parameterID: AudioUnitParameterID;
    scope: AudioUnitScope;
    element: AudioUnitElement;
    value: AudioUnitParameterValue;
  end;

  PParameterEvent = ^ParameterEvent;

  ExtendedTempoEvent = record
    bpm: Double;
  end;

  PExtendedTempoEvent = ^ExtendedTempoEvent;

  CFTypeRef = Pointer;
  PCFTypeRef = ^CFTypeRef;
  CFPropertyListRef = CFTypeRef;
  PCFPropertyListRef = ^CFPropertyListRef;

  AUPresetEvent = record
    scope: AudioUnitScope;
    element: AudioUnitElement;
    preset: CFPropertyListRef;
  end;

  PAUPresetEvent = ^AUPresetEvent;

  CABarBeatTime = record
    bar: Int32;
    beat: UInt16;
    subbeat: UInt16;
    subbeatDivisor: UInt16;
    reserved: UInt16;
  end;

  PCABarBeatTime = ^CABarBeatTime;

  MusicPlayer = Pointer;
  PMusicPlayer = ^MusicPlayer;
  MusicSequence = Pointer;
  PMusicSequence = ^MusicSequence;
  MusicTrack = Pointer;
  PMusicTrack = ^MusicTrack;
  MusicEventIterator = Pointer;
  PMusicEventIterator = ^MusicEventIterator;
  MusicSequenceUserCallback = procedure(param1: Pointer; param2: MusicSequence;
    param3: MusicTrack; param4: MusicTimeStamp; param5: PMusicEventUserData;
    param6: MusicTimeStamp; param7: MusicTimeStamp); cdecl;
  PMusicSequenceUserCallback = ^MusicSequenceUserCallback;

  MusicTrackLoopInfo = record
    loopDuration: MusicTimeStamp;
    numberOfLoops: Int32;
  end;

  PMusicTrackLoopInfo = ^MusicTrackLoopInfo;

  MIDIObjectRef = UInt32;
  PMIDIObjectRef = ^MIDIObjectRef;
  MIDIEndpointRef = MIDIObjectRef;
  PMIDIEndpointRef = ^MIDIEndpointRef;
  CFDataRef = Pointer;
  PCFDataRef = ^CFDataRef;
  SignedByte = Int8;
  PSignedByte = ^SignedByte;
  // ===== Interface declarations =====

  AUParameterNodeClass = interface(NSObjectClass)
    ['{64E8D4E1-B076-4079-B1DE-1053AD831079}']
  end;

  AUParameterNode = interface(NSObject)
    ['{D4CE7CD8-02AB-4318-9977-F24E9325698B}']
    function identifier: NSString; cdecl;
    function keyPath: NSString; cdecl;
    function displayName: NSString; cdecl;
    function displayNameWithLength(maximumLength: NSInteger): NSString; cdecl;
    function tokenByAddingParameterObserver(observer: AUParameterObserver)
      : AUParameterObserverToken; cdecl;
    function tokenByAddingParameterRecordingObserver
      (observer: AUParameterRecordingObserver): AUParameterObserverToken; cdecl;
    function tokenByAddingParameterAutomationObserver
      (observer: AUParameterAutomationObserver)
      : AUParameterObserverToken; cdecl;
    procedure removeParameterObserver(token: AUParameterObserverToken); cdecl;
    procedure setImplementorValueObserver(implementorValueObserver
      : AUImplementorValueObserver); cdecl;
    function implementorValueObserver: AUImplementorValueObserver; cdecl;
    procedure setImplementorValueProvider(implementorValueProvider
      : AUImplementorValueProvider); cdecl;
    function implementorValueProvider: AUImplementorValueProvider; cdecl;
    procedure setImplementorStringFromValueCallback
      (implementorStringFromValueCallback
      : AUImplementorStringFromValueCallback); cdecl;
    function implementorStringFromValueCallback
      : AUImplementorStringFromValueCallback; cdecl;
    procedure setImplementorValueFromStringCallback
      (implementorValueFromStringCallback
      : AUImplementorValueFromStringCallback); cdecl;
    function implementorValueFromStringCallback
      : AUImplementorValueFromStringCallback; cdecl;
    procedure setImplementorDisplayNameWithLengthCallback
      (implementorDisplayNameWithLengthCallback
      : AUImplementorDisplayNameWithLengthCallback); cdecl;
    function implementorDisplayNameWithLengthCallback
      : AUImplementorDisplayNameWithLengthCallback; cdecl;
  end;

  TAUParameterNode = class(TOCGenericImport<AUParameterNodeClass,
    AUParameterNode>)
  end;

  PAUParameterNode = Pointer;

  AUParameterClass = interface(AUParameterNodeClass)
    ['{F91EFDDD-FF47-4A9F-BD2B-BB2DDD6AA1B4}']
  end;

  AUParameter = interface(AUParameterNode)
    ['{E45BD1C4-D56F-49C5-9E2D-01F223639FA3}']
    function minValue: AUValue; cdecl;
    function maxValue: AUValue; cdecl;
    function &unit: AudioUnitParameterUnit; cdecl;
    function unitName: NSString; cdecl;
    function flags: AudioUnitParameterOptions; cdecl;
    function address: AUParameterAddress; cdecl;
    function valueStrings: NSArray; cdecl;
    function dependentParameters: NSArray; cdecl;
    [MethodName('setValue:')]
    procedure setValue(value: AUValue); cdecl;
    function value: AUValue; cdecl;
    [MethodName('setValue:originator:')]
    procedure setValueOriginator(value: AUValue;
      originator: AUParameterObserverToken); cdecl;
    [MethodName('setValue:originator:atHostTime:')]
    procedure setValueOriginatorAtHostTime(value: AUValue;
      originator: AUParameterObserverToken; atHostTime: UInt64); cdecl;
    [MethodName('setValue:originator:atHostTime:eventType:')]
    procedure setValueOriginatorAtHostTimeEventType(value: AUValue;
      originator: AUParameterObserverToken; atHostTime: UInt64;
      eventType: AUParameterAutomationEventType); cdecl;
    function stringFromValue(value: PAUValue): NSString; cdecl;
    function valueFromString(&string: NSString): AUValue; cdecl;
  end;

  TAUParameter = class(TOCGenericImport<AUParameterClass, AUParameter>)
  end;

  PAUParameter = Pointer;

  AUParameterGroupClass = interface(AUParameterNodeClass)
    ['{356CAF0C-E17B-4B80-A45A-4AE236C7AA42}']
  end;

  AUParameterGroup = interface(AUParameterNode)
    ['{955B416B-FE30-4E58-AC0C-F20FEAB2EDA7}']
    function children: NSArray; cdecl;
    function allParameters: NSArray; cdecl;
  end;

  TAUParameterGroup = class(TOCGenericImport<AUParameterGroupClass,
    AUParameterGroup>)
  end;

  PAUParameterGroup = Pointer;

  AUParameterTreeClass = interface(AUParameterGroupClass)
    ['{19E01B6C-A48E-49CC-B1A4-68F11D44E661}']
    { class } function createParameterWithIdentifier(identifier: NSString;
      name: NSString; address: AUParameterAddress; min: AUValue; max: AUValue;
      &unit: AudioUnitParameterUnit; unitName: NSString;
      flags: AudioUnitParameterOptions; valueStrings: NSArray;
      dependentParameters: NSArray): AUParameter; cdecl;
    { class } function createGroupWithIdentifier(identifier: NSString;
      name: NSString; children: NSArray): AUParameterGroup; cdecl;
    { class } function createGroupTemplate(children: NSArray)
      : AUParameterGroup; cdecl;
    { class } function createGroupFromTemplate(templateGroup: AUParameterGroup;
      identifier: NSString; name: NSString; addressOffset: AUParameterAddress)
      : AUParameterGroup; cdecl;
    { class } function createTreeWithChildren(children: NSArray)
      : AUParameterTree; cdecl;
  end;

  AUParameterTree = interface(AUParameterGroup)
    ['{529898C1-D935-4332-A6DD-5D46595D623D}']
    function parameterWithAddress(address: AUParameterAddress)
      : AUParameter; cdecl;
    function parameterWithID(paramID: AudioUnitParameterID;
      scope: AudioUnitScope; element: AudioUnitElement): AUParameter; cdecl;
  end;

  TAUParameterTree = class(TOCGenericImport<AUParameterTreeClass,
    AUParameterTree>)
  end;

  PAUParameterTree = Pointer;

  AUAudioUnitBusArrayClass = interface(NSObjectClass)
    ['{CDFA4CA2-ADA5-4620-9F0A-6E3A96B5757C}']
  end;

  AUAudioUnitBusArray = interface(NSObject)
    ['{EBCEA462-8962-4BD9-884D-AC2FE56720E7}']
    [MethodName('initWithAudioUnit:busType:busses:')]
    function initWithAudioUnitBusTypeBusses(owner: AUAudioUnit;
      busType: AUAudioUnitBusType; busses: NSArray)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithAudioUnit:busType:')]
    function initWithAudioUnitBusType(owner: AUAudioUnit;
      busType: AUAudioUnitBusType): Pointer { instancetype }; cdecl;
    function count: NSUInteger; cdecl;
    function objectAtIndexedSubscript(index: NSUInteger): AUAudioUnitBus; cdecl;
    function isCountChangeable: Boolean; cdecl;
    function setBusCount(count: NSUInteger; error: NSError): Boolean; cdecl;
    procedure addObserverToAllBusses(observer: NSObject; forKeyPath: NSString;
      options: NSKeyValueObservingOptions; context: Pointer); cdecl;
    procedure removeObserverFromAllBusses(observer: NSObject;
      forKeyPath: NSString; context: Pointer); cdecl;
    function ownerAudioUnit: AUAudioUnit; cdecl;
    function busType: AUAudioUnitBusType; cdecl;
    procedure replaceBusses(busArray: NSArray); cdecl;
  end;

  TAUAudioUnitBusArray = class(TOCGenericImport<AUAudioUnitBusArrayClass,
    AUAudioUnitBusArray>)
  end;

  PAUAudioUnitBusArray = Pointer;

  AUAudioUnitBusClass = interface(NSObjectClass)
    ['{91826DF3-189E-4F1B-830D-54176EB3BF3D}']
  end;

  AUAudioUnitBus = interface(NSObject)
    ['{7FA89A9B-B468-4E22-A6A6-DE03C6AC6CB4}']
    function format: AVAudioFormat; cdecl;
    function setFormat(format: AVAudioFormat; error: NSError): Boolean; cdecl;
    procedure setShouldAllocateBuffer(shouldAllocateBuffer: Boolean); cdecl;
    function shouldAllocateBuffer: Boolean; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    function index: NSUInteger; cdecl;
    function busType: AUAudioUnitBusType; cdecl;
    function ownerAudioUnit: AUAudioUnit; cdecl;
    function supportedChannelLayoutTags: NSArray; cdecl;
    procedure setContextPresentationLatency(contextPresentationLatency
      : NSTimeInterval); cdecl;
    function contextPresentationLatency: NSTimeInterval; cdecl;
    function initWithFormat(format: AVAudioFormat; error: NSError)
      : Pointer { instancetype }; cdecl;
    procedure setSupportedChannelCounts(supportedChannelCounts: NSArray); cdecl;
    function supportedChannelCounts: NSArray; cdecl;
    procedure setMaximumChannelCount(maximumChannelCount
      : AUAudioChannelCount); cdecl;
    function maximumChannelCount: AUAudioChannelCount; cdecl;
  end;

  TAUAudioUnitBus = class(TOCGenericImport<AUAudioUnitBusClass, AUAudioUnitBus>)
  end;

  PAUAudioUnitBus = Pointer;

  AUAudioUnitPresetClass = interface(NSObjectClass)
    ['{69A493D9-9AEF-476C-A9C0-675FC33343F5}']
  end;

  AUAudioUnitPreset = interface(NSObject)
    ['{E2E7E542-2300-42E3-BDA2-4E42C5C2ABE4}']
    procedure setNumber(number: NSInteger); cdecl;
    function number: NSInteger; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TAUAudioUnitPreset = class(TOCGenericImport<AUAudioUnitPresetClass,
    AUAudioUnitPreset>)
  end;

  PAUAudioUnitPreset = Pointer;

  AUAudioUnitClass = interface(NSObjectClass)
    ['{F7025111-75F9-41BF-851C-E1F84BBBAB42}']
    { class } procedure instantiateWithComponentDescription(componentDescription
      : AudioComponentDescription; options: AudioComponentInstantiationOptions;
      completionHandler: TAudioToolboxCompletionHandler); cdecl;
    { class } procedure registerSubclass(cls: Pointer;
      asComponentDescription: AudioComponentDescription; name: NSString;
      version: UInt32); cdecl;
  end;

  AUAudioUnit = interface(NSObject)
    ['{35E5E96C-9317-4F83-8511-6F89BFBD2859}']
    [MethodName('initWithComponentDescription:options:error:')]
    function initWithComponentDescriptionOptionsError(componentDescription
      : AudioComponentDescription; options: AudioComponentInstantiationOptions;
      error: NSError): Pointer { instancetype }; cdecl;
    [MethodName('initWithComponentDescription:error:')]
    function initWithComponentDescriptionError(componentDescription
      : AudioComponentDescription; error: NSError)
      : Pointer { instancetype }; cdecl;
    function componentDescription: AudioComponentDescription; cdecl;
    function component: AudioComponent; cdecl;
    function componentName: NSString; cdecl;
    function audioUnitName: NSString; cdecl;
    function manufacturerName: NSString; cdecl;
    function audioUnitShortName: NSString; cdecl;
    function componentVersion: LongWord; cdecl;
    function allocateRenderResourcesAndReturnError(outError: NSError)
      : Boolean; cdecl;
    procedure deallocateRenderResources; cdecl;
    function renderResourcesAllocated: Boolean; cdecl;
    procedure reset; cdecl;
    function inputBusses: AUAudioUnitBusArray; cdecl;
    function outputBusses: AUAudioUnitBusArray; cdecl;
    function renderBlock: AURenderBlock; cdecl;
    function scheduleParameterBlock: AUScheduleParameterBlock; cdecl;
    function tokenByAddingRenderObserver(observer: AURenderObserver)
      : NSInteger; cdecl;
    procedure removeRenderObserver(token: NSInteger); cdecl;
    procedure setMaximumFramesToRender(maximumFramesToRender
      : AUAudioFrameCount); cdecl;
    function maximumFramesToRender: AUAudioFrameCount; cdecl;
    procedure setParameterTree(parameterTree: AUParameterTree); cdecl;
    function parameterTree: AUParameterTree; cdecl;
    function parametersForOverviewWithCount(count: NSInteger): NSArray; cdecl;
    function allParameterValues: Boolean; cdecl;
    function isMusicDeviceOrEffect: Boolean; cdecl;
    function virtualMIDICableCount: NSInteger; cdecl;
    function scheduleMIDIEventBlock: AUScheduleMIDIEventBlock; cdecl;
    function scheduleMIDIEventListBlock: AUMIDIEventListBlock; cdecl;
    function MIDIOutputNames: NSArray; cdecl;
    function providesUserInterface: Boolean; cdecl;
    procedure setMIDIOutputEventBlock(MIDIOutputEventBlock
      : AUMIDIOutputEventBlock); cdecl;
    function MIDIOutputEventBlock: AUMIDIOutputEventBlock; cdecl;
    procedure setMIDIOutputEventListBlock(MIDIOutputEventListBlock
      : AUMIDIEventListBlock); cdecl;
    function MIDIOutputEventListBlock: AUMIDIEventListBlock; cdecl;
    function AudioUnitMIDIProtocol: MIDIProtocolID; cdecl;
    procedure setHostMIDIProtocol(hostMIDIProtocol: MIDIProtocolID); cdecl;
    function hostMIDIProtocol: MIDIProtocolID; cdecl;
    procedure setFullState(fullState: NSDictionary); cdecl;
    function fullState: NSDictionary; cdecl;
    procedure setFullStateForDocument(fullStateForDocument
      : NSDictionary); cdecl;
    function fullStateForDocument: NSDictionary; cdecl;
    function factoryPresets: NSArray; cdecl;
    function userPresets: NSArray; cdecl;
    function saveUserPreset(userPreset: AUAudioUnitPreset; error: NSError)
      : Boolean; cdecl;
    function deleteUserPreset(userPreset: AUAudioUnitPreset; error: NSError)
      : Boolean; cdecl;
    function presetStateFor(userPreset: AUAudioUnitPreset; error: NSError)
      : NSDictionary; cdecl;
    function supportsUserPresets: Boolean; cdecl;
    function isLoadedInProcess: Boolean; cdecl;
    procedure setCurrentPreset(currentPreset: AUAudioUnitPreset); cdecl;
    function currentPreset: AUAudioUnitPreset; cdecl;
    function latency: NSTimeInterval; cdecl;
    function tailTime: NSTimeInterval; cdecl;
    procedure setRenderQuality(renderQuality: NSInteger); cdecl;
    function renderQuality: NSInteger; cdecl;
    procedure setShouldBypassEffect(shouldBypassEffect: Boolean); cdecl;
    function shouldBypassEffect: Boolean; cdecl;
    function canProcessInPlace: Boolean; cdecl;
    procedure setRenderingOffline(renderingOffline: Boolean); cdecl;
    function isRenderingOffline: Boolean; cdecl;
    function channelCapabilities: NSArray; cdecl;
    procedure setMusicalContextBlock(musicalContextBlock
      : AUHostMusicalContextBlock); cdecl;
    function musicalContextBlock: AUHostMusicalContextBlock; cdecl;
    procedure setTransportStateBlock(transportStateBlock
      : AUHostTransportStateBlock); cdecl;
    function transportStateBlock: AUHostTransportStateBlock; cdecl;
    procedure setContextName(contextName: NSString); cdecl;
    function contextName: NSString; cdecl;
    function supportsMPE: Boolean; cdecl;
    procedure setChannelMap(channelMap: NSArray); cdecl;
    function channelMap: NSArray; cdecl;
    function profileStateForCable(cable: Byte; channel: MIDIChannelNumber)
      : MIDICIProfileState; cdecl;
    function enableProfile(profile: MIDICIProfile; cable: Byte;
      onChannel: MIDIChannelNumber; error: NSError): Boolean; cdecl;
    function disableProfile(profile: MIDICIProfile; cable: Byte;
      onChannel: MIDIChannelNumber; error: NSError): Boolean; cdecl;
    procedure setProfileChangedBlock(profileChangedBlock
      : AUMIDICIProfileChangedBlock); cdecl;
    function profileChangedBlock: AUMIDICIProfileChangedBlock; cdecl;
    function messageChannelFor(channelName: NSString): Pointer; cdecl;
    function canPerformInput: Boolean; cdecl;
    function canPerformOutput: Boolean; cdecl;
    procedure setInputEnabled(inputEnabled: Boolean); cdecl;
    function isInputEnabled: Boolean; cdecl;
    procedure setOutputEnabled(outputEnabled: Boolean); cdecl;
    function isOutputEnabled: Boolean; cdecl;
    procedure setOutputProvider(outputProvider: AURenderPullInputBlock); cdecl;
    function outputProvider: AURenderPullInputBlock; cdecl;
    procedure setInputHandler(inputHandler: AUInputHandler); cdecl;
    function inputHandler: AUInputHandler; cdecl;
    function isRunning: Boolean; cdecl;
    function startHardwareAndReturnError(outError: NSError): Boolean; cdecl;
    procedure stopHardware; cdecl;
    function osWorkgroup: os_workgroup_t; cdecl;
    function internalRenderBlock: AUInternalRenderBlock; cdecl;
    function renderContextObserver: AURenderContextObserver; cdecl;
    procedure setMIDIOutputBufferSizeHint(MIDIOutputBufferSizeHint
      : NSInteger); cdecl;
    function MIDIOutputBufferSizeHint: NSInteger; cdecl;
    function shouldChangeToFormat(format: AVAudioFormat; forBus: AUAudioUnitBus)
      : Boolean; cdecl;
    procedure setRenderResourcesAllocated(flag: Boolean); cdecl;
  end;

  TAUAudioUnit = class(TOCGenericImport<AUAudioUnitClass, AUAudioUnit>)
  end;

  PAUAudioUnit = Pointer;

  AUAudioUnitV2BridgeClass = interface(AUAudioUnitClass)
    ['{9E887AE8-2E45-43A2-A9A3-DD9450569E7A}']
  end;

  AUAudioUnitV2Bridge = interface(AUAudioUnit)
    ['{D09DD462-9AE7-4527-98E9-6744F0526391}']
    function AudioUnit: AudioUnit; cdecl;
  end;

  TAUAudioUnitV2Bridge = class(TOCGenericImport<AUAudioUnitV2BridgeClass,
    AUAudioUnitV2Bridge>)
  end;

  PAUAudioUnitV2Bridge = Pointer;

  // ===== Protocol declarations =====

  AUAudioUnitFactory = interface(IObjectiveC)
    ['{E8212430-59FE-4BAE-9F7F-4D691CDE3205}']
    function createAudioUnitWithComponentDescription
      (desc: AudioComponentDescription; error: NSError): AUAudioUnit; cdecl;
  end;

  AUMessageChannel = interface(IObjectiveC)
    ['{F2094198-E85A-4B90-B9BA-0A251B252328}']
    function callAudioUnit(message: NSDictionary): NSDictionary; cdecl;
    procedure setCallHostBlock(CallHostBlock: CallHostBlock); cdecl;
    function CallHostBlock: CallHostBlock; cdecl;
  end;

  // ===== Exported string consts =====

function kAudioComponentRegistrationsChangedNotification: Pointer;
function kAudioComponentInstanceInvalidationNotification: Pointer;
function kAudioSession_RouteChangeKey_Reason: Pointer;
function kAudioSession_AudioRouteChangeKey_PreviousRouteDescription: Pointer;
function kAudioSession_AudioRouteChangeKey_CurrentRouteDescription: Pointer;
function kAudioSession_AudioRouteKey_Inputs: Pointer;
function kAudioSession_AudioRouteKey_Outputs: Pointer;
function kAudioSession_AudioRouteKey_Type: Pointer;
function kAudioSessionInputRoute_LineIn: Pointer;
function kAudioSessionInputRoute_BuiltInMic: Pointer;
function kAudioSessionInputRoute_HeadsetMic: Pointer;
function kAudioSessionInputRoute_BluetoothHFP: Pointer;
function kAudioSessionInputRoute_USBAudio: Pointer;
function kAudioSessionOutputRoute_LineOut: Pointer;
function kAudioSessionOutputRoute_Headphones: Pointer;
function kAudioSessionOutputRoute_BluetoothHFP: Pointer;
function kAudioSessionOutputRoute_BluetoothA2DP: Pointer;
function kAudioSessionOutputRoute_BuiltInReceiver: Pointer;
function kAudioSessionOutputRoute_BuiltInSpeaker: Pointer;
function kAudioSessionOutputRoute_USBAudio: Pointer;
function kAudioSessionOutputRoute_HDMI: Pointer;
function kAudioSessionOutputRoute_AirPlay: Pointer;
function kAudioSession_InputSourceKey_ID: Pointer;
function kAudioSession_InputSourceKey_Description: Pointer;
function kAudioSession_OutputDestinationKey_ID: Pointer;
function kAudioSession_OutputDestinationKey_Description: Pointer;


// ===== External functions =====

const
  libAudioToolbox =
    '/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox';
function AudioComponentFindNext(inComponent: AudioComponent;
  inDesc: PAudioComponentDescription): AudioComponent; cdecl;
  external libAudioToolbox name _PU + 'AudioComponentFindNext';
function AudioComponentCount(inDesc: PAudioComponentDescription): UInt32; cdecl;
  external libAudioToolbox name _PU + 'AudioComponentCount';
function AudioComponentCopyName(inComponent: AudioComponent; outName: Pointer)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioComponentCopyName';
function AudioComponentGetDescription(inComponent: AudioComponent;
  outDesc: PAudioComponentDescription): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioComponentGetDescription';
function AudioComponentGetVersion(inComponent: AudioComponent;
  outVersion: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioComponentGetVersion';
function AudioComponentInstanceNew(inComponent: AudioComponent;
  outInstance: PAudioComponentInstance): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioComponentInstanceNew';
procedure AudioComponentInstantiate(inComponent: AudioComponent;
  inOptions: AudioComponentInstantiationOptions;
  inCompletionHandler: TAudioToolboxInCompletionHandler); cdecl;
  external libAudioToolbox name _PU + 'AudioComponentInstantiate';
function AudioComponentInstanceDispose(inInstance: AudioComponentInstance)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioComponentInstanceDispose';
function AudioComponentInstanceGetComponent(inInstance: AudioComponentInstance)
  : AudioComponent; cdecl; external libAudioToolbox name _PU +
  'AudioComponentInstanceGetComponent';
function AudioComponentInstanceCanDo(inInstance: AudioComponentInstance;
  inSelectorID: Int16): Boolean; cdecl;
  external libAudioToolbox name _PU + 'AudioComponentInstanceCanDo';
function AudioComponentRegister(inDesc: PAudioComponentDescription;
  inName: CFStringRef; inVersion: UInt32;
  inFactory: AudioComponentFactoryFunction): AudioComponent; cdecl;
  external libAudioToolbox name _PU + 'AudioComponentRegister';
function AudioComponentCopyConfigurationInfo(inComponent: AudioComponent;
  outConfigurationInfo: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioComponentCopyConfigurationInfo';
function AudioComponentValidate(inComponent: AudioComponent;
  inValidationParameters: CFDictionaryRef;
  outValidationResult: PAudioComponentValidationResult): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioComponentValidate';
function AudioComponentValidateWithResults(inComponent: AudioComponent;
  inValidationParameters: CFDictionaryRef;
  inCompletionHandler: TAudioToolboxInCompletionHandler1): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioComponentValidateWithResults';
function AudioUnitInitialize(inUnit: AudioUnit): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioUnitInitialize';
function AudioUnitUninitialize(inUnit: AudioUnit): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioUnitUninitialize';
function AudioUnitGetPropertyInfo(inUnit: AudioUnit; inID: AudioUnitPropertyID;
  inScope: AudioUnitScope; inElement: AudioUnitElement; outDataSize: PLongWord;
  outWritable: PBoolean): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioUnitGetPropertyInfo';
function AudioUnitGetProperty(inUnit: AudioUnit; inID: AudioUnitPropertyID;
  inScope: AudioUnitScope; inElement: AudioUnitElement; outData: Pointer;
  ioDataSize: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioUnitGetProperty';
function AudioUnitSetProperty(inUnit: AudioUnit; inID: AudioUnitPropertyID;
  inScope: AudioUnitScope; inElement: AudioUnitElement; inData: Pointer;
  inDataSize: UInt32): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioUnitSetProperty';
function AudioUnitAddPropertyListener(inUnit: AudioUnit;
  inID: AudioUnitPropertyID; inProc: AudioUnitPropertyListenerProc;
  inProcUserData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioUnitAddPropertyListener';
function AudioUnitRemovePropertyListenerWithUserData(inUnit: AudioUnit;
  inID: AudioUnitPropertyID; inProc: AudioUnitPropertyListenerProc;
  inProcUserData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU +
  'AudioUnitRemovePropertyListenerWithUserData';
function AudioUnitAddRenderNotify(inUnit: AudioUnit; inProc: AURenderCallback;
  inProcUserData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioUnitAddRenderNotify';
function AudioUnitRemoveRenderNotify(inUnit: AudioUnit;
  inProc: AURenderCallback; inProcUserData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioUnitRemoveRenderNotify';
function AudioUnitGetParameter(inUnit: AudioUnit; inID: AudioUnitParameterID;
  inScope: AudioUnitScope; inElement: AudioUnitElement;
  outValue: PAudioUnitParameterValue): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioUnitGetParameter';
function AudioUnitSetParameter(inUnit: AudioUnit; inID: AudioUnitParameterID;
  inScope: AudioUnitScope; inElement: AudioUnitElement;
  inValue: AudioUnitParameterValue; inBufferOffsetInFrames: UInt32): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AudioUnitSetParameter';
function AudioUnitScheduleParameters(inUnit: AudioUnit;
  inParameterEvent: PAudioUnitParameterEvent; inNumParamEvents: UInt32)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioUnitScheduleParameters';
function AudioUnitRender(inUnit: AudioUnit;
  ioActionFlags: PAudioUnitRenderActionFlags; inTimeStamp: PInteger;
  inOutputBusNumber: UInt32; inNumberFrames: UInt32; ioData: PInteger)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'AudioUnitRender';
function AudioUnitProcess(inUnit: AudioUnit;
  ioActionFlags: PAudioUnitRenderActionFlags; inTimeStamp: PInteger;
  inNumberFrames: UInt32; ioData: PInteger): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioUnitProcess';
function AudioUnitProcessMultiple(inUnit: AudioUnit;
  ioActionFlags: PAudioUnitRenderActionFlags; inTimeStamp: PInteger;
  inNumberFrames: UInt32; inNumberInputBufferLists: UInt32;
  inInputBufferLists: PInteger; inNumberOutputBufferLists: UInt32;
  ioOutputBufferLists: PInteger): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioUnitProcessMultiple';
function AudioUnitReset(inUnit: AudioUnit; inScope: AudioUnitScope;
  inElement: AudioUnitElement): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioUnitReset';
function AudioOutputUnitPublish(inDesc: PAudioComponentDescription;
  inName: CFStringRef; inVersion: UInt32; inOutputUnit: AudioUnit): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AudioOutputUnitPublish';
function AudioOutputUnitGetHostIcon(au: AudioUnit; desiredPointSize: Single)
  : Pointer { UIImage }; cdecl;
  external libAudioToolbox name _PU + 'AudioOutputUnitGetHostIcon';
function AudioComponentGetIcon(comp: AudioComponent; desiredPointSize: Single)
  : Pointer { UIImage }; cdecl;
  external libAudioToolbox name _PU + 'AudioComponentGetIcon';
function AudioComponentGetLastActiveTime(comp: AudioComponent): CFAbsoluteTime;
  cdecl; external libAudioToolbox name _PU + 'AudioComponentGetLastActiveTime';
function AudioComponentCopyIcon(comp: AudioComponent): Pointer { UIImage };
  cdecl; external libAudioToolbox name _PU + 'AudioComponentCopyIcon';
function AudioUnitExtensionSetComponentList(extensionIdentifier: CFStringRef;
  audioComponentInfo: CFArrayRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioUnitExtensionSetComponentList';
function AudioUnitExtensionCopyComponentList(extensionIdentifier: CFStringRef)
  : CFArrayRef; cdecl; external libAudioToolbox name _PU +
  'AudioUnitExtensionCopyComponentList';
function GetAudioUnitParameterDisplayType(flags: AudioUnitParameterOptions)
  : AudioUnitParameterOptions; cdecl;
  external libAudioToolbox name _PU + 'GetAudioUnitParameterDisplayType';
function SetAudioUnitParameterDisplayType(flags: AudioUnitParameterOptions;
  displayType: AudioUnitParameterOptions): AudioUnitParameterOptions; cdecl;
  external libAudioToolbox name _PU + 'SetAudioUnitParameterDisplayType';
function AudioCodecGetPropertyInfo(inCodec: AudioCodec;
  inPropertyID: AudioCodecPropertyID; outSize: PLongWord; outWritable: PBoolean)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioCodecGetPropertyInfo';
function AudioCodecGetProperty(inCodec: AudioCodec;
  inPropertyID: AudioCodecPropertyID; ioPropertyDataSize: PLongWord;
  outPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioCodecGetProperty';
function AudioCodecSetProperty(inCodec: AudioCodec;
  inPropertyID: AudioCodecPropertyID; inPropertyDataSize: UInt32;
  inPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioCodecSetProperty';
function AudioCodecInitialize(inCodec: AudioCodec; inInputFormat: PInteger;
  inOutputFormat: PInteger; inMagicCookie: Pointer;
  inMagicCookieByteSize: UInt32): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioCodecInitialize';
function AudioCodecUninitialize(inCodec: AudioCodec): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioCodecUninitialize';
function AudioCodecAppendInputData(inCodec: AudioCodec; inInputData: Pointer;
  ioInputDataByteSize: PLongWord; ioNumberPackets: PLongWord;
  inPacketDescription: PInteger): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioCodecAppendInputData';
function AudioCodecProduceOutputPackets(inCodec: AudioCodec;
  outOutputData: Pointer; ioOutputDataByteSize: PLongWord;
  ioNumberPackets: PLongWord; outPacketDescription: PInteger;
  outStatus: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioCodecProduceOutputPackets';
function AudioCodecAppendInputBufferList(inCodec: AudioCodec;
  inBufferList: PInteger; ioNumberPackets: PLongWord;
  inPacketDescription: PInteger; outBytesConsumed: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioCodecAppendInputBufferList';
function AudioCodecProduceOutputBufferList(inCodec: AudioCodec;
  ioBufferList: PInteger; ioNumberPackets: PLongWord;
  outPacketDescription: PInteger; outStatus: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioCodecProduceOutputBufferList';
function AudioCodecReset(inCodec: AudioCodec): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioCodecReset';
function AudioConverterNew(inSourceFormat: PInteger;
  inDestinationFormat: PInteger; outAudioConverter: PAudioConverterRef)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'AudioConverterNew';
function AudioConverterNewSpecific(inSourceFormat: PInteger;
  inDestinationFormat: PInteger; inNumberClassDescriptions: UInt32;
  inClassDescriptions: PInteger; outAudioConverter: PAudioConverterRef)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioConverterNewSpecific';
function AudioConverterDispose(inAudioConverter: AudioConverterRef): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AudioConverterDispose';
function AudioConverterReset(inAudioConverter: AudioConverterRef): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AudioConverterReset';
function AudioConverterGetPropertyInfo(inAudioConverter: AudioConverterRef;
  inPropertyID: AudioConverterPropertyID; outSize: PLongWord;
  outWritable: PBoolean): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioConverterGetPropertyInfo';
function AudioConverterGetProperty(inAudioConverter: AudioConverterRef;
  inPropertyID: AudioConverterPropertyID; ioPropertyDataSize: PLongWord;
  outPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioConverterGetProperty';
function AudioConverterSetProperty(inAudioConverter: AudioConverterRef;
  inPropertyID: AudioConverterPropertyID; inPropertyDataSize: UInt32;
  inPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioConverterSetProperty';
function AudioConverterConvertBuffer(inAudioConverter: AudioConverterRef;
  inInputDataSize: UInt32; inInputData: Pointer; ioOutputDataSize: PLongWord;
  outOutputData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioConverterConvertBuffer';
function AudioConverterFillComplexBuffer(inAudioConverter: AudioConverterRef;
  inInputDataProc: AudioConverterComplexInputDataProc;
  inInputDataProcUserData: Pointer; ioOutputDataPacketSize: PLongWord;
  outOutputData: PInteger; outPacketDescription: PInteger): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioConverterFillComplexBuffer';
function AudioConverterConvertComplexBuffer(inAudioConverter: AudioConverterRef;
  inNumberPCMFrames: UInt32; inInputData: PInteger; outOutputData: PInteger)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioConverterConvertComplexBuffer';
function NumBytesToNumAudioFileMarkers(inNumBytes: LongWord): LongWord; cdecl;
  external libAudioToolbox name _PU + 'NumBytesToNumAudioFileMarkers';
function NumAudioFileMarkersToNumBytes(inNumMarkers: LongWord): LongWord; cdecl;
  external libAudioToolbox name _PU + 'NumAudioFileMarkersToNumBytes';
function NextAudioFileRegion(inAFRegionPtr: PAudioFileRegion): PAudioFileRegion;
  cdecl; external libAudioToolbox name _PU + 'NextAudioFileRegion';
function AudioFileCreateWithURL(inFileRef: CFURLRef;
  inFileType: AudioFileTypeID; inFormat: PInteger; inFlags: AudioFileFlags;
  outAudioFile: PAudioFileID): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileCreateWithURL';
function AudioFileOpenURL(inFileRef: CFURLRef;
  inPermissions: AudioFilePermissions; inFileTypeHint: AudioFileTypeID;
  outAudioFile: PAudioFileID): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileOpenURL';
function AudioFileInitializeWithCallbacks(inClientData: Pointer;
  inReadFunc: AudioFile_ReadProc; inWriteFunc: AudioFile_WriteProc;
  inGetSizeFunc: AudioFile_GetSizeProc; inSetSizeFunc: AudioFile_SetSizeProc;
  inFileType: AudioFileTypeID; inFormat: PInteger; inFlags: AudioFileFlags;
  outAudioFile: PAudioFileID): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileInitializeWithCallbacks';
function AudioFileOpenWithCallbacks(inClientData: Pointer;
  inReadFunc: AudioFile_ReadProc; inWriteFunc: AudioFile_WriteProc;
  inGetSizeFunc: AudioFile_GetSizeProc; inSetSizeFunc: AudioFile_SetSizeProc;
  inFileTypeHint: AudioFileTypeID; outAudioFile: PAudioFileID): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileOpenWithCallbacks';
function AudioFileClose(inAudioFile: AudioFileID): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileClose';
function AudioFileOptimize(inAudioFile: AudioFileID): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileOptimize';
function AudioFileReadBytes(inAudioFile: AudioFileID; inUseCache: Boolean;
  inStartingByte: Int64; ioNumBytes: PLongWord; outBuffer: Pointer): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AudioFileReadBytes';
function AudioFileWriteBytes(inAudioFile: AudioFileID; inUseCache: Boolean;
  inStartingByte: Int64; ioNumBytes: PLongWord; inBuffer: Pointer): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AudioFileWriteBytes';
function AudioFileReadPacketData(inAudioFile: AudioFileID; inUseCache: Boolean;
  ioNumBytes: PLongWord; outPacketDescriptions: PInteger;
  inStartingPacket: Int64; ioNumPackets: PLongWord; outBuffer: Pointer)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioFileReadPacketData';
function AudioFileReadPackets(inAudioFile: AudioFileID; inUseCache: Boolean;
  outNumBytes: PLongWord; outPacketDescriptions: PInteger;
  inStartingPacket: Int64; ioNumPackets: PLongWord; outBuffer: Pointer)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'AudioFileReadPackets';
function AudioFileWritePackets(inAudioFile: AudioFileID; inUseCache: Boolean;
  inNumBytes: UInt32; inPacketDescriptions: PInteger; inStartingPacket: Int64;
  ioNumPackets: PLongWord; inBuffer: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileWritePackets';
function AudioFileCountUserData(inAudioFile: AudioFileID; inUserDataID: UInt32;
  outNumberItems: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileCountUserData';
function AudioFileGetUserDataSize(inAudioFile: AudioFileID;
  inUserDataID: UInt32; inIndex: UInt32; outUserDataSize: PLongWord): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AudioFileGetUserDataSize';
function AudioFileGetUserData(inAudioFile: AudioFileID; inUserDataID: UInt32;
  inIndex: UInt32; ioUserDataSize: PLongWord; outUserData: Pointer): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AudioFileGetUserData';
function AudioFileSetUserData(inAudioFile: AudioFileID; inUserDataID: UInt32;
  inIndex: UInt32; inUserDataSize: UInt32; inUserData: Pointer): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AudioFileSetUserData';
function AudioFileRemoveUserData(inAudioFile: AudioFileID; inUserDataID: UInt32;
  inIndex: UInt32): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileRemoveUserData';
function AudioFileGetPropertyInfo(inAudioFile: AudioFileID;
  inPropertyID: AudioFilePropertyID; outDataSize: PLongWord;
  isWritable: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileGetPropertyInfo';
function AudioFileGetProperty(inAudioFile: AudioFileID;
  inPropertyID: AudioFilePropertyID; ioDataSize: PLongWord;
  outPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileGetProperty';
function AudioFileSetProperty(inAudioFile: AudioFileID;
  inPropertyID: AudioFilePropertyID; inDataSize: UInt32;
  inPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileSetProperty';
function AudioFileGetGlobalInfoSize(inPropertyID: AudioFilePropertyID;
  inSpecifierSize: UInt32; inSpecifier: Pointer; outDataSize: PLongWord)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioFileGetGlobalInfoSize';
function AudioFileGetGlobalInfo(inPropertyID: AudioFilePropertyID;
  inSpecifierSize: UInt32; inSpecifier: Pointer; ioDataSize: PLongWord;
  outPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileGetGlobalInfo';
function AudioFileStreamOpen(inClientData: Pointer;
  inPropertyListenerProc: AudioFileStream_PropertyListenerProc;
  inPacketsProc: AudioFileStream_PacketsProc; inFileTypeHint: AudioFileTypeID;
  outAudioFileStream: PAudioFileStreamID): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileStreamOpen';
function AudioFileStreamParseBytes(inAudioFileStream: AudioFileStreamID;
  inDataByteSize: UInt32; inData: Pointer; inFlags: AudioFileStreamParseFlags)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioFileStreamParseBytes';
function AudioFileStreamSeek(inAudioFileStream: AudioFileStreamID;
  inPacketOffset: Int64; outDataByteOffset: PInt64;
  ioFlags: PAudioFileStreamSeekFlags): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileStreamSeek';
function AudioFileStreamGetPropertyInfo(inAudioFileStream: AudioFileStreamID;
  inPropertyID: AudioFileStreamPropertyID; outPropertyDataSize: PLongWord;
  outWritable: PBoolean): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileStreamGetPropertyInfo';
function AudioFileStreamGetProperty(inAudioFileStream: AudioFileStreamID;
  inPropertyID: AudioFileStreamPropertyID; ioPropertyDataSize: PLongWord;
  outPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileStreamGetProperty';
function AudioFileStreamSetProperty(inAudioFileStream: AudioFileStreamID;
  inPropertyID: AudioFileStreamPropertyID; inPropertyDataSize: UInt32;
  inPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFileStreamSetProperty';
function AudioFileStreamClose(inAudioFileStream: AudioFileStreamID): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AudioFileStreamClose';
function AudioFormatGetPropertyInfo(inPropertyID: AudioFormatPropertyID;
  inSpecifierSize: UInt32; inSpecifier: Pointer; outPropertyDataSize: PLongWord)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioFormatGetPropertyInfo';
function AudioFormatGetProperty(inPropertyID: AudioFormatPropertyID;
  inSpecifierSize: UInt32; inSpecifier: Pointer; ioPropertyDataSize: PLongWord;
  outPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioFormatGetProperty';
function AudioOutputUnitStart(ci: AudioUnit): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioOutputUnitStart';
function AudioOutputUnitStop(ci: AudioUnit): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioOutputUnitStop';
function AudioQueueNewOutput(inFormat: PInteger;
  inCallbackProc: AudioQueueOutputCallback; inUserData: Pointer;
  inCallbackRunLoop: CFRunLoopRef; inCallbackRunLoopMode: CFStringRef;
  inFlags: UInt32; outAQ: PAudioQueueRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueNewOutput';
function AudioQueueNewInput(inFormat: PInteger;
  inCallbackProc: AudioQueueInputCallback; inUserData: Pointer;
  inCallbackRunLoop: CFRunLoopRef; inCallbackRunLoopMode: CFStringRef;
  inFlags: UInt32; outAQ: PAudioQueueRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueNewInput';
function AudioQueueNewOutputWithDispatchQueue(outAQ: PAudioQueueRef;
  inFormat: PInteger; inFlags: UInt32;
  inCallbackDispatchQueue: dispatch_queue_t;
  inCallbackBlock: AudioQueueOutputCallbackBlock): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueNewOutputWithDispatchQueue';
function AudioQueueNewInputWithDispatchQueue(outAQ: PAudioQueueRef;
  inFormat: PInteger; inFlags: UInt32;
  inCallbackDispatchQueue: dispatch_queue_t;
  inCallbackBlock: AudioQueueInputCallbackBlock): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueNewInputWithDispatchQueue';
function AudioQueueDispose(inAQ: AudioQueueRef; inImmediate: Boolean): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AudioQueueDispose';
function AudioQueueAllocateBuffer(inAQ: AudioQueueRef; inBufferByteSize: UInt32;
  outBuffer: PAudioQueueBufferRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueAllocateBuffer';
function AudioQueueAllocateBufferWithPacketDescriptions(inAQ: AudioQueueRef;
  inBufferByteSize: UInt32; inNumberPacketDescriptions: UInt32;
  outBuffer: PAudioQueueBufferRef): OSStatus; cdecl;
  external libAudioToolbox name _PU +
  'AudioQueueAllocateBufferWithPacketDescriptions';
function AudioQueueFreeBuffer(inAQ: AudioQueueRef;
  inBuffer: AudioQueueBufferRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueFreeBuffer';
function AudioQueueEnqueueBuffer(inAQ: AudioQueueRef;
  inBuffer: AudioQueueBufferRef; inNumPacketDescs: UInt32;
  inPacketDescs: PInteger): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueEnqueueBuffer';
function AudioQueueEnqueueBufferWithParameters(inAQ: AudioQueueRef;
  inBuffer: AudioQueueBufferRef; inNumPacketDescs: UInt32;
  inPacketDescs: PInteger; inTrimFramesAtStart: UInt32;
  inTrimFramesAtEnd: UInt32; inNumParamValues: UInt32;
  inParamValues: PAudioQueueParameterEvent; inStartTime: PInteger;
  outActualStartTime: PInteger): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueEnqueueBufferWithParameters';
function AudioQueueStart(inAQ: AudioQueueRef; inStartTime: PInteger): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AudioQueueStart';
function AudioQueuePrime(inAQ: AudioQueueRef; inNumberOfFramesToPrepare: UInt32;
  outNumberOfFramesPrepared: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueuePrime';
function AudioQueueStop(inAQ: AudioQueueRef; inImmediate: Boolean): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AudioQueueStop';
function AudioQueuePause(inAQ: AudioQueueRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueuePause';
function AudioQueueFlush(inAQ: AudioQueueRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueFlush';
function AudioQueueReset(inAQ: AudioQueueRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueReset';
function AudioQueueGetParameter(inAQ: AudioQueueRef;
  inParamID: AudioQueueParameterID; outValue: PAudioQueueParameterValue)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioQueueGetParameter';
function AudioQueueSetParameter(inAQ: AudioQueueRef;
  inParamID: AudioQueueParameterID; inValue: AudioQueueParameterValue)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioQueueSetParameter';
function AudioQueueGetProperty(inAQ: AudioQueueRef; inID: AudioQueuePropertyID;
  outData: Pointer; ioDataSize: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueGetProperty';
function AudioQueueSetProperty(inAQ: AudioQueueRef; inID: AudioQueuePropertyID;
  inData: Pointer; inDataSize: UInt32): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueSetProperty';
function AudioQueueGetPropertySize(inAQ: AudioQueueRef;
  inID: AudioQueuePropertyID; outDataSize: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueGetPropertySize';
function AudioQueueAddPropertyListener(inAQ: AudioQueueRef;
  inID: AudioQueuePropertyID; inProc: AudioQueuePropertyListenerProc;
  inUserData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueAddPropertyListener';
function AudioQueueRemovePropertyListener(inAQ: AudioQueueRef;
  inID: AudioQueuePropertyID; inProc: AudioQueuePropertyListenerProc;
  inUserData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueRemovePropertyListener';
function AudioQueueCreateTimeline(inAQ: AudioQueueRef;
  outTimeline: PAudioQueueTimelineRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueCreateTimeline';
function AudioQueueDisposeTimeline(inAQ: AudioQueueRef;
  inTimeline: AudioQueueTimelineRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueDisposeTimeline';
function AudioQueueGetCurrentTime(inAQ: AudioQueueRef;
  inTimeline: AudioQueueTimelineRef; outTimeStamp: PInteger;
  outTimelineDiscontinuity: PBoolean): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueGetCurrentTime';
function AudioQueueDeviceGetCurrentTime(inAQ: AudioQueueRef;
  outTimeStamp: PInteger): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueDeviceGetCurrentTime';
function AudioQueueDeviceTranslateTime(inAQ: AudioQueueRef; inTime: PInteger;
  outTime: PInteger): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueDeviceTranslateTime';
function AudioQueueDeviceGetNearestStartTime(inAQ: AudioQueueRef;
  ioRequestedStartTime: PInteger; inFlags: UInt32): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueDeviceGetNearestStartTime';
function AudioQueueSetOfflineRenderFormat(inAQ: AudioQueueRef;
  inFormat: PInteger; inLayout: PInteger): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueSetOfflineRenderFormat';
function AudioQueueOfflineRender(inAQ: AudioQueueRef; inTimeStamp: PInteger;
  ioBuffer: AudioQueueBufferRef; inNumberFrames: UInt32): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueOfflineRender';
function AudioQueueProcessingTapNew(inAQ: AudioQueueRef;
  inCallback: AudioQueueProcessingTapCallback; inClientData: Pointer;
  inFlags: AudioQueueProcessingTapFlags; outMaxFrames: PLongWord;
  outProcessingFormat: PInteger; outAQTap: PAudioQueueProcessingTapRef)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioQueueProcessingTapNew';
function AudioQueueProcessingTapDispose(inAQTap: AudioQueueProcessingTapRef)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioQueueProcessingTapDispose';
function AudioQueueProcessingTapGetSourceAudio
  (inAQTap: AudioQueueProcessingTapRef; inNumberFrames: UInt32;
  ioTimeStamp: PInteger; outFlags: PAudioQueueProcessingTapFlags;
  outNumberFrames: PLongWord; ioData: PInteger): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueProcessingTapGetSourceAudio';
function AudioQueueProcessingTapGetQueueTime
  (inAQTap: AudioQueueProcessingTapRef; outQueueSampleTime: PDouble;
  outQueueFrameCount: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioQueueProcessingTapGetQueueTime';
function AudioSessionInitialize(inRunLoop: CFRunLoopRef;
  inRunLoopMode: CFStringRef;
  inInterruptionListener: AudioSessionInterruptionListener;
  inClientData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioSessionInitialize';
function AudioSessionSetActive(active: Boolean): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioSessionSetActive';
function AudioSessionSetActiveWithFlags(active: Boolean; inFlags: UInt32)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioSessionSetActiveWithFlags';
function AudioSessionGetProperty(inID: AudioSessionPropertyID;
  ioDataSize: PLongWord; outData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioSessionGetProperty';
function AudioSessionSetProperty(inID: AudioSessionPropertyID;
  inDataSize: UInt32; inData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioSessionSetProperty';
function AudioSessionGetPropertySize(inID: AudioSessionPropertyID;
  outDataSize: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioSessionGetPropertySize';
function AudioSessionAddPropertyListener(inID: AudioSessionPropertyID;
  inProc: AudioSessionPropertyListener; inClientData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioSessionAddPropertyListener';
function AudioSessionRemovePropertyListener(inID: AudioSessionPropertyID)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioSessionRemovePropertyListener';
function AudioSessionRemovePropertyListenerWithUserData
  (inID: AudioSessionPropertyID; inProc: AudioSessionPropertyListener;
  inClientData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU +
  'AudioSessionRemovePropertyListenerWithUserData';
function AudioServicesCreateSystemSoundID(inFileURL: CFURLRef;
  outSystemSoundID: PSystemSoundID): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioServicesCreateSystemSoundID';
function AudioServicesDisposeSystemSoundID(inSystemSoundID: SystemSoundID)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AudioServicesDisposeSystemSoundID';
procedure AudioServicesPlayAlertSoundWithCompletion(inSystemSoundID
  : SystemSoundID; inCompletionBlock: TAudioToolboxInCompletionBlock); cdecl;
  external libAudioToolbox name _PU +
  'AudioServicesPlayAlertSoundWithCompletion';
procedure AudioServicesPlaySystemSoundWithCompletion(inSystemSoundID
  : SystemSoundID; inCompletionBlock: TAudioToolboxInCompletionBlock); cdecl;
  external libAudioToolbox name _PU +
  'AudioServicesPlaySystemSoundWithCompletion';
function AudioServicesGetPropertyInfo(inPropertyID: AudioServicesPropertyID;
  inSpecifierSize: UInt32; inSpecifier: Pointer; outPropertyDataSize: PLongWord;
  outWritable: PBoolean): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioServicesGetPropertyInfo';
function AudioServicesGetProperty(inPropertyID: AudioServicesPropertyID;
  inSpecifierSize: UInt32; inSpecifier: Pointer; ioPropertyDataSize: PLongWord;
  outPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioServicesGetProperty';
function AudioServicesSetProperty(inPropertyID: AudioServicesPropertyID;
  inSpecifierSize: UInt32; inSpecifier: Pointer; inPropertyDataSize: UInt32;
  inPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioServicesSetProperty';
procedure AudioServicesPlayAlertSound(inSystemSoundID: SystemSoundID); cdecl;
  external libAudioToolbox name _PU + 'AudioServicesPlayAlertSound';
procedure AudioServicesPlaySystemSound(inSystemSoundID: SystemSoundID); cdecl;
  external libAudioToolbox name _PU + 'AudioServicesPlaySystemSound';
function AudioServicesAddSystemSoundCompletion(inSystemSoundID: SystemSoundID;
  inRunLoop: CFRunLoopRef; inRunLoopMode: CFStringRef;
  inCompletionRoutine: AudioServicesSystemSoundCompletionProc;
  inClientData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AudioServicesAddSystemSoundCompletion';
procedure AudioServicesRemoveSystemSoundCompletion(inSystemSoundID
  : SystemSoundID); cdecl; external libAudioToolbox name _PU +
  'AudioServicesRemoveSystemSoundCompletion';
function MusicDeviceMIDIEvent(inUnit: MusicDeviceComponent; inStatus: UInt32;
  inData1: UInt32; inData2: UInt32; inOffsetSampleFrame: UInt32): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'MusicDeviceMIDIEvent';
function MusicDeviceSysEx(inUnit: MusicDeviceComponent; inData: PByte;
  inLength: UInt32): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicDeviceSysEx';
function MusicDeviceMIDIEventList(inUnit: MusicDeviceComponent;
  inOffsetSampleFrame: UInt32; evtList: PMIDIEventList): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicDeviceMIDIEventList';
function MusicDeviceStartNote(inUnit: MusicDeviceComponent;
  inInstrument: MusicDeviceInstrumentID; inGroupID: MusicDeviceGroupID;
  outNoteInstanceID: PNoteInstanceID; inOffsetSampleFrame: UInt32;
  inParams: PMusicDeviceNoteParams): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicDeviceStartNote';
function MusicDeviceStopNote(inUnit: MusicDeviceComponent;
  inGroupID: MusicDeviceGroupID; inNoteInstanceID: NoteInstanceID;
  inOffsetSampleFrame: UInt32): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicDeviceStopNote';
function MusicDevicePrepareInstrument(inUnit: MusicDeviceComponent;
  inInstrument: MusicDeviceInstrumentID): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicDevicePrepareInstrument';
function MusicDeviceReleaseInstrument(inUnit: MusicDeviceComponent;
  inInstrument: MusicDeviceInstrumentID): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicDeviceReleaseInstrument';
function NewAUGraph(outGraph: PAUGraph): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'NewAUGraph';
function DisposeAUGraph(inGraph: AUGraph): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'DisposeAUGraph';
function AUGraphAddNode(inGraph: AUGraph;
  inDescription: PAudioComponentDescription; outNode: PAUNode): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphAddNode';
function AUGraphRemoveNode(inGraph: AUGraph; inNode: AUNode): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphRemoveNode';
function AUGraphGetNodeCount(inGraph: AUGraph; outNumberOfNodes: PLongWord)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'AUGraphGetNodeCount';
function AUGraphGetIndNode(inGraph: AUGraph; inIndex: UInt32; outNode: PAUNode)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'AUGraphGetIndNode';
function AUGraphNodeInfo(inGraph: AUGraph; inNode: AUNode;
  outDescription: PAudioComponentDescription; outAudioUnit: PAudioUnit)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'AUGraphNodeInfo';
function AUGraphConnectNodeInput(inGraph: AUGraph; inSourceNode: AUNode;
  inSourceOutputNumber: UInt32; inDestNode: AUNode; inDestInputNumber: UInt32)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AUGraphConnectNodeInput';
function AUGraphSetNodeInputCallback(inGraph: AUGraph; inDestNode: AUNode;
  inDestInputNumber: UInt32; inInputCallback: PAURenderCallbackStruct)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'AUGraphSetNodeInputCallback';
function AUGraphDisconnectNodeInput(inGraph: AUGraph; inDestNode: AUNode;
  inDestInputNumber: UInt32): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphDisconnectNodeInput';
function AUGraphClearConnections(inGraph: AUGraph): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphClearConnections';
function AUGraphGetNumberOfInteractions(inGraph: AUGraph;
  outNumInteractions: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphGetNumberOfInteractions';
function AUGraphGetInteractionInfo(inGraph: AUGraph; inInteractionIndex: UInt32;
  outInteraction: PAUNodeInteraction): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphGetInteractionInfo';
function AUGraphCountNodeInteractions(inGraph: AUGraph; inNode: AUNode;
  outNumInteractions: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphCountNodeInteractions';
function AUGraphGetNodeInteractions(inGraph: AUGraph; inNode: AUNode;
  ioNumInteractions: PLongWord; outInteractions: PAUNodeInteraction): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AUGraphGetNodeInteractions';
function AUGraphUpdate(inGraph: AUGraph; outIsUpdated: PBoolean): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AUGraphUpdate';
function AUGraphOpen(inGraph: AUGraph): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphOpen';
function AUGraphClose(inGraph: AUGraph): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphClose';
function AUGraphInitialize(inGraph: AUGraph): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphInitialize';
function AUGraphUninitialize(inGraph: AUGraph): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphUninitialize';
function AUGraphStart(inGraph: AUGraph): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphStart';
function AUGraphStop(inGraph: AUGraph): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphStop';
function AUGraphIsOpen(inGraph: AUGraph; outIsOpen: PBoolean): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphIsOpen';
function AUGraphIsInitialized(inGraph: AUGraph; outIsInitialized: PBoolean)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'AUGraphIsInitialized';
function AUGraphIsRunning(inGraph: AUGraph; outIsRunning: PBoolean): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AUGraphIsRunning';
function AUGraphGetCPULoad(inGraph: AUGraph; outAverageCPULoad: PSingle)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'AUGraphGetCPULoad';
function AUGraphGetMaxCPULoad(inGraph: AUGraph; outMaxLoad: PSingle): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AUGraphGetMaxCPULoad';
function AUGraphAddRenderNotify(inGraph: AUGraph; inCallback: AURenderCallback;
  inRefCon: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphAddRenderNotify';
function AUGraphRemoveRenderNotify(inGraph: AUGraph;
  inCallback: AURenderCallback; inRefCon: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUGraphRemoveRenderNotify';
function AUListenerCreateWithDispatchQueue(outListener: PAUParameterListenerRef;
  inNotificationInterval: Single; inDispatchQueue: dispatch_queue_t;
  inBlock: AUParameterListenerBlock): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUListenerCreateWithDispatchQueue';
function AUListenerCreate(inProc: AUParameterListenerProc; inUserData: Pointer;
  inRunLoop: CFRunLoopRef; inRunLoopMode: CFStringRef;
  inNotificationInterval: Single; outListener: PAUParameterListenerRef)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'AUListenerCreate';
function AUListenerDispose(inListener: AUParameterListenerRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUListenerDispose';
function AUListenerAddParameter(inListener: AUParameterListenerRef;
  inObject: Pointer; inParameter: PAudioUnitParameter): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUListenerAddParameter';
function AUListenerRemoveParameter(inListener: AUParameterListenerRef;
  inObject: Pointer; inParameter: PAudioUnitParameter): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUListenerRemoveParameter';
function AUParameterSet(inSendingListener: AUParameterListenerRef;
  inSendingObject: Pointer; inParameter: PAudioUnitParameter;
  inValue: AudioUnitParameterValue; inBufferOffsetInFrames: UInt32): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'AUParameterSet';
function AUParameterListenerNotify(inSendingListener: AUParameterListenerRef;
  inSendingObject: Pointer; inParameter: PAudioUnitParameter): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUParameterListenerNotify';
function AUEventListenerCreateWithDispatchQueue(outListener
  : PAUEventListenerRef; inNotificationInterval: Single;
  inValueChangeGranularity: Single; inDispatchQueue: dispatch_queue_t;
  inBlock: AUEventListenerBlock): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUEventListenerCreateWithDispatchQueue';
function AUEventListenerCreate(inProc: AUEventListenerProc; inUserData: Pointer;
  inRunLoop: CFRunLoopRef; inRunLoopMode: CFStringRef;
  inNotificationInterval: Single; inValueChangeGranularity: Single;
  outListener: PAUEventListenerRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUEventListenerCreate';
function AUEventListenerAddEventType(inListener: AUEventListenerRef;
  inObject: Pointer; inEvent: PAudioUnitEvent): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUEventListenerAddEventType';
function AUEventListenerRemoveEventType(inListener: AUEventListenerRef;
  inObject: Pointer; inEvent: PAudioUnitEvent): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUEventListenerRemoveEventType';
function AUEventListenerNotify(inSendingListener: AUEventListenerRef;
  inSendingObject: Pointer; inEvent: PAudioUnitEvent): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'AUEventListenerNotify';
function AUParameterValueFromLinear(inLinearValue: Single;
  inParameter: PAudioUnitParameter): AudioUnitParameterValue; cdecl;
  external libAudioToolbox name _PU + 'AUParameterValueFromLinear';
function AUParameterValueToLinear(inParameterValue: AudioUnitParameterValue;
  inParameter: PAudioUnitParameter): Single; cdecl;
  external libAudioToolbox name _PU + 'AUParameterValueToLinear';
function AUParameterFormatValue(inParameterValue: Double;
  inParameter: PAudioUnitParameter; inTextBuffer: MarshaledAString;
  inDigits: UInt32): MarshaledAString; cdecl;
  external libAudioToolbox name _PU + 'AUParameterFormatValue';
function AudioWorkIntervalCreate(name: MarshaledAString; clock: os_clockid_t;
  attr: os_workgroup_attr_t): os_workgroup_interval_t; cdecl;
  external libAudioToolbox name _PU + 'AudioWorkIntervalCreate';
procedure CAShow(inObject: Pointer); cdecl;
  external libAudioToolbox name _PU + 'CAShow';
procedure CAShowFile(inObject: Pointer; inFile: Pointer); cdecl;
  external libAudioToolbox name _PU + 'CAShowFile';
function ExtAudioFileOpenURL(inURL: CFURLRef; outExtAudioFile: PExtAudioFileRef)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'ExtAudioFileOpenURL';
function ExtAudioFileWrapAudioFileID(inFileID: AudioFileID;
  inForWriting: Boolean; outExtAudioFile: PExtAudioFileRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'ExtAudioFileWrapAudioFileID';
function ExtAudioFileCreateWithURL(inURL: CFURLRef; inFileType: AudioFileTypeID;
  inStreamDesc: PInteger; inChannelLayout: PInteger; inFlags: UInt32;
  outExtAudioFile: PExtAudioFileRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'ExtAudioFileCreateWithURL';
function ExtAudioFileDispose(inExtAudioFile: ExtAudioFileRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'ExtAudioFileDispose';
function ExtAudioFileRead(inExtAudioFile: ExtAudioFileRef;
  ioNumberFrames: PLongWord; ioData: PInteger): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'ExtAudioFileRead';
function ExtAudioFileWrite(inExtAudioFile: ExtAudioFileRef;
  inNumberFrames: UInt32; ioData: PInteger): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'ExtAudioFileWrite';
function ExtAudioFileWriteAsync(inExtAudioFile: ExtAudioFileRef;
  inNumberFrames: UInt32; ioData: PInteger): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'ExtAudioFileWriteAsync';
function ExtAudioFileSeek(inExtAudioFile: ExtAudioFileRef; inFrameOffset: Int64)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'ExtAudioFileSeek';
function ExtAudioFileTell(inExtAudioFile: ExtAudioFileRef;
  outFrameOffset: PInt64): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'ExtAudioFileTell';
function ExtAudioFileGetPropertyInfo(inExtAudioFile: ExtAudioFileRef;
  inPropertyID: ExtAudioFilePropertyID; outSize: PLongWord;
  outWritable: PBoolean): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'ExtAudioFileGetPropertyInfo';
function ExtAudioFileGetProperty(inExtAudioFile: ExtAudioFileRef;
  inPropertyID: ExtAudioFilePropertyID; ioPropertyDataSize: PLongWord;
  outPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'ExtAudioFileGetProperty';
function ExtAudioFileSetProperty(inExtAudioFile: ExtAudioFileRef;
  inPropertyID: ExtAudioFilePropertyID; inPropertyDataSize: UInt32;
  inPropertyData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'ExtAudioFileSetProperty';
function NewMusicPlayer(outPlayer: PMusicPlayer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'NewMusicPlayer';
function DisposeMusicPlayer(inPlayer: MusicPlayer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'DisposeMusicPlayer';
function MusicPlayerSetSequence(inPlayer: MusicPlayer;
  inSequence: MusicSequence): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicPlayerSetSequence';
function MusicPlayerGetSequence(inPlayer: MusicPlayer;
  outSequence: PMusicSequence): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicPlayerGetSequence';
function MusicPlayerSetTime(inPlayer: MusicPlayer; inTime: MusicTimeStamp)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'MusicPlayerSetTime';
function MusicPlayerGetTime(inPlayer: MusicPlayer; outTime: PMusicTimeStamp)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'MusicPlayerGetTime';
function MusicPlayerGetHostTimeForBeats(inPlayer: MusicPlayer;
  inBeats: MusicTimeStamp; outHostTime: PUInt64): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicPlayerGetHostTimeForBeats';
function MusicPlayerGetBeatsForHostTime(inPlayer: MusicPlayer;
  inHostTime: UInt64; outBeats: PMusicTimeStamp): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicPlayerGetBeatsForHostTime';
function MusicPlayerPreroll(inPlayer: MusicPlayer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicPlayerPreroll';
function MusicPlayerStart(inPlayer: MusicPlayer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicPlayerStart';
function MusicPlayerStop(inPlayer: MusicPlayer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicPlayerStop';
function MusicPlayerIsPlaying(inPlayer: MusicPlayer; outIsPlaying: PBoolean)
  : OSStatus; cdecl; external libAudioToolbox name _PU + 'MusicPlayerIsPlaying';
function MusicPlayerSetPlayRateScalar(inPlayer: MusicPlayer;
  inScaleRate: Double): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicPlayerSetPlayRateScalar';
function MusicPlayerGetPlayRateScalar(inPlayer: MusicPlayer;
  outScaleRate: PDouble): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicPlayerGetPlayRateScalar';
function NewMusicSequence(outSequence: PMusicSequence): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'NewMusicSequence';
function DisposeMusicSequence(inSequence: MusicSequence): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'DisposeMusicSequence';
function MusicSequenceNewTrack(inSequence: MusicSequence; outTrack: PMusicTrack)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'MusicSequenceNewTrack';
function MusicSequenceDisposeTrack(inSequence: MusicSequence;
  inTrack: MusicTrack): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceDisposeTrack';
function MusicSequenceGetTrackCount(inSequence: MusicSequence;
  outNumberOfTracks: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceGetTrackCount';
function MusicSequenceGetIndTrack(inSequence: MusicSequence;
  inTrackIndex: UInt32; outTrack: PMusicTrack): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceGetIndTrack';
function MusicSequenceGetTrackIndex(inSequence: MusicSequence;
  inTrack: MusicTrack; outTrackIndex: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceGetTrackIndex';
function MusicSequenceGetTempoTrack(inSequence: MusicSequence;
  outTrack: PMusicTrack): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceGetTempoTrack';
function MusicSequenceSetAUGraph(inSequence: MusicSequence; inGraph: AUGraph)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'MusicSequenceSetAUGraph';
function MusicSequenceGetAUGraph(inSequence: MusicSequence; outGraph: PAUGraph)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'MusicSequenceGetAUGraph';
function MusicSequenceSetMIDIEndpoint(inSequence: MusicSequence;
  inEndpoint: MIDIEndpointRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceSetMIDIEndpoint';
function MusicSequenceSetSequenceType(inSequence: MusicSequence;
  inType: MusicSequenceType): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceSetSequenceType';
function MusicSequenceGetSequenceType(inSequence: MusicSequence;
  outType: PMusicSequenceType): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceGetSequenceType';
function MusicSequenceFileLoad(inSequence: MusicSequence; inFileRef: CFURLRef;
  inFileTypeHint: MusicSequenceFileTypeID; inFlags: MusicSequenceLoadFlags)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'MusicSequenceFileLoad';
function MusicSequenceFileLoadData(inSequence: MusicSequence; inData: CFDataRef;
  inFileTypeHint: MusicSequenceFileTypeID; inFlags: MusicSequenceLoadFlags)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'MusicSequenceFileLoadData';
function MusicSequenceSetSMPTEResolution(fps: SignedByte; ticks: Byte): Int16;
  cdecl; external libAudioToolbox name _PU + 'MusicSequenceSetSMPTEResolution';
procedure MusicSequenceGetSMPTEResolution(inRes: Int16; fps: PSignedByte;
  ticks: PByte); cdecl; external libAudioToolbox name _PU +
  'MusicSequenceGetSMPTEResolution';
function MusicSequenceFileCreate(inSequence: MusicSequence; inFileRef: CFURLRef;
  inFileType: MusicSequenceFileTypeID; inFlags: MusicSequenceFileFlags;
  inResolution: Int16): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceFileCreate';
function MusicSequenceFileCreateData(inSequence: MusicSequence;
  inFileType: MusicSequenceFileTypeID; inFlags: MusicSequenceFileFlags;
  inResolution: Int16; outData: PCFDataRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceFileCreateData';
function MusicSequenceReverse(inSequence: MusicSequence): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceReverse';
function MusicSequenceGetSecondsForBeats(inSequence: MusicSequence;
  inBeats: MusicTimeStamp; outSeconds: PDouble): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceGetSecondsForBeats';
function MusicSequenceGetBeatsForSeconds(inSequence: MusicSequence;
  inSeconds: Double; outBeats: PMusicTimeStamp): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceGetBeatsForSeconds';
function MusicSequenceSetUserCallback(inSequence: MusicSequence;
  inCallback: MusicSequenceUserCallback; inClientData: Pointer): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'MusicSequenceSetUserCallback';
function MusicSequenceBeatsToBarBeatTime(inSequence: MusicSequence;
  inBeats: MusicTimeStamp; inSubbeatDivisor: UInt32;
  outBarBeatTime: PCABarBeatTime): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceBeatsToBarBeatTime';
function MusicSequenceBarBeatTimeToBeats(inSequence: MusicSequence;
  inBarBeatTime: PCABarBeatTime; outBeats: PMusicTimeStamp): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceBarBeatTimeToBeats';
function MusicSequenceGetInfoDictionary(inSequence: MusicSequence)
  : CFDictionaryRef; cdecl; external libAudioToolbox name _PU +
  'MusicSequenceGetInfoDictionary';
function MusicTrackGetSequence(inTrack: MusicTrack; outSequence: PMusicSequence)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'MusicTrackGetSequence';
function MusicTrackSetDestNode(inTrack: MusicTrack; inNode: AUNode): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'MusicTrackSetDestNode';
function MusicTrackSetDestMIDIEndpoint(inTrack: MusicTrack;
  inEndpoint: MIDIEndpointRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackSetDestMIDIEndpoint';
function MusicTrackGetDestNode(inTrack: MusicTrack; outNode: PAUNode): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'MusicTrackGetDestNode';
function MusicTrackGetDestMIDIEndpoint(inTrack: MusicTrack;
  outEndpoint: PMIDIEndpointRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackGetDestMIDIEndpoint';
function MusicTrackSetProperty(inTrack: MusicTrack; inPropertyID: UInt32;
  inData: Pointer; inLength: UInt32): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackSetProperty';
function MusicTrackGetProperty(inTrack: MusicTrack; inPropertyID: UInt32;
  outData: Pointer; ioLength: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackGetProperty';
function MusicTrackMoveEvents(inTrack: MusicTrack; inStartTime: MusicTimeStamp;
  inEndTime: MusicTimeStamp; inMoveTime: MusicTimeStamp): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackMoveEvents';
function MusicTrackClear(inTrack: MusicTrack; inStartTime: MusicTimeStamp;
  inEndTime: MusicTimeStamp): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackClear';
function MusicTrackCut(inTrack: MusicTrack; inStartTime: MusicTimeStamp;
  inEndTime: MusicTimeStamp): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackCut';
function MusicTrackCopyInsert(inSourceTrack: MusicTrack;
  inSourceStartTime: MusicTimeStamp; inSourceEndTime: MusicTimeStamp;
  inDestTrack: MusicTrack; inDestInsertTime: MusicTimeStamp): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackCopyInsert';
function MusicTrackMerge(inSourceTrack: MusicTrack;
  inSourceStartTime: MusicTimeStamp; inSourceEndTime: MusicTimeStamp;
  inDestTrack: MusicTrack; inDestInsertTime: MusicTimeStamp): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackMerge';
function MusicTrackNewMIDINoteEvent(inTrack: MusicTrack;
  inTimeStamp: MusicTimeStamp; inMessage: PMIDINoteMessage): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackNewMIDINoteEvent';
function MusicTrackNewMIDIChannelEvent(inTrack: MusicTrack;
  inTimeStamp: MusicTimeStamp; inMessage: PMIDIChannelMessage): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackNewMIDIChannelEvent';
function MusicTrackNewMIDIRawDataEvent(inTrack: MusicTrack;
  inTimeStamp: MusicTimeStamp; inRawData: PMIDIRawData): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackNewMIDIRawDataEvent';
function MusicTrackNewExtendedNoteEvent(inTrack: MusicTrack;
  inTimeStamp: MusicTimeStamp; inInfo: PExtendedNoteOnEvent): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackNewExtendedNoteEvent';
function MusicTrackNewParameterEvent(inTrack: MusicTrack;
  inTimeStamp: MusicTimeStamp; inInfo: PParameterEvent): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackNewParameterEvent';
function MusicTrackNewExtendedTempoEvent(inTrack: MusicTrack;
  inTimeStamp: MusicTimeStamp; inBPM: Double): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackNewExtendedTempoEvent';
function MusicTrackNewMetaEvent(inTrack: MusicTrack;
  inTimeStamp: MusicTimeStamp; inMetaEvent: PMIDIMetaEvent): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackNewMetaEvent';
function MusicTrackNewUserEvent(inTrack: MusicTrack;
  inTimeStamp: MusicTimeStamp; inUserData: PMusicEventUserData): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'MusicTrackNewUserEvent';
function MusicTrackNewAUPresetEvent(inTrack: MusicTrack;
  inTimeStamp: MusicTimeStamp; inPresetEvent: PAUPresetEvent): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicTrackNewAUPresetEvent';
function NewMusicEventIterator(inTrack: MusicTrack;
  outIterator: PMusicEventIterator): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'NewMusicEventIterator';
function DisposeMusicEventIterator(inIterator: MusicEventIterator): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'DisposeMusicEventIterator';
function MusicEventIteratorSeek(inIterator: MusicEventIterator;
  inTimeStamp: MusicTimeStamp): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicEventIteratorSeek';
function MusicEventIteratorNextEvent(inIterator: MusicEventIterator): OSStatus;
  cdecl; external libAudioToolbox name _PU + 'MusicEventIteratorNextEvent';
function MusicEventIteratorPreviousEvent(inIterator: MusicEventIterator)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'MusicEventIteratorPreviousEvent';
function MusicEventIteratorGetEventInfo(inIterator: MusicEventIterator;
  outTimeStamp: PMusicTimeStamp; outEventType: PMusicEventType;
  outEventData: Pointer; outEventDataSize: PLongWord): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicEventIteratorGetEventInfo';
function MusicEventIteratorSetEventInfo(inIterator: MusicEventIterator;
  inEventType: MusicEventType; inEventData: Pointer): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicEventIteratorSetEventInfo';
function MusicEventIteratorSetEventTime(inIterator: MusicEventIterator;
  inTimeStamp: MusicTimeStamp): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicEventIteratorSetEventTime';
function MusicEventIteratorDeleteEvent(inIterator: MusicEventIterator)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'MusicEventIteratorDeleteEvent';
function MusicEventIteratorHasPreviousEvent(inIterator: MusicEventIterator;
  outHasPrevEvent: PBoolean): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicEventIteratorHasPreviousEvent';
function MusicEventIteratorHasNextEvent(inIterator: MusicEventIterator;
  outHasNextEvent: PBoolean): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicEventIteratorHasNextEvent';
function MusicEventIteratorHasCurrentEvent(inIterator: MusicEventIterator;
  outHasCurEvent: PBoolean): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicEventIteratorHasCurrentEvent';
function MusicSequenceLoadSMFData(inSequence: MusicSequence; inData: CFDataRef)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'MusicSequenceLoadSMFData';
function MusicSequenceLoadSMFWithFlags(inSequence: MusicSequence;
  inFileRef: Pointer; inFlags: MusicSequenceLoadFlags): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceLoadSMFWithFlags';
function MusicSequenceLoadSMFDataWithFlags(inSequence: MusicSequence;
  inData: CFDataRef; inFlags: MusicSequenceLoadFlags): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceLoadSMFDataWithFlags';
function MusicSequenceSaveMIDIFile(inSequence: MusicSequence;
  inParentDirectory: Pointer; inFileName: CFStringRef; inResolution: UInt16;
  inFlags: UInt32): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceSaveMIDIFile';
function MusicSequenceSaveSMFData(inSequence: MusicSequence;
  outData: PCFDataRef; inResolution: UInt16): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'MusicSequenceSaveSMFData';
function NewMusicTrackFrom(inSourceTrack: MusicTrack;
  inSourceStartTime: MusicTimeStamp; inSourceEndTime: MusicTimeStamp;
  outNewTrack: PMusicTrack): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'NewMusicTrackFrom';
function CopyNameFromSoundBank(inURL: CFURLRef; outName: PCFStringRef)
  : OSStatus; cdecl; external libAudioToolbox name _PU +
  'CopyNameFromSoundBank';
function CopyInstrumentInfoFromSoundBank(inURL: CFURLRef;
  outInstrumentInfo: PCFArrayRef): OSStatus; cdecl;
  external libAudioToolbox name _PU + 'CopyInstrumentInfoFromSoundBank';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AudioToolboxModule: THandle;

{$ENDIF IOS}

function kAudioComponentRegistrationsChangedNotification: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioComponentRegistrationsChangedNotification');
end;

function kAudioComponentInstanceInvalidationNotification: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioComponentInstanceInvalidationNotification');
end;

function kAudioSession_RouteChangeKey_Reason: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSession_RouteChangeKey_Reason');
end;

function kAudioSession_AudioRouteChangeKey_PreviousRouteDescription: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSession_AudioRouteChangeKey_PreviousRouteDescription');
end;

function kAudioSession_AudioRouteChangeKey_CurrentRouteDescription: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSession_AudioRouteChangeKey_CurrentRouteDescription');
end;

function kAudioSession_AudioRouteKey_Inputs: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSession_AudioRouteKey_Inputs');
end;

function kAudioSession_AudioRouteKey_Outputs: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSession_AudioRouteKey_Outputs');
end;

function kAudioSession_AudioRouteKey_Type: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSession_AudioRouteKey_Type');
end;

function kAudioSessionInputRoute_LineIn: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSessionInputRoute_LineIn');
end;

function kAudioSessionInputRoute_BuiltInMic: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSessionInputRoute_BuiltInMic');
end;

function kAudioSessionInputRoute_HeadsetMic: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSessionInputRoute_HeadsetMic');
end;

function kAudioSessionInputRoute_BluetoothHFP: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSessionInputRoute_BluetoothHFP');
end;

function kAudioSessionInputRoute_USBAudio: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSessionInputRoute_USBAudio');
end;

function kAudioSessionOutputRoute_LineOut: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSessionOutputRoute_LineOut');
end;

function kAudioSessionOutputRoute_Headphones: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSessionOutputRoute_Headphones');
end;

function kAudioSessionOutputRoute_BluetoothHFP: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSessionOutputRoute_BluetoothHFP');
end;

function kAudioSessionOutputRoute_BluetoothA2DP: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSessionOutputRoute_BluetoothA2DP');
end;

function kAudioSessionOutputRoute_BuiltInReceiver: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSessionOutputRoute_BuiltInReceiver');
end;

function kAudioSessionOutputRoute_BuiltInSpeaker: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSessionOutputRoute_BuiltInSpeaker');
end;

function kAudioSessionOutputRoute_USBAudio: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSessionOutputRoute_USBAudio');
end;

function kAudioSessionOutputRoute_HDMI: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox, 'kAudioSessionOutputRoute_HDMI');
end;

function kAudioSessionOutputRoute_AirPlay: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSessionOutputRoute_AirPlay');
end;

function kAudioSession_InputSourceKey_ID: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSession_InputSourceKey_ID');
end;

function kAudioSession_InputSourceKey_Description: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSession_InputSourceKey_Description');
end;

function kAudioSession_OutputDestinationKey_ID: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSession_OutputDestinationKey_ID');
end;

function kAudioSession_OutputDestinationKey_Description: Pointer;
begin
  Result := CocoaPointerConst(libAudioToolbox,
    'kAudioSession_OutputDestinationKey_Description');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

AudioToolboxModule := dlopen(MarshaledAString(libAudioToolbox), RTLD_LAZY);

finalization

dlclose(AudioToolboxModule);
{$ENDIF IOS}

end.
