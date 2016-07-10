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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
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
  ALAssetOrientation = NSInteger;
  NSUInteger = Cardinal;
  ALAssetsGroupType = NSUInteger;
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
  ALAssetsGroupEnumerationResultsBlock = procedure(param1: ALAsset;
    param2: NSUInteger; param3: PBoolean) of object;
  NSEnumerationOptions = NSUInteger;
  CGFloat = Single;
  CGSize = CGSize = record width: CGFloat;
height:
CGFloat;
end;
PCGSize = ^CGSize;;
// ===== Interface declarations =====

ALAssetClass = interface(NSObjectClass)
  ['{D09ED50F-97E6-4B43-A084-8223DFF91D0F}']
end;
ALAsset = interface(NSObject)['{2EBE2D03-13BA-43BE-A4D5-F734AA593D6E}']
function valueForProperty(&property: NSString): Pointer;
cdecl;

function defaultRepresentation: ALAssetRepresentation; cdecl;
  function representationForUTI(representationUTI: NSString)
    : ALAssetRepresentation; cdecl;
    function thumbnail: CGImageRef; cdecl;
      function aspectRatioThumbnail: CGImageRef; cdecl;
        procedure writeModifiedImageDataToSavedPhotosAlbum(imageData: NSData;
          metadata: NSDictionary;
          completionBlock: ALAssetsLibraryWriteImageCompletionBlock); cdecl;
          procedure writeModifiedVideoAtPathToSavedPhotosAlbum
            (videoPathURL: NSURL;
            completionBlock: ALAssetsLibraryWriteVideoCompletionBlock); cdecl;
            function originalAsset: ALAsset; cdecl;
              function isEditable: Boolean; cdecl;
                procedure setImageData(imageData: NSData;
                  metadata: NSDictionary;
                  completionBlock
                  : ALAssetsLibraryWriteImageCompletionBlock); cdecl;
                  procedure setVideoAtPath(videoPathURL: NSURL;
                    completionBlock
                    : ALAssetsLibraryWriteVideoCompletionBlock); cdecl;
                  end;

              TALAsset = class(TOCGenericImport<ALAssetClass, ALAsset>)
              end;
          PALAsset = Pointer;

          ALAssetsGroupClass = interface(NSObjectClass)
            ['{2CD643FA-7485-47BF-A12C-A167C8059806}']
          end;
      ALAssetsGroup = interface(NSObject)
        ['{97039DCD-26B5-496F-AF35-8F7F94826C00}']
      function valueForProperty(&property: NSString): Pointer;
      cdecl;
        function posterImage: CGImageRef; cdecl;
          procedure setAssetsFilter(filter: ALAssetsFilter); cdecl;
            function numberOfAssets: NSInteger; cdecl;
              procedure enumerateAssetsUsingBlock(enumerationBlock
                : ALAssetsGroupEnumerationResultsBlock); cdecl;
                procedure enumerateAssetsWithOptions
                  (options: NSEnumerationOptions;
                  usingBlock: ALAssetsGroupEnumerationResultsBlock); cdecl;
                  procedure enumerateAssetsAtIndexes(indexSet: NSIndexSet;
                    options: NSEnumerationOptions;
                    usingBlock: ALAssetsGroupEnumerationResultsBlock); cdecl;
                    function isEditable: Boolean; cdecl;
                      function addAsset(asset: ALAsset): Boolean; cdecl;
                      end;

                  TALAssetsGroup = class
                    (TOCGenericImport<ALAssetsGroupClass, ALAssetsGroup>)
                  end;
              PALAssetsGroup = Pointer;

              ALAssetsLibraryClass = interface(NSObjectClass)
                ['{C8203772-CA30-4065-976B-31BE3E00781F}']
              { class } function authorizationStatus: ALAuthorizationStatus;
              cdecl;
              { class } procedure disableSharedPhotoStreamsSupport; cdecl;
                end;
            ALAssetsLibrary = interface(NSObject)
              ['{A4FD0B1C-2CED-483D-9697-0D3C01E81BDC}']
            procedure enumerateGroupsWithTypes(types: ALAssetsGroupType;
              usingBlock: ALAssetsLibraryGroupsEnumerationResultsBlock;
              failureBlock: ALAssetsLibraryAccessFailureBlock);
            cdecl;
              procedure assetForURL(assetURL: NSURL;
                resultBlock: ALAssetsLibraryAssetForURLResultBlock;
                failureBlock: ALAssetsLibraryAccessFailureBlock); cdecl;
                procedure groupForURL(groupURL: NSURL;
                  resultBlock: ALAssetsLibraryGroupResultBlock;
                  failureBlock: ALAssetsLibraryAccessFailureBlock); cdecl;
                  procedure addAssetsGroupAlbumWithName(name: NSString;
                    resultBlock: ALAssetsLibraryGroupResultBlock;
                    failureBlock: ALAssetsLibraryAccessFailureBlock); cdecl;
                  [MethodName
                    ('writeImageToSavedPhotosAlbum:orientation:completionBlock:')
                    ]
                    procedure writeImageToSavedPhotosAlbumOrientationCompletionBlock
                      (imageRef: CGImageRef; orientation: ALAssetOrientation;
                      completionBlock
                      : ALAssetsLibraryWriteImageCompletionBlock); cdecl;
                    [MethodName
                      ('writeImageToSavedPhotosAlbum:metadata:completionBlock:')
                      ]
                      procedure writeImageToSavedPhotosAlbumMetadataCompletionBlock
                        (imageRef: CGImageRef; metadata: NSDictionary;
                        completionBlock
                        : ALAssetsLibraryWriteImageCompletionBlock); cdecl;
                        procedure writeImageDataToSavedPhotosAlbum
                          (imageData: NSData; metadata: NSDictionary;
                          completionBlock
                          : ALAssetsLibraryWriteImageCompletionBlock); cdecl;
                          procedure writeVideoAtPathToSavedPhotosAlbum
                            (videoPathURL: NSURL;
                            completionBlock
                            : ALAssetsLibraryWriteVideoCompletionBlock); cdecl;
                            function videoAtPathIsCompatibleWithSavedPhotosAlbum
                              (videoPathURL: NSURL): Boolean; cdecl;
                            end;

                        TALAssetsLibrary = class
                          (TOCGenericImport<ALAssetsLibraryClass,
                          ALAssetsLibrary>)
                        end;
                    PALAssetsLibrary = Pointer;

                    ALAssetRepresentationClass = interface(NSObjectClass)
                      ['{05F47CD4-7913-42D0-B263-4A934D06391D}']
                    end;
                ALAssetRepresentation = interface(NSObject)
                  ['{BDBD62C6-8836-4E67-B667-28B873E0C85D}']
                function UTI: NSString;
                cdecl;
                  function dimensions: CGSize; cdecl;
                    function size: Int64; cdecl;
                      function getBytes(buffer: PByte; fromOffset: Int64;
                        length: NSUInteger; error: NSError): NSUInteger; cdecl;
                        function fullResolutionImage: CGImageRef; cdecl;
                          function CGImageWithOptions(options: NSDictionary)
                            : CGImageRef; cdecl;
                            function fullScreenImage: CGImageRef; cdecl;
                              function url: NSURL; cdecl;
                                function metadata: NSDictionary; cdecl;
                                  function orientation
                                    : ALAssetOrientation; cdecl;
                                    function scale: Single; cdecl;
                                      function filename: NSString; cdecl;
                                      end;

                                  TALAssetRepresentation = class
                                    (TOCGenericImport<
                                    ALAssetRepresentationClass,
                                    ALAssetRepresentation>)
                                  end;
                              PALAssetRepresentation = Pointer;

                              ALAssetsFilterClass = interface(NSObjectClass)
                                ['{3F27E60B-49E3-4DA6-BF77-4DD575E4E0BC}']
                              { class } function allPhotos: ALAssetsFilter;
                              cdecl;
                              { class } function allVideos
                                  : ALAssetsFilter; cdecl;
                                { class } function allAssets
                                    : ALAssetsFilter; cdecl;
                                  end;
                              ALAssetsFilter = interface(NSObject)
                                ['{2346F7AA-40DC-452B-A0B1-62430BC09321}']
                              end;

                          TALAssetsFilter = class
                            (TOCGenericImport<ALAssetsFilterClass,
                            ALAssetsFilter>)
                          end;
                      PALAssetsFilter = Pointer;

                      // ===== Exported string consts =====

                        function ALAssetsLibraryChangedNotification: NSString;
                          function ALAssetLibraryUpdatedAssetsKey: NSString;
                            function ALAssetLibraryInsertedAssetGroupsKey
                              : NSString;
                              function ALAssetLibraryUpdatedAssetGroupsKey
                                : NSString;
                                function ALAssetLibraryDeletedAssetGroupsKey
                                  : NSString;
                                  function ALAssetsLibraryErrorDomain: NSString;
                                    function ALErrorInvalidProperty: NSString;
                                      function ALAssetPropertyType: NSString;
                                        function ALAssetPropertyLocation
                                        : NSString;
                                        function ALAssetPropertyDuration
                                        : NSString;
                                        function ALAssetPropertyOrientation
                                        : NSString;
                                        function ALAssetPropertyDate: NSString;
                                        function ALAssetPropertyRepresentations
                                        : NSString;
                                        function ALAssetPropertyURLs: NSString;
                                        function ALAssetPropertyAssetURL
                                        : NSString;
                                        function ALAssetTypePhoto: NSString;
                                        function ALAssetTypeVideo: NSString;
                                        function ALAssetTypeUnknown: NSString;
                                        function ALAssetsGroupPropertyName
                                        : NSString;
                                        function ALAssetsGroupPropertyType
                                        : NSString;
                                        function ALAssetsGroupPropertyPersistentID
                                        : NSString;
                                        function ALAssetsGroupPropertyURL
                                        : NSString;


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
