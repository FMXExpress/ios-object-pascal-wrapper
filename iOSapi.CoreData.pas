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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
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
  NSTransformableAttributeType = 1800;
  NSObjectIDAttributeType = 2000;
  NSNoActionDeleteRule = 0;
  NSNullifyDeleteRule = 1;
  NSCascadeDeleteRule = 2;
  NSDenyDeleteRule = 3;
  NSFetchRequestType = 1;
  NSSaveRequestType = 2;
  NSBatchUpdateRequestType = 6;
  NSBatchDeleteRequestType = 7;
  NSManagedObjectResultType = 0;
  NSManagedObjectIDResultType = 1;
  NSDictionaryResultType = 2;
  NSCountResultType = 4;
  NSSnapshotEventUndoInsertion = 1 shl 1;
  NSSnapshotEventUndoDeletion = 1 shl 2;
  NSSnapshotEventUndoUpdate = 1 shl 3;
  NSSnapshotEventRollback = 1 shl 4;
  NSSnapshotEventRefresh = 1 shl 5;
  NSSnapshotEventMergePolicy = 1 shl 6;
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
  NSStatusOnlyResultType = 0;
  NSUpdatedObjectIDsResultType = 1;
  NSUpdatedObjectsCountResultType = 2;
  NSBatchDeleteResultTypeStatusOnly = 0;
  NSBatchDeleteResultTypeObjectIDs = 1;
  NSBatchDeleteResultTypeCount = 2;
  NSErrorMergePolicyType = 0;
  NSMergeByPropertyStoreTrumpMergePolicyType = 1;
  NSMergeByPropertyObjectTrumpMergePolicyType = 2;
  NSOverwriteMergePolicyType = 3;
  NSRollbackMergePolicyType = 4;
  NSFetchedResultsChangeInsert = 1;
  NSFetchedResultsChangeDelete = 2;
  NSFetchedResultsChangeMove = 3;
  NSFetchedResultsChangeUpdate = 4;

