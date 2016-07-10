{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework Photos
//

unit iOSapi.Photos;

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
  iOSapi.CoreLocation,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  PHImageContentModeAspectFit = 0;
  PHImageContentModeAspectFill = 1;
  PHImageContentModeDefault = PHImageContentModeAspectFit;
  PHCollectionListTypeMomentList = 1;
  PHCollectionListTypeFolder = 2;
  PHCollectionListTypeSmartFolder = 3;
  PHCollectionListSubtypeMomentListCluster = 1;
  PHCollectionListSubtypeMomentListYear = 2;
  PHCollectionListSubtypeRegularFolder = 100;
  PHCollectionListSubtypeSmartFolderEvents = 200;
  PHCollectionListSubtypeSmartFolderFaces = 201;
  PHCollectionListSubtypeAny = 2147483647;
  PHCollectionEditOperationDeleteContent = 1;
  PHCollectionEditOperationRemoveContent = 2;
  PHCollectionEditOperationAddContent = 3;
  PHCollectionEditOperationCreateContent = 4;
  PHCollectionEditOperationRearrangeContent = 5;
  PHCollectionEditOperationDelete = 6;
  PHCollectionEditOperationRename = 7;
  PHAssetCollectionTypeAlbum = 1;
  PHAssetCollectionTypeSmartAlbum = 2;
  PHAssetCollectionTypeMoment = 3;
  PHAssetCollectionSubtypeAlbumRegular = 2;
  PHAssetCollectionSubtypeAlbumSyncedEvent = 3;
  PHAssetCollectionSubtypeAlbumSyncedFaces = 4;
  PHAssetCollectionSubtypeAlbumSyncedAlbum = 5;
  PHAssetCollectionSubtypeAlbumImported = 6;
  PHAssetCollectionSubtypeAlbumMyPhotoStream = 100;
  PHAssetCollectionSubtypeAlbumCloudShared = 101;
  PHAssetCollectionSubtypeSmartAlbumGeneric = 200;
  PHAssetCollectionSubtypeSmartAlbumPanoramas = 201;
  PHAssetCollectionSubtypeSmartAlbumVideos = 202;
  PHAssetCollectionSubtypeSmartAlbumFavorites = 203;
  PHAssetCollectionSubtypeSmartAlbumTimelapses = 204;
  PHAssetCollectionSubtypeSmartAlbumAllHidden = 205;
  PHAssetCollectionSubtypeSmartAlbumRecentlyAdded = 206;
  PHAssetCollectionSubtypeSmartAlbumBursts = 207;
  PHAssetCollectionSubtypeSmartAlbumSlomoVideos = 208;
  PHAssetCollectionSubtypeSmartAlbumUserLibrary = 209;
  PHAssetCollectionSubtypeSmartAlbumSelfPortraits = 210;
  PHAssetCollectionSubtypeSmartAlbumScreenshots = 211;
  PHAssetCollectionSubtypeAny = 2147483647;
  PHAssetEditOperationDelete = 1;
  PHAssetEditOperationContent = 2;
  PHAssetEditOperationProperties = 3;
  PHAssetMediaTypeUnknown = 0;
  PHAssetMediaTypeImage = 1;
  PHAssetMediaTypeVideo = 2;
  PHAssetMediaTypeAudio = 3;
  PHAssetMediaSubtypeNone = 0;
  PHAssetMediaSubtypePhotoPanorama = (1 shl 0);
  PHAssetMediaSubtypePhotoHDR = (1 shl 1);
  PHAssetMediaSubtypePhotoScreenshot = (1 shl 2);
  PHAssetMediaSubtypePhotoLive = (1 shl 3);
  PHAssetMediaSubtypeVideoStreamed = (1 shl 16);
  PHAssetMediaSubtypeVideoHighFrameRate = (1 shl 17);
  PHAssetMediaSubtypeVideoTimelapse = (1 shl 18);
  PHAssetBurstSelectionTypeNone = 0;
  PHAssetBurstSelectionTypeAutoPick = (1 shl 0);
  PHAssetBurstSelectionTypeUserPick = (1 shl 1);
  PHAssetSourceTypeNone = 0;
  PHAssetSourceTypeUserLibrary = (1 shl 0);
  PHAssetSourceTypeCloudShared = (1 shl 1);
  PHAssetSourceTypeiTunesSynced = (1 shl 2);
  PHAssetResourceTypePhoto = 1;
  PHAssetResourceTypeVideo = 2;
  PHAssetResourceTypeAudio = 3;
  PHAssetResourceTypeAlternatePhoto = 4;
  PHAssetResourceTypeFullSizePhoto = 5;
  PHAssetResourceTypeFullSizeVideo = 6;
  PHAssetResourceTypeAdjustmentData = 7;
  PHAssetResourceTypeAdjustmentBasePhoto = 8;
  PHAssetResourceTypePairedVideo = 9;
  PHAuthorizationStatusNotDetermined = 0;
  PHAuthorizationStatusRestricted = 1;
  PHAuthorizationStatusDenied = 2;
  PHAuthorizationStatusAuthorized = 3;
  PHImageRequestOptionsVersionCurrent = 0;
  PHImageRequestOptionsVersionUnadjusted = 1;
  PHImageRequestOptionsVersionOriginal = 2;
  PHImageRequestOptionsDeliveryModeOpportunistic = 0;
  PHImageRequestOptionsDeliveryModeHighQualityFormat = 1;
  PHImageRequestOptionsDeliveryModeFastFormat = 2;
  PHImageRequestOptionsResizeModeNone = 0;
  PHImageRequestOptionsResizeModeFast = 1;
  PHImageRequestOptionsResizeModeExact = 2;
  PHVideoRequestOptionsVersionCurrent = 0;
  PHVideoRequestOptionsVersionOriginal = 1;
  PHVideoRequestOptionsDeliveryModeAutomatic = 0;
  PHVideoRequestOptionsDeliveryModeHighQualityFormat = 1;
  PHVideoRequestOptionsDeliveryModeMediumQualityFormat = 2;
  PHVideoRequestOptionsDeliveryModeFastFormat = 3;

type

  // ===== Forward declarations =====
{$M+}
  PHAdjustmentData = interface;
  PHPhotoLibrary = interface;
  PHObject = interface;
  PHObjectPlaceholder = interface;
  PHFetchResult = interface;
  PHChange = interface;
  PHPhotoLibraryChangeObserver = interface;
  PHFetchOptions = interface;
  PHAssetCollection = interface;
  PHAsset = interface;
  PHContentEditingInput = interface;
  PHContentEditingOutput = interface;
  PHAssetResource = interface;
  PHContentEditingInputRequestOptions = interface;
  PHAssetChangeRequest = interface;
  PHAssetCollectionChangeRequest = interface;
  PHAssetResourceCreationOptions = interface;
  PHAssetCreationRequest = interface;
  PHLivePhoto = interface;
  PHAssetResourceRequestOptions = interface;
  PHAssetResourceManager = interface;
  PHObjectChangeDetails = interface;
  PHFetchResultChangeDetails = interface;
  PHCollectionList = interface;
  PHCollection = interface;
  PHCollectionListChangeRequest = interface;
  PHImageRequestOptions = interface;
  PHLivePhotoRequestOptions = interface;
  PHVideoRequestOptions = interface;
  PHImageManager = interface;
  PHCachingImageManager = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PHImageContentMode = NSInteger;
  PHCollectionListType = NSInteger;
  PHCollectionListSubtype = NSInteger;
  PHCollectionEditOperation = NSInteger;
  PHAssetCollectionType = NSInteger;
  PHAssetCollectionSubtype = NSInteger;
  PHAssetEditOperation = NSInteger;
  PHAssetMediaType = NSInteger;
  NSUInteger = Cardinal;
  PHAssetMediaSubtype = NSUInteger;
  PHAssetBurstSelectionType = NSUInteger;
  PHAssetSourceType = NSUInteger;
  PHAssetResourceType = NSInteger;
  ObjectType = Pointer;
  NSRange = _NSRange = record location: NSUInteger;
length:
NSUInteger;
end;
P_NSRange = ^_NSRange;;
TPhotosBlock =
procedure(param1: ObjectType; param2: NSUInteger; param3: PBoolean) of object;
NSEnumerationOptions = NSUInteger;
PHAuthorizationStatus = NSInteger;
TPhotosHandler =
procedure(param1: PHAuthorizationStatus) of object;
TPhotosCompletionHandler =
procedure(param1: Boolean; param2: NSError) of object;
NSTimeInterval = Double;
PHContentEditingInputRequestID = NSUInteger;
TPhotosCanHandleAdjustmentData =
function(param1: PHAdjustmentData): Boolean;
cdecl;
TPhotosProgressHandler =
procedure(param1: Double; param2: PBoolean) of object;
TPhotosCompletionHandler1 =
procedure(param1: PHContentEditingInput; param2: NSDictionary) of object;
PHAssetResourceDataRequestID = Int32;
PHAssetResourceProgressHandler =
procedure(param1: Double) of object;
TPhotosDataReceivedHandler =
procedure(param1: NSData) of object;
TPhotosCompletionHandler2 =
procedure(param1: NSError) of object;
TPhotosHandler1 =
procedure(param1: NSUInteger; param2: NSUInteger) of object;
PHImageRequestOptionsVersion = NSInteger;
PHImageRequestOptionsDeliveryMode = NSInteger;
PHImageRequestOptionsResizeMode = NSInteger;
PHAssetImageProgressHandler =
procedure(param1: Double; param2: NSError; param3: PBoolean;
  param4: NSDictionary) of object;
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
PHVideoRequestOptionsVersion = NSInteger;
PHVideoRequestOptionsDeliveryMode = NSInteger;
PHAssetVideoProgressHandler =
procedure(param1: Double; param2: NSError; param3: PBoolean;
  param4: NSDictionary) of object;
PHImageRequestID = Int32;
TPhotosResultHandler =
procedure(param1: UIImage; param2: NSDictionary) of object;
UIImageOrientation = NSInteger;
TPhotosResultHandler1 =
procedure(param1: NSData; param2: NSString; param3: UIImageOrientation;
  param4: NSDictionary) of object;
TPhotosResultHandler2 =
procedure(param1: PHLivePhoto; param2: NSDictionary) of object;
TPhotosResultHandler3 =
procedure(param1: AVPlayerItem; param2: NSDictionary) of object;
TPhotosResultHandler4 =
procedure(param1: AVAssetExportSession; param2: NSDictionary) of object;
TPhotosResultHandler5 =
procedure(param1: AVAsset; param2: AVAudioMix; param3: NSDictionary) of object;
PHLivePhotoRequestID = Int32;
// ===== Interface declarations =====

PHAdjustmentDataClass = interface(NSObjectClass)
  ['{B3D15165-2EA7-49CF-A58C-2F89BEE72F9B}']
end;
PHAdjustmentData = interface(NSObject)['{01950C39-520E-4E86-9C00-C91971521C3A}']
function initWithFormatIdentifier(formatIdentifier: NSString;
  formatVersion: NSString; data: NSData): Pointer { instancetype };
cdecl;

function formatIdentifier: NSString; cdecl;
  function formatVersion: NSString; cdecl;
    function data: NSData; cdecl;
    end;

TPHAdjustmentData = class(TOCGenericImport<PHAdjustmentDataClass,
  PHAdjustmentData>)
end;
PPHAdjustmentData = Pointer;

PHPhotoLibraryClass = interface(NSObjectClass)
  ['{8699908B-72D8-4741-832B-FF7654998CB4}']
{ class } function sharedPhotoLibrary: PHPhotoLibrary;
cdecl;

{ class } function authorizationStatus: PHAuthorizationStatus; cdecl;
{ class } procedure requestAuthorization(handler: TPhotosHandler); cdecl;
  end;
PHPhotoLibrary = interface(NSObject)['{70A2B38D-8CCF-4AE2-8A5F-14BE55BA6968}']
procedure performChanges(changeBlock: Pointer { dispatch_block_t };
  completionHandler: TPhotosCompletionHandler);
cdecl;

function performChangesAndWait(changeBlock: Pointer { dispatch_block_t };
  error: NSError): Boolean; cdecl;
  procedure registerChangeObserver(observer: Pointer); cdecl;
    procedure unregisterChangeObserver(observer: Pointer); cdecl;
    end;

TPHPhotoLibrary = class(TOCGenericImport<PHPhotoLibraryClass, PHPhotoLibrary>)
end;
PPHPhotoLibrary = Pointer;

PHObjectClass = interface(NSObjectClass)
  ['{243DBB2F-C08B-4F1F-B3FF-82A390854D6E}']
end;
PHObject = interface(NSObject)['{05A74248-AC25-4DDA-B7F9-4459635F21CE}']
function localIdentifier: NSString;
cdecl;
end;

TPHObject = class(TOCGenericImport<PHObjectClass, PHObject>)
end;
PPHObject = Pointer;

PHObjectPlaceholderClass = interface(PHObjectClass)
  ['{C59F68F5-3F03-438D-8F90-6A294A0F08FE}']
end;
PHObjectPlaceholder = interface(PHObject)
  ['{D9180B92-4BD4-4EF8-9BE5-E4B54CDE5EAC}']
end;

TPHObjectPlaceholder = class(TOCGenericImport<PHObjectPlaceholderClass,
  PHObjectPlaceholder>)
end;
PPHObjectPlaceholder = Pointer;

PHFetchResultClass = interface(NSObjectClass)
  ['{0084D8BC-6869-482F-8BA4-C2F03E4FE5D5}']
end;
PHFetchResult = interface(NSObject)['{77DD7531-471B-4FA4-843F-6598FA49ACBB}']
function count: NSUInteger;
cdecl;

function objectAtIndex(index: NSUInteger): ObjectType; cdecl;
  function objectAtIndexedSubscript(idx: NSUInteger): ObjectType; cdecl;
    function containsObject(anObject: ObjectType): Boolean; cdecl;
    [MethodName('indexOfObject:')]
      function indexOfObject(anObject: ObjectType): NSUInteger; cdecl;
      [MethodName('indexOfObject:inRange:')]
        function indexOfObjectInRange(anObject: ObjectType; inRange: NSRange)
          : NSUInteger; cdecl;
          function firstObject: ObjectType; cdecl;
            function lastObject: ObjectType; cdecl;
              function objectsAtIndexes(indexes: NSIndexSet): NSArray; cdecl;
                procedure enumerateObjectsUsingBlock
                  (block: TPhotosBlock); cdecl;
                  procedure enumerateObjectsWithOptions
                    (opts: NSEnumerationOptions;
                    usingBlock: TPhotosBlock); cdecl;
                    procedure enumerateObjectsAtIndexes(s: NSIndexSet;
                      options: NSEnumerationOptions;
                      usingBlock: TPhotosBlock); cdecl;
                      function countOfAssetsWithMediaType
                        (mediaType: PHAssetMediaType): NSUInteger; cdecl;
                      end;

                  TPHFetchResult = class
                    (TOCGenericImport<PHFetchResultClass, PHFetchResult>)
                  end;
              PPHFetchResult = Pointer;

              PHChangeClass = interface(NSObjectClass)
                ['{41834DB6-7884-4A5E-8F7F-F3B5A1760DE2}']
              end;
          PHChange = interface(NSObject)
            ['{AFAA2659-941D-4AE4-9464-EF9AFD972C80}']
          function changeDetailsForObject(&object: PHObject)
            : PHObjectChangeDetails;
          cdecl;
            function changeDetailsForFetchResult(&object: PHFetchResult)
              : PHFetchResultChangeDetails; cdecl;
            end;

        TPHChange = class(TOCGenericImport<PHChangeClass, PHChange>)
        end;
    PPHChange = Pointer;

    PHFetchOptionsClass = interface(NSObjectClass)
      ['{401C8839-0858-4ACA-8841-449050087225}']
    end;
PHFetchOptions = interface(NSObject)['{EE0B3BEB-98BA-4B42-B9FD-17B65227CD67}']
procedure setPredicate(predicate: NSPredicate);
cdecl;
  function predicate: NSPredicate; cdecl;
    procedure setSortDescriptors(sortDescriptors: NSArray); cdecl;
      function sortDescriptors: NSArray; cdecl;
        procedure setIncludeHiddenAssets(includeHiddenAssets: Boolean); cdecl;
          function includeHiddenAssets: Boolean; cdecl;
            procedure setIncludeAllBurstAssets(includeAllBurstAssets
              : Boolean); cdecl;
              function includeAllBurstAssets: Boolean; cdecl;
                procedure setIncludeAssetSourceTypes(includeAssetSourceTypes
                  : PHAssetSourceType); cdecl;
                  function includeAssetSourceTypes: PHAssetSourceType; cdecl;
                    procedure setFetchLimit(fetchLimit: NSUInteger); cdecl;
                      function fetchLimit: NSUInteger; cdecl;
                        procedure setWantsIncrementalChangeDetails
                          (wantsIncrementalChangeDetails: Boolean); cdecl;
                          function wantsIncrementalChangeDetails
                            : Boolean; cdecl;
                          end;

                      TPHFetchOptions = class
                        (TOCGenericImport<PHFetchOptionsClass, PHFetchOptions>)
                      end;
                  PPHFetchOptions = Pointer;

                  PHCollectionClass = interface(PHObjectClass)
                    ['{2C6FBECA-36B6-4125-9DEB-041701EBDFD7}']
                  { class } function fetchCollectionsInCollectionList
                    (collectionList: PHCollectionList; options: PHFetchOptions)
                    : PHFetchResult;
                  cdecl;
                  { class } function fetchTopLevelUserCollectionsWithOptions
                      (options: PHFetchOptions): PHFetchResult; cdecl;
                    end;
                PHCollection = interface(PHObject)
                  ['{97B5B29D-3580-42F0-B7E5-9CB10BA907BD}']
                function canContainAssets: Boolean;
                cdecl;
                  function canContainCollections: Boolean; cdecl;
                    function localizedTitle: NSString; cdecl;
                      function canPerformEditOperation
                        (anOperation: PHCollectionEditOperation)
                        : Boolean; cdecl;
                      end;

                  TPHCollection = class
                    (TOCGenericImport<PHCollectionClass, PHCollection>)
                  end;
              PPHCollection = Pointer;

              PHAssetCollectionClass = interface(PHCollectionClass)
                ['{5C0C33F9-DC08-46E9-949C-80C155A7F6A9}']
              { class } function fetchAssetCollectionsWithLocalIdentifiers
                (identifiers: NSArray; options: PHFetchOptions): PHFetchResult;
              cdecl;
              { class } function fetchAssetCollectionsWithType
                  (&type: PHAssetCollectionType;
                  subtype: PHAssetCollectionSubtype; options: PHFetchOptions)
                  : PHFetchResult; cdecl;
                { class } function fetchAssetCollectionsContainingAsset
                    (asset: PHAsset; withType: PHAssetCollectionType;
                    options: PHFetchOptions): PHFetchResult; cdecl;
                  { class } function fetchAssetCollectionsWithALAssetGroupURLs
                      (assetGroupURLs: NSArray; options: PHFetchOptions)
                      : PHFetchResult; cdecl;
                    { class } function fetchMomentsInMomentList
                        (momentList: PHCollectionList; options: PHFetchOptions)
                        : PHFetchResult; cdecl;
                      { class } function fetchMomentsWithOptions
                          (options: PHFetchOptions): PHFetchResult; cdecl;
                        { class } function transientAssetCollectionWithAssets
                            (assets: NSArray; title: NSString)
                            : PHAssetCollection; cdecl;
                          { class } function
                              transientAssetCollectionWithAssetFetchResult
                              (fetchResult: PHFetchResult; title: NSString)
                              : PHAssetCollection; cdecl;
                            end;
                        PHAssetCollection = interface(PHCollection)
                          ['{1E3E8570-9556-49F6-BD0A-A44C55294125}']
                        function assetCollectionType: PHAssetCollectionType;
                        cdecl;
                          function assetCollectionSubtype
                            : PHAssetCollectionSubtype; cdecl;
                            function estimatedAssetCount: NSUInteger; cdecl;
                              function startDate: NSDate; cdecl;
                                function endDate: NSDate; cdecl;
                                  function approximateLocation
                                    : CLLocation; cdecl;
                                    function localizedLocationNames
                                      : NSArray; cdecl;
                                    end;

                                TPHAssetCollection = class
                                  (TOCGenericImport<PHAssetCollectionClass,
                                  PHAssetCollection>)
                                end;
                            PPHAssetCollection = Pointer;

                            PHAssetClass = interface(PHObjectClass)
                              ['{0E07F46D-213C-46A8-BEAA-0DF524AB22B7}']
                            { class } function fetchAssetsInAssetCollection
                              (assetCollection: PHAssetCollection;
                              options: PHFetchOptions): PHFetchResult;
                            cdecl;
                            { class } function fetchAssetsWithLocalIdentifiers
                                (identifiers: NSArray; options: PHFetchOptions)
                                : PHFetchResult; cdecl;
                              { class } function fetchKeyAssetsInAssetCollection
                                  (assetCollection: PHAssetCollection;
                                  options: PHFetchOptions)
                                  : PHFetchResult; cdecl;
                                { class } function
                                    fetchAssetsWithBurstIdentifier
                                    (burstIdentifier: NSString;
                                    options: PHFetchOptions)
                                    : PHFetchResult; cdecl;
                                  { class } function fetchAssetsWithOptions
                                      (options: PHFetchOptions)
                                      : PHFetchResult; cdecl;
                                    { class } function fetchAssetsWithMediaType
                                        (mediaType: PHAssetMediaType;
                                        options: PHFetchOptions)
                                        : PHFetchResult; cdecl;
                                      { class } function
                                        fetchAssetsWithALAssetURLs
                                        (assetURLs: NSArray;
                                        options: PHFetchOptions)
                                        : PHFetchResult; cdecl;
                                        end;
                                    PHAsset = interface(PHObject)
                                      ['{25B87AE9-30EF-4637-9F42-A28DE8271FED}']
                                    function mediaType: PHAssetMediaType;
                                    cdecl;
                                      function mediaSubtypes
                                        : PHAssetMediaSubtype; cdecl;
                                        function pixelWidth: NSUInteger; cdecl;
                                        function pixelHeight: NSUInteger; cdecl;
                                        function creationDate: NSDate; cdecl;
                                        function modificationDate
                                        : NSDate; cdecl;
                                        function location: CLLocation; cdecl;
                                        function duration
                                        : NSTimeInterval; cdecl;
                                        function isHidden: Boolean; cdecl;
                                        function isFavorite: Boolean; cdecl;
                                        function burstIdentifier
                                        : NSString; cdecl;
                                        function burstSelectionTypes
                                        : PHAssetBurstSelectionType; cdecl;
                                        function representsBurst
                                        : Boolean; cdecl;
                                        function sourceType
                                        : PHAssetSourceType; cdecl;
                                        function canPerformEditOperation
                                        (editOperation: PHAssetEditOperation)
                                        : Boolean; cdecl;
                                        function requestContentEditingInputWithOptions
                                        (options: PHContentEditingInputRequestOptions;
                                        completionHandler
                                        : TPhotosCompletionHandler1)
                                        : PHContentEditingInputRequestID; cdecl;
                                        procedure cancelContentEditingInputRequest
                                        (requestID
                                        : PHContentEditingInputRequestID);
                                        cdecl;
                                        end;

                                        TPHAsset = class
                                        (TOCGenericImport<
                                        PHAssetClass, PHAsset>)
                                        end;
                                        PPHAsset = Pointer;

                                        PHContentEditingInputClass = interface
                                        (NSObjectClass)
                                        ['{C5077F5C-568C-4521-9D9D-CD8F760CEB2F}']
                                        end;
                                        PHContentEditingInput = interface
                                        (NSObject)
                                        ['{03339F55-F14A-4F87-B0A2-073328A629D0}']
                                        function mediaType: PHAssetMediaType;
                                        cdecl;
                                        function mediaSubtypes
                                        : PHAssetMediaSubtype; cdecl;
                                        function creationDate: NSDate; cdecl;
                                        function location: CLLocation; cdecl;
                                        function uniformTypeIdentifier
                                        : NSString; cdecl;
                                        function adjustmentData
                                        : PHAdjustmentData; cdecl;
                                        function displaySizeImage
                                        : UIImage; cdecl;
                                        function fullSizeImageURL: NSURL; cdecl;
                                        function fullSizeImageOrientation
                                        : Integer; cdecl;
                                        function AVAsset: AVAsset; cdecl;
                                        function audiovisualAsset
                                        : AVAsset; cdecl;
                                        end;

                                        TPHContentEditingInput = class
                                        (TOCGenericImport<
                                        PHContentEditingInputClass,
                                        PHContentEditingInput>)
                                        end;
                                        PPHContentEditingInput = Pointer;

                                        PHContentEditingOutputClass = interface
                                        (NSObjectClass)
                                        ['{48C93EC1-AB63-4958-9134-146FB465DBFA}']
                                        end;
                                        PHContentEditingOutput = interface
                                        (NSObject)
                                        ['{F803CBA3-B2ED-4A89-A39F-C6DE3E4F4B95}']
                                        function initWithContentEditingInput
                                        (contentEditingInput
                                        : PHContentEditingInput)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setAdjustmentData
                                        (adjustmentData
                                        : PHAdjustmentData); cdecl;
                                        function adjustmentData
                                        : PHAdjustmentData; cdecl;
                                        function renderedContentURL
                                        : NSURL; cdecl;
                                        function initWithPlaceholderForCreatedAsset
                                        (placeholderForCreatedAsset
                                        : PHObjectPlaceholder)
                                        : Pointer { instancetype }; cdecl;
                                        end;

                                        TPHContentEditingOutput = class
                                        (TOCGenericImport<
                                        PHContentEditingOutputClass,
                                        PHContentEditingOutput>)
                                        end;
                                        PPHContentEditingOutput = Pointer;

                                        PHAssetResourceClass = interface
                                        (NSObjectClass)
                                        ['{3D6E1DF4-8EC9-40A5-BB52-33D6D92CAC08}']
                                        { class } function
                                        assetResourcesForAsset(asset: PHAsset)
                                        : NSArray;
                                        cdecl;
                                        { class } function
                                        assetResourcesForLivePhoto
                                        (livePhoto: PHLivePhoto)
                                        : NSArray; cdecl;
                                        end;
                                        PHAssetResource = interface(NSObject)
                                        ['{272326EC-375F-440E-966D-CCBB24067B71}']
                                        function &type: PHAssetResourceType;
                                        cdecl;
                                        function assetLocalIdentifier
                                        : NSString; cdecl;
                                        function uniformTypeIdentifier
                                        : NSString; cdecl;
                                        function originalFilename
                                        : NSString; cdecl;
                                        end;

                                        TPHAssetResource = class
                                        (TOCGenericImport<PHAssetResourceClass,
                                        PHAssetResource>)
                                        end;
                                        PPHAssetResource = Pointer;

                                        PHContentEditingInputRequestOptionsClass =
                                        interface(NSObjectClass)
                                        ['{EA6790D6-314E-47DF-9FDC-96EAAF87CCD8}']
                                        end;
                                        PHContentEditingInputRequestOptions =
                                        interface(NSObject)
                                        ['{BD8BDBAF-9A85-45A5-BB5E-DD2618193BDB}']
                                        procedure setCanHandleAdjustmentData
                                        (canHandleAdjustmentData
                                        : TPhotosCanHandleAdjustmentData);
                                        cdecl;
                                        function canHandleAdjustmentData
                                        : TPhotosCanHandleAdjustmentData; cdecl;
                                        procedure setNetworkAccessAllowed
                                        (networkAccessAllowed: Boolean); cdecl;
                                        function isNetworkAccessAllowed
                                        : Boolean; cdecl;
                                        procedure setProgressHandler
                                        (progressHandler
                                        : TPhotosProgressHandler); cdecl;
                                        function progressHandler
                                        : TPhotosProgressHandler; cdecl;
                                        end;

                                        TPHContentEditingInputRequestOptions =
                                        class(TOCGenericImport<
                                        PHContentEditingInputRequestOptionsClass,
                                        PHContentEditingInputRequestOptions>)
                                        end;
                                        PPHContentEditingInputRequestOptions =
                                        Pointer;

                                        PHAssetChangeRequestClass = interface
                                        (NSObjectClass)
                                        ['{B1CE2901-CF7D-41D8-90A9-486AD7DB030C}']
                                        { class } function
                                        creationRequestForAssetFromImage
                                        (image: UIImage)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        creationRequestForAssetFromImageAtFileURL
                                        (fileURL: NSURL)
                                        : Pointer { instancetype }; cdecl;
                                        { class } function
                                        creationRequestForAssetFromVideoAtFileURL
                                        (fileURL: NSURL)
                                        : Pointer { instancetype }; cdecl;
                                        { class } procedure deleteAssets
                                        (assets: Pointer); cdecl;
                                        { class } function changeRequestForAsset
                                        (asset: PHAsset)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        PHAssetChangeRequest = interface
                                        (NSObject)
                                        ['{0506959F-ADB4-4622-8A27-28AFA4B6EC23}']
                                        function placeholderForCreatedAsset
                                        : PHObjectPlaceholder;
                                        cdecl;
                                        procedure setCreationDate
                                        (creationDate: NSDate); cdecl;
                                        function creationDate: NSDate; cdecl;
                                        procedure setLocation
                                        (location: CLLocation); cdecl;
                                        function location: CLLocation; cdecl;
                                        procedure setFavorite
                                        (favorite: Boolean); cdecl;
                                        function isFavorite: Boolean; cdecl;
                                        procedure setHidden
                                        (hidden: Boolean); cdecl;
                                        function isHidden: Boolean; cdecl;
                                        procedure setContentEditingOutput
                                        (contentEditingOutput
                                        : PHContentEditingOutput); cdecl;
                                        function contentEditingOutput
                                        : PHContentEditingOutput; cdecl;
                                        procedure revertAssetContentToOriginal;
                                        cdecl;
                                        end;

                                        TPHAssetChangeRequest = class
                                        (TOCGenericImport<
                                        PHAssetChangeRequestClass,
                                        PHAssetChangeRequest>)
                                        end;
                                        PPHAssetChangeRequest = Pointer;

                                        PHAssetCollectionChangeRequestClass =
                                        interface(NSObjectClass)
                                        ['{33C0B700-C6DA-4EEA-894E-8AF037FB59B0}']
                                        { class } function
                                        creationRequestForAssetCollectionWithTitle
                                        (title: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } procedure
                                        deleteAssetCollections(assetCollections
                                        : Pointer); cdecl;
                                        [MethodName
                                        ('changeRequestForAssetCollection:')]
                                        { class } function
                                        changeRequestForAssetCollection
                                        (assetCollection: PHAssetCollection)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('changeRequestForAssetCollection:assets:')
                                        ]
                                        { class } function
                                        changeRequestForAssetCollectionAssets
                                        (assetCollection: PHAssetCollection;
                                        assets: PHFetchResult)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        PHAssetCollectionChangeRequest =
                                        interface(NSObject)
                                        ['{67D50BC7-EF47-4078-B6F1-15A3AC7E985F}']
                                        function placeholderForCreatedAssetCollection
                                        : PHObjectPlaceholder;
                                        cdecl;
                                        procedure setTitle
                                        (title: NSString); cdecl;
                                        function title: NSString; cdecl;
                                        procedure addAssets
                                        (assets: Pointer); cdecl;
                                        procedure insertAssets(assets: Pointer;
                                        atIndexes: NSIndexSet); cdecl;
                                        procedure removeAssets
                                        (assets: Pointer); cdecl;
                                        procedure removeAssetsAtIndexes
                                        (indexes: NSIndexSet); cdecl;
                                        procedure replaceAssetsAtIndexes
                                        (indexes: NSIndexSet;
                                        withAssets: Pointer); cdecl;
                                        procedure moveAssetsAtIndexes
                                        (fromIndexes: NSIndexSet;
                                        toIndex: NSUInteger); cdecl;
                                        end;

                                        TPHAssetCollectionChangeRequest = class
                                        (TOCGenericImport<
                                        PHAssetCollectionChangeRequestClass,
                                        PHAssetCollectionChangeRequest>)
                                        end;
                                        PPHAssetCollectionChangeRequest =
                                        Pointer;

                                        PHAssetResourceCreationOptionsClass =
                                        interface(NSObjectClass)
                                        ['{67F69E19-1031-412A-BB58-0D4F79AAB8B3}']
                                        end;
                                        PHAssetResourceCreationOptions =
                                        interface(NSObject)
                                        ['{00D73C00-672B-4A0A-ADC6-D9E0DF60542C}']
                                        procedure setOriginalFilename
                                        (originalFilename: NSString);
                                        cdecl;
                                        function originalFilename
                                        : NSString; cdecl;
                                        procedure setUniformTypeIdentifier
                                        (uniformTypeIdentifier
                                        : NSString); cdecl;
                                        function uniformTypeIdentifier
                                        : NSString; cdecl;
                                        procedure setShouldMoveFile
                                        (shouldMoveFile: Boolean); cdecl;
                                        function shouldMoveFile: Boolean; cdecl;
                                        end;

                                        TPHAssetResourceCreationOptions = class
                                        (TOCGenericImport<
                                        PHAssetResourceCreationOptionsClass,
                                        PHAssetResourceCreationOptions>)
                                        end;
                                        PPHAssetResourceCreationOptions =
                                        Pointer;

                                        PHAssetCreationRequestClass = interface
                                        (PHAssetChangeRequestClass)
                                        ['{EEDF22BD-9221-4002-82B7-14B4BF64B271}']
                                        { class } function
                                        creationRequestForAsset
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        supportsAssetResourceTypes
                                        (types: NSArray): Boolean; cdecl;
                                        end;
                                        PHAssetCreationRequest = interface
                                        (PHAssetChangeRequest)
                                        ['{7DAA5B55-6822-4C8F-BE24-2E2C7D6AB033}']
                                        [MethodName
                                        ('addResourceWithType:fileURL:options:')
                                        ]
                                        procedure addResourceWithTypeFileURLOptions
                                        (&type: PHAssetResourceType;
                                        fileURL: NSURL;
                                        options: PHAssetResourceCreationOptions);
                                        cdecl;
                                        [MethodName
                                        ('addResourceWithType:data:options:')]
                                        procedure addResourceWithTypeDataOptions
                                        (&type: PHAssetResourceType;
                                        data: NSData;
                                        options: PHAssetResourceCreationOptions);
                                        cdecl;
                                        end;

                                        TPHAssetCreationRequest = class
                                        (TOCGenericImport<
                                        PHAssetCreationRequestClass,
                                        PHAssetCreationRequest>)
                                        end;
                                        PPHAssetCreationRequest = Pointer;

                                        PHLivePhotoClass = interface
                                        (NSObjectClass)
                                        ['{2B011391-1CE8-4288-B873-D24215E8E50E}']
                                        { class } function
                                        requestLivePhotoWithResourceFileURLs
                                        (fileURLs: NSArray;
                                        placeholderImage: UIImage;
                                        targetSize: CGSize;
                                        contentMode: PHImageContentMode;
                                        resultHandler: TPhotosResultHandler2)
                                        : PHLivePhotoRequestID;
                                        cdecl;
                                        { class } procedure
                                        cancelLivePhotoRequestWithRequestID
                                        (requestID
                                        : PHLivePhotoRequestID); cdecl;
                                        end;
                                        PHLivePhoto = interface(NSObject)
                                        ['{D7487FEA-921D-4E7B-B26D-043047CBADBF}']
                                        function size: CGSize;
                                        cdecl;
                                        end;

                                        TPHLivePhoto = class
                                        (TOCGenericImport<PHLivePhotoClass,
                                        PHLivePhoto>)
                                        end;
                                        PPHLivePhoto = Pointer;

                                        PHAssetResourceRequestOptionsClass =
                                        interface(NSObjectClass)
                                        ['{B5AAFB43-A7AA-45B6-8413-B7097FFDDAB1}']
                                        end;
                                        PHAssetResourceRequestOptions =
                                        interface(NSObject)
                                        ['{5A4EC4D8-2919-4091-8384-CC203CE76863}']
                                        procedure setNetworkAccessAllowed
                                        (networkAccessAllowed: Boolean);
                                        cdecl;
                                        function isNetworkAccessAllowed
                                        : Boolean; cdecl;
                                        procedure setProgressHandler
                                        (progressHandler
                                        : PHAssetResourceProgressHandler);
                                        cdecl;
                                        function progressHandler
                                        : PHAssetResourceProgressHandler; cdecl;
                                        end;

                                        TPHAssetResourceRequestOptions = class
                                        (TOCGenericImport<
                                        PHAssetResourceRequestOptionsClass,
                                        PHAssetResourceRequestOptions>)
                                        end;
                                        PPHAssetResourceRequestOptions =
                                        Pointer;

                                        PHAssetResourceManagerClass = interface
                                        (NSObjectClass)
                                        ['{04154207-CC82-4EF9-AA89-544A7B626EB8}']
                                        { class } function defaultManager
                                        : PHAssetResourceManager;
                                        cdecl;
                                        end;
                                        PHAssetResourceManager = interface
                                        (NSObject)
                                        ['{6C588DB0-A8C2-40B6-AD1B-8468428D68E9}']
                                        function requestDataForAssetResource
                                        (resource: PHAssetResource;
                                        options: PHAssetResourceRequestOptions;
                                        dataReceivedHandler
                                        : TPhotosDataReceivedHandler;
                                        completionHandler
                                        : TPhotosCompletionHandler2)
                                        : PHAssetResourceDataRequestID;
                                        cdecl;
                                        procedure writeDataForAssetResource
                                        (resource: PHAssetResource;
                                        toFile: NSURL;
                                        options: PHAssetResourceRequestOptions;
                                        completionHandler
                                        : TPhotosCompletionHandler2); cdecl;
                                        procedure cancelDataRequest
                                        (requestID
                                        : PHAssetResourceDataRequestID); cdecl;
                                        end;

                                        TPHAssetResourceManager = class
                                        (TOCGenericImport<
                                        PHAssetResourceManagerClass,
                                        PHAssetResourceManager>)
                                        end;
                                        PPHAssetResourceManager = Pointer;

                                        PHObjectChangeDetailsClass = interface
                                        (NSObjectClass)
                                        ['{8C4376D2-FE56-46FE-AEBA-1F746D741B40}']
                                        end;
                                        PHObjectChangeDetails = interface
                                        (NSObject)
                                        ['{54950DA0-2F6F-477F-AC02-A2A2BDFADA51}']
                                        function objectBeforeChanges: PHObject;
                                        cdecl;
                                        function objectAfterChanges
                                        : PHObject; cdecl;
                                        function assetContentChanged
                                        : Boolean; cdecl;
                                        function objectWasDeleted
                                        : Boolean; cdecl;
                                        end;

                                        TPHObjectChangeDetails = class
                                        (TOCGenericImport<
                                        PHObjectChangeDetailsClass,
                                        PHObjectChangeDetails>)
                                        end;
                                        PPHObjectChangeDetails = Pointer;

                                        PHFetchResultChangeDetailsClass =
                                        interface(NSObjectClass)
                                        ['{E28A3501-7C35-4DC2-9535-7A7AB29717F7}']
                                        { class } function
                                        changeDetailsFromFetchResult
                                        (fromResult: PHFetchResult;
                                        toFetchResult: PHFetchResult;
                                        changedObjects: NSArray)
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        PHFetchResultChangeDetails = interface
                                        (NSObject)
                                        ['{BC76F6A1-7A3C-4227-814B-BA4FB7D5A210}']
                                        function fetchResultBeforeChanges
                                        : PHFetchResult;
                                        cdecl;
                                        function fetchResultAfterChanges
                                        : PHFetchResult; cdecl;
                                        function hasIncrementalChanges
                                        : Boolean; cdecl;
                                        function removedIndexes
                                        : NSIndexSet; cdecl;
                                        function removedObjects: NSArray; cdecl;
                                        function insertedIndexes
                                        : NSIndexSet; cdecl;
                                        function insertedObjects
                                        : NSArray; cdecl;
                                        function changedIndexes
                                        : NSIndexSet; cdecl;
                                        function changedObjects: NSArray; cdecl;
                                        procedure enumerateMovesWithBlock
                                        (handler: TPhotosHandler1); cdecl;
                                        function hasMoves: Boolean; cdecl;
                                        end;

                                        TPHFetchResultChangeDetails = class
                                        (TOCGenericImport<
                                        PHFetchResultChangeDetailsClass,
                                        PHFetchResultChangeDetails>)
                                        end;
                                        PPHFetchResultChangeDetails = Pointer;

                                        PHCollectionListClass = interface
                                        (PHCollectionClass)
                                        ['{9618AE97-2B66-4AE2-B52F-8DB6819B4402}']
                                        { class } function
                                        fetchCollectionListsContainingCollection
                                        (collection: PHCollection;
                                        options: PHFetchOptions): PHFetchResult;
                                        cdecl;
                                        { class } function
                                        fetchCollectionListsWithLocalIdentifiers
                                        (identifiers: NSArray;
                                        options: PHFetchOptions)
                                        : PHFetchResult; cdecl;
                                        { class } function
                                        fetchCollectionListsWithType
                                        (collectionListType
                                        : PHCollectionListType;
                                        subtype: PHCollectionListSubtype;
                                        options: PHFetchOptions)
                                        : PHFetchResult; cdecl;
                                        [MethodName
                                        ('fetchMomentListsWithSubtype:containingMoment:options:')
                                        ]
                                        { class } function
                                        fetchMomentListsWithSubtypeContainingMomentOptions
                                        (momentListSubtype
                                        : PHCollectionListSubtype;
                                        containingMoment: PHAssetCollection;
                                        options: PHFetchOptions)
                                        : PHFetchResult; cdecl;
                                        [MethodName
                                        ('fetchMomentListsWithSubtype:options:')
                                        ]
                                        { class } function
                                        fetchMomentListsWithSubtypeOptions
                                        (momentListSubtype
                                        : PHCollectionListSubtype;
                                        options: PHFetchOptions)
                                        : PHFetchResult; cdecl;
                                        { class } function
                                        transientCollectionListWithCollections
                                        (collections: NSArray; title: NSString)
                                        : PHCollectionList; cdecl;
                                        { class } function
                                        transientCollectionListWithCollectionsFetchResult
                                        (fetchResult: PHFetchResult;
                                        title: NSString)
                                        : PHCollectionList; cdecl;
                                        end;
                                        PHCollectionList = interface
                                        (PHCollection)
                                        ['{AD8D52CA-C677-4E43-BED0-FA0DA52849C8}']
                                        function collectionListType
                                        : PHCollectionListType;
                                        cdecl;
                                        function collectionListSubtype
                                        : PHCollectionListSubtype; cdecl;
                                        function startDate: NSDate; cdecl;
                                        function endDate: NSDate; cdecl;
                                        function localizedLocationNames
                                        : NSArray; cdecl;
                                        end;

                                        TPHCollectionList = class
                                        (TOCGenericImport<PHCollectionListClass,
                                        PHCollectionList>)
                                        end;
                                        PPHCollectionList = Pointer;

                                        PHCollectionListChangeRequestClass =
                                        interface(NSObjectClass)
                                        ['{77F36841-AC5A-43F3-81CE-7A37F6BB42A3}']
                                        { class } function
                                        creationRequestForCollectionListWithTitle
                                        (title: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } procedure
                                        deleteCollectionLists(collectionLists
                                        : Pointer); cdecl;
                                        [MethodName
                                        ('changeRequestForCollectionList:')]
                                        { class } function
                                        changeRequestForCollectionList
                                        (collectionList: PHCollectionList)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('changeRequestForCollectionList:childCollections:')
                                        ]
                                        { class } function
                                        changeRequestForCollectionListChildCollections
                                        (collectionList: PHCollectionList;
                                        childCollections: PHFetchResult)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        PHCollectionListChangeRequest =
                                        interface(NSObject)
                                        ['{0ADFE8C7-2CBE-42CE-B3DC-7D9EE1C29139}']
                                        function placeholderForCreatedCollectionList
                                        : PHObjectPlaceholder;
                                        cdecl;
                                        procedure setTitle
                                        (title: NSString); cdecl;
                                        function title: NSString; cdecl;
                                        procedure addChildCollections
                                        (collections: Pointer); cdecl;
                                        procedure insertChildCollections
                                        (collections: Pointer;
                                        atIndexes: NSIndexSet); cdecl;
                                        procedure removeChildCollections
                                        (collections: Pointer); cdecl;
                                        procedure removeChildCollectionsAtIndexes
                                        (indexes: NSIndexSet); cdecl;
                                        procedure replaceChildCollectionsAtIndexes
                                        (indexes: NSIndexSet;
                                        withChildCollections: Pointer); cdecl;
                                        procedure moveChildCollectionsAtIndexes
                                        (indexes: NSIndexSet;
                                        toIndex: NSUInteger); cdecl;
                                        end;

                                        TPHCollectionListChangeRequest = class
                                        (TOCGenericImport<
                                        PHCollectionListChangeRequestClass,
                                        PHCollectionListChangeRequest>)
                                        end;
                                        PPHCollectionListChangeRequest =
                                        Pointer;

                                        PHImageRequestOptionsClass = interface
                                        (NSObjectClass)
                                        ['{DA2D289D-6A5C-492D-8D3D-9339DE6032A9}']
                                        end;
                                        PHImageRequestOptions = interface
                                        (NSObject)
                                        ['{30316AA8-0AEF-4B18-A958-B8A950DD0AE7}']
                                        procedure setVersion
                                        (version: PHImageRequestOptionsVersion);
                                        cdecl;
                                        function version
                                        : PHImageRequestOptionsVersion; cdecl;
                                        procedure setDeliveryMode
                                        (deliveryMode
                                        : PHImageRequestOptionsDeliveryMode);
                                        cdecl;
                                        function deliveryMode
                                        : PHImageRequestOptionsDeliveryMode;
                                        cdecl;
                                        procedure setResizeMode
                                        (resizeMode
                                        : PHImageRequestOptionsResizeMode);
                                        cdecl;
                                        function resizeMode
                                        : PHImageRequestOptionsResizeMode;
                                        cdecl;
                                        procedure setNormalizedCropRect
                                        (normalizedCropRect: CGRect); cdecl;
                                        function normalizedCropRect
                                        : CGRect; cdecl;
                                        procedure setNetworkAccessAllowed
                                        (networkAccessAllowed: Boolean); cdecl;
                                        function isNetworkAccessAllowed
                                        : Boolean; cdecl;
                                        procedure setSynchronous
                                        (synchronous: Boolean); cdecl;
                                        function isSynchronous: Boolean; cdecl;
                                        procedure setProgressHandler
                                        (progressHandler
                                        : PHAssetImageProgressHandler); cdecl;
                                        function progressHandler
                                        : PHAssetImageProgressHandler; cdecl;
                                        end;

                                        TPHImageRequestOptions = class
                                        (TOCGenericImport<
                                        PHImageRequestOptionsClass,
                                        PHImageRequestOptions>)
                                        end;
                                        PPHImageRequestOptions = Pointer;

                                        PHLivePhotoRequestOptionsClass =
                                        interface(NSObjectClass)
                                        ['{69B85B0E-2B28-4C55-BF5E-AA0D8E8A50B1}']
                                        end;
                                        PHLivePhotoRequestOptions = interface
                                        (NSObject)
                                        ['{FB0FA955-FDDF-435D-B2AE-360BB02492B2}']
                                        procedure setDeliveryMode
                                        (deliveryMode
                                        : PHImageRequestOptionsDeliveryMode);
                                        cdecl;
                                        function deliveryMode
                                        : PHImageRequestOptionsDeliveryMode;
                                        cdecl;
                                        procedure setNetworkAccessAllowed
                                        (networkAccessAllowed: Boolean); cdecl;
                                        function isNetworkAccessAllowed
                                        : Boolean; cdecl;
                                        procedure setProgressHandler
                                        (progressHandler
                                        : PHAssetImageProgressHandler); cdecl;
                                        function progressHandler
                                        : PHAssetImageProgressHandler; cdecl;
                                        end;

                                        TPHLivePhotoRequestOptions = class
                                        (TOCGenericImport<
                                        PHLivePhotoRequestOptionsClass,
                                        PHLivePhotoRequestOptions>)
                                        end;
                                        PPHLivePhotoRequestOptions = Pointer;

                                        PHVideoRequestOptionsClass = interface
                                        (NSObjectClass)
                                        ['{985AD61C-6019-4339-B384-7E56FFF2BDE7}']
                                        end;
                                        PHVideoRequestOptions = interface
                                        (NSObject)
                                        ['{C51F0883-B776-45B2-9F41-7FB86E053EE9}']
                                        procedure setNetworkAccessAllowed
                                        (networkAccessAllowed: Boolean);
                                        cdecl;
                                        function isNetworkAccessAllowed
                                        : Boolean; cdecl;
                                        procedure setVersion
                                        (version: PHVideoRequestOptionsVersion);
                                        cdecl;
                                        function version
                                        : PHVideoRequestOptionsVersion; cdecl;
                                        procedure setDeliveryMode
                                        (deliveryMode
                                        : PHVideoRequestOptionsDeliveryMode);
                                        cdecl;
                                        function deliveryMode
                                        : PHVideoRequestOptionsDeliveryMode;
                                        cdecl;
                                        procedure setProgressHandler
                                        (progressHandler
                                        : PHAssetVideoProgressHandler); cdecl;
                                        function progressHandler
                                        : PHAssetVideoProgressHandler; cdecl;
                                        end;

                                        TPHVideoRequestOptions = class
                                        (TOCGenericImport<
                                        PHVideoRequestOptionsClass,
                                        PHVideoRequestOptions>)
                                        end;
                                        PPHVideoRequestOptions = Pointer;

                                        PHImageManagerClass = interface
                                        (NSObjectClass)
                                        ['{26B3ED11-93C2-49AB-9DD4-D53A10FC3E5C}']
                                        { class } function defaultManager
                                        : PHImageManager;
                                        cdecl;
                                        end;
                                        PHImageManager = interface(NSObject)
                                        ['{15E76D96-B0D4-46CE-BC6F-6DB033FBD8A0}']
                                        function requestImageForAsset
                                        (asset: PHAsset; targetSize: CGSize;
                                        contentMode: PHImageContentMode;
                                        options: PHImageRequestOptions;
                                        resultHandler: TPhotosResultHandler)
                                        : PHImageRequestID;
                                        cdecl;
                                        function requestImageDataForAsset
                                        (asset: PHAsset;
                                        options: PHImageRequestOptions;
                                        resultHandler: TPhotosResultHandler1)
                                        : PHImageRequestID; cdecl;
                                        procedure cancelImageRequest
                                        (requestID: PHImageRequestID); cdecl;
                                        function requestLivePhotoForAsset
                                        (asset: PHAsset; targetSize: CGSize;
                                        contentMode: PHImageContentMode;
                                        options: PHLivePhotoRequestOptions;
                                        resultHandler: TPhotosResultHandler2)
                                        : PHImageRequestID; cdecl;
                                        function requestPlayerItemForVideo
                                        (asset: PHAsset;
                                        options: PHVideoRequestOptions;
                                        resultHandler: TPhotosResultHandler3)
                                        : PHImageRequestID; cdecl;
                                        function requestExportSessionForVideo
                                        (asset: PHAsset;
                                        options: PHVideoRequestOptions;
                                        exportPreset: NSString;
                                        resultHandler: TPhotosResultHandler4)
                                        : PHImageRequestID; cdecl;
                                        function requestAVAssetForVideo
                                        (asset: PHAsset;
                                        options: PHVideoRequestOptions;
                                        resultHandler: TPhotosResultHandler5)
                                        : PHImageRequestID; cdecl;
                                        end;

                                        TPHImageManager = class
                                        (TOCGenericImport<PHImageManagerClass,
                                        PHImageManager>)
                                        end;
                                        PPHImageManager = Pointer;

                                        PHCachingImageManagerClass = interface
                                        (PHImageManagerClass)
                                        ['{ACD36FD5-DB0F-4FC2-9B4D-DBE5D3853F2F}']
                                        end;
                                        PHCachingImageManager = interface
                                        (PHImageManager)
                                        ['{8597BB5A-026D-4C53-91EC-D6E3591ACD44}']
                                        procedure setAllowsCachingHighQualityImages
                                        (allowsCachingHighQualityImages
                                        : Boolean);
                                        cdecl;
                                        function allowsCachingHighQualityImages
                                        : Boolean; cdecl;
                                        procedure startCachingImagesForAssets
                                        (assets: NSArray; targetSize: CGSize;
                                        contentMode: PHImageContentMode;
                                        options: PHImageRequestOptions); cdecl;
                                        procedure stopCachingImagesForAssets
                                        (assets: NSArray; targetSize: CGSize;
                                        contentMode: PHImageContentMode;
                                        options: PHImageRequestOptions); cdecl;
                                        procedure stopCachingImagesForAllAssets;
                                        cdecl;
                                        end;

                                        TPHCachingImageManager = class
                                        (TOCGenericImport<
                                        PHCachingImageManagerClass,
                                        PHCachingImageManager>)
                                        end;
                                        PPHCachingImageManager = Pointer;

                                        // ===== Protocol declarations =====

                                        PHPhotoLibraryChangeObserver = interface
                                        (IObjectiveC)
                                        ['{C947D47E-9FA3-497C-829D-708FE6E76733}']
                                        procedure photoLibraryDidChange
                                        (changeInstance: PHChange);
                                        cdecl;
                                        end;

                                        // ===== Exported string consts =====

                                        function PHContentEditingInputResultIsInCloudKey
                                        : NSString;
                                        function PHContentEditingInputCancelledKey
                                        : NSString;
                                        function PHContentEditingInputErrorKey
                                        : NSString;
                                        function PHImageManagerMaximumSize
                                        : Pointer;
                                        function PHImageResultIsInCloudKey
                                        : NSString;
                                        function PHImageResultIsDegradedKey
                                        : NSString;
                                        function PHImageResultRequestIDKey
                                        : NSString;
                                        function PHImageCancelledKey: NSString;
                                        function PHImageErrorKey: NSString;
                                        function PHLivePhotoInfoErrorKey
                                        : NSString;
                                        function PHLivePhotoInfoIsDegradedKey
                                        : NSString;
                                        function PHLivePhotoInfoCancelledKey
                                        : NSString;


                                        // ===== External functions =====

                                        const
                                        libPhotos =
                                        '/System/Library/Frameworks/Photos.framework/Photos';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  PhotosModule: THandle;

