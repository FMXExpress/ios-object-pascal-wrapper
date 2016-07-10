{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CloudKit
//

unit iOSapi.CloudKit;

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
  iOSapi.Contacts,
  iOSapi.CoreLocation,
  iOSapi.Foundation;

const
  CKAccountStatusCouldNotDetermine = 0;
  CKAccountStatusAvailable = 1;
  CKAccountStatusRestricted = 2;
  CKAccountStatusNoAccount = 3;
  CKApplicationPermissionUserDiscoverability = 1 shl 0;
  CKApplicationPermissionStatusInitialState = 0;
  CKApplicationPermissionStatusCouldNotComplete = 1;
  CKApplicationPermissionStatusDenied = 2;
  CKApplicationPermissionStatusGranted = 3;
  CKErrorInternalError = 1;
  CKErrorPartialFailure = 2;
  CKErrorNetworkUnavailable = 3;
  CKErrorNetworkFailure = 4;
  CKErrorBadContainer = 5;
  CKErrorServiceUnavailable = 6;
  CKErrorRequestRateLimited = 7;
  CKErrorMissingEntitlement = 8;
  CKErrorNotAuthenticated = 9;
  CKErrorPermissionFailure = 10;
  CKErrorUnknownItem = 11;
  CKErrorInvalidArguments = 12;
  CKErrorResultsTruncated = 13;
  CKErrorServerRecordChanged = 14;
  CKErrorServerRejectedRequest = 15;
  CKErrorAssetFileNotFound = 16;
  CKErrorAssetFileModified = 17;
  CKErrorIncompatibleVersion = 18;
  CKErrorConstraintViolation = 19;
  CKErrorOperationCancelled = 20;
  CKErrorChangeTokenExpired = 21;
  CKErrorBatchRequestFailed = 22;
  CKErrorZoneBusy = 23;
  CKErrorBadDatabase = 24;
  CKErrorQuotaExceeded = 25;
  CKErrorZoneNotFound = 26;
  CKErrorLimitExceeded = 27;
  CKErrorUserDeletedZone = 28;
  CKRecordSaveIfServerRecordUnchanged = 0;
  CKRecordSaveChangedKeys = 1;
  CKRecordSaveAllKeys = 2;
  CKReferenceActionNone = 0;
  CKReferenceActionDeleteSelf = 1;
  CKNotificationTypeQuery = 1;
  CKNotificationTypeRecordZone = 2;
  CKNotificationTypeReadNotification = 3;
  CKQueryNotificationReasonRecordCreated = 1;
  CKQueryNotificationReasonRecordUpdated = 2;
  CKQueryNotificationReasonRecordDeleted = 3;
  CKRecordZoneCapabilityFetchChanges = 1 shl 0;
  CKRecordZoneCapabilityAtomic = 1 shl 1;
  CKSubscriptionTypeQuery = 1;
  CKSubscriptionTypeRecordZone = 2;
  CKSubscriptionOptionsFiresOnRecordCreation = 1 shl 0;
  CKSubscriptionOptionsFiresOnRecordUpdate = 1 shl 1;
  CKSubscriptionOptionsFiresOnRecordDeletion = 1 shl 2;
  CKSubscriptionOptionsFiresOnce = 1 shl 3;

type

  // ===== Forward declarations =====
{$M+}
  CKAsset = interface;
  CKDatabase = interface;
  CKOperation = interface;
  CKRecordID = interface;
  CKDiscoveredUserInfo = interface;
  CKContainer = interface;
  CKDatabaseOperation = interface;
  CKRecord = interface;
  CKRecordZone = interface;
  CKRecordZoneID = interface;
  CKQuery = interface;
  CKSubscription = interface;
  CKDiscoverAllContactsOperation = interface;
  CKDiscoverUserInfosOperation = interface;
  CKNotification = interface;
  CKServerChangeToken = interface;
  CKFetchNotificationChangesOperation = interface;
  CKFetchRecordChangesOperation = interface;
  CKFetchRecordsOperation = interface;
  CKFetchRecordZonesOperation = interface;
  CKFetchSubscriptionsOperation = interface;
  CKFetchWebAuthTokenOperation = interface;
  CKLocationSortDescriptor = interface;
  CKNotificationID = interface;
  CKMarkNotificationsReadOperation = interface;
  CKModifyBadgeOperation = interface;
  CKModifyRecordsOperation = interface;
  CKModifyRecordZonesOperation = interface;
  CKModifySubscriptionsOperation = interface;
  CKReference = interface;
  CKRecordValue = interface;
  CKQueryNotification = interface;
  CKRecordZoneNotification = interface;
  CKQueryCursor = interface;
  CKQueryOperation = interface;
  CKNotificationInfo = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  CKAccountStatus = NSInteger;
  TCloudKitCompletionHandler = procedure(param1: CKAccountStatus;
    param2: NSError) of object;
  NSUInteger = Cardinal;
  CKApplicationPermissions = NSUInteger;
  CKApplicationPermissionStatus = NSInteger;
  CKApplicationPermissionBlock = procedure
    (param1: CKApplicationPermissionStatus; param2: NSError) of object;
  TCloudKitCompletionHandler1 = procedure(param1: CKRecordID; param2: NSError)
    of object;
  TCloudKitCompletionHandler2 = procedure(param1: NSArray; param2: NSError)
    of object;
  TCloudKitCompletionHandler3 = procedure(param1: CKDiscoveredUserInfo;
    param2: NSError) of object;
  TCloudKitCompletionHandler4 = procedure(param1: CKOperation; param2: NSError)
    of object;
  TCloudKitCompletionHandler5 = procedure(param1: CKRecord; param2: NSError)
    of object;
  TCloudKitCompletionHandler6 = procedure(param1: CKRecordZone; param2: NSError)
    of object;
  TCloudKitCompletionHandler7 = procedure(param1: CKRecordZoneID;
    param2: NSError) of object;
  TCloudKitCompletionHandler8 = procedure(param1: CKSubscription;
    param2: NSError) of object;
  TCloudKitCompletionHandler9 = procedure(param1: NSString; param2: NSError)
    of object;
  TCloudKitLongLivedOperationWasPersistedBlock = procedure() of object;
  TCloudKitDiscoverUserInfosCompletionBlock = procedure(param1: NSDictionary;
    param2: NSDictionary; param3: NSError) of object;
  CKErrorCode = NSInteger;
  TCloudKitNotificationChangedBlock = procedure(param1: CKNotification)
    of object;
  TCloudKitFetchNotificationChangesCompletionBlock = procedure
    (param1: CKServerChangeToken; param2: NSError) of object;
  TCloudKitRecordChangedBlock = procedure(param1: CKRecord) of object;
  TCloudKitRecordWithIDWasDeletedBlock = procedure(param1: CKRecordID)
    of object;
  TCloudKitFetchRecordChangesCompletionBlock = procedure
    (param1: CKServerChangeToken; param2: NSData; param3: NSError) of object;
  TCloudKitPerRecordProgressBlock = procedure(param1: CKRecordID;
    param2: Double) of object;
  TCloudKitPerRecordCompletionBlock = procedure(param1: CKRecord;
    param2: CKRecordID; param3: NSError) of object;
  TCloudKitFetchRecordsCompletionBlock = procedure(param1: NSDictionary;
    param2: NSError) of object;
  TCloudKitModifyBadgeCompletionBlock = procedure(param1: NSError) of object;
  CKRecordSavePolicy = NSInteger;
  TCloudKitPerRecordProgressBlock1 = procedure(param1: CKRecord; param2: Double)
    of object;
  TCloudKitModifyRecordsCompletionBlock = procedure(param1: NSArray;
    param2: NSArray; param3: NSError) of object;
  CKReferenceAction = NSUInteger;
  CKNotificationType = NSInteger;
  CKQueryNotificationReason = NSInteger;
  TCloudKitQueryCompletionBlock = procedure(param1: CKQueryCursor;
    param2: NSError) of object;
  CKRecordZoneCapabilities = NSUInteger;
  CKSubscriptionType = NSInteger;
  CKSubscriptionOptions = NSUInteger;
  // ===== Interface declarations =====

  CKAssetClass = interface(NSObjectClass)
    ['{EB3D5BF2-6710-4347-B5E8-8056F62B1C8A}']
  end;

  CKAsset = interface(NSObject)
    ['{55F66C5A-91EE-408A-816E-4B20E3D5CE15}']
    function initWithFileURL(fileURL: NSURL): Pointer { instancetype }; cdecl;
    function fileURL: NSURL; cdecl;
  end;

  TCKAsset = class(TOCGenericImport<CKAssetClass, CKAsset>)
  end;

  PCKAsset = Pointer;

  CKDatabaseClass = interface(NSObjectClass)
    ['{14D5655B-1288-479E-8328-0992FCCEC6B7}']
  end;

  CKDatabase = interface(NSObject)
    ['{3BB2ED34-9D3C-4222-909F-B6CF447CDD21}']
    procedure addOperation(operation: CKDatabaseOperation); cdecl;
    procedure fetchRecordWithID(recordID: CKRecordID;
      completionHandler: TCloudKitCompletionHandler5); cdecl;
    procedure saveRecord(&record: CKRecord;
      completionHandler: TCloudKitCompletionHandler5); cdecl;
    procedure deleteRecordWithID(recordID: CKRecordID;
      completionHandler: TCloudKitCompletionHandler1); cdecl;
    procedure performQuery(query: CKQuery; inZoneWithID: CKRecordZoneID;
      completionHandler: TCloudKitCompletionHandler2); cdecl;
    procedure fetchAllRecordZonesWithCompletionHandler(completionHandler
      : TCloudKitCompletionHandler2); cdecl;
    procedure fetchRecordZoneWithID(zoneID: CKRecordZoneID;
      completionHandler: TCloudKitCompletionHandler6); cdecl;
    procedure saveRecordZone(zone: CKRecordZone;
      completionHandler: TCloudKitCompletionHandler6); cdecl;
    procedure deleteRecordZoneWithID(zoneID: CKRecordZoneID;
      completionHandler: TCloudKitCompletionHandler7); cdecl;
    procedure fetchSubscriptionWithID(subscriptionID: NSString;
      completionHandler: TCloudKitCompletionHandler8); cdecl;
    procedure fetchAllSubscriptionsWithCompletionHandler(completionHandler
      : TCloudKitCompletionHandler2); cdecl;
    procedure saveSubscription(subscription: CKSubscription;
      completionHandler: TCloudKitCompletionHandler8); cdecl;
    procedure deleteSubscriptionWithID(subscriptionID: NSString;
      completionHandler: TCloudKitCompletionHandler9); cdecl;
  end;

  TCKDatabase = class(TOCGenericImport<CKDatabaseClass, CKDatabase>)
  end;

  PCKDatabase = Pointer;

  CKOperationClass = interface(NSOperationClass)
    ['{9950C282-D4FD-40C5-913D-943AFF894E08}']
  end;

  CKOperation = interface(NSOperation)
    ['{D2428A55-1F17-45A3-A987-CD44DCC0C7B4}']
    function init: Pointer { instancetype }; cdecl;
    procedure setContainer(container: CKContainer); cdecl;
    function container: CKContainer; cdecl;
    procedure setUsesBackgroundSession(usesBackgroundSession: Boolean); cdecl;
    function usesBackgroundSession: Boolean; cdecl;
    procedure setAllowsCellularAccess(allowsCellularAccess: Boolean); cdecl;
    function allowsCellularAccess: Boolean; cdecl;
    function operationID: NSString; cdecl;
    procedure setLongLived(longLived: Boolean); cdecl;
    function isLongLived: Boolean; cdecl;
    procedure setLongLivedOperationWasPersistedBlock
      (longLivedOperationWasPersistedBlock
      : TCloudKitLongLivedOperationWasPersistedBlock); cdecl;
    function longLivedOperationWasPersistedBlock
      : TCloudKitLongLivedOperationWasPersistedBlock; cdecl;
  end;

  TCKOperation = class(TOCGenericImport<CKOperationClass, CKOperation>)
  end;

  PCKOperation = Pointer;

  CKRecordIDClass = interface(NSObjectClass)
    ['{9068491F-C34D-4C83-9D86-785934F42A65}']
  end;

  CKRecordID = interface(NSObject)
    ['{500CAC02-C602-470B-B747-E87538E7085E}']
    [MethodName('initWithRecordName:')]
    function initWithRecordName(recordName: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithRecordName:zoneID:')]
    function initWithRecordNameZoneID(recordName: NSString;
      zoneID: CKRecordZoneID): Pointer { instancetype }; cdecl;
    function recordName: NSString; cdecl;
    function zoneID: CKRecordZoneID; cdecl;
  end;

  TCKRecordID = class(TOCGenericImport<CKRecordIDClass, CKRecordID>)
  end;

  PCKRecordID = Pointer;

  CKDiscoveredUserInfoClass = interface(NSObjectClass)
    ['{6651E8DE-2752-4D8A-9A6D-8BAFE89697C8}']
  end;

  CKDiscoveredUserInfo = interface(NSObject)
    ['{36E15896-EB46-46BE-9B98-8CF2F8696591}']
    function userRecordID: CKRecordID; cdecl;
    function firstName: NSString; cdecl;
    function lastName: NSString; cdecl;
    function displayContact: CNContact; cdecl;
  end;

  TCKDiscoveredUserInfo = class(TOCGenericImport<CKDiscoveredUserInfoClass,
    CKDiscoveredUserInfo>)
  end;

  PCKDiscoveredUserInfo = Pointer;

  CKContainerClass = interface(NSObjectClass)
    ['{ECAF9786-C3A7-4111-981B-E0B389A0BFE2}']
    { class } function defaultContainer: CKContainer; cdecl;
    { class } function containerWithIdentifier(containerIdentifier: NSString)
      : CKContainer; cdecl;
  end;

  CKContainer = interface(NSObject)
    ['{8E8F9C89-8991-4B2F-B6E9-565503351DE6}']
    function containerIdentifier: NSString; cdecl;
    procedure addOperation(operation: CKOperation); cdecl;
    function privateCloudDatabase: CKDatabase; cdecl;
    function publicCloudDatabase: CKDatabase; cdecl;
    procedure accountStatusWithCompletionHandler(completionHandler
      : TCloudKitCompletionHandler); cdecl;
    procedure statusForApplicationPermission(applicationPermission
      : CKApplicationPermissions;
      completionHandler: CKApplicationPermissionBlock); cdecl;
    procedure requestApplicationPermission(applicationPermission
      : CKApplicationPermissions;
      completionHandler: CKApplicationPermissionBlock); cdecl;
    procedure fetchUserRecordIDWithCompletionHandler(completionHandler
      : TCloudKitCompletionHandler1); cdecl;
    procedure discoverAllContactUserInfosWithCompletionHandler(completionHandler
      : TCloudKitCompletionHandler2); cdecl;
    procedure discoverUserInfoWithEmailAddress(email: NSString;
      completionHandler: TCloudKitCompletionHandler3); cdecl;
    procedure discoverUserInfoWithUserRecordID(userRecordID: CKRecordID;
      completionHandler: TCloudKitCompletionHandler3); cdecl;
    procedure fetchAllLongLivedOperationIDsWithCompletionHandler
      (completionHandler: TCloudKitCompletionHandler2); cdecl;
    procedure fetchLongLivedOperationWithID(operationID: NSString;
      completionHandler: TCloudKitCompletionHandler4); cdecl;
  end;

  TCKContainer = class(TOCGenericImport<CKContainerClass, CKContainer>)
  end;

  PCKContainer = Pointer;

  CKDatabaseOperationClass = interface(CKOperationClass)
    ['{7B7A1DCB-1B04-4E5C-9CA4-79BD126114B3}']
  end;

  CKDatabaseOperation = interface(CKOperation)
    ['{A25B00C5-A6E6-4BA5-A1EC-E7D53ED14403}']
    procedure setDatabase(database: CKDatabase); cdecl;
    function database: CKDatabase; cdecl;
  end;

  TCKDatabaseOperation = class(TOCGenericImport<CKDatabaseOperationClass,
    CKDatabaseOperation>)
  end;

  PCKDatabaseOperation = Pointer;

  CKRecordClass = interface(NSObjectClass)
    ['{B0259276-28C0-4520-948D-E6D51CE4D3A8}']
  end;

  CKRecord = interface(NSObject)
    ['{0718737E-ED30-4A23-B45A-5E1D88AADF30}']
    [MethodName('initWithRecordType:')]
    function initWithRecordType(recordType: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithRecordType:recordID:')]
    function initWithRecordTypeRecordID(recordType: NSString;
      recordID: CKRecordID): Pointer { instancetype }; cdecl;
    [MethodName('initWithRecordType:zoneID:')]
    function initWithRecordTypeZoneID(recordType: NSString;
      zoneID: CKRecordZoneID): Pointer { instancetype }; cdecl;
    function recordType: NSString; cdecl;
    function recordID: CKRecordID; cdecl;
    function recordChangeTag: NSString; cdecl;
    function creatorUserRecordID: CKRecordID; cdecl;
    function creationDate: NSDate; cdecl;
    function lastModifiedUserRecordID: CKRecordID; cdecl;
    function modificationDate: NSDate; cdecl;
    function objectForKey(key: NSString): Pointer; cdecl;
    [MethodName('setObject:forKey:')]
    procedure setObjectForKey(&object: Pointer; forKey: NSString); cdecl;
    function allKeys: NSArray; cdecl;
    function allTokens: NSArray; cdecl;
    function objectForKeyedSubscript(key: NSString): Pointer; cdecl;
    [MethodName('setObject:forKeyedSubscript:')]
    procedure setObjectForKeyedSubscript(&object: Pointer;
      forKeyedSubscript: NSString); cdecl;
    function changedKeys: NSArray; cdecl;
    procedure encodeSystemFieldsWithCoder(coder: NSCoder); cdecl;
  end;

  TCKRecord = class(TOCGenericImport<CKRecordClass, CKRecord>)
  end;

  PCKRecord = Pointer;

  CKRecordZoneClass = interface(NSObjectClass)
    ['{28C5BD10-47B2-4857-B70B-1BEED78CBC34}']
    { class } function defaultRecordZone: CKRecordZone; cdecl;
  end;

  CKRecordZone = interface(NSObject)
    ['{0B6F6B0F-941A-4956-8285-C01A847AEFE6}']
    function initWithZoneName(zoneName: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithZoneID(zoneID: CKRecordZoneID)
      : Pointer { instancetype }; cdecl;
    function zoneID: CKRecordZoneID; cdecl;
    function capabilities: CKRecordZoneCapabilities; cdecl;
  end;

  TCKRecordZone = class(TOCGenericImport<CKRecordZoneClass, CKRecordZone>)
  end;

  PCKRecordZone = Pointer;

  CKRecordZoneIDClass = interface(NSObjectClass)
    ['{5C69E313-2631-4D89-AA34-C080E2181E41}']
  end;

  CKRecordZoneID = interface(NSObject)
    ['{F43A0977-7BE4-4817-A3F3-042ED035A61F}']
    function initWithZoneName(zoneName: NSString; ownerName: NSString)
      : Pointer { instancetype }; cdecl;
    function zoneName: NSString; cdecl;
    function ownerName: NSString; cdecl;
  end;

  TCKRecordZoneID = class(TOCGenericImport<CKRecordZoneIDClass, CKRecordZoneID>)
  end;

  PCKRecordZoneID = Pointer;

  CKQueryClass = interface(NSObjectClass)
    ['{E03AB2F6-C363-4D06-8C24-9B829E72F3C5}']
  end;

  CKQuery = interface(NSObject)
    ['{D297DB65-712E-4A21-A038-6E0738602663}']
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function initWithRecordType(recordType: NSString; predicate: NSPredicate)
      : Pointer { instancetype }; cdecl;
    function recordType: NSString; cdecl;
    function predicate: NSPredicate; cdecl;
    procedure setSortDescriptors(sortDescriptors: NSArray); cdecl;
    function sortDescriptors: NSArray; cdecl;
  end;

  TCKQuery = class(TOCGenericImport<CKQueryClass, CKQuery>)
  end;

  PCKQuery = Pointer;

  CKSubscriptionClass = interface(NSObjectClass)
    ['{2066CBA6-84BB-47D9-8342-3FF43A02D884}']
  end;

  CKSubscription = interface(NSObject)
    ['{4C3ECE4A-EF85-4850-913C-F8A453D30294}']
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    [MethodName('initWithRecordType:predicate:options:')]
    function initWithRecordTypePredicateOptions(recordType: NSString;
      predicate: NSPredicate; options: CKSubscriptionOptions)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithRecordType:predicate:subscriptionID:options:')]
    function initWithRecordTypePredicateSubscriptionIDOptions
      (recordType: NSString; predicate: NSPredicate; subscriptionID: NSString;
      options: CKSubscriptionOptions): Pointer { instancetype }; cdecl;
    [MethodName('initWithZoneID:options:')]
    function initWithZoneIDOptions(zoneID: CKRecordZoneID;
      options: CKSubscriptionOptions): Pointer { instancetype }; cdecl;
    [MethodName('initWithZoneID:subscriptionID:options:')]
    function initWithZoneIDSubscriptionIDOptions(zoneID: CKRecordZoneID;
      subscriptionID: NSString; options: CKSubscriptionOptions)
      : Pointer { instancetype }; cdecl;
    function subscriptionID: NSString; cdecl;
    function subscriptionType: CKSubscriptionType; cdecl;
    function recordType: NSString; cdecl;
    function predicate: NSPredicate; cdecl;
    function subscriptionOptions: CKSubscriptionOptions; cdecl;
    procedure setNotificationInfo(notificationInfo: CKNotificationInfo); cdecl;
    function notificationInfo: CKNotificationInfo; cdecl;
    procedure setZoneID(zoneID: CKRecordZoneID); cdecl;
    function zoneID: CKRecordZoneID; cdecl;
  end;

  TCKSubscription = class(TOCGenericImport<CKSubscriptionClass, CKSubscription>)
  end;

  PCKSubscription = Pointer;

  CKDiscoverAllContactsOperationClass = interface(CKOperationClass)
    ['{B559FE45-C657-4CC4-9B40-D3477A717943}']
  end;

  CKDiscoverAllContactsOperation = interface(CKOperation)
    ['{AE325562-611E-4E72-A64B-8903AFCC4018}']
    function init: Pointer { instancetype }; cdecl;
    procedure setDiscoverAllContactsCompletionBlock
      (discoverAllContactsCompletionBlock: TCloudKitCompletionHandler2); cdecl;
    function discoverAllContactsCompletionBlock
      : TCloudKitCompletionHandler2; cdecl;
  end;

  TCKDiscoverAllContactsOperation = class
    (TOCGenericImport<CKDiscoverAllContactsOperationClass,
    CKDiscoverAllContactsOperation>)
  end;

  PCKDiscoverAllContactsOperation = Pointer;

  CKDiscoverUserInfosOperationClass = interface(CKOperationClass)
    ['{0B40620C-6BE7-40E2-A5DC-7E1F90CD2EAE}']
  end;

  CKDiscoverUserInfosOperation = interface(CKOperation)
    ['{84F1A208-A143-45C2-A800-6E5B6DF0A507}']
    function init: Pointer { instancetype }; cdecl;
    function initWithEmailAddresses(emailAddresses: NSArray;
      userRecordIDs: NSArray): Pointer { instancetype }; cdecl;
    procedure setEmailAddresses(emailAddresses: NSArray); cdecl;
    function emailAddresses: NSArray; cdecl;
    procedure setUserRecordIDs(userRecordIDs: NSArray); cdecl;
    function userRecordIDs: NSArray; cdecl;
    procedure setDiscoverUserInfosCompletionBlock
      (discoverUserInfosCompletionBlock
      : TCloudKitDiscoverUserInfosCompletionBlock); cdecl;
    function discoverUserInfosCompletionBlock
      : TCloudKitDiscoverUserInfosCompletionBlock; cdecl;
  end;

  TCKDiscoverUserInfosOperation = class
    (TOCGenericImport<CKDiscoverUserInfosOperationClass,
    CKDiscoverUserInfosOperation>)
  end;

  PCKDiscoverUserInfosOperation = Pointer;

  CKNotificationClass = interface(NSObjectClass)
    ['{08F39077-83D2-4B8A-833A-3B9AF63ADCEE}']
    { class } function notificationFromRemoteNotificationDictionary
      (notificationDictionary: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  CKNotification = interface(NSObject)
    ['{F6AEE7E0-AF29-45FE-8DCC-61C5C94E2F90}']
    function notificationType: CKNotificationType; cdecl;
    function notificationID: CKNotificationID; cdecl;
    function containerIdentifier: NSString; cdecl;
    function isPruned: Boolean; cdecl;
    function alertBody: NSString; cdecl;
    function alertLocalizationKey: NSString; cdecl;
    function alertLocalizationArgs: NSArray; cdecl;
    function alertActionLocalizationKey: NSString; cdecl;
    function alertLaunchImage: NSString; cdecl;
    function badge: NSNumber; cdecl;
    function soundName: NSString; cdecl;
    function subscriptionID: NSString; cdecl;
    function category: NSString; cdecl;
  end;

  TCKNotification = class(TOCGenericImport<CKNotificationClass, CKNotification>)
  end;

  PCKNotification = Pointer;

  CKServerChangeTokenClass = interface(NSObjectClass)
    ['{AC05B58D-4D9B-4DA9-918F-07DB5B9E7E11}']
  end;

  CKServerChangeToken = interface(NSObject)
    ['{B380B33B-6DA6-4FE8-9D50-5745CEC1EA9C}']
  end;

  TCKServerChangeToken = class(TOCGenericImport<CKServerChangeTokenClass,
    CKServerChangeToken>)
  end;

  PCKServerChangeToken = Pointer;

  CKFetchNotificationChangesOperationClass = interface(CKOperationClass)
    ['{D4596A4E-9860-4F7D-8EEC-B97BF4A256F6}']
  end;

  CKFetchNotificationChangesOperation = interface(CKOperation)
    ['{FA03878A-1F4B-4B2B-B384-D0DBEC354ED9}']
    function initWithPreviousServerChangeToken(previousServerChangeToken
      : CKServerChangeToken): Pointer { instancetype }; cdecl;
    procedure setPreviousServerChangeToken(previousServerChangeToken
      : CKServerChangeToken); cdecl;
    function previousServerChangeToken: CKServerChangeToken; cdecl;
    procedure setResultsLimit(resultsLimit: NSUInteger); cdecl;
    function resultsLimit: NSUInteger; cdecl;
    function moreComing: Boolean; cdecl;
    procedure setNotificationChangedBlock(notificationChangedBlock
      : TCloudKitNotificationChangedBlock); cdecl;
    function notificationChangedBlock: TCloudKitNotificationChangedBlock; cdecl;
    procedure setFetchNotificationChangesCompletionBlock
      (fetchNotificationChangesCompletionBlock
      : TCloudKitFetchNotificationChangesCompletionBlock); cdecl;
    function fetchNotificationChangesCompletionBlock
      : TCloudKitFetchNotificationChangesCompletionBlock; cdecl;
  end;

  TCKFetchNotificationChangesOperation = class
    (TOCGenericImport<CKFetchNotificationChangesOperationClass,
    CKFetchNotificationChangesOperation>)
  end;

  PCKFetchNotificationChangesOperation = Pointer;

  CKFetchRecordChangesOperationClass = interface(CKDatabaseOperationClass)
    ['{39EA5F62-A76E-4F73-8CEA-77F2D29EF609}']
  end;

  CKFetchRecordChangesOperation = interface(CKDatabaseOperation)
    ['{5F785F2E-B7A4-4AE7-873C-84290B339201}']
    function initWithRecordZoneID(recordZoneID: CKRecordZoneID;
      previousServerChangeToken: CKServerChangeToken)
      : Pointer { instancetype }; cdecl;
    procedure setRecordZoneID(recordZoneID: CKRecordZoneID); cdecl;
    function recordZoneID: CKRecordZoneID; cdecl;
    procedure setPreviousServerChangeToken(previousServerChangeToken
      : CKServerChangeToken); cdecl;
    function previousServerChangeToken: CKServerChangeToken; cdecl;
    procedure setResultsLimit(resultsLimit: NSUInteger); cdecl;
    function resultsLimit: NSUInteger; cdecl;
    procedure setDesiredKeys(desiredKeys: NSArray); cdecl;
    function desiredKeys: NSArray; cdecl;
    procedure setRecordChangedBlock(recordChangedBlock
      : TCloudKitRecordChangedBlock); cdecl;
    function recordChangedBlock: TCloudKitRecordChangedBlock; cdecl;
    procedure setRecordWithIDWasDeletedBlock(recordWithIDWasDeletedBlock
      : TCloudKitRecordWithIDWasDeletedBlock); cdecl;
    function recordWithIDWasDeletedBlock
      : TCloudKitRecordWithIDWasDeletedBlock; cdecl;
    function moreComing: Boolean; cdecl;
    procedure setFetchRecordChangesCompletionBlock
      (fetchRecordChangesCompletionBlock
      : TCloudKitFetchRecordChangesCompletionBlock); cdecl;
    function fetchRecordChangesCompletionBlock
      : TCloudKitFetchRecordChangesCompletionBlock; cdecl;
  end;

  TCKFetchRecordChangesOperation = class
    (TOCGenericImport<CKFetchRecordChangesOperationClass,
    CKFetchRecordChangesOperation>)
  end;

  PCKFetchRecordChangesOperation = Pointer;

  CKFetchRecordsOperationClass = interface(CKDatabaseOperationClass)
    ['{8CDFA7AC-491E-438B-A3C4-53EAA518395E}']
    { class } function fetchCurrentUserRecordOperation
      : Pointer { instancetype }; cdecl;
  end;

  CKFetchRecordsOperation = interface(CKDatabaseOperation)
    ['{3C21CFD9-9B36-455E-BE04-C495CFF9EEE9}']
    function init: Pointer { instancetype }; cdecl;
    function initWithRecordIDs(recordIDs: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setRecordIDs(recordIDs: NSArray); cdecl;
    function recordIDs: NSArray; cdecl;
    procedure setDesiredKeys(desiredKeys: NSArray); cdecl;
    function desiredKeys: NSArray; cdecl;
    procedure setPerRecordProgressBlock(perRecordProgressBlock
      : TCloudKitPerRecordProgressBlock); cdecl;
    function perRecordProgressBlock: TCloudKitPerRecordProgressBlock; cdecl;
    procedure setPerRecordCompletionBlock(perRecordCompletionBlock
      : TCloudKitPerRecordCompletionBlock); cdecl;
    function perRecordCompletionBlock: TCloudKitPerRecordCompletionBlock; cdecl;
    procedure setFetchRecordsCompletionBlock(fetchRecordsCompletionBlock
      : TCloudKitFetchRecordsCompletionBlock); cdecl;
    function fetchRecordsCompletionBlock
      : TCloudKitFetchRecordsCompletionBlock; cdecl;
  end;

  TCKFetchRecordsOperation = class
    (TOCGenericImport<CKFetchRecordsOperationClass, CKFetchRecordsOperation>)
  end;

  PCKFetchRecordsOperation = Pointer;

  CKFetchRecordZonesOperationClass = interface(CKDatabaseOperationClass)
    ['{8F9EF29B-5E35-4527-B970-FB3897107023}']
    { class } function fetchAllRecordZonesOperation
      : Pointer { instancetype }; cdecl;
  end;

  CKFetchRecordZonesOperation = interface(CKDatabaseOperation)
    ['{0D227880-EAC3-467B-A0E4-AE59ED0065B4}']
    function init: Pointer { instancetype }; cdecl;
    function initWithRecordZoneIDs(zoneIDs: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setRecordZoneIDs(recordZoneIDs: NSArray); cdecl;
    function recordZoneIDs: NSArray; cdecl;
    procedure setFetchRecordZonesCompletionBlock(fetchRecordZonesCompletionBlock
      : TCloudKitFetchRecordsCompletionBlock); cdecl;
    function fetchRecordZonesCompletionBlock
      : TCloudKitFetchRecordsCompletionBlock; cdecl;
  end;

  TCKFetchRecordZonesOperation = class
    (TOCGenericImport<CKFetchRecordZonesOperationClass,
    CKFetchRecordZonesOperation>)
  end;

  PCKFetchRecordZonesOperation = Pointer;

  CKFetchSubscriptionsOperationClass = interface(CKDatabaseOperationClass)
    ['{BB0BC4FE-8AB4-42F7-9C7D-A85146594C01}']
    { class } function fetchAllSubscriptionsOperation
      : Pointer { instancetype }; cdecl;
  end;

  CKFetchSubscriptionsOperation = interface(CKDatabaseOperation)
    ['{3881DFDC-3106-4E20-B370-85D8682695D5}']
    function init: Pointer { instancetype }; cdecl;
    function initWithSubscriptionIDs(subscriptionIDs: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setSubscriptionIDs(subscriptionIDs: NSArray); cdecl;
    function subscriptionIDs: NSArray; cdecl;
    procedure setFetchSubscriptionCompletionBlock
      (fetchSubscriptionCompletionBlock
      : TCloudKitFetchRecordsCompletionBlock); cdecl;
    function fetchSubscriptionCompletionBlock
      : TCloudKitFetchRecordsCompletionBlock; cdecl;
  end;

  TCKFetchSubscriptionsOperation = class
    (TOCGenericImport<CKFetchSubscriptionsOperationClass,
    CKFetchSubscriptionsOperation>)
  end;

  PCKFetchSubscriptionsOperation = Pointer;

  CKFetchWebAuthTokenOperationClass = interface(CKDatabaseOperationClass)
    ['{1A0D640F-BCAD-4AE2-81BC-118A7D05D74D}']
  end;

  CKFetchWebAuthTokenOperation = interface(CKDatabaseOperation)
    ['{3B3B8717-9D20-4D4C-9C4C-08F9B6D4B5E0}']
    function initWithAPIToken(APIToken: NSString)
      : Pointer { instancetype }; cdecl;
    procedure setAPIToken(APIToken: NSString); cdecl;
    function APIToken: NSString; cdecl;
    procedure setFetchWebAuthTokenCompletionBlock
      (fetchWebAuthTokenCompletionBlock: TCloudKitCompletionHandler9); cdecl;
    function fetchWebAuthTokenCompletionBlock
      : TCloudKitCompletionHandler9; cdecl;
  end;

  TCKFetchWebAuthTokenOperation = class
    (TOCGenericImport<CKFetchWebAuthTokenOperationClass,
    CKFetchWebAuthTokenOperation>)
  end;

  PCKFetchWebAuthTokenOperation = Pointer;

  CKLocationSortDescriptorClass = interface(NSSortDescriptorClass)
    ['{3DDC3F1C-8FF8-49E1-9C74-936E59DDFD28}']
  end;

  CKLocationSortDescriptor = interface(NSSortDescriptor)
    ['{120EB348-0CDB-45A1-96A5-9E72F58E5678}']
    function initWithKey(key: NSString; relativeLocation: CLLocation)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function relativeLocation: CLLocation; cdecl;
  end;

  TCKLocationSortDescriptor = class
    (TOCGenericImport<CKLocationSortDescriptorClass, CKLocationSortDescriptor>)
  end;

  PCKLocationSortDescriptor = Pointer;

  CKNotificationIDClass = interface(NSObjectClass)
    ['{AA5A8956-94FC-4164-9E21-A3B4A10BC5B1}']
  end;

  CKNotificationID = interface(NSObject)
    ['{7F666AA0-886A-4487-9292-411899E38CD4}']
  end;

  TCKNotificationID = class(TOCGenericImport<CKNotificationIDClass,
    CKNotificationID>)
  end;

  PCKNotificationID = Pointer;

  CKMarkNotificationsReadOperationClass = interface(CKOperationClass)
    ['{27CD0CD2-B377-4156-9810-B2FC75C75099}']
  end;

  CKMarkNotificationsReadOperation = interface(CKOperation)
    ['{14A183AD-1BB4-478E-A39B-A0A7DD84607D}']
    function initWithNotificationIDsToMarkRead(notificationIDs: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setNotificationIDs(notificationIDs: NSArray); cdecl;
    function notificationIDs: NSArray; cdecl;
    procedure setMarkNotificationsReadCompletionBlock
      (markNotificationsReadCompletionBlock
      : TCloudKitCompletionHandler2); cdecl;
    function markNotificationsReadCompletionBlock
      : TCloudKitCompletionHandler2; cdecl;
  end;

  TCKMarkNotificationsReadOperation = class
    (TOCGenericImport<CKMarkNotificationsReadOperationClass,
    CKMarkNotificationsReadOperation>)
  end;

  PCKMarkNotificationsReadOperation = Pointer;

  CKModifyBadgeOperationClass = interface(CKOperationClass)
    ['{7BDC2B5F-53CD-4D0A-A0F3-223FA9F1088F}']
  end;

  CKModifyBadgeOperation = interface(CKOperation)
    ['{E39A09AF-8FF6-45E1-9C01-99CD8367F6A3}']
    function init: Pointer { instancetype }; cdecl;
    function initWithBadgeValue(badgeValue: NSUInteger)
      : Pointer { instancetype }; cdecl;
    procedure setBadgeValue(badgeValue: NSUInteger); cdecl;
    function badgeValue: NSUInteger; cdecl;
    procedure setModifyBadgeCompletionBlock(modifyBadgeCompletionBlock
      : TCloudKitModifyBadgeCompletionBlock); cdecl;
    function modifyBadgeCompletionBlock
      : TCloudKitModifyBadgeCompletionBlock; cdecl;
  end;

  TCKModifyBadgeOperation = class(TOCGenericImport<CKModifyBadgeOperationClass,
    CKModifyBadgeOperation>)
  end;

  PCKModifyBadgeOperation = Pointer;

  CKModifyRecordsOperationClass = interface(CKDatabaseOperationClass)
    ['{47AA8CCA-0208-4D43-923E-9180F50BB973}']
  end;

  CKModifyRecordsOperation = interface(CKDatabaseOperation)
    ['{DAD551D8-569A-41E4-8234-C04D42164EDD}']
    function init: Pointer { instancetype }; cdecl;
    function initWithRecordsToSave(records: NSArray; recordIDsToDelete: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setRecordsToSave(recordsToSave: NSArray); cdecl;
    function recordsToSave: NSArray; cdecl;
    procedure setRecordIDsToDelete(recordIDsToDelete: NSArray); cdecl;
    function recordIDsToDelete: NSArray; cdecl;
    procedure setSavePolicy(savePolicy: CKRecordSavePolicy); cdecl;
    function savePolicy: CKRecordSavePolicy; cdecl;
    procedure setClientChangeTokenData(clientChangeTokenData: NSData); cdecl;
    function clientChangeTokenData: NSData; cdecl;
    procedure setAtomic(atomic: Boolean); cdecl;
    function atomic: Boolean; cdecl;
    procedure setPerRecordProgressBlock(perRecordProgressBlock
      : TCloudKitPerRecordProgressBlock1); cdecl;
    function perRecordProgressBlock: TCloudKitPerRecordProgressBlock1; cdecl;
    procedure setPerRecordCompletionBlock(perRecordCompletionBlock
      : TCloudKitCompletionHandler5); cdecl;
    function perRecordCompletionBlock: TCloudKitCompletionHandler5; cdecl;
    procedure setModifyRecordsCompletionBlock(modifyRecordsCompletionBlock
      : TCloudKitModifyRecordsCompletionBlock); cdecl;
    function modifyRecordsCompletionBlock
      : TCloudKitModifyRecordsCompletionBlock; cdecl;
  end;

  TCKModifyRecordsOperation = class
    (TOCGenericImport<CKModifyRecordsOperationClass, CKModifyRecordsOperation>)
  end;

  PCKModifyRecordsOperation = Pointer;

  CKModifyRecordZonesOperationClass = interface(CKDatabaseOperationClass)
    ['{E03E2E5A-CD4C-46D4-925A-ABE6F9ECB513}']
  end;

  CKModifyRecordZonesOperation = interface(CKDatabaseOperation)
    ['{7333582C-17D4-4414-AD1A-1683E1632E4F}']
    function init: Pointer { instancetype }; cdecl;
    function initWithRecordZonesToSave(recordZonesToSave: NSArray;
      recordZoneIDsToDelete: NSArray): Pointer { instancetype }; cdecl;
    procedure setRecordZonesToSave(recordZonesToSave: NSArray); cdecl;
    function recordZonesToSave: NSArray; cdecl;
    procedure setRecordZoneIDsToDelete(recordZoneIDsToDelete: NSArray); cdecl;
    function recordZoneIDsToDelete: NSArray; cdecl;
    procedure setModifyRecordZonesCompletionBlock
      (modifyRecordZonesCompletionBlock
      : TCloudKitModifyRecordsCompletionBlock); cdecl;
    function modifyRecordZonesCompletionBlock
      : TCloudKitModifyRecordsCompletionBlock; cdecl;
  end;

  TCKModifyRecordZonesOperation = class
    (TOCGenericImport<CKModifyRecordZonesOperationClass,
    CKModifyRecordZonesOperation>)
  end;

  PCKModifyRecordZonesOperation = Pointer;

  CKModifySubscriptionsOperationClass = interface(CKDatabaseOperationClass)
    ['{31780818-51A2-4DFA-A830-DC33DCDFB742}']
  end;

  CKModifySubscriptionsOperation = interface(CKDatabaseOperation)
    ['{EDFC10D7-FC34-460B-B608-2DCA2A45B015}']
    function initWithSubscriptionsToSave(subscriptionsToSave: NSArray;
      subscriptionIDsToDelete: NSArray): Pointer { instancetype }; cdecl;
    procedure setSubscriptionsToSave(subscriptionsToSave: NSArray); cdecl;
    function subscriptionsToSave: NSArray; cdecl;
    procedure setSubscriptionIDsToDelete(subscriptionIDsToDelete
      : NSArray); cdecl;
    function subscriptionIDsToDelete: NSArray; cdecl;
    procedure setModifySubscriptionsCompletionBlock
      (modifySubscriptionsCompletionBlock
      : TCloudKitModifyRecordsCompletionBlock); cdecl;
    function modifySubscriptionsCompletionBlock
      : TCloudKitModifyRecordsCompletionBlock; cdecl;
  end;

  TCKModifySubscriptionsOperation = class
    (TOCGenericImport<CKModifySubscriptionsOperationClass,
    CKModifySubscriptionsOperation>)
  end;

  PCKModifySubscriptionsOperation = Pointer;

  CKReferenceClass = interface(NSObjectClass)
    ['{FA66B9C0-B16D-4E8D-A949-2BC2F0C3316F}']
  end;

  CKReference = interface(NSObject)
    ['{5199F789-FB3E-4475-AAC6-E58487DDED88}']
    function initWithRecordID(recordID: CKRecordID; action: CKReferenceAction)
      : Pointer { instancetype }; cdecl;
    function initWithRecord(&record: CKRecord; action: CKReferenceAction)
      : Pointer { instancetype }; cdecl;
    function referenceAction: CKReferenceAction; cdecl;
    function recordID: CKRecordID; cdecl;
  end;

  TCKReference = class(TOCGenericImport<CKReferenceClass, CKReference>)
  end;

  PCKReference = Pointer;

  CKRecordValue = interface(IObjectiveC)
    ['{80C8A41A-5A73-4E94-828C-F164047B89AE}']
  end;

  CKQueryNotificationClass = interface(CKNotificationClass)
    ['{771136DF-EA4F-4AFD-A8C8-532B6121C2CD}']
  end;

  CKQueryNotification = interface(CKNotification)
    ['{C7973E54-0F18-4DDD-847F-5E0E018F50AE}']
    function queryNotificationReason: CKQueryNotificationReason; cdecl;
    function recordFields: NSDictionary; cdecl;
    function recordID: CKRecordID; cdecl;
    function isPublicDatabase: Boolean; cdecl;
  end;

  TCKQueryNotification = class(TOCGenericImport<CKQueryNotificationClass,
    CKQueryNotification>)
  end;

  PCKQueryNotification = Pointer;

  CKRecordZoneNotificationClass = interface(CKNotificationClass)
    ['{E054CEEB-E870-4A82-8B6C-072034886B92}']
  end;

  CKRecordZoneNotification = interface(CKNotification)
    ['{38C783F6-04EF-43E8-B1B5-F2B721A215CD}']
    function recordZoneID: CKRecordZoneID; cdecl;
  end;

  TCKRecordZoneNotification = class
    (TOCGenericImport<CKRecordZoneNotificationClass, CKRecordZoneNotification>)
  end;

  PCKRecordZoneNotification = Pointer;

  CKQueryCursorClass = interface(NSObjectClass)
    ['{B1AD049B-27B0-4A9E-8A76-B3DD838369EE}']
  end;

  CKQueryCursor = interface(NSObject)
    ['{EE62F9A3-F1EB-4B60-A127-0D578673043E}']
  end;

  TCKQueryCursor = class(TOCGenericImport<CKQueryCursorClass, CKQueryCursor>)
  end;

  PCKQueryCursor = Pointer;

  CKQueryOperationClass = interface(CKDatabaseOperationClass)
    ['{9A3761A2-0256-4321-8409-DDF0FFDA8A16}']
  end;

  CKQueryOperation = interface(CKDatabaseOperation)
    ['{0A92F31D-98A9-4836-A907-8B58387DD375}']
    function init: Pointer { instancetype }; cdecl;
    function initWithQuery(query: CKQuery): Pointer { instancetype }; cdecl;
    function initWithCursor(cursor: CKQueryCursor)
      : Pointer { instancetype }; cdecl;
    procedure setQuery(query: CKQuery); cdecl;
    function query: CKQuery; cdecl;
    procedure setCursor(cursor: CKQueryCursor); cdecl;
    function cursor: CKQueryCursor; cdecl;
    procedure setZoneID(zoneID: CKRecordZoneID); cdecl;
    function zoneID: CKRecordZoneID; cdecl;
    procedure setResultsLimit(resultsLimit: NSUInteger); cdecl;
    function resultsLimit: NSUInteger; cdecl;
    procedure setDesiredKeys(desiredKeys: NSArray); cdecl;
    function desiredKeys: NSArray; cdecl;
    procedure setRecordFetchedBlock(recordFetchedBlock
      : TCloudKitRecordChangedBlock); cdecl;
    function recordFetchedBlock: TCloudKitRecordChangedBlock; cdecl;
    procedure setQueryCompletionBlock(queryCompletionBlock
      : TCloudKitQueryCompletionBlock); cdecl;
    function queryCompletionBlock: TCloudKitQueryCompletionBlock; cdecl;
  end;

  TCKQueryOperation = class(TOCGenericImport<CKQueryOperationClass,
    CKQueryOperation>)
  end;

  PCKQueryOperation = Pointer;

  CKNotificationInfoClass = interface(NSObjectClass)
    ['{E04581ED-2D81-4F81-A61E-9E9D7D0D73AE}']
  end;

  CKNotificationInfo = interface(NSObject)
    ['{3A46BBF2-86EC-4472-86E1-8993921A1E65}']
    procedure setAlertBody(alertBody: NSString); cdecl;
    function alertBody: NSString; cdecl;
    procedure setAlertLocalizationKey(alertLocalizationKey: NSString); cdecl;
    function alertLocalizationKey: NSString; cdecl;
    procedure setAlertLocalizationArgs(alertLocalizationArgs: NSArray); cdecl;
    function alertLocalizationArgs: NSArray; cdecl;
    procedure setAlertActionLocalizationKey(alertActionLocalizationKey
      : NSString); cdecl;
    function alertActionLocalizationKey: NSString; cdecl;
    procedure setAlertLaunchImage(alertLaunchImage: NSString); cdecl;
    function alertLaunchImage: NSString; cdecl;
    procedure setSoundName(soundName: NSString); cdecl;
    function soundName: NSString; cdecl;
    procedure setDesiredKeys(desiredKeys: NSArray); cdecl;
    function desiredKeys: NSArray; cdecl;
    procedure setShouldBadge(shouldBadge: Boolean); cdecl;
    function shouldBadge: Boolean; cdecl;
    procedure setShouldSendContentAvailable(shouldSendContentAvailable
      : Boolean); cdecl;
    function shouldSendContentAvailable: Boolean; cdecl;
    procedure setCategory(category: NSString); cdecl;
    function category: NSString; cdecl;
  end;

  TCKNotificationInfo = class(TOCGenericImport<CKNotificationInfoClass,
    CKNotificationInfo>)
  end;

  PCKNotificationInfo = Pointer;

  // ===== Protocol declarations =====

  // ===== Exported string consts =====

function CKOwnerDefaultName: NSString;
function CKAccountChangedNotification: NSString;
function CKErrorDomain: NSString;
function CKPartialErrorsByItemIDKey: NSString;
function CKRecordChangedErrorAncestorRecordKey: NSString;
function CKRecordChangedErrorServerRecordKey: NSString;
function CKRecordChangedErrorClientRecordKey: NSString;
function CKErrorRetryAfterKey: NSString;
function CKRecordTypeUserRecord: NSString;
function CKQueryOperationMaximumResults: Pointer;
function CKRecordZoneDefaultName: NSString;


// ===== External functions =====

const
  libCloudKit = '/System/Library/Frameworks/CloudKit.framework/CloudKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CloudKitModule: THandle;

{$ENDIF IOS}

function CKOwnerDefaultName: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit, 'CKOwnerDefaultName');
end;

function CKAccountChangedNotification: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit, 'CKAccountChangedNotification');
end;

function CKErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit, 'CKErrorDomain');
end;

function CKPartialErrorsByItemIDKey: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit, 'CKPartialErrorsByItemIDKey');
end;

function CKRecordChangedErrorAncestorRecordKey: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit,
    'CKRecordChangedErrorAncestorRecordKey');
end;

function CKRecordChangedErrorServerRecordKey: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit,
    'CKRecordChangedErrorServerRecordKey');
end;

function CKRecordChangedErrorClientRecordKey: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit,
    'CKRecordChangedErrorClientRecordKey');
end;

function CKErrorRetryAfterKey: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit, 'CKErrorRetryAfterKey');
end;

function CKRecordTypeUserRecord: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit, 'CKRecordTypeUserRecord');
end;

function CKRecordZoneDefaultName: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit, 'CKRecordZoneDefaultName');
end;

function CKQueryOperationMaximumResults: Pointer;
begin
  Result := CocoaPointerConst(libCloudKit, 'CKQueryOperationMaximumResults');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CloudKitModule := dlopen(MarshaledAString(libCloudKit), RTLD_LAZY);

finalization

dlclose(CloudKitModule);
{$ENDIF IOS}

end.
