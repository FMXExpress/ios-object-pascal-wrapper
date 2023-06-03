{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework FileProvider
//

unit iOSapi.FileProvider;

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
  NSFileProviderItemCapabilitiesAllowsReading = 1 shl 0;
  NSFileProviderItemCapabilitiesAllowsWriting = 1 shl 1;
  NSFileProviderItemCapabilitiesAllowsReparenting = 1 shl 2;
  NSFileProviderItemCapabilitiesAllowsRenaming = 1 shl 3;
  NSFileProviderItemCapabilitiesAllowsTrashing = 1 shl 4;
  NSFileProviderItemCapabilitiesAllowsDeleting = 1 shl 5;
  NSFileProviderItemCapabilitiesAllowsEvicting = 1 shl 6;
  NSFileProviderItemCapabilitiesAllowsExcludingFromSync = 1 shl 7;
  NSFileProviderItemCapabilitiesAllowsAddingSubItems =
    NSFileProviderItemCapabilitiesAllowsWriting;
  NSFileProviderItemCapabilitiesAllowsContentEnumerating =
    NSFileProviderItemCapabilitiesAllowsReading;
  NSFileProviderItemCapabilitiesAllowsAll =
    NSFileProviderItemCapabilitiesAllowsReading or
    NSFileProviderItemCapabilitiesAllowsWriting or
    NSFileProviderItemCapabilitiesAllowsReparenting or
    NSFileProviderItemCapabilitiesAllowsRenaming or
    NSFileProviderItemCapabilitiesAllowsTrashing or
    NSFileProviderItemCapabilitiesAllowsDeleting;
  NSFileProviderItemContents = 1 shl 0;
  NSFileProviderItemFilename = 1 shl 1;
  NSFileProviderItemParentItemIdentifier = 1 shl 2;
  NSFileProviderItemLastUsedDate = 1 shl 3;
  NSFileProviderItemTagData = 1 shl 4;
  NSFileProviderItemFavoriteRank = 1 shl 5;
  NSFileProviderItemCreationDate = 1 shl 6;
  NSFileProviderItemContentModificationDate = 1 shl 7;
  NSFileProviderItemFileSystemFlags = 1 shl 8;
  NSFileProviderItemExtendedAttributes = 1 shl 9;
  NSFileProviderItemTypeAndCreator = 1 shl 10;
  NSFileProviderFileSystemUserExecutable = 1 shl 0;
  NSFileProviderFileSystemUserReadable = 1 shl 1;
  NSFileProviderFileSystemUserWritable = 1 shl 2;
  NSFileProviderFileSystemHidden = 1 shl 3;
  NSFileProviderFileSystemPathExtensionHidden = 1 shl 4;
  NSFileProviderContentPolicyInherited = 0;
  NSFileProviderContentPolicyDownloadLazily = 1;
  NSFileProviderContentPolicyDownloadLazilyAndEvictOnRemoteUpdate = 2;
  NSFileProviderContentPolicyDownloadEagerlyAndKeepDownloaded = 3;
  NSFileProviderDomainTestingModeAlwaysEnabled = 1 shl 0;
  NSFileProviderDomainTestingModeInteractive = 1 shl 1;
  NSFileProviderErrorNotAuthenticated = -1000;
  NSFileProviderErrorFilenameCollision = -1001;
  NSFileProviderErrorSyncAnchorExpired = -1002;
  NSFileProviderErrorPageExpired = NSFileProviderErrorSyncAnchorExpired;
  NSFileProviderErrorInsufficientQuota = -1003;
  NSFileProviderErrorServerUnreachable = -1004;
  NSFileProviderErrorNoSuchItem = -1005;
  NSFileProviderErrorDeletionRejected = -1006;
  NSFileProviderErrorDirectoryNotEmpty = -1007;
  NSFileProviderErrorProviderNotFound = -2001;
  NSFileProviderErrorProviderTranslocated = -2002;
  NSFileProviderErrorOlderExtensionVersionRunning = -2003;
  NSFileProviderErrorNewerExtensionVersionFound = -2004;
  NSFileProviderErrorCannotSynchronize = -2005;
  NSFileProviderErrorNonEvictableChildren = -2006;
  NSFileProviderErrorUnsyncedEdits = -2007;
  NSFileProviderErrorNonEvictable = -2008;
  NSFileProviderErrorVersionNoLongerAvailable = -2009;
  NSFileProviderErrorExcludedFromSync = -2010;
  NSFileProviderErrorDomainDisabled = -2011;
  NSFileProviderModifyItemMayAlreadyExist = 1 shl 0;
  NSFileProviderDomainRemovalModeRemoveAll = 0;
  NSFileProviderDomainRemovalModePreserveDirtyUserData = 1;
  NSFileProviderDomainRemovalModePreserveDownloadedUserData = 2;
  NSFileProviderManagerDisconnectionOptionsTemporary = 1 shl 0;
  NSFileProviderCreateItemMayAlreadyExist = 1 shl 0;
  NSFileProviderCreateItemDeletionConflicted = 1 shl 1;
  NSFileProviderDeleteItemRecursive = 1 shl 0;
  NSFileProviderMaterializationFlagsKnownSparseRanges = (1 shl 0);
  NSFileProviderFetchContentsOptionsStrictVersioning = (1 shl 0);
  NSFileProviderTestingOperationTypeIngestion = 0;
  NSFileProviderTestingOperationTypeLookup = 1;
  NSFileProviderTestingOperationTypeCreation = 2;
  NSFileProviderTestingOperationTypeModification = 3;
  NSFileProviderTestingOperationTypeDeletion = 4;
  NSFileProviderTestingOperationTypeContentFetch = 5;
  NSFileProviderTestingOperationTypeChildrenEnumeration = 6;
  NSFileProviderTestingOperationTypeCollisionResolution = 7;
  NSFileProviderTestingOperationSideDisk = 0;
  NSFileProviderTestingOperationSideFileProvider = 1;

type

  // ===== Forward declarations =====
{$M+}
  NSFileProviderItemVersion = interface;
  NSFileProviderItem = interface;
  NSFileProviderDomain = interface;
  NSFileProviderExtension = interface;
  NSFileProviderDomainVersion = interface;
  NSFileProviderEnumerationObserver = interface;
  NSFileProviderChangeObserver = interface;
  NSFileProviderEnumerator = interface;
  NSFileProviderError = interface;
  NSFileProviderRequest = interface;
  NSFileProviderManager = interface;
  NSFileProviderPendingSetEnumerator = interface;
  NSFileProviderServiceSource = interface;
  NSFileProviderItemDecorating = interface;
  NSFileProviderEnumerating = interface;
  NSFileProviderReplicatedExtension = interface;
  NSFileProviderIncrementalContentFetching = interface;
  NSFileProviderServicing = interface;
  NSFileProviderThumbnailing = interface;
  NSFileProviderCustomAction = interface;
  NSFileProviderUserInteractionSuppressing = interface;
  NSFileProviderDomainState = interface;
  NSFileProviderPartialContentFetching = interface;
  NSFileProviderTestingIngestion = interface;
  NSFileProviderTestingLookup = interface;
  NSFileProviderTestingCreation = interface;
  NSFileProviderTestingModification = interface;
  NSFileProviderTestingDeletion = interface;
  NSFileProviderTestingContentFetch = interface;
  NSFileProviderTestingChildrenEnumeration = interface;
  NSFileProviderTestingCollisionResolution = interface;
  NSFileProviderTestingOperation = interface;

  // ===== Framework typedefs =====
{$M+}
  NSFileProviderItemIdentifier = NSString;
  PNSFileProviderItemIdentifier = ^NSFileProviderItemIdentifier;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  NSFileProviderItemCapabilities = NSUInteger;
  NSFileProviderItemFields = NSUInteger;
  NSFileProviderFileSystemFlags = NSUInteger;
  FourCharCode = UInt32;
  PFourCharCode = ^FourCharCode;
  OSType = FourCharCode;
  POSType = ^OSType;

  NSFileProviderTypeAndCreator = record
    &type: OSType;
    creator: OSType;
  end;

  PNSFileProviderTypeAndCreator = ^NSFileProviderTypeAndCreator;

  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  NSFileProviderContentPolicy = NSInteger;
  NSFileProviderItem = Pointer;
  PNSFileProviderItem = ^NSFileProviderItem;
  TFileProviderCompletionHandler = procedure(param1: NSError) of object;
  NSFileProviderDomainIdentifier = NSString;
  PNSFileProviderDomainIdentifier = ^NSFileProviderDomainIdentifier;
  NSComparisonResult = NSInteger;
  NSFileProviderDomainTestingModes = NSUInteger;
  NSNotificationName = NSString;
  PNSNotificationName = ^NSNotificationName;
  NSFileProviderSyncAnchor = NSData;
  PNSFileProviderSyncAnchor = ^NSFileProviderSyncAnchor;
  NSFileProviderPage = NSData;
  PNSFileProviderPage = ^NSFileProviderPage;
  TFileProviderCompletionHandler1 = procedure(param1: NSFileProviderSyncAnchor)
    of object;
  NSErrorDomain = NSString;
  PNSErrorDomain = ^NSErrorDomain;
  NSErrorUserInfoKey = NSString;
  PNSErrorUserInfoKey = ^NSErrorUserInfoKey;
  NSFileProviderErrorCode = NSInteger;
  NSFileProviderModifyItemOptions = NSUInteger;
  NSFileProviderDomainRemovalMode = NSInteger;
  TFileProviderCompletionHandler2 = procedure(param1: NSURL; param2: NSError)
    of object;
  TFileProviderCompletionHandler3 = procedure
    (param1: NSFileProviderItemIdentifier;
    param2: NSFileProviderDomainIdentifier; param3: NSError) of object;
  TFileProviderCompletionHandler4 = procedure(param1: NSURL) of object;
  TFileProviderCompletionHandler5 = procedure(param1: NSArray; param2: NSError)
    of object;
  NSProgressFileOperationKind = NSString;
  PNSProgressFileOperationKind = ^NSProgressFileOperationKind;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  NSFileProviderManagerDisconnectionOptions = NSUInteger;

  _NSRange = record
    location: NSUInteger;
    length: NSUInteger;
  end;

  P_NSRange = ^_NSRange;
  NSRange = _NSRange;
  PNSRange = ^NSRange;

  NSFileProviderExtensionActionIdentifier = NSString;
  PNSFileProviderExtensionActionIdentifier = ^
    NSFileProviderExtensionActionIdentifier;
  TFileProviderCompletionHandler6 = procedure(param1: NSFileProviderItem;
    param2: NSError) of object;
  NSFileProviderServiceName = NSString;
  PNSFileProviderServiceName = ^NSFileProviderServiceName;
  TFileProviderCompletionHandler7 = procedure(param1: NSFileProviderService;
    param2: NSError) of object;
  CGFloat = Single;
  PCGFloat = ^CGFloat;

  CGSize = record
    width: CGFloat;
    height: CGFloat;
  end;

  PCGSize = ^CGSize;

  TFileProviderPerThumbnailCompletionHandler = procedure
    (param1: NSFileProviderItemIdentifier; param2: NSData; param3: NSError)
    of object;
  NSFileProviderItemDecorationIdentifier = NSString;
  PNSFileProviderItemDecorationIdentifier = ^
    NSFileProviderItemDecorationIdentifier;
  NSFileProviderCreateItemOptions = NSUInteger;
  NSFileProviderDeleteItemOptions = NSUInteger;
  NSFileProviderMaterializationFlags = NSUInteger;
  NSFileProviderFetchContentsOptions = NSUInteger;
  TFileProviderCompletionHandler8 = procedure(param1: NSURL;
    param2: NSFileProviderItem; param3: NSError) of object;
  TFileProviderCompletionHandler9 = procedure(param1: NSFileProviderItem;
    param2: NSFileProviderItemFields; param3: Boolean; param4: NSError)
    of object;
  TFileProviderCompletionHandler10 = procedure() of object;
  TFileProviderCompletionHandler11 = procedure(param1: NSURL;
    param2: NSFileProviderItem; param3: NSRange;
    param4: NSFileProviderMaterializationFlags; param5: NSError) of object;
  NSFileProviderTestingOperationType = NSInteger;
  NSFileProviderTestingOperationSide = NSUInteger;
  // ===== Interface declarations =====

  NSFileProviderItemVersionClass = interface(NSObjectClass)
    ['{BFEFB23D-A0FB-46E7-BAA6-ED125DC6200B}']
  end;

  NSFileProviderItemVersion = interface(NSObject)
    ['{5F900AA8-7E8E-462F-91CA-9E4A55FAE51E}']
    procedure setBeforeFirstSyncComponent(beforeFirstSyncComponent
      : NSData); cdecl;
    function beforeFirstSyncComponent: NSData; cdecl;
    function initWithContentVersion(contentVersion: NSData;
      metadataVersion: NSData): Pointer { instancetype }; cdecl;
    function contentVersion: NSData; cdecl;
    function metadataVersion: NSData; cdecl;
  end;

  TNSFileProviderItemVersion = class
    (TOCGenericImport<NSFileProviderItemVersionClass,
    NSFileProviderItemVersion>)
  end;

  PNSFileProviderItemVersion = Pointer;

  NSFileProviderDomainClass = interface(NSObjectClass)
    ['{60FF3F72-1965-44D4-8FDF-F6CABAFFCD33}']
  end;

  NSFileProviderDomain = interface(NSObject)
    ['{BBDB45A7-FD49-400A-9FD3-CA3D74FF5961}']
    [MethodName
      ('initWithIdentifier:displayName:pathRelativeToDocumentStorage:')]
    function initWithIdentifierDisplayNamePathRelativeToDocumentStorage
      (identifier: NSFileProviderDomainIdentifier; displayName: NSString;
      pathRelativeToDocumentStorage: NSString): Pointer { instancetype }; cdecl;
    [MethodName('initWithIdentifier:displayName:')]
    function initWithIdentifierDisplayName(identifier
      : NSFileProviderDomainIdentifier; displayName: NSString)
      : Pointer { instancetype }; cdecl;
    function identifier: NSFileProviderDomainIdentifier; cdecl;
    function displayName: NSString; cdecl;
    function pathRelativeToDocumentStorage: NSString; cdecl;
    function isDisconnected: Boolean; cdecl;
    function userEnabled: Boolean; cdecl;
    procedure setHidden(hidden: Boolean); cdecl;
    function isHidden: Boolean; cdecl;
    function isReplicated: Boolean; cdecl;
    procedure setTestingModes(testingModes
      : NSFileProviderDomainTestingModes); cdecl;
    function testingModes: NSFileProviderDomainTestingModes; cdecl;
    function backingStoreIdentity: NSData; cdecl;
    procedure setSupportsSyncingTrash(supportsSyncingTrash: Boolean); cdecl;
    function supportsSyncingTrash: Boolean; cdecl;
    function volumeUUID: NSUUID; cdecl;
  end;

  TNSFileProviderDomain = class(TOCGenericImport<NSFileProviderDomainClass,
    NSFileProviderDomain>)
  end;

  PNSFileProviderDomain = Pointer;

  NSFileProviderExtensionClass = interface(NSObjectClass)
    ['{B8632E18-9D38-48CC-BA31-7DDE8E371625}']
    { class } function writePlaceholderAtURL(placeholderURL: NSURL;
      withMetadata: NSDictionary; error: NSError): Boolean; cdecl;
    { class } function placeholderURLForURL(url: NSURL): NSURL; cdecl;
  end;

  NSFileProviderExtension = interface(NSObject)
    ['{21A0C558-32A9-4B74-A8C9-7F5ADC2DA7C7}']
    function itemForIdentifier(identifier: NSFileProviderItemIdentifier;
      error: NSError): NSFileProviderItem; cdecl;
    function URLForItemWithPersistentIdentifier
      (identifier: NSFileProviderItemIdentifier): NSURL; cdecl;
    function persistentIdentifierForItemAtURL(url: NSURL)
      : NSFileProviderItemIdentifier; cdecl;
    procedure providePlaceholderAtURL(url: NSURL;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    procedure startProvidingItemAtURL(url: NSURL;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    procedure stopProvidingItemAtURL(url: NSURL); cdecl;
    procedure itemChangedAtURL(url: NSURL); cdecl;
    function providerIdentifier: NSString; cdecl;
    function documentStorageURL: NSURL; cdecl;
    function domain: NSFileProviderDomain; cdecl;
    function enumeratorForContainerItemIdentifier(containerItemIdentifier
      : NSFileProviderItemIdentifier; error: NSError): Pointer; cdecl;
    procedure importDocumentAtURL(fileURL: NSURL;
      toParentItemIdentifier: NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler6); cdecl;
    procedure createDirectoryWithName(directoryName: NSString;
      inParentItemIdentifier: NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler6); cdecl;
    procedure renameItemWithIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier; toName: NSString;
      completionHandler: TFileProviderCompletionHandler6); cdecl;
    procedure reparentItemWithIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier;
      toParentItemWithIdentifier: NSFileProviderItemIdentifier;
      newName: NSString;
      completionHandler: TFileProviderCompletionHandler6); cdecl;
    procedure trashItemWithIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler6); cdecl;
    procedure untrashItemWithIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier;
      toParentItemIdentifier: NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler6); cdecl;
    procedure deleteItemWithIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    procedure setLastUsedDate(lastUsedDate: NSDate;
      forItemIdentifier: NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler6); cdecl;
    procedure setTagData(tagData: NSData;
      forItemIdentifier: NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler6); cdecl;
    procedure setFavoriteRank(favoriteRank: NSNumber;
      forItemIdentifier: NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler6); cdecl;
    function supportedServiceSourcesForItemIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier; error: NSError): NSArray; cdecl;
    function fetchThumbnailsForItemIdentifiers(itemIdentifiers: NSArray;
      requestedSize: CGSize; perThumbnailCompletionHandler
      : TFileProviderPerThumbnailCompletionHandler;
      completionHandler: TFileProviderCompletionHandler): NSProgress; cdecl;
  end;

  TNSFileProviderExtension = class
    (TOCGenericImport<NSFileProviderExtensionClass, NSFileProviderExtension>)
  end;

  PNSFileProviderExtension = Pointer;

  NSFileProviderDomainVersionClass = interface(NSObjectClass)
    ['{DF82643B-0687-4395-BDCA-2CF4ACCC8974}']
  end;

  NSFileProviderDomainVersion = interface(NSObject)
    ['{4148234A-EE0F-4C09-B6E4-03EE4BCE168A}']
    function next: NSFileProviderDomainVersion; cdecl;
    function compare(otherVersion: NSFileProviderDomainVersion)
      : NSComparisonResult; cdecl;
  end;

  TNSFileProviderDomainVersion = class
    (TOCGenericImport<NSFileProviderDomainVersionClass,
    NSFileProviderDomainVersion>)
  end;

  PNSFileProviderDomainVersion = Pointer;

  NSFileProviderError = interface(IObjectiveC)
    ['{4B6169EC-3A68-4D38-9945-6F835B8730EA}']
    function fileProviderErrorForCollisionWithItem(existingItem
      : NSFileProviderItem): Pointer { instancetype }; cdecl;
    function fileProviderErrorForNonExistentItemWithIdentifier
      (itemIdentifier: NSFileProviderItemIdentifier)
      : Pointer { instancetype }; cdecl;
    function fileProviderErrorForRejectedDeletionOfItem(updatedVersion
      : NSFileProviderItem): Pointer { instancetype }; cdecl;
  end;

  NSFileProviderRequestClass = interface(NSObjectClass)
    ['{56C601CC-D49B-4ECA-8292-71EF700C4AC4}']
  end;

  NSFileProviderRequest = interface(NSObject)
    ['{DCD6C45C-CC1B-49CE-87CF-30C37FEE56E2}']
    function isSystemRequest: Boolean; cdecl;
    function isFileViewerRequest: Boolean; cdecl;
    function requestingExecutable: NSURL; cdecl;
    function domainVersion: NSFileProviderDomainVersion; cdecl;
  end;

  TNSFileProviderRequest = class(TOCGenericImport<NSFileProviderRequestClass,
    NSFileProviderRequest>)
  end;

  PNSFileProviderRequest = Pointer;

  NSFileProviderManagerClass = interface(NSObjectClass)
    ['{031CB3D1-F777-443C-B28B-E3008ADB38D5}']
    { class } function managerForDomain(domain: NSFileProviderDomain)
      : Pointer { instancetype }; cdecl;
    { class } procedure getIdentifierForUserVisibleFileAtURL(url: NSURL;
      completionHandler: TFileProviderCompletionHandler3); cdecl;
    { class } function writePlaceholderAtURL(placeholderURL: NSURL;
      withMetadata: NSFileProviderItem; error: NSError): Boolean; cdecl;
    { class } function placeholderURLForURL(url: NSURL): NSURL; cdecl;
    { class } procedure addDomain(domain: NSFileProviderDomain;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    [MethodName('removeDomain:completionHandler:')]
    { class } procedure removeDomainCompletionHandler
      (domain: NSFileProviderDomain;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    [MethodName('removeDomain:mode:completionHandler:')]
    { class } procedure removeDomainModeCompletionHandler
      (domain: NSFileProviderDomain; mode: NSFileProviderDomainRemovalMode;
      completionHandler: TFileProviderCompletionHandler4); cdecl;
    { class } procedure getDomainsWithCompletionHandler(completionHandler
      : TFileProviderCompletionHandler5); cdecl;
    { class } procedure removeAllDomainsWithCompletionHandler(completionHandler
      : TFileProviderCompletionHandler); cdecl;
    { class } procedure importDomain(domain: NSFileProviderDomain;
      fromDirectoryAtURL: NSURL;
      completionHandler: TFileProviderCompletionHandler); cdecl;
  end;

  NSFileProviderManager = interface(NSObject)
    ['{46C3EE29-A070-4DEA-AD4E-089A55813742}']
    procedure setDefaultManager(defaultManager: NSFileProviderManager); cdecl;
    function defaultManager: NSFileProviderManager; cdecl;
    procedure signalEnumeratorForContainerItemIdentifier(containerItemIdentifier
      : NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    procedure getUserVisibleURLForItemIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler2); cdecl;
    procedure registerURLSessionTask(task: NSURLSessionTask;
      forItemWithIdentifier: NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    function providerIdentifier: NSString; cdecl;
    function documentStorageURL: NSURL; cdecl;
    function temporaryDirectoryURLWithError(error: NSError): NSURL; cdecl;
    procedure signalErrorResolved(error: NSError;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    function globalProgressForKind(kind: NSProgressFileOperationKind)
      : NSProgress; cdecl;
    function enumeratorForMaterializedItems: Pointer; cdecl;
    function enumeratorForPendingItems: Pointer; cdecl;
    procedure reimportItemsBelowItemWithIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    procedure requestModificationOfFields(fields: NSFileProviderItemFields;
      forItemWithIdentifier: NSFileProviderItemIdentifier;
      options: NSFileProviderModifyItemOptions;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    procedure evictItemWithIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    procedure waitForChangesOnItemsBelowItemWithIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    procedure waitForStabilizationWithCompletionHandler(completionHandler
      : TFileProviderCompletionHandler); cdecl;
    procedure disconnectWithReason(localizedReason: NSString;
      options: NSFileProviderManagerDisconnectionOptions;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    procedure reconnectWithCompletionHandler(completionHandler
      : TFileProviderCompletionHandler); cdecl;
    procedure requestDownloadForItemWithIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier; requestedRange: NSRange;
      completionHandler: TFileProviderCompletionHandler); cdecl;
    procedure getServiceWithName(serviceName: NSFileProviderServiceName;
      itemIdentifier: NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler7); cdecl;
    function listAvailableTestingOperationsWithError(error: NSError)
      : NSArray; cdecl;
    function runTestingOperations(operations: NSArray; error: NSError)
      : NSDictionary; cdecl;
  end;

  TNSFileProviderManager = class(TOCGenericImport<NSFileProviderManagerClass,
    NSFileProviderManager>)
  end;

  PNSFileProviderManager = Pointer;

  // ===== Protocol declarations =====

  NSFileProviderItem = interface(IObjectiveC)
    ['{B2D8FCA7-5825-465F-9DC4-3EBBB4E7A13E}']
    function itemIdentifier: NSFileProviderItemIdentifier; cdecl;
    function parentItemIdentifier: NSFileProviderItemIdentifier; cdecl;
    function filename: NSString; cdecl;
    function contentType: UTType; cdecl;
    function typeIdentifier: NSString; cdecl;
    function typeAndCreator: NSFileProviderTypeAndCreator; cdecl;
    function capabilities: NSFileProviderItemCapabilities; cdecl;
    function fileSystemFlags: NSFileProviderFileSystemFlags; cdecl;
    function documentSize: NSNumber; cdecl;
    function childItemCount: NSNumber; cdecl;
    function creationDate: NSDate; cdecl;
    function contentModificationDate: NSDate; cdecl;
    function extendedAttributes: NSDictionary; cdecl;
    function lastUsedDate: NSDate; cdecl;
    function tagData: NSData; cdecl;
    function favoriteRank: NSNumber; cdecl;
    function isTrashed: Boolean; cdecl;
    function isUploaded: Boolean; cdecl;
    function isUploading: Boolean; cdecl;
    function uploadingError: NSError; cdecl;
    function isDownloaded: Boolean; cdecl;
    function isDownloading: Boolean; cdecl;
    function downloadingError: NSError; cdecl;
    function isMostRecentVersionDownloaded: Boolean; cdecl;
    function isShared: Boolean; cdecl;
    function isSharedByCurrentUser: Boolean; cdecl;
    function ownerNameComponents: NSPersonNameComponents; cdecl;
    function mostRecentEditorNameComponents: NSPersonNameComponents; cdecl;
    function versionIdentifier: NSData; cdecl;
    function itemVersion: NSFileProviderItemVersion; cdecl;
    function symlinkTargetPath: NSString; cdecl;
    function userInfo: NSDictionary; cdecl;
    function contentPolicy: NSFileProviderContentPolicy; cdecl;
  end;

  NSFileProviderEnumerationObserver = interface(IObjectiveC)
    ['{B10F8430-77F2-4C14-B7E7-5D8F4D324DBD}']
    procedure didEnumerateItems(updatedItems: NSArray); cdecl;
    procedure finishEnumeratingUpToPage(nextPage: NSFileProviderPage); cdecl;
    procedure finishEnumeratingWithError(error: NSError); cdecl;
    function suggestedPageSize: NSInteger; cdecl;
  end;

  NSFileProviderChangeObserver = interface(IObjectiveC)
    ['{03F88527-558B-49FD-8BC9-EC80E6ADCDF1}']
    procedure didUpdateItems(updatedItems: NSArray); cdecl;
    procedure didDeleteItemsWithIdentifiers(deletedItemIdentifiers
      : NSArray); cdecl;
    procedure finishEnumeratingChangesUpToSyncAnchor
      (anchor: NSFileProviderSyncAnchor; moreComing: Boolean); cdecl;
    procedure finishEnumeratingWithError(error: NSError); cdecl;
    function suggestedBatchSize: NSInteger; cdecl;
  end;

  NSFileProviderEnumerator = interface(IObjectiveC)
    ['{8819F531-C8CC-4077-8C2C-86D06E993553}']
    procedure invalidate; cdecl;
    procedure enumerateItemsForObserver(observer: Pointer;
      startingAtPage: NSFileProviderPage); cdecl;
    procedure enumerateChangesForObserver(observer: Pointer;
      fromSyncAnchor: NSFileProviderSyncAnchor); cdecl;
    procedure currentSyncAnchorWithCompletionHandler(completionHandler
      : TFileProviderCompletionHandler1); cdecl;
  end;

  NSFileProviderPendingSetEnumerator = interface(IObjectiveC)
    ['{810E6687-FB46-466A-9CB3-0011D25BF7D4}']
    function domainVersion: NSFileProviderDomainVersion; cdecl;
    function refreshInterval: NSTimeInterval; cdecl;
    function isMaximumSizeReached: Boolean; cdecl;
  end;

  NSFileProviderServiceSource = interface(IObjectiveC)
    ['{0FB3FB23-D6ED-4ECF-8C4C-BC39BF107238}']
    function serviceName: NSFileProviderServiceName; cdecl;
    function makeListenerEndpointAndReturnError(error: NSError)
      : NSXPCListenerEndpoint; cdecl;
    function isRestricted: Boolean; cdecl;
  end;

  NSFileProviderItemDecorating = interface(IObjectiveC)
    ['{2D10B4C8-67AE-4859-BD95-97FCFCD026A9}']
    function decorations: NSArray; cdecl;
  end;

  NSFileProviderEnumerating = interface(IObjectiveC)
    ['{CB1E7C6E-5FE4-412B-825B-C6C2C686F086}']
    function enumeratorForContainerItemIdentifier(containerItemIdentifier
      : NSFileProviderItemIdentifier; request: NSFileProviderRequest;
      error: NSError): Pointer; cdecl;
  end;

  NSFileProviderReplicatedExtension = interface(IObjectiveC)
    ['{D6B1FB84-3A5E-4CA2-8495-C81B21ADDB2F}']
    function initWithDomain(domain: NSFileProviderDomain)
      : Pointer { instancetype }; cdecl;
    procedure invalidate; cdecl;
    function itemForIdentifier(identifier: NSFileProviderItemIdentifier;
      request: NSFileProviderRequest;
      completionHandler: TFileProviderCompletionHandler6): NSProgress; cdecl;
    function fetchContentsForItemWithIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier; version: NSFileProviderItemVersion;
      request: NSFileProviderRequest;
      completionHandler: TFileProviderCompletionHandler8): NSProgress; cdecl;
    function createItemBasedOnTemplate(itemTemplate: NSFileProviderItem;
      fields: NSFileProviderItemFields; contents: NSURL;
      options: NSFileProviderCreateItemOptions; request: NSFileProviderRequest;
      completionHandler: TFileProviderCompletionHandler9): NSProgress; cdecl;
    function modifyItem(item: NSFileProviderItem;
      baseVersion: NSFileProviderItemVersion;
      changedFields: NSFileProviderItemFields; contents: NSURL;
      options: NSFileProviderModifyItemOptions; request: NSFileProviderRequest;
      completionHandler: TFileProviderCompletionHandler9): NSProgress; cdecl;
    function deleteItemWithIdentifier(identifier: NSFileProviderItemIdentifier;
      baseVersion: NSFileProviderItemVersion;
      options: NSFileProviderDeleteItemOptions; request: NSFileProviderRequest;
      completionHandler: TFileProviderCompletionHandler): NSProgress; cdecl;
    procedure importDidFinishWithCompletionHandler(completionHandler
      : TFileProviderCompletionHandler10); cdecl;
    procedure materializedItemsDidChangeWithCompletionHandler(completionHandler
      : TFileProviderCompletionHandler10); cdecl;
    procedure pendingItemsDidChangeWithCompletionHandler(completionHandler
      : TFileProviderCompletionHandler10); cdecl;
  end;

  NSFileProviderIncrementalContentFetching = interface(IObjectiveC)
    ['{B1538DF9-3DF7-4B57-BA70-B2F3945AA6C3}']
    function fetchContentsForItemWithIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier; version: NSFileProviderItemVersion;
      usingExistingContentsAtURL: NSURL;
      existingVersion: NSFileProviderItemVersion;
      request: NSFileProviderRequest;
      completionHandler: TFileProviderCompletionHandler8): NSProgress; cdecl;
  end;

  NSFileProviderServicing = interface(IObjectiveC)
    ['{23C344A0-18CA-497D-B313-09378DE462E5}']
    function supportedServiceSourcesForItemIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier;
      completionHandler: TFileProviderCompletionHandler5): NSProgress; cdecl;
  end;

  NSFileProviderThumbnailing = interface(IObjectiveC)
    ['{CC371F26-3824-4813-A8C1-BC6B215BD4B0}']
    function fetchThumbnailsForItemIdentifiers(itemIdentifiers: NSArray;
      requestedSize: CGSize; perThumbnailCompletionHandler
      : TFileProviderPerThumbnailCompletionHandler;
      completionHandler: TFileProviderCompletionHandler): NSProgress; cdecl;
  end;

  NSFileProviderCustomAction = interface(IObjectiveC)
    ['{5777E9B5-C285-4D42-882C-0852E27A7F35}']
    function performActionWithIdentifier(actionIdentifier
      : NSFileProviderExtensionActionIdentifier;
      onItemsWithIdentifiers: NSArray;
      completionHandler: TFileProviderCompletionHandler): NSProgress; cdecl;
  end;

  NSFileProviderUserInteractionSuppressing = interface(IObjectiveC)
    ['{420FEE6C-C098-4A6A-811C-3D7FE73C87C3}']
    procedure setInteractionSuppressed(suppression: Boolean;
      forIdentifier: NSString); cdecl;
    function isInteractionSuppressedForIdentifier(suppressionIdentifier
      : NSString): Boolean; cdecl;
  end;

  NSFileProviderDomainState = interface(IObjectiveC)
    ['{EF6C2C39-DCC1-471B-A881-D42A8D16AEF3}']
    function domainVersion: NSFileProviderDomainVersion; cdecl;
    function userInfo: NSDictionary; cdecl;
  end;

  NSFileProviderPartialContentFetching = interface(IObjectiveC)
    ['{DA26D31F-10E3-4256-B3B5-02ECE0406F3A}']
    function fetchPartialContentsForItemWithIdentifier(itemIdentifier
      : NSFileProviderItemIdentifier; version: NSFileProviderItemVersion;
      request: NSFileProviderRequest; minimalRange: NSRange;
      aligningTo: NSUInteger; options: NSFileProviderFetchContentsOptions;
      completionHandler: TFileProviderCompletionHandler11): NSProgress; cdecl;
  end;

  NSFileProviderTestingIngestion = interface(IObjectiveC)
    ['{97C83A88-BFF7-4241-8713-B6CC55F6875D}']
    function side: NSFileProviderTestingOperationSide; cdecl;
    function itemIdentifier: NSFileProviderItemIdentifier; cdecl;
    function item: NSFileProviderItem; cdecl;
  end;

  NSFileProviderTestingLookup = interface(IObjectiveC)
    ['{DF2490C5-9E8E-4FF2-BBCD-E9A505CF6759}']
    function side: NSFileProviderTestingOperationSide; cdecl;
    function itemIdentifier: NSFileProviderItemIdentifier; cdecl;
  end;

  NSFileProviderTestingCreation = interface(IObjectiveC)
    ['{FF2C42B4-50E5-4EC8-B89F-CF10D5315EFB}']
    function targetSide: NSFileProviderTestingOperationSide; cdecl;
    function sourceItem: NSFileProviderItem; cdecl;
    function domainVersion: NSFileProviderDomainVersion; cdecl;
  end;

  NSFileProviderTestingModification = interface(IObjectiveC)
    ['{231B4235-2816-4D49-ABE8-DC90A258AE97}']
    function targetSide: NSFileProviderTestingOperationSide; cdecl;
    function sourceItem: NSFileProviderItem; cdecl;
    function targetItemIdentifier: NSFileProviderItemIdentifier; cdecl;
    function targetItemBaseVersion: NSFileProviderItemVersion; cdecl;
    function changedFields: NSFileProviderItemFields; cdecl;
    function domainVersion: NSFileProviderDomainVersion; cdecl;
  end;

  NSFileProviderTestingDeletion = interface(IObjectiveC)
    ['{0161F55F-12AF-4D2D-B083-BD94BC0ABE79}']
    function targetSide: NSFileProviderTestingOperationSide; cdecl;
    function sourceItemIdentifier: NSFileProviderItemIdentifier; cdecl;
    function targetItemIdentifier: NSFileProviderItemIdentifier; cdecl;
    function targetItemBaseVersion: NSFileProviderItemVersion; cdecl;
    function domainVersion: NSFileProviderDomainVersion; cdecl;
  end;

  NSFileProviderTestingContentFetch = interface(IObjectiveC)
    ['{399D0B57-B0FC-427C-A58F-2D4FF9472B9E}']
    function side: NSFileProviderTestingOperationSide; cdecl;
    function itemIdentifier: NSFileProviderItemIdentifier; cdecl;
  end;

  NSFileProviderTestingChildrenEnumeration = interface(IObjectiveC)
    ['{236E029C-DA23-401F-93A0-9282D9FE71DE}']
    function side: NSFileProviderTestingOperationSide; cdecl;
    function itemIdentifier: NSFileProviderItemIdentifier; cdecl;
  end;

  NSFileProviderTestingCollisionResolution = interface(IObjectiveC)
    ['{D11C5683-84C2-4801-8F78-806CEA79B650}']
    function side: NSFileProviderTestingOperationSide; cdecl;
    function renamedItem: NSFileProviderItem; cdecl;
  end;

  NSFileProviderTestingOperation = interface(IObjectiveC)
    ['{7D2E9BE0-1F55-46DB-AE4D-1E498883D7DA}']
    function &type: NSFileProviderTestingOperationType; cdecl;
    function asIngestion: Pointer; cdecl;
    function asLookup: Pointer; cdecl;
    function asCreation: Pointer; cdecl;
    function asModification: Pointer; cdecl;
    function asDeletion: Pointer; cdecl;
    function asContentFetch: Pointer; cdecl;
    function asChildrenEnumeration: Pointer; cdecl;
    function asCollisionResolution: Pointer; cdecl;
  end;

  // ===== Exported string consts =====

function NSFileProviderRootContainerItemIdentifier: Pointer;
function NSFileProviderWorkingSetContainerItemIdentifier: Pointer;
function NSFileProviderTrashContainerItemIdentifier: Pointer;
function NSFileProviderFavoriteRankUnranked: Pointer;
function NSFileProviderDomainDidChange: Pointer;
function NSFileProviderInitialPageSortedByDate: Pointer;
function NSFileProviderInitialPageSortedByName: Pointer;
function NSFileProviderErrorDomain: Pointer;
function NSFileProviderErrorCollidingItemKey: Pointer;
function NSFileProviderErrorItemKey: Pointer;
function NSFileProviderErrorNonExistentItemIdentifierKey: Pointer;
function NSFileProviderMaterializedSetDidChange: Pointer;
function NSFileProviderPendingSetDidChange: Pointer;


// ===== External functions =====

const
  libFileProvider =
    '/System/Library/Frameworks/FileProvider.framework/FileProvider';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  FileProviderModule: THandle;

{$ENDIF IOS}

function NSFileProviderRootContainerItemIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libFileProvider,
    'NSFileProviderRootContainerItemIdentifier');
end;

function NSFileProviderWorkingSetContainerItemIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libFileProvider,
    'NSFileProviderWorkingSetContainerItemIdentifier');
