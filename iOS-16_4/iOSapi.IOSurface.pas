{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework IOSurface
//

unit iOSapi.IOSurface;

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
  kIOSurfaceLockReadOnly = 1;
  kIOSurfaceLockAvoidSync = 2;
  kIOSurfacePurgeableNonVolatile = 0;
  kIOSurfacePurgeableVolatile = 1;
  kIOSurfacePurgeableEmpty = 2;
  kIOSurfacePurgeableKeepCurrent = 3;
  kIOSurfaceDefaultCache = 0;
  kIOSurfaceInhibitCache = 1;
  kIOSurfaceWriteThruCache = 2;
  kIOSurfaceCopybackCache = 3;
  kIOSurfaceWriteCombineCache = 4;
  kIOSurfaceCopybackInnerCache = 5;
  kIOSurfaceMapCacheShift = 8;
  kIOSurfaceMapDefaultCache = kIOSurfaceDefaultCache shl
    kIOSurfaceMapCacheShift;
  kIOSurfaceMapInhibitCache = kIOSurfaceInhibitCache shl
    kIOSurfaceMapCacheShift;
  kIOSurfaceMapWriteThruCache = kIOSurfaceWriteThruCache shl
    kIOSurfaceMapCacheShift;
  kIOSurfaceMapCopybackCache = kIOSurfaceCopybackCache shl
    kIOSurfaceMapCacheShift;
  kIOSurfaceMapWriteCombineCache = kIOSurfaceWriteCombineCache shl
    kIOSurfaceMapCacheShift;
  kIOSurfaceMapCopybackInnerCache = kIOSurfaceCopybackInnerCache shl
    kIOSurfaceMapCacheShift;
  kIOSurfaceComponentNameUnknown = 0;
  kIOSurfaceComponentNameAlpha = 1;
  kIOSurfaceComponentNameRed = 2;
  kIOSurfaceComponentNameGreen = 3;
  kIOSurfaceComponentNameBlue = 4;
  kIOSurfaceComponentNameLuma = 5;
  kIOSurfaceComponentNameChromaRed = 6;
  kIOSurfaceComponentNameChromaBlue = 7;
  kIOSurfaceComponentTypeUnknown = 0;
  kIOSurfaceComponentTypeUnsignedInteger = 1;
  kIOSurfaceComponentTypeSignedInteger = 2;
  kIOSurfaceComponentTypeFloat = 3;
  kIOSurfaceComponentTypeSignedNormalized = 4;
  kIOSurfaceComponentRangeUnknown = 0;
  kIOSurfaceComponentRangeFullRange = 1;
  kIOSurfaceComponentRangeVideoRange = 2;
  kIOSurfaceComponentRangeWideRange = 3;
  kIOSurfaceSubsamplingUnknown = 0;
  kIOSurfaceSubsamplingNone = 1;
  kIOSurfaceSubsampling422 = 2;
  kIOSurfaceSubsampling420 = 3;
  kIOSurfaceSubsampling411 = 4;

type

  // ===== Forward declarations =====
{$M+}
  IOSurface = interface;

  // ===== Framework typedefs =====
{$M+}
  IOSurfaceID = LongWord;
  PIOSurfaceID = ^IOSurfaceID;
  IOSurfaceLockOptions = LongWord;
  IOSurfacePurgeabilityState = LongWord;
  IOSurfacePropertyKey = NSString;
  PIOSurfacePropertyKey = ^IOSurfacePropertyKey;
  kern_return_t = Integer;
  Pkern_return_t = ^kern_return_t;

  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  FourCharCode = UInt32;
  PFourCharCode = ^FourCharCode;
  OSType = FourCharCode;
  POSType = ^OSType;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  IOSurfaceRef = Pointer;
  PIOSurfaceRef = ^IOSurfaceRef;
  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  IOSurfaceComponentName = Int32;
  IOSurfaceComponentType = Int32;
  IOSurfaceComponentRange = Int32;
  IOSurfaceSubsampling = Int32;
  CFTypeID = LongWord;
  PCFTypeID = ^CFTypeID;

  CFDictionaryRef = Pointer;
  PCFDictionaryRef = ^CFDictionaryRef;
  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  CFTypeRef = Pointer;
  PCFTypeRef = ^CFTypeRef;
  __darwin_natural_t = Cardinal;
  P__darwin_natural_t = ^__darwin_natural_t;

  __darwin_mach_port_name_t = __darwin_natural_t;
  P__darwin_mach_port_name_t = ^__darwin_mach_port_name_t;
  __darwin_mach_port_t = __darwin_mach_port_name_t;
  P__darwin_mach_port_t = ^__darwin_mach_port_t;
  mach_port_t = __darwin_mach_port_t;
  Pmach_port_t = ^mach_port_t;
  Boolean = Byte;
  PBoolean = ^Boolean;

  // ===== Interface declarations =====

  IOSurfaceClass = interface(NSObjectClass)
    ['{7DCC17DB-1241-4621-9B3C-670BB873645E}']
  end;

  IOSurface = interface(NSObject)
    ['{65ACA393-9C25-4FFC-8976-790EAA678634}']
    function initWithProperties(properties: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function lockWithOptions(options: IOSurfaceLockOptions; seed: PLongWord)
      : kern_return_t; cdecl;
    function unlockWithOptions(options: IOSurfaceLockOptions; seed: PLongWord)
      : kern_return_t; cdecl;
    function allocationSize: NSInteger; cdecl;
    function width: NSInteger; cdecl;
    function height: NSInteger; cdecl;
    function baseAddress: Pointer; cdecl;
    function pixelFormat: OSType; cdecl;
    function bytesPerRow: NSInteger; cdecl;
    function bytesPerElement: NSInteger; cdecl;
    function elementWidth: NSInteger; cdecl;
    function elementHeight: NSInteger; cdecl;
    function seed: LongWord; cdecl;
    function planeCount: NSUInteger; cdecl;
    function widthOfPlaneAtIndex(planeIndex: NSUInteger): NSInteger; cdecl;
    function heightOfPlaneAtIndex(planeIndex: NSUInteger): NSInteger; cdecl;
    function bytesPerRowOfPlaneAtIndex(planeIndex: NSUInteger)
      : NSInteger; cdecl;
    function bytesPerElementOfPlaneAtIndex(planeIndex: NSUInteger)
      : NSInteger; cdecl;
    function elementWidthOfPlaneAtIndex(planeIndex: NSUInteger)
      : NSInteger; cdecl;
    function elementHeightOfPlaneAtIndex(planeIndex: NSUInteger)
      : NSInteger; cdecl;
    function baseAddressOfPlaneAtIndex(planeIndex: NSUInteger): Pointer; cdecl;
    procedure setAttachment(anObject: Pointer; forKey: NSString); cdecl;
    function attachmentForKey(key: NSString): Pointer; cdecl;
    procedure removeAttachmentForKey(key: NSString); cdecl;
    procedure setAllAttachments(dict: NSDictionary); cdecl;
    function allAttachments: NSDictionary; cdecl;
    procedure removeAllAttachments; cdecl;
    function isInUse: Boolean; cdecl;
    procedure incrementUseCount; cdecl;
    procedure decrementUseCount; cdecl;
    function localUseCount: Int32; cdecl;
    function allowsPixelSizeCasting: Boolean; cdecl;
    function setPurgeable(newState: IOSurfacePurgeabilityState;
      oldState: PIOSurfacePurgeabilityState): kern_return_t; cdecl;
  end;

  TIOSurface = class(TOCGenericImport<IOSurfaceClass, IOSurface>)
  end;

  PIOSurface = Pointer;

  // ===== Exported string consts =====

function IOSurfacePropertyKeyAllocSize: Pointer;
function IOSurfacePropertyKeyWidth: Pointer;
function IOSurfacePropertyKeyHeight: Pointer;
function IOSurfacePropertyKeyBytesPerRow: Pointer;
function IOSurfacePropertyKeyBytesPerElement: Pointer;
function IOSurfacePropertyKeyElementWidth: Pointer;
function IOSurfacePropertyKeyElementHeight: Pointer;
function IOSurfacePropertyKeyOffset: Pointer;
function IOSurfacePropertyKeyPlaneInfo: Pointer;
function IOSurfacePropertyKeyPlaneWidth: Pointer;
function IOSurfacePropertyKeyPlaneHeight: Pointer;
function IOSurfacePropertyKeyPlaneBytesPerRow: Pointer;
function IOSurfacePropertyKeyPlaneOffset: Pointer;
function IOSurfacePropertyKeyPlaneSize: Pointer;
function IOSurfacePropertyKeyPlaneBase: Pointer;
function IOSurfacePropertyKeyPlaneBytesPerElement: Pointer;
function IOSurfacePropertyKeyPlaneElementWidth: Pointer;
function IOSurfacePropertyKeyPlaneElementHeight: Pointer;
function IOSurfacePropertyKeyCacheMode: Pointer;
function IOSurfacePropertyKeyPixelFormat: Pointer;
function IOSurfacePropertyKeyPixelSizeCastingAllowed: Pointer;
function IOSurfacePropertyKeyName: Pointer;
function IOSurfacePropertyAllocSizeKey: Pointer;
function kIOSurfaceAllocSize: Pointer;
function kIOSurfaceWidth: Pointer;
function kIOSurfaceHeight: Pointer;
function kIOSurfaceBytesPerRow: Pointer;
function kIOSurfaceBytesPerElement: Pointer;
function kIOSurfaceElementWidth: Pointer;
function kIOSurfaceElementHeight: Pointer;
function kIOSurfaceOffset: Pointer;
function kIOSurfacePlaneInfo: Pointer;
function kIOSurfacePlaneWidth: Pointer;
function kIOSurfacePlaneHeight: Pointer;
function kIOSurfacePlaneBytesPerRow: Pointer;
function kIOSurfacePlaneOffset: Pointer;
function kIOSurfacePlaneSize: Pointer;
function kIOSurfacePlaneBase: Pointer;
function kIOSurfacePlaneBitsPerElement: Pointer;
function kIOSurfacePlaneBytesPerElement: Pointer;
function kIOSurfacePlaneElementWidth: Pointer;
function kIOSurfacePlaneElementHeight: Pointer;
function kIOSurfaceCacheMode: Pointer;
function kIOSurfaceIsGlobal: Pointer;
function kIOSurfacePixelFormat: Pointer;
function kIOSurfacePixelSizeCastingAllowed: Pointer;
function kIOSurfacePlaneComponentBitDepths: Pointer;
function kIOSurfacePlaneComponentBitOffsets: Pointer;
function kIOSurfaceName: Pointer;
function kIOSurfacePlaneComponentNames: Pointer;
function kIOSurfacePlaneComponentTypes: Pointer;
function kIOSurfacePlaneComponentRanges: Pointer;
function kIOSurfaceSubsampling: Pointer;
function kIOSurfaceColorSpace: Pointer;
function kIOSurfaceICCProfile: Pointer;


// ===== External functions =====

const
  libIOSurface = '/System/Library/Frameworks/IOSurface.framework/IOSurface';
function IOSurfaceGetTypeID: CFTypeID; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetTypeID';
function IOSurfaceCreate(properties: CFDictionaryRef): IOSurfaceRef; cdecl;
  external libIOSurface name _PU + 'IOSurfaceCreate';
function IOSurfaceLookup(csid: IOSurfaceID): IOSurfaceRef; cdecl;
  external libIOSurface name _PU + 'IOSurfaceLookup';
function IOSurfaceGetID(buffer: IOSurfaceRef): IOSurfaceID; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetID';
function IOSurfaceLock(buffer: IOSurfaceRef; options: IOSurfaceLockOptions;
  seed: PLongWord): kern_return_t; cdecl;
  external libIOSurface name _PU + 'IOSurfaceLock';
function IOSurfaceUnlock(buffer: IOSurfaceRef; options: IOSurfaceLockOptions;
  seed: PLongWord): kern_return_t; cdecl;
  external libIOSurface name _PU + 'IOSurfaceUnlock';
function IOSurfaceGetAllocSize(buffer: IOSurfaceRef): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetAllocSize';
function IOSurfaceGetWidth(buffer: IOSurfaceRef): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetWidth';
function IOSurfaceGetHeight(buffer: IOSurfaceRef): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetHeight';
function IOSurfaceGetBytesPerElement(buffer: IOSurfaceRef): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetBytesPerElement';
function IOSurfaceGetBytesPerRow(buffer: IOSurfaceRef): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetBytesPerRow';
function IOSurfaceGetBaseAddress(buffer: IOSurfaceRef): Pointer; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetBaseAddress';
function IOSurfaceGetElementWidth(buffer: IOSurfaceRef): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetElementWidth';
function IOSurfaceGetElementHeight(buffer: IOSurfaceRef): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetElementHeight';
function IOSurfaceGetPixelFormat(buffer: IOSurfaceRef): OSType; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetPixelFormat';
function IOSurfaceGetSeed(buffer: IOSurfaceRef): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetSeed';
function IOSurfaceGetPlaneCount(buffer: IOSurfaceRef): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetPlaneCount';
function IOSurfaceGetWidthOfPlane(buffer: IOSurfaceRef; planeIndex: LongWord)
  : LongWord; cdecl; external libIOSurface name _PU +
  'IOSurfaceGetWidthOfPlane';
function IOSurfaceGetHeightOfPlane(buffer: IOSurfaceRef; planeIndex: LongWord)
  : LongWord; cdecl; external libIOSurface name _PU +
  'IOSurfaceGetHeightOfPlane';
function IOSurfaceGetBytesPerElementOfPlane(buffer: IOSurfaceRef;
  planeIndex: LongWord): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetBytesPerElementOfPlane';
function IOSurfaceGetBytesPerRowOfPlane(buffer: IOSurfaceRef;
  planeIndex: LongWord): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetBytesPerRowOfPlane';
function IOSurfaceGetBaseAddressOfPlane(buffer: IOSurfaceRef;
  planeIndex: LongWord): Pointer; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetBaseAddressOfPlane';
function IOSurfaceGetElementWidthOfPlane(buffer: IOSurfaceRef;
  planeIndex: LongWord): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetElementWidthOfPlane';
function IOSurfaceGetElementHeightOfPlane(buffer: IOSurfaceRef;
  planeIndex: LongWord): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetElementHeightOfPlane';
function IOSurfaceGetNumberOfComponentsOfPlane(buffer: IOSurfaceRef;
  planeIndex: LongWord): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetNumberOfComponentsOfPlane';
function IOSurfaceGetNameOfComponentOfPlane(buffer: IOSurfaceRef;
  planeIndex: LongWord; componentIndex: LongWord): IOSurfaceComponentName;
  cdecl; external libIOSurface name _PU + 'IOSurfaceGetNameOfComponentOfPlane';
function IOSurfaceGetTypeOfComponentOfPlane(buffer: IOSurfaceRef;
  planeIndex: LongWord; componentIndex: LongWord): IOSurfaceComponentType;
  cdecl; external libIOSurface name _PU + 'IOSurfaceGetTypeOfComponentOfPlane';
function IOSurfaceGetRangeOfComponentOfPlane(buffer: IOSurfaceRef;
  planeIndex: LongWord; componentIndex: LongWord): IOSurfaceComponentRange;
  cdecl; external libIOSurface name _PU + 'IOSurfaceGetRangeOfComponentOfPlane';
function IOSurfaceGetBitDepthOfComponentOfPlane(buffer: IOSurfaceRef;
  planeIndex: LongWord; componentIndex: LongWord): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetBitDepthOfComponentOfPlane';
function IOSurfaceGetBitOffsetOfComponentOfPlane(buffer: IOSurfaceRef;
  planeIndex: LongWord; componentIndex: LongWord): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetBitOffsetOfComponentOfPlane';
function IOSurfaceGetSubsampling(buffer: IOSurfaceRef): IOSurfaceSubsampling;
  cdecl; external libIOSurface name _PU + 'IOSurfaceGetSubsampling';
procedure IOSurfaceSetValue(buffer: IOSurfaceRef; key: CFStringRef;
  value: CFTypeRef); cdecl;
  external libIOSurface name _PU + 'IOSurfaceSetValue';
function IOSurfaceCopyValue(buffer: IOSurfaceRef; key: CFStringRef): CFTypeRef;
  cdecl; external libIOSurface name _PU + 'IOSurfaceCopyValue';
procedure IOSurfaceRemoveValue(buffer: IOSurfaceRef; key: CFStringRef); cdecl;
  external libIOSurface name _PU + 'IOSurfaceRemoveValue';
procedure IOSurfaceSetValues(buffer: IOSurfaceRef;
  keysAndValues: CFDictionaryRef); cdecl;
  external libIOSurface name _PU + 'IOSurfaceSetValues';
function IOSurfaceCopyAllValues(buffer: IOSurfaceRef): CFDictionaryRef; cdecl;
  external libIOSurface name _PU + 'IOSurfaceCopyAllValues';
procedure IOSurfaceRemoveAllValues(buffer: IOSurfaceRef); cdecl;
  external libIOSurface name _PU + 'IOSurfaceRemoveAllValues';
function IOSurfaceCreateMachPort(buffer: IOSurfaceRef): mach_port_t; cdecl;
  external libIOSurface name _PU + 'IOSurfaceCreateMachPort';
function IOSurfaceLookupFromMachPort(port: mach_port_t): IOSurfaceRef; cdecl;
  external libIOSurface name _PU + 'IOSurfaceLookupFromMachPort';
function IOSurfaceGetPropertyMaximum(&property: CFStringRef): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetPropertyMaximum';
function IOSurfaceGetPropertyAlignment(&property: CFStringRef): LongWord; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetPropertyAlignment';
function IOSurfaceAlignProperty(&property: CFStringRef; value: LongWord)
  : LongWord; cdecl; external libIOSurface name _PU + 'IOSurfaceAlignProperty';
procedure IOSurfaceIncrementUseCount(buffer: IOSurfaceRef); cdecl;
  external libIOSurface name _PU + 'IOSurfaceIncrementUseCount';
procedure IOSurfaceDecrementUseCount(buffer: IOSurfaceRef); cdecl;
  external libIOSurface name _PU + 'IOSurfaceDecrementUseCount';
function IOSurfaceGetUseCount(buffer: IOSurfaceRef): Int32; cdecl;
  external libIOSurface name _PU + 'IOSurfaceGetUseCount';
function IOSurfaceIsInUse(buffer: IOSurfaceRef): Boolean; cdecl;
  external libIOSurface name _PU + 'IOSurfaceIsInUse';
function IOSurfaceAllowsPixelSizeCasting(buffer: IOSurfaceRef): Boolean; cdecl;
  external libIOSurface name _PU + 'IOSurfaceAllowsPixelSizeCasting';
function IOSurfaceSetPurgeable(buffer: IOSurfaceRef; newState: LongWord;
  oldState: PLongWord): kern_return_t; cdecl;
  external libIOSurface name _PU + 'IOSurfaceSetPurgeable';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  IOSurfaceModule: THandle;

{$ENDIF IOS}

function IOSurfacePropertyKeyAllocSize: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyAllocSize');
end;

function IOSurfacePropertyKeyWidth: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyWidth');
end;

function IOSurfacePropertyKeyHeight: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyHeight');
end;

function IOSurfacePropertyKeyBytesPerRow: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyBytesPerRow');
end;

function IOSurfacePropertyKeyBytesPerElement: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface,
    'IOSurfacePropertyKeyBytesPerElement');
end;

function IOSurfacePropertyKeyElementWidth: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyElementWidth');
end;

function IOSurfacePropertyKeyElementHeight: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface,
    'IOSurfacePropertyKeyElementHeight');
