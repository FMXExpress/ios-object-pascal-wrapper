{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework AudioUnit
//

unit iOSapi.AudioUnit;

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
  iOSapi.CoreAudio,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  kAudioComponentFlag_Unsearchable = 1;
  kAudioComponentFlag_SandboxSafe = 2;
  kAudioComponentFlag_IsV3AudioUnit = 4;
  kAudioComponentFlag_RequiresAsyncInstantiation = 8;
  kAudioComponentFlag_CanLoadInProcess = 16;
  kAudioComponentInstantiation_LoadOutOfProcess = 1;
  kAudioComponentInstantiation_LoadInProcess = 2;
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
  kAudioComponentErr_InstanceInvalidated = -66749;
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
  kAudioOutputUnitProperty_IsRunning = 2001;
  kAudioUnitProperty_SampleRateConverterComplexity = 3014;
  kAudioUnitSampleRateConverterComplexity_Linear = 1818848869;
  kAudioUnitSampleRateConverterComplexity_Normal = 1852797549;
  kAudioUnitSampleRateConverterComplexity_Mastering = 1650553971;
  kAudioOutputUnitProperty_CurrentDevice = 2000;
  kAudioOutputUnitProperty_ChannelMap = 2002;
  kAudioOutputUnitProperty_EnableIO = 2003;
  kAudioOutputUnitProperty_StartTime = 2004;
  kAudioOutputUnitProperty_SetInputCallback = 2005;
  kAudioOutputUnitProperty_HasIO = 2006;
  kAudioOutputUnitProperty_StartTimestampsAtZero = 2007;
  kAudioOutputUnitProperty_MIDICallbacks = 2010;
  kAudioOutputUnitProperty_HostReceivesRemoteControlEvents = 2011;
  kAudioOutputUnitProperty_RemoteControlToHost = 2012;
  kAudioOutputUnitProperty_HostTransportState = 2013;
  kAudioOutputUnitProperty_NodeComponentDescription = 2014;
  kAUVoiceIOProperty_BypassVoiceProcessing = 2100;
  kAUVoiceIOProperty_VoiceProcessingEnableAGC = 2101;
  kAUVoiceIOProperty_MuteOutput = 2104;
  kAUVoiceIOProperty_DuckNonVoiceAudio = 2102;
  kAUVoiceIOProperty_VoiceProcessingQuality = 2103;
  kAUNBandEQProperty_NumberOfBands = 2200;
  kAUNBandEQProperty_MaxNumberOfBands = 2201;
  kAUNBandEQProperty_BiquadCoefficients = 2203;
  kAudioUnitProperty_MeteringMode = 3007;
  kAudioUnitProperty_MatrixLevels = 3006;
  kAudioUnitProperty_MatrixDimensions = 3009;
  kAudioUnitProperty_MeterClipping = 3011;
  kAudioUnitProperty_ReverbRoomType = 10;
  kAudioUnitProperty_UsesInternalReverb = 1005;
  kAudioUnitProperty_SpatializationAlgorithm = 3000;
  kAudioUnitProperty_SpatialMixerDistanceParams = 3010;
  kAudioUnitProperty_SpatialMixerAttenuationCurve = 3013;
  kAudioUnitProperty_SpatialMixerRenderingFlags = 3003;
  kSpatializationAlgorithm_EqualPowerPanning = 0;
  kSpatializationAlgorithm_SphericalHead = 1;
  kSpatializationAlgorithm_HRTF = 2;
  kSpatializationAlgorithm_SoundField = 3;
  kSpatializationAlgorithm_VectorBasedPanning = 4;
  kSpatializationAlgorithm_StereoPassThrough = 5;
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
  kAudioOutputUnitRange = 512;
  kAudioOutputUnitStartSelect = 513;
  kAudioOutputUnitStopSelect = 514;
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
  k3DMixerParam_Enable = 5;
  k3DMixerParam_MinGain = 6;
  k3DMixerParam_MaxGain = 7;
  k3DMixerParam_ReverbBlend = 8;
  k3DMixerParam_GlobalReverbGain = 9;
  k3DMixerParam_OcclusionAttenuation = 10;
  k3DMixerParam_ObstructionAttenuation = 11;
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
  kNewTimePitchParam_Rate = 0;
  kNewTimePitchParam_Pitch = 1;
  kNewTimePitchParam_Overlap = 4;
  kNewTimePitchParam_EnablePeakLocking = 6;
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
  kDynamicsProcessorParam_MasterGain = 6;
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
  AUAudioUnit = interface;
  AUAudioUnitV2Bridge = interface;

  // ===== Framework typedefs =====
{$M+}
  AudioComponentFlags = UInt32;
  AudioComponentInstantiationOptions = UInt32;
  FourCharCode = UInt32;
  OSType = FourCharCode;

  AudioComponentDescription = record
    componentType: OSType;
    componentSubType: OSType;
    componentManufacturer: OSType;
    componentFlags: UInt32;
    componentFlagsMask: UInt32;
  end;

  PAudioComponentDescription = ^AudioComponentDescription;

  AudioComponent = Pointer;
  AudioComponentInstance = Pointer;
  OSStatus = Int32;
  AudioComponentMethod = function(param1: Pointer): OSStatus; cdecl;
  TAudioUnitOpen = function(param1: Pointer; param2: AudioComponentInstance)
    : OSStatus; cdecl;
  TAudioUnitClose = function(param1: Pointer): OSStatus; cdecl;
  TAudioUnitLookup = function(param1: Int16): AudioComponentMethod; cdecl;

  AudioComponentPlugInInterface = record
    Open: TAudioUnitOpen;
    Close: TAudioUnitClose;
    Lookup: TAudioUnitLookup;
    reserved: Pointer;
  end;

  PAudioComponentPlugInInterface = ^AudioComponentPlugInInterface;

  AudioComponentFactoryFunction = function(param1: Pointer): Pointer; cdecl;
  TAudioUnitInCompletionHandler = procedure(param1: AudioComponentInstance;
    param2: OSStatus) of object;
  Boolean = Byte;
  CFStringRef = Pointer;
  AudioComponentValidationResult = UInt32;
  CFDictionaryRef = Pointer;
  AudioUnit = AudioComponentInstance;
  AudioUnitRenderActionFlags = UInt32;
  AudioUnitPropertyID = UInt32;
  AudioUnitScope = UInt32;
  AudioUnitElement = UInt32;
  AudioUnitParameterID = UInt32;
  AudioUnitParameterValue = Single;
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

  AURenderCallback = function(param1: Pointer; param2: UInt32; param3: Pointer;
    param4: UInt32; param5: UInt32; param6: Pointer): OSStatus; cdecl;
  AudioUnitPropertyListenerProc = procedure(param1: Pointer; param2: AudioUnit;
    param3: AudioUnitPropertyID; param4: AudioUnitScope;
    param5: AudioUnitElement); cdecl;
  AUInputSamplesInOutputCallback = procedure(param1: Pointer; param2: Pointer;
    param3: Double; param4: Double); cdecl;
  CFTimeInterval = Double;
  CFAbsoluteTime = CFTimeInterval;
  AudioUnitInitializeProc = function(param1: Pointer): OSStatus; cdecl;
  AudioUnitUninitializeProc = function(param1: Pointer): OSStatus; cdecl;
  AudioUnitGetPropertyInfoProc = function(param1: Pointer;
    param2: AudioUnitPropertyID; param3: AudioUnitScope;
    param4: AudioUnitElement; param5: PLongWord; param6: PByte)
    : OSStatus; cdecl;
  AudioUnitGetPropertyProc = function(param1: Pointer;
    param2: AudioUnitPropertyID; param3: AudioUnitScope;
    param4: AudioUnitElement; param5: Pointer; param6: PLongWord)
    : OSStatus; cdecl;
  AudioUnitSetPropertyProc = function(param1: Pointer;
    param2: AudioUnitPropertyID; param3: AudioUnitScope;
    param4: AudioUnitElement; param5: Pointer; param6: UInt32): OSStatus; cdecl;
  AudioUnitAddPropertyListenerProc = function(param1: Pointer;
    param2: AudioUnitPropertyID; param3: AudioUnitPropertyListenerProc;
    param4: Pointer): OSStatus; cdecl;
  AudioUnitRemovePropertyListenerProc = function(param1: Pointer;
    param2: AudioUnitPropertyID; param3: AudioUnitPropertyListenerProc)
    : OSStatus; cdecl;
  AudioUnitRemovePropertyListenerWithUserDataProc = function(param1: Pointer;
    param2: AudioUnitPropertyID; param3: AudioUnitPropertyListenerProc;
    param4: Pointer): OSStatus; cdecl;
  AudioUnitAddRenderNotifyProc = function(param1: Pointer;
    param2: AURenderCallback; param3: Pointer): OSStatus; cdecl;
  AudioUnitRemoveRenderNotifyProc = function(param1: Pointer;
    param2: AURenderCallback; param3: Pointer): OSStatus; cdecl;
  AudioUnitScheduleParametersProc = function(param1: Pointer; param2: Pointer;
    param3: UInt32): OSStatus; cdecl;
  AudioUnitResetProc = function(param1: Pointer; param2: AudioUnitScope;
    param3: AudioUnitElement): OSStatus; cdecl;
  AudioUnitComplexRenderProc = function(param1: Pointer; param2: UInt32;
    param3: Pointer; param4: UInt32; param5: UInt32; param6: PLongWord;
    param7: Pointer; param8: Pointer; param9: Pointer; param10: PLongWord)
    : OSStatus; cdecl;
  AudioUnitProcessProc = function(param1: Pointer; param2: UInt32;
    param3: Pointer; param4: UInt32; param5: Pointer): OSStatus; cdecl;
  AudioUnitProcessMultipleProc = function(param1: Pointer; param2: UInt32;
    param3: Pointer; param4: UInt32; param5: UInt32; param6: Pointer;
    param7: UInt32; param8: Pointer): OSStatus; cdecl;
  AudioUnitGetParameterProc = function(param1: Pointer;
    param2: AudioUnitParameterID; param3: AudioUnitScope;
    param4: AudioUnitElement; param5: PSingle): OSStatus; cdecl;
  AudioUnitSetParameterProc = function(param1: Pointer;
    param2: AudioUnitParameterID; param3: AudioUnitScope;
    param4: AudioUnitElement; param5: AudioUnitParameterValue; param6: UInt32)
    : OSStatus; cdecl;
  AudioUnitRenderProc = function(param1: Pointer; param2: UInt32;
    param3: Pointer; param4: UInt32; param5: UInt32; param6: Pointer)
    : OSStatus; cdecl;

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
  HostCallback_GetMusicalTimeLocation = function(param1: Pointer;
    param2: PLongWord; param3: PSingle; param4: PLongWord; param5: PDouble)
    : OSStatus; cdecl;
  HostCallback_GetTransportState = function(param1: Pointer; param2: PByte;
    param3: PByte; param4: PDouble; param5: PByte; param6: PDouble;
    param7: PDouble): OSStatus; cdecl;
  HostCallback_GetTransportState2 = function(param1: Pointer; param2: PByte;
    param3: PByte; param4: PByte; param5: PDouble; param6: PByte;
    param7: PDouble; param8: PDouble): OSStatus; cdecl;

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

  AudioUnitParameterStringFromValue = record
    inParamID: AudioUnitParameterID;
    inValue: PSingle;
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
  TAudioUnitMIDIEventProc = procedure(param1: Pointer; param2: UInt32;
    param3: UInt32; param4: UInt32; param5: UInt32); cdecl;
  TAudioUnitMIDISysExProc = procedure(param1: Pointer; param2: PByte;
    param3: UInt32); cdecl;

  AudioOutputUnitMIDICallbacks = record
    userData: Pointer;
    MIDIEventProc: TAudioUnitMIDIEventProc;
    MIDISysExProc: TAudioUnitMIDISysExProc;
  end;

  PAudioOutputUnitMIDICallbacks = ^AudioOutputUnitMIDICallbacks;

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

AudioOutputUnitStartAtTimeParams = record mTimestamp: AudioTimeStamp;
mFlags:
UInt32;
end;
PAudioOutputUnitStartAtTimeParams = ^AudioOutputUnitStartAtTimeParams;

AudioUnitMeterClipping = record peakValueSinceLastCall: Single;
sawInfinity:
Boolean;
sawNotANumber:
Boolean;
end;
PAudioUnitMeterClipping = ^AudioUnitMeterClipping;

AUSpatializationAlgorithm = UInt32;
AUReverbRoomType = UInt32;
AUSpatialMixerAttenuationCurve = UInt32;

MixerDistanceParams = record mReferenceDistance: Single;
mMaxDistance:
Single;
mMaxAttenuation:
Single;
end;
PMixerDistanceParams = ^MixerDistanceParams;

AUSpatialMixerRenderingFlags = UInt32;
AU3DMixerRenderingFlags = UInt32;
AU3DMixerAttenuationCurve = UInt32;
AUScheduledAudioSliceFlags = UInt32;
ScheduledAudioSliceCompletionProc =
procedure(param1: Pointer; param2: Pointer);
cdecl;

ScheduledAudioSlice = record mTimestamp: AudioTimeStamp;
mCompletionProc:
ScheduledAudioSliceCompletionProc;
mCompletionProcUserData:
Pointer;
mFlags:
AUScheduledAudioSliceFlags;
mReserved:
UInt32;
mReserved2:
Pointer;
mNumberFrames:
UInt32;
mBufferList:
Pointer;
end;
PScheduledAudioSlice = ^ScheduledAudioSlice;

ScheduledAudioFileRegionCompletionProc =
procedure(param1: Pointer; param2: Pointer; param3: OSStatus);
cdecl;

ScheduledAudioFileRegion = record mTimestamp: AudioTimeStamp;
mCompletionProc:
ScheduledAudioFileRegionCompletionProc;
mCompletionProcUserData:
Pointer;
mAudioFile:
Pointer;
mLoopCount:
UInt32;
mStartFrame:
Int64;
mFramesToPlay:
UInt32;
end;
PScheduledAudioFileRegion = ^ScheduledAudioFileRegion;

CFURLRef = Pointer;

AUSamplerInstrumentData = record fileURL: CFURLRef;
instrumentType:
Byte;
bankMSB:
Byte;
bankLSB:
Byte;
presetID:
Byte;
end;
PAUSamplerInstrumentData = ^AUSamplerInstrumentData;

AUSamplerBankPresetData = record bankURL: CFURLRef;
bankMSB:
Byte;
bankLSB:
Byte;
presetID:
Byte;
reserved:
Byte;
end;
PAUSamplerBankPresetData = ^AUSamplerBankPresetData;

AUValue = Single;
PAUValue = ^AUValue;

AUParameterAddress = UInt64;

AURecordedParameterEvent = record hostTime: UInt64;
address:
AUParameterAddress;
value:
AUValue;
end;
PAURecordedParameterEvent = ^AURecordedParameterEvent;

AUParameterObserver =
procedure(param1: AUParameterAddress; param2: AUValue) of object;
NSInteger = Integer;
AUParameterRecordingObserver =
procedure(param1: NSInteger; param2: Pointer) of object;
AUParameterObserverToken = Pointer;
AUAudioUnitStatus = OSStatus;
AUEventSampleTime = Int64;
AUAudioFrameCount = LongWord;
AUAudioChannelCount = LongWord;
AUAudioUnitBusType = NSInteger;
AURenderPullInputBlock =
function(param1: UInt32; param2: Pointer; param3: AUAudioFrameCount;
  param4: NSInteger; param5: Pointer): AUAudioUnitStatus;
cdecl;
AURenderBlock =
function(param1: UInt32; param2: Pointer; param3: AUAudioFrameCount;
  param4: NSInteger; param5: Pointer; param6: AURenderPullInputBlock)
  : AUAudioUnitStatus;
cdecl;
AURenderObserver =
procedure(param1: AudioUnitRenderActionFlags; param2: Pointer;
  param3: AUAudioFrameCount; param4: NSInteger) of object;
AUScheduleParameterBlock =
procedure(param1: AUEventSampleTime; param2: AUAudioFrameCount;
  param3: AUParameterAddress; param4: AUValue) of object;
AUScheduleMIDIEventBlock =
procedure(param1: AUEventSampleTime; param2: Byte; param3: NSInteger;
  param4: PByte) of object;
AUHostMusicalContextBlock =
function(param1: PDouble; param2: PDouble; param3: PInteger; param4: PDouble;
  param5: PInteger; param6: PDouble): Boolean;
cdecl;
NSUInteger = Cardinal;
AUHostTransportStateFlags = NSUInteger;
AUHostTransportStateBlock =
function(param1: NSUInteger; param2: PDouble; param3: PDouble; param4: PDouble)
  : Boolean;
cdecl;
TAudioUnitCompletionHandler =
procedure(param1: AUAudioUnit; param2: NSError) of object;
NSTimeInterval = Double;
AUInputHandler =
procedure(param1: UInt32; param2: Pointer; param3: AUAudioFrameCount;
  param4: NSInteger) of object;
NSKeyValueObservingOptions = NSUInteger;
AURenderEventType = Byte;

AURenderEventHeader = record Pointer eventSampleTime: AUEventSampleTime;
eventType:
AURenderEventType;
reserved:
Byte;
end;
PAURenderEventHeader = ^AURenderEventHeader;

AUParameterEvent = record Pointer eventSampleTime: AUEventSampleTime;
eventType:
AURenderEventType;
reserved:
array [0 .. 2] of Byte;
rampDurationSampleFrames:
AUAudioFrameCount;
parameterAddress:
AUParameterAddress;
value:
AUValue;
end;
PAUParameterEvent = ^AUParameterEvent;

AUMIDIEvent = record Pointer eventSampleTime: AUEventSampleTime;
eventType:
AURenderEventType;
reserved:
Byte;
length:
Word;
cable:
Byte;
data:
array [0 .. 2] of Byte;
end;
PAUMIDIEvent = ^AUMIDIEvent;

AURenderEvent = record
case Integer of
  0:
    (head: AURenderEventHeader);
  1:
    (parameter: AUParameterEvent);
  2:
    (MIDI: AUMIDIEvent);
end;
PAURenderEvent = ^AURenderEvent;

AUInternalRenderBlock =
function(param1: UInt32; param2: Pointer; param3: AUAudioFrameCount;
  param4: NSInteger; param5: Pointer; param6: AURenderEvent;
  param7: AURenderPullInputBlock): AUAudioUnitStatus;
cdecl;
AUImplementorValueObserver =
procedure(param1: AUParameter; param2: AUValue) of object;
AUImplementorValueProvider =
function(param1: AUParameter): AUValue;
cdecl;
AUImplementorStringFromValueCallback =
function(param1: AUParameter; param2: PSingle): NSString;
cdecl;
AUImplementorValueFromStringCallback =
function(param1: AUParameter; param2: NSString): AUValue;
cdecl;
AUImplementorDisplayNameWithLengthCallback =
function(param1: AUParameterNode; param2: NSInteger): NSString;
cdecl;
AudioOutputUnitStartProc =
function(param1: Pointer): OSStatus;
cdecl;
AudioOutputUnitStopProc =
function(param1: Pointer): OSStatus;
cdecl;
MusicDeviceInstrumentID = UInt32;

MusicDeviceStdNoteParams = record argCount: UInt32;
mPitch:
Single;
mVelocity:
Single;
end;
PMusicDeviceStdNoteParams = ^MusicDeviceStdNoteParams;

NoteParamsControlValue = record mID: AudioUnitParameterID;
mValue:
AudioUnitParameterValue;
end;
PNoteParamsControlValue = ^NoteParamsControlValue;

MusicDeviceNoteParams = record argCount: UInt32;
mPitch:
Single;
mVelocity:
Single;
mControls:
array [0 .. 0] of NoteParamsControlValue;
end;
PMusicDeviceNoteParams = ^MusicDeviceNoteParams;

MusicDeviceGroupID = UInt32;
NoteInstanceID = UInt32;
MusicDeviceComponent = AudioComponentInstance;
MusicDeviceMIDIEventProc =
function(param1: Pointer; param2: UInt32; param3: UInt32; param4: UInt32;
  param5: UInt32): OSStatus;
cdecl;
MusicDeviceSysExProc =
function(param1: Pointer; param2: PByte; param3: UInt32): OSStatus;
cdecl;
MusicDeviceStartNoteProc =
function(param1: Pointer; param2: MusicDeviceInstrumentID;
  param3: MusicDeviceGroupID; param4: PLongWord; param5: UInt32;
  param6: Pointer): OSStatus;
cdecl;
MusicDeviceStopNoteProc =
function(param1: Pointer; param2: MusicDeviceGroupID; param3: NoteInstanceID;
  param4: UInt32): OSStatus;
cdecl;
// ===== Interface declarations =====

AUParameterNodeClass = interface(NSObjectClass)
  ['{09BCDBE3-F464-4B92-96AF-441D22F27793}']
end;
AUParameterNode = interface(NSObject)['{3C982650-96DD-4735-B70C-66DE77FFEBCE}']
function identifier: NSString;
cdecl;

function keyPath: NSString; cdecl;
  function displayName: NSString; cdecl;
    function displayNameWithLength(maximumLength: NSInteger): NSString; cdecl;
      function tokenByAddingParameterObserver(observer: AUParameterObserver)
        : AUParameterObserverToken; cdecl;
        function tokenByAddingParameterRecordingObserver
          (observer: AUParameterRecordingObserver)
          : AUParameterObserverToken; cdecl;
          procedure removeParameterObserver
            (token: AUParameterObserverToken); cdecl;
            procedure setImplementorValueObserver(implementorValueObserver
              : AUImplementorValueObserver); cdecl;
              function implementorValueObserver
                : AUImplementorValueObserver; cdecl;
                procedure setImplementorValueProvider(implementorValueProvider
                  : AUImplementorValueProvider); cdecl;
                  function implementorValueProvider
                    : AUImplementorValueProvider; cdecl;
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
                              : AUImplementorDisplayNameWithLengthCallback);
                              cdecl;
                              function implementorDisplayNameWithLengthCallback
                                : AUImplementorDisplayNameWithLengthCallback;
                                cdecl;
                              end;

                          TAUParameterNode = class
                            (TOCGenericImport<AUParameterNodeClass,
                            AUParameterNode>)
                          end;
                      PAUParameterNode = Pointer;

                      AUParameterClass = interface(AUParameterNodeClass)
                        ['{41C8453B-B595-4AFE-BB67-8A4883EE10E2}']
                      end;
                  AUParameter = interface(AUParameterNode)
                    ['{FF42E4E1-B8F7-4B57-9AF7-471D926194A4}']
                  function minValue: AUValue;
                  cdecl;
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
                                      procedure setValueOriginator
                                        (value: AUValue;
                                        originator
                                        : AUParameterObserverToken); cdecl;
                                      [MethodName
                                        ('setValue:originator:atHostTime:')]
                                        procedure setValueOriginatorAtHostTime
                                        (value: AUValue;
                                        originator: AUParameterObserverToken;
                                        atHostTime: UInt64); cdecl;
                                        function stringFromValue(value: PSingle)
                                        : NSString; cdecl;
                                        function valueFromString
                                        (&string: NSString): AUValue; cdecl;
                                        end;

                                        TAUParameter = class
                                        (TOCGenericImport<AUParameterClass,
                                        AUParameter>)
                                        end;
                                    PAUParameter = Pointer;

                                    AUParameterGroupClass = interface
                                      (AUParameterNodeClass)
                                      ['{6126791A-B32D-4CFC-AA55-76C72CD4498E}']
                                    end;
                                AUParameterGroup = interface(AUParameterNode)
                                  ['{D5427396-826C-418E-B84F-7FDBE821E6DD}']
                                function children: NSArray;
                                cdecl;
                                  function allParameters: NSArray; cdecl;
                                  end;

                              TAUParameterGroup = class
                                (TOCGenericImport<AUParameterGroupClass,
                                AUParameterGroup>)
                              end;
                          PAUParameterGroup = Pointer;

                          AUParameterTreeClass = interface
                            (AUParameterGroupClass)
                            ['{486DA4DE-8271-4E24-8A13-8744927B00B9}']
                          { class } function createParameterWithIdentifier
                            (identifier: NSString; name: NSString;
                            address: AUParameterAddress; min: AUValue;
                            max: AUValue; &unit: AudioUnitParameterUnit;
                            unitName: NSString;
                            flags: AudioUnitParameterOptions;
                            valueStrings: NSArray; dependentParameters: NSArray)
                            : AUParameter;
                          cdecl;
                          { class } function createGroupWithIdentifier
                              (identifier: NSString; name: NSString;
                              children: NSArray): AUParameterGroup; cdecl;
                            { class } function createGroupTemplate
                                (children: NSArray): AUParameterGroup; cdecl;
                              { class } function createGroupFromTemplate
                                  (templateGroup: AUParameterGroup;
                                  identifier: NSString; name: NSString;
                                  addressOffset: AUParameterAddress)
                                  : AUParameterGroup; cdecl;
                                { class } function createTreeWithChildren
                                    (children: NSArray): AUParameterTree; cdecl;
                                  end;
                              AUParameterTree = interface(AUParameterGroup)
                                ['{65D23975-31DE-48B9-8B51-4F58144EC8E4}']
                              function parameterWithAddress
                                (address: AUParameterAddress): AUParameter;
                              cdecl;
                                function parameterWithID
                                  (paramID: AudioUnitParameterID;
                                  scope: AudioUnitScope;
                                  element: AudioUnitElement)
                                  : AUParameter; cdecl;
                                end;

                            TAUParameterTree = class
                              (TOCGenericImport<AUParameterTreeClass,
                              AUParameterTree>)
                            end;
                        PAUParameterTree = Pointer;

                        AUAudioUnitBusArrayClass = interface(NSObjectClass)
                          ['{3E59693D-A112-469D-A319-C32EEF075B66}']
                        end;
                    AUAudioUnitBusArray = interface(NSObject)
                      ['{2C317B6A-A72E-487E-9A1E-43E75EF6580D}']
                      [MethodName('initWithAudioUnit:busType:busses:')]
                    function initWithAudioUnitBusTypeBusses(owner: AUAudioUnit;
                      busType: AUAudioUnitBusType; busses: NSArray)
                      : Pointer { instancetype };
                    cdecl;
                    [MethodName('initWithAudioUnit:busType:')]
                      function initWithAudioUnitBusType(owner: AUAudioUnit;
                        busType: AUAudioUnitBusType)
                        : Pointer { instancetype }; cdecl;
                        function count: NSUInteger; cdecl;
                          function objectAtIndexedSubscript(index: NSUInteger)
                            : AUAudioUnitBus; cdecl;
                            function isCountChangeable: Boolean; cdecl;
                              function setBusCount(count: NSUInteger;
                                error: NSError): Boolean; cdecl;
                                procedure addObserverToAllBusses
                                  (observer: NSObject; forKeyPath: NSString;
                                  options: NSKeyValueObservingOptions;
                                  context: Pointer); cdecl;
                                  procedure removeObserverFromAllBusses
                                    (observer: NSObject; forKeyPath: NSString;
                                    context: Pointer); cdecl;
                                    function ownerAudioUnit: AUAudioUnit; cdecl;
                                      function busType
                                        : AUAudioUnitBusType; cdecl;
                                        procedure replaceBusses
                                        (busArray: NSArray); cdecl;
                                        end;

                                    TAUAudioUnitBusArray = class
                                      (TOCGenericImport<
                                      AUAudioUnitBusArrayClass,
                                      AUAudioUnitBusArray>)
                                    end;
                                PAUAudioUnitBusArray = Pointer;

                                AUAudioUnitBusClass = interface(NSObjectClass)
                                  ['{4A62A3D1-4DE3-473E-B400-7D0A88BE31B3}']
                                end;
                            AUAudioUnitBus = interface(NSObject)
                              ['{45B77888-3142-4CF6-B8A5-C2C5F34C2E3C}']
                            function format: AVAudioFormat;
                            cdecl;
                              function setFormat(format: AVAudioFormat;
                                error: NSError): Boolean; cdecl;
                                procedure setEnabled(enabled: Boolean); cdecl;
                                  function isEnabled: Boolean; cdecl;
                                    procedure setName(name: NSString); cdecl;
                                      function name: NSString; cdecl;
                                        function index: NSUInteger; cdecl;
                                        function busType
                                        : AUAudioUnitBusType; cdecl;
                                        function ownerAudioUnit
                                        : AUAudioUnit; cdecl;
                                        function supportedChannelLayoutTags
                                        : NSArray; cdecl;
                                        procedure setContextPresentationLatency
                                        (contextPresentationLatency
                                        : NSTimeInterval); cdecl;
                                        function contextPresentationLatency
                                        : NSTimeInterval; cdecl;
                                        function initWithFormat
                                        (format: AVAudioFormat; error: NSError)
                                        : Pointer { instancetype }; cdecl;
                                        procedure setSupportedChannelCounts
                                        (supportedChannelCounts
                                        : NSArray); cdecl;
                                        function supportedChannelCounts
                                        : NSArray; cdecl;
                                        procedure setMaximumChannelCount
                                        (maximumChannelCount
                                        : AUAudioChannelCount); cdecl;
                                        function maximumChannelCount
                                        : AUAudioChannelCount; cdecl;
                                        end;

                                        TAUAudioUnitBus = class
                                        (TOCGenericImport<AUAudioUnitBusClass,
                                        AUAudioUnitBus>)
                                        end;
                                        PAUAudioUnitBus = Pointer;

                                        AUAudioUnitPresetClass = interface
                                        (NSObjectClass)
                                        ['{25E9E949-F9E9-46D7-8236-8E5E49D87706}']
                                        end;
                                        AUAudioUnitPreset = interface(NSObject)
                                        ['{E3CC2882-BCA7-43E9-8507-AE1ECB22DFB4}']
                                        procedure setNumber(number: NSInteger);
                                        cdecl;
                                        function number: NSInteger; cdecl;
                                        procedure setName
                                        (name: NSString); cdecl;
                                        function name: NSString; cdecl;
                                        end;

                                        TAUAudioUnitPreset = class
                                        (TOCGenericImport<
                                        AUAudioUnitPresetClass,
                                        AUAudioUnitPreset>)
                                        end;
                                        PAUAudioUnitPreset = Pointer;

                                        AUAudioUnitClass = interface
                                        (NSObjectClass)
                                        ['{CEC1C669-F49D-4CC3-9CF1-668419107598}']
                                        { class } procedure
                                        instantiateWithComponentDescription
                                        (componentDescription
                                        : AudioComponentDescription;
                                        options: AudioComponentInstantiationOptions;
                                        completionHandler
                                        : TAudioUnitCompletionHandler);
                                        cdecl;
                                        { class } procedure registerSubclass
                                        (cls: Pointer;
                                        asComponentDescription
                                        : AudioComponentDescription;
                                        name: NSString; version: UInt32); cdecl;
                                        end;
                                        AUAudioUnit = interface(NSObject)
                                        ['{630A5C1F-8312-4ECC-8A91-AC327E4BA087}']
                                        [MethodName
                                        ('initWithComponentDescription:options:error:')
                                        ]
                                        function initWithComponentDescriptionOptionsError
                                        (componentDescription
                                        : AudioComponentDescription;
                                        options: AudioComponentInstantiationOptions;
                                        error: NSError)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('initWithComponentDescription:error:')]
                                        function initWithComponentDescriptionError
                                        (componentDescription
                                        : AudioComponentDescription;
                                        error: NSError)
                                        : Pointer { instancetype }; cdecl;
                                        function componentDescription
                                        : AudioComponentDescription; cdecl;
                                        function component
                                        : AudioComponent; cdecl;
                                        function componentName: NSString; cdecl;
                                        function audioUnitName: NSString; cdecl;
                                        function manufacturerName
                                        : NSString; cdecl;
                                        function componentVersion
                                        : LongWord; cdecl;
                                        function allocateRenderResourcesAndReturnError
                                        (outError: NSError): Boolean; cdecl;
                                        procedure deallocateRenderResources;
                                        cdecl;
                                        function renderResourcesAllocated
                                        : Boolean; cdecl;
                                        procedure reset; cdecl;
                                        function inputBusses
                                        : AUAudioUnitBusArray; cdecl;
                                        function outputBusses
                                        : AUAudioUnitBusArray; cdecl;
                                        function renderBlock
                                        : AURenderBlock; cdecl;
                                        function scheduleParameterBlock
                                        : AUScheduleParameterBlock; cdecl;
                                        function tokenByAddingRenderObserver
                                        (observer: AURenderObserver)
                                        : NSInteger; cdecl;
                                        procedure removeRenderObserver
                                        (token: NSInteger); cdecl;
                                        procedure setMaximumFramesToRender
                                        (maximumFramesToRender
                                        : AUAudioFrameCount); cdecl;
                                        function maximumFramesToRender
                                        : AUAudioFrameCount; cdecl;
                                        function parameterTree
                                        : AUParameterTree; cdecl;
                                        function parametersForOverviewWithCount
                                        (count: NSInteger): NSArray; cdecl;
                                        function allParameterValues
                                        : Boolean; cdecl;
                                        function isMusicDeviceOrEffect
                                        : Boolean; cdecl;
                                        function virtualMIDICableCount
                                        : NSInteger; cdecl;
                                        function scheduleMIDIEventBlock
                                        : AUScheduleMIDIEventBlock; cdecl;
                                        procedure setFullState
                                        (fullState: NSDictionary); cdecl;
                                        function fullState: NSDictionary; cdecl;
                                        procedure setFullStateForDocument
                                        (fullStateForDocument
                                        : NSDictionary); cdecl;
                                        function fullStateForDocument
                                        : NSDictionary; cdecl;
                                        function factoryPresets: NSArray; cdecl;
                                        procedure setCurrentPreset
                                        (currentPreset
                                        : AUAudioUnitPreset); cdecl;
                                        function currentPreset
                                        : AUAudioUnitPreset; cdecl;
                                        function latency: NSTimeInterval; cdecl;
                                        function tailTime
                                        : NSTimeInterval; cdecl;
                                        procedure setRenderQuality
                                        (renderQuality: NSInteger); cdecl;
                                        function renderQuality
                                        : NSInteger; cdecl;
                                        procedure setShouldBypassEffect
                                        (shouldBypassEffect: Boolean); cdecl;
                                        function shouldBypassEffect
                                        : Boolean; cdecl;
                                        function canProcessInPlace
                                        : Boolean; cdecl;
                                        procedure setRenderingOffline
                                        (renderingOffline: Boolean); cdecl;
                                        function isRenderingOffline
                                        : Boolean; cdecl;
                                        function channelCapabilities
                                        : NSArray; cdecl;
                                        procedure setMusicalContextBlock
                                        (musicalContextBlock
                                        : AUHostMusicalContextBlock); cdecl;
                                        function musicalContextBlock
                                        : AUHostMusicalContextBlock; cdecl;
                                        procedure setTransportStateBlock
                                        (transportStateBlock
                                        : AUHostTransportStateBlock); cdecl;
                                        function transportStateBlock
                                        : AUHostTransportStateBlock; cdecl;
                                        procedure setContextName
                                        (contextName: NSString); cdecl;
                                        function contextName: NSString; cdecl;
                                        function canPerformInput
                                        : Boolean; cdecl;
                                        function canPerformOutput
                                        : Boolean; cdecl;
                                        procedure setInputEnabled
                                        (inputEnabled: Boolean); cdecl;
                                        function isInputEnabled: Boolean; cdecl;
                                        procedure setOutputEnabled
                                        (outputEnabled: Boolean); cdecl;
                                        function isOutputEnabled
                                        : Boolean; cdecl;
                                        procedure setOutputProvider
                                        (outputProvider
                                        : AURenderPullInputBlock); cdecl;
                                        function outputProvider
                                        : AURenderPullInputBlock; cdecl;
                                        procedure setInputHandler
                                        (inputHandler: AUInputHandler); cdecl;
                                        function inputHandler
                                        : AUInputHandler; cdecl;
                                        function startHardwareAndReturnError
                                        (outError: NSError): Boolean; cdecl;
                                        procedure stopHardware; cdecl;
                                        function internalRenderBlock
                                        : AUInternalRenderBlock; cdecl;
                                        function shouldChangeToFormat
                                        (format: AVAudioFormat;
                                        forBus: AUAudioUnitBus): Boolean; cdecl;
                                        procedure setRenderResourcesAllocated
                                        (flag: Boolean); cdecl;
                                        end;

                                        TAUAudioUnit = class
                                        (TOCGenericImport<AUAudioUnitClass,
                                        AUAudioUnit>)
                                        end;
                                        PAUAudioUnit = Pointer;

                                        AUAudioUnitV2BridgeClass = interface
                                        (AUAudioUnitClass)
                                        ['{4985FDF1-8D8E-4A2A-A4AB-0087CD8DCE2F}']
                                        end;
                                        AUAudioUnitV2Bridge = interface
                                        (AUAudioUnit)
                                        ['{EBD35118-922E-4E45-8C15-FF32E15EA408}']
                                        end;

                                        TAUAudioUnitV2Bridge = class
                                        (TOCGenericImport<
                                        AUAudioUnitV2BridgeClass,
                                        AUAudioUnitV2Bridge>)
                                        end;
                                        PAUAudioUnitV2Bridge = Pointer;

                                        // ===== Protocol declarations =====

                                        AUAudioUnitFactory = interface
                                        (IObjectiveC)
                                        ['{2241DF08-BE8D-4D45-9C2E-C6C28ACE3FD5}']
                                        function createAudioUnitWithComponentDescription
                                        (desc: AudioComponentDescription;
                                        error: NSError): AUAudioUnit;
                                        cdecl;
                                        end;

                                        // ===== Exported string consts =====

                                        function kAudioComponentRegistrationsChangedNotification
                                        : Pointer;
                                        function kAudioComponentInstanceInvalidationNotification
                                        : Pointer;


                                        // ===== External functions =====

                                        const
                                        libAudioUnit =
                                        '/System/Library/Frameworks/AudioUnit.framework/AudioUnit';
                                        function AudioComponentFindNext
                                        (inComponent: AudioComponent;
                                        inDesc: Pointer): AudioComponent; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioComponentFindNext';
                                        function AudioComponentCount
                                        (inDesc: Pointer): UInt32; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioComponentCount';
                                        function AudioComponentCopyName
                                        (inComponent: AudioComponent;
                                        outName: Pointer): OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioComponentCopyName';
                                        function AudioComponentGetDescription
                                        (inComponent: AudioComponent;
                                        outDesc: Pointer): OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioComponentGetDescription';
                                        function AudioComponentGetVersion
                                        (inComponent: AudioComponent;
                                        outVersion: PLongWord): OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioComponentGetVersion';
                                        function AudioComponentInstanceNew
                                        (inComponent: AudioComponent;
                                        outInstance: Pointer): OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioComponentInstanceNew';
                                        procedure AudioComponentInstantiate
                                        (inComponent: AudioComponent;
                                        inOptions:
                                        AudioComponentInstantiationOptions;
                                        inCompletionHandler
                                        : TAudioUnitInCompletionHandler); cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioComponentInstantiate';
                                        function AudioComponentInstanceDispose
                                        (inInstance: AudioComponentInstance)
                                        : OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioComponentInstanceDispose';
                                        function AudioComponentInstanceGetComponent
                                        (inInstance: AudioComponentInstance)
                                        : AudioComponent; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioComponentInstanceGetComponent';
                                        function AudioComponentInstanceCanDo
                                        (inInstance: AudioComponentInstance;
                                        inSelectorID: Int16): Boolean; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioComponentInstanceCanDo';
                                        function AudioComponentRegister
                                        (inDesc: Pointer; inName: CFStringRef;
                                        inVersion: UInt32;
                                        inFactory:
                                        AudioComponentFactoryFunction)
                                        : AudioComponent; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioComponentRegister';
                                        function AudioComponentCopyConfigurationInfo
                                        (inComponent: AudioComponent;
                                        outConfigurationInfo: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioComponentCopyConfigurationInfo';
                                        function AudioComponentValidate
                                        (inComponent: AudioComponent;
                                        inValidationParameters: CFDictionaryRef;
                                        outValidationResult: UInt32): OSStatus;
                                        cdecl; external libAudioUnit name _PU +
                                        'AudioComponentValidate';
                                        function AudioUnitInitialize
                                        (inUnit: AudioUnit): OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioUnitInitialize';
                                        function AudioUnitUninitialize
                                        (inUnit: AudioUnit): OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioUnitUninitialize';
                                        function AudioUnitGetPropertyInfo
                                        (inUnit: AudioUnit;
                                        inID: AudioUnitPropertyID;
                                        inScope: AudioUnitScope;
                                        inElement: AudioUnitElement;
                                        outDataSize: PLongWord;
                                        outWritable: PByte): OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioUnitGetPropertyInfo';
                                        function AudioUnitGetProperty
                                        (inUnit: AudioUnit;
                                        inID: AudioUnitPropertyID;
                                        inScope: AudioUnitScope;
                                        inElement: AudioUnitElement;
                                        outData: Pointer; ioDataSize: PLongWord)
                                        : OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioUnitGetProperty';
                                        function AudioUnitSetProperty
                                        (inUnit: AudioUnit;
                                        inID: AudioUnitPropertyID;
                                        inScope: AudioUnitScope;
                                        inElement: AudioUnitElement;
                                        inData: Pointer; inDataSize: UInt32)
                                        : OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioUnitSetProperty';
                                        function AudioUnitAddPropertyListener
                                        (inUnit: AudioUnit;
                                        inID: AudioUnitPropertyID;
                                        inProc: AudioUnitPropertyListenerProc;
                                        inProcUserData: Pointer): OSStatus;
                                        cdecl; external libAudioUnit name _PU +
                                        'AudioUnitAddPropertyListener';
                                        function AudioUnitRemovePropertyListenerWithUserData
                                        (inUnit: AudioUnit;
                                        inID: AudioUnitPropertyID;
                                        inProc: AudioUnitPropertyListenerProc;
                                        inProcUserData: Pointer): OSStatus;
                                        cdecl; external libAudioUnit name _PU +
                                        'AudioUnitRemovePropertyListenerWithUserData';
                                        function AudioUnitAddRenderNotify
                                        (inUnit: AudioUnit;
                                        inProc: AURenderCallback;
                                        inProcUserData: Pointer): OSStatus;
                                        cdecl; external libAudioUnit name _PU +
                                        'AudioUnitAddRenderNotify';
                                        function AudioUnitRemoveRenderNotify
                                        (inUnit: AudioUnit;
                                        inProc: AURenderCallback;
                                        inProcUserData: Pointer): OSStatus;
                                        cdecl; external libAudioUnit name _PU +
                                        'AudioUnitRemoveRenderNotify';
                                        function AudioUnitGetParameter
                                        (inUnit: AudioUnit;
                                        inID: AudioUnitParameterID;
                                        inScope: AudioUnitScope;
                                        inElement: AudioUnitElement;
                                        outValue: PSingle): OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioUnitGetParameter';
                                        function AudioUnitSetParameter
                                        (inUnit: AudioUnit;
                                        inID: AudioUnitParameterID;
                                        inScope: AudioUnitScope;
                                        inElement: AudioUnitElement;
                                        inValue: AudioUnitParameterValue;
                                        inBufferOffsetInFrames: UInt32)
                                        : OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioUnitSetParameter';
                                        function AudioUnitScheduleParameters
                                        (inUnit: AudioUnit;
                                        inParameterEvent: Pointer;
                                        inNumParamEvents: UInt32): OSStatus;
                                        cdecl; external libAudioUnit name _PU +
                                        'AudioUnitScheduleParameters';
                                        function AudioUnitRender
                                        (inUnit: AudioUnit;
                                        ioActionFlags: UInt32;
                                        inTimeStamp: Pointer;
                                        inOutputBusNumber: UInt32;
                                        inNumberFrames: UInt32; ioData: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioUnitRender';
                                        function AudioUnitProcess
                                        (inUnit: AudioUnit;
                                        ioActionFlags: UInt32;
                                        inTimeStamp: Pointer;
                                        inNumberFrames: UInt32; ioData: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioUnitProcess';
                                        function AudioUnitProcessMultiple
                                        (inUnit: AudioUnit;
                                        ioActionFlags: UInt32;
                                        inTimeStamp: Pointer;
                                        inNumberFrames: UInt32;
                                        inNumberInputBufferLists: UInt32;
                                        inInputBufferLists: Pointer;
                                        inNumberOutputBufferLists: UInt32;
                                        ioOutputBufferLists: Pointer): OSStatus;
                                        cdecl; external libAudioUnit name _PU +
                                        'AudioUnitProcessMultiple';
                                        function AudioUnitReset
                                        (inUnit: AudioUnit;
                                        inScope: AudioUnitScope;
                                        inElement: AudioUnitElement): OSStatus;
                                        cdecl; external libAudioUnit name _PU +
                                        'AudioUnitReset';
                                        function AudioOutputUnitPublish
                                        (inDesc: Pointer; inName: CFStringRef;
                                        inVersion: UInt32;
                                        inOutputUnit: AudioUnit): OSStatus;
                                        cdecl; external libAudioUnit name _PU +
                                        'AudioOutputUnitPublish';
                                        function AudioOutputUnitGetHostIcon
                                        (au: AudioUnit;
                                        desiredPointSize: Single)
                                        : Pointer { UIImage }; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioOutputUnitGetHostIcon';
                                        function AudioComponentGetIcon
                                        (comp: AudioComponent;
                                        desiredPointSize: Single)
                                        : Pointer { UIImage }; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioComponentGetIcon';
                                        function AudioComponentGetLastActiveTime
                                        (comp: AudioComponent): CFAbsoluteTime;
                                        cdecl; external libAudioUnit name _PU +
                                        'AudioComponentGetLastActiveTime';
                                        function GetAudioUnitParameterDisplayType
                                        (flags: AudioUnitParameterOptions)
                                        : AudioUnitParameterOptions; cdecl;
                                        external libAudioUnit name _PU +
                                        'GetAudioUnitParameterDisplayType';
                                        function SetAudioUnitParameterDisplayType
                                        (flags: AudioUnitParameterOptions;
                                        displayType: AudioUnitParameterOptions)
                                        : AudioUnitParameterOptions; cdecl;
                                        external libAudioUnit name _PU +
                                        'SetAudioUnitParameterDisplayType';
                                        function AudioOutputUnitStart
                                        (ci: AudioUnit): OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioOutputUnitStart';
                                        function AudioOutputUnitStop
                                        (ci: AudioUnit): OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'AudioOutputUnitStop';
                                        function MusicDeviceMIDIEvent
                                        (inUnit: MusicDeviceComponent;
                                        inStatus: UInt32; inData1: UInt32;
                                        inData2: UInt32;
                                        inOffsetSampleFrame: UInt32): OSStatus;
                                        cdecl; external libAudioUnit name _PU +
                                        'MusicDeviceMIDIEvent';
                                        function MusicDeviceSysEx
                                        (inUnit: MusicDeviceComponent;
                                        inData: PByte; inLength: UInt32)
                                        : OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'MusicDeviceSysEx';
                                        function MusicDeviceStartNote
                                        (inUnit: MusicDeviceComponent;
                                        inInstrument: MusicDeviceInstrumentID;
                                        inGroupID: MusicDeviceGroupID;
                                        outNoteInstanceID: PLongWord;
                                        inOffsetSampleFrame: UInt32;
                                        inParams: Pointer): OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'MusicDeviceStartNote';
                                        function MusicDeviceStopNote
                                        (inUnit: MusicDeviceComponent;
                                        inGroupID: MusicDeviceGroupID;
                                        inNoteInstanceID: NoteInstanceID;
                                        inOffsetSampleFrame: UInt32): OSStatus;
                                        cdecl; external libAudioUnit name _PU +
                                        'MusicDeviceStopNote';
                                        function MusicDevicePrepareInstrument
                                        (inUnit: MusicDeviceComponent;
                                        inInstrument: MusicDeviceInstrumentID)
                                        : OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'MusicDevicePrepareInstrument';
                                        function MusicDeviceReleaseInstrument
                                        (inUnit: MusicDeviceComponent;
                                        inInstrument: MusicDeviceInstrumentID)
                                        : OSStatus; cdecl;
                                        external libAudioUnit name _PU +
                                        'MusicDeviceReleaseInstrument';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AudioUnitModule: THandle;

{$ENDIF IOS}

function kAudioComponentRegistrationsChangedNotification: Pointer;
begin
  Result := CocoaPointerConst(libAudioUnit,
    'kAudioComponentRegistrationsChangedNotification');
end;

function kAudioComponentInstanceInvalidationNotification: Pointer;
begin
  Result := CocoaPointerConst(libAudioUnit,
    'kAudioComponentInstanceInvalidationNotification');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

AudioUnitModule := dlopen(MarshaledAString(libAudioUnit), RTLD_LAZY);

finalization

dlclose(AudioUnitModule);
{$ENDIF IOS}

end.
