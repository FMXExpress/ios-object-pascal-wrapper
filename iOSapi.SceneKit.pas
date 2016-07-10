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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.Foundation,
  iOSapi.GLKit,
  iOSapi.JavaScriptCore,
  iOSapi.Metal,
  iOSapi.OpenGLES,
  iOSapi.QuartzCore,
  iOSapi.UIKit;

const
  SCNProgramCompilationError = 1;
  SCNRenderingAPIMetal = 0;
  SCNRenderingAPIOpenGLES2 = 1;
  SCNDebugOptionNone = 0;
  SCNDebugOptionShowPhysicsShapes = 1 shl 0;
  SCNDebugOptionShowBoundingBoxes = 1 shl 1;
  SCNDebugOptionShowLightInfluences = 1 shl 2;
  SCNDebugOptionShowLightExtents = 1 shl 3;
  SCNDebugOptionShowPhysicsFields = 1 shl 4;
  SCNDebugOptionShowWireframe = 1 shl 5;
  SCNBufferFrequencyPerFrame = 0;
  SCNBufferFrequencyPerNode = 1;
  SCNBufferFrequencyPerShadable = 2;
  SCNAntialiasingModeNone = 0;
  SCNAntialiasingModeMultisampling2X = 1;
  SCNAntialiasingModeMultisampling4X = 2;
  SCNFilterModeNone = 0;
  SCNFilterModeNearest = 1;
  SCNFilterModeLinear = 2;
  SCNWrapModeClamp = 1;
  SCNWrapModeRepeat = 2;
  SCNWrapModeClampToBorder = 3;
  SCNWrapModeMirror = 4;
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
  SCNActionTimingModeLinear = 0;
  SCNActionTimingModeEaseIn = 1;
  SCNActionTimingModeEaseOut = 2;
  SCNActionTimingModeEaseInEaseOut = 3;
  SCNShadowModeForward = 0;
  SCNShadowModeDeferred = 1;
  SCNShadowModeModulated = 2;
  SCNCullBack = 0;
  SCNCullFront = 1;
  SCNTransparencyModeAOne = 0;
  SCNTransparencyModeRGBZero = 1;
  SCNBlendModeAlpha = 0;
  SCNBlendModeAdd = 1;
  SCNBlendModeSubtract = 2;
  SCNBlendModeMultiply = 3;
  SCNBlendModeScreen = 4;
  SCNBlendModeReplace = 5;
  SCNGeometryPrimitiveTypeTriangles = 0;
  SCNGeometryPrimitiveTypeTriangleStrip = 1;
  SCNGeometryPrimitiveTypeLine = 2;
  SCNGeometryPrimitiveTypePoint = 3;
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

type

  // ===== Forward declarations =====
{$M+}
  SceneKitAdditions = interface;
  SCNAnimationEvent = interface;
  SCNAnimatable = interface;
  SCNBoundingVolume = interface;
  SCNScene = interface;
  SCNNode = interface;
  SCNSceneRendererDelegate = interface;
  SCNHitTestResult = interface;
  SCNSceneRenderer = interface;
  SCNMaterial = interface;
  SCNRenderer = interface;
  SCNProgram = interface;
  SCNProgramDelegate = interface;
  SCNShadable = interface;
  SCNBufferStream = interface;
  SCNTechnique = interface;
  SCNTechniqueSupport = interface;
  SCNView = interface;
  SCNMaterialProperty = interface;
  SCNPhysicsWorld = interface;
  SCNSceneExportDelegate = interface;
  SCNSceneSource = interface;
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
  SCNNodeRendererDelegate = interface;
  SCNGeometrySource = interface;
  SCNGeometryElement = interface;
  SCNLevelOfDetail = interface;
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
  SCNParticlePropertyController = interface;
  SCNParticleSystem = interface;
  SCNPhysicsShape = interface;
  SCNPhysicsContact = interface;
  SCNPhysicsBehavior = interface;
  SCNPhysicsContactDelegate = interface;
  SCNPhysicsHingeJoint = interface;
  SCNPhysicsBallSocketJoint = interface;
  SCNPhysicsSliderJoint = interface;
  SCNPhysicsVehicleWheel = interface;
  SCNPhysicsVehicle = interface;
  SCNReferenceNode = interface;
  SCNAudioPlayer = interface;

  // ===== Framework typedefs =====
{$M+}

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

  SCNQuaternion = SCNVector4;

  GLKVector3 = case Integer of 0: (x: Single; y: Single; z: Single;);
1:
(r: Single; g: Single; b: Single;);
2:
(s: Single; t: Single; p: Single;);
3:
(v: array [0 .. 2] of Single);;
GLKVector4 =
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
  ;
  GLKMatrix4 = case Integer of 0:
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
  ;
  vector_float3 = - - < Type :
    : ExtVector >;
  vector_float4 = - - < Type :
    : ExtVector >;
  matrix_float4x4 = record columns:
    array [0 .. 3] of vector_float4;
end;;
SCNAnimationEventBlock =
procedure(param1: CAAnimation; param2: Pointer; param3: Boolean) of object;
CGFloat = Single;
NSUInteger = Cardinal;
SCNRenderingAPI = NSUInteger;
SCNDebugOptions = NSUInteger;
NSInteger = Integer;
CGPoint = CGPoint = record x: CGFloat;
y:
CGFloat;
end;
PCGPoint = ^CGPoint;;
TSceneKitCompletionHandler =
procedure() of object;
NSTimeInterval = Double;
TSceneKitShouldAbortBlock =
function(): Boolean;
cdecl;
TSceneKitWithCompletionHandler =
procedure(param1: Boolean) of object;
MTLPixelFormat = NSUInteger;
SCNBufferFrequency = NSInteger;
SCNBufferBindingBlock =
procedure(param1: Pointer; param2: SCNNode; param3: Pointer;
  param4: SCNRenderer) of object;
SCNBindingBlock =
procedure(param1: Cardinal; param2: Cardinal; param3: SCNNode;
  param4: SCNRenderer) of object;
SCNAntialiasingMode = NSUInteger;
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
CFTimeInterval = Double;
SCNFilterMode = NSInteger;
SCNWrapMode = NSInteger;
SCNSceneExportProgressHandler =
procedure(param1: Single; param2: NSError; param3: PBoolean) of object;
SCNSceneSourceStatus = NSInteger;
SCNSceneSourceStatusHandler =
procedure(param1: Single; param2: SCNSceneSourceStatus; param3: NSError;
  param4: PBoolean) of object;
TSceneKitPredicate =
function(param1: Pointer; param2: NSString; param3: PBoolean): Boolean;
cdecl;
SCNActionTimingMode = NSInteger;
SCNActionTimingFunction =
function(param1: Single): Single;
cdecl;
TSceneKitBlock =
procedure(param1: SCNNode) of object;
dispatch_queue_t = Pointer;
TSceneKitActionBlock =
procedure(param1: SCNNode; param2: CGFloat) of object;
TSceneKitPredicate1 =
function(param1: SCNNode; param2: PBoolean): Boolean;
cdecl;
TSceneKitBlock1 =
procedure(param1: SCNNode; param2: PBoolean) of object;
SCNShadowMode = NSInteger;
SCNCullMode = NSInteger;
SCNTransparencyMode = NSInteger;
SCNBlendMode = NSInteger;
SCNGeometryPrimitiveType = NSInteger;
MTLVertexFormat = NSUInteger;
SCNChamferMode = NSInteger;
SCNMorpherCalculationMode = NSInteger;
SCNBillboardAxis = NSUInteger;
TSceneKitWithBlock =
function(param1: SCNNode; param2: SCNMatrix4): SCNMatrix4;
cdecl;
SCNParticleEventBlock =
procedure(param1: Pointer; param2: PLongWord; param3: PLongWord;
  param4: NSInteger) of object;
SCNParticleModifierBlock =
procedure(param1: Pointer; param2: PLongWord; param3: NSInteger;
  param4: NSInteger; param5: Single) of object;
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
SCNFieldForceEvaluator =
function(param1: SCNVector3; param2: SCNVector3; param3: Single; param4: Single;
  param5: NSTimeInterval): SCNVector3;
cdecl;
SCNReferenceLoadingPolicy = NSInteger;
// ===== Interface declarations =====

SceneKitAdditions = interface(IObjectiveC)
  ['{86898B6A-C30B-41BC-9F8C-A1FE412A78ED}']
function valueWithSCNVector3(v: SCNVector3): NSValue;
cdecl;