end;

function IOSurfacePropertyKeyOffset: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyOffset');
end;

function IOSurfacePropertyKeyPlaneInfo: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyPlaneInfo');
end;

function IOSurfacePropertyKeyPlaneWidth: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyPlaneWidth');
end;

function IOSurfacePropertyKeyPlaneHeight: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyPlaneHeight');
end;

function IOSurfacePropertyKeyPlaneBytesPerRow: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface,
    'IOSurfacePropertyKeyPlaneBytesPerRow');
end;

function IOSurfacePropertyKeyPlaneOffset: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyPlaneOffset');
end;

function IOSurfacePropertyKeyPlaneSize: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyPlaneSize');
end;

function IOSurfacePropertyKeyPlaneBase: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyPlaneBase');
end;

function IOSurfacePropertyKeyPlaneBytesPerElement: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface,
    'IOSurfacePropertyKeyPlaneBytesPerElement');
end;

function IOSurfacePropertyKeyPlaneElementWidth: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface,
    'IOSurfacePropertyKeyPlaneElementWidth');
end;

function IOSurfacePropertyKeyPlaneElementHeight: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface,
    'IOSurfacePropertyKeyPlaneElementHeight');
end;

function IOSurfacePropertyKeyCacheMode: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyCacheMode');
end;

function IOSurfacePropertyKeyPixelFormat: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyPixelFormat');
end;