type

  // ===== Forward declarations =====
{$M+}
  NSEntityDescription = interface;
  NSPropertyDescription = interface;
  NSAttributeDescription = interface;
  NSManagedObjectModel = interface;
  NSManagedObjectContext = interface;
  NSManagedObject = interface;
  NSRelationshipDescription = interface;
  NSFetchRequest = interface;
  NSFetchedPropertyDescription = interface;
  NSExpressionDescription = interface;
  NSAsynchronousFetchResult = interface;
  NSPersistentStore = interface;
  NSPersistentStoreRequest = interface;
  NSAsynchronousFetchRequest = interface;
  NSFetchRequestExpression = interface;
  NSManagedObjectID = interface;
  NSPersistentStoreResult = interface;
  NSPersistentStoreCoordinator = interface;
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
  NSBatchUpdateResult = interface;
  NSBatchDeleteResult = interface;
  NSSaveChangesRequest = interface;
  NSBatchUpdateRequest = interface;
  NSBatchDeleteRequest = interface;
  NSMergePolicy = interface;
  NSMergeConflict = interface;
  NSConstraintConflict = interface;
  NSFetchedResultsControllerDelegate = interface;
  NSFetchedResultsSectionInfo = interface;
  NSFetchedResultsController = interface;

  // ===== Framework typedefs =====
{$M+}
  NSUInteger = Cardinal;
  NSAttributeType = NSUInteger;
  NSDeleteRule = NSUInteger;
  NSPersistentStoreRequestType = NSUInteger;
  NSPersistentStoreAsynchronousFetchResultCompletionBlock = procedure
    (param1: NSAsynchronousFetchResult) of object;
  NSInteger = Integer;
  NSFetchRequestResultType = NSUInteger;
  NSSnapshotEventType = NSUInteger;
  NSKeyValueSetMutationKind = NSUInteger;
  NSManagedObjectContextConcurrencyType = NSUInteger;
  TCoreDataBlock = procedure() of object;
  NSTimeInterval = Double;
  NSPersistentStoreUbiquitousTransitionType = NSUInteger;
  NSEntityMappingType = NSUInteger;
  NSBatchUpdateRequestResultType = NSUInteger;
  NSBatchDeleteRequestResultType = NSUInteger;
  NSMergePolicyType = NSUInteger;
  NSFetchedResultsChangeType = NSUInteger;
  // ===== Interface declarations =====

  NSEntityDescriptionClass = interface(NSObjectClass)
    ['{66C31E0A-52E6-4CD8-BBFE-2E7AE4B47D06}']
    { class } function entityForName(entityName: NSString;
      inManagedObjectContext: NSManagedObjectContext)
      : NSEntityDescription; cdecl;
    { class } function insertNewObjectForEntityForName(entityName: NSString;
      inManagedObjectContext: NSManagedObjectContext): NSManagedObject; cdecl;
  end;

  NSEntityDescription = interface(NSObject)
    ['{7713597E-1A6B-4D4D-A1CB-3C69163858C6}']
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
    procedure setCompoundIndexes(compoundIndexes: NSArray); cdecl;
    function compoundIndexes: NSArray; cdecl;
    procedure setUniquenessConstraints(uniquenessConstraints: NSArray); cdecl;
    function uniquenessConstraints: NSArray; cdecl;
  end;

  TNSEntityDescription = class(TOCGenericImport<NSEntityDescriptionClass,
    NSEntityDescription>)
  end;

  PNSEntityDescription = Pointer;

  NSPropertyDescriptionClass = interface(NSObjectClass)
    ['{4255B926-C7C5-4F25-A832-99CB23E99932}']
  end;

  NSPropertyDescription = interface(NSObject)
    ['{A58CF929-7FAF-4235-8B5C-147C84DEBA21}']
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
    ['{C5B778E9-0B89-48EE-981E-44A325CBE348}']
  end;

  NSAttributeDescription = interface(NSPropertyDescription)
    ['{0B2A3E42-0941-4F9E-84A8-D36FF0798C2C}']
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
  end;

  TNSAttributeDescription = class(TOCGenericImport<NSAttributeDescriptionClass,
    NSAttributeDescription>)
  end;

  PNSAttributeDescription = Pointer;

  NSManagedObjectModelClass = interface(NSObjectClass)
    ['{EAF8AD7A-202B-4D54-8C07-25EBE0959518}']
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
    ['{FDD5C202-9CAD-4D54-B855-25A47E23B377}']
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
    ['{43DC0C9E-1615-4EE0-B686-5F6B9A4589F4}']
    { class } function new: Pointer { instancetype }; cdecl;
    { class } procedure mergeChangesFromRemoteContextSave(changeNotificationData
      : NSDictionary; intoContexts: NSArray); cdecl;
  end;

  NSManagedObjectContext = interface(NSObject)
    ['{7A93D5E4-785B-449E-B7B6-6CC2023A7BD3}']
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
  end;

  TNSManagedObjectContext = class(TOCGenericImport<NSManagedObjectContextClass,
    NSManagedObjectContext>)
  end;

  PNSManagedObjectContext = Pointer;

  NSManagedObjectClass = interface(NSObjectClass)
    ['{81CF6E3D-278A-49A9-A64A-EBDDB866AC5B}']
    { class } function contextShouldIgnoreUnmodeledPropertyChanges
      : Boolean; cdecl;
  end;

  NSManagedObject = interface(NSObject)
    ['{A30B20D2-3881-4BB9-808F-500551311422}']
    function initWithEntity(entity: NSEntityDescription;
      insertIntoManagedObjectContext: NSManagedObjectContext)
      : NSManagedObject; cdecl;
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
    ['{2943169D-8441-4855-8506-C171611E152F}']
  end;

  NSRelationshipDescription = interface(NSPropertyDescription)
    ['{41D07A0E-F86B-4F06-8C07-0BDF13210A24}']
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

  NSPersistentStoreRequestClass = interface(NSObjectClass)
    ['{90EC8827-D832-4AE2-B15A-7935FF35C5C2}']
  end;

  NSPersistentStoreRequest = interface(NSObject)
    ['{3C32DA5C-FD2F-4445-8E24-681C7C467C98}']
    procedure setAffectedStores(affectedStores: NSArray); cdecl;
    function affectedStores: NSArray; cdecl;
    function requestType: NSPersistentStoreRequestType; cdecl;
  end;

  TNSPersistentStoreRequest = class
    (TOCGenericImport<NSPersistentStoreRequestClass, NSPersistentStoreRequest>)
  end;

  PNSPersistentStoreRequest = Pointer;

  NSFetchRequestClass = interface(NSPersistentStoreRequestClass)
    ['{BAFA7949-43E2-40AB-BE29-B7C641E14D88}']
    { class } function fetchRequestWithEntityName(entityName: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  NSFetchRequest = interface(NSPersistentStoreRequest)
    ['{501AC202-B813-48B1-9925-AB25F48904FB}']
    function init: Pointer { instancetype }; cdecl;
    function initWithEntityName(entityName: NSString)
      : Pointer { instancetype }; cdecl;
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
    procedure setResultType(resultType: NSFetchRequestResultType); cdecl;
    function resultType: NSFetchRequestResultType; cdecl;
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
    ['{D87F37CF-7BDD-49C6-8E07-0D2D9942D825}']
  end;

  NSFetchedPropertyDescription = interface(NSPropertyDescription)
    ['{7A18738A-C1FE-4072-BDB7-103CD03F5F7D}']
    procedure setFetchRequest(fetchRequest: NSFetchRequest); cdecl;
    function fetchRequest: NSFetchRequest; cdecl;
  end;

  TNSFetchedPropertyDescription = class
    (TOCGenericImport<NSFetchedPropertyDescriptionClass,
    NSFetchedPropertyDescription>)
  end;

  PNSFetchedPropertyDescription = Pointer;

  NSExpressionDescriptionClass = interface(NSPropertyDescriptionClass)
    ['{9445C413-06C8-470A-AEAF-FFC04689DB3D}']
  end;

  NSExpressionDescription = interface(NSPropertyDescription)
    ['{637D825B-2B06-49DC-883A-F33B7A3E2430}']
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

  NSPersistentStoreResultClass = interface(NSObjectClass)
    ['{8AD6E690-95DD-4F19-B1D8-B0A9D78C070F}']
  end;

  NSPersistentStoreResult = interface(NSObject)
    ['{729320A3-3E3C-4A70-8CBB-7DF79D149A03}']
  end;

  TNSPersistentStoreResult = class
    (TOCGenericImport<NSPersistentStoreResultClass, NSPersistentStoreResult>)
  end;

  PNSPersistentStoreResult = Pointer;

  NSPersistentStoreAsynchronousResultClass = interface
    (NSPersistentStoreResultClass)
    ['{9C40D69D-4B3C-4D12-8B64-87402F958480}']
  end;

  NSPersistentStoreAsynchronousResult = interface(NSPersistentStoreResult)
    ['{01D007F2-C198-4992-A997-B52740D2E3F5}']
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
    ['{5848E9B1-7EFA-42D7-81DC-72A19FC110E0}']
  end;

  NSAsynchronousFetchResult = interface(NSPersistentStoreAsynchronousResult)
    ['{B512383B-8A9D-4707-8BEA-C271EF692229}']
    function fetchRequest: NSAsynchronousFetchRequest; cdecl;
    function finalResult: NSArray; cdecl;
  end;

  TNSAsynchronousFetchResult = class
    (TOCGenericImport<NSAsynchronousFetchResultClass,
    NSAsynchronousFetchResult>)
  end;

  PNSAsynchronousFetchResult = Pointer;

  NSPersistentStoreClass = interface(NSObjectClass)
    ['{573FD76E-15EB-4AC5-9501-4F2E6B4CC10D}']
    { class } function metadataForPersistentStoreWithURL(url: NSURL;
      error: NSError): NSDictionary; cdecl;
    { class } function setMetadata(metadata: NSDictionary;
      forPersistentStoreWithURL: NSURL; error: NSError): Boolean; cdecl;
    { class } function migrationManagerClass: Pointer; cdecl;
  end;

  NSPersistentStore = interface(NSObject)
    ['{4D2818BC-6586-4838-BADD-2FE325DD15E3}']
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
  end;

  TNSPersistentStore = class(TOCGenericImport<NSPersistentStoreClass,
    NSPersistentStore>)
  end;

  PNSPersistentStore = Pointer;

  NSAsynchronousFetchRequestClass = interface(NSPersistentStoreRequestClass)
    ['{39B5EEEC-F38D-498A-B769-02D6336D93DF}']
  end;

  NSAsynchronousFetchRequest = interface(NSPersistentStoreRequest)
    ['{B8343C0B-7B64-43BE-910E-E05B6B3626A2}']
    function fetchRequest: NSFetchRequest; cdecl;
    function completionBlock
      : NSPersistentStoreAsynchronousFetchResultCompletionBlock; cdecl;
    procedure setEstimatedResultCount(estimatedResultCount: NSInteger); cdecl;
    function estimatedResultCount: NSInteger; cdecl;
    function initWithFetchRequest(request: NSFetchRequest;
      completionBlock: NSPersistentStoreAsynchronousFetchResultCompletionBlock)
      : Pointer { instancetype }; cdecl;
  end;

  TNSAsynchronousFetchRequest = class
    (TOCGenericImport<NSAsynchronousFetchRequestClass,
    NSAsynchronousFetchRequest>)
  end;

  PNSAsynchronousFetchRequest = Pointer;

  NSFetchRequestExpressionClass = interface(NSExpressionClass)
    ['{F2E821D6-E2BF-41C2-A424-370B18861C68}']
    { class } function expressionForFetch(fetch: NSExpression;
      context: NSExpression; countOnly: Boolean): NSExpression; cdecl;
  end;

  NSFetchRequestExpression = interface(NSExpression)
    ['{47983A3A-1EDC-4367-9823-1532DEFFCD5C}']
    function requestExpression: NSExpression; cdecl;
    function contextExpression: NSExpression; cdecl;
    function isCountOnlyRequest: Boolean; cdecl;
  end;

  TNSFetchRequestExpression = class
    (TOCGenericImport<NSFetchRequestExpressionClass, NSFetchRequestExpression>)
  end;

  PNSFetchRequestExpression = Pointer;

  NSManagedObjectIDClass = interface(NSObjectClass)
    ['{E4273F0D-C37A-4E7C-B35E-DAD1BD1A58BB}']
  end;

  NSManagedObjectID = interface(NSObject)
    ['{ADA729CC-327F-4CEE-8E15-37698A73146C}']
    function entity: NSEntityDescription; cdecl;
    function persistentStore: NSPersistentStore; cdecl;
    function isTemporaryID: Boolean; cdecl;
    function URIRepresentation: NSURL; cdecl;
  end;

  TNSManagedObjectID = class(TOCGenericImport<NSManagedObjectIDClass,
    NSManagedObjectID>)
  end;

  PNSManagedObjectID = Pointer;

  NSPersistentStoreCoordinatorClass = interface(NSObjectClass)
    ['{948836B3-73AA-4B96-930E-654806608549}']
    { class } function registeredStoreTypes: NSDictionary; cdecl;
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
    ['{5D6CC609-B2BC-43CA-8D59-73A33E2C7D8D}']
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
    procedure lock; cdecl;
    procedure unlock; cdecl;
    function tryLock: Boolean; cdecl;
  end;

  TNSPersistentStoreCoordinator = class
    (TOCGenericImport<NSPersistentStoreCoordinatorClass,
    NSPersistentStoreCoordinator>)
  end;

  PNSPersistentStoreCoordinator = Pointer;

  NSAtomicStoreCacheNodeClass = interface(NSObjectClass)
    ['{339AB7D2-C56F-4CBC-BF0D-2C77108793FA}']
  end;

  NSAtomicStoreCacheNode = interface(NSObject)
    ['{973BBBDA-565B-452B-BBFA-D716B45CCE8D}']
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
    ['{E1AC0498-AD5E-4D25-AC0F-D6DBA168D780}']
  end;

  NSAtomicStore = interface(NSPersistentStore)
    ['{61B963A4-D9DD-4E1A-B90E-E6338AE30CE2}']
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
    ['{4EF711C2-9335-463D-8DF1-608A29D48C6E}']
  end;

  NSEntityMapping = interface(NSObject)
    ['{45DD05B5-3BC4-4E2F-B378-DF9390172B08}']
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
    ['{49ACEB9D-D0C4-4605-BA8A-966F10DBBE6D}']
  end;

  NSMigrationManager = interface(NSObject)
    ['{C85FE5A7-A19E-4860-B5B3-364E68B57AF3}']
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
    ['{CCE36B86-A4E5-4C49-82CF-1F1F2829CFCF}']
  end;

  NSEntityMigrationPolicy = interface(NSObject)
    ['{C041E5F8-EE68-409F-A13F-11899AFF9AB8}']
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
    ['{90FFE31D-CAD9-40C5-9427-BC4F1632E19F}']
    { class } function mappingModelFromBundles(bundles: NSArray;
      forSourceModel: NSManagedObjectModel;
      destinationModel: NSManagedObjectModel): NSMappingModel; cdecl;
    { class } function inferredMappingModelForSourceModel
      (sourceModel: NSManagedObjectModel;
      destinationModel: NSManagedObjectModel; error: NSError)
      : NSMappingModel; cdecl;
  end;

  NSMappingModel = interface(NSObject)
    ['{90D3B804-FA2C-4FDD-A1DB-EAE10F673678}']
    function initWithContentsOfURL(url: NSURL): Pointer { instancetype }; cdecl;
    procedure setEntityMappings(entityMappings: NSArray); cdecl;
    function entityMappings: NSArray; cdecl;
    function entityMappingsByName: NSDictionary; cdecl;
  end;

  TNSMappingModel = class(TOCGenericImport<NSMappingModelClass, NSMappingModel>)
  end;

  PNSMappingModel = Pointer;

  NSPropertyMappingClass = interface(NSObjectClass)
    ['{B68A1652-8A4D-4442-A632-1B3C5C1BF7F7}']
  end;

  NSPropertyMapping = interface(NSObject)
    ['{86C6EC18-B1B0-4532-B628-66537B9A95BC}']
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
    ['{83365DFE-EBFC-414F-8DF4-AE58EEFA38DA}']
  end;

  NSIncrementalStoreNode = interface(NSObject)
    ['{7118FA54-3480-4A00-A286-D9C4E1BB4550}']
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
    ['{34CB9841-43B6-4A06-A30F-BB90E5B79F2E}']
    { class } function identifierForNewStoreAtURL(storeURL: NSURL)
      : Pointer; cdecl;
  end;

  NSIncrementalStore = interface(NSPersistentStore)
    ['{FE142355-F7A2-430A-885A-B04285F34084}']
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

  NSBatchUpdateResultClass = interface(NSPersistentStoreResultClass)
    ['{99AF0C5B-88F1-4C99-81CE-44F954BA2ABE}']
  end;

  NSBatchUpdateResult = interface(NSPersistentStoreResult)
    ['{63C80729-D5E8-433D-9747-A02FA7EA2C02}']
    function result: Pointer; cdecl;
    function resultType: NSBatchUpdateRequestResultType; cdecl;
  end;

  TNSBatchUpdateResult = class(TOCGenericImport<NSBatchUpdateResultClass,
    NSBatchUpdateResult>)
  end;

  PNSBatchUpdateResult = Pointer;

  NSBatchDeleteResultClass = interface(NSPersistentStoreResultClass)
    ['{97CB883D-242F-45E2-8A25-685F61998D4D}']
  end;

  NSBatchDeleteResult = interface(NSPersistentStoreResult)
    ['{C3F03BB0-E8BD-4D0A-B570-424B968F73AE}']
    function result: Pointer; cdecl;
    function resultType: NSBatchDeleteRequestResultType; cdecl;
  end;

  TNSBatchDeleteResult = class(TOCGenericImport<NSBatchDeleteResultClass,
    NSBatchDeleteResult>)
  end;

  PNSBatchDeleteResult = Pointer;

  NSSaveChangesRequestClass = interface(NSPersistentStoreRequestClass)
    ['{CE8A9AD5-AC68-4558-8882-B9BDE75EC640}']
  end;

  NSSaveChangesRequest = interface(NSPersistentStoreRequest)
    ['{7E36319E-CEC3-4F67-BC2F-790620E80D01}']
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
    ['{015E79EE-7027-4874-8395-3267CAB1B9BA}']
    { class } function batchUpdateRequestWithEntityName(entityName: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  NSBatchUpdateRequest = interface(NSPersistentStoreRequest)
    ['{11BCDCCD-50D4-4798-A806-DC45D21FC4A8}']
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
    procedure setResultType(resultType: NSBatchUpdateRequestResultType); cdecl;
    function resultType: NSBatchUpdateRequestResultType; cdecl;
    procedure setPropertiesToUpdate(propertiesToUpdate: NSDictionary); cdecl;
    function propertiesToUpdate: NSDictionary; cdecl;
  end;

  TNSBatchUpdateRequest = class(TOCGenericImport<NSBatchUpdateRequestClass,
    NSBatchUpdateRequest>)
  end;

  PNSBatchUpdateRequest = Pointer;

  NSBatchDeleteRequestClass = interface(NSPersistentStoreRequestClass)
    ['{3B044143-147B-4572-BB30-ED65BFA2AF4D}']
  end;

  NSBatchDeleteRequest = interface(NSPersistentStoreRequest)
    ['{B134887F-0003-4D11-B6CE-C1B9C4C9E434}']
    function initWithFetchRequest(fetch: NSFetchRequest)
      : Pointer { instancetype }; cdecl;
    function initWithObjectIDs(objects: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setResultType(resultType: NSBatchDeleteRequestResultType); cdecl;
    function resultType: NSBatchDeleteRequestResultType; cdecl;
    function fetchRequest: NSFetchRequest; cdecl;
  end;

  TNSBatchDeleteRequest = class(TOCGenericImport<NSBatchDeleteRequestClass,
    NSBatchDeleteRequest>)
  end;

  PNSBatchDeleteRequest = Pointer;

  NSMergePolicyClass = interface(NSObjectClass)
    ['{4777E5E2-140C-42CE-9AD6-5B6AA715F973}']
  end;

  NSMergePolicy = interface(NSObject)
    ['{06430F7D-80FD-4C5F-8C7C-522DD39822BB}']
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
    ['{5D91B8A0-CD75-4914-899F-66F89E05F6C2}']
  end;

  NSMergeConflict = interface(NSObject)
    ['{2E032FA8-AF18-4576-A081-E2C103F1734D}']
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
    ['{5D2C380D-C553-4863-8847-9C1C4282AFF8}']
  end;

  NSConstraintConflict = interface(NSObject)
    ['{33D713D6-D292-4E9F-AD36-443B40CEFC2A}']
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
    ['{EC0A4EC5-629D-4F95-A2FF-9671740E7105}']
    { class } procedure deleteCacheWithName(name: NSString); cdecl;
  end;

  NSFetchedResultsController = interface(NSObject)
    ['{DCD27596-4C4B-4655-845B-D05F755CA3D4}']
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
    function objectAtIndexPath(indexPath: NSIndexPath): Pointer; cdecl;
    function indexPathForObject(&object: Pointer): NSIndexPath; cdecl;
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

  // ===== Protocol declarations =====

  NSFetchedResultsControllerDelegate = interface(IObjectiveC)
    ['{627B4CDE-5876-4FA0-92D8-126D1D46EB6D}']
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
    ['{A18C27F8-67EA-469E-AC73-ADC58560C1F5}']
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
function NSInsertedObjectsKey: NSString;
function NSUpdatedObjectsKey: NSString;
function NSDeletedObjectsKey: NSString;
function NSRefreshedObjectsKey: NSString;
function NSInvalidatedObjectsKey: NSString;
function NSInvalidatedAllObjectsKey: NSString;
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
function NSPersistentStoreUbiquitousContentNameKey: NSString;
function NSPersistentStoreUbiquitousContentURLKey: NSString;
function NSPersistentStoreDidImportUbiquitousContentChangesNotification
  : NSString;
function NSPersistentStoreUbiquitousTransitionTypeKey: NSString;
function NSPersistentStoreUbiquitousPeerTokenOption: NSString;
function NSPersistentStoreRemoveUbiquitousMetadataOption: NSString;
function NSPersistentStoreUbiquitousContainerIdentifierKey: NSString;
function NSPersistentStoreRebuildFromUbiquitousContentOption: NSString;
function NSPersistentStoreForceDestroyOption: NSString;
function NSPersistentStoreFileProtectionKey: NSString;
function NSMigrationManagerKey: NSString;
function NSMigrationSourceObjectKey: NSString;
function NSMigrationDestinationObjectKey: NSString;
function NSMigrationEntityMappingKey: NSString;
function NSMigrationPropertyMappingKey: NSString;
function NSMigrationEntityPolicyKey: NSString;


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

function NSInvalidatedAllObjectsKey: NSString;
begin
  result := CocoaNSStringConst(libCoreData, 'NSInvalidatedAllObjectsKey');
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

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreDataModule := dlopen(MarshaledAString(libCoreData), RTLD_LAZY);

finalization

dlclose(CoreDataModule);
{$ENDIF IOS}

end.
