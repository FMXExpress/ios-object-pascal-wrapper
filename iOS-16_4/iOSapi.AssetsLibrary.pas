{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework AssetsLibrary
//

unit iOSapi.AssetsLibrary;

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
  iOSapi.Foundation;

const
  ALAssetOrientationUp = 0;
  ALAssetOrientationDown = 1;
  ALAssetOrientationLeft = 2;
  ALAssetOrientationRight = 3;
  ALAssetOrientationUpMirrored = 4;
  ALAssetOrientationDownMirrored = 5;
  ALAssetOrientationLeftMirrored = 6;
  ALAssetOrientationRightMirrored = 7;
  ALAssetsGroupLibrary = (1 shl 0);
  ALAssetsGroupAlbum = (1 shl 1);
  ALAssetsGroupEvent = (1 shl 2);
  ALAssetsGroupFaces = (1 shl 3);
  ALAssetsGroupSavedPhotos = (1 shl 4);
  ALAssetsGroupPhotoStream = (1 shl 5);
  ALAssetsGroupAll = 4294967295;
  ALAuthorizationStatusNotDetermined = 0;
  ALAuthorizationStatusRestricted = 1;
  ALAuthorizationStatusDenied = 2;
  ALAuthorizationStatusAuthorized = 3;
  ALAssetsLibraryUnknownError = -1;
  ALAssetsLibraryWriteFailedError = -3300;
  ALAssetsLibraryWriteBusyError = -3301;
  ALAssetsLibraryWriteInvalidDataError = -3302;
  ALAssetsLibraryWriteIncompatibleDataError = -3303;
  ALAssetsLibraryWriteDataEncodingError = -3304;
  ALAssetsLibraryWriteDiskSpaceError = -3305;
  ALAssetsLibraryDataUnavailableError = -3310;
  ALAssetsLibraryAccessUserDeniedError = -3311;
  ALAssetsLibraryAccessGloballyDeniedError = -3312;

type

  // ===== Forward declarations =====
{$M+}
  ALAsset = interface;
  ALAssetsGroup = interface;
  ALAssetsLibrary = interface;
  ALAssetRepresentation = interface;
  ALAssetsFilter = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  ALAssetOrientation = NSInteger;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  ALAssetsGroupType = NSUInteger;
  PALAssetsGroupType = ^ALAssetsGroupType;
  ALAuthorizationStatus = NSInteger;
  ALAssetsLibraryGroupsEnumerationResultsBlock = procedure
    (param1: ALAssetsGroup; param2: PBoolean) of object;
  ALAssetsLibraryAssetForURLResultBlock = procedure(param1: ALAsset) of object;
  ALAssetsLibraryGroupResultBlock = procedure(param1: ALAssetsGroup) of object;
  ALAssetsLibraryAccessFailureBlock = procedure(param1: NSError) of object;
  ALAssetsLibraryWriteImageCompletionBlock = procedure(param1: NSURL;
    param2: NSError) of object;
  ALAssetsLibraryWriteVideoCompletionBlock = procedure(param1: NSURL;
    param2: NSError) of object;
  CGImageRef = Pointer;
  PCGImageRef = ^CGImageRef;
  ALAssetsGroupEnumerationResultsBlock = procedure(param1: ALAsset;
    param2: NSUInteger; param3: PBoolean) of object;
  NSEnumerationOptions = NSUInteger;
  CGFloat = Single;
  PCGFloat = ^CGFloat;

  CGSize = record
    width: CGFloat;
    height: CGFloat;
  end;

  PCGSize = ^CGSize;

  // ===== Interface declarations =====

  ALAssetClass = interface(NSObjectClass)
    ['{20AD0170-AA1A-49C4-8138-E5A77BEEF2C4}']
  end;

  ALAsset = interface(NSObject)
    ['{C8BA19BA-938D-41AF-ABBF-48AF3D4A7F67}']
    function valueForProperty(&property: NSString): Pointer; cdecl;
    function defaultRepresentation: ALAssetRepresentation; cdecl;
    function representationForUTI(representationUTI: NSString)
      : ALAssetRepresentation; cdecl;
    function thumbnail: CGImageRef; cdecl;
    function aspectRatioThumbnail: CGImageRef; cdecl;
    procedure writeModifiedImageDataToSavedPhotosAlbum(imageData: NSData;
      metadata: NSDictionary;
      completionBlock: ALAssetsLibraryWriteImageCompletionBlock); cdecl;
    procedure writeModifiedVideoAtPathToSavedPhotosAlbum(videoPathURL: NSURL;
      completionBlock: ALAssetsLibraryWriteVideoCompletionBlock); cdecl;
    function originalAsset: ALAsset; cdecl;
    function isEditable: Boolean; cdecl;
    procedure setImageData(imageData: NSData; metadata: NSDictionary;
      completionBlock: ALAssetsLibraryWriteImageCompletionBlock); cdecl;
    procedure setVideoAtPath(videoPathURL: NSURL;
      completionBlock: ALAssetsLibraryWriteVideoCompletionBlock); cdecl;
  end;

  TALAsset = class(TOCGenericImport<ALAssetClass, ALAsset>)
  end;

  PALAsset = Pointer;

  ALAssetsGroupClass = interface(NSObjectClass)
    ['{A6D48ED3-2976-4140-B45D-3D9E1DCB41B0}']
  end;

  ALAssetsGroup = interface(NSObject)
    ['{95DF0376-E03A-4470-9CA9-CD1B10DB46FE}']
    function valueForProperty(&property: NSString): Pointer; cdecl;
    function posterImage: CGImageRef; cdecl;
    procedure setAssetsFilter(filter: ALAssetsFilter); cdecl;
    function numberOfAssets: NSInteger; cdecl;
    procedure enumerateAssetsUsingBlock(enumerationBlock
      : ALAssetsGroupEnumerationResultsBlock); cdecl;
    procedure enumerateAssetsWithOptions(options: NSEnumerationOptions;
      usingBlock: ALAssetsGroupEnumerationResultsBlock); cdecl;
    procedure enumerateAssetsAtIndexes(indexSet: NSIndexSet;
      options: NSEnumerationOptions;
      usingBlock: ALAssetsGroupEnumerationResultsBlock); cdecl;
    function isEditable: Boolean; cdecl;
    function addAsset(asset: ALAsset): Boolean; cdecl;
  end;

  TALAssetsGroup = class(TOCGenericImport<ALAssetsGroupClass, ALAssetsGroup>)
  end;

  PALAssetsGroup = Pointer;

  ALAssetsLibraryClass = interface(NSObjectClass)
    ['{C38C14DF-A4F5-42F0-8815-42EAF5E92360}']
    { class } function authorizationStatus: ALAuthorizationStatus; cdecl;
    { class } procedure disableSharedPhotoStreamsSupport; cdecl;
  end;

  ALAssetsLibrary = interface(NSObject)
    ['{C6D9C1F9-3DA4-4E2B-A4F4-5FBBE2E9528B}']
    procedure enumerateGroupsWithTypes(types: ALAssetsGroupType;
      usingBlock: ALAssetsLibraryGroupsEnumerationResultsBlock;
      failureBlock: ALAssetsLibraryAccessFailureBlock); cdecl;
    procedure assetForURL(assetURL: NSURL;
      resultBlock: ALAssetsLibraryAssetForURLResultBlock;
      failureBlock: ALAssetsLibraryAccessFailureBlock); cdecl;
    procedure groupForURL(groupURL: NSURL;
      resultBlock: ALAssetsLibraryGroupResultBlock;
      failureBlock: ALAssetsLibraryAccessFailureBlock); cdecl;
    procedure addAssetsGroupAlbumWithName(name: NSString;
      resultBlock: ALAssetsLibraryGroupResultBlock;
      failureBlock: ALAssetsLibraryAccessFailureBlock); cdecl;
    [MethodName('writeImageToSavedPhotosAlbum:orientation:completionBlock:')]
    procedure writeImageToSavedPhotosAlbumOrientationCompletionBlock
      (imageRef: CGImageRef; orientation: ALAssetOrientation;
      completionBlock: ALAssetsLibraryWriteImageCompletionBlock); cdecl;
    [MethodName('writeImageToSavedPhotosAlbum:metadata:completionBlock:')]
    procedure writeImageToSavedPhotosAlbumMetadataCompletionBlock
      (imageRef: CGImageRef; metadata: NSDictionary;
      completionBlock: ALAssetsLibraryWriteImageCompletionBlock); cdecl;
    procedure writeImageDataToSavedPhotosAlbum(imageData: NSData;
      metadata: NSDictionary;
      completionBlock: ALAssetsLibraryWriteImageCompletionBlock); cdecl;
    procedure writeVideoAtPathToSavedPhotosAlbum(videoPathURL: NSURL;
      completionBlock: ALAssetsLibraryWriteVideoCompletionBlock); cdecl;
    function videoAtPathIsCompatibleWithSavedPhotosAlbum(videoPathURL: NSURL)
      : Boolean; cdecl;
  end;

  TALAssetsLibrary = class(TOCGenericImport<ALAssetsLibraryClass,
    ALAssetsLibrary>)
  end;

  PALAssetsLibrary = Pointer;

  ALAssetRepresentationClass = interface(NSObjectClass)
    ['{BD210834-983D-40BD-A91E-27513A48DBF4}']
  end;

  ALAssetRepresentation = interface(NSObject)
    ['{5247DC2F-706C-40AE-A014-7344E0CA356A}']
    function UTI: NSString; cdecl;
    function dimensions: CGSize; cdecl;
    function size: Int64; cdecl;
    function getBytes(buffer: PByte; fromOffset: Int64; length: NSUInteger;
      error: NSError): NSUInteger; cdecl;
    function fullResolutionImage: CGImageRef; cdecl;
    function CGImageWithOptions(options: NSDictionary): CGImageRef; cdecl;
    function fullScreenImage: CGImageRef; cdecl;
    function url: NSURL; cdecl;
    function metadata: NSDictionary; cdecl;
    function orientation: ALAssetOrientation; cdecl;
    function scale: Single; cdecl;
    function filename: NSString; cdecl;
  end;

  TALAssetRepresentation = class(TOCGenericImport<ALAssetRepresentationClass,
    ALAssetRepresentation>)
  end;

  PALAssetRepresentation = Pointer;

  ALAssetsFilterClass = interface(NSObjectClass)
    ['{17B5C049-5214-49F3-81ED-59CA7D6FB782}']
    { class } function allPhotos: ALAssetsFilter; cdecl;
    { class } function allVideos: ALAssetsFilter; cdecl;
    { class } function allAssets: ALAssetsFilter; cdecl;
  end;

  ALAssetsFilter = interface(NSObject)
    ['{BCF55ABF-56E3-4D27-9C95-A0349A2D7D00}']
  end;

  TALAssetsFilter = class(TOCGenericImport<ALAssetsFilterClass, ALAssetsFilter>)
  end;

  PALAssetsFilter = Pointer;

  // ===== Exported string consts =====

function ALAssetsLibraryChangedNotification: NSString;
function ALAssetLibraryUpdatedAssetsKey: NSString;
function ALAssetLibraryInsertedAssetGroupsKey: NSString;
function ALAssetLibraryUpdatedAssetGroupsKey: NSString;
function ALAssetLibraryDeletedAssetGroupsKey: NSString;
function ALAssetsLibraryErrorDomain: NSString;
function ALErrorInvalidProperty: NSString;
function ALAssetPropertyType: NSString;
function ALAssetPropertyLocation: NSString;
function ALAssetPropertyDuration: NSString;
function ALAssetPropertyOrientation: NSString;
function ALAssetPropertyDate: NSString;
function ALAssetPropertyRepresentations: NSString;
function ALAssetPropertyURLs: NSString;
function ALAssetPropertyAssetURL: NSString;
function ALAssetTypePhoto: NSString;
function ALAssetTypeVideo: NSString;
function ALAssetTypeUnknown: NSString;
function ALAssetsGroupPropertyName: NSString;
function ALAssetsGroupPropertyType: NSString;
function ALAssetsGroupPropertyPersistentID: NSString;
function ALAssetsGroupPropertyURL: NSString;


// ===== External functions =====

const
  libAssetsLibrary =
    '/System/Library/Frameworks/AssetsLibrary.framework/AssetsLibrary';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AssetsLibraryModule: THandle;

{$ENDIF IOS}

function ALAssetsLibraryChangedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary,
    'ALAssetsLibraryChangedNotification');
