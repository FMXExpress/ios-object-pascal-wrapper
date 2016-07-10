{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreLocation
//

unit iOSapi.CoreLocation;

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
  CLRegionStateUnknown = 0;
  CLRegionStateInside = 1;
  CLRegionStateOutside = 2;
  CLProximityUnknown = 0;
  CLProximityImmediate = 1;
  CLProximityNear = 2;
  CLProximityFar = 3;
  kCLErrorLocationUnknown = 0;
  kCLErrorDenied = 1;
  kCLErrorNetwork = 2;
  kCLErrorHeadingFailure = 3;
  kCLErrorRegionMonitoringDenied = 4;
  kCLErrorRegionMonitoringFailure = 5;
  kCLErrorRegionMonitoringSetupDelayed = 6;
  kCLErrorRegionMonitoringResponseDelayed = 7;
  kCLErrorGeocodeFoundNoResult = 8;
  kCLErrorGeocodeFoundPartialResult = 9;
  kCLErrorGeocodeCanceled = 10;
  kCLErrorDeferredFailed = 11;
  kCLErrorDeferredNotUpdatingLocation = 12;
  kCLErrorDeferredAccuracyTooLow = 13;
  kCLErrorDeferredDistanceFiltered = 14;
  kCLErrorDeferredCanceled = 15;
  kCLErrorRangingUnavailable = 16;
  kCLErrorRangingFailure = 17;
  CLDeviceOrientationUnknown = 0;
  CLDeviceOrientationPortrait = 1;
  CLDeviceOrientationPortraitUpsideDown = 2;
  CLDeviceOrientationLandscapeLeft = 3;
  CLDeviceOrientationLandscapeRight = 4;
  CLDeviceOrientationFaceUp = 5;
  CLDeviceOrientationFaceDown = 6;
  kCLAuthorizationStatusNotDetermined = 0;
  kCLAuthorizationStatusRestricted = 1;
  kCLAuthorizationStatusDenied = 2;
  kCLAuthorizationStatusAuthorizedAlways = 3;
  kCLAuthorizationStatusAuthorizedWhenInUse = 4;
  kCLAuthorizationStatusAuthorized = kCLAuthorizationStatusAuthorizedAlways;
  CLActivityTypeOther = 1;
  CLActivityTypeAutomotiveNavigation = 2;
  CLActivityTypeFitness = 3;
  CLActivityTypeOtherNavigation = 4;

type

  // ===== Forward declarations =====
{$M+}
  CLFloor = interface;
  CLLocation = interface;
  CLRegion = interface;
  CLBeaconRegion = interface;
  CLBeacon = interface;
  CLCircularRegion = interface;
  CLPlacemark = interface;
  CLGeocoder = interface;
  CLHeading = interface;
  CLLocationManagerDelegate = interface;
  CLLocationManager = interface;
  CLVisit = interface;

  // ===== Framework typedefs =====
{$M+}
  CLLocationDegrees = Double;
  PCLLocationDegrees = ^CLLocationDegrees;

  CLLocationAccuracy = Double;
  PCLLocationAccuracy = ^CLLocationAccuracy;

  CLLocationSpeed = Double;
  PCLLocationSpeed = ^CLLocationSpeed;

  CLLocationDirection = Double;
  PCLLocationDirection = ^CLLocationDirection;

  CLLocationCoordinate2D = record
    latitude: CLLocationDegrees;
    longitude: CLLocationDegrees;
  end;

  PCLLocationCoordinate2D = ^CLLocationCoordinate2D;

  CLLocationDistance = Double;
  PCLLocationDistance = ^CLLocationDistance;

  NSTimeInterval = Double;
  NSInteger = Integer;
  CLRegionState = NSInteger;
  CLProximity = NSInteger;
  CLBeaconMajorValue = Word;
  CLBeaconMinorValue = Word;
  CLError = NSInteger;
  CLGeocodeCompletionHandler = procedure(param1: NSArray; param2: NSError)
    of object;
  CLHeadingComponentValue = Double;
  PCLHeadingComponentValue = ^CLHeadingComponentValue;

  CLDeviceOrientation = Integer;
  CLAuthorizationStatus = Integer;
  CLActivityType = NSInteger;
  // ===== Interface declarations =====

  CLFloorClass = interface(NSObjectClass)
    ['{325E45C9-9F92-4CA9-BF9B-522F8A0B5436}']
  end;

  CLFloor = interface(NSObject)
    ['{31F4C8CB-A79A-4D17-80E8-EA5E1EEA770F}']
    function level: NSInteger; cdecl;
  end;

  TCLFloor = class(TOCGenericImport<CLFloorClass, CLFloor>)
  end;

  PCLFloor = Pointer;

  CLLocationClass = interface(NSObjectClass)
    ['{1B93D3FE-342B-4DB1-85DF-8C4D54B1DCB1}']
  end;

  CLLocation = interface(NSObject)
    ['{F72A79EE-0064-41E1-8FC9-5CC58B4144E0}']
    function initWithLatitude(latitude: CLLocationDegrees;
      longitude: CLLocationDegrees): Pointer { instancetype }; cdecl;
    [MethodName
      ('initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:')
      ]
    function initWithCoordinateAltitudeHorizontalAccuracyVerticalAccuracyTimestamp
      (coordinate: CLLocationCoordinate2D; altitude: CLLocationDistance;
      horizontalAccuracy: CLLocationAccuracy;
      verticalAccuracy: CLLocationAccuracy; timestamp: NSDate)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:')
      ]
    function initWithCoordinateAltitudeHorizontalAccuracyVerticalAccuracyCourseSpeedTimestamp
      (coordinate: CLLocationCoordinate2D; altitude: CLLocationDistance;
      horizontalAccuracy: CLLocationAccuracy;
      verticalAccuracy: CLLocationAccuracy; course: CLLocationDirection;
      speed: CLLocationSpeed; timestamp: NSDate)
      : Pointer { instancetype }; cdecl;
    function coordinate: CLLocationCoordinate2D; cdecl;
    function altitude: CLLocationDistance; cdecl;
    function horizontalAccuracy: CLLocationAccuracy; cdecl;
    function verticalAccuracy: CLLocationAccuracy; cdecl;
    function course: CLLocationDirection; cdecl;
    function speed: CLLocationSpeed; cdecl;
    function timestamp: NSDate; cdecl;
    function floor: CLFloor; cdecl;
    function description: NSString; cdecl;
    function getDistanceFrom(location: CLLocation): CLLocationDistance; cdecl;
    function distanceFromLocation(location: CLLocation)
      : CLLocationDistance; cdecl;
  end;

  TCLLocation = class(TOCGenericImport<CLLocationClass, CLLocation>)
  end;

  PCLLocation = Pointer;

  CLRegionClass = interface(NSObjectClass)
    ['{3F96AF71-22A7-4AB7-8F50-56A45744BADF}']
  end;

  CLRegion = interface(NSObject)
    ['{E03857C0-EB15-4282-8251-8FD0FE5C573F}']
    function initCircularRegionWithCenter(center: CLLocationCoordinate2D;
      radius: CLLocationDistance; identifier: NSString)
      : Pointer { instancetype }; cdecl;
    function center: CLLocationCoordinate2D; cdecl;
    function radius: CLLocationDistance; cdecl;
    function identifier: NSString; cdecl;
    procedure setNotifyOnEntry(notifyOnEntry: Boolean); cdecl;
    function notifyOnEntry: Boolean; cdecl;
    procedure setNotifyOnExit(notifyOnExit: Boolean); cdecl;
    function notifyOnExit: Boolean; cdecl;
    function containsCoordinate(coordinate: CLLocationCoordinate2D)
      : Boolean; cdecl;
  end;

  TCLRegion = class(TOCGenericImport<CLRegionClass, CLRegion>)
  end;

  PCLRegion = Pointer;

  CLBeaconRegionClass = interface(CLRegionClass)
    ['{4E05E6DF-883B-49F1-AB98-8D27BA3ADA94}']
  end;

  CLBeaconRegion = interface(CLRegion)
    ['{91D6B60D-981B-4F98-A5FF-298E9FC0EF32}']
    [MethodName('initWithProximityUUID:identifier:')]
    function initWithProximityUUIDIdentifier(proximityUUID: NSUUID;
      identifier: NSString): Pointer { instancetype }; cdecl;
    [MethodName('initWithProximityUUID:major:identifier:')]
    function initWithProximityUUIDMajorIdentifier(proximityUUID: NSUUID;
      major: CLBeaconMajorValue; identifier: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithProximityUUID:major:minor:identifier:')]
    function initWithProximityUUIDMajorMinorIdentifier(proximityUUID: NSUUID;
      major: CLBeaconMajorValue; minor: CLBeaconMinorValue;
      identifier: NSString): Pointer { instancetype }; cdecl;
    function peripheralDataWithMeasuredPower(measuredPower: NSNumber)
      : NSMutableDictionary; cdecl;
    function proximityUUID: NSUUID; cdecl;
    function major: NSNumber; cdecl;
    function minor: NSNumber; cdecl;
    procedure setNotifyEntryStateOnDisplay(notifyEntryStateOnDisplay
      : Boolean); cdecl;
    function notifyEntryStateOnDisplay: Boolean; cdecl;
  end;

  TCLBeaconRegion = class(TOCGenericImport<CLBeaconRegionClass, CLBeaconRegion>)
  end;

  PCLBeaconRegion = Pointer;

  CLBeaconClass = interface(NSObjectClass)
    ['{1E6F0058-0F67-4CB2-8B49-6815B2AF7E4A}']
  end;

  CLBeacon = interface(NSObject)
    ['{9D4F2514-C5E6-4C6C-A798-C62EC7D647C7}']
    function proximityUUID: NSUUID; cdecl;
    function major: NSNumber; cdecl;
    function minor: NSNumber; cdecl;
    function proximity: CLProximity; cdecl;
    function accuracy: CLLocationAccuracy; cdecl;
    function rssi: NSInteger; cdecl;
  end;

  TCLBeacon = class(TOCGenericImport<CLBeaconClass, CLBeacon>)
  end;

  PCLBeacon = Pointer;

  CLCircularRegionClass = interface(CLRegionClass)
    ['{FB44C801-C618-46AC-B8C9-D61E4933E810}']
  end;

  CLCircularRegion = interface(CLRegion)
    ['{92EB5D5D-9E5E-4DBD-9602-34725D5B5136}']
    function initWithCenter(center: CLLocationCoordinate2D;
      radius: CLLocationDistance; identifier: NSString)
      : Pointer { instancetype }; cdecl;
    function center: CLLocationCoordinate2D; cdecl;
    function radius: CLLocationDistance; cdecl;
    function containsCoordinate(coordinate: CLLocationCoordinate2D)
      : Boolean; cdecl;
  end;

  TCLCircularRegion = class(TOCGenericImport<CLCircularRegionClass,
    CLCircularRegion>)
  end;

  PCLCircularRegion = Pointer;

  CLPlacemarkClass = interface(NSObjectClass)
    ['{7E9C7C0C-E9E4-4614-A4E0-33CBA68525E0}']
  end;

  CLPlacemark = interface(NSObject)
    ['{873118C9-C8C5-48CC-84EE-88F50A73D2E4}']
    function initWithPlacemark(placemark: CLPlacemark)
      : Pointer { instancetype }; cdecl;
    function location: CLLocation; cdecl;
    function region: CLRegion; cdecl;
    function timeZone: NSTimeZone; cdecl;
    function addressDictionary: NSDictionary; cdecl;
    function name: NSString; cdecl;
    function thoroughfare: NSString; cdecl;
    function subThoroughfare: NSString; cdecl;
    function locality: NSString; cdecl;
    function subLocality: NSString; cdecl;
    function administrativeArea: NSString; cdecl;
    function subAdministrativeArea: NSString; cdecl;
    function postalCode: NSString; cdecl;
    function ISOcountryCode: NSString; cdecl;
    function country: NSString; cdecl;
    function inlandWater: NSString; cdecl;
    function ocean: NSString; cdecl;
    function areasOfInterest: NSArray; cdecl;
  end;

  TCLPlacemark = class(TOCGenericImport<CLPlacemarkClass, CLPlacemark>)
  end;

  PCLPlacemark = Pointer;

  CLGeocoderClass = interface(NSObjectClass)
    ['{F0CF029F-5780-46C4-A061-11455F674847}']
  end;

  CLGeocoder = interface(NSObject)
    ['{FA54BD4E-2255-4968-9139-FC9D91BE3DF3}']
    function isGeocoding: Boolean; cdecl;
    procedure reverseGeocodeLocation(location: CLLocation;
      completionHandler: CLGeocodeCompletionHandler); cdecl;
    procedure geocodeAddressDictionary(addressDictionary: NSDictionary;
      completionHandler: CLGeocodeCompletionHandler); cdecl;
    [MethodName('geocodeAddressString:completionHandler:')]
    procedure geocodeAddressStringCompletionHandler(addressString: NSString;
      completionHandler: CLGeocodeCompletionHandler); cdecl;
    [MethodName('geocodeAddressString:inRegion:completionHandler:')]
    procedure geocodeAddressStringInRegionCompletionHandler
      (addressString: NSString; inRegion: CLRegion;
      completionHandler: CLGeocodeCompletionHandler); cdecl;
    procedure cancelGeocode; cdecl;
  end;

  TCLGeocoder = class(TOCGenericImport<CLGeocoderClass, CLGeocoder>)
  end;

  PCLGeocoder = Pointer;

  CLHeadingClass = interface(NSObjectClass)
    ['{964778BA-6EF5-4179-B218-8BD5DEC52D5F}']
  end;

  CLHeading = interface(NSObject)
    ['{96595843-61AD-498B-B6D2-3B4C62DB79A4}']
    function magneticHeading: CLLocationDirection; cdecl;
    function trueHeading: CLLocationDirection; cdecl;
    function headingAccuracy: CLLocationDirection; cdecl;
    function x: CLHeadingComponentValue; cdecl;
    function y: CLHeadingComponentValue; cdecl;
    function z: CLHeadingComponentValue; cdecl;
    function timestamp: NSDate; cdecl;
    function description: NSString; cdecl;
  end;

  TCLHeading = class(TOCGenericImport<CLHeadingClass, CLHeading>)
  end;

  PCLHeading = Pointer;

  CLLocationManagerClass = interface(NSObjectClass)
    ['{C17E325E-9D70-4AC8-942A-B3C497C1550D}']
    { class } function locationServicesEnabled: Boolean; cdecl;
    { class } function headingAvailable: Boolean; cdecl;
    { class } function significantLocationChangeMonitoringAvailable
      : Boolean; cdecl;
    { class } function isMonitoringAvailableForClass(regionClass: Pointer)
      : Boolean; cdecl;
    { class } function regionMonitoringAvailable: Boolean; cdecl;
    { class } function regionMonitoringEnabled: Boolean; cdecl;
    { class } function isRangingAvailable: Boolean; cdecl;
    { class } function authorizationStatus: CLAuthorizationStatus; cdecl;
    { class } function deferredLocationUpdatesAvailable: Boolean; cdecl;
  end;

  CLLocationManager = interface(NSObject)
    ['{735A945B-998B-423F-9B68-49854F4DDCEB}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function locationServicesEnabled: Boolean; cdecl;
    procedure setPurpose(purpose: NSString); cdecl;
    function purpose: NSString; cdecl;
    procedure setActivityType(activityType: CLActivityType); cdecl;
    function activityType: CLActivityType; cdecl;
    procedure setDistanceFilter(distanceFilter: CLLocationDistance); cdecl;
    function distanceFilter: CLLocationDistance; cdecl;
    procedure setDesiredAccuracy(desiredAccuracy: CLLocationAccuracy); cdecl;
    function desiredAccuracy: CLLocationAccuracy; cdecl;
    procedure setPausesLocationUpdatesAutomatically
      (pausesLocationUpdatesAutomatically: Boolean); cdecl;
    function pausesLocationUpdatesAutomatically: Boolean; cdecl;
    procedure setAllowsBackgroundLocationUpdates(allowsBackgroundLocationUpdates
      : Boolean); cdecl;
    function allowsBackgroundLocationUpdates: Boolean; cdecl;
    function location: CLLocation; cdecl;
    function headingAvailable: Boolean; cdecl;
    procedure setHeadingFilter(headingFilter: CLLocationDegrees); cdecl;
    function headingFilter: CLLocationDegrees; cdecl;
    procedure setHeadingOrientation(headingOrientation
      : CLDeviceOrientation); cdecl;
    function headingOrientation: CLDeviceOrientation; cdecl;
    function heading: CLHeading; cdecl;
    function maximumRegionMonitoringDistance: CLLocationDistance; cdecl;
    function monitoredRegions: NSSet; cdecl;
    function rangedRegions: NSSet; cdecl;
    procedure requestWhenInUseAuthorization; cdecl;
    procedure requestAlwaysAuthorization; cdecl;
    procedure startUpdatingLocation; cdecl;
    procedure stopUpdatingLocation; cdecl;
    procedure requestLocation; cdecl;
    procedure startUpdatingHeading; cdecl;
    procedure stopUpdatingHeading; cdecl;
    procedure dismissHeadingCalibrationDisplay; cdecl;
    procedure startMonitoringSignificantLocationChanges; cdecl;
    procedure stopMonitoringSignificantLocationChanges; cdecl;
    [MethodName('startMonitoringForRegion:desiredAccuracy:')]
    procedure startMonitoringForRegionDesiredAccuracy(region: CLRegion;
      desiredAccuracy: CLLocationAccuracy); cdecl;
    procedure stopMonitoringForRegion(region: CLRegion); cdecl;
    [MethodName('startMonitoringForRegion:')]
    procedure startMonitoringForRegion(region: CLRegion); cdecl;
    procedure requestStateForRegion(region: CLRegion); cdecl;
    procedure startRangingBeaconsInRegion(region: CLBeaconRegion); cdecl;
    procedure stopRangingBeaconsInRegion(region: CLBeaconRegion); cdecl;
    procedure allowDeferredLocationUpdatesUntilTraveled
      (distance: CLLocationDistance; timeout: NSTimeInterval); cdecl;
    procedure disallowDeferredLocationUpdates; cdecl;
    procedure startMonitoringVisits; cdecl;
    procedure stopMonitoringVisits; cdecl;
  end;

  TCLLocationManager = class(TOCGenericImport<CLLocationManagerClass,
    CLLocationManager>)
  end;

  PCLLocationManager = Pointer;

  CLVisitClass = interface(NSObjectClass)
    ['{69EB2E20-530B-40AA-AF6C-43D1E291991D}']
  end;

  CLVisit = interface(NSObject)
    ['{435D1833-313A-45A9-8CC3-335FA06E85F9}']
    function arrivalDate: NSDate; cdecl;
    function departureDate: NSDate; cdecl;
    function coordinate: CLLocationCoordinate2D; cdecl;
    function horizontalAccuracy: CLLocationAccuracy; cdecl;
  end;

  TCLVisit = class(TOCGenericImport<CLVisitClass, CLVisit>)
  end;

  PCLVisit = Pointer;

  // ===== Protocol declarations =====

  CLLocationManagerDelegate = interface(IObjectiveC)
    ['{D8BC433E-A8FB-4566-9216-F47D35DD5CAE}']
    [MethodName('locationManager:didUpdateToLocation:fromLocation:')]
    procedure locationManagerDidUpdateToLocationFromLocation
      (manager: CLLocationManager; didUpdateToLocation: CLLocation;
      fromLocation: CLLocation); cdecl;
    [MethodName('locationManager:didUpdateLocations:')]
    procedure locationManagerDidUpdateLocations(manager: CLLocationManager;
      didUpdateLocations: NSArray); cdecl;
    [MethodName('locationManager:didUpdateHeading:')]
    procedure locationManagerDidUpdateHeading(manager: CLLocationManager;
      didUpdateHeading: CLHeading); cdecl;
    function locationManagerShouldDisplayHeadingCalibration
      (manager: CLLocationManager): Boolean; cdecl;
    [MethodName('locationManager:didDetermineState:forRegion:')]
    procedure locationManagerDidDetermineStateForRegion
      (manager: CLLocationManager; didDetermineState: CLRegionState;
      forRegion: CLRegion); cdecl;
    [MethodName('locationManager:didRangeBeacons:inRegion:')]
    procedure locationManagerDidRangeBeaconsInRegion(manager: CLLocationManager;
      didRangeBeacons: NSArray; inRegion: CLBeaconRegion); cdecl;
    [MethodName('locationManager:rangingBeaconsDidFailForRegion:withError:')]
    procedure locationManagerRangingBeaconsDidFailForRegionWithError
      (manager: CLLocationManager;
      rangingBeaconsDidFailForRegion: CLBeaconRegion;
      withError: NSError); cdecl;
    [MethodName('locationManager:didEnterRegion:')]
    procedure locationManagerDidEnterRegion(manager: CLLocationManager;
      didEnterRegion: CLRegion); cdecl;
    [MethodName('locationManager:didExitRegion:')]
    procedure locationManagerDidExitRegion(manager: CLLocationManager;
      didExitRegion: CLRegion); cdecl;
    [MethodName('locationManager:didFailWithError:')]
    procedure locationManagerDidFailWithError(manager: CLLocationManager;
      didFailWithError: NSError); cdecl;
    [MethodName('locationManager:monitoringDidFailForRegion:withError:')]
    procedure locationManagerMonitoringDidFailForRegionWithError
      (manager: CLLocationManager; monitoringDidFailForRegion: CLRegion;
      withError: NSError); cdecl;
    [MethodName('locationManager:didChangeAuthorizationStatus:')]
    procedure locationManagerDidChangeAuthorizationStatus
      (manager: CLLocationManager;
      didChangeAuthorizationStatus: CLAuthorizationStatus); cdecl;
    [MethodName('locationManager:didStartMonitoringForRegion:')]
    procedure locationManagerDidStartMonitoringForRegion
      (manager: CLLocationManager;
      didStartMonitoringForRegion: CLRegion); cdecl;
    procedure locationManagerDidPauseLocationUpdates
      (manager: CLLocationManager); cdecl;
    procedure locationManagerDidResumeLocationUpdates
      (manager: CLLocationManager); cdecl;
    [MethodName('locationManager:didFinishDeferredUpdatesWithError:')]
    procedure locationManagerDidFinishDeferredUpdatesWithError
      (manager: CLLocationManager; didFinishDeferredUpdatesWithError
      : NSError); cdecl;
    [MethodName('locationManager:didVisit:')]
    procedure locationManagerDidVisit(manager: CLLocationManager;
      didVisit: CLVisit); cdecl;
  end;

  // ===== Exported string consts =====

function kCLDistanceFilterNone: Pointer;
function kCLLocationAccuracyBestForNavigation: Pointer;
function kCLLocationAccuracyBest: Pointer;
function kCLLocationAccuracyNearestTenMeters: Pointer;
function kCLLocationAccuracyHundredMeters: Pointer;
function kCLLocationAccuracyKilometer: Pointer;
function kCLLocationAccuracyThreeKilometers: Pointer;
function CLLocationDistanceMax: Pointer;
function CLTimeIntervalMax: Pointer;
function kCLLocationCoordinate2DInvalid: Pointer;
function kCLErrorUserInfoAlternateRegionKey: NSString;
function kCLErrorDomain: NSString;
function kCLHeadingFilterNone: Pointer;


// ===== External functions =====

const
  libCoreLocation =
    '/System/Library/Frameworks/CoreLocation.framework/CoreLocation';
function CLLocationCoordinate2DIsValid(coord: CLLocationCoordinate2D): Boolean;
  cdecl; external libCoreLocation name _PU + 'CLLocationCoordinate2DIsValid';
function CLLocationCoordinate2DMake(latitude: CLLocationDegrees;
  longitude: CLLocationDegrees): CLLocationCoordinate2D; cdecl;
  external libCoreLocation name _PU + 'CLLocationCoordinate2DMake';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreLocationModule: THandle;

{$ENDIF IOS}

function kCLErrorUserInfoAlternateRegionKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreLocation,
    'kCLErrorUserInfoAlternateRegionKey');
end;

function kCLErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libCoreLocation, 'kCLErrorDomain');
end;

