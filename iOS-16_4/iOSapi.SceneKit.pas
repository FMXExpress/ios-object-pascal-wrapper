{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework SceneKit
//

unit iOSapi.SceneKit;

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
  iOSapi.GLKit,
  iOSapi.Metal,
  iOSapi.OpenGLES,
  iOSapi.QuartzCore,
  iOSapi.UIKit;

const
  SCNActionTimingModeLinear = 0;
  SCNActionTimingModeEaseIn = 1;
  SCNActionTimingModeEaseOut = 2;
  SCNActionTimingModeEaseInEaseOut = 3;
  SCNColorMaskNone = 0;
  SCNColorMaskRed = 1 shl 3;
  SCNColorMaskGreen = 1 shl 2;
  SCNColorMaskBlue = 1 shl 1;
  SCNColorMaskAlpha = 1 shl 0;
  SCNColorMaskAll = 15;
  SCNProgramCompilationError = 1;
  SCNMovabilityHintFixed = 0;
  SCNMovabilityHintMovable = 1;
  SCNNodeFocusBehaviorNone = 0;
  SCNNodeFocusBehaviorOccluding = 1;
  SCNNodeFocusBehaviorFocusable = 2;
  SCNConsistencyInvalidURIError = 1000;
  SCNConsistencyInvalidCountError = 1001;
  SCNConsistencyInvalidArgumentError = 1002;
  SCNConsistencyMissingElementError = 1003;
  SCNConsistencyMissingAttributeError = 1004;
  SCNConsistencyXMLSchemaValidationError = 1005;
  SCNSceneSourceStatusError = -1;
  SCNSceneSourceStatusParsing = 4;
  SCNSceneSourceStatusValidating = 8;
  SCNSceneSourceStatusProcessing = 12;
  SCNSceneSourceStatusComplete = 16;
  SCNFilterModeNone = 0;
  SCNFilterModeNearest = 1;
  SCNFilterModeLinear = 2;
  SCNWrapModeClamp = 1;
  SCNWrapModeRepeat = 2;
  SCNWrapModeClampToBorder = 3;
  SCNWrapModeMirror = 4;
  SCNBufferFrequencyPerFrame = 0;
  SCNBufferFrequencyPerNode = 1;
  SCNBufferFrequencyPerShadable = 2;
  SCNShadowModeForward = 0;
  SCNShadowModeDeferred = 1;
  SCNShadowModeModulated = 2;
  SCNLightProbeTypeIrradiance = 0;
  SCNLightProbeTypeRadiance = 1;
  SCNLightProbeUpdateTypeNever = 0;
  SCNLightProbeUpdateTypeRealtime = 1;
  SCNLightAreaTypeRectangle = 1;
  SCNLightAreaTypePolygon = 4;
  SCNCameraProjectionDirectionVertical = 0;
  SCNCameraProjectionDirectionHorizontal = 1;
  SCNGeometryPrimitiveTypeTriangles = 0;
  SCNGeometryPrimitiveTypeTriangleStrip = 1;
  SCNGeometryPrimitiveTypeLine = 2;
  SCNGeometryPrimitiveTypePoint = 3;
  SCNGeometryPrimitiveTypePolygon = 4;
  SCNTessellationSmoothingModeNone = 0;
  SCNTessellationSmoothingModePNTriangles = 1;
  SCNTessellationSmoothingModePhong = 2;
  SCNFillModeFill = 0;
  SCNFillModeLines = 1;
  SCNCullModeBack = 0;
  SCNCullModeFront = 1;
  SCNTransparencyModeAOne = 0;
  SCNTransparencyModeRGBZero = 1;
  SCNTransparencyModeSingleLayer = 2;
  SCNTransparencyModeDualLayer = 3;
  SCNTransparencyModeDefault = SCNTransparencyModeAOne;
  SCNBlendModeAlpha = 0;
  SCNBlendModeAdd = 1;
  SCNBlendModeSubtract = 2;
  SCNBlendModeMultiply = 3;
  SCNBlendModeScreen = 4;
  SCNBlendModeReplace = 5;
  SCNBlendModeMax = 6;
  SCNHitTestSearchModeClosest = 0;
  SCNHitTestSearchModeAll = 1;
  SCNHitTestSearchModeAny = 2;
  SCNAntialiasingModeNone = 0;
  SCNAntialiasingModeMultisampling2X = 1;
  SCNAntialiasingModeMultisampling4X = 2;
  SCNRenderingAPIMetal = 0;
  SCNRenderingAPIOpenGLES2 = 1;
  SCNDebugOptionNone = 0;
  SCNDebugOptionShowPhysicsShapes = 1 shl 0;
  SCNDebugOptionShowBoundingBoxes = 1 shl 1;
  SCNDebugOptionShowLightInfluences = 1 shl 2;
  SCNDebugOptionShowLightExtents = 1 shl 3;
  SCNDebugOptionShowPhysicsFields = 1 shl 4;
  SCNDebugOptionShowWireframe = 1 shl 5;
  SCNDebugOptionRenderAsWireframe = 1 shl 6;
  SCNDebugOptionShowSkeletons = 1 shl 7;
  SCNDebugOptionShowCreases = 1 shl 8;
  SCNDebugOptionShowConstraints = 1 shl 9;
  SCNDebugOptionShowCameras = 1 shl 10;
  SCNChamferModeBoth = 0;
  SCNChamferModeFront = 1;
  SCNChamferModeBack = 2;
  SCNMorpherCalculationModeNormalized = 0;
  SCNMorpherCalculationModeAdditive = 1;
  SCNBillboardAxisX = 1 shl 0;
  SCNBillboardAxisY = 1 shl 1;
  SCNBillboardAxisZ = 1 shl 2;
  SCNBillboardAxisAll = SCNBillboardAxisX or SCNBillboardAxisY or
    SCNBillboardAxisZ;
  SCNParticleSortingModeNone = 0;
  SCNParticleSortingModeProjectedDepth = 1;
  SCNParticleSortingModeDistance = 2;
  SCNParticleSortingModeOldestFirst = 3;
  SCNParticleSortingModeYoungestFirst = 4;
  SCNParticleBlendModeAdditive = 0;
  SCNParticleBlendModeSubtract = 1;
  SCNParticleBlendModeMultiply = 2;
  SCNParticleBlendModeScreen = 3;
  SCNParticleBlendModeAlpha = 4;
  SCNParticleBlendModeReplace = 5;
  SCNParticleOrientationModeBillboardScreenAligned = 0;
  SCNParticleOrientationModeBillboardViewAligned = 1;
  SCNParticleOrientationModeFree = 2;
  SCNParticleOrientationModeBillboardYAligned = 3;
  SCNParticleBirthLocationSurface = 0;
  SCNParticleBirthLocationVolume = 1;
  SCNParticleBirthLocationVertex = 2;
  SCNParticleBirthDirectionConstant = 0;
  SCNParticleBirthDirectionSurfaceNormal = 1;
  SCNParticleBirthDirectionRandom = 2;
  SCNParticleImageSequenceAnimationModeRepeat = 0;
  SCNParticleImageSequenceAnimationModeClamp = 1;
  SCNParticleImageSequenceAnimationModeAutoReverse = 2;
  SCNParticleInputModeOverLife = 0;
  SCNParticleInputModeOverDistance = 1;
  SCNParticleInputModeOverOtherProperty = 2;
  SCNParticleModifierStagePreDynamics = 0;
  SCNParticleModifierStagePostDynamics = 1;
  SCNParticleModifierStagePreCollision = 2;
  SCNParticleModifierStagePostCollision = 3;
  SCNParticleEventBirth = 0;
  SCNParticleEventDeath = 1;
  SCNParticleEventCollision = 2;
  SCNPhysicsBodyTypeStatic = 0;
  SCNPhysicsBodyTypeDynamic = 1;
  SCNPhysicsBodyTypeKinematic = 2;
  SCNPhysicsCollisionCategoryDefault = 1 shl 0;
  SCNPhysicsCollisionCategoryStatic = 1 shl 1;
  SCNPhysicsCollisionCategoryAll = not 0;
  SCNPhysicsFieldScopeInsideExtent = 0;
  SCNPhysicsFieldScopeOutsideExtent = 1;
  SCNReferenceLoadingPolicyImmediate = 0;
  SCNReferenceLoadingPolicyOnDemand = 1;
  SCNInteractionModeFly = 0;
  SCNInteractionModeOrbitTurntable = 1;
  SCNInteractionModeOrbitAngleMapping = 2;
  SCNInteractionModeOrbitCenteredArcball = 3;
  SCNInteractionModeOrbitArcball = 4;
  SCNInteractionModePan = 5;
  SCNInteractionModeTruck = 6;

type

  // ===== Forward declarations =====
{$M+}
  SceneKitAdditions = interface;
  SCNAnimation = interface;
  SCNAnimationEvent = interface;
  SCNAnimationPlayer = interface;
  SCNAnimatable = interface;
  SCNTimingFunction = interface;
  SCNBoundingVolume = interface;
  SCNNode = interface;
  SCNAction = interface;
  SCNAudioSource = interface;
  SCNActionable = interface;
  SCNLight = interface;
  SCNCamera = interface;
  SCNGeometry = interface;
  SCNSkinner = interface;
  SCNMorpher = interface;
  SCNConstraint = interface;
  SCNPhysicsBody = interface;
  SCNPhysicsField = interface;
  SCNHitTestResult = interface;
  SCNRenderer = interface;
  SCNNodeRendererDelegate = interface;
  UIFocusItem = interface;
  SCNScene = interface;
  SCNSceneSource = interface;
  SCNMaterialProperty = interface;
  SCNPhysicsWorld = interface;
  SCNSceneExportDelegate = interface;
  SCNMaterial = interface;
  SCNProgram = interface;
  SCNProgramDelegate = interface;
  SCNShadable = interface;
  SCNBufferStream = interface;
  SCNTechnique = interface;
  SCNTechniqueSupport = interface;
  SCNGeometrySource = interface;
  SCNGeometryElement = interface;
  SCNGeometryTessellator = interface;
  SCNLevelOfDetail = interface;
  SCNSceneRendererDelegate = interface;
  SCNSceneRenderer = interface;
  SCNCameraController = interface;
  SCNCameraControlConfiguration = interface;
  SCNView = interface;
  SCNPlane = interface;
  SCNBox = interface;
  SCNPyramid = interface;
  SCNSphere = interface;
  SCNCylinder = interface;
  SCNCone = interface;
  SCNTube = interface;
  SCNCapsule = interface;
  SCNTorus = interface;
  SCNFloor = interface;
  SCNText = interface;
  SCNShape = interface;
  SCNTransaction = interface;
  SCNLookAtConstraint = interface;
  SCNBillboardConstraint = interface;
  SCNTransformConstraint = interface;
  SCNIKConstraint = interface;
  SCNDistanceConstraint = interface;
  SCNReplicatorConstraint = interface;
  SCNAccelerationConstraint = interface;
  SCNSliderConstraint = interface;
  SCNAvoidOccluderConstraint = interface;
  SCNAvoidOccluderConstraintDelegate = interface;
  SCNParticlePropertyController = interface;
  SCNParticleSystem = interface;
  SCNPhysicsShape = interface;
  SCNPhysicsContact = interface;
  SCNPhysicsBehavior = interface;
  SCNPhysicsContactDelegate = interface;
  SCNPhysicsHingeJoint = interface;
  SCNPhysicsBallSocketJoint = interface;
  SCNPhysicsSliderJoint = interface;
  SCNPhysicsConeTwistJoint = interface;
  SCNPhysicsVehicleWheel = interface;
  SCNPhysicsVehicle = interface;
  SCNReferenceNode = interface;
  SCNAudioPlayer = interface;
  SCNCameraControllerDelegate = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  SCNActionTimingMode = NSInteger;
  SCNColorMask = NSInteger;

  SCNVector3 = record
    x: Single;
    y: Single;
    z: Single;
  end;

  PSCNVector3 = ^SCNVector3;

  SCNVector4 = record
    x: Single;
    y: Single;
    z: Single;
    w: Single;
  end;

  PSCNVector4 = ^SCNVector4;

  SCNQuaternion = SCNVector4;

  SCNMatrix4 = record
    m11: Single;
    m12: Single;
    m13: Single;
    m14: Single;
    m21: Single;
    m22: Single;
    m23: Single;
    m24: Single;
    m31: Single;
    m32: Single;
    m33: Single;
    m34: Single;
    m41: Single;
    m42: Single;
    m43: Single;
    m44: Single;
  end;

  PSCNMatrix4 = ^SCNMatrix4;

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

  simd_float3 = - - < Type : : ExtVector >;
  Psimd_float3 = ^simd_float3;
  simd_float4 = - - < Type : : ExtVector >;
  Psimd_float4 = ^simd_float4;

  simd_float4x4 = record
    columns: array [0 .. 3] of simd_float4;
  end;

  Psimd_float4x4 = ^simd_float4x4;

  CGFloat = Single;
  PCGFloat = ^CGFloat;

  SCNAnimationDidStartBlock = procedure(param1: SCNAnimation; param2: Pointer)
    of object;
  SCNAnimationDidStopBlock = procedure(param1: SCNAnimation; param2: Pointer;
    param3: Boolean) of object;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  SCNAnimationEventBlock = procedure(param1: Pointer; param2: Pointer;
    param3: Boolean) of object;
  SCNActionTimingFunction = function(param1: Single): Single; cdecl;
  TSceneKitCompletionHandler = procedure() of object;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  TSceneKitBlock = procedure(param1: SCNNode) of object;
  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;
  TSceneKitActionBlock = procedure(param1: SCNNode; param2: CGFloat) of object;
  SCNMovabilityHint = NSInteger;
  SCNNodeFocusBehavior = NSInteger;
  TSceneKitPredicate = function(param1: SCNNode; param2: PBoolean)
    : Boolean; cdecl;
  TSceneKitBlock1 = procedure(param1: SCNNode; param2: PBoolean) of object;

  simd_quatf = record
    vector: simd_float4;
  end;

  Psimd_quatf = ^simd_quatf;

  SCNSceneSourceLoadingOption = NSString;
  PSCNSceneSourceLoadingOption = ^SCNSceneSourceLoadingOption;
  SCNSceneSourceAnimationImportPolicy = NSString;
  PSCNSceneSourceAnimationImportPolicy = ^SCNSceneSourceAnimationImportPolicy;
  SCNSceneSourceStatus = NSInteger;
  SCNSceneSourceStatusHandler = procedure(param1: Single;
    param2: SCNSceneSourceStatus; param3: NSError; param4: PBoolean) of object;
  TSceneKitPredicate1 = function(param1: Pointer; param2: NSString;
    param3: PBoolean): Boolean; cdecl;
  SCNFilterMode = NSInteger;
  SCNWrapMode = NSInteger;
  SCNSceneExportProgressHandler = procedure(param1: Single; param2: NSError;
    param3: PBoolean) of object;
  SCNSceneAttribute = NSString;
  PSCNSceneAttribute = ^SCNSceneAttribute;
  SCNShaderModifierEntryPoint = NSString;
  PSCNShaderModifierEntryPoint = ^SCNShaderModifierEntryPoint;
  SCNBufferFrequency = NSInteger;
  SCNBufferBindingBlock = procedure(param1: Pointer; param2: SCNNode;
    param3: Pointer; param4: SCNRenderer) of object;
  SCNBindingBlock = procedure(param1: Cardinal; param2: Cardinal;
    param3: SCNNode; param4: SCNRenderer) of object;
  SCNLightType = NSString;
  PSCNLightType = ^SCNLightType;
  SCNShadowMode = NSInteger;
  SCNLightProbeType = NSInteger;
  SCNLightProbeUpdateType = NSInteger;
  SCNLightAreaType = NSInteger;

  CGSize = record
    width: CGFloat;
    height: CGFloat;
  end;

  PCGSize = ^CGSize;

  SCNCameraProjectionDirection = NSInteger;
  SCNGeometryPrimitiveType = NSInteger;
  SCNGeometrySourceSemantic = NSString;
  PSCNGeometrySourceSemantic = ^SCNGeometrySourceSemantic;
  MTLVertexFormat = NSUInteger;

  _NSRange = record
    location: NSUInteger;
    length: NSUInteger;
  end;

  P_NSRange = ^_NSRange;
  NSRange = _NSRange;
  PNSRange = ^NSRange;

  SCNTessellationSmoothingMode = NSInteger;
  MTLTessellationPartitionMode = NSUInteger;
  SCNLightingModel = NSString;
  PSCNLightingModel = ^SCNLightingModel;
  SCNFillMode = NSUInteger;
  SCNCullMode = NSInteger;
  SCNTransparencyMode = NSInteger;
  SCNBlendMode = NSInteger;
  SCNHitTestSearchMode = NSInteger;
  SCNHitTestOption = NSString;
  PSCNHitTestOption = ^SCNHitTestOption;

  CGPoint = record
    x: CGFloat;
    y: CGFloat;
  end;

  PCGPoint = ^CGPoint;

  SCNAntialiasingMode = NSUInteger;
  SCNRenderingAPI = NSUInteger;
  SCNDebugOptions = NSUInteger;
  TSceneKitShouldAbortBlock = function(): Boolean; cdecl;
  TSceneKitWithCompletionHandler = procedure(param1: Boolean) of object;
  MTLPixelFormat = NSUInteger;

  CGRect = record
    origin: CGPoint;
    size: CGSize;
  end;

  PCGRect = ^CGRect;

  SCNViewOption = NSString;
  PSCNViewOption = ^SCNViewOption;
  CFTimeInterval = Double;
  PCFTimeInterval = ^CFTimeInterval;

  SCNChamferMode = NSInteger;
  SCNMorpherCalculationMode = NSInteger;
  SCNBillboardAxis = NSUInteger;
  TSceneKitWithBlock = function(param1: SCNNode; param2: SCNMatrix4)
    : SCNMatrix4; cdecl;
  TSceneKitWithBlock1 = function(param1: SCNNode; param2: SCNVector3)
    : SCNVector3; cdecl;
  TSceneKitWithBlock2 = function(param1: SCNNode; param2: SCNQuaternion)
    : SCNQuaternion; cdecl;
  SCNParticleProperty = NSString;
  PSCNParticleProperty = ^SCNParticleProperty;
  SCNParticleEventBlock = procedure(param1: Pointer; param2: PLongWord;
    param3: PLongWord; param4: NSInteger) of object;
  SCNParticleModifierBlock = procedure(param1: Pointer; param2: PLongWord;
    param3: NSInteger; param4: NSInteger; param5: Single) of object;
  SCNParticleSortingMode = NSInteger;
  SCNParticleBlendMode = NSInteger;
  SCNParticleOrientationMode = NSInteger;
  SCNParticleBirthLocation = NSInteger;
  SCNParticleBirthDirection = NSInteger;
  SCNParticleImageSequenceAnimationMode = NSInteger;
  SCNParticleInputMode = NSInteger;
  SCNParticleModifierStage = NSInteger;
  SCNParticleEvent = NSInteger;
  SCNPhysicsBodyType = NSInteger;
  SCNPhysicsCollisionCategory = NSUInteger;
  SCNPhysicsFieldScope = NSInteger;
  SCNFieldForceEvaluator = function(param1: SCNVector3; param2: SCNVector3;
    param3: Single; param4: Single; param5: NSTimeInterval): SCNVector3; cdecl;
  SCNPhysicsShapeOption = NSString;
  PSCNPhysicsShapeOption = ^SCNPhysicsShapeOption;
  SCNPhysicsShapeType = NSString;
  PSCNPhysicsShapeType = ^SCNPhysicsShapeType;
  SCNPhysicsTestOption = NSString;
  PSCNPhysicsTestOption = ^SCNPhysicsTestOption;
  SCNPhysicsTestSearchMode = NSString;
  PSCNPhysicsTestSearchMode = ^SCNPhysicsTestSearchMode;
  SCNReferenceLoadingPolicy = NSInteger;
  SCNInteractionMode = NSInteger;
  // ===== Interface declarations =====

  SceneKitAdditions = interface(IObjectiveC)
    ['{674CFDD9-F130-4658-A1D9-95BDB2C30E7F}']
    function valueWithSCNVector3(v: SCNVector3): NSValue; cdecl;
    function valueWithSCNVector4(v: SCNVector4): NSValue; cdecl;
    function valueWithSCNMatrix4(v: SCNMatrix4): NSValue; cdecl;
    function SCNVector3Value: SCNVector3; cdecl;
    function SCNVector4Value: SCNVector4; cdecl;
    function SCNMatrix4Value: SCNMatrix4; cdecl;
    function animationWithSCNAnimation(animation: SCNAnimation)
      : CAAnimation; cdecl;
    procedure setUsesSceneTimeBase(usesSceneTimeBase: Boolean); cdecl;
    function usesSceneTimeBase: Boolean; cdecl;
    procedure setFadeInDuration(fadeInDuration: CGFloat); cdecl;
    function fadeInDuration: CGFloat; cdecl;
    procedure setFadeOutDuration(fadeOutDuration: CGFloat); cdecl;
    function fadeOutDuration: CGFloat; cdecl;
    procedure setAnimationEvents(animationEvents: NSArray); cdecl;
    function animationEvents: NSArray; cdecl;
  end;

  SCNAnimationClass = interface(NSObjectClass)
    ['{C9028704-C2A0-465F-8A79-C21E7D11F717}']
    { class } function animationWithContentsOfURL(animationUrl: NSURL)
      : SCNAnimation; cdecl;
    { class } function animationNamed(animationName: NSString)
      : SCNAnimation; cdecl;
    { class } function animationWithCAAnimation(CAAnimation: CAAnimation)
      : SCNAnimation; cdecl;
  end;

  SCNAnimation = interface(NSObject)
    ['{7A548A33-3765-4567-8A3D-8C2794CED54D}']
    procedure setDuration(duration: NSTimeInterval); cdecl;
    function duration: NSTimeInterval; cdecl;
    procedure setKeyPath(keyPath: NSString); cdecl;
    function keyPath: NSString; cdecl;
    procedure setTimingFunction(timingFunction: SCNTimingFunction); cdecl;
    function timingFunction: SCNTimingFunction; cdecl;
    procedure setBlendInDuration(blendInDuration: NSTimeInterval); cdecl;
    function blendInDuration: NSTimeInterval; cdecl;
    procedure setBlendOutDuration(blendOutDuration: NSTimeInterval); cdecl;
    function blendOutDuration: NSTimeInterval; cdecl;
    procedure setRemovedOnCompletion(removedOnCompletion: Boolean); cdecl;
    function isRemovedOnCompletion: Boolean; cdecl;
    procedure setAppliedOnCompletion(appliedOnCompletion: Boolean); cdecl;
    function isAppliedOnCompletion: Boolean; cdecl;
    procedure setRepeatCount(repeatCount: CGFloat); cdecl;
    function repeatCount: CGFloat; cdecl;
    procedure setAutoreverses(autoreverses: Boolean); cdecl;
    function autoreverses: Boolean; cdecl;
    procedure setStartDelay(startDelay: NSTimeInterval); cdecl;
    function startDelay: NSTimeInterval; cdecl;
    procedure setTimeOffset(timeOffset: NSTimeInterval); cdecl;
    function timeOffset: NSTimeInterval; cdecl;
    procedure setFillsForward(fillsForward: Boolean); cdecl;
    function fillsForward: Boolean; cdecl;
    procedure setFillsBackward(fillsBackward: Boolean); cdecl;
    function fillsBackward: Boolean; cdecl;
    procedure setUsesSceneTimeBase(usesSceneTimeBase: Boolean); cdecl;
    function usesSceneTimeBase: Boolean; cdecl;
    procedure setAnimationDidStart(animationDidStart
      : SCNAnimationDidStartBlock); cdecl;
    function animationDidStart: SCNAnimationDidStartBlock; cdecl;
    procedure setAnimationDidStop(animationDidStop
      : SCNAnimationDidStopBlock); cdecl;
    function animationDidStop: SCNAnimationDidStopBlock; cdecl;
    procedure setAnimationEvents(animationEvents: NSArray); cdecl;
    function animationEvents: NSArray; cdecl;
    procedure setAdditive(additive: Boolean); cdecl;
    function isAdditive: Boolean; cdecl;
    procedure setCumulative(cumulative: Boolean); cdecl;
    function isCumulative: Boolean; cdecl;
  end;

  TSCNAnimation = class(TOCGenericImport<SCNAnimationClass, SCNAnimation>)
  end;

  PSCNAnimation = Pointer;

  SCNAnimationEventClass = interface(NSObjectClass)
    ['{0DA0878B-8C39-4A34-933A-4D6E79BEF05C}']
    { class } function animationEventWithKeyTime(time: CGFloat;
      block: SCNAnimationEventBlock): Pointer { instancetype }; cdecl;
  end;

  SCNAnimationEvent = interface(NSObject)
    ['{56BF5FCA-7D9A-4556-97F0-ABD61F580C60}']
  end;

  TSCNAnimationEvent = class(TOCGenericImport<SCNAnimationEventClass,
    SCNAnimationEvent>)
  end;

  PSCNAnimationEvent = Pointer;

  SCNAnimationPlayerClass = interface(NSObjectClass)
    ['{92FD181E-85A1-43D2-BB61-230044ECA340}']
    { class } function animationPlayerWithAnimation(animation: SCNAnimation)
      : SCNAnimationPlayer; cdecl;
  end;

  SCNAnimationPlayer = interface(NSObject)
    ['{4F56F6E5-831B-4154-9F4D-3C866D70AAC0}']
    function animation: SCNAnimation; cdecl;
    procedure setSpeed(speed: CGFloat); cdecl;
    function speed: CGFloat; cdecl;
    procedure setBlendFactor(blendFactor: CGFloat); cdecl;
    function blendFactor: CGFloat; cdecl;
    procedure setPaused(paused: Boolean); cdecl;
    function paused: Boolean; cdecl;
    procedure play; cdecl;
    procedure stop; cdecl;
    procedure stopWithBlendOutDuration(duration: NSTimeInterval); cdecl;
  end;

  TSCNAnimationPlayer = class(TOCGenericImport<SCNAnimationPlayerClass,
    SCNAnimationPlayer>)
  end;

  PSCNAnimationPlayer = Pointer;

  SCNTimingFunctionClass = interface(NSObjectClass)
    ['{FF69E5D7-43D3-4302-8B19-BD8D51AEB3C2}']
    { class } function functionWithTimingMode(timingMode: SCNActionTimingMode)
      : SCNTimingFunction; cdecl;
    { class } function functionWithCAMediaTimingFunction(caTimingFunction
      : CAMediaTimingFunction): SCNTimingFunction; cdecl;
  end;

  SCNTimingFunction = interface(NSObject)
    ['{6BC32F63-F747-4FBB-98FC-0FD4626158EA}']
  end;

  TSCNTimingFunction = class(TOCGenericImport<SCNTimingFunctionClass,
    SCNTimingFunction>)
  end;

  PSCNTimingFunction = Pointer;

  SCNNodeClass = interface(NSObjectClass)
    ['{117A5107-58AC-4EC9-9419-D736B3D6CFC9}']
    { class } function node: Pointer { instancetype }; cdecl;
    { class } function nodeWithGeometry(geometry: SCNGeometry): SCNNode; cdecl;
    { class } function nodeWithMDLObject(mdlObject: Pointer)
      : Pointer { instancetype }; cdecl;
  end;

  SCNNode = interface(NSObject)
    ['{52B666C0-1318-4C11-96B1-513A6D03A18A}']
    function clone: Pointer { instancetype }; cdecl;
    function flattenedClone: Pointer { instancetype }; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setLight(light: SCNLight); cdecl;
    function light: SCNLight; cdecl;
    procedure setCamera(camera: SCNCamera); cdecl;
    function camera: SCNCamera; cdecl;
    procedure setGeometry(geometry: SCNGeometry); cdecl;
    function geometry: SCNGeometry; cdecl;
    procedure setSkinner(skinner: SCNSkinner); cdecl;
    function skinner: SCNSkinner; cdecl;
    procedure setMorpher(morpher: SCNMorpher); cdecl;
    function morpher: SCNMorpher; cdecl;
    procedure setTransform(transform: SCNMatrix4); cdecl;
    function transform: SCNMatrix4; cdecl;
    function worldTransform: SCNMatrix4; cdecl;
    procedure setWorldTransform(worldTransform: SCNMatrix4); cdecl;
    procedure setPosition(position: SCNVector3); cdecl;
    function position: SCNVector3; cdecl;
    procedure setWorldPosition(worldPosition: SCNVector3); cdecl;
    function worldPosition: SCNVector3; cdecl;
    procedure setRotation(rotation: SCNVector4); cdecl;
    function rotation: SCNVector4; cdecl;
    procedure setOrientation(orientation: SCNQuaternion); cdecl;
    function orientation: SCNQuaternion; cdecl;
    procedure setWorldOrientation(worldOrientation: SCNQuaternion); cdecl;
    function worldOrientation: SCNQuaternion; cdecl;
    procedure setEulerAngles(eulerAngles: SCNVector3); cdecl;
    function eulerAngles: SCNVector3; cdecl;
    procedure setScale(scale: SCNVector3); cdecl;
    function scale: SCNVector3; cdecl;
    procedure setPivot(pivot: SCNMatrix4); cdecl;
    function pivot: SCNMatrix4; cdecl;
    procedure setHidden(hidden: Boolean); cdecl;
    function isHidden: Boolean; cdecl;
    procedure setOpacity(opacity: CGFloat); cdecl;
    function opacity: CGFloat; cdecl;
    procedure setRenderingOrder(renderingOrder: NSInteger); cdecl;
    function renderingOrder: NSInteger; cdecl;
    procedure setCastsShadow(castsShadow: Boolean); cdecl;
    function castsShadow: Boolean; cdecl;
    procedure setMovabilityHint(movabilityHint: SCNMovabilityHint); cdecl;
    function movabilityHint: SCNMovabilityHint; cdecl;
    function parentNode: SCNNode; cdecl;
    function childNodes: NSArray; cdecl;
    procedure addChildNode(child: SCNNode); cdecl;
    procedure insertChildNode(child: SCNNode; atIndex: NSUInteger); cdecl;
    procedure removeFromParentNode; cdecl;
    procedure replaceChildNode(oldChild: SCNNode; &with: SCNNode); cdecl;
    function childNodeWithName(name: NSString; recursively: Boolean)
      : SCNNode; cdecl;
    function childNodesPassingTest(predicate: TSceneKitPredicate)
      : NSArray; cdecl;
    procedure enumerateChildNodesUsingBlock(block: TSceneKitBlock1); cdecl;
    procedure enumerateHierarchyUsingBlock(block: TSceneKitBlock1); cdecl;
    [MethodName('convertPosition:toNode:')]
    function convertPositionToNode(position: SCNVector3; toNode: SCNNode)
      : SCNVector3; cdecl;
    [MethodName('convertPosition:fromNode:')]
    function convertPositionFromNode(position: SCNVector3; fromNode: SCNNode)
      : SCNVector3; cdecl;
    [MethodName('convertVector:toNode:')]
    function convertVectorToNode(vector: SCNVector3; toNode: SCNNode)
      : SCNVector3; cdecl;
    [MethodName('convertVector:fromNode:')]
    function convertVectorFromNode(vector: SCNVector3; fromNode: SCNNode)
      : SCNVector3; cdecl;
    [MethodName('convertTransform:toNode:')]
    function convertTransformToNode(transform: SCNMatrix4; toNode: SCNNode)
      : SCNMatrix4; cdecl;
    [MethodName('convertTransform:fromNode:')]
    function convertTransformFromNode(transform: SCNMatrix4; fromNode: SCNNode)
      : SCNMatrix4; cdecl;
    procedure setPhysicsBody(physicsBody: SCNPhysicsBody); cdecl;
    function physicsBody: SCNPhysicsBody; cdecl;
    procedure setPhysicsField(physicsField: SCNPhysicsField); cdecl;
    function physicsField: SCNPhysicsField; cdecl;
    procedure setConstraints(constraints: NSArray); cdecl;
    function constraints: NSArray; cdecl;
    procedure setFilters(filters: NSArray); cdecl;
    function filters: NSArray; cdecl;
    function presentationNode: SCNNode; cdecl;
    procedure setPaused(paused: Boolean); cdecl;
    function isPaused: Boolean; cdecl;
    procedure setRendererDelegate(rendererDelegate: Pointer); cdecl;
    function rendererDelegate: Pointer; cdecl;
    function hitTestWithSegmentFromPoint(pointA: SCNVector3;
      toPoint: SCNVector3; options: NSDictionary): NSArray; cdecl;
    procedure setCategoryBitMask(categoryBitMask: NSUInteger); cdecl;
    function categoryBitMask: NSUInteger; cdecl;
    procedure setFocusBehavior(focusBehavior: SCNNodeFocusBehavior); cdecl;
    function focusBehavior: SCNNodeFocusBehavior; cdecl;
    procedure setLocalUp(localUp: SCNVector3); cdecl;
    function localUp: SCNVector3; cdecl;
    procedure setLocalRight(localRight: SCNVector3); cdecl;
    function localRight: SCNVector3; cdecl;
    procedure setLocalFront(localFront: SCNVector3); cdecl;
    function localFront: SCNVector3; cdecl;
    function worldUp: SCNVector3; cdecl;
    function worldRight: SCNVector3; cdecl;
    function worldFront: SCNVector3; cdecl;
    [MethodName('lookAt:')]
    procedure lookAt(worldTarget: SCNVector3); cdecl;
    [MethodName('lookAt:up:localFront:')]
    procedure lookAtUpLocalFront(worldTarget: SCNVector3; up: SCNVector3;
      localFront: SCNVector3); cdecl;
    procedure localTranslateBy(translation: SCNVector3); cdecl;
    procedure localRotateBy(rotation: SCNQuaternion); cdecl;
    procedure rotateBy(worldRotation: SCNQuaternion;
      aroundTarget: SCNVector3); cdecl;
    procedure setSimdTransform(simdTransform: simd_float4x4); cdecl;
    function simdTransform: simd_float4x4; cdecl;
    procedure setSimdPosition(simdPosition: simd_float3); cdecl;
    function simdPosition: simd_float3; cdecl;
    procedure setSimdRotation(simdRotation: simd_float4); cdecl;
    function simdRotation: simd_float4; cdecl;
    procedure setSimdOrientation(simdOrientation: simd_quatf); cdecl;
    function simdOrientation: simd_quatf; cdecl;
    procedure setSimdEulerAngles(simdEulerAngles: simd_float3); cdecl;
    function simdEulerAngles: simd_float3; cdecl;
    procedure setSimdScale(simdScale: simd_float3); cdecl;
    function simdScale: simd_float3; cdecl;
    procedure setSimdPivot(simdPivot: simd_float4x4); cdecl;
    function simdPivot: simd_float4x4; cdecl;
    procedure setSimdWorldPosition(simdWorldPosition: simd_float3); cdecl;
    function simdWorldPosition: simd_float3; cdecl;
    procedure setSimdWorldOrientation(simdWorldOrientation: simd_quatf); cdecl;
    function simdWorldOrientation: simd_quatf; cdecl;
    procedure setSimdWorldTransform(simdWorldTransform: simd_float4x4); cdecl;
    function simdWorldTransform: simd_float4x4; cdecl;
    [MethodName('simdConvertPosition:toNode:')]
    function simdConvertPositionToNode(position: simd_float3; toNode: SCNNode)
      : simd_float3; cdecl;
    [MethodName('simdConvertPosition:fromNode:')]
    function simdConvertPositionFromNode(position: simd_float3;
      fromNode: SCNNode): simd_float3; cdecl;
    [MethodName('simdConvertVector:toNode:')]
    function simdConvertVectorToNode(vector: simd_float3; toNode: SCNNode)
      : simd_float3; cdecl;
    [MethodName('simdConvertVector:fromNode:')]
    function simdConvertVectorFromNode(vector: simd_float3; fromNode: SCNNode)
      : simd_float3; cdecl;
    [MethodName('simdConvertTransform:toNode:')]
    function simdConvertTransformToNode(transform: simd_float4x4;
      toNode: SCNNode): simd_float4x4; cdecl;
    [MethodName('simdConvertTransform:fromNode:')]
    function simdConvertTransformFromNode(transform: simd_float4x4;
      fromNode: SCNNode): simd_float4x4; cdecl;
    procedure setSimdLocalUp(simdLocalUp: simd_float3); cdecl;
    function simdLocalUp: simd_float3; cdecl;
    procedure setSimdLocalRight(simdLocalRight: simd_float3); cdecl;
    function simdLocalRight: simd_float3; cdecl;
    procedure setSimdLocalFront(simdLocalFront: simd_float3); cdecl;
    function simdLocalFront: simd_float3; cdecl;
    function simdWorldUp: simd_float3; cdecl;
    function simdWorldRight: simd_float3; cdecl;
    function simdWorldFront: simd_float3; cdecl;
    [MethodName('simdLookAt:')]
    procedure simdLookAt(worldTarget: simd_float3); cdecl;
    [MethodName('simdLookAt:up:localFront:')]
    procedure simdLookAtUpLocalFront(worldTarget: simd_float3; up: simd_float3;
      localFront: simd_float3); cdecl;
    procedure simdLocalTranslateBy(translation: simd_float3); cdecl;
    procedure simdLocalRotateBy(rotation: simd_quatf); cdecl;
    procedure simdRotateBy(worldRotation: simd_quatf;
      aroundTarget: simd_float3); cdecl;
    procedure addParticleSystem(system: SCNParticleSystem); cdecl;
    procedure removeAllParticleSystems; cdecl;
    procedure removeParticleSystem(system: SCNParticleSystem); cdecl;
    function particleSystems: NSArray; cdecl;
    procedure addAudioPlayer(player: SCNAudioPlayer); cdecl;
    procedure removeAllAudioPlayers; cdecl;
    procedure removeAudioPlayer(player: SCNAudioPlayer); cdecl;
    function audioPlayers: NSArray; cdecl;
  end;

  TSCNNode = class(TOCGenericImport<SCNNodeClass, SCNNode>)
  end;

  PSCNNode = Pointer;

  SCNActionClass = interface(NSObjectClass)
    ['{50444BBE-5674-4A17-831C-4B5809FCBBA6}']
    { class } function moveByX(deltaX: CGFloat; y: CGFloat; z: CGFloat;
      duration: NSTimeInterval): SCNAction; cdecl;
    { class } function moveBy(delta: SCNVector3; duration: NSTimeInterval)
      : SCNAction; cdecl;
    { class } function moveTo(location: SCNVector3; duration: NSTimeInterval)
      : SCNAction; cdecl;
    { class } function rotateByX(xAngle: CGFloat; y: CGFloat; z: CGFloat;
      duration: NSTimeInterval): SCNAction; cdecl;
    [MethodName('rotateToX:y:z:duration:')]
    { class } function rotateToXYZDuration(xAngle: CGFloat; y: CGFloat;
      z: CGFloat; duration: NSTimeInterval): SCNAction; cdecl;
    [MethodName('rotateToX:y:z:duration:shortestUnitArc:')]
    { class } function rotateToXYZDurationShortestUnitArc(xAngle: CGFloat;
      y: CGFloat; z: CGFloat; duration: NSTimeInterval;
      shortestUnitArc: Boolean): SCNAction; cdecl;
    { class } function rotateByAngle(angle: CGFloat; aroundAxis: SCNVector3;
      duration: NSTimeInterval): SCNAction; cdecl;
    { class } function rotateToAxisAngle(axisAngle: SCNVector4;
      duration: NSTimeInterval): SCNAction; cdecl;
    { class } function scaleBy(scale: CGFloat; duration: NSTimeInterval)
      : SCNAction; cdecl;
    { class } function scaleTo(scale: CGFloat; duration: NSTimeInterval)
      : SCNAction; cdecl;
    { class } function sequence(actions: NSArray): SCNAction; cdecl;
    { class } function group(actions: NSArray): SCNAction; cdecl;
    { class } function repeatAction(action: SCNAction; count: NSUInteger)
      : SCNAction; cdecl;
    { class } function repeatActionForever(action: SCNAction): SCNAction; cdecl;
    { class } function fadeInWithDuration(sec: NSTimeInterval)
      : SCNAction; cdecl;
    { class } function fadeOutWithDuration(sec: NSTimeInterval)
      : SCNAction; cdecl;
    { class } function fadeOpacityBy(factor: CGFloat; duration: NSTimeInterval)
      : SCNAction; cdecl;
    { class } function fadeOpacityTo(opacity: CGFloat; duration: NSTimeInterval)
      : SCNAction; cdecl;
    { class } function hide: SCNAction; cdecl;
    { class } function unhide: SCNAction; cdecl;
    [MethodName('waitForDuration:')]
    { class } function waitForDuration(sec: NSTimeInterval): SCNAction; cdecl;
    [MethodName('waitForDuration:withRange:')]
    { class } function waitForDurationWithRange(sec: NSTimeInterval;
      withRange: NSTimeInterval): SCNAction; cdecl;
    { class } function removeFromParentNode: SCNAction; cdecl;
    [MethodName('runBlock:')]
    { class } function runBlock(block: TSceneKitBlock): SCNAction; cdecl;
    [MethodName('runBlock:queue:')]
    { class } function runBlockQueue(block: TSceneKitBlock;
      queue: dispatch_queue_t): SCNAction; cdecl;
    { class } function javaScriptActionWithScript(script: NSString;
      duration: NSTimeInterval): SCNAction; cdecl;
    { class } function customActionWithDuration(seconds: NSTimeInterval;
      actionBlock: TSceneKitActionBlock): SCNAction; cdecl;
    { class } function playAudioSource(source: SCNAudioSource;
      waitForCompletion: Boolean): SCNAction; cdecl;
  end;

  SCNAction = interface(NSObject)
    ['{2009B6AE-F452-4445-B446-07E7498DFD74}']
    procedure setDuration(duration: NSTimeInterval); cdecl;
    function duration: NSTimeInterval; cdecl;
    procedure setTimingMode(timingMode: SCNActionTimingMode); cdecl;
    function timingMode: SCNActionTimingMode; cdecl;
    procedure setTimingFunction(timingFunction: SCNActionTimingFunction); cdecl;
    function timingFunction: SCNActionTimingFunction; cdecl;
    procedure setSpeed(speed: CGFloat); cdecl;
    function speed: CGFloat; cdecl;
    function reversedAction: SCNAction; cdecl;
  end;

  TSCNAction = class(TOCGenericImport<SCNActionClass, SCNAction>)
  end;

  PSCNAction = Pointer;

  SCNAudioSourceClass = interface(NSObjectClass)
    ['{46BC6659-2C05-40DF-AC34-70C93F927DD9}']
    { class } function audioSourceNamed(fileName: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  SCNAudioSource = interface(NSObject)
    ['{F6E25407-2815-47C6-8170-0705ACBE91C6}']
    function initWithFileNamed(name: NSString): Pointer { instancetype }; cdecl;
    function initWithURL(url: NSURL): Pointer { instancetype }; cdecl;
    procedure setPositional(positional: Boolean); cdecl;
    function isPositional: Boolean; cdecl;
    procedure setVolume(volume: Single); cdecl;
    function volume: Single; cdecl;
    procedure setRate(rate: Single); cdecl;
    function rate: Single; cdecl;
    procedure setReverbBlend(reverbBlend: Single); cdecl;
    function reverbBlend: Single; cdecl;
    procedure setLoops(loops: Boolean); cdecl;
    function loops: Boolean; cdecl;
    procedure setShouldStream(shouldStream: Boolean); cdecl;
    function shouldStream: Boolean; cdecl;
    procedure load; cdecl;
  end;

  TSCNAudioSource = class(TOCGenericImport<SCNAudioSourceClass, SCNAudioSource>)
  end;

  PSCNAudioSource = Pointer;

  SCNLightClass = interface(NSObjectClass)
    ['{2862FA7B-A128-440A-8A04-6B950B47E433}']
    { class } function light: Pointer { instancetype }; cdecl;
    { class } function lightWithMDLLight(mdlLight: Pointer)
      : Pointer { instancetype }; cdecl;
  end;

  SCNLight = interface(NSObject)
    ['{5B577783-EB36-4AED-B16A-9AD51CAB3F5C}']
    procedure setType(&type: SCNLightType); cdecl;
    function &type: SCNLightType; cdecl;
    procedure setColor(color: Pointer); cdecl;
    function color: Pointer; cdecl;
    procedure setTemperature(temperature: CGFloat); cdecl;
    function temperature: CGFloat; cdecl;
    procedure setIntensity(intensity: CGFloat); cdecl;
    function intensity: CGFloat; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setCastsShadow(castsShadow: Boolean); cdecl;
    function castsShadow: Boolean; cdecl;
    procedure setShadowColor(shadowColor: Pointer); cdecl;
    function shadowColor: Pointer; cdecl;
    procedure setShadowRadius(shadowRadius: CGFloat); cdecl;
    function shadowRadius: CGFloat; cdecl;
    procedure setShadowMapSize(shadowMapSize: CGSize); cdecl;
    function shadowMapSize: CGSize; cdecl;
    procedure setShadowSampleCount(shadowSampleCount: NSUInteger); cdecl;
    function shadowSampleCount: NSUInteger; cdecl;
    procedure setShadowMode(shadowMode: SCNShadowMode); cdecl;
    function shadowMode: SCNShadowMode; cdecl;
    procedure setShadowBias(shadowBias: CGFloat); cdecl;
    function shadowBias: CGFloat; cdecl;
    procedure setAutomaticallyAdjustsShadowProjection
      (automaticallyAdjustsShadowProjection: Boolean); cdecl;
    function automaticallyAdjustsShadowProjection: Boolean; cdecl;
    procedure setMaximumShadowDistance(maximumShadowDistance: CGFloat); cdecl;
    function maximumShadowDistance: CGFloat; cdecl;
    procedure setForcesBackFaceCasters(forcesBackFaceCasters: Boolean); cdecl;
    function forcesBackFaceCasters: Boolean; cdecl;
    procedure setSampleDistributedShadowMaps(sampleDistributedShadowMaps
      : Boolean); cdecl;
    function sampleDistributedShadowMaps: Boolean; cdecl;
    procedure setShadowCascadeCount(shadowCascadeCount: NSUInteger); cdecl;
    function shadowCascadeCount: NSUInteger; cdecl;
    procedure setShadowCascadeSplittingFactor(shadowCascadeSplittingFactor
      : CGFloat); cdecl;
    function shadowCascadeSplittingFactor: CGFloat; cdecl;
    procedure setOrthographicScale(orthographicScale: CGFloat); cdecl;
    function orthographicScale: CGFloat; cdecl;
    procedure setZNear(zNear: CGFloat); cdecl;
    function zNear: CGFloat; cdecl;
    procedure setZFar(zFar: CGFloat); cdecl;
    function zFar: CGFloat; cdecl;
    procedure setAttenuationStartDistance(attenuationStartDistance
      : CGFloat); cdecl;
    function attenuationStartDistance: CGFloat; cdecl;
    procedure setAttenuationEndDistance(attenuationEndDistance: CGFloat); cdecl;
    function attenuationEndDistance: CGFloat; cdecl;
    procedure setAttenuationFalloffExponent(attenuationFalloffExponent
      : CGFloat); cdecl;
    function attenuationFalloffExponent: CGFloat; cdecl;
    procedure setSpotInnerAngle(spotInnerAngle: CGFloat); cdecl;
    function spotInnerAngle: CGFloat; cdecl;
    procedure setSpotOuterAngle(spotOuterAngle: CGFloat); cdecl;
    function spotOuterAngle: CGFloat; cdecl;
    procedure setIESProfileURL(IESProfileURL: NSURL); cdecl;
    function IESProfileURL: NSURL; cdecl;
    function sphericalHarmonicsCoefficients: NSData; cdecl;
    procedure setProbeType(probeType: SCNLightProbeType); cdecl;
    function probeType: SCNLightProbeType; cdecl;
    procedure setProbeUpdateType(probeUpdateType
      : SCNLightProbeUpdateType); cdecl;
    function probeUpdateType: SCNLightProbeUpdateType; cdecl;
    procedure setProbeExtents(probeExtents: simd_float3); cdecl;
    function probeExtents: simd_float3; cdecl;
    procedure setProbeOffset(probeOffset: simd_float3); cdecl;
    function probeOffset: simd_float3; cdecl;
    procedure setParallaxCorrectionEnabled(parallaxCorrectionEnabled
      : Boolean); cdecl;
    function parallaxCorrectionEnabled: Boolean; cdecl;
    procedure setParallaxExtentsFactor(parallaxExtentsFactor
      : simd_float3); cdecl;
    function parallaxExtentsFactor: simd_float3; cdecl;
    procedure setParallaxCenterOffset(parallaxCenterOffset: simd_float3); cdecl;
    function parallaxCenterOffset: simd_float3; cdecl;
    function probeEnvironment: SCNMaterialProperty; cdecl;
    procedure setAreaType(areaType: SCNLightAreaType); cdecl;
    function areaType: SCNLightAreaType; cdecl;
    procedure setAreaExtents(areaExtents: simd_float3); cdecl;
    function areaExtents: simd_float3; cdecl;
    procedure setAreaPolygonVertices(areaPolygonVertices: NSArray); cdecl;
    function areaPolygonVertices: NSArray; cdecl;
    procedure setDrawsArea(drawsArea: Boolean); cdecl;
    function drawsArea: Boolean; cdecl;
    procedure setDoubleSided(doubleSided: Boolean); cdecl;
    function doubleSided: Boolean; cdecl;
    function gobo: SCNMaterialProperty; cdecl;
    procedure setCategoryBitMask(categoryBitMask: NSUInteger); cdecl;
    function categoryBitMask: NSUInteger; cdecl;
  end;

  TSCNLight = class(TOCGenericImport<SCNLightClass, SCNLight>)
  end;

  PSCNLight = Pointer;

  SCNCameraClass = interface(NSObjectClass)
    ['{7C3C1F0F-4EC8-4805-9BE9-79F0AF957A92}']
    { class } function camera: Pointer { instancetype }; cdecl;
    { class } function cameraWithMDLCamera(mdlCamera: Pointer)
      : Pointer { instancetype }; cdecl;
  end;

  SCNCamera = interface(NSObject)
    ['{CACE196B-4D25-4D62-AB07-CE39D1599553}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setFieldOfView(fieldOfView: CGFloat); cdecl;
    function fieldOfView: CGFloat; cdecl;
    procedure setProjectionDirection(projectionDirection
      : SCNCameraProjectionDirection); cdecl;
    function projectionDirection: SCNCameraProjectionDirection; cdecl;
    procedure setFocalLength(focalLength: CGFloat); cdecl;
    function focalLength: CGFloat; cdecl;
    procedure setSensorHeight(sensorHeight: CGFloat); cdecl;
    function sensorHeight: CGFloat; cdecl;
    procedure setZNear(zNear: Double); cdecl;
    function zNear: Double; cdecl;
    procedure setZFar(zFar: Double); cdecl;
    function zFar: Double; cdecl;
    procedure setAutomaticallyAdjustsZRange(automaticallyAdjustsZRange
      : Boolean); cdecl;
    function automaticallyAdjustsZRange: Boolean; cdecl;
    procedure setUsesOrthographicProjection(usesOrthographicProjection
      : Boolean); cdecl;
    function usesOrthographicProjection: Boolean; cdecl;
    procedure setOrthographicScale(orthographicScale: Double); cdecl;
    function orthographicScale: Double; cdecl;
    procedure setProjectionTransform(projectionTransform: SCNMatrix4); cdecl;
    function projectionTransform: SCNMatrix4; cdecl;
    function projectionTransformWithViewportSize(viewportSize: CGSize)
      : SCNMatrix4; cdecl;
    procedure setWantsDepthOfField(wantsDepthOfField: Boolean); cdecl;
    function wantsDepthOfField: Boolean; cdecl;
    procedure setFocusDistance(focusDistance: CGFloat); cdecl;
    function focusDistance: CGFloat; cdecl;
    procedure setFocalBlurSampleCount(focalBlurSampleCount: NSInteger); cdecl;
    function focalBlurSampleCount: NSInteger; cdecl;
    procedure setFStop(fStop: CGFloat); cdecl;
    function fStop: CGFloat; cdecl;
    procedure setApertureBladeCount(apertureBladeCount: NSInteger); cdecl;
    function apertureBladeCount: NSInteger; cdecl;
    procedure setMotionBlurIntensity(motionBlurIntensity: CGFloat); cdecl;
    function motionBlurIntensity: CGFloat; cdecl;
    procedure setScreenSpaceAmbientOcclusionIntensity
      (screenSpaceAmbientOcclusionIntensity: CGFloat); cdecl;
    function screenSpaceAmbientOcclusionIntensity: CGFloat; cdecl;
    procedure setScreenSpaceAmbientOcclusionRadius
      (screenSpaceAmbientOcclusionRadius: CGFloat); cdecl;
    function screenSpaceAmbientOcclusionRadius: CGFloat; cdecl;
    procedure setScreenSpaceAmbientOcclusionBias(screenSpaceAmbientOcclusionBias
      : CGFloat); cdecl;
    function screenSpaceAmbientOcclusionBias: CGFloat; cdecl;
    procedure setScreenSpaceAmbientOcclusionDepthThreshold
      (screenSpaceAmbientOcclusionDepthThreshold: CGFloat); cdecl;
    function screenSpaceAmbientOcclusionDepthThreshold: CGFloat; cdecl;
    procedure setScreenSpaceAmbientOcclusionNormalThreshold
      (screenSpaceAmbientOcclusionNormalThreshold: CGFloat); cdecl;
    function screenSpaceAmbientOcclusionNormalThreshold: CGFloat; cdecl;
    procedure setWantsHDR(wantsHDR: Boolean); cdecl;
    function wantsHDR: Boolean; cdecl;
    procedure setExposureOffset(exposureOffset: CGFloat); cdecl;
    function exposureOffset: CGFloat; cdecl;
    procedure setAverageGray(averageGray: CGFloat); cdecl;
    function averageGray: CGFloat; cdecl;
    procedure setWhitePoint(whitePoint: CGFloat); cdecl;
    function whitePoint: CGFloat; cdecl;
    procedure setWantsExposureAdaptation(wantsExposureAdaptation
      : Boolean); cdecl;
    function wantsExposureAdaptation: Boolean; cdecl;
    procedure setExposureAdaptationBrighteningSpeedFactor
      (exposureAdaptationBrighteningSpeedFactor: CGFloat); cdecl;
    function exposureAdaptationBrighteningSpeedFactor: CGFloat; cdecl;
    procedure setExposureAdaptationDarkeningSpeedFactor
      (exposureAdaptationDarkeningSpeedFactor: CGFloat); cdecl;
    function exposureAdaptationDarkeningSpeedFactor: CGFloat; cdecl;
    procedure setMinimumExposure(minimumExposure: CGFloat); cdecl;
    function minimumExposure: CGFloat; cdecl;
    procedure setMaximumExposure(maximumExposure: CGFloat); cdecl;
    function maximumExposure: CGFloat; cdecl;
    procedure setBloomThreshold(bloomThreshold: CGFloat); cdecl;
    function bloomThreshold: CGFloat; cdecl;
    procedure setBloomIterationCount(bloomIterationCount: NSInteger); cdecl;
    function bloomIterationCount: NSInteger; cdecl;
    procedure setBloomIterationSpread(bloomIterationSpread: CGFloat); cdecl;
    function bloomIterationSpread: CGFloat; cdecl;
    procedure setBloomIntensity(bloomIntensity: CGFloat); cdecl;
    function bloomIntensity: CGFloat; cdecl;
    procedure setBloomBlurRadius(bloomBlurRadius: CGFloat); cdecl;
    function bloomBlurRadius: CGFloat; cdecl;
    procedure setVignettingPower(vignettingPower: CGFloat); cdecl;
    function vignettingPower: CGFloat; cdecl;
    procedure setVignettingIntensity(vignettingIntensity: CGFloat); cdecl;
    function vignettingIntensity: CGFloat; cdecl;
    procedure setColorFringeStrength(colorFringeStrength: CGFloat); cdecl;
    function colorFringeStrength: CGFloat; cdecl;
    procedure setColorFringeIntensity(colorFringeIntensity: CGFloat); cdecl;
    function colorFringeIntensity: CGFloat; cdecl;
    procedure setSaturation(saturation: CGFloat); cdecl;
    function saturation: CGFloat; cdecl;
    procedure setContrast(contrast: CGFloat); cdecl;
    function contrast: CGFloat; cdecl;
    procedure setGrainIntensity(grainIntensity: CGFloat); cdecl;
    function grainIntensity: CGFloat; cdecl;
    procedure setGrainScale(grainScale: CGFloat); cdecl;
    function grainScale: CGFloat; cdecl;
    procedure setGrainIsColored(grainIsColored: Boolean); cdecl;
    function grainIsColored: Boolean; cdecl;
    procedure setWhiteBalanceTemperature(whiteBalanceTemperature
      : CGFloat); cdecl;
    function whiteBalanceTemperature: CGFloat; cdecl;
    procedure setWhiteBalanceTint(whiteBalanceTint: CGFloat); cdecl;
    function whiteBalanceTint: CGFloat; cdecl;
    function colorGrading: SCNMaterialProperty; cdecl;
    procedure setCategoryBitMask(categoryBitMask: NSUInteger); cdecl;
    function categoryBitMask: NSUInteger; cdecl;
    procedure setFocalBlurRadius(focalBlurRadius: CGFloat); cdecl;
    function focalBlurRadius: CGFloat; cdecl;
    procedure setXFov(xFov: Double); cdecl;
    function xFov: Double; cdecl;
    procedure setYFov(yFov: Double); cdecl;
    function yFov: Double; cdecl;
    procedure setAperture(aperture: CGFloat); cdecl;
    function aperture: CGFloat; cdecl;
    procedure setFocalSize(focalSize: CGFloat); cdecl;
    function focalSize: CGFloat; cdecl;
    procedure setFocalDistance(focalDistance: CGFloat); cdecl;
    function focalDistance: CGFloat; cdecl;
  end;

  TSCNCamera = class(TOCGenericImport<SCNCameraClass, SCNCamera>)
  end;

  PSCNCamera = Pointer;

  SCNGeometryClass = interface(NSObjectClass)
    ['{6A4FBF78-CDD1-4740-BB3D-F5CA1084EE14}']
    { class } function geometry: Pointer { instancetype }; cdecl;
    { class } function geometryWithSources(sources: NSArray; elements: NSArray)
      : Pointer { instancetype }; cdecl;
    { class } function geometryWithMDLMesh(mdlMesh: Pointer)
      : Pointer { instancetype }; cdecl;
  end;

  SCNGeometry = interface(NSObject)
    ['{984FE8BA-16BD-4DDA-9D10-9E1389F39EA4}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setMaterials(materials: NSArray); cdecl;
    function materials: NSArray; cdecl;
    procedure setFirstMaterial(firstMaterial: SCNMaterial); cdecl;
    function firstMaterial: SCNMaterial; cdecl;
    procedure insertMaterial(material: SCNMaterial; atIndex: NSUInteger); cdecl;
    procedure removeMaterialAtIndex(index: NSUInteger); cdecl;
    procedure replaceMaterialAtIndex(index: NSUInteger;
      withMaterial: SCNMaterial); cdecl;
    function materialWithName(name: NSString): SCNMaterial; cdecl;
    function geometrySources: NSArray; cdecl;
    function geometrySourcesForSemantic(semantic: SCNGeometrySourceSemantic)
      : NSArray; cdecl;
    function geometryElements: NSArray; cdecl;
    function geometryElementCount: NSInteger; cdecl;
    function geometryElementAtIndex(elementIndex: NSInteger)
      : SCNGeometryElement; cdecl;
    procedure setLevelsOfDetail(levelsOfDetail: NSArray); cdecl;
    function levelsOfDetail: NSArray; cdecl;
    procedure setTessellator(tessellator: SCNGeometryTessellator); cdecl;
    function tessellator: SCNGeometryTessellator; cdecl;
    procedure setSubdivisionLevel(subdivisionLevel: NSUInteger); cdecl;
    function subdivisionLevel: NSUInteger; cdecl;
    procedure setWantsAdaptiveSubdivision(wantsAdaptiveSubdivision
      : Boolean); cdecl;
    function wantsAdaptiveSubdivision: Boolean; cdecl;
    procedure setEdgeCreasesElement(edgeCreasesElement
      : SCNGeometryElement); cdecl;
    function edgeCreasesElement: SCNGeometryElement; cdecl;
    procedure setEdgeCreasesSource(edgeCreasesSource: SCNGeometrySource); cdecl;
    function edgeCreasesSource: SCNGeometrySource; cdecl;
  end;

  TSCNGeometry = class(TOCGenericImport<SCNGeometryClass, SCNGeometry>)
  end;

  PSCNGeometry = Pointer;

  SCNSkinnerClass = interface(NSObjectClass)
    ['{B89D9932-26D0-4D6E-8E9C-0F0CA76F1D7D}']
    { class } function skinnerWithBaseGeometry(baseGeometry: SCNGeometry;
      bones: NSArray; boneInverseBindTransforms: NSArray;
      boneWeights: SCNGeometrySource; boneIndices: SCNGeometrySource)
      : Pointer { instancetype }; cdecl;
  end;

  SCNSkinner = interface(NSObject)
    ['{5A611EA4-EE8E-41C7-8F3B-64F5EBACC50A}']
    procedure setSkeleton(skeleton: SCNNode); cdecl;
    function skeleton: SCNNode; cdecl;
    procedure setBaseGeometry(baseGeometry: SCNGeometry); cdecl;
    function baseGeometry: SCNGeometry; cdecl;
    procedure setBaseGeometryBindTransform(baseGeometryBindTransform
      : SCNMatrix4); cdecl;
    function baseGeometryBindTransform: SCNMatrix4; cdecl;
    function boneInverseBindTransforms: NSArray; cdecl;
    function bones: NSArray; cdecl;
    function boneWeights: SCNGeometrySource; cdecl;
    function boneIndices: SCNGeometrySource; cdecl;
  end;

  TSCNSkinner = class(TOCGenericImport<SCNSkinnerClass, SCNSkinner>)
  end;

  PSCNSkinner = Pointer;

  SCNMorpherClass = interface(NSObjectClass)
    ['{C23ABE4A-D55F-4029-8509-B475E47ED12E}']
  end;

  SCNMorpher = interface(NSObject)
    ['{ADF5D4D0-E205-4929-BCCC-5E0CEC712906}']
    procedure setTargets(targets: NSArray); cdecl;
    function targets: NSArray; cdecl;
    procedure setWeights(weights: NSArray); cdecl;
    function weights: NSArray; cdecl;
    [MethodName('setWeight:forTargetAtIndex:')]
    procedure setWeightForTargetAtIndex(weight: CGFloat;
      forTargetAtIndex: NSUInteger); cdecl;
    function weightForTargetAtIndex(targetIndex: NSUInteger): CGFloat; cdecl;
    [MethodName('setWeight:forTargetNamed:')]
    procedure setWeightForTargetNamed(weight: CGFloat;
      forTargetNamed: NSString); cdecl;
    function weightForTargetNamed(targetName: NSString): CGFloat; cdecl;
    procedure setCalculationMode(calculationMode
      : SCNMorpherCalculationMode); cdecl;
    function calculationMode: SCNMorpherCalculationMode; cdecl;
    procedure setUnifiesNormals(unifiesNormals: Boolean); cdecl;
    function unifiesNormals: Boolean; cdecl;
  end;

  TSCNMorpher = class(TOCGenericImport<SCNMorpherClass, SCNMorpher>)
  end;

  PSCNMorpher = Pointer;

  SCNConstraintClass = interface(NSObjectClass)
    ['{F007BDBC-0A4A-4330-A7C2-3C0D1F2DE72A}']
  end;

  SCNConstraint = interface(NSObject)
    ['{F7BA4830-C99B-465A-B005-F6E85798C030}']
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    procedure setInfluenceFactor(influenceFactor: CGFloat); cdecl;
    function influenceFactor: CGFloat; cdecl;
    procedure setIncremental(incremental: Boolean); cdecl;
    function isIncremental: Boolean; cdecl;
  end;

  TSCNConstraint = class(TOCGenericImport<SCNConstraintClass, SCNConstraint>)
  end;

  PSCNConstraint = Pointer;

  SCNPhysicsBodyClass = interface(NSObjectClass)
    ['{11B4C595-4B9D-4CD7-9992-BC6D4F0E7888}']
    { class } function staticBody: Pointer { instancetype }; cdecl;
    { class } function dynamicBody: Pointer { instancetype }; cdecl;
    { class } function kinematicBody: Pointer { instancetype }; cdecl;
    { class } function bodyWithType(&type: SCNPhysicsBodyType;
      shape: SCNPhysicsShape): Pointer { instancetype }; cdecl;
  end;

  SCNPhysicsBody = interface(NSObject)
    ['{9C62A520-E062-49B3-A1F3-8C634D1EB930}']
    procedure setType(&type: SCNPhysicsBodyType); cdecl;
    function &type: SCNPhysicsBodyType; cdecl;
    procedure setMass(mass: CGFloat); cdecl;
    function mass: CGFloat; cdecl;
    procedure setMomentOfInertia(momentOfInertia: SCNVector3); cdecl;
    function momentOfInertia: SCNVector3; cdecl;
    procedure setUsesDefaultMomentOfInertia(usesDefaultMomentOfInertia
      : Boolean); cdecl;
    function usesDefaultMomentOfInertia: Boolean; cdecl;
    procedure setCharge(charge: CGFloat); cdecl;
    function charge: CGFloat; cdecl;
    procedure setFriction(friction: CGFloat); cdecl;
    function friction: CGFloat; cdecl;
    procedure setRestitution(restitution: CGFloat); cdecl;
    function restitution: CGFloat; cdecl;
    procedure setRollingFriction(rollingFriction: CGFloat); cdecl;
    function rollingFriction: CGFloat; cdecl;
    procedure setPhysicsShape(physicsShape: SCNPhysicsShape); cdecl;
    function physicsShape: SCNPhysicsShape; cdecl;
    function isResting: Boolean; cdecl;
    procedure setAllowsResting(allowsResting: Boolean); cdecl;
    function allowsResting: Boolean; cdecl;
    procedure setVelocity(velocity: SCNVector3); cdecl;
    function velocity: SCNVector3; cdecl;
    procedure setAngularVelocity(angularVelocity: SCNVector4); cdecl;
    function angularVelocity: SCNVector4; cdecl;
    procedure setDamping(damping: CGFloat); cdecl;
    function damping: CGFloat; cdecl;
    procedure setAngularDamping(angularDamping: CGFloat); cdecl;
    function angularDamping: CGFloat; cdecl;
    procedure setVelocityFactor(velocityFactor: SCNVector3); cdecl;
    function velocityFactor: SCNVector3; cdecl;
    procedure setAngularVelocityFactor(angularVelocityFactor
      : SCNVector3); cdecl;
    function angularVelocityFactor: SCNVector3; cdecl;
    procedure setCategoryBitMask(categoryBitMask: NSUInteger); cdecl;
    function categoryBitMask: NSUInteger; cdecl;
    procedure setCollisionBitMask(collisionBitMask: NSUInteger); cdecl;
    function collisionBitMask: NSUInteger; cdecl;
    procedure setContactTestBitMask(contactTestBitMask: NSUInteger); cdecl;
    function contactTestBitMask: NSUInteger; cdecl;
    procedure setAffectedByGravity(affectedByGravity: Boolean); cdecl;
    function isAffectedByGravity: Boolean; cdecl;
    [MethodName('applyForce:impulse:')]
    procedure applyForceImpulse(direction: SCNVector3; impulse: Boolean); cdecl;
    [MethodName('applyForce:atPosition:impulse:')]
    procedure applyForceAtPositionImpulse(direction: SCNVector3;
      atPosition: SCNVector3; impulse: Boolean); cdecl;
    procedure applyTorque(torque: SCNVector4; impulse: Boolean); cdecl;
    procedure clearAllForces; cdecl;
    procedure resetTransform; cdecl;
    procedure setResting(resting: Boolean); cdecl;
    procedure setContinuousCollisionDetectionThreshold
      (continuousCollisionDetectionThreshold: CGFloat); cdecl;
    function continuousCollisionDetectionThreshold: CGFloat; cdecl;
    procedure setCenterOfMassOffset(centerOfMassOffset: SCNVector3); cdecl;
    function centerOfMassOffset: SCNVector3; cdecl;
    procedure setLinearRestingThreshold(linearRestingThreshold: CGFloat); cdecl;
    function linearRestingThreshold: CGFloat; cdecl;
    procedure setAngularRestingThreshold(angularRestingThreshold
      : CGFloat); cdecl;
    function angularRestingThreshold: CGFloat; cdecl;
  end;

  TSCNPhysicsBody = class(TOCGenericImport<SCNPhysicsBodyClass, SCNPhysicsBody>)
  end;

  PSCNPhysicsBody = Pointer;

  SCNPhysicsFieldClass = interface(NSObjectClass)
    ['{6AEE2B82-A663-4DEE-8A6A-62EBDE89A84B}']
    { class } function dragField: SCNPhysicsField; cdecl;
    { class } function vortexField: SCNPhysicsField; cdecl;
    { class } function radialGravityField: SCNPhysicsField; cdecl;
    { class } function linearGravityField: SCNPhysicsField; cdecl;
    { class } function noiseFieldWithSmoothness(smoothness: CGFloat;
      animationSpeed: CGFloat): SCNPhysicsField; cdecl;
    { class } function turbulenceFieldWithSmoothness(smoothness: CGFloat;
      animationSpeed: CGFloat): SCNPhysicsField; cdecl;
    { class } function springField: SCNPhysicsField; cdecl;
    { class } function electricField: SCNPhysicsField; cdecl;
    { class } function magneticField: SCNPhysicsField; cdecl;
    { class } function customFieldWithEvaluationBlock
      (block: SCNFieldForceEvaluator): SCNPhysicsField; cdecl;
  end;

  SCNPhysicsField = interface(NSObject)
    ['{FE4437EE-F2F4-4064-B380-A321E95DDE08}']
    procedure setStrength(strength: CGFloat); cdecl;
    function strength: CGFloat; cdecl;
    procedure setFalloffExponent(falloffExponent: CGFloat); cdecl;
    function falloffExponent: CGFloat; cdecl;
    procedure setMinimumDistance(minimumDistance: CGFloat); cdecl;
    function minimumDistance: CGFloat; cdecl;
    procedure setActive(active: Boolean); cdecl;
    function isActive: Boolean; cdecl;
    procedure setExclusive(exclusive: Boolean); cdecl;
    function isExclusive: Boolean; cdecl;
    procedure setHalfExtent(halfExtent: SCNVector3); cdecl;
    function halfExtent: SCNVector3; cdecl;
    procedure setUsesEllipsoidalExtent(usesEllipsoidalExtent: Boolean); cdecl;
    function usesEllipsoidalExtent: Boolean; cdecl;
    procedure setScope(scope: SCNPhysicsFieldScope); cdecl;
    function scope: SCNPhysicsFieldScope; cdecl;
    procedure setOffset(offset: SCNVector3); cdecl;
    function offset: SCNVector3; cdecl;
    procedure setDirection(direction: SCNVector3); cdecl;
    function direction: SCNVector3; cdecl;
    procedure setCategoryBitMask(categoryBitMask: NSUInteger); cdecl;
    function categoryBitMask: NSUInteger; cdecl;
  end;

  TSCNPhysicsField = class(TOCGenericImport<SCNPhysicsFieldClass,
    SCNPhysicsField>)
  end;

  PSCNPhysicsField = Pointer;

  SCNHitTestResultClass = interface(NSObjectClass)
    ['{D05EDB2B-1EF9-4E90-8AF4-ADAA501E9D87}']
  end;

  SCNHitTestResult = interface(NSObject)
    ['{5CB87B90-7809-4A06-BDD2-B8DADD47B253}']
    function node: SCNNode; cdecl;
    function geometryIndex: NSInteger; cdecl;
    function faceIndex: NSInteger; cdecl;
    function localCoordinates: SCNVector3; cdecl;
    function worldCoordinates: SCNVector3; cdecl;
    function localNormal: SCNVector3; cdecl;
    function worldNormal: SCNVector3; cdecl;
    function modelTransform: SCNMatrix4; cdecl;
    function boneNode: SCNNode; cdecl;
    function textureCoordinatesWithMappingChannel(channel: NSInteger)
      : CGPoint; cdecl;
    function simdLocalCoordinates: simd_float3; cdecl;
    function simdWorldCoordinates: simd_float3; cdecl;
    function simdLocalNormal: simd_float3; cdecl;
    function simdWorldNormal: simd_float3; cdecl;
    function simdModelTransform: simd_float4x4; cdecl;
  end;

  TSCNHitTestResult = class(TOCGenericImport<SCNHitTestResultClass,
    SCNHitTestResult>)
  end;

  PSCNHitTestResult = Pointer;

  SCNRendererClass = interface(NSObjectClass)
    ['{DFBD3D81-F4CF-4AA1-831A-C3D2BD32269D}']
    { class } function rendererWithContext(context: EAGLContext;
      options: NSDictionary): Pointer { instancetype }; cdecl;
    { class } function rendererWithDevice(device: Pointer;
      options: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  SCNRenderer = interface(NSObject)
    ['{68793C3C-341B-46FE-ABE2-5204FA8840F6}']
    procedure setScene(scene: SCNScene); cdecl;
    function scene: SCNScene; cdecl;
    [MethodName('renderAtTime:viewport:commandBuffer:passDescriptor:')]
    procedure renderAtTimeViewportCommandBufferPassDescriptor
      (time: CFTimeInterval; viewport: CGRect; commandBuffer: Pointer;
      passDescriptor: MTLRenderPassDescriptor); cdecl;
    [MethodName('renderAtTime:')]
    procedure renderAtTime(time: CFTimeInterval); cdecl;
    procedure updateAtTime(time: CFTimeInterval); cdecl;
    procedure renderWithViewport(viewport: CGRect; commandBuffer: Pointer;
      passDescriptor: MTLRenderPassDescriptor); cdecl;
    function nextFrameTime: CFTimeInterval; cdecl;
    function snapshotAtTime(time: CFTimeInterval; withSize: CGSize;
      antialiasingMode: SCNAntialiasingMode): UIImage; cdecl;
    procedure updateProbes(lightProbes: NSArray; atTime: CFTimeInterval); cdecl;
    procedure render; cdecl;
  end;

  TSCNRenderer = class(TOCGenericImport<SCNRendererClass, SCNRenderer>)
  end;

  PSCNRenderer = Pointer;

  SCNSceneClass = interface(NSObjectClass)
    ['{6061297E-CA3C-4B2E-82A8-A4277145C3CD}']
    { class } function scene: Pointer { instancetype }; cdecl;
    [MethodName('sceneNamed:')]
    { class } function sceneNamed(name: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('sceneNamed:inDirectory:options:')]
    { class } function sceneNamedInDirectoryOptions(name: NSString;
      inDirectory: NSString; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    { class } function sceneWithURL(url: NSURL; options: NSDictionary;
      error: NSError): Pointer { instancetype }; cdecl;
    { class } function sceneWithMDLAsset(mdlAsset: Pointer)
      : Pointer { instancetype }; cdecl;
  end;

  SCNScene = interface(NSObject)
    ['{6D00042B-C113-4804-8ED3-FEB8FF8FD7AD}']
    function rootNode: SCNNode; cdecl;
    function physicsWorld: SCNPhysicsWorld; cdecl;
    function attributeForKey(key: NSString): Pointer; cdecl;
    procedure setAttribute(attribute: Pointer; forKey: NSString); cdecl;
    function background: SCNMaterialProperty; cdecl;
    function lightingEnvironment: SCNMaterialProperty; cdecl;
    function writeToURL(url: NSURL; options: NSDictionary; delegate: Pointer;
      progressHandler: SCNSceneExportProgressHandler): Boolean; cdecl;
    procedure setFogStartDistance(fogStartDistance: CGFloat); cdecl;
    function fogStartDistance: CGFloat; cdecl;
    procedure setFogEndDistance(fogEndDistance: CGFloat); cdecl;
    function fogEndDistance: CGFloat; cdecl;
    procedure setFogDensityExponent(fogDensityExponent: CGFloat); cdecl;
    function fogDensityExponent: CGFloat; cdecl;
    procedure setFogColor(fogColor: Pointer); cdecl;
    function fogColor: Pointer; cdecl;
    procedure setWantsScreenSpaceReflection(wantsScreenSpaceReflection
      : Boolean); cdecl;
    function wantsScreenSpaceReflection: Boolean; cdecl;
    procedure setScreenSpaceReflectionSampleCount
      (screenSpaceReflectionSampleCount: NSInteger); cdecl;
    function screenSpaceReflectionSampleCount: NSInteger; cdecl;
    procedure setScreenSpaceReflectionMaximumDistance
      (screenSpaceReflectionMaximumDistance: CGFloat); cdecl;
    function screenSpaceReflectionMaximumDistance: CGFloat; cdecl;
    procedure setScreenSpaceReflectionStride(screenSpaceReflectionStride
      : CGFloat); cdecl;
    function screenSpaceReflectionStride: CGFloat; cdecl;
    procedure setPaused(paused: Boolean); cdecl;
    function isPaused: Boolean; cdecl;
    procedure addParticleSystem(system: SCNParticleSystem;
      withTransform: SCNMatrix4); cdecl;
    procedure removeAllParticleSystems; cdecl;
    procedure removeParticleSystem(system: SCNParticleSystem); cdecl;
    function particleSystems: NSArray; cdecl;
  end;

  TSCNScene = class(TOCGenericImport<SCNSceneClass, SCNScene>)
  end;

  PSCNScene = Pointer;

  SCNSceneSourceClass = interface(NSObjectClass)
    ['{13469666-09CB-4D2A-84BC-2789D8E89E86}']
    { class } function sceneSourceWithURL(url: NSURL; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    { class } function sceneSourceWithData(data: NSData; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  SCNSceneSource = interface(NSObject)
    ['{EF1FB895-D42C-4224-9444-36C4A1E30BBF}']
    function initWithURL(url: NSURL; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function initWithData(data: NSData; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function url: NSURL; cdecl;
    function data: NSData; cdecl;
    [MethodName('sceneWithOptions:statusHandler:')]
    function sceneWithOptionsStatusHandler(options: NSDictionary;
      statusHandler: SCNSceneSourceStatusHandler): SCNScene; cdecl;
    [MethodName('sceneWithOptions:error:')]
    function sceneWithOptionsError(options: NSDictionary; error: NSError)
      : SCNScene; cdecl;
    function propertyForKey(key: NSString): Pointer; cdecl;
    function entryWithIdentifier(uid: NSString; withClass: Pointer)
      : Pointer; cdecl;
    function identifiersOfEntriesWithClass(entryClass: Pointer): NSArray; cdecl;
    function entriesPassingTest(predicate: TSceneKitPredicate1): NSArray; cdecl;
  end;

  TSCNSceneSource = class(TOCGenericImport<SCNSceneSourceClass, SCNSceneSource>)
  end;

  PSCNSceneSource = Pointer;

  SCNMaterialPropertyClass = interface(NSObjectClass)
    ['{AE34CF9B-FFDC-4868-BD4D-22050B043C25}']
    { class } function materialPropertyWithContents(contents: Pointer)
      : Pointer { instancetype }; cdecl;
  end;

  SCNMaterialProperty = interface(NSObject)
    ['{3203F033-2DE2-4948-A68C-D63E67CCD37C}']
    procedure setContents(contents: Pointer); cdecl;
    function contents: Pointer; cdecl;
    procedure setIntensity(intensity: CGFloat); cdecl;
    function intensity: CGFloat; cdecl;
    procedure setMinificationFilter(minificationFilter: SCNFilterMode); cdecl;
    function minificationFilter: SCNFilterMode; cdecl;
    procedure setMagnificationFilter(magnificationFilter: SCNFilterMode); cdecl;
    function magnificationFilter: SCNFilterMode; cdecl;
    procedure setMipFilter(mipFilter: SCNFilterMode); cdecl;
    function mipFilter: SCNFilterMode; cdecl;
    procedure setContentsTransform(contentsTransform: SCNMatrix4); cdecl;
    function contentsTransform: SCNMatrix4; cdecl;
    procedure setWrapS(wrapS: SCNWrapMode); cdecl;
    function wrapS: SCNWrapMode; cdecl;
    procedure setWrapT(wrapT: SCNWrapMode); cdecl;
    function wrapT: SCNWrapMode; cdecl;
    procedure setMappingChannel(mappingChannel: NSInteger); cdecl;
    function mappingChannel: NSInteger; cdecl;
    procedure setTextureComponents(textureComponents: SCNColorMask); cdecl;
    function textureComponents: SCNColorMask; cdecl;
    procedure setMaxAnisotropy(maxAnisotropy: CGFloat); cdecl;
    function maxAnisotropy: CGFloat; cdecl;
    procedure setBorderColor(borderColor: Pointer); cdecl;
    function borderColor: Pointer; cdecl;
  end;

  TSCNMaterialProperty = class(TOCGenericImport<SCNMaterialPropertyClass,
    SCNMaterialProperty>)
  end;

  PSCNMaterialProperty = Pointer;

  SCNPhysicsWorldClass = interface(NSObjectClass)
    ['{4BF7A96E-B084-4E6A-A317-043077C77466}']
  end;

  SCNPhysicsWorld = interface(NSObject)
    ['{3FC6CE4E-E615-4888-9EB2-F32E5CF46981}']
    procedure setGravity(gravity: SCNVector3); cdecl;
    function gravity: SCNVector3; cdecl;
    procedure setSpeed(speed: CGFloat); cdecl;
    function speed: CGFloat; cdecl;
    procedure setTimeStep(timeStep: NSTimeInterval); cdecl;
    function timeStep: NSTimeInterval; cdecl;
    procedure setContactDelegate(contactDelegate: Pointer); cdecl;
    function contactDelegate: Pointer; cdecl;
    procedure addBehavior(behavior: SCNPhysicsBehavior); cdecl;
    procedure removeBehavior(behavior: SCNPhysicsBehavior); cdecl;
    procedure removeAllBehaviors; cdecl;
    function allBehaviors: NSArray; cdecl;
    function rayTestWithSegmentFromPoint(origin: SCNVector3;
      toPoint: SCNVector3; options: NSDictionary): NSArray; cdecl;
    function contactTestBetweenBody(bodyA: SCNPhysicsBody;
      andBody: SCNPhysicsBody; options: NSDictionary): NSArray; cdecl;
    function contactTestWithBody(body: SCNPhysicsBody; options: NSDictionary)
      : NSArray; cdecl;
    function convexSweepTestWithShape(shape: SCNPhysicsShape;
      fromTransform: SCNMatrix4; toTransform: SCNMatrix4; options: NSDictionary)
      : NSArray; cdecl;
    procedure updateCollisionPairs; cdecl;
  end;

  TSCNPhysicsWorld = class(TOCGenericImport<SCNPhysicsWorldClass,
    SCNPhysicsWorld>)
  end;

  PSCNPhysicsWorld = Pointer;

  SCNMaterialClass = interface(NSObjectClass)
    ['{B0D44B8C-1F0D-477D-BB54-87EE6787FC25}']
    { class } function material: Pointer { instancetype }; cdecl;
    { class } function materialWithMDLMaterial(mdlMaterial: Pointer)
      : Pointer { instancetype }; cdecl;
  end;

  SCNMaterial = interface(NSObject)
    ['{F42E94B5-466D-4356-BF01-8E5361D00A3F}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    function diffuse: SCNMaterialProperty; cdecl;
    function ambient: SCNMaterialProperty; cdecl;
    function specular: SCNMaterialProperty; cdecl;
    function emission: SCNMaterialProperty; cdecl;
    function transparent: SCNMaterialProperty; cdecl;
    function reflective: SCNMaterialProperty; cdecl;
    function multiply: SCNMaterialProperty; cdecl;
    function normal: SCNMaterialProperty; cdecl;
    function displacement: SCNMaterialProperty; cdecl;
    function ambientOcclusion: SCNMaterialProperty; cdecl;
    function selfIllumination: SCNMaterialProperty; cdecl;
    function metalness: SCNMaterialProperty; cdecl;
    function roughness: SCNMaterialProperty; cdecl;
    function clearCoat: SCNMaterialProperty; cdecl;
    function clearCoatRoughness: SCNMaterialProperty; cdecl;
    function clearCoatNormal: SCNMaterialProperty; cdecl;
    procedure setShininess(shininess: CGFloat); cdecl;
    function shininess: CGFloat; cdecl;
    procedure setTransparency(transparency: CGFloat); cdecl;
    function transparency: CGFloat; cdecl;
    procedure setLightingModelName(lightingModelName: SCNLightingModel); cdecl;
    function lightingModelName: SCNLightingModel; cdecl;
    procedure setLitPerPixel(litPerPixel: Boolean); cdecl;
    function isLitPerPixel: Boolean; cdecl;
    procedure setDoubleSided(doubleSided: Boolean); cdecl;
    function isDoubleSided: Boolean; cdecl;
    procedure setFillMode(fillMode: SCNFillMode); cdecl;
    function fillMode: SCNFillMode; cdecl;
    procedure setCullMode(cullMode: SCNCullMode); cdecl;
    function cullMode: SCNCullMode; cdecl;
    procedure setTransparencyMode(transparencyMode: SCNTransparencyMode); cdecl;
    function transparencyMode: SCNTransparencyMode; cdecl;
    procedure setLocksAmbientWithDiffuse(locksAmbientWithDiffuse
      : Boolean); cdecl;
    function locksAmbientWithDiffuse: Boolean; cdecl;
    procedure setWritesToDepthBuffer(writesToDepthBuffer: Boolean); cdecl;
    function writesToDepthBuffer: Boolean; cdecl;
    procedure setColorBufferWriteMask(colorBufferWriteMask
      : SCNColorMask); cdecl;
    function colorBufferWriteMask: SCNColorMask; cdecl;
    procedure setReadsFromDepthBuffer(readsFromDepthBuffer: Boolean); cdecl;
    function readsFromDepthBuffer: Boolean; cdecl;
    procedure setFresnelExponent(fresnelExponent: CGFloat); cdecl;
    function fresnelExponent: CGFloat; cdecl;
    procedure setBlendMode(blendMode: SCNBlendMode); cdecl;
    function blendMode: SCNBlendMode; cdecl;
  end;

  TSCNMaterial = class(TOCGenericImport<SCNMaterialClass, SCNMaterial>)
  end;

  PSCNMaterial = Pointer;

  SCNProgramClass = interface(NSObjectClass)
    ['{C5C19A8B-0BC5-4E6A-BDC9-C98CBCDB5683}']
    { class } function &program: Pointer { instancetype }; cdecl;
  end;

  SCNProgram = interface(NSObject)
    ['{40F3E083-956A-4D04-8C36-95A84FEF3572}']
    procedure setVertexShader(vertexShader: NSString); cdecl;
    function vertexShader: NSString; cdecl;
    procedure setFragmentShader(fragmentShader: NSString); cdecl;
    function fragmentShader: NSString; cdecl;
    procedure setVertexFunctionName(vertexFunctionName: NSString); cdecl;
    function vertexFunctionName: NSString; cdecl;
    procedure setFragmentFunctionName(fragmentFunctionName: NSString); cdecl;
    function fragmentFunctionName: NSString; cdecl;
    procedure handleBindingOfBufferNamed(name: NSString;
      frequency: SCNBufferFrequency; usingBlock: SCNBufferBindingBlock); cdecl;
    procedure setOpaque(opaque: Boolean); cdecl;
    function isOpaque: Boolean; cdecl;
    procedure setSemantic(semantic: NSString; forSymbol: NSString;
      options: NSDictionary); cdecl;
    function semanticForSymbol(symbol: NSString): NSString; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setLibrary(&library: Pointer); cdecl;
    function &library: Pointer; cdecl;
  end;

  TSCNProgram = class(TOCGenericImport<SCNProgramClass, SCNProgram>)
  end;

  PSCNProgram = Pointer;

  SCNTechniqueClass = interface(NSObjectClass)
    ['{C6275264-DA91-4244-AC7D-12CCE371FF4A}']
    { class } function techniqueWithDictionary(dictionary: NSDictionary)
      : SCNTechnique; cdecl;
    { class } function techniqueBySequencingTechniques(techniques: NSArray)
      : SCNTechnique; cdecl;
  end;

  SCNTechnique = interface(NSObject)
    ['{B2F61C97-0312-40E9-9F79-099F38D98439}']
    procedure handleBindingOfSymbol(symbol: NSString;
      usingBlock: SCNBindingBlock); cdecl;
    function dictionaryRepresentation: NSDictionary; cdecl;
    function objectForKeyedSubscript(key: Pointer): Pointer; cdecl;
    procedure setObject(obj: Pointer; forKeyedSubscript: Pointer); cdecl;
    procedure setLibrary(&library: Pointer); cdecl;
    function &library: Pointer; cdecl;
  end;

  TSCNTechnique = class(TOCGenericImport<SCNTechniqueClass, SCNTechnique>)
  end;

  PSCNTechnique = Pointer;

  SCNGeometrySourceClass = interface(NSObjectClass)
    ['{A52E3B05-315F-4CB3-B5B3-85A79B89FC6D}']
    { class } function geometrySourceWithData(data: NSData;
      semantic: SCNGeometrySourceSemantic; vectorCount: NSInteger;
      floatComponents: Boolean; componentsPerVector: NSInteger;
      bytesPerComponent: NSInteger; dataOffset: NSInteger;
      dataStride: NSInteger): Pointer { instancetype }; cdecl;
    { class } function geometrySourceWithVertices(vertices: PSCNVector3;
      count: NSInteger): Pointer { instancetype }; cdecl;
    { class } function geometrySourceWithNormals(normals: PSCNVector3;
      count: NSInteger): Pointer { instancetype }; cdecl;
    { class } function geometrySourceWithTextureCoordinates(texcoord: Pointer;
      count: NSInteger): Pointer { instancetype }; cdecl;
    { class } function geometrySourceWithBuffer(buffer: Pointer;
      vertexFormat: MTLVertexFormat; semantic: SCNGeometrySourceSemantic;
      vertexCount: NSInteger; dataOffset: NSInteger; dataStride: NSInteger)
      : Pointer { instancetype }; cdecl;
  end;

  SCNGeometrySource = interface(NSObject)
    ['{C17D1E29-1E3A-4E9E-B8AD-3E6983AC7EE1}']
    function data: NSData; cdecl;
    function semantic: SCNGeometrySourceSemantic; cdecl;
    function vectorCount: NSInteger; cdecl;
    function floatComponents: Boolean; cdecl;
    function componentsPerVector: NSInteger; cdecl;
    function bytesPerComponent: NSInteger; cdecl;
    function dataOffset: NSInteger; cdecl;
    function dataStride: NSInteger; cdecl;
  end;

  TSCNGeometrySource = class(TOCGenericImport<SCNGeometrySourceClass,
    SCNGeometrySource>)
  end;

  PSCNGeometrySource = Pointer;

  SCNGeometryElementClass = interface(NSObjectClass)
    ['{1765F240-1486-430A-998C-525A87D5DD33}']
    { class } function geometryElementWithData(data: NSData;
      primitiveType: SCNGeometryPrimitiveType; primitiveCount: NSInteger;
      bytesPerIndex: NSInteger): Pointer { instancetype }; cdecl;
    { class } function geometryElementWithBuffer(buffer: Pointer;
      primitiveType: SCNGeometryPrimitiveType; primitiveCount: NSInteger;
      bytesPerIndex: NSInteger): Pointer { instancetype }; cdecl;
    { class } function geometryElementWithMDLSubmesh(mdlSubMesh: Pointer)
      : Pointer { instancetype }; cdecl;
  end;

  SCNGeometryElement = interface(NSObject)
    ['{6D2DDAF4-B1CF-4677-9ECB-9BCE58D0902A}']
    function data: NSData; cdecl;
    function primitiveType: SCNGeometryPrimitiveType; cdecl;
    function primitiveCount: NSInteger; cdecl;
    procedure setPrimitiveRange(primitiveRange: NSRange); cdecl;
    function primitiveRange: NSRange; cdecl;
    function bytesPerIndex: NSInteger; cdecl;
    procedure setPointSize(pointSize: CGFloat); cdecl;
    function pointSize: CGFloat; cdecl;
    procedure setMinimumPointScreenSpaceRadius(minimumPointScreenSpaceRadius
      : CGFloat); cdecl;
    function minimumPointScreenSpaceRadius: CGFloat; cdecl;
    procedure setMaximumPointScreenSpaceRadius(maximumPointScreenSpaceRadius
      : CGFloat); cdecl;
    function maximumPointScreenSpaceRadius: CGFloat; cdecl;
  end;

  TSCNGeometryElement = class(TOCGenericImport<SCNGeometryElementClass,
    SCNGeometryElement>)
  end;

  PSCNGeometryElement = Pointer;

  SCNGeometryTessellatorClass = interface(NSObjectClass)
    ['{816B2F74-6E88-4419-BC89-2005326ACE2C}']
  end;

  SCNGeometryTessellator = interface(NSObject)
    ['{3B612BAF-5E63-4327-910C-B07125ECBE62}']
    procedure setTessellationFactorScale(tessellationFactorScale
      : CGFloat); cdecl;
    function tessellationFactorScale: CGFloat; cdecl;
    procedure setTessellationPartitionMode(tessellationPartitionMode
      : MTLTessellationPartitionMode); cdecl;
    function tessellationPartitionMode: MTLTessellationPartitionMode; cdecl;
    procedure setAdaptive(adaptive: Boolean); cdecl;
    function isAdaptive: Boolean; cdecl;
    procedure setScreenSpace(screenSpace: Boolean); cdecl;
    function isScreenSpace: Boolean; cdecl;
    procedure setEdgeTessellationFactor(edgeTessellationFactor: CGFloat); cdecl;
    function edgeTessellationFactor: CGFloat; cdecl;
    procedure setInsideTessellationFactor(insideTessellationFactor
      : CGFloat); cdecl;
    function insideTessellationFactor: CGFloat; cdecl;
    procedure setMaximumEdgeLength(maximumEdgeLength: CGFloat); cdecl;
    function maximumEdgeLength: CGFloat; cdecl;
    procedure setSmoothingMode(smoothingMode
      : SCNTessellationSmoothingMode); cdecl;
    function smoothingMode: SCNTessellationSmoothingMode; cdecl;
  end;

  TSCNGeometryTessellator = class(TOCGenericImport<SCNGeometryTessellatorClass,
    SCNGeometryTessellator>)
  end;

  PSCNGeometryTessellator = Pointer;

  SCNLevelOfDetailClass = interface(NSObjectClass)
    ['{A0295A2C-ACAE-46C7-8B50-855EB3658EBE}']
    [MethodName('levelOfDetailWithGeometry:screenSpaceRadius:')]
    { class } function levelOfDetailWithGeometryScreenSpaceRadius
      (geometry: SCNGeometry; screenSpaceRadius: CGFloat)
      : Pointer { instancetype }; cdecl;
    [MethodName('levelOfDetailWithGeometry:worldSpaceDistance:')]
    { class } function levelOfDetailWithGeometryWorldSpaceDistance
      (geometry: SCNGeometry; worldSpaceDistance: CGFloat)
      : Pointer { instancetype }; cdecl;
  end;

  SCNLevelOfDetail = interface(NSObject)
    ['{EB93E2C0-C533-489A-AECE-1B5160BA8534}']
    function geometry: SCNGeometry; cdecl;
    function screenSpaceRadius: CGFloat; cdecl;
    function worldSpaceDistance: CGFloat; cdecl;
  end;

  TSCNLevelOfDetail = class(TOCGenericImport<SCNLevelOfDetailClass,
    SCNLevelOfDetail>)
  end;

  PSCNLevelOfDetail = Pointer;

  SCNCameraControllerClass = interface(NSObjectClass)
    ['{AAB10ADA-D4D1-460D-A13E-B9A12F870701}']
  end;

  SCNCameraController = interface(NSObject)
    ['{1C91E3BF-20D2-465B-85ED-24A8A797156F}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setPointOfView(pointOfView: SCNNode); cdecl;
    function pointOfView: SCNNode; cdecl;
    procedure setInteractionMode(interactionMode: SCNInteractionMode); cdecl;
    function interactionMode: SCNInteractionMode; cdecl;
    procedure setTarget(target: SCNVector3); cdecl;
    function target: SCNVector3; cdecl;
    procedure setAutomaticTarget(automaticTarget: Boolean); cdecl;
    function automaticTarget: Boolean; cdecl;
    procedure setWorldUp(worldUp: SCNVector3); cdecl;
    function worldUp: SCNVector3; cdecl;
    procedure setInertiaEnabled(inertiaEnabled: Boolean); cdecl;
    function inertiaEnabled: Boolean; cdecl;
    procedure setInertiaFriction(inertiaFriction: Single); cdecl;
    function inertiaFriction: Single; cdecl;
    function isInertiaRunning: Boolean; cdecl;
    procedure setMinimumVerticalAngle(minimumVerticalAngle: Single); cdecl;
    function minimumVerticalAngle: Single; cdecl;
    procedure setMaximumVerticalAngle(maximumVerticalAngle: Single); cdecl;
    function maximumVerticalAngle: Single; cdecl;
    procedure setMinimumHorizontalAngle(minimumHorizontalAngle: Single); cdecl;
    function minimumHorizontalAngle: Single; cdecl;
    procedure setMaximumHorizontalAngle(maximumHorizontalAngle: Single); cdecl;
    function maximumHorizontalAngle: Single; cdecl;
    procedure translateInCameraSpaceByX(deltaX: Single; y: Single;
      z: Single); cdecl;
    procedure frameNodes(nodes: NSArray); cdecl;
    procedure rotateByX(deltaX: Single; y: Single); cdecl;
    procedure rollBy(delta: Single; aroundScreenPoint: CGPoint;
      viewport: CGSize); cdecl;
    procedure dollyBy(delta: Single; onScreenPoint: CGPoint;
      viewport: CGSize); cdecl;
    procedure rollAroundTarget(delta: Single); cdecl;
    procedure dollyToTarget(delta: Single); cdecl;
    procedure clearRoll; cdecl;
    procedure stopInertia; cdecl;
    procedure beginInteraction(location: CGPoint; withViewport: CGSize); cdecl;
    procedure continueInteraction(location: CGPoint; withViewport: CGSize;
      sensitivity: CGFloat); cdecl;
    procedure endInteraction(location: CGPoint; withViewport: CGSize;
      velocity: CGPoint); cdecl;
  end;

  TSCNCameraController = class(TOCGenericImport<SCNCameraControllerClass,
    SCNCameraController>)
  end;

  PSCNCameraController = Pointer;

  SCNViewClass = interface(UIViewClass)
    ['{793B25F6-FED4-455A-871C-2F7B4216C4F7}']
  end;

  SCNView = interface(UIView)
    ['{9D2B15C6-5E09-4CCD-A1BD-03D61035E12E}']
    function initWithFrame(frame: CGRect; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    procedure setScene(scene: SCNScene); cdecl;
    function scene: SCNScene; cdecl;
    procedure setRendersContinuously(rendersContinuously: Boolean); cdecl;
    function rendersContinuously: Boolean; cdecl;
    procedure setAllowsCameraControl(allowsCameraControl: Boolean); cdecl;
    function allowsCameraControl: Boolean; cdecl;
    function cameraControlConfiguration: Pointer; cdecl;
    function defaultCameraController: SCNCameraController; cdecl;
    function snapshot: UIImage; cdecl;
    procedure play(sender: Pointer); cdecl;
    procedure pause(sender: Pointer); cdecl;
    procedure stop(sender: Pointer); cdecl;
    procedure setPreferredFramesPerSecond(preferredFramesPerSecond
      : NSInteger); cdecl;
    function preferredFramesPerSecond: NSInteger; cdecl;
    procedure setEaglContext(EAGLContext: EAGLContext); cdecl;
    function EAGLContext: EAGLContext; cdecl;
    procedure setAntialiasingMode(antialiasingMode: SCNAntialiasingMode); cdecl;
    function antialiasingMode: SCNAntialiasingMode; cdecl;
  end;

  TSCNView = class(TOCGenericImport<SCNViewClass, SCNView>)
  end;

  PSCNView = Pointer;

  SCNPlaneClass = interface(SCNGeometryClass)
    ['{FB406891-10F6-424B-B25B-2506C1D3C61F}']
    { class } function planeWithWidth(width: CGFloat; height: CGFloat)
      : Pointer { instancetype }; cdecl;
  end;

  SCNPlane = interface(SCNGeometry)
    ['{4C5B351F-2B29-4C30-9B4A-0FBA58ECC6A3}']
    procedure setWidth(width: CGFloat); cdecl;
    function width: CGFloat; cdecl;
    procedure setHeight(height: CGFloat); cdecl;
    function height: CGFloat; cdecl;
    procedure setWidthSegmentCount(widthSegmentCount: NSInteger); cdecl;
    function widthSegmentCount: NSInteger; cdecl;
    procedure setHeightSegmentCount(heightSegmentCount: NSInteger); cdecl;
    function heightSegmentCount: NSInteger; cdecl;
    procedure setCornerRadius(cornerRadius: CGFloat); cdecl;
    function cornerRadius: CGFloat; cdecl;
    procedure setCornerSegmentCount(cornerSegmentCount: NSInteger); cdecl;
    function cornerSegmentCount: NSInteger; cdecl;
  end;

  TSCNPlane = class(TOCGenericImport<SCNPlaneClass, SCNPlane>)
  end;

  PSCNPlane = Pointer;

  SCNBoxClass = interface(SCNGeometryClass)
    ['{678C387F-EEB8-4FB1-9A4F-A9B6FCA36D4B}']
    { class } function boxWithWidth(width: CGFloat; height: CGFloat;
      length: CGFloat; chamferRadius: CGFloat): Pointer { instancetype }; cdecl;
  end;

  SCNBox = interface(SCNGeometry)
    ['{9BAAC4EE-DB75-4E2C-B9CE-CB33FD95D3C0}']
    procedure setWidth(width: CGFloat); cdecl;
    function width: CGFloat; cdecl;
    procedure setHeight(height: CGFloat); cdecl;
    function height: CGFloat; cdecl;
    procedure setLength(length: CGFloat); cdecl;
    function length: CGFloat; cdecl;
    procedure setChamferRadius(chamferRadius: CGFloat); cdecl;
    function chamferRadius: CGFloat; cdecl;
    procedure setWidthSegmentCount(widthSegmentCount: NSInteger); cdecl;
    function widthSegmentCount: NSInteger; cdecl;
    procedure setHeightSegmentCount(heightSegmentCount: NSInteger); cdecl;
    function heightSegmentCount: NSInteger; cdecl;
    procedure setLengthSegmentCount(lengthSegmentCount: NSInteger); cdecl;
    function lengthSegmentCount: NSInteger; cdecl;
    procedure setChamferSegmentCount(chamferSegmentCount: NSInteger); cdecl;
    function chamferSegmentCount: NSInteger; cdecl;
  end;

  TSCNBox = class(TOCGenericImport<SCNBoxClass, SCNBox>)
  end;

  PSCNBox = Pointer;

  SCNPyramidClass = interface(SCNGeometryClass)
    ['{07E67AFE-FEC8-4389-8C15-FF2B85D65CE9}']
    { class } function pyramidWithWidth(width: CGFloat; height: CGFloat;
      length: CGFloat): Pointer { instancetype }; cdecl;
  end;

  SCNPyramid = interface(SCNGeometry)
    ['{001B61EB-F9CD-46DF-AA1D-7854492C4A48}']
    procedure setWidth(width: CGFloat); cdecl;
    function width: CGFloat; cdecl;
    procedure setHeight(height: CGFloat); cdecl;
    function height: CGFloat; cdecl;
    procedure setLength(length: CGFloat); cdecl;
    function length: CGFloat; cdecl;
    procedure setWidthSegmentCount(widthSegmentCount: NSInteger); cdecl;
    function widthSegmentCount: NSInteger; cdecl;
    procedure setHeightSegmentCount(heightSegmentCount: NSInteger); cdecl;
    function heightSegmentCount: NSInteger; cdecl;
    procedure setLengthSegmentCount(lengthSegmentCount: NSInteger); cdecl;
    function lengthSegmentCount: NSInteger; cdecl;
  end;

  TSCNPyramid = class(TOCGenericImport<SCNPyramidClass, SCNPyramid>)
  end;

  PSCNPyramid = Pointer;

  SCNSphereClass = interface(SCNGeometryClass)
    ['{9F5F741C-33EE-46C0-8D50-E795BD2759FB}']
    { class } function sphereWithRadius(radius: CGFloat)
      : Pointer { instancetype }; cdecl;
  end;

  SCNSphere = interface(SCNGeometry)
    ['{4401A7BD-F512-4E6D-852D-3D7A1412AA4C}']
    procedure setRadius(radius: CGFloat); cdecl;
    function radius: CGFloat; cdecl;
    procedure setGeodesic(geodesic: Boolean); cdecl;
    function isGeodesic: Boolean; cdecl;
    procedure setSegmentCount(segmentCount: NSInteger); cdecl;
    function segmentCount: NSInteger; cdecl;
  end;

  TSCNSphere = class(TOCGenericImport<SCNSphereClass, SCNSphere>)
  end;

  PSCNSphere = Pointer;

  SCNCylinderClass = interface(SCNGeometryClass)
    ['{5C1FF489-DD51-409E-AD8B-ECEB4C0B1A41}']
    { class } function cylinderWithRadius(radius: CGFloat; height: CGFloat)
      : Pointer { instancetype }; cdecl;
  end;

  SCNCylinder = interface(SCNGeometry)
    ['{59A0A46F-5A2C-46D9-A32E-10E71E604C24}']
    procedure setRadius(radius: CGFloat); cdecl;
    function radius: CGFloat; cdecl;
    procedure setHeight(height: CGFloat); cdecl;
    function height: CGFloat; cdecl;
    procedure setRadialSegmentCount(radialSegmentCount: NSInteger); cdecl;
    function radialSegmentCount: NSInteger; cdecl;
    procedure setHeightSegmentCount(heightSegmentCount: NSInteger); cdecl;
    function heightSegmentCount: NSInteger; cdecl;
  end;

  TSCNCylinder = class(TOCGenericImport<SCNCylinderClass, SCNCylinder>)
  end;

  PSCNCylinder = Pointer;

  SCNConeClass = interface(SCNGeometryClass)
    ['{FAC35C50-5910-4B3F-8735-E01352EE93ED}']
    { class } function coneWithTopRadius(topRadius: CGFloat;
      bottomRadius: CGFloat; height: CGFloat): Pointer { instancetype }; cdecl;
  end;

  SCNCone = interface(SCNGeometry)
    ['{BBD2E152-A175-4E26-A9EC-4BB5627D3BB6}']
    procedure setTopRadius(topRadius: CGFloat); cdecl;
    function topRadius: CGFloat; cdecl;
    procedure setBottomRadius(bottomRadius: CGFloat); cdecl;
    function bottomRadius: CGFloat; cdecl;
    procedure setHeight(height: CGFloat); cdecl;
    function height: CGFloat; cdecl;
    procedure setRadialSegmentCount(radialSegmentCount: NSInteger); cdecl;
    function radialSegmentCount: NSInteger; cdecl;
    procedure setHeightSegmentCount(heightSegmentCount: NSInteger); cdecl;
    function heightSegmentCount: NSInteger; cdecl;
  end;

  TSCNCone = class(TOCGenericImport<SCNConeClass, SCNCone>)
  end;

  PSCNCone = Pointer;

  SCNTubeClass = interface(SCNGeometryClass)
    ['{5BE18CF5-1F65-45A2-A7CA-49A5E2E2603B}']
    { class } function tubeWithInnerRadius(innerRadius: CGFloat;
      outerRadius: CGFloat; height: CGFloat): Pointer { instancetype }; cdecl;
  end;

  SCNTube = interface(SCNGeometry)
    ['{0D5D01AC-E0A7-4DFF-86B8-66681D1E8540}']
    procedure setInnerRadius(innerRadius: CGFloat); cdecl;
    function innerRadius: CGFloat; cdecl;
    procedure setOuterRadius(outerRadius: CGFloat); cdecl;
    function outerRadius: CGFloat; cdecl;
    procedure setHeight(height: CGFloat); cdecl;
    function height: CGFloat; cdecl;
    procedure setRadialSegmentCount(radialSegmentCount: NSInteger); cdecl;
    function radialSegmentCount: NSInteger; cdecl;
    procedure setHeightSegmentCount(heightSegmentCount: NSInteger); cdecl;
    function heightSegmentCount: NSInteger; cdecl;
  end;

  TSCNTube = class(TOCGenericImport<SCNTubeClass, SCNTube>)
  end;

  PSCNTube = Pointer;

  SCNCapsuleClass = interface(SCNGeometryClass)
    ['{D17034BB-B6CC-4573-917B-690CBCED7749}']
    { class } function capsuleWithCapRadius(capRadius: CGFloat; height: CGFloat)
      : Pointer { instancetype }; cdecl;
  end;

  SCNCapsule = interface(SCNGeometry)
    ['{6FA95AC6-D82B-431D-9E40-6BC9F4A72E0A}']
    procedure setCapRadius(capRadius: CGFloat); cdecl;
    function capRadius: CGFloat; cdecl;
    procedure setHeight(height: CGFloat); cdecl;
    function height: CGFloat; cdecl;
    procedure setRadialSegmentCount(radialSegmentCount: NSInteger); cdecl;
    function radialSegmentCount: NSInteger; cdecl;
    procedure setHeightSegmentCount(heightSegmentCount: NSInteger); cdecl;
    function heightSegmentCount: NSInteger; cdecl;
    procedure setCapSegmentCount(capSegmentCount: NSInteger); cdecl;
    function capSegmentCount: NSInteger; cdecl;
  end;

  TSCNCapsule = class(TOCGenericImport<SCNCapsuleClass, SCNCapsule>)
  end;

  PSCNCapsule = Pointer;

  SCNTorusClass = interface(SCNGeometryClass)
    ['{34C880D9-6329-4606-8A0D-1834A1F68AA3}']
    { class } function torusWithRingRadius(ringRadius: CGFloat;
      pipeRadius: CGFloat): Pointer { instancetype }; cdecl;
  end;

  SCNTorus = interface(SCNGeometry)
    ['{CCF35731-A862-4B22-B8AB-2DDCDF4AC5E2}']
    procedure setRingRadius(ringRadius: CGFloat); cdecl;
    function ringRadius: CGFloat; cdecl;
    procedure setPipeRadius(pipeRadius: CGFloat); cdecl;
    function pipeRadius: CGFloat; cdecl;
    procedure setRingSegmentCount(ringSegmentCount: NSInteger); cdecl;
    function ringSegmentCount: NSInteger; cdecl;
    procedure setPipeSegmentCount(pipeSegmentCount: NSInteger); cdecl;
    function pipeSegmentCount: NSInteger; cdecl;
  end;

  TSCNTorus = class(TOCGenericImport<SCNTorusClass, SCNTorus>)
  end;

  PSCNTorus = Pointer;

  SCNFloorClass = interface(SCNGeometryClass)
    ['{B9C46FB6-FAC4-43C6-ADC9-56E986836CC2}']
    { class } function floor: Pointer { instancetype }; cdecl;
  end;

  SCNFloor = interface(SCNGeometry)
    ['{EF9AC78B-23FE-45AA-98F3-9312AD6ED7C6}']
    procedure setReflectivity(reflectivity: CGFloat); cdecl;
    function reflectivity: CGFloat; cdecl;
    procedure setReflectionFalloffStart(reflectionFalloffStart: CGFloat); cdecl;
    function reflectionFalloffStart: CGFloat; cdecl;
    procedure setReflectionFalloffEnd(reflectionFalloffEnd: CGFloat); cdecl;
    function reflectionFalloffEnd: CGFloat; cdecl;
    procedure setReflectionCategoryBitMask(reflectionCategoryBitMask
      : NSUInteger); cdecl;
    function reflectionCategoryBitMask: NSUInteger; cdecl;
    procedure setWidth(width: CGFloat); cdecl;
    function width: CGFloat; cdecl;
    procedure setLength(length: CGFloat); cdecl;
    function length: CGFloat; cdecl;
    procedure setReflectionResolutionScaleFactor(reflectionResolutionScaleFactor
      : CGFloat); cdecl;
    function reflectionResolutionScaleFactor: CGFloat; cdecl;
  end;

  TSCNFloor = class(TOCGenericImport<SCNFloorClass, SCNFloor>)
  end;

  PSCNFloor = Pointer;

  SCNTextClass = interface(SCNGeometryClass)
    ['{B2264957-C618-4CAC-857D-0132D2B013EE}']
    { class } function textWithString(&string: Pointer; extrusionDepth: CGFloat)
      : Pointer { instancetype }; cdecl;
  end;

  SCNText = interface(SCNGeometry)
    ['{09673F75-317C-4D5E-9EC9-2DEC7AC204A2}']
    procedure setExtrusionDepth(extrusionDepth: CGFloat); cdecl;
    function extrusionDepth: CGFloat; cdecl;
    procedure setString(&string: Pointer); cdecl;
    function &string: Pointer; cdecl;
    procedure setFont(font: UIFont); cdecl;
    function font: UIFont; cdecl;
    procedure setWrapped(wrapped: Boolean); cdecl;
    function isWrapped: Boolean; cdecl;
    procedure setContainerFrame(containerFrame: CGRect); cdecl;
    function containerFrame: CGRect; cdecl;
    procedure setTruncationMode(truncationMode: NSString); cdecl;
    function truncationMode: NSString; cdecl;
    procedure setAlignmentMode(alignmentMode: NSString); cdecl;
    function alignmentMode: NSString; cdecl;
    procedure setChamferRadius(chamferRadius: CGFloat); cdecl;
    function chamferRadius: CGFloat; cdecl;
    procedure setChamferProfile(chamferProfile: UIBezierPath); cdecl;
    function chamferProfile: UIBezierPath; cdecl;
    procedure setFlatness(flatness: CGFloat); cdecl;
    function flatness: CGFloat; cdecl;
  end;

  TSCNText = class(TOCGenericImport<SCNTextClass, SCNText>)
  end;

  PSCNText = Pointer;

  SCNShapeClass = interface(SCNGeometryClass)
    ['{3C1C638F-F193-4983-94EA-344C58D77FBE}']
    { class } function shapeWithPath(path: UIBezierPath;
      extrusionDepth: CGFloat): Pointer { instancetype }; cdecl;
  end;

  SCNShape = interface(SCNGeometry)
    ['{DD17BCE7-DB08-4782-980D-EE2EC83411C6}']
    procedure setPath(path: UIBezierPath); cdecl;
    function path: UIBezierPath; cdecl;
    procedure setExtrusionDepth(extrusionDepth: CGFloat); cdecl;
    function extrusionDepth: CGFloat; cdecl;
    procedure setChamferMode(chamferMode: SCNChamferMode); cdecl;
    function chamferMode: SCNChamferMode; cdecl;
    procedure setChamferRadius(chamferRadius: CGFloat); cdecl;
    function chamferRadius: CGFloat; cdecl;
    procedure setChamferProfile(chamferProfile: UIBezierPath); cdecl;
    function chamferProfile: UIBezierPath; cdecl;
  end;

  TSCNShape = class(TOCGenericImport<SCNShapeClass, SCNShape>)
  end;

  PSCNShape = Pointer;

  SCNTransactionClass = interface(NSObjectClass)
    ['{261A69BE-2903-4CBC-A6E0-B4B299A8AE49}']
    { class } procedure &begin; cdecl;
    { class } procedure commit; cdecl;
    { class } procedure flush; cdecl;
    { class } procedure lock; cdecl;
    { class } procedure unlock; cdecl;
    { class } function valueForKey(key: NSString): Pointer; cdecl;
    { class } procedure setValue(value: Pointer; forKey: NSString); cdecl;
  end;

  SCNTransaction = interface(NSObject)
    ['{31A57A6A-55D7-4E91-9388-B4146EDCE698}']
    procedure setAnimationDuration(animationDuration: CFTimeInterval); cdecl;
    function animationDuration: CFTimeInterval; cdecl;
    procedure setAnimationTimingFunction(animationTimingFunction
      : CAMediaTimingFunction); cdecl;
    function animationTimingFunction: CAMediaTimingFunction; cdecl;
    procedure setDisableActions(disableActions: Boolean); cdecl;
    function disableActions: Boolean; cdecl;
    procedure setCompletionBlock(completionBlock
      : TSceneKitCompletionHandler); cdecl;
    function completionBlock: TSceneKitCompletionHandler; cdecl;
  end;

  TSCNTransaction = class(TOCGenericImport<SCNTransactionClass, SCNTransaction>)
  end;

  PSCNTransaction = Pointer;

  SCNLookAtConstraintClass = interface(SCNConstraintClass)
    ['{9AA55B96-0BA2-47C4-9F70-90F7530CE743}']
    { class } function lookAtConstraintWithTarget(target: SCNNode)
      : Pointer { instancetype }; cdecl;
  end;

  SCNLookAtConstraint = interface(SCNConstraint)
    ['{93769E4C-F276-45C8-A2CD-E1A22DE01275}']
    function target: SCNNode; cdecl;
    procedure setTarget(target: SCNNode); cdecl;
    procedure setTargetOffset(targetOffset: SCNVector3); cdecl;
    function targetOffset: SCNVector3; cdecl;
    procedure setLocalFront(localFront: SCNVector3); cdecl;
    function localFront: SCNVector3; cdecl;
    procedure setWorldUp(worldUp: SCNVector3); cdecl;
    function worldUp: SCNVector3; cdecl;
    procedure setGimbalLockEnabled(gimbalLockEnabled: Boolean); cdecl;
    function gimbalLockEnabled: Boolean; cdecl;
  end;

  TSCNLookAtConstraint = class(TOCGenericImport<SCNLookAtConstraintClass,
    SCNLookAtConstraint>)
  end;

  PSCNLookAtConstraint = Pointer;

  SCNBillboardConstraintClass = interface(SCNConstraintClass)
    ['{BE0C061B-F9B3-4666-BA24-0B4B70333A40}']
    { class } function billboardConstraint: Pointer { instancetype }; cdecl;
  end;

  SCNBillboardConstraint = interface(SCNConstraint)
    ['{1C52543B-85FA-4A3D-81E4-8A93D860BE83}']
    procedure setFreeAxes(freeAxes: SCNBillboardAxis); cdecl;
    function freeAxes: SCNBillboardAxis; cdecl;
  end;

  TSCNBillboardConstraint = class(TOCGenericImport<SCNBillboardConstraintClass,
    SCNBillboardConstraint>)
  end;

  PSCNBillboardConstraint = Pointer;

  SCNTransformConstraintClass = interface(SCNConstraintClass)
    ['{0FB7ED0B-6126-48F2-A779-A2E9234A673A}']
    { class } function transformConstraintInWorldSpace(world: Boolean;
      withBlock: TSceneKitWithBlock): Pointer { instancetype }; cdecl;
    { class } function positionConstraintInWorldSpace(world: Boolean;
      withBlock: TSceneKitWithBlock1): Pointer { instancetype }; cdecl;
    { class } function orientationConstraintInWorldSpace(world: Boolean;
      withBlock: TSceneKitWithBlock2): Pointer { instancetype }; cdecl;
  end;

  SCNTransformConstraint = interface(SCNConstraint)
    ['{289F3D27-A8BC-4C30-B8F7-E26EA3AE0E60}']
  end;

  TSCNTransformConstraint = class(TOCGenericImport<SCNTransformConstraintClass,
    SCNTransformConstraint>)
  end;

  PSCNTransformConstraint = Pointer;

  SCNIKConstraintClass = interface(SCNConstraintClass)
    ['{A9384169-6E87-46B8-AB97-3C472DE502ED}']
    { class } function inverseKinematicsConstraintWithChainRootNode
      (chainRootNode: SCNNode): Pointer { instancetype }; cdecl;
  end;

  SCNIKConstraint = interface(SCNConstraint)
    ['{0C97EABB-3CE2-4055-AFE0-10130CFCD60C}']
    function initWithChainRootNode(chainRootNode: SCNNode)
      : Pointer { instancetype }; cdecl;
    function chainRootNode: SCNNode; cdecl;
    procedure setTargetPosition(targetPosition: SCNVector3); cdecl;
    function targetPosition: SCNVector3; cdecl;
    procedure setMaxAllowedRotationAngle(angle: CGFloat;
      forJoint: SCNNode); cdecl;
    function maxAllowedRotationAngleForJoint(node: SCNNode): CGFloat; cdecl;
  end;

  TSCNIKConstraint = class(TOCGenericImport<SCNIKConstraintClass,
    SCNIKConstraint>)
  end;

  PSCNIKConstraint = Pointer;

  SCNDistanceConstraintClass = interface(SCNConstraintClass)
    ['{26033586-F9BC-493A-BF5D-CE4281BB2555}']
    { class } function distanceConstraintWithTarget(target: SCNNode)
      : Pointer { instancetype }; cdecl;
  end;

  SCNDistanceConstraint = interface(SCNConstraint)
    ['{414116BC-A896-4073-A86F-A49F63F82D2D}']
    procedure setTarget(target: SCNNode); cdecl;
    function target: SCNNode; cdecl;
    procedure setMinimumDistance(minimumDistance: CGFloat); cdecl;
    function minimumDistance: CGFloat; cdecl;
    procedure setMaximumDistance(maximumDistance: CGFloat); cdecl;
    function maximumDistance: CGFloat; cdecl;
  end;

  TSCNDistanceConstraint = class(TOCGenericImport<SCNDistanceConstraintClass,
    SCNDistanceConstraint>)
  end;

  PSCNDistanceConstraint = Pointer;

  SCNReplicatorConstraintClass = interface(SCNConstraintClass)
    ['{DD858809-FAD5-4321-806F-F326C418CEDE}']
    { class } function replicatorConstraintWithTarget(target: SCNNode)
      : Pointer { instancetype }; cdecl;
  end;

  SCNReplicatorConstraint = interface(SCNConstraint)
    ['{3E2A930A-8AC7-40BD-9584-618E31C497D3}']
    procedure setTarget(target: SCNNode); cdecl;
    function target: SCNNode; cdecl;
    procedure setReplicatesOrientation(replicatesOrientation: Boolean); cdecl;
    function replicatesOrientation: Boolean; cdecl;
    procedure setReplicatesPosition(replicatesPosition: Boolean); cdecl;
    function replicatesPosition: Boolean; cdecl;
    procedure setReplicatesScale(replicatesScale: Boolean); cdecl;
    function replicatesScale: Boolean; cdecl;
    procedure setOrientationOffset(orientationOffset: SCNQuaternion); cdecl;
    function orientationOffset: SCNQuaternion; cdecl;
    procedure setPositionOffset(positionOffset: SCNVector3); cdecl;
    function positionOffset: SCNVector3; cdecl;
    procedure setScaleOffset(scaleOffset: SCNVector3); cdecl;
    function scaleOffset: SCNVector3; cdecl;
  end;

  TSCNReplicatorConstraint = class
    (TOCGenericImport<SCNReplicatorConstraintClass, SCNReplicatorConstraint>)
  end;

  PSCNReplicatorConstraint = Pointer;

  SCNAccelerationConstraintClass = interface(SCNConstraintClass)
    ['{1EE25895-677B-44E4-A736-3ED478849759}']
    { class } function accelerationConstraint: Pointer { instancetype }; cdecl;
  end;

  SCNAccelerationConstraint = interface(SCNConstraint)
    ['{96FD2C63-E6F8-424D-8D8F-899E891D3E0C}']
    procedure setMaximumLinearAcceleration(maximumLinearAcceleration
      : CGFloat); cdecl;
    function maximumLinearAcceleration: CGFloat; cdecl;
    procedure setMaximumLinearVelocity(maximumLinearVelocity: CGFloat); cdecl;
    function maximumLinearVelocity: CGFloat; cdecl;
    procedure setDecelerationDistance(decelerationDistance: CGFloat); cdecl;
    function decelerationDistance: CGFloat; cdecl;
    procedure setDamping(damping: CGFloat); cdecl;
    function damping: CGFloat; cdecl;
  end;

  TSCNAccelerationConstraint = class
    (TOCGenericImport<SCNAccelerationConstraintClass,
    SCNAccelerationConstraint>)
  end;

  PSCNAccelerationConstraint = Pointer;

  SCNSliderConstraintClass = interface(SCNConstraintClass)
    ['{DC7EAA58-2509-416F-AD83-EAC6A599306E}']
    { class } function sliderConstraint: Pointer { instancetype }; cdecl;
  end;

  SCNSliderConstraint = interface(SCNConstraint)
    ['{843A25F7-4A40-4133-8455-F2FCE9522D02}']
    procedure setCollisionCategoryBitMask(collisionCategoryBitMask
      : NSUInteger); cdecl;
    function collisionCategoryBitMask: NSUInteger; cdecl;
    procedure setRadius(radius: CGFloat); cdecl;
    function radius: CGFloat; cdecl;
    procedure setOffset(offset: SCNVector3); cdecl;
    function offset: SCNVector3; cdecl;
  end;

  TSCNSliderConstraint = class(TOCGenericImport<SCNSliderConstraintClass,
    SCNSliderConstraint>)
  end;

  PSCNSliderConstraint = Pointer;

  SCNAvoidOccluderConstraintClass = interface(SCNConstraintClass)
    ['{FDE84338-BB24-478B-94D9-4E9E345C6561}']
    { class } function avoidOccluderConstraintWithTarget(target: SCNNode)
      : Pointer { instancetype }; cdecl;
  end;

  SCNAvoidOccluderConstraint = interface(SCNConstraint)
    ['{5C32F347-E5E0-4D80-B65E-DBC64536CB7F}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setTarget(target: SCNNode); cdecl;
    function target: SCNNode; cdecl;
    procedure setOccluderCategoryBitMask(occluderCategoryBitMask
      : NSUInteger); cdecl;
    function occluderCategoryBitMask: NSUInteger; cdecl;
    procedure setBias(bias: CGFloat); cdecl;
    function bias: CGFloat; cdecl;
  end;

  TSCNAvoidOccluderConstraint = class
    (TOCGenericImport<SCNAvoidOccluderConstraintClass,
    SCNAvoidOccluderConstraint>)
  end;

  PSCNAvoidOccluderConstraint = Pointer;

  SCNParticlePropertyControllerClass = interface(NSObjectClass)
    ['{21F3F150-BF42-45E4-AB90-BF45132E0857}']
    { class } function controllerWithAnimation(animation: CAAnimation)
      : Pointer { instancetype }; cdecl;
  end;

  SCNParticlePropertyController = interface(NSObject)
    ['{EE218DE1-813F-47E2-86B4-BA1801BF263C}']
    procedure setAnimation(animation: CAAnimation); cdecl;
    function animation: CAAnimation; cdecl;
    procedure setInputMode(inputMode: SCNParticleInputMode); cdecl;
    function inputMode: SCNParticleInputMode; cdecl;
    procedure setInputScale(inputScale: CGFloat); cdecl;
    function inputScale: CGFloat; cdecl;
    procedure setInputBias(inputBias: CGFloat); cdecl;
    function inputBias: CGFloat; cdecl;
    procedure setInputOrigin(inputOrigin: SCNNode); cdecl;
    function inputOrigin: SCNNode; cdecl;
    procedure setInputProperty(inputProperty: SCNParticleProperty); cdecl;
    function inputProperty: SCNParticleProperty; cdecl;
  end;

  TSCNParticlePropertyController = class
    (TOCGenericImport<SCNParticlePropertyControllerClass,
    SCNParticlePropertyController>)
  end;

  PSCNParticlePropertyController = Pointer;

  SCNParticleSystemClass = interface(NSObjectClass)
    ['{D980EB1B-1EEF-4038-B610-EDA90F8DE313}']
    { class } function particleSystem: Pointer { instancetype }; cdecl;
    { class } function particleSystemNamed(name: NSString;
      inDirectory: NSString): Pointer { instancetype }; cdecl;
  end;

  SCNParticleSystem = interface(NSObject)
    ['{B7768154-B45D-4EF9-ADF0-BE1BB52B5683}']
    procedure setEmissionDuration(emissionDuration: CGFloat); cdecl;
    function emissionDuration: CGFloat; cdecl;
    procedure setEmissionDurationVariation(emissionDurationVariation
      : CGFloat); cdecl;
    function emissionDurationVariation: CGFloat; cdecl;
    procedure setIdleDuration(idleDuration: CGFloat); cdecl;
    function idleDuration: CGFloat; cdecl;
    procedure setIdleDurationVariation(idleDurationVariation: CGFloat); cdecl;
    function idleDurationVariation: CGFloat; cdecl;
    procedure setLoops(loops: Boolean); cdecl;
    function loops: Boolean; cdecl;
    procedure setBirthRate(birthRate: CGFloat); cdecl;
    function birthRate: CGFloat; cdecl;
    procedure setBirthRateVariation(birthRateVariation: CGFloat); cdecl;
    function birthRateVariation: CGFloat; cdecl;
    procedure setWarmupDuration(warmupDuration: CGFloat); cdecl;
    function warmupDuration: CGFloat; cdecl;
    procedure setEmitterShape(emitterShape: SCNGeometry); cdecl;
    function emitterShape: SCNGeometry; cdecl;
    procedure setBirthLocation(birthLocation: SCNParticleBirthLocation); cdecl;
    function birthLocation: SCNParticleBirthLocation; cdecl;
    procedure setBirthDirection(birthDirection
      : SCNParticleBirthDirection); cdecl;
    function birthDirection: SCNParticleBirthDirection; cdecl;
    procedure setSpreadingAngle(spreadingAngle: CGFloat); cdecl;
    function spreadingAngle: CGFloat; cdecl;
    procedure setEmittingDirection(emittingDirection: SCNVector3); cdecl;
    function emittingDirection: SCNVector3; cdecl;
    procedure setOrientationDirection(orientationDirection: SCNVector3); cdecl;
    function orientationDirection: SCNVector3; cdecl;
    procedure setAcceleration(acceleration: SCNVector3); cdecl;
    function acceleration: SCNVector3; cdecl;
    procedure setLocal(local: Boolean); cdecl;
    function isLocal: Boolean; cdecl;
    procedure setParticleAngle(particleAngle: CGFloat); cdecl;
    function particleAngle: CGFloat; cdecl;
    procedure setParticleAngleVariation(particleAngleVariation: CGFloat); cdecl;
    function particleAngleVariation: CGFloat; cdecl;
    procedure setParticleVelocity(particleVelocity: CGFloat); cdecl;
    function particleVelocity: CGFloat; cdecl;
    procedure setParticleVelocityVariation(particleVelocityVariation
      : CGFloat); cdecl;
    function particleVelocityVariation: CGFloat; cdecl;
    procedure setParticleAngularVelocity(particleAngularVelocity
      : CGFloat); cdecl;
    function particleAngularVelocity: CGFloat; cdecl;
    procedure setParticleAngularVelocityVariation
      (particleAngularVelocityVariation: CGFloat); cdecl;
    function particleAngularVelocityVariation: CGFloat; cdecl;
    procedure setParticleLifeSpan(particleLifeSpan: CGFloat); cdecl;
    function particleLifeSpan: CGFloat; cdecl;
    procedure setParticleLifeSpanVariation(particleLifeSpanVariation
      : CGFloat); cdecl;
    function particleLifeSpanVariation: CGFloat; cdecl;
    procedure setSystemSpawnedOnDying(systemSpawnedOnDying
      : SCNParticleSystem); cdecl;
    function systemSpawnedOnDying: SCNParticleSystem; cdecl;
    procedure setSystemSpawnedOnCollision(systemSpawnedOnCollision
      : SCNParticleSystem); cdecl;
    function systemSpawnedOnCollision: SCNParticleSystem; cdecl;
    procedure setSystemSpawnedOnLiving(systemSpawnedOnLiving
      : SCNParticleSystem); cdecl;
    function systemSpawnedOnLiving: SCNParticleSystem; cdecl;
    procedure setParticleImage(particleImage: Pointer); cdecl;
    function particleImage: Pointer; cdecl;
    procedure setImageSequenceColumnCount(imageSequenceColumnCount
      : NSUInteger); cdecl;
    function imageSequenceColumnCount: NSUInteger; cdecl;
    procedure setImageSequenceRowCount(imageSequenceRowCount
      : NSUInteger); cdecl;
    function imageSequenceRowCount: NSUInteger; cdecl;
    procedure setImageSequenceInitialFrame(imageSequenceInitialFrame
      : CGFloat); cdecl;
    function imageSequenceInitialFrame: CGFloat; cdecl;
    procedure setImageSequenceInitialFrameVariation
      (imageSequenceInitialFrameVariation: CGFloat); cdecl;
    function imageSequenceInitialFrameVariation: CGFloat; cdecl;
    procedure setImageSequenceFrameRate(imageSequenceFrameRate: CGFloat); cdecl;
    function imageSequenceFrameRate: CGFloat; cdecl;
    procedure setImageSequenceFrameRateVariation(imageSequenceFrameRateVariation
      : CGFloat); cdecl;
    function imageSequenceFrameRateVariation: CGFloat; cdecl;
    procedure setImageSequenceAnimationMode(imageSequenceAnimationMode
      : SCNParticleImageSequenceAnimationMode); cdecl;
    function imageSequenceAnimationMode
      : SCNParticleImageSequenceAnimationMode; cdecl;
    procedure setParticleColor(particleColor: UIColor); cdecl;
    function particleColor: UIColor; cdecl;
    procedure setParticleColorVariation(particleColorVariation
      : SCNVector4); cdecl;
    function particleColorVariation: SCNVector4; cdecl;
    procedure setParticleSize(particleSize: CGFloat); cdecl;
    function particleSize: CGFloat; cdecl;
    procedure setParticleSizeVariation(particleSizeVariation: CGFloat); cdecl;
    function particleSizeVariation: CGFloat; cdecl;
    procedure setParticleIntensity(particleIntensity: CGFloat); cdecl;
    function particleIntensity: CGFloat; cdecl;
    procedure setParticleIntensityVariation(particleIntensityVariation
      : CGFloat); cdecl;
    function particleIntensityVariation: CGFloat; cdecl;
    procedure setBlendMode(blendMode: SCNParticleBlendMode); cdecl;
    function blendMode: SCNParticleBlendMode; cdecl;
    procedure setBlackPassEnabled(blackPassEnabled: Boolean); cdecl;
    function isBlackPassEnabled: Boolean; cdecl;
    procedure setOrientationMode(orientationMode
      : SCNParticleOrientationMode); cdecl;
    function orientationMode: SCNParticleOrientationMode; cdecl;
    procedure setSortingMode(sortingMode: SCNParticleSortingMode); cdecl;
    function sortingMode: SCNParticleSortingMode; cdecl;
    procedure setLightingEnabled(lightingEnabled: Boolean); cdecl;
    function isLightingEnabled: Boolean; cdecl;
    procedure setAffectedByGravity(affectedByGravity: Boolean); cdecl;
    function affectedByGravity: Boolean; cdecl;
    procedure setAffectedByPhysicsFields(affectedByPhysicsFields
      : Boolean); cdecl;
    function affectedByPhysicsFields: Boolean; cdecl;
    procedure setParticleDiesOnCollision(particleDiesOnCollision
      : Boolean); cdecl;
    function particleDiesOnCollision: Boolean; cdecl;
    procedure setColliderNodes(colliderNodes: NSArray); cdecl;
    function colliderNodes: NSArray; cdecl;
    procedure setParticleMass(particleMass: CGFloat); cdecl;
    function particleMass: CGFloat; cdecl;
    procedure setParticleMassVariation(particleMassVariation: CGFloat); cdecl;
    function particleMassVariation: CGFloat; cdecl;
    procedure setParticleBounce(particleBounce: CGFloat); cdecl;
    function particleBounce: CGFloat; cdecl;
    procedure setParticleBounceVariation(particleBounceVariation
      : CGFloat); cdecl;
    function particleBounceVariation: CGFloat; cdecl;
    procedure setParticleFriction(particleFriction: CGFloat); cdecl;
    function particleFriction: CGFloat; cdecl;
    procedure setParticleFrictionVariation(particleFrictionVariation
      : CGFloat); cdecl;
    function particleFrictionVariation: CGFloat; cdecl;
    procedure setParticleCharge(particleCharge: CGFloat); cdecl;
    function particleCharge: CGFloat; cdecl;
    procedure setParticleChargeVariation(particleChargeVariation
      : CGFloat); cdecl;
    function particleChargeVariation: CGFloat; cdecl;
    procedure setDampingFactor(dampingFactor: CGFloat); cdecl;
    function dampingFactor: CGFloat; cdecl;
    procedure setSpeedFactor(speedFactor: CGFloat); cdecl;
    function speedFactor: CGFloat; cdecl;
    procedure setStretchFactor(stretchFactor: CGFloat); cdecl;
    function stretchFactor: CGFloat; cdecl;
    procedure setFresnelExponent(fresnelExponent: CGFloat); cdecl;
    function fresnelExponent: CGFloat; cdecl;
    procedure setWritesToDepthBuffer(writesToDepthBuffer: Boolean); cdecl;
    function writesToDepthBuffer: Boolean; cdecl;
    procedure setPropertyControllers(propertyControllers: NSDictionary); cdecl;
    function propertyControllers: NSDictionary; cdecl;
    procedure reset; cdecl;
    procedure handleEvent(event: SCNParticleEvent; forProperties: NSArray;
      withBlock: SCNParticleEventBlock); cdecl;
    procedure addModifierForProperties(properties: NSArray;
      atStage: SCNParticleModifierStage;
      withBlock: SCNParticleModifierBlock); cdecl;
    procedure removeModifiersOfStage(stage: SCNParticleModifierStage); cdecl;
    procedure removeAllModifiers; cdecl;
  end;

  TSCNParticleSystem = class(TOCGenericImport<SCNParticleSystemClass,
    SCNParticleSystem>)
  end;

  PSCNParticleSystem = Pointer;

  SCNPhysicsShapeClass = interface(NSObjectClass)
    ['{634D8F8C-782B-42D9-9B55-88AECAFEE660}']
    { class } function shapeWithGeometry(geometry: SCNGeometry;
      options: NSDictionary): Pointer { instancetype }; cdecl;
    { class } function shapeWithNode(node: SCNNode; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    { class } function shapeWithShapes(shapes: NSArray; transforms: NSArray)
      : Pointer { instancetype }; cdecl;
  end;

  SCNPhysicsShape = interface(NSObject)
    ['{CB44FAD9-81B0-45F8-BAD3-C2D210644886}']
    function options: NSDictionary; cdecl;
    function sourceObject: Pointer; cdecl;
    function transforms: NSArray; cdecl;
  end;

  TSCNPhysicsShape = class(TOCGenericImport<SCNPhysicsShapeClass,
    SCNPhysicsShape>)
  end;

  PSCNPhysicsShape = Pointer;

  SCNPhysicsContactClass = interface(NSObjectClass)
    ['{EA5411A6-372B-4D5C-9D1A-C2B0E036DC7B}']
  end;

  SCNPhysicsContact = interface(NSObject)
    ['{CAA91F78-D8D6-4F24-887F-26877D72E4CC}']
    function nodeA: SCNNode; cdecl;
    function nodeB: SCNNode; cdecl;
    function contactPoint: SCNVector3; cdecl;
    function contactNormal: SCNVector3; cdecl;
    function collisionImpulse: CGFloat; cdecl;
    function penetrationDistance: CGFloat; cdecl;
    function sweepTestFraction: CGFloat; cdecl;
  end;

  TSCNPhysicsContact = class(TOCGenericImport<SCNPhysicsContactClass,
    SCNPhysicsContact>)
  end;

  PSCNPhysicsContact = Pointer;

  SCNPhysicsBehaviorClass = interface(NSObjectClass)
    ['{D5A99FBE-76FD-4FDC-866A-B8F4FC717D5A}']
  end;

  SCNPhysicsBehavior = interface(NSObject)
    ['{1E17B96E-1811-4E21-BBF0-81438F3507C3}']
  end;

  TSCNPhysicsBehavior = class(TOCGenericImport<SCNPhysicsBehaviorClass,
    SCNPhysicsBehavior>)
  end;

  PSCNPhysicsBehavior = Pointer;

  SCNPhysicsHingeJointClass = interface(SCNPhysicsBehaviorClass)
    ['{503BD94F-3349-4274-9504-D903FBFCE8BC}']
    { class } function jointWithBodyA(bodyA: SCNPhysicsBody; axisA: SCNVector3;
      anchorA: SCNVector3; bodyB: SCNPhysicsBody; axisB: SCNVector3;
      anchorB: SCNVector3): Pointer { instancetype }; cdecl;
    { class } function jointWithBody(body: SCNPhysicsBody; axis: SCNVector3;
      anchor: SCNVector3): Pointer { instancetype }; cdecl;
  end;

  SCNPhysicsHingeJoint = interface(SCNPhysicsBehavior)
    ['{EFBA8E3C-C469-4DE1-9B43-2589E059D1CC}']
    function bodyA: SCNPhysicsBody; cdecl;
    procedure setAxisA(axisA: SCNVector3); cdecl;
    function axisA: SCNVector3; cdecl;
    procedure setAnchorA(anchorA: SCNVector3); cdecl;
    function anchorA: SCNVector3; cdecl;
    function bodyB: SCNPhysicsBody; cdecl;
    procedure setAxisB(axisB: SCNVector3); cdecl;
    function axisB: SCNVector3; cdecl;
    procedure setAnchorB(anchorB: SCNVector3); cdecl;
    function anchorB: SCNVector3; cdecl;
  end;

  TSCNPhysicsHingeJoint = class(TOCGenericImport<SCNPhysicsHingeJointClass,
    SCNPhysicsHingeJoint>)
  end;

  PSCNPhysicsHingeJoint = Pointer;

  SCNPhysicsBallSocketJointClass = interface(SCNPhysicsBehaviorClass)
    ['{2750B33C-863B-4BEA-94C8-FABAADE5DC74}']
    { class } function jointWithBodyA(bodyA: SCNPhysicsBody;
      anchorA: SCNVector3; bodyB: SCNPhysicsBody; anchorB: SCNVector3)
      : Pointer { instancetype }; cdecl;
    { class } function jointWithBody(body: SCNPhysicsBody; anchor: SCNVector3)
      : Pointer { instancetype }; cdecl;
  end;

  SCNPhysicsBallSocketJoint = interface(SCNPhysicsBehavior)
    ['{F63ABC76-AC19-4534-BC88-8F63893CA9B1}']
    function bodyA: SCNPhysicsBody; cdecl;
    procedure setAnchorA(anchorA: SCNVector3); cdecl;
    function anchorA: SCNVector3; cdecl;
    function bodyB: SCNPhysicsBody; cdecl;
    procedure setAnchorB(anchorB: SCNVector3); cdecl;
    function anchorB: SCNVector3; cdecl;
  end;

  TSCNPhysicsBallSocketJoint = class
    (TOCGenericImport<SCNPhysicsBallSocketJointClass,
    SCNPhysicsBallSocketJoint>)
  end;

  PSCNPhysicsBallSocketJoint = Pointer;

  SCNPhysicsSliderJointClass = interface(SCNPhysicsBehaviorClass)
    ['{06CD1926-7511-4BF6-8EE7-E811000CFDE6}']
    { class } function jointWithBodyA(bodyA: SCNPhysicsBody; axisA: SCNVector3;
      anchorA: SCNVector3; bodyB: SCNPhysicsBody; axisB: SCNVector3;
      anchorB: SCNVector3): Pointer { instancetype }; cdecl;
    { class } function jointWithBody(body: SCNPhysicsBody; axis: SCNVector3;
      anchor: SCNVector3): Pointer { instancetype }; cdecl;
  end;

  SCNPhysicsSliderJoint = interface(SCNPhysicsBehavior)
    ['{FBC6ACEA-99BD-426F-B2AA-2287D0571521}']
    function bodyA: SCNPhysicsBody; cdecl;
    procedure setAxisA(axisA: SCNVector3); cdecl;
    function axisA: SCNVector3; cdecl;
    procedure setAnchorA(anchorA: SCNVector3); cdecl;
    function anchorA: SCNVector3; cdecl;
    function bodyB: SCNPhysicsBody; cdecl;
    procedure setAxisB(axisB: SCNVector3); cdecl;
    function axisB: SCNVector3; cdecl;
    procedure setAnchorB(anchorB: SCNVector3); cdecl;
    function anchorB: SCNVector3; cdecl;
    procedure setMinimumLinearLimit(minimumLinearLimit: CGFloat); cdecl;
    function minimumLinearLimit: CGFloat; cdecl;
    procedure setMaximumLinearLimit(maximumLinearLimit: CGFloat); cdecl;
    function maximumLinearLimit: CGFloat; cdecl;
    procedure setMinimumAngularLimit(minimumAngularLimit: CGFloat); cdecl;
    function minimumAngularLimit: CGFloat; cdecl;
    procedure setMaximumAngularLimit(maximumAngularLimit: CGFloat); cdecl;
    function maximumAngularLimit: CGFloat; cdecl;
    procedure setMotorTargetLinearVelocity(motorTargetLinearVelocity
      : CGFloat); cdecl;
    function motorTargetLinearVelocity: CGFloat; cdecl;
    procedure setMotorMaximumForce(motorMaximumForce: CGFloat); cdecl;
    function motorMaximumForce: CGFloat; cdecl;
    procedure setMotorTargetAngularVelocity(motorTargetAngularVelocity
      : CGFloat); cdecl;
    function motorTargetAngularVelocity: CGFloat; cdecl;
    procedure setMotorMaximumTorque(motorMaximumTorque: CGFloat); cdecl;
    function motorMaximumTorque: CGFloat; cdecl;
  end;

  TSCNPhysicsSliderJoint = class(TOCGenericImport<SCNPhysicsSliderJointClass,
    SCNPhysicsSliderJoint>)
  end;

  PSCNPhysicsSliderJoint = Pointer;

  SCNPhysicsConeTwistJointClass = interface(SCNPhysicsBehaviorClass)
    ['{42178423-C428-4C16-B4A4-E841E8C3A5EE}']
    { class } function jointWithBodyA(bodyA: SCNPhysicsBody; frameA: SCNMatrix4;
      bodyB: SCNPhysicsBody; frameB: SCNMatrix4)
      : Pointer { instancetype }; cdecl;
    { class } function jointWithBody(body: SCNPhysicsBody; frame: SCNMatrix4)
      : Pointer { instancetype }; cdecl;
  end;

  SCNPhysicsConeTwistJoint = interface(SCNPhysicsBehavior)
    ['{7DCC418B-5B92-4EE3-847B-131392DD6D97}']
    function bodyA: SCNPhysicsBody; cdecl;
    procedure setFrameA(frameA: SCNMatrix4); cdecl;
    function frameA: SCNMatrix4; cdecl;
    function bodyB: SCNPhysicsBody; cdecl;
    procedure setFrameB(frameB: SCNMatrix4); cdecl;
    function frameB: SCNMatrix4; cdecl;
    procedure setMaximumAngularLimit1(maximumAngularLimit1: CGFloat); cdecl;
    function maximumAngularLimit1: CGFloat; cdecl;
    procedure setMaximumAngularLimit2(maximumAngularLimit2: CGFloat); cdecl;
    function maximumAngularLimit2: CGFloat; cdecl;
    procedure setMaximumTwistAngle(maximumTwistAngle: CGFloat); cdecl;
    function maximumTwistAngle: CGFloat; cdecl;
  end;

  TSCNPhysicsConeTwistJoint = class
    (TOCGenericImport<SCNPhysicsConeTwistJointClass, SCNPhysicsConeTwistJoint>)
  end;

  PSCNPhysicsConeTwistJoint = Pointer;

  SCNPhysicsVehicleWheelClass = interface(NSObjectClass)
    ['{4FB3ADBA-1AC5-4C76-ABF9-90D780CB1195}']
    { class } function wheelWithNode(node: SCNNode)
      : Pointer { instancetype }; cdecl;
  end;

  SCNPhysicsVehicleWheel = interface(NSObject)
    ['{58400DBE-9805-46BB-B6A7-5BD748A1D256}']
    function node: SCNNode; cdecl;
    procedure setSuspensionStiffness(suspensionStiffness: CGFloat); cdecl;
    function suspensionStiffness: CGFloat; cdecl;
    procedure setSuspensionCompression(suspensionCompression: CGFloat); cdecl;
    function suspensionCompression: CGFloat; cdecl;
    procedure setSuspensionDamping(suspensionDamping: CGFloat); cdecl;
    function suspensionDamping: CGFloat; cdecl;
    procedure setMaximumSuspensionTravel(maximumSuspensionTravel
      : CGFloat); cdecl;
    function maximumSuspensionTravel: CGFloat; cdecl;
    procedure setFrictionSlip(frictionSlip: CGFloat); cdecl;
    function frictionSlip: CGFloat; cdecl;
    procedure setMaximumSuspensionForce(maximumSuspensionForce: CGFloat); cdecl;
    function maximumSuspensionForce: CGFloat; cdecl;
    procedure setConnectionPosition(connectionPosition: SCNVector3); cdecl;
    function connectionPosition: SCNVector3; cdecl;
    procedure setSteeringAxis(steeringAxis: SCNVector3); cdecl;
    function steeringAxis: SCNVector3; cdecl;
    procedure setAxle(axle: SCNVector3); cdecl;
    function axle: SCNVector3; cdecl;
    procedure setRadius(radius: CGFloat); cdecl;
    function radius: CGFloat; cdecl;
    procedure setSuspensionRestLength(suspensionRestLength: CGFloat); cdecl;
    function suspensionRestLength: CGFloat; cdecl;
  end;

  TSCNPhysicsVehicleWheel = class(TOCGenericImport<SCNPhysicsVehicleWheelClass,
    SCNPhysicsVehicleWheel>)
  end;

  PSCNPhysicsVehicleWheel = Pointer;

  SCNPhysicsVehicleClass = interface(SCNPhysicsBehaviorClass)
    ['{3E4897F1-C43F-4B78-B0A8-8809AD5E8272}']
    { class } function vehicleWithChassisBody(chassisBody: SCNPhysicsBody;
      wheels: NSArray): Pointer { instancetype }; cdecl;
  end;

  SCNPhysicsVehicle = interface(SCNPhysicsBehavior)
    ['{506228E4-9EDD-4FCC-88E2-E557266D97E6}']
    function speedInKilometersPerHour: CGFloat; cdecl;
    function wheels: NSArray; cdecl;
    function chassisBody: SCNPhysicsBody; cdecl;
    procedure applyEngineForce(value: CGFloat;
      forWheelAtIndex: NSInteger); cdecl;
    procedure setSteeringAngle(value: CGFloat;
      forWheelAtIndex: NSInteger); cdecl;
    procedure applyBrakingForce(value: CGFloat;
      forWheelAtIndex: NSInteger); cdecl;
  end;

  TSCNPhysicsVehicle = class(TOCGenericImport<SCNPhysicsVehicleClass,
    SCNPhysicsVehicle>)
  end;

  PSCNPhysicsVehicle = Pointer;

  SCNReferenceNodeClass = interface(SCNNodeClass)
    ['{3579AA6C-E8E5-4EEE-9DFD-AACE2D49358C}']
    { class } function referenceNodeWithURL(referenceURL: NSURL)
      : Pointer { instancetype }; cdecl;
  end;

  SCNReferenceNode = interface(SCNNode)
    ['{FE863D6A-07BF-4704-8701-CEEF596A26A3}']
    function initWithURL(referenceURL: NSURL): Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    procedure setReferenceURL(referenceURL: NSURL); cdecl;
    function referenceURL: NSURL; cdecl;
    procedure setLoadingPolicy(loadingPolicy: SCNReferenceLoadingPolicy); cdecl;
    function loadingPolicy: SCNReferenceLoadingPolicy; cdecl;
    procedure load; cdecl;
    procedure unload; cdecl;
    function isLoaded: Boolean; cdecl;
  end;

  TSCNReferenceNode = class(TOCGenericImport<SCNReferenceNodeClass,
    SCNReferenceNode>)
  end;

  PSCNReferenceNode = Pointer;

  SCNAudioPlayerClass = interface(NSObjectClass)
    ['{5A56E0A2-0F4F-4677-87A7-7FF543D101FC}']
    { class } function audioPlayerWithSource(source: SCNAudioSource)
      : Pointer { instancetype }; cdecl;
    { class } function audioPlayerWithAVAudioNode(audioNode: AVAudioNode)
      : Pointer { instancetype }; cdecl;
  end;

  SCNAudioPlayer = interface(NSObject)
    ['{C558FDA1-931E-41F4-91D9-EB5310726094}']
    function initWithSource(source: SCNAudioSource)
      : Pointer { instancetype }; cdecl;
    function initWithAVAudioNode(audioNode: AVAudioNode)
      : Pointer { instancetype }; cdecl;
    procedure setWillStartPlayback(willStartPlayback
      : TSceneKitCompletionHandler); cdecl;
    function willStartPlayback: TSceneKitCompletionHandler; cdecl;
    procedure setDidFinishPlayback(didFinishPlayback
      : TSceneKitCompletionHandler); cdecl;
    function didFinishPlayback: TSceneKitCompletionHandler; cdecl;
    function audioNode: AVAudioNode; cdecl;
    function audioSource: SCNAudioSource; cdecl;
  end;

  TSCNAudioPlayer = class(TOCGenericImport<SCNAudioPlayerClass, SCNAudioPlayer>)
  end;

  PSCNAudioPlayer = Pointer;

  // ===== Protocol declarations =====

  SCNAnimatable = interface(IObjectiveC)
    ['{581D1ACB-47C8-4511-97AD-F8B26772227E}']
    procedure addAnimation(animation: Pointer; forKey: NSString); cdecl;
    procedure addAnimationPlayer(player: SCNAnimationPlayer;
      forKey: NSString); cdecl;
    procedure removeAllAnimations; cdecl;
    procedure removeAllAnimationsWithBlendOutDuration(duration: CGFloat); cdecl;
    [MethodName('removeAnimationForKey:')]
    procedure removeAnimationForKey(key: NSString); cdecl;
    [MethodName('removeAnimationForKey:blendOutDuration:')]
    procedure removeAnimationForKeyBlendOutDuration(key: NSString;
      blendOutDuration: CGFloat); cdecl;
    function animationKeys: NSArray; cdecl;
    function animationPlayerForKey(key: NSString): SCNAnimationPlayer; cdecl;
    [MethodName('removeAnimationForKey:fadeOutDuration:')]
    procedure removeAnimationForKeyFadeOutDuration(key: NSString;
      fadeOutDuration: CGFloat); cdecl;
    function animationForKey(key: NSString): CAAnimation; cdecl;
    procedure pauseAnimationForKey(key: NSString); cdecl;
    procedure resumeAnimationForKey(key: NSString); cdecl;
    procedure setSpeed(speed: CGFloat; forAnimationKey: NSString); cdecl;
    function isAnimationForKeyPaused(key: NSString): Boolean; cdecl;
  end;

  SCNBoundingVolume = interface(IObjectiveC)
    ['{3E27865F-3A70-4E3D-A2BB-3DEBA9C2BED6}']
    function getBoundingBoxMin(min: PSCNVector3; max: PSCNVector3)
      : Boolean; cdecl;
    procedure setBoundingBoxMin(min: PSCNVector3; max: PSCNVector3); cdecl;
    function getBoundingSphereCenter(center: PSCNVector3; radius: PCGFloat)
      : Boolean; cdecl;
  end;

  SCNActionable = interface(IObjectiveC)
    ['{2D44ACD3-7DAF-4B37-8276-174A49C0D54F}']
    [MethodName('runAction:')]
    procedure runAction(action: SCNAction); cdecl;
    [MethodName('runAction:completionHandler:')]
    procedure runActionCompletionHandler(action: SCNAction;
      completionHandler: TSceneKitCompletionHandler); cdecl;
    [MethodName('runAction:forKey:')]
    procedure runActionForKey(action: SCNAction; forKey: NSString); cdecl;
    [MethodName('runAction:forKey:completionHandler:')]
    procedure runActionForKeyCompletionHandler(action: SCNAction;
      forKey: NSString; completionHandler: TSceneKitCompletionHandler); cdecl;
    function hasActions: Boolean; cdecl;
    function actionForKey(key: NSString): SCNAction; cdecl;
    procedure removeActionForKey(key: NSString); cdecl;
    procedure removeAllActions; cdecl;
    function actionKeys: NSArray; cdecl;
  end;

  SCNNodeRendererDelegate = interface(IObjectiveC)
    ['{89952944-C0A9-42A6-924A-83A495C9451B}']
    procedure renderNode(node: SCNNode; renderer: SCNRenderer;
      arguments: NSDictionary); cdecl;
  end;

  UIFocusItem = interface(IObjectiveC)
    ['{C309EF72-AC9B-42A1-AD96-22778049BB88}']
  end;

  SCNSceneExportDelegate = interface(IObjectiveC)
    ['{A8038C0B-D108-4248-B5B8-E6A7F17BD9C0}']
    function writeImage(image: UIImage; withSceneDocumentURL: NSURL;
      originalImageURL: NSURL): NSURL; cdecl;
  end;

  SCNProgramDelegate = interface(IObjectiveC)
    ['{10CF0311-AF56-4731-8832-448C417F0E1B}']
    procedure &program(&program: SCNProgram; handleError: NSError); cdecl;
    function programIsOpaque(&program: SCNProgram): Boolean; cdecl;
  end;

  SCNShadable = interface(IObjectiveC)
    ['{D786FB83-234B-45DC-BEFB-59539DBB9E0F}']
    procedure setProgram(&program: SCNProgram); cdecl;
    function &program: SCNProgram; cdecl;
    procedure handleBindingOfSymbol(symbol: NSString;
      usingBlock: SCNBindingBlock); cdecl;
    procedure handleUnbindingOfSymbol(symbol: NSString;
      usingBlock: SCNBindingBlock); cdecl;
    procedure setShaderModifiers(shaderModifiers: NSDictionary); cdecl;
    function shaderModifiers: NSDictionary; cdecl;
    procedure setMinimumLanguageVersion(minimumLanguageVersion
      : NSNumber); cdecl;
    function minimumLanguageVersion: NSNumber; cdecl;
  end;

  SCNBufferStream = interface(IObjectiveC)
    ['{8118BC50-C39B-42E3-BAFE-47326F514EF7}']
    procedure writeBytes(bytes: Pointer; length: NSUInteger); cdecl;
  end;

  SCNTechniqueSupport = interface(IObjectiveC)
    ['{ACF9C2BA-7C7B-4A7E-87DB-FEAC572A5ABF}']
    procedure setTechnique(technique: SCNTechnique); cdecl;
    function technique: SCNTechnique; cdecl;
  end;

  SCNSceneRendererDelegate = interface(IObjectiveC)
    ['{52371EF3-DA9C-4E04-8A3D-AA1A272BB7E3}']
    [MethodName('renderer:updateAtTime:')]
    procedure rendererUpdateAtTime(renderer: Pointer;
      updateAtTime: NSTimeInterval); cdecl;
    [MethodName('renderer:didApplyAnimationsAtTime:')]
    procedure rendererDidApplyAnimationsAtTime(renderer: Pointer;
      didApplyAnimationsAtTime: NSTimeInterval); cdecl;
    [MethodName('renderer:didSimulatePhysicsAtTime:')]
    procedure rendererDidSimulatePhysicsAtTime(renderer: Pointer;
      didSimulatePhysicsAtTime: NSTimeInterval); cdecl;
    [MethodName('renderer:didApplyConstraintsAtTime:')]
    procedure rendererDidApplyConstraintsAtTime(renderer: Pointer;
      didApplyConstraintsAtTime: NSTimeInterval); cdecl;
    [MethodName('renderer:willRenderScene:atTime:')]
    procedure rendererWillRenderSceneAtTime(renderer: Pointer;
      willRenderScene: SCNScene; atTime: NSTimeInterval); cdecl;
    [MethodName('renderer:didRenderScene:atTime:')]
    procedure rendererDidRenderSceneAtTime(renderer: Pointer;
      didRenderScene: SCNScene; atTime: NSTimeInterval); cdecl;
  end;

  SCNSceneRenderer = interface(IObjectiveC)
    ['{3E7EAB77-F774-4C49-AC94-2C79A1924D2F}']
    procedure setScene(scene: SCNScene); cdecl;
    function scene: SCNScene; cdecl;
    procedure presentScene(scene: SCNScene; withTransition: SKTransition;
      incomingPointOfView: SCNNode;
      completionHandler: TSceneKitCompletionHandler); cdecl;
    procedure setSceneTime(sceneTime: NSTimeInterval); cdecl;
    function sceneTime: NSTimeInterval; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function hitTest(point: CGPoint; options: NSDictionary): NSArray; cdecl;
    function isNodeInsideFrustum(node: SCNNode; withPointOfView: SCNNode)
      : Boolean; cdecl;
    function nodesInsideFrustumWithPointOfView(pointOfView: SCNNode)
      : NSArray; cdecl;
    function projectPoint(point: SCNVector3): SCNVector3; cdecl;
    function unprojectPoint(point: SCNVector3): SCNVector3; cdecl;
    procedure setPlaying(playing: Boolean); cdecl;
    function isPlaying: Boolean; cdecl;
    procedure setLoops(loops: Boolean); cdecl;
    function loops: Boolean; cdecl;
    procedure setPointOfView(pointOfView: SCNNode); cdecl;
    function pointOfView: SCNNode; cdecl;
    procedure setAutoenablesDefaultLighting(autoenablesDefaultLighting
      : Boolean); cdecl;
    function autoenablesDefaultLighting: Boolean; cdecl;
    procedure setJitteringEnabled(jitteringEnabled: Boolean); cdecl;
    function isJitteringEnabled: Boolean; cdecl;
    procedure setTemporalAntialiasingEnabled(temporalAntialiasingEnabled
      : Boolean); cdecl;
    function isTemporalAntialiasingEnabled: Boolean; cdecl;
    function prepareObject(&object: Pointer;
      shouldAbortBlock: TSceneKitShouldAbortBlock): Boolean; cdecl;
    procedure prepareObjects(objects: NSArray;
      withCompletionHandler: TSceneKitWithCompletionHandler); cdecl;
    procedure setShowsStatistics(showsStatistics: Boolean); cdecl;
    function showsStatistics: Boolean; cdecl;
    procedure setDebugOptions(debugOptions: SCNDebugOptions); cdecl;
    function debugOptions: SCNDebugOptions; cdecl;
    procedure setOverlaySKScene(overlaySKScene: SKScene); cdecl;
    function overlaySKScene: SKScene; cdecl;
    function renderingAPI: SCNRenderingAPI; cdecl;
    function context: Pointer; cdecl;
    function currentRenderCommandEncoder: Pointer; cdecl;
    function currentRenderPassDescriptor: MTLRenderPassDescriptor; cdecl;
    function device: Pointer; cdecl;
    function colorPixelFormat: MTLPixelFormat; cdecl;
    function depthPixelFormat: MTLPixelFormat; cdecl;
    function stencilPixelFormat: MTLPixelFormat; cdecl;
    function commandQueue: Pointer; cdecl;
    function audioEngine: AVAudioEngine; cdecl;
    function audioEnvironmentNode: AVAudioEnvironmentNode; cdecl;
    procedure setAudioListener(audioListener: SCNNode); cdecl;
    function audioListener: SCNNode; cdecl;
    function currentViewport: CGRect; cdecl;
    procedure setUsesReverseZ(usesReverseZ: Boolean); cdecl;
    function usesReverseZ: Boolean; cdecl;
  end;

  SCNCameraControlConfiguration = interface(IObjectiveC)
    ['{842A0C49-D75E-46B8-ADAB-8B5606860B5A}']
    procedure setAutoSwitchToFreeCamera(autoSwitchToFreeCamera: Boolean); cdecl;
    function autoSwitchToFreeCamera: Boolean; cdecl;
    procedure setAllowsTranslation(allowsTranslation: Boolean); cdecl;
    function allowsTranslation: Boolean; cdecl;
    procedure setFlyModeVelocity(flyModeVelocity: CGFloat); cdecl;
    function flyModeVelocity: CGFloat; cdecl;
    procedure setPanSensitivity(panSensitivity: CGFloat); cdecl;
    function panSensitivity: CGFloat; cdecl;
    procedure setTruckSensitivity(truckSensitivity: CGFloat); cdecl;
    function truckSensitivity: CGFloat; cdecl;
    procedure setRotationSensitivity(rotationSensitivity: CGFloat); cdecl;
    function rotationSensitivity: CGFloat; cdecl;
  end;

  SCNAvoidOccluderConstraintDelegate = interface(IObjectiveC)
    ['{4CC7B4BB-A20B-4B6F-AC3B-1479127A2785}']
    [MethodName('avoidOccluderConstraint:shouldAvoidOccluder:forNode:')]
    function avoidOccluderConstraintShouldAvoidOccluderForNode
      (constraint: SCNAvoidOccluderConstraint; shouldAvoidOccluder: SCNNode;
      forNode: SCNNode): Boolean; cdecl;
    [MethodName('avoidOccluderConstraint:didAvoidOccluder:forNode:')]
    procedure avoidOccluderConstraintDidAvoidOccluderForNode
      (constraint: SCNAvoidOccluderConstraint; didAvoidOccluder: SCNNode;
      forNode: SCNNode); cdecl;
  end;

  SCNPhysicsContactDelegate = interface(IObjectiveC)
    ['{29F4E980-55AC-4444-BE60-223FF18F0FE8}']
    [MethodName('physicsWorld:didBeginContact:')]
    procedure physicsWorldDidBeginContact(world: SCNPhysicsWorld;
      didBeginContact: SCNPhysicsContact); cdecl;
    [MethodName('physicsWorld:didUpdateContact:')]
    procedure physicsWorldDidUpdateContact(world: SCNPhysicsWorld;
      didUpdateContact: SCNPhysicsContact); cdecl;
    [MethodName('physicsWorld:didEndContact:')]
    procedure physicsWorldDidEndContact(world: SCNPhysicsWorld;
      didEndContact: SCNPhysicsContact); cdecl;
  end;

  SCNCameraControllerDelegate = interface(IObjectiveC)
    ['{0A1B434F-E15E-4C35-BAE5-52ACEB5FEE1B}']
    procedure cameraInertiaWillStartForController(cameraController
      : SCNCameraController); cdecl;
    procedure cameraInertiaDidEndForController(cameraController
      : SCNCameraController); cdecl;
  end;

  // ===== Exported string consts =====

function SCNVector3Zero: Pointer;
function SCNVector4Zero: Pointer;
function SCNMatrix4Identity: Pointer;
function SCNErrorDomain: NSString;
function SCNModelTransform: NSString;
function SCNViewTransform: NSString;
function SCNProjectionTransform: NSString;
function SCNNormalTransform: NSString;
function SCNModelViewTransform: NSString;
function SCNModelViewProjectionTransform: NSString;
function SCNSceneSourceAssetContributorsKey: NSString;
function SCNSceneSourceAssetCreatedDateKey: NSString;
function SCNSceneSourceAssetModifiedDateKey: NSString;
function SCNSceneSourceAssetUpAxisKey: NSString;
function SCNSceneSourceAssetUnitKey: NSString;
function SCNSceneSourceAssetAuthoringToolKey: NSString;
function SCNSceneSourceAssetAuthorKey: NSString;
function SCNSceneSourceAssetUnitNameKey: NSString;
function SCNSceneSourceAssetUnitMeterKey: NSString;
function SCNSceneSourceCreateNormalsIfAbsentKey: Pointer;
function SCNSceneSourceCheckConsistencyKey: Pointer;
function SCNSceneSourceFlattenSceneKey: Pointer;
function SCNSceneSourceUseSafeModeKey: Pointer;
function SCNSceneSourceAssetDirectoryURLsKey: Pointer;
function SCNSceneSourceOverrideAssetURLsKey: Pointer;
function SCNSceneSourceStrictConformanceKey: Pointer;
function SCNSceneSourceConvertUnitsToMetersKey: Pointer;
function SCNSceneSourceConvertToYUpKey: Pointer;
function SCNSceneSourceAnimationImportPolicyKey: Pointer;
function SCNSceneSourceLoadingOptionPreserveOriginalTopology: Pointer;
function SCNSceneSourceAnimationImportPolicyPlay: Pointer;
function SCNSceneSourceAnimationImportPolicyPlayRepeatedly: Pointer;
function SCNSceneSourceAnimationImportPolicyDoNotPlay: Pointer;
function SCNSceneSourceAnimationImportPolicyPlayUsingSceneTimeBase: Pointer;
function SCNDetailedErrorsKey: NSString;
function SCNConsistencyElementIDErrorKey: NSString;
function SCNConsistencyElementTypeErrorKey: NSString;
function SCNConsistencyLineNumberErrorKey: NSString;
function SCNSceneExportDestinationURL: NSString;
function SCNSceneStartTimeAttributeKey: Pointer;
function SCNSceneEndTimeAttributeKey: Pointer;
function SCNSceneFrameRateAttributeKey: Pointer;
function SCNSceneUpAxisAttributeKey: Pointer;
function SCNProgramMappingChannelKey: NSString;
function SCNShaderModifierEntryPointGeometry: Pointer;
function SCNShaderModifierEntryPointSurface: Pointer;
function SCNShaderModifierEntryPointLightingModel: Pointer;
function SCNShaderModifierEntryPointFragment: Pointer;
function SCNLightTypeAmbient: Pointer;
function SCNLightTypeOmni: Pointer;
function SCNLightTypeDirectional: Pointer;
function SCNLightTypeSpot: Pointer;
function SCNLightTypeIES: Pointer;
function SCNLightTypeProbe: Pointer;
function SCNLightTypeArea: Pointer;
function SCNGeometrySourceSemanticVertex: Pointer;
function SCNGeometrySourceSemanticNormal: Pointer;
function SCNGeometrySourceSemanticColor: Pointer;
function SCNGeometrySourceSemanticTexcoord: Pointer;
function SCNGeometrySourceSemanticTangent: Pointer;
function SCNGeometrySourceSemanticVertexCrease: Pointer;
function SCNGeometrySourceSemanticEdgeCrease: Pointer;
function SCNGeometrySourceSemanticBoneWeights: Pointer;
function SCNGeometrySourceSemanticBoneIndices: Pointer;
function SCNLightingModelPhong: Pointer;
function SCNLightingModelBlinn: Pointer;
function SCNLightingModelLambert: Pointer;
function SCNLightingModelConstant: Pointer;
function SCNLightingModelPhysicallyBased: Pointer;
function SCNLightingModelShadowOnly: Pointer;
function SCNHitTestClipToZRangeKey: Pointer;
function SCNHitTestBackFaceCullingKey: Pointer;
function SCNHitTestBoundingBoxOnlyKey: Pointer;
function SCNHitTestIgnoreChildNodesKey: Pointer;
function SCNHitTestRootNodeKey: Pointer;
function SCNHitTestIgnoreHiddenNodesKey: Pointer;
function SCNHitTestOptionCategoryBitMask: Pointer;
function SCNHitTestOptionSearchMode: Pointer;
function SCNHitTestOptionIgnoreLightArea: Pointer;
function SCNHitTestFirstFoundOnlyKey: Pointer;
function SCNHitTestSortResultsKey: Pointer;
function SCNPreferredRenderingAPIKey: Pointer;
function SCNPreferredDeviceKey: Pointer;
function SCNPreferLowPowerDeviceKey: Pointer;
function SCNParticlePropertyPosition: Pointer;
function SCNParticlePropertyAngle: Pointer;
function SCNParticlePropertyRotationAxis: Pointer;
function SCNParticlePropertyVelocity: Pointer;
function SCNParticlePropertyAngularVelocity: Pointer;
function SCNParticlePropertyLife: Pointer;
function SCNParticlePropertyColor: Pointer;
function SCNParticlePropertyOpacity: Pointer;
function SCNParticlePropertySize: Pointer;
function SCNParticlePropertyFrame: Pointer;
function SCNParticlePropertyFrameRate: Pointer;
function SCNParticlePropertyBounce: Pointer;
function SCNParticlePropertyCharge: Pointer;
function SCNParticlePropertyFriction: Pointer;
function SCNParticlePropertyContactPoint: Pointer;
function SCNParticlePropertyContactNormal: Pointer;
function SCNPhysicsShapeTypeKey: Pointer;
function SCNPhysicsShapeKeepAsCompoundKey: Pointer;
function SCNPhysicsShapeScaleKey: Pointer;
function SCNPhysicsShapeOptionCollisionMargin: Pointer;
function SCNPhysicsShapeTypeBoundingBox: Pointer;
function SCNPhysicsShapeTypeConvexHull: Pointer;
function SCNPhysicsShapeTypeConcavePolyhedron: Pointer;
function SCNPhysicsTestCollisionBitMaskKey: Pointer;
function SCNPhysicsTestSearchModeKey: Pointer;
function SCNPhysicsTestBackfaceCullingKey: Pointer;
function SCNPhysicsTestSearchModeAny: Pointer;
function SCNPhysicsTestSearchModeClosest: Pointer;
function SCNPhysicsTestSearchModeAll: Pointer;


// ===== External functions =====

const
  libSceneKit = '/System/Library/Frameworks/SceneKit.framework/SceneKit';
function SCNVector3EqualToVector3(a: SCNVector3; b: SCNVector3): Integer; cdecl;
  external libSceneKit name _PU + 'SCNVector3EqualToVector3';
function SCNVector4EqualToVector4(a: SCNVector4; b: SCNVector4): Integer; cdecl;
  external libSceneKit name _PU + 'SCNVector4EqualToVector4';
function SCNVector3Make(x: Single; y: Single; z: Single): SCNVector3; cdecl;
  external libSceneKit name _PU + 'SCNVector3Make';
function SCNVector4Make(x: Single; y: Single; z: Single; w: Single): SCNVector4;
  cdecl; external libSceneKit name _PU + 'SCNVector4Make';
function SCNMatrix4IsIdentity(m: SCNMatrix4): Integer; cdecl;
  external libSceneKit name _PU + 'SCNMatrix4IsIdentity';
function SCNMatrix4EqualToMatrix4(a: SCNMatrix4; b: SCNMatrix4): Integer; cdecl;
  external libSceneKit name _PU + 'SCNMatrix4EqualToMatrix4';
function SCNMatrix4MakeTranslation(tx: Single; ty: Single; tz: Single)
  : SCNMatrix4; cdecl; external libSceneKit name _PU +
  'SCNMatrix4MakeTranslation';
function SCNMatrix4MakeScale(sx: Single; sy: Single; sz: Single): SCNMatrix4;
  cdecl; external libSceneKit name _PU + 'SCNMatrix4MakeScale';
function SCNMatrix4MakeRotation(angle: Single; x: Single; y: Single; z: Single)
  : SCNMatrix4; cdecl; external libSceneKit name _PU + 'SCNMatrix4MakeRotation';
function SCNMatrix4Translate(m: SCNMatrix4; tx: Single; ty: Single; tz: Single)
  : SCNMatrix4; cdecl; external libSceneKit name _PU + 'SCNMatrix4Translate';
function SCNMatrix4Scale(m: SCNMatrix4; sx: Single; sy: Single; sz: Single)
  : SCNMatrix4; cdecl; external libSceneKit name _PU + 'SCNMatrix4Scale';
function SCNMatrix4Rotate(m: SCNMatrix4; angle: Single; x: Single; y: Single;
  z: Single): SCNMatrix4; cdecl;
  external libSceneKit name _PU + 'SCNMatrix4Rotate';
function SCNMatrix4Invert(m: SCNMatrix4): SCNMatrix4; cdecl;
  external libSceneKit name _PU + 'SCNMatrix4Invert';
function SCNMatrix4Mult(a: SCNMatrix4; b: SCNMatrix4): SCNMatrix4; cdecl;
  external libSceneKit name _PU + 'SCNMatrix4Mult';
function SCNVector3FromGLKVector3(vector: GLKVector3): SCNVector3; cdecl;
  external libSceneKit name _PU + 'SCNVector3FromGLKVector3';
function SCNVector3ToGLKVector3(vector: SCNVector3): GLKVector3; cdecl;
  external libSceneKit name _PU + 'SCNVector3ToGLKVector3';
function SCNVector4FromGLKVector4(vector: GLKVector4): SCNVector4; cdecl;
  external libSceneKit name _PU + 'SCNVector4FromGLKVector4';
function SCNVector4ToGLKVector4(vector: SCNVector4): GLKVector4; cdecl;
  external libSceneKit name _PU + 'SCNVector4ToGLKVector4';
function SCNMatrix4ToGLKMatrix4(mat: SCNMatrix4): GLKMatrix4; cdecl;
  external libSceneKit name _PU + 'SCNMatrix4ToGLKMatrix4';
function SCNMatrix4FromGLKMatrix4(mat: GLKMatrix4): SCNMatrix4; cdecl;
  external libSceneKit name _PU + 'SCNMatrix4FromGLKMatrix4';
function SCNVector3ToFloat3(v: SCNVector3): simd_float3; cdecl;
  external libSceneKit name _PU + 'SCNVector3ToFloat3';
function SCNVector4ToFloat4(v: SCNVector4): simd_float4; cdecl;
  external libSceneKit name _PU + 'SCNVector4ToFloat4';
function SCNMatrix4ToMat4(m: SCNMatrix4): simd_float4x4; cdecl;
  external libSceneKit name _PU + 'SCNMatrix4ToMat4';
function SCNVector3FromFloat3(v: simd_float3): SCNVector3; cdecl;
  external libSceneKit name _PU + 'SCNVector3FromFloat3';
function SCNVector4FromFloat4(v: simd_float4): SCNVector4; cdecl;
  external libSceneKit name _PU + 'SCNVector4FromFloat4';
function SCNMatrix4FromMat4(m: simd_float4x4): SCNMatrix4; cdecl;
  external libSceneKit name _PU + 'SCNMatrix4FromMat4';
procedure SCNExportJavaScriptModule(context: Pointer { JSContext } ); cdecl;
  external libSceneKit name _PU + 'SCNExportJavaScriptModule';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  SceneKitModule: THandle;

{$ENDIF IOS}

function SCNErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNErrorDomain');
end;

function SCNModelTransform: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNModelTransform');
end;

function SCNViewTransform: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNViewTransform');
end;

function SCNProjectionTransform: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNProjectionTransform');
end;

function SCNNormalTransform: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNNormalTransform');
end;

function SCNModelViewTransform: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNModelViewTransform');
end;

function SCNModelViewProjectionTransform: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNModelViewProjectionTransform');
end;

function SCNSceneSourceAssetContributorsKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceAssetContributorsKey');
end;

function SCNSceneSourceAssetCreatedDateKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceAssetCreatedDateKey');
end;

function SCNSceneSourceAssetModifiedDateKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceAssetModifiedDateKey');
end;

function SCNSceneSourceAssetUpAxisKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneSourceAssetUpAxisKey');
end;

function SCNSceneSourceAssetUnitKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneSourceAssetUnitKey');
end;

function SCNSceneSourceAssetAuthoringToolKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceAssetAuthoringToolKey');
end;

function SCNSceneSourceAssetAuthorKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneSourceAssetAuthorKey');
end;

function SCNSceneSourceAssetUnitNameKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneSourceAssetUnitNameKey');
end;

function SCNSceneSourceAssetUnitMeterKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneSourceAssetUnitMeterKey');
end;

function SCNDetailedErrorsKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNDetailedErrorsKey');
end;

function SCNConsistencyElementIDErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNConsistencyElementIDErrorKey');
end;

function SCNConsistencyElementTypeErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNConsistencyElementTypeErrorKey');
end;

function SCNConsistencyLineNumberErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNConsistencyLineNumberErrorKey');
end;

function SCNSceneExportDestinationURL: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneExportDestinationURL');
end;

function SCNProgramMappingChannelKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNProgramMappingChannelKey');
end;

function SCNVector3Zero: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNVector3Zero');
end;

function SCNVector4Zero: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNVector4Zero');
end;

function SCNMatrix4Identity: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNMatrix4Identity');
end;

function SCNSceneSourceCreateNormalsIfAbsentKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNSceneSourceCreateNormalsIfAbsentKey');
end;

function SCNSceneSourceCheckConsistencyKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNSceneSourceCheckConsistencyKey');
end;

function SCNSceneSourceFlattenSceneKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNSceneSourceFlattenSceneKey');
end;

function SCNSceneSourceUseSafeModeKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNSceneSourceUseSafeModeKey');
end;

function SCNSceneSourceAssetDirectoryURLsKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNSceneSourceAssetDirectoryURLsKey');
end;

function SCNSceneSourceOverrideAssetURLsKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNSceneSourceOverrideAssetURLsKey');
end;

function SCNSceneSourceStrictConformanceKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNSceneSourceStrictConformanceKey');
end;

function SCNSceneSourceConvertUnitsToMetersKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNSceneSourceConvertUnitsToMetersKey');
end;

function SCNSceneSourceConvertToYUpKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNSceneSourceConvertToYUpKey');
end;

function SCNSceneSourceAnimationImportPolicyKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNSceneSourceAnimationImportPolicyKey');
end;

function SCNSceneSourceLoadingOptionPreserveOriginalTopology: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNSceneSourceLoadingOptionPreserveOriginalTopology');
end;

function SCNSceneSourceAnimationImportPolicyPlay: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNSceneSourceAnimationImportPolicyPlay');
end;

function SCNSceneSourceAnimationImportPolicyPlayRepeatedly: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNSceneSourceAnimationImportPolicyPlayRepeatedly');
end;

function SCNSceneSourceAnimationImportPolicyDoNotPlay: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNSceneSourceAnimationImportPolicyDoNotPlay');
end;

function SCNSceneSourceAnimationImportPolicyPlayUsingSceneTimeBase: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNSceneSourceAnimationImportPolicyPlayUsingSceneTimeBase');
end;

function SCNSceneStartTimeAttributeKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNSceneStartTimeAttributeKey');
end;

function SCNSceneEndTimeAttributeKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNSceneEndTimeAttributeKey');
end;

function SCNSceneFrameRateAttributeKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNSceneFrameRateAttributeKey');
end;

function SCNSceneUpAxisAttributeKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNSceneUpAxisAttributeKey');
end;

function SCNShaderModifierEntryPointGeometry: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNShaderModifierEntryPointGeometry');
end;

function SCNShaderModifierEntryPointSurface: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNShaderModifierEntryPointSurface');
end;

function SCNShaderModifierEntryPointLightingModel: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNShaderModifierEntryPointLightingModel');
end;

function SCNShaderModifierEntryPointFragment: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNShaderModifierEntryPointFragment');
end;

function SCNLightTypeAmbient: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNLightTypeAmbient');
end;

function SCNLightTypeOmni: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNLightTypeOmni');
end;

function SCNLightTypeDirectional: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNLightTypeDirectional');
end;

function SCNLightTypeSpot: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNLightTypeSpot');
end;

function SCNLightTypeIES: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNLightTypeIES');
end;

function SCNLightTypeProbe: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNLightTypeProbe');
end;

function SCNLightTypeArea: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNLightTypeArea');
end;

function SCNGeometrySourceSemanticVertex: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNGeometrySourceSemanticVertex');
end;

function SCNGeometrySourceSemanticNormal: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNGeometrySourceSemanticNormal');
end;

function SCNGeometrySourceSemanticColor: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNGeometrySourceSemanticColor');
end;

function SCNGeometrySourceSemanticTexcoord: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNGeometrySourceSemanticTexcoord');
end;

function SCNGeometrySourceSemanticTangent: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNGeometrySourceSemanticTangent');
end;

function SCNGeometrySourceSemanticVertexCrease: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNGeometrySourceSemanticVertexCrease');
end;

function SCNGeometrySourceSemanticEdgeCrease: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNGeometrySourceSemanticEdgeCrease');
end;

function SCNGeometrySourceSemanticBoneWeights: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNGeometrySourceSemanticBoneWeights');
end;

function SCNGeometrySourceSemanticBoneIndices: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNGeometrySourceSemanticBoneIndices');
end;

function SCNLightingModelPhong: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNLightingModelPhong');
end;

function SCNLightingModelBlinn: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNLightingModelBlinn');
end;

function SCNLightingModelLambert: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNLightingModelLambert');
end;

function SCNLightingModelConstant: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNLightingModelConstant');
end;

function SCNLightingModelPhysicallyBased: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNLightingModelPhysicallyBased');
end;

function SCNLightingModelShadowOnly: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNLightingModelShadowOnly');
end;

function SCNHitTestClipToZRangeKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNHitTestClipToZRangeKey');
end;

function SCNHitTestBackFaceCullingKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNHitTestBackFaceCullingKey');
end;

function SCNHitTestBoundingBoxOnlyKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNHitTestBoundingBoxOnlyKey');
end;

function SCNHitTestIgnoreChildNodesKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNHitTestIgnoreChildNodesKey');
end;

function SCNHitTestRootNodeKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNHitTestRootNodeKey');
end;

function SCNHitTestIgnoreHiddenNodesKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNHitTestIgnoreHiddenNodesKey');
end;

function SCNHitTestOptionCategoryBitMask: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNHitTestOptionCategoryBitMask');
end;

function SCNHitTestOptionSearchMode: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNHitTestOptionSearchMode');
end;

function SCNHitTestOptionIgnoreLightArea: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNHitTestOptionIgnoreLightArea');
end;

function SCNHitTestFirstFoundOnlyKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNHitTestFirstFoundOnlyKey');
end;

function SCNHitTestSortResultsKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNHitTestSortResultsKey');
end;

function SCNPreferredRenderingAPIKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPreferredRenderingAPIKey');
end;

function SCNPreferredDeviceKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPreferredDeviceKey');
end;

function SCNPreferLowPowerDeviceKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPreferLowPowerDeviceKey');
end;

function SCNParticlePropertyPosition: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyPosition');
end;

function SCNParticlePropertyAngle: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyAngle');
end;

function SCNParticlePropertyRotationAxis: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyRotationAxis');
end;

function SCNParticlePropertyVelocity: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyVelocity');
end;

function SCNParticlePropertyAngularVelocity: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNParticlePropertyAngularVelocity');
end;

function SCNParticlePropertyLife: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyLife');
end;

function SCNParticlePropertyColor: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyColor');
end;

function SCNParticlePropertyOpacity: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyOpacity');
end;

function SCNParticlePropertySize: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertySize');
end;

function SCNParticlePropertyFrame: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyFrame');
end;

function SCNParticlePropertyFrameRate: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyFrameRate');
end;

function SCNParticlePropertyBounce: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyBounce');
end;

function SCNParticlePropertyCharge: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyCharge');
end;

function SCNParticlePropertyFriction: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyFriction');
end;

function SCNParticlePropertyContactPoint: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyContactPoint');
end;

function SCNParticlePropertyContactNormal: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNParticlePropertyContactNormal');
end;

function SCNPhysicsShapeTypeKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPhysicsShapeTypeKey');
end;

function SCNPhysicsShapeKeepAsCompoundKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPhysicsShapeKeepAsCompoundKey');
end;

function SCNPhysicsShapeScaleKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPhysicsShapeScaleKey');
end;

function SCNPhysicsShapeOptionCollisionMargin: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNPhysicsShapeOptionCollisionMargin');
end;

function SCNPhysicsShapeTypeBoundingBox: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPhysicsShapeTypeBoundingBox');
end;

function SCNPhysicsShapeTypeConvexHull: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPhysicsShapeTypeConvexHull');
end;

function SCNPhysicsShapeTypeConcavePolyhedron: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit,
    'SCNPhysicsShapeTypeConcavePolyhedron');
end;

function SCNPhysicsTestCollisionBitMaskKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPhysicsTestCollisionBitMaskKey');
end;

function SCNPhysicsTestSearchModeKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPhysicsTestSearchModeKey');
end;

function SCNPhysicsTestBackfaceCullingKey: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPhysicsTestBackfaceCullingKey');
end;

function SCNPhysicsTestSearchModeAny: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPhysicsTestSearchModeAny');
end;

function SCNPhysicsTestSearchModeClosest: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPhysicsTestSearchModeClosest');
end;

function SCNPhysicsTestSearchModeAll: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNPhysicsTestSearchModeAll');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

SceneKitModule := dlopen(MarshaledAString(libSceneKit), RTLD_LAZY);

finalization

dlclose(SceneKitModule);
{$ENDIF IOS}

end.
