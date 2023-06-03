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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.CoreVideo,
  iOSapi.Foundation,
  iOSapi.Metal;

const
  kCALayerLeftEdge = 1 shl 0;
  kCALayerRightEdge = 1 shl 1;
  kCALayerBottomEdge = 1 shl 2;
  kCALayerTopEdge = 1 shl 3;
  kCALayerMinXMinYCorner = 1 shl 0;
  kCALayerMaxXMinYCorner = 1 shl 1;
  kCALayerMinXMaxYCorner = 1 shl 2;
  kCALayerMaxXMaxYCorner = 1 shl 3;

type

  // ===== Forward declarations =====
{$M+}
  CAMediaTiming = interface;
  CATransform3DAdditions = interface;
  CAAnimation = interface;
  CAAction = interface;
  CALayerDelegate = interface;
  CALayer = interface;
  CAActionAdditions = interface;
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
  CAEDRMetadata = interface;
  CAEmitterCell = interface;
  CAEmitterLayer = interface;
  CAGradientLayer = interface;
  MTLDevice = interface;
  MTLTexture = interface;
  CAMetalLayer = interface;
  CAMetalDrawable = interface;
  CARenderer = interface;
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
  PCFTimeInterval = ^CFTimeInterval;

  CAMediaTimingFillMode = NSString;
  PCAMediaTimingFillMode = ^CAMediaTimingFillMode;
  CGFloat = Single;
  PCGFloat = ^CGFloat;

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

  CGAffineTransform = record
    a: CGFloat;
    b: CGFloat;
    c: CGFloat;
    d: CGFloat;
    tx: CGFloat;
    ty: CGFloat;
  end;

  PCGAffineTransform = ^CGAffineTransform;

  CALayerContentsGravity = NSString;
  PCALayerContentsGravity = ^CALayerContentsGravity;
  CALayerContentsFormat = NSString;
  PCALayerContentsFormat = ^CALayerContentsFormat;
  CALayerContentsFilter = NSString;
  PCALayerContentsFilter = ^CALayerContentsFilter;
  CALayerCornerCurve = NSString;
  PCALayerCornerCurve = ^CALayerCornerCurve;
  CAEdgeAntialiasingMask = Cardinal;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  CACornerMask = NSUInteger;

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

  CGContextRef = Pointer;
  PCGContextRef = ^CGContextRef;
  CGColorRef = Pointer;
  PCGColorRef = ^CGColorRef;
  CGPathRef = Pointer;
  PCGPathRef = ^CGPathRef;

  CAFrameRateRange = record
    minimum: Single;
    maximum: Single;
    preferred: Single;
  end;

  PCAFrameRateRange = ^CAFrameRateRange;

  CAAnimationCalculationMode = NSString;
  PCAAnimationCalculationMode = ^CAAnimationCalculationMode;
  CAAnimationRotationMode = NSString;
  PCAAnimationRotationMode = ^CAAnimationRotationMode;
  CATransitionType = NSString;
  PCATransitionType = ^CATransitionType;
  CATransitionSubtype = NSString;
  PCATransitionSubtype = ^CATransitionSubtype;
  SEL = SEL *;
  PSEL = ^SEL;
  NSRunLoopMode = NSString;
  PNSRunLoopMode = ^NSRunLoopMode;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  CAEmitterLayerEmitterShape = NSString;
  PCAEmitterLayerEmitterShape = ^CAEmitterLayerEmitterShape;
  CAEmitterLayerEmitterMode = NSString;
  PCAEmitterLayerEmitterMode = ^CAEmitterLayerEmitterMode;
  CAEmitterLayerRenderMode = NSString;
  PCAEmitterLayerRenderMode = ^CAEmitterLayerRenderMode;
  CAMediaTimingFunctionName = NSString;
  PCAMediaTimingFunctionName = ^CAMediaTimingFunctionName;
  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  CAGradientLayerType = NSString;
  PCAGradientLayerType = ^CAGradientLayerType;
  MTLPixelFormat = NSUInteger;
  CGColorSpaceRef = Pointer;
  PCGColorSpaceRef = ^CGColorSpaceRef;
  CAScrollLayerScrollMode = NSString;
  PCAScrollLayerScrollMode = ^CAScrollLayerScrollMode;
  CAShapeLayerFillRule = NSString;
  PCAShapeLayerFillRule = ^CAShapeLayerFillRule;
  CAShapeLayerLineJoin = NSString;
  PCAShapeLayerLineJoin = ^CAShapeLayerLineJoin;
  CAShapeLayerLineCap = NSString;
  PCAShapeLayerLineCap = ^CAShapeLayerLineCap;
  CATextLayerTruncationMode = NSString;
  PCATextLayerTruncationMode = ^CATextLayerTruncationMode;
  CATextLayerAlignmentMode = NSString;
  PCATextLayerAlignmentMode = ^CATextLayerAlignmentMode;
  CFTypeRef = Pointer;
  PCFTypeRef = ^CFTypeRef;
  TQuartzCoreCompletionBlock = procedure() of object;
  CAValueFunctionName = NSString;
  PCAValueFunctionName = ^CAValueFunctionName;
  // ===== Interface declarations =====

  CATransform3DAdditions = interface(IObjectiveC)
    ['{E3CC6EC6-C3B2-4141-84B5-8CB1EB1A339C}']
    function valueWithCATransform3D(t: CATransform3D): NSValue; cdecl;
    function CATransform3DValue: CATransform3D; cdecl;
  end;

  CAAnimationClass = interface(NSObjectClass)
    ['{793824FA-A374-4F2A-A419-093982E532B5}']
    { class } function animation: Pointer { instancetype }; cdecl;
    { class } function defaultValueForKey(key: NSString): Pointer; cdecl;
  end;

  CAAnimation = interface(NSObject)
    ['{23AF9A23-6386-44CE-9AFC-FD9B25E606A4}']
    function shouldArchiveValueForKey(key: NSString): Boolean; cdecl;
    procedure setTimingFunction(timingFunction: CAMediaTimingFunction); cdecl;
    function timingFunction: CAMediaTimingFunction; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setRemovedOnCompletion(removedOnCompletion: Boolean); cdecl;
    function isRemovedOnCompletion: Boolean; cdecl;
    procedure setPreferredFrameRateRange(preferredFrameRateRange
      : CAFrameRateRange); cdecl;
    function preferredFrameRateRange: CAFrameRateRange; cdecl;
  end;

  TCAAnimation = class(TOCGenericImport<CAAnimationClass, CAAnimation>)
  end;

  PCAAnimation = Pointer;

  CALayerClass = interface(NSObjectClass)
    ['{35AC1642-227C-4167-A49F-7B7B09CB5A92}']
    { class } function layer: Pointer { instancetype }; cdecl;
    { class } function defaultValueForKey(key: NSString): Pointer; cdecl;
    { class } function needsDisplayForKey(key: NSString): Boolean; cdecl;
    { class } function cornerCurveExpansionFactor(curve: CALayerCornerCurve)
      : CGFloat; cdecl;
    { class } function defaultActionForKey(event: NSString): Pointer; cdecl;
  end;

  CALayer = interface(NSObject)
    ['{50F26775-2B0F-4826-B859-96A8E0DA4BDB}']
    function init: Pointer { instancetype }; cdecl;
    function initWithLayer(layer: Pointer): Pointer { instancetype }; cdecl;
    function presentationLayer: Pointer { instancetype }; cdecl;
    function modelLayer: Pointer { instancetype }; cdecl;
    function shouldArchiveValueForKey(key: NSString): Boolean; cdecl;
    procedure setBounds(bounds: CGRect); cdecl;
    function bounds: CGRect; cdecl;
    procedure setPosition(position: CGPoint); cdecl;
    function position: CGPoint; cdecl;
    procedure setZPosition(zPosition: CGFloat); cdecl;
    function zPosition: CGFloat; cdecl;
    procedure setAnchorPoint(anchorPoint: CGPoint); cdecl;
    function anchorPoint: CGPoint; cdecl;
    procedure setAnchorPointZ(anchorPointZ: CGFloat); cdecl;
    function anchorPointZ: CGFloat; cdecl;
    procedure setTransform(transform: CATransform3D); cdecl;
    function transform: CATransform3D; cdecl;
    function affineTransform: CGAffineTransform; cdecl;
    procedure setAffineTransform(m: CGAffineTransform); cdecl;
    procedure setFrame(frame: CGRect); cdecl;
    function frame: CGRect; cdecl;
    procedure setHidden(hidden: Boolean); cdecl;
    function isHidden: Boolean; cdecl;
    procedure setDoubleSided(doubleSided: Boolean); cdecl;
    function isDoubleSided: Boolean; cdecl;
    procedure setGeometryFlipped(geometryFlipped: Boolean); cdecl;
    function isGeometryFlipped: Boolean; cdecl;
    function contentsAreFlipped: Boolean; cdecl;
    function superlayer: CALayer; cdecl;
    procedure removeFromSuperlayer; cdecl;
    procedure setSublayers(sublayers: NSArray); cdecl;
    function sublayers: NSArray; cdecl;
    procedure addSublayer(layer: CALayer); cdecl;
    [MethodName('insertSublayer:atIndex:')]
    procedure insertSublayerAtIndex(layer: CALayer; atIndex: Cardinal); cdecl;
    [MethodName('insertSublayer:below:')]
    procedure insertSublayerBelow(layer: CALayer; below: CALayer); cdecl;
    [MethodName('insertSublayer:above:')]
    procedure insertSublayerAbove(layer: CALayer; above: CALayer); cdecl;
    procedure replaceSublayer(oldLayer: CALayer; &with: CALayer); cdecl;
    procedure setSublayerTransform(sublayerTransform: CATransform3D); cdecl;
    function sublayerTransform: CATransform3D; cdecl;
    procedure setMask(mask: CALayer); cdecl;
    function mask: CALayer; cdecl;
    procedure setMasksToBounds(masksToBounds: Boolean); cdecl;
    function masksToBounds: Boolean; cdecl;
    [MethodName('convertPoint:fromLayer:')]
    function convertPointFromLayer(p: CGPoint; fromLayer: CALayer)
      : CGPoint; cdecl;
    [MethodName('convertPoint:toLayer:')]
    function convertPointToLayer(p: CGPoint; toLayer: CALayer): CGPoint; cdecl;
    [MethodName('convertRect:fromLayer:')]
    function convertRectFromLayer(r: CGRect; fromLayer: CALayer): CGRect; cdecl;
    [MethodName('convertRect:toLayer:')]
    function convertRectToLayer(r: CGRect; toLayer: CALayer): CGRect; cdecl;
    [MethodName('convertTime:fromLayer:')]
    function convertTimeFromLayer(t: CFTimeInterval; fromLayer: CALayer)
      : CFTimeInterval; cdecl;
    [MethodName('convertTime:toLayer:')]
    function convertTimeToLayer(t: CFTimeInterval; toLayer: CALayer)
      : CFTimeInterval; cdecl;
    function hitTest(p: CGPoint): CALayer; cdecl;
    function containsPoint(p: CGPoint): Boolean; cdecl;
    procedure setContents(contents: Pointer); cdecl;
    function contents: Pointer; cdecl;
    procedure setContentsRect(contentsRect: CGRect); cdecl;
    function contentsRect: CGRect; cdecl;
    procedure setContentsGravity(contentsGravity
      : CALayerContentsGravity); cdecl;
    function contentsGravity: CALayerContentsGravity; cdecl;
    procedure setContentsScale(contentsScale: CGFloat); cdecl;
    function contentsScale: CGFloat; cdecl;
    procedure setContentsCenter(contentsCenter: CGRect); cdecl;
    function contentsCenter: CGRect; cdecl;
    procedure setContentsFormat(contentsFormat: CALayerContentsFormat); cdecl;
    function contentsFormat: CALayerContentsFormat; cdecl;
    procedure setMinificationFilter(minificationFilter
      : CALayerContentsFilter); cdecl;
    function minificationFilter: CALayerContentsFilter; cdecl;
    procedure setMagnificationFilter(magnificationFilter
      : CALayerContentsFilter); cdecl;
    function magnificationFilter: CALayerContentsFilter; cdecl;
    procedure setMinificationFilterBias(minificationFilterBias: Single); cdecl;
    function minificationFilterBias: Single; cdecl;
    procedure setOpaque(opaque: Boolean); cdecl;
    function isOpaque: Boolean; cdecl;
    procedure display; cdecl;
    procedure setNeedsDisplay; cdecl;
    procedure setNeedsDisplayInRect(r: CGRect); cdecl;
    function needsDisplay: Boolean; cdecl;
    procedure displayIfNeeded; cdecl;
    procedure setNeedsDisplayOnBoundsChange(needsDisplayOnBoundsChange
      : Boolean); cdecl;
    function needsDisplayOnBoundsChange: Boolean; cdecl;
    procedure setDrawsAsynchronously(drawsAsynchronously: Boolean); cdecl;
    function drawsAsynchronously: Boolean; cdecl;
    procedure drawInContext(ctx: CGContextRef); cdecl;
    procedure renderInContext(ctx: CGContextRef); cdecl;
    procedure setEdgeAntialiasingMask(edgeAntialiasingMask
      : CAEdgeAntialiasingMask); cdecl;
    function edgeAntialiasingMask: CAEdgeAntialiasingMask; cdecl;
    procedure setAllowsEdgeAntialiasing(allowsEdgeAntialiasing: Boolean); cdecl;
    function allowsEdgeAntialiasing: Boolean; cdecl;
    procedure setBackgroundColor(backgroundColor: CGColorRef); cdecl;
    function backgroundColor: CGColorRef; cdecl;
    procedure setCornerRadius(cornerRadius: CGFloat); cdecl;
    function cornerRadius: CGFloat; cdecl;
    procedure setMaskedCorners(maskedCorners: CACornerMask); cdecl;
    function maskedCorners: CACornerMask; cdecl;
    procedure setCornerCurve(cornerCurve: CALayerCornerCurve); cdecl;
    function cornerCurve: CALayerCornerCurve; cdecl;
    procedure setBorderWidth(borderWidth: CGFloat); cdecl;
    function borderWidth: CGFloat; cdecl;
    procedure setBorderColor(borderColor: CGColorRef); cdecl;
    function borderColor: CGColorRef; cdecl;
    procedure setOpacity(opacity: Single); cdecl;
    function opacity: Single; cdecl;
    procedure setAllowsGroupOpacity(allowsGroupOpacity: Boolean); cdecl;
    function allowsGroupOpacity: Boolean; cdecl;
    procedure setCompositingFilter(compositingFilter: Pointer); cdecl;
    function compositingFilter: Pointer; cdecl;
    procedure setFilters(filters: NSArray); cdecl;
    function filters: NSArray; cdecl;
    procedure setBackgroundFilters(backgroundFilters: NSArray); cdecl;
    function backgroundFilters: NSArray; cdecl;
    procedure setShouldRasterize(shouldRasterize: Boolean); cdecl;
    function shouldRasterize: Boolean; cdecl;
    procedure setRasterizationScale(rasterizationScale: CGFloat); cdecl;
    function rasterizationScale: CGFloat; cdecl;
    procedure setShadowColor(shadowColor: CGColorRef); cdecl;
    function shadowColor: CGColorRef; cdecl;
    procedure setShadowOpacity(shadowOpacity: Single); cdecl;
    function shadowOpacity: Single; cdecl;
    procedure setShadowOffset(shadowOffset: CGSize); cdecl;
    function shadowOffset: CGSize; cdecl;
    procedure setShadowRadius(shadowRadius: CGFloat); cdecl;
    function shadowRadius: CGFloat; cdecl;
    procedure setShadowPath(shadowPath: CGPathRef); cdecl;
    function shadowPath: CGPathRef; cdecl;
    function preferredFrameSize: CGSize; cdecl;
    procedure setNeedsLayout; cdecl;
    function needsLayout: Boolean; cdecl;
    procedure layoutIfNeeded; cdecl;
    procedure layoutSublayers; cdecl;
    function actionForKey(event: NSString): Pointer; cdecl;
    procedure setActions(actions: NSDictionary); cdecl;
    function actions: NSDictionary; cdecl;
    procedure addAnimation(anim: CAAnimation; forKey: NSString); cdecl;
    procedure removeAllAnimations; cdecl;
    procedure removeAnimationForKey(key: NSString); cdecl;
    function animationKeys: NSArray; cdecl;
    function animationForKey(key: NSString): CAAnimation; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setStyle(style: NSDictionary); cdecl;
    function style: NSDictionary; cdecl;
    procedure scrollPoint(p: CGPoint); cdecl;
    procedure scrollRectToVisible(r: CGRect); cdecl;
    function visibleRect: CGRect; cdecl;
  end;

  TCALayer = class(TOCGenericImport<CALayerClass, CALayer>)
  end;

  PCALayer = Pointer;

  CAActionAdditions = interface(IObjectiveC)
    ['{F7461114-B4A9-4ECE-B79B-D8750413E9CD}']
  end;

  CAMediaTimingFunctionClass = interface(NSObjectClass)
    ['{59BC789D-E6DE-49DD-9465-3B1FEB29B301}']
    { class } function functionWithName(name: CAMediaTimingFunctionName)
      : Pointer { instancetype }; cdecl;
    [MethodName('functionWithControlPoints::::')]
    { class } function functionWithControlPoints(c1x: Single; c1y: Single;
      c2x: Single; c2y: Single): Pointer { instancetype }; cdecl;
  end;

  CAMediaTimingFunction = interface(NSObject)
    ['{D7944AFB-8D79-4F23-99DE-D7F3F11199A9}']
    [MethodName('initWithControlPoints::::')]
    function initWithControlPoints(c1x: Single; c1y: Single; c2x: Single;
      c2y: Single): Pointer { instancetype }; cdecl;
    procedure getControlPointAtIndex(idx: LongWord; values: Single); cdecl;
  end;

  TCAMediaTimingFunction = class(TOCGenericImport<CAMediaTimingFunctionClass,
    CAMediaTimingFunction>)
  end;

  PCAMediaTimingFunction = Pointer;

  CAValueFunctionClass = interface(NSObjectClass)
    ['{41F05E15-51A9-42DD-8100-C32A53C502FA}']
    { class } function functionWithName(name: CAValueFunctionName)
      : Pointer { instancetype }; cdecl;
  end;

  CAValueFunction = interface(NSObject)
    ['{FF5C9207-170D-4FC3-B23B-A685FDEB2AC4}']
    function name: CAValueFunctionName; cdecl;
  end;

  TCAValueFunction = class(TOCGenericImport<CAValueFunctionClass,
    CAValueFunction>)
  end;

  PCAValueFunction = Pointer;

  CAPropertyAnimationClass = interface(CAAnimationClass)
    ['{579C6540-F9A1-4CFE-B35D-A65EFB3F77D1}']
    { class } function animationWithKeyPath(path: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  CAPropertyAnimation = interface(CAAnimation)
    ['{46F4E228-D75D-4224-B45F-36CA6A17E29A}']
    procedure setKeyPath(keyPath: NSString); cdecl;
    function keyPath: NSString; cdecl;
    procedure setAdditive(additive: Boolean); cdecl;
    function isAdditive: Boolean; cdecl;
    procedure setCumulative(cumulative: Boolean); cdecl;
    function isCumulative: Boolean; cdecl;
    procedure setValueFunction(valueFunction: CAValueFunction); cdecl;
    function valueFunction: CAValueFunction; cdecl;
  end;

  TCAPropertyAnimation = class(TOCGenericImport<CAPropertyAnimationClass,
    CAPropertyAnimation>)
  end;

  PCAPropertyAnimation = Pointer;

  CABasicAnimationClass = interface(CAPropertyAnimationClass)
    ['{C3E274FE-1808-4EF5-A543-CDC72C0A536C}']
  end;

  CABasicAnimation = interface(CAPropertyAnimation)
    ['{890FAA33-74CB-442C-A1FD-8573CC8DAB11}']
    procedure setFromValue(fromValue: Pointer); cdecl;
    function fromValue: Pointer; cdecl;
    procedure setToValue(toValue: Pointer); cdecl;
    function toValue: Pointer; cdecl;
    procedure setByValue(byValue: Pointer); cdecl;
    function byValue: Pointer; cdecl;
  end;

  TCABasicAnimation = class(TOCGenericImport<CABasicAnimationClass,
    CABasicAnimation>)
  end;

  PCABasicAnimation = Pointer;

  CAKeyframeAnimationClass = interface(CAPropertyAnimationClass)
    ['{83BD142A-303F-4A46-B980-0851DAA09F75}']
  end;

  CAKeyframeAnimation = interface(CAPropertyAnimation)
    ['{53789181-255B-4A93-B56C-D93DF5F44F4D}']
    procedure setValues(values: NSArray); cdecl;
    function values: NSArray; cdecl;
    procedure setPath(path: CGPathRef); cdecl;
    function path: CGPathRef; cdecl;
    procedure setKeyTimes(keyTimes: NSArray); cdecl;
    function keyTimes: NSArray; cdecl;
    procedure setTimingFunctions(timingFunctions: NSArray); cdecl;
    function timingFunctions: NSArray; cdecl;
    procedure setCalculationMode(calculationMode
      : CAAnimationCalculationMode); cdecl;
    function calculationMode: CAAnimationCalculationMode; cdecl;
    procedure setTensionValues(tensionValues: NSArray); cdecl;
    function tensionValues: NSArray; cdecl;
    procedure setContinuityValues(continuityValues: NSArray); cdecl;
    function continuityValues: NSArray; cdecl;
    procedure setBiasValues(biasValues: NSArray); cdecl;
    function biasValues: NSArray; cdecl;
    procedure setRotationMode(rotationMode: CAAnimationRotationMode); cdecl;
    function rotationMode: CAAnimationRotationMode; cdecl;
  end;

  TCAKeyframeAnimation = class(TOCGenericImport<CAKeyframeAnimationClass,
    CAKeyframeAnimation>)
  end;

  PCAKeyframeAnimation = Pointer;

  CASpringAnimationClass = interface(CABasicAnimationClass)
    ['{5E08944A-6E69-4075-B7EC-EA7578096FAF}']
  end;

  CASpringAnimation = interface(CABasicAnimation)
    ['{91323DBB-9ED9-422D-96E9-F732966F6C1E}']
    procedure setMass(mass: CGFloat); cdecl;
    function mass: CGFloat; cdecl;
    procedure setStiffness(stiffness: CGFloat); cdecl;
    function stiffness: CGFloat; cdecl;
    procedure setDamping(damping: CGFloat); cdecl;
    function damping: CGFloat; cdecl;
    procedure setInitialVelocity(initialVelocity: CGFloat); cdecl;
    function initialVelocity: CGFloat; cdecl;
    function settlingDuration: CFTimeInterval; cdecl;
  end;

  TCASpringAnimation = class(TOCGenericImport<CASpringAnimationClass,
    CASpringAnimation>)
  end;

  PCASpringAnimation = Pointer;

  CATransitionClass = interface(CAAnimationClass)
    ['{650A8941-5605-4218-BF2F-C32270786A43}']
  end;

  CATransition = interface(CAAnimation)
    ['{07250DC9-AF36-468F-88D0-DC77A06D67CB}']
    procedure setType(&type: CATransitionType); cdecl;
    function &type: CATransitionType; cdecl;
    procedure setSubtype(subtype: CATransitionSubtype); cdecl;
    function subtype: CATransitionSubtype; cdecl;
    procedure setStartProgress(startProgress: Single); cdecl;
    function startProgress: Single; cdecl;
    procedure setEndProgress(endProgress: Single); cdecl;
    function endProgress: Single; cdecl;
  end;

  TCATransition = class(TOCGenericImport<CATransitionClass, CATransition>)
  end;

  PCATransition = Pointer;

  CAAnimationGroupClass = interface(CAAnimationClass)
    ['{A33B200F-A0CF-4853-BD0E-490C0C7F5487}']
  end;

  CAAnimationGroup = interface(CAAnimation)
    ['{865B9272-1E65-41F4-83D6-E635431E0822}']
    procedure setAnimations(animations: NSArray); cdecl;
    function animations: NSArray; cdecl;
  end;

  TCAAnimationGroup = class(TOCGenericImport<CAAnimationGroupClass,
    CAAnimationGroup>)
  end;

  PCAAnimationGroup = Pointer;

  CADisplayLinkClass = interface(NSObjectClass)
    ['{C9B01E63-1AA4-4EE8-8A8B-8D5A7483C05B}']
    { class } function displayLinkWithTarget(target: Pointer; selector: SEL)
      : CADisplayLink; cdecl;
  end;

  CADisplayLink = interface(NSObject)
    ['{3BB54AE2-5EE1-49E6-8178-3983B231B90C}']
    procedure addToRunLoop(runloop: NSRunLoop; forMode: NSRunLoopMode); cdecl;
    procedure removeFromRunLoop(runloop: NSRunLoop;
      forMode: NSRunLoopMode); cdecl;
    procedure invalidate; cdecl;
    function timestamp: CFTimeInterval; cdecl;
    function duration: CFTimeInterval; cdecl;
    function targetTimestamp: CFTimeInterval; cdecl;
    procedure setPaused(paused: Boolean); cdecl;
    function isPaused: Boolean; cdecl;
    procedure setFrameInterval(frameInterval: NSInteger); cdecl;
    function frameInterval: NSInteger; cdecl;
    procedure setPreferredFramesPerSecond(preferredFramesPerSecond
      : NSInteger); cdecl;
    function preferredFramesPerSecond: NSInteger; cdecl;
    procedure setPreferredFrameRateRange(preferredFrameRateRange
      : CAFrameRateRange); cdecl;
    function preferredFrameRateRange: CAFrameRateRange; cdecl;
  end;

  TCADisplayLink = class(TOCGenericImport<CADisplayLinkClass, CADisplayLink>)
  end;

  PCADisplayLink = Pointer;

  CAEAGLLayerClass = interface(CALayerClass)
    ['{1C7B3EF1-1627-41F9-B380-3B6B2CC54691}']
  end;

  CAEAGLLayer = interface(CALayer)
    ['{64315F06-0882-463E-B45F-627A1D3DBEF5}']
    procedure setPresentsWithTransaction(presentsWithTransaction
      : Boolean); cdecl;
    function presentsWithTransaction: Boolean; cdecl;
  end;

  TCAEAGLLayer = class(TOCGenericImport<CAEAGLLayerClass, CAEAGLLayer>)
  end;

  PCAEAGLLayer = Pointer;

  CAEDRMetadataClass = interface(NSObjectClass)
    ['{9C62D2B1-977B-47A6-886F-1E7D5FFD63A1}']
    { class } function HDR10MetadataWithDisplayInfo(displayData: NSData;
      contentInfo: NSData; opticalOutputScale: Single): CAEDRMetadata; cdecl;
    { class } function HDR10MetadataWithMinLuminance(minNits: Single;
      maxLuminance: Single; opticalOutputScale: Single): CAEDRMetadata; cdecl;
  end;

  CAEDRMetadata = interface(NSObject)
    ['{0B303751-5C95-45E7-ADD2-57D3ACE59974}']
    procedure setHLGMetadata(HLGMetadata: CAEDRMetadata); cdecl;
    function HLGMetadata: CAEDRMetadata; cdecl;
    procedure setAvailable(available: Boolean); cdecl;
    function available: Boolean; cdecl;
  end;

  TCAEDRMetadata = class(TOCGenericImport<CAEDRMetadataClass, CAEDRMetadata>)
  end;

  PCAEDRMetadata = Pointer;

  CAEmitterCellClass = interface(NSObjectClass)
    ['{2E007041-C1AF-4311-BE04-5C743B8AE2B3}']
    { class } function emitterCell: Pointer { instancetype }; cdecl;
    { class } function defaultValueForKey(key: NSString): Pointer; cdecl;
  end;

  CAEmitterCell = interface(NSObject)
    ['{6D2FB2EF-ADD6-4A9D-82E9-5BB08E84F3E1}']
    function shouldArchiveValueForKey(key: NSString): Boolean; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    procedure setBirthRate(birthRate: Single); cdecl;
    function birthRate: Single; cdecl;
    procedure setLifetime(lifetime: Single); cdecl;
    function lifetime: Single; cdecl;
    procedure setLifetimeRange(lifetimeRange: Single); cdecl;
    function lifetimeRange: Single; cdecl;
    procedure setEmissionLatitude(emissionLatitude: CGFloat); cdecl;
    function emissionLatitude: CGFloat; cdecl;
    procedure setEmissionLongitude(emissionLongitude: CGFloat); cdecl;
    function emissionLongitude: CGFloat; cdecl;
    procedure setEmissionRange(emissionRange: CGFloat); cdecl;
    function emissionRange: CGFloat; cdecl;
    procedure setVelocity(velocity: CGFloat); cdecl;
    function velocity: CGFloat; cdecl;
    procedure setVelocityRange(velocityRange: CGFloat); cdecl;
    function velocityRange: CGFloat; cdecl;
    procedure setXAcceleration(xAcceleration: CGFloat); cdecl;
    function xAcceleration: CGFloat; cdecl;
    procedure setYAcceleration(yAcceleration: CGFloat); cdecl;
    function yAcceleration: CGFloat; cdecl;
    procedure setZAcceleration(zAcceleration: CGFloat); cdecl;
    function zAcceleration: CGFloat; cdecl;
    procedure setScale(scale: CGFloat); cdecl;
    function scale: CGFloat; cdecl;
    procedure setScaleRange(scaleRange: CGFloat); cdecl;
    function scaleRange: CGFloat; cdecl;
    procedure setScaleSpeed(scaleSpeed: CGFloat); cdecl;
    function scaleSpeed: CGFloat; cdecl;
    procedure setSpin(spin: CGFloat); cdecl;
    function spin: CGFloat; cdecl;
    procedure setSpinRange(spinRange: CGFloat); cdecl;
    function spinRange: CGFloat; cdecl;
    procedure setColor(color: CGColorRef); cdecl;
    function color: CGColorRef; cdecl;
    procedure setRedRange(redRange: Single); cdecl;
    function redRange: Single; cdecl;
    procedure setGreenRange(greenRange: Single); cdecl;
    function greenRange: Single; cdecl;
    procedure setBlueRange(blueRange: Single); cdecl;
    function blueRange: Single; cdecl;
    procedure setAlphaRange(alphaRange: Single); cdecl;
    function alphaRange: Single; cdecl;
    procedure setRedSpeed(redSpeed: Single); cdecl;
    function redSpeed: Single; cdecl;
    procedure setGreenSpeed(greenSpeed: Single); cdecl;
    function greenSpeed: Single; cdecl;
    procedure setBlueSpeed(blueSpeed: Single); cdecl;
    function blueSpeed: Single; cdecl;
    procedure setAlphaSpeed(alphaSpeed: Single); cdecl;
    function alphaSpeed: Single; cdecl;
    procedure setContents(contents: Pointer); cdecl;
    function contents: Pointer; cdecl;
    procedure setContentsRect(contentsRect: CGRect); cdecl;
    function contentsRect: CGRect; cdecl;
    procedure setContentsScale(contentsScale: CGFloat); cdecl;
    function contentsScale: CGFloat; cdecl;
    procedure setMinificationFilter(minificationFilter: NSString); cdecl;
    function minificationFilter: NSString; cdecl;
    procedure setMagnificationFilter(magnificationFilter: NSString); cdecl;
    function magnificationFilter: NSString; cdecl;
    procedure setMinificationFilterBias(minificationFilterBias: Single); cdecl;
    function minificationFilterBias: Single; cdecl;
    procedure setEmitterCells(emitterCells: NSArray); cdecl;
    function emitterCells: NSArray; cdecl;
    procedure setStyle(style: NSDictionary); cdecl;
    function style: NSDictionary; cdecl;
  end;

  TCAEmitterCell = class(TOCGenericImport<CAEmitterCellClass, CAEmitterCell>)
  end;

  PCAEmitterCell = Pointer;

  CAEmitterLayerClass = interface(CALayerClass)
    ['{F293770F-A093-456B-A0CD-DDB2A0B863E3}']
  end;

  CAEmitterLayer = interface(CALayer)
    ['{E4A4561E-1D3A-4A67-A58B-C10EF1612CE6}']
    procedure setEmitterCells(emitterCells: NSArray); cdecl;
    function emitterCells: NSArray; cdecl;
    procedure setBirthRate(birthRate: Single); cdecl;
    function birthRate: Single; cdecl;
    procedure setLifetime(lifetime: Single); cdecl;
    function lifetime: Single; cdecl;
    procedure setEmitterPosition(emitterPosition: CGPoint); cdecl;
    function emitterPosition: CGPoint; cdecl;
    procedure setEmitterZPosition(emitterZPosition: CGFloat); cdecl;
    function emitterZPosition: CGFloat; cdecl;
    procedure setEmitterSize(emitterSize: CGSize); cdecl;
    function emitterSize: CGSize; cdecl;
    procedure setEmitterDepth(emitterDepth: CGFloat); cdecl;
    function emitterDepth: CGFloat; cdecl;
    procedure setEmitterShape(emitterShape: CAEmitterLayerEmitterShape); cdecl;
    function emitterShape: CAEmitterLayerEmitterShape; cdecl;
    procedure setEmitterMode(emitterMode: CAEmitterLayerEmitterMode); cdecl;
    function emitterMode: CAEmitterLayerEmitterMode; cdecl;
    procedure setRenderMode(renderMode: CAEmitterLayerRenderMode); cdecl;
    function renderMode: CAEmitterLayerRenderMode; cdecl;
    procedure setPreservesDepth(preservesDepth: Boolean); cdecl;
    function preservesDepth: Boolean; cdecl;
    procedure setVelocity(velocity: Single); cdecl;
    function velocity: Single; cdecl;
    procedure setScale(scale: Single); cdecl;
    function scale: Single; cdecl;
    procedure setSpin(spin: Single); cdecl;
    function spin: Single; cdecl;
    procedure setSeed(seed: Cardinal); cdecl;
    function seed: Cardinal; cdecl;
  end;

  TCAEmitterLayer = class(TOCGenericImport<CAEmitterLayerClass, CAEmitterLayer>)
  end;

  PCAEmitterLayer = Pointer;

  CAGradientLayerClass = interface(CALayerClass)
    ['{3E6721FC-C424-4D58-81BE-31C92E3DBA5D}']
  end;

  CAGradientLayer = interface(CALayer)
    ['{CE68A7AB-C903-4190-9FB6-10B52AD1B33E}']
    procedure setColors(colors: NSArray); cdecl;
    function colors: NSArray; cdecl;
    procedure setLocations(locations: NSArray); cdecl;
    function locations: NSArray; cdecl;
    procedure setStartPoint(startPoint: CGPoint); cdecl;
    function startPoint: CGPoint; cdecl;
    procedure setEndPoint(endPoint: CGPoint); cdecl;
    function endPoint: CGPoint; cdecl;
    procedure setType(&type: CAGradientLayerType); cdecl;
    function &type: CAGradientLayerType; cdecl;
  end;

  TCAGradientLayer = class(TOCGenericImport<CAGradientLayerClass,
    CAGradientLayer>)
  end;

  PCAGradientLayer = Pointer;

  CAMetalLayerClass = interface(CALayerClass)
    ['{18330E77-C4D4-4DE6-9854-4053962D71DD}']
  end;

  CAMetalLayer = interface(CALayer)
    ['{356EBFD8-9DCC-4D56-B18F-1EA46F34F7A5}']
    procedure setDevice(device: Pointer); cdecl;
    function device: Pointer; cdecl;
    function preferredDevice: Pointer; cdecl;
    procedure setPixelFormat(pixelFormat: MTLPixelFormat); cdecl;
    function pixelFormat: MTLPixelFormat; cdecl;
    procedure setFramebufferOnly(framebufferOnly: Boolean); cdecl;
    function framebufferOnly: Boolean; cdecl;
    procedure setDrawableSize(drawableSize: CGSize); cdecl;
    function drawableSize: CGSize; cdecl;
    function nextDrawable: Pointer; cdecl;
    procedure setMaximumDrawableCount(maximumDrawableCount: NSUInteger); cdecl;
    function maximumDrawableCount: NSUInteger; cdecl;
    procedure setPresentsWithTransaction(presentsWithTransaction
      : Boolean); cdecl;
    function presentsWithTransaction: Boolean; cdecl;
    procedure setColorspace(colorspace: CGColorSpaceRef); cdecl;
    function colorspace: CGColorSpaceRef; cdecl;
    procedure setWantsExtendedDynamicRangeContent
      (wantsExtendedDynamicRangeContent: Boolean); cdecl;
    function wantsExtendedDynamicRangeContent: Boolean; cdecl;
    procedure setEDRMetadata(EDRMetadata: CAEDRMetadata); cdecl;
    function EDRMetadata: CAEDRMetadata; cdecl;
    procedure setAllowsNextDrawableTimeout(allowsNextDrawableTimeout
      : Boolean); cdecl;
    function allowsNextDrawableTimeout: Boolean; cdecl;
    procedure setDeveloperHUDProperties(developerHUDProperties
      : NSDictionary); cdecl;
    function developerHUDProperties: NSDictionary; cdecl;
  end;

  TCAMetalLayer = class(TOCGenericImport<CAMetalLayerClass, CAMetalLayer>)
  end;

  PCAMetalLayer = Pointer;

  CARendererClass = interface(NSObjectClass)
    ['{0AF5FFA3-C018-411C-9ED5-AE7D478E64B9}']
    { class } function rendererWithMTLTexture(tex: Pointer;
      options: NSDictionary): CARenderer; cdecl;
  end;

  CARenderer = interface(NSObject)
    ['{66A8D2D5-62C7-4CE2-8765-BB3254E97D7E}']
    procedure setLayer(layer: CALayer); cdecl;
    function layer: CALayer; cdecl;
    procedure setBounds(bounds: CGRect); cdecl;
    function bounds: CGRect; cdecl;
    procedure beginFrameAtTime(t: CFTimeInterval; timestamp: Pointer); cdecl;
    function updateBounds: CGRect; cdecl;
    procedure addUpdateRect(r: CGRect); cdecl;
    procedure render; cdecl;
    function nextFrameTime: CFTimeInterval; cdecl;
    procedure endFrame; cdecl;
    procedure setDestination(tex: Pointer); cdecl;
  end;

  TCARenderer = class(TOCGenericImport<CARendererClass, CARenderer>)
  end;

  PCARenderer = Pointer;

  CAReplicatorLayerClass = interface(CALayerClass)
    ['{6DE523FA-D6A2-4BC9-9278-7E50EF7D3C20}']
  end;

  CAReplicatorLayer = interface(CALayer)
    ['{B5F74CDE-B9A8-4AB1-91B3-72FA784BF3B9}']
    procedure setInstanceCount(instanceCount: NSInteger); cdecl;
    function instanceCount: NSInteger; cdecl;
    procedure setPreservesDepth(preservesDepth: Boolean); cdecl;
    function preservesDepth: Boolean; cdecl;
    procedure setInstanceDelay(instanceDelay: CFTimeInterval); cdecl;
    function instanceDelay: CFTimeInterval; cdecl;
    procedure setInstanceTransform(instanceTransform: CATransform3D); cdecl;
    function instanceTransform: CATransform3D; cdecl;
    procedure setInstanceColor(instanceColor: CGColorRef); cdecl;
    function instanceColor: CGColorRef; cdecl;
    procedure setInstanceRedOffset(instanceRedOffset: Single); cdecl;
    function instanceRedOffset: Single; cdecl;
    procedure setInstanceGreenOffset(instanceGreenOffset: Single); cdecl;
    function instanceGreenOffset: Single; cdecl;
    procedure setInstanceBlueOffset(instanceBlueOffset: Single); cdecl;
    function instanceBlueOffset: Single; cdecl;
    procedure setInstanceAlphaOffset(instanceAlphaOffset: Single); cdecl;
    function instanceAlphaOffset: Single; cdecl;
  end;

  TCAReplicatorLayer = class(TOCGenericImport<CAReplicatorLayerClass,
    CAReplicatorLayer>)
  end;

  PCAReplicatorLayer = Pointer;

  CAScrollLayerClass = interface(CALayerClass)
    ['{E4505D8B-B8F3-4786-A91B-019ECE66D113}']
  end;

  CAScrollLayer = interface(CALayer)
    ['{5A33801D-3A61-4291-BD24-AA78A5B2EA40}']
    procedure scrollToPoint(p: CGPoint); cdecl;
    procedure scrollToRect(r: CGRect); cdecl;
    procedure setScrollMode(scrollMode: CAScrollLayerScrollMode); cdecl;
    function scrollMode: CAScrollLayerScrollMode; cdecl;
  end;

  TCAScrollLayer = class(TOCGenericImport<CAScrollLayerClass, CAScrollLayer>)
  end;

  PCAScrollLayer = Pointer;

  CAShapeLayerClass = interface(CALayerClass)
    ['{3C11ECFF-44E0-4B71-B266-F0A1BA847CE0}']
  end;

  CAShapeLayer = interface(CALayer)
    ['{790873B7-12C0-43B1-90E9-3A0608B9F3B2}']
    procedure setPath(path: CGPathRef); cdecl;
    function path: CGPathRef; cdecl;
    procedure setFillColor(fillColor: CGColorRef); cdecl;
    function fillColor: CGColorRef; cdecl;
    procedure setFillRule(fillRule: CAShapeLayerFillRule); cdecl;
    function fillRule: CAShapeLayerFillRule; cdecl;
    procedure setStrokeColor(strokeColor: CGColorRef); cdecl;
    function strokeColor: CGColorRef; cdecl;
    procedure setStrokeStart(strokeStart: CGFloat); cdecl;
    function strokeStart: CGFloat; cdecl;
    procedure setStrokeEnd(strokeEnd: CGFloat); cdecl;
    function strokeEnd: CGFloat; cdecl;
    procedure setLineWidth(lineWidth: CGFloat); cdecl;
    function lineWidth: CGFloat; cdecl;
    procedure setMiterLimit(miterLimit: CGFloat); cdecl;
    function miterLimit: CGFloat; cdecl;
    procedure setLineCap(lineCap: CAShapeLayerLineCap); cdecl;
    function lineCap: CAShapeLayerLineCap; cdecl;
    procedure setLineJoin(lineJoin: CAShapeLayerLineJoin); cdecl;
    function lineJoin: CAShapeLayerLineJoin; cdecl;
    procedure setLineDashPhase(lineDashPhase: CGFloat); cdecl;
    function lineDashPhase: CGFloat; cdecl;
    procedure setLineDashPattern(lineDashPattern: NSArray); cdecl;
    function lineDashPattern: NSArray; cdecl;
  end;

  TCAShapeLayer = class(TOCGenericImport<CAShapeLayerClass, CAShapeLayer>)
  end;

  PCAShapeLayer = Pointer;

  CATextLayerClass = interface(CALayerClass)
    ['{AF8C3FA0-D050-46AB-879E-191A74480CDE}']
  end;

  CATextLayer = interface(CALayer)
    ['{4B0B4AEF-0A62-43AE-AFD9-954B36EFF551}']
    procedure setString(&string: Pointer); cdecl;
    function &string: Pointer; cdecl;
    procedure setFont(font: CFTypeRef); cdecl;
    function font: CFTypeRef; cdecl;
    procedure setFontSize(fontSize: CGFloat); cdecl;
    function fontSize: CGFloat; cdecl;
    procedure setForegroundColor(foregroundColor: CGColorRef); cdecl;
    function foregroundColor: CGColorRef; cdecl;
    procedure setWrapped(wrapped: Boolean); cdecl;
    function isWrapped: Boolean; cdecl;
    procedure setTruncationMode(truncationMode
      : CATextLayerTruncationMode); cdecl;
    function truncationMode: CATextLayerTruncationMode; cdecl;
    procedure setAlignmentMode(alignmentMode: CATextLayerAlignmentMode); cdecl;
    function alignmentMode: CATextLayerAlignmentMode; cdecl;
    procedure setAllowsFontSubpixelQuantization(allowsFontSubpixelQuantization
      : Boolean); cdecl;
    function allowsFontSubpixelQuantization: Boolean; cdecl;
  end;

  TCATextLayer = class(TOCGenericImport<CATextLayerClass, CATextLayer>)
  end;

  PCATextLayer = Pointer;

  CATiledLayerClass = interface(CALayerClass)
    ['{DBC725AC-2385-40A9-9B0A-F766EEC4AFC7}']
    { class } function fadeDuration: CFTimeInterval; cdecl;
  end;

  CATiledLayer = interface(CALayer)
    ['{D9AA58CC-0482-44B9-89A5-F068B959E862}']
    procedure setLevelsOfDetail(levelsOfDetail: LongWord); cdecl;
    function levelsOfDetail: LongWord; cdecl;
    procedure setLevelsOfDetailBias(levelsOfDetailBias: LongWord); cdecl;
    function levelsOfDetailBias: LongWord; cdecl;
    procedure setTileSize(tileSize: CGSize); cdecl;
    function tileSize: CGSize; cdecl;
  end;

  TCATiledLayer = class(TOCGenericImport<CATiledLayerClass, CATiledLayer>)
  end;

  PCATiledLayer = Pointer;

  CATransactionClass = interface(NSObjectClass)
    ['{B76F7AF7-72FF-45B5-9EED-335C8F9C9957}']
    { class } procedure &begin; cdecl;
    { class } procedure commit; cdecl;
    { class } procedure flush; cdecl;
    { class } procedure lock; cdecl;
    { class } procedure unlock; cdecl;
    { class } function animationDuration: CFTimeInterval; cdecl;
    { class } procedure setAnimationDuration(dur: CFTimeInterval); cdecl;
    { class } function animationTimingFunction: CAMediaTimingFunction; cdecl;
    { class } procedure setAnimationTimingFunction
      (&function: CAMediaTimingFunction); cdecl;
    { class } function disableActions: Boolean; cdecl;
    { class } procedure setDisableActions(flag: Boolean); cdecl;
    { class } function completionBlock: TQuartzCoreCompletionBlock; cdecl;
    { class } procedure setCompletionBlock
      (block: TQuartzCoreCompletionBlock); cdecl;
    { class } function valueForKey(key: NSString): Pointer; cdecl;
    { class } procedure setValue(anObject: Pointer; forKey: NSString); cdecl;
  end;

  CATransaction = interface(NSObject)
    ['{307EE05D-9FAA-48D8-A73A-404C3D204818}']
  end;

  TCATransaction = class(TOCGenericImport<CATransactionClass, CATransaction>)
  end;

  PCATransaction = Pointer;

  CATransformLayerClass = interface(CALayerClass)
    ['{D5DB8195-2E13-4B51-BC12-2FC8F7E62D0F}']
  end;

  CATransformLayer = interface(CALayer)
    ['{F91C350C-7EC5-418B-AD0B-44CE1099477D}']
  end;

  TCATransformLayer = class(TOCGenericImport<CATransformLayerClass,
    CATransformLayer>)
  end;

  PCATransformLayer = Pointer;

  // ===== Protocol declarations =====

  CAMediaTiming = interface(IObjectiveC)
    ['{D82C92F2-AD23-4630-98F1-ADF274621D11}']
    procedure setBeginTime(beginTime: CFTimeInterval); cdecl;
    function beginTime: CFTimeInterval; cdecl;
    procedure setDuration(duration: CFTimeInterval); cdecl;
    function duration: CFTimeInterval; cdecl;
    procedure setSpeed(speed: Single); cdecl;
    function speed: Single; cdecl;
    procedure setTimeOffset(timeOffset: CFTimeInterval); cdecl;
    function timeOffset: CFTimeInterval; cdecl;
    procedure setRepeatCount(repeatCount: Single); cdecl;
    function repeatCount: Single; cdecl;
    procedure setRepeatDuration(repeatDuration: CFTimeInterval); cdecl;
    function repeatDuration: CFTimeInterval; cdecl;
    procedure setAutoreverses(autoreverses: Boolean); cdecl;
    function autoreverses: Boolean; cdecl;
    procedure setFillMode(fillMode: CAMediaTimingFillMode); cdecl;
    function fillMode: CAMediaTimingFillMode; cdecl;
  end;

  CAAction = interface(IObjectiveC)
    ['{950CC24B-BD18-49A6-9535-E7B290C9E723}']
    procedure runActionForKey(event: NSString; &object: Pointer;
      arguments: NSDictionary); cdecl;
  end;

  CALayerDelegate = interface(IObjectiveC)
    ['{ED89F049-B4ED-4AA9-9B34-29A96D43969B}']
    procedure displayLayer(layer: CALayer); cdecl;
    procedure drawLayer(layer: CALayer; inContext: CGContextRef); cdecl;
    procedure layerWillDraw(layer: CALayer); cdecl;
    procedure layoutSublayersOfLayer(layer: CALayer); cdecl;
    function actionForLayer(layer: CALayer; forKey: NSString): Pointer; cdecl;
  end;

  CAAnimationDelegate = interface(IObjectiveC)
    ['{667A57CF-297E-49F4-99CE-C158FE340F7D}']
    procedure animationDidStart(anim: CAAnimation); cdecl;
    procedure animationDidStop(anim: CAAnimation; finished: Boolean); cdecl;
  end;

  MTLDevice = interface(IObjectiveC)
    ['{4481A0D3-37CE-4567-B8CC-A5C824690CBE}']
  end;

  MTLTexture = interface(IObjectiveC)
    ['{CDCB38ED-1627-4B45-8830-5B85B7F56378}']
  end;

  CAMetalDrawable = interface(IObjectiveC)
    ['{4518B243-D847-4BDA-895C-BF510E40E767}']
    function texture: Pointer; cdecl;
    function layer: CAMetalLayer; cdecl;
  end;

  // ===== Exported string consts =====

function kCAFillModeForwards: Pointer;
function kCAFillModeBackwards: Pointer;
function kCAFillModeBoth: Pointer;
function kCAFillModeRemoved: Pointer;
function CATransform3DIdentity: Pointer;
function kCAGravityCenter: Pointer;
function kCAGravityTop: Pointer;
function kCAGravityBottom: Pointer;
function kCAGravityLeft: Pointer;
function kCAGravityRight: Pointer;
function kCAGravityTopLeft: Pointer;
function kCAGravityTopRight: Pointer;
function kCAGravityBottomLeft: Pointer;
function kCAGravityBottomRight: Pointer;
function kCAGravityResize: Pointer;
function kCAGravityResizeAspect: Pointer;
function kCAGravityResizeAspectFill: Pointer;
function kCAContentsFormatRGBA8Uint: Pointer;
function kCAContentsFormatRGBA16Float: Pointer;
function kCAContentsFormatGray8Uint: Pointer;
function kCAFilterNearest: Pointer;
function kCAFilterLinear: Pointer;
function kCAFilterTrilinear: Pointer;
function kCACornerCurveCircular: Pointer;
function kCACornerCurveContinuous: Pointer;
function kCAOnOrderIn: NSString;
function kCAOnOrderOut: NSString;
function kCATransition: NSString;
function CAFrameRateRangeDefault: Pointer;
function kCAAnimationLinear: Pointer;
function kCAAnimationDiscrete: Pointer;
function kCAAnimationPaced: Pointer;
function kCAAnimationCubic: Pointer;
function kCAAnimationCubicPaced: Pointer;
function kCAAnimationRotateAuto: Pointer;
function kCAAnimationRotateAutoReverse: Pointer;
function kCATransitionFade: Pointer;
function kCATransitionMoveIn: Pointer;
function kCATransitionPush: Pointer;
function kCATransitionReveal: Pointer;
function kCATransitionFromRight: Pointer;
function kCATransitionFromLeft: Pointer;
function kCATransitionFromTop: Pointer;
function kCATransitionFromBottom: Pointer;
function kCAEmitterLayerPoint: Pointer;
function kCAEmitterLayerLine: Pointer;
function kCAEmitterLayerRectangle: Pointer;
function kCAEmitterLayerCuboid: Pointer;
function kCAEmitterLayerCircle: Pointer;
function kCAEmitterLayerSphere: Pointer;
function kCAEmitterLayerPoints: Pointer;
function kCAEmitterLayerOutline: Pointer;
function kCAEmitterLayerSurface: Pointer;
function kCAEmitterLayerVolume: Pointer;
function kCAEmitterLayerUnordered: Pointer;
function kCAEmitterLayerOldestFirst: Pointer;
function kCAEmitterLayerOldestLast: Pointer;
function kCAEmitterLayerBackToFront: Pointer;
function kCAEmitterLayerAdditive: Pointer;
function kCAMediaTimingFunctionLinear: Pointer;
function kCAMediaTimingFunctionEaseIn: Pointer;
function kCAMediaTimingFunctionEaseOut: Pointer;
function kCAMediaTimingFunctionEaseInEaseOut: Pointer;
function kCAMediaTimingFunctionDefault: Pointer;
function kCAGradientLayerAxial: Pointer;
function kCAGradientLayerRadial: Pointer;
function kCAGradientLayerConic: Pointer;
function kCARendererColorSpace: NSString;
function kCARendererMetalCommandQueue: NSString;
function kCAScrollNone: Pointer;
function kCAScrollVertically: Pointer;
function kCAScrollHorizontally: Pointer;
function kCAScrollBoth: Pointer;
function kCAFillRuleNonZero: Pointer;
function kCAFillRuleEvenOdd: Pointer;
function kCALineJoinMiter: Pointer;
function kCALineJoinRound: Pointer;
function kCALineJoinBevel: Pointer;
function kCALineCapButt: Pointer;
function kCALineCapRound: Pointer;
function kCALineCapSquare: Pointer;
function kCATruncationNone: Pointer;
function kCATruncationStart: Pointer;
function kCATruncationEnd: Pointer;
function kCATruncationMiddle: Pointer;
function kCAAlignmentNatural: Pointer;
function kCAAlignmentLeft: Pointer;
function kCAAlignmentRight: Pointer;
function kCAAlignmentCenter: Pointer;
function kCAAlignmentJustified: Pointer;
function kCATransactionAnimationDuration: NSString;
function kCATransactionDisableActions: NSString;
function kCATransactionAnimationTimingFunction: NSString;
function kCATransactionCompletionBlock: NSString;
function kCAValueFunctionRotateX: Pointer;
function kCAValueFunctionRotateY: Pointer;
function kCAValueFunctionRotateZ: Pointer;
function kCAValueFunctionScale: Pointer;
function kCAValueFunctionScaleX: Pointer;
function kCAValueFunctionScaleY: Pointer;
function kCAValueFunctionScaleZ: Pointer;
function kCAValueFunctionTranslate: Pointer;
function kCAValueFunctionTranslateX: Pointer;
function kCAValueFunctionTranslateY: Pointer;
function kCAValueFunctionTranslateZ: Pointer;


// ===== External functions =====

const
  libQuartzCore = '/System/Library/Frameworks/QuartzCore.framework/QuartzCore';
function CACurrentMediaTime: CFTimeInterval; cdecl;
  external libQuartzCore name _PU + 'CACurrentMediaTime';
function CATransform3DIsIdentity(t: CATransform3D): Integer; cdecl;
  external libQuartzCore name _PU + 'CATransform3DIsIdentity';
function CATransform3DEqualToTransform(a: CATransform3D; b: CATransform3D)
  : Integer; cdecl; external libQuartzCore name _PU +
  'CATransform3DEqualToTransform';
function CATransform3DMakeTranslation(tx: CGFloat; ty: CGFloat; tz: CGFloat)
  : CATransform3D; cdecl; external libQuartzCore name _PU +
  'CATransform3DMakeTranslation';
function CATransform3DMakeScale(sx: CGFloat; sy: CGFloat; sz: CGFloat)
  : CATransform3D; cdecl; external libQuartzCore name _PU +
  'CATransform3DMakeScale';
function CATransform3DMakeRotation(angle: CGFloat; x: CGFloat; y: CGFloat;
  z: CGFloat): CATransform3D; cdecl;
  external libQuartzCore name _PU + 'CATransform3DMakeRotation';
function CATransform3DTranslate(t: CATransform3D; tx: CGFloat; ty: CGFloat;
  tz: CGFloat): CATransform3D; cdecl;
  external libQuartzCore name _PU + 'CATransform3DTranslate';
function CATransform3DScale(t: CATransform3D; sx: CGFloat; sy: CGFloat;
  sz: CGFloat): CATransform3D; cdecl;
  external libQuartzCore name _PU + 'CATransform3DScale';
function CATransform3DRotate(t: CATransform3D; angle: CGFloat; x: CGFloat;
  y: CGFloat; z: CGFloat): CATransform3D; cdecl;
  external libQuartzCore name _PU + 'CATransform3DRotate';
function CATransform3DConcat(a: CATransform3D; b: CATransform3D): CATransform3D;
  cdecl; external libQuartzCore name _PU + 'CATransform3DConcat';
function CATransform3DInvert(t: CATransform3D): CATransform3D; cdecl;
  external libQuartzCore name _PU + 'CATransform3DInvert';
function CATransform3DMakeAffineTransform(m: CGAffineTransform): CATransform3D;
  cdecl; external libQuartzCore name _PU + 'CATransform3DMakeAffineTransform';
function CATransform3DIsAffine(t: CATransform3D): Integer; cdecl;
  external libQuartzCore name _PU + 'CATransform3DIsAffine';
function CATransform3DGetAffineTransform(t: CATransform3D): CGAffineTransform;
  cdecl; external libQuartzCore name _PU + 'CATransform3DGetAffineTransform';
function CAFrameRateRangeMake(minimum: Single; maximum: Single;
  preferred: Single): CAFrameRateRange; cdecl;
  external libQuartzCore name _PU + 'CAFrameRateRangeMake';
function CAFrameRateRangeIsEqualToRange(range: CAFrameRateRange;
  other: CAFrameRateRange): Integer; cdecl;
  external libQuartzCore name _PU + 'CAFrameRateRangeIsEqualToRange';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  QuartzCoreModule: THandle;

{$ENDIF IOS}

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

function kCARendererColorSpace: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCARendererColorSpace');
end;

function kCARendererMetalCommandQueue: NSString;
begin
  Result := CocoaNSStringConst(libQuartzCore, 'kCARendererMetalCommandQueue');
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

function kCAFillModeForwards: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAFillModeForwards');
end;

function kCAFillModeBackwards: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAFillModeBackwards');
end;

function kCAFillModeBoth: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAFillModeBoth');
end;

function kCAFillModeRemoved: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAFillModeRemoved');
end;

function CATransform3DIdentity: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'CATransform3DIdentity');
end;