end;

function NSFileProviderTrashContainerItemIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libFileProvider,
    'NSFileProviderTrashContainerItemIdentifier');
end;

function NSFileProviderFavoriteRankUnranked: Pointer;
begin
  Result := CocoaPointerConst(libFileProvider,
    'NSFileProviderFavoriteRankUnranked');
end;

function NSFileProviderDomainDidChange: Pointer;
begin
  Result := CocoaPointerConst(libFileProvider, 'NSFileProviderDomainDidChange');
end;

function NSFileProviderInitialPageSortedByDate: Pointer;
begin
  Result := CocoaPointerConst(libFileProvider,
    'NSFileProviderInitialPageSortedByDate');
end;

function NSFileProviderInitialPageSortedByName: Pointer;
begin
  Result := CocoaPointerConst(libFileProvider,
    'NSFileProviderInitialPageSortedByName');
end;

function NSFileProviderErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libFileProvider, 'NSFileProviderErrorDomain');
end;

function NSFileProviderErrorCollidingItemKey: Pointer;
begin
  Result := CocoaPointerConst(libFileProvider,
    'NSFileProviderErrorCollidingItemKey');
end;

function NSFileProviderErrorItemKey: Pointer;
begin
  Result := CocoaPointerConst(libFileProvider, 'NSFileProviderErrorItemKey');
end;

function NSFileProviderErrorNonExistentItemIdentifierKey: Pointer;
begin
  Result := CocoaPointerConst(libFileProvider,
    'NSFileProviderErrorNonExistentItemIdentifierKey');
end;

function NSFileProviderMaterializedSetDidChange: Pointer;
begin
  Result := CocoaPointerConst(libFileProvider,
    'NSFileProviderMaterializedSetDidChange');
end;

function NSFileProviderPendingSetDidChange: Pointer;
begin
  Result := CocoaPointerConst(libFileProvider,
    'NSFileProviderPendingSetDidChange');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

FileProviderModule := dlopen(MarshaledAString(libFileProvider), RTLD_LAZY);

finalization

dlclose(FileProviderModule);
{$ENDIF IOS}

end.