function valueWithSCNVector4(v: SCNVector4): NSValue; cdecl;
  function valueWithSCNMatrix4(v: SCNMatrix4): NSValue; cdecl;
    function SCNVector3Value: SCNVector3; cdecl;
      function SCNVector4Value: SCNVector4; cdecl;
        function SCNMatrix4Value: SCNMatrix4; cdecl;
          procedure setUsesSceneTimeBase(usesSceneTimeBase: Boolean); cdecl;
            function usesSceneTimeBase: Boolean; cdecl;
              procedure setFadeInDuration(fadeInDuration: CGFloat); cdecl;
                function fadeInDuration: CGFloat; cdecl;
                  procedure setFadeOutDuration(fadeOutDuration: CGFloat); cdecl;
                    function fadeOutDuration: CGFloat; cdecl;
                      procedure setAnimationEvents(animationEvents
                        : NSArray); cdecl;
                        function animationEvents: NSArray; cdecl;
                        end;

                    SCNAnimationEventClass = interface(NSObjectClass)
                      ['{650968AB-A272-4330-A33A-94E0C7740739}']
                    { class } function animationEventWithKeyTime(time: CGFloat;
                      block: SCNAnimationEventBlock): Pointer { instancetype };
                    cdecl;
                    end;
                SCNAnimationEvent = interface(NSObject)
                  ['{8F89F554-ACD3-411D-9E5F-DB37357C6A42}']
                end;

            TSCNAnimationEvent = class(TOCGenericImport<SCNAnimationEventClass,
              SCNAnimationEvent>)
            end;
        PSCNAnimationEvent = Pointer;

        SCNSceneClass = interface(NSObjectClass)
          ['{6EA10B29-E3BE-4DF6-8AFB-A0A4C37C8C9F}']
        { class } function scene: Pointer { instancetype };
        cdecl;
        [MethodName('sceneNamed:')]
        { class } function sceneNamed(name: NSString)
            : Pointer { instancetype }; cdecl;
          [MethodName('sceneNamed:inDirectory:options:')]
          { class } function sceneNamedInDirectoryOptions(name: NSString;
              inDirectory: NSString; options: NSDictionary)
              : Pointer { instancetype }; cdecl;
            { class } function sceneWithURL(url: NSURL; options: NSDictionary;
                error: NSError): Pointer { instancetype }; cdecl;
              end;
          SCNScene = interface(NSObject)
            ['{3DCA0BBD-196B-4FA2-BC90-291E516DC94F}']
          function rootNode: SCNNode;
          cdecl;
            function physicsWorld: SCNPhysicsWorld; cdecl;
              function attributeForKey(key: NSString): Pointer; cdecl;
                procedure setAttribute(attribute: Pointer;
                  forKey: NSString); cdecl;
                  function background: SCNMaterialProperty; cdecl;
                    procedure setFogStartDistance(fogStartDistance
                      : CGFloat); cdecl;
                      function fogStartDistance: CGFloat; cdecl;
                        procedure setFogEndDistance(fogEndDistance
                          : CGFloat); cdecl;
                          function fogEndDistance: CGFloat; cdecl;
                            procedure setFogDensityExponent(fogDensityExponent
                              : CGFloat); cdecl;
                              function fogDensityExponent: CGFloat; cdecl;
                                procedure setFogColor(fogColor: Pointer); cdecl;
                                  function fogColor: Pointer; cdecl;
                                    procedure setPaused(paused: Boolean); cdecl;
                                      function isPaused: Boolean; cdecl;
                                        procedure addParticleSystem
                                        (system: SCNParticleSystem;
                                        withTransform: SCNMatrix4); cdecl;
                                        procedure removeAllParticleSystems;
                                        cdecl;
                                        procedure removeParticleSystem
                                        (system: SCNParticleSystem); cdecl;
                                        function particleSystems
                                        : NSArray; cdecl;
                                        end;

                                        TSCNScene = class
                                        (TOCGenericImport<SCNSceneClass,
                                        SCNScene>)
                                        end;
                                      PSCNScene = Pointer;

                                      SCNNodeClass = interface(NSObjectClass)
                                        ['{12E10E43-F3B7-4096-8B6E-FDB101698E0D}']
                                      { class } function node
                                        : Pointer { instancetype };
                                      cdecl;
                                      { class } function nodeWithGeometry
                                        (geometry: SCNGeometry): SCNNode; cdecl;
                                        end;
                                    SCNNode = interface(NSObject)
                                      ['{E4E19A2A-DCC5-435C-93AE-5F4F2374889B}']
                                    function clone: Pointer { instancetype };
                                    cdecl;
                                      function flattenedClone
                                        : Pointer { instancetype }; cdecl;
                                        procedure setName
                                        (name: NSString); cdecl;
                                        function name: NSString; cdecl;
                                        procedure setLight
                                        (light: SCNLight); cdecl;
                                        function light: SCNLight; cdecl;
                                        procedure setCamera
                                        (camera: SCNCamera); cdecl;
                                        function camera: SCNCamera; cdecl;
                                        procedure setGeometry
                                        (geometry: SCNGeometry); cdecl;
                                        function geometry: SCNGeometry; cdecl;
                                        procedure setSkinner
                                        (skinner: SCNSkinner); cdecl;
                                        function skinner: SCNSkinner; cdecl;
                                        procedure setMorpher
                                        (morpher: SCNMorpher); cdecl;
                                        function morpher: SCNMorpher; cdecl;
                                        procedure setTransform
                                        (transform: SCNMatrix4); cdecl;
                                        function transform: SCNMatrix4; cdecl;
                                        procedure setPosition
                                        (position: SCNVector3); cdecl;
                                        function position: SCNVector3; cdecl;
                                        procedure setRotation
                                        (rotation: SCNVector4); cdecl;
                                        function rotation: SCNVector4; cdecl;
                                        procedure setOrientation
                                        (orientation: SCNQuaternion); cdecl;
                                        function orientation
                                        : SCNQuaternion; cdecl;
                                        procedure setEulerAngles
                                        (eulerAngles: SCNVector3); cdecl;
                                        function eulerAngles: SCNVector3; cdecl;
                                        procedure setScale
                                        (scale: SCNVector3); cdecl;
                                        function scale: SCNVector3; cdecl;
                                        procedure setPivot
                                        (pivot: SCNMatrix4); cdecl;
                                        function pivot: SCNMatrix4; cdecl;
                                        function worldTransform
                                        : SCNMatrix4; cdecl;
                                        procedure setHidden
                                        (hidden: Boolean); cdecl;
                                        function isHidden: Boolean; cdecl;
                                        procedure setOpacity
                                        (opacity: CGFloat); cdecl;
                                        function opacity: CGFloat; cdecl;
                                        procedure setRenderingOrder
                                        (renderingOrder: NSInteger); cdecl;
                                        function renderingOrder
                                        : NSInteger; cdecl;
                                        procedure setCastsShadow
                                        (castsShadow: Boolean); cdecl;
                                        function castsShadow: Boolean; cdecl;
                                        function parentNode: SCNNode; cdecl;
                                        function childNodes: NSArray; cdecl;
                                        procedure addChildNode
                                        (child: SCNNode); cdecl;
                                        procedure insertChildNode
                                        (child: SCNNode;
                                        atIndex: NSUInteger); cdecl;
                                        procedure removeFromParentNode; cdecl;
                                        procedure replaceChildNode
                                        (oldChild: SCNNode;
                                        &with: SCNNode); cdecl;
                                        function childNodeWithName
                                        (name: NSString; recursively: Boolean)
                                        : SCNNode; cdecl;
                                        function childNodesPassingTest
                                        (predicate: TSceneKitPredicate1)
                                        : NSArray; cdecl;
                                        procedure enumerateChildNodesUsingBlock
                                        (block: TSceneKitBlock1); cdecl;
                                        [MethodName('convertPosition:toNode:')]
                                        function convertPositionToNode
                                        (position: SCNVector3; toNode: SCNNode)
                                        : SCNVector3; cdecl;
                                        [MethodName
                                        ('convertPosition:fromNode:')]
                                        function convertPositionFromNode
                                        (position: SCNVector3;
                                        fromNode: SCNNode): SCNVector3; cdecl;
                                        [MethodName('convertTransform:toNode:')]
                                        function convertTransformToNode
                                        (transform: SCNMatrix4; toNode: SCNNode)
                                        : SCNMatrix4; cdecl;
                                        [MethodName
                                        ('convertTransform:fromNode:')]
                                        function convertTransformFromNode
                                        (transform: SCNMatrix4;
                                        fromNode: SCNNode): SCNMatrix4; cdecl;
                                        procedure setPhysicsBody
                                        (physicsBody: SCNPhysicsBody); cdecl;
                                        function physicsBody
                                        : SCNPhysicsBody; cdecl;
                                        procedure setPhysicsField
                                        (physicsField: SCNPhysicsField); cdecl;
                                        function physicsField
                                        : SCNPhysicsField; cdecl;
                                        procedure setConstraints
                                        (constraints: NSArray); cdecl;
                                        function constraints: NSArray; cdecl;
                                        procedure setFilters
                                        (filters: NSArray); cdecl;
                                        function filters: NSArray; cdecl;
                                        function presentationNode
                                        : SCNNode; cdecl;
                                        procedure setPaused
                                        (paused: Boolean); cdecl;
                                        function isPaused: Boolean; cdecl;
                                        procedure setRendererDelegate
                                        (rendererDelegate: Pointer); cdecl;
                                        function rendererDelegate
                                        : Pointer; cdecl;
                                        function hitTestWithSegmentFromPoint
                                        (pointA: SCNVector3;
                                        toPoint: SCNVector3;
                                        options: NSDictionary): NSArray; cdecl;
                                        procedure setCategoryBitMask
                                        (categoryBitMask: NSUInteger); cdecl;
                                        function categoryBitMask
                                        : NSUInteger; cdecl;
                                        procedure addParticleSystem
                                        (system: SCNParticleSystem); cdecl;
                                        procedure removeAllParticleSystems;
                                        cdecl;
                                        procedure removeParticleSystem
                                        (system: SCNParticleSystem); cdecl;
                                        function particleSystems
                                        : NSArray; cdecl;
                                        procedure addAudioPlayer
                                        (player: SCNAudioPlayer); cdecl;
                                        procedure removeAllAudioPlayers; cdecl;
                                        procedure removeAudioPlayer
                                        (player: SCNAudioPlayer); cdecl;
                                        function audioPlayers: NSArray; cdecl;
                                        end;

                                        TSCNNode = class
                                        (TOCGenericImport<
                                        SCNNodeClass, SCNNode>)
                                        end;
                                        PSCNNode = Pointer;

                                        SCNHitTestResultClass = interface
                                        (NSObjectClass)
                                        ['{6372AF4B-1B91-464B-A389-A1F851145C54}']
                                        end;
                                        SCNHitTestResult = interface(NSObject)
                                        ['{232A3202-8C3E-4B63-A5B3-645B0E8EEF3E}']
                                        function node: SCNNode;
                                        cdecl;
                                        function geometryIndex
                                        : NSInteger; cdecl;
                                        function faceIndex: NSInteger; cdecl;
                                        function localCoordinates
                                        : SCNVector3; cdecl;
                                        function worldCoordinates
                                        : SCNVector3; cdecl;
                                        function localNormal: SCNVector3; cdecl;
                                        function worldNormal: SCNVector3; cdecl;
                                        function modelTransform
                                        : SCNMatrix4; cdecl;
                                        function textureCoordinatesWithMappingChannel
                                        (channel: NSInteger): CGPoint; cdecl;
                                        end;

                                        TSCNHitTestResult = class
                                        (TOCGenericImport<SCNHitTestResultClass,
                                        SCNHitTestResult>)
                                        end;
                                        PSCNHitTestResult = Pointer;

                                        SCNMaterialClass = interface
                                        (NSObjectClass)
                                        ['{A6A09F8F-9E4E-4731-92E9-37272E1FAD8A}']
                                        { class } function material
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNMaterial = interface(NSObject)
                                        ['{CB1773C7-1D0D-4254-AE96-84300DD44009}']
                                        procedure setName(name: NSString);
                                        cdecl;
                                        function name: NSString; cdecl;
                                        function diffuse
                                        : SCNMaterialProperty; cdecl;
                                        function ambient
                                        : SCNMaterialProperty; cdecl;
                                        function specular
                                        : SCNMaterialProperty; cdecl;
                                        function emission
                                        : SCNMaterialProperty; cdecl;
                                        function transparent
                                        : SCNMaterialProperty; cdecl;
                                        function reflective
                                        : SCNMaterialProperty; cdecl;
                                        function multiply
                                        : SCNMaterialProperty; cdecl;
                                        function normal
                                        : SCNMaterialProperty; cdecl;
                                        function ambientOcclusion
                                        : SCNMaterialProperty; cdecl;
                                        function selfIllumination
                                        : SCNMaterialProperty; cdecl;
                                        procedure setShininess
                                        (shininess: CGFloat); cdecl;
                                        function shininess: CGFloat; cdecl;
                                        procedure setTransparency
                                        (transparency: CGFloat); cdecl;
                                        function transparency: CGFloat; cdecl;
                                        procedure setLightingModelName
                                        (lightingModelName: NSString); cdecl;
                                        function lightingModelName
                                        : NSString; cdecl;
                                        procedure setLitPerPixel
                                        (litPerPixel: Boolean); cdecl;
                                        function isLitPerPixel: Boolean; cdecl;
                                        procedure setDoubleSided
                                        (doubleSided: Boolean); cdecl;
                                        function isDoubleSided: Boolean; cdecl;
                                        procedure setCullMode
                                        (cullMode: SCNCullMode); cdecl;
                                        function cullMode: SCNCullMode; cdecl;
                                        procedure setTransparencyMode
                                        (transparencyMode
                                        : SCNTransparencyMode); cdecl;
                                        function transparencyMode
                                        : SCNTransparencyMode; cdecl;
                                        procedure setLocksAmbientWithDiffuse
                                        (locksAmbientWithDiffuse
                                        : Boolean); cdecl;
                                        function locksAmbientWithDiffuse
                                        : Boolean; cdecl;
                                        procedure setWritesToDepthBuffer
                                        (writesToDepthBuffer: Boolean); cdecl;
                                        function writesToDepthBuffer
                                        : Boolean; cdecl;
                                        procedure setReadsFromDepthBuffer
                                        (readsFromDepthBuffer: Boolean); cdecl;
                                        function readsFromDepthBuffer
                                        : Boolean; cdecl;
                                        procedure setFresnelExponent
                                        (fresnelExponent: CGFloat); cdecl;
                                        function fresnelExponent
                                        : CGFloat; cdecl;
                                        procedure setBlendMode
                                        (blendMode: SCNBlendMode); cdecl;
                                        function blendMode: SCNBlendMode; cdecl;
                                        end;

                                        TSCNMaterial = class
                                        (TOCGenericImport<SCNMaterialClass,
                                        SCNMaterial>)
                                        end;
                                        PSCNMaterial = Pointer;

                                        SCNRendererClass = interface
                                        (NSObjectClass)
                                        ['{2ECFCC34-D7E3-4659-99B3-807F6A8C58F3}']
                                        { class } function rendererWithContext
                                        (context: EAGLContext;
                                        options: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function rendererWithDevice
                                        (device: Pointer; options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SCNRenderer = interface(NSObject)
                                        ['{9807A48C-D797-4D1F-80B2-BAA781617AED}']
                                        procedure setScene(scene: SCNScene);
                                        cdecl;
                                        function scene: SCNScene; cdecl;
                                        [MethodName('renderAtTime:')]
                                        procedure renderAtTime
                                        (time: CFTimeInterval); cdecl;
                                        [MethodName
                                        ('renderAtTime:viewport:commandBuffer:passDescriptor:')
                                        ]
                                        procedure renderAtTimeViewportCommandBufferPassDescriptor
                                        (time: CFTimeInterval; viewport: CGRect;
                                        commandBuffer: Pointer;
                                        passDescriptor
                                        : MTLRenderPassDescriptor); cdecl;
                                        function nextFrameTime
                                        : CFTimeInterval; cdecl;
                                        procedure render; cdecl;
                                        end;

                                        TSCNRenderer = class
                                        (TOCGenericImport<SCNRendererClass,
                                        SCNRenderer>)
                                        end;
                                        PSCNRenderer = Pointer;

                                        SCNProgramClass = interface
                                        (NSObjectClass)
                                        ['{4FB74E2D-10F3-4909-B4CE-DF4F0D8E3967}']
                                        { class } function &program
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNProgram = interface(NSObject)
                                        ['{A872CBE4-6FFC-4DB8-9EFD-9D40CEBB8E32}']
                                        procedure setVertexShader
                                        (vertexShader: NSString);
                                        cdecl;
                                        function vertexShader: NSString; cdecl;
                                        procedure setFragmentShader
                                        (fragmentShader: NSString); cdecl;
                                        function fragmentShader
                                        : NSString; cdecl;
                                        procedure setVertexFunctionName
                                        (vertexFunctionName: NSString); cdecl;
                                        function vertexFunctionName
                                        : NSString; cdecl;
                                        procedure setFragmentFunctionName
                                        (fragmentFunctionName: NSString); cdecl;
                                        function fragmentFunctionName
                                        : NSString; cdecl;
                                        procedure handleBindingOfBufferNamed
                                        (name: NSString;
                                        frequency: SCNBufferFrequency;
                                        usingBlock
                                        : SCNBufferBindingBlock); cdecl;
                                        procedure setOpaque
                                        (opaque: Boolean); cdecl;
                                        function isOpaque: Boolean; cdecl;
                                        procedure setSemantic
                                        (semantic: NSString;
                                        forSymbol: NSString;
                                        options: NSDictionary); cdecl;
                                        function semanticForSymbol
                                        (symbol: NSString): NSString; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        procedure setLibrary
                                        (&library: Pointer); cdecl;
                                        function &library: Pointer; cdecl;
                                        end;

                                        TSCNProgram = class
                                        (TOCGenericImport<SCNProgramClass,
                                        SCNProgram>)
                                        end;
                                        PSCNProgram = Pointer;

                                        SCNTechniqueClass = interface
                                        (NSObjectClass)
                                        ['{1FCA0B5A-5992-4878-B65D-2E3936867968}']
                                        { class } function
                                        techniqueWithDictionary
                                        (dictionary: NSDictionary)
                                        : SCNTechnique;
                                        cdecl;
                                        { class } function
                                        techniqueBySequencingTechniques
                                        (techniques: NSArray)
                                        : SCNTechnique; cdecl;
                                        end;
                                        SCNTechnique = interface(NSObject)
                                        ['{22793E06-8FD2-4AAC-AC62-1C4C81E495A2}']
                                        procedure handleBindingOfSymbol
                                        (symbol: NSString;
                                        usingBlock: SCNBindingBlock);
                                        cdecl;
                                        function dictionaryRepresentation
                                        : NSDictionary; cdecl;
                                        function objectForKeyedSubscript
                                        (key: Pointer): Pointer; cdecl;
                                        procedure setObject(obj: Pointer;
                                        forKeyedSubscript: Pointer); cdecl;
                                        end;

                                        TSCNTechnique = class
                                        (TOCGenericImport<SCNTechniqueClass,
                                        SCNTechnique>)
                                        end;
                                        PSCNTechnique = Pointer;

                                        SCNViewClass = interface(UIViewClass)
                                        ['{3B2212A2-73A0-4043-9F78-880FF0535ED8}']
                                        end;
                                        SCNView = interface(UIView)
                                        ['{4E31DA43-FA61-4A6E-85E1-C067DAB2ADB4}']
                                        function initWithFrame(frame: CGRect;
                                        options: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setScene
                                        (scene: SCNScene); cdecl;
                                        function scene: SCNScene; cdecl;
                                        procedure setAllowsCameraControl
                                        (allowsCameraControl: Boolean); cdecl;
                                        function allowsCameraControl
                                        : Boolean; cdecl;
                                        function snapshot: UIImage; cdecl;
                                        procedure play(sender: Pointer); cdecl;
                                        procedure pause(sender: Pointer); cdecl;
                                        procedure stop(sender: Pointer); cdecl;
                                        procedure setPreferredFramesPerSecond
                                        (preferredFramesPerSecond
                                        : NSInteger); cdecl;
                                        function preferredFramesPerSecond
                                        : NSInteger; cdecl;
                                        procedure setEaglContext
                                        (EAGLContext: EAGLContext); cdecl;
                                        function EAGLContext
                                        : EAGLContext; cdecl;
                                        procedure setAntialiasingMode
                                        (antialiasingMode
                                        : SCNAntialiasingMode); cdecl;
                                        function antialiasingMode
                                        : SCNAntialiasingMode; cdecl;
                                        end;

                                        TSCNView = class
                                        (TOCGenericImport<
                                        SCNViewClass, SCNView>)
                                        end;
                                        PSCNView = Pointer;

                                        SCNMaterialPropertyClass = interface
                                        (NSObjectClass)
                                        ['{D1D000A7-5FA1-4533-8456-72F56C50F4C8}']
                                        { class } function
                                        materialPropertyWithContents
                                        (contents: Pointer)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNMaterialProperty = interface
                                        (NSObject)
                                        ['{483C1B33-CA84-4A5A-A1BD-01BDC99ECC93}']
                                        procedure setContents
                                        (contents: Pointer);
                                        cdecl;
                                        function contents: Pointer; cdecl;
                                        procedure setIntensity
                                        (intensity: CGFloat); cdecl;
                                        function intensity: CGFloat; cdecl;
                                        procedure setMinificationFilter
                                        (minificationFilter
                                        : SCNFilterMode); cdecl;
                                        function minificationFilter
                                        : SCNFilterMode; cdecl;
                                        procedure setMagnificationFilter
                                        (magnificationFilter
                                        : SCNFilterMode); cdecl;
                                        function magnificationFilter
                                        : SCNFilterMode; cdecl;
                                        procedure setMipFilter
                                        (mipFilter: SCNFilterMode); cdecl;
                                        function mipFilter
                                        : SCNFilterMode; cdecl;
                                        procedure setContentsTransform
                                        (contentsTransform: SCNMatrix4); cdecl;
                                        function contentsTransform
                                        : SCNMatrix4; cdecl;
                                        procedure setWrapS
                                        (wrapS: SCNWrapMode); cdecl;
                                        function wrapS: SCNWrapMode; cdecl;
                                        procedure setWrapT
                                        (wrapT: SCNWrapMode); cdecl;
                                        function wrapT: SCNWrapMode; cdecl;
                                        procedure setBorderColor
                                        (borderColor: Pointer); cdecl;
                                        function borderColor: Pointer; cdecl;
                                        procedure setMappingChannel
                                        (mappingChannel: NSInteger); cdecl;
                                        function mappingChannel
                                        : NSInteger; cdecl;
                                        procedure setMaxAnisotropy
                                        (maxAnisotropy: CGFloat); cdecl;
                                        function maxAnisotropy: CGFloat; cdecl;
                                        end;

                                        TSCNMaterialProperty = class
                                        (TOCGenericImport<
                                        SCNMaterialPropertyClass,
                                        SCNMaterialProperty>)
                                        end;
                                        PSCNMaterialProperty = Pointer;

                                        SCNPhysicsWorldClass = interface
                                        (NSObjectClass)
                                        ['{0F8F3CC6-CCE5-468D-BF6B-AFD101F25DD6}']
                                        end;
                                        SCNPhysicsWorld = interface(NSObject)
                                        ['{7F640A32-E5B9-4692-80CE-9C7F9FF074B0}']
                                        procedure setGravity
                                        (gravity: SCNVector3);
                                        cdecl;
                                        function gravity: SCNVector3; cdecl;
                                        procedure setSpeed
                                        (speed: CGFloat); cdecl;
                                        function speed: CGFloat; cdecl;
                                        procedure setTimeStep
                                        (timeStep: NSTimeInterval); cdecl;
                                        function timeStep
                                        : NSTimeInterval; cdecl;
                                        procedure setContactDelegate
                                        (contactDelegate: Pointer); cdecl;
                                        function contactDelegate
                                        : Pointer; cdecl;
                                        procedure addBehavior
                                        (behavior: SCNPhysicsBehavior); cdecl;
                                        procedure removeBehavior
                                        (behavior: SCNPhysicsBehavior); cdecl;
                                        procedure removeAllBehaviors; cdecl;
                                        function allBehaviors: NSArray; cdecl;
                                        function rayTestWithSegmentFromPoint
                                        (origin: SCNVector3;
                                        toPoint: SCNVector3;
                                        options: NSDictionary): NSArray; cdecl;
                                        function contactTestBetweenBody
                                        (bodyA: SCNPhysicsBody;
                                        andBody: SCNPhysicsBody;
                                        options: NSDictionary): NSArray; cdecl;
                                        function contactTestWithBody
                                        (body: SCNPhysicsBody;
                                        options: NSDictionary): NSArray; cdecl;
                                        function convexSweepTestWithShape
                                        (shape: SCNPhysicsShape;
                                        fromTransform: SCNMatrix4;
                                        toTransform: SCNMatrix4;
                                        options: NSDictionary): NSArray; cdecl;
                                        procedure updateCollisionPairs; cdecl;
                                        end;

                                        TSCNPhysicsWorld = class
                                        (TOCGenericImport<SCNPhysicsWorldClass,
                                        SCNPhysicsWorld>)
                                        end;
                                        PSCNPhysicsWorld = Pointer;

                                        SCNSceneSourceClass = interface
                                        (NSObjectClass)
                                        ['{5BB0E5F1-0D1B-415A-9D8E-A480DD88B55C}']
                                        { class } function sceneSourceWithURL
                                        (url: NSURL; options: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function sceneSourceWithData
                                        (data: NSData; options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SCNSceneSource = interface(NSObject)
                                        ['{90E3B313-20D8-46B9-AA32-1F76285380A7}']
                                        function initWithURL(url: NSURL;
                                        options: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithData(data: NSData;
                                        options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        function url: NSURL; cdecl;
                                        function data: NSData; cdecl;
                                        [MethodName
                                        ('sceneWithOptions:statusHandler:')]
                                        function sceneWithOptionsStatusHandler
                                        (options: NSDictionary;
                                        statusHandler
                                        : SCNSceneSourceStatusHandler)
                                        : SCNScene; cdecl;
                                        [MethodName('sceneWithOptions:error:')]
                                        function sceneWithOptionsError
                                        (options: NSDictionary; error: NSError)
                                        : SCNScene; cdecl;
                                        function propertyForKey(key: NSString)
                                        : Pointer; cdecl;
                                        function entryWithIdentifier
                                        (uid: NSString; withClass: Pointer)
                                        : Pointer; cdecl;
                                        function identifiersOfEntriesWithClass
                                        (entryClass: Pointer): NSArray; cdecl;
                                        function entriesPassingTest
                                        (predicate: TSceneKitPredicate)
                                        : NSArray; cdecl;
                                        end;

                                        TSCNSceneSource = class
                                        (TOCGenericImport<SCNSceneSourceClass,
                                        SCNSceneSource>)
                                        end;
                                        PSCNSceneSource = Pointer;

                                        SCNActionClass = interface
                                        (NSObjectClass)
                                        ['{C5120EF5-0444-41B4-8883-7EAA2CA16033}']
                                        { class } function moveByX
                                        (deltaX: CGFloat; y: CGFloat;
                                        z: CGFloat; duration: NSTimeInterval)
                                        : SCNAction;
                                        cdecl;
                                        { class } function moveBy
                                        (delta: SCNVector3;
                                        duration: NSTimeInterval)
                                        : SCNAction; cdecl;
                                        { class } function moveTo
                                        (location: SCNVector3;
                                        duration: NSTimeInterval)
                                        : SCNAction; cdecl;
                                        { class } function rotateByX
                                        (xAngle: CGFloat; y: CGFloat;
                                        z: CGFloat; duration: NSTimeInterval)
                                        : SCNAction; cdecl;
                                        [MethodName('rotateToX:y:z:duration:')]
                                        { class } function rotateToXYZDuration
                                        (xAngle: CGFloat; y: CGFloat;
                                        z: CGFloat; duration: NSTimeInterval)
                                        : SCNAction; cdecl;
                                        [MethodName
                                        ('rotateToX:y:z:duration:shortestUnitArc:')
                                        ]
                                        { class } function
                                        rotateToXYZDurationShortestUnitArc
                                        (xAngle: CGFloat; y: CGFloat;
                                        z: CGFloat; duration: NSTimeInterval;
                                        shortestUnitArc: Boolean)
                                        : SCNAction; cdecl;
                                        { class } function rotateByAngle
                                        (angle: CGFloat; aroundAxis: SCNVector3;
                                        duration: NSTimeInterval)
                                        : SCNAction; cdecl;
                                        { class } function rotateToAxisAngle
                                        (axisAngle: SCNVector4;
                                        duration: NSTimeInterval)
                                        : SCNAction; cdecl;
                                        { class } function scaleBy
                                        (scale: CGFloat;
                                        duration: NSTimeInterval)
                                        : SCNAction; cdecl;
                                        { class } function scaleTo
                                        (scale: CGFloat;
                                        duration: NSTimeInterval)
                                        : SCNAction; cdecl;
                                        { class } function sequence
                                        (actions: NSArray): SCNAction; cdecl;
                                        { class } function group
                                        (actions: NSArray): SCNAction; cdecl;
                                        { class } function repeatAction
                                        (action: SCNAction; count: NSUInteger)
                                        : SCNAction; cdecl;
                                        { class } function repeatActionForever
                                        (action: SCNAction): SCNAction; cdecl;
                                        { class } function fadeInWithDuration
                                        (sec: NSTimeInterval): SCNAction; cdecl;
                                        { class } function fadeOutWithDuration
                                        (sec: NSTimeInterval): SCNAction; cdecl;
                                        { class } function fadeOpacityBy
                                        (factor: CGFloat;
                                        duration: NSTimeInterval)
                                        : SCNAction; cdecl;
                                        { class } function fadeOpacityTo
                                        (opacity: CGFloat;
                                        duration: NSTimeInterval)
                                        : SCNAction; cdecl;
                                        { class } function hide
                                        : SCNAction; cdecl;
                                        { class } function unhide
                                        : SCNAction; cdecl;
                                        [MethodName('waitForDuration:')]
                                        { class } function waitForDuration
                                        (sec: NSTimeInterval): SCNAction; cdecl;
                                        [MethodName
                                        ('waitForDuration:withRange:')]
                                        { class } function
                                        waitForDurationWithRange
                                        (sec: NSTimeInterval;
                                        withRange: NSTimeInterval)
                                        : SCNAction; cdecl;
                                        { class } function removeFromParentNode
                                        : SCNAction; cdecl;
                                        [MethodName('runBlock:')]
                                        { class } function runBlock
                                        (block: TSceneKitBlock)
                                        : SCNAction; cdecl;
                                        [MethodName('runBlock:queue:')]
                                        { class } function runBlockQueue
                                        (block: TSceneKitBlock;
                                        queue: dispatch_queue_t)
                                        : SCNAction; cdecl;
                                        { class } function
                                        javaScriptActionWithScript
                                        (script: NSString;
                                        duration: NSTimeInterval)
                                        : SCNAction; cdecl;
                                        { class } function
                                        customActionWithDuration
                                        (seconds: NSTimeInterval;
                                        actionBlock: TSceneKitActionBlock)
                                        : SCNAction; cdecl;
                                        { class } function playAudioSource
                                        (source: SCNAudioSource;
                                        waitForCompletion: Boolean)
                                        : SCNAction; cdecl;
                                        end;
                                        SCNAction = interface(NSObject)
                                        ['{F125974A-EE15-451F-A313-94D14D86AD19}']
                                        procedure setDuration
                                        (duration: NSTimeInterval);
                                        cdecl;
                                        function duration
                                        : NSTimeInterval; cdecl;
                                        procedure setTimingMode
                                        (timingMode
                                        : SCNActionTimingMode); cdecl;
                                        function timingMode
                                        : SCNActionTimingMode; cdecl;
                                        procedure setTimingFunction
                                        (timingFunction
                                        : SCNActionTimingFunction); cdecl;
                                        function timingFunction
                                        : SCNActionTimingFunction; cdecl;
                                        procedure setSpeed
                                        (speed: CGFloat); cdecl;
                                        function speed: CGFloat; cdecl;
                                        function reversedAction
                                        : SCNAction; cdecl;
                                        end;

                                        TSCNAction = class
                                        (TOCGenericImport<SCNActionClass,
                                        SCNAction>)
                                        end;
                                        PSCNAction = Pointer;

                                        SCNAudioSourceClass = interface
                                        (NSObjectClass)
                                        ['{AB0141DC-42C3-40B3-89FC-1FC9055CF8B8}']
                                        { class } function audioSourceNamed
                                        (fileName: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNAudioSource = interface(NSObject)
                                        ['{DDBCF844-1CB1-4297-94D0-7439B9B7366E}']
                                        function initWithFileNamed
                                        (name: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithURL(url: NSURL)
                                        : Pointer { instancetype }; cdecl;
                                        procedure setPositional
                                        (positional: Boolean); cdecl;
                                        function isPositional: Boolean; cdecl;
                                        procedure setVolume
                                        (volume: Single); cdecl;
                                        function volume: Single; cdecl;
                                        procedure setRate(rate: Single); cdecl;
                                        function rate: Single; cdecl;
                                        procedure setReverbBlend
                                        (reverbBlend: Single); cdecl;
                                        function reverbBlend: Single; cdecl;
                                        procedure setLoops
                                        (loops: Boolean); cdecl;
                                        function loops: Boolean; cdecl;
                                        procedure setShouldStream
                                        (shouldStream: Boolean); cdecl;
                                        function shouldStream: Boolean; cdecl;
                                        procedure load; cdecl;
                                        end;

                                        TSCNAudioSource = class
                                        (TOCGenericImport<SCNAudioSourceClass,
                                        SCNAudioSource>)
                                        end;
                                        PSCNAudioSource = Pointer;

                                        SCNLightClass = interface(NSObjectClass)
                                        ['{36340BB2-A57F-4544-BA98-83E9144F9CF3}']
                                        { class } function light
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNLight = interface(NSObject)
                                        ['{29F97B79-A6C0-4477-9AB9-BB23A4389879}']
                                        procedure setType(&type: NSString);
                                        cdecl;
                                        function &type: NSString; cdecl;
                                        procedure setColor
                                        (color: Pointer); cdecl;
                                        function color: Pointer; cdecl;
                                        procedure setName
                                        (name: NSString); cdecl;
                                        function name: NSString; cdecl;
                                        procedure setCastsShadow
                                        (castsShadow: Boolean); cdecl;
                                        function castsShadow: Boolean; cdecl;
                                        procedure setShadowColor
                                        (shadowColor: Pointer); cdecl;
                                        function shadowColor: Pointer; cdecl;
                                        procedure setShadowRadius
                                        (shadowRadius: CGFloat); cdecl;
                                        function shadowRadius: CGFloat; cdecl;
                                        procedure setShadowMapSize
                                        (shadowMapSize: CGSize); cdecl;
                                        function shadowMapSize: CGSize; cdecl;
                                        procedure setShadowSampleCount
                                        (shadowSampleCount: NSUInteger); cdecl;
                                        function shadowSampleCount
                                        : NSUInteger; cdecl;
                                        procedure setShadowMode
                                        (shadowMode: SCNShadowMode); cdecl;
                                        function shadowMode
                                        : SCNShadowMode; cdecl;
                                        procedure setShadowBias
                                        (shadowBias: CGFloat); cdecl;
                                        function shadowBias: CGFloat; cdecl;
                                        procedure setOrthographicScale
                                        (orthographicScale: CGFloat); cdecl;
                                        function orthographicScale
                                        : CGFloat; cdecl;
                                        procedure setZNear
                                        (zNear: CGFloat); cdecl;
                                        function zNear: CGFloat; cdecl;
                                        procedure setZFar(zFar: CGFloat); cdecl;
                                        function zFar: CGFloat; cdecl;
                                        procedure setAttenuationStartDistance
                                        (attenuationStartDistance
                                        : CGFloat); cdecl;
                                        function attenuationStartDistance
                                        : CGFloat; cdecl;
                                        procedure setAttenuationEndDistance
                                        (attenuationEndDistance
                                        : CGFloat); cdecl;
                                        function attenuationEndDistance
                                        : CGFloat; cdecl;
                                        procedure setAttenuationFalloffExponent
                                        (attenuationFalloffExponent
                                        : CGFloat); cdecl;
                                        function attenuationFalloffExponent
                                        : CGFloat; cdecl;
                                        procedure setSpotInnerAngle
                                        (spotInnerAngle: CGFloat); cdecl;
                                        function spotInnerAngle: CGFloat; cdecl;
                                        procedure setSpotOuterAngle
                                        (spotOuterAngle: CGFloat); cdecl;
                                        function spotOuterAngle: CGFloat; cdecl;
                                        function gobo
                                        : SCNMaterialProperty; cdecl;
                                        procedure setCategoryBitMask
                                        (categoryBitMask: NSUInteger); cdecl;
                                        function categoryBitMask
                                        : NSUInteger; cdecl;
                                        end;

                                        TSCNLight = class
                                        (TOCGenericImport<SCNLightClass,
                                        SCNLight>)
                                        end;
                                        PSCNLight = Pointer;

                                        SCNCameraClass = interface
                                        (NSObjectClass)
                                        ['{7F5D8F2A-32C3-4F84-9EE0-14ACCC3493FE}']
                                        { class } function camera
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNCamera = interface(NSObject)
                                        ['{392AF947-4268-4CBC-A860-3B90194D7CAA}']
                                        procedure setName(name: NSString);
                                        cdecl;
                                        function name: NSString; cdecl;
                                        procedure setXFov(xFov: Double); cdecl;
                                        function xFov: Double; cdecl;
                                        procedure setYFov(yFov: Double); cdecl;
                                        function yFov: Double; cdecl;
                                        procedure setZNear
                                        (zNear: Double); cdecl;
                                        function zNear: Double; cdecl;
                                        procedure setZFar(zFar: Double); cdecl;
                                        function zFar: Double; cdecl;
                                        procedure setAutomaticallyAdjustsZRange
                                        (automaticallyAdjustsZRange
                                        : Boolean); cdecl;
                                        function automaticallyAdjustsZRange
                                        : Boolean; cdecl;
                                        procedure setUsesOrthographicProjection
                                        (usesOrthographicProjection
                                        : Boolean); cdecl;
                                        function usesOrthographicProjection
                                        : Boolean; cdecl;
                                        procedure setOrthographicScale
                                        (orthographicScale: Double); cdecl;
                                        function orthographicScale
                                        : Double; cdecl;
                                        function projectionTransform
                                        : SCNMatrix4; cdecl;
                                        procedure setProjectionTransform
                                        (projectionTransform
                                        : SCNMatrix4); cdecl;
                                        procedure setFocalDistance
                                        (focalDistance: CGFloat); cdecl;
                                        function focalDistance: CGFloat; cdecl;
                                        procedure setFocalSize
                                        (focalSize: CGFloat); cdecl;
                                        function focalSize: CGFloat; cdecl;
                                        procedure setFocalBlurRadius
                                        (focalBlurRadius: CGFloat); cdecl;
                                        function focalBlurRadius
                                        : CGFloat; cdecl;
                                        procedure setAperture
                                        (aperture: CGFloat); cdecl;
                                        function aperture: CGFloat; cdecl;
                                        procedure setCategoryBitMask
                                        (categoryBitMask: NSUInteger); cdecl;
                                        function categoryBitMask
                                        : NSUInteger; cdecl;
                                        end;

                                        TSCNCamera = class
                                        (TOCGenericImport<SCNCameraClass,
                                        SCNCamera>)
                                        end;
                                        PSCNCamera = Pointer;

                                        SCNGeometryClass = interface
                                        (NSObjectClass)
                                        ['{1BCC90FC-15BC-4972-82E1-6FBAE84E17CE}']
                                        { class } function geometry
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function geometryWithSources
                                        (sources: NSArray; elements: NSArray)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SCNGeometry = interface(NSObject)
                                        ['{9A4358C3-B052-4C99-8E0B-6E83216C2D75}']
                                        procedure setName(name: NSString);
                                        cdecl;
                                        function name: NSString; cdecl;
                                        procedure setMaterials
                                        (materials: NSArray); cdecl;
                                        function materials: NSArray; cdecl;
                                        procedure setFirstMaterial
                                        (firstMaterial: SCNMaterial); cdecl;
                                        function firstMaterial
                                        : SCNMaterial; cdecl;
                                        procedure insertMaterial
                                        (material: SCNMaterial;
                                        atIndex: NSUInteger); cdecl;
                                        procedure removeMaterialAtIndex
                                        (index: NSUInteger); cdecl;
                                        procedure replaceMaterialAtIndex
                                        (index: NSUInteger;
                                        withMaterial: SCNMaterial); cdecl;
                                        function materialWithName
                                        (name: NSString): SCNMaterial; cdecl;
                                        function geometrySources
                                        : NSArray; cdecl;
                                        function geometrySourcesForSemantic
                                        (semantic: NSString): NSArray; cdecl;
                                        function geometryElements
                                        : NSArray; cdecl;
                                        function geometryElementCount
                                        : NSInteger; cdecl;
                                        function geometryElementAtIndex
                                        (elementIndex: NSInteger)
                                        : SCNGeometryElement; cdecl;
                                        procedure setLevelsOfDetail
                                        (levelsOfDetail: NSArray); cdecl;
                                        function levelsOfDetail: NSArray; cdecl;
                                        procedure setSubdivisionLevel
                                        (subdivisionLevel: NSUInteger); cdecl;
                                        function subdivisionLevel
                                        : NSUInteger; cdecl;
                                        procedure setEdgeCreasesElement
                                        (edgeCreasesElement
                                        : SCNGeometryElement); cdecl;
                                        function edgeCreasesElement
                                        : SCNGeometryElement; cdecl;
                                        procedure setEdgeCreasesSource
                                        (edgeCreasesSource
                                        : SCNGeometrySource); cdecl;
                                        function edgeCreasesSource
                                        : SCNGeometrySource; cdecl;
                                        end;

                                        TSCNGeometry = class
                                        (TOCGenericImport<SCNGeometryClass,
                                        SCNGeometry>)
                                        end;
                                        PSCNGeometry = Pointer;

                                        SCNSkinnerClass = interface
                                        (NSObjectClass)
                                        ['{926D80B0-BF6B-4D62-87C8-542C3AD3B1F5}']
                                        { class } function
                                        skinnerWithBaseGeometry
                                        (baseGeometry: SCNGeometry;
                                        bones: NSArray;
                                        boneInverseBindTransforms: NSArray;
                                        boneWeights: SCNGeometrySource;
                                        boneIndices: SCNGeometrySource)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNSkinner = interface(NSObject)
                                        ['{DAB56A6A-02CC-4DAB-8893-4C3854777B2A}']
                                        procedure setSkeleton
                                        (skeleton: SCNNode);
                                        cdecl;
                                        function skeleton: SCNNode; cdecl;
                                        procedure setBaseGeometry
                                        (baseGeometry: SCNGeometry); cdecl;
                                        function baseGeometry
                                        : SCNGeometry; cdecl;
                                        procedure setBaseGeometryBindTransform
                                        (baseGeometryBindTransform
                                        : SCNMatrix4); cdecl;
                                        function baseGeometryBindTransform
                                        : SCNMatrix4; cdecl;
                                        function boneInverseBindTransforms
                                        : NSArray; cdecl;
                                        function bones: NSArray; cdecl;
                                        function boneWeights
                                        : SCNGeometrySource; cdecl;
                                        function boneIndices
                                        : SCNGeometrySource; cdecl;
                                        end;

                                        TSCNSkinner = class
                                        (TOCGenericImport<SCNSkinnerClass,
                                        SCNSkinner>)
                                        end;
                                        PSCNSkinner = Pointer;

                                        SCNMorpherClass = interface
                                        (NSObjectClass)
                                        ['{F41C2920-497C-44C9-92ED-B61AAD3F78E8}']
                                        end;
                                        SCNMorpher = interface(NSObject)
                                        ['{B277BE9A-F3B5-422D-9291-62F65A316F8A}']
                                        procedure setTargets(targets: NSArray);
                                        cdecl;
                                        function targets: NSArray; cdecl;
                                        procedure setWeight(weight: CGFloat;
                                        forTargetAtIndex: NSUInteger); cdecl;
                                        function weightForTargetAtIndex
                                        (targetIndex: NSUInteger)
                                        : CGFloat; cdecl;
                                        procedure setCalculationMode
                                        (calculationMode
                                        : SCNMorpherCalculationMode); cdecl;
                                        function calculationMode
                                        : SCNMorpherCalculationMode; cdecl;
                                        end;

                                        TSCNMorpher = class
                                        (TOCGenericImport<SCNMorpherClass,
                                        SCNMorpher>)
                                        end;
                                        PSCNMorpher = Pointer;

                                        SCNConstraintClass = interface
                                        (NSObjectClass)
                                        ['{F71A940D-4DEF-4432-8489-0F1E521CC128}']
                                        end;
                                        SCNConstraint = interface(NSObject)
                                        ['{185C86A7-E352-4178-B9E9-A77BF3793957}']
                                        procedure setInfluenceFactor
                                        (influenceFactor: CGFloat);
                                        cdecl;
                                        function influenceFactor
                                        : CGFloat; cdecl;
                                        end;

                                        TSCNConstraint = class
                                        (TOCGenericImport<SCNConstraintClass,
                                        SCNConstraint>)
                                        end;
                                        PSCNConstraint = Pointer;

                                        SCNPhysicsBodyClass = interface
                                        (NSObjectClass)
                                        ['{DD1DA2FD-5FF7-4995-AF56-D014E8973FC4}']
                                        { class } function staticBody
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function dynamicBody
                                        : Pointer { instancetype }; cdecl;
                                        { class } function kinematicBody
                                        : Pointer { instancetype }; cdecl;
                                        { class } function bodyWithType
                                        (&type: SCNPhysicsBodyType;
                                        shape: SCNPhysicsShape)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SCNPhysicsBody = interface(NSObject)
                                        ['{D49150A3-83E7-4027-A55A-6526FA9A7A5F}']
                                        procedure setType
                                        (&type: SCNPhysicsBodyType);
                                        cdecl;
                                        function &type
                                        : SCNPhysicsBodyType; cdecl;
                                        procedure setMass(mass: CGFloat); cdecl;
                                        function mass: CGFloat; cdecl;
                                        procedure setMomentOfInertia
                                        (momentOfInertia: SCNVector3); cdecl;
                                        function momentOfInertia
                                        : SCNVector3; cdecl;
                                        procedure setUsesDefaultMomentOfInertia
                                        (usesDefaultMomentOfInertia
                                        : Boolean); cdecl;
                                        function usesDefaultMomentOfInertia
                                        : Boolean; cdecl;
                                        procedure setCharge
                                        (charge: CGFloat); cdecl;
                                        function charge: CGFloat; cdecl;
                                        procedure setFriction
                                        (friction: CGFloat); cdecl;
                                        function friction: CGFloat; cdecl;
                                        procedure setRestitution
                                        (restitution: CGFloat); cdecl;
                                        function restitution: CGFloat; cdecl;
                                        procedure setRollingFriction
                                        (rollingFriction: CGFloat); cdecl;
                                        function rollingFriction
                                        : CGFloat; cdecl;
                                        procedure setPhysicsShape
                                        (physicsShape: SCNPhysicsShape); cdecl;
                                        function physicsShape
                                        : SCNPhysicsShape; cdecl;
                                        function isResting: Boolean; cdecl;
                                        procedure setAllowsResting
                                        (allowsResting: Boolean); cdecl;
                                        function allowsResting: Boolean; cdecl;
                                        procedure setVelocity
                                        (velocity: SCNVector3); cdecl;
                                        function velocity: SCNVector3; cdecl;
                                        procedure setAngularVelocity
                                        (angularVelocity: SCNVector4); cdecl;
                                        function angularVelocity
                                        : SCNVector4; cdecl;
                                        procedure setDamping
                                        (damping: CGFloat); cdecl;
                                        function damping: CGFloat; cdecl;
                                        procedure setAngularDamping
                                        (angularDamping: CGFloat); cdecl;
                                        function angularDamping: CGFloat; cdecl;
                                        procedure setVelocityFactor
                                        (velocityFactor: SCNVector3); cdecl;
                                        function velocityFactor
                                        : SCNVector3; cdecl;
                                        procedure setAngularVelocityFactor
                                        (angularVelocityFactor
                                        : SCNVector3); cdecl;
                                        function angularVelocityFactor
                                        : SCNVector3; cdecl;
                                        procedure setCategoryBitMask
                                        (categoryBitMask: NSUInteger); cdecl;
                                        function categoryBitMask
                                        : NSUInteger; cdecl;
                                        procedure setCollisionBitMask
                                        (collisionBitMask: NSUInteger); cdecl;
                                        function collisionBitMask
                                        : NSUInteger; cdecl;
                                        procedure setContactTestBitMask
                                        (contactTestBitMask: NSUInteger); cdecl;
                                        function contactTestBitMask
                                        : NSUInteger; cdecl;
                                        procedure setAffectedByGravity
                                        (affectedByGravity: Boolean); cdecl;
                                        function isAffectedByGravity
                                        : Boolean; cdecl;
                                        [MethodName('applyForce:impulse:')]
                                        procedure applyForceImpulse
                                        (direction: SCNVector3;
                                        impulse: Boolean); cdecl;
                                        [MethodName
                                        ('applyForce:atPosition:impulse:')]
                                        procedure applyForceAtPositionImpulse
                                        (direction: SCNVector3;
                                        atPosition: SCNVector3;
                                        impulse: Boolean); cdecl;
                                        procedure applyTorque
                                        (torque: SCNVector4;
                                        impulse: Boolean); cdecl;
                                        procedure clearAllForces; cdecl;
                                        procedure resetTransform; cdecl;
                                        end;

                                        TSCNPhysicsBody = class
                                        (TOCGenericImport<SCNPhysicsBodyClass,
                                        SCNPhysicsBody>)
                                        end;
                                        PSCNPhysicsBody = Pointer;

                                        SCNPhysicsFieldClass = interface
                                        (NSObjectClass)
                                        ['{63A0FD4C-F784-4F35-9CE6-1FB0AF458230}']
                                        { class } function dragField
                                        : SCNPhysicsField;
                                        cdecl;
                                        { class } function vortexField
                                        : SCNPhysicsField; cdecl;
                                        { class } function radialGravityField
                                        : SCNPhysicsField; cdecl;
                                        { class } function linearGravityField
                                        : SCNPhysicsField; cdecl;
                                        { class } function
                                        noiseFieldWithSmoothness
                                        (smoothness: CGFloat;
                                        animationSpeed: CGFloat)
                                        : SCNPhysicsField; cdecl;
                                        { class } function
                                        turbulenceFieldWithSmoothness
                                        (smoothness: CGFloat;
                                        animationSpeed: CGFloat)
                                        : SCNPhysicsField; cdecl;
                                        { class } function springField
                                        : SCNPhysicsField; cdecl;
                                        { class } function electricField
                                        : SCNPhysicsField; cdecl;
                                        { class } function magneticField
                                        : SCNPhysicsField; cdecl;
                                        { class } function
                                        customFieldWithEvaluationBlock
                                        (block: SCNFieldForceEvaluator)
                                        : SCNPhysicsField; cdecl;
                                        end;
                                        SCNPhysicsField = interface(NSObject)
                                        ['{264DB06B-FDB2-4EDE-9DC9-E4158D1685F4}']
                                        procedure setStrength
                                        (strength: CGFloat);
                                        cdecl;
                                        function strength: CGFloat; cdecl;
                                        procedure setFalloffExponent
                                        (falloffExponent: CGFloat); cdecl;
                                        function falloffExponent
                                        : CGFloat; cdecl;
                                        procedure setMinimumDistance
                                        (minimumDistance: CGFloat); cdecl;
                                        function minimumDistance
                                        : CGFloat; cdecl;
                                        procedure setActive
                                        (active: Boolean); cdecl;
                                        function isActive: Boolean; cdecl;
                                        procedure setExclusive
                                        (exclusive: Boolean); cdecl;
                                        function isExclusive: Boolean; cdecl;
                                        procedure setHalfExtent
                                        (halfExtent: SCNVector3); cdecl;
                                        function halfExtent: SCNVector3; cdecl;
                                        procedure setUsesEllipsoidalExtent
                                        (usesEllipsoidalExtent: Boolean); cdecl;
                                        function usesEllipsoidalExtent
                                        : Boolean; cdecl;
                                        procedure setScope
                                        (scope: SCNPhysicsFieldScope); cdecl;
                                        function scope
                                        : SCNPhysicsFieldScope; cdecl;
                                        procedure setOffset
                                        (offset: SCNVector3); cdecl;
                                        function offset: SCNVector3; cdecl;
                                        procedure setDirection
                                        (direction: SCNVector3); cdecl;
                                        function direction: SCNVector3; cdecl;
                                        procedure setCategoryBitMask
                                        (categoryBitMask: NSUInteger); cdecl;
                                        function categoryBitMask
                                        : NSUInteger; cdecl;
                                        end;

                                        TSCNPhysicsField = class
                                        (TOCGenericImport<SCNPhysicsFieldClass,
                                        SCNPhysicsField>)
                                        end;
                                        PSCNPhysicsField = Pointer;

                                        SCNGeometrySourceClass = interface
                                        (NSObjectClass)
                                        ['{7324956D-A3A7-4FBE-AAF2-8D2A39EF8044}']
                                        { class } function
                                        geometrySourceWithData(data: NSData;
                                        semantic: NSString;
                                        vectorCount: NSInteger;
                                        floatComponents: Boolean;
                                        componentsPerVector: NSInteger;
                                        bytesPerComponent: NSInteger;
                                        dataOffset: NSInteger;
                                        dataStride: NSInteger)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        geometrySourceWithVertices
                                        (vertices: Pointer; count: NSInteger)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function
                                        geometrySourceWithNormals
                                        (normals: Pointer; count: NSInteger)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function
                                        geometrySourceWithTextureCoordinates
                                        (texcoord: Pointer; count: NSInteger)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function
                                        geometrySourceWithBuffer
                                        (mtlBuffer: Pointer;
                                        vertexFormat: MTLVertexFormat;
                                        semantic: NSString;
                                        vertexCount: NSInteger;
                                        dataOffset: NSInteger;
                                        dataStride: NSInteger)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SCNGeometrySource = interface(NSObject)
                                        ['{B2E07A14-74E3-40BD-941F-3859D2B1CCF7}']
                                        function data: NSData;
                                        cdecl;
                                        function semantic: NSString; cdecl;
                                        function vectorCount: NSInteger; cdecl;
                                        function floatComponents
                                        : Boolean; cdecl;
                                        function componentsPerVector
                                        : NSInteger; cdecl;
                                        function bytesPerComponent
                                        : NSInteger; cdecl;
                                        function dataOffset: NSInteger; cdecl;
                                        function dataStride: NSInteger; cdecl;
                                        end;

                                        TSCNGeometrySource = class
                                        (TOCGenericImport<
                                        SCNGeometrySourceClass,
                                        SCNGeometrySource>)
                                        end;
                                        PSCNGeometrySource = Pointer;

                                        SCNGeometryElementClass = interface
                                        (NSObjectClass)
                                        ['{19F5E561-93C3-44C6-9754-59A2C6E0DFC4}']
                                        { class } function
                                        geometryElementWithData(data: NSData;
                                        primitiveType: SCNGeometryPrimitiveType;
                                        primitiveCount: NSInteger;
                                        bytesPerIndex: NSInteger)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNGeometryElement = interface(NSObject)
                                        ['{34326F1B-B778-415E-8306-37AEBF1A9163}']
                                        function data: NSData;
                                        cdecl;
                                        function primitiveType
                                        : SCNGeometryPrimitiveType; cdecl;
                                        function primitiveCount
                                        : NSInteger; cdecl;
                                        function bytesPerIndex
                                        : NSInteger; cdecl;
                                        end;

                                        TSCNGeometryElement = class
                                        (TOCGenericImport<
                                        SCNGeometryElementClass,
                                        SCNGeometryElement>)
                                        end;
                                        PSCNGeometryElement = Pointer;

                                        SCNLevelOfDetailClass = interface
                                        (NSObjectClass)
                                        ['{28740866-8282-49BF-987B-FA71C3D1BE29}']
                                        [MethodName
                                        ('levelOfDetailWithGeometry:screenSpaceRadius:')
                                        ]
                                        { class } function
                                        levelOfDetailWithGeometryScreenSpaceRadius
                                        (geometry: SCNGeometry;
                                        screenSpaceRadius: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('levelOfDetailWithGeometry:worldSpaceDistance:')
                                        ]
                                        { class } function
                                        levelOfDetailWithGeometryWorldSpaceDistance
                                        (geometry: SCNGeometry;
                                        worldSpaceDistance: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SCNLevelOfDetail = interface(NSObject)
                                        ['{A9557431-278E-4688-B531-01AB30F56E02}']
                                        function geometry: SCNGeometry;
                                        cdecl;
                                        function screenSpaceRadius
                                        : CGFloat; cdecl;
                                        function worldSpaceDistance
                                        : CGFloat; cdecl;
                                        end;

                                        TSCNLevelOfDetail = class
                                        (TOCGenericImport<SCNLevelOfDetailClass,
                                        SCNLevelOfDetail>)
                                        end;
                                        PSCNLevelOfDetail = Pointer;

                                        SCNPlaneClass = interface
                                        (SCNGeometryClass)
                                        ['{F788DA2D-1A39-4D54-9E70-82DBCC383814}']
                                        { class } function planeWithWidth
                                        (width: CGFloat; height: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNPlane = interface(SCNGeometry)
                                        ['{B6FBB4AD-8A86-490C-9095-F2CFC175954F}']
                                        procedure setWidth(width: CGFloat);
                                        cdecl;
                                        function width: CGFloat; cdecl;
                                        procedure setHeight
                                        (height: CGFloat); cdecl;
                                        function height: CGFloat; cdecl;
                                        procedure setWidthSegmentCount
                                        (widthSegmentCount: NSInteger); cdecl;
                                        function widthSegmentCount
                                        : NSInteger; cdecl;
                                        procedure setHeightSegmentCount
                                        (heightSegmentCount: NSInteger); cdecl;
                                        function heightSegmentCount
                                        : NSInteger; cdecl;
                                        procedure setCornerRadius
                                        (cornerRadius: CGFloat); cdecl;
                                        function cornerRadius: CGFloat; cdecl;
                                        procedure setCornerSegmentCount
                                        (cornerSegmentCount: NSInteger); cdecl;
                                        function cornerSegmentCount
                                        : NSInteger; cdecl;
                                        end;

                                        TSCNPlane = class
                                        (TOCGenericImport<SCNPlaneClass,
                                        SCNPlane>)
                                        end;
                                        PSCNPlane = Pointer;

                                        SCNBoxClass = interface
                                        (SCNGeometryClass)
                                        ['{BCA10431-8E03-4F6B-912B-6698A3E1FCBF}']
                                        { class } function boxWithWidth
                                        (width: CGFloat; height: CGFloat;
                                        length: CGFloat; chamferRadius: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNBox = interface(SCNGeometry)
                                        ['{5D5653E7-671A-4026-AC0B-33C9844E8F4A}']
                                        procedure setWidth(width: CGFloat);
                                        cdecl;
                                        function width: CGFloat; cdecl;
                                        procedure setHeight
                                        (height: CGFloat); cdecl;
                                        function height: CGFloat; cdecl;
                                        procedure setLength
                                        (length: CGFloat); cdecl;
                                        function length: CGFloat; cdecl;
                                        procedure setChamferRadius
                                        (chamferRadius: CGFloat); cdecl;
                                        function chamferRadius: CGFloat; cdecl;
                                        procedure setWidthSegmentCount
                                        (widthSegmentCount: NSInteger); cdecl;
                                        function widthSegmentCount
                                        : NSInteger; cdecl;
                                        procedure setHeightSegmentCount
                                        (heightSegmentCount: NSInteger); cdecl;
                                        function heightSegmentCount
                                        : NSInteger; cdecl;
                                        procedure setLengthSegmentCount
                                        (lengthSegmentCount: NSInteger); cdecl;
                                        function lengthSegmentCount
                                        : NSInteger; cdecl;
                                        procedure setChamferSegmentCount
                                        (chamferSegmentCount: NSInteger); cdecl;
                                        function chamferSegmentCount
                                        : NSInteger; cdecl;
                                        end;

                                        TSCNBox = class
                                        (TOCGenericImport<SCNBoxClass, SCNBox>)
                                        end;
                                        PSCNBox = Pointer;

                                        SCNPyramidClass = interface
                                        (SCNGeometryClass)
                                        ['{49544529-B140-47D6-BDF5-45A0AE7CEB20}']
                                        { class } function pyramidWithWidth
                                        (width: CGFloat; height: CGFloat;
                                        length: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNPyramid = interface(SCNGeometry)
                                        ['{712EB133-7D46-4B25-823B-CCF6883933A7}']
                                        procedure setWidth(width: CGFloat);
                                        cdecl;
                                        function width: CGFloat; cdecl;
                                        procedure setHeight
                                        (height: CGFloat); cdecl;
                                        function height: CGFloat; cdecl;
                                        procedure setLength
                                        (length: CGFloat); cdecl;
                                        function length: CGFloat; cdecl;
                                        procedure setWidthSegmentCount
                                        (widthSegmentCount: NSInteger); cdecl;
                                        function widthSegmentCount
                                        : NSInteger; cdecl;
                                        procedure setHeightSegmentCount
                                        (heightSegmentCount: NSInteger); cdecl;
                                        function heightSegmentCount
                                        : NSInteger; cdecl;
                                        procedure setLengthSegmentCount
                                        (lengthSegmentCount: NSInteger); cdecl;
                                        function lengthSegmentCount
                                        : NSInteger; cdecl;
                                        end;

                                        TSCNPyramid = class
                                        (TOCGenericImport<SCNPyramidClass,
                                        SCNPyramid>)
                                        end;
                                        PSCNPyramid = Pointer;

                                        SCNSphereClass = interface
                                        (SCNGeometryClass)
                                        ['{1C498107-5CE8-43F6-841F-96F75EDAAFE6}']
                                        { class } function sphereWithRadius
                                        (radius: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNSphere = interface(SCNGeometry)
                                        ['{DC540282-55A1-4881-A88B-18142B4EEEB1}']
                                        procedure setRadius(radius: CGFloat);
                                        cdecl;
                                        function radius: CGFloat; cdecl;
                                        procedure setGeodesic
                                        (geodesic: Boolean); cdecl;
                                        function isGeodesic: Boolean; cdecl;
                                        procedure setSegmentCount
                                        (segmentCount: NSInteger); cdecl;
                                        function segmentCount: NSInteger; cdecl;
                                        end;

                                        TSCNSphere = class
                                        (TOCGenericImport<SCNSphereClass,
                                        SCNSphere>)
                                        end;
                                        PSCNSphere = Pointer;

                                        SCNCylinderClass = interface
                                        (SCNGeometryClass)
                                        ['{1C8ED67F-82A2-404D-AFDB-550F9A32B539}']
                                        { class } function cylinderWithRadius
                                        (radius: CGFloat; height: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNCylinder = interface(SCNGeometry)
                                        ['{0AD90A56-DDC0-487B-8F8F-99A9305A998F}']
                                        procedure setRadius(radius: CGFloat);
                                        cdecl;
                                        function radius: CGFloat; cdecl;
                                        procedure setHeight
                                        (height: CGFloat); cdecl;
                                        function height: CGFloat; cdecl;
                                        procedure setRadialSegmentCount
                                        (radialSegmentCount: NSInteger); cdecl;
                                        function radialSegmentCount
                                        : NSInteger; cdecl;
                                        procedure setHeightSegmentCount
                                        (heightSegmentCount: NSInteger); cdecl;
                                        function heightSegmentCount
                                        : NSInteger; cdecl;
                                        end;

                                        TSCNCylinder = class
                                        (TOCGenericImport<SCNCylinderClass,
                                        SCNCylinder>)
                                        end;
                                        PSCNCylinder = Pointer;

                                        SCNConeClass = interface
                                        (SCNGeometryClass)
                                        ['{C57AB513-EA98-44CC-A729-DC08F2C85DAD}']
                                        { class } function coneWithTopRadius
                                        (topRadius: CGFloat;
                                        bottomRadius: CGFloat; height: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNCone = interface(SCNGeometry)
                                        ['{1CEAFFA1-5DE2-471E-818D-468F8E09BC90}']
                                        procedure setTopRadius
                                        (topRadius: CGFloat);
                                        cdecl;
                                        function topRadius: CGFloat; cdecl;
                                        procedure setBottomRadius
                                        (bottomRadius: CGFloat); cdecl;
                                        function bottomRadius: CGFloat; cdecl;
                                        procedure setHeight
                                        (height: CGFloat); cdecl;
                                        function height: CGFloat; cdecl;
                                        procedure setRadialSegmentCount
                                        (radialSegmentCount: NSInteger); cdecl;
                                        function radialSegmentCount
                                        : NSInteger; cdecl;
                                        procedure setHeightSegmentCount
                                        (heightSegmentCount: NSInteger); cdecl;
                                        function heightSegmentCount
                                        : NSInteger; cdecl;
                                        end;

                                        TSCNCone = class
                                        (TOCGenericImport<
                                        SCNConeClass, SCNCone>)
                                        end;
                                        PSCNCone = Pointer;

                                        SCNTubeClass = interface
                                        (SCNGeometryClass)
                                        ['{38028430-4C1B-45AD-85ED-FDD49B66FC7A}']
                                        { class } function tubeWithInnerRadius
                                        (innerRadius: CGFloat;
                                        outerRadius: CGFloat; height: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNTube = interface(SCNGeometry)
                                        ['{79B9E247-16A2-413C-A965-9D12EEF3F97B}']
                                        procedure setInnerRadius
                                        (innerRadius: CGFloat);
                                        cdecl;
                                        function innerRadius: CGFloat; cdecl;
                                        procedure setOuterRadius
                                        (outerRadius: CGFloat); cdecl;
                                        function outerRadius: CGFloat; cdecl;
                                        procedure setHeight
                                        (height: CGFloat); cdecl;
                                        function height: CGFloat; cdecl;
                                        procedure setRadialSegmentCount
                                        (radialSegmentCount: NSInteger); cdecl;
                                        function radialSegmentCount
                                        : NSInteger; cdecl;
                                        procedure setHeightSegmentCount
                                        (heightSegmentCount: NSInteger); cdecl;
                                        function heightSegmentCount
                                        : NSInteger; cdecl;
                                        end;

                                        TSCNTube = class
                                        (TOCGenericImport<
                                        SCNTubeClass, SCNTube>)
                                        end;
                                        PSCNTube = Pointer;

                                        SCNCapsuleClass = interface
                                        (SCNGeometryClass)
                                        ['{4837AB7D-67A0-4DAE-8739-85AEEBFD9F18}']
                                        { class } function capsuleWithCapRadius
                                        (capRadius: CGFloat; height: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNCapsule = interface(SCNGeometry)
                                        ['{78FCDD38-1509-4BE7-AE69-E0AD63AB98D4}']
                                        procedure setCapRadius
                                        (capRadius: CGFloat);
                                        cdecl;
                                        function capRadius: CGFloat; cdecl;
                                        procedure setHeight
                                        (height: CGFloat); cdecl;
                                        function height: CGFloat; cdecl;
                                        procedure setRadialSegmentCount
                                        (radialSegmentCount: NSInteger); cdecl;
                                        function radialSegmentCount
                                        : NSInteger; cdecl;
                                        procedure setHeightSegmentCount
                                        (heightSegmentCount: NSInteger); cdecl;
                                        function heightSegmentCount
                                        : NSInteger; cdecl;
                                        procedure setCapSegmentCount
                                        (capSegmentCount: NSInteger); cdecl;
                                        function capSegmentCount
                                        : NSInteger; cdecl;
                                        end;

                                        TSCNCapsule = class
                                        (TOCGenericImport<SCNCapsuleClass,
                                        SCNCapsule>)
                                        end;
                                        PSCNCapsule = Pointer;

                                        SCNTorusClass = interface
                                        (SCNGeometryClass)
                                        ['{00A53B2F-C1A6-4411-9424-5334259508C1}']
                                        { class } function torusWithRingRadius
                                        (ringRadius: CGFloat;
                                        pipeRadius: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNTorus = interface(SCNGeometry)
                                        ['{732F5A70-1877-461C-B977-057B0E5FF5D2}']
                                        procedure setRingRadius
                                        (ringRadius: CGFloat);
                                        cdecl;
                                        function ringRadius: CGFloat; cdecl;
                                        procedure setPipeRadius
                                        (pipeRadius: CGFloat); cdecl;
                                        function pipeRadius: CGFloat; cdecl;
                                        procedure setRingSegmentCount
                                        (ringSegmentCount: NSInteger); cdecl;
                                        function ringSegmentCount
                                        : NSInteger; cdecl;
                                        procedure setPipeSegmentCount
                                        (pipeSegmentCount: NSInteger); cdecl;
                                        function pipeSegmentCount
                                        : NSInteger; cdecl;
                                        end;

                                        TSCNTorus = class
                                        (TOCGenericImport<SCNTorusClass,
                                        SCNTorus>)
                                        end;
                                        PSCNTorus = Pointer;

                                        SCNFloorClass = interface
                                        (SCNGeometryClass)
                                        ['{0DEF938E-27D9-4FCF-A660-84058160C764}']
                                        { class } function floor
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNFloor = interface(SCNGeometry)
                                        ['{68475119-4DD1-4FF6-AD3D-56C475147CC3}']
                                        procedure setReflectivity
                                        (reflectivity: CGFloat);
                                        cdecl;
                                        function reflectivity: CGFloat; cdecl;
                                        procedure setReflectionFalloffStart
                                        (reflectionFalloffStart
                                        : CGFloat); cdecl;
                                        function reflectionFalloffStart
                                        : CGFloat; cdecl;
                                        procedure setReflectionFalloffEnd
                                        (reflectionFalloffEnd: CGFloat); cdecl;
                                        function reflectionFalloffEnd
                                        : CGFloat; cdecl;
                                        procedure setReflectionResolutionScaleFactor
                                        (reflectionResolutionScaleFactor
                                        : CGFloat); cdecl;
                                        function reflectionResolutionScaleFactor
                                        : CGFloat; cdecl;
                                        end;

                                        TSCNFloor = class
                                        (TOCGenericImport<SCNFloorClass,
                                        SCNFloor>)
                                        end;
                                        PSCNFloor = Pointer;

                                        SCNTextClass = interface
                                        (SCNGeometryClass)
                                        ['{F9B68AB9-7277-43BA-BBA3-CF2ECF8EEAAB}']
                                        { class } function textWithString
                                        (&string: Pointer;
                                        extrusionDepth: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNText = interface(SCNGeometry)
                                        ['{913DEE74-D7C1-4657-BAAE-7ED3583033CC}']
                                        procedure setExtrusionDepth
                                        (extrusionDepth: CGFloat);
                                        cdecl;
                                        function extrusionDepth: CGFloat; cdecl;
                                        procedure setString
                                        (&string: Pointer); cdecl;
                                        function &string: Pointer; cdecl;
                                        procedure setFont(font: UIFont); cdecl;
                                        function font: UIFont; cdecl;
                                        procedure setWrapped
                                        (wrapped: Boolean); cdecl;
                                        function isWrapped: Boolean; cdecl;
                                        procedure setContainerFrame
                                        (containerFrame: CGRect); cdecl;
                                        function containerFrame: CGRect; cdecl;
                                        procedure setTruncationMode
                                        (truncationMode: NSString); cdecl;
                                        function truncationMode
                                        : NSString; cdecl;
                                        procedure setAlignmentMode
                                        (alignmentMode: NSString); cdecl;
                                        function alignmentMode: NSString; cdecl;
                                        procedure setChamferRadius
                                        (chamferRadius: CGFloat); cdecl;
                                        function chamferRadius: CGFloat; cdecl;
                                        procedure setChamferProfile
                                        (chamferProfile: UIBezierPath); cdecl;
                                        function chamferProfile
                                        : UIBezierPath; cdecl;
                                        procedure setFlatness
                                        (flatness: CGFloat); cdecl;
                                        function flatness: CGFloat; cdecl;
                                        end;

                                        TSCNText = class
                                        (TOCGenericImport<
                                        SCNTextClass, SCNText>)
                                        end;
                                        PSCNText = Pointer;

                                        SCNShapeClass = interface
                                        (SCNGeometryClass)
                                        ['{DEA55730-191F-4A23-B690-65FEB2BEA8F6}']
                                        { class } function shapeWithPath
                                        (path: UIBezierPath;
                                        extrusionDepth: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNShape = interface(SCNGeometry)
                                        ['{CC18C4CC-8F17-4450-A27A-4448DB437331}']
                                        procedure setPath(path: UIBezierPath);
                                        cdecl;
                                        function path: UIBezierPath; cdecl;
                                        procedure setExtrusionDepth
                                        (extrusionDepth: CGFloat); cdecl;
                                        function extrusionDepth: CGFloat; cdecl;
                                        procedure setChamferMode
                                        (chamferMode: SCNChamferMode); cdecl;
                                        function chamferMode
                                        : SCNChamferMode; cdecl;
                                        procedure setChamferRadius
                                        (chamferRadius: CGFloat); cdecl;
                                        function chamferRadius: CGFloat; cdecl;
                                        procedure setChamferProfile
                                        (chamferProfile: UIBezierPath); cdecl;
                                        function chamferProfile
                                        : UIBezierPath; cdecl;
                                        end;

                                        TSCNShape = class
                                        (TOCGenericImport<SCNShapeClass,
                                        SCNShape>)
                                        end;
                                        PSCNShape = Pointer;

                                        SCNTransactionClass = interface
                                        (NSObjectClass)
                                        ['{1960BF5E-AF4C-4F91-A535-930AC74C11C0}']
                                        { class } procedure &begin;
                                        cdecl;
                                        { class } procedure commit; cdecl;
                                        { class } procedure flush; cdecl;
                                        { class } procedure lock; cdecl;
                                        { class } procedure unlock; cdecl;
                                        { class } function animationDuration
                                        : CFTimeInterval; cdecl;
                                        { class } procedure setAnimationDuration
                                        (duration: CFTimeInterval); cdecl;
                                        { class } function
                                        animationTimingFunction
                                        : CAMediaTimingFunction; cdecl;
                                        { class } procedure
                                        setAnimationTimingFunction
                                        (animationTimingFunction
                                        : CAMediaTimingFunction); cdecl;
                                        { class } function disableActions
                                        : Boolean; cdecl;
                                        { class } procedure setDisableActions
                                        (flag: Boolean); cdecl;
                                        { class } function completionBlock
                                        : TSceneKitCompletionHandler; cdecl;
                                        { class } procedure setCompletionBlock
                                        (block: TSceneKitCompletionHandler);
                                        cdecl;
                                        { class } function valueForKey
                                        (key: NSString): Pointer; cdecl;
                                        { class } procedure setValue
                                        (value: Pointer;
                                        forKey: NSString); cdecl;
                                        end;
                                        SCNTransaction = interface(NSObject)
                                        ['{5903F322-121A-4580-BD24-383F74D330F8}']
                                        end;

                                        TSCNTransaction = class
                                        (TOCGenericImport<SCNTransactionClass,
                                        SCNTransaction>)
                                        end;
                                        PSCNTransaction = Pointer;

                                        SCNLookAtConstraintClass = interface
                                        (SCNConstraintClass)
                                        ['{3F237350-9B17-433B-8DDB-92567227A400}']
                                        { class } function
                                        lookAtConstraintWithTarget
                                        (target: SCNNode)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNLookAtConstraint = interface
                                        (SCNConstraint)
                                        ['{D46EC27A-4292-453F-A6A5-23547BF45DCA}']
                                        function target: SCNNode;
                                        cdecl;
                                        procedure setGimbalLockEnabled
                                        (gimbalLockEnabled: Boolean); cdecl;
                                        function gimbalLockEnabled
                                        : Boolean; cdecl;
                                        end;

                                        TSCNLookAtConstraint = class
                                        (TOCGenericImport<
                                        SCNLookAtConstraintClass,
                                        SCNLookAtConstraint>)
                                        end;
                                        PSCNLookAtConstraint = Pointer;

                                        SCNBillboardConstraintClass = interface
                                        (SCNConstraintClass)
                                        ['{877BD853-D98C-41EA-87BF-28149427377E}']
                                        { class } function billboardConstraint
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNBillboardConstraint = interface
                                        (SCNConstraint)
                                        ['{C557402B-7A5C-46A4-BDD4-F1C8AFA436F9}']
                                        procedure setFreeAxes
                                        (freeAxes: SCNBillboardAxis);
                                        cdecl;
                                        function freeAxes
                                        : SCNBillboardAxis; cdecl;
                                        end;

                                        TSCNBillboardConstraint = class
                                        (TOCGenericImport<
                                        SCNBillboardConstraintClass,
                                        SCNBillboardConstraint>)
                                        end;
                                        PSCNBillboardConstraint = Pointer;

                                        SCNTransformConstraintClass = interface
                                        (SCNConstraintClass)
                                        ['{EFBA01D7-CE8C-48B4-A058-067F2999A3CB}']
                                        { class } function
                                        transformConstraintInWorldSpace
                                        (world: Boolean;
                                        withBlock: TSceneKitWithBlock)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNTransformConstraint = interface
                                        (SCNConstraint)
                                        ['{518A78D3-23B0-4E91-84F0-162209F6983F}']
                                        end;

                                        TSCNTransformConstraint = class
                                        (TOCGenericImport<
                                        SCNTransformConstraintClass,
                                        SCNTransformConstraint>)
                                        end;
                                        PSCNTransformConstraint = Pointer;

                                        SCNIKConstraintClass = interface
                                        (SCNConstraintClass)
                                        ['{E0746456-8912-49A6-9635-4A5C74AF6CD6}']
                                        { class } function
                                        inverseKinematicsConstraintWithChainRootNode
                                        (chainRootNode: SCNNode)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNIKConstraint = interface
                                        (SCNConstraint)
                                        ['{03E0CFD8-4FD4-4960-B562-84178A971898}']
                                        function initWithChainRootNode
                                        (chainRootNode: SCNNode)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function chainRootNode: SCNNode; cdecl;
                                        procedure setTargetPosition
                                        (targetPosition: SCNVector3); cdecl;
                                        function targetPosition
                                        : SCNVector3; cdecl;
                                        procedure setMaxAllowedRotationAngle
                                        (angle: CGFloat;
                                        forJoint: SCNNode); cdecl;
                                        function maxAllowedRotationAngleForJoint
                                        (node: SCNNode): CGFloat; cdecl;
                                        end;

                                        TSCNIKConstraint = class
                                        (TOCGenericImport<SCNIKConstraintClass,
                                        SCNIKConstraint>)
                                        end;
                                        PSCNIKConstraint = Pointer;

                                        SCNParticlePropertyControllerClass =
                                        interface(NSObjectClass)
                                        ['{0BAFF8B9-B1E7-459F-AD5B-9F3BFBC4CABF}']
                                        { class } function
                                        controllerWithAnimation
                                        (animation: CAAnimation)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNParticlePropertyController =
                                        interface(NSObject)
                                        ['{A8E7DA51-8EF3-4D24-93D1-3C4904FF820A}']
                                        procedure setAnimation
                                        (animation: CAAnimation);
                                        cdecl;
                                        function animation: CAAnimation; cdecl;
                                        procedure setInputMode
                                        (inputMode
                                        : SCNParticleInputMode); cdecl;
                                        function inputMode
                                        : SCNParticleInputMode; cdecl;
                                        procedure setInputScale
                                        (inputScale: CGFloat); cdecl;
                                        function inputScale: CGFloat; cdecl;
                                        procedure setInputBias
                                        (inputBias: CGFloat); cdecl;
                                        function inputBias: CGFloat; cdecl;
                                        procedure setInputOrigin
                                        (inputOrigin: SCNNode); cdecl;
                                        function inputOrigin: SCNNode; cdecl;
                                        procedure setInputProperty
                                        (inputProperty: NSString); cdecl;
                                        function inputProperty: NSString; cdecl;
                                        end;

                                        TSCNParticlePropertyController = class
                                        (TOCGenericImport<
                                        SCNParticlePropertyControllerClass,
                                        SCNParticlePropertyController>)
                                        end;
                                        PSCNParticlePropertyController =
                                        Pointer;

                                        SCNParticleSystemClass = interface
                                        (NSObjectClass)
                                        ['{BD9613DD-F04B-4FD4-85F8-11B122F7E081}']
                                        { class } function particleSystem
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function particleSystemNamed
                                        (name: NSString; inDirectory: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SCNParticleSystem = interface(NSObject)
                                        ['{2734B8F3-B1AD-4CB6-AD80-25C4FC87164E}']
                                        procedure setEmissionDuration
                                        (emissionDuration: CGFloat);
                                        cdecl;
                                        function emissionDuration
                                        : CGFloat; cdecl;
                                        procedure setEmissionDurationVariation
                                        (emissionDurationVariation
                                        : CGFloat); cdecl;
                                        function emissionDurationVariation
                                        : CGFloat; cdecl;
                                        procedure setIdleDuration
                                        (idleDuration: CGFloat); cdecl;
                                        function idleDuration: CGFloat; cdecl;
                                        procedure setIdleDurationVariation
                                        (idleDurationVariation: CGFloat); cdecl;
                                        function idleDurationVariation
                                        : CGFloat; cdecl;
                                        procedure setLoops
                                        (loops: Boolean); cdecl;
                                        function loops: Boolean; cdecl;
                                        procedure setBirthRate
                                        (birthRate: CGFloat); cdecl;
                                        function birthRate: CGFloat; cdecl;
                                        procedure setBirthRateVariation
                                        (birthRateVariation: CGFloat); cdecl;
                                        function birthRateVariation
                                        : CGFloat; cdecl;
                                        procedure setWarmupDuration
                                        (warmupDuration: CGFloat); cdecl;
                                        function warmupDuration: CGFloat; cdecl;
                                        procedure setEmitterShape
                                        (emitterShape: SCNGeometry); cdecl;
                                        function emitterShape
                                        : SCNGeometry; cdecl;
                                        procedure setBirthLocation
                                        (birthLocation
                                        : SCNParticleBirthLocation); cdecl;
                                        function birthLocation
                                        : SCNParticleBirthLocation; cdecl;
                                        procedure setBirthDirection
                                        (birthDirection
                                        : SCNParticleBirthDirection); cdecl;
                                        function birthDirection
                                        : SCNParticleBirthDirection; cdecl;
                                        procedure setSpreadingAngle
                                        (spreadingAngle: CGFloat); cdecl;
                                        function spreadingAngle: CGFloat; cdecl;
                                        procedure setEmittingDirection
                                        (emittingDirection: SCNVector3); cdecl;
                                        function emittingDirection
                                        : SCNVector3; cdecl;
                                        procedure setAcceleration
                                        (acceleration: SCNVector3); cdecl;
                                        function acceleration
                                        : SCNVector3; cdecl;
                                        procedure setLocal
                                        (local: Boolean); cdecl;
                                        function isLocal: Boolean; cdecl;
                                        procedure setParticleAngle
                                        (particleAngle: CGFloat); cdecl;
                                        function particleAngle: CGFloat; cdecl;
                                        procedure setParticleAngleVariation
                                        (particleAngleVariation
                                        : CGFloat); cdecl;
                                        function particleAngleVariation
                                        : CGFloat; cdecl;
                                        procedure setParticleVelocity
                                        (particleVelocity: CGFloat); cdecl;
                                        function particleVelocity
                                        : CGFloat; cdecl;
                                        procedure setParticleVelocityVariation
                                        (particleVelocityVariation
                                        : CGFloat); cdecl;
                                        function particleVelocityVariation
                                        : CGFloat; cdecl;
                                        procedure setParticleAngularVelocity
                                        (particleAngularVelocity
                                        : CGFloat); cdecl;
                                        function particleAngularVelocity
                                        : CGFloat; cdecl;
                                        procedure setParticleAngularVelocityVariation
                                        (particleAngularVelocityVariation
                                        : CGFloat); cdecl;
                                        function particleAngularVelocityVariation
                                        : CGFloat; cdecl;
                                        procedure setParticleLifeSpan
                                        (particleLifeSpan: CGFloat); cdecl;
                                        function particleLifeSpan
                                        : CGFloat; cdecl;
                                        procedure setParticleLifeSpanVariation
                                        (particleLifeSpanVariation
                                        : CGFloat); cdecl;
                                        function particleLifeSpanVariation
                                        : CGFloat; cdecl;
                                        procedure setSystemSpawnedOnDying
                                        (systemSpawnedOnDying
                                        : SCNParticleSystem); cdecl;
                                        function systemSpawnedOnDying
                                        : SCNParticleSystem; cdecl;
                                        procedure setSystemSpawnedOnCollision
                                        (systemSpawnedOnCollision
                                        : SCNParticleSystem); cdecl;
                                        function systemSpawnedOnCollision
                                        : SCNParticleSystem; cdecl;
                                        procedure setSystemSpawnedOnLiving
                                        (systemSpawnedOnLiving
                                        : SCNParticleSystem); cdecl;
                                        function systemSpawnedOnLiving
                                        : SCNParticleSystem; cdecl;
                                        procedure setParticleImage
                                        (particleImage: Pointer); cdecl;
                                        function particleImage: Pointer; cdecl;
                                        procedure setImageSequenceColumnCount
                                        (imageSequenceColumnCount
                                        : NSUInteger); cdecl;
                                        function imageSequenceColumnCount
                                        : NSUInteger; cdecl;
                                        procedure setImageSequenceRowCount
                                        (imageSequenceRowCount
                                        : NSUInteger); cdecl;
                                        function imageSequenceRowCount
                                        : NSUInteger; cdecl;
                                        procedure setImageSequenceInitialFrame
                                        (imageSequenceInitialFrame
                                        : CGFloat); cdecl;
                                        function imageSequenceInitialFrame
                                        : CGFloat; cdecl;
                                        procedure setImageSequenceInitialFrameVariation
                                        (imageSequenceInitialFrameVariation
                                        : CGFloat); cdecl;
                                        function imageSequenceInitialFrameVariation
                                        : CGFloat; cdecl;
                                        procedure setImageSequenceFrameRate
                                        (imageSequenceFrameRate
                                        : CGFloat); cdecl;
                                        function imageSequenceFrameRate
                                        : CGFloat; cdecl;
                                        procedure setImageSequenceFrameRateVariation
                                        (imageSequenceFrameRateVariation
                                        : CGFloat); cdecl;
                                        function imageSequenceFrameRateVariation
                                        : CGFloat; cdecl;
                                        procedure setImageSequenceAnimationMode
                                        (imageSequenceAnimationMode
                                        : SCNParticleImageSequenceAnimationMode);
                                        cdecl;
                                        function imageSequenceAnimationMode
                                        : SCNParticleImageSequenceAnimationMode;
                                        cdecl;
                                        procedure setParticleColor
                                        (particleColor: UIColor); cdecl;
                                        function particleColor: UIColor; cdecl;
                                        procedure setParticleColorVariation
                                        (particleColorVariation
                                        : SCNVector4); cdecl;
                                        function particleColorVariation
                                        : SCNVector4; cdecl;
                                        procedure setParticleSize
                                        (particleSize: CGFloat); cdecl;
                                        function particleSize: CGFloat; cdecl;
                                        procedure setParticleSizeVariation
                                        (particleSizeVariation: CGFloat); cdecl;
                                        function particleSizeVariation
                                        : CGFloat; cdecl;
                                        procedure setBlendMode
                                        (blendMode
                                        : SCNParticleBlendMode); cdecl;
                                        function blendMode
                                        : SCNParticleBlendMode; cdecl;
                                        procedure setBlackPassEnabled
                                        (blackPassEnabled: Boolean); cdecl;
                                        function isBlackPassEnabled
                                        : Boolean; cdecl;
                                        procedure setOrientationMode
                                        (orientationMode
                                        : SCNParticleOrientationMode); cdecl;
                                        function orientationMode
                                        : SCNParticleOrientationMode; cdecl;
                                        procedure setSortingMode
                                        (sortingMode
                                        : SCNParticleSortingMode); cdecl;
                                        function sortingMode
                                        : SCNParticleSortingMode; cdecl;
                                        procedure setLightingEnabled
                                        (lightingEnabled: Boolean); cdecl;
                                        function isLightingEnabled
                                        : Boolean; cdecl;
                                        procedure setAffectedByGravity
                                        (affectedByGravity: Boolean); cdecl;
                                        function affectedByGravity
                                        : Boolean; cdecl;
                                        procedure setAffectedByPhysicsFields
                                        (affectedByPhysicsFields
                                        : Boolean); cdecl;
                                        function affectedByPhysicsFields
                                        : Boolean; cdecl;
                                        procedure setParticleDiesOnCollision
                                        (particleDiesOnCollision
                                        : Boolean); cdecl;
                                        function particleDiesOnCollision
                                        : Boolean; cdecl;
                                        procedure setColliderNodes
                                        (colliderNodes: NSArray); cdecl;
                                        function colliderNodes: NSArray; cdecl;
                                        procedure setParticleMass
                                        (particleMass: CGFloat); cdecl;
                                        function particleMass: CGFloat; cdecl;
                                        procedure setParticleMassVariation
                                        (particleMassVariation: CGFloat); cdecl;
                                        function particleMassVariation
                                        : CGFloat; cdecl;
                                        procedure setParticleBounce
                                        (particleBounce: CGFloat); cdecl;
                                        function particleBounce: CGFloat; cdecl;
                                        procedure setParticleBounceVariation
                                        (particleBounceVariation
                                        : CGFloat); cdecl;
                                        function particleBounceVariation
                                        : CGFloat; cdecl;
                                        procedure setParticleFriction
                                        (particleFriction: CGFloat); cdecl;
                                        function particleFriction
                                        : CGFloat; cdecl;
                                        procedure setParticleFrictionVariation
                                        (particleFrictionVariation
                                        : CGFloat); cdecl;
                                        function particleFrictionVariation
                                        : CGFloat; cdecl;
                                        procedure setParticleCharge
                                        (particleCharge: CGFloat); cdecl;
                                        function particleCharge: CGFloat; cdecl;
                                        procedure setParticleChargeVariation
                                        (particleChargeVariation
                                        : CGFloat); cdecl;
                                        function particleChargeVariation
                                        : CGFloat; cdecl;
                                        procedure setDampingFactor
                                        (dampingFactor: CGFloat); cdecl;
                                        function dampingFactor: CGFloat; cdecl;
                                        procedure setSpeedFactor
                                        (speedFactor: CGFloat); cdecl;
                                        function speedFactor: CGFloat; cdecl;
                                        procedure setStretchFactor
                                        (stretchFactor: CGFloat); cdecl;
                                        function stretchFactor: CGFloat; cdecl;
                                        procedure setFresnelExponent
                                        (fresnelExponent: CGFloat); cdecl;
                                        function fresnelExponent
                                        : CGFloat; cdecl;
                                        procedure setPropertyControllers
                                        (propertyControllers
                                        : NSDictionary); cdecl;
                                        function propertyControllers
                                        : NSDictionary; cdecl;
                                        procedure reset; cdecl;
                                        procedure handleEvent
                                        (event: SCNParticleEvent;
                                        forProperties: NSArray;
                                        withBlock:
                                        SCNParticleEventBlock); cdecl;
                                        procedure addModifierForProperties
                                        (properties: NSArray;
                                        atStage: SCNParticleModifierStage;
                                        withBlock:
                                        SCNParticleModifierBlock); cdecl;
                                        procedure removeModifiersOfStage
                                        (stage: SCNParticleModifierStage);
                                        cdecl;
                                        procedure removeAllModifiers; cdecl;
                                        end;

                                        TSCNParticleSystem = class
                                        (TOCGenericImport<
                                        SCNParticleSystemClass,
                                        SCNParticleSystem>)
                                        end;
                                        PSCNParticleSystem = Pointer;

                                        SCNPhysicsShapeClass = interface
                                        (NSObjectClass)
                                        ['{D5CE862D-FD76-4DBE-A22C-4918C80E5367}']
                                        { class } function shapeWithGeometry
                                        (geometry: SCNGeometry;
                                        options: NSDictionary)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function shapeWithNode
                                        (node: SCNNode; options: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function shapeWithShapes
                                        (shapes: NSArray; transforms: NSArray)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SCNPhysicsShape = interface(NSObject)
                                        ['{BEF2277A-79D2-49D0-8D99-EE4EFC247ACC}']
                                        function options: NSDictionary;
                                        cdecl;
                                        function sourceObject: Pointer; cdecl;
                                        function transforms: NSArray; cdecl;
                                        end;

                                        TSCNPhysicsShape = class
                                        (TOCGenericImport<SCNPhysicsShapeClass,
                                        SCNPhysicsShape>)
                                        end;
                                        PSCNPhysicsShape = Pointer;

                                        SCNPhysicsContactClass = interface
                                        (NSObjectClass)
                                        ['{12892A34-193E-4780-AB27-01385B3EC02E}']
                                        end;
                                        SCNPhysicsContact = interface(NSObject)
                                        ['{DD204DCF-D7D9-4363-AE7E-989551112449}']
                                        function nodeA: SCNNode;
                                        cdecl;
                                        function nodeB: SCNNode; cdecl;
                                        function contactPoint
                                        : SCNVector3; cdecl;
                                        function contactNormal
                                        : SCNVector3; cdecl;
                                        function collisionImpulse
                                        : CGFloat; cdecl;
                                        function penetrationDistance
                                        : CGFloat; cdecl;
                                        end;

                                        TSCNPhysicsContact = class
                                        (TOCGenericImport<
                                        SCNPhysicsContactClass,
                                        SCNPhysicsContact>)
                                        end;
                                        PSCNPhysicsContact = Pointer;

                                        SCNPhysicsBehaviorClass = interface
                                        (NSObjectClass)
                                        ['{FCE8F308-080D-4420-AE6E-F0A3244B64E9}']
                                        end;
                                        SCNPhysicsBehavior = interface(NSObject)
                                        ['{F3778FC1-F346-4753-A27B-7A5A4C66BE2D}']
                                        end;

                                        TSCNPhysicsBehavior = class
                                        (TOCGenericImport<
                                        SCNPhysicsBehaviorClass,
                                        SCNPhysicsBehavior>)
                                        end;
                                        PSCNPhysicsBehavior = Pointer;

                                        SCNPhysicsHingeJointClass = interface
                                        (SCNPhysicsBehaviorClass)
                                        ['{C50D058E-0819-482D-950B-52878B564633}']
                                        { class } function jointWithBodyA
                                        (bodyA: SCNPhysicsBody;
                                        axisA: SCNVector3; anchorA: SCNVector3;
                                        bodyB: SCNPhysicsBody;
                                        axisB: SCNVector3; anchorB: SCNVector3)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function jointWithBody
                                        (body: SCNPhysicsBody; axis: SCNVector3;
                                        anchor: SCNVector3)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SCNPhysicsHingeJoint = interface
                                        (SCNPhysicsBehavior)
                                        ['{4F71F075-2650-4120-8DE4-B471FFF0A9C7}']
                                        function bodyA: SCNPhysicsBody;
                                        cdecl;
                                        procedure setAxisA
                                        (axisA: SCNVector3); cdecl;
                                        function axisA: SCNVector3; cdecl;
                                        procedure setAnchorA
                                        (anchorA: SCNVector3); cdecl;
                                        function anchorA: SCNVector3; cdecl;
                                        function bodyB: SCNPhysicsBody; cdecl;
                                        procedure setAxisB
                                        (axisB: SCNVector3); cdecl;
                                        function axisB: SCNVector3; cdecl;
                                        procedure setAnchorB
                                        (anchorB: SCNVector3); cdecl;
                                        function anchorB: SCNVector3; cdecl;
                                        end;

                                        TSCNPhysicsHingeJoint = class
                                        (TOCGenericImport<
                                        SCNPhysicsHingeJointClass,
                                        SCNPhysicsHingeJoint>)
                                        end;
                                        PSCNPhysicsHingeJoint = Pointer;

                                        SCNPhysicsBallSocketJointClass =
                                        interface(SCNPhysicsBehaviorClass)
                                        ['{C6410D54-30AA-4053-A86F-84DD6265C7C2}']
                                        { class } function jointWithBodyA
                                        (bodyA: SCNPhysicsBody;
                                        anchorA: SCNVector3;
                                        bodyB: SCNPhysicsBody;
                                        anchorB: SCNVector3)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function jointWithBody
                                        (body: SCNPhysicsBody;
                                        anchor: SCNVector3)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SCNPhysicsBallSocketJoint = interface
                                        (SCNPhysicsBehavior)
                                        ['{DE16A030-F444-4A75-BC71-46188D796DBB}']
                                        function bodyA: SCNPhysicsBody;
                                        cdecl;
                                        procedure setAnchorA
                                        (anchorA: SCNVector3); cdecl;
                                        function anchorA: SCNVector3; cdecl;
                                        function bodyB: SCNPhysicsBody; cdecl;
                                        procedure setAnchorB
                                        (anchorB: SCNVector3); cdecl;
                                        function anchorB: SCNVector3; cdecl;
                                        end;

                                        TSCNPhysicsBallSocketJoint = class
                                        (TOCGenericImport<
                                        SCNPhysicsBallSocketJointClass,
                                        SCNPhysicsBallSocketJoint>)
                                        end;
                                        PSCNPhysicsBallSocketJoint = Pointer;

                                        SCNPhysicsSliderJointClass = interface
                                        (SCNPhysicsBehaviorClass)
                                        ['{1B37DAEB-758D-4ADA-BD86-69E4A1606AC2}']
                                        { class } function jointWithBodyA
                                        (bodyA: SCNPhysicsBody;
                                        axisA: SCNVector3; anchorA: SCNVector3;
                                        bodyB: SCNPhysicsBody;
                                        axisB: SCNVector3; anchorB: SCNVector3)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function jointWithBody
                                        (body: SCNPhysicsBody; axis: SCNVector3;
                                        anchor: SCNVector3)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SCNPhysicsSliderJoint = interface
                                        (SCNPhysicsBehavior)
                                        ['{1E29C932-2D36-4B1A-9167-9D778E55ED5A}']
                                        function bodyA: SCNPhysicsBody;
                                        cdecl;
                                        procedure setAxisA
                                        (axisA: SCNVector3); cdecl;
                                        function axisA: SCNVector3; cdecl;
                                        procedure setAnchorA
                                        (anchorA: SCNVector3); cdecl;
                                        function anchorA: SCNVector3; cdecl;
                                        function bodyB: SCNPhysicsBody; cdecl;
                                        procedure setAxisB
                                        (axisB: SCNVector3); cdecl;
                                        function axisB: SCNVector3; cdecl;
                                        procedure setAnchorB
                                        (anchorB: SCNVector3); cdecl;
                                        function anchorB: SCNVector3; cdecl;
                                        procedure setMinimumLinearLimit
                                        (minimumLinearLimit: CGFloat); cdecl;
                                        function minimumLinearLimit
                                        : CGFloat; cdecl;
                                        procedure setMaximumLinearLimit
                                        (maximumLinearLimit: CGFloat); cdecl;
                                        function maximumLinearLimit
                                        : CGFloat; cdecl;
                                        procedure setMinimumAngularLimit
                                        (minimumAngularLimit: CGFloat); cdecl;
                                        function minimumAngularLimit
                                        : CGFloat; cdecl;
                                        procedure setMaximumAngularLimit
                                        (maximumAngularLimit: CGFloat); cdecl;
                                        function maximumAngularLimit
                                        : CGFloat; cdecl;
                                        procedure setMotorTargetLinearVelocity
                                        (motorTargetLinearVelocity
                                        : CGFloat); cdecl;
                                        function motorTargetLinearVelocity
                                        : CGFloat; cdecl;
                                        procedure setMotorMaximumForce
                                        (motorMaximumForce: CGFloat); cdecl;
                                        function motorMaximumForce
                                        : CGFloat; cdecl;
                                        procedure setMotorTargetAngularVelocity
                                        (motorTargetAngularVelocity
                                        : CGFloat); cdecl;
                                        function motorTargetAngularVelocity
                                        : CGFloat; cdecl;
                                        procedure setMotorMaximumTorque
                                        (motorMaximumTorque: CGFloat); cdecl;
                                        function motorMaximumTorque
                                        : CGFloat; cdecl;
                                        end;

                                        TSCNPhysicsSliderJoint = class
                                        (TOCGenericImport<
                                        SCNPhysicsSliderJointClass,
                                        SCNPhysicsSliderJoint>)
                                        end;
                                        PSCNPhysicsSliderJoint = Pointer;

                                        SCNPhysicsVehicleWheelClass = interface
                                        (NSObjectClass)
                                        ['{66903BF3-0821-4183-9F1D-E596690A8D80}']
                                        { class } function wheelWithNode
                                        (node: SCNNode)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNPhysicsVehicleWheel = interface
                                        (NSObject)
                                        ['{9FD84E47-326A-407D-A1BB-F47D116FB07D}']
                                        function node: SCNNode;
                                        cdecl;
                                        procedure setSuspensionStiffness
                                        (suspensionStiffness: CGFloat); cdecl;
                                        function suspensionStiffness
                                        : CGFloat; cdecl;
                                        procedure setSuspensionCompression
                                        (suspensionCompression: CGFloat); cdecl;
                                        function suspensionCompression
                                        : CGFloat; cdecl;
                                        procedure setSuspensionDamping
                                        (suspensionDamping: CGFloat); cdecl;
                                        function suspensionDamping
                                        : CGFloat; cdecl;
                                        procedure setMaximumSuspensionTravel
                                        (maximumSuspensionTravel
                                        : CGFloat); cdecl;
                                        function maximumSuspensionTravel
                                        : CGFloat; cdecl;
                                        procedure setFrictionSlip
                                        (frictionSlip: CGFloat); cdecl;
                                        function frictionSlip: CGFloat; cdecl;
                                        procedure setMaximumSuspensionForce
                                        (maximumSuspensionForce
                                        : CGFloat); cdecl;
                                        function maximumSuspensionForce
                                        : CGFloat; cdecl;
                                        procedure setConnectionPosition
                                        (connectionPosition: SCNVector3); cdecl;
                                        function connectionPosition
                                        : SCNVector3; cdecl;
                                        procedure setSteeringAxis
                                        (steeringAxis: SCNVector3); cdecl;
                                        function steeringAxis
                                        : SCNVector3; cdecl;
                                        procedure setAxle
                                        (axle: SCNVector3); cdecl;
                                        function axle: SCNVector3; cdecl;
                                        procedure setRadius
                                        (radius: CGFloat); cdecl;
                                        function radius: CGFloat; cdecl;
                                        procedure setSuspensionRestLength
                                        (suspensionRestLength: CGFloat); cdecl;
                                        function suspensionRestLength
                                        : CGFloat; cdecl;
                                        end;

                                        TSCNPhysicsVehicleWheel = class
                                        (TOCGenericImport<
                                        SCNPhysicsVehicleWheelClass,
                                        SCNPhysicsVehicleWheel>)
                                        end;
                                        PSCNPhysicsVehicleWheel = Pointer;

                                        SCNPhysicsVehicleClass = interface
                                        (SCNPhysicsBehaviorClass)
                                        ['{012A445D-83F4-43C5-88C7-D790F8DBC58E}']
                                        { class } function
                                        vehicleWithChassisBody
                                        (chassisBody: SCNPhysicsBody;
                                        wheels: NSArray)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNPhysicsVehicle = interface
                                        (SCNPhysicsBehavior)
                                        ['{DA10AC72-95AE-4D1C-9E54-9ABBA75E7B6F}']
                                        function speedInKilometersPerHour
                                        : CGFloat;
                                        cdecl;
                                        function wheels: NSArray; cdecl;
                                        function chassisBody
                                        : SCNPhysicsBody; cdecl;
                                        procedure applyEngineForce
                                        (value: CGFloat;
                                        forWheelAtIndex: NSInteger); cdecl;
                                        procedure setSteeringAngle
                                        (value: CGFloat;
                                        forWheelAtIndex: NSInteger); cdecl;
                                        procedure applyBrakingForce
                                        (value: CGFloat;
                                        forWheelAtIndex: NSInteger); cdecl;
                                        end;

                                        TSCNPhysicsVehicle = class
                                        (TOCGenericImport<
                                        SCNPhysicsVehicleClass,
                                        SCNPhysicsVehicle>)
                                        end;
                                        PSCNPhysicsVehicle = Pointer;

                                        SCNReferenceNodeClass = interface
                                        (SCNNodeClass)
                                        ['{0A7F1701-DEEB-4192-A268-A73385FD7BA4}']
                                        { class } function referenceNodeWithURL
                                        (referenceURL: NSURL)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SCNReferenceNode = interface(SCNNode)
                                        ['{D246AC80-12C2-4D8B-B92F-9ECF000488E8}']
                                        function initWithURL
                                        (referenceURL: NSURL)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithCoder
                                        (aDecoder: NSCoder)
                                        : Pointer { instancetype }; cdecl;
                                        procedure setReferenceURL
                                        (referenceURL: NSURL); cdecl;
                                        function referenceURL: NSURL; cdecl;
                                        procedure setLoadingPolicy
                                        (loadingPolicy
                                        : SCNReferenceLoadingPolicy); cdecl;
                                        function loadingPolicy
                                        : SCNReferenceLoadingPolicy; cdecl;
                                        procedure load; cdecl;
                                        procedure unload; cdecl;
                                        function isLoaded: Boolean; cdecl;
                                        end;

                                        TSCNReferenceNode = class
                                        (TOCGenericImport<SCNReferenceNodeClass,
                                        SCNReferenceNode>)
                                        end;
                                        PSCNReferenceNode = Pointer;

                                        SCNAudioPlayerClass = interface
                                        (NSObjectClass)
                                        ['{A661A508-AD6A-408E-8225-CB564B4340C8}']
                                        { class } function audioPlayerWithSource
                                        (source: SCNAudioSource)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        audioPlayerWithAVAudioNode
                                        (audioNode: AVAudioNode)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SCNAudioPlayer = interface(NSObject)
                                        ['{CEA1C04F-DC1D-4F78-8CC6-35B4168061E1}']
                                        function initWithSource
                                        (source: SCNAudioSource)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithAVAudioNode
                                        (audioNode: AVAudioNode)
                                        : Pointer { instancetype }; cdecl;
                                        procedure setWillStartPlayback
                                        (willStartPlayback
                                        : TSceneKitCompletionHandler); cdecl;
                                        function willStartPlayback
                                        : TSceneKitCompletionHandler; cdecl;
                                        procedure setDidFinishPlayback
                                        (didFinishPlayback
                                        : TSceneKitCompletionHandler); cdecl;
                                        function didFinishPlayback
                                        : TSceneKitCompletionHandler; cdecl;
                                        function audioNode: AVAudioNode; cdecl;
                                        function audioSource
                                        : SCNAudioSource; cdecl;
                                        end;

                                        TSCNAudioPlayer = class
                                        (TOCGenericImport<SCNAudioPlayerClass,
                                        SCNAudioPlayer>)
                                        end;
                                        PSCNAudioPlayer = Pointer;

                                        // ===== Protocol declarations =====

                                        SCNAnimatable = interface(IObjectiveC)
                                        ['{AC2B9A25-EC33-4583-BB89-CF45C77ED85D}']
                                        procedure addAnimation
                                        (animation: CAAnimation;
                                        forKey: NSString);
                                        cdecl;
                                        procedure removeAllAnimations; cdecl;
                                        [MethodName('removeAnimationForKey:')]
                                        procedure removeAnimationForKey
                                        (key: NSString); cdecl;
                                        function animationKeys: NSArray; cdecl;
                                        function animationForKey(key: NSString)
                                        : CAAnimation; cdecl;
                                        procedure pauseAnimationForKey
                                        (key: NSString); cdecl;
                                        procedure resumeAnimationForKey
                                        (key: NSString); cdecl;
                                        function isAnimationForKeyPaused
                                        (key: NSString): Boolean; cdecl;
                                        [MethodName
                                        ('removeAnimationForKey:fadeOutDuration:')
                                        ]
                                        procedure removeAnimationForKeyFadeOutDuration
                                        (key: NSString;
                                        fadeOutDuration: CGFloat); cdecl;
                                        end;

                                        SCNBoundingVolume = interface
                                        (IObjectiveC)
                                        ['{12480962-9D45-42B3-AF85-B76E94BA3B49}']
                                        function getBoundingBoxMin(min: Pointer;
                                        max: Pointer): Boolean;
                                        cdecl;
                                        function getBoundingSphereCenter
                                        (center: Pointer; radius: PCGFloat)
                                        : Boolean; cdecl;
                                        procedure setBoundingBoxMin
                                        (min: Pointer; max: Pointer); cdecl;
                                        end;

                                        SCNSceneRendererDelegate = interface
                                        (IObjectiveC)
                                        ['{C4F86A36-2345-4B82-9E0A-61BD303ECA5E}']
                                        [MethodName('renderer:updateAtTime:')]
                                        procedure rendererUpdateAtTime
                                        (renderer: Pointer;
                                        updateAtTime: NSTimeInterval);
                                        cdecl;
                                        [MethodName
                                        ('renderer:didApplyAnimationsAtTime:')]
                                        procedure rendererDidApplyAnimationsAtTime
                                        (renderer: Pointer;
                                        didApplyAnimationsAtTime
                                        : NSTimeInterval); cdecl;
                                        [MethodName
                                        ('renderer:didSimulatePhysicsAtTime:')]
                                        procedure rendererDidSimulatePhysicsAtTime
                                        (renderer: Pointer;
                                        didSimulatePhysicsAtTime
                                        : NSTimeInterval); cdecl;
                                        [MethodName
                                        ('renderer:willRenderScene:atTime:')]
                                        procedure rendererWillRenderSceneAtTime
                                        (renderer: Pointer;
                                        willRenderScene: SCNScene;
                                        atTime: NSTimeInterval); cdecl;
                                        [MethodName
                                        ('renderer:didRenderScene:atTime:')]
                                        procedure rendererDidRenderSceneAtTime
                                        (renderer: Pointer;
                                        didRenderScene: SCNScene;
                                        atTime: NSTimeInterval); cdecl;
                                        end;

                                        SCNSceneRenderer = interface
                                        (IObjectiveC)
                                        ['{95AA65CB-5D13-47E8-9C8B-8EF6F99339CD}']
                                        procedure setScene(scene: SCNScene);
                                        cdecl;
                                        function scene: SCNScene; cdecl;
                                        procedure presentScene(scene: SCNScene;
                                        withTransition: SKTransition;
                                        incomingPointOfView: SCNNode;
                                        completionHandler
                                        : TSceneKitCompletionHandler); cdecl;
                                        procedure setSceneTime
                                        (sceneTime: NSTimeInterval); cdecl;
                                        function sceneTime
                                        : NSTimeInterval; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        function hitTest(point: CGPoint;
                                        options: NSDictionary): NSArray; cdecl;
                                        function isNodeInsideFrustum
                                        (node: SCNNode;
                                        withPointOfView: SCNNode)
                                        : Boolean; cdecl;
                                        function nodesInsideFrustumWithPointOfView
                                        (pointOfView: SCNNode): NSArray; cdecl;
                                        function projectPoint(point: SCNVector3)
                                        : SCNVector3; cdecl;
                                        function unprojectPoint
                                        (point: SCNVector3): SCNVector3; cdecl;
                                        procedure setPlaying
                                        (playing: Boolean); cdecl;
                                        function isPlaying: Boolean; cdecl;
                                        procedure setLoops
                                        (loops: Boolean); cdecl;
                                        function loops: Boolean; cdecl;
                                        procedure setPointOfView
                                        (pointOfView: SCNNode); cdecl;
                                        function pointOfView: SCNNode; cdecl;
                                        procedure setAutoenablesDefaultLighting
                                        (autoenablesDefaultLighting
                                        : Boolean); cdecl;
                                        function autoenablesDefaultLighting
                                        : Boolean; cdecl;
                                        procedure setJitteringEnabled
                                        (jitteringEnabled: Boolean); cdecl;
                                        function isJitteringEnabled
                                        : Boolean; cdecl;
                                        function prepareObject(&object: Pointer;
                                        shouldAbortBlock
                                        : TSceneKitShouldAbortBlock)
                                        : Boolean; cdecl;
                                        procedure prepareObjects
                                        (objects: NSArray;
                                        withCompletionHandler
                                        : TSceneKitWithCompletionHandler);
                                        cdecl;
                                        procedure setShowsStatistics
                                        (showsStatistics: Boolean); cdecl;
                                        function showsStatistics
                                        : Boolean; cdecl;
                                        procedure setDebugOptions
                                        (debugOptions: SCNDebugOptions); cdecl;
                                        function debugOptions
                                        : SCNDebugOptions; cdecl;
                                        procedure setOverlaySKScene
                                        (overlaySKScene: SKScene); cdecl;
                                        function overlaySKScene: SKScene; cdecl;
                                        function renderingAPI
                                        : SCNRenderingAPI; cdecl;
                                        function context: Pointer; cdecl;
                                        function currentRenderCommandEncoder
                                        : Pointer; cdecl;
                                        function device: Pointer; cdecl;
                                        function colorPixelFormat
                                        : MTLPixelFormat; cdecl;
                                        function depthPixelFormat
                                        : MTLPixelFormat; cdecl;
                                        function stencilPixelFormat
                                        : MTLPixelFormat; cdecl;
                                        function commandQueue: Pointer; cdecl;
                                        function audioEngine
                                        : AVAudioEngine; cdecl;
                                        function audioEnvironmentNode
                                        : AVAudioEnvironmentNode; cdecl;
                                        procedure setAudioListener
                                        (audioListener: SCNNode); cdecl;
                                        function audioListener: SCNNode; cdecl;
                                        end;

                                        SCNProgramDelegate = interface
                                        (IObjectiveC)
                                        ['{11C3927F-619D-4004-B6E3-6124862B2E00}']
                                        procedure &program(&program: SCNProgram;
                                        handleError: NSError);
                                        cdecl;
                                        function programIsOpaque
                                        (&program: SCNProgram): Boolean; cdecl;
                                        end;

                                        SCNShadable = interface(IObjectiveC)
                                        ['{B7E0ED97-41D0-4B1E-AED8-EBF2F52F7E96}']
                                        procedure setProgram
                                        (&program: SCNProgram);
                                        cdecl;
                                        function &program: SCNProgram; cdecl;
                                        procedure handleBindingOfSymbol
                                        (symbol: NSString;
                                        usingBlock: SCNBindingBlock); cdecl;
                                        procedure handleUnbindingOfSymbol
                                        (symbol: NSString;
                                        usingBlock: SCNBindingBlock); cdecl;
                                        procedure setShaderModifiers
                                        (shaderModifiers: NSDictionary); cdecl;
                                        function shaderModifiers
                                        : NSDictionary; cdecl;
                                        end;

                                        SCNBufferStream = interface(IObjectiveC)
                                        ['{7907874D-A8C7-440D-B0BE-AE38ACDC2443}']
                                        procedure writeBytes(bytes: Pointer;
                                        length: NSUInteger);
                                        cdecl;
                                        end;

                                        SCNTechniqueSupport = interface
                                        (IObjectiveC)
                                        ['{262B40A3-FD44-4467-B632-C2BCD7194236}']
                                        procedure setTechnique
                                        (technique: SCNTechnique);
                                        cdecl;
                                        function technique: SCNTechnique; cdecl;
                                        end;

                                        SCNSceneExportDelegate = interface
                                        (IObjectiveC)
                                        ['{44F8C673-F4C4-4F6F-A616-E34F4BE54B30}']
                                        end;

                                        SCNActionable = interface(IObjectiveC)
                                        ['{1433737B-FBAA-49BB-8F0B-20726A74B0A8}']
                                        [MethodName('runAction:')]
                                        procedure runAction(action: SCNAction);
                                        cdecl;
                                        [MethodName
                                        ('runAction:completionHandler:')]
                                        procedure runActionCompletionHandler
                                        (action: SCNAction;
                                        completionHandler
                                        : TSceneKitCompletionHandler); cdecl;
                                        [MethodName('runAction:forKey:')]
                                        procedure runActionForKey
                                        (action: SCNAction;
                                        forKey: NSString); cdecl;
                                        [MethodName
                                        ('runAction:forKey:completionHandler:')]
                                        procedure runActionForKeyCompletionHandler
                                        (action: SCNAction; forKey: NSString;
                                        completionHandler
                                        : TSceneKitCompletionHandler); cdecl;
                                        function hasActions: Boolean; cdecl;
                                        function actionForKey(key: NSString)
                                        : SCNAction; cdecl;
                                        procedure removeActionForKey
                                        (key: NSString); cdecl;
                                        procedure removeAllActions; cdecl;
                                        function actionKeys: NSArray; cdecl;
                                        end;

                                        SCNNodeRendererDelegate = interface
                                        (IObjectiveC)
                                        ['{249F2A9D-3FD6-4D73-9417-C2A8E07AD299}']
                                        procedure renderNode(node: SCNNode;
                                        renderer: SCNRenderer;
                                        arguments: NSDictionary);
                                        cdecl;
                                        end;

                                        SCNPhysicsContactDelegate = interface
                                        (IObjectiveC)
                                        ['{8B9822C4-93A2-4C64-A6C6-914BA733C0DD}']
                                        [MethodName
                                        ('physicsWorld:didBeginContact:')]
                                        procedure physicsWorldDidBeginContact
                                        (world: SCNPhysicsWorld;
                                        didBeginContact: SCNPhysicsContact);
                                        cdecl;
                                        [MethodName
                                        ('physicsWorld:didUpdateContact:')]
                                        procedure physicsWorldDidUpdateContact
                                        (world: SCNPhysicsWorld;
                                        didUpdateContact
                                        : SCNPhysicsContact); cdecl;
                                        [MethodName
                                        ('physicsWorld:didEndContact:')]
                                        procedure physicsWorldDidEndContact
                                        (world: SCNPhysicsWorld;
                                        didEndContact
                                        : SCNPhysicsContact); cdecl;
                                        end;

                                        // ===== Exported string consts =====

                                        function SCNMatrix4Identity: Pointer;
                                        function SCNVector3Zero: Pointer;
                                        function SCNVector4Zero: Pointer;
                                        function SCNErrorDomain: NSString;
                                        function SCNHitTestFirstFoundOnlyKey
                                        : NSString;
                                        function SCNHitTestSortResultsKey
                                        : NSString;
                                        function SCNHitTestClipToZRangeKey
                                        : NSString;
                                        function SCNHitTestBackFaceCullingKey
                                        : NSString;
                                        function SCNHitTestBoundingBoxOnlyKey
                                        : NSString;
                                        function SCNHitTestIgnoreChildNodesKey
                                        : NSString;
                                        function SCNHitTestRootNodeKey
                                        : NSString;
                                        function SCNHitTestIgnoreHiddenNodesKey
                                        : NSString;
                                        function SCNProgramMappingChannelKey
                                        : NSString;
                                        function SCNShaderModifierEntryPointGeometry
                                        : NSString;
                                        function SCNShaderModifierEntryPointSurface
                                        : NSString;
                                        function SCNShaderModifierEntryPointLightingModel
                                        : NSString;
                                        function SCNShaderModifierEntryPointFragment
                                        : NSString;
                                        function SCNPreferredRenderingAPIKey
                                        : NSString;
                                        function SCNPreferredDeviceKey
                                        : NSString;
                                        function SCNPreferLowPowerDeviceKey
                                        : NSString;
                                        function SCNSceneExportDestinationURL
                                        : NSString;
                                        function SCNSceneStartTimeAttributeKey
                                        : NSString;
                                        function SCNSceneEndTimeAttributeKey
                                        : NSString;
                                        function SCNSceneFrameRateAttributeKey
                                        : NSString;
                                        function SCNSceneUpAxisAttributeKey
                                        : NSString;
                                        function SCNSceneSourceAssetContributorsKey
                                        : NSString;
                                        function SCNSceneSourceAssetCreatedDateKey
                                        : NSString;
                                        function SCNSceneSourceAssetModifiedDateKey
                                        : NSString;
                                        function SCNSceneSourceAssetUpAxisKey
                                        : NSString;
                                        function SCNSceneSourceAssetUnitKey
                                        : NSString;
                                        function SCNSceneSourceAssetAuthoringToolKey
                                        : NSString;
                                        function SCNSceneSourceAssetAuthorKey
                                        : NSString;
                                        function SCNSceneSourceAssetUnitNameKey
                                        : NSString;
                                        function SCNSceneSourceAssetUnitMeterKey
                                        : NSString;
                                        function SCNSceneSourceCreateNormalsIfAbsentKey
                                        : NSString;
                                        function SCNSceneSourceCheckConsistencyKey
                                        : NSString;
                                        function SCNSceneSourceFlattenSceneKey
                                        : NSString;
                                        function SCNSceneSourceUseSafeModeKey
                                        : NSString;
                                        function SCNSceneSourceAssetDirectoryURLsKey
                                        : NSString;
                                        function SCNSceneSourceOverrideAssetURLsKey
                                        : NSString;
                                        function SCNSceneSourceStrictConformanceKey
                                        : NSString;
                                        function SCNSceneSourceConvertUnitsToMetersKey
                                        : NSString;
                                        function SCNSceneSourceConvertToYUpKey
                                        : NSString;
                                        function SCNSceneSourceAnimationImportPolicyKey
                                        : NSString;
                                        function SCNSceneSourceAnimationImportPolicyPlay
                                        : NSString;
                                        function SCNSceneSourceAnimationImportPolicyPlayRepeatedly
                                        : NSString;
                                        function SCNSceneSourceAnimationImportPolicyDoNotPlay
                                        : NSString;
                                        function SCNSceneSourceAnimationImportPolicyPlayUsingSceneTimeBase
                                        : NSString;
                                        function SCNDetailedErrorsKey: NSString;
                                        function SCNConsistencyElementIDErrorKey
                                        : NSString;
                                        function SCNConsistencyElementTypeErrorKey
                                        : NSString;
                                        function SCNConsistencyLineNumberErrorKey
                                        : NSString;
                                        function SCNModelTransform: NSString;
                                        function SCNViewTransform: NSString;
                                        function SCNProjectionTransform
                                        : NSString;
                                        function SCNNormalTransform: NSString;
                                        function SCNModelViewTransform
                                        : NSString;
                                        function SCNModelViewProjectionTransform
                                        : NSString;
                                        function SCNLightTypeAmbient: NSString;
                                        function SCNLightTypeOmni: NSString;
                                        function SCNLightTypeDirectional
                                        : NSString;
                                        function SCNLightTypeSpot: NSString;
                                        function SCNLightingModelPhong
                                        : NSString;
                                        function SCNLightingModelBlinn
                                        : NSString;
                                        function SCNLightingModelLambert
                                        : NSString;
                                        function SCNLightingModelConstant
                                        : NSString;
                                        function SCNGeometrySourceSemanticVertex
                                        : NSString;
                                        function SCNGeometrySourceSemanticNormal
                                        : NSString;
                                        function SCNGeometrySourceSemanticColor
                                        : NSString;
                                        function SCNGeometrySourceSemanticTexcoord
                                        : NSString;
                                        function SCNGeometrySourceSemanticVertexCrease
                                        : NSString;
                                        function SCNGeometrySourceSemanticEdgeCrease
                                        : NSString;
                                        function SCNGeometrySourceSemanticBoneWeights
                                        : NSString;
                                        function SCNGeometrySourceSemanticBoneIndices
                                        : NSString;
                                        function SCNParticlePropertyPosition
                                        : NSString;
                                        function SCNParticlePropertyAngle
                                        : NSString;
                                        function SCNParticlePropertyRotationAxis
                                        : NSString;
                                        function SCNParticlePropertyVelocity
                                        : NSString;
                                        function SCNParticlePropertyAngularVelocity
                                        : NSString;
                                        function SCNParticlePropertyLife
                                        : NSString;
                                        function SCNParticlePropertyColor
                                        : NSString;
                                        function SCNParticlePropertyOpacity
                                        : NSString;
                                        function SCNParticlePropertySize
                                        : NSString;
                                        function SCNParticlePropertyFrame
                                        : NSString;
                                        function SCNParticlePropertyFrameRate
                                        : NSString;
                                        function SCNParticlePropertyBounce
                                        : NSString;
                                        function SCNParticlePropertyCharge
                                        : NSString;
                                        function SCNParticlePropertyFriction
                                        : NSString;
                                        function SCNParticlePropertyContactPoint
                                        : NSString;
                                        function SCNParticlePropertyContactNormal
                                        : NSString;
                                        function SCNPhysicsShapeTypeKey
                                        : NSString;
                                        function SCNPhysicsShapeTypeBoundingBox
                                        : NSString;
                                        function SCNPhysicsShapeTypeConvexHull
                                        : NSString;
                                        function SCNPhysicsShapeTypeConcavePolyhedron
                                        : NSString;
                                        function SCNPhysicsShapeKeepAsCompoundKey
                                        : NSString;
                                        function SCNPhysicsShapeScaleKey
                                        : NSString;
                                        function SCNPhysicsTestCollisionBitMaskKey
                                        : NSString;
                                        function SCNPhysicsTestSearchModeKey
                                        : NSString;
                                        function SCNPhysicsTestBackfaceCullingKey
                                        : NSString;
                                        function SCNPhysicsTestSearchModeAny
                                        : NSString;
                                        function SCNPhysicsTestSearchModeClosest
                                        : NSString;
                                        function SCNPhysicsTestSearchModeAll
                                        : NSString;


                                        // ===== External functions =====

                                        const
                                        libSceneKit =
                                        '/System/Library/Frameworks/SceneKit.framework/SceneKit';
                                        function SCNVector3EqualToVector3
                                        (a: SCNVector3; b: SCNVector3): Integer;
                                        cdecl; external libSceneKit name _PU +
                                        'SCNVector3EqualToVector3';
                                        function SCNVector4EqualToVector4
                                        (a: SCNVector4; b: SCNVector4): Integer;
                                        cdecl; external libSceneKit name _PU +
                                        'SCNVector4EqualToVector4';
                                        function SCNVector3Make(x: Single;
                                        y: Single; z: Single): SCNVector3;
                                        cdecl; external libSceneKit name _PU +
                                        'SCNVector3Make';
                                        function SCNVector4Make(x: Single;
                                        y: Single; z: Single; w: Single)
                                        : SCNVector4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNVector4Make';
                                        function SCNMatrix4MakeTranslation
                                        (x: Single; y: Single; z: Single)
                                        : SCNMatrix4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNMatrix4MakeTranslation';
                                        function SCNMatrix4MakeScale(sx: Single;
                                        sy: Single; sz: Single): SCNMatrix4;
                                        cdecl; external libSceneKit name _PU +
                                        'SCNMatrix4MakeScale';
                                        function SCNMatrix4Translate
                                        (mat: SCNMatrix4; x: Single; y: Single;
                                        z: Single): SCNMatrix4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNMatrix4Translate';
                                        function SCNMatrix4MakeRotation
                                        (angle: Single; x: Single; y: Single;
                                        z: Single): SCNMatrix4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNMatrix4MakeRotation';
                                        function SCNMatrix4Scale
                                        (mat: SCNMatrix4; x: Single; y: Single;
                                        z: Single): SCNMatrix4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNMatrix4Scale';
                                        function SCNMatrix4Rotate
                                        (mat: SCNMatrix4; angle: Single;
                                        x: Single; y: Single; z: Single)
                                        : SCNMatrix4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNMatrix4Rotate';
                                        function SCNMatrix4Invert
                                        (mat: SCNMatrix4): SCNMatrix4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNMatrix4Invert';
                                        function SCNMatrix4Mult
                                        (matA: SCNMatrix4; matB: SCNMatrix4)
                                        : SCNMatrix4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNMatrix4Mult';
                                        function SCNMatrix4IsIdentity
                                        (mat: SCNMatrix4): Integer; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNMatrix4IsIdentity';
                                        function SCNMatrix4EqualToMatrix4
                                        (matA: SCNMatrix4; matB: SCNMatrix4)
                                        : Integer; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNMatrix4EqualToMatrix4';
                                        function SCNVector3FromGLKVector3
                                        (vector: GLKVector3): SCNVector3; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNVector3FromGLKVector3';
                                        function SCNVector3ToGLKVector3
                                        (vector: SCNVector3): GLKVector3; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNVector3ToGLKVector3';
                                        function SCNVector4FromGLKVector4
                                        (vector: GLKVector4): SCNVector4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNVector4FromGLKVector4';
                                        function SCNVector4ToGLKVector4
                                        (vector: SCNVector4): GLKVector4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNVector4ToGLKVector4';
                                        function SCNMatrix4ToGLKMatrix4
                                        (mat: SCNMatrix4): GLKMatrix4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNMatrix4ToGLKMatrix4';
                                        function SCNMatrix4FromGLKMatrix4
                                        (mat: GLKMatrix4): SCNMatrix4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNMatrix4FromGLKMatrix4';
                                        function SCNVector3ToFloat3
                                        (v: SCNVector3): vector_float3; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNVector3ToFloat3';
                                        function SCNVector4ToFloat4
                                        (v: SCNVector4): vector_float4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNVector4ToFloat4';
                                        function SCNMatrix4ToMat4(m: SCNMatrix4)
                                        : matrix_float4x4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNMatrix4ToMat4';
                                        function SCNVector3FromFloat3
                                        (v: vector_float3): SCNVector3; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNVector3FromFloat3';
                                        function SCNVector4FromFloat4
                                        (v: vector_float4): SCNVector4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNVector4FromFloat4';
                                        function SCNMatrix4FromMat4
                                        (m: matrix_float4x4): SCNMatrix4; cdecl;
                                        external libSceneKit name _PU +
                                        'SCNMatrix4FromMat4';
                                        procedure SCNExportJavaScriptModule
                                        (context: Pointer { JSContext } );
                                        cdecl; external libSceneKit name _PU +
                                        'SCNExportJavaScriptModule';

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

function SCNHitTestFirstFoundOnlyKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNHitTestFirstFoundOnlyKey');
end;

function SCNHitTestSortResultsKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNHitTestSortResultsKey');
end;

function SCNHitTestClipToZRangeKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNHitTestClipToZRangeKey');
end;

function SCNHitTestBackFaceCullingKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNHitTestBackFaceCullingKey');
end;

function SCNHitTestBoundingBoxOnlyKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNHitTestBoundingBoxOnlyKey');
end;

function SCNHitTestIgnoreChildNodesKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNHitTestIgnoreChildNodesKey');
end;

function SCNHitTestRootNodeKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNHitTestRootNodeKey');
end;

function SCNHitTestIgnoreHiddenNodesKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNHitTestIgnoreHiddenNodesKey');
end;

function SCNProgramMappingChannelKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNProgramMappingChannelKey');
end;

function SCNShaderModifierEntryPointGeometry: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNShaderModifierEntryPointGeometry');
end;

function SCNShaderModifierEntryPointSurface: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNShaderModifierEntryPointSurface');
end;

function SCNShaderModifierEntryPointLightingModel: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNShaderModifierEntryPointLightingModel');
end;

function SCNShaderModifierEntryPointFragment: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNShaderModifierEntryPointFragment');
end;

function SCNPreferredRenderingAPIKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNPreferredRenderingAPIKey');
end;

function SCNPreferredDeviceKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNPreferredDeviceKey');
end;

function SCNPreferLowPowerDeviceKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNPreferLowPowerDeviceKey');
end;

function SCNSceneExportDestinationURL: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneExportDestinationURL');
end;

function SCNSceneStartTimeAttributeKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneStartTimeAttributeKey');
end;

function SCNSceneEndTimeAttributeKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneEndTimeAttributeKey');
end;

function SCNSceneFrameRateAttributeKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneFrameRateAttributeKey');
end;

function SCNSceneUpAxisAttributeKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneUpAxisAttributeKey');
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

function SCNSceneSourceCreateNormalsIfAbsentKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceCreateNormalsIfAbsentKey');
end;

function SCNSceneSourceCheckConsistencyKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceCheckConsistencyKey');
end;

function SCNSceneSourceFlattenSceneKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneSourceFlattenSceneKey');
end;

function SCNSceneSourceUseSafeModeKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneSourceUseSafeModeKey');
end;

function SCNSceneSourceAssetDirectoryURLsKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceAssetDirectoryURLsKey');
end;

function SCNSceneSourceOverrideAssetURLsKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceOverrideAssetURLsKey');
end;

function SCNSceneSourceStrictConformanceKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceStrictConformanceKey');
end;

function SCNSceneSourceConvertUnitsToMetersKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceConvertUnitsToMetersKey');
end;

function SCNSceneSourceConvertToYUpKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNSceneSourceConvertToYUpKey');
end;

function SCNSceneSourceAnimationImportPolicyKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceAnimationImportPolicyKey');
end;

function SCNSceneSourceAnimationImportPolicyPlay: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceAnimationImportPolicyPlay');
end;

function SCNSceneSourceAnimationImportPolicyPlayRepeatedly: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceAnimationImportPolicyPlayRepeatedly');
end;

function SCNSceneSourceAnimationImportPolicyDoNotPlay: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceAnimationImportPolicyDoNotPlay');
end;

function SCNSceneSourceAnimationImportPolicyPlayUsingSceneTimeBase: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNSceneSourceAnimationImportPolicyPlayUsingSceneTimeBase');
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

function SCNLightTypeAmbient: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNLightTypeAmbient');
end;

function SCNLightTypeOmni: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNLightTypeOmni');
end;

function SCNLightTypeDirectional: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNLightTypeDirectional');
end;

function SCNLightTypeSpot: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNLightTypeSpot');
end;

function SCNLightingModelPhong: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNLightingModelPhong');
end;

function SCNLightingModelBlinn: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNLightingModelBlinn');
end;

function SCNLightingModelLambert: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNLightingModelLambert');
end;

function SCNLightingModelConstant: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNLightingModelConstant');
end;

function SCNGeometrySourceSemanticVertex: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNGeometrySourceSemanticVertex');
end;

function SCNGeometrySourceSemanticNormal: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNGeometrySourceSemanticNormal');
end;

function SCNGeometrySourceSemanticColor: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNGeometrySourceSemanticColor');
end;

function SCNGeometrySourceSemanticTexcoord: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNGeometrySourceSemanticTexcoord');
end;

function SCNGeometrySourceSemanticVertexCrease: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNGeometrySourceSemanticVertexCrease');
end;

function SCNGeometrySourceSemanticEdgeCrease: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNGeometrySourceSemanticEdgeCrease');
end;

function SCNGeometrySourceSemanticBoneWeights: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNGeometrySourceSemanticBoneWeights');
end;

function SCNGeometrySourceSemanticBoneIndices: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNGeometrySourceSemanticBoneIndices');
end;

function SCNParticlePropertyPosition: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyPosition');
end;

function SCNParticlePropertyAngle: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyAngle');
end;

function SCNParticlePropertyRotationAxis: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyRotationAxis');
end;

function SCNParticlePropertyVelocity: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyVelocity');
end;

function SCNParticlePropertyAngularVelocity: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNParticlePropertyAngularVelocity');
end;

function SCNParticlePropertyLife: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyLife');
end;

function SCNParticlePropertyColor: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyColor');
end;

function SCNParticlePropertyOpacity: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyOpacity');
end;

function SCNParticlePropertySize: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertySize');
end;

function SCNParticlePropertyFrame: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyFrame');
end;

function SCNParticlePropertyFrameRate: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyFrameRate');
end;

function SCNParticlePropertyBounce: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyBounce');
end;

function SCNParticlePropertyCharge: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyCharge');
end;

function SCNParticlePropertyFriction: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyFriction');
end;

function SCNParticlePropertyContactPoint: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyContactPoint');
end;

function SCNParticlePropertyContactNormal: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNParticlePropertyContactNormal');
end;

function SCNPhysicsShapeTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNPhysicsShapeTypeKey');
end;

function SCNPhysicsShapeTypeBoundingBox: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNPhysicsShapeTypeBoundingBox');
end;

function SCNPhysicsShapeTypeConvexHull: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNPhysicsShapeTypeConvexHull');
end;

function SCNPhysicsShapeTypeConcavePolyhedron: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNPhysicsShapeTypeConcavePolyhedron');
end;

function SCNPhysicsShapeKeepAsCompoundKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNPhysicsShapeKeepAsCompoundKey');
end;

function SCNPhysicsShapeScaleKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNPhysicsShapeScaleKey');
end;

function SCNPhysicsTestCollisionBitMaskKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit,
    'SCNPhysicsTestCollisionBitMaskKey');
end;

function SCNPhysicsTestSearchModeKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNPhysicsTestSearchModeKey');
end;

function SCNPhysicsTestBackfaceCullingKey: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNPhysicsTestBackfaceCullingKey');
end;

function SCNPhysicsTestSearchModeAny: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNPhysicsTestSearchModeAny');
end;

function SCNPhysicsTestSearchModeClosest: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNPhysicsTestSearchModeClosest');
end;

function SCNPhysicsTestSearchModeAll: NSString;
begin
  Result := CocoaNSStringConst(libSceneKit, 'SCNPhysicsTestSearchModeAll');
end;

function SCNMatrix4Identity: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNMatrix4Identity');
end;

function SCNVector3Zero: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNVector3Zero');
end;

function SCNVector4Zero: Pointer;
begin
  Result := CocoaPointerConst(libSceneKit, 'SCNVector4Zero');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

SceneKitModule := dlopen(MarshaledAString(libSceneKit), RTLD_LAZY);

finalization

dlclose(SceneKitModule);
{$ENDIF IOS}

end.