function kCAGravityCenter: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGravityCenter');
end;

function kCAGravityTop: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGravityTop');
end;

function kCAGravityBottom: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGravityBottom');
end;

function kCAGravityLeft: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGravityLeft');
end;

function kCAGravityRight: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGravityRight');
end;

function kCAGravityTopLeft: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGravityTopLeft');
end;

function kCAGravityTopRight: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGravityTopRight');
end;

function kCAGravityBottomLeft: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGravityBottomLeft');
end;

function kCAGravityBottomRight: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGravityBottomRight');
end;

function kCAGravityResize: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGravityResize');
end;

function kCAGravityResizeAspect: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGravityResizeAspect');
end;

function kCAGravityResizeAspectFill: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGravityResizeAspectFill');
end;

function kCAContentsFormatRGBA8Uint: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAContentsFormatRGBA8Uint');
end;

function kCAContentsFormatRGBA16Float: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAContentsFormatRGBA16Float');
end;

function kCAContentsFormatGray8Uint: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAContentsFormatGray8Uint');
end;

function kCAFilterNearest: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAFilterNearest');
end;

function kCAFilterLinear: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAFilterLinear');
end;

function kCAFilterTrilinear: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAFilterTrilinear');
end;

function kCACornerCurveCircular: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCACornerCurveCircular');
end;