function kCLDistanceFilterNone: Pointer;
begin
  Result := CocoaPointerConst(libCoreLocation, 'kCLDistanceFilterNone');
end;

function kCLLocationAccuracyBestForNavigation: Pointer;
begin
  Result := CocoaPointerConst(libCoreLocation,
    'kCLLocationAccuracyBestForNavigation');
end;

function kCLLocationAccuracyBest: Pointer;
begin
  Result := CocoaPointerConst(libCoreLocation, 'kCLLocationAccuracyBest');
end;

function kCLLocationAccuracyNearestTenMeters: Pointer;
begin
  Result := CocoaPointerConst(libCoreLocation,
    'kCLLocationAccuracyNearestTenMeters');
end;

function kCLLocationAccuracyHundredMeters: Pointer;
begin
  Result := CocoaPointerConst(libCoreLocation,
    'kCLLocationAccuracyHundredMeters');
end;

function kCLLocationAccuracyKilometer: Pointer;
begin
  Result := CocoaPointerConst(libCoreLocation, 'kCLLocationAccuracyKilometer');
end;

function kCLLocationAccuracyThreeKilometers: Pointer;
begin
  Result := CocoaPointerConst(libCoreLocation,
    'kCLLocationAccuracyThreeKilometers');
end;

function CLLocationDistanceMax: Pointer;
begin
  Result := CocoaPointerConst(libCoreLocation, 'CLLocationDistanceMax');
end;

function CLTimeIntervalMax: Pointer;
begin
  Result := CocoaPointerConst(libCoreLocation, 'CLTimeIntervalMax');
end;

function kCLLocationCoordinate2DInvalid: Pointer;
begin
  Result := CocoaPointerConst(libCoreLocation,
    'kCLLocationCoordinate2DInvalid');
end;

function kCLHeadingFilterNone: Pointer;
begin
  Result := CocoaPointerConst(libCoreLocation, 'kCLHeadingFilterNone');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreLocationModule := dlopen(MarshaledAString(libCoreLocation), RTLD_LAZY);

finalization

dlclose(CoreLocationModule);
{$ENDIF IOS}

end.
