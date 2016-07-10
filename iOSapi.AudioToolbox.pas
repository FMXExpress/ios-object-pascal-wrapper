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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.AudioUnit,
  iOSapi.CocoaTypes,
  iOSapi.CoreAudio,
  iOSapi.CoreMIDI,
  iOSapi.Foundation;

const
  kAudioConverterPropertyMinimumInputBufferSize = 1835623027;
  kAudioConverterPropertyMinimumOutputBufferSize = 1836016243;
  kAudioConverterPropertyMaximumInputBufferSize = 2020172403;
  kAudioConverterPropertyMaximumInputPacketSize = 2020175987;
  kAudioConverterPropertyMaximumOutputPacketSize = 2020569203;
  kAudioConverterPropertyCalculateInputBufferSize = 1667850867;
  kAudioConverterPropertyCalculateOutputBufferSize = 1668244083;
  kAudioConverterPropertyInputCodecParameters = 1768121456;
  kAudioConverterPropertyOutputCodecParameters = 1868784752;
  kAudioConverterSampleRateConverterAlgorithm = 1936876393;
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
  kAudioConverterPropertyCanResumeFromInterruption = 1668441705;
  kAudioConverterQuality_Max = 127;
  kAudioConverterQuality_High = 96;
  kAudioConverterQuality_Medium = 64;
  kAudioConverterQuality_Low = 32;
  kAudioConverterQuality_Min = 0;
  kAudioConverterSampleRateConverterComplexity_Linear = 1818848869;
  kAudioConverterSampleRateConverterComplexity_Normal = 1852797549;
  kAudioConverterSampleRateConverterComplexity_Mastering = 1650553971;
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
  kAudioFileAIFFType = 1095321158;
  kAudioFileAIFCType = 1095321155;
  kAudioFileWAVEType = 1463899717;
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
  kAudioFilePropertyPacketToByte = 1886085753;
  kAudioFilePropertyByteToPacket = 1652125803;
  kAudioFilePropertyChunkIDs = 1667787108;
  kAudioFilePropertyInfoDictionary = 1768842863;
  kAudioFilePropertyPacketTableInfo = 1886283375;
  kAudioFilePropertyFormatList = 1718383476;
  kAudioFilePropertyPacketSizeUpperBound = 1886090594;
  kAudioFilePropertyReserveDuration = 1920168566;
  kAudioFilePropertyEstimatedDuration = 1701082482;
  kAudioFilePropertyBitRate = 1651663220;
  kAudioFilePropertyID3Tag = 1768174452;
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
  kAudioFormatProperty_FormatIsEncrypted = 1668446576;
  kAudioFormatProperty_Encoders = 1635149166;
  kAudioFormatProperty_Decoders = 1635148901;
  kAudioFormatProperty_AvailableEncodeBitRates = 1634034290;
  kAudioFormatProperty_AvailableEncodeSampleRates = 1634038642;
  kAudioFormatProperty_AvailableEncodeChannelLayoutTags = 1634034540;
  kAudioFormatProperty_AvailableEncodeNumberChannels = 1635151459;
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
  kSystemSoundID_Vibrate = 4095;
  kAudioServicesPropertyIsUISound = 1769174377;
  kAudioServicesPropertyCompletePlaybackIfAppDies = 1768318057;
  kAUGraphErr_NodeNotFound = -10860;
  kAUGraphErr_InvalidConnection = -10861;
  kAUGraphErr_OutputNodeErr = -10862;
  kAUGraphErr_CannotDoInCurrentContext = -10863;
  kAUGraphErr_InvalidAudioUnit = -10864;
  kAUNodeInteraction_Connection = 1;
  kAUNodeInteraction_InputCallback = 2;
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

type
  // ===== Framework typedefs =====
{$M+}
  AudioConverterRef = Pointer;
  AudioConverterPropertyID = UInt32;

  AudioConverterPrimeInfo = record
    leadingFrames: UInt32;
    trailingFrames: UInt32;
  end;

  PAudioConverterPrimeInfo = ^AudioConverterPrimeInfo;

  OSStatus = Int32;
  AudioConverterInputDataProc = function(param1: AudioConverterRef;
    param2: PLongWord; param3: Pointer; param4: Pointer): OSStatus; cdecl;
  AudioConverterComplexInputDataProc = function(param1: AudioConverterRef;
    param2: PLongWord; param3: Pointer; param4: Pointer; param5: Pointer)
    : OSStatus; cdecl;
  AudioFileTypeID = UInt32;
  AudioFileFlags = UInt32;
  AudioFilePermissions = Int8;
  AudioFileID = Pointer;
  AudioFilePropertyID = UInt32;

  AudioFile_SMPTE_Time = record
    mHours: Int8;
    mMinutes: Byte;
    mSeconds: Byte;
    mFrames: Byte;
    mSubFrameSampleOffset: UInt32;
  end;

  PAudioFile_SMPTE_Time = ^AudioFile_SMPTE_Time;

  CFStringRef = Pointer;

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

  CFURLRef = Pointer;
  AudioFile_ReadProc = function(param1: Pointer; param2: Int64; param3: UInt32;
    param4: Pointer; param5: PLongWord): OSStatus; cdecl;
  AudioFile_WriteProc = function(param1: Pointer; param2: Int64; param3: UInt32;
    param4: Pointer; param5: PLongWord): OSStatus; cdecl;
  AudioFile_GetSizeProc = function(param1: Pointer): Int64; cdecl;
  AudioFile_SetSizeProc = function(param1: Pointer; param2: Int64)
    : OSStatus; cdecl;
  Boolean = Byte;

  AudioFileTypeAndFormatID = record
    mFileType: AudioFileTypeID;
    mFormatID: UInt32;
  end;

  PAudioFileTypeAndFormatID = ^AudioFileTypeAndFormatID;

  AudioFileStreamPropertyFlags = UInt32;
  AudioFileStreamParseFlags = UInt32;
  AudioFileStreamSeekFlags = UInt32;
  AudioFileStreamPropertyID = UInt32;
  AudioFileStreamID = Pointer;
  AudioFileStream_PropertyListenerProc = procedure(param1: Pointer;
    param2: AudioFileStreamID; param3: AudioFileStreamPropertyID;
    param4: UInt32); cdecl;
  AudioFileStream_PacketsProc = procedure(param1: Pointer; param2: UInt32;
    param3: UInt32; param4: Pointer; param5: Pointer); cdecl;
  AudioFormatPropertyID = UInt32;
  AudioPanningMode = UInt32;

  AudioPanningInfo = record
    mPanningMode: AudioPanningMode;
    mCoordinateFlags: UInt32;
    mCoordinates: array [0 .. 2] of Single;
    mGainScale: Single;
    mOutputChannelMap: Pointer;
  end;

  PAudioPanningInfo = ^AudioPanningInfo;

  AudioBalanceFadeType = UInt32;

  AudioBalanceFade = record
    mLeftRightBalance: Single;
    mBackFrontFade: Single;
    mType: AudioBalanceFadeType;
    mChannelLayout: Pointer;
  end;

  PAudioBalanceFade = ^AudioBalanceFade;

  AudioFormatID = UInt32;
  AudioFormatFlags = UInt32;
  AudioStreamBasicDescription = AudioStreamBasicDescription = record
    mSampleRate: Double;
mFormatID:
AudioFormatID;
mFormatFlags:
AudioFormatFlags;
mBytesPerPacket:
UInt32;
mFramesPerPacket:
UInt32;
mBytesPerFrame:
UInt32;
mChannelsPerFrame:
UInt32;
mBitsPerChannel:
UInt32;
mReserved:
UInt32;
end;
PAudioStreamBasicDescription = ^AudioStreamBasicDescription;;

AudioFormatInfo = record mASBD: AudioStreamBasicDescription;
mMagicCookie:
Pointer;
mMagicCookieSize:
UInt32;
end;
PAudioFormatInfo = ^AudioFormatInfo;

FourCharCode = UInt32;
OSType = FourCharCode;
AudioClassDescription = AudioClassDescription = record mType: OSType;
mSubType:
OSType;
mManufacturer:
OSType;
end;
PAudioClassDescription = ^AudioClassDescription;;

ExtendedAudioFormatInfo = record mASBD: AudioStreamBasicDescription;
mMagicCookie:
Pointer;
mMagicCookieSize:
UInt32;
mClassDescription:
AudioClassDescription;
end;
PExtendedAudioFormatInfo = ^ExtendedAudioFormatInfo;