function kCACornerCurveContinuous: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCACornerCurveContinuous');
end;

function CAFrameRateRangeDefault: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'CAFrameRateRangeDefault');
end;

function kCAAnimationLinear: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAAnimationLinear');
end;

function kCAAnimationDiscrete: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAAnimationDiscrete');
end;

function kCAAnimationPaced: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAAnimationPaced');
end;

function kCAAnimationCubic: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAAnimationCubic');
end;

function kCAAnimationCubicPaced: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAAnimationCubicPaced');
end;

function kCAAnimationRotateAuto: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAAnimationRotateAuto');
end;

function kCAAnimationRotateAutoReverse: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAAnimationRotateAutoReverse');
end;

function kCATransitionFade: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCATransitionFade');
end;

function kCATransitionMoveIn: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCATransitionMoveIn');
end;

function kCATransitionPush: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCATransitionPush');
end;

function kCATransitionReveal: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCATransitionReveal');
end;

function kCATransitionFromRight: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCATransitionFromRight');
end;

function kCATransitionFromLeft: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCATransitionFromLeft');
end;

function kCATransitionFromTop: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCATransitionFromTop');
end;

function kCATransitionFromBottom: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCATransitionFromBottom');
end;

function kCAEmitterLayerPoint: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerPoint');
end;

