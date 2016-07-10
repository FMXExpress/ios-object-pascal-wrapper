{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework HealthKit
//

unit iOSapi.HealthKit;

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
  HKNoError = 0;
  HKErrorHealthDataUnavailable = 1;
  HKErrorHealthDataRestricted = 2;
  HKErrorInvalidArgument = 3;
  HKErrorAuthorizationDenied = 4;
  HKErrorAuthorizationNotDetermined = 5;
  HKErrorDatabaseInaccessible = 6;
  HKErrorUserCanceled = 7;
  HKErrorAnotherWorkoutSessionStarted = 8;
  HKErrorUserExitedWorkoutSession = 9;
  HKUpdateFrequencyImmediate = 1;
  HKUpdateFrequencyHourly = 2;
  HKUpdateFrequencyDaily = 3;
  HKUpdateFrequencyWeekly = 4;
  HKAuthorizationStatusNotDetermined = 0;
  HKAuthorizationStatusSharingDenied = 1;
  HKAuthorizationStatusSharingAuthorized = 2;
  HKBiologicalSexNotSet = 0;
  HKBiologicalSexFemale = 1;
  HKBiologicalSexMale = 2;
  HKBiologicalSexOther = 3;
  HKBloodTypeNotSet = 0;
  HKBloodTypeAPositive = 1;
  HKBloodTypeANegative = 2;
  HKBloodTypeBPositive = 3;
  HKBloodTypeBNegative = 4;
  HKBloodTypeABPositive = 5;
  HKBloodTypeABNegative = 6;
  HKBloodTypeOPositive = 7;
  HKBloodTypeONegative = 8;
  HKCategoryValueSleepAnalysisInBed = 0;
  HKCategoryValueSleepAnalysisAsleep = 1;
  HKCategoryValueAppleStandHourStood = 0;
  HKCategoryValueAppleStandHourIdle = 1;
  HKFitzpatrickSkinTypeNotSet = 0;
  HKFitzpatrickSkinTypeI = 1;
  HKFitzpatrickSkinTypeII = 2;
  HKFitzpatrickSkinTypeIII = 3;
  HKFitzpatrickSkinTypeIV = 4;
  HKFitzpatrickSkinTypeV = 5;
  HKFitzpatrickSkinTypeVI = 6;
  HKCategoryValueCervicalMucusQualityDry = 1;
  HKCategoryValueCervicalMucusQualitySticky = 2;
  HKCategoryValueCervicalMucusQualityCreamy = 3;
  HKCategoryValueCervicalMucusQualityWatery = 4;
  HKCategoryValueCervicalMucusQualityEggWhite = 5;
  HKCategoryValueOvulationTestResultNegative = 1;
  HKCategoryValueOvulationTestResultPositive = 2;
  HKCategoryValueOvulationTestResultIndeterminate = 3;
  HKCategoryValueMenstrualFlowUnspecified = 1;
  HKCategoryValueMenstrualFlowLight = 2;
  HKCategoryValueMenstrualFlowMedium = 3;
  HKCategoryValueMenstrualFlowHeavy = 4;
  HKCategoryValueNotApplicable = 0;
  HKWorkoutActivityTypeAmericanFootball = 1;
  HKWorkoutActivityTypeArchery = 2;
  HKWorkoutActivityTypeAustralianFootball = 3;
  HKWorkoutActivityTypeBadminton = 4;
  HKWorkoutActivityTypeBaseball = 5;
  HKWorkoutActivityTypeBasketball = 6;
  HKWorkoutActivityTypeBowling = 7;
  HKWorkoutActivityTypeBoxing = 8;
  HKWorkoutActivityTypeClimbing = 9;
  HKWorkoutActivityTypeCricket = 10;
  HKWorkoutActivityTypeCrossTraining = 11;
  HKWorkoutActivityTypeCurling = 12;
  HKWorkoutActivityTypeCycling = 13;
  HKWorkoutActivityTypeDance = 14;
  HKWorkoutActivityTypeDanceInspiredTraining = 15;
  HKWorkoutActivityTypeElliptical = 16;
  HKWorkoutActivityTypeEquestrianSports = 17;
  HKWorkoutActivityTypeFencing = 18;
  HKWorkoutActivityTypeFishing = 19;
  HKWorkoutActivityTypeFunctionalStrengthTraining = 20;
  HKWorkoutActivityTypeGolf = 21;
  HKWorkoutActivityTypeGymnastics = 22;
  HKWorkoutActivityTypeHandball = 23;
  HKWorkoutActivityTypeHiking = 24;
  HKWorkoutActivityTypeHockey = 25;
  HKWorkoutActivityTypeHunting = 26;
  HKWorkoutActivityTypeLacrosse = 27;
  HKWorkoutActivityTypeMartialArts = 28;
  HKWorkoutActivityTypeMindAndBody = 29;
  HKWorkoutActivityTypeMixedMetabolicCardioTraining = 30;
  HKWorkoutActivityTypePaddleSports = 31;
  HKWorkoutActivityTypePlay = 32;
  HKWorkoutActivityTypePreparationAndRecovery = 33;
  HKWorkoutActivityTypeRacquetball = 34;
  HKWorkoutActivityTypeRowing = 35;
  HKWorkoutActivityTypeRugby = 36;
  HKWorkoutActivityTypeRunning = 37;
  HKWorkoutActivityTypeSailing = 38;
  HKWorkoutActivityTypeSkatingSports = 39;
  HKWorkoutActivityTypeSnowSports = 40;
  HKWorkoutActivityTypeSoccer = 41;
  HKWorkoutActivityTypeSoftball = 42;
  HKWorkoutActivityTypeSquash = 43;
  HKWorkoutActivityTypeStairClimbing = 44;
  HKWorkoutActivityTypeSurfingSports = 45;
  HKWorkoutActivityTypeSwimming = 46;
  HKWorkoutActivityTypeTableTennis = 47;
  HKWorkoutActivityTypeTennis = 48;
  HKWorkoutActivityTypeTrackAndField = 49;
  HKWorkoutActivityTypeTraditionalStrengthTraining = 50;
  HKWorkoutActivityTypeVolleyball = 51;
  HKWorkoutActivityTypeWalking = 52;
  HKWorkoutActivityTypeWaterFitness = 53;
  HKWorkoutActivityTypeWaterPolo = 54;
  HKWorkoutActivityTypeWaterSports = 55;
  HKWorkoutActivityTypeWrestling = 56;
  HKWorkoutActivityTypeYoga = 57;
  HKWorkoutActivityTypeOther = 3000;
  HKWorkoutEventTypePause = 1;
  HKWorkoutEventTypeResume = 2;
  HKQueryOptionNone = 0;
  HKQueryOptionStrictStartDate = 1 shl 0;
  HKQueryOptionStrictEndDate = 1 shl 1;
  HKBodyTemperatureSensorLocationOther = 0;
  HKBodyTemperatureSensorLocationArmpit = 1;
  HKBodyTemperatureSensorLocationBody = 2;
  HKBodyTemperatureSensorLocationEar = 3;
  HKBodyTemperatureSensorLocationFinger = 4;
  HKBodyTemperatureSensorLocationGastroIntestinal = 5;
  HKBodyTemperatureSensorLocationMouth = 6;
  HKBodyTemperatureSensorLocationRectum = 7;
  HKBodyTemperatureSensorLocationToe = 8;
  HKBodyTemperatureSensorLocationEarDrum = 9;
  HKBodyTemperatureSensorLocationTemporalArtery = 10;
  HKBodyTemperatureSensorLocationForehead = 11;
  HKHeartRateSensorLocationOther = 0;
  HKHeartRateSensorLocationChest = 1;
  HKHeartRateSensorLocationWrist = 2;
  HKHeartRateSensorLocationFinger = 3;
  HKHeartRateSensorLocationHand = 4;
  HKHeartRateSensorLocationEarLobe = 5;
  HKHeartRateSensorLocationFoot = 6;
  HKQuantityAggregationStyleCumulative = 0;
  HKQuantityAggregationStyleDiscrete = 1;
  HKStatisticsOptionNone = 0;
  HKStatisticsOptionSeparateBySource = 1 shl 0;
  HKStatisticsOptionDiscreteAverage = 1 shl 1;
  HKStatisticsOptionDiscreteMin = 1 shl 2;
  HKStatisticsOptionDiscreteMax = 1 shl 3;
  HKStatisticsOptionCumulativeSum = 1 shl 4;
  HKMetricPrefixNone = 0;
  HKMetricPrefixPico = 1;
  HKMetricPrefixNano = 2;
  HKMetricPrefixMicro = 3;
  HKMetricPrefixMilli = 4;
  HKMetricPrefixCenti = 5;
  HKMetricPrefixDeci = 6;
  HKMetricPrefixDeca = 7;
  HKMetricPrefixHecto = 8;
  HKMetricPrefixKilo = 9;
  HKMetricPrefixMega = 10;
  HKMetricPrefixGiga = 11;
  HKMetricPrefixTera = 12;
  HKWorkoutSessionStateNotStarted = 1;
  HKWorkoutSessionStateRunning = 2;
  HKWorkoutSessionStateEnded = 3;
  HKWorkoutSessionLocationTypeUnknown = 1;
  HKWorkoutSessionLocationTypeIndoor = 2;
  HKWorkoutSessionLocationTypeOutdoor = 3;

type

  // ===== Forward declarations =====
{$M+}
  HKQuantity = interface;
  HKActivitySummary = interface;
  HKSource = interface;
  HKSourceRevision = interface;
  HKDevice = interface;
  HKObject = interface;
  HKSampleType = interface;
  HKSample = interface;
  HKWorkoutEvent = interface;
  HKWorkout = interface;
  HKObjectType = interface;
  HKQuery = interface;
  HKQueryAnchor = interface;
  HKActivitySummaryQuery = interface;
  HKDeletedObject = interface;
  HKAnchoredObjectQuery = interface;
  HKCategoryType = interface;
  HKCategorySample = interface;
  HKCorrelationType = interface;
  HKCorrelation = interface;
  HKCorrelationQuery = interface;
  HKBiologicalSexObject = interface;
  HKBloodTypeObject = interface;
  HKFitzpatrickSkinTypeObject = interface;
  HKQuantityType = interface;
  HKUnit = interface;
  HKWorkoutSession = interface;
  HKHealthStore = interface;
  HKActivitySummaryType = interface;
  HKCharacteristicType = interface;
  HKWorkoutType = interface;
  HKObserverQuery = interface;
  HKQuantitySample = interface;
  HKSampleQuery = interface;
  HKSourceQuery = interface;
  HKStatistics = interface;
  HKStatisticsCollection = interface;
  HKStatisticsCollectionQuery = interface;
  HKStatisticsQuery = interface;
  HKWorkoutSessionDelegate = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  HKErrorCode = NSInteger;
  HKUpdateFrequency = NSInteger;
  HKAuthorizationStatus = NSInteger;
  HKBiologicalSex = NSInteger;
  HKBloodType = NSInteger;
  HKCategoryValueSleepAnalysis = NSInteger;
  HKCategoryValueAppleStandHour = NSInteger;
  HKFitzpatrickSkinType = NSInteger;
  HKCategoryValueCervicalMucusQuality = NSInteger;
  HKCategoryValueOvulationTestResult = NSInteger;
  HKCategoryValueMenstrualFlow = NSInteger;
  HKCategoryValue = NSInteger;
  NSUInteger = Cardinal;
  HKWorkoutActivityType = NSUInteger;
  HKWorkoutEventType = NSInteger;
  NSTimeInterval = Double;
  HKQueryOptions = NSUInteger;
  NSPredicateOperatorType = NSUInteger;
  THealthKitUpdateHandler = procedure(param1: HKActivitySummaryQuery;
    param2: NSArray; param3: NSError) of object;
  THealthKitUpdateHandler1 = procedure(param1: HKAnchoredObjectQuery;
    param2: NSArray; param3: NSArray; param4: HKQueryAnchor; param5: NSError)
    of object;
  THealthKitCompletionHandler = procedure(param1: HKAnchoredObjectQuery;
    param2: NSArray; param3: NSUInteger; param4: NSError) of object;
  THealthKitCompletion = procedure(param1: HKCorrelationQuery; param2: NSArray;
    param3: NSError) of object;
  THealthKitCompletion1 = procedure(param1: Boolean; param2: NSError) of object;
  THealthKitWithCompletion = procedure(param1: Boolean; param2: NSUInteger;
    param3: NSError) of object;
  THealthKitResultsHandler = procedure(param1: HKQuantity; param2: HKQuantity;
    param3: NSError) of object;
  THealthKitCompletion2 = procedure(param1: NSDictionary; param2: NSError)
    of object;
  HKBodyTemperatureSensorLocation = NSInteger;
  HKHeartRateSensorLocation = NSInteger;
  HKQuantityAggregationStyle = NSInteger;
  HKObserverQueryCompletionHandler = procedure() of object;
  THealthKitUpdateHandler2 = procedure(param1: HKObserverQuery;
    param2: HKObserverQueryCompletionHandler; param3: NSError) of object;
  NSComparisonResult = NSInteger;
  THealthKitResultsHandler1 = procedure(param1: HKSampleQuery; param2: NSArray;
    param3: NSError) of object;
  THealthKitCompletionHandler1 = procedure(param1: HKSourceQuery; param2: NSSet;
    param3: NSError) of object;
  HKStatisticsOptions = NSUInteger;
  THealthKitWithBlock = procedure(param1: HKStatistics; param2: PBoolean)
    of object;
  THealthKitInitialResultsHandler = procedure
    (param1: HKStatisticsCollectionQuery; param2: HKStatisticsCollection;
    param3: NSError) of object;
  THealthKitStatisticsUpdateHandler = procedure
    (param1: HKStatisticsCollectionQuery; param2: HKStatistics;
    param3: HKStatisticsCollection; param4: NSError) of object;
  THealthKitCompletionHandler2 = procedure(param1: HKStatisticsQuery;
    param2: HKStatistics; param3: NSError) of object;
  NSMassFormatterUnit = NSInteger;
  NSLengthFormatterUnit = NSInteger;
  NSEnergyFormatterUnit = NSInteger;
  HKMetricPrefix = NSInteger;
  HKWorkoutSessionState = NSInteger;
  HKWorkoutSessionLocationType = NSInteger;
  // ===== Interface declarations =====

  HKQuantityClass = interface(NSObjectClass)
    ['{73D2CFE2-171C-4C31-9B6F-17F6DB3D51D0}']
    { class } function quantityWithUnit(&unit: HKUnit; doubleValue: Double)
      : Pointer { instancetype }; cdecl;
  end;

  HKQuantity = interface(NSObject)
    ['{652FA2A2-33EC-4168-911D-36C0331D882D}']
    function isCompatibleWithUnit(&unit: HKUnit): Boolean; cdecl;
    function doubleValueForUnit(&unit: HKUnit): Double; cdecl;
    function compare(quantity: HKQuantity): NSComparisonResult; cdecl;
  end;

  THKQuantity = class(TOCGenericImport<HKQuantityClass, HKQuantity>)
  end;

  PHKQuantity = Pointer;

  HKActivitySummaryClass = interface(NSObjectClass)
    ['{713BD0A2-4218-4047-9F47-6A8F8F6AF12E}']
  end;

  HKActivitySummary = interface(NSObject)
    ['{ED5B27D0-36A3-426B-91C5-229A0E521506}']
    function dateComponentsForCalendar(calendar: NSCalendar)
      : NSDateComponents; cdecl;
    procedure setActiveEnergyBurned(activeEnergyBurned: HKQuantity); cdecl;
    function activeEnergyBurned: HKQuantity; cdecl;
    procedure setAppleExerciseTime(appleExerciseTime: HKQuantity); cdecl;
    function appleExerciseTime: HKQuantity; cdecl;
    procedure setAppleStandHours(appleStandHours: HKQuantity); cdecl;
    function appleStandHours: HKQuantity; cdecl;
    procedure setActiveEnergyBurnedGoal(activeEnergyBurnedGoal
      : HKQuantity); cdecl;
    function activeEnergyBurnedGoal: HKQuantity; cdecl;
    procedure setAppleExerciseTimeGoal(appleExerciseTimeGoal
      : HKQuantity); cdecl;
    function appleExerciseTimeGoal: HKQuantity; cdecl;
    procedure setAppleStandHoursGoal(appleStandHoursGoal: HKQuantity); cdecl;
    function appleStandHoursGoal: HKQuantity; cdecl;
  end;

  THKActivitySummary = class(TOCGenericImport<HKActivitySummaryClass,
    HKActivitySummary>)
  end;

  PHKActivitySummary = Pointer;

  HKSourceClass = interface(NSObjectClass)
    ['{BB3840F0-DDE2-4806-A20A-EE19B9DE3079}']
    { class } function defaultSource: HKSource; cdecl;
  end;

  HKSource = interface(NSObject)
    ['{D1C28759-9B85-43B1-B1A4-908C234C7060}']
    function name: NSString; cdecl;
    function bundleIdentifier: NSString; cdecl;
  end;

  THKSource = class(TOCGenericImport<HKSourceClass, HKSource>)
  end;

  PHKSource = Pointer;

  HKSourceRevisionClass = interface(NSObjectClass)
    ['{B00E2BF0-4358-4D84-8B88-037A02464383}']
  end;

  HKSourceRevision = interface(NSObject)
    ['{1A2D9ED6-AEF7-4B78-A515-32F98FAA5851}']
    function source: HKSource; cdecl;
    function version: NSString; cdecl;
    function initWithSource(source: HKSource; version: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  THKSourceRevision = class(TOCGenericImport<HKSourceRevisionClass,
    HKSourceRevision>)
  end;

  PHKSourceRevision = Pointer;

  HKDeviceClass = interface(NSObjectClass)
    ['{52B88F92-06FB-486F-A9B3-4236C3701A8E}']
    { class } function localDevice: HKDevice; cdecl;
  end;

  HKDevice = interface(NSObject)
    ['{BCFAAD6B-4E11-46C6-B58B-96D620C52DA2}']
    function name: NSString; cdecl;
    function manufacturer: NSString; cdecl;
    function model: NSString; cdecl;
    function hardwareVersion: NSString; cdecl;
    function firmwareVersion: NSString; cdecl;
    function softwareVersion: NSString; cdecl;
    function localIdentifier: NSString; cdecl;
    function UDIDeviceIdentifier: NSString; cdecl;
    function initWithName(name: NSString; manufacturer: NSString;
      model: NSString; hardwareVersion: NSString; firmwareVersion: NSString;
      softwareVersion: NSString; localIdentifier: NSString;
      UDIDeviceIdentifier: NSString): Pointer { instancetype }; cdecl;
  end;

  THKDevice = class(TOCGenericImport<HKDeviceClass, HKDevice>)
  end;

  PHKDevice = Pointer;

  HKObjectClass = interface(NSObjectClass)
    ['{B210F4B3-C9E6-4599-BD95-56713FED7D90}']
  end;

  HKObject = interface(NSObject)
    ['{371843BF-745D-41C7-BB41-DD6941590DD4}']
    function UUID: NSUUID; cdecl;
    function source: HKSource; cdecl;
    function sourceRevision: HKSourceRevision; cdecl;
    function device: HKDevice; cdecl;
    function metadata: NSDictionary; cdecl;
  end;

  THKObject = class(TOCGenericImport<HKObjectClass, HKObject>)
  end;

  PHKObject = Pointer;

  HKObjectTypeClass = interface(NSObjectClass)
    ['{D77CE7C8-6613-42A5-B4E8-E4C581E5094D}']
    { class } function quantityTypeForIdentifier(identifier: NSString)
      : HKQuantityType; cdecl;
    { class } function categoryTypeForIdentifier(identifier: NSString)
      : HKCategoryType; cdecl;
    { class } function characteristicTypeForIdentifier(identifier: NSString)
      : HKCharacteristicType; cdecl;
    { class } function correlationTypeForIdentifier(identifier: NSString)
      : HKCorrelationType; cdecl;
    { class } function workoutType: HKWorkoutType; cdecl;
    { class } function activitySummaryType: HKActivitySummaryType; cdecl;
  end;

  HKObjectType = interface(NSObject)
    ['{7B7ADBA5-35D2-47ED-9368-EFD53C787F6E}']
    function identifier: NSString; cdecl;
  end;

  THKObjectType = class(TOCGenericImport<HKObjectTypeClass, HKObjectType>)
  end;

  PHKObjectType = Pointer;

  HKSampleTypeClass = interface(HKObjectTypeClass)
    ['{3FDD0817-BACC-4E78-8FEB-FC335D025C04}']
  end;

  HKSampleType = interface(HKObjectType)
    ['{24D80124-0616-4B6F-BADA-31BEB79E91D3}']
  end;

  THKSampleType = class(TOCGenericImport<HKSampleTypeClass, HKSampleType>)
  end;

  PHKSampleType = Pointer;

  HKSampleClass = interface(HKObjectClass)
    ['{18D43C27-C55E-4E7F-9AA7-289140F128C1}']
  end;

  HKSample = interface(HKObject)
    ['{1ADB054A-2923-4013-A5EE-14B27B6B2313}']
    function sampleType: HKSampleType; cdecl;
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
  end;

  THKSample = class(TOCGenericImport<HKSampleClass, HKSample>)
  end;

  PHKSample = Pointer;

  HKWorkoutEventClass = interface(NSObjectClass)
    ['{E0058641-BF94-4F1F-A518-2CEBD425CE08}']
    { class } function workoutEventWithType(&type: HKWorkoutEventType;
      date: NSDate): Pointer { instancetype }; cdecl;
  end;

  HKWorkoutEvent = interface(NSObject)
    ['{DC8CAF9F-F345-413C-82CE-81768475C8A1}']
    function &type: HKWorkoutEventType; cdecl;
    function date: NSDate; cdecl;
  end;

  THKWorkoutEvent = class(TOCGenericImport<HKWorkoutEventClass, HKWorkoutEvent>)
  end;

  PHKWorkoutEvent = Pointer;

  HKWorkoutClass = interface(HKSampleClass)
    ['{486721F6-CC9F-4566-BD59-5ED511A6AEC3}']
    [MethodName('workoutWithActivityType:startDate:endDate:')]
    { class } function workoutWithActivityTypeStartDateEndDate
      (workoutActivityType: HKWorkoutActivityType; startDate: NSDate;
      endDate: NSDate): Pointer { instancetype }; cdecl;
    [MethodName
      ('workoutWithActivityType:startDate:endDate:workoutEvents:totalEnergyBurned:totalDistance:metadata:')
      ]
    { class } function
      workoutWithActivityTypeStartDateEndDateWorkoutEventsTotalEnergyBurnedTotalDistanceMetadata
      (workoutActivityType: HKWorkoutActivityType; startDate: NSDate;
      endDate: NSDate; workoutEvents: NSArray; totalEnergyBurned: HKQuantity;
      totalDistance: HKQuantity; metadata: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('workoutWithActivityType:startDate:endDate:workoutEvents:totalEnergyBurned:totalDistance:device:metadata:')
      ]
    { class } function
      workoutWithActivityTypeStartDateEndDateWorkoutEventsTotalEnergyBurnedTotalDistanceDeviceMetadata
      (workoutActivityType: HKWorkoutActivityType; startDate: NSDate;
      endDate: NSDate; workoutEvents: NSArray; totalEnergyBurned: HKQuantity;
      totalDistance: HKQuantity; device: HKDevice; metadata: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('workoutWithActivityType:startDate:endDate:duration:totalEnergyBurned:totalDistance:metadata:')
      ]
    { class } function
      workoutWithActivityTypeStartDateEndDateDurationTotalEnergyBurnedTotalDistanceMetadata
      (workoutActivityType: HKWorkoutActivityType; startDate: NSDate;
      endDate: NSDate; duration: NSTimeInterval; totalEnergyBurned: HKQuantity;
      totalDistance: HKQuantity; metadata: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('workoutWithActivityType:startDate:endDate:duration:totalEnergyBurned:totalDistance:device:metadata:')
      ]
    { class } function
      workoutWithActivityTypeStartDateEndDateDurationTotalEnergyBurnedTotalDistanceDeviceMetadata
      (workoutActivityType: HKWorkoutActivityType; startDate: NSDate;
      endDate: NSDate; duration: NSTimeInterval; totalEnergyBurned: HKQuantity;
      totalDistance: HKQuantity; device: HKDevice; metadata: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  HKWorkout = interface(HKSample)
    ['{FF3BA05D-05B8-42B5-B640-6A3EB0EB722D}']
    function workoutActivityType: HKWorkoutActivityType; cdecl;
    function workoutEvents: NSArray; cdecl;
    function duration: NSTimeInterval; cdecl;
    function totalEnergyBurned: HKQuantity; cdecl;
    function totalDistance: HKQuantity; cdecl;
  end;

  THKWorkout = class(TOCGenericImport<HKWorkoutClass, HKWorkout>)
  end;

  PHKWorkout = Pointer;

  HKQueryClass = interface(NSObjectClass)
    ['{EA3E6F56-1B96-45FB-951B-17D4B92D7B8A}']
    [MethodName('predicateForObjectsWithMetadataKey:')]
    { class } function predicateForObjectsWithMetadataKey(key: NSString)
      : NSPredicate; cdecl;
    [MethodName('predicateForObjectsWithMetadataKey:allowedValues:')]
    { class } function predicateForObjectsWithMetadataKeyAllowedValues
      (key: NSString; allowedValues: NSArray): NSPredicate; cdecl;
    [MethodName('predicateForObjectsWithMetadataKey:operatorType:value:')]
    { class } function predicateForObjectsWithMetadataKeyOperatorTypeValue
      (key: NSString; operatorType: NSPredicateOperatorType; value: Pointer)
      : NSPredicate; cdecl;
    { class } function predicateForObjectsFromSource(source: HKSource)
      : NSPredicate; cdecl;
    { class } function predicateForObjectsFromSources(sources: NSSet)
      : NSPredicate; cdecl;
    { class } function predicateForObjectsFromSourceRevisions(sourceRevisions
      : NSSet): NSPredicate; cdecl;
    { class } function predicateForObjectsFromDevices(devices: NSSet)
      : NSPredicate; cdecl;
    { class } function predicateForObjectsWithDeviceProperty(key: NSString;
      allowedValues: NSSet): NSPredicate; cdecl;
    { class } function predicateForObjectWithUUID(UUID: NSUUID)
      : NSPredicate; cdecl;
    { class } function predicateForObjectsWithUUIDs(UUIDs: NSSet)
      : NSPredicate; cdecl;
    { class } function predicateForObjectsWithNoCorrelation: NSPredicate; cdecl;
    { class } function predicateForObjectsFromWorkout(workout: HKWorkout)
      : NSPredicate; cdecl;
    { class } function predicateForSamplesWithStartDate(startDate: NSDate;
      endDate: NSDate; options: HKQueryOptions): NSPredicate; cdecl;
    { class } function predicateForQuantitySamplesWithOperatorType
      (operatorType: NSPredicateOperatorType; quantity: HKQuantity)
      : NSPredicate; cdecl;
    { class } function predicateForCategorySamplesWithOperatorType
      (operatorType: NSPredicateOperatorType; value: NSInteger)
      : NSPredicate; cdecl;
    { class } function predicateForWorkoutsWithWorkoutActivityType
      (workoutActivityType: HKWorkoutActivityType): NSPredicate; cdecl;
    [MethodName('predicateForWorkoutsWithOperatorType:duration:')]
    { class } function predicateForWorkoutsWithOperatorTypeDuration
      (operatorType: NSPredicateOperatorType; duration: NSTimeInterval)
      : NSPredicate; cdecl;
    [MethodName('predicateForWorkoutsWithOperatorType:totalEnergyBurned:')]
    { class } function predicateForWorkoutsWithOperatorTypeTotalEnergyBurned
      (operatorType: NSPredicateOperatorType; totalEnergyBurned: HKQuantity)
      : NSPredicate; cdecl;
    [MethodName('predicateForWorkoutsWithOperatorType:totalDistance:')]
    { class } function predicateForWorkoutsWithOperatorTypeTotalDistance
      (operatorType: NSPredicateOperatorType; totalDistance: HKQuantity)
      : NSPredicate; cdecl;
    { class } function predicateForActivitySummaryWithDateComponents
      (dateComponents: NSDateComponents): NSPredicate; cdecl;
    { class } function predicateForActivitySummariesBetweenStartDateComponents
      (startDateComponents: NSDateComponents;
      endDateComponents: NSDateComponents): NSPredicate; cdecl;
  end;

  HKQuery = interface(NSObject)
    ['{BEE6847B-3BAA-4456-8A02-41FC2664B865}']
    function objectType: HKObjectType; cdecl;
    function sampleType: HKSampleType; cdecl;
    function predicate: NSPredicate; cdecl;
  end;

  THKQuery = class(TOCGenericImport<HKQueryClass, HKQuery>)
  end;

  PHKQuery = Pointer;

  HKQueryAnchorClass = interface(NSObjectClass)
    ['{E86E7E4D-9887-4AF6-87FD-0CAC9B0E87D1}']
    { class } function anchorFromValue(value: NSUInteger)
      : Pointer { instancetype }; cdecl;
  end;

  HKQueryAnchor = interface(NSObject)
    ['{E3351ED3-A47B-44CC-85B1-77A59A4F5842}']
  end;

  THKQueryAnchor = class(TOCGenericImport<HKQueryAnchorClass, HKQueryAnchor>)
  end;

  PHKQueryAnchor = Pointer;

  HKActivitySummaryQueryClass = interface(HKQueryClass)
    ['{260911E9-C450-4E2D-BA81-F3418E8A7AB3}']
  end;

  HKActivitySummaryQuery = interface(HKQuery)
    ['{3BFDC5D3-D8D7-4841-B612-F6013F61EE06}']
    procedure setUpdateHandler(updateHandler: THealthKitUpdateHandler); cdecl;
    function updateHandler: THealthKitUpdateHandler; cdecl;
    function initWithPredicate(predicate: NSPredicate;
      resultsHandler: THealthKitUpdateHandler): Pointer { instancetype }; cdecl;
  end;

  THKActivitySummaryQuery = class(TOCGenericImport<HKActivitySummaryQueryClass,
    HKActivitySummaryQuery>)
  end;

  PHKActivitySummaryQuery = Pointer;

  HKDeletedObjectClass = interface(NSObjectClass)
    ['{BD7649E0-C433-4864-A978-A27A5FE6FE4B}']
  end;

  HKDeletedObject = interface(NSObject)
    ['{693287E9-3602-4C9D-A0D6-73A1F78C395D}']
    function UUID: NSUUID; cdecl;
  end;

  THKDeletedObject = class(TOCGenericImport<HKDeletedObjectClass,
    HKDeletedObject>)
  end;

  PHKDeletedObject = Pointer;

  HKAnchoredObjectQueryClass = interface(HKQueryClass)
    ['{FC2B53DA-F511-4991-939F-29D0AB38C355}']
  end;

  HKAnchoredObjectQuery = interface(HKQuery)
    ['{BF7E6E20-3DC0-4F42-8A22-68CA759F349A}']
    procedure setUpdateHandler(updateHandler: THealthKitUpdateHandler1); cdecl;
    function updateHandler: THealthKitUpdateHandler1; cdecl;
    [MethodName('initWithType:predicate:anchor:limit:completionHandler:')]
    function initWithTypePredicateAnchorLimitCompletionHandler
      (&type: HKSampleType; predicate: NSPredicate; anchor: NSUInteger;
      limit: NSUInteger; completionHandler: THealthKitCompletionHandler)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithType:predicate:anchor:limit:resultsHandler:')]
    function initWithTypePredicateAnchorLimitResultsHandler(&type: HKSampleType;
      predicate: NSPredicate; anchor: HKQueryAnchor; limit: NSUInteger;
      resultsHandler: THealthKitUpdateHandler1)
      : Pointer { instancetype }; cdecl;
  end;

  THKAnchoredObjectQuery = class(TOCGenericImport<HKAnchoredObjectQueryClass,
    HKAnchoredObjectQuery>)
  end;

  PHKAnchoredObjectQuery = Pointer;

  HKCategoryTypeClass = interface(HKSampleTypeClass)
    ['{30275BD8-A081-4B17-81B0-471A68EC39F4}']
  end;

  HKCategoryType = interface(HKSampleType)
    ['{2D6F5C6B-7873-476D-9E4F-9AD34ABA4189}']
  end;

  THKCategoryType = class(TOCGenericImport<HKCategoryTypeClass, HKCategoryType>)
  end;

  PHKCategoryType = Pointer;

  HKCategorySampleClass = interface(HKSampleClass)
    ['{147CFCB6-D508-4D76-9DC0-5FD0EE94DDCD}']
    [MethodName('categorySampleWithType:value:startDate:endDate:metadata:')]
    { class } function categorySampleWithTypeValueStartDateEndDateMetadata
      (&type: HKCategoryType; value: NSInteger; startDate: NSDate;
      endDate: NSDate; metadata: NSDictionary): Pointer { instancetype }; cdecl;
    [MethodName('categorySampleWithType:value:startDate:endDate:')]
    { class } function categorySampleWithTypeValueStartDateEndDate
      (&type: HKCategoryType; value: NSInteger; startDate: NSDate;
      endDate: NSDate): Pointer { instancetype }; cdecl;
    [MethodName
      ('categorySampleWithType:value:startDate:endDate:device:metadata:')]
    { class } function categorySampleWithTypeValueStartDateEndDateDeviceMetadata
      (&type: HKCategoryType; value: NSInteger; startDate: NSDate;
      endDate: NSDate; device: HKDevice; metadata: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  HKCategorySample = interface(HKSample)
    ['{B4310092-8B5B-4031-9C8F-C729E15DAD16}']
    function categoryType: HKCategoryType; cdecl;
    function value: NSInteger; cdecl;
  end;

  THKCategorySample = class(TOCGenericImport<HKCategorySampleClass,
    HKCategorySample>)
  end;

  PHKCategorySample = Pointer;

  HKCorrelationTypeClass = interface(HKSampleTypeClass)
    ['{FFF73B45-E95E-4D7D-842E-2C87154229C3}']
  end;

  HKCorrelationType = interface(HKSampleType)
    ['{5714BA73-9D9B-497A-8443-13C443D72A7C}']
  end;

  THKCorrelationType = class(TOCGenericImport<HKCorrelationTypeClass,
    HKCorrelationType>)
  end;

  PHKCorrelationType = Pointer;

  HKCorrelationClass = interface(HKSampleClass)
    ['{BD2FDB9B-4258-4193-8309-12D633BD35CD}']
    [MethodName('correlationWithType:startDate:endDate:objects:')]
    { class } function correlationWithTypeStartDateEndDateObjects
      (correlationType: HKCorrelationType; startDate: NSDate; endDate: NSDate;
      objects: NSSet): Pointer { instancetype }; cdecl;
    [MethodName('correlationWithType:startDate:endDate:objects:metadata:')]
    { class } function correlationWithTypeStartDateEndDateObjectsMetadata
      (correlationType: HKCorrelationType; startDate: NSDate; endDate: NSDate;
      objects: NSSet; metadata: NSDictionary): Pointer { instancetype }; cdecl;
    [MethodName
      ('correlationWithType:startDate:endDate:objects:device:metadata:')]
    { class } function correlationWithTypeStartDateEndDateObjectsDeviceMetadata
      (correlationType: HKCorrelationType; startDate: NSDate; endDate: NSDate;
      objects: NSSet; device: HKDevice; metadata: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  HKCorrelation = interface(HKSample)
    ['{3317FB76-0ABA-4A15-93C8-28008227A3CB}']
    function correlationType: HKCorrelationType; cdecl;
    function objects: NSSet; cdecl;
    function objectsForType(objectType: HKObjectType): NSSet; cdecl;
  end;

  THKCorrelation = class(TOCGenericImport<HKCorrelationClass, HKCorrelation>)
  end;

  PHKCorrelation = Pointer;

  HKCorrelationQueryClass = interface(HKQueryClass)
    ['{F5FE077B-8C9B-40AC-9751-D7C5B9C086F0}']
  end;

  HKCorrelationQuery = interface(HKQuery)
    ['{1C42FEAD-BDA0-4916-A7DD-6F1D1579A820}']
    function correlationType: HKCorrelationType; cdecl;
    function samplePredicates: NSDictionary; cdecl;
    function initWithType(correlationType: HKCorrelationType;
      predicate: NSPredicate; samplePredicates: NSDictionary;
      completion: THealthKitCompletion): Pointer { instancetype }; cdecl;
  end;

  THKCorrelationQuery = class(TOCGenericImport<HKCorrelationQueryClass,
    HKCorrelationQuery>)
  end;

  PHKCorrelationQuery = Pointer;

  HKBiologicalSexObjectClass = interface(NSObjectClass)
    ['{62350807-A3C4-45AA-84D6-C2032762F935}']
  end;

  HKBiologicalSexObject = interface(NSObject)
    ['{BA2C634E-31C5-491D-9664-1F9C672AF14A}']
    function biologicalSex: HKBiologicalSex; cdecl;
  end;

  THKBiologicalSexObject = class(TOCGenericImport<HKBiologicalSexObjectClass,
    HKBiologicalSexObject>)
  end;

  PHKBiologicalSexObject = Pointer;

  HKBloodTypeObjectClass = interface(NSObjectClass)
    ['{7B014C83-371F-47DF-BDED-35798538A0CD}']
  end;

  HKBloodTypeObject = interface(NSObject)
    ['{71F7AB4A-8B60-47F3-A766-F1811E09F9C5}']
    function bloodType: HKBloodType; cdecl;
  end;

  THKBloodTypeObject = class(TOCGenericImport<HKBloodTypeObjectClass,
    HKBloodTypeObject>)
  end;

  PHKBloodTypeObject = Pointer;

  HKFitzpatrickSkinTypeObjectClass = interface(NSObjectClass)
    ['{1E38DD13-8C43-47B3-B7A1-023ABBCA3657}']
  end;

  HKFitzpatrickSkinTypeObject = interface(NSObject)
    ['{8D773716-8C72-499D-9F30-48C7DEE70DE8}']
    function skinType: HKFitzpatrickSkinType; cdecl;
  end;

  THKFitzpatrickSkinTypeObject = class
    (TOCGenericImport<HKFitzpatrickSkinTypeObjectClass,
    HKFitzpatrickSkinTypeObject>)
  end;

  PHKFitzpatrickSkinTypeObject = Pointer;

  HKQuantityTypeClass = interface(HKSampleTypeClass)
    ['{860D6058-AF69-4E5C-81A5-8EEC03DE60AF}']
  end;

  HKQuantityType = interface(HKSampleType)
    ['{9D09E7E2-18E4-435A-9B2F-2F879E9F7A40}']
    function aggregationStyle: HKQuantityAggregationStyle; cdecl;
    function isCompatibleWithUnit(&unit: HKUnit): Boolean; cdecl;
  end;

  THKQuantityType = class(TOCGenericImport<HKQuantityTypeClass, HKQuantityType>)
  end;

  PHKQuantityType = Pointer;

  HKUnitClass = interface(NSObjectClass)
    ['{29EE4943-32DF-49EC-A0C5-B46E0E7512F1}']
    { class } function unitFromString(&string: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function unitFromMassFormatterUnit(massFormatterUnit
      : NSMassFormatterUnit): Pointer { instancetype }; cdecl;
    { class } function massFormatterUnitFromUnit(&unit: HKUnit)
      : NSMassFormatterUnit; cdecl;
    { class } function unitFromLengthFormatterUnit(lengthFormatterUnit
      : NSLengthFormatterUnit): Pointer { instancetype }; cdecl;
    { class } function lengthFormatterUnitFromUnit(&unit: HKUnit)
      : NSLengthFormatterUnit; cdecl;
    { class } function unitFromEnergyFormatterUnit(energyFormatterUnit
      : NSEnergyFormatterUnit): Pointer { instancetype }; cdecl;
    { class } function energyFormatterUnitFromUnit(&unit: HKUnit)
      : NSEnergyFormatterUnit; cdecl;
    { class } function gramUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function gramUnit: Pointer { instancetype }; cdecl;
    { class } function ounceUnit: Pointer { instancetype }; cdecl;
    { class } function poundUnit: Pointer { instancetype }; cdecl;
    { class } function stoneUnit: Pointer { instancetype }; cdecl;
    { class } function moleUnitWithMetricPrefix(prefix: HKMetricPrefix;
      molarMass: Double): Pointer { instancetype }; cdecl;
    { class } function moleUnitWithMolarMass(gramsPerMole: Double)
      : Pointer { instancetype }; cdecl;
    { class } function meterUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function meterUnit: Pointer { instancetype }; cdecl;
    { class } function inchUnit: Pointer { instancetype }; cdecl;
    { class } function footUnit: Pointer { instancetype }; cdecl;
    { class } function yardUnit: Pointer { instancetype }; cdecl;
    { class } function mileUnit: Pointer { instancetype }; cdecl;
    { class } function literUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function literUnit: Pointer { instancetype }; cdecl;
    { class } function fluidOunceUSUnit: Pointer { instancetype }; cdecl;
    { class } function fluidOunceImperialUnit: Pointer { instancetype }; cdecl;
    { class } function pintUSUnit: Pointer { instancetype }; cdecl;
    { class } function pintImperialUnit: Pointer { instancetype }; cdecl;
    { class } function cupUSUnit: Pointer { instancetype }; cdecl;
    { class } function cupImperialUnit: Pointer { instancetype }; cdecl;
    { class } function pascalUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function pascalUnit: Pointer { instancetype }; cdecl;
    { class } function millimeterOfMercuryUnit: Pointer { instancetype }; cdecl;
    { class } function centimeterOfWaterUnit: Pointer { instancetype }; cdecl;
    { class } function atmosphereUnit: Pointer { instancetype }; cdecl;
    { class } function secondUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function secondUnit: Pointer { instancetype }; cdecl;
    { class } function minuteUnit: Pointer { instancetype }; cdecl;
    { class } function hourUnit: Pointer { instancetype }; cdecl;
    { class } function dayUnit: Pointer { instancetype }; cdecl;
    { class } function jouleUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function jouleUnit: Pointer { instancetype }; cdecl;
    { class } function calorieUnit: Pointer { instancetype }; cdecl;
    { class } function kilocalorieUnit: Pointer { instancetype }; cdecl;
    { class } function degreeCelsiusUnit: Pointer { instancetype }; cdecl;
    { class } function degreeFahrenheitUnit: Pointer { instancetype }; cdecl;
    { class } function kelvinUnit: Pointer { instancetype }; cdecl;
    { class } function siemenUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function siemenUnit: Pointer { instancetype }; cdecl;
    { class } function countUnit: Pointer { instancetype }; cdecl;
    { class } function percentUnit: Pointer { instancetype }; cdecl;
  end;

  HKUnit = interface(NSObject)
    ['{3993BDFA-03D3-4BF4-B0CA-7308889BB533}']
    function unitString: NSString; cdecl;
    function isNull: Boolean; cdecl;
    function unitMultipliedByUnit(&unit: HKUnit): HKUnit; cdecl;
    function unitDividedByUnit(&unit: HKUnit): HKUnit; cdecl;
    function unitRaisedToPower(power: NSInteger): HKUnit; cdecl;
    function reciprocalUnit: HKUnit; cdecl;
  end;

  THKUnit = class(TOCGenericImport<HKUnitClass, HKUnit>)
  end;

  PHKUnit = Pointer;

  HKWorkoutSessionClass = interface(NSObjectClass)
    ['{DF9381D9-0003-4400-8111-1C6B4F6B3DAE}']
  end;

  HKWorkoutSession = interface(NSObject)
    ['{4A0F3894-F88B-45C9-9ED1-0F3DC07BD987}']
    function activityType: HKWorkoutActivityType; cdecl;
    function locationType: HKWorkoutSessionLocationType; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function state: HKWorkoutSessionState; cdecl;
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function initWithActivityType(activityType: HKWorkoutActivityType;
      locationType: HKWorkoutSessionLocationType)
      : Pointer { instancetype }; cdecl;
  end;

  THKWorkoutSession = class(TOCGenericImport<HKWorkoutSessionClass,
    HKWorkoutSession>)
  end;

  PHKWorkoutSession = Pointer;

  HKHealthStoreClass = interface(NSObjectClass)
    ['{6D4A86F4-5CD0-45F9-B630-32803A68762F}']
    { class } function isHealthDataAvailable: Boolean; cdecl;
  end;

  HKHealthStore = interface(NSObject)
    ['{E22096A0-3248-4A11-9BBC-C06F42DFC9A6}']
    function authorizationStatusForType(&type: HKObjectType)
      : HKAuthorizationStatus; cdecl;
    procedure requestAuthorizationToShareTypes(typesToShare: NSSet;
      readTypes: NSSet; completion: THealthKitCompletion1); cdecl;
    procedure handleAuthorizationForExtensionWithCompletion
      (completion: THealthKitCompletion1); cdecl;
    function earliestPermittedSampleDate: NSDate; cdecl;
    procedure saveObject(&object: HKObject;
      withCompletion: THealthKitCompletion1); cdecl;
    procedure saveObjects(objects: NSArray;
      withCompletion: THealthKitCompletion1); cdecl;
    procedure deleteObject(&object: HKObject;
      withCompletion: THealthKitCompletion1); cdecl;
    procedure deleteObjects(objects: NSArray;
      withCompletion: THealthKitCompletion1); cdecl;
    procedure deleteObjectsOfType(objectType: HKObjectType;
      predicate: NSPredicate; withCompletion: THealthKitWithCompletion); cdecl;
    procedure executeQuery(query: HKQuery); cdecl;
    procedure stopQuery(query: HKQuery); cdecl;
    procedure splitTotalEnergy(totalEnergy: HKQuantity; startDate: NSDate;
      endDate: NSDate; resultsHandler: THealthKitResultsHandler); cdecl;
    function dateOfBirthWithError(error: NSError): NSDate; cdecl;
    function biologicalSexWithError(error: NSError)
      : HKBiologicalSexObject; cdecl;
    function bloodTypeWithError(error: NSError): HKBloodTypeObject; cdecl;
    function fitzpatrickSkinTypeWithError(error: NSError)
      : HKFitzpatrickSkinTypeObject; cdecl;
    procedure addSamples(samples: NSArray; toWorkout: HKWorkout;
      completion: THealthKitCompletion1); cdecl;
    procedure startWorkoutSession(workoutSession: HKWorkoutSession); cdecl;
    procedure endWorkoutSession(workoutSession: HKWorkoutSession); cdecl;
    procedure enableBackgroundDeliveryForType(&type: HKObjectType;
      frequency: HKUpdateFrequency;
      withCompletion: THealthKitCompletion1); cdecl;
    procedure disableBackgroundDeliveryForType(&type: HKObjectType;
      withCompletion: THealthKitCompletion1); cdecl;
    procedure disableAllBackgroundDeliveryWithCompletion
      (completion: THealthKitCompletion1); cdecl;
    procedure preferredUnitsForQuantityTypes(quantityTypes: NSSet;
      completion: THealthKitCompletion2); cdecl;
  end;

  THKHealthStore = class(TOCGenericImport<HKHealthStoreClass, HKHealthStore>)
  end;

  PHKHealthStore = Pointer;

  HKActivitySummaryTypeClass = interface(HKObjectTypeClass)
    ['{58A28009-6B54-4DDB-B80E-67CF51371075}']
  end;

  HKActivitySummaryType = interface(HKObjectType)
    ['{5EAA17F2-5EA9-4994-88D6-2D4B1413CA33}']
  end;

  THKActivitySummaryType = class(TOCGenericImport<HKActivitySummaryTypeClass,
    HKActivitySummaryType>)
  end;

  PHKActivitySummaryType = Pointer;

  HKCharacteristicTypeClass = interface(HKObjectTypeClass)
    ['{274659FA-094E-444A-A816-228257679FE7}']
  end;

  HKCharacteristicType = interface(HKObjectType)
    ['{8B901070-80AD-4CC1-894A-6909F5D86D33}']
  end;

  THKCharacteristicType = class(TOCGenericImport<HKCharacteristicTypeClass,
    HKCharacteristicType>)
  end;

  PHKCharacteristicType = Pointer;

  HKWorkoutTypeClass = interface(HKSampleTypeClass)
    ['{8E91807C-70A8-43C7-9B55-6265FC18E172}']
  end;

  HKWorkoutType = interface(HKSampleType)
    ['{E26A2142-6CF5-4DCC-8409-F180B11450E9}']
  end;

  THKWorkoutType = class(TOCGenericImport<HKWorkoutTypeClass, HKWorkoutType>)
  end;

  PHKWorkoutType = Pointer;

  HKObserverQueryClass = interface(HKQueryClass)
    ['{2CC0B395-4747-4BF2-8DBF-E96F4E4DB640}']
  end;

  HKObserverQuery = interface(HKQuery)
    ['{7E4D236E-F222-4C93-8537-86EA78314A56}']
    function initWithSampleType(sampleType: HKSampleType;
      predicate: NSPredicate; updateHandler: THealthKitUpdateHandler2)
      : Pointer { instancetype }; cdecl;
  end;

  THKObserverQuery = class(TOCGenericImport<HKObserverQueryClass,
    HKObserverQuery>)
  end;

  PHKObserverQuery = Pointer;

  HKQuantitySampleClass = interface(HKSampleClass)
    ['{44EF87A2-D77A-4E8E-A2BC-1EFED1057454}']
    [MethodName('quantitySampleWithType:quantity:startDate:endDate:')]
    { class } function quantitySampleWithTypeQuantityStartDateEndDate
      (quantityType: HKQuantityType; quantity: HKQuantity; startDate: NSDate;
      endDate: NSDate): Pointer { instancetype }; cdecl;
    [MethodName('quantitySampleWithType:quantity:startDate:endDate:metadata:')]
    { class } function quantitySampleWithTypeQuantityStartDateEndDateMetadata
      (quantityType: HKQuantityType; quantity: HKQuantity; startDate: NSDate;
      endDate: NSDate; metadata: NSDictionary): Pointer { instancetype }; cdecl;
    [MethodName
      ('quantitySampleWithType:quantity:startDate:endDate:device:metadata:')]
    { class } function
      quantitySampleWithTypeQuantityStartDateEndDateDeviceMetadata
      (quantityType: HKQuantityType; quantity: HKQuantity; startDate: NSDate;
      endDate: NSDate; device: HKDevice; metadata: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  HKQuantitySample = interface(HKSample)
    ['{6B7B6A0D-E8D1-4302-85B3-FF2F207C4364}']
    function quantityType: HKQuantityType; cdecl;
    function quantity: HKQuantity; cdecl;
  end;

  THKQuantitySample = class(TOCGenericImport<HKQuantitySampleClass,
    HKQuantitySample>)
  end;

  PHKQuantitySample = Pointer;

  HKSampleQueryClass = interface(HKQueryClass)
    ['{8FDFD2B7-F4AB-4C3D-9B32-C1C225D01E58}']
  end;

  HKSampleQuery = interface(HKQuery)
    ['{0ADC8D89-1AA8-4FE3-8D38-0F4EB573573C}']
    function limit: NSUInteger; cdecl;
    function sortDescriptors: NSArray; cdecl;
    function initWithSampleType(sampleType: HKSampleType;
      predicate: NSPredicate; limit: NSUInteger; sortDescriptors: NSArray;
      resultsHandler: THealthKitResultsHandler1)
      : Pointer { instancetype }; cdecl;
  end;

  THKSampleQuery = class(TOCGenericImport<HKSampleQueryClass, HKSampleQuery>)
  end;

  PHKSampleQuery = Pointer;

  HKSourceQueryClass = interface(HKQueryClass)
    ['{13F8B11A-F70D-45D6-9D6B-5C8460922A55}']
  end;

  HKSourceQuery = interface(HKQuery)
    ['{F8160C3A-D087-4162-B12F-86C6D9369DD8}']
    function initWithSampleType(sampleType: HKSampleType;
      samplePredicate: NSPredicate;
      completionHandler: THealthKitCompletionHandler1)
      : Pointer { instancetype }; cdecl;
  end;

  THKSourceQuery = class(TOCGenericImport<HKSourceQueryClass, HKSourceQuery>)
  end;

  PHKSourceQuery = Pointer;

  HKStatisticsClass = interface(NSObjectClass)
    ['{56017280-117D-486C-8C0A-EA5152CA0718}']
  end;

  HKStatistics = interface(NSObject)
    ['{67A97D1A-79AC-4FD5-B2C8-805F2E9F8C59}']
    function quantityType: HKQuantityType; cdecl;
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function sources: NSArray; cdecl;
    function averageQuantityForSource(source: HKSource): HKQuantity; cdecl;
    function averageQuantity: HKQuantity; cdecl;
    function minimumQuantityForSource(source: HKSource): HKQuantity; cdecl;
    function minimumQuantity: HKQuantity; cdecl;
    function maximumQuantityForSource(source: HKSource): HKQuantity; cdecl;
    function maximumQuantity: HKQuantity; cdecl;
    function sumQuantityForSource(source: HKSource): HKQuantity; cdecl;
    function sumQuantity: HKQuantity; cdecl;
  end;

  THKStatistics = class(TOCGenericImport<HKStatisticsClass, HKStatistics>)
  end;

  PHKStatistics = Pointer;

  HKStatisticsCollectionClass = interface(NSObjectClass)
    ['{2F8C091F-5C71-4854-8308-0B6FD7516B7C}']
  end;

  HKStatisticsCollection = interface(NSObject)
    ['{AFBFAC8E-65C7-424E-8D88-DC6037F52CE0}']
    function statisticsForDate(date: NSDate): HKStatistics; cdecl;
    procedure enumerateStatisticsFromDate(startDate: NSDate; toDate: NSDate;
      withBlock: THealthKitWithBlock); cdecl;
    function statistics: NSArray; cdecl;
    function sources: NSSet; cdecl;
  end;

  THKStatisticsCollection = class(TOCGenericImport<HKStatisticsCollectionClass,
    HKStatisticsCollection>)
  end;

  PHKStatisticsCollection = Pointer;

  HKStatisticsCollectionQueryClass = interface(HKQueryClass)
    ['{93B866D2-D292-41B8-92C0-E7E7860CDE9C}']
  end;

  HKStatisticsCollectionQuery = interface(HKQuery)
    ['{5A3A8C41-A3A2-4EF4-880A-0CAC61B9EB75}']
    function anchorDate: NSDate; cdecl;
    function options: HKStatisticsOptions; cdecl;
    function intervalComponents: NSDateComponents; cdecl;
    procedure setInitialResultsHandler(initialResultsHandler
      : THealthKitInitialResultsHandler); cdecl;
    function initialResultsHandler: THealthKitInitialResultsHandler; cdecl;
    procedure setStatisticsUpdateHandler(statisticsUpdateHandler
      : THealthKitStatisticsUpdateHandler); cdecl;
    function statisticsUpdateHandler: THealthKitStatisticsUpdateHandler; cdecl;
    function initWithQuantityType(quantityType: HKQuantityType;
      quantitySamplePredicate: NSPredicate; options: HKStatisticsOptions;
      anchorDate: NSDate; intervalComponents: NSDateComponents)
      : Pointer { instancetype }; cdecl;
  end;

  THKStatisticsCollectionQuery = class
    (TOCGenericImport<HKStatisticsCollectionQueryClass,
    HKStatisticsCollectionQuery>)
  end;

  PHKStatisticsCollectionQuery = Pointer;

  HKStatisticsQueryClass = interface(HKQueryClass)
    ['{1E4A68D5-90E1-444E-95BB-15FCB6BA4A42}']
  end;

  HKStatisticsQuery = interface(HKQuery)
    ['{16985E9A-75D0-44DF-A033-DA727AD83B06}']
    function initWithQuantityType(quantityType: HKQuantityType;
      quantitySamplePredicate: NSPredicate; options: HKStatisticsOptions;
      completionHandler: THealthKitCompletionHandler2)
      : Pointer { instancetype }; cdecl;
  end;

  THKStatisticsQuery = class(TOCGenericImport<HKStatisticsQueryClass,
    HKStatisticsQuery>)
  end;

  PHKStatisticsQuery = Pointer;

  // ===== Protocol declarations =====

  HKWorkoutSessionDelegate = interface(IObjectiveC)
    ['{074DDF18-2AEF-4DAD-A648-67DAEB220938}']
    [MethodName('workoutSession:didChangeToState:fromState:date:')]
    procedure workoutSessionDidChangeToStateFromStateDate(workoutSession
      : HKWorkoutSession; didChangeToState: HKWorkoutSessionState;
      fromState: HKWorkoutSessionState; date: NSDate); cdecl;
    [MethodName('workoutSession:didFailWithError:')]
    procedure workoutSessionDidFailWithError(workoutSession: HKWorkoutSession;
      didFailWithError: NSError); cdecl;
  end;

  // ===== Exported string consts =====

function HKErrorDomain: NSString;
function HKPredicateKeyPathDateComponents: NSString;
function HKPredicateKeyPathUUID: NSString;
function HKPredicateKeyPathSource: NSString;
function HKPredicateKeyPathMetadata: NSString;
function HKPredicateKeyPathCorrelation: NSString;
function HKPredicateKeyPathWorkout: NSString;
function HKPredicateKeyPathDevice: NSString;
function HKPredicateKeyPathSourceRevision: NSString;
function HKSampleSortIdentifierStartDate: NSString;
function HKSampleSortIdentifierEndDate: NSString;
function HKPredicateKeyPathStartDate: NSString;
function HKPredicateKeyPathEndDate: NSString;
function HKPredicateKeyPathWorkoutDuration: NSString;
function HKPredicateKeyPathWorkoutTotalDistance: NSString;
function HKPredicateKeyPathWorkoutTotalEnergyBurned: NSString;
function HKPredicateKeyPathWorkoutType: NSString;
function HKWorkoutSortIdentifierDuration: NSString;
function HKWorkoutSortIdentifierTotalDistance: NSString;
function HKWorkoutSortIdentifierTotalEnergyBurned: NSString;
function HKPredicateKeyPathCategoryValue: NSString;
function HKDevicePropertyKeyName: NSString;
function HKDevicePropertyKeyManufacturer: NSString;
function HKDevicePropertyKeyModel: NSString;
function HKDevicePropertyKeyHardwareVersion: NSString;
function HKDevicePropertyKeyFirmwareVersion: NSString;
function HKDevicePropertyKeySoftwareVersion: NSString;
function HKDevicePropertyKeyLocalIdentifier: NSString;
function HKDevicePropertyKeyUDIDeviceIdentifier: NSString;
function HKUserPreferencesDidChangeNotification: NSString;
function HKMetadataKeyDeviceSerialNumber: NSString;
function HKMetadataKeyBodyTemperatureSensorLocation: NSString;
function HKMetadataKeyHeartRateSensorLocation: NSString;
function HKMetadataKeyFoodType: NSString;
function HKMetadataKeyUDIDeviceIdentifier: NSString;
function HKMetadataKeyUDIProductionIdentifier: NSString;
function HKMetadataKeyDigitalSignature: NSString;
function HKMetadataKeyExternalUUID: NSString;
function HKMetadataKeyTimeZone: NSString;
function HKMetadataKeyDeviceName: NSString;
function HKMetadataKeyDeviceManufacturerName: NSString;
function HKMetadataKeyWasTakenInLab: NSString;
function HKMetadataKeyReferenceRangeLowerLimit: NSString;
function HKMetadataKeyReferenceRangeUpperLimit: NSString;
function HKMetadataKeyWasUserEntered: NSString;
function HKMetadataKeyWorkoutBrandName: NSString;
function HKMetadataKeyGroupFitness: NSString;
function HKMetadataKeyIndoorWorkout: NSString;
function HKMetadataKeyCoachedWorkout: NSString;
function HKMetadataKeySexualActivityProtectionUsed: NSString;
function HKMetadataKeyMenstrualCycleStart: NSString;
function HKQuantityTypeIdentifierBodyMassIndex: NSString;
function HKQuantityTypeIdentifierBodyFatPercentage: NSString;
function HKQuantityTypeIdentifierHeight: NSString;
function HKQuantityTypeIdentifierBodyMass: NSString;
function HKQuantityTypeIdentifierLeanBodyMass: NSString;
function HKQuantityTypeIdentifierStepCount: NSString;
function HKQuantityTypeIdentifierDistanceWalkingRunning: NSString;
function HKQuantityTypeIdentifierDistanceCycling: NSString;
function HKQuantityTypeIdentifierBasalEnergyBurned: NSString;
function HKQuantityTypeIdentifierActiveEnergyBurned: NSString;
function HKQuantityTypeIdentifierFlightsClimbed: NSString;
function HKQuantityTypeIdentifierNikeFuel: NSString;
function HKQuantityTypeIdentifierAppleExerciseTime: NSString;
function HKQuantityTypeIdentifierHeartRate: NSString;
function HKQuantityTypeIdentifierBodyTemperature: NSString;
function HKQuantityTypeIdentifierBasalBodyTemperature: NSString;
function HKQuantityTypeIdentifierBloodPressureSystolic: NSString;
function HKQuantityTypeIdentifierBloodPressureDiastolic: NSString;
function HKQuantityTypeIdentifierRespiratoryRate: NSString;
function HKQuantityTypeIdentifierOxygenSaturation: NSString;
function HKQuantityTypeIdentifierPeripheralPerfusionIndex: NSString;
function HKQuantityTypeIdentifierBloodGlucose: NSString;
function HKQuantityTypeIdentifierNumberOfTimesFallen: NSString;
function HKQuantityTypeIdentifierElectrodermalActivity: NSString;
function HKQuantityTypeIdentifierInhalerUsage: NSString;
function HKQuantityTypeIdentifierBloodAlcoholContent: NSString;
function HKQuantityTypeIdentifierForcedVitalCapacity: NSString;
function HKQuantityTypeIdentifierForcedExpiratoryVolume1: NSString;
function HKQuantityTypeIdentifierPeakExpiratoryFlowRate: NSString;
function HKQuantityTypeIdentifierDietaryFatTotal: NSString;
function HKQuantityTypeIdentifierDietaryFatPolyunsaturated: NSString;
function HKQuantityTypeIdentifierDietaryFatMonounsaturated: NSString;
function HKQuantityTypeIdentifierDietaryFatSaturated: NSString;
function HKQuantityTypeIdentifierDietaryCholesterol: NSString;
function HKQuantityTypeIdentifierDietarySodium: NSString;
function HKQuantityTypeIdentifierDietaryCarbohydrates: NSString;
function HKQuantityTypeIdentifierDietaryFiber: NSString;
function HKQuantityTypeIdentifierDietarySugar: NSString;
function HKQuantityTypeIdentifierDietaryEnergyConsumed: NSString;
function HKQuantityTypeIdentifierDietaryProtein: NSString;
function HKQuantityTypeIdentifierDietaryVitaminA: NSString;
function HKQuantityTypeIdentifierDietaryVitaminB6: NSString;
function HKQuantityTypeIdentifierDietaryVitaminB12: NSString;
function HKQuantityTypeIdentifierDietaryVitaminC: NSString;
function HKQuantityTypeIdentifierDietaryVitaminD: NSString;
function HKQuantityTypeIdentifierDietaryVitaminE: NSString;
function HKQuantityTypeIdentifierDietaryVitaminK: NSString;
function HKQuantityTypeIdentifierDietaryCalcium: NSString;
function HKQuantityTypeIdentifierDietaryIron: NSString;
function HKQuantityTypeIdentifierDietaryThiamin: NSString;
function HKQuantityTypeIdentifierDietaryRiboflavin: NSString;
function HKQuantityTypeIdentifierDietaryNiacin: NSString;
function HKQuantityTypeIdentifierDietaryFolate: NSString;
function HKQuantityTypeIdentifierDietaryBiotin: NSString;
function HKQuantityTypeIdentifierDietaryPantothenicAcid: NSString;
function HKQuantityTypeIdentifierDietaryPhosphorus: NSString;
function HKQuantityTypeIdentifierDietaryIodine: NSString;
function HKQuantityTypeIdentifierDietaryMagnesium: NSString;
function HKQuantityTypeIdentifierDietaryZinc: NSString;
function HKQuantityTypeIdentifierDietarySelenium: NSString;
function HKQuantityTypeIdentifierDietaryCopper: NSString;
function HKQuantityTypeIdentifierDietaryManganese: NSString;
function HKQuantityTypeIdentifierDietaryChromium: NSString;
function HKQuantityTypeIdentifierDietaryMolybdenum: NSString;
function HKQuantityTypeIdentifierDietaryChloride: NSString;
function HKQuantityTypeIdentifierDietaryPotassium: NSString;
function HKQuantityTypeIdentifierDietaryCaffeine: NSString;
function HKQuantityTypeIdentifierDietaryWater: NSString;
function HKQuantityTypeIdentifierUVExposure: NSString;
function HKCategoryTypeIdentifierSleepAnalysis: NSString;
function HKCategoryTypeIdentifierAppleStandHour: NSString;
function HKCategoryTypeIdentifierCervicalMucusQuality: NSString;
function HKCategoryTypeIdentifierOvulationTestResult: NSString;
function HKCategoryTypeIdentifierMenstrualFlow: NSString;
function HKCategoryTypeIdentifierIntermenstrualBleeding: NSString;
function HKCategoryTypeIdentifierSexualActivity: NSString;
function HKCharacteristicTypeIdentifierBiologicalSex: NSString;
function HKCharacteristicTypeIdentifierBloodType: NSString;
function HKCharacteristicTypeIdentifierDateOfBirth: NSString;
function HKCharacteristicTypeIdentifierFitzpatrickSkinType: NSString;
function HKCorrelationTypeIdentifierBloodPressure: NSString;
function HKCorrelationTypeIdentifierFood: NSString;
function HKWorkoutTypeIdentifier: NSString;
function HKPredicateKeyPathQuantity: NSString;


// ===== External functions =====

const
  libHealthKit = '/System/Library/Frameworks/HealthKit.framework/HealthKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  HealthKitModule: THandle;

{$ENDIF IOS}

function HKErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKErrorDomain');
end;

function HKPredicateKeyPathDateComponents: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathDateComponents');
end;

function HKPredicateKeyPathUUID: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathUUID');
end;

function HKPredicateKeyPathSource: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathSource');
end;

function HKPredicateKeyPathMetadata: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathMetadata');
end;

function HKPredicateKeyPathCorrelation: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathCorrelation');
end;

function HKPredicateKeyPathWorkout: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathWorkout');
end;

function HKPredicateKeyPathDevice: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathDevice');
end;

function HKPredicateKeyPathSourceRevision: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathSourceRevision');
end;

function HKSampleSortIdentifierStartDate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKSampleSortIdentifierStartDate');
end;

function HKSampleSortIdentifierEndDate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKSampleSortIdentifierEndDate');
end;

function HKPredicateKeyPathStartDate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathStartDate');
end;

function HKPredicateKeyPathEndDate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathEndDate');
end;

function HKPredicateKeyPathWorkoutDuration: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutDuration');
end;

function HKPredicateKeyPathWorkoutTotalDistance: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutTotalDistance');
end;

function HKPredicateKeyPathWorkoutTotalEnergyBurned: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutTotalEnergyBurned');
end;

function HKPredicateKeyPathWorkoutType: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathWorkoutType');
end;

function HKWorkoutSortIdentifierDuration: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKWorkoutSortIdentifierDuration');
end;

function HKWorkoutSortIdentifierTotalDistance: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKWorkoutSortIdentifierTotalDistance');
end;

function HKWorkoutSortIdentifierTotalEnergyBurned: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKWorkoutSortIdentifierTotalEnergyBurned');
end;

function HKPredicateKeyPathCategoryValue: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathCategoryValue');
end;

function HKDevicePropertyKeyName: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKDevicePropertyKeyName');
end;

function HKDevicePropertyKeyManufacturer: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKDevicePropertyKeyManufacturer');
end;

function HKDevicePropertyKeyModel: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKDevicePropertyKeyModel');
end;

function HKDevicePropertyKeyHardwareVersion: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKDevicePropertyKeyHardwareVersion');
end;

function HKDevicePropertyKeyFirmwareVersion: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKDevicePropertyKeyFirmwareVersion');
end;

function HKDevicePropertyKeySoftwareVersion: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKDevicePropertyKeySoftwareVersion');
end;

function HKDevicePropertyKeyLocalIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKDevicePropertyKeyLocalIdentifier');
end;

function HKDevicePropertyKeyUDIDeviceIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKDevicePropertyKeyUDIDeviceIdentifier');
end;

function HKUserPreferencesDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKUserPreferencesDidChangeNotification');
end;

function HKMetadataKeyDeviceSerialNumber: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyDeviceSerialNumber');
end;

function HKMetadataKeyBodyTemperatureSensorLocation: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyBodyTemperatureSensorLocation');
end;

function HKMetadataKeyHeartRateSensorLocation: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyHeartRateSensorLocation');
end;

function HKMetadataKeyFoodType: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyFoodType');
end;

function HKMetadataKeyUDIDeviceIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyUDIDeviceIdentifier');
end;

function HKMetadataKeyUDIProductionIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyUDIProductionIdentifier');
end;

function HKMetadataKeyDigitalSignature: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyDigitalSignature');
end;

function HKMetadataKeyExternalUUID: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyExternalUUID');
end;

function HKMetadataKeyTimeZone: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyTimeZone');
end;

function HKMetadataKeyDeviceName: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyDeviceName');
end;

function HKMetadataKeyDeviceManufacturerName: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyDeviceManufacturerName');
end;

function HKMetadataKeyWasTakenInLab: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyWasTakenInLab');
end;

function HKMetadataKeyReferenceRangeLowerLimit: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyReferenceRangeLowerLimit');
end;

function HKMetadataKeyReferenceRangeUpperLimit: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyReferenceRangeUpperLimit');
end;

function HKMetadataKeyWasUserEntered: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyWasUserEntered');
end;

function HKMetadataKeyWorkoutBrandName: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyWorkoutBrandName');
end;

function HKMetadataKeyGroupFitness: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyGroupFitness');
end;

function HKMetadataKeyIndoorWorkout: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyIndoorWorkout');
end;

function HKMetadataKeyCoachedWorkout: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyCoachedWorkout');
end;

function HKMetadataKeySexualActivityProtectionUsed: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeySexualActivityProtectionUsed');
end;

function HKMetadataKeyMenstrualCycleStart: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyMenstrualCycleStart');
end;

function HKQuantityTypeIdentifierBodyMassIndex: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierBodyMassIndex');
end;

function HKQuantityTypeIdentifierBodyFatPercentage: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierBodyFatPercentage');
end;

function HKQuantityTypeIdentifierHeight: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKQuantityTypeIdentifierHeight');
end;

function HKQuantityTypeIdentifierBodyMass: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierBodyMass');
end;

function HKQuantityTypeIdentifierLeanBodyMass: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierLeanBodyMass');
end;

function HKQuantityTypeIdentifierStepCount: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierStepCount');
end;

function HKQuantityTypeIdentifierDistanceWalkingRunning: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDistanceWalkingRunning');
end;

function HKQuantityTypeIdentifierDistanceCycling: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDistanceCycling');
end;

function HKQuantityTypeIdentifierBasalEnergyBurned: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierBasalEnergyBurned');
end;

function HKQuantityTypeIdentifierActiveEnergyBurned: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierActiveEnergyBurned');
end;

function HKQuantityTypeIdentifierFlightsClimbed: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierFlightsClimbed');
end;

function HKQuantityTypeIdentifierNikeFuel: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierNikeFuel');
end;

function HKQuantityTypeIdentifierAppleExerciseTime: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierAppleExerciseTime');
end;

function HKQuantityTypeIdentifierHeartRate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierHeartRate');
end;

function HKQuantityTypeIdentifierBodyTemperature: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierBodyTemperature');
end;

function HKQuantityTypeIdentifierBasalBodyTemperature: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierBasalBodyTemperature');
end;

function HKQuantityTypeIdentifierBloodPressureSystolic: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierBloodPressureSystolic');
end;

function HKQuantityTypeIdentifierBloodPressureDiastolic: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierBloodPressureDiastolic');
end;

function HKQuantityTypeIdentifierRespiratoryRate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierRespiratoryRate');
end;

function HKQuantityTypeIdentifierOxygenSaturation: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierOxygenSaturation');
end;

function HKQuantityTypeIdentifierPeripheralPerfusionIndex: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierPeripheralPerfusionIndex');
end;

function HKQuantityTypeIdentifierBloodGlucose: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierBloodGlucose');
end;

function HKQuantityTypeIdentifierNumberOfTimesFallen: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierNumberOfTimesFallen');
end;

function HKQuantityTypeIdentifierElectrodermalActivity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierElectrodermalActivity');
end;

function HKQuantityTypeIdentifierInhalerUsage: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierInhalerUsage');
end;

function HKQuantityTypeIdentifierBloodAlcoholContent: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierBloodAlcoholContent');
end;

function HKQuantityTypeIdentifierForcedVitalCapacity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierForcedVitalCapacity');
end;

function HKQuantityTypeIdentifierForcedExpiratoryVolume1: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierForcedExpiratoryVolume1');
end;

function HKQuantityTypeIdentifierPeakExpiratoryFlowRate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierPeakExpiratoryFlowRate');
end;

function HKQuantityTypeIdentifierDietaryFatTotal: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryFatTotal');
end;

function HKQuantityTypeIdentifierDietaryFatPolyunsaturated: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryFatPolyunsaturated');
end;

function HKQuantityTypeIdentifierDietaryFatMonounsaturated: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryFatMonounsaturated');
end;

function HKQuantityTypeIdentifierDietaryFatSaturated: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryFatSaturated');
end;

function HKQuantityTypeIdentifierDietaryCholesterol: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryCholesterol');
end;

function HKQuantityTypeIdentifierDietarySodium: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietarySodium');
end;

function HKQuantityTypeIdentifierDietaryCarbohydrates: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryCarbohydrates');
end;

function HKQuantityTypeIdentifierDietaryFiber: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryFiber');
end;

function HKQuantityTypeIdentifierDietarySugar: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietarySugar');
end;

function HKQuantityTypeIdentifierDietaryEnergyConsumed: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryEnergyConsumed');
end;

function HKQuantityTypeIdentifierDietaryProtein: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryProtein');
end;

function HKQuantityTypeIdentifierDietaryVitaminA: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminA');
end;

function HKQuantityTypeIdentifierDietaryVitaminB6: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminB6');
end;

function HKQuantityTypeIdentifierDietaryVitaminB12: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminB12');
end;

function HKQuantityTypeIdentifierDietaryVitaminC: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminC');
end;

function HKQuantityTypeIdentifierDietaryVitaminD: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminD');
end;

function HKQuantityTypeIdentifierDietaryVitaminE: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminE');
end;

function HKQuantityTypeIdentifierDietaryVitaminK: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminK');
end;

function HKQuantityTypeIdentifierDietaryCalcium: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryCalcium');
end;

function HKQuantityTypeIdentifierDietaryIron: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryIron');
end;

function HKQuantityTypeIdentifierDietaryThiamin: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryThiamin');
end;

function HKQuantityTypeIdentifierDietaryRiboflavin: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryRiboflavin');
end;

function HKQuantityTypeIdentifierDietaryNiacin: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryNiacin');
end;

function HKQuantityTypeIdentifierDietaryFolate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryFolate');
end;

function HKQuantityTypeIdentifierDietaryBiotin: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryBiotin');
end;

function HKQuantityTypeIdentifierDietaryPantothenicAcid: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryPantothenicAcid');
end;

function HKQuantityTypeIdentifierDietaryPhosphorus: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryPhosphorus');
end;

function HKQuantityTypeIdentifierDietaryIodine: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryIodine');
end;

function HKQuantityTypeIdentifierDietaryMagnesium: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryMagnesium');
end;

function HKQuantityTypeIdentifierDietaryZinc: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryZinc');
end;

function HKQuantityTypeIdentifierDietarySelenium: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietarySelenium');
end;

function HKQuantityTypeIdentifierDietaryCopper: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryCopper');
end;

function HKQuantityTypeIdentifierDietaryManganese: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryManganese');
end;

function HKQuantityTypeIdentifierDietaryChromium: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryChromium');
end;

function HKQuantityTypeIdentifierDietaryMolybdenum: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryMolybdenum');
end;

function HKQuantityTypeIdentifierDietaryChloride: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryChloride');
end;

function HKQuantityTypeIdentifierDietaryPotassium: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryPotassium');
end;

function HKQuantityTypeIdentifierDietaryCaffeine: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryCaffeine');
end;

function HKQuantityTypeIdentifierDietaryWater: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryWater');
end;

function HKQuantityTypeIdentifierUVExposure: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKQuantityTypeIdentifierUVExposure');
end;

function HKCategoryTypeIdentifierSleepAnalysis: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKCategoryTypeIdentifierSleepAnalysis');
end;

function HKCategoryTypeIdentifierAppleStandHour: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKCategoryTypeIdentifierAppleStandHour');
end;

function HKCategoryTypeIdentifierCervicalMucusQuality: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKCategoryTypeIdentifierCervicalMucusQuality');
end;

function HKCategoryTypeIdentifierOvulationTestResult: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKCategoryTypeIdentifierOvulationTestResult');
end;

function HKCategoryTypeIdentifierMenstrualFlow: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKCategoryTypeIdentifierMenstrualFlow');
end;

function HKCategoryTypeIdentifierIntermenstrualBleeding: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKCategoryTypeIdentifierIntermenstrualBleeding');
end;

function HKCategoryTypeIdentifierSexualActivity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKCategoryTypeIdentifierSexualActivity');
end;

function HKCharacteristicTypeIdentifierBiologicalSex: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKCharacteristicTypeIdentifierBiologicalSex');
end;

function HKCharacteristicTypeIdentifierBloodType: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKCharacteristicTypeIdentifierBloodType');
end;

function HKCharacteristicTypeIdentifierDateOfBirth: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKCharacteristicTypeIdentifierDateOfBirth');
end;

function HKCharacteristicTypeIdentifierFitzpatrickSkinType: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKCharacteristicTypeIdentifierFitzpatrickSkinType');
end;

function HKCorrelationTypeIdentifierBloodPressure: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKCorrelationTypeIdentifierBloodPressure');
end;

function HKCorrelationTypeIdentifierFood: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKCorrelationTypeIdentifierFood');
end;

function HKWorkoutTypeIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKWorkoutTypeIdentifier');
end;

function HKPredicateKeyPathQuantity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathQuantity');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

HealthKitModule := dlopen(MarshaledAString(libHealthKit), RTLD_LAZY);

finalization

dlclose(HealthKitModule);
{$ENDIF IOS}

end.
