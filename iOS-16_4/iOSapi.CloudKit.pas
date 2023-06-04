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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.CoreLocation,
  iOSapi.Foundation;

const
  CKSharingParticipantAccessOptionAnyoneWithLink = 1 shl 0;
  CKSharingParticipantAccessOptionSpecifiedRecipientsOnly = 1 shl 1;
  CKSharingParticipantAccessOptionAny =
    CKSharingParticipantAccessOptionAnyoneWithLink or
    CKSharingParticipantAccessOptionSpecifiedRecipientsOnly;
  CKSharingParticipantPermissionOptionReadOnly = 1 shl 0;
  CKSharingParticipantPermissionOptionReadWrite = 1 shl 1;
  CKSharingParticipantPermissionOptionAny =
    CKSharingParticipantPermissionOptionReadOnly or
    CKSharingParticipantPermissionOptionReadWrite;
  CKReferenceActionNone = 0;
  CKReferenceActionDeleteSelf = 1;
  CKSubscriptionTypeQuery = 1;
  CKSubscriptionTypeRecordZone = 2;
  CKSubscriptionTypeDatabase = 3;
  CKQuerySubscriptionOptionsFiresOnRecordCreation = 1 shl 0;
  CKQuerySubscriptionOptionsFiresOnRecordUpdate = 1 shl 1;
  CKQuerySubscriptionOptionsFiresOnRecordDeletion = 1 shl 2;
  CKQuerySubscriptionOptionsFiresOnce = 1 shl 3;
  CKDatabaseScopePublic = 1;
  CKDatabaseScopePrivate = 2;
  CKDatabaseScopeShared = 3;
  CKAccountStatusCouldNotDetermine = 0;
  CKAccountStatusAvailable = 1;
  CKAccountStatusRestricted = 2;
  CKAccountStatusNoAccount = 3;
  CKAccountStatusTemporarilyUnavailable = 4;
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
  CKErrorTooManyParticipants = 29;
  CKErrorAlreadyShared = 30;
  CKErrorReferenceViolation = 31;
  CKErrorManagedAccountRestricted = 32;
  CKErrorParticipantMayNeedVerification = 33;
  CKErrorServerResponseLost = 34;
  CKErrorAssetNotAvailable = 35;
  CKErrorAccountTemporarilyUnavailable = 36;
  CKRecordSaveIfServerRecordUnchanged = 0;
  CKRecordSaveChangedKeys = 1;
  CKRecordSaveAllKeys = 2;
  CKNotificationTypeQuery = 1;
  CKNotificationTypeRecordZone = 2;
  CKNotificationTypeReadNotification = 3;
  CKNotificationTypeDatabase = 4;
  CKQueryNotificationReasonRecordCreated = 1;
  CKQueryNotificationReasonRecordUpdated = 2;
  CKQueryNotificationReasonRecordDeleted = 3;
  CKOperationGroupTransferSizeUnknown = 0;
  CKOperationGroupTransferSizeKilobytes = 1;
  CKOperationGroupTransferSizeMegabytes = 2;
  CKOperationGroupTransferSizeTensOfMegabytes = 3;
  CKOperationGroupTransferSizeHundredsOfMegabytes = 4;
  CKOperationGroupTransferSizeGigabytes = 5;
  CKOperationGroupTransferSizeTensOfGigabytes = 6;
  CKOperationGroupTransferSizeHundredsOfGigabytes = 7;
  CKRecordZoneCapabilityFetchChanges = 1 shl 0;
  CKRecordZoneCapabilityAtomic = 1 shl 1;
  CKRecordZoneCapabilitySharing = 1 shl 2;
  CKRecordZoneCapabilityZoneWideSharing = 1 shl 3;
  CKShareParticipantAcceptanceStatusUnknown = 0;
  CKShareParticipantAcceptanceStatusPending = 1;
  CKShareParticipantAcceptanceStatusAccepted = 2;
  CKShareParticipantAcceptanceStatusRemoved = 3;
  CKShareParticipantPermissionUnknown = 0;
  CKShareParticipantPermissionNone = 1;
  CKShareParticipantPermissionReadOnly = 2;
  CKShareParticipantPermissionReadWrite = 3;
  CKShareParticipantRoleUnknown = 0;
  CKShareParticipantRoleOwner = 1;
  CKShareParticipantRolePrivateUser = 3;
  CKShareParticipantRolePublicUser = 4;
  CKShareParticipantTypeUnknown = 0;
  CKShareParticipantTypeOwner = 1;
  CKShareParticipantTypePrivateUser = 3;
  CKShareParticipantTypePublicUser = 4;

