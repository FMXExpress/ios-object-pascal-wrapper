{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreAudio
//

unit iOSapi.CoreAudio;

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
  iOSapi.Foundation;

const
  kAudio_UnimplementedError = -4;
  kAudio_FileNotFoundError = -43;
  kAudio_FilePermissionError = -54;
  kAudio_TooManyFilesOpenError = -42;
  kAudio_BadFilePathError = 561017960;
  kAudio_ParamError = -50;
  kAudio_MemFullError = -108;
  kAudioFormatLinearPCM = 1819304813;
  kAudioFormatAC3 = 1633889587;
  kAudioFormat60958AC3 = 1667326771;
  kAudioFormatAppleIMA4 = 1768775988;
  kAudioFormatMPEG4AAC = 1633772320;
  kAudioFormatMPEG4CELP = 1667591280;
  kAudioFormatMPEG4HVXC = 1752594531;
  kAudioFormatMPEG4TwinVQ = 1953986161;
  kAudioFormatMACE3 = 1296122675;
  kAudioFormatMACE6 = 1296122678;
  kAudioFormatULaw = 1970037111;
  kAudioFormatALaw = 1634492791;
  kAudioFormatQDesign = 1363430723;
  kAudioFormatQDesign2 = 1363430706;
  kAudioFormatQUALCOMM = 1365470320;
  kAudioFormatMPEGLayer1 = 778924081;
  kAudioFormatMPEGLayer2 = 778924082;
  kAudioFormatMPEGLayer3 = 778924083;
  kAudioFormatTimeCode = 1953066341;
  kAudioFormatMIDIStream = 1835623529;
  kAudioFormatParameterValueStream = 1634760307;
  kAudioFormatAppleLossless = 1634492771;
  kAudioFormatMPEG4AAC_HE = 1633772392;
  kAudioFormatMPEG4AAC_LD = 1633772396;
  kAudioFormatMPEG4AAC_ELD = 1633772389;
  kAudioFormatMPEG4AAC_ELD_SBR = 1633772390;
  kAudioFormatMPEG4AAC_ELD_V2 = 1633772391;
  kAudioFormatMPEG4AAC_HE_V2 = 1633772400;
  kAudioFormatMPEG4AAC_Spatial = 1633772403;
  kAudioFormatAMR = 1935764850;
  kAudioFormatAMR_WB = 1935767394;
  kAudioFormatAudible = 1096107074;
  kAudioFormatiLBC = 1768710755;
  kAudioFormatDVIIntelIMA = 1836253201;
  kAudioFormatMicrosoftGSM = 1836253233;
  kAudioFormatAES3 = 1634038579;
  kAudioFormatEnhancedAC3 = 1700998451;
  kAudioFormatFlagIsFloat = (1 shl 0);
  kAudioFormatFlagIsBigEndian = (1 shl 1);
  kAudioFormatFlagIsSignedInteger = (1 shl 2);
  kAudioFormatFlagIsPacked = (1 shl 3);
  kAudioFormatFlagIsAlignedHigh = (1 shl 4);
  kAudioFormatFlagIsNonInterleaved = (1 shl 5);
  kAudioFormatFlagIsNonMixable = (1 shl 6);
  kAudioFormatFlagsAreAllClear = 2147483648;
  kLinearPCMFormatFlagIsFloat = kAudioFormatFlagIsFloat;
  kLinearPCMFormatFlagIsBigEndian = kAudioFormatFlagIsBigEndian;
  kLinearPCMFormatFlagIsSignedInteger = kAudioFormatFlagIsSignedInteger;
  kLinearPCMFormatFlagIsPacked = kAudioFormatFlagIsPacked;
  kLinearPCMFormatFlagIsAlignedHigh = kAudioFormatFlagIsAlignedHigh;
  kLinearPCMFormatFlagIsNonInterleaved = kAudioFormatFlagIsNonInterleaved;
  kLinearPCMFormatFlagIsNonMixable = kAudioFormatFlagIsNonMixable;
  kLinearPCMFormatFlagsSampleFractionShift = 7;
  kLinearPCMFormatFlagsSampleFractionMask =
    (63 shl kLinearPCMFormatFlagsSampleFractionShift);
  kLinearPCMFormatFlagsAreAllClear = kAudioFormatFlagsAreAllClear;
  kAppleLosslessFormatFlag_16BitSourceData = 1;
  kAppleLosslessFormatFlag_20BitSourceData = 2;
  kAppleLosslessFormatFlag_24BitSourceData = 3;
  kAppleLosslessFormatFlag_32BitSourceData = 4;
  kAudioFormatFlagsNativeEndian = 0;
  kAudioFormatFlagsCanonical = kAudioFormatFlagIsSignedInteger or
    kAudioFormatFlagsNativeEndian or kAudioFormatFlagIsPacked;
  kAudioFormatFlagsAudioUnitCanonical = kAudioFormatFlagIsSignedInteger or
    kAudioFormatFlagsNativeEndian or kAudioFormatFlagIsPacked or
    kAudioFormatFlagIsNonInterleaved or
    (24 shl kLinearPCMFormatFlagsSampleFractionShift);
  kAudioFormatFlagsNativeFloatPacked = kAudioFormatFlagIsFloat or
    kAudioFormatFlagsNativeEndian or kAudioFormatFlagIsPacked;
  kSMPTETimeType24 = 0;
  kSMPTETimeType25 = 1;
  kSMPTETimeType30Drop = 2;
  kSMPTETimeType30 = 3;
  kSMPTETimeType2997 = 4;
  kSMPTETimeType2997Drop = 5;
  kSMPTETimeType60 = 6;
  kSMPTETimeType5994 = 7;
  kSMPTETimeType60Drop = 8;
  kSMPTETimeType5994Drop = 9;
  kSMPTETimeType50 = 10;
  kSMPTETimeType2398 = 11;
  kSMPTETimeUnknown = 0;
  kSMPTETimeValid = (1 shl 0);
  kSMPTETimeRunning = (1 shl 1);
  kAudioTimeStampNothingValid = 0;
  kAudioTimeStampSampleTimeValid = (1 shl 0);
  kAudioTimeStampHostTimeValid = (1 shl 1);
  kAudioTimeStampRateScalarValid = (1 shl 2);
  kAudioTimeStampWordClockTimeValid = (1 shl 3);
  kAudioTimeStampSMPTETimeValid = (1 shl 4);
  kAudioTimeStampSampleHostTimeValid = (kAudioTimeStampSampleTimeValid or
    kAudioTimeStampHostTimeValid);
  kAudioChannelLabel_Unknown = 4294967295;
  kAudioChannelLabel_Unused = 0;
  kAudioChannelLabel_UseCoordinates = 100;
  kAudioChannelLabel_Left = 1;
  kAudioChannelLabel_Right = 2;
  kAudioChannelLabel_Center = 3;
  kAudioChannelLabel_LFEScreen = 4;
  kAudioChannelLabel_LeftSurround = 5;
  kAudioChannelLabel_RightSurround = 6;
  kAudioChannelLabel_LeftCenter = 7;
  kAudioChannelLabel_RightCenter = 8;
  kAudioChannelLabel_CenterSurround = 9;
  kAudioChannelLabel_LeftSurroundDirect = 10;
  kAudioChannelLabel_RightSurroundDirect = 11;
  kAudioChannelLabel_TopCenterSurround = 12;
  kAudioChannelLabel_VerticalHeightLeft = 13;
  kAudioChannelLabel_VerticalHeightCenter = 14;
  kAudioChannelLabel_VerticalHeightRight = 15;
  kAudioChannelLabel_TopBackLeft = 16;
  kAudioChannelLabel_TopBackCenter = 17;
  kAudioChannelLabel_TopBackRight = 18;
  kAudioChannelLabel_RearSurroundLeft = 33;
  kAudioChannelLabel_RearSurroundRight = 34;
  kAudioChannelLabel_LeftWide = 35;
  kAudioChannelLabel_RightWide = 36;
  kAudioChannelLabel_LFE2 = 37;
  kAudioChannelLabel_LeftTotal = 38;
  kAudioChannelLabel_RightTotal = 39;
  kAudioChannelLabel_HearingImpaired = 40;
  kAudioChannelLabel_Narration = 41;
  kAudioChannelLabel_Mono = 42;
  kAudioChannelLabel_DialogCentricMix = 43;
  kAudioChannelLabel_CenterSurroundDirect = 44;
  kAudioChannelLabel_Haptic = 45;
  kAudioChannelLabel_Ambisonic_W = 200;
  kAudioChannelLabel_Ambisonic_X = 201;
  kAudioChannelLabel_Ambisonic_Y = 202;
  kAudioChannelLabel_Ambisonic_Z = 203;
  kAudioChannelLabel_MS_Mid = 204;
  kAudioChannelLabel_MS_Side = 205;
  kAudioChannelLabel_XY_X = 206;
  kAudioChannelLabel_XY_Y = 207;
  kAudioChannelLabel_HeadphonesLeft = 301;
  kAudioChannelLabel_HeadphonesRight = 302;
  kAudioChannelLabel_ClickTrack = 304;
  kAudioChannelLabel_ForeignLanguage = 305;
  kAudioChannelLabel_Discrete = 400;
  kAudioChannelLabel_Discrete_0 = (1 shl 16) or 0;
  kAudioChannelLabel_Discrete_1 = (1 shl 16) or 1;
  kAudioChannelLabel_Discrete_2 = (1 shl 16) or 2;
  kAudioChannelLabel_Discrete_3 = (1 shl 16) or 3;
  kAudioChannelLabel_Discrete_4 = (1 shl 16) or 4;
  kAudioChannelLabel_Discrete_5 = (1 shl 16) or 5;
  kAudioChannelLabel_Discrete_6 = (1 shl 16) or 6;
  kAudioChannelLabel_Discrete_7 = (1 shl 16) or 7;
  kAudioChannelLabel_Discrete_8 = (1 shl 16) or 8;
  kAudioChannelLabel_Discrete_9 = (1 shl 16) or 9;
  kAudioChannelLabel_Discrete_10 = (1 shl 16) or 10;
  kAudioChannelLabel_Discrete_11 = (1 shl 16) or 11;
  kAudioChannelLabel_Discrete_12 = (1 shl 16) or 12;
  kAudioChannelLabel_Discrete_13 = (1 shl 16) or 13;
  kAudioChannelLabel_Discrete_14 = (1 shl 16) or 14;
  kAudioChannelLabel_Discrete_15 = (1 shl 16) or 15;
  kAudioChannelLabel_Discrete_65535 = (1 shl 16) or 65535;
  kAudioChannelBit_Left = (1 shl 0);
  kAudioChannelBit_Right = (1 shl 1);
  kAudioChannelBit_Center = (1 shl 2);
  kAudioChannelBit_LFEScreen = (1 shl 3);
  kAudioChannelBit_LeftSurround = (1 shl 4);
  kAudioChannelBit_RightSurround = (1 shl 5);
  kAudioChannelBit_LeftCenter = (1 shl 6);
  kAudioChannelBit_RightCenter = (1 shl 7);
  kAudioChannelBit_CenterSurround = (1 shl 8);
  kAudioChannelBit_LeftSurroundDirect = (1 shl 9);
  kAudioChannelBit_RightSurroundDirect = (1 shl 10);
  kAudioChannelBit_TopCenterSurround = (1 shl 11);
  kAudioChannelBit_VerticalHeightLeft = (1 shl 12);
  kAudioChannelBit_VerticalHeightCenter = (1 shl 13);
  kAudioChannelBit_VerticalHeightRight = (1 shl 14);
  kAudioChannelBit_TopBackLeft = (1 shl 15);
  kAudioChannelBit_TopBackCenter = (1 shl 16);
  kAudioChannelBit_TopBackRight = (1 shl 17);
  kAudioChannelFlags_AllOff = 0;
  kAudioChannelFlags_RectangularCoordinates = (1 shl 0);
  kAudioChannelFlags_SphericalCoordinates = (1 shl 1);
  kAudioChannelFlags_Meters = (1 shl 2);
  kAudioChannelCoordinates_LeftRight = 0;
  kAudioChannelCoordinates_BackFront = 1;
  kAudioChannelCoordinates_DownUp = 2;
  kAudioChannelCoordinates_Azimuth = 0;
  kAudioChannelCoordinates_Elevation = 1;
  kAudioChannelCoordinates_Distance = 2;
  kAudioChannelLayoutTag_UseChannelDescriptions = (0 shl 16) or 0;
  kAudioChannelLayoutTag_UseChannelBitmap = (1 shl 16) or 0;
  kAudioChannelLayoutTag_Mono = (100 shl 16) or 1;
  kAudioChannelLayoutTag_Stereo = (101 shl 16) or 2;
  kAudioChannelLayoutTag_StereoHeadphones = (102 shl 16) or 2;
  kAudioChannelLayoutTag_MatrixStereo = (103 shl 16) or 2;
  kAudioChannelLayoutTag_MidSide = (104 shl 16) or 2;
  kAudioChannelLayoutTag_XY = (105 shl 16) or 2;
  kAudioChannelLayoutTag_Binaural = (106 shl 16) or 2;
  kAudioChannelLayoutTag_Ambisonic_B_Format = (107 shl 16) or 4;
  kAudioChannelLayoutTag_Quadraphonic = (108 shl 16) or 4;
  kAudioChannelLayoutTag_Pentagonal = (109 shl 16) or 5;
  kAudioChannelLayoutTag_Hexagonal = (110 shl 16) or 6;
  kAudioChannelLayoutTag_Octagonal = (111 shl 16) or 8;
  kAudioChannelLayoutTag_Cube = (112 shl 16) or 8;
  kAudioChannelLayoutTag_MPEG_1_0 = kAudioChannelLayoutTag_Mono;
  kAudioChannelLayoutTag_MPEG_2_0 = kAudioChannelLayoutTag_Stereo;
  kAudioChannelLayoutTag_MPEG_3_0_A = (113 shl 16) or 3;
  kAudioChannelLayoutTag_MPEG_3_0_B = (114 shl 16) or 3;
  kAudioChannelLayoutTag_MPEG_4_0_A = (115 shl 16) or 4;
  kAudioChannelLayoutTag_MPEG_4_0_B = (116 shl 16) or 4;
  kAudioChannelLayoutTag_MPEG_5_0_A = (117 shl 16) or 5;
  kAudioChannelLayoutTag_MPEG_5_0_B = (118 shl 16) or 5;
  kAudioChannelLayoutTag_MPEG_5_0_C = (119 shl 16) or 5;
  kAudioChannelLayoutTag_MPEG_5_0_D = (120 shl 16) or 5;
  kAudioChannelLayoutTag_MPEG_5_1_A = (121 shl 16) or 6;
  kAudioChannelLayoutTag_MPEG_5_1_B = (122 shl 16) or 6;
  kAudioChannelLayoutTag_MPEG_5_1_C = (123 shl 16) or 6;
  kAudioChannelLayoutTag_MPEG_5_1_D = (124 shl 16) or 6;
  kAudioChannelLayoutTag_MPEG_6_1_A = (125 shl 16) or 7;
  kAudioChannelLayoutTag_MPEG_7_1_A = (126 shl 16) or 8;
  kAudioChannelLayoutTag_MPEG_7_1_B = (127 shl 16) or 8;
  kAudioChannelLayoutTag_MPEG_7_1_C = (128 shl 16) or 8;
  kAudioChannelLayoutTag_Emagic_Default_7_1 = (129 shl 16) or 8;
  kAudioChannelLayoutTag_SMPTE_DTV = (130 shl 16) or 8;
  kAudioChannelLayoutTag_ITU_1_0 = kAudioChannelLayoutTag_Mono;
  kAudioChannelLayoutTag_ITU_2_0 = kAudioChannelLayoutTag_Stereo;
  kAudioChannelLayoutTag_ITU_2_1 = (131 shl 16) or 3;
  kAudioChannelLayoutTag_ITU_2_2 = (132 shl 16) or 4;
  kAudioChannelLayoutTag_ITU_3_0 = kAudioChannelLayoutTag_MPEG_3_0_A;
  kAudioChannelLayoutTag_ITU_3_1 = kAudioChannelLayoutTag_MPEG_4_0_A;
  kAudioChannelLayoutTag_ITU_3_2 = kAudioChannelLayoutTag_MPEG_5_0_A;
  kAudioChannelLayoutTag_ITU_3_2_1 = kAudioChannelLayoutTag_MPEG_5_1_A;
  kAudioChannelLayoutTag_ITU_3_4_1 = kAudioChannelLayoutTag_MPEG_7_1_C;
  kAudioChannelLayoutTag_DVD_0 = kAudioChannelLayoutTag_Mono;
  kAudioChannelLayoutTag_DVD_1 = kAudioChannelLayoutTag_Stereo;
  kAudioChannelLayoutTag_DVD_2 = kAudioChannelLayoutTag_ITU_2_1;
  kAudioChannelLayoutTag_DVD_3 = kAudioChannelLayoutTag_ITU_2_2;
  kAudioChannelLayoutTag_DVD_4 = (133 shl 16) or 3;
  kAudioChannelLayoutTag_DVD_5 = (134 shl 16) or 4;
  kAudioChannelLayoutTag_DVD_6 = (135 shl 16) or 5;
  kAudioChannelLayoutTag_DVD_7 = kAudioChannelLayoutTag_MPEG_3_0_A;
  kAudioChannelLayoutTag_DVD_8 = kAudioChannelLayoutTag_MPEG_4_0_A;
  kAudioChannelLayoutTag_DVD_9 = kAudioChannelLayoutTag_MPEG_5_0_A;
  kAudioChannelLayoutTag_DVD_10 = (136 shl 16) or 4;
  kAudioChannelLayoutTag_DVD_11 = (137 shl 16) or 5;
  kAudioChannelLayoutTag_DVD_12 = kAudioChannelLayoutTag_MPEG_5_1_A;
  kAudioChannelLayoutTag_DVD_13 = kAudioChannelLayoutTag_DVD_8;
  kAudioChannelLayoutTag_DVD_14 = kAudioChannelLayoutTag_DVD_9;
  kAudioChannelLayoutTag_DVD_15 = kAudioChannelLayoutTag_DVD_10;
  kAudioChannelLayoutTag_DVD_16 = kAudioChannelLayoutTag_DVD_11;
  kAudioChannelLayoutTag_DVD_17 = kAudioChannelLayoutTag_DVD_12;
  kAudioChannelLayoutTag_DVD_18 = (138 shl 16) or 5;
  kAudioChannelLayoutTag_DVD_19 = kAudioChannelLayoutTag_MPEG_5_0_B;
  kAudioChannelLayoutTag_DVD_20 = kAudioChannelLayoutTag_MPEG_5_1_B;
  kAudioChannelLayoutTag_AudioUnit_4 = kAudioChannelLayoutTag_Quadraphonic;
  kAudioChannelLayoutTag_AudioUnit_5 = kAudioChannelLayoutTag_Pentagonal;
  kAudioChannelLayoutTag_AudioUnit_6 = kAudioChannelLayoutTag_Hexagonal;
  kAudioChannelLayoutTag_AudioUnit_8 = kAudioChannelLayoutTag_Octagonal;
  kAudioChannelLayoutTag_AudioUnit_5_0 = kAudioChannelLayoutTag_MPEG_5_0_B;
  kAudioChannelLayoutTag_AudioUnit_6_0 = (139 shl 16) or 6;
  kAudioChannelLayoutTag_AudioUnit_7_0 = (140 shl 16) or 7;
  kAudioChannelLayoutTag_AudioUnit_7_0_Front = (148 shl 16) or 7;
  kAudioChannelLayoutTag_AudioUnit_5_1 = kAudioChannelLayoutTag_MPEG_5_1_A;
  kAudioChannelLayoutTag_AudioUnit_6_1 = kAudioChannelLayoutTag_MPEG_6_1_A;
  kAudioChannelLayoutTag_AudioUnit_7_1 = kAudioChannelLayoutTag_MPEG_7_1_C;
  kAudioChannelLayoutTag_AudioUnit_7_1_Front =
    kAudioChannelLayoutTag_MPEG_7_1_A;
  kAudioChannelLayoutTag_AAC_3_0 = kAudioChannelLayoutTag_MPEG_3_0_B;
  kAudioChannelLayoutTag_AAC_Quadraphonic = kAudioChannelLayoutTag_Quadraphonic;
  kAudioChannelLayoutTag_AAC_4_0 = kAudioChannelLayoutTag_MPEG_4_0_B;
  kAudioChannelLayoutTag_AAC_5_0 = kAudioChannelLayoutTag_MPEG_5_0_D;
  kAudioChannelLayoutTag_AAC_5_1 = kAudioChannelLayoutTag_MPEG_5_1_D;
  kAudioChannelLayoutTag_AAC_6_0 = (141 shl 16) or 6;
  kAudioChannelLayoutTag_AAC_6_1 = (142 shl 16) or 7;
  kAudioChannelLayoutTag_AAC_7_0 = (143 shl 16) or 7;
  kAudioChannelLayoutTag_AAC_7_1 = kAudioChannelLayoutTag_MPEG_7_1_B;
  kAudioChannelLayoutTag_AAC_7_1_B = (183 shl 16) or 8;
  kAudioChannelLayoutTag_AAC_7_1_C = (184 shl 16) or 8;
  kAudioChannelLayoutTag_AAC_Octagonal = (144 shl 16) or 8;
  kAudioChannelLayoutTag_TMH_10_2_std = (145 shl 16) or 16;
  kAudioChannelLayoutTag_TMH_10_2_full = (146 shl 16) or 21;
  kAudioChannelLayoutTag_AC3_1_0_1 = (149 shl 16) or 2;
  kAudioChannelLayoutTag_AC3_3_0 = (150 shl 16) or 3;
  kAudioChannelLayoutTag_AC3_3_1 = (151 shl 16) or 4;
  kAudioChannelLayoutTag_AC3_3_0_1 = (152 shl 16) or 4;
  kAudioChannelLayoutTag_AC3_2_1_1 = (153 shl 16) or 4;
  kAudioChannelLayoutTag_AC3_3_1_1 = (154 shl 16) or 5;
  kAudioChannelLayoutTag_EAC_6_0_A = (155 shl 16) or 6;
  kAudioChannelLayoutTag_EAC_7_0_A = (156 shl 16) or 7;
  kAudioChannelLayoutTag_EAC3_6_1_A = (157 shl 16) or 7;
  kAudioChannelLayoutTag_EAC3_6_1_B = (158 shl 16) or 7;
  kAudioChannelLayoutTag_EAC3_6_1_C = (159 shl 16) or 7;
  kAudioChannelLayoutTag_EAC3_7_1_A = (160 shl 16) or 8;
  kAudioChannelLayoutTag_EAC3_7_1_B = (161 shl 16) or 8;
  kAudioChannelLayoutTag_EAC3_7_1_C = (162 shl 16) or 8;
  kAudioChannelLayoutTag_EAC3_7_1_D = (163 shl 16) or 8;
  kAudioChannelLayoutTag_EAC3_7_1_E = (164 shl 16) or 8;
  kAudioChannelLayoutTag_EAC3_7_1_F = (165 shl 16) or 8;
  kAudioChannelLayoutTag_EAC3_7_1_G = (166 shl 16) or 8;
  kAudioChannelLayoutTag_EAC3_7_1_H = (167 shl 16) or 8;
  kAudioChannelLayoutTag_DTS_3_1 = (168 shl 16) or 4;
  kAudioChannelLayoutTag_DTS_4_1 = (169 shl 16) or 5;
  kAudioChannelLayoutTag_DTS_6_0_A = (170 shl 16) or 6;
  kAudioChannelLayoutTag_DTS_6_0_B = (171 shl 16) or 6;
  kAudioChannelLayoutTag_DTS_6_0_C = (172 shl 16) or 6;
  kAudioChannelLayoutTag_DTS_6_1_A = (173 shl 16) or 7;
  kAudioChannelLayoutTag_DTS_6_1_B = (174 shl 16) or 7;
  kAudioChannelLayoutTag_DTS_6_1_C = (175 shl 16) or 7;
  kAudioChannelLayoutTag_DTS_7_0 = (176 shl 16) or 7;
  kAudioChannelLayoutTag_DTS_7_1 = (177 shl 16) or 8;
  kAudioChannelLayoutTag_DTS_8_0_A = (178 shl 16) or 8;
  kAudioChannelLayoutTag_DTS_8_0_B = (179 shl 16) or 8;
  kAudioChannelLayoutTag_DTS_8_1_A = (180 shl 16) or 9;
  kAudioChannelLayoutTag_DTS_8_1_B = (181 shl 16) or 9;
  kAudioChannelLayoutTag_DTS_6_1_D = (182 shl 16) or 7;
  kAudioChannelLayoutTag_DiscreteInOrder = (147 shl 16) or 0;
  kAudioChannelLayoutTag_Unknown = 4294901760;
  kMPEG4Object_AAC_Main = 1;
  kMPEG4Object_AAC_LC = 2;
  kMPEG4Object_AAC_SSR = 3;
  kMPEG4Object_AAC_LTP = 4;
  kMPEG4Object_AAC_SBR = 5;
  kMPEG4Object_AAC_Scalable = 6;
  kMPEG4Object_TwinVQ = 7;
  kMPEG4Object_CELP = 8;
  kMPEG4Object_HVXC = 9;

type
  // ===== Framework typedefs =====
{$M+}
  AudioValueRange = record
    mMinimum: Double;
    mMaximum: Double;
  end;

  PAudioValueRange = ^AudioValueRange;

  AudioValueTranslation = record
    mInputData: Pointer;
    mInputDataSize: UInt32;
    mOutputData: Pointer;
    mOutputDataSize: UInt32;
  end;

  PAudioValueTranslation = ^AudioValueTranslation;

  AudioBuffer = record
    mNumberChannels: UInt32;
    mDataByteSize: UInt32;
    mData: Pointer;
  end;

  PAudioBuffer = ^AudioBuffer;

  AudioBufferList = record
    mNumberBuffers: UInt32;
    mBuffers: array [0 .. 0] of AudioBuffer;
  end;

  PAudioBufferList = ^AudioBufferList;

  AudioSampleType = Int16;
  AudioUnitSampleType = Int32;
  AudioFormatID = UInt32;
  AudioFormatFlags = UInt32;

  AudioStreamBasicDescription = record
    mSampleRate: Double;
    mFormatID: AudioFormatID;
    mFormatFlags: AudioFormatFlags;
    mBytesPerPacket: UInt32;
    mFramesPerPacket: UInt32;
    mBytesPerFrame: UInt32;
    mChannelsPerFrame: UInt32;
    mBitsPerChannel: UInt32;
    mReserved: UInt32;
  end;

  PAudioStreamBasicDescription = ^AudioStreamBasicDescription;

  AudioStreamPacketDescription = record
    mStartOffset: Int64;
    mVariableFramesInPacket: UInt32;
    mDataByteSize: UInt32;
  end;

  PAudioStreamPacketDescription = ^AudioStreamPacketDescription;

  SMPTETimeType = UInt32;
  SMPTETimeFlags = UInt32;

  SMPTETime = record
    mSubframes: Int16;
    mSubframeDivisor: Int16;
    mCounter: UInt32;
    mType: SMPTETimeType;
    mFlags: SMPTETimeFlags;
    mHours: Int16;
    mMinutes: Int16;
    mSeconds: Int16;
    mFrames: Int16;
  end;

  PSMPTETime = ^SMPTETime;

  AudioTimeStampFlags = UInt32;

  AudioTimeStamp = record
    mSampleTime: Double;
    mHostTime: UInt64;
    mRateScalar: Double;
    mWordClockTime: UInt64;
    mSMPTETime: SMPTETime;
    mFlags: AudioTimeStampFlags;
    mReserved: UInt32;
  end;

  PAudioTimeStamp = ^AudioTimeStamp;

  FourCharCode = UInt32;
  OSType = FourCharCode;

  AudioClassDescription = record
    mType: OSType;
    mSubType: OSType;
    mManufacturer: OSType;
  end;

  PAudioClassDescription = ^AudioClassDescription;

  AudioChannelLabel = UInt32;
  AudioChannelLayoutTag = UInt32;
  AudioChannelBitmap = UInt32;
  AudioChannelFlags = UInt32;
  AudioChannelCoordinateIndex = UInt32;

  AudioChannelDescription = record
    mChannelLabel: AudioChannelLabel;
    mChannelFlags: AudioChannelFlags;
    mCoordinates: array [0 .. 2] of Single;
  end;

  PAudioChannelDescription = ^AudioChannelDescription;

  AudioChannelLayout = record
    mChannelLayoutTag: AudioChannelLayoutTag;
    mChannelBitmap: AudioChannelBitmap;
    mNumberChannelDescriptions: UInt32;
    mChannelDescriptions: array [0 .. 0] of AudioChannelDescription;
  end;

  PAudioChannelLayout = ^AudioChannelLayout;

  MPEG4ObjectID = LongInt;
  // ===== External functions =====

const
  libCoreAudio = '/System/Library/Frameworks/CoreAudio.framework/CoreAudio';
function AudioChannelLayoutTag_GetNumberOfChannels
  (inLayoutTag: AudioChannelLayoutTag): UInt32; cdecl;
  external libCoreAudio name _PU + 'AudioChannelLayoutTag_GetNumberOfChannels';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreAudioModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreAudioModule := dlopen(MarshaledAString(libCoreAudio), RTLD_LAZY);

finalization

dlclose(CoreAudioModule);
{$ENDIF IOS}

end.
