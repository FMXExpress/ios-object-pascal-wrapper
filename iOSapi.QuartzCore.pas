{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework QuartzCore
//

unit iOSapi.QuartzCore;

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
  iOSapi.Metal;

const
  kCALayerLeftEdge = 1 shl 0;
  kCALayerRightEdge = 1 shl 1;
  kCALayerBottomEdge = 1 shl 2;
  kCALayerTopEdge = 1 shl 3;

type

  // ===== Forward declarations =====
{$M+}
  CAMediaTiming = interface;
  CATransform3DAdditions = interface;
  CAAnimation = interface;
  CAAction = interface;
  CALayer = interface;
  CAActionAdditions = interface;
  CALayerDelegate = interface;
  CAMediaTimingFunction = interface;
  CAValueFunction = interface;
  CAAnimationDelegate = interface;
  CAPropertyAnimation = interface;
  CABasicAnimation = interface;
  CAKeyframeAnimation = interface;
  CASpringAnimation = interface;
  CATransition = interface;
  CAAnimationGroup = interface;
  CADisplayLink = interface;
  CAEAGLLayer = interface;
  CAEmitterBehavior = interface;
  CAEmitterCell = interface;
  CAEmitterLayer = interface;
  CAGradientLayer = interface;
  MTLDevice = interface;
  MTLTexture = interface;
  CAMetalLayer = interface;
  CAMetalDrawable = interface;
  CAReplicatorLayer = interface;
  CAScrollLayer = interface;
  CAShapeLayer = interface;
  CATextLayer = interface;
  CATiledLayer = interface;
  CATransaction = interface;
  CATransformLayer = interface;

  // ===== Framework typedefs =====
{$M+}
  CFTimeInterval = Double;
  CGFloat = Single;

  CATransform3D = record
    m11: CGFloat;
    m12: CGFloat;
    m13: CGFloat;
    m14: CGFloat;
    m21: CGFloat;
    m22: CGFloat;
    m23: CGFloat;
    m24: CGFloat;
    m31: CGFloat;
    m32: CGFloat;
    m33: CGFloat;
    m34: CGFloat;
    m41: CGFloat;
    m42: CGFloat;
    m43: CGFloat;
    m44: CGFloat;
  end;

  PCATransform3D = ^CATransform3D;

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
CAEdgeAntialiasingMask = Cardinal;
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
CGContextRef = Pointer;
CGColorRef = Pointer;
CGPathRef = Pointer;
SEL = SEL *;
NSInteger = Integer;
__darwin_size_t = LongWord;
NSUInteger = Cardinal;
MTLPixelFormat = NSUInteger;
CFTypeRef = Pointer;
TQuartzCoreCompletionBlock =
procedure() of object;
// ===== Interface declarations =====

CATransform3DAdditions = interface(IObjectiveC)
  ['{23A6CAC3-F600-493C-800D-CE17D0648852}']
function valueWithCATransform3D(t: CATransform3D): NSValue;
cdecl;

function CATransform3DValue: CATransform3D; cdecl;
end;

CAAnimationClass = interface(NSObjectClass)
  ['{3BDF82CB-6A98-4226-8EBA-D8C2225DA5E5}']
{ class } function animation: Pointer { instancetype };
cdecl;

{ class } function defaultValueForKey(key: NSString): Pointer; cdecl;
end;
CAAnimation = interface(NSObject)['{A9C73638-E225-46CF-8981-C67863036E65}']
function shouldArchiveValueForKey(key: NSString): Boolean;
cdecl;

procedure setTimingFunction(timingFunction: CAMediaTimingFunction); cdecl;
  function timingFunction: CAMediaTimingFunction; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
      function delegate: Pointer; cdecl;
        procedure setRemovedOnCompletion(removedOnCompletion: Boolean); cdecl;
          function isRemovedOnCompletion: Boolean; cdecl;
          end;

      TCAAnimation = class(TOCGenericImport<CAAnimationClass, CAAnimation>)
      end;
  PCAAnimation = Pointer;

  CALayerClass = interface(NSObjectClass)
    ['{EACD5763-C494-4B12-80D4-F88C7612194C}']
  { class } function layer: Pointer { instancetype };
  cdecl;
  { class } function defaultValueForKey(key: NSString): Pointer; cdecl;
    { class } function needsDisplayForKey(key: NSString): Boolean; cdecl;
      { class } function defaultActionForKey(event: NSString): Pointer; cdecl;
        end;
    CALayer = interface(NSObject)['{1078BAFA-880D-49CD-A178-7CF94BFEF680}']
    function init: Pointer { instancetype };
    cdecl;
      function initWithLayer(layer: Pointer): Pointer { instancetype }; cdecl;
        function presentationLayer: Pointer; cdecl;
          function modelLayer: Pointer; cdecl;
            function shouldArchiveValueForKey(key: NSString): Boolean; cdecl;
              procedure setBounds(bounds: CGRect); cdecl;
                function bounds: CGRect; cdecl;
                  procedure setPosition(position: CGPoint); cdecl;
                    function position: CGPoint; cdecl;
                      procedure setZPosition(zPosition: CGFloat); cdecl;
                        function zPosition: CGFloat; cdecl;
                          procedure setAnchorPoint(anchorPoint: CGPoint); cdecl;
                            function anchorPoint: CGPoint; cdecl;
                              procedure setAnchorPointZ
                                (anchorPointZ: CGFloat); cdecl;
                                function anchorPointZ: CGFloat; cdecl;
                                  procedure setTransform
                                    (transform: CATransform3D); cdecl;
                                    function transform: CATransform3D; cdecl;
                                      function affineTransform
                                        : CGAffineTransform; cdecl;
                                        procedure setAffineTransform
                                        (m: CGAffineTransform); cdecl;
                                        procedure setFrame
                                        (frame: CGRect); cdecl;
                                        function frame: CGRect; cdecl;
                                        procedure setHidden
                                        (hidden: Boolean); cdecl;
                                        function isHidden: Boolean; cdecl;
                                        procedure setDoubleSided
                                        (doubleSided: Boolean); cdecl;
                                        function isDoubleSided: Boolean; cdecl;
                                        procedure setGeometryFlipped
                                        (geometryFlipped: Boolean); cdecl;
                                        function isGeometryFlipped
                                        : Boolean; cdecl;
                                        function contentsAreFlipped
                                        : Boolean; cdecl;
                                        function superlayer: CALayer; cdecl;
                                        procedure removeFromSuperlayer; cdecl;
                                        procedure setSublayers
                                        (sublayers: NSArray); cdecl;
                                        function sublayers: NSArray; cdecl;
                                        procedure addSublayer
                                        (layer: CALayer); cdecl;
                                        [MethodName('insertSublayer:atIndex:')]
                                        procedure insertSublayerAtIndex
                                        (layer: CALayer;
                                        atIndex: Cardinal); cdecl;
                                        [MethodName('insertSublayer:below:')]
                                        procedure insertSublayerBelow
                                        (layer: CALayer; below: CALayer); cdecl;
                                        [MethodName('insertSublayer:above:')]
                                        procedure insertSublayerAbove
                                        (layer: CALayer; above: CALayer); cdecl;
                                        procedure replaceSublayer
                                        (layer: CALayer; &with: CALayer); cdecl;
                                        procedure setSublayerTransform
                                        (sublayerTransform
                                        : CATransform3D); cdecl;
                                        function sublayerTransform
                                        : CATransform3D; cdecl;
                                        procedure setMask(mask: CALayer); cdecl;
                                        function mask: CALayer; cdecl;
                                        procedure setMasksToBounds
                                        (masksToBounds: Boolean); cdecl;
                                        function masksToBounds: Boolean; cdecl;
                                        [MethodName('convertPoint:fromLayer:')]
                                        function convertPointFromLayer
                                        (p: CGPoint; fromLayer: CALayer)
                                        : CGPoint; cdecl;
                                        [MethodName('convertPoint:toLayer:')]
                                        function convertPointToLayer(p: CGPoint;
                                        toLayer: CALayer): CGPoint; cdecl;
                                        [MethodName('convertRect:fromLayer:')]
                                        function convertRectFromLayer(r: CGRect;
                                        fromLayer: CALayer): CGRect; cdecl;
                                        [MethodName('convertRect:toLayer:')]
                                        function convertRectToLayer(r: CGRect;
                                        toLayer: CALayer): CGRect; cdecl;
                                        [MethodName('convertTime:fromLayer:')]
                                        function convertTimeFromLayer
                                        (t: CFTimeInterval; fromLayer: CALayer)
                                        : CFTimeInterval; cdecl;
                                        [MethodName('convertTime:toLayer:')]
                                        function convertTimeToLayer
                                        (t: CFTimeInterval; toLayer: CALayer)
                                        : CFTimeInterval; cdecl;
                                        function hitTest(p: CGPoint)
                                        : CALayer; cdecl;
                                        function containsPoint(p: CGPoint)
                                        : Boolean; cdecl;
                                        procedure setContents
                                        (contents: Pointer); cdecl;
                                        function contents: Pointer; cdecl;
                                        procedure setContentsRect
                                        (contentsRect: CGRect); cdecl;
                                        function contentsRect: CGRect; cdecl;
                                        procedure setContentsGravity
                                        (contentsGravity: NSString); cdecl;
                                        function contentsGravity
                                        : NSString; cdecl;
                                        procedure setContentsScale
                                        (contentsScale: CGFloat); cdecl;
                                        function contentsScale: CGFloat; cdecl;
                                        procedure setContentsCenter
                                        (contentsCenter: CGRect); cdecl;
                                        function contentsCenter: CGRect; cdecl;
                                        procedure setMinificationFilter
                                        (minificationFilter: NSString); cdecl;
                                        function minificationFilter
                                        : NSString; cdecl;
                                        procedure setMagnificationFilter
                                        (magnificationFilter: NSString); cdecl;
                                        function magnificationFilter
                                        : NSString; cdecl;
                                        procedure setMinificationFilterBias
                                        (minificationFilterBias: Single); cdecl;
                                        function minificationFilterBias
                                        : Single; cdecl;
                                        procedure setOpaque
                                        (opaque: Boolean); cdecl;
                                        function isOpaque: Boolean; cdecl;
                                        procedure display; cdecl;
                                        procedure setNeedsDisplay; cdecl;
                                        procedure setNeedsDisplayInRect
                                        (r: CGRect); cdecl;
                                        function needsDisplay: Boolean; cdecl;
                                        procedure displayIfNeeded; cdecl;
                                        procedure setNeedsDisplayOnBoundsChange
                                        (needsDisplayOnBoundsChange
                                        : Boolean); cdecl;
                                        function needsDisplayOnBoundsChange
                                        : Boolean; cdecl;
                                        procedure setDrawsAsynchronously
                                        (drawsAsynchronously: Boolean); cdecl;
                                        function drawsAsynchronously
                                        : Boolean; cdecl;
                                        procedure drawInContext
                                        (ctx: CGContextRef); cdecl;
                                        procedure renderInContext
                                        (ctx: CGContextRef); cdecl;
                                        procedure setEdgeAntialiasingMask
                                        (edgeAntialiasingMask
                                        : CAEdgeAntialiasingMask); cdecl;
                                        function edgeAntialiasingMask
                                        : CAEdgeAntialiasingMask; cdecl;
                                        procedure setAllowsEdgeAntialiasing
                                        (allowsEdgeAntialiasing
                                        : Boolean); cdecl;
                                        function allowsEdgeAntialiasing
                                        : Boolean; cdecl;
                                        procedure setBackgroundColor
                                        (backgroundColor: CGColorRef); cdecl;
                                        function backgroundColor
                                        : CGColorRef; cdecl;
                                        procedure setCornerRadius
                                        (cornerRadius: CGFloat); cdecl;
                                        function cornerRadius: CGFloat; cdecl;
                                        procedure setBorderWidth
                                        (borderWidth: CGFloat); cdecl;
                                        function borderWidth: CGFloat; cdecl;
                                        procedure setBorderColor
                                        (borderColor: CGColorRef); cdecl;
                                        function borderColor: CGColorRef; cdecl;
                                        procedure setOpacity
                                        (opacity: Single); cdecl;
                                        function opacity: Single; cdecl;
                                        procedure setAllowsGroupOpacity
                                        (allowsGroupOpacity: Boolean); cdecl;
                                        function allowsGroupOpacity
                                        : Boolean; cdecl;
                                        procedure setCompositingFilter
                                        (compositingFilter: Pointer); cdecl;
                                        function compositingFilter
                                        : Pointer; cdecl;
                                        procedure setFilters
                                        (filters: NSArray); cdecl;
                                        function filters: NSArray; cdecl;
                                        procedure setBackgroundFilters
                                        (backgroundFilters: NSArray); cdecl;
                                        function backgroundFilters
                                        : NSArray; cdecl;
                                        procedure setShouldRasterize
                                        (shouldRasterize: Boolean); cdecl;
                                        function shouldRasterize
                                        : Boolean; cdecl;
                                        procedure setRasterizationScale
                                        (rasterizationScale: CGFloat); cdecl;
                                        function rasterizationScale
                                        : CGFloat; cdecl;
                                        procedure setShadowColor
                                        (shadowColor: CGColorRef); cdecl;
                                        function shadowColor: CGColorRef; cdecl;
                                        procedure setShadowOpacity
                                        (shadowOpacity: Single); cdecl;
                                        function shadowOpacity: Single; cdecl;
                                        procedure setShadowOffset
                                        (shadowOffset: CGSize); cdecl;
                                        function shadowOffset: CGSize; cdecl;
                                        procedure setShadowRadius
                                        (shadowRadius: CGFloat); cdecl;
                                        function shadowRadius: CGFloat; cdecl;
                                        procedure setShadowPath
                                        (shadowPath: CGPathRef); cdecl;
                                        function shadowPath: CGPathRef; cdecl;
                                        function preferredFrameSize
                                        : CGSize; cdecl;
                                        procedure setNeedsLayout; cdecl;
                                        function needsLayout: Boolean; cdecl;
                                        procedure layoutIfNeeded; cdecl;
                                        procedure layoutSublayers; cdecl;
                                        function actionForKey(event: NSString)
                                        : Pointer; cdecl;
                                        procedure setActions
                                        (actions: NSDictionary); cdecl;
                                        function actions: NSDictionary; cdecl;
                                        procedure addAnimation
                                        (anim: CAAnimation;
                                        forKey: NSString); cdecl;
                                        procedure removeAllAnimations; cdecl;
                                        procedure removeAnimationForKey
                                        (key: NSString); cdecl;
                                        function animationKeys: NSArray; cdecl;
                                        function animationForKey(key: NSString)
                                        : CAAnimation; cdecl;
                                        procedure setName
                                        (name: NSString); cdecl;
                                        function name: NSString; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        procedure setStyle
                                        (style: NSDictionary); cdecl;
                                        function style: NSDictionary; cdecl;
                                        procedure scrollPoint
                                        (p: CGPoint); cdecl;
                                        procedure scrollRectToVisible
                                        (r: CGRect); cdecl;
                                        function visibleRect: CGRect; cdecl;
                                        end;

                                        TCALayer = class
                                        (TOCGenericImport<
                                        CALayerClass, CALayer>)
                                        end;
                                        PCALayer = Pointer;

                                        CAActionAdditions = interface
                                        (IObjectiveC)
                                        ['{66AF3D45-4561-4681-BB41-123E9867CAE3}']
                                        end;

                                        CALayerDelegate = interface(IObjectiveC)
                                        ['{0FFB01F9-ECAF-45A5-A58F-AD1D3723B58A}']
                                        procedure displayLayer(layer: CALayer);
                                        cdecl;
                                        procedure drawLayer(layer: CALayer;
                                        inContext: CGContextRef); cdecl;
                                        procedure layoutSublayersOfLayer
                                        (layer: CALayer); cdecl;
                                        function actionForLayer(layer: CALayer;
                                        forKey: NSString): Pointer; cdecl;
                                        end;

                                        CAMediaTimingFunctionClass = interface
                                        (NSObjectClass)
                                        ['{B8224E8D-BE98-45C9-BAE3-C480B61C491F}']
                                        { class } function functionWithName
                                        (name: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('functionWithControlPoints::::')]
                                        { class } function
                                        functionWithControlPoints(c1x: Single;
                                        c1y: Single; c2x: Single; c2y: Single)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        CAMediaTimingFunction = interface
                                        (NSObject)
                                        ['{D7E395BB-EB53-4EEF-AAAC-BFDD6DBF995E}']
                                        [MethodName
                                        ('initWithControlPoints::::')]
                                        function initWithControlPoints
                                        (c1x: Single; c1y: Single; c2x: Single;
                                        c2y: Single): Pointer { instancetype };
                                        cdecl;
                                        procedure getControlPointAtIndex
                                        (idx: LongWord; values: Single); cdecl;
                                        end;

                                        TCAMediaTimingFunction = class
                                        (TOCGenericImport<
                                        CAMediaTimingFunctionClass,
                                        CAMediaTimingFunction>)
                                        end;
                                        PCAMediaTimingFunction = Pointer;

                                        CAValueFunctionClass = interface
                                        (NSObjectClass)
                                        ['{748184DF-4D70-4062-AC2D-C77A8FB9D383}']
                                        { class } function functionWithName
                                        (name: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        CAValueFunction = interface(NSObject)
                                        ['{F4736977-FCFF-4426-8B7C-8EF278E64CD2}']
                                        function name: NSString;
                                        cdecl;
                                        end;

                                        TCAValueFunction = class
                                        (TOCGenericImport<CAValueFunctionClass,
                                        CAValueFunction>)
                                        end;
                                        PCAValueFunction = Pointer;

                                        CAAnimationDelegate = interface
                                        (IObjectiveC)
                                        ['{C4F59484-C064-4AF5-BA16-0D68928C0B94}']
                                        procedure animationDidStart
                                        (anim: CAAnimation);
                                        cdecl;
                                        procedure animationDidStop
                                        (anim: CAAnimation;
                                        finished: Boolean); cdecl;
                                        end;

                                        CAPropertyAnimationClass = interface
                                        (CAAnimationClass)
                                        ['{648BFBDB-19C4-4832-B8DD-353319E2DAB9}']
                                        { class } function animationWithKeyPath
                                        (path: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        CAPropertyAnimation = interface
                                        (CAAnimation)
                                        ['{18B333E5-4DA2-459F-801C-3A5A80FC1544}']
                                        procedure setKeyPath(keyPath: NSString);
                                        cdecl;
                                        function keyPath: NSString; cdecl;
                                        procedure setAdditive
                                        (additive: Boolean); cdecl;
                                        function isAdditive: Boolean; cdecl;
                                        procedure setCumulative
                                        (cumulative: Boolean); cdecl;
                                        function isCumulative: Boolean; cdecl;
                                        procedure setValueFunction
                                        (valueFunction: CAValueFunction); cdecl;
                                        function valueFunction
                                        : CAValueFunction; cdecl;
                                        end;

                                        TCAPropertyAnimation = class
                                        (TOCGenericImport<
                                        CAPropertyAnimationClass,
                                        CAPropertyAnimation>)
                                        end;
                                        PCAPropertyAnimation = Pointer;

                                        CABasicAnimationClass = interface
                                        (CAPropertyAnimationClass)
                                        ['{C6BB30E5-94B9-46EE-8310-67FD9DBDA32E}']
                                        end;
                                        CABasicAnimation = interface
                                        (CAPropertyAnimation)
                                        ['{F48FD173-27F3-463C-B946-B8D6B2BE2B9C}']
                                        procedure setFromValue
                                        (fromValue: Pointer);
                                        cdecl;
                                        function fromValue: Pointer; cdecl;
                                        procedure setToValue
                                        (toValue: Pointer); cdecl;
                                        function toValue: Pointer; cdecl;
                                        procedure setByValue
                                        (byValue: Pointer); cdecl;
                                        function byValue: Pointer; cdecl;
                                        end;

                                        TCABasicAnimation = class
                                        (TOCGenericImport<CABasicAnimationClass,
                                        CABasicAnimation>)
                                        end;
                                        PCABasicAnimation = Pointer;

                                        CAKeyframeAnimationClass = interface
                                        (CAPropertyAnimationClass)
                                        ['{C25D4378-28A4-4930-AA54-6E043B79AF30}']
                                        end;
                                        CAKeyframeAnimation = interface
                                        (CAPropertyAnimation)
                                        ['{5E6054EB-3CA2-489C-BDE2-8E7D7F9853AF}']
                                        procedure setValues(values: NSArray);
                                        cdecl;
                                        function values: NSArray; cdecl;
                                        procedure setPath
                                        (path: CGPathRef); cdecl;
                                        function path: CGPathRef; cdecl;
                                        procedure setKeyTimes
                                        (keyTimes: NSArray); cdecl;
                                        function keyTimes: NSArray; cdecl;
                                        procedure setTimingFunctions
                                        (timingFunctions: NSArray); cdecl;
                                        function timingFunctions
                                        : NSArray; cdecl;
                                        procedure setCalculationMode
                                        (calculationMode: NSString); cdecl;
                                        function calculationMode
                                        : NSString; cdecl;
                                        procedure setTensionValues
                                        (tensionValues: NSArray); cdecl;
                                        function tensionValues: NSArray; cdecl;
                                        procedure setContinuityValues
                                        (continuityValues: NSArray); cdecl;
                                        function continuityValues
                                        : NSArray; cdecl;
                                        procedure setBiasValues
                                        (biasValues: NSArray); cdecl;
                                        function biasValues: NSArray; cdecl;
                                        procedure setRotationMode
                                        (rotationMode: NSString); cdecl;
                                        function rotationMode: NSString; cdecl;
                                        end;

                                        TCAKeyframeAnimation = class
                                        (TOCGenericImport<
                                        CAKeyframeAnimationClass,
                                        CAKeyframeAnimation>)
                                        end;
                                        PCAKeyframeAnimation = Pointer;

                                        CASpringAnimationClass = interface
                                        (CABasicAnimationClass)
                                        ['{AD6001CB-0328-44E1-9A7A-1644A6B80E3B}']
                                        end;
                                        CASpringAnimation = interface
                                        (CABasicAnimation)
                                        ['{18F5DB2A-2747-4175-AEEC-C7BA7AA2E311}']
                                        procedure setMass(mass: CGFloat);
                                        cdecl;
                                        function mass: CGFloat; cdecl;
                                        procedure setStiffness
                                        (stiffness: CGFloat); cdecl;
                                        function stiffness: CGFloat; cdecl;
                                        procedure setDamping
                                        (damping: CGFloat); cdecl;
                                        function damping: CGFloat; cdecl;
                                        procedure setInitialVelocity
                                        (initialVelocity: CGFloat); cdecl;
                                        function initialVelocity
                                        : CGFloat; cdecl;
                                        function settlingDuration
                                        : CFTimeInterval; cdecl;
                                        end;

                                        TCASpringAnimation = class
                                        (TOCGenericImport<
                                        CASpringAnimationClass,
                                        CASpringAnimation>)
                                        end;
                                        PCASpringAnimation = Pointer;

                                        CATransitionClass = interface
                                        (CAAnimationClass)
                                        ['{35DFA85F-8E59-4947-B82B-BD542A0AD230}']
                                        end;
                                        CATransition = interface(CAAnimation)
                                        ['{3155B8E6-8D65-44DA-8688-FD0A9C8A0EAA}']
                                        procedure setType(&type: NSString);
                                        cdecl;
                                        function &type: NSString; cdecl;
                                        procedure setSubtype
                                        (subtype: NSString); cdecl;
                                        function subtype: NSString; cdecl;
                                        procedure setStartProgress
                                        (startProgress: Single); cdecl;
                                        function startProgress: Single; cdecl;
                                        procedure setEndProgress
                                        (endProgress: Single); cdecl;
                                        function endProgress: Single; cdecl;
                                        procedure setFilter
                                        (filter: Pointer); cdecl;
                                        function filter: Pointer; cdecl;
                                        end;

                                        TCATransition = class
                                        (TOCGenericImport<CATransitionClass,
                                        CATransition>)
                                        end;
                                        PCATransition = Pointer;

                                        CAAnimationGroupClass = interface
                                        (CAAnimationClass)
                                        ['{D4C251A3-5022-44D9-A559-776360E60F67}']
                                        end;
                                        CAAnimationGroup = interface
                                        (CAAnimation)
                                        ['{75781435-AE7F-423E-9890-3DFF302D2412}']
                                        procedure setAnimations
                                        (animations: NSArray);
                                        cdecl;
                                        function animations: NSArray; cdecl;
                                        end;

                                        TCAAnimationGroup = class
                                        (TOCGenericImport<CAAnimationGroupClass,
                                        CAAnimationGroup>)
                                        end;
                                        PCAAnimationGroup = Pointer;

                                        CADisplayLinkClass = interface
                                        (NSObjectClass)
                                        ['{3FEBF1E8-93D1-48BD-BFC2-65B090C12D3D}']
                                        { class } function displayLinkWithTarget
                                        (target: Pointer; selector: SEL)
                                        : CADisplayLink;
                                        cdecl;
                                        end;
                                        CADisplayLink = interface(NSObject)
                                        ['{7D35AD86-2794-4764-B335-A5E0A6013544}']
                                        procedure addToRunLoop
                                        (runloop: NSRunLoop; forMode: NSString);
                                        cdecl;
                                        procedure removeFromRunLoop
                                        (runloop: NSRunLoop;
                                        forMode: NSString); cdecl;
                                        procedure invalidate; cdecl;
                                        function timestamp
                                        : CFTimeInterval; cdecl;
                                        function duration
                                        : CFTimeInterval; cdecl;
                                        procedure setPaused
                                        (paused: Boolean); cdecl;
                                        function isPaused: Boolean; cdecl;
                                        procedure setFrameInterval
                                        (frameInterval: NSInteger); cdecl;
                                        function frameInterval
                                        : NSInteger; cdecl;
                                        end;

                                        TCADisplayLink = class
                                        (TOCGenericImport<CADisplayLinkClass,
                                        CADisplayLink>)
                                        end;
                                        PCADisplayLink = Pointer;

                                        CAEAGLLayerClass = interface
                                        (CALayerClass)
                                        ['{C4788506-D21E-4128-BA69-A2976F0A1E41}']
                                        end;
                                        CAEAGLLayer = interface(CALayer)
                                        ['{6D178E35-CF17-40DC-B5FF-85F2098D7032}']
                                        procedure setPresentsWithTransaction
                                        (presentsWithTransaction: Boolean);
                                        cdecl;
                                        function presentsWithTransaction
                                        : Boolean; cdecl;
                                        end;

                                        TCAEAGLLayer = class
                                        (TOCGenericImport<CAEAGLLayerClass,
                                        CAEAGLLayer>)
                                        end;
                                        PCAEAGLLayer = Pointer;

                                        CAEmitterBehaviorClass = interface
                                        (NSObjectClass)
                                        ['{790BB8FF-0DD3-48CA-AC0F-F72357BDBA82}']
                                        { class } function behaviorTypes
                                        : NSArray;
                                        cdecl;
                                        { class } function behaviorWithType
                                        (&type: NSString)
                                        : CAEmitterBehavior; cdecl;
                                        end;
                                        CAEmitterBehavior = interface(NSObject)
                                        ['{AE70BC9D-3CC5-4BD0-A27D-B66EB7DC6E35}']
                                        function initWithType(&type: NSString)
                                        : Pointer;
                                        cdecl;
                                        function &type: NSString; cdecl;
                                        procedure setName
                                        (name: NSString); cdecl;
                                        function name: NSString; cdecl;
                                        procedure setEnabled
                                        (enabled: Boolean); cdecl;
                                        function isEnabled: Boolean; cdecl;
                                        end;

                                        TCAEmitterBehavior = class
                                        (TOCGenericImport<
                                        CAEmitterBehaviorClass,
                                        CAEmitterBehavior>)
                                        end;
                                        PCAEmitterBehavior = Pointer;

                                        CAEmitterCellClass = interface
                                        (NSObjectClass)
                                        ['{13B1716A-BE0A-46F7-8B43-9B42B7D4CC30}']
                                        { class } function emitterCell
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function defaultValueForKey
                                        (key: NSString): Pointer; cdecl;
                                        end;
                                        CAEmitterCell = interface(NSObject)
                                        ['{B1D20E18-BADD-4CEC-A98C-1423906A0D1A}']
                                        function shouldArchiveValueForKey
                                        (key: NSString): Boolean;
                                        cdecl;
                                        procedure setName
                                        (name: NSString); cdecl;
                                        function name: NSString; cdecl;
                                        procedure setEnabled
                                        (enabled: Boolean); cdecl;
                                        function isEnabled: Boolean; cdecl;
                                        procedure setBirthRate
                                        (birthRate: Single); cdecl;
                                        function birthRate: Single; cdecl;
                                        procedure setLifetime
                                        (lifetime: Single); cdecl;
                                        function lifetime: Single; cdecl;
                                        procedure setLifetimeRange
                                        (lifetimeRange: Single); cdecl;
                                        function lifetimeRange: Single; cdecl;
                                        procedure setEmissionLatitude
                                        (emissionLatitude: CGFloat); cdecl;
                                        function emissionLatitude
                                        : CGFloat; cdecl;
                                        procedure setEmissionLongitude
                                        (emissionLongitude: CGFloat); cdecl;
                                        function emissionLongitude
                                        : CGFloat; cdecl;
                                        procedure setEmissionRange
                                        (emissionRange: CGFloat); cdecl;
                                        function emissionRange: CGFloat; cdecl;
                                        procedure setVelocity
                                        (velocity: CGFloat); cdecl;
                                        function velocity: CGFloat; cdecl;
                                        procedure setVelocityRange
                                        (velocityRange: CGFloat); cdecl;
                                        function velocityRange: CGFloat; cdecl;
                                        procedure setXAcceleration
                                        (xAcceleration: CGFloat); cdecl;
                                        function xAcceleration: CGFloat; cdecl;
                                        procedure setYAcceleration
                                        (yAcceleration: CGFloat); cdecl;
                                        function yAcceleration: CGFloat; cdecl;
                                        procedure setZAcceleration
                                        (zAcceleration: CGFloat); cdecl;
                                        function zAcceleration: CGFloat; cdecl;
                                        procedure setScale
                                        (scale: CGFloat); cdecl;
                                        function scale: CGFloat; cdecl;
                                        procedure setScaleRange
                                        (scaleRange: CGFloat); cdecl;
                                        function scaleRange: CGFloat; cdecl;
                                        procedure setScaleSpeed
                                        (scaleSpeed: CGFloat); cdecl;
                                        function scaleSpeed: CGFloat; cdecl;
                                        procedure setSpin(spin: CGFloat); cdecl;
                                        function spin: CGFloat; cdecl;
                                        procedure setSpinRange
                                        (spinRange: CGFloat); cdecl;
                                        function spinRange: CGFloat; cdecl;
                                        procedure setColor
                                        (color: CGColorRef); cdecl;
                                        function color: CGColorRef; cdecl;
                                        procedure setRedRange
                                        (redRange: Single); cdecl;
                                        function redRange: Single; cdecl;
                                        procedure setGreenRange
                                        (greenRange: Single); cdecl;
                                        function greenRange: Single; cdecl;
                                        procedure setBlueRange
                                        (blueRange: Single); cdecl;
                                        function blueRange: Single; cdecl;
                                        procedure setAlphaRange
                                        (alphaRange: Single); cdecl;
                                        function alphaRange: Single; cdecl;
                                        procedure setRedSpeed
                                        (redSpeed: Single); cdecl;
                                        function redSpeed: Single; cdecl;
                                        procedure setGreenSpeed
                                        (greenSpeed: Single); cdecl;
                                        function greenSpeed: Single; cdecl;
                                        procedure setBlueSpeed
                                        (blueSpeed: Single); cdecl;
                                        function blueSpeed: Single; cdecl;
                                        procedure setAlphaSpeed
                                        (alphaSpeed: Single); cdecl;
                                        function alphaSpeed: Single; cdecl;
                                        procedure setContents
                                        (contents: Pointer); cdecl;
                                        function contents: Pointer; cdecl;
                                        procedure setContentsRect
                                        (contentsRect: CGRect); cdecl;
                                        function contentsRect: CGRect; cdecl;
                                        procedure setContentsScale
                                        (contentsScale: CGFloat); cdecl;
                                        function contentsScale: CGFloat; cdecl;
                                        procedure setMinificationFilter
                                        (minificationFilter: NSString); cdecl;
                                        function minificationFilter
                                        : NSString; cdecl;
                                        procedure setMagnificationFilter
                                        (magnificationFilter: NSString); cdecl;
                                        function magnificationFilter
                                        : NSString; cdecl;
                                        procedure setMinificationFilterBias
                                        (minificationFilterBias: Single); cdecl;
                                        function minificationFilterBias
                                        : Single; cdecl;
                                        procedure setEmitterCells
                                        (emitterCells: NSArray); cdecl;
                                        function emitterCells: NSArray; cdecl;
                                        procedure setStyle
                                        (style: NSDictionary); cdecl;
                                        function style: NSDictionary; cdecl;
                                        end;

                                        TCAEmitterCell = class
                                        (TOCGenericImport<CAEmitterCellClass,
                                        CAEmitterCell>)
                                        end;
                                        PCAEmitterCell = Pointer;

                                        CAEmitterLayerClass = interface
                                        (CALayerClass)
                                        ['{AD470AA6-673F-4677-8B68-FB53A53F87D0}']
                                        end;
                                        CAEmitterLayer = interface(CALayer)
                                        ['{BC127995-4276-4CAD-8D45-DF3A47B57765}']
                                        procedure setEmitterCells
                                        (emitterCells: NSArray);
                                        cdecl;
                                        function emitterCells: NSArray; cdecl;
                                        procedure setBirthRate
                                        (birthRate: Single); cdecl;
                                        function birthRate: Single; cdecl;
                                        procedure setLifetime
                                        (lifetime: Single); cdecl;
                                        function lifetime: Single; cdecl;
                                        procedure setEmitterPosition
                                        (emitterPosition: CGPoint); cdecl;
                                        function emitterPosition
                                        : CGPoint; cdecl;
                                        procedure setEmitterZPosition
                                        (emitterZPosition: CGFloat); cdecl;
                                        function emitterZPosition
                                        : CGFloat; cdecl;
                                        procedure setEmitterSize
                                        (emitterSize: CGSize); cdecl;
                                        function emitterSize: CGSize; cdecl;
                                        procedure setEmitterDepth
                                        (emitterDepth: CGFloat); cdecl;
                                        function emitterDepth: CGFloat; cdecl;
                                        procedure setEmitterShape
                                        (emitterShape: NSString); cdecl;
                                        function emitterShape: NSString; cdecl;
                                        procedure setEmitterMode
                                        (emitterMode: NSString); cdecl;
                                        function emitterMode: NSString; cdecl;
                                        procedure setRenderMode
                                        (renderMode: NSString); cdecl;
                                        function renderMode: NSString; cdecl;
                                        procedure setPreservesDepth
                                        (preservesDepth: Boolean); cdecl;
                                        function preservesDepth: Boolean; cdecl;
                                        procedure setVelocity
                                        (velocity: Single); cdecl;
                                        function velocity: Single; cdecl;
                                        procedure setScale
                                        (scale: Single); cdecl;
                                        function scale: Single; cdecl;
                                        procedure setSpin(spin: Single); cdecl;
                                        function spin: Single; cdecl;
                                        procedure setSeed
                                        (seed: Cardinal); cdecl;
                                        function seed: Cardinal; cdecl;
                                        end;

                                        TCAEmitterLayer = class
                                        (TOCGenericImport<CAEmitterLayerClass,
                                        CAEmitterLayer>)
                                        end;
                                        PCAEmitterLayer = Pointer;

                                        CAGradientLayerClass = interface
                                        (CALayerClass)
                                        ['{6C0E7951-537A-45A1-85E7-73935BFAE4A6}']
                                        end;
                                        CAGradientLayer = interface(CALayer)
                                        ['{A3502118-F662-408A-9143-58B8220A9062}']
                                        procedure setColors(colors: NSArray);
                                        cdecl;
                                        function colors: NSArray; cdecl;
                                        procedure setLocations
                                        (locations: NSArray); cdecl;
                                        function locations: NSArray; cdecl;
                                        procedure setStartPoint
                                        (startPoint: CGPoint); cdecl;
                                        function startPoint: CGPoint; cdecl;
                                        procedure setEndPoint
                                        (endPoint: CGPoint); cdecl;
                                        function endPoint: CGPoint; cdecl;
                                        procedure setType
                                        (&type: NSString); cdecl;
                                        function &type: NSString; cdecl;
                                        end;

                                        TCAGradientLayer = class
                                        (TOCGenericImport<CAGradientLayerClass,
                                        CAGradientLayer>)
                                        end;
                                        PCAGradientLayer = Pointer;

                                        CAMetalLayerClass = interface
                                        (CALayerClass)
                                        ['{D54F1355-526D-4215-8176-6620B280A6E3}']
                                        end;
                                        CAMetalLayer = interface(CALayer)
                                        ['{F37017AE-9D36-43BB-91CD-F1E341894EFA}']
                                        procedure setDevice(device: Pointer);
                                        cdecl;
                                        function device: Pointer; cdecl;
                                        procedure setPixelFormat
                                        (pixelFormat: MTLPixelFormat); cdecl;
                                        function pixelFormat
                                        : MTLPixelFormat; cdecl;
                                        procedure setFramebufferOnly
                                        (framebufferOnly: Boolean); cdecl;
                                        function framebufferOnly
                                        : Boolean; cdecl;
                                        procedure setDrawableSize
                                        (drawableSize: CGSize); cdecl;
                                        function drawableSize: CGSize; cdecl;
                                        function nextDrawable: Pointer; cdecl;
                                        procedure setPresentsWithTransaction
                                        (presentsWithTransaction
                                        : Boolean); cdecl;
                                        function presentsWithTransaction
                                        : Boolean; cdecl;
                                        end;

                                        TCAMetalLayer = class
                                        (TOCGenericImport<CAMetalLayerClass,
                                        CAMetalLayer>)
                                        end;
                                        PCAMetalLayer = Pointer;

                                        CAReplicatorLayerClass = interface
                                        (CALayerClass)
                                        ['{F8EAB955-F12A-40E1-921B-908FD0935332}']
                                        end;
                                        CAReplicatorLayer = interface(CALayer)
                                        ['{5DA85D83-DEA3-4E96-98E5-6031585CC09C}']
                                        procedure setInstanceCount
                                        (instanceCount: NSInteger);
                                        cdecl;
                                        function instanceCount
                                        : NSInteger; cdecl;
                                        procedure setPreservesDepth
                                        (preservesDepth: Boolean); cdecl;
                                        function preservesDepth: Boolean; cdecl;
                                        procedure setInstanceDelay
                                        (instanceDelay: CFTimeInterval); cdecl;
                                        function instanceDelay
                                        : CFTimeInterval; cdecl;
                                        procedure setInstanceTransform
                                        (instanceTransform
                                        : CATransform3D); cdecl;
                                        function instanceTransform
                                        : CATransform3D; cdecl;
                                        procedure setInstanceColor
                                        (instanceColor: CGColorRef); cdecl;
                                        function instanceColor
                                        : CGColorRef; cdecl;
                                        procedure setInstanceRedOffset
                                        (instanceRedOffset: Single); cdecl;
                                        function instanceRedOffset
                                        : Single; cdecl;
                                        procedure setInstanceGreenOffset
                                        (instanceGreenOffset: Single); cdecl;
                                        function instanceGreenOffset
                                        : Single; cdecl;
                                        procedure setInstanceBlueOffset
                                        (instanceBlueOffset: Single); cdecl;
                                        function instanceBlueOffset
                                        : Single; cdecl;
                                        procedure setInstanceAlphaOffset
                                        (instanceAlphaOffset: Single); cdecl;
                                        function instanceAlphaOffset
                                        : Single; cdecl;
                                        end;

                                        TCAReplicatorLayer = class
                                        (TOCGenericImport<
                                        CAReplicatorLayerClass,
                                        CAReplicatorLayer>)
                                        end;
                                        PCAReplicatorLayer = Pointer;

                                        CAScrollLayerClass = interface
                                        (CALayerClass)
                                        ['{435F8045-9A2B-4452-830A-54DA5C13D206}']
                                        end;
                                        CAScrollLayer = interface(CALayer)
                                        ['{B7371FEE-DBFA-46DF-B710-2E18266F7FA7}']
                                        procedure scrollToPoint(p: CGPoint);
                                        cdecl;
                                        procedure scrollToRect
                                        (r: CGRect); cdecl;
                                        procedure setScrollMode
                                        (scrollMode: NSString); cdecl;
                                        function scrollMode: NSString; cdecl;
                                        end;

                                        TCAScrollLayer = class
                                        (TOCGenericImport<CAScrollLayerClass,
                                        CAScrollLayer>)
                                        end;
                                        PCAScrollLayer = Pointer;

                                        CAShapeLayerClass = interface
                                        (CALayerClass)
                                        ['{16D1C81D-87D7-4ED9-890D-8520516C3565}']
                                        end;
                                        CAShapeLayer = interface(CALayer)
                                        ['{49888B9F-5C63-4591-8ACD-DA35C0091974}']
                                        procedure setPath(path: CGPathRef);
                                        cdecl;
                                        function path: CGPathRef; cdecl;
                                        procedure setFillColor
                                        (fillColor: CGColorRef); cdecl;
                                        function fillColor: CGColorRef; cdecl;
                                        procedure setFillRule
                                        (fillRule: NSString); cdecl;
                                        function fillRule: NSString; cdecl;
                                        procedure setStrokeColor
                                        (strokeColor: CGColorRef); cdecl;
                                        function strokeColor: CGColorRef; cdecl;
                                        procedure setStrokeStart
                                        (strokeStart: CGFloat); cdecl;
                                        function strokeStart: CGFloat; cdecl;
                                        procedure setStrokeEnd
                                        (strokeEnd: CGFloat); cdecl;
                                        function strokeEnd: CGFloat; cdecl;
                                        procedure setLineWidth
                                        (lineWidth: CGFloat); cdecl;
                                        function lineWidth: CGFloat; cdecl;
                                        procedure setMiterLimit
                                        (miterLimit: CGFloat); cdecl;
                                        function miterLimit: CGFloat; cdecl;
                                        procedure setLineCap
                                        (lineCap: NSString); cdecl;
                                        function lineCap: NSString; cdecl;
                                        procedure setLineJoin
                                        (lineJoin: NSString); cdecl;
                                        function lineJoin: NSString; cdecl;
                                        procedure setLineDashPhase
                                        (lineDashPhase: CGFloat); cdecl;
                                        function lineDashPhase: CGFloat; cdecl;
                                        procedure setLineDashPattern
                                        (lineDashPattern: NSArray); cdecl;
                                        function lineDashPattern
                                        : NSArray; cdecl;
                                        end;

                                        TCAShapeLayer = class
                                        (TOCGenericImport<CAShapeLayerClass,
                                        CAShapeLayer>)
                                        end;
                                        PCAShapeLayer = Pointer;

                                        CATextLayerClass = interface
                                        (CALayerClass)
                                        ['{26EE7F8D-369A-4624-A945-670B9CE3DDA8}']
                                        end;
                                        CATextLayer = interface(CALayer)
                                        ['{5AB59A3B-EBBB-42D4-AF86-CF892E421645}']
                                        procedure setString(&string: Pointer);
                                        cdecl;
                                        function &string: Pointer; cdecl;
                                        procedure setFont
                                        (font: CFTypeRef); cdecl;
                                        function font: CFTypeRef; cdecl;
                                        procedure setFontSize
                                        (fontSize: CGFloat); cdecl;
                                        function fontSize: CGFloat; cdecl;
                                        procedure setForegroundColor
                                        (foregroundColor: CGColorRef); cdecl;
                                        function foregroundColor
                                        : CGColorRef; cdecl;
                                        procedure setWrapped
                                        (wrapped: Boolean); cdecl;
                                        function isWrapped: Boolean; cdecl;
                                        procedure setTruncationMode
                                        (truncationMode: NSString); cdecl;
                                        function truncationMode
                                        : NSString; cdecl;
                                        procedure setAlignmentMode
                                        (alignmentMode: NSString); cdecl;
                                        function alignmentMode: NSString; cdecl;
                                        procedure setAllowsFontSubpixelQuantization
                                        (allowsFontSubpixelQuantization
                                        : Boolean); cdecl;
                                        function allowsFontSubpixelQuantization
                                        : Boolean; cdecl;
                                        end;

                                        TCATextLayer = class
                                        (TOCGenericImport<CATextLayerClass,
                                        CATextLayer>)
                                        end;
                                        PCATextLayer = Pointer;

                                        CATiledLayerClass = interface
                                        (CALayerClass)
                                        ['{2EE20412-9881-4207-A22A-BDC839D29BC7}']
                                        { class } function fadeDuration
                                        : CFTimeInterval;
                                        cdecl;
                                        end;
                                        CATiledLayer = interface(CALayer)
                                        ['{B72EB49C-F5A9-4C01-BD90-2D789358720D}']
                                        procedure setLevelsOfDetail
                                        (levelsOfDetail: LongWord);
                                        cdecl;
                                        function levelsOfDetail
                                        : LongWord; cdecl;
                                        procedure setLevelsOfDetailBias
                                        (levelsOfDetailBias: LongWord); cdecl;
                                        function levelsOfDetailBias
                                        : LongWord; cdecl;
                                        procedure setTileSize
                                        (tileSize: CGSize); cdecl;
                                        function tileSize: CGSize; cdecl;
                                        end;

                                        TCATiledLayer = class
                                        (TOCGenericImport<CATiledLayerClass,
                                        CATiledLayer>)
                                        end;
                                        PCATiledLayer = Pointer;

                                        CATransactionClass = interface
                                        (NSObjectClass)
                                        ['{3DFCB7A2-45A7-4174-A355-5FADAEDC21BC}']
                                        { class } procedure &begin;
                                        cdecl;
                                        { class } procedure commit; cdecl;
                                        { class } procedure flush; cdecl;
                                        { class } procedure lock; cdecl;
                                        { class } procedure unlock; cdecl;
                                        { class } function animationDuration
                                        : CFTimeInterval; cdecl;
                                        { class } procedure setAnimationDuration
                                        (dur: CFTimeInterval); cdecl;
                                        { class } function
                                        animationTimingFunction
                                        : CAMediaTimingFunction; cdecl;
                                        { class } procedure
                                        setAnimationTimingFunction
                                        (&function
                                        : CAMediaTimingFunction); cdecl;
                                        { class } function disableActions
                                        : Boolean; cdecl;
                                        { class } procedure setDisableActions
                                        (flag: Boolean); cdecl;
                                        { class } function completionBlock
                                        : TQuartzCoreCompletionBlock; cdecl;
                                        { class } procedure setCompletionBlock
                                        (block: TQuartzCoreCompletionBlock);
                                        cdecl;
                                        { class } function valueForKey
                                        (key: NSString): Pointer; cdecl;
                                        { class } procedure setValue
                                        (anObject: Pointer;
                                        forKey: NSString); cdecl;
                                        end;
                                        CATransaction = interface(NSObject)
                                        ['{CCE1208E-0396-4F23-8948-A4612F847F8D}']
                                        end;

                                        TCATransaction = class
                                        (TOCGenericImport<CATransactionClass,
                                        CATransaction>)
                                        end;
                                        PCATransaction = Pointer;

                                        CATransformLayerClass = interface
                                        (CALayerClass)
                                        ['{37DD358C-AE47-4D0D-8CE3-406AB7ECD1AE}']
                                        end;
                                        CATransformLayer = interface(CALayer)
                                        ['{84418D82-B80C-4519-A8FA-F4390ACF84CF}']
                                        end;

                                        TCATransformLayer = class
                                        (TOCGenericImport<CATransformLayerClass,
                                        CATransformLayer>)
                                        end;
                                        PCATransformLayer = Pointer;

                                        // ===== Protocol declarations =====

                                        CAMediaTiming = interface(IObjectiveC)
                                        ['{53298718-D15B-426E-9DE9-280EE69FD86A}']
                                        procedure setBeginTime
                                        (beginTime: CFTimeInterval);
                                        cdecl;
                                        function beginTime
                                        : CFTimeInterval; cdecl;
                                        procedure setDuration
                                        (duration: CFTimeInterval); cdecl;
                                        function duration
                                        : CFTimeInterval; cdecl;
                                        procedure setSpeed
                                        (speed: Single); cdecl;
                                        function speed: Single; cdecl;
                                        procedure setTimeOffset
                                        (timeOffset: CFTimeInterval); cdecl;
                                        function timeOffset
                                        : CFTimeInterval; cdecl;
                                        procedure setRepeatCount
                                        (repeatCount: Single); cdecl;
                                        function repeatCount: Single; cdecl;
                                        procedure setRepeatDuration
                                        (repeatDuration: CFTimeInterval); cdecl;
                                        function repeatDuration
                                        : CFTimeInterval; cdecl;
                                        procedure setAutoreverses
                                        (autoreverses: Boolean); cdecl;
                                        function autoreverses: Boolean; cdecl;
                                        procedure setFillMode
                                        (fillMode: NSString); cdecl;
                                        function fillMode: NSString; cdecl;
                                        end;

                                        CAAction = interface(IObjectiveC)
                                        ['{C92FA1F4-EB2D-4129-ABC5-966B2F2D4B35}']
                                        procedure runActionForKey
                                        (event: NSString; &object: Pointer;
                                        arguments: NSDictionary);
                                        cdecl;
                                        end;

                                        MTLDevice = interface(IObjectiveC)
                                        ['{A4F1DC0C-FFC6-4DFF-8DDE-9C52DC6B4CFF}']
                                        end;

                                        MTLTexture = interface(IObjectiveC)
                                        ['{40CA9F6E-BEEB-412F-85D1-8ABA6DAF7CA3}']
                                        end;

                                        CAMetalDrawable = interface(IObjectiveC)
                                        ['{F5A9C4C7-9137-406D-BBC7-BDB8255B5711}']
                                        function texture: Pointer;
                                        cdecl;
                                        function layer: CAMetalLayer; cdecl;
                                        end;

                                        // ===== Exported string consts =====

                                        function kCAFillModeForwards: NSString;
                                        function kCAFillModeBackwards: NSString;
                                        function kCAFillModeBoth: NSString;
                                        function kCAFillModeRemoved: NSString;
                                        function CATransform3DIdentity: Pointer;
                                        function kCAGravityCenter: NSString;
                                        function kCAGravityTop: NSString;
                                        function kCAGravityBottom: NSString;
                                        function kCAGravityLeft: NSString;
                                        function kCAGravityRight: NSString;
                                        function kCAGravityTopLeft: NSString;
                                        function kCAGravityTopRight: NSString;
                                        function kCAGravityBottomLeft: NSString;
                                        function kCAGravityBottomRight
                                        : NSString;
                                        function kCAGravityResize: NSString;
                                        function kCAGravityResizeAspect
                                        : NSString;
                                        function kCAGravityResizeAspectFill
                                        : NSString;
                                        function kCAFilterNearest: NSString;
                                        function kCAFilterLinear: NSString;
                                        function kCAFilterTrilinear: NSString;
                                        function kCAOnOrderIn: NSString;
                                        function kCAOnOrderOut: NSString;
                                        function kCATransition: NSString;
                                        function kCAAnimationLinear: NSString;
                                        function kCAAnimationDiscrete: NSString;
                                        function kCAAnimationPaced: NSString;
                                        function kCAAnimationCubic: NSString;
                                        function kCAAnimationCubicPaced
                                        : NSString;
                                        function kCAAnimationRotateAuto
                                        : NSString;
                                        function kCAAnimationRotateAutoReverse
                                        : NSString;
                                        function kCATransitionFade: NSString;
                                        function kCATransitionMoveIn: NSString;
                                        function kCATransitionPush: NSString;
                                        function kCATransitionReveal: NSString;
                                        function kCATransitionFromRight
                                        : NSString;
                                        function kCATransitionFromLeft
                                        : NSString;
                                        function kCATransitionFromTop: NSString;
                                        function kCATransitionFromBottom
                                        : NSString;
                                        function kCAEmitterBehaviorWave
                                        : NSString;
                                        function kCAEmitterBehaviorDrag
                                        : NSString;
                                        function kCAEmitterBehaviorAlignToMotion
                                        : NSString;
                                        function kCAEmitterBehaviorValueOverLife
                                        : NSString;
                                        function kCAEmitterBehaviorColorOverLife
                                        : NSString;
                                        function kCAEmitterBehaviorLight
                                        : NSString;
                                        function kCAEmitterBehaviorAttractor
                                        : NSString;
                                        function kCAEmitterLayerPoint: NSString;
                                        function kCAEmitterLayerLine: NSString;
                                        function kCAEmitterLayerRectangle
                                        : NSString;
                                        function kCAEmitterLayerCuboid
                                        : NSString;
                                        function kCAEmitterLayerCircle
                                        : NSString;
                                        function kCAEmitterLayerSphere
                                        : NSString;
                                        function kCAEmitterLayerPoints
                                        : NSString;
                                        function kCAEmitterLayerOutline
                                        : NSString;
                                        function kCAEmitterLayerSurface
                                        : NSString;
                                        function kCAEmitterLayerVolume
                                        : NSString;
                                        function kCAEmitterLayerUnordered
                                        : NSString;
                                        function kCAEmitterLayerOldestFirst
                                        : NSString;
                                        function kCAEmitterLayerOldestLast
                                        : NSString;
                                        function kCAEmitterLayerBackToFront
                                        : NSString;
                                        function kCAEmitterLayerAdditive
                                        : NSString;
                                        function kCAGradientLayerAxial
                                        : NSString;
                                        function kCAMediaTimingFunctionLinear
                                        : NSString;
                                        function kCAMediaTimingFunctionEaseIn
                                        : NSString;
                                        function kCAMediaTimingFunctionEaseOut
                                        : NSString;
                                        function kCAMediaTimingFunctionEaseInEaseOut
                                        : NSString;
                                        function kCAMediaTimingFunctionDefault
                                        : NSString;
                                        function kCAScrollNone: NSString;
                                        function kCAScrollVertically: NSString;
                                        function kCAScrollHorizontally
                                        : NSString;
                                        function kCAScrollBoth: NSString;
                                        function kCAFillRuleNonZero: NSString;
                                        function kCAFillRuleEvenOdd: NSString;
                                        function kCALineJoinMiter: NSString;
                                        function kCALineJoinRound: NSString;
                                        function kCALineJoinBevel: NSString;
                                        function kCALineCapButt: NSString;
                                        function kCALineCapRound: NSString;
                                        function kCALineCapSquare: NSString;
                                        function kCATruncationNone: NSString;
                                        function kCATruncationStart: NSString;
                                        function kCATruncationEnd: NSString;
                                        function kCATruncationMiddle: NSString;
                                        function kCAAlignmentNatural: NSString;
                                        function kCAAlignmentLeft: NSString;
                                        function kCAAlignmentRight: NSString;
                                        function kCAAlignmentCenter: NSString;
                                        function kCAAlignmentJustified
                                        : NSString;
                                        function kCATransactionAnimationDuration
                                        : NSString;
                                        function kCATransactionDisableActions
                                        : NSString;
                                        function kCATransactionAnimationTimingFunction
                                        : NSString;
                                        function kCATransactionCompletionBlock
                                        : NSString;
                                        function kCAValueFunctionRotateX
                                        : NSString;
                                        function kCAValueFunctionRotateY
                                        : NSString;
                                        function kCAValueFunctionRotateZ
                                        : NSString;
                                        function kCAValueFunctionScale
                                        : NSString;
                                        function kCAValueFunctionScaleX
                                        : NSString;
                                        function kCAValueFunctionScaleY
                                        : NSString;
                                        function kCAValueFunctionScaleZ
                                        : NSString;
                                        function kCAValueFunctionTranslate
                                        : NSString;
                                        function kCAValueFunctionTranslateX
                                        : NSString;
                                        function kCAValueFunctionTranslateY
                                        : NSString;
                                        function kCAValueFunctionTranslateZ
                                        : NSString;


                                        // ===== External functions =====

                                        const
                                        libQuartzCore =
                                        '/System/Library/Frameworks/QuartzCore.framework/QuartzCore';
                                        function CACurrentMediaTime
                                        : CFTimeInterval; cdecl;
                                        external libQuartzCore name _PU +
                                        'CACurrentMediaTime';
                                        function CATransform3DIsIdentity
                                        (t: CATransform3D): Integer; cdecl;
                                        external libQuartzCore name _PU +
                                        'CATransform3DIsIdentity';
                                        function CATransform3DEqualToTransform
                                        (a: CATransform3D; b: CATransform3D)
                                        : Integer; cdecl;
                                        external libQuartzCore name _PU +
                                        'CATransform3DEqualToTransform';
                                        function CATransform3DMakeTranslation
                                        (tx: CGFloat; ty: CGFloat; tz: CGFloat)
                                        : CATransform3D; cdecl;
                                        external libQuartzCore name _PU +
                                        'CATransform3DMakeTranslation';
                                        function CATransform3DMakeScale
                                        (sx: CGFloat; sy: CGFloat; sz: CGFloat)
                                        : CATransform3D; cdecl;
                                        external libQuartzCore name _PU +
                                        'CATransform3DMakeScale';
                                        function CATransform3DMakeRotation
                                        (angle: CGFloat; x: CGFloat; y: CGFloat;
                                        z: CGFloat): CATransform3D; cdecl;
                                        external libQuartzCore name _PU +
                                        'CATransform3DMakeRotation';
                                        function CATransform3DTranslate
                                        (t: CATransform3D; tx: CGFloat;
                                        ty: CGFloat; tz: CGFloat)
                                        : CATransform3D; cdecl;
                                        external libQuartzCore name _PU +
                                        'CATransform3DTranslate';
                                        function CATransform3DScale
                                        (t: CATransform3D; sx: CGFloat;
                                        sy: CGFloat; sz: CGFloat)
                                        : CATransform3D; cdecl;
                                        external libQuartzCore name _PU +
                                        'CATransform3DScale';
                                        function CATransform3DRotate
                                        (t: CATransform3D; angle: CGFloat;
                                        x: CGFloat; y: CGFloat; z: CGFloat)
                                        : CATransform3D; cdecl;
                                        external libQuartzCore name _PU +
                                        'CATransform3DRotate';
                                        function CATransform3DConcat
                                        (a: CATransform3D; b: CATransform3D)
                                        : CATransform3D; cdecl;
                                        external libQuartzCore name _PU +
                                        'CATransform3DConcat';
                                        function CATransform3DInvert
                                        (t: CATransform3D): CATransform3D;
                                        cdecl; external libQuartzCore name _PU +
                                        'CATransform3DInvert';
                                        function CATransform3DMakeAffineTransform
                                        (m: CGAffineTransform): CATransform3D;
                                        cdecl; external libQuartzCore name _PU +
                                        'CATransform3DMakeAffineTransform';
                                        function CATransform3DIsAffine
                                        (t: CATransform3D): Integer; cdecl;
                                        external libQuartzCore name _PU +
                                        'CATransform3DIsAffine';
                                        function CATransform3DGetAffineTransform
                                        (t: CATransform3D): CGAffineTransform;
                                        cdecl; external libQuartzCore name _PU +
                                        'CATransform3DGetAffineTransform';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  QuartzCoreModule: THandle;

{$ENDIF IOS}

function kCAFillModeForwards: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAFillModeForwards');
end;

function kCAFillModeBackwards: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAFillModeBackwards');
end;

function kCAFillModeBoth: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAFillModeBoth');
end;

function kCAFillModeRemoved: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAFillModeRemoved');
end;

function kCAGravityCenter: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAGravityCenter');
end;

function kCAGravityTop: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAGravityTop');
end;

function kCAGravityBottom: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAGravityBottom');
end;

function kCAGravityLeft: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAGravityLeft');
end;

function kCAGravityRight: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAGravityRight');
end;

function kCAGravityTopLeft: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAGravityTopLeft');
end;

function kCAGravityTopRight: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAGravityTopRight');
end;

function kCAGravityBottomLeft: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAGravityBottomLeft');
end;

function kCAGravityBottomRight: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAGravityBottomRight');
end;

function kCAGravityResize: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAGravityResize');
end;

function kCAGravityResizeAspect: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAGravityResizeAspect');
end;

function kCAGravityResizeAspectFill: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAGravityResizeAspectFill');
end;

function kCAFilterNearest: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAFilterNearest');
end;

function kCAFilterLinear: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAFilterLinear');
end;

function kCAFilterTrilinear: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAFilterTrilinear');
end;

function kCAOnOrderIn: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAOnOrderIn');
end;

function kCAOnOrderOut: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAOnOrderOut');
end;

function kCATransition: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATransition');
end;

function kCAAnimationLinear: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAAnimationLinear');
end;

function kCAAnimationDiscrete: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAAnimationDiscrete');
end;

function kCAAnimationPaced: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAAnimationPaced');
end;

function kCAAnimationCubic: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAAnimationCubic');
end;

function kCAAnimationCubicPaced: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAAnimationCubicPaced');
end;

function kCAAnimationRotateAuto: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAAnimationRotateAuto');
end;

function kCAAnimationRotateAutoReverse: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAAnimationRotateAutoReverse');
end;

function kCATransitionFade: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATransitionFade');
end;

function kCATransitionMoveIn: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATransitionMoveIn');
end;

function kCATransitionPush: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATransitionPush');
end;

function kCATransitionReveal: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATransitionReveal');
end;

function kCATransitionFromRight: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATransitionFromRight');
end;

function kCATransitionFromLeft: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATransitionFromLeft');
end;

function kCATransitionFromTop: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATransitionFromTop');
end;

function kCATransitionFromBottom: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATransitionFromBottom');
end;

function kCAEmitterBehaviorWave: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterBehaviorWave');
end;

function kCAEmitterBehaviorDrag: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterBehaviorDrag');
end;

function kCAEmitterBehaviorAlignToMotion: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore,
    'kCAEmitterBehaviorAlignToMotion');
end;

function kCAEmitterBehaviorValueOverLife: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore,
    'kCAEmitterBehaviorValueOverLife');
end;

function kCAEmitterBehaviorColorOverLife: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore,
    'kCAEmitterBehaviorColorOverLife');
