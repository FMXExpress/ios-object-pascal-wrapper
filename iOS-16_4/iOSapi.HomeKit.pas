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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  HMCameraStreamStateStarting = 1;
  HMCameraStreamStateStreaming = 2;
  HMCameraStreamStateStopping = 3;
  HMCameraStreamStateNotStreaming = 4;
  HMCameraAudioStreamSettingMuted = 1;
  HMCameraAudioStreamSettingIncomingAudioAllowed = 2;
  HMCameraAudioStreamSettingBidirectionalAudioAllowed = 3;
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
  HMCharacteristicValueJammedStatusNone = 0;
  HMCharacteristicValueJammedStatusJammed = 1;
  HMCharacteristicValueTamperedStatusNone = 0;
  HMCharacteristicValueTamperedStatusTampered = 1;
  HMCharacteristicValueLeakStatusNone = 0;
  HMCharacteristicValueLeakStatusDetected = 1;
  HMCharacteristicValueContactStateDetected = 0;
  HMCharacteristicValueContactStateNone = 1;
  HMCharacteristicValueStatusFaultNoFault = 0;
  HMCharacteristicValueStatusFaultGeneralFault = 1;
  HMCharacteristicValueCarbonMonoxideDetectionStatusNotDetected = 0;
  HMCharacteristicValueCarbonMonoxideDetectionStatusDetected = 1;
  HMCharacteristicValueCarbonDioxideDetectionStatusNotDetected = 0;
  HMCharacteristicValueCarbonDioxideDetectionStatusDetected = 1;
  HMCharacteristicValueOccupancyStatusNotOccupied = 0;
  HMCharacteristicValueOccupancyStatusOccupied = 1;
  HMCharacteristicValueSecuritySystemAlarmTypeNoAlarm = 0;
  HMCharacteristicValueSecuritySystemAlarmTypeUnknown = 1;
  HMCharacteristicValueCurrentAirPurifierStateInactive = 0;
  HMCharacteristicValueCurrentAirPurifierStateIdle = 1;
  HMCharacteristicValueCurrentAirPurifierStateActive = 2;
  HMCharacteristicValueTargetAirPurifierStateManual = 0;
  HMCharacteristicValueTargetAirPurifierStateAutomatic = 1;
  HMCharacteristicValueCurrentSlatStateStationary = 0;
  HMCharacteristicValueCurrentSlatStateJammed = 1;
  HMCharacteristicValueCurrentSlatStateOscillating = 2;
  HMCharacteristicValueSlatTypeHorizontal = 0;
  HMCharacteristicValueSlatTypeVertical = 1;
  HMCharacteristicValueFilterChangeNotNeeded = 0;
  HMCharacteristicValueFilterChangeNeeded = 1;
  HMCharacteristicValueLabelNamespaceDot = 0;
  HMCharacteristicValueLabelNamespaceNumeral = 1;
  HMCharacteristicValueProgramModeNotScheduled = 0;
  HMCharacteristicValueProgramModeScheduled = 1;
  HMCharacteristicValueProgramModeScheduleOverriddenToManual = 2;
  HMCharacteristicValueUsageStateNotInUse = 0;
  HMCharacteristicValueUsageStateInUse = 1;
  HMCharacteristicValueValveTypeGenericValve = 0;
  HMCharacteristicValueValveTypeIrrigation = 1;
  HMCharacteristicValueValveTypeShowerHead = 2;
  HMCharacteristicValueValveTypeWaterFaucet = 3;
  HMCharacteristicValueDoorStateOpen = 0;
  HMCharacteristicValueDoorStateClosed = 1;
  HMCharacteristicValueDoorStateOpening = 2;
  HMCharacteristicValueDoorStateClosing = 3;
  HMCharacteristicValueDoorStateStopped = 4;
  HMCharacteristicValueCurrentHeatingCoolingOff = 0;
  HMCharacteristicValueCurrentHeatingCoolingHeat = 1;
  HMCharacteristicValueCurrentHeatingCoolingCool = 2;
  HMCharacteristicValueLockMechanismStateUnsecured = 0;
  HMCharacteristicValueLockMechanismStateSecured = 1;
  HMCharacteristicValueLockMechanismStateJammed = 2;
  HMCharacteristicValueLockMechanismStateUnknown = 3;
  HMCharacteristicValueTargetLockMechanismStateUnsecured = 0;
  HMCharacteristicValueTargetLockMechanismStateSecured = 1;
  HMCharacteristicValueRotationDirectionClockwise = 0;
  HMCharacteristicValueRotationDirectionCounterClockwise = 1;
  HMCharacteristicValueTargetDoorStateOpen = 0;
  HMCharacteristicValueTargetDoorStateClosed = 1;
  HMCharacteristicValueHeatingCoolingOff = 0;
  HMCharacteristicValueHeatingCoolingHeat = 1;
  HMCharacteristicValueHeatingCoolingCool = 2;
  HMCharacteristicValueHeatingCoolingAuto = 3;
  HMCharacteristicValueTemperatureUnitCelsius = 0;
  HMCharacteristicValueTemperatureUnitFahrenheit = 1;
  HMCharacteristicValueInputEventSinglePress = 0;
  HMCharacteristicValueInputEventDoublePress = 1;
  HMCharacteristicValueInputEventLongPress = 2;
  HMCharacteristicValueSmokeDetectionStatusNone = 0;
  HMCharacteristicValueSmokeDetectionStatusDetected = 1;
  HMCharacteristicValueBatteryStatusNormal = 0;
  HMCharacteristicValueBatteryStatusLow = 1;
  HMCharacteristicValueChargingStateNone = 0;
  HMCharacteristicValueChargingStateInProgress = 1;
  HMCharacteristicValueChargingStateNotChargeable = 2;
  HMCharacteristicValueLockPhysicalControlsStateNotLocked = 0;
  HMCharacteristicValueLockPhysicalControlsStateLocked = 1;
  HMCharacteristicValueCurrentFanStateInactive = 0;
  HMCharacteristicValueCurrentFanStateIdle = 1;
  HMCharacteristicValueCurrentFanStateActive = 2;
  HMCharacteristicValueActivationStateInactive = 0;
  HMCharacteristicValueActivationStateActive = 1;
  HMCharacteristicValueCurrentHeaterCoolerStateInactive = 0;
  HMCharacteristicValueCurrentHeaterCoolerStateIdle = 1;
  HMCharacteristicValueCurrentHeaterCoolerStateHeating = 2;
  HMCharacteristicValueCurrentHeaterCoolerStateCooling = 3;
  HMCharacteristicValueTargetHeaterCoolerStateAutomatic = 0;
  HMCharacteristicValueTargetHeaterCoolerStateHeat = 1;
  HMCharacteristicValueTargetHeaterCoolerStateCool = 2;
  HMCharacteristicValueCurrentHumidifierDehumidifierStateInactive = 0;
  HMCharacteristicValueCurrentHumidifierDehumidifierStateIdle = 1;
  HMCharacteristicValueCurrentHumidifierDehumidifierStateHumidifying = 2;
  HMCharacteristicValueCurrentHumidifierDehumidifierStateDehumidifying = 3;
  HMCharacteristicValueTargetHumidifierDehumidifierStateAutomatic = 0;
  HMCharacteristicValueTargetHumidifierDehumidifierStateHumidify = 1;
  HMCharacteristicValueTargetHumidifierDehumidifierStateDehumidify = 2;
  HMCharacteristicValueSwingModeDisabled = 0;
  HMCharacteristicValueSwingModeEnabled = 1;
  HMCharacteristicValueTargetFanStateManual = 0;
  HMCharacteristicValueTargetFanStateAutomatic = 1;
  HMCharacteristicValueConfigurationStateNotConfigured = 0;
  HMCharacteristicValueConfigurationStateConfigured = 1;
  HMErrorCodeUnexpectedError = -1;
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
  HMErrorCodeInvalidOrMissingAuthorizationData = 87;
  HMErrorCodeBridgedAccessoryNotReachable = 88;
  HMErrorCodeNotAuthorizedForMicrophoneAccess = 89;
  HMErrorCodeIncompatibleNetwork = 90;
  HMErrorCodeNoHomeHub = 91;
  HMErrorCodeNoCompatibleHomeHub = 92;
  HMErrorCodeIncompatibleAccessory = 93;
  HMErrorCodeIncompatibleHomeHub = HMErrorCodeNoCompatibleHomeHub;
  HMErrorCodeObjectWithSimilarNameExists = 95;
  HMErrorCodeOwnershipFailure = 96;
  HMErrorCodeMaximumAccessoriesOfTypeInHome = 97;
  HMErrorCodeWiFiCredentialGenerationFailed = 98;
  HMErrorCodeEnterpriseNetworkNotSupported = 99;
  HMErrorCodeTimedOutWaitingForAccessory = 100;
  HMErrorCodeAccessoryCommunicationFailure = 101;
  HMErrorCodeFailedToJoinNetwork = 102;
  HMErrorCodeAccessoryIsSuspended = 103;
  HMEventTriggerActivationStateDisabled = 0;
  HMEventTriggerActivationStateDisabledNoHomeHub = 1;
  HMEventTriggerActivationStateDisabledNoCompatibleHomeHub = 2;
  HMEventTriggerActivationStateDisabledNoLocationServicesAuthorization = 3;
  HMEventTriggerActivationStateEnabled = 4;
  HMHomeHubStateNotAvailable = 0;
  HMHomeHubStateConnected = 1;
  HMHomeHubStateDisconnected = 2;
  HMHomeManagerAuthorizationStatusDetermined = (1 shl 0);
  HMHomeManagerAuthorizationStatusRestricted = (1 shl 1);
  HMHomeManagerAuthorizationStatusAuthorized = (1 shl 2);
  HMPresenceEventTypeEveryEntry = 1;
  HMPresenceEventTypeEveryExit = 2;
  HMPresenceEventTypeFirstEntry = 3;
  HMPresenceEventTypeLastExit = 4;
  HMPresenceEventTypeAtHome = HMPresenceEventTypeFirstEntry;
  HMPresenceEventTypeNotAtHome = HMPresenceEventTypeLastExit;
  HMPresenceEventUserTypeCurrentUser = 1;
  HMPresenceEventUserTypeHomeUsers = 2;
  HMPresenceEventUserTypeCustomUsers = 3;