AudioChannelLayoutTag = UInt32;

AudioFormatListItem = record mASBD: AudioStreamBasicDescription;
mChannelLayoutTag:
AudioChannelLayoutTag;
end;
PAudioFormatListItem = ^AudioFormatListItem;

AudioQueuePropertyID = UInt32;
AudioQueueParameterID = UInt32;
AudioQueueParameterValue = Single;
AudioQueueRef = Pointer;
AudioQueueTimelineRef = Pointer;
AudioQueueProcessingTapFlags = UInt32;

AudioQueueBuffer = record mAudioDataBytesCapacity: UInt32;
mAudioData:
Pointer;
mAudioDataByteSize:
UInt32;
mUserData:
Pointer;
mPacketDescriptionCapacity:
UInt32;
mPacketDescriptions:
Pointer;
mPacketDescriptionCount:
UInt32;
end;
PAudioQueueBuffer = ^AudioQueueBuffer;

AudioQueueBufferRef = Pointer;

AudioQueueParameterEvent = record mID: AudioQueueParameterID;
mValue:
AudioQueueParameterValue;
end;
PAudioQueueParameterEvent = ^AudioQueueParameterEvent;

AudioQueueLevelMeterState = record mAveragePower: Single;
mPeakPower:
Single;
end;
PAudioQueueLevelMeterState = ^AudioQueueLevelMeterState;

AudioQueueProcessingTapRef = Pointer;

AudioQueueChannelAssignment = record mDeviceUID: CFStringRef;
mChannelNumber:
UInt32;
end;
PAudioQueueChannelAssignment = ^AudioQueueChannelAssignment;

AudioQueueOutputCallback =
procedure(param1: Pointer; param2: AudioQueueRef; param3: AudioQueueBufferRef);
cdecl;
AudioQueueInputCallback =
procedure(param1: Pointer; param2: AudioQueueRef; param3: AudioQueueBufferRef;
  param4: Pointer; param5: UInt32; param6: Pointer);
cdecl;
AudioQueuePropertyListenerProc =
procedure(param1: Pointer; param2: AudioQueueRef; param3: AudioQueuePropertyID);
cdecl;
AudioQueueProcessingTapCallback =
procedure(param1: Pointer; param2: AudioQueueProcessingTapRef; param3: UInt32;
  param4: Pointer; param5: UInt32; param6: PLongWord; param7: Pointer);
cdecl;
CFRunLoopRef = Pointer;
AudioSessionPropertyID = UInt32;
AudioSessionInterruptionType = UInt32;
AudioSessionInterruptionListener =
procedure(param1: Pointer; param2: UInt32);
cdecl;
AudioSessionPropertyListener =
procedure(param1: Pointer; param2: AudioSessionPropertyID; param3: UInt32;
  param4: Pointer);
cdecl;
SystemSoundID = UInt32;
AudioServicesPropertyID = UInt32;
AudioServicesSystemSoundCompletionProc =
procedure(param1: SystemSoundID; param2: Pointer);
cdecl;
TAudioToolboxInCompletionBlock =
procedure() of object;
AUGraph = Pointer;
AUNode = Int32;

AudioUnitNodeConnection = record sourceNode: AUNode;
sourceOutputNumber:
UInt32;
destNode:
AUNode;
destInputNumber:
UInt32;
end;
PAudioUnitNodeConnection = ^AudioUnitNodeConnection;

AUNodeConnection = AudioUnitNodeConnection;

AudioUnitElement = UInt32;
AURenderCallback =
function(param1: Pointer; param2: UInt32; param3: Pointer; param4: UInt32;
  param5: UInt32; param6: Pointer): OSStatus;
cdecl;
AURenderCallbackStruct = AURenderCallbackStruct = record inputProc
  : AURenderCallback;
inputProcRefCon:
Pointer;
end;
PAURenderCallbackStruct = ^AURenderCallbackStruct;;

AUNodeRenderCallback = record destNode: AUNode;
destInputNumber:
AudioUnitElement;
cback:
AURenderCallbackStruct;
end;
PAUNodeRenderCallback = ^AUNodeRenderCallback;

AUNodeInteraction = record nodeInteractionType: UInt32;
case Integer of
  0:
    (connection: AUNodeConnection);
  1:
    (inputCallback: AUNodeRenderCallback);

end;
PAUNodeInteraction = ^AUNodeInteraction;

ExtAudioFileRef = Pointer;
ExtAudioFilePropertyID = UInt32;
MusicEventType = UInt32;
MusicSequenceLoadFlags = UInt32;
MusicSequenceType = UInt32;
MusicSequenceFileTypeID = UInt32;
MusicSequenceFileFlags = UInt32;
MusicTimeStamp = Double;

MIDINoteMessage = record channel: Byte;
note:
Byte;
velocity:
Byte;
releaseVelocity:
Byte;
duration:
Single;
end;
PMIDINoteMessage = ^MIDINoteMessage;

MIDIChannelMessage = record status: Byte;
data1:
Byte;
data2:
Byte;
reserved:
Byte;
end;
PMIDIChannelMessage = ^MIDIChannelMessage;

MIDIRawData = record length: UInt32;
data:
array [0 .. 0] of Byte;
end;
PMIDIRawData = ^MIDIRawData;

MIDIMetaEvent = record metaEventType: Byte;
unused1:
Byte;
unused2:
Byte;
unused3:
Byte;
dataLength:
UInt32;
data:
array [0 .. 0] of Byte;
end;
PMIDIMetaEvent = ^MIDIMetaEvent;

MusicEventUserData = record length: UInt32;
data:
array [0 .. 0] of Byte;
end;
PMusicEventUserData = ^MusicEventUserData;

MusicDeviceInstrumentID = UInt32;
MusicDeviceGroupID = UInt32;
AudioUnitParameterID = UInt32;
AudioUnitParameterValue = Single;
NoteParamsControlValue = NoteParamsControlValue = record mID
  : AudioUnitParameterID;
mValue:
AudioUnitParameterValue;
end;
PNoteParamsControlValue = ^NoteParamsControlValue;;
MusicDeviceNoteParams = MusicDeviceNoteParams = record argCount: UInt32;
mPitch:
Single;
mVelocity:
Single;
mControls:
array [0 .. 0] of NoteParamsControlValue;
end;
PMusicDeviceNoteParams = ^MusicDeviceNoteParams;;

ExtendedNoteOnEvent = record instrumentID: MusicDeviceInstrumentID;
groupID:
MusicDeviceGroupID;
duration:
Single;
extendedParams:
MusicDeviceNoteParams;
end;
PExtendedNoteOnEvent = ^ExtendedNoteOnEvent;

AudioUnitScope = UInt32;

ParameterEvent = record parameterID: AudioUnitParameterID;
scope:
AudioUnitScope;
element:
AudioUnitElement;
value:
AudioUnitParameterValue;
end;
PParameterEvent = ^ParameterEvent;

ExtendedTempoEvent = record bpm: Double;
end;
PExtendedTempoEvent = ^ExtendedTempoEvent;

CFTypeRef = Pointer;
CFPropertyListRef = CFTypeRef;

AUPresetEvent = record scope: AudioUnitScope;
element:
AudioUnitElement;
preset:
CFPropertyListRef;
end;
PAUPresetEvent = ^AUPresetEvent;

CABarBeatTime = record bar: Int32;
beat:
UInt16;
subbeat:
UInt16;
subbeatDivisor:
UInt16;
reserved:
UInt16;
end;
PCABarBeatTime = ^CABarBeatTime;

MusicPlayer = Pointer;
MusicSequence = Pointer;
MusicTrack = Pointer;
MusicEventIterator = Pointer;
MusicSequenceUserCallback =
procedure(param1: Pointer; param2: MusicSequence; param3: MusicTrack;
  param4: MusicTimeStamp; param5: Pointer; param6: MusicTimeStamp;
  param7: MusicTimeStamp);
cdecl;

MusicTrackLoopInfo = record loopDuration: MusicTimeStamp;
numberOfLoops:
Int32;
end;
PMusicTrackLoopInfo = ^MusicTrackLoopInfo;

MIDIObjectRef = UInt32;
MIDIEndpointRef = MIDIObjectRef;
CFDataRef = Pointer;
SignedByte = Int8;
CFDictionaryRef = Pointer;

CAFFileHeader = record mFileType: UInt32;
mFileVersion:
UInt16;
mFileFlags:
UInt16;
end;
PCAFFileHeader = ^CAFFileHeader;