end;

function kCAEmitterBehaviorLight: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterBehaviorLight');
end;

function kCAEmitterBehaviorAttractor: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterBehaviorAttractor');
end;

function kCAEmitterLayerPoint: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerPoint');
end;

function kCAEmitterLayerLine: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerLine');
end;

function kCAEmitterLayerRectangle: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerRectangle');
end;

function kCAEmitterLayerCuboid: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerCuboid');
end;

function kCAEmitterLayerCircle: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerCircle');
end;

function kCAEmitterLayerSphere: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerSphere');
end;

function kCAEmitterLayerPoints: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerPoints');
end;

function kCAEmitterLayerOutline: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerOutline');
end;

function kCAEmitterLayerSurface: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerSurface');
end;

function kCAEmitterLayerVolume: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerVolume');
end;

function kCAEmitterLayerUnordered: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerUnordered');
end;

function kCAEmitterLayerOldestFirst: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerOldestFirst');
end;

function kCAEmitterLayerOldestLast: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerOldestLast');
end;

function kCAEmitterLayerBackToFront: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerBackToFront');
end;

function kCAEmitterLayerAdditive: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAEmitterLayerAdditive');
end;

function kCAGradientLayerAxial: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAGradientLayerAxial');
end;

function kCAMediaTimingFunctionLinear: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAMediaTimingFunctionLinear');
end;

