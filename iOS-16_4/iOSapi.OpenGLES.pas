{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework OpenGLES
//

unit iOSapi.OpenGLES;

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
  iOSapi.IOSurface;

const
  kEAGLRenderingAPIOpenGLES1 = 1;
  kEAGLRenderingAPIOpenGLES2 = 2;
  kEAGLRenderingAPIOpenGLES3 = 3;

type

  // ===== Forward declarations =====
{$M+}
  EAGLSharegroup = interface;
  EAGLContext = interface;
  EAGLDrawable = interface;

  // ===== Framework typedefs =====
{$M+}
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  EAGLRenderingAPI = NSUInteger;
  CFTimeInterval = Double;
  PCFTimeInterval = ^CFTimeInterval;

  IOSurfaceRef = Pointer;
  PIOSurfaceRef = ^IOSurfaceRef;
  // ===== Interface declarations =====

  EAGLSharegroupClass = interface(NSObjectClass)
    ['{9853EC86-DB99-42BF-8233-225DC837A8B2}']
  end;

  EAGLSharegroup = interface(NSObject)
    ['{41941226-9DEA-4DC5-9C74-BC669E43C0C5}']
    procedure setDebugLabel(debugLabel: NSString); cdecl;
    function debugLabel: NSString; cdecl;
  end;

  TEAGLSharegroup = class(TOCGenericImport<EAGLSharegroupClass, EAGLSharegroup>)
  end;

  PEAGLSharegroup = Pointer;

  EAGLContextClass = interface(NSObjectClass)
    ['{635042C6-EDA1-4C48-9ED4-AD7C3C0A07D9}']
    { class } function setCurrentContext(context: EAGLContext): Boolean; cdecl;
    { class } function currentContext: EAGLContext; cdecl;
  end;

  EAGLContext = interface(NSObject)
    ['{C8BFDCD8-4A88-48D9-B050-D7052E9F495B}']
    [MethodName('initWithAPI:')]
    function initWithAPI(api: EAGLRenderingAPI)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithAPI:sharegroup:')]
    function initWithAPISharegroup(api: EAGLRenderingAPI;
      sharegroup: EAGLSharegroup): Pointer { instancetype }; cdecl;
    function api: EAGLRenderingAPI; cdecl;
    function sharegroup: EAGLSharegroup; cdecl;
    procedure setDebugLabel(debugLabel: NSString); cdecl;
    function debugLabel: NSString; cdecl;
    procedure setMultiThreaded(multiThreaded: Boolean); cdecl;
    function isMultiThreaded: Boolean; cdecl;
    function renderbufferStorage(target: NSUInteger; fromDrawable: Pointer)
      : Boolean; cdecl;
    [MethodName('presentRenderbuffer:')]
    function presentRenderbuffer(target: NSUInteger): Boolean; cdecl;
    [MethodName('presentRenderbuffer:atTime:')]
    function presentRenderbufferAtTime(target: NSUInteger;
      atTime: CFTimeInterval): Boolean; cdecl;
    [MethodName('presentRenderbuffer:afterMinimumDuration:')]
    function presentRenderbufferAfterMinimumDuration(target: NSUInteger;
      afterMinimumDuration: CFTimeInterval): Boolean; cdecl;
    function texImageIOSurface(IOSurface: IOSurfaceRef; target: NSUInteger;
      internalFormat: NSUInteger; width: LongWord; height: LongWord;
      format: NSUInteger; &type: NSUInteger; plane: LongWord): Boolean; cdecl;
  end;

  TEAGLContext = class(TOCGenericImport<EAGLContextClass, EAGLContext>)
  end;

  PEAGLContext = Pointer;

  // ===== Protocol declarations =====

  EAGLDrawable = interface(IObjectiveC)
    ['{955F9280-98AE-4435-8506-D277DD8CFDC4}']
    procedure setDrawableProperties(drawableProperties: NSDictionary); cdecl;
    function drawableProperties: NSDictionary; cdecl;
  end;

  // ===== Exported string consts =====

function kEAGLDrawablePropertyRetainedBacking: NSString;
function kEAGLDrawablePropertyColorFormat: NSString;
function kEAGLColorFormatRGBA8: NSString;
function kEAGLColorFormatRGB565: NSString;
function kEAGLColorFormatSRGBA8: NSString;


// ===== External functions =====

const
  libOpenGLES = '/System/Library/Frameworks/OpenGLES.framework/OpenGLES';
procedure EAGLGetVersion(major: PCardinal; minor: PCardinal); cdecl;
  external libOpenGLES name _PU + 'EAGLGetVersion';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  OpenGLESModule: THandle;

{$ENDIF IOS}

function kEAGLDrawablePropertyRetainedBacking: NSString;
begin
  Result := CocoaNSStringConst(libOpenGLES,
    'kEAGLDrawablePropertyRetainedBacking');
end;

function kEAGLDrawablePropertyColorFormat: NSString;
begin
  Result := CocoaNSStringConst(libOpenGLES, 'kEAGLDrawablePropertyColorFormat');
end;

function kEAGLColorFormatRGBA8: NSString;
begin
  Result := CocoaNSStringConst(libOpenGLES, 'kEAGLColorFormatRGBA8');
end;

function kEAGLColorFormatRGB565: NSString;
begin
  Result := CocoaNSStringConst(libOpenGLES, 'kEAGLColorFormatRGB565');
end;

function kEAGLColorFormatSRGBA8: NSString;
begin
  Result := CocoaNSStringConst(libOpenGLES, 'kEAGLColorFormatSRGBA8');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

OpenGLESModule := dlopen(MarshaledAString(libOpenGLES), RTLD_LAZY);

finalization

dlclose(OpenGLESModule);
{$ENDIF IOS}

end.
