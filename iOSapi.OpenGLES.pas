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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

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
  EAGLRenderingAPI = NSUInteger;
  // ===== Interface declarations =====

  EAGLSharegroupClass = interface(NSObjectClass)
    ['{A2BA2BEB-8D0C-4527-9F19-2B34A087A543}']
  end;

  EAGLSharegroup = interface(NSObject)
    ['{29DF543A-A1D8-4D64-8ACF-D3D09E20C05E}']
    procedure setDebugLabel(debugLabel: NSString); cdecl;
    function debugLabel: NSString; cdecl;
  end;

  TEAGLSharegroup = class(TOCGenericImport<EAGLSharegroupClass, EAGLSharegroup>)
  end;

  PEAGLSharegroup = Pointer;

  EAGLContextClass = interface(NSObjectClass)
    ['{8832DC09-F4C2-4AEA-B08D-330DD1276AF2}']
    { class } function setCurrentContext(context: EAGLContext): Boolean; cdecl;
    { class } function currentContext: EAGLContext; cdecl;
  end;

  EAGLContext = interface(NSObject)
    ['{AE2917EF-2CBD-4139-A55C-4D9E1FFE9C79}']
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
    function presentRenderbuffer(target: NSUInteger): Boolean; cdecl;
  end;

  TEAGLContext = class(TOCGenericImport<EAGLContextClass, EAGLContext>)
  end;

  PEAGLContext = Pointer;

  // ===== Protocol declarations =====

  EAGLDrawable = interface(IObjectiveC)
    ['{57C3E850-9DA3-4F45-9A64-C9F10406391A}']
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
