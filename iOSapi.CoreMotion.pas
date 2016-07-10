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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

const
  CMAttitudeReferenceFrameXArbitraryZVertical = 1 shl 0;
  CMAttitudeReferenceFrameXArbitraryCorrectedZVertical = 1 shl 1;
  CMAttitudeReferenceFrameXMagneticNorthZVertical = 1 shl 2;
  CMAttitudeReferenceFrameXTrueNorthZVertical = 1 shl 3;
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
  CMMotionActivityConfidenceLow = 0;
  CMMotionActivityConfidenceMedium = 1;
  CMMotionActivityConfidenceHigh = 2;

type

  // ===== Forward declarations =====
{$M+}
  CMLogItem = interface;
  CMAccelerometerData = interface;
  CMAltitudeData = interface;
  CMAltimeter = interface;
  CMAttitude = interface;
  CMGyroData = interface;
  CMMagnetometerData = interface;
  CMDeviceMotion = interface;
  CMMotionActivity = interface;
  CMMotionActivityManager = interface;
  CMMotionManager = interface;
  CMPedometerData = interface;
  CMPedometer = interface;
  CMRecordedAccelerometerData = interface;
  CMSensorDataList = interface;
  CMSensorRecorder = interface;
  CMStepCounter = interface;

  // ===== Framework typedefs =====
{$M+}
  NSTimeInterval = Double;

  CMAcceleration = record
    x: Double;
    y: Double;
    z: Double;
  end;

  PCMAcceleration = ^CMAcceleration;

  CMAltitudeHandler = procedure(param1: CMAltitudeData; param2: NSError)
    of object;

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

  CMMagneticFieldCalibrationAccuracy = Integer;

  CMCalibratedMagneticField = record
    field: CMMagneticField;
    accuracy: CMMagneticFieldCalibrationAccuracy;
  end;

  PCMCalibratedMagneticField = ^CMCalibratedMagneticField;

  CMError = Cardinal;
  NSInteger = Integer;
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
  CMPedometerHandler = procedure(param1: CMPedometerData; param2: NSError)
    of object;
  CMStepQueryHandler = procedure(param1: NSInteger; param2: NSError) of object;
  CMStepUpdateHandler = procedure(param1: NSInteger; param2: NSDate;
    param3: NSError) of object;
  // ===== Interface declarations =====

  CMLogItemClass = interface(NSObjectClass)
    ['{AE95BAE0-3036-46CE-AC7F-C7F3EA877F93}']
  end;

  CMLogItem = interface(NSObject)
    ['{D2537F9D-2D7F-4B01-A8AA-E43753EFFE0D}']
    function timestamp: NSTimeInterval; cdecl;
  end;

  TCMLogItem = class(TOCGenericImport<CMLogItemClass, CMLogItem>)
  end;

  PCMLogItem = Pointer;

  CMAccelerometerDataClass = interface(CMLogItemClass)
    ['{46EE7D0E-87D3-46F0-9389-9E2C01CC59BE}']
  end;

  CMAccelerometerData = interface(CMLogItem)
    ['{CE10C05C-6CC2-4720-B274-ED37EDBD3CA3}']
    function acceleration: CMAcceleration; cdecl;
  end;

  TCMAccelerometerData = class(TOCGenericImport<CMAccelerometerDataClass,
    CMAccelerometerData>)
  end;

  PCMAccelerometerData = Pointer;

  CMAltitudeDataClass = interface(CMLogItemClass)
    ['{91EF7421-2B3C-4FB7-ACA7-271841B92580}']
  end;

  CMAltitudeData = interface(CMLogItem)
    ['{AB2860BB-3575-4053-93FE-FED7D3849A7A}']
    function relativeAltitude: NSNumber; cdecl;
    function pressure: NSNumber; cdecl;
  end;

  TCMAltitudeData = class(TOCGenericImport<CMAltitudeDataClass, CMAltitudeData>)
  end;

  PCMAltitudeData = Pointer;

  CMAltimeterClass = interface(NSObjectClass)
    ['{5D5748D7-8524-4786-B2B2-3A37AEB46EED}']
    { class } function isRelativeAltitudeAvailable: Boolean; cdecl;
  end;

  CMAltimeter = interface(NSObject)
    ['{616843DD-D938-4317-B1D4-C62F87C4C82A}']
    procedure startRelativeAltitudeUpdatesToQueue(queue: NSOperationQueue;
      withHandler: CMAltitudeHandler); cdecl;
    procedure stopRelativeAltitudeUpdates; cdecl;
  end;

  TCMAltimeter = class(TOCGenericImport<CMAltimeterClass, CMAltimeter>)
  end;

  PCMAltimeter = Pointer;

  CMAttitudeClass = interface(NSObjectClass)
    ['{448257F2-C832-42BF-957F-1C5038E249B0}']
  end;

  CMAttitude = interface(NSObject)
    ['{62F3CFBB-AFD3-459A-9A5E-C531ECC4A141}']
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
    ['{69C31AC4-083F-44AA-8BBF-B6125D04B1A6}']
  end;

  CMGyroData = interface(CMLogItem)
    ['{A0AE25F3-F66D-48DC-A547-B7637E4BCE96}']
    function rotationRate: CMRotationRate; cdecl;
  end;

  TCMGyroData = class(TOCGenericImport<CMGyroDataClass, CMGyroData>)
  end;

  PCMGyroData = Pointer;

  CMMagnetometerDataClass = interface(CMLogItemClass)
    ['{E009EA11-4172-405F-970A-FD551D1723C3}']
  end;

  CMMagnetometerData = interface(CMLogItem)
    ['{3F2B57D2-7B72-4701-B547-4F3D0CE2F630}']
    function magneticField: CMMagneticField; cdecl;
  end;

  TCMMagnetometerData = class(TOCGenericImport<CMMagnetometerDataClass,
    CMMagnetometerData>)
  end;

  PCMMagnetometerData = Pointer;

  CMDeviceMotionClass = interface(CMLogItemClass)
    ['{A8564AC8-DB3B-46FE-AB10-4DF1982CDE23}']
  end;

  CMDeviceMotion = interface(CMLogItem)
    ['{D03FF1FE-2D5D-4633-AA55-C9107ACAB3A1}']
    function attitude: CMAttitude; cdecl;
    function rotationRate: CMRotationRate; cdecl;
    function gravity: CMAcceleration; cdecl;
    function userAcceleration: CMAcceleration; cdecl;
    function magneticField: CMCalibratedMagneticField; cdecl;
  end;

  TCMDeviceMotion = class(TOCGenericImport<CMDeviceMotionClass, CMDeviceMotion>)
  end;

  PCMDeviceMotion = Pointer;

  CMMotionActivityClass = interface(CMLogItemClass)
    ['{0071D0BF-79AC-4A24-96DF-257E915587D1}']
  end;

  CMMotionActivity = interface(CMLogItem)
    ['{D3CFB112-FB99-4192-B1AD-F390E0323C48}']
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
    ['{324F3395-A46A-4F22-A686-CD3B17E8A2D5}']
    { class } function isActivityAvailable: Boolean; cdecl;
  end;

  CMMotionActivityManager = interface(NSObject)
    ['{C9F06F10-42F3-49C0-A2A6-F626449DB0BA}']
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
    ['{F1F3366B-1918-45A7-8A1B-101C789F64C4}']
    { class } function availableAttitudeReferenceFrames
      : CMAttitudeReferenceFrame; cdecl;
  end;

  CMMotionManager = interface(NSObject)
    ['{B022AED6-DAD6-492F-9640-D1D45321E82B}']
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

  CMPedometerDataClass = interface(NSObjectClass)
    ['{228FB7AB-1668-4368-B538-FE7C3ECFF937}']
  end;

  CMPedometerData = interface(NSObject)
    ['{E456329B-8E66-4933-939B-795FEF8037CA}']
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function numberOfSteps: NSNumber; cdecl;
    function distance: NSNumber; cdecl;
    function floorsAscended: NSNumber; cdecl;
    function floorsDescended: NSNumber; cdecl;
    function currentPace: NSNumber; cdecl;
    function currentCadence: NSNumber; cdecl;
  end;

  TCMPedometerData = class(TOCGenericImport<CMPedometerDataClass,
    CMPedometerData>)
  end;

  PCMPedometerData = Pointer;

  CMPedometerClass = interface(NSObjectClass)
    ['{590B3A47-9567-4DCE-9976-C210CC6B8F66}']
    { class } function isStepCountingAvailable: Boolean; cdecl;
    { class } function isDistanceAvailable: Boolean; cdecl;
    { class } function isFloorCountingAvailable: Boolean; cdecl;
    { class } function isPaceAvailable: Boolean; cdecl;
    { class } function isCadenceAvailable: Boolean; cdecl;
  end;

  CMPedometer = interface(NSObject)
    ['{C24C2501-D804-4614-8726-9A92B2C06C18}']
    procedure queryPedometerDataFromDate(start: NSDate; toDate: NSDate;
      withHandler: CMPedometerHandler); cdecl;
    procedure startPedometerUpdatesFromDate(start: NSDate;
      withHandler: CMPedometerHandler); cdecl;
    procedure stopPedometerUpdates; cdecl;
  end;

  TCMPedometer = class(TOCGenericImport<CMPedometerClass, CMPedometer>)
  end;

  PCMPedometer = Pointer;

  CMRecordedAccelerometerDataClass = interface(CMAccelerometerDataClass)
    ['{CEE7047B-0E31-4D45-A9E1-AF10851B28F7}']
  end;

  CMRecordedAccelerometerData = interface(CMAccelerometerData)
    ['{BE992F0D-C471-4247-B411-BA47728F3A10}']
    function identifier: UInt64; cdecl;
    function startDate: NSDate; cdecl;
  end;

  TCMRecordedAccelerometerData = class
    (TOCGenericImport<CMRecordedAccelerometerDataClass,
    CMRecordedAccelerometerData>)
  end;

  PCMRecordedAccelerometerData = Pointer;

  CMSensorDataListClass = interface(NSObjectClass)
    ['{2E67E8CF-80F7-4757-9AEF-0E55F4776203}']
  end;

  CMSensorDataList = interface(NSObject)
    ['{7EE55C97-718E-4B55-8E5A-1E0C29B2CDD8}']
  end;

  TCMSensorDataList = class(TOCGenericImport<CMSensorDataListClass,
    CMSensorDataList>)
  end;

  PCMSensorDataList = Pointer;

  CMSensorRecorderClass = interface(NSObjectClass)
    ['{BB69B305-9DFD-4230-969E-BE82B4FE3891}']
    { class } function isAccelerometerRecordingAvailable: Boolean; cdecl;
    { class } function isAuthorizedForRecording: Boolean; cdecl;
  end;

  CMSensorRecorder = interface(NSObject)
    ['{8383FF69-2896-47CB-B65A-C6778E8AB595}']
    function accelerometerDataFromDate(fromDate: NSDate; toDate: NSDate)
      : CMSensorDataList; cdecl;
    procedure recordAccelerometerForDuration(duration: NSTimeInterval); cdecl;
  end;

  TCMSensorRecorder = class(TOCGenericImport<CMSensorRecorderClass,
    CMSensorRecorder>)
  end;

  PCMSensorRecorder = Pointer;

  CMStepCounterClass = interface(NSObjectClass)
    ['{B6F66C8A-CBA7-4337-9252-0FFAFAE4F4AD}']
    { class } function isStepCountingAvailable: Boolean; cdecl;
  end;

  CMStepCounter = interface(NSObject)
    ['{7232840F-1269-459C-9836-29D23B0AD7C8}']
    procedure queryStepCountStartingFrom(start: NSDate; &to: NSDate;
      toQueue: NSOperationQueue; withHandler: CMStepQueryHandler); cdecl;
    procedure startStepCountingUpdatesToQueue(queue: NSOperationQueue;
      updateOn: NSInteger; withHandler: CMStepUpdateHandler); cdecl;
    procedure stopStepCountingUpdates; cdecl;
  end;

  TCMStepCounter = class(TOCGenericImport<CMStepCounterClass, CMStepCounter>)
  end;

  PCMStepCounter = Pointer;

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
