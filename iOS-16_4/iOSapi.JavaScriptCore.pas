{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework JavaScriptCore
//

unit iOSapi.JavaScriptCore;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

const
  kJSTypeUndefined = 0;
  kJSTypeNull = 1;
  kJSTypeBoolean = 2;
  kJSTypeNumber = 3;
  kJSTypeString = 4;
  kJSTypeObject = 5;
  kJSTypeSymbol = 6;
  kJSTypedArrayTypeInt8Array = 0;
  kJSTypedArrayTypeInt16Array = 1;
  kJSTypedArrayTypeInt32Array = 2;
  kJSTypedArrayTypeUint8Array = 3;
  kJSTypedArrayTypeUint8ClampedArray = 4;
  kJSTypedArrayTypeUint16Array = 5;
  kJSTypedArrayTypeUint32Array = 6;
  kJSTypedArrayTypeFloat32Array = 7;
  kJSTypedArrayTypeFloat64Array = 8;
  kJSTypedArrayTypeArrayBuffer = 9;
  kJSTypedArrayTypeNone = 10;
  kJSTypedArrayTypeBigInt64Array = 11;
  kJSTypedArrayTypeBigUint64Array = 12;
  kJSPropertyAttributeNone = 0;
  kJSPropertyAttributeReadOnly = 1 shl 1;
  kJSPropertyAttributeDontEnum = 1 shl 2;
  kJSPropertyAttributeDontDelete = 1 shl 3;
  kJSClassAttributeNone = 0;
  kJSClassAttributeNoAutomaticPrototype = 1 shl 1;

type

  // ===== Forward declarations =====
{$M+}
  JSVirtualMachine = interface;
  JSValue = interface;
  JSContext = interface;
  JSManagedValue = interface;
  JSExport = interface;

  // ===== Framework typedefs =====
{$M+}
  JSContextGroupRef = Pointer;
  PJSContextGroupRef = ^JSContextGroupRef;
  JSContextRef = Pointer;
  PJSContextRef = ^JSContextRef;
  JSGlobalContextRef = Pointer;
  PJSGlobalContextRef = ^JSGlobalContextRef;
  JSStringRef = Pointer;
  PJSStringRef = ^JSStringRef;
  JSClassRef = Pointer;
  PJSClassRef = ^JSClassRef;
  JSPropertyNameArrayRef = Pointer;
  PJSPropertyNameArrayRef = ^JSPropertyNameArrayRef;
  JSPropertyNameAccumulatorRef = Pointer;
  PJSPropertyNameAccumulatorRef = ^JSPropertyNameAccumulatorRef;
  JSTypedArrayBytesDeallocator = procedure(param1: Pointer;
    param2: Pointer); cdecl;
  PJSTypedArrayBytesDeallocator = ^JSTypedArrayBytesDeallocator;
  JSValueRef = Pointer;
  PJSValueRef = ^JSValueRef;
  JSObjectRef = Pointer;
  PJSObjectRef = ^JSObjectRef;
  JSType = Cardinal;
  JSTypedArrayType = Cardinal;
  JSPropertyAttributes = Cardinal;
  PJSPropertyAttributes = ^JSPropertyAttributes;

  JSClassAttributes = Cardinal;
  PJSClassAttributes = ^JSClassAttributes;

  JSObjectInitializeCallback = procedure(param1: JSContextRef;
    param2: JSObjectRef); cdecl;
  PJSObjectInitializeCallback = ^JSObjectInitializeCallback;
  JSObjectFinalizeCallback = procedure(param1: JSObjectRef); cdecl;
  PJSObjectFinalizeCallback = ^JSObjectFinalizeCallback;
  JSObjectHasPropertyCallback = function(param1: JSContextRef;
    param2: JSObjectRef; param3: JSStringRef): Integer; cdecl;
  PJSObjectHasPropertyCallback = ^JSObjectHasPropertyCallback;
  JSObjectGetPropertyCallback = function(param1: JSContextRef;
    param2: JSObjectRef; param3: JSStringRef; param4: PJSValueRef)
    : JSValueRef; cdecl;
  PJSObjectGetPropertyCallback = ^JSObjectGetPropertyCallback;
  JSObjectSetPropertyCallback = function(param1: JSContextRef;
    param2: JSObjectRef; param3: JSStringRef; param4: JSValueRef;
    param5: PJSValueRef): Integer; cdecl;
  PJSObjectSetPropertyCallback = ^JSObjectSetPropertyCallback;
  JSObjectDeletePropertyCallback = function(param1: JSContextRef;
    param2: JSObjectRef; param3: JSStringRef; param4: PJSValueRef)
    : Integer; cdecl;
  PJSObjectDeletePropertyCallback = ^JSObjectDeletePropertyCallback;
  JSObjectGetPropertyNamesCallback = procedure(param1: JSContextRef;
    param2: JSObjectRef; param3: JSPropertyNameAccumulatorRef); cdecl;
  PJSObjectGetPropertyNamesCallback = ^JSObjectGetPropertyNamesCallback;
  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  JSObjectCallAsFunctionCallback = function(param1: JSContextRef;
    param2: JSObjectRef; param3: JSObjectRef; param4: LongWord;
    param5: JSValueRef; param6: PJSValueRef): JSValueRef; cdecl;
  PJSObjectCallAsFunctionCallback = ^JSObjectCallAsFunctionCallback;
  JSObjectCallAsConstructorCallback = function(param1: JSContextRef;
    param2: JSObjectRef; param3: LongWord; param4: JSValueRef;
    param5: PJSValueRef): JSObjectRef; cdecl;
  PJSObjectCallAsConstructorCallback = ^JSObjectCallAsConstructorCallback;
  JSObjectHasInstanceCallback = function(param1: JSContextRef;
    param2: JSObjectRef; param3: JSValueRef; param4: PJSValueRef)
    : Integer; cdecl;
  PJSObjectHasInstanceCallback = ^JSObjectHasInstanceCallback;
  JSObjectConvertToTypeCallback = function(param1: JSContextRef;
    param2: JSObjectRef; param3: JSType; param4: PJSValueRef)
    : JSValueRef; cdecl;
  PJSObjectConvertToTypeCallback = ^JSObjectConvertToTypeCallback;

  JSStaticValue = record
    name: MarshaledAString;
    getProperty: JSObjectGetPropertyCallback;
    setProperty: JSObjectSetPropertyCallback;
    attributes: JSPropertyAttributes;
  end;

  PJSStaticValue = ^JSStaticValue;

  JSStaticFunction = record
    name: MarshaledAString;
    callAsFunction: JSObjectCallAsFunctionCallback;
    attributes: JSPropertyAttributes;
  end;

  PJSStaticFunction = ^JSStaticFunction;

  JSClassDefinition = record
    version: Integer;
    attributes: JSClassAttributes;
    className: MarshaledAString;
    parentClass: JSClassRef;
    staticValues: PJSStaticValue;
    staticFunctions: PJSStaticFunction;
    initialize: JSObjectInitializeCallback;
    finalize: JSObjectFinalizeCallback;
    hasProperty: JSObjectHasPropertyCallback;
    getProperty: JSObjectGetPropertyCallback;
    setProperty: JSObjectSetPropertyCallback;
    deleteProperty: JSObjectDeletePropertyCallback;
    getPropertyNames: JSObjectGetPropertyNamesCallback;
    callAsFunction: JSObjectCallAsFunctionCallback;
    callAsConstructor: JSObjectCallAsConstructorCallback;
    hasInstance: JSObjectHasInstanceCallback;
    convertToType: JSObjectConvertToTypeCallback;
  end;

  PJSClassDefinition = ^JSClassDefinition;

  JSChar = Word;
  PJSChar = ^JSChar;

  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  CFAllocatorRef = Pointer;
  PCFAllocatorRef = ^CFAllocatorRef;
  TJavaScriptCoreExceptionHandler = procedure(param1: JSContext;
    param2: JSValue) of object;
  TJavaScriptCoreFromExecutor = procedure(param1: JSValue; param2: JSValue)
    of object;
  CGFloat = Single;
  PCGFloat = ^CGFloat;

  CGPoint = record
    x: CGFloat;
    y: CGFloat;
  end;

  PCGPoint = ^CGPoint;

  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  _NSRange = record
    location: NSUInteger;
    length: NSUInteger;
  end;

  P_NSRange = ^_NSRange;
  NSRange = _NSRange;
  PNSRange = ^NSRange;

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

  JSValueProperty = NSString;
  PJSValueProperty = ^JSValueProperty;
  // ===== Interface declarations =====

  JSVirtualMachineClass = interface(NSObjectClass)
    ['{EB0CA478-F69E-4E63-9DDE-2E41BB0A3D69}']
  end;

  JSVirtualMachine = interface(NSObject)
    ['{B76B6720-52FC-4F19-8E91-6E029FF84C5C}']
    function init: Pointer { instancetype }; cdecl;
    procedure addManagedReference(&object: Pointer; withOwner: Pointer); cdecl;
    procedure removeManagedReference(&object: Pointer;
      withOwner: Pointer); cdecl;
  end;

  TJSVirtualMachine = class(TOCGenericImport<JSVirtualMachineClass,
    JSVirtualMachine>)
  end;

  PJSVirtualMachine = Pointer;

  JSValueClass = interface(NSObjectClass)
    ['{B7B507A2-68B6-4852-B646-A784FD9A660E}']
    { class } function valueWithObject(value: Pointer; inContext: JSContext)
      : JSValue; cdecl;
    { class } function valueWithBool(value: Boolean; inContext: JSContext)
      : JSValue; cdecl;
    { class } function valueWithDouble(value: Double; inContext: JSContext)
      : JSValue; cdecl;
    { class } function valueWithInt32(value: Int32; inContext: JSContext)
      : JSValue; cdecl;
    { class } function valueWithUInt32(value: LongWord; inContext: JSContext)
      : JSValue; cdecl;
    { class } function valueWithNewObjectInContext(context: JSContext)
      : JSValue; cdecl;
    { class } function valueWithNewArrayInContext(context: JSContext)
      : JSValue; cdecl;
    { class } function valueWithNewRegularExpressionFromPattern
      (pattern: NSString; flags: NSString; inContext: JSContext)
      : JSValue; cdecl;
    { class } function valueWithNewErrorFromMessage(message: NSString;
      inContext: JSContext): JSValue; cdecl;
    { class } function valueWithNewPromiseInContext(context: JSContext;
      fromExecutor: TJavaScriptCoreFromExecutor): JSValue; cdecl;
    { class } function valueWithNewPromiseResolvedWithResult(result: Pointer;
      inContext: JSContext): JSValue; cdecl;
    { class } function valueWithNewPromiseRejectedWithReason(reason: Pointer;
      inContext: JSContext): JSValue; cdecl;
    { class } function valueWithNewSymbolFromDescription(description: NSString;
      inContext: JSContext): JSValue; cdecl;
    { class } function valueWithNullInContext(context: JSContext)
      : JSValue; cdecl;
    { class } function valueWithUndefinedInContext(context: JSContext)
      : JSValue; cdecl;
    { class } function valueWithPoint(point: CGPoint; inContext: JSContext)
      : JSValue; cdecl;
    { class } function valueWithRange(range: NSRange; inContext: JSContext)
      : JSValue; cdecl;
    { class } function valueWithRect(rect: CGRect; inContext: JSContext)
      : JSValue; cdecl;
    { class } function valueWithSize(size: CGSize; inContext: JSContext)
      : JSValue; cdecl;
    { class } function valueWithJSValueRef(value: JSValueRef;
      inContext: JSContext): JSValue; cdecl;
  end;

  JSValue = interface(NSObject)
    ['{B9D0BEF0-577C-46E4-A082-4AAC31F8DBF8}']
    function context: JSContext; cdecl;
    function toObject: Pointer; cdecl;
    function toObjectOfClass(expectedClass: Pointer): Pointer; cdecl;
    function toBool: Boolean; cdecl;
    function toDouble: Double; cdecl;
    function toInt32: Int32; cdecl;
    function toUInt32: LongWord; cdecl;
    function toNumber: NSNumber; cdecl;
    function toString: NSString; cdecl;
    function toDate: NSDate; cdecl;
    function toArray: NSArray; cdecl;
    function toDictionary: NSDictionary; cdecl;
    function isUndefined: Boolean; cdecl;
    function isNull: Boolean; cdecl;
    function isBoolean: Boolean; cdecl;
    function isNumber: Boolean; cdecl;
    function isString: Boolean; cdecl;
    function isObject: Boolean; cdecl;
    function isArray: Boolean; cdecl;
    function isDate: Boolean; cdecl;
    function isSymbol: Boolean; cdecl;
    function isEqualToObject(value: Pointer): Boolean; cdecl;
    function isEqualWithTypeCoercionToObject(value: Pointer): Boolean; cdecl;
    function isInstanceOf(value: Pointer): Boolean; cdecl;
    function callWithArguments(arguments: NSArray): JSValue; cdecl;
    function constructWithArguments(arguments: NSArray): JSValue; cdecl;
    function invokeMethod(method: NSString; withArguments: NSArray)
      : JSValue; cdecl;
    function toPoint: CGPoint; cdecl;
    function toRange: NSRange; cdecl;
    function toRect: CGRect; cdecl;
    function toSize: CGSize; cdecl;
    function valueForProperty(&property: JSValueProperty): JSValue; cdecl;
    [MethodName('setValue:forProperty:')]
    procedure setValueForProperty(value: Pointer;
      forProperty: JSValueProperty); cdecl;
    function deleteProperty(&property: JSValueProperty): Boolean; cdecl;
    function hasProperty(&property: JSValueProperty): Boolean; cdecl;
    procedure defineProperty(&property: JSValueProperty;
      descriptor: Pointer); cdecl;
    function valueAtIndex(index: NSUInteger): JSValue; cdecl;
    [MethodName('setValue:atIndex:')]
    procedure setValueAtIndex(value: Pointer; atIndex: NSUInteger); cdecl;
    function objectForKeyedSubscript(key: Pointer): JSValue; cdecl;
    function objectAtIndexedSubscript(index: NSUInteger): JSValue; cdecl;
    [MethodName('setObject:forKeyedSubscript:')]
    procedure setObjectForKeyedSubscript(&object: Pointer;
      forKeyedSubscript: Pointer); cdecl;
    [MethodName('setObject:atIndexedSubscript:')]
    procedure setObjectAtIndexedSubscript(&object: Pointer;
      atIndexedSubscript: NSUInteger); cdecl;
    function JSValueRef: JSValueRef; cdecl;
  end;

  TJSValue = class(TOCGenericImport<JSValueClass, JSValue>)
  end;

  PJSValue = Pointer;

  JSContextClass = interface(NSObjectClass)
    ['{EA166523-9865-4444-BE11-0FD01294FDC2}']
    { class } function currentContext: JSContext; cdecl;
    { class } function currentCallee: JSValue; cdecl;
    { class } function currentThis: JSValue; cdecl;
    { class } function currentArguments: NSArray; cdecl;
    { class } function contextWithJSGlobalContextRef(JSGlobalContextRef
      : JSGlobalContextRef): JSContext; cdecl;
  end;

  JSContext = interface(NSObject)
    ['{27451C45-E82D-4829-8F63-F09B942D4EE5}']
    function init: Pointer { instancetype }; cdecl;
    function initWithVirtualMachine(virtualMachine: JSVirtualMachine)
      : Pointer { instancetype }; cdecl;
    [MethodName('evaluateScript:')]
    function evaluateScript(script: NSString): JSValue; cdecl;
    [MethodName('evaluateScript:withSourceURL:')]
    function evaluateScriptWithSourceURL(script: NSString; withSourceURL: NSURL)
      : JSValue; cdecl;
    function globalObject: JSValue; cdecl;
    procedure setException(exception: JSValue); cdecl;
    function exception: JSValue; cdecl;
    procedure setExceptionHandler(exceptionHandler
      : TJavaScriptCoreExceptionHandler); cdecl;
    function exceptionHandler: TJavaScriptCoreExceptionHandler; cdecl;
    function virtualMachine: JSVirtualMachine; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setInspectable(inspectable: Boolean); cdecl;
    function isInspectable: Boolean; cdecl;
    function objectForKeyedSubscript(key: Pointer): JSValue; cdecl;
    procedure setObject(&object: Pointer; forKeyedSubscript: NSObject); cdecl;
    function JSGlobalContextRef: JSGlobalContextRef; cdecl;
  end;

  TJSContext = class(TOCGenericImport<JSContextClass, JSContext>)
  end;

  PJSContext = Pointer;

  JSManagedValueClass = interface(NSObjectClass)
    ['{138DF2BE-9E24-4E82-B15C-B39E30D13F58}']
    [MethodName('managedValueWithValue:')]
    { class } function managedValueWithValue(value: JSValue)
      : JSManagedValue; cdecl;
    [MethodName('managedValueWithValue:andOwner:')]
    { class } function managedValueWithValueAndOwner(value: JSValue;
      andOwner: Pointer): JSManagedValue; cdecl;
  end;

  JSManagedValue = interface(NSObject)
    ['{9937DB8C-BD53-4512-A4B3-EAFFD8044BFF}']
    function initWithValue(value: JSValue): Pointer { instancetype }; cdecl;
    function value: JSValue; cdecl;
  end;

  TJSManagedValue = class(TOCGenericImport<JSManagedValueClass, JSManagedValue>)
  end;

  PJSManagedValue = Pointer;

  // ===== Protocol declarations =====

  JSExport = interface(IObjectiveC)
    ['{3A31021A-C3EF-4F92-8B78-28F8FB699621}']
  end;

  // ===== Exported string consts =====

function kJSClassDefinitionEmpty: Pointer;
function JSPropertyDescriptorWritableKey: NSString;
function JSPropertyDescriptorEnumerableKey: NSString;
function JSPropertyDescriptorConfigurableKey: NSString;
function JSPropertyDescriptorValueKey: NSString;
function JSPropertyDescriptorGetKey: NSString;
function JSPropertyDescriptorSetKey: NSString;


// ===== External functions =====

const
  libJavaScriptCore =
    '/System/Library/Frameworks/JavaScriptCore.framework/JavaScriptCore';
function JSEvaluateScript(ctx: JSContextRef; script: JSStringRef;
  thisObject: JSObjectRef; sourceURL: JSStringRef; startingLineNumber: Integer;
  exception: PJSValueRef): JSValueRef; cdecl;
  external libJavaScriptCore name _PU + 'JSEvaluateScript';
function JSCheckScriptSyntax(ctx: JSContextRef; script: JSStringRef;
  sourceURL: JSStringRef; startingLineNumber: Integer; exception: PJSValueRef)
  : Integer; cdecl; external libJavaScriptCore name _PU + 'JSCheckScriptSyntax';
procedure JSGarbageCollect(ctx: JSContextRef); cdecl;
  external libJavaScriptCore name _PU + 'JSGarbageCollect';
function JSValueGetType(ctx: JSContextRef; value: JSValueRef): JSType; cdecl;
  external libJavaScriptCore name _PU + 'JSValueGetType';
function JSValueIsUndefined(ctx: JSContextRef; value: JSValueRef): Integer;
  cdecl; external libJavaScriptCore name _PU + 'JSValueIsUndefined';
function JSValueIsNull(ctx: JSContextRef; value: JSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSValueIsNull';
function JSValueIsBoolean(ctx: JSContextRef; value: JSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSValueIsBoolean';
function JSValueIsNumber(ctx: JSContextRef; value: JSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSValueIsNumber';
function JSValueIsString(ctx: JSContextRef; value: JSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSValueIsString';
function JSValueIsSymbol(ctx: JSContextRef; value: JSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSValueIsSymbol';
function JSValueIsObject(ctx: JSContextRef; value: JSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSValueIsObject';
function JSValueIsObjectOfClass(ctx: JSContextRef; value: JSValueRef;
  jsClass: JSClassRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSValueIsObjectOfClass';
function JSValueIsArray(ctx: JSContextRef; value: JSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSValueIsArray';
function JSValueIsDate(ctx: JSContextRef; value: JSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSValueIsDate';
function JSValueGetTypedArrayType(ctx: JSContextRef; value: JSValueRef;
  exception: PJSValueRef): JSTypedArrayType; cdecl;
  external libJavaScriptCore name _PU + 'JSValueGetTypedArrayType';
function JSValueIsEqual(ctx: JSContextRef; a: JSValueRef; b: JSValueRef;
  exception: PJSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSValueIsEqual';
function JSValueIsStrictEqual(ctx: JSContextRef; a: JSValueRef; b: JSValueRef)
  : Integer; cdecl; external libJavaScriptCore name _PU +
  'JSValueIsStrictEqual';
function JSValueIsInstanceOfConstructor(ctx: JSContextRef; value: JSValueRef;
  &constructor: JSObjectRef; exception: PJSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSValueIsInstanceOfConstructor';
function JSValueMakeUndefined(ctx: JSContextRef): JSValueRef; cdecl;
  external libJavaScriptCore name _PU + 'JSValueMakeUndefined';
function JSValueMakeNull(ctx: JSContextRef): JSValueRef; cdecl;
  external libJavaScriptCore name _PU + 'JSValueMakeNull';
function JSValueMakeBoolean(ctx: JSContextRef; Boolean: Integer): JSValueRef;
  cdecl; external libJavaScriptCore name _PU + 'JSValueMakeBoolean';
function JSValueMakeNumber(ctx: JSContextRef; number: Double): JSValueRef;
  cdecl; external libJavaScriptCore name _PU + 'JSValueMakeNumber';
function JSValueMakeString(ctx: JSContextRef; &string: JSStringRef): JSValueRef;
  cdecl; external libJavaScriptCore name _PU + 'JSValueMakeString';
function JSValueMakeSymbol(ctx: JSContextRef; description: JSStringRef)
  : JSValueRef; cdecl; external libJavaScriptCore name _PU +
  'JSValueMakeSymbol';
function JSValueMakeFromJSONString(ctx: JSContextRef; &string: JSStringRef)
  : JSValueRef; cdecl; external libJavaScriptCore name _PU +
  'JSValueMakeFromJSONString';
function JSValueCreateJSONString(ctx: JSContextRef; value: JSValueRef;
  indent: Cardinal; exception: PJSValueRef): JSStringRef; cdecl;
  external libJavaScriptCore name _PU + 'JSValueCreateJSONString';
function JSValueToBoolean(ctx: JSContextRef; value: JSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSValueToBoolean';
function JSValueToNumber(ctx: JSContextRef; value: JSValueRef;
  exception: PJSValueRef): Double; cdecl;
  external libJavaScriptCore name _PU + 'JSValueToNumber';
function JSValueToStringCopy(ctx: JSContextRef; value: JSValueRef;
  exception: PJSValueRef): JSStringRef; cdecl;
  external libJavaScriptCore name _PU + 'JSValueToStringCopy';
function JSValueToObject(ctx: JSContextRef; value: JSValueRef;
  exception: PJSValueRef): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU + 'JSValueToObject';
procedure JSValueProtect(ctx: JSContextRef; value: JSValueRef); cdecl;
  external libJavaScriptCore name _PU + 'JSValueProtect';
procedure JSValueUnprotect(ctx: JSContextRef; value: JSValueRef); cdecl;
  external libJavaScriptCore name _PU + 'JSValueUnprotect';
function JSClassCreate(definition: PJSClassDefinition): JSClassRef; cdecl;
  external libJavaScriptCore name _PU + 'JSClassCreate';
function JSClassRetain(jsClass: JSClassRef): JSClassRef; cdecl;
  external libJavaScriptCore name _PU + 'JSClassRetain';
procedure JSClassRelease(jsClass: JSClassRef); cdecl;
  external libJavaScriptCore name _PU + 'JSClassRelease';
function JSObjectMake(ctx: JSContextRef; jsClass: JSClassRef; data: Pointer)
  : JSObjectRef; cdecl; external libJavaScriptCore name _PU + 'JSObjectMake';
function JSObjectMakeFunctionWithCallback(ctx: JSContextRef; name: JSStringRef;
  callAsFunction: JSObjectCallAsFunctionCallback): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectMakeFunctionWithCallback';
function JSObjectMakeConstructor(ctx: JSContextRef; jsClass: JSClassRef;
  callAsConstructor: JSObjectCallAsConstructorCallback): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectMakeConstructor';
function JSObjectMakeArray(ctx: JSContextRef; argumentCount: LongWord;
  arguments: JSValueRef; exception: PJSValueRef): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectMakeArray';
function JSObjectMakeDate(ctx: JSContextRef; argumentCount: LongWord;
  arguments: JSValueRef; exception: PJSValueRef): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectMakeDate';
function JSObjectMakeError(ctx: JSContextRef; argumentCount: LongWord;
  arguments: JSValueRef; exception: PJSValueRef): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectMakeError';
function JSObjectMakeRegExp(ctx: JSContextRef; argumentCount: LongWord;
  arguments: JSValueRef; exception: PJSValueRef): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectMakeRegExp';
function JSObjectMakeDeferredPromise(ctx: JSContextRef; resolve: PJSObjectRef;
  reject: PJSObjectRef; exception: PJSValueRef): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectMakeDeferredPromise';
function JSObjectMakeFunction(ctx: JSContextRef; name: JSStringRef;
  parameterCount: Cardinal; parameterNames: JSStringRef; body: JSStringRef;
  sourceURL: JSStringRef; startingLineNumber: Integer; exception: PJSValueRef)
  : JSObjectRef; cdecl; external libJavaScriptCore name _PU +
  'JSObjectMakeFunction';
function JSObjectGetPrototype(ctx: JSContextRef; &object: JSObjectRef)
  : JSValueRef; cdecl; external libJavaScriptCore name _PU +
  'JSObjectGetPrototype';
procedure JSObjectSetPrototype(ctx: JSContextRef; &object: JSObjectRef;
  value: JSValueRef); cdecl; external libJavaScriptCore name _PU +
  'JSObjectSetPrototype';
function JSObjectHasProperty(ctx: JSContextRef; &object: JSObjectRef;
  propertyName: JSStringRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectHasProperty';
function JSObjectGetProperty(ctx: JSContextRef; &object: JSObjectRef;
  propertyName: JSStringRef; exception: PJSValueRef): JSValueRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectGetProperty';
procedure JSObjectSetProperty(ctx: JSContextRef; &object: JSObjectRef;
  propertyName: JSStringRef; value: JSValueRef;
  attributes: JSPropertyAttributes; exception: PJSValueRef); cdecl;
  external libJavaScriptCore name _PU + 'JSObjectSetProperty';
function JSObjectDeleteProperty(ctx: JSContextRef; &object: JSObjectRef;
  propertyName: JSStringRef; exception: PJSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectDeleteProperty';
function JSObjectHasPropertyForKey(ctx: JSContextRef; &object: JSObjectRef;
  propertyKey: JSValueRef; exception: PJSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectHasPropertyForKey';
function JSObjectGetPropertyForKey(ctx: JSContextRef; &object: JSObjectRef;
  propertyKey: JSValueRef; exception: PJSValueRef): JSValueRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectGetPropertyForKey';
procedure JSObjectSetPropertyForKey(ctx: JSContextRef; &object: JSObjectRef;
  propertyKey: JSValueRef; value: JSValueRef; attributes: JSPropertyAttributes;
  exception: PJSValueRef); cdecl;
  external libJavaScriptCore name _PU + 'JSObjectSetPropertyForKey';
function JSObjectDeletePropertyForKey(ctx: JSContextRef; &object: JSObjectRef;
  propertyKey: JSValueRef; exception: PJSValueRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectDeletePropertyForKey';
function JSObjectGetPropertyAtIndex(ctx: JSContextRef; &object: JSObjectRef;
  propertyIndex: Cardinal; exception: PJSValueRef): JSValueRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectGetPropertyAtIndex';
procedure JSObjectSetPropertyAtIndex(ctx: JSContextRef; &object: JSObjectRef;
  propertyIndex: Cardinal; value: JSValueRef; exception: PJSValueRef); cdecl;
  external libJavaScriptCore name _PU + 'JSObjectSetPropertyAtIndex';
function JSObjectGetPrivate(&object: JSObjectRef): Pointer; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectGetPrivate';
function JSObjectSetPrivate(&object: JSObjectRef; data: Pointer): Integer;
  cdecl; external libJavaScriptCore name _PU + 'JSObjectSetPrivate';
function JSObjectIsFunction(ctx: JSContextRef; &object: JSObjectRef): Integer;
  cdecl; external libJavaScriptCore name _PU + 'JSObjectIsFunction';
function JSObjectCallAsFunction(ctx: JSContextRef; &object: JSObjectRef;
  thisObject: JSObjectRef; argumentCount: LongWord; arguments: JSValueRef;
  exception: PJSValueRef): JSValueRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectCallAsFunction';
function JSObjectIsConstructor(ctx: JSContextRef; &object: JSObjectRef)
  : Integer; cdecl; external libJavaScriptCore name _PU +
  'JSObjectIsConstructor';
function JSObjectCallAsConstructor(ctx: JSContextRef; &object: JSObjectRef;
  argumentCount: LongWord; arguments: JSValueRef; exception: PJSValueRef)
  : JSObjectRef; cdecl; external libJavaScriptCore name _PU +
  'JSObjectCallAsConstructor';
function JSObjectCopyPropertyNames(ctx: JSContextRef; &object: JSObjectRef)
  : JSPropertyNameArrayRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectCopyPropertyNames';
function JSPropertyNameArrayRetain(&array: JSPropertyNameArrayRef)
  : JSPropertyNameArrayRef; cdecl;
  external libJavaScriptCore name _PU + 'JSPropertyNameArrayRetain';
procedure JSPropertyNameArrayRelease(&array: JSPropertyNameArrayRef); cdecl;
  external libJavaScriptCore name _PU + 'JSPropertyNameArrayRelease';
function JSPropertyNameArrayGetCount(&array: JSPropertyNameArrayRef): LongWord;
  cdecl; external libJavaScriptCore name _PU + 'JSPropertyNameArrayGetCount';
function JSPropertyNameArrayGetNameAtIndex(&array: JSPropertyNameArrayRef;
  index: LongWord): JSStringRef; cdecl;
  external libJavaScriptCore name _PU + 'JSPropertyNameArrayGetNameAtIndex';
procedure JSPropertyNameAccumulatorAddName(accumulator
  : JSPropertyNameAccumulatorRef; propertyName: JSStringRef); cdecl;
  external libJavaScriptCore name _PU + 'JSPropertyNameAccumulatorAddName';
function JSContextGroupCreate: JSContextGroupRef; cdecl;
  external libJavaScriptCore name _PU + 'JSContextGroupCreate';
function JSContextGroupRetain(group: JSContextGroupRef): JSContextGroupRef;
  cdecl; external libJavaScriptCore name _PU + 'JSContextGroupRetain';
procedure JSContextGroupRelease(group: JSContextGroupRef); cdecl;
  external libJavaScriptCore name _PU + 'JSContextGroupRelease';
function JSGlobalContextCreate(globalObjectClass: JSClassRef)
  : JSGlobalContextRef; cdecl;
  external libJavaScriptCore name _PU + 'JSGlobalContextCreate';
function JSGlobalContextCreateInGroup(group: JSContextGroupRef;
  globalObjectClass: JSClassRef): JSGlobalContextRef; cdecl;
  external libJavaScriptCore name _PU + 'JSGlobalContextCreateInGroup';
function JSGlobalContextRetain(ctx: JSGlobalContextRef): JSGlobalContextRef;
  cdecl; external libJavaScriptCore name _PU + 'JSGlobalContextRetain';
procedure JSGlobalContextRelease(ctx: JSGlobalContextRef); cdecl;
  external libJavaScriptCore name _PU + 'JSGlobalContextRelease';
function JSContextGetGlobalObject(ctx: JSContextRef): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU + 'JSContextGetGlobalObject';
function JSContextGetGroup(ctx: JSContextRef): JSContextGroupRef; cdecl;
  external libJavaScriptCore name _PU + 'JSContextGetGroup';
function JSContextGetGlobalContext(ctx: JSContextRef): JSGlobalContextRef;
  cdecl; external libJavaScriptCore name _PU + 'JSContextGetGlobalContext';
function JSGlobalContextCopyName(ctx: JSGlobalContextRef): JSStringRef; cdecl;
  external libJavaScriptCore name _PU + 'JSGlobalContextCopyName';
procedure JSGlobalContextSetName(ctx: JSGlobalContextRef; name: JSStringRef);
  cdecl; external libJavaScriptCore name _PU + 'JSGlobalContextSetName';
function JSGlobalContextIsInspectable(ctx: JSGlobalContextRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSGlobalContextIsInspectable';
procedure JSGlobalContextSetInspectable(ctx: JSGlobalContextRef;
  inspectable: Integer); cdecl;
  external libJavaScriptCore name _PU + 'JSGlobalContextSetInspectable';
function JSStringCreateWithCharacters(chars: PJSChar; numChars: LongWord)
  : JSStringRef; cdecl; external libJavaScriptCore name _PU +
  'JSStringCreateWithCharacters';
function JSStringCreateWithUTF8CString(&string: MarshaledAString): JSStringRef;
  cdecl; external libJavaScriptCore name _PU + 'JSStringCreateWithUTF8CString';
function JSStringRetain(&string: JSStringRef): JSStringRef; cdecl;
  external libJavaScriptCore name _PU + 'JSStringRetain';
procedure JSStringRelease(&string: JSStringRef); cdecl;
  external libJavaScriptCore name _PU + 'JSStringRelease';
function JSStringGetLength(&string: JSStringRef): LongWord; cdecl;
  external libJavaScriptCore name _PU + 'JSStringGetLength';
function JSStringGetCharactersPtr(&string: JSStringRef): PJSChar; cdecl;
  external libJavaScriptCore name _PU + 'JSStringGetCharactersPtr';
function JSStringGetMaximumUTF8CStringSize(&string: JSStringRef): LongWord;
  cdecl; external libJavaScriptCore name _PU +
  'JSStringGetMaximumUTF8CStringSize';
function JSStringGetUTF8CString(&string: JSStringRef; buffer: MarshaledAString;
  bufferSize: LongWord): LongWord; cdecl;
  external libJavaScriptCore name _PU + 'JSStringGetUTF8CString';
function JSStringIsEqual(a: JSStringRef; b: JSStringRef): Integer; cdecl;
  external libJavaScriptCore name _PU + 'JSStringIsEqual';
function JSStringIsEqualToUTF8CString(a: JSStringRef; b: MarshaledAString)
  : Integer; cdecl; external libJavaScriptCore name _PU +
  'JSStringIsEqualToUTF8CString';
function JSObjectMakeTypedArray(ctx: JSContextRef; arrayType: JSTypedArrayType;
  length: LongWord; exception: PJSValueRef): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectMakeTypedArray';
function JSObjectMakeTypedArrayWithBytesNoCopy(ctx: JSContextRef;
  arrayType: JSTypedArrayType; bytes: Pointer; byteLength: LongWord;
  bytesDeallocator: JSTypedArrayBytesDeallocator; deallocatorContext: Pointer;
  exception: PJSValueRef): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectMakeTypedArrayWithBytesNoCopy';
function JSObjectMakeTypedArrayWithArrayBuffer(ctx: JSContextRef;
  arrayType: JSTypedArrayType; buffer: JSObjectRef; exception: PJSValueRef)
  : JSObjectRef; cdecl; external libJavaScriptCore name _PU +
  'JSObjectMakeTypedArrayWithArrayBuffer';
function JSObjectMakeTypedArrayWithArrayBufferAndOffset(ctx: JSContextRef;
  arrayType: JSTypedArrayType; buffer: JSObjectRef; byteOffset: LongWord;
  length: LongWord; exception: PJSValueRef): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU +
  'JSObjectMakeTypedArrayWithArrayBufferAndOffset';
function JSObjectGetTypedArrayBytesPtr(ctx: JSContextRef; &object: JSObjectRef;
  exception: PJSValueRef): Pointer; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectGetTypedArrayBytesPtr';
function JSObjectGetTypedArrayLength(ctx: JSContextRef; &object: JSObjectRef;
  exception: PJSValueRef): LongWord; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectGetTypedArrayLength';
function JSObjectGetTypedArrayByteLength(ctx: JSContextRef;
  &object: JSObjectRef; exception: PJSValueRef): LongWord; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectGetTypedArrayByteLength';
function JSObjectGetTypedArrayByteOffset(ctx: JSContextRef;
  &object: JSObjectRef; exception: PJSValueRef): LongWord; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectGetTypedArrayByteOffset';
function JSObjectGetTypedArrayBuffer(ctx: JSContextRef; &object: JSObjectRef;
  exception: PJSValueRef): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectGetTypedArrayBuffer';
function JSObjectMakeArrayBufferWithBytesNoCopy(ctx: JSContextRef;
  bytes: Pointer; byteLength: LongWord;
  bytesDeallocator: JSTypedArrayBytesDeallocator; deallocatorContext: Pointer;
  exception: PJSValueRef): JSObjectRef; cdecl;
  external libJavaScriptCore name _PU +
  'JSObjectMakeArrayBufferWithBytesNoCopy';
function JSObjectGetArrayBufferBytesPtr(ctx: JSContextRef; &object: JSObjectRef;
  exception: PJSValueRef): Pointer; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectGetArrayBufferBytesPtr';
function JSObjectGetArrayBufferByteLength(ctx: JSContextRef;
  &object: JSObjectRef; exception: PJSValueRef): LongWord; cdecl;
  external libJavaScriptCore name _PU + 'JSObjectGetArrayBufferByteLength';
function JSStringCreateWithCFString(&string: CFStringRef): JSStringRef; cdecl;
  external libJavaScriptCore name _PU + 'JSStringCreateWithCFString';
function JSStringCopyCFString(alloc: CFAllocatorRef; &string: JSStringRef)
  : CFStringRef; cdecl; external libJavaScriptCore name _PU +
  'JSStringCopyCFString';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  JavaScriptCoreModule: THandle;

{$ENDIF IOS}

function JSPropertyDescriptorWritableKey: NSString;
begin
  result := CocoaNSStringConst(libJavaScriptCore,
    'JSPropertyDescriptorWritableKey');
end;

function JSPropertyDescriptorEnumerableKey: NSString;
begin
  result := CocoaNSStringConst(libJavaScriptCore,
    'JSPropertyDescriptorEnumerableKey');
end;

function JSPropertyDescriptorConfigurableKey: NSString;
begin
  result := CocoaNSStringConst(libJavaScriptCore,
    'JSPropertyDescriptorConfigurableKey');
end;

function JSPropertyDescriptorValueKey: NSString;
begin
  result := CocoaNSStringConst(libJavaScriptCore,
    'JSPropertyDescriptorValueKey');
end;

function JSPropertyDescriptorGetKey: NSString;
begin
  result := CocoaNSStringConst(libJavaScriptCore, 'JSPropertyDescriptorGetKey');
end;

function JSPropertyDescriptorSetKey: NSString;
begin
  result := CocoaNSStringConst(libJavaScriptCore, 'JSPropertyDescriptorSetKey');
end;

function kJSClassDefinitionEmpty: Pointer;
begin
  result := CocoaPointerConst(libJavaScriptCore, 'kJSClassDefinitionEmpty');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

JavaScriptCoreModule := dlopen(MarshaledAString(libJavaScriptCore), RTLD_LAZY);

finalization

dlclose(JavaScriptCoreModule);
{$ENDIF IOS}

end.
