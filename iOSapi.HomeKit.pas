{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework HomeKit
//

unit iOSapi.HomeKit;

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
  HMCharacteristicValueDoorStateOpen = 0;
  HMCharacteristicValueDoorStateClosed = 1;
  HMCharacteristicValueDoorStateOpening = 2;
  HMCharacteristicValueDoorStateClosing = 3;
  HMCharacteristicValueDoorStateStopped = 4;
  HMCharacteristicValueHeatingCoolingOff = 0;
  HMCharacteristicValueHeatingCoolingHeat = 1;
  HMCharacteristicValueHeatingCoolingCool = 2;
  HMCharacteristicValueHeatingCoolingAuto = 3;
  HMCharacteristicValueRotationDirectionClockwise = 0;
  HMCharacteristicValueRotationDirectionCounterClockwise = 1;
  HMCharacteristicValueTemperatureUnitCelsius = 0;
  HMCharacteristicValueTemperatureUnitFahrenheit = 1;
  HMCharacteristicValueLockMechanismStateUnsecured = 0;
  HMCharacteristicValueLockMechanismStateSecured = 1;
  HMCharacteristicValueLockMechanismStateJammed = 2;
  HMCharacteristicValueLockMechanismStateUnknown = 3;
  HMCharacteristicValueLockMechanismLastKnownActionSecuredUsingPhysicalMovementInterior =
    0;
  HMCharacteristicValueLockMechanismLastKnownActionUnsecuredUsingPhysicalMovementInterior =
    1;
  HMCharacteristicValueLockMechanismLastKnownActionSecuredUsingPhysicalMovementExterior =
    2;
  HMCharacteristicValueLockMechanismLastKnownActionUnsecuredUsingPhysicalMovementExterior =
    3;
  HMCharacteristicValueLockMechanismLastKnownActionSecuredWithKeypad = 4;
  HMCharacteristicValueLockMechanismLastKnownActionUnsecuredWithKeypad = 5;
  HMCharacteristicValueLockMechanismLastKnownActionSecuredRemotely = 6;
  HMCharacteristicValueLockMechanismLastKnownActionUnsecuredRemotely = 7;
  HMCharacteristicValueLockMechanismLastKnownActionSecuredWithAutomaticSecureTimeout =
    8;
  HMCharacteristicValueLockMechanismLastKnownActionSecuredUsingPhysicalMovement =
    9;
  HMCharacteristicValueLockMechanismLastKnownActionUnsecuredUsingPhysicalMovement =
    10;
  HMCharacteristicValueAirParticulateSize2_5 = 0;
  HMCharacteristicValueAirParticulateSize10 = 1;
  HMCharacteristicValueAirQualityUnknown = 0;
  HMCharacteristicValueAirQualityExcellent = 1;
  HMCharacteristicValueAirQualityGood = 2;
  HMCharacteristicValueAirQualityFair = 3;
  HMCharacteristicValueAirQualityInferior = 4;
  HMCharacteristicValueAirQualityPoor = 5;
  HMCharacteristicValuePositionStateClosing = 0;
  HMCharacteristicValuePositionStateOpening = 1;
  HMCharacteristicValuePositionStateStopped = 2;
  HMCharacteristicValueCurrentSecuritySystemStateStayArm = 0;
  HMCharacteristicValueCurrentSecuritySystemStateAwayArm = 1;
  HMCharacteristicValueCurrentSecuritySystemStateNightArm = 2;
  HMCharacteristicValueCurrentSecuritySystemStateDisarmed = 3;
  HMCharacteristicValueCurrentSecuritySystemStateTriggered = 4;
  HMCharacteristicValueTargetSecuritySystemStateStayArm = 0;
  HMCharacteristicValueTargetSecuritySystemStateAwayArm = 1;
  HMCharacteristicValueTargetSecuritySystemStateNightArm = 2;
  HMCharacteristicValueTargetSecuritySystemStateDisarm = 3;
  HMErrorCodeAlreadyExists = 1;
  HMErrorCodeNotFound = 2;
  HMErrorCodeInvalidParameter = 3;
  HMErrorCodeAccessoryNotReachable = 4;
  HMErrorCodeReadOnlyCharacteristic = 5;
  HMErrorCodeWriteOnlyCharacteristic = 6;
  HMErrorCodeNotificationNotSupported = 7;
  HMErrorCodeOperationTimedOut = 8;
  HMErrorCodeAccessoryPoweredOff = 9;
  HMErrorCodeAccessDenied = 10;
  HMErrorCodeObjectAssociatedToAnotherHome = 11;
  HMErrorCodeObjectNotAssociatedToAnyHome = 12;
  HMErrorCodeObjectAlreadyAssociatedToHome = 13;
  HMErrorCodeAccessoryIsBusy = 14;
  HMErrorCodeOperationInProgress = 15;
  HMErrorCodeAccessoryOutOfResources = 16;
  HMErrorCodeInsufficientPrivileges = 17;
  HMErrorCodeAccessoryPairingFailed = 18;
  HMErrorCodeInvalidDataFormatSpecified = 19;
  HMErrorCodeNilParameter = 20;
  HMErrorCodeUnconfiguredParameter = 21;
  HMErrorCodeInvalidClass = 22;
  HMErrorCodeOperationCancelled = 23;
  HMErrorCodeRoomForHomeCannotBeInZone = 24;
  HMErrorCodeNoActionsInActionSet = 25;
  HMErrorCodeNoRegisteredActionSets = 26;
  HMErrorCodeMissingParameter = 27;
  HMErrorCodeFireDateInPast = 28;
  HMErrorCodeRoomForHomeCannotBeUpdated = 29;
  HMErrorCodeActionInAnotherActionSet = 30;
  HMErrorCodeObjectWithSimilarNameExistsInHome = 31;
  HMErrorCodeHomeWithSimilarNameExists = 32;
  HMErrorCodeRenameWithSimilarName = 33;
  HMErrorCodeCannotRemoveNonBridgeAccessory = 34;
  HMErrorCodeNameContainsProhibitedCharacters = 35;
  HMErrorCodeNameDoesNotStartWithValidCharacters = 36;
  HMErrorCodeUserIDNotEmailAddress = 37;
  HMErrorCodeUserDeclinedAddingUser = 38;
  HMErrorCodeUserDeclinedRemovingUser = 39;
  HMErrorCodeUserDeclinedInvite = 40;
  HMErrorCodeUserManagementFailed = 41;
  HMErrorCodeRecurrenceTooSmall = 42;
  HMErrorCodeInvalidValueType = 43;
  HMErrorCodeValueLowerThanMinimum = 44;
  HMErrorCodeValueHigherThanMaximum = 45;
  HMErrorCodeStringLongerThanMaximum = 46;
  HMErrorCodeHomeAccessNotAuthorized = 47;
  HMErrorCodeOperationNotSupported = 48;
  HMErrorCodeMaximumObjectLimitReached = 49;
  HMErrorCodeAccessorySentInvalidResponse = 50;
  HMErrorCodeStringShorterThanMinimum = 51;
  HMErrorCodeGenericError = 52;
  HMErrorCodeSecurityFailure = 53;
  HMErrorCodeCommunicationFailure = 54;
  HMErrorCodeMessageAuthenticationFailed = 55;
  HMErrorCodeInvalidMessageSize = 56;
  HMErrorCodeAccessoryDiscoveryFailed = 57;
  HMErrorCodeClientRequestError = 58;
  HMErrorCodeAccessoryResponseError = 59;
  HMErrorCodeNameDoesNotEndWithValidCharacters = 60;
  HMErrorCodeAccessoryIsBlocked = 61;
  HMErrorCodeInvalidAssociatedServiceType = 62;
  HMErrorCodeActionSetExecutionFailed = 63;
  HMErrorCodeActionSetExecutionPartialSuccess = 64;
  HMErrorCodeActionSetExecutionInProgress = 65;
  HMErrorCodeAccessoryOutOfCompliance = 66;
  HMErrorCodeDataResetFailure = 67;
  HMErrorCodeNotificationAlreadyEnabled = 68;
  HMErrorCodeRecurrenceMustBeOnSpecifiedBoundaries = 69;
  HMErrorCodeDateMustBeOnSpecifiedBoundaries = 70;
  HMErrorCodeCannotActivateTriggerTooFarInFuture = 71;
  HMErrorCodeRecurrenceTooLarge = 72;
  HMErrorCodeReadWritePartialSuccess = 73;
  HMErrorCodeReadWriteFailure = 74;
  HMErrorCodeNotSignedIntoiCloud = 75;
  HMErrorCodeKeychainSyncNotEnabled = 76;
  HMErrorCodeCloudDataSyncInProgress = 77;
  HMErrorCodeNetworkUnavailable = 78;
  HMErrorCodeAddAccessoryFailed = 79;
  HMErrorCodeMissingEntitlement = 80;
  HMErrorCodeCannotUnblockNonBridgeAccessory = 81;
  HMErrorCodeDeviceLocked = 82;
  HMErrorCodeCannotRemoveBuiltinActionSet = 83;
  HMErrorCodeLocationForHomeDisabled = 84;
  HMErrorCodeNotAuthorizedForLocationServices = 85;
  HMErrorCodeReferToUserManual = 86;

type

  // ===== Forward declarations =====
{$M+}
  HMHome = interface;
  HMRoom = interface;
  HMService = interface;
  HMCharacteristic = interface;
  HMAccessoryCategory = interface;
  HMAccessoryDelegate = interface;
  HMAccessory = interface;
  HMAccessoryBrowserDelegate = interface;
  HMAccessoryBrowser = interface;
  HMAction = interface;
  HMActionSet = interface;
  HMCharacteristicMetadata = interface;
  HMEvent = interface;
  HMCharacteristicEvent = interface;
  HMCharacteristicWriteAction = interface;
  HMTrigger = interface;
  HMEventTrigger = interface;
  HMHomeManager = interface;
  HMZone = interface;
  HMServiceGroup = interface;
  HMUser = interface;
  HMHomeAccessControl = interface;
  HMHomeDelegate = interface;
  HMHomeManagerDelegate = interface;
  HMLocationEvent = interface;
  HMTimerTrigger = interface;

  // ===== Framework typedefs =====
{$M+}
  THomeKitCompletionHandler = procedure(param1: NSError) of object;
  NSInteger = Integer;
  HMCharacteristicValueDoorState = NSInteger;
  HMCharacteristicValueHeatingCooling = NSInteger;
  HMCharacteristicValueRotationDirection = NSInteger;
  HMCharacteristicValueTemperatureUnit = NSInteger;
  HMCharacteristicValueLockMechanismState = NSInteger;
  HMCharacteristicValueLockMechanismLastKnownAction = NSInteger;
  HMCharacteristicValueAirParticulateSize = NSInteger;
  HMCharacteristicValueAirQuality = NSInteger;
  HMCharacteristicValuePositionState = NSInteger;
  HMCharacteristicValueCurrentSecuritySystemState = NSInteger;
  HMCharacteristicValueTargetSecuritySystemState = NSInteger;
  TriggerValueType = Pointer;
  TargetValueType = Pointer;
  HMErrorCode = NSInteger;
  NSUInteger = Cardinal;
  NSPredicateOperatorType = NSUInteger;
  THomeKitCompletion = procedure(param1: HMUser; param2: NSError) of object;
  THomeKitCompletionHandler1 = procedure(param1: HMRoom; param2: NSError)
    of object;
  THomeKitCompletionHandler2 = procedure(param1: HMZone; param2: NSError)
    of object;
  THomeKitCompletionHandler3 = procedure(param1: HMServiceGroup;
    param2: NSError) of object;
  THomeKitCompletionHandler4 = procedure(param1: HMActionSet; param2: NSError)
    of object;
  THomeKitCompletionHandler5 = procedure(param1: HMHome; param2: NSError)
    of object;
  // ===== Interface declarations =====

  HMHomeClass = interface(NSObjectClass)
    ['{6DC0C52F-4394-43D8-B351-176FBCBBEF91}']
  end;

  HMHome = interface(NSObject)
    ['{BBBFF552-BDF4-4654-B28C-34AF1B730D3D}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function name: NSString; cdecl;
    function isPrimary: Boolean; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
    procedure updateName(name: NSString;
      completionHandler: THomeKitCompletionHandler); cdecl;
    function accessories: NSArray; cdecl;
    procedure addAccessory(accessory: HMAccessory;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure removeAccessory(accessory: HMAccessory;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure assignAccessory(accessory: HMAccessory; toRoom: HMRoom;
      completionHandler: THomeKitCompletionHandler); cdecl;
    function servicesWithTypes(serviceTypes: NSArray): NSArray; cdecl;
    procedure unblockAccessory(accessory: HMAccessory;
      completionHandler: THomeKitCompletionHandler); cdecl;
    function currentUser: HMUser; cdecl;
    function users: NSArray; cdecl;
    procedure manageUsersWithCompletionHandler
      (completion: THomeKitCompletionHandler); cdecl;
    procedure addUserWithCompletionHandler(completion
      : THomeKitCompletion); cdecl;
    procedure removeUser(user: HMUser;
      completionHandler: THomeKitCompletionHandler); cdecl;
    function homeAccessControlForUser(user: HMUser): HMHomeAccessControl; cdecl;
    function rooms: NSArray; cdecl;
    procedure addRoomWithName(roomName: NSString;
      completionHandler: THomeKitCompletionHandler1); cdecl;
    procedure removeRoom(room: HMRoom;
      completionHandler: THomeKitCompletionHandler); cdecl;
    function roomForEntireHome: HMRoom; cdecl;
    function zones: NSArray; cdecl;
    procedure addZoneWithName(zoneName: NSString;
      completionHandler: THomeKitCompletionHandler2); cdecl;
    procedure removeZone(zone: HMZone;
      completionHandler: THomeKitCompletionHandler); cdecl;
    function serviceGroups: NSArray; cdecl;
    procedure addServiceGroupWithName(serviceGroupName: NSString;
      completionHandler: THomeKitCompletionHandler3); cdecl;
    procedure removeServiceGroup(group: HMServiceGroup;
      completionHandler: THomeKitCompletionHandler); cdecl;
    function actionSets: NSArray; cdecl;
    procedure addActionSetWithName(actionSetName: NSString;
      completionHandler: THomeKitCompletionHandler4); cdecl;
    procedure removeActionSet(actionSet: HMActionSet;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure executeActionSet(actionSet: HMActionSet;
      completionHandler: THomeKitCompletionHandler); cdecl;
    function builtinActionSetOfType(actionSetType: NSString)
      : HMActionSet; cdecl;
    function triggers: NSArray; cdecl;
    procedure addTrigger(trigger: HMTrigger;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure removeTrigger(trigger: HMTrigger;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMHome = class(TOCGenericImport<HMHomeClass, HMHome>)
  end;

  PHMHome = Pointer;

  HMRoomClass = interface(NSObjectClass)
    ['{120BD9C7-D16E-4197-BEE3-B8A8EE16535B}']
  end;

  HMRoom = interface(NSObject)
    ['{5CBAE95B-703E-448E-8E43-0BC429E2D9AF}']
    function name: NSString; cdecl;
    function accessories: NSArray; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
    procedure updateName(name: NSString;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMRoom = class(TOCGenericImport<HMRoomClass, HMRoom>)
  end;

  PHMRoom = Pointer;

  HMServiceClass = interface(NSObjectClass)
    ['{85A7919F-C7C6-4E24-9473-9C960C269D68}']
  end;

  HMService = interface(NSObject)
    ['{0A000AEB-F1A5-46F8-A1C7-BDB93417E47C}']
    function accessory: HMAccessory; cdecl;
    function serviceType: NSString; cdecl;
    function localizedDescription: NSString; cdecl;
    function name: NSString; cdecl;
    function associatedServiceType: NSString; cdecl;
    function characteristics: NSArray; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
    function isUserInteractive: Boolean; cdecl;
    procedure updateName(name: NSString;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure updateAssociatedServiceType(serviceType: NSString;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMService = class(TOCGenericImport<HMServiceClass, HMService>)
  end;

  PHMService = Pointer;

  HMCharacteristicClass = interface(NSObjectClass)
    ['{ED688B70-4BA8-41B6-822D-A1978790AA81}']
  end;

  HMCharacteristic = interface(NSObject)
    ['{8D6F15CD-5E59-4917-A254-71F0D4E6306A}']
    function characteristicType: NSString; cdecl;
    function localizedDescription: NSString; cdecl;
    function service: HMService; cdecl;
    function properties: NSArray; cdecl;
    function metadata: HMCharacteristicMetadata; cdecl;
    function value: Pointer; cdecl;
    function isNotificationEnabled: Boolean; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
    procedure writeValue(value: Pointer;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure readValueWithCompletionHandler(completion
      : THomeKitCompletionHandler); cdecl;
    procedure enableNotification(enable: Boolean;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure updateAuthorizationData(data: NSData;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMCharacteristic = class(TOCGenericImport<HMCharacteristicClass,
    HMCharacteristic>)
  end;

  PHMCharacteristic = Pointer;

  HMAccessoryCategoryClass = interface(NSObjectClass)
    ['{3D01039B-D09F-49BF-A290-345C370EC66B}']
  end;

  HMAccessoryCategory = interface(NSObject)
    ['{B324CCC9-53D0-4060-917A-78DB130076FA}']
    function categoryType: NSString; cdecl;
    function localizedDescription: NSString; cdecl;
  end;

  THMAccessoryCategory = class(TOCGenericImport<HMAccessoryCategoryClass,
    HMAccessoryCategory>)
  end;

  PHMAccessoryCategory = Pointer;

  HMAccessoryClass = interface(NSObjectClass)
    ['{F2747BC0-BD5A-41EC-93E6-5655E3D14F31}']
  end;

  HMAccessory = interface(NSObject)
    ['{18A0D982-B556-4772-AC95-FF6246F4802E}']
    function name: NSString; cdecl;
    function identifier: NSUUID; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function isReachable: Boolean; cdecl;
    function isBridged: Boolean; cdecl;
    function identifiersForBridgedAccessories: NSArray; cdecl;
    function uniqueIdentifiersForBridgedAccessories: NSArray; cdecl;
    function category: HMAccessoryCategory; cdecl;
    function room: HMRoom; cdecl;
    function services: NSArray; cdecl;
    function isBlocked: Boolean; cdecl;
    procedure updateName(name: NSString;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure identifyWithCompletionHandler(completion
      : THomeKitCompletionHandler); cdecl;
  end;

  THMAccessory = class(TOCGenericImport<HMAccessoryClass, HMAccessory>)
  end;

  PHMAccessory = Pointer;

  HMAccessoryBrowserClass = interface(NSObjectClass)
    ['{CD44126D-CECC-4355-BC3D-F34AA4E6F95D}']
  end;

  HMAccessoryBrowser = interface(NSObject)
    ['{9D76D07A-FC40-444A-AF17-63F01BA44EE5}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function discoveredAccessories: NSArray; cdecl;
    procedure startSearchingForNewAccessories; cdecl;
    procedure stopSearchingForNewAccessories; cdecl;
  end;

  THMAccessoryBrowser = class(TOCGenericImport<HMAccessoryBrowserClass,
    HMAccessoryBrowser>)
  end;

  PHMAccessoryBrowser = Pointer;

  HMActionClass = interface(NSObjectClass)
    ['{3BD86EDC-1804-4B26-9332-728C4C5083FF}']
  end;

  HMAction = interface(NSObject)
    ['{68CE32B4-6875-44CB-ABCF-EA854B8ADCFF}']
    function uniqueIdentifier: NSUUID; cdecl;
  end;

  THMAction = class(TOCGenericImport<HMActionClass, HMAction>)
  end;

  PHMAction = Pointer;

  HMActionSetClass = interface(NSObjectClass)
    ['{282A6A92-03AC-498E-9B1F-9826C626CAC5}']
  end;

  HMActionSet = interface(NSObject)
    ['{1E6E73A2-600F-48CB-A4A4-4895397336E6}']
    function name: NSString; cdecl;
    function actions: NSSet; cdecl;
    function isExecuting: Boolean; cdecl;
    function actionSetType: NSString; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
    procedure updateName(name: NSString;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure addAction(action: HMAction;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure removeAction(action: HMAction;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMActionSet = class(TOCGenericImport<HMActionSetClass, HMActionSet>)
  end;

  PHMActionSet = Pointer;

  HMCharacteristicMetadataClass = interface(NSObjectClass)
    ['{EE4659B2-E87E-491B-8A60-B2A99F5FCE2A}']
  end;

  HMCharacteristicMetadata = interface(NSObject)
    ['{C9350319-04DC-433B-8F41-C0198A83351F}']
    function minimumValue: NSNumber; cdecl;
    function maximumValue: NSNumber; cdecl;
    function stepValue: NSNumber; cdecl;
    function maxLength: NSNumber; cdecl;
    function format: NSString; cdecl;
    function units: NSString; cdecl;
    function manufacturerDescription: NSString; cdecl;
  end;

  THMCharacteristicMetadata = class
    (TOCGenericImport<HMCharacteristicMetadataClass, HMCharacteristicMetadata>)
  end;

  PHMCharacteristicMetadata = Pointer;

  HMEventClass = interface(NSObjectClass)
    ['{6AB573BC-017D-4DF1-9A6E-9EE95158E52D}']
  end;

  HMEvent = interface(NSObject)
    ['{59A74BDB-923F-4892-AE7D-6309D3D4316C}']
    function uniqueIdentifier: NSUUID; cdecl;
  end;

  THMEvent = class(TOCGenericImport<HMEventClass, HMEvent>)
  end;

  PHMEvent = Pointer;

  HMCharacteristicEventClass = interface(HMEventClass)
    ['{15FEC378-749E-4BFC-A1F9-AECB8410441C}']
  end;

  HMCharacteristicEvent = interface(HMEvent)
    ['{1649573E-A1CC-47E1-ACF4-026D0106F437}']
    function initWithCharacteristic(characteristic: HMCharacteristic;
      triggerValue: TriggerValueType): Pointer { instancetype }; cdecl;
    function characteristic: HMCharacteristic; cdecl;
    function triggerValue: TriggerValueType; cdecl;
    procedure updateTriggerValue(triggerValue: TriggerValueType;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMCharacteristicEvent = class(TOCGenericImport<HMCharacteristicEventClass,
    HMCharacteristicEvent>)
  end;

  PHMCharacteristicEvent = Pointer;

  HMCharacteristicWriteActionClass = interface(HMActionClass)
    ['{6D9CE265-CFEF-42D4-B39D-A2247BEEBBC6}']
  end;

  HMCharacteristicWriteAction = interface(HMAction)
    ['{AE1508AC-6FDE-49B8-8B8E-33E2CCD142D9}']
    function initWithCharacteristic(characteristic: HMCharacteristic;
      targetValue: TargetValueType): Pointer { instancetype }; cdecl;
    function characteristic: HMCharacteristic; cdecl;
    function targetValue: TargetValueType; cdecl;
    procedure updateTargetValue(targetValue: TargetValueType;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMCharacteristicWriteAction = class
    (TOCGenericImport<HMCharacteristicWriteActionClass,
    HMCharacteristicWriteAction>)
  end;

  PHMCharacteristicWriteAction = Pointer;

  HMTriggerClass = interface(NSObjectClass)
    ['{2152C0C7-1345-495F-8769-5F40A7700B48}']
  end;

  HMTrigger = interface(NSObject)
    ['{A7E1E2CA-C3F2-4AD8-A1FD-C606A0C2E876}']
    function name: NSString; cdecl;
    function isEnabled: Boolean; cdecl;
    function actionSets: NSArray; cdecl;
    function lastFireDate: NSDate; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
    procedure updateName(name: NSString;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure addActionSet(actionSet: HMActionSet;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure removeActionSet(actionSet: HMActionSet;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure enable(enable: Boolean;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMTrigger = class(TOCGenericImport<HMTriggerClass, HMTrigger>)
  end;

  PHMTrigger = Pointer;

  HMEventTriggerClass = interface(HMTriggerClass)
    ['{E99BABDF-255B-439A-89C2-DA916F4C651F}']
    { class } function
      predicateForEvaluatingTriggerOccurringBeforeSignificantEvent
      (significantEvent: NSString; applyingOffset: NSDateComponents)
      : NSPredicate; cdecl;
    { class } function
      predicateForEvaluatingTriggerOccurringAfterSignificantEvent
      (significantEvent: NSString; applyingOffset: NSDateComponents)
      : NSPredicate; cdecl;
    { class } function
      predicateForEvaluatingTriggerOccurringBeforeDateWithComponents
      (dateComponents: NSDateComponents): NSPredicate; cdecl;
    { class } function
      predicateForEvaluatingTriggerOccurringOnDateWithComponents
      (dateComponents: NSDateComponents): NSPredicate; cdecl;
    { class } function
      predicateForEvaluatingTriggerOccurringAfterDateWithComponents
      (dateComponents: NSDateComponents): NSPredicate; cdecl;
    { class } function predicateForEvaluatingTriggerWithCharacteristic
      (characteristic: HMCharacteristic; relatedBy: NSPredicateOperatorType;
      toValue: Pointer): NSPredicate; cdecl;
  end;

  HMEventTrigger = interface(HMTrigger)
    ['{41069BB4-BB18-42A0-8D90-AB4E041F0794}']
    function initWithName(name: NSString; events: NSArray;
      predicate: NSPredicate): Pointer { instancetype }; cdecl;
    function events: NSArray; cdecl;
    function predicate: NSPredicate; cdecl;
    procedure addEvent(event: HMEvent;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure removeEvent(event: HMEvent;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure updatePredicate(predicate: NSPredicate;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMEventTrigger = class(TOCGenericImport<HMEventTriggerClass, HMEventTrigger>)
  end;

  PHMEventTrigger = Pointer;

  HMHomeManagerClass = interface(NSObjectClass)
    ['{B02816DE-465F-4DE5-B49A-24BB5869A1FF}']
  end;

  HMHomeManager = interface(NSObject)
    ['{3A10B2FF-E156-4929-8253-EAB87E927756}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function primaryHome: HMHome; cdecl;
    function homes: NSArray; cdecl;
    procedure updatePrimaryHome(home: HMHome;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure addHomeWithName(homeName: NSString;
      completionHandler: THomeKitCompletionHandler5); cdecl;
    procedure removeHome(home: HMHome;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMHomeManager = class(TOCGenericImport<HMHomeManagerClass, HMHomeManager>)
  end;

  PHMHomeManager = Pointer;

  HMZoneClass = interface(NSObjectClass)
    ['{07CFC21D-D0FC-4813-ACA4-3725D6EFBEA9}']
  end;

  HMZone = interface(NSObject)
    ['{44655DBE-77D6-45F1-9A9C-D53B2CD6027B}']
    function name: NSString; cdecl;
    function rooms: NSArray; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
    procedure updateName(name: NSString;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure addRoom(room: HMRoom;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure removeRoom(room: HMRoom;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMZone = class(TOCGenericImport<HMZoneClass, HMZone>)
  end;

  PHMZone = Pointer;

  HMServiceGroupClass = interface(NSObjectClass)
    ['{3A71A93E-7B35-48D9-AA3A-D3BB29286BEA}']
  end;

  HMServiceGroup = interface(NSObject)
    ['{02BCC985-A757-4A96-8802-EEEEBD072AA7}']
    function name: NSString; cdecl;
    function services: NSArray; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
    procedure updateName(name: NSString;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure addService(service: HMService;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure removeService(service: HMService;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMServiceGroup = class(TOCGenericImport<HMServiceGroupClass, HMServiceGroup>)
  end;

  PHMServiceGroup = Pointer;

  HMUserClass = interface(NSObjectClass)
    ['{54EA94C2-290E-4E9E-B5CB-BA3C4CF3E376}']
  end;

  HMUser = interface(NSObject)
    ['{C0786272-F7CC-438F-9A90-323E9E6FFFFF}']
    function name: NSString; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
  end;

  THMUser = class(TOCGenericImport<HMUserClass, HMUser>)
  end;

  PHMUser = Pointer;

  HMHomeAccessControlClass = interface(NSObjectClass)
    ['{0B0D73C6-8F4B-42AA-9A27-48A1C50E1CD4}']
  end;

  HMHomeAccessControl = interface(NSObject)
    ['{0C74285E-547E-4E02-8CE5-B42A4382D4AD}']
    function isAdministrator: Boolean; cdecl;
  end;

  THMHomeAccessControl = class(TOCGenericImport<HMHomeAccessControlClass,
    HMHomeAccessControl>)
  end;

  PHMHomeAccessControl = Pointer;

  HMLocationEventClass = interface(HMEventClass)
    ['{AD0AC8CA-6276-44FD-97CA-06EBF24932C2}']
  end;

  HMLocationEvent = interface(HMEvent)
    ['{579E11F7-DC49-4523-9A0D-52E4669E469B}']
    function initWithRegion(region: CLRegion): Pointer { instancetype }; cdecl;
    function region: CLRegion; cdecl;
    procedure updateRegion(region: CLRegion;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMLocationEvent = class(TOCGenericImport<HMLocationEventClass,
    HMLocationEvent>)
  end;

  PHMLocationEvent = Pointer;

  HMTimerTriggerClass = interface(HMTriggerClass)
    ['{E2CFC4C7-45F8-42C3-8781-CCA6AFFCD613}']
  end;

  HMTimerTrigger = interface(HMTrigger)
    ['{A8D405DD-D54D-43B3-81C3-23FCA0F75F63}']
    function initWithName(name: NSString; fireDate: NSDate;
      timeZone: NSTimeZone; recurrence: NSDateComponents;
      recurrenceCalendar: NSCalendar): Pointer { instancetype }; cdecl;
    function fireDate: NSDate; cdecl;
    function timeZone: NSTimeZone; cdecl;
    function recurrence: NSDateComponents; cdecl;
    function recurrenceCalendar: NSCalendar; cdecl;
    procedure updateFireDate(fireDate: NSDate;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure updateTimeZone(timeZone: NSTimeZone;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure updateRecurrence(recurrence: NSDateComponents;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMTimerTrigger = class(TOCGenericImport<HMTimerTriggerClass, HMTimerTrigger>)
  end;

  PHMTimerTrigger = Pointer;

  // ===== Protocol declarations =====

  HMAccessoryDelegate = interface(IObjectiveC)
    ['{A244E9C2-9D86-426E-AE23-AB59E106E475}']
    procedure accessoryDidUpdateName(accessory: HMAccessory); cdecl;
    [MethodName('accessory:didUpdateNameForService:')]
    procedure accessoryDidUpdateNameForService(accessory: HMAccessory;
      didUpdateNameForService: HMService); cdecl;
    [MethodName('accessory:didUpdateAssociatedServiceTypeForService:')]
    procedure accessoryDidUpdateAssociatedServiceTypeForService
      (accessory: HMAccessory; didUpdateAssociatedServiceTypeForService
      : HMService); cdecl;
    procedure accessoryDidUpdateServices(accessory: HMAccessory); cdecl;
    procedure accessoryDidUpdateReachability(accessory: HMAccessory); cdecl;
    [MethodName('accessory:service:didUpdateValueForCharacteristic:')]
    procedure accessoryServiceDidUpdateValueForCharacteristic
      (accessory: HMAccessory; service: HMService;
      didUpdateValueForCharacteristic: HMCharacteristic); cdecl;
  end;

  HMAccessoryBrowserDelegate = interface(IObjectiveC)
    ['{87A3CF9A-5C4D-44A7-82CB-F6C91E06AD1B}']
    [MethodName('accessoryBrowser:didFindNewAccessory:')]
    procedure accessoryBrowserDidFindNewAccessory(browser: HMAccessoryBrowser;
      didFindNewAccessory: HMAccessory); cdecl;
    [MethodName('accessoryBrowser:didRemoveNewAccessory:')]
    procedure accessoryBrowserDidRemoveNewAccessory(browser: HMAccessoryBrowser;
      didRemoveNewAccessory: HMAccessory); cdecl;
  end;

  HMHomeDelegate = interface(IObjectiveC)
    ['{7E40BE9A-6DE1-4A1E-9C7B-332CB273023F}']
    procedure homeDidUpdateName(home: HMHome); cdecl;
    [MethodName('home:didAddAccessory:')]
    procedure homeDidAddAccessory(home: HMHome;
      didAddAccessory: HMAccessory); cdecl;
    [MethodName('home:didRemoveAccessory:')]
    procedure homeDidRemoveAccessory(home: HMHome;
      didRemoveAccessory: HMAccessory); cdecl;
    [MethodName('home:didAddUser:')]
    procedure homeDidAddUser(home: HMHome; didAddUser: HMUser); cdecl;
    [MethodName('home:didRemoveUser:')]
    procedure homeDidRemoveUser(home: HMHome; didRemoveUser: HMUser); cdecl;
    [MethodName('home:didUpdateRoom:forAccessory:')]
    procedure homeDidUpdateRoomForAccessory(home: HMHome; didUpdateRoom: HMRoom;
      forAccessory: HMAccessory); cdecl;
    [MethodName('home:didAddRoom:')]
    procedure homeDidAddRoom(home: HMHome; didAddRoom: HMRoom); cdecl;
    [MethodName('home:didRemoveRoom:')]
    procedure homeDidRemoveRoom(home: HMHome; didRemoveRoom: HMRoom); cdecl;
    [MethodName('home:didUpdateNameForRoom:')]
    procedure homeDidUpdateNameForRoom(home: HMHome;
      didUpdateNameForRoom: HMRoom); cdecl;
    [MethodName('home:didAddZone:')]
    procedure homeDidAddZone(home: HMHome; didAddZone: HMZone); cdecl;
    [MethodName('home:didRemoveZone:')]
    procedure homeDidRemoveZone(home: HMHome; didRemoveZone: HMZone); cdecl;
    [MethodName('home:didUpdateNameForZone:')]
    procedure homeDidUpdateNameForZone(home: HMHome;
      didUpdateNameForZone: HMZone); cdecl;
    [MethodName('home:didAddRoom:toZone:')]
    procedure homeDidAddRoomToZone(home: HMHome; didAddRoom: HMRoom;
      toZone: HMZone); cdecl;
    [MethodName('home:didRemoveRoom:fromZone:')]
    procedure homeDidRemoveRoomFromZone(home: HMHome; didRemoveRoom: HMRoom;
      fromZone: HMZone); cdecl;
    [MethodName('home:didAddServiceGroup:')]
    procedure homeDidAddServiceGroup(home: HMHome;
      didAddServiceGroup: HMServiceGroup); cdecl;
    [MethodName('home:didRemoveServiceGroup:')]
    procedure homeDidRemoveServiceGroup(home: HMHome;
      didRemoveServiceGroup: HMServiceGroup); cdecl;
    [MethodName('home:didUpdateNameForServiceGroup:')]
    procedure homeDidUpdateNameForServiceGroup(home: HMHome;
      didUpdateNameForServiceGroup: HMServiceGroup); cdecl;
    [MethodName('home:didAddService:toServiceGroup:')]
    procedure homeDidAddServiceToServiceGroup(home: HMHome;
      didAddService: HMService; toServiceGroup: HMServiceGroup); cdecl;
    [MethodName('home:didRemoveService:fromServiceGroup:')]
    procedure homeDidRemoveServiceFromServiceGroup(home: HMHome;
      didRemoveService: HMService; fromServiceGroup: HMServiceGroup); cdecl;
    [MethodName('home:didAddActionSet:')]
    procedure homeDidAddActionSet(home: HMHome;
      didAddActionSet: HMActionSet); cdecl;
    [MethodName('home:didRemoveActionSet:')]
    procedure homeDidRemoveActionSet(home: HMHome;
      didRemoveActionSet: HMActionSet); cdecl;
    [MethodName('home:didUpdateNameForActionSet:')]
    procedure homeDidUpdateNameForActionSet(home: HMHome;
      didUpdateNameForActionSet: HMActionSet); cdecl;
    [MethodName('home:didUpdateActionsForActionSet:')]
    procedure homeDidUpdateActionsForActionSet(home: HMHome;
      didUpdateActionsForActionSet: HMActionSet); cdecl;
    [MethodName('home:didAddTrigger:')]
    procedure homeDidAddTrigger(home: HMHome; didAddTrigger: HMTrigger); cdecl;
    [MethodName('home:didRemoveTrigger:')]
    procedure homeDidRemoveTrigger(home: HMHome;
      didRemoveTrigger: HMTrigger); cdecl;
    [MethodName('home:didUpdateNameForTrigger:')]
    procedure homeDidUpdateNameForTrigger(home: HMHome;
      didUpdateNameForTrigger: HMTrigger); cdecl;
    [MethodName('home:didUpdateTrigger:')]
    procedure homeDidUpdateTrigger(home: HMHome;
      didUpdateTrigger: HMTrigger); cdecl;
    [MethodName('home:didUnblockAccessory:')]
    procedure homeDidUnblockAccessory(home: HMHome;
      didUnblockAccessory: HMAccessory); cdecl;
    [MethodName('home:didEncounterError:forAccessory:')]
    procedure homeDidEncounterErrorForAccessory(home: HMHome;
      didEncounterError: NSError; forAccessory: HMAccessory); cdecl;
  end;

  HMHomeManagerDelegate = interface(IObjectiveC)
    ['{A99A3754-D015-4902-99AF-D8E40BF863D5}']
    procedure homeManagerDidUpdateHomes(manager: HMHomeManager); cdecl;
    procedure homeManagerDidUpdatePrimaryHome(manager: HMHomeManager); cdecl;
    [MethodName('homeManager:didAddHome:')]
    procedure homeManagerDidAddHome(manager: HMHomeManager;
      didAddHome: HMHome); cdecl;
    [MethodName('homeManager:didRemoveHome:')]
    procedure homeManagerDidRemoveHome(manager: HMHomeManager;
      didRemoveHome: HMHome); cdecl;
  end;

  // ===== Exported string consts =====

function HMAccessoryCategoryTypeOther: NSString;
function HMAccessoryCategoryTypeSecuritySystem: NSString;
function HMAccessoryCategoryTypeBridge: NSString;
function HMAccessoryCategoryTypeDoor: NSString;
function HMAccessoryCategoryTypeDoorLock: NSString;
function HMAccessoryCategoryTypeFan: NSString;
function HMAccessoryCategoryTypeGarageDoorOpener: NSString;
function HMAccessoryCategoryTypeLightbulb: NSString;
function HMAccessoryCategoryTypeOutlet: NSString;
function HMAccessoryCategoryTypeProgrammableSwitch: NSString;
function HMAccessoryCategoryTypeSensor: NSString;
function HMAccessoryCategoryTypeSwitch: NSString;
function HMAccessoryCategoryTypeThermostat: NSString;
function HMAccessoryCategoryTypeWindow: NSString;
function HMAccessoryCategoryTypeWindowCovering: NSString;
function HMAccessoryCategoryTypeRangeExtender: NSString;
function HMActionSetTypeWakeUp: NSString;
function HMActionSetTypeSleep: NSString;
function HMActionSetTypeHomeDeparture: NSString;
function HMActionSetTypeHomeArrival: NSString;
function HMActionSetTypeUserDefined: NSString;
function HMCharacteristicPropertySupportsEventNotification: NSString;
function HMCharacteristicPropertyReadable: NSString;
function HMCharacteristicPropertyWritable: NSString;
function HMCharacteristicPropertyHidden: NSString;
function HMCharacteristicTypePowerState: NSString;
function HMCharacteristicTypeHue: NSString;
function HMCharacteristicTypeSaturation: NSString;
function HMCharacteristicTypeBrightness: NSString;
function HMCharacteristicTypeTemperatureUnits: NSString;
function HMCharacteristicTypeCurrentTemperature: NSString;
function HMCharacteristicTypeTargetTemperature: NSString;
function HMCharacteristicTypeCurrentHeatingCooling: NSString;
function HMCharacteristicTypeTargetHeatingCooling: NSString;
function HMCharacteristicTypeCoolingThreshold: NSString;
function HMCharacteristicTypeHeatingThreshold: NSString;
function HMCharacteristicTypeCurrentRelativeHumidity: NSString;
function HMCharacteristicTypeTargetRelativeHumidity: NSString;
function HMCharacteristicTypeCurrentDoorState: NSString;
function HMCharacteristicTypeTargetDoorState: NSString;
function HMCharacteristicTypeObstructionDetected: NSString;
function HMCharacteristicTypeName: NSString;
function HMCharacteristicTypeManufacturer: NSString;
function HMCharacteristicTypeModel: NSString;
function HMCharacteristicTypeSerialNumber: NSString;
function HMCharacteristicTypeIdentify: NSString;
function HMCharacteristicTypeRotationDirection: NSString;
function HMCharacteristicTypeRotationSpeed: NSString;
function HMCharacteristicTypeOutletInUse: NSString;
function HMCharacteristicTypeVersion: NSString;
function HMCharacteristicTypeLogs: NSString;
function HMCharacteristicTypeAudioFeedback: NSString;
function HMCharacteristicTypeAdminOnlyAccess: NSString;
function HMCharacteristicTypeSecuritySystemAlarmType: NSString;
function HMCharacteristicTypeMotionDetected: NSString;
function HMCharacteristicTypeCurrentLockMechanismState: NSString;
function HMCharacteristicTypeTargetLockMechanismState: NSString;
function HMCharacteristicTypeLockMechanismLastKnownAction: NSString;
function HMCharacteristicTypeLockManagementControlPoint: NSString;
function HMCharacteristicTypeLockManagementAutoSecureTimeout: NSString;
function HMCharacteristicTypeAirParticulateDensity: NSString;
function HMCharacteristicTypeAirParticulateSize: NSString;
function HMCharacteristicTypeAirQuality: NSString;
function HMCharacteristicTypeBatteryLevel: NSString;
function HMCharacteristicTypeCarbonDioxideDetected: NSString;
function HMCharacteristicTypeCarbonDioxideLevel: NSString;
function HMCharacteristicTypeCarbonDioxidePeakLevel: NSString;
function HMCharacteristicTypeCarbonMonoxideDetected: NSString;
function HMCharacteristicTypeCarbonMonoxideLevel: NSString;
function HMCharacteristicTypeCarbonMonoxidePeakLevel: NSString;
function HMCharacteristicTypeChargingState: NSString;
function HMCharacteristicTypeContactState: NSString;
function HMCharacteristicTypeCurrentHorizontalTilt: NSString;
function HMCharacteristicTypeCurrentLightLevel: NSString;
function HMCharacteristicTypeCurrentPosition: NSString;
function HMCharacteristicTypeCurrentSecuritySystemState: NSString;
function HMCharacteristicTypeCurrentVerticalTilt: NSString;
function HMCharacteristicTypeFirmwareVersion: NSString;
function HMCharacteristicTypeHardwareVersion: NSString;
function HMCharacteristicTypeHoldPosition: NSString;
function HMCharacteristicTypeInputEvent: NSString;
function HMCharacteristicTypeLeakDetected: NSString;
function HMCharacteristicTypeOccupancyDetected: NSString;
function HMCharacteristicTypeOutputState: NSString;
function HMCharacteristicTypePositionState: NSString;
function HMCharacteristicTypeSmokeDetected: NSString;
function HMCharacteristicTypeSoftwareVersion: NSString;
function HMCharacteristicTypeStatusActive: NSString;
function HMCharacteristicTypeStatusFault: NSString;
function HMCharacteristicTypeStatusJammed: NSString;
function HMCharacteristicTypeStatusLowBattery: NSString;
function HMCharacteristicTypeStatusTampered: NSString;
function HMCharacteristicTypeTargetHorizontalTilt: NSString;
function HMCharacteristicTypeTargetSecuritySystemState: NSString;
function HMCharacteristicTypeTargetPosition: NSString;
function HMCharacteristicTypeTargetVerticalTilt: NSString;
function HMCharacteristicMetadataFormatBool: NSString;
function HMCharacteristicMetadataFormatInt: NSString;
function HMCharacteristicMetadataFormatFloat: NSString;
function HMCharacteristicMetadataFormatString: NSString;
function HMCharacteristicMetadataFormatArray: NSString;
function HMCharacteristicMetadataFormatDictionary: NSString;
function HMCharacteristicMetadataFormatUInt8: NSString;
function HMCharacteristicMetadataFormatUInt16: NSString;
function HMCharacteristicMetadataFormatUInt32: NSString;
function HMCharacteristicMetadataFormatUInt64: NSString;
function HMCharacteristicMetadataFormatData: NSString;
function HMCharacteristicMetadataFormatTLV8: NSString;
function HMCharacteristicMetadataUnitsCelsius: NSString;
function HMCharacteristicMetadataUnitsFahrenheit: NSString;
function HMCharacteristicMetadataUnitsPercentage: NSString;
function HMCharacteristicMetadataUnitsArcDegree: NSString;
function HMCharacteristicMetadataUnitsSeconds: NSString;
function HMCharacteristicMetadataUnitsLux: NSString;
function HMErrorDomain: NSString;
function HMSignificantEventSunrise: NSString;
function HMSignificantEventSunset: NSString;
function HMCharacteristicKeyPath: NSString;
function HMCharacteristicValueKeyPath: NSString;
function HMUserFailedAccessoriesKey: NSString;
function HMServiceTypeLightbulb: NSString;
function HMServiceTypeSwitch: NSString;
function HMServiceTypeThermostat: NSString;
function HMServiceTypeGarageDoorOpener: NSString;
function HMServiceTypeAccessoryInformation: NSString;
function HMServiceTypeFan: NSString;
function HMServiceTypeOutlet: NSString;
function HMServiceTypeLockMechanism: NSString;
function HMServiceTypeLockManagement: NSString;
function HMServiceTypeAirQualitySensor: NSString;
function HMServiceTypeBattery: NSString;
function HMServiceTypeCarbonDioxideSensor: NSString;
function HMServiceTypeCarbonMonoxideSensor: NSString;
function HMServiceTypeContactSensor: NSString;
function HMServiceTypeDoor: NSString;
function HMServiceTypeHumiditySensor: NSString;
function HMServiceTypeLeakSensor: NSString;
function HMServiceTypeLightSensor: NSString;
function HMServiceTypeMotionSensor: NSString;
function HMServiceTypeOccupancySensor: NSString;
function HMServiceTypeSecuritySystem: NSString;
function HMServiceTypeStatefulProgrammableSwitch: NSString;
function HMServiceTypeStatelessProgrammableSwitch: NSString;
function HMServiceTypeSmokeSensor: NSString;
function HMServiceTypeTemperatureSensor: NSString;
function HMServiceTypeWindow: NSString;
function HMServiceTypeWindowCovering: NSString;


// ===== External functions =====

const
  libHomeKit = '/System/Library/Frameworks/HomeKit.framework/HomeKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  HomeKitModule: THandle;

{$ENDIF IOS}

function HMAccessoryCategoryTypeOther: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeOther');
end;

function HMAccessoryCategoryTypeSecuritySystem: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMAccessoryCategoryTypeSecuritySystem');
end;

function HMAccessoryCategoryTypeBridge: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeBridge');
end;

function HMAccessoryCategoryTypeDoor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeDoor');
end;

function HMAccessoryCategoryTypeDoorLock: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeDoorLock');
end;

function HMAccessoryCategoryTypeFan: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeFan');
end;

function HMAccessoryCategoryTypeGarageDoorOpener: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMAccessoryCategoryTypeGarageDoorOpener');
end;

function HMAccessoryCategoryTypeLightbulb: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeLightbulb');
end;

function HMAccessoryCategoryTypeOutlet: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeOutlet');
end;

function HMAccessoryCategoryTypeProgrammableSwitch: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMAccessoryCategoryTypeProgrammableSwitch');
end;

function HMAccessoryCategoryTypeSensor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeSensor');
end;

function HMAccessoryCategoryTypeSwitch: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeSwitch');
end;

function HMAccessoryCategoryTypeThermostat: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeThermostat');
end;

function HMAccessoryCategoryTypeWindow: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeWindow');
end;

function HMAccessoryCategoryTypeWindowCovering: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMAccessoryCategoryTypeWindowCovering');
end;

function HMAccessoryCategoryTypeRangeExtender: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMAccessoryCategoryTypeRangeExtender');
end;

function HMActionSetTypeWakeUp: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMActionSetTypeWakeUp');
end;

function HMActionSetTypeSleep: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMActionSetTypeSleep');
end;

function HMActionSetTypeHomeDeparture: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMActionSetTypeHomeDeparture');
end;

function HMActionSetTypeHomeArrival: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMActionSetTypeHomeArrival');
end;

function HMActionSetTypeUserDefined: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMActionSetTypeUserDefined');
end;

function HMCharacteristicPropertySupportsEventNotification: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicPropertySupportsEventNotification');
end;

function HMCharacteristicPropertyReadable: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicPropertyReadable');
end;

function HMCharacteristicPropertyWritable: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicPropertyWritable');
end;

function HMCharacteristicPropertyHidden: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicPropertyHidden');
end;

function HMCharacteristicTypePowerState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypePowerState');
end;

function HMCharacteristicTypeHue: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeHue');
end;

function HMCharacteristicTypeSaturation: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeSaturation');
end;

function HMCharacteristicTypeBrightness: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeBrightness');
end;

function HMCharacteristicTypeTemperatureUnits: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTemperatureUnits');
end;

function HMCharacteristicTypeCurrentTemperature: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentTemperature');
end;

function HMCharacteristicTypeTargetTemperature: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetTemperature');
end;

function HMCharacteristicTypeCurrentHeatingCooling: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentHeatingCooling');
end;

function HMCharacteristicTypeTargetHeatingCooling: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetHeatingCooling');
end;

function HMCharacteristicTypeCoolingThreshold: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCoolingThreshold');
end;

function HMCharacteristicTypeHeatingThreshold: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeHeatingThreshold');
end;

function HMCharacteristicTypeCurrentRelativeHumidity: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentRelativeHumidity');
end;

function HMCharacteristicTypeTargetRelativeHumidity: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetRelativeHumidity');
end;

function HMCharacteristicTypeCurrentDoorState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentDoorState');
end;

function HMCharacteristicTypeTargetDoorState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetDoorState');
end;

function HMCharacteristicTypeObstructionDetected: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeObstructionDetected');
end;

function HMCharacteristicTypeName: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeName');
end;

function HMCharacteristicTypeManufacturer: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeManufacturer');
end;

function HMCharacteristicTypeModel: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeModel');
end;

function HMCharacteristicTypeSerialNumber: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeSerialNumber');
end;

function HMCharacteristicTypeIdentify: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeIdentify');
end;

function HMCharacteristicTypeRotationDirection: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeRotationDirection');
end;

function HMCharacteristicTypeRotationSpeed: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeRotationSpeed');
end;

function HMCharacteristicTypeOutletInUse: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeOutletInUse');
end;

function HMCharacteristicTypeVersion: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeVersion');
end;

function HMCharacteristicTypeLogs: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeLogs');
end;

function HMCharacteristicTypeAudioFeedback: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeAudioFeedback');
end;

function HMCharacteristicTypeAdminOnlyAccess: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeAdminOnlyAccess');
end;

function HMCharacteristicTypeSecuritySystemAlarmType: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeSecuritySystemAlarmType');
end;

function HMCharacteristicTypeMotionDetected: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeMotionDetected');
end;

function HMCharacteristicTypeCurrentLockMechanismState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentLockMechanismState');
end;

function HMCharacteristicTypeTargetLockMechanismState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetLockMechanismState');
end;

function HMCharacteristicTypeLockMechanismLastKnownAction: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeLockMechanismLastKnownAction');
end;

function HMCharacteristicTypeLockManagementControlPoint: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeLockManagementControlPoint');
end;

function HMCharacteristicTypeLockManagementAutoSecureTimeout: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeLockManagementAutoSecureTimeout');
end;

function HMCharacteristicTypeAirParticulateDensity: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeAirParticulateDensity');
end;

function HMCharacteristicTypeAirParticulateSize: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeAirParticulateSize');
end;

function HMCharacteristicTypeAirQuality: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeAirQuality');
end;

function HMCharacteristicTypeBatteryLevel: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeBatteryLevel');
end;

function HMCharacteristicTypeCarbonDioxideDetected: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCarbonDioxideDetected');
end;

function HMCharacteristicTypeCarbonDioxideLevel: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCarbonDioxideLevel');
end;

function HMCharacteristicTypeCarbonDioxidePeakLevel: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCarbonDioxidePeakLevel');
end;

function HMCharacteristicTypeCarbonMonoxideDetected: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCarbonMonoxideDetected');
end;

function HMCharacteristicTypeCarbonMonoxideLevel: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCarbonMonoxideLevel');
end;

function HMCharacteristicTypeCarbonMonoxidePeakLevel: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCarbonMonoxidePeakLevel');
end;

function HMCharacteristicTypeChargingState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeChargingState');
end;

function HMCharacteristicTypeContactState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeContactState');
end;

function HMCharacteristicTypeCurrentHorizontalTilt: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentHorizontalTilt');
end;

function HMCharacteristicTypeCurrentLightLevel: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentLightLevel');
end;

function HMCharacteristicTypeCurrentPosition: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentPosition');
end;

function HMCharacteristicTypeCurrentSecuritySystemState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentSecuritySystemState');
end;

function HMCharacteristicTypeCurrentVerticalTilt: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentVerticalTilt');
end;

function HMCharacteristicTypeFirmwareVersion: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeFirmwareVersion');
end;

function HMCharacteristicTypeHardwareVersion: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeHardwareVersion');
end;

function HMCharacteristicTypeHoldPosition: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeHoldPosition');
end;

function HMCharacteristicTypeInputEvent: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeInputEvent');
end;

function HMCharacteristicTypeLeakDetected: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeLeakDetected');
end;

function HMCharacteristicTypeOccupancyDetected: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeOccupancyDetected');
end;

function HMCharacteristicTypeOutputState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeOutputState');
end;

function HMCharacteristicTypePositionState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypePositionState');
end;

function HMCharacteristicTypeSmokeDetected: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeSmokeDetected');
end;

function HMCharacteristicTypeSoftwareVersion: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeSoftwareVersion');
end;

function HMCharacteristicTypeStatusActive: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeStatusActive');
end;

function HMCharacteristicTypeStatusFault: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeStatusFault');
end;

function HMCharacteristicTypeStatusJammed: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeStatusJammed');
end;

function HMCharacteristicTypeStatusLowBattery: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeStatusLowBattery');
end;

function HMCharacteristicTypeStatusTampered: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeStatusTampered');
end;

function HMCharacteristicTypeTargetHorizontalTilt: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetHorizontalTilt');
end;

function HMCharacteristicTypeTargetSecuritySystemState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetSecuritySystemState');
end;

function HMCharacteristicTypeTargetPosition: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetPosition');
end;

function HMCharacteristicTypeTargetVerticalTilt: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetVerticalTilt');
end;

function HMCharacteristicMetadataFormatBool: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataFormatBool');
end;

function HMCharacteristicMetadataFormatInt: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicMetadataFormatInt');
end;

function HMCharacteristicMetadataFormatFloat: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataFormatFloat');
end;

function HMCharacteristicMetadataFormatString: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataFormatString');
end;

function HMCharacteristicMetadataFormatArray: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataFormatArray');
end;

function HMCharacteristicMetadataFormatDictionary: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataFormatDictionary');
end;

function HMCharacteristicMetadataFormatUInt8: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataFormatUInt8');
end;

function HMCharacteristicMetadataFormatUInt16: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataFormatUInt16');
end;

function HMCharacteristicMetadataFormatUInt32: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataFormatUInt32');
end;

function HMCharacteristicMetadataFormatUInt64: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataFormatUInt64');
end;

function HMCharacteristicMetadataFormatData: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataFormatData');
end;

function HMCharacteristicMetadataFormatTLV8: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataFormatTLV8');
end;

function HMCharacteristicMetadataUnitsCelsius: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataUnitsCelsius');
end;

function HMCharacteristicMetadataUnitsFahrenheit: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataUnitsFahrenheit');
end;

function HMCharacteristicMetadataUnitsPercentage: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataUnitsPercentage');
end;

function HMCharacteristicMetadataUnitsArcDegree: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataUnitsArcDegree');
end;

function HMCharacteristicMetadataUnitsSeconds: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataUnitsSeconds');
end;

function HMCharacteristicMetadataUnitsLux: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicMetadataUnitsLux');
end;

function HMErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMErrorDomain');
end;

function HMSignificantEventSunrise: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMSignificantEventSunrise');
end;

function HMSignificantEventSunset: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMSignificantEventSunset');
end;

function HMCharacteristicKeyPath: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicKeyPath');
end;

function HMCharacteristicValueKeyPath: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicValueKeyPath');
end;

function HMUserFailedAccessoriesKey: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMUserFailedAccessoriesKey');
end;

function HMServiceTypeLightbulb: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeLightbulb');
end;

function HMServiceTypeSwitch: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeSwitch');
end;

function HMServiceTypeThermostat: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeThermostat');
end;

function HMServiceTypeGarageDoorOpener: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeGarageDoorOpener');
end;

function HMServiceTypeAccessoryInformation: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeAccessoryInformation');
end;

function HMServiceTypeFan: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeFan');
end;

function HMServiceTypeOutlet: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeOutlet');
end;

function HMServiceTypeLockMechanism: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeLockMechanism');
end;

function HMServiceTypeLockManagement: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeLockManagement');
end;

function HMServiceTypeAirQualitySensor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeAirQualitySensor');
end;

function HMServiceTypeBattery: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeBattery');
end;

function HMServiceTypeCarbonDioxideSensor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeCarbonDioxideSensor');
end;

function HMServiceTypeCarbonMonoxideSensor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeCarbonMonoxideSensor');
end;

function HMServiceTypeContactSensor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeContactSensor');
end;

function HMServiceTypeDoor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeDoor');
end;

function HMServiceTypeHumiditySensor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeHumiditySensor');
end;

function HMServiceTypeLeakSensor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeLeakSensor');
end;

function HMServiceTypeLightSensor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeLightSensor');
end;

function HMServiceTypeMotionSensor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeMotionSensor');
end;

function HMServiceTypeOccupancySensor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeOccupancySensor');
end;

function HMServiceTypeSecuritySystem: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeSecuritySystem');
end;

function HMServiceTypeStatefulProgrammableSwitch: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMServiceTypeStatefulProgrammableSwitch');
end;

function HMServiceTypeStatelessProgrammableSwitch: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMServiceTypeStatelessProgrammableSwitch');
end;

function HMServiceTypeSmokeSensor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeSmokeSensor');
end;

function HMServiceTypeTemperatureSensor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeTemperatureSensor');
end;

function HMServiceTypeWindow: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeWindow');
end;

function HMServiceTypeWindowCovering: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeWindowCovering');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

HomeKitModule := dlopen(MarshaledAString(libHomeKit), RTLD_LAZY);

finalization

dlclose(HomeKitModule);
{$ENDIF IOS}

end.
