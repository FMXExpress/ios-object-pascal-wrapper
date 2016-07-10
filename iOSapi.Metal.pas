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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

const
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
  MTLPixelFormatRG32Uint = 103;
  MTLPixelFormatRG32Sint = 104;
  MTLPixelFormatRG32Float = 105;
  MTLPixelFormatRGBA16Unorm = 110;
  MTLPixelFormatRGBA16Snorm = 112;
  MTLPixelFormatRGBA16Uint = 113;
  MTLPixelFormatRGBA16Sint = 114;
  MTLPixelFormatRGBA16Float = 115;
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
  MTLPixelFormatGBGR422 = 240;
  MTLPixelFormatBGRG422 = 241;
  MTLPixelFormatDepth32Float = 252;
  MTLPixelFormatStencil8 = 253;
  MTLPixelFormatDepth24Unorm_Stencil8 = 255;
  MTLPixelFormatDepth32Float_Stencil8 = 260;
  MTLPurgeableStateKeepCurrent = 1;
  MTLPurgeableStateNonVolatile = 2;
  MTLPurgeableStateVolatile = 3;
  MTLPurgeableStateEmpty = 4;
  MTLCPUCacheModeDefaultCache = 0;
  MTLCPUCacheModeWriteCombined = 1;
  MTLStorageModeShared = 0;
  MTLStorageModeManaged = 1;
  MTLStorageModePrivate = 2;
  MTLResourceCPUCacheModeDefaultCache = MTLCPUCacheModeDefaultCache shl 0;
  MTLResourceCPUCacheModeWriteCombined = MTLCPUCacheModeWriteCombined shl 0;
  MTLResourceStorageModeShared = MTLStorageModeShared shl 4;
  MTLResourceStorageModeManaged = MTLStorageModeManaged shl 4;
  MTLResourceStorageModePrivate = MTLStorageModePrivate shl 4;
  MTLResourceOptionCPUCacheModeDefault = MTLResourceCPUCacheModeDefaultCache;
  MTLResourceOptionCPUCacheModeWriteCombined =
    MTLResourceCPUCacheModeWriteCombined;
  MTLTextureType1D = 0;
  MTLTextureType1DArray = 1;
  MTLTextureType2D = 2;
  MTLTextureType2DArray = 3;
  MTLTextureType2DMultisample = 4;
  MTLTextureTypeCube = 5;
  MTLTextureTypeCubeArray = 6;
  MTLTextureType3D = 7;
  MTLTextureUsageUnknown = 0;
  MTLTextureUsageShaderRead = 1;
  MTLTextureUsageShaderWrite = 2;
  MTLTextureUsageRenderTarget = 4;
  MTLTextureUsagePixelFormatView = 16;
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
  MTLCommandBufferErrorNotPermitted = 7;
  MTLCommandBufferErrorOutOfMemory = 8;
  MTLCommandBufferErrorInvalidResource = 9;
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
  MTLArgumentTypeBuffer = 0;
  MTLArgumentTypeThreadgroupMemory = 1;
  MTLArgumentTypeTexture = 2;
  MTLArgumentTypeSampler = 3;
  MTLArgumentAccessReadOnly = 0;
  MTLArgumentAccessReadWrite = 1;
  MTLArgumentAccessWriteOnly = 2;
  MTLFunctionTypeVertex = 1;
  MTLFunctionTypeFragment = 2;
  MTLFunctionTypeKernel = 3;
  MTLLanguageVersion1_0 = (1 shl 16);
  MTLLanguageVersion1_1 = (1 shl 16) + 1;
  MTLLibraryErrorUnsupported = 1;
  MTLLibraryErrorInternal = 2;
  MTLLibraryErrorCompileFailure = 3;
  MTLLibraryErrorCompileWarning = 4;
  MTLRenderPipelineErrorInternal = 1;
  MTLRenderPipelineErrorUnsupported = 2;
  MTLRenderPipelineErrorInvalidInput = 3;
  MTLFeatureSet_iOS_GPUFamily1_v1 = 0;
  MTLFeatureSet_iOS_GPUFamily2_v1 = 1;
  MTLFeatureSet_iOS_GPUFamily1_v2 = 2;
  MTLFeatureSet_iOS_GPUFamily2_v2 = 3;
  MTLFeatureSet_iOS_GPUFamily3_v1 = 4;
  MTLFeatureSet_OSX_GPUFamily1_v1 = 10000;
  MTLPipelineOptionNone = 0;
  MTLPipelineOptionArgumentInfo = 1 shl 0;
  MTLPipelineOptionBufferTypeInfo = 1 shl 1;
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
  MTLLoadActionDontCare = 0;
  MTLLoadActionLoad = 1;
  MTLLoadActionClear = 2;
  MTLStoreActionDontCare = 0;
  MTLStoreActionStore = 1;
  MTLStoreActionMultisampleResolve = 2;
  MTLMultisampleDepthResolveFilterSample0 = 0;
  MTLMultisampleDepthResolveFilterMin = 1;
  MTLMultisampleDepthResolveFilterMax = 2;
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
  MTLVertexStepFunctionConstant = 0;
  MTLVertexStepFunctionPerVertex = 1;
  MTLVertexStepFunctionPerInstance = 2;
  MTLPrimitiveTypePoint = 0;
  MTLPrimitiveTypeLine = 1;
  MTLPrimitiveTypeLineStrip = 2;
  MTLPrimitiveTypeTriangle = 3;
  MTLPrimitiveTypeTriangleStrip = 4;
  MTLIndexTypeUInt16 = 0;
  MTLIndexTypeUInt32 = 1;
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

type

  // ===== Forward declarations =====
{$M+}
  MTLDevice = interface;
  MTLCommandEncoder = interface;
  MTLResource = interface;
  MTLTextureDescriptor = interface;
  MTLTexture = interface;
  MTLBuffer = interface;
  MTLBlitCommandEncoder = interface;
  MTLCommandQueue = interface;
  MTLRenderCommandEncoder = interface;
  MTLParallelRenderCommandEncoder = interface;
  MTLComputeCommandEncoder = interface;
  MTLDrawable = interface;
  MTLCommandBuffer = interface;
  MTLRenderPassDescriptor = interface;
  MTLFunction = interface;
  MTLSamplerState = interface;
  MTLComputePipelineState = interface;
  MTLStructType = interface;
  MTLArrayType = interface;
  MTLStructMember = interface;
  MTLArgument = interface;
  MTLLibrary = interface;
  MTLCompileOptions = interface;
  MTLVertexAttribute = interface;
  MTLDepthStencilState = interface;
  MTLRenderPipelineState = interface;
  MTLSamplerDescriptor = interface;
  MTLRenderPipelineColorAttachmentDescriptor = interface;
  MTLDepthStencilDescriptor = interface;
  MTLRenderPipelineDescriptor = interface;
  MTLRenderPipelineReflection = interface;
  MTLComputePipelineDescriptor = interface;
  MTLComputePipelineReflection = interface;
  MTLStencilDescriptor = interface;
  MTLRenderPassAttachmentDescriptor = interface;
  MTLRenderPassColorAttachmentDescriptor = interface;
  MTLRenderPassDepthAttachmentDescriptor = interface;
  MTLRenderPassStencilAttachmentDescriptor = interface;
  MTLRenderPassColorAttachmentDescriptorArray = interface;
  MTLVertexDescriptor = interface;
  MTLRenderPipelineColorAttachmentDescriptorArray = interface;
  MTLVertexBufferLayoutDescriptor = interface;
  MTLVertexBufferLayoutDescriptorArray = interface;
  MTLVertexAttributeDescriptor = interface;
  MTLVertexAttributeDescriptorArray = interface;

  // ===== Framework typedefs =====
{$M+}
  NSUInteger = Cardinal;
  MTLPixelFormat = NSUInteger;
  MTLPurgeableState = NSUInteger;
  MTLCPUCacheMode = NSUInteger;
  MTLStorageMode = NSUInteger;
  MTLResourceOptions = NSUInteger;
  NSRange = _NSRange = record location: NSUInteger;
length:
NSUInteger;
end;
P_NSRange = ^_NSRange;;

MTLOrigin = record x: NSUInteger;
y:
NSUInteger;
z:
NSUInteger;
end;
PMTLOrigin = ^MTLOrigin;

MTLSize = record width: NSUInteger;
height:
NSUInteger;
depth:
NSUInteger;
end;
PMTLSize = ^MTLSize;

MTLRegion = record origin: MTLOrigin;
size:
MTLSize;
end;
PMTLRegion = ^MTLRegion;

MTLTextureType = NSUInteger;
MTLTextureUsage = NSUInteger;
MTLBlitOption = NSUInteger;
MTLCommandBufferStatus = NSUInteger;
MTLCommandBufferError = NSUInteger;
MTLCommandBufferHandler =
procedure(param1: Pointer) of object;
CFTimeInterval = Double;

MTLDispatchThreadgroupsIndirectArguments = record threadgroupsPerGrid
  : array [0 .. 2] of LongWord;
end;
PMTLDispatchThreadgroupsIndirectArguments = ^
  MTLDispatchThreadgroupsIndirectArguments;

MTLDataType = NSUInteger;
MTLArgumentType = NSUInteger;
MTLArgumentAccess = NSUInteger;
MTLFunctionType = NSUInteger;
MTLLanguageVersion = NSUInteger;
MTLLibraryError = NSUInteger;
MTLRenderPipelineError = NSUInteger;
MTLFeatureSet = NSUInteger;
MTLPipelineOption = NSUInteger;
MTLAutoreleasedRenderPipelineReflection = MTLRenderPipelineReflection;
MTLAutoreleasedComputePipelineReflection = MTLComputePipelineReflection;
MTLNewLibraryCompletionHandler =
procedure(param1: Pointer; param2: NSError) of object;
MTLNewRenderPipelineStateCompletionHandler =
procedure(param1: Pointer; param2: NSError) of object;
MTLNewRenderPipelineStateWithReflectionCompletionHandler =
procedure(param1: Pointer; param2: MTLRenderPipelineReflection; param3: NSError)
  of object;
MTLNewComputePipelineStateCompletionHandler =
procedure(param1: Pointer; param2: NSError) of object;
MTLNewComputePipelineStateWithReflectionCompletionHandler =
procedure(param1: Pointer; param2: MTLComputePipelineReflection;
  param3: NSError) of object;