type

  // ===== Forward declarations =====
{$M+}
  CKContainer = interface;
  CKOperationConfiguration = interface;
  CKOperationGroup = interface;
  CKOperation = interface;
  CKDatabase = interface;
  CKDatabaseOperation = interface;
  CKShare = interface;
  CKShareMetadata = interface;
  CKAcceptSharesOperation = interface;
  CKAllowedSharingOptions = interface;
  CKAsset = interface;
  CKRecord = interface;
  CKRecordID = interface;
  CKReference = interface;
  CKRecordZoneID = interface;
  CKRecordValue = interface;
  CKRecordKeyValueSetting = interface;
  CKNotificationInfo = interface;
  CKSubscription = interface;
  CKQuerySubscription = interface;
  CKRecordZoneSubscription = interface;
  CKDatabaseSubscription = interface;
  CKRecordZone = interface;
  CKQuery = interface;
  CKUserIdentity = interface;
  CKShareParticipant = interface;
  CKDiscoverAllUserIdentitiesOperation = interface;
  CKUserIdentityLookupInfo = interface;
  CKDiscoverUserIdentitiesOperation = interface;
  CKServerChangeToken = interface;
  CKFetchDatabaseChangesOperation = interface;
  CKNotification = interface;
  CKFetchNotificationChangesOperation = interface;
  CKFetchRecordChangesOperation = interface;
  CKFetchRecordsOperation = interface;
  CKFetchRecordZoneChangesConfiguration = interface;
  CKFetchRecordZoneChangesOptions = interface;
  CKFetchRecordZoneChangesOperation = interface;
  CKFetchRecordZonesOperation = interface;
  CKFetchShareMetadataOperation = interface;
  CKFetchShareParticipantsOperation = interface;
  CKFetchSubscriptionsOperation = interface;
  CKFetchWebAuthTokenOperation = interface;
  CKLocationSortDescriptor = interface;
  CKNotificationID = interface;
  CKMarkNotificationsReadOperation = interface;
  CKModifyBadgeOperation = interface;
  CKModifyRecordsOperation = interface;
  CKModifyRecordZonesOperation = interface;
  CKModifySubscriptionsOperation = interface;
  CKQueryNotification = interface;
  CKRecordZoneNotification = interface;
  CKDatabaseNotification = interface;
  CKQueryCursor = interface;
  CKQueryOperation = interface;
  CKSystemSharingUIObserver = interface;
  CKSharingSupport = interface;

  // ===== Framework typedefs =====
{$M+}
  CKOperationID = NSString;
  PCKOperationID = ^CKOperationID;
  TCloudKitLongLivedOperationWasPersistedBlock = procedure() of object;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  NSQualityOfService = NSInteger;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  TCloudKitPerShareCompletionBlock = procedure(param1: CKShareMetadata;
    param2: CKShare; param3: NSError) of object;
  TCloudKitAcceptSharesCompletionBlock = procedure(param1: NSError) of object;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  CKSharingParticipantAccessOption = NSUInteger;
  CKSharingParticipantPermissionOption = NSUInteger;
  CKReferenceAction = NSUInteger;
  CKRecordType = NSString;
  PCKRecordType = ^CKRecordType;
  CKRecordFieldKey = NSString;
  PCKRecordFieldKey = ^CKRecordFieldKey;
  CKSubscriptionType = NSInteger;
  CKSubscriptionID = NSString;
  PCKSubscriptionID = ^CKSubscriptionID;
  CKQuerySubscriptionOptions = NSUInteger;
  CKDatabaseScope = NSInteger;
  TCloudKitCompletionHandler = procedure(param1: CKRecord; param2: NSError)
    of object;
  TCloudKitCompletionHandler1 = procedure(param1: CKRecordID; param2: NSError)
    of object;
  TCloudKitCompletionHandler2 = procedure(param1: NSArray; param2: NSError)
    of object;
  TCloudKitCompletionHandler3 = procedure(param1: CKRecordZone; param2: NSError)
    of object;
  TCloudKitCompletionHandler4 = procedure(param1: CKRecordZoneID;
    param2: NSError) of object;
  TCloudKitCompletionHandler5 = procedure(param1: CKSubscription;
    param2: NSError) of object;
  TCloudKitCompletionHandler6 = procedure(param1: CKSubscriptionID;
    param2: NSError) of object;
  CKAccountStatus = NSInteger;
  TCloudKitCompletionHandler7 = procedure(param1: CKAccountStatus;
    param2: NSError) of object;
  CKApplicationPermissions = NSUInteger;
  CKApplicationPermissionStatus = NSInteger;
  CKApplicationPermissionBlock = procedure
    (param1: CKApplicationPermissionStatus; param2: NSError) of object;
  TCloudKitCompletionHandler8 = procedure(param1: CKUserIdentity) of object;
  TCloudKitCompletionHandler9 = procedure(param1: CKShareParticipant;
    param2: NSError) of object;
  TCloudKitCompletionHandler10 = procedure(param1: CKShareMetadata;
    param2: NSError) of object;
  TCloudKitCompletionHandler11 = procedure(param1: CKShare; param2: NSError)
    of object;
  TCloudKitCompletionHandler12 = procedure(param1: CKOperation) of object;
  TCloudKitUserIdentityDiscoveredBlock = procedure(param1: CKUserIdentity;
    param2: CKUserIdentityLookupInfo) of object;
  CKErrorCode = NSInteger;
  TCloudKitRecordZoneWithIDChangedBlock = procedure(param1: CKRecordZoneID)
    of object;
  TCloudKitChangeTokenUpdatedBlock = procedure(param1: CKServerChangeToken)
    of object;
  TCloudKitFetchDatabaseChangesCompletionBlock = procedure
    (param1: CKServerChangeToken; param2: Boolean; param3: NSError) of object;
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
  TCloudKitRecordWasChangedBlock = procedure(param1: CKRecordID;
    param2: CKRecord; param3: NSError) of object;
  TCloudKitRecordWithIDWasDeletedBlock1 = procedure(param1: CKRecordID;
    param2: CKRecordType) of object;
  TCloudKitRecordZoneChangeTokensUpdatedBlock = procedure
    (param1: CKRecordZoneID; param2: CKServerChangeToken; param3: NSData)
    of object;
  TCloudKitRecordZoneFetchCompletionBlock = procedure(param1: CKRecordZoneID;
    param2: CKServerChangeToken; param3: NSData; param4: Boolean;
    param5: NSError) of object;
  TCloudKitPerRecordZoneCompletionBlock = procedure(param1: CKRecordZoneID;
    param2: CKRecordZone; param3: NSError) of object;
  TCloudKitPerShareMetadataBlock = procedure(param1: NSURL;
    param2: CKShareMetadata; param3: NSError) of object;
  TCloudKitShareParticipantFetchedBlock = procedure(param1: CKShareParticipant)
    of object;
  TCloudKitPerShareParticipantCompletionBlock = procedure
    (param1: CKUserIdentityLookupInfo; param2: CKShareParticipant;
    param3: NSError) of object;
  TCloudKitPerSubscriptionCompletionBlock = procedure(param1: CKSubscriptionID;
    param2: CKSubscription; param3: NSError) of object;
  TCloudKitFetchWebAuthTokenCompletionBlock = procedure(param1: NSString;
    param2: NSError) of object;
  CKRecordSavePolicy = NSInteger;
  TCloudKitPerRecordProgressBlock1 = procedure(param1: CKRecord; param2: Double)
    of object;
  TCloudKitModifyRecordsCompletionBlock = procedure(param1: NSArray;
    param2: NSArray; param3: NSError) of object;
  CKNotificationType = NSInteger;
  CKQueryNotificationReason = NSInteger;
  CKOperationGroupTransferSize = NSInteger;
  TCloudKitQueryCompletionBlock = procedure(param1: CKQueryCursor;
    param2: NSError) of object;
  CKRecordZoneCapabilities = NSUInteger;
  CKShareParticipantAcceptanceStatus = NSInteger;
  CKShareParticipantPermission = NSInteger;
  CKShareParticipantRole = NSInteger;
  CKShareParticipantType = NSInteger;
  TCloudKitSystemSharingUIDidSaveShareBlock = procedure(param1: CKRecordID;
    param2: CKShare; param3: NSError) of object;
  CKSharePreparationCompletionHandler = procedure(param1: CKShare;
    param2: NSError) of object;
  CKSharePreparationHandler = procedure
    (param1: CKSharePreparationCompletionHandler) of object;
  // ===== Interface declarations =====

  CKContainerClass = interface(NSObjectClass)
    ['{39B23540-CE49-4216-9F0D-A7D002565F97}']
    { class } function defaultContainer: CKContainer; cdecl;
    { class } function containerWithIdentifier(containerIdentifier: NSString)
      : CKContainer; cdecl;
  end;

  CKContainer = interface(NSObject)
    ['{B5853E71-2D13-42CE-8E1E-395CF69168CA}']
    function containerIdentifier: NSString; cdecl;
    procedure addOperation(operation: CKOperation); cdecl;
    function privateCloudDatabase: CKDatabase; cdecl;
    function publicCloudDatabase: CKDatabase; cdecl;
    function sharedCloudDatabase: CKDatabase; cdecl;
    function databaseWithDatabaseScope(databaseScope: CKDatabaseScope)
      : CKDatabase; cdecl;
    procedure accountStatusWithCompletionHandler(completionHandler
      : TCloudKitCompletionHandler7); cdecl;
    procedure statusForApplicationPermission(applicationPermission
      : CKApplicationPermissions;
      completionHandler: CKApplicationPermissionBlock); cdecl;
    procedure requestApplicationPermission(applicationPermission
      : CKApplicationPermissions;
      completionHandler: CKApplicationPermissionBlock); cdecl;
    procedure fetchUserRecordIDWithCompletionHandler(completionHandler
      : TCloudKitCompletionHandler1); cdecl;
    procedure discoverAllIdentitiesWithCompletionHandler(completionHandler
      : TCloudKitCompletionHandler2); cdecl;
    procedure discoverUserIdentityWithEmailAddress(email: NSString;
      completionHandler: TCloudKitCompletionHandler8); cdecl;
    procedure discoverUserIdentityWithPhoneNumber(phoneNumber: NSString;
      completionHandler: TCloudKitCompletionHandler8); cdecl;
    procedure discoverUserIdentityWithUserRecordID(userRecordID: CKRecordID;
      completionHandler: TCloudKitCompletionHandler8); cdecl;
    procedure fetchShareParticipantWithEmailAddress(emailAddress: NSString;
      completionHandler: TCloudKitCompletionHandler9); cdecl;
    procedure fetchShareParticipantWithPhoneNumber(phoneNumber: NSString;
      completionHandler: TCloudKitCompletionHandler9); cdecl;
    procedure fetchShareParticipantWithUserRecordID(userRecordID: CKRecordID;
      completionHandler: TCloudKitCompletionHandler9); cdecl;
    procedure fetchShareMetadataWithURL(url: NSURL;
      completionHandler: TCloudKitCompletionHandler10); cdecl;
    procedure acceptShareMetadata(metadata: CKShareMetadata;
      completionHandler: TCloudKitCompletionHandler11); cdecl;
    procedure fetchAllLongLivedOperationIDsWithCompletionHandler
      (completionHandler: TCloudKitCompletionHandler2); cdecl;
    procedure fetchLongLivedOperationWithID(operationID: CKOperationID;
      completionHandler: TCloudKitCompletionHandler12); cdecl;
  end;

  TCKContainer = class(TOCGenericImport<CKContainerClass, CKContainer>)
  end;

  PCKContainer = Pointer;

  CKOperationConfigurationClass = interface(NSObjectClass)
    ['{F651499E-91BA-405E-AF09-5409D814F566}']
  end;

  CKOperationConfiguration = interface(NSObject)
    ['{CEE4C54E-437C-4946-B548-F64735A33293}']
    procedure setContainer(container: CKContainer); cdecl;
    function container: CKContainer; cdecl;
    procedure setQualityOfService(qualityOfService: NSQualityOfService); cdecl;
    function qualityOfService: NSQualityOfService; cdecl;
    procedure setAllowsCellularAccess(allowsCellularAccess: Boolean); cdecl;
    function allowsCellularAccess: Boolean; cdecl;
    procedure setLongLived(longLived: Boolean); cdecl;
    function isLongLived: Boolean; cdecl;
    procedure setTimeoutIntervalForRequest(timeoutIntervalForRequest
      : NSTimeInterval); cdecl;
    function timeoutIntervalForRequest: NSTimeInterval; cdecl;
    procedure setTimeoutIntervalForResource(timeoutIntervalForResource
      : NSTimeInterval); cdecl;
    function timeoutIntervalForResource: NSTimeInterval; cdecl;
  end;

  TCKOperationConfiguration = class
    (TOCGenericImport<CKOperationConfigurationClass, CKOperationConfiguration>)
  end;

  PCKOperationConfiguration = Pointer;

  CKOperationGroupClass = interface(NSObjectClass)
    ['{47D3C35F-E600-4F0E-926E-088914B796C7}']
  end;

  CKOperationGroup = interface(NSObject)
    ['{F619201E-37D4-4042-8AC0-E9DF7338CD35}']
    function init: Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function operationGroupID: NSString; cdecl;
    procedure setDefaultConfiguration(defaultConfiguration
      : CKOperationConfiguration); cdecl;
    function defaultConfiguration: CKOperationConfiguration; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setQuantity(quantity: NSUInteger); cdecl;
    function quantity: NSUInteger; cdecl;
    procedure setExpectedSendSize(expectedSendSize
      : CKOperationGroupTransferSize); cdecl;
    function expectedSendSize: CKOperationGroupTransferSize; cdecl;
    procedure setExpectedReceiveSize(expectedReceiveSize
      : CKOperationGroupTransferSize); cdecl;
    function expectedReceiveSize: CKOperationGroupTransferSize; cdecl;
  end;

  TCKOperationGroup = class(TOCGenericImport<CKOperationGroupClass,
    CKOperationGroup>)
  end;

  PCKOperationGroup = Pointer;

  CKOperationClass = interface(NSOperationClass)
    ['{77B6BF95-A4ED-43B1-BD3A-9F9A04133FEC}']
  end;

  CKOperation = interface(NSOperation)
    ['{3FD8F5C7-AB91-4DBC-B044-96CF59AA0300}']
    function init: Pointer { instancetype }; cdecl;
    procedure setConfiguration(configuration: CKOperationConfiguration); cdecl;
    function configuration: CKOperationConfiguration; cdecl;
    procedure setGroup(group: CKOperationGroup); cdecl;
    function group: CKOperationGroup; cdecl;
    function operationID: CKOperationID; cdecl;
    procedure setLongLivedOperationWasPersistedBlock
      (longLivedOperationWasPersistedBlock
      : TCloudKitLongLivedOperationWasPersistedBlock); cdecl;
    function longLivedOperationWasPersistedBlock
      : TCloudKitLongLivedOperationWasPersistedBlock; cdecl;
    procedure setContainer(container: CKContainer); cdecl;
    function container: CKContainer; cdecl;
    procedure setAllowsCellularAccess(allowsCellularAccess: Boolean); cdecl;
    function allowsCellularAccess: Boolean; cdecl;
    procedure setLongLived(longLived: Boolean); cdecl;
    function isLongLived: Boolean; cdecl;
    procedure setTimeoutIntervalForRequest(timeoutIntervalForRequest
      : NSTimeInterval); cdecl;
    function timeoutIntervalForRequest: NSTimeInterval; cdecl;
    procedure setTimeoutIntervalForResource(timeoutIntervalForResource
      : NSTimeInterval); cdecl;
    function timeoutIntervalForResource: NSTimeInterval; cdecl;
  end;

  TCKOperation = class(TOCGenericImport<CKOperationClass, CKOperation>)
  end;

  PCKOperation = Pointer;

  CKDatabaseClass = interface(NSObjectClass)
    ['{46F8E2CB-6EE9-454C-B453-C286E19D1B06}']
  end;

  CKDatabase = interface(NSObject)
    ['{190810CE-C406-4705-A0F7-36CF261A145D}']
    procedure addOperation(operation: CKDatabaseOperation); cdecl;
    function databaseScope: CKDatabaseScope; cdecl;
    procedure fetchRecordWithID(recordID: CKRecordID;
      completionHandler: TCloudKitCompletionHandler); cdecl;
    procedure saveRecord(&record: CKRecord;
      completionHandler: TCloudKitCompletionHandler); cdecl;
    procedure deleteRecordWithID(recordID: CKRecordID;
      completionHandler: TCloudKitCompletionHandler1); cdecl;
    procedure performQuery(query: CKQuery; inZoneWithID: CKRecordZoneID;
      completionHandler: TCloudKitCompletionHandler2); cdecl;
    procedure fetchAllRecordZonesWithCompletionHandler(completionHandler
      : TCloudKitCompletionHandler2); cdecl;
    procedure fetchRecordZoneWithID(zoneID: CKRecordZoneID;
      completionHandler: TCloudKitCompletionHandler3); cdecl;
    procedure saveRecordZone(zone: CKRecordZone;
      completionHandler: TCloudKitCompletionHandler3); cdecl;
    procedure deleteRecordZoneWithID(zoneID: CKRecordZoneID;
      completionHandler: TCloudKitCompletionHandler4); cdecl;
    procedure fetchSubscriptionWithID(subscriptionID: CKSubscriptionID;
      completionHandler: TCloudKitCompletionHandler5); cdecl;
    procedure fetchAllSubscriptionsWithCompletionHandler(completionHandler
      : TCloudKitCompletionHandler2); cdecl;
    procedure saveSubscription(subscription: CKSubscription;
      completionHandler: TCloudKitCompletionHandler5); cdecl;
    procedure deleteSubscriptionWithID(subscriptionID: CKSubscriptionID;
      completionHandler: TCloudKitCompletionHandler6); cdecl;
  end;

  TCKDatabase = class(TOCGenericImport<CKDatabaseClass, CKDatabase>)
  end;

  PCKDatabase = Pointer;

  CKDatabaseOperationClass = interface(CKOperationClass)
    ['{4FD0CC16-E934-4754-9931-04A9E3584ADF}']
  end;

  CKDatabaseOperation = interface(CKOperation)
    ['{E297B1CA-32AF-4F2A-9D2A-6F1A92BAB685}']
    procedure setDatabase(database: CKDatabase); cdecl;
    function database: CKDatabase; cdecl;
  end;

  TCKDatabaseOperation = class(TOCGenericImport<CKDatabaseOperationClass,
    CKDatabaseOperation>)
  end;

  PCKDatabaseOperation = Pointer;

  CKRecordClass = interface(NSObjectClass)
    ['{3E6DE757-CF64-429F-9B15-92B374C19D3E}']
  end;

  CKRecord = interface(NSObject)
    ['{1F251EA6-8C02-415B-B685-006989C77AE4}']
    [MethodName('initWithRecordType:')]
    function initWithRecordType(recordType: CKRecordType)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithRecordType:recordID:')]
    function initWithRecordTypeRecordID(recordType: CKRecordType;
      recordID: CKRecordID): Pointer { instancetype }; cdecl;
    [MethodName('initWithRecordType:zoneID:')]
    function initWithRecordTypeZoneID(recordType: CKRecordType;
      zoneID: CKRecordZoneID): Pointer { instancetype }; cdecl;
    function recordType: CKRecordType; cdecl;
    function recordID: CKRecordID; cdecl;
    function recordChangeTag: NSString; cdecl;
    function creatorUserRecordID: CKRecordID; cdecl;
    function creationDate: NSDate; cdecl;
    function lastModifiedUserRecordID: CKRecordID; cdecl;
    function modificationDate: NSDate; cdecl;
    function objectForKey(key: CKRecordFieldKey): Pointer; cdecl;
    [MethodName('setObject:forKey:')]
    procedure setObjectForKey(&object: Pointer;
      forKey: CKRecordFieldKey); cdecl;
    function allKeys: NSArray; cdecl;
    function allTokens: NSArray; cdecl;
    function objectForKeyedSubscript(key: CKRecordFieldKey): Pointer; cdecl;
    [MethodName('setObject:forKeyedSubscript:')]
    procedure setObjectForKeyedSubscript(&object: Pointer;
      forKeyedSubscript: CKRecordFieldKey); cdecl;
    function changedKeys: NSArray; cdecl;
    procedure encodeSystemFieldsWithCoder(coder: NSCoder); cdecl;
    function share: CKReference; cdecl;
    procedure setParent(parent: CKReference); cdecl;
    function parent: CKReference; cdecl;
    procedure setParentReferenceFromRecord(parentRecord: CKRecord); cdecl;
    procedure setParentReferenceFromRecordID(parentRecordID: CKRecordID); cdecl;
    function encryptedValues: Pointer; cdecl;
  end;

  TCKRecord = class(TOCGenericImport<CKRecordClass, CKRecord>)
  end;

  PCKRecord = Pointer;

  CKShareClass = interface(CKRecordClass)
    ['{F4DE70F9-71A7-4DC1-B4A6-2E59D966D359}']
  end;

  CKShare = interface(CKRecord)
    ['{C7A06530-1819-45BD-8491-5E8A07EA0EF6}']
    [MethodName('initWithRootRecord:')]
    function initWithRootRecord(rootRecord: CKRecord)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithRootRecord:shareID:')]
    function initWithRootRecordShareID(rootRecord: CKRecord;
      shareID: CKRecordID): Pointer { instancetype }; cdecl;
    function initWithRecordZoneID(recordZoneID: CKRecordZoneID)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    procedure setPublicPermission(publicPermission
      : CKShareParticipantPermission); cdecl;
    function publicPermission: CKShareParticipantPermission; cdecl;
    function url: NSURL; cdecl;
    function participants: NSArray; cdecl;
    function owner: CKShareParticipant; cdecl;
    function currentUserParticipant: CKShareParticipant; cdecl;
    procedure addParticipant(participant: CKShareParticipant); cdecl;
    procedure removeParticipant(participant: CKShareParticipant); cdecl;
  end;

  TCKShare = class(TOCGenericImport<CKShareClass, CKShare>)
  end;

  PCKShare = Pointer;

  CKShareMetadataClass = interface(NSObjectClass)
    ['{7FFC727E-FE20-4750-9B89-96A177226638}']
  end;

  CKShareMetadata = interface(NSObject)
    ['{67344CD0-CB24-4C95-8C37-052EF554D665}']
    function containerIdentifier: NSString; cdecl;
    function share: CKShare; cdecl;
    function hierarchicalRootRecordID: CKRecordID; cdecl;
    function participantRole: CKShareParticipantRole; cdecl;
    function participantStatus: CKShareParticipantAcceptanceStatus; cdecl;
    function participantPermission: CKShareParticipantPermission; cdecl;
    function ownerIdentity: CKUserIdentity; cdecl;
    function rootRecord: CKRecord; cdecl;
    function participantType: CKShareParticipantType; cdecl;
    function rootRecordID: CKRecordID; cdecl;
  end;

  TCKShareMetadata = class(TOCGenericImport<CKShareMetadataClass,
    CKShareMetadata>)
  end;

  PCKShareMetadata = Pointer;

  CKAcceptSharesOperationClass = interface(CKOperationClass)
    ['{849CC81E-64D5-438B-A12F-B7ABA822FF17}']
  end;

  CKAcceptSharesOperation = interface(CKOperation)
    ['{BDB27C65-42F0-4AA9-8FD3-B0112C57E70A}']
    function init: Pointer { instancetype }; cdecl;
    function initWithShareMetadatas(shareMetadatas: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setShareMetadatas(shareMetadatas: NSArray); cdecl;
    function shareMetadatas: NSArray; cdecl;
    procedure setPerShareCompletionBlock(perShareCompletionBlock
      : TCloudKitPerShareCompletionBlock); cdecl;
    function perShareCompletionBlock: TCloudKitPerShareCompletionBlock; cdecl;
    procedure setAcceptSharesCompletionBlock(acceptSharesCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock); cdecl;
    function acceptSharesCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock; cdecl;
  end;

  TCKAcceptSharesOperation = class
    (TOCGenericImport<CKAcceptSharesOperationClass, CKAcceptSharesOperation>)
  end;

  PCKAcceptSharesOperation = Pointer;

  CKAllowedSharingOptionsClass = interface(NSObjectClass)
    ['{F844457F-9B55-479A-B3AF-786547C1EEB4}']
  end;

  CKAllowedSharingOptions = interface(NSObject)
    ['{B56E313F-1B29-4EEC-BEF7-91304DDD9602}']
    function initWithAllowedParticipantPermissionOptions
      (allowedParticipantPermissionOptions
      : CKSharingParticipantPermissionOption;
      allowedParticipantAccessOptions: CKSharingParticipantAccessOption)
      : Pointer { instancetype }; cdecl;
    procedure setAllowedParticipantPermissionOptions
      (allowedParticipantPermissionOptions
      : CKSharingParticipantPermissionOption); cdecl;
    function allowedParticipantPermissionOptions
      : CKSharingParticipantPermissionOption; cdecl;
    procedure setAllowedParticipantAccessOptions(allowedParticipantAccessOptions
      : CKSharingParticipantAccessOption); cdecl;
    function allowedParticipantAccessOptions
      : CKSharingParticipantAccessOption; cdecl;
    procedure setStandardOptions(standardOptions
      : CKAllowedSharingOptions); cdecl;
    function standardOptions: CKAllowedSharingOptions; cdecl;
  end;

  TCKAllowedSharingOptions = class
    (TOCGenericImport<CKAllowedSharingOptionsClass, CKAllowedSharingOptions>)
  end;

  PCKAllowedSharingOptions = Pointer;

  CKAssetClass = interface(NSObjectClass)
    ['{5DCD1301-04F5-4E35-9136-CF6E1C06041E}']
  end;

  CKAsset = interface(NSObject)
    ['{55D680E6-ED6E-48FC-8348-4143B25C25FC}']
    function initWithFileURL(fileURL: NSURL): Pointer { instancetype }; cdecl;
    function fileURL: NSURL; cdecl;
  end;

  TCKAsset = class(TOCGenericImport<CKAssetClass, CKAsset>)
  end;

  PCKAsset = Pointer;

  CKRecordIDClass = interface(NSObjectClass)
    ['{6CA36DBE-A09E-4037-B2F7-605B7244F01F}']
  end;

  CKRecordID = interface(NSObject)
    ['{BA491392-A58E-4043-8A79-BAD9543800F6}']
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

  CKReferenceClass = interface(NSObjectClass)
    ['{A1EC61FF-76D1-4F07-BF25-634DE001B53A}']
  end;

  CKReference = interface(NSObject)
    ['{88882B1C-2CA4-4F9D-A664-37D0639AA957}']
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

  CKRecordZoneIDClass = interface(NSObjectClass)
    ['{3742D180-B30F-4314-9740-79011275244C}']
  end;

  CKRecordZoneID = interface(NSObject)
    ['{331391D4-1346-4871-9447-FF3255AD16C5}']
    function initWithZoneName(zoneName: NSString; ownerName: NSString)
      : Pointer { instancetype }; cdecl;
    function zoneName: NSString; cdecl;
    function ownerName: NSString; cdecl;
  end;

  TCKRecordZoneID = class(TOCGenericImport<CKRecordZoneIDClass, CKRecordZoneID>)
  end;

  PCKRecordZoneID = Pointer;

  CKRecordValue = interface(IObjectiveC)
    ['{046C8295-875D-4854-8516-8D5E3B818BBA}']
  end;

  CKNotificationInfoClass = interface(NSObjectClass)
    ['{235E1853-4AEA-4978-B343-4E995324F116}']
  end;

  CKNotificationInfo = interface(NSObject)
    ['{D27CDEC9-828E-4E7E-B90F-8D2E76578B98}']
    procedure setAlertBody(alertBody: NSString); cdecl;
    function alertBody: NSString; cdecl;
    procedure setAlertLocalizationKey(alertLocalizationKey: NSString); cdecl;
    function alertLocalizationKey: NSString; cdecl;
    procedure setAlertLocalizationArgs(alertLocalizationArgs: NSArray); cdecl;
    function alertLocalizationArgs: NSArray; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setTitleLocalizationKey(titleLocalizationKey: NSString); cdecl;
    function titleLocalizationKey: NSString; cdecl;
    procedure setTitleLocalizationArgs(titleLocalizationArgs: NSArray); cdecl;
    function titleLocalizationArgs: NSArray; cdecl;
    procedure setSubtitle(subtitle: NSString); cdecl;
    function subtitle: NSString; cdecl;
    procedure setSubtitleLocalizationKey(subtitleLocalizationKey
      : NSString); cdecl;
    function subtitleLocalizationKey: NSString; cdecl;
    procedure setSubtitleLocalizationArgs(subtitleLocalizationArgs
      : NSArray); cdecl;
    function subtitleLocalizationArgs: NSArray; cdecl;
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
    procedure setShouldSendMutableContent(shouldSendMutableContent
      : Boolean); cdecl;
    function shouldSendMutableContent: Boolean; cdecl;
    procedure setCategory(category: NSString); cdecl;
    function category: NSString; cdecl;
    procedure setCollapseIDKey(collapseIDKey: NSString); cdecl;
    function collapseIDKey: NSString; cdecl;
  end;

  TCKNotificationInfo = class(TOCGenericImport<CKNotificationInfoClass,
    CKNotificationInfo>)
  end;

  PCKNotificationInfo = Pointer;

  CKSubscriptionClass = interface(NSObjectClass)
    ['{B0C81475-28A7-4B87-9194-CBF1E86C4257}']
  end;

  CKSubscription = interface(NSObject)
    ['{CC085D1A-373A-4A95-A7DE-58F8DFA05A24}']
    function subscriptionID: CKSubscriptionID; cdecl;
    function subscriptionType: CKSubscriptionType; cdecl;
    procedure setNotificationInfo(notificationInfo: CKNotificationInfo); cdecl;
    function notificationInfo: CKNotificationInfo; cdecl;
  end;

  TCKSubscription = class(TOCGenericImport<CKSubscriptionClass, CKSubscription>)
  end;

  PCKSubscription = Pointer;

  CKQuerySubscriptionClass = interface(CKSubscriptionClass)
    ['{403BE518-351E-4545-B33F-CC84615EE1EC}']
  end;

  CKQuerySubscription = interface(CKSubscription)
    ['{35958670-BB19-4539-BEEA-41C593D9F881}']
    [MethodName('initWithRecordType:predicate:options:')]
    function initWithRecordTypePredicateOptions(recordType: CKRecordType;
      predicate: NSPredicate; options: CKQuerySubscriptionOptions)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithRecordType:predicate:subscriptionID:options:')]
    function initWithRecordTypePredicateSubscriptionIDOptions
      (recordType: CKRecordType; predicate: NSPredicate;
      subscriptionID: CKSubscriptionID; options: CKQuerySubscriptionOptions)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function recordType: CKRecordType; cdecl;
    function predicate: NSPredicate; cdecl;
    procedure setZoneID(zoneID: CKRecordZoneID); cdecl;
    function zoneID: CKRecordZoneID; cdecl;
    function querySubscriptionOptions: CKQuerySubscriptionOptions; cdecl;
  end;

  TCKQuerySubscription = class(TOCGenericImport<CKQuerySubscriptionClass,
    CKQuerySubscription>)
  end;

  PCKQuerySubscription = Pointer;

  CKRecordZoneSubscriptionClass = interface(CKSubscriptionClass)
    ['{975F82A9-F2B7-4F64-BA30-47A91836DBD2}']
  end;

  CKRecordZoneSubscription = interface(CKSubscription)
    ['{8DC172C2-F3D1-4AC7-8714-C5ECC9B0B5B3}']
    [MethodName('initWithZoneID:')]
    function initWithZoneID(zoneID: CKRecordZoneID)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithZoneID:subscriptionID:')]
    function initWithZoneIDSubscriptionID(zoneID: CKRecordZoneID;
      subscriptionID: CKSubscriptionID): Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function zoneID: CKRecordZoneID; cdecl;
    procedure setRecordType(recordType: CKRecordType); cdecl;
    function recordType: CKRecordType; cdecl;
  end;

  TCKRecordZoneSubscription = class
    (TOCGenericImport<CKRecordZoneSubscriptionClass, CKRecordZoneSubscription>)
  end;

  PCKRecordZoneSubscription = Pointer;

  CKDatabaseSubscriptionClass = interface(CKSubscriptionClass)
    ['{2662654A-4D13-4DF3-88BE-CF6C2D33411C}']
  end;

  CKDatabaseSubscription = interface(CKSubscription)
    ['{26135C62-F682-4B9C-B450-91850F7D92E0}']
    function initWithSubscriptionID(subscriptionID: CKSubscriptionID)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    procedure setRecordType(recordType: CKRecordType); cdecl;
    function recordType: CKRecordType; cdecl;
  end;

  TCKDatabaseSubscription = class(TOCGenericImport<CKDatabaseSubscriptionClass,
    CKDatabaseSubscription>)
  end;

  PCKDatabaseSubscription = Pointer;

  CKRecordZoneClass = interface(NSObjectClass)
    ['{35F3F0D1-26F7-44CA-A91C-340113CE3A7D}']
    { class } function defaultRecordZone: CKRecordZone; cdecl;
  end;

  CKRecordZone = interface(NSObject)
    ['{5AB0D512-24C8-436C-8605-91F167998EED}']
    function initWithZoneName(zoneName: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithZoneID(zoneID: CKRecordZoneID)
      : Pointer { instancetype }; cdecl;
    function zoneID: CKRecordZoneID; cdecl;
    function capabilities: CKRecordZoneCapabilities; cdecl;
    function share: CKReference; cdecl;
  end;

  TCKRecordZone = class(TOCGenericImport<CKRecordZoneClass, CKRecordZone>)
  end;

  PCKRecordZone = Pointer;

  CKQueryClass = interface(NSObjectClass)
    ['{6EB1F29A-5D93-4129-A946-8F1791125D15}']
  end;

  CKQuery = interface(NSObject)
    ['{B978591C-5451-4884-8D78-9FBF269FDCA3}']
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function initWithRecordType(recordType: CKRecordType;
      predicate: NSPredicate): Pointer { instancetype }; cdecl;
    function recordType: CKRecordType; cdecl;
    function predicate: NSPredicate; cdecl;
    procedure setSortDescriptors(sortDescriptors: NSArray); cdecl;
    function sortDescriptors: NSArray; cdecl;
  end;

  TCKQuery = class(TOCGenericImport<CKQueryClass, CKQuery>)
  end;

  PCKQuery = Pointer;

  CKUserIdentityClass = interface(NSObjectClass)
    ['{3F6AFA66-B504-4B1A-A626-01DA99D8C8B4}']
  end;

  CKUserIdentity = interface(NSObject)
    ['{DF3DFB8D-40FB-4BEC-8C03-545D1684B11A}']
    function lookupInfo: CKUserIdentityLookupInfo; cdecl;
    function nameComponents: NSPersonNameComponents; cdecl;
    function userRecordID: CKRecordID; cdecl;
    function contactIdentifiers: NSArray; cdecl;
    function hasiCloudAccount: Boolean; cdecl;
  end;

  TCKUserIdentity = class(TOCGenericImport<CKUserIdentityClass, CKUserIdentity>)
  end;

  PCKUserIdentity = Pointer;

  CKShareParticipantClass = interface(NSObjectClass)
    ['{B38A566D-DB26-45EF-A57E-73292F095004}']
  end;

  CKShareParticipant = interface(NSObject)
    ['{C830AB24-2314-4EA5-B3E6-847552E1A1E0}']
    function userIdentity: CKUserIdentity; cdecl;
    procedure setRole(role: CKShareParticipantRole); cdecl;
    function role: CKShareParticipantRole; cdecl;
    procedure setType(&type: CKShareParticipantType); cdecl;
    function &type: CKShareParticipantType; cdecl;
    function acceptanceStatus: CKShareParticipantAcceptanceStatus; cdecl;
    procedure setPermission(permission: CKShareParticipantPermission); cdecl;
    function permission: CKShareParticipantPermission; cdecl;
  end;

  TCKShareParticipant = class(TOCGenericImport<CKShareParticipantClass,
    CKShareParticipant>)
  end;

  PCKShareParticipant = Pointer;

  CKDiscoverAllUserIdentitiesOperationClass = interface(CKOperationClass)
    ['{9FC0FAB9-B5E0-4561-B6FE-99CCDDA55502}']
  end;

  CKDiscoverAllUserIdentitiesOperation = interface(CKOperation)
    ['{7221AF18-A856-40FD-97F4-317A1FDCE917}']
    function init: Pointer { instancetype }; cdecl;
    procedure setUserIdentityDiscoveredBlock(userIdentityDiscoveredBlock
      : TCloudKitCompletionHandler8); cdecl;
    function userIdentityDiscoveredBlock: TCloudKitCompletionHandler8; cdecl;
    procedure setDiscoverAllUserIdentitiesCompletionBlock
      (discoverAllUserIdentitiesCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock); cdecl;
    function discoverAllUserIdentitiesCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock; cdecl;
  end;

  TCKDiscoverAllUserIdentitiesOperation = class
    (TOCGenericImport<CKDiscoverAllUserIdentitiesOperationClass,
    CKDiscoverAllUserIdentitiesOperation>)
  end;

  PCKDiscoverAllUserIdentitiesOperation = Pointer;

  CKUserIdentityLookupInfoClass = interface(NSObjectClass)
    ['{2757F824-26E7-42AC-BD57-1A7A13CACB27}']
    { class } function lookupInfosWithEmails(emails: NSArray): NSArray; cdecl;
    { class } function lookupInfosWithPhoneNumbers(phoneNumbers: NSArray)
      : NSArray; cdecl;
    { class } function lookupInfosWithRecordIDs(recordIDs: NSArray)
      : NSArray; cdecl;
  end;

  CKUserIdentityLookupInfo = interface(NSObject)
    ['{BED6A0BC-FE43-4731-B1DF-E6F9CBBB90C8}']
    function initWithEmailAddress(emailAddress: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithPhoneNumber(phoneNumber: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithUserRecordID(userRecordID: CKRecordID)
      : Pointer { instancetype }; cdecl;
    function emailAddress: NSString; cdecl;
    function phoneNumber: NSString; cdecl;
    function userRecordID: CKRecordID; cdecl;
  end;

  TCKUserIdentityLookupInfo = class
    (TOCGenericImport<CKUserIdentityLookupInfoClass, CKUserIdentityLookupInfo>)
  end;

  PCKUserIdentityLookupInfo = Pointer;

  CKDiscoverUserIdentitiesOperationClass = interface(CKOperationClass)
    ['{FB5AF73E-41D8-4397-AA74-122404D967F8}']
  end;

  CKDiscoverUserIdentitiesOperation = interface(CKOperation)
    ['{72B3175E-8CB4-4EC2-BB48-CD41299E3FD2}']
    function init: Pointer { instancetype }; cdecl;
    function initWithUserIdentityLookupInfos(userIdentityLookupInfos: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setUserIdentityLookupInfos(userIdentityLookupInfos
      : NSArray); cdecl;
    function userIdentityLookupInfos: NSArray; cdecl;
    procedure setUserIdentityDiscoveredBlock(userIdentityDiscoveredBlock
      : TCloudKitUserIdentityDiscoveredBlock); cdecl;
    function userIdentityDiscoveredBlock
      : TCloudKitUserIdentityDiscoveredBlock; cdecl;
    procedure setDiscoverUserIdentitiesCompletionBlock
      (discoverUserIdentitiesCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock); cdecl;
    function discoverUserIdentitiesCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock; cdecl;
  end;

  TCKDiscoverUserIdentitiesOperation = class
    (TOCGenericImport<CKDiscoverUserIdentitiesOperationClass,
    CKDiscoverUserIdentitiesOperation>)
  end;

  PCKDiscoverUserIdentitiesOperation = Pointer;

  CKServerChangeTokenClass = interface(NSObjectClass)
    ['{C87ED590-52EB-4BBB-9D29-55259100C23A}']
  end;

  CKServerChangeToken = interface(NSObject)
    ['{E9B55BF5-0213-4DCA-955C-BA0719CAD752}']
  end;

  TCKServerChangeToken = class(TOCGenericImport<CKServerChangeTokenClass,
    CKServerChangeToken>)
  end;

  PCKServerChangeToken = Pointer;

  CKFetchDatabaseChangesOperationClass = interface(CKDatabaseOperationClass)
    ['{669B9605-EE9E-4358-A626-81D2722FA1AC}']
  end;

  CKFetchDatabaseChangesOperation = interface(CKDatabaseOperation)
    ['{B7913961-135D-47CA-B6D6-450DA47C1781}']
    function init: Pointer { instancetype }; cdecl;
    function initWithPreviousServerChangeToken(previousServerChangeToken
      : CKServerChangeToken): Pointer { instancetype }; cdecl;
    procedure setPreviousServerChangeToken(previousServerChangeToken
      : CKServerChangeToken); cdecl;
    function previousServerChangeToken: CKServerChangeToken; cdecl;
    procedure setResultsLimit(resultsLimit: NSUInteger); cdecl;
    function resultsLimit: NSUInteger; cdecl;
    procedure setFetchAllChanges(fetchAllChanges: Boolean); cdecl;
    function fetchAllChanges: Boolean; cdecl;
    procedure setRecordZoneWithIDChangedBlock(recordZoneWithIDChangedBlock
      : TCloudKitRecordZoneWithIDChangedBlock); cdecl;
    function recordZoneWithIDChangedBlock
      : TCloudKitRecordZoneWithIDChangedBlock; cdecl;
    procedure setRecordZoneWithIDWasDeletedBlock(recordZoneWithIDWasDeletedBlock
      : TCloudKitRecordZoneWithIDChangedBlock); cdecl;
    function recordZoneWithIDWasDeletedBlock
      : TCloudKitRecordZoneWithIDChangedBlock; cdecl;
    procedure setRecordZoneWithIDWasPurgedBlock(recordZoneWithIDWasPurgedBlock
      : TCloudKitRecordZoneWithIDChangedBlock); cdecl;
    function recordZoneWithIDWasPurgedBlock
      : TCloudKitRecordZoneWithIDChangedBlock; cdecl;
    procedure setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock
      (recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock
      : TCloudKitRecordZoneWithIDChangedBlock); cdecl;
    function recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock
      : TCloudKitRecordZoneWithIDChangedBlock; cdecl;
    procedure setChangeTokenUpdatedBlock(changeTokenUpdatedBlock
      : TCloudKitChangeTokenUpdatedBlock); cdecl;
    function changeTokenUpdatedBlock: TCloudKitChangeTokenUpdatedBlock; cdecl;
    procedure setFetchDatabaseChangesCompletionBlock
      (fetchDatabaseChangesCompletionBlock
      : TCloudKitFetchDatabaseChangesCompletionBlock); cdecl;
    function fetchDatabaseChangesCompletionBlock
      : TCloudKitFetchDatabaseChangesCompletionBlock; cdecl;
  end;

  TCKFetchDatabaseChangesOperation = class
    (TOCGenericImport<CKFetchDatabaseChangesOperationClass,
    CKFetchDatabaseChangesOperation>)
  end;

  PCKFetchDatabaseChangesOperation = Pointer;

  CKNotificationClass = interface(NSObjectClass)
    ['{45520341-9E0E-4B01-B175-E68BD1B0DC62}']
    { class } function notificationFromRemoteNotificationDictionary
      (notificationDictionary: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  CKNotification = interface(NSObject)
    ['{75D91CF1-A303-40C7-A42B-27905C09F03B}']
    function notificationType: CKNotificationType; cdecl;
    function notificationID: CKNotificationID; cdecl;
    function containerIdentifier: NSString; cdecl;
    function subscriptionOwnerUserRecordID: CKRecordID; cdecl;
    function isPruned: Boolean; cdecl;
    function alertBody: NSString; cdecl;
    function alertLocalizationKey: NSString; cdecl;
    function alertLocalizationArgs: NSArray; cdecl;
    function title: NSString; cdecl;
    function titleLocalizationKey: NSString; cdecl;
    function titleLocalizationArgs: NSArray; cdecl;
    function subtitle: NSString; cdecl;
    function subtitleLocalizationKey: NSString; cdecl;
    function subtitleLocalizationArgs: NSArray; cdecl;
    function alertActionLocalizationKey: NSString; cdecl;
    function alertLaunchImage: NSString; cdecl;
    function badge: NSNumber; cdecl;
    function soundName: NSString; cdecl;
    function subscriptionID: CKSubscriptionID; cdecl;
    function category: NSString; cdecl;
  end;

  TCKNotification = class(TOCGenericImport<CKNotificationClass, CKNotification>)
  end;

  PCKNotification = Pointer;

  CKFetchNotificationChangesOperationClass = interface(CKOperationClass)
    ['{3BC88A05-0262-49F3-9205-75FF7993EFB8}']
  end;

  CKFetchNotificationChangesOperation = interface(CKOperation)
    ['{55AE80C5-41A7-4337-ADAF-FAAB5A277D4E}']
    function init: Pointer { instancetype }; cdecl;
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
    ['{C8DE4533-60BA-4CD0-9C48-CD06FACD0CEC}']
  end;

  CKFetchRecordChangesOperation = interface(CKDatabaseOperation)
    ['{49EB22CD-0BDB-4519-AA7D-B62F9FC2FBA4}']
    function init: Pointer { instancetype }; cdecl;
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
    ['{66C0E94D-2615-4FEF-BC4C-0FCBC7FFE230}']
    { class } function fetchCurrentUserRecordOperation
      : Pointer { instancetype }; cdecl;
  end;

  CKFetchRecordsOperation = interface(CKDatabaseOperation)
    ['{5E111B36-12A8-40FC-A417-1DE6B83F980B}']
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

  CKFetchRecordZoneChangesConfigurationClass = interface(NSObjectClass)
    ['{41FFC7DD-4AAA-4CA6-B2C4-DF2AD3020A68}']
  end;

  CKFetchRecordZoneChangesConfiguration = interface(NSObject)
    ['{224BC006-88DF-436E-8E74-E67A6C3814FD}']
    procedure setPreviousServerChangeToken(previousServerChangeToken
      : CKServerChangeToken); cdecl;
    function previousServerChangeToken: CKServerChangeToken; cdecl;
    procedure setResultsLimit(resultsLimit: NSUInteger); cdecl;
    function resultsLimit: NSUInteger; cdecl;
    procedure setDesiredKeys(desiredKeys: NSArray); cdecl;
    function desiredKeys: NSArray; cdecl;
  end;

  TCKFetchRecordZoneChangesConfiguration = class
    (TOCGenericImport<CKFetchRecordZoneChangesConfigurationClass,
    CKFetchRecordZoneChangesConfiguration>)
  end;

  PCKFetchRecordZoneChangesConfiguration = Pointer;

  CKFetchRecordZoneChangesOptionsClass = interface(NSObjectClass)
    ['{BD0E6EA9-27D9-4F60-B71B-C5B264B11F1C}']
  end;

  CKFetchRecordZoneChangesOptions = interface(NSObject)
    ['{7B0F99C6-3D51-4EBF-8AE2-72D6EBAB6943}']
    procedure setPreviousServerChangeToken(previousServerChangeToken
      : CKServerChangeToken); cdecl;
    function previousServerChangeToken: CKServerChangeToken; cdecl;
    procedure setResultsLimit(resultsLimit: NSUInteger); cdecl;
    function resultsLimit: NSUInteger; cdecl;
    procedure setDesiredKeys(desiredKeys: NSArray); cdecl;
    function desiredKeys: NSArray; cdecl;
  end;

  TCKFetchRecordZoneChangesOptions = class
    (TOCGenericImport<CKFetchRecordZoneChangesOptionsClass,
    CKFetchRecordZoneChangesOptions>)
  end;

  PCKFetchRecordZoneChangesOptions = Pointer;

  CKFetchRecordZoneChangesOperationClass = interface(CKDatabaseOperationClass)
    ['{44F703AD-73BB-4972-B0A4-BEEDC33EA724}']
  end;

  CKFetchRecordZoneChangesOperation = interface(CKDatabaseOperation)
    ['{29029AA1-81DB-4FC1-8153-F04E26A527E2}']
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithRecordZoneIDs:configurationsByRecordZoneID:')]
    function initWithRecordZoneIDsConfigurationsByRecordZoneID
      (recordZoneIDs: NSArray; configurationsByRecordZoneID: NSDictionary)
      : Pointer { instancetype }; cdecl;
    procedure setRecordZoneIDs(recordZoneIDs: NSArray); cdecl;
    function recordZoneIDs: NSArray; cdecl;
    procedure setConfigurationsByRecordZoneID(configurationsByRecordZoneID
      : NSDictionary); cdecl;
    function configurationsByRecordZoneID: NSDictionary; cdecl;
    procedure setFetchAllChanges(fetchAllChanges: Boolean); cdecl;
    function fetchAllChanges: Boolean; cdecl;
    procedure setRecordChangedBlock(recordChangedBlock
      : TCloudKitRecordChangedBlock); cdecl;
    function recordChangedBlock: TCloudKitRecordChangedBlock; cdecl;
    procedure setRecordWasChangedBlock(recordWasChangedBlock
      : TCloudKitRecordWasChangedBlock); cdecl;
    function recordWasChangedBlock: TCloudKitRecordWasChangedBlock; cdecl;
    procedure setRecordWithIDWasDeletedBlock(recordWithIDWasDeletedBlock
      : TCloudKitRecordWithIDWasDeletedBlock1); cdecl;
    function recordWithIDWasDeletedBlock
      : TCloudKitRecordWithIDWasDeletedBlock1; cdecl;
    procedure setRecordZoneChangeTokensUpdatedBlock
      (recordZoneChangeTokensUpdatedBlock
      : TCloudKitRecordZoneChangeTokensUpdatedBlock); cdecl;
    function recordZoneChangeTokensUpdatedBlock
      : TCloudKitRecordZoneChangeTokensUpdatedBlock; cdecl;
    procedure setRecordZoneFetchCompletionBlock(recordZoneFetchCompletionBlock
      : TCloudKitRecordZoneFetchCompletionBlock); cdecl;
    function recordZoneFetchCompletionBlock
      : TCloudKitRecordZoneFetchCompletionBlock; cdecl;
    procedure setFetchRecordZoneChangesCompletionBlock
      (fetchRecordZoneChangesCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock); cdecl;
    function fetchRecordZoneChangesCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock; cdecl;
    [MethodName('initWithRecordZoneIDs:optionsByRecordZoneID:')]
    function initWithRecordZoneIDsOptionsByRecordZoneID(recordZoneIDs: NSArray;
      optionsByRecordZoneID: NSDictionary): Pointer { instancetype }; cdecl;
    procedure setOptionsByRecordZoneID(optionsByRecordZoneID
      : NSDictionary); cdecl;
    function optionsByRecordZoneID: NSDictionary; cdecl;
  end;

  TCKFetchRecordZoneChangesOperation = class
    (TOCGenericImport<CKFetchRecordZoneChangesOperationClass,
    CKFetchRecordZoneChangesOperation>)
  end;

  PCKFetchRecordZoneChangesOperation = Pointer;

  CKFetchRecordZonesOperationClass = interface(CKDatabaseOperationClass)
    ['{6EE43A1A-52CA-41C4-BA11-D8B4D352EF14}']
    { class } function fetchAllRecordZonesOperation
      : Pointer { instancetype }; cdecl;
  end;

  CKFetchRecordZonesOperation = interface(CKDatabaseOperation)
    ['{1B133A84-4A13-4643-814A-78ABF72BEF09}']
    function init: Pointer { instancetype }; cdecl;
    function initWithRecordZoneIDs(zoneIDs: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setRecordZoneIDs(recordZoneIDs: NSArray); cdecl;
    function recordZoneIDs: NSArray; cdecl;
    procedure setPerRecordZoneCompletionBlock(perRecordZoneCompletionBlock
      : TCloudKitPerRecordZoneCompletionBlock); cdecl;
    function perRecordZoneCompletionBlock
      : TCloudKitPerRecordZoneCompletionBlock; cdecl;
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

  CKFetchShareMetadataOperationClass = interface(CKOperationClass)
    ['{BA71C960-E0FF-4323-853D-DE0B218A22D3}']
  end;

  CKFetchShareMetadataOperation = interface(CKOperation)
    ['{EAC0FE33-18F3-4608-BD7C-844C4F1E4EAD}']
    function init: Pointer { instancetype }; cdecl;
    function initWithShareURLs(shareURLs: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setShareURLs(shareURLs: NSArray); cdecl;
    function shareURLs: NSArray; cdecl;
    procedure setShouldFetchRootRecord(shouldFetchRootRecord: Boolean); cdecl;
    function shouldFetchRootRecord: Boolean; cdecl;
    procedure setRootRecordDesiredKeys(rootRecordDesiredKeys: NSArray); cdecl;
    function rootRecordDesiredKeys: NSArray; cdecl;
    procedure setPerShareMetadataBlock(perShareMetadataBlock
      : TCloudKitPerShareMetadataBlock); cdecl;
    function perShareMetadataBlock: TCloudKitPerShareMetadataBlock; cdecl;
    procedure setFetchShareMetadataCompletionBlock
      (fetchShareMetadataCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock); cdecl;
    function fetchShareMetadataCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock; cdecl;
  end;

  TCKFetchShareMetadataOperation = class
    (TOCGenericImport<CKFetchShareMetadataOperationClass,
    CKFetchShareMetadataOperation>)
  end;

  PCKFetchShareMetadataOperation = Pointer;

  CKFetchShareParticipantsOperationClass = interface(CKOperationClass)
    ['{142BB04F-A21F-4DF7-8D92-37E65DDE708F}']
  end;

  CKFetchShareParticipantsOperation = interface(CKOperation)
    ['{472B80DA-0CDE-4605-BA60-2FDE9A865BEC}']
    function init: Pointer { instancetype }; cdecl;
    function initWithUserIdentityLookupInfos(userIdentityLookupInfos: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setUserIdentityLookupInfos(userIdentityLookupInfos
      : NSArray); cdecl;
    function userIdentityLookupInfos: NSArray; cdecl;
    procedure setShareParticipantFetchedBlock(shareParticipantFetchedBlock
      : TCloudKitShareParticipantFetchedBlock); cdecl;
    function shareParticipantFetchedBlock
      : TCloudKitShareParticipantFetchedBlock; cdecl;
    procedure setPerShareParticipantCompletionBlock
      (perShareParticipantCompletionBlock
      : TCloudKitPerShareParticipantCompletionBlock); cdecl;
    function perShareParticipantCompletionBlock
      : TCloudKitPerShareParticipantCompletionBlock; cdecl;
    procedure setFetchShareParticipantsCompletionBlock
      (fetchShareParticipantsCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock); cdecl;
    function fetchShareParticipantsCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock; cdecl;
  end;

  TCKFetchShareParticipantsOperation = class
    (TOCGenericImport<CKFetchShareParticipantsOperationClass,
    CKFetchShareParticipantsOperation>)
  end;

  PCKFetchShareParticipantsOperation = Pointer;

  CKFetchSubscriptionsOperationClass = interface(CKDatabaseOperationClass)
    ['{7AA63F73-6252-4A90-B99C-980DA7CDED8F}']
    { class } function fetchAllSubscriptionsOperation
      : Pointer { instancetype }; cdecl;
  end;

  CKFetchSubscriptionsOperation = interface(CKDatabaseOperation)
    ['{8044E7F9-6EC6-4A42-AD38-ACD72D31C133}']
    function init: Pointer { instancetype }; cdecl;
    function initWithSubscriptionIDs(subscriptionIDs: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setSubscriptionIDs(subscriptionIDs: NSArray); cdecl;
    function subscriptionIDs: NSArray; cdecl;
    procedure setPerSubscriptionCompletionBlock(perSubscriptionCompletionBlock
      : TCloudKitPerSubscriptionCompletionBlock); cdecl;
    function perSubscriptionCompletionBlock
      : TCloudKitPerSubscriptionCompletionBlock; cdecl;
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
    ['{5EED06A8-B757-4EE7-8762-51939B1D5E9B}']
  end;

  CKFetchWebAuthTokenOperation = interface(CKDatabaseOperation)
    ['{7800AF37-8708-46DD-ACD6-C0DF0FDD2C31}']
    function init: Pointer { instancetype }; cdecl;
    function initWithAPIToken(APIToken: NSString)
      : Pointer { instancetype }; cdecl;
    procedure setAPIToken(APIToken: NSString); cdecl;
    function APIToken: NSString; cdecl;
    procedure setFetchWebAuthTokenCompletionBlock
      (fetchWebAuthTokenCompletionBlock
      : TCloudKitFetchWebAuthTokenCompletionBlock); cdecl;
    function fetchWebAuthTokenCompletionBlock
      : TCloudKitFetchWebAuthTokenCompletionBlock; cdecl;
  end;

  TCKFetchWebAuthTokenOperation = class
    (TOCGenericImport<CKFetchWebAuthTokenOperationClass,
    CKFetchWebAuthTokenOperation>)
  end;

  PCKFetchWebAuthTokenOperation = Pointer;

  CKLocationSortDescriptorClass = interface(NSSortDescriptorClass)
    ['{37043320-61CB-4BC4-800B-5EF1EFD2FBCD}']
  end;

  CKLocationSortDescriptor = interface(NSSortDescriptor)
    ['{5D1B9B74-CBAE-498F-B8DB-AA3995EF926E}']
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
    ['{DFCBE214-C600-4FCB-8E85-F1E998A2D490}']
  end;

  CKNotificationID = interface(NSObject)
    ['{2E5DEAD8-F40D-44D6-847D-DCB4BFBD82AE}']
  end;

  TCKNotificationID = class(TOCGenericImport<CKNotificationIDClass,
    CKNotificationID>)
  end;

  PCKNotificationID = Pointer;

  CKMarkNotificationsReadOperationClass = interface(CKOperationClass)
    ['{EAED54BF-0EAF-4B23-BEE2-782994F2278D}']
  end;

  CKMarkNotificationsReadOperation = interface(CKOperation)
    ['{BCD6871A-2D87-497E-A92C-F2B40D995766}']
    function init: Pointer { instancetype }; cdecl;
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
    ['{0B504128-FD9C-41C1-9A32-A143616B186A}']
  end;

  CKModifyBadgeOperation = interface(CKOperation)
    ['{3DCE3925-50AE-4BDA-AC2D-0DBFEC4A641E}']
    function init: Pointer { instancetype }; cdecl;
    function initWithBadgeValue(badgeValue: NSUInteger)
      : Pointer { instancetype }; cdecl;
    procedure setBadgeValue(badgeValue: NSUInteger); cdecl;
    function badgeValue: NSUInteger; cdecl;
    procedure setModifyBadgeCompletionBlock(modifyBadgeCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock); cdecl;
    function modifyBadgeCompletionBlock
      : TCloudKitAcceptSharesCompletionBlock; cdecl;
  end;

  TCKModifyBadgeOperation = class(TOCGenericImport<CKModifyBadgeOperationClass,
    CKModifyBadgeOperation>)
  end;

  PCKModifyBadgeOperation = Pointer;

  CKModifyRecordsOperationClass = interface(CKDatabaseOperationClass)
    ['{98A1A3B0-4C88-4BF2-B5E2-34CF03E7CD37}']
  end;

  CKModifyRecordsOperation = interface(CKDatabaseOperation)
    ['{B42F9371-D2CB-4FF9-8538-CDEE187A0F0C}']
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
      : TCloudKitCompletionHandler); cdecl;
    function perRecordCompletionBlock: TCloudKitCompletionHandler; cdecl;
    procedure setPerRecordSaveBlock(perRecordSaveBlock
      : TCloudKitRecordWasChangedBlock); cdecl;
    function perRecordSaveBlock: TCloudKitRecordWasChangedBlock; cdecl;
    procedure setPerRecordDeleteBlock(perRecordDeleteBlock
      : TCloudKitCompletionHandler1); cdecl;
    function perRecordDeleteBlock: TCloudKitCompletionHandler1; cdecl;
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
    ['{2162AF9F-753A-4721-9D38-F5DDB12DF2FC}']
  end;

  CKModifyRecordZonesOperation = interface(CKDatabaseOperation)
    ['{2135CB9E-C603-4091-A49B-EAB4C800B9CE}']
    function init: Pointer { instancetype }; cdecl;
    function initWithRecordZonesToSave(recordZonesToSave: NSArray;
      recordZoneIDsToDelete: NSArray): Pointer { instancetype }; cdecl;
    procedure setRecordZonesToSave(recordZonesToSave: NSArray); cdecl;
    function recordZonesToSave: NSArray; cdecl;
    procedure setRecordZoneIDsToDelete(recordZoneIDsToDelete: NSArray); cdecl;
    function recordZoneIDsToDelete: NSArray; cdecl;
    procedure setPerRecordZoneSaveBlock(perRecordZoneSaveBlock
      : TCloudKitPerRecordZoneCompletionBlock); cdecl;
    function perRecordZoneSaveBlock
      : TCloudKitPerRecordZoneCompletionBlock; cdecl;
    procedure setPerRecordZoneDeleteBlock(perRecordZoneDeleteBlock
      : TCloudKitCompletionHandler4); cdecl;
    function perRecordZoneDeleteBlock: TCloudKitCompletionHandler4; cdecl;
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
    ['{6CEF2D75-1D9E-44C0-9E48-D6E5AEF58BC2}']
  end;

  CKModifySubscriptionsOperation = interface(CKDatabaseOperation)
    ['{1ACD6B6D-8599-41DC-A903-4F9D1D3F00E1}']
    function init: Pointer { instancetype }; cdecl;
    function initWithSubscriptionsToSave(subscriptionsToSave: NSArray;
      subscriptionIDsToDelete: NSArray): Pointer { instancetype }; cdecl;
    procedure setSubscriptionsToSave(subscriptionsToSave: NSArray); cdecl;
    function subscriptionsToSave: NSArray; cdecl;
    procedure setSubscriptionIDsToDelete(subscriptionIDsToDelete
      : NSArray); cdecl;
    function subscriptionIDsToDelete: NSArray; cdecl;
    procedure setPerSubscriptionSaveBlock(perSubscriptionSaveBlock
      : TCloudKitPerSubscriptionCompletionBlock); cdecl;
    function perSubscriptionSaveBlock
      : TCloudKitPerSubscriptionCompletionBlock; cdecl;
    procedure setPerSubscriptionDeleteBlock(perSubscriptionDeleteBlock
      : TCloudKitCompletionHandler6); cdecl;
    function perSubscriptionDeleteBlock: TCloudKitCompletionHandler6; cdecl;
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

  CKQueryNotificationClass = interface(CKNotificationClass)
    ['{39BCFAC2-397F-4B68-B8BF-77F10DFDB4CA}']
  end;

  CKQueryNotification = interface(CKNotification)
    ['{6B543E7E-9E30-4929-A594-E354CFB551B2}']
    function queryNotificationReason: CKQueryNotificationReason; cdecl;
    function recordFields: NSDictionary; cdecl;
    function recordID: CKRecordID; cdecl;
    function databaseScope: CKDatabaseScope; cdecl;
  end;

  TCKQueryNotification = class(TOCGenericImport<CKQueryNotificationClass,
    CKQueryNotification>)
  end;

  PCKQueryNotification = Pointer;

  CKRecordZoneNotificationClass = interface(CKNotificationClass)
    ['{FA4D9080-5BAD-4DD2-A3A8-B80941F3EF30}']
  end;

  CKRecordZoneNotification = interface(CKNotification)
    ['{EAA629D4-BEAC-48E5-9534-9382C1BA9F50}']
    function recordZoneID: CKRecordZoneID; cdecl;
    function databaseScope: CKDatabaseScope; cdecl;
  end;

  TCKRecordZoneNotification = class
    (TOCGenericImport<CKRecordZoneNotificationClass, CKRecordZoneNotification>)
  end;

  PCKRecordZoneNotification = Pointer;

  CKDatabaseNotificationClass = interface(CKNotificationClass)
    ['{27F69741-8EBB-4791-9776-6184E98FD83C}']
  end;

  CKDatabaseNotification = interface(CKNotification)
    ['{8F4048FD-60E3-405A-8FF7-2DA3A4EB57D1}']
    function databaseScope: CKDatabaseScope; cdecl;
  end;

  TCKDatabaseNotification = class(TOCGenericImport<CKDatabaseNotificationClass,
    CKDatabaseNotification>)
  end;

  PCKDatabaseNotification = Pointer;

  CKQueryCursorClass = interface(NSObjectClass)
    ['{2A2F95A1-F747-4648-A461-C29139E08542}']
  end;

  CKQueryCursor = interface(NSObject)
    ['{8D789886-D793-4597-91B0-7514C9454C63}']
  end;

  TCKQueryCursor = class(TOCGenericImport<CKQueryCursorClass, CKQueryCursor>)
  end;

  PCKQueryCursor = Pointer;

  CKQueryOperationClass = interface(CKDatabaseOperationClass)
    ['{CA025854-171C-4291-9805-E1D879C12683}']
  end;

  CKQueryOperation = interface(CKDatabaseOperation)
    ['{58033F20-2AF6-4A26-B966-A2D2E8552FC1}']
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
    procedure setRecordMatchedBlock(recordMatchedBlock
      : TCloudKitRecordWasChangedBlock); cdecl;
    function recordMatchedBlock: TCloudKitRecordWasChangedBlock; cdecl;
    procedure setQueryCompletionBlock(queryCompletionBlock
      : TCloudKitQueryCompletionBlock); cdecl;
    function queryCompletionBlock: TCloudKitQueryCompletionBlock; cdecl;
  end;

  TCKQueryOperation = class(TOCGenericImport<CKQueryOperationClass,
    CKQueryOperation>)
  end;

  PCKQueryOperation = Pointer;

  CKSystemSharingUIObserverClass = interface(NSObjectClass)
    ['{2EC6E217-01FF-42F0-AAB2-E7254A700036}']
  end;

  CKSystemSharingUIObserver = interface(NSObject)
    ['{7176490F-C612-4D16-A8D8-7D2BCF0F6271}']
    function initWithContainer(container: CKContainer)
      : Pointer { instancetype }; cdecl;
    procedure setSystemSharingUIDidSaveShareBlock
      (systemSharingUIDidSaveShareBlock
      : TCloudKitSystemSharingUIDidSaveShareBlock); cdecl;
    function systemSharingUIDidSaveShareBlock
      : TCloudKitSystemSharingUIDidSaveShareBlock; cdecl;
    procedure setSystemSharingUIDidStopSharingBlock
      (systemSharingUIDidStopSharingBlock: TCloudKitCompletionHandler1); cdecl;
    function systemSharingUIDidStopSharingBlock
      : TCloudKitCompletionHandler1; cdecl;
  end;

  TCKSystemSharingUIObserver = class
    (TOCGenericImport<CKSystemSharingUIObserverClass,
    CKSystemSharingUIObserver>)
  end;

  PCKSystemSharingUIObserver = Pointer;

  CKSharingSupport = interface(IObjectiveC)
    ['{EC2B71D2-AE43-43BB-815F-429C7BE51A0E}']
    procedure registerCKShareWithContainer(container: CKContainer;
      allowedSharingOptions: CKAllowedSharingOptions;
      preparationHandler: CKSharePreparationHandler); cdecl;
    procedure registerCKShare(share: CKShare; container: CKContainer;
      allowedSharingOptions: CKAllowedSharingOptions); cdecl;
  end;

  // ===== Protocol declarations =====

  CKRecordKeyValueSetting = interface(IObjectiveC)
    ['{2C9D0796-5486-465E-B986-79D487BA74A8}']
    function objectForKey(key: CKRecordFieldKey): Pointer; cdecl;
    [MethodName('setObject:forKey:')]
    procedure setObjectForKey(&object: Pointer;
      forKey: CKRecordFieldKey); cdecl;
    function objectForKeyedSubscript(key: CKRecordFieldKey): Pointer; cdecl;
    [MethodName('setObject:forKeyedSubscript:')]
    procedure setObjectForKeyedSubscript(&object: Pointer;
      forKeyedSubscript: CKRecordFieldKey); cdecl;
    function allKeys: NSArray; cdecl;
    function changedKeys: NSArray; cdecl;
  end;

  // ===== Exported string consts =====

function CKRecordTypeUserRecord: Pointer;
function CKRecordParentKey: Pointer;
function CKRecordShareKey: Pointer;
function CKCurrentUserDefaultName: NSString;
function CKOwnerDefaultName: NSString;
function CKAccountChangedNotification: NSString;
function CKErrorDomain: NSString;
function CKPartialErrorsByItemIDKey: NSString;
function CKRecordChangedErrorAncestorRecordKey: NSString;
function CKRecordChangedErrorServerRecordKey: NSString;
function CKRecordChangedErrorClientRecordKey: NSString;
function CKErrorUserDidResetEncryptedDataKey: NSString;
function CKErrorRetryAfterKey: NSString;
function CKQueryOperationMaximumResults: Pointer;
function CKRecordZoneDefaultName: NSString;
function CKRecordTypeShare: Pointer;
function CKRecordNameZoneWideShare: NSString;
function CKShareTitleKey: Pointer;
function CKShareThumbnailImageDataKey: Pointer;
function CKShareTypeKey: Pointer;


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

function CKCurrentUserDefaultName: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit, 'CKCurrentUserDefaultName');
end;

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

function CKErrorUserDidResetEncryptedDataKey: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit,
    'CKErrorUserDidResetEncryptedDataKey');
end;

function CKErrorRetryAfterKey: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit, 'CKErrorRetryAfterKey');
end;

function CKRecordZoneDefaultName: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit, 'CKRecordZoneDefaultName');
end;

function CKRecordNameZoneWideShare: NSString;
begin
  Result := CocoaNSStringConst(libCloudKit, 'CKRecordNameZoneWideShare');
end;

function CKRecordTypeUserRecord: Pointer;
begin
  Result := CocoaPointerConst(libCloudKit, 'CKRecordTypeUserRecord');
end;

function CKRecordParentKey: Pointer;
begin
  Result := CocoaPointerConst(libCloudKit, 'CKRecordParentKey');
end;

function CKRecordShareKey: Pointer;
begin
  Result := CocoaPointerConst(libCloudKit, 'CKRecordShareKey');
end;

function CKQueryOperationMaximumResults: Pointer;
begin
  Result := CocoaPointerConst(libCloudKit, 'CKQueryOperationMaximumResults');
end;

function CKRecordTypeShare: Pointer;
begin
  Result := CocoaPointerConst(libCloudKit, 'CKRecordTypeShare');
end;

function CKShareTitleKey: Pointer;
begin
  Result := CocoaPointerConst(libCloudKit, 'CKShareTitleKey');
end;

function CKShareThumbnailImageDataKey: Pointer;
begin
  Result := CocoaPointerConst(libCloudKit, 'CKShareThumbnailImageDataKey');
end;

function CKShareTypeKey: Pointer;
begin
  Result := CocoaPointerConst(libCloudKit, 'CKShareTypeKey');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CloudKitModule := dlopen(MarshaledAString(libCloudKit), RTLD_LAZY);

finalization

dlclose(CloudKitModule);
{$ENDIF IOS}

end.
