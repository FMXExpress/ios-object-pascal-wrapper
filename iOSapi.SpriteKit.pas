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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.AVFoundation,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.CoreImage,
  iOSapi.Foundation,
  iOSapi.GLKit,
  iOSapi.UIKit;

const
  SKBlendModeAlpha = 0;
  SKBlendModeAdd = 1;
  SKBlendModeSubtract = 2;
  SKBlendModeMultiply = 3;
  SKBlendModeMultiplyX2 = 4;
  SKBlendModeScreen = 5;
  SKBlendModeReplace = 6;
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
  SKActionTimingLinear = 0;
  SKActionTimingEaseIn = 1;
  SKActionTimingEaseOut = 2;
  SKActionTimingEaseInEaseOut = 3;
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

type

  // ===== Forward declarations =====
{$M+}
  SKView = interface;
  SKAction = interface;
  SKScene = interface;
  SKTexture = interface;
  SKPhysicsBody = interface;
  SKFieldNode = interface;
  SKReachConstraints = interface;
  SKConstraint = interface;
  SKNode = interface;
  SKNodeTouches = interface;
  SKUniform = interface;
  SKShader = interface;
  SKLightNode = interface;
  SKSpriteNode = interface;
  SK3DNode = interface;
  SKCameraNode = interface;
  SKEffectNode = interface;
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
  SKTransition = interface;
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
  NSInteger = Integer;
  SKBlendMode = NSInteger;
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
TSpriteKitUsingBlock =
procedure(param1: SKNode; param2: PBoolean) of object;
TSpriteKitCompletion =
procedure() of object;
SKTextureFilteringMode = NSInteger;
CGImageRef = Pointer;
SKUniformType = NSInteger;
GLKVector2 =
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
  ;
  GLKVector3 = case Integer of 0:
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
  ;
  GLKVector4 = case Integer of 0:
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
  GLKMatrix2 = case Integer of 0:
    (m00: Single;
      m01: Single;
      m10: Single;
      m11: Single;
    );
  1:
    (m2: array [0 .. 1] of array [0 .. 1] of Single);
  2:
    (m: array [0 .. 3] of Single);
  ;
  GLKMatrix3 = case Integer of 0:
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
  NSTimeInterval = Double;
  SKActionTimingMode = NSInteger;
  SKActionTimingFunction = function(param1: Single):
    Single;
  cdecl;
  CGVector = CGVector = record dx:
    CGFloat;
  dy:
    CGFloat;
end;
PCGVector = ^CGVector;;
NSUInteger = Cardinal;
CGPathRef = Pointer;
SEL = SEL *;
dispatch_queue_t = Pointer;
TSpriteKitActionBlock =
procedure(param1: SKNode; param2: CGFloat) of object;
SKSceneScaleMode = NSInteger;
SKInterpolationMode = NSInteger;
SKRepeatMode = NSInteger;
SKParticleRenderOrder = NSUInteger;
__darwin_size_t = LongWord;
CGLineCap = Int32;
CGLineJoin = Int32;
SKFieldForceEvaluator =
function(param1: vector_float3; param2: vector_float3; param3: Single;
  param4: Single; param5: NSTimeInterval): vector_float3;
cdecl;
SKLabelVerticalAlignmentMode = NSInteger;
SKLabelHorizontalAlignmentMode = NSInteger;
SKTransitionDirection = NSInteger;
TSpriteKitBlock =
procedure(param1: Pointer; param2: LongWord) of object;
TSpriteKitWithCompletionHandler =
procedure(param1: NSError; param2: NSArray) of object;
TSpriteKitUsingBlock1 =
procedure(param1: SKPhysicsBody; param2: PBoolean) of object;
TSpriteKitUsingBlock2 =
procedure(param1: SKPhysicsBody; param2: CGPoint; param3: CGVector;
  param4: PBoolean) of object;
// ===== Interface declarations =====

