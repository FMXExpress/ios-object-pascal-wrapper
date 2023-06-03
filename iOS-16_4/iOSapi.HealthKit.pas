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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
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
  HKErrorRequiredAuthorizationDenied = 10;
  HKErrorNoData = 11;
  HKUpdateFrequencyImmediate = 1;
  HKUpdateFrequencyHourly = 2;
  HKUpdateFrequencyDaily = 3;
  HKUpdateFrequencyWeekly = 4;
  HKAuthorizationStatusNotDetermined = 0;
  HKAuthorizationStatusSharingDenied = 1;
  HKAuthorizationStatusSharingAuthorized = 2;
  HKAuthorizationRequestStatusUnknown = 0;
  HKAuthorizationRequestStatusShouldRequest = 1;
  HKAuthorizationRequestStatusUnnecessary = 2;
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
  HKCategoryValueSleepAnalysisAsleepUnspecified = 1;
  HKCategoryValueSleepAnalysisAsleep =
    HKCategoryValueSleepAnalysisAsleepUnspecified;
  HKCategoryValueSleepAnalysisAwake = 2;
  HKCategoryValueSleepAnalysisAsleepCore = 3;
  HKCategoryValueSleepAnalysisAsleepDeep = 4;
  HKCategoryValueSleepAnalysisAsleepREM = 5;
  HKCategoryValueAppleStandHourStood = 0;
  HKCategoryValueAppleStandHourIdle = 1;
  HKFitzpatrickSkinTypeNotSet = 0;
  HKFitzpatrickSkinTypeI = 1;
  HKFitzpatrickSkinTypeII = 2;
  HKFitzpatrickSkinTypeIII = 3;
  HKFitzpatrickSkinTypeIV = 4;
  HKFitzpatrickSkinTypeV = 5;
  HKFitzpatrickSkinTypeVI = 6;
  HKWheelchairUseNotSet = 0;
  HKWheelchairUseNo = 1;
  HKWheelchairUseYes = 2;
  HKCategoryValueCervicalMucusQualityDry = 1;
  HKCategoryValueCervicalMucusQualitySticky = 2;
  HKCategoryValueCervicalMucusQualityCreamy = 3;
  HKCategoryValueCervicalMucusQualityWatery = 4;
  HKCategoryValueCervicalMucusQualityEggWhite = 5;
  HKCategoryValueOvulationTestResultNegative = 1;
  HKCategoryValueOvulationTestResultLuteinizingHormoneSurge = 2;
  HKCategoryValueOvulationTestResultPositive =
    HKCategoryValueOvulationTestResultLuteinizingHormoneSurge;
  HKCategoryValueOvulationTestResultIndeterminate = 3;
  HKCategoryValueOvulationTestResultEstrogenSurge = 4;
  HKCategoryValuePregnancyTestResultNegative = 1;
  HKCategoryValuePregnancyTestResultPositive = 2;
  HKCategoryValuePregnancyTestResultIndeterminate = 3;
  HKCategoryValueProgesteroneTestResultNegative = 1;
  HKCategoryValueProgesteroneTestResultPositive = 2;
  HKCategoryValueProgesteroneTestResultIndeterminate = 3;
  HKCategoryValueMenstrualFlowUnspecified = 1;
  HKCategoryValueMenstrualFlowLight = 2;
  HKCategoryValueMenstrualFlowMedium = 3;
  HKCategoryValueMenstrualFlowHeavy = 4;
  HKCategoryValueMenstrualFlowNone = 5;
  HKCategoryValueNotApplicable = 0;
  HKCategoryValueAudioExposureEventLoudEnvironment = 1;
  HKCategoryValueEnvironmentalAudioExposureEventMomentaryLimit = 1;
  HKCategoryValueContraceptiveUnspecified = 1;
  HKCategoryValueContraceptiveImplant = 2;
  HKCategoryValueContraceptiveInjection = 3;
  HKCategoryValueContraceptiveIntrauterineDevice = 4;
  HKCategoryValueContraceptiveIntravaginalRing = 5;
  HKCategoryValueContraceptiveOral = 6;
  HKCategoryValueContraceptivePatch = 7;
  HKCategoryValueSeverityUnspecified = 0;
  HKCategoryValueSeverityNotPresent = 1;
  HKCategoryValueSeverityMild = 2;
  HKCategoryValueSeverityModerate = 3;
  HKCategoryValueSeveritySevere = 4;
  HKCategoryValueAppetiteChangesUnspecified = 0;
  HKCategoryValueAppetiteChangesNoChange = 1;
  HKCategoryValueAppetiteChangesDecreased = 2;
  HKCategoryValueAppetiteChangesIncreased = 3;
  HKCategoryValuePresencePresent = 0;
  HKCategoryValuePresenceNotPresent = 1;
  HKCategoryValueHeadphoneAudioExposureEventSevenDayLimit = 1;
  HKCategoryValueLowCardioFitnessEventLowFitness = 1;
  HKActivityMoveModeActiveEnergy = 1;
  HKActivityMoveModeAppleMoveTime = 2;
  HKCategoryValueAppleWalkingSteadinessEventInitialLow = 1;
  HKCategoryValueAppleWalkingSteadinessEventInitialVeryLow = 2;
  HKCategoryValueAppleWalkingSteadinessEventRepeatLow = 3;
  HKCategoryValueAppleWalkingSteadinessEventRepeatVeryLow = 4;
  HKElectrocardiogramLeadAppleWatchSimilarToLeadI = 1;
  HKElectrocardiogramClassificationNotSet = 0;
  HKElectrocardiogramClassificationSinusRhythm = 1;
  HKElectrocardiogramClassificationAtrialFibrillation = 2;
  HKElectrocardiogramClassificationInconclusiveLowHeartRate = 3;
  HKElectrocardiogramClassificationInconclusiveHighHeartRate = 4;
  HKElectrocardiogramClassificationInconclusivePoorReading = 5;
  HKElectrocardiogramClassificationInconclusiveOther = 6;
  HKElectrocardiogramClassificationUnrecognized = 100;
  HKElectrocardiogramSymptomsStatusNotSet = 0;
  HKElectrocardiogramSymptomsStatusNone = 1;
  HKElectrocardiogramSymptomsStatusPresent = 2;
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
  HKWorkoutActivityTypeBarre = 58;
  HKWorkoutActivityTypeCoreTraining = 59;
  HKWorkoutActivityTypeCrossCountrySkiing = 60;
  HKWorkoutActivityTypeDownhillSkiing = 61;
  HKWorkoutActivityTypeFlexibility = 62;
  HKWorkoutActivityTypeHighIntensityIntervalTraining = 63;
  HKWorkoutActivityTypeJumpRope = 64;
  HKWorkoutActivityTypeKickboxing = 65;
  HKWorkoutActivityTypePilates = 66;
  HKWorkoutActivityTypeSnowboarding = 67;
  HKWorkoutActivityTypeStairs = 68;
  HKWorkoutActivityTypeStepTraining = 69;
  HKWorkoutActivityTypeWheelchairWalkPace = 70;
  HKWorkoutActivityTypeWheelchairRunPace = 71;
  HKWorkoutActivityTypeTaiChi = 72;
  HKWorkoutActivityTypeMixedCardio = 73;
  HKWorkoutActivityTypeHandCycling = 74;
  HKWorkoutActivityTypeDiscSports = 75;
  HKWorkoutActivityTypeFitnessGaming = 76;
  HKWorkoutActivityTypeCardioDance = 77;
  HKWorkoutActivityTypeSocialDance = 78;
  HKWorkoutActivityTypePickleball = 79;
  HKWorkoutActivityTypeCooldown = 80;
  HKWorkoutActivityTypeSwimBikeRun = 82;
  HKWorkoutActivityTypeTransition = 83;
  HKWorkoutActivityTypeOther = 3000;
  HKWorkoutEventTypePause = 1;
  HKWorkoutEventTypeResume = 2;
  HKWorkoutEventTypeLap = 3;
  HKWorkoutEventTypeMarker = 4;
  HKWorkoutEventTypeMotionPaused = 5;
  HKWorkoutEventTypeMotionResumed = 6;
  HKWorkoutEventTypeSegment = 7;
  HKWorkoutEventTypePauseOrResumeRequest = 8;
  HKQueryOptionNone = 0;
  HKQueryOptionStrictStartDate = 1 shl 0;
  HKQueryOptionStrictEndDate = 1 shl 1;
  HKQuantityAggregationStyleCumulative = 0;
  HKQuantityAggregationStyleDiscreteArithmetic = 1;
  HKQuantityAggregationStyleDiscrete =
    HKQuantityAggregationStyleDiscreteArithmetic;
  HKQuantityAggregationStyleDiscreteTemporallyWeighted = 2;
  HKQuantityAggregationStyleDiscreteEquivalentContinuousLevel = 3;
  HKAppleWalkingSteadinessClassificationOK = 1;
  HKAppleWalkingSteadinessClassificationLow = 2;
  HKAppleWalkingSteadinessClassificationVeryLow = 3;
  HKVisionPrescriptionTypeGlasses = 1;
  HKVisionPrescriptionTypeContacts = 2;
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
  HKHeartRateMotionContextNotSet = 0;
  HKHeartRateMotionContextSedentary = 1;
  HKHeartRateMotionContextActive = 2;
  HKUserMotionContextNotSet = 0;
  HKUserMotionContextStationary = 1;
  HKUserMotionContextActive = 2;
  HKHeartRateRecoveryTestTypeMaxExercise = 1;
  HKHeartRateRecoveryTestTypePredictionSubMaxExercise = 2;
  HKHeartRateRecoveryTestTypePredictionNonExercise = 3;
  HKWeatherConditionNone = 0;
  HKWeatherConditionClear = 1;
  HKWeatherConditionFair = 2;
  HKWeatherConditionPartlyCloudy = 3;
  HKWeatherConditionMostlyCloudy = 4;
  HKWeatherConditionCloudy = 5;
  HKWeatherConditionFoggy = 6;
  HKWeatherConditionHaze = 7;
  HKWeatherConditionWindy = 8;
  HKWeatherConditionBlustery = 9;
  HKWeatherConditionSmoky = 10;
  HKWeatherConditionDust = 11;
  HKWeatherConditionSnow = 12;
  HKWeatherConditionHail = 13;
  HKWeatherConditionSleet = 14;
  HKWeatherConditionFreezingDrizzle = 15;
  HKWeatherConditionFreezingRain = 16;
  HKWeatherConditionMixedRainAndHail = 17;
  HKWeatherConditionMixedRainAndSnow = 18;
  HKWeatherConditionMixedRainAndSleet = 19;
  HKWeatherConditionMixedSnowAndSleet = 20;
  HKWeatherConditionDrizzle = 21;
  HKWeatherConditionScatteredShowers = 22;
  HKWeatherConditionShowers = 23;
  HKWeatherConditionThunderstorms = 24;
  HKWeatherConditionTropicalStorm = 25;
  HKWeatherConditionHurricane = 26;
  HKWeatherConditionTornado = 27;
  HKWorkoutSwimmingLocationTypeUnknown = 0;
  HKWorkoutSwimmingLocationTypePool = 1;
  HKWorkoutSwimmingLocationTypeOpenWater = 2;
  HKSwimmingStrokeStyleUnknown = 0;
  HKSwimmingStrokeStyleMixed = 1;
  HKSwimmingStrokeStyleFreestyle = 2;
  HKSwimmingStrokeStyleBackstroke = 3;
  HKSwimmingStrokeStyleBreaststroke = 4;
  HKSwimmingStrokeStyleButterfly = 5;
  HKSwimmingStrokeStyleKickboard = 6;
  HKInsulinDeliveryReasonBasal = 1;
  HKInsulinDeliveryReasonBolus = 2;
  HKBloodGlucoseMealTimePreprandial = 1;
  HKBloodGlucoseMealTimePostprandial = 2;
  HKVO2MaxTestTypeMaxExercise = 1;
  HKVO2MaxTestTypePredictionSubMaxExercise = 2;
  HKVO2MaxTestTypePredictionNonExercise = 3;
  HKAppleECGAlgorithmVersion1 = 1;
  HKAppleECGAlgorithmVersion2 = 2;
  HKDevicePlacementSideUnknown = 0;
  HKDevicePlacementSideLeft = 1;
  HKDevicePlacementSideRight = 2;
  HKDevicePlacementSideCentral = 3;
  HKStatisticsOptionNone = 0;
  HKStatisticsOptionSeparateBySource = 1 shl 0;
  HKStatisticsOptionDiscreteAverage = 1 shl 1;
  HKStatisticsOptionDiscreteMin = 1 shl 2;
  HKStatisticsOptionDiscreteMax = 1 shl 3;
  HKStatisticsOptionCumulativeSum = 1 shl 4;
  HKStatisticsOptionMostRecent = 1 shl 5;
  HKStatisticsOptionDiscreteMostRecent = HKStatisticsOptionMostRecent;
  HKStatisticsOptionDuration = 1 shl 6;
  HKMetricPrefixNone = 0;
  HKMetricPrefixFemto = 13;
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
  HKPrismBaseNone = 0;
  HKPrismBaseUp = 1;
  HKPrismBaseDown = 2;
  HKPrismBaseIn = 3;
  HKPrismBaseOut = 4;
  HKVisionEyeLeft = 1;
  HKVisionEyeRight = 2;
  HKWorkoutSessionLocationTypeUnknown = 1;
  HKWorkoutSessionLocationTypeIndoor = 2;
  HKWorkoutSessionLocationTypeOutdoor = 3;
  HKWorkoutSessionStateNotStarted = 1;
  HKWorkoutSessionStateRunning = 2;
  HKWorkoutSessionStateEnded = 3;
  HKWorkoutSessionStatePaused = 4;
  HKWorkoutSessionStatePrepared = 5;
  HKWorkoutSessionStateStopped = 6;

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
  HKElectrocardiogram = interface;
  HKFHIRVersion = interface;
  HKFHIRResource = interface;
  HKQuantityType = interface;
  HKStatistics = interface;
  HKWorkoutActivity = interface;
  HKWorkoutEvent = interface;
  HKWorkout = interface;
  HKObjectType = interface;
  HKQuery = interface;
  HKActivitySummaryQuery = interface;
  HKQueryAnchor = interface;
  HKActivitySummaryType = interface;
  HKAudiogramSampleType = interface;
  HKCategoryType = interface;
  HKCharacteristicType = interface;
  HKCorrelationType = interface;
  HKDocumentType = interface;
  HKElectrocardiogramType = interface;
  HKSeriesType = interface;
  HKUnit = interface;
  HKPrescriptionType = interface;
  HKWorkoutType = interface;
  HKQueryDescriptor = interface;
  HKDeletedObject = interface;
  HKAnchoredObjectQuery = interface;
  HKAttachment = interface;
  HKHealthStore = interface;
  HKAttachmentStore = interface;
  HKAudiogramSensitivityPoint = interface;
  HKAudiogramSample = interface;
  HKDocumentSample = interface;
  HKCDADocument = interface;
  HKCDADocumentSample = interface;
  HKCategorySample = interface;
  HKBiologicalSexObject = interface;
  HKBloodTypeObject = interface;
  HKFitzpatrickSkinTypeObject = interface;
  HKWheelchairUseObject = interface;
  HKActivityMoveModeObject = interface;
  HKClinicalType = interface;
  HKClinicalRecord = interface;
  HKLensSpecification = interface;
  HKVisionPrism = interface;
  HKContactsLensSpecification = interface;
  HKVisionPrescription = interface;
  HKContactsPrescription = interface;
  HKCorrelation = interface;
  HKCorrelationQuery = interface;
  HKQuantitySample = interface;
  HKCumulativeQuantitySample = interface;
  HKCumulativeQuantitySeriesSample = interface;
  HKDiscreteQuantitySample = interface;
  HKDocumentQuery = interface;
  HKElectrocardiogramVoltageMeasurement = interface;
  HKElectrocardiogramQuery = interface;
  HKGlassesLensSpecification = interface;
  HKGlassesPrescription = interface;
  HKWorkoutBuilder = interface;
  HKWorkoutConfiguration = interface;
  HKWorkoutSession = interface;
  HKSeriesBuilder = interface;
  HKHeartbeatSeriesSample = interface;
  HKHeartbeatSeriesBuilder = interface;
  HKHeartbeatSeriesQuery = interface;
  HKSeriesSample = interface;
  HKLiveWorkoutDataSource = interface;
  HKLiveWorkoutBuilder = interface;
  HKLiveWorkoutBuilderDelegate = interface;
  HKObserverQuery = interface;
  HKQuantitySeriesSampleBuilder = interface;
  HKQuantitySeriesSampleQuery = interface;
  HKSampleQuery = interface;
  HKSourceQuery = interface;
  HKStatisticsCollection = interface;
  HKStatisticsCollectionQuery = interface;
  HKStatisticsQuery = interface;
  HKVerifiableClinicalRecordSubject = interface;
  HKVerifiableClinicalRecord = interface;
  HKVerifiableClinicalRecordQuery = interface;
  HKWorkoutRoute = interface;
  HKWorkoutRouteBuilder = interface;
  HKWorkoutRouteQuery = interface;
  HKWorkoutSessionDelegate = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  HKErrorCode = NSInteger;
  HKUpdateFrequency = NSInteger;
  HKAuthorizationStatus = NSInteger;
  HKAuthorizationRequestStatus = NSInteger;
  HKBiologicalSex = NSInteger;
  HKBloodType = NSInteger;
  HKCategoryValueSleepAnalysis = NSInteger;
  HKCategoryValueAppleStandHour = NSInteger;
  HKFitzpatrickSkinType = NSInteger;
  HKWheelchairUse = NSInteger;
  HKCategoryValueCervicalMucusQuality = NSInteger;
  HKCategoryValueOvulationTestResult = NSInteger;
  HKCategoryValuePregnancyTestResult = NSInteger;
  HKCategoryValueProgesteroneTestResult = NSInteger;
  HKCategoryValueMenstrualFlow = NSInteger;
  HKCategoryValue = NSInteger;
  HKCategoryValueAudioExposureEvent = NSInteger;
  HKCategoryValueEnvironmentalAudioExposureEvent = NSInteger;
  HKCategoryValueContraceptive = NSInteger;
  HKCategoryValueSeverity = NSInteger;
  HKCategoryValueAppetiteChanges = NSInteger;
  HKCategoryValuePresence = NSInteger;
  HKCategoryValueHeadphoneAudioExposureEvent = NSInteger;
  HKCategoryValueLowCardioFitnessEvent = NSInteger;
  HKActivityMoveMode = NSInteger;
  HKCategoryValueAppleWalkingSteadinessEvent = NSInteger;
  HKElectrocardiogramLead = NSInteger;
  HKElectrocardiogramClassification = NSInteger;
  HKElectrocardiogramSymptomsStatus = NSInteger;
  HKFHIRResourceType = NSString;
  PHKFHIRResourceType = ^HKFHIRResourceType;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  HKWorkoutActivityType = NSUInteger;
  HKWorkoutEventType = NSInteger;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  HKQueryOptions = NSUInteger;
  NSPredicateOperatorType = NSUInteger;
  THealthKitUpdateHandler = procedure(param1: HKActivitySummaryQuery;
    param2: NSArray; param3: NSError) of object;
  HKQuantityTypeIdentifier = NSString;
  PHKQuantityTypeIdentifier = ^HKQuantityTypeIdentifier;
  HKCategoryTypeIdentifier = NSString;
  PHKCategoryTypeIdentifier = ^HKCategoryTypeIdentifier;
  HKCharacteristicTypeIdentifier = NSString;
  PHKCharacteristicTypeIdentifier = ^HKCharacteristicTypeIdentifier;
  HKCorrelationTypeIdentifier = NSString;
  PHKCorrelationTypeIdentifier = ^HKCorrelationTypeIdentifier;
  HKDocumentTypeIdentifier = NSString;
  PHKDocumentTypeIdentifier = ^HKDocumentTypeIdentifier;
  HKQuantityAggregationStyle = NSInteger;
  THealthKitUpdateHandler1 = procedure(param1: HKAnchoredObjectQuery;
    param2: NSArray; param3: NSArray; param4: HKQueryAnchor; param5: NSError)
    of object;
  THealthKitCompletionHandler = procedure(param1: HKAnchoredObjectQuery;
    param2: NSArray; param3: NSUInteger; param4: NSError) of object;
  HKAppleWalkingSteadinessClassification = NSInteger;
  THealthKitCompletion = procedure(param1: HKAttachment; param2: NSError)
    of object;
  THealthKitCompletion1 = procedure(param1: Boolean; param2: NSError) of object;
  THealthKitCompletion2 = procedure(param1: NSArray; param2: NSError) of object;
  THealthKitCompletion3 = procedure(param1: NSData; param2: NSError) of object;
  THealthKitDataHandler = procedure(param1: NSData; param2: NSError;
    param3: Boolean) of object;
  NSComparisonResult = NSInteger;
  HKClinicalTypeIdentifier = NSString;
  PHKClinicalTypeIdentifier = ^HKClinicalTypeIdentifier;
  HKVisionPrescriptionType = NSUInteger;
  THealthKitCompletion4 = procedure(param1: HKCorrelationQuery; param2: NSArray;
    param3: NSError) of object;
  THealthKitResultsHandler = procedure(param1: HKDocumentQuery; param2: NSArray;
    param3: Boolean; param4: NSError) of object;
  THealthKitDataHandler1 = procedure(param1: HKElectrocardiogramQuery;
    param2: HKElectrocardiogramVoltageMeasurement; param3: Boolean;
    param4: NSError) of object;
  HKFHIRRelease = NSString;
  PHKFHIRRelease = ^HKFHIRRelease;
  THealthKitCompletion5 = procedure(param1: HKAuthorizationRequestStatus;
    param2: NSError) of object;
  THealthKitWithCompletion = procedure(param1: Boolean; param2: NSUInteger;
    param3: NSError) of object;
  THealthKitResultsHandler1 = procedure(param1: HKQuantity; param2: HKQuantity;
    param3: NSError) of object;
  THealthKitCompletion6 = procedure(param1: HKWorkoutSession) of object;
  THealthKitCompletion7 = procedure(param1: NSDictionary; param2: NSError)
    of object;
  THealthKitCompletion8 = procedure(param1: HKHeartbeatSeriesSample;
    param2: NSError) of object;
  THealthKitDataHandler2 = procedure(param1: HKHeartbeatSeriesQuery;
    param2: NSTimeInterval; param3: Boolean; param4: Boolean; param5: NSError)
    of object;
  THealthKitCompletion9 = procedure(param1: HKWorkout) of object;
  HKBodyTemperatureSensorLocation = NSInteger;
  HKHeartRateSensorLocation = NSInteger;
  HKHeartRateMotionContext = NSInteger;
  HKUserMotionContext = NSInteger;
  HKHeartRateRecoveryTestType = NSInteger;
  HKWeatherCondition = NSInteger;
  HKWorkoutSwimmingLocationType = NSInteger;
  HKSwimmingStrokeStyle = NSInteger;
  HKInsulinDeliveryReason = NSInteger;
  HKBloodGlucoseMealTime = NSInteger;
  HKVO2MaxTestType = NSInteger;
  HKAppleECGAlgorithmVersion = NSInteger;
  HKDevicePlacementSide = NSInteger;
  HKObserverQueryCompletionHandler = procedure() of object;
  THealthKitUpdateHandler2 = procedure(param1: HKObserverQuery;
    param2: HKObserverQueryCompletionHandler; param3: NSError) of object;
  THealthKitUpdateHandler3 = procedure(param1: HKObserverQuery; param2: NSSet;
    param3: HKObserverQueryCompletionHandler; param4: NSError) of object;
  THealthKitQuantityHandler = procedure(param1: HKQuantitySeriesSampleQuery;
    param2: HKQuantity; param3: NSDateInterval; param4: HKQuantitySample;
    param5: Boolean; param6: NSError) of object;
  THealthKitQuantityHandler1 = procedure(param1: HKQuantitySeriesSampleQuery;
    param2: HKQuantity; param3: NSDate; param4: Boolean; param5: NSError)
    of object;
  THealthKitResultsHandler2 = procedure(param1: HKSampleQuery; param2: NSArray;
    param3: NSError) of object;
  THealthKitCompletionHandler1 = procedure(param1: HKSourceQuery; param2: NSSet;
    param3: NSError) of object;

  NSOperatingSystemVersion = record
    majorVersion: NSInteger;
    minorVersion: NSInteger;
    patchVersion: NSInteger;
  end;

  PNSOperatingSystemVersion = ^NSOperatingSystemVersion;

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
  HKPrismBase = NSInteger;
  HKVisionEye = NSInteger;
  HKVerifiableClinicalRecordSourceType = NSString;
  PHKVerifiableClinicalRecordSourceType = ^HKVerifiableClinicalRecordSourceType;
  HKVerifiableClinicalRecordCredentialType = NSString;
  PHKVerifiableClinicalRecordCredentialType = ^
    HKVerifiableClinicalRecordCredentialType;
  THealthKitResultsHandler3 = procedure(param1: HKVerifiableClinicalRecordQuery;
    param2: NSArray; param3: NSError) of object;
  HKWorkoutSessionLocationType = NSInteger;
  THealthKitCompletion10 = procedure(param1: HKWorkoutRoute; param2: NSError)
    of object;
  THealthKitDataHandler3 = procedure(param1: HKWorkoutRouteQuery;
    param2: NSArray; param3: Boolean; param4: NSError) of object;
  HKWorkoutSessionState = NSInteger;
  // ===== Interface declarations =====

  HKQuantityClass = interface(NSObjectClass)
    ['{AFFACFA5-455B-4116-82BC-2AE66E6AD433}']
    { class } function quantityWithUnit(&unit: HKUnit; doubleValue: Double)
      : Pointer { instancetype }; cdecl;
  end;

  HKQuantity = interface(NSObject)
    ['{FD38A09C-074E-4582-B58B-6F0E3DAC3636}']
    function isCompatibleWithUnit(&unit: HKUnit): Boolean; cdecl;
    function doubleValueForUnit(&unit: HKUnit): Double; cdecl;
    function compare(quantity: HKQuantity): NSComparisonResult; cdecl;
  end;

  THKQuantity = class(TOCGenericImport<HKQuantityClass, HKQuantity>)
  end;

  PHKQuantity = Pointer;

  HKActivitySummaryClass = interface(NSObjectClass)
    ['{2DF1F407-10EB-4B8D-B7E5-01300DA191D3}']
  end;

  HKActivitySummary = interface(NSObject)
    ['{BC39FA30-75E2-4F25-AFB3-DEC93F0B0E85}']
    function dateComponentsForCalendar(calendar: NSCalendar)
      : NSDateComponents; cdecl;
    procedure setActivityMoveMode(activityMoveMode: HKActivityMoveMode); cdecl;
    function activityMoveMode: HKActivityMoveMode; cdecl;
    procedure setActiveEnergyBurned(activeEnergyBurned: HKQuantity); cdecl;
    function activeEnergyBurned: HKQuantity; cdecl;
    procedure setAppleMoveTime(appleMoveTime: HKQuantity); cdecl;
    function appleMoveTime: HKQuantity; cdecl;
    procedure setAppleExerciseTime(appleExerciseTime: HKQuantity); cdecl;
    function appleExerciseTime: HKQuantity; cdecl;
    procedure setAppleStandHours(appleStandHours: HKQuantity); cdecl;
    function appleStandHours: HKQuantity; cdecl;
    procedure setActiveEnergyBurnedGoal(activeEnergyBurnedGoal
      : HKQuantity); cdecl;
    function activeEnergyBurnedGoal: HKQuantity; cdecl;
    procedure setAppleMoveTimeGoal(appleMoveTimeGoal: HKQuantity); cdecl;
    function appleMoveTimeGoal: HKQuantity; cdecl;
    procedure setAppleExerciseTimeGoal(appleExerciseTimeGoal
      : HKQuantity); cdecl;
    function appleExerciseTimeGoal: HKQuantity; cdecl;
    procedure setExerciseTimeGoal(exerciseTimeGoal: HKQuantity); cdecl;
    function exerciseTimeGoal: HKQuantity; cdecl;
    procedure setAppleStandHoursGoal(appleStandHoursGoal: HKQuantity); cdecl;
    function appleStandHoursGoal: HKQuantity; cdecl;
    procedure setStandHoursGoal(standHoursGoal: HKQuantity); cdecl;
    function standHoursGoal: HKQuantity; cdecl;
  end;

  THKActivitySummary = class(TOCGenericImport<HKActivitySummaryClass,
    HKActivitySummary>)
  end;

  PHKActivitySummary = Pointer;

  HKSourceClass = interface(NSObjectClass)
    ['{22DE7C71-F357-4341-A194-EA308D947F75}']
    { class } function defaultSource: HKSource; cdecl;
  end;

  HKSource = interface(NSObject)
    ['{BFC662F3-3B4B-42A2-AAD6-0B4C69C214EB}']
    function name: NSString; cdecl;
    function bundleIdentifier: NSString; cdecl;
  end;

  THKSource = class(TOCGenericImport<HKSourceClass, HKSource>)
  end;

  PHKSource = Pointer;

  HKSourceRevisionClass = interface(NSObjectClass)
    ['{30916C04-8F1A-472D-917B-48F199FD3B8A}']
  end;

  HKSourceRevision = interface(NSObject)
    ['{A5437AC1-A786-410E-9B76-26A47F9B99C8}']
    function source: HKSource; cdecl;
    function version: NSString; cdecl;
    function productType: NSString; cdecl;
    function operatingSystemVersion: NSOperatingSystemVersion; cdecl;
    [MethodName('initWithSource:version:productType:operatingSystemVersion:')]
    function initWithSourceVersionProductTypeOperatingSystemVersion
      (source: HKSource; version: NSString; productType: NSString;
      operatingSystemVersion: NSOperatingSystemVersion)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithSource:version:')]
    function initWithSourceVersion(source: HKSource; version: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  THKSourceRevision = class(TOCGenericImport<HKSourceRevisionClass,
    HKSourceRevision>)
  end;

  PHKSourceRevision = Pointer;

  HKDeviceClass = interface(NSObjectClass)
    ['{922FD840-06AF-40C5-B4BF-AF7FE1CC5A35}']
    { class } function localDevice: HKDevice; cdecl;
  end;

  HKDevice = interface(NSObject)
    ['{AB9072E8-ADA7-4A71-84E2-5EB0A19A8D0D}']
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
    ['{6233704C-423E-45B4-8D09-5082B52F40D5}']
  end;

  HKObject = interface(NSObject)
    ['{54F79718-0CE7-47F0-9445-79FE1ED8D786}']
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
    ['{27C0FCC2-8ED0-4154-9690-936A6C4F7006}']
    { class } function quantityTypeForIdentifier
      (identifier: HKQuantityTypeIdentifier): HKQuantityType; cdecl;
    { class } function categoryTypeForIdentifier
      (identifier: HKCategoryTypeIdentifier): HKCategoryType; cdecl;
    { class } function characteristicTypeForIdentifier
      (identifier: HKCharacteristicTypeIdentifier): HKCharacteristicType; cdecl;
    { class } function correlationTypeForIdentifier
      (identifier: HKCorrelationTypeIdentifier): HKCorrelationType; cdecl;
    { class } function documentTypeForIdentifier
      (identifier: HKDocumentTypeIdentifier): HKDocumentType; cdecl;
    { class } function seriesTypeForIdentifier(identifier: NSString)
      : HKSeriesType; cdecl;
    { class } function workoutType: HKWorkoutType; cdecl;
    { class } function activitySummaryType: HKActivitySummaryType; cdecl;
    { class } function audiogramSampleType: HKAudiogramSampleType; cdecl;
    { class } function electrocardiogramType: HKElectrocardiogramType; cdecl;
    { class } function visionPrescriptionType: HKPrescriptionType; cdecl;
    { class } function clinicalTypeForIdentifier
      (identifier: HKClinicalTypeIdentifier): HKClinicalType; cdecl;
  end;

  HKObjectType = interface(NSObject)
    ['{12FC5C7F-A756-4417-89D8-6589ECF71C13}']
    function identifier: NSString; cdecl;
    function requiresPerObjectAuthorization: Boolean; cdecl;
  end;

  THKObjectType = class(TOCGenericImport<HKObjectTypeClass, HKObjectType>)
  end;

  PHKObjectType = Pointer;

  HKSampleTypeClass = interface(HKObjectTypeClass)
    ['{43FE09F2-1796-4016-97CB-5BB5CA01B176}']
  end;

  HKSampleType = interface(HKObjectType)
    ['{32CD0BD5-03E5-47A8-84D8-AB267E66715F}']
    function isMaximumDurationRestricted: Boolean; cdecl;
    function maximumAllowedDuration: NSTimeInterval; cdecl;
    function isMinimumDurationRestricted: Boolean; cdecl;
    function minimumAllowedDuration: NSTimeInterval; cdecl;
    function allowsRecalibrationForEstimates: Boolean; cdecl;
  end;

  THKSampleType = class(TOCGenericImport<HKSampleTypeClass, HKSampleType>)
  end;

  PHKSampleType = Pointer;

  HKSampleClass = interface(HKObjectClass)
    ['{D25EE13D-8D07-4860-A8E7-D2B409DD159B}']
  end;

  HKSample = interface(HKObject)
    ['{21C8D4D8-057C-4C26-9926-DE80BDE2E26D}']
    function sampleType: HKSampleType; cdecl;
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function hasUndeterminedDuration: Boolean; cdecl;
  end;

  THKSample = class(TOCGenericImport<HKSampleClass, HKSample>)
  end;

  PHKSample = Pointer;

  HKElectrocardiogramClass = interface(HKSampleClass)
    ['{31513D9A-F724-4E1F-8488-77DE2AEDCE51}']
  end;

  HKElectrocardiogram = interface(HKSample)
    ['{A161F72F-C9EB-4559-B626-BE29683CC71C}']
    function numberOfVoltageMeasurements: NSInteger; cdecl;
    function samplingFrequency: HKQuantity; cdecl;
    function classification: HKElectrocardiogramClassification; cdecl;
    function averageHeartRate: HKQuantity; cdecl;
    function symptomsStatus: HKElectrocardiogramSymptomsStatus; cdecl;
  end;

  THKElectrocardiogram = class(TOCGenericImport<HKElectrocardiogramClass,
    HKElectrocardiogram>)
  end;

  PHKElectrocardiogram = Pointer;

  HKFHIRVersionClass = interface(NSObjectClass)
    ['{FFE2754B-D39E-4E2B-AAD4-515A7FC35768}']
    { class } function versionFromVersionString(versionString: NSString;
      error: NSError): Pointer { instancetype }; cdecl;
    { class } function primaryDSTU2Version: Pointer { instancetype }; cdecl;
    { class } function primaryR4Version: Pointer { instancetype }; cdecl;
  end;

  HKFHIRVersion = interface(NSObject)
    ['{C54BA0C6-3433-4884-9EB5-189BB247DAFB}']
    function majorVersion: NSInteger; cdecl;
    function minorVersion: NSInteger; cdecl;
    function patchVersion: NSInteger; cdecl;
    function FHIRRelease: HKFHIRRelease; cdecl;
    function stringRepresentation: NSString; cdecl;
  end;

  THKFHIRVersion = class(TOCGenericImport<HKFHIRVersionClass, HKFHIRVersion>)
  end;

  PHKFHIRVersion = Pointer;

  HKFHIRResourceClass = interface(NSObjectClass)
    ['{502B22F9-1E2D-44C2-8B12-1563882E7D5A}']
  end;

  HKFHIRResource = interface(NSObject)
    ['{C91C8736-E2A7-4884-B2D9-4BE5FC4DE2FF}']
    function FHIRVersion: HKFHIRVersion; cdecl;
    function resourceType: HKFHIRResourceType; cdecl;
    function identifier: NSString; cdecl;
    function data: NSData; cdecl;
    function sourceURL: NSURL; cdecl;
  end;

  THKFHIRResource = class(TOCGenericImport<HKFHIRResourceClass, HKFHIRResource>)
  end;

  PHKFHIRResource = Pointer;

  HKQuantityTypeClass = interface(HKSampleTypeClass)
    ['{D7B6CDD1-0215-44FA-9ED1-EDD104EDF53B}']
  end;

  HKQuantityType = interface(HKSampleType)
    ['{87CDED02-D8D0-4D0A-8301-2563691C426C}']
    function aggregationStyle: HKQuantityAggregationStyle; cdecl;
    function isCompatibleWithUnit(&unit: HKUnit): Boolean; cdecl;
  end;

  THKQuantityType = class(TOCGenericImport<HKQuantityTypeClass, HKQuantityType>)
  end;

  PHKQuantityType = Pointer;

  HKStatisticsClass = interface(NSObjectClass)
    ['{689ED50C-3CFB-4AAE-B068-E76C4ECFFE9A}']
  end;

  HKStatistics = interface(NSObject)
    ['{1F5A712E-0C7E-46B6-9777-E6C54498E040}']
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
    function mostRecentQuantityForSource(source: HKSource): HKQuantity; cdecl;
    function mostRecentQuantity: HKQuantity; cdecl;
    function mostRecentQuantityDateIntervalForSource(source: HKSource)
      : NSDateInterval; cdecl;
    function mostRecentQuantityDateInterval: NSDateInterval; cdecl;
    function sumQuantityForSource(source: HKSource): HKQuantity; cdecl;
    function sumQuantity: HKQuantity; cdecl;
    function duration: HKQuantity; cdecl;
    function durationForSource(source: HKSource): HKQuantity; cdecl;
  end;

  THKStatistics = class(TOCGenericImport<HKStatisticsClass, HKStatistics>)
  end;

  PHKStatistics = Pointer;

  HKWorkoutActivityClass = interface(NSObjectClass)
    ['{DA161B8C-73A8-432F-9441-D5EF35034798}']
  end;

  HKWorkoutActivity = interface(NSObject)
    ['{D2B5AFF0-E725-4330-BA45-A6F0E13440C0}']
    function UUID: NSUUID; cdecl;
    function workoutConfiguration: HKWorkoutConfiguration; cdecl;
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function metadata: NSDictionary; cdecl;
    function duration: NSTimeInterval; cdecl;
    function workoutEvents: NSArray; cdecl;
    function allStatistics: NSDictionary; cdecl;
    function statisticsForType(quantityType: HKQuantityType)
      : HKStatistics; cdecl;
    function initWithWorkoutConfiguration(workoutConfiguration
      : HKWorkoutConfiguration; startDate: NSDate; endDate: NSDate;
      metadata: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  THKWorkoutActivity = class(TOCGenericImport<HKWorkoutActivityClass,
    HKWorkoutActivity>)
  end;

  PHKWorkoutActivity = Pointer;

  HKWorkoutEventClass = interface(NSObjectClass)
    ['{C53CCF1A-8D63-4F91-9567-FE24A5A0B65A}']
    [MethodName('workoutEventWithType:date:')]
    { class } function workoutEventWithTypeDate(&type: HKWorkoutEventType;
      date: NSDate): Pointer { instancetype }; cdecl;
    [MethodName('workoutEventWithType:date:metadata:')]
    { class } function workoutEventWithTypeDateMetadata
      (&type: HKWorkoutEventType; date: NSDate; metadata: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('workoutEventWithType:dateInterval:metadata:')]
    { class } function workoutEventWithTypeDateIntervalMetadata
      (&type: HKWorkoutEventType; dateInterval: NSDateInterval;
      metadata: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  HKWorkoutEvent = interface(NSObject)
    ['{FF2341E6-6E5D-4575-B6F4-50AF359E3F4A}']
    function &type: HKWorkoutEventType; cdecl;
    function date: NSDate; cdecl;
    function dateInterval: NSDateInterval; cdecl;
    function metadata: NSDictionary; cdecl;
  end;

  THKWorkoutEvent = class(TOCGenericImport<HKWorkoutEventClass, HKWorkoutEvent>)
  end;

  PHKWorkoutEvent = Pointer;

  HKWorkoutClass = interface(HKSampleClass)
    ['{3515D066-6705-4BF3-924A-9DF4EED60A36}']
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
    [MethodName
      ('workoutWithActivityType:startDate:endDate:workoutEvents:totalEnergyBurned:totalDistance:totalSwimmingStrokeCount:device:metadata:')
      ]
    { class } function
      workoutWithActivityTypeStartDateEndDateWorkoutEventsTotalEnergyBurnedTotalDistanceTotalSwimmingStrokeCountDeviceMetadata
      (workoutActivityType: HKWorkoutActivityType; startDate: NSDate;
      endDate: NSDate; workoutEvents: NSArray; totalEnergyBurned: HKQuantity;
      totalDistance: HKQuantity; totalSwimmingStrokeCount: HKQuantity;
      device: HKDevice; metadata: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('workoutWithActivityType:startDate:endDate:workoutEvents:totalEnergyBurned:totalDistance:totalFlightsClimbed:device:metadata:')
      ]
    { class } function
      workoutWithActivityTypeStartDateEndDateWorkoutEventsTotalEnergyBurnedTotalDistanceTotalFlightsClimbedDeviceMetadata
      (workoutActivityType: HKWorkoutActivityType; startDate: NSDate;
      endDate: NSDate; workoutEvents: NSArray; totalEnergyBurned: HKQuantity;
      totalDistance: HKQuantity; totalFlightsClimbed: HKQuantity;
      device: HKDevice; metadata: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  HKWorkout = interface(HKSample)
    ['{6D1F5FF8-D000-4BBF-8598-4DF05D5B5E3B}']
    function workoutActivityType: HKWorkoutActivityType; cdecl;
    function workoutEvents: NSArray; cdecl;
    function workoutActivities: NSArray; cdecl;
    function duration: NSTimeInterval; cdecl;
    function totalEnergyBurned: HKQuantity; cdecl;
    function totalDistance: HKQuantity; cdecl;
    function totalSwimmingStrokeCount: HKQuantity; cdecl;
    function totalFlightsClimbed: HKQuantity; cdecl;
    function allStatistics: NSDictionary; cdecl;
    function statisticsForType(quantityType: HKQuantityType)
      : HKStatistics; cdecl;
  end;

  THKWorkout = class(TOCGenericImport<HKWorkoutClass, HKWorkout>)
  end;

  PHKWorkout = Pointer;

  HKQueryClass = interface(NSObjectClass)
    ['{E8A7C9AE-A260-45D7-BCB4-B3FC22F9266A}']
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
    { class } function predicateForObjectsAssociatedWithElectrocardiogram
      (electrocardiogram: HKElectrocardiogram): NSPredicate; cdecl;
    { class } function predicateForSamplesWithStartDate(startDate: NSDate;
      endDate: NSDate; options: HKQueryOptions): NSPredicate; cdecl;
    { class } function predicateForQuantitySamplesWithOperatorType
      (operatorType: NSPredicateOperatorType; quantity: HKQuantity)
      : NSPredicate; cdecl;
    { class } function predicateForCategorySamplesWithOperatorType
      (operatorType: NSPredicateOperatorType; value: NSInteger)
      : NSPredicate; cdecl;
    { class } function predicateForCategorySamplesEqualToValues(values: NSSet)
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
    [MethodName
      ('predicateForWorkoutsWithOperatorType:totalSwimmingStrokeCount:')]
    { class } function
      predicateForWorkoutsWithOperatorTypeTotalSwimmingStrokeCount
      (operatorType: NSPredicateOperatorType;
      totalSwimmingStrokeCount: HKQuantity): NSPredicate; cdecl;
    [MethodName('predicateForWorkoutsWithOperatorType:totalFlightsClimbed:')]
    { class } function predicateForWorkoutsWithOperatorTypeTotalFlightsClimbed
      (operatorType: NSPredicateOperatorType; totalFlightsClimbed: HKQuantity)
      : NSPredicate; cdecl;
    [MethodName
      ('predicateForWorkoutsWithOperatorType:quantityType:sumQuantity:')]
    { class } function
      predicateForWorkoutsWithOperatorTypeQuantityTypeSumQuantity
      (operatorType: NSPredicateOperatorType; quantityType: HKQuantityType;
      sumQuantity: HKQuantity): NSPredicate; cdecl;
    [MethodName
      ('predicateForWorkoutsWithOperatorType:quantityType:minimumQuantity:')]
    { class } function
      predicateForWorkoutsWithOperatorTypeQuantityTypeMinimumQuantity
      (operatorType: NSPredicateOperatorType; quantityType: HKQuantityType;
      minimumQuantity: HKQuantity): NSPredicate; cdecl;
    [MethodName
      ('predicateForWorkoutsWithOperatorType:quantityType:maximumQuantity:')]
    { class } function
      predicateForWorkoutsWithOperatorTypeQuantityTypeMaximumQuantity
      (operatorType: NSPredicateOperatorType; quantityType: HKQuantityType;
      maximumQuantity: HKQuantity): NSPredicate; cdecl;
    [MethodName
      ('predicateForWorkoutsWithOperatorType:quantityType:averageQuantity:')]
    { class } function
      predicateForWorkoutsWithOperatorTypeQuantityTypeAverageQuantity
      (operatorType: NSPredicateOperatorType; quantityType: HKQuantityType;
      averageQuantity: HKQuantity): NSPredicate; cdecl;
    { class } function predicateForWorkoutActivitiesWithWorkoutActivityType
      (workoutActivityType: HKWorkoutActivityType): NSPredicate; cdecl;
    [MethodName('predicateForWorkoutActivitiesWithOperatorType:duration:')]
    { class } function predicateForWorkoutActivitiesWithOperatorTypeDuration
      (operatorType: NSPredicateOperatorType; duration: NSTimeInterval)
      : NSPredicate; cdecl;
    { class } function predicateForWorkoutActivitiesWithStartDate
      (startDate: NSDate; endDate: NSDate; options: HKQueryOptions)
      : NSPredicate; cdecl;
    [MethodName
      ('predicateForWorkoutActivitiesWithOperatorType:quantityType:sumQuantity:')
      ]
    { class } function
      predicateForWorkoutActivitiesWithOperatorTypeQuantityTypeSumQuantity
      (operatorType: NSPredicateOperatorType; quantityType: HKQuantityType;
      sumQuantity: HKQuantity): NSPredicate; cdecl;
    [MethodName
      ('predicateForWorkoutActivitiesWithOperatorType:quantityType:minimumQuantity:')
      ]
    { class } function
      predicateForWorkoutActivitiesWithOperatorTypeQuantityTypeMinimumQuantity
      (operatorType: NSPredicateOperatorType; quantityType: HKQuantityType;
      minimumQuantity: HKQuantity): NSPredicate; cdecl;
    [MethodName
      ('predicateForWorkoutActivitiesWithOperatorType:quantityType:maximumQuantity:')
      ]
    { class } function
      predicateForWorkoutActivitiesWithOperatorTypeQuantityTypeMaximumQuantity
      (operatorType: NSPredicateOperatorType; quantityType: HKQuantityType;
      maximumQuantity: HKQuantity): NSPredicate; cdecl;
    [MethodName
      ('predicateForWorkoutActivitiesWithOperatorType:quantityType:averageQuantity:')
      ]
    { class } function
      predicateForWorkoutActivitiesWithOperatorTypeQuantityTypeAverageQuantity
      (operatorType: NSPredicateOperatorType; quantityType: HKQuantityType;
      averageQuantity: HKQuantity): NSPredicate; cdecl;
    { class } function predicateForWorkoutsWithActivityPredicate
      (activityPredicate: NSPredicate): NSPredicate; cdecl;
    { class } function predicateForActivitySummaryWithDateComponents
      (dateComponents: NSDateComponents): NSPredicate; cdecl;
    { class } function predicateForActivitySummariesBetweenStartDateComponents
      (startDateComponents: NSDateComponents;
      endDateComponents: NSDateComponents): NSPredicate; cdecl;
    { class } function predicateForClinicalRecordsWithFHIRResourceType
      (resourceType: HKFHIRResourceType): NSPredicate; cdecl;
    { class } function predicateForClinicalRecordsFromSource(source: HKSource;
      FHIRResourceType: HKFHIRResourceType; identifier: NSString)
      : NSPredicate; cdecl;
    { class } function predicateForElectrocardiogramsWithClassification
      (classification: HKElectrocardiogramClassification): NSPredicate; cdecl;
    { class } function predicateForElectrocardiogramsWithSymptomsStatus
      (symptomsStatus: HKElectrocardiogramSymptomsStatus): NSPredicate; cdecl;
    { class } function
      predicateForVerifiableClinicalRecordsWithRelevantDateWithinDateInterval
      (dateInterval: NSDateInterval): NSPredicate; cdecl;
  end;

  HKQuery = interface(NSObject)
    ['{D3CF3B95-4FD3-49BE-9E92-0D91EC419A3B}']
    function objectType: HKObjectType; cdecl;
    function sampleType: HKSampleType; cdecl;
    function predicate: NSPredicate; cdecl;
  end;

  THKQuery = class(TOCGenericImport<HKQueryClass, HKQuery>)
  end;

  PHKQuery = Pointer;

  HKActivitySummaryQueryClass = interface(HKQueryClass)
    ['{A2EAF9FF-5058-4419-8B6F-0BC645D0DD00}']
  end;

  HKActivitySummaryQuery = interface(HKQuery)
    ['{D494DE2C-557C-42EA-97AE-2262B35344F8}']
    procedure setUpdateHandler(updateHandler: THealthKitUpdateHandler); cdecl;
    function updateHandler: THealthKitUpdateHandler; cdecl;
    function initWithPredicate(predicate: NSPredicate;
      resultsHandler: THealthKitUpdateHandler): Pointer { instancetype }; cdecl;
  end;

  THKActivitySummaryQuery = class(TOCGenericImport<HKActivitySummaryQueryClass,
    HKActivitySummaryQuery>)
  end;

  PHKActivitySummaryQuery = Pointer;

  HKQueryAnchorClass = interface(NSObjectClass)
    ['{E8B5703A-0AC2-461A-A9F9-1DC913F9FEF9}']
    { class } function anchorFromValue(value: NSUInteger)
      : Pointer { instancetype }; cdecl;
  end;

  HKQueryAnchor = interface(NSObject)
    ['{2DD25CAB-544B-4EE0-A185-EEAB55DCD071}']
  end;

  THKQueryAnchor = class(TOCGenericImport<HKQueryAnchorClass, HKQueryAnchor>)
  end;

  PHKQueryAnchor = Pointer;

  HKActivitySummaryTypeClass = interface(HKObjectTypeClass)
    ['{EA3067E7-6F89-49F6-89F6-3A3ED93DAFE8}']
  end;

  HKActivitySummaryType = interface(HKObjectType)
    ['{D507672D-1B2A-4018-8B3F-AA2DB609B86A}']
  end;

  THKActivitySummaryType = class(TOCGenericImport<HKActivitySummaryTypeClass,
    HKActivitySummaryType>)
  end;

  PHKActivitySummaryType = Pointer;

  HKAudiogramSampleTypeClass = interface(HKSampleTypeClass)
    ['{6B5502BB-829C-4233-8A26-CB425ADF6D6B}']
  end;

  HKAudiogramSampleType = interface(HKSampleType)
    ['{A201DF3B-D954-402A-9DCB-C9DCEAC4A7E8}']
  end;

  THKAudiogramSampleType = class(TOCGenericImport<HKAudiogramSampleTypeClass,
    HKAudiogramSampleType>)
  end;

  PHKAudiogramSampleType = Pointer;

  HKCategoryTypeClass = interface(HKSampleTypeClass)
    ['{28A6DE1A-79E8-45D9-B5FC-72EFA6B4045C}']
  end;

  HKCategoryType = interface(HKSampleType)
    ['{CB7EDCF8-5953-454B-B28D-6EFDA07BEC10}']
  end;

  THKCategoryType = class(TOCGenericImport<HKCategoryTypeClass, HKCategoryType>)
  end;

  PHKCategoryType = Pointer;

  HKCharacteristicTypeClass = interface(HKObjectTypeClass)
    ['{4F0702B2-DADF-4112-A4B4-9EEC6578CAB5}']
  end;

  HKCharacteristicType = interface(HKObjectType)
    ['{D265C8EC-796C-48F4-99E0-340A13F2B22B}']
  end;

  THKCharacteristicType = class(TOCGenericImport<HKCharacteristicTypeClass,
    HKCharacteristicType>)
  end;

  PHKCharacteristicType = Pointer;

  HKCorrelationTypeClass = interface(HKSampleTypeClass)
    ['{D3387291-749D-493E-80BB-35DC5072A6DF}']
  end;

  HKCorrelationType = interface(HKSampleType)
    ['{4463A590-1052-4C9F-AF13-BC3A438C3442}']
  end;

  THKCorrelationType = class(TOCGenericImport<HKCorrelationTypeClass,
    HKCorrelationType>)
  end;

  PHKCorrelationType = Pointer;

  HKDocumentTypeClass = interface(HKSampleTypeClass)
    ['{E3686A66-B99E-45D8-89C0-325E2AEFE64D}']
  end;

  HKDocumentType = interface(HKSampleType)
    ['{20A2B771-7CA0-4E59-994F-2B07B60A46D6}']
  end;

  THKDocumentType = class(TOCGenericImport<HKDocumentTypeClass, HKDocumentType>)
  end;

  PHKDocumentType = Pointer;

  HKElectrocardiogramTypeClass = interface(HKSampleTypeClass)
    ['{FBAFCC8A-11C4-4171-B35B-4B23FAFBD54B}']
  end;

  HKElectrocardiogramType = interface(HKSampleType)
    ['{5E898AA2-4F21-402F-B71F-7DF1EC602ACD}']
  end;

  THKElectrocardiogramType = class
    (TOCGenericImport<HKElectrocardiogramTypeClass, HKElectrocardiogramType>)
  end;

  PHKElectrocardiogramType = Pointer;

  HKSeriesTypeClass = interface(HKSampleTypeClass)
    ['{373ABEC3-C135-4E09-8D31-935F9F6740F0}']
    { class } function workoutRouteType: Pointer { instancetype }; cdecl;
    { class } function heartbeatSeriesType: Pointer { instancetype }; cdecl;
  end;

  HKSeriesType = interface(HKSampleType)
    ['{5A857DF6-0BC5-4219-A079-AAB2FD51FDAC}']
  end;

  THKSeriesType = class(TOCGenericImport<HKSeriesTypeClass, HKSeriesType>)
  end;

  PHKSeriesType = Pointer;

  HKUnitClass = interface(NSObjectClass)
    ['{5162163D-D24F-485F-A5D1-3D0270D05A84}']
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
    { class } function decibelAWeightedSoundPressureLevelUnit
      : Pointer { instancetype }; cdecl;
    { class } function inchesOfMercuryUnit: Pointer { instancetype }; cdecl;
    { class } function secondUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function secondUnit: Pointer { instancetype }; cdecl;
    { class } function minuteUnit: Pointer { instancetype }; cdecl;
    { class } function hourUnit: Pointer { instancetype }; cdecl;
    { class } function dayUnit: Pointer { instancetype }; cdecl;
    { class } function jouleUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function jouleUnit: Pointer { instancetype }; cdecl;
    { class } function kilocalorieUnit: Pointer { instancetype }; cdecl;
    { class } function smallCalorieUnit: Pointer { instancetype }; cdecl;
    { class } function largeCalorieUnit: Pointer { instancetype }; cdecl;
    { class } function calorieUnit: Pointer { instancetype }; cdecl;
    { class } function degreeCelsiusUnit: Pointer { instancetype }; cdecl;
    { class } function degreeFahrenheitUnit: Pointer { instancetype }; cdecl;
    { class } function kelvinUnit: Pointer { instancetype }; cdecl;
    { class } function siemenUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function siemenUnit: Pointer { instancetype }; cdecl;
    { class } function internationalUnit: Pointer { instancetype }; cdecl;
    { class } function countUnit: Pointer { instancetype }; cdecl;
    { class } function percentUnit: Pointer { instancetype }; cdecl;
    { class } function decibelHearingLevelUnit: Pointer { instancetype }; cdecl;
    { class } function hertzUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function hertzUnit: Pointer { instancetype }; cdecl;
    { class } function voltUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function voltUnit: Pointer { instancetype }; cdecl;
    { class } function wattUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function wattUnit: Pointer { instancetype }; cdecl;
    { class } function diopterUnit: Pointer { instancetype }; cdecl;
    { class } function prismDiopterUnit: Pointer { instancetype }; cdecl;
    { class } function radianAngleUnitWithMetricPrefix(prefix: HKMetricPrefix)
      : Pointer { instancetype }; cdecl;
    { class } function radianAngleUnit: Pointer { instancetype }; cdecl;
    { class } function degreeAngleUnit: Pointer { instancetype }; cdecl;
  end;

  HKUnit = interface(NSObject)
    ['{694AE198-CFEF-4178-A4D1-BC8822367FBD}']
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

  HKPrescriptionTypeClass = interface(HKSampleTypeClass)
    ['{5FDC696D-5B76-4B29-9F62-DDFC0F6050DB}']
  end;

  HKPrescriptionType = interface(HKSampleType)
    ['{CC80DE95-49D9-4BBB-B80B-94D802ECFE99}']
  end;

  THKPrescriptionType = class(TOCGenericImport<HKPrescriptionTypeClass,
    HKPrescriptionType>)
  end;

  PHKPrescriptionType = Pointer;

  HKWorkoutTypeClass = interface(HKSampleTypeClass)
    ['{474DD231-2848-4410-9EAC-CB9CABD80E2A}']
  end;

  HKWorkoutType = interface(HKSampleType)
    ['{684EAC1C-3E3F-4192-8C8A-B2F7A7CB476B}']
  end;

  THKWorkoutType = class(TOCGenericImport<HKWorkoutTypeClass, HKWorkoutType>)
  end;

  PHKWorkoutType = Pointer;

  HKQueryDescriptorClass = interface(NSObjectClass)
    ['{12D8EC9C-B2AD-4DB0-B991-EBBEA771082C}']
  end;

  HKQueryDescriptor = interface(NSObject)
    ['{FBFE3231-720F-438C-B3F6-FDBDA1127167}']
    function sampleType: HKSampleType; cdecl;
    function predicate: NSPredicate; cdecl;
    function initWithSampleType(sampleType: HKSampleType;
      predicate: NSPredicate): Pointer { instancetype }; cdecl;
  end;

  THKQueryDescriptor = class(TOCGenericImport<HKQueryDescriptorClass,
    HKQueryDescriptor>)
  end;

  PHKQueryDescriptor = Pointer;

  HKDeletedObjectClass = interface(NSObjectClass)
    ['{918F75E6-B468-489E-B93D-6D076DFB555E}']
  end;

  HKDeletedObject = interface(NSObject)
    ['{159E8527-8F54-4D85-9134-092D33B9F87D}']
    function UUID: NSUUID; cdecl;
    function metadata: NSDictionary; cdecl;
  end;

  THKDeletedObject = class(TOCGenericImport<HKDeletedObjectClass,
    HKDeletedObject>)
  end;

  PHKDeletedObject = Pointer;

  HKAnchoredObjectQueryClass = interface(HKQueryClass)
    ['{F60B4F52-E8A4-488B-BD26-37DC98B2C386}']
  end;

  HKAnchoredObjectQuery = interface(HKQuery)
    ['{BE782939-6065-43FA-B41B-152FB9BB78C6}']
    procedure setUpdateHandler(updateHandler: THealthKitUpdateHandler1); cdecl;
    function updateHandler: THealthKitUpdateHandler1; cdecl;
    [MethodName('initWithType:predicate:anchor:limit:resultsHandler:')]
    function initWithTypePredicateAnchorLimitResultsHandler(&type: HKSampleType;
      predicate: NSPredicate; anchor: HKQueryAnchor; limit: NSUInteger;
      resultsHandler: THealthKitUpdateHandler1)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithType:predicate:anchor:limit:completionHandler:')]
    function initWithTypePredicateAnchorLimitCompletionHandler
      (&type: HKSampleType; predicate: NSPredicate; anchor: NSUInteger;
      limit: NSUInteger; completionHandler: THealthKitCompletionHandler)
      : Pointer { instancetype }; cdecl;
    function initWithQueryDescriptors(queryDescriptors: NSArray;
      anchor: HKQueryAnchor; limit: NSInteger;
      resultsHandler: THealthKitUpdateHandler1)
      : Pointer { instancetype }; cdecl;
  end;

  THKAnchoredObjectQuery = class(TOCGenericImport<HKAnchoredObjectQueryClass,
    HKAnchoredObjectQuery>)
  end;

  PHKAnchoredObjectQuery = Pointer;

  HKAttachmentClass = interface(NSObjectClass)
    ['{3D5CF517-ADE9-49D5-B5A4-E1C2F4D2CD19}']
  end;

  HKAttachment = interface(NSObject)
    ['{7AD48D56-2814-4C9C-86E6-66E4FA4630DD}']
    function identifier: NSUUID; cdecl;
    function name: NSString; cdecl;
    function contentType: PInteger; cdecl;
    function size: NSInteger; cdecl;
    function creationDate: NSDate; cdecl;
    function metadata: NSDictionary; cdecl;
  end;

  THKAttachment = class(TOCGenericImport<HKAttachmentClass, HKAttachment>)
  end;

  PHKAttachment = Pointer;

  HKHealthStoreClass = interface(NSObjectClass)
    ['{8A33991E-13C9-4C64-8FEB-5D5A754081E9}']
    { class } function isHealthDataAvailable: Boolean; cdecl;
  end;

  HKHealthStore = interface(NSObject)
    ['{81B4F1A4-8469-4710-B8E7-5AB733403F7E}']
    function supportsHealthRecords: Boolean; cdecl;
    function authorizationStatusForType(&type: HKObjectType)
      : HKAuthorizationStatus; cdecl;
    procedure requestAuthorizationToShareTypes(typesToShare: NSSet;
      readTypes: NSSet; completion: THealthKitCompletion1); cdecl;
    procedure requestPerObjectReadAuthorizationForType(objectType: HKObjectType;
      predicate: NSPredicate; completion: THealthKitCompletion1); cdecl;
    procedure getRequestStatusForAuthorizationToShareTypes(typesToShare: NSSet;
      readTypes: NSSet; completion: THealthKitCompletion5); cdecl;
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
      endDate: NSDate; resultsHandler: THealthKitResultsHandler1); cdecl;
    function dateOfBirthWithError(error: NSError): NSDate; cdecl;
    function dateOfBirthComponentsWithError(error: NSError)
      : NSDateComponents; cdecl;
    function biologicalSexWithError(error: NSError)
      : HKBiologicalSexObject; cdecl;
    function bloodTypeWithError(error: NSError): HKBloodTypeObject; cdecl;
    function fitzpatrickSkinTypeWithError(error: NSError)
      : HKFitzpatrickSkinTypeObject; cdecl;
    function wheelchairUseWithError(error: NSError)
      : HKWheelchairUseObject; cdecl;
    function activityMoveModeWithError(error: NSError)
      : HKActivityMoveModeObject; cdecl;
    procedure addSamples(samples: NSArray; toWorkout: HKWorkout;
      completion: THealthKitCompletion1); cdecl;
    procedure startWorkoutSession(workoutSession: HKWorkoutSession); cdecl;
    procedure endWorkoutSession(workoutSession: HKWorkoutSession); cdecl;
    procedure pauseWorkoutSession(workoutSession: HKWorkoutSession); cdecl;
    procedure resumeWorkoutSession(workoutSession: HKWorkoutSession); cdecl;
    procedure startWatchAppWithWorkoutConfiguration(workoutConfiguration
      : HKWorkoutConfiguration; completion: THealthKitCompletion1); cdecl;
    procedure recoverActiveWorkoutSessionWithCompletion
      (completion: THealthKitCompletion6); cdecl;
    procedure enableBackgroundDeliveryForType(&type: HKObjectType;
      frequency: HKUpdateFrequency;
      withCompletion: THealthKitCompletion1); cdecl;
    procedure disableBackgroundDeliveryForType(&type: HKObjectType;
      withCompletion: THealthKitCompletion1); cdecl;
    procedure disableAllBackgroundDeliveryWithCompletion
      (completion: THealthKitCompletion1); cdecl;
    procedure preferredUnitsForQuantityTypes(quantityTypes: NSSet;
      completion: THealthKitCompletion7); cdecl;
    procedure recalibrateEstimatesForSampleType(sampleType: HKSampleType;
      atDate: NSDate; completion: THealthKitCompletion1); cdecl;
  end;

  THKHealthStore = class(TOCGenericImport<HKHealthStoreClass, HKHealthStore>)
  end;

  PHKHealthStore = Pointer;

  HKAttachmentStoreClass = interface(NSObjectClass)
    ['{BF172E8F-378B-4E10-9C7E-8D0D10B61523}']
  end;

  HKAttachmentStore = interface(NSObject)
    ['{CE783193-9825-4659-9C68-08EB0BBF6A24}']
    function initWithHealthStore(healthStore: HKHealthStore)
      : Pointer { instancetype }; cdecl;
    procedure addAttachmentToObject(&object: HKObject; name: NSString;
      contentType: Pointer; URL: NSURL; metadata: NSDictionary;
      completion: THealthKitCompletion); cdecl;
    procedure removeAttachment(attachment: HKAttachment; fromObject: HKObject;
      completion: THealthKitCompletion1); cdecl;
    procedure getAttachmentsForObject(&object: HKObject;
      completion: THealthKitCompletion2); cdecl;
    function getDataForAttachment(attachment: HKAttachment;
      completion: THealthKitCompletion3): NSProgress; cdecl;
    function streamDataForAttachment(attachment: HKAttachment;
      dataHandler: THealthKitDataHandler): NSProgress; cdecl;
  end;

  THKAttachmentStore = class(TOCGenericImport<HKAttachmentStoreClass,
    HKAttachmentStore>)
  end;

  PHKAttachmentStore = Pointer;

  HKAudiogramSensitivityPointClass = interface(NSObjectClass)
    ['{4B38B0EB-943C-4CFA-A45F-8F9C3379B0B7}']
    { class } function sensitivityPointWithFrequency(frequency: HKQuantity;
      leftEarSensitivity: HKQuantity; rightEarSensitivity: HKQuantity;
      error: NSError): Pointer { instancetype }; cdecl;
  end;

  HKAudiogramSensitivityPoint = interface(NSObject)
    ['{BF707F65-3871-4FBB-81EC-FB1749394C7F}']
    function frequency: HKQuantity; cdecl;
    function leftEarSensitivity: HKQuantity; cdecl;
    function rightEarSensitivity: HKQuantity; cdecl;
  end;

  THKAudiogramSensitivityPoint = class
    (TOCGenericImport<HKAudiogramSensitivityPointClass,
    HKAudiogramSensitivityPoint>)
  end;

  PHKAudiogramSensitivityPoint = Pointer;

  HKAudiogramSampleClass = interface(HKSampleClass)
    ['{7954B41F-67BC-4A56-9D4A-95E77AA32201}']
    { class } function audiogramSampleWithSensitivityPoints(sensitivityPoints
      : NSArray; startDate: NSDate; endDate: NSDate; metadata: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  HKAudiogramSample = interface(HKSample)
    ['{702DCD57-2CC6-4593-9FD0-B86D7776B5E2}']
    function sensitivityPoints: NSArray; cdecl;
  end;

  THKAudiogramSample = class(TOCGenericImport<HKAudiogramSampleClass,
    HKAudiogramSample>)
  end;

  PHKAudiogramSample = Pointer;

  HKDocumentSampleClass = interface(HKSampleClass)
    ['{DC4A472E-076E-45F9-B718-FB26069775C3}']
  end;

  HKDocumentSample = interface(HKSample)
    ['{D5ABE902-7D78-40ED-BA2B-65AC7F5B716D}']
    function documentType: HKDocumentType; cdecl;
  end;

  THKDocumentSample = class(TOCGenericImport<HKDocumentSampleClass,
    HKDocumentSample>)
  end;

  PHKDocumentSample = Pointer;

  HKCDADocumentClass = interface(NSObjectClass)
    ['{CCD5F5F3-D6B1-471B-8332-4A40F26A9192}']
  end;

  HKCDADocument = interface(NSObject)
    ['{CFB4E272-B056-44DE-A699-E7F2CFAF6B97}']
    function documentData: NSData; cdecl;
    function title: NSString; cdecl;
    function patientName: NSString; cdecl;
    function authorName: NSString; cdecl;
    function custodianName: NSString; cdecl;
  end;

  THKCDADocument = class(TOCGenericImport<HKCDADocumentClass, HKCDADocument>)
  end;

  PHKCDADocument = Pointer;

  HKCDADocumentSampleClass = interface(HKDocumentSampleClass)
    ['{37A206E2-C3EF-4B82-AE11-E80F690E1DD7}']
    { class } function CDADocumentSampleWithData(documentData: NSData;
      startDate: NSDate; endDate: NSDate; metadata: NSDictionary;
      validationError: NSError): Pointer { instancetype }; cdecl;
  end;

  HKCDADocumentSample = interface(HKDocumentSample)
    ['{71B3515B-1715-4883-9488-60BD88FED189}']
    function document: HKCDADocument; cdecl;
  end;

  THKCDADocumentSample = class(TOCGenericImport<HKCDADocumentSampleClass,
    HKCDADocumentSample>)
  end;

  PHKCDADocumentSample = Pointer;

  HKCategorySampleClass = interface(HKSampleClass)
    ['{F173D1E5-DE86-4943-AE2C-B1A3491FB91D}']
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
    ['{797CAA34-ED52-470C-BAEB-25A9C91035CF}']
    function categoryType: HKCategoryType; cdecl;
    function value: NSInteger; cdecl;
  end;

  THKCategorySample = class(TOCGenericImport<HKCategorySampleClass,
    HKCategorySample>)
  end;

  PHKCategorySample = Pointer;

  HKBiologicalSexObjectClass = interface(NSObjectClass)
    ['{3D94A2C8-67BA-473D-91B1-74EBF31EF247}']
  end;

  HKBiologicalSexObject = interface(NSObject)
    ['{2CF23418-D08F-4C0C-987F-FEB11CED2DEB}']
    function biologicalSex: HKBiologicalSex; cdecl;
  end;

  THKBiologicalSexObject = class(TOCGenericImport<HKBiologicalSexObjectClass,
    HKBiologicalSexObject>)
  end;

  PHKBiologicalSexObject = Pointer;

  HKBloodTypeObjectClass = interface(NSObjectClass)
    ['{E0875590-BC3B-4BE1-9FF0-55A127E2048A}']
  end;

  HKBloodTypeObject = interface(NSObject)
    ['{2278D50E-E5A3-4104-9521-FC1F7B2A9A8B}']
    function bloodType: HKBloodType; cdecl;
  end;

  THKBloodTypeObject = class(TOCGenericImport<HKBloodTypeObjectClass,
    HKBloodTypeObject>)
  end;

  PHKBloodTypeObject = Pointer;

  HKFitzpatrickSkinTypeObjectClass = interface(NSObjectClass)
    ['{9CA666A8-69E4-451A-9526-683EBC79276B}']
  end;

  HKFitzpatrickSkinTypeObject = interface(NSObject)
    ['{DFC3F6E8-AAEB-474A-A964-EE358AB73DFF}']
    function skinType: HKFitzpatrickSkinType; cdecl;
  end;

  THKFitzpatrickSkinTypeObject = class
    (TOCGenericImport<HKFitzpatrickSkinTypeObjectClass,
    HKFitzpatrickSkinTypeObject>)
  end;

  PHKFitzpatrickSkinTypeObject = Pointer;

  HKWheelchairUseObjectClass = interface(NSObjectClass)
    ['{FB9A2DAA-299B-43F0-B42C-FA41622EA30B}']
  end;

  HKWheelchairUseObject = interface(NSObject)
    ['{A95B6531-D9AF-41C8-A37F-A59CE70A2D45}']
    function wheelchairUse: HKWheelchairUse; cdecl;
  end;

  THKWheelchairUseObject = class(TOCGenericImport<HKWheelchairUseObjectClass,
    HKWheelchairUseObject>)
  end;

  PHKWheelchairUseObject = Pointer;

  HKActivityMoveModeObjectClass = interface(NSObjectClass)
    ['{4636C17D-FE69-4F54-822B-B2971E79CE7D}']
  end;

  HKActivityMoveModeObject = interface(NSObject)
    ['{2F2F4DAA-E9A3-4DA8-BC24-BEF9FBB41114}']
    function activityMoveMode: HKActivityMoveMode; cdecl;
  end;

  THKActivityMoveModeObject = class
    (TOCGenericImport<HKActivityMoveModeObjectClass, HKActivityMoveModeObject>)
  end;

  PHKActivityMoveModeObject = Pointer;

  HKClinicalTypeClass = interface(HKSampleTypeClass)
    ['{2DE4D035-1CC3-437A-A810-A242FCF44F55}']
  end;

  HKClinicalType = interface(HKSampleType)
    ['{FE2A133A-E9E9-4591-B4EF-C6A63812C8F1}']
  end;

  THKClinicalType = class(TOCGenericImport<HKClinicalTypeClass, HKClinicalType>)
  end;

  PHKClinicalType = Pointer;

  HKClinicalRecordClass = interface(HKSampleClass)
    ['{64531EDD-6529-43A3-B9EF-F1E883442D9D}']
  end;

  HKClinicalRecord = interface(HKSample)
    ['{C53582E5-7ACD-4419-9E64-2BD9B9132A79}']
    function clinicalType: HKClinicalType; cdecl;
    function displayName: NSString; cdecl;
    function FHIRResource: HKFHIRResource; cdecl;
  end;

  THKClinicalRecord = class(TOCGenericImport<HKClinicalRecordClass,
    HKClinicalRecord>)
  end;

  PHKClinicalRecord = Pointer;

  HKLensSpecificationClass = interface(NSObjectClass)
    ['{939CCB09-6836-4511-8636-AC6DD90F1292}']
  end;

  HKLensSpecification = interface(NSObject)
    ['{DE1511FC-41F3-4CD1-BF87-124075250CF0}']
    function sphere: HKQuantity; cdecl;
    function cylinder: HKQuantity; cdecl;
    function axis: HKQuantity; cdecl;
    function addPower: HKQuantity; cdecl;
  end;

  THKLensSpecification = class(TOCGenericImport<HKLensSpecificationClass,
    HKLensSpecification>)
  end;

  PHKLensSpecification = Pointer;

  HKVisionPrismClass = interface(NSObjectClass)
    ['{05602665-D4C5-4124-881B-DBFA597DFD85}']
  end;

  HKVisionPrism = interface(NSObject)
    ['{4F4E7F96-0807-4D48-933B-3F40FBC390D5}']
    function amount: HKQuantity; cdecl;
    function angle: HKQuantity; cdecl;
    function verticalAmount: HKQuantity; cdecl;
    function horizontalAmount: HKQuantity; cdecl;
    function verticalBase: HKPrismBase; cdecl;
    function horizontalBase: HKPrismBase; cdecl;
    function eye: HKVisionEye; cdecl;
    function initWithAmount(amount: HKQuantity; angle: HKQuantity;
      eye: HKVisionEye): Pointer { instancetype }; cdecl;
    function initWithVerticalAmount(verticalAmount: HKQuantity;
      verticalBase: HKPrismBase; horizontalAmount: HKQuantity;
      horizontalBase: HKPrismBase; eye: HKVisionEye)
      : Pointer { instancetype }; cdecl;
  end;

  THKVisionPrism = class(TOCGenericImport<HKVisionPrismClass, HKVisionPrism>)
  end;

  PHKVisionPrism = Pointer;

  HKContactsLensSpecificationClass = interface(HKLensSpecificationClass)
    ['{44AE1C63-3821-46F3-AC31-209128564F6B}']
  end;

  HKContactsLensSpecification = interface(HKLensSpecification)
    ['{45BC1639-A1B9-4D20-BAD7-82964F3A4151}']
    function baseCurve: HKQuantity; cdecl;
    function diameter: HKQuantity; cdecl;
    function initWithSphere(sphere: HKQuantity; cylinder: HKQuantity;
      axis: HKQuantity; addPower: HKQuantity; baseCurve: HKQuantity;
      diameter: HKQuantity): Pointer { instancetype }; cdecl;
  end;

  THKContactsLensSpecification = class
    (TOCGenericImport<HKContactsLensSpecificationClass,
    HKContactsLensSpecification>)
  end;

  PHKContactsLensSpecification = Pointer;

  HKVisionPrescriptionClass = interface(HKSampleClass)
    ['{CEB6E8EA-49F1-4941-A2CD-87F34E2B396F}']
    { class } function prescriptionWithType(&type: HKVisionPrescriptionType;
      dateIssued: NSDate; expirationDate: NSDate; device: HKDevice;
      metadata: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  HKVisionPrescription = interface(HKSample)
    ['{2495E6EE-6483-4152-A0C7-34DD55FDAA4C}']
    function prescriptionType: HKVisionPrescriptionType; cdecl;
    function dateIssued: NSDate; cdecl;
    function expirationDate: NSDate; cdecl;
  end;

  THKVisionPrescription = class(TOCGenericImport<HKVisionPrescriptionClass,
    HKVisionPrescription>)
  end;

  PHKVisionPrescription = Pointer;

  HKContactsPrescriptionClass = interface(HKVisionPrescriptionClass)
    ['{0381C4D0-ED36-4D10-8014-4B0450754872}']
    { class } function prescriptionWithRightEyeSpecification
      (rightEyeSpecification: HKContactsLensSpecification;
      leftEyeSpecification: HKContactsLensSpecification; brand: NSString;
      dateIssued: NSDate; expirationDate: NSDate; device: HKDevice;
      metadata: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  HKContactsPrescription = interface(HKVisionPrescription)
    ['{508FE638-C345-44FF-8412-B0A15257C1FC}']
    function rightEye: HKContactsLensSpecification; cdecl;
    function leftEye: HKContactsLensSpecification; cdecl;
    function brand: NSString; cdecl;
  end;

  THKContactsPrescription = class(TOCGenericImport<HKContactsPrescriptionClass,
    HKContactsPrescription>)
  end;

  PHKContactsPrescription = Pointer;

  HKCorrelationClass = interface(HKSampleClass)
    ['{881181FA-B0BC-4876-815C-4327D75E4552}']
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
    ['{48B86960-65E4-453E-98C7-9FC65F6DD9D1}']
    function correlationType: HKCorrelationType; cdecl;
    function objects: NSSet; cdecl;
    function objectsForType(objectType: HKObjectType): NSSet; cdecl;
  end;

  THKCorrelation = class(TOCGenericImport<HKCorrelationClass, HKCorrelation>)
  end;

  PHKCorrelation = Pointer;

  HKCorrelationQueryClass = interface(HKQueryClass)
    ['{B9B07656-B28F-4391-B848-6EFB520350C0}']
  end;

  HKCorrelationQuery = interface(HKQuery)
    ['{C27F75AC-03EB-4F4F-ACE3-F1EDBEFC1523}']
    function correlationType: HKCorrelationType; cdecl;
    function samplePredicates: NSDictionary; cdecl;
    function initWithType(correlationType: HKCorrelationType;
      predicate: NSPredicate; samplePredicates: NSDictionary;
      completion: THealthKitCompletion4): Pointer { instancetype }; cdecl;
  end;

  THKCorrelationQuery = class(TOCGenericImport<HKCorrelationQueryClass,
    HKCorrelationQuery>)
  end;

  PHKCorrelationQuery = Pointer;

  HKQuantitySampleClass = interface(HKSampleClass)
    ['{90761104-8CC9-4670-95E0-46F9D9B6B5D5}']
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
    ['{FD2DD310-07E9-4E28-B0A4-2A2DEC76C1C7}']
    function quantityType: HKQuantityType; cdecl;
    function quantity: HKQuantity; cdecl;
    function count: NSInteger; cdecl;
  end;

  THKQuantitySample = class(TOCGenericImport<HKQuantitySampleClass,
    HKQuantitySample>)
  end;

  PHKQuantitySample = Pointer;

  HKCumulativeQuantitySampleClass = interface(HKQuantitySampleClass)
    ['{E0F93402-F894-4147-A05F-27E1F1E21B86}']
  end;

  HKCumulativeQuantitySample = interface(HKQuantitySample)
    ['{64447CF6-3C20-493A-BE7A-87A97B530554}']
    function sumQuantity: HKQuantity; cdecl;
  end;

  THKCumulativeQuantitySample = class
    (TOCGenericImport<HKCumulativeQuantitySampleClass,
    HKCumulativeQuantitySample>)
  end;

  PHKCumulativeQuantitySample = Pointer;

  HKCumulativeQuantitySeriesSampleClass = interface
    (HKCumulativeQuantitySampleClass)
    ['{01E0F2A3-23CB-45B5-9876-5495DB3BEDC0}']
  end;

  HKCumulativeQuantitySeriesSample = interface(HKCumulativeQuantitySample)
    ['{000F8690-015C-4985-B675-572D46E29400}']
    function sum: HKQuantity; cdecl;
  end;

  THKCumulativeQuantitySeriesSample = class
    (TOCGenericImport<HKCumulativeQuantitySeriesSampleClass,
    HKCumulativeQuantitySeriesSample>)
  end;

  PHKCumulativeQuantitySeriesSample = Pointer;

  HKDiscreteQuantitySampleClass = interface(HKQuantitySampleClass)
    ['{0AA0B8D4-CAB4-45D2-B3C9-272925F10593}']
  end;

  HKDiscreteQuantitySample = interface(HKQuantitySample)
    ['{354EFED7-0582-40ED-820D-94334E5D3914}']
    function minimumQuantity: HKQuantity; cdecl;
    function averageQuantity: HKQuantity; cdecl;
    function maximumQuantity: HKQuantity; cdecl;
    function mostRecentQuantity: HKQuantity; cdecl;
    function mostRecentQuantityDateInterval: NSDateInterval; cdecl;
  end;

  THKDiscreteQuantitySample = class
    (TOCGenericImport<HKDiscreteQuantitySampleClass, HKDiscreteQuantitySample>)
  end;

  PHKDiscreteQuantitySample = Pointer;

  HKDocumentQueryClass = interface(HKQueryClass)
    ['{95438ED3-93EF-4022-9EB0-DDC5A3702D1A}']
  end;

  HKDocumentQuery = interface(HKQuery)
    ['{6366BAF3-97BF-48E9-82AC-D12398A5A815}']
    function limit: NSUInteger; cdecl;
    function sortDescriptors: NSArray; cdecl;
    function includeDocumentData: Boolean; cdecl;
    function initWithDocumentType(documentType: HKDocumentType;
      predicate: NSPredicate; limit: NSUInteger; sortDescriptors: NSArray;
      includeDocumentData: Boolean; resultsHandler: THealthKitResultsHandler)
      : Pointer { instancetype }; cdecl;
  end;

  THKDocumentQuery = class(TOCGenericImport<HKDocumentQueryClass,
    HKDocumentQuery>)
  end;

  PHKDocumentQuery = Pointer;

  HKElectrocardiogramVoltageMeasurementClass = interface(NSObjectClass)
    ['{6950B71F-C2BB-4B63-B17F-EDD6AC2C72CA}']
  end;

  HKElectrocardiogramVoltageMeasurement = interface(NSObject)
    ['{85DAD37E-19E0-43C7-A3BC-F47BD22DFF1C}']
    function timeSinceSampleStart: NSTimeInterval; cdecl;
    function quantityForLead(lead: HKElectrocardiogramLead): HKQuantity; cdecl;
  end;

  THKElectrocardiogramVoltageMeasurement = class
    (TOCGenericImport<HKElectrocardiogramVoltageMeasurementClass,
    HKElectrocardiogramVoltageMeasurement>)
  end;

  PHKElectrocardiogramVoltageMeasurement = Pointer;

  HKElectrocardiogramQueryClass = interface(HKQueryClass)
    ['{988E2BB1-F024-4ECE-9ADD-6DFF9D902A7D}']
  end;

  HKElectrocardiogramQuery = interface(HKQuery)
    ['{5E89CE97-E244-410E-9E5D-C2701D00B777}']
    function initWithElectrocardiogram(electrocardiogram: HKElectrocardiogram;
      dataHandler: THealthKitDataHandler1): Pointer { instancetype }; cdecl;
  end;

  THKElectrocardiogramQuery = class
    (TOCGenericImport<HKElectrocardiogramQueryClass, HKElectrocardiogramQuery>)
  end;

  PHKElectrocardiogramQuery = Pointer;

  HKGlassesLensSpecificationClass = interface(HKLensSpecificationClass)
    ['{E3D9EC8A-C329-4043-A365-0F7F26A71DA9}']
  end;

  HKGlassesLensSpecification = interface(HKLensSpecification)
    ['{9C30D7EC-2E40-47F3-888A-8EE38F52D1C7}']
    function vertexDistance: HKQuantity; cdecl;
    function prism: HKVisionPrism; cdecl;
    function farPupillaryDistance: HKQuantity; cdecl;
    function nearPupillaryDistance: HKQuantity; cdecl;
    function initWithSphere(sphere: HKQuantity; cylinder: HKQuantity;
      axis: HKQuantity; addPower: HKQuantity; vertexDistance: HKQuantity;
      prism: HKVisionPrism; farPupillaryDistance: HKQuantity;
      nearPupillaryDistance: HKQuantity): Pointer { instancetype }; cdecl;
  end;

  THKGlassesLensSpecification = class
    (TOCGenericImport<HKGlassesLensSpecificationClass,
    HKGlassesLensSpecification>)
  end;

  PHKGlassesLensSpecification = Pointer;

  HKGlassesPrescriptionClass = interface(HKVisionPrescriptionClass)
    ['{D6572613-B95C-48DE-ACFB-B107B990F44C}']
    { class } function prescriptionWithRightEyeSpecification
      (rightEyeSpecification: HKGlassesLensSpecification;
      leftEyeSpecification: HKGlassesLensSpecification; dateIssued: NSDate;
      expirationDate: NSDate; device: HKDevice; metadata: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  HKGlassesPrescription = interface(HKVisionPrescription)
    ['{3ECD165E-CD91-473B-8737-64071CC654D2}']
    function rightEye: HKGlassesLensSpecification; cdecl;
    function leftEye: HKGlassesLensSpecification; cdecl;
  end;

  THKGlassesPrescription = class(TOCGenericImport<HKGlassesPrescriptionClass,
    HKGlassesPrescription>)
  end;

  PHKGlassesPrescription = Pointer;

  HKWorkoutBuilderClass = interface(NSObjectClass)
    ['{26BEC100-FFA9-44A2-BE50-ADC2B73F0B45}']
  end;

  HKWorkoutBuilder = interface(NSObject)
    ['{5D44A6B9-EE7B-4C0E-96AE-C31175992764}']
    function device: HKDevice; cdecl;
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function workoutConfiguration: HKWorkoutConfiguration; cdecl;
    function metadata: NSDictionary; cdecl;
    function workoutEvents: NSArray; cdecl;
    function workoutActivities: NSArray; cdecl;
    function allStatistics: NSDictionary; cdecl;
    function initWithHealthStore(healthStore: HKHealthStore;
      configuration: HKWorkoutConfiguration; device: HKDevice)
      : Pointer { instancetype }; cdecl;
    procedure beginCollectionWithStartDate(startDate: NSDate;
      completion: THealthKitCompletion1); cdecl;
    procedure addSamples(samples: NSArray;
      completion: THealthKitCompletion1); cdecl;
    procedure addWorkoutEvents(workoutEvents: NSArray;
      completion: THealthKitCompletion1); cdecl;
    procedure addMetadata(metadata: NSDictionary;
      completion: THealthKitCompletion1); cdecl;
    procedure addWorkoutActivity(workoutActivity: HKWorkoutActivity;
      completion: THealthKitCompletion1); cdecl;
    [MethodName('updateActivityWithUUID:endDate:completion:')]
    procedure updateActivityWithUUIDEndDateCompletion(UUID: NSUUID;
      endDate: NSDate; completion: THealthKitCompletion1); cdecl;
    [MethodName('updateActivityWithUUID:addMedatata:completion:')]
    procedure updateActivityWithUUIDAddMedatataCompletion(UUID: NSUUID;
      addMedatata: NSDictionary; completion: THealthKitCompletion1); cdecl;
    procedure endCollectionWithEndDate(endDate: NSDate;
      completion: THealthKitCompletion1); cdecl;
    procedure finishWorkoutWithCompletion(completion
      : THealthKitCompletion9); cdecl;
    procedure discardWorkout; cdecl;
    function elapsedTimeAtDate(date: NSDate): NSTimeInterval; cdecl;
    function statisticsForType(quantityType: HKQuantityType)
      : HKStatistics; cdecl;
    function seriesBuilderForType(seriesType: HKSeriesType)
      : HKSeriesBuilder; cdecl;
  end;

  THKWorkoutBuilder = class(TOCGenericImport<HKWorkoutBuilderClass,
    HKWorkoutBuilder>)
  end;

  PHKWorkoutBuilder = Pointer;

  HKWorkoutConfigurationClass = interface(NSObjectClass)
    ['{07AEC170-DB0C-47A6-AE30-8D263F771731}']
  end;

  HKWorkoutConfiguration = interface(NSObject)
    ['{DA204829-0EAE-4C9B-A78B-FAA019ADE543}']
    procedure setActivityType(activityType: HKWorkoutActivityType); cdecl;
    function activityType: HKWorkoutActivityType; cdecl;
    procedure setLocationType(locationType
      : HKWorkoutSessionLocationType); cdecl;
    function locationType: HKWorkoutSessionLocationType; cdecl;
    procedure setSwimmingLocationType(swimmingLocationType
      : HKWorkoutSwimmingLocationType); cdecl;
    function swimmingLocationType: HKWorkoutSwimmingLocationType; cdecl;
    procedure setLapLength(lapLength: HKQuantity); cdecl;
    function lapLength: HKQuantity; cdecl;
  end;

  THKWorkoutConfiguration = class(TOCGenericImport<HKWorkoutConfigurationClass,
    HKWorkoutConfiguration>)
  end;

  PHKWorkoutConfiguration = Pointer;

  HKWorkoutSessionClass = interface(NSObjectClass)
    ['{F44186B5-9A29-4F4C-8459-6F20FA0A72A0}']
  end;

  HKWorkoutSession = interface(NSObject)
    ['{B07C632F-D69C-4CF7-B939-53A5FB9579CC}']
    function activityType: HKWorkoutActivityType; cdecl;
    function locationType: HKWorkoutSessionLocationType; cdecl;
    function workoutConfiguration: HKWorkoutConfiguration; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function state: HKWorkoutSessionState; cdecl;
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function currentActivity: HKWorkoutActivity; cdecl;
    function initWithActivityType(activityType: HKWorkoutActivityType;
      locationType: HKWorkoutSessionLocationType)
      : Pointer { instancetype }; cdecl;
    function initWithConfiguration(workoutConfiguration: HKWorkoutConfiguration;
      error: NSError): Pointer { instancetype }; cdecl;
    function initWithHealthStore(healthStore: HKHealthStore;
      configuration: HKWorkoutConfiguration; error: NSError)
      : Pointer { instancetype }; cdecl;
    procedure prepare; cdecl;
    procedure startActivityWithDate(date: NSDate); cdecl;
    procedure stopActivityWithDate(date: NSDate); cdecl;
    procedure &end; cdecl;
    procedure pause; cdecl;
    procedure resume; cdecl;
    function associatedWorkoutBuilder: HKLiveWorkoutBuilder; cdecl;
    procedure beginNewActivityWithConfiguration(workoutConfiguration
      : HKWorkoutConfiguration; date: NSDate; metadata: NSDictionary); cdecl;
    procedure endCurrentActivityOnDate(date: NSDate); cdecl;
  end;

  THKWorkoutSession = class(TOCGenericImport<HKWorkoutSessionClass,
    HKWorkoutSession>)
  end;

  PHKWorkoutSession = Pointer;

  HKSeriesBuilderClass = interface(NSObjectClass)
    ['{D45B8A10-793A-433A-8B35-8E097A02D14C}']
  end;

  HKSeriesBuilder = interface(NSObject)
    ['{E3A5677C-0A5A-4253-8E7B-47917D6D37B5}']
    procedure discard; cdecl;
  end;

  THKSeriesBuilder = class(TOCGenericImport<HKSeriesBuilderClass,
    HKSeriesBuilder>)
  end;

  PHKSeriesBuilder = Pointer;

  HKSeriesSampleClass = interface(HKSampleClass)
    ['{9B80DA5D-1A36-43ED-B548-6DE0974B0EA2}']
  end;

  HKSeriesSample = interface(HKSample)
    ['{B0E67472-3169-4E53-944F-91A45C3E7E5B}']
    function count: NSUInteger; cdecl;
  end;

  THKSeriesSample = class(TOCGenericImport<HKSeriesSampleClass, HKSeriesSample>)
  end;

  PHKSeriesSample = Pointer;

  HKHeartbeatSeriesSampleClass = interface(HKSeriesSampleClass)
    ['{CB65445B-D83F-4308-9C55-095CFF0824CE}']
  end;

  HKHeartbeatSeriesSample = interface(HKSeriesSample)
    ['{C67F5A42-4575-4BE9-8650-AAFD9871577C}']
  end;

  THKHeartbeatSeriesSample = class
    (TOCGenericImport<HKHeartbeatSeriesSampleClass, HKHeartbeatSeriesSample>)
  end;

  PHKHeartbeatSeriesSample = Pointer;

  HKHeartbeatSeriesBuilderClass = interface(HKSeriesBuilderClass)
    ['{7C5C0063-6AC2-467F-A565-61C881D49653}']
  end;

  HKHeartbeatSeriesBuilder = interface(HKSeriesBuilder)
    ['{A11CB69D-7F43-44D2-BFB4-4BB340C90D56}']
    procedure setMaximumCount(maximumCount: NSUInteger); cdecl;
    function maximumCount: NSUInteger; cdecl;
    function initWithHealthStore(healthStore: HKHealthStore; device: HKDevice;
      startDate: NSDate): Pointer { instancetype }; cdecl;
    procedure addHeartbeatWithTimeIntervalSinceSeriesStartDate
      (timeIntervalSinceStart: NSTimeInterval; precededByGap: Boolean;
      completion: THealthKitCompletion1); cdecl;
    procedure addMetadata(metadata: NSDictionary;
      completion: THealthKitCompletion1); cdecl;
    procedure finishSeriesWithCompletion(completion
      : THealthKitCompletion8); cdecl;
  end;

  THKHeartbeatSeriesBuilder = class
    (TOCGenericImport<HKHeartbeatSeriesBuilderClass, HKHeartbeatSeriesBuilder>)
  end;

  PHKHeartbeatSeriesBuilder = Pointer;

  HKHeartbeatSeriesQueryClass = interface(HKQueryClass)
    ['{A5481309-2F16-45E3-B248-E8418162A94A}']
  end;

  HKHeartbeatSeriesQuery = interface(HKQuery)
    ['{03075D5A-40F9-4634-A9E1-F515920FFBF2}']
    function initWithHeartbeatSeries(heartbeatSeries: HKHeartbeatSeriesSample;
      dataHandler: THealthKitDataHandler2): Pointer { instancetype }; cdecl;
  end;

  THKHeartbeatSeriesQuery = class(TOCGenericImport<HKHeartbeatSeriesQueryClass,
    HKHeartbeatSeriesQuery>)
  end;

  PHKHeartbeatSeriesQuery = Pointer;

  HKLiveWorkoutDataSourceClass = interface(NSObjectClass)
    ['{23625D29-7B70-44CF-B08C-10F691C43641}']
  end;

  HKLiveWorkoutDataSource = interface(NSObject)
    ['{D145480D-AE07-44F6-A469-80FC95B87E54}']
    function typesToCollect: NSSet; cdecl;
    function initWithHealthStore(healthStore: HKHealthStore;
      workoutConfiguration: HKWorkoutConfiguration)
      : Pointer { instancetype }; cdecl;
    procedure enableCollectionForType(quantityType: HKQuantityType;
      predicate: NSPredicate); cdecl;
    procedure disableCollectionForType(quantityType: HKQuantityType); cdecl;
  end;

  THKLiveWorkoutDataSource = class
    (TOCGenericImport<HKLiveWorkoutDataSourceClass, HKLiveWorkoutDataSource>)
  end;

  PHKLiveWorkoutDataSource = Pointer;

  HKLiveWorkoutBuilderClass = interface(HKWorkoutBuilderClass)
    ['{04A82D2B-6F3A-4B9F-AD74-921A9A6E6FE2}']
  end;

  HKLiveWorkoutBuilder = interface(HKWorkoutBuilder)
    ['{FBB5C8C4-865C-4302-BF5A-38F8E3E5BC3A}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function workoutSession: HKWorkoutSession; cdecl;
    procedure setShouldCollectWorkoutEvents(shouldCollectWorkoutEvents
      : Boolean); cdecl;
    function shouldCollectWorkoutEvents: Boolean; cdecl;
    procedure setDataSource(dataSource: HKLiveWorkoutDataSource); cdecl;
    function dataSource: HKLiveWorkoutDataSource; cdecl;
    function elapsedTime: NSTimeInterval; cdecl;
    function currentWorkoutActivity: HKWorkoutActivity; cdecl;
  end;

  THKLiveWorkoutBuilder = class(TOCGenericImport<HKLiveWorkoutBuilderClass,
    HKLiveWorkoutBuilder>)
  end;

  PHKLiveWorkoutBuilder = Pointer;

  HKObserverQueryClass = interface(HKQueryClass)
    ['{809A4439-79E6-4C89-95AE-07ED29AB01DC}']
  end;

  HKObserverQuery = interface(HKQuery)
    ['{4841D854-2F93-4F9D-9BB6-4979CC5EC688}']
    function initWithSampleType(sampleType: HKSampleType;
      predicate: NSPredicate; updateHandler: THealthKitUpdateHandler2)
      : Pointer { instancetype }; cdecl;
    function initWithQueryDescriptors(queryDescriptors: NSArray;
      updateHandler: THealthKitUpdateHandler3): Pointer { instancetype }; cdecl;
  end;

  THKObserverQuery = class(TOCGenericImport<HKObserverQueryClass,
    HKObserverQuery>)
  end;

  PHKObserverQuery = Pointer;

  HKQuantitySeriesSampleBuilderClass = interface(NSObjectClass)
    ['{901C6DBB-113E-46EE-B513-B2529C210334}']
  end;

  HKQuantitySeriesSampleBuilder = interface(NSObject)
    ['{C2D2D02A-748B-4837-8212-10191E925C1C}']
    function initWithHealthStore(healthStore: HKHealthStore;
      quantityType: HKQuantityType; startDate: NSDate; device: HKDevice)
      : Pointer { instancetype }; cdecl;
    function quantityType: HKQuantityType; cdecl;
    function startDate: NSDate; cdecl;
    function device: HKDevice; cdecl;
    [MethodName('insertQuantity:dateInterval:error:')]
    function insertQuantityDateIntervalError(quantity: HKQuantity;
      dateInterval: NSDateInterval; error: NSError): Boolean; cdecl;
    [MethodName('insertQuantity:date:error:')]
    function insertQuantityDateError(quantity: HKQuantity; date: NSDate;
      error: NSError): Boolean; cdecl;
    [MethodName('finishSeriesWithMetadata:endDate:completion:')]
    procedure finishSeriesWithMetadataEndDateCompletion(metadata: NSDictionary;
      endDate: NSDate; completion: THealthKitCompletion2); cdecl;
    [MethodName('finishSeriesWithMetadata:completion:')]
    procedure finishSeriesWithMetadataCompletion(metadata: NSDictionary;
      completion: THealthKitCompletion2); cdecl;
    procedure discard; cdecl;
  end;

  THKQuantitySeriesSampleBuilder = class
    (TOCGenericImport<HKQuantitySeriesSampleBuilderClass,
    HKQuantitySeriesSampleBuilder>)
  end;

  PHKQuantitySeriesSampleBuilder = Pointer;

  HKQuantitySeriesSampleQueryClass = interface(HKQueryClass)
    ['{E125921A-7393-4B20-A956-9F7B40B5482B}']
  end;

  HKQuantitySeriesSampleQuery = interface(HKQuery)
    ['{E7D275A3-7917-44FD-9948-E244E81E6880}']
    procedure setIncludeSample(includeSample: Boolean); cdecl;
    function includeSample: Boolean; cdecl;
    procedure setOrderByQuantitySampleStartDate(orderByQuantitySampleStartDate
      : Boolean); cdecl;
    function orderByQuantitySampleStartDate: Boolean; cdecl;
    function initWithQuantityType(quantityType: HKQuantityType;
      predicate: NSPredicate; quantityHandler: THealthKitQuantityHandler)
      : Pointer { instancetype }; cdecl;
    function initWithSample(quantitySample: HKQuantitySample;
      quantityHandler: THealthKitQuantityHandler1)
      : Pointer { instancetype }; cdecl;
  end;

  THKQuantitySeriesSampleQuery = class
    (TOCGenericImport<HKQuantitySeriesSampleQueryClass,
    HKQuantitySeriesSampleQuery>)
  end;

  PHKQuantitySeriesSampleQuery = Pointer;

  HKSampleQueryClass = interface(HKQueryClass)
    ['{711C06DA-7733-46C0-9FE7-013F64F9EA69}']
  end;

  HKSampleQuery = interface(HKQuery)
    ['{3DD8E45E-C11D-4C89-AB79-AE3928814C5C}']
    function limit: NSUInteger; cdecl;
    function sortDescriptors: NSArray; cdecl;
    function initWithSampleType(sampleType: HKSampleType;
      predicate: NSPredicate; limit: NSUInteger; sortDescriptors: NSArray;
      resultsHandler: THealthKitResultsHandler2)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithQueryDescriptors:limit:resultsHandler:')]
    function initWithQueryDescriptorsLimitResultsHandler(queryDescriptors
      : NSArray; limit: NSInteger; resultsHandler: THealthKitResultsHandler2)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('initWithQueryDescriptors:limit:sortDescriptors:resultsHandler:')]
    function initWithQueryDescriptorsLimitSortDescriptorsResultsHandler
      (queryDescriptors: NSArray; limit: NSInteger; sortDescriptors: NSArray;
      resultsHandler: THealthKitResultsHandler2)
      : Pointer { instancetype }; cdecl;
  end;

  THKSampleQuery = class(TOCGenericImport<HKSampleQueryClass, HKSampleQuery>)
  end;

  PHKSampleQuery = Pointer;

  HKSourceQueryClass = interface(HKQueryClass)
    ['{04C2F2B6-C73F-4CA2-A8F0-2B4B42CA025C}']
  end;

  HKSourceQuery = interface(HKQuery)
    ['{81E7D423-04A9-4368-BE54-6D832FAE0A36}']
    function initWithSampleType(sampleType: HKSampleType;
      samplePredicate: NSPredicate;
      completionHandler: THealthKitCompletionHandler1)
      : Pointer { instancetype }; cdecl;
  end;

  THKSourceQuery = class(TOCGenericImport<HKSourceQueryClass, HKSourceQuery>)
  end;

  PHKSourceQuery = Pointer;

  HKStatisticsCollectionClass = interface(NSObjectClass)
    ['{C712CAF8-4A9D-4FB8-B2A0-9F23AAB1884E}']
  end;

  HKStatisticsCollection = interface(NSObject)
    ['{3F1799BD-A638-4055-AAEF-7DC47B30C202}']
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
    ['{F3564FA7-BE42-4389-9C59-71038D64C13A}']
  end;

  HKStatisticsCollectionQuery = interface(HKQuery)
    ['{0B685A83-CEA7-49E8-A6C3-19239F0EB854}']
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
    ['{ACBF38CB-BC95-49C2-AE17-711CC29E75BC}']
  end;

  HKStatisticsQuery = interface(HKQuery)
    ['{C47B364F-A896-4186-AB00-78719F038548}']
    function initWithQuantityType(quantityType: HKQuantityType;
      quantitySamplePredicate: NSPredicate; options: HKStatisticsOptions;
      completionHandler: THealthKitCompletionHandler2)
      : Pointer { instancetype }; cdecl;
  end;

  THKStatisticsQuery = class(TOCGenericImport<HKStatisticsQueryClass,
    HKStatisticsQuery>)
  end;

  PHKStatisticsQuery = Pointer;

  HKVerifiableClinicalRecordSubjectClass = interface(NSObjectClass)
    ['{F0D2518A-A4E6-4814-B545-A894AE2F7406}']
  end;

  HKVerifiableClinicalRecordSubject = interface(NSObject)
    ['{30614B5E-19E5-41D9-8DE3-64EE16587FB2}']
    function fullName: NSString; cdecl;
    function dateOfBirthComponents: NSDateComponents; cdecl;
  end;

  THKVerifiableClinicalRecordSubject = class
    (TOCGenericImport<HKVerifiableClinicalRecordSubjectClass,
    HKVerifiableClinicalRecordSubject>)
  end;

  PHKVerifiableClinicalRecordSubject = Pointer;

  HKVerifiableClinicalRecordClass = interface(HKSampleClass)
    ['{113160B5-9BEF-4C0D-B1A1-07CF46625E16}']
  end;

  HKVerifiableClinicalRecord = interface(HKSample)
    ['{97244700-1F7B-4E18-8662-F7B1E1A99A4B}']
    function recordTypes: NSArray; cdecl;
    function issuerIdentifier: NSString; cdecl;
    function subject: HKVerifiableClinicalRecordSubject; cdecl;
    function issuedDate: NSDate; cdecl;
    function relevantDate: NSDate; cdecl;
    function expirationDate: NSDate; cdecl;
    function itemNames: NSArray; cdecl;
    function sourceType: HKVerifiableClinicalRecordSourceType; cdecl;
    function dataRepresentation: NSData; cdecl;
    function JWSRepresentation: NSData; cdecl;
  end;

  THKVerifiableClinicalRecord = class
    (TOCGenericImport<HKVerifiableClinicalRecordClass,
    HKVerifiableClinicalRecord>)
  end;

  PHKVerifiableClinicalRecord = Pointer;

  HKVerifiableClinicalRecordQueryClass = interface(HKQueryClass)
    ['{C9C52491-F307-407F-BAF5-C84708041AD7}']
  end;

  HKVerifiableClinicalRecordQuery = interface(HKQuery)
    ['{5B3F8CBB-619F-4129-9E2A-1E97AA170840}']
    function recordTypes: NSArray; cdecl;
    function sourceTypes: NSArray; cdecl;
    [MethodName('initWithRecordTypes:predicate:resultsHandler:')]
    function initWithRecordTypesPredicateResultsHandler(recordTypes: NSArray;
      predicate: NSPredicate; resultsHandler: THealthKitResultsHandler3)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithRecordTypes:sourceTypes:predicate:resultsHandler:')]
    function initWithRecordTypesSourceTypesPredicateResultsHandler
      (recordTypes: NSArray; sourceTypes: NSArray; predicate: NSPredicate;
      resultsHandler: THealthKitResultsHandler3)
      : Pointer { instancetype }; cdecl;
  end;

  THKVerifiableClinicalRecordQuery = class
    (TOCGenericImport<HKVerifiableClinicalRecordQueryClass,
    HKVerifiableClinicalRecordQuery>)
  end;

  PHKVerifiableClinicalRecordQuery = Pointer;

  HKWorkoutRouteClass = interface(HKSeriesSampleClass)
    ['{D5CA6164-5860-463A-90CD-5F2D3D600367}']
  end;

  HKWorkoutRoute = interface(HKSeriesSample)
    ['{3D5F447D-7607-4216-9A3C-C6242317AAC2}']
  end;

  THKWorkoutRoute = class(TOCGenericImport<HKWorkoutRouteClass, HKWorkoutRoute>)
  end;

  PHKWorkoutRoute = Pointer;

  HKWorkoutRouteBuilderClass = interface(HKSeriesBuilderClass)
    ['{EC7D0670-E0F1-45A4-ACAF-45222B80333F}']
  end;

  HKWorkoutRouteBuilder = interface(HKSeriesBuilder)
    ['{12E30ECD-3AB2-4F69-BF84-69B689D9E0FE}']
    function initWithHealthStore(healthStore: HKHealthStore; device: HKDevice)
      : Pointer { instancetype }; cdecl;
    procedure insertRouteData(routeData: NSArray;
      completion: THealthKitCompletion1); cdecl;
    procedure addMetadata(metadata: NSDictionary;
      completion: THealthKitCompletion1); cdecl;
    procedure finishRouteWithWorkout(workout: HKWorkout; metadata: NSDictionary;
      completion: THealthKitCompletion10); cdecl;
  end;

  THKWorkoutRouteBuilder = class(TOCGenericImport<HKWorkoutRouteBuilderClass,
    HKWorkoutRouteBuilder>)
  end;

  PHKWorkoutRouteBuilder = Pointer;

  HKWorkoutRouteQueryClass = interface(HKQueryClass)
    ['{A46A0772-0694-4ED6-A91E-5734A3806D2F}']
  end;

  HKWorkoutRouteQuery = interface(HKQuery)
    ['{DE87EF92-6385-45B9-BF98-52D1DA20F4E6}']
    [MethodName('initWithRoute:dataHandler:')]
    function initWithRouteDataHandler(workoutRoute: HKWorkoutRoute;
      dataHandler: THealthKitDataHandler3): Pointer { instancetype }; cdecl;
    [MethodName('initWithRoute:dateInterval:dataHandler:')]
    function initWithRouteDateIntervalDataHandler(workoutRoute: HKWorkoutRoute;
      dateInterval: NSDateInterval; dataHandler: THealthKitDataHandler3)
      : Pointer { instancetype }; cdecl;
  end;

  THKWorkoutRouteQuery = class(TOCGenericImport<HKWorkoutRouteQueryClass,
    HKWorkoutRouteQuery>)
  end;

  PHKWorkoutRouteQuery = Pointer;

  // ===== Protocol declarations =====

  HKLiveWorkoutBuilderDelegate = interface(IObjectiveC)
    ['{79172752-3879-46F3-AE7B-444798B9815A}']
    [MethodName('workoutBuilder:didCollectDataOfTypes:')]
    procedure workoutBuilderDidCollectDataOfTypes(workoutBuilder
      : HKLiveWorkoutBuilder; didCollectDataOfTypes: NSSet); cdecl;
    procedure workoutBuilderDidCollectEvent(workoutBuilder
      : HKLiveWorkoutBuilder); cdecl;
    [MethodName('workoutBuilder:didBeginActivity:')]
    procedure workoutBuilderDidBeginActivity(workoutBuilder
      : HKLiveWorkoutBuilder; didBeginActivity: HKWorkoutActivity); cdecl;
    [MethodName('workoutBuilder:didEndActivity:')]
    procedure workoutBuilderDidEndActivity(workoutBuilder: HKLiveWorkoutBuilder;
      didEndActivity: HKWorkoutActivity); cdecl;
  end;

  HKWorkoutSessionDelegate = interface(IObjectiveC)
    ['{C2C2782C-0E3B-4D16-81A5-66F56871D03B}']
    [MethodName('workoutSession:didChangeToState:fromState:date:')]
    procedure workoutSessionDidChangeToStateFromStateDate(workoutSession
      : HKWorkoutSession; didChangeToState: HKWorkoutSessionState;
      fromState: HKWorkoutSessionState; date: NSDate); cdecl;
    [MethodName('workoutSession:didFailWithError:')]
    procedure workoutSessionDidFailWithError(workoutSession: HKWorkoutSession;
      didFailWithError: NSError); cdecl;
    [MethodName('workoutSession:didGenerateEvent:')]
    procedure workoutSessionDidGenerateEvent(workoutSession: HKWorkoutSession;
      didGenerateEvent: HKWorkoutEvent); cdecl;
    [MethodName('workoutSession:didBeginActivityWithConfiguration:date:')]
    procedure workoutSessionDidBeginActivityWithConfigurationDate
      (workoutSession: HKWorkoutSession;
      didBeginActivityWithConfiguration: HKWorkoutConfiguration;
      date: NSDate); cdecl;
    [MethodName('workoutSession:didEndActivityWithConfiguration:date:')]
    procedure workoutSessionDidEndActivityWithConfigurationDate
      (workoutSession: HKWorkoutSession;
      didEndActivityWithConfiguration: HKWorkoutConfiguration;
      date: NSDate); cdecl;
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
function HKPredicateKeyPathAverageHeartRate: NSString;
function HKPredicateKeyPathECGClassification: NSString;
function HKPredicateKeyPathECGSymptomsStatus: NSString;
function HKFHIRResourceTypeAllergyIntolerance: Pointer;
function HKFHIRResourceTypeCondition: Pointer;
function HKFHIRResourceTypeCoverage: Pointer;
function HKFHIRResourceTypeDiagnosticReport: Pointer;
function HKFHIRResourceTypeDocumentReference: Pointer;
function HKFHIRResourceTypeImmunization: Pointer;
function HKFHIRResourceTypeMedicationDispense: Pointer;
function HKFHIRResourceTypeMedicationOrder: Pointer;
function HKFHIRResourceTypeMedicationRequest: Pointer;
function HKFHIRResourceTypeMedicationStatement: Pointer;
function HKFHIRResourceTypeObservation: Pointer;
function HKFHIRResourceTypeProcedure: Pointer;
function HKPredicateKeyPathWorkoutDuration: NSString;
function HKPredicateKeyPathWorkoutTotalDistance: NSString;
function HKPredicateKeyPathWorkoutTotalEnergyBurned: NSString;
function HKPredicateKeyPathWorkoutType: NSString;
function HKPredicateKeyPathWorkoutTotalSwimmingStrokeCount: NSString;
function HKPredicateKeyPathWorkoutTotalFlightsClimbed: NSString;
function HKPredicateKeyPathWorkoutSumQuantity: NSString;
function HKPredicateKeyPathWorkoutMinimumQuantity: NSString;
function HKPredicateKeyPathWorkoutMaximumQuantity: NSString;
function HKPredicateKeyPathWorkoutAverageQuantity: NSString;
function HKPredicateKeyPathWorkoutActivity: NSString;
function HKWorkoutSortIdentifierDuration: NSString;
function HKWorkoutSortIdentifierTotalDistance: NSString;
function HKWorkoutSortIdentifierTotalEnergyBurned: NSString;
function HKWorkoutSortIdentifierTotalSwimmingStrokeCount: NSString;
function HKWorkoutSortIdentifierTotalFlightsClimbed: NSString;
function HKQuantityTypeIdentifierBodyMassIndex: Pointer;
function HKQuantityTypeIdentifierBodyFatPercentage: Pointer;
function HKQuantityTypeIdentifierHeight: Pointer;
function HKQuantityTypeIdentifierBodyMass: Pointer;
function HKQuantityTypeIdentifierLeanBodyMass: Pointer;
function HKQuantityTypeIdentifierWaistCircumference: Pointer;
function HKQuantityTypeIdentifierAppleSleepingWristTemperature: Pointer;
function HKQuantityTypeIdentifierStepCount: Pointer;
function HKQuantityTypeIdentifierDistanceWalkingRunning: Pointer;
function HKQuantityTypeIdentifierDistanceCycling: Pointer;
function HKQuantityTypeIdentifierDistanceWheelchair: Pointer;
function HKQuantityTypeIdentifierBasalEnergyBurned: Pointer;
function HKQuantityTypeIdentifierActiveEnergyBurned: Pointer;
function HKQuantityTypeIdentifierFlightsClimbed: Pointer;
function HKQuantityTypeIdentifierNikeFuel: Pointer;
function HKQuantityTypeIdentifierAppleExerciseTime: Pointer;
function HKQuantityTypeIdentifierPushCount: Pointer;
function HKQuantityTypeIdentifierDistanceSwimming: Pointer;
function HKQuantityTypeIdentifierSwimmingStrokeCount: Pointer;
function HKQuantityTypeIdentifierVO2Max: Pointer;
function HKQuantityTypeIdentifierDistanceDownhillSnowSports: Pointer;
function HKQuantityTypeIdentifierAppleStandTime: Pointer;
function HKQuantityTypeIdentifierWalkingSpeed: Pointer;
function HKQuantityTypeIdentifierWalkingDoubleSupportPercentage: Pointer;
function HKQuantityTypeIdentifierWalkingAsymmetryPercentage: Pointer;
function HKQuantityTypeIdentifierWalkingStepLength: Pointer;
function HKQuantityTypeIdentifierSixMinuteWalkTestDistance: Pointer;
function HKQuantityTypeIdentifierStairAscentSpeed: Pointer;
function HKQuantityTypeIdentifierStairDescentSpeed: Pointer;
function HKQuantityTypeIdentifierAppleMoveTime: Pointer;
function HKQuantityTypeIdentifierAppleWalkingSteadiness: Pointer;
function HKQuantityTypeIdentifierRunningStrideLength: Pointer;
function HKQuantityTypeIdentifierRunningVerticalOscillation: Pointer;
function HKQuantityTypeIdentifierRunningGroundContactTime: Pointer;
function HKQuantityTypeIdentifierRunningPower: Pointer;
function HKQuantityTypeIdentifierRunningSpeed: Pointer;
function HKQuantityTypeIdentifierHeartRate: Pointer;
function HKQuantityTypeIdentifierBodyTemperature: Pointer;
function HKQuantityTypeIdentifierBasalBodyTemperature: Pointer;
function HKQuantityTypeIdentifierBloodPressureSystolic: Pointer;
function HKQuantityTypeIdentifierBloodPressureDiastolic: Pointer;
function HKQuantityTypeIdentifierRespiratoryRate: Pointer;
function HKQuantityTypeIdentifierRestingHeartRate: Pointer;
function HKQuantityTypeIdentifierWalkingHeartRateAverage: Pointer;
function HKQuantityTypeIdentifierHeartRateVariabilitySDNN: Pointer;
function HKQuantityTypeIdentifierHeartRateRecoveryOneMinute: Pointer;
function HKQuantityTypeIdentifierOxygenSaturation: Pointer;
function HKQuantityTypeIdentifierPeripheralPerfusionIndex: Pointer;
function HKQuantityTypeIdentifierBloodGlucose: Pointer;
function HKQuantityTypeIdentifierNumberOfTimesFallen: Pointer;
function HKQuantityTypeIdentifierElectrodermalActivity: Pointer;
function HKQuantityTypeIdentifierInhalerUsage: Pointer;
function HKQuantityTypeIdentifierInsulinDelivery: Pointer;
function HKQuantityTypeIdentifierBloodAlcoholContent: Pointer;
function HKQuantityTypeIdentifierForcedVitalCapacity: Pointer;
function HKQuantityTypeIdentifierForcedExpiratoryVolume1: Pointer;
function HKQuantityTypeIdentifierPeakExpiratoryFlowRate: Pointer;
function HKQuantityTypeIdentifierEnvironmentalAudioExposure: Pointer;
function HKQuantityTypeIdentifierHeadphoneAudioExposure: Pointer;
function HKQuantityTypeIdentifierNumberOfAlcoholicBeverages: Pointer;
function HKQuantityTypeIdentifierDietaryFatTotal: Pointer;
function HKQuantityTypeIdentifierDietaryFatPolyunsaturated: Pointer;
function HKQuantityTypeIdentifierDietaryFatMonounsaturated: Pointer;
function HKQuantityTypeIdentifierDietaryFatSaturated: Pointer;
function HKQuantityTypeIdentifierDietaryCholesterol: Pointer;
function HKQuantityTypeIdentifierDietarySodium: Pointer;
function HKQuantityTypeIdentifierDietaryCarbohydrates: Pointer;
function HKQuantityTypeIdentifierDietaryFiber: Pointer;
function HKQuantityTypeIdentifierDietarySugar: Pointer;
function HKQuantityTypeIdentifierDietaryEnergyConsumed: Pointer;
function HKQuantityTypeIdentifierDietaryProtein: Pointer;
function HKQuantityTypeIdentifierDietaryVitaminA: Pointer;
function HKQuantityTypeIdentifierDietaryVitaminB6: Pointer;
function HKQuantityTypeIdentifierDietaryVitaminB12: Pointer;
function HKQuantityTypeIdentifierDietaryVitaminC: Pointer;
function HKQuantityTypeIdentifierDietaryVitaminD: Pointer;
function HKQuantityTypeIdentifierDietaryVitaminE: Pointer;
function HKQuantityTypeIdentifierDietaryVitaminK: Pointer;
function HKQuantityTypeIdentifierDietaryCalcium: Pointer;
function HKQuantityTypeIdentifierDietaryIron: Pointer;
function HKQuantityTypeIdentifierDietaryThiamin: Pointer;
function HKQuantityTypeIdentifierDietaryRiboflavin: Pointer;
function HKQuantityTypeIdentifierDietaryNiacin: Pointer;
function HKQuantityTypeIdentifierDietaryFolate: Pointer;
function HKQuantityTypeIdentifierDietaryBiotin: Pointer;
function HKQuantityTypeIdentifierDietaryPantothenicAcid: Pointer;
function HKQuantityTypeIdentifierDietaryPhosphorus: Pointer;
function HKQuantityTypeIdentifierDietaryIodine: Pointer;
function HKQuantityTypeIdentifierDietaryMagnesium: Pointer;
function HKQuantityTypeIdentifierDietaryZinc: Pointer;
function HKQuantityTypeIdentifierDietarySelenium: Pointer;
function HKQuantityTypeIdentifierDietaryCopper: Pointer;
function HKQuantityTypeIdentifierDietaryManganese: Pointer;
function HKQuantityTypeIdentifierDietaryChromium: Pointer;
function HKQuantityTypeIdentifierDietaryMolybdenum: Pointer;
function HKQuantityTypeIdentifierDietaryChloride: Pointer;
function HKQuantityTypeIdentifierDietaryPotassium: Pointer;
function HKQuantityTypeIdentifierDietaryCaffeine: Pointer;
function HKQuantityTypeIdentifierDietaryWater: Pointer;
function HKQuantityTypeIdentifierUVExposure: Pointer;
function HKQuantityTypeIdentifierAtrialFibrillationBurden: Pointer;
function HKQuantityTypeIdentifierUnderwaterDepth: Pointer;
function HKQuantityTypeIdentifierWaterTemperature: Pointer;
function HKCategoryTypeIdentifierSleepAnalysis: Pointer;
function HKCategoryTypeIdentifierAppleStandHour: Pointer;
function HKCategoryTypeIdentifierCervicalMucusQuality: Pointer;
function HKCategoryTypeIdentifierOvulationTestResult: Pointer;
function HKCategoryTypeIdentifierPregnancyTestResult: Pointer;
function HKCategoryTypeIdentifierProgesteroneTestResult: Pointer;
function HKCategoryTypeIdentifierMenstrualFlow: Pointer;
function HKCategoryTypeIdentifierIntermenstrualBleeding: Pointer;
function HKCategoryTypeIdentifierPersistentIntermenstrualBleeding: Pointer;
function HKCategoryTypeIdentifierProlongedMenstrualPeriods: Pointer;
function HKCategoryTypeIdentifierIrregularMenstrualCycles: Pointer;
function HKCategoryTypeIdentifierInfrequentMenstrualCycles: Pointer;
function HKCategoryTypeIdentifierSexualActivity: Pointer;
function HKCategoryTypeIdentifierMindfulSession: Pointer;
function HKCategoryTypeIdentifierHighHeartRateEvent: Pointer;
function HKCategoryTypeIdentifierLowHeartRateEvent: Pointer;
function HKCategoryTypeIdentifierIrregularHeartRhythmEvent: Pointer;
function HKCategoryTypeIdentifierAudioExposureEvent: Pointer;
function HKCategoryTypeIdentifierToothbrushingEvent: Pointer;
function HKCategoryTypeIdentifierPregnancy: Pointer;
function HKCategoryTypeIdentifierLactation: Pointer;
function HKCategoryTypeIdentifierContraceptive: Pointer;
function HKCategoryTypeIdentifierEnvironmentalAudioExposureEvent: Pointer;
function HKCategoryTypeIdentifierHeadphoneAudioExposureEvent: Pointer;
function HKCategoryTypeIdentifierHandwashingEvent: Pointer;
function HKCategoryTypeIdentifierLowCardioFitnessEvent: Pointer;
function HKCategoryTypeIdentifierAppleWalkingSteadinessEvent: Pointer;
function HKCategoryTypeIdentifierAbdominalCramps: Pointer;
function HKCategoryTypeIdentifierAcne: Pointer;
function HKCategoryTypeIdentifierAppetiteChanges: Pointer;
function HKCategoryTypeIdentifierBladderIncontinence: Pointer;
function HKCategoryTypeIdentifierBloating: Pointer;
function HKCategoryTypeIdentifierBreastPain: Pointer;
function HKCategoryTypeIdentifierChestTightnessOrPain: Pointer;
function HKCategoryTypeIdentifierChills: Pointer;
function HKCategoryTypeIdentifierConstipation: Pointer;
function HKCategoryTypeIdentifierCoughing: Pointer;
function HKCategoryTypeIdentifierDiarrhea: Pointer;
function HKCategoryTypeIdentifierDizziness: Pointer;
function HKCategoryTypeIdentifierDrySkin: Pointer;
function HKCategoryTypeIdentifierFainting: Pointer;
function HKCategoryTypeIdentifierFatigue: Pointer;
function HKCategoryTypeIdentifierFever: Pointer;
function HKCategoryTypeIdentifierGeneralizedBodyAche: Pointer;
function HKCategoryTypeIdentifierHairLoss: Pointer;
function HKCategoryTypeIdentifierHeadache: Pointer;
function HKCategoryTypeIdentifierHeartburn: Pointer;
function HKCategoryTypeIdentifierHotFlashes: Pointer;
function HKCategoryTypeIdentifierLossOfSmell: Pointer;
function HKCategoryTypeIdentifierLossOfTaste: Pointer;
function HKCategoryTypeIdentifierLowerBackPain: Pointer;
function HKCategoryTypeIdentifierMemoryLapse: Pointer;
function HKCategoryTypeIdentifierMoodChanges: Pointer;
function HKCategoryTypeIdentifierNausea: Pointer;
function HKCategoryTypeIdentifierNightSweats: Pointer;
function HKCategoryTypeIdentifierPelvicPain: Pointer;
function HKCategoryTypeIdentifierRapidPoundingOrFlutteringHeartbeat: Pointer;
function HKCategoryTypeIdentifierRunnyNose: Pointer;
function HKCategoryTypeIdentifierShortnessOfBreath: Pointer;
function HKCategoryTypeIdentifierSinusCongestion: Pointer;
function HKCategoryTypeIdentifierSkippedHeartbeat: Pointer;
function HKCategoryTypeIdentifierSleepChanges: Pointer;
function HKCategoryTypeIdentifierSoreThroat: Pointer;
function HKCategoryTypeIdentifierVaginalDryness: Pointer;
function HKCategoryTypeIdentifierVomiting: Pointer;
function HKCategoryTypeIdentifierWheezing: Pointer;
function HKCharacteristicTypeIdentifierBiologicalSex: Pointer;
function HKCharacteristicTypeIdentifierBloodType: Pointer;
function HKCharacteristicTypeIdentifierDateOfBirth: Pointer;
function HKCharacteristicTypeIdentifierFitzpatrickSkinType: Pointer;
function HKCharacteristicTypeIdentifierWheelchairUse: Pointer;
function HKCharacteristicTypeIdentifierActivityMoveMode: Pointer;
function HKCorrelationTypeIdentifierBloodPressure: Pointer;
function HKCorrelationTypeIdentifierFood: Pointer;
function HKDocumentTypeIdentifierCDA: Pointer;
function HKWorkoutTypeIdentifier: NSString;
function HKWorkoutRouteTypeIdentifier: NSString;
function HKDataTypeIdentifierHeartbeatSeries: NSString;
function HKVisionPrescriptionTypeIdentifier: NSString;
function HKPredicateKeyPathCDATitle: NSString;
function HKPredicateKeyPathCDAPatientName: NSString;
function HKPredicateKeyPathCDAAuthorName: NSString;
function HKPredicateKeyPathCDACustodianName: NSString;
function HKDetailedCDAValidationErrorKey: NSString;
function HKPredicateKeyPathCategoryValue: NSString;
function HKPredicateKeyPathClinicalRecordFHIRResourceIdentifier: NSString;
function HKPredicateKeyPathClinicalRecordFHIRResourceType: NSString;
function HKClinicalTypeIdentifierAllergyRecord: Pointer;
function HKClinicalTypeIdentifierClinicalNoteRecord: Pointer;
function HKClinicalTypeIdentifierConditionRecord: Pointer;
function HKClinicalTypeIdentifierImmunizationRecord: Pointer;
function HKClinicalTypeIdentifierLabResultRecord: Pointer;
function HKClinicalTypeIdentifierMedicationRecord: Pointer;
function HKClinicalTypeIdentifierProcedureRecord: Pointer;
function HKClinicalTypeIdentifierVitalSignRecord: Pointer;
function HKClinicalTypeIdentifierCoverageRecord: Pointer;
function HKPredicateKeyPathQuantity: NSString;
function HKPredicateKeyPathCount: NSString;
function HKPredicateKeyPathSum: NSString;
function HKDevicePropertyKeyName: NSString;
function HKDevicePropertyKeyManufacturer: NSString;
function HKDevicePropertyKeyModel: NSString;
function HKDevicePropertyKeyHardwareVersion: NSString;
function HKDevicePropertyKeyFirmwareVersion: NSString;
function HKDevicePropertyKeySoftwareVersion: NSString;
function HKDevicePropertyKeyLocalIdentifier: NSString;
function HKDevicePropertyKeyUDIDeviceIdentifier: NSString;
function HKPredicateKeyPathMin: NSString;
function HKPredicateKeyPathAverage: NSString;
function HKPredicateKeyPathMax: NSString;
function HKPredicateKeyPathMostRecent: NSString;
function HKPredicateKeyPathMostRecentStartDate: NSString;
function HKPredicateKeyPathMostRecentEndDate: NSString;
function HKPredicateKeyPathMostRecentDuration: NSString;
function HKFHIRReleaseDSTU2: Pointer;
function HKFHIRReleaseR4: Pointer;
function HKFHIRReleaseUnknown: Pointer;
function HKUserPreferencesDidChangeNotification: NSString;
function HKMetadataKeyDeviceSerialNumber: NSString;
function HKMetadataKeyBodyTemperatureSensorLocation: NSString;
function HKMetadataKeyHeartRateSensorLocation: NSString;
function HKMetadataKeyHeartRateMotionContext: NSString;
function HKMetadataKeyUserMotionContext: NSString;
function HKMetadataKeySessionEstimate: NSString;
function HKMetadataKeyHeartRateRecoveryTestType: NSString;
function HKMetadataKeyHeartRateRecoveryActivityType: NSString;
function HKMetadataKeyHeartRateRecoveryActivityDuration: NSString;
function HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate: NSString;
function HKMetadataKeyFoodType: NSString;
function HKMetadataKeyUDIDeviceIdentifier: NSString;
function HKMetadataKeyUDIProductionIdentifier: NSString;
function HKMetadataKeyDigitalSignature: NSString;
function HKMetadataKeyExternalUUID: NSString;
function HKMetadataKeySyncIdentifier: NSString;
function HKMetadataKeySyncVersion: NSString;
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
function HKMetadataKeyWeatherCondition: NSString;
function HKMetadataKeyWeatherTemperature: NSString;
function HKMetadataKeyWeatherHumidity: NSString;
function HKMetadataKeySexualActivityProtectionUsed: NSString;
function HKMetadataKeyMenstrualCycleStart: NSString;
function HKMetadataKeyLapLength: NSString;
function HKMetadataKeySwimmingLocationType: NSString;
function HKMetadataKeySwimmingStrokeStyle: NSString;
function HKMetadataKeyInsulinDeliveryReason: NSString;
function HKMetadataKeyBloodGlucoseMealTime: NSString;
function HKMetadataKeyVO2MaxTestType: NSString;
function HKMetadataKeyAverageSpeed: NSString;
function HKMetadataKeyMaximumSpeed: NSString;
function HKMetadataKeyAlpineSlopeGrade: NSString;
function HKMetadataKeyElevationAscended: NSString;
function HKMetadataKeyElevationDescended: NSString;
function HKMetadataKeyFitnessMachineDuration: NSString;
function HKMetadataKeyIndoorBikeDistance: NSString;
function HKMetadataKeyCrossTrainerDistance: NSString;
function HKMetadataKeyHeartRateEventThreshold: NSString;
function HKMetadataKeyAverageMETs: NSString;
function HKMetadataKeyAudioExposureLevel: NSString;
function HKMetadataKeyAudioExposureDuration: NSString;
function HKMetadataKeyAppleECGAlgorithmVersion: NSString;
function HKMetadataKeyDevicePlacementSide: NSString;
function HKMetadataKeyBarometricPressure: NSString;
function HKMetadataKeyAppleDeviceCalibrated: NSString;
function HKMetadataKeyVO2MaxValue: NSString;
function HKMetadataKeyLowCardioFitnessEventThreshold: NSString;
function HKMetadataKeyDateOfEarliestDataUsedForEstimate: NSString;
function HKMetadataKeyAlgorithmVersion: NSString;
function HKMetadataKeySWOLFScore: NSString;
function HKMetadataKeyQuantityClampedToLowerBound: NSString;
function HKMetadataKeyQuantityClampedToUpperBound: NSString;
function HKMetadataKeyGlassesPrescriptionDescription: NSString;
function HKMetadataKeyHeadphoneGain: NSString;
function HKSourceRevisionAnyVersion: NSString;
function HKSourceRevisionAnyProductType: NSString;
function HKSourceRevisionAnyOperatingSystem: Pointer;
function HKVerifiableClinicalRecordSourceTypeSMARTHealthCard: Pointer;
function HKVerifiableClinicalRecordSourceTypeEUDigitalCOVIDCertificate: Pointer;
function HKVerifiableClinicalRecordCredentialTypeCOVID19: Pointer;
function HKVerifiableClinicalRecordCredentialTypeImmunization: Pointer;
function HKVerifiableClinicalRecordCredentialTypeLaboratory: Pointer;
function HKVerifiableClinicalRecordCredentialTypeRecovery: Pointer;
function HKPredicateKeyPathWorkoutActivityType: NSString;
function HKPredicateKeyPathWorkoutActivityDuration: NSString;
function HKPredicateKeyPathWorkoutActivityStartDate: NSString;
function HKPredicateKeyPathWorkoutActivityEndDate: NSString;
function HKPredicateKeyPathWorkoutActivitySumQuantity: NSString;
function HKPredicateKeyPathWorkoutActivityMinimumQuantity: NSString;
function HKPredicateKeyPathWorkoutActivityMaximumQuantity: NSString;
function HKPredicateKeyPathWorkoutActivityAverageQuantity: NSString;


// ===== External functions =====

const
  libHealthKit = '/System/Library/Frameworks/HealthKit.framework/HealthKit';
function HKCategoryValueSleepAnalysisAsleepValues: Pointer { NSSet }; cdecl;
  external libHealthKit name _PU + 'HKCategoryValueSleepAnalysisAsleepValues';
function HKAppleWalkingSteadinessClassificationForQuantity
  (value: Pointer { HKQuantity };
  classificationOut: PHKAppleWalkingSteadinessClassification;
  errorOut: Pointer { NSError } ): Boolean; cdecl;
  external libHealthKit name _PU +
  'HKAppleWalkingSteadinessClassificationForQuantity';
function HKAppleWalkingSteadinessMinimumQuantityForClassification
  (classification: HKAppleWalkingSteadinessClassification)
  : Pointer { HKQuantity }; cdecl;
  external libHealthKit name _PU +
  'HKAppleWalkingSteadinessMinimumQuantityForClassification';
function HKAppleWalkingSteadinessMaximumQuantityForClassification
  (classification: HKAppleWalkingSteadinessClassification)
  : Pointer { HKQuantity }; cdecl;
  external libHealthKit name _PU +
  'HKAppleWalkingSteadinessMaximumQuantityForClassification';

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

function HKPredicateKeyPathAverageHeartRate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathAverageHeartRate');
end;

function HKPredicateKeyPathECGClassification: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathECGClassification');
end;

function HKPredicateKeyPathECGSymptomsStatus: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathECGSymptomsStatus');
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

function HKPredicateKeyPathWorkoutTotalSwimmingStrokeCount: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutTotalSwimmingStrokeCount');
end;

function HKPredicateKeyPathWorkoutTotalFlightsClimbed: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutTotalFlightsClimbed');
end;

function HKPredicateKeyPathWorkoutSumQuantity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutSumQuantity');
end;

function HKPredicateKeyPathWorkoutMinimumQuantity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutMinimumQuantity');
end;

function HKPredicateKeyPathWorkoutMaximumQuantity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutMaximumQuantity');
end;

function HKPredicateKeyPathWorkoutAverageQuantity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutAverageQuantity');
end;

function HKPredicateKeyPathWorkoutActivity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutActivity');
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

function HKWorkoutSortIdentifierTotalSwimmingStrokeCount: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKWorkoutSortIdentifierTotalSwimmingStrokeCount');
end;

function HKWorkoutSortIdentifierTotalFlightsClimbed: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKWorkoutSortIdentifierTotalFlightsClimbed');
end;

function HKWorkoutTypeIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKWorkoutTypeIdentifier');
end;

function HKWorkoutRouteTypeIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKWorkoutRouteTypeIdentifier');
end;

function HKDataTypeIdentifierHeartbeatSeries: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKDataTypeIdentifierHeartbeatSeries');
end;

function HKVisionPrescriptionTypeIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKVisionPrescriptionTypeIdentifier');
end;

function HKPredicateKeyPathCDATitle: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathCDATitle');
end;

function HKPredicateKeyPathCDAPatientName: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathCDAPatientName');
end;

function HKPredicateKeyPathCDAAuthorName: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathCDAAuthorName');
end;

function HKPredicateKeyPathCDACustodianName: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathCDACustodianName');
end;

function HKDetailedCDAValidationErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKDetailedCDAValidationErrorKey');
end;

function HKPredicateKeyPathCategoryValue: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathCategoryValue');
end;

function HKPredicateKeyPathClinicalRecordFHIRResourceIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathClinicalRecordFHIRResourceIdentifier');
end;

function HKPredicateKeyPathClinicalRecordFHIRResourceType: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathClinicalRecordFHIRResourceType');
end;

function HKPredicateKeyPathQuantity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathQuantity');
end;

function HKPredicateKeyPathCount: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathCount');
end;

function HKPredicateKeyPathSum: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathSum');
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

function HKPredicateKeyPathMin: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathMin');
end;

function HKPredicateKeyPathAverage: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathAverage');
end;

function HKPredicateKeyPathMax: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathMax');
end;

function HKPredicateKeyPathMostRecent: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKPredicateKeyPathMostRecent');
end;

function HKPredicateKeyPathMostRecentStartDate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathMostRecentStartDate');
end;

function HKPredicateKeyPathMostRecentEndDate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathMostRecentEndDate');
end;

function HKPredicateKeyPathMostRecentDuration: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathMostRecentDuration');
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

function HKMetadataKeyHeartRateMotionContext: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyHeartRateMotionContext');
end;

function HKMetadataKeyUserMotionContext: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyUserMotionContext');
end;

function HKMetadataKeySessionEstimate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeySessionEstimate');
end;

function HKMetadataKeyHeartRateRecoveryTestType: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyHeartRateRecoveryTestType');
end;

function HKMetadataKeyHeartRateRecoveryActivityType: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyHeartRateRecoveryActivityType');
end;

function HKMetadataKeyHeartRateRecoveryActivityDuration: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyHeartRateRecoveryActivityDuration');
end;

function HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate');
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

function HKMetadataKeySyncIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeySyncIdentifier');
end;

function HKMetadataKeySyncVersion: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeySyncVersion');
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

function HKMetadataKeyWeatherCondition: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyWeatherCondition');
end;

function HKMetadataKeyWeatherTemperature: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyWeatherTemperature');
end;

function HKMetadataKeyWeatherHumidity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyWeatherHumidity');
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

function HKMetadataKeyLapLength: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyLapLength');
end;

function HKMetadataKeySwimmingLocationType: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeySwimmingLocationType');
end;

function HKMetadataKeySwimmingStrokeStyle: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeySwimmingStrokeStyle');
end;

function HKMetadataKeyInsulinDeliveryReason: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyInsulinDeliveryReason');
end;

function HKMetadataKeyBloodGlucoseMealTime: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyBloodGlucoseMealTime');
end;

function HKMetadataKeyVO2MaxTestType: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyVO2MaxTestType');
end;

function HKMetadataKeyAverageSpeed: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyAverageSpeed');
end;

function HKMetadataKeyMaximumSpeed: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyMaximumSpeed');
end;

function HKMetadataKeyAlpineSlopeGrade: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyAlpineSlopeGrade');
end;

function HKMetadataKeyElevationAscended: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyElevationAscended');
end;

function HKMetadataKeyElevationDescended: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyElevationDescended');
end;

function HKMetadataKeyFitnessMachineDuration: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyFitnessMachineDuration');
end;

function HKMetadataKeyIndoorBikeDistance: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyIndoorBikeDistance');
end;

function HKMetadataKeyCrossTrainerDistance: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyCrossTrainerDistance');
end;

function HKMetadataKeyHeartRateEventThreshold: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyHeartRateEventThreshold');
end;

function HKMetadataKeyAverageMETs: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyAverageMETs');
end;

function HKMetadataKeyAudioExposureLevel: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyAudioExposureLevel');
end;

function HKMetadataKeyAudioExposureDuration: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyAudioExposureDuration');
end;

function HKMetadataKeyAppleECGAlgorithmVersion: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyAppleECGAlgorithmVersion');
end;

function HKMetadataKeyDevicePlacementSide: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyDevicePlacementSide');
end;

function HKMetadataKeyBarometricPressure: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyBarometricPressure');
end;

function HKMetadataKeyAppleDeviceCalibrated: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyAppleDeviceCalibrated');
end;

function HKMetadataKeyVO2MaxValue: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyVO2MaxValue');
end;

function HKMetadataKeyLowCardioFitnessEventThreshold: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyLowCardioFitnessEventThreshold');
end;

function HKMetadataKeyDateOfEarliestDataUsedForEstimate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyDateOfEarliestDataUsedForEstimate');
end;

function HKMetadataKeyAlgorithmVersion: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyAlgorithmVersion');
end;

function HKMetadataKeySWOLFScore: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeySWOLFScore');
end;

function HKMetadataKeyQuantityClampedToLowerBound: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyQuantityClampedToLowerBound');
end;

function HKMetadataKeyQuantityClampedToUpperBound: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyQuantityClampedToUpperBound');
end;

function HKMetadataKeyGlassesPrescriptionDescription: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKMetadataKeyGlassesPrescriptionDescription');
end;

function HKMetadataKeyHeadphoneGain: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKMetadataKeyHeadphoneGain');
end;

function HKSourceRevisionAnyVersion: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKSourceRevisionAnyVersion');
end;

function HKSourceRevisionAnyProductType: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit, 'HKSourceRevisionAnyProductType');
end;

function HKPredicateKeyPathWorkoutActivityType: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutActivityType');
end;

function HKPredicateKeyPathWorkoutActivityDuration: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutActivityDuration');
end;

function HKPredicateKeyPathWorkoutActivityStartDate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutActivityStartDate');
end;

function HKPredicateKeyPathWorkoutActivityEndDate: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutActivityEndDate');
end;

function HKPredicateKeyPathWorkoutActivitySumQuantity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutActivitySumQuantity');
end;

function HKPredicateKeyPathWorkoutActivityMinimumQuantity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutActivityMinimumQuantity');
end;

function HKPredicateKeyPathWorkoutActivityMaximumQuantity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutActivityMaximumQuantity');
end;

function HKPredicateKeyPathWorkoutActivityAverageQuantity: NSString;
begin
  Result := CocoaNSStringConst(libHealthKit,
    'HKPredicateKeyPathWorkoutActivityAverageQuantity');
end;

function HKFHIRResourceTypeAllergyIntolerance: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKFHIRResourceTypeAllergyIntolerance');
end;

function HKFHIRResourceTypeCondition: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKFHIRResourceTypeCondition');
end;

function HKFHIRResourceTypeCoverage: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKFHIRResourceTypeCoverage');
end;

function HKFHIRResourceTypeDiagnosticReport: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKFHIRResourceTypeDiagnosticReport');
end;

function HKFHIRResourceTypeDocumentReference: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKFHIRResourceTypeDocumentReference');
end;

function HKFHIRResourceTypeImmunization: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKFHIRResourceTypeImmunization');
end;

function HKFHIRResourceTypeMedicationDispense: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKFHIRResourceTypeMedicationDispense');
end;

function HKFHIRResourceTypeMedicationOrder: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKFHIRResourceTypeMedicationOrder');
end;

function HKFHIRResourceTypeMedicationRequest: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKFHIRResourceTypeMedicationRequest');
end;

function HKFHIRResourceTypeMedicationStatement: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKFHIRResourceTypeMedicationStatement');
end;

function HKFHIRResourceTypeObservation: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKFHIRResourceTypeObservation');
end;

function HKFHIRResourceTypeProcedure: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKFHIRResourceTypeProcedure');
end;

function HKQuantityTypeIdentifierBodyMassIndex: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierBodyMassIndex');
end;

function HKQuantityTypeIdentifierBodyFatPercentage: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierBodyFatPercentage');
end;

function HKQuantityTypeIdentifierHeight: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKQuantityTypeIdentifierHeight');
end;

function HKQuantityTypeIdentifierBodyMass: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKQuantityTypeIdentifierBodyMass');
end;

function HKQuantityTypeIdentifierLeanBodyMass: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierLeanBodyMass');
end;

function HKQuantityTypeIdentifierWaistCircumference: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierWaistCircumference');
end;

function HKQuantityTypeIdentifierAppleSleepingWristTemperature: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierAppleSleepingWristTemperature');
end;

function HKQuantityTypeIdentifierStepCount: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierStepCount');
end;

function HKQuantityTypeIdentifierDistanceWalkingRunning: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDistanceWalkingRunning');
end;

function HKQuantityTypeIdentifierDistanceCycling: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDistanceCycling');
end;

function HKQuantityTypeIdentifierDistanceWheelchair: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDistanceWheelchair');
end;

function HKQuantityTypeIdentifierBasalEnergyBurned: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierBasalEnergyBurned');
end;

function HKQuantityTypeIdentifierActiveEnergyBurned: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierActiveEnergyBurned');
end;

function HKQuantityTypeIdentifierFlightsClimbed: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierFlightsClimbed');
end;

function HKQuantityTypeIdentifierNikeFuel: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKQuantityTypeIdentifierNikeFuel');
end;

function HKQuantityTypeIdentifierAppleExerciseTime: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierAppleExerciseTime');
end;

function HKQuantityTypeIdentifierPushCount: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierPushCount');
end;

function HKQuantityTypeIdentifierDistanceSwimming: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDistanceSwimming');
end;

function HKQuantityTypeIdentifierSwimmingStrokeCount: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierSwimmingStrokeCount');
end;

function HKQuantityTypeIdentifierVO2Max: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKQuantityTypeIdentifierVO2Max');
end;

function HKQuantityTypeIdentifierDistanceDownhillSnowSports: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDistanceDownhillSnowSports');
end;

function HKQuantityTypeIdentifierAppleStandTime: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierAppleStandTime');
end;

function HKQuantityTypeIdentifierWalkingSpeed: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierWalkingSpeed');
end;

function HKQuantityTypeIdentifierWalkingDoubleSupportPercentage: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierWalkingDoubleSupportPercentage');
end;

function HKQuantityTypeIdentifierWalkingAsymmetryPercentage: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierWalkingAsymmetryPercentage');
end;

function HKQuantityTypeIdentifierWalkingStepLength: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierWalkingStepLength');
end;

function HKQuantityTypeIdentifierSixMinuteWalkTestDistance: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierSixMinuteWalkTestDistance');
end;

function HKQuantityTypeIdentifierStairAscentSpeed: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierStairAscentSpeed');
end;

function HKQuantityTypeIdentifierStairDescentSpeed: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierStairDescentSpeed');
end;

function HKQuantityTypeIdentifierAppleMoveTime: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierAppleMoveTime');
end;

function HKQuantityTypeIdentifierAppleWalkingSteadiness: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierAppleWalkingSteadiness');
end;

function HKQuantityTypeIdentifierRunningStrideLength: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierRunningStrideLength');
end;

function HKQuantityTypeIdentifierRunningVerticalOscillation: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierRunningVerticalOscillation');
end;

function HKQuantityTypeIdentifierRunningGroundContactTime: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierRunningGroundContactTime');
end;

function HKQuantityTypeIdentifierRunningPower: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierRunningPower');
end;

function HKQuantityTypeIdentifierRunningSpeed: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierRunningSpeed');
end;

function HKQuantityTypeIdentifierHeartRate: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierHeartRate');
end;

function HKQuantityTypeIdentifierBodyTemperature: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierBodyTemperature');
end;

function HKQuantityTypeIdentifierBasalBodyTemperature: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierBasalBodyTemperature');
end;

function HKQuantityTypeIdentifierBloodPressureSystolic: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierBloodPressureSystolic');
end;

function HKQuantityTypeIdentifierBloodPressureDiastolic: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierBloodPressureDiastolic');
end;

function HKQuantityTypeIdentifierRespiratoryRate: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierRespiratoryRate');
end;

function HKQuantityTypeIdentifierRestingHeartRate: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierRestingHeartRate');
end;

function HKQuantityTypeIdentifierWalkingHeartRateAverage: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierWalkingHeartRateAverage');
end;

function HKQuantityTypeIdentifierHeartRateVariabilitySDNN: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierHeartRateVariabilitySDNN');
end;

function HKQuantityTypeIdentifierHeartRateRecoveryOneMinute: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierHeartRateRecoveryOneMinute');
end;

function HKQuantityTypeIdentifierOxygenSaturation: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierOxygenSaturation');
end;

function HKQuantityTypeIdentifierPeripheralPerfusionIndex: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierPeripheralPerfusionIndex');
end;

function HKQuantityTypeIdentifierBloodGlucose: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierBloodGlucose');
end;

function HKQuantityTypeIdentifierNumberOfTimesFallen: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierNumberOfTimesFallen');
end;

function HKQuantityTypeIdentifierElectrodermalActivity: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierElectrodermalActivity');
end;

function HKQuantityTypeIdentifierInhalerUsage: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierInhalerUsage');
end;

function HKQuantityTypeIdentifierInsulinDelivery: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierInsulinDelivery');
end;

function HKQuantityTypeIdentifierBloodAlcoholContent: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierBloodAlcoholContent');
end;

function HKQuantityTypeIdentifierForcedVitalCapacity: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierForcedVitalCapacity');
end;

function HKQuantityTypeIdentifierForcedExpiratoryVolume1: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierForcedExpiratoryVolume1');
end;

function HKQuantityTypeIdentifierPeakExpiratoryFlowRate: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierPeakExpiratoryFlowRate');
end;

function HKQuantityTypeIdentifierEnvironmentalAudioExposure: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierEnvironmentalAudioExposure');
end;

function HKQuantityTypeIdentifierHeadphoneAudioExposure: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierHeadphoneAudioExposure');
end;

function HKQuantityTypeIdentifierNumberOfAlcoholicBeverages: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierNumberOfAlcoholicBeverages');
end;

function HKQuantityTypeIdentifierDietaryFatTotal: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryFatTotal');
end;

function HKQuantityTypeIdentifierDietaryFatPolyunsaturated: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryFatPolyunsaturated');
end;

function HKQuantityTypeIdentifierDietaryFatMonounsaturated: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryFatMonounsaturated');
end;

function HKQuantityTypeIdentifierDietaryFatSaturated: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryFatSaturated');
end;

function HKQuantityTypeIdentifierDietaryCholesterol: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryCholesterol');
end;

function HKQuantityTypeIdentifierDietarySodium: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietarySodium');
end;

function HKQuantityTypeIdentifierDietaryCarbohydrates: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryCarbohydrates');
end;

function HKQuantityTypeIdentifierDietaryFiber: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryFiber');
end;

function HKQuantityTypeIdentifierDietarySugar: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietarySugar');
end;

function HKQuantityTypeIdentifierDietaryEnergyConsumed: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryEnergyConsumed');
end;

function HKQuantityTypeIdentifierDietaryProtein: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryProtein');
end;

function HKQuantityTypeIdentifierDietaryVitaminA: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminA');
end;

function HKQuantityTypeIdentifierDietaryVitaminB6: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminB6');
end;

function HKQuantityTypeIdentifierDietaryVitaminB12: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminB12');
end;

function HKQuantityTypeIdentifierDietaryVitaminC: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminC');
end;

function HKQuantityTypeIdentifierDietaryVitaminD: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminD');
end;

function HKQuantityTypeIdentifierDietaryVitaminE: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminE');
end;

function HKQuantityTypeIdentifierDietaryVitaminK: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryVitaminK');
end;

function HKQuantityTypeIdentifierDietaryCalcium: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryCalcium');
end;

function HKQuantityTypeIdentifierDietaryIron: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryIron');
end;

function HKQuantityTypeIdentifierDietaryThiamin: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryThiamin');
end;

function HKQuantityTypeIdentifierDietaryRiboflavin: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryRiboflavin');
end;

function HKQuantityTypeIdentifierDietaryNiacin: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryNiacin');
end;

function HKQuantityTypeIdentifierDietaryFolate: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryFolate');
end;

function HKQuantityTypeIdentifierDietaryBiotin: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryBiotin');
end;

function HKQuantityTypeIdentifierDietaryPantothenicAcid: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryPantothenicAcid');
end;

function HKQuantityTypeIdentifierDietaryPhosphorus: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryPhosphorus');
end;

function HKQuantityTypeIdentifierDietaryIodine: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryIodine');
end;

function HKQuantityTypeIdentifierDietaryMagnesium: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryMagnesium');
end;

function HKQuantityTypeIdentifierDietaryZinc: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryZinc');
end;

function HKQuantityTypeIdentifierDietarySelenium: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietarySelenium');
end;

function HKQuantityTypeIdentifierDietaryCopper: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryCopper');
end;

function HKQuantityTypeIdentifierDietaryManganese: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryManganese');
end;

function HKQuantityTypeIdentifierDietaryChromium: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryChromium');
end;

function HKQuantityTypeIdentifierDietaryMolybdenum: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryMolybdenum');
end;

function HKQuantityTypeIdentifierDietaryChloride: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryChloride');
end;

function HKQuantityTypeIdentifierDietaryPotassium: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryPotassium');
end;

function HKQuantityTypeIdentifierDietaryCaffeine: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryCaffeine');
end;

function HKQuantityTypeIdentifierDietaryWater: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierDietaryWater');
end;

function HKQuantityTypeIdentifierUVExposure: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierUVExposure');
end;

function HKQuantityTypeIdentifierAtrialFibrillationBurden: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierAtrialFibrillationBurden');
end;

function HKQuantityTypeIdentifierUnderwaterDepth: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierUnderwaterDepth');
end;

function HKQuantityTypeIdentifierWaterTemperature: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKQuantityTypeIdentifierWaterTemperature');
end;

function HKCategoryTypeIdentifierSleepAnalysis: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierSleepAnalysis');
end;

function HKCategoryTypeIdentifierAppleStandHour: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierAppleStandHour');
end;

function HKCategoryTypeIdentifierCervicalMucusQuality: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierCervicalMucusQuality');
end;

function HKCategoryTypeIdentifierOvulationTestResult: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierOvulationTestResult');
end;

function HKCategoryTypeIdentifierPregnancyTestResult: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierPregnancyTestResult');
end;

function HKCategoryTypeIdentifierProgesteroneTestResult: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierProgesteroneTestResult');
end;

function HKCategoryTypeIdentifierMenstrualFlow: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierMenstrualFlow');
end;

function HKCategoryTypeIdentifierIntermenstrualBleeding: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierIntermenstrualBleeding');
end;

function HKCategoryTypeIdentifierPersistentIntermenstrualBleeding: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierPersistentIntermenstrualBleeding');
end;

function HKCategoryTypeIdentifierProlongedMenstrualPeriods: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierProlongedMenstrualPeriods');
end;

function HKCategoryTypeIdentifierIrregularMenstrualCycles: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierIrregularMenstrualCycles');
end;

function HKCategoryTypeIdentifierInfrequentMenstrualCycles: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierInfrequentMenstrualCycles');
end;

function HKCategoryTypeIdentifierSexualActivity: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierSexualActivity');
end;

function HKCategoryTypeIdentifierMindfulSession: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierMindfulSession');
end;

function HKCategoryTypeIdentifierHighHeartRateEvent: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierHighHeartRateEvent');
end;

function HKCategoryTypeIdentifierLowHeartRateEvent: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierLowHeartRateEvent');
end;

function HKCategoryTypeIdentifierIrregularHeartRhythmEvent: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierIrregularHeartRhythmEvent');
end;

function HKCategoryTypeIdentifierAudioExposureEvent: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierAudioExposureEvent');
end;

function HKCategoryTypeIdentifierToothbrushingEvent: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierToothbrushingEvent');
end;

function HKCategoryTypeIdentifierPregnancy: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierPregnancy');
end;

function HKCategoryTypeIdentifierLactation: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierLactation');
end;

function HKCategoryTypeIdentifierContraceptive: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierContraceptive');
end;

function HKCategoryTypeIdentifierEnvironmentalAudioExposureEvent: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierEnvironmentalAudioExposureEvent');
end;

function HKCategoryTypeIdentifierHeadphoneAudioExposureEvent: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierHeadphoneAudioExposureEvent');
end;

function HKCategoryTypeIdentifierHandwashingEvent: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierHandwashingEvent');
end;

function HKCategoryTypeIdentifierLowCardioFitnessEvent: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierLowCardioFitnessEvent');
end;

function HKCategoryTypeIdentifierAppleWalkingSteadinessEvent: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierAppleWalkingSteadinessEvent');
end;

function HKCategoryTypeIdentifierAbdominalCramps: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierAbdominalCramps');
end;

function HKCategoryTypeIdentifierAcne: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierAcne');
end;

function HKCategoryTypeIdentifierAppetiteChanges: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierAppetiteChanges');
end;

function HKCategoryTypeIdentifierBladderIncontinence: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierBladderIncontinence');
end;

function HKCategoryTypeIdentifierBloating: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierBloating');
end;

function HKCategoryTypeIdentifierBreastPain: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierBreastPain');
end;

function HKCategoryTypeIdentifierChestTightnessOrPain: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierChestTightnessOrPain');
end;

function HKCategoryTypeIdentifierChills: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierChills');
end;

function HKCategoryTypeIdentifierConstipation: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierConstipation');
end;

function HKCategoryTypeIdentifierCoughing: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierCoughing');
end;

function HKCategoryTypeIdentifierDiarrhea: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierDiarrhea');
end;

function HKCategoryTypeIdentifierDizziness: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierDizziness');
end;

function HKCategoryTypeIdentifierDrySkin: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierDrySkin');
end;

function HKCategoryTypeIdentifierFainting: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierFainting');
end;

function HKCategoryTypeIdentifierFatigue: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierFatigue');
end;

function HKCategoryTypeIdentifierFever: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierFever');
end;

function HKCategoryTypeIdentifierGeneralizedBodyAche: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierGeneralizedBodyAche');
end;

function HKCategoryTypeIdentifierHairLoss: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierHairLoss');
end;

function HKCategoryTypeIdentifierHeadache: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierHeadache');
end;

function HKCategoryTypeIdentifierHeartburn: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierHeartburn');
end;

function HKCategoryTypeIdentifierHotFlashes: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierHotFlashes');
end;

function HKCategoryTypeIdentifierLossOfSmell: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierLossOfSmell');
end;

function HKCategoryTypeIdentifierLossOfTaste: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierLossOfTaste');
end;

function HKCategoryTypeIdentifierLowerBackPain: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierLowerBackPain');
end;

function HKCategoryTypeIdentifierMemoryLapse: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierMemoryLapse');
end;

function HKCategoryTypeIdentifierMoodChanges: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierMoodChanges');
end;

function HKCategoryTypeIdentifierNausea: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierNausea');
end;

function HKCategoryTypeIdentifierNightSweats: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierNightSweats');
end;

function HKCategoryTypeIdentifierPelvicPain: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierPelvicPain');
end;

function HKCategoryTypeIdentifierRapidPoundingOrFlutteringHeartbeat: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierRapidPoundingOrFlutteringHeartbeat');
end;

function HKCategoryTypeIdentifierRunnyNose: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierRunnyNose');
end;

function HKCategoryTypeIdentifierShortnessOfBreath: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierShortnessOfBreath');
end;

function HKCategoryTypeIdentifierSinusCongestion: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierSinusCongestion');
end;

function HKCategoryTypeIdentifierSkippedHeartbeat: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierSkippedHeartbeat');
end;

function HKCategoryTypeIdentifierSleepChanges: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierSleepChanges');
end;

function HKCategoryTypeIdentifierSoreThroat: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierSoreThroat');
end;

function HKCategoryTypeIdentifierVaginalDryness: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCategoryTypeIdentifierVaginalDryness');
end;

function HKCategoryTypeIdentifierVomiting: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierVomiting');
end;

function HKCategoryTypeIdentifierWheezing: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCategoryTypeIdentifierWheezing');
end;

function HKCharacteristicTypeIdentifierBiologicalSex: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCharacteristicTypeIdentifierBiologicalSex');
end;

function HKCharacteristicTypeIdentifierBloodType: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCharacteristicTypeIdentifierBloodType');
end;

function HKCharacteristicTypeIdentifierDateOfBirth: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCharacteristicTypeIdentifierDateOfBirth');
end;

function HKCharacteristicTypeIdentifierFitzpatrickSkinType: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCharacteristicTypeIdentifierFitzpatrickSkinType');
end;

function HKCharacteristicTypeIdentifierWheelchairUse: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCharacteristicTypeIdentifierWheelchairUse');
end;

function HKCharacteristicTypeIdentifierActivityMoveMode: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCharacteristicTypeIdentifierActivityMoveMode');
end;

function HKCorrelationTypeIdentifierBloodPressure: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKCorrelationTypeIdentifierBloodPressure');
end;

function HKCorrelationTypeIdentifierFood: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKCorrelationTypeIdentifierFood');
end;

function HKDocumentTypeIdentifierCDA: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKDocumentTypeIdentifierCDA');
end;

function HKClinicalTypeIdentifierAllergyRecord: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKClinicalTypeIdentifierAllergyRecord');
end;

function HKClinicalTypeIdentifierClinicalNoteRecord: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKClinicalTypeIdentifierClinicalNoteRecord');
end;

function HKClinicalTypeIdentifierConditionRecord: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKClinicalTypeIdentifierConditionRecord');
end;

function HKClinicalTypeIdentifierImmunizationRecord: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKClinicalTypeIdentifierImmunizationRecord');
end;

function HKClinicalTypeIdentifierLabResultRecord: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKClinicalTypeIdentifierLabResultRecord');
end;

function HKClinicalTypeIdentifierMedicationRecord: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKClinicalTypeIdentifierMedicationRecord');
end;

function HKClinicalTypeIdentifierProcedureRecord: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKClinicalTypeIdentifierProcedureRecord');
end;

function HKClinicalTypeIdentifierVitalSignRecord: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKClinicalTypeIdentifierVitalSignRecord');
end;

function HKClinicalTypeIdentifierCoverageRecord: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKClinicalTypeIdentifierCoverageRecord');
end;

function HKFHIRReleaseDSTU2: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKFHIRReleaseDSTU2');
end;

function HKFHIRReleaseR4: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKFHIRReleaseR4');
end;

function HKFHIRReleaseUnknown: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit, 'HKFHIRReleaseUnknown');
end;

function HKSourceRevisionAnyOperatingSystem: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKSourceRevisionAnyOperatingSystem');
end;

function HKVerifiableClinicalRecordSourceTypeSMARTHealthCard: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKVerifiableClinicalRecordSourceTypeSMARTHealthCard');
end;

function HKVerifiableClinicalRecordSourceTypeEUDigitalCOVIDCertificate: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKVerifiableClinicalRecordSourceTypeEUDigitalCOVIDCertificate');
end;

function HKVerifiableClinicalRecordCredentialTypeCOVID19: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKVerifiableClinicalRecordCredentialTypeCOVID19');
end;

function HKVerifiableClinicalRecordCredentialTypeImmunization: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKVerifiableClinicalRecordCredentialTypeImmunization');
end;

function HKVerifiableClinicalRecordCredentialTypeLaboratory: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKVerifiableClinicalRecordCredentialTypeLaboratory');
end;

function HKVerifiableClinicalRecordCredentialTypeRecovery: Pointer;
begin
  Result := CocoaPointerConst(libHealthKit,
    'HKVerifiableClinicalRecordCredentialTypeRecovery');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

HealthKitModule := dlopen(MarshaledAString(libHealthKit), RTLD_LAZY);

finalization

dlclose(HealthKitModule);
{$ENDIF IOS}

end.