{$ENDIF IOS}

function PHContentEditingInputResultIsInCloudKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos,
    'PHContentEditingInputResultIsInCloudKey');
end;

function PHContentEditingInputCancelledKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHContentEditingInputCancelledKey');
end;

function PHContentEditingInputErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHContentEditingInputErrorKey');
end;

function PHImageResultIsInCloudKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHImageResultIsInCloudKey');
end;

function PHImageResultIsDegradedKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHImageResultIsDegradedKey');
end;

function PHImageResultRequestIDKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHImageResultRequestIDKey');
end;

function PHImageCancelledKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHImageCancelledKey');
end;

function PHImageErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHImageErrorKey');
end;

function PHLivePhotoInfoErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHLivePhotoInfoErrorKey');
end;

function PHLivePhotoInfoIsDegradedKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHLivePhotoInfoIsDegradedKey');
end;

function PHLivePhotoInfoCancelledKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHLivePhotoInfoCancelledKey');
end;

function PHImageManagerMaximumSize: Pointer;
begin
  Result := CocoaPointerConst(libPhotos, 'PHImageManagerMaximumSize');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

PhotosModule := dlopen(MarshaledAString(libPhotos), RTLD_LAZY);

finalization

dlclose(PhotosModule);
{$ENDIF IOS}

end.