function kCAEmitterLayerLine: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerLine');
end;

function kCAEmitterLayerRectangle: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerRectangle');
end;

function kCAEmitterLayerCuboid: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerCuboid');
end;

function kCAEmitterLayerCircle: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerCircle');
end;

function kCAEmitterLayerSphere: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerSphere');
end;

function kCAEmitterLayerPoints: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerPoints');
end;

function kCAEmitterLayerOutline: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerOutline');
end;

function kCAEmitterLayerSurface: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerSurface');
end;

function kCAEmitterLayerVolume: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerVolume');
end;

function kCAEmitterLayerUnordered: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerUnordered');
end;

function kCAEmitterLayerOldestFirst: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerOldestFirst');
end;

function kCAEmitterLayerOldestLast: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerOldestLast');
end;

function kCAEmitterLayerBackToFront: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerBackToFront');
end;

function kCAEmitterLayerAdditive: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAEmitterLayerAdditive');
end;

function kCAMediaTimingFunctionLinear: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAMediaTimingFunctionLinear');
end;

function kCAMediaTimingFunctionEaseIn: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAMediaTimingFunctionEaseIn');
end;

function kCAMediaTimingFunctionEaseOut: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAMediaTimingFunctionEaseOut');
end;

function kCAMediaTimingFunctionEaseInEaseOut: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore,
    'kCAMediaTimingFunctionEaseInEaseOut');
