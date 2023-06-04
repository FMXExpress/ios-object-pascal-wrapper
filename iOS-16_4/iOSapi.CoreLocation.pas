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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
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
  kCLErrorPromptDeclined = 18;
  kCLErrorHistoricalLocationError = 19;
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
  CLAccuracyAuthorizationFullAccuracy = 0;
  CLAccuracyAuthorizationReducedAccuracy = 1;
  CLActivityTypeOther = 1;
  CLActivityTypeAutomotiveNavigation = 2;
  CLActivityTypeFitness = 3;
  CLActivityTypeOtherNavigation = 4;
  CLActivityTypeAirborne = 5;
  CLLocationPushServiceErrorUnknown = 0;
  CLLocationPushServiceErrorMissingPushExtension = 1;
  CLLocationPushServiceErrorMissingPushServerEnvironment = 2;
  CLLocationPushServiceErrorMissingEntitlement = 3;
  CLLocationPushServiceErrorUnsupportedPlatform = 4;

type

  // ===== Forward declarations =====
{$M+}
  CLBeaconIdentityConstraint = interface;
  CLFloor = interface;
  CLLocationSourceInformation = interface;
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
  CLLocationPushServiceExtension = interface;

  // ===== Framework typedefs =====
{$M+}
  CLBeaconMajorValue = Word;
  PCLBeaconMajorValue = ^CLBeaconMajorValue;
  CLBeaconMinorValue = Word;
  PCLBeaconMinorValue = ^CLBeaconMinorValue;
  CLLocationDegrees = Double;
  PCLLocationDegrees = ^CLLocationDegrees;

  CLLocationAccuracy = Double;
  PCLLocationAccuracy = ^CLLocationAccuracy;

  CLLocationSpeed = Double;
  PCLLocationSpeed = ^CLLocationSpeed;

  CLLocationSpeedAccuracy = Double;
  PCLLocationSpeedAccuracy = ^CLLocationSpeedAccuracy;

  CLLocationDirection = Double;
  PCLLocationDirection = ^CLLocationDirection;

  CLLocationDirectionAccuracy = Double;
  PCLLocationDirectionAccuracy = ^CLLocationDirectionAccuracy;

  CLLocationCoordinate2D = record
    latitude: CLLocationDegrees;
    longitude: CLLocationDegrees;
  end;

  PCLLocationCoordinate2D = ^CLLocationCoordinate2D;

  CLLocationDistance = Double;
  PCLLocationDistance = ^CLLocationDistance;

  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  CLRegionState = NSInteger;
  CLProximity = NSInteger;
  CLError = NSInteger;
  CLGeocodeCompletionHandler = procedure(param1: NSArray; param2: NSError)
    of object;
  CLHeadingComponentValue = Double;
  PCLHeadingComponentValue = ^CLHeadingComponentValue;

  CLDeviceOrientation = Integer;
  CLAuthorizationStatus = Integer;
  CLAccuracyAuthorization = NSInteger;
  CLActivityType = NSInteger;
  TCoreLocationCompletion = procedure(param1: NSError) of object;
  TCoreLocationCompletion1 = procedure(param1: NSData; param2: NSError)
    of object;
  TCoreLocationCompletionHandler = procedure(param1: NSArray; param2: NSError)
    of object;
  NSErrorDomain = NSString;
  PNSErrorDomain = ^NSErrorDomain;
  CLLocationPushServiceError = NSInteger;
  TCoreLocationCompletion2 = procedure() of object;
  // ===== Interface declarations =====

  CLBeaconIdentityConstraintClass = interface(NSObjectClass)
    ['{8DE51098-AEB3-4E39-9E58-EA05828B8FFC}']
  end;

  CLBeaconIdentityConstraint = interface(NSObject)
    ['{981187E5-A55E-4BCD-8281-E6A9057D10A0}']
    function UUID: NSUUID; cdecl;
    function major: NSNumber; cdecl;
    function minor: NSNumber; cdecl;
    [MethodName('initWithUUID:')]
    function initWithUUID(UUID: NSUUID): Pointer { instancetype }; cdecl;
    [MethodName('initWithUUID:major:')]
    function initWithUUIDMajor(UUID: NSUUID; major: CLBeaconMajorValue)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithUUID:major:minor:')]
    function initWithUUIDMajorMinor(UUID: NSUUID; major: CLBeaconMajorValue;
      minor: CLBeaconMinorValue): Pointer { instancetype }; cdecl;
  end;

  TCLBeaconIdentityConstraint = class
    (TOCGenericImport<CLBeaconIdentityConstraintClass,
    CLBeaconIdentityConstraint>)
  end;

  PCLBeaconIdentityConstraint = Pointer;

  CLFloorClass = interface(NSObjectClass)
    ['{B731A328-A105-492C-8ED4-0F4C2234AECF}']
  end;

  CLFloor = interface(NSObject)
    ['{C5750DA9-1E2D-4582-B074-68550B43940E}']
    function level: NSInteger; cdecl;
  end;

  TCLFloor = class(TOCGenericImport<CLFloorClass, CLFloor>)
  end;

  PCLFloor = Pointer;

  CLLocationSourceInformationClass = interface(NSObjectClass)
    ['{DB28AD31-E4ED-4BB6-9764-7903F7554800}']
  end;

  CLLocationSourceInformation = interface(NSObject)
    ['{83AD08D6-726C-4B15-A995-8815772B2FC9}']
    function initWithSoftwareSimulationState(isSoftware: Boolean;
      andExternalAccessoryState: Boolean): Pointer { instancetype }; cdecl;
    function isSimulatedBySoftware: Boolean; cdecl;
    function isProducedByAccessory: Boolean; cdecl;
  end;

  TCLLocationSourceInformation = class
    (TOCGenericImport<CLLocationSourceInformationClass,
    CLLocationSourceInformation>)
  end;

  PCLLocationSourceInformation = Pointer;

  CLLocationClass = interface(NSObjectClass)
    ['{6F096255-55D8-4969-9BC1-3E8418776E4D}']
  end;

  CLLocation = interface(NSObject)
    ['{7C447DFF-9321-4058-A0FF-1B9DFE146C96}']
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
    [MethodName
      ('initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:')
      ]
    function initWithCoordinateAltitudeHorizontalAccuracyVerticalAccuracyCourseCourseAccuracySpeedSpeedAccuracyTimestamp
      (coordinate: CLLocationCoordinate2D; altitude: CLLocationDistance;
      horizontalAccuracy: CLLocationAccuracy;
      verticalAccuracy: CLLocationAccuracy; course: CLLocationDirection;
      courseAccuracy: CLLocationDirectionAccuracy; speed: CLLocationSpeed;
      speedAccuracy: CLLocationSpeedAccuracy; timestamp: NSDate)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:sourceInfo:')
      ]
    function initWithCoordinateAltitudeHorizontalAccuracyVerticalAccuracyCourseCourseAccuracySpeedSpeedAccuracyTimestampSourceInfo
      (coordinate: CLLocationCoordinate2D; altitude: CLLocationDistance;
      horizontalAccuracy: CLLocationAccuracy;
      verticalAccuracy: CLLocationAccuracy; course: CLLocationDirection;
      courseAccuracy: CLLocationDirectionAccuracy; speed: CLLocationSpeed;
      speedAccuracy: CLLocationSpeedAccuracy; timestamp: NSDate;
      sourceInfo: CLLocationSourceInformation): Pointer { instancetype }; cdecl;
    function coordinate: CLLocationCoordinate2D; cdecl;
    function altitude: CLLocationDistance; cdecl;
    function ellipsoidalAltitude: CLLocationDistance; cdecl;
    function horizontalAccuracy: CLLocationAccuracy; cdecl;
    function verticalAccuracy: CLLocationAccuracy; cdecl;
    function course: CLLocationDirection; cdecl;
    function courseAccuracy: CLLocationDirectionAccuracy; cdecl;
    function speed: CLLocationSpeed; cdecl;
    function speedAccuracy: CLLocationSpeedAccuracy; cdecl;
    function timestamp: NSDate; cdecl;
    function floor: CLFloor; cdecl;
    function sourceInformation: CLLocationSourceInformation; cdecl;
    function getDistanceFrom(location: CLLocation): CLLocationDistance; cdecl;
    function distanceFromLocation(location: CLLocation)
      : CLLocationDistance; cdecl;
  end;

  TCLLocation = class(TOCGenericImport<CLLocationClass, CLLocation>)
  end;

  PCLLocation = Pointer;

  CLRegionClass = interface(NSObjectClass)
    ['{C601CDF4-ACC7-4A07-9389-0E96FAFDE199}']
  end;

  CLRegion = interface(NSObject)
    ['{F80CC6CD-2106-4913-AF83-9EF55235F9D0}']
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
    ['{30E0E39B-D58C-4C2C-BB2B-87BC61A5F703}']
  end;

  CLBeaconRegion = interface(CLRegion)
    ['{ADEC8C74-BC1C-4064-8AAE-BF589B9D84C8}']
    [MethodName('initWithUUID:identifier:')]
    function initWithUUIDIdentifier(UUID: NSUUID; identifier: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithProximityUUID:identifier:')]
    function initWithProximityUUIDIdentifier(proximityUUID: NSUUID;
      identifier: NSString): Pointer { instancetype }; cdecl;
    [MethodName('initWithUUID:major:identifier:')]
    function initWithUUIDMajorIdentifier(UUID: NSUUID;
      major: CLBeaconMajorValue; identifier: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithProximityUUID:major:identifier:')]
    function initWithProximityUUIDMajorIdentifier(proximityUUID: NSUUID;
      major: CLBeaconMajorValue; identifier: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithUUID:major:minor:identifier:')]
    function initWithUUIDMajorMinorIdentifier(UUID: NSUUID;
      major: CLBeaconMajorValue; minor: CLBeaconMinorValue;
      identifier: NSString): Pointer { instancetype }; cdecl;
    [MethodName('initWithProximityUUID:major:minor:identifier:')]
    function initWithProximityUUIDMajorMinorIdentifier(proximityUUID: NSUUID;
      major: CLBeaconMajorValue; minor: CLBeaconMinorValue;
      identifier: NSString): Pointer { instancetype }; cdecl;
    function initWithBeaconIdentityConstraint(beaconIdentityConstraint
      : CLBeaconIdentityConstraint; identifier: NSString)
      : Pointer { instancetype }; cdecl;
    function peripheralDataWithMeasuredPower(measuredPower: NSNumber)
      : NSMutableDictionary; cdecl;
    function beaconIdentityConstraint: CLBeaconIdentityConstraint; cdecl;
    function UUID: NSUUID; cdecl;
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
    ['{D4CCE540-9FBE-4AB9-A07C-759D474B008F}']
  end;

  CLBeacon = interface(NSObject)
    ['{811F52D6-3B5D-41FA-AA86-471E80F4D317}']
    function timestamp: NSDate; cdecl;
    function UUID: NSUUID; cdecl;
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
    ['{D511C20B-67B0-4413-8796-B486524F0174}']
  end;

  CLCircularRegion = interface(CLRegion)
    ['{0B9942D8-67F8-48D3-AC40-21939960C665}']
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
    ['{A18338B2-103A-4E1B-9D63-831F09C30299}']
    { class } function new: Pointer { instancetype }; cdecl;
  end;

  CLPlacemark = interface(NSObject)
    ['{568361D7-8A0B-4AFD-B3C6-0976D8553450}']
    function init: Pointer { instancetype }; cdecl;
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
    function postalAddress: CNPostalAddress; cdecl;
  end;

  TCLPlacemark = class(TOCGenericImport<CLPlacemarkClass, CLPlacemark>)
  end;

  PCLPlacemark = Pointer;

  CLGeocoderClass = interface(NSObjectClass)
    ['{7E061344-50DC-4595-90F4-137E15956899}']
  end;

  CLGeocoder = interface(NSObject)
    ['{0AEDBE2C-5A71-4D71-8C2C-EF748B154FCC}']
    function isGeocoding: Boolean; cdecl;
    [MethodName('reverseGeocodeLocation:completionHandler:')]
    procedure reverseGeocodeLocationCompletionHandler(location: CLLocation;
      completionHandler: CLGeocodeCompletionHandler); cdecl;
    [MethodName('reverseGeocodeLocation:preferredLocale:completionHandler:')]
    procedure reverseGeocodeLocationPreferredLocaleCompletionHandler
      (location: CLLocation; preferredLocale: NSLocale;
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
    [MethodName
      ('geocodeAddressString:inRegion:preferredLocale:completionHandler:')]
    procedure geocodeAddressStringInRegionPreferredLocaleCompletionHandler
      (addressString: NSString; inRegion: CLRegion; preferredLocale: NSLocale;
      completionHandler: CLGeocodeCompletionHandler); cdecl;
    procedure cancelGeocode; cdecl;
    [MethodName('geocodePostalAddress:completionHandler:')]
    procedure geocodePostalAddressCompletionHandler(postalAddress
      : CNPostalAddress; completionHandler: CLGeocodeCompletionHandler); cdecl;
    [MethodName('geocodePostalAddress:preferredLocale:completionHandler:')]
    procedure geocodePostalAddressPreferredLocaleCompletionHandler
      (postalAddress: CNPostalAddress; preferredLocale: NSLocale;
      completionHandler: CLGeocodeCompletionHandler); cdecl;
  end;

  TCLGeocoder = class(TOCGenericImport<CLGeocoderClass, CLGeocoder>)
  end;

  PCLGeocoder = Pointer;

  CLHeadingClass = interface(NSObjectClass)
    ['{D21AADFA-2BAF-4AE2-BDC1-F8FA763097C8}']
  end;

  CLHeading = interface(NSObject)
    ['{46A21A5A-E490-4D41-BC75-24BE01000623}']
    function magneticHeading: CLLocationDirection; cdecl;
    function trueHeading: CLLocationDirection; cdecl;
    function headingAccuracy: CLLocationDirection; cdecl;
    function x: CLHeadingComponentValue; cdecl;
    function y: CLHeadingComponentValue; cdecl;
    function z: CLHeadingComponentValue; cdecl;
    function timestamp: NSDate; cdecl;
  end;

  TCLHeading = class(TOCGenericImport<CLHeadingClass, CLHeading>)
  end;

  PCLHeading = Pointer;

  CLLocationManagerClass = interface(NSObjectClass)
    ['{E038C915-47C6-45BE-ACA6-8D4881E20022}']
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
    ['{BD32A866-F912-4A81-B5DB-A00A470FA2A8}']
    function authorizationStatus: CLAuthorizationStatus; cdecl;
    function accuracyAuthorization: CLAccuracyAuthorization; cdecl;
    function isAuthorizedForWidgetUpdates: Boolean; cdecl;
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
    procedure setShowsBackgroundLocationIndicator
      (showsBackgroundLocationIndicator: Boolean); cdecl;
    function showsBackgroundLocationIndicator: Boolean; cdecl;
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
    function rangedBeaconConstraints: NSSet; cdecl;
    procedure requestWhenInUseAuthorization; cdecl;
    procedure requestAlwaysAuthorization; cdecl;
    [MethodName
      ('requestTemporaryFullAccuracyAuthorizationWithPurposeKey:completion:')]
    procedure requestTemporaryFullAccuracyAuthorizationWithPurposeKeyCompletion
      (purposeKey: NSString; completion: TCoreLocationCompletion); cdecl;
    [MethodName('requestTemporaryFullAccuracyAuthorizationWithPurposeKey:')]
    procedure requestTemporaryFullAccuracyAuthorizationWithPurposeKey
      (purposeKey: NSString); cdecl;
    procedure startUpdatingLocation; cdecl;
    procedure stopUpdatingLocation; cdecl;
    procedure requestLocation; cdecl;
    procedure startUpdatingHeading; cdecl;
    procedure stopUpdatingHeading; cdecl;
    procedure dismissHeadingCalibrationDisplay; cdecl;
    procedure startMonitoringSignificantLocationChanges; cdecl;
    procedure stopMonitoringSignificantLocationChanges; cdecl;
    procedure startMonitoringLocationPushesWithCompletion
      (completion: TCoreLocationCompletion1); cdecl;
    procedure stopMonitoringLocationPushes; cdecl;
    [MethodName('startMonitoringForRegion:desiredAccuracy:')]
    procedure startMonitoringForRegionDesiredAccuracy(region: CLRegion;
      desiredAccuracy: CLLocationAccuracy); cdecl;
    procedure stopMonitoringForRegion(region: CLRegion); cdecl;
    [MethodName('startMonitoringForRegion:')]
    procedure startMonitoringForRegion(region: CLRegion); cdecl;
    procedure requestStateForRegion(region: CLRegion); cdecl;
    procedure startRangingBeaconsInRegion(region: CLBeaconRegion); cdecl;
    procedure stopRangingBeaconsInRegion(region: CLBeaconRegion); cdecl;
    procedure startRangingBeaconsSatisfyingConstraint
      (constraint: CLBeaconIdentityConstraint); cdecl;
    procedure stopRangingBeaconsSatisfyingConstraint
      (constraint: CLBeaconIdentityConstraint); cdecl;
    procedure allowDeferredLocationUpdatesUntilTraveled
      (distance: CLLocationDistance; timeout: NSTimeInterval); cdecl;
    procedure disallowDeferredLocationUpdates; cdecl;
    procedure requestHistoricalLocationsWithPurposeKey(purposeKey: NSString;
      sampleCount: NSInteger;
      completionHandler: TCoreLocationCompletionHandler); cdecl;
    procedure startMonitoringVisits; cdecl;
    procedure stopMonitoringVisits; cdecl;
  end;

  TCLLocationManager = class(TOCGenericImport<CLLocationManagerClass,
    CLLocationManager>)
  end;

  PCLLocationManager = Pointer;

  CLVisitClass = interface(NSObjectClass)
    ['{52A0082D-7AF0-41AF-8BB6-5941264CDD81}']
  end;

  CLVisit = interface(NSObject)
    ['{EA1B73A7-8AFB-440A-B8E9-9E528585C22F}']
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
    ['{3426E8A9-CF43-4E81-99F7-D7CA95D84EC1}']
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
    [MethodName('locationManager:didRangeBeacons:satisfyingConstraint:')]
    procedure locationManagerDidRangeBeaconsSatisfyingConstraint
      (manager: CLLocationManager; didRangeBeacons: NSArray;
      satisfyingConstraint: CLBeaconIdentityConstraint); cdecl;
    [MethodName('locationManager:didFailRangingBeaconsForConstraint:error:')]
    procedure locationManagerDidFailRangingBeaconsForConstraintError
      (manager: CLLocationManager; didFailRangingBeaconsForConstraint
      : CLBeaconIdentityConstraint; error: NSError); cdecl;
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
    procedure locationManagerDidChangeAuthorization
      (manager: CLLocationManager); cdecl;
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

  CLLocationPushServiceExtension = interface(IObjectiveC)
    ['{A25CB1CD-0B08-475F-8DB4-0C6340755F56}']
    procedure didReceiveLocationPushPayload(payload: NSDictionary;
      completion: TCoreLocationCompletion2); cdecl;
    procedure serviceExtensionWillTerminate; cdecl;
  end;

  // ===== Exported string consts =====

function kCLDistanceFilterNone: Pointer;
function kCLLocationAccuracyBestForNavigation: Pointer;
function kCLLocationAccuracyBest: Pointer;
function kCLLocationAccuracyNearestTenMeters: Pointer;
function kCLLocationAccuracyHundredMeters: Pointer;
function kCLLocationAccuracyKilometer: Pointer;
function kCLLocationAccuracyThreeKilometers: Pointer;
function kCLLocationAccuracyReduced: Pointer;
function CLLocationDistanceMax: Pointer;
function CLTimeIntervalMax: Pointer;
function kCLLocationCoordinate2DInvalid: Pointer;
function kCLErrorUserInfoAlternateRegionKey: NSString;
function kCLErrorDomain: NSString;
function kCLHeadingFilterNone: Pointer;
function CLLocationPushServiceErrorDomain: Pointer;


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

function kCLLocationAccuracyReduced: Pointer;
begin
  Result := CocoaPointerConst(libCoreLocation, 'kCLLocationAccuracyReduced');
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

function CLLocationPushServiceErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libCoreLocation,
    'CLLocationPushServiceErrorDomain');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreLocationModule := dlopen(MarshaledAString(libCoreLocation), RTLD_LAZY);

finalization

dlclose(CoreLocationModule);
{$ENDIF IOS}

end.