type

  // ===== Forward declarations =====
{$M+}
  HMAccessControl = interface;
  HMHome = interface;
  HMRoom = interface;
  HMService = interface;
  HMCharacteristic = interface;
  HMAccessoryCategory = interface;
  HMAccessoryProfile = interface;
  HMAccessoryDelegate = interface;
  HMAccessory = interface;
  HMCameraProfile = interface;
  HMAccessoryBrowserDelegate = interface;
  HMAccessoryBrowser = interface;
  HMAccessorySetupRequest = interface;
  HMAccessorySetupResult = interface;
  HMAccessorySetupManager = interface;
  HMAccessoryOwnershipToken = interface;
  HMAccessorySetupPayload = interface;
  HMAction = interface;
  HMActionSet = interface;
  HMAddAccessoryRequest = interface;
  HMEvent = interface;
  HMTimeEvent = interface;
  HMCalendarEvent = interface;
  HMMutableCalendarEvent = interface;
  HMCameraControl = interface;
  HMCameraAudioControl = interface;
  HMCameraStreamControl = interface;
  HMCameraSnapshotControl = interface;
  HMCameraSettingsControl = interface;
  HMCameraSource = interface;
  HMCameraSnapshot = interface;
  HMCameraSnapshotControlDelegate = interface;
  HMCameraStream = interface;
  HMCameraStreamControlDelegate = interface;
  HMCameraView = interface;
  HMCharacteristicMetadata = interface;
  HMCharacteristicEvent = interface;
  HMMutableCharacteristicEvent = interface;
  HMNumberRange = interface;
  HMCharacteristicThresholdRangeEvent = interface;
  HMMutableCharacteristicThresholdRangeEvent = interface;
  HMCharacteristicWriteAction = interface;
  HMDurationEvent = interface;
  HMMutableDurationEvent = interface;
  HMSignificantTimeEvent = interface;
  HMMutableSignificantTimeEvent = interface;
  HMTrigger = interface;
  HMPresenceEvent = interface;
  HMEventTrigger = interface;
  HMHomeManager = interface;
  HMZone = interface;
  HMServiceGroup = interface;
  HMUser = interface;
  HMHomeAccessControl = interface;
  HMHomeDelegate = interface;
  HMHomeManagerDelegate = interface;
  HMLocationEvent = interface;
  HMMutableLocationEvent = interface;
  HMNetworkConfigurationProfileDelegate = interface;
  HMNetworkConfigurationProfile = interface;
  HMMutablePresenceEvent = interface;
  HMTimerTrigger = interface;

  // ===== Framework typedefs =====
{$M+}
  HMErrorBlock = procedure(param1: NSError) of object;
  THomeKitCompletionHandler = procedure(param1: NSError) of object;
  THomeKitCompletionHandler1 = procedure(param1: HMAccessorySetupResult;
    param2: NSError) of object;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  HMCameraStreamState = NSUInteger;
  HMCameraAudioStreamSetting = NSUInteger;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  HMCharacteristicValueLockMechanismLastKnownAction = NSInteger;
  HMCharacteristicValueAirParticulateSize = NSInteger;
  HMCharacteristicValueAirQuality = NSInteger;
  HMCharacteristicValuePositionState = NSInteger;
  HMCharacteristicValueCurrentSecuritySystemState = NSInteger;
  HMCharacteristicValueTargetSecuritySystemState = NSInteger;
  HMCharacteristicValueJammedStatus = NSInteger;
  HMCharacteristicValueTamperedStatus = NSInteger;
  HMCharacteristicValueLeakStatus = NSInteger;
  HMCharacteristicValueContactState = NSInteger;
  HMCharacteristicValueStatusFault = NSInteger;
  HMCharacteristicValueCarbonMonoxideDetectionStatus = NSInteger;
  HMCharacteristicValueCarbonDioxideDetectionStatus = NSInteger;
  HMCharacteristicValueOccupancyStatus = NSInteger;
  HMCharacteristicValueSecuritySystemAlarmType = NSInteger;
  HMCharacteristicValueCurrentAirPurifierState = NSInteger;
  HMCharacteristicValueTargetAirPurifierState = NSInteger;
  HMCharacteristicValueCurrentSlatState = NSInteger;
  HMCharacteristicValueSlatType = NSInteger;
  HMCharacteristicValueFilterChange = NSInteger;
  HMCharacteristicValueLabelNamespace = NSInteger;
  HMCharacteristicValueProgramMode = NSInteger;
  HMCharacteristicValueUsageState = NSInteger;
  HMCharacteristicValueValveType = NSInteger;
  HMCharacteristicValueDoorState = NSInteger;
  HMCharacteristicValueCurrentHeatingCooling = NSInteger;
  HMCharacteristicValueLockMechanismState = NSInteger;
  HMCharacteristicValueTargetLockMechanismState = NSInteger;
  HMCharacteristicValueRotationDirection = NSInteger;
  HMCharacteristicValueTargetDoorState = NSInteger;
  HMCharacteristicValueHeatingCooling = NSInteger;
  HMCharacteristicValueTemperatureUnit = NSInteger;
  HMCharacteristicValueInputEvent = NSInteger;
  HMCharacteristicValueSmokeDetectionStatus = NSInteger;
  HMCharacteristicValueBatteryStatus = NSInteger;
  HMCharacteristicValueChargingState = NSInteger;
  HMCharacteristicValueLockPhysicalControlsState = NSInteger;
  HMCharacteristicValueCurrentFanState = NSInteger;
  HMCharacteristicValueActivationState = NSInteger;
  HMCharacteristicValueCurrentHeaterCoolerState = NSInteger;
  HMCharacteristicValueTargetHeaterCoolerState = NSInteger;
  HMCharacteristicValueCurrentHumidifierDehumidifierState = NSInteger;
  HMCharacteristicValueTargetHumidifierDehumidifierState = NSInteger;
  HMCharacteristicValueSwingMode = NSInteger;
  HMCharacteristicValueTargetFanState = NSInteger;
  HMCharacteristicValueConfigurationState = NSInteger;
  TriggerValueType = Pointer;
  PTriggerValueType = ^TriggerValueType;
  TargetValueType = Pointer;
  PTargetValueType = ^TargetValueType;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  HMErrorCode = NSInteger;
  HMEventTriggerActivationState = NSUInteger;
  HMSignificantEvent = NSString;
  PHMSignificantEvent = ^HMSignificantEvent;
  NSPredicateOperatorType = NSUInteger;
  HMHomeHubState = NSUInteger;
  THomeKitCompletionHandler2 = procedure(param1: NSArray; param2: NSError)
    of object;
  THomeKitCompletion = procedure(param1: HMUser; param2: NSError) of object;
  THomeKitCompletionHandler3 = procedure(param1: HMRoom; param2: NSError)
    of object;
  THomeKitCompletionHandler4 = procedure(param1: HMZone; param2: NSError)
    of object;
  THomeKitCompletionHandler5 = procedure(param1: HMServiceGroup;
    param2: NSError) of object;
  THomeKitCompletionHandler6 = procedure(param1: HMActionSet; param2: NSError)
    of object;
  THomeKitMatterControllerXPCConnectBlock = function(): NSXPCConnection; cdecl;
  HMHomeManagerAuthorizationStatus = NSUInteger;
  THomeKitCompletionHandler7 = procedure(param1: HMHome; param2: NSError)
    of object;
  HMPresenceEventType = NSUInteger;
  HMPresenceEventUserType = NSUInteger;
  // ===== Interface declarations =====

  HMAccessControlClass = interface(NSObjectClass)
    ['{2BED2CAF-4F2E-494D-9635-99BD223D1DEB}']
  end;

  HMAccessControl = interface(NSObject)
    ['{7E633A4A-3D2C-4B0A-9E6A-F12C1B4AFAE7}']
  end;

  THMAccessControl = class(TOCGenericImport<HMAccessControlClass,
    HMAccessControl>)
  end;

  PHMAccessControl = Pointer;

  HMHomeClass = interface(NSObjectClass)
    ['{1427074C-6472-42B3-87FE-9F9F91BBFF1B}']
  end;

  HMHome = interface(NSObject)
    ['{FFF11D93-3A8E-445A-82D3-25C7AD5C039D}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function name: NSString; cdecl;
    function isPrimary: Boolean; cdecl;
    function homeHubState: HMHomeHubState; cdecl;
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
    procedure addAndSetupAccessoriesWithCompletionHandler
      (completion: THomeKitCompletionHandler); cdecl;
    procedure addAndSetupAccessoriesWithPayload
      (payload: HMAccessorySetupPayload;
      completionHandler: THomeKitCompletionHandler2); cdecl;
    function supportsAddingNetworkRouter: Boolean; cdecl;
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
      completionHandler: THomeKitCompletionHandler3); cdecl;
    procedure removeRoom(room: HMRoom;
      completionHandler: THomeKitCompletionHandler); cdecl;
    function roomForEntireHome: HMRoom; cdecl;
    function zones: NSArray; cdecl;
    procedure addZoneWithName(zoneName: NSString;
      completionHandler: THomeKitCompletionHandler4); cdecl;
    procedure removeZone(zone: HMZone;
      completionHandler: THomeKitCompletionHandler); cdecl;
    function serviceGroups: NSArray; cdecl;
    procedure addServiceGroupWithName(serviceGroupName: NSString;
      completionHandler: THomeKitCompletionHandler5); cdecl;
    procedure removeServiceGroup(group: HMServiceGroup;
      completionHandler: THomeKitCompletionHandler); cdecl;
    function actionSets: NSArray; cdecl;
    procedure addActionSetWithName(actionSetName: NSString;
      completionHandler: THomeKitCompletionHandler6); cdecl;
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
    function matterControllerID: NSString; cdecl;
    function matterControllerXPCConnectBlock
      : THomeKitMatterControllerXPCConnectBlock; cdecl;
  end;

  THMHome = class(TOCGenericImport<HMHomeClass, HMHome>)
  end;

  PHMHome = Pointer;

  HMRoomClass = interface(NSObjectClass)
    ['{5A9E6EC7-F01F-46C5-848A-FF051FF9B542}']
  end;

  HMRoom = interface(NSObject)
    ['{FE680F13-A1A3-4EC8-B1A0-3B87537B514C}']
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
    ['{DAAC4DB9-4C9C-42EA-BF32-5D1D3D29262B}']
  end;

  HMService = interface(NSObject)
    ['{F25A70C7-7519-4964-BF64-68D3EFDBEBCE}']
    function accessory: HMAccessory; cdecl;
    function serviceType: NSString; cdecl;
    function localizedDescription: NSString; cdecl;
    function name: NSString; cdecl;
    function associatedServiceType: NSString; cdecl;
    function characteristics: NSArray; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
    function isUserInteractive: Boolean; cdecl;
    function isPrimaryService: Boolean; cdecl;
    function linkedServices: NSArray; cdecl;
    procedure updateName(name: NSString;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure updateAssociatedServiceType(serviceType: NSString;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMService = class(TOCGenericImport<HMServiceClass, HMService>)
  end;

  PHMService = Pointer;

  HMCharacteristicClass = interface(NSObjectClass)
    ['{9EFDDEC4-69D4-424B-93F1-5A0C1F7D28A3}']
  end;

  HMCharacteristic = interface(NSObject)
    ['{18941984-05E7-4BF5-817D-57EAF40ABFC2}']
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
    ['{14130834-D4B3-4E21-819F-6201DEB0C4CB}']
  end;

  HMAccessoryCategory = interface(NSObject)
    ['{3A608447-B651-4239-91A8-0E3CBA18F9CB}']
    function categoryType: NSString; cdecl;
    function localizedDescription: NSString; cdecl;
  end;

  THMAccessoryCategory = class(TOCGenericImport<HMAccessoryCategoryClass,
    HMAccessoryCategory>)
  end;

  PHMAccessoryCategory = Pointer;

  HMAccessoryProfileClass = interface(NSObjectClass)
    ['{3A062808-DDC9-4D03-B6FF-D0F609A887D1}']
  end;

  HMAccessoryProfile = interface(NSObject)
    ['{5B2D1213-F50D-45E3-8310-0A2DAEF0135C}']
    function uniqueIdentifier: NSUUID; cdecl;
    function services: NSArray; cdecl;
    function accessory: HMAccessory; cdecl;
  end;

  THMAccessoryProfile = class(TOCGenericImport<HMAccessoryProfileClass,
    HMAccessoryProfile>)
  end;

  PHMAccessoryProfile = Pointer;

  HMAccessoryClass = interface(NSObjectClass)
    ['{5772EB54-7969-4321-9DCF-D8C5F07BB6E4}']
  end;

  HMAccessory = interface(NSObject)
    ['{A96182A8-6546-4112-BC7F-B5A943C340FC}']
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
    function profiles: NSArray; cdecl;
    function isBlocked: Boolean; cdecl;
    function model: NSString; cdecl;
    function manufacturer: NSString; cdecl;
    function firmwareVersion: NSString; cdecl;
    function supportsIdentify: Boolean; cdecl;
    function matterNodeID: NSNumber; cdecl;
    procedure updateName(name: NSString;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure identifyWithCompletionHandler(completion
      : THomeKitCompletionHandler); cdecl;
    function cameraProfiles: NSArray; cdecl;
  end;

  THMAccessory = class(TOCGenericImport<HMAccessoryClass, HMAccessory>)
  end;

  PHMAccessory = Pointer;

  HMCameraProfileClass = interface(HMAccessoryProfileClass)
    ['{CB8D5266-C9B3-4142-A42B-2884BCB534AB}']
  end;

  HMCameraProfile = interface(HMAccessoryProfile)
    ['{9C1A6FF1-93C7-47E4-87CD-F17B7E247DC1}']
    function streamControl: HMCameraStreamControl; cdecl;
    function snapshotControl: HMCameraSnapshotControl; cdecl;
    function settingsControl: HMCameraSettingsControl; cdecl;
    function speakerControl: HMCameraAudioControl; cdecl;
    function microphoneControl: HMCameraAudioControl; cdecl;
  end;

  THMCameraProfile = class(TOCGenericImport<HMCameraProfileClass,
    HMCameraProfile>)
  end;

  PHMCameraProfile = Pointer;

  HMAccessoryBrowserClass = interface(NSObjectClass)
    ['{34DAE74F-71DE-4EF7-BA47-9F838261B69B}']
  end;

  HMAccessoryBrowser = interface(NSObject)
    ['{824A9F87-2C8C-4620-ACB3-3B8759BEC21F}']
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

  HMAccessorySetupRequestClass = interface(NSObjectClass)
    ['{47C57B24-28A3-4545-9456-CEE10FC7191C}']
  end;

  HMAccessorySetupRequest = interface(NSObject)
    ['{248A7ABA-7CE7-4044-B918-224BB08B01ED}']
    procedure setPayload(payload: HMAccessorySetupPayload); cdecl;
    function payload: HMAccessorySetupPayload; cdecl;
    procedure setHomeUniqueIdentifier(homeUniqueIdentifier: NSUUID); cdecl;
    function homeUniqueIdentifier: NSUUID; cdecl;
    procedure setSuggestedRoomUniqueIdentifier(suggestedRoomUniqueIdentifier
      : NSUUID); cdecl;
    function suggestedRoomUniqueIdentifier: NSUUID; cdecl;
    procedure setSuggestedAccessoryName(suggestedAccessoryName
      : NSString); cdecl;
    function suggestedAccessoryName: NSString; cdecl;
    procedure setMatterPayload(matterPayload: MTRSetupPayload); cdecl;
    function matterPayload: MTRSetupPayload; cdecl;
  end;

  THMAccessorySetupRequest = class
    (TOCGenericImport<HMAccessorySetupRequestClass, HMAccessorySetupRequest>)
  end;

  PHMAccessorySetupRequest = Pointer;

  HMAccessorySetupResultClass = interface(NSObjectClass)
    ['{2718420D-2FD5-42BE-9727-FB2FBD716C8F}']
  end;

  HMAccessorySetupResult = interface(NSObject)
    ['{3FC4B59C-D075-4598-82F6-D361051243C6}']
    function homeUniqueIdentifier: NSUUID; cdecl;
    function accessoryUniqueIdentifiers: NSArray; cdecl;
  end;

  THMAccessorySetupResult = class(TOCGenericImport<HMAccessorySetupResultClass,
    HMAccessorySetupResult>)
  end;

  PHMAccessorySetupResult = Pointer;

  HMAccessorySetupManagerClass = interface(NSObjectClass)
    ['{8D9D9CB4-F4D9-42A6-88AC-77630D393E49}']
  end;

  HMAccessorySetupManager = interface(NSObject)
    ['{835A5413-4BF4-48C9-B801-917BB9B0D0FE}']
    procedure performAccessorySetupUsingRequest
      (request: HMAccessorySetupRequest;
      completionHandler: THomeKitCompletionHandler1); cdecl;
  end;

  THMAccessorySetupManager = class
    (TOCGenericImport<HMAccessorySetupManagerClass, HMAccessorySetupManager>)
  end;

  PHMAccessorySetupManager = Pointer;

  HMAccessoryOwnershipTokenClass = interface(NSObjectClass)
    ['{4BE7CC6F-1655-472C-8E3F-216C90CC3CE0}']
  end;

  HMAccessoryOwnershipToken = interface(NSObject)
    ['{4CC53A71-D799-450F-9CBA-880E41E89F48}']
    function initWithData(data: NSData): Pointer { instancetype }; cdecl;
  end;

  THMAccessoryOwnershipToken = class
    (TOCGenericImport<HMAccessoryOwnershipTokenClass,
    HMAccessoryOwnershipToken>)
  end;

  PHMAccessoryOwnershipToken = Pointer;

  HMAccessorySetupPayloadClass = interface(NSObjectClass)
    ['{BB6FCBFB-DDB5-40E7-93CE-1D371AF10109}']
  end;

  HMAccessorySetupPayload = interface(NSObject)
    ['{058A07DE-8510-427A-8F44-9350EB056912}']
    [MethodName('initWithURL:')]
    function initWithURL(setupPayloadURL: NSURL)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithURL:ownershipToken:')]
    function initWithURLOwnershipToken(setupPayloadURL: NSURL;
      ownershipToken: HMAccessoryOwnershipToken)
      : Pointer { instancetype }; cdecl;
  end;

  THMAccessorySetupPayload = class
    (TOCGenericImport<HMAccessorySetupPayloadClass, HMAccessorySetupPayload>)
  end;

  PHMAccessorySetupPayload = Pointer;

  HMActionClass = interface(NSObjectClass)
    ['{116F4DEC-1E6A-4A24-A516-7457179564F0}']
    { class } function new: Pointer { instancetype }; cdecl;
  end;

  HMAction = interface(NSObject)
    ['{695E9976-EAC5-4E0F-8021-37AD578DE32A}']
    function init: Pointer { instancetype }; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
  end;

  THMAction = class(TOCGenericImport<HMActionClass, HMAction>)
  end;

  PHMAction = Pointer;

  HMActionSetClass = interface(NSObjectClass)
    ['{A1E5ED95-E387-4812-98DF-07CFB6F455FA}']
  end;

  HMActionSet = interface(NSObject)
    ['{0FBD7451-0712-4110-89BD-3C4484665F05}']
    function name: NSString; cdecl;
    function actions: NSSet; cdecl;
    function isExecuting: Boolean; cdecl;
    function actionSetType: NSString; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
    function lastExecutionDate: NSDate; cdecl;
    procedure updateName(name: NSString;
      completionHandler: HMErrorBlock); cdecl;
    procedure addAction(action: HMAction;
      completionHandler: HMErrorBlock); cdecl;
    procedure removeAction(action: HMAction;
      completionHandler: HMErrorBlock); cdecl;
  end;

  THMActionSet = class(TOCGenericImport<HMActionSetClass, HMActionSet>)
  end;

  PHMActionSet = Pointer;

  HMAddAccessoryRequestClass = interface(NSObjectClass)
    ['{A3237ADC-426C-4CC2-8DF6-8CA0439BCCAD}']
  end;

  HMAddAccessoryRequest = interface(NSObject)
    ['{2FE37386-47D2-4F2C-AE8B-A9C7B4310E9C}']
    function home: HMHome; cdecl;
    function accessoryName: NSString; cdecl;
    function accessoryCategory: HMAccessoryCategory; cdecl;
    function requiresSetupPayloadURL: Boolean; cdecl;
    function requiresOwnershipToken: Boolean; cdecl;
    function payloadWithOwnershipToken(ownershipToken
      : HMAccessoryOwnershipToken): HMAccessorySetupPayload; cdecl;
    function payloadWithURL(setupPayloadURL: NSURL;
      ownershipToken: HMAccessoryOwnershipToken)
      : HMAccessorySetupPayload; cdecl;
  end;

  THMAddAccessoryRequest = class(TOCGenericImport<HMAddAccessoryRequestClass,
    HMAddAccessoryRequest>)
  end;

  PHMAddAccessoryRequest = Pointer;

  HMEventClass = interface(NSObjectClass)
    ['{FD31491D-73A3-41E6-9BA9-DE24B502A55A}']
    { class } function new: Pointer { instancetype }; cdecl;
    { class } function isSupportedForHome(home: HMHome): Boolean; cdecl;
  end;

  HMEvent = interface(NSObject)
    ['{EAB12E3F-B468-462A-AB98-41D232287D12}']
    function init: Pointer { instancetype }; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
  end;

  THMEvent = class(TOCGenericImport<HMEventClass, HMEvent>)
  end;

  PHMEvent = Pointer;

  HMTimeEventClass = interface(HMEventClass)
    ['{7A2D5A4F-1EC6-4882-BAB3-F0309F3FE37F}']
  end;

  HMTimeEvent = interface(HMEvent)
    ['{70C19947-7685-4595-9F95-4A7D4774A54B}']
  end;

  THMTimeEvent = class(TOCGenericImport<HMTimeEventClass, HMTimeEvent>)
  end;

  PHMTimeEvent = Pointer;

  HMCalendarEventClass = interface(HMTimeEventClass)
    ['{28765718-CC6E-4786-AEF8-C3AA9032D9AE}']
  end;

  HMCalendarEvent = interface(HMTimeEvent)
    ['{88848252-D449-4BAC-906A-742D3E3A190F}']
    function initWithFireDateComponents(fireDateComponents: NSDateComponents)
      : Pointer { instancetype }; cdecl;
    function fireDateComponents: NSDateComponents; cdecl;
  end;

  THMCalendarEvent = class(TOCGenericImport<HMCalendarEventClass,
    HMCalendarEvent>)
  end;

  PHMCalendarEvent = Pointer;

  HMMutableCalendarEventClass = interface(HMCalendarEventClass)
    ['{FF7E6E1D-4694-4B0E-B16F-789DDB1B8E7B}']
  end;

  HMMutableCalendarEvent = interface(HMCalendarEvent)
    ['{B600B856-2B00-41F9-829C-20E065F21E21}']
    procedure setFireDateComponents(fireDateComponents
      : NSDateComponents); cdecl;
    function fireDateComponents: NSDateComponents; cdecl;
  end;

  THMMutableCalendarEvent = class(TOCGenericImport<HMMutableCalendarEventClass,
    HMMutableCalendarEvent>)
  end;

  PHMMutableCalendarEvent = Pointer;

  HMCameraControlClass = interface(NSObjectClass)
    ['{80AE9378-2C78-478D-8C2F-7688DEA41C8D}']
  end;

  HMCameraControl = interface(NSObject)
    ['{FA1420D7-C73C-446B-9715-F018E21720E9}']
  end;

  THMCameraControl = class(TOCGenericImport<HMCameraControlClass,
    HMCameraControl>)
  end;

  PHMCameraControl = Pointer;

  HMCameraAudioControlClass = interface(HMCameraControlClass)
    ['{1B679760-3EDE-4199-8F27-548A6AB02D7D}']
  end;

  HMCameraAudioControl = interface(HMCameraControl)
    ['{AA014153-1D2F-4C94-91E0-4CFA12378761}']
    function mute: HMCharacteristic; cdecl;
    function volume: HMCharacteristic; cdecl;
  end;

  THMCameraAudioControl = class(TOCGenericImport<HMCameraAudioControlClass,
    HMCameraAudioControl>)
  end;

  PHMCameraAudioControl = Pointer;

  HMCameraStreamControlClass = interface(HMCameraControlClass)
    ['{B7FFCD98-2EA6-4DA3-A3C9-18B502F42C62}']
  end;

  HMCameraStreamControl = interface(HMCameraControl)
    ['{450B8517-E4B1-474D-92E1-CB823B7DD942}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function streamState: HMCameraStreamState; cdecl;
    function cameraStream: HMCameraStream; cdecl;
    procedure startStream; cdecl;
    procedure stopStream; cdecl;
  end;

  THMCameraStreamControl = class(TOCGenericImport<HMCameraStreamControlClass,
    HMCameraStreamControl>)
  end;

  PHMCameraStreamControl = Pointer;

  HMCameraSnapshotControlClass = interface(HMCameraControlClass)
    ['{23C701DB-E633-4898-8800-83A91D3B46E1}']
  end;

  HMCameraSnapshotControl = interface(HMCameraControl)
    ['{51742D71-8559-4B66-A62D-CD922B434614}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function mostRecentSnapshot: HMCameraSnapshot; cdecl;
    procedure takeSnapshot; cdecl;
  end;

  THMCameraSnapshotControl = class
    (TOCGenericImport<HMCameraSnapshotControlClass, HMCameraSnapshotControl>)
  end;

  PHMCameraSnapshotControl = Pointer;

  HMCameraSettingsControlClass = interface(HMCameraControlClass)
    ['{EBD87464-F969-41FA-8772-0C71A4AB4636}']
  end;

  HMCameraSettingsControl = interface(HMCameraControl)
    ['{7BEFE579-E258-4426-B8D4-63E9E64DE134}']
    function nightVision: HMCharacteristic; cdecl;
    function currentHorizontalTilt: HMCharacteristic; cdecl;
    function targetHorizontalTilt: HMCharacteristic; cdecl;
    function currentVerticalTilt: HMCharacteristic; cdecl;
    function targetVerticalTilt: HMCharacteristic; cdecl;
    function opticalZoom: HMCharacteristic; cdecl;
    function digitalZoom: HMCharacteristic; cdecl;
    function imageRotation: HMCharacteristic; cdecl;
    function imageMirroring: HMCharacteristic; cdecl;
  end;

  THMCameraSettingsControl = class
    (TOCGenericImport<HMCameraSettingsControlClass, HMCameraSettingsControl>)
  end;

  PHMCameraSettingsControl = Pointer;

  HMCameraSourceClass = interface(NSObjectClass)
    ['{6EDE49B1-70D9-4B9D-B661-E4E1E6ACDED3}']
  end;

  HMCameraSource = interface(NSObject)
    ['{C6D46E4B-3238-4378-9D46-ED3EF1345A73}']
    function aspectRatio: Double; cdecl;
  end;

  THMCameraSource = class(TOCGenericImport<HMCameraSourceClass, HMCameraSource>)
  end;

  PHMCameraSource = Pointer;

  HMCameraSnapshotClass = interface(HMCameraSourceClass)
    ['{8F7B8B0B-0836-47CB-AB27-4D13330D3A0B}']
  end;

  HMCameraSnapshot = interface(HMCameraSource)
    ['{A153E1F7-C27B-42DF-8DEE-390A101203F2}']
    function captureDate: NSDate; cdecl;
  end;

  THMCameraSnapshot = class(TOCGenericImport<HMCameraSnapshotClass,
    HMCameraSnapshot>)
  end;

  PHMCameraSnapshot = Pointer;

  HMCameraStreamClass = interface(HMCameraSourceClass)
    ['{D991B6F6-EA0D-4F9C-8623-1F65EDB11EDE}']
  end;

  HMCameraStream = interface(HMCameraSource)
    ['{70FACFC6-2D0F-4A05-9536-27C0C5229B5F}']
    function audioStreamSetting: HMCameraAudioStreamSetting; cdecl;
    procedure setAudioStreamSetting(audioStreamSetting
      : HMCameraAudioStreamSetting); cdecl;
    procedure updateAudioStreamSetting(audioStreamSetting
      : HMCameraAudioStreamSetting;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMCameraStream = class(TOCGenericImport<HMCameraStreamClass, HMCameraStream>)
  end;

  PHMCameraStream = Pointer;

  HMCameraViewClass = interface(UIViewClass)
    ['{A4A146F8-01C3-480B-BE80-D291EFD456D5}']
  end;

  HMCameraView = interface(UIView)
    ['{46975488-5133-435F-A5BA-89A479BCC996}']
    procedure setCameraSource(cameraSource: HMCameraSource); cdecl;
    function cameraSource: HMCameraSource; cdecl;
  end;

  THMCameraView = class(TOCGenericImport<HMCameraViewClass, HMCameraView>)
  end;

  PHMCameraView = Pointer;

  HMCharacteristicMetadataClass = interface(NSObjectClass)
    ['{00A82465-F881-467F-ACFD-965963B9BDCA}']
  end;

  HMCharacteristicMetadata = interface(NSObject)
    ['{DF2E5698-4A40-4123-BAD5-1928575098B8}']
    function minimumValue: NSNumber; cdecl;
    function maximumValue: NSNumber; cdecl;
    function stepValue: NSNumber; cdecl;
    function maxLength: NSNumber; cdecl;
    function format: NSString; cdecl;
    function units: NSString; cdecl;
    function manufacturerDescription: NSString; cdecl;
    function validValues: NSArray; cdecl;
  end;

  THMCharacteristicMetadata = class
    (TOCGenericImport<HMCharacteristicMetadataClass, HMCharacteristicMetadata>)
  end;

  PHMCharacteristicMetadata = Pointer;

  HMCharacteristicEventClass = interface(HMEventClass)
    ['{242E7CD9-DD23-4F82-9C07-EC85F7FC81E5}']
  end;

  HMCharacteristicEvent = interface(HMEvent)
    ['{551187C9-E850-4EAF-BE1E-E3C90FA03C0D}']
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

  HMMutableCharacteristicEventClass = interface(HMCharacteristicEventClass)
    ['{782629CF-0645-41FC-A1E2-DF6174C71ACF}']
  end;

  HMMutableCharacteristicEvent = interface(HMCharacteristicEvent)
    ['{9ABAB5C3-2FE5-4EFC-9093-9E4E279AE86D}']
    procedure setCharacteristic(characteristic: HMCharacteristic); cdecl;
    function characteristic: HMCharacteristic; cdecl;
    procedure setTriggerValue(triggerValue: TriggerValueType); cdecl;
    function triggerValue: TriggerValueType; cdecl;
  end;

  THMMutableCharacteristicEvent = class
    (TOCGenericImport<HMMutableCharacteristicEventClass,
    HMMutableCharacteristicEvent>)
  end;

  PHMMutableCharacteristicEvent = Pointer;

  HMNumberRangeClass = interface(NSObjectClass)
    ['{0446306E-E611-40BD-89D1-D740CC8ECC31}']
    [MethodName('numberRangeWithMinValue:maxValue:')]
    { class } function numberRangeWithMinValueMaxValue(minValue: NSNumber;
      maxValue: NSNumber): Pointer { instancetype }; cdecl;
    [MethodName('numberRangeWithMinValue:')]
    { class } function numberRangeWithMinValue(minValue: NSNumber)
      : Pointer { instancetype }; cdecl;
    { class } function numberRangeWithMaxValue(maxValue: NSNumber)
      : Pointer { instancetype }; cdecl;
  end;

  HMNumberRange = interface(NSObject)
    ['{5B19575E-F5E4-4306-B545-40F22CB00B2A}']
    function minValue: NSNumber; cdecl;
    function maxValue: NSNumber; cdecl;
  end;

  THMNumberRange = class(TOCGenericImport<HMNumberRangeClass, HMNumberRange>)
  end;

  PHMNumberRange = Pointer;

  HMCharacteristicThresholdRangeEventClass = interface(HMEventClass)
    ['{F59599AA-4A75-49E0-8204-660C74A23FE2}']
  end;

  HMCharacteristicThresholdRangeEvent = interface(HMEvent)
    ['{C3365006-740D-4921-965E-EAE21FE86761}']
    function initWithCharacteristic(characteristic: HMCharacteristic;
      thresholdRange: HMNumberRange): Pointer { instancetype }; cdecl;
    function characteristic: HMCharacteristic; cdecl;
    function thresholdRange: HMNumberRange; cdecl;
  end;

  THMCharacteristicThresholdRangeEvent = class
    (TOCGenericImport<HMCharacteristicThresholdRangeEventClass,
    HMCharacteristicThresholdRangeEvent>)
  end;

  PHMCharacteristicThresholdRangeEvent = Pointer;

  HMMutableCharacteristicThresholdRangeEventClass = interface
    (HMCharacteristicThresholdRangeEventClass)
    ['{1545EA07-8298-4E30-8B6D-F4E8F07BE0C7}']
  end;

  HMMutableCharacteristicThresholdRangeEvent = interface
    (HMCharacteristicThresholdRangeEvent)
    ['{70AB3D6E-1D55-41F9-BD07-E666F7B84061}']
    procedure setCharacteristic(characteristic: HMCharacteristic); cdecl;
    function characteristic: HMCharacteristic; cdecl;
    procedure setThresholdRange(thresholdRange: HMNumberRange); cdecl;
    function thresholdRange: HMNumberRange; cdecl;
  end;

  THMMutableCharacteristicThresholdRangeEvent = class
    (TOCGenericImport<HMMutableCharacteristicThresholdRangeEventClass,
    HMMutableCharacteristicThresholdRangeEvent>)
  end;

  PHMMutableCharacteristicThresholdRangeEvent = Pointer;

  HMCharacteristicWriteActionClass = interface(HMActionClass)
    ['{F20F3704-3275-45D0-B5DA-8DF3B4EE6177}']
  end;

  HMCharacteristicWriteAction = interface(HMAction)
    ['{F277E143-ADEB-4E27-9BEE-0B03D52B8CEC}']
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

  HMDurationEventClass = interface(HMTimeEventClass)
    ['{F5FD53A7-4625-427F-B591-43CE0706E5ED}']
  end;

  HMDurationEvent = interface(HMTimeEvent)
    ['{DFD200B2-0F08-42D4-B0F2-89EF24722E17}']
    function initWithDuration(duration: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
    function duration: NSTimeInterval; cdecl;
  end;

  THMDurationEvent = class(TOCGenericImport<HMDurationEventClass,
    HMDurationEvent>)
  end;

  PHMDurationEvent = Pointer;

  HMMutableDurationEventClass = interface(HMDurationEventClass)
    ['{3B9C5E7C-9B82-4893-94B1-3433827D5734}']
  end;

  HMMutableDurationEvent = interface(HMDurationEvent)
    ['{A94E3077-3DC7-41A7-B0CA-7F2903029083}']
    procedure setDuration(duration: NSTimeInterval); cdecl;
    function duration: NSTimeInterval; cdecl;
  end;

  THMMutableDurationEvent = class(TOCGenericImport<HMMutableDurationEventClass,
    HMMutableDurationEvent>)
  end;

  PHMMutableDurationEvent = Pointer;

  HMSignificantTimeEventClass = interface(HMTimeEventClass)
    ['{2EC96B40-3555-4377-A24F-FDBD20B7954D}']
  end;

  HMSignificantTimeEvent = interface(HMTimeEvent)
    ['{237CD623-C4FF-49B2-8652-A850ED265657}']
    function initWithSignificantEvent(significantEvent: HMSignificantEvent;
      offset: NSDateComponents): Pointer { instancetype }; cdecl;
    function significantEvent: HMSignificantEvent; cdecl;
    function offset: NSDateComponents; cdecl;
  end;

  THMSignificantTimeEvent = class(TOCGenericImport<HMSignificantTimeEventClass,
    HMSignificantTimeEvent>)
  end;

  PHMSignificantTimeEvent = Pointer;

  HMMutableSignificantTimeEventClass = interface(HMSignificantTimeEventClass)
    ['{6E2F3A80-C88A-4BC2-B7DE-C88399230192}']
  end;

  HMMutableSignificantTimeEvent = interface(HMSignificantTimeEvent)
    ['{92CB90C8-6BF1-4A94-8DDD-5AA0A37A999F}']
    procedure setSignificantEvent(significantEvent: HMSignificantEvent); cdecl;
    function significantEvent: HMSignificantEvent; cdecl;
    procedure setOffset(offset: NSDateComponents); cdecl;
    function offset: NSDateComponents; cdecl;
  end;

  THMMutableSignificantTimeEvent = class
    (TOCGenericImport<HMMutableSignificantTimeEventClass,
    HMMutableSignificantTimeEvent>)
  end;

  PHMMutableSignificantTimeEvent = Pointer;

  HMTriggerClass = interface(NSObjectClass)
    ['{9B7B2ACD-91A6-4B63-9D2E-05D01EDE46B7}']
  end;

  HMTrigger = interface(NSObject)
    ['{1DB898FD-5BDD-43C1-B2FA-123FB4C4B7E8}']
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

  HMPresenceEventClass = interface(HMEventClass)
    ['{F2F7D984-F5DF-40FC-8518-15F98AA64F46}']
  end;

  HMPresenceEvent = interface(HMEvent)
    ['{915E1DDC-7FEF-4CF8-8D75-5F6289239A70}']
    function initWithPresenceEventType(presenceEventType: HMPresenceEventType;
      presenceUserType: HMPresenceEventUserType)
      : Pointer { instancetype }; cdecl;
    function presenceEventType: HMPresenceEventType; cdecl;
    function presenceUserType: HMPresenceEventUserType; cdecl;
  end;

  THMPresenceEvent = class(TOCGenericImport<HMPresenceEventClass,
    HMPresenceEvent>)
  end;

  PHMPresenceEvent = Pointer;

  HMEventTriggerClass = interface(HMTriggerClass)
    ['{162E670F-921B-434A-9FCC-D0907E83C0AE}']
    [MethodName
      ('predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:applyingOffset:')
      ]
    { class } function
      predicateForEvaluatingTriggerOccurringBeforeSignificantEventApplyingOffset
      (significantEvent: NSString; applyingOffset: NSDateComponents)
      : NSPredicate; cdecl;
    [MethodName
      ('predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:')]
    { class } function
      predicateForEvaluatingTriggerOccurringBeforeSignificantEvent
      (significantEvent: HMSignificantTimeEvent): NSPredicate; cdecl;
    [MethodName
      ('predicateForEvaluatingTriggerOccurringAfterSignificantEvent:applyingOffset:')
      ]
    { class } function
      predicateForEvaluatingTriggerOccurringAfterSignificantEventApplyingOffset
      (significantEvent: NSString; applyingOffset: NSDateComponents)
      : NSPredicate; cdecl;
    [MethodName('predicateForEvaluatingTriggerOccurringAfterSignificantEvent:')]
    { class } function
      predicateForEvaluatingTriggerOccurringAfterSignificantEvent
      (significantEvent: HMSignificantTimeEvent): NSPredicate; cdecl;
    { class } function
      predicateForEvaluatingTriggerOccurringBetweenSignificantEvent
      (firstSignificantEvent: HMSignificantTimeEvent;
      secondSignificantEvent: HMSignificantTimeEvent): NSPredicate; cdecl;
    { class } function
      predicateForEvaluatingTriggerOccurringBeforeDateWithComponents
      (dateComponents: NSDateComponents): NSPredicate; cdecl;
    { class } function
      predicateForEvaluatingTriggerOccurringOnDateWithComponents
      (dateComponents: NSDateComponents): NSPredicate; cdecl;
    { class } function
      predicateForEvaluatingTriggerOccurringAfterDateWithComponents
      (dateComponents: NSDateComponents): NSPredicate; cdecl;
    { class } function
      predicateForEvaluatingTriggerOccurringBetweenDateWithComponents
      (firstDateComponents: NSDateComponents;
      secondDateWithComponents: NSDateComponents): NSPredicate; cdecl;
    { class } function predicateForEvaluatingTriggerWithCharacteristic
      (characteristic: HMCharacteristic; relatedBy: NSPredicateOperatorType;
      toValue: Pointer): NSPredicate; cdecl;
    { class } function predicateForEvaluatingTriggerWithPresence
      (presenceEvent: HMPresenceEvent): NSPredicate; cdecl;
  end;

  HMEventTrigger = interface(HMTrigger)
    ['{92925793-2348-4ECE-B908-35BD139FB9F4}']
    [MethodName('initWithName:events:predicate:')]
    function initWithNameEventsPredicate(name: NSString; events: NSArray;
      predicate: NSPredicate): Pointer { instancetype }; cdecl;
    [MethodName('initWithName:events:endEvents:recurrences:predicate:')]
    function initWithNameEventsEndEventsRecurrencesPredicate(name: NSString;
      events: NSArray; endEvents: NSArray; recurrences: NSArray;
      predicate: NSPredicate): Pointer { instancetype }; cdecl;
    function events: NSArray; cdecl;
    function endEvents: NSArray; cdecl;
    function predicate: NSPredicate; cdecl;
    function recurrences: NSArray; cdecl;
    function executeOnce: Boolean; cdecl;
    function triggerActivationState: HMEventTriggerActivationState; cdecl;
    procedure addEvent(event: HMEvent;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure removeEvent(event: HMEvent;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure updateEvents(events: NSArray;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure updateEndEvents(endEvents: NSArray;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure updatePredicate(predicate: NSPredicate;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure updateRecurrences(recurrences: NSArray;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure updateExecuteOnce(executeOnce: Boolean;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMEventTrigger = class(TOCGenericImport<HMEventTriggerClass, HMEventTrigger>)
  end;

  PHMEventTrigger = Pointer;

  HMHomeManagerClass = interface(NSObjectClass)
    ['{6D49B77E-C1CD-4389-964A-438711F4E1E3}']
  end;

  HMHomeManager = interface(NSObject)
    ['{FAAA99AA-ACD7-48D8-83F2-8C3D6CD49585}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function authorizationStatus: HMHomeManagerAuthorizationStatus; cdecl;
    function primaryHome: HMHome; cdecl;
    function homes: NSArray; cdecl;
    procedure updatePrimaryHome(home: HMHome;
      completionHandler: THomeKitCompletionHandler); cdecl;
    procedure addHomeWithName(homeName: NSString;
      completionHandler: THomeKitCompletionHandler7); cdecl;
    procedure removeHome(home: HMHome;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMHomeManager = class(TOCGenericImport<HMHomeManagerClass, HMHomeManager>)
  end;

  PHMHomeManager = Pointer;

  HMZoneClass = interface(NSObjectClass)
    ['{BEC70739-F0AD-4646-A443-08A15964C263}']
  end;

  HMZone = interface(NSObject)
    ['{97285998-1CB9-4B08-A854-968A40C64935}']
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
    ['{AB9FCF77-605D-47E6-BDED-A63FAFAB36DB}']
  end;

  HMServiceGroup = interface(NSObject)
    ['{583DED83-41AE-4D1C-B843-54A3BCC4ADFF}']
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
    ['{564C4B98-A5FD-41BD-9220-E58F0A5E2FF3}']
  end;

  HMUser = interface(NSObject)
    ['{7609CE69-44E4-4EEA-B410-F17F2437C067}']
    function name: NSString; cdecl;
    function uniqueIdentifier: NSUUID; cdecl;
  end;

  THMUser = class(TOCGenericImport<HMUserClass, HMUser>)
  end;

  PHMUser = Pointer;

  HMHomeAccessControlClass = interface(HMAccessControlClass)
    ['{0C3A1363-4A26-426B-A570-46C0357AF6AC}']
  end;

  HMHomeAccessControl = interface(HMAccessControl)
    ['{52E6A73F-E426-44F2-BAAD-9E5EFD056557}']
    function isAdministrator: Boolean; cdecl;
  end;

  THMHomeAccessControl = class(TOCGenericImport<HMHomeAccessControlClass,
    HMHomeAccessControl>)
  end;

  PHMHomeAccessControl = Pointer;

  HMLocationEventClass = interface(HMEventClass)
    ['{5E8014D9-DFF8-4755-B82A-129479F46028}']
  end;

  HMLocationEvent = interface(HMEvent)
    ['{07FF2E65-D5DA-4946-8D76-4F95477C3C8E}']
    function initWithRegion(region: CLRegion): Pointer { instancetype }; cdecl;
    function region: CLRegion; cdecl;
    procedure updateRegion(region: CLRegion;
      completionHandler: THomeKitCompletionHandler); cdecl;
  end;

  THMLocationEvent = class(TOCGenericImport<HMLocationEventClass,
    HMLocationEvent>)
  end;

  PHMLocationEvent = Pointer;

  HMMutableLocationEventClass = interface(HMLocationEventClass)
    ['{466DEB44-F664-489C-87BC-4A2CE9D0FB12}']
  end;

  HMMutableLocationEvent = interface(HMLocationEvent)
    ['{71ABCA21-E00D-423F-A578-9F6120A55DAF}']
    procedure setRegion(region: CLRegion); cdecl;
    function region: CLRegion; cdecl;
  end;

  THMMutableLocationEvent = class(TOCGenericImport<HMMutableLocationEventClass,
    HMMutableLocationEvent>)
  end;

  PHMMutableLocationEvent = Pointer;

  HMNetworkConfigurationProfileClass = interface(HMAccessoryProfileClass)
    ['{9FFD49F6-B939-4115-AC24-17275D3C399E}']
  end;

  HMNetworkConfigurationProfile = interface(HMAccessoryProfile)
    ['{80E9AF39-C446-4C68-A3F5-911C940D555D}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function isNetworkAccessRestricted: Boolean; cdecl;
  end;

  THMNetworkConfigurationProfile = class
    (TOCGenericImport<HMNetworkConfigurationProfileClass,
    HMNetworkConfigurationProfile>)
  end;

  PHMNetworkConfigurationProfile = Pointer;

  HMMutablePresenceEventClass = interface(HMPresenceEventClass)
    ['{50135FA5-62EE-4555-80C9-FBB6CDB37C5A}']
  end;

  HMMutablePresenceEvent = interface(HMPresenceEvent)
    ['{8E40FD7C-A60F-4796-B4B4-661827477B11}']
    procedure setPresenceEventType(presenceEventType
      : HMPresenceEventType); cdecl;
    function presenceEventType: HMPresenceEventType; cdecl;
    procedure setPresenceUserType(presenceUserType
      : HMPresenceEventUserType); cdecl;
    function presenceUserType: HMPresenceEventUserType; cdecl;
  end;

  THMMutablePresenceEvent = class(TOCGenericImport<HMMutablePresenceEventClass,
    HMMutablePresenceEvent>)
  end;

  PHMMutablePresenceEvent = Pointer;

  HMTimerTriggerClass = interface(HMTriggerClass)
    ['{EA589A34-6254-4407-8891-D9A1FABC6D95}']
  end;

  HMTimerTrigger = interface(HMTrigger)
    ['{3FAB9A24-2AAD-4642-B711-A40631C524F0}']
    [MethodName('initWithName:fireDate:recurrence:')]
    function initWithNameFireDateRecurrence(name: NSString; fireDate: NSDate;
      recurrence: NSDateComponents): Pointer { instancetype }; cdecl;
    [MethodName
      ('initWithName:fireDate:timeZone:recurrence:recurrenceCalendar:')]
    function initWithNameFireDateTimeZoneRecurrenceRecurrenceCalendar
      (name: NSString; fireDate: NSDate; timeZone: NSTimeZone;
      recurrence: NSDateComponents; recurrenceCalendar: NSCalendar)
      : Pointer { instancetype }; cdecl;
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
    ['{9B2BB6C5-5608-437F-A817-95D63D2D694F}']
    procedure accessoryDidUpdateName(accessory: HMAccessory); cdecl;
    [MethodName('accessory:didUpdateNameForService:')]
    procedure accessoryDidUpdateNameForService(accessory: HMAccessory;
      didUpdateNameForService: HMService); cdecl;
    [MethodName('accessory:didUpdateAssociatedServiceTypeForService:')]
    procedure accessoryDidUpdateAssociatedServiceTypeForService
      (accessory: HMAccessory; didUpdateAssociatedServiceTypeForService
      : HMService); cdecl;
    procedure accessoryDidUpdateServices(accessory: HMAccessory); cdecl;
    [MethodName('accessory:didAddProfile:')]
    procedure accessoryDidAddProfile(accessory: HMAccessory;
      didAddProfile: HMAccessoryProfile); cdecl;
    [MethodName('accessory:didRemoveProfile:')]
    procedure accessoryDidRemoveProfile(accessory: HMAccessory;
      didRemoveProfile: HMAccessoryProfile); cdecl;
    procedure accessoryDidUpdateReachability(accessory: HMAccessory); cdecl;
    [MethodName('accessory:service:didUpdateValueForCharacteristic:')]
    procedure accessoryServiceDidUpdateValueForCharacteristic
      (accessory: HMAccessory; service: HMService;
      didUpdateValueForCharacteristic: HMCharacteristic); cdecl;
    [MethodName('accessory:didUpdateFirmwareVersion:')]
    procedure accessoryDidUpdateFirmwareVersion(accessory: HMAccessory;
      didUpdateFirmwareVersion: NSString); cdecl;
  end;

  HMAccessoryBrowserDelegate = interface(IObjectiveC)
    ['{3F896162-20E8-4ADB-B041-699DB6F6C488}']
    [MethodName('accessoryBrowser:didFindNewAccessory:')]
    procedure accessoryBrowserDidFindNewAccessory(browser: HMAccessoryBrowser;
      didFindNewAccessory: HMAccessory); cdecl;
    [MethodName('accessoryBrowser:didRemoveNewAccessory:')]
    procedure accessoryBrowserDidRemoveNewAccessory(browser: HMAccessoryBrowser;
      didRemoveNewAccessory: HMAccessory); cdecl;
  end;

  HMCameraSnapshotControlDelegate = interface(IObjectiveC)
    ['{D7186890-028D-4EA5-8AAF-8DDF8F4C5D60}']
    procedure cameraSnapshotControl(cameraSnapshotControl
      : HMCameraSnapshotControl; didTakeSnapshot: HMCameraSnapshot;
      error: NSError); cdecl;
    procedure cameraSnapshotControlDidUpdateMostRecentSnapshot
      (cameraSnapshotControl: HMCameraSnapshotControl); cdecl;
  end;

  HMCameraStreamControlDelegate = interface(IObjectiveC)
    ['{1B0A1582-15E1-401C-BF79-D470829A222D}']
    procedure cameraStreamControlDidStartStream(cameraStreamControl
      : HMCameraStreamControl); cdecl;
    procedure cameraStreamControl(cameraStreamControl: HMCameraStreamControl;
      didStopStreamWithError: NSError); cdecl;
  end;

  HMHomeDelegate = interface(IObjectiveC)
    ['{33545ECD-2287-41B5-BF63-A542117A8DB0}']
    procedure homeDidUpdateName(home: HMHome); cdecl;
    procedure homeDidUpdateAccessControlForCurrentUser(home: HMHome); cdecl;
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
    [MethodName('home:didUpdateHomeHubState:')]
    procedure homeDidUpdateHomeHubState(home: HMHome;
      didUpdateHomeHubState: HMHomeHubState); cdecl;
    procedure homeDidUpdateSupportedFeatures(home: HMHome); cdecl;
  end;

  HMHomeManagerDelegate = interface(IObjectiveC)
    ['{3CF18FE3-4CFD-44DD-A899-8753C4591BB8}']
    [MethodName('homeManager:didUpdateAuthorizationStatus:')]
    procedure homeManagerDidUpdateAuthorizationStatus(manager: HMHomeManager;
      didUpdateAuthorizationStatus: HMHomeManagerAuthorizationStatus); cdecl;
    procedure homeManagerDidUpdateHomes(manager: HMHomeManager); cdecl;
    procedure homeManagerDidUpdatePrimaryHome(manager: HMHomeManager); cdecl;
    [MethodName('homeManager:didAddHome:')]
    procedure homeManagerDidAddHome(manager: HMHomeManager;
      didAddHome: HMHome); cdecl;
    [MethodName('homeManager:didRemoveHome:')]
    procedure homeManagerDidRemoveHome(manager: HMHomeManager;
      didRemoveHome: HMHome); cdecl;
    [MethodName('homeManager:didReceiveAddAccessoryRequest:')]
    procedure homeManagerDidReceiveAddAccessoryRequest(manager: HMHomeManager;
      didReceiveAddAccessoryRequest: HMAddAccessoryRequest); cdecl;
  end;

  HMNetworkConfigurationProfileDelegate = interface(IObjectiveC)
    ['{23FFF29B-5A92-461C-B49F-BF4213362CE9}']
    procedure profileDidUpdateNetworkAccessMode
      (profile: HMNetworkConfigurationProfile); cdecl;
  end;

  // ===== Exported string consts =====

function HMAccessoryCategoryTypeOther: NSString;
function HMAccessoryCategoryTypeSecuritySystem: NSString;
function HMAccessoryCategoryTypeBridge: NSString;
function HMAccessoryCategoryTypeDoor: NSString;
function HMAccessoryCategoryTypeDoorLock: NSString;
function HMAccessoryCategoryTypeFan: NSString;
function HMAccessoryCategoryTypeGarageDoorOpener: NSString;
function HMAccessoryCategoryTypeIPCamera: NSString;
function HMAccessoryCategoryTypeLightbulb: NSString;
function HMAccessoryCategoryTypeOutlet: NSString;
function HMAccessoryCategoryTypeProgrammableSwitch: NSString;
function HMAccessoryCategoryTypeRangeExtender: NSString;
function HMAccessoryCategoryTypeSensor: NSString;
function HMAccessoryCategoryTypeSwitch: NSString;
function HMAccessoryCategoryTypeThermostat: NSString;
function HMAccessoryCategoryTypeVideoDoorbell: NSString;
function HMAccessoryCategoryTypeWindow: NSString;
function HMAccessoryCategoryTypeWindowCovering: NSString;
function HMAccessoryCategoryTypeAirPurifier: NSString;
function HMAccessoryCategoryTypeAirHeater: NSString;
function HMAccessoryCategoryTypeAirConditioner: NSString;
function HMAccessoryCategoryTypeAirHumidifier: NSString;
function HMAccessoryCategoryTypeAirDehumidifier: NSString;
function HMAccessoryCategoryTypeSprinkler: NSString;
function HMAccessoryCategoryTypeFaucet: NSString;
function HMAccessoryCategoryTypeShowerHead: NSString;
function HMActionSetTypeWakeUp: NSString;
function HMActionSetTypeSleep: NSString;
function HMActionSetTypeHomeDeparture: NSString;
function HMActionSetTypeHomeArrival: NSString;
function HMActionSetTypeUserDefined: NSString;
function HMActionSetTypeTriggerOwned: NSString;
function HMCharacteristicPropertySupportsEventNotification: NSString;
function HMCharacteristicPropertyReadable: NSString;
function HMCharacteristicPropertyWritable: NSString;
function HMCharacteristicPropertyHidden: NSString;
function HMCharacteristicTypeTargetRelativeHumidity: NSString;
function HMCharacteristicTypeOutletInUse: NSString;
function HMCharacteristicTypeLogs: NSString;
function HMCharacteristicTypeAudioFeedback: NSString;
function HMCharacteristicTypeAdminOnlyAccess: NSString;
function HMCharacteristicTypeSecuritySystemAlarmType: NSString;
function HMCharacteristicTypeMotionDetected: NSString;
function HMCharacteristicTypeLockMechanismLastKnownAction: NSString;
function HMCharacteristicTypeLockManagementControlPoint: NSString;
function HMCharacteristicTypeLockManagementAutoSecureTimeout: NSString;
function HMCharacteristicTypeAirParticulateDensity: NSString;
function HMCharacteristicTypeAirParticulateSize: NSString;
function HMCharacteristicTypeAirQuality: NSString;
function HMCharacteristicTypeCarbonDioxideDetected: NSString;
function HMCharacteristicTypeCarbonDioxideLevel: NSString;
function HMCharacteristicTypeCarbonDioxidePeakLevel: NSString;
function HMCharacteristicTypeCarbonMonoxideDetected: NSString;
function HMCharacteristicTypeCarbonMonoxideLevel: NSString;
function HMCharacteristicTypeCarbonMonoxidePeakLevel: NSString;
function HMCharacteristicTypeContactState: NSString;
function HMCharacteristicTypeCurrentHorizontalTilt: NSString;
function HMCharacteristicTypeCurrentPosition: NSString;
function HMCharacteristicTypeCurrentSecuritySystemState: NSString;
function HMCharacteristicTypeCurrentVerticalTilt: NSString;
function HMCharacteristicTypeHoldPosition: NSString;
function HMCharacteristicTypeLeakDetected: NSString;
function HMCharacteristicTypeOccupancyDetected: NSString;
function HMCharacteristicTypeOutputState: NSString;
function HMCharacteristicTypePositionState: NSString;
function HMCharacteristicTypeStatusActive: NSString;
function HMCharacteristicTypeStatusFault: NSString;
function HMCharacteristicTypeStatusJammed: NSString;
function HMCharacteristicTypeStatusTampered: NSString;
function HMCharacteristicTypeTargetHorizontalTilt: NSString;
function HMCharacteristicTypeTargetSecuritySystemState: NSString;
function HMCharacteristicTypeTargetPosition: NSString;
function HMCharacteristicTypeTargetVerticalTilt: NSString;
function HMCharacteristicTypeStreamingStatus: NSString;
function HMCharacteristicTypeSetupStreamEndpoint: NSString;
function HMCharacteristicTypeSupportedVideoStreamConfiguration: NSString;
function HMCharacteristicTypeSupportedRTPConfiguration: NSString;
function HMCharacteristicTypeSelectedStreamConfiguration: NSString;
function HMCharacteristicTypeOpticalZoom: NSString;
function HMCharacteristicTypeDigitalZoom: NSString;
function HMCharacteristicTypeImageRotation: NSString;
function HMCharacteristicTypeImageMirroring: NSString;
function HMCharacteristicTypeLabelNamespace: NSString;
function HMCharacteristicTypeLabelIndex: NSString;
function HMCharacteristicTypeCurrentAirPurifierState: NSString;
function HMCharacteristicTypeTargetAirPurifierState: NSString;
function HMCharacteristicTypeCurrentSlatState: NSString;
function HMCharacteristicTypeFilterChangeIndication: NSString;
function HMCharacteristicTypeFilterLifeLevel: NSString;
function HMCharacteristicTypeFilterResetChangeIndication: NSString;
function HMCharacteristicTypeSlatType: NSString;
function HMCharacteristicTypeCurrentTilt: NSString;
function HMCharacteristicTypeTargetTilt: NSString;
function HMCharacteristicTypeOzoneDensity: NSString;
function HMCharacteristicTypeNitrogenDioxideDensity: NSString;
function HMCharacteristicTypeSulphurDioxideDensity: NSString;
function HMCharacteristicTypePM2_5Density: NSString;
function HMCharacteristicTypePM10Density: NSString;
function HMCharacteristicTypeVolatileOrganicCompoundDensity: NSString;
function HMCharacteristicTypeProgramMode: NSString;
function HMCharacteristicTypeInUse: NSString;
function HMCharacteristicTypeSetDuration: NSString;
function HMCharacteristicTypeRemainingDuration: NSString;
function HMCharacteristicTypeValveType: NSString;
function HMCharacteristicTypeBrightness: NSString;
function HMCharacteristicTypeCoolingThreshold: NSString;
function HMCharacteristicTypeCurrentDoorState: NSString;
function HMCharacteristicTypeCurrentHeatingCooling: NSString;
function HMCharacteristicTypeCurrentRelativeHumidity: NSString;
function HMCharacteristicTypeCurrentTemperature: NSString;
function HMCharacteristicTypeHeatingThreshold: NSString;
function HMCharacteristicTypeHue: NSString;
function HMCharacteristicTypeIdentify: NSString;
function HMCharacteristicTypeCurrentLockMechanismState: NSString;
function HMCharacteristicTypeTargetLockMechanismState: NSString;
function HMCharacteristicTypeManufacturer: NSString;
function HMCharacteristicTypeModel: NSString;
function HMCharacteristicTypeName: NSString;
function HMCharacteristicTypeObstructionDetected: NSString;
function HMCharacteristicTypePowerState: NSString;
function HMCharacteristicTypeRotationDirection: NSString;
function HMCharacteristicTypeRotationSpeed: NSString;
function HMCharacteristicTypeSaturation: NSString;
function HMCharacteristicTypeSerialNumber: NSString;
function HMCharacteristicTypeTargetDoorState: NSString;
function HMCharacteristicTypeTargetHeatingCooling: NSString;
function HMCharacteristicTypeTargetTemperature: NSString;
function HMCharacteristicTypeTemperatureUnits: NSString;
function HMCharacteristicTypeVersion: NSString;
function HMCharacteristicTypeFirmwareVersion: NSString;
function HMCharacteristicTypeHardwareVersion: NSString;
function HMCharacteristicTypeSoftwareVersion: NSString;
function HMCharacteristicTypeBatteryLevel: NSString;
function HMCharacteristicTypeCurrentLightLevel: NSString;
function HMCharacteristicTypeInputEvent: NSString;
function HMCharacteristicTypeSmokeDetected: NSString;
function HMCharacteristicTypeStatusLowBattery: NSString;
function HMCharacteristicTypeChargingState: NSString;
function HMCharacteristicTypeLockPhysicalControls: NSString;
function HMCharacteristicTypeCurrentFanState: NSString;
function HMCharacteristicTypeActive: NSString;
function HMCharacteristicTypeCurrentHeaterCoolerState: NSString;
function HMCharacteristicTypeTargetHeaterCoolerState: NSString;
function HMCharacteristicTypeCurrentHumidifierDehumidifierState: NSString;
function HMCharacteristicTypeTargetHumidifierDehumidifierState: NSString;
function HMCharacteristicTypeWaterLevel: NSString;
function HMCharacteristicTypeSwingMode: NSString;
function HMCharacteristicTypeTargetFanState: NSString;
function HMCharacteristicTypeDehumidifierThreshold: NSString;
function HMCharacteristicTypeHumidifierThreshold: NSString;
function HMCharacteristicTypeColorTemperature: NSString;
function HMCharacteristicTypeIsConfigured: NSString;
function HMCharacteristicTypeSupportedAudioStreamConfiguration: NSString;
function HMCharacteristicTypeVolume: NSString;
function HMCharacteristicTypeMute: NSString;
function HMCharacteristicTypeNightVision: NSString;
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
function HMCharacteristicMetadataUnitsPartsPerMillion: NSString;
function HMCharacteristicMetadataUnitsMicrogramsPerCubicMeter: NSString;
function HMErrorDomain: NSString;
function HMSignificantEventSunrise: Pointer;
function HMSignificantEventSunset: Pointer;
function HMCharacteristicKeyPath: NSString;
function HMCharacteristicValueKeyPath: NSString;
function HMPresenceKeyPath: NSString;
function HMUserFailedAccessoriesKey: NSString;
function HMServiceTypeSwitch: NSString;
function HMServiceTypeThermostat: NSString;
function HMServiceTypeOutlet: NSString;
function HMServiceTypeLockManagement: NSString;
function HMServiceTypeAirQualitySensor: NSString;
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
function HMServiceTypeCameraRTPStreamManagement: NSString;
function HMServiceTypeCameraControl: NSString;
function HMServiceTypeMicrophone: NSString;
function HMServiceTypeSpeaker: NSString;
function HMServiceTypeAirPurifier: NSString;
function HMServiceTypeFilterMaintenance: NSString;
function HMServiceTypeSlats: NSString;
function HMServiceTypeLabel: NSString;
function HMServiceTypeIrrigationSystem: NSString;
function HMServiceTypeValve: NSString;
function HMServiceTypeFaucet: NSString;
function HMServiceTypeAccessoryInformation: NSString;
function HMServiceTypeFan: NSString;
function HMServiceTypeGarageDoorOpener: NSString;
function HMServiceTypeLightbulb: NSString;
function HMServiceTypeLockMechanism: NSString;
function HMServiceTypeBattery: NSString;
function HMServiceTypeVentilationFan: NSString;
function HMServiceTypeHeaterCooler: NSString;
function HMServiceTypeHumidifierDehumidifier: NSString;
function HMServiceTypeDoorbell: NSString;


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

function HMAccessoryCategoryTypeIPCamera: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeIPCamera');
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

function HMAccessoryCategoryTypeRangeExtender: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMAccessoryCategoryTypeRangeExtender');
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

function HMAccessoryCategoryTypeVideoDoorbell: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMAccessoryCategoryTypeVideoDoorbell');
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

function HMAccessoryCategoryTypeAirPurifier: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMAccessoryCategoryTypeAirPurifier');
end;

function HMAccessoryCategoryTypeAirHeater: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeAirHeater');
end;

function HMAccessoryCategoryTypeAirConditioner: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMAccessoryCategoryTypeAirConditioner');
end;

function HMAccessoryCategoryTypeAirHumidifier: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMAccessoryCategoryTypeAirHumidifier');
end;

function HMAccessoryCategoryTypeAirDehumidifier: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMAccessoryCategoryTypeAirDehumidifier');
end;

function HMAccessoryCategoryTypeSprinkler: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeSprinkler');
end;

function HMAccessoryCategoryTypeFaucet: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeFaucet');
end;

function HMAccessoryCategoryTypeShowerHead: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMAccessoryCategoryTypeShowerHead');
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

function HMActionSetTypeTriggerOwned: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMActionSetTypeTriggerOwned');
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

function HMCharacteristicTypeTargetRelativeHumidity: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetRelativeHumidity');
end;

function HMCharacteristicTypeOutletInUse: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeOutletInUse');
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

function HMCharacteristicTypeContactState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeContactState');
end;

function HMCharacteristicTypeCurrentHorizontalTilt: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentHorizontalTilt');
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

function HMCharacteristicTypeHoldPosition: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeHoldPosition');
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

function HMCharacteristicTypeStreamingStatus: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeStreamingStatus');
end;

function HMCharacteristicTypeSetupStreamEndpoint: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeSetupStreamEndpoint');
end;

function HMCharacteristicTypeSupportedVideoStreamConfiguration: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeSupportedVideoStreamConfiguration');
end;

function HMCharacteristicTypeSupportedRTPConfiguration: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeSupportedRTPConfiguration');
end;

function HMCharacteristicTypeSelectedStreamConfiguration: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeSelectedStreamConfiguration');
end;

function HMCharacteristicTypeOpticalZoom: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeOpticalZoom');
end;

function HMCharacteristicTypeDigitalZoom: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeDigitalZoom');
end;

function HMCharacteristicTypeImageRotation: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeImageRotation');
end;

function HMCharacteristicTypeImageMirroring: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeImageMirroring');
end;

function HMCharacteristicTypeLabelNamespace: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeLabelNamespace');
end;

function HMCharacteristicTypeLabelIndex: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeLabelIndex');
end;

function HMCharacteristicTypeCurrentAirPurifierState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentAirPurifierState');
end;

function HMCharacteristicTypeTargetAirPurifierState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetAirPurifierState');
end;

function HMCharacteristicTypeCurrentSlatState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentSlatState');
end;

function HMCharacteristicTypeFilterChangeIndication: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeFilterChangeIndication');
end;

function HMCharacteristicTypeFilterLifeLevel: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeFilterLifeLevel');
end;

function HMCharacteristicTypeFilterResetChangeIndication: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeFilterResetChangeIndication');
end;

function HMCharacteristicTypeSlatType: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeSlatType');
end;

function HMCharacteristicTypeCurrentTilt: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeCurrentTilt');
end;

function HMCharacteristicTypeTargetTilt: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeTargetTilt');
end;

function HMCharacteristicTypeOzoneDensity: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeOzoneDensity');
end;

function HMCharacteristicTypeNitrogenDioxideDensity: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeNitrogenDioxideDensity');
end;

function HMCharacteristicTypeSulphurDioxideDensity: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeSulphurDioxideDensity');
end;

function HMCharacteristicTypePM2_5Density: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypePM2_5Density');
end;

function HMCharacteristicTypePM10Density: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypePM10Density');
end;

function HMCharacteristicTypeVolatileOrganicCompoundDensity: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeVolatileOrganicCompoundDensity');
end;

function HMCharacteristicTypeProgramMode: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeProgramMode');
end;

function HMCharacteristicTypeInUse: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeInUse');
end;

function HMCharacteristicTypeSetDuration: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeSetDuration');
end;

function HMCharacteristicTypeRemainingDuration: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeRemainingDuration');
end;

function HMCharacteristicTypeValveType: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeValveType');
end;

function HMCharacteristicTypeBrightness: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeBrightness');
end;

function HMCharacteristicTypeCoolingThreshold: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCoolingThreshold');
end;

function HMCharacteristicTypeCurrentDoorState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentDoorState');
end;

function HMCharacteristicTypeCurrentHeatingCooling: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentHeatingCooling');
end;

function HMCharacteristicTypeCurrentRelativeHumidity: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentRelativeHumidity');
end;

function HMCharacteristicTypeCurrentTemperature: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentTemperature');
end;

function HMCharacteristicTypeHeatingThreshold: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeHeatingThreshold');
end;

function HMCharacteristicTypeHue: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeHue');
end;

function HMCharacteristicTypeIdentify: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeIdentify');
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

function HMCharacteristicTypeManufacturer: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeManufacturer');
end;

function HMCharacteristicTypeModel: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeModel');
end;

function HMCharacteristicTypeName: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeName');
end;

function HMCharacteristicTypeObstructionDetected: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeObstructionDetected');
end;

function HMCharacteristicTypePowerState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypePowerState');
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

function HMCharacteristicTypeSaturation: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeSaturation');
end;

function HMCharacteristicTypeSerialNumber: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeSerialNumber');
end;

function HMCharacteristicTypeTargetDoorState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetDoorState');
end;

function HMCharacteristicTypeTargetHeatingCooling: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetHeatingCooling');
end;

function HMCharacteristicTypeTargetTemperature: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetTemperature');
end;

function HMCharacteristicTypeTemperatureUnits: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTemperatureUnits');
end;

function HMCharacteristicTypeVersion: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeVersion');
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

function HMCharacteristicTypeSoftwareVersion: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeSoftwareVersion');
end;

function HMCharacteristicTypeBatteryLevel: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeBatteryLevel');
end;

function HMCharacteristicTypeCurrentLightLevel: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentLightLevel');
end;

function HMCharacteristicTypeInputEvent: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeInputEvent');
end;

function HMCharacteristicTypeSmokeDetected: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeSmokeDetected');
end;

function HMCharacteristicTypeStatusLowBattery: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeStatusLowBattery');
end;

function HMCharacteristicTypeChargingState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeChargingState');
end;

function HMCharacteristicTypeLockPhysicalControls: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeLockPhysicalControls');
end;

function HMCharacteristicTypeCurrentFanState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentFanState');
end;

function HMCharacteristicTypeActive: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeActive');
end;

function HMCharacteristicTypeCurrentHeaterCoolerState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentHeaterCoolerState');
end;

function HMCharacteristicTypeTargetHeaterCoolerState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetHeaterCoolerState');
end;

function HMCharacteristicTypeCurrentHumidifierDehumidifierState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeCurrentHumidifierDehumidifierState');
end;

function HMCharacteristicTypeTargetHumidifierDehumidifierState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetHumidifierDehumidifierState');
end;

function HMCharacteristicTypeWaterLevel: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeWaterLevel');
end;

function HMCharacteristicTypeSwingMode: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeSwingMode');
end;

function HMCharacteristicTypeTargetFanState: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeTargetFanState');
end;

function HMCharacteristicTypeDehumidifierThreshold: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeDehumidifierThreshold');
end;

function HMCharacteristicTypeHumidifierThreshold: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeHumidifierThreshold');
end;

function HMCharacteristicTypeColorTemperature: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeColorTemperature');
end;

function HMCharacteristicTypeIsConfigured: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeIsConfigured');
end;

function HMCharacteristicTypeSupportedAudioStreamConfiguration: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicTypeSupportedAudioStreamConfiguration');
end;

function HMCharacteristicTypeVolume: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeVolume');
end;

function HMCharacteristicTypeMute: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeMute');
end;

function HMCharacteristicTypeNightVision: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicTypeNightVision');
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

function HMCharacteristicMetadataUnitsPartsPerMillion: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataUnitsPartsPerMillion');
end;

function HMCharacteristicMetadataUnitsMicrogramsPerCubicMeter: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMCharacteristicMetadataUnitsMicrogramsPerCubicMeter');
end;

function HMErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMErrorDomain');
end;

function HMCharacteristicKeyPath: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicKeyPath');
end;

function HMCharacteristicValueKeyPath: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMCharacteristicValueKeyPath');
end;

function HMPresenceKeyPath: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMPresenceKeyPath');
end;

function HMUserFailedAccessoriesKey: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMUserFailedAccessoriesKey');
end;

function HMServiceTypeSwitch: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeSwitch');
end;

function HMServiceTypeThermostat: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeThermostat');
end;

function HMServiceTypeOutlet: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeOutlet');
end;

function HMServiceTypeLockManagement: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeLockManagement');
end;

function HMServiceTypeAirQualitySensor: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeAirQualitySensor');
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

function HMServiceTypeCameraRTPStreamManagement: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMServiceTypeCameraRTPStreamManagement');
end;

function HMServiceTypeCameraControl: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeCameraControl');
end;

function HMServiceTypeMicrophone: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeMicrophone');
end;

function HMServiceTypeSpeaker: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeSpeaker');
end;

function HMServiceTypeAirPurifier: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeAirPurifier');
end;

function HMServiceTypeFilterMaintenance: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeFilterMaintenance');
end;

function HMServiceTypeSlats: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeSlats');
end;

function HMServiceTypeLabel: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeLabel');
end;

function HMServiceTypeIrrigationSystem: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeIrrigationSystem');
end;

function HMServiceTypeValve: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeValve');
end;

function HMServiceTypeFaucet: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeFaucet');
end;

function HMServiceTypeAccessoryInformation: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeAccessoryInformation');
end;

function HMServiceTypeFan: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeFan');
end;

function HMServiceTypeGarageDoorOpener: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeGarageDoorOpener');
end;

function HMServiceTypeLightbulb: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeLightbulb');
end;

function HMServiceTypeLockMechanism: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeLockMechanism');
end;

function HMServiceTypeBattery: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeBattery');
end;

function HMServiceTypeVentilationFan: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeVentilationFan');
end;

function HMServiceTypeHeaterCooler: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeHeaterCooler');
end;

function HMServiceTypeHumidifierDehumidifier: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit,
    'HMServiceTypeHumidifierDehumidifier');
end;

function HMServiceTypeDoorbell: NSString;
begin
  Result := CocoaNSStringConst(libHomeKit, 'HMServiceTypeDoorbell');
end;

function HMSignificantEventSunrise: Pointer;
begin
  Result := CocoaPointerConst(libHomeKit, 'HMSignificantEventSunrise');
end;

function HMSignificantEventSunset: Pointer;
begin
  Result := CocoaPointerConst(libHomeKit, 'HMSignificantEventSunset');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

HomeKitModule := dlopen(MarshaledAString(libHomeKit), RTLD_LAZY);

finalization

dlclose(HomeKitModule);
{$ENDIF IOS}

end.
