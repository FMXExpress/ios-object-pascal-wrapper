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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.AVFoundation,
  iOSapi.CocoaTypes,
  iOSapi.CoreImage,
  iOSapi.CoreLocation,
  iOSapi.CoreMedia,
  iOSapi.Foundation,
  iOSapi.ImageIO;

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
  PHAssetCollectionSubtypeSmartAlbumDepthEffect = 212;
  PHAssetCollectionSubtypeSmartAlbumLivePhotos = 213;
  PHAssetCollectionSubtypeSmartAlbumAnimated = 214;
  PHAssetCollectionSubtypeSmartAlbumLongExposures = 215;
  PHAssetCollectionSubtypeSmartAlbumUnableToUpload = 216;
  PHAssetCollectionSubtypeSmartAlbumRAW = 217;
  PHAssetCollectionSubtypeSmartAlbumCinematic = 218;
  PHAssetCollectionSubtypeAny = 2147483647;
  PHAssetEditOperationDelete = 1;
  PHAssetEditOperationContent = 2;
  PHAssetEditOperationProperties = 3;
  PHAssetPlaybackStyleUnsupported = 0;
  PHAssetPlaybackStyleImage = 1;
  PHAssetPlaybackStyleImageAnimated = 2;
  PHAssetPlaybackStyleLivePhoto = 3;
  PHAssetPlaybackStyleVideo = 4;
  PHAssetPlaybackStyleVideoLooping = 5;
  PHAssetMediaTypeUnknown = 0;
  PHAssetMediaTypeImage = 1;
  PHAssetMediaTypeVideo = 2;
  PHAssetMediaTypeAudio = 3;
  PHAssetMediaSubtypeNone = 0;
  PHAssetMediaSubtypePhotoPanorama = (1 shl 0);
  PHAssetMediaSubtypePhotoHDR = (1 shl 1);
  PHAssetMediaSubtypePhotoScreenshot = (1 shl 2);
  PHAssetMediaSubtypePhotoLive = (1 shl 3);
  PHAssetMediaSubtypePhotoDepthEffect = (1 shl 4);
  PHAssetMediaSubtypeVideoStreamed = (1 shl 16);
  PHAssetMediaSubtypeVideoHighFrameRate = (1 shl 17);
  PHAssetMediaSubtypeVideoTimelapse = (1 shl 18);
  PHAssetMediaSubtypeVideoCinematic = (1 shl 21);
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
  PHAssetResourceTypeFullSizePairedVideo = 10;
  PHAssetResourceTypeAdjustmentBasePairedVideo = 11;
  PHAssetResourceTypeAdjustmentBaseVideo = 12;
  PHObjectTypeAsset = 1;
  PHObjectTypeAssetCollection = 2;
  PHObjectTypeCollectionList = 3;
  PHAuthorizationStatusNotDetermined = 0;
  PHAuthorizationStatusRestricted = 1;
  PHAuthorizationStatusDenied = 2;
  PHAuthorizationStatusAuthorized = 3;
  PHAuthorizationStatusLimited = 4;
  PHAccessLevelAddOnly = 1;
  PHAccessLevelReadWrite = 2;
  PHPhotosErrorInternalError = -1;
  PHPhotosErrorUserCancelled = 3072;
  PHPhotosErrorLibraryVolumeOffline = 3114;
  PHPhotosErrorRelinquishingLibraryBundleToWriter = 3142;
  PHPhotosErrorSwitchingSystemPhotoLibrary = 3143;
  PHPhotosErrorNetworkAccessRequired = 3164;
  PHPhotosErrorNetworkError = 3169;
  PHPhotosErrorIdentifierNotFound = 3201;
  PHPhotosErrorMultipleIdentifiersFound = 3202;
  PHPhotosErrorChangeNotSupported = 3300;
  PHPhotosErrorOperationInterrupted = 3301;
  PHPhotosErrorInvalidResource = 3302;
  PHPhotosErrorMissingResource = 3303;
  PHPhotosErrorNotEnoughSpace = 3305;
  PHPhotosErrorRequestNotSupportedForAsset = 3306;
  PHPhotosErrorAccessRestricted = 3310;
  PHPhotosErrorAccessUserDenied = 3311;
  PHPhotosErrorLibraryInFileProviderSyncRoot = 5423;
  PHPhotosErrorPersistentChangeTokenExpired = 3105;
  PHPhotosErrorPersistentChangeDetailsUnavailable = 3210;
  PHPhotosErrorInvalid = -1;
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
  PHLivePhotoFrameTypePhoto = 0;
  PHLivePhotoFrameTypeVideo = 1;
  PHLivePhotoEditingErrorCodeUnknown = 0;
  PHLivePhotoEditingErrorCodeAborted = 1;