CAFChunkHeader = record mChunkType: UInt32;
mChunkSize:
Int64;
end;
PCAFChunkHeader = ^CAFChunkHeader;

CAF_UUID_ChunkHeader = record mHeader: CAFChunkHeader;
mUUID:
array [0 .. 15] of Byte;
end;
PCAF_UUID_ChunkHeader = ^CAF_UUID_ChunkHeader;

CAFFormatFlags = UInt32;

CAFAudioDescription = record mSampleRate: Double;
mFormatID:
UInt32;
mFormatFlags:
CAFFormatFlags;
mBytesPerPacket:
UInt32;
mFramesPerPacket:
UInt32;
mChannelsPerFrame:
UInt32;
mBitsPerChannel:
UInt32;
end;
PCAFAudioDescription = ^CAFAudioDescription;

CAFPacketTableHeader = record mNumberPackets: Int64;
mNumberValidFrames:
Int64;
mPrimingFrames:
Int32;
mRemainderFrames:
Int32;
mPacketDescriptions:
array [0 .. 0] of Byte;
end;
PCAFPacketTableHeader = ^CAFPacketTableHeader;

CAFDataChunk = record mEditCount: UInt32;
mData:
array [0 .. 0] of Byte;
end;
PCAFDataChunk = ^CAFDataChunk;

CAF_SMPTE_Time = record mHours: Int8;
mMinutes:
Int8;
mSeconds:
Int8;
mFrames:
Int8;
mSubFrameSampleOffset:
UInt32;
end;
PCAF_SMPTE_Time = ^CAF_SMPTE_Time;

CAFMarker = record mType: UInt32;
mFramePosition:
Double;
mMarkerID:
UInt32;
mSMPTETime:
CAF_SMPTE_Time;
mChannel:
UInt32;
end;
PCAFMarker = ^CAFMarker;

CAFMarkerChunk = record mSMPTE_TimeType: UInt32;
mNumberMarkers:
UInt32;
mMarkers:
array [0 .. 0] of CAFMarker;
end;
PCAFMarkerChunk = ^CAFMarkerChunk;

CAFRegionFlags = UInt32;

CAFRegion = record mRegionID: UInt32;
mFlags:
CAFRegionFlags;
mNumberMarkers:
UInt32;
mMarkers:
array [0 .. 0] of CAFMarker;
end;
PCAFRegion = ^CAFRegion;

CAFRegionChunk = record mSMPTE_TimeType: UInt32;
mNumberRegions:
UInt32;
mRegions:
array [0 .. 0] of CAFRegion;
end;
PCAFRegionChunk = ^CAFRegionChunk;

CAFInstrumentChunk = record mBaseNote: Single;
mMIDILowNote:
Byte;
mMIDIHighNote:
Byte;
mMIDILowVelocity:
Byte;
mMIDIHighVelocity:
Byte;
mdBGain:
Single;
mStartRegionID:
UInt32;
mSustainRegionID:
UInt32;
mReleaseRegionID:
UInt32;
mInstrumentID:
UInt32;
end;
PCAFInstrumentChunk = ^CAFInstrumentChunk;

CAFStringID = record mStringID: UInt32;
mStringStartByteOffset:
Int64;
end;
PCAFStringID = ^CAFStringID;

CAFStrings = record mNumEntries: UInt32;
mStringsIDs:
array [0 .. 0] of CAFStringID;
end;
PCAFStrings = ^CAFStrings;

CAFInfoStrings = record mNumEntries: UInt32;
end;
PCAFInfoStrings = ^CAFInfoStrings;

CAFPositionPeak = record mValue: Single;
mFrameNumber:
UInt64;
end;
PCAFPositionPeak = ^CAFPositionPeak;

CAFPeakChunk = record mEditCount: UInt32;
mPeaks:
array [0 .. 0] of CAFPositionPeak;
end;
PCAFPeakChunk = ^CAFPeakChunk;

CAFOverviewSample = record mMinValue: Int16;
mMaxValue:
Int16;
end;
PCAFOverviewSample = ^CAFOverviewSample;

CAFOverviewChunk = record mEditCount: UInt32;
mNumFramesPerOVWSample:
UInt32;
mData:
array [0 .. 0] of CAFOverviewSample;
end;
PCAFOverviewChunk = ^CAFOverviewChunk;

CAFUMIDChunk = record mBytes: array [0 .. 63] of Byte;
end;
PCAFUMIDChunk = ^CAFUMIDChunk;

