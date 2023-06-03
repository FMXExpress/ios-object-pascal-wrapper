{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework GLKit
//

unit iOSapi.GLKit;

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
  iOSapi.OpenGLES,
  iOSapi.UIKit;

const
  GLKLightingTypePerVertex = 0;
  GLKLightingTypePerPixel = 1;
  GLKTextureTarget2D = 3553;
  GLKTextureTargetCubeMap = 34067;
  GLKTextureTargetCt = 2;
  GLKTextureEnvModeReplace = 0;
  GLKTextureEnvModeModulate = 1;
  GLKTextureEnvModeDecal = 2;
  GLKFogModeExp = 0;
  GLKFogModeExp2 = 1;
  GLKFogModeLinear = 2;
  GLKVertexAttribPosition = 0;
  GLKVertexAttribNormal = 1;
  GLKVertexAttribColor = 2;
  GLKVertexAttribTexCoord0 = 3;
  GLKVertexAttribTexCoord1 = 4;
  GLKViewDrawableColorFormatRGBA8888 = 0;
  GLKViewDrawableColorFormatRGB565 = 1;
  GLKViewDrawableColorFormatSRGBA8888 = 2;
  GLKViewDrawableDepthFormatNone = 0;
  GLKViewDrawableDepthFormat16 = 1;
  GLKViewDrawableDepthFormat24 = 2;
  GLKViewDrawableStencilFormatNone = 0;
  GLKViewDrawableStencilFormat8 = 1;
  GLKViewDrawableMultisampleNone = 0;
  GLKViewDrawableMultisample4X = 1;
  GLKTextureLoaderErrorFileOrURLNotFound = 0;
  GLKTextureLoaderErrorInvalidNSData = 1;
  GLKTextureLoaderErrorInvalidCGImage = 2;
  GLKTextureLoaderErrorUnknownPathType = 3;
  GLKTextureLoaderErrorUnknownFileType = 4;
  GLKTextureLoaderErrorPVRAtlasUnsupported = 5;
  GLKTextureLoaderErrorCubeMapInvalidNumFiles = 6;
  GLKTextureLoaderErrorCompressedTextureUpload = 7;
  GLKTextureLoaderErrorUncompressedTextureUpload = 8;
  GLKTextureLoaderErrorUnsupportedCubeMapDimensions = 9;
  GLKTextureLoaderErrorUnsupportedBitDepth = 10;
  GLKTextureLoaderErrorUnsupportedPVRFormat = 11;
  GLKTextureLoaderErrorDataPreprocessingFailure = 12;
  GLKTextureLoaderErrorMipmapUnsupported = 13;
  GLKTextureLoaderErrorUnsupportedOrientation = 14;
  GLKTextureLoaderErrorReorientationFailure = 15;
  GLKTextureLoaderErrorAlphaPremultiplicationFailure = 16;
  GLKTextureLoaderErrorInvalidEAGLContext = 17;
  GLKTextureLoaderErrorIncompatibleFormatSRGB = 18;
  GLKTextureLoaderErrorUnsupportedTextureTarget = 19;
  GLKTextureInfoAlphaStateNone = 0;
  GLKTextureInfoAlphaStateNonPremultiplied = 1;
  GLKTextureInfoAlphaStatePremultiplied = 2;
  GLKTextureInfoOriginUnknown = 0;
  GLKTextureInfoOriginTopLeft = 1;
  GLKTextureInfoOriginBottomLeft = 2;

type

  // ===== Forward declarations =====
{$M+}
  GLKNamedEffect = interface;
  GLKEffectProperty = interface;
  GLKEffectPropertyTransform = interface;
  GLKEffectPropertyLight = interface;
  GLKEffectPropertyMaterial = interface;
  GLKEffectPropertyTexture = interface;
  GLKEffectPropertyFog = interface;
  GLKBaseEffect = interface;
  GLKReflectionMapEffect = interface;
  GLKSkyboxEffect = interface;
  GLKViewDelegate = interface;
  GLKView = interface;
  GLKViewControllerDelegate = interface;
  GLKViewController = interface;
  GLKMeshBufferAllocator = interface;
  GLKMeshBuffer = interface;
  GLKMesh = interface;
  GLKSubmesh = interface;
  GLKTextureInfo = interface;
  GLKTextureLoader = interface;

  // ===== Framework typedefs =====
{$M+}

  _GLKMatrix2 = record
    case Integer of
      0:
        (m00: Single;
          m01: Single;
          m10: Single;
          m11: Single;
        );
      1:
        (m2: array [0 .. 1] of array [0 .. 1] of Single);
      2:
        (m: array [0 .. 3] of Single);
  end;

  P_GLKMatrix2 = ^_GLKMatrix2;
  GLKMatrix2 = _GLKMatrix2;

  _GLKMatrix3 = record
    case Integer of
      0:
        (m00: Single;
          m01: Single;
          m02: Single;
          m10: Single;
          m11: Single;
          m12: Single;
          m20: Single;
          m21: Single;
          m22: Single;
        );
      1:
        (m: array [0 .. 8] of Single);
  end;

  P_GLKMatrix3 = ^_GLKMatrix3;
  GLKMatrix3 = _GLKMatrix3;

  _GLKMatrix4 = record
    case Integer of
      0:
        (m00: Single;
          m01: Single;
          m02: Single;
          m03: Single;
          m10: Single;
          m11: Single;
          m12: Single;
          m13: Single;
          m20: Single;
          m21: Single;
          m22: Single;
          m23: Single;
          m30: Single;
          m31: Single;
          m32: Single;
          m33: Single;
        );
      1:
        (m: array [0 .. 15] of Single);
  end;

  P_GLKMatrix4 = ^_GLKMatrix4;
  GLKMatrix4 = _GLKMatrix4;

  _GLKVector2 = record
    case Integer of
      0:
        (x: Single;
          y: Single;
        );
      1:
        (s: Single;
          t: Single;
        );
      2:
        (v: array [0 .. 1] of Single);
  end;

  P_GLKVector2 = ^_GLKVector2;
  GLKVector2 = _GLKVector2;

  _GLKVector3 = record
    case Integer of
      0:
        (x: Single;
          y: Single;
          z: Single;
        );
      1:
        (r: Single;
          g: Single;
          b: Single;
        );
      2:
        (s: Single;
          t: Single;
          p: Single;
        );
      3:
        (v: array [0 .. 2] of Single);
  end;

  P_GLKVector3 = ^_GLKVector3;
  GLKVector3 = _GLKVector3;

  _GLKVector4 = record
    case Integer of
      0:
        (x: Single;
          y: Single;
          z: Single;
          w: Single;
        );
      1:
        (r: Single;
          g: Single;
          b: Single;
          a: Single;
        );
      2:
        (s: Single;
          t: Single;
          p: Single;
          q: Single;
        );
      3:
        (v: array [0 .. 3] of Single);
  end;

  P_GLKVector4 = ^_GLKVector4;
  GLKVector4 = _GLKVector4;

  _GLKQuaternion = record
    case Integer of
      0:
        (x: Single;
          y: Single;
          z: Single;
          w: Single;
        );
      1:
        (v: GLKVector3;
          s: Single;
        );
      2:
        (q: array [0 .. 3] of Single);
  end;

  P_GLKQuaternion = ^_GLKQuaternion;
  GLKQuaternion = _GLKQuaternion;

  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  GLKMatrixStackRef = Pointer;
  PGLKMatrixStackRef = ^GLKMatrixStackRef;
  CFAllocatorRef = Pointer;
  PCFAllocatorRef = ^CFAllocatorRef;
  CFTypeID = LongWord;
  PCFTypeID = ^CFTypeID;

  GLKEffectPropertyPrvPtr = Pointer;
  PGLKEffectPropertyPrvPtr = ^GLKEffectPropertyPrvPtr;
  GLint = Int32;
  PGLint = ^GLint;
  GLKLightingType = GLint;
  GLboolean = Byte;
  PGLboolean = ^GLboolean;
  GLfloat = Single;
  PGLfloat = ^GLfloat;

  GLenum = LongWord;
  PGLenum = ^GLenum;
  GLKTextureTarget = GLenum;
  GLKTextureEnvMode = GLint;
  GLuint = LongWord;
  PGLuint = ^GLuint;
  GLKFogMode = GLint;
  GLKVertexAttrib = GLint;
  GLKViewDrawableColorFormat = GLint;
  GLKViewDrawableDepthFormat = GLint;
  GLKViewDrawableStencilFormat = GLint;
  GLKViewDrawableMultisample = GLint;
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

  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  GLsizei = Int32;
  PGLsizei = ^GLsizei;

  _GLKVertexAttributeParameters = record
    &type: GLenum;
    size: GLint;
    normalized: GLboolean;
  end;

  P_GLKVertexAttributeParameters = ^_GLKVertexAttributeParameters;
  GLKVertexAttributeParameters = _GLKVertexAttributeParameters;
  PGLKVertexAttributeParameters = ^GLKVertexAttributeParameters;

  GLKTextureLoaderError = GLuint;
  GLKTextureInfoAlphaState = GLint;
  GLKTextureInfoOrigin = GLint;
  GLKTextureLoaderCallback = procedure(param1: GLKTextureInfo; param2: NSError)
    of object;
  CGImageRef = Pointer;
  PCGImageRef = ^CGImageRef;
  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;
  // ===== Interface declarations =====

  GLKEffectPropertyClass = interface(NSObjectClass)
    ['{61299500-E21B-4208-9922-134BB3D60AAA}']
  end;

  GLKEffectProperty = interface(NSObject)
    ['{C233690C-9861-4D7C-9251-958F8BF821D4}']
  end;

  TGLKEffectProperty = class(TOCGenericImport<GLKEffectPropertyClass,
    GLKEffectProperty>)
  end;

  PGLKEffectProperty = Pointer;

  GLKEffectPropertyTransformClass = interface(GLKEffectPropertyClass)
    ['{F6E4DA1F-27A6-44F2-A361-F2F1F0E5E449}']
  end;

  GLKEffectPropertyTransform = interface(GLKEffectProperty)
    ['{B9D7A7DE-CB51-4B86-9024-36047C0A3764}']
    procedure setModelviewMatrix(modelviewMatrix: GLKMatrix4); cdecl;
    function modelviewMatrix: GLKMatrix4; cdecl;
    procedure setProjectionMatrix(projectionMatrix: GLKMatrix4); cdecl;
    function projectionMatrix: GLKMatrix4; cdecl;
    function normalMatrix: GLKMatrix3; cdecl;
  end;

  TGLKEffectPropertyTransform = class
    (TOCGenericImport<GLKEffectPropertyTransformClass,
    GLKEffectPropertyTransform>)
  end;

  PGLKEffectPropertyTransform = Pointer;

  GLKEffectPropertyLightClass = interface(GLKEffectPropertyClass)
    ['{CAD368F4-5869-4408-88CB-AE906EB46ED2}']
  end;

  GLKEffectPropertyLight = interface(GLKEffectProperty)
    ['{FEAB008A-9BBD-4D1B-9527-09F5D2CDBB03}']
    procedure setEnabled(enabled: GLboolean); cdecl;
    function enabled: GLboolean; cdecl;
    procedure setPosition(position: GLKVector4); cdecl;
    function position: GLKVector4; cdecl;
    procedure setAmbientColor(ambientColor: GLKVector4); cdecl;
    function ambientColor: GLKVector4; cdecl;
    procedure setDiffuseColor(diffuseColor: GLKVector4); cdecl;
    function diffuseColor: GLKVector4; cdecl;
    procedure setSpecularColor(specularColor: GLKVector4); cdecl;
    function specularColor: GLKVector4; cdecl;
    procedure setSpotDirection(spotDirection: GLKVector3); cdecl;
    function spotDirection: GLKVector3; cdecl;
    procedure setSpotExponent(spotExponent: GLfloat); cdecl;
    function spotExponent: GLfloat; cdecl;
    procedure setSpotCutoff(spotCutoff: GLfloat); cdecl;
    function spotCutoff: GLfloat; cdecl;
    procedure setConstantAttenuation(constantAttenuation: GLfloat); cdecl;
    function constantAttenuation: GLfloat; cdecl;
    procedure setLinearAttenuation(linearAttenuation: GLfloat); cdecl;
    function linearAttenuation: GLfloat; cdecl;
    procedure setQuadraticAttenuation(quadraticAttenuation: GLfloat); cdecl;
    function quadraticAttenuation: GLfloat; cdecl;
    procedure setTransform(transform: GLKEffectPropertyTransform); cdecl;
    function transform: GLKEffectPropertyTransform; cdecl;
  end;

  TGLKEffectPropertyLight = class(TOCGenericImport<GLKEffectPropertyLightClass,
    GLKEffectPropertyLight>)
  end;

  PGLKEffectPropertyLight = Pointer;

  GLKEffectPropertyMaterialClass = interface(GLKEffectPropertyClass)
    ['{995E1362-CFC5-477C-BF94-B6B936BB71D7}']
  end;

  GLKEffectPropertyMaterial = interface(GLKEffectProperty)
    ['{753C0AB0-6B22-48A8-935F-ADFCFA1622DA}']
    procedure setAmbientColor(ambientColor: GLKVector4); cdecl;
    function ambientColor: GLKVector4; cdecl;
    procedure setDiffuseColor(diffuseColor: GLKVector4); cdecl;
    function diffuseColor: GLKVector4; cdecl;
    procedure setSpecularColor(specularColor: GLKVector4); cdecl;
    function specularColor: GLKVector4; cdecl;
    procedure setEmissiveColor(emissiveColor: GLKVector4); cdecl;
    function emissiveColor: GLKVector4; cdecl;
    procedure setShininess(shininess: GLfloat); cdecl;
    function shininess: GLfloat; cdecl;
  end;

  TGLKEffectPropertyMaterial = class
    (TOCGenericImport<GLKEffectPropertyMaterialClass,
    GLKEffectPropertyMaterial>)
  end;

  PGLKEffectPropertyMaterial = Pointer;

  GLKEffectPropertyTextureClass = interface(GLKEffectPropertyClass)
    ['{EB78F7A8-B6A2-4292-A22E-68E6A83D7DA8}']
  end;

  GLKEffectPropertyTexture = interface(GLKEffectProperty)
    ['{3D888AB1-65E7-4772-879F-037563DEA46F}']
    procedure setEnabled(enabled: GLboolean); cdecl;
    function enabled: GLboolean; cdecl;
    procedure setName(name: GLuint); cdecl;
    function name: GLuint; cdecl;
    procedure setTarget(target: GLKTextureTarget); cdecl;
    function target: GLKTextureTarget; cdecl;
    procedure setEnvMode(envMode: GLKTextureEnvMode); cdecl;
    function envMode: GLKTextureEnvMode; cdecl;
  end;

  TGLKEffectPropertyTexture = class
    (TOCGenericImport<GLKEffectPropertyTextureClass, GLKEffectPropertyTexture>)
  end;

  PGLKEffectPropertyTexture = Pointer;

  GLKEffectPropertyFogClass = interface(GLKEffectPropertyClass)
    ['{C6FD0CEC-66E3-4454-88F7-855134653F11}']
  end;

  GLKEffectPropertyFog = interface(GLKEffectProperty)
    ['{C5F7B4E1-7F74-4BCD-9B36-8B307A1D3AA3}']
    procedure setEnabled(enabled: GLboolean); cdecl;
    function enabled: GLboolean; cdecl;
    procedure setMode(mode: GLint); cdecl;
    function mode: GLint; cdecl;
    procedure setColor(color: GLKVector4); cdecl;
    function color: GLKVector4; cdecl;
    procedure setDensity(density: GLfloat); cdecl;
    function density: GLfloat; cdecl;
    procedure setStart(start: GLfloat); cdecl;
    function start: GLfloat; cdecl;
    procedure setEnd(&end: GLfloat); cdecl;
    function &end: GLfloat; cdecl;
  end;

  TGLKEffectPropertyFog = class(TOCGenericImport<GLKEffectPropertyFogClass,
    GLKEffectPropertyFog>)
  end;

  PGLKEffectPropertyFog = Pointer;

  GLKBaseEffectClass = interface(NSObjectClass)
    ['{E13E0455-FABC-4453-A5CC-E6D3C402B3D6}']
  end;

  GLKBaseEffect = interface(NSObject)
    ['{2E3CACDA-E535-48F5-9CB0-07084F5E329E}']
    procedure prepareToDraw; cdecl;
    procedure setColorMaterialEnabled(colorMaterialEnabled: GLboolean); cdecl;
    function colorMaterialEnabled: GLboolean; cdecl;
    procedure setLightModelTwoSided(lightModelTwoSided: GLboolean); cdecl;
    function lightModelTwoSided: GLboolean; cdecl;
    procedure setUseConstantColor(useConstantColor: GLboolean); cdecl;
    function useConstantColor: GLboolean; cdecl;
    function transform: GLKEffectPropertyTransform; cdecl;
    function light0: GLKEffectPropertyLight; cdecl;
    function light1: GLKEffectPropertyLight; cdecl;
    function light2: GLKEffectPropertyLight; cdecl;
    procedure setLightingType(lightingType: GLKLightingType); cdecl;
    function lightingType: GLKLightingType; cdecl;
    procedure setLightModelAmbientColor(lightModelAmbientColor
      : GLKVector4); cdecl;
    function lightModelAmbientColor: GLKVector4; cdecl;
    function material: GLKEffectPropertyMaterial; cdecl;
    function texture2d0: GLKEffectPropertyTexture; cdecl;
    function texture2d1: GLKEffectPropertyTexture; cdecl;
    procedure setTextureOrder(textureOrder: NSArray); cdecl;
    function textureOrder: NSArray; cdecl;
    procedure setConstantColor(constantColor: GLKVector4); cdecl;
    function constantColor: GLKVector4; cdecl;
    function fog: GLKEffectPropertyFog; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
  end;

  TGLKBaseEffect = class(TOCGenericImport<GLKBaseEffectClass, GLKBaseEffect>)
  end;

  PGLKBaseEffect = Pointer;

  GLKReflectionMapEffectClass = interface(GLKBaseEffectClass)
    ['{19F46090-1701-4880-AB80-35D0A0BDDDA9}']
  end;

  GLKReflectionMapEffect = interface(GLKBaseEffect)
    ['{D7A6AB0F-8805-4CC9-A0CA-433A9F97596F}']
    procedure prepareToDraw; cdecl;
    function textureCubeMap: GLKEffectPropertyTexture; cdecl;
    procedure setMatrix(matrix: GLKMatrix3); cdecl;
    function matrix: GLKMatrix3; cdecl;
  end;

  TGLKReflectionMapEffect = class(TOCGenericImport<GLKReflectionMapEffectClass,
    GLKReflectionMapEffect>)
  end;

  PGLKReflectionMapEffect = Pointer;

  GLKSkyboxEffectClass = interface(NSObjectClass)
    ['{004BC5F7-F540-4C49-9995-EAE0824B30BC}']
  end;

  GLKSkyboxEffect = interface(NSObject)
    ['{4B208BB6-FB7A-40B1-93FC-1E80F3CC20EE}']
    procedure prepareToDraw; cdecl;
    procedure draw; cdecl;
    procedure setCenter(center: GLKVector3); cdecl;
    function center: GLKVector3; cdecl;
    procedure setXSize(xSize: GLfloat); cdecl;
    function xSize: GLfloat; cdecl;
    procedure setYSize(ySize: GLfloat); cdecl;
    function ySize: GLfloat; cdecl;
    procedure setZSize(zSize: GLfloat); cdecl;
    function zSize: GLfloat; cdecl;
    function textureCubeMap: GLKEffectPropertyTexture; cdecl;
    function transform: GLKEffectPropertyTransform; cdecl;
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
  end;

  TGLKSkyboxEffect = class(TOCGenericImport<GLKSkyboxEffectClass,
    GLKSkyboxEffect>)
  end;

  PGLKSkyboxEffect = Pointer;

  GLKViewClass = interface(UIViewClass)
    ['{41C7AC00-2B23-40E5-93A0-F9CCFCE53BCD}']
  end;

  GLKView = interface(UIView)
    ['{082922EF-6BF1-45F2-B12E-1CAE939F7846}']
    function initWithFrame(frame: CGRect; context: EAGLContext)
      : Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setContext(context: EAGLContext); cdecl;
    function context: EAGLContext; cdecl;
    function drawableWidth: NSInteger; cdecl;
    function drawableHeight: NSInteger; cdecl;
    procedure setDrawableColorFormat(drawableColorFormat
      : GLKViewDrawableColorFormat); cdecl;
    function drawableColorFormat: GLKViewDrawableColorFormat; cdecl;
    procedure setDrawableDepthFormat(drawableDepthFormat
      : GLKViewDrawableDepthFormat); cdecl;
    function drawableDepthFormat: GLKViewDrawableDepthFormat; cdecl;
    procedure setDrawableStencilFormat(drawableStencilFormat
      : GLKViewDrawableStencilFormat); cdecl;
    function drawableStencilFormat: GLKViewDrawableStencilFormat; cdecl;
    procedure setDrawableMultisample(drawableMultisample
      : GLKViewDrawableMultisample); cdecl;
    function drawableMultisample: GLKViewDrawableMultisample; cdecl;
    procedure bindDrawable; cdecl;
    procedure deleteDrawable; cdecl;
    function snapshot: UIImage; cdecl;
    procedure setEnableSetNeedsDisplay(enableSetNeedsDisplay: Boolean); cdecl;
    function enableSetNeedsDisplay: Boolean; cdecl;
    procedure display; cdecl;
  end;

  TGLKView = class(TOCGenericImport<GLKViewClass, GLKView>)
  end;

  PGLKView = Pointer;

  GLKViewControllerClass = interface(UIViewControllerClass)
    ['{64541166-793B-4C8F-94EE-BD7A231C55A2}']
  end;

  GLKViewController = interface(UIViewController)
    ['{50B44402-C889-4755-B2C3-45EC8B69F213}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setPreferredFramesPerSecond(preferredFramesPerSecond
      : NSInteger); cdecl;
    function preferredFramesPerSecond: NSInteger; cdecl;
    function framesPerSecond: NSInteger; cdecl;
    procedure setPaused(paused: Boolean); cdecl;
    function isPaused: Boolean; cdecl;
    function framesDisplayed: NSInteger; cdecl;
    function timeSinceFirstResume: NSTimeInterval; cdecl;
    function timeSinceLastResume: NSTimeInterval; cdecl;
    function timeSinceLastUpdate: NSTimeInterval; cdecl;
    function timeSinceLastDraw: NSTimeInterval; cdecl;
    procedure setPauseOnWillResignActive(pauseOnWillResignActive
      : Boolean); cdecl;
    function pauseOnWillResignActive: Boolean; cdecl;
    procedure setResumeOnDidBecomeActive(resumeOnDidBecomeActive
      : Boolean); cdecl;
    function resumeOnDidBecomeActive: Boolean; cdecl;
  end;

  TGLKViewController = class(TOCGenericImport<GLKViewControllerClass,
    GLKViewController>)
  end;

  PGLKViewController = Pointer;

  GLKMeshBufferAllocatorClass = interface(NSObjectClass)
    ['{30717318-80D1-4D39-A578-744AD9F5A7AA}']
  end;

  GLKMeshBufferAllocator = interface(NSObject)
    ['{44BCB050-9772-4FDD-97C7-45EA4E75A0D0}']
  end;

  TGLKMeshBufferAllocator = class(TOCGenericImport<GLKMeshBufferAllocatorClass,
    GLKMeshBufferAllocator>)
  end;

  PGLKMeshBufferAllocator = Pointer;

  GLKMeshBufferClass = interface(NSObjectClass)
    ['{F22324AF-82C5-46B9-93F9-25A8A74EC437}']
  end;

  GLKMeshBuffer = interface(NSObject)
    ['{22F83547-88B9-4A01-8ABE-B5B2E8E0BDCB}']
    function length: NSUInteger; cdecl;
    function allocator: GLKMeshBufferAllocator; cdecl;
    function glBufferName: GLuint; cdecl;
    function offset: NSUInteger; cdecl;
    function zone: Pointer; cdecl;
    function &type: Integer; cdecl;
  end;

  TGLKMeshBuffer = class(TOCGenericImport<GLKMeshBufferClass, GLKMeshBuffer>)
  end;

  PGLKMeshBuffer = Pointer;

  GLKMeshClass = interface(NSObjectClass)
    ['{E35D8932-7B5E-4FFE-93B4-8ACB44102FD6}']
    { class } function newMeshesFromAsset(asset: Pointer; sourceMeshes: NSArray;
      error: NSError): NSArray; cdecl;
  end;

  GLKMesh = interface(NSObject)
    ['{3FEFD639-5172-47BD-8E4E-AF64F17086B0}']
    function initWithMesh(mesh: Pointer; error: NSError)
      : Pointer { instancetype }; cdecl;
    function vertexCount: NSUInteger; cdecl;
    function vertexBuffers: NSArray; cdecl;
    function vertexDescriptor: PInteger; cdecl;
    function submeshes: NSArray; cdecl;
    function name: NSString; cdecl;
  end;

  TGLKMesh = class(TOCGenericImport<GLKMeshClass, GLKMesh>)
  end;

  PGLKMesh = Pointer;

  GLKSubmeshClass = interface(NSObjectClass)
    ['{F7955DD5-16A1-42BA-80B4-9002743C25AB}']
  end;

  GLKSubmesh = interface(NSObject)
    ['{7E055EFF-CDF6-48FA-B5F3-906DA1512788}']
    function &type: GLenum; cdecl;
    function mode: GLenum; cdecl;
    function elementCount: GLsizei; cdecl;
    function elementBuffer: GLKMeshBuffer; cdecl;
    function mesh: GLKMesh; cdecl;
    function name: NSString; cdecl;
  end;

  TGLKSubmesh = class(TOCGenericImport<GLKSubmeshClass, GLKSubmesh>)
  end;

  PGLKSubmesh = Pointer;

  GLKTextureInfoClass = interface(NSObjectClass)
    ['{A167AE3E-ED1B-4540-B193-E265550899D3}']
  end;

  GLKTextureInfo = interface(NSObject)
    ['{6B9CC853-1C1C-4155-B306-3C39B69BB70D}']
    function name: GLuint; cdecl;
    function target: GLenum; cdecl;
    function width: GLuint; cdecl;
    function height: GLuint; cdecl;
    function depth: GLuint; cdecl;
    function alphaState: GLKTextureInfoAlphaState; cdecl;
    function textureOrigin: GLKTextureInfoOrigin; cdecl;
    function containsMipmaps: Boolean; cdecl;
    function mimapLevelCount: GLuint; cdecl;
    function arrayLength: GLuint; cdecl;
  end;

  TGLKTextureInfo = class(TOCGenericImport<GLKTextureInfoClass, GLKTextureInfo>)
  end;

  PGLKTextureInfo = Pointer;

  GLKTextureLoaderClass = interface(NSObjectClass)
    ['{295A34E9-42BE-4E13-8026-7DB23090E7C1}']
    { class } function textureWithContentsOfFile(path: NSString;
      options: NSDictionary; error: NSError): GLKTextureInfo; cdecl;
    { class } function textureWithContentsOfURL(url: NSURL;
      options: NSDictionary; error: NSError): GLKTextureInfo; cdecl;
    { class } function textureWithName(name: NSString; scaleFactor: CGFloat;
      bundle: NSBundle; options: NSDictionary; error: NSError)
      : GLKTextureInfo; cdecl;
    { class } function textureWithContentsOfData(data: NSData;
      options: NSDictionary; error: NSError): GLKTextureInfo; cdecl;
    { class } function textureWithCGImage(cgImage: CGImageRef;
      options: NSDictionary; error: NSError): GLKTextureInfo; cdecl;
    { class } function cubeMapWithContentsOfFiles(paths: NSArray;
      options: NSDictionary; error: NSError): GLKTextureInfo; cdecl;
    { class } function cubeMapWithContentsOfFile(path: NSString;
      options: NSDictionary; error: NSError): GLKTextureInfo; cdecl;
    { class } function cubeMapWithContentsOfURL(url: NSURL;
      options: NSDictionary; error: NSError): GLKTextureInfo; cdecl;
  end;

  GLKTextureLoader = interface(NSObject)
    ['{B11C6997-5998-4C7E-984F-9A01F9909BC5}']
    function initWithSharegroup(sharegroup: EAGLSharegroup)
      : Pointer { instancetype }; cdecl;
    procedure textureWithContentsOfFile(path: NSString; options: NSDictionary;
      queue: dispatch_queue_t;
      completionHandler: GLKTextureLoaderCallback); cdecl;
    procedure textureWithContentsOfURL(url: NSURL; options: NSDictionary;
      queue: dispatch_queue_t;
      completionHandler: GLKTextureLoaderCallback); cdecl;
    procedure textureWithName(name: NSString; scaleFactor: CGFloat;
      bundle: NSBundle; options: NSDictionary; queue: dispatch_queue_t;
      completionHandler: GLKTextureLoaderCallback); cdecl;
    procedure textureWithContentsOfData(data: NSData; options: NSDictionary;
      queue: dispatch_queue_t;
      completionHandler: GLKTextureLoaderCallback); cdecl;
    procedure textureWithCGImage(cgImage: CGImageRef; options: NSDictionary;
      queue: dispatch_queue_t;
      completionHandler: GLKTextureLoaderCallback); cdecl;
    procedure cubeMapWithContentsOfFiles(paths: NSArray; options: NSDictionary;
      queue: dispatch_queue_t;
      completionHandler: GLKTextureLoaderCallback); cdecl;
    procedure cubeMapWithContentsOfFile(path: NSString; options: NSDictionary;
      queue: dispatch_queue_t;
      completionHandler: GLKTextureLoaderCallback); cdecl;
    procedure cubeMapWithContentsOfURL(url: NSURL; options: NSDictionary;
      queue: dispatch_queue_t;
      completionHandler: GLKTextureLoaderCallback); cdecl;
  end;

  TGLKTextureLoader = class(TOCGenericImport<GLKTextureLoaderClass,
    GLKTextureLoader>)
  end;

  PGLKTextureLoader = Pointer;

  // ===== Protocol declarations =====

  GLKNamedEffect = interface(IObjectiveC)
    ['{86A6BE2C-40DD-438B-9AEF-239B17E7C33D}']
    procedure prepareToDraw; cdecl;
  end;

  GLKViewDelegate = interface(IObjectiveC)
    ['{973287F8-166E-45C3-B75C-040D1FF8B788}']
    procedure GLKView(view: GLKView; drawInRect: CGRect); cdecl;
  end;

  GLKViewControllerDelegate = interface(IObjectiveC)
    ['{368DA35D-13C3-4BF7-A23B-09801F739486}']
    procedure glkViewControllerUpdate(controller: GLKViewController); cdecl;
    procedure GLKViewController(controller: GLKViewController;
      willPause: Boolean); cdecl;
  end;

  // ===== Exported string consts =====

function GLKQuaternionIdentity: Pointer;
function GLKMatrix3Identity: Pointer;
function GLKMatrix4Identity: Pointer;
function kGLKModelErrorDomain: NSString;
function kGLKModelErrorKey: NSString;
function GLKTextureLoaderApplyPremultiplication: NSString;
function GLKTextureLoaderGenerateMipmaps: NSString;
function GLKTextureLoaderOriginBottomLeft: NSString;
function GLKTextureLoaderGrayscaleAsAlpha: NSString;
function GLKTextureLoaderSRGB: NSString;
function GLKTextureLoaderErrorDomain: NSString;
function GLKTextureLoaderErrorKey: NSString;
function GLKTextureLoaderGLErrorKey: NSString;


// ===== External functions =====

const
  libGLKit = '/System/Library/Frameworks/GLKit.framework/GLKit';
function GLKVector3Make(x: Single; y: Single; z: Single): GLKVector3; cdecl;
  external libGLKit name _PU + 'GLKVector3Make';
function GLKVector3MakeWithArray(values: Single): GLKVector3; cdecl;
  external libGLKit name _PU + 'GLKVector3MakeWithArray';
function GLKVector3Negate(vector: GLKVector3): GLKVector3; cdecl;
  external libGLKit name _PU + 'GLKVector3Negate';
function GLKVector3Add(vectorLeft: GLKVector3; vectorRight: GLKVector3)
  : GLKVector3; cdecl; external libGLKit name _PU + 'GLKVector3Add';
function GLKVector3Subtract(vectorLeft: GLKVector3; vectorRight: GLKVector3)
  : GLKVector3; cdecl; external libGLKit name _PU + 'GLKVector3Subtract';
function GLKVector3Multiply(vectorLeft: GLKVector3; vectorRight: GLKVector3)
  : GLKVector3; cdecl; external libGLKit name _PU + 'GLKVector3Multiply';
function GLKVector3Divide(vectorLeft: GLKVector3; vectorRight: GLKVector3)
  : GLKVector3; cdecl; external libGLKit name _PU + 'GLKVector3Divide';
function GLKVector3AddScalar(vector: GLKVector3; value: Single): GLKVector3;
  cdecl; external libGLKit name _PU + 'GLKVector3AddScalar';
function GLKVector3SubtractScalar(vector: GLKVector3; value: Single)
  : GLKVector3; cdecl; external libGLKit name _PU + 'GLKVector3SubtractScalar';
function GLKVector3MultiplyScalar(vector: GLKVector3; value: Single)
  : GLKVector3; cdecl; external libGLKit name _PU + 'GLKVector3MultiplyScalar';
function GLKVector3DivideScalar(vector: GLKVector3; value: Single): GLKVector3;
  cdecl; external libGLKit name _PU + 'GLKVector3DivideScalar';
function GLKVector3Maximum(vectorLeft: GLKVector3; vectorRight: GLKVector3)
  : GLKVector3; cdecl; external libGLKit name _PU + 'GLKVector3Maximum';
function GLKVector3Minimum(vectorLeft: GLKVector3; vectorRight: GLKVector3)
  : GLKVector3; cdecl; external libGLKit name _PU + 'GLKVector3Minimum';
function GLKVector3AllEqualToVector3(vectorLeft: GLKVector3;
  vectorRight: GLKVector3): Integer; cdecl;
  external libGLKit name _PU + 'GLKVector3AllEqualToVector3';
function GLKVector3AllEqualToScalar(vector: GLKVector3; value: Single): Integer;
  cdecl; external libGLKit name _PU + 'GLKVector3AllEqualToScalar';
function GLKVector3AllGreaterThanVector3(vectorLeft: GLKVector3;
  vectorRight: GLKVector3): Integer; cdecl;
  external libGLKit name _PU + 'GLKVector3AllGreaterThanVector3';
function GLKVector3AllGreaterThanScalar(vector: GLKVector3; value: Single)
  : Integer; cdecl; external libGLKit name _PU +
  'GLKVector3AllGreaterThanScalar';
function GLKVector3AllGreaterThanOrEqualToVector3(vectorLeft: GLKVector3;
  vectorRight: GLKVector3): Integer; cdecl;
  external libGLKit name _PU + 'GLKVector3AllGreaterThanOrEqualToVector3';
function GLKVector3AllGreaterThanOrEqualToScalar(vector: GLKVector3;
  value: Single): Integer; cdecl;
  external libGLKit name _PU + 'GLKVector3AllGreaterThanOrEqualToScalar';
function GLKVector3Normalize(vector: GLKVector3): GLKVector3; cdecl;
  external libGLKit name _PU + 'GLKVector3Normalize';
function GLKVector3DotProduct(vectorLeft: GLKVector3; vectorRight: GLKVector3)
  : Single; cdecl; external libGLKit name _PU + 'GLKVector3DotProduct';
function GLKVector3Length(vector: GLKVector3): Single; cdecl;
  external libGLKit name _PU + 'GLKVector3Length';
function GLKVector3Distance(vectorStart: GLKVector3; vectorEnd: GLKVector3)
  : Single; cdecl; external libGLKit name _PU + 'GLKVector3Distance';
function GLKVector3Lerp(vectorStart: GLKVector3; vectorEnd: GLKVector3;
  t: Single): GLKVector3; cdecl; external libGLKit name _PU + 'GLKVector3Lerp';
function GLKVector3CrossProduct(vectorLeft: GLKVector3; vectorRight: GLKVector3)
  : GLKVector3; cdecl; external libGLKit name _PU + 'GLKVector3CrossProduct';
function GLKVector3Project(vectorToProject: GLKVector3;
  projectionVector: GLKVector3): GLKVector3; cdecl;
  external libGLKit name _PU + 'GLKVector3Project';
function GLKVector4Make(x: Single; y: Single; z: Single; w: Single): GLKVector4;
  cdecl; external libGLKit name _PU + 'GLKVector4Make';
function GLKVector4MakeWithArray(values: Single): GLKVector4; cdecl;
  external libGLKit name _PU + 'GLKVector4MakeWithArray';
function GLKVector4MakeWithVector3(vector: GLKVector3; w: Single): GLKVector4;
  cdecl; external libGLKit name _PU + 'GLKVector4MakeWithVector3';
function GLKVector4Negate(vector: GLKVector4): GLKVector4; cdecl;
  external libGLKit name _PU + 'GLKVector4Negate';
function GLKVector4Add(vectorLeft: GLKVector4; vectorRight: GLKVector4)
  : GLKVector4; cdecl; external libGLKit name _PU + 'GLKVector4Add';
function GLKVector4Subtract(vectorLeft: GLKVector4; vectorRight: GLKVector4)
  : GLKVector4; cdecl; external libGLKit name _PU + 'GLKVector4Subtract';
function GLKVector4Multiply(vectorLeft: GLKVector4; vectorRight: GLKVector4)
  : GLKVector4; cdecl; external libGLKit name _PU + 'GLKVector4Multiply';
function GLKVector4Divide(vectorLeft: GLKVector4; vectorRight: GLKVector4)
  : GLKVector4; cdecl; external libGLKit name _PU + 'GLKVector4Divide';
function GLKVector4AddScalar(vector: GLKVector4; value: Single): GLKVector4;
  cdecl; external libGLKit name _PU + 'GLKVector4AddScalar';
function GLKVector4SubtractScalar(vector: GLKVector4; value: Single)
  : GLKVector4; cdecl; external libGLKit name _PU + 'GLKVector4SubtractScalar';
function GLKVector4MultiplyScalar(vector: GLKVector4; value: Single)
  : GLKVector4; cdecl; external libGLKit name _PU + 'GLKVector4MultiplyScalar';
function GLKVector4DivideScalar(vector: GLKVector4; value: Single): GLKVector4;
  cdecl; external libGLKit name _PU + 'GLKVector4DivideScalar';
function GLKVector4Maximum(vectorLeft: GLKVector4; vectorRight: GLKVector4)
  : GLKVector4; cdecl; external libGLKit name _PU + 'GLKVector4Maximum';
function GLKVector4Minimum(vectorLeft: GLKVector4; vectorRight: GLKVector4)
  : GLKVector4; cdecl; external libGLKit name _PU + 'GLKVector4Minimum';
function GLKVector4AllEqualToVector4(vectorLeft: GLKVector4;
  vectorRight: GLKVector4): Integer; cdecl;
  external libGLKit name _PU + 'GLKVector4AllEqualToVector4';
function GLKVector4AllEqualToScalar(vector: GLKVector4; value: Single): Integer;
  cdecl; external libGLKit name _PU + 'GLKVector4AllEqualToScalar';
function GLKVector4AllGreaterThanVector4(vectorLeft: GLKVector4;
  vectorRight: GLKVector4): Integer; cdecl;
  external libGLKit name _PU + 'GLKVector4AllGreaterThanVector4';
function GLKVector4AllGreaterThanScalar(vector: GLKVector4; value: Single)
  : Integer; cdecl; external libGLKit name _PU +
  'GLKVector4AllGreaterThanScalar';
function GLKVector4AllGreaterThanOrEqualToVector4(vectorLeft: GLKVector4;
  vectorRight: GLKVector4): Integer; cdecl;
  external libGLKit name _PU + 'GLKVector4AllGreaterThanOrEqualToVector4';
function GLKVector4AllGreaterThanOrEqualToScalar(vector: GLKVector4;
  value: Single): Integer; cdecl;
  external libGLKit name _PU + 'GLKVector4AllGreaterThanOrEqualToScalar';
function GLKVector4Normalize(vector: GLKVector4): GLKVector4; cdecl;
  external libGLKit name _PU + 'GLKVector4Normalize';
function GLKVector4DotProduct(vectorLeft: GLKVector4; vectorRight: GLKVector4)
  : Single; cdecl; external libGLKit name _PU + 'GLKVector4DotProduct';
function GLKVector4Length(vector: GLKVector4): Single; cdecl;
  external libGLKit name _PU + 'GLKVector4Length';
function GLKVector4Distance(vectorStart: GLKVector4; vectorEnd: GLKVector4)
  : Single; cdecl; external libGLKit name _PU + 'GLKVector4Distance';
function GLKVector4Lerp(vectorStart: GLKVector4; vectorEnd: GLKVector4;
  t: Single): GLKVector4; cdecl; external libGLKit name _PU + 'GLKVector4Lerp';
function GLKVector4CrossProduct(vectorLeft: GLKVector4; vectorRight: GLKVector4)
  : GLKVector4; cdecl; external libGLKit name _PU + 'GLKVector4CrossProduct';
function GLKVector4Project(vectorToProject: GLKVector4;
  projectionVector: GLKVector4): GLKVector4; cdecl;
  external libGLKit name _PU + 'GLKVector4Project';
function GLKQuaternionMake(x: Single; y: Single; z: Single; w: Single)
  : GLKQuaternion; cdecl; external libGLKit name _PU + 'GLKQuaternionMake';
function GLKQuaternionMakeWithVector3(vector: GLKVector3; scalar: Single)
  : GLKQuaternion; cdecl;
  external libGLKit name _PU + 'GLKQuaternionMakeWithVector3';
function GLKQuaternionMakeWithArray(values: Single): GLKQuaternion; cdecl;
  external libGLKit name _PU + 'GLKQuaternionMakeWithArray';
function GLKQuaternionMakeWithAngleAndAxis(radians: Single; x: Single;
  y: Single; z: Single): GLKQuaternion; cdecl;
  external libGLKit name _PU + 'GLKQuaternionMakeWithAngleAndAxis';
function GLKQuaternionMakeWithAngleAndVector3Axis(radians: Single;
  axisVector: GLKVector3): GLKQuaternion; cdecl;
  external libGLKit name _PU + 'GLKQuaternionMakeWithAngleAndVector3Axis';
function GLKQuaternionMakeWithMatrix3(matrix: GLKMatrix3): GLKQuaternion; cdecl;
  external libGLKit name _PU + 'GLKQuaternionMakeWithMatrix3';
function GLKQuaternionMakeWithMatrix4(matrix: GLKMatrix4): GLKQuaternion; cdecl;
  external libGLKit name _PU + 'GLKQuaternionMakeWithMatrix4';
function GLKQuaternionAngle(quaternion: GLKQuaternion): Single; cdecl;
  external libGLKit name _PU + 'GLKQuaternionAngle';
function GLKQuaternionAxis(quaternion: GLKQuaternion): GLKVector3; cdecl;
  external libGLKit name _PU + 'GLKQuaternionAxis';
function GLKQuaternionAdd(quaternionLeft: GLKQuaternion;
  quaternionRight: GLKQuaternion): GLKQuaternion; cdecl;
  external libGLKit name _PU + 'GLKQuaternionAdd';
function GLKQuaternionSubtract(quaternionLeft: GLKQuaternion;
  quaternionRight: GLKQuaternion): GLKQuaternion; cdecl;
  external libGLKit name _PU + 'GLKQuaternionSubtract';
function GLKQuaternionMultiply(quaternionLeft: GLKQuaternion;
  quaternionRight: GLKQuaternion): GLKQuaternion; cdecl;
  external libGLKit name _PU + 'GLKQuaternionMultiply';
function GLKQuaternionSlerp(quaternionStart: GLKQuaternion;
  quaternionEnd: GLKQuaternion; t: Single): GLKQuaternion; cdecl;
  external libGLKit name _PU + 'GLKQuaternionSlerp';
function GLKQuaternionLength(quaternion: GLKQuaternion): Single; cdecl;
  external libGLKit name _PU + 'GLKQuaternionLength';
function GLKQuaternionConjugate(quaternion: GLKQuaternion): GLKQuaternion;
  cdecl; external libGLKit name _PU + 'GLKQuaternionConjugate';
function GLKQuaternionInvert(quaternion: GLKQuaternion): GLKQuaternion; cdecl;
  external libGLKit name _PU + 'GLKQuaternionInvert';
function GLKQuaternionNormalize(quaternion: GLKQuaternion): GLKQuaternion;
  cdecl; external libGLKit name _PU + 'GLKQuaternionNormalize';
function GLKQuaternionRotateVector3(quaternion: GLKQuaternion;
  vector: GLKVector3): GLKVector3; cdecl;
  external libGLKit name _PU + 'GLKQuaternionRotateVector3';
procedure GLKQuaternionRotateVector3Array(quaternion: GLKQuaternion;
  vectors: PGLKVector3; vectorCount: LongWord); cdecl;
  external libGLKit name _PU + 'GLKQuaternionRotateVector3Array';
function GLKQuaternionRotateVector4(quaternion: GLKQuaternion;
  vector: GLKVector4): GLKVector4; cdecl;
  external libGLKit name _PU + 'GLKQuaternionRotateVector4';
procedure GLKQuaternionRotateVector4Array(quaternion: GLKQuaternion;
  vectors: PGLKVector4; vectorCount: LongWord); cdecl;
  external libGLKit name _PU + 'GLKQuaternionRotateVector4Array';
function GLKMatrix3Make(m00: Single; m01: Single; m02: Single; m10: Single;
  m11: Single; m12: Single; m20: Single; m21: Single; m22: Single): GLKMatrix3;
  cdecl; external libGLKit name _PU + 'GLKMatrix3Make';
function GLKMatrix3MakeAndTranspose(m00: Single; m01: Single; m02: Single;
  m10: Single; m11: Single; m12: Single; m20: Single; m21: Single; m22: Single)
  : GLKMatrix3; cdecl; external libGLKit name _PU +
  'GLKMatrix3MakeAndTranspose';
function GLKMatrix3MakeWithArray(values: Single): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3MakeWithArray';
function GLKMatrix3MakeWithArrayAndTranspose(values: Single): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3MakeWithArrayAndTranspose';
function GLKMatrix3MakeWithRows(row0: GLKVector3; row1: GLKVector3;
  row2: GLKVector3): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3MakeWithRows';
function GLKMatrix3MakeWithColumns(column0: GLKVector3; column1: GLKVector3;
  column2: GLKVector3): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3MakeWithColumns';
function GLKMatrix3MakeWithQuaternion(quaternion: GLKQuaternion): GLKMatrix3;
  cdecl; external libGLKit name _PU + 'GLKMatrix3MakeWithQuaternion';
function GLKMatrix3MakeScale(sx: Single; sy: Single; sz: Single): GLKMatrix3;
  cdecl; external libGLKit name _PU + 'GLKMatrix3MakeScale';
function GLKMatrix3MakeRotation(radians: Single; x: Single; y: Single;
  z: Single): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3MakeRotation';
function GLKMatrix3MakeXRotation(radians: Single): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3MakeXRotation';
function GLKMatrix3MakeYRotation(radians: Single): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3MakeYRotation';
function GLKMatrix3MakeZRotation(radians: Single): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3MakeZRotation';
function GLKMatrix3GetMatrix2(matrix: GLKMatrix3): GLKMatrix2; cdecl;
  external libGLKit name _PU + 'GLKMatrix3GetMatrix2';
function GLKMatrix3GetRow(matrix: GLKMatrix3; row: Integer): GLKVector3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3GetRow';
function GLKMatrix3GetColumn(matrix: GLKMatrix3; column: Integer): GLKVector3;
  cdecl; external libGLKit name _PU + 'GLKMatrix3GetColumn';
function GLKMatrix3SetRow(matrix: GLKMatrix3; row: Integer; vector: GLKVector3)
  : GLKMatrix3; cdecl; external libGLKit name _PU + 'GLKMatrix3SetRow';
function GLKMatrix3SetColumn(matrix: GLKMatrix3; column: Integer;
  vector: GLKVector3): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3SetColumn';
function GLKMatrix3Transpose(matrix: GLKMatrix3): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3Transpose';
function GLKMatrix3Invert(matrix: GLKMatrix3; isInvertible: PInteger)
  : GLKMatrix3; cdecl; external libGLKit name _PU + 'GLKMatrix3Invert';
function GLKMatrix3InvertAndTranspose(matrix: GLKMatrix3;
  isInvertible: PInteger): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3InvertAndTranspose';
function GLKMatrix3Multiply(matrixLeft: GLKMatrix3; matrixRight: GLKMatrix3)
  : GLKMatrix3; cdecl; external libGLKit name _PU + 'GLKMatrix3Multiply';
function GLKMatrix3Add(matrixLeft: GLKMatrix3; matrixRight: GLKMatrix3)
  : GLKMatrix3; cdecl; external libGLKit name _PU + 'GLKMatrix3Add';
function GLKMatrix3Subtract(matrixLeft: GLKMatrix3; matrixRight: GLKMatrix3)
  : GLKMatrix3; cdecl; external libGLKit name _PU + 'GLKMatrix3Subtract';
function GLKMatrix3Scale(matrix: GLKMatrix3; sx: Single; sy: Single; sz: Single)
  : GLKMatrix3; cdecl; external libGLKit name _PU + 'GLKMatrix3Scale';
function GLKMatrix3ScaleWithVector3(matrix: GLKMatrix3; scaleVector: GLKVector3)
  : GLKMatrix3; cdecl; external libGLKit name _PU +
  'GLKMatrix3ScaleWithVector3';
function GLKMatrix3ScaleWithVector4(matrix: GLKMatrix3; scaleVector: GLKVector4)
  : GLKMatrix3; cdecl; external libGLKit name _PU +
  'GLKMatrix3ScaleWithVector4';
function GLKMatrix3Rotate(matrix: GLKMatrix3; radians: Single; x: Single;
  y: Single; z: Single): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3Rotate';
function GLKMatrix3RotateWithVector3(matrix: GLKMatrix3; radians: Single;
  axisVector: GLKVector3): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3RotateWithVector3';
function GLKMatrix3RotateWithVector4(matrix: GLKMatrix3; radians: Single;
  axisVector: GLKVector4): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3RotateWithVector4';
function GLKMatrix3RotateX(matrix: GLKMatrix3; radians: Single): GLKMatrix3;
  cdecl; external libGLKit name _PU + 'GLKMatrix3RotateX';
function GLKMatrix3RotateY(matrix: GLKMatrix3; radians: Single): GLKMatrix3;
  cdecl; external libGLKit name _PU + 'GLKMatrix3RotateY';
function GLKMatrix3RotateZ(matrix: GLKMatrix3; radians: Single): GLKMatrix3;
  cdecl; external libGLKit name _PU + 'GLKMatrix3RotateZ';
function GLKMatrix3MultiplyVector3(matrixLeft: GLKMatrix3;
  vectorRight: GLKVector3): GLKVector3; cdecl;
  external libGLKit name _PU + 'GLKMatrix3MultiplyVector3';
procedure GLKMatrix3MultiplyVector3Array(matrix: GLKMatrix3;
  vectors: PGLKVector3; vectorCount: LongWord); cdecl;
  external libGLKit name _PU + 'GLKMatrix3MultiplyVector3Array';
function GLKMatrix4Make(m00: Single; m01: Single; m02: Single; m03: Single;
  m10: Single; m11: Single; m12: Single; m13: Single; m20: Single; m21: Single;
  m22: Single; m23: Single; m30: Single; m31: Single; m32: Single; m33: Single)
  : GLKMatrix4; cdecl; external libGLKit name _PU + 'GLKMatrix4Make';
function GLKMatrix4MakeAndTranspose(m00: Single; m01: Single; m02: Single;
  m03: Single; m10: Single; m11: Single; m12: Single; m13: Single; m20: Single;
  m21: Single; m22: Single; m23: Single; m30: Single; m31: Single; m32: Single;
  m33: Single): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MakeAndTranspose';
function GLKMatrix4MakeWithArray(values: Single): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MakeWithArray';
function GLKMatrix4MakeWithArrayAndTranspose(values: Single): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MakeWithArrayAndTranspose';
function GLKMatrix4MakeWithRows(row0: GLKVector4; row1: GLKVector4;
  row2: GLKVector4; row3: GLKVector4): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MakeWithRows';
function GLKMatrix4MakeWithColumns(column0: GLKVector4; column1: GLKVector4;
  column2: GLKVector4; column3: GLKVector4): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MakeWithColumns';
function GLKMatrix4MakeWithQuaternion(quaternion: GLKQuaternion): GLKMatrix4;
  cdecl; external libGLKit name _PU + 'GLKMatrix4MakeWithQuaternion';
function GLKMatrix4MakeTranslation(tx: Single; ty: Single; tz: Single)
  : GLKMatrix4; cdecl; external libGLKit name _PU + 'GLKMatrix4MakeTranslation';
function GLKMatrix4MakeScale(sx: Single; sy: Single; sz: Single): GLKMatrix4;
  cdecl; external libGLKit name _PU + 'GLKMatrix4MakeScale';
function GLKMatrix4MakeRotation(radians: Single; x: Single; y: Single;
  z: Single): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MakeRotation';
function GLKMatrix4MakeXRotation(radians: Single): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MakeXRotation';
function GLKMatrix4MakeYRotation(radians: Single): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MakeYRotation';
function GLKMatrix4MakeZRotation(radians: Single): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MakeZRotation';
function GLKMatrix4MakePerspective(fovyRadians: Single; aspect: Single;
  nearZ: Single; farZ: Single): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MakePerspective';
function GLKMatrix4MakeFrustum(left: Single; right: Single; bottom: Single;
  top: Single; nearZ: Single; farZ: Single): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MakeFrustum';
function GLKMatrix4MakeOrtho(left: Single; right: Single; bottom: Single;
  top: Single; nearZ: Single; farZ: Single): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MakeOrtho';
function GLKMatrix4MakeLookAt(eyeX: Single; eyeY: Single; eyeZ: Single;
  centerX: Single; centerY: Single; centerZ: Single; upX: Single; upY: Single;
  upZ: Single): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MakeLookAt';
function GLKMatrix4GetMatrix3(matrix: GLKMatrix4): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrix4GetMatrix3';
function GLKMatrix4GetMatrix2(matrix: GLKMatrix4): GLKMatrix2; cdecl;
  external libGLKit name _PU + 'GLKMatrix4GetMatrix2';
function GLKMatrix4GetRow(matrix: GLKMatrix4; row: Integer): GLKVector4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4GetRow';
function GLKMatrix4GetColumn(matrix: GLKMatrix4; column: Integer): GLKVector4;
  cdecl; external libGLKit name _PU + 'GLKMatrix4GetColumn';
function GLKMatrix4SetRow(matrix: GLKMatrix4; row: Integer; vector: GLKVector4)
  : GLKMatrix4; cdecl; external libGLKit name _PU + 'GLKMatrix4SetRow';
function GLKMatrix4SetColumn(matrix: GLKMatrix4; column: Integer;
  vector: GLKVector4): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4SetColumn';
function GLKMatrix4Transpose(matrix: GLKMatrix4): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4Transpose';
function GLKMatrix4Invert(matrix: GLKMatrix4; isInvertible: PInteger)
  : GLKMatrix4; cdecl; external libGLKit name _PU + 'GLKMatrix4Invert';
function GLKMatrix4InvertAndTranspose(matrix: GLKMatrix4;
  isInvertible: PInteger): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4InvertAndTranspose';
function GLKMatrix4Multiply(matrixLeft: GLKMatrix4; matrixRight: GLKMatrix4)
  : GLKMatrix4; cdecl; external libGLKit name _PU + 'GLKMatrix4Multiply';
function GLKMatrix4Add(matrixLeft: GLKMatrix4; matrixRight: GLKMatrix4)
  : GLKMatrix4; cdecl; external libGLKit name _PU + 'GLKMatrix4Add';
function GLKMatrix4Subtract(matrixLeft: GLKMatrix4; matrixRight: GLKMatrix4)
  : GLKMatrix4; cdecl; external libGLKit name _PU + 'GLKMatrix4Subtract';
function GLKMatrix4Translate(matrix: GLKMatrix4; tx: Single; ty: Single;
  tz: Single): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4Translate';
function GLKMatrix4TranslateWithVector3(matrix: GLKMatrix4;
  translationVector: GLKVector3): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4TranslateWithVector3';
function GLKMatrix4TranslateWithVector4(matrix: GLKMatrix4;
  translationVector: GLKVector4): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4TranslateWithVector4';
function GLKMatrix4Scale(matrix: GLKMatrix4; sx: Single; sy: Single; sz: Single)
  : GLKMatrix4; cdecl; external libGLKit name _PU + 'GLKMatrix4Scale';
function GLKMatrix4ScaleWithVector3(matrix: GLKMatrix4; scaleVector: GLKVector3)
  : GLKMatrix4; cdecl; external libGLKit name _PU +
  'GLKMatrix4ScaleWithVector3';
function GLKMatrix4ScaleWithVector4(matrix: GLKMatrix4; scaleVector: GLKVector4)
  : GLKMatrix4; cdecl; external libGLKit name _PU +
  'GLKMatrix4ScaleWithVector4';
function GLKMatrix4Rotate(matrix: GLKMatrix4; radians: Single; x: Single;
  y: Single; z: Single): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4Rotate';
function GLKMatrix4RotateWithVector3(matrix: GLKMatrix4; radians: Single;
  axisVector: GLKVector3): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4RotateWithVector3';
function GLKMatrix4RotateWithVector4(matrix: GLKMatrix4; radians: Single;
  axisVector: GLKVector4): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4RotateWithVector4';
function GLKMatrix4RotateX(matrix: GLKMatrix4; radians: Single): GLKMatrix4;
  cdecl; external libGLKit name _PU + 'GLKMatrix4RotateX';
function GLKMatrix4RotateY(matrix: GLKMatrix4; radians: Single): GLKMatrix4;
  cdecl; external libGLKit name _PU + 'GLKMatrix4RotateY';
function GLKMatrix4RotateZ(matrix: GLKMatrix4; radians: Single): GLKMatrix4;
  cdecl; external libGLKit name _PU + 'GLKMatrix4RotateZ';
function GLKMatrix4MultiplyVector3(matrixLeft: GLKMatrix4;
  vectorRight: GLKVector3): GLKVector3; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MultiplyVector3';
function GLKMatrix4MultiplyVector3WithTranslation(matrixLeft: GLKMatrix4;
  vectorRight: GLKVector3): GLKVector3; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MultiplyVector3WithTranslation';
function GLKMatrix4MultiplyAndProjectVector3(matrixLeft: GLKMatrix4;
  vectorRight: GLKVector3): GLKVector3; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MultiplyAndProjectVector3';
procedure GLKMatrix4MultiplyVector3Array(matrix: GLKMatrix4;
  vectors: PGLKVector3; vectorCount: LongWord); cdecl;
  external libGLKit name _PU + 'GLKMatrix4MultiplyVector3Array';
procedure GLKMatrix4MultiplyVector3ArrayWithTranslation(matrix: GLKMatrix4;
  vectors: PGLKVector3; vectorCount: LongWord); cdecl;
  external libGLKit name _PU + 'GLKMatrix4MultiplyVector3ArrayWithTranslation';
procedure GLKMatrix4MultiplyAndProjectVector3Array(matrix: GLKMatrix4;
  vectors: PGLKVector3; vectorCount: LongWord); cdecl;
  external libGLKit name _PU + 'GLKMatrix4MultiplyAndProjectVector3Array';
function GLKMatrix4MultiplyVector4(matrixLeft: GLKMatrix4;
  vectorRight: GLKVector4): GLKVector4; cdecl;
  external libGLKit name _PU + 'GLKMatrix4MultiplyVector4';
procedure GLKMatrix4MultiplyVector4Array(matrix: GLKMatrix4;
  vectors: PGLKVector4; vectorCount: LongWord); cdecl;
  external libGLKit name _PU + 'GLKMatrix4MultiplyVector4Array';
function GLKVector2Make(x: Single; y: Single): GLKVector2; cdecl;
  external libGLKit name _PU + 'GLKVector2Make';
function GLKVector2MakeWithArray(values: Single): GLKVector2; cdecl;
  external libGLKit name _PU + 'GLKVector2MakeWithArray';
function GLKVector2Negate(vector: GLKVector2): GLKVector2; cdecl;
  external libGLKit name _PU + 'GLKVector2Negate';
function GLKVector2Add(vectorLeft: GLKVector2; vectorRight: GLKVector2)
  : GLKVector2; cdecl; external libGLKit name _PU + 'GLKVector2Add';
function GLKVector2Subtract(vectorLeft: GLKVector2; vectorRight: GLKVector2)
  : GLKVector2; cdecl; external libGLKit name _PU + 'GLKVector2Subtract';
function GLKVector2Multiply(vectorLeft: GLKVector2; vectorRight: GLKVector2)
  : GLKVector2; cdecl; external libGLKit name _PU + 'GLKVector2Multiply';
function GLKVector2Divide(vectorLeft: GLKVector2; vectorRight: GLKVector2)
  : GLKVector2; cdecl; external libGLKit name _PU + 'GLKVector2Divide';
function GLKVector2AddScalar(vector: GLKVector2; value: Single): GLKVector2;
  cdecl; external libGLKit name _PU + 'GLKVector2AddScalar';
function GLKVector2SubtractScalar(vector: GLKVector2; value: Single)
  : GLKVector2; cdecl; external libGLKit name _PU + 'GLKVector2SubtractScalar';
function GLKVector2MultiplyScalar(vector: GLKVector2; value: Single)
  : GLKVector2; cdecl; external libGLKit name _PU + 'GLKVector2MultiplyScalar';
function GLKVector2DivideScalar(vector: GLKVector2; value: Single): GLKVector2;
  cdecl; external libGLKit name _PU + 'GLKVector2DivideScalar';
function GLKVector2Maximum(vectorLeft: GLKVector2; vectorRight: GLKVector2)
  : GLKVector2; cdecl; external libGLKit name _PU + 'GLKVector2Maximum';
function GLKVector2Minimum(vectorLeft: GLKVector2; vectorRight: GLKVector2)
  : GLKVector2; cdecl; external libGLKit name _PU + 'GLKVector2Minimum';
function GLKVector2AllEqualToVector2(vectorLeft: GLKVector2;
  vectorRight: GLKVector2): Integer; cdecl;
  external libGLKit name _PU + 'GLKVector2AllEqualToVector2';
function GLKVector2AllEqualToScalar(vector: GLKVector2; value: Single): Integer;
  cdecl; external libGLKit name _PU + 'GLKVector2AllEqualToScalar';
function GLKVector2AllGreaterThanVector2(vectorLeft: GLKVector2;
  vectorRight: GLKVector2): Integer; cdecl;
  external libGLKit name _PU + 'GLKVector2AllGreaterThanVector2';
function GLKVector2AllGreaterThanScalar(vector: GLKVector2; value: Single)
  : Integer; cdecl; external libGLKit name _PU +
  'GLKVector2AllGreaterThanScalar';
function GLKVector2AllGreaterThanOrEqualToVector2(vectorLeft: GLKVector2;
  vectorRight: GLKVector2): Integer; cdecl;
  external libGLKit name _PU + 'GLKVector2AllGreaterThanOrEqualToVector2';
function GLKVector2AllGreaterThanOrEqualToScalar(vector: GLKVector2;
  value: Single): Integer; cdecl;
  external libGLKit name _PU + 'GLKVector2AllGreaterThanOrEqualToScalar';
function GLKVector2Normalize(vector: GLKVector2): GLKVector2; cdecl;
  external libGLKit name _PU + 'GLKVector2Normalize';
function GLKVector2DotProduct(vectorLeft: GLKVector2; vectorRight: GLKVector2)
  : Single; cdecl; external libGLKit name _PU + 'GLKVector2DotProduct';
function GLKVector2Length(vector: GLKVector2): Single; cdecl;
  external libGLKit name _PU + 'GLKVector2Length';
function GLKVector2Distance(vectorStart: GLKVector2; vectorEnd: GLKVector2)
  : Single; cdecl; external libGLKit name _PU + 'GLKVector2Distance';
function GLKVector2Lerp(vectorStart: GLKVector2; vectorEnd: GLKVector2;
  t: Single): GLKVector2; cdecl; external libGLKit name _PU + 'GLKVector2Lerp';
function GLKVector2Project(vectorToProject: GLKVector2;
  projectionVector: GLKVector2): GLKVector2; cdecl;
  external libGLKit name _PU + 'GLKVector2Project';
function GLKMatrixStackCreate(alloc: CFAllocatorRef): GLKMatrixStackRef; cdecl;
  external libGLKit name _PU + 'GLKMatrixStackCreate';
function GLKMatrixStackGetTypeID: CFTypeID; cdecl;
  external libGLKit name _PU + 'GLKMatrixStackGetTypeID';
procedure GLKMatrixStackPush(stack: GLKMatrixStackRef); cdecl;
  external libGLKit name _PU + 'GLKMatrixStackPush';
procedure GLKMatrixStackPop(stack: GLKMatrixStackRef); cdecl;
  external libGLKit name _PU + 'GLKMatrixStackPop';
function GLKMatrixStackSize(stack: GLKMatrixStackRef): Integer; cdecl;
  external libGLKit name _PU + 'GLKMatrixStackSize';
procedure GLKMatrixStackLoadMatrix4(stack: GLKMatrixStackRef;
  matrix: GLKMatrix4); cdecl;
  external libGLKit name _PU + 'GLKMatrixStackLoadMatrix4';
function GLKMatrixStackGetMatrix4(stack: GLKMatrixStackRef): GLKMatrix4; cdecl;
  external libGLKit name _PU + 'GLKMatrixStackGetMatrix4';
function GLKMatrixStackGetMatrix3(stack: GLKMatrixStackRef): GLKMatrix3; cdecl;
  external libGLKit name _PU + 'GLKMatrixStackGetMatrix3';
function GLKMatrixStackGetMatrix2(stack: GLKMatrixStackRef): GLKMatrix2; cdecl;
  external libGLKit name _PU + 'GLKMatrixStackGetMatrix2';
function GLKMatrixStackGetMatrix4Inverse(stack: GLKMatrixStackRef): GLKMatrix4;
  cdecl; external libGLKit name _PU + 'GLKMatrixStackGetMatrix4Inverse';
function GLKMatrixStackGetMatrix4InverseTranspose(stack: GLKMatrixStackRef)
  : GLKMatrix4; cdecl; external libGLKit name _PU +
  'GLKMatrixStackGetMatrix4InverseTranspose';
function GLKMatrixStackGetMatrix3Inverse(stack: GLKMatrixStackRef): GLKMatrix3;
  cdecl; external libGLKit name _PU + 'GLKMatrixStackGetMatrix3Inverse';
function GLKMatrixStackGetMatrix3InverseTranspose(stack: GLKMatrixStackRef)
  : GLKMatrix3; cdecl; external libGLKit name _PU +
  'GLKMatrixStackGetMatrix3InverseTranspose';
procedure GLKMatrixStackMultiplyMatrix4(stack: GLKMatrixStackRef;
  matrix: GLKMatrix4); cdecl;
  external libGLKit name _PU + 'GLKMatrixStackMultiplyMatrix4';
procedure GLKMatrixStackMultiplyMatrixStack(stackLeft: GLKMatrixStackRef;
  stackRight: GLKMatrixStackRef); cdecl;
  external libGLKit name _PU + 'GLKMatrixStackMultiplyMatrixStack';
procedure GLKMatrixStackTranslate(stack: GLKMatrixStackRef; tx: Single;
  ty: Single; tz: Single); cdecl;
  external libGLKit name _PU + 'GLKMatrixStackTranslate';
procedure GLKMatrixStackTranslateWithVector3(stack: GLKMatrixStackRef;
  translationVector: GLKVector3); cdecl;
  external libGLKit name _PU + 'GLKMatrixStackTranslateWithVector3';
procedure GLKMatrixStackTranslateWithVector4(stack: GLKMatrixStackRef;
  translationVector: GLKVector4); cdecl;
  external libGLKit name _PU + 'GLKMatrixStackTranslateWithVector4';
procedure GLKMatrixStackScale(stack: GLKMatrixStackRef; sx: Single; sy: Single;
  sz: Single); cdecl; external libGLKit name _PU + 'GLKMatrixStackScale';
procedure GLKMatrixStackScaleWithVector3(stack: GLKMatrixStackRef;
  scaleVector: GLKVector3); cdecl;
  external libGLKit name _PU + 'GLKMatrixStackScaleWithVector3';
procedure GLKMatrixStackScaleWithVector4(stack: GLKMatrixStackRef;
  scaleVector: GLKVector4); cdecl;
  external libGLKit name _PU + 'GLKMatrixStackScaleWithVector4';
procedure GLKMatrixStackRotate(stack: GLKMatrixStackRef; radians: Single;
  x: Single; y: Single; z: Single); cdecl;
  external libGLKit name _PU + 'GLKMatrixStackRotate';
procedure GLKMatrixStackRotateWithVector3(stack: GLKMatrixStackRef;
  radians: Single; axisVector: GLKVector3); cdecl;
  external libGLKit name _PU + 'GLKMatrixStackRotateWithVector3';
procedure GLKMatrixStackRotateWithVector4(stack: GLKMatrixStackRef;
  radians: Single; axisVector: GLKVector4); cdecl;
  external libGLKit name _PU + 'GLKMatrixStackRotateWithVector4';
procedure GLKMatrixStackRotateX(stack: GLKMatrixStackRef; radians: Single);
  cdecl; external libGLKit name _PU + 'GLKMatrixStackRotateX';
procedure GLKMatrixStackRotateY(stack: GLKMatrixStackRef; radians: Single);
  cdecl; external libGLKit name _PU + 'GLKMatrixStackRotateY';
procedure GLKMatrixStackRotateZ(stack: GLKMatrixStackRef; radians: Single);
  cdecl; external libGLKit name _PU + 'GLKMatrixStackRotateZ';
function GLKMathDegreesToRadians(degrees: Single): Single; cdecl;
  external libGLKit name _PU + 'GLKMathDegreesToRadians';
function GLKMathRadiansToDegrees(radians: Single): Single; cdecl;
  external libGLKit name _PU + 'GLKMathRadiansToDegrees';
function GLKMathProject(&object: GLKVector3; model: GLKMatrix4;
  projection: GLKMatrix4; viewport: PInteger): GLKVector3; cdecl;
  external libGLKit name _PU + 'GLKMathProject';
function GLKMathUnproject(window: GLKVector3; model: GLKMatrix4;
  projection: GLKMatrix4; viewport: PInteger; success: PInteger): GLKVector3;
  cdecl; external libGLKit name _PU + 'GLKMathUnproject';
function NSStringFromGLKMatrix2(matrix: GLKMatrix2): Pointer { NSString };
  cdecl; external libGLKit name _PU + 'NSStringFromGLKMatrix2';
function NSStringFromGLKMatrix3(matrix: GLKMatrix3): Pointer { NSString };
  cdecl; external libGLKit name _PU + 'NSStringFromGLKMatrix3';
function NSStringFromGLKMatrix4(matrix: GLKMatrix4): Pointer { NSString };
  cdecl; external libGLKit name _PU + 'NSStringFromGLKMatrix4';
function NSStringFromGLKVector2(vector: GLKVector2): Pointer { NSString };
  cdecl; external libGLKit name _PU + 'NSStringFromGLKVector2';
function NSStringFromGLKVector3(vector: GLKVector3): Pointer { NSString };
  cdecl; external libGLKit name _PU + 'NSStringFromGLKVector3';
function NSStringFromGLKVector4(vector: GLKVector4): Pointer { NSString };
  cdecl; external libGLKit name _PU + 'NSStringFromGLKVector4';
function NSStringFromGLKQuaternion(quaternion: GLKQuaternion)
  : Pointer { NSString }; cdecl;
  external libGLKit name _PU + 'NSStringFromGLKQuaternion';
function GLKVertexAttributeParametersFromModelIO(vertexFormat: Integer)
  : GLKVertexAttributeParameters; cdecl;
  external libGLKit name _PU + 'GLKVertexAttributeParametersFromModelIO';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  GLKitModule: THandle;

{$ENDIF IOS}

function kGLKModelErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libGLKit, 'kGLKModelErrorDomain');
end;

function kGLKModelErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libGLKit, 'kGLKModelErrorKey');
end;

function GLKTextureLoaderApplyPremultiplication: NSString;
begin
  Result := CocoaNSStringConst(libGLKit,
    'GLKTextureLoaderApplyPremultiplication');
end;

function GLKTextureLoaderGenerateMipmaps: NSString;
begin
  Result := CocoaNSStringConst(libGLKit, 'GLKTextureLoaderGenerateMipmaps');
end;

function GLKTextureLoaderOriginBottomLeft: NSString;
begin
  Result := CocoaNSStringConst(libGLKit, 'GLKTextureLoaderOriginBottomLeft');
end;

function GLKTextureLoaderGrayscaleAsAlpha: NSString;
begin
  Result := CocoaNSStringConst(libGLKit, 'GLKTextureLoaderGrayscaleAsAlpha');
end;

function GLKTextureLoaderSRGB: NSString;
begin
  Result := CocoaNSStringConst(libGLKit, 'GLKTextureLoaderSRGB');
end;

function GLKTextureLoaderErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libGLKit, 'GLKTextureLoaderErrorDomain');
end;

function GLKTextureLoaderErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libGLKit, 'GLKTextureLoaderErrorKey');
end;

function GLKTextureLoaderGLErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libGLKit, 'GLKTextureLoaderGLErrorKey');
end;

function GLKQuaternionIdentity: Pointer;
begin
  Result := CocoaPointerConst(libGLKit, 'GLKQuaternionIdentity');
end;

function GLKMatrix3Identity: Pointer;
begin
  Result := CocoaPointerConst(libGLKit, 'GLKMatrix3Identity');
end;

function GLKMatrix4Identity: Pointer;
begin
  Result := CocoaPointerConst(libGLKit, 'GLKMatrix4Identity');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

GLKitModule := dlopen(MarshaledAString(libGLKit), RTLD_LAZY);

finalization

dlclose(GLKitModule);
{$ENDIF IOS}

end.
