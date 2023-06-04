{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework MetalKit
//

unit iOSapi.MetalKit;

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
  iOSapi.Foundation,
  iOSapi.Metal,
  iOSapi.UIKit;

type

  // ===== Forward declarations =====
{$M+}
  MTKViewDelegate = interface;
  MTKView = interface;
  MTKTextureLoader = interface;
  MTKMeshBufferAllocator = interface;
  MTKMeshBuffer = interface;
  MTKMesh = interface;
  MTKSubmesh = interface;

  // ===== Framework typedefs =====
{$M+}
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

  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  MTLTextureUsage = NSUInteger;
  MTLPixelFormat = NSUInteger;
  MTLStorageMode = NSUInteger;

  MTLClearColor = record
    red: Double;
    green: Double;
    blue: Double;
    alpha: Double;
  end;

  PMTLClearColor = ^MTLClearColor;

  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  CGColorSpaceRef = Pointer;
  PCGColorSpaceRef = ^CGColorSpaceRef;
  MTKTextureLoaderError = NSString;
  PMTKTextureLoaderError = ^MTKTextureLoaderError;
  MTKTextureLoaderOption = NSString;
  PMTKTextureLoaderOption = ^MTKTextureLoaderOption;
  MTKTextureLoaderCubeLayout = NSString;
  PMTKTextureLoaderCubeLayout = ^MTKTextureLoaderCubeLayout;
  MTKTextureLoaderOrigin = NSString;
  PMTKTextureLoaderOrigin = ^MTKTextureLoaderOrigin;
  MTKTextureLoaderCallback = procedure(param1: Pointer; param2: NSError)
    of object;
  MTKTextureLoaderArrayCallback = procedure(param1: NSArray; param2: NSError)
    of object;
  CGImageRef = Pointer;
  PCGImageRef = ^CGImageRef;
  MTKModelError = NSString;
  PMTKModelError = ^MTKModelError;
  MTLPrimitiveType = NSUInteger;
  MTLIndexType = NSUInteger;
  MTLVertexFormat = NSUInteger;
  // ===== Interface declarations =====

  MTKViewClass = interface(UIViewClass)
    ['{D5BEAF3A-B69E-47A0-956A-C3F093D6C34C}']
  end;

  MTKView = interface(UIView)
    ['{66B39BE4-485B-40CC-855C-BF912ED50912}']
    function initWithFrame(frameRect: CGRect; device: Pointer)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setDevice(device: Pointer); cdecl;
    function device: Pointer; cdecl;
    function currentDrawable: Pointer; cdecl;
    procedure setFramebufferOnly(framebufferOnly: Boolean); cdecl;
    function framebufferOnly: Boolean; cdecl;
    procedure setDepthStencilAttachmentTextureUsage
      (depthStencilAttachmentTextureUsage: MTLTextureUsage); cdecl;
    function depthStencilAttachmentTextureUsage: MTLTextureUsage; cdecl;
    procedure setMultisampleColorAttachmentTextureUsage
      (multisampleColorAttachmentTextureUsage: MTLTextureUsage); cdecl;
    function multisampleColorAttachmentTextureUsage: MTLTextureUsage; cdecl;
    procedure setPresentsWithTransaction(presentsWithTransaction
      : Boolean); cdecl;
    function presentsWithTransaction: Boolean; cdecl;
    procedure setColorPixelFormat(colorPixelFormat: MTLPixelFormat); cdecl;
    function colorPixelFormat: MTLPixelFormat; cdecl;
    procedure setDepthStencilPixelFormat(depthStencilPixelFormat
      : MTLPixelFormat); cdecl;
    function depthStencilPixelFormat: MTLPixelFormat; cdecl;
    procedure setDepthStencilStorageMode(depthStencilStorageMode
      : MTLStorageMode); cdecl;
    function depthStencilStorageMode: MTLStorageMode; cdecl;
    procedure setSampleCount(sampleCount: NSUInteger); cdecl;
    function sampleCount: NSUInteger; cdecl;
    procedure setClearColor(clearColor: MTLClearColor); cdecl;
    function clearColor: MTLClearColor; cdecl;
    procedure setClearDepth(clearDepth: Double); cdecl;
    function clearDepth: Double; cdecl;
    procedure setClearStencil(clearStencil: LongWord); cdecl;
    function clearStencil: LongWord; cdecl;
    function depthStencilTexture: Pointer; cdecl;
    function multisampleColorTexture: Pointer; cdecl;
    procedure releaseDrawables; cdecl;
    function currentRenderPassDescriptor: MTLRenderPassDescriptor; cdecl;
    procedure setPreferredFramesPerSecond(preferredFramesPerSecond
      : NSInteger); cdecl;
    function preferredFramesPerSecond: NSInteger; cdecl;
    procedure setEnableSetNeedsDisplay(enableSetNeedsDisplay: Boolean); cdecl;
    function enableSetNeedsDisplay: Boolean; cdecl;
    procedure setAutoResizeDrawable(autoResizeDrawable: Boolean); cdecl;
    function autoResizeDrawable: Boolean; cdecl;
    procedure setDrawableSize(drawableSize: CGSize); cdecl;
    function drawableSize: CGSize; cdecl;
    function preferredDrawableSize: CGSize; cdecl;
    function preferredDevice: Pointer; cdecl;
    procedure setPaused(paused: Boolean); cdecl;
    function isPaused: Boolean; cdecl;
    procedure setColorspace(colorspace: CGColorSpaceRef); cdecl;
    function colorspace: CGColorSpaceRef; cdecl;
    procedure draw; cdecl;
  end;

  TMTKView = class(TOCGenericImport<MTKViewClass, MTKView>)
  end;

  PMTKView = Pointer;

  MTKTextureLoaderClass = interface(NSObjectClass)
    ['{76C42E6F-03D6-4115-9B86-659EE1924EA5}']
  end;

  MTKTextureLoader = interface(NSObject)
    ['{E138A837-02A3-4CAB-8B2D-2AFBD4AEF801}']
    function device: Pointer; cdecl;
    function initWithDevice(device: Pointer): Pointer { instancetype }; cdecl;
    [MethodName('newTextureWithContentsOfURL:options:completionHandler:')]
    procedure newTextureWithContentsOfURLOptionsCompletionHandler(URL: NSURL;
      options: NSDictionary;
      completionHandler: MTKTextureLoaderCallback); cdecl;
    [MethodName
      ('newTextureWithName:scaleFactor:bundle:options:completionHandler:')]
    procedure newTextureWithNameScaleFactorBundleOptionsCompletionHandler
      (name: NSString; scaleFactor: CGFloat; bundle: NSBundle;
      options: NSDictionary;
      completionHandler: MTKTextureLoaderCallback); cdecl;
    [MethodName('newTexturesWithContentsOfURLs:options:completionHandler:')]
    procedure newTexturesWithContentsOfURLsOptionsCompletionHandler
      (URLs: NSArray; options: NSDictionary;
      completionHandler: MTKTextureLoaderArrayCallback); cdecl;
    procedure newTexturesWithNames(names: NSArray; scaleFactor: CGFloat;
      bundle: NSBundle; options: NSDictionary;
      completionHandler: MTKTextureLoaderArrayCallback); cdecl;
    [MethodName('newTextureWithData:options:completionHandler:')]
    procedure newTextureWithDataOptionsCompletionHandler(data: NSData;
      options: NSDictionary;
      completionHandler: MTKTextureLoaderCallback); cdecl;
    [MethodName('newTextureWithCGImage:options:completionHandler:')]
    procedure newTextureWithCGImageOptionsCompletionHandler(cgImage: CGImageRef;
      options: NSDictionary;
      completionHandler: MTKTextureLoaderCallback); cdecl;
    [MethodName('newTextureWithMDLTexture:options:completionHandler:')]
    procedure newTextureWithMDLTextureOptionsCompletionHandler
      (texture: MDLTexture; options: NSDictionary;
      completionHandler: MTKTextureLoaderCallback); cdecl;
    [MethodName('newTextureWithContentsOfURL:options:error:')]
    function newTextureWithContentsOfURLOptionsError(URL: NSURL;
      options: NSDictionary; error: NSError): Pointer; cdecl;
    [MethodName('newTexturesWithContentsOfURLs:options:error:')]
    function newTexturesWithContentsOfURLsOptionsError(URLs: NSArray;
      options: NSDictionary; error: NSError): NSArray; cdecl;
    [MethodName('newTextureWithData:options:error:')]
    function newTextureWithDataOptionsError(data: NSData; options: NSDictionary;
      error: NSError): Pointer; cdecl;
    [MethodName('newTextureWithCGImage:options:error:')]
    function newTextureWithCGImageOptionsError(cgImage: CGImageRef;
      options: NSDictionary; error: NSError): Pointer; cdecl;
    [MethodName('newTextureWithMDLTexture:options:error:')]
    function newTextureWithMDLTextureOptionsError(texture: MDLTexture;
      options: NSDictionary; error: NSError): Pointer; cdecl;
    [MethodName('newTextureWithName:scaleFactor:bundle:options:error:')]
    function newTextureWithNameScaleFactorBundleOptionsError(name: NSString;
      scaleFactor: CGFloat; bundle: NSBundle; options: NSDictionary;
      error: NSError): Pointer; cdecl;
  end;

  TMTKTextureLoader = class(TOCGenericImport<MTKTextureLoaderClass,
    MTKTextureLoader>)
  end;

  PMTKTextureLoader = Pointer;

  MTKMeshBufferAllocatorClass = interface(NSObjectClass)
    ['{4AD4F5D1-95E7-426A-93B1-F3D1A63BC93F}']
  end;

  MTKMeshBufferAllocator = interface(NSObject)
    ['{ECA637B5-77A5-4A6D-ACF7-C0D0F9525709}']
    function initWithDevice(device: Pointer): Pointer { instancetype }; cdecl;
    function device: Pointer; cdecl;
  end;

  TMTKMeshBufferAllocator = class(TOCGenericImport<MTKMeshBufferAllocatorClass,
    MTKMeshBufferAllocator>)
  end;

  PMTKMeshBufferAllocator = Pointer;

  MTKMeshBufferClass = interface(NSObjectClass)
    ['{C0F4FFF1-3CA6-4288-920C-19A8F0D18FDA}']
  end;

  MTKMeshBuffer = interface(NSObject)
    ['{7264E5EC-B8F0-4D90-95D0-F350527B3D7A}']
    function length: NSUInteger; cdecl;
    function allocator: MTKMeshBufferAllocator; cdecl;
    function zone: Pointer; cdecl;
    function buffer: Pointer; cdecl;
    function offset: NSUInteger; cdecl;
    function &type: Integer; cdecl;
  end;

  TMTKMeshBuffer = class(TOCGenericImport<MTKMeshBufferClass, MTKMeshBuffer>)
  end;

  PMTKMeshBuffer = Pointer;

  MTKMeshClass = interface(NSObjectClass)
    ['{CA6B444C-2CB7-46A0-9E28-05C3609C7B26}']
    { class } function newMeshesFromAsset(asset: Pointer; device: Pointer;
      sourceMeshes: NSArray; error: NSError): NSArray; cdecl;
  end;

  MTKMesh = interface(NSObject)
    ['{B4727A0B-A55E-44B1-AAC9-7B5631178A12}']
    function initWithMesh(mesh: Pointer; device: Pointer; error: NSError)
      : Pointer { instancetype }; cdecl;
    function vertexBuffers: NSArray; cdecl;
    function vertexDescriptor: PInteger; cdecl;
    function submeshes: NSArray; cdecl;
    function vertexCount: NSUInteger; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TMTKMesh = class(TOCGenericImport<MTKMeshClass, MTKMesh>)
  end;

  PMTKMesh = Pointer;

  MTKSubmeshClass = interface(NSObjectClass)
    ['{341C7624-A99E-4826-8281-4538C299C11D}']
  end;

  MTKSubmesh = interface(NSObject)
    ['{C7EBDEB3-AAA8-4C68-86A1-A280B848C13A}']
    function primitiveType: MTLPrimitiveType; cdecl;
    function indexType: MTLIndexType; cdecl;
    function indexBuffer: MTKMeshBuffer; cdecl;
    function indexCount: NSUInteger; cdecl;
    function mesh: MTKMesh; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TMTKSubmesh = class(TOCGenericImport<MTKSubmeshClass, MTKSubmesh>)
  end;

  PMTKSubmesh = Pointer;

  // ===== Protocol declarations =====

  MTKViewDelegate = interface(IObjectiveC)
    ['{BE28AAE3-4F23-4184-85EC-A11C315BCAC1}']
    procedure MTKView(view: MTKView; drawableSizeWillChange: CGSize); cdecl;
    procedure drawInMTKView(view: MTKView); cdecl;
  end;

  // ===== Exported string consts =====

function MTKTextureLoaderErrorDomain: Pointer;
function MTKTextureLoaderErrorKey: Pointer;
function MTKTextureLoaderOptionAllocateMipmaps: Pointer;
function MTKTextureLoaderOptionGenerateMipmaps: Pointer;
function MTKTextureLoaderOptionSRGB: Pointer;
function MTKTextureLoaderOptionTextureUsage: Pointer;
function MTKTextureLoaderOptionTextureCPUCacheMode: Pointer;
function MTKTextureLoaderOptionTextureStorageMode: Pointer;
function MTKTextureLoaderOptionCubeLayout: Pointer;
function MTKTextureLoaderCubeLayoutVertical: Pointer;
function MTKTextureLoaderOptionOrigin: Pointer;
function MTKTextureLoaderOriginTopLeft: Pointer;
function MTKTextureLoaderOriginBottomLeft: Pointer;
function MTKTextureLoaderOriginFlippedVertically: Pointer;
function MTKModelErrorDomain: Pointer;
function MTKModelErrorKey: Pointer;


// ===== External functions =====

const
  libMetalKit = '/System/Library/Frameworks/MetalKit.framework/MetalKit';
function MTKModelIOVertexDescriptorFromMetal(metalDescriptor
  : Pointer { MTLVertexDescriptor } ): PInteger; cdecl;
  external libMetalKit name _PU + 'MTKModelIOVertexDescriptorFromMetal';
function MTKModelIOVertexDescriptorFromMetalWithError(metalDescriptor
  : Pointer { MTLVertexDescriptor }; error: Pointer { NSError } ): PInteger;
  cdecl; external libMetalKit name _PU +
  'MTKModelIOVertexDescriptorFromMetalWithError';
function MTKMetalVertexDescriptorFromModelIO(modelIODescriptor: PInteger)
  : Pointer { MTLVertexDescriptor }; cdecl;
  external libMetalKit name _PU + 'MTKMetalVertexDescriptorFromModelIO';
function MTKMetalVertexDescriptorFromModelIOWithError(modelIODescriptor
  : PInteger; error: Pointer { NSError } ): Pointer { MTLVertexDescriptor };
  cdecl; external libMetalKit name _PU +
  'MTKMetalVertexDescriptorFromModelIOWithError';
function MTKModelIOVertexFormatFromMetal(vertexFormat: MTLVertexFormat)
  : Integer; cdecl; external libMetalKit name _PU +
  'MTKModelIOVertexFormatFromMetal';
function MTKMetalVertexFormatFromModelIO(vertexFormat: Integer)
  : MTLVertexFormat; cdecl;
  external libMetalKit name _PU + 'MTKMetalVertexFormatFromModelIO';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  MetalKitModule: THandle;

{$ENDIF IOS}

function MTKTextureLoaderErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit, 'MTKTextureLoaderErrorDomain');
end;

