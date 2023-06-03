{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework MapKit
//

unit iOSapi.MapKit;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.CoreLocation,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  MKDistanceFormatterUnitsDefault = 0;
  MKDistanceFormatterUnitsMetric = 1;
  MKDistanceFormatterUnitsImperial = 2;
  MKDistanceFormatterUnitsImperialWithYards = 3;
  MKDistanceFormatterUnitStyleDefault = 0;
  MKDistanceFormatterUnitStyleAbbreviated = 1;
  MKDistanceFormatterUnitStyleFull = 2;
  MKAnnotationViewDragStateNone = 0;
  MKAnnotationViewDragStateStarting = 1;
  MKAnnotationViewDragStateDragging = 2;
  MKAnnotationViewDragStateCanceling = 3;
  MKAnnotationViewDragStateEnding = 4;
  MKAnnotationViewCollisionModeRectangle = 0;
  MKAnnotationViewCollisionModeCircle = 1;
  MKAnnotationViewCollisionModeNone = 2;
  MKMapTypeStandard = 0;
  MKMapTypeSatellite = 1;
  MKMapTypeHybrid = 2;
  MKMapTypeSatelliteFlyover = 3;
  MKMapTypeHybridFlyover = 4;
  MKMapTypeMutedStandard = 5;
  MKErrorUnknown = 1;
  MKErrorServerFailure = 2;
  MKErrorLoadingThrottled = 3;
  MKErrorPlacemarkNotFound = 4;
  MKErrorDirectionsNotFound = 5;
  MKErrorDecodingFailed = 6;
  MKFeatureVisibilityAdaptive = 0;
  MKFeatureVisibilityHidden = 1;
  MKFeatureVisibilityVisible = 2;
  MKMapFeatureTypePointOfInterest = 0;
  MKMapFeatureTypeTerritory = 1;
  MKMapFeatureTypePhysicalFeature = 2;
  MKUserTrackingModeNone = 0;
  MKUserTrackingModeFollow = 1;
  MKUserTrackingModeFollowWithHeading = 2;
  MKMapFeatureOptionPointsOfInterest = 1 shl MKMapFeatureTypePointOfInterest;
  MKMapFeatureOptionTerritories = 1 shl MKMapFeatureTypeTerritory;
  MKMapFeatureOptionPhysicalFeatures = 1 shl MKMapFeatureTypePhysicalFeature;
  MKOverlayLevelAboveRoads = 0;
  MKOverlayLevelAboveLabels = 1;
  MKPinAnnotationColorRed = 0;
  MKPinAnnotationColorGreen = 1;
  MKPinAnnotationColorPurple = 2;
  MKLocalSearchResultTypeAddress = 1 shl 0;
  MKLocalSearchResultTypePointOfInterest = 1 shl 1;
  MKSearchCompletionFilterTypeLocationsAndQueries = 0;
  MKSearchCompletionFilterTypeLocationsOnly = 1;
  MKLocalSearchCompleterResultTypeAddress = 1 shl 0;
  MKLocalSearchCompleterResultTypePointOfInterest = 1 shl 1;
  MKLocalSearchCompleterResultTypeQuery = 1 shl 2;
  MKDirectionsTransportTypeAutomobile = 1 shl 0;
  MKDirectionsTransportTypeWalking = 1 shl 1;
  MKDirectionsTransportTypeTransit = 1 shl 2;
  MKDirectionsTransportTypeAny = 268435455;
  MKDirectionsRoutePreferenceAny = 0;
  MKDirectionsRoutePreferenceAvoid = 1;
  MKMapElevationStyleFlat = 0;
  MKMapElevationStyleRealistic = 1;
  MKStandardMapEmphasisStyleDefault = 0;
  MKStandardMapEmphasisStyleMuted = 1;
  MKScaleViewAlignmentLeading = 0;
  MKScaleViewAlignmentTrailing = 1;
  MKLookAroundBadgePositionTopLeading = 0;
  MKLookAroundBadgePositionTopTrailing = 1;
  MKLookAroundBadgePositionBottomTrailing = 2;

type

  // ===== Forward declarations =====
{$M+}
  MKAnnotation = interface;
  MKDistanceFormatter = interface;
  NSValueMapKitGeometryExtensions = interface;
  MKPlacemark = interface;
  MKMapItem = interface;
  MKAnnotationView = interface;
  MKOverlay = interface;
  MKOverlayRenderer = interface;
  MKOverlayView = interface;
  MKIconStyle = interface;
  MKMapFeatureAnnotation = interface;
  MKUserLocation = interface;
  MKMapCamera = interface;
  MKMapCameraZoomRange = interface;
  MKMapCameraBoundary = interface;
  MKClusterAnnotation = interface;
  MKPointOfInterestFilter = interface;
  MKMapConfiguration = interface;
  MKMapViewDelegate = interface;
  MKMapView = interface;
  MKMarkerAnnotationView = interface;
  MKPinAnnotationView = interface;
  MKUserLocationView = interface;
  MKCompassButton = interface;
  MKShape = interface;
  MKPointAnnotation = interface;
  MKMultiPoint = interface;
  MKPolygon = interface;
  MKMultiPolygon = interface;
  MKOverlayPathRenderer = interface;
  MKMultiPolygonRenderer = interface;
  MKPolyline = interface;
  MKMultiPolyline = interface;
  MKMultiPolylineRenderer = interface;
  MKCircle = interface;
  MKGeodesicPolyline = interface;
  MKPolylineRenderer = interface;
  MKGradientPolylineRenderer = interface;
  MKPolygonRenderer = interface;
  MKCircleRenderer = interface;
  MKLocalPointsOfInterestRequest = interface;
  MKLocalSearchRequest = interface;
  MKLocalSearchResponse = interface;
  MKLocalSearch = interface;
  MKLocalSearchCompletion = interface;
  MKLocalSearchCompleterDelegate = interface;
  MKLocalSearchCompleter = interface;
  MKDirectionsRequest = interface;
  MKDirectionsResponse = interface;
  MKETAResponse = interface;
  MKDirections = interface;
  MKRoute = interface;
  MKRouteStep = interface;
  MKMapSnapshotOptions = interface;
  MKMapSnapshot = interface;
  MKMapSnapshotter = interface;
  MKTileOverlay = interface;
  MKTileOverlayRenderer = interface;
  MKGeoJSONObject = interface;
  MKGeoJSONDecoder = interface;
  MKGeoJSONFeature = interface;
  MKPitchControl = interface;
  MKZoomControl = interface;
  MKHybridMapConfiguration = interface;
  MKImageryMapConfiguration = interface;
  MKStandardMapConfiguration = interface;
  MKReverseGeocoderDelegate = interface;
  MKReverseGeocoder = interface;
  MKOverlayPathView = interface;
  MKPolygonView = interface;
  MKPolylineView = interface;
  MKCircleView = interface;
  MKScaleView = interface;
  MKUserTrackingBarButtonItem = interface;
  MKUserTrackingButton = interface;
  MKMapItemRequest = interface;
  MKLookAroundScene = interface;
  MKLookAroundSceneRequest = interface;
  MKLookAroundSnapshot = interface;
  MKLookAroundSnapshotOptions = interface;
  MKLookAroundSnapshotter = interface;
  MKLookAroundViewControllerDelegate = interface;
  MKLookAroundViewController = interface;

  // ===== Framework typedefs =====
{$M+}
  CLLocationDegrees = Double;
  PCLLocationDegrees = ^CLLocationDegrees;

  CLLocationCoordinate2D = record
    latitude: CLLocationDegrees;
    longitude: CLLocationDegrees;
  end;

  PCLLocationCoordinate2D = ^CLLocationCoordinate2D;

  CLLocationDistance = Double;
  PCLLocationDistance = ^CLLocationDistance;

  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  MKDistanceFormatterUnits = NSUInteger;
  MKDistanceFormatterUnitStyle = NSUInteger;

  MKCoordinateSpan = record
    latitudeDelta: CLLocationDegrees;
    longitudeDelta: CLLocationDegrees;
  end;

  PMKCoordinateSpan = ^MKCoordinateSpan;

  MKCoordinateRegion = record
    center: CLLocationCoordinate2D;
    span: MKCoordinateSpan;
  end;

  PMKCoordinateRegion = ^MKCoordinateRegion;

  MKMapPoint = record
    x: Double;
    y: Double;
  end;

  PMKMapPoint = ^MKMapPoint;

  MKMapSize = record
    width: Double;
    height: Double;
  end;

  PMKMapSize = ^MKMapSize;

  MKMapRect = record
    origin: MKMapPoint;
    size: MKMapSize;
  end;

  PMKMapRect = ^MKMapRect;

  CGFloat = Single;
  PCGFloat = ^CGFloat;

  MKZoomScale = CGFloat;
  PMKZoomScale = ^MKZoomScale;
  CGRectEdge = LongWord;
  MKPointOfInterestCategory = NSString;
  PMKPointOfInterestCategory = ^MKPointOfInterestCategory;
  TMapKitCompletionHandler = procedure(param1: Boolean) of object;
  MKAnnotationViewDragState = NSUInteger;
  MKFeatureDisplayPriority = Single;
  PMKFeatureDisplayPriority = ^MKFeatureDisplayPriority;

  MKAnnotationViewZPriority = Single;
  PMKAnnotationViewZPriority = ^MKAnnotationViewZPriority;

  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  MKAnnotationViewCollisionMode = NSInteger;

  CGPoint = record
    x: CGFloat;
    y: CGFloat;
  end;

  PCGPoint = ^CGPoint;

  MKMapType = NSUInteger;
  MKErrorCode = NSUInteger;
  MKFeatureVisibility = NSInteger;

  CGSize = record
    width: CGFloat;
    height: CGFloat;
  end;

  PCGSize = ^CGSize;

  CGRect = record
    origin: CGPoint;
    size: CGSize;
  end;

  PCGRect = ^CGRect;

  CGContextRef = Pointer;
  PCGContextRef = ^CGContextRef;
  CGBlendMode = Int32;
  MKMapFeatureType = NSInteger;
  MKUserTrackingMode = NSInteger;
  MKMapFeatureOptions = NSInteger;

  UIEdgeInsets = record
    top: CGFloat;
    left: CGFloat;
    bottom: CGFloat;
    right: CGFloat;
  end;

  PUIEdgeInsets = ^UIEdgeInsets;

  MKOverlayLevel = NSInteger;
  MKPinAnnotationColor = NSUInteger;

  _NSRange = record
    location: NSUInteger;
    length: NSUInteger;
  end;

  P_NSRange = ^_NSRange;
  NSRange = _NSRange;
  PNSRange = ^NSRange;

  CGLineJoin = Int32;
  CGLineCap = Int32;
  CGPathRef = Pointer;
  PCGPathRef = ^CGPathRef;
  MKLocalSearchCompletionHandler = procedure(param1: MKLocalSearchResponse;
    param2: NSError) of object;
  MKLocalSearchResultType = NSUInteger;
  MKSearchCompletionFilterType = NSInteger;
  MKLocalSearchCompleterResultType = NSUInteger;
  MKDirectionsTransportType = NSUInteger;
  MKDirectionsRoutePreference = NSInteger;
  MKDirectionsHandler = procedure(param1: MKDirectionsResponse; param2: NSError)
    of object;
  MKETAHandler = procedure(param1: MKETAResponse; param2: NSError) of object;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  MKMapSnapshotCompletionHandler = procedure(param1: MKMapSnapshot;
    param2: NSError) of object;
  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;

  MKTileOverlayPath = record
    x: NSInteger;
    y: NSInteger;
    z: NSInteger;
    contentScaleFactor: CGFloat;
  end;

  PMKTileOverlayPath = ^MKTileOverlayPath;

  TMapKitResult = procedure(param1: NSData; param2: NSError) of object;
  CLLocationDirection = Double;
  PCLLocationDirection = ^CLLocationDirection;

  MKMapElevationStyle = NSInteger;
  MKStandardMapEmphasisStyle = NSInteger;
  MKScaleViewAlignment = NSInteger;
  TMapKitCompletionHandler1 = procedure(param1: MKMapItem; param2: NSError)
    of object;
  TMapKitCompletionHandler2 = procedure(param1: MKLookAroundScene) of object;
  TMapKitCompletionHandler3 = procedure(param1: MKLookAroundSnapshot;
    param2: NSError) of object;
  MKLookAroundBadgePosition = NSInteger;
  // ===== Interface declarations =====

  MKDistanceFormatterClass = interface(NSFormatterClass)
    ['{3C8B5967-CE3A-47C2-9EBD-2376F5F31A40}']
  end;

  MKDistanceFormatter = interface(NSFormatter)
    ['{D08BEB27-7475-40C0-89F0-DA97D9519016}']
    function stringFromDistance(distance: CLLocationDistance): NSString; cdecl;
    function distanceFromString(distance: NSString): CLLocationDistance; cdecl;
    procedure setLocale(locale: NSLocale); cdecl;
    function locale: NSLocale; cdecl;
    procedure setUnits(units: MKDistanceFormatterUnits); cdecl;
    function units: MKDistanceFormatterUnits; cdecl;
    procedure setUnitStyle(unitStyle: MKDistanceFormatterUnitStyle); cdecl;
    function unitStyle: MKDistanceFormatterUnitStyle; cdecl;
  end;

  TMKDistanceFormatter = class(TOCGenericImport<MKDistanceFormatterClass,
    MKDistanceFormatter>)
  end;

  PMKDistanceFormatter = Pointer;

  NSValueMapKitGeometryExtensions = interface(IObjectiveC)
    ['{66DC75BE-A863-4038-A4D9-827D863E95D3}']
    function valueWithMKCoordinate(coordinate: CLLocationCoordinate2D)
      : NSValue; cdecl;
    function valueWithMKCoordinateSpan(span: MKCoordinateSpan): NSValue; cdecl;
    function MKCoordinateValue: CLLocationCoordinate2D; cdecl;
    function MKCoordinateSpanValue: MKCoordinateSpan; cdecl;
  end;

  MKPlacemarkClass = interface(CLPlacemarkClass)
    ['{BA864915-F0E5-4882-88ED-E8F5A3226209}']
  end;

  MKPlacemark = interface(CLPlacemark)
    ['{76E4A834-170D-4F4D-B1C1-8B57FDDB8B1C}']
    [MethodName('initWithCoordinate:')]
    function initWithCoordinate(coordinate: CLLocationCoordinate2D)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithCoordinate:addressDictionary:')]
    function initWithCoordinateAddressDictionary
      (coordinate: CLLocationCoordinate2D; addressDictionary: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithCoordinate:postalAddress:')]
    function initWithCoordinatePostalAddress(coordinate: CLLocationCoordinate2D;
      postalAddress: CNPostalAddress): Pointer { instancetype }; cdecl;
    function countryCode: NSString; cdecl;
  end;

  TMKPlacemark = class(TOCGenericImport<MKPlacemarkClass, MKPlacemark>)
  end;

  PMKPlacemark = Pointer;

  MKMapItemClass = interface(NSObjectClass)
    ['{0E24EFB8-0B73-4A0E-97BD-D43D06590A02}']
    { class } function mapItemForCurrentLocation: MKMapItem; cdecl;
    [MethodName('openMapsWithItems:launchOptions:')]
    { class } function openMapsWithItemsLaunchOptions(mapItems: NSArray;
      launchOptions: NSDictionary): Boolean; cdecl;
    [MethodName('openMapsWithItems:launchOptions:fromScene:completionHandler:')]
    { class } procedure openMapsWithItemsLaunchOptionsFromSceneCompletionHandler
      (mapItems: NSArray; launchOptions: NSDictionary; fromScene: UIScene;
      completionHandler: TMapKitCompletionHandler); cdecl;
  end;

  MKMapItem = interface(NSObject)
    ['{0120ACE1-A8CD-4565-9DB4-2775BC1A796B}']
    function placemark: MKPlacemark; cdecl;
    function isCurrentLocation: Boolean; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setPhoneNumber(phoneNumber: NSString); cdecl;
    function phoneNumber: NSString; cdecl;
    procedure setUrl(url: NSURL); cdecl;
    function url: NSURL; cdecl;
    procedure setTimeZone(timeZone: NSTimeZone); cdecl;
    function timeZone: NSTimeZone; cdecl;
    procedure setPointOfInterestCategory(pointOfInterestCategory
      : MKPointOfInterestCategory); cdecl;
    function pointOfInterestCategory: MKPointOfInterestCategory; cdecl;
    function initWithPlacemark(placemark: MKPlacemark)
      : Pointer { instancetype }; cdecl;
    [MethodName('openInMapsWithLaunchOptions:')]
    function openInMapsWithLaunchOptions(launchOptions: NSDictionary)
      : Boolean; cdecl;
    [MethodName('openInMapsWithLaunchOptions:fromScene:completionHandler:')]
    procedure openInMapsWithLaunchOptionsFromSceneCompletionHandler
      (launchOptions: NSDictionary; fromScene: UIScene;
      completionHandler: TMapKitCompletionHandler); cdecl;
    procedure setMapItem(mapItem: MKMapItem); cdecl;
    function mapItem: MKMapItem; cdecl;
  end;

  TMKMapItem = class(TOCGenericImport<MKMapItemClass, MKMapItem>)
  end;

  PMKMapItem = Pointer;

  MKAnnotationViewClass = interface(UIViewClass)
    ['{35B536C7-49CB-44F7-AB9C-4EB84344238D}']
  end;

  MKAnnotationView = interface(UIView)
    ['{8EF13D96-3455-4D7D-A6B9-11FF78C5FEB5}']
    function initWithAnnotation(annotation: Pointer; reuseIdentifier: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function reuseIdentifier: NSString; cdecl;
    procedure prepareForReuse; cdecl;
    procedure prepareForDisplay; cdecl;
    procedure setAnnotation(annotation: Pointer); cdecl;
    function annotation: Pointer; cdecl;
    procedure setImage(image: UIImage); cdecl;
    function image: UIImage; cdecl;
    procedure setCenterOffset(centerOffset: CGPoint); cdecl;
    function centerOffset: CGPoint; cdecl;
    procedure setCalloutOffset(calloutOffset: CGPoint); cdecl;
    function calloutOffset: CGPoint; cdecl;
    procedure setLeftCalloutOffset(leftCalloutOffset: CGPoint); cdecl;
    function leftCalloutOffset: CGPoint; cdecl;
    procedure setRightCalloutOffset(rightCalloutOffset: CGPoint); cdecl;
    function rightCalloutOffset: CGPoint; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    procedure setHighlighted(highlighted: Boolean); cdecl;
    function isHighlighted: Boolean; cdecl;
    [MethodName('setSelected:')]
    procedure setSelected(selected: Boolean); cdecl;
    function isSelected: Boolean; cdecl;
    [MethodName('setSelected:animated:')]
    procedure setSelectedAnimated(selected: Boolean; animated: Boolean); cdecl;
    procedure setCanShowCallout(canShowCallout: Boolean); cdecl;
    function canShowCallout: Boolean; cdecl;
    procedure setLeftCalloutAccessoryView(leftCalloutAccessoryView
      : UIView); cdecl;
    function leftCalloutAccessoryView: UIView; cdecl;
    procedure setRightCalloutAccessoryView(rightCalloutAccessoryView
      : UIView); cdecl;
    function rightCalloutAccessoryView: UIView; cdecl;
    procedure setDetailCalloutAccessoryView(detailCalloutAccessoryView
      : UIView); cdecl;
    function detailCalloutAccessoryView: UIView; cdecl;
    procedure setDraggable(draggable: Boolean); cdecl;
    function isDraggable: Boolean; cdecl;
    [MethodName('setDragState:')]
    procedure setDragState(dragState: MKAnnotationViewDragState); cdecl;
    function dragState: MKAnnotationViewDragState; cdecl;
    [MethodName('setDragState:animated:')]
    procedure setDragStateAnimated(newDragState: MKAnnotationViewDragState;
      animated: Boolean); cdecl;
    procedure setClusteringIdentifier(clusteringIdentifier: NSString); cdecl;
    function clusteringIdentifier: NSString; cdecl;
    function clusterAnnotationView: MKAnnotationView; cdecl;
    procedure setDisplayPriority(displayPriority
      : MKFeatureDisplayPriority); cdecl;
    function displayPriority: MKFeatureDisplayPriority; cdecl;
    procedure setZPriority(zPriority: MKAnnotationViewZPriority); cdecl;
    function zPriority: MKAnnotationViewZPriority; cdecl;
    procedure setSelectedZPriority(selectedZPriority
      : MKAnnotationViewZPriority); cdecl;
    function selectedZPriority: MKAnnotationViewZPriority; cdecl;
    procedure setCollisionMode(collisionMode
      : MKAnnotationViewCollisionMode); cdecl;
    function collisionMode: MKAnnotationViewCollisionMode; cdecl;
  end;

  TMKAnnotationView = class(TOCGenericImport<MKAnnotationViewClass,
    MKAnnotationView>)
  end;

  PMKAnnotationView = Pointer;

  MKOverlayRendererClass = interface(NSObjectClass)
    ['{7DA8CCC4-9487-423B-9029-0D1663C34C99}']
  end;

  MKOverlayRenderer = interface(NSObject)
    ['{6C68768D-4E47-42E2-9F86-E761C5FB388E}']
    function initWithOverlay(overlay: Pointer): Pointer { instancetype }; cdecl;
    function overlay: Pointer; cdecl;
    function pointForMapPoint(mapPoint: MKMapPoint): CGPoint; cdecl;
    function mapPointForPoint(point: CGPoint): MKMapPoint; cdecl;
    function rectForMapRect(mapRect: MKMapRect): CGRect; cdecl;
    function mapRectForRect(rect: CGRect): MKMapRect; cdecl;
    function canDrawMapRect(mapRect: MKMapRect; zoomScale: MKZoomScale)
      : Boolean; cdecl;
    procedure drawMapRect(mapRect: MKMapRect; zoomScale: MKZoomScale;
      inContext: CGContextRef); cdecl;
    procedure setNeedsDisplay; cdecl;
    [MethodName('setNeedsDisplayInMapRect:')]
    procedure setNeedsDisplayInMapRect(mapRect: MKMapRect); cdecl;
    [MethodName('setNeedsDisplayInMapRect:zoomScale:')]
    procedure setNeedsDisplayInMapRectZoomScale(mapRect: MKMapRect;
      zoomScale: MKZoomScale); cdecl;
    procedure setAlpha(alpha: CGFloat); cdecl;
    function alpha: CGFloat; cdecl;
    function contentScaleFactor: CGFloat; cdecl;
    procedure setBlendMode(blendMode: CGBlendMode); cdecl;
    function blendMode: CGBlendMode; cdecl;
  end;

  TMKOverlayRenderer = class(TOCGenericImport<MKOverlayRendererClass,
    MKOverlayRenderer>)
  end;

  PMKOverlayRenderer = Pointer;

  MKOverlayViewClass = interface(UIViewClass)
    ['{02599E48-0611-4EB8-BF8E-D62B0E2DEA30}']
  end;

  MKOverlayView = interface(UIView)
    ['{E388996B-E380-486E-8A05-CF59BDD34D1E}']
    function initWithOverlay(overlay: Pointer): Pointer { instancetype }; cdecl;
    function overlay: Pointer; cdecl;
    function pointForMapPoint(mapPoint: MKMapPoint): CGPoint; cdecl;
    function mapPointForPoint(point: CGPoint): MKMapPoint; cdecl;
    function rectForMapRect(mapRect: MKMapRect): CGRect; cdecl;
    function mapRectForRect(rect: CGRect): MKMapRect; cdecl;
    function canDrawMapRect(mapRect: MKMapRect; zoomScale: MKZoomScale)
      : Boolean; cdecl;
    procedure drawMapRect(mapRect: MKMapRect; zoomScale: MKZoomScale;
      inContext: CGContextRef); cdecl;
    [MethodName('setNeedsDisplayInMapRect:')]
    procedure setNeedsDisplayInMapRect(mapRect: MKMapRect); cdecl;
    [MethodName('setNeedsDisplayInMapRect:zoomScale:')]
    procedure setNeedsDisplayInMapRectZoomScale(mapRect: MKMapRect;
      zoomScale: MKZoomScale); cdecl;
  end;

  TMKOverlayView = class(TOCGenericImport<MKOverlayViewClass, MKOverlayView>)
  end;

  PMKOverlayView = Pointer;

  MKIconStyleClass = interface(NSObjectClass)
    ['{393DB1EC-95C0-4D03-844E-358C96C22721}']
  end;

  MKIconStyle = interface(NSObject)
    ['{FCD80966-B0B3-4761-BF41-A3B542C9F8B0}']
    function backgroundColor: UIColor; cdecl;
    function image: UIImage; cdecl;
  end;

  TMKIconStyle = class(TOCGenericImport<MKIconStyleClass, MKIconStyle>)
  end;

  PMKIconStyle = Pointer;

  MKMapFeatureAnnotationClass = interface(NSObjectClass)
    ['{67494ACB-5538-4B78-A202-9DCD840843D4}']
  end;

  MKMapFeatureAnnotation = interface(NSObject)
    ['{9824586E-D660-473F-BB2A-2F21786D9D5A}']
    function featureType: MKMapFeatureType; cdecl;
    function iconStyle: MKIconStyle; cdecl;
    function pointOfInterestCategory: MKPointOfInterestCategory; cdecl;
  end;

  TMKMapFeatureAnnotation = class(TOCGenericImport<MKMapFeatureAnnotationClass,
    MKMapFeatureAnnotation>)
  end;

  PMKMapFeatureAnnotation = Pointer;

  MKUserLocationClass = interface(NSObjectClass)
    ['{AF33334B-C195-4018-959E-6B07C0F658AE}']
  end;

  MKUserLocation = interface(NSObject)
    ['{ED8842D7-EC29-4A83-84E6-FA9624253335}']
    function isUpdating: Boolean; cdecl;
    function location: CLLocation; cdecl;
    function heading: CLHeading; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setSubtitle(subtitle: NSString); cdecl;
    function subtitle: NSString; cdecl;
  end;

  TMKUserLocation = class(TOCGenericImport<MKUserLocationClass, MKUserLocation>)
  end;

  PMKUserLocation = Pointer;

  MKMapCameraClass = interface(NSObjectClass)
    ['{EDBBCCF1-0100-4D8C-B0FB-A1D0E7BE984D}']
    { class } function camera: Pointer { instancetype }; cdecl;
    [MethodName
      ('cameraLookingAtCenterCoordinate:fromEyeCoordinate:eyeAltitude:')]
    { class } function
      cameraLookingAtCenterCoordinateFromEyeCoordinateEyeAltitude
      (centerCoordinate: CLLocationCoordinate2D;
      fromEyeCoordinate: CLLocationCoordinate2D;
      eyeAltitude: CLLocationDistance): Pointer { instancetype }; cdecl;
    [MethodName('cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:')]
    { class } function cameraLookingAtCenterCoordinateFromDistancePitchHeading
      (centerCoordinate: CLLocationCoordinate2D;
      fromDistance: CLLocationDistance; pitch: CGFloat;
      heading: CLLocationDirection): Pointer { instancetype }; cdecl;
    { class } function cameraLookingAtMapItem(mapItem: MKMapItem;
      forViewSize: CGSize; allowPitch: Boolean)
      : Pointer { instancetype }; cdecl;
  end;

  MKMapCamera = interface(NSObject)
    ['{04E41707-EAD5-40CC-BFE6-13D58E82D988}']
    procedure setCenterCoordinate(centerCoordinate
      : CLLocationCoordinate2D); cdecl;
    function centerCoordinate: CLLocationCoordinate2D; cdecl;
    procedure setCenterCoordinateDistance(centerCoordinateDistance
      : CLLocationDistance); cdecl;
    function centerCoordinateDistance: CLLocationDistance; cdecl;
    procedure setHeading(heading: CLLocationDirection); cdecl;
    function heading: CLLocationDirection; cdecl;
    procedure setPitch(pitch: CGFloat); cdecl;
    function pitch: CGFloat; cdecl;
    procedure setAltitude(altitude: CLLocationDistance); cdecl;
    function altitude: CLLocationDistance; cdecl;
  end;

  TMKMapCamera = class(TOCGenericImport<MKMapCameraClass, MKMapCamera>)
  end;

  PMKMapCamera = Pointer;

  MKMapCameraZoomRangeClass = interface(NSObjectClass)
    ['{564E7323-27AA-4CC2-B43F-5FCCF2C0718F}']
  end;

  MKMapCameraZoomRange = interface(NSObject)
    ['{9744E21F-8A86-4BD5-9446-2CE35A322EB7}']
    [MethodName
      ('initWithMinCenterCoordinateDistance:maxCenterCoordinateDistance:')]
    function initWithMinCenterCoordinateDistanceMaxCenterCoordinateDistance
      (minDistance: CLLocationDistance;
      maxCenterCoordinateDistance: CLLocationDistance)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithMinCenterCoordinateDistance:')]
    function initWithMinCenterCoordinateDistance(minDistance
      : CLLocationDistance): Pointer { instancetype }; cdecl;
    function initWithMaxCenterCoordinateDistance(maxDistance
      : CLLocationDistance): Pointer { instancetype }; cdecl;
    function minCenterCoordinateDistance: CLLocationDistance; cdecl;
    function maxCenterCoordinateDistance: CLLocationDistance; cdecl;
  end;

  TMKMapCameraZoomRange = class(TOCGenericImport<MKMapCameraZoomRangeClass,
    MKMapCameraZoomRange>)
  end;

  PMKMapCameraZoomRange = Pointer;

  MKMapCameraBoundaryClass = interface(NSObjectClass)
    ['{74768ED7-8E6B-435D-A884-91EB356AC611}']
  end;

  MKMapCameraBoundary = interface(NSObject)
    ['{3231984C-1E1B-43AA-85C7-9EC310E8D187}']
    function initWithMapRect(mapRect: MKMapRect)
      : Pointer { instancetype }; cdecl;
    function initWithCoordinateRegion(region: MKCoordinateRegion)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function mapRect: MKMapRect; cdecl;
    function region: MKCoordinateRegion; cdecl;
  end;

  TMKMapCameraBoundary = class(TOCGenericImport<MKMapCameraBoundaryClass,
    MKMapCameraBoundary>)
  end;

  PMKMapCameraBoundary = Pointer;

  MKClusterAnnotationClass = interface(NSObjectClass)
    ['{CF1BB033-C73A-457A-9536-9330CDB1B250}']
  end;

  MKClusterAnnotation = interface(NSObject)
    ['{7E83EF4B-5D40-4DEF-A08E-1326AD059870}']
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setSubtitle(subtitle: NSString); cdecl;
    function subtitle: NSString; cdecl;
    function memberAnnotations: NSArray; cdecl;
    function initWithMemberAnnotations(memberAnnotations: NSArray)
      : Pointer { instancetype }; cdecl;
  end;

  TMKClusterAnnotation = class(TOCGenericImport<MKClusterAnnotationClass,
    MKClusterAnnotation>)
  end;

  PMKClusterAnnotation = Pointer;

  MKPointOfInterestFilterClass = interface(NSObjectClass)
    ['{94A0BCDD-E204-4FD0-BF14-49E91EF7FB0C}']
  end;

  MKPointOfInterestFilter = interface(NSObject)
    ['{29A3341E-0598-4280-829D-8252F654A953}']
    procedure setFilterIncludingAllCategories(filterIncludingAllCategories
      : MKPointOfInterestFilter); cdecl;
    function filterIncludingAllCategories: MKPointOfInterestFilter; cdecl;
    procedure setFilterExcludingAllCategories(filterExcludingAllCategories
      : MKPointOfInterestFilter); cdecl;
    function filterExcludingAllCategories: MKPointOfInterestFilter; cdecl;
    function initIncludingCategories(categories: NSArray)
      : Pointer { instancetype }; cdecl;
    function initExcludingCategories(categories: NSArray)
      : Pointer { instancetype }; cdecl;
    function includesCategory(category: MKPointOfInterestCategory)
      : Boolean; cdecl;
    function excludesCategory(category: MKPointOfInterestCategory)
      : Boolean; cdecl;
  end;

  TMKPointOfInterestFilter = class
    (TOCGenericImport<MKPointOfInterestFilterClass, MKPointOfInterestFilter>)
  end;

  PMKPointOfInterestFilter = Pointer;

  MKMapConfigurationClass = interface(NSObjectClass)
    ['{9469C54D-DA67-449A-97F2-F51D004CF979}']
  end;

  MKMapConfiguration = interface(NSObject)
    ['{8A3DEEC7-B37D-49A3-A061-65B3E0CDEE4E}']
    procedure setElevationStyle(elevationStyle: MKMapElevationStyle); cdecl;
    function elevationStyle: MKMapElevationStyle; cdecl;
  end;

  TMKMapConfiguration = class(TOCGenericImport<MKMapConfigurationClass,
    MKMapConfiguration>)
  end;

  PMKMapConfiguration = Pointer;

  MKMapViewClass = interface(UIViewClass)
    ['{8B9FC79B-EB97-4C86-8D34-61DB3F387048}']
  end;

  MKMapView = interface(UIView)
    ['{84CD89EC-0769-4A1B-84A6-3D898AE1D13E}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setMapType(mapType: MKMapType); cdecl;
    function mapType: MKMapType; cdecl;
    procedure setPreferredConfiguration(preferredConfiguration
      : MKMapConfiguration); cdecl;
    function preferredConfiguration: MKMapConfiguration; cdecl;
    procedure setSelectableMapFeatures(selectableMapFeatures
      : MKMapFeatureOptions); cdecl;
    function selectableMapFeatures: MKMapFeatureOptions; cdecl;
    [MethodName('setRegion:')]
    procedure setRegion(region: MKCoordinateRegion); cdecl;
    function region: MKCoordinateRegion; cdecl;
    [MethodName('setRegion:animated:')]
    procedure setRegionAnimated(region: MKCoordinateRegion;
      animated: Boolean); cdecl;
    [MethodName('setCenterCoordinate:')]
    procedure setCenterCoordinate(centerCoordinate
      : CLLocationCoordinate2D); cdecl;
    function centerCoordinate: CLLocationCoordinate2D; cdecl;
    [MethodName('setCenterCoordinate:animated:')]
    procedure setCenterCoordinateAnimated(coordinate: CLLocationCoordinate2D;
      animated: Boolean); cdecl;
    function regionThatFits(region: MKCoordinateRegion)
      : MKCoordinateRegion; cdecl;
    [MethodName('setVisibleMapRect:')]
    procedure setVisibleMapRect(visibleMapRect: MKMapRect); cdecl;
    function visibleMapRect: MKMapRect; cdecl;
    [MethodName('setVisibleMapRect:animated:')]
    procedure setVisibleMapRectAnimated(mapRect: MKMapRect;
      animated: Boolean); cdecl;
    [MethodName('mapRectThatFits:')]
    function mapRectThatFits(mapRect: MKMapRect): MKMapRect; cdecl;
    [MethodName('setVisibleMapRect:edgePadding:animated:')]
    procedure setVisibleMapRectEdgePaddingAnimated(mapRect: MKMapRect;
      edgePadding: UIEdgeInsets; animated: Boolean); cdecl;
    [MethodName('mapRectThatFits:edgePadding:')]
    function mapRectThatFitsEdgePadding(mapRect: MKMapRect;
      edgePadding: UIEdgeInsets): MKMapRect; cdecl;
    [MethodName('setCamera:')]
    procedure setCamera(camera: MKMapCamera); cdecl;
    function camera: MKMapCamera; cdecl;
    [MethodName('setCamera:animated:')]
    procedure setCameraAnimated(camera: MKMapCamera; animated: Boolean); cdecl;
    [MethodName('setCameraZoomRange:')]
    procedure setCameraZoomRange(cameraZoomRange: MKMapCameraZoomRange); cdecl;
    function cameraZoomRange: MKMapCameraZoomRange; cdecl;
    [MethodName('setCameraZoomRange:animated:')]
    procedure setCameraZoomRangeAnimated(cameraZoomRange: MKMapCameraZoomRange;
      animated: Boolean); cdecl;
    [MethodName('setCameraBoundary:')]
    procedure setCameraBoundary(cameraBoundary: MKMapCameraBoundary); cdecl;
    function cameraBoundary: MKMapCameraBoundary; cdecl;
    [MethodName('setCameraBoundary:animated:')]
    procedure setCameraBoundaryAnimated(cameraBoundary: MKMapCameraBoundary;
      animated: Boolean); cdecl;
    function convertCoordinate(coordinate: CLLocationCoordinate2D;
      toPointToView: UIView): CGPoint; cdecl;
    function convertPoint(point: CGPoint; toCoordinateFromView: UIView)
      : CLLocationCoordinate2D; cdecl;
    function convertRegion(region: MKCoordinateRegion; toRectToView: UIView)
      : CGRect; cdecl;
    function convertRect(rect: CGRect; toRegionFromView: UIView)
      : MKCoordinateRegion; cdecl;
    procedure setZoomEnabled(zoomEnabled: Boolean); cdecl;
    function isZoomEnabled: Boolean; cdecl;
    procedure setScrollEnabled(scrollEnabled: Boolean); cdecl;
    function isScrollEnabled: Boolean; cdecl;
    procedure setRotateEnabled(rotateEnabled: Boolean); cdecl;
    function isRotateEnabled: Boolean; cdecl;
    procedure setPitchEnabled(pitchEnabled: Boolean); cdecl;
    function isPitchEnabled: Boolean; cdecl;
    procedure setShowsPitchControl(showsPitchControl: Boolean); cdecl;
    function showsPitchControl: Boolean; cdecl;
    procedure setShowsZoomControls(showsZoomControls: Boolean); cdecl;
    function showsZoomControls: Boolean; cdecl;
    procedure setShowsCompass(showsCompass: Boolean); cdecl;
    function showsCompass: Boolean; cdecl;
    procedure setShowsScale(showsScale: Boolean); cdecl;
    function showsScale: Boolean; cdecl;
    procedure setPointOfInterestFilter(pointOfInterestFilter
      : MKPointOfInterestFilter); cdecl;
    function pointOfInterestFilter: MKPointOfInterestFilter; cdecl;
    procedure setShowsPointsOfInterest(showsPointsOfInterest: Boolean); cdecl;
    function showsPointsOfInterest: Boolean; cdecl;
    procedure setShowsBuildings(showsBuildings: Boolean); cdecl;
    function showsBuildings: Boolean; cdecl;
    procedure setShowsTraffic(showsTraffic: Boolean); cdecl;
    function showsTraffic: Boolean; cdecl;
    procedure setShowsUserLocation(showsUserLocation: Boolean); cdecl;
    function showsUserLocation: Boolean; cdecl;
    function userLocation: MKUserLocation; cdecl;
    [MethodName('setUserTrackingMode:')]
    procedure setUserTrackingMode(userTrackingMode: MKUserTrackingMode); cdecl;
    function userTrackingMode: MKUserTrackingMode; cdecl;
    [MethodName('setUserTrackingMode:animated:')]
    procedure setUserTrackingModeAnimated(mode: MKUserTrackingMode;
      animated: Boolean); cdecl;
    function isUserLocationVisible: Boolean; cdecl;
    procedure addAnnotation(annotation: Pointer); cdecl;
    procedure addAnnotations(annotations: NSArray); cdecl;
    procedure removeAnnotation(annotation: Pointer); cdecl;
    procedure removeAnnotations(annotations: NSArray); cdecl;
    function annotations: NSArray; cdecl;
    function annotationsInMapRect(mapRect: MKMapRect): NSSet; cdecl;
    function viewForAnnotation(annotation: Pointer): MKAnnotationView; cdecl;
    [MethodName('dequeueReusableAnnotationViewWithIdentifier:')]
    function dequeueReusableAnnotationViewWithIdentifier(identifier: NSString)
      : MKAnnotationView; cdecl;
    [MethodName('dequeueReusableAnnotationViewWithIdentifier:forAnnotation:')]
    function dequeueReusableAnnotationViewWithIdentifierForAnnotation
      (identifier: NSString; forAnnotation: Pointer): MKAnnotationView; cdecl;
    procedure registerClass(viewClass: Pointer;
      forAnnotationViewWithReuseIdentifier: NSString); cdecl;
    procedure selectAnnotation(annotation: Pointer; animated: Boolean); cdecl;
    procedure deselectAnnotation(annotation: Pointer; animated: Boolean); cdecl;
    procedure setSelectedAnnotations(selectedAnnotations: NSArray); cdecl;
    function selectedAnnotations: NSArray; cdecl;
    function annotationVisibleRect: CGRect; cdecl;
    procedure showAnnotations(annotations: NSArray; animated: Boolean); cdecl;
    [MethodName('addOverlay:level:')]
    procedure addOverlayLevel(overlay: Pointer; level: MKOverlayLevel); cdecl;
    [MethodName('addOverlays:level:')]
    procedure addOverlaysLevel(overlays: NSArray; level: MKOverlayLevel); cdecl;
    procedure removeOverlay(overlay: Pointer); cdecl;
    procedure removeOverlays(overlays: NSArray); cdecl;
    [MethodName('insertOverlay:atIndex:level:')]
    procedure insertOverlayAtIndexLevel(overlay: Pointer; atIndex: NSUInteger;
      level: MKOverlayLevel); cdecl;
    [MethodName('insertOverlay:aboveOverlay:')]
    procedure insertOverlayAboveOverlay(overlay: Pointer;
      aboveOverlay: Pointer); cdecl;
    [MethodName('insertOverlay:belowOverlay:')]
    procedure insertOverlayBelowOverlay(overlay: Pointer;
      belowOverlay: Pointer); cdecl;
    procedure exchangeOverlay(overlay1: Pointer; withOverlay: Pointer); cdecl;
    function overlays: NSArray; cdecl;
    function overlaysInLevel(level: MKOverlayLevel): NSArray; cdecl;
    function rendererForOverlay(overlay: Pointer): MKOverlayRenderer; cdecl;
    function viewForOverlay(overlay: Pointer): MKOverlayView; cdecl;
    [MethodName('addOverlay:')]
    procedure addOverlay(overlay: Pointer); cdecl;
    [MethodName('addOverlays:')]
    procedure addOverlays(overlays: NSArray); cdecl;
    [MethodName('insertOverlay:atIndex:')]
    procedure insertOverlayAtIndex(overlay: Pointer;
      atIndex: NSUInteger); cdecl;
    procedure exchangeOverlayAtIndex(index1: NSUInteger;
      withOverlayAtIndex: NSUInteger); cdecl;
  end;

  TMKMapView = class(TOCGenericImport<MKMapViewClass, MKMapView>)
  end;

  PMKMapView = Pointer;

  MKMarkerAnnotationViewClass = interface(MKAnnotationViewClass)
    ['{67CBAF91-74BB-4500-90E1-6434060C1F3D}']
  end;

  MKMarkerAnnotationView = interface(MKAnnotationView)
    ['{7BB6AD99-E675-48C2-BC23-A1E4424CF532}']
    procedure setTitleVisibility(titleVisibility: MKFeatureVisibility); cdecl;
    function titleVisibility: MKFeatureVisibility; cdecl;
    procedure setSubtitleVisibility(subtitleVisibility
      : MKFeatureVisibility); cdecl;
    function subtitleVisibility: MKFeatureVisibility; cdecl;
    procedure setMarkerTintColor(markerTintColor: UIColor); cdecl;
    function markerTintColor: UIColor; cdecl;
    procedure setGlyphTintColor(glyphTintColor: UIColor); cdecl;
    function glyphTintColor: UIColor; cdecl;
    procedure setGlyphText(glyphText: NSString); cdecl;
    function glyphText: NSString; cdecl;
    procedure setGlyphImage(glyphImage: UIImage); cdecl;
    function glyphImage: UIImage; cdecl;
    procedure setSelectedGlyphImage(selectedGlyphImage: UIImage); cdecl;
    function selectedGlyphImage: UIImage; cdecl;
    procedure setAnimatesWhenAdded(animatesWhenAdded: Boolean); cdecl;
    function animatesWhenAdded: Boolean; cdecl;
  end;

  TMKMarkerAnnotationView = class(TOCGenericImport<MKMarkerAnnotationViewClass,
    MKMarkerAnnotationView>)
  end;

  PMKMarkerAnnotationView = Pointer;

  MKPinAnnotationViewClass = interface(MKAnnotationViewClass)
    ['{8E4BA323-7761-491F-811A-A04FC715BC8A}']
    { class } function redPinColor: UIColor; cdecl;
    { class } function greenPinColor: UIColor; cdecl;
    { class } function purplePinColor: UIColor; cdecl;
  end;

  MKPinAnnotationView = interface(MKAnnotationView)
    ['{F38CFCDB-3754-4F6E-A8EE-25FC9EB59DDD}']
    procedure setPinTintColor(pinTintColor: UIColor); cdecl;
    function pinTintColor: UIColor; cdecl;
    procedure setAnimatesDrop(animatesDrop: Boolean); cdecl;
    function animatesDrop: Boolean; cdecl;
    procedure setPinColor(pinColor: MKPinAnnotationColor); cdecl;
    function pinColor: MKPinAnnotationColor; cdecl;
  end;

  TMKPinAnnotationView = class(TOCGenericImport<MKPinAnnotationViewClass,
    MKPinAnnotationView>)
  end;

  PMKPinAnnotationView = Pointer;

  MKUserLocationViewClass = interface(MKAnnotationViewClass)
    ['{AE89CC1D-6B70-4CB2-9C45-574A643CAAFB}']
  end;

  MKUserLocationView = interface(MKAnnotationView)
    ['{1C2D0946-352C-401B-BC4F-080579145D79}']
  end;

  TMKUserLocationView = class(TOCGenericImport<MKUserLocationViewClass,
    MKUserLocationView>)
  end;

  PMKUserLocationView = Pointer;

  MKCompassButtonClass = interface(UIViewClass)
    ['{0A682DD3-AFA9-4341-A5CF-6D607DBEAE4C}']
    { class } function compassButtonWithMapView(mapView: MKMapView)
      : Pointer { instancetype }; cdecl;
  end;

  MKCompassButton = interface(UIView)
    ['{01593B53-9C7C-4C1D-A694-B2A7BA974971}']
    procedure setMapView(mapView: MKMapView); cdecl;
    function mapView: MKMapView; cdecl;
    procedure setCompassVisibility(compassVisibility
      : MKFeatureVisibility); cdecl;
    function compassVisibility: MKFeatureVisibility; cdecl;
  end;

  TMKCompassButton = class(TOCGenericImport<MKCompassButtonClass,
    MKCompassButton>)
  end;

  PMKCompassButton = Pointer;

  MKShapeClass = interface(NSObjectClass)
    ['{FF2FF61D-9BFC-41C7-B60A-8A4ECCD8BB9B}']
  end;

  MKShape = interface(NSObject)
    ['{A96EA289-A809-49BD-97FE-C28D2BB00161}']
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setSubtitle(subtitle: NSString); cdecl;
    function subtitle: NSString; cdecl;
  end;

  TMKShape = class(TOCGenericImport<MKShapeClass, MKShape>)
  end;

  PMKShape = Pointer;

  MKPointAnnotationClass = interface(MKShapeClass)
    ['{79268227-0D38-4B2D-BF04-F2372DDB49E9}']
  end;

  MKPointAnnotation = interface(MKShape)
    ['{1C2C73B6-D285-448E-8023-D70EDB514B2B}']
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithCoordinate:')]
    function initWithCoordinate(coordinate: CLLocationCoordinate2D)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithCoordinate:title:subtitle:')]
    function initWithCoordinateTitleSubtitle(coordinate: CLLocationCoordinate2D;
      title: NSString; subtitle: NSString): Pointer { instancetype }; cdecl;
    procedure setCoordinate(coordinate: CLLocationCoordinate2D); cdecl;
    function coordinate: CLLocationCoordinate2D; cdecl;
  end;

  TMKPointAnnotation = class(TOCGenericImport<MKPointAnnotationClass,
    MKPointAnnotation>)
  end;

  PMKPointAnnotation = Pointer;

  MKMultiPointClass = interface(MKShapeClass)
    ['{F44FEACA-6C01-43A4-AAA0-08FFA1C20C39}']
  end;

  MKMultiPoint = interface(MKShape)
    ['{86091B95-E973-43F5-B8A1-0DE0AA2EB5BF}']
    function points: PMKMapPoint; cdecl;
    function pointCount: NSUInteger; cdecl;
    procedure getCoordinates(coords: PCLLocationCoordinate2D;
      range: NSRange); cdecl;
    function locationAtPointIndex(index: NSUInteger): CGFloat; cdecl;
    function locationsAtPointIndexes(indexes: NSIndexSet): NSArray; cdecl;
  end;

  TMKMultiPoint = class(TOCGenericImport<MKMultiPointClass, MKMultiPoint>)
  end;

  PMKMultiPoint = Pointer;

  MKPolygonClass = interface(MKMultiPointClass)
    ['{3F448056-7971-432D-BFE6-099508D29F83}']
    [MethodName('polygonWithPoints:count:')]
    { class } function polygonWithPointsCount(points: PMKMapPoint;
      count: NSUInteger): Pointer { instancetype }; cdecl;
    [MethodName('polygonWithPoints:count:interiorPolygons:')]
    { class } function polygonWithPointsCountInteriorPolygons
      (points: PMKMapPoint; count: NSUInteger; interiorPolygons: NSArray)
      : Pointer { instancetype }; cdecl;
    [MethodName('polygonWithCoordinates:count:')]
    { class } function polygonWithCoordinatesCount
      (coords: PCLLocationCoordinate2D; count: NSUInteger)
      : Pointer { instancetype }; cdecl;
    [MethodName('polygonWithCoordinates:count:interiorPolygons:')]
    { class } function polygonWithCoordinatesCountInteriorPolygons
      (coords: PCLLocationCoordinate2D; count: NSUInteger;
      interiorPolygons: NSArray): Pointer { instancetype }; cdecl;
  end;

  MKPolygon = interface(MKMultiPoint)
    ['{0993D2A4-7EE4-40A8-99E4-F3558506A3F1}']
    function interiorPolygons: NSArray; cdecl;
  end;

  TMKPolygon = class(TOCGenericImport<MKPolygonClass, MKPolygon>)
  end;

  PMKPolygon = Pointer;

  MKMultiPolygonClass = interface(MKShapeClass)
    ['{5EF25B9D-C119-423C-A25C-C65EF460F99A}']
  end;

  MKMultiPolygon = interface(MKShape)
    ['{C38CBA56-F902-439F-8F6E-F21ED1A47775}']
    function initWithPolygons(polygons: NSArray)
      : Pointer { instancetype }; cdecl;
    function polygons: NSArray; cdecl;
  end;

  TMKMultiPolygon = class(TOCGenericImport<MKMultiPolygonClass, MKMultiPolygon>)
  end;

  PMKMultiPolygon = Pointer;

  MKOverlayPathRendererClass = interface(MKOverlayRendererClass)
    ['{37ABC8B7-1CB5-4AA2-A2DB-98A40244DAAB}']
  end;

  MKOverlayPathRenderer = interface(MKOverlayRenderer)
    ['{F0476215-0183-4B25-9861-4DDA3DA3A466}']
    procedure setFillColor(fillColor: UIColor); cdecl;
    function fillColor: UIColor; cdecl;
    procedure setStrokeColor(strokeColor: UIColor); cdecl;
    function strokeColor: UIColor; cdecl;
    procedure setLineWidth(lineWidth: CGFloat); cdecl;
    function lineWidth: CGFloat; cdecl;
    procedure setLineJoin(lineJoin: CGLineJoin); cdecl;
    function lineJoin: CGLineJoin; cdecl;
    procedure setLineCap(lineCap: CGLineCap); cdecl;
    function lineCap: CGLineCap; cdecl;
    procedure setMiterLimit(miterLimit: CGFloat); cdecl;
    function miterLimit: CGFloat; cdecl;
    procedure setLineDashPhase(lineDashPhase: CGFloat); cdecl;
    function lineDashPhase: CGFloat; cdecl;
    procedure setLineDashPattern(lineDashPattern: NSArray); cdecl;
    function lineDashPattern: NSArray; cdecl;
    procedure setShouldRasterize(shouldRasterize: Boolean); cdecl;
    function shouldRasterize: Boolean; cdecl;
    procedure createPath; cdecl;
    procedure setPath(path: CGPathRef); cdecl;
    function path: CGPathRef; cdecl;
    procedure invalidatePath; cdecl;
    procedure applyStrokePropertiesToContext(context: CGContextRef;
      atZoomScale: MKZoomScale); cdecl;
    procedure applyFillPropertiesToContext(context: CGContextRef;
      atZoomScale: MKZoomScale); cdecl;
    procedure strokePath(path: CGPathRef; inContext: CGContextRef); cdecl;
    procedure fillPath(path: CGPathRef; inContext: CGContextRef); cdecl;
  end;

  TMKOverlayPathRenderer = class(TOCGenericImport<MKOverlayPathRendererClass,
    MKOverlayPathRenderer>)
  end;

  PMKOverlayPathRenderer = Pointer;

  MKMultiPolygonRendererClass = interface(MKOverlayPathRendererClass)
    ['{F5BC3ECB-1BAF-46D6-9312-F47244071BCC}']
  end;

  MKMultiPolygonRenderer = interface(MKOverlayPathRenderer)
    ['{67179993-DF6C-42EC-B4CE-3221F36C1F1C}']
    function initWithMultiPolygon(multiPolygon: MKMultiPolygon)
      : Pointer { instancetype }; cdecl;
    function multiPolygon: MKMultiPolygon; cdecl;
  end;

  TMKMultiPolygonRenderer = class(TOCGenericImport<MKMultiPolygonRendererClass,
    MKMultiPolygonRenderer>)
  end;

  PMKMultiPolygonRenderer = Pointer;

  MKPolylineClass = interface(MKMultiPointClass)
    ['{6B86D92F-3F53-467D-ADCC-609BD9306101}']
    { class } function polylineWithPoints(points: PMKMapPoint;
      count: NSUInteger): Pointer { instancetype }; cdecl;
    { class } function polylineWithCoordinates(coords: PCLLocationCoordinate2D;
      count: NSUInteger): Pointer { instancetype }; cdecl;
  end;

  MKPolyline = interface(MKMultiPoint)
    ['{12C16800-C0D4-4C50-A338-E78EB62C651C}']
  end;

  TMKPolyline = class(TOCGenericImport<MKPolylineClass, MKPolyline>)
  end;

  PMKPolyline = Pointer;

  MKMultiPolylineClass = interface(MKShapeClass)
    ['{534E4DC6-9198-4803-A9ED-4D5A8FA350BD}']
  end;

  MKMultiPolyline = interface(MKShape)
    ['{AAE6C61E-7A6F-4305-9CC7-281E4E66C4DD}']
    function initWithPolylines(polylines: NSArray)
      : Pointer { instancetype }; cdecl;
    function polylines: NSArray; cdecl;
  end;

  TMKMultiPolyline = class(TOCGenericImport<MKMultiPolylineClass,
    MKMultiPolyline>)
  end;

  PMKMultiPolyline = Pointer;

  MKMultiPolylineRendererClass = interface(MKOverlayPathRendererClass)
    ['{C5C064CB-6E91-47C3-9CC2-1BC302B3C791}']
  end;

  MKMultiPolylineRenderer = interface(MKOverlayPathRenderer)
    ['{0891948A-23D9-4E50-8949-8C47CC851822}']
    function initWithMultiPolyline(multiPolyline: MKMultiPolyline)
      : Pointer { instancetype }; cdecl;
    function multiPolyline: MKMultiPolyline; cdecl;
  end;

  TMKMultiPolylineRenderer = class
    (TOCGenericImport<MKMultiPolylineRendererClass, MKMultiPolylineRenderer>)
  end;

  PMKMultiPolylineRenderer = Pointer;

  MKCircleClass = interface(MKShapeClass)
    ['{AECF47A0-0F67-4A7C-B824-DFB98E5A367F}']
    { class } function circleWithCenterCoordinate(coord: CLLocationCoordinate2D;
      radius: CLLocationDistance): Pointer { instancetype }; cdecl;
    { class } function circleWithMapRect(mapRect: MKMapRect)
      : Pointer { instancetype }; cdecl;
  end;

  MKCircle = interface(MKShape)
    ['{AED9E1AE-4811-4380-AB81-BF2E295AA9C5}']
    function coordinate: CLLocationCoordinate2D; cdecl;
    function radius: CLLocationDistance; cdecl;
    function boundingMapRect: MKMapRect; cdecl;
  end;

  TMKCircle = class(TOCGenericImport<MKCircleClass, MKCircle>)
  end;

  PMKCircle = Pointer;

  MKGeodesicPolylineClass = interface(MKPolylineClass)
    ['{2FADB8E0-E224-4F33-92BF-F7871A5D7271}']
    { class } function polylineWithPoints(points: PMKMapPoint;
      count: NSUInteger): Pointer { instancetype }; cdecl;
    { class } function polylineWithCoordinates(coords: PCLLocationCoordinate2D;
      count: NSUInteger): Pointer { instancetype }; cdecl;
  end;

  MKGeodesicPolyline = interface(MKPolyline)
    ['{C9D88C23-E9B4-4BF4-92EF-AF48F9662F5B}']
  end;

  TMKGeodesicPolyline = class(TOCGenericImport<MKGeodesicPolylineClass,
    MKGeodesicPolyline>)
  end;

  PMKGeodesicPolyline = Pointer;

  MKPolylineRendererClass = interface(MKOverlayPathRendererClass)
    ['{651CC6B5-372C-459D-B0B1-C645B868689F}']
  end;

  MKPolylineRenderer = interface(MKOverlayPathRenderer)
    ['{535594CB-6FBA-429D-B8DB-A4B79ACD39D4}']
    function initWithPolyline(polyline: MKPolyline)
      : Pointer { instancetype }; cdecl;
    function polyline: MKPolyline; cdecl;
    procedure setStrokeStart(strokeStart: CGFloat); cdecl;
    function strokeStart: CGFloat; cdecl;
    procedure setStrokeEnd(strokeEnd: CGFloat); cdecl;
    function strokeEnd: CGFloat; cdecl;
  end;

  TMKPolylineRenderer = class(TOCGenericImport<MKPolylineRendererClass,
    MKPolylineRenderer>)
  end;

  PMKPolylineRenderer = Pointer;

  MKGradientPolylineRendererClass = interface(MKPolylineRendererClass)
    ['{CAE6B242-2E08-40F0-99AF-39BEC73DA4E3}']
  end;

  MKGradientPolylineRenderer = interface(MKPolylineRenderer)
    ['{7AA98875-DAC5-4982-BC29-15CAE44EB69A}']
    function locations: NSArray; cdecl;
    function colors: NSArray; cdecl;
    procedure setColors(colors: NSArray; atLocations: NSArray); cdecl;
  end;

  TMKGradientPolylineRenderer = class
    (TOCGenericImport<MKGradientPolylineRendererClass,
    MKGradientPolylineRenderer>)
  end;

  PMKGradientPolylineRenderer = Pointer;

  MKPolygonRendererClass = interface(MKOverlayPathRendererClass)
    ['{06F962C6-FD5F-46EF-8FEA-7E0BA21AD7C5}']
  end;

  MKPolygonRenderer = interface(MKOverlayPathRenderer)
    ['{3B827BAC-5F03-4237-B56B-216D669F1A2A}']
    function initWithPolygon(polygon: MKPolygon)
      : Pointer { instancetype }; cdecl;
    function polygon: MKPolygon; cdecl;
    procedure setStrokeStart(strokeStart: CGFloat); cdecl;
    function strokeStart: CGFloat; cdecl;
    procedure setStrokeEnd(strokeEnd: CGFloat); cdecl;
    function strokeEnd: CGFloat; cdecl;
  end;

  TMKPolygonRenderer = class(TOCGenericImport<MKPolygonRendererClass,
    MKPolygonRenderer>)
  end;

  PMKPolygonRenderer = Pointer;

  MKCircleRendererClass = interface(MKOverlayPathRendererClass)
    ['{4B6E8E94-CDBD-42EC-99E5-DDB9DB331569}']
  end;

  MKCircleRenderer = interface(MKOverlayPathRenderer)
    ['{A99C5336-6BEA-4B92-8EA3-7F7498C721B3}']
    function initWithCircle(circle: MKCircle): Pointer { instancetype }; cdecl;
    function circle: MKCircle; cdecl;
    procedure setStrokeStart(strokeStart: CGFloat); cdecl;
    function strokeStart: CGFloat; cdecl;
    procedure setStrokeEnd(strokeEnd: CGFloat); cdecl;
    function strokeEnd: CGFloat; cdecl;
  end;

  TMKCircleRenderer = class(TOCGenericImport<MKCircleRendererClass,
    MKCircleRenderer>)
  end;

  PMKCircleRenderer = Pointer;

  MKLocalPointsOfInterestRequestClass = interface(NSObjectClass)
    ['{45277CB8-7B01-4EC2-AE0E-8716718E70EB}']
  end;

  MKLocalPointsOfInterestRequest = interface(NSObject)
    ['{55872734-30A6-48F9-AAFD-199D9CF6981D}']
    function initWithCenterCoordinate(coordinate: CLLocationCoordinate2D;
      radius: CLLocationDistance): Pointer { instancetype }; cdecl;
    function initWithCoordinateRegion(region: MKCoordinateRegion)
      : Pointer { instancetype }; cdecl;
    function coordinate: CLLocationCoordinate2D; cdecl;
    function radius: CLLocationDistance; cdecl;
    function region: MKCoordinateRegion; cdecl;
    procedure setPointOfInterestFilter(pointOfInterestFilter
      : MKPointOfInterestFilter); cdecl;
    function pointOfInterestFilter: MKPointOfInterestFilter; cdecl;
  end;

  TMKLocalPointsOfInterestRequest = class
    (TOCGenericImport<MKLocalPointsOfInterestRequestClass,
    MKLocalPointsOfInterestRequest>)
  end;

  PMKLocalPointsOfInterestRequest = Pointer;

  MKLocalSearchRequestClass = interface(NSObjectClass)
    ['{76ED42DB-1160-42E8-B639-BC6E2A400C71}']
  end;

  MKLocalSearchRequest = interface(NSObject)
    ['{5735452B-2F6F-409A-837D-F0E8CB711E40}']
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithNaturalLanguageQuery:')]
    function initWithNaturalLanguageQuery(naturalLanguageQuery: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithNaturalLanguageQuery:region:')]
    function initWithNaturalLanguageQueryRegion(naturalLanguageQuery: NSString;
      region: MKCoordinateRegion): Pointer { instancetype }; cdecl;
    procedure setNaturalLanguageQuery(naturalLanguageQuery: NSString); cdecl;
    function naturalLanguageQuery: NSString; cdecl;
    procedure setRegion(region: MKCoordinateRegion); cdecl;
    function region: MKCoordinateRegion; cdecl;
    procedure setResultTypes(resultTypes: MKLocalSearchResultType); cdecl;
    function resultTypes: MKLocalSearchResultType; cdecl;
    procedure setPointOfInterestFilter(pointOfInterestFilter
      : MKPointOfInterestFilter); cdecl;
    function pointOfInterestFilter: MKPointOfInterestFilter; cdecl;
    function initWithCompletion(completion: MKLocalSearchCompletion)
      : Pointer { instancetype }; cdecl;
  end;

  TMKLocalSearchRequest = class(TOCGenericImport<MKLocalSearchRequestClass,
    MKLocalSearchRequest>)
  end;

  PMKLocalSearchRequest = Pointer;

  MKLocalSearchResponseClass = interface(NSObjectClass)
    ['{D95FC10D-4F32-4428-B23B-A8B485802FC9}']
  end;

  MKLocalSearchResponse = interface(NSObject)
    ['{B77A81A2-1AF5-4F86-9C2D-B06961077AEF}']
    function mapItems: NSArray; cdecl;
    function boundingRegion: MKCoordinateRegion; cdecl;
  end;

  TMKLocalSearchResponse = class(TOCGenericImport<MKLocalSearchResponseClass,
    MKLocalSearchResponse>)
  end;

  PMKLocalSearchResponse = Pointer;

  MKLocalSearchClass = interface(NSObjectClass)
    ['{FEF12D2B-51DC-4BE4-AD23-45B3E71B869D}']
  end;

  MKLocalSearch = interface(NSObject)
    ['{0BC53BF2-A9F4-4BA4-9C0B-2E2418CFADAE}']
    function initWithRequest(request: MKLocalSearchRequest)
      : Pointer { instancetype }; cdecl;
    function initWithPointsOfInterestRequest
      (request: MKLocalPointsOfInterestRequest)
      : Pointer { instancetype }; cdecl;
    procedure startWithCompletionHandler(completionHandler
      : MKLocalSearchCompletionHandler); cdecl;
    procedure cancel; cdecl;
    function isSearching: Boolean; cdecl;
  end;

  TMKLocalSearch = class(TOCGenericImport<MKLocalSearchClass, MKLocalSearch>)
  end;

  PMKLocalSearch = Pointer;

  MKLocalSearchCompletionClass = interface(NSObjectClass)
    ['{82705F9D-06C3-420E-AC30-1DC338F21966}']
  end;

  MKLocalSearchCompletion = interface(NSObject)
    ['{C81E769B-A7EC-4046-9724-1E0A5C2D8743}']
    function title: NSString; cdecl;
    function titleHighlightRanges: NSArray; cdecl;
    function subtitle: NSString; cdecl;
    function subtitleHighlightRanges: NSArray; cdecl;
  end;

  TMKLocalSearchCompletion = class
    (TOCGenericImport<MKLocalSearchCompletionClass, MKLocalSearchCompletion>)
  end;

  PMKLocalSearchCompletion = Pointer;

  MKLocalSearchCompleterClass = interface(NSObjectClass)
    ['{A51685D1-E8C2-4707-AA6F-E3CC61FBB9E7}']
  end;

  MKLocalSearchCompleter = interface(NSObject)
    ['{90B78582-5FC7-45CE-9B3C-5D9BF3A0DD38}']
    procedure setQueryFragment(queryFragment: NSString); cdecl;
    function queryFragment: NSString; cdecl;
    procedure setRegion(region: MKCoordinateRegion); cdecl;
    function region: MKCoordinateRegion; cdecl;
    procedure setFilterType(filterType: MKSearchCompletionFilterType); cdecl;
    function filterType: MKSearchCompletionFilterType; cdecl;
    procedure setResultTypes(resultTypes
      : MKLocalSearchCompleterResultType); cdecl;
    function resultTypes: MKLocalSearchCompleterResultType; cdecl;
    procedure setPointOfInterestFilter(pointOfInterestFilter
      : MKPointOfInterestFilter); cdecl;
    function pointOfInterestFilter: MKPointOfInterestFilter; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function results: NSArray; cdecl;
    function isSearching: Boolean; cdecl;
    procedure cancel; cdecl;
  end;

  TMKLocalSearchCompleter = class(TOCGenericImport<MKLocalSearchCompleterClass,
    MKLocalSearchCompleter>)
  end;

  PMKLocalSearchCompleter = Pointer;

  MKDirectionsRequestClass = interface(NSObjectClass)
    ['{F1159842-81EB-4FED-9783-B70D5FDFD363}']
    { class } function isDirectionsRequestURL(url: NSURL): Boolean; cdecl;
  end;

  MKDirectionsRequest = interface(NSObject)
    ['{D7DC8FE9-AC23-417F-977D-54E7ED79B7AC}']
    function source: MKMapItem; cdecl;
    procedure setSource(source: MKMapItem); cdecl;
    function destination: MKMapItem; cdecl;
    procedure setDestination(destination: MKMapItem); cdecl;
    procedure setTransportType(transportType: MKDirectionsTransportType); cdecl;
    function transportType: MKDirectionsTransportType; cdecl;
    procedure setRequestsAlternateRoutes(requestsAlternateRoutes
      : Boolean); cdecl;
    function requestsAlternateRoutes: Boolean; cdecl;
    procedure setDepartureDate(departureDate: NSDate); cdecl;
    function departureDate: NSDate; cdecl;
    procedure setArrivalDate(arrivalDate: NSDate); cdecl;
    function arrivalDate: NSDate; cdecl;
    procedure setTollPreference(tollPreference
      : MKDirectionsRoutePreference); cdecl;
    function tollPreference: MKDirectionsRoutePreference; cdecl;
    procedure setHighwayPreference(highwayPreference
      : MKDirectionsRoutePreference); cdecl;
    function highwayPreference: MKDirectionsRoutePreference; cdecl;
    function initWithContentsOfURL(url: NSURL): Pointer { instancetype }; cdecl;
  end;

  TMKDirectionsRequest = class(TOCGenericImport<MKDirectionsRequestClass,
    MKDirectionsRequest>)
  end;

  PMKDirectionsRequest = Pointer;

  MKDirectionsResponseClass = interface(NSObjectClass)
    ['{E9205E76-DDB9-44F1-AC01-CED5EB505645}']
  end;

  MKDirectionsResponse = interface(NSObject)
    ['{281100F9-DDD0-40AD-B941-22B0874DA596}']
    function source: MKMapItem; cdecl;
    function destination: MKMapItem; cdecl;
    function routes: NSArray; cdecl;
  end;

  TMKDirectionsResponse = class(TOCGenericImport<MKDirectionsResponseClass,
    MKDirectionsResponse>)
  end;

  PMKDirectionsResponse = Pointer;

  MKETAResponseClass = interface(NSObjectClass)
    ['{30E6BA30-614E-4C52-BC10-3D797AE3443C}']
  end;

  MKETAResponse = interface(NSObject)
    ['{FF885A9A-448E-410C-9713-CC5D16A3E646}']
    function source: MKMapItem; cdecl;
    function destination: MKMapItem; cdecl;
    function expectedTravelTime: NSTimeInterval; cdecl;
    function distance: CLLocationDistance; cdecl;
    function expectedArrivalDate: NSDate; cdecl;
    function expectedDepartureDate: NSDate; cdecl;
    function transportType: MKDirectionsTransportType; cdecl;
  end;

  TMKETAResponse = class(TOCGenericImport<MKETAResponseClass, MKETAResponse>)
  end;

  PMKETAResponse = Pointer;

  MKDirectionsClass = interface(NSObjectClass)
    ['{AB695382-A68B-4123-9E59-20FE12A12516}']
  end;

  MKDirections = interface(NSObject)
    ['{697B06F8-12B4-488A-AFB1-B31A14CB0907}']
    function initWithRequest(request: MKDirectionsRequest)
      : Pointer { instancetype }; cdecl;
    procedure calculateDirectionsWithCompletionHandler(completionHandler
      : MKDirectionsHandler); cdecl;
    procedure calculateETAWithCompletionHandler(completionHandler
      : MKETAHandler); cdecl;
    procedure cancel; cdecl;
    function isCalculating: Boolean; cdecl;
  end;

  TMKDirections = class(TOCGenericImport<MKDirectionsClass, MKDirections>)
  end;

  PMKDirections = Pointer;

  MKRouteClass = interface(NSObjectClass)
    ['{691F379F-44A6-4255-8147-7823E653D282}']
  end;

  MKRoute = interface(NSObject)
    ['{ACFAFF32-C3FC-4E96-8BA7-B510A984C8E8}']
    function name: NSString; cdecl;
    function advisoryNotices: NSArray; cdecl;
    function distance: CLLocationDistance; cdecl;
    function expectedTravelTime: NSTimeInterval; cdecl;
    function transportType: MKDirectionsTransportType; cdecl;
    function polyline: MKPolyline; cdecl;
    function steps: NSArray; cdecl;
    function hasTolls: Boolean; cdecl;
    function hasHighways: Boolean; cdecl;
  end;

  TMKRoute = class(TOCGenericImport<MKRouteClass, MKRoute>)
  end;

  PMKRoute = Pointer;

  MKRouteStepClass = interface(NSObjectClass)
    ['{99539301-D827-425A-BCDE-DCB69B0FBEED}']
  end;

  MKRouteStep = interface(NSObject)
    ['{A7B6285F-8A0C-4FC9-B4F5-04930B3A0796}']
    function instructions: NSString; cdecl;
    function notice: NSString; cdecl;
    function polyline: MKPolyline; cdecl;
    function distance: CLLocationDistance; cdecl;
    function transportType: MKDirectionsTransportType; cdecl;
  end;

  TMKRouteStep = class(TOCGenericImport<MKRouteStepClass, MKRouteStep>)
  end;

  PMKRouteStep = Pointer;

  MKMapSnapshotOptionsClass = interface(NSObjectClass)
    ['{94E1E766-5EB8-4410-9FF9-0FE72930164D}']
  end;

  MKMapSnapshotOptions = interface(NSObject)
    ['{408D54B9-D7F1-498B-AF49-E37ADF2E338A}']
    procedure setCamera(camera: MKMapCamera); cdecl;
    function camera: MKMapCamera; cdecl;
    procedure setMapRect(mapRect: MKMapRect); cdecl;
    function mapRect: MKMapRect; cdecl;
    procedure setRegion(region: MKCoordinateRegion); cdecl;
    function region: MKCoordinateRegion; cdecl;
    procedure setMapType(mapType: MKMapType); cdecl;
    function mapType: MKMapType; cdecl;
    procedure setPointOfInterestFilter(pointOfInterestFilter
      : MKPointOfInterestFilter); cdecl;
    function pointOfInterestFilter: MKPointOfInterestFilter; cdecl;
    procedure setShowsPointsOfInterest(showsPointsOfInterest: Boolean); cdecl;
    function showsPointsOfInterest: Boolean; cdecl;
    procedure setShowsBuildings(showsBuildings: Boolean); cdecl;
    function showsBuildings: Boolean; cdecl;
    procedure setSize(size: CGSize); cdecl;
    function size: CGSize; cdecl;
    procedure setScale(scale: CGFloat); cdecl;
    function scale: CGFloat; cdecl;
    procedure setTraitCollection(traitCollection: UITraitCollection); cdecl;
    function traitCollection: UITraitCollection; cdecl;
  end;

  TMKMapSnapshotOptions = class(TOCGenericImport<MKMapSnapshotOptionsClass,
    MKMapSnapshotOptions>)
  end;

  PMKMapSnapshotOptions = Pointer;

  MKMapSnapshotClass = interface(NSObjectClass)
    ['{E30B24C0-0AF9-419C-9112-357CC1F02117}']
  end;

  MKMapSnapshot = interface(NSObject)
    ['{53D8C2EB-5030-4C06-9B5B-2298D9389E72}']
    function image: UIImage; cdecl;
    function pointForCoordinate(coordinate: CLLocationCoordinate2D)
      : CGPoint; cdecl;
    function traitCollection: UITraitCollection; cdecl;
  end;

  TMKMapSnapshot = class(TOCGenericImport<MKMapSnapshotClass, MKMapSnapshot>)
  end;

  PMKMapSnapshot = Pointer;

  MKMapSnapshotterClass = interface(NSObjectClass)
    ['{96AC415D-8A53-44EC-9A8E-9330345DCFA0}']
  end;

  MKMapSnapshotter = interface(NSObject)
    ['{75355EC4-81AB-4123-95BC-506072E7075F}']
    function initWithOptions(options: MKMapSnapshotOptions)
      : Pointer { instancetype }; cdecl;
    procedure startWithCompletionHandler(completionHandler
      : MKMapSnapshotCompletionHandler); cdecl;
    procedure startWithQueue(queue: dispatch_queue_t;
      completionHandler: MKMapSnapshotCompletionHandler); cdecl;
    procedure cancel; cdecl;
    function isLoading: Boolean; cdecl;
  end;

  TMKMapSnapshotter = class(TOCGenericImport<MKMapSnapshotterClass,
    MKMapSnapshotter>)
  end;

  PMKMapSnapshotter = Pointer;

  MKTileOverlayClass = interface(NSObjectClass)
    ['{3B3C88A1-8233-4368-896F-889C77E7D7FB}']
  end;

  MKTileOverlay = interface(NSObject)
    ['{ADF3229D-A597-4CF2-A652-93CB699C69CE}']
    function initWithURLTemplate(URLTemplate: NSString)
      : Pointer { instancetype }; cdecl;
    procedure setTileSize(tileSize: CGSize); cdecl;
    function tileSize: CGSize; cdecl;
    procedure setGeometryFlipped(geometryFlipped: Boolean); cdecl;
    function isGeometryFlipped: Boolean; cdecl;
    procedure setMinimumZ(minimumZ: NSInteger); cdecl;
    function minimumZ: NSInteger; cdecl;
    procedure setMaximumZ(maximumZ: NSInteger); cdecl;
    function maximumZ: NSInteger; cdecl;
    function URLTemplate: NSString; cdecl;
    procedure setCanReplaceMapContent(canReplaceMapContent: Boolean); cdecl;
    function canReplaceMapContent: Boolean; cdecl;
    function URLForTilePath(path: MKTileOverlayPath): NSURL; cdecl;
    procedure loadTileAtPath(path: MKTileOverlayPath;
      result: TMapKitResult); cdecl;
  end;

  TMKTileOverlay = class(TOCGenericImport<MKTileOverlayClass, MKTileOverlay>)
  end;

  PMKTileOverlay = Pointer;

  MKTileOverlayRendererClass = interface(MKOverlayRendererClass)
    ['{B36C41FD-C636-4E5A-9969-32E80530AF7F}']
  end;

  MKTileOverlayRenderer = interface(MKOverlayRenderer)
    ['{A5A62D4E-4369-4E2D-968D-5F2BAB6A933D}']
    function initWithTileOverlay(overlay: MKTileOverlay)
      : Pointer { instancetype }; cdecl;
    procedure reloadData; cdecl;
  end;

  TMKTileOverlayRenderer = class(TOCGenericImport<MKTileOverlayRendererClass,
    MKTileOverlayRenderer>)
  end;

  PMKTileOverlayRenderer = Pointer;

  MKGeoJSONDecoderClass = interface(NSObjectClass)
    ['{36D4CED9-6964-409F-88ED-A96D9A3F92C3}']
  end;

  MKGeoJSONDecoder = interface(NSObject)
    ['{0972881C-5A5F-4FA6-BC62-F34464413C44}']
    function geoJSONObjectsWithData(data: NSData; error: NSError)
      : NSArray; cdecl;
  end;

  TMKGeoJSONDecoder = class(TOCGenericImport<MKGeoJSONDecoderClass,
    MKGeoJSONDecoder>)
  end;

  PMKGeoJSONDecoder = Pointer;

  MKGeoJSONFeatureClass = interface(NSObjectClass)
    ['{378D266D-44C7-43A8-887F-A071D5C44696}']
  end;

  MKGeoJSONFeature = interface(NSObject)
    ['{40288776-1152-49DB-9980-49EF74061370}']
    function identifier: NSString; cdecl;
    function properties: NSData; cdecl;
    function geometry: NSArray; cdecl;
  end;

  TMKGeoJSONFeature = class(TOCGenericImport<MKGeoJSONFeatureClass,
    MKGeoJSONFeature>)
  end;

  PMKGeoJSONFeature = Pointer;

  MKPitchControlClass = interface(UIViewClass)
    ['{DF3BE1C1-6ED0-4A26-8362-B4136BEC21E2}']
    { class } function pitchControlWithMapView(mapView: MKMapView)
      : Pointer { instancetype }; cdecl;
  end;

  MKPitchControl = interface(UIView)
    ['{20BC10D9-261D-4D24-AF99-8FBD6871ECFC}']
    procedure setMapView(mapView: MKMapView); cdecl;
    function mapView: MKMapView; cdecl;
  end;

  TMKPitchControl = class(TOCGenericImport<MKPitchControlClass, MKPitchControl>)
  end;

  PMKPitchControl = Pointer;

  MKZoomControlClass = interface(UIViewClass)
    ['{C0C2A553-48F6-4E8B-A3B8-459D84F7951F}']
    { class } function zoomControlWithMapView(mapView: MKMapView)
      : Pointer { instancetype }; cdecl;
  end;

  MKZoomControl = interface(UIView)
    ['{59B98A84-51A7-468E-9DF4-80B09F104FC4}']
    procedure setMapView(mapView: MKMapView); cdecl;
    function mapView: MKMapView; cdecl;
  end;

  TMKZoomControl = class(TOCGenericImport<MKZoomControlClass, MKZoomControl>)
  end;

  PMKZoomControl = Pointer;

  MKHybridMapConfigurationClass = interface(MKMapConfigurationClass)
    ['{7B46EE99-DB92-4DC8-8CDA-D8A2C51E94E4}']
  end;

  MKHybridMapConfiguration = interface(MKMapConfiguration)
    ['{F6CC469D-158C-4EFE-8217-F5A76CC99641}']
    function initWithElevationStyle(elevationStyle: MKMapElevationStyle)
      : Pointer { instancetype }; cdecl;
    procedure setPointOfInterestFilter(pointOfInterestFilter
      : MKPointOfInterestFilter); cdecl;
    function pointOfInterestFilter: MKPointOfInterestFilter; cdecl;
    procedure setShowsTraffic(showsTraffic: Boolean); cdecl;
    function showsTraffic: Boolean; cdecl;
  end;

  TMKHybridMapConfiguration = class
    (TOCGenericImport<MKHybridMapConfigurationClass, MKHybridMapConfiguration>)
  end;

  PMKHybridMapConfiguration = Pointer;

  MKImageryMapConfigurationClass = interface(MKMapConfigurationClass)
    ['{1678561B-F0E5-439D-90A9-E2E1BB8D4BB2}']
  end;

  MKImageryMapConfiguration = interface(MKMapConfiguration)
    ['{08380DCD-7F05-4427-ABCF-DA782BBCA5A4}']
    function initWithElevationStyle(elevationStyle: MKMapElevationStyle)
      : Pointer { instancetype }; cdecl;
  end;

  TMKImageryMapConfiguration = class
    (TOCGenericImport<MKImageryMapConfigurationClass,
    MKImageryMapConfiguration>)
  end;

  PMKImageryMapConfiguration = Pointer;

  MKStandardMapConfigurationClass = interface(MKMapConfigurationClass)
    ['{DD94CF36-FD84-4477-8F03-3324D17691AA}']
  end;

  MKStandardMapConfiguration = interface(MKMapConfiguration)
    ['{48E7EDD8-5330-43D2-9C53-9FCA5FFBF098}']
    [MethodName('initWithElevationStyle:')]
    function initWithElevationStyle(elevationStyle: MKMapElevationStyle)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithElevationStyle:emphasisStyle:')]
    function initWithElevationStyleEmphasisStyle(elevationStyle
      : MKMapElevationStyle; emphasisStyle: MKStandardMapEmphasisStyle)
      : Pointer { instancetype }; cdecl;
    function initWithEmphasisStyle(emphasisStyle: MKStandardMapEmphasisStyle)
      : Pointer { instancetype }; cdecl;
    procedure setEmphasisStyle(emphasisStyle
      : MKStandardMapEmphasisStyle); cdecl;
    function emphasisStyle: MKStandardMapEmphasisStyle; cdecl;
    procedure setPointOfInterestFilter(pointOfInterestFilter
      : MKPointOfInterestFilter); cdecl;
    function pointOfInterestFilter: MKPointOfInterestFilter; cdecl;
    procedure setShowsTraffic(showsTraffic: Boolean); cdecl;
    function showsTraffic: Boolean; cdecl;
  end;

  TMKStandardMapConfiguration = class
    (TOCGenericImport<MKStandardMapConfigurationClass,
    MKStandardMapConfiguration>)
  end;

  PMKStandardMapConfiguration = Pointer;

  MKReverseGeocoderClass = interface(NSObjectClass)
    ['{5CBE724A-F809-4AD0-9CF2-65D22A85DC40}']
  end;

  MKReverseGeocoder = interface(NSObject)
    ['{B29B022D-C88A-4B0E-8A14-E0604D911EC6}']
    function initWithCoordinate(coordinate: CLLocationCoordinate2D)
      : Pointer { instancetype }; cdecl;
    procedure start; cdecl;
    procedure cancel; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function coordinate: CLLocationCoordinate2D; cdecl;
    function placemark: MKPlacemark; cdecl;
    function isQuerying: Boolean; cdecl;
  end;

  TMKReverseGeocoder = class(TOCGenericImport<MKReverseGeocoderClass,
    MKReverseGeocoder>)
  end;

  PMKReverseGeocoder = Pointer;

  MKOverlayPathViewClass = interface(MKOverlayViewClass)
    ['{3ECFC731-35D7-44CE-9C34-797D6844D0C0}']
  end;

  MKOverlayPathView = interface(MKOverlayView)
    ['{D2BC1FC9-C5EB-4A11-A386-602607FD7E0E}']
    procedure setFillColor(fillColor: UIColor); cdecl;
    function fillColor: UIColor; cdecl;
    procedure setStrokeColor(strokeColor: UIColor); cdecl;
    function strokeColor: UIColor; cdecl;
    procedure setLineWidth(lineWidth: CGFloat); cdecl;
    function lineWidth: CGFloat; cdecl;
    procedure setLineJoin(lineJoin: CGLineJoin); cdecl;
    function lineJoin: CGLineJoin; cdecl;
    procedure setLineCap(lineCap: CGLineCap); cdecl;
    function lineCap: CGLineCap; cdecl;
    procedure setMiterLimit(miterLimit: CGFloat); cdecl;
    function miterLimit: CGFloat; cdecl;
    procedure setLineDashPhase(lineDashPhase: CGFloat); cdecl;
    function lineDashPhase: CGFloat; cdecl;
    procedure setLineDashPattern(lineDashPattern: NSArray); cdecl;
    function lineDashPattern: NSArray; cdecl;
    procedure createPath; cdecl;
    procedure setPath(path: CGPathRef); cdecl;
    function path: CGPathRef; cdecl;
    procedure invalidatePath; cdecl;
    procedure applyStrokePropertiesToContext(context: CGContextRef;
      atZoomScale: MKZoomScale); cdecl;
    procedure applyFillPropertiesToContext(context: CGContextRef;
      atZoomScale: MKZoomScale); cdecl;
    procedure strokePath(path: CGPathRef; inContext: CGContextRef); cdecl;
    procedure fillPath(path: CGPathRef; inContext: CGContextRef); cdecl;
  end;

  TMKOverlayPathView = class(TOCGenericImport<MKOverlayPathViewClass,
    MKOverlayPathView>)
  end;

  PMKOverlayPathView = Pointer;

  MKPolygonViewClass = interface(MKOverlayPathViewClass)
    ['{8F91F588-7512-4316-8AE7-2DED1CA29764}']
  end;

  MKPolygonView = interface(MKOverlayPathView)
    ['{C6FCFFBE-DFA4-4C3E-AB2D-F95F0DF85F39}']
    function initWithPolygon(polygon: MKPolygon)
      : Pointer { instancetype }; cdecl;
    function polygon: MKPolygon; cdecl;
  end;

  TMKPolygonView = class(TOCGenericImport<MKPolygonViewClass, MKPolygonView>)
  end;

  PMKPolygonView = Pointer;

  MKPolylineViewClass = interface(MKOverlayPathViewClass)
    ['{0D0B7120-F1C1-4EE9-B035-A692D3146863}']
  end;

  MKPolylineView = interface(MKOverlayPathView)
    ['{6EA28EFF-5938-47CF-BC83-BF2A32E3A049}']
    function initWithPolyline(polyline: MKPolyline)
      : Pointer { instancetype }; cdecl;
    function polyline: MKPolyline; cdecl;
  end;

  TMKPolylineView = class(TOCGenericImport<MKPolylineViewClass, MKPolylineView>)
  end;

  PMKPolylineView = Pointer;

  MKCircleViewClass = interface(MKOverlayPathViewClass)
    ['{1B8A7F13-ECDD-455E-82BC-404E9E279AB6}']
  end;

  MKCircleView = interface(MKOverlayPathView)
    ['{764B9C0A-65FC-4963-B16C-9C790534D863}']
    function initWithCircle(circle: MKCircle): Pointer { instancetype }; cdecl;
    function circle: MKCircle; cdecl;
  end;

  TMKCircleView = class(TOCGenericImport<MKCircleViewClass, MKCircleView>)
  end;

  PMKCircleView = Pointer;

  MKScaleViewClass = interface(UIViewClass)
    ['{5679D36C-63A7-41EC-8F8E-592AD5088F68}']
    { class } function scaleViewWithMapView(mapView: MKMapView)
      : Pointer { instancetype }; cdecl;
  end;

  MKScaleView = interface(UIView)
    ['{7B8F5B4D-542C-4883-B456-B1059A57C49E}']
    procedure setMapView(mapView: MKMapView); cdecl;
    function mapView: MKMapView; cdecl;
    procedure setScaleVisibility(scaleVisibility: MKFeatureVisibility); cdecl;
    function scaleVisibility: MKFeatureVisibility; cdecl;
    procedure setLegendAlignment(legendAlignment: MKScaleViewAlignment); cdecl;
    function legendAlignment: MKScaleViewAlignment; cdecl;
  end;

  TMKScaleView = class(TOCGenericImport<MKScaleViewClass, MKScaleView>)
  end;

  PMKScaleView = Pointer;

  MKUserTrackingBarButtonItemClass = interface(UIBarButtonItemClass)
    ['{A153CD90-3810-4E31-BE81-CB3724E470D5}']
  end;

  MKUserTrackingBarButtonItem = interface(UIBarButtonItem)
    ['{AC3CD50A-0CEB-42B1-A0A5-8BF02802AAFD}']
    function initWithMapView(mapView: MKMapView)
      : Pointer { instancetype }; cdecl;
    procedure setMapView(mapView: MKMapView); cdecl;
    function mapView: MKMapView; cdecl;
  end;

  TMKUserTrackingBarButtonItem = class
    (TOCGenericImport<MKUserTrackingBarButtonItemClass,
    MKUserTrackingBarButtonItem>)
  end;

  PMKUserTrackingBarButtonItem = Pointer;

  MKUserTrackingButtonClass = interface(UIViewClass)
    ['{A63800BC-69D8-495B-9400-B1FD85FD67A4}']
    { class } function userTrackingButtonWithMapView(mapView: MKMapView)
      : Pointer { instancetype }; cdecl;
  end;

  MKUserTrackingButton = interface(UIView)
    ['{ACCDD687-F93F-4A06-98E5-3C2BBF676311}']
    procedure setMapView(mapView: MKMapView); cdecl;
    function mapView: MKMapView; cdecl;
  end;

  TMKUserTrackingButton = class(TOCGenericImport<MKUserTrackingButtonClass,
    MKUserTrackingButton>)
  end;

  PMKUserTrackingButton = Pointer;

  MKMapItemRequestClass = interface(NSObjectClass)
    ['{1524454E-18F6-4C96-B186-2F74C9B986A3}']
  end;

  MKMapItemRequest = interface(NSObject)
    ['{12ADE4EE-896C-4579-A3C2-11F23A050312}']
    function initWithMapFeatureAnnotation(mapFeatureAnnotation
      : MKMapFeatureAnnotation): Pointer { instancetype }; cdecl;
    procedure getMapItemWithCompletionHandler(completionHandler
      : TMapKitCompletionHandler1); cdecl;
    procedure cancel; cdecl;
    function featureAnnotation: MKMapFeatureAnnotation; cdecl;
    function isCancelled: Boolean; cdecl;
    function isLoading: Boolean; cdecl;
  end;

  TMKMapItemRequest = class(TOCGenericImport<MKMapItemRequestClass,
    MKMapItemRequest>)
  end;

  PMKMapItemRequest = Pointer;

  MKLookAroundSceneClass = interface(NSObjectClass)
    ['{481B871E-E9D6-4266-BB4C-31EAFFAE4797}']
  end;

  MKLookAroundScene = interface(NSObject)
    ['{33A7372E-2A85-44B3-91FA-8238A04680EA}']
  end;

  TMKLookAroundScene = class(TOCGenericImport<MKLookAroundSceneClass,
    MKLookAroundScene>)
  end;

  PMKLookAroundScene = Pointer;

  MKLookAroundSceneRequestClass = interface(NSObjectClass)
    ['{423AAC52-C27A-4159-AF77-E78DC1E057DA}']
  end;

  MKLookAroundSceneRequest = interface(NSObject)
    ['{BC2D310D-18D7-461B-9D67-D6963A9FBC57}']
    function initWithCoordinate(coordinate: CLLocationCoordinate2D)
      : Pointer { instancetype }; cdecl;
    function initWithMapItem(mapItem: MKMapItem)
      : Pointer { instancetype }; cdecl;
    function coordinate: CLLocationCoordinate2D; cdecl;
    function mapItem: MKMapItem; cdecl;
    function isCancelled: Boolean; cdecl;
    function isLoading: Boolean; cdecl;
    procedure getSceneWithCompletionHandler(completionHandler
      : TMapKitCompletionHandler2); cdecl;
    procedure cancel; cdecl;
  end;

  TMKLookAroundSceneRequest = class
    (TOCGenericImport<MKLookAroundSceneRequestClass, MKLookAroundSceneRequest>)
  end;

  PMKLookAroundSceneRequest = Pointer;

  MKLookAroundSnapshotClass = interface(NSObjectClass)
    ['{847D1D0D-7186-4713-9A32-D34841947142}']
  end;

  MKLookAroundSnapshot = interface(NSObject)
    ['{D855EFB4-B052-4915-B5F1-B20B81AD6840}']
    function image: UIImage; cdecl;
  end;

  TMKLookAroundSnapshot = class(TOCGenericImport<MKLookAroundSnapshotClass,
    MKLookAroundSnapshot>)
  end;

  PMKLookAroundSnapshot = Pointer;

  MKLookAroundSnapshotOptionsClass = interface(NSObjectClass)
    ['{1D084E0C-A077-441E-9527-0C0A6FECB639}']
  end;

  MKLookAroundSnapshotOptions = interface(NSObject)
    ['{B6496465-DEB0-4C1B-B713-E086C0546791}']
    procedure setPointOfInterestFilter(pointOfInterestFilter
      : MKPointOfInterestFilter); cdecl;
    function pointOfInterestFilter: MKPointOfInterestFilter; cdecl;
    procedure setSize(size: CGSize); cdecl;
    function size: CGSize; cdecl;
    procedure setTraitCollection(traitCollection: UITraitCollection); cdecl;
    function traitCollection: UITraitCollection; cdecl;
  end;

  TMKLookAroundSnapshotOptions = class
    (TOCGenericImport<MKLookAroundSnapshotOptionsClass,
    MKLookAroundSnapshotOptions>)
  end;

  PMKLookAroundSnapshotOptions = Pointer;

  MKLookAroundSnapshotterClass = interface(NSObjectClass)
    ['{4A2A3D55-E616-42A4-BDF7-6D3A998F9DE4}']
  end;

  MKLookAroundSnapshotter = interface(NSObject)
    ['{A581E63D-C98A-4C78-B801-A4EDC50B66D5}']
    function initWithScene(scene: MKLookAroundScene;
      options: MKLookAroundSnapshotOptions): Pointer { instancetype }; cdecl;
    procedure getSnapshotWithCompletionHandler(completionHandler
      : TMapKitCompletionHandler3); cdecl;
    procedure cancel; cdecl;
    function isLoading: Boolean; cdecl;
  end;

  TMKLookAroundSnapshotter = class
    (TOCGenericImport<MKLookAroundSnapshotterClass, MKLookAroundSnapshotter>)
  end;

  PMKLookAroundSnapshotter = Pointer;

  MKLookAroundViewControllerClass = interface(UIViewControllerClass)
    ['{A76C3939-9AC4-4D57-8E1A-2422B96C62A7}']
  end;

  MKLookAroundViewController = interface(UIViewController)
    ['{9498FD0A-109F-4C06-8E82-B0E72F89AE1B}']
    function initWithScene(scene: MKLookAroundScene)
      : Pointer { instancetype }; cdecl;
    function initWithNibName(nibNameOrNil: NSString; bundle: NSBundle)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setScene(scene: MKLookAroundScene); cdecl;
    function scene: MKLookAroundScene; cdecl;
    procedure setNavigationEnabled(navigationEnabled: Boolean); cdecl;
    function isNavigationEnabled: Boolean; cdecl;
    procedure setShowsRoadLabels(showsRoadLabels: Boolean); cdecl;
    function showsRoadLabels: Boolean; cdecl;
    procedure setPointOfInterestFilter(pointOfInterestFilter
      : MKPointOfInterestFilter); cdecl;
    function pointOfInterestFilter: MKPointOfInterestFilter; cdecl;
    procedure setBadgePosition(badgePosition: MKLookAroundBadgePosition); cdecl;
    function badgePosition: MKLookAroundBadgePosition; cdecl;
  end;

  TMKLookAroundViewController = class
    (TOCGenericImport<MKLookAroundViewControllerClass,
    MKLookAroundViewController>)
  end;

  PMKLookAroundViewController = Pointer;

  // ===== Protocol declarations =====

  MKAnnotation = interface(IObjectiveC)
    ['{BE38BC53-61AF-4A7B-AD24-4756A939FAF0}']
    function coordinate: CLLocationCoordinate2D; cdecl;
    function title: NSString; cdecl;
    function subtitle: NSString; cdecl;
    procedure setCoordinate(newCoordinate: CLLocationCoordinate2D); cdecl;
  end;

  MKOverlay = interface(IObjectiveC)
    ['{EAFF586D-D738-44F6-8394-6AD0152EEE6A}']
    function coordinate: CLLocationCoordinate2D; cdecl;
    function boundingMapRect: MKMapRect; cdecl;
    function intersectsMapRect(mapRect: MKMapRect): Boolean; cdecl;
    function canReplaceMapContent: Boolean; cdecl;
  end;

  MKMapViewDelegate = interface(IObjectiveC)
    ['{85ACF133-C379-4DAE-92C8-19D70A65EA64}']
    [MethodName('mapView:regionWillChangeAnimated:')]
    procedure mapViewRegionWillChangeAnimated(mapView: MKMapView;
      regionWillChangeAnimated: Boolean); cdecl;
    [MethodName('mapView:regionDidChangeAnimated:')]
    procedure mapViewRegionDidChangeAnimated(mapView: MKMapView;
      regionDidChangeAnimated: Boolean); cdecl;
    procedure mapViewDidChangeVisibleRegion(mapView: MKMapView); cdecl;
    procedure mapViewWillStartLoadingMap(mapView: MKMapView); cdecl;
    procedure mapViewDidFinishLoadingMap(mapView: MKMapView); cdecl;
    procedure mapViewDidFailLoadingMap(mapView: MKMapView;
      withError: NSError); cdecl;
    procedure mapViewWillStartRenderingMap(mapView: MKMapView); cdecl;
    procedure mapViewDidFinishRenderingMap(mapView: MKMapView;
      fullyRendered: Boolean); cdecl;
    [MethodName('mapView:viewForAnnotation:')]
    function mapViewViewForAnnotation(mapView: MKMapView;
      viewForAnnotation: Pointer): MKAnnotationView; cdecl;
    [MethodName('mapView:didAddAnnotationViews:')]
    procedure mapViewDidAddAnnotationViews(mapView: MKMapView;
      didAddAnnotationViews: NSArray); cdecl;
    [MethodName('mapView:annotationView:calloutAccessoryControlTapped:')]
    procedure mapViewAnnotationViewCalloutAccessoryControlTapped
      (mapView: MKMapView; annotationView: MKAnnotationView;
      calloutAccessoryControlTapped: UIControl); cdecl;
    [MethodName('mapView:didSelectAnnotationView:')]
    procedure mapViewDidSelectAnnotationView(mapView: MKMapView;
      didSelectAnnotationView: MKAnnotationView); cdecl;
    [MethodName('mapView:didDeselectAnnotationView:')]
    procedure mapViewDidDeselectAnnotationView(mapView: MKMapView;
      didDeselectAnnotationView: MKAnnotationView); cdecl;
    [MethodName('mapView:didSelectAnnotation:')]
    procedure mapViewDidSelectAnnotation(mapView: MKMapView;
      didSelectAnnotation: Pointer); cdecl;
    [MethodName('mapView:didDeselectAnnotation:')]
    procedure mapViewDidDeselectAnnotation(mapView: MKMapView;
      didDeselectAnnotation: Pointer); cdecl;
    procedure mapViewWillStartLocatingUser(mapView: MKMapView); cdecl;
    procedure mapViewDidStopLocatingUser(mapView: MKMapView); cdecl;
    [MethodName('mapView:didUpdateUserLocation:')]
    procedure mapViewDidUpdateUserLocation(mapView: MKMapView;
      didUpdateUserLocation: MKUserLocation); cdecl;
    [MethodName('mapView:didFailToLocateUserWithError:')]
    procedure mapViewDidFailToLocateUserWithError(mapView: MKMapView;
      didFailToLocateUserWithError: NSError); cdecl;
    [MethodName('mapView:annotationView:didChangeDragState:fromOldState:')]
    procedure mapViewAnnotationViewDidChangeDragStateFromOldState
      (mapView: MKMapView; annotationView: MKAnnotationView;
      didChangeDragState: MKAnnotationViewDragState;
      fromOldState: MKAnnotationViewDragState); cdecl;
    [MethodName('mapView:didChangeUserTrackingMode:animated:')]
    procedure mapViewDidChangeUserTrackingModeAnimated(mapView: MKMapView;
      didChangeUserTrackingMode: MKUserTrackingMode; animated: Boolean); cdecl;
    [MethodName('mapView:rendererForOverlay:')]
    function mapViewRendererForOverlay(mapView: MKMapView;
      rendererForOverlay: Pointer): MKOverlayRenderer; cdecl;
    [MethodName('mapView:didAddOverlayRenderers:')]
    procedure mapViewDidAddOverlayRenderers(mapView: MKMapView;
      didAddOverlayRenderers: NSArray); cdecl;
    [MethodName('mapView:viewForOverlay:')]
    function mapViewViewForOverlay(mapView: MKMapView; viewForOverlay: Pointer)
      : MKOverlayView; cdecl;
    [MethodName('mapView:didAddOverlayViews:')]
    procedure mapViewDidAddOverlayViews(mapView: MKMapView;
      didAddOverlayViews: NSArray); cdecl;
    [MethodName('mapView:clusterAnnotationForMemberAnnotations:')]
    function mapViewClusterAnnotationForMemberAnnotations(mapView: MKMapView;
      clusterAnnotationForMemberAnnotations: NSArray)
      : MKClusterAnnotation; cdecl;
  end;

  MKLocalSearchCompleterDelegate = interface(IObjectiveC)
    ['{E4C7A587-76CA-4D39-B552-977DEEB4C0D3}']
    procedure completerDidUpdateResults(completer
      : MKLocalSearchCompleter); cdecl;
    procedure completer(completer: MKLocalSearchCompleter;
      didFailWithError: NSError); cdecl;
  end;

  MKGeoJSONObject = interface(IObjectiveC)
    ['{A4D5BE4A-D2D6-4566-AAF3-5392B56615DB}']
  end;

  MKReverseGeocoderDelegate = interface(IObjectiveC)
    ['{11EA4F94-4E45-435E-B807-B773A9850764}']
    [MethodName('reverseGeocoder:didFindPlacemark:')]
    procedure reverseGeocoderDidFindPlacemark(geocoder: MKReverseGeocoder;
      didFindPlacemark: MKPlacemark); cdecl;
    [MethodName('reverseGeocoder:didFailWithError:')]
    procedure reverseGeocoderDidFailWithError(geocoder: MKReverseGeocoder;
      didFailWithError: NSError); cdecl;
  end;

  MKLookAroundViewControllerDelegate = interface(IObjectiveC)
    ['{D05575CD-0D17-49BF-B5C3-7505FAE36914}']
    procedure lookAroundViewControllerWillUpdateScene(viewController
      : MKLookAroundViewController); cdecl;
    procedure lookAroundViewControllerDidUpdateScene(viewController
      : MKLookAroundViewController); cdecl;
    procedure lookAroundViewControllerWillPresentFullScreen(viewController
      : MKLookAroundViewController); cdecl;
    procedure lookAroundViewControllerDidPresentFullScreen(viewController
      : MKLookAroundViewController); cdecl;
    procedure lookAroundViewControllerWillDismissFullScreen(viewController
      : MKLookAroundViewController); cdecl;
    procedure lookAroundViewControllerDidDismissFullScreen(viewController
      : MKLookAroundViewController); cdecl;
  end;

  // ===== Exported string consts =====

function MKMapSizeWorld: Pointer;
function MKMapRectWorld: Pointer;
function MKMapRectNull: Pointer;
function MKPointOfInterestCategoryAirport: Pointer;
function MKPointOfInterestCategoryAmusementPark: Pointer;
function MKPointOfInterestCategoryAquarium: Pointer;
function MKPointOfInterestCategoryATM: Pointer;
function MKPointOfInterestCategoryBakery: Pointer;
function MKPointOfInterestCategoryBank: Pointer;
function MKPointOfInterestCategoryBeach: Pointer;
function MKPointOfInterestCategoryBrewery: Pointer;
function MKPointOfInterestCategoryCafe: Pointer;
function MKPointOfInterestCategoryCampground: Pointer;
function MKPointOfInterestCategoryCarRental: Pointer;
function MKPointOfInterestCategoryEVCharger: Pointer;
function MKPointOfInterestCategoryFireStation: Pointer;
function MKPointOfInterestCategoryFitnessCenter: Pointer;
function MKPointOfInterestCategoryFoodMarket: Pointer;
function MKPointOfInterestCategoryGasStation: Pointer;
function MKPointOfInterestCategoryHospital: Pointer;
function MKPointOfInterestCategoryHotel: Pointer;
function MKPointOfInterestCategoryLaundry: Pointer;
function MKPointOfInterestCategoryLibrary: Pointer;
function MKPointOfInterestCategoryMarina: Pointer;
function MKPointOfInterestCategoryMovieTheater: Pointer;
function MKPointOfInterestCategoryMuseum: Pointer;
function MKPointOfInterestCategoryNationalPark: Pointer;
function MKPointOfInterestCategoryNightlife: Pointer;
function MKPointOfInterestCategoryPark: Pointer;
function MKPointOfInterestCategoryParking: Pointer;
function MKPointOfInterestCategoryPharmacy: Pointer;
function MKPointOfInterestCategoryPolice: Pointer;
function MKPointOfInterestCategoryPostOffice: Pointer;
function MKPointOfInterestCategoryPublicTransport: Pointer;
function MKPointOfInterestCategoryRestaurant: Pointer;
function MKPointOfInterestCategoryRestroom: Pointer;
function MKPointOfInterestCategorySchool: Pointer;
function MKPointOfInterestCategoryStadium: Pointer;
function MKPointOfInterestCategoryStore: Pointer;
function MKPointOfInterestCategoryTheater: Pointer;
function MKPointOfInterestCategoryUniversity: Pointer;
function MKPointOfInterestCategoryWinery: Pointer;
function MKPointOfInterestCategoryZoo: Pointer;
function MKLaunchOptionsDirectionsModeKey: NSString;
function MKLaunchOptionsMapTypeKey: NSString;
function MKLaunchOptionsShowsTrafficKey: NSString;
function MKLaunchOptionsDirectionsModeDefault: NSString;
function MKLaunchOptionsDirectionsModeDriving: NSString;
function MKLaunchOptionsDirectionsModeWalking: NSString;
function MKLaunchOptionsDirectionsModeTransit: NSString;
function MKLaunchOptionsMapCenterKey: NSString;
function MKLaunchOptionsMapSpanKey: NSString;
function MKLaunchOptionsCameraKey: NSString;
function MKMapItemTypeIdentifier: NSString;
function MKAnnotationCalloutInfoDidChangeNotification: NSString;
function MKErrorDomain: NSString;
function MKMapViewDefaultAnnotationViewReuseIdentifier: NSString;
function MKMapViewDefaultClusterAnnotationViewReuseIdentifier: NSString;
function MKPointsOfInterestRequestMaxRadius: Pointer;
function MKMapCameraZoomDefault: Pointer;


// ===== External functions =====

const
  libMapKit = '/System/Library/Frameworks/MapKit.framework/MapKit';
function MKCoordinateSpanMake(latitudeDelta: CLLocationDegrees;
  longitudeDelta: CLLocationDegrees): MKCoordinateSpan; cdecl;
  external libMapKit name _PU + 'MKCoordinateSpanMake';
function MKCoordinateRegionMake(centerCoordinate: CLLocationCoordinate2D;
  span: MKCoordinateSpan): MKCoordinateRegion; cdecl;
  external libMapKit name _PU + 'MKCoordinateRegionMake';
function MKCoordinateRegionMakeWithDistance(centerCoordinate
  : CLLocationCoordinate2D; latitudinalMeters: CLLocationDistance;
  longitudinalMeters: CLLocationDistance): MKCoordinateRegion; cdecl;
  external libMapKit name _PU + 'MKCoordinateRegionMakeWithDistance';
function MKMapPointForCoordinate(coordinate: CLLocationCoordinate2D)
  : MKMapPoint; cdecl; external libMapKit name _PU + 'MKMapPointForCoordinate';
function MKCoordinateForMapPoint(mapPoint: MKMapPoint): CLLocationCoordinate2D;
  cdecl; external libMapKit name _PU + 'MKCoordinateForMapPoint';
function MKMetersPerMapPointAtLatitude(latitude: CLLocationDegrees)
  : CLLocationDistance; cdecl;
  external libMapKit name _PU + 'MKMetersPerMapPointAtLatitude';
function MKMapPointsPerMeterAtLatitude(latitude: CLLocationDegrees): Double;
  cdecl; external libMapKit name _PU + 'MKMapPointsPerMeterAtLatitude';
function MKMetersBetweenMapPoints(a: MKMapPoint; b: MKMapPoint)
  : CLLocationDistance; cdecl;
  external libMapKit name _PU + 'MKMetersBetweenMapPoints';
function MKMapPointMake(x: Double; y: Double): MKMapPoint; cdecl;
  external libMapKit name _PU + 'MKMapPointMake';
function MKMapSizeMake(width: Double; height: Double): MKMapSize; cdecl;
  external libMapKit name _PU + 'MKMapSizeMake';
function MKMapRectMake(x: Double; y: Double; width: Double; height: Double)
  : MKMapRect; cdecl; external libMapKit name _PU + 'MKMapRectMake';
function MKMapRectGetMinX(rect: MKMapRect): Double; cdecl;
  external libMapKit name _PU + 'MKMapRectGetMinX';
function MKMapRectGetMinY(rect: MKMapRect): Double; cdecl;
  external libMapKit name _PU + 'MKMapRectGetMinY';
function MKMapRectGetMidX(rect: MKMapRect): Double; cdecl;
  external libMapKit name _PU + 'MKMapRectGetMidX';
function MKMapRectGetMidY(rect: MKMapRect): Double; cdecl;
  external libMapKit name _PU + 'MKMapRectGetMidY';
function MKMapRectGetMaxX(rect: MKMapRect): Double; cdecl;
  external libMapKit name _PU + 'MKMapRectGetMaxX';
function MKMapRectGetMaxY(rect: MKMapRect): Double; cdecl;
  external libMapKit name _PU + 'MKMapRectGetMaxY';
function MKMapRectGetWidth(rect: MKMapRect): Double; cdecl;
  external libMapKit name _PU + 'MKMapRectGetWidth';
function MKMapRectGetHeight(rect: MKMapRect): Double; cdecl;
  external libMapKit name _PU + 'MKMapRectGetHeight';
function MKMapPointEqualToPoint(point1: MKMapPoint; point2: MKMapPoint)
  : Boolean; cdecl; external libMapKit name _PU + 'MKMapPointEqualToPoint';
function MKMapSizeEqualToSize(size1: MKMapSize; size2: MKMapSize): Boolean;
  cdecl; external libMapKit name _PU + 'MKMapSizeEqualToSize';
function MKMapRectEqualToRect(rect1: MKMapRect; rect2: MKMapRect): Boolean;
  cdecl; external libMapKit name _PU + 'MKMapRectEqualToRect';
function MKMapRectIsNull(rect: MKMapRect): Boolean; cdecl;
  external libMapKit name _PU + 'MKMapRectIsNull';
function MKMapRectIsEmpty(rect: MKMapRect): Boolean; cdecl;
  external libMapKit name _PU + 'MKMapRectIsEmpty';
function MKStringFromMapPoint(point: MKMapPoint): Pointer { NSString }; cdecl;
  external libMapKit name _PU + 'MKStringFromMapPoint';
function MKStringFromMapSize(size: MKMapSize): Pointer { NSString }; cdecl;
  external libMapKit name _PU + 'MKStringFromMapSize';
function MKStringFromMapRect(rect: MKMapRect): Pointer { NSString }; cdecl;
  external libMapKit name _PU + 'MKStringFromMapRect';
function MKMapRectUnion(rect1: MKMapRect; rect2: MKMapRect): MKMapRect; cdecl;
  external libMapKit name _PU + 'MKMapRectUnion';
function MKMapRectIntersection(rect1: MKMapRect; rect2: MKMapRect): MKMapRect;
  cdecl; external libMapKit name _PU + 'MKMapRectIntersection';
function MKMapRectInset(rect: MKMapRect; dx: Double; dy: Double): MKMapRect;
  cdecl; external libMapKit name _PU + 'MKMapRectInset';
function MKMapRectOffset(rect: MKMapRect; dx: Double; dy: Double): MKMapRect;
  cdecl; external libMapKit name _PU + 'MKMapRectOffset';
procedure MKMapRectDivide(rect: MKMapRect; slice: PMKMapRect;
  remainder: PMKMapRect; amount: Double; edge: CGRectEdge); cdecl;
  external libMapKit name _PU + 'MKMapRectDivide';
function MKMapRectContainsPoint(rect: MKMapRect; point: MKMapPoint): Boolean;
  cdecl; external libMapKit name _PU + 'MKMapRectContainsPoint';
function MKMapRectContainsRect(rect1: MKMapRect; rect2: MKMapRect): Boolean;
  cdecl; external libMapKit name _PU + 'MKMapRectContainsRect';
function MKMapRectIntersectsRect(rect1: MKMapRect; rect2: MKMapRect): Boolean;
  cdecl; external libMapKit name _PU + 'MKMapRectIntersectsRect';
function MKCoordinateRegionForMapRect(rect: MKMapRect): MKCoordinateRegion;
  cdecl; external libMapKit name _PU + 'MKCoordinateRegionForMapRect';
function MKMapRectSpans180thMeridian(rect: MKMapRect): Boolean; cdecl;
  external libMapKit name _PU + 'MKMapRectSpans180thMeridian';
function MKMapRectRemainder(rect: MKMapRect): MKMapRect; cdecl;
  external libMapKit name _PU + 'MKMapRectRemainder';
function MKRoadWidthAtZoomScale(zoomScale: MKZoomScale): CGFloat; cdecl;
  external libMapKit name _PU + 'MKRoadWidthAtZoomScale';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  MapKitModule: THandle;

{$ENDIF IOS}

function MKLaunchOptionsDirectionsModeKey: NSString;
begin
  result := CocoaNSStringConst(libMapKit, 'MKLaunchOptionsDirectionsModeKey');
end;

function MKLaunchOptionsMapTypeKey: NSString;
begin
  result := CocoaNSStringConst(libMapKit, 'MKLaunchOptionsMapTypeKey');
end;

function MKLaunchOptionsShowsTrafficKey: NSString;
begin
  result := CocoaNSStringConst(libMapKit, 'MKLaunchOptionsShowsTrafficKey');
end;

function MKLaunchOptionsDirectionsModeDefault: NSString;
begin
  result := CocoaNSStringConst(libMapKit,
    'MKLaunchOptionsDirectionsModeDefault');
end;

function MKLaunchOptionsDirectionsModeDriving: NSString;
begin
  result := CocoaNSStringConst(libMapKit,
    'MKLaunchOptionsDirectionsModeDriving');
end;

function MKLaunchOptionsDirectionsModeWalking: NSString;
begin
  result := CocoaNSStringConst(libMapKit,
    'MKLaunchOptionsDirectionsModeWalking');
end;

function MKLaunchOptionsDirectionsModeTransit: NSString;
begin
  result := CocoaNSStringConst(libMapKit,
    'MKLaunchOptionsDirectionsModeTransit');
end;

function MKLaunchOptionsMapCenterKey: NSString;
begin
  result := CocoaNSStringConst(libMapKit, 'MKLaunchOptionsMapCenterKey');
end;

function MKLaunchOptionsMapSpanKey: NSString;
begin
  result := CocoaNSStringConst(libMapKit, 'MKLaunchOptionsMapSpanKey');
end;

function MKLaunchOptionsCameraKey: NSString;
begin
  result := CocoaNSStringConst(libMapKit, 'MKLaunchOptionsCameraKey');
end;

function MKMapItemTypeIdentifier: NSString;
begin
  result := CocoaNSStringConst(libMapKit, 'MKMapItemTypeIdentifier');
end;

function MKAnnotationCalloutInfoDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libMapKit,
    'MKAnnotationCalloutInfoDidChangeNotification');
end;

function MKErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libMapKit, 'MKErrorDomain');
end;

function MKMapViewDefaultAnnotationViewReuseIdentifier: NSString;
begin
  result := CocoaNSStringConst(libMapKit,
    'MKMapViewDefaultAnnotationViewReuseIdentifier');
end;

function MKMapViewDefaultClusterAnnotationViewReuseIdentifier: NSString;
begin
  result := CocoaNSStringConst(libMapKit,
    'MKMapViewDefaultClusterAnnotationViewReuseIdentifier');
end;

function MKMapSizeWorld: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKMapSizeWorld');
end;

function MKMapRectWorld: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKMapRectWorld');
end;

function MKMapRectNull: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKMapRectNull');
end;

function MKPointOfInterestCategoryAirport: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryAirport');
end;

function MKPointOfInterestCategoryAmusementPark: Pointer;
begin
  result := CocoaPointerConst(libMapKit,
    'MKPointOfInterestCategoryAmusementPark');
end;

function MKPointOfInterestCategoryAquarium: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryAquarium');
end;

function MKPointOfInterestCategoryATM: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryATM');
end;

function MKPointOfInterestCategoryBakery: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryBakery');
end;

function MKPointOfInterestCategoryBank: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryBank');
end;

function MKPointOfInterestCategoryBeach: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryBeach');
end;

function MKPointOfInterestCategoryBrewery: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryBrewery');
end;

function MKPointOfInterestCategoryCafe: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryCafe');
end;

function MKPointOfInterestCategoryCampground: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryCampground');
end;

function MKPointOfInterestCategoryCarRental: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryCarRental');
end;

function MKPointOfInterestCategoryEVCharger: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryEVCharger');
end;

function MKPointOfInterestCategoryFireStation: Pointer;
begin
  result := CocoaPointerConst(libMapKit,
    'MKPointOfInterestCategoryFireStation');
end;

function MKPointOfInterestCategoryFitnessCenter: Pointer;
begin
  result := CocoaPointerConst(libMapKit,
    'MKPointOfInterestCategoryFitnessCenter');
end;

function MKPointOfInterestCategoryFoodMarket: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryFoodMarket');
end;

function MKPointOfInterestCategoryGasStation: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryGasStation');
end;

function MKPointOfInterestCategoryHospital: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryHospital');
end;

function MKPointOfInterestCategoryHotel: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryHotel');
end;

function MKPointOfInterestCategoryLaundry: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryLaundry');
end;

function MKPointOfInterestCategoryLibrary: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryLibrary');
end;

function MKPointOfInterestCategoryMarina: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryMarina');
end;

function MKPointOfInterestCategoryMovieTheater: Pointer;
begin
  result := CocoaPointerConst(libMapKit,
    'MKPointOfInterestCategoryMovieTheater');
end;

function MKPointOfInterestCategoryMuseum: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryMuseum');
end;

function MKPointOfInterestCategoryNationalPark: Pointer;
begin
  result := CocoaPointerConst(libMapKit,
    'MKPointOfInterestCategoryNationalPark');
end;

function MKPointOfInterestCategoryNightlife: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryNightlife');
end;

function MKPointOfInterestCategoryPark: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryPark');
end;

function MKPointOfInterestCategoryParking: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryParking');
end;

function MKPointOfInterestCategoryPharmacy: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryPharmacy');
end;

function MKPointOfInterestCategoryPolice: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryPolice');
end;

function MKPointOfInterestCategoryPostOffice: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryPostOffice');
end;

function MKPointOfInterestCategoryPublicTransport: Pointer;
begin
  result := CocoaPointerConst(libMapKit,
    'MKPointOfInterestCategoryPublicTransport');
end;

function MKPointOfInterestCategoryRestaurant: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryRestaurant');
end;

function MKPointOfInterestCategoryRestroom: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryRestroom');
end;

function MKPointOfInterestCategorySchool: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategorySchool');
end;

function MKPointOfInterestCategoryStadium: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryStadium');
end;

function MKPointOfInterestCategoryStore: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryStore');
end;

function MKPointOfInterestCategoryTheater: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryTheater');
end;

function MKPointOfInterestCategoryUniversity: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryUniversity');
end;

function MKPointOfInterestCategoryWinery: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryWinery');
end;

function MKPointOfInterestCategoryZoo: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointOfInterestCategoryZoo');
end;

function MKPointsOfInterestRequestMaxRadius: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKPointsOfInterestRequestMaxRadius');
end;

function MKMapCameraZoomDefault: Pointer;
begin
  result := CocoaPointerConst(libMapKit, 'MKMapCameraZoomDefault');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MapKitModule := dlopen(MarshaledAString(libMapKit), RTLD_LAZY);

finalization

dlclose(MapKitModule);
{$ENDIF IOS}

end.