type

  // ===== Forward declarations =====
{$M+}
  PHAdjustmentData = interface;
  PHPhotoLibrary = interface;
  PHObject = interface;
  PHObjectPlaceholder = interface;
  PHFetchResult = interface;
  PHChange = interface;
  PHPersistentChangeToken = interface;
  PHPersistentChangeFetchResult = interface;
  PHPhotoLibraryChangeObserver = interface;
  PHPhotoLibraryAvailabilityObserver = interface;
  PHFetchOptions = interface;
  PHAssetCollection = interface;
  PHAsset = interface;
  PHChangeRequest = interface;
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
  PHCloudIdentifier = interface;
  PHCloudIdentifierMapping = interface;
  PHLocalIdentifierMapping = interface;
  PHCollectionList = interface;
  PHCollection = interface;
  PHCollectionListChangeRequest = interface;
  PHImageRequestOptions = interface;
  PHLivePhotoRequestOptions = interface;
  PHVideoRequestOptions = interface;
  PHImageManager = interface;
  PHCachingImageManager = interface;
  PHLivePhotoFrame = interface;
  PHLivePhotoEditingContext = interface;
  PHPersistentObjectChangeDetails = interface;
  PHPersistentChange = interface;
  PHProject = interface;
  PHProjectChangeRequest = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  PHImageContentMode = NSInteger;
  PHCollectionListType = NSInteger;
  PHCollectionListSubtype = NSInteger;
  PHCollectionEditOperation = NSInteger;
  PHAssetCollectionType = NSInteger;
  PHAssetCollectionSubtype = NSInteger;
  PHAssetEditOperation = NSInteger;
  PHAssetPlaybackStyle = NSInteger;
  PHAssetMediaType = NSInteger;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  PHAssetMediaSubtype = NSUInteger;
  PHAssetBurstSelectionType = NSUInteger;
  PHAssetSourceType = NSUInteger;
  PHAssetResourceType = NSInteger;
  PHObjectType = NSInteger;
  ObjectType = Pointer;
  PObjectType = ^ObjectType;

  _NSRange = record
    location: NSUInteger;
    length: NSUInteger;
  end;

  P_NSRange = ^_NSRange;
  NSRange = _NSRange;
  PNSRange = ^NSRange;

  TPhotosBlock = procedure(param1: ObjectType; param2: NSUInteger;
    param3: PBoolean) of object;
  NSEnumerationOptions = NSUInteger;
  PHAuthorizationStatus = NSInteger;
  PHAccessLevel = NSInteger;
  TPhotosHandler = procedure(param1: PHAuthorizationStatus) of object;
  TPhotosCompletionHandler = procedure(param1: Boolean; param2: NSError)
    of object;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  PHContentEditingInputRequestID = NSUInteger;
  PPHContentEditingInputRequestID = ^PHContentEditingInputRequestID;
  TPhotosCanHandleAdjustmentData = function(param1: PHAdjustmentData)
    : Boolean; cdecl;
  TPhotosProgressHandler = procedure(param1: Double; param2: PBoolean)
    of object;
  TPhotosCompletionHandler1 = procedure(param1: PHContentEditingInput;
    param2: NSDictionary) of object;
  PHAssetResourceDataRequestID = Int32;
  PPHAssetResourceDataRequestID = ^PHAssetResourceDataRequestID;
  PHAssetResourceProgressHandler = procedure(param1: Double) of object;
  TPhotosDataReceivedHandler = procedure(param1: NSData) of object;
  TPhotosCompletionHandler2 = procedure(param1: NSError) of object;
  TPhotosHandler1 = procedure(param1: NSUInteger; param2: NSUInteger) of object;
  NSErrorDomain = NSString;
  PNSErrorDomain = ^NSErrorDomain;
  NSErrorUserInfoKey = NSString;
  PNSErrorUserInfoKey = ^NSErrorUserInfoKey;
  PHPhotosError = NSInteger;
  UIImageOrientation = NSInteger;
  PHImageRequestOptionsVersion = NSInteger;
  PHImageRequestOptionsDeliveryMode = NSInteger;
  PHImageRequestOptionsResizeMode = NSInteger;
  PHAssetImageProgressHandler = procedure(param1: Double; param2: NSError;
    param3: PBoolean; param4: NSDictionary) of object;
  CGFloat = Single;
  PCGFloat = ^CGFloat;

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

  PHVideoRequestOptionsVersion = NSInteger;
  PHVideoRequestOptionsDeliveryMode = NSInteger;
  PHAssetVideoProgressHandler = procedure(param1: Double; param2: NSError;
    param3: PBoolean; param4: NSDictionary) of object;
  PHImageRequestID = Int32;
  PPHImageRequestID = ^PHImageRequestID;
  TPhotosResultHandler = procedure(param1: UIImage; param2: NSDictionary)
    of object;
  TPhotosResultHandler1 = procedure(param1: NSData; param2: NSString;
    param3: UIImageOrientation; param4: NSDictionary) of object;
  CGImagePropertyOrientation = LongWord;
  TPhotosResultHandler2 = procedure(param1: NSData; param2: NSString;
    param3: CGImagePropertyOrientation; param4: NSDictionary) of object;
  TPhotosResultHandler3 = procedure(param1: PHLivePhoto; param2: NSDictionary)
    of object;
  TPhotosResultHandler4 = procedure(param1: AVPlayerItem; param2: NSDictionary)
    of object;
  TPhotosResultHandler5 = procedure(param1: AVAssetExportSession;
    param2: NSDictionary) of object;
  TPhotosResultHandler6 = procedure(param1: AVAsset; param2: AVAudioMix;
    param3: NSDictionary) of object;
  PHLivePhotoRequestID = Int32;
  PPHLivePhotoRequestID = ^PHLivePhotoRequestID;
  PHLivePhotoFrameProcessingBlock = function(param1: Pointer; param2: NSError)
    : CIImage; cdecl;
  PHLivePhotoEditingOption = NSString;
  PPHLivePhotoEditingOption = ^PHLivePhotoEditingOption;
  CMTimeValue = Int64;
  PCMTimeValue = ^CMTimeValue;
  CMTimeScale = Int32;
  PCMTimeScale = ^CMTimeScale;
  CMTimeFlags = LongWord;
  CMTimeEpoch = Int64;
  PCMTimeEpoch = ^CMTimeEpoch;

  CMTime = record
    value: CMTimeValue;
    timescale: CMTimeScale;
    flags: CMTimeFlags;
    epoch: CMTimeEpoch;
  end;

  PCMTime = ^CMTime;

  TPhotosCompletionHandler3 = procedure(param1: PHLivePhoto; param2: NSError)
    of object;
  PHLivePhotoFrameType = NSInteger;
  PHLivePhotoEditingErrorCode = NSInteger;
  TPhotosBlock1 = procedure(param1: PHPersistentChange; param2: PBoolean)
    of object;
  // ===== Interface declarations =====

  PHAdjustmentDataClass = interface(NSObjectClass)
    ['{C902DF55-78F8-4943-8F0E-71FA41F5FA6E}']
  end;

  PHAdjustmentData = interface(NSObject)
    ['{AE342435-97E5-41D4-8DFD-ED2E58229244}']
    function initWithFormatIdentifier(formatIdentifier: NSString;
      formatVersion: NSString; data: NSData): Pointer { instancetype }; cdecl;
    function formatIdentifier: NSString; cdecl;
    function formatVersion: NSString; cdecl;
    function data: NSData; cdecl;
  end;

  TPHAdjustmentData = class(TOCGenericImport<PHAdjustmentDataClass,
    PHAdjustmentData>)
  end;

  PPHAdjustmentData = Pointer;

  PHPhotoLibraryClass = interface(NSObjectClass)
    ['{FCCADE4F-8338-43DC-A863-3766DC0012A9}']
    { class } function sharedPhotoLibrary: PHPhotoLibrary; cdecl;
    { class } function authorizationStatusForAccessLevel
      (accessLevel: PHAccessLevel): PHAuthorizationStatus; cdecl;
    { class } procedure requestAuthorizationForAccessLevel
      (accessLevel: PHAccessLevel; handler: TPhotosHandler); cdecl;
    { class } function authorizationStatus: PHAuthorizationStatus; cdecl;
    { class } procedure requestAuthorization(handler: TPhotosHandler); cdecl;
  end;

  PHPhotoLibrary = interface(NSObject)
    ['{3EA5F33E-A865-4EDF-88A6-DD8FA064940B}']
    function unavailabilityReason: NSError; cdecl;
    procedure registerAvailabilityObserver(observer: Pointer); cdecl;
    procedure unregisterAvailabilityObserver(observer: Pointer); cdecl;
    procedure performChanges(changeBlock: Pointer { dispatch_block_t };
      completionHandler: TPhotosCompletionHandler); cdecl;
    function performChangesAndWait(changeBlock: Pointer { dispatch_block_t };
      error: NSError): Boolean; cdecl;
    procedure registerChangeObserver(observer: Pointer); cdecl;
    procedure unregisterChangeObserver(observer: Pointer); cdecl;
    function fetchPersistentChangesSinceToken(token: PHPersistentChangeToken;
      error: NSError): PHPersistentChangeFetchResult; cdecl;
    function currentChangeToken: PHPersistentChangeToken; cdecl;
    function localIdentifierMappingsForCloudIdentifiers(cloudIdentifiers
      : NSArray): NSDictionary; cdecl;
    function cloudIdentifierMappingsForLocalIdentifiers(localIdentifiers
      : NSArray): NSDictionary; cdecl;
    function localIdentifiersForCloudIdentifiers(cloudIdentifiers: NSArray)
      : NSArray; cdecl;
    function cloudIdentifiersForLocalIdentifiers(localIdentifiers: NSArray)
      : NSArray; cdecl;
  end;

  TPHPhotoLibrary = class(TOCGenericImport<PHPhotoLibraryClass, PHPhotoLibrary>)
  end;

  PPHPhotoLibrary = Pointer;

  PHObjectClass = interface(NSObjectClass)
    ['{1C41E195-3B6C-46B5-8D25-585AAFB4E1F9}']
  end;

  PHObject = interface(NSObject)
    ['{7D8AA0EE-12BD-43F1-A22A-FE910E5183B6}']
    function localIdentifier: NSString; cdecl;
  end;

  TPHObject = class(TOCGenericImport<PHObjectClass, PHObject>)
  end;

  PPHObject = Pointer;

  PHObjectPlaceholderClass = interface(PHObjectClass)
    ['{1CCB9612-D021-4448-9BD2-87E490D4FA6E}']
  end;

  PHObjectPlaceholder = interface(PHObject)
    ['{ED7203A7-9403-4FE7-81C7-90BE9D4530C7}']
  end;

  TPHObjectPlaceholder = class(TOCGenericImport<PHObjectPlaceholderClass,
    PHObjectPlaceholder>)
  end;

  PPHObjectPlaceholder = Pointer;

  PHFetchResultClass = interface(NSObjectClass)
    ['{5489317E-3ADA-4502-BD11-8D4E19DA273E}']
  end;

  PHFetchResult = interface(NSObject)
    ['{AECBDFD4-6473-4FCA-B754-D8A42CC28BEE}']
    function count: NSUInteger; cdecl;
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
    procedure enumerateObjectsUsingBlock(block: TPhotosBlock); cdecl;
    procedure enumerateObjectsWithOptions(opts: NSEnumerationOptions;
      usingBlock: TPhotosBlock); cdecl;
    procedure enumerateObjectsAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; usingBlock: TPhotosBlock); cdecl;
    function countOfAssetsWithMediaType(mediaType: PHAssetMediaType)
      : NSUInteger; cdecl;
  end;

  TPHFetchResult = class(TOCGenericImport<PHFetchResultClass, PHFetchResult>)
  end;

  PPHFetchResult = Pointer;

  PHChangeClass = interface(NSObjectClass)
    ['{B8B15B44-88E4-47B7-B561-AC45768C7831}']
  end;

  PHChange = interface(NSObject)
    ['{A6A8378E-070E-44D0-BE3D-A3F44A6298F3}']
    function changeDetailsForObject(&object: PHObject)
      : PHObjectChangeDetails; cdecl;
    function changeDetailsForFetchResult(&object: PHFetchResult)
      : PHFetchResultChangeDetails; cdecl;
  end;

  TPHChange = class(TOCGenericImport<PHChangeClass, PHChange>)
  end;

  PPHChange = Pointer;

  PHPersistentChangeTokenClass = interface(NSObjectClass)
    ['{A3190C83-F227-4E67-BA43-3F381A1C9F43}']
  end;

  PHPersistentChangeToken = interface(NSObject)
    ['{13E8DF5D-53FE-4C57-8391-8563FF9B435E}']
  end;

  TPHPersistentChangeToken = class
    (TOCGenericImport<PHPersistentChangeTokenClass, PHPersistentChangeToken>)
  end;

  PPHPersistentChangeToken = Pointer;

  PHPersistentChangeFetchResultClass = interface(NSObjectClass)
    ['{BDB15D47-305E-4AF5-8CCB-5E935AEA7907}']
  end;

  PHPersistentChangeFetchResult = interface(NSObject)
    ['{EFDADF02-2BFF-4E11-875D-72E4356B7712}']
    procedure enumerateChangesWithBlock(block: TPhotosBlock1); cdecl;
  end;

  TPHPersistentChangeFetchResult = class
    (TOCGenericImport<PHPersistentChangeFetchResultClass,
    PHPersistentChangeFetchResult>)
  end;

  PPHPersistentChangeFetchResult = Pointer;

  PHFetchOptionsClass = interface(NSObjectClass)
    ['{509F08D6-43F4-4BC4-A6B4-56A6852A7703}']
  end;

  PHFetchOptions = interface(NSObject)
    ['{48E59B44-1A56-4B96-B20B-E5CCCAC0304A}']
    procedure setPredicate(predicate: NSPredicate); cdecl;
    function predicate: NSPredicate; cdecl;
    procedure setSortDescriptors(sortDescriptors: NSArray); cdecl;
    function sortDescriptors: NSArray; cdecl;
    procedure setIncludeHiddenAssets(includeHiddenAssets: Boolean); cdecl;
    function includeHiddenAssets: Boolean; cdecl;
    procedure setIncludeAllBurstAssets(includeAllBurstAssets: Boolean); cdecl;
    function includeAllBurstAssets: Boolean; cdecl;
    procedure setIncludeAssetSourceTypes(includeAssetSourceTypes
      : PHAssetSourceType); cdecl;
    function includeAssetSourceTypes: PHAssetSourceType; cdecl;
    procedure setFetchLimit(fetchLimit: NSUInteger); cdecl;
    function fetchLimit: NSUInteger; cdecl;
    procedure setWantsIncrementalChangeDetails(wantsIncrementalChangeDetails
      : Boolean); cdecl;
    function wantsIncrementalChangeDetails: Boolean; cdecl;
  end;

  TPHFetchOptions = class(TOCGenericImport<PHFetchOptionsClass, PHFetchOptions>)
  end;

  PPHFetchOptions = Pointer;

  PHCollectionClass = interface(PHObjectClass)
    ['{0BA6BEC1-2808-4815-BBFE-ACC2D26B0F79}']
    { class } function fetchCollectionsInCollectionList(collectionList
      : PHCollectionList; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchTopLevelUserCollectionsWithOptions
      (options: PHFetchOptions): PHFetchResult; cdecl;
  end;

  PHCollection = interface(PHObject)
    ['{531DA49E-7183-4138-B9D3-4F5B2DC924F6}']
    function canContainAssets: Boolean; cdecl;
    function canContainCollections: Boolean; cdecl;
    function localizedTitle: NSString; cdecl;
    function canPerformEditOperation(anOperation: PHCollectionEditOperation)
      : Boolean; cdecl;
  end;

  TPHCollection = class(TOCGenericImport<PHCollectionClass, PHCollection>)
  end;

  PPHCollection = Pointer;

  PHAssetCollectionClass = interface(PHCollectionClass)
    ['{57C940AD-9705-4A9C-BA87-A860DB95BE3D}']
    { class } function fetchAssetCollectionsWithLocalIdentifiers
      (identifiers: NSArray; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchAssetCollectionsWithType
      (&type: PHAssetCollectionType; subtype: PHAssetCollectionSubtype;
      options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchAssetCollectionsContainingAsset(asset: PHAsset;
      withType: PHAssetCollectionType; options: PHFetchOptions)
      : PHFetchResult; cdecl;
    { class } function fetchAssetCollectionsWithALAssetGroupURLs
      (assetGroupURLs: NSArray; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchMomentsInMomentList(momentList: PHCollectionList;
      options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchMomentsWithOptions(options: PHFetchOptions)
      : PHFetchResult; cdecl;
    { class } function transientAssetCollectionWithAssets(assets: NSArray;
      title: NSString): PHAssetCollection; cdecl;
    { class } function transientAssetCollectionWithAssetFetchResult
      (fetchResult: PHFetchResult; title: NSString): PHAssetCollection; cdecl;
  end;

  PHAssetCollection = interface(PHCollection)
    ['{8DD7BA57-7203-4137-B81F-EFA93D941348}']
    function assetCollectionType: PHAssetCollectionType; cdecl;
    function assetCollectionSubtype: PHAssetCollectionSubtype; cdecl;
    function estimatedAssetCount: NSUInteger; cdecl;
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function approximateLocation: CLLocation; cdecl;
    function localizedLocationNames: NSArray; cdecl;
  end;

  TPHAssetCollection = class(TOCGenericImport<PHAssetCollectionClass,
    PHAssetCollection>)
  end;

  PPHAssetCollection = Pointer;

  PHAssetClass = interface(PHObjectClass)
    ['{BC80E363-53B0-460D-94C7-DB42B5DDD37C}']
    { class } function fetchAssetsInAssetCollection(assetCollection
      : PHAssetCollection; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchAssetsWithLocalIdentifiers(identifiers: NSArray;
      options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchKeyAssetsInAssetCollection(assetCollection
      : PHAssetCollection; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchAssetsWithBurstIdentifier(burstIdentifier: NSString;
      options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchAssetsWithOptions(options: PHFetchOptions)
      : PHFetchResult; cdecl;
    { class } function fetchAssetsWithMediaType(mediaType: PHAssetMediaType;
      options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchAssetsWithALAssetURLs(assetURLs: NSArray;
      options: PHFetchOptions): PHFetchResult; cdecl;
  end;

  PHAsset = interface(PHObject)
    ['{F646B8D0-815E-46C0-94E1-CC69E55AEB0B}']
    function playbackStyle: PHAssetPlaybackStyle; cdecl;
    function mediaType: PHAssetMediaType; cdecl;
    function mediaSubtypes: PHAssetMediaSubtype; cdecl;
    function pixelWidth: NSUInteger; cdecl;
    function pixelHeight: NSUInteger; cdecl;
    function creationDate: NSDate; cdecl;
    function modificationDate: NSDate; cdecl;
    function location: CLLocation; cdecl;
    function duration: NSTimeInterval; cdecl;
    function isHidden: Boolean; cdecl;
    function isFavorite: Boolean; cdecl;
    function isSyncFailureHidden: Boolean; cdecl;
    function burstIdentifier: NSString; cdecl;
    function burstSelectionTypes: PHAssetBurstSelectionType; cdecl;
    function representsBurst: Boolean; cdecl;
    function sourceType: PHAssetSourceType; cdecl;
    function hasAdjustments: Boolean; cdecl;
    function adjustmentFormatIdentifier: NSString; cdecl;
    function canPerformEditOperation(editOperation: PHAssetEditOperation)
      : Boolean; cdecl;
    function requestContentEditingInputWithOptions
      (options: PHContentEditingInputRequestOptions;
      completionHandler: TPhotosCompletionHandler1)
      : PHContentEditingInputRequestID; cdecl;
    procedure cancelContentEditingInputRequest
      (requestID: PHContentEditingInputRequestID); cdecl;
  end;

  TPHAsset = class(TOCGenericImport<PHAssetClass, PHAsset>)
  end;

  PPHAsset = Pointer;

  PHChangeRequestClass = interface(NSObjectClass)
    ['{4E6BF967-3EFC-43A2-B0B0-F1FEC31FD042}']
  end;

  PHChangeRequest = interface(NSObject)
    ['{9852A6C6-84F4-4541-A244-94B71294F863}']
  end;

  TPHChangeRequest = class(TOCGenericImport<PHChangeRequestClass,
    PHChangeRequest>)
  end;

  PPHChangeRequest = Pointer;

  PHContentEditingInputClass = interface(NSObjectClass)
    ['{7BBDDE14-D6C2-457C-9097-C491051A990F}']
  end;

  PHContentEditingInput = interface(NSObject)
    ['{63CAA8E8-10D3-4E21-9526-2B26F3CECE02}']
    function mediaType: PHAssetMediaType; cdecl;
    function mediaSubtypes: PHAssetMediaSubtype; cdecl;
    function creationDate: NSDate; cdecl;
    function location: CLLocation; cdecl;
    function uniformTypeIdentifier: NSString; cdecl;
    function playbackStyle: PHAssetPlaybackStyle; cdecl;
    function adjustmentData: PHAdjustmentData; cdecl;
    function displaySizeImage: UIImage; cdecl;
    function fullSizeImageURL: NSURL; cdecl;
    function fullSizeImageOrientation: Integer; cdecl;
    function AVAsset: AVAsset; cdecl;
    function audiovisualAsset: AVAsset; cdecl;
    function livePhoto: PHLivePhoto; cdecl;
  end;

  TPHContentEditingInput = class(TOCGenericImport<PHContentEditingInputClass,
    PHContentEditingInput>)
  end;

  PPHContentEditingInput = Pointer;

  PHContentEditingOutputClass = interface(NSObjectClass)
    ['{3DA36FA8-5166-482A-9FA6-D0D2F6DABE97}']
  end;

  PHContentEditingOutput = interface(NSObject)
    ['{02A4C5B1-A0B7-4AC2-BB49-4835B2565B4D}']
    function initWithContentEditingInput(contentEditingInput
      : PHContentEditingInput): Pointer { instancetype }; cdecl;
    procedure setAdjustmentData(adjustmentData: PHAdjustmentData); cdecl;
    function adjustmentData: PHAdjustmentData; cdecl;
    function renderedContentURL: NSURL; cdecl;
    function initWithPlaceholderForCreatedAsset(placeholderForCreatedAsset
      : PHObjectPlaceholder): Pointer { instancetype }; cdecl;
  end;

  TPHContentEditingOutput = class(TOCGenericImport<PHContentEditingOutputClass,
    PHContentEditingOutput>)
  end;

  PPHContentEditingOutput = Pointer;

  PHAssetResourceClass = interface(NSObjectClass)
    ['{99E7179D-2940-48A1-8E79-D3875D595151}']
    { class } function assetResourcesForAsset(asset: PHAsset): NSArray; cdecl;
    { class } function assetResourcesForLivePhoto(livePhoto: PHLivePhoto)
      : NSArray; cdecl;
  end;

  PHAssetResource = interface(NSObject)
    ['{2C0769A6-4FD7-4E41-841C-D0776F82B205}']
    function &type: PHAssetResourceType; cdecl;
    function assetLocalIdentifier: NSString; cdecl;
    function uniformTypeIdentifier: NSString; cdecl;
    function originalFilename: NSString; cdecl;
    function pixelWidth: NSInteger; cdecl;
    function pixelHeight: NSInteger; cdecl;
  end;

  TPHAssetResource = class(TOCGenericImport<PHAssetResourceClass,
    PHAssetResource>)
  end;

  PPHAssetResource = Pointer;

  PHContentEditingInputRequestOptionsClass = interface(NSObjectClass)
    ['{317DE0F3-C5B2-4CCD-90D9-76731373BE22}']
  end;

  PHContentEditingInputRequestOptions = interface(NSObject)
    ['{7C04B658-9701-4962-9ED1-F0823041C396}']
    procedure setCanHandleAdjustmentData(canHandleAdjustmentData
      : TPhotosCanHandleAdjustmentData); cdecl;
    function canHandleAdjustmentData: TPhotosCanHandleAdjustmentData; cdecl;
    procedure setNetworkAccessAllowed(networkAccessAllowed: Boolean); cdecl;
    function isNetworkAccessAllowed: Boolean; cdecl;
    procedure setProgressHandler(progressHandler
      : TPhotosProgressHandler); cdecl;
    function progressHandler: TPhotosProgressHandler; cdecl;
  end;

  TPHContentEditingInputRequestOptions = class
    (TOCGenericImport<PHContentEditingInputRequestOptionsClass,
    PHContentEditingInputRequestOptions>)
  end;

  PPHContentEditingInputRequestOptions = Pointer;

  PHAssetChangeRequestClass = interface(PHChangeRequestClass)
    ['{2D80DDBE-ADE1-4FB8-A4B8-479D56F9179A}']
    { class } function creationRequestForAssetFromImage(image: UIImage)
      : Pointer { instancetype }; cdecl;
    { class } function creationRequestForAssetFromImageAtFileURL(fileURL: NSURL)
      : Pointer { instancetype }; cdecl;
    { class } function creationRequestForAssetFromVideoAtFileURL(fileURL: NSURL)
      : Pointer { instancetype }; cdecl;
    { class } procedure deleteAssets(assets: Pointer); cdecl;
    { class } function changeRequestForAsset(asset: PHAsset)
      : Pointer { instancetype }; cdecl;
  end;

  PHAssetChangeRequest = interface(PHChangeRequest)
    ['{AEBDC3D4-8789-47E2-B0FB-F1706B899F35}']
    function placeholderForCreatedAsset: PHObjectPlaceholder; cdecl;
    procedure setCreationDate(creationDate: NSDate); cdecl;
    function creationDate: NSDate; cdecl;
    procedure setLocation(location: CLLocation); cdecl;
    function location: CLLocation; cdecl;
    procedure setFavorite(favorite: Boolean); cdecl;
    function isFavorite: Boolean; cdecl;
    procedure setHidden(hidden: Boolean); cdecl;
    function isHidden: Boolean; cdecl;
    procedure setContentEditingOutput(contentEditingOutput
      : PHContentEditingOutput); cdecl;
    function contentEditingOutput: PHContentEditingOutput; cdecl;
    procedure revertAssetContentToOriginal; cdecl;
  end;

  TPHAssetChangeRequest = class(TOCGenericImport<PHAssetChangeRequestClass,
    PHAssetChangeRequest>)
  end;

  PPHAssetChangeRequest = Pointer;

  PHAssetCollectionChangeRequestClass = interface(PHChangeRequestClass)
    ['{211CF1CB-33C5-450A-B909-26CC5639FC8C}']
    { class } function creationRequestForAssetCollectionWithTitle
      (title: NSString): Pointer { instancetype }; cdecl;
    { class } procedure deleteAssetCollections(assetCollections
      : Pointer); cdecl;
    [MethodName('changeRequestForAssetCollection:')]
    { class } function changeRequestForAssetCollection(assetCollection
      : PHAssetCollection): Pointer { instancetype }; cdecl;
    [MethodName('changeRequestForAssetCollection:assets:')]
    { class } function changeRequestForAssetCollectionAssets(assetCollection
      : PHAssetCollection; assets: PHFetchResult)
      : Pointer { instancetype }; cdecl;
  end;

  PHAssetCollectionChangeRequest = interface(PHChangeRequest)
    ['{4FFD8D64-46EC-4D49-A633-43327D36FE22}']
    function placeholderForCreatedAssetCollection: PHObjectPlaceholder; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure addAssets(assets: Pointer); cdecl;
    procedure insertAssets(assets: Pointer; atIndexes: NSIndexSet); cdecl;
    procedure removeAssets(assets: Pointer); cdecl;
    procedure removeAssetsAtIndexes(indexes: NSIndexSet); cdecl;
    procedure replaceAssetsAtIndexes(indexes: NSIndexSet;
      withAssets: Pointer); cdecl;
    procedure moveAssetsAtIndexes(fromIndexes: NSIndexSet;
      toIndex: NSUInteger); cdecl;
  end;

  TPHAssetCollectionChangeRequest = class
    (TOCGenericImport<PHAssetCollectionChangeRequestClass,
    PHAssetCollectionChangeRequest>)
  end;

  PPHAssetCollectionChangeRequest = Pointer;

  PHAssetResourceCreationOptionsClass = interface(NSObjectClass)
    ['{B939F4C6-1083-4342-87A6-9C85DE343780}']
  end;

  PHAssetResourceCreationOptions = interface(NSObject)
    ['{40B09B03-892D-481A-85CF-B4B20E6B5075}']
    procedure setOriginalFilename(originalFilename: NSString); cdecl;
    function originalFilename: NSString; cdecl;
    procedure setUniformTypeIdentifier(uniformTypeIdentifier: NSString); cdecl;
    function uniformTypeIdentifier: NSString; cdecl;
    procedure setShouldMoveFile(shouldMoveFile: Boolean); cdecl;
    function shouldMoveFile: Boolean; cdecl;
  end;

  TPHAssetResourceCreationOptions = class
    (TOCGenericImport<PHAssetResourceCreationOptionsClass,
    PHAssetResourceCreationOptions>)
  end;

  PPHAssetResourceCreationOptions = Pointer;

  PHAssetCreationRequestClass = interface(PHAssetChangeRequestClass)
    ['{AC74DB1C-1C32-4B3B-AA69-A2F0D0BC4C22}']
    { class } function creationRequestForAsset: Pointer { instancetype }; cdecl;
    { class } function supportsAssetResourceTypes(types: NSArray)
      : Boolean; cdecl;
  end;

  PHAssetCreationRequest = interface(PHAssetChangeRequest)
    ['{BCBF4759-69C9-4708-9B49-64A45B131C21}']
    [MethodName('addResourceWithType:fileURL:options:')]
    procedure addResourceWithTypeFileURLOptions(&type: PHAssetResourceType;
      fileURL: NSURL; options: PHAssetResourceCreationOptions); cdecl;
    [MethodName('addResourceWithType:data:options:')]
    procedure addResourceWithTypeDataOptions(&type: PHAssetResourceType;
      data: NSData; options: PHAssetResourceCreationOptions); cdecl;
  end;

  TPHAssetCreationRequest = class(TOCGenericImport<PHAssetCreationRequestClass,
    PHAssetCreationRequest>)
  end;

  PPHAssetCreationRequest = Pointer;

  PHLivePhotoClass = interface(NSObjectClass)
    ['{44742CDE-C6FD-45B3-90A3-9C57731F83B9}']
    { class } function requestLivePhotoWithResourceFileURLs(fileURLs: NSArray;
      placeholderImage: UIImage; targetSize: CGSize;
      contentMode: PHImageContentMode; resultHandler: TPhotosResultHandler3)
      : PHLivePhotoRequestID; cdecl;
    { class } procedure cancelLivePhotoRequestWithRequestID
      (requestID: PHLivePhotoRequestID); cdecl;
  end;

  PHLivePhoto = interface(NSObject)
    ['{A174469B-C956-4F2C-B46E-B4BC3C0692C6}']
    function size: CGSize; cdecl;
  end;

  TPHLivePhoto = class(TOCGenericImport<PHLivePhotoClass, PHLivePhoto>)
  end;

  PPHLivePhoto = Pointer;

  PHAssetResourceRequestOptionsClass = interface(NSObjectClass)
    ['{207DCC3A-4D1C-4591-B2BD-5B937B6B3D06}']
  end;

  PHAssetResourceRequestOptions = interface(NSObject)
    ['{2CA1DCD1-0527-4957-BB3A-FFD34AB23744}']
    procedure setNetworkAccessAllowed(networkAccessAllowed: Boolean); cdecl;
    function isNetworkAccessAllowed: Boolean; cdecl;
    procedure setProgressHandler(progressHandler
      : PHAssetResourceProgressHandler); cdecl;
    function progressHandler: PHAssetResourceProgressHandler; cdecl;
  end;

  TPHAssetResourceRequestOptions = class
    (TOCGenericImport<PHAssetResourceRequestOptionsClass,
    PHAssetResourceRequestOptions>)
  end;

  PPHAssetResourceRequestOptions = Pointer;

  PHAssetResourceManagerClass = interface(NSObjectClass)
    ['{70998CA6-5889-4E26-BA6E-A3157EEF26CB}']
    { class } function defaultManager: PHAssetResourceManager; cdecl;
  end;

  PHAssetResourceManager = interface(NSObject)
    ['{4004BD04-529E-43DC-AC56-E40D9AF7AD8A}']
    function requestDataForAssetResource(resource: PHAssetResource;
      options: PHAssetResourceRequestOptions;
      dataReceivedHandler: TPhotosDataReceivedHandler;
      completionHandler: TPhotosCompletionHandler2)
      : PHAssetResourceDataRequestID; cdecl;
    procedure writeDataForAssetResource(resource: PHAssetResource;
      toFile: NSURL; options: PHAssetResourceRequestOptions;
      completionHandler: TPhotosCompletionHandler2); cdecl;
    procedure cancelDataRequest(requestID: PHAssetResourceDataRequestID); cdecl;
  end;

  TPHAssetResourceManager = class(TOCGenericImport<PHAssetResourceManagerClass,
    PHAssetResourceManager>)
  end;

  PPHAssetResourceManager = Pointer;

  PHObjectChangeDetailsClass = interface(NSObjectClass)
    ['{30983995-536D-4CD5-AAAB-32072122858C}']
  end;

  PHObjectChangeDetails = interface(NSObject)
    ['{55B318BC-3123-4398-8399-4BACC0D0671F}']
    function objectBeforeChanges: ObjectType; cdecl;
    function objectAfterChanges: ObjectType; cdecl;
    function assetContentChanged: Boolean; cdecl;
    function objectWasDeleted: Boolean; cdecl;
  end;

  TPHObjectChangeDetails = class(TOCGenericImport<PHObjectChangeDetailsClass,
    PHObjectChangeDetails>)
  end;

  PPHObjectChangeDetails = Pointer;

  PHFetchResultChangeDetailsClass = interface(NSObjectClass)
    ['{42973B8B-2F68-4A72-BA6C-4B59AFDC5B80}']
    { class } function changeDetailsFromFetchResult(fromResult: PHFetchResult;
      toFetchResult: PHFetchResult; changedObjects: NSArray)
      : Pointer { instancetype }; cdecl;
  end;

  PHFetchResultChangeDetails = interface(NSObject)
    ['{BF4EDBCB-BCAA-4852-BF53-BA38CDF61F0B}']
    function fetchResultBeforeChanges: PHFetchResult; cdecl;
    function fetchResultAfterChanges: PHFetchResult; cdecl;
    function hasIncrementalChanges: Boolean; cdecl;
    function removedIndexes: NSIndexSet; cdecl;
    function removedObjects: NSArray; cdecl;
    function insertedIndexes: NSIndexSet; cdecl;
    function insertedObjects: NSArray; cdecl;
    function changedIndexes: NSIndexSet; cdecl;
    function changedObjects: NSArray; cdecl;
    procedure enumerateMovesWithBlock(handler: TPhotosHandler1); cdecl;
    function hasMoves: Boolean; cdecl;
  end;

  TPHFetchResultChangeDetails = class
    (TOCGenericImport<PHFetchResultChangeDetailsClass,
    PHFetchResultChangeDetails>)
  end;

  PPHFetchResultChangeDetails = Pointer;

  PHCloudIdentifierClass = interface(NSObjectClass)
    ['{36EFA91F-CAC9-4892-A472-0F7D4976E2C7}']
  end;

  PHCloudIdentifier = interface(NSObject)
    ['{48EC3B51-2D56-4DA7-856F-EA61B2279EB7}']
    procedure setNotFoundIdentifier(notFoundIdentifier
      : PHCloudIdentifier); cdecl;
    function notFoundIdentifier: PHCloudIdentifier; cdecl;
    function stringValue: NSString; cdecl;
    function initWithStringValue(stringValue: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  TPHCloudIdentifier = class(TOCGenericImport<PHCloudIdentifierClass,
    PHCloudIdentifier>)
  end;

  PPHCloudIdentifier = Pointer;

  PHCloudIdentifierMappingClass = interface(NSObjectClass)
    ['{17D161F9-99E4-4BD8-A040-89FFE4A9311D}']
  end;

  PHCloudIdentifierMapping = interface(NSObject)
    ['{1893CFE7-25C0-4345-B4C3-CC8746E36CC6}']
    function cloudIdentifier: PHCloudIdentifier; cdecl;
    function error: NSError; cdecl;
  end;

  TPHCloudIdentifierMapping = class
    (TOCGenericImport<PHCloudIdentifierMappingClass, PHCloudIdentifierMapping>)
  end;

  PPHCloudIdentifierMapping = Pointer;

  PHLocalIdentifierMappingClass = interface(NSObjectClass)
    ['{4EDB3391-1F5B-421A-AC29-48007FCD40B4}']
  end;

  PHLocalIdentifierMapping = interface(NSObject)
    ['{DFDB7F6C-A630-496C-96F8-C33D09F5315D}']
    function localIdentifier: NSString; cdecl;
    function error: NSError; cdecl;
  end;

  TPHLocalIdentifierMapping = class
    (TOCGenericImport<PHLocalIdentifierMappingClass, PHLocalIdentifierMapping>)
  end;

  PPHLocalIdentifierMapping = Pointer;

  PHCollectionListClass = interface(PHCollectionClass)
    ['{0E4972E4-BBB0-4C86-8D8C-7EA6BC9BF95B}']
    { class } function fetchCollectionListsContainingCollection
      (collection: PHCollection; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchCollectionListsWithLocalIdentifiers
      (identifiers: NSArray; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchCollectionListsWithType(collectionListType
      : PHCollectionListType; subtype: PHCollectionListSubtype;
      options: PHFetchOptions): PHFetchResult; cdecl;
    [MethodName('fetchMomentListsWithSubtype:containingMoment:options:')]
    { class } function fetchMomentListsWithSubtypeContainingMomentOptions
      (momentListSubtype: PHCollectionListSubtype;
      containingMoment: PHAssetCollection; options: PHFetchOptions)
      : PHFetchResult; cdecl;
    [MethodName('fetchMomentListsWithSubtype:options:')]
    { class } function fetchMomentListsWithSubtypeOptions(momentListSubtype
      : PHCollectionListSubtype; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function transientCollectionListWithCollections
      (collections: NSArray; title: NSString): PHCollectionList; cdecl;
    { class } function transientCollectionListWithCollectionsFetchResult
      (fetchResult: PHFetchResult; title: NSString): PHCollectionList; cdecl;
  end;

  PHCollectionList = interface(PHCollection)
    ['{D8619AC8-9F8C-4306-8636-0C11857E87AC}']
    function collectionListType: PHCollectionListType; cdecl;
    function collectionListSubtype: PHCollectionListSubtype; cdecl;
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function localizedLocationNames: NSArray; cdecl;
  end;

  TPHCollectionList = class(TOCGenericImport<PHCollectionListClass,
    PHCollectionList>)
  end;

  PPHCollectionList = Pointer;

  PHCollectionListChangeRequestClass = interface(PHChangeRequestClass)
    ['{95EC6476-244C-4863-83B3-0336D06F80C3}']
    { class } function creationRequestForCollectionListWithTitle
      (title: NSString): Pointer { instancetype }; cdecl;
    { class } procedure deleteCollectionLists(collectionLists: Pointer); cdecl;
    [MethodName('changeRequestForCollectionList:')]
    { class } function changeRequestForCollectionList(collectionList
      : PHCollectionList): Pointer { instancetype }; cdecl;
    [MethodName('changeRequestForCollectionList:childCollections:')]
    { class } function changeRequestForCollectionListChildCollections
      (collectionList: PHCollectionList; childCollections: PHFetchResult)
      : Pointer { instancetype }; cdecl;
    { class } function changeRequestForTopLevelCollectionListUserCollections
      (childCollections: PHFetchResult): Pointer { instancetype }; cdecl;
  end;

  PHCollectionListChangeRequest = interface(PHChangeRequest)
    ['{B12CE48E-E8EC-45E5-935E-B69FA6172A15}']
    function placeholderForCreatedCollectionList: PHObjectPlaceholder; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure addChildCollections(collections: Pointer); cdecl;
    procedure insertChildCollections(collections: Pointer;
      atIndexes: NSIndexSet); cdecl;
    procedure removeChildCollections(collections: Pointer); cdecl;
    procedure removeChildCollectionsAtIndexes(indexes: NSIndexSet); cdecl;
    procedure replaceChildCollectionsAtIndexes(indexes: NSIndexSet;
      withChildCollections: Pointer); cdecl;
    procedure moveChildCollectionsAtIndexes(indexes: NSIndexSet;
      toIndex: NSUInteger); cdecl;
  end;

  TPHCollectionListChangeRequest = class
    (TOCGenericImport<PHCollectionListChangeRequestClass,
    PHCollectionListChangeRequest>)
  end;

  PPHCollectionListChangeRequest = Pointer;

  PHImageRequestOptionsClass = interface(NSObjectClass)
    ['{2F6E4BB1-B16F-4FED-924D-5F469E120E60}']
  end;

  PHImageRequestOptions = interface(NSObject)
    ['{CC801DC8-0A6C-4D56-AAF0-71A5643E8733}']
    procedure setVersion(version: PHImageRequestOptionsVersion); cdecl;
    function version: PHImageRequestOptionsVersion; cdecl;
    procedure setDeliveryMode(deliveryMode
      : PHImageRequestOptionsDeliveryMode); cdecl;
    function deliveryMode: PHImageRequestOptionsDeliveryMode; cdecl;
    procedure setResizeMode(resizeMode: PHImageRequestOptionsResizeMode); cdecl;
    function resizeMode: PHImageRequestOptionsResizeMode; cdecl;
    procedure setNormalizedCropRect(normalizedCropRect: CGRect); cdecl;
    function normalizedCropRect: CGRect; cdecl;
    procedure setNetworkAccessAllowed(networkAccessAllowed: Boolean); cdecl;
    function isNetworkAccessAllowed: Boolean; cdecl;
    procedure setSynchronous(synchronous: Boolean); cdecl;
    function isSynchronous: Boolean; cdecl;
    procedure setProgressHandler(progressHandler
      : PHAssetImageProgressHandler); cdecl;
    function progressHandler: PHAssetImageProgressHandler; cdecl;
  end;

  TPHImageRequestOptions = class(TOCGenericImport<PHImageRequestOptionsClass,
    PHImageRequestOptions>)
  end;

  PPHImageRequestOptions = Pointer;

  PHLivePhotoRequestOptionsClass = interface(NSObjectClass)
    ['{160808C6-EEE2-4F8E-8BE8-0889F2AE8F35}']
  end;

  PHLivePhotoRequestOptions = interface(NSObject)
    ['{1146033A-C1FA-4AD4-9C5C-00060F47B1ED}']
    procedure setVersion(version: PHImageRequestOptionsVersion); cdecl;
    function version: PHImageRequestOptionsVersion; cdecl;
    procedure setDeliveryMode(deliveryMode
      : PHImageRequestOptionsDeliveryMode); cdecl;
    function deliveryMode: PHImageRequestOptionsDeliveryMode; cdecl;
    procedure setNetworkAccessAllowed(networkAccessAllowed: Boolean); cdecl;
    function isNetworkAccessAllowed: Boolean; cdecl;
    procedure setProgressHandler(progressHandler
      : PHAssetImageProgressHandler); cdecl;
    function progressHandler: PHAssetImageProgressHandler; cdecl;
  end;

  TPHLivePhotoRequestOptions = class
    (TOCGenericImport<PHLivePhotoRequestOptionsClass,
    PHLivePhotoRequestOptions>)
  end;

  PPHLivePhotoRequestOptions = Pointer;

  PHVideoRequestOptionsClass = interface(NSObjectClass)
    ['{61C85027-EA8B-4C68-B6E0-7B9C107D5852}']
  end;

  PHVideoRequestOptions = interface(NSObject)
    ['{AB6E251F-E874-4CEE-8C61-7ECD2B8FED31}']
    procedure setNetworkAccessAllowed(networkAccessAllowed: Boolean); cdecl;
    function isNetworkAccessAllowed: Boolean; cdecl;
    procedure setVersion(version: PHVideoRequestOptionsVersion); cdecl;
    function version: PHVideoRequestOptionsVersion; cdecl;
    procedure setDeliveryMode(deliveryMode
      : PHVideoRequestOptionsDeliveryMode); cdecl;
    function deliveryMode: PHVideoRequestOptionsDeliveryMode; cdecl;
    procedure setProgressHandler(progressHandler
      : PHAssetVideoProgressHandler); cdecl;
    function progressHandler: PHAssetVideoProgressHandler; cdecl;
  end;

  TPHVideoRequestOptions = class(TOCGenericImport<PHVideoRequestOptionsClass,
    PHVideoRequestOptions>)
  end;

  PPHVideoRequestOptions = Pointer;

  PHImageManagerClass = interface(NSObjectClass)
    ['{9C95DC4A-E698-4002-BD1B-9F62A4E74086}']
    { class } function defaultManager: PHImageManager; cdecl;
  end;

  PHImageManager = interface(NSObject)
    ['{55DBFC02-2FB6-4D0F-B777-9972B0C0CE15}']
    function requestImageForAsset(asset: PHAsset; targetSize: CGSize;
      contentMode: PHImageContentMode; options: PHImageRequestOptions;
      resultHandler: TPhotosResultHandler): PHImageRequestID; cdecl;
    function requestImageDataForAsset(asset: PHAsset;
      options: PHImageRequestOptions; resultHandler: TPhotosResultHandler1)
      : PHImageRequestID; cdecl;
    function requestImageDataAndOrientationForAsset(asset: PHAsset;
      options: PHImageRequestOptions; resultHandler: TPhotosResultHandler2)
      : PHImageRequestID; cdecl;
    procedure cancelImageRequest(requestID: PHImageRequestID); cdecl;
    function requestLivePhotoForAsset(asset: PHAsset; targetSize: CGSize;
      contentMode: PHImageContentMode; options: PHLivePhotoRequestOptions;
      resultHandler: TPhotosResultHandler3): PHImageRequestID; cdecl;
    function requestPlayerItemForVideo(asset: PHAsset;
      options: PHVideoRequestOptions; resultHandler: TPhotosResultHandler4)
      : PHImageRequestID; cdecl;
    function requestExportSessionForVideo(asset: PHAsset;
      options: PHVideoRequestOptions; exportPreset: NSString;
      resultHandler: TPhotosResultHandler5): PHImageRequestID; cdecl;
    function requestAVAssetForVideo(asset: PHAsset;
      options: PHVideoRequestOptions; resultHandler: TPhotosResultHandler6)
      : PHImageRequestID; cdecl;
  end;

  TPHImageManager = class(TOCGenericImport<PHImageManagerClass, PHImageManager>)
  end;

  PPHImageManager = Pointer;

  PHCachingImageManagerClass = interface(PHImageManagerClass)
    ['{6DF413C6-4918-43B5-B686-5A8BA52C2DF2}']
  end;

  PHCachingImageManager = interface(PHImageManager)
    ['{8D2E0850-60BD-474C-A139-FA08DA9A076C}']
    procedure setAllowsCachingHighQualityImages(allowsCachingHighQualityImages
      : Boolean); cdecl;
    function allowsCachingHighQualityImages: Boolean; cdecl;
    procedure startCachingImagesForAssets(assets: NSArray; targetSize: CGSize;
      contentMode: PHImageContentMode; options: PHImageRequestOptions); cdecl;
    procedure stopCachingImagesForAssets(assets: NSArray; targetSize: CGSize;
      contentMode: PHImageContentMode; options: PHImageRequestOptions); cdecl;
    procedure stopCachingImagesForAllAssets; cdecl;
  end;

  TPHCachingImageManager = class(TOCGenericImport<PHCachingImageManagerClass,
    PHCachingImageManager>)
  end;

  PPHCachingImageManager = Pointer;

  PHLivePhotoEditingContextClass = interface(NSObjectClass)
    ['{9FAD402C-D9BE-4FD5-960E-B48BCAD4ACFA}']
  end;

  PHLivePhotoEditingContext = interface(NSObject)
    ['{FF371CF2-0407-4E41-9828-32DDD7720363}']
    function initWithLivePhotoEditingInput(livePhotoInput
      : PHContentEditingInput): Pointer { instancetype }; cdecl;
    function fullSizeImage: CIImage; cdecl;
    function duration: CMTime; cdecl;
    function photoTime: CMTime; cdecl;
    procedure setFrameProcessor(frameProcessor
      : PHLivePhotoFrameProcessingBlock); cdecl;
    function frameProcessor: PHLivePhotoFrameProcessingBlock; cdecl;
    procedure setAudioVolume(audioVolume: Single); cdecl;
    function audioVolume: Single; cdecl;
    function orientation: CGImagePropertyOrientation; cdecl;
    procedure prepareLivePhotoForPlaybackWithTargetSize(targetSize: CGSize;
      options: NSDictionary;
      completionHandler: TPhotosCompletionHandler3); cdecl;
    procedure saveLivePhotoToOutput(output: PHContentEditingOutput;
      options: NSDictionary;
      completionHandler: TPhotosCompletionHandler); cdecl;
    procedure cancel; cdecl;
  end;

  TPHLivePhotoEditingContext = class
    (TOCGenericImport<PHLivePhotoEditingContextClass,
    PHLivePhotoEditingContext>)
  end;

  PPHLivePhotoEditingContext = Pointer;

  PHPersistentObjectChangeDetailsClass = interface(NSObjectClass)
    ['{97EC73CB-4544-46A8-8D92-D0CF86E90C33}']
  end;

  PHPersistentObjectChangeDetails = interface(NSObject)
    ['{A42293B3-2338-4F2F-8EDF-30D02581CBBC}']
    function ObjectType: PHObjectType; cdecl;
    function insertedLocalIdentifiers: NSSet; cdecl;
    function updatedLocalIdentifiers: NSSet; cdecl;
    function deletedLocalIdentifiers: NSSet; cdecl;
  end;

  TPHPersistentObjectChangeDetails = class
    (TOCGenericImport<PHPersistentObjectChangeDetailsClass,
    PHPersistentObjectChangeDetails>)
  end;

  PPHPersistentObjectChangeDetails = Pointer;

  PHPersistentChangeClass = interface(NSObjectClass)
    ['{0EF33FF4-B5E6-4654-83F8-1FD0277CA4BE}']
  end;

  PHPersistentChange = interface(NSObject)
    ['{468F9E2F-EB78-40B2-A809-53D6C4881A2F}']
    function changeToken: PHPersistentChangeToken; cdecl;
    function changeDetailsForObjectType(ObjectType: PHObjectType;
      error: NSError): PHPersistentObjectChangeDetails; cdecl;
  end;

  TPHPersistentChange = class(TOCGenericImport<PHPersistentChangeClass,
    PHPersistentChange>)
  end;

  PPHPersistentChange = Pointer;

  PHProjectClass = interface(PHAssetCollectionClass)
    ['{75B642B1-C90E-4D6B-9D60-4717A9A5171B}']
  end;

  PHProject = interface(PHAssetCollection)
    ['{6AEB72E4-A808-46F2-801F-82FA4D42BBC4}']
    function projectExtensionData: NSData; cdecl;
    function hasProjectPreview: Boolean; cdecl;
  end;

  TPHProject = class(TOCGenericImport<PHProjectClass, PHProject>)
  end;

  PPHProject = Pointer;

  PHProjectChangeRequestClass = interface(PHChangeRequestClass)
    ['{FEC52198-AAF2-442D-93A7-65BF560A9ABF}']
  end;

  PHProjectChangeRequest = interface(PHChangeRequest)
    ['{E906F932-D734-46D7-8140-5A61557B0D2D}']
    function initWithProject(project: PHProject)
      : Pointer { instancetype }; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setProjectExtensionData(projectExtensionData: NSData); cdecl;
    function projectExtensionData: NSData; cdecl;
    procedure setKeyAsset(keyAsset: PHAsset); cdecl;
    procedure setProjectPreviewImage(previewImage: UIImage); cdecl;
    procedure removeAssets(assets: Pointer); cdecl;
  end;

  TPHProjectChangeRequest = class(TOCGenericImport<PHProjectChangeRequestClass,
    PHProjectChangeRequest>)
  end;

  PPHProjectChangeRequest = Pointer;

  // ===== Protocol declarations =====

  PHPhotoLibraryChangeObserver = interface(IObjectiveC)
    ['{56D4C425-D68A-45B7-8BA9-8C9AC201763D}']
    procedure photoLibraryDidChange(changeInstance: PHChange); cdecl;
  end;

  PHPhotoLibraryAvailabilityObserver = interface(IObjectiveC)
    ['{1DB50E46-69B3-421C-969C-2C79CFAEC2D0}']
    procedure photoLibraryDidBecomeUnavailable(photoLibrary
      : PHPhotoLibrary); cdecl;
  end;

  PHLivePhotoFrame = interface(IObjectiveC)
    ['{231E3DDC-26CB-46EF-B4DE-BFDDD7922839}']
    function image: CIImage; cdecl;
    function time: CMTime; cdecl;
    function &type: PHLivePhotoFrameType; cdecl;
    function renderScale: CGFloat; cdecl;
  end;

  // ===== Exported string consts =====

function PHContentEditingInputResultIsInCloudKey: NSString;
function PHContentEditingInputCancelledKey: NSString;
function PHContentEditingInputErrorKey: NSString;
function PHLocalIdentifierNotFound: NSString;
function PHPhotosErrorDomain: Pointer;
function PHLocalIdentifiersErrorKey: Pointer;
function PHImageManagerMaximumSize: Pointer;
function PHImageResultIsInCloudKey: NSString;
function PHImageResultIsDegradedKey: NSString;
function PHImageResultRequestIDKey: NSString;
function PHImageCancelledKey: NSString;
function PHImageErrorKey: NSString;
function PHLivePhotoInfoErrorKey: NSString;
function PHLivePhotoInfoIsDegradedKey: NSString;
function PHLivePhotoInfoCancelledKey: NSString;
function PHLivePhotoShouldRenderAtPlaybackTime: Pointer;
function PHLivePhotoEditingErrorDomain: NSString;


// ===== External functions =====

const
  libPhotos = '/System/Library/Frameworks/Photos.framework/Photos';

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

function PHLocalIdentifierNotFound: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHLocalIdentifierNotFound');
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

function PHLivePhotoEditingErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHLivePhotoEditingErrorDomain');
end;

function PHPhotosErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libPhotos, 'PHPhotosErrorDomain');
end;

function PHLocalIdentifiersErrorKey: Pointer;
begin
  Result := CocoaPointerConst(libPhotos, 'PHLocalIdentifiersErrorKey');
end;

function PHImageManagerMaximumSize: Pointer;
begin
  Result := CocoaPointerConst(libPhotos, 'PHImageManagerMaximumSize');
end;

function PHLivePhotoShouldRenderAtPlaybackTime: Pointer;
begin
  Result := CocoaPointerConst(libPhotos,
    'PHLivePhotoShouldRenderAtPlaybackTime');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

PhotosModule := dlopen(MarshaledAString(libPhotos), RTLD_LAZY);

finalization

dlclose(PhotosModule);
{$ENDIF IOS}

end.
