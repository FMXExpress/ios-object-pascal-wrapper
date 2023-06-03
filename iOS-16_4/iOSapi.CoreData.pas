{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreData
//

unit iOSapi.CoreData;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CloudKit,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

const
  NSManagedObjectValidationError = 1550;
  NSManagedObjectConstraintValidationError = 1551;
  NSValidationMultipleErrorsError = 1560;
  NSValidationMissingMandatoryPropertyError = 1570;
  NSValidationRelationshipLacksMinimumCountError = 1580;
  NSValidationRelationshipExceedsMaximumCountError = 1590;
  NSValidationRelationshipDeniedDeleteError = 1600;
  NSValidationNumberTooLargeError = 1610;
  NSValidationNumberTooSmallError = 1620;
  NSValidationDateTooLateError = 1630;
  NSValidationDateTooSoonError = 1640;
  NSValidationInvalidDateError = 1650;
  NSValidationStringTooLongError = 1660;
  NSValidationStringTooShortError = 1670;
  NSValidationStringPatternMatchingError = 1680;
  NSValidationInvalidURIError = 1690;
  NSManagedObjectContextLockingError = 132000;
  NSPersistentStoreCoordinatorLockingError = 132010;
  NSManagedObjectReferentialIntegrityError = 133000;
  NSManagedObjectExternalRelationshipError = 133010;
  NSManagedObjectMergeError = 133020;
  NSManagedObjectConstraintMergeError = 133021;
  NSPersistentStoreInvalidTypeError = 134000;
  NSPersistentStoreTypeMismatchError = 134010;
  NSPersistentStoreIncompatibleSchemaError = 134020;
  NSPersistentStoreSaveError = 134030;
  NSPersistentStoreIncompleteSaveError = 134040;
  NSPersistentStoreSaveConflictsError = 134050;
  NSCoreDataError = 134060;
  NSPersistentStoreOperationError = 134070;
  NSPersistentStoreOpenError = 134080;
  NSPersistentStoreTimeoutError = 134090;
  NSPersistentStoreUnsupportedRequestTypeError = 134091;
  NSPersistentStoreIncompatibleVersionHashError = 134100;
  NSMigrationError = 134110;
  NSMigrationConstraintViolationError = 134111;
  NSMigrationCancelledError = 134120;
  NSMigrationMissingSourceModelError = 134130;
  NSMigrationMissingMappingModelError = 134140;
  NSMigrationManagerSourceStoreError = 134150;
  NSMigrationManagerDestinationStoreError = 134160;
  NSEntityMigrationPolicyError = 134170;
  NSSQLiteError = 134180;
  NSInferredMappingModelError = 134190;
  NSExternalRecordImportError = 134200;
  NSPersistentHistoryTokenExpiredError = 134301;
  NSUndefinedAttributeType = 0;
  NSInteger16AttributeType = 100;
  NSInteger32AttributeType = 200;
  NSInteger64AttributeType = 300;
  NSDecimalAttributeType = 400;
  NSDoubleAttributeType = 500;
  NSFloatAttributeType = 600;
  NSStringAttributeType = 700;
  NSBooleanAttributeType = 800;
  NSDateAttributeType = 900;
  NSBinaryDataAttributeType = 1000;
  NSUUIDAttributeType = 1100;
  NSURIAttributeType = 1200;
  NSTransformableAttributeType = 1800;
  NSObjectIDAttributeType = 2000;
  NSNoActionDeleteRule = 0;
  NSNullifyDeleteRule = 1;
  NSCascadeDeleteRule = 2;
  NSDenyDeleteRule = 3;
  NSFetchIndexElementTypeBinary = 0;
  NSFetchIndexElementTypeRTree = 1;
  NSFetchRequestType = 1;
  NSSaveRequestType = 2;
  NSBatchInsertRequestType = 5;
  NSBatchUpdateRequestType = 6;
  NSBatchDeleteRequestType = 7;
  NSSnapshotEventUndoInsertion = 1 shl 1;
  NSSnapshotEventUndoDeletion = 1 shl 2;
  NSSnapshotEventUndoUpdate = 1 shl 3;
  NSSnapshotEventRollback = 1 shl 4;
  NSSnapshotEventRefresh = 1 shl 5;
  NSSnapshotEventMergePolicy = 1 shl 6;
  NSManagedObjectResultType = 0;
  NSManagedObjectIDResultType = 1;
  NSDictionaryResultType = 2;
  NSCountResultType = 4;
  NSConfinementConcurrencyType = 0;
  NSPrivateQueueConcurrencyType = 1;
  NSMainQueueConcurrencyType = 2;
  NSPersistentStoreUbiquitousTransitionTypeAccountAdded = 1;
  NSPersistentStoreUbiquitousTransitionTypeAccountRemoved = 2;
  NSPersistentStoreUbiquitousTransitionTypeContentRemoved = 3;
  NSPersistentStoreUbiquitousTransitionTypeInitialImportCompleted = 4;
  NSUndefinedEntityMappingType = 0;
  NSCustomEntityMappingType = 1;
  NSAddEntityMappingType = 2;
  NSRemoveEntityMappingType = 3;
  NSCopyEntityMappingType = 4;
  NSTransformEntityMappingType = 5;
  NSBatchInsertRequestResultTypeStatusOnly = 0;
  NSBatchInsertRequestResultTypeObjectIDs = 1;
  NSBatchInsertRequestResultTypeCount = 2;
  NSStatusOnlyResultType = 0;
  NSUpdatedObjectIDsResultType = 1;
  NSUpdatedObjectsCountResultType = 2;
  NSBatchDeleteResultTypeStatusOnly = 0;
  NSBatchDeleteResultTypeObjectIDs = 1;
  NSBatchDeleteResultTypeCount = 2;
  NSPersistentHistoryResultTypeStatusOnly = 0;
  NSPersistentHistoryResultTypeObjectIDs = 1;
  NSPersistentHistoryResultTypeCount = 2;
  NSPersistentHistoryResultTypeTransactionsOnly = 3;
  NSPersistentHistoryResultTypeChangesOnly = 4;
  NSPersistentHistoryResultTypeTransactionsAndChanges = 5;
  NSPersistentCloudKitContainerEventResultTypeEvents = 0;
  NSPersistentCloudKitContainerEventResultTypeCountEvents = 1;
  NSErrorMergePolicyType = 0;
  NSMergeByPropertyStoreTrumpMergePolicyType = 1;
  NSMergeByPropertyObjectTrumpMergePolicyType = 2;
  NSOverwriteMergePolicyType = 3;
  NSRollbackMergePolicyType = 4;
  NSFetchedResultsChangeInsert = 1;
  NSFetchedResultsChangeDelete = 2;
  NSFetchedResultsChangeMove = 3;
  NSFetchedResultsChangeUpdate = 4;
  NSPersistentHistoryChangeTypeInsert = 0;
  NSPersistentHistoryChangeTypeUpdate = 1;
  NSPersistentHistoryChangeTypeDelete = 2;
  NSPersistentCloudKitContainerSchemaInitializationOptionsNone = 0;
  NSPersistentCloudKitContainerSchemaInitializationOptionsDryRun = 1 shl 1;
  NSPersistentCloudKitContainerSchemaInitializationOptionsPrintSchema = 1 shl 2;
  NSPersistentCloudKitContainerEventTypeSetup = 0;
  NSPersistentCloudKitContainerEventTypeImport = 1;
  NSPersistentCloudKitContainerEventTypeExport = 2;

type

  // ===== Forward declarations =====
{$M+}
  NSEntityDescription = interface;
  NSPropertyDescription = interface;
  NSAttributeDescription = interface;
  NSDerivedAttributeDescription = interface;
  NSManagedObjectModel = interface;
  NSManagedObjectContext = interface;
  NSManagedObject = interface;
  NSRelationshipDescription = interface;
  NSFetchIndexDescription = interface;
  NSFetchRequest = interface;
  NSFetchedPropertyDescription = interface;
  NSExpressionDescription = interface;
  NSFetchIndexElementDescription = interface;
  NSPersistentStore = interface;
  NSPersistentStoreRequest = interface;
  NSManagedObjectID = interface;
  NSFetchRequestResult = interface;
  NSFetchedResultSupport = interface;
  NSAsynchronousFetchResult = interface;
  NSAsynchronousFetchRequest = interface;
  NSFetchRequestExpression = interface;
  NSPersistentStoreResult = interface;
  NSPersistentStoreCoordinator = interface;
  NSQueryGenerationToken = interface;
  NSPersistentStoreDescription = interface;
  NSPersistentHistoryToken = interface;
  NSCoreDataCoreSpotlightDelegate = interface;
  NSAtomicStoreCacheNode = interface;
  NSAtomicStore = interface;
  NSEntityMapping = interface;
  NSMigrationManager = interface;
  NSEntityMigrationPolicy = interface;
  NSMappingModel = interface;
  NSPropertyMapping = interface;
  NSIncrementalStoreNode = interface;
  NSIncrementalStore = interface;
  NSPersistentStoreAsynchronousResult = interface;
  NSBatchInsertResult = interface;
  NSBatchUpdateResult = interface;
  NSBatchDeleteResult = interface;
  NSPersistentHistoryResult = interface;
  NSPersistentCloudKitContainerEventResult = interface;
  NSSaveChangesRequest = interface;
  NSBatchUpdateRequest = interface;
  NSBatchDeleteRequest = interface;
  NSBatchInsertRequest = interface;
  NSMergePolicy = interface;
  NSMergeConflict = interface;
  NSConstraintConflict = interface;
  NSFetchedResultsControllerDelegate = interface;
  NSFetchedResultsSectionInfo = interface;
  NSFetchedResultsController = interface;
  NSPersistentCloudKitContainerOptions = interface;
  NSPersistentContainer = interface;
  NSPersistentHistoryTransaction = interface;
  NSPersistentHistoryChange = interface;
  NSPersistentHistoryChangeRequest = interface;
  NSPersistentCloudKitContainer = interface;
  NSPersistentCloudKitContainerEvent = interface;
  NSPersistentCloudKitContainerEventRequest = interface;

  // ===== Framework typedefs =====
{$M+}
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  NSAttributeType = NSUInteger;
  NSDeleteRule = NSUInteger;
  NSFetchIndexElementType = NSUInteger;
  NSPersistentStoreRequestType = NSUInteger;
  NSSnapshotEventType = NSUInteger;
  NSKeyValueSetMutationKind = NSUInteger;
  NSFetchRequestResultType = NSUInteger;
  NSPersistentStoreAsynchronousFetchResultCompletionBlock = procedure
    (param1: NSAsynchronousFetchResult) of object;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  TCoreDataCompletionBlock = procedure(param1: NSAsynchronousFetchResult)
    of object;
  NSManagedObjectContextConcurrencyType = NSUInteger;
  TCoreDataBlock = procedure() of object;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  TCoreDataCompletionHandler = procedure(param1: NSPersistentStoreDescription;
    param2: NSError) of object;
  NSPersistentStoreUbiquitousTransitionType = NSUInteger;
  NSEntityMappingType = NSUInteger;
  NSBatchInsertRequestResultType = NSUInteger;
  NSBatchUpdateRequestResultType = NSUInteger;
  NSBatchDeleteRequestResultType = NSUInteger;
  NSPersistentHistoryResultType = NSInteger;
  NSPersistentCloudKitContainerEventResultType = NSInteger;
  TCoreDataDictionaryHandler = function(param1: NSMutableDictionary)
    : Boolean; cdecl;
  TCoreDataManagedObjectHandler = function(param1: NSManagedObject)
    : Boolean; cdecl;
  NSMergePolicyType = NSUInteger;
  ResultType = Pointer;
  PResultType = ^ResultType;
  NSFetchedResultsChangeType = NSUInteger;
  TCoreDataBlock1 = procedure(param1: NSManagedObjectContext) of object;
  NSPersistentHistoryChangeType = NSInteger;
  NSPersistentCloudKitContainerSchemaInitializationOptions = NSUInteger;
  CKDatabaseScope = NSInteger;
  NSPersistentCloudKitContainerEventType = NSInteger;
  NSNotificationName = NSString;
  PNSNotificationName = ^NSNotificationName;
  TCoreDataCompletionHandler1 = procedure(param1: NSError) of object;
  TCoreDataCompletion = procedure(param1: NSArray; param2: NSError) of object;
  TCoreDataCompletion1 = procedure(param1: CKRecordZoneID; param2: NSError)
    of object;
  TCoreDataCompletion2 = procedure(param1: CKShare; param2: NSError) of object;
  TCoreDataCompletion3 = procedure(param1: NSSet; param2: CKShare;
    param3: CKContainer; param4: NSError) of object;
  // ===== Interface declarations =====

  NSEntityDescriptionClass = interface(NSObjectClass)
    ['{887B3374-A470-4872-9507-14B1CF10B31A}']
    { class } function entityForName(entityName: NSString;
      inManagedObjectContext: NSManagedObjectContext)
      : NSEntityDescription; cdecl;
    { class } function insertNewObjectForEntityForName(entityName: NSString;
      inManagedObjectContext: NSManagedObjectContext): NSManagedObject; cdecl;
  end;

  NSEntityDescription = interface(NSObject)
    ['{7C7609FE-9010-4951-A890-BBFBDF510373}']
    function managedObjectModel: NSManagedObjectModel; cdecl;
    procedure setManagedObjectClassName(managedObjectClassName
      : NSString); cdecl;
    function managedObjectClassName: NSString; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setAbstract(abstract: Boolean); cdecl;
    function isAbstract: Boolean; cdecl;
    function subentitiesByName: NSDictionary; cdecl;
    procedure setSubentities(subentities: NSArray); cdecl;
    function subentities: NSArray; cdecl;
    function superentity: NSEntityDescription; cdecl;
    function propertiesByName: NSDictionary; cdecl;
    procedure setProperties(properties: NSArray); cdecl;
    function properties: NSArray; cdecl;
    procedure setUserInfo(userInfo: NSDictionary); cdecl;
    function userInfo: NSDictionary; cdecl;
    function attributesByName: NSDictionary; cdecl;
    function relationshipsByName: NSDictionary; cdecl;
    function relationshipsWithDestinationEntity(entity: NSEntityDescription)
      : NSArray; cdecl;
    function isKindOfEntity(entity: NSEntityDescription): Boolean; cdecl;
    function versionHash: NSData; cdecl;
    procedure setVersionHashModifier(versionHashModifier: NSString); cdecl;
    function versionHashModifier: NSString; cdecl;
    procedure setRenamingIdentifier(renamingIdentifier: NSString); cdecl;
    function renamingIdentifier: NSString; cdecl;
    procedure setIndexes(indexes: NSArray); cdecl;
    function indexes: NSArray; cdecl;
    procedure setUniquenessConstraints(uniquenessConstraints: NSArray); cdecl;
    function uniquenessConstraints: NSArray; cdecl;
    procedure setCompoundIndexes(compoundIndexes: NSArray); cdecl;
    function compoundIndexes: NSArray; cdecl;
    procedure setCoreSpotlightDisplayNameExpression
      (coreSpotlightDisplayNameExpression: NSExpression); cdecl;
    function coreSpotlightDisplayNameExpression: NSExpression; cdecl;
  end;

  TNSEntityDescription = class(TOCGenericImport<NSEntityDescriptionClass,
    NSEntityDescription>)
  end;

  PNSEntityDescription = Pointer;

  NSPropertyDescriptionClass = interface(NSObjectClass)
    ['{CBA59594-BDE2-4940-A335-6E4F6643FD4F}']
  end;

  NSPropertyDescription = interface(NSObject)
    ['{03243750-91C4-437E-9356-8CA26804D03C}']
    function entity: NSEntityDescription; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setOptional(optional: Boolean); cdecl;
    function isOptional: Boolean; cdecl;
    procedure setTransient(transient: Boolean); cdecl;
    function isTransient: Boolean; cdecl;
    function validationPredicates: NSArray; cdecl;
    function validationWarnings: NSArray; cdecl;
    procedure setValidationPredicates(validationPredicates: NSArray;
      withValidationWarnings: NSArray); cdecl;
    procedure setUserInfo(userInfo: NSDictionary); cdecl;
    function userInfo: NSDictionary; cdecl;
    procedure setIndexed(indexed: Boolean); cdecl;
    function isIndexed: Boolean; cdecl;
    function versionHash: NSData; cdecl;
    procedure setVersionHashModifier(versionHashModifier: NSString); cdecl;
    function versionHashModifier: NSString; cdecl;
    procedure setIndexedBySpotlight(indexedBySpotlight: Boolean); cdecl;
    function isIndexedBySpotlight: Boolean; cdecl;
    procedure setStoredInExternalRecord(storedInExternalRecord: Boolean); cdecl;
    function isStoredInExternalRecord: Boolean; cdecl;
    procedure setRenamingIdentifier(renamingIdentifier: NSString); cdecl;
    function renamingIdentifier: NSString; cdecl;
  end;

  TNSPropertyDescription = class(TOCGenericImport<NSPropertyDescriptionClass,
    NSPropertyDescription>)
  end;

  PNSPropertyDescription = Pointer;

  NSAttributeDescriptionClass = interface(NSPropertyDescriptionClass)
    ['{5F90F4AC-718D-4E8F-81BA-E95388CFDD95}']
  end;

  NSAttributeDescription = interface(NSPropertyDescription)
    ['{03083B84-D231-4EF6-BBE0-70A0D01FCC3E}']
    procedure setAttributeType(attributeType: NSAttributeType); cdecl;
    function attributeType: NSAttributeType; cdecl;
    procedure setAttributeValueClassName(attributeValueClassName
      : NSString); cdecl;
    function attributeValueClassName: NSString; cdecl;
    procedure setDefaultValue(defaultValue: Pointer); cdecl;
    function defaultValue: Pointer; cdecl;
    function versionHash: NSData; cdecl;
    procedure setValueTransformerName(valueTransformerName: NSString); cdecl;
    function valueTransformerName: NSString; cdecl;
    procedure setAllowsExternalBinaryDataStorage(allowsExternalBinaryDataStorage
      : Boolean); cdecl;
    function allowsExternalBinaryDataStorage: Boolean; cdecl;
    procedure setPreservesValueInHistoryOnDeletion
      (preservesValueInHistoryOnDeletion: Boolean); cdecl;
    function preservesValueInHistoryOnDeletion: Boolean; cdecl;
    procedure setAllowsCloudEncryption(allowsCloudEncryption: Boolean); cdecl;
    function allowsCloudEncryption: Boolean; cdecl;
  end;

  TNSAttributeDescription = class(TOCGenericImport<NSAttributeDescriptionClass,
    NSAttributeDescription>)
  end;

  PNSAttributeDescription = Pointer;

  NSDerivedAttributeDescriptionClass = interface(NSAttributeDescriptionClass)
    ['{FCEAACF8-7550-45F5-9F64-8303B5150A83}']
  end;

  NSDerivedAttributeDescription = interface(NSAttributeDescription)
    ['{A6BF9161-4DBE-46CF-BCF2-AC6DA9757302}']
    procedure setDerivationExpression(derivationExpression
      : NSExpression); cdecl;
    function derivationExpression: NSExpression; cdecl;
  end;

  TNSDerivedAttributeDescription = class
    (TOCGenericImport<NSDerivedAttributeDescriptionClass,
    NSDerivedAttributeDescription>)
  end;

  PNSDerivedAttributeDescription = Pointer;

  NSManagedObjectModelClass = interface(NSObjectClass)
    ['{A8604A45-126B-4CBB-A92C-B160474927F3}']
    [MethodName('mergedModelFromBundles:')]
    { class } function mergedModelFromBundles(bundles: NSArray)
      : NSManagedObjectModel; cdecl;
    [MethodName('modelByMergingModels:')]
    { class } function modelByMergingModels(models: NSArray)
      : NSManagedObjectModel; cdecl;
    [MethodName('mergedModelFromBundles:forStoreMetadata:')]
    { class } function mergedModelFromBundlesForStoreMetadata(bundles: NSArray;
      forStoreMetadata: NSDictionary): NSManagedObjectModel; cdecl;
    [MethodName('modelByMergingModels:forStoreMetadata:')]
    { class } function modelByMergingModelsForStoreMetadata(models: NSArray;
      forStoreMetadata: NSDictionary): NSManagedObjectModel; cdecl;
  end;

  NSManagedObjectModel = interface(NSObject)
    ['{34D29784-77D2-4ADC-99BA-CDE698D8D91B}']
    function init: Pointer { instancetype }; cdecl;
    function initWithContentsOfURL(url: NSURL): Pointer { instancetype }; cdecl;
    function entitiesByName: NSDictionary; cdecl;
    [MethodName('setEntities:')]
    procedure setEntities(entities: NSArray); cdecl;
    function entities: NSArray; cdecl;
    function configurations: NSArray; cdecl;
    function entitiesForConfiguration(configuration: NSString): NSArray; cdecl;
    [MethodName('setEntities:forConfiguration:')]
    procedure setEntitiesForConfiguration(entities: NSArray;
      forConfiguration: NSString); cdecl;
    procedure setFetchRequestTemplate(fetchRequestTemplate: NSFetchRequest;
      forName: NSString); cdecl;
    function fetchRequestTemplateForName(name: NSString): NSFetchRequest; cdecl;
    function fetchRequestFromTemplateWithName(name: NSString;
      substitutionVariables: NSDictionary): NSFetchRequest; cdecl;
    procedure setLocalizationDictionary(localizationDictionary
      : NSDictionary); cdecl;
    function localizationDictionary: NSDictionary; cdecl;
    function fetchRequestTemplatesByName: NSDictionary; cdecl;
    procedure setVersionIdentifiers(versionIdentifiers: NSSet); cdecl;
    function versionIdentifiers: NSSet; cdecl;
    function isConfiguration(configuration: NSString;
      compatibleWithStoreMetadata: NSDictionary): Boolean; cdecl;
    function entityVersionHashesByName: NSDictionary; cdecl;
  end;

  TNSManagedObjectModel = class(TOCGenericImport<NSManagedObjectModelClass,
    NSManagedObjectModel>)
  end;

  PNSManagedObjectModel = Pointer;

  NSManagedObjectContextClass = interface(NSObjectClass)
    ['{4C9B08BE-A63E-40B0-90A2-FA7C525EB65F}']
    { class } function new: Pointer { instancetype }; cdecl;
    { class } procedure mergeChangesFromRemoteContextSave(changeNotificationData
      : NSDictionary; intoContexts: NSArray); cdecl;
  end;

  NSManagedObjectContext = interface(NSObject)
    ['{018DEA84-5743-4740-B6D3-B4D40CF37CE7}']
    function init: Pointer { instancetype }; cdecl;
    function initWithConcurrencyType(ct: NSManagedObjectContextConcurrencyType)
      : Pointer { instancetype }; cdecl;
    procedure performBlock(block: TCoreDataBlock); cdecl;
    procedure performBlockAndWait(block: TCoreDataBlock); cdecl;
    procedure setPersistentStoreCoordinator(persistentStoreCoordinator
      : NSPersistentStoreCoordinator); cdecl;
    function persistentStoreCoordinator: NSPersistentStoreCoordinator; cdecl;
    procedure setParentContext(parentContext: NSManagedObjectContext); cdecl;
    function parentContext: NSManagedObjectContext; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setUndoManager(undoManager: NSUndoManager); cdecl;
    function undoManager: NSUndoManager; cdecl;
    function hasChanges: Boolean; cdecl;
    function userInfo: NSMutableDictionary; cdecl;
    function concurrencyType: NSManagedObjectContextConcurrencyType; cdecl;
    function objectRegisteredForID(objectID: NSManagedObjectID)
      : NSManagedObject; cdecl;
    function objectWithID(objectID: NSManagedObjectID): NSManagedObject; cdecl;
    function existingObjectWithID(objectID: NSManagedObjectID; error: NSError)
      : NSManagedObject; cdecl;
    function executeFetchRequest(request: NSFetchRequest; error: NSError)
      : NSArray; cdecl;
    function countForFetchRequest(request: NSFetchRequest; error: NSError)
      : NSUInteger; cdecl;
    function executeRequest(request: NSPersistentStoreRequest; error: NSError)
      : NSPersistentStoreResult; cdecl;
    procedure insertObject(&object: NSManagedObject); cdecl;
    procedure deleteObject(&object: NSManagedObject); cdecl;
    procedure refreshObject(&object: NSManagedObject;
      mergeChanges: Boolean); cdecl;
    procedure detectConflictsForObject(&object: NSManagedObject); cdecl;
    procedure observeValueForKeyPath(keyPath: NSString; ofObject: Pointer;
      change: NSDictionary; context: Pointer); cdecl;
    procedure processPendingChanges; cdecl;
    procedure assignObject(&object: Pointer;
      toPersistentStore: NSPersistentStore); cdecl;
    function insertedObjects: NSSet; cdecl;
    function updatedObjects: NSSet; cdecl;
    function deletedObjects: NSSet; cdecl;
    function registeredObjects: NSSet; cdecl;
    procedure undo; cdecl;
    procedure redo; cdecl;
    procedure reset; cdecl;
    procedure rollback; cdecl;
    function save(error: NSError): Boolean; cdecl;
    procedure refreshAllObjects; cdecl;
    procedure lock; cdecl;
    procedure unlock; cdecl;
    function tryLock: Boolean; cdecl;
    procedure setPropagatesDeletesAtEndOfEvent(propagatesDeletesAtEndOfEvent
      : Boolean); cdecl;
    function propagatesDeletesAtEndOfEvent: Boolean; cdecl;
    procedure setRetainsRegisteredObjects(retainsRegisteredObjects
      : Boolean); cdecl;
    function retainsRegisteredObjects: Boolean; cdecl;
    procedure setShouldDeleteInaccessibleFaults(shouldDeleteInaccessibleFaults
      : Boolean); cdecl;
    function shouldDeleteInaccessibleFaults: Boolean; cdecl;
    function shouldHandleInaccessibleFault(fault: NSManagedObject;
      forObjectID: NSManagedObjectID;
      triggeredByProperty: NSPropertyDescription): Boolean; cdecl;
    procedure setStalenessInterval(stalenessInterval: NSTimeInterval); cdecl;
    function stalenessInterval: NSTimeInterval; cdecl;
    procedure setMergePolicy(mergePolicy: Pointer); cdecl;
    function mergePolicy: Pointer; cdecl;
    function obtainPermanentIDsForObjects(objects: NSArray; error: NSError)
      : Boolean; cdecl;
    procedure mergeChangesFromContextDidSaveNotification
      (notification: NSNotification); cdecl;
    function queryGenerationToken: NSQueryGenerationToken; cdecl;
    function setQueryGenerationFromToken(generation: NSQueryGenerationToken;
      error: NSError): Boolean; cdecl;
    procedure setAutomaticallyMergesChangesFromParent
      (automaticallyMergesChangesFromParent: Boolean); cdecl;
    function automaticallyMergesChangesFromParent: Boolean; cdecl;
    procedure setTransactionAuthor(transactionAuthor: NSString); cdecl;
    function transactionAuthor: NSString; cdecl;
  end;

  TNSManagedObjectContext = class(TOCGenericImport<NSManagedObjectContextClass,
    NSManagedObjectContext>)
  end;

  PNSManagedObjectContext = Pointer;

  NSManagedObjectClass = interface(NSObjectClass)
    ['{608C5B24-7A68-466B-8220-BE30C0C511B1}']
    { class } function entity: NSEntityDescription; cdecl;
    { class } function fetchRequest: NSFetchRequest; cdecl;
  end;

  NSManagedObject = interface(NSObject)
    ['{34D0086A-5E6C-4D1F-98F6-D94C7EB77C32}']
    procedure setContextShouldIgnoreUnmodeledPropertyChanges
      (contextShouldIgnoreUnmodeledPropertyChanges: Boolean); cdecl;
    function contextShouldIgnoreUnmodeledPropertyChanges: Boolean; cdecl;
    function initWithEntity(entity: NSEntityDescription;
      insertIntoManagedObjectContext: NSManagedObjectContext)
      : NSManagedObject; cdecl;
    function initWithContext(moc: NSManagedObjectContext)
      : Pointer { instancetype }; cdecl;
    function managedObjectContext: NSManagedObjectContext; cdecl;
    function entity: NSEntityDescription; cdecl;
    function objectID: NSManagedObjectID; cdecl;
    function isInserted: Boolean; cdecl;
    function isUpdated: Boolean; cdecl;
    function isDeleted: Boolean; cdecl;
    function hasChanges: Boolean; cdecl;
    function hasPersistentChangedValues: Boolean; cdecl;
    function isFault: Boolean; cdecl;
    function hasFaultForRelationshipNamed(key: NSString): Boolean; cdecl;
    function objectIDsForRelationshipNamed(key: NSString): NSArray; cdecl;
    function faultingState: NSUInteger; cdecl;
    procedure willAccessValueForKey(key: NSString); cdecl;
    procedure didAccessValueForKey(key: NSString); cdecl;
    [MethodName('willChangeValueForKey:')]
    procedure willChangeValueForKey(key: NSString); cdecl;
    [MethodName('didChangeValueForKey:')]
    procedure didChangeValueForKey(key: NSString); cdecl;
    [MethodName('willChangeValueForKey:withSetMutation:usingObjects:')]
    procedure willChangeValueForKeyWithSetMutationUsingObjects(inKey: NSString;
      withSetMutation: NSKeyValueSetMutationKind; usingObjects: NSSet); cdecl;
    [MethodName('didChangeValueForKey:withSetMutation:usingObjects:')]
    procedure didChangeValueForKeyWithSetMutationUsingObjects(inKey: NSString;
      withSetMutation: NSKeyValueSetMutationKind; usingObjects: NSSet); cdecl;
    procedure awakeFromFetch; cdecl;
    procedure awakeFromInsert; cdecl;
    procedure awakeFromSnapshotEvents(flags: NSSnapshotEventType); cdecl;
    procedure prepareForDeletion; cdecl;
    procedure willSave; cdecl;
    procedure didSave; cdecl;
    procedure willTurnIntoFault; cdecl;
    procedure didTurnIntoFault; cdecl;
    function valueForKey(key: NSString): Pointer; cdecl;
    procedure setValue(value: Pointer; forKey: NSString); cdecl;
    function primitiveValueForKey(key: NSString): Pointer; cdecl;
    procedure setPrimitiveValue(value: Pointer; forKey: NSString); cdecl;
    function committedValuesForKeys(keys: NSArray): NSDictionary; cdecl;
    function changedValues: NSDictionary; cdecl;
    function changedValuesForCurrentEvent: NSDictionary; cdecl;
    function validateValue(value: Pointer; forKey: NSString; error: NSError)
      : Boolean; cdecl;
    function validateForDelete(error: NSError): Boolean; cdecl;
    function validateForInsert(error: NSError): Boolean; cdecl;
    function validateForUpdate(error: NSError): Boolean; cdecl;
  end;

  TNSManagedObject = class(TOCGenericImport<NSManagedObjectClass,
    NSManagedObject>)
  end;

  PNSManagedObject = Pointer;

  NSRelationshipDescriptionClass = interface(NSPropertyDescriptionClass)
    ['{C56F78BB-9C9B-4272-9DF8-3FF0BC2BF0A7}']
  end;

  NSRelationshipDescription = interface(NSPropertyDescription)
    ['{7480F3DC-9C7E-4D2D-B796-A5C3B53BCFEA}']
    procedure setDestinationEntity(destinationEntity
      : NSEntityDescription); cdecl;
    function destinationEntity: NSEntityDescription; cdecl;
    procedure setInverseRelationship(inverseRelationship
      : NSRelationshipDescription); cdecl;
    function inverseRelationship: NSRelationshipDescription; cdecl;
    procedure setMaxCount(maxCount: NSUInteger); cdecl;
    function maxCount: NSUInteger; cdecl;
    procedure setMinCount(minCount: NSUInteger); cdecl;
    function minCount: NSUInteger; cdecl;
    procedure setDeleteRule(deleteRule: NSDeleteRule); cdecl;
    function deleteRule: NSDeleteRule; cdecl;
    function isToMany: Boolean; cdecl;
    function versionHash: NSData; cdecl;
    procedure setOrdered(ordered: Boolean); cdecl;
    function isOrdered: Boolean; cdecl;
  end;

  TNSRelationshipDescription = class
    (TOCGenericImport<NSRelationshipDescriptionClass,
    NSRelationshipDescription>)
  end;

  PNSRelationshipDescription = Pointer;

  NSFetchIndexDescriptionClass = interface(NSObjectClass)
    ['{F2F1093A-EEE1-4571-B5A9-B3456083DF5E}']
  end;

  NSFetchIndexDescription = interface(NSObject)
    ['{7EE328B1-9080-40DE-B75B-87C11B451FFC}']
    function initWithName(name: NSString; elements: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setElements(elements: NSArray); cdecl;
    function elements: NSArray; cdecl;
    function entity: NSEntityDescription; cdecl;
    procedure setPartialIndexPredicate(partialIndexPredicate
      : NSPredicate); cdecl;
    function partialIndexPredicate: NSPredicate; cdecl;
  end;

  TNSFetchIndexDescription = class
    (TOCGenericImport<NSFetchIndexDescriptionClass, NSFetchIndexDescription>)
  end;

  PNSFetchIndexDescription = Pointer;

  NSPersistentStoreRequestClass = interface(NSObjectClass)
    ['{2EC1DC26-78EC-4E97-988D-2E7F3200D7FF}']
  end;

  NSPersistentStoreRequest = interface(NSObject)
    ['{5BAC4F0C-67E3-4CEB-96DE-C59EC556D8D8}']
    procedure setAffectedStores(affectedStores: NSArray); cdecl;
    function affectedStores: NSArray; cdecl;
    function requestType: NSPersistentStoreRequestType; cdecl;
  end;

  TNSPersistentStoreRequest = class
    (TOCGenericImport<NSPersistentStoreRequestClass, NSPersistentStoreRequest>)
  end;

  PNSPersistentStoreRequest = Pointer;

  NSFetchRequestClass = interface(NSPersistentStoreRequestClass)
    ['{D8D96446-189C-42DE-887F-45484E5DF55E}']
    { class } function fetchRequestWithEntityName(entityName: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  NSFetchRequest = interface(NSPersistentStoreRequest)
    ['{51871A87-EAEF-4483-BD47-7AA5C7852AEC}']
    function init: Pointer { instancetype }; cdecl;
    function initWithEntityName(entityName: NSString)
      : Pointer { instancetype }; cdecl;
    function execute(error: NSError): NSArray; cdecl;
    procedure setEntity(entity: NSEntityDescription); cdecl;
    function entity: NSEntityDescription; cdecl;
    function entityName: NSString; cdecl;
    procedure setPredicate(predicate: NSPredicate); cdecl;
    function predicate: NSPredicate; cdecl;
    procedure setSortDescriptors(sortDescriptors: NSArray); cdecl;
    function sortDescriptors: NSArray; cdecl;
    procedure setFetchLimit(fetchLimit: NSUInteger); cdecl;
    function fetchLimit: NSUInteger; cdecl;
    procedure setAffectedStores(affectedStores: NSArray); cdecl;
    function affectedStores: NSArray; cdecl;
    procedure setResultType(ResultType: NSFetchRequestResultType); cdecl;
    function ResultType: NSFetchRequestResultType; cdecl;
    procedure setIncludesSubentities(includesSubentities: Boolean); cdecl;
    function includesSubentities: Boolean; cdecl;
    procedure setIncludesPropertyValues(includesPropertyValues: Boolean); cdecl;
    function includesPropertyValues: Boolean; cdecl;
    procedure setReturnsObjectsAsFaults(returnsObjectsAsFaults: Boolean); cdecl;
    function returnsObjectsAsFaults: Boolean; cdecl;
    procedure setRelationshipKeyPathsForPrefetching
      (relationshipKeyPathsForPrefetching: NSArray); cdecl;
    function relationshipKeyPathsForPrefetching: NSArray; cdecl;
    procedure setIncludesPendingChanges(includesPendingChanges: Boolean); cdecl;
    function includesPendingChanges: Boolean; cdecl;
    procedure setReturnsDistinctResults(returnsDistinctResults: Boolean); cdecl;
    function returnsDistinctResults: Boolean; cdecl;
    procedure setPropertiesToFetch(propertiesToFetch: NSArray); cdecl;
    function propertiesToFetch: NSArray; cdecl;
    procedure setFetchOffset(fetchOffset: NSUInteger); cdecl;
    function fetchOffset: NSUInteger; cdecl;
    procedure setFetchBatchSize(fetchBatchSize: NSUInteger); cdecl;
    function fetchBatchSize: NSUInteger; cdecl;
    procedure setShouldRefreshRefetchedObjects(shouldRefreshRefetchedObjects
      : Boolean); cdecl;
    function shouldRefreshRefetchedObjects: Boolean; cdecl;
    procedure setPropertiesToGroupBy(propertiesToGroupBy: NSArray); cdecl;
    function propertiesToGroupBy: NSArray; cdecl;
    procedure setHavingPredicate(havingPredicate: NSPredicate); cdecl;
    function havingPredicate: NSPredicate; cdecl;
  end;

  TNSFetchRequest = class(TOCGenericImport<NSFetchRequestClass, NSFetchRequest>)
  end;

  PNSFetchRequest = Pointer;

  NSFetchedPropertyDescriptionClass = interface(NSPropertyDescriptionClass)
    ['{FE5B4F79-97E9-4D00-B058-F9823AC8F5F7}']
  end;

  NSFetchedPropertyDescription = interface(NSPropertyDescription)
    ['{8F4A2EF6-519C-4399-85B1-334986DD20BC}']
    procedure setFetchRequest(fetchRequest: NSFetchRequest); cdecl;
    function fetchRequest: NSFetchRequest; cdecl;
  end;

  TNSFetchedPropertyDescription = class
    (TOCGenericImport<NSFetchedPropertyDescriptionClass,
    NSFetchedPropertyDescription>)
  end;

  PNSFetchedPropertyDescription = Pointer;

  NSExpressionDescriptionClass = interface(NSPropertyDescriptionClass)
    ['{3D66241A-D9A2-4571-A288-A3345AEB8D32}']
  end;

  NSExpressionDescription = interface(NSPropertyDescription)
    ['{297192E9-13C4-4BE7-8E1D-0B7594E0639B}']
    procedure setExpression(expression: NSExpression); cdecl;
    function expression: NSExpression; cdecl;
    procedure setExpressionResultType(expressionResultType
      : NSAttributeType); cdecl;
    function expressionResultType: NSAttributeType; cdecl;
  end;

  TNSExpressionDescription = class
    (TOCGenericImport<NSExpressionDescriptionClass, NSExpressionDescription>)
  end;

  PNSExpressionDescription = Pointer;

  NSFetchIndexElementDescriptionClass = interface(NSObjectClass)
    ['{1186CD9A-5857-443D-92DF-7154DBC812D7}']
  end;

  NSFetchIndexElementDescription = interface(NSObject)
    ['{D8790325-D4F5-4C9F-817A-C93130779464}']
    function initWithProperty(&property: NSPropertyDescription;
      collationType: NSFetchIndexElementType): Pointer { instancetype }; cdecl;
    function &property: NSPropertyDescription; cdecl;
    function propertyName: NSString; cdecl;
    procedure setCollationType(collationType: NSFetchIndexElementType); cdecl;
    function collationType: NSFetchIndexElementType; cdecl;
    procedure setAscending(ascending: Boolean); cdecl;
    function isAscending: Boolean; cdecl;
    function indexDescription: NSFetchIndexDescription; cdecl;
  end;

  TNSFetchIndexElementDescription = class
    (TOCGenericImport<NSFetchIndexElementDescriptionClass,
    NSFetchIndexElementDescription>)
  end;

  PNSFetchIndexElementDescription = Pointer;

  NSPersistentStoreClass = interface(NSObjectClass)
    ['{361AB3D8-EAEA-47F7-94AE-5626A56E7CBB}']
    { class } function metadataForPersistentStoreWithURL(url: NSURL;
      error: NSError): NSDictionary; cdecl;
    { class } function setMetadata(metadata: NSDictionary;
      forPersistentStoreWithURL: NSURL; error: NSError): Boolean; cdecl;
    { class } function migrationManagerClass: Pointer; cdecl;
  end;

  NSPersistentStore = interface(NSObject)
    ['{D40EB722-3094-47D2-A3F9-E923B36412AF}']
    function initWithPersistentStoreCoordinator
      (root: NSPersistentStoreCoordinator; configurationName: NSString;
      url: NSURL; options: NSDictionary): Pointer { instancetype }; cdecl;
    function loadMetadata(error: NSError): Boolean; cdecl;
    function persistentStoreCoordinator: NSPersistentStoreCoordinator; cdecl;
    function configurationName: NSString; cdecl;
    function options: NSDictionary; cdecl;
    procedure setURL(url: NSURL); cdecl;
    function url: NSURL; cdecl;
    procedure setIdentifier(identifier: NSString); cdecl;
    function identifier: NSString; cdecl;
    function &type: NSString; cdecl;
    procedure setReadOnly(readOnly: Boolean); cdecl;
    function isReadOnly: Boolean; cdecl;
    procedure setMetadata(metadata: NSDictionary); cdecl;
    function metadata: NSDictionary; cdecl;
    procedure didAddToPersistentStoreCoordinator(coordinator
      : NSPersistentStoreCoordinator); cdecl;
    procedure willRemoveFromPersistentStoreCoordinator
      (coordinator: NSPersistentStoreCoordinator); cdecl;
    function coreSpotlightExporter: NSCoreDataCoreSpotlightDelegate; cdecl;
  end;

  TNSPersistentStore = class(TOCGenericImport<NSPersistentStoreClass,
    NSPersistentStore>)
  end;

  PNSPersistentStore = Pointer;

  NSManagedObjectIDClass = interface(NSObjectClass)
    ['{B9CB45BC-7644-4C07-B46F-7E7BB1E79746}']
  end;

  NSManagedObjectID = interface(NSObject)
    ['{B06E5E98-078D-46B2-95C4-730C336D586A}']
    function entity: NSEntityDescription; cdecl;
    function persistentStore: NSPersistentStore; cdecl;
    function isTemporaryID: Boolean; cdecl;
    function URIRepresentation: NSURL; cdecl;
  end;

  TNSManagedObjectID = class(TOCGenericImport<NSManagedObjectIDClass,
    NSManagedObjectID>)
  end;

  PNSManagedObjectID = Pointer;

  NSFetchedResultSupport = interface(IObjectiveC)
    ['{72FAEF3C-EC85-4DBB-A050-3B12290DFDF2}']
  end;

  NSPersistentStoreResultClass = interface(NSObjectClass)
    ['{03B58D84-EE76-48E6-B3BB-6CB3D7053050}']
  end;

  NSPersistentStoreResult = interface(NSObject)
    ['{4D365017-9520-494E-B125-967E1B04EBE4}']
  end;

  TNSPersistentStoreResult = class
    (TOCGenericImport<NSPersistentStoreResultClass, NSPersistentStoreResult>)
  end;

  PNSPersistentStoreResult = Pointer;

  NSPersistentStoreAsynchronousResultClass = interface
    (NSPersistentStoreResultClass)
    ['{D03F3D49-3D98-4DE8-B2E2-09A7B8225837}']
  end;

  NSPersistentStoreAsynchronousResult = interface(NSPersistentStoreResult)
    ['{C7ADDD33-CDA4-44EF-8DA1-E6AFA2F16A7C}']
    function managedObjectContext: NSManagedObjectContext; cdecl;
    function operationError: NSError; cdecl;
    function progress: NSProgress; cdecl;
    procedure cancel; cdecl;
  end;

  TNSPersistentStoreAsynchronousResult = class
    (TOCGenericImport<NSPersistentStoreAsynchronousResultClass,
    NSPersistentStoreAsynchronousResult>)
  end;

  PNSPersistentStoreAsynchronousResult = Pointer;

  NSAsynchronousFetchResultClass = interface
    (NSPersistentStoreAsynchronousResultClass)
    ['{E639446F-B2E3-4CD3-A0FF-3FA4D58E5E17}']
  end;

  NSAsynchronousFetchResult = interface(NSPersistentStoreAsynchronousResult)
    ['{35C60FE5-3FB7-4B88-8C7B-7C22DA15B472}']
    function fetchRequest: NSAsynchronousFetchRequest; cdecl;
    function finalResult: NSArray; cdecl;
  end;

  TNSAsynchronousFetchResult = class
    (TOCGenericImport<NSAsynchronousFetchResultClass,
    NSAsynchronousFetchResult>)
  end;

  PNSAsynchronousFetchResult = Pointer;

  NSAsynchronousFetchRequestClass = interface(NSPersistentStoreRequestClass)
    ['{4F49DACD-CCB3-4964-A9BD-45DB7007FC3B}']
  end;

  NSAsynchronousFetchRequest = interface(NSPersistentStoreRequest)
    ['{98873BED-87A0-44C6-8C10-ED7D62B51516}']
    function fetchRequest: NSFetchRequest; cdecl;
    function completionBlock
      : NSPersistentStoreAsynchronousFetchResultCompletionBlock; cdecl;
    procedure setEstimatedResultCount(estimatedResultCount: NSInteger); cdecl;
    function estimatedResultCount: NSInteger; cdecl;
    function initWithFetchRequest(request: NSFetchRequest;
      completionBlock: TCoreDataCompletionBlock)
      : Pointer { instancetype }; cdecl;
  end;

  TNSAsynchronousFetchRequest = class
    (TOCGenericImport<NSAsynchronousFetchRequestClass,
    NSAsynchronousFetchRequest>)
  end;

  PNSAsynchronousFetchRequest = Pointer;

  NSFetchRequestExpressionClass = interface(NSExpressionClass)
    ['{D8202BAF-3749-4B61-BCDB-E4C95D10D684}']
    { class } function expressionForFetch(fetch: NSExpression;
      context: NSExpression; countOnly: Boolean): NSExpression; cdecl;
  end;

  NSFetchRequestExpression = interface(NSExpression)
    ['{95E33148-36AF-45B8-9D18-A64C22E2F1DD}']
    function requestExpression: NSExpression; cdecl;
    function contextExpression: NSExpression; cdecl;
    function isCountOnlyRequest: Boolean; cdecl;
  end;

  TNSFetchRequestExpression = class
    (TOCGenericImport<NSFetchRequestExpressionClass, NSFetchRequestExpression>)
  end;

  PNSFetchRequestExpression = Pointer;

  NSPersistentStoreCoordinatorClass = interface(NSObjectClass)
    ['{735B57B0-D07E-4FC5-ACA6-CCA29559796F}']
    { class } procedure registerStoreClass(storeClass: Pointer;
      forStoreType: NSString); cdecl;
    [MethodName('metadataForPersistentStoreOfType:URL:options:error:')]
    { class } function metadataForPersistentStoreOfTypeURLOptionsError
      (storeType: NSString; url: NSURL; options: NSDictionary; error: NSError)
      : NSDictionary; cdecl;
    [MethodName('setMetadata:forPersistentStoreOfType:URL:options:error:')]
    { class } function setMetadataForPersistentStoreOfTypeURLOptionsError
      (metadata: NSDictionary; forPersistentStoreOfType: NSString; url: NSURL;
      options: NSDictionary; error: NSError): Boolean; cdecl;
    [MethodName('metadataForPersistentStoreOfType:URL:error:')]
    { class } function metadataForPersistentStoreOfTypeURLError
      (storeType: NSString; url: NSURL; error: NSError): NSDictionary; cdecl;
    [MethodName('setMetadata:forPersistentStoreOfType:URL:error:')]
    { class } function setMetadataForPersistentStoreOfTypeURLError
      (metadata: NSDictionary; forPersistentStoreOfType: NSString; url: NSURL;
      error: NSError): Boolean; cdecl;
    { class } function removeUbiquitousContentAndPersistentStoreAtURL
      (storeURL: NSURL; options: NSDictionary; error: NSError): Boolean; cdecl;
  end;

  NSPersistentStoreCoordinator = interface(NSObject)
    ['{8D15B180-2E87-40A8-9E04-C9AA4CB6F204}']
    function initWithManagedObjectModel(model: NSManagedObjectModel)
      : Pointer { instancetype }; cdecl;
    function managedObjectModel: NSManagedObjectModel; cdecl;
    function persistentStores: NSArray; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    function persistentStoreForURL(url: NSURL): NSPersistentStore; cdecl;
    function URLForPersistentStore(store: NSPersistentStore): NSURL; cdecl;
    function setURL(url: NSURL; forPersistentStore: NSPersistentStore)
      : Boolean; cdecl;
    function addPersistentStoreWithType(storeType: NSString;
      configuration: NSString; url: NSURL; options: NSDictionary;
      error: NSError): NSPersistentStore; cdecl;
    procedure addPersistentStoreWithDescription(storeDescription
      : NSPersistentStoreDescription;
      completionHandler: TCoreDataCompletionHandler); cdecl;
    function removePersistentStore(store: NSPersistentStore; error: NSError)
      : Boolean; cdecl;
    procedure setMetadata(metadata: NSDictionary;
      forPersistentStore: NSPersistentStore); cdecl;
    function metadataForPersistentStore(store: NSPersistentStore)
      : NSDictionary; cdecl;
    function managedObjectIDForURIRepresentation(url: NSURL)
      : NSManagedObjectID; cdecl;
    function executeRequest(request: NSPersistentStoreRequest;
      withContext: NSManagedObjectContext; error: NSError): Pointer; cdecl;
    procedure setRegisteredStoreTypes(registeredStoreTypes
      : NSDictionary); cdecl;
    function registeredStoreTypes: NSDictionary; cdecl;
    function migratePersistentStore(store: NSPersistentStore; toURL: NSURL;
      options: NSDictionary; withType: NSString; error: NSError)
      : NSPersistentStore; cdecl;
    function destroyPersistentStoreAtURL(url: NSURL; withType: NSString;
      options: NSDictionary; error: NSError): Boolean; cdecl;
    function replacePersistentStoreAtURL(destinationURL: NSURL;
      destinationOptions: NSDictionary; withPersistentStoreFromURL: NSURL;
      sourceOptions: NSDictionary; storeType: NSString; error: NSError)
      : Boolean; cdecl;
    procedure performBlock(block: TCoreDataBlock); cdecl;
    procedure performBlockAndWait(block: TCoreDataBlock); cdecl;
    function currentPersistentHistoryTokenFromStores(stores: NSArray)
      : NSPersistentHistoryToken; cdecl;
    procedure lock; cdecl;
    procedure unlock; cdecl;
    function tryLock: Boolean; cdecl;
  end;

  TNSPersistentStoreCoordinator = class
    (TOCGenericImport<NSPersistentStoreCoordinatorClass,
    NSPersistentStoreCoordinator>)
  end;

  PNSPersistentStoreCoordinator = Pointer;

  NSQueryGenerationTokenClass = interface(NSObjectClass)
    ['{0715E642-F8B8-4854-AA97-D10998899240}']
  end;

  NSQueryGenerationToken = interface(NSObject)
    ['{971E8F0F-9C3F-405A-BDA6-1C09D4DAFD18}']
    procedure setCurrentQueryGenerationToken(currentQueryGenerationToken
      : NSQueryGenerationToken); cdecl;
    function currentQueryGenerationToken: NSQueryGenerationToken; cdecl;
  end;

  TNSQueryGenerationToken = class(TOCGenericImport<NSQueryGenerationTokenClass,
    NSQueryGenerationToken>)
  end;

  PNSQueryGenerationToken = Pointer;

  NSPersistentStoreDescriptionClass = interface(NSObjectClass)
    ['{FEB51D7A-A650-4C13-83CB-B4D4E6407F4C}']
    { class } function persistentStoreDescriptionWithURL(url: NSURL)
      : Pointer { instancetype }; cdecl;
  end;

  NSPersistentStoreDescription = interface(NSObject)
    ['{38A03137-06FE-4C3C-8A77-EB9B6FAC64BB}']
    procedure setType(&type: NSString); cdecl;
    function &type: NSString; cdecl;
    procedure setConfiguration(configuration: NSString); cdecl;
    function configuration: NSString; cdecl;
    procedure setURL(url: NSURL); cdecl;
    function url: NSURL; cdecl;
    function options: NSDictionary; cdecl;
    procedure setOption(option: NSObject; forKey: NSString); cdecl;
    procedure setReadOnly(readOnly: Boolean); cdecl;
    function isReadOnly: Boolean; cdecl;
    procedure setTimeout(timeout: NSTimeInterval); cdecl;
    function timeout: NSTimeInterval; cdecl;
    function sqlitePragmas: NSDictionary; cdecl;
    procedure setValue(value: NSObject; forPragmaNamed: NSString); cdecl;
    procedure setShouldAddStoreAsynchronously(shouldAddStoreAsynchronously
      : Boolean); cdecl;
    function shouldAddStoreAsynchronously: Boolean; cdecl;
    procedure setShouldMigrateStoreAutomatically(shouldMigrateStoreAutomatically
      : Boolean); cdecl;
    function shouldMigrateStoreAutomatically: Boolean; cdecl;
    procedure setShouldInferMappingModelAutomatically
      (shouldInferMappingModelAutomatically: Boolean); cdecl;
    function shouldInferMappingModelAutomatically: Boolean; cdecl;
    function initWithURL(url: NSURL): Pointer { instancetype }; cdecl;
    procedure setCloudKitContainerOptions(cloudKitContainerOptions
      : NSPersistentCloudKitContainerOptions); cdecl;
    function cloudKitContainerOptions
      : NSPersistentCloudKitContainerOptions; cdecl;
  end;

  TNSPersistentStoreDescription = class
    (TOCGenericImport<NSPersistentStoreDescriptionClass,
    NSPersistentStoreDescription>)
  end;

  PNSPersistentStoreDescription = Pointer;

  NSPersistentHistoryTokenClass = interface(NSObjectClass)
    ['{B034EE10-374F-4945-8D11-D2D236220944}']
  end;

  NSPersistentHistoryToken = interface(NSObject)
    ['{460BBAF7-1A60-4A46-B6F9-051C6B2B4C16}']
  end;

  TNSPersistentHistoryToken = class
    (TOCGenericImport<NSPersistentHistoryTokenClass, NSPersistentHistoryToken>)
  end;

  PNSPersistentHistoryToken = Pointer;

  NSCoreDataCoreSpotlightDelegateClass = interface(NSObjectClass)
    ['{5AA009DB-CDBD-48AA-97D1-487BDF98412E}']
  end;

  NSCoreDataCoreSpotlightDelegate = interface(NSObject)
    ['{1E04B12E-794C-4A17-AD3F-C644B7B18612}']
    function isIndexingEnabled: Boolean; cdecl;
    function domainIdentifier: NSString; cdecl;
    function indexName: NSString; cdecl;
    [MethodName('initForStoreWithDescription:coordinator:')]
    function initForStoreWithDescriptionCoordinator
      (description: NSPersistentStoreDescription;
      coordinator: NSPersistentStoreCoordinator)
      : Pointer { instancetype }; cdecl;
    [MethodName('initForStoreWithDescription:model:')]
    function initForStoreWithDescriptionModel(description
      : NSPersistentStoreDescription; model: NSManagedObjectModel)
      : Pointer { instancetype }; cdecl;
    procedure startSpotlightIndexing; cdecl;
    procedure stopSpotlightIndexing; cdecl;
    procedure deleteSpotlightIndexWithCompletionHandler(completionHandler
      : TCoreDataCompletionHandler1); cdecl;
    function attributeSetForObject(&object: NSManagedObject)
      : CSSearchableItemAttributeSet; cdecl;
    [MethodName
      ('searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:')]
    procedure searchableIndexReindexAllSearchableItemsWithAcknowledgementHandler
      (searchableIndex: CSSearchableIndex;
      reindexAllSearchableItemsWithAcknowledgementHandler
      : TCoreDataBlock); cdecl;
    [MethodName
      ('searchableIndex:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:')
      ]
    procedure searchableIndexReindexSearchableItemsWithIdentifiersAcknowledgementHandler
      (searchableIndex: CSSearchableIndex;
      reindexSearchableItemsWithIdentifiers: NSArray;
      acknowledgementHandler: TCoreDataBlock); cdecl;
  end;

  TNSCoreDataCoreSpotlightDelegate = class
    (TOCGenericImport<NSCoreDataCoreSpotlightDelegateClass,
    NSCoreDataCoreSpotlightDelegate>)
  end;

  PNSCoreDataCoreSpotlightDelegate = Pointer;

  NSAtomicStoreCacheNodeClass = interface(NSObjectClass)
    ['{8285DE6D-2ECA-4684-B4A3-93393CFEEF1E}']
  end;

  NSAtomicStoreCacheNode = interface(NSObject)
    ['{D148FCA4-7AB8-4416-B03B-D269F638B16E}']
    function initWithObjectID(moid: NSManagedObjectID)
      : Pointer { instancetype }; cdecl;
    function objectID: NSManagedObjectID; cdecl;
    procedure setPropertyCache(propertyCache: NSMutableDictionary); cdecl;
    function propertyCache: NSMutableDictionary; cdecl;
    function valueForKey(key: NSString): Pointer; cdecl;
    procedure setValue(value: Pointer; forKey: NSString); cdecl;
  end;

  TNSAtomicStoreCacheNode = class(TOCGenericImport<NSAtomicStoreCacheNodeClass,
    NSAtomicStoreCacheNode>)
  end;

  PNSAtomicStoreCacheNode = Pointer;

  NSAtomicStoreClass = interface(NSPersistentStoreClass)
    ['{239D5FE8-92D4-4BC2-B6A5-68875A38E484}']
  end;

  NSAtomicStore = interface(NSPersistentStore)
    ['{1A19A7F8-BA5C-4E89-8037-A4B4B1A449F6}']
    function initWithPersistentStoreCoordinator(coordinator
      : NSPersistentStoreCoordinator; configurationName: NSString; url: NSURL;
      options: NSDictionary): Pointer { instancetype }; cdecl;
    function load(error: NSError): Boolean; cdecl;
    function save(error: NSError): Boolean; cdecl;
    function newCacheNodeForManagedObject(managedObject: NSManagedObject)
      : NSAtomicStoreCacheNode; cdecl;
    procedure updateCacheNode(node: NSAtomicStoreCacheNode;
      fromManagedObject: NSManagedObject); cdecl;
    function cacheNodes: NSSet; cdecl;
    procedure addCacheNodes(cacheNodes: NSSet); cdecl;
    procedure willRemoveCacheNodes(cacheNodes: NSSet); cdecl;
    function cacheNodeForObjectID(objectID: NSManagedObjectID)
      : NSAtomicStoreCacheNode; cdecl;
    function objectIDForEntity(entity: NSEntityDescription;
      referenceObject: Pointer): NSManagedObjectID; cdecl;
    function newReferenceObjectForManagedObject(managedObject: NSManagedObject)
      : Pointer; cdecl;
    function referenceObjectForObjectID(objectID: NSManagedObjectID)
      : Pointer; cdecl;
  end;

  TNSAtomicStore = class(TOCGenericImport<NSAtomicStoreClass, NSAtomicStore>)
  end;

  PNSAtomicStore = Pointer;

  NSEntityMappingClass = interface(NSObjectClass)
    ['{BE62E1F8-89B5-465E-96C7-702B2AF93BCD}']
  end;

  NSEntityMapping = interface(NSObject)
    ['{859DFD3B-D8CF-4BDD-A168-209C3BB9043C}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setMappingType(mappingType: NSEntityMappingType); cdecl;
    function mappingType: NSEntityMappingType; cdecl;
    procedure setSourceEntityName(sourceEntityName: NSString); cdecl;
    function sourceEntityName: NSString; cdecl;
    procedure setSourceEntityVersionHash(sourceEntityVersionHash
      : NSData); cdecl;
    function sourceEntityVersionHash: NSData; cdecl;
    procedure setDestinationEntityName(destinationEntityName: NSString); cdecl;
    function destinationEntityName: NSString; cdecl;
    procedure setDestinationEntityVersionHash(destinationEntityVersionHash
      : NSData); cdecl;
    function destinationEntityVersionHash: NSData; cdecl;
    procedure setAttributeMappings(attributeMappings: NSArray); cdecl;
    function attributeMappings: NSArray; cdecl;
    procedure setRelationshipMappings(relationshipMappings: NSArray); cdecl;
    function relationshipMappings: NSArray; cdecl;
    procedure setSourceExpression(sourceExpression: NSExpression); cdecl;
    function sourceExpression: NSExpression; cdecl;
    procedure setUserInfo(userInfo: NSDictionary); cdecl;
    function userInfo: NSDictionary; cdecl;
    procedure setEntityMigrationPolicyClassName(entityMigrationPolicyClassName
      : NSString); cdecl;
    function entityMigrationPolicyClassName: NSString; cdecl;
  end;

  TNSEntityMapping = class(TOCGenericImport<NSEntityMappingClass,
    NSEntityMapping>)
  end;

  PNSEntityMapping = Pointer;

  NSMigrationManagerClass = interface(NSObjectClass)
    ['{683D2A68-56AA-417D-913D-BFBEF23F07CE}']
  end;

  NSMigrationManager = interface(NSObject)
    ['{59BAD5BC-3D06-481B-A291-4D7730481EAE}']
    function initWithSourceModel(sourceModel: NSManagedObjectModel;
      destinationModel: NSManagedObjectModel): Pointer { instancetype }; cdecl;
    function migrateStoreFromURL(sourceURL: NSURL; &type: NSString;
      options: NSDictionary; withMappingModel: NSMappingModel;
      toDestinationURL: NSURL; destinationType: NSString;
      destinationOptions: NSDictionary; error: NSError): Boolean; cdecl;
    procedure setUsesStoreSpecificMigrationManager
      (usesStoreSpecificMigrationManager: Boolean); cdecl;
    function usesStoreSpecificMigrationManager: Boolean; cdecl;
    procedure reset; cdecl;
    function mappingModel: NSMappingModel; cdecl;
    function sourceModel: NSManagedObjectModel; cdecl;
    function destinationModel: NSManagedObjectModel; cdecl;
    function sourceContext: NSManagedObjectContext; cdecl;
    function destinationContext: NSManagedObjectContext; cdecl;
    function sourceEntityForEntityMapping(mEntity: NSEntityMapping)
      : NSEntityDescription; cdecl;
    function destinationEntityForEntityMapping(mEntity: NSEntityMapping)
      : NSEntityDescription; cdecl;
    procedure associateSourceInstance(sourceInstance: NSManagedObject;
      withDestinationInstance: NSManagedObject;
      forEntityMapping: NSEntityMapping); cdecl;
    function destinationInstancesForEntityMappingNamed(mappingName: NSString;
      sourceInstances: NSArray): NSArray; cdecl;
    function sourceInstancesForEntityMappingNamed(mappingName: NSString;
      destinationInstances: NSArray): NSArray; cdecl;
    function currentEntityMapping: NSEntityMapping; cdecl;
    function migrationProgress: Single; cdecl;
    procedure setUserInfo(userInfo: NSDictionary); cdecl;
    function userInfo: NSDictionary; cdecl;
    procedure cancelMigrationWithError(error: NSError); cdecl;
  end;

  TNSMigrationManager = class(TOCGenericImport<NSMigrationManagerClass,
    NSMigrationManager>)
  end;

  PNSMigrationManager = Pointer;

  NSEntityMigrationPolicyClass = interface(NSObjectClass)
    ['{205880C4-F69F-4428-BA88-01A2983D06E7}']
  end;

  NSEntityMigrationPolicy = interface(NSObject)
    ['{5369B103-ED7C-4053-B029-48FAD584FF19}']
    function beginEntityMapping(mapping: NSEntityMapping;
      manager: NSMigrationManager; error: NSError): Boolean; cdecl;
    function createDestinationInstancesForSourceInstance
      (sInstance: NSManagedObject; entityMapping: NSEntityMapping;
      manager: NSMigrationManager; error: NSError): Boolean; cdecl;
    function endInstanceCreationForEntityMapping(mapping: NSEntityMapping;
      manager: NSMigrationManager; error: NSError): Boolean; cdecl;
    function createRelationshipsForDestinationInstance
      (dInstance: NSManagedObject; entityMapping: NSEntityMapping;
      manager: NSMigrationManager; error: NSError): Boolean; cdecl;
    function endRelationshipCreationForEntityMapping(mapping: NSEntityMapping;
      manager: NSMigrationManager; error: NSError): Boolean; cdecl;
    function performCustomValidationForEntityMapping(mapping: NSEntityMapping;
      manager: NSMigrationManager; error: NSError): Boolean; cdecl;
    function endEntityMapping(mapping: NSEntityMapping;
      manager: NSMigrationManager; error: NSError): Boolean; cdecl;
  end;

  TNSEntityMigrationPolicy = class
    (TOCGenericImport<NSEntityMigrationPolicyClass, NSEntityMigrationPolicy>)
  end;

  PNSEntityMigrationPolicy = Pointer;

  NSMappingModelClass = interface(NSObjectClass)
    ['{7321B30E-0FD9-4A8A-A460-F62F11B5FB35}']
    { class } function mappingModelFromBundles(bundles: NSArray;
      forSourceModel: NSManagedObjectModel;
      destinationModel: NSManagedObjectModel): NSMappingModel; cdecl;
    { class } function inferredMappingModelForSourceModel
      (sourceModel: NSManagedObjectModel;
      destinationModel: NSManagedObjectModel; error: NSError)
      : NSMappingModel; cdecl;
  end;

  NSMappingModel = interface(NSObject)
    ['{6C85AA7D-24F3-4D7A-AA73-D26AB10C7595}']
    function initWithContentsOfURL(url: NSURL): Pointer { instancetype }; cdecl;
    procedure setEntityMappings(entityMappings: NSArray); cdecl;
    function entityMappings: NSArray; cdecl;
    function entityMappingsByName: NSDictionary; cdecl;
  end;

  TNSMappingModel = class(TOCGenericImport<NSMappingModelClass, NSMappingModel>)
  end;

  PNSMappingModel = Pointer;

  NSPropertyMappingClass = interface(NSObjectClass)
    ['{6933485D-5F3F-4387-B494-C242E598B9CF}']
  end;

  NSPropertyMapping = interface(NSObject)
    ['{B7DAAFAD-1F52-4B93-BB07-56611DB34A74}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setValueExpression(valueExpression: NSExpression); cdecl;
    function valueExpression: NSExpression; cdecl;
    procedure setUserInfo(userInfo: NSDictionary); cdecl;
    function userInfo: NSDictionary; cdecl;
  end;

  TNSPropertyMapping = class(TOCGenericImport<NSPropertyMappingClass,
    NSPropertyMapping>)
  end;

  PNSPropertyMapping = Pointer;

  NSIncrementalStoreNodeClass = interface(NSObjectClass)
    ['{EE8831B4-F609-480E-942E-BD654306F28B}']
  end;

  NSIncrementalStoreNode = interface(NSObject)
    ['{4F459762-860C-416F-99F2-2D169AAF78B6}']
    function initWithObjectID(objectID: NSManagedObjectID;
      withValues: NSDictionary; version: UInt64)
      : Pointer { instancetype }; cdecl;
    procedure updateWithValues(values: NSDictionary; version: UInt64); cdecl;
    function objectID: NSManagedObjectID; cdecl;
    function version: UInt64; cdecl;
    function valueForPropertyDescription(prop: NSPropertyDescription)
      : Pointer; cdecl;
  end;

  TNSIncrementalStoreNode = class(TOCGenericImport<NSIncrementalStoreNodeClass,
    NSIncrementalStoreNode>)
  end;

  PNSIncrementalStoreNode = Pointer;

  NSIncrementalStoreClass = interface(NSPersistentStoreClass)
    ['{53A4DBD4-DD0D-452B-ABCF-997976552C4F}']
    { class } function identifierForNewStoreAtURL(storeURL: NSURL)
      : Pointer; cdecl;
  end;

  NSIncrementalStore = interface(NSPersistentStore)
    ['{8EEAABF2-B5E1-44EF-A903-55ED104512C2}']
    function loadMetadata(error: NSError): Boolean; cdecl;
    function executeRequest(request: NSPersistentStoreRequest;
      withContext: NSManagedObjectContext; error: NSError): Pointer; cdecl;
    function newValuesForObjectWithID(objectID: NSManagedObjectID;
      withContext: NSManagedObjectContext; error: NSError)
      : NSIncrementalStoreNode; cdecl;
    function newValueForRelationship(relationship: NSRelationshipDescription;
      forObjectWithID: NSManagedObjectID; withContext: NSManagedObjectContext;
      error: NSError): Pointer; cdecl;
    function obtainPermanentIDsForObjects(&array: NSArray; error: NSError)
      : NSArray; cdecl;
    procedure managedObjectContextDidRegisterObjectsWithIDs
      (objectIDs: NSArray); cdecl;
    procedure managedObjectContextDidUnregisterObjectsWithIDs
      (objectIDs: NSArray); cdecl;
    function newObjectIDForEntity(entity: NSEntityDescription;
      referenceObject: Pointer): NSManagedObjectID; cdecl;
    function referenceObjectForObjectID(objectID: NSManagedObjectID)
      : Pointer; cdecl;
  end;

  TNSIncrementalStore = class(TOCGenericImport<NSIncrementalStoreClass,
    NSIncrementalStore>)
  end;

  PNSIncrementalStore = Pointer;

  NSBatchInsertResultClass = interface(NSPersistentStoreResultClass)
    ['{8B6BCF49-E4E2-48F2-A0F7-0B5F14D5324A}']
  end;

  NSBatchInsertResult = interface(NSPersistentStoreResult)
    ['{50039E84-EFC3-4471-858B-FBA9819BE771}']
    function result: Pointer; cdecl;
    function ResultType: NSBatchInsertRequestResultType; cdecl;
  end;

  TNSBatchInsertResult = class(TOCGenericImport<NSBatchInsertResultClass,
    NSBatchInsertResult>)
  end;

  PNSBatchInsertResult = Pointer;

  NSBatchUpdateResultClass = interface(NSPersistentStoreResultClass)
    ['{A378CE24-ECF9-43F4-BDDB-6AAF62352DA8}']
  end;

  NSBatchUpdateResult = interface(NSPersistentStoreResult)
    ['{1E943FEC-FE7C-4831-AD2E-32EEA815D095}']
    function result: Pointer; cdecl;
    function ResultType: NSBatchUpdateRequestResultType; cdecl;
  end;

  TNSBatchUpdateResult = class(TOCGenericImport<NSBatchUpdateResultClass,
    NSBatchUpdateResult>)
  end;

  PNSBatchUpdateResult = Pointer;

  NSBatchDeleteResultClass = interface(NSPersistentStoreResultClass)
    ['{1E4C1360-C0C5-44BB-BF71-FD431D785F0F}']
  end;

  NSBatchDeleteResult = interface(NSPersistentStoreResult)
    ['{A5A29C5E-3195-4293-A457-E4A2F3BBAED0}']
    function result: Pointer; cdecl;
    function ResultType: NSBatchDeleteRequestResultType; cdecl;
  end;

  TNSBatchDeleteResult = class(TOCGenericImport<NSBatchDeleteResultClass,
    NSBatchDeleteResult>)
  end;

  PNSBatchDeleteResult = Pointer;

  NSPersistentHistoryResultClass = interface(NSPersistentStoreResultClass)
    ['{86603C0A-C3AF-47F4-A97B-8B7D7AE7283C}']
  end;

  NSPersistentHistoryResult = interface(NSPersistentStoreResult)
    ['{3DE64B3B-EC19-417F-ABA9-709AB2614FDA}']
    function result: Pointer; cdecl;
    function ResultType: NSPersistentHistoryResultType; cdecl;
  end;

  TNSPersistentHistoryResult = class
    (TOCGenericImport<NSPersistentHistoryResultClass,
    NSPersistentHistoryResult>)
  end;

  PNSPersistentHistoryResult = Pointer;

  NSPersistentCloudKitContainerEventResultClass = interface
    (NSPersistentStoreResultClass)
    ['{B4A21669-E5DB-4666-95CB-0F01AB6A53D7}']
  end;

  NSPersistentCloudKitContainerEventResult = interface(NSPersistentStoreResult)
    ['{AD6E24D4-96BA-4D6F-8E9A-89DE534F7F8E}']
    function result: Pointer; cdecl;
    function ResultType: NSPersistentCloudKitContainerEventResultType; cdecl;
  end;

  TNSPersistentCloudKitContainerEventResult = class
    (TOCGenericImport<NSPersistentCloudKitContainerEventResultClass,
    NSPersistentCloudKitContainerEventResult>)
  end;

  PNSPersistentCloudKitContainerEventResult = Pointer;

  NSSaveChangesRequestClass = interface(NSPersistentStoreRequestClass)
    ['{41D858DD-8FD9-4259-B25F-2600ECA6F9DC}']
  end;

  NSSaveChangesRequest = interface(NSPersistentStoreRequest)
    ['{A395A1BB-15A8-4251-A991-4A568F18E842}']
    function initWithInsertedObjects(insertedObjects: NSSet;
      updatedObjects: NSSet; deletedObjects: NSSet; lockedObjects: NSSet)
      : Pointer { instancetype }; cdecl;
    function insertedObjects: NSSet; cdecl;
    function updatedObjects: NSSet; cdecl;
    function deletedObjects: NSSet; cdecl;
    function lockedObjects: NSSet; cdecl;
  end;

  TNSSaveChangesRequest = class(TOCGenericImport<NSSaveChangesRequestClass,
    NSSaveChangesRequest>)
  end;

  PNSSaveChangesRequest = Pointer;

  NSBatchUpdateRequestClass = interface(NSPersistentStoreRequestClass)
    ['{AFD2183E-1F82-4A69-8EAC-7364A01006A5}']
    { class } function batchUpdateRequestWithEntityName(entityName: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  NSBatchUpdateRequest = interface(NSPersistentStoreRequest)
    ['{B1620CA6-76D9-41C9-B262-F0D6531D8401}']
    function initWithEntityName(entityName: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithEntity(entity: NSEntityDescription)
      : Pointer { instancetype }; cdecl;
    function entityName: NSString; cdecl;
    function entity: NSEntityDescription; cdecl;
    procedure setPredicate(predicate: NSPredicate); cdecl;
    function predicate: NSPredicate; cdecl;
    procedure setIncludesSubentities(includesSubentities: Boolean); cdecl;
    function includesSubentities: Boolean; cdecl;
    procedure setResultType(ResultType: NSBatchUpdateRequestResultType); cdecl;
    function ResultType: NSBatchUpdateRequestResultType; cdecl;
    procedure setPropertiesToUpdate(propertiesToUpdate: NSDictionary); cdecl;
    function propertiesToUpdate: NSDictionary; cdecl;
  end;

  TNSBatchUpdateRequest = class(TOCGenericImport<NSBatchUpdateRequestClass,
    NSBatchUpdateRequest>)
  end;

  PNSBatchUpdateRequest = Pointer;

  NSBatchDeleteRequestClass = interface(NSPersistentStoreRequestClass)
    ['{E1C6324D-4EF9-487F-BC21-52D4DB4CFF01}']
  end;

  NSBatchDeleteRequest = interface(NSPersistentStoreRequest)
    ['{B552D782-6908-445D-B0C3-30BD5693BBF8}']
    function initWithFetchRequest(fetch: NSFetchRequest)
      : Pointer { instancetype }; cdecl;
    function initWithObjectIDs(objects: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setResultType(ResultType: NSBatchDeleteRequestResultType); cdecl;
    function ResultType: NSBatchDeleteRequestResultType; cdecl;
    function fetchRequest: NSFetchRequest; cdecl;
  end;

  TNSBatchDeleteRequest = class(TOCGenericImport<NSBatchDeleteRequestClass,
    NSBatchDeleteRequest>)
  end;

  PNSBatchDeleteRequest = Pointer;

  NSBatchInsertRequestClass = interface(NSPersistentStoreRequestClass)
    ['{7999C321-485A-46FD-BBDE-78287B63175D}']
    [MethodName('batchInsertRequestWithEntityName:objects:')]
    { class } function batchInsertRequestWithEntityNameObjects
      (entityName: NSString; objects: NSArray): Pointer { instancetype }; cdecl;
    [MethodName('batchInsertRequestWithEntityName:dictionaryHandler:')]
    { class } function batchInsertRequestWithEntityNameDictionaryHandler
      (entityName: NSString; dictionaryHandler: TCoreDataDictionaryHandler)
      : Pointer { instancetype }; cdecl;
    [MethodName('batchInsertRequestWithEntityName:managedObjectHandler:')]
    { class } function batchInsertRequestWithEntityNameManagedObjectHandler
      (entityName: NSString;
      managedObjectHandler: TCoreDataManagedObjectHandler)
      : Pointer { instancetype }; cdecl;
  end;

  NSBatchInsertRequest = interface(NSPersistentStoreRequest)
    ['{21BD447A-F1B9-45B3-B9E8-B05EB020EFCC}']
    function entityName: NSString; cdecl;
    function entity: NSEntityDescription; cdecl;
    procedure setObjectsToInsert(objectsToInsert: NSArray); cdecl;
    function objectsToInsert: NSArray; cdecl;
    procedure setDictionaryHandler(dictionaryHandler
      : TCoreDataDictionaryHandler); cdecl;
    function dictionaryHandler: TCoreDataDictionaryHandler; cdecl;
    procedure setManagedObjectHandler(managedObjectHandler
      : TCoreDataManagedObjectHandler); cdecl;
    function managedObjectHandler: TCoreDataManagedObjectHandler; cdecl;
    procedure setResultType(ResultType: NSBatchInsertRequestResultType); cdecl;
    function ResultType: NSBatchInsertRequestResultType; cdecl;
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithEntityName:objects:')]
    function initWithEntityNameObjects(entityName: NSString; objects: NSArray)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithEntity:objects:')]
    function initWithEntityObjects(entity: NSEntityDescription;
      objects: NSArray): Pointer { instancetype }; cdecl;
    [MethodName('initWithEntity:dictionaryHandler:')]
    function initWithEntityDictionaryHandler(entity: NSEntityDescription;
      dictionaryHandler: TCoreDataDictionaryHandler)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithEntity:managedObjectHandler:')]
    function initWithEntityManagedObjectHandler(entity: NSEntityDescription;
      managedObjectHandler: TCoreDataManagedObjectHandler)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithEntityName:dictionaryHandler:')]
    function initWithEntityNameDictionaryHandler(entityName: NSString;
      dictionaryHandler: TCoreDataDictionaryHandler)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithEntityName:managedObjectHandler:')]
    function initWithEntityNameManagedObjectHandler(entityName: NSString;
      managedObjectHandler: TCoreDataManagedObjectHandler)
      : Pointer { instancetype }; cdecl;
  end;

  TNSBatchInsertRequest = class(TOCGenericImport<NSBatchInsertRequestClass,
    NSBatchInsertRequest>)
  end;

  PNSBatchInsertRequest = Pointer;

  NSMergePolicyClass = interface(NSObjectClass)
    ['{DB024881-7227-4586-B2DD-52B92BCD92C3}']
  end;

  NSMergePolicy = interface(NSObject)
    ['{762646F5-DD9E-411A-B196-A21D728C9689}']
    procedure setErrorMergePolicy(errorMergePolicy: NSMergePolicy); cdecl;
    function errorMergePolicy: NSMergePolicy; cdecl;
    procedure setRollbackMergePolicy(rollbackMergePolicy: NSMergePolicy); cdecl;
    function rollbackMergePolicy: NSMergePolicy; cdecl;
    procedure setOverwriteMergePolicy(overwriteMergePolicy
      : NSMergePolicy); cdecl;
    function overwriteMergePolicy: NSMergePolicy; cdecl;
    procedure setMergeByPropertyObjectTrumpMergePolicy
      (mergeByPropertyObjectTrumpMergePolicy: NSMergePolicy); cdecl;
    function mergeByPropertyObjectTrumpMergePolicy: NSMergePolicy; cdecl;
    procedure setMergeByPropertyStoreTrumpMergePolicy
      (mergeByPropertyStoreTrumpMergePolicy: NSMergePolicy); cdecl;
    function mergeByPropertyStoreTrumpMergePolicy: NSMergePolicy; cdecl;
    function mergeType: NSMergePolicyType; cdecl;
    function initWithMergeType(ty: NSMergePolicyType): Pointer; cdecl;
    function resolveConflicts(list: NSArray; error: NSError): Boolean; cdecl;
    function resolveOptimisticLockingVersionConflicts(list: NSArray;
      error: NSError): Boolean; cdecl;
    function resolveConstraintConflicts(list: NSArray; error: NSError)
      : Boolean; cdecl;
  end;

  TNSMergePolicy = class(TOCGenericImport<NSMergePolicyClass, NSMergePolicy>)
  end;

  PNSMergePolicy = Pointer;

  NSMergeConflictClass = interface(NSObjectClass)
    ['{4F4326C7-5202-41E2-9EB4-875336D576FC}']
  end;

  NSMergeConflict = interface(NSObject)
    ['{EDB32023-056D-49B1-969C-3CB548DDF669}']
    function sourceObject: NSManagedObject; cdecl;
    function objectSnapshot: NSDictionary; cdecl;
    function cachedSnapshot: NSDictionary; cdecl;
    function persistedSnapshot: NSDictionary; cdecl;
    function newVersionNumber: NSUInteger; cdecl;
    function oldVersionNumber: NSUInteger; cdecl;
    function initWithSource(srcObject: NSManagedObject; newVersion: NSUInteger;
      oldVersion: NSUInteger; cachedSnapshot: NSDictionary;
      persistedSnapshot: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  TNSMergeConflict = class(TOCGenericImport<NSMergeConflictClass,
    NSMergeConflict>)
  end;

  PNSMergeConflict = Pointer;

  NSConstraintConflictClass = interface(NSObjectClass)
    ['{D4A02A0A-13A1-4CED-9236-A26679693717}']
  end;

  NSConstraintConflict = interface(NSObject)
    ['{62FA1DAE-922C-4BB0-95F3-7550096CF21A}']
    function constraint: NSArray; cdecl;
    function constraintValues: NSDictionary; cdecl;
    function databaseObject: NSManagedObject; cdecl;
    function databaseSnapshot: NSDictionary; cdecl;
    function conflictingObjects: NSArray; cdecl;
    function conflictingSnapshots: NSArray; cdecl;
    function initWithConstraint(contraint: NSArray;
      databaseObject: NSManagedObject; databaseSnapshot: NSDictionary;
      conflictingObjects: NSArray; conflictingSnapshots: NSArray)
      : Pointer { instancetype }; cdecl;
  end;

  TNSConstraintConflict = class(TOCGenericImport<NSConstraintConflictClass,
    NSConstraintConflict>)
  end;

  PNSConstraintConflict = Pointer;

  NSFetchedResultsControllerClass = interface(NSObjectClass)
    ['{ECD69E3C-1A96-4E37-B134-B33DCF84C722}']
    { class } procedure deleteCacheWithName(name: NSString); cdecl;
  end;

  NSFetchedResultsController = interface(NSObject)
    ['{D920A0CF-A40F-493D-8096-B81B34C47325}']
    function initWithFetchRequest(fetchRequest: NSFetchRequest;
      managedObjectContext: NSManagedObjectContext;
      sectionNameKeyPath: NSString; cacheName: NSString)
      : Pointer { instancetype }; cdecl;
    function performFetch(error: NSError): Boolean; cdecl;
    function fetchRequest: NSFetchRequest; cdecl;
    function managedObjectContext: NSManagedObjectContext; cdecl;
    function sectionNameKeyPath: NSString; cdecl;
    function cacheName: NSString; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function fetchedObjects: NSArray; cdecl;
    function objectAtIndexPath(indexPath: NSIndexPath): ResultType; cdecl;
    function indexPathForObject(&object: ResultType): NSIndexPath; cdecl;
    function sectionIndexTitleForSectionName(sectionName: NSString)
      : NSString; cdecl;
    function sectionIndexTitles: NSArray; cdecl;
    function sections: NSArray; cdecl;
    function sectionForSectionIndexTitle(title: NSString; atIndex: NSInteger)
      : NSInteger; cdecl;
  end;

  TNSFetchedResultsController = class
    (TOCGenericImport<NSFetchedResultsControllerClass,
    NSFetchedResultsController>)
  end;

  PNSFetchedResultsController = Pointer;

  NSPersistentCloudKitContainerOptionsClass = interface(NSObjectClass)
    ['{6E5D3E05-6C1E-4618-9716-2682125C3135}']
  end;

  NSPersistentCloudKitContainerOptions = interface(NSObject)
    ['{7E2B8363-5233-49B4-8372-02F1C9FA782A}']
    function containerIdentifier: NSString; cdecl;
    procedure setDatabaseScope(databaseScope: CKDatabaseScope); cdecl;
    function databaseScope: CKDatabaseScope; cdecl;
    function initWithContainerIdentifier(containerIdentifier: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  TNSPersistentCloudKitContainerOptions = class
    (TOCGenericImport<NSPersistentCloudKitContainerOptionsClass,
    NSPersistentCloudKitContainerOptions>)
  end;

  PNSPersistentCloudKitContainerOptions = Pointer;

  NSPersistentContainerClass = interface(NSObjectClass)
    ['{89E20F0E-F235-4562-8F82-44BC7D58B353}']
    [MethodName('persistentContainerWithName:')]
    { class } function persistentContainerWithName(name: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('persistentContainerWithName:managedObjectModel:')]
    { class } function persistentContainerWithNameManagedObjectModel
      (name: NSString; managedObjectModel: NSManagedObjectModel)
      : Pointer { instancetype }; cdecl;
    { class } function defaultDirectoryURL: NSURL; cdecl;
  end;

  NSPersistentContainer = interface(NSObject)
    ['{A5DDE72D-57EC-4C80-92AC-1EAC8FDE0B71}']
    function name: NSString; cdecl;
    function viewContext: NSManagedObjectContext; cdecl;
    function managedObjectModel: NSManagedObjectModel; cdecl;
    function persistentStoreCoordinator: NSPersistentStoreCoordinator; cdecl;
    procedure setPersistentStoreDescriptions(persistentStoreDescriptions
      : NSArray); cdecl;
    function persistentStoreDescriptions: NSArray; cdecl;
    [MethodName('initWithName:')]
    function initWithName(name: NSString): Pointer { instancetype }; cdecl;
    [MethodName('initWithName:managedObjectModel:')]
    function initWithNameManagedObjectModel(name: NSString;
      managedObjectModel: NSManagedObjectModel)
      : Pointer { instancetype }; cdecl;
    procedure loadPersistentStoresWithCompletionHandler
      (block: TCoreDataCompletionHandler); cdecl;
    function newBackgroundContext: NSManagedObjectContext; cdecl;
    procedure performBackgroundTask(block: TCoreDataBlock1); cdecl;
  end;

  TNSPersistentContainer = class(TOCGenericImport<NSPersistentContainerClass,
    NSPersistentContainer>)
  end;

  PNSPersistentContainer = Pointer;

  NSPersistentHistoryTransactionClass = interface(NSObjectClass)
    ['{2B775A63-1CC2-4BF2-ACF5-AE2080B16245}']
    { class } function entityDescriptionWithContext
      (context: NSManagedObjectContext): NSEntityDescription; cdecl;
  end;

  NSPersistentHistoryTransaction = interface(NSObject)
    ['{4E34A74D-F605-4E44-8851-70DBEE84477E}']
    procedure setEntityDescription(entityDescription
      : NSEntityDescription); cdecl;
    function entityDescription: NSEntityDescription; cdecl;
    procedure setFetchRequest(fetchRequest: NSFetchRequest); cdecl;
    function fetchRequest: NSFetchRequest; cdecl;
    function timestamp: NSDate; cdecl;
    function changes: NSArray; cdecl;
    function transactionNumber: Int64; cdecl;
    function storeID: NSString; cdecl;
    function bundleID: NSString; cdecl;
    function processID: NSString; cdecl;
    function contextName: NSString; cdecl;
    function author: NSString; cdecl;
    function token: NSPersistentHistoryToken; cdecl;
    function objectIDNotification: NSNotification; cdecl;
  end;

  TNSPersistentHistoryTransaction = class
    (TOCGenericImport<NSPersistentHistoryTransactionClass,
    NSPersistentHistoryTransaction>)
  end;

  PNSPersistentHistoryTransaction = Pointer;

  NSPersistentHistoryChangeClass = interface(NSObjectClass)
    ['{C47B8420-41BF-420A-B43B-47548353CA9E}']
    { class } function entityDescriptionWithContext
      (context: NSManagedObjectContext): NSEntityDescription; cdecl;
  end;

  NSPersistentHistoryChange = interface(NSObject)
    ['{AE1822A2-D82B-43A5-AB4F-6863B10D5B52}']
    procedure setEntityDescription(entityDescription
      : NSEntityDescription); cdecl;
    function entityDescription: NSEntityDescription; cdecl;
    procedure setFetchRequest(fetchRequest: NSFetchRequest); cdecl;
    function fetchRequest: NSFetchRequest; cdecl;
    function changeID: Int64; cdecl;
    function changedObjectID: NSManagedObjectID; cdecl;
    function changeType: NSPersistentHistoryChangeType; cdecl;
    function tombstone: NSDictionary; cdecl;
    function transaction: NSPersistentHistoryTransaction; cdecl;
    function updatedProperties: NSSet; cdecl;
  end;

  TNSPersistentHistoryChange = class
    (TOCGenericImport<NSPersistentHistoryChangeClass,
    NSPersistentHistoryChange>)
  end;

  PNSPersistentHistoryChange = Pointer;

  NSPersistentHistoryChangeRequestClass = interface
    (NSPersistentStoreRequestClass)
    ['{833CA4A6-D514-4178-8A8F-92DBD1DCC3CB}']
    { class } function fetchHistoryAfterDate(date: NSDate)
      : Pointer { instancetype }; cdecl;
    { class } function fetchHistoryAfterToken(token: NSPersistentHistoryToken)
      : Pointer { instancetype }; cdecl;
    { class } function fetchHistoryAfterTransaction
      (transaction: NSPersistentHistoryTransaction)
      : Pointer { instancetype }; cdecl;
    { class } function fetchHistoryWithFetchRequest(fetchRequest
      : NSFetchRequest): Pointer { instancetype }; cdecl;
    { class } function deleteHistoryBeforeDate(date: NSDate)
      : Pointer { instancetype }; cdecl;
    { class } function deleteHistoryBeforeToken(token: NSPersistentHistoryToken)
      : Pointer { instancetype }; cdecl;
    { class } function deleteHistoryBeforeTransaction
      (transaction: NSPersistentHistoryTransaction)
      : Pointer { instancetype }; cdecl;
  end;

  NSPersistentHistoryChangeRequest = interface(NSPersistentStoreRequest)
    ['{783CA33A-52C6-440E-932D-5706959980DB}']
    procedure setResultType(ResultType: NSPersistentHistoryResultType); cdecl;
    function ResultType: NSPersistentHistoryResultType; cdecl;
    function token: NSPersistentHistoryToken; cdecl;
    procedure setFetchRequest(fetchRequest: NSFetchRequest); cdecl;
    function fetchRequest: NSFetchRequest; cdecl;
  end;

  TNSPersistentHistoryChangeRequest = class
    (TOCGenericImport<NSPersistentHistoryChangeRequestClass,
    NSPersistentHistoryChangeRequest>)
  end;

  PNSPersistentHistoryChangeRequest = Pointer;

  NSPersistentCloudKitContainerClass = interface(NSPersistentContainerClass)
    ['{D2BCA5EC-E00C-4DD3-A91C-8FDBE1757453}']
  end;

  NSPersistentCloudKitContainer = interface(NSPersistentContainer)
    ['{9ECB4338-13E6-4AD9-BA64-031E0C87B83A}']
    function initializeCloudKitSchemaWithOptions
      (options: NSPersistentCloudKitContainerSchemaInitializationOptions;
      error: NSError): Boolean; cdecl;
    function recordForManagedObjectID(managedObjectID: NSManagedObjectID)
      : CKRecord; cdecl;
    function recordsForManagedObjectIDs(managedObjectIDs: NSArray)
      : NSDictionary; cdecl;
    function recordIDForManagedObjectID(managedObjectID: NSManagedObjectID)
      : CKRecordID; cdecl;
    function recordIDsForManagedObjectIDs(managedObjectIDs: NSArray)
      : NSDictionary; cdecl;
    function canUpdateRecordForManagedObjectWithID(objectID: NSManagedObjectID)
      : Boolean; cdecl;
    function canDeleteRecordForManagedObjectWithID(objectID: NSManagedObjectID)
      : Boolean; cdecl;
    function canModifyManagedObjectsInStore(store: NSPersistentStore)
      : Boolean; cdecl;
    procedure acceptShareInvitationsFromMetadata(metadata: NSArray;
      intoPersistentStore: NSPersistentStore;
      completion: TCoreDataCompletion); cdecl;
    procedure purgeObjectsAndRecordsInZoneWithID(zoneID: CKRecordZoneID;
      inPersistentStore: NSPersistentStore;
      completion: TCoreDataCompletion1); cdecl;
    procedure persistUpdatedShare(share: CKShare;
      inPersistentStore: NSPersistentStore;
      completion: TCoreDataCompletion2); cdecl;
    procedure fetchParticipantsMatchingLookupInfos(lookupInfos: NSArray;
      intoPersistentStore: NSPersistentStore;
      completion: TCoreDataCompletion); cdecl;
    function fetchSharesMatchingObjectIDs(objectIDs: NSArray; error: NSError)
      : NSDictionary; cdecl;
    function fetchSharesInPersistentStore(persistentStore: NSPersistentStore;
      error: NSError): NSArray; cdecl;
    procedure shareManagedObjects(managedObjects: NSArray; toShare: CKShare;
      completion: TCoreDataCompletion3); cdecl;
  end;

  TNSPersistentCloudKitContainer = class
    (TOCGenericImport<NSPersistentCloudKitContainerClass,
    NSPersistentCloudKitContainer>)
  end;

  PNSPersistentCloudKitContainer = Pointer;

  NSPersistentCloudKitContainerEventClass = interface(NSObjectClass)
    ['{74CA0E7D-2CE0-42AE-AFA8-550330A98361}']
  end;

  NSPersistentCloudKitContainerEvent = interface(NSObject)
    ['{4FF65D03-4C00-4263-98D9-A880D7BD71EA}']
    function identifier: NSUUID; cdecl;
    function storeIdentifier: NSString; cdecl;
    function &type: NSPersistentCloudKitContainerEventType; cdecl;
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function succeeded: Boolean; cdecl;
    function error: NSError; cdecl;
  end;

  TNSPersistentCloudKitContainerEvent = class
    (TOCGenericImport<NSPersistentCloudKitContainerEventClass,
    NSPersistentCloudKitContainerEvent>)
  end;

  PNSPersistentCloudKitContainerEvent = Pointer;

  NSPersistentCloudKitContainerEventRequestClass = interface
    (NSPersistentStoreRequestClass)
    ['{865FE141-63CD-45DB-9CAF-1CD3E4F2012F}']
    { class } function fetchEventsAfterDate(date: NSDate)
      : Pointer { instancetype }; cdecl;
    { class } function fetchEventsAfterEvent
      (event: NSPersistentCloudKitContainerEvent)
      : Pointer { instancetype }; cdecl;
    { class } function fetchEventsMatchingFetchRequest
      (fetchRequest: NSFetchRequest): Pointer { instancetype }; cdecl;
    { class } function fetchRequestForEvents: NSFetchRequest; cdecl;
  end;

  NSPersistentCloudKitContainerEventRequest = interface
    (NSPersistentStoreRequest)
    ['{4BC3BE0D-E4D0-4B95-8AD7-E94FD1224E1C}']
    procedure setResultType(ResultType
      : NSPersistentCloudKitContainerEventResultType); cdecl;
    function ResultType: NSPersistentCloudKitContainerEventResultType; cdecl;
  end;

  TNSPersistentCloudKitContainerEventRequest = class
    (TOCGenericImport<NSPersistentCloudKitContainerEventRequestClass,
    NSPersistentCloudKitContainerEventRequest>)
  end;

  PNSPersistentCloudKitContainerEventRequest = Pointer;

  // ===== Protocol declarations =====

  NSFetchRequestResult = interface(IObjectiveC)
    ['{1F8A4818-EBAE-468C-8690-0AC7F56691EB}']
  end;

  NSFetchedResultsControllerDelegate = interface(IObjectiveC)
    ['{C067DDBF-2838-4E78-B124-84D266B68B21}']
    [MethodName('controller:didChangeContentWithSnapshot:')]
    procedure controllerDidChangeContentWithSnapshot
      (controller: NSFetchedResultsController;
      didChangeContentWithSnapshot: NSDiffableDataSourceSnapshot); cdecl;
    [MethodName('controller:didChangeContentWithDifference:')]
    procedure controllerDidChangeContentWithDifference
      (controller: NSFetchedResultsController;
      didChangeContentWithDifference: NSOrderedCollectionDifference); cdecl;
    [MethodName
      ('controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:')]
    procedure controllerDidChangeObjectAtIndexPathForChangeTypeNewIndexPath
      (controller: NSFetchedResultsController; didChangeObject: Pointer;
      atIndexPath: NSIndexPath; forChangeType: NSFetchedResultsChangeType;
      newIndexPath: NSIndexPath); cdecl;
    [MethodName('controller:didChangeSection:atIndex:forChangeType:')]
    procedure controllerDidChangeSectionAtIndexForChangeType
      (controller: NSFetchedResultsController; didChangeSection: Pointer;
      atIndex: NSUInteger; forChangeType: NSFetchedResultsChangeType); cdecl;
    procedure controllerWillChangeContent(controller
      : NSFetchedResultsController); cdecl;
    procedure controllerDidChangeContent(controller
      : NSFetchedResultsController); cdecl;
    [MethodName('controller:sectionIndexTitleForSectionName:')]
    function controllerSectionIndexTitleForSectionName
      (controller: NSFetchedResultsController;
      sectionIndexTitleForSectionName: NSString): NSString; cdecl;
  end;

  NSFetchedResultsSectionInfo = interface(IObjectiveC)
    ['{7C1718EF-4656-4E14-AD16-36B66844386D}']
    function name: NSString; cdecl;
    function indexTitle: NSString; cdecl;
    function numberOfObjects: NSUInteger; cdecl;
    function objects: NSArray; cdecl;
  end;

  // ===== Exported string consts =====

function NSCoreDataVersionNumber: Pointer;
function NSDetailedErrorsKey: NSString;
function NSValidationObjectErrorKey: NSString;
function NSValidationKeyErrorKey: NSString;
function NSValidationPredicateErrorKey: NSString;
function NSValidationValueErrorKey: NSString;
function NSAffectedStoresErrorKey: NSString;
function NSAffectedObjectsErrorKey: NSString;
function NSPersistentStoreSaveConflictsErrorKey: NSString;
function NSSQLiteErrorDomain: NSString;
function NSManagedObjectContextWillSaveNotification: NSString;
function NSManagedObjectContextDidSaveNotification: NSString;
function NSManagedObjectContextObjectsDidChangeNotification: NSString;
function NSManagedObjectContextDidSaveObjectIDsNotification: NSString;
function NSManagedObjectContextDidMergeChangesObjectIDsNotification: NSString;
function NSInsertedObjectsKey: NSString;
function NSUpdatedObjectsKey: NSString;
function NSDeletedObjectsKey: NSString;
function NSRefreshedObjectsKey: NSString;
function NSInvalidatedObjectsKey: NSString;
function NSManagedObjectContextQueryGenerationKey: NSString;
function NSInvalidatedAllObjectsKey: NSString;
function NSInsertedObjectIDsKey: NSString;
function NSUpdatedObjectIDsKey: NSString;
function NSDeletedObjectIDsKey: NSString;
function NSRefreshedObjectIDsKey: NSString;
function NSInvalidatedObjectIDsKey: NSString;
function NSErrorMergePolicy: Pointer;
function NSMergeByPropertyStoreTrumpMergePolicy: Pointer;
function NSMergeByPropertyObjectTrumpMergePolicy: Pointer;
function NSOverwriteMergePolicy: Pointer;
function NSRollbackMergePolicy: Pointer;
function NSSQLiteStoreType: NSString;
function NSXMLStoreType: NSString;
function NSBinaryStoreType: NSString;
function NSInMemoryStoreType: NSString;
function NSStoreTypeKey: NSString;
function NSStoreUUIDKey: NSString;
function NSPersistentStoreCoordinatorStoresWillChangeNotification: NSString;
function NSPersistentStoreCoordinatorStoresDidChangeNotification: NSString;
function NSPersistentStoreCoordinatorWillRemoveStoreNotification: NSString;
function NSAddedPersistentStoresKey: NSString;
function NSRemovedPersistentStoresKey: NSString;
function NSUUIDChangedPersistentStoresKey: NSString;
function NSReadOnlyPersistentStoreOption: NSString;
function NSValidateXMLStoreOption: NSString;
function NSPersistentStoreTimeoutOption: NSString;
function NSSQLitePragmasOption: NSString;
function NSSQLiteAnalyzeOption: NSString;
function NSSQLiteManualVacuumOption: NSString;
function NSIgnorePersistentStoreVersioningOption: NSString;
function NSMigratePersistentStoresAutomaticallyOption: NSString;
function NSInferMappingModelAutomaticallyOption: NSString;
function NSStoreModelVersionHashesKey: NSString;
function NSStoreModelVersionIdentifiersKey: NSString;
function NSPersistentStoreOSCompatibility: NSString;
function NSPersistentStoreConnectionPoolMaxSizeKey: NSString;
function NSCoreDataCoreSpotlightExporter: NSString;
function NSPersistentStoreForceDestroyOption: NSString;
function NSPersistentStoreFileProtectionKey: NSString;
function NSPersistentHistoryTrackingKey: NSString;
function NSBinaryStoreSecureDecodingClasses: NSString;
function NSBinaryStoreInsecureDecodingCompatibilityOption: NSString;
function NSPersistentStoreRemoteChangeNotificationPostOptionKey: NSString;
function NSPersistentStoreRemoteChangeNotification: NSString;
function NSPersistentStoreURLKey: NSString;
function NSPersistentHistoryTokenKey: NSString;
function NSPersistentStoreUbiquitousContentNameKey: NSString;
function NSPersistentStoreUbiquitousContentURLKey: NSString;
function NSPersistentStoreDidImportUbiquitousContentChangesNotification
  : NSString;
function NSPersistentStoreUbiquitousTransitionTypeKey: NSString;
function NSPersistentStoreUbiquitousPeerTokenOption: NSString;
function NSPersistentStoreRemoveUbiquitousMetadataOption: NSString;
function NSPersistentStoreUbiquitousContainerIdentifierKey: NSString;
function NSPersistentStoreRebuildFromUbiquitousContentOption: NSString;
function NSMigrationManagerKey: NSString;
function NSMigrationSourceObjectKey: NSString;
function NSMigrationDestinationObjectKey: NSString;
function NSMigrationEntityMappingKey: NSString;
function NSMigrationPropertyMappingKey: NSString;
function NSMigrationEntityPolicyKey: NSString;
function NSPersistentCloudKitContainerEventChangedNotification: Pointer;
function NSPersistentCloudKitContainerEventUserInfoKey: NSString;
function NSCoreDataCoreSpotlightDelegateIndexDidUpdateNotification: Pointer;


// ===== External functions =====

const
  libCoreData = '/System/Library/Frameworks/CoreData.framework/CoreData';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreDataModule: THandle;

{$ENDIF IOS}

function NSDetailedErrorsKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSDetailedErrorsKey');
end;

function NSValidationObjectErrorKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSValidationObjectErrorKey');
end;

function NSValidationKeyErrorKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSValidationKeyErrorKey');
end;

function NSValidationPredicateErrorKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSValidationPredicateErrorKey');
end;

function NSValidationValueErrorKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSValidationValueErrorKey');
end;

function NSAffectedStoresErrorKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSAffectedStoresErrorKey');
end;

function NSAffectedObjectsErrorKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSAffectedObjectsErrorKey');
end;

function NSPersistentStoreSaveConflictsErrorKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreSaveConflictsErrorKey');
end;

function NSSQLiteErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSSQLiteErrorDomain');
end;

function NSManagedObjectContextWillSaveNotification: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSManagedObjectContextWillSaveNotification');
end;

function NSManagedObjectContextDidSaveNotification: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSManagedObjectContextDidSaveNotification');
end;

function NSManagedObjectContextObjectsDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSManagedObjectContextObjectsDidChangeNotification');
end;

function NSManagedObjectContextDidSaveObjectIDsNotification: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSManagedObjectContextDidSaveObjectIDsNotification');
end;

function NSManagedObjectContextDidMergeChangesObjectIDsNotification: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSManagedObjectContextDidMergeChangesObjectIDsNotification');
end;

function NSInsertedObjectsKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSInsertedObjectsKey');
end;

function NSUpdatedObjectsKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSUpdatedObjectsKey');
end;

function NSDeletedObjectsKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSDeletedObjectsKey');
end;

function NSRefreshedObjectsKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSRefreshedObjectsKey');
end;

function NSInvalidatedObjectsKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSInvalidatedObjectsKey');
end;

function NSManagedObjectContextQueryGenerationKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSManagedObjectContextQueryGenerationKey');
end;

function NSInvalidatedAllObjectsKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSInvalidatedAllObjectsKey');
end;

function NSInsertedObjectIDsKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSInsertedObjectIDsKey');
end;

function NSUpdatedObjectIDsKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSUpdatedObjectIDsKey');
end;

function NSDeletedObjectIDsKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSDeletedObjectIDsKey');
end;

function NSRefreshedObjectIDsKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSRefreshedObjectIDsKey');
end;

function NSInvalidatedObjectIDsKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSInvalidatedObjectIDsKey');
end;

function NSSQLiteStoreType: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSSQLiteStoreType');
end;

function NSXMLStoreType: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSXMLStoreType');
end;

function NSBinaryStoreType: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSBinaryStoreType');
end;

function NSInMemoryStoreType: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSInMemoryStoreType');
end;

function NSStoreTypeKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSStoreTypeKey');
end;

function NSStoreUUIDKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSStoreUUIDKey');
end;

function NSPersistentStoreCoordinatorStoresWillChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreCoordinatorStoresWillChangeNotification');
end;

function NSPersistentStoreCoordinatorStoresDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreCoordinatorStoresDidChangeNotification');
end;

function NSPersistentStoreCoordinatorWillRemoveStoreNotification: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreCoordinatorWillRemoveStoreNotification');
end;

function NSAddedPersistentStoresKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSAddedPersistentStoresKey');
end;

function NSRemovedPersistentStoresKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSRemovedPersistentStoresKey');
end;

function NSUUIDChangedPersistentStoresKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSUUIDChangedPersistentStoresKey');
end;

function NSReadOnlyPersistentStoreOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSReadOnlyPersistentStoreOption');
end;

function NSValidateXMLStoreOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSValidateXMLStoreOption');
end;

function NSPersistentStoreTimeoutOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSPersistentStoreTimeoutOption');
end;

function NSSQLitePragmasOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSSQLitePragmasOption');
end;

function NSSQLiteAnalyzeOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSSQLiteAnalyzeOption');
end;

function NSSQLiteManualVacuumOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSSQLiteManualVacuumOption');
end;

function NSIgnorePersistentStoreVersioningOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSIgnorePersistentStoreVersioningOption');
end;

function NSMigratePersistentStoresAutomaticallyOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSMigratePersistentStoresAutomaticallyOption');
end;

function NSInferMappingModelAutomaticallyOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSInferMappingModelAutomaticallyOption');
end;

function NSStoreModelVersionHashesKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSStoreModelVersionHashesKey');
end;

function NSStoreModelVersionIdentifiersKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSStoreModelVersionIdentifiersKey');
end;

function NSPersistentStoreOSCompatibility: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSPersistentStoreOSCompatibility');
end;

function NSPersistentStoreConnectionPoolMaxSizeKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreConnectionPoolMaxSizeKey');
end;

function NSCoreDataCoreSpotlightExporter: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSCoreDataCoreSpotlightExporter');
end;

function NSPersistentStoreForceDestroyOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreForceDestroyOption');
end;

function NSPersistentStoreFileProtectionKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreFileProtectionKey');
end;

function NSPersistentHistoryTrackingKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSPersistentHistoryTrackingKey');
end;

function NSBinaryStoreSecureDecodingClasses: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSBinaryStoreSecureDecodingClasses');
end;

function NSBinaryStoreInsecureDecodingCompatibilityOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSBinaryStoreInsecureDecodingCompatibilityOption');
end;

function NSPersistentStoreRemoteChangeNotificationPostOptionKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreRemoteChangeNotificationPostOptionKey');
end;

function NSPersistentStoreRemoteChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreRemoteChangeNotification');
end;

function NSPersistentStoreURLKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSPersistentStoreURLKey');
end;

function NSPersistentHistoryTokenKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSPersistentHistoryTokenKey');
end;

function NSPersistentStoreUbiquitousContentNameKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreUbiquitousContentNameKey');
end;

function NSPersistentStoreUbiquitousContentURLKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreUbiquitousContentURLKey');
end;

function NSPersistentStoreDidImportUbiquitousContentChangesNotification
  : NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreDidImportUbiquitousContentChangesNotification');
end;

function NSPersistentStoreUbiquitousTransitionTypeKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreUbiquitousTransitionTypeKey');
end;

function NSPersistentStoreUbiquitousPeerTokenOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreUbiquitousPeerTokenOption');
end;

function NSPersistentStoreRemoveUbiquitousMetadataOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreRemoveUbiquitousMetadataOption');
end;

function NSPersistentStoreUbiquitousContainerIdentifierKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreUbiquitousContainerIdentifierKey');
end;

function NSPersistentStoreRebuildFromUbiquitousContentOption: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentStoreRebuildFromUbiquitousContentOption');
end;

function NSMigrationManagerKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSMigrationManagerKey');
end;

function NSMigrationSourceObjectKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSMigrationSourceObjectKey');
end;

function NSMigrationDestinationObjectKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSMigrationDestinationObjectKey');
end;

function NSMigrationEntityMappingKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSMigrationEntityMappingKey');
end;

function NSMigrationPropertyMappingKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSMigrationPropertyMappingKey');
end;

function NSMigrationEntityPolicyKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSMigrationEntityPolicyKey');
end;

function NSPersistentCloudKitContainerEventUserInfoKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData,
    'NSPersistentCloudKitContainerEventUserInfoKey');
end;

function NSCoreDataVersionNumber: Pointer;
begin
  result := CocoaPointerConst(libCoreData, 'NSCoreDataVersionNumber');
end;

function NSErrorMergePolicy: Pointer;
begin
  result := CocoaPointerConst(libCoreData, 'NSErrorMergePolicy');
end;

function NSMergeByPropertyStoreTrumpMergePolicy: Pointer;
begin
  result := CocoaPointerConst(libCoreData,
    'NSMergeByPropertyStoreTrumpMergePolicy');
end;

function NSMergeByPropertyObjectTrumpMergePolicy: Pointer;
begin
  result := CocoaPointerConst(libCoreData,
    'NSMergeByPropertyObjectTrumpMergePolicy');
end;

function NSOverwriteMergePolicy: Pointer;
begin
  result := CocoaPointerConst(libCoreData, 'NSOverwriteMergePolicy');
end;

function NSRollbackMergePolicy: Pointer;
begin
  result := CocoaPointerConst(libCoreData, 'NSRollbackMergePolicy');
end;

function NSPersistentCloudKitContainerEventChangedNotification: Pointer;
begin
  result := CocoaPointerConst(libCoreData,
    'NSPersistentCloudKitContainerEventChangedNotification');
end;

function NSCoreDataCoreSpotlightDelegateIndexDidUpdateNotification: Pointer;
begin
  result := CocoaPointerConst(libCoreData,
    'NSCoreDataCoreSpotlightDelegateIndexDidUpdateNotification');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreDataModule := dlopen(MarshaledAString(libCoreData), RTLD_LAZY);

finalization

dlclose(CoreDataModule);
{$ENDIF IOS}

end.