TMetalDeallocator =
procedure(param1: Pointer; param2: NSUInteger) of object;
dispatch_data_t = Pointer;
MTLCompareFunction = NSUInteger;
MTLStencilOperation = NSUInteger;
MTLLoadAction = NSUInteger;
MTLStoreAction = NSUInteger;

MTLClearColor = record red: Double;
green:
Double;
blue:
Double;
alpha:
Double;
end;
PMTLClearColor = ^MTLClearColor;

MTLMultisampleDepthResolveFilter = NSUInteger;
MTLBlendFactor = NSUInteger;
MTLBlendOperation = NSUInteger;
MTLColorWriteMask = NSUInteger;
MTLVertexFormat = NSUInteger;
MTLVertexStepFunction = NSUInteger;
MTLPrimitiveType = NSUInteger;
MTLIndexType = NSUInteger;
MTLVisibilityResultMode = NSUInteger;

MTLScissorRect = record x: NSUInteger;
y:
NSUInteger;
width:
NSUInteger;
height:
NSUInteger;
end;
PMTLScissorRect = ^MTLScissorRect;

MTLViewport = record originX: Double;
originY:
Double;
width:
Double;
height:
Double;
znear:
Double;
zfar:
Double;
end;
PMTLViewport = ^MTLViewport;

MTLCullMode = NSUInteger;
MTLWinding = NSUInteger;
MTLDepthClipMode = NSUInteger;
MTLTriangleFillMode = NSUInteger;

MTLDrawPrimitivesIndirectArguments = record vertexCount: LongWord;
instanceCount:
LongWord;
vertexStart:
LongWord;
baseInstance:
LongWord;
end;
PMTLDrawPrimitivesIndirectArguments = ^MTLDrawPrimitivesIndirectArguments;

MTLDrawIndexedPrimitivesIndirectArguments = record indexCount: LongWord;
instanceCount:
LongWord;
indexStart:
LongWord;
baseVertex:
Int32;
baseInstance:
LongWord;
end;
PMTLDrawIndexedPrimitivesIndirectArguments = ^
  MTLDrawIndexedPrimitivesIndirectArguments;

NSInteger = Integer;
MTLSamplerMinMagFilter = NSUInteger;
MTLSamplerMipFilter = NSUInteger;
MTLSamplerAddressMode = NSUInteger;
// ===== Interface declarations =====

MTLTextureDescriptorClass = interface(NSObjectClass)
  ['{98F32BDB-6FC6-4149-840C-450A98AC81C6}']
{ class } function texture2DDescriptorWithPixelFormat
  (pixelFormat: MTLPixelFormat; width: NSUInteger; height: NSUInteger;
  mipmapped: Boolean): MTLTextureDescriptor;
cdecl;

{ class } function textureCubeDescriptorWithPixelFormat
  (pixelFormat: MTLPixelFormat; size: NSUInteger; mipmapped: Boolean)
  : MTLTextureDescriptor; cdecl;
end;
MTLTextureDescriptor = interface(NSObject)
  ['{0BE3402C-4E1F-4E7C-A888-6D14ADACEF0F}']
procedure setTextureType(textureType: MTLTextureType);
cdecl;