SKViewClass = interface(UIViewClass)['{E8F4B89A-8038-43EA-96E6-111430E0A55B}']
end;
SKView = interface(UIView)['{50541FD0-EB74-42C0-8D6A-4B8197BA3BF3}']
procedure setPaused(paused: Boolean);
cdecl;

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
                          procedure setAsynchronous(asynchronous
                            : Boolean); cdecl;
                            function isAsynchronous: Boolean; cdecl;
                              procedure setAllowsTransparency(allowsTransparency
                                : Boolean); cdecl;
                                function allowsTransparency: Boolean; cdecl;
                                  procedure setIgnoresSiblingOrder
                                    (ignoresSiblingOrder: Boolean); cdecl;
                                    function ignoresSiblingOrder
                                      : Boolean; cdecl;
                                      procedure setShouldCullNonVisibleNodes
                                        (shouldCullNonVisibleNodes
                                        : Boolean); cdecl;
                                        function shouldCullNonVisibleNodes
                                        : Boolean; cdecl;
                                        procedure setFrameInterval
                                        (frameInterval: NSInteger); cdecl;
                                        function frameInterval
                                        : NSInteger; cdecl;
                                        [MethodName('presentScene:')]
                                        procedure presentScene
                                        (scene: SKScene); cdecl;
                                        [MethodName('presentScene:transition:')]
                                        procedure presentSceneTransition
                                        (scene: SKScene;
                                        transition: SKTransition); cdecl;
                                        function scene: SKScene; cdecl;
                                        [MethodName('textureFromNode:')]
                                        function textureFromNode(node: SKNode)
                                        : SKTexture; cdecl;
                                        [MethodName('textureFromNode:crop:')]
                                        function textureFromNodeCrop
                                        (node: SKNode; crop: CGRect)
                                        : SKTexture; cdecl;
                                        [MethodName('convertPoint:toScene:')]
                                        function convertPointToScene
                                        (point: CGPoint; toScene: SKScene)
                                        : CGPoint; cdecl;
                                        [MethodName('convertPoint:fromScene:')]
                                        function convertPointFromScene
                                        (point: CGPoint; fromScene: SKScene)
                                        : CGPoint; cdecl;
                                        end;

                                        TSKView = class
                                        (TOCGenericImport<SKViewClass, SKView>)
                                        end;
                                        PSKView = Pointer;

                                        SKActionClass = interface(NSObjectClass)
                                        ['{0C60C342-D8DF-41E5-B5DE-306ECD6AC16A}']
                                        { class } function moveBy
                                        (delta: CGVector;
                                        duration: NSTimeInterval): SKAction;
                                        cdecl;
                                        { class } function moveByX
                                        (deltaX: CGFloat; y: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function moveTo
                                        (location: CGPoint;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function moveToX(x: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function moveToY(y: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function rotateByAngle
                                        (radians: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName('rotateToAngle:duration:')]
                                        { class } function rotateToAngleDuration
                                        (radians: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('rotateToAngle:duration:shortestUnitArc:')
                                        ]
                                        { class } function
                                        rotateToAngleDurationShortestUnitArc
                                        (radians: CGFloat;
                                        duration: NSTimeInterval;
                                        shortestUnitArc: Boolean)
                                        : SKAction; cdecl;
                                        { class } function resizeByWidth
                                        (width: CGFloat; height: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('resizeToWidth:height:duration:')]
                                        { class } function
                                        resizeToWidthHeightDuration
                                        (width: CGFloat; height: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName('resizeToWidth:duration:')]
                                        { class } function resizeToWidthDuration
                                        (width: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function resizeToHeight
                                        (height: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function scaleBy
                                        (scale: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function scaleXBy
                                        (xScale: CGFloat; y: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function scaleTo
                                        (scale: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName('scaleXTo:y:duration:')]
                                        { class } function scaleXToYDuration
                                        (xScale: CGFloat; y: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName('scaleXTo:duration:')]
                                        { class } function scaleXToDuration
                                        (scale: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function scaleYTo
                                        (scale: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function sequence
                                        (actions: NSArray): SKAction; cdecl;
                                        { class } function group
                                        (actions: NSArray): SKAction; cdecl;
                                        { class } function repeatAction
                                        (action: SKAction; count: NSUInteger)
                                        : SKAction; cdecl;
                                        { class } function repeatActionForever
                                        (action: SKAction): SKAction; cdecl;
                                        { class } function fadeInWithDuration
                                        (sec: NSTimeInterval): SKAction; cdecl;
                                        { class } function fadeOutWithDuration
                                        (sec: NSTimeInterval): SKAction; cdecl;
                                        { class } function fadeAlphaBy
                                        (factor: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function fadeAlphaTo
                                        (alpha: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function hide
                                        : SKAction; cdecl;
                                        { class } function unhide
                                        : SKAction; cdecl;
                                        [MethodName('setTexture:')]
                                        { class } function setTexture
                                        (texture: SKTexture): SKAction; cdecl;
                                        [MethodName('setNormalTexture:')]
                                        { class } function setNormalTexture
                                        (texture: SKTexture): SKAction; cdecl;
                                        [MethodName('setTexture:resize:')]
                                        { class } function setTextureResize
                                        (texture: SKTexture; resize: Boolean)
                                        : SKAction; cdecl;
                                        [MethodName('setNormalTexture:resize:')]
                                        { class } function
                                        setNormalTextureResize
                                        (texture: SKTexture; resize: Boolean)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('animateWithTextures:timePerFrame:')]
                                        { class } function
                                        animateWithTexturesTimePerFrame
                                        (textures: NSArray;
                                        timePerFrame: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('animateWithNormalTextures:timePerFrame:')
                                        ]
                                        { class } function
                                        animateWithNormalTexturesTimePerFrame
                                        (textures: NSArray;
                                        timePerFrame: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('animateWithTextures:timePerFrame:resize:restore:')
                                        ]
                                        { class } function
                                        animateWithTexturesTimePerFrameResizeRestore
                                        (textures: NSArray;
                                        timePerFrame: NSTimeInterval;
                                        resize: Boolean; restore: Boolean)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('animateWithNormalTextures:timePerFrame:resize:restore:')
                                        ]
                                        { class } function
                                        animateWithNormalTexturesTimePerFrameResizeRestore
                                        (textures: NSArray;
                                        timePerFrame: NSTimeInterval;
                                        resize: Boolean; restore: Boolean)
                                        : SKAction; cdecl;
                                        { class } function playSoundFileNamed
                                        (soundFile: NSString;
                                        waitForCompletion: Boolean)
                                        : SKAction; cdecl;
                                        { class } function colorizeWithColor
                                        (color: UIColor;
                                        colorBlendFactor: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function
                                        colorizeWithColorBlendFactor
                                        (colorBlendFactor: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function falloffTo
                                        (falloff: Single;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function falloffBy
                                        (falloff: Single;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName('followPath:duration:')]
                                        { class } function followPathDuration
                                        (path: CGPathRef;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('followPath:asOffset:orientToPath:duration:')
                                        ]
                                        { class } function
                                        followPathAsOffsetOrientToPathDuration
                                        (path: CGPathRef; asOffset: Boolean;
                                        orientToPath: Boolean;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName('followPath:speed:')]
                                        { class } function followPathSpeed
                                        (path: CGPathRef; speed: CGFloat)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('followPath:asOffset:orientToPath:speed:')
                                        ]
                                        { class } function
                                        followPathAsOffsetOrientToPathSpeed
                                        (path: CGPathRef; asOffset: Boolean;
                                        orientToPath: Boolean; speed: CGFloat)
                                        : SKAction; cdecl;
                                        { class } function speedBy
                                        (speed: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function speedTo
                                        (speed: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('reachTo:rootNode:duration:')]
                                        { class } function
                                        reachToRootNodeDuration
                                        (position: CGPoint; rootNode: SKNode;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('reachTo:rootNode:velocity:')]
                                        { class } function
                                        reachToRootNodeVelocity
                                        (position: CGPoint; rootNode: SKNode;
                                        velocity: CGFloat): SKAction; cdecl;
                                        [MethodName
                                        ('reachToNode:rootNode:duration:')]
                                        { class } function
                                        reachToNodeRootNodeDuration
                                        (node: SKNode; rootNode: SKNode;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('reachToNode:rootNode:velocity:')]
                                        { class } function
                                        reachToNodeRootNodeVelocity
                                        (node: SKNode; rootNode: SKNode;
                                        velocity: CGFloat): SKAction; cdecl;
                                        { class } function strengthTo
                                        (strength: Single;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function strengthBy
                                        (strength: Single;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName('waitForDuration:')]
                                        { class } function waitForDuration
                                        (sec: NSTimeInterval): SKAction; cdecl;
                                        [MethodName
                                        ('waitForDuration:withRange:')]
                                        { class } function
                                        waitForDurationWithRange
                                        (sec: NSTimeInterval;
                                        withRange: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function removeFromParent
                                        : SKAction; cdecl;
                                        { class } function performSelector
                                        (selector: SEL; onTarget: Pointer)
                                        : SKAction; cdecl;
                                        [MethodName('runBlock:')]
                                        { class } function runBlock
                                        (block: Pointer { dispatch_block_t } )
                                        : SKAction; cdecl;
                                        [MethodName('runBlock:queue:')]
                                        { class } function runBlockQueue
                                        (block: Pointer { dispatch_block_t };
                                        queue: dispatch_queue_t)
                                        : SKAction; cdecl;
                                        { class } function runAction
                                        (action: SKAction;
                                        onChildWithName: NSString)
                                        : SKAction; cdecl;
                                        { class } function
                                        customActionWithDuration
                                        (seconds: NSTimeInterval;
                                        actionBlock: TSpriteKitActionBlock)
                                        : SKAction; cdecl;
                                        [MethodName('actionNamed:')]
                                        { class } function actionNamed
                                        (name: NSString): SKAction; cdecl;
                                        [MethodName('actionNamed:duration:')]
                                        { class } function actionNamedDuration
                                        (name: NSString;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName('actionNamed:fromURL:')]
                                        { class } function actionNamedFromURL
                                        (name: NSString; fromURL: NSURL)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('actionNamed:fromURL:duration:')]
                                        { class } function
                                        actionNamedFromURLDuration
                                        (name: NSString; fromURL: NSURL;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function changeChargeTo
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function changeChargeBy
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function changeMassTo
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function changeMassBy
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName('applyForce:duration:')]
                                        { class } function applyForceDuration
                                        (force: CGVector;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('applyForce:atPoint:duration:')]
                                        { class } function
                                        applyForceAtPointDuration
                                        (force: CGVector; atPoint: CGPoint;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function applyTorque
                                        (torque: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName('applyImpulse:duration:')]
                                        { class } function applyImpulseDuration
                                        (impulse: CGVector;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        [MethodName
                                        ('applyImpulse:atPoint:duration:')]
                                        { class } function
                                        applyImpulseAtPointDuration
                                        (impulse: CGVector; atPoint: CGPoint;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function applyAngularImpulse
                                        (impulse: CGFloat;
                                        duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function play
                                        : SKAction; cdecl;
                                        { class } function pause
                                        : SKAction; cdecl;
                                        { class } function stop
                                        : SKAction; cdecl;
                                        { class } function changePlaybackRateTo
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function changePlaybackRateBy
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function changeVolumeTo
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function changeVolumeBy
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function stereoPanTo
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function stereoPanBy
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function changeReverbTo
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function changeReverbBy
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function changeObstructionTo
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function changeObstructionBy
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function changeOcclusionTo
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        { class } function changeOcclusionBy
                                        (v: Single; duration: NSTimeInterval)
                                        : SKAction; cdecl;
                                        end;
                                        SKAction = interface(NSObject)
                                        ['{0E656ADA-ED19-4E64-9517-E90F80628869}']
                                        procedure setDuration
                                        (duration: NSTimeInterval);
                                        cdecl;
                                        function duration
                                        : NSTimeInterval; cdecl;
                                        procedure setTimingMode
                                        (timingMode: SKActionTimingMode); cdecl;
                                        function timingMode
                                        : SKActionTimingMode; cdecl;
                                        procedure setTimingFunction
                                        (timingFunction
                                        : SKActionTimingFunction); cdecl;
                                        function timingFunction
                                        : SKActionTimingFunction; cdecl;
                                        procedure setSpeed
                                        (speed: CGFloat); cdecl;
                                        function speed: CGFloat; cdecl;
                                        function reversedAction
                                        : SKAction; cdecl;
                                        end;

                                        TSKAction = class
                                        (TOCGenericImport<SKActionClass,
                                        SKAction>)
                                        end;
                                        PSKAction = Pointer;

                                        SKNodeClass = interface
                                        (UIResponderClass)
                                        ['{65CE45B2-9F10-4F4C-A819-9A9A5FB8100C}']
                                        { class } function node
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function nodeWithFileNamed
                                        (filename: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function
                                        obstaclesFromSpriteTextures
                                        (sprites: NSArray; accuracy: Single)
                                        : NSArray; cdecl;
                                        { class } function
                                        obstaclesFromNodeBounds(nodes: NSArray)
                                        : NSArray; cdecl;
                                        { class } function
                                        obstaclesFromNodePhysicsBodies
                                        (nodes: NSArray): NSArray; cdecl;
                                        end;
                                        SKNode = interface(UIResponder)
                                        ['{35247F70-3D99-4A27-BEE7-65CA6D6FA614}']
                                        function init: Pointer { instancetype };
                                        cdecl;
                                        function initWithCoder
                                        (aDecoder: NSCoder)
                                        : Pointer { instancetype }; cdecl;
                                        function frame: CGRect; cdecl;
                                        function calculateAccumulatedFrame
                                        : CGRect; cdecl;
                                        procedure setPosition
                                        (position: CGPoint); cdecl;
                                        function position: CGPoint; cdecl;
                                        procedure setZPosition
                                        (zPosition: CGFloat); cdecl;
                                        function zPosition: CGFloat; cdecl;
                                        procedure setZRotation
                                        (zRotation: CGFloat); cdecl;
                                        function zRotation: CGFloat; cdecl;
                                        procedure setXScale
                                        (xScale: CGFloat); cdecl;
                                        function xScale: CGFloat; cdecl;
                                        procedure setYScale
                                        (yScale: CGFloat); cdecl;
                                        function yScale: CGFloat; cdecl;
                                        procedure setSpeed
                                        (speed: CGFloat); cdecl;
                                        function speed: CGFloat; cdecl;
                                        procedure setAlpha
                                        (alpha: CGFloat); cdecl;
                                        function alpha: CGFloat; cdecl;
                                        procedure setPaused
                                        (paused: Boolean); cdecl;
                                        function isPaused: Boolean; cdecl;
                                        procedure setHidden
                                        (hidden: Boolean); cdecl;
                                        function isHidden: Boolean; cdecl;
                                        procedure setUserInteractionEnabled
                                        (userInteractionEnabled
                                        : Boolean); cdecl;
                                        function isUserInteractionEnabled
                                        : Boolean; cdecl;
                                        function parent: SKNode; cdecl;
                                        function children: NSArray; cdecl;
                                        procedure setName
                                        (name: NSString); cdecl;
                                        function name: NSString; cdecl;
                                        function scene: SKScene; cdecl;
                                        procedure setPhysicsBody
                                        (physicsBody: SKPhysicsBody); cdecl;
                                        function physicsBody
                                        : SKPhysicsBody; cdecl;
                                        procedure setUserData
                                        (userData: NSMutableDictionary); cdecl;
                                        function userData
                                        : NSMutableDictionary; cdecl;
                                        procedure setReachConstraints
                                        (reachConstraints
                                        : SKReachConstraints); cdecl;
                                        function reachConstraints
                                        : SKReachConstraints; cdecl;
                                        procedure setConstraints
                                        (constraints: NSArray); cdecl;
                                        function constraints: NSArray; cdecl;
                                        procedure setScale
                                        (scale: CGFloat); cdecl;
                                        procedure addChild(node: SKNode); cdecl;
                                        procedure insertChild(node: SKNode;
                                        atIndex: NSInteger); cdecl;
                                        procedure removeChildrenInArray
                                        (nodes: NSArray); cdecl;
                                        procedure removeAllChildren; cdecl;
                                        procedure removeFromParent; cdecl;
                                        procedure moveToParent
                                        (parent: SKNode); cdecl;
                                        function childNodeWithName
                                        (name: NSString): SKNode; cdecl;
                                        procedure enumerateChildNodesWithName
                                        (name: NSString;
                                        usingBlock
                                        : TSpriteKitUsingBlock); cdecl;
                                        function objectForKeyedSubscript
                                        (name: NSString): NSArray; cdecl;
                                        function inParentHierarchy
                                        (parent: SKNode): Boolean; cdecl;
                                        [MethodName('runAction:')]
                                        procedure runAction
                                        (action: SKAction); cdecl;
                                        [MethodName('runAction:completion:')]
                                        procedure runActionCompletion
                                        (action: SKAction;
                                        completion
                                        : TSpriteKitCompletion); cdecl;
                                        [MethodName('runAction:withKey:')]
                                        procedure runActionWithKey
                                        (action: SKAction;
                                        withKey: NSString); cdecl;
                                        function hasActions: Boolean; cdecl;
                                        function actionForKey(key: NSString)
                                        : SKAction; cdecl;
                                        procedure removeActionForKey
                                        (key: NSString); cdecl;
                                        procedure removeAllActions; cdecl;
                                        function containsPoint(p: CGPoint)
                                        : Boolean; cdecl;
                                        function nodeAtPoint(p: CGPoint)
                                        : SKNode; cdecl;
                                        function nodesAtPoint(p: CGPoint)
                                        : NSArray; cdecl;
                                        [MethodName('convertPoint:fromNode:')]
                                        function convertPointFromNode
                                        (point: CGPoint; fromNode: SKNode)
                                        : CGPoint; cdecl;
                                        [MethodName('convertPoint:toNode:')]
                                        function convertPointToNode
                                        (point: CGPoint; toNode: SKNode)
                                        : CGPoint; cdecl;
                                        function intersectsNode(node: SKNode)
                                        : Boolean; cdecl;
                                        function isEqualToNode(node: SKNode)
                                        : Boolean; cdecl;
                                        end;

                                        TSKNode = class
                                        (TOCGenericImport<SKNodeClass, SKNode>)
                                        end;
                                        PSKNode = Pointer;

                                        SKEffectNodeClass = interface
                                        (SKNodeClass)
                                        ['{E3F0C1FE-C538-40C7-B732-EE3D637E37D5}']
                                        end;
                                        SKEffectNode = interface(SKNode)
                                        ['{EA341634-B457-4092-B9B0-DBCFF5816E13}']
                                        procedure setFilter(filter: CIFilter);
                                        cdecl;
                                        function filter: CIFilter; cdecl;
                                        procedure setShouldCenterFilter
                                        (shouldCenterFilter: Boolean); cdecl;
                                        function shouldCenterFilter
                                        : Boolean; cdecl;
                                        procedure setShouldEnableEffects
                                        (shouldEnableEffects: Boolean); cdecl;
                                        function shouldEnableEffects
                                        : Boolean; cdecl;
                                        procedure setShouldRasterize
                                        (shouldRasterize: Boolean); cdecl;
                                        function shouldRasterize
                                        : Boolean; cdecl;
                                        procedure setBlendMode
                                        (blendMode: SKBlendMode); cdecl;
                                        function blendMode: SKBlendMode; cdecl;
                                        procedure setShader
                                        (shader: SKShader); cdecl;
                                        function shader: SKShader; cdecl;
                                        end;

                                        TSKEffectNode = class
                                        (TOCGenericImport<SKEffectNodeClass,
                                        SKEffectNode>)
                                        end;
                                        PSKEffectNode = Pointer;

                                        SKSceneClass = interface
                                        (SKEffectNodeClass)
                                        ['{BF3BF319-C198-4F57-A8C9-7A4157A881DD}']
                                        { class } function sceneWithSize
                                        (size: CGSize)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SKScene = interface(SKEffectNode)
                                        ['{C7B807AD-B337-4243-A669-59E78526A8DF}']
                                        function initWithSize(size: CGSize)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setSize(size: CGSize); cdecl;
                                        function size: CGSize; cdecl;
                                        procedure setScaleMode
                                        (scaleMode: SKSceneScaleMode); cdecl;
                                        function scaleMode
                                        : SKSceneScaleMode; cdecl;
                                        procedure setCamera
                                        (camera: SKCameraNode); cdecl;
                                        function camera: SKCameraNode; cdecl;
                                        procedure setListener
                                        (listener: SKNode); cdecl;
                                        function listener: SKNode; cdecl;
                                        function audioEngine
                                        : AVAudioEngine; cdecl;
                                        procedure setBackgroundColor
                                        (backgroundColor: UIColor); cdecl;
                                        function backgroundColor
                                        : UIColor; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        procedure setAnchorPoint
                                        (anchorPoint: CGPoint); cdecl;
                                        function anchorPoint: CGPoint; cdecl;
                                        function physicsWorld
                                        : SKPhysicsWorld; cdecl;
                                        function convertPointFromView
                                        (point: CGPoint): CGPoint; cdecl;
                                        function convertPointToView
                                        (point: CGPoint): CGPoint; cdecl;
                                        function view: SKView; cdecl;
                                        procedure update
                                        (currentTime: NSTimeInterval); cdecl;
                                        procedure didEvaluateActions; cdecl;
                                        procedure didSimulatePhysics; cdecl;
                                        procedure didApplyConstraints; cdecl;
                                        procedure didFinishUpdate; cdecl;
                                        procedure didMoveToView
                                        (view: SKView); cdecl;
                                        procedure willMoveFromView
                                        (view: SKView); cdecl;
                                        procedure didChangeSize
                                        (oldSize: CGSize); cdecl;
                                        end;

                                        TSKScene = class
                                        (TOCGenericImport<
                                        SKSceneClass, SKScene>)
                                        end;
                                        PSKScene = Pointer;

                                        SKTextureClass = interface
                                        (NSObjectClass)
                                        ['{1AB799BE-A673-4630-B899-362C7AEFFEF6}']
                                        { class } function textureWithImageNamed
                                        (name: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function textureWithRect
                                        (rect: CGRect; inTexture: SKTexture)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function
                                        textureVectorNoiseWithSmoothness
                                        (smoothness: CGFloat; size: CGSize)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function
                                        textureNoiseWithSmoothness
                                        (smoothness: CGFloat; size: CGSize;
                                        grayscale: Boolean)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function textureWithCGImage
                                        (image: CGImageRef)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function textureWithImage
                                        (image: UIImage)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('textureWithData:size:')]
                                        { class } function textureWithDataSize
                                        (pixelData: NSData; size: CGSize)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('textureWithData:size:flipped:')]
                                        { class } function
                                        textureWithDataSizeFlipped
                                        (pixelData: NSData; size: CGSize;
                                        flipped: Boolean)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('textureWithData:size:rowLength:alignment:')
                                        ]
                                        { class } function
                                        textureWithDataSizeRowLengthAlignment
                                        (pixelData: NSData; size: CGSize;
                                        rowLength: Cardinal;
                                        alignment: Cardinal)
                                        : Pointer { instancetype }; cdecl;
                                        { class } procedure preloadTextures
                                        (textures: NSArray;
                                        withCompletionHandler
                                        : TSpriteKitCompletion); cdecl;
                                        end;
                                        SKTexture = interface(NSObject)
                                        ['{CF619199-2C98-45BE-BC04-33DE4A352C3E}']
                                        function textureByApplyingCIFilter
                                        (filter: CIFilter)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function textureByGeneratingNormalMap
                                        : Pointer { instancetype }; cdecl;
                                        function textureByGeneratingNormalMapWithSmoothness
                                        (smoothness: CGFloat; contrast: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        function textureRect: CGRect; cdecl;
                                        function size: CGSize; cdecl;
                                        procedure setFilteringMode
                                        (filteringMode
                                        : SKTextureFilteringMode); cdecl;
                                        function filteringMode
                                        : SKTextureFilteringMode; cdecl;
                                        procedure setUsesMipmaps
                                        (usesMipmaps: Boolean); cdecl;
                                        function usesMipmaps: Boolean; cdecl;
                                        function CGImage: CGImageRef; cdecl;
                                        procedure preloadWithCompletionHandler
                                        (completionHandler
                                        : TSpriteKitCompletion); cdecl;
                                        end;

                                        TSKTexture = class
                                        (TOCGenericImport<SKTextureClass,
                                        SKTexture>)
                                        end;
                                        PSKTexture = Pointer;

                                        SKPhysicsBodyClass = interface
                                        (NSObjectClass)
                                        ['{0D041698-07A8-4E81-BE7B-60CA02D93E20}']
                                        [MethodName('bodyWithCircleOfRadius:')]
                                        { class } function
                                        bodyWithCircleOfRadius(r: CGFloat)
                                        : SKPhysicsBody;
                                        cdecl;
                                        [MethodName
                                        ('bodyWithCircleOfRadius:center:')]
                                        { class } function
                                        bodyWithCircleOfRadiusCenter(r: CGFloat;
                                        center: CGPoint): SKPhysicsBody; cdecl;
                                        [MethodName('bodyWithRectangleOfSize:')]
                                        { class } function
                                        bodyWithRectangleOfSize(s: CGSize)
                                        : SKPhysicsBody; cdecl;
                                        [MethodName
                                        ('bodyWithRectangleOfSize:center:')]
                                        { class } function
                                        bodyWithRectangleOfSizeCenter(s: CGSize;
                                        center: CGPoint): SKPhysicsBody; cdecl;
                                        { class } function
                                        bodyWithPolygonFromPath(path: CGPathRef)
                                        : SKPhysicsBody; cdecl;
                                        { class } function bodyWithEdgeFromPoint
                                        (p1: CGPoint; toPoint: CGPoint)
                                        : SKPhysicsBody; cdecl;
                                        { class } function
                                        bodyWithEdgeChainFromPath
                                        (path: CGPathRef): SKPhysicsBody; cdecl;
                                        { class } function
                                        bodyWithEdgeLoopFromPath
                                        (path: CGPathRef): SKPhysicsBody; cdecl;
                                        { class } function
                                        bodyWithEdgeLoopFromRect(rect: CGRect)
                                        : SKPhysicsBody; cdecl;
                                        [MethodName('bodyWithTexture:size:')]
                                        { class } function bodyWithTextureSize
                                        (texture: SKTexture; size: CGSize)
                                        : SKPhysicsBody; cdecl;
                                        [MethodName
                                        ('bodyWithTexture:alphaThreshold:size:')
                                        ]
                                        { class } function
                                        bodyWithTextureAlphaThresholdSize
                                        (texture: SKTexture;
                                        alphaThreshold: Single; size: CGSize)
                                        : SKPhysicsBody; cdecl;
                                        { class } function bodyWithBodies
                                        (bodies: NSArray): SKPhysicsBody; cdecl;
                                        end;
                                        SKPhysicsBody = interface(NSObject)
                                        ['{631F5459-E145-4F57-92FA-46FB5F2A3669}']
                                        procedure setDynamic(dynamic: Boolean);
                                        cdecl;
                                        function isDynamic: Boolean; cdecl;
                                        procedure setUsesPreciseCollisionDetection
                                        (usesPreciseCollisionDetection
                                        : Boolean); cdecl;
                                        function usesPreciseCollisionDetection
                                        : Boolean; cdecl;
                                        procedure setAllowsRotation
                                        (allowsRotation: Boolean); cdecl;
                                        function allowsRotation: Boolean; cdecl;
                                        procedure setPinned
                                        (pinned: Boolean); cdecl;
                                        function pinned: Boolean; cdecl;
                                        procedure setResting
                                        (resting: Boolean); cdecl;
                                        function isResting: Boolean; cdecl;
                                        procedure setFriction
                                        (friction: CGFloat); cdecl;
                                        function friction: CGFloat; cdecl;
                                        procedure setCharge
                                        (charge: CGFloat); cdecl;
                                        function charge: CGFloat; cdecl;
                                        procedure setRestitution
                                        (restitution: CGFloat); cdecl;
                                        function restitution: CGFloat; cdecl;
                                        procedure setLinearDamping
                                        (linearDamping: CGFloat); cdecl;
                                        function linearDamping: CGFloat; cdecl;
                                        procedure setAngularDamping
                                        (angularDamping: CGFloat); cdecl;
                                        function angularDamping: CGFloat; cdecl;
                                        procedure setDensity
                                        (density: CGFloat); cdecl;
                                        function density: CGFloat; cdecl;
                                        procedure setMass(mass: CGFloat); cdecl;
                                        function mass: CGFloat; cdecl;
                                        function area: CGFloat; cdecl;
                                        procedure setAffectedByGravity
                                        (affectedByGravity: Boolean); cdecl;
                                        function affectedByGravity
                                        : Boolean; cdecl;
                                        procedure setFieldBitMask
                                        (fieldBitMask: LongWord); cdecl;
                                        function fieldBitMask: LongWord; cdecl;
                                        procedure setCategoryBitMask
                                        (categoryBitMask: LongWord); cdecl;
                                        function categoryBitMask
                                        : LongWord; cdecl;
                                        procedure setCollisionBitMask
                                        (collisionBitMask: LongWord); cdecl;
                                        function collisionBitMask
                                        : LongWord; cdecl;
                                        procedure setContactTestBitMask
                                        (contactTestBitMask: LongWord); cdecl;
                                        function contactTestBitMask
                                        : LongWord; cdecl;
                                        function joints: NSArray; cdecl;
                                        function node: SKNode; cdecl;
                                        procedure setVelocity
                                        (velocity: CGVector); cdecl;
                                        function velocity: CGVector; cdecl;
                                        procedure setAngularVelocity
                                        (angularVelocity: CGFloat); cdecl;
                                        function angularVelocity
                                        : CGFloat; cdecl;
                                        [MethodName('applyForce:')]
                                        procedure applyForce
                                        (force: CGVector); cdecl;
                                        [MethodName('applyForce:atPoint:')]
                                        procedure applyForceAtPoint
                                        (force: CGVector;
                                        atPoint: CGPoint); cdecl;
                                        procedure applyTorque
                                        (torque: CGFloat); cdecl;
                                        [MethodName('applyImpulse:')]
                                        procedure applyImpulse
                                        (impulse: CGVector); cdecl;
                                        [MethodName('applyImpulse:atPoint:')]
                                        procedure applyImpulseAtPoint
                                        (impulse: CGVector;
                                        atPoint: CGPoint); cdecl;
                                        procedure applyAngularImpulse
                                        (impulse: CGFloat); cdecl;
                                        function allContactedBodies
                                        : NSArray; cdecl;
                                        end;

                                        TSKPhysicsBody = class
                                        (TOCGenericImport<SKPhysicsBodyClass,
                                        SKPhysicsBody>)
                                        end;
                                        PSKPhysicsBody = Pointer;

                                        SKFieldNodeClass = interface
                                        (SKNodeClass)
                                        ['{91506C57-8E00-4F82-9178-73D071B4E2A3}']
                                        { class } function dragField
                                        : SKFieldNode;
                                        cdecl;
                                        { class } function vortexField
                                        : SKFieldNode; cdecl;
                                        { class } function radialGravityField
                                        : SKFieldNode; cdecl;
                                        { class } function
                                        linearGravityFieldWithVector
                                        (direction: vector_float3)
                                        : SKFieldNode; cdecl;
                                        { class } function
                                        velocityFieldWithVector
                                        (direction: vector_float3)
                                        : SKFieldNode; cdecl;
                                        { class } function
                                        velocityFieldWithTexture(velocityTexture
                                        : SKTexture): SKFieldNode; cdecl;
                                        { class } function
                                        noiseFieldWithSmoothness
                                        (smoothness: CGFloat;
                                        animationSpeed: CGFloat)
                                        : SKFieldNode; cdecl;
                                        { class } function
                                        turbulenceFieldWithSmoothness
                                        (smoothness: CGFloat;
                                        animationSpeed: CGFloat)
                                        : SKFieldNode; cdecl;
                                        { class } function springField
                                        : SKFieldNode; cdecl;
                                        { class } function electricField
                                        : SKFieldNode; cdecl;
                                        { class } function magneticField
                                        : SKFieldNode; cdecl;
                                        { class } function
                                        customFieldWithEvaluationBlock
                                        (block: SKFieldForceEvaluator)
                                        : SKFieldNode; cdecl;
                                        end;
                                        SKFieldNode = interface(SKNode)
                                        ['{9D8BE1DC-C429-4894-97C2-85281DAF0AD6}']
                                        procedure setRegion(region: SKRegion);
                                        cdecl;
                                        function region: SKRegion; cdecl;
                                        procedure setStrength
                                        (strength: Single); cdecl;
                                        function strength: Single; cdecl;
                                        procedure setFalloff
                                        (falloff: Single); cdecl;
                                        function falloff: Single; cdecl;
                                        procedure setMinimumRadius
                                        (minimumRadius: Single); cdecl;
                                        function minimumRadius: Single; cdecl;
                                        procedure setEnabled
                                        (enabled: Boolean); cdecl;
                                        function isEnabled: Boolean; cdecl;
                                        procedure setExclusive
                                        (exclusive: Boolean); cdecl;
                                        function isExclusive: Boolean; cdecl;
                                        procedure setCategoryBitMask
                                        (categoryBitMask: LongWord); cdecl;
                                        function categoryBitMask
                                        : LongWord; cdecl;
                                        procedure setDirection
                                        (direction: vector_float3); cdecl;
                                        function direction
                                        : vector_float3; cdecl;
                                        procedure setSmoothness
                                        (smoothness: Single); cdecl;
                                        function smoothness: Single; cdecl;
                                        procedure setAnimationSpeed
                                        (animationSpeed: Single); cdecl;
                                        function animationSpeed: Single; cdecl;
                                        procedure setTexture
                                        (texture: SKTexture); cdecl;
                                        function texture: SKTexture; cdecl;
                                        end;

                                        TSKFieldNode = class
                                        (TOCGenericImport<SKFieldNodeClass,
                                        SKFieldNode>)
                                        end;
                                        PSKFieldNode = Pointer;

                                        SKReachConstraintsClass = interface
                                        (NSObjectClass)
                                        ['{9B116B05-688C-421B-9C61-343F6D174FA1}']
                                        end;
                                        SKReachConstraints = interface(NSObject)
                                        ['{F3D8D326-CF6C-47AC-AB1B-867454240F04}']
                                        procedure setLowerAngleLimit
                                        (lowerAngleLimit: CGFloat);
                                        cdecl;
                                        function lowerAngleLimit
                                        : CGFloat; cdecl;
                                        procedure setUpperAngleLimit
                                        (upperAngleLimit: CGFloat); cdecl;
                                        function upperAngleLimit
                                        : CGFloat; cdecl;
                                        function initWithLowerAngleLimit
                                        (lowerAngleLimit: CGFloat;
                                        upperAngleLimit: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        end;

                                        TSKReachConstraints = class
                                        (TOCGenericImport<
                                        SKReachConstraintsClass,
                                        SKReachConstraints>)
                                        end;
                                        PSKReachConstraints = Pointer;

                                        SKConstraintClass = interface
                                        (NSObjectClass)
                                        ['{66CF9A2E-39F4-4662-99BF-F334438AEA9F}']
                                        [MethodName('positionX:')]
                                        { class } function positionX
                                        (range: SKRange)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function positionY
                                        (range: SKRange)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('positionX:Y:')]
                                        { class } function positionXY
                                        (xRange: SKRange; y: SKRange)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('distance:toNode:')]
                                        { class } function distanceToNode
                                        (range: SKRange; toNode: SKNode)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('distance:toPoint:')]
                                        { class } function distanceToPoint
                                        (range: SKRange; toPoint: CGPoint)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('distance:toPoint:inNode:')]
                                        { class } function distanceToPointInNode
                                        (range: SKRange; toPoint: CGPoint;
                                        inNode: SKNode)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function zRotation
                                        (zRange: SKRange)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function orientToNode
                                        (node: SKNode; offset: SKRange)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('orientToPoint:offset:')]
                                        { class } function orientToPointOffset
                                        (point: CGPoint; offset: SKRange)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('orientToPoint:inNode:offset:')]
                                        { class } function
                                        orientToPointInNodeOffset
                                        (point: CGPoint; inNode: SKNode;
                                        offset: SKRange)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SKConstraint = interface(NSObject)
                                        ['{5932BA79-285E-4FA9-91DC-D3FAD9EE793D}']
                                        procedure setEnabled(enabled: Boolean);
                                        cdecl;
                                        function enabled: Boolean; cdecl;
                                        procedure setReferenceNode
                                        (referenceNode: SKNode); cdecl;
                                        function referenceNode: SKNode; cdecl;
                                        end;

                                        TSKConstraint = class
                                        (TOCGenericImport<SKConstraintClass,
                                        SKConstraint>)
                                        end;
                                        PSKConstraint = Pointer;

                                        SKNodeTouches = interface(IObjectiveC)
                                        ['{66B95712-FB9A-42BC-8FF7-933FE43518EF}']
                                        function locationInNode(node: SKNode)
                                        : CGPoint;
                                        cdecl;
                                        function previousLocationInNode
                                        (node: SKNode): CGPoint; cdecl;
                                        end;

                                        SKUniformClass = interface
                                        (NSObjectClass)
                                        ['{F38A5172-A038-4B7B-9947-200199024DE0}']
                                        [MethodName('uniformWithName:')]
                                        { class } function uniformWithName
                                        (name: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName('uniformWithName:texture:')]
                                        { class } function
                                        uniformWithNameTexture(name: NSString;
                                        texture: SKTexture)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('uniformWithName:float:')]
                                        { class } function uniformWithNameFloat
                                        (name: NSString; float: Single)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('uniformWithName:floatVector2:')]
                                        { class } function
                                        uniformWithNameFloatVector2
                                        (name: NSString;
                                        floatVector2: GLKVector2)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('uniformWithName:floatVector3:')]
                                        { class } function
                                        uniformWithNameFloatVector3
                                        (name: NSString;
                                        floatVector3: GLKVector3)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('uniformWithName:floatVector4:')]
                                        { class } function
                                        uniformWithNameFloatVector4
                                        (name: NSString;
                                        floatVector4: GLKVector4)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('uniformWithName:floatMatrix2:')]
                                        { class } function
                                        uniformWithNameFloatMatrix2
                                        (name: NSString;
                                        floatMatrix2: GLKMatrix2)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('uniformWithName:floatMatrix3:')]
                                        { class } function
                                        uniformWithNameFloatMatrix3
                                        (name: NSString;
                                        floatMatrix3: GLKMatrix3)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('uniformWithName:floatMatrix4:')]
                                        { class } function
                                        uniformWithNameFloatMatrix4
                                        (name: NSString;
                                        floatMatrix4: GLKMatrix4)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SKUniform = interface(NSObject)
                                        ['{301C6A48-6039-4CE7-B4F5-6E34B7ED24FB}']
                                        function name: NSString;
                                        cdecl;
                                        function uniformType
                                        : SKUniformType; cdecl;
                                        procedure setTextureValue
                                        (textureValue: SKTexture); cdecl;
                                        function textureValue: SKTexture; cdecl;
                                        procedure setFloatValue
                                        (floatValue: Single); cdecl;
                                        function floatValue: Single; cdecl;
                                        procedure setFloatVector2Value
                                        (floatVector2Value: GLKVector2); cdecl;
                                        function floatVector2Value
                                        : GLKVector2; cdecl;
                                        procedure setFloatVector3Value
                                        (floatVector3Value: GLKVector3); cdecl;
                                        function floatVector3Value
                                        : GLKVector3; cdecl;
                                        procedure setFloatVector4Value
                                        (floatVector4Value: GLKVector4); cdecl;
                                        function floatVector4Value
                                        : GLKVector4; cdecl;
                                        procedure setFloatMatrix2Value
                                        (floatMatrix2Value: GLKMatrix2); cdecl;
                                        function floatMatrix2Value
                                        : GLKMatrix2; cdecl;
                                        procedure setFloatMatrix3Value
                                        (floatMatrix3Value: GLKMatrix3); cdecl;
                                        function floatMatrix3Value
                                        : GLKMatrix3; cdecl;
                                        procedure setFloatMatrix4Value
                                        (floatMatrix4Value: GLKMatrix4); cdecl;
                                        function floatMatrix4Value
                                        : GLKMatrix4; cdecl;
                                        [MethodName('initWithName:')]
                                        function initWithName(name: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('initWithName:texture:')]
                                        function initWithNameTexture
                                        (name: NSString; texture: SKTexture)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('initWithName:float:')]
                                        function initWithNameFloat
                                        (name: NSString; float: Single)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithName:floatVector2:')]
                                        function initWithNameFloatVector2
                                        (name: NSString;
                                        floatVector2: GLKVector2)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithName:floatVector3:')]
                                        function initWithNameFloatVector3
                                        (name: NSString;
                                        floatVector3: GLKVector3)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithName:floatVector4:')]
                                        function initWithNameFloatVector4
                                        (name: NSString;
                                        floatVector4: GLKVector4)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithName:floatMatrix2:')]
                                        function initWithNameFloatMatrix2
                                        (name: NSString;
                                        floatMatrix2: GLKMatrix2)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithName:floatMatrix3:')]
                                        function initWithNameFloatMatrix3
                                        (name: NSString;
                                        floatMatrix3: GLKMatrix3)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('initWithName:floatMatrix4:')]
                                        function initWithNameFloatMatrix4
                                        (name: NSString;
                                        floatMatrix4: GLKMatrix4)
                                        : Pointer { instancetype }; cdecl;
                                        end;

                                        TSKUniform = class
                                        (TOCGenericImport<SKUniformClass,
                                        SKUniform>)
                                        end;
                                        PSKUniform = Pointer;

                                        SKShaderClass = interface(NSObjectClass)
                                        ['{1CB237B0-82B3-43CE-8D28-68F585DF9427}']
                                        { class } function shader
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName('shaderWithSource:')]
                                        { class } function shaderWithSource
                                        (source: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('shaderWithSource:uniforms:')]
                                        { class } function
                                        shaderWithSourceUniforms
                                        (source: NSString; uniforms: NSArray)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function shaderWithFileNamed
                                        (name: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SKShader = interface(NSObject)
                                        ['{CC62D006-4694-4F78-AA4F-4A59B30E5126}']
                                        [MethodName('initWithSource:')]
                                        function initWithSource
                                        (source: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName('initWithSource:uniforms:')]
                                        function initWithSourceUniforms
                                        (source: NSString; uniforms: NSArray)
                                        : Pointer { instancetype }; cdecl;
                                        procedure setSource
                                        (source: NSString); cdecl;
                                        function source: NSString; cdecl;
                                        procedure setUniforms
                                        (uniforms: NSArray); cdecl;
                                        function uniforms: NSArray; cdecl;
                                        procedure addUniform
                                        (uniform: SKUniform); cdecl;
                                        function uniformNamed(name: NSString)
                                        : SKUniform; cdecl;
                                        procedure removeUniformNamed
                                        (name: NSString); cdecl;
                                        end;

                                        TSKShader = class
                                        (TOCGenericImport<SKShaderClass,
                                        SKShader>)
                                        end;
                                        PSKShader = Pointer;

                                        SKLightNodeClass = interface
                                        (SKNodeClass)
                                        ['{D7E3F7D0-47BA-494A-8FF9-2A0BD6600D4D}']
                                        end;
                                        SKLightNode = interface(SKNode)
                                        ['{629A5CDB-3D33-47CD-A6EC-38828B8F4E19}']
                                        procedure setEnabled(enabled: Boolean);
                                        cdecl;
                                        function isEnabled: Boolean; cdecl;
                                        procedure setLightColor
                                        (lightColor: UIColor); cdecl;
                                        function lightColor: UIColor; cdecl;
                                        procedure setAmbientColor
                                        (ambientColor: UIColor); cdecl;
                                        function ambientColor: UIColor; cdecl;
                                        procedure setShadowColor
                                        (shadowColor: UIColor); cdecl;
                                        function shadowColor: UIColor; cdecl;
                                        procedure setFalloff
                                        (falloff: CGFloat); cdecl;
                                        function falloff: CGFloat; cdecl;
                                        procedure setCategoryBitMask
                                        (categoryBitMask: LongWord); cdecl;
                                        function categoryBitMask
                                        : LongWord; cdecl;
                                        end;

                                        TSKLightNode = class
                                        (TOCGenericImport<SKLightNodeClass,
                                        SKLightNode>)
                                        end;
                                        PSKLightNode = Pointer;

                                        SKSpriteNodeClass = interface
                                        (SKNodeClass)
                                        ['{EA152CC4-9C26-40DB-AC27-0F8E9655E50D}']
                                        [MethodName
                                        ('spriteNodeWithTexture:size:')]
                                        { class } function
                                        spriteNodeWithTextureSize
                                        (texture: SKTexture; size: CGSize)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName('spriteNodeWithTexture:')]
                                        { class } function spriteNodeWithTexture
                                        (texture: SKTexture)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('spriteNodeWithTexture:normalMap:')]
                                        { class } function
                                        spriteNodeWithTextureNormalMap
                                        (texture: SKTexture;
                                        normalMap: SKTexture)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('spriteNodeWithImageNamed:')]
                                        { class } function
                                        spriteNodeWithImageNamed(name: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('spriteNodeWithImageNamed:normalMapped:')
                                        ]
                                        { class } function
                                        spriteNodeWithImageNamedNormalMapped
                                        (name: NSString; normalMapped: Boolean)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function spriteNodeWithColor
                                        (color: UIColor; size: CGSize)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SKSpriteNode = interface(SKNode)
                                        ['{A972AEBB-5DB8-4B90-B48D-6057226BBD06}']
                                        [MethodName
                                        ('initWithTexture:color:size:')]
                                        function initWithTextureColorSize
                                        (texture: SKTexture; color: UIColor;
                                        size: CGSize): Pointer { instancetype };
                                        cdecl;
                                        [MethodName('initWithTexture:')]
                                        function initWithTexture
                                        (texture: SKTexture)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithImageNamed
                                        (name: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithColor(color: UIColor;
                                        size: CGSize)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithCoder
                                        (aDecoder: NSCoder)
                                        : Pointer { instancetype }; cdecl;
                                        procedure setTexture
                                        (texture: SKTexture); cdecl;
                                        function texture: SKTexture; cdecl;
                                        procedure setNormalTexture
                                        (normalTexture: SKTexture); cdecl;
                                        function normalTexture
                                        : SKTexture; cdecl;
                                        procedure setLightingBitMask
                                        (lightingBitMask: LongWord); cdecl;
                                        function lightingBitMask
                                        : LongWord; cdecl;
                                        procedure setShadowCastBitMask
                                        (shadowCastBitMask: LongWord); cdecl;
                                        function shadowCastBitMask
                                        : LongWord; cdecl;
                                        procedure setShadowedBitMask
                                        (shadowedBitMask: LongWord); cdecl;
                                        function shadowedBitMask
                                        : LongWord; cdecl;
                                        procedure setCenterRect
                                        (centerRect: CGRect); cdecl;
                                        function centerRect: CGRect; cdecl;
                                        procedure setColorBlendFactor
                                        (colorBlendFactor: CGFloat); cdecl;
                                        function colorBlendFactor
                                        : CGFloat; cdecl;
                                        procedure setColor
                                        (color: UIColor); cdecl;
                                        function color: UIColor; cdecl;
                                        procedure setBlendMode
                                        (blendMode: SKBlendMode); cdecl;
                                        function blendMode: SKBlendMode; cdecl;
                                        procedure setAnchorPoint
                                        (anchorPoint: CGPoint); cdecl;
                                        function anchorPoint: CGPoint; cdecl;
                                        procedure setSize(size: CGSize); cdecl;
                                        function size: CGSize; cdecl;
                                        procedure setShader
                                        (shader: SKShader); cdecl;
                                        function shader: SKShader; cdecl;
                                        end;

                                        TSKSpriteNode = class
                                        (TOCGenericImport<SKSpriteNodeClass,
                                        SKSpriteNode>)
                                        end;
                                        PSKSpriteNode = Pointer;

                                        SK3DNodeClass = interface(SKNodeClass)
                                        ['{EAD7D74A-82A5-40FE-ADDB-D76536924C09}']
                                        { class } function nodeWithViewportSize
                                        (viewportSize: CGSize)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SK3DNode = interface(SKNode)
                                        ['{D50F637F-164D-41B1-9E1B-ABB1E8A63E29}']
                                        function initWithViewportSize
                                        (viewportSize: CGSize)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithCoder
                                        (aDecoder: NSCoder)
                                        : Pointer { instancetype }; cdecl;
                                        procedure setViewportSize
                                        (viewportSize: CGSize); cdecl;
                                        function viewportSize: CGSize; cdecl;
                                        procedure setScnScene
                                        (scnScene: scnScene); cdecl;
                                        function scnScene: scnScene; cdecl;
                                        procedure setSceneTime
                                        (sceneTime: NSTimeInterval); cdecl;
                                        function sceneTime
                                        : NSTimeInterval; cdecl;
                                        function hitTest(point: CGPoint;
                                        options: NSDictionary): NSArray; cdecl;
                                        function projectPoint
                                        (point: vector_float3)
                                        : vector_float3; cdecl;
                                        function unprojectPoint
                                        (point: vector_float3)
                                        : vector_float3; cdecl;
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
                                        end;

                                        TSK3DNode = class
                                        (TOCGenericImport<SK3DNodeClass,
                                        SK3DNode>)
                                        end;
                                        PSK3DNode = Pointer;

                                        SKCameraNodeClass = interface
                                        (SKNodeClass)
                                        ['{6397068E-5864-4F0F-941E-025614CCF437}']
                                        end;
                                        SKCameraNode = interface(SKNode)
                                        ['{1BD92F34-234A-477A-AE8E-400E72FFE424}']
                                        function containsNode(node: SKNode)
                                        : Boolean;
                                        cdecl;
                                        function containedNodeSet: NSSet; cdecl;
                                        end;

                                        TSKCameraNode = class
                                        (TOCGenericImport<SKCameraNodeClass,
                                        SKCameraNode>)
                                        end;
                                        PSKCameraNode = Pointer;

                                        SKPhysicsWorldClass = interface
                                        (NSObjectClass)
                                        ['{237D1E36-9BBE-4057-98C7-6B7EDC2A6CDF}']
                                        end;
                                        SKPhysicsWorld = interface(NSObject)
                                        ['{346A6E2B-891C-4C58-A61F-1E3773618497}']
                                        procedure setGravity(gravity: CGVector);
                                        cdecl;
                                        function gravity: CGVector; cdecl;
                                        procedure setSpeed
                                        (speed: CGFloat); cdecl;
                                        function speed: CGFloat; cdecl;
                                        procedure setContactDelegate
                                        (contactDelegate: Pointer); cdecl;
                                        function contactDelegate
                                        : Pointer; cdecl;
                                        procedure addJoint
                                        (joint: SKPhysicsJoint); cdecl;
                                        procedure removeJoint
                                        (joint: SKPhysicsJoint); cdecl;
                                        procedure removeAllJoints; cdecl;
                                        function sampleFieldsAt
                                        (position: vector_float3)
                                        : vector_float3; cdecl;
                                        function bodyAtPoint(point: CGPoint)
                                        : SKPhysicsBody; cdecl;
                                        function bodyInRect(rect: CGRect)
                                        : SKPhysicsBody; cdecl;
                                        function bodyAlongRayStart
                                        (start: CGPoint; &end: CGPoint)
                                        : SKPhysicsBody; cdecl;
                                        procedure enumerateBodiesAtPoint
                                        (point: CGPoint;
                                        usingBlock
                                        : TSpriteKitUsingBlock1); cdecl;
                                        procedure enumerateBodiesInRect
                                        (rect: CGRect;
                                        usingBlock
                                        : TSpriteKitUsingBlock1); cdecl;
                                        procedure enumerateBodiesAlongRayStart
                                        (start: CGPoint; &end: CGPoint;
                                        usingBlock
                                        : TSpriteKitUsingBlock2); cdecl;
                                        end;

                                        TSKPhysicsWorld = class
                                        (TOCGenericImport<SKPhysicsWorldClass,
                                        SKPhysicsWorld>)
                                        end;
                                        PSKPhysicsWorld = Pointer;

                                        SKKeyframeSequenceClass = interface
                                        (NSObjectClass)
                                        ['{1EBE39DF-E69E-4857-AEE3-010C078243DF}']
                                        end;
                                        SKKeyframeSequence = interface(NSObject)
                                        ['{C186F997-A6EE-43F7-97C1-40A608351D9B}']
                                        function initWithKeyframeValues
                                        (values: NSArray; times: NSArray)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithCapacity
                                        (numItems: NSUInteger)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithCoder
                                        (aDecoder: NSCoder)
                                        : Pointer { instancetype }; cdecl;
                                        function count: NSUInteger; cdecl;
                                        procedure addKeyframeValue
                                        (value: Pointer; time: CGFloat); cdecl;
                                        procedure removeLastKeyframe; cdecl;
                                        procedure removeKeyframeAtIndex
                                        (index: NSUInteger); cdecl;
                                        [MethodName
                                        ('setKeyframeValue:forIndex:')]
                                        procedure setKeyframeValueForIndex
                                        (value: Pointer;
                                        forIndex: NSUInteger); cdecl;
                                        procedure setKeyframeTime(time: CGFloat;
                                        forIndex: NSUInteger); cdecl;
                                        [MethodName
                                        ('setKeyframeValue:time:forIndex:')]
                                        procedure setKeyframeValueTimeForIndex
                                        (value: Pointer; time: CGFloat;
                                        forIndex: NSUInteger); cdecl;
                                        function getKeyframeValueForIndex
                                        (index: NSUInteger): Pointer; cdecl;
                                        function getKeyframeTimeForIndex
                                        (index: NSUInteger): CGFloat; cdecl;
                                        function sampleAtTime(time: CGFloat)
                                        : Pointer; cdecl;
                                        procedure setInterpolationMode
                                        (interpolationMode
                                        : SKInterpolationMode); cdecl;
                                        function interpolationMode
                                        : SKInterpolationMode; cdecl;
                                        procedure setRepeatMode
                                        (repeatMode: SKRepeatMode); cdecl;
                                        function repeatMode
                                        : SKRepeatMode; cdecl;
                                        end;

                                        TSKKeyframeSequence = class
                                        (TOCGenericImport<
                                        SKKeyframeSequenceClass,
                                        SKKeyframeSequence>)
                                        end;
                                        PSKKeyframeSequence = Pointer;

                                        SKEmitterNodeClass = interface
                                        (SKNodeClass)
                                        ['{5C199CF9-6CD6-489A-912C-04A8007D6C69}']
                                        end;
                                        SKEmitterNode = interface(SKNode)
                                        ['{80FA60CE-A581-42C2-947D-5CBC8253E373}']
                                        procedure advanceSimulationTime
                                        (sec: NSTimeInterval);
                                        cdecl;
                                        procedure resetSimulation; cdecl;
                                        procedure setParticleTexture
                                        (particleTexture: SKTexture); cdecl;
                                        function particleTexture
                                        : SKTexture; cdecl;
                                        procedure setParticleBlendMode
                                        (particleBlendMode: SKBlendMode); cdecl;
                                        function particleBlendMode
                                        : SKBlendMode; cdecl;
                                        procedure setParticleColor
                                        (particleColor: UIColor); cdecl;
                                        function particleColor: UIColor; cdecl;
                                        procedure setParticleColorRedRange
                                        (particleColorRedRange: CGFloat); cdecl;
                                        function particleColorRedRange
                                        : CGFloat; cdecl;
                                        procedure setParticleColorGreenRange
                                        (particleColorGreenRange
                                        : CGFloat); cdecl;
                                        function particleColorGreenRange
                                        : CGFloat; cdecl;
                                        procedure setParticleColorBlueRange
                                        (particleColorBlueRange
                                        : CGFloat); cdecl;
                                        function particleColorBlueRange
                                        : CGFloat; cdecl;
                                        procedure setParticleColorAlphaRange
                                        (particleColorAlphaRange
                                        : CGFloat); cdecl;
                                        function particleColorAlphaRange
                                        : CGFloat; cdecl;
                                        procedure setParticleColorRedSpeed
                                        (particleColorRedSpeed: CGFloat); cdecl;
                                        function particleColorRedSpeed
                                        : CGFloat; cdecl;
                                        procedure setParticleColorGreenSpeed
                                        (particleColorGreenSpeed
                                        : CGFloat); cdecl;
                                        function particleColorGreenSpeed
                                        : CGFloat; cdecl;
                                        procedure setParticleColorBlueSpeed
                                        (particleColorBlueSpeed
                                        : CGFloat); cdecl;
                                        function particleColorBlueSpeed
                                        : CGFloat; cdecl;
                                        procedure setParticleColorAlphaSpeed
                                        (particleColorAlphaSpeed
                                        : CGFloat); cdecl;
                                        function particleColorAlphaSpeed
                                        : CGFloat; cdecl;
                                        procedure setParticleColorSequence
                                        (particleColorSequence
                                        : SKKeyframeSequence); cdecl;
                                        function particleColorSequence
                                        : SKKeyframeSequence; cdecl;
                                        procedure setParticleColorBlendFactor
                                        (particleColorBlendFactor
                                        : CGFloat); cdecl;
                                        function particleColorBlendFactor
                                        : CGFloat; cdecl;
                                        procedure setParticleColorBlendFactorRange
                                        (particleColorBlendFactorRange
                                        : CGFloat); cdecl;
                                        function particleColorBlendFactorRange
                                        : CGFloat; cdecl;
                                        procedure setParticleColorBlendFactorSpeed
                                        (particleColorBlendFactorSpeed
                                        : CGFloat); cdecl;
                                        function particleColorBlendFactorSpeed
                                        : CGFloat; cdecl;
                                        procedure setParticleColorBlendFactorSequence
                                        (particleColorBlendFactorSequence
                                        : SKKeyframeSequence); cdecl;
                                        function particleColorBlendFactorSequence
                                        : SKKeyframeSequence; cdecl;
                                        procedure setParticlePosition
                                        (particlePosition: CGPoint); cdecl;
                                        function particlePosition
                                        : CGPoint; cdecl;
                                        procedure setParticlePositionRange
                                        (particlePositionRange
                                        : CGVector); cdecl;
                                        function particlePositionRange
                                        : CGVector; cdecl;
                                        procedure setParticleSpeed
                                        (particleSpeed: CGFloat); cdecl;
                                        function particleSpeed: CGFloat; cdecl;
                                        procedure setParticleSpeedRange
                                        (particleSpeedRange: CGFloat); cdecl;
                                        function particleSpeedRange
                                        : CGFloat; cdecl;
                                        procedure setEmissionAngle
                                        (emissionAngle: CGFloat); cdecl;
                                        function emissionAngle: CGFloat; cdecl;
                                        procedure setEmissionAngleRange
                                        (emissionAngleRange: CGFloat); cdecl;
                                        function emissionAngleRange
                                        : CGFloat; cdecl;
                                        procedure setXAcceleration
                                        (xAcceleration: CGFloat); cdecl;
                                        function xAcceleration: CGFloat; cdecl;
                                        procedure setYAcceleration
                                        (yAcceleration: CGFloat); cdecl;
                                        function yAcceleration: CGFloat; cdecl;
                                        procedure setParticleBirthRate
                                        (particleBirthRate: CGFloat); cdecl;
                                        function particleBirthRate
                                        : CGFloat; cdecl;
                                        procedure setNumParticlesToEmit
                                        (numParticlesToEmit: NSUInteger); cdecl;
                                        function numParticlesToEmit
                                        : NSUInteger; cdecl;
                                        procedure setParticleLifetime
                                        (particleLifetime: CGFloat); cdecl;
                                        function particleLifetime
                                        : CGFloat; cdecl;
                                        procedure setParticleLifetimeRange
                                        (particleLifetimeRange: CGFloat); cdecl;
                                        function particleLifetimeRange
                                        : CGFloat; cdecl;
                                        procedure setParticleRotation
                                        (particleRotation: CGFloat); cdecl;
                                        function particleRotation
                                        : CGFloat; cdecl;
                                        procedure setParticleRotationRange
                                        (particleRotationRange: CGFloat); cdecl;
                                        function particleRotationRange
                                        : CGFloat; cdecl;
                                        procedure setParticleRotationSpeed
                                        (particleRotationSpeed: CGFloat); cdecl;
                                        function particleRotationSpeed
                                        : CGFloat; cdecl;
                                        procedure setParticleSize
                                        (particleSize: CGSize); cdecl;
                                        function particleSize: CGSize; cdecl;
                                        procedure setParticleScale
                                        (particleScale: CGFloat); cdecl;
                                        function particleScale: CGFloat; cdecl;
                                        procedure setParticleScaleRange
                                        (particleScaleRange: CGFloat); cdecl;
                                        function particleScaleRange
                                        : CGFloat; cdecl;
                                        procedure setParticleScaleSpeed
                                        (particleScaleSpeed: CGFloat); cdecl;
                                        function particleScaleSpeed
                                        : CGFloat; cdecl;
                                        procedure setParticleScaleSequence
                                        (particleScaleSequence
                                        : SKKeyframeSequence); cdecl;
                                        function particleScaleSequence
                                        : SKKeyframeSequence; cdecl;
                                        procedure setParticleAlpha
                                        (particleAlpha: CGFloat); cdecl;
                                        function particleAlpha: CGFloat; cdecl;
                                        procedure setParticleAlphaRange
                                        (particleAlphaRange: CGFloat); cdecl;
                                        function particleAlphaRange
                                        : CGFloat; cdecl;
                                        procedure setParticleAlphaSpeed
                                        (particleAlphaSpeed: CGFloat); cdecl;
                                        function particleAlphaSpeed
                                        : CGFloat; cdecl;
                                        procedure setParticleAlphaSequence
                                        (particleAlphaSequence
                                        : SKKeyframeSequence); cdecl;
                                        function particleAlphaSequence
                                        : SKKeyframeSequence; cdecl;
                                        procedure setParticleAction
                                        (particleAction: SKAction); cdecl;
                                        function particleAction
                                        : SKAction; cdecl;
                                        procedure setFieldBitMask
                                        (fieldBitMask: LongWord); cdecl;
                                        function fieldBitMask: LongWord; cdecl;
                                        procedure setTargetNode
                                        (targetNode: SKNode); cdecl;
                                        function targetNode: SKNode; cdecl;
                                        procedure setShader
                                        (shader: SKShader); cdecl;
                                        function shader: SKShader; cdecl;
                                        procedure setParticleZPosition
                                        (particleZPosition: CGFloat); cdecl;
                                        function particleZPosition
                                        : CGFloat; cdecl;
                                        procedure setParticleRenderOrder
                                        (particleRenderOrder
                                        : SKParticleRenderOrder); cdecl;
                                        function particleRenderOrder
                                        : SKParticleRenderOrder; cdecl;
                                        procedure setParticleZPositionRange
                                        (particleZPositionRange
                                        : CGFloat); cdecl;
                                        function particleZPositionRange
                                        : CGFloat; cdecl;
                                        procedure setParticleZPositionSpeed
                                        (particleZPositionSpeed
                                        : CGFloat); cdecl;
                                        function particleZPositionSpeed
                                        : CGFloat; cdecl;
                                        end;

                                        TSKEmitterNode = class
                                        (TOCGenericImport<SKEmitterNodeClass,
                                        SKEmitterNode>)
                                        end;
                                        PSKEmitterNode = Pointer;

                                        SKShapeNodeClass = interface
                                        (SKNodeClass)
                                        ['{9EAFA7D2-AA55-4CAD-A339-9143CAA66D4A}']
                                        [MethodName('shapeNodeWithPath:')]
                                        { class } function shapeNodeWithPath
                                        (path: CGPathRef)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('shapeNodeWithPath:centered:')]
                                        { class } function
                                        shapeNodeWithPathCentered
                                        (path: CGPathRef; centered: Boolean)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('shapeNodeWithRect:')]
                                        { class } function shapeNodeWithRect
                                        (rect: CGRect)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName('shapeNodeWithRectOfSize:')]
                                        { class } function
                                        shapeNodeWithRectOfSize(size: CGSize)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('shapeNodeWithRect:cornerRadius:')]
                                        { class } function
                                        shapeNodeWithRectCornerRadius
                                        (rect: CGRect; cornerRadius: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('shapeNodeWithRectOfSize:cornerRadius:')
                                        ]
                                        { class } function
                                        shapeNodeWithRectOfSizeCornerRadius
                                        (size: CGSize; cornerRadius: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function
                                        shapeNodeWithCircleOfRadius
                                        (radius: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function
                                        shapeNodeWithEllipseInRect(rect: CGRect)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function
                                        shapeNodeWithEllipseOfSize(size: CGSize)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function shapeNodeWithPoints
                                        (points: Pointer; count: LongWord)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function
                                        shapeNodeWithSplinePoints
                                        (points: Pointer; count: LongWord)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SKShapeNode = interface(SKNode)
                                        ['{48590275-B65C-4CCD-8737-65F3EAF8B342}']
                                        procedure setPath(path: CGPathRef);
                                        cdecl;
                                        function path: CGPathRef; cdecl;
                                        procedure setStrokeColor
                                        (strokeColor: UIColor); cdecl;
                                        function strokeColor: UIColor; cdecl;
                                        procedure setFillColor
                                        (fillColor: UIColor); cdecl;
                                        function fillColor: UIColor; cdecl;
                                        procedure setBlendMode
                                        (blendMode: SKBlendMode); cdecl;
                                        function blendMode: SKBlendMode; cdecl;
                                        procedure setAntialiased
                                        (antialiased: Boolean); cdecl;
                                        function isAntialiased: Boolean; cdecl;
                                        procedure setLineWidth
                                        (lineWidth: CGFloat); cdecl;
                                        function lineWidth: CGFloat; cdecl;
                                        procedure setGlowWidth
                                        (glowWidth: CGFloat); cdecl;
                                        function glowWidth: CGFloat; cdecl;
                                        procedure setLineCap
                                        (lineCap: CGLineCap); cdecl;
                                        function lineCap: CGLineCap; cdecl;
                                        procedure setLineJoin
                                        (lineJoin: CGLineJoin); cdecl;
                                        function lineJoin: CGLineJoin; cdecl;
                                        procedure setMiterLimit
                                        (miterLimit: CGFloat); cdecl;
                                        function miterLimit: CGFloat; cdecl;
                                        function lineLength: CGFloat; cdecl;
                                        procedure setFillTexture
                                        (fillTexture: SKTexture); cdecl;
                                        function fillTexture: SKTexture; cdecl;
                                        procedure setFillShader
                                        (fillShader: SKShader); cdecl;
                                        function fillShader: SKShader; cdecl;
                                        procedure setStrokeTexture
                                        (strokeTexture: SKTexture); cdecl;
                                        function strokeTexture
                                        : SKTexture; cdecl;
                                        procedure setStrokeShader
                                        (strokeShader: SKShader); cdecl;
                                        function strokeShader: SKShader; cdecl;
                                        end;

                                        TSKShapeNode = class
                                        (TOCGenericImport<SKShapeNodeClass,
                                        SKShapeNode>)
                                        end;
                                        PSKShapeNode = Pointer;

                                        SKRegionClass = interface(NSObjectClass)
                                        ['{2C2CD366-7528-4285-A48F-40AE835CF5B7}']
                                        { class } function infiniteRegion
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SKRegion = interface(NSObject)
                                        ['{0C423154-6A26-427B-B987-69F12C6CBC0F}']
                                        function path: CGPathRef;
                                        cdecl;
                                        function initWithRadius(radius: Single)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithSize(size: CGSize)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithPath(path: CGPathRef)
                                        : Pointer { instancetype }; cdecl;
                                        function inverseRegion
                                        : Pointer { instancetype }; cdecl;
                                        function regionByUnionWithRegion
                                        (region: SKRegion)
                                        : Pointer { instancetype }; cdecl;
                                        function regionByDifferenceFromRegion
                                        (region: SKRegion)
                                        : Pointer { instancetype }; cdecl;
                                        function regionByIntersectionWithRegion
                                        (region: SKRegion)
                                        : Pointer { instancetype }; cdecl;
                                        function containsPoint(point: CGPoint)
                                        : Boolean; cdecl;
                                        end;

                                        TSKRegion = class
                                        (TOCGenericImport<SKRegionClass,
                                        SKRegion>)
                                        end;
                                        PSKRegion = Pointer;

                                        SKLabelNodeClass = interface
                                        (SKNodeClass)
                                        ['{57C1D39F-5521-46B5-A949-069F9B82341C}']
                                        { class } function labelNodeWithText
                                        (text: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        labelNodeWithFontNamed
                                        (fontName: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SKLabelNode = interface(SKNode)
                                        ['{08BE4F57-F5D1-4FB2-A78B-F693494B5CB5}']
                                        function initWithFontNamed
                                        (fontName: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setVerticalAlignmentMode
                                        (verticalAlignmentMode
                                        : SKLabelVerticalAlignmentMode); cdecl;
                                        function verticalAlignmentMode
                                        : SKLabelVerticalAlignmentMode; cdecl;
                                        procedure setHorizontalAlignmentMode
                                        (horizontalAlignmentMode
                                        : SKLabelHorizontalAlignmentMode);
                                        cdecl;
                                        function horizontalAlignmentMode
                                        : SKLabelHorizontalAlignmentMode; cdecl;
                                        procedure setFontName
                                        (fontName: NSString); cdecl;
                                        function fontName: NSString; cdecl;
                                        procedure setText
                                        (text: NSString); cdecl;
                                        function text: NSString; cdecl;
                                        procedure setFontSize
                                        (fontSize: CGFloat); cdecl;
                                        function fontSize: CGFloat; cdecl;
                                        procedure setFontColor
                                        (fontColor: UIColor); cdecl;
                                        function fontColor: UIColor; cdecl;
                                        procedure setColorBlendFactor
                                        (colorBlendFactor: CGFloat); cdecl;
                                        function colorBlendFactor
                                        : CGFloat; cdecl;
                                        procedure setColor
                                        (color: UIColor); cdecl;
                                        function color: UIColor; cdecl;
                                        procedure setBlendMode
                                        (blendMode: SKBlendMode); cdecl;
                                        function blendMode: SKBlendMode; cdecl;
                                        end;

                                        TSKLabelNode = class
                                        (TOCGenericImport<SKLabelNodeClass,
                                        SKLabelNode>)
                                        end;
                                        PSKLabelNode = Pointer;

                                        SKVideoNodeClass = interface
                                        (SKNodeClass)
                                        ['{112D5E56-5562-40AC-955D-DB7FBAB0AD7C}']
                                        { class } function videoNodeWithAVPlayer
                                        (player: AVPlayer): SKVideoNode;
                                        cdecl;
                                        { class } function
                                        videoNodeWithVideoFileNamed
                                        (videoFile: NSString)
                                        : SKVideoNode; cdecl;
                                        { class } function
                                        videoNodeWithFileNamed
                                        (videoFile: NSString)
                                        : SKVideoNode; cdecl;
                                        { class } function videoNodeWithVideoURL
                                        (videoURL: NSURL): SKVideoNode; cdecl;
                                        { class } function videoNodeWithURL
                                        (videoURL: NSURL): SKVideoNode; cdecl;
                                        end;
                                        SKVideoNode = interface(SKNode)
                                        ['{912853DB-E86B-41EE-9586-3ED5C9F5BCD3}']
                                        function initWithAVPlayer
                                        (player: AVPlayer)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithVideoFileNamed
                                        (videoFile: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithFileNamed
                                        (videoFile: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithVideoURL(url: NSURL)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithURL(url: NSURL)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithCoder
                                        (aDecoder: NSCoder)
                                        : Pointer { instancetype }; cdecl;
                                        procedure play; cdecl;
                                        procedure pause; cdecl;
                                        procedure setSize(size: CGSize); cdecl;
                                        function size: CGSize; cdecl;
                                        procedure setAnchorPoint
                                        (anchorPoint: CGPoint); cdecl;
                                        function anchorPoint: CGPoint; cdecl;
                                        end;

                                        TSKVideoNode = class
                                        (TOCGenericImport<SKVideoNodeClass,
                                        SKVideoNode>)
                                        end;
                                        PSKVideoNode = Pointer;

                                        SKCropNodeClass = interface(SKNodeClass)
                                        ['{454ECE8E-E690-4FC0-B352-175DF815C9C7}']
                                        end;
                                        SKCropNode = interface(SKNode)
                                        ['{F3ABD207-DD9A-4BED-A425-BAAA27741C9C}']
                                        procedure setMaskNode(maskNode: SKNode);
                                        cdecl;
                                        function maskNode: SKNode; cdecl;
                                        end;

                                        TSKCropNode = class
                                        (TOCGenericImport<SKCropNodeClass,
                                        SKCropNode>)
                                        end;
                                        PSKCropNode = Pointer;

                                        SKReferenceNodeClass = interface
                                        (SKNodeClass)
                                        ['{9BE9ACC0-A127-45E2-A826-F26AAB1870EF}']
                                        { class } function
                                        referenceNodeWithFileNamed
                                        (filename: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function referenceNodeWithURL
                                        (referenceURL: NSURL)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SKReferenceNode = interface(SKNode)
                                        ['{AC87808E-597B-4B44-9634-8EEBDA7F20BB}']
                                        function initWithURL(url: NSURL)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithFileNamed
                                        (filename: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithCoder
                                        (aDecoder: NSCoder)
                                        : Pointer { instancetype }; cdecl;
                                        procedure didLoadReferenceNode
                                        (node: SKNode); cdecl;
                                        procedure resolveReferenceNode; cdecl;
                                        end;

                                        TSKReferenceNode = class
                                        (TOCGenericImport<SKReferenceNodeClass,
                                        SKReferenceNode>)
                                        end;
                                        PSKReferenceNode = Pointer;

                                        SKTransitionClass = interface
                                        (NSObjectClass)
                                        ['{89B94F45-6BEE-4582-B8D2-0EE214A68866}']
                                        { class } function crossFadeWithDuration
                                        (sec: NSTimeInterval): SKTransition;
                                        cdecl;
                                        { class } function fadeWithDuration
                                        (sec: NSTimeInterval)
                                        : SKTransition; cdecl;
                                        { class } function fadeWithColor
                                        (color: UIColor;
                                        duration: NSTimeInterval)
                                        : SKTransition; cdecl;
                                        { class } function
                                        flipHorizontalWithDuration
                                        (sec: NSTimeInterval)
                                        : SKTransition; cdecl;
                                        { class } function
                                        flipVerticalWithDuration
                                        (sec: NSTimeInterval)
                                        : SKTransition; cdecl;
                                        { class } function revealWithDirection
                                        (direction: SKTransitionDirection;
                                        duration: NSTimeInterval)
                                        : SKTransition; cdecl;
                                        { class } function moveInWithDirection
                                        (direction: SKTransitionDirection;
                                        duration: NSTimeInterval)
                                        : SKTransition; cdecl;
                                        { class } function pushWithDirection
                                        (direction: SKTransitionDirection;
                                        duration: NSTimeInterval)
                                        : SKTransition; cdecl;
                                        { class } function
                                        doorsOpenHorizontalWithDuration
                                        (sec: NSTimeInterval)
                                        : SKTransition; cdecl;
                                        { class } function
                                        doorsOpenVerticalWithDuration
                                        (sec: NSTimeInterval)
                                        : SKTransition; cdecl;
                                        { class } function
                                        doorsCloseHorizontalWithDuration
                                        (sec: NSTimeInterval)
                                        : SKTransition; cdecl;
                                        { class } function
                                        doorsCloseVerticalWithDuration
                                        (sec: NSTimeInterval)
                                        : SKTransition; cdecl;
                                        { class } function doorwayWithDuration
                                        (sec: NSTimeInterval)
                                        : SKTransition; cdecl;
                                        { class } function
                                        transitionWithCIFilter(filter: CIFilter;
                                        duration: NSTimeInterval)
                                        : SKTransition; cdecl;
                                        end;
                                        SKTransition = interface(NSObject)
                                        ['{45B68A9F-C094-443F-A114-35F485BBB885}']
                                        procedure setPausesIncomingScene
                                        (pausesIncomingScene: Boolean);
                                        cdecl;
                                        function pausesIncomingScene
                                        : Boolean; cdecl;
                                        procedure setPausesOutgoingScene
                                        (pausesOutgoingScene: Boolean); cdecl;
                                        function pausesOutgoingScene
                                        : Boolean; cdecl;
                                        end;

                                        TSKTransition = class
                                        (TOCGenericImport<SKTransitionClass,
                                        SKTransition>)
                                        end;
                                        PSKTransition = Pointer;

                                        SKMutableTextureClass = interface
                                        (SKTextureClass)
                                        ['{7731DC5A-5898-45F6-BCD7-BE7EA1E809E6}']
                                        { class } function
                                        mutableTextureWithSize(size: CGSize)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        SKMutableTexture = interface(SKTexture)
                                        ['{B1D32F91-5A93-440C-8780-F55B207B817C}']
                                        [MethodName('initWithSize:')]
                                        function initWithSize(size: CGSize)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('initWithSize:pixelFormat:')]
                                        function initWithSizePixelFormat
                                        (size: CGSize; pixelFormat: Integer)
                                        : Pointer { instancetype }; cdecl;
                                        procedure modifyPixelDataWithBlock
                                        (block: TSpriteKitBlock); cdecl;
                                        end;

                                        TSKMutableTexture = class
                                        (TOCGenericImport<SKMutableTextureClass,
                                        SKMutableTexture>)
                                        end;
                                        PSKMutableTexture = Pointer;

                                        SKTextureAtlasClass = interface
                                        (NSObjectClass)
                                        ['{C0FAAD15-18D7-4851-9188-1C2CCD65E403}']
                                        { class } function atlasNamed
                                        (name: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function atlasWithDictionary
                                        (properties: NSDictionary)
                                        : Pointer { instancetype }; cdecl;
                                        { class } procedure
                                        preloadTextureAtlases
                                        (textureAtlases: NSArray;
                                        withCompletionHandler
                                        : TSpriteKitCompletion); cdecl;
                                        { class } procedure
                                        preloadTextureAtlasesNamed
                                        (atlasNames: NSArray;
                                        withCompletionHandler
                                        : TSpriteKitWithCompletionHandler);
                                        cdecl;
                                        end;
                                        SKTextureAtlas = interface(NSObject)
                                        ['{F9153A63-AFFF-4DC4-A40A-B77A66B0C9BF}']
                                        function textureNamed(name: NSString)
                                        : SKTexture;
                                        cdecl;
                                        procedure preloadWithCompletionHandler
                                        (completionHandler
                                        : TSpriteKitCompletion); cdecl;
                                        function textureNames: NSArray; cdecl;
                                        end;

                                        TSKTextureAtlas = class
                                        (TOCGenericImport<SKTextureAtlasClass,
                                        SKTextureAtlas>)
                                        end;
                                        PSKTextureAtlas = Pointer;

                                        SKRangeClass = interface(NSObjectClass)
                                        ['{818893EA-E1D3-4B7C-BC17-A1373FB2BC2D}']
                                        [MethodName
                                        ('rangeWithLowerLimit:upperLimit:')]
                                        { class } function
                                        rangeWithLowerLimitUpperLimit
                                        (lower: CGFloat; upperLimit: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName('rangeWithLowerLimit:')]
                                        { class } function rangeWithLowerLimit
                                        (lower: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function rangeWithUpperLimit
                                        (upper: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function
                                        rangeWithConstantValue(value: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function rangeWithValue
                                        (value: CGFloat; variance: CGFloat)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function rangeWithNoLimits
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        SKRange = interface(NSObject)
                                        ['{3AB86F0C-BCAF-450A-9C7C-066FECDDE8CF}']
                                        function initWithLowerLimit
                                        (lower: CGFloat; upperLimit: CGFloat)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setLowerLimit
                                        (lowerLimit: CGFloat); cdecl;
                                        function lowerLimit: CGFloat; cdecl;
                                        procedure setUpperLimit
                                        (upperLimit: CGFloat); cdecl;
                                        function upperLimit: CGFloat; cdecl;
                                        end;

                                        TSKRange = class
                                        (TOCGenericImport<
                                        SKRangeClass, SKRange>)
                                        end;
                                        PSKRange = Pointer;

                                        SKPhysicsJointClass = interface
                                        (NSObjectClass)
                                        ['{749E2E42-C1A1-48B9-B688-A588DA95FE2E}']
                                        end;
                                        SKPhysicsJoint = interface(NSObject)
                                        ['{5DB83DD2-6CC9-403D-921E-527B93BF3DEA}']
                                        procedure setBodyA
                                        (bodyA: SKPhysicsBody);
                                        cdecl;
                                        function bodyA: SKPhysicsBody; cdecl;
                                        procedure setBodyB
                                        (bodyB: SKPhysicsBody); cdecl;
                                        function bodyB: SKPhysicsBody; cdecl;
                                        function reactionForce: CGVector; cdecl;
                                        function reactionTorque: CGFloat; cdecl;
                                        end;

                                        TSKPhysicsJoint = class
                                        (TOCGenericImport<SKPhysicsJointClass,
                                        SKPhysicsJoint>)
                                        end;
                                        PSKPhysicsJoint = Pointer;

                                        SKPhysicsJointPinClass = interface
                                        (SKPhysicsJointClass)
                                        ['{57B96288-005C-4FCB-B9A9-49E982E0A31E}']
                                        { class } function jointWithBodyA
                                        (bodyA: SKPhysicsBody;
                                        bodyB: SKPhysicsBody; anchor: CGPoint)
                                        : SKPhysicsJointPin;
                                        cdecl;
                                        end;
                                        SKPhysicsJointPin = interface
                                        (SKPhysicsJoint)
                                        ['{56E20947-3E91-4C42-B629-F84B03DDB66F}']
                                        procedure setShouldEnableLimits
                                        (shouldEnableLimits: Boolean);
                                        cdecl;
                                        function shouldEnableLimits
                                        : Boolean; cdecl;
                                        procedure setLowerAngleLimit
                                        (lowerAngleLimit: CGFloat); cdecl;
                                        function lowerAngleLimit
                                        : CGFloat; cdecl;
                                        procedure setUpperAngleLimit
                                        (upperAngleLimit: CGFloat); cdecl;
                                        function upperAngleLimit
                                        : CGFloat; cdecl;
                                        procedure setFrictionTorque
                                        (frictionTorque: CGFloat); cdecl;
                                        function frictionTorque: CGFloat; cdecl;
                                        procedure setRotationSpeed
                                        (rotationSpeed: CGFloat); cdecl;
                                        function rotationSpeed: CGFloat; cdecl;
                                        end;

                                        TSKPhysicsJointPin = class
                                        (TOCGenericImport<
                                        SKPhysicsJointPinClass,
                                        SKPhysicsJointPin>)
                                        end;
                                        PSKPhysicsJointPin = Pointer;

                                        SKPhysicsJointSpringClass = interface
                                        (SKPhysicsJointClass)
                                        ['{74BFD98E-25A9-439C-8198-6B9E8EF3FD41}']
                                        { class } function jointWithBodyA
                                        (bodyA: SKPhysicsBody;
                                        bodyB: SKPhysicsBody; anchorA: CGPoint;
                                        anchorB: CGPoint): SKPhysicsJointSpring;
                                        cdecl;
                                        end;
                                        SKPhysicsJointSpring = interface
                                        (SKPhysicsJoint)
                                        ['{5CAEC93A-0C74-4A58-A43E-8C47EEA096C7}']
                                        procedure setDamping(damping: CGFloat);
                                        cdecl;
                                        function damping: CGFloat; cdecl;
                                        procedure setFrequency
                                        (frequency: CGFloat); cdecl;
                                        function frequency: CGFloat; cdecl;
                                        end;

                                        TSKPhysicsJointSpring = class
                                        (TOCGenericImport<
                                        SKPhysicsJointSpringClass,
                                        SKPhysicsJointSpring>)
                                        end;
                                        PSKPhysicsJointSpring = Pointer;

                                        SKPhysicsJointFixedClass = interface
                                        (SKPhysicsJointClass)
                                        ['{32BD67F0-55D7-4877-A55F-5DDBD9A56863}']
                                        { class } function jointWithBodyA
                                        (bodyA: SKPhysicsBody;
                                        bodyB: SKPhysicsBody; anchor: CGPoint)
                                        : SKPhysicsJointFixed;
                                        cdecl;
                                        end;
                                        SKPhysicsJointFixed = interface
                                        (SKPhysicsJoint)
                                        ['{EE9B3C2E-B16D-4FBD-89FD-F89AB856132F}']
                                        end;

                                        TSKPhysicsJointFixed = class
                                        (TOCGenericImport<
                                        SKPhysicsJointFixedClass,
                                        SKPhysicsJointFixed>)
                                        end;
                                        PSKPhysicsJointFixed = Pointer;

                                        SKPhysicsJointSlidingClass = interface
                                        (SKPhysicsJointClass)
                                        ['{E8E09391-011F-4764-84C1-47DEF644684A}']
                                        { class } function jointWithBodyA
                                        (bodyA: SKPhysicsBody;
                                        bodyB: SKPhysicsBody; anchor: CGPoint;
                                        axis: CGVector): SKPhysicsJointSliding;
                                        cdecl;
                                        end;
                                        SKPhysicsJointSliding = interface
                                        (SKPhysicsJoint)
                                        ['{2BE5082B-09DE-48CA-B2C0-85B8E42D333A}']
                                        procedure setShouldEnableLimits
                                        (shouldEnableLimits: Boolean);
                                        cdecl;
                                        function shouldEnableLimits
                                        : Boolean; cdecl;
                                        procedure setLowerDistanceLimit
                                        (lowerDistanceLimit: CGFloat); cdecl;
                                        function lowerDistanceLimit
                                        : CGFloat; cdecl;
                                        procedure setUpperDistanceLimit
                                        (upperDistanceLimit: CGFloat); cdecl;
                                        function upperDistanceLimit
                                        : CGFloat; cdecl;
                                        end;

                                        TSKPhysicsJointSliding = class
                                        (TOCGenericImport<
                                        SKPhysicsJointSlidingClass,
                                        SKPhysicsJointSliding>)
                                        end;
                                        PSKPhysicsJointSliding = Pointer;

                                        SKPhysicsJointLimitClass = interface
                                        (SKPhysicsJointClass)
                                        ['{7CF681A7-2B72-4B31-9EBB-CD2FF3DF2FC1}']
                                        { class } function jointWithBodyA
                                        (bodyA: SKPhysicsBody;
                                        bodyB: SKPhysicsBody; anchorA: CGPoint;
                                        anchorB: CGPoint): SKPhysicsJointLimit;
                                        cdecl;
                                        end;
                                        SKPhysicsJointLimit = interface
                                        (SKPhysicsJoint)
                                        ['{D2AC1841-FA64-4EE3-BF6A-DE356DFA92A5}']
                                        procedure setMaxLength
                                        (maxLength: CGFloat);
                                        cdecl;
                                        function maxLength: CGFloat; cdecl;
                                        end;

                                        TSKPhysicsJointLimit = class
                                        (TOCGenericImport<
                                        SKPhysicsJointLimitClass,
                                        SKPhysicsJointLimit>)
                                        end;
                                        PSKPhysicsJointLimit = Pointer;

                                        SKPhysicsContactClass = interface
                                        (NSObjectClass)
                                        ['{6CFA4FB2-4CE2-4D03-B54F-9B3D5BE76369}']
                                        end;
                                        SKPhysicsContact = interface(NSObject)
                                        ['{B74C5AEA-BF5E-480F-B1DD-93A02338FCE6}']
                                        function bodyA: SKPhysicsBody;
                                        cdecl;
                                        function bodyB: SKPhysicsBody; cdecl;
                                        function contactPoint: CGPoint; cdecl;
                                        function contactNormal: CGVector; cdecl;
                                        function collisionImpulse
                                        : CGFloat; cdecl;
                                        end;

                                        TSKPhysicsContact = class
                                        (TOCGenericImport<SKPhysicsContactClass,
                                        SKPhysicsContact>)
                                        end;
                                        PSKPhysicsContact = Pointer;

                                        SKAudioNodeClass = interface
                                        (SKNodeClass)
                                        ['{D24A03FE-4037-42B9-BAF6-9B80D2461D07}']
                                        end;
                                        SKAudioNode = interface(SKNode)
                                        ['{E59F7152-8C09-40B5-9E94-F48F25BC5755}']
                                        function initWithAVAudioNode
                                        (node: AVAudioNode)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function initWithCoder
                                        (aDecoder: NSCoder)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithFileNamed
                                        (name: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        function initWithURL(url: NSURL)
                                        : Pointer { instancetype }; cdecl;
                                        procedure setAvAudioNode
                                        (AVAudioNode: AVAudioNode); cdecl;
                                        function AVAudioNode
                                        : AVAudioNode; cdecl;
                                        procedure setAutoplayLooped
                                        (autoplayLooped: Boolean); cdecl;
                                        function autoplayLooped: Boolean; cdecl;
                                        procedure setPositional
                                        (positional: Boolean); cdecl;
                                        function isPositional: Boolean; cdecl;
                                        end;

                                        TSKAudioNode = class
                                        (TOCGenericImport<SKAudioNodeClass,
                                        SKAudioNode>)
                                        end;
                                        PSKAudioNode = Pointer;

                                        // ===== Protocol declarations =====

                                        SKSceneDelegate = interface(IObjectiveC)
                                        ['{E4100BF6-66A5-415C-A5BB-B6C212B5EF2C}']
                                        procedure update
                                        (currentTime: NSTimeInterval;
                                        forScene: SKScene);
                                        cdecl;
                                        procedure didEvaluateActionsForScene
                                        (scene: SKScene); cdecl;
                                        procedure didSimulatePhysicsForScene
                                        (scene: SKScene); cdecl;
                                        procedure didApplyConstraintsForScene
                                        (scene: SKScene); cdecl;
                                        procedure didFinishUpdateForScene
                                        (scene: SKScene); cdecl;
                                        end;

                                        SKPhysicsContactDelegate = interface
                                        (IObjectiveC)
                                        ['{29E51A89-41E1-44FB-871B-E887A2444519}']
                                        procedure didBeginContact
                                        (contact: SKPhysicsContact);
                                        cdecl;
                                        procedure didEndContact
                                        (contact: SKPhysicsContact); cdecl;
                                        end;

                                        // ===== External functions =====

                                        const
                                        libSpriteKit =
                                        '/System/Library/Frameworks/SpriteKit.framework/SpriteKit';

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