function IOSurfacePropertyKeyPixelSizeCastingAllowed: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface,
    'IOSurfacePropertyKeyPixelSizeCastingAllowed');
end;

function IOSurfacePropertyKeyName: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyKeyName');
end;

function IOSurfacePropertyAllocSizeKey: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'IOSurfacePropertyAllocSizeKey');
end;

function kIOSurfaceAllocSize: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceAllocSize');
end;

function kIOSurfaceWidth: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceWidth');
end;

function kIOSurfaceHeight: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceHeight');
end;

function kIOSurfaceBytesPerRow: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceBytesPerRow');
end;

function kIOSurfaceBytesPerElement: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceBytesPerElement');
end;

function kIOSurfaceElementWidth: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceElementWidth');
end;

function kIOSurfaceElementHeight: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceElementHeight');
end;

function kIOSurfaceOffset: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceOffset');
end;

function kIOSurfacePlaneInfo: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneInfo');
end;

function kIOSurfacePlaneWidth: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneWidth');
end;

function kIOSurfacePlaneHeight: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneHeight');
end;

function kIOSurfacePlaneBytesPerRow: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneBytesPerRow');
end;

function kIOSurfacePlaneOffset: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneOffset');
end;

function kIOSurfacePlaneSize: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneSize');
end;