end;

function ALAssetLibraryUpdatedAssetsKey: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary,
    'ALAssetLibraryUpdatedAssetsKey');
end;

function ALAssetLibraryInsertedAssetGroupsKey: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary,
    'ALAssetLibraryInsertedAssetGroupsKey');
end;

function ALAssetLibraryUpdatedAssetGroupsKey: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary,
    'ALAssetLibraryUpdatedAssetGroupsKey');
end;

function ALAssetLibraryDeletedAssetGroupsKey: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary,
    'ALAssetLibraryDeletedAssetGroupsKey');
end;

function ALAssetsLibraryErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetsLibraryErrorDomain');
end;

function ALErrorInvalidProperty: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALErrorInvalidProperty');
end;

function ALAssetPropertyType: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetPropertyType');
end;

function ALAssetPropertyLocation: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetPropertyLocation');
end;

function ALAssetPropertyDuration: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetPropertyDuration');
end;

function ALAssetPropertyOrientation: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetPropertyOrientation');
end;

function ALAssetPropertyDate: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetPropertyDate');
end;

function ALAssetPropertyRepresentations: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary,
    'ALAssetPropertyRepresentations');
end;

function ALAssetPropertyURLs: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetPropertyURLs');
end;

function ALAssetPropertyAssetURL: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetPropertyAssetURL');
end;

function ALAssetTypePhoto: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetTypePhoto');
end;

function ALAssetTypeVideo: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetTypeVideo');
end;

function ALAssetTypeUnknown: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetTypeUnknown');
end;

function ALAssetsGroupPropertyName: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetsGroupPropertyName');
end;

function ALAssetsGroupPropertyType: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetsGroupPropertyType');
end;

function ALAssetsGroupPropertyPersistentID: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary,
    'ALAssetsGroupPropertyPersistentID');
end;

function ALAssetsGroupPropertyURL: NSString;
begin
  Result := CocoaNSStringConst(libAssetsLibrary, 'ALAssetsGroupPropertyURL');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

AssetsLibraryModule := dlopen(MarshaledAString(libAssetsLibrary), RTLD_LAZY);

finalization

dlclose(AssetsLibraryModule);
{$ENDIF IOS}

end.
