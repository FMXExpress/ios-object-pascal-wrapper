{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreGraphics
//

unit iOSapi.CoreGraphics;

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
  CGRectMinXEdge = 0;
  CGRectMinYEdge = 1;
  CGRectMaxXEdge = 2;
  CGRectMaxYEdge = 3;
  kCGRenderingIntentDefault = 0;
  kCGRenderingIntentAbsoluteColorimetric = 1;
  kCGRenderingIntentRelativeColorimetric = 2;
  kCGRenderingIntentPerceptual = 3;
  kCGRenderingIntentSaturation = 4;
  kCGColorSpaceModelUnknown = -1;
  kCGColorSpaceModelMonochrome = 0;
  kCGColorSpaceModelRGB = 1;
  kCGColorSpaceModelCMYK = 2;
  kCGColorSpaceModelLab = 3;
  kCGColorSpaceModelDeviceN = 4;
  kCGColorSpaceModelIndexed = 5;
  kCGColorSpaceModelPattern = 6;
  kCGPatternTilingNoDistortion = 0;
  kCGPatternTilingConstantSpacingMinimalDistortion = 1;
  kCGPatternTilingConstantSpacing = 2;
  kCGFontPostScriptFormatType1 = 1;
  kCGFontPostScriptFormatType3 = 3;
  kCGFontPostScriptFormatType42 = 42;
  CGGlyphMin = 0;
  CGGlyphMax = 1;
  kCGGradientDrawsBeforeStartLocation = (1 shl 0);
  kCGGradientDrawsAfterEndLocation = (1 shl 1);
  kCGImageAlphaNone = 0;
  kCGImageAlphaPremultipliedLast = 1;
  kCGImageAlphaPremultipliedFirst = 2;
  kCGImageAlphaLast = 3;
  kCGImageAlphaFirst = 4;
  kCGImageAlphaNoneSkipLast = 5;
  kCGImageAlphaNoneSkipFirst = 6;
  kCGImageAlphaOnly = 7;
  kCGBitmapAlphaInfoMask = 31;
  kCGBitmapFloatInfoMask = 3840;
  kCGBitmapFloatComponents = (1 shl 8);
  kCGBitmapByteOrderMask = 28672;
  kCGBitmapByteOrderDefault = (0 shl 12);
  kCGBitmapByteOrder16Little = (1 shl 12);
  kCGBitmapByteOrder32Little = (2 shl 12);
  kCGBitmapByteOrder16Big = (3 shl 12);
  kCGBitmapByteOrder32Big = (4 shl 12);
  kCGLineJoinMiter = 0;
  kCGLineJoinRound = 1;
  kCGLineJoinBevel = 2;
  kCGLineCapButt = 0;
  kCGLineCapRound = 1;
  kCGLineCapSquare = 2;
  kCGPathElementMoveToPoint = 0;
  kCGPathElementAddLineToPoint = 1;
  kCGPathElementAddQuadCurveToPoint = 2;
  kCGPathElementAddCurveToPoint = 3;
  kCGPathElementCloseSubpath = 4;
  kCGPDFObjectTypeNull = 1;
  kCGPDFObjectTypeBoolean = 2;
  kCGPDFObjectTypeInteger = 3;
  kCGPDFObjectTypeReal = 4;
  kCGPDFObjectTypeName = 5;
  kCGPDFObjectTypeString = 6;
  kCGPDFObjectTypeArray = 7;
  kCGPDFObjectTypeDictionary = 8;
  kCGPDFObjectTypeStream = 9;
  CGPDFDataFormatRaw = 0;
  CGPDFDataFormatJPEGEncoded = 1;
  CGPDFDataFormatJPEG2000 = 2;
  kCGPDFMediaBox = 0;
  kCGPDFCropBox = 1;
  kCGPDFBleedBox = 2;
  kCGPDFTrimBox = 3;
  kCGPDFArtBox = 4;
  kCGPathFill = 0;
  kCGPathEOFill = 1;
  kCGPathStroke = 2;
  kCGPathFillStroke = 3;
  kCGPathEOFillStroke = 4;
  kCGTextFill = 0;
  kCGTextStroke = 1;
  kCGTextFillStroke = 2;
  kCGTextInvisible = 3;
  kCGTextFillClip = 4;
  kCGTextStrokeClip = 5;
  kCGTextFillStrokeClip = 6;
  kCGTextClip = 7;
  kCGEncodingFontSpecific = 0;
  kCGEncodingMacRoman = 1;
  kCGInterpolationDefault = 0;
  kCGInterpolationNone = 1;
  kCGInterpolationLow = 2;
  kCGInterpolationMedium = 4;
  kCGInterpolationHigh = 3;
  kCGBlendModeNormal = 0;
  kCGBlendModeMultiply = 1;
  kCGBlendModeScreen = 2;
  kCGBlendModeOverlay = 3;
  kCGBlendModeDarken = 4;
  kCGBlendModeLighten = 5;
  kCGBlendModeColorDodge = 6;
  kCGBlendModeColorBurn = 7;
  kCGBlendModeSoftLight = 8;
  kCGBlendModeHardLight = 9;
  kCGBlendModeDifference = 10;
  kCGBlendModeExclusion = 11;
  kCGBlendModeHue = 12;
  kCGBlendModeSaturation = 13;
  kCGBlendModeColor = 14;
  kCGBlendModeLuminosity = 15;
  kCGBlendModeClear = 16;
  kCGBlendModeCopy = 17;
  kCGBlendModeSourceIn = 18;
  kCGBlendModeSourceOut = 19;
  kCGBlendModeSourceAtop = 20;
  kCGBlendModeDestinationOver = 21;
  kCGBlendModeDestinationIn = 22;
  kCGBlendModeDestinationOut = 23;
  kCGBlendModeDestinationAtop = 24;
  kCGBlendModeXOR = 25;
  kCGBlendModePlusDarker = 26;
  kCGBlendModePlusLighter = 27;
  kCGColorConverterTransformFromSpace = 0;
  kCGColorConverterTransformToSpace = 1;
  kCGColorConverterTransformApplySpace = 2;
  kCGErrorSuccess = 0;
  kCGErrorFailure = 1000;
  kCGErrorIllegalArgument = 1001;
  kCGErrorInvalidConnection = 1002;
  kCGErrorInvalidContext = 1003;
  kCGErrorCannotComplete = 1004;
  kCGErrorNotImplemented = 1006;
  kCGErrorRangeCheck = 1007;
  kCGErrorTypeCheck = 1008;
  kCGErrorInvalidOperation = 1010;
  kCGErrorNoneAvailable = 1011;

type
  // ===== Framework typedefs =====
{$M+}
  CGFloat = Single;

  CGAffineTransform = record
    a: CGFloat;
    b: CGFloat;
    c: CGFloat;
    d: CGFloat;
    tx: CGFloat;
    ty: CGFloat;
  end;

  PCGAffineTransform = ^CGAffineTransform;

  CGPoint = record
    x: CGFloat;
    y: CGFloat;
  end;

  PCGPoint = ^CGPoint;

  CGSize = record
    width: CGFloat;
    height: CGFloat;
  end;

  PCGSize = ^CGSize;

  CGVector = record
    dx: CGFloat;
    dy: CGFloat;
  end;

  PCGVector = ^CGVector;

  CGRect = record
    origin: CGPoint;
    size: CGSize;
  end;

  PCGRect = ^CGRect;

  CGRectEdge = LongWord;
  CFDictionaryRef = Pointer;
  CGContextRef = Pointer;
  CGColorRef = Pointer;
  CGColorSpaceRef = Pointer;
  CGDataProviderRef = Pointer;
  __darwin_size_t = LongWord;
  CGDataProviderGetBytesCallback = function(param1: Pointer; param2: Pointer;
    param3: LongWord): LongWord; cdecl;
  __int64_t = Int64;
  __darwin_off_t = __int64_t;
  CGDataProviderSkipForwardCallback = function(param1: Pointer; param2: Integer)
    : Integer; cdecl;
  CGDataProviderRewindCallback = procedure(param1: Pointer); cdecl;
  CGDataProviderReleaseInfoCallback = procedure(param1: Pointer); cdecl;

  CGDataProviderSequentialCallbacks = record
    version: Cardinal;
    getBytes: CGDataProviderGetBytesCallback;
    skipForward: CGDataProviderSkipForwardCallback;
    rewind: CGDataProviderRewindCallback;
    releaseInfo: CGDataProviderReleaseInfoCallback;
  end;

  PCGDataProviderSequentialCallbacks = ^CGDataProviderSequentialCallbacks;

  CGDataProviderGetBytePointerCallback = function(param1: Pointer)
    : Pointer; cdecl;
  CGDataProviderReleaseBytePointerCallback = procedure(param1: Pointer;
    param2: Pointer); cdecl;
  CGDataProviderGetBytesAtPositionCallback = function(param1: Pointer;
    param2: Pointer; param3: Integer; param4: LongWord): LongWord; cdecl;

  CGDataProviderDirectCallbacks = record
    version: Cardinal;
    getBytePointer: CGDataProviderGetBytePointerCallback;
    releaseBytePointer: CGDataProviderReleaseBytePointerCallback;
    getBytesAtPosition: CGDataProviderGetBytesAtPositionCallback;
    releaseInfo: CGDataProviderReleaseInfoCallback;
  end;

  PCGDataProviderDirectCallbacks = ^CGDataProviderDirectCallbacks;

  CFTypeID = LongWord;
  CGDataProviderReleaseDataCallback = procedure(param1: Pointer;
    param2: Pointer; param3: LongWord); cdecl;
  CFDataRef = Pointer;
  CFURLRef = Pointer;
  CGColorRenderingIntent = Int32;
  CGColorSpaceModel = Int32;
  CFStringRef = Pointer;
  CGPatternRef = Pointer;
  CGPatternTiling = Int32;
  CGPatternDrawPatternCallback = procedure(param1: Pointer;
    param2: CGContextRef); cdecl;
  CGPatternReleaseInfoCallback = procedure(param1: Pointer); cdecl;

  CGPatternCallbacks = record
    version: Cardinal;
    drawPattern: CGPatternDrawPatternCallback;
    releaseInfo: CGPatternReleaseInfoCallback;
  end;

  PCGPatternCallbacks = ^CGPatternCallbacks;

  CGFontRef = Pointer;
  CGFontIndex = Word;
  PCGFontIndex = ^CGFontIndex;

  CGGlyph = CGFontIndex;
  CGFontPostScriptFormat = Int32;
  CFArrayRef = Pointer;
  CGGlyphDeprecatedEnum = Int32;
  CGGradientRef = Pointer;
  CGGradientDrawingOptions = LongWord;
  CGImageRef = Pointer;
  CGImageAlphaInfo = LongWord;
  CGBitmapInfo = LongWord;
  CGMutablePathRef = Pointer;
  CGPathRef = Pointer;
  CGLineJoin = Int32;
  CGLineCap = Int32;
  CGPathElementType = Int32;

  CGPathElement = record
    &type: CGPathElementType;
    points: Pointer;
  end;

  PCGPathElement = ^CGPathElement;

  CGPathApplierFunction = procedure(param1: Pointer; param2: Pointer); cdecl;
  CGPDFDocumentRef = Pointer;
  CGPDFPageRef = Pointer;
  CGPDFDictionaryRef = Pointer;
  CGPDFArrayRef = Pointer;
  CGPDFBoolean = Byte;
  PCGPDFBoolean = ^CGPDFBoolean;

  CGPDFInteger = LongInt;
  PCGPDFInteger = ^CGPDFInteger;

  CGPDFReal = CGFloat;
  CGPDFObjectRef = Pointer;
  CGPDFObjectType = Int32;
  CGPDFStreamRef = Pointer;
  CGPDFDataFormat = Int32;
  CGPDFStringRef = Pointer;
  CFDateRef = Pointer;
  CGPDFDictionaryApplierFunction = procedure(param1: MarshaledAString;
    param2: CGPDFObjectRef; param3: Pointer); cdecl;
  CGPDFBox = Int32;
  CGShadingRef = Pointer;
  CGFunctionRef = Pointer;
  CGFunctionEvaluateCallback = procedure(param1: Pointer; param2: PCGFloat;
    param3: PCGFloat); cdecl;
  CGFunctionReleaseInfoCallback = procedure(param1: Pointer); cdecl;

  CGFunctionCallbacks = record
    version: Cardinal;
    evaluate: CGFunctionEvaluateCallback;
    releaseInfo: CGFunctionReleaseInfoCallback;
  end;

  PCGFunctionCallbacks = ^CGFunctionCallbacks;

  CGPathDrawingMode = Int32;
  CGTextDrawingMode = Int32;
  CGTextEncoding = Int32;
  CGInterpolationQuality = Int32;
  CGBlendMode = Int32;
  CGBitmapContextReleaseDataCallback = procedure(param1: Pointer;
    param2: Pointer); cdecl;
  CGColorConverterRef = Pointer;
  CGColorConverterTransformType = LongWord;
  CGDataConsumerRef = Pointer;
  CGDataConsumerPutBytesCallback = function(param1: Pointer; param2: Pointer;
    param3: LongWord): LongWord; cdecl;
  CGDataConsumerReleaseInfoCallback = procedure(param1: Pointer); cdecl;

  CGDataConsumerCallbacks = record
    putBytes: CGDataConsumerPutBytesCallback;
    releaseConsumer: CGDataConsumerReleaseInfoCallback;
  end;

  PCGDataConsumerCallbacks = ^CGDataConsumerCallbacks;

  CFMutableDataRef = Pointer;
  CGError = Int32;
  CGLayerRef = Pointer;
  CGPDFContentStreamRef = Pointer;
  CGPDFOperatorTableRef = Pointer;
  CGPDFScannerRef = Pointer;
  CGPDFOperatorCallback = procedure(param1: CGPDFScannerRef;
    param2: Pointer); cdecl;
  // ===== Exported string consts =====

function CGPointZero: Pointer;
function CGSizeZero: Pointer;
function CGRectZero: Pointer;
function CGRectNull: Pointer;
function CGRectInfinite: Pointer;
function CGAffineTransformIdentity: Pointer;
function kCGColorSpaceGenericGray: Pointer;
function kCGColorSpaceGenericRGB: Pointer;
function kCGColorSpaceGenericCMYK: Pointer;
function kCGColorSpaceDisplayP3: Pointer;
function kCGColorSpaceGenericRGBLinear: Pointer;
function kCGColorSpaceAdobeRGB1998: Pointer;
function kCGColorSpaceSRGB: Pointer;
function kCGColorSpaceGenericGrayGamma2_2: Pointer;
function kCGColorSpaceGenericXYZ: Pointer;
function kCGColorSpaceACESCGLinear: Pointer;
function kCGColorSpaceITUR_709: Pointer;
function kCGColorSpaceITUR_2020: Pointer;
function kCGColorSpaceROMMRGB: Pointer;
function kCGColorSpaceDCIP3: Pointer;
function kCGColorWhite: Pointer;
function kCGColorBlack: Pointer;
function kCGColorClear: Pointer;
function kCGFontVariationAxisName: Pointer;
function kCGFontVariationAxisMinValue: Pointer;
function kCGFontVariationAxisMaxValue: Pointer;
function kCGFontVariationAxisDefaultValue: Pointer;
function kCGPDFContextMediaBox: Pointer;
function kCGPDFContextCropBox: Pointer;
function kCGPDFContextBleedBox: Pointer;
function kCGPDFContextTrimBox: Pointer;
function kCGPDFContextArtBox: Pointer;
function kCGPDFContextTitle: Pointer;
function kCGPDFContextAuthor: Pointer;
function kCGPDFContextSubject: Pointer;
function kCGPDFContextKeywords: Pointer;
function kCGPDFContextCreator: Pointer;
function kCGPDFContextOwnerPassword: Pointer;
function kCGPDFContextUserPassword: Pointer;
function kCGPDFContextEncryptionKeyLength: Pointer;
function kCGPDFContextAllowsPrinting: Pointer;
function kCGPDFContextAllowsCopying: Pointer;
function kCGPDFContextOutputIntent: Pointer;
function kCGPDFXOutputIntentSubtype: Pointer;
function kCGPDFXOutputConditionIdentifier: Pointer;
function kCGPDFXOutputCondition: Pointer;
function kCGPDFXRegistryName: Pointer;
function kCGPDFXInfo: Pointer;
function kCGPDFXDestinationOutputProfile: Pointer;
function kCGPDFContextOutputIntents: Pointer;


// ===== External functions =====

const
  libCoreGraphics =
    '/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics';
function CGPointMake(x: CGFloat; y: CGFloat): CGPoint; cdecl;
  external libCoreGraphics name _PU + 'CGPointMake';
function CGSizeMake(width: CGFloat; height: CGFloat): CGSize; cdecl;
  external libCoreGraphics name _PU + 'CGSizeMake';
function CGVectorMake(dx: CGFloat; dy: CGFloat): CGVector; cdecl;
  external libCoreGraphics name _PU + 'CGVectorMake';
function CGRectMake(x: CGFloat; y: CGFloat; width: CGFloat; height: CGFloat)
  : CGRect; cdecl; external libCoreGraphics name _PU + 'CGRectMake';
function CGRectGetMinX(rect: CGRect): CGFloat; cdecl;
  external libCoreGraphics name _PU + 'CGRectGetMinX';
function CGRectGetMidX(rect: CGRect): CGFloat; cdecl;
  external libCoreGraphics name _PU + 'CGRectGetMidX';
function CGRectGetMaxX(rect: CGRect): CGFloat; cdecl;
  external libCoreGraphics name _PU + 'CGRectGetMaxX';
function CGRectGetMinY(rect: CGRect): CGFloat; cdecl;
  external libCoreGraphics name _PU + 'CGRectGetMinY';
function CGRectGetMidY(rect: CGRect): CGFloat; cdecl;
  external libCoreGraphics name _PU + 'CGRectGetMidY';
function CGRectGetMaxY(rect: CGRect): CGFloat; cdecl;
  external libCoreGraphics name _PU + 'CGRectGetMaxY';
function CGRectGetWidth(rect: CGRect): CGFloat; cdecl;
  external libCoreGraphics name _PU + 'CGRectGetWidth';
function CGRectGetHeight(rect: CGRect): CGFloat; cdecl;
  external libCoreGraphics name _PU + 'CGRectGetHeight';
function CGPointEqualToPoint(point1: CGPoint; point2: CGPoint): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPointEqualToPoint';
function CGSizeEqualToSize(size1: CGSize; size2: CGSize): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGSizeEqualToSize';
function CGRectEqualToRect(rect1: CGRect; rect2: CGRect): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGRectEqualToRect';
function CGRectStandardize(rect: CGRect): CGRect; cdecl;
  external libCoreGraphics name _PU + 'CGRectStandardize';
function CGRectIsEmpty(rect: CGRect): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGRectIsEmpty';
function CGRectIsNull(rect: CGRect): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGRectIsNull';
function CGRectIsInfinite(rect: CGRect): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGRectIsInfinite';
function CGRectInset(rect: CGRect; dx: CGFloat; dy: CGFloat): CGRect; cdecl;
  external libCoreGraphics name _PU + 'CGRectInset';
function CGRectIntegral(rect: CGRect): CGRect; cdecl;
  external libCoreGraphics name _PU + 'CGRectIntegral';
function CGRectUnion(r1: CGRect; r2: CGRect): CGRect; cdecl;
  external libCoreGraphics name _PU + 'CGRectUnion';
function CGRectIntersection(r1: CGRect; r2: CGRect): CGRect; cdecl;
  external libCoreGraphics name _PU + 'CGRectIntersection';
function CGRectOffset(rect: CGRect; dx: CGFloat; dy: CGFloat): CGRect; cdecl;
  external libCoreGraphics name _PU + 'CGRectOffset';
procedure CGRectDivide(rect: CGRect; slice: Pointer; remainder: Pointer;
  amount: CGFloat; edge: CGRectEdge); cdecl;
  external libCoreGraphics name _PU + 'CGRectDivide';
function CGRectContainsPoint(rect: CGRect; point: CGPoint): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGRectContainsPoint';
function CGRectContainsRect(rect1: CGRect; rect2: CGRect): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGRectContainsRect';
function CGRectIntersectsRect(rect1: CGRect; rect2: CGRect): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGRectIntersectsRect';
function CGPointCreateDictionaryRepresentation(point: CGPoint): CFDictionaryRef;
  cdecl; external libCoreGraphics name _PU +
  'CGPointCreateDictionaryRepresentation';
function CGPointMakeWithDictionaryRepresentation(dict: CFDictionaryRef;
  point: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPointMakeWithDictionaryRepresentation';
function CGSizeCreateDictionaryRepresentation(size: CGSize): CFDictionaryRef;
  cdecl; external libCoreGraphics name _PU +
  'CGSizeCreateDictionaryRepresentation';
function CGSizeMakeWithDictionaryRepresentation(dict: CFDictionaryRef;
  size: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGSizeMakeWithDictionaryRepresentation';
function CGRectCreateDictionaryRepresentation(param1: CGRect): CFDictionaryRef;
  cdecl; external libCoreGraphics name _PU +
  'CGRectCreateDictionaryRepresentation';
function CGRectMakeWithDictionaryRepresentation(dict: CFDictionaryRef;
  rect: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGRectMakeWithDictionaryRepresentation';
function __CGPointEqualToPoint(point1: CGPoint; point2: CGPoint): Integer;
  cdecl; external libCoreGraphics name _PU + '__CGPointEqualToPoint';
function __CGSizeEqualToSize(size1: CGSize; size2: CGSize): Integer; cdecl;
  external libCoreGraphics name _PU + '__CGSizeEqualToSize';
function CGAffineTransformMake(a: CGFloat; b: CGFloat; c: CGFloat; d: CGFloat;
  tx: CGFloat; ty: CGFloat): CGAffineTransform; cdecl;
  external libCoreGraphics name _PU + 'CGAffineTransformMake';
function CGAffineTransformMakeTranslation(tx: CGFloat; ty: CGFloat)
  : CGAffineTransform; cdecl;
  external libCoreGraphics name _PU + 'CGAffineTransformMakeTranslation';
function CGAffineTransformMakeScale(sx: CGFloat; sy: CGFloat)
  : CGAffineTransform; cdecl;
  external libCoreGraphics name _PU + 'CGAffineTransformMakeScale';
function CGAffineTransformMakeRotation(angle: CGFloat): CGAffineTransform;
  cdecl; external libCoreGraphics name _PU + 'CGAffineTransformMakeRotation';
function CGAffineTransformIsIdentity(t: CGAffineTransform): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGAffineTransformIsIdentity';
function CGAffineTransformTranslate(t: CGAffineTransform; tx: CGFloat;
  ty: CGFloat): CGAffineTransform; cdecl;
  external libCoreGraphics name _PU + 'CGAffineTransformTranslate';
function CGAffineTransformScale(t: CGAffineTransform; sx: CGFloat; sy: CGFloat)
  : CGAffineTransform; cdecl;
  external libCoreGraphics name _PU + 'CGAffineTransformScale';
function CGAffineTransformRotate(t: CGAffineTransform; angle: CGFloat)
  : CGAffineTransform; cdecl;
  external libCoreGraphics name _PU + 'CGAffineTransformRotate';
function CGAffineTransformInvert(t: CGAffineTransform): CGAffineTransform;
  cdecl; external libCoreGraphics name _PU + 'CGAffineTransformInvert';
function CGAffineTransformConcat(t1: CGAffineTransform; t2: CGAffineTransform)
  : CGAffineTransform; cdecl;
  external libCoreGraphics name _PU + 'CGAffineTransformConcat';
function CGAffineTransformEqualToTransform(t1: CGAffineTransform;
  t2: CGAffineTransform): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGAffineTransformEqualToTransform';
function CGPointApplyAffineTransform(point: CGPoint; t: CGAffineTransform)
  : CGPoint; cdecl; external libCoreGraphics name _PU +
  'CGPointApplyAffineTransform';
function CGSizeApplyAffineTransform(size: CGSize; t: CGAffineTransform): CGSize;
  cdecl; external libCoreGraphics name _PU + 'CGSizeApplyAffineTransform';
function CGRectApplyAffineTransform(rect: CGRect; t: CGAffineTransform): CGRect;
  cdecl; external libCoreGraphics name _PU + 'CGRectApplyAffineTransform';
function __CGAffineTransformMake(a: CGFloat; b: CGFloat; c: CGFloat; d: CGFloat;
  tx: CGFloat; ty: CGFloat): CGAffineTransform; cdecl;
  external libCoreGraphics name _PU + '__CGAffineTransformMake';
function __CGPointApplyAffineTransform(point: CGPoint; t: CGAffineTransform)
  : CGPoint; cdecl; external libCoreGraphics name _PU +
  '__CGPointApplyAffineTransform';
function __CGSizeApplyAffineTransform(size: CGSize; t: CGAffineTransform)
  : CGSize; cdecl; external libCoreGraphics name _PU +
  '__CGSizeApplyAffineTransform';
function CGDataProviderGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGDataProviderGetTypeID';
function CGDataProviderCreateSequential(info: Pointer; callbacks: Pointer)
  : CGDataProviderRef; cdecl;
  external libCoreGraphics name _PU + 'CGDataProviderCreateSequential';
function CGDataProviderCreateDirect(info: Pointer; size: Integer;
  callbacks: Pointer): CGDataProviderRef; cdecl;
  external libCoreGraphics name _PU + 'CGDataProviderCreateDirect';
function CGDataProviderCreateWithData(info: Pointer; data: Pointer;
  size: LongWord; releaseData: CGDataProviderReleaseDataCallback)
  : CGDataProviderRef; cdecl;
  external libCoreGraphics name _PU + 'CGDataProviderCreateWithData';
function CGDataProviderCreateWithCFData(data: CFDataRef): CGDataProviderRef;
  cdecl; external libCoreGraphics name _PU + 'CGDataProviderCreateWithCFData';
function CGDataProviderCreateWithURL(url: CFURLRef): CGDataProviderRef; cdecl;
  external libCoreGraphics name _PU + 'CGDataProviderCreateWithURL';
function CGDataProviderCreateWithFilename(filename: MarshaledAString)
  : CGDataProviderRef; cdecl;
  external libCoreGraphics name _PU + 'CGDataProviderCreateWithFilename';
function CGDataProviderRetain(provider: CGDataProviderRef): CGDataProviderRef;
  cdecl; external libCoreGraphics name _PU + 'CGDataProviderRetain';
procedure CGDataProviderRelease(provider: CGDataProviderRef); cdecl;
  external libCoreGraphics name _PU + 'CGDataProviderRelease';
function CGDataProviderCopyData(provider: CGDataProviderRef): CFDataRef; cdecl;
  external libCoreGraphics name _PU + 'CGDataProviderCopyData';
function CGColorSpaceCreateDeviceGray: CGColorSpaceRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceCreateDeviceGray';
function CGColorSpaceCreateDeviceRGB: CGColorSpaceRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceCreateDeviceRGB';
function CGColorSpaceCreateDeviceCMYK: CGColorSpaceRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceCreateDeviceCMYK';
function CGColorSpaceCreateCalibratedGray(whitePoint: CGFloat;
  blackPoint: CGFloat; gamma: CGFloat): CGColorSpaceRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceCreateCalibratedGray';
function CGColorSpaceCreateCalibratedRGB(whitePoint: CGFloat;
  blackPoint: CGFloat; gamma: CGFloat; matrix: CGFloat): CGColorSpaceRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceCreateCalibratedRGB';
function CGColorSpaceCreateLab(whitePoint: CGFloat; blackPoint: CGFloat;
  range: CGFloat): CGColorSpaceRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceCreateLab';
function CGColorSpaceCreateWithICCProfile(data: CFDataRef): CGColorSpaceRef;
  cdecl; external libCoreGraphics name _PU + 'CGColorSpaceCreateWithICCProfile';
function CGColorSpaceCreateICCBased(nComponents: LongWord; range: PCGFloat;
  profile: CGDataProviderRef; alternate: CGColorSpaceRef): CGColorSpaceRef;
  cdecl; external libCoreGraphics name _PU + 'CGColorSpaceCreateICCBased';
function CGColorSpaceCreateIndexed(baseSpace: CGColorSpaceRef;
  lastIndex: LongWord; colorTable: PByte): CGColorSpaceRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceCreateIndexed';
function CGColorSpaceCreatePattern(baseSpace: CGColorSpaceRef): CGColorSpaceRef;
  cdecl; external libCoreGraphics name _PU + 'CGColorSpaceCreatePattern';
function CGColorSpaceCreateWithPlatformColorSpace(ref: Pointer)
  : CGColorSpaceRef; cdecl; external libCoreGraphics name _PU +
  'CGColorSpaceCreateWithPlatformColorSpace';
function CGColorSpaceCreateWithName(name: CFStringRef): CGColorSpaceRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceCreateWithName';
function CGColorSpaceRetain(space: CGColorSpaceRef): CGColorSpaceRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceRetain';
procedure CGColorSpaceRelease(space: CGColorSpaceRef); cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceRelease';
function CGColorSpaceCopyName(space: CGColorSpaceRef): CFStringRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceCopyName';
function CGColorSpaceGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceGetTypeID';
function CGColorSpaceGetNumberOfComponents(space: CGColorSpaceRef): LongWord;
  cdecl; external libCoreGraphics name _PU +
  'CGColorSpaceGetNumberOfComponents';
function CGColorSpaceGetModel(space: CGColorSpaceRef): CGColorSpaceModel; cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceGetModel';
function CGColorSpaceGetBaseColorSpace(space: CGColorSpaceRef): CGColorSpaceRef;
  cdecl; external libCoreGraphics name _PU + 'CGColorSpaceGetBaseColorSpace';
function CGColorSpaceGetColorTableCount(space: CGColorSpaceRef): LongWord;
  cdecl; external libCoreGraphics name _PU + 'CGColorSpaceGetColorTableCount';
procedure CGColorSpaceGetColorTable(space: CGColorSpaceRef; table: PByte);
  cdecl; external libCoreGraphics name _PU + 'CGColorSpaceGetColorTable';
function CGColorSpaceCopyICCProfile(space: CGColorSpaceRef): CFDataRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorSpaceCopyICCProfile';
function CGPatternGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGPatternGetTypeID';
function CGPatternCreate(info: Pointer; bounds: CGRect;
  matrix: CGAffineTransform; xStep: CGFloat; yStep: CGFloat;
  tiling: CGPatternTiling; isColored: Integer; callbacks: Pointer)
  : CGPatternRef; cdecl; external libCoreGraphics name _PU + 'CGPatternCreate';
function CGPatternRetain(pattern: CGPatternRef): CGPatternRef; cdecl;
  external libCoreGraphics name _PU + 'CGPatternRetain';
procedure CGPatternRelease(pattern: CGPatternRef); cdecl;
  external libCoreGraphics name _PU + 'CGPatternRelease';
function CGColorCreate(space: CGColorSpaceRef; components: PCGFloat)
  : CGColorRef; cdecl; external libCoreGraphics name _PU + 'CGColorCreate';
function CGColorCreateGenericGray(gray: CGFloat; alpha: CGFloat): CGColorRef;
  cdecl; external libCoreGraphics name _PU + 'CGColorCreateGenericGray';
function CGColorCreateGenericRGB(red: CGFloat; green: CGFloat; blue: CGFloat;
  alpha: CGFloat): CGColorRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorCreateGenericRGB';
function CGColorCreateGenericCMYK(cyan: CGFloat; magenta: CGFloat;
  yellow: CGFloat; black: CGFloat; alpha: CGFloat): CGColorRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorCreateGenericCMYK';
function CGColorGetConstantColor(colorName: CFStringRef): CGColorRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorGetConstantColor';
function CGColorCreateWithPattern(space: CGColorSpaceRef; pattern: CGPatternRef;
  components: PCGFloat): CGColorRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorCreateWithPattern';
function CGColorCreateCopy(color: CGColorRef): CGColorRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorCreateCopy';
function CGColorCreateCopyWithAlpha(color: CGColorRef; alpha: CGFloat)
  : CGColorRef; cdecl; external libCoreGraphics name _PU +
  'CGColorCreateCopyWithAlpha';
function CGColorCreateCopyByMatchingToColorSpace(param1: CGColorSpaceRef;
  intent: CGColorRenderingIntent; color: CGColorRef; options: CFDictionaryRef)
  : CGColorRef; cdecl; external libCoreGraphics name _PU +
  'CGColorCreateCopyByMatchingToColorSpace';
function CGColorRetain(color: CGColorRef): CGColorRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorRetain';
procedure CGColorRelease(color: CGColorRef); cdecl;
  external libCoreGraphics name _PU + 'CGColorRelease';
function CGColorEqualToColor(color1: CGColorRef; color2: CGColorRef): Integer;
  cdecl; external libCoreGraphics name _PU + 'CGColorEqualToColor';
function CGColorGetNumberOfComponents(color: CGColorRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGColorGetNumberOfComponents';
function CGColorGetComponents(color: CGColorRef): PCGFloat; cdecl;
  external libCoreGraphics name _PU + 'CGColorGetComponents';
function CGColorGetAlpha(color: CGColorRef): CGFloat; cdecl;
  external libCoreGraphics name _PU + 'CGColorGetAlpha';
function CGColorGetColorSpace(color: CGColorRef): CGColorSpaceRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorGetColorSpace';
function CGColorGetPattern(color: CGColorRef): CGPatternRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorGetPattern';
function CGColorGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGColorGetTypeID';
function CGFontGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGFontGetTypeID';
function CGFontCreateWithPlatformFont(platformFontReference: Pointer)
  : CGFontRef; cdecl; external libCoreGraphics name _PU +
  'CGFontCreateWithPlatformFont';
function CGFontCreateWithDataProvider(provider: CGDataProviderRef): CGFontRef;
  cdecl; external libCoreGraphics name _PU + 'CGFontCreateWithDataProvider';
function CGFontCreateWithFontName(name: CFStringRef): CGFontRef; cdecl;
  external libCoreGraphics name _PU + 'CGFontCreateWithFontName';
function CGFontCreateCopyWithVariations(font: CGFontRef;
  variations: CFDictionaryRef): CGFontRef; cdecl;
  external libCoreGraphics name _PU + 'CGFontCreateCopyWithVariations';
function CGFontRetain(font: CGFontRef): CGFontRef; cdecl;
  external libCoreGraphics name _PU + 'CGFontRetain';
procedure CGFontRelease(font: CGFontRef); cdecl;
  external libCoreGraphics name _PU + 'CGFontRelease';
function CGFontGetNumberOfGlyphs(font: CGFontRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGFontGetNumberOfGlyphs';
function CGFontGetUnitsPerEm(font: CGFontRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGFontGetUnitsPerEm';
function CGFontCopyPostScriptName(font: CGFontRef): CFStringRef; cdecl;
  external libCoreGraphics name _PU + 'CGFontCopyPostScriptName';
function CGFontCopyFullName(font: CGFontRef): CFStringRef; cdecl;
  external libCoreGraphics name _PU + 'CGFontCopyFullName';
function CGFontGetAscent(font: CGFontRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGFontGetAscent';
function CGFontGetDescent(font: CGFontRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGFontGetDescent';
function CGFontGetLeading(font: CGFontRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGFontGetLeading';
function CGFontGetCapHeight(font: CGFontRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGFontGetCapHeight';
function CGFontGetXHeight(font: CGFontRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGFontGetXHeight';
function CGFontGetFontBBox(font: CGFontRef): CGRect; cdecl;
  external libCoreGraphics name _PU + 'CGFontGetFontBBox';
function CGFontGetItalicAngle(font: CGFontRef): CGFloat; cdecl;
  external libCoreGraphics name _PU + 'CGFontGetItalicAngle';
function CGFontGetStemV(font: CGFontRef): CGFloat; cdecl;
  external libCoreGraphics name _PU + 'CGFontGetStemV';
function CGFontCopyVariationAxes(font: CGFontRef): CFArrayRef; cdecl;
  external libCoreGraphics name _PU + 'CGFontCopyVariationAxes';
function CGFontCopyVariations(font: CGFontRef): CFDictionaryRef; cdecl;
  external libCoreGraphics name _PU + 'CGFontCopyVariations';
function CGFontGetGlyphAdvances(font: CGFontRef; glyphs: unsigned short *;
  count: LongWord; advances: PInteger): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGFontGetGlyphAdvances';
function CGFontGetGlyphBBoxes(font: CGFontRef; glyphs: unsigned short *;
  count: LongWord; bboxes: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGFontGetGlyphBBoxes';
function CGFontGetGlyphWithGlyphName(font: CGFontRef; name: CFStringRef)
  : CGGlyph; cdecl; external libCoreGraphics name _PU +
  'CGFontGetGlyphWithGlyphName';
function CGFontCopyGlyphNameForGlyph(font: CGFontRef; glyph: CGGlyph)
  : CFStringRef; cdecl; external libCoreGraphics name _PU +
  'CGFontCopyGlyphNameForGlyph';
function CGFontCanCreatePostScriptSubset(font: CGFontRef;
  format: CGFontPostScriptFormat): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGFontCanCreatePostScriptSubset';
function CGFontCreatePostScriptSubset(font: CGFontRef; subsetName: CFStringRef;
  format: CGFontPostScriptFormat; glyphs: unsigned short *; count: LongWord;
  encoding: CGGlyph): CFDataRef; cdecl;
  external libCoreGraphics name _PU + 'CGFontCreatePostScriptSubset';
function CGFontCreatePostScriptEncoding(font: CGFontRef; encoding: CGGlyph)
  : CFDataRef; cdecl; external libCoreGraphics name _PU +
  'CGFontCreatePostScriptEncoding';
function CGFontCopyTableTags(font: CGFontRef): CFArrayRef; cdecl;
  external libCoreGraphics name _PU + 'CGFontCopyTableTags';
function CGFontCopyTableForTag(font: CGFontRef; tag: LongWord): CFDataRef;
  cdecl; external libCoreGraphics name _PU + 'CGFontCopyTableForTag';
function CGGradientGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGGradientGetTypeID';
function CGGradientCreateWithColorComponents(space: CGColorSpaceRef;
  components: PCGFloat; locations: PCGFloat; count: LongWord): CGGradientRef;
  cdecl; external libCoreGraphics name _PU +
  'CGGradientCreateWithColorComponents';
function CGGradientCreateWithColors(space: CGColorSpaceRef; colors: CFArrayRef;
  locations: PCGFloat): CGGradientRef; cdecl;
  external libCoreGraphics name _PU + 'CGGradientCreateWithColors';
function CGGradientRetain(gradient: CGGradientRef): CGGradientRef; cdecl;
  external libCoreGraphics name _PU + 'CGGradientRetain';
procedure CGGradientRelease(gradient: CGGradientRef); cdecl;
  external libCoreGraphics name _PU + 'CGGradientRelease';
function CGImageGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGImageGetTypeID';
function CGImageCreate(width: LongWord; height: LongWord;
  bitsPerComponent: LongWord; bitsPerPixel: LongWord; bytesPerRow: LongWord;
  space: CGColorSpaceRef; bitmapInfo: CGBitmapInfo; provider: CGDataProviderRef;
  decode: PCGFloat; shouldInterpolate: Integer; intent: CGColorRenderingIntent)
  : CGImageRef; cdecl; external libCoreGraphics name _PU + 'CGImageCreate';
function CGImageMaskCreate(width: LongWord; height: LongWord;
  bitsPerComponent: LongWord; bitsPerPixel: LongWord; bytesPerRow: LongWord;
  provider: CGDataProviderRef; decode: PCGFloat; shouldInterpolate: Integer)
  : CGImageRef; cdecl; external libCoreGraphics name _PU + 'CGImageMaskCreate';
function CGImageCreateCopy(image: CGImageRef): CGImageRef; cdecl;
  external libCoreGraphics name _PU + 'CGImageCreateCopy';
function CGImageCreateWithJPEGDataProvider(source: CGDataProviderRef;
  decode: PCGFloat; shouldInterpolate: Integer; intent: CGColorRenderingIntent)
  : CGImageRef; cdecl; external libCoreGraphics name _PU +
  'CGImageCreateWithJPEGDataProvider';
function CGImageCreateWithPNGDataProvider(source: CGDataProviderRef;
  decode: PCGFloat; shouldInterpolate: Integer; intent: CGColorRenderingIntent)
  : CGImageRef; cdecl; external libCoreGraphics name _PU +
  'CGImageCreateWithPNGDataProvider';
function CGImageCreateWithImageInRect(image: CGImageRef; rect: CGRect)
  : CGImageRef; cdecl; external libCoreGraphics name _PU +
  'CGImageCreateWithImageInRect';
function CGImageCreateWithMask(image: CGImageRef; mask: CGImageRef): CGImageRef;
  cdecl; external libCoreGraphics name _PU + 'CGImageCreateWithMask';
function CGImageCreateWithMaskingColors(image: CGImageRef; components: PCGFloat)
  : CGImageRef; cdecl; external libCoreGraphics name _PU +
  'CGImageCreateWithMaskingColors';
function CGImageCreateCopyWithColorSpace(image: CGImageRef;
  space: CGColorSpaceRef): CGImageRef; cdecl;
  external libCoreGraphics name _PU + 'CGImageCreateCopyWithColorSpace';
function CGImageRetain(image: CGImageRef): CGImageRef; cdecl;
  external libCoreGraphics name _PU + 'CGImageRetain';
procedure CGImageRelease(image: CGImageRef); cdecl;
  external libCoreGraphics name _PU + 'CGImageRelease';
function CGImageIsMask(image: CGImageRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGImageIsMask';
function CGImageGetWidth(image: CGImageRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGImageGetWidth';
function CGImageGetHeight(image: CGImageRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGImageGetHeight';
function CGImageGetBitsPerComponent(image: CGImageRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGImageGetBitsPerComponent';
function CGImageGetBitsPerPixel(image: CGImageRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGImageGetBitsPerPixel';
function CGImageGetBytesPerRow(image: CGImageRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGImageGetBytesPerRow';
function CGImageGetColorSpace(image: CGImageRef): CGColorSpaceRef; cdecl;
  external libCoreGraphics name _PU + 'CGImageGetColorSpace';
function CGImageGetAlphaInfo(image: CGImageRef): CGImageAlphaInfo; cdecl;
  external libCoreGraphics name _PU + 'CGImageGetAlphaInfo';
function CGImageGetDataProvider(image: CGImageRef): CGDataProviderRef; cdecl;
  external libCoreGraphics name _PU + 'CGImageGetDataProvider';
function CGImageGetDecode(image: CGImageRef): PCGFloat; cdecl;
  external libCoreGraphics name _PU + 'CGImageGetDecode';
function CGImageGetShouldInterpolate(image: CGImageRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGImageGetShouldInterpolate';
function CGImageGetRenderingIntent(image: CGImageRef): CGColorRenderingIntent;
  cdecl; external libCoreGraphics name _PU + 'CGImageGetRenderingIntent';
function CGImageGetBitmapInfo(image: CGImageRef): CGBitmapInfo; cdecl;
  external libCoreGraphics name _PU + 'CGImageGetBitmapInfo';
function CGImageGetUTType(image: CGImageRef): CFStringRef; cdecl;
  external libCoreGraphics name _PU + 'CGImageGetUTType';
function CGPathGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGPathGetTypeID';
function CGPathCreateMutable: CGMutablePathRef; cdecl;
  external libCoreGraphics name _PU + 'CGPathCreateMutable';
function CGPathCreateCopy(path: CGPathRef): CGPathRef; cdecl;
  external libCoreGraphics name _PU + 'CGPathCreateCopy';
function CGPathCreateCopyByTransformingPath(path: CGPathRef; transform: Pointer)
  : CGPathRef; cdecl; external libCoreGraphics name _PU +
  'CGPathCreateCopyByTransformingPath';
function CGPathCreateMutableCopy(path: CGPathRef): CGMutablePathRef; cdecl;
  external libCoreGraphics name _PU + 'CGPathCreateMutableCopy';
function CGPathCreateMutableCopyByTransformingPath(path: CGPathRef;
  transform: Pointer): CGMutablePathRef; cdecl;
  external libCoreGraphics name _PU +
  'CGPathCreateMutableCopyByTransformingPath';
function CGPathCreateWithRect(rect: CGRect; transform: Pointer): CGPathRef;
  cdecl; external libCoreGraphics name _PU + 'CGPathCreateWithRect';
function CGPathCreateWithEllipseInRect(rect: CGRect; transform: Pointer)
  : CGPathRef; cdecl; external libCoreGraphics name _PU +
  'CGPathCreateWithEllipseInRect';
function CGPathCreateWithRoundedRect(rect: CGRect; cornerWidth: CGFloat;
  cornerHeight: CGFloat; transform: Pointer): CGPathRef; cdecl;
  external libCoreGraphics name _PU + 'CGPathCreateWithRoundedRect';
procedure CGPathAddRoundedRect(path: CGMutablePathRef; transform: Pointer;
  rect: CGRect; cornerWidth: CGFloat; cornerHeight: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGPathAddRoundedRect';
function CGPathCreateCopyByDashingPath(path: CGPathRef; transform: Pointer;
  phase: CGFloat; lengths: PCGFloat; count: LongWord): CGPathRef; cdecl;
  external libCoreGraphics name _PU + 'CGPathCreateCopyByDashingPath';
function CGPathCreateCopyByStrokingPath(path: CGPathRef; transform: Pointer;
  lineWidth: CGFloat; lineCap: CGLineCap; lineJoin: CGLineJoin;
  miterLimit: CGFloat): CGPathRef; cdecl;
  external libCoreGraphics name _PU + 'CGPathCreateCopyByStrokingPath';
function CGPathRetain(path: CGPathRef): CGPathRef; cdecl;
  external libCoreGraphics name _PU + 'CGPathRetain';
procedure CGPathRelease(path: CGPathRef); cdecl;
  external libCoreGraphics name _PU + 'CGPathRelease';
function CGPathEqualToPath(path1: CGPathRef; path2: CGPathRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPathEqualToPath';
procedure CGPathMoveToPoint(path: CGMutablePathRef; m: Pointer; x: CGFloat;
  y: CGFloat); cdecl; external libCoreGraphics name _PU + 'CGPathMoveToPoint';
procedure CGPathAddLineToPoint(path: CGMutablePathRef; m: Pointer; x: CGFloat;
  y: CGFloat); cdecl; external libCoreGraphics name _PU +
  'CGPathAddLineToPoint';
procedure CGPathAddQuadCurveToPoint(path: CGMutablePathRef; m: Pointer;
  cpx: CGFloat; cpy: CGFloat; x: CGFloat; y: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGPathAddQuadCurveToPoint';
procedure CGPathAddCurveToPoint(path: CGMutablePathRef; m: Pointer;
  cp1x: CGFloat; cp1y: CGFloat; cp2x: CGFloat; cp2y: CGFloat; x: CGFloat;
  y: CGFloat); cdecl; external libCoreGraphics name _PU +
  'CGPathAddCurveToPoint';
procedure CGPathCloseSubpath(path: CGMutablePathRef); cdecl;
  external libCoreGraphics name _PU + 'CGPathCloseSubpath';
procedure CGPathAddRect(path: CGMutablePathRef; m: Pointer; rect: CGRect);
  cdecl; external libCoreGraphics name _PU + 'CGPathAddRect';
procedure CGPathAddRects(path: CGMutablePathRef; m: Pointer; rects: Pointer;
  count: LongWord); cdecl; external libCoreGraphics name _PU + 'CGPathAddRects';
procedure CGPathAddLines(path: CGMutablePathRef; m: Pointer; points: Pointer;
  count: LongWord); cdecl; external libCoreGraphics name _PU + 'CGPathAddLines';
procedure CGPathAddEllipseInRect(path: CGMutablePathRef; m: Pointer;
  rect: CGRect); cdecl; external libCoreGraphics name _PU +
  'CGPathAddEllipseInRect';
procedure CGPathAddRelativeArc(path: CGMutablePathRef; matrix: Pointer;
  x: CGFloat; y: CGFloat; radius: CGFloat; startAngle: CGFloat; delta: CGFloat);
  cdecl; external libCoreGraphics name _PU + 'CGPathAddRelativeArc';
procedure CGPathAddArc(path: CGMutablePathRef; m: Pointer; x: CGFloat;
  y: CGFloat; radius: CGFloat; startAngle: CGFloat; endAngle: CGFloat;
  clockwise: Integer); cdecl;
  external libCoreGraphics name _PU + 'CGPathAddArc';
procedure CGPathAddArcToPoint(path: CGMutablePathRef; m: Pointer; x1: CGFloat;
  y1: CGFloat; x2: CGFloat; y2: CGFloat; radius: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGPathAddArcToPoint';
procedure CGPathAddPath(path1: CGMutablePathRef; m: Pointer; path2: CGPathRef);
  cdecl; external libCoreGraphics name _PU + 'CGPathAddPath';
function CGPathIsEmpty(path: CGPathRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPathIsEmpty';
function CGPathIsRect(path: CGPathRef; rect: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPathIsRect';
function CGPathGetCurrentPoint(path: CGPathRef): CGPoint; cdecl;
  external libCoreGraphics name _PU + 'CGPathGetCurrentPoint';
function CGPathGetBoundingBox(path: CGPathRef): CGRect; cdecl;
  external libCoreGraphics name _PU + 'CGPathGetBoundingBox';
function CGPathGetPathBoundingBox(path: CGPathRef): CGRect; cdecl;
  external libCoreGraphics name _PU + 'CGPathGetPathBoundingBox';
function CGPathContainsPoint(path: CGPathRef; m: Pointer; point: CGPoint;
  eoFill: Integer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPathContainsPoint';
procedure CGPathApply(path: CGPathRef; info: Pointer;
  &function: CGPathApplierFunction); cdecl;
  external libCoreGraphics name _PU + 'CGPathApply';
function CGPDFObjectGetType(&object: CGPDFObjectRef): CGPDFObjectType; cdecl;
  external libCoreGraphics name _PU + 'CGPDFObjectGetType';
function CGPDFObjectGetValue(&object: CGPDFObjectRef; &type: CGPDFObjectType;
  value: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFObjectGetValue';
function CGPDFStreamGetDictionary(stream: CGPDFStreamRef): CGPDFDictionaryRef;
  cdecl; external libCoreGraphics name _PU + 'CGPDFStreamGetDictionary';
function CGPDFStreamCopyData(stream: CGPDFStreamRef; format: Int32): CFDataRef;
  cdecl; external libCoreGraphics name _PU + 'CGPDFStreamCopyData';
function CGPDFStringGetLength(&string: CGPDFStringRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGPDFStringGetLength';
function CGPDFStringGetBytePtr(&string: CGPDFStringRef): PByte; cdecl;
  external libCoreGraphics name _PU + 'CGPDFStringGetBytePtr';
function CGPDFStringCopyTextString(&string: CGPDFStringRef): CFStringRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFStringCopyTextString';
function CGPDFStringCopyDate(&string: CGPDFStringRef): CFDateRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFStringCopyDate';
function CGPDFArrayGetCount(&array: CGPDFArrayRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGPDFArrayGetCount';
function CGPDFArrayGetObject(&array: CGPDFArrayRef; index: LongWord;
  value: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFArrayGetObject';
function CGPDFArrayGetNull(&array: CGPDFArrayRef; index: LongWord): Integer;
  cdecl; external libCoreGraphics name _PU + 'CGPDFArrayGetNull';
function CGPDFArrayGetBoolean(&array: CGPDFArrayRef; index: LongWord;
  value: PByte): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFArrayGetBoolean';
function CGPDFArrayGetInteger(&array: CGPDFArrayRef; index: LongWord;
  value: PLongInt): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFArrayGetInteger';
function CGPDFArrayGetNumber(&array: CGPDFArrayRef; index: LongWord;
  value: PCGFloat): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFArrayGetNumber';
function CGPDFArrayGetName(&array: CGPDFArrayRef; index: LongWord;
  value: MarshaledAString): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFArrayGetName';
function CGPDFArrayGetString(&array: CGPDFArrayRef; index: LongWord;
  value: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFArrayGetString';
function CGPDFArrayGetArray(&array: CGPDFArrayRef; index: LongWord;
  value: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFArrayGetArray';
function CGPDFArrayGetDictionary(&array: CGPDFArrayRef; index: LongWord;
  value: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFArrayGetDictionary';
function CGPDFArrayGetStream(&array: CGPDFArrayRef; index: LongWord;
  value: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFArrayGetStream';
function CGPDFDictionaryGetCount(dict: CGPDFDictionaryRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDictionaryGetCount';
function CGPDFDictionaryGetObject(dict: CGPDFDictionaryRef;
  key: MarshaledAString; value: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDictionaryGetObject';
function CGPDFDictionaryGetBoolean(dict: CGPDFDictionaryRef;
  key: MarshaledAString; value: PByte): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDictionaryGetBoolean';
function CGPDFDictionaryGetInteger(dict: CGPDFDictionaryRef;
  key: MarshaledAString; value: PLongInt): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDictionaryGetInteger';
function CGPDFDictionaryGetNumber(dict: CGPDFDictionaryRef;
  key: MarshaledAString; value: PCGFloat): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDictionaryGetNumber';
function CGPDFDictionaryGetName(dict: CGPDFDictionaryRef; key: MarshaledAString;
  value: MarshaledAString): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDictionaryGetName';
function CGPDFDictionaryGetString(dict: CGPDFDictionaryRef;
  key: MarshaledAString; value: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDictionaryGetString';
function CGPDFDictionaryGetArray(dict: CGPDFDictionaryRef;
  key: MarshaledAString; value: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDictionaryGetArray';
function CGPDFDictionaryGetDictionary(dict: CGPDFDictionaryRef;
  key: MarshaledAString; value: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDictionaryGetDictionary';
function CGPDFDictionaryGetStream(dict: CGPDFDictionaryRef;
  key: MarshaledAString; value: Pointer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDictionaryGetStream';
procedure CGPDFDictionaryApplyFunction(dict: CGPDFDictionaryRef;
  &function: CGPDFDictionaryApplierFunction; info: Pointer); cdecl;
  external libCoreGraphics name _PU + 'CGPDFDictionaryApplyFunction';
function CGPDFPageRetain(page: CGPDFPageRef): CGPDFPageRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFPageRetain';
procedure CGPDFPageRelease(page: CGPDFPageRef); cdecl;
  external libCoreGraphics name _PU + 'CGPDFPageRelease';
function CGPDFPageGetDocument(page: CGPDFPageRef): CGPDFDocumentRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFPageGetDocument';
function CGPDFPageGetPageNumber(page: CGPDFPageRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGPDFPageGetPageNumber';
function CGPDFPageGetBoxRect(page: CGPDFPageRef; box: CGPDFBox): CGRect; cdecl;
  external libCoreGraphics name _PU + 'CGPDFPageGetBoxRect';
function CGPDFPageGetRotationAngle(page: CGPDFPageRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFPageGetRotationAngle';
function CGPDFPageGetDrawingTransform(page: CGPDFPageRef; box: CGPDFBox;
  rect: CGRect; rotate: Integer; preserveAspectRatio: Integer)
  : CGAffineTransform; cdecl;
  external libCoreGraphics name _PU + 'CGPDFPageGetDrawingTransform';
function CGPDFPageGetDictionary(page: CGPDFPageRef): CGPDFDictionaryRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFPageGetDictionary';
function CGPDFPageGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGPDFPageGetTypeID';
function CGPDFDocumentCreateWithProvider(provider: CGDataProviderRef)
  : CGPDFDocumentRef; cdecl; external libCoreGraphics name _PU +
  'CGPDFDocumentCreateWithProvider';
function CGPDFDocumentCreateWithURL(url: CFURLRef): CGPDFDocumentRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDocumentCreateWithURL';
function CGPDFDocumentRetain(document: CGPDFDocumentRef): CGPDFDocumentRef;
  cdecl; external libCoreGraphics name _PU + 'CGPDFDocumentRetain';
procedure CGPDFDocumentRelease(document: CGPDFDocumentRef); cdecl;
  external libCoreGraphics name _PU + 'CGPDFDocumentRelease';
procedure CGPDFDocumentGetVersion(document: CGPDFDocumentRef;
  majorVersion: PInteger; minorVersion: PInteger); cdecl;
  external libCoreGraphics name _PU + 'CGPDFDocumentGetVersion';
function CGPDFDocumentIsEncrypted(document: CGPDFDocumentRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDocumentIsEncrypted';
function CGPDFDocumentUnlockWithPassword(document: CGPDFDocumentRef;
  password: MarshaledAString): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDocumentUnlockWithPassword';
function CGPDFDocumentIsUnlocked(document: CGPDFDocumentRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDocumentIsUnlocked';
function CGPDFDocumentAllowsPrinting(document: CGPDFDocumentRef): Integer;
  cdecl; external libCoreGraphics name _PU + 'CGPDFDocumentAllowsPrinting';
function CGPDFDocumentAllowsCopying(document: CGPDFDocumentRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDocumentAllowsCopying';
function CGPDFDocumentGetNumberOfPages(document: CGPDFDocumentRef): LongWord;
  cdecl; external libCoreGraphics name _PU + 'CGPDFDocumentGetNumberOfPages';
function CGPDFDocumentGetPage(document: CGPDFDocumentRef; pageNumber: LongWord)
  : CGPDFPageRef; cdecl; external libCoreGraphics name _PU +
  'CGPDFDocumentGetPage';
function CGPDFDocumentGetCatalog(document: CGPDFDocumentRef)
  : CGPDFDictionaryRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDocumentGetCatalog';
function CGPDFDocumentGetInfo(document: CGPDFDocumentRef): CGPDFDictionaryRef;
  cdecl; external libCoreGraphics name _PU + 'CGPDFDocumentGetInfo';
function CGPDFDocumentGetID(document: CGPDFDocumentRef): CGPDFArrayRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDocumentGetID';
function CGPDFDocumentGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDocumentGetTypeID';
function CGPDFDocumentGetMediaBox(document: CGPDFDocumentRef; page: Integer)
  : CGRect; cdecl; external libCoreGraphics name _PU +
  'CGPDFDocumentGetMediaBox';
function CGPDFDocumentGetCropBox(document: CGPDFDocumentRef; page: Integer)
  : CGRect; cdecl; external libCoreGraphics name _PU +
  'CGPDFDocumentGetCropBox';
function CGPDFDocumentGetBleedBox(document: CGPDFDocumentRef; page: Integer)
  : CGRect; cdecl; external libCoreGraphics name _PU +
  'CGPDFDocumentGetBleedBox';
function CGPDFDocumentGetTrimBox(document: CGPDFDocumentRef; page: Integer)
  : CGRect; cdecl; external libCoreGraphics name _PU +
  'CGPDFDocumentGetTrimBox';
function CGPDFDocumentGetArtBox(document: CGPDFDocumentRef; page: Integer)
  : CGRect; cdecl; external libCoreGraphics name _PU + 'CGPDFDocumentGetArtBox';
function CGPDFDocumentGetRotationAngle(document: CGPDFDocumentRef;
  page: Integer): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFDocumentGetRotationAngle';
function CGFunctionGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGFunctionGetTypeID';
function CGFunctionCreate(info: Pointer; domainDimension: LongWord;
  domain: PCGFloat; rangeDimension: LongWord; range: PCGFloat;
  callbacks: Pointer): CGFunctionRef; cdecl;
  external libCoreGraphics name _PU + 'CGFunctionCreate';
function CGFunctionRetain(&function: CGFunctionRef): CGFunctionRef; cdecl;
  external libCoreGraphics name _PU + 'CGFunctionRetain';
procedure CGFunctionRelease(&function: CGFunctionRef); cdecl;
  external libCoreGraphics name _PU + 'CGFunctionRelease';
function CGShadingGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGShadingGetTypeID';
function CGShadingCreateAxial(space: CGColorSpaceRef; start: CGPoint;
  &end: CGPoint; &function: CGFunctionRef; extendStart: Integer;
  extendEnd: Integer): CGShadingRef; cdecl;
  external libCoreGraphics name _PU + 'CGShadingCreateAxial';
function CGShadingCreateRadial(space: CGColorSpaceRef; start: CGPoint;
  startRadius: CGFloat; &end: CGPoint; endRadius: CGFloat;
  &function: CGFunctionRef; extendStart: Integer; extendEnd: Integer)
  : CGShadingRef; cdecl; external libCoreGraphics name _PU +
  'CGShadingCreateRadial';
function CGShadingRetain(shading: CGShadingRef): CGShadingRef; cdecl;
  external libCoreGraphics name _PU + 'CGShadingRetain';
procedure CGShadingRelease(shading: CGShadingRef); cdecl;
  external libCoreGraphics name _PU + 'CGShadingRelease';
function CGContextGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGContextGetTypeID';
procedure CGContextSaveGState(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextSaveGState';
procedure CGContextRestoreGState(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextRestoreGState';
procedure CGContextScaleCTM(c: CGContextRef; sx: CGFloat; sy: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextScaleCTM';
procedure CGContextTranslateCTM(c: CGContextRef; tx: CGFloat; ty: CGFloat);
  cdecl; external libCoreGraphics name _PU + 'CGContextTranslateCTM';
procedure CGContextRotateCTM(c: CGContextRef; angle: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextRotateCTM';
procedure CGContextConcatCTM(c: CGContextRef; transform: CGAffineTransform);
  cdecl; external libCoreGraphics name _PU + 'CGContextConcatCTM';
function CGContextGetCTM(c: CGContextRef): CGAffineTransform; cdecl;
  external libCoreGraphics name _PU + 'CGContextGetCTM';
procedure CGContextSetLineWidth(c: CGContextRef; width: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetLineWidth';
procedure CGContextSetLineCap(c: CGContextRef; cap: CGLineCap); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetLineCap';
procedure CGContextSetLineJoin(c: CGContextRef; join: CGLineJoin); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetLineJoin';
procedure CGContextSetMiterLimit(c: CGContextRef; limit: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetMiterLimit';
procedure CGContextSetLineDash(c: CGContextRef; phase: CGFloat;
  lengths: PCGFloat; count: LongWord); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetLineDash';
procedure CGContextSetFlatness(c: CGContextRef; flatness: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetFlatness';
procedure CGContextSetAlpha(c: CGContextRef; alpha: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetAlpha';
procedure CGContextSetBlendMode(c: CGContextRef; mode: CGBlendMode); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetBlendMode';
procedure CGContextBeginPath(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextBeginPath';
procedure CGContextMoveToPoint(c: CGContextRef; x: CGFloat; y: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextMoveToPoint';
procedure CGContextAddLineToPoint(c: CGContextRef; x: CGFloat; y: CGFloat);
  cdecl; external libCoreGraphics name _PU + 'CGContextAddLineToPoint';
procedure CGContextAddCurveToPoint(c: CGContextRef; cp1x: CGFloat;
  cp1y: CGFloat; cp2x: CGFloat; cp2y: CGFloat; x: CGFloat; y: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextAddCurveToPoint';
procedure CGContextAddQuadCurveToPoint(c: CGContextRef; cpx: CGFloat;
  cpy: CGFloat; x: CGFloat; y: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextAddQuadCurveToPoint';
procedure CGContextClosePath(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextClosePath';
procedure CGContextAddRect(c: CGContextRef; rect: CGRect); cdecl;
  external libCoreGraphics name _PU + 'CGContextAddRect';
procedure CGContextAddRects(c: CGContextRef; rects: Pointer; count: LongWord);
  cdecl; external libCoreGraphics name _PU + 'CGContextAddRects';
procedure CGContextAddLines(c: CGContextRef; points: Pointer; count: LongWord);
  cdecl; external libCoreGraphics name _PU + 'CGContextAddLines';
procedure CGContextAddEllipseInRect(c: CGContextRef; rect: CGRect); cdecl;
  external libCoreGraphics name _PU + 'CGContextAddEllipseInRect';
procedure CGContextAddArc(c: CGContextRef; x: CGFloat; y: CGFloat;
  radius: CGFloat; startAngle: CGFloat; endAngle: CGFloat; clockwise: Integer);
  cdecl; external libCoreGraphics name _PU + 'CGContextAddArc';
procedure CGContextAddArcToPoint(c: CGContextRef; x1: CGFloat; y1: CGFloat;
  x2: CGFloat; y2: CGFloat; radius: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextAddArcToPoint';
procedure CGContextAddPath(c: CGContextRef; path: CGPathRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextAddPath';
procedure CGContextReplacePathWithStrokedPath(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextReplacePathWithStrokedPath';
function CGContextIsPathEmpty(c: CGContextRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGContextIsPathEmpty';
function CGContextGetPathCurrentPoint(c: CGContextRef): CGPoint; cdecl;
  external libCoreGraphics name _PU + 'CGContextGetPathCurrentPoint';
function CGContextGetPathBoundingBox(c: CGContextRef): CGRect; cdecl;
  external libCoreGraphics name _PU + 'CGContextGetPathBoundingBox';
function CGContextCopyPath(c: CGContextRef): CGPathRef; cdecl;
  external libCoreGraphics name _PU + 'CGContextCopyPath';
function CGContextPathContainsPoint(c: CGContextRef; point: CGPoint;
  mode: CGPathDrawingMode): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGContextPathContainsPoint';
procedure CGContextDrawPath(c: CGContextRef; mode: CGPathDrawingMode); cdecl;
  external libCoreGraphics name _PU + 'CGContextDrawPath';
procedure CGContextFillPath(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextFillPath';
procedure CGContextEOFillPath(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextEOFillPath';
procedure CGContextStrokePath(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextStrokePath';
procedure CGContextFillRect(c: CGContextRef; rect: CGRect); cdecl;
  external libCoreGraphics name _PU + 'CGContextFillRect';
procedure CGContextFillRects(c: CGContextRef; rects: Pointer; count: LongWord);
  cdecl; external libCoreGraphics name _PU + 'CGContextFillRects';
procedure CGContextStrokeRect(c: CGContextRef; rect: CGRect); cdecl;
  external libCoreGraphics name _PU + 'CGContextStrokeRect';
procedure CGContextStrokeRectWithWidth(c: CGContextRef; rect: CGRect;
  width: CGFloat); cdecl; external libCoreGraphics name _PU +
  'CGContextStrokeRectWithWidth';
procedure CGContextClearRect(c: CGContextRef; rect: CGRect); cdecl;
  external libCoreGraphics name _PU + 'CGContextClearRect';
procedure CGContextFillEllipseInRect(c: CGContextRef; rect: CGRect); cdecl;
  external libCoreGraphics name _PU + 'CGContextFillEllipseInRect';
procedure CGContextStrokeEllipseInRect(c: CGContextRef; rect: CGRect); cdecl;
  external libCoreGraphics name _PU + 'CGContextStrokeEllipseInRect';
procedure CGContextStrokeLineSegments(c: CGContextRef; points: Pointer;
  count: LongWord); cdecl; external libCoreGraphics name _PU +
  'CGContextStrokeLineSegments';
procedure CGContextClip(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextClip';
procedure CGContextEOClip(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextEOClip';
procedure CGContextClipToMask(c: CGContextRef; rect: CGRect; mask: CGImageRef);
  cdecl; external libCoreGraphics name _PU + 'CGContextClipToMask';
function CGContextGetClipBoundingBox(c: CGContextRef): CGRect; cdecl;
  external libCoreGraphics name _PU + 'CGContextGetClipBoundingBox';
procedure CGContextClipToRect(c: CGContextRef; rect: CGRect); cdecl;
  external libCoreGraphics name _PU + 'CGContextClipToRect';
procedure CGContextClipToRects(c: CGContextRef; rects: Pointer;
  count: LongWord); cdecl; external libCoreGraphics name _PU +
  'CGContextClipToRects';
procedure CGContextSetFillColorWithColor(c: CGContextRef; color: CGColorRef);
  cdecl; external libCoreGraphics name _PU + 'CGContextSetFillColorWithColor';
procedure CGContextSetStrokeColorWithColor(c: CGContextRef; color: CGColorRef);
  cdecl; external libCoreGraphics name _PU + 'CGContextSetStrokeColorWithColor';
procedure CGContextSetFillColorSpace(c: CGContextRef; space: CGColorSpaceRef);
  cdecl; external libCoreGraphics name _PU + 'CGContextSetFillColorSpace';
procedure CGContextSetStrokeColorSpace(c: CGContextRef; space: CGColorSpaceRef);
  cdecl; external libCoreGraphics name _PU + 'CGContextSetStrokeColorSpace';
procedure CGContextSetFillColor(c: CGContextRef; components: PCGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetFillColor';
procedure CGContextSetStrokeColor(c: CGContextRef; components: PCGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetStrokeColor';
procedure CGContextSetFillPattern(c: CGContextRef; pattern: CGPatternRef;
  components: PCGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetFillPattern';
procedure CGContextSetStrokePattern(c: CGContextRef; pattern: CGPatternRef;
  components: PCGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetStrokePattern';
procedure CGContextSetPatternPhase(c: CGContextRef; phase: CGSize); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetPatternPhase';
procedure CGContextSetGrayFillColor(c: CGContextRef; gray: CGFloat;
  alpha: CGFloat); cdecl; external libCoreGraphics name _PU +
  'CGContextSetGrayFillColor';
procedure CGContextSetGrayStrokeColor(c: CGContextRef; gray: CGFloat;
  alpha: CGFloat); cdecl; external libCoreGraphics name _PU +
  'CGContextSetGrayStrokeColor';
procedure CGContextSetRGBFillColor(c: CGContextRef; red: CGFloat;
  green: CGFloat; blue: CGFloat; alpha: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetRGBFillColor';
procedure CGContextSetRGBStrokeColor(c: CGContextRef; red: CGFloat;
  green: CGFloat; blue: CGFloat; alpha: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetRGBStrokeColor';
procedure CGContextSetCMYKFillColor(c: CGContextRef; cyan: CGFloat;
  magenta: CGFloat; yellow: CGFloat; black: CGFloat; alpha: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetCMYKFillColor';
procedure CGContextSetCMYKStrokeColor(c: CGContextRef; cyan: CGFloat;
  magenta: CGFloat; yellow: CGFloat; black: CGFloat; alpha: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetCMYKStrokeColor';
procedure CGContextSetRenderingIntent(c: CGContextRef;
  intent: CGColorRenderingIntent); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetRenderingIntent';
procedure CGContextDrawImage(c: CGContextRef; rect: CGRect; image: CGImageRef);
  cdecl; external libCoreGraphics name _PU + 'CGContextDrawImage';
procedure CGContextDrawTiledImage(c: CGContextRef; rect: CGRect;
  image: CGImageRef); cdecl; external libCoreGraphics name _PU +
  'CGContextDrawTiledImage';
function CGContextGetInterpolationQuality(c: CGContextRef)
  : CGInterpolationQuality; cdecl;
  external libCoreGraphics name _PU + 'CGContextGetInterpolationQuality';
procedure CGContextSetInterpolationQuality(c: CGContextRef;
  quality: CGInterpolationQuality); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetInterpolationQuality';
procedure CGContextSetShadowWithColor(c: CGContextRef; offset: CGSize;
  blur: CGFloat; color: CGColorRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetShadowWithColor';
procedure CGContextSetShadow(c: CGContextRef; offset: CGSize; blur: CGFloat);
  cdecl; external libCoreGraphics name _PU + 'CGContextSetShadow';
procedure CGContextDrawLinearGradient(c: CGContextRef; gradient: CGGradientRef;
  startPoint: CGPoint; endPoint: CGPoint; options: CGGradientDrawingOptions);
  cdecl; external libCoreGraphics name _PU + 'CGContextDrawLinearGradient';
procedure CGContextDrawRadialGradient(c: CGContextRef; gradient: CGGradientRef;
  startCenter: CGPoint; startRadius: CGFloat; endCenter: CGPoint;
  endRadius: CGFloat; options: CGGradientDrawingOptions); cdecl;
  external libCoreGraphics name _PU + 'CGContextDrawRadialGradient';
procedure CGContextDrawShading(c: CGContextRef; shading: CGShadingRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextDrawShading';
procedure CGContextSetCharacterSpacing(c: CGContextRef; spacing: CGFloat);
  cdecl; external libCoreGraphics name _PU + 'CGContextSetCharacterSpacing';
procedure CGContextSetTextPosition(c: CGContextRef; x: CGFloat; y: CGFloat);
  cdecl; external libCoreGraphics name _PU + 'CGContextSetTextPosition';
function CGContextGetTextPosition(c: CGContextRef): CGPoint; cdecl;
  external libCoreGraphics name _PU + 'CGContextGetTextPosition';
procedure CGContextSetTextMatrix(c: CGContextRef; t: CGAffineTransform); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetTextMatrix';
function CGContextGetTextMatrix(c: CGContextRef): CGAffineTransform; cdecl;
  external libCoreGraphics name _PU + 'CGContextGetTextMatrix';
procedure CGContextSetTextDrawingMode(c: CGContextRef; mode: CGTextDrawingMode);
  cdecl; external libCoreGraphics name _PU + 'CGContextSetTextDrawingMode';
procedure CGContextSetFont(c: CGContextRef; font: CGFontRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetFont';
procedure CGContextSetFontSize(c: CGContextRef; size: CGFloat); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetFontSize';
procedure CGContextShowGlyphsAtPositions(c: CGContextRef;
  glyphs: unsigned short *; Lpositions: Pointer; count: LongWord); cdecl;
  external libCoreGraphics name _PU + 'CGContextShowGlyphsAtPositions';
procedure CGContextDrawPDFPage(c: CGContextRef; page: CGPDFPageRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextDrawPDFPage';
procedure CGContextBeginPage(c: CGContextRef; mediaBox: Pointer); cdecl;
  external libCoreGraphics name _PU + 'CGContextBeginPage';
procedure CGContextEndPage(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextEndPage';
function CGContextRetain(c: CGContextRef): CGContextRef; cdecl;
  external libCoreGraphics name _PU + 'CGContextRetain';
procedure CGContextRelease(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextRelease';
procedure CGContextFlush(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextFlush';
procedure CGContextSynchronize(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextSynchronize';
procedure CGContextSetShouldAntialias(c: CGContextRef;
  shouldAntialias: Integer); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetShouldAntialias';
procedure CGContextSetAllowsAntialiasing(c: CGContextRef;
  allowsAntialiasing: Integer); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetAllowsAntialiasing';
procedure CGContextSetShouldSmoothFonts(c: CGContextRef;
  shouldSmoothFonts: Integer); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetShouldSmoothFonts';
procedure CGContextSetAllowsFontSmoothing(c: CGContextRef;
  allowsFontSmoothing: Integer); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetAllowsFontSmoothing';
procedure CGContextSetShouldSubpixelPositionFonts(c: CGContextRef;
  shouldSubpixelPositionFonts: Integer); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetShouldSubpixelPositionFonts';
procedure CGContextSetAllowsFontSubpixelPositioning(c: CGContextRef;
  allowsFontSubpixelPositioning: Integer); cdecl;
  external libCoreGraphics name _PU +
  'CGContextSetAllowsFontSubpixelPositioning';
procedure CGContextSetShouldSubpixelQuantizeFonts(c: CGContextRef;
  shouldSubpixelQuantizeFonts: Integer); cdecl;
  external libCoreGraphics name _PU + 'CGContextSetShouldSubpixelQuantizeFonts';
procedure CGContextSetAllowsFontSubpixelQuantization(c: CGContextRef;
  allowsFontSubpixelQuantization: Integer); cdecl;
  external libCoreGraphics name _PU +
  'CGContextSetAllowsFontSubpixelQuantization';
procedure CGContextBeginTransparencyLayer(c: CGContextRef;
  auxiliaryInfo: CFDictionaryRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextBeginTransparencyLayer';
procedure CGContextBeginTransparencyLayerWithRect(c: CGContextRef; rect: CGRect;
  auxInfo: CFDictionaryRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextBeginTransparencyLayerWithRect';
procedure CGContextEndTransparencyLayer(c: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGContextEndTransparencyLayer';
function CGContextGetUserSpaceToDeviceSpaceTransform(c: CGContextRef)
  : CGAffineTransform; cdecl;
  external libCoreGraphics name _PU +
  'CGContextGetUserSpaceToDeviceSpaceTransform';
function CGContextConvertPointToDeviceSpace(c: CGContextRef; point: CGPoint)
  : CGPoint; cdecl; external libCoreGraphics name _PU +
  'CGContextConvertPointToDeviceSpace';
function CGContextConvertPointToUserSpace(c: CGContextRef; point: CGPoint)
  : CGPoint; cdecl; external libCoreGraphics name _PU +
  'CGContextConvertPointToUserSpace';
function CGContextConvertSizeToDeviceSpace(c: CGContextRef; size: CGSize)
  : CGSize; cdecl; external libCoreGraphics name _PU +
  'CGContextConvertSizeToDeviceSpace';
function CGContextConvertSizeToUserSpace(c: CGContextRef; size: CGSize): CGSize;
  cdecl; external libCoreGraphics name _PU + 'CGContextConvertSizeToUserSpace';
function CGContextConvertRectToDeviceSpace(c: CGContextRef; rect: CGRect)
  : CGRect; cdecl; external libCoreGraphics name _PU +
  'CGContextConvertRectToDeviceSpace';
function CGContextConvertRectToUserSpace(c: CGContextRef; rect: CGRect): CGRect;
  cdecl; external libCoreGraphics name _PU + 'CGContextConvertRectToUserSpace';
procedure CGContextSelectFont(c: CGContextRef; name: MarshaledAString;
  size: CGFloat; textEncoding: CGTextEncoding); cdecl;
  external libCoreGraphics name _PU + 'CGContextSelectFont';
procedure CGContextShowText(c: CGContextRef; &string: MarshaledAString;
  length: LongWord); cdecl; external libCoreGraphics name _PU +
  'CGContextShowText';
procedure CGContextShowTextAtPoint(c: CGContextRef; x: CGFloat; y: CGFloat;
  &string: MarshaledAString; length: LongWord); cdecl;
  external libCoreGraphics name _PU + 'CGContextShowTextAtPoint';
procedure CGContextShowGlyphs(c: CGContextRef; g: unsigned short *;
  count: LongWord); cdecl; external libCoreGraphics name _PU +
  'CGContextShowGlyphs';
procedure CGContextShowGlyphsAtPoint(c: CGContextRef; x: CGFloat; y: CGFloat;
  glyphs: unsigned short *; count: LongWord); cdecl;
  external libCoreGraphics name _PU + 'CGContextShowGlyphsAtPoint';
procedure CGContextShowGlyphsWithAdvances(c: CGContextRef;
  glyphs: unsigned short *; advances: Pointer; count: LongWord); cdecl;
  external libCoreGraphics name _PU + 'CGContextShowGlyphsWithAdvances';
procedure CGContextDrawPDFDocument(c: CGContextRef; rect: CGRect;
  document: CGPDFDocumentRef; page: Integer); cdecl;
  external libCoreGraphics name _PU + 'CGContextDrawPDFDocument';
function CGBitmapContextCreateWithData(data: Pointer; width: LongWord;
  height: LongWord; bitsPerComponent: LongWord; bytesPerRow: LongWord;
  space: CGColorSpaceRef; bitmapInfo: LongWord;
  releaseCallback: CGBitmapContextReleaseDataCallback; releaseInfo: Pointer)
  : CGContextRef; cdecl; external libCoreGraphics name _PU +
  'CGBitmapContextCreateWithData';
function CGBitmapContextCreate(data: Pointer; width: LongWord; height: LongWord;
  bitsPerComponent: LongWord; bytesPerRow: LongWord; space: CGColorSpaceRef;
  bitmapInfo: LongWord): CGContextRef; cdecl;
  external libCoreGraphics name _PU + 'CGBitmapContextCreate';
function CGBitmapContextGetData(context: CGContextRef): Pointer; cdecl;
  external libCoreGraphics name _PU + 'CGBitmapContextGetData';
function CGBitmapContextGetWidth(context: CGContextRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGBitmapContextGetWidth';
function CGBitmapContextGetHeight(context: CGContextRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGBitmapContextGetHeight';
function CGBitmapContextGetBitsPerComponent(context: CGContextRef): LongWord;
  cdecl; external libCoreGraphics name _PU +
  'CGBitmapContextGetBitsPerComponent';
function CGBitmapContextGetBitsPerPixel(context: CGContextRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGBitmapContextGetBitsPerPixel';
function CGBitmapContextGetBytesPerRow(context: CGContextRef): LongWord; cdecl;
  external libCoreGraphics name _PU + 'CGBitmapContextGetBytesPerRow';
function CGBitmapContextGetColorSpace(context: CGContextRef): CGColorSpaceRef;
  cdecl; external libCoreGraphics name _PU + 'CGBitmapContextGetColorSpace';
function CGBitmapContextGetAlphaInfo(context: CGContextRef): CGImageAlphaInfo;
  cdecl; external libCoreGraphics name _PU + 'CGBitmapContextGetAlphaInfo';
function CGBitmapContextGetBitmapInfo(context: CGContextRef): CGBitmapInfo;
  cdecl; external libCoreGraphics name _PU + 'CGBitmapContextGetBitmapInfo';
function CGBitmapContextCreateImage(context: CGContextRef): CGImageRef; cdecl;
  external libCoreGraphics name _PU + 'CGBitmapContextCreateImage';
function CGColorConverterGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGColorConverterGetTypeID';
function CGColorConverterCreate(options: CFDictionaryRef;
  param1: CGColorSpaceRef; param2: CGColorConverterTransformType;
  param3: CGColorRenderingIntent): CGColorConverterRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorConverterCreate';
function CGColorConverterCreateSimple(from: CGColorSpaceRef;
  &to: CGColorSpaceRef): CGColorConverterRef; cdecl;
  external libCoreGraphics name _PU + 'CGColorConverterCreateSimple';
procedure CGColorConverterRelease(param1: CGColorConverterRef); cdecl;
  external libCoreGraphics name _PU + 'CGColorConverterRelease';
function CGDataConsumerGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGDataConsumerGetTypeID';
function CGDataConsumerCreate(info: Pointer; cbks: Pointer): CGDataConsumerRef;
  cdecl; external libCoreGraphics name _PU + 'CGDataConsumerCreate';
function CGDataConsumerCreateWithURL(url: CFURLRef): CGDataConsumerRef; cdecl;
  external libCoreGraphics name _PU + 'CGDataConsumerCreateWithURL';
function CGDataConsumerCreateWithCFData(data: CFMutableDataRef)
  : CGDataConsumerRef; cdecl;
  external libCoreGraphics name _PU + 'CGDataConsumerCreateWithCFData';
function CGDataConsumerRetain(consumer: CGDataConsumerRef): CGDataConsumerRef;
  cdecl; external libCoreGraphics name _PU + 'CGDataConsumerRetain';
procedure CGDataConsumerRelease(consumer: CGDataConsumerRef); cdecl;
  external libCoreGraphics name _PU + 'CGDataConsumerRelease';
function CGLayerCreateWithContext(context: CGContextRef; size: CGSize;
  auxiliaryInfo: CFDictionaryRef): CGLayerRef; cdecl;
  external libCoreGraphics name _PU + 'CGLayerCreateWithContext';
function CGLayerRetain(layer: CGLayerRef): CGLayerRef; cdecl;
  external libCoreGraphics name _PU + 'CGLayerRetain';
procedure CGLayerRelease(layer: CGLayerRef); cdecl;
  external libCoreGraphics name _PU + 'CGLayerRelease';
function CGLayerGetSize(layer: CGLayerRef): CGSize; cdecl;
  external libCoreGraphics name _PU + 'CGLayerGetSize';
function CGLayerGetContext(layer: CGLayerRef): CGContextRef; cdecl;
  external libCoreGraphics name _PU + 'CGLayerGetContext';
procedure CGContextDrawLayerInRect(context: CGContextRef; rect: CGRect;
  layer: CGLayerRef); cdecl; external libCoreGraphics name _PU +
  'CGContextDrawLayerInRect';
procedure CGContextDrawLayerAtPoint(context: CGContextRef; point: CGPoint;
  layer: CGLayerRef); cdecl; external libCoreGraphics name _PU +
  'CGContextDrawLayerAtPoint';
function CGLayerGetTypeID: CFTypeID; cdecl;
  external libCoreGraphics name _PU + 'CGLayerGetTypeID';
function CGPDFContentStreamCreateWithPage(page: CGPDFPageRef)
  : CGPDFContentStreamRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFContentStreamCreateWithPage';
function CGPDFContentStreamCreateWithStream(stream: CGPDFStreamRef;
  streamResources: CGPDFDictionaryRef; parent: CGPDFContentStreamRef)
  : CGPDFContentStreamRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFContentStreamCreateWithStream';
function CGPDFContentStreamRetain(cs: CGPDFContentStreamRef)
  : CGPDFContentStreamRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFContentStreamRetain';
procedure CGPDFContentStreamRelease(cs: CGPDFContentStreamRef); cdecl;
  external libCoreGraphics name _PU + 'CGPDFContentStreamRelease';
function CGPDFContentStreamGetStreams(cs: CGPDFContentStreamRef): CFArrayRef;
  cdecl; external libCoreGraphics name _PU + 'CGPDFContentStreamGetStreams';
function CGPDFContentStreamGetResource(cs: CGPDFContentStreamRef;
  category: MarshaledAString; name: MarshaledAString): CGPDFObjectRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFContentStreamGetResource';
function CGPDFContextCreate(consumer: CGDataConsumerRef; mediaBox: Pointer;
  auxiliaryInfo: CFDictionaryRef): CGContextRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFContextCreate';
function CGPDFContextCreateWithURL(url: CFURLRef; mediaBox: Pointer;
  auxiliaryInfo: CFDictionaryRef): CGContextRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFContextCreateWithURL';
procedure CGPDFContextClose(context: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGPDFContextClose';
procedure CGPDFContextBeginPage(context: CGContextRef;
  pageInfo: CFDictionaryRef); cdecl;
  external libCoreGraphics name _PU + 'CGPDFContextBeginPage';
procedure CGPDFContextEndPage(context: CGContextRef); cdecl;
  external libCoreGraphics name _PU + 'CGPDFContextEndPage';
procedure CGPDFContextAddDocumentMetadata(context: CGContextRef;
  metadata: CFDataRef); cdecl;
  external libCoreGraphics name _PU + 'CGPDFContextAddDocumentMetadata';
procedure CGPDFContextSetURLForRect(context: CGContextRef; url: CFURLRef;
  rect: CGRect); cdecl; external libCoreGraphics name _PU +
  'CGPDFContextSetURLForRect';
procedure CGPDFContextAddDestinationAtPoint(context: CGContextRef;
  name: CFStringRef; point: CGPoint); cdecl;
  external libCoreGraphics name _PU + 'CGPDFContextAddDestinationAtPoint';
procedure CGPDFContextSetDestinationForRect(context: CGContextRef;
  name: CFStringRef; rect: CGRect); cdecl;
  external libCoreGraphics name _PU + 'CGPDFContextSetDestinationForRect';
function CGPDFScannerCreate(cs: CGPDFContentStreamRef;
  table: CGPDFOperatorTableRef; info: Pointer): CGPDFScannerRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFScannerCreate';
function CGPDFScannerRetain(scanner: CGPDFScannerRef): CGPDFScannerRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFScannerRetain';
procedure CGPDFScannerRelease(scanner: CGPDFScannerRef); cdecl;
  external libCoreGraphics name _PU + 'CGPDFScannerRelease';
function CGPDFScannerScan(scanner: CGPDFScannerRef): Integer; cdecl;
  external libCoreGraphics name _PU + 'CGPDFScannerScan';
function CGPDFScannerGetContentStream(scanner: CGPDFScannerRef)
  : CGPDFContentStreamRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFScannerGetContentStream';
function CGPDFScannerPopObject(scanner: CGPDFScannerRef; value: Pointer)
  : Integer; cdecl; external libCoreGraphics name _PU + 'CGPDFScannerPopObject';
function CGPDFScannerPopBoolean(scanner: CGPDFScannerRef; value: PByte)
  : Integer; cdecl; external libCoreGraphics name _PU +
  'CGPDFScannerPopBoolean';
function CGPDFScannerPopInteger(scanner: CGPDFScannerRef; value: PLongInt)
  : Integer; cdecl; external libCoreGraphics name _PU +
  'CGPDFScannerPopInteger';
function CGPDFScannerPopNumber(scanner: CGPDFScannerRef; value: PCGFloat)
  : Integer; cdecl; external libCoreGraphics name _PU + 'CGPDFScannerPopNumber';
function CGPDFScannerPopName(scanner: CGPDFScannerRef; value: MarshaledAString)
  : Integer; cdecl; external libCoreGraphics name _PU + 'CGPDFScannerPopName';
function CGPDFScannerPopString(scanner: CGPDFScannerRef; value: Pointer)
  : Integer; cdecl; external libCoreGraphics name _PU + 'CGPDFScannerPopString';
function CGPDFScannerPopArray(scanner: CGPDFScannerRef; value: Pointer)
  : Integer; cdecl; external libCoreGraphics name _PU + 'CGPDFScannerPopArray';
function CGPDFScannerPopDictionary(scanner: CGPDFScannerRef; value: Pointer)
  : Integer; cdecl; external libCoreGraphics name _PU +
  'CGPDFScannerPopDictionary';
function CGPDFScannerPopStream(scanner: CGPDFScannerRef; value: Pointer)
  : Integer; cdecl; external libCoreGraphics name _PU + 'CGPDFScannerPopStream';
function CGPDFOperatorTableCreate: CGPDFOperatorTableRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFOperatorTableCreate';
function CGPDFOperatorTableRetain(table: CGPDFOperatorTableRef)
  : CGPDFOperatorTableRef; cdecl;
  external libCoreGraphics name _PU + 'CGPDFOperatorTableRetain';
procedure CGPDFOperatorTableRelease(table: CGPDFOperatorTableRef); cdecl;
  external libCoreGraphics name _PU + 'CGPDFOperatorTableRelease';
procedure CGPDFOperatorTableSetCallback(table: CGPDFOperatorTableRef;
  name: MarshaledAString; callback: CGPDFOperatorCallback); cdecl;
  external libCoreGraphics name _PU + 'CGPDFOperatorTableSetCallback';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreGraphicsModule: THandle;

{$ENDIF IOS}

function CGPointZero: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'CGPointZero');
end;

function CGSizeZero: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'CGSizeZero');
end;

function CGRectZero: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'CGRectZero');
end;

function CGRectNull: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'CGRectNull');
end;

function CGRectInfinite: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'CGRectInfinite');
end;

function CGAffineTransformIdentity: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'CGAffineTransformIdentity');
end;

function kCGColorSpaceGenericGray: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorSpaceGenericGray');
end;

function kCGColorSpaceGenericRGB: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorSpaceGenericRGB');
end;

function kCGColorSpaceGenericCMYK: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorSpaceGenericCMYK');
end;

function kCGColorSpaceDisplayP3: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorSpaceDisplayP3');
end;

function kCGColorSpaceGenericRGBLinear: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorSpaceGenericRGBLinear');
end;

function kCGColorSpaceAdobeRGB1998: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorSpaceAdobeRGB1998');
end;

function kCGColorSpaceSRGB: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorSpaceSRGB');
end;

function kCGColorSpaceGenericGrayGamma2_2: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics,
    'kCGColorSpaceGenericGrayGamma2_2');
end;

function kCGColorSpaceGenericXYZ: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorSpaceGenericXYZ');
end;

function kCGColorSpaceACESCGLinear: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorSpaceACESCGLinear');
end;

function kCGColorSpaceITUR_709: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorSpaceITUR_709');
end;

function kCGColorSpaceITUR_2020: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorSpaceITUR_2020');
end;

function kCGColorSpaceROMMRGB: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorSpaceROMMRGB');
end;

function kCGColorSpaceDCIP3: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorSpaceDCIP3');
end;

function kCGColorWhite: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorWhite');
end;

function kCGColorBlack: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorBlack');
end;

function kCGColorClear: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGColorClear');
end;

function kCGFontVariationAxisName: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGFontVariationAxisName');
end;

function kCGFontVariationAxisMinValue: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGFontVariationAxisMinValue');
end;

function kCGFontVariationAxisMaxValue: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGFontVariationAxisMaxValue');
end;

function kCGFontVariationAxisDefaultValue: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics,
    'kCGFontVariationAxisDefaultValue');
end;

function kCGPDFContextMediaBox: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextMediaBox');
end;

function kCGPDFContextCropBox: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextCropBox');
end;

function kCGPDFContextBleedBox: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextBleedBox');
end;

function kCGPDFContextTrimBox: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextTrimBox');
end;

function kCGPDFContextArtBox: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextArtBox');
end;

function kCGPDFContextTitle: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextTitle');
end;

function kCGPDFContextAuthor: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextAuthor');
end;

function kCGPDFContextSubject: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextSubject');
end;

function kCGPDFContextKeywords: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextKeywords');
end;

function kCGPDFContextCreator: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextCreator');
end;

function kCGPDFContextOwnerPassword: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextOwnerPassword');
end;

function kCGPDFContextUserPassword: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextUserPassword');
end;

function kCGPDFContextEncryptionKeyLength: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics,
    'kCGPDFContextEncryptionKeyLength');
end;

function kCGPDFContextAllowsPrinting: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextAllowsPrinting');
end;

function kCGPDFContextAllowsCopying: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextAllowsCopying');
end;

function kCGPDFContextOutputIntent: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextOutputIntent');
end;

function kCGPDFXOutputIntentSubtype: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFXOutputIntentSubtype');
end;

function kCGPDFXOutputConditionIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics,
    'kCGPDFXOutputConditionIdentifier');
end;

function kCGPDFXOutputCondition: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFXOutputCondition');
end;

function kCGPDFXRegistryName: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFXRegistryName');
end;

function kCGPDFXInfo: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFXInfo');
end;

function kCGPDFXDestinationOutputProfile: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics,
    'kCGPDFXDestinationOutputProfile');
end;

function kCGPDFContextOutputIntents: Pointer;
begin
  Result := CocoaPointerConst(libCoreGraphics, 'kCGPDFContextOutputIntents');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreGraphicsModule := dlopen(MarshaledAString(libCoreGraphics), RTLD_LAZY);

finalization

dlclose(CoreGraphicsModule);
{$ENDIF IOS}

end.