function textureType: MTLTextureType; cdecl;
  procedure setPixelFormat(pixelFormat: MTLPixelFormat); cdecl;
    function pixelFormat: MTLPixelFormat; cdecl;
      procedure setWidth(width: NSUInteger); cdecl;
        function width: NSUInteger; cdecl;
          procedure setHeight(height: NSUInteger); cdecl;
            function height: NSUInteger; cdecl;
              procedure setDepth(depth: NSUInteger); cdecl;
                function depth: NSUInteger; cdecl;
                  procedure setMipmapLevelCount(mipmapLevelCount
                    : NSUInteger); cdecl;
                    function mipmapLevelCount: NSUInteger; cdecl;
                      procedure setSampleCount(sampleCount: NSUInteger); cdecl;
                        function sampleCount: NSUInteger; cdecl;
                          procedure setArrayLength
                            (arrayLength: NSUInteger); cdecl;
                            function arrayLength: NSUInteger; cdecl;
                              procedure setResourceOptions(resourceOptions
                                : MTLResourceOptions); cdecl;
                                function resourceOptions
                                  : MTLResourceOptions; cdecl;
                                  procedure setCpuCacheMode
                                    (cpuCacheMode: MTLCPUCacheMode); cdecl;
                                    function cpuCacheMode
                                      : MTLCPUCacheMode; cdecl;
                                      procedure setStorageMode
                                        (storageMode: MTLStorageMode); cdecl;
                                        function storageMode
                                        : MTLStorageMode; cdecl;
                                        procedure setUsage
                                        (usage: MTLTextureUsage); cdecl;
                                        function usage: MTLTextureUsage; cdecl;
                                        end;

                                        TMTLTextureDescriptor = class
                                        (TOCGenericImport<
                                        MTLTextureDescriptorClass,
                                        MTLTextureDescriptor>)
                                        end;
                                    PMTLTextureDescriptor = Pointer;

                                    MTLRenderPassDescriptorClass = interface
                                      (NSObjectClass)
                                      ['{94CCF5AA-B1F8-48F6-B6E4-D2CA2CAAD7DB}']
                                    { class } function renderPassDescriptor
                                      : MTLRenderPassDescriptor;
                                    cdecl;
                                    end;
                                MTLRenderPassDescriptor = interface(NSObject)
                                  ['{9DD98040-5913-4082-8F33-10530FB427F1}']
                                function colorAttachments
                                  : MTLRenderPassColorAttachmentDescriptorArray;
                                cdecl;
                                  procedure setDepthAttachment(depthAttachment
                                    : MTLRenderPassDepthAttachmentDescriptor);
                                    cdecl;
                                    function depthAttachment
                                      : MTLRenderPassDepthAttachmentDescriptor;
                                      cdecl;
                                      procedure setStencilAttachment
                                        (stencilAttachment
                                        : MTLRenderPassStencilAttachmentDescriptor);
                                        cdecl;
                                        function stencilAttachment
                                        : MTLRenderPassStencilAttachmentDescriptor;
                                        cdecl;
                                        procedure setVisibilityResultBuffer
                                        (visibilityResultBuffer
                                        : Pointer); cdecl;
                                        function visibilityResultBuffer
                                        : Pointer; cdecl;
                                        end;

                                        TMTLRenderPassDescriptor = class
                                        (TOCGenericImport<
                                        MTLRenderPassDescriptorClass,
                                        MTLRenderPassDescriptor>)
                                        end;
                                    PMTLRenderPassDescriptor = Pointer;

                                    MTLStructTypeClass = interface
                                      (NSObjectClass)
                                      ['{96E2A923-0C04-4969-B043-83E7B59D394B}']
                                    end;
                                MTLStructType = interface(NSObject)
                                  ['{00171E95-A848-4AAC-A7F4-A2346B138235}']
                                function members: NSArray;
                                cdecl;
                                  function memberByName(name: NSString)
                                    : MTLStructMember; cdecl;
                                  end;

                              TMTLStructType = class
                                (TOCGenericImport<MTLStructTypeClass,
                                MTLStructType>)
                              end;
                          PMTLStructType = Pointer;

                          MTLArrayTypeClass = interface(NSObjectClass)
                            ['{5188CBDF-DD30-4B41-8C00-9434ABE22F92}']
                          end;
                      MTLArrayType = interface(NSObject)
                        ['{74906CE0-F7BC-406C-B8C5-43D246A46D8F}']
                      function arrayLength: NSUInteger;
                      cdecl;
                        function elementType: MTLDataType; cdecl;
                          function stride: NSUInteger; cdecl;
                            function elementStructType: MTLStructType; cdecl;
                              function elementArrayType: MTLArrayType; cdecl;
                              end;

                          TMTLArrayType = class
                            (TOCGenericImport<MTLArrayTypeClass, MTLArrayType>)
                          end;
                      PMTLArrayType = Pointer;

                      MTLStructMemberClass = interface(NSObjectClass)
                        ['{1F21AC88-F3D1-4982-83ED-365EB203F360}']
                      end;
                  MTLStructMember = interface(NSObject)
                    ['{96731CF7-AE45-462F-83FA-C526A9304FD3}']
                  function name: NSString;
                  cdecl;
                    function offset: NSUInteger; cdecl;
                      function dataType: MTLDataType; cdecl;
                        function structType: MTLStructType; cdecl;
                          function arrayType: MTLArrayType; cdecl;
                          end;

                      TMTLStructMember = class
                        (TOCGenericImport<MTLStructMemberClass,
                        MTLStructMember>)
                      end;
                  PMTLStructMember = Pointer;

                  MTLArgumentClass = interface(NSObjectClass)
                    ['{CD7C4860-2B3C-4A5A-9F97-97DFD9E6698C}']
                  end;
              MTLArgument = interface(NSObject)
                ['{12E90C95-0BD2-4F87-A60B-F4517D5B17A0}']
              function name: NSString;
              cdecl;
                function &type: MTLArgumentType; cdecl;
                  function access: MTLArgumentAccess; cdecl;
                    function index: NSUInteger; cdecl;
                      function isActive: Boolean; cdecl;
                        function bufferAlignment: NSUInteger; cdecl;
                          function bufferDataSize: NSUInteger; cdecl;
                            function bufferDataType: MTLDataType; cdecl;
                              function bufferStructType: MTLStructType; cdecl;
                                function threadgroupMemoryAlignment
                                  : NSUInteger; cdecl;
                                  function threadgroupMemoryDataSize
                                    : NSUInteger; cdecl;
                                    function textureType: MTLTextureType; cdecl;
                                      function textureDataType
                                        : MTLDataType; cdecl;
                                      end;

                                  TMTLArgument = class
                                    (TOCGenericImport<MTLArgumentClass,
                                    MTLArgument>)
                                  end;
                              PMTLArgument = Pointer;

                              MTLCompileOptionsClass = interface(NSObjectClass)
                                ['{C6ECFFC0-5C4C-4050-AE86-CE09BF69F549}']
                              end;
                          MTLCompileOptions = interface(NSObject)
                            ['{5027E76A-7E46-48A5-A723-110120E3BC38}']
                          procedure setPreprocessorMacros(preprocessorMacros
                            : NSDictionary);
                          cdecl;
                            function preprocessorMacros: NSDictionary; cdecl;
                              procedure setFastMathEnabled(fastMathEnabled
                                : Boolean); cdecl;
                                function fastMathEnabled: Boolean; cdecl;
                                  procedure setLanguageVersion(languageVersion
                                    : MTLLanguageVersion); cdecl;
                                    function languageVersion
                                      : MTLLanguageVersion; cdecl;
                                    end;

                                TMTLCompileOptions = class
                                  (TOCGenericImport<MTLCompileOptionsClass,
                                  MTLCompileOptions>)
                                end;
                            PMTLCompileOptions = Pointer;

                            MTLVertexAttributeClass = interface(NSObjectClass)
                              ['{8C658B44-49BF-44DC-851A-BC9221D7462A}']
                            end;
                        MTLVertexAttribute = interface(NSObject)
                          ['{34735985-D32A-4C7C-A0E9-F9D8FB633098}']
                        function name: NSString;
                        cdecl;
                          function attributeIndex: NSUInteger; cdecl;
                            function attributeType: MTLDataType; cdecl;
                              function isActive: Boolean; cdecl;
                              end;

                          TMTLVertexAttribute = class
                            (TOCGenericImport<MTLVertexAttributeClass,
                            MTLVertexAttribute>)
                          end;
                      PMTLVertexAttribute = Pointer;

                      MTLSamplerDescriptorClass = interface(NSObjectClass)
                        ['{9579D457-DC88-42D7-B00C-BD22111F8FDB}']
                      end;
                  MTLSamplerDescriptor = interface(NSObject)
                    ['{B9713FAA-F74E-4999-81A1-B2B34B5DBE60}']
                  procedure setMinFilter(minFilter: MTLSamplerMinMagFilter);
                  cdecl;
                    function minFilter: MTLSamplerMinMagFilter; cdecl;
                      procedure setMagFilter
                        (magFilter: MTLSamplerMinMagFilter); cdecl;
                        function magFilter: MTLSamplerMinMagFilter; cdecl;
                          procedure setMipFilter
                            (mipFilter: MTLSamplerMipFilter); cdecl;
                            function mipFilter: MTLSamplerMipFilter; cdecl;
                              procedure setMaxAnisotropy(maxAnisotropy
                                : NSUInteger); cdecl;
                                function maxAnisotropy: NSUInteger; cdecl;
                                  procedure setSAddressMode
                                    (sAddressMode
                                    : MTLSamplerAddressMode); cdecl;
                                    function sAddressMode
                                      : MTLSamplerAddressMode; cdecl;
                                      procedure setTAddressMode
                                        (tAddressMode
                                        : MTLSamplerAddressMode); cdecl;
                                        function tAddressMode
                                        : MTLSamplerAddressMode; cdecl;
                                        procedure setRAddressMode
                                        (rAddressMode
                                        : MTLSamplerAddressMode); cdecl;
                                        function rAddressMode
                                        : MTLSamplerAddressMode; cdecl;
                                        procedure setNormalizedCoordinates
                                        (normalizedCoordinates: Boolean); cdecl;
                                        function normalizedCoordinates
                                        : Boolean; cdecl;
                                        procedure setLodMinClamp
                                        (lodMinClamp: Single); cdecl;
                                        function lodMinClamp: Single; cdecl;
                                        procedure setLodMaxClamp
                                        (lodMaxClamp: Single); cdecl;
                                        function lodMaxClamp: Single; cdecl;
                                        procedure setLodAverage
                                        (lodAverage: Boolean); cdecl;
                                        function lodAverage: Boolean; cdecl;
                                        procedure setCompareFunction
                                        (compareFunction
                                        : MTLCompareFunction); cdecl;
                                        function compareFunction
                                        : MTLCompareFunction; cdecl;
                                        procedure setLabel
                                        (&label: NSString); cdecl;
                                        function &label: NSString; cdecl;
                                        end;

                                        TMTLSamplerDescriptor = class
                                        (TOCGenericImport<
                                        MTLSamplerDescriptorClass,
                                        MTLSamplerDescriptor>)
                                        end;
                                        PMTLSamplerDescriptor = Pointer;

                                        MTLRenderPipelineColorAttachmentDescriptorClass =
                                        interface(NSObjectClass)
                                        ['{B5B502CF-E7CA-4DB8-90FF-D04D8EC92EC6}']
                                        end;
                                        MTLRenderPipelineColorAttachmentDescriptor =
                                        interface(NSObject)
                                        ['{D70587A1-30B2-4067-AD8F-0036751C8CAA}']
                                        procedure setPixelFormat
                                        (pixelFormat: MTLPixelFormat);
                                        cdecl;
                                        function pixelFormat
                                        : MTLPixelFormat; cdecl;
                                        procedure setBlendingEnabled
                                        (blendingEnabled: Boolean); cdecl;
                                        function isBlendingEnabled
                                        : Boolean; cdecl;
                                        procedure setSourceRGBBlendFactor
                                        (sourceRGBBlendFactor
                                        : MTLBlendFactor); cdecl;
                                        function sourceRGBBlendFactor
                                        : MTLBlendFactor; cdecl;
                                        procedure setDestinationRGBBlendFactor
                                        (destinationRGBBlendFactor
                                        : MTLBlendFactor); cdecl;
                                        function destinationRGBBlendFactor
                                        : MTLBlendFactor; cdecl;
                                        procedure setRgbBlendOperation
                                        (rgbBlendOperation
                                        : MTLBlendOperation); cdecl;
                                        function rgbBlendOperation
                                        : MTLBlendOperation; cdecl;
                                        procedure setSourceAlphaBlendFactor
                                        (sourceAlphaBlendFactor
                                        : MTLBlendFactor); cdecl;
                                        function sourceAlphaBlendFactor
                                        : MTLBlendFactor; cdecl;
                                        procedure setDestinationAlphaBlendFactor
                                        (destinationAlphaBlendFactor
                                        : MTLBlendFactor); cdecl;
                                        function destinationAlphaBlendFactor
                                        : MTLBlendFactor; cdecl;
                                        procedure setAlphaBlendOperation
                                        (alphaBlendOperation
                                        : MTLBlendOperation); cdecl;
                                        function alphaBlendOperation
                                        : MTLBlendOperation; cdecl;
                                        procedure setWriteMask
                                        (writeMask: MTLColorWriteMask); cdecl;
                                        function writeMask
                                        : MTLColorWriteMask; cdecl;
                                        end;

                                        TMTLRenderPipelineColorAttachmentDescriptor =
                                        class(TOCGenericImport<
                                        MTLRenderPipelineColorAttachmentDescriptorClass,
                                        MTLRenderPipelineColorAttachmentDescriptor>)
                                        end;
                                        PMTLRenderPipelineColorAttachmentDescriptor =
                                        Pointer;

                                        MTLDepthStencilDescriptorClass =
                                        interface(NSObjectClass)
                                        ['{D832A62A-977E-4E21-B4E6-2BE86F52F252}']
                                        end;
                                        MTLDepthStencilDescriptor = interface
                                        (NSObject)
                                        ['{42D48FA1-6F9C-44AA-BF41-077DA8740FCA}']
                                        procedure setDepthCompareFunction
                                        (depthCompareFunction
                                        : MTLCompareFunction);
                                        cdecl;
                                        function depthCompareFunction
                                        : MTLCompareFunction; cdecl;
                                        procedure setDepthWriteEnabled
                                        (depthWriteEnabled: Boolean); cdecl;
                                        function isDepthWriteEnabled
                                        : Boolean; cdecl;
                                        procedure setFrontFaceStencil
                                        (frontFaceStencil
                                        : MTLStencilDescriptor); cdecl;
                                        function frontFaceStencil
                                        : MTLStencilDescriptor; cdecl;
                                        procedure setBackFaceStencil
                                        (backFaceStencil
                                        : MTLStencilDescriptor); cdecl;
                                        function backFaceStencil
                                        : MTLStencilDescriptor; cdecl;
                                        procedure setLabel
                                        (&label: NSString); cdecl;
                                        function &label: NSString; cdecl;
                                        end;

                                        TMTLDepthStencilDescriptor = class
                                        (TOCGenericImport<
                                        MTLDepthStencilDescriptorClass,
                                        MTLDepthStencilDescriptor>)
                                        end;
                                        PMTLDepthStencilDescriptor = Pointer;

                                        MTLRenderPipelineDescriptorClass =
                                        interface(NSObjectClass)
                                        ['{04CEA86A-AB2A-46B9-BE99-AF544A9EF4E9}']
                                        end;
                                        MTLRenderPipelineDescriptor = interface
                                        (NSObject)
                                        ['{DCD7779D-5E30-46AF-BDD9-8F001816C44D}']
                                        procedure setLabel(&label: NSString);
                                        cdecl;
                                        function &label: NSString; cdecl;
                                        procedure setVertexFunction
                                        (vertexFunction: Pointer); cdecl;
                                        function vertexFunction: Pointer; cdecl;
                                        procedure setFragmentFunction
                                        (fragmentFunction: Pointer); cdecl;
                                        function fragmentFunction
                                        : Pointer; cdecl;
                                        procedure setVertexDescriptor
                                        (vertexDescriptor
                                        : MTLVertexDescriptor); cdecl;
                                        function vertexDescriptor
                                        : MTLVertexDescriptor; cdecl;
                                        procedure setSampleCount
                                        (sampleCount: NSUInteger); cdecl;
                                        function sampleCount: NSUInteger; cdecl;
                                        procedure setAlphaToCoverageEnabled
                                        (alphaToCoverageEnabled
                                        : Boolean); cdecl;
                                        function isAlphaToCoverageEnabled
                                        : Boolean; cdecl;
                                        procedure setAlphaToOneEnabled
                                        (alphaToOneEnabled: Boolean); cdecl;
                                        function isAlphaToOneEnabled
                                        : Boolean; cdecl;
                                        procedure setRasterizationEnabled
                                        (rasterizationEnabled: Boolean); cdecl;
                                        function isRasterizationEnabled
                                        : Boolean; cdecl;
                                        function colorAttachments
                                        : MTLRenderPipelineColorAttachmentDescriptorArray;
                                        cdecl;
                                        procedure setDepthAttachmentPixelFormat
                                        (depthAttachmentPixelFormat
                                        : MTLPixelFormat); cdecl;
                                        function depthAttachmentPixelFormat
                                        : MTLPixelFormat; cdecl;
                                        procedure setStencilAttachmentPixelFormat
                                        (stencilAttachmentPixelFormat
                                        : MTLPixelFormat); cdecl;
                                        function stencilAttachmentPixelFormat
                                        : MTLPixelFormat; cdecl;
                                        procedure reset; cdecl;
                                        end;

                                        TMTLRenderPipelineDescriptor = class
                                        (TOCGenericImport<
                                        MTLRenderPipelineDescriptorClass,
                                        MTLRenderPipelineDescriptor>)
                                        end;
                                        PMTLRenderPipelineDescriptor = Pointer;

                                        MTLRenderPipelineReflectionClass =
                                        interface(NSObjectClass)
                                        ['{B0418C30-9D07-4392-90B5-03237F4E4EA3}']
                                        end;
                                        MTLRenderPipelineReflection = interface
                                        (NSObject)
                                        ['{EE1796CD-D46E-4CA2-8E03-B90837DF277F}']
                                        function vertexArguments: NSArray;
                                        cdecl;
                                        function fragmentArguments
                                        : NSArray; cdecl;
                                        end;

                                        TMTLRenderPipelineReflection = class
                                        (TOCGenericImport<
                                        MTLRenderPipelineReflectionClass,
                                        MTLRenderPipelineReflection>)
                                        end;
                                        PMTLRenderPipelineReflection = Pointer;

                                        MTLComputePipelineDescriptorClass =
                                        interface(NSObjectClass)
                                        ['{144997CA-0707-47A2-B287-CEB7813650D3}']
                                        end;
                                        MTLComputePipelineDescriptor = interface
                                        (NSObject)
                                        ['{02F54B14-2B08-423C-B71B-AD86D223A50F}']
                                        procedure setLabel(&label: NSString);
                                        cdecl;
                                        function &label: NSString; cdecl;
                                        procedure setComputeFunction
                                        (computeFunction: Pointer); cdecl;
                                        function computeFunction
                                        : Pointer; cdecl;
                                        procedure setThreadGroupSizeIsMultipleOfThreadExecutionWidth
                                        (threadGroupSizeIsMultipleOfThreadExecutionWidth
                                        : Boolean); cdecl;
                                        function threadGroupSizeIsMultipleOfThreadExecutionWidth
                                        : Boolean; cdecl;
                                        procedure reset; cdecl;
                                        end;

                                        TMTLComputePipelineDescriptor = class
                                        (TOCGenericImport<
                                        MTLComputePipelineDescriptorClass,
                                        MTLComputePipelineDescriptor>)
                                        end;
                                        PMTLComputePipelineDescriptor = Pointer;

                                        MTLComputePipelineReflectionClass =
                                        interface(NSObjectClass)
                                        ['{C68BD126-1D82-4C21-B545-8EA6C30655BB}']
                                        end;
                                        MTLComputePipelineReflection = interface
                                        (NSObject)
                                        ['{B9122029-E562-4E0F-AE1B-F1C5494C1731}']
                                        function arguments: NSArray;
                                        cdecl;
                                        end;

                                        TMTLComputePipelineReflection = class
                                        (TOCGenericImport<
                                        MTLComputePipelineReflectionClass,
                                        MTLComputePipelineReflection>)
                                        end;
                                        PMTLComputePipelineReflection = Pointer;

                                        MTLStencilDescriptorClass = interface
                                        (NSObjectClass)
                                        ['{F692D8B8-27B7-4B7F-9CB5-5C89EAB97DDF}']
                                        end;
                                        MTLStencilDescriptor = interface
                                        (NSObject)
                                        ['{1CE4DCC2-A0E5-40A2-8A4B-0277A468D609}']
                                        procedure setStencilCompareFunction
                                        (stencilCompareFunction
                                        : MTLCompareFunction);
                                        cdecl;
                                        function stencilCompareFunction
                                        : MTLCompareFunction; cdecl;
                                        procedure setStencilFailureOperation
                                        (stencilFailureOperation
                                        : MTLStencilOperation); cdecl;
                                        function stencilFailureOperation
                                        : MTLStencilOperation; cdecl;
                                        procedure setDepthFailureOperation
                                        (depthFailureOperation
                                        : MTLStencilOperation); cdecl;
                                        function depthFailureOperation
                                        : MTLStencilOperation; cdecl;
                                        procedure setDepthStencilPassOperation
                                        (depthStencilPassOperation
                                        : MTLStencilOperation); cdecl;
                                        function depthStencilPassOperation
                                        : MTLStencilOperation; cdecl;
                                        procedure setReadMask
                                        (readMask: LongWord); cdecl;
                                        function readMask: LongWord; cdecl;
                                        procedure setWriteMask
                                        (writeMask: LongWord); cdecl;
                                        function writeMask: LongWord; cdecl;
                                        end;

                                        TMTLStencilDescriptor = class
                                        (TOCGenericImport<
                                        MTLStencilDescriptorClass,
                                        MTLStencilDescriptor>)
                                        end;
                                        PMTLStencilDescriptor = Pointer;

                                        MTLRenderPassAttachmentDescriptorClass =
                                        interface(NSObjectClass)
                                        ['{99B5DD45-240C-428F-A8C3-6C57264BE11D}']
                                        end;
                                        MTLRenderPassAttachmentDescriptor =
                                        interface(NSObject)
                                        ['{01BBC3C4-A2D4-47FF-B731-5F3A41CD14A3}']
                                        procedure setTexture(texture: Pointer);
                                        cdecl;
                                        function texture: Pointer; cdecl;
                                        procedure setLevel
                                        (level: NSUInteger); cdecl;
                                        function level: NSUInteger; cdecl;
                                        procedure setSlice
                                        (slice: NSUInteger); cdecl;
                                        function slice: NSUInteger; cdecl;
                                        procedure setDepthPlane
                                        (depthPlane: NSUInteger); cdecl;
                                        function depthPlane: NSUInteger; cdecl;
                                        procedure setResolveTexture
                                        (resolveTexture: Pointer); cdecl;
                                        function resolveTexture: Pointer; cdecl;
                                        procedure setResolveLevel
                                        (resolveLevel: NSUInteger); cdecl;
                                        function resolveLevel
                                        : NSUInteger; cdecl;
                                        procedure setResolveSlice
                                        (resolveSlice: NSUInteger); cdecl;
                                        function resolveSlice
                                        : NSUInteger; cdecl;
                                        procedure setResolveDepthPlane
                                        (resolveDepthPlane: NSUInteger); cdecl;
                                        function resolveDepthPlane
                                        : NSUInteger; cdecl;
                                        procedure setLoadAction
                                        (loadAction: MTLLoadAction); cdecl;
                                        function loadAction
                                        : MTLLoadAction; cdecl;
                                        procedure setStoreAction
                                        (storeAction: MTLStoreAction); cdecl;
                                        function storeAction
                                        : MTLStoreAction; cdecl;
                                        end;

                                        TMTLRenderPassAttachmentDescriptor =
                                        class(TOCGenericImport<
                                        MTLRenderPassAttachmentDescriptorClass,
                                        MTLRenderPassAttachmentDescriptor>)
                                        end;
                                        PMTLRenderPassAttachmentDescriptor =
                                        Pointer;

                                        MTLRenderPassColorAttachmentDescriptorClass =
                                        interface(
                                        MTLRenderPassAttachmentDescriptorClass)
                                        ['{5DA37822-C43B-4261-B81E-277EE5FC1D0C}']
                                        end;
                                        MTLRenderPassColorAttachmentDescriptor =
                                        interface(
                                        MTLRenderPassAttachmentDescriptor)
                                        ['{BA224361-554F-4210-B6E3-313E9C4E6465}']
                                        procedure setClearColor
                                        (clearColor: MTLClearColor);
                                        cdecl;
                                        function clearColor
                                        : MTLClearColor; cdecl;
                                        end;

                                        TMTLRenderPassColorAttachmentDescriptor =
                                        class(TOCGenericImport<
                                        MTLRenderPassColorAttachmentDescriptorClass,
                                        MTLRenderPassColorAttachmentDescriptor>)
                                        end;
                                        PMTLRenderPassColorAttachmentDescriptor =
                                        Pointer;

                                        MTLRenderPassDepthAttachmentDescriptorClass =
                                        interface(
                                        MTLRenderPassAttachmentDescriptorClass)
                                        ['{7142DCE9-2BE7-4550-B52C-1DA91D7BDD4E}']
                                        end;
                                        MTLRenderPassDepthAttachmentDescriptor =
                                        interface(
                                        MTLRenderPassAttachmentDescriptor)
                                        ['{50E2BDB1-46EC-4DAB-A146-D4931193AC6B}']
                                        procedure setClearDepth
                                        (clearDepth: Double);
                                        cdecl;
                                        function clearDepth: Double; cdecl;
                                        procedure setDepthResolveFilter
                                        (depthResolveFilter
                                        : MTLMultisampleDepthResolveFilter);
                                        cdecl;
                                        function depthResolveFilter
                                        : MTLMultisampleDepthResolveFilter;
                                        cdecl;
                                        end;

                                        TMTLRenderPassDepthAttachmentDescriptor =
                                        class(TOCGenericImport<
                                        MTLRenderPassDepthAttachmentDescriptorClass,
                                        MTLRenderPassDepthAttachmentDescriptor>)
                                        end;
                                        PMTLRenderPassDepthAttachmentDescriptor =
                                        Pointer;

                                        MTLRenderPassStencilAttachmentDescriptorClass =
                                        interface(
                                        MTLRenderPassAttachmentDescriptorClass)
                                        ['{B9B48F01-8787-4069-9EA8-88216B8A2EB1}']
                                        end;
                                        MTLRenderPassStencilAttachmentDescriptor =
                                        interface(
                                        MTLRenderPassAttachmentDescriptor)
                                        ['{9AF75B34-15D3-429F-B60F-1430D04B841B}']
                                        procedure setClearStencil
                                        (clearStencil: LongWord);
                                        cdecl;
                                        function clearStencil: LongWord; cdecl;
                                        end;

                                        TMTLRenderPassStencilAttachmentDescriptor =
                                        class(TOCGenericImport<
                                        MTLRenderPassStencilAttachmentDescriptorClass,
                                        MTLRenderPassStencilAttachmentDescriptor>)
                                        end;
                                        PMTLRenderPassStencilAttachmentDescriptor =
                                        Pointer;

                                        MTLRenderPassColorAttachmentDescriptorArrayClass =
                                        interface(NSObjectClass)
                                        ['{29658011-D743-4B64-BAE8-8F4AA415DF3E}']
                                        end;
                                        MTLRenderPassColorAttachmentDescriptorArray =
                                        interface(NSObject)
                                        ['{90000A95-91D7-4435-8996-68B79C849C93}']
                                        function objectAtIndexedSubscript
                                        (attachmentIndex: NSUInteger)
                                        : MTLRenderPassColorAttachmentDescriptor;
                                        cdecl;
                                        procedure setObject
                                        (attachment
                                        : MTLRenderPassColorAttachmentDescriptor;
                                        atIndexedSubscript: NSUInteger); cdecl;
                                        end;

                                        TMTLRenderPassColorAttachmentDescriptorArray =
                                        class(TOCGenericImport<
                                        MTLRenderPassColorAttachmentDescriptorArrayClass,
                                        MTLRenderPassColorAttachmentDescriptorArray>)
                                        end;
                                        PMTLRenderPassColorAttachmentDescriptorArray =
                                        Pointer;

                                        MTLVertexDescriptorClass = interface
                                        (NSObjectClass)
                                        ['{706BE7D4-4431-4003-B49C-FA923E1FD367}']
                                        { class } function vertexDescriptor
                                        : MTLVertexDescriptor;
                                        cdecl;
                                        end;
                                        MTLVertexDescriptor = interface
                                        (NSObject)
                                        ['{22A4179D-E591-4C1E-8D01-A5A134BBEF39}']
                                        function layouts
                                        : MTLVertexBufferLayoutDescriptorArray;
                                        cdecl;
                                        function attributes
                                        : MTLVertexAttributeDescriptorArray;
                                        cdecl;
                                        procedure reset; cdecl;
                                        end;

                                        TMTLVertexDescriptor = class
                                        (TOCGenericImport<
                                        MTLVertexDescriptorClass,
                                        MTLVertexDescriptor>)
                                        end;
                                        PMTLVertexDescriptor = Pointer;

                                        MTLRenderPipelineColorAttachmentDescriptorArrayClass =
                                        interface(NSObjectClass)
                                        ['{0616239D-6919-4C25-B25B-EE48FDAB11E7}']
                                        end;
                                        MTLRenderPipelineColorAttachmentDescriptorArray =
                                        interface(NSObject)
                                        ['{81F66621-B1A4-4183-AAEB-E7E57BB6F37A}']
                                        function objectAtIndexedSubscript
                                        (attachmentIndex: NSUInteger)
                                        : MTLRenderPipelineColorAttachmentDescriptor;
                                        cdecl;
                                        procedure setObject
                                        (attachment
                                        : MTLRenderPipelineColorAttachmentDescriptor;
                                        atIndexedSubscript: NSUInteger); cdecl;
                                        end;

                                        TMTLRenderPipelineColorAttachmentDescriptorArray =
                                        class(TOCGenericImport<
                                        MTLRenderPipelineColorAttachmentDescriptorArrayClass,
                                        MTLRenderPipelineColorAttachmentDescriptorArray>)
                                        end;
                                        PMTLRenderPipelineColorAttachmentDescriptorArray =
                                        Pointer;

                                        MTLVertexBufferLayoutDescriptorClass =
                                        interface(NSObjectClass)
                                        ['{C2E1BEC7-3A13-4781-8E06-0EF3BBF351C5}']
                                        end;
                                        MTLVertexBufferLayoutDescriptor =
                                        interface(NSObject)
                                        ['{99002E47-3A3C-4EB2-8D13-5091C2655D0B}']
                                        procedure setStride(stride: NSUInteger);
                                        cdecl;
                                        function stride: NSUInteger; cdecl;
                                        procedure setStepFunction
                                        (stepFunction
                                        : MTLVertexStepFunction); cdecl;
                                        function stepFunction
                                        : MTLVertexStepFunction; cdecl;
                                        procedure setStepRate
                                        (stepRate: NSUInteger); cdecl;
                                        function stepRate: NSUInteger; cdecl;
                                        end;

                                        TMTLVertexBufferLayoutDescriptor = class
                                        (TOCGenericImport<
                                        MTLVertexBufferLayoutDescriptorClass,
                                        MTLVertexBufferLayoutDescriptor>)
                                        end;
                                        PMTLVertexBufferLayoutDescriptor =
                                        Pointer;

                                        MTLVertexBufferLayoutDescriptorArrayClass =
                                        interface(NSObjectClass)
                                        ['{55C21426-E8DF-4ADC-9E43-9FD9B68192C4}']
                                        end;
                                        MTLVertexBufferLayoutDescriptorArray =
                                        interface(NSObject)
                                        ['{F62ED405-BC4A-49D7-9D56-07694A578514}']
                                        function objectAtIndexedSubscript
                                        (index: NSUInteger)
                                        : MTLVertexBufferLayoutDescriptor;
                                        cdecl;
                                        procedure setObject
                                        (bufferDesc
                                        : MTLVertexBufferLayoutDescriptor;
                                        atIndexedSubscript: NSUInteger); cdecl;
                                        end;

                                        TMTLVertexBufferLayoutDescriptorArray =
                                        class(TOCGenericImport<
                                        MTLVertexBufferLayoutDescriptorArrayClass,
                                        MTLVertexBufferLayoutDescriptorArray>)
                                        end;
                                        PMTLVertexBufferLayoutDescriptorArray =
                                        Pointer;

                                        MTLVertexAttributeDescriptorClass =
                                        interface(NSObjectClass)
                                        ['{C314DEA7-0D34-4E82-B73F-00786E712616}']
                                        end;
                                        MTLVertexAttributeDescriptor = interface
                                        (NSObject)
                                        ['{0809A76A-BE4F-4821-8C03-0AD40C3A0ABE}']
                                        procedure setFormat
                                        (format: MTLVertexFormat);
                                        cdecl;
                                        function format: MTLVertexFormat; cdecl;
                                        procedure setOffset
                                        (offset: NSUInteger); cdecl;
                                        function offset: NSUInteger; cdecl;
                                        procedure setBufferIndex
                                        (bufferIndex: NSUInteger); cdecl;
                                        function bufferIndex: NSUInteger; cdecl;
                                        end;

                                        TMTLVertexAttributeDescriptor = class
                                        (TOCGenericImport<
                                        MTLVertexAttributeDescriptorClass,
                                        MTLVertexAttributeDescriptor>)
                                        end;
                                        PMTLVertexAttributeDescriptor = Pointer;

                                        MTLVertexAttributeDescriptorArrayClass =
                                        interface(NSObjectClass)
                                        ['{A201E04B-3D21-4328-8107-DB637E48D2D7}']
                                        end;
                                        MTLVertexAttributeDescriptorArray =
                                        interface(NSObject)
                                        ['{EA51873C-B623-453A-A77A-84DDE6C96005}']
                                        function objectAtIndexedSubscript
                                        (index: NSUInteger)
                                        : MTLVertexAttributeDescriptor;
                                        cdecl;
                                        procedure setObject
                                        (attributeDesc
                                        : MTLVertexAttributeDescriptor;
                                        atIndexedSubscript: NSUInteger); cdecl;
                                        end;

                                        TMTLVertexAttributeDescriptorArray =
                                        class(TOCGenericImport<
                                        MTLVertexAttributeDescriptorArrayClass,
                                        MTLVertexAttributeDescriptorArray>)
                                        end;
                                        PMTLVertexAttributeDescriptorArray =
                                        Pointer;

                                        // ===== Protocol declarations =====

                                        MTLDevice = interface(IObjectiveC)
                                        ['{1D7A1880-07AF-4B5F-83E7-FF22C97C25F5}']
                                        function name: NSString;
                                        cdecl;
                                        function maxThreadsPerThreadgroup
                                        : MTLSize; cdecl;
                                        function isLowPower: Boolean; cdecl;
                                        function isHeadless: Boolean; cdecl;
                                        function isDepth24Stencil8PixelFormatSupported
                                        : Boolean; cdecl;
                                        function newCommandQueue
                                        : Pointer; cdecl;
                                        function newCommandQueueWithMaxCommandBufferCount
                                        (maxCommandBufferCount: NSUInteger)
                                        : Pointer; cdecl;
                                        function newBufferWithLength
                                        (length: NSUInteger;
                                        options: MTLResourceOptions)
                                        : Pointer; cdecl;
                                        function newBufferWithBytes
                                        (Pointer: Pointer; length: NSUInteger;
                                        options: MTLResourceOptions)
                                        : Pointer; cdecl;
                                        function newBufferWithBytesNoCopy
                                        (Pointer: Pointer; length: NSUInteger;
                                        options: MTLResourceOptions;
                                        deallocator: TMetalDeallocator)
                                        : Pointer; cdecl;
                                        function newDepthStencilStateWithDescriptor
                                        (descriptor: MTLDepthStencilDescriptor)
                                        : Pointer; cdecl;
                                        function newTextureWithDescriptor
                                        (descriptor: MTLTextureDescriptor)
                                        : Pointer; cdecl;
                                        function newSamplerStateWithDescriptor
                                        (descriptor: MTLSamplerDescriptor)
                                        : Pointer; cdecl;
                                        function newDefaultLibrary
                                        : Pointer; cdecl;
                                        function newLibraryWithFile
                                        (filepath: NSString; error: NSError)
                                        : Pointer; cdecl;
                                        function newLibraryWithData
                                        (data: dispatch_data_t; error: NSError)
                                        : Pointer; cdecl;
                                        [MethodName
                                        ('newLibraryWithSource:options:error:')]
                                        function newLibraryWithSourceOptionsError
                                        (source: NSString;
                                        options: MTLCompileOptions;
                                        error: NSError): Pointer; cdecl;
                                        [MethodName
                                        ('newLibraryWithSource:options:completionHandler:')
                                        ]
                                        procedure newLibraryWithSourceOptionsCompletionHandler
                                        (source: NSString;
                                        options: MTLCompileOptions;
                                        completionHandler
                                        : MTLNewLibraryCompletionHandler);
                                        cdecl;
                                        [MethodName
                                        ('newRenderPipelineStateWithDescriptor:error:')
                                        ]
                                        function newRenderPipelineStateWithDescriptorError
                                        (descriptor
                                        : MTLRenderPipelineDescriptor;
                                        error: NSError): Pointer; cdecl;
                                        [MethodName
                                        ('newRenderPipelineStateWithDescriptor:options:reflection:error:')
                                        ]
                                        function newRenderPipelineStateWithDescriptorOptionsReflectionError
                                        (descriptor
                                        : MTLRenderPipelineDescriptor;
                                        options: MTLPipelineOption;
                                        reflection: MTLRenderPipelineReflection;
                                        error: NSError): Pointer; cdecl;
                                        [MethodName
                                        ('newRenderPipelineStateWithDescriptor:completionHandler:')
                                        ]
                                        procedure newRenderPipelineStateWithDescriptorCompletionHandler
                                        (descriptor
                                        : MTLRenderPipelineDescriptor;
                                        completionHandler
                                        : MTLNewRenderPipelineStateCompletionHandler);
                                        cdecl;
                                        [MethodName
                                        ('newRenderPipelineStateWithDescriptor:options:completionHandler:')
                                        ]
                                        procedure newRenderPipelineStateWithDescriptorOptionsCompletionHandler
                                        (descriptor
                                        : MTLRenderPipelineDescriptor;
                                        options: MTLPipelineOption;
                                        completionHandler
                                        : MTLNewRenderPipelineStateWithReflectionCompletionHandler);
                                        cdecl;
                                        [MethodName
                                        ('newComputePipelineStateWithFunction:error:')
                                        ]
                                        function newComputePipelineStateWithFunctionError
                                        (computeFunction: Pointer;
                                        error: NSError): Pointer; cdecl;
                                        [MethodName
                                        ('newComputePipelineStateWithFunction:options:reflection:error:')
                                        ]
                                        function newComputePipelineStateWithFunctionOptionsReflectionError
                                        (computeFunction: Pointer;
                                        options: MTLPipelineOption;
                                        reflection
                                        : MTLComputePipelineReflection;
                                        error: NSError): Pointer; cdecl;
                                        [MethodName
                                        ('newComputePipelineStateWithFunction:completionHandler:')
                                        ]
                                        procedure newComputePipelineStateWithFunctionCompletionHandler
                                        (computeFunction: Pointer;
                                        completionHandler
                                        : MTLNewComputePipelineStateCompletionHandler);
                                        cdecl;
                                        [MethodName
                                        ('newComputePipelineStateWithFunction:options:completionHandler:')
                                        ]
                                        procedure newComputePipelineStateWithFunctionOptionsCompletionHandler
                                        (computeFunction: Pointer;
                                        options: MTLPipelineOption;
                                        completionHandler
                                        : MTLNewComputePipelineStateWithReflectionCompletionHandler);
                                        cdecl;
                                        [MethodName
                                        ('newComputePipelineStateWithDescriptor:options:reflection:error:')
                                        ]
                                        function newComputePipelineStateWithDescriptorOptionsReflectionError
                                        (descriptor
                                        : MTLComputePipelineDescriptor;
                                        options: MTLPipelineOption;
                                        reflection
                                        : MTLComputePipelineReflection;
                                        error: NSError): Pointer; cdecl;
                                        [MethodName
                                        ('newComputePipelineStateWithDescriptor:options:completionHandler:')
                                        ]
                                        procedure newComputePipelineStateWithDescriptorOptionsCompletionHandler
                                        (descriptor
                                        : MTLComputePipelineDescriptor;
                                        options: MTLPipelineOption;
                                        completionHandler
                                        : MTLNewComputePipelineStateWithReflectionCompletionHandler);
                                        cdecl;
                                        function supportsFeatureSet
                                        (featureSet: MTLFeatureSet)
                                        : Boolean; cdecl;
                                        function supportsTextureSampleCount
                                        (sampleCount: NSUInteger)
                                        : Boolean; cdecl;
                                        end;

                                        MTLCommandEncoder = interface
                                        (IObjectiveC)
                                        ['{6CBC3CB8-F28B-4E86-947D-83067EA855C5}']
                                        function device: Pointer;
                                        cdecl;
                                        procedure setLabel
                                        (&label: NSString); cdecl;
                                        function &label: NSString; cdecl;
                                        procedure endEncoding; cdecl;
                                        procedure insertDebugSignpost
                                        (&string: NSString); cdecl;
                                        procedure pushDebugGroup
                                        (&string: NSString); cdecl;
                                        procedure popDebugGroup; cdecl;
                                        end;

                                        MTLResource = interface(IObjectiveC)
                                        ['{4412E92E-C75C-4D97-ABAF-B21AB1F71615}']
                                        procedure setLabel(&label: NSString);
                                        cdecl;
                                        function &label: NSString; cdecl;
                                        function device: Pointer; cdecl;
                                        function cpuCacheMode
                                        : MTLCPUCacheMode; cdecl;
                                        function storageMode
                                        : MTLStorageMode; cdecl;
                                        function setPurgeableState
                                        (state: MTLPurgeableState)
                                        : MTLPurgeableState; cdecl;
                                        end;

                                        MTLTexture = interface(IObjectiveC)
                                        ['{C0D27303-349C-4B57-AD9E-1E9DB94AEF09}']
                                        function rootResource: Pointer;
                                        cdecl;
                                        function parentTexture: Pointer; cdecl;
                                        function parentRelativeLevel
                                        : NSUInteger; cdecl;
                                        function parentRelativeSlice
                                        : NSUInteger; cdecl;
                                        function buffer: Pointer; cdecl;
                                        function bufferOffset
                                        : NSUInteger; cdecl;
                                        function bufferBytesPerRow
                                        : NSUInteger; cdecl;
                                        function textureType
                                        : MTLTextureType; cdecl;
                                        function pixelFormat
                                        : MTLPixelFormat; cdecl;
                                        function width: NSUInteger; cdecl;
                                        function height: NSUInteger; cdecl;
                                        function depth: NSUInteger; cdecl;
                                        function mipmapLevelCount
                                        : NSUInteger; cdecl;
                                        function sampleCount: NSUInteger; cdecl;
                                        function arrayLength: NSUInteger; cdecl;
                                        function usage: MTLTextureUsage; cdecl;
                                        function isFramebufferOnly
                                        : Boolean; cdecl;
                                        [MethodName
                                        ('getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:')
                                        ]
                                        procedure getBytesBytesPerRowBytesPerImageFromRegionMipmapLevelSlice
                                        (pixelBytes: Pointer;
                                        bytesPerRow: NSUInteger;
                                        bytesPerImage: NSUInteger;
                                        fromRegion: MTLRegion;
                                        mipmapLevel: NSUInteger;
                                        slice: NSUInteger); cdecl;
                                        [MethodName
                                        ('replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:')
                                        ]
                                        procedure replaceRegionMipmapLevelSliceWithBytesBytesPerRowBytesPerImage
                                        (region: MTLRegion;
                                        mipmapLevel: NSUInteger;
                                        slice: NSUInteger; withBytes: Pointer;
                                        bytesPerRow: NSUInteger;
                                        bytesPerImage: NSUInteger); cdecl;
                                        [MethodName
                                        ('getBytes:bytesPerRow:fromRegion:mipmapLevel:')
                                        ]
                                        procedure getBytesBytesPerRowFromRegionMipmapLevel
                                        (pixelBytes: Pointer;
                                        bytesPerRow: NSUInteger;
                                        fromRegion: MTLRegion;
                                        mipmapLevel: NSUInteger); cdecl;
                                        [MethodName
                                        ('replaceRegion:mipmapLevel:withBytes:bytesPerRow:')
                                        ]
                                        procedure replaceRegionMipmapLevelWithBytesBytesPerRow
                                        (region: MTLRegion;
                                        mipmapLevel: NSUInteger;
                                        withBytes: Pointer;
                                        bytesPerRow: NSUInteger); cdecl;
                                        [MethodName
                                        ('newTextureViewWithPixelFormat:')]
                                        function newTextureViewWithPixelFormat
                                        (pixelFormat: MTLPixelFormat)
                                        : Pointer; cdecl;
                                        [MethodName
                                        ('newTextureViewWithPixelFormat:textureType:levels:slices:')
                                        ]
                                        function newTextureViewWithPixelFormatTextureTypeLevelsSlices
                                        (pixelFormat: MTLPixelFormat;
                                        textureType: MTLTextureType;
                                        levels: NSRange; slices: NSRange)
                                        : Pointer; cdecl;
                                        end;

                                        MTLBuffer = interface(IObjectiveC)
                                        ['{0868BD51-485D-413D-8E77-108F7374E613}']
                                        function length: NSUInteger;
                                        cdecl;
                                        function contents: Pointer; cdecl;
                                        procedure didModifyRange
                                        (range: NSRange); cdecl;
                                        function newTextureWithDescriptor
                                        (descriptor: MTLTextureDescriptor;
                                        offset: NSUInteger;
                                        bytesPerRow: NSUInteger)
                                        : Pointer; cdecl;
                                        end;

                                        MTLBlitCommandEncoder = interface
                                        (IObjectiveC)
                                        ['{C7FD090C-F22E-4967-A0E8-8D19EC5874BA}']
                                        procedure synchronizeResource
                                        (resource: Pointer);
                                        cdecl;
                                        procedure synchronizeTexture
                                        (texture: Pointer; slice: NSUInteger;
                                        level: NSUInteger); cdecl;
                                        [MethodName
                                        ('copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:')
                                        ]
                                        procedure copyFromTextureSourceSliceSourceLevelSourceOriginSourceSizeToTextureDestinationSliceDestinationLevelDestinationOrigin
                                        (sourceTexture: Pointer;
                                        sourceSlice: NSUInteger;
                                        sourceLevel: NSUInteger;
                                        sourceOrigin: MTLOrigin;
                                        sourceSize: MTLSize; toTexture: Pointer;
                                        destinationSlice: NSUInteger;
                                        destinationLevel: NSUInteger;
                                        destinationOrigin: MTLOrigin); cdecl;
                                        [MethodName
                                        ('copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:')
                                        ]
                                        procedure copyFromBufferSourceOffsetSourceBytesPerRowSourceBytesPerImageSourceSizeToTextureDestinationSliceDestinationLevelDestinationOrigin
                                        (sourceBuffer: Pointer;
                                        sourceOffset: NSUInteger;
                                        sourceBytesPerRow: NSUInteger;
                                        sourceBytesPerImage: NSUInteger;
                                        sourceSize: MTLSize; toTexture: Pointer;
                                        destinationSlice: NSUInteger;
                                        destinationLevel: NSUInteger;
                                        destinationOrigin: MTLOrigin); cdecl;
                                        [MethodName
                                        ('copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:')
                                        ]
                                        procedure copyFromBufferSourceOffsetSourceBytesPerRowSourceBytesPerImageSourceSizeToTextureDestinationSliceDestinationLevelDestinationOriginOptions
                                        (sourceBuffer: Pointer;
                                        sourceOffset: NSUInteger;
                                        sourceBytesPerRow: NSUInteger;
                                        sourceBytesPerImage: NSUInteger;
                                        sourceSize: MTLSize; toTexture: Pointer;
                                        destinationSlice: NSUInteger;
                                        destinationLevel: NSUInteger;
                                        destinationOrigin: MTLOrigin;
                                        options: MTLBlitOption); cdecl;
                                        [MethodName
                                        ('copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:')
                                        ]
                                        procedure copyFromTextureSourceSliceSourceLevelSourceOriginSourceSizeToBufferDestinationOffsetDestinationBytesPerRowDestinationBytesPerImage
                                        (sourceTexture: Pointer;
                                        sourceSlice: NSUInteger;
                                        sourceLevel: NSUInteger;
                                        sourceOrigin: MTLOrigin;
                                        sourceSize: MTLSize; toBuffer: Pointer;
                                        destinationOffset: NSUInteger;
                                        destinationBytesPerRow: NSUInteger;
                                        destinationBytesPerImage
                                        : NSUInteger); cdecl;
                                        [MethodName
                                        ('copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:')
                                        ]
                                        procedure copyFromTextureSourceSliceSourceLevelSourceOriginSourceSizeToBufferDestinationOffsetDestinationBytesPerRowDestinationBytesPerImageOptions
                                        (sourceTexture: Pointer;
                                        sourceSlice: NSUInteger;
                                        sourceLevel: NSUInteger;
                                        sourceOrigin: MTLOrigin;
                                        sourceSize: MTLSize; toBuffer: Pointer;
                                        destinationOffset: NSUInteger;
                                        destinationBytesPerRow: NSUInteger;
                                        destinationBytesPerImage: NSUInteger;
                                        options: MTLBlitOption); cdecl;
                                        procedure generateMipmapsForTexture
                                        (texture: Pointer); cdecl;
                                        procedure fillBuffer(buffer: Pointer;
                                        range: NSRange; value: Byte); cdecl;
                                        [MethodName
                                        ('copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:')
                                        ]
                                        procedure copyFromBufferSourceOffsetToBufferDestinationOffsetSize
                                        (sourceBuffer: Pointer;
                                        sourceOffset: NSUInteger;
                                        toBuffer: Pointer;
                                        destinationOffset: NSUInteger;
                                        size: NSUInteger); cdecl;
                                        end;

                                        MTLCommandQueue = interface(IObjectiveC)
                                        ['{218F5216-FC69-4BD7-A93B-0933F4E01706}']
                                        procedure setLabel(&label: NSString);
                                        cdecl;
                                        function &label: NSString; cdecl;
                                        function device: Pointer; cdecl;
                                        function commandBuffer: Pointer; cdecl;
                                        function commandBufferWithUnretainedReferences
                                        : Pointer; cdecl;
                                        procedure insertDebugCaptureBoundary;
                                        cdecl;
                                        end;

                                        MTLRenderCommandEncoder = interface
                                        (IObjectiveC)
                                        ['{E8838AA3-BF1A-48E1-8BC7-5B6D4402C3D3}']
                                        procedure setRenderPipelineState
                                        (pipelineState: Pointer);
                                        cdecl;
                                        procedure setVertexBytes(bytes: Pointer;
                                        length: NSUInteger;
                                        atIndex: NSUInteger); cdecl;
                                        procedure setVertexBuffer
                                        (buffer: Pointer; offset: NSUInteger;
                                        atIndex: NSUInteger); cdecl;
                                        procedure setVertexBufferOffset
                                        (offset: NSUInteger;
                                        atIndex: NSUInteger); cdecl;
                                        procedure setVertexBuffers
                                        (buffers: Pointer; offsets: NSUInteger;
                                        withRange: NSRange); cdecl;
                                        procedure setVertexTexture
                                        (texture: Pointer;
                                        atIndex: NSUInteger); cdecl;
                                        procedure setVertexTextures
                                        (textures: Pointer;
                                        withRange: NSRange); cdecl;
                                        [MethodName
                                        ('setVertexSamplerState:atIndex:')]
                                        procedure setVertexSamplerStateAtIndex
                                        (sampler: Pointer;
                                        atIndex: NSUInteger); cdecl;
                                        [MethodName
                                        ('setVertexSamplerStates:withRange:')]
                                        procedure setVertexSamplerStatesWithRange
                                        (samplers: Pointer;
                                        withRange: NSRange); cdecl;
                                        [MethodName
                                        ('setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:')
                                        ]
                                        procedure setVertexSamplerStateLodMinClampLodMaxClampAtIndex
                                        (sampler: Pointer; lodMinClamp: Single;
                                        lodMaxClamp: Single;
                                        atIndex: NSUInteger); cdecl;
                                        [MethodName
                                        ('setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:')
                                        ]
                                        procedure setVertexSamplerStatesLodMinClampsLodMaxClampsWithRange
                                        (samplers: Pointer;
                                        lodMinClamps: Single;
                                        lodMaxClamps: Single;
                                        withRange: NSRange); cdecl;
                                        procedure setViewport
                                        (viewport: MTLViewport); cdecl;
                                        procedure setFrontFacingWinding
                                        (frontFacingWinding: MTLWinding); cdecl;
                                        procedure setCullMode
                                        (cullMode: MTLCullMode); cdecl;
                                        procedure setDepthClipMode
                                        (depthClipMode
                                        : MTLDepthClipMode); cdecl;
                                        procedure setDepthBias
                                        (depthBias: Single; slopeScale: Single;
                                        clamp: Single); cdecl;
                                        procedure setScissorRect
                                        (rect: MTLScissorRect); cdecl;
                                        procedure setTriangleFillMode
                                        (fillMode: MTLTriangleFillMode); cdecl;
                                        procedure setFragmentBytes
                                        (bytes: Pointer; length: NSUInteger;
                                        atIndex: NSUInteger); cdecl;
                                        procedure setFragmentBuffer
                                        (buffer: Pointer; offset: NSUInteger;
                                        atIndex: NSUInteger); cdecl;
                                        procedure setFragmentBufferOffset
                                        (offset: NSUInteger;
                                        atIndex: NSUInteger); cdecl;
                                        procedure setFragmentBuffers
                                        (buffers: Pointer; offsets: NSUInteger;
                                        withRange: NSRange); cdecl;
                                        procedure setFragmentTexture
                                        (texture: Pointer;
                                        atIndex: NSUInteger); cdecl;
                                        procedure setFragmentTextures
                                        (textures: Pointer;
                                        withRange: NSRange); cdecl;
                                        [MethodName
                                        ('setFragmentSamplerState:atIndex:')]
                                        procedure setFragmentSamplerStateAtIndex
                                        (sampler: Pointer;
                                        atIndex: NSUInteger); cdecl;
                                        [MethodName
                                        ('setFragmentSamplerStates:withRange:')]
                                        procedure setFragmentSamplerStatesWithRange
                                        (samplers: Pointer;
                                        withRange: NSRange); cdecl;
                                        [MethodName
                                        ('setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:')
                                        ]
                                        procedure setFragmentSamplerStateLodMinClampLodMaxClampAtIndex
                                        (sampler: Pointer; lodMinClamp: Single;
                                        lodMaxClamp: Single;
                                        atIndex: NSUInteger); cdecl;
                                        [MethodName
                                        ('setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:')
                                        ]
                                        procedure setFragmentSamplerStatesLodMinClampsLodMaxClampsWithRange
                                        (samplers: Pointer;
                                        lodMinClamps: Single;
                                        lodMaxClamps: Single;
                                        withRange: NSRange); cdecl;
                                        procedure setBlendColorRed(red: Single;
                                        green: Single; blue: Single;
                                        alpha: Single); cdecl;
                                        procedure setDepthStencilState
                                        (depthStencilState: Pointer); cdecl;
                                        procedure setStencilReferenceValue
                                        (referenceValue: LongWord); cdecl;
                                        procedure setStencilFrontReferenceValue
                                        (frontReferenceValue: LongWord;
                                        backReferenceValue: LongWord); cdecl;
                                        procedure setVisibilityResultMode
                                        (mode: MTLVisibilityResultMode;
                                        offset: NSUInteger); cdecl;
                                        [MethodName
                                        ('drawPrimitives:vertexStart:vertexCount:instanceCount:')
                                        ]
                                        procedure drawPrimitivesVertexStartVertexCountInstanceCount
                                        (primitiveType: MTLPrimitiveType;
                                        vertexStart: NSUInteger;
                                        vertexCount: NSUInteger;
                                        instanceCount: NSUInteger); cdecl;
                                        [MethodName
                                        ('drawPrimitives:vertexStart:vertexCount:')
                                        ]
                                        procedure drawPrimitivesVertexStartVertexCount
                                        (primitiveType: MTLPrimitiveType;
                                        vertexStart: NSUInteger;
                                        vertexCount: NSUInteger); cdecl;
                                        [MethodName
                                        ('drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:')
                                        ]
                                        procedure drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffsetInstanceCount
                                        (primitiveType: MTLPrimitiveType;
                                        indexCount: NSUInteger;
                                        indexType: MTLIndexType;
                                        indexBuffer: Pointer;
                                        indexBufferOffset: NSUInteger;
                                        instanceCount: NSUInteger); cdecl;
                                        [MethodName
                                        ('drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:')
                                        ]
                                        procedure drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffset
                                        (primitiveType: MTLPrimitiveType;
                                        indexCount: NSUInteger;
                                        indexType: MTLIndexType;
                                        indexBuffer: Pointer;
                                        indexBufferOffset: NSUInteger); cdecl;
                                        [MethodName
                                        ('drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:')
                                        ]
                                        procedure drawPrimitivesVertexStartVertexCountInstanceCountBaseInstance
                                        (primitiveType: MTLPrimitiveType;
                                        vertexStart: NSUInteger;
                                        vertexCount: NSUInteger;
                                        instanceCount: NSUInteger;
                                        baseInstance: NSUInteger); cdecl;
                                        [MethodName
                                        ('drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:')
                                        ]
                                        procedure drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffsetInstanceCountBaseVertexBaseInstance
                                        (primitiveType: MTLPrimitiveType;
                                        indexCount: NSUInteger;
                                        indexType: MTLIndexType;
                                        indexBuffer: Pointer;
                                        indexBufferOffset: NSUInteger;
                                        instanceCount: NSUInteger;
                                        baseVertex: NSInteger;
                                        baseInstance: NSUInteger); cdecl;
                                        [MethodName
                                        ('drawPrimitives:indirectBuffer:indirectBufferOffset:')
                                        ]
                                        procedure drawPrimitivesIndirectBufferIndirectBufferOffset
                                        (primitiveType: MTLPrimitiveType;
                                        indirectBuffer: Pointer;
                                        indirectBufferOffset
                                        : NSUInteger); cdecl;
                                        [MethodName
                                        ('drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:')
                                        ]
                                        procedure drawIndexedPrimitivesIndexTypeIndexBufferIndexBufferOffsetIndirectBufferIndirectBufferOffset
                                        (primitiveType: MTLPrimitiveType;
                                        indexType: MTLIndexType;
                                        indexBuffer: Pointer;
                                        indexBufferOffset: NSUInteger;
                                        indirectBuffer: Pointer;
                                        indirectBufferOffset
                                        : NSUInteger); cdecl;
                                        end;

                                        MTLParallelRenderCommandEncoder =
                                        interface(IObjectiveC)
                                        ['{539642C1-0A5A-463B-8F01-ACA9FC9EC0C5}']
                                        function renderCommandEncoder: Pointer;
                                        cdecl;
                                        end;

                                        MTLComputeCommandEncoder = interface
                                        (IObjectiveC)
                                        ['{2D06E831-4154-4927-B87B-3CECDA7B1450}']
                                        procedure setComputePipelineState
                                        (state: Pointer);
                                        cdecl;
                                        procedure setBytes(bytes: Pointer;
                                        length: NSUInteger;
                                        atIndex: NSUInteger); cdecl;
                                        procedure setBuffer(buffer: Pointer;
                                        offset: NSUInteger;
                                        atIndex: NSUInteger); cdecl;
                                        procedure setBufferOffset
                                        (offset: NSUInteger;
                                        atIndex: NSUInteger); cdecl;
                                        procedure setBuffers(buffers: Pointer;
                                        offsets: NSUInteger;
                                        withRange: NSRange); cdecl;
                                        procedure setTexture(texture: Pointer;
                                        atIndex: NSUInteger); cdecl;
                                        procedure setTextures(textures: Pointer;
                                        withRange: NSRange); cdecl;
                                        [MethodName('setSamplerState:atIndex:')]
                                        procedure setSamplerStateAtIndex
                                        (sampler: Pointer;
                                        atIndex: NSUInteger); cdecl;
                                        [MethodName
                                        ('setSamplerStates:withRange:')]
                                        procedure setSamplerStatesWithRange
                                        (samplers: Pointer;
                                        withRange: NSRange); cdecl;
                                        [MethodName
                                        ('setSamplerState:lodMinClamp:lodMaxClamp:atIndex:')
                                        ]
                                        procedure setSamplerStateLodMinClampLodMaxClampAtIndex
                                        (sampler: Pointer; lodMinClamp: Single;
                                        lodMaxClamp: Single;
                                        atIndex: NSUInteger); cdecl;
                                        [MethodName
                                        ('setSamplerStates:lodMinClamps:lodMaxClamps:withRange:')
                                        ]
                                        procedure setSamplerStatesLodMinClampsLodMaxClampsWithRange
                                        (samplers: Pointer;
                                        lodMinClamps: Single;
                                        lodMaxClamps: Single;
                                        withRange: NSRange); cdecl;
                                        procedure setThreadgroupMemoryLength
                                        (length: NSUInteger;
                                        atIndex: NSUInteger); cdecl;
                                        procedure dispatchThreadgroups
                                        (threadgroupsPerGrid: MTLSize;
                                        threadsPerThreadgroup: MTLSize); cdecl;
                                        procedure dispatchThreadgroupsWithIndirectBuffer
                                        (indirectBuffer: Pointer;
                                        indirectBufferOffset: NSUInteger;
                                        threadsPerThreadgroup: MTLSize); cdecl;
                                        end;

                                        MTLDrawable = interface(IObjectiveC)
                                        ['{2D2E039A-3609-497B-B4DD-BB8F327630E6}']
                                        procedure present;
                                        cdecl;
                                        procedure presentAtTime(presentationTime
                                        : CFTimeInterval); cdecl;
                                        end;

                                        MTLCommandBuffer = interface
                                        (IObjectiveC)
                                        ['{40C14F5E-698F-4FFD-966D-502EBC91E32B}']
                                        function device: Pointer;
                                        cdecl;
                                        function commandQueue: Pointer; cdecl;
                                        function retainedReferences
                                        : Boolean; cdecl;
                                        procedure setLabel
                                        (&label: NSString); cdecl;
                                        function &label: NSString; cdecl;
                                        procedure enqueue; cdecl;
                                        procedure commit; cdecl;
                                        procedure addScheduledHandler
                                        (block: MTLCommandBufferHandler); cdecl;
                                        [MethodName('presentDrawable:')]
                                        procedure presentDrawable
                                        (drawable: Pointer); cdecl;
                                        [MethodName('presentDrawable:atTime:')]
                                        procedure presentDrawableAtTime
                                        (drawable: Pointer;
                                        atTime: CFTimeInterval); cdecl;
                                        procedure waitUntilScheduled; cdecl;
                                        procedure addCompletedHandler
                                        (block: MTLCommandBufferHandler); cdecl;
                                        procedure waitUntilCompleted; cdecl;
                                        function status
                                        : MTLCommandBufferStatus; cdecl;
                                        function error: NSError; cdecl;
                                        function blitCommandEncoder
                                        : Pointer; cdecl;
                                        function renderCommandEncoderWithDescriptor
                                        (renderPassDescriptor
                                        : MTLRenderPassDescriptor)
                                        : Pointer; cdecl;
                                        function computeCommandEncoder
                                        : Pointer; cdecl;
                                        function parallelRenderCommandEncoderWithDescriptor
                                        (renderPassDescriptor
                                        : MTLRenderPassDescriptor)
                                        : Pointer; cdecl;
                                        end;

                                        MTLFunction = interface(IObjectiveC)
                                        ['{87F11259-505A-403F-81B5-43971E8A3C13}']
                                        function device: Pointer;
                                        cdecl;
                                        function functionType
                                        : MTLFunctionType; cdecl;
                                        function vertexAttributes
                                        : NSArray; cdecl;
                                        function name: NSString; cdecl;
                                        end;

                                        MTLSamplerState = interface(IObjectiveC)
                                        ['{12F8F0F0-1688-4D4C-8BC3-E1272761A439}']
                                        function &label: NSString;
                                        cdecl;
                                        function device: Pointer; cdecl;
                                        end;

                                        MTLComputePipelineState = interface
                                        (IObjectiveC)
                                        ['{0BE74AA9-A084-4F98-BA07-75403AAD8AA8}']
                                        function device: Pointer;
                                        cdecl;
                                        function maxTotalThreadsPerThreadgroup
                                        : NSUInteger; cdecl;
                                        function threadExecutionWidth
                                        : NSUInteger; cdecl;
                                        end;

                                        MTLLibrary = interface(IObjectiveC)
                                        ['{9A7EEC1F-471B-433C-B03D-0C7E83B7E2A8}']
                                        procedure setLabel(&label: NSString);
                                        cdecl;
                                        function &label: NSString; cdecl;
                                        function device: Pointer; cdecl;
                                        function newFunctionWithName
                                        (functionName: NSString)
                                        : Pointer; cdecl;
                                        function functionNames: NSArray; cdecl;
                                        end;

                                        MTLDepthStencilState = interface
                                        (IObjectiveC)
                                        ['{8A655BA3-F4EB-489C-A191-147AE45C8A61}']
                                        function &label: NSString;
                                        cdecl;
                                        function device: Pointer; cdecl;
                                        end;

                                        MTLRenderPipelineState = interface
                                        (IObjectiveC)
                                        ['{40878089-90A1-4211-A251-1485BE607A6B}']
                                        function &label: NSString;
                                        cdecl;
                                        function device: Pointer; cdecl;
                                        end;

                                        // ===== Exported string consts =====

                                        function MTLCommandBufferErrorDomain
                                        : NSString;
                                        function MTLLibraryErrorDomain
                                        : NSString;
                                        function MTLRenderPipelineErrorDomain
                                        : NSString;


                                        // ===== External functions =====

                                        const
                                        libMetal =
                                        '/System/Library/Frameworks/Metal.framework/Metal';
                                        function MTLOriginMake(x: NSUInteger;
                                        y: NSUInteger; z: NSUInteger)
                                        : MTLOrigin; cdecl;
                                        external libMetal name _PU +
                                        'MTLOriginMake';
                                        function MTLSizeMake(width: NSUInteger;
                                        height: NSUInteger; depth: NSUInteger)
                                        : MTLSize; cdecl;
                                        external libMetal name _PU +
                                        'MTLSizeMake';
                                        function MTLRegionMake1D(x: NSUInteger;
                                        width: NSUInteger): MTLRegion; cdecl;
                                        external libMetal name _PU +
                                        'MTLRegionMake1D';
                                        function MTLRegionMake2D(x: NSUInteger;
                                        y: NSUInteger; width: NSUInteger;
                                        height: NSUInteger): MTLRegion; cdecl;
                                        external libMetal name _PU +
                                        'MTLRegionMake2D';
                                        function MTLRegionMake3D(x: NSUInteger;
                                        y: NSUInteger; z: NSUInteger;
                                        width: NSUInteger; height: NSUInteger;
                                        depth: NSUInteger): MTLRegion; cdecl;
                                        external libMetal name _PU +
                                        'MTLRegionMake3D';
                                        function MTLCreateSystemDefaultDevice
                                        : Pointer; cdecl;
                                        external libMetal name _PU +
                                        'MTLCreateSystemDefaultDevice';
                                        function MTLCopyAllDevices
                                        : Pointer { NSArray }; cdecl;
                                        external libMetal name _PU +
                                        'MTLCopyAllDevices';
                                        function MTLClearColorMake(red: Double;
                                        green: Double; blue: Double;
                                        alpha: Double): MTLClearColor; cdecl;
                                        external libMetal name _PU +
                                        'MTLClearColorMake';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  MetalModule: THandle;

{$ENDIF IOS}

function MTLCommandBufferErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libMetal, 'MTLCommandBufferErrorDomain');
end;

function MTLLibraryErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libMetal, 'MTLLibraryErrorDomain');
end;

function MTLRenderPipelineErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libMetal, 'MTLRenderPipelineErrorDomain');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MetalModule := dlopen(MarshaledAString(libMetal), RTLD_LAZY);

finalization

dlclose(MetalModule);
{$ENDIF IOS}

end.