function kCAMediaTimingFunctionEaseIn: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAMediaTimingFunctionEaseIn');
end;

function kCAMediaTimingFunctionEaseOut: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAMediaTimingFunctionEaseOut');
end;

function kCAMediaTimingFunctionEaseInEaseOut: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore,
    'kCAMediaTimingFunctionEaseInEaseOut');
end;

function kCAMediaTimingFunctionDefault: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAMediaTimingFunctionDefault');
end;

function kCAScrollNone: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAScrollNone');
end;

function kCAScrollVertically: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAScrollVertically');
end;

function kCAScrollHorizontally: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAScrollHorizontally');
end;

function kCAScrollBoth: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAScrollBoth');
end;

function kCAFillRuleNonZero: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAFillRuleNonZero');
end;

function kCAFillRuleEvenOdd: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAFillRuleEvenOdd');
end;

function kCALineJoinMiter: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCALineJoinMiter');
end;

function kCALineJoinRound: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCALineJoinRound');
end;

function kCALineJoinBevel: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCALineJoinBevel');
end;

function kCALineCapButt: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCALineCapButt');
end;

function kCALineCapRound: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCALineCapRound');
end;

function kCALineCapSquare: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCALineCapSquare');
end;

function kCATruncationNone: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATruncationNone');
end;

