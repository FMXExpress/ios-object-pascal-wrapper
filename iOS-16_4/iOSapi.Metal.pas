{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework Metal
//

unit iOSapi.Metal;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation,
  iOSapi.IOSurface;

const
  MTLResourceUsageRead = 1 shl 0;
  MTLResourceUsageWrite = 1 shl 1;
  MTLResourceUsageSample = 1 shl 2;
  MTLBarrierScopeBuffers = 1 shl 0;
  MTLBarrierScopeTextures = 1 shl 1;
  MTLBarrierScopeRenderTargets = 1 shl 2;
  MTLPurgeableStateKeepCurrent = 1;
  MTLPurgeableStateNonVolatile = 2;
  MTLPurgeableStateVolatile = 3;
  MTLPurgeableStateEmpty = 4;
  MTLCPUCacheModeDefaultCache = 0;
  MTLCPUCacheModeWriteCombined = 1;
  MTLStorageModeShared = 0;
  MTLStorageModeManaged = 1;
  MTLStorageModePrivate = 2;
  MTLStorageModeMemoryless = 3;
  MTLHazardTrackingModeDefault = 0;
  MTLHazardTrackingModeUntracked = 1;
  MTLHazardTrackingModeTracked = 2;
  MTLResourceCPUCacheModeDefaultCache = MTLCPUCacheModeDefaultCache shl 0;
  MTLResourceCPUCacheModeWriteCombined = MTLCPUCacheModeWriteCombined shl 0;
  MTLResourceStorageModeShared = MTLStorageModeShared shl 4;
  MTLResourceStorageModeManaged = MTLStorageModeManaged shl 4;
  MTLResourceStorageModePrivate = MTLStorageModePrivate shl 4;
  MTLResourceStorageModeMemoryless = MTLStorageModeMemoryless shl 4;
  MTLResourceHazardTrackingModeDefault = MTLHazardTrackingModeDefault shl 8;
  MTLResourceHazardTrackingModeUntracked = MTLHazardTrackingModeUntracked shl 8;
  MTLResourceHazardTrackingModeTracked = MTLHazardTrackingModeTracked shl 8;
  MTLResourceOptionCPUCacheModeDefault = MTLResourceCPUCacheModeDefaultCache;
  MTLResourceOptionCPUCacheModeWriteCombined =
    MTLResourceCPUCacheModeWriteCombined;
  MTLPixelFormatInvalid = 0;
  MTLPixelFormatA8Unorm = 1;
  MTLPixelFormatR8Unorm = 10;
  MTLPixelFormatR8Unorm_sRGB = 11;
  MTLPixelFormatR8Snorm = 12;
  MTLPixelFormatR8Uint = 13;
  MTLPixelFormatR8Sint = 14;
  MTLPixelFormatR16Unorm = 20;
  MTLPixelFormatR16Snorm = 22;
  MTLPixelFormatR16Uint = 23;
  MTLPixelFormatR16Sint = 24;
  MTLPixelFormatR16Float = 25;
  MTLPixelFormatRG8Unorm = 30;
  MTLPixelFormatRG8Unorm_sRGB = 31;
  MTLPixelFormatRG8Snorm = 32;
  MTLPixelFormatRG8Uint = 33;
  MTLPixelFormatRG8Sint = 34;
  MTLPixelFormatB5G6R5Unorm = 40;
  MTLPixelFormatA1BGR5Unorm = 41;
  MTLPixelFormatABGR4Unorm = 42;
  MTLPixelFormatBGR5A1Unorm = 43;
  MTLPixelFormatR32Uint = 53;
  MTLPixelFormatR32Sint = 54;
  MTLPixelFormatR32Float = 55;
  MTLPixelFormatRG16Unorm = 60;
  MTLPixelFormatRG16Snorm = 62;
  MTLPixelFormatRG16Uint = 63;
  MTLPixelFormatRG16Sint = 64;
  MTLPixelFormatRG16Float = 65;
  MTLPixelFormatRGBA8Unorm = 70;
  MTLPixelFormatRGBA8Unorm_sRGB = 71;
  MTLPixelFormatRGBA8Snorm = 72;
  MTLPixelFormatRGBA8Uint = 73;
  MTLPixelFormatRGBA8Sint = 74;
  MTLPixelFormatBGRA8Unorm = 80;
  MTLPixelFormatBGRA8Unorm_sRGB = 81;
  MTLPixelFormatRGB10A2Unorm = 90;
  MTLPixelFormatRGB10A2Uint = 91;
  MTLPixelFormatRG11B10Float = 92;
  MTLPixelFormatRGB9E5Float = 93;
  MTLPixelFormatBGR10A2Unorm = 94;
  MTLPixelFormatBGR10_XR = 554;
  MTLPixelFormatBGR10_XR_sRGB = 555;
  MTLPixelFormatRG32Uint = 103;
  MTLPixelFormatRG32Sint = 104;
  MTLPixelFormatRG32Float = 105;
  MTLPixelFormatRGBA16Unorm = 110;
  MTLPixelFormatRGBA16Snorm = 112;
  MTLPixelFormatRGBA16Uint = 113;
  MTLPixelFormatRGBA16Sint = 114;
  MTLPixelFormatRGBA16Float = 115;
  MTLPixelFormatBGRA10_XR = 552;
  MTLPixelFormatBGRA10_XR_sRGB = 553;
  MTLPixelFormatRGBA32Uint = 123;
  MTLPixelFormatRGBA32Sint = 124;
  MTLPixelFormatRGBA32Float = 125;
  MTLPixelFormatBC1_RGBA = 130;
  MTLPixelFormatBC1_RGBA_sRGB = 131;
  MTLPixelFormatBC2_RGBA = 132;
  MTLPixelFormatBC2_RGBA_sRGB = 133;
  MTLPixelFormatBC3_RGBA = 134;
  MTLPixelFormatBC3_RGBA_sRGB = 135;
  MTLPixelFormatBC4_RUnorm = 140;
  MTLPixelFormatBC4_RSnorm = 141;
  MTLPixelFormatBC5_RGUnorm = 142;
  MTLPixelFormatBC5_RGSnorm = 143;
  MTLPixelFormatBC6H_RGBFloat = 150;
  MTLPixelFormatBC6H_RGBUfloat = 151;
  MTLPixelFormatBC7_RGBAUnorm = 152;
  MTLPixelFormatBC7_RGBAUnorm_sRGB = 153;
  MTLPixelFormatPVRTC_RGB_2BPP = 160;
  MTLPixelFormatPVRTC_RGB_2BPP_sRGB = 161;
  MTLPixelFormatPVRTC_RGB_4BPP = 162;
  MTLPixelFormatPVRTC_RGB_4BPP_sRGB = 163;
  MTLPixelFormatPVRTC_RGBA_2BPP = 164;
  MTLPixelFormatPVRTC_RGBA_2BPP_sRGB = 165;
  MTLPixelFormatPVRTC_RGBA_4BPP = 166;
  MTLPixelFormatPVRTC_RGBA_4BPP_sRGB = 167;
  MTLPixelFormatEAC_R11Unorm = 170;
  MTLPixelFormatEAC_R11Snorm = 172;
  MTLPixelFormatEAC_RG11Unorm = 174;
  MTLPixelFormatEAC_RG11Snorm = 176;
  MTLPixelFormatEAC_RGBA8 = 178;
  MTLPixelFormatEAC_RGBA8_sRGB = 179;
  MTLPixelFormatETC2_RGB8 = 180;
  MTLPixelFormatETC2_RGB8_sRGB = 181;
  MTLPixelFormatETC2_RGB8A1 = 182;
  MTLPixelFormatETC2_RGB8A1_sRGB = 183;
  MTLPixelFormatASTC_4x4_sRGB = 186;
  MTLPixelFormatASTC_5x4_sRGB = 187;
  MTLPixelFormatASTC_5x5_sRGB = 188;
  MTLPixelFormatASTC_6x5_sRGB = 189;
  MTLPixelFormatASTC_6x6_sRGB = 190;
  MTLPixelFormatASTC_8x5_sRGB = 192;
  MTLPixelFormatASTC_8x6_sRGB = 193;
  MTLPixelFormatASTC_8x8_sRGB = 194;
  MTLPixelFormatASTC_10x5_sRGB = 195;
  MTLPixelFormatASTC_10x6_sRGB = 196;
  MTLPixelFormatASTC_10x8_sRGB = 197;
  MTLPixelFormatASTC_10x10_sRGB = 198;
  MTLPixelFormatASTC_12x10_sRGB = 199;
  MTLPixelFormatASTC_12x12_sRGB = 200;
  MTLPixelFormatASTC_4x4_LDR = 204;
  MTLPixelFormatASTC_5x4_LDR = 205;
  MTLPixelFormatASTC_5x5_LDR = 206;
  MTLPixelFormatASTC_6x5_LDR = 207;
  MTLPixelFormatASTC_6x6_LDR = 208;
  MTLPixelFormatASTC_8x5_LDR = 210;
  MTLPixelFormatASTC_8x6_LDR = 211;
  MTLPixelFormatASTC_8x8_LDR = 212;
  MTLPixelFormatASTC_10x5_LDR = 213;
  MTLPixelFormatASTC_10x6_LDR = 214;
  MTLPixelFormatASTC_10x8_LDR = 215;
  MTLPixelFormatASTC_10x10_LDR = 216;
  MTLPixelFormatASTC_12x10_LDR = 217;
  MTLPixelFormatASTC_12x12_LDR = 218;
  MTLPixelFormatASTC_4x4_HDR = 222;
  MTLPixelFormatASTC_5x4_HDR = 223;
  MTLPixelFormatASTC_5x5_HDR = 224;
  MTLPixelFormatASTC_6x5_HDR = 225;
  MTLPixelFormatASTC_6x6_HDR = 226;
  MTLPixelFormatASTC_8x5_HDR = 228;
  MTLPixelFormatASTC_8x6_HDR = 229;
  MTLPixelFormatASTC_8x8_HDR = 230;
  MTLPixelFormatASTC_10x5_HDR = 231;
  MTLPixelFormatASTC_10x6_HDR = 232;
  MTLPixelFormatASTC_10x8_HDR = 233;
  MTLPixelFormatASTC_10x10_HDR = 234;
  MTLPixelFormatASTC_12x10_HDR = 235;
  MTLPixelFormatASTC_12x12_HDR = 236;
  MTLPixelFormatGBGR422 = 240;
  MTLPixelFormatBGRG422 = 241;
  MTLPixelFormatDepth16Unorm = 250;
  MTLPixelFormatDepth32Float = 252;
  MTLPixelFormatStencil8 = 253;
  MTLPixelFormatDepth24Unorm_Stencil8 = 255;
  MTLPixelFormatDepth32Float_Stencil8 = 260;
  MTLPixelFormatX32_Stencil8 = 261;
  MTLPixelFormatX24_Stencil8 = 262;
  MTLTextureType1D = 0;
  MTLTextureType1DArray = 1;
  MTLTextureType2D = 2;
  MTLTextureType2DArray = 3;
  MTLTextureType2DMultisample = 4;
  MTLTextureTypeCube = 5;
  MTLTextureTypeCubeArray = 6;
  MTLTextureType3D = 7;
  MTLTextureType2DMultisampleArray = 8;
  MTLTextureTypeTextureBuffer = 9;
  MTLTextureSwizzleZero = 0;
  MTLTextureSwizzleOne = 1;
  MTLTextureSwizzleRed = 2;
  MTLTextureSwizzleGreen = 3;
  MTLTextureSwizzleBlue = 4;
  MTLTextureSwizzleAlpha = 5;
  MTLTextureUsageUnknown = 0;
  MTLTextureUsageShaderRead = 1;
  MTLTextureUsageShaderWrite = 2;
  MTLTextureUsageRenderTarget = 4;
  MTLTextureUsagePixelFormatView = 16;
  MTLTextureCompressionTypeLossless = 0;
  MTLTextureCompressionTypeLossy = 1;
  MTLDataTypeNone = 0;
  MTLDataTypeStruct = 1;
  MTLDataTypeArray = 2;
  MTLDataTypeFloat = 3;
  MTLDataTypeFloat2 = 4;
  MTLDataTypeFloat3 = 5;
  MTLDataTypeFloat4 = 6;
  MTLDataTypeFloat2x2 = 7;
  MTLDataTypeFloat2x3 = 8;
  MTLDataTypeFloat2x4 = 9;
  MTLDataTypeFloat3x2 = 10;
  MTLDataTypeFloat3x3 = 11;
  MTLDataTypeFloat3x4 = 12;
  MTLDataTypeFloat4x2 = 13;
  MTLDataTypeFloat4x3 = 14;
  MTLDataTypeFloat4x4 = 15;
  MTLDataTypeHalf = 16;
  MTLDataTypeHalf2 = 17;
  MTLDataTypeHalf3 = 18;
  MTLDataTypeHalf4 = 19;
  MTLDataTypeHalf2x2 = 20;
  MTLDataTypeHalf2x3 = 21;
  MTLDataTypeHalf2x4 = 22;
  MTLDataTypeHalf3x2 = 23;
  MTLDataTypeHalf3x3 = 24;
  MTLDataTypeHalf3x4 = 25;
  MTLDataTypeHalf4x2 = 26;
  MTLDataTypeHalf4x3 = 27;
  MTLDataTypeHalf4x4 = 28;
  MTLDataTypeInt = 29;
  MTLDataTypeInt2 = 30;
  MTLDataTypeInt3 = 31;
  MTLDataTypeInt4 = 32;
  MTLDataTypeUInt = 33;
  MTLDataTypeUInt2 = 34;
  MTLDataTypeUInt3 = 35;
  MTLDataTypeUInt4 = 36;
  MTLDataTypeShort = 37;
  MTLDataTypeShort2 = 38;
  MTLDataTypeShort3 = 39;
  MTLDataTypeShort4 = 40;
  MTLDataTypeUShort = 41;
  MTLDataTypeUShort2 = 42;
  MTLDataTypeUShort3 = 43;
  MTLDataTypeUShort4 = 44;
  MTLDataTypeChar = 45;
  MTLDataTypeChar2 = 46;
  MTLDataTypeChar3 = 47;
  MTLDataTypeChar4 = 48;
  MTLDataTypeUChar = 49;
  MTLDataTypeUChar2 = 50;
  MTLDataTypeUChar3 = 51;
  MTLDataTypeUChar4 = 52;
  MTLDataTypeBool = 53;
  MTLDataTypeBool2 = 54;
  MTLDataTypeBool3 = 55;
  MTLDataTypeBool4 = 56;
  MTLDataTypeTexture = 58;
  MTLDataTypeSampler = 59;
  MTLDataTypePointer = 60;
  MTLDataTypeR8Unorm = 62;
  MTLDataTypeR8Snorm = 63;
  MTLDataTypeR16Unorm = 64;
  MTLDataTypeR16Snorm = 65;
  MTLDataTypeRG8Unorm = 66;
  MTLDataTypeRG8Snorm = 67;
  MTLDataTypeRG16Unorm = 68;
  MTLDataTypeRG16Snorm = 69;
  MTLDataTypeRGBA8Unorm = 70;
  MTLDataTypeRGBA8Unorm_sRGB = 71;
  MTLDataTypeRGBA8Snorm = 72;
  MTLDataTypeRGBA16Unorm = 73;
  MTLDataTypeRGBA16Snorm = 74;
  MTLDataTypeRGB10A2Unorm = 75;
  MTLDataTypeRG11B10Float = 76;
  MTLDataTypeRGB9E5Float = 77;
  MTLDataTypeRenderPipeline = 78;
  MTLDataTypeComputePipeline = 79;
  MTLDataTypeIndirectCommandBuffer = 80;
  MTLDataTypeLong = 81;
  MTLDataTypeLong2 = 82;
  MTLDataTypeLong3 = 83;
  MTLDataTypeLong4 = 84;
  MTLDataTypeULong = 85;
  MTLDataTypeULong2 = 86;
  MTLDataTypeULong3 = 87;
  MTLDataTypeULong4 = 88;
  MTLDataTypeVisibleFunctionTable = 115;
  MTLDataTypeIntersectionFunctionTable = 116;
  MTLDataTypePrimitiveAccelerationStructure = 117;
  MTLDataTypeInstanceAccelerationStructure = 118;
  MTLBindingTypeBuffer = 0;
  MTLBindingTypeThreadgroupMemory = 1;
  MTLBindingTypeTexture = 2;
  MTLBindingTypeSampler = 3;
  MTLBindingTypeImageblockData = 16;
  MTLBindingTypeImageblock = 17;
  MTLBindingTypeVisibleFunctionTable = 24;
  MTLBindingTypePrimitiveAccelerationStructure = 25;
  MTLBindingTypeInstanceAccelerationStructure = 26;
  MTLBindingTypeIntersectionFunctionTable = 27;
  MTLBindingTypeObjectPayload = 34;
  MTLArgumentTypeBuffer = 0;
  MTLArgumentTypeThreadgroupMemory = 1;
  MTLArgumentTypeTexture = 2;
  MTLArgumentTypeSampler = 3;
  MTLArgumentTypeImageblockData = 16;
  MTLArgumentTypeImageblock = 17;
  MTLArgumentTypeVisibleFunctionTable = 24;
  MTLArgumentTypePrimitiveAccelerationStructure = 25;
  MTLArgumentTypeInstanceAccelerationStructure = 26;
  MTLArgumentTypeIntersectionFunctionTable = 27;
  MTLArgumentAccessReadOnly = 0;
  MTLArgumentAccessReadWrite = 1;
  MTLArgumentAccessWriteOnly = 2;
  MTLFunctionOptionNone = 0;
  MTLFunctionOptionCompileToBinary = 1 shl 0;
  MTLPatchTypeNone = 0;
  MTLPatchTypeTriangle = 1;
  MTLPatchTypeQuad = 2;
  MTLFunctionTypeVertex = 1;
  MTLFunctionTypeFragment = 2;
  MTLFunctionTypeKernel = 3;
  MTLFunctionTypeVisible = 5;
  MTLFunctionTypeIntersection = 6;
  MTLFunctionTypeMesh = 7;
  MTLFunctionTypeObject = 8;
  MTLLanguageVersion1_0 = (1 shl 16);
  MTLLanguageVersion1_1 = (1 shl 16) + 1;
  MTLLanguageVersion1_2 = (1 shl 16) + 2;
  MTLLanguageVersion2_0 = (2 shl 16);
  MTLLanguageVersion2_1 = (2 shl 16) + 1;
  MTLLanguageVersion2_2 = (2 shl 16) + 2;
  MTLLanguageVersion2_3 = (2 shl 16) + 3;
  MTLLanguageVersion2_4 = (2 shl 16) + 4;
  MTLLanguageVersion3_0 = (3 shl 16) + 0;
  MTLLibraryTypeExecutable = 0;
  MTLLibraryTypeDynamic = 1;
  MTLLibraryOptimizationLevelDefault = 0;
  MTLLibraryOptimizationLevelSize = 1;
  MTLCompileSymbolVisibilityDefault = 0;
  MTLCompileSymbolVisibilityHidden = 1;
  MTLLibraryErrorUnsupported = 1;
  MTLLibraryErrorInternal = 2;
  MTLLibraryErrorCompileFailure = 3;
  MTLLibraryErrorCompileWarning = 4;
  MTLLibraryErrorFunctionNotFound = 5;
  MTLLibraryErrorFileNotFound = 6;
  MTLCounterSampleBufferErrorOutOfMemory = 0;
  MTLCounterSampleBufferErrorInvalid = 1;
  MTLCounterSampleBufferErrorInternal = 2;
  MTLIOCompressionMethodZlib = 0;
  MTLIOCompressionMethodLZFSE = 1;
  MTLIOCompressionMethodLZ4 = 2;
  MTLIOCompressionMethodLZMA = 3;
  MTLIOCompressionMethodLZBitmap = 4;
  MTLFeatureSet_iOS_GPUFamily1_v1 = 0;
  MTLFeatureSet_iOS_GPUFamily2_v1 = 1;
  MTLFeatureSet_iOS_GPUFamily1_v2 = 2;
  MTLFeatureSet_iOS_GPUFamily2_v2 = 3;
  MTLFeatureSet_iOS_GPUFamily3_v1 = 4;
  MTLFeatureSet_iOS_GPUFamily1_v3 = 5;
  MTLFeatureSet_iOS_GPUFamily2_v3 = 6;
  MTLFeatureSet_iOS_GPUFamily3_v2 = 7;
  MTLFeatureSet_iOS_GPUFamily1_v4 = 8;
  MTLFeatureSet_iOS_GPUFamily2_v4 = 9;
  MTLFeatureSet_iOS_GPUFamily3_v3 = 10;
  MTLFeatureSet_iOS_GPUFamily4_v1 = 11;
  MTLFeatureSet_iOS_GPUFamily1_v5 = 12;
  MTLFeatureSet_iOS_GPUFamily2_v5 = 13;
  MTLFeatureSet_iOS_GPUFamily3_v4 = 14;
  MTLFeatureSet_iOS_GPUFamily4_v2 = 15;
  MTLFeatureSet_iOS_GPUFamily5_v1 = 16;
  MTLFeatureSet_macOS_GPUFamily1_v1 = 10000;
  MTLFeatureSet_OSX_GPUFamily1_v1 = MTLFeatureSet_macOS_GPUFamily1_v1;
  MTLFeatureSet_macOS_GPUFamily1_v2 = 10001;
  MTLFeatureSet_OSX_GPUFamily1_v2 = MTLFeatureSet_macOS_GPUFamily1_v2;
  MTLFeatureSet_macOS_ReadWriteTextureTier2 = 10002;
  MTLFeatureSet_OSX_ReadWriteTextureTier2 =
    MTLFeatureSet_macOS_ReadWriteTextureTier2;
  MTLFeatureSet_macOS_GPUFamily1_v3 = 10003;
  MTLFeatureSet_macOS_GPUFamily1_v4 = 10004;
  MTLFeatureSet_macOS_GPUFamily2_v1 = 10005;
  MTLFeatureSet_tvOS_GPUFamily1_v1 = 30000;
  MTLFeatureSet_tvOS_GPUFamily1_v1 = MTLFeatureSet_tvOS_GPUFamily1_v1;
  MTLFeatureSet_tvOS_GPUFamily1_v2 = 30001;
  MTLFeatureSet_tvOS_GPUFamily1_v3 = 30002;
  MTLFeatureSet_tvOS_GPUFamily1_v4 = 30004;
  MTLGPUFamilyApple1 = 1001;
  MTLGPUFamilyApple2 = 1002;
  MTLGPUFamilyApple3 = 1003;
  MTLGPUFamilyApple4 = 1004;
  MTLGPUFamilyApple5 = 1005;
  MTLGPUFamilyApple6 = 1006;
  MTLGPUFamilyApple7 = 1007;
  MTLGPUFamilyApple8 = 1008;
  MTLGPUFamilyMac1 = 2001;
  MTLGPUFamilyMac2 = 2002;
  MTLGPUFamilyCommon1 = 3001;
  MTLGPUFamilyCommon2 = 3002;
  MTLGPUFamilyCommon3 = 3003;
  MTLGPUFamilyMacCatalyst1 = 4001;
  MTLGPUFamilyMacCatalyst2 = 4002;
  MTLGPUFamilyMetal3 = 5001;
  MTLPipelineOptionNone = 0;
  MTLPipelineOptionArgumentInfo = 1 shl 0;
  MTLPipelineOptionBufferTypeInfo = 1 shl 1;
  MTLPipelineOptionFailOnBinaryArchiveMiss = 1 shl 2;
  MTLReadWriteTextureTierNone = 0;
  MTLReadWriteTextureTier1 = 1;
  MTLReadWriteTextureTier2 = 2;
  MTLArgumentBuffersTier1 = 0;
  MTLArgumentBuffersTier2 = 1;
  MTLSparseTextureRegionAlignmentModeOutward = 0;
  MTLSparseTextureRegionAlignmentModeInward = 1;
  MTLSparsePageSize16 = 101;
  MTLSparsePageSize64 = 102;
  MTLSparsePageSize256 = 103;
  MTLCounterSamplingPointAtStageBoundary = 0;
  MTLCounterSamplingPointAtDrawBoundary = 1;
  MTLCounterSamplingPointAtDispatchBoundary = 2;
  MTLCounterSamplingPointAtTileDispatchBoundary = 3;
  MTLCounterSamplingPointAtBlitBoundary = 4;
  MTLSparseTextureMappingModeMap = 0;
  MTLSparseTextureMappingModeUnmap = 1;
  MTLLoadActionDontCare = 0;
  MTLLoadActionLoad = 1;
  MTLLoadActionClear = 2;
  MTLStoreActionDontCare = 0;
  MTLStoreActionStore = 1;
  MTLStoreActionMultisampleResolve = 2;
  MTLStoreActionStoreAndMultisampleResolve = 3;
  MTLStoreActionUnknown = 4;
  MTLStoreActionCustomSampleDepthStore = 5;
  MTLStoreActionOptionNone = 0;
  MTLStoreActionOptionCustomSamplePositions = 1 shl 0;
  MTLMultisampleDepthResolveFilterSample0 = 0;
  MTLMultisampleDepthResolveFilterMin = 1;
  MTLMultisampleDepthResolveFilterMax = 2;
  MTLMultisampleStencilResolveFilterSample0 = 0;
  MTLMultisampleStencilResolveFilterDepthResolvedSample = 1;
  MTLBlitOptionNone = 0;
  MTLBlitOptionDepthFromDepthStencil = 1 shl 0;
  MTLBlitOptionStencilFromDepthStencil = 1 shl 1;
  MTLBlitOptionRowLinearPVRTC = 1 shl 2;
  MTLCommandBufferStatusNotEnqueued = 0;
  MTLCommandBufferStatusEnqueued = 1;
  MTLCommandBufferStatusCommitted = 2;
  MTLCommandBufferStatusScheduled = 3;
  MTLCommandBufferStatusCompleted = 4;
  MTLCommandBufferStatusError = 5;
  MTLCommandBufferErrorNone = 0;
  MTLCommandBufferErrorInternal = 1;
  MTLCommandBufferErrorTimeout = 2;
  MTLCommandBufferErrorPageFault = 3;
  MTLCommandBufferErrorBlacklisted = 4;
  MTLCommandBufferErrorAccessRevoked = 4;
  MTLCommandBufferErrorNotPermitted = 7;
  MTLCommandBufferErrorOutOfMemory = 8;
  MTLCommandBufferErrorInvalidResource = 9;
  MTLCommandBufferErrorMemoryless = 10;
  MTLCommandBufferErrorDeviceRemoved = 11;
  MTLCommandBufferErrorStackOverflow = 12;
  MTLCommandBufferErrorOptionNone = 0;
  MTLCommandBufferErrorOptionEncoderExecutionStatus = 1 shl 0;
  MTLCommandEncoderErrorStateUnknown = 0;
  MTLCommandEncoderErrorStateCompleted = 1;
  MTLCommandEncoderErrorStateAffected = 2;
  MTLCommandEncoderErrorStatePending = 3;
  MTLCommandEncoderErrorStateFaulted = 4;
  MTLDispatchTypeSerial = 0;
  MTLDispatchTypeConcurrent = 1;
  MTLCompareFunctionNever = 0;
  MTLCompareFunctionLess = 1;
  MTLCompareFunctionEqual = 2;
  MTLCompareFunctionLessEqual = 3;
  MTLCompareFunctionGreater = 4;
  MTLCompareFunctionNotEqual = 5;
  MTLCompareFunctionGreaterEqual = 6;
  MTLCompareFunctionAlways = 7;
  MTLStencilOperationKeep = 0;
  MTLStencilOperationZero = 1;
  MTLStencilOperationReplace = 2;
  MTLStencilOperationIncrementClamp = 3;
  MTLStencilOperationDecrementClamp = 4;
  MTLStencilOperationInvert = 5;
  MTLStencilOperationIncrementWrap = 6;
  MTLStencilOperationDecrementWrap = 7;
  MTLAttributeFormatInvalid = 0;
  MTLAttributeFormatUChar2 = 1;
  MTLAttributeFormatUChar3 = 2;
  MTLAttributeFormatUChar4 = 3;
  MTLAttributeFormatChar2 = 4;
  MTLAttributeFormatChar3 = 5;
  MTLAttributeFormatChar4 = 6;
  MTLAttributeFormatUChar2Normalized = 7;
  MTLAttributeFormatUChar3Normalized = 8;
  MTLAttributeFormatUChar4Normalized = 9;
  MTLAttributeFormatChar2Normalized = 10;
  MTLAttributeFormatChar3Normalized = 11;
  MTLAttributeFormatChar4Normalized = 12;
  MTLAttributeFormatUShort2 = 13;
  MTLAttributeFormatUShort3 = 14;
  MTLAttributeFormatUShort4 = 15;
  MTLAttributeFormatShort2 = 16;
  MTLAttributeFormatShort3 = 17;
  MTLAttributeFormatShort4 = 18;
  MTLAttributeFormatUShort2Normalized = 19;
  MTLAttributeFormatUShort3Normalized = 20;
  MTLAttributeFormatUShort4Normalized = 21;
  MTLAttributeFormatShort2Normalized = 22;
  MTLAttributeFormatShort3Normalized = 23;
  MTLAttributeFormatShort4Normalized = 24;
  MTLAttributeFormatHalf2 = 25;
  MTLAttributeFormatHalf3 = 26;
  MTLAttributeFormatHalf4 = 27;
  MTLAttributeFormatFloat = 28;
  MTLAttributeFormatFloat2 = 29;
  MTLAttributeFormatFloat3 = 30;
  MTLAttributeFormatFloat4 = 31;
  MTLAttributeFormatInt = 32;
  MTLAttributeFormatInt2 = 33;
  MTLAttributeFormatInt3 = 34;
  MTLAttributeFormatInt4 = 35;
  MTLAttributeFormatUInt = 36;
  MTLAttributeFormatUInt2 = 37;
  MTLAttributeFormatUInt3 = 38;
  MTLAttributeFormatUInt4 = 39;
  MTLAttributeFormatInt1010102Normalized = 40;
  MTLAttributeFormatUInt1010102Normalized = 41;
  MTLAttributeFormatUChar4Normalized_BGRA = 42;
  MTLAttributeFormatUChar = 45;
  MTLAttributeFormatChar = 46;
  MTLAttributeFormatUCharNormalized = 47;
  MTLAttributeFormatCharNormalized = 48;
  MTLAttributeFormatUShort = 49;
  MTLAttributeFormatShort = 50;
  MTLAttributeFormatUShortNormalized = 51;
  MTLAttributeFormatShortNormalized = 52;
  MTLAttributeFormatHalf = 53;
  MTLIndexTypeUInt16 = 0;
  MTLIndexTypeUInt32 = 1;
  MTLStepFunctionConstant = 0;
  MTLStepFunctionPerVertex = 1;
  MTLStepFunctionPerInstance = 2;
  MTLStepFunctionPerPatch = 3;
  MTLStepFunctionPerPatchControlPoint = 4;
  MTLStepFunctionThreadPositionInGridX = 5;
  MTLStepFunctionThreadPositionInGridY = 6;
  MTLStepFunctionThreadPositionInGridXIndexed = 7;
  MTLStepFunctionThreadPositionInGridYIndexed = 8;
  MTLMutabilityDefault = 0;
  MTLMutabilityMutable = 1;
  MTLMutabilityImmutable = 2;
  MTLPrimitiveTypePoint = 0;
  MTLPrimitiveTypeLine = 1;
  MTLPrimitiveTypeLineStrip = 2;
  MTLPrimitiveTypeTriangle = 3;
  MTLPrimitiveTypeTriangleStrip = 4;
  MTLVisibilityResultModeDisabled = 0;
  MTLVisibilityResultModeBoolean = 1;
  MTLVisibilityResultModeCounting = 2;
  MTLCullModeNone = 0;
  MTLCullModeFront = 1;
  MTLCullModeBack = 2;
  MTLWindingClockwise = 0;
  MTLWindingCounterClockwise = 1;
  MTLDepthClipModeClip = 0;
  MTLDepthClipModeClamp = 1;
  MTLTriangleFillModeFill = 0;
  MTLTriangleFillModeLines = 1;
  MTLRenderStageVertex = (1 shl 0);
  MTLRenderStageFragment = (1 shl 1);
  MTLRenderStageTile = (1 shl 2);
  MTLRenderStageObject = (1 shl 3);
  MTLRenderStageMesh = (1 shl 4);
  MTLBlendFactorZero = 0;
  MTLBlendFactorOne = 1;
  MTLBlendFactorSourceColor = 2;
  MTLBlendFactorOneMinusSourceColor = 3;
  MTLBlendFactorSourceAlpha = 4;
  MTLBlendFactorOneMinusSourceAlpha = 5;
  MTLBlendFactorDestinationColor = 6;
  MTLBlendFactorOneMinusDestinationColor = 7;
  MTLBlendFactorDestinationAlpha = 8;
  MTLBlendFactorOneMinusDestinationAlpha = 9;
  MTLBlendFactorSourceAlphaSaturated = 10;
  MTLBlendFactorBlendColor = 11;
  MTLBlendFactorOneMinusBlendColor = 12;
  MTLBlendFactorBlendAlpha = 13;
  MTLBlendFactorOneMinusBlendAlpha = 14;
  MTLBlendFactorSource1Color = 15;
  MTLBlendFactorOneMinusSource1Color = 16;
  MTLBlendFactorSource1Alpha = 17;
  MTLBlendFactorOneMinusSource1Alpha = 18;
  MTLBlendOperationAdd = 0;
  MTLBlendOperationSubtract = 1;
  MTLBlendOperationReverseSubtract = 2;
  MTLBlendOperationMin = 3;
  MTLBlendOperationMax = 4;
  MTLColorWriteMaskNone = 0;
  MTLColorWriteMaskRed = 1 shl 3;
  MTLColorWriteMaskGreen = 1 shl 2;
  MTLColorWriteMaskBlue = 1 shl 1;
  MTLColorWriteMaskAlpha = 1 shl 0;
  MTLColorWriteMaskAll = 15;
  MTLPrimitiveTopologyClassUnspecified = 0;
  MTLPrimitiveTopologyClassPoint = 1;
  MTLPrimitiveTopologyClassLine = 2;
  MTLPrimitiveTopologyClassTriangle = 3;
  MTLTessellationPartitionModePow2 = 0;
  MTLTessellationPartitionModeInteger = 1;
  MTLTessellationPartitionModeFractionalOdd = 2;
  MTLTessellationPartitionModeFractionalEven = 3;
  MTLTessellationFactorStepFunctionConstant = 0;
  MTLTessellationFactorStepFunctionPerPatch = 1;
  MTLTessellationFactorStepFunctionPerInstance = 2;
  MTLTessellationFactorStepFunctionPerPatchAndPerInstance = 3;
  MTLTessellationFactorFormatHalf = 0;
  MTLTessellationControlPointIndexTypeNone = 0;
  MTLTessellationControlPointIndexTypeUInt16 = 1;
  MTLTessellationControlPointIndexTypeUInt32 = 2;
  MTLVertexFormatInvalid = 0;
  MTLVertexFormatUChar2 = 1;
  MTLVertexFormatUChar3 = 2;
  MTLVertexFormatUChar4 = 3;
  MTLVertexFormatChar2 = 4;
  MTLVertexFormatChar3 = 5;
  MTLVertexFormatChar4 = 6;
  MTLVertexFormatUChar2Normalized = 7;
  MTLVertexFormatUChar3Normalized = 8;
  MTLVertexFormatUChar4Normalized = 9;
  MTLVertexFormatChar2Normalized = 10;
  MTLVertexFormatChar3Normalized = 11;
  MTLVertexFormatChar4Normalized = 12;
  MTLVertexFormatUShort2 = 13;
  MTLVertexFormatUShort3 = 14;
  MTLVertexFormatUShort4 = 15;
  MTLVertexFormatShort2 = 16;
  MTLVertexFormatShort3 = 17;
  MTLVertexFormatShort4 = 18;
  MTLVertexFormatUShort2Normalized = 19;
  MTLVertexFormatUShort3Normalized = 20;
  MTLVertexFormatUShort4Normalized = 21;
  MTLVertexFormatShort2Normalized = 22;
  MTLVertexFormatShort3Normalized = 23;
  MTLVertexFormatShort4Normalized = 24;
  MTLVertexFormatHalf2 = 25;
  MTLVertexFormatHalf3 = 26;
  MTLVertexFormatHalf4 = 27;
  MTLVertexFormatFloat = 28;
  MTLVertexFormatFloat2 = 29;
  MTLVertexFormatFloat3 = 30;
  MTLVertexFormatFloat4 = 31;
  MTLVertexFormatInt = 32;
  MTLVertexFormatInt2 = 33;
  MTLVertexFormatInt3 = 34;
  MTLVertexFormatInt4 = 35;
  MTLVertexFormatUInt = 36;
  MTLVertexFormatUInt2 = 37;
  MTLVertexFormatUInt3 = 38;
  MTLVertexFormatUInt4 = 39;
  MTLVertexFormatInt1010102Normalized = 40;
  MTLVertexFormatUInt1010102Normalized = 41;
  MTLVertexFormatUChar4Normalized_BGRA = 42;
  MTLVertexFormatUChar = 45;
  MTLVertexFormatChar = 46;
  MTLVertexFormatUCharNormalized = 47;
  MTLVertexFormatCharNormalized = 48;
  MTLVertexFormatUShort = 49;
  MTLVertexFormatShort = 50;
  MTLVertexFormatUShortNormalized = 51;
  MTLVertexFormatShortNormalized = 52;
  MTLVertexFormatHalf = 53;
  MTLVertexStepFunctionConstant = 0;
  MTLVertexStepFunctionPerVertex = 1;
  MTLVertexStepFunctionPerInstance = 2;
  MTLVertexStepFunctionPerPatch = 3;
  MTLVertexStepFunctionPerPatchControlPoint = 4;
  MTLSamplerMinMagFilterNearest = 0;
  MTLSamplerMinMagFilterLinear = 1;
  MTLSamplerMipFilterNotMipmapped = 0;
  MTLSamplerMipFilterNearest = 1;
  MTLSamplerMipFilterLinear = 2;
  MTLSamplerAddressModeClampToEdge = 0;
  MTLSamplerAddressModeMirrorClampToEdge = 1;
  MTLSamplerAddressModeRepeat = 2;
  MTLSamplerAddressModeMirrorRepeat = 3;
  MTLSamplerAddressModeClampToZero = 4;
  MTLSamplerAddressModeClampToBorderColor = 5;
  MTLSamplerBorderColorTransparentBlack = 0;
  MTLSamplerBorderColorOpaqueBlack = 1;
  MTLSamplerBorderColorOpaqueWhite = 2;
  MTLAccelerationStructureUsageNone = 0;
  MTLAccelerationStructureUsageRefit = (1 shl 0);
  MTLAccelerationStructureUsagePreferFastBuild = (1 shl 1);
  MTLAccelerationStructureUsageExtendedLimits = (1 shl 2);
  MTLAccelerationStructureInstanceOptionNone = 0;
  MTLAccelerationStructureInstanceOptionDisableTriangleCulling = (1 shl 0);
  MTLAccelerationStructureInstanceOptionTriangleFrontFacingWindingCounterClockwise =
    (1 shl 1);
  MTLAccelerationStructureInstanceOptionOpaque = (1 shl 2);
  MTLAccelerationStructureInstanceOptionNonOpaque = (1 shl 3);
  MTLMotionBorderModeClamp = 0;
  MTLMotionBorderModeVanish = 1;
  MTLAccelerationStructureInstanceDescriptorTypeDefault = 0;
  MTLAccelerationStructureInstanceDescriptorTypeUserID = 1;
  MTLAccelerationStructureInstanceDescriptorTypeMotion = 2;
  MTLHeapTypeAutomatic = 0;
  MTLHeapTypePlacement = 1;
  MTLHeapTypeSparse = 2;
  MTLCaptureErrorNotSupported = 1;
  MTLCaptureErrorAlreadyCapturing = 2;
  MTLCaptureErrorInvalidDescriptor = 3;
  MTLCaptureDestinationDeveloperTools = 1;
  MTLCaptureDestinationGPUTraceDocument = 2;
  MTLIndirectCommandTypeDraw = (1 shl 0);
  MTLIndirectCommandTypeDrawIndexed = (1 shl 1);
  MTLIndirectCommandTypeDrawPatches = (1 shl 2);
  MTLIndirectCommandTypeDrawIndexedPatches = (1 shl 3);
  MTLIndirectCommandTypeConcurrentDispatch = (1 shl 5);
  MTLIndirectCommandTypeConcurrentDispatchThreads = (1 shl 6);
  MTLFunctionLogTypeValidation = 0;
  MTLAccelerationStructureRefitOptionVertexData = (1 shl 0);
  MTLAccelerationStructureRefitOptionPerPrimitiveData = (1 shl 1);
  MTLDynamicLibraryErrorNone = 0;
  MTLDynamicLibraryErrorInvalidFile = 1;
  MTLDynamicLibraryErrorCompilationFailure = 2;
  MTLDynamicLibraryErrorUnresolvedInstallName = 3;
  MTLDynamicLibraryErrorDependencyLoadFailure = 4;
  MTLDynamicLibraryErrorUnsupported = 5;
  MTLBinaryArchiveErrorNone = 0;
  MTLBinaryArchiveErrorInvalidFile = 1;
  MTLBinaryArchiveErrorUnexpectedElement = 2;
  MTLBinaryArchiveErrorCompilationFailure = 3;
  MTLBinaryArchiveErrorInternalError = 4;
  MTLIntersectionFunctionSignatureNone = 0;
  MTLIntersectionFunctionSignatureInstancing = (1 shl 0);
  MTLIntersectionFunctionSignatureTriangleData = (1 shl 1);
  MTLIntersectionFunctionSignatureWorldSpaceData = (1 shl 2);
  MTLIntersectionFunctionSignatureInstanceMotion = (1 shl 3);
  MTLIntersectionFunctionSignaturePrimitiveMotion = (1 shl 4);
  MTLIntersectionFunctionSignatureExtendedLimits = (1 shl 5);
  MTLIOPriorityHigh = 0;
  MTLIOPriorityNormal = 1;
  MTLIOPriorityLow = 2;
  MTLIOCommandQueueTypeConcurrent = 0;
  MTLIOCommandQueueTypeSerial = 1;
  MTLIOErrorURLInvalid = 1;
  MTLIOErrorInternal = 2;
  MTLIOStatusPending = 0;
  MTLIOStatusCancelled = 1;
  MTLIOStatusError = 2;
  MTLIOStatusComplete = 3;
  MTLIOCompressionStatusComplete = 0;
  MTLIOCompressionStatusError = 1;

type

  // ===== Forward declarations =====
{$M+}
  MTLDevice = interface;
  MTLCommandEncoder = interface;
  MTLHeap = interface;
  MTLResource = interface;
  MTLTextureDescriptor = interface;
  MTLTexture = interface;
  MTLBuffer = interface;
  MTLSharedTextureHandle = interface;
  MTLArgument = interface;
  MTLStructType = interface;
  MTLArrayType = interface;
  MTLTextureReferenceType = interface;
  MTLPointerType = interface;
  MTLType = interface;
  MTLStructMember = interface;
  MTLBinding = interface;
  MTLBufferBinding = interface;
  MTLThreadgroupBinding = interface;
  MTLTextureBinding = interface;
  MTLObjectPayloadBinding = interface;
  MTLFunctionConstantValues = interface;
  MTLBinaryArchive = interface;
  MTLFunctionDescriptor = interface;
  MTLIntersectionFunctionDescriptor = interface;
  MTLFunction = interface;
  MTLLibrary = interface;
  MTLCompileOptions = interface;
  MTLDynamicLibrary = interface;
  MTLArgumentEncoder = interface;
  MTLVertexAttribute = interface;
  MTLAttribute = interface;
  MTLFunctionConstant = interface;
  MTLCounter = interface;
  MTLCounterSet = interface;
  MTLCounterSampleBufferDescriptor = interface;
  MTLCounterSampleBuffer = interface;
  MTLCommandQueue = interface;
  MTLDepthStencilState = interface;
  MTLSamplerState = interface;
  MTLRenderPipelineState = interface;
  MTLComputePipelineState = interface;
  MTLFence = interface;
  MTLRasterizationRateMap = interface;
  MTLRasterizationRateLayerDescriptor = interface;
  MTLRasterizationRateMapDescriptor = interface;
  MTLTileRenderPipelineDescriptor = interface;
  MTLMeshRenderPipelineDescriptor = interface;
  MTLSamplerDescriptor = interface;
  MTLRenderPipelineColorAttachmentDescriptor = interface;
  MTLDepthStencilDescriptor = interface;
  MTLRenderPipelineDescriptor = interface;
  MTLRenderPassDescriptor = interface;
  MTLComputePassDescriptor = interface;
  MTLBlitPassDescriptor = interface;
  MTLRenderPipelineReflection = interface;
  MTLComputePipelineDescriptor = interface;
  MTLComputePipelineReflection = interface;
  MTLHeapDescriptor = interface;
  MTLIndirectCommandBufferDescriptor = interface;
  MTLIndirectRenderCommandEncoder = interface;
  MTLIndirectComputeCommandEncoder = interface;
  MTLIndirectCommandBuffer = interface;
  MTLEvent = interface;
  MTLSharedEvent = interface;
  MTLSharedEventHandle = interface;
  MTLBinaryArchiveDescriptor = interface;
  MTLAccelerationStructureDescriptor = interface;
  MTLAccelerationStructure = interface;
  MTLFunctionHandle = interface;
  MTLVisibleFunctionTable = interface;
  MTLVisibleFunctionTableDescriptor = interface;
  MTLIntersectionFunctionTable = interface;
  MTLIntersectionFunctionTableDescriptor = interface;
  MTLStitchedLibraryDescriptor = interface;
  MTLIOFileHandle = interface;
  MTLIOCommandQueue = interface;
  MTLIOCommandQueueDescriptor = interface;
  MTLArgumentDescriptor = interface;
  MTLResourceStatePassSampleBufferAttachmentDescriptor = interface;
  MTLResourceStatePassSampleBufferAttachmentDescriptorArray = interface;
  MTLResourceStatePassDescriptor = interface;
  MTLResourceStateCommandEncoder = interface;
  MTLRenderPassAttachmentDescriptor = interface;
  MTLRenderPassColorAttachmentDescriptor = interface;
  MTLRenderPassDepthAttachmentDescriptor = interface;
  MTLRenderPassStencilAttachmentDescriptor = interface;
  MTLRenderPassColorAttachmentDescriptorArray = interface;
  MTLRenderPassSampleBufferAttachmentDescriptor = interface;
  MTLRenderPassSampleBufferAttachmentDescriptorArray = interface;
  MTLBlitPassSampleBufferAttachmentDescriptor = interface;
  MTLBlitPassSampleBufferAttachmentDescriptorArray = interface;
  MTLBlitCommandEncoder = interface;
  MTLRenderCommandEncoder = interface;
  MTLParallelRenderCommandEncoder = interface;
  MTLComputeCommandEncoder = interface;
  MTLDrawable = interface;
  MTLCommandBuffer = interface;
  MTLLogContainer = interface;
  MTLAccelerationStructureCommandEncoder = interface;
  MTLAccelerationStructurePassDescriptor = interface;
  MTLCommandBufferDescriptor = interface;
  MTLCommandBufferEncoderInfo = interface;
  MTLComputePassSampleBufferAttachmentDescriptor = interface;
  MTLComputePassSampleBufferAttachmentDescriptorArray = interface;
  MTLStencilDescriptor = interface;
  MTLBufferLayoutDescriptor = interface;
  MTLBufferLayoutDescriptorArray = interface;
  MTLAttributeDescriptor = interface;
  MTLAttributeDescriptorArray = interface;
  MTLStageInputOutputDescriptor = interface;
  MTLPipelineBufferDescriptor = interface;
  MTLPipelineBufferDescriptorArray = interface;
  MTLLinkedFunctions = interface;
  MTLVertexDescriptor = interface;
  MTLRenderPipelineColorAttachmentDescriptorArray = interface;
  MTLRenderPipelineFunctionsDescriptor = interface;
  MTLTileRenderPipelineColorAttachmentDescriptor = interface;
  MTLTileRenderPipelineColorAttachmentDescriptorArray = interface;
  MTLVertexBufferLayoutDescriptor = interface;
  MTLVertexBufferLayoutDescriptorArray = interface;
  MTLVertexAttributeDescriptor = interface;
  MTLVertexAttributeDescriptorArray = interface;
  MTLAccelerationStructureGeometryDescriptor = interface;
  MTLPrimitiveAccelerationStructureDescriptor = interface;
  MTLAccelerationStructureTriangleGeometryDescriptor = interface;
  MTLAccelerationStructureBoundingBoxGeometryDescriptor = interface;
  MTLMotionKeyframeData = interface;
  MTLAccelerationStructureMotionTriangleGeometryDescriptor = interface;
  MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor = interface;
  MTLInstanceAccelerationStructureDescriptor = interface;
  MTLCaptureScope = interface;
  MTLCaptureDescriptor = interface;
  MTLCaptureManager = interface;
  MTLIndirectRenderCommand = interface;
  MTLIndirectComputeCommand = interface;
  MTLSharedEventListener = interface;
  MTLFunctionLogDebugLocation = interface;
  MTLFunctionLog = interface;
  MTLAccelerationStructurePassSampleBufferAttachmentDescriptor = interface;
  MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray = interface;
  MTLRasterizationRateSampleArray = interface;
  MTLRasterizationRateLayerArray = interface;
  MTLFunctionStitchingAttribute = interface;
  MTLFunctionStitchingAttributeAlwaysInline = interface;
  MTLFunctionStitchingNode = interface;
  MTLFunctionStitchingInputNode = interface;
  MTLFunctionStitchingFunctionNode = interface;
  MTLFunctionStitchingGraph = interface;
  MTLIOCommandBuffer = interface;
  MTLIOScratchBuffer = interface;
  MTLIOScratchBufferAllocator = interface;

  // ===== Framework typedefs =====
{$M+}
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  MTLOrigin = record
    x: NSUInteger;
    y: NSUInteger;
    z: NSUInteger;
  end;

  PMTLOrigin = ^MTLOrigin;

  MTLSize = record
    width: NSUInteger;
    height: NSUInteger;
    depth: NSUInteger;
  end;

  PMTLSize = ^MTLSize;

  MTLRegion = record
    origin: MTLOrigin;
    size: MTLSize;
  end;

  PMTLRegion = ^MTLRegion;

  MTLSamplePosition = record
    x: Single;
    y: Single;
  end;

  PMTLSamplePosition = ^MTLSamplePosition;

  MTLCoordinate2D = MTLSamplePosition;

  MTLResourceID = record
    _impl: UInt64;
  end;

  PMTLResourceID = ^MTLResourceID;

  MTLResourceUsage = NSUInteger;
  MTLBarrierScope = NSUInteger;
  MTLPurgeableState = NSUInteger;
  MTLCPUCacheMode = NSUInteger;
  MTLStorageMode = NSUInteger;
  MTLHazardTrackingMode = NSUInteger;
  MTLResourceOptions = NSUInteger;
  MTLPixelFormat = NSUInteger;

  _NSRange = record
    location: NSUInteger;
    length: NSUInteger;
  end;

  P_NSRange = ^_NSRange;
  NSRange = _NSRange;
  PNSRange = ^NSRange;

  MTLTextureType = NSUInteger;
  MTLTextureSwizzle = Byte;

  MTLTextureSwizzleChannels = record
    red: MTLTextureSwizzle;
    green: MTLTextureSwizzle;
    blue: MTLTextureSwizzle;
    alpha: MTLTextureSwizzle;
  end;

  PMTLTextureSwizzleChannels = ^MTLTextureSwizzleChannels;

  MTLTextureUsage = NSUInteger;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  MTLTextureCompressionType = NSInteger;
  IOSurfaceRef = Pointer;
  PIOSurfaceRef = ^IOSurfaceRef;
  MTLDataType = NSUInteger;
  MTLBindingType = NSInteger;
  MTLArgumentType = NSUInteger;
  MTLArgumentAccess = NSUInteger;
  MTLFunctionOptions = NSUInteger;
  MTLAutoreleasedArgument = MTLArgument;
  PMTLAutoreleasedArgument = ^MTLAutoreleasedArgument;
  MTLPatchType = NSUInteger;
  MTLFunctionType = NSUInteger;
  MTLLanguageVersion = NSUInteger;
  MTLLibraryType = NSInteger;
  MTLLibraryOptimizationLevel = NSInteger;
  MTLCompileSymbolVisibility = NSInteger;
  NSErrorDomain = NSString;
  PNSErrorDomain = ^NSErrorDomain;
  MTLLibraryError = NSUInteger;
  TMetalCompletionHandler = procedure(param1: Pointer; param2: NSError)
    of object;
  MTLCommonCounter = NSString;
  PMTLCommonCounter = ^MTLCommonCounter;
  MTLCommonCounterSet = NSString;
  PMTLCommonCounterSet = ^MTLCommonCounterSet;

  MTLCounterResultTimestamp = record
    timestamp: UInt64;
  end;

  PMTLCounterResultTimestamp = ^MTLCounterResultTimestamp;

  MTLCounterResultStageUtilization = record
    totalCycles: UInt64;
    vertexCycles: UInt64;
    tessellationCycles: UInt64;
    postTessellationVertexCycles: UInt64;
    fragmentCycles: UInt64;
    renderTargetCycles: UInt64;
  end;

  PMTLCounterResultStageUtilization = ^MTLCounterResultStageUtilization;

  MTLCounterResultStatistic = record
    tessellationInputPatches: UInt64;
    vertexInvocations: UInt64;
    postTessellationVertexInvocations: UInt64;
    clipperInvocations: UInt64;
    clipperPrimitivesOut: UInt64;
    fragmentInvocations: UInt64;
    fragmentsPassed: UInt64;
    computeKernelInvocations: UInt64;
  end;

  PMTLCounterResultStatistic = ^MTLCounterResultStatistic;

  MTLCounterSampleBufferError = NSInteger;
  MTLIOCompressionMethod = NSInteger;
  MTLFeatureSet = NSUInteger;
  MTLGPUFamily = NSInteger;
  MTLPipelineOption = NSUInteger;
  MTLReadWriteTextureTier = NSUInteger;
  MTLArgumentBuffersTier = NSUInteger;
  MTLSparseTextureRegionAlignmentMode = NSUInteger;
  MTLSparsePageSize = NSInteger;

  MTLAccelerationStructureSizes = record
    accelerationStructureSize: NSUInteger;
    buildScratchBufferSize: NSUInteger;
    refitScratchBufferSize: NSUInteger;
  end;

  PMTLAccelerationStructureSizes = ^MTLAccelerationStructureSizes;

  MTLCounterSamplingPoint = NSUInteger;

  MTLSizeAndAlign = record
    size: NSUInteger;
    align: NSUInteger;
  end;

  PMTLSizeAndAlign = ^MTLSizeAndAlign;

  MTLAutoreleasedRenderPipelineReflection = MTLRenderPipelineReflection;
  PMTLAutoreleasedRenderPipelineReflection = ^
    MTLAutoreleasedRenderPipelineReflection;
  MTLAutoreleasedComputePipelineReflection = MTLComputePipelineReflection;
  PMTLAutoreleasedComputePipelineReflection = ^
    MTLAutoreleasedComputePipelineReflection;
  MTLNewLibraryCompletionHandler = procedure(param1: Pointer; param2: NSError)
    of object;
  MTLNewRenderPipelineStateCompletionHandler = procedure(param1: Pointer;
    param2: NSError) of object;
  MTLNewRenderPipelineStateWithReflectionCompletionHandler = procedure
    (param1: Pointer; param2: MTLRenderPipelineReflection) of object;
  MTLNewComputePipelineStateCompletionHandler = procedure(param1: Pointer;
    param2: NSError) of object;
  MTLNewComputePipelineStateWithReflectionCompletionHandler = procedure
    (param1: Pointer; param2: MTLComputePipelineReflection) of object;
  TMetalDeallocator = procedure(param1: Pointer; param2: NSUInteger) of object;
  dispatch_data_t = Pointer;
  Pdispatch_data_t = ^dispatch_data_t;
  MTLTimestamp = UInt64;
  PMTLTimestamp = ^MTLTimestamp;
  MTLSparseTextureMappingMode = NSUInteger;

  MTLMapIndirectArguments = record
    regionOriginX: LongWord;
    regionOriginY: LongWord;
    regionOriginZ: LongWord;
    regionSizeWidth: LongWord;
    regionSizeHeight: LongWord;
    regionSizeDepth: LongWord;
    mipMapLevel: LongWord;
    sliceId: LongWord;
  end;

  PMTLMapIndirectArguments = ^MTLMapIndirectArguments;

  MTLClearColor = record
    red: Double;
    green: Double;
    blue: Double;
    alpha: Double;
  end;

  PMTLClearColor = ^MTLClearColor;

  MTLLoadAction = NSUInteger;
  MTLStoreAction = NSUInteger;
  MTLStoreActionOptions = NSUInteger;
  MTLMultisampleDepthResolveFilter = NSUInteger;
  MTLMultisampleStencilResolveFilter = NSUInteger;
  MTLBlitOption = NSUInteger;
  MTLCommandBufferStatus = NSUInteger;
  MTLCommandBufferError = NSUInteger;
  NSErrorUserInfoKey = NSString;
  PNSErrorUserInfoKey = ^NSErrorUserInfoKey;
  MTLCommandBufferErrorOption = NSUInteger;
  MTLCommandEncoderErrorState = NSInteger;
  MTLCommandBufferHandler = procedure(param1: Pointer) of object;
  MTLDispatchType = NSUInteger;
  CFTimeInterval = Double;
  PCFTimeInterval = ^CFTimeInterval;

  MTLDispatchThreadgroupsIndirectArguments = record
    threadgroupsPerGrid: array [0 .. 2] of LongWord;
  end;

  PMTLDispatchThreadgroupsIndirectArguments = ^
    MTLDispatchThreadgroupsIndirectArguments;

  MTLStageInRegionIndirectArguments = record
    stageInOrigin: array [0 .. 2] of LongWord;
    stageInSize: array [0 .. 2] of LongWord;
  end;

  PMTLStageInRegionIndirectArguments = ^MTLStageInRegionIndirectArguments;

  MTLCompareFunction = NSUInteger;
  MTLStencilOperation = NSUInteger;
  MTLDrawablePresentedHandler = procedure(param1: Pointer) of object;
  MTLAttributeFormat = NSUInteger;
  MTLIndexType = NSUInteger;
  MTLStepFunction = NSUInteger;
  MTLMutability = NSUInteger;
  MTLPrimitiveType = NSUInteger;
  MTLVisibilityResultMode = NSUInteger;

  MTLScissorRect = record
    x: NSUInteger;
    y: NSUInteger;
    width: NSUInteger;
    height: NSUInteger;
  end;

  PMTLScissorRect = ^MTLScissorRect;

  MTLViewport = record
    originX: Double;
    originY: Double;
    width: Double;
    height: Double;
    znear: Double;
    zfar: Double;
  end;

  PMTLViewport = ^MTLViewport;

  MTLCullMode = NSUInteger;
  MTLWinding = NSUInteger;
  MTLDepthClipMode = NSUInteger;
  MTLTriangleFillMode = NSUInteger;

  MTLDrawPrimitivesIndirectArguments = record
    vertexCount: LongWord;
    instanceCount: LongWord;
    vertexStart: LongWord;
    baseInstance: LongWord;
  end;

  PMTLDrawPrimitivesIndirectArguments = ^MTLDrawPrimitivesIndirectArguments;

  MTLDrawIndexedPrimitivesIndirectArguments = record
    indexCount: LongWord;
    instanceCount: LongWord;
    indexStart: LongWord;
    baseVertex: Int32;
    baseInstance: LongWord;
  end;

  PMTLDrawIndexedPrimitivesIndirectArguments = ^
    MTLDrawIndexedPrimitivesIndirectArguments;

  MTLVertexAmplificationViewMapping = record
    viewportArrayIndexOffset: LongWord;
    renderTargetArrayIndexOffset: LongWord;
  end;

  PMTLVertexAmplificationViewMapping = ^MTLVertexAmplificationViewMapping;

  MTLDrawPatchIndirectArguments = record
    patchCount: LongWord;
    instanceCount: LongWord;
    patchStart: LongWord;
    baseInstance: LongWord;
  end;

  PMTLDrawPatchIndirectArguments = ^MTLDrawPatchIndirectArguments;

  MTLQuadTessellationFactorsHalf = record
    edgeTessellationFactor: array [0 .. 3] of Word;
    insideTessellationFactor: array [0 .. 1] of Word;
  end;

  PMTLQuadTessellationFactorsHalf = ^MTLQuadTessellationFactorsHalf;

  MTLTriangleTessellationFactorsHalf = record
    edgeTessellationFactor: array [0 .. 2] of Word;
    insideTessellationFactor: Word;
  end;

  PMTLTriangleTessellationFactorsHalf = ^MTLTriangleTessellationFactorsHalf;

  MTLRenderStages = NSUInteger;
  MTLBlendFactor = NSUInteger;
  MTLBlendOperation = NSUInteger;
  MTLColorWriteMask = NSUInteger;
  MTLPrimitiveTopologyClass = NSUInteger;
  MTLTessellationPartitionMode = NSUInteger;
  MTLTessellationFactorStepFunction = NSUInteger;
  MTLTessellationFactorFormat = NSUInteger;
  MTLTessellationControlPointIndexType = NSUInteger;
  MTLVertexFormat = NSUInteger;
  MTLVertexStepFunction = NSUInteger;
  MTLSamplerMinMagFilter = NSUInteger;
  MTLSamplerMipFilter = NSUInteger;
  MTLSamplerAddressMode = NSUInteger;
  MTLSamplerBorderColor = NSUInteger;

  _MTLPackedFloat3 = record
    case Integer of
      0:
        (x: Single;
          y: Single;
          z: Single;
        );
      1:
        (elements: array [0 .. 2] of Single);

  end;

  P_MTLPackedFloat3 = ^_MTLPackedFloat3;
  MTLPackedFloat3 = _MTLPackedFloat3;
  PMTLPackedFloat3 = ^MTLPackedFloat3;

  _MTLPackedFloat4x3 = record
    columns: array [0 .. 3] of MTLPackedFloat3;
  end;

  P_MTLPackedFloat4x3 = ^_MTLPackedFloat4x3;
  MTLPackedFloat4x3 = _MTLPackedFloat4x3;
  PMTLPackedFloat4x3 = ^MTLPackedFloat4x3;

  _MTLAxisAlignedBoundingBox = record
    min: MTLPackedFloat3;
    max: MTLPackedFloat3;
  end;

  P_MTLAxisAlignedBoundingBox = ^_MTLAxisAlignedBoundingBox;
  MTLAxisAlignedBoundingBox = _MTLAxisAlignedBoundingBox;
  PMTLAxisAlignedBoundingBox = ^MTLAxisAlignedBoundingBox;

  MTLAccelerationStructureUsage = NSUInteger;
  MTLAccelerationStructureInstanceOptions = LongWord;
  MTLMotionBorderMode = LongWord;

  MTLAccelerationStructureInstanceDescriptor = record
    transformationMatrix: MTLPackedFloat4x3;
    options: MTLAccelerationStructureInstanceOptions;
    mask: LongWord;
    intersectionFunctionTableOffset: LongWord;
    accelerationStructureIndex: LongWord;
  end;

  PMTLAccelerationStructureInstanceDescriptor = ^
    MTLAccelerationStructureInstanceDescriptor;

  MTLAccelerationStructureUserIDInstanceDescriptor = record
    transformationMatrix: MTLPackedFloat4x3;
    options: MTLAccelerationStructureInstanceOptions;
    mask: LongWord;
    intersectionFunctionTableOffset: LongWord;
    accelerationStructureIndex: LongWord;
    userID: LongWord;
  end;

  PMTLAccelerationStructureUserIDInstanceDescriptor = ^
    MTLAccelerationStructureUserIDInstanceDescriptor;

  MTLAccelerationStructureInstanceDescriptorType = NSUInteger;

  MTLAccelerationStructureMotionInstanceDescriptor = record
    options: MTLAccelerationStructureInstanceOptions;
    mask: LongWord;
    intersectionFunctionTableOffset: LongWord;
    accelerationStructureIndex: LongWord;
    userID: LongWord;
    motionTransformsStartIndex: LongWord;
    motionTransformsCount: LongWord;
    motionStartBorderMode: MTLMotionBorderMode;
    motionEndBorderMode: MTLMotionBorderMode;
    motionStartTime: Single;
    motionEndTime: Single;
  end;

  PMTLAccelerationStructureMotionInstanceDescriptor = ^
    MTLAccelerationStructureMotionInstanceDescriptor;

  MTLHeapType = NSInteger;
  MTLCaptureError = NSInteger;
  MTLCaptureDestination = NSInteger;
  MTLIndirectCommandType = NSUInteger;

  MTLIndirectCommandBufferExecutionRange = record
    location: LongWord;
    length: LongWord;
  end;

  PMTLIndirectCommandBufferExecutionRange = ^
    MTLIndirectCommandBufferExecutionRange;

  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;
  MTLSharedEventNotificationBlock = procedure(param1: Pointer; param2: UInt64)
    of object;
  MTLFunctionLogType = NSUInteger;
  MTLAccelerationStructureRefitOptions = NSUInteger;
  MTLDynamicLibraryError = NSUInteger;
  MTLBinaryArchiveError = NSUInteger;
  MTLIntersectionFunctionSignature = NSUInteger;
  MTLIOPriority = NSInteger;
  MTLIOCommandQueueType = NSInteger;
  MTLIOError = NSInteger;
  MTLIOStatus = NSInteger;
  MTLIOCommandBufferHandler = procedure(param1: Pointer) of object;
  MTLIOCompressionStatus = NSInteger;
  MTLIOCompressionContext = Pointer;
  PMTLIOCompressionContext = ^MTLIOCompressionContext;
  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  // ===== Interface declarations =====

  MTLTextureDescriptorClass = interface(NSObjectClass)
    ['{59813954-8D32-4E17-A878-76DC59FA3AC2}']
    { class } function texture2DDescriptorWithPixelFormat
      (pixelFormat: MTLPixelFormat; width: NSUInteger; height: NSUInteger;
      mipmapped: Boolean): MTLTextureDescriptor; cdecl;
    { class } function textureCubeDescriptorWithPixelFormat
      (pixelFormat: MTLPixelFormat; size: NSUInteger; mipmapped: Boolean)
      : MTLTextureDescriptor; cdecl;
    { class } function textureBufferDescriptorWithPixelFormat
      (pixelFormat: MTLPixelFormat; width: NSUInteger;
      resourceOptions: MTLResourceOptions; usage: MTLTextureUsage)
      : MTLTextureDescriptor; cdecl;
  end;

  MTLTextureDescriptor = interface(NSObject)
    ['{9E40383E-D92F-4674-840E-E0A242B11839}']
    procedure setTextureType(textureType: MTLTextureType); cdecl;
    function textureType: MTLTextureType; cdecl;
    procedure setPixelFormat(pixelFormat: MTLPixelFormat); cdecl;
    function pixelFormat: MTLPixelFormat; cdecl;
    procedure setWidth(width: NSUInteger); cdecl;
    function width: NSUInteger; cdecl;
    procedure setHeight(height: NSUInteger); cdecl;
    function height: NSUInteger; cdecl;
    procedure setDepth(depth: NSUInteger); cdecl;
    function depth: NSUInteger; cdecl;
    procedure setMipmapLevelCount(mipmapLevelCount: NSUInteger); cdecl;
    function mipmapLevelCount: NSUInteger; cdecl;
    procedure setSampleCount(sampleCount: NSUInteger); cdecl;
    function sampleCount: NSUInteger; cdecl;
    procedure setArrayLength(arrayLength: NSUInteger); cdecl;
    function arrayLength: NSUInteger; cdecl;
    procedure setResourceOptions(resourceOptions: MTLResourceOptions); cdecl;
    function resourceOptions: MTLResourceOptions; cdecl;
    procedure setCpuCacheMode(cpuCacheMode: MTLCPUCacheMode); cdecl;
    function cpuCacheMode: MTLCPUCacheMode; cdecl;
    procedure setStorageMode(storageMode: MTLStorageMode); cdecl;
    function storageMode: MTLStorageMode; cdecl;
    procedure setHazardTrackingMode(hazardTrackingMode
      : MTLHazardTrackingMode); cdecl;
    function hazardTrackingMode: MTLHazardTrackingMode; cdecl;
    procedure setUsage(usage: MTLTextureUsage); cdecl;
    function usage: MTLTextureUsage; cdecl;
    procedure setAllowGPUOptimizedContents(allowGPUOptimizedContents
      : Boolean); cdecl;
    function allowGPUOptimizedContents: Boolean; cdecl;
    procedure setCompressionType(compressionType
      : MTLTextureCompressionType); cdecl;
    function compressionType: MTLTextureCompressionType; cdecl;
    procedure setSwizzle(swizzle: MTLTextureSwizzleChannels); cdecl;
    function swizzle: MTLTextureSwizzleChannels; cdecl;
  end;

  TMTLTextureDescriptor = class(TOCGenericImport<MTLTextureDescriptorClass,
    MTLTextureDescriptor>)
  end;

  PMTLTextureDescriptor = Pointer;

  MTLSharedTextureHandleClass = interface(NSObjectClass)
    ['{A06CE35C-63D6-43A9-9B65-F5E326137046}']
  end;

  MTLSharedTextureHandle = interface(NSObject)
    ['{E1BBECBB-C093-4798-BA25-9B310FC391C9}']
    function device: Pointer; cdecl;
    function &label: NSString; cdecl;
  end;

  TMTLSharedTextureHandle = class(TOCGenericImport<MTLSharedTextureHandleClass,
    MTLSharedTextureHandle>)
  end;

  PMTLSharedTextureHandle = Pointer;

  MTLArgumentClass = interface(NSObjectClass)
    ['{0A5AE4B6-CF1B-4F9B-88DF-3B27DD8A9302}']
  end;

  MTLArgument = interface(NSObject)
    ['{3794FC4F-653B-4665-B7E8-D446FF5FE7FE}']
    function name: NSString; cdecl;
    function &type: MTLArgumentType; cdecl;
    function access: MTLArgumentAccess; cdecl;
    function index: NSUInteger; cdecl;
    function isActive: Boolean; cdecl;
    function bufferAlignment: NSUInteger; cdecl;
    function bufferDataSize: NSUInteger; cdecl;
    function bufferDataType: MTLDataType; cdecl;
    function bufferStructType: MTLStructType; cdecl;
    function bufferPointerType: MTLPointerType; cdecl;
    function threadgroupMemoryAlignment: NSUInteger; cdecl;
    function threadgroupMemoryDataSize: NSUInteger; cdecl;
    function textureType: MTLTextureType; cdecl;
    function textureDataType: MTLDataType; cdecl;
    function isDepthTexture: Boolean; cdecl;
    function arrayLength: NSUInteger; cdecl;
  end;

  TMTLArgument = class(TOCGenericImport<MTLArgumentClass, MTLArgument>)
  end;

  PMTLArgument = Pointer;

  MTLTypeClass = interface(NSObjectClass)
    ['{8AC41B89-E666-4043-94ED-F38E750726A5}']
  end;

  MTLType = interface(NSObject)
    ['{EE6F8DC0-70E2-42C2-939C-3707CC3DE6EF}']
    function dataType: MTLDataType; cdecl;
  end;

  TMTLType = class(TOCGenericImport<MTLTypeClass, MTLType>)
  end;

  PMTLType = Pointer;

  MTLStructTypeClass = interface(MTLTypeClass)
    ['{19B0A403-4EA0-4EB5-9A61-232BE608EC7C}']
  end;

  MTLStructType = interface(MTLType)
    ['{E5D0592A-50E8-4F26-9362-8CA9C78DB87F}']
    function members: NSArray; cdecl;
    function memberByName(name: NSString): MTLStructMember; cdecl;
  end;

  TMTLStructType = class(TOCGenericImport<MTLStructTypeClass, MTLStructType>)
  end;

  PMTLStructType = Pointer;

  MTLArrayTypeClass = interface(MTLTypeClass)
    ['{B13E8152-7324-41E3-911A-1CE2D2864CF6}']
  end;

  MTLArrayType = interface(MTLType)
    ['{0D4F94F4-56C1-4F1B-B92A-6EF2E69B1950}']
    function elementType: MTLDataType; cdecl;
    function arrayLength: NSUInteger; cdecl;
    function stride: NSUInteger; cdecl;
    function argumentIndexStride: NSUInteger; cdecl;
    function elementStructType: MTLStructType; cdecl;
    function elementArrayType: MTLArrayType; cdecl;
    function elementTextureReferenceType: MTLTextureReferenceType; cdecl;
    function elementPointerType: MTLPointerType; cdecl;
  end;

  TMTLArrayType = class(TOCGenericImport<MTLArrayTypeClass, MTLArrayType>)
  end;

  PMTLArrayType = Pointer;

  MTLTextureReferenceTypeClass = interface(MTLTypeClass)
    ['{9C9E740C-180C-4505-B915-8DFAE367B0A8}']
  end;

  MTLTextureReferenceType = interface(MTLType)
    ['{A2E7413A-B4B9-4643-B9B2-B9A955392125}']
    function textureDataType: MTLDataType; cdecl;
    function textureType: MTLTextureType; cdecl;
    function access: MTLArgumentAccess; cdecl;
    function isDepthTexture: Boolean; cdecl;
  end;

  TMTLTextureReferenceType = class
    (TOCGenericImport<MTLTextureReferenceTypeClass, MTLTextureReferenceType>)
  end;

  PMTLTextureReferenceType = Pointer;

  MTLPointerTypeClass = interface(MTLTypeClass)
    ['{C94FAAF4-5B76-48B6-AC3B-3760B85B5CC0}']
  end;

  MTLPointerType = interface(MTLType)
    ['{369446F8-C80B-491E-9073-BCBACFEF6F4F}']
    function elementType: MTLDataType; cdecl;
    function access: MTLArgumentAccess; cdecl;
    function alignment: NSUInteger; cdecl;
    function dataSize: NSUInteger; cdecl;
    function elementIsArgumentBuffer: Boolean; cdecl;
    function elementStructType: MTLStructType; cdecl;
    function elementArrayType: MTLArrayType; cdecl;
  end;

  TMTLPointerType = class(TOCGenericImport<MTLPointerTypeClass, MTLPointerType>)
  end;

  PMTLPointerType = Pointer;

  MTLStructMemberClass = interface(NSObjectClass)
    ['{92551A66-DFEF-4C17-9AFB-F8998F1143C2}']
  end;

  MTLStructMember = interface(NSObject)
    ['{BDFCC004-A281-488B-B969-8E43C43A6F2D}']
    function name: NSString; cdecl;
    function offset: NSUInteger; cdecl;
    function dataType: MTLDataType; cdecl;
    function structType: MTLStructType; cdecl;
    function arrayType: MTLArrayType; cdecl;
    function textureReferenceType: MTLTextureReferenceType; cdecl;
    function pointerType: MTLPointerType; cdecl;
    function argumentIndex: NSUInteger; cdecl;
  end;

  TMTLStructMember = class(TOCGenericImport<MTLStructMemberClass,
    MTLStructMember>)
  end;

  PMTLStructMember = Pointer;

  MTLFunctionConstantValuesClass = interface(NSObjectClass)
    ['{D8F0D522-89D1-4FA2-B049-C808A7F1436C}']
  end;

  MTLFunctionConstantValues = interface(NSObject)
    ['{C2DA4133-3A44-4D91-8C60-7BBEB16D36A7}']
    [MethodName('setConstantValue:type:atIndex:')]
    procedure setConstantValueTypeAtIndex(value: Pointer; &type: MTLDataType;
      atIndex: NSUInteger); cdecl;
    procedure setConstantValues(values: Pointer; &type: MTLDataType;
      withRange: NSRange); cdecl;
    [MethodName('setConstantValue:type:withName:')]
    procedure setConstantValueTypeWithName(value: Pointer; &type: MTLDataType;
      withName: NSString); cdecl;
    procedure reset; cdecl;
  end;

  TMTLFunctionConstantValues = class
    (TOCGenericImport<MTLFunctionConstantValuesClass,
    MTLFunctionConstantValues>)
  end;

  PMTLFunctionConstantValues = Pointer;

  MTLFunctionDescriptorClass = interface(NSObjectClass)
    ['{AE5177EB-662B-4AFA-B11C-49AFA6AAE644}']
    { class } function functionDescriptor: MTLFunctionDescriptor; cdecl;
  end;

  MTLFunctionDescriptor = interface(NSObject)
    ['{D74FE04A-E4BF-453D-9F79-ED234F5047F9}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setSpecializedName(specializedName: NSString); cdecl;
    function specializedName: NSString; cdecl;
    procedure setConstantValues(constantValues
      : MTLFunctionConstantValues); cdecl;
    function constantValues: MTLFunctionConstantValues; cdecl;
    procedure setOptions(options: MTLFunctionOptions); cdecl;
    function options: MTLFunctionOptions; cdecl;
    procedure setBinaryArchives(binaryArchives: NSArray); cdecl;
    function binaryArchives: NSArray; cdecl;
  end;

  TMTLFunctionDescriptor = class(TOCGenericImport<MTLFunctionDescriptorClass,
    MTLFunctionDescriptor>)
  end;

  PMTLFunctionDescriptor = Pointer;

  MTLIntersectionFunctionDescriptorClass = interface(MTLFunctionDescriptorClass)
    ['{F4424102-CDED-4E8D-8A2F-C1857F445F79}']
  end;

  MTLIntersectionFunctionDescriptor = interface(MTLFunctionDescriptor)
    ['{DE761B8E-1E8A-42AE-8F20-833E86A9E14D}']
  end;

  TMTLIntersectionFunctionDescriptor = class
    (TOCGenericImport<MTLIntersectionFunctionDescriptorClass,
    MTLIntersectionFunctionDescriptor>)
  end;

  PMTLIntersectionFunctionDescriptor = Pointer;

  MTLCompileOptionsClass = interface(NSObjectClass)
    ['{418C707F-FAB7-404D-99EC-B38CC836E04C}']
  end;

  MTLCompileOptions = interface(NSObject)
    ['{1577085A-5BBC-4BB4-9F11-6C178D6631AF}']
    procedure setPreprocessorMacros(preprocessorMacros: NSDictionary); cdecl;
    function preprocessorMacros: NSDictionary; cdecl;
    procedure setFastMathEnabled(fastMathEnabled: Boolean); cdecl;
    function fastMathEnabled: Boolean; cdecl;
    procedure setLanguageVersion(languageVersion: MTLLanguageVersion); cdecl;
    function languageVersion: MTLLanguageVersion; cdecl;
    procedure setLibraryType(libraryType: MTLLibraryType); cdecl;
    function libraryType: MTLLibraryType; cdecl;
    procedure setInstallName(installName: NSString); cdecl;
    function installName: NSString; cdecl;
    procedure setLibraries(libraries: NSArray); cdecl;
    function libraries: NSArray; cdecl;
    procedure setPreserveInvariance(preserveInvariance: Boolean); cdecl;
    function preserveInvariance: Boolean; cdecl;
    procedure setOptimizationLevel(optimizationLevel
      : MTLLibraryOptimizationLevel); cdecl;
    function optimizationLevel: MTLLibraryOptimizationLevel; cdecl;
    procedure setCompileSymbolVisibility(compileSymbolVisibility
      : MTLCompileSymbolVisibility); cdecl;
    function compileSymbolVisibility: MTLCompileSymbolVisibility; cdecl;
    procedure setAllowReferencingUndefinedSymbols
      (allowReferencingUndefinedSymbols: Boolean); cdecl;
    function allowReferencingUndefinedSymbols: Boolean; cdecl;
    procedure setMaxTotalThreadsPerThreadgroup(maxTotalThreadsPerThreadgroup
      : NSUInteger); cdecl;
    function maxTotalThreadsPerThreadgroup: NSUInteger; cdecl;
  end;

  TMTLCompileOptions = class(TOCGenericImport<MTLCompileOptionsClass,
    MTLCompileOptions>)
  end;

  PMTLCompileOptions = Pointer;

  MTLVertexAttributeClass = interface(NSObjectClass)
    ['{F1D75644-EC7E-49AA-B605-47B955694EFC}']
  end;

  MTLVertexAttribute = interface(NSObject)
    ['{0A7CA4C8-80E0-41CD-AF1B-4E97BC779537}']
    function name: NSString; cdecl;
    function attributeIndex: NSUInteger; cdecl;
    function attributeType: MTLDataType; cdecl;
    function isActive: Boolean; cdecl;
    function isPatchData: Boolean; cdecl;
    function isPatchControlPointData: Boolean; cdecl;
  end;

  TMTLVertexAttribute = class(TOCGenericImport<MTLVertexAttributeClass,
    MTLVertexAttribute>)
  end;

  PMTLVertexAttribute = Pointer;

  MTLAttributeClass = interface(NSObjectClass)
    ['{F0B00697-FC5A-4A0F-8B73-9D61A17EA7D8}']
  end;

  MTLAttribute = interface(NSObject)
    ['{73C34822-3195-489F-B256-F93C87C8A927}']
    function name: NSString; cdecl;
    function attributeIndex: NSUInteger; cdecl;
    function attributeType: MTLDataType; cdecl;
    function isActive: Boolean; cdecl;
    function isPatchData: Boolean; cdecl;
    function isPatchControlPointData: Boolean; cdecl;
  end;

  TMTLAttribute = class(TOCGenericImport<MTLAttributeClass, MTLAttribute>)
  end;

  PMTLAttribute = Pointer;

  MTLFunctionConstantClass = interface(NSObjectClass)
    ['{8B9F100A-8F59-475E-B182-1270791A33A9}']
  end;

  MTLFunctionConstant = interface(NSObject)
    ['{A9A069B3-7368-4BEE-A3EB-7BB868B12174}']
    function name: NSString; cdecl;
    function &type: MTLDataType; cdecl;
    function index: NSUInteger; cdecl;
    function required: Boolean; cdecl;
  end;

  TMTLFunctionConstant = class(TOCGenericImport<MTLFunctionConstantClass,
    MTLFunctionConstant>)
  end;

  PMTLFunctionConstant = Pointer;

  MTLCounterSampleBufferDescriptorClass = interface(NSObjectClass)
    ['{F26F35C7-D1B6-4C2B-8C2E-2FAD7DE11CA2}']
  end;

  MTLCounterSampleBufferDescriptor = interface(NSObject)
    ['{0E0757A2-AF2C-4959-8B21-6432E805E1E3}']
    procedure setCounterSet(counterSet: Pointer); cdecl;
    function counterSet: Pointer; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    procedure setStorageMode(storageMode: MTLStorageMode); cdecl;
    function storageMode: MTLStorageMode; cdecl;
    procedure setSampleCount(sampleCount: NSUInteger); cdecl;
    function sampleCount: NSUInteger; cdecl;
  end;

  TMTLCounterSampleBufferDescriptor = class
    (TOCGenericImport<MTLCounterSampleBufferDescriptorClass,
    MTLCounterSampleBufferDescriptor>)
  end;

  PMTLCounterSampleBufferDescriptor = Pointer;

  MTLRasterizationRateLayerDescriptorClass = interface(NSObjectClass)
    ['{E3C98A2F-3F00-4DE0-A90D-3B08D56BCFE1}']
  end;

  MTLRasterizationRateLayerDescriptor = interface(NSObject)
    ['{85BEA14D-57AB-484A-83D6-3BA0670297C9}']
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithSampleCount:')]
    function initWithSampleCount(sampleCount: MTLSize)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithSampleCount:horizontal:vertical:')]
    function initWithSampleCountHorizontalVertical(sampleCount: MTLSize;
      horizontal: PSingle; vertical: PSingle): Pointer { instancetype }; cdecl;
    procedure setSampleCount(sampleCount: MTLSize); cdecl;
    function sampleCount: MTLSize; cdecl;
    function maxSampleCount: MTLSize; cdecl;
    function horizontalSampleStorage: PSingle; cdecl;
    function verticalSampleStorage: PSingle; cdecl;
    function horizontal: MTLRasterizationRateSampleArray; cdecl;
    function vertical: MTLRasterizationRateSampleArray; cdecl;
  end;

  TMTLRasterizationRateLayerDescriptor = class
    (TOCGenericImport<MTLRasterizationRateLayerDescriptorClass,
    MTLRasterizationRateLayerDescriptor>)
  end;

  PMTLRasterizationRateLayerDescriptor = Pointer;

  MTLRasterizationRateMapDescriptorClass = interface(NSObjectClass)
    ['{3979A508-31BB-4639-83BB-0923EAD2F283}']
    [MethodName('rasterizationRateMapDescriptorWithScreenSize:')]
    { class } function rasterizationRateMapDescriptorWithScreenSize
      (screenSize: MTLSize): MTLRasterizationRateMapDescriptor; cdecl;
    [MethodName('rasterizationRateMapDescriptorWithScreenSize:layer:')]
    { class } function rasterizationRateMapDescriptorWithScreenSizeLayer
      (screenSize: MTLSize; layer: MTLRasterizationRateLayerDescriptor)
      : MTLRasterizationRateMapDescriptor; cdecl;
    [MethodName
      ('rasterizationRateMapDescriptorWithScreenSize:layerCount:layers:')]
    { class } function
      rasterizationRateMapDescriptorWithScreenSizeLayerCountLayers
      (screenSize: MTLSize; layerCount: NSUInteger;
      layers: MTLRasterizationRateLayerDescriptor)
      : MTLRasterizationRateMapDescriptor; cdecl;
  end;

  MTLRasterizationRateMapDescriptor = interface(NSObject)
    ['{E8A28A1B-CA0D-4627-919C-A555CD4638D1}']
    function layerAtIndex(layerIndex: NSUInteger)
      : MTLRasterizationRateLayerDescriptor; cdecl;
    procedure setLayer(layer: MTLRasterizationRateLayerDescriptor;
      atIndex: NSUInteger); cdecl;
    function layers: MTLRasterizationRateLayerArray; cdecl;
    procedure setScreenSize(screenSize: MTLSize); cdecl;
    function screenSize: MTLSize; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    function layerCount: NSUInteger; cdecl;
  end;

  TMTLRasterizationRateMapDescriptor = class
    (TOCGenericImport<MTLRasterizationRateMapDescriptorClass,
    MTLRasterizationRateMapDescriptor>)
  end;

  PMTLRasterizationRateMapDescriptor = Pointer;

  MTLTileRenderPipelineDescriptorClass = interface(NSObjectClass)
    ['{FB59462A-7D00-478C-8F43-BA86C24E5275}']
  end;

  MTLTileRenderPipelineDescriptor = interface(NSObject)
    ['{CCF122D3-3CAF-4C18-ADD2-225D935BA82E}']
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    procedure setTileFunction(tileFunction: Pointer); cdecl;
    function tileFunction: Pointer; cdecl;
    procedure setRasterSampleCount(rasterSampleCount: NSUInteger); cdecl;
    function rasterSampleCount: NSUInteger; cdecl;
    function colorAttachments
      : MTLTileRenderPipelineColorAttachmentDescriptorArray; cdecl;
    procedure setThreadgroupSizeMatchesTileSize(threadgroupSizeMatchesTileSize
      : Boolean); cdecl;
    function threadgroupSizeMatchesTileSize: Boolean; cdecl;
    function tileBuffers: MTLPipelineBufferDescriptorArray; cdecl;
    procedure setMaxTotalThreadsPerThreadgroup(maxTotalThreadsPerThreadgroup
      : NSUInteger); cdecl;
    function maxTotalThreadsPerThreadgroup: NSUInteger; cdecl;
    procedure setBinaryArchives(binaryArchives: NSArray); cdecl;
    function binaryArchives: NSArray; cdecl;
    procedure setPreloadedLibraries(preloadedLibraries: NSArray); cdecl;
    function preloadedLibraries: NSArray; cdecl;
    procedure setLinkedFunctions(linkedFunctions: MTLLinkedFunctions); cdecl;
    function linkedFunctions: MTLLinkedFunctions; cdecl;
    procedure setSupportAddingBinaryFunctions(supportAddingBinaryFunctions
      : Boolean); cdecl;
    function supportAddingBinaryFunctions: Boolean; cdecl;
    procedure setMaxCallStackDepth(maxCallStackDepth: NSUInteger); cdecl;
    function maxCallStackDepth: NSUInteger; cdecl;
    procedure reset; cdecl;
  end;

  TMTLTileRenderPipelineDescriptor = class
    (TOCGenericImport<MTLTileRenderPipelineDescriptorClass,
    MTLTileRenderPipelineDescriptor>)
  end;

  PMTLTileRenderPipelineDescriptor = Pointer;

  MTLMeshRenderPipelineDescriptorClass = interface(NSObjectClass)
    ['{54B00661-34EC-4083-9CB7-F88B69C1E7A6}']
  end;

  MTLMeshRenderPipelineDescriptor = interface(NSObject)
    ['{34BC3EBA-B739-4877-9E86-50AAF7882BA1}']
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    procedure setObjectFunction(objectFunction: Pointer); cdecl;
    function objectFunction: Pointer; cdecl;
    procedure setMeshFunction(meshFunction: Pointer); cdecl;
    function meshFunction: Pointer; cdecl;
    procedure setFragmentFunction(fragmentFunction: Pointer); cdecl;
    function fragmentFunction: Pointer; cdecl;
    procedure setMaxTotalThreadsPerObjectThreadgroup
      (maxTotalThreadsPerObjectThreadgroup: NSUInteger); cdecl;
    function maxTotalThreadsPerObjectThreadgroup: NSUInteger; cdecl;
    procedure setMaxTotalThreadsPerMeshThreadgroup
      (maxTotalThreadsPerMeshThreadgroup: NSUInteger); cdecl;
    function maxTotalThreadsPerMeshThreadgroup: NSUInteger; cdecl;
    procedure setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth
      (objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: Boolean); cdecl;
    function objectThreadgroupSizeIsMultipleOfThreadExecutionWidth
      : Boolean; cdecl;
    procedure setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth
      (meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: Boolean); cdecl;
    function meshThreadgroupSizeIsMultipleOfThreadExecutionWidth
      : Boolean; cdecl;
    procedure setPayloadMemoryLength(payloadMemoryLength: NSUInteger); cdecl;
    function payloadMemoryLength: NSUInteger; cdecl;
    procedure setMaxTotalThreadgroupsPerMeshGrid(maxTotalThreadgroupsPerMeshGrid
      : NSUInteger); cdecl;
    function maxTotalThreadgroupsPerMeshGrid: NSUInteger; cdecl;
    function objectBuffers: MTLPipelineBufferDescriptorArray; cdecl;
    function meshBuffers: MTLPipelineBufferDescriptorArray; cdecl;
    function fragmentBuffers: MTLPipelineBufferDescriptorArray; cdecl;
    procedure setRasterSampleCount(rasterSampleCount: NSUInteger); cdecl;
    function rasterSampleCount: NSUInteger; cdecl;
    procedure setAlphaToCoverageEnabled(alphaToCoverageEnabled: Boolean); cdecl;
    function isAlphaToCoverageEnabled: Boolean; cdecl;
    procedure setAlphaToOneEnabled(alphaToOneEnabled: Boolean); cdecl;
    function isAlphaToOneEnabled: Boolean; cdecl;
    procedure setRasterizationEnabled(rasterizationEnabled: Boolean); cdecl;
    function isRasterizationEnabled: Boolean; cdecl;
    procedure setMaxVertexAmplificationCount(maxVertexAmplificationCount
      : NSUInteger); cdecl;
    function maxVertexAmplificationCount: NSUInteger; cdecl;
    function colorAttachments
      : MTLRenderPipelineColorAttachmentDescriptorArray; cdecl;
    procedure setDepthAttachmentPixelFormat(depthAttachmentPixelFormat
      : MTLPixelFormat); cdecl;
    function depthAttachmentPixelFormat: MTLPixelFormat; cdecl;
    procedure setStencilAttachmentPixelFormat(stencilAttachmentPixelFormat
      : MTLPixelFormat); cdecl;
    function stencilAttachmentPixelFormat: MTLPixelFormat; cdecl;
    procedure reset; cdecl;
  end;

  TMTLMeshRenderPipelineDescriptor = class
    (TOCGenericImport<MTLMeshRenderPipelineDescriptorClass,
    MTLMeshRenderPipelineDescriptor>)
  end;

  PMTLMeshRenderPipelineDescriptor = Pointer;

  MTLSamplerDescriptorClass = interface(NSObjectClass)
    ['{31AD07EE-EA89-4724-B760-4E5670C20F31}']
  end;

  MTLSamplerDescriptor = interface(NSObject)
    ['{F3E89FFF-9858-497C-8AB8-1E16AED3B50F}']
    procedure setMinFilter(minFilter: MTLSamplerMinMagFilter); cdecl;
    function minFilter: MTLSamplerMinMagFilter; cdecl;
    procedure setMagFilter(magFilter: MTLSamplerMinMagFilter); cdecl;
    function magFilter: MTLSamplerMinMagFilter; cdecl;
    procedure setMipFilter(mipFilter: MTLSamplerMipFilter); cdecl;
    function mipFilter: MTLSamplerMipFilter; cdecl;
    procedure setMaxAnisotropy(maxAnisotropy: NSUInteger); cdecl;
    function maxAnisotropy: NSUInteger; cdecl;
    procedure setSAddressMode(sAddressMode: MTLSamplerAddressMode); cdecl;
    function sAddressMode: MTLSamplerAddressMode; cdecl;
    procedure setTAddressMode(tAddressMode: MTLSamplerAddressMode); cdecl;
    function tAddressMode: MTLSamplerAddressMode; cdecl;
    procedure setRAddressMode(rAddressMode: MTLSamplerAddressMode); cdecl;
    function rAddressMode: MTLSamplerAddressMode; cdecl;
    procedure setBorderColor(borderColor: MTLSamplerBorderColor); cdecl;
    function borderColor: MTLSamplerBorderColor; cdecl;
    procedure setNormalizedCoordinates(normalizedCoordinates: Boolean); cdecl;
    function normalizedCoordinates: Boolean; cdecl;
    procedure setLodMinClamp(lodMinClamp: Single); cdecl;
    function lodMinClamp: Single; cdecl;
    procedure setLodMaxClamp(lodMaxClamp: Single); cdecl;
    function lodMaxClamp: Single; cdecl;
    procedure setLodAverage(lodAverage: Boolean); cdecl;
    function lodAverage: Boolean; cdecl;
    procedure setCompareFunction(compareFunction: MTLCompareFunction); cdecl;
    function compareFunction: MTLCompareFunction; cdecl;
    procedure setSupportArgumentBuffers(supportArgumentBuffers: Boolean); cdecl;
    function supportArgumentBuffers: Boolean; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
  end;

  TMTLSamplerDescriptor = class(TOCGenericImport<MTLSamplerDescriptorClass,
    MTLSamplerDescriptor>)
  end;

  PMTLSamplerDescriptor = Pointer;

  MTLRenderPipelineColorAttachmentDescriptorClass = interface(NSObjectClass)
    ['{67B3339E-E908-4F4B-9235-05EBD1C2FF5D}']
  end;

  MTLRenderPipelineColorAttachmentDescriptor = interface(NSObject)
    ['{4A6381C6-1C2D-4DDD-A664-71788665012A}']
    procedure setPixelFormat(pixelFormat: MTLPixelFormat); cdecl;
    function pixelFormat: MTLPixelFormat; cdecl;
    procedure setBlendingEnabled(blendingEnabled: Boolean); cdecl;
    function isBlendingEnabled: Boolean; cdecl;
    procedure setSourceRGBBlendFactor(sourceRGBBlendFactor
      : MTLBlendFactor); cdecl;
    function sourceRGBBlendFactor: MTLBlendFactor; cdecl;
    procedure setDestinationRGBBlendFactor(destinationRGBBlendFactor
      : MTLBlendFactor); cdecl;
    function destinationRGBBlendFactor: MTLBlendFactor; cdecl;
    procedure setRgbBlendOperation(rgbBlendOperation: MTLBlendOperation); cdecl;
    function rgbBlendOperation: MTLBlendOperation; cdecl;
    procedure setSourceAlphaBlendFactor(sourceAlphaBlendFactor
      : MTLBlendFactor); cdecl;
    function sourceAlphaBlendFactor: MTLBlendFactor; cdecl;
    procedure setDestinationAlphaBlendFactor(destinationAlphaBlendFactor
      : MTLBlendFactor); cdecl;
    function destinationAlphaBlendFactor: MTLBlendFactor; cdecl;
    procedure setAlphaBlendOperation(alphaBlendOperation
      : MTLBlendOperation); cdecl;
    function alphaBlendOperation: MTLBlendOperation; cdecl;
    procedure setWriteMask(writeMask: MTLColorWriteMask); cdecl;
    function writeMask: MTLColorWriteMask; cdecl;
  end;

  TMTLRenderPipelineColorAttachmentDescriptor = class
    (TOCGenericImport<MTLRenderPipelineColorAttachmentDescriptorClass,
    MTLRenderPipelineColorAttachmentDescriptor>)
  end;

  PMTLRenderPipelineColorAttachmentDescriptor = Pointer;

  MTLDepthStencilDescriptorClass = interface(NSObjectClass)
    ['{4B4B8B1F-DB39-4C61-9074-967CFCDF98BD}']
  end;

  MTLDepthStencilDescriptor = interface(NSObject)
    ['{65D13D97-917A-4A53-A73F-F727333E307A}']
    procedure setDepthCompareFunction(depthCompareFunction
      : MTLCompareFunction); cdecl;
    function depthCompareFunction: MTLCompareFunction; cdecl;
    procedure setDepthWriteEnabled(depthWriteEnabled: Boolean); cdecl;
    function isDepthWriteEnabled: Boolean; cdecl;
    procedure setFrontFaceStencil(frontFaceStencil
      : MTLStencilDescriptor); cdecl;
    function frontFaceStencil: MTLStencilDescriptor; cdecl;
    procedure setBackFaceStencil(backFaceStencil: MTLStencilDescriptor); cdecl;
    function backFaceStencil: MTLStencilDescriptor; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
  end;

  TMTLDepthStencilDescriptor = class
    (TOCGenericImport<MTLDepthStencilDescriptorClass,
    MTLDepthStencilDescriptor>)
  end;

  PMTLDepthStencilDescriptor = Pointer;

  MTLRenderPipelineDescriptorClass = interface(NSObjectClass)
    ['{A8C3CF41-8070-423F-A720-9E4A9880DBC0}']
  end;

  MTLRenderPipelineDescriptor = interface(NSObject)
    ['{1C35F0E5-7640-4FF4-8C03-A13A0C6723F8}']
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    procedure setVertexFunction(vertexFunction: Pointer); cdecl;
    function vertexFunction: Pointer; cdecl;
    procedure setFragmentFunction(fragmentFunction: Pointer); cdecl;
    function fragmentFunction: Pointer; cdecl;
    procedure setVertexDescriptor(vertexDescriptor: MTLVertexDescriptor); cdecl;
    function vertexDescriptor: MTLVertexDescriptor; cdecl;
    procedure setSampleCount(sampleCount: NSUInteger); cdecl;
    function sampleCount: NSUInteger; cdecl;
    procedure setRasterSampleCount(rasterSampleCount: NSUInteger); cdecl;
    function rasterSampleCount: NSUInteger; cdecl;
    procedure setAlphaToCoverageEnabled(alphaToCoverageEnabled: Boolean); cdecl;
    function isAlphaToCoverageEnabled: Boolean; cdecl;
    procedure setAlphaToOneEnabled(alphaToOneEnabled: Boolean); cdecl;
    function isAlphaToOneEnabled: Boolean; cdecl;
    procedure setRasterizationEnabled(rasterizationEnabled: Boolean); cdecl;
    function isRasterizationEnabled: Boolean; cdecl;
    procedure setMaxVertexAmplificationCount(maxVertexAmplificationCount
      : NSUInteger); cdecl;
    function maxVertexAmplificationCount: NSUInteger; cdecl;
    function colorAttachments
      : MTLRenderPipelineColorAttachmentDescriptorArray; cdecl;
    procedure setDepthAttachmentPixelFormat(depthAttachmentPixelFormat
      : MTLPixelFormat); cdecl;
    function depthAttachmentPixelFormat: MTLPixelFormat; cdecl;
    procedure setStencilAttachmentPixelFormat(stencilAttachmentPixelFormat
      : MTLPixelFormat); cdecl;
    function stencilAttachmentPixelFormat: MTLPixelFormat; cdecl;
    procedure setInputPrimitiveTopology(inputPrimitiveTopology
      : MTLPrimitiveTopologyClass); cdecl;
    function inputPrimitiveTopology: MTLPrimitiveTopologyClass; cdecl;
    procedure setTessellationPartitionMode(tessellationPartitionMode
      : MTLTessellationPartitionMode); cdecl;
    function tessellationPartitionMode: MTLTessellationPartitionMode; cdecl;
    procedure setMaxTessellationFactor(maxTessellationFactor
      : NSUInteger); cdecl;
    function maxTessellationFactor: NSUInteger; cdecl;
    procedure setTessellationFactorScaleEnabled(tessellationFactorScaleEnabled
      : Boolean); cdecl;
    function isTessellationFactorScaleEnabled: Boolean; cdecl;
    procedure setTessellationFactorFormat(tessellationFactorFormat
      : MTLTessellationFactorFormat); cdecl;
    function tessellationFactorFormat: MTLTessellationFactorFormat; cdecl;
    procedure setTessellationControlPointIndexType
      (tessellationControlPointIndexType
      : MTLTessellationControlPointIndexType); cdecl;
    function tessellationControlPointIndexType
      : MTLTessellationControlPointIndexType; cdecl;
    procedure setTessellationFactorStepFunction(tessellationFactorStepFunction
      : MTLTessellationFactorStepFunction); cdecl;
    function tessellationFactorStepFunction
      : MTLTessellationFactorStepFunction; cdecl;
    procedure setTessellationOutputWindingOrder(tessellationOutputWindingOrder
      : MTLWinding); cdecl;
    function tessellationOutputWindingOrder: MTLWinding; cdecl;
    function vertexBuffers: MTLPipelineBufferDescriptorArray; cdecl;
    function fragmentBuffers: MTLPipelineBufferDescriptorArray; cdecl;
    procedure setSupportIndirectCommandBuffers(supportIndirectCommandBuffers
      : Boolean); cdecl;
    function supportIndirectCommandBuffers: Boolean; cdecl;
    procedure setBinaryArchives(binaryArchives: NSArray); cdecl;
    function binaryArchives: NSArray; cdecl;
    procedure setVertexPreloadedLibraries(vertexPreloadedLibraries
      : NSArray); cdecl;
    function vertexPreloadedLibraries: NSArray; cdecl;
    procedure setFragmentPreloadedLibraries(fragmentPreloadedLibraries
      : NSArray); cdecl;
    function fragmentPreloadedLibraries: NSArray; cdecl;
    procedure setVertexLinkedFunctions(vertexLinkedFunctions
      : MTLLinkedFunctions); cdecl;
    function vertexLinkedFunctions: MTLLinkedFunctions; cdecl;
    procedure setFragmentLinkedFunctions(fragmentLinkedFunctions
      : MTLLinkedFunctions); cdecl;
    function fragmentLinkedFunctions: MTLLinkedFunctions; cdecl;
    procedure setSupportAddingVertexBinaryFunctions
      (supportAddingVertexBinaryFunctions: Boolean); cdecl;
    function supportAddingVertexBinaryFunctions: Boolean; cdecl;
    procedure setSupportAddingFragmentBinaryFunctions
      (supportAddingFragmentBinaryFunctions: Boolean); cdecl;
    function supportAddingFragmentBinaryFunctions: Boolean; cdecl;
    procedure setMaxVertexCallStackDepth(maxVertexCallStackDepth
      : NSUInteger); cdecl;
    function maxVertexCallStackDepth: NSUInteger; cdecl;
    procedure setMaxFragmentCallStackDepth(maxFragmentCallStackDepth
      : NSUInteger); cdecl;
    function maxFragmentCallStackDepth: NSUInteger; cdecl;
    procedure reset; cdecl;
  end;

  TMTLRenderPipelineDescriptor = class
    (TOCGenericImport<MTLRenderPipelineDescriptorClass,
    MTLRenderPipelineDescriptor>)
  end;

  PMTLRenderPipelineDescriptor = Pointer;

  MTLRenderPassDescriptorClass = interface(NSObjectClass)
    ['{FE8C29D8-B571-4D1E-A7F2-6C2371317DCB}']
    { class } function renderPassDescriptor: MTLRenderPassDescriptor; cdecl;
  end;

  MTLRenderPassDescriptor = interface(NSObject)
    ['{346E3FD4-BBBB-4173-8406-54A769DF4DA8}']
    function colorAttachments
      : MTLRenderPassColorAttachmentDescriptorArray; cdecl;
    procedure setDepthAttachment(depthAttachment
      : MTLRenderPassDepthAttachmentDescriptor); cdecl;
    function depthAttachment: MTLRenderPassDepthAttachmentDescriptor; cdecl;
    procedure setStencilAttachment(stencilAttachment
      : MTLRenderPassStencilAttachmentDescriptor); cdecl;
    function stencilAttachment: MTLRenderPassStencilAttachmentDescriptor; cdecl;
    procedure setVisibilityResultBuffer(visibilityResultBuffer: Pointer); cdecl;
    function visibilityResultBuffer: Pointer; cdecl;
    procedure setRenderTargetArrayLength(renderTargetArrayLength
      : NSUInteger); cdecl;
    function renderTargetArrayLength: NSUInteger; cdecl;
    procedure setImageblockSampleLength(imageblockSampleLength
      : NSUInteger); cdecl;
    function imageblockSampleLength: NSUInteger; cdecl;
    procedure setThreadgroupMemoryLength(threadgroupMemoryLength
      : NSUInteger); cdecl;
    function threadgroupMemoryLength: NSUInteger; cdecl;
    procedure setTileWidth(tileWidth: NSUInteger); cdecl;
    function tileWidth: NSUInteger; cdecl;
    procedure setTileHeight(tileHeight: NSUInteger); cdecl;
    function tileHeight: NSUInteger; cdecl;
    procedure setDefaultRasterSampleCount(defaultRasterSampleCount
      : NSUInteger); cdecl;
    function defaultRasterSampleCount: NSUInteger; cdecl;
    procedure setRenderTargetWidth(renderTargetWidth: NSUInteger); cdecl;
    function renderTargetWidth: NSUInteger; cdecl;
    procedure setRenderTargetHeight(renderTargetHeight: NSUInteger); cdecl;
    function renderTargetHeight: NSUInteger; cdecl;
    procedure setSamplePositions(positions: PMTLSamplePosition;
      count: NSUInteger); cdecl;
    function getSamplePositions(positions: PMTLSamplePosition;
      count: NSUInteger): NSUInteger; cdecl;
    procedure setRasterizationRateMap(rasterizationRateMap: Pointer); cdecl;
    function rasterizationRateMap: Pointer; cdecl;
    function sampleBufferAttachments
      : MTLRenderPassSampleBufferAttachmentDescriptorArray; cdecl;
  end;

  TMTLRenderPassDescriptor = class
    (TOCGenericImport<MTLRenderPassDescriptorClass, MTLRenderPassDescriptor>)
  end;

  PMTLRenderPassDescriptor = Pointer;

  MTLComputePassDescriptorClass = interface(NSObjectClass)
    ['{BF36B05E-2F90-4BFA-8E33-BB49BAF404A9}']
    { class } function computePassDescriptor: MTLComputePassDescriptor; cdecl;
  end;

  MTLComputePassDescriptor = interface(NSObject)
    ['{B50F3E29-D6C7-455F-ACC9-1AAC0C609B85}']
    procedure setDispatchType(dispatchType: MTLDispatchType); cdecl;
    function dispatchType: MTLDispatchType; cdecl;
    function sampleBufferAttachments
      : MTLComputePassSampleBufferAttachmentDescriptorArray; cdecl;
  end;

  TMTLComputePassDescriptor = class
    (TOCGenericImport<MTLComputePassDescriptorClass, MTLComputePassDescriptor>)
  end;

  PMTLComputePassDescriptor = Pointer;

  MTLBlitPassDescriptorClass = interface(NSObjectClass)
    ['{09771C49-3FC2-42A2-B489-3597652E3DF7}']
    { class } function blitPassDescriptor: MTLBlitPassDescriptor; cdecl;
  end;

  MTLBlitPassDescriptor = interface(NSObject)
    ['{65DEE637-CF2E-4E11-9069-7A68D2912D5E}']
    function sampleBufferAttachments
      : MTLBlitPassSampleBufferAttachmentDescriptorArray; cdecl;
  end;

  TMTLBlitPassDescriptor = class(TOCGenericImport<MTLBlitPassDescriptorClass,
    MTLBlitPassDescriptor>)
  end;

  PMTLBlitPassDescriptor = Pointer;

  MTLRenderPipelineReflectionClass = interface(NSObjectClass)
    ['{73777609-0235-422C-A1D8-8306FB19629E}']
  end;

  MTLRenderPipelineReflection = interface(NSObject)
    ['{AC04D7DE-70C8-47CC-BA33-18FCF827D04D}']
    function vertexBindings: NSArray; cdecl;
    function fragmentBindings: NSArray; cdecl;
    function tileBindings: NSArray; cdecl;
    function objectBindings: NSArray; cdecl;
    function meshBindings: NSArray; cdecl;
    function vertexArguments: NSArray; cdecl;
    function fragmentArguments: NSArray; cdecl;
    function tileArguments: NSArray; cdecl;
  end;

  TMTLRenderPipelineReflection = class
    (TOCGenericImport<MTLRenderPipelineReflectionClass,
    MTLRenderPipelineReflection>)
  end;

  PMTLRenderPipelineReflection = Pointer;

  MTLComputePipelineDescriptorClass = interface(NSObjectClass)
    ['{618E7936-4AC2-4A95-AFA5-815C39CE7629}']
  end;

  MTLComputePipelineDescriptor = interface(NSObject)
    ['{363CA494-A6FB-4812-B4D0-00040ED8EF18}']
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    procedure setComputeFunction(computeFunction: Pointer); cdecl;
    function computeFunction: Pointer; cdecl;
    procedure setThreadGroupSizeIsMultipleOfThreadExecutionWidth
      (threadGroupSizeIsMultipleOfThreadExecutionWidth: Boolean); cdecl;
    function threadGroupSizeIsMultipleOfThreadExecutionWidth: Boolean; cdecl;
    procedure setMaxTotalThreadsPerThreadgroup(maxTotalThreadsPerThreadgroup
      : NSUInteger); cdecl;
    function maxTotalThreadsPerThreadgroup: NSUInteger; cdecl;
    procedure setStageInputDescriptor(stageInputDescriptor
      : MTLStageInputOutputDescriptor); cdecl;
    function stageInputDescriptor: MTLStageInputOutputDescriptor; cdecl;
    function buffers: MTLPipelineBufferDescriptorArray; cdecl;
    procedure setSupportIndirectCommandBuffers(supportIndirectCommandBuffers
      : Boolean); cdecl;
    function supportIndirectCommandBuffers: Boolean; cdecl;
    procedure setInsertLibraries(insertLibraries: NSArray); cdecl;
    function insertLibraries: NSArray; cdecl;
    procedure setPreloadedLibraries(preloadedLibraries: NSArray); cdecl;
    function preloadedLibraries: NSArray; cdecl;
    procedure setBinaryArchives(binaryArchives: NSArray); cdecl;
    function binaryArchives: NSArray; cdecl;
    procedure reset; cdecl;
    procedure setLinkedFunctions(linkedFunctions: MTLLinkedFunctions); cdecl;
    function linkedFunctions: MTLLinkedFunctions; cdecl;
    procedure setSupportAddingBinaryFunctions(supportAddingBinaryFunctions
      : Boolean); cdecl;
    function supportAddingBinaryFunctions: Boolean; cdecl;
    procedure setMaxCallStackDepth(maxCallStackDepth: NSUInteger); cdecl;
    function maxCallStackDepth: NSUInteger; cdecl;
  end;

  TMTLComputePipelineDescriptor = class
    (TOCGenericImport<MTLComputePipelineDescriptorClass,
    MTLComputePipelineDescriptor>)
  end;

  PMTLComputePipelineDescriptor = Pointer;

  MTLComputePipelineReflectionClass = interface(NSObjectClass)
    ['{897C447F-C497-4EDC-8490-777085D83F78}']
  end;

  MTLComputePipelineReflection = interface(NSObject)
    ['{C3827EA0-ADB0-42D3-BA4B-30B02E732DA5}']
    function bindings: NSArray; cdecl;
    function arguments: NSArray; cdecl;
  end;

  TMTLComputePipelineReflection = class
    (TOCGenericImport<MTLComputePipelineReflectionClass,
    MTLComputePipelineReflection>)
  end;

  PMTLComputePipelineReflection = Pointer;

  MTLHeapDescriptorClass = interface(NSObjectClass)
    ['{6644E141-209E-49BC-9BA0-16F5C48AEB14}']
  end;

  MTLHeapDescriptor = interface(NSObject)
    ['{9708FC3D-3B0D-4999-9867-2327949D7DD8}']
    procedure setSize(size: NSUInteger); cdecl;
    function size: NSUInteger; cdecl;
    procedure setStorageMode(storageMode: MTLStorageMode); cdecl;
    function storageMode: MTLStorageMode; cdecl;
    procedure setCpuCacheMode(cpuCacheMode: MTLCPUCacheMode); cdecl;
    function cpuCacheMode: MTLCPUCacheMode; cdecl;
    procedure setSparsePageSize(sparsePageSize: MTLSparsePageSize); cdecl;
    function sparsePageSize: MTLSparsePageSize; cdecl;
    procedure setHazardTrackingMode(hazardTrackingMode
      : MTLHazardTrackingMode); cdecl;
    function hazardTrackingMode: MTLHazardTrackingMode; cdecl;
    procedure setResourceOptions(resourceOptions: MTLResourceOptions); cdecl;
    function resourceOptions: MTLResourceOptions; cdecl;
    procedure setType(&type: MTLHeapType); cdecl;
    function &type: MTLHeapType; cdecl;
  end;

  TMTLHeapDescriptor = class(TOCGenericImport<MTLHeapDescriptorClass,
    MTLHeapDescriptor>)
  end;

  PMTLHeapDescriptor = Pointer;

  MTLIndirectCommandBufferDescriptorClass = interface(NSObjectClass)
    ['{B98EAB00-199B-4112-BD26-90EDE99BD985}']
  end;

  MTLIndirectCommandBufferDescriptor = interface(NSObject)
    ['{BA525E2C-FA8C-4CFB-B3A4-F8E288159981}']
    procedure setCommandTypes(commandTypes: MTLIndirectCommandType); cdecl;
    function commandTypes: MTLIndirectCommandType; cdecl;
    procedure setInheritPipelineState(inheritPipelineState: Boolean); cdecl;
    function inheritPipelineState: Boolean; cdecl;
    procedure setInheritBuffers(inheritBuffers: Boolean); cdecl;
    function inheritBuffers: Boolean; cdecl;
    procedure setMaxVertexBufferBindCount(maxVertexBufferBindCount
      : NSUInteger); cdecl;
    function maxVertexBufferBindCount: NSUInteger; cdecl;
    procedure setMaxFragmentBufferBindCount(maxFragmentBufferBindCount
      : NSUInteger); cdecl;
    function maxFragmentBufferBindCount: NSUInteger; cdecl;
    procedure setMaxKernelBufferBindCount(maxKernelBufferBindCount
      : NSUInteger); cdecl;
    function maxKernelBufferBindCount: NSUInteger; cdecl;
    procedure setSupportRayTracing(supportRayTracing: Boolean); cdecl;
    function supportRayTracing: Boolean; cdecl;
  end;

  TMTLIndirectCommandBufferDescriptor = class
    (TOCGenericImport<MTLIndirectCommandBufferDescriptorClass,
    MTLIndirectCommandBufferDescriptor>)
  end;

  PMTLIndirectCommandBufferDescriptor = Pointer;

  MTLSharedEventHandleClass = interface(NSObjectClass)
    ['{F788DA86-3D0B-41F1-9BDE-D97C30261AED}']
  end;

  MTLSharedEventHandle = interface(NSObject)
    ['{56A10ACF-A3C5-447F-9941-89F0B54D7774}']
    function &label: NSString; cdecl;
  end;

  TMTLSharedEventHandle = class(TOCGenericImport<MTLSharedEventHandleClass,
    MTLSharedEventHandle>)
  end;

  PMTLSharedEventHandle = Pointer;

  MTLBinaryArchiveDescriptorClass = interface(NSObjectClass)
    ['{ED545977-DEDE-4C15-87AF-EBC6AABDF09A}']
  end;

  MTLBinaryArchiveDescriptor = interface(NSObject)
    ['{D9ECED4B-C61B-4131-8DCC-A8205194ECEA}']
    procedure setUrl(url: NSURL); cdecl;
    function url: NSURL; cdecl;
  end;

  TMTLBinaryArchiveDescriptor = class
    (TOCGenericImport<MTLBinaryArchiveDescriptorClass,
    MTLBinaryArchiveDescriptor>)
  end;

  PMTLBinaryArchiveDescriptor = Pointer;

  MTLAccelerationStructureDescriptorClass = interface(NSObjectClass)
    ['{49799B90-2C24-4853-A712-A925B6B1ED7A}']
  end;

  MTLAccelerationStructureDescriptor = interface(NSObject)
    ['{79F12122-9CA9-496F-B1E7-93D89A9FC6DD}']
    procedure setUsage(usage: MTLAccelerationStructureUsage); cdecl;
    function usage: MTLAccelerationStructureUsage; cdecl;
  end;

  TMTLAccelerationStructureDescriptor = class
    (TOCGenericImport<MTLAccelerationStructureDescriptorClass,
    MTLAccelerationStructureDescriptor>)
  end;

  PMTLAccelerationStructureDescriptor = Pointer;

  MTLVisibleFunctionTableDescriptorClass = interface(NSObjectClass)
    ['{30A9E974-665B-415D-8072-DCB2316567A7}']
    { class } function visibleFunctionTableDescriptor
      : MTLVisibleFunctionTableDescriptor; cdecl;
  end;

  MTLVisibleFunctionTableDescriptor = interface(NSObject)
    ['{8AC6F998-ACE5-45A6-8DAA-CA3A8DC48A6B}']
    procedure setFunctionCount(functionCount: NSUInteger); cdecl;
    function functionCount: NSUInteger; cdecl;
  end;

  TMTLVisibleFunctionTableDescriptor = class
    (TOCGenericImport<MTLVisibleFunctionTableDescriptorClass,
    MTLVisibleFunctionTableDescriptor>)
  end;

  PMTLVisibleFunctionTableDescriptor = Pointer;

  MTLIntersectionFunctionTableDescriptorClass = interface(NSObjectClass)
    ['{B985F3BD-ABF8-4D24-8D13-7247CF57B881}']
    { class } function intersectionFunctionTableDescriptor
      : MTLIntersectionFunctionTableDescriptor; cdecl;
  end;

  MTLIntersectionFunctionTableDescriptor = interface(NSObject)
    ['{86CF9C74-4A0C-486A-A351-FD01BC3A2582}']
    procedure setFunctionCount(functionCount: NSUInteger); cdecl;
    function functionCount: NSUInteger; cdecl;
  end;

  TMTLIntersectionFunctionTableDescriptor = class
    (TOCGenericImport<MTLIntersectionFunctionTableDescriptorClass,
    MTLIntersectionFunctionTableDescriptor>)
  end;

  PMTLIntersectionFunctionTableDescriptor = Pointer;

  MTLStitchedLibraryDescriptorClass = interface(NSObjectClass)
    ['{ABBC2C95-EABA-4641-82AF-6CEA96D45C7A}']
  end;

  MTLStitchedLibraryDescriptor = interface(NSObject)
    ['{0FCFA609-2CA2-4595-ADCF-9B947A0E07FA}']
    procedure setFunctionGraphs(functionGraphs: NSArray); cdecl;
    function functionGraphs: NSArray; cdecl;
    procedure setFunctions(functions: NSArray); cdecl;
    function functions: NSArray; cdecl;
  end;

  TMTLStitchedLibraryDescriptor = class
    (TOCGenericImport<MTLStitchedLibraryDescriptorClass,
    MTLStitchedLibraryDescriptor>)
  end;

  PMTLStitchedLibraryDescriptor = Pointer;

  MTLIOCommandQueueDescriptorClass = interface(NSObjectClass)
    ['{B07CFCDF-7CFC-4D0C-9EDC-A69C72478D59}']
  end;

  MTLIOCommandQueueDescriptor = interface(NSObject)
    ['{9926CB59-99F2-49ED-AE24-8871CF8F1F9C}']
    procedure setMaxCommandBufferCount(maxCommandBufferCount
      : NSUInteger); cdecl;
    function maxCommandBufferCount: NSUInteger; cdecl;
    procedure setPriority(priority: MTLIOPriority); cdecl;
    function priority: MTLIOPriority; cdecl;
    procedure setType(&type: MTLIOCommandQueueType); cdecl;
    function &type: MTLIOCommandQueueType; cdecl;
    procedure setMaxCommandsInFlight(maxCommandsInFlight: NSUInteger); cdecl;
    function maxCommandsInFlight: NSUInteger; cdecl;
    procedure setScratchBufferAllocator(scratchBufferAllocator: Pointer); cdecl;
    function scratchBufferAllocator: Pointer; cdecl;
  end;

  TMTLIOCommandQueueDescriptor = class
    (TOCGenericImport<MTLIOCommandQueueDescriptorClass,
    MTLIOCommandQueueDescriptor>)
  end;

  PMTLIOCommandQueueDescriptor = Pointer;

  MTLArgumentDescriptorClass = interface(NSObjectClass)
    ['{B1C66299-ABC1-4AF7-A6CD-E97B92BE40D3}']
    { class } function argumentDescriptor: MTLArgumentDescriptor; cdecl;
  end;

  MTLArgumentDescriptor = interface(NSObject)
    ['{99DE959F-BE0D-4C7A-9CA5-83C0A4A882E7}']
    procedure setDataType(dataType: MTLDataType); cdecl;
    function dataType: MTLDataType; cdecl;
    procedure setIndex(index: NSUInteger); cdecl;
    function index: NSUInteger; cdecl;
    procedure setArrayLength(arrayLength: NSUInteger); cdecl;
    function arrayLength: NSUInteger; cdecl;
    procedure setAccess(access: MTLArgumentAccess); cdecl;
    function access: MTLArgumentAccess; cdecl;
    procedure setTextureType(textureType: MTLTextureType); cdecl;
    function textureType: MTLTextureType; cdecl;
    procedure setConstantBlockAlignment(constantBlockAlignment
      : NSUInteger); cdecl;
    function constantBlockAlignment: NSUInteger; cdecl;
  end;

  TMTLArgumentDescriptor = class(TOCGenericImport<MTLArgumentDescriptorClass,
    MTLArgumentDescriptor>)
  end;

  PMTLArgumentDescriptor = Pointer;

  MTLResourceStatePassSampleBufferAttachmentDescriptorClass = interface
    (NSObjectClass)
    ['{4B7985BF-3017-4C0A-906B-B427A4F9F646}']
  end;

  MTLResourceStatePassSampleBufferAttachmentDescriptor = interface(NSObject)
    ['{A3CEC34E-0DEE-4BFF-B1AB-5DF139978D7B}']
    procedure setSampleBuffer(sampleBuffer: Pointer); cdecl;
    function sampleBuffer: Pointer; cdecl;
    procedure setStartOfEncoderSampleIndex(startOfEncoderSampleIndex
      : NSUInteger); cdecl;
    function startOfEncoderSampleIndex: NSUInteger; cdecl;
    procedure setEndOfEncoderSampleIndex(endOfEncoderSampleIndex
      : NSUInteger); cdecl;
    function endOfEncoderSampleIndex: NSUInteger; cdecl;
  end;

  TMTLResourceStatePassSampleBufferAttachmentDescriptor = class
    (TOCGenericImport<MTLResourceStatePassSampleBufferAttachmentDescriptorClass,
    MTLResourceStatePassSampleBufferAttachmentDescriptor>)
  end;

  PMTLResourceStatePassSampleBufferAttachmentDescriptor = Pointer;

  MTLResourceStatePassSampleBufferAttachmentDescriptorArrayClass = interface
    (NSObjectClass)
    ['{087DAC9A-DA0F-4B38-B318-44066EA35F2E}']
  end;

  MTLResourceStatePassSampleBufferAttachmentDescriptorArray =
    interface(NSObject)
    ['{BA387190-9472-4110-A54F-D00AD05F9AB6}']
    function objectAtIndexedSubscript(attachmentIndex: NSUInteger)
      : MTLResourceStatePassSampleBufferAttachmentDescriptor; cdecl;
    procedure setObject(attachment
      : MTLResourceStatePassSampleBufferAttachmentDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLResourceStatePassSampleBufferAttachmentDescriptorArray = class
    (TOCGenericImport<
    MTLResourceStatePassSampleBufferAttachmentDescriptorArrayClass,
    MTLResourceStatePassSampleBufferAttachmentDescriptorArray>)
  end;

  PMTLResourceStatePassSampleBufferAttachmentDescriptorArray = Pointer;

  MTLResourceStatePassDescriptorClass = interface(NSObjectClass)
    ['{4DFC140D-50FF-407E-9FE6-7819A6A1039C}']
    { class } function resourceStatePassDescriptor
      : MTLResourceStatePassDescriptor; cdecl;
  end;

  MTLResourceStatePassDescriptor = interface(NSObject)
    ['{C8D8785B-16D9-46A9-B6A8-74FE3BD42D8F}']
    function sampleBufferAttachments
      : MTLResourceStatePassSampleBufferAttachmentDescriptorArray; cdecl;
  end;

  TMTLResourceStatePassDescriptor = class
    (TOCGenericImport<MTLResourceStatePassDescriptorClass,
    MTLResourceStatePassDescriptor>)
  end;

  PMTLResourceStatePassDescriptor = Pointer;

  MTLRenderPassAttachmentDescriptorClass = interface(NSObjectClass)
    ['{3603D2E8-3886-4273-B877-DF02991C931A}']
  end;

  MTLRenderPassAttachmentDescriptor = interface(NSObject)
    ['{2ABF2E36-65CA-4308-8507-BB9EF9B63E3A}']
    procedure setTexture(texture: Pointer); cdecl;
    function texture: Pointer; cdecl;
    procedure setLevel(level: NSUInteger); cdecl;
    function level: NSUInteger; cdecl;
    procedure setSlice(slice: NSUInteger); cdecl;
    function slice: NSUInteger; cdecl;
    procedure setDepthPlane(depthPlane: NSUInteger); cdecl;
    function depthPlane: NSUInteger; cdecl;
    procedure setResolveTexture(resolveTexture: Pointer); cdecl;
    function resolveTexture: Pointer; cdecl;
    procedure setResolveLevel(resolveLevel: NSUInteger); cdecl;
    function resolveLevel: NSUInteger; cdecl;
    procedure setResolveSlice(resolveSlice: NSUInteger); cdecl;
    function resolveSlice: NSUInteger; cdecl;
    procedure setResolveDepthPlane(resolveDepthPlane: NSUInteger); cdecl;
    function resolveDepthPlane: NSUInteger; cdecl;
    procedure setLoadAction(loadAction: MTLLoadAction); cdecl;
    function loadAction: MTLLoadAction; cdecl;
    procedure setStoreAction(storeAction: MTLStoreAction); cdecl;
    function storeAction: MTLStoreAction; cdecl;
    procedure setStoreActionOptions(storeActionOptions
      : MTLStoreActionOptions); cdecl;
    function storeActionOptions: MTLStoreActionOptions; cdecl;
  end;

  TMTLRenderPassAttachmentDescriptor = class
    (TOCGenericImport<MTLRenderPassAttachmentDescriptorClass,
    MTLRenderPassAttachmentDescriptor>)
  end;

  PMTLRenderPassAttachmentDescriptor = Pointer;

  MTLRenderPassColorAttachmentDescriptorClass = interface
    (MTLRenderPassAttachmentDescriptorClass)
    ['{F8372547-3D05-40CE-ABC8-4B0E39EE8178}']
  end;

  MTLRenderPassColorAttachmentDescriptor = interface
    (MTLRenderPassAttachmentDescriptor)
    ['{B433D848-BA17-48A4-93BC-DE03938CF9BE}']
    procedure setClearColor(clearColor: MTLClearColor); cdecl;
    function clearColor: MTLClearColor; cdecl;
  end;

  TMTLRenderPassColorAttachmentDescriptor = class
    (TOCGenericImport<MTLRenderPassColorAttachmentDescriptorClass,
    MTLRenderPassColorAttachmentDescriptor>)
  end;

  PMTLRenderPassColorAttachmentDescriptor = Pointer;

  MTLRenderPassDepthAttachmentDescriptorClass = interface
    (MTLRenderPassAttachmentDescriptorClass)
    ['{35E7F423-84D1-47E8-B139-C0107280036B}']
  end;

  MTLRenderPassDepthAttachmentDescriptor = interface
    (MTLRenderPassAttachmentDescriptor)
    ['{141A2938-3C76-4623-A1E6-9A12AEC2A727}']
    procedure setClearDepth(clearDepth: Double); cdecl;
    function clearDepth: Double; cdecl;
    procedure setDepthResolveFilter(depthResolveFilter
      : MTLMultisampleDepthResolveFilter); cdecl;
    function depthResolveFilter: MTLMultisampleDepthResolveFilter; cdecl;
  end;

  TMTLRenderPassDepthAttachmentDescriptor = class
    (TOCGenericImport<MTLRenderPassDepthAttachmentDescriptorClass,
    MTLRenderPassDepthAttachmentDescriptor>)
  end;

  PMTLRenderPassDepthAttachmentDescriptor = Pointer;

  MTLRenderPassStencilAttachmentDescriptorClass = interface
    (MTLRenderPassAttachmentDescriptorClass)
    ['{E7BFAB2E-59BE-45EE-9923-1496A0E979F5}']
  end;

  MTLRenderPassStencilAttachmentDescriptor = interface
    (MTLRenderPassAttachmentDescriptor)
    ['{7A156F71-3F6C-4B97-81DB-34E8DC638E67}']
    procedure setClearStencil(clearStencil: LongWord); cdecl;
    function clearStencil: LongWord; cdecl;
    procedure setStencilResolveFilter(stencilResolveFilter
      : MTLMultisampleStencilResolveFilter); cdecl;
    function stencilResolveFilter: MTLMultisampleStencilResolveFilter; cdecl;
  end;

  TMTLRenderPassStencilAttachmentDescriptor = class
    (TOCGenericImport<MTLRenderPassStencilAttachmentDescriptorClass,
    MTLRenderPassStencilAttachmentDescriptor>)
  end;

  PMTLRenderPassStencilAttachmentDescriptor = Pointer;

  MTLRenderPassColorAttachmentDescriptorArrayClass = interface(NSObjectClass)
    ['{302D3EF5-F69B-4127-B218-628FDC14DBDC}']
  end;

  MTLRenderPassColorAttachmentDescriptorArray = interface(NSObject)
    ['{76530A57-D52B-4011-9EB7-92179F0DF4A5}']
    function objectAtIndexedSubscript(attachmentIndex: NSUInteger)
      : MTLRenderPassColorAttachmentDescriptor; cdecl;
    procedure setObject(attachment: MTLRenderPassColorAttachmentDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLRenderPassColorAttachmentDescriptorArray = class
    (TOCGenericImport<MTLRenderPassColorAttachmentDescriptorArrayClass,
    MTLRenderPassColorAttachmentDescriptorArray>)
  end;

  PMTLRenderPassColorAttachmentDescriptorArray = Pointer;

  MTLRenderPassSampleBufferAttachmentDescriptorClass = interface(NSObjectClass)
    ['{A366E037-CFD9-402E-988F-39D7E60BB246}']
  end;

  MTLRenderPassSampleBufferAttachmentDescriptor = interface(NSObject)
    ['{FF5D3D0E-0B06-452A-BF3A-F61C9C422EA1}']
    procedure setSampleBuffer(sampleBuffer: Pointer); cdecl;
    function sampleBuffer: Pointer; cdecl;
    procedure setStartOfVertexSampleIndex(startOfVertexSampleIndex
      : NSUInteger); cdecl;
    function startOfVertexSampleIndex: NSUInteger; cdecl;
    procedure setEndOfVertexSampleIndex(endOfVertexSampleIndex
      : NSUInteger); cdecl;
    function endOfVertexSampleIndex: NSUInteger; cdecl;
    procedure setStartOfFragmentSampleIndex(startOfFragmentSampleIndex
      : NSUInteger); cdecl;
    function startOfFragmentSampleIndex: NSUInteger; cdecl;
    procedure setEndOfFragmentSampleIndex(endOfFragmentSampleIndex
      : NSUInteger); cdecl;
    function endOfFragmentSampleIndex: NSUInteger; cdecl;
  end;

  TMTLRenderPassSampleBufferAttachmentDescriptor = class
    (TOCGenericImport<MTLRenderPassSampleBufferAttachmentDescriptorClass,
    MTLRenderPassSampleBufferAttachmentDescriptor>)
  end;

  PMTLRenderPassSampleBufferAttachmentDescriptor = Pointer;

  MTLRenderPassSampleBufferAttachmentDescriptorArrayClass = interface
    (NSObjectClass)
    ['{6CAE9469-445E-429E-A325-1DAE12762737}']
  end;

  MTLRenderPassSampleBufferAttachmentDescriptorArray = interface(NSObject)
    ['{B90C017C-EEA4-48BC-9883-C0F073B65DBA}']
    function objectAtIndexedSubscript(attachmentIndex: NSUInteger)
      : MTLRenderPassSampleBufferAttachmentDescriptor; cdecl;
    procedure setObject(attachment
      : MTLRenderPassSampleBufferAttachmentDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLRenderPassSampleBufferAttachmentDescriptorArray = class
    (TOCGenericImport<MTLRenderPassSampleBufferAttachmentDescriptorArrayClass,
    MTLRenderPassSampleBufferAttachmentDescriptorArray>)
  end;

  PMTLRenderPassSampleBufferAttachmentDescriptorArray = Pointer;

  MTLBlitPassSampleBufferAttachmentDescriptorClass = interface(NSObjectClass)
    ['{EFBEB893-6B3C-41F2-8A77-7AE278852595}']
  end;

  MTLBlitPassSampleBufferAttachmentDescriptor = interface(NSObject)
    ['{3442990D-B525-4EAF-AFE7-D4688C187942}']
    procedure setSampleBuffer(sampleBuffer: Pointer); cdecl;
    function sampleBuffer: Pointer; cdecl;
    procedure setStartOfEncoderSampleIndex(startOfEncoderSampleIndex
      : NSUInteger); cdecl;
    function startOfEncoderSampleIndex: NSUInteger; cdecl;
    procedure setEndOfEncoderSampleIndex(endOfEncoderSampleIndex
      : NSUInteger); cdecl;
    function endOfEncoderSampleIndex: NSUInteger; cdecl;
  end;

  TMTLBlitPassSampleBufferAttachmentDescriptor = class
    (TOCGenericImport<MTLBlitPassSampleBufferAttachmentDescriptorClass,
    MTLBlitPassSampleBufferAttachmentDescriptor>)
  end;

  PMTLBlitPassSampleBufferAttachmentDescriptor = Pointer;

  MTLBlitPassSampleBufferAttachmentDescriptorArrayClass = interface
    (NSObjectClass)
    ['{B4D76BE3-DD7D-446F-9B83-C7F47282A3C0}']
  end;

  MTLBlitPassSampleBufferAttachmentDescriptorArray = interface(NSObject)
    ['{A79BBC8B-8EC2-4D4F-9BB7-E04069D60FE4}']
    function objectAtIndexedSubscript(attachmentIndex: NSUInteger)
      : MTLBlitPassSampleBufferAttachmentDescriptor; cdecl;
    procedure setObject(attachment: MTLBlitPassSampleBufferAttachmentDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLBlitPassSampleBufferAttachmentDescriptorArray = class
    (TOCGenericImport<MTLBlitPassSampleBufferAttachmentDescriptorArrayClass,
    MTLBlitPassSampleBufferAttachmentDescriptorArray>)
  end;

  PMTLBlitPassSampleBufferAttachmentDescriptorArray = Pointer;

  MTLAccelerationStructurePassDescriptorClass = interface(NSObjectClass)
    ['{2FAFDF40-882F-40C7-8AF8-13A328D331C4}']
    { class } function accelerationStructurePassDescriptor
      : MTLAccelerationStructurePassDescriptor; cdecl;
  end;

  MTLAccelerationStructurePassDescriptor = interface(NSObject)
    ['{A4971F8F-ACBF-4E2F-A1F4-7B5FA628E665}']
    function sampleBufferAttachments
      : MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray;
      cdecl;
  end;

  TMTLAccelerationStructurePassDescriptor = class
    (TOCGenericImport<MTLAccelerationStructurePassDescriptorClass,
    MTLAccelerationStructurePassDescriptor>)
  end;

  PMTLAccelerationStructurePassDescriptor = Pointer;

  MTLCommandBufferDescriptorClass = interface(NSObjectClass)
    ['{D117127B-EE7F-47DB-9200-092EBB954D22}']
  end;

  MTLCommandBufferDescriptor = interface(NSObject)
    ['{38279A03-C244-46C9-B3BF-B90F88781A56}']
    procedure setRetainedReferences(retainedReferences: Boolean); cdecl;
    function retainedReferences: Boolean; cdecl;
    procedure setErrorOptions(errorOptions: MTLCommandBufferErrorOption); cdecl;
    function errorOptions: MTLCommandBufferErrorOption; cdecl;
  end;

  TMTLCommandBufferDescriptor = class
    (TOCGenericImport<MTLCommandBufferDescriptorClass,
    MTLCommandBufferDescriptor>)
  end;

  PMTLCommandBufferDescriptor = Pointer;

  MTLComputePassSampleBufferAttachmentDescriptorClass = interface(NSObjectClass)
    ['{85DC1EC3-E4B8-49F7-B473-A955841ABE73}']
  end;

  MTLComputePassSampleBufferAttachmentDescriptor = interface(NSObject)
    ['{F178B167-DF92-4253-8BD8-B9F5CB34A787}']
    procedure setSampleBuffer(sampleBuffer: Pointer); cdecl;
    function sampleBuffer: Pointer; cdecl;
    procedure setStartOfEncoderSampleIndex(startOfEncoderSampleIndex
      : NSUInteger); cdecl;
    function startOfEncoderSampleIndex: NSUInteger; cdecl;
    procedure setEndOfEncoderSampleIndex(endOfEncoderSampleIndex
      : NSUInteger); cdecl;
    function endOfEncoderSampleIndex: NSUInteger; cdecl;
  end;

  TMTLComputePassSampleBufferAttachmentDescriptor = class
    (TOCGenericImport<MTLComputePassSampleBufferAttachmentDescriptorClass,
    MTLComputePassSampleBufferAttachmentDescriptor>)
  end;

  PMTLComputePassSampleBufferAttachmentDescriptor = Pointer;

  MTLComputePassSampleBufferAttachmentDescriptorArrayClass = interface
    (NSObjectClass)
    ['{E0108F7B-BCA4-457D-86EC-3E0967608597}']
  end;

  MTLComputePassSampleBufferAttachmentDescriptorArray = interface(NSObject)
    ['{8EA7A076-CEAC-485F-84DC-A52B271B5822}']
    function objectAtIndexedSubscript(attachmentIndex: NSUInteger)
      : MTLComputePassSampleBufferAttachmentDescriptor; cdecl;
    procedure setObject(attachment
      : MTLComputePassSampleBufferAttachmentDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLComputePassSampleBufferAttachmentDescriptorArray = class
    (TOCGenericImport<MTLComputePassSampleBufferAttachmentDescriptorArrayClass,
    MTLComputePassSampleBufferAttachmentDescriptorArray>)
  end;

  PMTLComputePassSampleBufferAttachmentDescriptorArray = Pointer;

  MTLStencilDescriptorClass = interface(NSObjectClass)
    ['{18614CD5-6DCE-41C7-90F7-2191ABB84D36}']
  end;

  MTLStencilDescriptor = interface(NSObject)
    ['{8EF1EE57-3C04-4B61-8D88-B79960D389A5}']
    procedure setStencilCompareFunction(stencilCompareFunction
      : MTLCompareFunction); cdecl;
    function stencilCompareFunction: MTLCompareFunction; cdecl;
    procedure setStencilFailureOperation(stencilFailureOperation
      : MTLStencilOperation); cdecl;
    function stencilFailureOperation: MTLStencilOperation; cdecl;
    procedure setDepthFailureOperation(depthFailureOperation
      : MTLStencilOperation); cdecl;
    function depthFailureOperation: MTLStencilOperation; cdecl;
    procedure setDepthStencilPassOperation(depthStencilPassOperation
      : MTLStencilOperation); cdecl;
    function depthStencilPassOperation: MTLStencilOperation; cdecl;
    procedure setReadMask(readMask: LongWord); cdecl;
    function readMask: LongWord; cdecl;
    procedure setWriteMask(writeMask: LongWord); cdecl;
    function writeMask: LongWord; cdecl;
  end;

  TMTLStencilDescriptor = class(TOCGenericImport<MTLStencilDescriptorClass,
    MTLStencilDescriptor>)
  end;

  PMTLStencilDescriptor = Pointer;

  MTLBufferLayoutDescriptorClass = interface(NSObjectClass)
    ['{42C6765B-CE66-4613-9F27-273357524BB1}']
  end;

  MTLBufferLayoutDescriptor = interface(NSObject)
    ['{B5B07D66-225F-418A-A269-954665CE900D}']
    procedure setStride(stride: NSUInteger); cdecl;
    function stride: NSUInteger; cdecl;
    procedure setStepFunction(stepFunction: MTLStepFunction); cdecl;
    function stepFunction: MTLStepFunction; cdecl;
    procedure setStepRate(stepRate: NSUInteger); cdecl;
    function stepRate: NSUInteger; cdecl;
  end;

  TMTLBufferLayoutDescriptor = class
    (TOCGenericImport<MTLBufferLayoutDescriptorClass,
    MTLBufferLayoutDescriptor>)
  end;

  PMTLBufferLayoutDescriptor = Pointer;

  MTLBufferLayoutDescriptorArrayClass = interface(NSObjectClass)
    ['{942BB599-6BD7-4301-9FF6-BAD2F8528852}']
  end;

  MTLBufferLayoutDescriptorArray = interface(NSObject)
    ['{6049E9CC-F3B2-4967-A98A-A86F99913F25}']
    function objectAtIndexedSubscript(index: NSUInteger)
      : MTLBufferLayoutDescriptor; cdecl;
    procedure setObject(bufferDesc: MTLBufferLayoutDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLBufferLayoutDescriptorArray = class
    (TOCGenericImport<MTLBufferLayoutDescriptorArrayClass,
    MTLBufferLayoutDescriptorArray>)
  end;

  PMTLBufferLayoutDescriptorArray = Pointer;

  MTLAttributeDescriptorClass = interface(NSObjectClass)
    ['{F39D8BA1-827A-46EB-8C07-D1F654FB7D2A}']
  end;

  MTLAttributeDescriptor = interface(NSObject)
    ['{C0C1A261-3CDA-4689-9240-CE030D053E5B}']
    procedure setFormat(format: MTLAttributeFormat); cdecl;
    function format: MTLAttributeFormat; cdecl;
    procedure setOffset(offset: NSUInteger); cdecl;
    function offset: NSUInteger; cdecl;
    procedure setBufferIndex(bufferIndex: NSUInteger); cdecl;
    function bufferIndex: NSUInteger; cdecl;
  end;

  TMTLAttributeDescriptor = class(TOCGenericImport<MTLAttributeDescriptorClass,
    MTLAttributeDescriptor>)
  end;

  PMTLAttributeDescriptor = Pointer;

  MTLAttributeDescriptorArrayClass = interface(NSObjectClass)
    ['{B77AFC8F-0E4D-48AD-B586-91F4E6E35F16}']
  end;

  MTLAttributeDescriptorArray = interface(NSObject)
    ['{E28DE4AA-0D60-46C2-9BFD-14715FB9B752}']
    function objectAtIndexedSubscript(index: NSUInteger)
      : MTLAttributeDescriptor; cdecl;
    procedure setObject(attributeDesc: MTLAttributeDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLAttributeDescriptorArray = class
    (TOCGenericImport<MTLAttributeDescriptorArrayClass,
    MTLAttributeDescriptorArray>)
  end;

  PMTLAttributeDescriptorArray = Pointer;

  MTLStageInputOutputDescriptorClass = interface(NSObjectClass)
    ['{336634EE-4E30-4DD0-A0A0-CDB287BCC9EA}']
    { class } function stageInputOutputDescriptor
      : MTLStageInputOutputDescriptor; cdecl;
  end;

  MTLStageInputOutputDescriptor = interface(NSObject)
    ['{120ACFFC-8FFD-4427-B504-2FBB611B3C3D}']
    function layouts: MTLBufferLayoutDescriptorArray; cdecl;
    function attributes: MTLAttributeDescriptorArray; cdecl;
    procedure setIndexType(indexType: MTLIndexType); cdecl;
    function indexType: MTLIndexType; cdecl;
    procedure setIndexBufferIndex(indexBufferIndex: NSUInteger); cdecl;
    function indexBufferIndex: NSUInteger; cdecl;
    procedure reset; cdecl;
  end;

  TMTLStageInputOutputDescriptor = class
    (TOCGenericImport<MTLStageInputOutputDescriptorClass,
    MTLStageInputOutputDescriptor>)
  end;

  PMTLStageInputOutputDescriptor = Pointer;

  MTLPipelineBufferDescriptorClass = interface(NSObjectClass)
    ['{6B8F7682-5A1C-4899-AA0C-399F44133854}']
  end;

  MTLPipelineBufferDescriptor = interface(NSObject)
    ['{EE4BA48C-60C2-489E-8648-EB01869434B8}']
    procedure setMutability(mutability: MTLMutability); cdecl;
    function mutability: MTLMutability; cdecl;
  end;

  TMTLPipelineBufferDescriptor = class
    (TOCGenericImport<MTLPipelineBufferDescriptorClass,
    MTLPipelineBufferDescriptor>)
  end;

  PMTLPipelineBufferDescriptor = Pointer;

  MTLPipelineBufferDescriptorArrayClass = interface(NSObjectClass)
    ['{9046513C-29B4-4E94-ABDB-947A72D12995}']
  end;

  MTLPipelineBufferDescriptorArray = interface(NSObject)
    ['{11859824-EBA9-49BF-A635-E98781A67AB9}']
    function objectAtIndexedSubscript(bufferIndex: NSUInteger)
      : MTLPipelineBufferDescriptor; cdecl;
    procedure setObject(buffer: MTLPipelineBufferDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLPipelineBufferDescriptorArray = class
    (TOCGenericImport<MTLPipelineBufferDescriptorArrayClass,
    MTLPipelineBufferDescriptorArray>)
  end;

  PMTLPipelineBufferDescriptorArray = Pointer;

  MTLLinkedFunctionsClass = interface(NSObjectClass)
    ['{807AAB3F-01DE-4633-9C2F-8799810985BF}']
    { class } function linkedFunctions: MTLLinkedFunctions; cdecl;
  end;

  MTLLinkedFunctions = interface(NSObject)
    ['{D4B1C813-3A68-4A71-B1BC-87EAEFB84FA6}']
    procedure setFunctions(functions: NSArray); cdecl;
    function functions: NSArray; cdecl;
    procedure setBinaryFunctions(binaryFunctions: NSArray); cdecl;
    function binaryFunctions: NSArray; cdecl;
    procedure setGroups(groups: NSDictionary); cdecl;
    function groups: NSDictionary; cdecl;
    procedure setPrivateFunctions(privateFunctions: NSArray); cdecl;
    function privateFunctions: NSArray; cdecl;
  end;

  TMTLLinkedFunctions = class(TOCGenericImport<MTLLinkedFunctionsClass,
    MTLLinkedFunctions>)
  end;

  PMTLLinkedFunctions = Pointer;

  MTLVertexDescriptorClass = interface(NSObjectClass)
    ['{DAB17F6B-42FB-462F-9798-D0EF8204A37E}']
    { class } function vertexDescriptor: MTLVertexDescriptor; cdecl;
  end;

  MTLVertexDescriptor = interface(NSObject)
    ['{CFFBDE29-8DDC-43E8-AFD4-C6C3FBCE733F}']
    function layouts: MTLVertexBufferLayoutDescriptorArray; cdecl;
    function attributes: MTLVertexAttributeDescriptorArray; cdecl;
    procedure reset; cdecl;
  end;

  TMTLVertexDescriptor = class(TOCGenericImport<MTLVertexDescriptorClass,
    MTLVertexDescriptor>)
  end;

  PMTLVertexDescriptor = Pointer;

  MTLRenderPipelineColorAttachmentDescriptorArrayClass = interface
    (NSObjectClass)
    ['{F11E713E-0892-4D4A-B09F-A30194D90FEA}']
  end;

  MTLRenderPipelineColorAttachmentDescriptorArray = interface(NSObject)
    ['{2A8542E2-DBFD-4CAD-B5C2-E0063EAD090D}']
    function objectAtIndexedSubscript(attachmentIndex: NSUInteger)
      : MTLRenderPipelineColorAttachmentDescriptor; cdecl;
    procedure setObject(attachment: MTLRenderPipelineColorAttachmentDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLRenderPipelineColorAttachmentDescriptorArray = class
    (TOCGenericImport<MTLRenderPipelineColorAttachmentDescriptorArrayClass,
    MTLRenderPipelineColorAttachmentDescriptorArray>)
  end;

  PMTLRenderPipelineColorAttachmentDescriptorArray = Pointer;

  MTLRenderPipelineFunctionsDescriptorClass = interface(NSObjectClass)
    ['{B3B0A6A0-1CB8-4C87-A701-622632F3C50A}']
  end;

  MTLRenderPipelineFunctionsDescriptor = interface(NSObject)
    ['{2C98CFF6-BBA1-41FC-9DA1-F98A578A37D9}']
    procedure setVertexAdditionalBinaryFunctions(vertexAdditionalBinaryFunctions
      : NSArray); cdecl;
    function vertexAdditionalBinaryFunctions: NSArray; cdecl;
    procedure setFragmentAdditionalBinaryFunctions
      (fragmentAdditionalBinaryFunctions: NSArray); cdecl;
    function fragmentAdditionalBinaryFunctions: NSArray; cdecl;
    procedure setTileAdditionalBinaryFunctions(tileAdditionalBinaryFunctions
      : NSArray); cdecl;
    function tileAdditionalBinaryFunctions: NSArray; cdecl;
  end;

  TMTLRenderPipelineFunctionsDescriptor = class
    (TOCGenericImport<MTLRenderPipelineFunctionsDescriptorClass,
    MTLRenderPipelineFunctionsDescriptor>)
  end;

  PMTLRenderPipelineFunctionsDescriptor = Pointer;

  MTLTileRenderPipelineColorAttachmentDescriptorClass = interface(NSObjectClass)
    ['{7954582E-832F-4058-B140-30322134EE3A}']
  end;

  MTLTileRenderPipelineColorAttachmentDescriptor = interface(NSObject)
    ['{D49D5AA5-47EA-4C20-BE43-EEF85687E196}']
    procedure setPixelFormat(pixelFormat: MTLPixelFormat); cdecl;
    function pixelFormat: MTLPixelFormat; cdecl;
  end;

  TMTLTileRenderPipelineColorAttachmentDescriptor = class
    (TOCGenericImport<MTLTileRenderPipelineColorAttachmentDescriptorClass,
    MTLTileRenderPipelineColorAttachmentDescriptor>)
  end;

  PMTLTileRenderPipelineColorAttachmentDescriptor = Pointer;

  MTLTileRenderPipelineColorAttachmentDescriptorArrayClass = interface
    (NSObjectClass)
    ['{FBE03B6E-0CD2-41B1-8230-68F411C728E1}']
  end;

  MTLTileRenderPipelineColorAttachmentDescriptorArray = interface(NSObject)
    ['{52A5B7C9-0BD1-42A9-ACA4-06F4E700FA2E}']
    function objectAtIndexedSubscript(attachmentIndex: NSUInteger)
      : MTLTileRenderPipelineColorAttachmentDescriptor; cdecl;
    procedure setObject(attachment
      : MTLTileRenderPipelineColorAttachmentDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLTileRenderPipelineColorAttachmentDescriptorArray = class
    (TOCGenericImport<MTLTileRenderPipelineColorAttachmentDescriptorArrayClass,
    MTLTileRenderPipelineColorAttachmentDescriptorArray>)
  end;

  PMTLTileRenderPipelineColorAttachmentDescriptorArray = Pointer;

  MTLVertexBufferLayoutDescriptorClass = interface(NSObjectClass)
    ['{6D7BC481-C7FB-4D1A-AA57-73622ED0673A}']
  end;

  MTLVertexBufferLayoutDescriptor = interface(NSObject)
    ['{7EF27ADF-B371-4E8E-8412-7ACBC4EC4BAE}']
    procedure setStride(stride: NSUInteger); cdecl;
    function stride: NSUInteger; cdecl;
    procedure setStepFunction(stepFunction: MTLVertexStepFunction); cdecl;
    function stepFunction: MTLVertexStepFunction; cdecl;
    procedure setStepRate(stepRate: NSUInteger); cdecl;
    function stepRate: NSUInteger; cdecl;
  end;

  TMTLVertexBufferLayoutDescriptor = class
    (TOCGenericImport<MTLVertexBufferLayoutDescriptorClass,
    MTLVertexBufferLayoutDescriptor>)
  end;

  PMTLVertexBufferLayoutDescriptor = Pointer;

  MTLVertexBufferLayoutDescriptorArrayClass = interface(NSObjectClass)
    ['{182DD376-0F4E-447D-BE5D-7F990D9C1D57}']
  end;

  MTLVertexBufferLayoutDescriptorArray = interface(NSObject)
    ['{7F61D859-77DB-4736-9B9E-75A302698F01}']
    function objectAtIndexedSubscript(index: NSUInteger)
      : MTLVertexBufferLayoutDescriptor; cdecl;
    procedure setObject(bufferDesc: MTLVertexBufferLayoutDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLVertexBufferLayoutDescriptorArray = class
    (TOCGenericImport<MTLVertexBufferLayoutDescriptorArrayClass,
    MTLVertexBufferLayoutDescriptorArray>)
  end;

  PMTLVertexBufferLayoutDescriptorArray = Pointer;

  MTLVertexAttributeDescriptorClass = interface(NSObjectClass)
    ['{8ECA5F67-71BE-4A92-95A1-408A70D9D077}']
  end;

  MTLVertexAttributeDescriptor = interface(NSObject)
    ['{F42CC27F-0111-4BF8-89D9-EDE1DAFBAAF5}']
    procedure setFormat(format: MTLVertexFormat); cdecl;
    function format: MTLVertexFormat; cdecl;
    procedure setOffset(offset: NSUInteger); cdecl;
    function offset: NSUInteger; cdecl;
    procedure setBufferIndex(bufferIndex: NSUInteger); cdecl;
    function bufferIndex: NSUInteger; cdecl;
  end;

  TMTLVertexAttributeDescriptor = class
    (TOCGenericImport<MTLVertexAttributeDescriptorClass,
    MTLVertexAttributeDescriptor>)
  end;

  PMTLVertexAttributeDescriptor = Pointer;

  MTLVertexAttributeDescriptorArrayClass = interface(NSObjectClass)
    ['{F18B7940-B977-4F21-9F2B-E304C4114478}']
  end;

  MTLVertexAttributeDescriptorArray = interface(NSObject)
    ['{16301310-F3E2-4E35-A382-4E91EBFB5EBC}']
    function objectAtIndexedSubscript(index: NSUInteger)
      : MTLVertexAttributeDescriptor; cdecl;
    procedure setObject(attributeDesc: MTLVertexAttributeDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLVertexAttributeDescriptorArray = class
    (TOCGenericImport<MTLVertexAttributeDescriptorArrayClass,
    MTLVertexAttributeDescriptorArray>)
  end;

  PMTLVertexAttributeDescriptorArray = Pointer;

  MTLAccelerationStructureGeometryDescriptorClass = interface(NSObjectClass)
    ['{83EB962D-76AA-4F03-ADC7-396F8B4A03AC}']
  end;

  MTLAccelerationStructureGeometryDescriptor = interface(NSObject)
    ['{05C90E11-EB70-45D5-ADAC-906628B0D187}']
    procedure setIntersectionFunctionTableOffset(intersectionFunctionTableOffset
      : NSUInteger); cdecl;
    function intersectionFunctionTableOffset: NSUInteger; cdecl;
    procedure setOpaque(opaque: Boolean); cdecl;
    function opaque: Boolean; cdecl;
    procedure setAllowDuplicateIntersectionFunctionInvocation
      (allowDuplicateIntersectionFunctionInvocation: Boolean); cdecl;
    function allowDuplicateIntersectionFunctionInvocation: Boolean; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    procedure setPrimitiveDataBuffer(primitiveDataBuffer: Pointer); cdecl;
    function primitiveDataBuffer: Pointer; cdecl;
    procedure setPrimitiveDataBufferOffset(primitiveDataBufferOffset
      : NSUInteger); cdecl;
    function primitiveDataBufferOffset: NSUInteger; cdecl;
    procedure setPrimitiveDataStride(primitiveDataStride: NSUInteger); cdecl;
    function primitiveDataStride: NSUInteger; cdecl;
    procedure setPrimitiveDataElementSize(primitiveDataElementSize
      : NSUInteger); cdecl;
    function primitiveDataElementSize: NSUInteger; cdecl;
  end;

  TMTLAccelerationStructureGeometryDescriptor = class
    (TOCGenericImport<MTLAccelerationStructureGeometryDescriptorClass,
    MTLAccelerationStructureGeometryDescriptor>)
  end;

  PMTLAccelerationStructureGeometryDescriptor = Pointer;

  MTLPrimitiveAccelerationStructureDescriptorClass = interface
    (MTLAccelerationStructureDescriptorClass)
    ['{ACA87B08-0FFB-4468-ADF3-D31E07804118}']
    { class } function descriptor: Pointer { instancetype }; cdecl;
  end;

  MTLPrimitiveAccelerationStructureDescriptor = interface
    (MTLAccelerationStructureDescriptor)
    ['{400D0861-8CB8-4761-AEBD-2DA4BDB76DCB}']
    procedure setGeometryDescriptors(geometryDescriptors: NSArray); cdecl;
    function geometryDescriptors: NSArray; cdecl;
    procedure setMotionStartBorderMode(motionStartBorderMode
      : MTLMotionBorderMode); cdecl;
    function motionStartBorderMode: MTLMotionBorderMode; cdecl;
    procedure setMotionEndBorderMode(motionEndBorderMode
      : MTLMotionBorderMode); cdecl;
    function motionEndBorderMode: MTLMotionBorderMode; cdecl;
    procedure setMotionStartTime(motionStartTime: Single); cdecl;
    function motionStartTime: Single; cdecl;
    procedure setMotionEndTime(motionEndTime: Single); cdecl;
    function motionEndTime: Single; cdecl;
    procedure setMotionKeyframeCount(motionKeyframeCount: NSUInteger); cdecl;
    function motionKeyframeCount: NSUInteger; cdecl;
  end;

  TMTLPrimitiveAccelerationStructureDescriptor = class
    (TOCGenericImport<MTLPrimitiveAccelerationStructureDescriptorClass,
    MTLPrimitiveAccelerationStructureDescriptor>)
  end;

  PMTLPrimitiveAccelerationStructureDescriptor = Pointer;

  MTLAccelerationStructureTriangleGeometryDescriptorClass = interface
    (MTLAccelerationStructureGeometryDescriptorClass)
    ['{B6FD38FB-E697-4BCB-87B1-F627C9B89865}']
    { class } function descriptor: Pointer { instancetype }; cdecl;
  end;

  MTLAccelerationStructureTriangleGeometryDescriptor = interface
    (MTLAccelerationStructureGeometryDescriptor)
    ['{BBC0D9C3-D640-4DFF-A134-9FDEC241151B}']
    procedure setVertexBuffer(vertexBuffer: Pointer); cdecl;
    function vertexBuffer: Pointer; cdecl;
    procedure setVertexBufferOffset(vertexBufferOffset: NSUInteger); cdecl;
    function vertexBufferOffset: NSUInteger; cdecl;
    procedure setVertexFormat(vertexFormat: MTLAttributeFormat); cdecl;
    function vertexFormat: MTLAttributeFormat; cdecl;
    procedure setVertexStride(vertexStride: NSUInteger); cdecl;
    function vertexStride: NSUInteger; cdecl;
    procedure setIndexBuffer(indexBuffer: Pointer); cdecl;
    function indexBuffer: Pointer; cdecl;
    procedure setIndexBufferOffset(indexBufferOffset: NSUInteger); cdecl;
    function indexBufferOffset: NSUInteger; cdecl;
    procedure setIndexType(indexType: MTLIndexType); cdecl;
    function indexType: MTLIndexType; cdecl;
    procedure setTriangleCount(triangleCount: NSUInteger); cdecl;
    function triangleCount: NSUInteger; cdecl;
    procedure setTransformationMatrixBuffer(transformationMatrixBuffer
      : Pointer); cdecl;
    function transformationMatrixBuffer: Pointer; cdecl;
    procedure setTransformationMatrixBufferOffset
      (transformationMatrixBufferOffset: NSUInteger); cdecl;
    function transformationMatrixBufferOffset: NSUInteger; cdecl;
  end;

  TMTLAccelerationStructureTriangleGeometryDescriptor = class
    (TOCGenericImport<MTLAccelerationStructureTriangleGeometryDescriptorClass,
    MTLAccelerationStructureTriangleGeometryDescriptor>)
  end;

  PMTLAccelerationStructureTriangleGeometryDescriptor = Pointer;

  MTLAccelerationStructureBoundingBoxGeometryDescriptorClass = interface
    (MTLAccelerationStructureGeometryDescriptorClass)
    ['{F49E55E2-F930-464C-9375-3E64A97A31DC}']
    { class } function descriptor: Pointer { instancetype }; cdecl;
  end;

  MTLAccelerationStructureBoundingBoxGeometryDescriptor = interface
    (MTLAccelerationStructureGeometryDescriptor)
    ['{4C788540-BFB2-4AFE-B57E-442A169F5E1A}']
    procedure setBoundingBoxBuffer(boundingBoxBuffer: Pointer); cdecl;
    function boundingBoxBuffer: Pointer; cdecl;
    procedure setBoundingBoxBufferOffset(boundingBoxBufferOffset
      : NSUInteger); cdecl;
    function boundingBoxBufferOffset: NSUInteger; cdecl;
    procedure setBoundingBoxStride(boundingBoxStride: NSUInteger); cdecl;
    function boundingBoxStride: NSUInteger; cdecl;
    procedure setBoundingBoxCount(boundingBoxCount: NSUInteger); cdecl;
    function boundingBoxCount: NSUInteger; cdecl;
  end;

  TMTLAccelerationStructureBoundingBoxGeometryDescriptor = class
    (TOCGenericImport<
    MTLAccelerationStructureBoundingBoxGeometryDescriptorClass,
    MTLAccelerationStructureBoundingBoxGeometryDescriptor>)
  end;

  PMTLAccelerationStructureBoundingBoxGeometryDescriptor = Pointer;

  MTLMotionKeyframeDataClass = interface(NSObjectClass)
    ['{CFF4B1B0-24D8-42DB-A6FC-93D5F95C20A7}']
    { class } function data: Pointer { instancetype }; cdecl;
  end;

  MTLMotionKeyframeData = interface(NSObject)
    ['{8F0B73A4-A3F2-457A-B421-F4A3EA526681}']
    procedure setBuffer(buffer: Pointer); cdecl;
    function buffer: Pointer; cdecl;
    procedure setOffset(offset: NSUInteger); cdecl;
    function offset: NSUInteger; cdecl;
  end;

  TMTLMotionKeyframeData = class(TOCGenericImport<MTLMotionKeyframeDataClass,
    MTLMotionKeyframeData>)
  end;

  PMTLMotionKeyframeData = Pointer;

  MTLAccelerationStructureMotionTriangleGeometryDescriptorClass = interface
    (MTLAccelerationStructureGeometryDescriptorClass)
    ['{A4F98980-A607-425B-80D7-F1C99474462A}']
    { class } function descriptor: Pointer { instancetype }; cdecl;
  end;

  MTLAccelerationStructureMotionTriangleGeometryDescriptor = interface
    (MTLAccelerationStructureGeometryDescriptor)
    ['{19F8509F-BFDF-47EF-A492-99A8F2690006}']
    procedure setVertexBuffers(vertexBuffers: NSArray); cdecl;
    function vertexBuffers: NSArray; cdecl;
    procedure setVertexFormat(vertexFormat: MTLAttributeFormat); cdecl;
    function vertexFormat: MTLAttributeFormat; cdecl;
    procedure setVertexStride(vertexStride: NSUInteger); cdecl;
    function vertexStride: NSUInteger; cdecl;
    procedure setIndexBuffer(indexBuffer: Pointer); cdecl;
    function indexBuffer: Pointer; cdecl;
    procedure setIndexBufferOffset(indexBufferOffset: NSUInteger); cdecl;
    function indexBufferOffset: NSUInteger; cdecl;
    procedure setIndexType(indexType: MTLIndexType); cdecl;
    function indexType: MTLIndexType; cdecl;
    procedure setTriangleCount(triangleCount: NSUInteger); cdecl;
    function triangleCount: NSUInteger; cdecl;
    procedure setTransformationMatrixBuffer(transformationMatrixBuffer
      : Pointer); cdecl;
    function transformationMatrixBuffer: Pointer; cdecl;
    procedure setTransformationMatrixBufferOffset
      (transformationMatrixBufferOffset: NSUInteger); cdecl;
    function transformationMatrixBufferOffset: NSUInteger; cdecl;
  end;

  TMTLAccelerationStructureMotionTriangleGeometryDescriptor = class
    (TOCGenericImport<
    MTLAccelerationStructureMotionTriangleGeometryDescriptorClass,
    MTLAccelerationStructureMotionTriangleGeometryDescriptor>)
  end;

  PMTLAccelerationStructureMotionTriangleGeometryDescriptor = Pointer;

  MTLAccelerationStructureMotionBoundingBoxGeometryDescriptorClass = interface
    (MTLAccelerationStructureGeometryDescriptorClass)
    ['{9EF4A662-2173-4DBE-BC2B-D6A5F1590129}']
    { class } function descriptor: Pointer { instancetype }; cdecl;
  end;

  MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor = interface
    (MTLAccelerationStructureGeometryDescriptor)
    ['{A803DFCE-8A44-4777-8E88-58D3530CBA0F}']
    procedure setBoundingBoxBuffers(boundingBoxBuffers: NSArray); cdecl;
    function boundingBoxBuffers: NSArray; cdecl;
    procedure setBoundingBoxStride(boundingBoxStride: NSUInteger); cdecl;
    function boundingBoxStride: NSUInteger; cdecl;
    procedure setBoundingBoxCount(boundingBoxCount: NSUInteger); cdecl;
    function boundingBoxCount: NSUInteger; cdecl;
  end;

  TMTLAccelerationStructureMotionBoundingBoxGeometryDescriptor = class
    (TOCGenericImport<
    MTLAccelerationStructureMotionBoundingBoxGeometryDescriptorClass,
    MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor>)
  end;

  PMTLAccelerationStructureMotionBoundingBoxGeometryDescriptor = Pointer;

  MTLInstanceAccelerationStructureDescriptorClass = interface
    (MTLAccelerationStructureDescriptorClass)
    ['{89D8EE6D-065F-44AE-97B9-31233DF523DC}']
    { class } function descriptor: Pointer { instancetype }; cdecl;
  end;

  MTLInstanceAccelerationStructureDescriptor = interface
    (MTLAccelerationStructureDescriptor)
    ['{E47AC46C-83BF-4852-8775-165136C71066}']
    procedure setInstanceDescriptorBuffer(instanceDescriptorBuffer
      : Pointer); cdecl;
    function instanceDescriptorBuffer: Pointer; cdecl;
    procedure setInstanceDescriptorBufferOffset(instanceDescriptorBufferOffset
      : NSUInteger); cdecl;
    function instanceDescriptorBufferOffset: NSUInteger; cdecl;
    procedure setInstanceDescriptorStride(instanceDescriptorStride
      : NSUInteger); cdecl;
    function instanceDescriptorStride: NSUInteger; cdecl;
    procedure setInstanceCount(instanceCount: NSUInteger); cdecl;
    function instanceCount: NSUInteger; cdecl;
    procedure setInstancedAccelerationStructures(instancedAccelerationStructures
      : NSArray); cdecl;
    function instancedAccelerationStructures: NSArray; cdecl;
    procedure setInstanceDescriptorType(instanceDescriptorType
      : MTLAccelerationStructureInstanceDescriptorType); cdecl;
    function instanceDescriptorType
      : MTLAccelerationStructureInstanceDescriptorType; cdecl;
    procedure setMotionTransformBuffer(motionTransformBuffer: Pointer); cdecl;
    function motionTransformBuffer: Pointer; cdecl;
    procedure setMotionTransformBufferOffset(motionTransformBufferOffset
      : NSUInteger); cdecl;
    function motionTransformBufferOffset: NSUInteger; cdecl;
    procedure setMotionTransformCount(motionTransformCount: NSUInteger); cdecl;
    function motionTransformCount: NSUInteger; cdecl;
  end;

  TMTLInstanceAccelerationStructureDescriptor = class
    (TOCGenericImport<MTLInstanceAccelerationStructureDescriptorClass,
    MTLInstanceAccelerationStructureDescriptor>)
  end;

  PMTLInstanceAccelerationStructureDescriptor = Pointer;

  MTLCaptureDescriptorClass = interface(NSObjectClass)
    ['{731D4392-4AB2-480D-86A5-AC6E4FEA3C07}']
  end;

  MTLCaptureDescriptor = interface(NSObject)
    ['{3EFEA21F-27EB-4282-8CB1-F29C0C6688A4}']
    procedure setCaptureObject(captureObject: Pointer); cdecl;
    function captureObject: Pointer; cdecl;
    procedure setDestination(destination: MTLCaptureDestination); cdecl;
    function destination: MTLCaptureDestination; cdecl;
    procedure setOutputURL(outputURL: NSURL); cdecl;
    function outputURL: NSURL; cdecl;
  end;

  TMTLCaptureDescriptor = class(TOCGenericImport<MTLCaptureDescriptorClass,
    MTLCaptureDescriptor>)
  end;

  PMTLCaptureDescriptor = Pointer;

  MTLCaptureManagerClass = interface(NSObjectClass)
    ['{C9400450-A302-4B1F-B62A-6131DC4B5CB1}']
    { class } function sharedCaptureManager: MTLCaptureManager; cdecl;
  end;

  MTLCaptureManager = interface(NSObject)
    ['{42609EEB-91C2-43A3-B734-378391C4F40A}']
    function init: Pointer { instancetype }; cdecl;
    function newCaptureScopeWithDevice(device: Pointer): Pointer; cdecl;
    function newCaptureScopeWithCommandQueue(commandQueue: Pointer)
      : Pointer; cdecl;
    function supportsDestination(destination: MTLCaptureDestination)
      : Boolean; cdecl;
    function startCaptureWithDescriptor(descriptor: MTLCaptureDescriptor;
      error: NSError): Boolean; cdecl;
    procedure startCaptureWithDevice(device: Pointer); cdecl;
    procedure startCaptureWithCommandQueue(commandQueue: Pointer); cdecl;
    procedure startCaptureWithScope(captureScope: Pointer); cdecl;
    procedure stopCapture; cdecl;
    procedure setDefaultCaptureScope(defaultCaptureScope: Pointer); cdecl;
    function defaultCaptureScope: Pointer; cdecl;
    function isCapturing: Boolean; cdecl;
  end;

  TMTLCaptureManager = class(TOCGenericImport<MTLCaptureManagerClass,
    MTLCaptureManager>)
  end;

  PMTLCaptureManager = Pointer;

  MTLSharedEventListenerClass = interface(NSObjectClass)
    ['{1529B5A3-632E-486E-BE70-7024139E5FA2}']
  end;

  MTLSharedEventListener = interface(NSObject)
    ['{367DE23C-36A6-4B74-985D-754A9BAC6E65}']
    function init: Pointer { instancetype }; cdecl;
    function initWithDispatchQueue(dispatchQueue: dispatch_queue_t)
      : Pointer { instancetype }; cdecl;
    function dispatchQueue: dispatch_queue_t; cdecl;
  end;

  TMTLSharedEventListener = class(TOCGenericImport<MTLSharedEventListenerClass,
    MTLSharedEventListener>)
  end;

  PMTLSharedEventListener = Pointer;

  MTLAccelerationStructurePassSampleBufferAttachmentDescriptorClass = interface
    (NSObjectClass)
    ['{925A78C5-EF7D-424A-9DCF-6AF6F75AC74D}']
  end;

  MTLAccelerationStructurePassSampleBufferAttachmentDescriptor =
    interface(NSObject)
    ['{FDED4D12-725C-463D-A6C7-12BD6F64440B}']
    procedure setSampleBuffer(sampleBuffer: Pointer); cdecl;
    function sampleBuffer: Pointer; cdecl;
    procedure setStartOfEncoderSampleIndex(startOfEncoderSampleIndex
      : NSUInteger); cdecl;
    function startOfEncoderSampleIndex: NSUInteger; cdecl;
    procedure setEndOfEncoderSampleIndex(endOfEncoderSampleIndex
      : NSUInteger); cdecl;
    function endOfEncoderSampleIndex: NSUInteger; cdecl;
  end;

  TMTLAccelerationStructurePassSampleBufferAttachmentDescriptor = class
    (TOCGenericImport<
    MTLAccelerationStructurePassSampleBufferAttachmentDescriptorClass,
    MTLAccelerationStructurePassSampleBufferAttachmentDescriptor>)
  end;

  PMTLAccelerationStructurePassSampleBufferAttachmentDescriptor = Pointer;

  MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArrayClass =
    interface(NSObjectClass)
    ['{8F7816FB-22B3-4D84-AFB6-892CEA00A2B1}']
  end;

  MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray =
    interface(NSObject)
    ['{1DD74CD1-6C33-4E66-BA5D-A48A4C26F9AF}']
    function objectAtIndexedSubscript(attachmentIndex: NSUInteger)
      : MTLAccelerationStructurePassSampleBufferAttachmentDescriptor; cdecl;
    procedure setObject(attachment
      : MTLAccelerationStructurePassSampleBufferAttachmentDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray = class
    (TOCGenericImport<
    MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArrayClass,
    MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray>)
  end;

  PMTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray = Pointer;

  MTLRasterizationRateSampleArrayClass = interface(NSObjectClass)
    ['{028A807A-3A69-471E-8B7F-6DDBD65EA9AA}']
  end;

  MTLRasterizationRateSampleArray = interface(NSObject)
    ['{B1BF2C08-6DA8-4719-8D2D-5CBCCA6F9F32}']
    function objectAtIndexedSubscript(index: NSUInteger): NSNumber; cdecl;
    procedure setObject(value: NSNumber; atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLRasterizationRateSampleArray = class
    (TOCGenericImport<MTLRasterizationRateSampleArrayClass,
    MTLRasterizationRateSampleArray>)
  end;

  PMTLRasterizationRateSampleArray = Pointer;

  MTLRasterizationRateLayerArrayClass = interface(NSObjectClass)
    ['{0CD2E16D-F54C-4A99-970E-E1CFCDA20DA3}']
  end;

  MTLRasterizationRateLayerArray = interface(NSObject)
    ['{3FDA38D0-641D-4A99-A306-ED4E71884F25}']
    function objectAtIndexedSubscript(layerIndex: NSUInteger)
      : MTLRasterizationRateLayerDescriptor; cdecl;
    procedure setObject(layer: MTLRasterizationRateLayerDescriptor;
      atIndexedSubscript: NSUInteger); cdecl;
  end;

  TMTLRasterizationRateLayerArray = class
    (TOCGenericImport<MTLRasterizationRateLayerArrayClass,
    MTLRasterizationRateLayerArray>)
  end;

  PMTLRasterizationRateLayerArray = Pointer;

  MTLFunctionStitchingAttributeAlwaysInlineClass = interface(NSObjectClass)
    ['{539BAA2C-9ACD-4139-AA3B-E9BECD27C031}']
  end;

  MTLFunctionStitchingAttributeAlwaysInline = interface(NSObject)
    ['{1E877EC0-AAA0-49DE-8F81-D9EA594F0237}']
  end;

  TMTLFunctionStitchingAttributeAlwaysInline = class
    (TOCGenericImport<MTLFunctionStitchingAttributeAlwaysInlineClass,
    MTLFunctionStitchingAttributeAlwaysInline>)
  end;

  PMTLFunctionStitchingAttributeAlwaysInline = Pointer;

  MTLFunctionStitchingInputNodeClass = interface(NSObjectClass)
    ['{6C90678F-7844-4BD2-898B-EC45E02FC6CA}']
  end;

  MTLFunctionStitchingInputNode = interface(NSObject)
    ['{FFCF485E-8C2C-43E7-8293-C1500945E287}']
    procedure setArgumentIndex(argumentIndex: NSUInteger); cdecl;
    function argumentIndex: NSUInteger; cdecl;
    function initWithArgumentIndex(argument: NSUInteger)
      : Pointer { instancetype }; cdecl;
  end;

  TMTLFunctionStitchingInputNode = class
    (TOCGenericImport<MTLFunctionStitchingInputNodeClass,
    MTLFunctionStitchingInputNode>)
  end;

  PMTLFunctionStitchingInputNode = Pointer;

  MTLFunctionStitchingFunctionNodeClass = interface(NSObjectClass)
    ['{531895A2-3676-4EE9-985F-B81ECFE6841C}']
  end;

  MTLFunctionStitchingFunctionNode = interface(NSObject)
    ['{2E18B6F4-06F3-481B-9438-37F647609CD8}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setArguments(arguments: NSArray); cdecl;
    function arguments: NSArray; cdecl;
    procedure setControlDependencies(controlDependencies: NSArray); cdecl;
    function controlDependencies: NSArray; cdecl;
    function initWithName(name: NSString; arguments: NSArray;
      controlDependencies: NSArray): Pointer { instancetype }; cdecl;
  end;

  TMTLFunctionStitchingFunctionNode = class
    (TOCGenericImport<MTLFunctionStitchingFunctionNodeClass,
    MTLFunctionStitchingFunctionNode>)
  end;

  PMTLFunctionStitchingFunctionNode = Pointer;

  MTLFunctionStitchingGraphClass = interface(NSObjectClass)
    ['{97C90FD0-02AD-4A65-A105-84833F40E1AC}']
  end;

  MTLFunctionStitchingGraph = interface(NSObject)
    ['{8DE39AA4-A5FB-419D-8DD0-A9C924E4FBE9}']
    procedure setFunctionName(functionName: NSString); cdecl;
    function functionName: NSString; cdecl;
    procedure setNodes(nodes: NSArray); cdecl;
    function nodes: NSArray; cdecl;
    procedure setOutputNode(outputNode
      : MTLFunctionStitchingFunctionNode); cdecl;
    function outputNode: MTLFunctionStitchingFunctionNode; cdecl;
    procedure setAttributes(attributes: NSArray); cdecl;
    function attributes: NSArray; cdecl;
    function initWithFunctionName(functionName: NSString; nodes: NSArray;
      outputNode: MTLFunctionStitchingFunctionNode; attributes: NSArray)
      : Pointer { instancetype }; cdecl;
  end;

  TMTLFunctionStitchingGraph = class
    (TOCGenericImport<MTLFunctionStitchingGraphClass,
    MTLFunctionStitchingGraph>)
  end;

  PMTLFunctionStitchingGraph = Pointer;

  // ===== Protocol declarations =====

  MTLDevice = interface(IObjectiveC)
    ['{6F4F1514-E939-425E-AA4F-8BFD60DFA5EA}']
    function name: NSString; cdecl;
    function registryID: UInt64; cdecl;
    function maxThreadsPerThreadgroup: MTLSize; cdecl;
    function isLowPower: Boolean; cdecl;
    function isHeadless: Boolean; cdecl;
    function isRemovable: Boolean; cdecl;
    function hasUnifiedMemory: Boolean; cdecl;
    function recommendedMaxWorkingSetSize: UInt64; cdecl;
    function isDepth24Stencil8PixelFormatSupported: Boolean; cdecl;
    function readWriteTextureSupport: MTLReadWriteTextureTier; cdecl;
    function argumentBuffersSupport: MTLArgumentBuffersTier; cdecl;
    function areRasterOrderGroupsSupported: Boolean; cdecl;
    function supports32BitFloatFiltering: Boolean; cdecl;
    function supports32BitMSAA: Boolean; cdecl;
    function supportsQueryTextureLOD: Boolean; cdecl;
    function supportsBCTextureCompression: Boolean; cdecl;
    function supportsPullModelInterpolation: Boolean; cdecl;
    function areBarycentricCoordsSupported: Boolean; cdecl;
    function supportsShaderBarycentricCoordinates: Boolean; cdecl;
    function currentAllocatedSize: NSUInteger; cdecl;
    function newCommandQueue: Pointer; cdecl;
    function newCommandQueueWithMaxCommandBufferCount(maxCommandBufferCount
      : NSUInteger): Pointer; cdecl;
    function heapTextureSizeAndAlignWithDescriptor(desc: MTLTextureDescriptor)
      : MTLSizeAndAlign; cdecl;
    function heapBufferSizeAndAlignWithLength(length: NSUInteger;
      options: MTLResourceOptions): MTLSizeAndAlign; cdecl;
    function newHeapWithDescriptor(descriptor: MTLHeapDescriptor)
      : Pointer; cdecl;
    function newBufferWithLength(length: NSUInteger;
      options: MTLResourceOptions): Pointer; cdecl;
    function newBufferWithBytes(Pointer: Pointer; length: NSUInteger;
      options: MTLResourceOptions): Pointer; cdecl;
    function newBufferWithBytesNoCopy(Pointer: Pointer; length: NSUInteger;
      options: MTLResourceOptions; deallocator: TMetalDeallocator)
      : Pointer; cdecl;
    function newDepthStencilStateWithDescriptor
      (descriptor: MTLDepthStencilDescriptor): Pointer; cdecl;
    [MethodName('newTextureWithDescriptor:')]
    function newTextureWithDescriptor(descriptor: MTLTextureDescriptor)
      : Pointer; cdecl;
    [MethodName('newTextureWithDescriptor:iosurface:plane:')]
    function newTextureWithDescriptorIosurfacePlane
      (descriptor: MTLTextureDescriptor; IOSurface: IOSurfaceRef;
      plane: NSUInteger): Pointer; cdecl;
    function newSharedTextureWithDescriptor(descriptor: MTLTextureDescriptor)
      : Pointer; cdecl;
    function newSharedTextureWithHandle(sharedHandle: MTLSharedTextureHandle)
      : Pointer; cdecl;
    function newSamplerStateWithDescriptor(descriptor: MTLSamplerDescriptor)
      : Pointer; cdecl;
    function newDefaultLibrary: Pointer; cdecl;
    function newDefaultLibraryWithBundle(bundle: NSBundle; error: NSError)
      : Pointer; cdecl;
    function newLibraryWithFile(filepath: NSString; error: NSError)
      : Pointer; cdecl;
    function newLibraryWithURL(url: NSURL; error: NSError): Pointer; cdecl;
    function newLibraryWithData(data: dispatch_data_t; error: NSError)
      : Pointer; cdecl;
    [MethodName('newLibraryWithSource:options:error:')]
    function newLibraryWithSourceOptionsError(source: NSString;
      options: MTLCompileOptions; error: NSError): Pointer; cdecl;
    [MethodName('newLibraryWithSource:options:completionHandler:')]
    procedure newLibraryWithSourceOptionsCompletionHandler(source: NSString;
      options: MTLCompileOptions;
      completionHandler: MTLNewLibraryCompletionHandler); cdecl;
    [MethodName('newLibraryWithStitchedDescriptor:error:')]
    function newLibraryWithStitchedDescriptorError
      (descriptor: MTLStitchedLibraryDescriptor; error: NSError)
      : Pointer; cdecl;
    [MethodName('newLibraryWithStitchedDescriptor:completionHandler:')]
    procedure newLibraryWithStitchedDescriptorCompletionHandler
      (descriptor: MTLStitchedLibraryDescriptor;
      completionHandler: MTLNewLibraryCompletionHandler); cdecl;
    [MethodName('newRenderPipelineStateWithDescriptor:error:')]
    function newRenderPipelineStateWithDescriptorError
      (descriptor: MTLRenderPipelineDescriptor; error: NSError): Pointer; cdecl;
    [MethodName
      ('newRenderPipelineStateWithDescriptor:options:reflection:error:')]
    function newRenderPipelineStateWithDescriptorOptionsReflectionError
      (descriptor: MTLRenderPipelineDescriptor; options: MTLPipelineOption;
      reflection: PMTLAutoreleasedRenderPipelineReflection; error: NSError)
      : Pointer; cdecl;
    [MethodName('newRenderPipelineStateWithDescriptor:completionHandler:')]
    procedure newRenderPipelineStateWithDescriptorCompletionHandler
      (descriptor: MTLRenderPipelineDescriptor;
      completionHandler: MTLNewRenderPipelineStateCompletionHandler); cdecl;
    [MethodName
      ('newRenderPipelineStateWithDescriptor:options:completionHandler:')]
    procedure newRenderPipelineStateWithDescriptorOptionsCompletionHandler
      (descriptor: MTLRenderPipelineDescriptor; options: MTLPipelineOption;
      completionHandler
      : MTLNewRenderPipelineStateWithReflectionCompletionHandler); cdecl;
    [MethodName('newComputePipelineStateWithFunction:error:')]
    function newComputePipelineStateWithFunctionError(computeFunction: Pointer;
      error: NSError): Pointer; cdecl;
    [MethodName
      ('newComputePipelineStateWithFunction:options:reflection:error:')]
    function newComputePipelineStateWithFunctionOptionsReflectionError
      (computeFunction: Pointer; options: MTLPipelineOption;
      reflection: PMTLAutoreleasedComputePipelineReflection; error: NSError)
      : Pointer; cdecl;
    [MethodName('newComputePipelineStateWithFunction:completionHandler:')]
    procedure newComputePipelineStateWithFunctionCompletionHandler
      (computeFunction: Pointer;
      completionHandler: MTLNewComputePipelineStateCompletionHandler); cdecl;
    [MethodName
      ('newComputePipelineStateWithFunction:options:completionHandler:')]
    procedure newComputePipelineStateWithFunctionOptionsCompletionHandler
      (computeFunction: Pointer; options: MTLPipelineOption;
      completionHandler
      : MTLNewComputePipelineStateWithReflectionCompletionHandler); cdecl;
    [MethodName
      ('newComputePipelineStateWithDescriptor:options:reflection:error:')]
    function newComputePipelineStateWithDescriptorOptionsReflectionError
      (descriptor: MTLComputePipelineDescriptor; options: MTLPipelineOption;
      reflection: PMTLAutoreleasedComputePipelineReflection; error: NSError)
      : Pointer; cdecl;
    [MethodName
      ('newComputePipelineStateWithDescriptor:options:completionHandler:')]
    procedure newComputePipelineStateWithDescriptorOptionsCompletionHandler
      (descriptor: MTLComputePipelineDescriptor; options: MTLPipelineOption;
      completionHandler
      : MTLNewComputePipelineStateWithReflectionCompletionHandler); cdecl;
    function newFence: Pointer; cdecl;
    function supportsFeatureSet(featureSet: MTLFeatureSet): Boolean; cdecl;
    function supportsFamily(gpuFamily: MTLGPUFamily): Boolean; cdecl;
    function supportsTextureSampleCount(sampleCount: NSUInteger)
      : Boolean; cdecl;
    function minimumLinearTextureAlignmentForPixelFormat(format: MTLPixelFormat)
      : NSUInteger; cdecl;
    function minimumTextureBufferAlignmentForPixelFormat(format: MTLPixelFormat)
      : NSUInteger; cdecl;
    [MethodName
      ('newRenderPipelineStateWithTileDescriptor:options:reflection:error:')]
    function newRenderPipelineStateWithTileDescriptorOptionsReflectionError
      (descriptor: MTLTileRenderPipelineDescriptor; options: MTLPipelineOption;
      reflection: PMTLAutoreleasedRenderPipelineReflection; error: NSError)
      : Pointer; cdecl;
    [MethodName
      ('newRenderPipelineStateWithTileDescriptor:options:completionHandler:')]
    procedure newRenderPipelineStateWithTileDescriptorOptionsCompletionHandler
      (descriptor: MTLTileRenderPipelineDescriptor; options: MTLPipelineOption;
      completionHandler
      : MTLNewRenderPipelineStateWithReflectionCompletionHandler); cdecl;
    [MethodName
      ('newRenderPipelineStateWithMeshDescriptor:options:reflection:error:')]
    function newRenderPipelineStateWithMeshDescriptorOptionsReflectionError
      (descriptor: MTLMeshRenderPipelineDescriptor; options: MTLPipelineOption;
      reflection: PMTLAutoreleasedRenderPipelineReflection; error: NSError)
      : Pointer; cdecl;
    [MethodName
      ('newRenderPipelineStateWithMeshDescriptor:options:completionHandler:')]
    procedure newRenderPipelineStateWithMeshDescriptorOptionsCompletionHandler
      (descriptor: MTLMeshRenderPipelineDescriptor; options: MTLPipelineOption;
      completionHandler
      : MTLNewRenderPipelineStateWithReflectionCompletionHandler); cdecl;
    function maxThreadgroupMemoryLength: NSUInteger; cdecl;
    function maxArgumentBufferSamplerCount: NSUInteger; cdecl;
    function areProgrammableSamplePositionsSupported: Boolean; cdecl;
    procedure getDefaultSamplePositions(positions: PMTLSamplePosition;
      count: NSUInteger); cdecl;
    function newArgumentEncoderWithArguments(arguments: NSArray)
      : Pointer; cdecl;
    function supportsRasterizationRateMapWithLayerCount(layerCount: NSUInteger)
      : Boolean; cdecl;
    function newRasterizationRateMapWithDescriptor
      (descriptor: MTLRasterizationRateMapDescriptor): Pointer; cdecl;
    function newIndirectCommandBufferWithDescriptor
      (descriptor: MTLIndirectCommandBufferDescriptor;
      maxCommandCount: NSUInteger; options: MTLResourceOptions): Pointer; cdecl;
    function newEvent: Pointer; cdecl;
    function newSharedEvent: Pointer; cdecl;
    function newSharedEventWithHandle(sharedEventHandle: MTLSharedEventHandle)
      : Pointer; cdecl;
    [MethodName('newIOHandleWithURL:error:')]
    function newIOHandleWithURLError(url: NSURL; error: NSError)
      : Pointer; cdecl;
    function newIOCommandQueueWithDescriptor(descriptor
      : MTLIOCommandQueueDescriptor; error: NSError): Pointer; cdecl;
    [MethodName('newIOHandleWithURL:compressionMethod:error:')]
    function newIOHandleWithURLCompressionMethodError(url: NSURL;
      compressionMethod: MTLIOCompressionMethod; error: NSError)
      : Pointer; cdecl;
    [MethodName('sparseTileSizeWithTextureType:pixelFormat:sampleCount:')]
    function sparseTileSizeWithTextureTypePixelFormatSampleCount
      (textureType: MTLTextureType; pixelFormat: MTLPixelFormat;
      sampleCount: NSUInteger): MTLSize; cdecl;
    function sparseTileSizeInBytes: NSUInteger; cdecl;
    procedure convertSparsePixelRegions(pixelRegions: MTLRegion;
      toTileRegions: MTLRegion; withTileSize: MTLSize;
      alignmentMode: MTLSparseTextureRegionAlignmentMode;
      numRegions: NSUInteger); cdecl;
    procedure convertSparseTileRegions(tileRegions: MTLRegion;
      toPixelRegions: MTLRegion; withTileSize: MTLSize;
      numRegions: NSUInteger); cdecl;
    function sparseTileSizeInBytesForSparsePageSize(sparsePageSize
      : MTLSparsePageSize): NSUInteger; cdecl;
    [MethodName
      ('sparseTileSizeWithTextureType:pixelFormat:sampleCount:sparsePageSize:')]
    function sparseTileSizeWithTextureTypePixelFormatSampleCountSparsePageSize
      (textureType: MTLTextureType; pixelFormat: MTLPixelFormat;
      sampleCount: NSUInteger; sparsePageSize: MTLSparsePageSize)
      : MTLSize; cdecl;
    function maxBufferLength: NSUInteger; cdecl;
    function counterSets: NSArray; cdecl;
    function newCounterSampleBufferWithDescriptor
      (descriptor: MTLCounterSampleBufferDescriptor; error: NSError)
      : Pointer; cdecl;
    procedure sampleTimestamps(cpuTimestamp: PUInt64;
      gpuTimestamp: PUInt64); cdecl;
    function newArgumentEncoderWithBufferBinding(bufferBinding: Pointer)
      : Pointer; cdecl;
    function supportsCounterSampling(samplingPoint: MTLCounterSamplingPoint)
      : Boolean; cdecl;
    function supportsVertexAmplificationCount(count: NSUInteger)
      : Boolean; cdecl;
    function supportsDynamicLibraries: Boolean; cdecl;
    function supportsRenderDynamicLibraries: Boolean; cdecl;
    function newDynamicLibrary(&library: Pointer; error: NSError)
      : Pointer; cdecl;
    function newDynamicLibraryWithURL(url: NSURL; error: NSError)
      : Pointer; cdecl;
    function newBinaryArchiveWithDescriptor(descriptor
      : MTLBinaryArchiveDescriptor; error: NSError): Pointer; cdecl;
    function supportsRaytracing: Boolean; cdecl;
    function accelerationStructureSizesWithDescriptor
      (descriptor: MTLAccelerationStructureDescriptor)
      : MTLAccelerationStructureSizes; cdecl;
    function newAccelerationStructureWithSize(size: NSUInteger): Pointer; cdecl;
    function newAccelerationStructureWithDescriptor
      (descriptor: MTLAccelerationStructureDescriptor): Pointer; cdecl;
    function heapAccelerationStructureSizeAndAlignWithSize(size: NSUInteger)
      : MTLSizeAndAlign; cdecl;
    function heapAccelerationStructureSizeAndAlignWithDescriptor
      (descriptor: MTLAccelerationStructureDescriptor): MTLSizeAndAlign; cdecl;
    function supportsFunctionPointers: Boolean; cdecl;
    function supportsFunctionPointersFromRender: Boolean; cdecl;
    function supportsRaytracingFromRender: Boolean; cdecl;
    function supportsPrimitiveMotionBlur: Boolean; cdecl;
  end;

  MTLCommandEncoder = interface(IObjectiveC)
    ['{B7997AF5-AE7E-48D9-ABC5-1EEB80A2A632}']
    function device: Pointer; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    procedure endEncoding; cdecl;
    procedure insertDebugSignpost(&string: NSString); cdecl;
    procedure pushDebugGroup(&string: NSString); cdecl;
    procedure popDebugGroup; cdecl;
  end;

  MTLHeap = interface(IObjectiveC)
    ['{72B180F7-B857-4B08-9126-A99697A38FFC}']
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    function device: Pointer; cdecl;
    function storageMode: MTLStorageMode; cdecl;
    function cpuCacheMode: MTLCPUCacheMode; cdecl;
    function hazardTrackingMode: MTLHazardTrackingMode; cdecl;
    function resourceOptions: MTLResourceOptions; cdecl;
    function size: NSUInteger; cdecl;
    function usedSize: NSUInteger; cdecl;
    function currentAllocatedSize: NSUInteger; cdecl;
    function maxAvailableSizeWithAlignment(alignment: NSUInteger)
      : NSUInteger; cdecl;
    [MethodName('newBufferWithLength:options:')]
    function newBufferWithLengthOptions(length: NSUInteger;
      options: MTLResourceOptions): Pointer; cdecl;
    [MethodName('newTextureWithDescriptor:')]
    function newTextureWithDescriptor(desc: MTLTextureDescriptor)
      : Pointer; cdecl;
    function setPurgeableState(state: MTLPurgeableState)
      : MTLPurgeableState; cdecl;
    function &type: MTLHeapType; cdecl;
    [MethodName('newBufferWithLength:options:offset:')]
    function newBufferWithLengthOptionsOffset(length: NSUInteger;
      options: MTLResourceOptions; offset: NSUInteger): Pointer; cdecl;
    [MethodName('newTextureWithDescriptor:offset:')]
    function newTextureWithDescriptorOffset(descriptor: MTLTextureDescriptor;
      offset: NSUInteger): Pointer; cdecl;
    [MethodName('newAccelerationStructureWithSize:')]
    function newAccelerationStructureWithSize(size: NSUInteger): Pointer; cdecl;
    [MethodName('newAccelerationStructureWithDescriptor:')]
    function newAccelerationStructureWithDescriptor
      (descriptor: MTLAccelerationStructureDescriptor): Pointer; cdecl;
    [MethodName('newAccelerationStructureWithSize:offset:')]
    function newAccelerationStructureWithSizeOffset(size: NSUInteger;
      offset: NSUInteger): Pointer; cdecl;
    [MethodName('newAccelerationStructureWithDescriptor:offset:')]
    function newAccelerationStructureWithDescriptorOffset
      (descriptor: MTLAccelerationStructureDescriptor; offset: NSUInteger)
      : Pointer; cdecl;
  end;

  MTLResource = interface(IObjectiveC)
    ['{16421CF4-3E65-4DD3-B374-C2BE8033738A}']
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    function device: Pointer; cdecl;
    function cpuCacheMode: MTLCPUCacheMode; cdecl;
    function storageMode: MTLStorageMode; cdecl;
    function hazardTrackingMode: MTLHazardTrackingMode; cdecl;
    function resourceOptions: MTLResourceOptions; cdecl;
    function setPurgeableState(state: MTLPurgeableState)
      : MTLPurgeableState; cdecl;
    function heap: Pointer; cdecl;
    function heapOffset: NSUInteger; cdecl;
    function allocatedSize: NSUInteger; cdecl;
    procedure makeAliasable; cdecl;
    function isAliasable: Boolean; cdecl;
  end;

  MTLTexture = interface(IObjectiveC)
    ['{107133FC-68B4-40E7-836D-0EC93DC7CC6E}']
    function rootResource: Pointer; cdecl;
    function parentTexture: Pointer; cdecl;
    function parentRelativeLevel: NSUInteger; cdecl;
    function parentRelativeSlice: NSUInteger; cdecl;
    function buffer: Pointer; cdecl;
    function bufferOffset: NSUInteger; cdecl;
    function bufferBytesPerRow: NSUInteger; cdecl;
    function IOSurface: IOSurfaceRef; cdecl;
    function iosurfacePlane: NSUInteger; cdecl;
    function textureType: MTLTextureType; cdecl;
    function pixelFormat: MTLPixelFormat; cdecl;
    function width: NSUInteger; cdecl;
    function height: NSUInteger; cdecl;
    function depth: NSUInteger; cdecl;
    function mipmapLevelCount: NSUInteger; cdecl;
    function sampleCount: NSUInteger; cdecl;
    function arrayLength: NSUInteger; cdecl;
    function usage: MTLTextureUsage; cdecl;
    function isShareable: Boolean; cdecl;
    function isFramebufferOnly: Boolean; cdecl;
    function firstMipmapInTail: NSUInteger; cdecl;
    function tailSizeInBytes: NSUInteger; cdecl;
    function isSparse: Boolean; cdecl;
    function allowGPUOptimizedContents: Boolean; cdecl;
    function compressionType: MTLTextureCompressionType; cdecl;
    function gpuResourceID: MTLResourceID; cdecl;
    [MethodName
      ('getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:')]
    procedure getBytesBytesPerRowBytesPerImageFromRegionMipmapLevelSlice
      (pixelBytes: Pointer; bytesPerRow: NSUInteger; bytesPerImage: NSUInteger;
      fromRegion: MTLRegion; mipMapLevel: NSUInteger; slice: NSUInteger); cdecl;
    [MethodName
      ('replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:')]
    procedure replaceRegionMipmapLevelSliceWithBytesBytesPerRowBytesPerImage
      (region: MTLRegion; mipMapLevel: NSUInteger; slice: NSUInteger;
      withBytes: Pointer; bytesPerRow: NSUInteger;
      bytesPerImage: NSUInteger); cdecl;
    [MethodName('getBytes:bytesPerRow:fromRegion:mipmapLevel:')]
    procedure getBytesBytesPerRowFromRegionMipmapLevel(pixelBytes: Pointer;
      bytesPerRow: NSUInteger; fromRegion: MTLRegion;
      mipMapLevel: NSUInteger); cdecl;
    [MethodName('replaceRegion:mipmapLevel:withBytes:bytesPerRow:')]
    procedure replaceRegionMipmapLevelWithBytesBytesPerRow(region: MTLRegion;
      mipMapLevel: NSUInteger; withBytes: Pointer;
      bytesPerRow: NSUInteger); cdecl;
    [MethodName('newTextureViewWithPixelFormat:')]
    function newTextureViewWithPixelFormat(pixelFormat: MTLPixelFormat)
      : Pointer; cdecl;
    [MethodName('newTextureViewWithPixelFormat:textureType:levels:slices:')]
    function newTextureViewWithPixelFormatTextureTypeLevelsSlices
      (pixelFormat: MTLPixelFormat; textureType: MTLTextureType;
      levels: NSRange; slices: NSRange): Pointer; cdecl;
    function newSharedTextureHandle: MTLSharedTextureHandle; cdecl;
    function swizzle: MTLTextureSwizzleChannels; cdecl;
    [MethodName
      ('newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:')]
    function newTextureViewWithPixelFormatTextureTypeLevelsSlicesSwizzle
      (pixelFormat: MTLPixelFormat; textureType: MTLTextureType;
      levels: NSRange; slices: NSRange; swizzle: MTLTextureSwizzleChannels)
      : Pointer; cdecl;
  end;

  MTLBuffer = interface(IObjectiveC)
    ['{8542C8BF-1053-40DB-9225-7F24A081CF33}']
    function length: NSUInteger; cdecl;
    function contents: Pointer; cdecl;
    procedure didModifyRange(range: NSRange); cdecl;
    function newTextureWithDescriptor(descriptor: MTLTextureDescriptor;
      offset: NSUInteger; bytesPerRow: NSUInteger): Pointer; cdecl;
    procedure addDebugMarker(marker: NSString; range: NSRange); cdecl;
    procedure removeAllDebugMarkers; cdecl;
    function gpuAddress: UInt64; cdecl;
  end;

  MTLBinding = interface(IObjectiveC)
    ['{51E9B11C-771B-493B-BCE7-3184834F1018}']
    function name: NSString; cdecl;
    function &type: MTLBindingType; cdecl;
    function access: MTLArgumentAccess; cdecl;
    function index: NSUInteger; cdecl;
    function isUsed: Boolean; cdecl;
    function isArgument: Boolean; cdecl;
  end;

  MTLBufferBinding = interface(IObjectiveC)
    ['{31473088-06B0-48D5-BA3F-3148A0DA1D4F}']
    function bufferAlignment: NSUInteger; cdecl;
    function bufferDataSize: NSUInteger; cdecl;
    function bufferDataType: MTLDataType; cdecl;
    function bufferStructType: MTLStructType; cdecl;
    function bufferPointerType: MTLPointerType; cdecl;
  end;

  MTLThreadgroupBinding = interface(IObjectiveC)
    ['{9B3986C9-52F5-4A14-9A16-BCD81351CB5B}']
    function threadgroupMemoryAlignment: NSUInteger; cdecl;
    function threadgroupMemoryDataSize: NSUInteger; cdecl;
  end;

  MTLTextureBinding = interface(IObjectiveC)
    ['{28450994-5148-4686-9833-CBD129ED6044}']
    function textureType: MTLTextureType; cdecl;
    function textureDataType: MTLDataType; cdecl;
    function isDepthTexture: Boolean; cdecl;
    function arrayLength: NSUInteger; cdecl;
  end;

  MTLObjectPayloadBinding = interface(IObjectiveC)
    ['{2734EB93-6B16-41C2-A3B0-04BF192AFDE2}']
    function objectPayloadAlignment: NSUInteger; cdecl;
    function objectPayloadDataSize: NSUInteger; cdecl;
  end;

  MTLBinaryArchive = interface(IObjectiveC)
    ['{9060F880-DBAE-4861-B0FD-4EAEB924A2B9}']
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    function device: Pointer; cdecl;
    function addComputePipelineFunctionsWithDescriptor
      (descriptor: MTLComputePipelineDescriptor; error: NSError)
      : Boolean; cdecl;
    function addRenderPipelineFunctionsWithDescriptor
      (descriptor: MTLRenderPipelineDescriptor; error: NSError): Boolean; cdecl;
    function addTileRenderPipelineFunctionsWithDescriptor
      (descriptor: MTLTileRenderPipelineDescriptor; error: NSError)
      : Boolean; cdecl;
    function serializeToURL(url: NSURL; error: NSError): Boolean; cdecl;
    function addFunctionWithDescriptor(descriptor: MTLFunctionDescriptor;
      &library: Pointer; error: NSError): Boolean; cdecl;
  end;

  MTLFunction = interface(IObjectiveC)
    ['{1B32C353-A810-43F9-85FC-D5C45411A87D}']
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    function device: Pointer; cdecl;
    function functionType: MTLFunctionType; cdecl;
    function patchType: MTLPatchType; cdecl;
    function patchControlPointCount: NSInteger; cdecl;
    function vertexAttributes: NSArray; cdecl;
    function stageInputAttributes: NSArray; cdecl;
    function name: NSString; cdecl;
    function functionConstantsDictionary: NSDictionary; cdecl;
    [MethodName('newArgumentEncoderWithBufferIndex:')]
    function newArgumentEncoderWithBufferIndex(bufferIndex: NSUInteger)
      : Pointer; cdecl;
    [MethodName('newArgumentEncoderWithBufferIndex:reflection:')]
    function newArgumentEncoderWithBufferIndexReflection
      (bufferIndex: NSUInteger; reflection: PMTLAutoreleasedArgument)
      : Pointer; cdecl;
    function options: MTLFunctionOptions; cdecl;
  end;

  MTLLibrary = interface(IObjectiveC)
    ['{CA8D32EF-4BFC-46EA-A592-E8A4BE64B9FA}']
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    function device: Pointer; cdecl;
    [MethodName('newFunctionWithName:')]
    function newFunctionWithName(functionName: NSString): Pointer; cdecl;
    [MethodName('newFunctionWithName:constantValues:error:')]
    function newFunctionWithNameConstantValuesError(name: NSString;
      constantValues: MTLFunctionConstantValues; error: NSError)
      : Pointer; cdecl;
    [MethodName('newFunctionWithName:constantValues:completionHandler:')]
    procedure newFunctionWithNameConstantValuesCompletionHandler(name: NSString;
      constantValues: MTLFunctionConstantValues;
      completionHandler: TMetalCompletionHandler); cdecl;
    [MethodName('newFunctionWithDescriptor:completionHandler:')]
    procedure newFunctionWithDescriptorCompletionHandler
      (descriptor: MTLFunctionDescriptor;
      completionHandler: TMetalCompletionHandler); cdecl;
    [MethodName('newFunctionWithDescriptor:error:')]
    function newFunctionWithDescriptorError(descriptor: MTLFunctionDescriptor;
      error: NSError): Pointer; cdecl;
    [MethodName('newIntersectionFunctionWithDescriptor:completionHandler:')]
    procedure newIntersectionFunctionWithDescriptorCompletionHandler
      (descriptor: MTLIntersectionFunctionDescriptor;
      completionHandler: TMetalCompletionHandler); cdecl;
    [MethodName('newIntersectionFunctionWithDescriptor:error:')]
    function newIntersectionFunctionWithDescriptorError
      (descriptor: MTLIntersectionFunctionDescriptor; error: NSError)
      : Pointer; cdecl;
    function functionNames: NSArray; cdecl;
    function &type: MTLLibraryType; cdecl;
    function installName: NSString; cdecl;
  end;

  MTLDynamicLibrary = interface(IObjectiveC)
    ['{F0C82743-DBC1-4B30-A356-FB137CE5C847}']
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    function device: Pointer; cdecl;
    function installName: NSString; cdecl;
    function serializeToURL(url: NSURL; error: NSError): Boolean; cdecl;
  end;

  MTLArgumentEncoder = interface(IObjectiveC)
    ['{E56EEE7F-63C3-4F9F-B311-88DB9EF711CE}']
    function device: Pointer; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    function encodedLength: NSUInteger; cdecl;
    function alignment: NSUInteger; cdecl;
    [MethodName('setArgumentBuffer:offset:')]
    procedure setArgumentBufferOffset(argumentBuffer: Pointer;
      offset: NSUInteger); cdecl;
    [MethodName('setArgumentBuffer:startOffset:arrayElement:')]
    procedure setArgumentBufferStartOffsetArrayElement(argumentBuffer: Pointer;
      startOffset: NSUInteger; arrayElement: NSUInteger); cdecl;
    procedure setBuffer(buffer: Pointer; offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setBuffers(buffers: Pointer; offsets: NSUInteger;
      withRange: NSRange); cdecl;
    procedure setTexture(texture: Pointer; atIndex: NSUInteger); cdecl;
    procedure setTextures(textures: Pointer; withRange: NSRange); cdecl;
    procedure setSamplerState(sampler: Pointer; atIndex: NSUInteger); cdecl;
    procedure setSamplerStates(samplers: Pointer; withRange: NSRange); cdecl;
    function constantDataAtIndex(index: NSUInteger): Pointer; cdecl;
    procedure setRenderPipelineState(pipeline: Pointer;
      atIndex: NSUInteger); cdecl;
    procedure setRenderPipelineStates(pipelines: Pointer;
      withRange: NSRange); cdecl;
    procedure setComputePipelineState(pipeline: Pointer;
      atIndex: NSUInteger); cdecl;
    procedure setComputePipelineStates(pipelines: Pointer;
      withRange: NSRange); cdecl;
    procedure setIndirectCommandBuffer(indirectCommandBuffer: Pointer;
      atIndex: NSUInteger); cdecl;
    procedure setIndirectCommandBuffers(buffers: Pointer;
      withRange: NSRange); cdecl;
    procedure setAccelerationStructure(accelerationStructure: Pointer;
      atIndex: NSUInteger); cdecl;
    function newArgumentEncoderForBufferAtIndex(index: NSUInteger)
      : Pointer; cdecl;
    procedure setVisibleFunctionTable(visibleFunctionTable: Pointer;
      atIndex: NSUInteger); cdecl;
    procedure setVisibleFunctionTables(visibleFunctionTables: Pointer;
      withRange: NSRange); cdecl;
    procedure setIntersectionFunctionTable(intersectionFunctionTable: Pointer;
      atIndex: NSUInteger); cdecl;
    procedure setIntersectionFunctionTables(intersectionFunctionTables: Pointer;
      withRange: NSRange); cdecl;
  end;

  MTLCounter = interface(IObjectiveC)
    ['{A7B73CCC-746C-4341-930F-710403D7FBC7}']
    function name: NSString; cdecl;
  end;

  MTLCounterSet = interface(IObjectiveC)
    ['{7D241C8B-7F13-43B8-B37F-70CFF7C90700}']
    function name: NSString; cdecl;
    function counters: NSArray; cdecl;
  end;

  MTLCounterSampleBuffer = interface(IObjectiveC)
    ['{2997F429-07FC-431E-B948-07255F1C5D26}']
    function device: Pointer; cdecl;
    function &label: NSString; cdecl;
    function sampleCount: NSUInteger; cdecl;
    function resolveCounterRange(range: NSRange): NSData; cdecl;
  end;

  MTLCommandQueue = interface(IObjectiveC)
    ['{E0A0F028-64DE-41CF-959A-C3DF1FE5A077}']
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    function device: Pointer; cdecl;
    function commandBuffer: Pointer; cdecl;
    function commandBufferWithDescriptor(descriptor: MTLCommandBufferDescriptor)
      : Pointer; cdecl;
    function commandBufferWithUnretainedReferences: Pointer; cdecl;
    procedure insertDebugCaptureBoundary; cdecl;
  end;

  MTLDepthStencilState = interface(IObjectiveC)
    ['{895F7C4B-5153-4C8C-8C3F-B0D36C13570F}']
    function &label: NSString; cdecl;
    function device: Pointer; cdecl;
  end;

  MTLSamplerState = interface(IObjectiveC)
    ['{59320EEA-D916-43BC-A03C-A22AB33DC340}']
    function &label: NSString; cdecl;
    function device: Pointer; cdecl;
    function gpuResourceID: MTLResourceID; cdecl;
  end;

  MTLRenderPipelineState = interface(IObjectiveC)
    ['{79927CAB-2526-42C0-B71C-7514452974CB}']
    function &label: NSString; cdecl;
    function device: Pointer; cdecl;
    function maxTotalThreadsPerThreadgroup: NSUInteger; cdecl;
    function threadgroupSizeMatchesTileSize: Boolean; cdecl;
    function imageblockSampleLength: NSUInteger; cdecl;
    function imageblockMemoryLengthForDimensions(imageblockDimensions: MTLSize)
      : NSUInteger; cdecl;
    function supportIndirectCommandBuffers: Boolean; cdecl;
    function maxTotalThreadsPerObjectThreadgroup: NSUInteger; cdecl;
    function maxTotalThreadsPerMeshThreadgroup: NSUInteger; cdecl;
    function objectThreadExecutionWidth: NSUInteger; cdecl;
    function meshThreadExecutionWidth: NSUInteger; cdecl;
    function maxTotalThreadgroupsPerMeshGrid: NSUInteger; cdecl;
    function gpuResourceID: MTLResourceID; cdecl;
    function functionHandleWithFunction(&function: Pointer;
      stage: MTLRenderStages): Pointer; cdecl;
    function newVisibleFunctionTableWithDescriptor
      (descriptor: MTLVisibleFunctionTableDescriptor; stage: MTLRenderStages)
      : Pointer; cdecl;
    function newIntersectionFunctionTableWithDescriptor
      (descriptor: MTLIntersectionFunctionTableDescriptor;
      stage: MTLRenderStages): Pointer; cdecl;
    function newRenderPipelineStateWithAdditionalBinaryFunctions
      (additionalBinaryFunctions: MTLRenderPipelineFunctionsDescriptor;
      error: NSError): Pointer; cdecl;
  end;

  MTLComputePipelineState = interface(IObjectiveC)
    ['{E42A015C-8F01-48A1-A104-DCD89B1E0E8B}']
    function &label: NSString; cdecl;
    function device: Pointer; cdecl;
    function maxTotalThreadsPerThreadgroup: NSUInteger; cdecl;
    function threadExecutionWidth: NSUInteger; cdecl;
    function staticThreadgroupMemoryLength: NSUInteger; cdecl;
    function imageblockMemoryLengthForDimensions(imageblockDimensions: MTLSize)
      : NSUInteger; cdecl;
    function supportIndirectCommandBuffers: Boolean; cdecl;
    function gpuResourceID: MTLResourceID; cdecl;
    function functionHandleWithFunction(&function: Pointer): Pointer; cdecl;
    function newComputePipelineStateWithAdditionalBinaryFunctions
      (functions: NSArray; error: NSError): Pointer; cdecl;
    function newVisibleFunctionTableWithDescriptor
      (descriptor: MTLVisibleFunctionTableDescriptor): Pointer; cdecl;
    function newIntersectionFunctionTableWithDescriptor
      (descriptor: MTLIntersectionFunctionTableDescriptor): Pointer; cdecl;
  end;

  MTLFence = interface(IObjectiveC)
    ['{66F99392-9ABD-4FB4-BB39-0E7B4F32DCF1}']
    function device: Pointer; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
  end;

  MTLRasterizationRateMap = interface(IObjectiveC)
    ['{912B59B6-79C7-449F-9C52-7859C1188250}']
    function device: Pointer; cdecl;
    function &label: NSString; cdecl;
    function screenSize: MTLSize; cdecl;
    function physicalGranularity: MTLSize; cdecl;
    function layerCount: NSUInteger; cdecl;
    function parameterBufferSizeAndAlign: MTLSizeAndAlign; cdecl;
    procedure copyParameterDataToBuffer(buffer: Pointer;
      offset: NSUInteger); cdecl;
    function physicalSizeForLayer(layerIndex: NSUInteger): MTLSize; cdecl;
    function mapScreenToPhysicalCoordinates(screenCoordinates: MTLCoordinate2D;
      forLayer: NSUInteger): MTLCoordinate2D; cdecl;
    function mapPhysicalToScreenCoordinates(physicalCoordinates
      : MTLCoordinate2D; forLayer: NSUInteger): MTLCoordinate2D; cdecl;
  end;

  MTLIndirectRenderCommandEncoder = interface(IObjectiveC)
    ['{D2AB0668-BAA9-4561-A505-BFCCCD3776C6}']
  end;

  MTLIndirectComputeCommandEncoder = interface(IObjectiveC)
    ['{95676725-3AB0-4410-B3D8-A47A0187C756}']
  end;

  MTLIndirectCommandBuffer = interface(IObjectiveC)
    ['{D685209C-8761-47AD-A6CC-76828A33E8FC}']
    function size: NSUInteger; cdecl;
    function gpuResourceID: MTLResourceID; cdecl;
    procedure resetWithRange(range: NSRange); cdecl;
    function indirectRenderCommandAtIndex(commandIndex: NSUInteger)
      : Pointer; cdecl;
    function indirectComputeCommandAtIndex(commandIndex: NSUInteger)
      : Pointer; cdecl;
  end;

  MTLEvent = interface(IObjectiveC)
    ['{4B4EC6DB-4720-4BC0-B419-8D9DEAD0E2E1}']
    function device: Pointer; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
  end;

  MTLSharedEvent = interface(IObjectiveC)
    ['{5F7ABA66-D7BD-4DB6-89B6-845BB2129F14}']
    procedure notifyListener(listener: MTLSharedEventListener; atValue: UInt64;
      block: MTLSharedEventNotificationBlock); cdecl;
    function newSharedEventHandle: MTLSharedEventHandle; cdecl;
    procedure setSignaledValue(signaledValue: UInt64); cdecl;
    function signaledValue: UInt64; cdecl;
  end;

  MTLAccelerationStructure = interface(IObjectiveC)
    ['{A182EF02-D467-4351-8EA5-0F20C154451D}']
    function size: NSUInteger; cdecl;
    function gpuResourceID: MTLResourceID; cdecl;
  end;

  MTLFunctionHandle = interface(IObjectiveC)
    ['{494B3B8C-AD1F-4946-A101-6529D620B46C}']
    function functionType: MTLFunctionType; cdecl;
    function name: NSString; cdecl;
    function device: Pointer; cdecl;
  end;

  MTLVisibleFunctionTable = interface(IObjectiveC)
    ['{13C3E104-5603-46FE-9A7E-1AF9253E6F2A}']
    function gpuResourceID: MTLResourceID; cdecl;
    procedure setFunction(&function: Pointer; atIndex: NSUInteger); cdecl;
    procedure setFunctions(functions: Pointer; withRange: NSRange); cdecl;
  end;

  MTLIntersectionFunctionTable = interface(IObjectiveC)
    ['{842B32F4-B311-444C-BCCD-A27A75F97880}']
    procedure setBuffer(buffer: Pointer; offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setBuffers(buffers: Pointer; offsets: NSUInteger;
      withRange: NSRange); cdecl;
    function gpuResourceID: MTLResourceID; cdecl;
    procedure setFunction(&function: Pointer; atIndex: NSUInteger); cdecl;
    procedure setFunctions(functions: Pointer; withRange: NSRange); cdecl;
    [MethodName('setOpaqueTriangleIntersectionFunctionWithSignature:atIndex:')]
    procedure setOpaqueTriangleIntersectionFunctionWithSignatureAtIndex
      (signature: MTLIntersectionFunctionSignature; atIndex: NSUInteger); cdecl;
    [MethodName
      ('setOpaqueTriangleIntersectionFunctionWithSignature:withRange:')]
    procedure setOpaqueTriangleIntersectionFunctionWithSignatureWithRange
      (signature: MTLIntersectionFunctionSignature; withRange: NSRange); cdecl;
    procedure setVisibleFunctionTable(functionTable: Pointer;
      atBufferIndex: NSUInteger); cdecl;
    procedure setVisibleFunctionTables(functionTables: Pointer;
      withBufferRange: NSRange); cdecl;
  end;

  MTLIOFileHandle = interface(IObjectiveC)
    ['{26AD4A61-4D30-4309-BB90-F4BDF374907C}']
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
  end;

  MTLIOCommandQueue = interface(IObjectiveC)
    ['{7DB67B01-0F71-485C-BDA0-2A0EF8A54636}']
    procedure enqueueBarrier; cdecl;
    function commandBuffer: Pointer; cdecl;
    function commandBufferWithUnretainedReferences: Pointer; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
  end;

  MTLResourceStateCommandEncoder = interface(IObjectiveC)
    ['{0C3D46A0-C72D-43DB-BF45-245C351701DE}']
    procedure updateTextureMappings(texture: Pointer;
      mode: MTLSparseTextureMappingMode; regions: MTLRegion;
      mipLevels: NSUInteger; slices: NSUInteger; numRegions: NSUInteger); cdecl;
    [MethodName('updateTextureMapping:mode:region:mipLevel:slice:')]
    procedure updateTextureMappingModeRegionMipLevelSlice(texture: Pointer;
      mode: MTLSparseTextureMappingMode; region: MTLRegion;
      mipLevel: NSUInteger; slice: NSUInteger); cdecl;
    [MethodName
      ('updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:')]
    procedure updateTextureMappingModeIndirectBufferIndirectBufferOffset
      (texture: Pointer; mode: MTLSparseTextureMappingMode;
      indirectBuffer: Pointer; indirectBufferOffset: NSUInteger); cdecl;
    procedure updateFence(fence: Pointer); cdecl;
    procedure waitForFence(fence: Pointer); cdecl;
    procedure moveTextureMappingsFromTexture(sourceTexture: Pointer;
      sourceSlice: NSUInteger; sourceLevel: NSUInteger; sourceOrigin: MTLOrigin;
      sourceSize: MTLSize; toTexture: Pointer; destinationSlice: NSUInteger;
      destinationLevel: NSUInteger; destinationOrigin: MTLOrigin); cdecl;
  end;

  MTLBlitCommandEncoder = interface(IObjectiveC)
    ['{10D35223-AE37-43D0-9D22-2675428CEFA8}']
    procedure synchronizeResource(resource: Pointer); cdecl;
    procedure synchronizeTexture(texture: Pointer; slice: NSUInteger;
      level: NSUInteger); cdecl;
    [MethodName
      ('copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:')
      ]
    procedure copyFromTextureSourceSliceSourceLevelSourceOriginSourceSizeToTextureDestinationSliceDestinationLevelDestinationOrigin
      (sourceTexture: Pointer; sourceSlice: NSUInteger; sourceLevel: NSUInteger;
      sourceOrigin: MTLOrigin; sourceSize: MTLSize; toTexture: Pointer;
      destinationSlice: NSUInteger; destinationLevel: NSUInteger;
      destinationOrigin: MTLOrigin); cdecl;
    [MethodName
      ('copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:')
      ]
    procedure copyFromBufferSourceOffsetSourceBytesPerRowSourceBytesPerImageSourceSizeToTextureDestinationSliceDestinationLevelDestinationOrigin
      (sourceBuffer: Pointer; sourceOffset: NSUInteger;
      sourceBytesPerRow: NSUInteger; sourceBytesPerImage: NSUInteger;
      sourceSize: MTLSize; toTexture: Pointer; destinationSlice: NSUInteger;
      destinationLevel: NSUInteger; destinationOrigin: MTLOrigin); cdecl;
    [MethodName
      ('copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:')
      ]
    procedure copyFromBufferSourceOffsetSourceBytesPerRowSourceBytesPerImageSourceSizeToTextureDestinationSliceDestinationLevelDestinationOriginOptions
      (sourceBuffer: Pointer; sourceOffset: NSUInteger;
      sourceBytesPerRow: NSUInteger; sourceBytesPerImage: NSUInteger;
      sourceSize: MTLSize; toTexture: Pointer; destinationSlice: NSUInteger;
      destinationLevel: NSUInteger; destinationOrigin: MTLOrigin;
      options: MTLBlitOption); cdecl;
    [MethodName
      ('copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:')
      ]
    procedure copyFromTextureSourceSliceSourceLevelSourceOriginSourceSizeToBufferDestinationOffsetDestinationBytesPerRowDestinationBytesPerImage
      (sourceTexture: Pointer; sourceSlice: NSUInteger; sourceLevel: NSUInteger;
      sourceOrigin: MTLOrigin; sourceSize: MTLSize; toBuffer: Pointer;
      destinationOffset: NSUInteger; destinationBytesPerRow: NSUInteger;
      destinationBytesPerImage: NSUInteger); cdecl;
    [MethodName
      ('copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:')
      ]
    procedure copyFromTextureSourceSliceSourceLevelSourceOriginSourceSizeToBufferDestinationOffsetDestinationBytesPerRowDestinationBytesPerImageOptions
      (sourceTexture: Pointer; sourceSlice: NSUInteger; sourceLevel: NSUInteger;
      sourceOrigin: MTLOrigin; sourceSize: MTLSize; toBuffer: Pointer;
      destinationOffset: NSUInteger; destinationBytesPerRow: NSUInteger;
      destinationBytesPerImage: NSUInteger; options: MTLBlitOption); cdecl;
    procedure generateMipmapsForTexture(texture: Pointer); cdecl;
    procedure fillBuffer(buffer: Pointer; range: NSRange; value: Byte); cdecl;
    [MethodName
      ('copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:')
      ]
    procedure copyFromTextureSourceSliceSourceLevelToTextureDestinationSliceDestinationLevelSliceCountLevelCount
      (sourceTexture: Pointer; sourceSlice: NSUInteger; sourceLevel: NSUInteger;
      toTexture: Pointer; destinationSlice: NSUInteger;
      destinationLevel: NSUInteger; sliceCount: NSUInteger;
      levelCount: NSUInteger); cdecl;
    [MethodName('copyFromTexture:toTexture:')]
    procedure copyFromTextureToTexture(sourceTexture: Pointer;
      toTexture: Pointer); cdecl;
    [MethodName('copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:')]
    procedure copyFromBufferSourceOffsetToBufferDestinationOffsetSize
      (sourceBuffer: Pointer; sourceOffset: NSUInteger; toBuffer: Pointer;
      destinationOffset: NSUInteger; size: NSUInteger); cdecl;
    procedure updateFence(fence: Pointer); cdecl;
    procedure waitForFence(fence: Pointer); cdecl;
    procedure getTextureAccessCounters(texture: Pointer; region: MTLRegion;
      mipLevel: NSUInteger; slice: NSUInteger; resetCounters: Boolean;
      countersBuffer: Pointer; countersBufferOffset: NSUInteger); cdecl;
    procedure resetTextureAccessCounters(texture: Pointer; region: MTLRegion;
      mipLevel: NSUInteger; slice: NSUInteger); cdecl;
    [MethodName('optimizeContentsForGPUAccess:')]
    procedure optimizeContentsForGPUAccess(texture: Pointer); cdecl;
    [MethodName('optimizeContentsForGPUAccess:slice:level:')]
    procedure optimizeContentsForGPUAccessSliceLevel(texture: Pointer;
      slice: NSUInteger; level: NSUInteger); cdecl;
    [MethodName('optimizeContentsForCPUAccess:')]
    procedure optimizeContentsForCPUAccess(texture: Pointer); cdecl;
    [MethodName('optimizeContentsForCPUAccess:slice:level:')]
    procedure optimizeContentsForCPUAccessSliceLevel(texture: Pointer;
      slice: NSUInteger; level: NSUInteger); cdecl;
    procedure resetCommandsInBuffer(buffer: Pointer; withRange: NSRange); cdecl;
    procedure copyIndirectCommandBuffer(source: Pointer; sourceRange: NSRange;
      destination: Pointer; destinationIndex: NSUInteger); cdecl;
    procedure optimizeIndirectCommandBuffer(indirectCommandBuffer: Pointer;
      withRange: NSRange); cdecl;
    procedure sampleCountersInBuffer(sampleBuffer: Pointer;
      atSampleIndex: NSUInteger; withBarrier: Boolean); cdecl;
    procedure resolveCounters(sampleBuffer: Pointer; inRange: NSRange;
      destinationBuffer: Pointer; destinationOffset: NSUInteger); cdecl;
  end;

  MTLRenderCommandEncoder = interface(IObjectiveC)
    ['{720FD196-1459-456E-AA01-CADE9E0CC4E3}']
    procedure setRenderPipelineState(pipelineState: Pointer); cdecl;
    procedure setVertexBytes(bytes: Pointer; length: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setVertexBuffer(buffer: Pointer; offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setVertexBufferOffset(offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setVertexBuffers(buffers: Pointer; offsets: NSUInteger;
      withRange: NSRange); cdecl;
    procedure setVertexTexture(texture: Pointer; atIndex: NSUInteger); cdecl;
    procedure setVertexTextures(textures: Pointer; withRange: NSRange); cdecl;
    [MethodName('setVertexSamplerState:atIndex:')]
    procedure setVertexSamplerStateAtIndex(sampler: Pointer;
      atIndex: NSUInteger); cdecl;
    [MethodName('setVertexSamplerStates:withRange:')]
    procedure setVertexSamplerStatesWithRange(samplers: Pointer;
      withRange: NSRange); cdecl;
    [MethodName('setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:')]
    procedure setVertexSamplerStateLodMinClampLodMaxClampAtIndex
      (sampler: Pointer; lodMinClamp: Single; lodMaxClamp: Single;
      atIndex: NSUInteger); cdecl;
    [MethodName('setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:')]
    procedure setVertexSamplerStatesLodMinClampsLodMaxClampsWithRange
      (samplers: Pointer; lodMinClamps: Single; lodMaxClamps: Single;
      withRange: NSRange); cdecl;
    procedure setVertexVisibleFunctionTable(functionTable: Pointer;
      atBufferIndex: NSUInteger); cdecl;
    procedure setVertexVisibleFunctionTables(functionTables: Pointer;
      withBufferRange: NSRange); cdecl;
    procedure setVertexIntersectionFunctionTable(intersectionFunctionTable
      : Pointer; atBufferIndex: NSUInteger); cdecl;
    procedure setVertexIntersectionFunctionTables(intersectionFunctionTables
      : Pointer; withBufferRange: NSRange); cdecl;
    procedure setVertexAccelerationStructure(accelerationStructure: Pointer;
      atBufferIndex: NSUInteger); cdecl;
    procedure setViewport(viewport: MTLViewport); cdecl;
    procedure setViewports(viewports: MTLViewport; count: NSUInteger); cdecl;
    procedure setFrontFacingWinding(frontFacingWinding: MTLWinding); cdecl;
    procedure setVertexAmplificationCount(count: NSUInteger;
      viewMappings: PMTLVertexAmplificationViewMapping); cdecl;
    procedure setCullMode(cullMode: MTLCullMode); cdecl;
    procedure setDepthClipMode(depthClipMode: MTLDepthClipMode); cdecl;
    procedure setDepthBias(depthBias: Single; slopeScale: Single;
      clamp: Single); cdecl;
    procedure setScissorRect(rect: MTLScissorRect); cdecl;
    procedure setScissorRects(scissorRects: MTLScissorRect;
      count: NSUInteger); cdecl;
    procedure setTriangleFillMode(fillMode: MTLTriangleFillMode); cdecl;
    procedure setFragmentBytes(bytes: Pointer; length: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setFragmentBuffer(buffer: Pointer; offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setFragmentBufferOffset(offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setFragmentBuffers(buffers: Pointer; offsets: NSUInteger;
      withRange: NSRange); cdecl;
    procedure setFragmentTexture(texture: Pointer; atIndex: NSUInteger); cdecl;
    procedure setFragmentTextures(textures: Pointer; withRange: NSRange); cdecl;
    [MethodName('setFragmentSamplerState:atIndex:')]
    procedure setFragmentSamplerStateAtIndex(sampler: Pointer;
      atIndex: NSUInteger); cdecl;
    [MethodName('setFragmentSamplerStates:withRange:')]
    procedure setFragmentSamplerStatesWithRange(samplers: Pointer;
      withRange: NSRange); cdecl;
    [MethodName('setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:')]
    procedure setFragmentSamplerStateLodMinClampLodMaxClampAtIndex
      (sampler: Pointer; lodMinClamp: Single; lodMaxClamp: Single;
      atIndex: NSUInteger); cdecl;
    [MethodName
      ('setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:')]
    procedure setFragmentSamplerStatesLodMinClampsLodMaxClampsWithRange
      (samplers: Pointer; lodMinClamps: Single; lodMaxClamps: Single;
      withRange: NSRange); cdecl;
    procedure setFragmentVisibleFunctionTable(functionTable: Pointer;
      atBufferIndex: NSUInteger); cdecl;
    procedure setFragmentVisibleFunctionTables(functionTables: Pointer;
      withBufferRange: NSRange); cdecl;
    procedure setFragmentIntersectionFunctionTable(intersectionFunctionTable
      : Pointer; atBufferIndex: NSUInteger); cdecl;
    procedure setFragmentIntersectionFunctionTables(intersectionFunctionTables
      : Pointer; withBufferRange: NSRange); cdecl;
    procedure setFragmentAccelerationStructure(accelerationStructure: Pointer;
      atBufferIndex: NSUInteger); cdecl;
    procedure setBlendColorRed(red: Single; green: Single; blue: Single;
      alpha: Single); cdecl;
    procedure setDepthStencilState(depthStencilState: Pointer); cdecl;
    procedure setStencilReferenceValue(referenceValue: LongWord); cdecl;
    procedure setStencilFrontReferenceValue(frontReferenceValue: LongWord;
      backReferenceValue: LongWord); cdecl;
    procedure setVisibilityResultMode(mode: MTLVisibilityResultMode;
      offset: NSUInteger); cdecl;
    procedure setColorStoreAction(storeAction: MTLStoreAction;
      atIndex: NSUInteger); cdecl;
    procedure setDepthStoreAction(storeAction: MTLStoreAction); cdecl;
    procedure setStencilStoreAction(storeAction: MTLStoreAction); cdecl;
    procedure setColorStoreActionOptions(storeActionOptions
      : MTLStoreActionOptions; atIndex: NSUInteger); cdecl;
    procedure setDepthStoreActionOptions(storeActionOptions
      : MTLStoreActionOptions); cdecl;
    procedure setStencilStoreActionOptions(storeActionOptions
      : MTLStoreActionOptions); cdecl;
    procedure setObjectBytes(bytes: Pointer; length: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setObjectBuffer(buffer: Pointer; offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setObjectBufferOffset(offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setObjectBuffers(buffers: Pointer; offsets: NSUInteger;
      withRange: NSRange); cdecl;
    procedure setObjectTexture(texture: Pointer; atIndex: NSUInteger); cdecl;
    procedure setObjectTextures(textures: Pointer; withRange: NSRange); cdecl;
    [MethodName('setObjectSamplerState:atIndex:')]
    procedure setObjectSamplerStateAtIndex(sampler: Pointer;
      atIndex: NSUInteger); cdecl;
    [MethodName('setObjectSamplerStates:withRange:')]
    procedure setObjectSamplerStatesWithRange(samplers: Pointer;
      withRange: NSRange); cdecl;
    [MethodName('setObjectSamplerState:lodMinClamp:lodMaxClamp:atIndex:')]
    procedure setObjectSamplerStateLodMinClampLodMaxClampAtIndex
      (sampler: Pointer; lodMinClamp: Single; lodMaxClamp: Single;
      atIndex: NSUInteger); cdecl;
    [MethodName('setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:')]
    procedure setObjectSamplerStatesLodMinClampsLodMaxClampsWithRange
      (samplers: Pointer; lodMinClamps: Single; lodMaxClamps: Single;
      withRange: NSRange); cdecl;
    procedure setObjectThreadgroupMemoryLength(length: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setMeshBytes(bytes: Pointer; length: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setMeshBuffer(buffer: Pointer; offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setMeshBufferOffset(offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setMeshBuffers(buffers: Pointer; offsets: NSUInteger;
      withRange: NSRange); cdecl;
    procedure setMeshTexture(texture: Pointer; atIndex: NSUInteger); cdecl;
    procedure setMeshTextures(textures: Pointer; withRange: NSRange); cdecl;
    [MethodName('setMeshSamplerState:atIndex:')]
    procedure setMeshSamplerStateAtIndex(sampler: Pointer;
      atIndex: NSUInteger); cdecl;
    [MethodName('setMeshSamplerStates:withRange:')]
    procedure setMeshSamplerStatesWithRange(samplers: Pointer;
      withRange: NSRange); cdecl;
    [MethodName('setMeshSamplerState:lodMinClamp:lodMaxClamp:atIndex:')]
    procedure setMeshSamplerStateLodMinClampLodMaxClampAtIndex(sampler: Pointer;
      lodMinClamp: Single; lodMaxClamp: Single; atIndex: NSUInteger); cdecl;
    [MethodName('setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:')]
    procedure setMeshSamplerStatesLodMinClampsLodMaxClampsWithRange
      (samplers: Pointer; lodMinClamps: Single; lodMaxClamps: Single;
      withRange: NSRange); cdecl;
    procedure drawMeshThreadgroups(threadgroupsPerGrid: MTLSize;
      threadsPerObjectThreadgroup: MTLSize;
      threadsPerMeshThreadgroup: MTLSize); cdecl;
    procedure drawMeshThreads(threadsPerGrid: MTLSize;
      threadsPerObjectThreadgroup: MTLSize;
      threadsPerMeshThreadgroup: MTLSize); cdecl;
    procedure drawMeshThreadgroupsWithIndirectBuffer(indirectBuffer: Pointer;
      indirectBufferOffset: NSUInteger; threadsPerObjectThreadgroup: MTLSize;
      threadsPerMeshThreadgroup: MTLSize); cdecl;
    [MethodName('drawPrimitives:vertexStart:vertexCount:instanceCount:')]
    procedure drawPrimitivesVertexStartVertexCountInstanceCount
      (primitiveType: MTLPrimitiveType; vertexStart: NSUInteger;
      vertexCount: NSUInteger; instanceCount: NSUInteger); cdecl;
    [MethodName('drawPrimitives:vertexStart:vertexCount:')]
    procedure drawPrimitivesVertexStartVertexCount(primitiveType
      : MTLPrimitiveType; vertexStart: NSUInteger;
      vertexCount: NSUInteger); cdecl;
    [MethodName
      ('drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:')
      ]
    procedure drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffsetInstanceCount
      (primitiveType: MTLPrimitiveType; indexCount: NSUInteger;
      indexType: MTLIndexType; indexBuffer: Pointer;
      indexBufferOffset: NSUInteger; instanceCount: NSUInteger); cdecl;
    [MethodName
      ('drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:')
      ]
    procedure drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffset
      (primitiveType: MTLPrimitiveType; indexCount: NSUInteger;
      indexType: MTLIndexType; indexBuffer: Pointer;
      indexBufferOffset: NSUInteger); cdecl;
    [MethodName
      ('drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:')]
    procedure drawPrimitivesVertexStartVertexCountInstanceCountBaseInstance
      (primitiveType: MTLPrimitiveType; vertexStart: NSUInteger;
      vertexCount: NSUInteger; instanceCount: NSUInteger;
      baseInstance: NSUInteger); cdecl;
    [MethodName
      ('drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:')
      ]
    procedure drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffsetInstanceCountBaseVertexBaseInstance
      (primitiveType: MTLPrimitiveType; indexCount: NSUInteger;
      indexType: MTLIndexType; indexBuffer: Pointer;
      indexBufferOffset: NSUInteger; instanceCount: NSUInteger;
      baseVertex: NSInteger; baseInstance: NSUInteger); cdecl;
    [MethodName('drawPrimitives:indirectBuffer:indirectBufferOffset:')]
    procedure drawPrimitivesIndirectBufferIndirectBufferOffset
      (primitiveType: MTLPrimitiveType; indirectBuffer: Pointer;
      indirectBufferOffset: NSUInteger); cdecl;
    [MethodName
      ('drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:')
      ]
    procedure drawIndexedPrimitivesIndexTypeIndexBufferIndexBufferOffsetIndirectBufferIndirectBufferOffset
      (primitiveType: MTLPrimitiveType; indexType: MTLIndexType;
      indexBuffer: Pointer; indexBufferOffset: NSUInteger;
      indirectBuffer: Pointer; indirectBufferOffset: NSUInteger); cdecl;
    procedure textureBarrier; cdecl;
    procedure updateFence(fence: Pointer; afterStages: MTLRenderStages); cdecl;
    procedure waitForFence(fence: Pointer;
      beforeStages: MTLRenderStages); cdecl;
    procedure setTessellationFactorBuffer(buffer: Pointer; offset: NSUInteger;
      instanceStride: NSUInteger); cdecl;
    procedure setTessellationFactorScale(scale: Single); cdecl;
    [MethodName
      ('drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:')
      ]
    procedure drawPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetInstanceCountBaseInstance
      (numberOfPatchControlPoints: NSUInteger; patchStart: NSUInteger;
      patchCount: NSUInteger; patchIndexBuffer: Pointer;
      patchIndexBufferOffset: NSUInteger; instanceCount: NSUInteger;
      baseInstance: NSUInteger); cdecl;
    [MethodName
      ('drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:')
      ]
    procedure drawPatchesPatchIndexBufferPatchIndexBufferOffsetIndirectBufferIndirectBufferOffset
      (numberOfPatchControlPoints: NSUInteger; patchIndexBuffer: Pointer;
      patchIndexBufferOffset: NSUInteger; indirectBuffer: Pointer;
      indirectBufferOffset: NSUInteger); cdecl;
    [MethodName
      ('drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:')
      ]
    procedure drawIndexedPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetControlPointIndexBufferControlPointIndexBufferOffsetInstanceCountBaseInstance
      (numberOfPatchControlPoints: NSUInteger; patchStart: NSUInteger;
      patchCount: NSUInteger; patchIndexBuffer: Pointer;
      patchIndexBufferOffset: NSUInteger; controlPointIndexBuffer: Pointer;
      controlPointIndexBufferOffset: NSUInteger; instanceCount: NSUInteger;
      baseInstance: NSUInteger); cdecl;
    [MethodName
      ('drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:')
      ]
    procedure drawIndexedPatchesPatchIndexBufferPatchIndexBufferOffsetControlPointIndexBufferControlPointIndexBufferOffsetIndirectBufferIndirectBufferOffset
      (numberOfPatchControlPoints: NSUInteger; patchIndexBuffer: Pointer;
      patchIndexBufferOffset: NSUInteger; controlPointIndexBuffer: Pointer;
      controlPointIndexBufferOffset: NSUInteger; indirectBuffer: Pointer;
      indirectBufferOffset: NSUInteger); cdecl;
    function tileWidth: NSUInteger; cdecl;
    function tileHeight: NSUInteger; cdecl;
    procedure setTileBytes(bytes: Pointer; length: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setTileBuffer(buffer: Pointer; offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setTileBufferOffset(offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setTileBuffers(buffers: Pointer; offsets: NSUInteger;
      withRange: NSRange); cdecl;
    procedure setTileTexture(texture: Pointer; atIndex: NSUInteger); cdecl;
    procedure setTileTextures(textures: Pointer; withRange: NSRange); cdecl;
    [MethodName('setTileSamplerState:atIndex:')]
    procedure setTileSamplerStateAtIndex(sampler: Pointer;
      atIndex: NSUInteger); cdecl;
    [MethodName('setTileSamplerStates:withRange:')]
    procedure setTileSamplerStatesWithRange(samplers: Pointer;
      withRange: NSRange); cdecl;
    [MethodName('setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:')]
    procedure setTileSamplerStateLodMinClampLodMaxClampAtIndex(sampler: Pointer;
      lodMinClamp: Single; lodMaxClamp: Single; atIndex: NSUInteger); cdecl;
    [MethodName('setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:')]
    procedure setTileSamplerStatesLodMinClampsLodMaxClampsWithRange
      (samplers: Pointer; lodMinClamps: Single; lodMaxClamps: Single;
      withRange: NSRange); cdecl;
    procedure setTileVisibleFunctionTable(functionTable: Pointer;
      atBufferIndex: NSUInteger); cdecl;
    procedure setTileVisibleFunctionTables(functionTables: Pointer;
      withBufferRange: NSRange); cdecl;
    procedure setTileIntersectionFunctionTable(intersectionFunctionTable
      : Pointer; atBufferIndex: NSUInteger); cdecl;
    procedure setTileIntersectionFunctionTables(intersectionFunctionTables
      : Pointer; withBufferRange: NSRange); cdecl;
    procedure setTileAccelerationStructure(accelerationStructure: Pointer;
      atBufferIndex: NSUInteger); cdecl;
    procedure dispatchThreadsPerTile(threadsPerTile: MTLSize); cdecl;
    procedure setThreadgroupMemoryLength(length: NSUInteger; offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    [MethodName('useResource:usage:')]
    procedure useResourceUsage(resource: Pointer;
      usage: MTLResourceUsage); cdecl;
    [MethodName('useResources:count:usage:')]
    procedure useResourcesCountUsage(resources: Pointer; count: NSUInteger;
      usage: MTLResourceUsage); cdecl;
    [MethodName('useResource:usage:stages:')]
    procedure useResourceUsageStages(resource: Pointer; usage: MTLResourceUsage;
      stages: MTLRenderStages); cdecl;
    [MethodName('useResources:count:usage:stages:')]
    procedure useResourcesCountUsageStages(resources: Pointer;
      count: NSUInteger; usage: MTLResourceUsage;
      stages: MTLRenderStages); cdecl;
    [MethodName('useHeap:')]
    procedure useHeap(heap: Pointer); cdecl;
    [MethodName('useHeaps:count:')]
    procedure useHeapsCount(heaps: Pointer; count: NSUInteger); cdecl;
    [MethodName('useHeap:stages:')]
    procedure useHeapStages(heap: Pointer; stages: MTLRenderStages); cdecl;
    [MethodName('useHeaps:count:stages:')]
    procedure useHeapsCountStages(heaps: Pointer; count: NSUInteger;
      stages: MTLRenderStages); cdecl;
    [MethodName('executeCommandsInBuffer:withRange:')]
    procedure executeCommandsInBufferWithRange(indirectCommandBuffer: Pointer;
      withRange: NSRange); cdecl;
    [MethodName('executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:')]
    procedure executeCommandsInBufferIndirectBufferIndirectBufferOffset
      (indirectCommandBuffer: Pointer; indirectBuffer: Pointer;
      indirectBufferOffset: NSUInteger); cdecl;
    procedure memoryBarrierWithScope(scope: MTLBarrierScope;
      afterStages: MTLRenderStages; beforeStages: MTLRenderStages); cdecl;
    procedure memoryBarrierWithResources(resources: Pointer; count: NSUInteger;
      afterStages: MTLRenderStages; beforeStages: MTLRenderStages); cdecl;
    procedure sampleCountersInBuffer(sampleBuffer: Pointer;
      atSampleIndex: NSUInteger; withBarrier: Boolean); cdecl;
  end;

  MTLParallelRenderCommandEncoder = interface(IObjectiveC)
    ['{458B916A-9F94-4757-B64A-9706B4DE8C98}']
    function renderCommandEncoder: Pointer; cdecl;
    procedure setColorStoreAction(storeAction: MTLStoreAction;
      atIndex: NSUInteger); cdecl;
    procedure setDepthStoreAction(storeAction: MTLStoreAction); cdecl;
    procedure setStencilStoreAction(storeAction: MTLStoreAction); cdecl;
    procedure setColorStoreActionOptions(storeActionOptions
      : MTLStoreActionOptions; atIndex: NSUInteger); cdecl;
    procedure setDepthStoreActionOptions(storeActionOptions
      : MTLStoreActionOptions); cdecl;
    procedure setStencilStoreActionOptions(storeActionOptions
      : MTLStoreActionOptions); cdecl;
  end;

  MTLComputeCommandEncoder = interface(IObjectiveC)
    ['{8122184A-259A-4981-9F08-03D6F54D7D7A}']
    function dispatchType: MTLDispatchType; cdecl;
    procedure setComputePipelineState(state: Pointer); cdecl;
    procedure setBytes(bytes: Pointer; length: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setBuffer(buffer: Pointer; offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setBufferOffset(offset: NSUInteger; atIndex: NSUInteger); cdecl;
    procedure setBuffers(buffers: Pointer; offsets: NSUInteger;
      withRange: NSRange); cdecl;
    procedure setVisibleFunctionTable(visibleFunctionTable: Pointer;
      atBufferIndex: NSUInteger); cdecl;
    procedure setVisibleFunctionTables(visibleFunctionTables: Pointer;
      withBufferRange: NSRange); cdecl;
    procedure setIntersectionFunctionTable(intersectionFunctionTable: Pointer;
      atBufferIndex: NSUInteger); cdecl;
    procedure setIntersectionFunctionTables(intersectionFunctionTables: Pointer;
      withBufferRange: NSRange); cdecl;
    procedure setAccelerationStructure(accelerationStructure: Pointer;
      atBufferIndex: NSUInteger); cdecl;
    procedure setTexture(texture: Pointer; atIndex: NSUInteger); cdecl;
    procedure setTextures(textures: Pointer; withRange: NSRange); cdecl;
    [MethodName('setSamplerState:atIndex:')]
    procedure setSamplerStateAtIndex(sampler: Pointer;
      atIndex: NSUInteger); cdecl;
    [MethodName('setSamplerStates:withRange:')]
    procedure setSamplerStatesWithRange(samplers: Pointer;
      withRange: NSRange); cdecl;
    [MethodName('setSamplerState:lodMinClamp:lodMaxClamp:atIndex:')]
    procedure setSamplerStateLodMinClampLodMaxClampAtIndex(sampler: Pointer;
      lodMinClamp: Single; lodMaxClamp: Single; atIndex: NSUInteger); cdecl;
    [MethodName('setSamplerStates:lodMinClamps:lodMaxClamps:withRange:')]
    procedure setSamplerStatesLodMinClampsLodMaxClampsWithRange
      (samplers: Pointer; lodMinClamps: Single; lodMaxClamps: Single;
      withRange: NSRange); cdecl;
    procedure setThreadgroupMemoryLength(length: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setImageblockWidth(width: NSUInteger; height: NSUInteger); cdecl;
    procedure setStageInRegion(region: MTLRegion); cdecl;
    procedure setStageInRegionWithIndirectBuffer(indirectBuffer: Pointer;
      indirectBufferOffset: NSUInteger); cdecl;
    procedure dispatchThreadgroups(threadgroupsPerGrid: MTLSize;
      threadsPerThreadgroup: MTLSize); cdecl;
    procedure dispatchThreadgroupsWithIndirectBuffer(indirectBuffer: Pointer;
      indirectBufferOffset: NSUInteger; threadsPerThreadgroup: MTLSize); cdecl;
    procedure dispatchThreads(threadsPerGrid: MTLSize;
      threadsPerThreadgroup: MTLSize); cdecl;
    procedure updateFence(fence: Pointer); cdecl;
    procedure waitForFence(fence: Pointer); cdecl;
    procedure useResource(resource: Pointer; usage: MTLResourceUsage); cdecl;
    procedure useResources(resources: Pointer; count: NSUInteger;
      usage: MTLResourceUsage); cdecl;
    procedure useHeap(heap: Pointer); cdecl;
    procedure useHeaps(heaps: Pointer; count: NSUInteger); cdecl;
    [MethodName('executeCommandsInBuffer:withRange:')]
    procedure executeCommandsInBufferWithRange(indirectCommandBuffer: Pointer;
      withRange: NSRange); cdecl;
    [MethodName('executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:')]
    procedure executeCommandsInBufferIndirectBufferIndirectBufferOffset
      (indirectCommandBuffer: Pointer; indirectBuffer: Pointer;
      indirectBufferOffset: NSUInteger); cdecl;
    procedure memoryBarrierWithScope(scope: MTLBarrierScope); cdecl;
    procedure memoryBarrierWithResources(resources: Pointer;
      count: NSUInteger); cdecl;
    procedure sampleCountersInBuffer(sampleBuffer: Pointer;
      atSampleIndex: NSUInteger; withBarrier: Boolean); cdecl;
  end;

  MTLDrawable = interface(IObjectiveC)
    ['{D8564317-9034-4D4E-A83D-D68AF0A4DF29}']
    procedure present; cdecl;
    procedure presentAtTime(presentationTime: CFTimeInterval); cdecl;
    procedure presentAfterMinimumDuration(duration: CFTimeInterval); cdecl;
    procedure addPresentedHandler(block: MTLDrawablePresentedHandler); cdecl;
    function presentedTime: CFTimeInterval; cdecl;
    function drawableID: NSUInteger; cdecl;
  end;

  MTLCommandBuffer = interface(IObjectiveC)
    ['{B76CB954-BA97-4D70-8F80-4DB0F7C03548}']
    function device: Pointer; cdecl;
    function commandQueue: Pointer; cdecl;
    function retainedReferences: Boolean; cdecl;
    function errorOptions: MTLCommandBufferErrorOption; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    function kernelStartTime: CFTimeInterval; cdecl;
    function kernelEndTime: CFTimeInterval; cdecl;
    function logs: Pointer; cdecl;
    function GPUStartTime: CFTimeInterval; cdecl;
    function GPUEndTime: CFTimeInterval; cdecl;
    procedure enqueue; cdecl;
    procedure commit; cdecl;
    procedure addScheduledHandler(block: MTLCommandBufferHandler); cdecl;
    [MethodName('presentDrawable:')]
    procedure presentDrawable(drawable: Pointer); cdecl;
    [MethodName('presentDrawable:atTime:')]
    procedure presentDrawableAtTime(drawable: Pointer;
      atTime: CFTimeInterval); cdecl;
    [MethodName('presentDrawable:afterMinimumDuration:')]
    procedure presentDrawableAfterMinimumDuration(drawable: Pointer;
      afterMinimumDuration: CFTimeInterval); cdecl;
    procedure waitUntilScheduled; cdecl;
    procedure addCompletedHandler(block: MTLCommandBufferHandler); cdecl;
    procedure waitUntilCompleted; cdecl;
    function status: MTLCommandBufferStatus; cdecl;
    function error: NSError; cdecl;
    function blitCommandEncoder: Pointer; cdecl;
    function renderCommandEncoderWithDescriptor(renderPassDescriptor
      : MTLRenderPassDescriptor): Pointer; cdecl;
    function computeCommandEncoderWithDescriptor(computePassDescriptor
      : MTLComputePassDescriptor): Pointer; cdecl;
    function blitCommandEncoderWithDescriptor(blitPassDescriptor
      : MTLBlitPassDescriptor): Pointer; cdecl;
    function computeCommandEncoder: Pointer; cdecl;
    function computeCommandEncoderWithDispatchType(dispatchType
      : MTLDispatchType): Pointer; cdecl;
    procedure encodeWaitForEvent(event: Pointer; value: UInt64); cdecl;
    procedure encodeSignalEvent(event: Pointer; value: UInt64); cdecl;
    function parallelRenderCommandEncoderWithDescriptor(renderPassDescriptor
      : MTLRenderPassDescriptor): Pointer; cdecl;
    function resourceStateCommandEncoder: Pointer; cdecl;
    function resourceStateCommandEncoderWithDescriptor
      (resourceStatePassDescriptor: MTLResourceStatePassDescriptor)
      : Pointer; cdecl;
    function accelerationStructureCommandEncoder: Pointer; cdecl;
    function accelerationStructureCommandEncoderWithDescriptor
      (descriptor: MTLAccelerationStructurePassDescriptor): Pointer; cdecl;
    procedure pushDebugGroup(&string: NSString); cdecl;
    procedure popDebugGroup; cdecl;
  end;

  MTLLogContainer = interface(IObjectiveC)
    ['{D52BF70A-E697-46A4-BBA9-85A265FBBCBC}']
  end;

  MTLAccelerationStructureCommandEncoder = interface(IObjectiveC)
    ['{E7CA5327-E4C4-4952-BAE7-A9509E1D824A}']
    procedure buildAccelerationStructure(accelerationStructure: Pointer;
      descriptor: MTLAccelerationStructureDescriptor; scratchBuffer: Pointer;
      scratchBufferOffset: NSUInteger); cdecl;
    [MethodName
      ('refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:')
      ]
    procedure refitAccelerationStructureDescriptorDestinationScratchBufferScratchBufferOffset
      (sourceAccelerationStructure: Pointer;
      descriptor: MTLAccelerationStructureDescriptor; destination: Pointer;
      scratchBuffer: Pointer; scratchBufferOffset: NSUInteger); cdecl;
    [MethodName
      ('refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:')
      ]
    procedure refitAccelerationStructureDescriptorDestinationScratchBufferScratchBufferOffsetOptions
      (sourceAccelerationStructure: Pointer;
      descriptor: MTLAccelerationStructureDescriptor; destination: Pointer;
      scratchBuffer: Pointer; scratchBufferOffset: NSUInteger;
      options: MTLAccelerationStructureRefitOptions); cdecl;
    procedure copyAccelerationStructure(sourceAccelerationStructure: Pointer;
      toAccelerationStructure: Pointer); cdecl;
    [MethodName('writeCompactedAccelerationStructureSize:toBuffer:offset:')]
    procedure writeCompactedAccelerationStructureSizeToBufferOffset
      (accelerationStructure: Pointer; toBuffer: Pointer;
      offset: NSUInteger); cdecl;
    [MethodName
      ('writeCompactedAccelerationStructureSize:toBuffer:offset:sizeDataType:')]
    procedure writeCompactedAccelerationStructureSizeToBufferOffsetSizeDataType
      (accelerationStructure: Pointer; toBuffer: Pointer; offset: NSUInteger;
      sizeDataType: MTLDataType); cdecl;
    procedure copyAndCompactAccelerationStructure(sourceAccelerationStructure
      : Pointer; toAccelerationStructure: Pointer); cdecl;
    procedure updateFence(fence: Pointer); cdecl;
    procedure waitForFence(fence: Pointer); cdecl;
    procedure useResource(resource: Pointer; usage: MTLResourceUsage); cdecl;
    procedure useResources(resources: Pointer; count: NSUInteger;
      usage: MTLResourceUsage); cdecl;
    procedure useHeap(heap: Pointer); cdecl;
    procedure useHeaps(heaps: Pointer; count: NSUInteger); cdecl;
    procedure sampleCountersInBuffer(sampleBuffer: Pointer;
      atSampleIndex: NSUInteger; withBarrier: Boolean); cdecl;
  end;

  MTLCommandBufferEncoderInfo = interface(IObjectiveC)
    ['{369FD525-FDD5-463E-9BB1-45C7CE27C0DE}']
    function &label: NSString; cdecl;
    function debugSignposts: NSArray; cdecl;
    function errorState: MTLCommandEncoderErrorState; cdecl;
  end;

  MTLCaptureScope = interface(IObjectiveC)
    ['{E0C341B1-153D-4DC3-9B2E-BA3B8EF250CB}']
    procedure beginScope; cdecl;
    procedure endScope; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    function device: Pointer; cdecl;
    function commandQueue: Pointer; cdecl;
  end;

  MTLIndirectRenderCommand = interface(IObjectiveC)
    ['{8BEFA3AD-B3F8-4710-862E-B580A7ACE945}']
    procedure setRenderPipelineState(pipelineState: Pointer); cdecl;
    procedure setVertexBuffer(buffer: Pointer; offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setFragmentBuffer(buffer: Pointer; offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure drawPatches(numberOfPatchControlPoints: NSUInteger;
      patchStart: NSUInteger; patchCount: NSUInteger; patchIndexBuffer: Pointer;
      patchIndexBufferOffset: NSUInteger; instanceCount: NSUInteger;
      baseInstance: NSUInteger; tessellationFactorBuffer: Pointer;
      tessellationFactorBufferOffset: NSUInteger;
      tessellationFactorBufferInstanceStride: NSUInteger); cdecl;
    procedure drawIndexedPatches(numberOfPatchControlPoints: NSUInteger;
      patchStart: NSUInteger; patchCount: NSUInteger; patchIndexBuffer: Pointer;
      patchIndexBufferOffset: NSUInteger; controlPointIndexBuffer: Pointer;
      controlPointIndexBufferOffset: NSUInteger; instanceCount: NSUInteger;
      baseInstance: NSUInteger; tessellationFactorBuffer: Pointer;
      tessellationFactorBufferOffset: NSUInteger;
      tessellationFactorBufferInstanceStride: NSUInteger); cdecl;
    procedure drawPrimitives(primitiveType: MTLPrimitiveType;
      vertexStart: NSUInteger; vertexCount: NSUInteger;
      instanceCount: NSUInteger; baseInstance: NSUInteger); cdecl;
    procedure drawIndexedPrimitives(primitiveType: MTLPrimitiveType;
      indexCount: NSUInteger; indexType: MTLIndexType; indexBuffer: Pointer;
      indexBufferOffset: NSUInteger; instanceCount: NSUInteger;
      baseVertex: NSInteger; baseInstance: NSUInteger); cdecl;
    procedure reset; cdecl;
  end;

  MTLIndirectComputeCommand = interface(IObjectiveC)
    ['{8AFC899B-4C02-476B-8562-FC2801E8D97E}']
    procedure setComputePipelineState(pipelineState: Pointer); cdecl;
    procedure setKernelBuffer(buffer: Pointer; offset: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure concurrentDispatchThreadgroups(threadgroupsPerGrid: MTLSize;
      threadsPerThreadgroup: MTLSize); cdecl;
    procedure concurrentDispatchThreads(threadsPerGrid: MTLSize;
      threadsPerThreadgroup: MTLSize); cdecl;
    procedure setBarrier; cdecl;
    procedure clearBarrier; cdecl;
    procedure setImageblockWidth(width: NSUInteger; height: NSUInteger); cdecl;
    procedure reset; cdecl;
    procedure setThreadgroupMemoryLength(length: NSUInteger;
      atIndex: NSUInteger); cdecl;
    procedure setStageInRegion(region: MTLRegion); cdecl;
  end;

  MTLFunctionLogDebugLocation = interface(IObjectiveC)
    ['{F753E522-5F2B-462E-812B-941457ED6CA8}']
    function functionName: NSString; cdecl;
    function url: NSURL; cdecl;
    function line: NSUInteger; cdecl;
    function column: NSUInteger; cdecl;
  end;

  MTLFunctionLog = interface(IObjectiveC)
    ['{56247B25-9F42-4F54-879F-73CF44ED17E3}']
    function &type: MTLFunctionLogType; cdecl;
    function encoderLabel: NSString; cdecl;
    function &function: Pointer; cdecl;
    function debugLocation: Pointer; cdecl;
  end;

  MTLFunctionStitchingAttribute = interface(IObjectiveC)
    ['{8A67C0AD-38BD-4429-95B2-7AC6C090CEB5}']
  end;

  MTLFunctionStitchingNode = interface(IObjectiveC)
    ['{6BD9F920-38E3-4408-98CF-95F4332E6B79}']
  end;

  MTLIOCommandBuffer = interface(IObjectiveC)
    ['{48DF3754-73AB-415B-8630-6C13CC942FA0}']
    procedure addCompletedHandler(block: MTLIOCommandBufferHandler); cdecl;
    procedure loadBytes(Pointer: Pointer; size: NSUInteger;
      sourceHandle: Pointer; sourceHandleOffset: NSUInteger); cdecl;
    procedure loadBuffer(buffer: Pointer; offset: NSUInteger; size: NSUInteger;
      sourceHandle: Pointer; sourceHandleOffset: NSUInteger); cdecl;
    procedure loadTexture(texture: Pointer; slice: NSUInteger;
      level: NSUInteger; size: MTLSize; sourceBytesPerRow: NSUInteger;
      sourceBytesPerImage: NSUInteger; destinationOrigin: MTLOrigin;
      sourceHandle: Pointer; sourceHandleOffset: NSUInteger); cdecl;
    procedure copyStatusToBuffer(buffer: Pointer; offset: NSUInteger); cdecl;
    procedure commit; cdecl;
    procedure waitUntilCompleted; cdecl;
    procedure tryCancel; cdecl;
    procedure addBarrier; cdecl;
    procedure pushDebugGroup(&string: NSString); cdecl;
    procedure popDebugGroup; cdecl;
    procedure enqueue; cdecl;
    procedure waitForEvent(event: Pointer; value: UInt64); cdecl;
    procedure signalEvent(event: Pointer; value: UInt64); cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    function status: MTLIOStatus; cdecl;
    function error: NSError; cdecl;
  end;

  MTLIOScratchBuffer = interface(IObjectiveC)
    ['{24C75BF5-9368-4810-8D02-AA48EA65330C}']
    function buffer: Pointer; cdecl;
  end;

  MTLIOScratchBufferAllocator = interface(IObjectiveC)
    ['{9F5D58DC-F758-4BB4-84C6-6AD28E548E36}']
    function newScratchBufferWithMinimumSize(minimumSize: NSUInteger)
      : Pointer; cdecl;
  end;

  // ===== Exported string consts =====

function MTLLibraryErrorDomain: Pointer;
function MTLCommonCounterTimestamp: Pointer;
function MTLCommonCounterTessellationInputPatches: Pointer;
function MTLCommonCounterVertexInvocations: Pointer;
function MTLCommonCounterPostTessellationVertexInvocations: Pointer;
function MTLCommonCounterClipperInvocations: Pointer;
function MTLCommonCounterClipperPrimitivesOut: Pointer;
function MTLCommonCounterFragmentInvocations: Pointer;
function MTLCommonCounterFragmentsPassed: Pointer;
function MTLCommonCounterComputeKernelInvocations: Pointer;
function MTLCommonCounterTotalCycles: Pointer;
function MTLCommonCounterVertexCycles: Pointer;
function MTLCommonCounterTessellationCycles: Pointer;
function MTLCommonCounterPostTessellationVertexCycles: Pointer;
function MTLCommonCounterFragmentCycles: Pointer;
function MTLCommonCounterRenderTargetWriteCycles: Pointer;
function MTLCommonCounterSetTimestamp: Pointer;
function MTLCommonCounterSetStageUtilization: Pointer;
function MTLCommonCounterSetStatistic: Pointer;
function MTLCounterErrorDomain: Pointer;
function MTLCommandBufferErrorDomain: Pointer;
function MTLCommandBufferEncoderInfoErrorKey: Pointer;
function MTLCaptureErrorDomain: Pointer;
function MTLDynamicLibraryDomain: Pointer;
function MTLBinaryArchiveDomain: Pointer;
function MTLIOErrorDomain: Pointer;


// ===== External functions =====

const
  libMetal = '/System/Library/Frameworks/Metal.framework/Metal';
function MTLOriginMake(x: NSUInteger; y: NSUInteger; z: NSUInteger): MTLOrigin;
  cdecl; external libMetal name _PU + 'MTLOriginMake';
function MTLSizeMake(width: NSUInteger; height: NSUInteger; depth: NSUInteger)
  : MTLSize; cdecl; external libMetal name _PU + 'MTLSizeMake';
function MTLRegionMake1D(x: NSUInteger; width: NSUInteger): MTLRegion; cdecl;
  external libMetal name _PU + 'MTLRegionMake1D';
function MTLRegionMake2D(x: NSUInteger; y: NSUInteger; width: NSUInteger;
  height: NSUInteger): MTLRegion; cdecl;
  external libMetal name _PU + 'MTLRegionMake2D';
function MTLRegionMake3D(x: NSUInteger; y: NSUInteger; z: NSUInteger;
  width: NSUInteger; height: NSUInteger; depth: NSUInteger): MTLRegion; cdecl;
  external libMetal name _PU + 'MTLRegionMake3D';
function MTLSamplePositionMake(x: Single; y: Single): MTLSamplePosition; cdecl;
  external libMetal name _PU + 'MTLSamplePositionMake';
function MTLCoordinate2DMake(x: Single; y: Single): MTLCoordinate2D; cdecl;
  external libMetal name _PU + 'MTLCoordinate2DMake';
function MTLTextureSwizzleChannelsMake(r: MTLTextureSwizzle;
  g: MTLTextureSwizzle; b: MTLTextureSwizzle; a: MTLTextureSwizzle)
  : MTLTextureSwizzleChannels; cdecl;
  external libMetal name _PU + 'MTLTextureSwizzleChannelsMake';
function MTLCreateSystemDefaultDevice: Pointer; cdecl;
  external libMetal name _PU + 'MTLCreateSystemDefaultDevice';
function MTLCopyAllDevices: Pointer { NSArray }; cdecl;
  external libMetal name _PU + 'MTLCopyAllDevices';
function MTLClearColorMake(red: Double; green: Double; blue: Double;
  alpha: Double): MTLClearColor; cdecl;
  external libMetal name _PU + 'MTLClearColorMake';
function MTLPackedFloat3Make(x: Single; y: Single; z: Single): MTLPackedFloat3;
  cdecl; external libMetal name _PU + 'MTLPackedFloat3Make';
function MTLIndirectCommandBufferExecutionRangeMake(location: LongWord;
  length: LongWord): MTLIndirectCommandBufferExecutionRange; cdecl;
  external libMetal name _PU + 'MTLIndirectCommandBufferExecutionRangeMake';
function MTLIOCompressionContextDefaultChunkSize: LongWord; cdecl;
  external libMetal name _PU + 'MTLIOCompressionContextDefaultChunkSize';
function MTLIOCreateCompressionContext(path: MarshaledAString;
  &type: MTLIOCompressionMethod; chunkSize: LongWord): MTLIOCompressionContext;
  cdecl; external libMetal name _PU + 'MTLIOCreateCompressionContext';
procedure MTLIOCompressionContextAppendData(context: MTLIOCompressionContext;
  data: Pointer; size: LongWord); cdecl;
  external libMetal name _PU + 'MTLIOCompressionContextAppendData';
function MTLIOFlushAndDestroyCompressionContext
  (context: MTLIOCompressionContext): MTLIOCompressionStatus; cdecl;
  external libMetal name _PU + 'MTLIOFlushAndDestroyCompressionContext';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  MetalModule: THandle;

{$ENDIF IOS}

function MTLLibraryErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLLibraryErrorDomain');
end;

function MTLCommonCounterTimestamp: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommonCounterTimestamp');
end;

function MTLCommonCounterTessellationInputPatches: Pointer;
begin
  Result := CocoaPointerConst(libMetal,
    'MTLCommonCounterTessellationInputPatches');
end;

function MTLCommonCounterVertexInvocations: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommonCounterVertexInvocations');
end;

function MTLCommonCounterPostTessellationVertexInvocations: Pointer;
begin
  Result := CocoaPointerConst(libMetal,
    'MTLCommonCounterPostTessellationVertexInvocations');
end;

function MTLCommonCounterClipperInvocations: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommonCounterClipperInvocations');
end;

function MTLCommonCounterClipperPrimitivesOut: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommonCounterClipperPrimitivesOut');
end;

function MTLCommonCounterFragmentInvocations: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommonCounterFragmentInvocations');
end;

function MTLCommonCounterFragmentsPassed: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommonCounterFragmentsPassed');
end;

function MTLCommonCounterComputeKernelInvocations: Pointer;
begin
  Result := CocoaPointerConst(libMetal,
    'MTLCommonCounterComputeKernelInvocations');
end;

function MTLCommonCounterTotalCycles: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommonCounterTotalCycles');
end;

function MTLCommonCounterVertexCycles: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommonCounterVertexCycles');
end;

function MTLCommonCounterTessellationCycles: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommonCounterTessellationCycles');
end;

function MTLCommonCounterPostTessellationVertexCycles: Pointer;
begin
  Result := CocoaPointerConst(libMetal,
    'MTLCommonCounterPostTessellationVertexCycles');
end;

function MTLCommonCounterFragmentCycles: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommonCounterFragmentCycles');
end;

function MTLCommonCounterRenderTargetWriteCycles: Pointer;
begin
  Result := CocoaPointerConst(libMetal,
    'MTLCommonCounterRenderTargetWriteCycles');
end;

function MTLCommonCounterSetTimestamp: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommonCounterSetTimestamp');
end;

function MTLCommonCounterSetStageUtilization: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommonCounterSetStageUtilization');
end;

function MTLCommonCounterSetStatistic: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommonCounterSetStatistic');
end;

function MTLCounterErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCounterErrorDomain');
end;

function MTLCommandBufferErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommandBufferErrorDomain');
end;

function MTLCommandBufferEncoderInfoErrorKey: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCommandBufferEncoderInfoErrorKey');
end;

function MTLCaptureErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLCaptureErrorDomain');
end;

function MTLDynamicLibraryDomain: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLDynamicLibraryDomain');
end;

function MTLBinaryArchiveDomain: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLBinaryArchiveDomain');
end;

function MTLIOErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libMetal, 'MTLIOErrorDomain');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MetalModule := dlopen(MarshaledAString(libMetal), RTLD_LAZY);

finalization

dlclose(MetalModule);
{$ENDIF IOS}

end.