end;

function kCAMediaTimingFunctionDefault: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAMediaTimingFunctionDefault');
end;

function kCAGradientLayerAxial: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGradientLayerAxial');
end;

function kCAGradientLayerRadial: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGradientLayerRadial');
end;

function kCAGradientLayerConic: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAGradientLayerConic');
end;

function kCAScrollNone: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAScrollNone');
end;

function kCAScrollVertically: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAScrollVertically');
end;

function kCAScrollHorizontally: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAScrollHorizontally');
end;

function kCAScrollBoth: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAScrollBoth');
end;

function kCAFillRuleNonZero: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAFillRuleNonZero');
end;

function kCAFillRuleEvenOdd: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAFillRuleEvenOdd');
end;

function kCALineJoinMiter: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCALineJoinMiter');
end;

function kCALineJoinRound: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCALineJoinRound');
end;

function kCALineJoinBevel: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCALineJoinBevel');
end;

function kCALineCapButt: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCALineCapButt');
end;

function kCALineCapRound: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCALineCapRound');
end;

function kCALineCapSquare: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCALineCapSquare');
end;

function kCATruncationNone: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCATruncationNone');
end;

function kCATruncationStart: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCATruncationStart');
end;

function kCATruncationEnd: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCATruncationEnd');
end;

function kCATruncationMiddle: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCATruncationMiddle');
end;

