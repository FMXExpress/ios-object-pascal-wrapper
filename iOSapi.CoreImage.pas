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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.CoreVideo,
  iOSapi.Foundation,
  iOSapi.OpenGLES;

type

  // ===== Forward declarations =====
{$M+}
  CIVector = interface;
  CIColor = interface;
  CIContext = interface;
  CIFilterShape = interface;
  CIFilter = interface;
  CIImage = interface;
  MTLCommandBuffer = interface;
  CIFeature = interface;
  CIDetector = interface;
  CIFaceFeature = interface;
  CIRectangleFeature = interface;
  CIQRCodeFeature = interface;
  CITextFeature = interface;
  CIFilterConstructor = interface;
  CIKernel = interface;
  CIImageAccumulator = interface;
  CIImageProvider = interface;
  CIColorKernel = interface;
  CIWarpKernel = interface;
  CISampler = interface;

  // ===== Framework typedefs =====
{$M+}
  __darwin_size_t = LongWord;
  CGFloat = Single;
  CGPoint = CGPoint = record x: CGFloat;
y:
CGFloat;
end;
PCGPoint = ^CGPoint;;
CGSize = CGSize = record width: CGFloat;
height:
CGFloat;
end;
PCGSize = ^CGSize;;
CGRect = CGRect = record origin: CGPoint;
size:
CGSize;
end;
PCGRect = ^CGRect;;
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
CGColorRef = Pointer;
CGColorSpaceRef = Pointer;
CGImageRef = Pointer;
CGLayerRef = Pointer;
CIFormat = Integer;
CVBufferRef = Pointer;
CVImageBufferRef = CVBufferRef;
CVPixelBufferRef = CVImageBufferRef;
CGContextRef = Pointer;
CFDictionaryRef = Pointer;
__darwin_ptrdiff_t = Integer;
CIKernelROICallback =
function(param1: Integer; param2: CGRect): CGRect;
cdecl;
SEL = SEL *;
// ===== Interface declarations =====

CIVectorClass = interface(NSObjectClass)
  ['{3638D77A-4999-4C9C-A164-00F4B0665B12}']
{ class } function vectorWithValues(values: PCGFloat; count: LongWord)
  : Pointer { instancetype };