function kIOSurfacePlaneBase: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneBase');
end;

function kIOSurfacePlaneBitsPerElement: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneBitsPerElement');
end;

function kIOSurfacePlaneBytesPerElement: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneBytesPerElement');
end;

function kIOSurfacePlaneElementWidth: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneElementWidth');
end;

function kIOSurfacePlaneElementHeight: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneElementHeight');
end;

function kIOSurfaceCacheMode: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceCacheMode');
end;

function kIOSurfaceIsGlobal: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceIsGlobal');
end;

function kIOSurfacePixelFormat: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePixelFormat');
end;

function kIOSurfacePixelSizeCastingAllowed: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface,
    'kIOSurfacePixelSizeCastingAllowed');
end;

function kIOSurfacePlaneComponentBitDepths: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface,
    'kIOSurfacePlaneComponentBitDepths');
end;

function kIOSurfacePlaneComponentBitOffsets: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface,
    'kIOSurfacePlaneComponentBitOffsets');
end;

function kIOSurfaceName: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceName');
end;

function kIOSurfacePlaneComponentNames: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneComponentNames');
end;

function kIOSurfacePlaneComponentTypes: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneComponentTypes');
end;

function kIOSurfacePlaneComponentRanges: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfacePlaneComponentRanges');
end;

function kIOSurfaceSubsampling: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceSubsampling');
end;

function kIOSurfaceColorSpace: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceColorSpace');
end;

function kIOSurfaceICCProfile: Pointer;
begin
  Result := CocoaPointerConst(libIOSurface, 'kIOSurfaceICCProfile');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

IOSurfaceModule := dlopen(MarshaledAString(libIOSurface), RTLD_LAZY);

finalization

dlclose(IOSurfaceModule);
{$ENDIF IOS}

end.