function MTKTextureLoaderErrorKey: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit, 'MTKTextureLoaderErrorKey');
end;

function MTKTextureLoaderOptionAllocateMipmaps: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit,
    'MTKTextureLoaderOptionAllocateMipmaps');
end;

function MTKTextureLoaderOptionGenerateMipmaps: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit,
    'MTKTextureLoaderOptionGenerateMipmaps');
end;

function MTKTextureLoaderOptionSRGB: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit, 'MTKTextureLoaderOptionSRGB');
end;

function MTKTextureLoaderOptionTextureUsage: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit,
    'MTKTextureLoaderOptionTextureUsage');
end;

function MTKTextureLoaderOptionTextureCPUCacheMode: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit,
    'MTKTextureLoaderOptionTextureCPUCacheMode');
end;

function MTKTextureLoaderOptionTextureStorageMode: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit,
    'MTKTextureLoaderOptionTextureStorageMode');
end;

function MTKTextureLoaderOptionCubeLayout: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit, 'MTKTextureLoaderOptionCubeLayout');
end;

function MTKTextureLoaderCubeLayoutVertical: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit,
    'MTKTextureLoaderCubeLayoutVertical');
end;

function MTKTextureLoaderOptionOrigin: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit, 'MTKTextureLoaderOptionOrigin');
end;

function MTKTextureLoaderOriginTopLeft: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit, 'MTKTextureLoaderOriginTopLeft');
end;

function MTKTextureLoaderOriginBottomLeft: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit, 'MTKTextureLoaderOriginBottomLeft');
end;

function MTKTextureLoaderOriginFlippedVertically: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit,
    'MTKTextureLoaderOriginFlippedVertically');
end;

function MTKModelErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit, 'MTKModelErrorDomain');
end;

function MTKModelErrorKey: Pointer;
begin
  Result := CocoaPointerConst(libMetalKit, 'MTKModelErrorKey');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MetalKitModule := dlopen(MarshaledAString(libMetalKit), RTLD_LAZY);

finalization

dlclose(MetalKitModule);
{$ENDIF IOS}

end.
