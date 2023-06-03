{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreMotion
//

unit iOSapi.CoreMotion;

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
  CMAuthorizationStatusNotDetermined = 0;
  CMAuthorizationStatusRestricted = 1;
  CMAuthorizationStatusDenied = 2;
  CMAuthorizationStatusAuthorized = 3;
  CMAttitudeReferenceFrameXArbitraryZVertical = 1 shl 0;
  CMAttitudeReferenceFrameXArbitraryCorrectedZVertical = 1 shl 1;
  CMAttitudeReferenceFrameXMagneticNorthZVertical = 1 shl 2;
  CMAttitudeReferenceFrameXTrueNorthZVertical = 1 shl 3;
  CMDeviceMotionSensorLocationDefault = 0;
  CMDeviceMotionSensorLocationHeadphoneLeft = 1;
  CMDeviceMotionSensorLocationHeadphoneRight = 2;
  CMMagneticFieldCalibrationAccuracyUncalibrated = -1;
  CMMagneticFieldCalibrationAccuracyLow = 0;
  CMMagneticFieldCalibrationAccuracyMedium = 1;
  CMMagneticFieldCalibrationAccuracyHigh = 2;
  CMErrorNULL = 100;
  CMErrorDeviceRequiresMovement = 101;
  CMErrorTrueNorthNotAvailable = 102;
  CMErrorUnknown = 103;
  CMErrorMotionActivityNotAvailable = 104;
  CMErrorMotionActivityNotAuthorized = 105;
  CMErrorMotionActivityNotEntitled = 106;
  CMErrorInvalidParameter = 107;
  CMErrorInvalidAction = 108;
  CMErrorNotAvailable = 109;
  CMErrorNotEntitled = 110;
  CMErrorNotAuthorized = 111;
  CMErrorNilData = 112;
  CMErrorSize = 113;
  CMFallDetectionEventUserResolutionConfirmed = 0;
  CMFallDetectionEventUserResolutionDismissed = 1;
  CMFallDetectionEventUserResolutionRejected = 2;
  CMFallDetectionEventUserResolutionUnresponsive = 3;
  CMMotionActivityConfidenceLow = 0;
  CMMotionActivityConfidenceMedium = 1;
  CMMotionActivityConfidenceHigh = 2;
  CMPedometerEventTypePause = 0;
  CMPedometerEventTypeResume = 1;
  CMWaterSubmersionStateUnknown = 0;
  CMWaterSubmersionStateNotSubmerged = 1;
  CMWaterSubmersionStateSubmerged = 2;
  CMWaterSubmersionDepthStateUnknown = 0;
  CMWaterSubmersionDepthStateNotSubmerged = 100;
  CMWaterSubmersionDepthStateSubmergedShallow = 200;
  CMWaterSubmersionDepthStateSubmergedDeep = 300;
  CMWaterSubmersionDepthStateApproachingMaxDepth = 400;
  CMWaterSubmersionDepthStatePastMaxDepth = 500;
  CMWaterSubmersionDepthStateSensorDepthError = 600;

type

  // ===== Forward declarations =====
{$M+}
  CMLogItem = interface;
  CMAbsoluteAltitudeData = interface;
  CMAccelerometerData = interface;
  CMAltitudeData = interface;
  CMAltimeter = interface;
  CMAmbientPressureData = interface;
  CMAttitude = interface;
  CMGyroData = interface;
  CMMagnetometerData = interface;
  CMDeviceMotion = interface;
  CMFallDetectionEvent = interface;
  CMFallDetectionDelegate = interface;
  CMFallDetectionManager = interface;
  CMHeadphoneMotionManagerDelegate = interface;
  CMHeadphoneMotionManager = interface;
  CMMotionActivity = interface;
  CMMotionActivityManager = interface;
  CMMotionManager = interface;
  CMDyskineticSymptomResult = interface;
  CMTremorResult = interface;
  CMMovementDisorderManager = interface;
  CMPedometerData = interface;
  CMPedometerEvent = interface;
  CMPedometer = interface;
  CMRecordedAccelerometerData = interface;
  CMRecordedPressureData = interface;
  CMRotationRateData = interface;
  CMRecordedRotationRateData = interface;
  CMSensorDataList = interface;
  CMSensorRecorder = interface;
  CMStepCounter = interface;
  CMWaterSubmersionEvent = interface;
  CMWaterSubmersionMeasurement = interface;
  CMWaterTemperature = interface;
  CMWaterSubmersionManager = interface;
  CMWaterSubmersionManagerDelegate = interface;

  // ===== Framework typedefs =====
{$M+}
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  CMAcceleration = record
    x: Double;
    y: Double;
    z: Double;
  end;

  PCMAcceleration = ^CMAcceleration;

  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  CMAuthorizationStatus = NSInteger;
  CMAltitudeHandler = procedure(param1: CMAltitudeData; param2: NSError)
    of object;
  CMAbsoluteAltitudeHandler = procedure(param1: CMAbsoluteAltitudeData;
    param2: NSError) of object;

  CMRotationMatrix = record
    m11: Double;
    m12: Double;
    m13: Double;
    m21: Double;
    m22: Double;
    m23: Double;
    m31: Double;
    m32: Double;
    m33: Double;
  end;

  PCMRotationMatrix = ^CMRotationMatrix;

  CMQuaternion = record
    x: Double;
    y: Double;
    z: Double;
    w: Double;
  end;

  PCMQuaternion = ^CMQuaternion;

  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  CMAttitudeReferenceFrame = NSUInteger;

  CMRotationRate = record
    x: Double;
    y: Double;
    z: Double;
  end;

  PCMRotationRate = ^CMRotationRate;

  CMMagneticField = record
    x: Double;
    y: Double;
    z: Double;
  end;

  PCMMagneticField = ^CMMagneticField;

  CMDeviceMotionSensorLocation = NSInteger;
  CMMagneticFieldCalibrationAccuracy = Integer;

  CMCalibratedMagneticField = record
    field: CMMagneticField;
    accuracy: CMMagneticFieldCalibrationAccuracy;
  end;

  PCMCalibratedMagneticField = ^CMCalibratedMagneticField;

  CMError = Cardinal;
  CMFallDetectionEventUserResolution = NSInteger;
  TCoreMotionHandler = procedure(param1: CMAuthorizationStatus) of object;
  TCoreMotionCompletionHandler = procedure() of object;
  CMHeadphoneDeviceMotionHandler = procedure(param1: CMDeviceMotion;
    param2: NSError) of object;
  CMMotionActivityConfidence = NSInteger;
  CMMotionActivityHandler = procedure(param1: CMMotionActivity) of object;
  CMMotionActivityQueryHandler = procedure(param1: NSArray; param2: NSError)
    of object;
  CMAccelerometerHandler = procedure(param1: CMAccelerometerData;
    param2: NSError) of object;
  CMGyroHandler = procedure(param1: CMGyroData; param2: NSError) of object;
  CMDeviceMotionHandler = procedure(param1: CMDeviceMotion; param2: NSError)
    of object;
  CMMagnetometerHandler = procedure(param1: CMMagnetometerData; param2: NSError)
    of object;
  CMDyskineticSymptomResultHandler = procedure(param1: NSArray; param2: NSError)
    of object;
  CMTremorResultHandler = procedure(param1: NSArray; param2: NSError) of object;
  CMPedometerEventType = NSInteger;
  CMPedometerHandler = procedure(param1: CMPedometerData; param2: NSError)
    of object;
  CMPedometerEventHandler = procedure(param1: CMPedometerEvent; param2: NSError)
    of object;
  CMStepQueryHandler = procedure(param1: NSInteger; param2: NSError) of object;
  CMStepUpdateHandler = procedure(param1: NSInteger; param2: NSDate;
    param3: NSError) of object;
  CMWaterSubmersionState = NSInteger;
  CMWaterSubmersionDepthState = NSInteger;
  // ===== Interface declarations =====

  CMLogItemClass = interface(NSObjectClass)
    ['{C3859653-12C7-4818-BA5A-5AF0A8DC3F90}']
  end;

  CMLogItem = interface(NSObject)
    ['{9E67A874-5E0C-4387-929D-E79E098ED415}']
    function timestamp: NSTimeInterval; cdecl;
  end;

  TCMLogItem = class(TOCGenericImport<CMLogItemClass, CMLogItem>)
  end;

  PCMLogItem = Pointer;

  CMAbsoluteAltitudeDataClass = interface(CMLogItemClass)
    ['{C511A243-BEB3-4566-B0B8-B60692674D97}']
  end;

  CMAbsoluteAltitudeData = interface(CMLogItem)
    ['{079E4ADA-728A-4808-91F3-1C8ED9E4405A}']
    function altitude: Double; cdecl;
    function accuracy: Double; cdecl;
    function precision: Double; cdecl;
  end;

  TCMAbsoluteAltitudeData = class(TOCGenericImport<CMAbsoluteAltitudeDataClass,
    CMAbsoluteAltitudeData>)
  end;

  PCMAbsoluteAltitudeData = Pointer;

  CMAccelerometerDataClass = interface(CMLogItemClass)
    ['{005D3EE2-38CA-4227-8F29-9E03732DB383}']
  end;

  CMAccelerometerData = interface(CMLogItem)
    ['{D1D5708D-41FF-4556-8863-AE746951F51D}']
    function acceleration: CMAcceleration; cdecl;
  end;

  TCMAccelerometerData = class(TOCGenericImport<CMAccelerometerDataClass,
    CMAccelerometerData>)
  end;

  PCMAccelerometerData = Pointer;

  CMAltitudeDataClass = interface(CMLogItemClass)
    ['{CFE70223-032F-44DA-BACC-D4344B7F4156}']
  end;

  CMAltitudeData = interface(CMLogItem)
    ['{4144F330-DE19-4549-95B3-F4D6F405D214}']
    function relativeAltitude: NSNumber; cdecl;
    function pressure: NSNumber; cdecl;
  end;

  TCMAltitudeData = class(TOCGenericImport<CMAltitudeDataClass, CMAltitudeData>)
  end;

  PCMAltitudeData = Pointer;

  CMAltimeterClass = interface(NSObjectClass)
    ['{8B07E656-76E7-4F6D-A954-FE059922B7FF}']
    { class } function isRelativeAltitudeAvailable: Boolean; cdecl;
    { class } function authorizationStatus: CMAuthorizationStatus; cdecl;
    { class } function isAbsoluteAltitudeAvailable: Boolean; cdecl;
  end;

  CMAltimeter = interface(NSObject)
    ['{64145CBB-82F5-4D22-8569-B6411AB3985B}']
    procedure startRelativeAltitudeUpdatesToQueue(queue: NSOperationQueue;
      withHandler: CMAltitudeHandler); cdecl;
    procedure stopRelativeAltitudeUpdates; cdecl;
    procedure startAbsoluteAltitudeUpdatesToQueue(queue: NSOperationQueue;
      withHandler: CMAbsoluteAltitudeHandler); cdecl;
    procedure stopAbsoluteAltitudeUpdates; cdecl;
  end;

  TCMAltimeter = class(TOCGenericImport<CMAltimeterClass, CMAltimeter>)
  end;

  PCMAltimeter = Pointer;

  CMAmbientPressureDataClass = interface(CMLogItemClass)
    ['{F27218E9-B8A2-455F-897B-712084664B9D}']
  end;

  CMAmbientPressureData = interface(CMLogItem)
    ['{77A2C3ED-5512-4D78-B955-47D0E16B0E22}']
    function pressure: NSMeasurement; cdecl;
    function temperature: NSMeasurement; cdecl;
  end;

  TCMAmbientPressureData = class(TOCGenericImport<CMAmbientPressureDataClass,
    CMAmbientPressureData>)
  end;

  PCMAmbientPressureData = Pointer;

  CMAttitudeClass = interface(NSObjectClass)
    ['{3B4A2E84-43F9-4DFC-8950-74C7C15C23FF}']
  end;

  CMAttitude = interface(NSObject)
    ['{AC96CA50-0B55-4E75-83A4-034901E812CF}']
    function roll: Double; cdecl;
    function pitch: Double; cdecl;
    function yaw: Double; cdecl;
    function rotationMatrix: CMRotationMatrix; cdecl;
    function quaternion: CMQuaternion; cdecl;
    procedure multiplyByInverseOfAttitude(attitude: CMAttitude); cdecl;
  end;

  TCMAttitude = class(TOCGenericImport<CMAttitudeClass, CMAttitude>)
  end;

  PCMAttitude = Pointer;

  CMGyroDataClass = interface(CMLogItemClass)
    ['{2761FFBC-C9DD-458A-80CC-EE15520680B9}']
  end;

  CMGyroData = interface(CMLogItem)
    ['{BEBA6D67-C47B-49BA-B205-5E1A6A3E7216}']
    function rotationRate: CMRotationRate; cdecl;
  end;

  TCMGyroData = class(TOCGenericImport<CMGyroDataClass, CMGyroData>)
  end;

  PCMGyroData = Pointer;

  CMMagnetometerDataClass = interface(CMLogItemClass)
    ['{5CB18F4C-DF18-46B0-80FC-4E2CFB3D60B5}']
  end;

  CMMagnetometerData = interface(CMLogItem)
    ['{FADEF6A0-BBEF-4D13-AD06-0F8D38C26833}']
    function magneticField: CMMagneticField; cdecl;
  end;

  TCMMagnetometerData = class(TOCGenericImport<CMMagnetometerDataClass,
    CMMagnetometerData>)
  end;

  PCMMagnetometerData = Pointer;

  CMDeviceMotionClass = interface(CMLogItemClass)
    ['{E10ADD3E-BE9A-4C1C-9E4A-CC7AC4DBD5F2}']
  end;

  CMDeviceMotion = interface(CMLogItem)
    ['{2493F8E4-179D-4BAF-B03F-DDD05DEB7121}']
    function attitude: CMAttitude; cdecl;
    function rotationRate: CMRotationRate; cdecl;
    function gravity: CMAcceleration; cdecl;
    function userAcceleration: CMAcceleration; cdecl;
    function magneticField: CMCalibratedMagneticField; cdecl;
    function heading: Double; cdecl;
    function sensorLocation: CMDeviceMotionSensorLocation; cdecl;
  end;

  TCMDeviceMotion = class(TOCGenericImport<CMDeviceMotionClass, CMDeviceMotion>)
  end;

  PCMDeviceMotion = Pointer;

  CMFallDetectionEventClass = interface(NSObjectClass)
    ['{112F028A-CE12-4D86-BD21-75B912BA7A52}']
  end;

  CMFallDetectionEvent = interface(NSObject)
    ['{4665FEA6-C6B0-40AA-B13B-AD1153CCE236}']
    function date: NSDate; cdecl;
    function resolution: CMFallDetectionEventUserResolution; cdecl;
  end;

  TCMFallDetectionEvent = class(TOCGenericImport<CMFallDetectionEventClass,
    CMFallDetectionEvent>)
  end;

  PCMFallDetectionEvent = Pointer;

  CMFallDetectionManagerClass = interface(NSObjectClass)
    ['{49DFA810-2AE6-419C-BB94-AB21AD65F612}']
  end;

  CMFallDetectionManager = interface(NSObject)
    ['{8D580511-CE7F-431A-B9B3-528172DB8508}']
    procedure setAvailable(available: Boolean); cdecl;
    function available: Boolean; cdecl;
    function authorizationStatus: CMAuthorizationStatus; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure requestAuthorizationWithHandler
      (handler: TCoreMotionHandler); cdecl;
  end;

  TCMFallDetectionManager = class(TOCGenericImport<CMFallDetectionManagerClass,
    CMFallDetectionManager>)
  end;

  PCMFallDetectionManager = Pointer;

  CMHeadphoneMotionManagerClass = interface(NSObjectClass)
    ['{B92F8306-3DF9-47D8-9781-D5F60DAC82E2}']
    { class } function authorizationStatus: CMAuthorizationStatus; cdecl;
  end;

  CMHeadphoneMotionManager = interface(NSObject)
    ['{7003ADCF-7458-429F-892B-58D863290CDF}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function isDeviceMotionAvailable: Boolean; cdecl;
    function isDeviceMotionActive: Boolean; cdecl;
    function deviceMotion: CMDeviceMotion; cdecl;
    procedure startDeviceMotionUpdates; cdecl;
    procedure startDeviceMotionUpdatesToQueue(queue: NSOperationQueue;
      withHandler: CMHeadphoneDeviceMotionHandler); cdecl;
    procedure stopDeviceMotionUpdates; cdecl;
  end;

  TCMHeadphoneMotionManager = class
    (TOCGenericImport<CMHeadphoneMotionManagerClass, CMHeadphoneMotionManager>)
  end;

  PCMHeadphoneMotionManager = Pointer;

  CMMotionActivityClass = interface(CMLogItemClass)
    ['{76CE259D-52F3-45AC-87F3-5203B7978295}']
  end;

  CMMotionActivity = interface(CMLogItem)
    ['{4E8FE116-D731-4C9D-A453-1054E41F84C9}']
    function confidence: CMMotionActivityConfidence; cdecl;
    function startDate: NSDate; cdecl;
    function unknown: Boolean; cdecl;
    function stationary: Boolean; cdecl;
    function walking: Boolean; cdecl;
    function running: Boolean; cdecl;
    function automotive: Boolean; cdecl;
    function cycling: Boolean; cdecl;
  end;

  TCMMotionActivity = class(TOCGenericImport<CMMotionActivityClass,
    CMMotionActivity>)
  end;

  PCMMotionActivity = Pointer;

  CMMotionActivityManagerClass = interface(NSObjectClass)
    ['{12F05046-4461-435A-A110-083943CD2AD3}']
    { class } function isActivityAvailable: Boolean; cdecl;
    { class } function authorizationStatus: CMAuthorizationStatus; cdecl;
  end;

  CMMotionActivityManager = interface(NSObject)
    ['{51AD6362-1CBA-499E-BC6A-C59F26C6129D}']
    procedure queryActivityStartingFromDate(start: NSDate; toDate: NSDate;
      toQueue: NSOperationQueue;
      withHandler: CMMotionActivityQueryHandler); cdecl;
    procedure startActivityUpdatesToQueue(queue: NSOperationQueue;
      withHandler: CMMotionActivityHandler); cdecl;
    procedure stopActivityUpdates; cdecl;
  end;

  TCMMotionActivityManager = class
    (TOCGenericImport<CMMotionActivityManagerClass, CMMotionActivityManager>)
  end;

  PCMMotionActivityManager = Pointer;

  CMMotionManagerClass = interface(NSObjectClass)
    ['{B78AACC9-ECD4-4EFE-8354-DDCBFFBC8603}']
    { class } function availableAttitudeReferenceFrames
      : CMAttitudeReferenceFrame; cdecl;
  end;

  CMMotionManager = interface(NSObject)
    ['{3F262240-3596-4B26-BA7B-B38DDB633C26}']
    procedure setAccelerometerUpdateInterval(accelerometerUpdateInterval
      : NSTimeInterval); cdecl;
    function accelerometerUpdateInterval: NSTimeInterval; cdecl;
    function isAccelerometerAvailable: Boolean; cdecl;
    function isAccelerometerActive: Boolean; cdecl;
    function accelerometerData: CMAccelerometerData; cdecl;
    procedure startAccelerometerUpdates; cdecl;
    procedure startAccelerometerUpdatesToQueue(queue: NSOperationQueue;
      withHandler: CMAccelerometerHandler); cdecl;
    procedure stopAccelerometerUpdates; cdecl;
    procedure setGyroUpdateInterval(gyroUpdateInterval: NSTimeInterval); cdecl;
    function gyroUpdateInterval: NSTimeInterval; cdecl;
    function isGyroAvailable: Boolean; cdecl;
    function isGyroActive: Boolean; cdecl;
    function gyroData: CMGyroData; cdecl;
    procedure startGyroUpdates; cdecl;
    procedure startGyroUpdatesToQueue(queue: NSOperationQueue;
      withHandler: CMGyroHandler); cdecl;
    procedure stopGyroUpdates; cdecl;
    procedure setMagnetometerUpdateInterval(magnetometerUpdateInterval
      : NSTimeInterval); cdecl;
    function magnetometerUpdateInterval: NSTimeInterval; cdecl;
    function isMagnetometerAvailable: Boolean; cdecl;
    function isMagnetometerActive: Boolean; cdecl;
    function magnetometerData: CMMagnetometerData; cdecl;
    procedure startMagnetometerUpdates; cdecl;
    procedure startMagnetometerUpdatesToQueue(queue: NSOperationQueue;
      withHandler: CMMagnetometerHandler); cdecl;
    procedure stopMagnetometerUpdates; cdecl;
    procedure setDeviceMotionUpdateInterval(deviceMotionUpdateInterval
      : NSTimeInterval); cdecl;
    function deviceMotionUpdateInterval: NSTimeInterval; cdecl;
    function attitudeReferenceFrame: CMAttitudeReferenceFrame; cdecl;
    function isDeviceMotionAvailable: Boolean; cdecl;
    function isDeviceMotionActive: Boolean; cdecl;
    function deviceMotion: CMDeviceMotion; cdecl;
    procedure startDeviceMotionUpdates; cdecl;
    procedure startDeviceMotionUpdatesToQueue(queue: NSOperationQueue;
      withHandler: CMDeviceMotionHandler); cdecl;
    [MethodName('startDeviceMotionUpdatesUsingReferenceFrame:')]
    procedure startDeviceMotionUpdatesUsingReferenceFrame(referenceFrame
      : CMAttitudeReferenceFrame); cdecl;
    [MethodName
      ('startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:')]
    procedure startDeviceMotionUpdatesUsingReferenceFrameToQueueWithHandler
      (referenceFrame: CMAttitudeReferenceFrame; toQueue: NSOperationQueue;
      withHandler: CMDeviceMotionHandler); cdecl;
    procedure stopDeviceMotionUpdates; cdecl;
    procedure setShowsDeviceMovementDisplay(showsDeviceMovementDisplay
      : Boolean); cdecl;
    function showsDeviceMovementDisplay: Boolean; cdecl;
  end;

  TCMMotionManager = class(TOCGenericImport<CMMotionManagerClass,
    CMMotionManager>)
  end;

  PCMMotionManager = Pointer;

  CMDyskineticSymptomResultClass = interface(NSObjectClass)
    ['{F1C7D36C-2CF2-4FB8-B92E-B392DE39DAA2}']
  end;

  CMDyskineticSymptomResult = interface(NSObject)
    ['{E5FED6A8-9230-4B26-AC45-CE06269BC8E3}']
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function percentUnlikely: Single; cdecl;
    function percentLikely: Single; cdecl;
  end;

  TCMDyskineticSymptomResult = class
    (TOCGenericImport<CMDyskineticSymptomResultClass,
    CMDyskineticSymptomResult>)
  end;

  PCMDyskineticSymptomResult = Pointer;

  CMTremorResultClass = interface(NSObjectClass)
    ['{170FB423-0850-44D4-B574-D302AD773671}']
  end;

  CMTremorResult = interface(NSObject)
    ['{1DAFCD10-9989-4971-A513-A6EA1E056D01}']
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function percentUnknown: Single; cdecl;
    function percentNone: Single; cdecl;
    function percentSlight: Single; cdecl;
    function percentMild: Single; cdecl;
    function percentModerate: Single; cdecl;
    function percentStrong: Single; cdecl;
  end;

  TCMTremorResult = class(TOCGenericImport<CMTremorResultClass, CMTremorResult>)
  end;

  PCMTremorResult = Pointer;

  CMMovementDisorderManagerClass = interface(NSObjectClass)
    ['{4DE80380-2CEB-43B5-ADB2-8735BE1500CC}']
    { class } function isAvailable: Boolean; cdecl;
    { class } function version: NSString; cdecl;
    { class } function authorizationStatus: CMAuthorizationStatus; cdecl;
  end;

  CMMovementDisorderManager = interface(NSObject)
    ['{406485F5-BA41-449E-BBA3-40689B7B028D}']
    procedure monitorKinesiasForDuration(duration: NSTimeInterval); cdecl;
    procedure queryDyskineticSymptomFromDate(fromDate: NSDate; toDate: NSDate;
      withHandler: CMDyskineticSymptomResultHandler); cdecl;
    procedure queryTremorFromDate(fromDate: NSDate; toDate: NSDate;
      withHandler: CMTremorResultHandler); cdecl;
    function lastProcessedDate: NSDate; cdecl;
    function monitorKinesiasExpirationDate: NSDate; cdecl;
  end;

  TCMMovementDisorderManager = class
    (TOCGenericImport<CMMovementDisorderManagerClass,
    CMMovementDisorderManager>)
  end;

  PCMMovementDisorderManager = Pointer;

  CMPedometerDataClass = interface(NSObjectClass)
    ['{B5864AD2-6693-475A-BF7C-E9B61B9E70B5}']
  end;

  CMPedometerData = interface(NSObject)
    ['{B1161980-153E-43D1-B22A-0AD3AFB4BCE0}']
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function numberOfSteps: NSNumber; cdecl;
    function distance: NSNumber; cdecl;
    function floorsAscended: NSNumber; cdecl;
    function floorsDescended: NSNumber; cdecl;
    function currentPace: NSNumber; cdecl;
    function currentCadence: NSNumber; cdecl;
    function averageActivePace: NSNumber; cdecl;
  end;

  TCMPedometerData = class(TOCGenericImport<CMPedometerDataClass,
    CMPedometerData>)
  end;

  PCMPedometerData = Pointer;

  CMPedometerEventClass = interface(NSObjectClass)
    ['{2E3C1698-8B75-4920-AFFE-15DB7F398306}']
  end;

  CMPedometerEvent = interface(NSObject)
    ['{1D75C625-80E9-4D0D-8688-CD959B1663FF}']
    function date: NSDate; cdecl;
    function &type: CMPedometerEventType; cdecl;
  end;

  TCMPedometerEvent = class(TOCGenericImport<CMPedometerEventClass,
    CMPedometerEvent>)
  end;

  PCMPedometerEvent = Pointer;

  CMPedometerClass = interface(NSObjectClass)
    ['{3842844D-1FD5-4808-B6BB-5E9A307518B0}']
    { class } function isStepCountingAvailable: Boolean; cdecl;
    { class } function isDistanceAvailable: Boolean; cdecl;
    { class } function isFloorCountingAvailable: Boolean; cdecl;
    { class } function isPaceAvailable: Boolean; cdecl;
    { class } function isCadenceAvailable: Boolean; cdecl;
    { class } function isPedometerEventTrackingAvailable: Boolean; cdecl;
    { class } function authorizationStatus: CMAuthorizationStatus; cdecl;
  end;

  CMPedometer = interface(NSObject)
    ['{8833F70D-3800-49CC-8808-03892492A70E}']
    procedure queryPedometerDataFromDate(start: NSDate; toDate: NSDate;
      withHandler: CMPedometerHandler); cdecl;
    procedure startPedometerUpdatesFromDate(start: NSDate;
      withHandler: CMPedometerHandler); cdecl;
    procedure stopPedometerUpdates; cdecl;
    procedure startPedometerEventUpdatesWithHandler
      (handler: CMPedometerEventHandler); cdecl;
    procedure stopPedometerEventUpdates; cdecl;
  end;

  TCMPedometer = class(TOCGenericImport<CMPedometerClass, CMPedometer>)
  end;

  PCMPedometer = Pointer;

  CMRecordedAccelerometerDataClass = interface(CMAccelerometerDataClass)
    ['{9DC48822-988E-42C8-A77C-53876B1EDF1E}']
  end;

  CMRecordedAccelerometerData = interface(CMAccelerometerData)
    ['{CBFEB4CE-4377-4B16-871D-ABD92B75D936}']
    function identifier: UInt64; cdecl;
    function startDate: NSDate; cdecl;
  end;

  TCMRecordedAccelerometerData = class
    (TOCGenericImport<CMRecordedAccelerometerDataClass,
    CMRecordedAccelerometerData>)
  end;

  PCMRecordedAccelerometerData = Pointer;

  CMRecordedPressureDataClass = interface(CMAmbientPressureDataClass)
    ['{19E0B507-D831-49D6-8609-7BA9049E58F3}']
  end;

  CMRecordedPressureData = interface(CMAmbientPressureData)
    ['{24E5E427-F3A6-4092-81D3-28ACCC1168E7}']
    function identifier: UInt64; cdecl;
    function startDate: NSDate; cdecl;
  end;

  TCMRecordedPressureData = class(TOCGenericImport<CMRecordedPressureDataClass,
    CMRecordedPressureData>)
  end;

  PCMRecordedPressureData = Pointer;

  CMRotationRateDataClass = interface(CMLogItemClass)
    ['{1D718963-B52E-4923-A4A9-18574CE43FC0}']
  end;

  CMRotationRateData = interface(CMLogItem)
    ['{D01736BD-663C-41EC-8B58-432DEF252D94}']
    function rotationRate: CMRotationRate; cdecl;
  end;

  TCMRotationRateData = class(TOCGenericImport<CMRotationRateDataClass,
    CMRotationRateData>)
  end;

  PCMRotationRateData = Pointer;

  CMRecordedRotationRateDataClass = interface(CMRotationRateDataClass)
    ['{B9F69201-5D55-4AD3-9ECC-7045EB731DC7}']
  end;

  CMRecordedRotationRateData = interface(CMRotationRateData)
    ['{A9DE9983-59FD-4B88-AA21-2643DFD7585B}']
    function startDate: NSDate; cdecl;
  end;

  TCMRecordedRotationRateData = class
    (TOCGenericImport<CMRecordedRotationRateDataClass,
    CMRecordedRotationRateData>)
  end;

  PCMRecordedRotationRateData = Pointer;

  CMSensorDataListClass = interface(NSObjectClass)
    ['{AA86F3C7-8F74-4C35-A7E4-2D5F7769C3A4}']
  end;

  CMSensorDataList = interface(NSObject)
    ['{CA7219CA-3274-4553-8508-957F363889A9}']
  end;

  TCMSensorDataList = class(TOCGenericImport<CMSensorDataListClass,
    CMSensorDataList>)
  end;

  PCMSensorDataList = Pointer;

  CMSensorRecorderClass = interface(NSObjectClass)
    ['{1D455D32-F0B8-417E-B128-BDC8EE7978A4}']
    { class } function isAccelerometerRecordingAvailable: Boolean; cdecl;
    { class } function authorizationStatus: CMAuthorizationStatus; cdecl;
    { class } function isAuthorizedForRecording: Boolean; cdecl;
  end;

  CMSensorRecorder = interface(NSObject)
    ['{8C1C5C22-1134-420F-9BD3-CA7EBE2C18FA}']
    function accelerometerDataFromDate(fromDate: NSDate; toDate: NSDate)
      : CMSensorDataList; cdecl;
    procedure recordAccelerometerForDuration(duration: NSTimeInterval); cdecl;
  end;

  TCMSensorRecorder = class(TOCGenericImport<CMSensorRecorderClass,
    CMSensorRecorder>)
  end;

  PCMSensorRecorder = Pointer;

  CMStepCounterClass = interface(NSObjectClass)
    ['{14C45A35-FEB9-4146-83E2-3B96921D9EF0}']
    { class } function isStepCountingAvailable: Boolean; cdecl;
  end;

  CMStepCounter = interface(NSObject)
    ['{3465911A-3F3F-4520-A156-7138D6C92B86}']
    procedure queryStepCountStartingFrom(start: NSDate; &to: NSDate;
      toQueue: NSOperationQueue; withHandler: CMStepQueryHandler); cdecl;
    procedure startStepCountingUpdatesToQueue(queue: NSOperationQueue;
      updateOn: NSInteger; withHandler: CMStepUpdateHandler); cdecl;
    procedure stopStepCountingUpdates; cdecl;
  end;

  TCMStepCounter = class(TOCGenericImport<CMStepCounterClass, CMStepCounter>)
  end;

  PCMStepCounter = Pointer;

  CMWaterSubmersionEventClass = interface(NSObjectClass)
    ['{895AC697-4715-4FD3-886C-34709CCEDDD1}']
  end;

  CMWaterSubmersionEvent = interface(NSObject)
    ['{05EDD7D4-FC70-479D-ADAE-CD4EBEF88BE4}']
    function date: NSDate; cdecl;
    function state: CMWaterSubmersionState; cdecl;
  end;

  TCMWaterSubmersionEvent = class(TOCGenericImport<CMWaterSubmersionEventClass,
    CMWaterSubmersionEvent>)
  end;

  PCMWaterSubmersionEvent = Pointer;

  CMWaterSubmersionMeasurementClass = interface(NSObjectClass)
    ['{36F019B3-C1EF-4608-A6EF-E1E0BDF60A37}']
  end;

  CMWaterSubmersionMeasurement = interface(NSObject)
    ['{02DCA616-0F0A-40A3-9A3B-6AA792CC3A4C}']
    function date: NSDate; cdecl;
    function depth: NSMeasurement; cdecl;
    function pressure: NSMeasurement; cdecl;
    function surfacePressure: NSMeasurement; cdecl;
    function submersionState: CMWaterSubmersionDepthState; cdecl;
  end;

  TCMWaterSubmersionMeasurement = class
    (TOCGenericImport<CMWaterSubmersionMeasurementClass,
    CMWaterSubmersionMeasurement>)
  end;

  PCMWaterSubmersionMeasurement = Pointer;

  CMWaterTemperatureClass = interface(NSObjectClass)
    ['{6AA09E95-AE5F-4651-B090-F9A445DB622D}']
  end;

  CMWaterTemperature = interface(NSObject)
    ['{A4B43D92-C41F-4D65-A80F-8219D56F7A4C}']
    function date: NSDate; cdecl;
    function temperature: NSMeasurement; cdecl;
    function temperatureUncertainty: NSMeasurement; cdecl;
  end;

  TCMWaterTemperature = class(TOCGenericImport<CMWaterTemperatureClass,
    CMWaterTemperature>)
  end;

  PCMWaterTemperature = Pointer;

  CMWaterSubmersionManagerClass = interface(NSObjectClass)
    ['{3A8294CC-59C9-465D-B0D5-439D290F94ED}']
  end;

  CMWaterSubmersionManager = interface(NSObject)
    ['{2C8DD5B9-54A4-4B01-85F8-2D230828D83D}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setWaterSubmersionAvailable(waterSubmersionAvailable
      : Boolean); cdecl;
    function waterSubmersionAvailable: Boolean; cdecl;
    procedure setAuthorizationStatus(authorizationStatus
      : CMAuthorizationStatus); cdecl;
    function authorizationStatus: CMAuthorizationStatus; cdecl;
  end;

  TCMWaterSubmersionManager = class
    (TOCGenericImport<CMWaterSubmersionManagerClass, CMWaterSubmersionManager>)
  end;

  PCMWaterSubmersionManager = Pointer;

  // ===== Protocol declarations =====

  CMFallDetectionDelegate = interface(IObjectiveC)
    ['{18A75031-256D-4821-9F0C-C60851715C88}']
    procedure fallDetectionManager(fallDetectionManager: CMFallDetectionManager;
      didDetectEvent: CMFallDetectionEvent;
      completionHandler: TCoreMotionCompletionHandler); cdecl;
    procedure fallDetectionManagerDidChangeAuthorization(fallDetectionManager
      : CMFallDetectionManager); cdecl;
  end;

  CMHeadphoneMotionManagerDelegate = interface(IObjectiveC)
    ['{FC5477B3-3145-45AC-B4F0-CC4A290BA85F}']
    procedure headphoneMotionManagerDidConnect
      (manager: CMHeadphoneMotionManager); cdecl;
    procedure headphoneMotionManagerDidDisconnect
      (manager: CMHeadphoneMotionManager); cdecl;
  end;

  CMWaterSubmersionManagerDelegate = interface(IObjectiveC)
    ['{69544827-5CA6-4A10-9694-E2ECA34BE371}']
    [MethodName('manager:didUpdateEvent:')]
    procedure managerDidUpdateEvent(manager: CMWaterSubmersionManager;
      didUpdateEvent: CMWaterSubmersionEvent); cdecl;
    [MethodName('manager:didUpdateMeasurement:')]
    procedure managerDidUpdateMeasurement(manager: CMWaterSubmersionManager;
      didUpdateMeasurement: CMWaterSubmersionMeasurement); cdecl;
    [MethodName('manager:didUpdateTemperature:')]
    procedure managerDidUpdateTemperature(manager: CMWaterSubmersionManager;
      didUpdateTemperature: CMWaterTemperature); cdecl;
    [MethodName('manager:errorOccurred:')]
    procedure managerErrorOccurred(manager: CMWaterSubmersionManager;
      errorOccurred: NSError); cdecl;
  end;

  // ===== Exported string consts =====

function CMErrorDomain: NSString;


// ===== External functions =====

const
  libCoreMotion = '/System/Library/Frameworks/CoreMotion.framework/CoreMotion';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreMotionModule: THandle;

{$ENDIF IOS}

function CMErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libCoreMotion, 'CMErrorDomain');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreMotionModule := dlopen(MarshaledAString(libCoreMotion), RTLD_LAZY);

finalization

dlclose(CoreMotionModule);
{$ENDIF IOS}

end.