function kCATruncationStart: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATruncationStart');
end;

function kCATruncationEnd: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATruncationEnd');
end;

function kCATruncationMiddle: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATruncationMiddle');
end;

function kCAAlignmentNatural: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAAlignmentNatural');
end;

function kCAAlignmentLeft: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAAlignmentLeft');
end;

function kCAAlignmentRight: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAAlignmentRight');
end;

function kCAAlignmentCenter: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAAlignmentCenter');
end;

function kCAAlignmentJustified: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAAlignmentJustified');
end;

function kCATransactionAnimationDuration: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore,
    'kCATransactionAnimationDuration');
end;

function kCATransactionDisableActions: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATransactionDisableActions');
end;

function kCATransactionAnimationTimingFunction: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore,
    'kCATransactionAnimationTimingFunction');
end;

function kCATransactionCompletionBlock: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCATransactionCompletionBlock');
end;

function kCAValueFunctionRotateX: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAValueFunctionRotateX');
end;

function kCAValueFunctionRotateY: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAValueFunctionRotateY');
end;

function kCAValueFunctionRotateZ: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAValueFunctionRotateZ');
end;

function kCAValueFunctionScale: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAValueFunctionScale');
end;

function kCAValueFunctionScaleX: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAValueFunctionScaleX');
end;

function kCAValueFunctionScaleY: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAValueFunctionScaleY');
end;

function kCAValueFunctionScaleZ: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAValueFunctionScaleZ');
end;

function kCAValueFunctionTranslate: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAValueFunctionTranslate');
end;

function kCAValueFunctionTranslateX: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAValueFunctionTranslateX');
end;

function kCAValueFunctionTranslateY: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAValueFunctionTranslateY');
end;

function kCAValueFunctionTranslateZ: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCAValueFunctionTranslateZ');
end;

function CATransform3DIdentity: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'CATransform3DIdentity');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

QuartzCoreModule := dlopen(MarshaledAString(libQuartzCore), RTLD_LAZY);

finalization

dlclose(QuartzCoreModule);
{$ENDIF IOS}

end.