cdecl;

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
            ['{274CDBA6-D2BE-462D-9782-584155427428}']
          function initWithValues(values: PCGFloat; count: LongWord)
            : Pointer { instancetype };
          cdecl;
          [MethodName('initWithX:')]
            function initWithX(x: CGFloat): Pointer { instancetype }; cdecl;
            [MethodName('initWithX:Y:')]
              function initWithXY(x: CGFloat; y: CGFloat)
                : Pointer { instancetype }; cdecl;
              [MethodName('initWithX:Y:Z:')]
                function initWithXYZ(x: CGFloat; y: CGFloat; Z: CGFloat)
                  : Pointer { instancetype }; cdecl;
                [MethodName('initWithX:Y:Z:W:')]
                  function initWithXYZW(x: CGFloat; y: CGFloat; Z: CGFloat;
                    W: CGFloat): Pointer { instancetype }; cdecl;
                    function initWithCGPoint(p: CGPoint)
                      : Pointer { instancetype }; cdecl;
                      function initWithCGRect(r: CGRect)
                        : Pointer { instancetype }; cdecl;
                        function initWithCGAffineTransform(r: CGAffineTransform)
                          : Pointer { instancetype }; cdecl;
                          function initWithString(representation: NSString)
                            : Pointer { instancetype }; cdecl;
                            function valueAtIndex(index: LongWord)
                              : CGFloat; cdecl;
                              function count: LongWord; cdecl;
                                function x: CGFloat; cdecl;
                                  function y: CGFloat; cdecl;
                                    function Z: CGFloat; cdecl;
                                      function W: CGFloat; cdecl;
                                        function CGPointValue: CGPoint; cdecl;
                                        function CGRectValue: CGRect; cdecl;
                                        function CGAffineTransformValue
                                        : CGAffineTransform; cdecl;
                                        function stringRepresentation
                                        : NSString; cdecl;
                                        end;

                                        TCIVector = class
                                        (TOCGenericImport<CIVectorClass,
                                        CIVector>)
                                        end;
                                      PCIVector = Pointer;

                                      CIColorClass = interface(NSObjectClass)
                                        ['{5599C367-403B-4B78-88F0-DDAC225998FF}']
                                      { class } function colorWithCGColor
                                        (c: CGColorRef)
                                        : Pointer { instancetype };
                                      cdecl;
                                      [MethodName
                                        ('colorWithRed:green:blue:alpha:')]
                                      { class } function
                                        colorWithRedGreenBlueAlpha(r: CGFloat;
                                        green: CGFloat; blue: CGFloat;
                                        alpha: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('colorWithRed:green:blue:')]
                                        { class } function colorWithRedGreenBlue
                                        (r: CGFloat; green: CGFloat;
                                        blue: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function colorWithString
                                        (representation: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        CIColor = interface(NSObject)
                                        ['{038594F0-D661-4E49-B5E7-D1C1B221B711}']
                                        function initWithCGColor(c: CGColorRef)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('initWithRed:green:blue:alpha:')]
                                        function initWithRedGreenBlueAlpha
                                        (r: CGFloat; green: CGFloat;
                                        blue: CGFloat; alpha: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('initWithRed:green:blue:')]
                                        function initWithRedGreenBlue
                                        (r: CGFloat; green: CGFloat;
                                        blue: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        function numberOfComponents
                                        : LongWord; cdecl;
                                        function components: PCGFloat; cdecl;
                                        function alpha: CGFloat; cdecl;
                                        function colorSpace
                                        : CGColorSpaceRef; cdecl;
                                        function red: CGFloat; cdecl;
                                        function green: CGFloat; cdecl;
                                        function blue: CGFloat; cdecl;
                                        function stringRepresentation
                                        : NSString; cdecl;
                                        end;

                                        TCIColor = class
                                        (TOCGenericImport<
                                        CIColorClass, CIColor>)
                                        end;
                                        PCIColor = Pointer;

                                        CIContextClass = interface
                                        (NSObjectClass)
                                        ['{D3A6C7E0-A178-4C86-B984-8EF7A089CE03}']
                                        { class } function contextWithCGContext
                                        (cgctx: CGContextRef;
                                        options: NSDictionary): CIContext;
                                        cdecl;
                                        { class } function contextWithOptions
                                        (options: NSDictionary)
                                        : CIContext; cdecl;
                                        [MethodName('contextWithEAGLContext:')]
                                        { class } function
                                        contextWithEAGLContext
                                        (eaglContext: eaglContext)
                                        : CIContext; cdecl;
                                        [MethodName
                                        ('contextWithEAGLContext:options:')]
                                        { class } function
                                        contextWithEAGLContextOptions
                                        (eaglContext: eaglContext;
                                        options: NSDictionary)
                                        : CIContext; cdecl;
                                        [MethodName('contextWithMTLDevice:')]
                                        { class } function contextWithMTLDevice
                                        (device: Pointer): CIContext; cdecl;
                                        [MethodName
                                        ('contextWithMTLDevice:options:')]
                                        { class } function
                                        contextWithMTLDeviceOptions
                                        (device: Pointer; options: NSDictionary)
                                        : CIContext; cdecl;
                                        { class } function offlineGPUCount
                                        : Cardinal; cdecl;
                                        end;
                                        CIContext = interface(NSObject)
                                        ['{251FE03F-66AF-4C17-B73F-F8AEE3BA3CDC}']
                                        function workingColorSpace
                                        : CGColorSpaceRef;
                                        cdecl;
                                        [MethodName
                                        ('drawImage:atPoint:fromRect:')]
                                        procedure drawImageAtPointFromRect
                                        (image: CIImage; atPoint: CGPoint;
                                        fromRect: CGRect); cdecl;
                                        [MethodName
                                        ('drawImage:inRect:fromRect:')]
                                        procedure drawImageInRectFromRect
                                        (image: CIImage; inRect: CGRect;
                                        fromRect: CGRect); cdecl;
                                        [MethodName('createCGImage:fromRect:')]
                                        function createCGImageFromRect
                                        (image: CIImage; fromRect: CGRect)
                                        : CGImageRef; cdecl;
                                        [MethodName
                                        ('createCGImage:fromRect:format:colorSpace:')
                                        ]
                                        function createCGImageFromRectFormatColorSpace
                                        (image: CIImage; fromRect: CGRect;
                                        format: CIFormat;
                                        colorSpace: CGColorSpaceRef)
                                        : CGImageRef; cdecl;
                                        function createCGLayerWithSize
                                        (size: CGSize; info: CFDictionaryRef)
                                        : CGLayerRef; cdecl;
                                        [MethodName
                                        ('render:toBitmap:rowBytes:bounds:format:colorSpace:')
                                        ]
                                        procedure renderToBitmapRowBytesBoundsFormatColorSpace
                                        (image: CIImage; toBitmap: Pointer;
                                        rowBytes: Integer; bounds: CGRect;
                                        format: CIFormat;
                                        colorSpace: CGColorSpaceRef); cdecl;
                                        [MethodName('render:toCVPixelBuffer:')]
                                        procedure renderToCVPixelBuffer
                                        (image: CIImage;
                                        toCVPixelBuffer
                                        : CVPixelBufferRef); cdecl;
                                        [MethodName
                                        ('render:toCVPixelBuffer:bounds:colorSpace:')
                                        ]
                                        procedure renderToCVPixelBufferBoundsColorSpace
                                        (image: CIImage;
                                        toCVPixelBuffer: CVPixelBufferRef;
                                        bounds: CGRect;
                                        colorSpace: CGColorSpaceRef); cdecl;
                                        [MethodName
                                        ('render:toMTLTexture:commandBuffer:bounds:colorSpace:')
                                        ]
                                        procedure renderToMTLTextureCommandBufferBoundsColorSpace
                                        (image: CIImage; toMTLTexture: Pointer;
                                        commandBuffer: Pointer; bounds: CGRect;
                                        colorSpace: CGColorSpaceRef); cdecl;
                                        procedure reclaimResources; cdecl;
                                        procedure clearCaches; cdecl;
                                        function inputImageMaximumSize
                                        : CGSize; cdecl;
                                        function outputImageMaximumSize
                                        : CGSize; cdecl;
                                        end;

                                        TCIContext = class
                                        (TOCGenericImport<CIContextClass,
                                        CIContext>)
                                        end;
                                        PCIContext = Pointer;

                                        CIFilterShapeClass = interface
                                        (NSObjectClass)
                                        ['{18AAD8F6-AF61-461B-A2A8-4887E403438B}']
                                        { class } function shapeWithRect
                                        (r: CGRect): Pointer { instancetype };
                                        cdecl;
                                        end;
                                        CIFilterShape = interface(NSObject)
                                        ['{5B273E62-DC93-4CB3-B8A3-4DDFEE3DD8B2}']
                                        function initWithRect(r: CGRect)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function transformBy
                                        (m: CGAffineTransform;
                                        interior: Boolean)
                                        : CIFilterShape; cdecl;
                                        function insetByX(dx: Integer;
                                        y: Integer): CIFilterShape; cdecl;
                                        function unionWith(s2: CIFilterShape)
                                        : CIFilterShape; cdecl;
                                        function unionWithRect(r: CGRect)
                                        : CIFilterShape; cdecl;
                                        function intersectWith
                                        (s2: CIFilterShape)
                                        : CIFilterShape; cdecl;
                                        function intersectWithRect(r: CGRect)
                                        : CIFilterShape; cdecl;
                                        function extent: CGRect; cdecl;
                                        end;

                                        TCIFilterShape = class
                                        (TOCGenericImport<CIFilterShapeClass,
                                        CIFilterShape>)
                                        end;
                                        PCIFilterShape = Pointer;

                                        CIFilterClass = interface(NSObjectClass)
                                        ['{91B66022-9EFE-4F9D-88CD-31AE300AD822}']
                                        [MethodName('filterWithName:')]
                                        { class } function filterWithName
                                        (name: NSString): CIFilter;
                                        cdecl;
                                        [MethodName
                                        ('filterWithName:keysAndValues:')]
                                        { class } function
                                        filterWithNameKeysAndValues
                                        (name: NSString; keysAndValues: Pointer)
                                        : CIFilter; cdecl;
                                        [MethodName
                                        ('filterWithName:withInputParameters:')]
                                        { class } function
                                        filterWithNameWithInputParameters
                                        (name: NSString;
                                        withInputParameters: NSDictionary)
                                        : CIFilter; cdecl;
                                        { class } function filterNamesInCategory
                                        (category: NSString): NSArray; cdecl;
                                        { class } function
                                        filterNamesInCategories
                                        (categories: NSArray): NSArray; cdecl;
                                        { class } procedure registerFilterName
                                        (name: NSString; &constructor: Pointer;
                                        classAttributes: NSDictionary); cdecl;
                                        { class } function
                                        localizedNameForFilterName
                                        (filterName: NSString): NSString; cdecl;
                                        { class } function
                                        localizedNameForCategory
                                        (category: NSString): NSString; cdecl;
                                        { class } function
                                        localizedDescriptionForFilterName
                                        (filterName: NSString): NSString; cdecl;
                                        { class } function
                                        localizedReferenceDocumentationForFilterName
                                        (filterName: NSString): NSURL; cdecl;
                                        { class } function
                                        serializedXMPFromFilters
                                        (filters: NSArray;
                                        inputImageExtent: CGRect)
                                        : NSData; cdecl;
                                        { class } function
                                        filterArrayFromSerializedXMP
                                        (xmpData: NSData;
                                        inputImageExtent: CGRect;
                                        error: NSError): NSArray; cdecl;
                                        end;
                                        CIFilter = interface(NSObject)
                                        ['{0A9B0446-3205-4B47-85BA-FC0FF857D80A}']
                                        function outputImage: CIImage;
                                        cdecl;
                                        function name: NSString; cdecl;
                                        function inputKeys: NSArray; cdecl;
                                        function outputKeys: NSArray; cdecl;
                                        procedure setDefaults; cdecl;
                                        function attributes
                                        : NSDictionary; cdecl;
                                        [MethodName('apply:arguments:options:')]
                                        function applyArgumentsOptions
                                        (k: CIKernel; arguments: NSArray;
                                        options: NSDictionary): CIImage; cdecl;
                                        [MethodName('apply:')]
                                        function apply(k: CIKernel)
                                        : CIImage; cdecl;
                                        end;

                                        TCIFilter = class
                                        (TOCGenericImport<CIFilterClass,
                                        CIFilter>)
                                        end;
                                        PCIFilter = Pointer;

                                        CIImageClass = interface(NSObjectClass)
                                        ['{A82B184F-3C01-4820-88D4-67C1C33343C7}']
                                        [MethodName('imageWithCGImage:')]
                                        { class } function imageWithCGImage
                                        (image: CGImageRef): CIImage;
                                        cdecl;
                                        [MethodName
                                        ('imageWithCGImage:options:')]
                                        { class } function
                                        imageWithCGImageOptions
                                        (image: CGImageRef;
                                        options: NSDictionary): CIImage; cdecl;
                                        [MethodName('imageWithCGLayer:')]
                                        { class } function imageWithCGLayer
                                        (layer: CGLayerRef): CIImage; cdecl;
                                        [MethodName
                                        ('imageWithCGLayer:options:')]
                                        { class } function
                                        imageWithCGLayerOptions
                                        (layer: CGLayerRef;
                                        options: NSDictionary): CIImage; cdecl;
                                        { class } function imageWithBitmapData
                                        (data: NSData; bytesPerRow: LongWord;
                                        size: CGSize; format: CIFormat;
                                        colorSpace: CGColorSpaceRef)
                                        : CIImage; cdecl;
                                        [MethodName
                                        ('imageWithTexture:size:flipped:colorSpace:')
                                        ]
                                        { class } function
                                        imageWithTextureSizeFlippedColorSpace
                                        (name: Cardinal; size: CGSize;
                                        flipped: Boolean;
                                        colorSpace: CGColorSpaceRef)
                                        : CIImage; cdecl;
                                        [MethodName
                                        ('imageWithTexture:size:flipped:options:')
                                        ]
                                        { class } function
                                        imageWithTextureSizeFlippedOptions
                                        (name: Cardinal; size: CGSize;
                                        flipped: Boolean; options: NSDictionary)
                                        : CIImage; cdecl;
                                        { class } function imageWithMTLTexture
                                        (texture: Pointer;
                                        options: NSDictionary): CIImage; cdecl;
                                        [MethodName('imageWithContentsOfURL:')]
                                        { class } function
                                        imageWithContentsOfURL(url: NSURL)
                                        : CIImage; cdecl;
                                        [MethodName
                                        ('imageWithContentsOfURL:options:')]
                                        { class } function
                                        imageWithContentsOfURLOptions
                                        (url: NSURL; options: NSDictionary)
                                        : CIImage; cdecl;
                                        [MethodName('imageWithData:')]
                                        { class } function imageWithData
                                        (data: NSData): CIImage; cdecl;
                                        [MethodName('imageWithData:options:')]
                                        { class } function imageWithDataOptions
                                        (data: NSData; options: NSDictionary)
                                        : CIImage; cdecl;
                                        [MethodName('imageWithCVImageBuffer:')]
                                        { class } function
                                        imageWithCVImageBuffer
                                        (imageBuffer: CVImageBufferRef)
                                        : CIImage; cdecl;
                                        [MethodName
                                        ('imageWithCVImageBuffer:options:')]
                                        { class } function
                                        imageWithCVImageBufferOptions
                                        (imageBuffer: CVImageBufferRef;
                                        options: NSDictionary): CIImage; cdecl;
                                        [MethodName('imageWithCVPixelBuffer:')]
                                        { class } function
                                        imageWithCVPixelBuffer
                                        (pixelBuffer: CVPixelBufferRef)
                                        : CIImage; cdecl;
                                        [MethodName
                                        ('imageWithCVPixelBuffer:options:')]
                                        { class } function
                                        imageWithCVPixelBufferOptions
                                        (pixelBuffer: CVPixelBufferRef;
                                        options: NSDictionary): CIImage; cdecl;
                                        { class } function imageWithColor
                                        (color: CIColor): CIImage; cdecl;
                                        { class } function emptyImage
                                        : CIImage; cdecl;
                                        [MethodName
                                        ('imageWithImageProvider:size::format:colorSpace:options:')
                                        ]
                                        { class } function
                                        imageWithImageProviderSizeFormatColorSpaceOptions
                                        (p: Pointer; size: LongWord;
                                        height: LongWord; format: CIFormat;
                                        colorSpace: CGColorSpaceRef;
                                        options: NSDictionary): CIImage; cdecl;
                                        end;
                                        CIImage = interface(NSObject)
                                        ['{D79573E6-178B-4C56-9727-6BC9315CAB12}']
                                        [MethodName('initWithCGImage:')]
                                        function initWithCGImage
                                        (image: CGImageRef)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName('initWithCGImage:options:')]
                                        function initWithCGImageOptions
                                        (image: CGImageRef;
                                        options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('initWithCGLayer:')]
                                        function initWithCGLayer
                                        (layer: CGLayerRef)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('initWithCGLayer:options:')]
                                        function initWithCGLayerOptions
                                        (layer: CGLayerRef;
                                        options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('initWithData:')]
                                        function initWithData(data: NSData)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('initWithData:options:')]
                                        function initWithDataOptions
                                        (data: NSData; options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithBitmapData
                                        (data: NSData; bytesPerRow: LongWord;
                                        size: CGSize; format: CIFormat;
                                        colorSpace: CGColorSpaceRef)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithTexture:size:flipped:colorSpace:')
                                        ]
                                        function initWithTextureSizeFlippedColorSpace
                                        (name: Cardinal; size: CGSize;
                                        flipped: Boolean;
                                        colorSpace: CGColorSpaceRef)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithTexture:size:flipped:options:')
                                        ]
                                        function initWithTextureSizeFlippedOptions
                                        (name: Cardinal; size: CGSize;
                                        flipped: Boolean; options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithMTLTexture
                                        (texture: Pointer;
                                        options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('initWithContentsOfURL:')]
                                        function initWithContentsOfURL
                                        (url: NSURL)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithContentsOfURL:options:')]
                                        function initWithContentsOfURLOptions
                                        (url: NSURL; options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('initWithCVImageBuffer:')]
                                        function initWithCVImageBuffer
                                        (imageBuffer: CVImageBufferRef)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithCVImageBuffer:options:')]
                                        function initWithCVImageBufferOptions
                                        (imageBuffer: CVImageBufferRef;
                                        options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('initWithCVPixelBuffer:')]
                                        function initWithCVPixelBuffer
                                        (pixelBuffer: CVPixelBufferRef)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithCVPixelBuffer:options:')]
                                        function initWithCVPixelBufferOptions
                                        (pixelBuffer: CVPixelBufferRef;
                                        options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithColor(color: CIColor)
                                        : Pointer { instancetype }; cdecl;
                                        function imageByApplyingTransform
                                        (matrix: CGAffineTransform)
                                        : CIImage; cdecl;
                                        function imageByApplyingOrientation
                                        (orientation: Integer): CIImage; cdecl;
                                        function imageTransformForOrientation
                                        (orientation: Integer)
                                        : CGAffineTransform; cdecl;
                                        function imageByCompositingOverImage
                                        (dest: CIImage): CIImage; cdecl;
                                        function imageByCroppingToRect
                                        (rect: CGRect): CIImage; cdecl;
                                        function imageByClampingToExtent
                                        : CIImage; cdecl;
                                        function imageByApplyingFilter
                                        (filterName: NSString;
                                        withInputParameters: NSDictionary)
                                        : CIImage; cdecl;
                                        function extent: CGRect; cdecl;
                                        function properties
                                        : NSDictionary; cdecl;
                                        function definition
                                        : CIFilterShape; cdecl;
                                        function url: NSURL; cdecl;
                                        function colorSpace
                                        : CGColorSpaceRef; cdecl;
                                        function regionOfInterestForImage
                                        (image: CIImage; inRect: CGRect)
                                        : CGRect; cdecl;
                                        function autoAdjustmentFiltersWithOptions
                                        (options: NSDictionary): NSArray; cdecl;
                                        [MethodName
                                        ('initWithImageProvider:size::format:colorSpace:options:')
                                        ]
                                        function initWithImageProviderSizeFormatColorSpaceOptions
                                        (p: Pointer; size: LongWord;
                                        height: LongWord; format: CIFormat;
                                        colorSpace: CGColorSpaceRef;
                                        options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        end;

                                        TCIImage = class
                                        (TOCGenericImport<
                                        CIImageClass, CIImage>)
                                        end;
                                        PCIImage = Pointer;

                                        CIFeatureClass = interface
                                        (NSObjectClass)
                                        ['{066E8D44-9F85-4500-8130-833875D0112F}']
                                        end;
                                        CIFeature = interface(NSObject)
                                        ['{9EC125CB-2BF3-4227-82E3-EA204AB0399A}']
                                        function &type: NSString;
                                        cdecl;
                                        function bounds: CGRect; cdecl;
                                        end;

                                        TCIFeature = class
                                        (TOCGenericImport<CIFeatureClass,
                                        CIFeature>)
                                        end;
                                        PCIFeature = Pointer;

                                        CIDetectorClass = interface
                                        (NSObjectClass)
                                        ['{618608AB-AA04-4751-B23D-1C096F951424}']
                                        { class } function detectorOfType
                                        (&type: NSString; context: CIContext;
                                        options: NSDictionary): CIDetector;
                                        cdecl;
                                        end;
                                        CIDetector = interface(NSObject)
                                        ['{60B47B76-9F18-4D1B-83E0-1BD6F6155CB7}']
                                        [MethodName('featuresInImage:')]
                                        function featuresInImage(image: CIImage)
                                        : NSArray;
                                        cdecl;
                                        [MethodName('featuresInImage:options:')]
                                        function featuresInImageOptions
                                        (image: CIImage; options: NSDictionary)
                                        : NSArray; cdecl;
                                        end;

                                        TCIDetector = class
                                        (TOCGenericImport<CIDetectorClass,
                                        CIDetector>)
                                        end;
                                        PCIDetector = Pointer;

                                        CIFaceFeatureClass = interface
                                        (CIFeatureClass)
                                        ['{F133BA4B-72BA-443C-B7D6-129252842B48}']
                                        end;
                                        CIFaceFeature = interface(CIFeature)
                                        ['{E470E35A-5924-49EE-B6F2-F9533561ED7E}']
                                        function bounds: CGRect;
                                        cdecl;
                                        function hasLeftEyePosition
                                        : Boolean; cdecl;
                                        function leftEyePosition
                                        : CGPoint; cdecl;
                                        function hasRightEyePosition
                                        : Boolean; cdecl;
                                        function rightEyePosition
                                        : CGPoint; cdecl;
                                        function hasMouthPosition
                                        : Boolean; cdecl;
                                        function mouthPosition: CGPoint; cdecl;
                                        function hasTrackingID: Boolean; cdecl;
                                        function trackingID: Integer; cdecl;
                                        function hasTrackingFrameCount
                                        : Boolean; cdecl;
                                        function trackingFrameCount
                                        : Integer; cdecl;
                                        function hasFaceAngle: Boolean; cdecl;
                                        function faceAngle: Single; cdecl;
                                        function hasSmile: Boolean; cdecl;
                                        function leftEyeClosed: Boolean; cdecl;
                                        function rightEyeClosed: Boolean; cdecl;
                                        end;

                                        TCIFaceFeature = class
                                        (TOCGenericImport<CIFaceFeatureClass,
                                        CIFaceFeature>)
                                        end;
                                        PCIFaceFeature = Pointer;

                                        CIRectangleFeatureClass = interface
                                        (CIFeatureClass)
                                        ['{34BEA080-407F-4CFC-8E31-F9AB43DF340C}']
                                        end;
                                        CIRectangleFeature = interface
                                        (CIFeature)
                                        ['{62BB5E05-4AEC-4614-A606-F357D44EAEC7}']
                                        function bounds: CGRect;
                                        cdecl;
                                        function topLeft: CGPoint; cdecl;
                                        function topRight: CGPoint; cdecl;
                                        function bottomLeft: CGPoint; cdecl;
                                        function bottomRight: CGPoint; cdecl;
                                        end;

                                        TCIRectangleFeature = class
                                        (TOCGenericImport<
                                        CIRectangleFeatureClass,
                                        CIRectangleFeature>)
                                        end;
                                        PCIRectangleFeature = Pointer;

                                        CIQRCodeFeatureClass = interface
                                        (CIFeatureClass)
                                        ['{D4951AB4-11C7-4B6F-89BD-BC4D492B1FF7}']
                                        end;
                                        CIQRCodeFeature = interface(CIFeature)
                                        ['{EF0A3E5D-658B-4589-B429-C687EF055A1D}']
                                        function bounds: CGRect;
                                        cdecl;
                                        function topLeft: CGPoint; cdecl;
                                        function topRight: CGPoint; cdecl;
                                        function bottomLeft: CGPoint; cdecl;
                                        function bottomRight: CGPoint; cdecl;
                                        function messageString: NSString; cdecl;
                                        end;

                                        TCIQRCodeFeature = class
                                        (TOCGenericImport<CIQRCodeFeatureClass,
                                        CIQRCodeFeature>)
                                        end;
                                        PCIQRCodeFeature = Pointer;

                                        CITextFeatureClass = interface
                                        (CIFeatureClass)
                                        ['{AB1C9B84-C4E2-4D8D-8920-C3AA4E846893}']
                                        end;
                                        CITextFeature = interface(CIFeature)
                                        ['{4EA990B7-DB9C-4962-B623-07537B2E0DAE}']
                                        function bounds: CGRect;
                                        cdecl;
                                        function topLeft: CGPoint; cdecl;
                                        function topRight: CGPoint; cdecl;
                                        function bottomLeft: CGPoint; cdecl;
                                        function bottomRight: CGPoint; cdecl;
                                        function subFeatures: NSArray; cdecl;
                                        end;

                                        TCITextFeature = class
                                        (TOCGenericImport<CITextFeatureClass,
                                        CITextFeature>)
                                        end;
                                        PCITextFeature = Pointer;

                                        CIKernelClass = interface(NSObjectClass)
                                        ['{BB6E6D70-92C8-4792-AC6F-54DF804949A1}']
                                        { class } function kernelsWithString
                                        (&string: NSString): NSArray;
                                        cdecl;
                                        { class } function kernelWithString
                                        (&string: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        CIKernel = interface(NSObject)
                                        ['{758EBE0A-8E10-44F2-A111-37B4AD6A9709}']
                                        function name: NSString;
                                        cdecl;
                                        procedure setROISelector
                                        (method: SEL); cdecl;
                                        function applyWithExtent(extent: CGRect;
                                        roiCallback: CIKernelROICallback;
                                        arguments: NSArray): CIImage; cdecl;
                                        end;

                                        TCIKernel = class
                                        (TOCGenericImport<CIKernelClass,
                                        CIKernel>)
                                        end;
                                        PCIKernel = Pointer;

                                        CIImageAccumulatorClass = interface
                                        (NSObjectClass)
                                        ['{ED77051A-B5B5-4E33-908D-FB776093DEED}']
                                        [MethodName
                                        ('imageAccumulatorWithExtent:format:')]
                                        { class } function
                                        imageAccumulatorWithExtentFormat
                                        (extent: CGRect; format: CIFormat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('imageAccumulatorWithExtent:format:colorSpace:')
                                        ]
                                        { class } function
                                        imageAccumulatorWithExtentFormatColorSpace
                                        (extent: CGRect; format: CIFormat;
                                        colorSpace: CGColorSpaceRef)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        CIImageAccumulator = interface(NSObject)
                                        ['{30356917-9F48-4398-8CD3-30C6DAFCC9C6}']
                                        [MethodName('initWithExtent:format:')]
                                        function initWithExtentFormat
                                        (extent: CGRect; format: CIFormat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('initWithExtent:format:colorSpace:')]
                                        function initWithExtentFormatColorSpace
                                        (extent: CGRect; format: CIFormat;
                                        colorSpace: CGColorSpaceRef)
                                        : Pointer { instancetype }; cdecl;
                                        function extent: CGRect; cdecl;
                                        function format: CIFormat; cdecl;
                                        function image: CIImage; cdecl;
                                        [MethodName('setImage:')]
                                        procedure setImage
                                        (image: CIImage); cdecl;
                                        [MethodName('setImage:dirtyRect:')]
                                        procedure setImageDirtyRect
                                        (image: CIImage;
                                        dirtyRect: CGRect); cdecl;
                                        procedure clear; cdecl;
                                        end;

                                        TCIImageAccumulator = class
                                        (TOCGenericImport<
                                        CIImageAccumulatorClass,
                                        CIImageAccumulator>)
                                        end;
                                        PCIImageAccumulator = Pointer;

                                        CIImageProvider = interface(IObjectiveC)
                                        ['{7092534F-EBFE-419D-BE16-1F68EC437DCC}']
                                        [MethodName
                                        ('provideImageData:bytesPerRow:origin::size::userInfo:')
                                        ]
                                        procedure provideImageDataBytesPerRowOriginSizeUserInfo
                                        (data: Pointer; bytesPerRow: LongWord;
                                        origin: LongWord; y: LongWord;
                                        size: LongWord; height: LongWord;
                                        userInfo: Pointer);
                                        cdecl;
                                        end;

                                        CIColorKernelClass = interface
                                        (CIKernelClass)
                                        ['{AFC79C97-05C6-447E-8EB5-F744D8DA5848}']
                                        { class } function kernelWithString
                                        (&string: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        CIColorKernel = interface(CIKernel)
                                        ['{0FFCE363-DB45-4DED-AD7D-C75E9E514B55}']
                                        function applyWithExtent(extent: CGRect;
                                        arguments: NSArray): CIImage;
                                        cdecl;
                                        end;

                                        TCIColorKernel = class
                                        (TOCGenericImport<CIColorKernelClass,
                                        CIColorKernel>)
                                        end;
                                        PCIColorKernel = Pointer;

                                        CIWarpKernelClass = interface
                                        (CIKernelClass)
                                        ['{FA1AA636-52FC-4E18-8D93-7F8E1884D9C5}']
                                        { class } function kernelWithString
                                        (&string: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        CIWarpKernel = interface(CIKernel)
                                        ['{68DBE2D7-256A-4E52-9510-AB9D841AC893}']
                                        function applyWithExtent(extent: CGRect;
                                        roiCallback: CIKernelROICallback;
                                        inputImage: CIImage; arguments: NSArray)
                                        : CIImage;
                                        cdecl;
                                        end;

                                        TCIWarpKernel = class
                                        (TOCGenericImport<CIWarpKernelClass,
                                        CIWarpKernel>)
                                        end;
                                        PCIWarpKernel = Pointer;

                                        CISamplerClass = interface
                                        (NSObjectClass)
                                        ['{11976324-B7E0-4E2F-80D9-B447217BC570}']
                                        [MethodName('samplerWithImage:')]
                                        { class } function samplerWithImage
                                        (im: CIImage): Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('samplerWithImage:keysAndValues:')]
                                        { class } function
                                        samplerWithImageKeysAndValues
                                        (im: CIImage; keysAndValues: Pointer)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('samplerWithImage:options:')]
                                        { class } function
                                        samplerWithImageOptions(im: CIImage;
                                        options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        CISampler = interface(NSObject)
                                        ['{FDD52C70-13F7-47F7-96F9-65823324FA27}']
                                        [MethodName('initWithImage:')]
                                        function initWithImage(im: CIImage)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('initWithImage:keysAndValues:')]
                                        function initWithImageKeysAndValues
                                        (im: CIImage; keysAndValues: Pointer)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('initWithImage:options:')]
                                        function initWithImageOptions
                                        (im: CIImage; options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        function definition
                                        : CIFilterShape; cdecl;
                                        function extent: CGRect; cdecl;
                                        end;

                                        TCISampler = class
                                        (TOCGenericImport<CISamplerClass,
                                        CISampler>)
                                        end;
                                        PCISampler = Pointer;

                                        // ===== Protocol declarations =====

                                        MTLCommandBuffer = interface
                                        (IObjectiveC)
                                        ['{C1E8B7FE-696C-4485-BCFD-BDD83EF1BEC3}']
                                        end;

                                        CIFilterConstructor = interface
                                        (IObjectiveC)
                                        ['{95DDBA5E-FBBC-4D1B-A941-D92C708F93F4}']
                                        function filterWithName(name: NSString)
                                        : CIFilter;
                                        cdecl;
                                        end;

                                        // ===== Exported string consts =====

                                        function kCIFormatARGB8: Pointer;
                                        function kCIFormatBGRA8: Pointer;
                                        function kCIFormatRGBA8: Pointer;
                                        function kCIFormatABGR8: Pointer;
                                        function kCIFormatRGBA16: Pointer;
                                        function kCIFormatRGBAf: Pointer;
                                        function kCIFormatRGBAh: Pointer;
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
                                        function kCIImageColorSpace: NSString;
                                        function kCIImageProperties: NSString;
                                        function kCIImageTextureTarget
                                        : NSString;
                                        function kCIImageTextureFormat
                                        : NSString;
                                        function kCIImageAutoAdjustEnhance
                                        : NSString;
                                        function kCIImageAutoAdjustRedEye
                                        : NSString;
                                        function kCIImageAutoAdjustFeatures
                                        : NSString;
                                        function kCIImageAutoAdjustCrop
                                        : NSString;
                                        function kCIImageAutoAdjustLevel
                                        : NSString;
                                        function kCIContextOutputColorSpace
                                        : NSString;
                                        function kCIContextWorkingColorSpace
                                        : NSString;
                                        function kCIContextWorkingFormat
                                        : NSString;
                                        function kCIContextHighQualityDownsample
                                        : NSString;
                                        function kCIContextUseSoftwareRenderer
                                        : NSString;
                                        function kCIContextPriorityRequestLow
                                        : NSString;
                                        function CIDetectorTypeFace: NSString;
                                        function CIDetectorTypeRectangle
                                        : NSString;
                                        function CIDetectorTypeQRCode: NSString;
                                        function CIDetectorTypeText: NSString;
                                        function CIDetectorAccuracy: NSString;
                                        function CIDetectorAccuracyLow
                                        : NSString;
                                        function CIDetectorAccuracyHigh
                                        : NSString;
                                        function CIDetectorTracking: NSString;
                                        function CIDetectorMinFeatureSize
                                        : NSString;
                                        function CIDetectorNumberOfAngles
                                        : NSString;
                                        function CIDetectorImageOrientation
                                        : NSString;
                                        function CIDetectorEyeBlink: NSString;
                                        function CIDetectorSmile: NSString;
                                        function CIDetectorFocalLength
                                        : NSString;
                                        function CIDetectorAspectRatio
                                        : NSString;
                                        function CIDetectorReturnSubFeatures
                                        : NSString;
                                        function CIFeatureTypeFace: NSString;
                                        function CIFeatureTypeRectangle
                                        : NSString;
                                        function CIFeatureTypeQRCode: NSString;
                                        function CIFeatureTypeText: NSString;
                                        function kCIAttributeFilterName
                                        : NSString;
                                        function kCIAttributeFilterDisplayName
                                        : NSString;
                                        function kCIAttributeDescription
                                        : NSString;
                                        function kCIAttributeFilterAvailable_Mac
                                        : NSString;
                                        function kCIAttributeFilterAvailable_iOS
                                        : NSString;
                                        function kCIAttributeReferenceDocumentation
                                        : NSString;
                                        function kCIAttributeFilterCategories
                                        : NSString;
                                        function kCIAttributeClass: NSString;
                                        function kCIAttributeType: NSString;
                                        function kCIAttributeMin: NSString;
                                        function kCIAttributeMax: NSString;
                                        function kCIAttributeSliderMin
                                        : NSString;
                                        function kCIAttributeSliderMax
                                        : NSString;
                                        function kCIAttributeDefault: NSString;
                                        function kCIAttributeIdentity: NSString;
                                        function kCIAttributeName: NSString;
                                        function kCIAttributeDisplayName
                                        : NSString;
                                        function kCIUIParameterSet: NSString;
                                        function kCIUISetBasic: NSString;
                                        function kCIUISetIntermediate: NSString;
                                        function kCIUISetAdvanced: NSString;
                                        function kCIUISetDevelopment: NSString;
                                        function kCIAttributeTypeTime: NSString;
                                        function kCIAttributeTypeScalar
                                        : NSString;
                                        function kCIAttributeTypeDistance
                                        : NSString;
                                        function kCIAttributeTypeAngle
                                        : NSString;
                                        function kCIAttributeTypeBoolean
                                        : NSString;
                                        function kCIAttributeTypeInteger
                                        : NSString;
                                        function kCIAttributeTypeCount
                                        : NSString;
                                        function kCIAttributeTypePosition
                                        : NSString;
                                        function kCIAttributeTypeOffset
                                        : NSString;
                                        function kCIAttributeTypePosition3
                                        : NSString;
                                        function kCIAttributeTypeRectangle
                                        : NSString;
                                        function kCIAttributeTypeOpaqueColor
                                        : NSString;
                                        function kCIAttributeTypeColor
                                        : NSString;
                                        function kCIAttributeTypeGradient
                                        : NSString;
                                        function kCIAttributeTypeImage
                                        : NSString;
                                        function kCIAttributeTypeTransform
                                        : NSString;
                                        function kCICategoryDistortionEffect
                                        : NSString;
                                        function kCICategoryGeometryAdjustment
                                        : NSString;
                                        function kCICategoryCompositeOperation
                                        : NSString;
                                        function kCICategoryHalftoneEffect
                                        : NSString;
                                        function kCICategoryColorAdjustment
                                        : NSString;
                                        function kCICategoryColorEffect
                                        : NSString;
                                        function kCICategoryTransition
                                        : NSString;
                                        function kCICategoryTileEffect
                                        : NSString;
                                        function kCICategoryGenerator: NSString;
                                        function kCICategoryReduction: NSString;
                                        function kCICategoryGradient: NSString;
                                        function kCICategoryStylize: NSString;
                                        function kCICategorySharpen: NSString;
                                        function kCICategoryBlur: NSString;
                                        function kCICategoryVideo: NSString;
                                        function kCICategoryStillImage
                                        : NSString;
                                        function kCICategoryInterlaced
                                        : NSString;
                                        function kCICategoryNonSquarePixels
                                        : NSString;
                                        function kCICategoryHighDynamicRange
                                        : NSString;
                                        function kCICategoryBuiltIn: NSString;
                                        function kCICategoryFilterGenerator
                                        : NSString;
                                        function kCIApplyOptionExtent: NSString;
                                        function kCIApplyOptionDefinition
                                        : NSString;
                                        function kCIApplyOptionUserInfo
                                        : NSString;
                                        function kCIApplyOptionColorSpace
                                        : NSString;
                                        function kCIOutputImageKey: NSString;
                                        function kCIInputBackgroundImageKey
                                        : NSString;
                                        function kCIInputImageKey: NSString;
                                        function kCIInputTimeKey: NSString;
                                        function kCIInputTransformKey: NSString;
                                        function kCIInputScaleKey: NSString;
                                        function kCIInputAspectRatioKey
                                        : NSString;
                                        function kCIInputCenterKey: NSString;
                                        function kCIInputRadiusKey: NSString;
                                        function kCIInputAngleKey: NSString;
                                        function kCIInputRefractionKey
                                        : NSString;
                                        function kCIInputWidthKey: NSString;
                                        function kCIInputSharpnessKey: NSString;
                                        function kCIInputIntensityKey: NSString;
                                        function kCIInputEVKey: NSString;
                                        function kCIInputSaturationKey
                                        : NSString;
                                        function kCIInputColorKey: NSString;
                                        function kCIInputBrightnessKey
                                        : NSString;
                                        function kCIInputContrastKey: NSString;
                                        function kCIInputBiasKey: NSString;
                                        function kCIInputWeightsKey: NSString;
                                        function kCIInputGradientImageKey
                                        : NSString;
                                        function kCIInputMaskImageKey: NSString;
                                        function kCIInputShadingImageKey
                                        : NSString;
                                        function kCIInputTargetImageKey
                                        : NSString;
                                        function kCIInputExtentKey: NSString;
                                        function kCIInputVersionKey: NSString;
                                        function kCIImageProviderTileSize
                                        : NSString;
                                        function kCIImageProviderUserInfo
                                        : NSString;
                                        function kCISamplerAffineMatrix
                                        : NSString;
                                        function kCISamplerWrapMode: NSString;
                                        function kCISamplerFilterMode: NSString;
                                        function kCISamplerWrapBlack: NSString;
                                        function kCISamplerWrapClamp: NSString;
                                        function kCISamplerFilterNearest
                                        : NSString;
                                        function kCISamplerFilterLinear
                                        : NSString;
                                        function kCISamplerColorSpace: NSString;


                                        // ===== External functions =====

                                        const
                                        libCoreImage =
                                        '/System/Library/Frameworks/CoreImage.framework/CoreImage';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreImageModule: THandle;

{$ENDIF IOS}

function kCIImageColorSpace: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIImageColorSpace');
end;

function kCIImageProperties: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIImageProperties');
end;

function kCIImageTextureTarget: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIImageTextureTarget');
end;

function kCIImageTextureFormat: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIImageTextureFormat');
end;

function kCIImageAutoAdjustEnhance: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIImageAutoAdjustEnhance');
end;

function kCIImageAutoAdjustRedEye: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIImageAutoAdjustRedEye');
end;

function kCIImageAutoAdjustFeatures: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIImageAutoAdjustFeatures');
end;

function kCIImageAutoAdjustCrop: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIImageAutoAdjustCrop');
end;

function kCIImageAutoAdjustLevel: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIImageAutoAdjustLevel');
end;

function kCIContextOutputColorSpace: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIContextOutputColorSpace');
end;

function kCIContextWorkingColorSpace: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIContextWorkingColorSpace');
end;

function kCIContextWorkingFormat: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIContextWorkingFormat');
end;

function kCIContextHighQualityDownsample: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIContextHighQualityDownsample');
end;

function kCIContextUseSoftwareRenderer: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIContextUseSoftwareRenderer');
end;

function kCIContextPriorityRequestLow: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIContextPriorityRequestLow');
end;

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

function kCIImageProviderTileSize: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIImageProviderTileSize');
end;

function kCIImageProviderUserInfo: NSString;
begin
  Result := CocoaNSStringConst(libCoreImage, 'kCIImageProviderUserInfo');
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

function kCIFormatRGBA16: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatRGBA16');
end;

function kCIFormatRGBAf: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatRGBAf');
end;

function kCIFormatRGBAh: Pointer;
begin
  Result := CocoaPointerConst(libCoreImage, 'kCIFormatRGBAh');
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

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreImageModule := dlopen(MarshaledAString(libCoreImage), RTLD_LAZY);

finalization

dlclose(CoreImageModule);
{$ENDIF IOS}

end.
