{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreImage
//

unit iOSapi.CoreImage;

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
  iOSapi.CoreVideo,
  iOSapi.Foundation,
  iOSapi.IOSurface,
  iOSapi.ImageIO,
  iOSapi.Metal,
  iOSapi.OpenGLES;

const
  CIQRCodeErrorCorrectionLevelL = 76;
  CIQRCodeErrorCorrectionLevelM = 77;
  CIQRCodeErrorCorrectionLevelQ = 81;
  CIQRCodeErrorCorrectionLevelH = 72;
  CIDataMatrixCodeECCVersion000 = 0;
  CIDataMatrixCodeECCVersion050 = 50;
  CIDataMatrixCodeECCVersion080 = 80;
  CIDataMatrixCodeECCVersion100 = 100;
  CIDataMatrixCodeECCVersion140 = 140;
  CIDataMatrixCodeECCVersion200 = 200;
  CIRenderDestinationAlphaNone = 0;
  CIRenderDestinationAlphaPremultiplied = 1;
  CIRenderDestinationAlphaUnpremultiplied = 2;

type

  // ===== Forward declarations =====
{$M+}
  CIBarcodeDescriptor = interface;
  CIQRCodeDescriptor = interface;
  CIAztecCodeDescriptor = interface;
  CIPDF417CodeDescriptor = interface;
  CIDataMatrixCodeDescriptor = interface;
  CIVector = interface;
  CIColor = interface;
  CIContext = interface;
  CIFilterShape = interface;
  CIFilter = interface;
  CIImage = interface;
  MTLCommandBuffer = interface;
  MTLCommandQueue = interface;
  CIFeature = interface;
  CIDetector = interface;
  CIFaceFeature = interface;
  CIRectangleFeature = interface;
  CIQRCodeFeature = interface;
  CITextFeature = interface;
  CIFilterConstructor = interface;
  CIKernel = interface;
  CIGaussianGradient = interface;
  CIHueSaturationValueGradient = interface;
  CILinearGradient = interface;
  CIRadialGradient = interface;
  CISmoothLinearGradient = interface;
  CISharpenLuminance = interface;
  CIUnsharpMask = interface;
  CICircularScreen = interface;
  CICMYKHalftone = interface;
  CIDotScreen = interface;
  CIHatchedScreen = interface;
  CILineScreen = interface;
  CIFourCoordinateGeometryFilter = interface;
  CIBicubicScaleTransform = interface;
  CIEdgePreserveUpsample = interface;
  CIKeystoneCorrectionCombined = interface;
  CIKeystoneCorrectionHorizontal = interface;
  CIKeystoneCorrectionVertical = interface;
  CILanczosScaleTransform = interface;
  CIPerspectiveCorrection = interface;
  CIPerspectiveRotate = interface;
  CIPerspectiveTransform = interface;
  CIPerspectiveTransformWithExtent = interface;
  CIStraighten = interface;
  CITransitionFilter = interface;
  CIAccordionFoldTransition = interface;
  CIBarsSwipeTransition = interface;
  CICopyMachineTransition = interface;
  CIDisintegrateWithMaskTransition = interface;
  CIDissolveTransition = interface;
  CIFlashTransition = interface;
  CIModTransition = interface;
  CIPageCurlTransition = interface;
  CIPageCurlWithShadowTransition = interface;
  CIRippleTransition = interface;
  CISwipeTransition = interface;
  CICompositeOperation = interface;
  CIColorAbsoluteDifference = interface;
  CIColorClamp = interface;
  CIColorControls = interface;
  CIColorMatrix = interface;
  CIColorPolynomial = interface;
  CIColorThreshold = interface;
  CIColorThresholdOtsu = interface;
  CIDepthToDisparity = interface;
  CIDisparityToDepth = interface;
  CIExposureAdjust = interface;
  CIGammaAdjust = interface;
  CIHueAdjust = interface;
  CILinearToSRGBToneCurve = interface;
  CISRGBToneCurveToLinear = interface;
  CITemperatureAndTint = interface;
  CIToneCurve = interface;
  CIVibrance = interface;
  CIWhitePointAdjust = interface;
  CIColorCrossPolynomial = interface;
  CIColorCube = interface;
  CIColorCubesMixedWithMask = interface;
  CIColorCubeWithColorSpace = interface;
  CIColorCurves = interface;
  CIColorInvert = interface;
  CIColorMap = interface;
  CIColorMonochrome = interface;
  CIColorPosterize = interface;
  CIConvertLab = interface;
  CIDither = interface;
  CIDocumentEnhancer = interface;
  CIFalseColor = interface;
  CILabDeltaE = interface;
  CIMaskToAlpha = interface;
  CIMaximumComponent = interface;
  CIMinimumComponent = interface;
  CIPaletteCentroid = interface;
  CIPalettize = interface;
  CIPhotoEffect = interface;
  CISepiaTone = interface;
  CIThermal = interface;
  CIVignette = interface;
  CIVignetteEffect = interface;
  CIXRay = interface;
  CIBumpDistortion = interface;
  CIBumpDistortionLinear = interface;
  CICircleSplashDistortion = interface;
  CICircularWrap = interface;
  CIDisplacementDistortion = interface;
  CIDroste = interface;
  CIGlassDistortion = interface;
  CIGlassLozenge = interface;
  CIHoleDistortion = interface;
  CILightTunnel = interface;
  CINinePartStretched = interface;
  CINinePartTiled = interface;
  CIPinchDistortion = interface;
  CIStretchCrop = interface;
  CITorusLensDistortion = interface;
  CITwirlDistortion = interface;
  CIVortexDistortion = interface;
  CIAffineClamp = interface;
  CIAffineTile = interface;
  CIEightfoldReflectedTile = interface;
  CIFourfoldReflectedTile = interface;
  CIFourfoldRotatedTile = interface;
  CIFourfoldTranslatedTile = interface;
  CIGlideReflectedTile = interface;
  CIKaleidoscope = interface;
  CIOpTile = interface;
  CIParallelogramTile = interface;
  CIPerspectiveTile = interface;
  CISixfoldReflectedTile = interface;
  CISixfoldRotatedTile = interface;
  CITriangleKaleidoscope = interface;
  CITriangleTile = interface;
  CITwelvefoldReflectedTile = interface;
  CIAttributedTextImageGenerator = interface;
  CIAztecCodeGenerator = interface;
  CIBarcodeGenerator = interface;
  CICheckerboardGenerator = interface;
  CICode128BarcodeGenerator = interface;
  CILenticularHaloGenerator = interface;
  CIMeshGenerator = interface;
  CIPDF417BarcodeGenerator = interface;
  CIQRCodeGenerator = interface;
  CIRandomGenerator = interface;
  CIRoundedRectangleGenerator = interface;
  CIStarShineGenerator = interface;
  CIStripesGenerator = interface;
  CISunbeamsGenerator = interface;
  CITextImageGenerator = interface;
  CIBlendWithMask = interface;
  CIBloom = interface;
  CIComicEffect = interface;
  CIConvolution = interface;
  CICoreMLModel = interface;
  CICrystallize = interface;
  CIDepthOfField = interface;
  CIEdges = interface;
  CIEdgeWork = interface;
  CIGaborGradients = interface;
  CIGloom = interface;
  CIHeightFieldFromMask = interface;
  CIHexagonalPixellate = interface;
  CIHighlightShadowAdjust = interface;
  CILineOverlay = interface;
  CIMix = interface;
  CIPersonSegmentation = interface;
  CIPixellate = interface;
  CIPointillize = interface;
  CISaliencyMap = interface;
  CIShadedMaterial = interface;
  CISpotColor = interface;
  CISpotLight = interface;
  CIBokehBlur = interface;
  CIBoxBlur = interface;
  CIDiscBlur = interface;
  CIGaussianBlur = interface;
  CIMaskedVariableBlur = interface;
  CIMedian = interface;
  CIMorphologyGradient = interface;
  CIMorphologyMaximum = interface;
  CIMorphologyMinimum = interface;
  CIMorphologyRectangleMaximum = interface;
  CIMorphologyRectangleMinimum = interface;
  CIMotionBlur = interface;
  CINoiseReduction = interface;
  CIZoomBlur = interface;
  CIAreaReductionFilter = interface;
  CIAreaAverage = interface;
  CIAreaHistogram = interface;
  CIAreaLogarithmicHistogram = interface;
  CIAreaMaximum = interface;
  CIAreaMaximumAlpha = interface;
  CIAreaMinimum = interface;
  CIAreaMinimumAlpha = interface;
  CIAreaMinMax = interface;
  CIAreaMinMaxRed = interface;
  CIColumnAverage = interface;
  CIHistogramDisplay = interface;
  CIKMeans = interface;
  CIRowAverage = interface;
  CIFilterGenerator = interface;
  CIImageAccumulator = interface;
  CIImageProcessorInput = interface;
  CIImageProcessorOutput = interface;
  CIImageProcessorKernel = interface;
  CIImageProvider = interface;
  CIColorKernel = interface;
  CIWarpKernel = interface;
  CIBlendKernel = interface;
  CIRAWFilter = interface;
  CIRenderDestination = interface;
  CIRenderInfo = interface;
  CIRenderTask = interface;
  CISampler = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  CIQRCodeErrorCorrectionLevel = NSInteger;
  CIDataMatrixCodeECCVersion = NSInteger;
  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  CGFloat = Single;
  PCGFloat = ^CGFloat;

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

  CGRect = record
    origin: CGPoint;
    size: CGSize;
  end;

  PCGRect = ^CGRect;

  CGAffineTransform = record
    a: CGFloat;
    b: CGFloat;
    c: CGFloat;
    d: CGFloat;
    tx: CGFloat;
    ty: CGFloat;
  end;

  PCGAffineTransform = ^CGAffineTransform;

  CGColorRef = Pointer;
  PCGColorRef = ^CGColorRef;
  CGColorSpaceRef = Pointer;
  PCGColorSpaceRef = ^CGColorSpaceRef;
  CGImageRef = Pointer;
  PCGImageRef = ^CGImageRef;
  CGImageSourceRef = Pointer;
  PCGImageSourceRef = ^CGImageSourceRef;
  CGLayerRef = Pointer;
  PCGLayerRef = ^CGLayerRef;
  CIFormat = Integer;
  PCIFormat = ^CIFormat;

  CVBufferRef = Pointer;
  PCVBufferRef = ^CVBufferRef;
  CVImageBufferRef = CVBufferRef;
  PCVImageBufferRef = ^CVImageBufferRef;
  CVPixelBufferRef = CVImageBufferRef;
  PCVPixelBufferRef = ^CVPixelBufferRef;
  IOSurfaceRef = Pointer;
  PIOSurfaceRef = ^IOSurfaceRef;
  CGImagePropertyOrientation = LongWord;
  CIImageOption = NSString;
  PCIImageOption = ^CIImageOption;
  CIImageAutoAdjustmentOption = NSString;
  PCIImageAutoAdjustmentOption = ^CIImageAutoAdjustmentOption;
  CGContextRef = Pointer;
  PCGContextRef = ^CGContextRef;
  CFDictionaryRef = Pointer;
  PCFDictionaryRef = ^CFDictionaryRef;
  __darwin_ptrdiff_t = Integer;
  P__darwin_ptrdiff_t = ^__darwin_ptrdiff_t;

  CIContextOption = NSString;
  PCIContextOption = ^CIContextOption;
  CIImageRepresentationOption = NSString;
  PCIImageRepresentationOption = ^CIImageRepresentationOption;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  CIKernelROICallback = function(param1: Integer; param2: CGRect)
    : CGRect; cdecl;
  SEL = SEL *;
  PSEL = ^SEL;
  CIRAWFilterOption = NSString;
  PCIRAWFilterOption = ^CIRAWFilterOption;
  CIRAWDecoderVersion = NSString;
  PCIRAWDecoderVersion = ^CIRAWDecoderVersion;
  MTLPixelFormat = NSUInteger;
  TCoreImageMtlTextureProvider = function(): Pointer; cdecl;
  CIRenderDestinationAlphaMode = NSUInteger;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  // ===== Interface declarations =====

  CIBarcodeDescriptorClass = interface(NSObjectClass)
    ['{3DF471F8-D795-4302-8712-945511AC582E}']
  end;

  CIBarcodeDescriptor = interface(NSObject)
    ['{6EC02143-6B74-4185-BE05-96D21756F2E5}']
    function detectedBarcodeDescriptor: CIBarcodeDescriptor; cdecl;
  end;

  TCIBarcodeDescriptor = class(TOCGenericImport<CIBarcodeDescriptorClass,
    CIBarcodeDescriptor>)
  end;

  PCIBarcodeDescriptor = Pointer;

  CIQRCodeDescriptorClass = interface(CIBarcodeDescriptorClass)
    ['{4575BE09-A815-4F01-B2B0-573D15108371}']
    { class } function descriptorWithPayload(errorCorrectedPayload: NSData;
      symbolVersion: NSInteger; maskPattern: Byte;
      errorCorrectionLevel: CIQRCodeErrorCorrectionLevel)
      : Pointer { instancetype }; cdecl;
  end;

  CIQRCodeDescriptor = interface(CIBarcodeDescriptor)
    ['{DD3C7061-D893-44AD-9409-11E32FDBBFAC}']
    function errorCorrectedPayload: NSData; cdecl;
    function symbolVersion: NSInteger; cdecl;
    function maskPattern: Byte; cdecl;
    function errorCorrectionLevel: CIQRCodeErrorCorrectionLevel; cdecl;
    function initWithPayload(errorCorrectedPayload: NSData;
      symbolVersion: NSInteger; maskPattern: Byte;
      errorCorrectionLevel: CIQRCodeErrorCorrectionLevel)
      : Pointer { instancetype }; cdecl;
  end;

  TCIQRCodeDescriptor = class(TOCGenericImport<CIQRCodeDescriptorClass,
    CIQRCodeDescriptor>)
  end;

  PCIQRCodeDescriptor = Pointer;

  CIAztecCodeDescriptorClass = interface(CIBarcodeDescriptorClass)
    ['{1B554B9E-A936-4BA0-BAAA-C5DBE8F9788E}']
    { class } function descriptorWithPayload(errorCorrectedPayload: NSData;
      isCompact: Boolean; layerCount: NSInteger; dataCodewordCount: NSInteger)
      : Pointer { instancetype }; cdecl;
  end;

  CIAztecCodeDescriptor = interface(CIBarcodeDescriptor)
    ['{07DA4F77-BDF0-4322-A39E-F0B138048B0B}']
    function errorCorrectedPayload: NSData; cdecl;
    function isCompact: Boolean; cdecl;
    function layerCount: NSInteger; cdecl;
    function dataCodewordCount: NSInteger; cdecl;
    function initWithPayload(errorCorrectedPayload: NSData; isCompact: Boolean;
      layerCount: NSInteger; dataCodewordCount: NSInteger)
      : Pointer { instancetype }; cdecl;
  end;

  TCIAztecCodeDescriptor = class(TOCGenericImport<CIAztecCodeDescriptorClass,
    CIAztecCodeDescriptor>)
  end;

  PCIAztecCodeDescriptor = Pointer;

  CIPDF417CodeDescriptorClass = interface(CIBarcodeDescriptorClass)
    ['{25AB1A78-8E2B-4B5F-9A43-0915654C47F6}']
    { class } function descriptorWithPayload(errorCorrectedPayload: NSData;
      isCompact: Boolean; rowCount: NSInteger; columnCount: NSInteger)
      : Pointer { instancetype }; cdecl;
  end;

  CIPDF417CodeDescriptor = interface(CIBarcodeDescriptor)
    ['{9EB356DA-6B6C-4314-8624-F8F29FE17A72}']
    function errorCorrectedPayload: NSData; cdecl;
    function isCompact: Boolean; cdecl;
    function rowCount: NSInteger; cdecl;
    function columnCount: NSInteger; cdecl;
    function initWithPayload(errorCorrectedPayload: NSData; isCompact: Boolean;
      rowCount: NSInteger; columnCount: NSInteger)
      : Pointer { instancetype }; cdecl;
  end;

  TCIPDF417CodeDescriptor = class(TOCGenericImport<CIPDF417CodeDescriptorClass,
    CIPDF417CodeDescriptor>)
  end;

  PCIPDF417CodeDescriptor = Pointer;

  CIDataMatrixCodeDescriptorClass = interface(CIBarcodeDescriptorClass)
    ['{D5EFA6EC-92D4-4876-B3FC-CDEA231D177F}']
    { class } function descriptorWithPayload(errorCorrectedPayload: NSData;
      rowCount: NSInteger; columnCount: NSInteger;
      eccVersion: CIDataMatrixCodeECCVersion): Pointer { instancetype }; cdecl;
  end;

  CIDataMatrixCodeDescriptor = interface(CIBarcodeDescriptor)
    ['{28C70859-653E-4CC8-9B74-CC8F21A18333}']
    function errorCorrectedPayload: NSData; cdecl;
    function rowCount: NSInteger; cdecl;
    function columnCount: NSInteger; cdecl;
    function eccVersion: CIDataMatrixCodeECCVersion; cdecl;
    function initWithPayload(errorCorrectedPayload: NSData; rowCount: NSInteger;
      columnCount: NSInteger; eccVersion: CIDataMatrixCodeECCVersion)
      : Pointer { instancetype }; cdecl;
  end;

  TCIDataMatrixCodeDescriptor = class
    (TOCGenericImport<CIDataMatrixCodeDescriptorClass,
    CIDataMatrixCodeDescriptor>)
  end;

  PCIDataMatrixCodeDescriptor = Pointer;

  CIVectorClass = interface(NSObjectClass)
    ['{34C0A4A1-DEB2-476D-8BD7-79828B57DF24}']
    { class } function vectorWithValues(values: PCGFloat; count: LongWord)
      : Pointer { instancetype }; cdecl;
    [MethodName('vectorWithX:')]
    { class } function vectorWithX(x: CGFloat): Pointer { instancetype }; cdecl;
    [MethodName('vectorWithX:Y:')]
    { class } function vectorWithXY(x: CGFloat; y: CGFloat)
      : Pointer { instancetype }; cdecl;
    [MethodName('vectorWithX:Y:Z:')]
    { class } function vectorWithXYZ(x: CGFloat; y: CGFloat; Z: CGFloat)
      : Pointer { instancetype }; cdecl;
    [MethodName('vectorWithX:Y:Z:W:')]
    { class } function vectorWithXYZW(x: CGFloat; y: CGFloat; Z: CGFloat;
      W: CGFloat): Pointer { instancetype }; cdecl;
    { class } function vectorWithCGPoint(p: CGPoint)
      : Pointer { instancetype }; cdecl;
    { class } function vectorWithCGRect(r: CGRect)
      : Pointer { instancetype }; cdecl;
    { class } function vectorWithCGAffineTransform(t: CGAffineTransform)
      : Pointer { instancetype }; cdecl;
    { class } function vectorWithString(representation: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  CIVector = interface(NSObject)
    ['{DFFC3F39-6875-474B-B582-52F462B081DF}']
    function initWithValues(values: PCGFloat; count: LongWord)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithX:')]
    function initWithX(x: CGFloat): Pointer { instancetype }; cdecl;
    [MethodName('initWithX:Y:')]
    function initWithXY(x: CGFloat; y: CGFloat)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithX:Y:Z:')]
    function initWithXYZ(x: CGFloat; y: CGFloat; Z: CGFloat)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithX:Y:Z:W:')]
    function initWithXYZW(x: CGFloat; y: CGFloat; Z: CGFloat; W: CGFloat)
      : Pointer { instancetype }; cdecl;
    function initWithCGPoint(p: CGPoint): Pointer { instancetype }; cdecl;
    function initWithCGRect(r: CGRect): Pointer { instancetype }; cdecl;
    function initWithCGAffineTransform(r: CGAffineTransform)
      : Pointer { instancetype }; cdecl;
    function initWithString(representation: NSString)
      : Pointer { instancetype }; cdecl;
    function valueAtIndex(index: LongWord): CGFloat; cdecl;
    function count: LongWord; cdecl;
    function x: CGFloat; cdecl;
    function y: CGFloat; cdecl;
    function Z: CGFloat; cdecl;
    function W: CGFloat; cdecl;
    function CGPointValue: CGPoint; cdecl;
    function CGRectValue: CGRect; cdecl;
    function CGAffineTransformValue: CGAffineTransform; cdecl;
    function stringRepresentation: NSString; cdecl;
  end;

  TCIVector = class(TOCGenericImport<CIVectorClass, CIVector>)
  end;

  PCIVector = Pointer;

  CIColorClass = interface(NSObjectClass)
    ['{F0C48C8D-0795-4274-92AD-121140534AEB}']
    { class } function colorWithCGColor(c: CGColorRef)
      : Pointer { instancetype }; cdecl;
    [MethodName('colorWithRed:green:blue:alpha:')]
    { class } function colorWithRedGreenBlueAlpha(r: CGFloat; green: CGFloat;
      blue: CGFloat; alpha: CGFloat): Pointer { instancetype }; cdecl;
    [MethodName('colorWithRed:green:blue:')]
    { class } function colorWithRedGreenBlue(r: CGFloat; green: CGFloat;
      blue: CGFloat): Pointer { instancetype }; cdecl;
    [MethodName('colorWithRed:green:blue:alpha:colorSpace:')]
    { class } function colorWithRedGreenBlueAlphaColorSpace(r: CGFloat;
      green: CGFloat; blue: CGFloat; alpha: CGFloat;
      colorSpace: CGColorSpaceRef): Pointer { instancetype }; cdecl;
    [MethodName('colorWithRed:green:blue:colorSpace:')]
    { class } function colorWithRedGreenBlueColorSpace(r: CGFloat;
      green: CGFloat; blue: CGFloat; colorSpace: CGColorSpaceRef)
      : Pointer { instancetype }; cdecl;
    { class } function colorWithString(representation: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  CIColor = interface(NSObject)
    ['{6BD15718-F5B6-4568-97FB-799FADFD50B9}']
    function initWithCGColor(c: CGColorRef): Pointer { instancetype }; cdecl;
    [MethodName('initWithRed:green:blue:alpha:')]
    function initWithRedGreenBlueAlpha(r: CGFloat; green: CGFloat;
      blue: CGFloat; alpha: CGFloat): Pointer { instancetype }; cdecl;
    [MethodName('initWithRed:green:blue:')]
    function initWithRedGreenBlue(r: CGFloat; green: CGFloat; blue: CGFloat)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithRed:green:blue:alpha:colorSpace:')]
    function initWithRedGreenBlueAlphaColorSpace(r: CGFloat; green: CGFloat;
      blue: CGFloat; alpha: CGFloat; colorSpace: CGColorSpaceRef)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithRed:green:blue:colorSpace:')]
    function initWithRedGreenBlueColorSpace(r: CGFloat; green: CGFloat;
      blue: CGFloat; colorSpace: CGColorSpaceRef)
      : Pointer { instancetype }; cdecl;
    function numberOfComponents: LongWord; cdecl;
    function components: PCGFloat; cdecl;
    function alpha: CGFloat; cdecl;
    function colorSpace: CGColorSpaceRef; cdecl;
    function red: CGFloat; cdecl;
    function green: CGFloat; cdecl;
    function blue: CGFloat; cdecl;
    function stringRepresentation: NSString; cdecl;
    procedure setBlackColor(blackColor: CIColor); cdecl;
    function blackColor: CIColor; cdecl;
    procedure setWhiteColor(whiteColor: CIColor); cdecl;
    function whiteColor: CIColor; cdecl;
    procedure setGrayColor(grayColor: CIColor); cdecl;
    function grayColor: CIColor; cdecl;
    procedure setRedColor(redColor: CIColor); cdecl;
    function redColor: CIColor; cdecl;
    procedure setGreenColor(greenColor: CIColor); cdecl;
    function greenColor: CIColor; cdecl;
    procedure setBlueColor(blueColor: CIColor); cdecl;
    function blueColor: CIColor; cdecl;
    procedure setCyanColor(cyanColor: CIColor); cdecl;
    function cyanColor: CIColor; cdecl;
    procedure setMagentaColor(magentaColor: CIColor); cdecl;
    function magentaColor: CIColor; cdecl;
    procedure setYellowColor(yellowColor: CIColor); cdecl;
    function yellowColor: CIColor; cdecl;
    procedure setClearColor(clearColor: CIColor); cdecl;
    function clearColor: CIColor; cdecl;
  end;

  TCIColor = class(TOCGenericImport<CIColorClass, CIColor>)
  end;

  PCIColor = Pointer;

  CIContextClass = interface(NSObjectClass)
    ['{B24EA459-EB3E-490D-B7EA-17A25EFB221F}']
    { class } function contextWithCGContext(cgctx: CGContextRef;
      options: NSDictionary): CIContext; cdecl;
    { class } function contextWithOptions(options: NSDictionary)
      : CIContext; cdecl;
    { class } function context: CIContext; cdecl;
    [MethodName('contextWithEAGLContext:')]
    { class } function contextWithEAGLContext(eaglContext: eaglContext)
      : CIContext; cdecl;
    [MethodName('contextWithEAGLContext:options:')]
    { class } function contextWithEAGLContextOptions(eaglContext: eaglContext;
      options: NSDictionary): CIContext; cdecl;
    [MethodName('contextWithMTLDevice:')]
    { class } function contextWithMTLDevice(device: Pointer): CIContext; cdecl;
    [MethodName('contextWithMTLDevice:options:')]
    { class } function contextWithMTLDeviceOptions(device: Pointer;
      options: NSDictionary): CIContext; cdecl;
    [MethodName('contextWithMTLCommandQueue:')]
    { class } function contextWithMTLCommandQueue(commandQueue: Pointer)
      : CIContext; cdecl;
    [MethodName('contextWithMTLCommandQueue:options:')]
    { class } function contextWithMTLCommandQueueOptions(commandQueue: Pointer;
      options: NSDictionary): CIContext; cdecl;
    { class } function offlineGPUCount: Cardinal; cdecl;
  end;

  CIContext = interface(NSObject)
    ['{4F3F06E8-5909-47D0-AA0A-F47E126013FD}']
    function initWithOptions(options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function workingColorSpace: CGColorSpaceRef; cdecl;
    function workingFormat: CIFormat; cdecl;
    [MethodName('drawImage:atPoint:fromRect:')]
    procedure drawImageAtPointFromRect(image: CIImage; atPoint: CGPoint;
      fromRect: CGRect); cdecl;
    [MethodName('drawImage:inRect:fromRect:')]
    procedure drawImageInRectFromRect(image: CIImage; inRect: CGRect;
      fromRect: CGRect); cdecl;
    function createCGLayerWithSize(size: CGSize; info: CFDictionaryRef)
      : CGLayerRef; cdecl;
    [MethodName('render:toBitmap:rowBytes:bounds:format:colorSpace:')]
    procedure renderToBitmapRowBytesBoundsFormatColorSpace(image: CIImage;
      toBitmap: Pointer; rowBytes: Integer; bounds: CGRect; format: CIFormat;
      colorSpace: CGColorSpaceRef); cdecl;
    [MethodName('render:toIOSurface:bounds:colorSpace:')]
    procedure renderToIOSurfaceBoundsColorSpace(image: CIImage;
      toIOSurface: IOSurfaceRef; bounds: CGRect;
      colorSpace: CGColorSpaceRef); cdecl;
    [MethodName('render:toCVPixelBuffer:')]
    procedure renderToCVPixelBuffer(image: CIImage;
      toCVPixelBuffer: CVPixelBufferRef); cdecl;
    [MethodName('render:toCVPixelBuffer:bounds:colorSpace:')]
    procedure renderToCVPixelBufferBoundsColorSpace(image: CIImage;
      toCVPixelBuffer: CVPixelBufferRef; bounds: CGRect;
      colorSpace: CGColorSpaceRef); cdecl;
    [MethodName('render:toMTLTexture:commandBuffer:bounds:colorSpace:')]
    procedure renderToMTLTextureCommandBufferBoundsColorSpace(image: CIImage;
      toMTLTexture: Pointer; commandBuffer: Pointer; bounds: CGRect;
      colorSpace: CGColorSpaceRef); cdecl;
    procedure reclaimResources; cdecl;
    procedure clearCaches; cdecl;
    function inputImageMaximumSize: CGSize; cdecl;
    function outputImageMaximumSize: CGSize; cdecl;
    [MethodName('createCGImage:fromRect:')]
    function createCGImageFromRect(image: CIImage; fromRect: CGRect)
      : CGImageRef; cdecl;
    [MethodName('createCGImage:fromRect:format:colorSpace:')]
    function createCGImageFromRectFormatColorSpace(image: CIImage;
      fromRect: CGRect; format: CIFormat; colorSpace: CGColorSpaceRef)
      : CGImageRef; cdecl;
    [MethodName('createCGImage:fromRect:format:colorSpace:deferred:')]
    function createCGImageFromRectFormatColorSpaceDeferred(image: CIImage;
      fromRect: CGRect; format: CIFormat; colorSpace: CGColorSpaceRef;
      deferred: Boolean): CGImageRef; cdecl;
    function TIFFRepresentationOfImage(image: CIImage; format: CIFormat;
      colorSpace: CGColorSpaceRef; options: NSDictionary): NSData; cdecl;
    function JPEGRepresentationOfImage(image: CIImage;
      colorSpace: CGColorSpaceRef; options: NSDictionary): NSData; cdecl;
    function HEIFRepresentationOfImage(image: CIImage; format: CIFormat;
      colorSpace: CGColorSpaceRef; options: NSDictionary): NSData; cdecl;
    function HEIF10RepresentationOfImage(image: CIImage;
      colorSpace: CGColorSpaceRef; options: NSDictionary; error: NSError)
      : NSData; cdecl;
    function PNGRepresentationOfImage(image: CIImage; format: CIFormat;
      colorSpace: CGColorSpaceRef; options: NSDictionary): NSData; cdecl;
    function writeTIFFRepresentationOfImage(image: CIImage; toURL: NSURL;
      format: CIFormat; colorSpace: CGColorSpaceRef; options: NSDictionary;
      error: NSError): Boolean; cdecl;
    function writePNGRepresentationOfImage(image: CIImage; toURL: NSURL;
      format: CIFormat; colorSpace: CGColorSpaceRef; options: NSDictionary;
      error: NSError): Boolean; cdecl;
    function writeJPEGRepresentationOfImage(image: CIImage; toURL: NSURL;
      colorSpace: CGColorSpaceRef; options: NSDictionary; error: NSError)
      : Boolean; cdecl;
    function writeHEIFRepresentationOfImage(image: CIImage; toURL: NSURL;
      format: CIFormat; colorSpace: CGColorSpaceRef; options: NSDictionary;
      error: NSError): Boolean; cdecl;
    function writeHEIF10RepresentationOfImage(image: CIImage; toURL: NSURL;
      colorSpace: CGColorSpaceRef; options: NSDictionary; error: NSError)
      : Boolean; cdecl;
    function depthBlurEffectFilterForImageURL(url: NSURL; options: NSDictionary)
      : CIFilter; cdecl;
    function depthBlurEffectFilterForImageData(data: NSData;
      options: NSDictionary): CIFilter; cdecl;
    [MethodName
      ('depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:orientation:options:')
      ]
    function depthBlurEffectFilterForImageDisparityImagePortraitEffectsMatteOrientationOptions
      (image: CIImage; disparityImage: CIImage; portraitEffectsMatte: CIImage;
      orientation: CGImagePropertyOrientation; options: NSDictionary)
      : CIFilter; cdecl;
    [MethodName
      ('depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:orientation:options:')
      ]
    function depthBlurEffectFilterForImageDisparityImagePortraitEffectsMatteHairSemanticSegmentationOrientationOptions
      (image: CIImage; disparityImage: CIImage; portraitEffectsMatte: CIImage;
      hairSemanticSegmentation: CIImage;
      orientation: CGImagePropertyOrientation; options: NSDictionary)
      : CIFilter; cdecl;
    [MethodName
      ('depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:')
      ]
    function depthBlurEffectFilterForImageDisparityImagePortraitEffectsMatteHairSemanticSegmentationGlassesMatteGainMapOrientationOptions
      (image: CIImage; disparityImage: CIImage; portraitEffectsMatte: CIImage;
      hairSemanticSegmentation: CIImage; glassesMatte: CIImage;
      gainMap: CIImage; orientation: CGImagePropertyOrientation;
      options: NSDictionary): CIFilter; cdecl;
    [MethodName('startTaskToRender:fromRect:toDestination:atPoint:error:')]
    function startTaskToRenderFromRectToDestinationAtPointError(image: CIImage;
      fromRect: CGRect; toDestination: CIRenderDestination; atPoint: CGPoint;
      error: NSError): CIRenderTask; cdecl;
    [MethodName('startTaskToRender:toDestination:error:')]
    function startTaskToRenderToDestinationError(image: CIImage;
      toDestination: CIRenderDestination; error: NSError): CIRenderTask; cdecl;
    function prepareRender(image: CIImage; fromRect: CGRect;
      toDestination: CIRenderDestination; atPoint: CGPoint; error: NSError)
      : Boolean; cdecl;
    function startTaskToClear(destination: CIRenderDestination; error: NSError)
      : CIRenderTask; cdecl;
  end;

  TCIContext = class(TOCGenericImport<CIContextClass, CIContext>)
  end;

  PCIContext = Pointer;

  CIFilterShapeClass = interface(NSObjectClass)
    ['{2CAC53CF-AC82-4E22-801A-BC7F600B9837}']
    { class } function shapeWithRect(r: CGRect)
      : Pointer { instancetype }; cdecl;
  end;

  CIFilterShape = interface(NSObject)
    ['{A884B99A-F320-4930-A2FC-D4F7DF683787}']
    function initWithRect(r: CGRect): Pointer { instancetype }; cdecl;
    function transformBy(m: CGAffineTransform; interior: Boolean)
      : CIFilterShape; cdecl;
    function insetByX(dx: Integer; y: Integer): CIFilterShape; cdecl;
    function unionWith(s2: CIFilterShape): CIFilterShape; cdecl;
    function unionWithRect(r: CGRect): CIFilterShape; cdecl;
    function intersectWith(s2: CIFilterShape): CIFilterShape; cdecl;
    function intersectWithRect(r: CGRect): CIFilterShape; cdecl;
    function extent: CGRect; cdecl;
  end;

  TCIFilterShape = class(TOCGenericImport<CIFilterShapeClass, CIFilterShape>)
  end;

  PCIFilterShape = Pointer;

  CIFilterClass = interface(NSObjectClass)
    ['{17ED6DD6-569F-4DF7-A7F1-A9DB9593AAA3}']
    { class } function customAttributes: NSDictionary; cdecl;
    [MethodName('filterWithName:')]
    { class } function filterWithName(name: NSString): CIFilter; cdecl;
    [MethodName('filterWithName:keysAndValues:')]
    { class } function filterWithNameKeysAndValues(name: NSString;
      keysAndValues: Pointer): CIFilter; cdecl;
    [MethodName('filterWithName:withInputParameters:')]
    { class } function filterWithNameWithInputParameters(name: NSString;
      withInputParameters: NSDictionary): CIFilter; cdecl;
    { class } function filterNamesInCategory(category: NSString)
      : NSArray; cdecl;
    { class } function filterNamesInCategories(categories: NSArray)
      : NSArray; cdecl;
    { class } procedure registerFilterName(name: NSString;
      &constructor: Pointer; classAttributes: NSDictionary); cdecl;
    { class } function localizedNameForFilterName(filterName: NSString)
      : NSString; cdecl;
    { class } function localizedNameForCategory(category: NSString)
      : NSString; cdecl;
    { class } function localizedDescriptionForFilterName(filterName: NSString)
      : NSString; cdecl;
    { class } function localizedReferenceDocumentationForFilterName
      (filterName: NSString): NSURL; cdecl;
    { class } function serializedXMPFromFilters(filters: NSArray;
      inputImageExtent: CGRect): NSData; cdecl;
    { class } function filterArrayFromSerializedXMP(xmpData: NSData;
      inputImageExtent: CGRect; error: NSError): NSArray; cdecl;
    { class } function gaussianGradientFilter: CIFilter; cdecl;
    { class } function hueSaturationValueGradientFilter: CIFilter; cdecl;
    { class } function linearGradientFilter: CIFilter; cdecl;
    { class } function radialGradientFilter: CIFilter; cdecl;
    { class } function smoothLinearGradientFilter: CIFilter; cdecl;
    { class } function sharpenLuminanceFilter: CIFilter; cdecl;
    { class } function unsharpMaskFilter: CIFilter; cdecl;
    { class } function circularScreenFilter: CIFilter; cdecl;
    { class } function CMYKHalftone: CIFilter; cdecl;
    { class } function dotScreenFilter: CIFilter; cdecl;
    { class } function hatchedScreenFilter: CIFilter; cdecl;
    { class } function lineScreenFilter: CIFilter; cdecl;
    { class } function bicubicScaleTransformFilter: CIFilter; cdecl;
    { class } function edgePreserveUpsampleFilter: CIFilter; cdecl;
    { class } function keystoneCorrectionCombinedFilter: CIFilter; cdecl;
    { class } function keystoneCorrectionHorizontalFilter: CIFilter; cdecl;
    { class } function keystoneCorrectionVerticalFilter: CIFilter; cdecl;
    { class } function lanczosScaleTransformFilter: CIFilter; cdecl;
    { class } function perspectiveCorrectionFilter: CIFilter; cdecl;
    { class } function perspectiveRotateFilter: CIFilter; cdecl;
    { class } function perspectiveTransformFilter: CIFilter; cdecl;
    { class } function perspectiveTransformWithExtentFilter: CIFilter; cdecl;
    { class } function straightenFilter: CIFilter; cdecl;
    { class } function accordionFoldTransitionFilter: CIFilter; cdecl;
    { class } function barsSwipeTransitionFilter: CIFilter; cdecl;
    { class } function copyMachineTransitionFilter: CIFilter; cdecl;
    { class } function disintegrateWithMaskTransitionFilter: CIFilter; cdecl;
    { class } function dissolveTransitionFilter: CIFilter; cdecl;
    { class } function flashTransitionFilter: CIFilter; cdecl;
    { class } function modTransitionFilter: CIFilter; cdecl;
    { class } function pageCurlTransitionFilter: CIFilter; cdecl;
    { class } function pageCurlWithShadowTransitionFilter: CIFilter; cdecl;
    { class } function rippleTransitionFilter: CIFilter; cdecl;
    { class } function swipeTransitionFilter: CIFilter; cdecl;
    { class } function additionCompositingFilter: CIFilter; cdecl;
    { class } function colorBlendModeFilter: CIFilter; cdecl;
    { class } function colorBurnBlendModeFilter: CIFilter; cdecl;
    { class } function colorDodgeBlendModeFilter: CIFilter; cdecl;
    { class } function darkenBlendModeFilter: CIFilter; cdecl;
    { class } function differenceBlendModeFilter: CIFilter; cdecl;
    { class } function divideBlendModeFilter: CIFilter; cdecl;
    { class } function exclusionBlendModeFilter: CIFilter; cdecl;
    { class } function hardLightBlendModeFilter: CIFilter; cdecl;
    { class } function hueBlendModeFilter: CIFilter; cdecl;
    { class } function lightenBlendModeFilter: CIFilter; cdecl;
    { class } function linearBurnBlendModeFilter: CIFilter; cdecl;
    { class } function linearDodgeBlendModeFilter: CIFilter; cdecl;
    { class } function linearLightBlendModeFilter: CIFilter; cdecl;
    { class } function luminosityBlendModeFilter: CIFilter; cdecl;
    { class } function maximumCompositingFilter: CIFilter; cdecl;
    { class } function minimumCompositingFilter: CIFilter; cdecl;
    { class } function multiplyBlendModeFilter: CIFilter; cdecl;
    { class } function multiplyCompositingFilter: CIFilter; cdecl;
    { class } function overlayBlendModeFilter: CIFilter; cdecl;
    { class } function pinLightBlendModeFilter: CIFilter; cdecl;
    { class } function saturationBlendModeFilter: CIFilter; cdecl;
    { class } function screenBlendModeFilter: CIFilter; cdecl;
    { class } function softLightBlendModeFilter: CIFilter; cdecl;
    { class } function sourceAtopCompositingFilter: CIFilter; cdecl;
    { class } function sourceInCompositingFilter: CIFilter; cdecl;
    { class } function sourceOutCompositingFilter: CIFilter; cdecl;
    { class } function sourceOverCompositingFilter: CIFilter; cdecl;
    { class } function subtractBlendModeFilter: CIFilter; cdecl;
    { class } function vividLightBlendModeFilter: CIFilter; cdecl;
    { class } function colorAbsoluteDifferenceFilter: CIFilter; cdecl;
    { class } function colorClampFilter: CIFilter; cdecl;
    { class } function colorControlsFilter: CIFilter; cdecl;
    { class } function colorMatrixFilter: CIFilter; cdecl;
    { class } function colorPolynomialFilter: CIFilter; cdecl;
    { class } function colorThresholdFilter: CIFilter; cdecl;
    { class } function colorThresholdOtsuFilter: CIFilter; cdecl;
    { class } function depthToDisparityFilter: CIFilter; cdecl;
    { class } function disparityToDepthFilter: CIFilter; cdecl;
    { class } function exposureAdjustFilter: CIFilter; cdecl;
    { class } function gammaAdjustFilter: CIFilter; cdecl;
    { class } function hueAdjustFilter: CIFilter; cdecl;
    { class } function linearToSRGBToneCurveFilter: CIFilter; cdecl;
    { class } function sRGBToneCurveToLinearFilter: CIFilter; cdecl;
    { class } function temperatureAndTintFilter: CIFilter; cdecl;
    { class } function toneCurveFilter: CIFilter; cdecl;
    { class } function vibranceFilter: CIFilter; cdecl;
    { class } function whitePointAdjustFilter: CIFilter; cdecl;
    { class } function colorCrossPolynomialFilter: CIFilter; cdecl;
    { class } function colorCubeFilter: CIFilter; cdecl;
    { class } function colorCubesMixedWithMaskFilter: CIFilter; cdecl;
    { class } function colorCubeWithColorSpaceFilter: CIFilter; cdecl;
    { class } function colorCurvesFilter: CIFilter; cdecl;
    { class } function colorInvertFilter: CIFilter; cdecl;
    { class } function colorMapFilter: CIFilter; cdecl;
    { class } function colorMonochromeFilter: CIFilter; cdecl;
    { class } function colorPosterizeFilter: CIFilter; cdecl;
    { class } function convertLabToRGBFilter: CIFilter; cdecl;
    { class } function convertRGBtoLabFilter: CIFilter; cdecl;
    { class } function ditherFilter: CIFilter; cdecl;
    { class } function documentEnhancerFilter: CIFilter; cdecl;
    { class } function falseColorFilter: CIFilter; cdecl;
    { class } function LabDeltaE: CIFilter; cdecl;
    { class } function maskToAlphaFilter: CIFilter; cdecl;
    { class } function maximumComponentFilter: CIFilter; cdecl;
    { class } function minimumComponentFilter: CIFilter; cdecl;
    { class } function paletteCentroidFilter: CIFilter; cdecl;
    { class } function palettizeFilter: CIFilter; cdecl;
    { class } function photoEffectChromeFilter: CIFilter; cdecl;
    { class } function photoEffectFadeFilter: CIFilter; cdecl;
    { class } function photoEffectInstantFilter: CIFilter; cdecl;
    { class } function photoEffectMonoFilter: CIFilter; cdecl;
    { class } function photoEffectNoirFilter: CIFilter; cdecl;
    { class } function photoEffectProcessFilter: CIFilter; cdecl;
    { class } function photoEffectTonalFilter: CIFilter; cdecl;
    { class } function photoEffectTransferFilter: CIFilter; cdecl;
    { class } function sepiaToneFilter: CIFilter; cdecl;
    { class } function thermalFilter: CIFilter; cdecl;
    { class } function vignetteFilter: CIFilter; cdecl;
    { class } function vignetteEffectFilter: CIFilter; cdecl;
    { class } function xRayFilter: CIFilter; cdecl;
    { class } function bumpDistortionFilter: CIFilter; cdecl;
    { class } function bumpDistortionLinearFilter: CIFilter; cdecl;
    { class } function circleSplashDistortionFilter: CIFilter; cdecl;
    { class } function circularWrapFilter: CIFilter; cdecl;
    { class } function displacementDistortionFilter: CIFilter; cdecl;
    { class } function drosteFilter: CIFilter; cdecl;
    { class } function glassDistortionFilter: CIFilter; cdecl;
    { class } function glassLozengeFilter: CIFilter; cdecl;
    { class } function holeDistortionFilter: CIFilter; cdecl;
    { class } function lightTunnelFilter: CIFilter; cdecl;
    { class } function ninePartStretchedFilter: CIFilter; cdecl;
    { class } function ninePartTiledFilter: CIFilter; cdecl;
    { class } function pinchDistortionFilter: CIFilter; cdecl;
    { class } function stretchCropFilter: CIFilter; cdecl;
    { class } function torusLensDistortionFilter: CIFilter; cdecl;
    { class } function twirlDistortionFilter: CIFilter; cdecl;
    { class } function vortexDistortionFilter: CIFilter; cdecl;
    { class } function affineClampFilter: CIFilter; cdecl;
    { class } function affineTileFilter: CIFilter; cdecl;
    { class } function eightfoldReflectedTileFilter: CIFilter; cdecl;
    { class } function fourfoldReflectedTileFilter: CIFilter; cdecl;
    { class } function fourfoldRotatedTileFilter: CIFilter; cdecl;
    { class } function fourfoldTranslatedTileFilter: CIFilter; cdecl;
    { class } function glideReflectedTileFilter: CIFilter; cdecl;
    { class } function kaleidoscopeFilter: CIFilter; cdecl;
    { class } function opTileFilter: CIFilter; cdecl;
    { class } function parallelogramTileFilter: CIFilter; cdecl;
    { class } function perspectiveTileFilter: CIFilter; cdecl;
    { class } function sixfoldReflectedTileFilter: CIFilter; cdecl;
    { class } function sixfoldRotatedTileFilter: CIFilter; cdecl;
    { class } function triangleKaleidoscopeFilter: CIFilter; cdecl;
    { class } function triangleTileFilter: CIFilter; cdecl;
    { class } function twelvefoldReflectedTileFilter: CIFilter; cdecl;
    { class } function attributedTextImageGeneratorFilter: CIFilter; cdecl;
    { class } function aztecCodeGeneratorFilter: CIFilter; cdecl;
    { class } function barcodeGeneratorFilter: CIFilter; cdecl;
    { class } function checkerboardGeneratorFilter: CIFilter; cdecl;
    { class } function code128BarcodeGeneratorFilter: CIFilter; cdecl;
    { class } function lenticularHaloGeneratorFilter: CIFilter; cdecl;
    { class } function meshGeneratorFilter: CIFilter; cdecl;
    { class } function PDF417BarcodeGenerator: CIFilter; cdecl;
    { class } function QRCodeGenerator: CIFilter; cdecl;
    { class } function randomGeneratorFilter: CIFilter; cdecl;
    { class } function roundedRectangleGeneratorFilter: CIFilter; cdecl;
    { class } function starShineGeneratorFilter: CIFilter; cdecl;
    { class } function stripesGeneratorFilter: CIFilter; cdecl;
    { class } function sunbeamsGeneratorFilter: CIFilter; cdecl;
    { class } function textImageGeneratorFilter: CIFilter; cdecl;
    { class } function blendWithAlphaMaskFilter: CIFilter; cdecl;
    { class } function blendWithBlueMaskFilter: CIFilter; cdecl;
    { class } function blendWithMaskFilter: CIFilter; cdecl;
    { class } function blendWithRedMaskFilter: CIFilter; cdecl;
    { class } function bloomFilter: CIFilter; cdecl;
    { class } function comicEffectFilter: CIFilter; cdecl;
    { class } function convolution3X3Filter: CIFilter; cdecl;
    { class } function convolution5X5Filter: CIFilter; cdecl;
    { class } function convolution7X7Filter: CIFilter; cdecl;
    { class } function convolution9HorizontalFilter: CIFilter; cdecl;
    { class } function convolution9VerticalFilter: CIFilter; cdecl;
    { class } function convolutionRGB3X3Filter: CIFilter; cdecl;
    { class } function convolutionRGB5X5Filter: CIFilter; cdecl;
    { class } function convolutionRGB7X7Filter: CIFilter; cdecl;
    { class } function convolutionRGB9HorizontalFilter: CIFilter; cdecl;
    { class } function convolutionRGB9VerticalFilter: CIFilter; cdecl;
    { class } function coreMLModelFilter: CIFilter; cdecl;
    { class } function crystallizeFilter: CIFilter; cdecl;
    { class } function depthOfFieldFilter: CIFilter; cdecl;
    { class } function edgesFilter: CIFilter; cdecl;
    { class } function edgeWorkFilter: CIFilter; cdecl;
    { class } function gaborGradientsFilter: CIFilter; cdecl;
    { class } function gloomFilter: CIFilter; cdecl;
    { class } function heightFieldFromMaskFilter: CIFilter; cdecl;
    { class } function hexagonalPixellateFilter: CIFilter; cdecl;
    { class } function highlightShadowAdjustFilter: CIFilter; cdecl;
    { class } function lineOverlayFilter: CIFilter; cdecl;
    { class } function mixFilter: CIFilter; cdecl;
    { class } function personSegmentationFilter: CIFilter; cdecl;
    { class } function pixellateFilter: CIFilter; cdecl;
    { class } function pointillizeFilter: CIFilter; cdecl;
    { class } function saliencyMapFilter: CIFilter; cdecl;
    { class } function shadedMaterialFilter: CIFilter; cdecl;
    { class } function spotColorFilter: CIFilter; cdecl;
    { class } function spotLightFilter: CIFilter; cdecl;
    { class } function bokehBlurFilter: CIFilter; cdecl;
    { class } function boxBlurFilter: CIFilter; cdecl;
    { class } function discBlurFilter: CIFilter; cdecl;
    { class } function gaussianBlurFilter: CIFilter; cdecl;
    { class } function maskedVariableBlurFilter: CIFilter; cdecl;
    { class } function medianFilter: CIFilter; cdecl;
    { class } function morphologyGradientFilter: CIFilter; cdecl;
    { class } function morphologyMaximumFilter: CIFilter; cdecl;
    { class } function morphologyMinimumFilter: CIFilter; cdecl;
    { class } function morphologyRectangleMaximumFilter: CIFilter; cdecl;
    { class } function morphologyRectangleMinimumFilter: CIFilter; cdecl;
    { class } function motionBlurFilter: CIFilter; cdecl;
    { class } function noiseReductionFilter: CIFilter; cdecl;
    { class } function zoomBlurFilter: CIFilter; cdecl;
    { class } function areaAverageFilter: CIFilter; cdecl;
    { class } function areaHistogramFilter: CIFilter; cdecl;
    { class } function areaLogarithmicHistogramFilter: CIFilter; cdecl;
    { class } function areaMaximumFilter: CIFilter; cdecl;
    { class } function areaMaximumAlphaFilter: CIFilter; cdecl;
    { class } function areaMinimumFilter: CIFilter; cdecl;
    { class } function areaMinimumAlphaFilter: CIFilter; cdecl;
    { class } function areaMinMaxFilter: CIFilter; cdecl;
    { class } function areaMinMaxRedFilter: CIFilter; cdecl;
    { class } function columnAverageFilter: CIFilter; cdecl;
    { class } function histogramDisplayFilter: CIFilter; cdecl;
    { class } function KMeansFilter: CIFilter; cdecl;
    { class } function rowAverageFilter: CIFilter; cdecl;
    { class } function filterWithImageURL(url: NSURL; options: NSDictionary)
      : CIFilter; cdecl;
    { class } function filterWithImageData(data: NSData; options: NSDictionary)
      : CIFilter; cdecl;
    { class } function filterWithCVPixelBuffer(pixelBuffer: CVPixelBufferRef;
      properties: NSDictionary; options: NSDictionary): CIFilter; cdecl;
    { class } function supportedRawCameraModels: NSArray; cdecl;
  end;

  CIFilter = interface(NSObject)
    ['{7F8D5CEC-ABF4-4796-84F9-475A30FC354E}']
    function outputImage: CIImage; cdecl;
    function name: NSString; cdecl;
    procedure setName(aString: NSString); cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    function inputKeys: NSArray; cdecl;
    function outputKeys: NSArray; cdecl;
    procedure setDefaults; cdecl;
    function attributes: NSDictionary; cdecl;
    [MethodName('apply:arguments:options:')]
    function applyArgumentsOptions(k: CIKernel; arguments: NSArray;
      options: NSDictionary): CIImage; cdecl;
    [MethodName('apply:')]
    function apply(k: CIKernel): CIImage; cdecl;
  end;

  TCIFilter = class(TOCGenericImport<CIFilterClass, CIFilter>)
  end;

  PCIFilter = Pointer;

  CIImageClass = interface(NSObjectClass)
    ['{0B25EB42-6D8F-4EDE-8003-A32EC10A67FD}']
    [MethodName('imageWithCGImage:')]
    { class } function imageWithCGImage(image: CGImageRef): CIImage; cdecl;
    [MethodName('imageWithCGImage:options:')]
    { class } function imageWithCGImageOptions(image: CGImageRef;
      options: NSDictionary): CIImage; cdecl;
    { class } function imageWithCGImageSource(source: CGImageSourceRef;
      index: LongWord; options: NSDictionary): CIImage; cdecl;
    [MethodName('imageWithCGLayer:')]
    { class } function imageWithCGLayer(layer: CGLayerRef): CIImage; cdecl;
    [MethodName('imageWithCGLayer:options:')]
    { class } function imageWithCGLayerOptions(layer: CGLayerRef;
      options: NSDictionary): CIImage; cdecl;
    { class } function imageWithBitmapData(data: NSData; bytesPerRow: LongWord;
      size: CGSize; format: CIFormat; colorSpace: CGColorSpaceRef)
      : CIImage; cdecl;
    [MethodName('imageWithTexture:size:flipped:colorSpace:')]
    { class } function imageWithTextureSizeFlippedColorSpace(name: Cardinal;
      size: CGSize; flipped: Boolean; colorSpace: CGColorSpaceRef)
      : CIImage; cdecl;
    [MethodName('imageWithTexture:size:flipped:options:')]
    { class } function imageWithTextureSizeFlippedOptions(name: Cardinal;
      size: CGSize; flipped: Boolean; options: NSDictionary): CIImage; cdecl;
    { class } function imageWithMTLTexture(texture: Pointer;
      options: NSDictionary): CIImage; cdecl;
    [MethodName('imageWithContentsOfURL:')]
    { class } function imageWithContentsOfURL(url: NSURL): CIImage; cdecl;
    [MethodName('imageWithContentsOfURL:options:')]
    { class } function imageWithContentsOfURLOptions(url: NSURL;
      options: NSDictionary): CIImage; cdecl;
    [MethodName('imageWithData:')]
    { class } function imageWithData(data: NSData): CIImage; cdecl;
    [MethodName('imageWithData:options:')]
    { class } function imageWithDataOptions(data: NSData; options: NSDictionary)
      : CIImage; cdecl;
    [MethodName('imageWithCVImageBuffer:')]
    { class } function imageWithCVImageBuffer(imageBuffer: CVImageBufferRef)
      : CIImage; cdecl;
    [MethodName('imageWithCVImageBuffer:options:')]
    { class } function imageWithCVImageBufferOptions
      (imageBuffer: CVImageBufferRef; options: NSDictionary): CIImage; cdecl;
    [MethodName('imageWithCVPixelBuffer:')]
    { class } function imageWithCVPixelBuffer(pixelBuffer: CVPixelBufferRef)
      : CIImage; cdecl;
    [MethodName('imageWithCVPixelBuffer:options:')]
    { class } function imageWithCVPixelBufferOptions
      (pixelBuffer: CVPixelBufferRef; options: NSDictionary): CIImage; cdecl;
    [MethodName('imageWithIOSurface:')]
    { class } function imageWithIOSurface(surface: IOSurfaceRef)
      : CIImage; cdecl;
    [MethodName('imageWithIOSurface:options:')]
    { class } function imageWithIOSurfaceOptions(surface: IOSurfaceRef;
      options: NSDictionary): CIImage; cdecl;
    { class } function imageWithColor(color: CIColor): CIImage; cdecl;
    { class } function emptyImage: CIImage; cdecl;
    [MethodName('imageWithDepthData:options:')]
    { class } function imageWithDepthDataOptions(data: AVDepthData;
      options: NSDictionary): Pointer { instancetype }; cdecl;
    [MethodName('imageWithDepthData:')]
    { class } function imageWithDepthData(data: AVDepthData)
      : Pointer { instancetype }; cdecl;
    [MethodName('imageWithPortaitEffectsMatte:options:')]
    { class } function imageWithPortaitEffectsMatteOptions
      (matte: AVPortraitEffectsMatte; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('imageWithPortaitEffectsMatte:')]
    { class } function imageWithPortaitEffectsMatte
      (matte: AVPortraitEffectsMatte): Pointer { instancetype }; cdecl;
    [MethodName('imageWithSemanticSegmentationMatte:options:')]
    { class } function imageWithSemanticSegmentationMatteOptions
      (matte: AVSemanticSegmentationMatte; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('imageWithSemanticSegmentationMatte:')]
    { class } function imageWithSemanticSegmentationMatte
      (matte: AVSemanticSegmentationMatte): Pointer { instancetype }; cdecl;
    [MethodName('imageWithImageProvider:size::format:colorSpace:options:')]
    { class } function imageWithImageProviderSizeFormatColorSpaceOptions
      (p: Pointer; size: LongWord; height: LongWord; format: CIFormat;
      colorSpace: CGColorSpaceRef; options: NSDictionary): CIImage; cdecl;
  end;

  CIImage = interface(NSObject)
    ['{E134966F-5B10-4074-922C-AA778C8E88C0}']
    procedure setBlackImage(blackImage: CIImage); cdecl;
    function blackImage: CIImage; cdecl;
    procedure setWhiteImage(whiteImage: CIImage); cdecl;
    function whiteImage: CIImage; cdecl;
    procedure setGrayImage(grayImage: CIImage); cdecl;
    function grayImage: CIImage; cdecl;
    procedure setRedImage(redImage: CIImage); cdecl;
    function redImage: CIImage; cdecl;
    procedure setGreenImage(greenImage: CIImage); cdecl;
    function greenImage: CIImage; cdecl;
    procedure setBlueImage(blueImage: CIImage); cdecl;
    function blueImage: CIImage; cdecl;
    procedure setCyanImage(cyanImage: CIImage); cdecl;
    function cyanImage: CIImage; cdecl;
    procedure setMagentaImage(magentaImage: CIImage); cdecl;
    function magentaImage: CIImage; cdecl;
    procedure setYellowImage(yellowImage: CIImage); cdecl;
    function yellowImage: CIImage; cdecl;
    procedure setClearImage(clearImage: CIImage); cdecl;
    function clearImage: CIImage; cdecl;
    [MethodName('initWithCGImage:')]
    function initWithCGImage(image: CGImageRef)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithCGImage:options:')]
    function initWithCGImageOptions(image: CGImageRef; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function initWithCGImageSource(source: CGImageSourceRef; index: LongWord;
      options: NSDictionary): Pointer { instancetype }; cdecl;
    [MethodName('initWithCGLayer:')]
    function initWithCGLayer(layer: CGLayerRef)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithCGLayer:options:')]
    function initWithCGLayerOptions(layer: CGLayerRef; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithData:')]
    function initWithData(data: NSData): Pointer { instancetype }; cdecl;
    [MethodName('initWithData:options:')]
    function initWithDataOptions(data: NSData; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function initWithBitmapData(data: NSData; bytesPerRow: LongWord;
      size: CGSize; format: CIFormat; colorSpace: CGColorSpaceRef)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithTexture:size:flipped:colorSpace:')]
    function initWithTextureSizeFlippedColorSpace(name: Cardinal; size: CGSize;
      flipped: Boolean; colorSpace: CGColorSpaceRef)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithTexture:size:flipped:options:')]
    function initWithTextureSizeFlippedOptions(name: Cardinal; size: CGSize;
      flipped: Boolean; options: NSDictionary): Pointer { instancetype }; cdecl;
    function initWithMTLTexture(texture: Pointer; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithContentsOfURL:')]
    function initWithContentsOfURL(url: NSURL): Pointer { instancetype }; cdecl;
    [MethodName('initWithContentsOfURL:options:')]
    function initWithContentsOfURLOptions(url: NSURL; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithIOSurface:')]
    function initWithIOSurface(surface: IOSurfaceRef)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithIOSurface:options:')]
    function initWithIOSurfaceOptions(surface: IOSurfaceRef;
      options: NSDictionary): Pointer { instancetype }; cdecl;
    [MethodName('initWithCVImageBuffer:')]
    function initWithCVImageBuffer(imageBuffer: CVImageBufferRef)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithCVImageBuffer:options:')]
    function initWithCVImageBufferOptions(imageBuffer: CVImageBufferRef;
      options: NSDictionary): Pointer { instancetype }; cdecl;
    [MethodName('initWithCVPixelBuffer:')]
    function initWithCVPixelBuffer(pixelBuffer: CVPixelBufferRef)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithCVPixelBuffer:options:')]
    function initWithCVPixelBufferOptions(pixelBuffer: CVPixelBufferRef;
      options: NSDictionary): Pointer { instancetype }; cdecl;
    function initWithColor(color: CIColor): Pointer { instancetype }; cdecl;
    [MethodName('imageByApplyingTransform:')]
    function imageByApplyingTransform(matrix: CGAffineTransform)
      : CIImage; cdecl;
    [MethodName('imageByApplyingTransform:highQualityDownsample:')]
    function imageByApplyingTransformHighQualityDownsample
      (matrix: CGAffineTransform; highQualityDownsample: Boolean)
      : CIImage; cdecl;
    function imageByApplyingOrientation(orientation: Integer): CIImage; cdecl;
    function imageTransformForOrientation(orientation: Integer)
      : CGAffineTransform; cdecl;
    function imageByApplyingCGOrientation(orientation
      : CGImagePropertyOrientation): CIImage; cdecl;
    function imageTransformForCGOrientation(orientation
      : CGImagePropertyOrientation): CGAffineTransform; cdecl;
    function imageByCompositingOverImage(dest: CIImage): CIImage; cdecl;
    function imageByCroppingToRect(rect: CGRect): CIImage; cdecl;
    function imageByClampingToExtent: CIImage; cdecl;
    function imageByClampingToRect(rect: CGRect): CIImage; cdecl;
    [MethodName('imageByApplyingFilter:withInputParameters:')]
    function imageByApplyingFilterWithInputParameters(filterName: NSString;
      withInputParameters: NSDictionary): CIImage; cdecl;
    [MethodName('imageByApplyingFilter:')]
    function imageByApplyingFilter(filterName: NSString): CIImage; cdecl;
    function imageByColorMatchingColorSpaceToWorkingSpace
      (colorSpace: CGColorSpaceRef): CIImage; cdecl;
    function imageByColorMatchingWorkingSpaceToColorSpace
      (colorSpace: CGColorSpaceRef): CIImage; cdecl;
    function imageByPremultiplyingAlpha: CIImage; cdecl;
    function imageByUnpremultiplyingAlpha: CIImage; cdecl;
    function imageBySettingAlphaOneInExtent(extent: CGRect): CIImage; cdecl;
    function imageByApplyingGaussianBlurWithSigma(sigma: Double)
      : CIImage; cdecl;
    function imageBySettingProperties(properties: NSDictionary): CIImage; cdecl;
    function imageBySamplingLinear: CIImage; cdecl;
    function imageBySamplingNearest: CIImage; cdecl;
    [MethodName('imageByInsertingIntermediate')]
    function imageByInsertingIntermediate: CIImage; cdecl; overload;
    [MethodName('imageByInsertingIntermediate:')]
    function imageByInsertingIntermediate(cache: Boolean): CIImage;
      cdecl; overload;
    function extent: CGRect; cdecl;
    function properties: NSDictionary; cdecl;
    function definition: CIFilterShape; cdecl;
    function url: NSURL; cdecl;
    function colorSpace: CGColorSpaceRef; cdecl;
    function pixelBuffer: CVPixelBufferRef; cdecl;
    function CGImage: CGImageRef; cdecl;
    function regionOfInterestForImage(image: CIImage; inRect: CGRect)
      : CGRect; cdecl;
    function autoAdjustmentFilters: NSArray; cdecl;
    function autoAdjustmentFiltersWithOptions(options: NSDictionary)
      : NSArray; cdecl;
    function imageByConvertingWorkingSpaceToLab: CIImage; cdecl;
    function imageByConvertingLabToWorkingSpace: CIImage; cdecl;
    function depthData: AVDepthData; cdecl;
    [MethodName('initWithDepthData:options:')]
    function initWithDepthDataOptions(data: AVDepthData; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithDepthData:')]
    function initWithDepthData(data: AVDepthData)
      : Pointer { instancetype }; cdecl;
    function portraitEffectsMatte: AVPortraitEffectsMatte; cdecl;
    [MethodName('initWithPortaitEffectsMatte:options:')]
    function initWithPortaitEffectsMatteOptions(matte: AVPortraitEffectsMatte;
      options: NSDictionary): Pointer { instancetype }; cdecl;
    [MethodName('initWithPortaitEffectsMatte:')]
    function initWithPortaitEffectsMatte(matte: AVPortraitEffectsMatte)
      : Pointer { instancetype }; cdecl;
    function semanticSegmentationMatte: AVSemanticSegmentationMatte; cdecl;
    [MethodName('initWithSemanticSegmentationMatte:options:')]
    function initWithSemanticSegmentationMatteOptions
      (matte: AVSemanticSegmentationMatte; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithSemanticSegmentationMatte:')]
    function initWithSemanticSegmentationMatte
      (matte: AVSemanticSegmentationMatte): Pointer { instancetype }; cdecl;
    [MethodName('initWithImageProvider:size::format:colorSpace:options:')]
    function initWithImageProviderSizeFormatColorSpaceOptions(p: Pointer;
      size: LongWord; height: LongWord; format: CIFormat;
      colorSpace: CGColorSpaceRef; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  TCIImage = class(TOCGenericImport<CIImageClass, CIImage>)
  end;

  PCIImage = Pointer;

  CIFeatureClass = interface(NSObjectClass)
    ['{50B2FF57-5A96-4982-8F91-EA55BD343A56}']
  end;

  CIFeature = interface(NSObject)
    ['{91730AE1-BD3D-466F-A633-245FF74FF64B}']
    function &type: NSString; cdecl;
    function bounds: CGRect; cdecl;
  end;

  TCIFeature = class(TOCGenericImport<CIFeatureClass, CIFeature>)
  end;

  PCIFeature = Pointer;

  CIDetectorClass = interface(NSObjectClass)
    ['{6E9637ED-4D56-4D08-9DC1-B1217908E860}']
    { class } function detectorOfType(&type: NSString; context: CIContext;
      options: NSDictionary): CIDetector; cdecl;
  end;

  CIDetector = interface(NSObject)
    ['{44D54C2F-729F-4D8A-A1F3-91F020DC00D3}']
    [MethodName('featuresInImage:')]
    function featuresInImage(image: CIImage): NSArray; cdecl;
    [MethodName('featuresInImage:options:')]
    function featuresInImageOptions(image: CIImage; options: NSDictionary)
      : NSArray; cdecl;
  end;

  TCIDetector = class(TOCGenericImport<CIDetectorClass, CIDetector>)
  end;

  PCIDetector = Pointer;

  CIFaceFeatureClass = interface(CIFeatureClass)
    ['{0FB79334-5C30-4A54-8B5B-2F1FB66E71C3}']
  end;

  CIFaceFeature = interface(CIFeature)
    ['{8E37EDBA-A310-470F-B6C2-652A365C1BCC}']
    function bounds: CGRect; cdecl;
    function hasLeftEyePosition: Boolean; cdecl;
    function leftEyePosition: CGPoint; cdecl;
    function hasRightEyePosition: Boolean; cdecl;
    function rightEyePosition: CGPoint; cdecl;
    function hasMouthPosition: Boolean; cdecl;
    function mouthPosition: CGPoint; cdecl;
    function hasTrackingID: Boolean; cdecl;
    function trackingID: Integer; cdecl;
    function hasTrackingFrameCount: Boolean; cdecl;
    function trackingFrameCount: Integer; cdecl;
    function hasFaceAngle: Boolean; cdecl;
    function faceAngle: Single; cdecl;
    function hasSmile: Boolean; cdecl;
    function leftEyeClosed: Boolean; cdecl;
    function rightEyeClosed: Boolean; cdecl;
  end;

  TCIFaceFeature = class(TOCGenericImport<CIFaceFeatureClass, CIFaceFeature>)
  end;

  PCIFaceFeature = Pointer;

  CIRectangleFeatureClass = interface(CIFeatureClass)
    ['{8800638A-EB05-40C3-A93E-F575987BBECE}']
  end;

  CIRectangleFeature = interface(CIFeature)
    ['{C1601F35-7B5D-40EA-AE3B-223F55CCB506}']
    function bounds: CGRect; cdecl;
    function topLeft: CGPoint; cdecl;
    function topRight: CGPoint; cdecl;
    function bottomLeft: CGPoint; cdecl;
    function bottomRight: CGPoint; cdecl;
  end;

  TCIRectangleFeature = class(TOCGenericImport<CIRectangleFeatureClass,
    CIRectangleFeature>)
  end;

  PCIRectangleFeature = Pointer;

  CIQRCodeFeatureClass = interface(CIFeatureClass)
    ['{CAEE3096-B3E8-47E6-AD7F-64E1F3693079}']
  end;

  CIQRCodeFeature = interface(CIFeature)
    ['{28EB32E0-8E85-4B0C-BB78-EC8A22BF000C}']
    function bounds: CGRect; cdecl;
    function topLeft: CGPoint; cdecl;
    function topRight: CGPoint; cdecl;
    function bottomLeft: CGPoint; cdecl;
    function bottomRight: CGPoint; cdecl;
    function messageString: NSString; cdecl;
    function symbolDescriptor: CIQRCodeDescriptor; cdecl;
  end;

  TCIQRCodeFeature = class(TOCGenericImport<CIQRCodeFeatureClass,
    CIQRCodeFeature>)
  end;

  PCIQRCodeFeature = Pointer;

  CITextFeatureClass = interface(CIFeatureClass)
    ['{ECF31672-FBB3-4831-8991-73E40BFA2D7C}']
  end;

  CITextFeature = interface(CIFeature)
    ['{A0526B02-69F2-432A-95FD-7488B8FA01E5}']
    function bounds: CGRect; cdecl;
    function topLeft: CGPoint; cdecl;
    function topRight: CGPoint; cdecl;
    function bottomLeft: CGPoint; cdecl;
    function bottomRight: CGPoint; cdecl;
    function subFeatures: NSArray; cdecl;
  end;

  TCITextFeature = class(TOCGenericImport<CITextFeatureClass, CITextFeature>)
  end;

  PCITextFeature = Pointer;

  CIKernelClass = interface(NSObjectClass)
    ['{7F27B8A7-617E-46EA-B85E-751604DE0704}']
    { class } function kernelsWithString(&string: NSString): NSArray; cdecl;
    { class } function kernelsWithMetalString(source: NSString; error: NSError)
      : NSArray; cdecl;
    { class } function kernelWithString(&string: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('kernelWithFunctionName:fromMetalLibraryData:error:')]
    { class } function kernelWithFunctionNameFromMetalLibraryDataError
      (name: NSString; fromMetalLibraryData: NSData; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('kernelWithFunctionName:fromMetalLibraryData:outputPixelFormat:error:')]
    { class } function
      kernelWithFunctionNameFromMetalLibraryDataOutputPixelFormatError
      (name: NSString; fromMetalLibraryData: NSData;
      outputPixelFormat: CIFormat; error: NSError)
      : Pointer { instancetype }; cdecl;
    { class } function kernelNamesFromMetalLibraryData(data: NSData)
      : NSArray; cdecl;
  end;

  CIKernel = interface(NSObject)
    ['{73EDA577-4F9F-4E6E-B8C6-AE581591C7F5}']
    function name: NSString; cdecl;
    procedure setROISelector(method: SEL); cdecl;
    function applyWithExtent(extent: CGRect; roiCallback: CIKernelROICallback;
      arguments: NSArray): CIImage; cdecl;
  end;

  TCIKernel = class(TOCGenericImport<CIKernelClass, CIKernel>)
  end;

  PCIKernel = Pointer;

  CIFilterGeneratorClass = interface(NSObjectClass)
    ['{499A68FE-580C-49A0-9277-B9FF4E8C55DF}']
    { class } function filterGenerator: CIFilterGenerator; cdecl;
    { class } function filterGeneratorWithContentsOfURL(aURL: NSURL)
      : CIFilterGenerator; cdecl;
  end;

  CIFilterGenerator = interface(NSObject)
    ['{C96752F1-D9B0-4D40-BB5D-3E3BA38661AB}']
    function initWithContentsOfURL(aURL: NSURL): Pointer; cdecl;
    [MethodName('connectObject:withKey:toObject:withKey:')]
    procedure connectObject(sourceObject: Pointer; withKey: NSString;
      toObject: Pointer; withKey1: NSString); cdecl;
    [MethodName('disconnectObject:withKey:toObject:withKey:')]
    procedure disconnectObject(sourceObject: Pointer; withKey: NSString;
      toObject: Pointer; withKey1: NSString); cdecl;
    procedure exportKey(key: NSString; fromObject: Pointer;
      withName: NSString); cdecl;
    procedure removeExportedKey(exportedKeyName: NSString); cdecl;
    function exportedKeys: NSDictionary; cdecl;
    procedure setAttributes(attributes: NSDictionary;
      forExportedKey: NSString); cdecl;
    procedure setClassAttributes(classAttributes: NSDictionary); cdecl;
    function classAttributes: NSDictionary; cdecl;
    function filter: CIFilter; cdecl;
    procedure registerFilterName(name: NSString); cdecl;
    function writeToURL(aURL: NSURL; atomically: Boolean): Boolean; cdecl;
  end;

  TCIFilterGenerator = class(TOCGenericImport<CIFilterGeneratorClass,
    CIFilterGenerator>)
  end;

  PCIFilterGenerator = Pointer;

  CIImageAccumulatorClass = interface(NSObjectClass)
    ['{E75A9FCD-A1CE-4BB9-B97F-4596B9088073}']
    [MethodName('imageAccumulatorWithExtent:format:')]
    { class } function imageAccumulatorWithExtentFormat(extent: CGRect;
      format: CIFormat): Pointer { instancetype }; cdecl;
    [MethodName('imageAccumulatorWithExtent:format:colorSpace:')]
    { class } function imageAccumulatorWithExtentFormatColorSpace
      (extent: CGRect; format: CIFormat; colorSpace: CGColorSpaceRef)
      : Pointer { instancetype }; cdecl;
  end;

  CIImageAccumulator = interface(NSObject)
    ['{147C5125-54F3-4B6F-8EF6-C9D3DD6F6059}']
    [MethodName('initWithExtent:format:')]
    function initWithExtentFormat(extent: CGRect; format: CIFormat)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithExtent:format:colorSpace:')]
    function initWithExtentFormatColorSpace(extent: CGRect; format: CIFormat;
      colorSpace: CGColorSpaceRef): Pointer { instancetype }; cdecl;
    function extent: CGRect; cdecl;
    function format: CIFormat; cdecl;
    function image: CIImage; cdecl;
    [MethodName('setImage:')]
    procedure setImage(image: CIImage); cdecl;
    [MethodName('setImage:dirtyRect:')]
    procedure setImageDirtyRect(image: CIImage; dirtyRect: CGRect); cdecl;
    procedure clear; cdecl;
  end;

  TCIImageAccumulator = class(TOCGenericImport<CIImageAccumulatorClass,
    CIImageAccumulator>)
  end;

  PCIImageAccumulator = Pointer;

  CIImageProcessorKernelClass = interface(NSObjectClass)
    ['{18CBFE97-A1B6-40FA-923C-5F82487C2750}']
    { class } function processWithInputs(inputs: NSArray;
      arguments: NSDictionary; output: Pointer; error: NSError): Boolean; cdecl;
    { class } function roiForInput(input: Integer; arguments: NSDictionary;
      outputRect: CGRect): CGRect; cdecl;
    { class } function formatForInputAtIndex(input: Integer): CIFormat; cdecl;
    { class } function outputFormat: CIFormat; cdecl;
    { class } function outputIsOpaque: Integer; cdecl;
    { class } function synchronizeInputs: Integer; cdecl;
    { class } function applyWithExtent(extent: CGRect; inputs: NSArray;
      arguments: NSDictionary; error: NSError): CIImage; cdecl;
  end;

  CIImageProcessorKernel = interface(NSObject)
    ['{C8E3D4A5-D8D1-4EEB-B745-3144C6FA8418}']
  end;

  TCIImageProcessorKernel = class(TOCGenericImport<CIImageProcessorKernelClass,
    CIImageProcessorKernel>)
  end;

  PCIImageProcessorKernel = Pointer;

  CIImageProvider = interface(IObjectiveC)
    ['{C53C88BD-7E04-46CD-9E32-BE12C0B3D32C}']
    [MethodName('provideImageData:bytesPerRow:origin::size::userInfo:')]
    procedure provideImageDataBytesPerRowOriginSizeUserInfo(data: Pointer;
      bytesPerRow: LongWord; origin: LongWord; y: LongWord; size: LongWord;
      height: LongWord; userInfo: Pointer); cdecl;
  end;

  CIColorKernelClass = interface(CIKernelClass)
    ['{28C15A3F-086D-4BF3-BE8A-F287AABC045E}']
    { class } function kernelWithString(&string: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  CIColorKernel = interface(CIKernel)
    ['{EE55C8E8-5F63-4750-81AA-B141E9007080}']
    function applyWithExtent(extent: CGRect; arguments: NSArray)
      : CIImage; cdecl;
  end;

  TCIColorKernel = class(TOCGenericImport<CIColorKernelClass, CIColorKernel>)
  end;

  PCIColorKernel = Pointer;

  CIWarpKernelClass = interface(CIKernelClass)
    ['{F9C3B464-C682-4FC1-8DD3-B1A7C394EBC3}']
    { class } function kernelWithString(&string: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  CIWarpKernel = interface(CIKernel)
    ['{3D8825F7-1CAA-4D2F-BE0A-D02AE2EE0A40}']
    function applyWithExtent(extent: CGRect; roiCallback: CIKernelROICallback;
      inputImage: CIImage; arguments: NSArray): CIImage; cdecl;
  end;

  TCIWarpKernel = class(TOCGenericImport<CIWarpKernelClass, CIWarpKernel>)
  end;

  PCIWarpKernel = Pointer;

  CIBlendKernelClass = interface(CIColorKernelClass)
    ['{77BB166E-94EF-428B-8E5D-121AD848F369}']
    { class } function kernelWithString(&string: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  CIBlendKernel = interface(CIColorKernel)
    ['{2C8AACE5-B8F8-4CA5-98C7-C468693C1017}']
    [MethodName('applyWithForeground:background:')]
    function applyWithForegroundBackground(foreground: CIImage;
      background: CIImage): CIImage; cdecl;
    [MethodName('applyWithForeground:background:colorSpace:')]
    function applyWithForegroundBackgroundColorSpace(foreground: CIImage;
      background: CIImage; colorSpace: CGColorSpaceRef): CIImage; cdecl;
    procedure setComponentAdd(componentAdd: CIBlendKernel); cdecl;
    function componentAdd: CIBlendKernel; cdecl;
    procedure setComponentMultiply(componentMultiply: CIBlendKernel); cdecl;
    function componentMultiply: CIBlendKernel; cdecl;
    procedure setComponentMin(componentMin: CIBlendKernel); cdecl;
    function componentMin: CIBlendKernel; cdecl;
    procedure setComponentMax(componentMax: CIBlendKernel); cdecl;
    function componentMax: CIBlendKernel; cdecl;
    procedure setClear(clear: CIBlendKernel); cdecl;
    function clear: CIBlendKernel; cdecl;
    procedure setSource(source: CIBlendKernel); cdecl;
    function source: CIBlendKernel; cdecl;
    procedure setDestination(destination: CIBlendKernel); cdecl;
    function destination: CIBlendKernel; cdecl;
    procedure setSourceOver(sourceOver: CIBlendKernel); cdecl;
    function sourceOver: CIBlendKernel; cdecl;
    procedure setDestinationOver(destinationOver: CIBlendKernel); cdecl;
    function destinationOver: CIBlendKernel; cdecl;
    procedure setSourceIn(sourceIn: CIBlendKernel); cdecl;
    function sourceIn: CIBlendKernel; cdecl;
    procedure setDestinationIn(destinationIn: CIBlendKernel); cdecl;
    function destinationIn: CIBlendKernel; cdecl;
    procedure setSourceOut(sourceOut: CIBlendKernel); cdecl;
    function sourceOut: CIBlendKernel; cdecl;
    procedure setDestinationOut(destinationOut: CIBlendKernel); cdecl;
    function destinationOut: CIBlendKernel; cdecl;
    procedure setSourceAtop(sourceAtop: CIBlendKernel); cdecl;
    function sourceAtop: CIBlendKernel; cdecl;
    procedure setDestinationAtop(destinationAtop: CIBlendKernel); cdecl;
    function destinationAtop: CIBlendKernel; cdecl;
    procedure setExclusiveOr(exclusiveOr: CIBlendKernel); cdecl;
    function exclusiveOr: CIBlendKernel; cdecl;
    procedure setMultiply(multiply: CIBlendKernel); cdecl;
    function multiply: CIBlendKernel; cdecl;
    procedure setScreen(screen: CIBlendKernel); cdecl;
    function screen: CIBlendKernel; cdecl;
    procedure setOverlay(overlay: CIBlendKernel); cdecl;
    function overlay: CIBlendKernel; cdecl;
    procedure setDarken(darken: CIBlendKernel); cdecl;
    function darken: CIBlendKernel; cdecl;
    procedure setLighten(lighten: CIBlendKernel); cdecl;
    function lighten: CIBlendKernel; cdecl;
    procedure setColorDodge(colorDodge: CIBlendKernel); cdecl;
    function colorDodge: CIBlendKernel; cdecl;
    procedure setColorBurn(colorBurn: CIBlendKernel); cdecl;
    function colorBurn: CIBlendKernel; cdecl;
    procedure setHardLight(hardLight: CIBlendKernel); cdecl;
    function hardLight: CIBlendKernel; cdecl;
    procedure setSoftLight(softLight: CIBlendKernel); cdecl;
    function softLight: CIBlendKernel; cdecl;
    procedure setDifference(difference: CIBlendKernel); cdecl;
    function difference: CIBlendKernel; cdecl;
    procedure setExclusion(exclusion: CIBlendKernel); cdecl;
    function exclusion: CIBlendKernel; cdecl;
    procedure setHue(hue: CIBlendKernel); cdecl;
    function hue: CIBlendKernel; cdecl;
    procedure setSaturation(saturation: CIBlendKernel); cdecl;
    function saturation: CIBlendKernel; cdecl;
    procedure setColor(color: CIBlendKernel); cdecl;
    function color: CIBlendKernel; cdecl;
    procedure setLuminosity(luminosity: CIBlendKernel); cdecl;
    function luminosity: CIBlendKernel; cdecl;
    procedure setSubtract(subtract: CIBlendKernel); cdecl;
    function subtract: CIBlendKernel; cdecl;
    procedure setDivide(divide: CIBlendKernel); cdecl;
    function divide: CIBlendKernel; cdecl;
    procedure setLinearBurn(linearBurn: CIBlendKernel); cdecl;
    function linearBurn: CIBlendKernel; cdecl;
    procedure setLinearDodge(linearDodge: CIBlendKernel); cdecl;
    function linearDodge: CIBlendKernel; cdecl;
    procedure setVividLight(vividLight: CIBlendKernel); cdecl;
    function vividLight: CIBlendKernel; cdecl;
    procedure setLinearLight(linearLight: CIBlendKernel); cdecl;
    function linearLight: CIBlendKernel; cdecl;
    procedure setPinLight(pinLight: CIBlendKernel); cdecl;
    function pinLight: CIBlendKernel; cdecl;
    procedure setHardMix(hardMix: CIBlendKernel); cdecl;
    function hardMix: CIBlendKernel; cdecl;
    procedure setDarkerColor(darkerColor: CIBlendKernel); cdecl;
    function darkerColor: CIBlendKernel; cdecl;
    procedure setLighterColor(lighterColor: CIBlendKernel); cdecl;
    function lighterColor: CIBlendKernel; cdecl;
  end;

  TCIBlendKernel = class(TOCGenericImport<CIBlendKernelClass, CIBlendKernel>)
  end;

  PCIBlendKernel = Pointer;

  CIRAWFilterClass = interface(CIFilterClass)
    ['{4C0497B4-8EDE-4451-8C60-964F0891DBC2}']
    { class } function filterWithImageURL(url: NSURL)
      : Pointer { instancetype }; cdecl;
    { class } function filterWithImageData(data: NSData;
      identifierHint: NSString): Pointer { instancetype }; cdecl;
    { class } function filterWithCVPixelBuffer(buffer: CVPixelBufferRef;
      properties: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  CIRAWFilter = interface(CIFilter)
    ['{E9800349-3C8C-4165-B5C2-B207F48AA859}']
    procedure setSupportedCameraModels(supportedCameraModels: NSArray); cdecl;
    function supportedCameraModels: NSArray; cdecl;
    function supportedDecoderVersions: NSArray; cdecl;
    function nativeSize: CGSize; cdecl;
    function properties: NSDictionary; cdecl;
    procedure setOrientation(orientation: CGImagePropertyOrientation); cdecl;
    function orientation: CGImagePropertyOrientation; cdecl;
    procedure setDraftModeEnabled(draftModeEnabled: Boolean); cdecl;
    function isDraftModeEnabled: Boolean; cdecl;
    procedure setDecoderVersion(decoderVersion: CIRAWDecoderVersion); cdecl;
    function decoderVersion: CIRAWDecoderVersion; cdecl;
    procedure setScaleFactor(scaleFactor: Single); cdecl;
    function scaleFactor: Single; cdecl;
    procedure setExposure(exposure: Single); cdecl;
    function exposure: Single; cdecl;
    procedure setBaselineExposure(baselineExposure: Single); cdecl;
    function baselineExposure: Single; cdecl;
    procedure setShadowBias(shadowBias: Single); cdecl;
    function shadowBias: Single; cdecl;
    procedure setBoostAmount(boostAmount: Single); cdecl;
    function boostAmount: Single; cdecl;
    procedure setBoostShadowAmount(boostShadowAmount: Single); cdecl;
    function boostShadowAmount: Single; cdecl;
    procedure setGamutMappingEnabled(gamutMappingEnabled: Boolean); cdecl;
    function isGamutMappingEnabled: Boolean; cdecl;
    function isLensCorrectionSupported: Boolean; cdecl;
    procedure setLensCorrectionEnabled(lensCorrectionEnabled: Boolean); cdecl;
    function isLensCorrectionEnabled: Boolean; cdecl;
    function isLuminanceNoiseReductionSupported: Boolean; cdecl;
    procedure setLuminanceNoiseReductionAmount(luminanceNoiseReductionAmount
      : Single); cdecl;
    function luminanceNoiseReductionAmount: Single; cdecl;
    function isColorNoiseReductionSupported: Boolean; cdecl;
    procedure setColorNoiseReductionAmount(colorNoiseReductionAmount
      : Single); cdecl;
    function colorNoiseReductionAmount: Single; cdecl;
    function isSharpnessSupported: Boolean; cdecl;
    procedure setSharpnessAmount(sharpnessAmount: Single); cdecl;
    function sharpnessAmount: Single; cdecl;
    function isContrastSupported: Boolean; cdecl;
    procedure setContrastAmount(contrastAmount: Single); cdecl;
    function contrastAmount: Single; cdecl;
    function isDetailSupported: Boolean; cdecl;
    procedure setDetailAmount(detailAmount: Single); cdecl;
    function detailAmount: Single; cdecl;
    function isMoireReductionSupported: Boolean; cdecl;
    procedure setMoireReductionAmount(moireReductionAmount: Single); cdecl;
    function moireReductionAmount: Single; cdecl;
    function isLocalToneMapSupported: Boolean; cdecl;
    procedure setLocalToneMapAmount(localToneMapAmount: Single); cdecl;
    function localToneMapAmount: Single; cdecl;
    procedure setExtendedDynamicRangeAmount(extendedDynamicRangeAmount
      : Single); cdecl;
    function extendedDynamicRangeAmount: Single; cdecl;
    procedure setNeutralChromaticity(neutralChromaticity: CGPoint); cdecl;
    function neutralChromaticity: CGPoint; cdecl;
    procedure setNeutralLocation(neutralLocation: CGPoint); cdecl;
    function neutralLocation: CGPoint; cdecl;
    procedure setNeutralTemperature(neutralTemperature: Single); cdecl;
    function neutralTemperature: Single; cdecl;
    procedure setNeutralTint(neutralTint: Single); cdecl;
    function neutralTint: Single; cdecl;
    procedure setLinearSpaceFilter(linearSpaceFilter: CIFilter); cdecl;
    function linearSpaceFilter: CIFilter; cdecl;
    function previewImage: CIImage; cdecl;
    function portraitEffectsMatte: CIImage; cdecl;
    function semanticSegmentationSkinMatte: CIImage; cdecl;
    function semanticSegmentationHairMatte: CIImage; cdecl;
    function semanticSegmentationGlassesMatte: CIImage; cdecl;
    function semanticSegmentationSkyMatte: CIImage; cdecl;
    function semanticSegmentationTeethMatte: CIImage; cdecl;
  end;

  TCIRAWFilter = class(TOCGenericImport<CIRAWFilterClass, CIRAWFilter>)
  end;

  PCIRAWFilter = Pointer;

  CIRenderDestinationClass = interface(NSObjectClass)
    ['{59893AC7-A512-4CDB-8DC7-2E0E59AD4653}']
  end;

  CIRenderDestination = interface(NSObject)
    ['{D9275388-B517-4902-81F9-15B8B2BDDBB1}']
    function initWithPixelBuffer(pixelBuffer: CVPixelBufferRef)
      : Pointer { instancetype }; cdecl;
    function initWithIOSurface(surface: IOSurface)
      : Pointer { instancetype }; cdecl;
    function initWithMTLTexture(texture: Pointer; commandBuffer: Pointer)
      : Pointer { instancetype }; cdecl;
    function initWithWidth(width: NSUInteger; height: NSUInteger;
      pixelFormat: MTLPixelFormat; commandBuffer: Pointer;
      mtlTextureProvider: TCoreImageMtlTextureProvider)
      : Pointer { instancetype }; cdecl;
    function initWithGLTexture(texture: Cardinal; target: Cardinal;
      width: NSUInteger; height: NSUInteger): Pointer { instancetype }; cdecl;
    function initWithBitmapData(data: Pointer; width: NSUInteger;
      height: NSUInteger; bytesPerRow: NSUInteger; format: CIFormat)
      : Pointer { instancetype }; cdecl;
    function width: NSUInteger; cdecl;
    function height: NSUInteger; cdecl;
    procedure setAlphaMode(alphaMode: CIRenderDestinationAlphaMode); cdecl;
    function alphaMode: CIRenderDestinationAlphaMode; cdecl;
    procedure setFlipped(flipped: Boolean); cdecl;
    function isFlipped: Boolean; cdecl;
    procedure setDithered(dithered: Boolean); cdecl;
    function isDithered: Boolean; cdecl;
    procedure setClamped(clamped: Boolean); cdecl;
    function isClamped: Boolean; cdecl;
    procedure setColorSpace(colorSpace: CGColorSpaceRef); cdecl;
    function colorSpace: CGColorSpaceRef; cdecl;
    procedure setBlendKernel(blendKernel: CIBlendKernel); cdecl;
    function blendKernel: CIBlendKernel; cdecl;
    procedure setBlendsInDestinationColorSpace(blendsInDestinationColorSpace
      : Boolean); cdecl;
    function blendsInDestinationColorSpace: Boolean; cdecl;
  end;

  TCIRenderDestination = class(TOCGenericImport<CIRenderDestinationClass,
    CIRenderDestination>)
  end;

  PCIRenderDestination = Pointer;

  CIRenderInfoClass = interface(NSObjectClass)
    ['{E7AE4CBD-99B0-458E-B5CF-4C6FAF5B0E4D}']
  end;

  CIRenderInfo = interface(NSObject)
    ['{B663DC7E-545B-4282-9EA8-212DA1A098BE}']
    function kernelExecutionTime: NSTimeInterval; cdecl;
    function passCount: NSInteger; cdecl;
    function pixelsProcessed: NSInteger; cdecl;
  end;

  TCIRenderInfo = class(TOCGenericImport<CIRenderInfoClass, CIRenderInfo>)
  end;

  PCIRenderInfo = Pointer;

  CIRenderTaskClass = interface(NSObjectClass)
    ['{75775604-61FA-4B6E-B402-9391A829C245}']
  end;

  CIRenderTask = interface(NSObject)
    ['{167500DB-30D0-4611-899F-BAAAC55FE06C}']
    function waitUntilCompletedAndReturnError(error: NSError)
      : CIRenderInfo; cdecl;
  end;

  TCIRenderTask = class(TOCGenericImport<CIRenderTaskClass, CIRenderTask>)
  end;

  PCIRenderTask = Pointer;

  CISamplerClass = interface(NSObjectClass)
    ['{1FCC7523-B294-4F04-BAE9-DEDBCAF84398}']
    [MethodName('samplerWithImage:')]
    { class } function samplerWithImage(im: CIImage)
      : Pointer { instancetype }; cdecl;
    [MethodName('samplerWithImage:keysAndValues:')]
    { class } function samplerWithImageKeysAndValues(im: CIImage;
      keysAndValues: Pointer): Pointer { instancetype }; cdecl;
    [MethodName('samplerWithImage:options:')]
    { class } function samplerWithImageOptions(im: CIImage;
      options: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  CISampler = interface(NSObject)
    ['{D3ED7038-40F8-426A-8352-932B5721A6ED}']
    [MethodName('initWithImage:')]
    function initWithImage(im: CIImage): Pointer { instancetype }; cdecl;
    [MethodName('initWithImage:keysAndValues:')]
    function initWithImageKeysAndValues(im: CIImage; keysAndValues: Pointer)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithImage:options:')]
    function initWithImageOptions(im: CIImage; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function definition: CIFilterShape; cdecl;
    function extent: CGRect; cdecl;
  end;

  TCISampler = class(TOCGenericImport<CISamplerClass, CISampler>)
  end;

  PCISampler = Pointer;

  // ===== Protocol declarations =====

  MTLCommandBuffer = interface(IObjectiveC)
    ['{B9A09975-3D86-4F0F-8B83-3B9196FBAB63}']
  end;

  MTLCommandQueue = interface(IObjectiveC)
    ['{14B22376-CA4F-4506-B9EA-A292CD7162C1}']
  end;

  CIFilterConstructor = interface(IObjectiveC)
    ['{37022F3D-D765-4142-9DF2-FFDF434B7AD1}']
    function filterWithName(name: NSString): CIFilter; cdecl;
  end;

  CIGaussianGradient = interface(IObjectiveC)
    ['{F3CCAFE7-9AFC-47AB-BD5D-ABAB9F0C9DBB}']
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setColor0(color0: CIColor); cdecl;
    function color0: CIColor; cdecl;
    procedure setColor1(color1: CIColor); cdecl;
    function color1: CIColor; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIHueSaturationValueGradient = interface(IObjectiveC)
    ['{8D38BF46-312A-4900-BD36-68197F4654C7}']
    procedure setValue(value: Single); cdecl;
    function value: Single; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setSoftness(softness: Single); cdecl;
    function softness: Single; cdecl;
    procedure setDither(dither: Single); cdecl;
    function dither: Single; cdecl;
    procedure setColorSpace(colorSpace: CGColorSpaceRef); cdecl;
    function colorSpace: CGColorSpaceRef; cdecl;
  end;

  CILinearGradient = interface(IObjectiveC)
    ['{E4F139A9-D669-4E82-8BE6-A235F115C56D}']
    procedure setPoint0(point0: CGPoint); cdecl;
    function point0: CGPoint; cdecl;
    procedure setPoint1(point1: CGPoint); cdecl;
    function point1: CGPoint; cdecl;
    procedure setColor0(color0: CIColor); cdecl;
    function color0: CIColor; cdecl;
    procedure setColor1(color1: CIColor); cdecl;
    function color1: CIColor; cdecl;
  end;

  CIRadialGradient = interface(IObjectiveC)
    ['{A76CE5C7-AA76-4E39-A726-C9511D614891}']
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setRadius0(radius0: Single); cdecl;
    function radius0: Single; cdecl;
    procedure setRadius1(radius1: Single); cdecl;
    function radius1: Single; cdecl;
    procedure setColor0(color0: CIColor); cdecl;
    function color0: CIColor; cdecl;
    procedure setColor1(color1: CIColor); cdecl;
    function color1: CIColor; cdecl;
  end;

  CISmoothLinearGradient = interface(IObjectiveC)
    ['{11788D73-001B-483E-AB08-AAF2982D119B}']
    procedure setPoint0(point0: CGPoint); cdecl;
    function point0: CGPoint; cdecl;
    procedure setPoint1(point1: CGPoint); cdecl;
    function point1: CGPoint; cdecl;
    procedure setColor0(color0: CIColor); cdecl;
    function color0: CIColor; cdecl;
    procedure setColor1(color1: CIColor); cdecl;
    function color1: CIColor; cdecl;
  end;

  CISharpenLuminance = interface(IObjectiveC)
    ['{D6ADF2EE-83E5-4789-B0C7-5B7F430D664D}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setSharpness(sharpness: Single); cdecl;
    function sharpness: Single; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIUnsharpMask = interface(IObjectiveC)
    ['{46B96896-74AA-467D-B9AE-06B370ACE9A3}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setIntensity(intensity: Single); cdecl;
    function intensity: Single; cdecl;
  end;

  CICircularScreen = interface(IObjectiveC)
    ['{0623E6BB-7607-4BE6-962B-C2D1D4232DD3}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setSharpness(sharpness: Single); cdecl;
    function sharpness: Single; cdecl;
  end;

  CICMYKHalftone = interface(IObjectiveC)
    ['{27E18C46-6E3C-418B-A96B-E23540142241}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setSharpness(sharpness: Single); cdecl;
    function sharpness: Single; cdecl;
    procedure setGrayComponentReplacement(grayComponentReplacement
      : Single); cdecl;
    function grayComponentReplacement: Single; cdecl;
    procedure setUnderColorRemoval(underColorRemoval: Single); cdecl;
    function underColorRemoval: Single; cdecl;
  end;

  CIDotScreen = interface(IObjectiveC)
    ['{E44ACF19-40A8-4174-AC3A-817C264F85C3}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setSharpness(sharpness: Single); cdecl;
    function sharpness: Single; cdecl;
  end;

  CIHatchedScreen = interface(IObjectiveC)
    ['{500862AD-2F77-49C6-BAAD-330C3BE6AA5E}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setSharpness(sharpness: Single); cdecl;
    function sharpness: Single; cdecl;
  end;

  CILineScreen = interface(IObjectiveC)
    ['{2E844980-E9DA-4672-8859-7017542384B8}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setSharpness(sharpness: Single); cdecl;
    function sharpness: Single; cdecl;
  end;

  CIFourCoordinateGeometryFilter = interface(IObjectiveC)
    ['{75AE2A6E-B1D3-4155-A103-9708C467B950}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setTopLeft(topLeft: CGPoint); cdecl;
    function topLeft: CGPoint; cdecl;
    procedure setTopRight(topRight: CGPoint); cdecl;
    function topRight: CGPoint; cdecl;
    procedure setBottomRight(bottomRight: CGPoint); cdecl;
    function bottomRight: CGPoint; cdecl;
    procedure setBottomLeft(bottomLeft: CGPoint); cdecl;
    function bottomLeft: CGPoint; cdecl;
  end;

  CIBicubicScaleTransform = interface(IObjectiveC)
    ['{9A956B6F-B9A3-4937-AD8C-45900FCF029B}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
    procedure setAspectRatio(aspectRatio: Single); cdecl;
    function aspectRatio: Single; cdecl;
    procedure setParameterB(parameterB: Single); cdecl;
    function parameterB: Single; cdecl;
    procedure setParameterC(parameterC: Single); cdecl;
    function parameterC: Single; cdecl;
  end;

  CIEdgePreserveUpsample = interface(IObjectiveC)
    ['{3B61E343-AF83-4963-9BB3-1A927FCB9F70}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setSmallImage(smallImage: CIImage); cdecl;
    function smallImage: CIImage; cdecl;
    procedure setSpatialSigma(spatialSigma: Single); cdecl;
    function spatialSigma: Single; cdecl;
    procedure setLumaSigma(lumaSigma: Single); cdecl;
    function lumaSigma: Single; cdecl;
  end;

  CIKeystoneCorrectionCombined = interface(IObjectiveC)
    ['{62F5B28A-33EA-41B8-9D53-65C32B0C743C}']
    procedure setFocalLength(focalLength: Single); cdecl;
    function focalLength: Single; cdecl;
  end;

  CIKeystoneCorrectionHorizontal = interface(IObjectiveC)
    ['{EF121A4D-E8D0-40E3-BF22-AEF56464A2A1}']
    procedure setFocalLength(focalLength: Single); cdecl;
    function focalLength: Single; cdecl;
  end;

  CIKeystoneCorrectionVertical = interface(IObjectiveC)
    ['{8936CC7D-7192-4F09-A511-F02A67037506}']
    procedure setFocalLength(focalLength: Single); cdecl;
    function focalLength: Single; cdecl;
  end;

  CILanczosScaleTransform = interface(IObjectiveC)
    ['{BBE55A86-85E2-434F-A2D6-0733F06E2C76}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
    procedure setAspectRatio(aspectRatio: Single); cdecl;
    function aspectRatio: Single; cdecl;
  end;

  CIPerspectiveCorrection = interface(IObjectiveC)
    ['{A215114A-54A0-45EC-A6F4-EAA1B7DFA252}']
    procedure setCrop(crop: Integer); cdecl;
    function crop: Integer; cdecl;
  end;

  CIPerspectiveRotate = interface(IObjectiveC)
    ['{637A4B78-AA34-4E2B-A8D9-E5E38A7E3005}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setFocalLength(focalLength: Single); cdecl;
    function focalLength: Single; cdecl;
    procedure setPitch(pitch: Single); cdecl;
    function pitch: Single; cdecl;
    procedure setYaw(yaw: Single); cdecl;
    function yaw: Single; cdecl;
    procedure setRoll(roll: Single); cdecl;
    function roll: Single; cdecl;
  end;

  CIPerspectiveTransform = interface(IObjectiveC)
    ['{176EDE23-2820-4EE8-8FF4-80E03AD315CD}']
  end;

  CIPerspectiveTransformWithExtent = interface(IObjectiveC)
    ['{12AEBF22-334A-4C50-A91F-2380C85500C8}']
    procedure setExtent(extent: CGRect); cdecl;
    function extent: CGRect; cdecl;
  end;

  CIStraighten = interface(IObjectiveC)
    ['{1E345301-E3DA-4288-9EA2-5EAE5E869A52}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
  end;

  CITransitionFilter = interface(IObjectiveC)
    ['{A607D57B-F350-4124-BA0E-74C7B7C0245E}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setTargetImage(targetImage: CIImage); cdecl;
    function targetImage: CIImage; cdecl;
    procedure setTime(time: Single); cdecl;
    function time: Single; cdecl;
  end;

  CIAccordionFoldTransition = interface(IObjectiveC)
    ['{C60F9B6D-BAD5-4D8F-AFAB-8EA19445437B}']
    procedure setBottomHeight(bottomHeight: Single); cdecl;
    function bottomHeight: Single; cdecl;
    procedure setNumberOfFolds(numberOfFolds: Single); cdecl;
    function numberOfFolds: Single; cdecl;
    procedure setFoldShadowAmount(foldShadowAmount: Single); cdecl;
    function foldShadowAmount: Single; cdecl;
  end;

  CIBarsSwipeTransition = interface(IObjectiveC)
    ['{5EDE7868-C817-47CE-8B1A-182E6013FD37}']
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setBarOffset(barOffset: Single); cdecl;
    function barOffset: Single; cdecl;
  end;

  CICopyMachineTransition = interface(IObjectiveC)
    ['{96B2FFD6-1765-47A7-945A-AB66E08E1B41}']
    procedure setExtent(extent: CGRect); cdecl;
    function extent: CGRect; cdecl;
    procedure setColor(color: CIColor); cdecl;
    function color: CIColor; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setOpacity(opacity: Single); cdecl;
    function opacity: Single; cdecl;
  end;

  CIDisintegrateWithMaskTransition = interface(IObjectiveC)
    ['{7783B305-28D5-4ED4-AF61-1B0A021EB1E5}']
    procedure setMaskImage(maskImage: CIImage); cdecl;
    function maskImage: CIImage; cdecl;
    procedure setShadowRadius(shadowRadius: Single); cdecl;
    function shadowRadius: Single; cdecl;
    procedure setShadowDensity(shadowDensity: Single); cdecl;
    function shadowDensity: Single; cdecl;
    procedure setShadowOffset(shadowOffset: CGPoint); cdecl;
    function shadowOffset: CGPoint; cdecl;
  end;

  CIDissolveTransition = interface(IObjectiveC)
    ['{F4183D96-47F6-4344-986B-591D0664322A}']
  end;

  CIFlashTransition = interface(IObjectiveC)
    ['{E053FCFF-2553-444F-A13F-132F07FBE622}']
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setExtent(extent: CGRect); cdecl;
    function extent: CGRect; cdecl;
    procedure setColor(color: CIColor); cdecl;
    function color: CIColor; cdecl;
    procedure setMaxStriationRadius(maxStriationRadius: Single); cdecl;
    function maxStriationRadius: Single; cdecl;
    procedure setStriationStrength(striationStrength: Single); cdecl;
    function striationStrength: Single; cdecl;
    procedure setStriationContrast(striationContrast: Single); cdecl;
    function striationContrast: Single; cdecl;
    procedure setFadeThreshold(fadeThreshold: Single); cdecl;
    function fadeThreshold: Single; cdecl;
  end;

  CIModTransition = interface(IObjectiveC)
    ['{C61AE6BA-2A72-4F31-9E9D-736F2E8AB022}']
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setCompression(compression: Single); cdecl;
    function compression: Single; cdecl;
  end;

  CIPageCurlTransition = interface(IObjectiveC)
    ['{D0EFB62A-95A7-4E39-A45F-0BE678A98029}']
    procedure setBacksideImage(backsideImage: CIImage); cdecl;
    function backsideImage: CIImage; cdecl;
    procedure setShadingImage(shadingImage: CIImage); cdecl;
    function shadingImage: CIImage; cdecl;
    procedure setExtent(extent: CGRect); cdecl;
    function extent: CGRect; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIPageCurlWithShadowTransition = interface(IObjectiveC)
    ['{9861374A-8088-436A-A4E5-DE72D80EC0E8}']
    procedure setBacksideImage(backsideImage: CIImage); cdecl;
    function backsideImage: CIImage; cdecl;
    procedure setExtent(extent: CGRect); cdecl;
    function extent: CGRect; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setShadowSize(shadowSize: Single); cdecl;
    function shadowSize: Single; cdecl;
    procedure setShadowAmount(shadowAmount: Single); cdecl;
    function shadowAmount: Single; cdecl;
    procedure setShadowExtent(shadowExtent: CGRect); cdecl;
    function shadowExtent: CGRect; cdecl;
  end;

  CIRippleTransition = interface(IObjectiveC)
    ['{A4DE2B7C-3266-4F01-B76E-9C59FC23A83E}']
    procedure setShadingImage(shadingImage: CIImage); cdecl;
    function shadingImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setExtent(extent: CGRect); cdecl;
    function extent: CGRect; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
  end;

  CISwipeTransition = interface(IObjectiveC)
    ['{F99E6B8E-2476-44F7-BB19-9B6E366277CF}']
    procedure setExtent(extent: CGRect); cdecl;
    function extent: CGRect; cdecl;
    procedure setColor(color: CIColor); cdecl;
    function color: CIColor; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setOpacity(opacity: Single); cdecl;
    function opacity: Single; cdecl;
  end;

  CICompositeOperation = interface(IObjectiveC)
    ['{0502FF50-2F50-481B-84ED-CE570D1C51BB}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setBackgroundImage(backgroundImage: CIImage); cdecl;
    function backgroundImage: CIImage; cdecl;
  end;

  CIColorAbsoluteDifference = interface(IObjectiveC)
    ['{1DE55B58-316B-4D57-9277-663DA666CC85}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setInputImage2(inputImage2: CIImage); cdecl;
    function inputImage2: CIImage; cdecl;
  end;

  CIColorClamp = interface(IObjectiveC)
    ['{03D4BFB6-A2CA-4DFE-AD49-08F4DA471BC5}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setMinComponents(minComponents: CIVector); cdecl;
    function minComponents: CIVector; cdecl;
    procedure setMaxComponents(maxComponents: CIVector); cdecl;
    function maxComponents: CIVector; cdecl;
  end;

  CIColorControls = interface(IObjectiveC)
    ['{2A98C1B4-4110-41D4-A188-1A0207F3EDB8}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setSaturation(saturation: Single); cdecl;
    function saturation: Single; cdecl;
    procedure setBrightness(brightness: Single); cdecl;
    function brightness: Single; cdecl;
    procedure setContrast(contrast: Single); cdecl;
    function contrast: Single; cdecl;
  end;

  CIColorMatrix = interface(IObjectiveC)
    ['{0D8EC7A3-8B91-4AED-B97C-3B70C276AFDE}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRVector(RVector: CIVector); cdecl;
    function RVector: CIVector; cdecl;
    procedure setGVector(GVector: CIVector); cdecl;
    function GVector: CIVector; cdecl;
    procedure setBVector(BVector: CIVector); cdecl;
    function BVector: CIVector; cdecl;
    procedure setAVector(AVector: CIVector); cdecl;
    function AVector: CIVector; cdecl;
    procedure setBiasVector(biasVector: CIVector); cdecl;
    function biasVector: CIVector; cdecl;
  end;

  CIColorPolynomial = interface(IObjectiveC)
    ['{69FCEA50-3CBC-426B-98C7-5E4CD8FDC27B}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRedCoefficients(redCoefficients: CIVector); cdecl;
    function redCoefficients: CIVector; cdecl;
    procedure setGreenCoefficients(greenCoefficients: CIVector); cdecl;
    function greenCoefficients: CIVector; cdecl;
    procedure setBlueCoefficients(blueCoefficients: CIVector); cdecl;
    function blueCoefficients: CIVector; cdecl;
    procedure setAlphaCoefficients(alphaCoefficients: CIVector); cdecl;
    function alphaCoefficients: CIVector; cdecl;
  end;

  CIColorThreshold = interface(IObjectiveC)
    ['{C9834129-F045-416D-B207-85A014E1D4EE}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setThreshold(threshold: Single); cdecl;
    function threshold: Single; cdecl;
  end;

  CIColorThresholdOtsu = interface(IObjectiveC)
    ['{39C8DBCD-3D1F-40F8-8A25-966383BBBA7C}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CIDepthToDisparity = interface(IObjectiveC)
    ['{5A53023A-83A6-4EBC-8B96-18E177723CFA}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CIDisparityToDepth = interface(IObjectiveC)
    ['{A4A49BDD-FB0D-48E7-B948-9550A68453EF}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CIExposureAdjust = interface(IObjectiveC)
    ['{C946886E-2F79-4FEF-AC7D-3C64D8D80DD9}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setEV(EV: Single); cdecl;
    function EV: Single; cdecl;
  end;

  CIGammaAdjust = interface(IObjectiveC)
    ['{890405D3-1CB2-4542-9232-4581BD1D6B63}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setPower(power: Single); cdecl;
    function power: Single; cdecl;
  end;

  CIHueAdjust = interface(IObjectiveC)
    ['{83093D9B-2BCB-4746-9420-E1A1EC281568}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
  end;

  CILinearToSRGBToneCurve = interface(IObjectiveC)
    ['{EF59D452-9B4B-4B73-8A1B-EE6EA4109DB2}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CISRGBToneCurveToLinear = interface(IObjectiveC)
    ['{5D3B3AF3-E9A1-4A9E-9A26-6E1A3BD2DBFB}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CITemperatureAndTint = interface(IObjectiveC)
    ['{C7E1A634-C01E-4510-84E5-A464C8E3C7FF}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setNeutral(neutral: CIVector); cdecl;
    function neutral: CIVector; cdecl;
    procedure setTargetNeutral(targetNeutral: CIVector); cdecl;
    function targetNeutral: CIVector; cdecl;
  end;

  CIToneCurve = interface(IObjectiveC)
    ['{5FDF6E7F-70EB-4B17-A9F0-18B2B45AAFB3}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setPoint0(point0: CGPoint); cdecl;
    function point0: CGPoint; cdecl;
    procedure setPoint1(point1: CGPoint); cdecl;
    function point1: CGPoint; cdecl;
    procedure setPoint2(point2: CGPoint); cdecl;
    function point2: CGPoint; cdecl;
    procedure setPoint3(point3: CGPoint); cdecl;
    function point3: CGPoint; cdecl;
    procedure setPoint4(point4: CGPoint); cdecl;
    function point4: CGPoint; cdecl;
  end;

  CIVibrance = interface(IObjectiveC)
    ['{1C2BC9A4-3720-445D-A89A-8CB8CD7AF11E}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setAmount(amount: Single); cdecl;
    function amount: Single; cdecl;
  end;

  CIWhitePointAdjust = interface(IObjectiveC)
    ['{7A77A3BF-8108-4479-8121-9F49CCC5234E}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setColor(color: CIColor); cdecl;
    function color: CIColor; cdecl;
  end;

  CIColorCrossPolynomial = interface(IObjectiveC)
    ['{E47FD2A2-ED5B-4166-876F-4DF13EAF39E6}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRedCoefficients(redCoefficients: CIVector); cdecl;
    function redCoefficients: CIVector; cdecl;
    procedure setGreenCoefficients(greenCoefficients: CIVector); cdecl;
    function greenCoefficients: CIVector; cdecl;
    procedure setBlueCoefficients(blueCoefficients: CIVector); cdecl;
    function blueCoefficients: CIVector; cdecl;
  end;

  CIColorCube = interface(IObjectiveC)
    ['{12341D66-F49F-4D7C-BE3A-72F305494DF9}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCubeDimension(cubeDimension: Single); cdecl;
    function cubeDimension: Single; cdecl;
    procedure setCubeData(cubeData: NSData); cdecl;
    function cubeData: NSData; cdecl;
    procedure setExtrapolate(extrapolate: Integer); cdecl;
    function extrapolate: Integer; cdecl;
  end;

  CIColorCubesMixedWithMask = interface(IObjectiveC)
    ['{173AA708-4371-4BB5-B5CC-0258DBA17E63}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setMaskImage(maskImage: CIImage); cdecl;
    function maskImage: CIImage; cdecl;
    procedure setCubeDimension(cubeDimension: Single); cdecl;
    function cubeDimension: Single; cdecl;
    procedure setCube0Data(cube0Data: NSData); cdecl;
    function cube0Data: NSData; cdecl;
    procedure setCube1Data(cube1Data: NSData); cdecl;
    function cube1Data: NSData; cdecl;
    procedure setColorSpace(colorSpace: CGColorSpaceRef); cdecl;
    function colorSpace: CGColorSpaceRef; cdecl;
    procedure setExtrapolate(extrapolate: Integer); cdecl;
    function extrapolate: Integer; cdecl;
  end;

  CIColorCubeWithColorSpace = interface(IObjectiveC)
    ['{25F9ADB2-4691-452F-BFE8-2E50750A917D}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCubeDimension(cubeDimension: Single); cdecl;
    function cubeDimension: Single; cdecl;
    procedure setCubeData(cubeData: NSData); cdecl;
    function cubeData: NSData; cdecl;
    procedure setColorSpace(colorSpace: CGColorSpaceRef); cdecl;
    function colorSpace: CGColorSpaceRef; cdecl;
    procedure setExtrapolate(extrapolate: Integer); cdecl;
    function extrapolate: Integer; cdecl;
  end;

  CIColorCurves = interface(IObjectiveC)
    ['{73B7C37C-7820-4378-8059-55D1BABB2B62}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCurvesData(curvesData: NSData); cdecl;
    function curvesData: NSData; cdecl;
    procedure setCurvesDomain(curvesDomain: CIVector); cdecl;
    function curvesDomain: CIVector; cdecl;
    procedure setColorSpace(colorSpace: CGColorSpaceRef); cdecl;
    function colorSpace: CGColorSpaceRef; cdecl;
  end;

  CIColorInvert = interface(IObjectiveC)
    ['{C7EB38B5-1410-404C-9C76-D0F2B5352F5C}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CIColorMap = interface(IObjectiveC)
    ['{8CD23BE6-6027-47DA-A0F5-1141A09514CC}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setGradientImage(gradientImage: CIImage); cdecl;
    function gradientImage: CIImage; cdecl;
  end;

  CIColorMonochrome = interface(IObjectiveC)
    ['{15365358-50B8-4BBA-B586-C7547A64637B}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setColor(color: CIColor); cdecl;
    function color: CIColor; cdecl;
    procedure setIntensity(intensity: Single); cdecl;
    function intensity: Single; cdecl;
  end;

  CIColorPosterize = interface(IObjectiveC)
    ['{2A8EC5B8-77B2-4A95-9D6F-0575DBFCB01A}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setLevels(levels: Single); cdecl;
    function levels: Single; cdecl;
  end;

  CIConvertLab = interface(IObjectiveC)
    ['{B7562B4C-B63C-49AE-B981-102A906BF0C5}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setNormalize(normalize: Integer); cdecl;
    function normalize: Integer; cdecl;
  end;

  CIDither = interface(IObjectiveC)
    ['{BACCDDFC-B42B-4971-8CB1-24C9AE80C02D}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setIntensity(intensity: Single); cdecl;
    function intensity: Single; cdecl;
  end;

  CIDocumentEnhancer = interface(IObjectiveC)
    ['{D8DDCA38-20B3-4EAA-87F0-F5EB9530ED18}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setAmount(amount: Single); cdecl;
    function amount: Single; cdecl;
  end;

  CIFalseColor = interface(IObjectiveC)
    ['{BC221D5B-343C-4764-8061-72EF25BAACB4}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setColor0(color0: CIColor); cdecl;
    function color0: CIColor; cdecl;
    procedure setColor1(color1: CIColor); cdecl;
    function color1: CIColor; cdecl;
  end;

  CILabDeltaE = interface(IObjectiveC)
    ['{EA4FE170-522F-47FB-9078-74BEF960812A}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setImage2(image2: CIImage); cdecl;
    function image2: CIImage; cdecl;
  end;

  CIMaskToAlpha = interface(IObjectiveC)
    ['{01F9CBD0-8037-43E6-8CD3-7C7BAF07F18D}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CIMaximumComponent = interface(IObjectiveC)
    ['{045D145F-2056-4678-85D4-4F630F492145}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CIMinimumComponent = interface(IObjectiveC)
    ['{0DD2C09F-AF9C-451A-9241-F4D74BF4ABCA}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CIPaletteCentroid = interface(IObjectiveC)
    ['{A2E038F5-06FD-4174-84DE-CA29CDCFB2FC}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setPaletteImage(paletteImage: CIImage); cdecl;
    function paletteImage: CIImage; cdecl;
    procedure setPerceptual(perceptual: Integer); cdecl;
    function perceptual: Integer; cdecl;
  end;

  CIPalettize = interface(IObjectiveC)
    ['{D88D7D0F-FE59-4444-834B-79AE6702A2E5}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setPaletteImage(paletteImage: CIImage); cdecl;
    function paletteImage: CIImage; cdecl;
    procedure setPerceptual(perceptual: Integer); cdecl;
    function perceptual: Integer; cdecl;
  end;

  CIPhotoEffect = interface(IObjectiveC)
    ['{AB0B7A27-DCFA-4F30-AA65-D76D4D2C1796}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CISepiaTone = interface(IObjectiveC)
    ['{3EBE2274-4C03-43C2-B70E-5E5167904B26}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setIntensity(intensity: Single); cdecl;
    function intensity: Single; cdecl;
  end;

  CIThermal = interface(IObjectiveC)
    ['{9AF15B6D-F29E-4FF4-BE97-AF35F389155B}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CIVignette = interface(IObjectiveC)
    ['{ABC6C38C-72B2-45A1-AB16-8DDCD2C5D849}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setIntensity(intensity: Single); cdecl;
    function intensity: Single; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIVignetteEffect = interface(IObjectiveC)
    ['{9431EE1C-2CD8-4948-AD66-C69C5D65F040}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setIntensity(intensity: Single); cdecl;
    function intensity: Single; cdecl;
    procedure setFalloff(falloff: Single); cdecl;
    function falloff: Single; cdecl;
  end;

  CIXRay = interface(IObjectiveC)
    ['{41054E81-2BEF-4A9B-95F8-EB55F6DA2B69}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CIBumpDistortion = interface(IObjectiveC)
    ['{3EE0A212-37DA-4300-A7CC-ECA28565D97D}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
  end;

  CIBumpDistortionLinear = interface(IObjectiveC)
    ['{73EB6FC1-16CF-41F2-B442-567D9E200BA0}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
  end;

  CICircleSplashDistortion = interface(IObjectiveC)
    ['{E71A539D-773E-4CB4-AC49-9D97BAB227F4}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CICircularWrap = interface(IObjectiveC)
    ['{08DB4B38-E345-4FF4-852D-CD4375531B32}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
  end;

  CIDisplacementDistortion = interface(IObjectiveC)
    ['{A99EB883-0613-49EB-9BDD-7AB3F7AEDB17}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setDisplacementImage(displacementImage: CIImage); cdecl;
    function displacementImage: CIImage; cdecl;
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
  end;

  CIDroste = interface(IObjectiveC)
    ['{AD333BB9-CCEE-43F7-874E-94A07ECFC46B}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setInsetPoint0(insetPoint0: CGPoint); cdecl;
    function insetPoint0: CGPoint; cdecl;
    procedure setInsetPoint1(insetPoint1: CGPoint); cdecl;
    function insetPoint1: CGPoint; cdecl;
    procedure setStrands(strands: Single); cdecl;
    function strands: Single; cdecl;
    procedure setPeriodicity(periodicity: Single); cdecl;
    function periodicity: Single; cdecl;
    procedure setRotation(rotation: Single); cdecl;
    function rotation: Single; cdecl;
    procedure setZoom(zoom: Single); cdecl;
    function zoom: Single; cdecl;
  end;

  CIGlassDistortion = interface(IObjectiveC)
    ['{06F1FFD7-4789-4FFD-8730-14DF88A084B2}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setTextureImage(textureImage: CIImage); cdecl;
    function textureImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
  end;

  CIGlassLozenge = interface(IObjectiveC)
    ['{AEC53F15-3E04-4B6F-8DAE-EB64DCCD0A7A}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setPoint0(point0: CGPoint); cdecl;
    function point0: CGPoint; cdecl;
    procedure setPoint1(point1: CGPoint); cdecl;
    function point1: CGPoint; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setRefraction(refraction: Single); cdecl;
    function refraction: Single; cdecl;
  end;

  CIHoleDistortion = interface(IObjectiveC)
    ['{7093DA9E-380F-4295-A9BF-4D9F9AD0FF0E}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CILightTunnel = interface(IObjectiveC)
    ['{891559C4-7ED1-41D1-BC13-33E416CA2143}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setRotation(rotation: Single); cdecl;
    function rotation: Single; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CINinePartStretched = interface(IObjectiveC)
    ['{1C250342-C1D7-4FB0-9900-B873E6B91AAE}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setBreakpoint0(breakpoint0: CGPoint); cdecl;
    function breakpoint0: CGPoint; cdecl;
    procedure setBreakpoint1(breakpoint1: CGPoint); cdecl;
    function breakpoint1: CGPoint; cdecl;
    procedure setGrowAmount(growAmount: CGPoint); cdecl;
    function growAmount: CGPoint; cdecl;
  end;

  CINinePartTiled = interface(IObjectiveC)
    ['{A39C12A7-2FFA-46A9-8F66-3E4CF709E666}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setBreakpoint0(breakpoint0: CGPoint); cdecl;
    function breakpoint0: CGPoint; cdecl;
    procedure setBreakpoint1(breakpoint1: CGPoint); cdecl;
    function breakpoint1: CGPoint; cdecl;
    procedure setGrowAmount(growAmount: CGPoint); cdecl;
    function growAmount: CGPoint; cdecl;
    procedure setFlipYTiles(flipYTiles: Integer); cdecl;
    function flipYTiles: Integer; cdecl;
  end;

  CIPinchDistortion = interface(IObjectiveC)
    ['{E8E75BB5-1DE2-4B7A-AB62-B77F181DE441}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
  end;

  CIStretchCrop = interface(IObjectiveC)
    ['{A9303A5E-E196-4338-B08B-7F02D32A08B0}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setSize(size: CGPoint); cdecl;
    function size: CGPoint; cdecl;
    procedure setCropAmount(cropAmount: Single); cdecl;
    function cropAmount: Single; cdecl;
    procedure setCenterStretchAmount(centerStretchAmount: Single); cdecl;
    function centerStretchAmount: Single; cdecl;
  end;

  CITorusLensDistortion = interface(IObjectiveC)
    ['{65663CBF-DCE4-4B61-8E89-B95DD144B34B}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setRefraction(refraction: Single); cdecl;
    function refraction: Single; cdecl;
  end;

  CITwirlDistortion = interface(IObjectiveC)
    ['{59C9671A-BB83-434A-A27C-4E01E086A4A8}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
  end;

  CIVortexDistortion = interface(IObjectiveC)
    ['{336234C2-FA30-46AA-9162-B509B55BDE9B}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
  end;

  CIAffineClamp = interface(IObjectiveC)
    ['{F385BCC9-370F-4234-8176-E174C990A248}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setTransform(transform: CGAffineTransform); cdecl;
    function transform: CGAffineTransform; cdecl;
  end;

  CIAffineTile = interface(IObjectiveC)
    ['{E203D794-0B6B-4F8C-A037-9104AEB2CD0A}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setTransform(transform: CGAffineTransform); cdecl;
    function transform: CGAffineTransform; cdecl;
  end;

  CIEightfoldReflectedTile = interface(IObjectiveC)
    ['{B0CA513A-07D3-4112-88AC-F44E4A3EE767}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
  end;

  CIFourfoldReflectedTile = interface(IObjectiveC)
    ['{C04EECEB-5898-4B15-BC23-6C507FE38E08}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setAcuteAngle(acuteAngle: Single); cdecl;
    function acuteAngle: Single; cdecl;
  end;

  CIFourfoldRotatedTile = interface(IObjectiveC)
    ['{750924FD-CE8B-4622-9D54-531004F87C2F}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
  end;

  CIFourfoldTranslatedTile = interface(IObjectiveC)
    ['{3E4784E5-5549-4218-A899-C4AD8A097CDE}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setAcuteAngle(acuteAngle: Single); cdecl;
    function acuteAngle: Single; cdecl;
  end;

  CIGlideReflectedTile = interface(IObjectiveC)
    ['{45BC0890-1A87-4972-93E2-274D0EB921AA}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
  end;

  CIKaleidoscope = interface(IObjectiveC)
    ['{C27C424B-E6B6-44C8-ABB3-7F051AF79113}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCount(count: NSInteger); cdecl;
    function count: NSInteger; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
  end;

  CIOpTile = interface(IObjectiveC)
    ['{82D11733-07B0-4779-85F5-286F119B9F45}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
  end;

  CIParallelogramTile = interface(IObjectiveC)
    ['{9080658A-1CB1-460B-9845-5AE75988481E}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setAcuteAngle(acuteAngle: Single); cdecl;
    function acuteAngle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
  end;

  CIPerspectiveTile = interface(IObjectiveC)
    ['{006CFF82-6EAA-4546-A8CD-38C85BB26DD9}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setTopLeft(topLeft: CGPoint); cdecl;
    function topLeft: CGPoint; cdecl;
    procedure setTopRight(topRight: CGPoint); cdecl;
    function topRight: CGPoint; cdecl;
    procedure setBottomRight(bottomRight: CGPoint); cdecl;
    function bottomRight: CGPoint; cdecl;
    procedure setBottomLeft(bottomLeft: CGPoint); cdecl;
    function bottomLeft: CGPoint; cdecl;
  end;

  CISixfoldReflectedTile = interface(IObjectiveC)
    ['{A1E3C161-F9C8-4A86-A31B-CA023F8C005C}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
  end;

  CISixfoldRotatedTile = interface(IObjectiveC)
    ['{F0FF5111-EB8A-41E4-8AAF-A0088DB5E38F}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
  end;

  CITriangleKaleidoscope = interface(IObjectiveC)
    ['{B82913F1-F56B-4565-AFD6-ED396B2C898D}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setPoint(point: CGPoint); cdecl;
    function point: CGPoint; cdecl;
    procedure setSize(size: Single); cdecl;
    function size: Single; cdecl;
    procedure setRotation(rotation: Single); cdecl;
    function rotation: Single; cdecl;
    procedure setDecay(decay: Single); cdecl;
    function decay: Single; cdecl;
  end;

  CITriangleTile = interface(IObjectiveC)
    ['{E4FCFB04-D178-416E-9869-F7DE0304ED14}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
  end;

  CITwelvefoldReflectedTile = interface(IObjectiveC)
    ['{F9FBDE3D-54B7-4000-B234-287DD5F240B5}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
  end;

  CIAttributedTextImageGenerator = interface(IObjectiveC)
    ['{4CE7CA67-4BF7-4ED2-9E26-37FE3178D9E9}']
    procedure setText(text: NSAttributedString); cdecl;
    function text: NSAttributedString; cdecl;
    procedure setScaleFactor(scaleFactor: Single); cdecl;
    function scaleFactor: Single; cdecl;
    procedure setPadding(padding: Single); cdecl;
    function padding: Single; cdecl;
  end;

  CIAztecCodeGenerator = interface(IObjectiveC)
    ['{BB546984-9F40-4007-AC43-A3BAAD9E2389}']
    procedure setMessage(message: NSData); cdecl;
    function message: NSData; cdecl;
    procedure setCorrectionLevel(correctionLevel: Single); cdecl;
    function correctionLevel: Single; cdecl;
    procedure setLayers(layers: Single); cdecl;
    function layers: Single; cdecl;
    procedure setCompactStyle(compactStyle: Single); cdecl;
    function compactStyle: Single; cdecl;
  end;

  CIBarcodeGenerator = interface(IObjectiveC)
    ['{779FD3D5-7F6D-436B-BA74-B6D2BB2B6AA8}']
    procedure setBarcodeDescriptor(barcodeDescriptor
      : CIBarcodeDescriptor); cdecl;
    function barcodeDescriptor: CIBarcodeDescriptor; cdecl;
  end;

  CICheckerboardGenerator = interface(IObjectiveC)
    ['{1C6AC00A-172D-4227-BA26-ECD6498956A6}']
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setColor0(color0: CIColor); cdecl;
    function color0: CIColor; cdecl;
    procedure setColor1(color1: CIColor); cdecl;
    function color1: CIColor; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setSharpness(sharpness: Single); cdecl;
    function sharpness: Single; cdecl;
  end;

  CICode128BarcodeGenerator = interface(IObjectiveC)
    ['{B96F71F6-4C4A-4368-988E-CDC51EFC394C}']
    procedure setMessage(message: NSData); cdecl;
    function message: NSData; cdecl;
    procedure setQuietSpace(quietSpace: Single); cdecl;
    function quietSpace: Single; cdecl;
    procedure setBarcodeHeight(barcodeHeight: Single); cdecl;
    function barcodeHeight: Single; cdecl;
  end;

  CILenticularHaloGenerator = interface(IObjectiveC)
    ['{01ECB3EF-ADCA-4D68-B943-12E89F900064}']
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setColor(color: CIColor); cdecl;
    function color: CIColor; cdecl;
    procedure setHaloRadius(haloRadius: Single); cdecl;
    function haloRadius: Single; cdecl;
    procedure setHaloWidth(haloWidth: Single); cdecl;
    function haloWidth: Single; cdecl;
    procedure setHaloOverlap(haloOverlap: Single); cdecl;
    function haloOverlap: Single; cdecl;
    procedure setStriationStrength(striationStrength: Single); cdecl;
    function striationStrength: Single; cdecl;
    procedure setStriationContrast(striationContrast: Single); cdecl;
    function striationContrast: Single; cdecl;
    procedure setTime(time: Single); cdecl;
    function time: Single; cdecl;
  end;

  CIMeshGenerator = interface(IObjectiveC)
    ['{610ECC6C-7475-4D4A-B589-2E4EB05A2735}']
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setColor(color: CIColor); cdecl;
    function color: CIColor; cdecl;
    procedure setMesh(mesh: NSArray); cdecl;
    function mesh: NSArray; cdecl;
  end;

  CIPDF417BarcodeGenerator = interface(IObjectiveC)
    ['{38D1058D-EF20-4CF1-88EF-3E588264278A}']
    procedure setMessage(message: NSData); cdecl;
    function message: NSData; cdecl;
    procedure setMinWidth(minWidth: Single); cdecl;
    function minWidth: Single; cdecl;
    procedure setMaxWidth(maxWidth: Single); cdecl;
    function maxWidth: Single; cdecl;
    procedure setMinHeight(minHeight: Single); cdecl;
    function minHeight: Single; cdecl;
    procedure setMaxHeight(maxHeight: Single); cdecl;
    function maxHeight: Single; cdecl;
    procedure setDataColumns(dataColumns: Single); cdecl;
    function dataColumns: Single; cdecl;
    procedure setRows(rows: Single); cdecl;
    function rows: Single; cdecl;
    procedure setPreferredAspectRatio(preferredAspectRatio: Single); cdecl;
    function preferredAspectRatio: Single; cdecl;
    procedure setCompactionMode(compactionMode: Single); cdecl;
    function compactionMode: Single; cdecl;
    procedure setCompactStyle(compactStyle: Single); cdecl;
    function compactStyle: Single; cdecl;
    procedure setCorrectionLevel(correctionLevel: Single); cdecl;
    function correctionLevel: Single; cdecl;
    procedure setAlwaysSpecifyCompaction(alwaysSpecifyCompaction
      : Single); cdecl;
    function alwaysSpecifyCompaction: Single; cdecl;
  end;

  CIQRCodeGenerator = interface(IObjectiveC)
    ['{52C34A27-4402-4F05-AA7F-2258A6A07021}']
    procedure setMessage(message: NSData); cdecl;
    function message: NSData; cdecl;
    procedure setCorrectionLevel(correctionLevel: NSString); cdecl;
    function correctionLevel: NSString; cdecl;
  end;

  CIRandomGenerator = interface(IObjectiveC)
    ['{A563ABD3-0326-4718-A6F7-895CB5F257FC}']
  end;

  CIRoundedRectangleGenerator = interface(IObjectiveC)
    ['{0B4904BB-7B1E-492E-BDA2-1267C77A9577}']
    procedure setExtent(extent: CGRect); cdecl;
    function extent: CGRect; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setColor(color: CIColor); cdecl;
    function color: CIColor; cdecl;
  end;

  CIStarShineGenerator = interface(IObjectiveC)
    ['{2FE8A3AE-54A0-44EF-9A5F-7AA4E1AD4F1E}']
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setColor(color: CIColor); cdecl;
    function color: CIColor; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setCrossScale(crossScale: Single); cdecl;
    function crossScale: Single; cdecl;
    procedure setCrossAngle(crossAngle: Single); cdecl;
    function crossAngle: Single; cdecl;
    procedure setCrossOpacity(crossOpacity: Single); cdecl;
    function crossOpacity: Single; cdecl;
    procedure setCrossWidth(crossWidth: Single); cdecl;
    function crossWidth: Single; cdecl;
    procedure setEpsilon(epsilon: Single); cdecl;
    function epsilon: Single; cdecl;
  end;

  CIStripesGenerator = interface(IObjectiveC)
    ['{C195B12C-4E72-4927-A1B4-58AAC74DFE37}']
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setColor0(color0: CIColor); cdecl;
    function color0: CIColor; cdecl;
    procedure setColor1(color1: CIColor); cdecl;
    function color1: CIColor; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setSharpness(sharpness: Single); cdecl;
    function sharpness: Single; cdecl;
  end;

  CISunbeamsGenerator = interface(IObjectiveC)
    ['{E8401A38-7F47-4103-B171-E23F8A456826}']
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setColor(color: CIColor); cdecl;
    function color: CIColor; cdecl;
    procedure setSunRadius(sunRadius: Single); cdecl;
    function sunRadius: Single; cdecl;
    procedure setMaxStriationRadius(maxStriationRadius: Single); cdecl;
    function maxStriationRadius: Single; cdecl;
    procedure setStriationStrength(striationStrength: Single); cdecl;
    function striationStrength: Single; cdecl;
    procedure setStriationContrast(striationContrast: Single); cdecl;
    function striationContrast: Single; cdecl;
    procedure setTime(time: Single); cdecl;
    function time: Single; cdecl;
  end;

  CITextImageGenerator = interface(IObjectiveC)
    ['{480A95C2-12A4-45EE-8E8D-E43259B0E950}']
    procedure setText(text: NSString); cdecl;
    function text: NSString; cdecl;
    procedure setFontName(fontName: NSString); cdecl;
    function fontName: NSString; cdecl;
    procedure setFontSize(fontSize: Single); cdecl;
    function fontSize: Single; cdecl;
    procedure setScaleFactor(scaleFactor: Single); cdecl;
    function scaleFactor: Single; cdecl;
    procedure setPadding(padding: Single); cdecl;
    function padding: Single; cdecl;
  end;

  CIBlendWithMask = interface(IObjectiveC)
    ['{35151A01-E3E2-44CD-9E6E-B9770D743733}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setBackgroundImage(backgroundImage: CIImage); cdecl;
    function backgroundImage: CIImage; cdecl;
    procedure setMaskImage(maskImage: CIImage); cdecl;
    function maskImage: CIImage; cdecl;
  end;

  CIBloom = interface(IObjectiveC)
    ['{6EB0A17D-6FEC-4C46-B8B4-A90C39E4BDB6}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setIntensity(intensity: Single); cdecl;
    function intensity: Single; cdecl;
  end;

  CIComicEffect = interface(IObjectiveC)
    ['{9A283F38-DC45-49EB-A3E5-5EDDB10E06B0}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CIConvolution = interface(IObjectiveC)
    ['{AD62D48A-5B0F-4045-92B2-28FAF066EC29}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setWeights(weights: CIVector); cdecl;
    function weights: CIVector; cdecl;
    procedure setBias(bias: Single); cdecl;
    function bias: Single; cdecl;
  end;

  CICoreMLModel = interface(IObjectiveC)
    ['{74668C4F-3EBC-4FE9-852C-24017FB8B9C1}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setModel(model: MLModel); cdecl;
    function model: MLModel; cdecl;
    procedure setHeadIndex(headIndex: Single); cdecl;
    function headIndex: Single; cdecl;
    procedure setSoftmaxNormalization(softmaxNormalization: Integer); cdecl;
    function softmaxNormalization: Integer; cdecl;
  end;

  CICrystallize = interface(IObjectiveC)
    ['{1BAC88DC-A9FD-4B0F-A5AD-3F7390B79465}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
  end;

  CIDepthOfField = interface(IObjectiveC)
    ['{C889D777-1485-46C1-B079-9F0DBD771F24}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setPoint0(point0: CGPoint); cdecl;
    function point0: CGPoint; cdecl;
    procedure setPoint1(point1: CGPoint); cdecl;
    function point1: CGPoint; cdecl;
    procedure setSaturation(saturation: Single); cdecl;
    function saturation: Single; cdecl;
    procedure setUnsharpMaskRadius(unsharpMaskRadius: Single); cdecl;
    function unsharpMaskRadius: Single; cdecl;
    procedure setUnsharpMaskIntensity(unsharpMaskIntensity: Single); cdecl;
    function unsharpMaskIntensity: Single; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIEdges = interface(IObjectiveC)
    ['{D70E2FD6-C8E4-4700-9A62-96844C07AD7B}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setIntensity(intensity: Single); cdecl;
    function intensity: Single; cdecl;
  end;

  CIEdgeWork = interface(IObjectiveC)
    ['{A00F54B5-57D4-483A-B0DA-58DEF047B922}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIGaborGradients = interface(IObjectiveC)
    ['{7BE46489-4268-4425-B930-45C72561A999}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CIGloom = interface(IObjectiveC)
    ['{AD30E4B2-2800-4934-ADEB-EB64DBFE49CC}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setIntensity(intensity: Single); cdecl;
    function intensity: Single; cdecl;
  end;

  CIHeightFieldFromMask = interface(IObjectiveC)
    ['{64AC305F-030E-4D02-8170-FE64B85B6333}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIHexagonalPixellate = interface(IObjectiveC)
    ['{7617D996-96C2-4F84-B0EE-71A312DCA942}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
  end;

  CIHighlightShadowAdjust = interface(IObjectiveC)
    ['{E4818214-1B49-410D-B146-351EDE71D917}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setShadowAmount(shadowAmount: Single); cdecl;
    function shadowAmount: Single; cdecl;
    procedure setHighlightAmount(highlightAmount: Single); cdecl;
    function highlightAmount: Single; cdecl;
  end;

  CILineOverlay = interface(IObjectiveC)
    ['{76CDD132-C07F-4EC1-82F7-BD0781541725}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setNRNoiseLevel(NRNoiseLevel: Single); cdecl;
    function NRNoiseLevel: Single; cdecl;
    procedure setNRSharpness(NRSharpness: Single); cdecl;
    function NRSharpness: Single; cdecl;
    procedure setEdgeIntensity(edgeIntensity: Single); cdecl;
    function edgeIntensity: Single; cdecl;
    procedure setThreshold(threshold: Single); cdecl;
    function threshold: Single; cdecl;
    procedure setContrast(contrast: Single); cdecl;
    function contrast: Single; cdecl;
  end;

  CIMix = interface(IObjectiveC)
    ['{10032AE9-0578-4AA6-9C83-E2E16D69592F}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setBackgroundImage(backgroundImage: CIImage); cdecl;
    function backgroundImage: CIImage; cdecl;
    procedure setAmount(amount: Single); cdecl;
    function amount: Single; cdecl;
  end;

  CIPersonSegmentation = interface(IObjectiveC)
    ['{4A676B18-607B-4516-B608-E95807629BED}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setQualityLevel(qualityLevel: NSUInteger); cdecl;
    function qualityLevel: NSUInteger; cdecl;
  end;

  CIPixellate = interface(IObjectiveC)
    ['{D209EA87-C664-4CDA-8D85-4BA0A0674563}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
  end;

  CIPointillize = interface(IObjectiveC)
    ['{4081C443-1846-47BD-A4F6-5252245F5797}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
  end;

  CISaliencyMap = interface(IObjectiveC)
    ['{ACBB31F6-ABE0-4ABE-801E-B129407A4AA8}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CIShadedMaterial = interface(IObjectiveC)
    ['{72059D72-A7DC-4B68-8403-0D1CB3AFAFA8}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setShadingImage(shadingImage: CIImage); cdecl;
    function shadingImage: CIImage; cdecl;
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
  end;

  CISpotColor = interface(IObjectiveC)
    ['{96375906-5676-4F6E-BDA4-7B16BA5DCE32}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenterColor1(centerColor1: CIColor); cdecl;
    function centerColor1: CIColor; cdecl;
    procedure setReplacementColor1(replacementColor1: CIColor); cdecl;
    function replacementColor1: CIColor; cdecl;
    procedure setCloseness1(closeness1: Single); cdecl;
    function closeness1: Single; cdecl;
    procedure setContrast1(contrast1: Single); cdecl;
    function contrast1: Single; cdecl;
    procedure setCenterColor2(centerColor2: CIColor); cdecl;
    function centerColor2: CIColor; cdecl;
    procedure setReplacementColor2(replacementColor2: CIColor); cdecl;
    function replacementColor2: CIColor; cdecl;
    procedure setCloseness2(closeness2: Single); cdecl;
    function closeness2: Single; cdecl;
    procedure setContrast2(contrast2: Single); cdecl;
    function contrast2: Single; cdecl;
    procedure setCenterColor3(centerColor3: CIColor); cdecl;
    function centerColor3: CIColor; cdecl;
    procedure setReplacementColor3(replacementColor3: CIColor); cdecl;
    function replacementColor3: CIColor; cdecl;
    procedure setCloseness3(closeness3: Single); cdecl;
    function closeness3: Single; cdecl;
    procedure setContrast3(contrast3: Single); cdecl;
    function contrast3: Single; cdecl;
  end;

  CISpotLight = interface(IObjectiveC)
    ['{9A661C7F-069A-4DED-A877-F1BBA43ED4B0}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setLightPosition(lightPosition: CIVector); cdecl;
    function lightPosition: CIVector; cdecl;
    procedure setLightPointsAt(lightPointsAt: CIVector); cdecl;
    function lightPointsAt: CIVector; cdecl;
    procedure setBrightness(brightness: Single); cdecl;
    function brightness: Single; cdecl;
    procedure setConcentration(concentration: Single); cdecl;
    function concentration: Single; cdecl;
    procedure setColor(color: CIColor); cdecl;
    function color: CIColor; cdecl;
  end;

  CIBokehBlur = interface(IObjectiveC)
    ['{24F92251-FA69-4E28-A893-2F4BD88043C8}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setRingAmount(ringAmount: Single); cdecl;
    function ringAmount: Single; cdecl;
    procedure setRingSize(ringSize: Single); cdecl;
    function ringSize: Single; cdecl;
    procedure setSoftness(softness: Single); cdecl;
    function softness: Single; cdecl;
  end;

  CIBoxBlur = interface(IObjectiveC)
    ['{0AA06569-9CAF-469A-A6AA-1F6999989C06}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIDiscBlur = interface(IObjectiveC)
    ['{F39AB096-A76A-4275-8A2E-C32C995A55CC}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIGaussianBlur = interface(IObjectiveC)
    ['{16B6A851-A291-487B-B199-BBB21BEB48C1}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIMaskedVariableBlur = interface(IObjectiveC)
    ['{6BFF19B4-0CCA-4E71-ABAE-DBD15332A4B5}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setMask(mask: CIImage); cdecl;
    function mask: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIMedian = interface(IObjectiveC)
    ['{AB764095-6475-4923-981E-5041DAB5F65D}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
  end;

  CIMorphologyGradient = interface(IObjectiveC)
    ['{ECF3431D-D656-4A9C-B7A9-F4F6C9C9AC59}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIMorphologyMaximum = interface(IObjectiveC)
    ['{E3EA96A9-1092-4735-B254-5FC33348C4DD}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIMorphologyMinimum = interface(IObjectiveC)
    ['{CBC3F187-A736-49DB-AD89-F1894A50EE09}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
  end;

  CIMorphologyRectangleMaximum = interface(IObjectiveC)
    ['{ACBCDF4A-DB3B-4046-A350-C89B2A6E0BB8}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setHeight(height: Single); cdecl;
    function height: Single; cdecl;
  end;

  CIMorphologyRectangleMinimum = interface(IObjectiveC)
    ['{9B37E762-9B4A-4519-B35D-569F07F09222}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setWidth(width: Single); cdecl;
    function width: Single; cdecl;
    procedure setHeight(height: Single); cdecl;
    function height: Single; cdecl;
  end;

  CIMotionBlur = interface(IObjectiveC)
    ['{BBAB28F0-90BA-4C6B-8C84-CBB4A88AE5BF}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setRadius(radius: Single); cdecl;
    function radius: Single; cdecl;
    procedure setAngle(angle: Single); cdecl;
    function angle: Single; cdecl;
  end;

  CINoiseReduction = interface(IObjectiveC)
    ['{ABD09EC6-68FE-4CD9-963F-86AE82B2FAA5}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setNoiseLevel(noiseLevel: Single); cdecl;
    function noiseLevel: Single; cdecl;
    procedure setSharpness(sharpness: Single); cdecl;
    function sharpness: Single; cdecl;
  end;

  CIZoomBlur = interface(IObjectiveC)
    ['{C7D850BE-2C67-4D37-B40C-7E155327FA65}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setCenter(center: CGPoint); cdecl;
    function center: CGPoint; cdecl;
    procedure setAmount(amount: Single); cdecl;
    function amount: Single; cdecl;
  end;

  CIAreaReductionFilter = interface(IObjectiveC)
    ['{1DA3EED4-39F2-4981-B8A8-3CD5FE6EED3B}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setExtent(extent: CGRect); cdecl;
    function extent: CGRect; cdecl;
  end;

  CIAreaAverage = interface(IObjectiveC)
    ['{8E5EC370-408E-4C0F-87B2-C073ACC6F7E6}']
  end;

  CIAreaHistogram = interface(IObjectiveC)
    ['{BC81498B-330B-4B28-BA37-CB559DE35FBF}']
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
    procedure setCount(count: NSInteger); cdecl;
    function count: NSInteger; cdecl;
  end;

  CIAreaLogarithmicHistogram = interface(IObjectiveC)
    ['{FB27BE73-E7D6-4314-B257-587CC1347FAF}']
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
    procedure setCount(count: NSInteger); cdecl;
    function count: NSInteger; cdecl;
    procedure setMinimumStop(minimumStop: Single); cdecl;
    function minimumStop: Single; cdecl;
    procedure setMaximumStop(maximumStop: Single); cdecl;
    function maximumStop: Single; cdecl;
  end;

  CIAreaMaximum = interface(IObjectiveC)
    ['{BB3766FC-D627-4C99-84DC-6D1747B39628}']
  end;

  CIAreaMaximumAlpha = interface(IObjectiveC)
    ['{4196EC27-C9A0-495A-B727-2FE08C537BDE}']
  end;

  CIAreaMinimum = interface(IObjectiveC)
    ['{67D6D1CE-664A-4C91-B810-E3759FDCC40A}']
  end;

  CIAreaMinimumAlpha = interface(IObjectiveC)
    ['{B4194B51-C6E9-4468-AC29-AD1B4E2B5378}']
  end;

  CIAreaMinMax = interface(IObjectiveC)
    ['{0945E1AF-5B20-489F-94CD-AC8439618CFD}']
  end;

  CIAreaMinMaxRed = interface(IObjectiveC)
    ['{89306806-4A53-4EA8-85D4-018AD70049EA}']
  end;

  CIColumnAverage = interface(IObjectiveC)
    ['{D18BF20D-CE7E-4B77-8FD1-5329D6E39E81}']
  end;

  CIHistogramDisplay = interface(IObjectiveC)
    ['{940226AD-78BE-4142-A446-DE4C5DDFFAEE}']
    procedure setInputImage(inputImage: CIImage); cdecl;
    function inputImage: CIImage; cdecl;
    procedure setHeight(height: Single); cdecl;
    function height: Single; cdecl;
    procedure setHighLimit(highLimit: Single); cdecl;
    function highLimit: Single; cdecl;
    procedure setLowLimit(lowLimit: Single); cdecl;
    function lowLimit: Single; cdecl;
  end;

  CIKMeans = interface(IObjectiveC)
    ['{80FA0B48-BFFA-48AE-833E-CA77762ABB1E}']
    procedure setInputMeans(inputMeans: CIImage); cdecl;
    function inputMeans: CIImage; cdecl;
    procedure setCount(count: NSInteger); cdecl;
    function count: NSInteger; cdecl;
    procedure setPasses(passes: Single); cdecl;
    function passes: Single; cdecl;
    procedure setPerceptual(perceptual: Integer); cdecl;
    function perceptual: Integer; cdecl;
  end;

  CIRowAverage = interface(IObjectiveC)
    ['{1185E54F-DB83-4193-AD91-84320D3C4474}']
  end;

  CIImageProcessorInput = interface(IObjectiveC)
    ['{5DC094E5-BA4F-48D2-BD6C-2E96B5B60F76}']
    function region: CGRect; cdecl;
    function bytesPerRow: LongWord; cdecl;
    function format: CIFormat; cdecl;
    function baseAddress: Pointer; cdecl;
    function surface: IOSurfaceRef; cdecl;
    function pixelBuffer: CVPixelBufferRef; cdecl;
    function metalTexture: Pointer; cdecl;
    function digest: UInt64; cdecl;
  end;

  CIImageProcessorOutput = interface(IObjectiveC)
    ['{07A302B7-EA47-4027-BFC9-E5FD06B1C21D}']
    function region: CGRect; cdecl;
    function bytesPerRow: LongWord; cdecl;
    function format: CIFormat; cdecl;
    function baseAddress: Pointer; cdecl;
    function surface: IOSurfaceRef; cdecl;
    function pixelBuffer: CVPixelBufferRef; cdecl;
    function metalTexture: Pointer; cdecl;
    function metalCommandBuffer: Pointer; cdecl;
    function digest: UInt64; cdecl;
  end;

  // ===== Exported string consts =====

function kCIFormatARGB8: Pointer;
function kCIFormatBGRA8: Pointer;
function kCIFormatRGBA8: Pointer;
function kCIFormatABGR8: Pointer;
function kCIFormatRGBAh: Pointer;
function kCIFormatRGBA16: Pointer;
function kCIFormatRGBAf: Pointer;
function kCIFormatA8: Pointer;
function kCIFormatA16: Pointer;
function kCIFormatAh: Pointer;
function kCIFormatAf: Pointer;
function kCIFormatR8: Pointer;
function kCIFormatR16: Pointer;
function kCIFormatRh: Pointer;
function kCIFormatRf: Pointer;
function kCIFormatRG8: Pointer;
function kCIFormatRG16: Pointer;
function kCIFormatRGh: Pointer;
function kCIFormatRGf: Pointer;
function kCIFormatL8: Pointer;
function kCIFormatL16: Pointer;
function kCIFormatLh: Pointer;
function kCIFormatLf: Pointer;
function kCIFormatLA8: Pointer;
function kCIFormatLA16: Pointer;
function kCIFormatLAh: Pointer;
function kCIFormatLAf: Pointer;
function kCIImageColorSpace: Pointer;
function kCIImageToneMapHDRtoSDR: Pointer;
function kCIImageNearestSampling: Pointer;
function kCIImageProperties: Pointer;
function kCIImageApplyOrientationProperty: Pointer;
function kCIImageTextureTarget: Pointer;
function kCIImageTextureFormat: Pointer;
function kCIImageAuxiliaryDepth: Pointer;
function kCIImageAuxiliaryDisparity: Pointer;
function kCIImageAuxiliaryPortraitEffectsMatte: Pointer;
function kCIImageAuxiliarySemanticSegmentationSkinMatte: Pointer;
function kCIImageAuxiliarySemanticSegmentationHairMatte: Pointer;
function kCIImageAuxiliarySemanticSegmentationTeethMatte: Pointer;
function kCIImageAuxiliarySemanticSegmentationGlassesMatte: Pointer;
function kCIImageAuxiliarySemanticSegmentationSkyMatte: Pointer;
function kCIImageAutoAdjustEnhance: Pointer;
function kCIImageAutoAdjustRedEye: Pointer;
function kCIImageAutoAdjustFeatures: Pointer;
function kCIImageAutoAdjustCrop: Pointer;
function kCIImageAutoAdjustLevel: Pointer;
function kCIContextOutputColorSpace: Pointer;
function kCIContextWorkingColorSpace: Pointer;
function kCIContextWorkingFormat: Pointer;
function kCIContextHighQualityDownsample: Pointer;
function kCIContextOutputPremultiplied: Pointer;
function kCIContextCacheIntermediates: Pointer;
function kCIContextUseSoftwareRenderer: Pointer;
function kCIContextPriorityRequestLow: Pointer;
function kCIContextAllowLowPower: Pointer;
function kCIContextName: Pointer;
function kCIImageRepresentationAVDepthData: Pointer;
function kCIImageRepresentationDepthImage: Pointer;
function kCIImageRepresentationDisparityImage: Pointer;
function kCIImageRepresentationAVPortraitEffectsMatte: Pointer;
function kCIImageRepresentationPortraitEffectsMatteImage: Pointer;
function kCIImageRepresentationAVSemanticSegmentationMattes: Pointer;
function kCIImageRepresentationSemanticSegmentationSkinMatteImage: Pointer;
function kCIImageRepresentationSemanticSegmentationHairMatteImage: Pointer;
function kCIImageRepresentationSemanticSegmentationTeethMatteImage: Pointer;
function kCIImageRepresentationSemanticSegmentationGlassesMatteImage: Pointer;
function kCIImageRepresentationSemanticSegmentationSkyMatteImage: Pointer;
function CIDetectorTypeFace: NSString;
function CIDetectorTypeRectangle: NSString;
function CIDetectorTypeQRCode: NSString;
function CIDetectorTypeText: NSString;
function CIDetectorAccuracy: NSString;
function CIDetectorAccuracyLow: NSString;
function CIDetectorAccuracyHigh: NSString;
function CIDetectorTracking: NSString;
function CIDetectorMinFeatureSize: NSString;
function CIDetectorMaxFeatureCount: NSString;
function CIDetectorNumberOfAngles: NSString;
function CIDetectorImageOrientation: NSString;
function CIDetectorEyeBlink: NSString;
function CIDetectorSmile: NSString;
function CIDetectorFocalLength: NSString;
function CIDetectorAspectRatio: NSString;
function CIDetectorReturnSubFeatures: NSString;
function CIFeatureTypeFace: NSString;
function CIFeatureTypeRectangle: NSString;
function CIFeatureTypeQRCode: NSString;
function CIFeatureTypeText: NSString;
function kCIAttributeFilterName: NSString;
function kCIAttributeFilterDisplayName: NSString;
function kCIAttributeDescription: NSString;
function kCIAttributeFilterAvailable_Mac: NSString;
function kCIAttributeFilterAvailable_iOS: NSString;
function kCIAttributeReferenceDocumentation: NSString;
function kCIAttributeFilterCategories: NSString;
function kCIAttributeClass: NSString;
function kCIAttributeType: NSString;
function kCIAttributeMin: NSString;
function kCIAttributeMax: NSString;
function kCIAttributeSliderMin: NSString;
function kCIAttributeSliderMax: NSString;
function kCIAttributeDefault: NSString;
function kCIAttributeIdentity: NSString;
function kCIAttributeName: NSString;
function kCIAttributeDisplayName: NSString;
function kCIUIParameterSet: NSString;
function kCIUISetBasic: NSString;
function kCIUISetIntermediate: NSString;
function kCIUISetAdvanced: NSString;
function kCIUISetDevelopment: NSString;
function kCIAttributeTypeTime: NSString;
function kCIAttributeTypeScalar: NSString;
function kCIAttributeTypeDistance: NSString;
function kCIAttributeTypeAngle: NSString;
function kCIAttributeTypeBoolean: NSString;
function kCIAttributeTypeInteger: NSString;
function kCIAttributeTypeCount: NSString;
function kCIAttributeTypePosition: NSString;
function kCIAttributeTypeOffset: NSString;
function kCIAttributeTypePosition3: NSString;
function kCIAttributeTypeRectangle: NSString;
function kCIAttributeTypeOpaqueColor: NSString;
function kCIAttributeTypeColor: NSString;
function kCIAttributeTypeGradient: NSString;
function kCIAttributeTypeImage: NSString;
function kCIAttributeTypeTransform: NSString;
function kCICategoryDistortionEffect: NSString;
function kCICategoryGeometryAdjustment: NSString;
function kCICategoryCompositeOperation: NSString;
function kCICategoryHalftoneEffect: NSString;
function kCICategoryColorAdjustment: NSString;
function kCICategoryColorEffect: NSString;
function kCICategoryTransition: NSString;
function kCICategoryTileEffect: NSString;
function kCICategoryGenerator: NSString;
function kCICategoryReduction: NSString;
function kCICategoryGradient: NSString;
function kCICategoryStylize: NSString;
function kCICategorySharpen: NSString;
function kCICategoryBlur: NSString;
function kCICategoryVideo: NSString;
function kCICategoryStillImage: NSString;
function kCICategoryInterlaced: NSString;
function kCICategoryNonSquarePixels: NSString;
function kCICategoryHighDynamicRange: NSString;
function kCICategoryBuiltIn: NSString;
function kCICategoryFilterGenerator: NSString;
function kCIApplyOptionExtent: NSString;
function kCIApplyOptionDefinition: NSString;
function kCIApplyOptionUserInfo: NSString;
function kCIApplyOptionColorSpace: NSString;
function kCIOutputImageKey: NSString;
function kCIInputBackgroundImageKey: NSString;
function kCIInputImageKey: NSString;
function kCIInputDepthImageKey: NSString;
function kCIInputDisparityImageKey: NSString;
function kCIInputAmountKey: NSString;
function kCIInputTimeKey: NSString;
function kCIInputTransformKey: NSString;
function kCIInputScaleKey: NSString;
function kCIInputAspectRatioKey: NSString;
function kCIInputCenterKey: NSString;
function kCIInputRadiusKey: NSString;
function kCIInputAngleKey: NSString;
function kCIInputRefractionKey: NSString;
function kCIInputWidthKey: NSString;
function kCIInputSharpnessKey: NSString;
function kCIInputIntensityKey: NSString;
function kCIInputEVKey: NSString;
function kCIInputSaturationKey: NSString;
function kCIInputColorKey: NSString;
function kCIInputBrightnessKey: NSString;
function kCIInputContrastKey: NSString;
function kCIInputBiasKey: NSString;
function kCIInputWeightsKey: NSString;
function kCIInputGradientImageKey: NSString;
function kCIInputMaskImageKey: NSString;
function kCIInputMatteImageKey: NSString;
function kCIInputShadingImageKey: NSString;
function kCIInputTargetImageKey: NSString;
function kCIInputExtentKey: NSString;
function kCIInputVersionKey: NSString;
function __AVAILABILITY_INTERNAL__IPHONE_16_0: Pointer;
function kCIFilterGeneratorExportedKey: NSString;
function kCIFilterGeneratorExportedKeyTargetObject: NSString;
function kCIFilterGeneratorExportedKeyName: NSString;
function kCIImageProviderTileSize: Pointer;
function kCIImageProviderUserInfo: Pointer;
function kCIInputAllowDraftModeKey: Pointer;
function kCIInputDecoderVersionKey: Pointer;
function kCISupportedDecoderVersionsKey: Pointer;
function kCIInputBaselineExposureKey: Pointer;
function kCIInputBoostKey: Pointer;
function kCIInputBoostShadowAmountKey: Pointer;
function kCIInputDisableGamutMapKey: Pointer;
function kCIInputNeutralChromaticityXKey: Pointer;
function kCIInputNeutralChromaticityYKey: Pointer;
function kCIInputNeutralTemperatureKey: Pointer;
function kCIInputNeutralTintKey: Pointer;
function kCIInputNeutralLocationKey: Pointer;
function kCIInputScaleFactorKey: Pointer;
function kCIInputIgnoreImageOrientationKey: Pointer;
function kCIInputImageOrientationKey: Pointer;
function kCIInputEnableSharpeningKey: Pointer;
function kCIInputEnableChromaticNoiseTrackingKey: Pointer;
function kCIInputNoiseReductionAmountKey: Pointer;
function kCIInputMoireAmountKey: Pointer;
function kCIInputEnableVendorLensCorrectionKey: Pointer;
function kCIInputLuminanceNoiseReductionAmountKey: Pointer;
function kCIInputColorNoiseReductionAmountKey: Pointer;
function kCIInputNoiseReductionSharpnessAmountKey: Pointer;
function kCIInputNoiseReductionContrastAmountKey: Pointer;
function kCIInputNoiseReductionDetailAmountKey: Pointer;
function kCIInputEnableEDRModeKey: Pointer;
function kCIInputLocalToneMapAmountKey: Pointer;
function kCIInputLinearSpaceFilter: Pointer;
function kCIOutputNativeSizeKey: Pointer;
function kCIActiveKeys: Pointer;
function kCIPropertiesKey: Pointer;
function CIRAWDecoderVersionNone: Pointer;
function CIRAWDecoderVersion8: Pointer;
function CIRAWDecoderVersion8DNG: Pointer;
function CIRAWDecoderVersion7: Pointer;
function CIRAWDecoderVersion7DNG: Pointer;
function CIRAWDecoderVersion6: Pointer;
function CIRAWDecoderVersion6DNG: Pointer;
function kCISamplerAffineMatrix: NSString;
function kCISamplerWrapMode: NSString;
function kCISamplerFilterMode: NSString;
function kCISamplerWrapBlack: NSString;
function kCISamplerWrapClamp: NSString;
function kCISamplerFilterNearest: NSString;
function kCISamplerFilterLinear: NSString;
function kCISamplerColorSpace: NSString;


// ===== External functions =====

const
  libCoreImage = '/System/Library/Frameworks/CoreImage.framework/CoreImage';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreImageModule: THandle;

{$ENDIF IOS}

function CIDetectorTypeFace: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorTypeFace');
end;

function CIDetectorTypeRectangle: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorTypeRectangle');
end;

function CIDetectorTypeQRCode: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorTypeQRCode');
end;

function CIDetectorTypeText: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorTypeText');
end;

function CIDetectorAccuracy: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorAccuracy');
end;

function CIDetectorAccuracyLow: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorAccuracyLow');
end;

function CIDetectorAccuracyHigh: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorAccuracyHigh');
end;

function CIDetectorTracking: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorTracking');
end;

function CIDetectorMinFeatureSize: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorMinFeatureSize');
end;

function CIDetectorMaxFeatureCount: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorMaxFeatureCount');
end;

function CIDetectorNumberOfAngles: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorNumberOfAngles');
end;

function CIDetectorImageOrientation: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorImageOrientation');
end;

function CIDetectorEyeBlink: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorEyeBlink');
end;

function CIDetectorSmile: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorSmile');
end;

function CIDetectorFocalLength: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorFocalLength');
end;

function CIDetectorAspectRatio: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorAspectRatio');
end;

function CIDetectorReturnSubFeatures: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIDetectorReturnSubFeatures');
end;

function CIFeatureTypeFace: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIFeatureTypeFace');
end;

function CIFeatureTypeRectangle: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIFeatureTypeRectangle');
end;

function CIFeatureTypeQRCode: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIFeatureTypeQRCode');
end;

function CIFeatureTypeText: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'CIFeatureTypeText');
end;

function kCIAttributeFilterName: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeFilterName');
end;

function kCIAttributeFilterDisplayName: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeFilterDisplayName');
end;

function kCIAttributeDescription: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeDescription');
end;

function kCIAttributeFilterAvailable_Mac: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeFilterAvailable_Mac');
end;

function kCIAttributeFilterAvailable_iOS: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeFilterAvailable_iOS');
end;

function kCIAttributeReferenceDocumentation: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage,
    'kCIAttributeReferenceDocumentation');
end;

function kCIAttributeFilterCategories: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeFilterCategories');
end;

function kCIAttributeClass: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeClass');
end;

function kCIAttributeType: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeType');
end;

function kCIAttributeMin: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeMin');
end;

function kCIAttributeMax: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeMax');
end;

function kCIAttributeSliderMin: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeSliderMin');
end;

function kCIAttributeSliderMax: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeSliderMax');
end;

function kCIAttributeDefault: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeDefault');
end;

function kCIAttributeIdentity: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeIdentity');
end;

function kCIAttributeName: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeName');
end;

function kCIAttributeDisplayName: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeDisplayName');
end;

function kCIUIParameterSet: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIUIParameterSet');
end;

function kCIUISetBasic: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIUISetBasic');
end;

function kCIUISetIntermediate: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIUISetIntermediate');
end;

function kCIUISetAdvanced: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIUISetAdvanced');
end;

function kCIUISetDevelopment: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIUISetDevelopment');
end;

function kCIAttributeTypeTime: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeTime');
end;

function kCIAttributeTypeScalar: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeScalar');
end;

function kCIAttributeTypeDistance: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeDistance');
end;

function kCIAttributeTypeAngle: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeAngle');
end;

function kCIAttributeTypeBoolean: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeBoolean');
end;

function kCIAttributeTypeInteger: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeInteger');
end;

function kCIAttributeTypeCount: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeCount');
end;

function kCIAttributeTypePosition: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypePosition');
end;

function kCIAttributeTypeOffset: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeOffset');
end;

function kCIAttributeTypePosition3: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypePosition3');
end;

function kCIAttributeTypeRectangle: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeRectangle');
end;

function kCIAttributeTypeOpaqueColor: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeOpaqueColor');
end;

function kCIAttributeTypeColor: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeColor');
end;

function kCIAttributeTypeGradient: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeGradient');
end;

function kCIAttributeTypeImage: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeImage');
end;

function kCIAttributeTypeTransform: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIAttributeTypeTransform');
end;

function kCICategoryDistortionEffect: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryDistortionEffect');
end;

function kCICategoryGeometryAdjustment: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryGeometryAdjustment');
end;

function kCICategoryCompositeOperation: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryCompositeOperation');
end;

function kCICategoryHalftoneEffect: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryHalftoneEffect');
end;

function kCICategoryColorAdjustment: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryColorAdjustment');
end;

function kCICategoryColorEffect: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryColorEffect');
end;

function kCICategoryTransition: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryTransition');
end;

function kCICategoryTileEffect: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryTileEffect');
end;

function kCICategoryGenerator: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryGenerator');
end;

function kCICategoryReduction: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryReduction');
end;

function kCICategoryGradient: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryGradient');
end;

function kCICategoryStylize: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryStylize');
end;

function kCICategorySharpen: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategorySharpen');
end;

function kCICategoryBlur: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryBlur');
end;

function kCICategoryVideo: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryVideo');
end;

function kCICategoryStillImage: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryStillImage');
end;

function kCICategoryInterlaced: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryInterlaced');
end;

function kCICategoryNonSquarePixels: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryNonSquarePixels');
end;

function kCICategoryHighDynamicRange: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryHighDynamicRange');
end;

function kCICategoryBuiltIn: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryBuiltIn');
end;

function kCICategoryFilterGenerator: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCICategoryFilterGenerator');
end;

function kCIApplyOptionExtent: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIApplyOptionExtent');
end;

function kCIApplyOptionDefinition: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIApplyOptionDefinition');
end;

function kCIApplyOptionUserInfo: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIApplyOptionUserInfo');
end;

function kCIApplyOptionColorSpace: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIApplyOptionColorSpace');
end;

function kCIOutputImageKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIOutputImageKey');
end;

function kCIInputBackgroundImageKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputBackgroundImageKey');
end;

function kCIInputImageKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputImageKey');
end;

function kCIInputDepthImageKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputDepthImageKey');
end;

function kCIInputDisparityImageKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputDisparityImageKey');
end;

function kCIInputAmountKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputAmountKey');
end;

function kCIInputTimeKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputTimeKey');
end;

function kCIInputTransformKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputTransformKey');
end;

function kCIInputScaleKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputScaleKey');
end;

function kCIInputAspectRatioKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputAspectRatioKey');
end;

function kCIInputCenterKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputCenterKey');
end;

function kCIInputRadiusKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputRadiusKey');
end;

function kCIInputAngleKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputAngleKey');
end;

function kCIInputRefractionKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputRefractionKey');
end;

function kCIInputWidthKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputWidthKey');
end;

function kCIInputSharpnessKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputSharpnessKey');
end;

function kCIInputIntensityKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputIntensityKey');
end;

function kCIInputEVKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputEVKey');
end;

function kCIInputSaturationKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputSaturationKey');
end;

function kCIInputColorKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputColorKey');
end;

function kCIInputBrightnessKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputBrightnessKey');
end;

function kCIInputContrastKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputContrastKey');
end;

function kCIInputBiasKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputBiasKey');
end;

function kCIInputWeightsKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputWeightsKey');
end;

function kCIInputGradientImageKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputGradientImageKey');
end;

function kCIInputMaskImageKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputMaskImageKey');
end;

function kCIInputMatteImageKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputMatteImageKey');
end;

function kCIInputShadingImageKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputShadingImageKey');
end;

function kCIInputTargetImageKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputTargetImageKey');
end;

function kCIInputExtentKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputExtentKey');
end;

function kCIInputVersionKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIInputVersionKey');
end;

function kCIFilterGeneratorExportedKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIFilterGeneratorExportedKey');
end;

function kCIFilterGeneratorExportedKeyTargetObject: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage,
    'kCIFilterGeneratorExportedKeyTargetObject');
end;

function kCIFilterGeneratorExportedKeyName: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage,
    'kCIFilterGeneratorExportedKeyName');
end;

function kCISamplerAffineMatrix: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCISamplerAffineMatrix');
end;

function kCISamplerWrapMode: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCISamplerWrapMode');
end;

function kCISamplerFilterMode: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCISamplerFilterMode');
end;

function kCISamplerWrapBlack: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCISamplerWrapBlack');
end;

function kCISamplerWrapClamp: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCISamplerWrapClamp');
end;

function kCISamplerFilterNearest: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCISamplerFilterNearest');
end;

function kCISamplerFilterLinear: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCISamplerFilterLinear');
end;

function kCISamplerColorSpace: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCISamplerColorSpace');
end;

function kCIFormatARGB8: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatARGB8');
end;

function kCIFormatBGRA8: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatBGRA8');
end;

function kCIFormatRGBA8: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatRGBA8');
end;

function kCIFormatABGR8: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatABGR8');
end;

function kCIFormatRGBAh: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatRGBAh');
end;

function kCIFormatRGBA16: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatRGBA16');
end;

function kCIFormatRGBAf: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatRGBAf');
end;

function kCIFormatA8: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatA8');
end;

function kCIFormatA16: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatA16');
end;

function kCIFormatAh: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatAh');
end;

function kCIFormatAf: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatAf');
end;

function kCIFormatR8: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatR8');
end;

function kCIFormatR16: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatR16');
end;

function kCIFormatRh: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatRh');
end;

function kCIFormatRf: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatRf');
end;

function kCIFormatRG8: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatRG8');
end;

function kCIFormatRG16: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatRG16');
end;

function kCIFormatRGh: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatRGh');
end;

function kCIFormatRGf: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatRGf');
end;

function kCIFormatL8: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatL8');
end;

function kCIFormatL16: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatL16');
end;

function kCIFormatLh: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatLh');
end;

function kCIFormatLf: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatLf');
end;

function kCIFormatLA8: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatLA8');
end;

function kCIFormatLA16: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatLA16');
end;

function kCIFormatLAh: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatLAh');
end;

function kCIFormatLAf: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatLAf');
end;

function kCIImageColorSpace: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageColorSpace');
end;

function kCIImageToneMapHDRtoSDR: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageToneMapHDRtoSDR');
end;

function kCIImageNearestSampling: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageNearestSampling');
end;

function kCIImageProperties: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageProperties');
end;

function kCIImageApplyOrientationProperty: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageApplyOrientationProperty');
end;

function kCIImageTextureTarget: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageTextureTarget');
end;

function kCIImageTextureFormat: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageTextureFormat');
end;

function kCIImageAuxiliaryDepth: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageAuxiliaryDepth');
end;

function kCIImageAuxiliaryDisparity: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageAuxiliaryDisparity');
end;

function kCIImageAuxiliaryPortraitEffectsMatte: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageAuxiliaryPortraitEffectsMatte');
end;

function kCIImageAuxiliarySemanticSegmentationSkinMatte: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageAuxiliarySemanticSegmentationSkinMatte');
end;

function kCIImageAuxiliarySemanticSegmentationHairMatte: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageAuxiliarySemanticSegmentationHairMatte');
end;

function kCIImageAuxiliarySemanticSegmentationTeethMatte: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageAuxiliarySemanticSegmentationTeethMatte');
end;

function kCIImageAuxiliarySemanticSegmentationGlassesMatte: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageAuxiliarySemanticSegmentationGlassesMatte');
end;

function kCIImageAuxiliarySemanticSegmentationSkyMatte: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageAuxiliarySemanticSegmentationSkyMatte');
end;

function kCIImageAutoAdjustEnhance: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageAutoAdjustEnhance');
end;

function kCIImageAutoAdjustRedEye: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageAutoAdjustRedEye');
end;

function kCIImageAutoAdjustFeatures: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageAutoAdjustFeatures');
end;

function kCIImageAutoAdjustCrop: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageAutoAdjustCrop');
end;

function kCIImageAutoAdjustLevel: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageAutoAdjustLevel');
end;

function kCIContextOutputColorSpace: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIContextOutputColorSpace');
end;

function kCIContextWorkingColorSpace: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIContextWorkingColorSpace');
end;

function kCIContextWorkingFormat: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIContextWorkingFormat');
end;

function kCIContextHighQualityDownsample: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIContextHighQualityDownsample');
end;

function kCIContextOutputPremultiplied: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIContextOutputPremultiplied');
end;

function kCIContextCacheIntermediates: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIContextCacheIntermediates');
end;

function kCIContextUseSoftwareRenderer: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIContextUseSoftwareRenderer');
end;

function kCIContextPriorityRequestLow: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIContextPriorityRequestLow');
end;

function kCIContextAllowLowPower: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIContextAllowLowPower');
end;

function kCIContextName: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIContextName');
end;

function kCIImageRepresentationAVDepthData: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageRepresentationAVDepthData');
end;

function kCIImageRepresentationDepthImage: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageRepresentationDepthImage');
end;

function kCIImageRepresentationDisparityImage: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageRepresentationDisparityImage');
end;

function kCIImageRepresentationAVPortraitEffectsMatte: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageRepresentationAVPortraitEffectsMatte');
end;

function kCIImageRepresentationPortraitEffectsMatteImage: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageRepresentationPortraitEffectsMatteImage');
end;

function kCIImageRepresentationAVSemanticSegmentationMattes: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageRepresentationAVSemanticSegmentationMattes');
end;

function kCIImageRepresentationSemanticSegmentationSkinMatteImage: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageRepresentationSemanticSegmentationSkinMatteImage');
end;

function kCIImageRepresentationSemanticSegmentationHairMatteImage: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageRepresentationSemanticSegmentationHairMatteImage');
end;

function kCIImageRepresentationSemanticSegmentationTeethMatteImage: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageRepresentationSemanticSegmentationTeethMatteImage');
end;

function kCIImageRepresentationSemanticSegmentationGlassesMatteImage: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageRepresentationSemanticSegmentationGlassesMatteImage');
end;

function kCIImageRepresentationSemanticSegmentationSkyMatteImage: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIImageRepresentationSemanticSegmentationSkyMatteImage');
end;

function __AVAILABILITY_INTERNAL__IPHONE_16_0: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    '__AVAILABILITY_INTERNAL__IPHONE_16_0');
end;

function kCIImageProviderTileSize: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageProviderTileSize');
end;

function kCIImageProviderUserInfo: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIImageProviderUserInfo');
end;

function kCIInputAllowDraftModeKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputAllowDraftModeKey');
end;

function kCIInputDecoderVersionKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputDecoderVersionKey');
end;

function kCISupportedDecoderVersionsKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCISupportedDecoderVersionsKey');
end;

function kCIInputBaselineExposureKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputBaselineExposureKey');
end;

function kCIInputBoostKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputBoostKey');
end;

function kCIInputBoostShadowAmountKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputBoostShadowAmountKey');
end;

function kCIInputDisableGamutMapKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputDisableGamutMapKey');
end;

function kCIInputNeutralChromaticityXKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputNeutralChromaticityXKey');
end;

function kCIInputNeutralChromaticityYKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputNeutralChromaticityYKey');
end;

function kCIInputNeutralTemperatureKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputNeutralTemperatureKey');
end;

function kCIInputNeutralTintKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputNeutralTintKey');
end;

function kCIInputNeutralLocationKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputNeutralLocationKey');
end;

function kCIInputScaleFactorKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputScaleFactorKey');
end;

function kCIInputIgnoreImageOrientationKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIInputIgnoreImageOrientationKey');
end;

function kCIInputImageOrientationKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputImageOrientationKey');
end;

function kCIInputEnableSharpeningKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputEnableSharpeningKey');
end;

function kCIInputEnableChromaticNoiseTrackingKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIInputEnableChromaticNoiseTrackingKey');
end;

function kCIInputNoiseReductionAmountKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputNoiseReductionAmountKey');
end;

function kCIInputMoireAmountKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputMoireAmountKey');
end;

function kCIInputEnableVendorLensCorrectionKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIInputEnableVendorLensCorrectionKey');
end;

function kCIInputLuminanceNoiseReductionAmountKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIInputLuminanceNoiseReductionAmountKey');
end;

function kCIInputColorNoiseReductionAmountKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIInputColorNoiseReductionAmountKey');
end;

function kCIInputNoiseReductionSharpnessAmountKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIInputNoiseReductionSharpnessAmountKey');
end;

function kCIInputNoiseReductionContrastAmountKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIInputNoiseReductionContrastAmountKey');
end;

function kCIInputNoiseReductionDetailAmountKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage,
    'kCIInputNoiseReductionDetailAmountKey');
end;

function kCIInputEnableEDRModeKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputEnableEDRModeKey');
end;

function kCIInputLocalToneMapAmountKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputLocalToneMapAmountKey');
end;

function kCIInputLinearSpaceFilter: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIInputLinearSpaceFilter');
end;

function kCIOutputNativeSizeKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIOutputNativeSizeKey');
end;

function kCIActiveKeys: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIActiveKeys');
end;

function kCIPropertiesKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIPropertiesKey');
end;

function CIRAWDecoderVersionNone: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'CIRAWDecoderVersionNone');
end;

function CIRAWDecoderVersion8: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'CIRAWDecoderVersion8');
end;

function CIRAWDecoderVersion8DNG: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'CIRAWDecoderVersion8DNG');
end;

function CIRAWDecoderVersion7: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'CIRAWDecoderVersion7');
end;

function CIRAWDecoderVersion7DNG: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'CIRAWDecoderVersion7DNG');
end;

function CIRAWDecoderVersion6: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'CIRAWDecoderVersion6');
end;

function CIRAWDecoderVersion6DNG: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'CIRAWDecoderVersion6DNG');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreImageModule := dlopen(MarshaledAString(libCoreImage), RTLD_LAZY);

finalization

dlclose(CoreImageModule);
{$ENDIF IOS}

end.