function kCAAlignmentNatural: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAAlignmentNatural');
end;

function kCAAlignmentLeft: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAAlignmentLeft');
end;

function kCAAlignmentRight: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAAlignmentRight');
end;

function kCAAlignmentCenter: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAAlignmentCenter');
end;

function kCAAlignmentJustified: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAAlignmentJustified');
end;

function kCAValueFunctionRotateX: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAValueFunctionRotateX');
end;

function kCAValueFunctionRotateY: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAValueFunctionRotateY');
end;

function kCAValueFunctionRotateZ: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAValueFunctionRotateZ');
end;

function kCAValueFunctionScale: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAValueFunctionScale');
end;

function kCAValueFunctionScaleX: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAValueFunctionScaleX');
end;

function kCAValueFunctionScaleY: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAValueFunctionScaleY');
end;

function kCAValueFunctionScaleZ: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAValueFunctionScaleZ');
end;

function kCAValueFunctionTranslate: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAValueFunctionTranslate');
end;

function kCAValueFunctionTranslateX: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAValueFunctionTranslateX');
end;

function kCAValueFunctionTranslateY: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAValueFunctionTranslateY');
end;

function kCAValueFunctionTranslateZ: Pointer;
begin
  Result := CocoaPointerConst(libQuartzCore, 'kCAValueFunctionTranslateZ');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

QuartzCoreModule := dlopen(MarshaledAString(libQuartzCore), RTLD_LAZY);

finalization

dlclose(QuartzCoreModule);
{$ENDIF IOS}

end.
