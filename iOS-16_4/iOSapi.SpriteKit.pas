{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework SpriteKit
//

unit iOSapi.SpriteKit;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.AVFoundation,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.CoreImage,
  iOSapi.Foundation,
  iOSapi.GLKit,
  iOSapi.Metal,
  iOSapi.UIKit;

const
  SKBlendModeAlpha = 0;
  SKBlendModeAdd = 1;
  SKBlendModeSubtract = 2;
  SKBlendModeMultiply = 3;
  SKBlendModeMultiplyX2 = 4;
  SKBlendModeScreen = 5;
  SKBlendModeReplace = 6;
  SKBlendModeMultiplyAlpha = 7;
  SKNodeFocusBehaviorNone = 0;
  SKNodeFocusBehaviorOccluding = 1;
  SKNodeFocusBehaviorFocusable = 2;
  SKActionTimingLinear = 0;
  SKActionTimingEaseIn = 1;
  SKActionTimingEaseOut = 2;
  SKActionTimingEaseInEaseOut = 3;
  SKAttributeTypeNone = 0;
  SKAttributeTypeFloat = 1;
  SKAttributeTypeVectorFloat2 = 2;
  SKAttributeTypeVectorFloat3 = 3;
  SKAttributeTypeVectorFloat4 = 4;
  SKAttributeTypeHalfFloat = 5;
  SKAttributeTypeVectorHalfFloat2 = 6;
  SKAttributeTypeVectorHalfFloat3 = 7;
  SKAttributeTypeVectorHalfFloat4 = 8;
  SKSceneScaleModeFill = 0;
  SKSceneScaleModeAspectFill = 1;
  SKSceneScaleModeAspectFit = 2;
  SKSceneScaleModeResizeFill = 3;
  SKInterpolationModeLinear = 1;
  SKInterpolationModeSpline = 2;
  SKInterpolationModeStep = 3;
  SKRepeatModeClamp = 1;
  SKRepeatModeLoop = 2;
  SKParticleRenderOrderOldestLast = 0;
  SKParticleRenderOrderOldestFirst = 1;
  SKParticleRenderOrderDontCare = 2;
  SKLabelVerticalAlignmentModeBaseline = 0;
  SKLabelVerticalAlignmentModeCenter = 1;
  SKLabelVerticalAlignmentModeTop = 2;
  SKLabelVerticalAlignmentModeBottom = 3;
  SKLabelHorizontalAlignmentModeCenter = 0;
  SKLabelHorizontalAlignmentModeLeft = 1;
  SKLabelHorizontalAlignmentModeRight = 2;
  SKTransitionDirectionUp = 0;
  SKTransitionDirectionDown = 1;
  SKTransitionDirectionRight = 2;
  SKTransitionDirectionLeft = 3;
  SKTextureFilteringNearest = 0;
  SKTextureFilteringLinear = 1;
  SKUniformTypeNone = 0;
  SKUniformTypeFloat = 1;
  SKUniformTypeFloatVector2 = 2;
  SKUniformTypeFloatVector3 = 3;
  SKUniformTypeFloatVector4 = 4;
  SKUniformTypeFloatMatrix2 = 5;
  SKUniformTypeFloatMatrix3 = 6;
  SKUniformTypeFloatMatrix4 = 7;
  SKUniformTypeTexture = 8;
  SKTileDefinitionRotation0 = 0;
  SKTileDefinitionRotation90 = 1;
  SKTileDefinitionRotation180 = 2;
  SKTileDefinitionRotation270 = 3;
  SKTileSetTypeGrid = 0;
  SKTileSetTypeIsometric = 1;
  SKTileSetTypeHexagonalFlat = 2;
  SKTileSetTypeHexagonalPointy = 3;
  SKTileAdjacencyUp = 1 shl 0;
  SKTileAdjacencyUpperRight = 1 shl 1;
  SKTileAdjacencyRight = 1 shl 2;
  SKTileAdjacencyLowerRight = 1 shl 3;
  SKTileAdjacencyDown = 1 shl 4;
  SKTileAdjacencyLowerLeft = 1 shl 5;
  SKTileAdjacencyLeft = 1 shl 6;
  SKTileAdjacencyUpperLeft = 1 shl 7;
  SKTileAdjacencyAll = SKTileAdjacencyUp or SKTileAdjacencyUpperRight or
    SKTileAdjacencyRight or SKTileAdjacencyLowerRight or SKTileAdjacencyDown or
    SKTileAdjacencyLowerLeft or SKTileAdjacencyLeft or SKTileAdjacencyUpperLeft;
  SKTileHexFlatAdjacencyUp = 1 shl 0;
  SKTileHexFlatAdjacencyUpperRight = 1 shl 1;
  SKTileHexFlatAdjacencyLowerRight = 1 shl 2;
  SKTileHexFlatAdjacencyDown = 1 shl 3;
  SKTileHexFlatAdjacencyLowerLeft = 1 shl 4;
  SKTileHexFlatAdjacencyUpperLeft = 1 shl 5;
  SKTileHexFlatAdjacencyAll = SKTileHexFlatAdjacencyUp or
    SKTileHexFlatAdjacencyUpperRight or SKTileHexFlatAdjacencyLowerRight or
    SKTileHexFlatAdjacencyDown or SKTileHexFlatAdjacencyLowerLeft or
    SKTileHexFlatAdjacencyUpperLeft;
  SKTileHexPointyAdjacencyUpperLeft = 1 shl 0;
  SKTileHexPointyAdjacencyUpperRight = 1 shl 1;
  SKTileHexPointyAdjacencyRight = 1 shl 2;
  SKTileHexPointyAdjacencyLowerRight = 1 shl 3;
  SKTileHexPointyAdjacencyLowerLeft = 1 shl 4;
  SKTileHexPointyAdjacencyLeft = 1 shl 5;
  SKTileHexPointyAdjacencyAdd = SKTileHexPointyAdjacencyUpperLeft or
    SKTileHexPointyAdjacencyUpperRight or SKTileHexPointyAdjacencyRight or
    SKTileHexPointyAdjacencyLowerRight or SKTileHexPointyAdjacencyLowerLeft or
    SKTileHexPointyAdjacencyLeft;
  SKTileAdjacencyUpEdge = SKTileAdjacencyRight or SKTileAdjacencyLowerRight or
    SKTileAdjacencyDown or SKTileAdjacencyLowerLeft or SKTileAdjacencyLeft;
  SKTileAdjacencyUpperRightEdge = SKTileAdjacencyDown or
    SKTileAdjacencyLowerLeft or SKTileAdjacencyLeft;
  SKTileAdjacencyRightEdge = SKTileAdjacencyDown or SKTileAdjacencyLowerLeft or
    SKTileAdjacencyLeft or SKTileAdjacencyUpperLeft or SKTileAdjacencyUp;
  SKTileAdjacencyLowerRightEdge = SKTileAdjacencyLeft or
    SKTileAdjacencyUpperLeft or SKTileAdjacencyUp;
  SKTileAdjacencyDownEdge = SKTileAdjacencyUp or SKTileAdjacencyUpperRight or
    SKTileAdjacencyRight or SKTileAdjacencyLeft or SKTileAdjacencyUpperLeft;
  SKTileAdjacencyLowerLeftEdge = SKTileAdjacencyUp or
    SKTileAdjacencyUpperRight or SKTileAdjacencyRight;
  SKTileAdjacencyLeftEdge = SKTileAdjacencyUp or SKTileAdjacencyUpperRight or
    SKTileAdjacencyRight or SKTileAdjacencyLowerRight or SKTileAdjacencyDown;
  SKTileAdjacencyUpperLeftEdge = SKTileAdjacencyRight or
    SKTileAdjacencyLowerRight or SKTileAdjacencyDown;
  SKTileAdjacencyUpperRightCorner = SKTileAdjacencyUp or
    SKTileAdjacencyUpperRight or SKTileAdjacencyRight or
    SKTileAdjacencyLowerRight or SKTileAdjacencyDown or SKTileAdjacencyLeft or
    SKTileAdjacencyUpperLeft;
  SKTileAdjacencyLowerRightCorner = SKTileAdjacencyUp or
    SKTileAdjacencyUpperRight or SKTileAdjacencyRight or
    SKTileAdjacencyLowerRight or SKTileAdjacencyDown or
    SKTileAdjacencyLowerLeft or SKTileAdjacencyLeft;
  SKTileAdjacencyLowerLeftCorner = SKTileAdjacencyUp or SKTileAdjacencyRight or
    SKTileAdjacencyLowerRight or SKTileAdjacencyDown or
    SKTileAdjacencyLowerLeft or SKTileAdjacencyLeft or SKTileAdjacencyUpperLeft;
  SKTileAdjacencyUpperLeftCorner = SKTileAdjacencyUp or
    SKTileAdjacencyUpperRight or SKTileAdjacencyRight or SKTileAdjacencyDown or
    SKTileAdjacencyLowerLeft or SKTileAdjacencyLeft or SKTileAdjacencyUpperLeft;

type

  // ===== Forward declarations =====
{$M+}
  SKAction = interface;
  SKScene = interface;
  SKTexture = interface;
  SKPhysicsBody = interface;
  SKFieldNode = interface;
  SKReachConstraints = interface;
  SKConstraint = interface;
  SKAttributeValue = interface;
  SKWarpGeometry = interface;
  SKNode = interface;
  SKNodeTouches = interface;
  SKUniform = interface;
  SKAttribute = interface;
  SKShader = interface;
  SKWarpGeometryGrid = interface;
  SKWarpable = interface;
  SKLightNode = interface;
  SKSpriteNode = interface;
  SK3DNode = interface;
  SKCameraNode = interface;
  SKEffectNode = interface;
  SKView = interface;
  SKPhysicsWorld = interface;
  SKSceneDelegate = interface;
  SKKeyframeSequence = interface;
  SKEmitterNode = interface;
  SKShapeNode = interface;
  SKRegion = interface;
  SKLabelNode = interface;
  SKVideoNode = interface;
  SKCropNode = interface;
  SKReferenceNode = interface;
  SKTransformNode = interface;
  SKTransition = interface;
  SKViewDelegate = interface;
  SKRenderer = interface;
  SKTileDefinition = interface;
  SKTileGroup = interface;
  SKTileGroupRule = interface;
  SKTileSet = interface;
  SKTileMapNode = interface;
  SKMutableTexture = interface;
  SKTextureAtlas = interface;
  SKRange = interface;
  SKPhysicsJoint = interface;
  SKPhysicsJointPin = interface;
  SKPhysicsJointSpring = interface;
  SKPhysicsJointFixed = interface;
  SKPhysicsJointSliding = interface;
  SKPhysicsJointLimit = interface;
  SKPhysicsContact = interface;
  SKPhysicsContactDelegate = interface;
  SKAudioNode = interface;

  // ===== Framework typedefs =====
{$M+}
  vector_float3 = - - < Type : : ExtVector >;
  Pvector_float3 = ^vector_float3;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  SKBlendMode = NSInteger;
  SKNodeFocusBehavior = NSInteger;
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

  TSpriteKitUsingBlock = procedure(param1: SKNode; param2: PBoolean) of object;
  TSpriteKitCompletion = procedure() of object;
  SKActionTimingMode = NSInteger;
  SKActionTimingFunction = function(param1: Single): Single; cdecl;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  CGVector = record
    dx: CGFloat;
    dy: CGFloat;
  end;

  PCGVector = ^CGVector;

  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  CGPathRef = Pointer;
  PCGPathRef = ^CGPathRef;
  SEL = SEL *;
  PSEL = ^SEL;
  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;
  TSpriteKitActionBlock = procedure(param1: SKNode; param2: CGFloat) of object;
  simd_float2 = - - < Type : : ExtVector >;
  Psimd_float2 = ^simd_float2;
  vector_float2 = simd_float2;
  Pvector_float2 = ^vector_float2;
  simd_float3 = - - < Type : : ExtVector >;
  Psimd_float3 = ^simd_float3;
  SKAttributeType = NSInteger;
  simd_float4 = - - < Type : : ExtVector >;
  Psimd_float4 = ^simd_float4;
  vector_float4 = simd_float4;
  Pvector_float4 = ^vector_float4;
  SKSceneScaleMode = NSInteger;
  SKInterpolationMode = NSInteger;
  SKRepeatMode = NSInteger;
  SKParticleRenderOrder = NSUInteger;
  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  CGLineCap = Int32;
  CGLineJoin = Int32;
  SKFieldForceEvaluator = function(param1: vector_float3; param2: vector_float3;
    param3: Single; param4: Single; param5: NSTimeInterval)
    : vector_float3; cdecl;
  SKLabelVerticalAlignmentMode = NSInteger;
  SKLabelHorizontalAlignmentMode = NSInteger;
  NSLineBreakMode = NSInteger;

  simd_float3x3 = record
    columns: array [0 .. 2] of simd_float3;
  end;

  Psimd_float3x3 = ^simd_float3x3;

  matrix_float3x3 = simd_float3x3;

  simd_quatf = record
    vector: simd_float4;
  end;

  Psimd_quatf = ^simd_quatf;

  SKTransitionDirection = NSInteger;
  SKTextureFilteringMode = NSInteger;
  CGImageRef = Pointer;
  PCGImageRef = ^CGImageRef;
  SKUniformType = NSInteger;

  simd_float2x2 = record
    columns: array [0 .. 1] of simd_float2;
  end;

  Psimd_float2x2 = ^simd_float2x2;

  matrix_float2x2 = simd_float2x2;

  simd_float4x4 = record
    columns: array [0 .. 3] of simd_float4;
  end;

  Psimd_float4x4 = ^simd_float4x4;

  matrix_float4x4 = simd_float4x4;

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

  SKTileDefinitionRotation = NSUInteger;
  SKTileSetType = NSUInteger;
  SKTileAdjacencyMask = NSUInteger;
  TSpriteKitBlock = procedure(param1: Pointer; param2: LongWord) of object;
  TSpriteKitWithCompletionHandler = procedure(param1: NSError; param2: NSArray)
    of object;
  TSpriteKitUsingBlock1 = procedure(param1: SKPhysicsBody; param2: PBoolean)
    of object;
  TSpriteKitUsingBlock2 = procedure(param1: SKPhysicsBody; param2: CGPoint;
    param3: CGVector; param4: PBoolean) of object;
  // ===== Interface declarations =====

  SKActionClass = interface(NSObjectClass)
    ['{1705EBAD-A4EA-413E-9990-9D3754752FC6}']
    { class } function moveBy(delta: CGVector; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function moveByX(deltaX: CGFloat; y: CGFloat;
      duration: NSTimeInterval): SKAction; cdecl;
    { class } function moveTo(location: CGPoint; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function moveToX(x: CGFloat; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function moveToY(y: CGFloat; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function rotateByAngle(radians: CGFloat; duration: NSTimeInterval)
      : SKAction; cdecl;
    [MethodName('rotateToAngle:duration:')]
    { class } function rotateToAngleDuration(radians: CGFloat;
      duration: NSTimeInterval): SKAction; cdecl;
    [MethodName('rotateToAngle:duration:shortestUnitArc:')]
    { class } function rotateToAngleDurationShortestUnitArc(radians: CGFloat;
      duration: NSTimeInterval; shortestUnitArc: Boolean): SKAction; cdecl;
    { class } function resizeByWidth(width: CGFloat; height: CGFloat;
      duration: NSTimeInterval): SKAction; cdecl;
    [MethodName('resizeToWidth:height:duration:')]
    { class } function resizeToWidthHeightDuration(width: CGFloat;
      height: CGFloat; duration: NSTimeInterval): SKAction; cdecl;
    [MethodName('resizeToWidth:duration:')]
    { class } function resizeToWidthDuration(width: CGFloat;
      duration: NSTimeInterval): SKAction; cdecl;
    { class } function resizeToHeight(height: CGFloat; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function scaleBy(scale: CGFloat; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function scaleXBy(xScale: CGFloat; y: CGFloat;
      duration: NSTimeInterval): SKAction; cdecl;
    { class } function scaleTo(scale: CGFloat; duration: NSTimeInterval)
      : SKAction; cdecl;
    [MethodName('scaleXTo:y:duration:')]
    { class } function scaleXToYDuration(xScale: CGFloat; y: CGFloat;
      duration: NSTimeInterval): SKAction; cdecl;
    [MethodName('scaleXTo:duration:')]
    { class } function scaleXToDuration(scale: CGFloat;
      duration: NSTimeInterval): SKAction; cdecl;
    { class } function scaleYTo(scale: CGFloat; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function scaleToSize(size: CGSize; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function sequence(actions: NSArray): SKAction; cdecl;
    { class } function group(actions: NSArray): SKAction; cdecl;
    { class } function repeatAction(action: SKAction; count: NSUInteger)
      : SKAction; cdecl;
    { class } function repeatActionForever(action: SKAction): SKAction; cdecl;
    { class } function fadeInWithDuration(duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function fadeOutWithDuration(duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function fadeAlphaBy(factor: CGFloat; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function fadeAlphaTo(alpha: CGFloat; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function hide: SKAction; cdecl;
    { class } function unhide: SKAction; cdecl;
    [MethodName('setTexture:')]
    { class } function setTexture(texture: SKTexture): SKAction; cdecl;
    [MethodName('setNormalTexture:')]
    { class } function setNormalTexture(texture: SKTexture): SKAction; cdecl;
    [MethodName('setTexture:resize:')]
    { class } function setTextureResize(texture: SKTexture; resize: Boolean)
      : SKAction; cdecl;
    [MethodName('setNormalTexture:resize:')]
    { class } function setNormalTextureResize(texture: SKTexture;
      resize: Boolean): SKAction; cdecl;
    [MethodName('animateWithTextures:timePerFrame:')]
    { class } function animateWithTexturesTimePerFrame(textures: NSArray;
      timePerFrame: NSTimeInterval): SKAction; cdecl;
    [MethodName('animateWithNormalTextures:timePerFrame:')]
    { class } function animateWithNormalTexturesTimePerFrame(textures: NSArray;
      timePerFrame: NSTimeInterval): SKAction; cdecl;
    [MethodName('animateWithTextures:timePerFrame:resize:restore:')]
    { class } function animateWithTexturesTimePerFrameResizeRestore
      (textures: NSArray; timePerFrame: NSTimeInterval; resize: Boolean;
      restore: Boolean): SKAction; cdecl;
    [MethodName('animateWithNormalTextures:timePerFrame:resize:restore:')]
    { class } function animateWithNormalTexturesTimePerFrameResizeRestore
      (textures: NSArray; timePerFrame: NSTimeInterval; resize: Boolean;
      restore: Boolean): SKAction; cdecl;
    { class } function playSoundFileNamed(soundFile: NSString;
      waitForCompletion: Boolean): SKAction; cdecl;
    { class } function colorizeWithColor(color: UIColor;
      colorBlendFactor: CGFloat; duration: NSTimeInterval): SKAction; cdecl;
    { class } function colorizeWithColorBlendFactor(colorBlendFactor: CGFloat;
      duration: NSTimeInterval): SKAction; cdecl;
    { class } function falloffTo(falloff: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function falloffBy(falloff: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    [MethodName('followPath:duration:')]
    { class } function followPathDuration(path: CGPathRef;
      duration: NSTimeInterval): SKAction; cdecl;
    [MethodName('followPath:asOffset:orientToPath:duration:')]
    { class } function followPathAsOffsetOrientToPathDuration(path: CGPathRef;
      asOffset: Boolean; orientToPath: Boolean; duration: NSTimeInterval)
      : SKAction; cdecl;
    [MethodName('followPath:speed:')]
    { class } function followPathSpeed(path: CGPathRef; speed: CGFloat)
      : SKAction; cdecl;
    [MethodName('followPath:asOffset:orientToPath:speed:')]
    { class } function followPathAsOffsetOrientToPathSpeed(path: CGPathRef;
      asOffset: Boolean; orientToPath: Boolean; speed: CGFloat)
      : SKAction; cdecl;
    { class } function speedBy(speed: CGFloat; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function speedTo(speed: CGFloat; duration: NSTimeInterval)
      : SKAction; cdecl;
    [MethodName('reachTo:rootNode:duration:')]
    { class } function reachToRootNodeDuration(position: CGPoint;
      rootNode: SKNode; duration: NSTimeInterval): SKAction; cdecl;
    [MethodName('reachTo:rootNode:velocity:')]
    { class } function reachToRootNodeVelocity(position: CGPoint;
      rootNode: SKNode; velocity: CGFloat): SKAction; cdecl;
    [MethodName('reachToNode:rootNode:duration:')]
    { class } function reachToNodeRootNodeDuration(node: SKNode;
      rootNode: SKNode; duration: NSTimeInterval): SKAction; cdecl;
    [MethodName('reachToNode:rootNode:velocity:')]
    { class } function reachToNodeRootNodeVelocity(node: SKNode;
      rootNode: SKNode; velocity: CGFloat): SKAction; cdecl;
    { class } function strengthTo(strength: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function strengthBy(strength: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    [MethodName('waitForDuration:')]
    { class } function waitForDuration(duration: NSTimeInterval)
      : SKAction; cdecl;
    [MethodName('waitForDuration:withRange:')]
    { class } function waitForDurationWithRange(duration: NSTimeInterval;
      withRange: NSTimeInterval): SKAction; cdecl;
    { class } function removeFromParent: SKAction; cdecl;
    { class } function performSelector(selector: SEL; onTarget: Pointer)
      : SKAction; cdecl;
    [MethodName('runBlock:')]
    { class } function runBlock(block: Pointer { dispatch_block_t } )
      : SKAction; cdecl;
    [MethodName('runBlock:queue:')]
    { class } function runBlockQueue(block: Pointer { dispatch_block_t };
      queue: dispatch_queue_t): SKAction; cdecl;
    { class } function runAction(action: SKAction; onChildWithName: NSString)
      : SKAction; cdecl;
    { class } function customActionWithDuration(duration: NSTimeInterval;
      actionBlock: TSpriteKitActionBlock): SKAction; cdecl;
    [MethodName('actionNamed:')]
    { class } function actionNamed(name: NSString): SKAction; cdecl;
    [MethodName('actionNamed:duration:')]
    { class } function actionNamedDuration(name: NSString;
      duration: NSTimeInterval): SKAction; cdecl;
    [MethodName('actionNamed:fromURL:')]
    { class } function actionNamedFromURL(name: NSString; fromURL: NSURL)
      : SKAction; cdecl;
    [MethodName('actionNamed:fromURL:duration:')]
    { class } function actionNamedFromURLDuration(name: NSString;
      fromURL: NSURL; duration: NSTimeInterval): SKAction; cdecl;
    { class } function changeChargeTo(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function changeChargeBy(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function changeMassTo(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function changeMassBy(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    [MethodName('applyForce:duration:')]
    { class } function applyForceDuration(force: CGVector;
      duration: NSTimeInterval): SKAction; cdecl;
    [MethodName('applyForce:atPoint:duration:')]
    { class } function applyForceAtPointDuration(force: CGVector;
      atPoint: CGPoint; duration: NSTimeInterval): SKAction; cdecl;
    { class } function applyTorque(torque: CGFloat; duration: NSTimeInterval)
      : SKAction; cdecl;
    [MethodName('applyImpulse:duration:')]
    { class } function applyImpulseDuration(impulse: CGVector;
      duration: NSTimeInterval): SKAction; cdecl;
    [MethodName('applyImpulse:atPoint:duration:')]
    { class } function applyImpulseAtPointDuration(impulse: CGVector;
      atPoint: CGPoint; duration: NSTimeInterval): SKAction; cdecl;
    { class } function applyAngularImpulse(impulse: CGFloat;
      duration: NSTimeInterval): SKAction; cdecl;
    { class } function play: SKAction; cdecl;
    { class } function pause: SKAction; cdecl;
    { class } function stop: SKAction; cdecl;
    { class } function changePlaybackRateTo(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function changePlaybackRateBy(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function changeVolumeTo(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function changeVolumeBy(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function warpTo(warp: SKWarpGeometry; duration: NSTimeInterval)
      : SKAction; cdecl;
    [MethodName('animateWithWarps:times:')]
    { class } function animateWithWarpsTimes(warps: NSArray; times: NSArray)
      : SKAction; cdecl;
    [MethodName('animateWithWarps:times:restore:')]
    { class } function animateWithWarpsTimesRestore(warps: NSArray;
      times: NSArray; restore: Boolean): SKAction; cdecl;
    { class } function stereoPanTo(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function stereoPanBy(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function changeReverbTo(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function changeReverbBy(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function changeObstructionTo(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function changeObstructionBy(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function changeOcclusionTo(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
    { class } function changeOcclusionBy(v: Single; duration: NSTimeInterval)
      : SKAction; cdecl;
  end;

  SKAction = interface(NSObject)
    ['{763B47B0-1DA4-45E6-B316-761E2787419B}']
    procedure setDuration(duration: NSTimeInterval); cdecl;
    function duration: NSTimeInterval; cdecl;
    procedure setTimingMode(timingMode: SKActionTimingMode); cdecl;
    function timingMode: SKActionTimingMode; cdecl;
    procedure setTimingFunction(timingFunction: SKActionTimingFunction); cdecl;
    function timingFunction: SKActionTimingFunction; cdecl;
    procedure setSpeed(speed: CGFloat); cdecl;
    function speed: CGFloat; cdecl;
    function reversedAction: SKAction; cdecl;
  end;

  TSKAction = class(TOCGenericImport<SKActionClass, SKAction>)
  end;

  PSKAction = Pointer;

  SKNodeClass = interface(UIResponderClass)
    ['{D5F02802-AAC5-4B24-B3BE-8A0F76519345}']
    { class } function node: Pointer { instancetype }; cdecl;
    [MethodName('nodeWithFileNamed:')]
    { class } function nodeWithFileNamed(filename: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('nodeWithFileNamed:securelyWithClasses:andError:')]
    { class } function nodeWithFileNamedSecurelyWithClassesAndError
      (filename: NSString; securelyWithClasses: NSSet; andError: NSError)
      : Pointer { instancetype }; cdecl;
  end;

  SKNode = interface(UIResponder)
    ['{D5500727-2AEC-4D92-B0A6-6FA155949EE8}']
    function init: Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function frame: CGRect; cdecl;
    function calculateAccumulatedFrame: CGRect; cdecl;
    procedure setPosition(position: CGPoint); cdecl;
    function position: CGPoint; cdecl;
    procedure setZPosition(zPosition: CGFloat); cdecl;
    function zPosition: CGFloat; cdecl;
    procedure setZRotation(zRotation: CGFloat); cdecl;
    function zRotation: CGFloat; cdecl;
    procedure setXScale(xScale: CGFloat); cdecl;
    function xScale: CGFloat; cdecl;
    procedure setYScale(yScale: CGFloat); cdecl;
    function yScale: CGFloat; cdecl;
    procedure setSpeed(speed: CGFloat); cdecl;
    function speed: CGFloat; cdecl;
    procedure setAlpha(alpha: CGFloat); cdecl;
    function alpha: CGFloat; cdecl;
    procedure setPaused(paused: Boolean); cdecl;
    function isPaused: Boolean; cdecl;
    procedure setHidden(hidden: Boolean); cdecl;
    function isHidden: Boolean; cdecl;
    procedure setUserInteractionEnabled(userInteractionEnabled: Boolean); cdecl;
    function isUserInteractionEnabled: Boolean; cdecl;
    procedure setFocusBehavior(focusBehavior: SKNodeFocusBehavior); cdecl;
    function focusBehavior: SKNodeFocusBehavior; cdecl;
    function parent: SKNode; cdecl;
    function children: NSArray; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    function scene: SKScene; cdecl;
    procedure setPhysicsBody(physicsBody: SKPhysicsBody); cdecl;
    function physicsBody: SKPhysicsBody; cdecl;
    procedure setUserData(userData: NSMutableDictionary); cdecl;
    function userData: NSMutableDictionary; cdecl;
    procedure setReachConstraints(reachConstraints: SKReachConstraints); cdecl;
    function reachConstraints: SKReachConstraints; cdecl;
    procedure setConstraints(constraints: NSArray); cdecl;
    function constraints: NSArray; cdecl;
    procedure setAttributeValues(attributeValues: NSDictionary); cdecl;
    function attributeValues: NSDictionary; cdecl;
    function valueForAttributeNamed(key: NSString): SKAttributeValue; cdecl;
    procedure setValue(value: SKAttributeValue;
      forAttributeNamed: NSString); cdecl;
    procedure setScale(scale: CGFloat); cdecl;
    procedure addChild(node: SKNode); cdecl;
    procedure insertChild(node: SKNode; atIndex: NSInteger); cdecl;
    procedure removeChildrenInArray(nodes: NSArray); cdecl;
    procedure removeAllChildren; cdecl;
    procedure removeFromParent; cdecl;
    procedure moveToParent(parent: SKNode); cdecl;
    function childNodeWithName(name: NSString): SKNode; cdecl;
    procedure enumerateChildNodesWithName(name: NSString;
      usingBlock: TSpriteKitUsingBlock); cdecl;
    function objectForKeyedSubscript(name: NSString): NSArray; cdecl;
    function inParentHierarchy(parent: SKNode): Boolean; cdecl;
    [MethodName('runAction:')]
    procedure runAction(action: SKAction); cdecl;
    [MethodName('runAction:completion:')]
    procedure runActionCompletion(action: SKAction;
      completion: TSpriteKitCompletion); cdecl;
    [MethodName('runAction:withKey:')]
    procedure runActionWithKey(action: SKAction; withKey: NSString); cdecl;
    function hasActions: Boolean; cdecl;
    function actionForKey(key: NSString): SKAction; cdecl;
    procedure removeActionForKey(key: NSString); cdecl;
    procedure removeAllActions; cdecl;
    function containsPoint(p: CGPoint): Boolean; cdecl;
    function nodeAtPoint(p: CGPoint): SKNode; cdecl;
    function nodesAtPoint(p: CGPoint): NSArray; cdecl;
    [MethodName('convertPoint:fromNode:')]
    function convertPointFromNode(point: CGPoint; fromNode: SKNode)
      : CGPoint; cdecl;
    [MethodName('convertPoint:toNode:')]
    function convertPointToNode(point: CGPoint; toNode: SKNode): CGPoint; cdecl;
    function intersectsNode(node: SKNode): Boolean; cdecl;
    function isEqualToNode(node: SKNode): Boolean; cdecl;
  end;

  TSKNode = class(TOCGenericImport<SKNodeClass, SKNode>)
  end;

  PSKNode = Pointer;

  SKEffectNodeClass = interface(SKNodeClass)
    ['{600C6E9D-232C-45F4-AF4D-683360B3EF29}']
  end;

  SKEffectNode = interface(SKNode)
    ['{0C2C5B92-08B8-478D-9807-4C8FD9527DF9}']
    procedure setFilter(filter: CIFilter); cdecl;
    function filter: CIFilter; cdecl;
    procedure setShouldCenterFilter(shouldCenterFilter: Boolean); cdecl;
    function shouldCenterFilter: Boolean; cdecl;
    procedure setShouldEnableEffects(shouldEnableEffects: Boolean); cdecl;
    function shouldEnableEffects: Boolean; cdecl;
    procedure setShouldRasterize(shouldRasterize: Boolean); cdecl;
    function shouldRasterize: Boolean; cdecl;
    procedure setBlendMode(blendMode: SKBlendMode); cdecl;
    function blendMode: SKBlendMode; cdecl;
    procedure setShader(shader: SKShader); cdecl;
    function shader: SKShader; cdecl;
    procedure setAttributeValues(attributeValues: NSDictionary); cdecl;
    function attributeValues: NSDictionary; cdecl;
    function valueForAttributeNamed(key: NSString): SKAttributeValue; cdecl;
    procedure setValue(value: SKAttributeValue;
      forAttributeNamed: NSString); cdecl;
  end;

  TSKEffectNode = class(TOCGenericImport<SKEffectNodeClass, SKEffectNode>)
  end;

  PSKEffectNode = Pointer;

  SKSceneClass = interface(SKEffectNodeClass)
    ['{323F4B13-C4FA-4D57-BE09-2B6A424F1FC3}']
    { class } function sceneWithSize(size: CGSize)
      : Pointer { instancetype }; cdecl;
  end;

  SKScene = interface(SKEffectNode)
    ['{FB80E816-A6B8-4A9B-BCC5-270AF3833933}']
    function initWithSize(size: CGSize): Pointer { instancetype }; cdecl;
    procedure sceneDidLoad; cdecl;
    procedure setSize(size: CGSize); cdecl;
    function size: CGSize; cdecl;
    procedure setScaleMode(scaleMode: SKSceneScaleMode); cdecl;
    function scaleMode: SKSceneScaleMode; cdecl;
    procedure setCamera(camera: SKCameraNode); cdecl;
    function camera: SKCameraNode; cdecl;
    procedure setListener(listener: SKNode); cdecl;
    function listener: SKNode; cdecl;
    function audioEngine: AVAudioEngine; cdecl;
    procedure setBackgroundColor(backgroundColor: UIColor); cdecl;
    function backgroundColor: UIColor; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setAnchorPoint(anchorPoint: CGPoint); cdecl;
    function anchorPoint: CGPoint; cdecl;
    function physicsWorld: SKPhysicsWorld; cdecl;
    function view: SKView; cdecl;
    function convertPointFromView(point: CGPoint): CGPoint; cdecl;
    function convertPointToView(point: CGPoint): CGPoint; cdecl;
    procedure update(currentTime: NSTimeInterval); cdecl;
    procedure didEvaluateActions; cdecl;
    procedure didSimulatePhysics; cdecl;
    procedure didApplyConstraints; cdecl;
    procedure didFinishUpdate; cdecl;
    procedure didMoveToView(view: SKView); cdecl;
    procedure willMoveFromView(view: SKView); cdecl;
    procedure didChangeSize(oldSize: CGSize); cdecl;
  end;

  TSKScene = class(TOCGenericImport<SKSceneClass, SKScene>)
  end;

  PSKScene = Pointer;

  SKTextureClass = interface(NSObjectClass)
    ['{655CC1D2-0EF9-4520-B7E4-2AF86133B7D0}']
    { class } function textureWithImageNamed(name: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function textureWithRect(rect: CGRect; inTexture: SKTexture)
      : Pointer { instancetype }; cdecl;
    { class } function textureVectorNoiseWithSmoothness(smoothness: CGFloat;
      size: CGSize): Pointer { instancetype }; cdecl;
    { class } function textureNoiseWithSmoothness(smoothness: CGFloat;
      size: CGSize; grayscale: Boolean): Pointer { instancetype }; cdecl;
    { class } function textureWithCGImage(image: CGImageRef)
      : Pointer { instancetype }; cdecl;
    { class } function textureWithImage(image: UIImage)
      : Pointer { instancetype }; cdecl;
    [MethodName('textureWithData:size:')]
    { class } function textureWithDataSize(pixelData: NSData; size: CGSize)
      : Pointer { instancetype }; cdecl;
    [MethodName('textureWithData:size:flipped:')]
    { class } function textureWithDataSizeFlipped(pixelData: NSData;
      size: CGSize; flipped: Boolean): Pointer { instancetype }; cdecl;
    [MethodName('textureWithData:size:rowLength:alignment:')]
    { class } function textureWithDataSizeRowLengthAlignment(pixelData: NSData;
      size: CGSize; rowLength: Cardinal; alignment: Cardinal)
      : Pointer { instancetype }; cdecl;
    { class } procedure preloadTextures(textures: NSArray;
      withCompletionHandler: TSpriteKitCompletion); cdecl;
  end;

  SKTexture = interface(NSObject)
    ['{D0257178-8C87-4FE3-B1AA-C67966E2F1E2}']
    function textureByApplyingCIFilter(filter: CIFilter)
      : Pointer { instancetype }; cdecl;
    function textureByGeneratingNormalMap: Pointer { instancetype }; cdecl;
    function textureByGeneratingNormalMapWithSmoothness(smoothness: CGFloat;
      contrast: CGFloat): Pointer { instancetype }; cdecl;
    function textureRect: CGRect; cdecl;
    function size: CGSize; cdecl;
    procedure setFilteringMode(filteringMode: SKTextureFilteringMode); cdecl;
    function filteringMode: SKTextureFilteringMode; cdecl;
    procedure setUsesMipmaps(usesMipmaps: Boolean); cdecl;
    function usesMipmaps: Boolean; cdecl;
    function CGImage: CGImageRef; cdecl;
    procedure preloadWithCompletionHandler(completionHandler
      : TSpriteKitCompletion); cdecl;
  end;

  TSKTexture = class(TOCGenericImport<SKTextureClass, SKTexture>)
  end;

  PSKTexture = Pointer;

  SKPhysicsBodyClass = interface(NSObjectClass)
    ['{D88B56EB-9A99-494E-ABF5-B162A5DA5DEA}']
    [MethodName('bodyWithCircleOfRadius:')]
    { class } function bodyWithCircleOfRadius(r: CGFloat): SKPhysicsBody; cdecl;
    [MethodName('bodyWithCircleOfRadius:center:')]
    { class } function bodyWithCircleOfRadiusCenter(r: CGFloat; center: CGPoint)
      : SKPhysicsBody; cdecl;
    [MethodName('bodyWithRectangleOfSize:')]
    { class } function bodyWithRectangleOfSize(s: CGSize): SKPhysicsBody; cdecl;
    [MethodName('bodyWithRectangleOfSize:center:')]
    { class } function bodyWithRectangleOfSizeCenter(s: CGSize; center: CGPoint)
      : SKPhysicsBody; cdecl;
    { class } function bodyWithPolygonFromPath(path: CGPathRef)
      : SKPhysicsBody; cdecl;
    { class } function bodyWithEdgeFromPoint(p1: CGPoint; toPoint: CGPoint)
      : SKPhysicsBody; cdecl;
    { class } function bodyWithEdgeChainFromPath(path: CGPathRef)
      : SKPhysicsBody; cdecl;
    { class } function bodyWithEdgeLoopFromPath(path: CGPathRef)
      : SKPhysicsBody; cdecl;
    { class } function bodyWithEdgeLoopFromRect(rect: CGRect)
      : SKPhysicsBody; cdecl;
    [MethodName('bodyWithTexture:size:')]
    { class } function bodyWithTextureSize(texture: SKTexture; size: CGSize)
      : SKPhysicsBody; cdecl;
    [MethodName('bodyWithTexture:alphaThreshold:size:')]
    { class } function bodyWithTextureAlphaThresholdSize(texture: SKTexture;
      alphaThreshold: Single; size: CGSize): SKPhysicsBody; cdecl;
    { class } function bodyWithBodies(bodies: NSArray): SKPhysicsBody; cdecl;
  end;

  SKPhysicsBody = interface(NSObject)
    ['{91798B1C-9607-4A82-B00B-086289AB6813}']
    procedure setDynamic(dynamic: Boolean); cdecl;
    function isDynamic: Boolean; cdecl;
    procedure setUsesPreciseCollisionDetection(usesPreciseCollisionDetection
      : Boolean); cdecl;
    function usesPreciseCollisionDetection: Boolean; cdecl;
    procedure setAllowsRotation(allowsRotation: Boolean); cdecl;
    function allowsRotation: Boolean; cdecl;
    procedure setPinned(pinned: Boolean); cdecl;
    function pinned: Boolean; cdecl;
    procedure setResting(resting: Boolean); cdecl;
    function isResting: Boolean; cdecl;
    procedure setFriction(friction: CGFloat); cdecl;
    function friction: CGFloat; cdecl;
    procedure setCharge(charge: CGFloat); cdecl;
    function charge: CGFloat; cdecl;
    procedure setRestitution(restitution: CGFloat); cdecl;
    function restitution: CGFloat; cdecl;
    procedure setLinearDamping(linearDamping: CGFloat); cdecl;
    function linearDamping: CGFloat; cdecl;
    procedure setAngularDamping(angularDamping: CGFloat); cdecl;
    function angularDamping: CGFloat; cdecl;
    procedure setDensity(density: CGFloat); cdecl;
    function density: CGFloat; cdecl;
    procedure setMass(mass: CGFloat); cdecl;
    function mass: CGFloat; cdecl;
    function area: CGFloat; cdecl;
    procedure setAffectedByGravity(affectedByGravity: Boolean); cdecl;
    function affectedByGravity: Boolean; cdecl;
    procedure setFieldBitMask(fieldBitMask: LongWord); cdecl;
    function fieldBitMask: LongWord; cdecl;
    procedure setCategoryBitMask(categoryBitMask: LongWord); cdecl;
    function categoryBitMask: LongWord; cdecl;
    procedure setCollisionBitMask(collisionBitMask: LongWord); cdecl;
    function collisionBitMask: LongWord; cdecl;
    procedure setContactTestBitMask(contactTestBitMask: LongWord); cdecl;
    function contactTestBitMask: LongWord; cdecl;
    function joints: NSArray; cdecl;
    function node: SKNode; cdecl;
    procedure setVelocity(velocity: CGVector); cdecl;
    function velocity: CGVector; cdecl;
    procedure setAngularVelocity(angularVelocity: CGFloat); cdecl;
    function angularVelocity: CGFloat; cdecl;
    [MethodName('applyForce:')]
    procedure applyForce(force: CGVector); cdecl;
    [MethodName('applyForce:atPoint:')]
    procedure applyForceAtPoint(force: CGVector; atPoint: CGPoint); cdecl;
    procedure applyTorque(torque: CGFloat); cdecl;
    [MethodName('applyImpulse:')]
    procedure applyImpulse(impulse: CGVector); cdecl;
    [MethodName('applyImpulse:atPoint:')]
    procedure applyImpulseAtPoint(impulse: CGVector; atPoint: CGPoint); cdecl;
    procedure applyAngularImpulse(impulse: CGFloat); cdecl;
    function allContactedBodies: NSArray; cdecl;
  end;

  TSKPhysicsBody = class(TOCGenericImport<SKPhysicsBodyClass, SKPhysicsBody>)
  end;

  PSKPhysicsBody = Pointer;

  SKFieldNodeClass = interface(SKNodeClass)
    ['{F39E85F7-9A8C-437C-ACCD-8B332933343F}']
    { class } function dragField: SKFieldNode; cdecl;
    { class } function vortexField: SKFieldNode; cdecl;
    { class } function radialGravityField: SKFieldNode; cdecl;
    { class } function linearGravityFieldWithVector(direction: vector_float3)
      : SKFieldNode; cdecl;
    { class } function velocityFieldWithVector(direction: vector_float3)
      : SKFieldNode; cdecl;
    { class } function velocityFieldWithTexture(velocityTexture: SKTexture)
      : SKFieldNode; cdecl;
    { class } function noiseFieldWithSmoothness(smoothness: CGFloat;
      animationSpeed: CGFloat): SKFieldNode; cdecl;
    { class } function turbulenceFieldWithSmoothness(smoothness: CGFloat;
      animationSpeed: CGFloat): SKFieldNode; cdecl;
    { class } function springField: SKFieldNode; cdecl;
    { class } function electricField: SKFieldNode; cdecl;
    { class } function magneticField: SKFieldNode; cdecl;
    { class } function customFieldWithEvaluationBlock
      (block: SKFieldForceEvaluator): SKFieldNode; cdecl;
  end;

  SKFieldNode = interface(SKNode)
    ['{AC512662-4A1A-459B-98B1-ED0C0C0A2F7F}']
    procedure setRegion(region: SKRegion); cdecl;
    function region: SKRegion; cdecl;
    procedure setStrength(strength: Single); cdecl;
    function strength: Single; cdecl;
    procedure setFalloff(falloff: Single); cdecl;
    function falloff: Single; cdecl;
    procedure setMinimumRadius(minimumRadius: Single); cdecl;
    function minimumRadius: Single; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    procedure setExclusive(exclusive: Boolean); cdecl;
    function isExclusive: Boolean; cdecl;
    procedure setCategoryBitMask(categoryBitMask: LongWord); cdecl;
    function categoryBitMask: LongWord; cdecl;
    procedure setDirection(direction: vector_float3); cdecl;
    function direction: vector_float3; cdecl;
    procedure setSmoothness(smoothness: Single); cdecl;
    function smoothness: Single; cdecl;
    procedure setAnimationSpeed(animationSpeed: Single); cdecl;
    function animationSpeed: Single; cdecl;
    procedure setTexture(texture: SKTexture); cdecl;
    function texture: SKTexture; cdecl;
  end;

  TSKFieldNode = class(TOCGenericImport<SKFieldNodeClass, SKFieldNode>)
  end;

  PSKFieldNode = Pointer;

  SKReachConstraintsClass = interface(NSObjectClass)
    ['{3F0C2F51-D38F-4B53-9B0A-0E30874CE406}']
  end;

  SKReachConstraints = interface(NSObject)
    ['{FF115E0C-AB35-4DA1-9020-B61119B8C116}']
    procedure setLowerAngleLimit(lowerAngleLimit: CGFloat); cdecl;
    function lowerAngleLimit: CGFloat; cdecl;
    procedure setUpperAngleLimit(upperAngleLimit: CGFloat); cdecl;
    function upperAngleLimit: CGFloat; cdecl;
    function initWithLowerAngleLimit(lowerAngleLimit: CGFloat;
      upperAngleLimit: CGFloat): Pointer { instancetype }; cdecl;
  end;

  TSKReachConstraints = class(TOCGenericImport<SKReachConstraintsClass,
    SKReachConstraints>)
  end;

  PSKReachConstraints = Pointer;

  SKConstraintClass = interface(NSObjectClass)
    ['{4BBBE8D8-A938-4D7D-9505-C84DC43DF534}']
    [MethodName('positionX:')]
    { class } function positionX(range: SKRange)
      : Pointer { instancetype }; cdecl;
    { class } function positionY(range: SKRange)
      : Pointer { instancetype }; cdecl;
    [MethodName('positionX:Y:')]
    { class } function positionXY(xRange: SKRange; y: SKRange)
      : Pointer { instancetype }; cdecl;
    [MethodName('distance:toNode:')]
    { class } function distanceToNode(range: SKRange; toNode: SKNode)
      : Pointer { instancetype }; cdecl;
    [MethodName('distance:toPoint:')]
    { class } function distanceToPoint(range: SKRange; toPoint: CGPoint)
      : Pointer { instancetype }; cdecl;
    [MethodName('distance:toPoint:inNode:')]
    { class } function distanceToPointInNode(range: SKRange; toPoint: CGPoint;
      inNode: SKNode): Pointer { instancetype }; cdecl;
    { class } function zRotation(zRange: SKRange)
      : Pointer { instancetype }; cdecl;
    { class } function orientToNode(node: SKNode; offset: SKRange)
      : Pointer { instancetype }; cdecl;
    [MethodName('orientToPoint:offset:')]
    { class } function orientToPointOffset(point: CGPoint; offset: SKRange)
      : Pointer { instancetype }; cdecl;
    [MethodName('orientToPoint:inNode:offset:')]
    { class } function orientToPointInNodeOffset(point: CGPoint; inNode: SKNode;
      offset: SKRange): Pointer { instancetype }; cdecl;
  end;

  SKConstraint = interface(NSObject)
    ['{54CD1D58-FF02-48F5-A1A9-50A6C0A981ED}']
    procedure setEnabled(enabled: Boolean); cdecl;
    function enabled: Boolean; cdecl;
    procedure setReferenceNode(referenceNode: SKNode); cdecl;
    function referenceNode: SKNode; cdecl;
  end;

  TSKConstraint = class(TOCGenericImport<SKConstraintClass, SKConstraint>)
  end;

  PSKConstraint = Pointer;

  SKAttributeValueClass = interface(NSObjectClass)
    ['{362298A6-B01C-4F01-AE48-DC1DC24097FC}']
    { class } function valueWithFloat(value: Single)
      : Pointer { instancetype }; cdecl;
    { class } function valueWithVectorFloat2(value: vector_float2)
      : Pointer { instancetype }; cdecl;
    { class } function valueWithVectorFloat3(value: vector_float3)
      : Pointer { instancetype }; cdecl;
    { class } function valueWithVectorFloat4(value: vector_float4)
      : Pointer { instancetype }; cdecl;
  end;

  SKAttributeValue = interface(NSObject)
    ['{75A48B48-4C9A-4884-88C2-811894E63CF6}']
    function init: Pointer { instancetype }; cdecl;
    procedure setFloatValue(floatValue: Single); cdecl;
    function floatValue: Single; cdecl;
    procedure setVectorFloat2Value(vectorFloat2Value: vector_float2); cdecl;
    function vectorFloat2Value: vector_float2; cdecl;
    procedure setVectorFloat3Value(vectorFloat3Value: vector_float3); cdecl;
    function vectorFloat3Value: vector_float3; cdecl;
    procedure setVectorFloat4Value(vectorFloat4Value: vector_float4); cdecl;
    function vectorFloat4Value: vector_float4; cdecl;
  end;

  TSKAttributeValue = class(TOCGenericImport<SKAttributeValueClass,
    SKAttributeValue>)
  end;

  PSKAttributeValue = Pointer;

  SKWarpGeometryClass = interface(NSObjectClass)
    ['{1481120C-5D99-473B-8406-234B97BFD93E}']
  end;

  SKWarpGeometry = interface(NSObject)
    ['{7BB30D7D-B910-452C-AEEA-1F45A43568C7}']
  end;

  TSKWarpGeometry = class(TOCGenericImport<SKWarpGeometryClass, SKWarpGeometry>)
  end;

  PSKWarpGeometry = Pointer;

  SKNodeTouches = interface(IObjectiveC)
    ['{6D0E5534-534C-40C5-BEF4-C8044C78E817}']
    function locationInNode(node: SKNode): CGPoint; cdecl;
    function previousLocationInNode(node: SKNode): CGPoint; cdecl;
  end;

  SKUniformClass = interface(NSObjectClass)
    ['{78F2D5F7-DC30-457D-A454-D28BF18B1D53}']
    [MethodName('uniformWithName:')]
    { class } function uniformWithName(name: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:texture:')]
    { class } function uniformWithNameTexture(name: NSString;
      texture: SKTexture): Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:float:')]
    { class } function uniformWithNameFloat(name: NSString; float: Single)
      : Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:vectorFloat2:')]
    { class } function uniformWithNameVectorFloat2(name: NSString;
      vectorFloat2: vector_float2): Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:vectorFloat3:')]
    { class } function uniformWithNameVectorFloat3(name: NSString;
      vectorFloat3: vector_float3): Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:vectorFloat4:')]
    { class } function uniformWithNameVectorFloat4(name: NSString;
      vectorFloat4: vector_float4): Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:matrixFloat2x2:')]
    { class } function uniformWithNameMatrixFloat2x2(name: NSString;
      matrixFloat2x2: matrix_float2x2): Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:matrixFloat3x3:')]
    { class } function uniformWithNameMatrixFloat3x3(name: NSString;
      matrixFloat3x3: matrix_float3x3): Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:matrixFloat4x4:')]
    { class } function uniformWithNameMatrixFloat4x4(name: NSString;
      matrixFloat4x4: matrix_float4x4): Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:floatVector2:')]
    { class } function uniformWithNameFloatVector2(name: NSString;
      floatVector2: GLKVector2): Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:floatVector3:')]
    { class } function uniformWithNameFloatVector3(name: NSString;
      floatVector3: GLKVector3): Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:floatVector4:')]
    { class } function uniformWithNameFloatVector4(name: NSString;
      floatVector4: GLKVector4): Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:floatMatrix2:')]
    { class } function uniformWithNameFloatMatrix2(name: NSString;
      floatMatrix2: GLKMatrix2): Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:floatMatrix3:')]
    { class } function uniformWithNameFloatMatrix3(name: NSString;
      floatMatrix3: GLKMatrix3): Pointer { instancetype }; cdecl;
    [MethodName('uniformWithName:floatMatrix4:')]
    { class } function uniformWithNameFloatMatrix4(name: NSString;
      floatMatrix4: GLKMatrix4): Pointer { instancetype }; cdecl;
  end;

  SKUniform = interface(NSObject)
    ['{8E260261-F018-487B-B09D-952CC0935998}']
    function name: NSString; cdecl;
    function uniformType: SKUniformType; cdecl;
    procedure setTextureValue(textureValue: SKTexture); cdecl;
    function textureValue: SKTexture; cdecl;
    procedure setFloatValue(floatValue: Single); cdecl;
    function floatValue: Single; cdecl;
    procedure setVectorFloat2Value(vectorFloat2Value: vector_float2); cdecl;
    function vectorFloat2Value: vector_float2; cdecl;
    procedure setVectorFloat3Value(vectorFloat3Value: vector_float3); cdecl;
    function vectorFloat3Value: vector_float3; cdecl;
    procedure setVectorFloat4Value(vectorFloat4Value: vector_float4); cdecl;
    function vectorFloat4Value: vector_float4; cdecl;
    procedure setMatrixFloat2x2Value(matrixFloat2x2Value
      : matrix_float2x2); cdecl;
    function matrixFloat2x2Value: matrix_float2x2; cdecl;
    procedure setMatrixFloat3x3Value(matrixFloat3x3Value
      : matrix_float3x3); cdecl;
    function matrixFloat3x3Value: matrix_float3x3; cdecl;
    procedure setMatrixFloat4x4Value(matrixFloat4x4Value
      : matrix_float4x4); cdecl;
    function matrixFloat4x4Value: matrix_float4x4; cdecl;
    [MethodName('initWithName:')]
    function initWithName(name: NSString): Pointer { instancetype }; cdecl;
    [MethodName('initWithName:texture:')]
    function initWithNameTexture(name: NSString; texture: SKTexture)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithName:float:')]
    function initWithNameFloat(name: NSString; float: Single)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithName:vectorFloat2:')]
    function initWithNameVectorFloat2(name: NSString;
      vectorFloat2: vector_float2): Pointer { instancetype }; cdecl;
    [MethodName('initWithName:vectorFloat3:')]
    function initWithNameVectorFloat3(name: NSString;
      vectorFloat3: vector_float3): Pointer { instancetype }; cdecl;
    [MethodName('initWithName:vectorFloat4:')]
    function initWithNameVectorFloat4(name: NSString;
      vectorFloat4: vector_float4): Pointer { instancetype }; cdecl;
    [MethodName('initWithName:matrixFloat2x2:')]
    function initWithNameMatrixFloat2x2(name: NSString;
      matrixFloat2x2: matrix_float2x2): Pointer { instancetype }; cdecl;
    [MethodName('initWithName:matrixFloat3x3:')]
    function initWithNameMatrixFloat3x3(name: NSString;
      matrixFloat3x3: matrix_float3x3): Pointer { instancetype }; cdecl;
    [MethodName('initWithName:matrixFloat4x4:')]
    function initWithNameMatrixFloat4x4(name: NSString;
      matrixFloat4x4: matrix_float4x4): Pointer { instancetype }; cdecl;
    procedure setFloatVector2Value(floatVector2Value: GLKVector2); cdecl;
    function floatVector2Value: GLKVector2; cdecl;
    procedure setFloatVector3Value(floatVector3Value: GLKVector3); cdecl;
    function floatVector3Value: GLKVector3; cdecl;
    procedure setFloatVector4Value(floatVector4Value: GLKVector4); cdecl;
    function floatVector4Value: GLKVector4; cdecl;
    procedure setFloatMatrix2Value(floatMatrix2Value: GLKMatrix2); cdecl;
    function floatMatrix2Value: GLKMatrix2; cdecl;
    procedure setFloatMatrix3Value(floatMatrix3Value: GLKMatrix3); cdecl;
    function floatMatrix3Value: GLKMatrix3; cdecl;
    procedure setFloatMatrix4Value(floatMatrix4Value: GLKMatrix4); cdecl;
    function floatMatrix4Value: GLKMatrix4; cdecl;
    [MethodName('initWithName:floatVector2:')]
    function initWithNameFloatVector2(name: NSString; floatVector2: GLKVector2)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithName:floatVector3:')]
    function initWithNameFloatVector3(name: NSString; floatVector3: GLKVector3)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithName:floatVector4:')]
    function initWithNameFloatVector4(name: NSString; floatVector4: GLKVector4)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithName:floatMatrix2:')]
    function initWithNameFloatMatrix2(name: NSString; floatMatrix2: GLKMatrix2)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithName:floatMatrix3:')]
    function initWithNameFloatMatrix3(name: NSString; floatMatrix3: GLKMatrix3)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithName:floatMatrix4:')]
    function initWithNameFloatMatrix4(name: NSString; floatMatrix4: GLKMatrix4)
      : Pointer { instancetype }; cdecl;
  end;

  TSKUniform = class(TOCGenericImport<SKUniformClass, SKUniform>)
  end;

  PSKUniform = Pointer;

  SKAttributeClass = interface(NSObjectClass)
    ['{E6ECAEC3-8980-4839-A11D-0F883145EFA9}']
    { class } function attributeWithName(name: NSString; &type: SKAttributeType)
      : Pointer { instancetype }; cdecl;
  end;

  SKAttribute = interface(NSObject)
    ['{2E5BA1B2-5648-456F-9B44-00F6F2B4840C}']
    function initWithName(name: NSString; &type: SKAttributeType)
      : Pointer { instancetype }; cdecl;
    function name: NSString; cdecl;
    function &type: SKAttributeType; cdecl;
  end;

  TSKAttribute = class(TOCGenericImport<SKAttributeClass, SKAttribute>)
  end;

  PSKAttribute = Pointer;

  SKShaderClass = interface(NSObjectClass)
    ['{82ABC4E1-0568-468B-83A1-01740623307F}']
    { class } function shader: Pointer { instancetype }; cdecl;
    [MethodName('shaderWithSource:')]
    { class } function shaderWithSource(source: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('shaderWithSource:uniforms:')]
    { class } function shaderWithSourceUniforms(source: NSString;
      uniforms: NSArray): Pointer { instancetype }; cdecl;
    { class } function shaderWithFileNamed(name: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  SKShader = interface(NSObject)
    ['{6F73DAA3-32F4-4D36-917A-32293420E9AD}']
    [MethodName('initWithSource:')]
    function initWithSource(source: NSString): Pointer { instancetype }; cdecl;
    [MethodName('initWithSource:uniforms:')]
    function initWithSourceUniforms(source: NSString; uniforms: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setSource(source: NSString); cdecl;
    function source: NSString; cdecl;
    procedure setUniforms(uniforms: NSArray); cdecl;
    function uniforms: NSArray; cdecl;
    procedure addUniform(uniform: SKUniform); cdecl;
    function uniformNamed(name: NSString): SKUniform; cdecl;
    procedure removeUniformNamed(name: NSString); cdecl;
    procedure setAttributes(attributes: NSArray); cdecl;
    function attributes: NSArray; cdecl;
  end;

  TSKShader = class(TOCGenericImport<SKShaderClass, SKShader>)
  end;

  PSKShader = Pointer;

  SKWarpGeometryGridClass = interface(SKWarpGeometryClass)
    ['{AAF7449C-7636-47BC-991C-DF38F44FDF66}']
    { class } function grid: Pointer { instancetype }; cdecl;
    [MethodName('gridWithColumns:rows:')]
    { class } function gridWithColumnsRows(cols: NSInteger; rows: NSInteger)
      : Pointer { instancetype }; cdecl;
    [MethodName('gridWithColumns:rows:sourcePositions:destPositions:')]
    { class } function gridWithColumnsRowsSourcePositionsDestPositions
      (cols: NSInteger; rows: NSInteger;
      sourcePositions: - - < Type : : ExtVector >;
      destPositions: - - < Type : : ExtVector > )
      : Pointer { instancetype }; cdecl;
  end;

  SKWarpGeometryGrid = interface(SKWarpGeometry)
    ['{D0FA1B34-52FF-455F-97C9-C4B4AF54F7CF}']
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function initWithColumns(cols: NSInteger; rows: NSInteger;
      sourcePositions: - - < Type : : ExtVector >;
      destPositions: - - < Type : : ExtVector > )
      : Pointer { instancetype }; cdecl;
    function numberOfColumns: NSInteger; cdecl;
    function numberOfRows: NSInteger; cdecl;
    function vertexCount: NSInteger; cdecl;
    function sourcePositionAtIndex(index: NSInteger): vector_float2; cdecl;
    function destPositionAtIndex(index: NSInteger): vector_float2; cdecl;
    function gridByReplacingSourcePositions(sourcePositions: Pvector_float2)
      : Pointer { instancetype }; cdecl;
    function gridByReplacingDestPositions(destPositions: Pvector_float2)
      : Pointer { instancetype }; cdecl;
  end;

  TSKWarpGeometryGrid = class(TOCGenericImport<SKWarpGeometryGridClass,
    SKWarpGeometryGrid>)
  end;

  PSKWarpGeometryGrid = Pointer;

  SKLightNodeClass = interface(SKNodeClass)
    ['{09EEEF90-2E32-4593-B82A-3B699228F435}']
  end;

  SKLightNode = interface(SKNode)
    ['{21A767F9-9A4F-4ED0-8EF2-7665B1307DE3}']
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    procedure setLightColor(lightColor: UIColor); cdecl;
    function lightColor: UIColor; cdecl;
    procedure setAmbientColor(ambientColor: UIColor); cdecl;
    function ambientColor: UIColor; cdecl;
    procedure setShadowColor(shadowColor: UIColor); cdecl;
    function shadowColor: UIColor; cdecl;
    procedure setFalloff(falloff: CGFloat); cdecl;
    function falloff: CGFloat; cdecl;
    procedure setCategoryBitMask(categoryBitMask: LongWord); cdecl;
    function categoryBitMask: LongWord; cdecl;
  end;

  TSKLightNode = class(TOCGenericImport<SKLightNodeClass, SKLightNode>)
  end;

  PSKLightNode = Pointer;

  SKSpriteNodeClass = interface(SKNodeClass)
    ['{3ACD6855-FE7A-4101-8603-F78534CB86BA}']
    [MethodName('spriteNodeWithTexture:size:')]
    { class } function spriteNodeWithTextureSize(texture: SKTexture;
      size: CGSize): Pointer { instancetype }; cdecl;
    [MethodName('spriteNodeWithTexture:')]
    { class } function spriteNodeWithTexture(texture: SKTexture)
      : Pointer { instancetype }; cdecl;
    [MethodName('spriteNodeWithTexture:normalMap:')]
    { class } function spriteNodeWithTextureNormalMap(texture: SKTexture;
      normalMap: SKTexture): Pointer { instancetype }; cdecl;
    [MethodName('spriteNodeWithImageNamed:')]
    { class } function spriteNodeWithImageNamed(name: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('spriteNodeWithImageNamed:normalMapped:')]
    { class } function spriteNodeWithImageNamedNormalMapped(name: NSString;
      normalMapped: Boolean): Pointer { instancetype }; cdecl;
    { class } function spriteNodeWithColor(color: UIColor; size: CGSize)
      : Pointer { instancetype }; cdecl;
  end;

  SKSpriteNode = interface(SKNode)
    ['{8B8AA801-7B7B-4E7C-A5C2-F377B5C235E3}']
    [MethodName('initWithTexture:color:size:')]
    function initWithTextureColorSize(texture: SKTexture; color: UIColor;
      size: CGSize): Pointer { instancetype }; cdecl;
    [MethodName('initWithTexture:')]
    function initWithTexture(texture: SKTexture)
      : Pointer { instancetype }; cdecl;
    function initWithImageNamed(name: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithColor(color: UIColor; size: CGSize)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    procedure setTexture(texture: SKTexture); cdecl;
    function texture: SKTexture; cdecl;
    procedure setNormalTexture(normalTexture: SKTexture); cdecl;
    function normalTexture: SKTexture; cdecl;
    procedure setLightingBitMask(lightingBitMask: LongWord); cdecl;
    function lightingBitMask: LongWord; cdecl;
    procedure setShadowCastBitMask(shadowCastBitMask: LongWord); cdecl;
    function shadowCastBitMask: LongWord; cdecl;
    procedure setShadowedBitMask(shadowedBitMask: LongWord); cdecl;
    function shadowedBitMask: LongWord; cdecl;
    procedure setCenterRect(centerRect: CGRect); cdecl;
    function centerRect: CGRect; cdecl;
    procedure setColorBlendFactor(colorBlendFactor: CGFloat); cdecl;
    function colorBlendFactor: CGFloat; cdecl;
    procedure setColor(color: UIColor); cdecl;
    function color: UIColor; cdecl;
    procedure setBlendMode(blendMode: SKBlendMode); cdecl;
    function blendMode: SKBlendMode; cdecl;
    procedure setAnchorPoint(anchorPoint: CGPoint); cdecl;
    function anchorPoint: CGPoint; cdecl;
    procedure setSize(size: CGSize); cdecl;
    function size: CGSize; cdecl;
    procedure scaleToSize(size: CGSize); cdecl;
    procedure setShader(shader: SKShader); cdecl;
    function shader: SKShader; cdecl;
    procedure setAttributeValues(attributeValues: NSDictionary); cdecl;
    function attributeValues: NSDictionary; cdecl;
    function valueForAttributeNamed(key: NSString): SKAttributeValue; cdecl;
    procedure setValue(value: SKAttributeValue;
      forAttributeNamed: NSString); cdecl;
  end;

  TSKSpriteNode = class(TOCGenericImport<SKSpriteNodeClass, SKSpriteNode>)
  end;

  PSKSpriteNode = Pointer;

  SK3DNodeClass = interface(SKNodeClass)
    ['{57C7CAAA-9809-451C-8764-ED97244FE8A7}']
    { class } function nodeWithViewportSize(viewportSize: CGSize)
      : Pointer { instancetype }; cdecl;
  end;

  SK3DNode = interface(SKNode)
    ['{E30536F7-01EA-467B-BEF6-614C32A21729}']
    function initWithViewportSize(viewportSize: CGSize)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    procedure setViewportSize(viewportSize: CGSize); cdecl;
    function viewportSize: CGSize; cdecl;
    procedure setScnScene(scnScene: scnScene); cdecl;
    function scnScene: scnScene; cdecl;
    procedure setSceneTime(sceneTime: NSTimeInterval); cdecl;
    function sceneTime: NSTimeInterval; cdecl;
    function hitTest(point: CGPoint; options: NSDictionary): NSArray; cdecl;
    function projectPoint(point: vector_float3): vector_float3; cdecl;
    function unprojectPoint(point: vector_float3): vector_float3; cdecl;
    procedure setPlaying(playing: Boolean); cdecl;
    function isPlaying: Boolean; cdecl;
    procedure setLoops(loops: Boolean); cdecl;
    function loops: Boolean; cdecl;
    procedure setPointOfView(pointOfView: SCNNode); cdecl;
    function pointOfView: SCNNode; cdecl;
    procedure setAutoenablesDefaultLighting(autoenablesDefaultLighting
      : Boolean); cdecl;
    function autoenablesDefaultLighting: Boolean; cdecl;
  end;

  TSK3DNode = class(TOCGenericImport<SK3DNodeClass, SK3DNode>)
  end;

  PSK3DNode = Pointer;

  SKCameraNodeClass = interface(SKNodeClass)
    ['{E2F17927-0758-47E5-AB7C-0CB67A3ECD39}']
  end;

  SKCameraNode = interface(SKNode)
    ['{BC55492E-3D2E-44E3-83FD-9B200AE62DB9}']
    function containsNode(node: SKNode): Boolean; cdecl;
    function containedNodeSet: NSSet; cdecl;
  end;

  TSKCameraNode = class(TOCGenericImport<SKCameraNodeClass, SKCameraNode>)
  end;

  PSKCameraNode = Pointer;

  SKViewClass = interface(UIViewClass)
    ['{B28EE00A-2295-4C20-A730-E05C17C7E576}']
  end;

  SKView = interface(UIView)
    ['{960BA4AC-5410-4E96-9934-3E1D9CA70AF6}']
    procedure setPaused(paused: Boolean); cdecl;
    function isPaused: Boolean; cdecl;
    procedure setShowsFPS(showsFPS: Boolean); cdecl;
    function showsFPS: Boolean; cdecl;
    procedure setShowsDrawCount(showsDrawCount: Boolean); cdecl;
    function showsDrawCount: Boolean; cdecl;
    procedure setShowsNodeCount(showsNodeCount: Boolean); cdecl;
    function showsNodeCount: Boolean; cdecl;
    procedure setShowsQuadCount(showsQuadCount: Boolean); cdecl;
    function showsQuadCount: Boolean; cdecl;
    procedure setShowsPhysics(showsPhysics: Boolean); cdecl;
    function showsPhysics: Boolean; cdecl;
    procedure setShowsFields(showsFields: Boolean); cdecl;
    function showsFields: Boolean; cdecl;
    procedure setAsynchronous(asynchronous: Boolean); cdecl;
    function isAsynchronous: Boolean; cdecl;
    procedure setAllowsTransparency(allowsTransparency: Boolean); cdecl;
    function allowsTransparency: Boolean; cdecl;
    procedure setIgnoresSiblingOrder(ignoresSiblingOrder: Boolean); cdecl;
    function ignoresSiblingOrder: Boolean; cdecl;
    procedure setShouldCullNonVisibleNodes(shouldCullNonVisibleNodes
      : Boolean); cdecl;
    function shouldCullNonVisibleNodes: Boolean; cdecl;
    procedure setPreferredFramesPerSecond(preferredFramesPerSecond
      : NSInteger); cdecl;
    function preferredFramesPerSecond: NSInteger; cdecl;
    procedure setDisableDepthStencilBuffer(disableDepthStencilBuffer
      : Boolean); cdecl;
    function disableDepthStencilBuffer: Boolean; cdecl;
    procedure setDelegate(delegate: NSObject); cdecl;
    function delegate: NSObject; cdecl;
    procedure setFrameInterval(frameInterval: NSInteger); cdecl;
    function frameInterval: NSInteger; cdecl;
    procedure setPreferredFrameRate(preferredFrameRate: Single); cdecl;
    function preferredFrameRate: Single; cdecl;
    [MethodName('presentScene:')]
    procedure presentScene(scene: SKScene); cdecl;
    [MethodName('presentScene:transition:')]
    procedure presentSceneTransition(scene: SKScene;
      transition: SKTransition); cdecl;
    function scene: SKScene; cdecl;
    [MethodName('textureFromNode:')]
    function textureFromNode(node: SKNode): SKTexture; cdecl;
    [MethodName('textureFromNode:crop:')]
    function textureFromNodeCrop(node: SKNode; crop: CGRect): SKTexture; cdecl;
    [MethodName('convertPoint:toScene:')]
    function convertPointToScene(point: CGPoint; toScene: SKScene)
      : CGPoint; cdecl;
    [MethodName('convertPoint:fromScene:')]
    function convertPointFromScene(point: CGPoint; fromScene: SKScene)
      : CGPoint; cdecl;
  end;

  TSKView = class(TOCGenericImport<SKViewClass, SKView>)
  end;

  PSKView = Pointer;

  SKPhysicsWorldClass = interface(NSObjectClass)
    ['{3809AF01-ED4B-4EFA-A331-EE0A756D8AEB}']
  end;

  SKPhysicsWorld = interface(NSObject)
    ['{BC4570C1-5222-4841-A9EE-22EF99C60055}']
    procedure setGravity(gravity: CGVector); cdecl;
    function gravity: CGVector; cdecl;
    procedure setSpeed(speed: CGFloat); cdecl;
    function speed: CGFloat; cdecl;
    procedure setContactDelegate(contactDelegate: Pointer); cdecl;
    function contactDelegate: Pointer; cdecl;
    procedure addJoint(joint: SKPhysicsJoint); cdecl;
    procedure removeJoint(joint: SKPhysicsJoint); cdecl;
    procedure removeAllJoints; cdecl;
    function sampleFieldsAt(position: vector_float3): vector_float3; cdecl;
    function bodyAtPoint(point: CGPoint): SKPhysicsBody; cdecl;
    function bodyInRect(rect: CGRect): SKPhysicsBody; cdecl;
    function bodyAlongRayStart(start: CGPoint; &end: CGPoint)
      : SKPhysicsBody; cdecl;
    procedure enumerateBodiesAtPoint(point: CGPoint;
      usingBlock: TSpriteKitUsingBlock1); cdecl;
    procedure enumerateBodiesInRect(rect: CGRect;
      usingBlock: TSpriteKitUsingBlock1); cdecl;
    procedure enumerateBodiesAlongRayStart(start: CGPoint; &end: CGPoint;
      usingBlock: TSpriteKitUsingBlock2); cdecl;
  end;

  TSKPhysicsWorld = class(TOCGenericImport<SKPhysicsWorldClass, SKPhysicsWorld>)
  end;

  PSKPhysicsWorld = Pointer;

  SKKeyframeSequenceClass = interface(NSObjectClass)
    ['{FC8A0543-D2E9-49D1-9483-86FD0E03AC4D}']
  end;

  SKKeyframeSequence = interface(NSObject)
    ['{9C4E819A-1A3C-4210-99E1-B2081CABB8EC}']
    function initWithKeyframeValues(values: NSArray; times: NSArray)
      : Pointer { instancetype }; cdecl;
    function initWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function count: NSUInteger; cdecl;
    procedure addKeyframeValue(value: Pointer; time: CGFloat); cdecl;
    procedure removeLastKeyframe; cdecl;
    procedure removeKeyframeAtIndex(index: NSUInteger); cdecl;
    [MethodName('setKeyframeValue:forIndex:')]
    procedure setKeyframeValueForIndex(value: Pointer;
      forIndex: NSUInteger); cdecl;
    procedure setKeyframeTime(time: CGFloat; forIndex: NSUInteger); cdecl;
    [MethodName('setKeyframeValue:time:forIndex:')]
    procedure setKeyframeValueTimeForIndex(value: Pointer; time: CGFloat;
      forIndex: NSUInteger); cdecl;
    function getKeyframeValueForIndex(index: NSUInteger): Pointer; cdecl;
    function getKeyframeTimeForIndex(index: NSUInteger): CGFloat; cdecl;
    function sampleAtTime(time: CGFloat): Pointer; cdecl;
    procedure setInterpolationMode(interpolationMode
      : SKInterpolationMode); cdecl;
    function interpolationMode: SKInterpolationMode; cdecl;
    procedure setRepeatMode(repeatMode: SKRepeatMode); cdecl;
    function repeatMode: SKRepeatMode; cdecl;
  end;

  TSKKeyframeSequence = class(TOCGenericImport<SKKeyframeSequenceClass,
    SKKeyframeSequence>)
  end;

  PSKKeyframeSequence = Pointer;

  SKEmitterNodeClass = interface(SKNodeClass)
    ['{C240D3B3-66FB-439E-BCEF-E1F179DFFA24}']
  end;

  SKEmitterNode = interface(SKNode)
    ['{263D7508-F4C3-445D-B02D-EE6BADDE517E}']
    procedure advanceSimulationTime(sec: NSTimeInterval); cdecl;
    procedure resetSimulation; cdecl;
    procedure setParticleTexture(particleTexture: SKTexture); cdecl;
    function particleTexture: SKTexture; cdecl;
    procedure setParticleBlendMode(particleBlendMode: SKBlendMode); cdecl;
    function particleBlendMode: SKBlendMode; cdecl;
    procedure setParticleColor(particleColor: UIColor); cdecl;
    function particleColor: UIColor; cdecl;
    procedure setParticleColorRedRange(particleColorRedRange: CGFloat); cdecl;
    function particleColorRedRange: CGFloat; cdecl;
    procedure setParticleColorGreenRange(particleColorGreenRange
      : CGFloat); cdecl;
    function particleColorGreenRange: CGFloat; cdecl;
    procedure setParticleColorBlueRange(particleColorBlueRange: CGFloat); cdecl;
    function particleColorBlueRange: CGFloat; cdecl;
    procedure setParticleColorAlphaRange(particleColorAlphaRange
      : CGFloat); cdecl;
    function particleColorAlphaRange: CGFloat; cdecl;
    procedure setParticleColorRedSpeed(particleColorRedSpeed: CGFloat); cdecl;
    function particleColorRedSpeed: CGFloat; cdecl;
    procedure setParticleColorGreenSpeed(particleColorGreenSpeed
      : CGFloat); cdecl;
    function particleColorGreenSpeed: CGFloat; cdecl;
    procedure setParticleColorBlueSpeed(particleColorBlueSpeed: CGFloat); cdecl;
    function particleColorBlueSpeed: CGFloat; cdecl;
    procedure setParticleColorAlphaSpeed(particleColorAlphaSpeed
      : CGFloat); cdecl;
    function particleColorAlphaSpeed: CGFloat; cdecl;
    procedure setParticleColorSequence(particleColorSequence
      : SKKeyframeSequence); cdecl;
    function particleColorSequence: SKKeyframeSequence; cdecl;
    procedure setParticleColorBlendFactor(particleColorBlendFactor
      : CGFloat); cdecl;
    function particleColorBlendFactor: CGFloat; cdecl;
    procedure setParticleColorBlendFactorRange(particleColorBlendFactorRange
      : CGFloat); cdecl;
    function particleColorBlendFactorRange: CGFloat; cdecl;
    procedure setParticleColorBlendFactorSpeed(particleColorBlendFactorSpeed
      : CGFloat); cdecl;
    function particleColorBlendFactorSpeed: CGFloat; cdecl;
    procedure setParticleColorBlendFactorSequence
      (particleColorBlendFactorSequence: SKKeyframeSequence); cdecl;
    function particleColorBlendFactorSequence: SKKeyframeSequence; cdecl;
    procedure setParticlePosition(particlePosition: CGPoint); cdecl;
    function particlePosition: CGPoint; cdecl;
    procedure setParticlePositionRange(particlePositionRange: CGVector); cdecl;
    function particlePositionRange: CGVector; cdecl;
    procedure setParticleSpeed(particleSpeed: CGFloat); cdecl;
    function particleSpeed: CGFloat; cdecl;
    procedure setParticleSpeedRange(particleSpeedRange: CGFloat); cdecl;
    function particleSpeedRange: CGFloat; cdecl;
    procedure setEmissionAngle(emissionAngle: CGFloat); cdecl;
    function emissionAngle: CGFloat; cdecl;
    procedure setEmissionAngleRange(emissionAngleRange: CGFloat); cdecl;
    function emissionAngleRange: CGFloat; cdecl;
    procedure setXAcceleration(xAcceleration: CGFloat); cdecl;
    function xAcceleration: CGFloat; cdecl;
    procedure setYAcceleration(yAcceleration: CGFloat); cdecl;
    function yAcceleration: CGFloat; cdecl;
    procedure setParticleBirthRate(particleBirthRate: CGFloat); cdecl;
    function particleBirthRate: CGFloat; cdecl;
    procedure setNumParticlesToEmit(numParticlesToEmit: NSUInteger); cdecl;
    function numParticlesToEmit: NSUInteger; cdecl;
    procedure setParticleLifetime(particleLifetime: CGFloat); cdecl;
    function particleLifetime: CGFloat; cdecl;
    procedure setParticleLifetimeRange(particleLifetimeRange: CGFloat); cdecl;
    function particleLifetimeRange: CGFloat; cdecl;
    procedure setParticleRotation(particleRotation: CGFloat); cdecl;
    function particleRotation: CGFloat; cdecl;
    procedure setParticleRotationRange(particleRotationRange: CGFloat); cdecl;
    function particleRotationRange: CGFloat; cdecl;
    procedure setParticleRotationSpeed(particleRotationSpeed: CGFloat); cdecl;
    function particleRotationSpeed: CGFloat; cdecl;
    procedure setParticleSize(particleSize: CGSize); cdecl;
    function particleSize: CGSize; cdecl;
    procedure setParticleScale(particleScale: CGFloat); cdecl;
    function particleScale: CGFloat; cdecl;
    procedure setParticleScaleRange(particleScaleRange: CGFloat); cdecl;
    function particleScaleRange: CGFloat; cdecl;
    procedure setParticleScaleSpeed(particleScaleSpeed: CGFloat); cdecl;
    function particleScaleSpeed: CGFloat; cdecl;
    procedure setParticleScaleSequence(particleScaleSequence
      : SKKeyframeSequence); cdecl;
    function particleScaleSequence: SKKeyframeSequence; cdecl;
    procedure setParticleAlpha(particleAlpha: CGFloat); cdecl;
    function particleAlpha: CGFloat; cdecl;
    procedure setParticleAlphaRange(particleAlphaRange: CGFloat); cdecl;
    function particleAlphaRange: CGFloat; cdecl;
    procedure setParticleAlphaSpeed(particleAlphaSpeed: CGFloat); cdecl;
    function particleAlphaSpeed: CGFloat; cdecl;
    procedure setParticleAlphaSequence(particleAlphaSequence
      : SKKeyframeSequence); cdecl;
    function particleAlphaSequence: SKKeyframeSequence; cdecl;
    procedure setParticleAction(particleAction: SKAction); cdecl;
    function particleAction: SKAction; cdecl;
    procedure setFieldBitMask(fieldBitMask: LongWord); cdecl;
    function fieldBitMask: LongWord; cdecl;
    procedure setTargetNode(targetNode: SKNode); cdecl;
    function targetNode: SKNode; cdecl;
    procedure setShader(shader: SKShader); cdecl;
    function shader: SKShader; cdecl;
    procedure setAttributeValues(attributeValues: NSDictionary); cdecl;
    function attributeValues: NSDictionary; cdecl;
    function valueForAttributeNamed(key: NSString): SKAttributeValue; cdecl;
    procedure setValue(value: SKAttributeValue;
      forAttributeNamed: NSString); cdecl;
    procedure setParticleZPosition(particleZPosition: CGFloat); cdecl;
    function particleZPosition: CGFloat; cdecl;
    procedure setParticleRenderOrder(particleRenderOrder
      : SKParticleRenderOrder); cdecl;
    function particleRenderOrder: SKParticleRenderOrder; cdecl;
    procedure setParticleZPositionRange(particleZPositionRange: CGFloat); cdecl;
    function particleZPositionRange: CGFloat; cdecl;
    procedure setParticleZPositionSpeed(particleZPositionSpeed: CGFloat); cdecl;
    function particleZPositionSpeed: CGFloat; cdecl;
  end;

  TSKEmitterNode = class(TOCGenericImport<SKEmitterNodeClass, SKEmitterNode>)
  end;

  PSKEmitterNode = Pointer;

  SKShapeNodeClass = interface(SKNodeClass)
    ['{D5A4B577-73F8-4A9C-AFE5-043272DEEE98}']
    [MethodName('shapeNodeWithPath:')]
    { class } function shapeNodeWithPath(path: CGPathRef)
      : Pointer { instancetype }; cdecl;
    [MethodName('shapeNodeWithPath:centered:')]
    { class } function shapeNodeWithPathCentered(path: CGPathRef;
      centered: Boolean): Pointer { instancetype }; cdecl;
    [MethodName('shapeNodeWithRect:')]
    { class } function shapeNodeWithRect(rect: CGRect)
      : Pointer { instancetype }; cdecl;
    [MethodName('shapeNodeWithRectOfSize:')]
    { class } function shapeNodeWithRectOfSize(size: CGSize)
      : Pointer { instancetype }; cdecl;
    [MethodName('shapeNodeWithRect:cornerRadius:')]
    { class } function shapeNodeWithRectCornerRadius(rect: CGRect;
      cornerRadius: CGFloat): Pointer { instancetype }; cdecl;
    [MethodName('shapeNodeWithRectOfSize:cornerRadius:')]
    { class } function shapeNodeWithRectOfSizeCornerRadius(size: CGSize;
      cornerRadius: CGFloat): Pointer { instancetype }; cdecl;
    { class } function shapeNodeWithCircleOfRadius(radius: CGFloat)
      : Pointer { instancetype }; cdecl;
    { class } function shapeNodeWithEllipseInRect(rect: CGRect)
      : Pointer { instancetype }; cdecl;
    { class } function shapeNodeWithEllipseOfSize(size: CGSize)
      : Pointer { instancetype }; cdecl;
    { class } function shapeNodeWithPoints(points: PCGPoint; count: LongWord)
      : Pointer { instancetype }; cdecl;
    { class } function shapeNodeWithSplinePoints(points: PCGPoint;
      count: LongWord): Pointer { instancetype }; cdecl;
  end;

  SKShapeNode = interface(SKNode)
    ['{3822816C-3B02-4D2D-A94E-6D47AB44C45B}']
    procedure setPath(path: CGPathRef); cdecl;
    function path: CGPathRef; cdecl;
    procedure setStrokeColor(strokeColor: UIColor); cdecl;
    function strokeColor: UIColor; cdecl;
    procedure setFillColor(fillColor: UIColor); cdecl;
    function fillColor: UIColor; cdecl;
    procedure setBlendMode(blendMode: SKBlendMode); cdecl;
    function blendMode: SKBlendMode; cdecl;
    procedure setAntialiased(antialiased: Boolean); cdecl;
    function isAntialiased: Boolean; cdecl;
    procedure setLineWidth(lineWidth: CGFloat); cdecl;
    function lineWidth: CGFloat; cdecl;
    procedure setGlowWidth(glowWidth: CGFloat); cdecl;
    function glowWidth: CGFloat; cdecl;
    procedure setLineCap(lineCap: CGLineCap); cdecl;
    function lineCap: CGLineCap; cdecl;
    procedure setLineJoin(lineJoin: CGLineJoin); cdecl;
    function lineJoin: CGLineJoin; cdecl;
    procedure setMiterLimit(miterLimit: CGFloat); cdecl;
    function miterLimit: CGFloat; cdecl;
    function lineLength: CGFloat; cdecl;
    procedure setFillTexture(fillTexture: SKTexture); cdecl;
    function fillTexture: SKTexture; cdecl;
    procedure setFillShader(fillShader: SKShader); cdecl;
    function fillShader: SKShader; cdecl;
    procedure setStrokeTexture(strokeTexture: SKTexture); cdecl;
    function strokeTexture: SKTexture; cdecl;
    procedure setStrokeShader(strokeShader: SKShader); cdecl;
    function strokeShader: SKShader; cdecl;
    procedure setAttributeValues(attributeValues: NSDictionary); cdecl;
    function attributeValues: NSDictionary; cdecl;
    function valueForAttributeNamed(key: NSString): SKAttributeValue; cdecl;
    procedure setValue(value: SKAttributeValue;
      forAttributeNamed: NSString); cdecl;
  end;

  TSKShapeNode = class(TOCGenericImport<SKShapeNodeClass, SKShapeNode>)
  end;

  PSKShapeNode = Pointer;

  SKRegionClass = interface(NSObjectClass)
    ['{A41A8485-B3CF-41D0-B4F8-06759E9E3F92}']
    { class } function infiniteRegion: Pointer { instancetype }; cdecl;
  end;

  SKRegion = interface(NSObject)
    ['{EB3F03A2-985E-4C61-9E14-A5E392D97E26}']
    function path: CGPathRef; cdecl;
    function initWithRadius(radius: Single): Pointer { instancetype }; cdecl;
    function initWithSize(size: CGSize): Pointer { instancetype }; cdecl;
    function initWithPath(path: CGPathRef): Pointer { instancetype }; cdecl;
    function inverseRegion: Pointer { instancetype }; cdecl;
    function regionByUnionWithRegion(region: SKRegion)
      : Pointer { instancetype }; cdecl;
    function regionByDifferenceFromRegion(region: SKRegion)
      : Pointer { instancetype }; cdecl;
    function regionByIntersectionWithRegion(region: SKRegion)
      : Pointer { instancetype }; cdecl;
    function containsPoint(point: CGPoint): Boolean; cdecl;
  end;

  TSKRegion = class(TOCGenericImport<SKRegionClass, SKRegion>)
  end;

  PSKRegion = Pointer;

  SKLabelNodeClass = interface(SKNodeClass)
    ['{2FA0DD4E-82EE-4A52-A0F0-DEAAB1A4236D}']
    { class } function labelNodeWithText(text: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function labelNodeWithAttributedText(attributedText
      : NSAttributedString): Pointer { instancetype }; cdecl;
    { class } function labelNodeWithFontNamed(fontName: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  SKLabelNode = interface(SKNode)
    ['{2CDC66D7-D0AF-4542-8C89-44861E83FF4C}']
    function initWithFontNamed(fontName: NSString)
      : Pointer { instancetype }; cdecl;
    procedure setVerticalAlignmentMode(verticalAlignmentMode
      : SKLabelVerticalAlignmentMode); cdecl;
    function verticalAlignmentMode: SKLabelVerticalAlignmentMode; cdecl;
    procedure setHorizontalAlignmentMode(horizontalAlignmentMode
      : SKLabelHorizontalAlignmentMode); cdecl;
    function horizontalAlignmentMode: SKLabelHorizontalAlignmentMode; cdecl;
    procedure setNumberOfLines(numberOfLines: NSInteger); cdecl;
    function numberOfLines: NSInteger; cdecl;
    procedure setLineBreakMode(lineBreakMode: NSLineBreakMode); cdecl;
    function lineBreakMode: NSLineBreakMode; cdecl;
    procedure setPreferredMaxLayoutWidth(preferredMaxLayoutWidth
      : CGFloat); cdecl;
    function preferredMaxLayoutWidth: CGFloat; cdecl;
    procedure setFontName(fontName: NSString); cdecl;
    function fontName: NSString; cdecl;
    procedure setText(text: NSString); cdecl;
    function text: NSString; cdecl;
    procedure setAttributedText(attributedText: NSAttributedString); cdecl;
    function attributedText: NSAttributedString; cdecl;
    procedure setFontSize(fontSize: CGFloat); cdecl;
    function fontSize: CGFloat; cdecl;
    procedure setFontColor(fontColor: UIColor); cdecl;
    function fontColor: UIColor; cdecl;
    procedure setColorBlendFactor(colorBlendFactor: CGFloat); cdecl;
    function colorBlendFactor: CGFloat; cdecl;
    procedure setColor(color: UIColor); cdecl;
    function color: UIColor; cdecl;
    procedure setBlendMode(blendMode: SKBlendMode); cdecl;
    function blendMode: SKBlendMode; cdecl;
  end;

  TSKLabelNode = class(TOCGenericImport<SKLabelNodeClass, SKLabelNode>)
  end;

  PSKLabelNode = Pointer;

  SKVideoNodeClass = interface(SKNodeClass)
    ['{F87566B0-FFCB-4AAC-A84C-79BBE54998C5}']
    { class } function videoNodeWithAVPlayer(player: AVPlayer)
      : SKVideoNode; cdecl;
    { class } function videoNodeWithVideoFileNamed(videoFile: NSString)
      : SKVideoNode; cdecl;
    { class } function videoNodeWithFileNamed(videoFile: NSString)
      : SKVideoNode; cdecl;
    { class } function videoNodeWithVideoURL(videoURL: NSURL)
      : SKVideoNode; cdecl;
    { class } function videoNodeWithURL(videoURL: NSURL): SKVideoNode; cdecl;
  end;

  SKVideoNode = interface(SKNode)
    ['{F0E29EF5-8301-4788-949F-CD23423EE525}']
    function initWithAVPlayer(player: AVPlayer)
      : Pointer { instancetype }; cdecl;
    function initWithVideoFileNamed(videoFile: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithFileNamed(videoFile: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithVideoURL(url: NSURL): Pointer { instancetype }; cdecl;
    function initWithURL(url: NSURL): Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    procedure play; cdecl;
    procedure pause; cdecl;
    procedure setSize(size: CGSize); cdecl;
    function size: CGSize; cdecl;
    procedure setAnchorPoint(anchorPoint: CGPoint); cdecl;
    function anchorPoint: CGPoint; cdecl;
  end;

  TSKVideoNode = class(TOCGenericImport<SKVideoNodeClass, SKVideoNode>)
  end;

  PSKVideoNode = Pointer;

  SKCropNodeClass = interface(SKNodeClass)
    ['{0A340C99-CC77-4046-B3C0-994D19E9450D}']
  end;

  SKCropNode = interface(SKNode)
    ['{A04DB66D-FB72-4E8C-AAE2-B05B27F36044}']
    procedure setMaskNode(maskNode: SKNode); cdecl;
    function maskNode: SKNode; cdecl;
  end;

  TSKCropNode = class(TOCGenericImport<SKCropNodeClass, SKCropNode>)
  end;

  PSKCropNode = Pointer;

  SKReferenceNodeClass = interface(SKNodeClass)
    ['{8A64311B-6FC5-4DBC-B8C1-82EF2663E35D}']
    { class } function referenceNodeWithFileNamed(filename: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function referenceNodeWithURL(referenceURL: NSURL)
      : Pointer { instancetype }; cdecl;
  end;

  SKReferenceNode = interface(SKNode)
    ['{3D42A972-B1FE-4CB8-B3D8-01FA4FE94FAA}']
    function initWithURL(url: NSURL): Pointer { instancetype }; cdecl;
    function initWithFileNamed(filename: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    procedure didLoadReferenceNode(node: SKNode); cdecl;
    procedure resolveReferenceNode; cdecl;
  end;

  TSKReferenceNode = class(TOCGenericImport<SKReferenceNodeClass,
    SKReferenceNode>)
  end;

  PSKReferenceNode = Pointer;

  SKTransformNodeClass = interface(SKNodeClass)
    ['{90790139-D5FA-46BC-875A-77035615F13A}']
  end;

  SKTransformNode = interface(SKNode)
    ['{610868AF-BA11-4EAD-889B-2B7B8DF80B66}']
    procedure setXRotation(xRotation: CGFloat); cdecl;
    function xRotation: CGFloat; cdecl;
    procedure setYRotation(yRotation: CGFloat); cdecl;
    function yRotation: CGFloat; cdecl;
    procedure setEulerAngles(euler: vector_float3); cdecl;
    function eulerAngles: vector_float3; cdecl;
    procedure setRotationMatrix(rotationMatrix: matrix_float3x3); cdecl;
    function rotationMatrix: matrix_float3x3; cdecl;
    procedure setQuaternion(quaternion: simd_quatf); cdecl;
    function quaternion: simd_quatf; cdecl;
  end;

  TSKTransformNode = class(TOCGenericImport<SKTransformNodeClass,
    SKTransformNode>)
  end;

  PSKTransformNode = Pointer;

  SKTransitionClass = interface(NSObjectClass)
    ['{803A0743-3AB0-4E6F-A6A2-00A8DD42B967}']
    { class } function crossFadeWithDuration(sec: NSTimeInterval)
      : SKTransition; cdecl;
    { class } function fadeWithDuration(sec: NSTimeInterval)
      : SKTransition; cdecl;
    { class } function fadeWithColor(color: UIColor; duration: NSTimeInterval)
      : SKTransition; cdecl;
    { class } function flipHorizontalWithDuration(sec: NSTimeInterval)
      : SKTransition; cdecl;
    { class } function flipVerticalWithDuration(sec: NSTimeInterval)
      : SKTransition; cdecl;
    { class } function revealWithDirection(direction: SKTransitionDirection;
      duration: NSTimeInterval): SKTransition; cdecl;
    { class } function moveInWithDirection(direction: SKTransitionDirection;
      duration: NSTimeInterval): SKTransition; cdecl;
    { class } function pushWithDirection(direction: SKTransitionDirection;
      duration: NSTimeInterval): SKTransition; cdecl;
    { class } function doorsOpenHorizontalWithDuration(sec: NSTimeInterval)
      : SKTransition; cdecl;
    { class } function doorsOpenVerticalWithDuration(sec: NSTimeInterval)
      : SKTransition; cdecl;
    { class } function doorsCloseHorizontalWithDuration(sec: NSTimeInterval)
      : SKTransition; cdecl;
    { class } function doorsCloseVerticalWithDuration(sec: NSTimeInterval)
      : SKTransition; cdecl;
    { class } function doorwayWithDuration(sec: NSTimeInterval)
      : SKTransition; cdecl;
    { class } function transitionWithCIFilter(filter: CIFilter;
      duration: NSTimeInterval): SKTransition; cdecl;
  end;

  SKTransition = interface(NSObject)
    ['{BC96E287-55D1-43C6-B67D-2043A75B1098}']
    procedure setPausesIncomingScene(pausesIncomingScene: Boolean); cdecl;
    function pausesIncomingScene: Boolean; cdecl;
    procedure setPausesOutgoingScene(pausesOutgoingScene: Boolean); cdecl;
    function pausesOutgoingScene: Boolean; cdecl;
  end;

  TSKTransition = class(TOCGenericImport<SKTransitionClass, SKTransition>)
  end;

  PSKTransition = Pointer;

  SKRendererClass = interface(NSObjectClass)
    ['{AEAB8751-2B67-4C68-A350-974A132DFA83}']
    { class } function rendererWithDevice(device: Pointer): SKRenderer; cdecl;
  end;

  SKRenderer = interface(NSObject)
    ['{857C0F22-122B-465E-BDFC-7F1D60439364}']
    [MethodName('renderWithViewport:commandBuffer:renderPassDescriptor:')]
    procedure renderWithViewportCommandBufferRenderPassDescriptor
      (viewport: CGRect; commandBuffer: Pointer;
      renderPassDescriptor: MTLRenderPassDescriptor); cdecl;
    [MethodName
      ('renderWithViewport:renderCommandEncoder:renderPassDescriptor:commandQueue:')
      ]
    procedure renderWithViewportRenderCommandEncoderRenderPassDescriptorCommandQueue
      (viewport: CGRect; renderCommandEncoder: Pointer;
      renderPassDescriptor: MTLRenderPassDescriptor;
      commandQueue: Pointer); cdecl;
    procedure updateAtTime(currentTime: NSTimeInterval); cdecl;
    procedure setScene(scene: SKScene); cdecl;
    function scene: SKScene; cdecl;
    procedure setIgnoresSiblingOrder(ignoresSiblingOrder: Boolean); cdecl;
    function ignoresSiblingOrder: Boolean; cdecl;
    procedure setShouldCullNonVisibleNodes(shouldCullNonVisibleNodes
      : Boolean); cdecl;
    function shouldCullNonVisibleNodes: Boolean; cdecl;
    procedure setShowsDrawCount(showsDrawCount: Boolean); cdecl;
    function showsDrawCount: Boolean; cdecl;
    procedure setShowsNodeCount(showsNodeCount: Boolean); cdecl;
    function showsNodeCount: Boolean; cdecl;
    procedure setShowsQuadCount(showsQuadCount: Boolean); cdecl;
    function showsQuadCount: Boolean; cdecl;
    procedure setShowsPhysics(showsPhysics: Boolean); cdecl;
    function showsPhysics: Boolean; cdecl;
    procedure setShowsFields(showsFields: Boolean); cdecl;
    function showsFields: Boolean; cdecl;
  end;

  TSKRenderer = class(TOCGenericImport<SKRendererClass, SKRenderer>)
  end;

  PSKRenderer = Pointer;

  SKTileDefinitionClass = interface(NSObjectClass)
    ['{DBD275AB-3722-46D4-B9C8-2E05AAB7644B}']
    [MethodName('tileDefinitionWithTexture:')]
    { class } function tileDefinitionWithTexture(texture: SKTexture)
      : Pointer { instancetype }; cdecl;
    [MethodName('tileDefinitionWithTexture:size:')]
    { class } function tileDefinitionWithTextureSize(texture: SKTexture;
      size: CGSize): Pointer { instancetype }; cdecl;
    [MethodName('tileDefinitionWithTexture:normalTexture:size:')]
    { class } function tileDefinitionWithTextureNormalTextureSize
      (texture: SKTexture; normalTexture: SKTexture; size: CGSize)
      : Pointer { instancetype }; cdecl;
    [MethodName('tileDefinitionWithTextures:size:timePerFrame:')]
    { class } function tileDefinitionWithTexturesSizeTimePerFrame
      (textures: NSArray; size: CGSize; timePerFrame: CGFloat)
      : Pointer { instancetype }; cdecl;
    [MethodName('tileDefinitionWithTextures:normalTextures:size:timePerFrame:')]
    { class } function tileDefinitionWithTexturesNormalTexturesSizeTimePerFrame
      (textures: NSArray; normalTextures: NSArray; size: CGSize;
      timePerFrame: CGFloat): Pointer { instancetype }; cdecl;
  end;

  SKTileDefinition = interface(NSObject)
    ['{AC480571-1095-4899-AA74-A88E73DED761}']
    [MethodName('initWithTexture:')]
    function initWithTexture(texture: SKTexture)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithTexture:size:')]
    function initWithTextureSize(texture: SKTexture; size: CGSize)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithTexture:normalTexture:size:')]
    function initWithTextureNormalTextureSize(texture: SKTexture;
      normalTexture: SKTexture; size: CGSize): Pointer { instancetype }; cdecl;
    [MethodName('initWithTextures:size:timePerFrame:')]
    function initWithTexturesSizeTimePerFrame(textures: NSArray; size: CGSize;
      timePerFrame: CGFloat): Pointer { instancetype }; cdecl;
    [MethodName('initWithTextures:normalTextures:size:timePerFrame:')]
    function initWithTexturesNormalTexturesSizeTimePerFrame(textures: NSArray;
      normalTextures: NSArray; size: CGSize; timePerFrame: CGFloat)
      : Pointer { instancetype }; cdecl;
    procedure setTextures(textures: NSArray); cdecl;
    function textures: NSArray; cdecl;
    procedure setNormalTextures(normalTextures: NSArray); cdecl;
    function normalTextures: NSArray; cdecl;
    procedure setUserData(userData: NSMutableDictionary); cdecl;
    function userData: NSMutableDictionary; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setSize(size: CGSize); cdecl;
    function size: CGSize; cdecl;
    procedure setTimePerFrame(timePerFrame: CGFloat); cdecl;
    function timePerFrame: CGFloat; cdecl;
    procedure setPlacementWeight(placementWeight: NSUInteger); cdecl;
    function placementWeight: NSUInteger; cdecl;
    procedure setRotation(rotation: SKTileDefinitionRotation); cdecl;
    function rotation: SKTileDefinitionRotation; cdecl;
    procedure setFlipVertically(flipVertically: Boolean); cdecl;
    function flipVertically: Boolean; cdecl;
    procedure setFlipHorizontally(flipHorizontally: Boolean); cdecl;
    function flipHorizontally: Boolean; cdecl;
  end;

  TSKTileDefinition = class(TOCGenericImport<SKTileDefinitionClass,
    SKTileDefinition>)
  end;

  PSKTileDefinition = Pointer;

  SKTileGroupClass = interface(NSObjectClass)
    ['{BEE4CF48-7435-4B3B-BF30-4E5C7A955359}']
    { class } function tileGroupWithTileDefinition(tileDefinition
      : SKTileDefinition): Pointer { instancetype }; cdecl;
    { class } function tileGroupWithRules(rules: NSArray)
      : Pointer { instancetype }; cdecl;
    { class } function emptyTileGroup: Pointer { instancetype }; cdecl;
  end;

  SKTileGroup = interface(NSObject)
    ['{DD8E9B47-0D82-4955-BEC9-56F9BEDFD01A}']
    function initWithTileDefinition(tileDefinition: SKTileDefinition)
      : Pointer { instancetype }; cdecl;
    function initWithRules(rules: NSArray): Pointer { instancetype }; cdecl;
    procedure setRules(rules: NSArray); cdecl;
    function rules: NSArray; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TSKTileGroup = class(TOCGenericImport<SKTileGroupClass, SKTileGroup>)
  end;

  PSKTileGroup = Pointer;

  SKTileGroupRuleClass = interface(NSObjectClass)
    ['{9C9AA5A8-869E-48F4-B67B-1B525FF6CCC8}']
    { class } function tileGroupRuleWithAdjacency
      (adjacency: SKTileAdjacencyMask; tileDefinitions: NSArray)
      : Pointer { instancetype }; cdecl;
  end;

  SKTileGroupRule = interface(NSObject)
    ['{E50616EB-7B36-4015-80F1-CC2E9C7FB77E}']
    function initWithAdjacency(adjacency: SKTileAdjacencyMask;
      tileDefinitions: NSArray): Pointer { instancetype }; cdecl;
    procedure setAdjacency(adjacency: SKTileAdjacencyMask); cdecl;
    function adjacency: SKTileAdjacencyMask; cdecl;
    procedure setTileDefinitions(tileDefinitions: NSArray); cdecl;
    function tileDefinitions: NSArray; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TSKTileGroupRule = class(TOCGenericImport<SKTileGroupRuleClass,
    SKTileGroupRule>)
  end;

  PSKTileGroupRule = Pointer;

  SKTileSetClass = interface(NSObjectClass)
    ['{AD584C11-7BEB-4467-A405-C11AD510278E}']
    [MethodName('tileSetWithTileGroups:')]
    { class } function tileSetWithTileGroups(tileGroups: NSArray)
      : Pointer { instancetype }; cdecl;
    [MethodName('tileSetWithTileGroups:tileSetType:')]
    { class } function tileSetWithTileGroupsTileSetType(tileGroups: NSArray;
      tileSetType: SKTileSetType): Pointer { instancetype }; cdecl;
    { class } function tileSetNamed(name: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function tileSetFromURL(url: NSURL)
      : Pointer { instancetype }; cdecl;
  end;

  SKTileSet = interface(NSObject)
    ['{72B38E5F-F034-4822-ADB9-115210239ACF}']
    [MethodName('initWithTileGroups:')]
    function initWithTileGroups(tileGroups: NSArray)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithTileGroups:tileSetType:')]
    function initWithTileGroupsTileSetType(tileGroups: NSArray;
      tileSetType: SKTileSetType): Pointer { instancetype }; cdecl;
    procedure setTileGroups(tileGroups: NSArray); cdecl;
    function tileGroups: NSArray; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setType(&type: SKTileSetType); cdecl;
    function &type: SKTileSetType; cdecl;
    procedure setDefaultTileGroup(defaultTileGroup: SKTileGroup); cdecl;
    function defaultTileGroup: SKTileGroup; cdecl;
    procedure setDefaultTileSize(defaultTileSize: CGSize); cdecl;
    function defaultTileSize: CGSize; cdecl;
  end;

  TSKTileSet = class(TOCGenericImport<SKTileSetClass, SKTileSet>)
  end;

  PSKTileSet = Pointer;

  SKTileMapNodeClass = interface(SKNodeClass)
    ['{42116CC8-238C-4823-A4E5-3B8AECC111F9}']
    [MethodName('tileMapNodeWithTileSet:columns:rows:tileSize:')]
    { class } function tileMapNodeWithTileSetColumnsRowsTileSize
      (tileSet: SKTileSet; columns: NSUInteger; rows: NSUInteger;
      tileSize: CGSize): Pointer { instancetype }; cdecl;
    [MethodName
      ('tileMapNodeWithTileSet:columns:rows:tileSize:fillWithTileGroup:')]
    { class } function
      tileMapNodeWithTileSetColumnsRowsTileSizeFillWithTileGroup
      (tileSet: SKTileSet; columns: NSUInteger; rows: NSUInteger;
      tileSize: CGSize; fillWithTileGroup: SKTileGroup)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('tileMapNodeWithTileSet:columns:rows:tileSize:tileGroupLayout:')]
    { class } function tileMapNodeWithTileSetColumnsRowsTileSizeTileGroupLayout
      (tileSet: SKTileSet; columns: NSUInteger; rows: NSUInteger;
      tileSize: CGSize; tileGroupLayout: NSArray)
      : Pointer { instancetype }; cdecl;
  end;

  SKTileMapNode = interface(SKNode)
    ['{8CF709B8-2196-4895-A1D5-C1AAEA3BED3B}']
    [MethodName('initWithTileSet:columns:rows:tileSize:')]
    function initWithTileSetColumnsRowsTileSize(tileSet: SKTileSet;
      columns: NSUInteger; rows: NSUInteger; tileSize: CGSize)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithTileSet:columns:rows:tileSize:fillWithTileGroup:')]
    function initWithTileSetColumnsRowsTileSizeFillWithTileGroup
      (tileSet: SKTileSet; columns: NSUInteger; rows: NSUInteger;
      tileSize: CGSize; fillWithTileGroup: SKTileGroup)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithTileSet:columns:rows:tileSize:tileGroupLayout:')]
    function initWithTileSetColumnsRowsTileSizeTileGroupLayout
      (tileSet: SKTileSet; columns: NSUInteger; rows: NSUInteger;
      tileSize: CGSize; tileGroupLayout: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setNumberOfColumns(numberOfColumns: NSUInteger); cdecl;
    function numberOfColumns: NSUInteger; cdecl;
    procedure setNumberOfRows(numberOfRows: NSUInteger); cdecl;
    function numberOfRows: NSUInteger; cdecl;
    procedure setTileSize(tileSize: CGSize); cdecl;
    function tileSize: CGSize; cdecl;
    function mapSize: CGSize; cdecl;
    procedure setTileSet(tileSet: SKTileSet); cdecl;
    function tileSet: SKTileSet; cdecl;
    procedure setColorBlendFactor(colorBlendFactor: CGFloat); cdecl;
    function colorBlendFactor: CGFloat; cdecl;
    procedure setColor(color: UIColor); cdecl;
    function color: UIColor; cdecl;
    procedure setBlendMode(blendMode: SKBlendMode); cdecl;
    function blendMode: SKBlendMode; cdecl;
    procedure setAnchorPoint(anchorPoint: CGPoint); cdecl;
    function anchorPoint: CGPoint; cdecl;
    procedure setShader(shader: SKShader); cdecl;
    function shader: SKShader; cdecl;
    procedure setAttributeValues(attributeValues: NSDictionary); cdecl;
    function attributeValues: NSDictionary; cdecl;
    function valueForAttributeNamed(key: NSString): SKAttributeValue; cdecl;
    procedure setValue(value: SKAttributeValue;
      forAttributeNamed: NSString); cdecl;
    procedure setLightingBitMask(lightingBitMask: LongWord); cdecl;
    function lightingBitMask: LongWord; cdecl;
    procedure setEnableAutomapping(enableAutomapping: Boolean); cdecl;
    function enableAutomapping: Boolean; cdecl;
    procedure fillWithTileGroup(tileGroup: SKTileGroup); cdecl;
    function tileDefinitionAtColumn(column: NSUInteger; row: NSUInteger)
      : SKTileDefinition; cdecl;
    function tileGroupAtColumn(column: NSUInteger; row: NSUInteger)
      : SKTileGroup; cdecl;
    [MethodName('setTileGroup:forColumn:row:')]
    procedure setTileGroupForColumnRow(tileGroup: SKTileGroup;
      forColumn: NSUInteger; row: NSUInteger); cdecl;
    [MethodName('setTileGroup:andTileDefinition:forColumn:row:')]
    procedure setTileGroupAndTileDefinitionForColumnRow(tileGroup: SKTileGroup;
      andTileDefinition: SKTileDefinition; forColumn: NSUInteger;
      row: NSUInteger); cdecl;
    function tileColumnIndexFromPosition(position: CGPoint): NSUInteger; cdecl;
    function tileRowIndexFromPosition(position: CGPoint): NSUInteger; cdecl;
    function centerOfTileAtColumn(column: NSUInteger; row: NSUInteger)
      : CGPoint; cdecl;
  end;

  TSKTileMapNode = class(TOCGenericImport<SKTileMapNodeClass, SKTileMapNode>)
  end;

  PSKTileMapNode = Pointer;

  SKMutableTextureClass = interface(SKTextureClass)
    ['{7287FA2A-34CF-4473-A72C-51767D544A82}']
    { class } function mutableTextureWithSize(size: CGSize)
      : Pointer { instancetype }; cdecl;
  end;

  SKMutableTexture = interface(SKTexture)
    ['{1298EBC0-35EE-4A8A-B69D-BF021DF23D20}']
    [MethodName('initWithSize:')]
    function initWithSize(size: CGSize): Pointer { instancetype }; cdecl;
    [MethodName('initWithSize:pixelFormat:')]
    function initWithSizePixelFormat(size: CGSize; pixelFormat: Integer)
      : Pointer { instancetype }; cdecl;
    procedure modifyPixelDataWithBlock(block: TSpriteKitBlock); cdecl;
  end;

  TSKMutableTexture = class(TOCGenericImport<SKMutableTextureClass,
    SKMutableTexture>)
  end;

  PSKMutableTexture = Pointer;

  SKTextureAtlasClass = interface(NSObjectClass)
    ['{B503124D-E33E-487D-AC16-F07B33C948C2}']
    { class } function atlasNamed(name: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function atlasWithDictionary(properties: NSDictionary)
      : Pointer { instancetype }; cdecl;
    { class } procedure preloadTextureAtlases(textureAtlases: NSArray;
      withCompletionHandler: TSpriteKitCompletion); cdecl;
    { class } procedure preloadTextureAtlasesNamed(atlasNames: NSArray;
      withCompletionHandler: TSpriteKitWithCompletionHandler); cdecl;
  end;

  SKTextureAtlas = interface(NSObject)
    ['{66B7E7CE-E4E5-4A69-B505-D1AC5A82F4D1}']
    function textureNamed(name: NSString): SKTexture; cdecl;
    procedure preloadWithCompletionHandler(completionHandler
      : TSpriteKitCompletion); cdecl;
    function textureNames: NSArray; cdecl;
  end;

  TSKTextureAtlas = class(TOCGenericImport<SKTextureAtlasClass, SKTextureAtlas>)
  end;

  PSKTextureAtlas = Pointer;

  SKRangeClass = interface(NSObjectClass)
    ['{331EA9E6-1D0B-4407-B7B9-7590A40E477C}']
    [MethodName('rangeWithLowerLimit:upperLimit:')]
    { class } function rangeWithLowerLimitUpperLimit(lower: CGFloat;
      upperLimit: CGFloat): Pointer { instancetype }; cdecl;
    [MethodName('rangeWithLowerLimit:')]
    { class } function rangeWithLowerLimit(lower: CGFloat)
      : Pointer { instancetype }; cdecl;
    { class } function rangeWithUpperLimit(upper: CGFloat)
      : Pointer { instancetype }; cdecl;
    { class } function rangeWithConstantValue(value: CGFloat)
      : Pointer { instancetype }; cdecl;
    { class } function rangeWithValue(value: CGFloat; variance: CGFloat)
      : Pointer { instancetype }; cdecl;
    { class } function rangeWithNoLimits: Pointer { instancetype }; cdecl;
  end;

  SKRange = interface(NSObject)
    ['{B7EF215A-E5CF-447A-AFB0-86ABFEF9BA81}']
    function initWithLowerLimit(lower: CGFloat; upperLimit: CGFloat)
      : Pointer { instancetype }; cdecl;
    procedure setLowerLimit(lowerLimit: CGFloat); cdecl;
    function lowerLimit: CGFloat; cdecl;
    procedure setUpperLimit(upperLimit: CGFloat); cdecl;
    function upperLimit: CGFloat; cdecl;
  end;

  TSKRange = class(TOCGenericImport<SKRangeClass, SKRange>)
  end;

  PSKRange = Pointer;

  SKPhysicsJointClass = interface(NSObjectClass)
    ['{7DE64B3B-E863-40D0-BC40-5A9BEC311CA2}']
  end;

  SKPhysicsJoint = interface(NSObject)
    ['{8C29E567-9112-435F-91AE-8012C68B7FA2}']
    procedure setBodyA(bodyA: SKPhysicsBody); cdecl;
    function bodyA: SKPhysicsBody; cdecl;
    procedure setBodyB(bodyB: SKPhysicsBody); cdecl;
    function bodyB: SKPhysicsBody; cdecl;
    function reactionForce: CGVector; cdecl;
    function reactionTorque: CGFloat; cdecl;
  end;

  TSKPhysicsJoint = class(TOCGenericImport<SKPhysicsJointClass, SKPhysicsJoint>)
  end;

  PSKPhysicsJoint = Pointer;

  SKPhysicsJointPinClass = interface(SKPhysicsJointClass)
    ['{B2A453C4-A7C1-4047-A932-430595DA1B45}']
    { class } function jointWithBodyA(bodyA: SKPhysicsBody;
      bodyB: SKPhysicsBody; anchor: CGPoint): SKPhysicsJointPin; cdecl;
  end;

  SKPhysicsJointPin = interface(SKPhysicsJoint)
    ['{7D5CD83D-57D6-472E-A732-0F0F39E9C3AB}']
    procedure setShouldEnableLimits(shouldEnableLimits: Boolean); cdecl;
    function shouldEnableLimits: Boolean; cdecl;
    procedure setLowerAngleLimit(lowerAngleLimit: CGFloat); cdecl;
    function lowerAngleLimit: CGFloat; cdecl;
    procedure setUpperAngleLimit(upperAngleLimit: CGFloat); cdecl;
    function upperAngleLimit: CGFloat; cdecl;
    procedure setFrictionTorque(frictionTorque: CGFloat); cdecl;
    function frictionTorque: CGFloat; cdecl;
    procedure setRotationSpeed(rotationSpeed: CGFloat); cdecl;
    function rotationSpeed: CGFloat; cdecl;
  end;

  TSKPhysicsJointPin = class(TOCGenericImport<SKPhysicsJointPinClass,
    SKPhysicsJointPin>)
  end;

  PSKPhysicsJointPin = Pointer;

  SKPhysicsJointSpringClass = interface(SKPhysicsJointClass)
    ['{94E3580D-24C2-4611-A744-C7985C89B7CD}']
    { class } function jointWithBodyA(bodyA: SKPhysicsBody;
      bodyB: SKPhysicsBody; anchorA: CGPoint; anchorB: CGPoint)
      : SKPhysicsJointSpring; cdecl;
  end;

  SKPhysicsJointSpring = interface(SKPhysicsJoint)
    ['{3A80EA73-C0A6-4A57-ABC9-49947141BA40}']
    procedure setDamping(damping: CGFloat); cdecl;
    function damping: CGFloat; cdecl;
    procedure setFrequency(frequency: CGFloat); cdecl;
    function frequency: CGFloat; cdecl;
  end;

  TSKPhysicsJointSpring = class(TOCGenericImport<SKPhysicsJointSpringClass,
    SKPhysicsJointSpring>)
  end;

  PSKPhysicsJointSpring = Pointer;

  SKPhysicsJointFixedClass = interface(SKPhysicsJointClass)
    ['{F29B78CB-B6CF-4AAA-8C7D-0B96B8E2A60C}']
    { class } function jointWithBodyA(bodyA: SKPhysicsBody;
      bodyB: SKPhysicsBody; anchor: CGPoint): SKPhysicsJointFixed; cdecl;
  end;

  SKPhysicsJointFixed = interface(SKPhysicsJoint)
    ['{04AE4288-6203-4DC8-BFF0-9A36471348C5}']
  end;

  TSKPhysicsJointFixed = class(TOCGenericImport<SKPhysicsJointFixedClass,
    SKPhysicsJointFixed>)
  end;

  PSKPhysicsJointFixed = Pointer;

  SKPhysicsJointSlidingClass = interface(SKPhysicsJointClass)
    ['{CA732891-4C16-42FB-B3CC-7EEB7FFFC150}']
    { class } function jointWithBodyA(bodyA: SKPhysicsBody;
      bodyB: SKPhysicsBody; anchor: CGPoint; axis: CGVector)
      : SKPhysicsJointSliding; cdecl;
  end;

  SKPhysicsJointSliding = interface(SKPhysicsJoint)
    ['{AEBA0319-9C80-402B-BAA9-3517F882108C}']
    procedure setShouldEnableLimits(shouldEnableLimits: Boolean); cdecl;
    function shouldEnableLimits: Boolean; cdecl;
    procedure setLowerDistanceLimit(lowerDistanceLimit: CGFloat); cdecl;
    function lowerDistanceLimit: CGFloat; cdecl;
    procedure setUpperDistanceLimit(upperDistanceLimit: CGFloat); cdecl;
    function upperDistanceLimit: CGFloat; cdecl;
  end;

  TSKPhysicsJointSliding = class(TOCGenericImport<SKPhysicsJointSlidingClass,
    SKPhysicsJointSliding>)
  end;

  PSKPhysicsJointSliding = Pointer;

  SKPhysicsJointLimitClass = interface(SKPhysicsJointClass)
    ['{F88F4C0A-B1BB-4F8E-AB1A-9A12BE88A8C8}']
    { class } function jointWithBodyA(bodyA: SKPhysicsBody;
      bodyB: SKPhysicsBody; anchorA: CGPoint; anchorB: CGPoint)
      : SKPhysicsJointLimit; cdecl;
  end;

  SKPhysicsJointLimit = interface(SKPhysicsJoint)
    ['{C72BA50F-4F72-48B7-97D6-327DA72731B4}']
    procedure setMaxLength(maxLength: CGFloat); cdecl;
    function maxLength: CGFloat; cdecl;
  end;

  TSKPhysicsJointLimit = class(TOCGenericImport<SKPhysicsJointLimitClass,
    SKPhysicsJointLimit>)
  end;

  PSKPhysicsJointLimit = Pointer;

  SKPhysicsContactClass = interface(NSObjectClass)
    ['{3E6B4B46-DB17-424C-8C9E-6671AA890570}']
  end;

  SKPhysicsContact = interface(NSObject)
    ['{8E5E3376-9E57-4596-A589-516612B02970}']
    function bodyA: SKPhysicsBody; cdecl;
    function bodyB: SKPhysicsBody; cdecl;
    function contactPoint: CGPoint; cdecl;
    function contactNormal: CGVector; cdecl;
    function collisionImpulse: CGFloat; cdecl;
  end;

  TSKPhysicsContact = class(TOCGenericImport<SKPhysicsContactClass,
    SKPhysicsContact>)
  end;

  PSKPhysicsContact = Pointer;

  SKAudioNodeClass = interface(SKNodeClass)
    ['{673228C5-76F8-4AF6-8F72-53DAAB1C6D5B}']
  end;

  SKAudioNode = interface(SKNode)
    ['{13C50ABD-CBFD-4792-BC70-935D4390F106}']
    function initWithAVAudioNode(node: AVAudioNode)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function initWithFileNamed(name: NSString): Pointer { instancetype }; cdecl;
    function initWithURL(url: NSURL): Pointer { instancetype }; cdecl;
    procedure setAvAudioNode(AVAudioNode: AVAudioNode); cdecl;
    function AVAudioNode: AVAudioNode; cdecl;
    procedure setAutoplayLooped(autoplayLooped: Boolean); cdecl;
    function autoplayLooped: Boolean; cdecl;
    procedure setPositional(positional: Boolean); cdecl;
    function isPositional: Boolean; cdecl;
  end;

  TSKAudioNode = class(TOCGenericImport<SKAudioNodeClass, SKAudioNode>)
  end;

  PSKAudioNode = Pointer;

  // ===== Protocol declarations =====

  SKWarpable = interface(IObjectiveC)
    ['{35BE7FE6-1067-4B16-B0F3-4AAB9891C0D0}']
    procedure setWarpGeometry(warpGeometry: SKWarpGeometry); cdecl;
    function warpGeometry: SKWarpGeometry; cdecl;
    procedure setSubdivisionLevels(subdivisionLevels: NSInteger); cdecl;
    function subdivisionLevels: NSInteger; cdecl;
  end;

  SKSceneDelegate = interface(IObjectiveC)
    ['{6D9A8DA7-65B8-4C43-A67D-62A3A14E1490}']
    procedure update(currentTime: NSTimeInterval; forScene: SKScene); cdecl;
    procedure didEvaluateActionsForScene(scene: SKScene); cdecl;
    procedure didSimulatePhysicsForScene(scene: SKScene); cdecl;
    procedure didApplyConstraintsForScene(scene: SKScene); cdecl;
    procedure didFinishUpdateForScene(scene: SKScene); cdecl;
  end;

  SKViewDelegate = interface(IObjectiveC)
    ['{F6EEE8AE-AEAA-4319-B5E7-8C55A1232662}']
    function view(view: SKView; shouldRenderAtTime: NSTimeInterval)
      : Boolean; cdecl;
  end;

  SKPhysicsContactDelegate = interface(IObjectiveC)
    ['{314E5707-73D1-476F-B9C6-139A4C50DEC7}']
    procedure didBeginContact(contact: SKPhysicsContact); cdecl;
    procedure didEndContact(contact: SKPhysicsContact); cdecl;
  end;

  // ===== External functions =====

const
  libSpriteKit = '/System/Library/Frameworks/SpriteKit.framework/SpriteKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  SpriteKitModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

SpriteKitModule := dlopen(MarshaledAString(libSpriteKit), RTLD_LAZY);

finalization

dlclose(SpriteKitModule);
{$ENDIF IOS}

end.