// ===== Exported string consts =====

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
                          function kAudioSessionOutputRoute_BluetoothHFP
                            : Pointer;
                            function kAudioSessionOutputRoute_BluetoothA2DP
                              : Pointer;
                              function kAudioSessionOutputRoute_BuiltInReceiver
                                : Pointer;
                                function kAudioSessionOutputRoute_BuiltInSpeaker
                                  : Pointer;
                                  function kAudioSessionOutputRoute_USBAudio
                                    : Pointer;
                                    function kAudioSessionOutputRoute_HDMI
                                      : Pointer;
                                      function kAudioSessionOutputRoute_AirPlay
                                        : Pointer;
                                        function kAudioSession_InputSourceKey_ID
                                        : Pointer;
                                        function kAudioSession_InputSourceKey_Description
                                        : Pointer;
                                        function kAudioSession_OutputDestinationKey_ID
                                        : Pointer;
                                        function kAudioSession_OutputDestinationKey_Description
                                        : Pointer;


                                        // ===== External functions =====

                                        const
                                        libAudioToolbox =
                                        '/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox';
                                        function AudioConverterNew
                                        (inSourceFormat: Pointer;
                                        inDestinationFormat: Pointer;
                                        outAudioConverter: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioConverterNew';
                                        function AudioConverterNewSpecific
                                        (inSourceFormat: Pointer;
                                        inDestinationFormat: Pointer;
                                        inNumberClassDescriptions: UInt32;
                                        inClassDescriptions: Pointer;
                                        outAudioConverter: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioConverterNewSpecific';
                                        function AudioConverterDispose
                                        (inAudioConverter: AudioConverterRef)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioConverterDispose';
                                        function AudioConverterReset
                                        (inAudioConverter: AudioConverterRef)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioConverterReset';
                                        function AudioConverterGetPropertyInfo
                                        (inAudioConverter: AudioConverterRef;
                                        inPropertyID: AudioConverterPropertyID;
                                        outSize: PLongWord; outWritable: PByte)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioConverterGetPropertyInfo';
                                        function AudioConverterGetProperty
                                        (inAudioConverter: AudioConverterRef;
                                        inPropertyID: AudioConverterPropertyID;
                                        ioPropertyDataSize: PLongWord;
                                        outPropertyData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioConverterGetProperty';
                                        function AudioConverterSetProperty
                                        (inAudioConverter: AudioConverterRef;
                                        inPropertyID: AudioConverterPropertyID;
                                        inPropertyDataSize: UInt32;
                                        inPropertyData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioConverterSetProperty';
                                        function AudioConverterConvertBuffer
                                        (inAudioConverter: AudioConverterRef;
                                        inInputDataSize: UInt32;
                                        inInputData: Pointer;
                                        ioOutputDataSize: PLongWord;
                                        outOutputData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioConverterConvertBuffer';
                                        function AudioConverterFillComplexBuffer
                                        (inAudioConverter: AudioConverterRef;
                                        inInputDataProc
                                        : AudioConverterComplexInputDataProc;
                                        inInputDataProcUserData: Pointer;
                                        ioOutputDataPacketSize: PLongWord;
                                        outOutputData: Pointer;
                                        outPacketDescription: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioConverterFillComplexBuffer';
                                        function AudioConverterConvertComplexBuffer
                                        (inAudioConverter: AudioConverterRef;
                                        inNumberPCMFrames: UInt32;
                                        inInputData: Pointer;
                                        outOutputData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioConverterConvertComplexBuffer';
                                        function NumBytesToNumAudioFileMarkers
                                        (inNumBytes: LongWord): LongWord; cdecl;
                                        external libAudioToolbox name _PU +
                                        'NumBytesToNumAudioFileMarkers';
                                        function NumAudioFileMarkersToNumBytes
                                        (inNumMarkers: LongWord): LongWord;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'NumAudioFileMarkersToNumBytes';
                                        function NextAudioFileRegion
                                        (inAFRegionPtr: Pointer): Pointer;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'NextAudioFileRegion';
                                        function AudioFileCreateWithURL
                                        (inFileRef: CFURLRef;
                                        inFileType: AudioFileTypeID;
                                        inFormat: Pointer;
                                        inFlags: AudioFileFlags;
                                        outAudioFile: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileCreateWithURL';
                                        function AudioFileOpenURL
                                        (inFileRef: CFURLRef;
                                        inPermissions: AudioFilePermissions;
                                        inFileTypeHint: AudioFileTypeID;
                                        outAudioFile: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileOpenURL';
                                        function AudioFileInitializeWithCallbacks
                                        (inClientData: Pointer;
                                        inReadFunc: AudioFile_ReadProc;
                                        inWriteFunc: AudioFile_WriteProc;
                                        inGetSizeFunc: AudioFile_GetSizeProc;
                                        inSetSizeFunc: AudioFile_SetSizeProc;
                                        inFileType: AudioFileTypeID;
                                        inFormat: Pointer;
                                        inFlags: AudioFileFlags;
                                        outAudioFile: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileInitializeWithCallbacks';
                                        function AudioFileOpenWithCallbacks
                                        (inClientData: Pointer;
                                        inReadFunc: AudioFile_ReadProc;
                                        inWriteFunc: AudioFile_WriteProc;
                                        inGetSizeFunc: AudioFile_GetSizeProc;
                                        inSetSizeFunc: AudioFile_SetSizeProc;
                                        inFileTypeHint: AudioFileTypeID;
                                        outAudioFile: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileOpenWithCallbacks';
                                        function AudioFileClose
                                        (inAudioFile: AudioFileID): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioFileClose';
                                        function AudioFileOptimize
                                        (inAudioFile: AudioFileID): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioFileOptimize';
                                        function AudioFileReadBytes
                                        (inAudioFile: AudioFileID;
                                        inUseCache: Boolean;
                                        inStartingByte: Int64;
                                        ioNumBytes: PLongWord;
                                        outBuffer: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileReadBytes';
                                        function AudioFileWriteBytes
                                        (inAudioFile: AudioFileID;
                                        inUseCache: Boolean;
                                        inStartingByte: Int64;
                                        ioNumBytes: PLongWord;
                                        inBuffer: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileWriteBytes';
                                        function AudioFileReadPacketData
                                        (inAudioFile: AudioFileID;
                                        inUseCache: Boolean;
                                        ioNumBytes: PLongWord;
                                        outPacketDescriptions: Pointer;
                                        inStartingPacket: Int64;
                                        ioNumPackets: PLongWord;
                                        outBuffer: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileReadPacketData';
                                        function AudioFileReadPackets
                                        (inAudioFile: AudioFileID;
                                        inUseCache: Boolean;
                                        outNumBytes: PLongWord;
                                        outPacketDescriptions: Pointer;
                                        inStartingPacket: Int64;
                                        ioNumPackets: PLongWord;
                                        outBuffer: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileReadPackets';
                                        function AudioFileWritePackets
                                        (inAudioFile: AudioFileID;
                                        inUseCache: Boolean; inNumBytes: UInt32;
                                        inPacketDescriptions: Pointer;
                                        inStartingPacket: Int64;
                                        ioNumPackets: PLongWord;
                                        inBuffer: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileWritePackets';
                                        function AudioFileCountUserData
                                        (inAudioFile: AudioFileID;
                                        inUserDataID: UInt32;
                                        outNumberItems: PLongWord): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioFileCountUserData';
                                        function AudioFileGetUserDataSize
                                        (inAudioFile: AudioFileID;
                                        inUserDataID: UInt32; inIndex: UInt32;
                                        outUserDataSize: PLongWord): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioFileGetUserDataSize';
                                        function AudioFileGetUserData
                                        (inAudioFile: AudioFileID;
                                        inUserDataID: UInt32; inIndex: UInt32;
                                        ioUserDataSize: PLongWord;
                                        outUserData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileGetUserData';
                                        function AudioFileSetUserData
                                        (inAudioFile: AudioFileID;
                                        inUserDataID: UInt32; inIndex: UInt32;
                                        inUserDataSize: UInt32;
                                        inUserData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileSetUserData';
                                        function AudioFileRemoveUserData
                                        (inAudioFile: AudioFileID;
                                        inUserDataID: UInt32; inIndex: UInt32)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileRemoveUserData';
                                        function AudioFileGetPropertyInfo
                                        (inAudioFile: AudioFileID;
                                        inPropertyID: AudioFilePropertyID;
                                        outDataSize: PLongWord;
                                        isWritable: PLongWord): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileGetPropertyInfo';
                                        function AudioFileGetProperty
                                        (inAudioFile: AudioFileID;
                                        inPropertyID: AudioFilePropertyID;
                                        ioDataSize: PLongWord;
                                        outPropertyData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioFileGetProperty';
                                        function AudioFileSetProperty
                                        (inAudioFile: AudioFileID;
                                        inPropertyID: AudioFilePropertyID;
                                        inDataSize: UInt32;
                                        inPropertyData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioFileSetProperty';
                                        function AudioFileGetGlobalInfoSize
                                        (inPropertyID: AudioFilePropertyID;
                                        inSpecifierSize: UInt32;
                                        inSpecifier: Pointer;
                                        outDataSize: PLongWord): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioFileGetGlobalInfoSize';
                                        function AudioFileGetGlobalInfo
                                        (inPropertyID: AudioFilePropertyID;
                                        inSpecifierSize: UInt32;
                                        inSpecifier: Pointer;
                                        ioDataSize: PLongWord;
                                        outPropertyData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioFileGetGlobalInfo';
                                        function AudioFileStreamOpen
                                        (inClientData: Pointer;
                                        inPropertyListenerProc
                                        : AudioFileStream_PropertyListenerProc;
                                        inPacketsProc
                                        : AudioFileStream_PacketsProc;
                                        inFileTypeHint: AudioFileTypeID;
                                        outAudioFileStream: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioFileStreamOpen';
                                        function AudioFileStreamParseBytes
                                        (inAudioFileStream: AudioFileStreamID;
                                        inDataByteSize: UInt32; inData: Pointer;
                                        inFlags: AudioFileStreamParseFlags)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileStreamParseBytes';
                                        function AudioFileStreamSeek
                                        (inAudioFileStream: AudioFileStreamID;
                                        inPacketOffset: Int64;
                                        outDataByteOffset: PInt64;
                                        ioFlags: UInt32): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileStreamSeek';
                                        function AudioFileStreamGetPropertyInfo
                                        (inAudioFileStream: AudioFileStreamID;
                                        inPropertyID: AudioFileStreamPropertyID;
                                        outPropertyDataSize: PLongWord;
                                        outWritable: PByte): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileStreamGetPropertyInfo';
                                        function AudioFileStreamGetProperty
                                        (inAudioFileStream: AudioFileStreamID;
                                        inPropertyID: AudioFileStreamPropertyID;
                                        ioPropertyDataSize: PLongWord;
                                        outPropertyData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioFileStreamGetProperty';
                                        function AudioFileStreamSetProperty
                                        (inAudioFileStream: AudioFileStreamID;
                                        inPropertyID: AudioFileStreamPropertyID;
                                        inPropertyDataSize: UInt32;
                                        inPropertyData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioFileStreamSetProperty';
                                        function AudioFileStreamClose
                                        (inAudioFileStream: AudioFileStreamID)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFileStreamClose';
                                        function AudioFormatGetPropertyInfo
                                        (inPropertyID: AudioFormatPropertyID;
                                        inSpecifierSize: UInt32;
                                        inSpecifier: Pointer;
                                        outPropertyDataSize: PLongWord)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioFormatGetPropertyInfo';
                                        function AudioFormatGetProperty
                                        (inPropertyID: AudioFormatPropertyID;
                                        inSpecifierSize: UInt32;
                                        inSpecifier: Pointer;
                                        ioPropertyDataSize: PLongWord;
                                        outPropertyData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioFormatGetProperty';
                                        function AudioQueueNewOutput
                                        (inFormat: Pointer;
                                        inCallbackProc
                                        : AudioQueueOutputCallback;
                                        inUserData: Pointer;
                                        inCallbackRunLoop: CFRunLoopRef;
                                        inCallbackRunLoopMode: CFStringRef;
                                        inFlags: UInt32; outAQ: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueNewOutput';
                                        function AudioQueueNewInput
                                        (inFormat: Pointer;
                                        inCallbackProc: AudioQueueInputCallback;
                                        inUserData: Pointer;
                                        inCallbackRunLoop: CFRunLoopRef;
                                        inCallbackRunLoopMode: CFStringRef;
                                        inFlags: UInt32; outAQ: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueNewInput';
                                        function AudioQueueDispose
                                        (inAQ: AudioQueueRef;
                                        inImmediate: Boolean): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueDispose';
                                        function AudioQueueAllocateBuffer
                                        (inAQ: AudioQueueRef;
                                        inBufferByteSize: UInt32;
                                        outBuffer: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueAllocateBuffer';
                                        function AudioQueueAllocateBufferWithPacketDescriptions
                                        (inAQ: AudioQueueRef;
                                        inBufferByteSize: UInt32;
                                        inNumberPacketDescriptions: UInt32;
                                        outBuffer: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueAllocateBufferWithPacketDescriptions';
                                        function AudioQueueFreeBuffer
                                        (inAQ: AudioQueueRef;
                                        inBuffer: AudioQueueBufferRef)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueFreeBuffer';
                                        function AudioQueueEnqueueBuffer
                                        (inAQ: AudioQueueRef;
                                        inBuffer: AudioQueueBufferRef;
                                        inNumPacketDescs: UInt32;
                                        inPacketDescs: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioQueueEnqueueBuffer';
                                        function AudioQueueEnqueueBufferWithParameters
                                        (inAQ: AudioQueueRef;
                                        inBuffer: AudioQueueBufferRef;
                                        inNumPacketDescs: UInt32;
                                        inPacketDescs: Pointer;
                                        inTrimFramesAtStart: UInt32;
                                        inTrimFramesAtEnd: UInt32;
                                        inNumParamValues: UInt32;
                                        inParamValues: Pointer;
                                        inStartTime: Pointer;
                                        outActualStartTime: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioQueueEnqueueBufferWithParameters';
                                        function AudioQueueStart
                                        (inAQ: AudioQueueRef;
                                        inStartTime: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueStart';
                                        function AudioQueuePrime
                                        (inAQ: AudioQueueRef;
                                        inNumberOfFramesToPrepare: UInt32;
                                        outNumberOfFramesPrepared: PLongWord)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueuePrime';
                                        function AudioQueueStop
                                        (inAQ: AudioQueueRef;
                                        inImmediate: Boolean): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueStop';
                                        function AudioQueuePause
                                        (inAQ: AudioQueueRef): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueuePause';
                                        function AudioQueueFlush
                                        (inAQ: AudioQueueRef): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueFlush';
                                        function AudioQueueReset
                                        (inAQ: AudioQueueRef): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueReset';
                                        function AudioQueueGetParameter
                                        (inAQ: AudioQueueRef;
                                        inParamID: AudioQueueParameterID;
                                        outValue: PSingle): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueGetParameter';
                                        function AudioQueueSetParameter
                                        (inAQ: AudioQueueRef;
                                        inParamID: AudioQueueParameterID;
                                        inValue: AudioQueueParameterValue)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueSetParameter';
                                        function AudioQueueGetProperty
                                        (inAQ: AudioQueueRef;
                                        inID: AudioQueuePropertyID;
                                        outData: Pointer; ioDataSize: PLongWord)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueGetProperty';
                                        function AudioQueueSetProperty
                                        (inAQ: AudioQueueRef;
                                        inID: AudioQueuePropertyID;
                                        inData: Pointer; inDataSize: UInt32)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueSetProperty';
                                        function AudioQueueGetPropertySize
                                        (inAQ: AudioQueueRef;
                                        inID: AudioQueuePropertyID;
                                        outDataSize: PLongWord): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioQueueGetPropertySize';
                                        function AudioQueueAddPropertyListener
                                        (inAQ: AudioQueueRef;
                                        inID: AudioQueuePropertyID;
                                        inProc: AudioQueuePropertyListenerProc;
                                        inUserData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueAddPropertyListener';
                                        function AudioQueueRemovePropertyListener
                                        (inAQ: AudioQueueRef;
                                        inID: AudioQueuePropertyID;
                                        inProc: AudioQueuePropertyListenerProc;
                                        inUserData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueRemovePropertyListener';
                                        function AudioQueueCreateTimeline
                                        (inAQ: AudioQueueRef;
                                        outTimeline: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueCreateTimeline';
                                        function AudioQueueDisposeTimeline
                                        (inAQ: AudioQueueRef;
                                        inTimeline: AudioQueueTimelineRef)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueDisposeTimeline';
                                        function AudioQueueGetCurrentTime
                                        (inAQ: AudioQueueRef;
                                        inTimeline: AudioQueueTimelineRef;
                                        outTimeStamp: Pointer;
                                        outTimelineDiscontinuity: PByte)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueGetCurrentTime';
                                        function AudioQueueDeviceGetCurrentTime
                                        (inAQ: AudioQueueRef;
                                        outTimeStamp: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueDeviceGetCurrentTime';
                                        function AudioQueueDeviceTranslateTime
                                        (inAQ: AudioQueueRef; inTime: Pointer;
                                        outTime: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueDeviceTranslateTime';
                                        function AudioQueueDeviceGetNearestStartTime
                                        (inAQ: AudioQueueRef;
                                        ioRequestedStartTime: Pointer;
                                        inFlags: UInt32): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueDeviceGetNearestStartTime';
                                        function AudioQueueSetOfflineRenderFormat
                                        (inAQ: AudioQueueRef; inFormat: Pointer;
                                        inLayout: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueSetOfflineRenderFormat';
                                        function AudioQueueOfflineRender
                                        (inAQ: AudioQueueRef;
                                        inTimestamp: Pointer;
                                        ioBuffer: AudioQueueBufferRef;
                                        inNumberFrames: UInt32): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioQueueOfflineRender';
                                        function AudioQueueProcessingTapNew
                                        (inAQ: AudioQueueRef;
                                        inCallback
                                        : AudioQueueProcessingTapCallback;
                                        inClientData: Pointer;
                                        inFlags: AudioQueueProcessingTapFlags;
                                        outMaxFrames: PLongWord;
                                        outProcessingFormat: Pointer;
                                        outAQTap: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueProcessingTapNew';
                                        function AudioQueueProcessingTapDispose
                                        (inAQTap: AudioQueueProcessingTapRef)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueProcessingTapDispose';
                                        function AudioQueueProcessingTapGetSourceAudio
                                        (inAQTap: AudioQueueProcessingTapRef;
                                        inNumberFrames: UInt32;
                                        ioTimeStamp: Pointer; outFlags: UInt32;
                                        outNumberFrames: PLongWord;
                                        ioData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueProcessingTapGetSourceAudio';
                                        function AudioQueueProcessingTapGetQueueTime
                                        (inAQTap: AudioQueueProcessingTapRef;
                                        outQueueSampleTime: PDouble;
                                        outQueueFrameCount: PLongWord)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioQueueProcessingTapGetQueueTime';
                                        function AudioSessionInitialize
                                        (inRunLoop: CFRunLoopRef;
                                        inRunLoopMode: CFStringRef;
                                        inInterruptionListener
                                        : AudioSessionInterruptionListener;
                                        inClientData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioSessionInitialize';
                                        function AudioSessionSetActive
                                        (active: Boolean): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioSessionSetActive';
                                        function AudioSessionSetActiveWithFlags
                                        (active: Boolean; inFlags: UInt32)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioSessionSetActiveWithFlags';
                                        function AudioSessionGetProperty
                                        (inID: AudioSessionPropertyID;
                                        ioDataSize: PLongWord; outData: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioSessionGetProperty';
                                        function AudioSessionSetProperty
                                        (inID: AudioSessionPropertyID;
                                        inDataSize: UInt32; inData: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioSessionSetProperty';
                                        function AudioSessionGetPropertySize
                                        (inID: AudioSessionPropertyID;
                                        outDataSize: PLongWord): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioSessionGetPropertySize';
                                        function AudioSessionAddPropertyListener
                                        (inID: AudioSessionPropertyID;
                                        inProc: AudioSessionPropertyListener;
                                        inClientData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioSessionAddPropertyListener';
                                        function AudioSessionRemovePropertyListener
                                        (inID: AudioSessionPropertyID)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioSessionRemovePropertyListener';
                                        function AudioSessionRemovePropertyListenerWithUserData
                                        (inID: AudioSessionPropertyID;
                                        inProc: AudioSessionPropertyListener;
                                        inClientData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioSessionRemovePropertyListenerWithUserData';
                                        function AudioServicesCreateSystemSoundID
                                        (inFileURL: CFURLRef;
                                        outSystemSoundID: PLongWord): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioServicesCreateSystemSoundID';
                                        function AudioServicesDisposeSystemSoundID
                                        (inSystemSoundID: SystemSoundID)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioServicesDisposeSystemSoundID';
                                        procedure AudioServicesPlayAlertSoundWithCompletion
                                        (inSystemSoundID: SystemSoundID;
                                        inCompletionBlock
                                        : TAudioToolboxInCompletionBlock);
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioServicesPlayAlertSoundWithCompletion';
                                        procedure AudioServicesPlaySystemSoundWithCompletion
                                        (inSystemSoundID: SystemSoundID;
                                        inCompletionBlock
                                        : TAudioToolboxInCompletionBlock);
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioServicesPlaySystemSoundWithCompletion';
                                        function AudioServicesGetPropertyInfo
                                        (inPropertyID: AudioServicesPropertyID;
                                        inSpecifierSize: UInt32;
                                        inSpecifier: Pointer;
                                        outPropertyDataSize: PLongWord;
                                        outWritable: PByte): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioServicesGetPropertyInfo';
                                        function AudioServicesGetProperty
                                        (inPropertyID: AudioServicesPropertyID;
                                        inSpecifierSize: UInt32;
                                        inSpecifier: Pointer;
                                        ioPropertyDataSize: PLongWord;
                                        outPropertyData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioServicesGetProperty';
                                        function AudioServicesSetProperty
                                        (inPropertyID: AudioServicesPropertyID;
                                        inSpecifierSize: UInt32;
                                        inSpecifier: Pointer;
                                        inPropertyDataSize: UInt32;
                                        inPropertyData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AudioServicesSetProperty';
                                        procedure AudioServicesPlayAlertSound
                                        (inSystemSoundID: SystemSoundID); cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioServicesPlayAlertSound';
                                        procedure AudioServicesPlaySystemSound
                                        (inSystemSoundID: SystemSoundID); cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioServicesPlaySystemSound';
                                        function AudioServicesAddSystemSoundCompletion
                                        (inSystemSoundID: SystemSoundID;
                                        inRunLoop: CFRunLoopRef;
                                        inRunLoopMode: CFStringRef;
                                        inCompletionRoutine
                                        : AudioServicesSystemSoundCompletionProc;
                                        inClientData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioServicesAddSystemSoundCompletion';
                                        procedure AudioServicesRemoveSystemSoundCompletion
                                        (inSystemSoundID: SystemSoundID); cdecl;
                                        external libAudioToolbox name _PU +
                                        'AudioServicesRemoveSystemSoundCompletion';
                                        function NewAUGraph(outGraph: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'NewAUGraph';
                                        function DisposeAUGraph
                                        (inGraph: AUGraph): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'DisposeAUGraph';
                                        function AUGraphAddNode
                                        (inGraph: AUGraph;
                                        inDescription: Pointer;
                                        outNode: PLongInt): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphAddNode';
                                        function AUGraphRemoveNode
                                        (inGraph: AUGraph; inNode: AUNode)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphRemoveNode';
                                        function AUGraphGetNodeCount
                                        (inGraph: AUGraph;
                                        outNumberOfNodes: PLongWord): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AUGraphGetNodeCount';
                                        function AUGraphGetIndNode
                                        (inGraph: AUGraph; inIndex: UInt32;
                                        outNode: PLongInt): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphGetIndNode';
                                        function AUGraphNodeInfo
                                        (inGraph: AUGraph; inNode: AUNode;
                                        outDescription: Pointer;
                                        outAudioUnit: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphNodeInfo';
                                        function AUGraphConnectNodeInput
                                        (inGraph: AUGraph; inSourceNode: AUNode;
                                        inSourceOutputNumber: UInt32;
                                        inDestNode: AUNode;
                                        inDestInputNumber: UInt32): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AUGraphConnectNodeInput';
                                        function AUGraphSetNodeInputCallback
                                        (inGraph: AUGraph; inDestNode: AUNode;
                                        inDestInputNumber: UInt32;
                                        inInputCallback: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AUGraphSetNodeInputCallback';
                                        function AUGraphDisconnectNodeInput
                                        (inGraph: AUGraph; inDestNode: AUNode;
                                        inDestInputNumber: UInt32): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AUGraphDisconnectNodeInput';
                                        function AUGraphClearConnections
                                        (inGraph: AUGraph): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphClearConnections';
                                        function AUGraphGetNumberOfInteractions
                                        (inGraph: AUGraph;
                                        outNumInteractions: PLongWord)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphGetNumberOfInteractions';
                                        function AUGraphGetInteractionInfo
                                        (inGraph: AUGraph;
                                        inInteractionIndex: UInt32;
                                        outInteraction: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AUGraphGetInteractionInfo';
                                        function AUGraphCountNodeInteractions
                                        (inGraph: AUGraph; inNode: AUNode;
                                        outNumInteractions: PLongWord)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphCountNodeInteractions';
                                        function AUGraphGetNodeInteractions
                                        (inGraph: AUGraph; inNode: AUNode;
                                        ioNumInteractions: PLongWord;
                                        outInteractions: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AUGraphGetNodeInteractions';
                                        function AUGraphUpdate(inGraph: AUGraph;
                                        outIsUpdated: PByte): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphUpdate';
                                        function AUGraphOpen(inGraph: AUGraph)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphOpen';
                                        function AUGraphClose(inGraph: AUGraph)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphClose';
                                        function AUGraphInitialize
                                        (inGraph: AUGraph): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphInitialize';
                                        function AUGraphUninitialize
                                        (inGraph: AUGraph): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphUninitialize';
                                        function AUGraphStart(inGraph: AUGraph)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphStart';
                                        function AUGraphStop(inGraph: AUGraph)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphStop';
                                        function AUGraphIsOpen(inGraph: AUGraph;
                                        outIsOpen: PByte): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphIsOpen';
                                        function AUGraphIsInitialized
                                        (inGraph: AUGraph;
                                        outIsInitialized: PByte): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AUGraphIsInitialized';
                                        function AUGraphIsRunning
                                        (inGraph: AUGraph; outIsRunning: PByte)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphIsRunning';
                                        function AUGraphGetCPULoad
                                        (inGraph: AUGraph;
                                        outAverageCPULoad: PSingle): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'AUGraphGetCPULoad';
                                        function AUGraphGetMaxCPULoad
                                        (inGraph: AUGraph; outMaxLoad: PSingle)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphGetMaxCPULoad';
                                        function AUGraphAddRenderNotify
                                        (inGraph: AUGraph;
                                        inCallback: AURenderCallback;
                                        inRefCon: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphAddRenderNotify';
                                        function AUGraphRemoveRenderNotify
                                        (inGraph: AUGraph;
                                        inCallback: AURenderCallback;
                                        inRefCon: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'AUGraphRemoveRenderNotify';
                                        function ExtAudioFileOpenURL
                                        (inURL: CFURLRef;
                                        outExtAudioFile: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'ExtAudioFileOpenURL';
                                        function ExtAudioFileWrapAudioFileID
                                        (inFileID: AudioFileID;
                                        inForWriting: Boolean;
                                        outExtAudioFile: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'ExtAudioFileWrapAudioFileID';
                                        function ExtAudioFileCreateWithURL
                                        (inURL: CFURLRef;
                                        inFileType: AudioFileTypeID;
                                        inStreamDesc: Pointer;
                                        inChannelLayout: Pointer;
                                        inFlags: UInt32;
                                        outExtAudioFile: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'ExtAudioFileCreateWithURL';
                                        function ExtAudioFileDispose
                                        (inExtAudioFile: ExtAudioFileRef)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'ExtAudioFileDispose';
                                        function ExtAudioFileRead
                                        (inExtAudioFile: ExtAudioFileRef;
                                        ioNumberFrames: PLongWord;
                                        ioData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'ExtAudioFileRead';
                                        function ExtAudioFileWrite
                                        (inExtAudioFile: ExtAudioFileRef;
                                        inNumberFrames: UInt32; ioData: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'ExtAudioFileWrite';
                                        function ExtAudioFileWriteAsync
                                        (inExtAudioFile: ExtAudioFileRef;
                                        inNumberFrames: UInt32; ioData: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'ExtAudioFileWriteAsync';
                                        function ExtAudioFileSeek
                                        (inExtAudioFile: ExtAudioFileRef;
                                        inFrameOffset: Int64): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'ExtAudioFileSeek';
                                        function ExtAudioFileTell
                                        (inExtAudioFile: ExtAudioFileRef;
                                        outFrameOffset: PInt64): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'ExtAudioFileTell';
                                        function ExtAudioFileGetPropertyInfo
                                        (inExtAudioFile: ExtAudioFileRef;
                                        inPropertyID: ExtAudioFilePropertyID;
                                        outSize: PLongWord; outWritable: PByte)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'ExtAudioFileGetPropertyInfo';
                                        function ExtAudioFileGetProperty
                                        (inExtAudioFile: ExtAudioFileRef;
                                        inPropertyID: ExtAudioFilePropertyID;
                                        ioPropertyDataSize: PLongWord;
                                        outPropertyData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'ExtAudioFileGetProperty';
                                        function ExtAudioFileSetProperty
                                        (inExtAudioFile: ExtAudioFileRef;
                                        inPropertyID: ExtAudioFilePropertyID;
                                        inPropertyDataSize: UInt32;
                                        inPropertyData: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'ExtAudioFileSetProperty';
                                        function NewMusicPlayer
                                        (outPlayer: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'NewMusicPlayer';
                                        function DisposeMusicPlayer
                                        (inPlayer: MusicPlayer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'DisposeMusicPlayer';
                                        function MusicPlayerSetSequence
                                        (inPlayer: MusicPlayer;
                                        inSequence: MusicSequence): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicPlayerSetSequence';
                                        function MusicPlayerGetSequence
                                        (inPlayer: MusicPlayer;
                                        outSequence: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicPlayerGetSequence';
                                        function MusicPlayerSetTime
                                        (inPlayer: MusicPlayer;
                                        inTime: MusicTimeStamp): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicPlayerSetTime';
                                        function MusicPlayerGetTime
                                        (inPlayer: MusicPlayer;
                                        outTime: PDouble): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicPlayerGetTime';
                                        function MusicPlayerGetHostTimeForBeats
                                        (inPlayer: MusicPlayer;
                                        inBeats: MusicTimeStamp;
                                        outHostTime: PUInt64): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicPlayerGetHostTimeForBeats';
                                        function MusicPlayerGetBeatsForHostTime
                                        (inPlayer: MusicPlayer;
                                        inHostTime: UInt64; outBeats: PDouble)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicPlayerGetBeatsForHostTime';
                                        function MusicPlayerPreroll
                                        (inPlayer: MusicPlayer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicPlayerPreroll';
                                        function MusicPlayerStart
                                        (inPlayer: MusicPlayer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicPlayerStart';
                                        function MusicPlayerStop
                                        (inPlayer: MusicPlayer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicPlayerStop';
                                        function MusicPlayerIsPlaying
                                        (inPlayer: MusicPlayer;
                                        outIsPlaying: PByte): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicPlayerIsPlaying';
                                        function MusicPlayerSetPlayRateScalar
                                        (inPlayer: MusicPlayer;
                                        inScaleRate: Double): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicPlayerSetPlayRateScalar';
                                        function MusicPlayerGetPlayRateScalar
                                        (inPlayer: MusicPlayer;
                                        outScaleRate: PDouble): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicPlayerGetPlayRateScalar';
                                        function NewMusicSequence
                                        (outSequence: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'NewMusicSequence';
                                        function DisposeMusicSequence
                                        (inSequence: MusicSequence): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'DisposeMusicSequence';
                                        function MusicSequenceNewTrack
                                        (inSequence: MusicSequence;
                                        outTrack: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceNewTrack';
                                        function MusicSequenceDisposeTrack
                                        (inSequence: MusicSequence;
                                        inTrack: MusicTrack): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceDisposeTrack';
                                        function MusicSequenceGetTrackCount
                                        (inSequence: MusicSequence;
                                        outNumberOfTracks: PLongWord): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicSequenceGetTrackCount';
                                        function MusicSequenceGetIndTrack
                                        (inSequence: MusicSequence;
                                        inTrackIndex: UInt32; outTrack: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceGetIndTrack';
                                        function MusicSequenceGetTrackIndex
                                        (inSequence: MusicSequence;
                                        inTrack: MusicTrack;
                                        outTrackIndex: PLongWord): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicSequenceGetTrackIndex';
                                        function MusicSequenceGetTempoTrack
                                        (inSequence: MusicSequence;
                                        outTrack: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceGetTempoTrack';
                                        function MusicSequenceSetAUGraph
                                        (inSequence: MusicSequence;
                                        inGraph: AUGraph): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceSetAUGraph';
                                        function MusicSequenceGetAUGraph
                                        (inSequence: MusicSequence;
                                        outGraph: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceGetAUGraph';
                                        function MusicSequenceSetMIDIEndpoint
                                        (inSequence: MusicSequence;
                                        inEndpoint: MIDIEndpointRef): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicSequenceSetMIDIEndpoint';
                                        function MusicSequenceSetSequenceType
                                        (inSequence: MusicSequence;
                                        inType: MusicSequenceType): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicSequenceSetSequenceType';
                                        function MusicSequenceGetSequenceType
                                        (inSequence: MusicSequence;
                                        outType: UInt32): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceGetSequenceType';
                                        function MusicSequenceFileLoad
                                        (inSequence: MusicSequence;
                                        inFileRef: CFURLRef;
                                        inFileTypeHint: MusicSequenceFileTypeID;
                                        inFlags: MusicSequenceLoadFlags)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceFileLoad';
                                        function MusicSequenceFileLoadData
                                        (inSequence: MusicSequence;
                                        inData: CFDataRef;
                                        inFileTypeHint: MusicSequenceFileTypeID;
                                        inFlags: MusicSequenceLoadFlags)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceFileLoadData';
                                        function MusicSequenceSetSMPTEResolution
                                        (fps: SignedByte; ticks: Byte): Int16;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicSequenceSetSMPTEResolution';
                                        procedure MusicSequenceGetSMPTEResolution
                                        (inRes: Int16; fps: signed char *;
                                        ticks: PByte); cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceGetSMPTEResolution';
                                        function MusicSequenceFileCreate
                                        (inSequence: MusicSequence;
                                        inFileRef: CFURLRef;
                                        inFileType: MusicSequenceFileTypeID;
                                        inFlags: MusicSequenceFileFlags;
                                        inResolution: Int16): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceFileCreate';
                                        function MusicSequenceFileCreateData
                                        (inSequence: MusicSequence;
                                        inFileType: MusicSequenceFileTypeID;
                                        inFlags: MusicSequenceFileFlags;
                                        inResolution: Int16; outData: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceFileCreateData';
                                        function MusicSequenceReverse
                                        (inSequence: MusicSequence): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicSequenceReverse';
                                        function MusicSequenceGetSecondsForBeats
                                        (inSequence: MusicSequence;
                                        inBeats: MusicTimeStamp;
                                        outSeconds: PDouble): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceGetSecondsForBeats';
                                        function MusicSequenceGetBeatsForSeconds
                                        (inSequence: MusicSequence;
                                        inSeconds: Double; outBeats: PDouble)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceGetBeatsForSeconds';
                                        function MusicSequenceSetUserCallback
                                        (inSequence: MusicSequence;
                                        inCallback: MusicSequenceUserCallback;
                                        inClientData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceSetUserCallback';
                                        function MusicSequenceBeatsToBarBeatTime
                                        (inSequence: MusicSequence;
                                        inBeats: MusicTimeStamp;
                                        inSubbeatDivisor: UInt32;
                                        outBarBeatTime: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicSequenceBeatsToBarBeatTime';
                                        function MusicSequenceBarBeatTimeToBeats
                                        (inSequence: MusicSequence;
                                        inBarBeatTime: Pointer;
                                        outBeats: PDouble): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceBarBeatTimeToBeats';
                                        function MusicSequenceGetInfoDictionary
                                        (inSequence: MusicSequence)
                                        : CFDictionaryRef; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceGetInfoDictionary';
                                        function MusicTrackGetSequence
                                        (inTrack: MusicTrack;
                                        outSequence: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackGetSequence';
                                        function MusicTrackSetDestNode
                                        (inTrack: MusicTrack; inNode: AUNode)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackSetDestNode';
                                        function MusicTrackSetDestMIDIEndpoint
                                        (inTrack: MusicTrack;
                                        inEndpoint: MIDIEndpointRef): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicTrackSetDestMIDIEndpoint';
                                        function MusicTrackGetDestNode
                                        (inTrack: MusicTrack; outNode: PLongInt)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackGetDestNode';
                                        function MusicTrackGetDestMIDIEndpoint
                                        (inTrack: MusicTrack;
                                        outEndpoint: PLongWord): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicTrackGetDestMIDIEndpoint';
                                        function MusicTrackSetProperty
                                        (inTrack: MusicTrack;
                                        inPropertyID: UInt32; inData: Pointer;
                                        inLength: UInt32): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackSetProperty';
                                        function MusicTrackGetProperty
                                        (inTrack: MusicTrack;
                                        inPropertyID: UInt32; outData: Pointer;
                                        ioLength: PLongWord): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackGetProperty';
                                        function MusicTrackMoveEvents
                                        (inTrack: MusicTrack;
                                        inStartTime: MusicTimeStamp;
                                        inEndTime: MusicTimeStamp;
                                        inMoveTime: MusicTimeStamp): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicTrackMoveEvents';
                                        function MusicTrackClear
                                        (inTrack: MusicTrack;
                                        inStartTime: MusicTimeStamp;
                                        inEndTime: MusicTimeStamp): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicTrackClear';
                                        function MusicTrackCut
                                        (inTrack: MusicTrack;
                                        inStartTime: MusicTimeStamp;
                                        inEndTime: MusicTimeStamp): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicTrackCut';
                                        function MusicTrackCopyInsert
                                        (inSourceTrack: MusicTrack;
                                        inSourceStartTime: MusicTimeStamp;
                                        inSourceEndTime: MusicTimeStamp;
                                        inDestTrack: MusicTrack;
                                        inDestInsertTime: MusicTimeStamp)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackCopyInsert';
                                        function MusicTrackMerge
                                        (inSourceTrack: MusicTrack;
                                        inSourceStartTime: MusicTimeStamp;
                                        inSourceEndTime: MusicTimeStamp;
                                        inDestTrack: MusicTrack;
                                        inDestInsertTime: MusicTimeStamp)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackMerge';
                                        function MusicTrackNewMIDINoteEvent
                                        (inTrack: MusicTrack;
                                        inTimestamp: MusicTimeStamp;
                                        inMessage: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackNewMIDINoteEvent';
                                        function MusicTrackNewMIDIChannelEvent
                                        (inTrack: MusicTrack;
                                        inTimestamp: MusicTimeStamp;
                                        inMessage: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackNewMIDIChannelEvent';
                                        function MusicTrackNewMIDIRawDataEvent
                                        (inTrack: MusicTrack;
                                        inTimestamp: MusicTimeStamp;
                                        inRawData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackNewMIDIRawDataEvent';
                                        function MusicTrackNewExtendedNoteEvent
                                        (inTrack: MusicTrack;
                                        inTimestamp: MusicTimeStamp;
                                        inInfo: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackNewExtendedNoteEvent';
                                        function MusicTrackNewParameterEvent
                                        (inTrack: MusicTrack;
                                        inTimestamp: MusicTimeStamp;
                                        inInfo: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackNewParameterEvent';
                                        function MusicTrackNewExtendedTempoEvent
                                        (inTrack: MusicTrack;
                                        inTimestamp: MusicTimeStamp;
                                        inBPM: Double): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackNewExtendedTempoEvent';
                                        function MusicTrackNewMetaEvent
                                        (inTrack: MusicTrack;
                                        inTimestamp: MusicTimeStamp;
                                        inMetaEvent: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackNewMetaEvent';
                                        function MusicTrackNewUserEvent
                                        (inTrack: MusicTrack;
                                        inTimestamp: MusicTimeStamp;
                                        inUserData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicTrackNewUserEvent';
                                        function MusicTrackNewAUPresetEvent
                                        (inTrack: MusicTrack;
                                        inTimestamp: MusicTimeStamp;
                                        inPresetEvent: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicTrackNewAUPresetEvent';
                                        function NewMusicEventIterator
                                        (inTrack: MusicTrack;
                                        outIterator: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'NewMusicEventIterator';
                                        function DisposeMusicEventIterator
                                        (inIterator: MusicEventIterator)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'DisposeMusicEventIterator';
                                        function MusicEventIteratorSeek
                                        (inIterator: MusicEventIterator;
                                        inTimestamp: MusicTimeStamp): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicEventIteratorSeek';
                                        function MusicEventIteratorNextEvent
                                        (inIterator: MusicEventIterator)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicEventIteratorNextEvent';
                                        function MusicEventIteratorPreviousEvent
                                        (inIterator: MusicEventIterator)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicEventIteratorPreviousEvent';
                                        function MusicEventIteratorGetEventInfo
                                        (inIterator: MusicEventIterator;
                                        outTimeStamp: PDouble;
                                        outEventType: PLongWord;
                                        outEventData: Pointer;
                                        outEventDataSize: PLongWord): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicEventIteratorGetEventInfo';
                                        function MusicEventIteratorSetEventInfo
                                        (inIterator: MusicEventIterator;
                                        inEventType: MusicEventType;
                                        inEventData: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicEventIteratorSetEventInfo';
                                        function MusicEventIteratorSetEventTime
                                        (inIterator: MusicEventIterator;
                                        inTimestamp: MusicTimeStamp): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicEventIteratorSetEventTime';
                                        function MusicEventIteratorDeleteEvent
                                        (inIterator: MusicEventIterator)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicEventIteratorDeleteEvent';
                                        function MusicEventIteratorHasPreviousEvent
                                        (inIterator: MusicEventIterator;
                                        outHasPrevEvent: PByte): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicEventIteratorHasPreviousEvent';
                                        function MusicEventIteratorHasNextEvent
                                        (inIterator: MusicEventIterator;
                                        outHasNextEvent: PByte): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'MusicEventIteratorHasNextEvent';
                                        function MusicEventIteratorHasCurrentEvent
                                        (inIterator: MusicEventIterator;
                                        outHasCurEvent: PByte): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicEventIteratorHasCurrentEvent';
                                        function MusicSequenceLoadSMFData
                                        (inSequence: MusicSequence;
                                        inData: CFDataRef): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceLoadSMFData';
                                        function MusicSequenceLoadSMFWithFlags
                                        (inSequence: MusicSequence;
                                        inFileRef: Pointer;
                                        inFlags: MusicSequenceLoadFlags)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceLoadSMFWithFlags';
                                        function MusicSequenceLoadSMFDataWithFlags
                                        (inSequence: MusicSequence;
                                        inData: CFDataRef;
                                        inFlags: MusicSequenceLoadFlags)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceLoadSMFDataWithFlags';
                                        function MusicSequenceSaveMIDIFile
                                        (inSequence: MusicSequence;
                                        inParentDirectory: Pointer;
                                        inFileName: CFStringRef;
                                        inResolution: UInt16; inFlags: UInt32)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceSaveMIDIFile';
                                        function MusicSequenceSaveSMFData
                                        (inSequence: MusicSequence;
                                        outData: Pointer; inResolution: UInt16)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'MusicSequenceSaveSMFData';
                                        function NewMusicTrackFrom
                                        (inSourceTrack: MusicTrack;
                                        inSourceStartTime: MusicTimeStamp;
                                        inSourceEndTime: MusicTimeStamp;
                                        outNewTrack: Pointer): OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'NewMusicTrackFrom';
                                        procedure CAShow(inObject: Pointer);
                                        cdecl; external libAudioToolbox name _PU
                                        + 'CAShow';
                                        procedure CAShowFile(inObject: Pointer;
                                        inFile: Pointer); cdecl;
                                        external libAudioToolbox name _PU +
                                        'CAShowFile';
                                        function CopyNameFromSoundBank
                                        (inURL: CFURLRef; outName: Pointer)
                                        : OSStatus; cdecl;
                                        external libAudioToolbox name _PU +
                                        'CopyNameFromSoundBank';
                                        function CopyInstrumentInfoFromSoundBank
                                        (inURL: CFURLRef;
                                        outInstrumentInfo: Pointer): OSStatus;
                                        cdecl; external libAudioToolbox name _PU
                                        + 'CopyInstrumentInfoFromSoundBank';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AudioToolboxModule: THandle;

{$ENDIF IOS}

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
