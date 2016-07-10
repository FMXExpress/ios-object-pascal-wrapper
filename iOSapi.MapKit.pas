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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
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
  MKMapTypeStandard = 0;
  MKMapTypeSatellite = 1;
  MKMapTypeHybrid = 2;
  MKMapTypeSatelliteFlyover = 3;
  MKMapTypeHybridFlyover = 4;
  MKErrorUnknown = 1;
  MKErrorServerFailure = 2;
  MKErrorLoadingThrottled = 3;
  MKErrorPlacemarkNotFound = 4;
  MKErrorDirectionsNotFound = 5;
  MKUserTrackingModeNone = 0;
  MKUserTrackingModeFollow = 1;
  MKUserTrackingModeFollowWithHeading = 2;
  MKOverlayLevelAboveRoads = 0;
  MKOverlayLevelAboveLabels = 1;
  MKPinAnnotationColorRed = 0;
  MKPinAnnotationColorGreen = 1;
  MKPinAnnotationColorPurple = 2;
  MKSearchCompletionFilterTypeLocationsAndQueries = 0;
  MKSearchCompletionFilterTypeLocationsOnly = 1;
  MKDirectionsTransportTypeAutomobile = 1 shl 0;
  MKDirectionsTransportTypeWalking = 1 shl 1;
  MKDirectionsTransportTypeTransit = 1 shl 2;
  MKDirectionsTransportTypeAny = 268435455;

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
  MKUserLocation = interface;
  MKMapCamera = interface;
  MKMapViewDelegate = interface;
  MKMapView = interface;
  MKPinAnnotationView = interface;
  MKShape = interface;
  MKPointAnnotation = interface;
  MKMultiPoint = interface;
  MKPolyline = interface;
  MKPolygon = interface;
  MKCircle = interface;
  MKGeodesicPolyline = interface;
  MKOverlayPathRenderer = interface;
  MKPolygonRenderer = interface;
  MKPolylineRenderer = interface;
  MKCircleRenderer = interface;
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
  MKReverseGeocoderDelegate = interface;
  MKReverseGeocoder = interface;
  MKOverlayPathView = interface;
  MKPolygonView = interface;
  MKPolylineView = interface;
  MKCircleView = interface;
  MKUserTrackingBarButtonItem = interface;

  // ===== Framework typedefs =====
{$M+}
  CLLocationDegrees = Double;

  CLLocationCoordinate2D = record
    latitude: CLLocationDegrees;
    longitude: CLLocationDegrees;
  end;;
CLLocationDistance = Double;
NSUInteger = Cardinal;
MKDistanceFormatterUnits = NSUInteger;
MKDistanceFormatterUnitStyle = NSUInteger;

MKCoordinateSpan = record latitudeDelta: CLLocationDegrees;
longitudeDelta:
CLLocationDegrees;
end;
PMKCoordinateSpan = ^MKCoordinateSpan;

MKCoordinateRegion = record center: CLLocationCoordinate2D;
span:
MKCoordinateSpan;
end;
PMKCoordinateRegion = ^MKCoordinateRegion;

MKMapPoint = record x: Double;
y:
Double;
end;
PMKMapPoint = ^MKMapPoint;

MKMapSize = record width: Double;
height:
Double;
end;
PMKMapSize = ^MKMapSize;

MKMapRect = record origin: MKMapPoint;
size:
MKMapSize;
end;
PMKMapRect = ^MKMapRect;

CGFloat = Single;
MKZoomScale = CGFloat;
CGRectEdge = LongWord;
MKAnnotationViewDragState = NSUInteger;
CGPoint = CGPoint = record x: CGFloat;
y:
CGFloat;
end;
PCGPoint = ^CGPoint;;
MKMapType = NSUInteger;
MKErrorCode = NSUInteger;
CGSize = CGSize = record width: CGFloat;
height:
CGFloat;
end;
PCGSize = ^CGSize;;
CGRect = CGRect = record origin: CGPoint;
size:
CGSize;
end;
PCGRect = ^CGRect;;
CGContextRef = Pointer;
NSInteger = Integer;
MKUserTrackingMode = NSInteger;
UIEdgeInsets = UIEdgeInsets = record top: CGFloat;
left:
CGFloat;
bottom:
CGFloat;
right:
CGFloat;
end;
PUIEdgeInsets = ^UIEdgeInsets;;
MKOverlayLevel = NSInteger;
MKPinAnnotationColor = NSUInteger;
NSRange = _NSRange = record location: NSUInteger;
length:
NSUInteger;
end;
P_NSRange = ^_NSRange;;
CGLineJoin = Int32;
CGLineCap = Int32;
CGPathRef = Pointer;
MKLocalSearchCompletionHandler =
procedure(param1: MKLocalSearchResponse; param2: NSError) of object;
MKSearchCompletionFilterType = NSInteger;
MKDirectionsTransportType = NSUInteger;
MKDirectionsHandler =
procedure(param1: MKDirectionsResponse; param2: NSError) of object;
MKETAHandler =
procedure(param1: MKETAResponse; param2: NSError) of object;
NSTimeInterval = Double;
MKMapSnapshotCompletionHandler =
procedure(param1: MKMapSnapshot; param2: NSError) of object;
dispatch_queue_t = Pointer;

MKTileOverlayPath = record x: NSInteger;
y:
NSInteger;
z:
NSInteger;
contentScaleFactor:
CGFloat;
end;
PMKTileOverlayPath = ^MKTileOverlayPath;

TMapKitResult =
procedure(param1: NSData; param2: NSError) of object;
CLLocationDirection = Double;
// ===== Interface declarations =====

MKDistanceFormatterClass = interface(NSFormatterClass)
  ['{55771B4D-3ACC-4D5C-915F-549F1652190F}']
end;
MKDistanceFormatter = interface(NSFormatter)
  ['{B4F606A9-664F-495C-A158-2906C58DE472}']
function stringFromDistance(distance: CLLocationDistance): NSString;
cdecl;

function distanceFromString(distance: NSString): CLLocationDistance; cdecl;
  procedure setLocale(locale: NSLocale); cdecl;
    function locale: NSLocale; cdecl;
      procedure setUnits(units: MKDistanceFormatterUnits); cdecl;
        function units: MKDistanceFormatterUnits; cdecl;
          procedure setUnitStyle(unitStyle
            : MKDistanceFormatterUnitStyle); cdecl;
            function unitStyle: MKDistanceFormatterUnitStyle; cdecl;
            end;

        TMKDistanceFormatter = class(TOCGenericImport<MKDistanceFormatterClass,
          MKDistanceFormatter>)
        end;
    PMKDistanceFormatter = Pointer;

    NSValueMapKitGeometryExtensions = interface(IObjectiveC)
      ['{44599DE5-3D7C-4B74-80CA-A0D8D074C0CE}']
    function valueWithMKCoordinate(coordinate: CLLocationCoordinate2D): NSValue;
    cdecl;
      function valueWithMKCoordinateSpan(span: MKCoordinateSpan)
        : NSValue; cdecl;
        function MKCoordinateValue: CLLocationCoordinate2D; cdecl;
          function MKCoordinateSpanValue: MKCoordinateSpan; cdecl;
          end;

      MKPlacemarkClass = interface(CLPlacemarkClass)
        ['{05BE3C33-313A-4B6C-8AEC-C27D4BF54FE7}']
      end;
  MKPlacemark = interface(CLPlacemark)['{EA903982-750D-4056-A88E-24CB011755C4}']
  function initWithCoordinate(coordinate: CLLocationCoordinate2D;
    addressDictionary: NSDictionary): Pointer { instancetype };
  cdecl;
    function countryCode: NSString; cdecl;
    end;

TMKPlacemark = class(TOCGenericImport<MKPlacemarkClass, MKPlacemark>)
end;
PMKPlacemark = Pointer;

MKMapItemClass = interface(NSObjectClass)
  ['{E8809579-861B-4B3E-8C86-65DC5C75ED32}']
{ class } function mapItemForCurrentLocation: MKMapItem;
cdecl;

{ class } function openMapsWithItems(mapItems: NSArray;
  launchOptions: NSDictionary): Boolean; cdecl;
end;
MKMapItem = interface(NSObject)['{E1B41C6C-9EFF-451F-AA73-A9AC2A6B5FD9}']
function placemark: MKPlacemark;
cdecl;

function isCurrentLocation: Boolean; cdecl;
  procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
      procedure setPhoneNumber(phoneNumber: NSString); cdecl;
        function phoneNumber: NSString; cdecl;
          procedure setUrl(url: NSURL); cdecl;
            function url: NSURL; cdecl;
              procedure setTimeZone(timeZone: NSTimeZone); cdecl;
                function timeZone: NSTimeZone; cdecl;
                  function initWithPlacemark(placemark: MKPlacemark)
                    : Pointer { instancetype }; cdecl;
                    function openInMapsWithLaunchOptions(launchOptions
                      : NSDictionary): Boolean; cdecl;
                    end;

                TMKMapItem = class(TOCGenericImport<MKMapItemClass, MKMapItem>)
                end;
            PMKMapItem = Pointer;

            MKAnnotationViewClass = interface(UIViewClass)
              ['{A83DDBC5-39BF-4AE2-9393-82BF2D87FAD2}']
            end;
        MKAnnotationView = interface(UIView)
          ['{CA7C6825-6172-4BA9-BD23-081C9D92787D}']
        function initWithAnnotation(annotation: Pointer;
          reuseIdentifier: NSString): Pointer { instancetype };
        cdecl;
          function reuseIdentifier: NSString; cdecl;
            procedure prepareForReuse; cdecl;
              procedure setAnnotation(annotation: Pointer); cdecl;
                function annotation: Pointer; cdecl;
                  procedure setImage(image: UIImage); cdecl;
                    function image: UIImage; cdecl;
                      procedure setCenterOffset(centerOffset: CGPoint); cdecl;
                        function centerOffset: CGPoint; cdecl;
                          procedure setCalloutOffset(calloutOffset
                            : CGPoint); cdecl;
                            function calloutOffset: CGPoint; cdecl;
                              procedure setEnabled(enabled: Boolean); cdecl;
                                function isEnabled: Boolean; cdecl;
                                  procedure setHighlighted
                                    (highlighted: Boolean); cdecl;
                                    function isHighlighted: Boolean; cdecl;
                                    [MethodName('setSelected:')]
                                      procedure setSelected
                                        (selected: Boolean); cdecl;
                                        function isSelected: Boolean; cdecl;
                                        [MethodName('setSelected:animated:')]
                                        procedure setSelectedAnimated
                                        (selected: Boolean;
                                        animated: Boolean); cdecl;
                                        procedure setCanShowCallout
                                        (canShowCallout: Boolean); cdecl;
                                        function canShowCallout: Boolean; cdecl;
                                        procedure setLeftCalloutAccessoryView
                                        (leftCalloutAccessoryView
                                        : UIView); cdecl;
                                        function leftCalloutAccessoryView
                                        : UIView; cdecl;
                                        procedure setRightCalloutAccessoryView
                                        (rightCalloutAccessoryView
                                        : UIView); cdecl;
                                        function rightCalloutAccessoryView
                                        : UIView; cdecl;
                                        procedure setDetailCalloutAccessoryView
                                        (detailCalloutAccessoryView
                                        : UIView); cdecl;
                                        function detailCalloutAccessoryView
                                        : UIView; cdecl;
                                        procedure setDraggable
                                        (draggable: Boolean); cdecl;
                                        function isDraggable: Boolean; cdecl;
                                        [MethodName('setDragState:')]
                                        procedure setDragState
                                        (dragState
                                        : MKAnnotationViewDragState); cdecl;
                                        function dragState
                                        : MKAnnotationViewDragState; cdecl;
                                        [MethodName('setDragState:animated:')]
                                        procedure setDragStateAnimated
                                        (newDragState
                                        : MKAnnotationViewDragState;
                                        animated: Boolean); cdecl;
                                        end;

                                        TMKAnnotationView = class
                                        (TOCGenericImport<MKAnnotationViewClass,
                                        MKAnnotationView>)
                                        end;
                                        PMKAnnotationView = Pointer;

                                        MKOverlayRendererClass = interface
                                        (NSObjectClass)
                                        ['{34832997-49BD-4CA7-B14F-08D30B10DE78}']
                                        end;
                                        MKOverlayRenderer = interface(NSObject)
                                        ['{8AD1648D-79FC-4369-93A6-17ABE9FD2A98}']
                                        function initWithOverlay
                                        (overlay: Pointer)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function overlay: Pointer; cdecl;
                                        function pointForMapPoint
                                        (mapPoint: MKMapPoint): CGPoint; cdecl;
                                        function mapPointForPoint
                                        (point: CGPoint): MKMapPoint; cdecl;
                                        function rectForMapRect
                                        (mapRect: MKMapRect): CGRect; cdecl;
                                        function mapRectForRect(rect: CGRect)
                                        : MKMapRect; cdecl;
                                        function canDrawMapRect
                                        (mapRect: MKMapRect;
                                        zoomScale: MKZoomScale): Boolean; cdecl;
                                        procedure drawMapRect
                                        (mapRect: MKMapRect;
                                        zoomScale: MKZoomScale;
                                        inContext: CGContextRef); cdecl;
                                        procedure setNeedsDisplay; cdecl;
                                        [MethodName
                                        ('setNeedsDisplayInMapRect:')]
                                        procedure setNeedsDisplayInMapRect
                                        (mapRect: MKMapRect); cdecl;
                                        [MethodName
                                        ('setNeedsDisplayInMapRect:zoomScale:')]
                                        procedure setNeedsDisplayInMapRectZoomScale
                                        (mapRect: MKMapRect;
                                        zoomScale: MKZoomScale); cdecl;
                                        procedure setAlpha
                                        (alpha: CGFloat); cdecl;
                                        function alpha: CGFloat; cdecl;
                                        function contentScaleFactor
                                        : CGFloat; cdecl;
                                        end;

                                        TMKOverlayRenderer = class
                                        (TOCGenericImport<
                                        MKOverlayRendererClass,
                                        MKOverlayRenderer>)
                                        end;
                                        PMKOverlayRenderer = Pointer;

                                        MKOverlayViewClass = interface
                                        (UIViewClass)
                                        ['{B3FDA82B-9578-4342-9825-B93507B03FFE}']
                                        end;
                                        MKOverlayView = interface(UIView)
                                        ['{BE32CC16-2715-444D-8480-A3136CB19F3B}']
                                        function initWithOverlay
                                        (overlay: Pointer)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function overlay: Pointer; cdecl;
                                        function pointForMapPoint
                                        (mapPoint: MKMapPoint): CGPoint; cdecl;
                                        function mapPointForPoint
                                        (point: CGPoint): MKMapPoint; cdecl;
                                        function rectForMapRect
                                        (mapRect: MKMapRect): CGRect; cdecl;
                                        function mapRectForRect(rect: CGRect)
                                        : MKMapRect; cdecl;
                                        function canDrawMapRect
                                        (mapRect: MKMapRect;
                                        zoomScale: MKZoomScale): Boolean; cdecl;
                                        procedure drawMapRect
                                        (mapRect: MKMapRect;
                                        zoomScale: MKZoomScale;
                                        inContext: CGContextRef); cdecl;
                                        [MethodName
                                        ('setNeedsDisplayInMapRect:')]
                                        procedure setNeedsDisplayInMapRect
                                        (mapRect: MKMapRect); cdecl;
                                        [MethodName
                                        ('setNeedsDisplayInMapRect:zoomScale:')]
                                        procedure setNeedsDisplayInMapRectZoomScale
                                        (mapRect: MKMapRect;
                                        zoomScale: MKZoomScale); cdecl;
                                        end;

                                        TMKOverlayView = class
                                        (TOCGenericImport<MKOverlayViewClass,
                                        MKOverlayView>)
                                        end;
                                        PMKOverlayView = Pointer;

                                        MKUserLocationClass = interface
                                        (NSObjectClass)
                                        ['{17693B0B-C6DC-4A4B-9FBB-0B9843E4193A}']
                                        end;
                                        MKUserLocation = interface(NSObject)
                                        ['{473D8124-CA07-4DDD-80F3-02ECF270B3B2}']
                                        function isUpdating: Boolean;
                                        cdecl;
                                        function location: CLLocation; cdecl;
                                        function heading: CLHeading; cdecl;
                                        procedure setTitle
                                        (title: NSString); cdecl;
                                        function title: NSString; cdecl;
                                        procedure setSubtitle
                                        (subtitle: NSString); cdecl;
                                        function subtitle: NSString; cdecl;
                                        end;

                                        TMKUserLocation = class
                                        (TOCGenericImport<MKUserLocationClass,
                                        MKUserLocation>)
                                        end;
                                        PMKUserLocation = Pointer;

                                        MKMapCameraClass = interface
                                        (NSObjectClass)
                                        ['{F1F8DFF3-945F-48CA-ADF4-1F8195E50E3E}']
                                        { class } function camera
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('cameraLookingAtCenterCoordinate:fromEyeCoordinate:eyeAltitude:')
                                        ]
                                        { class } function
                                        cameraLookingAtCenterCoordinateFromEyeCoordinateEyeAltitude
                                        (centerCoordinate
                                        : CLLocationCoordinate2D;
                                        fromEyeCoordinate
                                        : CLLocationCoordinate2D;
                                        eyeAltitude: CLLocationDistance)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:')
                                        ]
                                        { class } function
                                        cameraLookingAtCenterCoordinateFromDistancePitchHeading
                                        (centerCoordinate
                                        : CLLocationCoordinate2D;
                                        fromDistance: CLLocationDistance;
                                        pitch: CGFloat;
                                        heading: CLLocationDirection)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        MKMapCamera = interface(NSObject)
                                        ['{67256B6E-4B8D-40F4-8143-3287D08F549C}']
                                        procedure setCenterCoordinate
                                        (centerCoordinate
                                        : CLLocationCoordinate2D);
                                        cdecl;
                                        function centerCoordinate
                                        : CLLocationCoordinate2D; cdecl;
                                        procedure setHeading
                                        (heading: CLLocationDirection); cdecl;
                                        function heading
                                        : CLLocationDirection; cdecl;
                                        procedure setPitch
                                        (pitch: CGFloat); cdecl;
                                        function pitch: CGFloat; cdecl;
                                        procedure setAltitude
                                        (altitude: CLLocationDistance); cdecl;
                                        function altitude
                                        : CLLocationDistance; cdecl;
                                        end;

                                        TMKMapCamera = class
                                        (TOCGenericImport<MKMapCameraClass,
                                        MKMapCamera>)
                                        end;
                                        PMKMapCamera = Pointer;

                                        MKMapViewClass = interface(UIViewClass)
                                        ['{5C51ECC3-B829-418D-B8A9-0E0C3533DBAE}']
                                        end;
                                        MKMapView = interface(UIView)
                                        ['{CA1BEA91-7422-4163-8963-0FDF32B82F29}']
                                        procedure setDelegate
                                        (delegate: Pointer);
                                        cdecl;
                                        function delegate: Pointer; cdecl;
                                        procedure setMapType
                                        (mapType: MKMapType); cdecl;
                                        function mapType: MKMapType; cdecl;
                                        [MethodName('setRegion:')]
                                        procedure setRegion
                                        (region: MKCoordinateRegion); cdecl;
                                        function region
                                        : MKCoordinateRegion; cdecl;
                                        [MethodName('setRegion:animated:')]
                                        procedure setRegionAnimated
                                        (region: MKCoordinateRegion;
                                        animated: Boolean); cdecl;
                                        [MethodName('setCenterCoordinate:')]
                                        procedure setCenterCoordinate
                                        (centerCoordinate
                                        : CLLocationCoordinate2D); cdecl;
                                        function centerCoordinate
                                        : CLLocationCoordinate2D; cdecl;
                                        [MethodName
                                        ('setCenterCoordinate:animated:')]
                                        procedure setCenterCoordinateAnimated
                                        (coordinate: CLLocationCoordinate2D;
                                        animated: Boolean); cdecl;
                                        function regionThatFits
                                        (region: MKCoordinateRegion)
                                        : MKCoordinateRegion; cdecl;
                                        [MethodName('setVisibleMapRect:')]
                                        procedure setVisibleMapRect
                                        (visibleMapRect: MKMapRect); cdecl;
                                        function visibleMapRect
                                        : MKMapRect; cdecl;
                                        [MethodName
                                        ('setVisibleMapRect:animated:')]
                                        procedure setVisibleMapRectAnimated
                                        (mapRect: MKMapRect;
                                        animated: Boolean); cdecl;
                                        [MethodName('mapRectThatFits:')]
                                        function mapRectThatFits
                                        (mapRect: MKMapRect): MKMapRect; cdecl;
                                        [MethodName
                                        ('setVisibleMapRect:edgePadding:animated:')
                                        ]
                                        procedure setVisibleMapRectEdgePaddingAnimated
                                        (mapRect: MKMapRect;
                                        edgePadding: UIEdgeInsets;
                                        animated: Boolean); cdecl;
                                        [MethodName
                                        ('mapRectThatFits:edgePadding:')]
                                        function mapRectThatFitsEdgePadding
                                        (mapRect: MKMapRect;
                                        edgePadding: UIEdgeInsets)
                                        : MKMapRect; cdecl;
                                        [MethodName('setCamera:')]
                                        procedure setCamera
                                        (camera: MKMapCamera); cdecl;
                                        function camera: MKMapCamera; cdecl;
                                        [MethodName('setCamera:animated:')]
                                        procedure setCameraAnimated
                                        (camera: MKMapCamera;
                                        animated: Boolean); cdecl;
                                        function convertCoordinate
                                        (coordinate: CLLocationCoordinate2D;
                                        toPointToView: UIView): CGPoint; cdecl;
                                        function convertPoint(point: CGPoint;
                                        toCoordinateFromView: UIView)
                                        : CLLocationCoordinate2D; cdecl;
                                        function convertRegion
                                        (region: MKCoordinateRegion;
                                        toRectToView: UIView): CGRect; cdecl;
                                        function convertRect(rect: CGRect;
                                        toRegionFromView: UIView)
                                        : MKCoordinateRegion; cdecl;
                                        procedure setZoomEnabled
                                        (zoomEnabled: Boolean); cdecl;
                                        function isZoomEnabled: Boolean; cdecl;
                                        procedure setScrollEnabled
                                        (scrollEnabled: Boolean); cdecl;
                                        function isScrollEnabled
                                        : Boolean; cdecl;
                                        procedure setRotateEnabled
                                        (rotateEnabled: Boolean); cdecl;
                                        function isRotateEnabled
                                        : Boolean; cdecl;
                                        procedure setPitchEnabled
                                        (pitchEnabled: Boolean); cdecl;
                                        function isPitchEnabled: Boolean; cdecl;
                                        procedure setShowsCompass
                                        (showsCompass: Boolean); cdecl;
                                        function showsCompass: Boolean; cdecl;
                                        procedure setShowsScale
                                        (showsScale: Boolean); cdecl;
                                        function showsScale: Boolean; cdecl;
                                        procedure setShowsPointsOfInterest
                                        (showsPointsOfInterest: Boolean); cdecl;
                                        function showsPointsOfInterest
                                        : Boolean; cdecl;
                                        procedure setShowsBuildings
                                        (showsBuildings: Boolean); cdecl;
                                        function showsBuildings: Boolean; cdecl;
                                        procedure setShowsTraffic
                                        (showsTraffic: Boolean); cdecl;
                                        function showsTraffic: Boolean; cdecl;
                                        procedure setShowsUserLocation
                                        (showsUserLocation: Boolean); cdecl;
                                        function showsUserLocation
                                        : Boolean; cdecl;
                                        function userLocation
                                        : MKUserLocation; cdecl;
                                        [MethodName('setUserTrackingMode:')]
                                        procedure setUserTrackingMode
                                        (userTrackingMode
                                        : MKUserTrackingMode); cdecl;
                                        function userTrackingMode
                                        : MKUserTrackingMode; cdecl;
                                        [MethodName
                                        ('setUserTrackingMode:animated:')]
                                        procedure setUserTrackingModeAnimated
                                        (mode: MKUserTrackingMode;
                                        animated: Boolean); cdecl;
                                        function isUserLocationVisible
                                        : Boolean; cdecl;
                                        procedure addAnnotation
                                        (annotation: Pointer); cdecl;
                                        procedure addAnnotations
                                        (annotations: NSArray); cdecl;
                                        procedure removeAnnotation
                                        (annotation: Pointer); cdecl;
                                        procedure removeAnnotations
                                        (annotations: NSArray); cdecl;
                                        function annotations: NSArray; cdecl;
                                        function annotationsInMapRect
                                        (mapRect: MKMapRect): NSSet; cdecl;
                                        function viewForAnnotation
                                        (annotation: Pointer)
                                        : MKAnnotationView; cdecl;
                                        function dequeueReusableAnnotationViewWithIdentifier
                                        (identifier: NSString)
                                        : MKAnnotationView; cdecl;
                                        procedure selectAnnotation
                                        (annotation: Pointer;
                                        animated: Boolean); cdecl;
                                        procedure deselectAnnotation
                                        (annotation: Pointer;
                                        animated: Boolean); cdecl;
                                        procedure setSelectedAnnotations
                                        (selectedAnnotations: NSArray); cdecl;
                                        function selectedAnnotations
                                        : NSArray; cdecl;
                                        function annotationVisibleRect
                                        : CGRect; cdecl;
                                        procedure showAnnotations
                                        (annotations: NSArray;
                                        animated: Boolean); cdecl;
                                        [MethodName('addOverlay:level:')]
                                        procedure addOverlayLevel
                                        (overlay: Pointer;
                                        level: MKOverlayLevel); cdecl;
                                        [MethodName('addOverlays:level:')]
                                        procedure addOverlaysLevel
                                        (overlays: NSArray;
                                        level: MKOverlayLevel); cdecl;
                                        procedure removeOverlay
                                        (overlay: Pointer); cdecl;
                                        procedure removeOverlays
                                        (overlays: NSArray); cdecl;
                                        [MethodName
                                        ('insertOverlay:atIndex:level:')]
                                        procedure insertOverlayAtIndexLevel
                                        (overlay: Pointer; atIndex: NSUInteger;
                                        level: MKOverlayLevel); cdecl;
                                        [MethodName
                                        ('insertOverlay:aboveOverlay:')]
                                        procedure insertOverlayAboveOverlay
                                        (overlay: Pointer;
                                        aboveOverlay: Pointer); cdecl;
                                        [MethodName
                                        ('insertOverlay:belowOverlay:')]
                                        procedure insertOverlayBelowOverlay
                                        (overlay: Pointer;
                                        belowOverlay: Pointer); cdecl;
                                        procedure exchangeOverlay
                                        (overlay1: Pointer;
                                        withOverlay: Pointer); cdecl;
                                        function overlays: NSArray; cdecl;
                                        function overlaysInLevel
                                        (level: MKOverlayLevel): NSArray; cdecl;
                                        function rendererForOverlay
                                        (overlay: Pointer)
                                        : MKOverlayRenderer; cdecl;
                                        function viewForOverlay
                                        (overlay: Pointer)
                                        : MKOverlayView; cdecl;
                                        [MethodName('addOverlay:')]
                                        procedure addOverlay
                                        (overlay: Pointer); cdecl;
                                        [MethodName('addOverlays:')]
                                        procedure addOverlays
                                        (overlays: NSArray); cdecl;
                                        [MethodName('insertOverlay:atIndex:')]
                                        procedure insertOverlayAtIndex
                                        (overlay: Pointer;
                                        atIndex: NSUInteger); cdecl;
                                        procedure exchangeOverlayAtIndex
                                        (index1: NSUInteger;
                                        withOverlayAtIndex: NSUInteger); cdecl;
                                        end;

                                        TMKMapView = class
                                        (TOCGenericImport<MKMapViewClass,
                                        MKMapView>)
                                        end;
                                        PMKMapView = Pointer;

                                        MKPinAnnotationViewClass = interface
                                        (MKAnnotationViewClass)
                                        ['{FB56850C-8B4F-4CEC-99CD-25D50316C55B}']
                                        { class } function redPinColor: UIColor;
                                        cdecl;
                                        { class } function greenPinColor
                                        : UIColor; cdecl;
                                        { class } function purplePinColor
                                        : UIColor; cdecl;
                                        end;
                                        MKPinAnnotationView = interface
                                        (MKAnnotationView)
                                        ['{01EC1E31-2690-4AEC-B8AD-5D787A006445}']
                                        procedure setPinTintColor
                                        (pinTintColor: UIColor);
                                        cdecl;
                                        function pinTintColor: UIColor; cdecl;
                                        procedure setAnimatesDrop
                                        (animatesDrop: Boolean); cdecl;
                                        function animatesDrop: Boolean; cdecl;
                                        procedure setPinColor
                                        (pinColor: MKPinAnnotationColor); cdecl;
                                        function pinColor
                                        : MKPinAnnotationColor; cdecl;
                                        end;

                                        TMKPinAnnotationView = class
                                        (TOCGenericImport<
                                        MKPinAnnotationViewClass,
                                        MKPinAnnotationView>)
                                        end;
                                        PMKPinAnnotationView = Pointer;

                                        MKShapeClass = interface(NSObjectClass)
                                        ['{702148EE-4086-4C30-9EA5-D0499D5B6E2C}']
                                        end;
                                        MKShape = interface(NSObject)
                                        ['{3EF9AA25-AFF8-41F5-878C-A4DAEC60F86B}']
                                        procedure setTitle(title: NSString);
                                        cdecl;
                                        function title: NSString; cdecl;
                                        procedure setSubtitle
                                        (subtitle: NSString); cdecl;
                                        function subtitle: NSString; cdecl;
                                        end;

                                        TMKShape = class
                                        (TOCGenericImport<
                                        MKShapeClass, MKShape>)
                                        end;
                                        PMKShape = Pointer;

                                        MKPointAnnotationClass = interface
                                        (MKShapeClass)
                                        ['{6E5E5F19-CDEA-433B-917A-EAE33AAB9CE6}']
                                        end;
                                        MKPointAnnotation = interface(MKShape)
                                        ['{29C5D89F-93D8-470A-AD46-3E50E3011DF8}']
                                        procedure setCoordinate
                                        (coordinate: CLLocationCoordinate2D);
                                        cdecl;
                                        function coordinate
                                        : CLLocationCoordinate2D; cdecl;
                                        end;

                                        TMKPointAnnotation = class
                                        (TOCGenericImport<
                                        MKPointAnnotationClass,
                                        MKPointAnnotation>)
                                        end;
                                        PMKPointAnnotation = Pointer;

                                        MKMultiPointClass = interface
                                        (MKShapeClass)
                                        ['{B6977103-D425-4B33-B321-974C4BFE2441}']
                                        end;
                                        MKMultiPoint = interface(MKShape)
                                        ['{352E304F-17AD-411F-9661-FE1E38D09BD1}']
                                        function points: Pointer;
                                        cdecl;
                                        function pointCount: NSUInteger; cdecl;
                                        procedure getCoordinates
                                        (coords: Pointer;
                                        range: NSRange); cdecl;
                                        end;

                                        TMKMultiPoint = class
                                        (TOCGenericImport<MKMultiPointClass,
                                        MKMultiPoint>)
                                        end;
                                        PMKMultiPoint = Pointer;

                                        MKPolylineClass = interface
                                        (MKMultiPointClass)
                                        ['{1EDF8A8B-5BBD-4CB2-86FF-F23F8AC15CB9}']
                                        { class } function polylineWithPoints
                                        (points: Pointer; count: NSUInteger)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        polylineWithCoordinates(coords: Pointer;
                                        count: NSUInteger)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        MKPolyline = interface(MKMultiPoint)
                                        ['{8D184DED-70E3-41D5-A4F1-F478EA3A9647}']
                                        end;

                                        TMKPolyline = class
                                        (TOCGenericImport<MKPolylineClass,
                                        MKPolyline>)
                                        end;
                                        PMKPolyline = Pointer;

                                        MKPolygonClass = interface
                                        (MKMultiPointClass)
                                        ['{9BC6FF7C-175F-443F-9A76-66118471A39F}']
                                        [MethodName('polygonWithPoints:count:')]
                                        { class } function
                                        polygonWithPointsCount(points: Pointer;
                                        count: NSUInteger)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('polygonWithPoints:count:interiorPolygons:')
                                        ]
                                        { class } function
                                        polygonWithPointsCountInteriorPolygons
                                        (points: Pointer; count: NSUInteger;
                                        interiorPolygons: NSArray)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('polygonWithCoordinates:count:')]
                                        { class } function
                                        polygonWithCoordinatesCount
                                        (coords: Pointer; count: NSUInteger)
                                        : Pointer { instancetype }; cdecl;
                                        [MethodName
                                        ('polygonWithCoordinates:count:interiorPolygons:')
                                        ]
                                        { class } function
                                        polygonWithCoordinatesCountInteriorPolygons
                                        (coords: Pointer; count: NSUInteger;
                                        interiorPolygons: NSArray)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        MKPolygon = interface(MKMultiPoint)
                                        ['{344164E7-BDD9-423C-9E31-8E984EE2645E}']
                                        function interiorPolygons: NSArray;
                                        cdecl;
                                        end;

                                        TMKPolygon = class
                                        (TOCGenericImport<MKPolygonClass,
                                        MKPolygon>)
                                        end;
                                        PMKPolygon = Pointer;

                                        MKCircleClass = interface(MKShapeClass)
                                        ['{AC9B1228-4F9B-483B-AA7F-CD8280ADFDD0}']
                                        { class } function
                                        circleWithCenterCoordinate
                                        (coord: CLLocationCoordinate2D;
                                        radius: CLLocationDistance)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function circleWithMapRect
                                        (mapRect: MKMapRect)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        MKCircle = interface(MKShape)
                                        ['{950538D1-BD67-4611-993C-15F223339A24}']
                                        function coordinate
                                        : CLLocationCoordinate2D;
                                        cdecl;
                                        function radius
                                        : CLLocationDistance; cdecl;
                                        function boundingMapRect
                                        : MKMapRect; cdecl;
                                        end;

                                        TMKCircle = class
                                        (TOCGenericImport<MKCircleClass,
                                        MKCircle>)
                                        end;
                                        PMKCircle = Pointer;

                                        MKGeodesicPolylineClass = interface
                                        (MKPolylineClass)
                                        ['{D4E77367-1D86-4192-A5D7-FA3AC44D7CFC}']
                                        { class } function polylineWithPoints
                                        (points: Pointer; count: NSUInteger)
                                        : Pointer { instancetype };
                                        cdecl;
                                        { class } function
                                        polylineWithCoordinates(coords: Pointer;
                                        count: NSUInteger)
                                        : Pointer { instancetype }; cdecl;
                                        end;
                                        MKGeodesicPolyline = interface
                                        (MKPolyline)
                                        ['{A562371B-83F1-4FC7-B1BC-F5F8544409D0}']
                                        end;

                                        TMKGeodesicPolyline = class
                                        (TOCGenericImport<
                                        MKGeodesicPolylineClass,
                                        MKGeodesicPolyline>)
                                        end;
                                        PMKGeodesicPolyline = Pointer;

                                        MKOverlayPathRendererClass = interface
                                        (MKOverlayRendererClass)
                                        ['{8D8C1DFE-FA44-4CFB-BC2C-85E92D16B4F6}']
                                        end;
                                        MKOverlayPathRenderer = interface
                                        (MKOverlayRenderer)
                                        ['{EE6526FB-4B2E-4497-8662-29947E657C7D}']
                                        procedure setFillColor
                                        (fillColor: UIColor);
                                        cdecl;
                                        function fillColor: UIColor; cdecl;
                                        procedure setStrokeColor
                                        (strokeColor: UIColor); cdecl;
                                        function strokeColor: UIColor; cdecl;
                                        procedure setLineWidth
                                        (lineWidth: CGFloat); cdecl;
                                        function lineWidth: CGFloat; cdecl;
                                        procedure setLineJoin
                                        (lineJoin: CGLineJoin); cdecl;
                                        function lineJoin: CGLineJoin; cdecl;
                                        procedure setLineCap
                                        (lineCap: CGLineCap); cdecl;
                                        function lineCap: CGLineCap; cdecl;
                                        procedure setMiterLimit
                                        (miterLimit: CGFloat); cdecl;
                                        function miterLimit: CGFloat; cdecl;
                                        procedure setLineDashPhase
                                        (lineDashPhase: CGFloat); cdecl;
                                        function lineDashPhase: CGFloat; cdecl;
                                        procedure setLineDashPattern
                                        (lineDashPattern: NSArray); cdecl;
                                        function lineDashPattern
                                        : NSArray; cdecl;
                                        procedure createPath; cdecl;
                                        procedure setPath
                                        (path: CGPathRef); cdecl;
                                        function path: CGPathRef; cdecl;
                                        procedure invalidatePath; cdecl;
                                        procedure applyStrokePropertiesToContext
                                        (context: CGContextRef;
                                        atZoomScale: MKZoomScale); cdecl;
                                        procedure applyFillPropertiesToContext
                                        (context: CGContextRef;
                                        atZoomScale: MKZoomScale); cdecl;
                                        procedure strokePath(path: CGPathRef;
                                        inContext: CGContextRef); cdecl;
                                        procedure fillPath(path: CGPathRef;
                                        inContext: CGContextRef); cdecl;
                                        end;

                                        TMKOverlayPathRenderer = class
                                        (TOCGenericImport<
                                        MKOverlayPathRendererClass,
                                        MKOverlayPathRenderer>)
                                        end;
                                        PMKOverlayPathRenderer = Pointer;

                                        MKPolygonRendererClass = interface
                                        (MKOverlayPathRendererClass)
                                        ['{5CFF9CD3-0981-45A3-B245-A1E8B5111E99}']
                                        end;
                                        MKPolygonRenderer = interface
                                        (MKOverlayPathRenderer)
                                        ['{C7E3C482-1F29-4C39-8183-9786892AC3A0}']
                                        function initWithPolygon
                                        (polygon: MKPolygon)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function polygon: MKPolygon; cdecl;
                                        end;

                                        TMKPolygonRenderer = class
                                        (TOCGenericImport<
                                        MKPolygonRendererClass,
                                        MKPolygonRenderer>)
                                        end;
                                        PMKPolygonRenderer = Pointer;

                                        MKPolylineRendererClass = interface
                                        (MKOverlayPathRendererClass)
                                        ['{4D84C8DB-5A2D-4573-90D6-FA8CB5ABF1F3}']
                                        end;
                                        MKPolylineRenderer = interface
                                        (MKOverlayPathRenderer)
                                        ['{FABCCA9E-6121-4BC8-A32B-3AC29329B11F}']
                                        function initWithPolyline
                                        (polyline: MKPolyline)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function polyline: MKPolyline; cdecl;
                                        end;

                                        TMKPolylineRenderer = class
                                        (TOCGenericImport<
                                        MKPolylineRendererClass,
                                        MKPolylineRenderer>)
                                        end;
                                        PMKPolylineRenderer = Pointer;

                                        MKCircleRendererClass = interface
                                        (MKOverlayPathRendererClass)
                                        ['{17DD9D92-0E09-41A4-9FCB-5F88D90911C3}']
                                        end;
                                        MKCircleRenderer = interface
                                        (MKOverlayPathRenderer)
                                        ['{03E9097F-6C8F-4756-9E42-3A8B15B37461}']
                                        function initWithCircle
                                        (circle: MKCircle)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function circle: MKCircle; cdecl;
                                        end;

                                        TMKCircleRenderer = class
                                        (TOCGenericImport<MKCircleRendererClass,
                                        MKCircleRenderer>)
                                        end;
                                        PMKCircleRenderer = Pointer;

                                        MKLocalSearchRequestClass = interface
                                        (NSObjectClass)
                                        ['{C54F5D3F-8CEF-41DB-9A15-3AF47BD7BE71}']
                                        end;
                                        MKLocalSearchRequest = interface
                                        (NSObject)
                                        ['{B74DD5C6-D069-45EB-B145-1845FC2702CA}']
                                        procedure setNaturalLanguageQuery
                                        (naturalLanguageQuery: NSString);
                                        cdecl;
                                        function naturalLanguageQuery
                                        : NSString; cdecl;
                                        procedure setRegion
                                        (region: MKCoordinateRegion); cdecl;
                                        function region
                                        : MKCoordinateRegion; cdecl;
                                        function initWithCompletion
                                        (completion: MKLocalSearchCompletion)
                                        : Pointer { instancetype }; cdecl;
                                        end;

                                        TMKLocalSearchRequest = class
                                        (TOCGenericImport<
                                        MKLocalSearchRequestClass,
                                        MKLocalSearchRequest>)
                                        end;
                                        PMKLocalSearchRequest = Pointer;

                                        MKLocalSearchResponseClass = interface
                                        (NSObjectClass)
                                        ['{8C4C3DD0-07CE-4F14-AEF0-7D4234C0856D}']
                                        end;
                                        MKLocalSearchResponse = interface
                                        (NSObject)
                                        ['{C75323AC-CDFE-498F-80BE-800928B589EA}']
                                        function mapItems: NSArray;
                                        cdecl;
                                        function boundingRegion
                                        : MKCoordinateRegion; cdecl;
                                        end;

                                        TMKLocalSearchResponse = class
                                        (TOCGenericImport<
                                        MKLocalSearchResponseClass,
                                        MKLocalSearchResponse>)
                                        end;
                                        PMKLocalSearchResponse = Pointer;

                                        MKLocalSearchClass = interface
                                        (NSObjectClass)
                                        ['{A554B0A4-F647-45BE-92BC-7204236E0464}']
                                        end;
                                        MKLocalSearch = interface(NSObject)
                                        ['{9BB8AB6B-A55F-4220-96ED-3C7EF304E7EB}']
                                        function initWithRequest
                                        (request: MKLocalSearchRequest)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure startWithCompletionHandler
                                        (completionHandler
                                        : MKLocalSearchCompletionHandler);
                                        cdecl;
                                        procedure cancel; cdecl;
                                        function isSearching: Boolean; cdecl;
                                        end;

                                        TMKLocalSearch = class
                                        (TOCGenericImport<MKLocalSearchClass,
                                        MKLocalSearch>)
                                        end;
                                        PMKLocalSearch = Pointer;

                                        MKLocalSearchCompletionClass = interface
                                        (NSObjectClass)
                                        ['{ECB09170-38E9-4D6C-AF2E-F117E8B70FC5}']
                                        end;
                                        MKLocalSearchCompletion = interface
                                        (NSObject)
                                        ['{D6E45B9F-2E84-4004-BCB9-19AA66E34A80}']
                                        function title: NSString;
                                        cdecl;
                                        function titleHighlightRanges
                                        : NSArray; cdecl;
                                        function subtitle: NSString; cdecl;
                                        function subtitleHighlightRanges
                                        : NSArray; cdecl;
                                        end;

                                        TMKLocalSearchCompletion = class
                                        (TOCGenericImport<
                                        MKLocalSearchCompletionClass,
                                        MKLocalSearchCompletion>)
                                        end;
                                        PMKLocalSearchCompletion = Pointer;

                                        MKLocalSearchCompleterClass = interface
                                        (NSObjectClass)
                                        ['{9FD37F84-C4EC-4847-A461-DB4E8FFAF114}']
                                        end;
                                        MKLocalSearchCompleter = interface
                                        (NSObject)
                                        ['{D707F3B3-4021-44D5-ABAA-1895EA2CB63B}']
                                        procedure setQueryFragment
                                        (queryFragment: NSString);
                                        cdecl;
                                        function queryFragment: NSString; cdecl;
                                        procedure setRegion
                                        (region: MKCoordinateRegion); cdecl;
                                        function region
                                        : MKCoordinateRegion; cdecl;
                                        procedure setFilterType
                                        (filterType
                                        : MKSearchCompletionFilterType); cdecl;
                                        function filterType
                                        : MKSearchCompletionFilterType; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        function results: NSArray; cdecl;
                                        function isSearching: Boolean; cdecl;
                                        procedure cancel; cdecl;
                                        end;

                                        TMKLocalSearchCompleter = class
                                        (TOCGenericImport<
                                        MKLocalSearchCompleterClass,
                                        MKLocalSearchCompleter>)
                                        end;
                                        PMKLocalSearchCompleter = Pointer;

                                        MKDirectionsRequestClass = interface
                                        (NSObjectClass)
                                        ['{29C6E36F-5E61-4903-B5B4-E9F5BA5C4C85}']
                                        { class } function
                                        isDirectionsRequestURL(url: NSURL)
                                        : Boolean;
                                        cdecl;
                                        end;
                                        MKDirectionsRequest = interface
                                        (NSObject)
                                        ['{CFF2AD13-28BA-4D39-BE7D-FD64EFEB953A}']
                                        function source: MKMapItem;
                                        cdecl;
                                        procedure setSource
                                        (source: MKMapItem); cdecl;
                                        function destination: MKMapItem; cdecl;
                                        procedure setDestination
                                        (destination: MKMapItem); cdecl;
                                        procedure setTransportType
                                        (transportType
                                        : MKDirectionsTransportType); cdecl;
                                        function transportType
                                        : MKDirectionsTransportType; cdecl;
                                        procedure setRequestsAlternateRoutes
                                        (requestsAlternateRoutes
                                        : Boolean); cdecl;
                                        function requestsAlternateRoutes
                                        : Boolean; cdecl;
                                        procedure setDepartureDate
                                        (departureDate: NSDate); cdecl;
                                        function departureDate: NSDate; cdecl;
                                        procedure setArrivalDate
                                        (arrivalDate: NSDate); cdecl;
                                        function arrivalDate: NSDate; cdecl;
                                        function initWithContentsOfURL
                                        (url: NSURL)
                                        : Pointer { instancetype }; cdecl;
                                        end;

                                        TMKDirectionsRequest = class
                                        (TOCGenericImport<
                                        MKDirectionsRequestClass,
                                        MKDirectionsRequest>)
                                        end;
                                        PMKDirectionsRequest = Pointer;

                                        MKDirectionsResponseClass = interface
                                        (NSObjectClass)
                                        ['{96D10F03-7221-47DA-8942-DBC2D21F17E9}']
                                        end;
                                        MKDirectionsResponse = interface
                                        (NSObject)
                                        ['{5A8847B7-6039-44FA-B041-62D14C4689FB}']
                                        function source: MKMapItem;
                                        cdecl;
                                        function destination: MKMapItem; cdecl;
                                        function routes: NSArray; cdecl;
                                        end;

                                        TMKDirectionsResponse = class
                                        (TOCGenericImport<
                                        MKDirectionsResponseClass,
                                        MKDirectionsResponse>)
                                        end;
                                        PMKDirectionsResponse = Pointer;

                                        MKETAResponseClass = interface
                                        (NSObjectClass)
                                        ['{B7BC19AE-2F85-4D8F-88A5-70D016CF308C}']
                                        end;
                                        MKETAResponse = interface(NSObject)
                                        ['{7B243EA3-6665-444D-8C00-6A94D817F02E}']
                                        function source: MKMapItem;
                                        cdecl;
                                        function destination: MKMapItem; cdecl;
                                        function expectedTravelTime
                                        : NSTimeInterval; cdecl;
                                        function distance
                                        : CLLocationDistance; cdecl;
                                        function expectedArrivalDate
                                        : NSDate; cdecl;
                                        function expectedDepartureDate
                                        : NSDate; cdecl;
                                        function transportType
                                        : MKDirectionsTransportType; cdecl;
                                        end;

                                        TMKETAResponse = class
                                        (TOCGenericImport<MKETAResponseClass,
                                        MKETAResponse>)
                                        end;
                                        PMKETAResponse = Pointer;

                                        MKDirectionsClass = interface
                                        (NSObjectClass)
                                        ['{AECF3CDD-0F28-4738-9C4D-89C42D6A9A02}']
                                        end;
                                        MKDirections = interface(NSObject)
                                        ['{69B3CF8F-E7D8-47DD-9EBE-016B85C97ADD}']
                                        function initWithRequest
                                        (request: MKDirectionsRequest)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure calculateDirectionsWithCompletionHandler
                                        (completionHandler
                                        : MKDirectionsHandler); cdecl;
                                        procedure calculateETAWithCompletionHandler
                                        (completionHandler
                                        : MKETAHandler); cdecl;
                                        procedure cancel; cdecl;
                                        function isCalculating: Boolean; cdecl;
                                        end;

                                        TMKDirections = class
                                        (TOCGenericImport<MKDirectionsClass,
                                        MKDirections>)
                                        end;
                                        PMKDirections = Pointer;

                                        MKRouteClass = interface(NSObjectClass)
                                        ['{DAF905B1-963F-4286-9D39-FBE3FBBAEBAB}']
                                        end;
                                        MKRoute = interface(NSObject)
                                        ['{82F8383F-9E01-46D5-9150-D69DD7EA188C}']
                                        function name: NSString;
                                        cdecl;
                                        function advisoryNotices
                                        : NSArray; cdecl;
                                        function distance
                                        : CLLocationDistance; cdecl;
                                        function expectedTravelTime
                                        : NSTimeInterval; cdecl;
                                        function transportType
                                        : MKDirectionsTransportType; cdecl;
                                        function polyline: MKPolyline; cdecl;
                                        function steps: NSArray; cdecl;
                                        end;

                                        TMKRoute = class
                                        (TOCGenericImport<
                                        MKRouteClass, MKRoute>)
                                        end;
                                        PMKRoute = Pointer;

                                        MKRouteStepClass = interface
                                        (NSObjectClass)
                                        ['{9B895C24-C386-4045-9276-BED78F5A1D70}']
                                        end;
                                        MKRouteStep = interface(NSObject)
                                        ['{6F205E05-7775-4D22-8FEC-063766857546}']
                                        function instructions: NSString;
                                        cdecl;
                                        function notice: NSString; cdecl;
                                        function polyline: MKPolyline; cdecl;
                                        function distance
                                        : CLLocationDistance; cdecl;
                                        function transportType
                                        : MKDirectionsTransportType; cdecl;
                                        end;

                                        TMKRouteStep = class
                                        (TOCGenericImport<MKRouteStepClass,
                                        MKRouteStep>)
                                        end;
                                        PMKRouteStep = Pointer;

                                        MKMapSnapshotOptionsClass = interface
                                        (NSObjectClass)
                                        ['{84FEA5FF-7971-4157-A185-7CB67B5A5CD1}']
                                        end;
                                        MKMapSnapshotOptions = interface
                                        (NSObject)
                                        ['{224B5F58-B95A-41FC-AC37-8BBBC932FCD8}']
                                        procedure setCamera
                                        (camera: MKMapCamera);
                                        cdecl;
                                        function camera: MKMapCamera; cdecl;
                                        procedure setMapRect
                                        (mapRect: MKMapRect); cdecl;
                                        function mapRect: MKMapRect; cdecl;
                                        procedure setRegion
                                        (region: MKCoordinateRegion); cdecl;
                                        function region
                                        : MKCoordinateRegion; cdecl;
                                        procedure setMapType
                                        (mapType: MKMapType); cdecl;
                                        function mapType: MKMapType; cdecl;
                                        procedure setShowsPointsOfInterest
                                        (showsPointsOfInterest: Boolean); cdecl;
                                        function showsPointsOfInterest
                                        : Boolean; cdecl;
                                        procedure setShowsBuildings
                                        (showsBuildings: Boolean); cdecl;
                                        function showsBuildings: Boolean; cdecl;
                                        procedure setSize(size: CGSize); cdecl;
                                        function size: CGSize; cdecl;
                                        procedure setScale
                                        (scale: CGFloat); cdecl;
                                        function scale: CGFloat; cdecl;
                                        end;

                                        TMKMapSnapshotOptions = class
                                        (TOCGenericImport<
                                        MKMapSnapshotOptionsClass,
                                        MKMapSnapshotOptions>)
                                        end;
                                        PMKMapSnapshotOptions = Pointer;

                                        MKMapSnapshotClass = interface
                                        (NSObjectClass)
                                        ['{EF38BDD9-0065-4EA4-BF1C-DA6D8AE0D146}']
                                        end;
                                        MKMapSnapshot = interface(NSObject)
                                        ['{E726CD33-6989-46FF-A6C6-1B4A00EA29A0}']
                                        function image: UIImage;
                                        cdecl;
                                        function pointForCoordinate
                                        (coordinate: CLLocationCoordinate2D)
                                        : CGPoint; cdecl;
                                        end;

                                        TMKMapSnapshot = class
                                        (TOCGenericImport<MKMapSnapshotClass,
                                        MKMapSnapshot>)
                                        end;
                                        PMKMapSnapshot = Pointer;

                                        MKMapSnapshotterClass = interface
                                        (NSObjectClass)
                                        ['{67292032-4A8F-4A89-89C4-2345D1FF5E93}']
                                        end;
                                        MKMapSnapshotter = interface(NSObject)
                                        ['{075F4B52-BBC2-4766-8415-1BA5381A7001}']
                                        function initWithOptions
                                        (options: MKMapSnapshotOptions)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure startWithCompletionHandler
                                        (completionHandler
                                        : MKMapSnapshotCompletionHandler);
                                        cdecl;
                                        procedure startWithQueue
                                        (queue: dispatch_queue_t;
                                        completionHandler
                                        : MKMapSnapshotCompletionHandler);
                                        cdecl;
                                        procedure cancel; cdecl;
                                        function isLoading: Boolean; cdecl;
                                        end;

                                        TMKMapSnapshotter = class
                                        (TOCGenericImport<MKMapSnapshotterClass,
                                        MKMapSnapshotter>)
                                        end;
                                        PMKMapSnapshotter = Pointer;

                                        MKTileOverlayClass = interface
                                        (NSObjectClass)
                                        ['{714481FB-A2FB-47CE-8A0E-5CCDF1C653E6}']
                                        end;
                                        MKTileOverlay = interface(NSObject)
                                        ['{D0F9ADB7-F4CB-44CF-B85E-B141820040AC}']
                                        function initWithURLTemplate
                                        (URLTemplate: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setTileSize
                                        (tileSize: CGSize); cdecl;
                                        function tileSize: CGSize; cdecl;
                                        procedure setGeometryFlipped
                                        (geometryFlipped: Boolean); cdecl;
                                        function isGeometryFlipped
                                        : Boolean; cdecl;
                                        procedure setMinimumZ
                                        (minimumZ: NSInteger); cdecl;
                                        function minimumZ: NSInteger; cdecl;
                                        procedure setMaximumZ
                                        (maximumZ: NSInteger); cdecl;
                                        function maximumZ: NSInteger; cdecl;
                                        function URLTemplate: NSString; cdecl;
                                        procedure setCanReplaceMapContent
                                        (canReplaceMapContent: Boolean); cdecl;
                                        function canReplaceMapContent
                                        : Boolean; cdecl;
                                        function URLForTilePath
                                        (path: MKTileOverlayPath): NSURL; cdecl;
                                        procedure loadTileAtPath
                                        (path: MKTileOverlayPath;
                                        result: TMapKitResult); cdecl;
                                        end;

                                        TMKTileOverlay = class
                                        (TOCGenericImport<MKTileOverlayClass,
                                        MKTileOverlay>)
                                        end;
                                        PMKTileOverlay = Pointer;

                                        MKTileOverlayRendererClass = interface
                                        (MKOverlayRendererClass)
                                        ['{96C191A8-BD5A-4E19-9C4D-9C9B827D8424}']
                                        end;
                                        MKTileOverlayRenderer = interface
                                        (MKOverlayRenderer)
                                        ['{CB7463D5-B9F7-4867-98EE-CB0633D863BA}']
                                        function initWithTileOverlay
                                        (overlay: MKTileOverlay)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure reloadData; cdecl;
                                        end;

                                        TMKTileOverlayRenderer = class
                                        (TOCGenericImport<
                                        MKTileOverlayRendererClass,
                                        MKTileOverlayRenderer>)
                                        end;
                                        PMKTileOverlayRenderer = Pointer;

                                        MKReverseGeocoderClass = interface
                                        (NSObjectClass)
                                        ['{85D1114D-7F82-4095-8268-00F136B590ED}']
                                        end;
                                        MKReverseGeocoder = interface(NSObject)
                                        ['{1E392E7B-FD4B-449C-B680-F12F9D7934EF}']
                                        function initWithCoordinate
                                        (coordinate: CLLocationCoordinate2D)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure start; cdecl;
                                        procedure cancel; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        function coordinate
                                        : CLLocationCoordinate2D; cdecl;
                                        function placemark: MKPlacemark; cdecl;
                                        function isQuerying: Boolean; cdecl;
                                        end;

                                        TMKReverseGeocoder = class
                                        (TOCGenericImport<
                                        MKReverseGeocoderClass,
                                        MKReverseGeocoder>)
                                        end;
                                        PMKReverseGeocoder = Pointer;

                                        MKOverlayPathViewClass = interface
                                        (MKOverlayViewClass)
                                        ['{EDF4AAA1-465D-4EAA-83C1-3BAD2F71C25B}']
                                        end;
                                        MKOverlayPathView = interface
                                        (MKOverlayView)
                                        ['{E0C76A87-7B72-4151-80D6-67B139A33CD0}']
                                        procedure setFillColor
                                        (fillColor: UIColor);
                                        cdecl;
                                        function fillColor: UIColor; cdecl;
                                        procedure setStrokeColor
                                        (strokeColor: UIColor); cdecl;
                                        function strokeColor: UIColor; cdecl;
                                        procedure setLineWidth
                                        (lineWidth: CGFloat); cdecl;
                                        function lineWidth: CGFloat; cdecl;
                                        procedure setLineJoin
                                        (lineJoin: CGLineJoin); cdecl;
                                        function lineJoin: CGLineJoin; cdecl;
                                        procedure setLineCap
                                        (lineCap: CGLineCap); cdecl;
                                        function lineCap: CGLineCap; cdecl;
                                        procedure setMiterLimit
                                        (miterLimit: CGFloat); cdecl;
                                        function miterLimit: CGFloat; cdecl;
                                        procedure setLineDashPhase
                                        (lineDashPhase: CGFloat); cdecl;
                                        function lineDashPhase: CGFloat; cdecl;
                                        procedure setLineDashPattern
                                        (lineDashPattern: NSArray); cdecl;
                                        function lineDashPattern
                                        : NSArray; cdecl;
                                        procedure createPath; cdecl;
                                        procedure setPath
                                        (path: CGPathRef); cdecl;
                                        function path: CGPathRef; cdecl;
                                        procedure invalidatePath; cdecl;
                                        procedure applyStrokePropertiesToContext
                                        (context: CGContextRef;
                                        atZoomScale: MKZoomScale); cdecl;
                                        procedure applyFillPropertiesToContext
                                        (context: CGContextRef;
                                        atZoomScale: MKZoomScale); cdecl;
                                        procedure strokePath(path: CGPathRef;
                                        inContext: CGContextRef); cdecl;
                                        procedure fillPath(path: CGPathRef;
                                        inContext: CGContextRef); cdecl;
                                        end;

                                        TMKOverlayPathView = class
                                        (TOCGenericImport<
                                        MKOverlayPathViewClass,
                                        MKOverlayPathView>)
                                        end;
                                        PMKOverlayPathView = Pointer;

                                        MKPolygonViewClass = interface
                                        (MKOverlayPathViewClass)
                                        ['{6A01F9FC-3505-457B-9036-0F884E65AE92}']
                                        end;
                                        MKPolygonView = interface
                                        (MKOverlayPathView)
                                        ['{3FE0DABF-6A9E-41A0-AC90-8C6363A5C9E5}']
                                        function initWithPolygon
                                        (polygon: MKPolygon)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function polygon: MKPolygon; cdecl;
                                        end;

                                        TMKPolygonView = class
                                        (TOCGenericImport<MKPolygonViewClass,
                                        MKPolygonView>)
                                        end;
                                        PMKPolygonView = Pointer;

                                        MKPolylineViewClass = interface
                                        (MKOverlayPathViewClass)
                                        ['{83B3FDE4-6293-4821-A206-F8C60EB1C4E2}']
                                        end;
                                        MKPolylineView = interface
                                        (MKOverlayPathView)
                                        ['{6EB8EC00-985C-49CE-9206-294DA01D368E}']
                                        function initWithPolyline
                                        (polyline: MKPolyline)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function polyline: MKPolyline; cdecl;
                                        end;

                                        TMKPolylineView = class
                                        (TOCGenericImport<MKPolylineViewClass,
                                        MKPolylineView>)
                                        end;
                                        PMKPolylineView = Pointer;

                                        MKCircleViewClass = interface
                                        (MKOverlayPathViewClass)
                                        ['{24DD21B5-7015-4C89-A47E-011CE746CBBD}']
                                        end;
                                        MKCircleView = interface
                                        (MKOverlayPathView)
                                        ['{43CBD39C-C664-47CE-9FD5-C29D0B380A05}']
                                        function initWithCircle
                                        (circle: MKCircle)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function circle: MKCircle; cdecl;
                                        end;

                                        TMKCircleView = class
                                        (TOCGenericImport<MKCircleViewClass,
                                        MKCircleView>)
                                        end;
                                        PMKCircleView = Pointer;

                                        MKUserTrackingBarButtonItemClass =
                                        interface(UIBarButtonItemClass)
                                        ['{A1A2E23A-4372-48B8-B1E2-E3F1E282E45C}']
                                        end;
                                        MKUserTrackingBarButtonItem = interface
                                        (UIBarButtonItem)
                                        ['{E4CEFDD9-47CC-4728-B5E0-F302AA03654F}']
                                        function initWithMapView
                                        (mapView: MKMapView)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setMapView
                                        (mapView: MKMapView); cdecl;
                                        function mapView: MKMapView; cdecl;
                                        end;

                                        TMKUserTrackingBarButtonItem = class
                                        (TOCGenericImport<
                                        MKUserTrackingBarButtonItemClass,
                                        MKUserTrackingBarButtonItem>)
                                        end;
                                        PMKUserTrackingBarButtonItem = Pointer;

                                        // ===== Protocol declarations =====

                                        MKAnnotation = interface(IObjectiveC)
                                        ['{9C980D7E-7308-471C-AA65-63100FF2E250}']
                                        function coordinate
                                        : CLLocationCoordinate2D;
                                        cdecl;
                                        function title: NSString; cdecl;
                                        function subtitle: NSString; cdecl;
                                        procedure setCoordinate
                                        (newCoordinate
                                        : CLLocationCoordinate2D); cdecl;
                                        end;

                                        MKOverlay = interface(IObjectiveC)
                                        ['{60E94A29-9E84-4B28-8452-E52B190BD863}']
                                        function coordinate
                                        : CLLocationCoordinate2D;
                                        cdecl;
                                        function boundingMapRect
                                        : MKMapRect; cdecl;
                                        function intersectsMapRect
                                        (mapRect: MKMapRect): Boolean; cdecl;
                                        function canReplaceMapContent
                                        : Boolean; cdecl;
                                        end;

                                        MKMapViewDelegate = interface
                                        (IObjectiveC)
                                        ['{AF44EFB4-88B3-4F77-8236-3DE7EE8960B8}']
                                        [MethodName
                                        ('mapView:regionWillChangeAnimated:')]
                                        procedure mapViewRegionWillChangeAnimated
                                        (mapView: MKMapView;
                                        regionWillChangeAnimated: Boolean);
                                        cdecl;
                                        [MethodName
                                        ('mapView:regionDidChangeAnimated:')]
                                        procedure mapViewRegionDidChangeAnimated
                                        (mapView: MKMapView;
                                        regionDidChangeAnimated
                                        : Boolean); cdecl;
                                        procedure mapViewWillStartLoadingMap
                                        (mapView: MKMapView); cdecl;
                                        procedure mapViewDidFinishLoadingMap
                                        (mapView: MKMapView); cdecl;
                                        procedure mapViewDidFailLoadingMap
                                        (mapView: MKMapView;
                                        withError: NSError); cdecl;
                                        procedure mapViewWillStartRenderingMap
                                        (mapView: MKMapView); cdecl;
                                        procedure mapViewDidFinishRenderingMap
                                        (mapView: MKMapView;
                                        fullyRendered: Boolean); cdecl;
                                        [MethodName
                                        ('mapView:viewForAnnotation:')]
                                        function mapViewViewForAnnotation
                                        (mapView: MKMapView;
                                        viewForAnnotation: Pointer)
                                        : MKAnnotationView; cdecl;
                                        [MethodName
                                        ('mapView:didAddAnnotationViews:')]
                                        procedure mapViewDidAddAnnotationViews
                                        (mapView: MKMapView;
                                        didAddAnnotationViews: NSArray); cdecl;
                                        [MethodName
                                        ('mapView:annotationView:calloutAccessoryControlTapped:')
                                        ]
                                        procedure mapViewAnnotationViewCalloutAccessoryControlTapped
                                        (mapView: MKMapView;
                                        annotationView: MKAnnotationView;
                                        calloutAccessoryControlTapped
                                        : UIControl); cdecl;
                                        [MethodName
                                        ('mapView:didSelectAnnotationView:')]
                                        procedure mapViewDidSelectAnnotationView
                                        (mapView: MKMapView;
                                        didSelectAnnotationView
                                        : MKAnnotationView); cdecl;
                                        [MethodName
                                        ('mapView:didDeselectAnnotationView:')]
                                        procedure mapViewDidDeselectAnnotationView
                                        (mapView: MKMapView;
                                        didDeselectAnnotationView
                                        : MKAnnotationView); cdecl;
                                        procedure mapViewWillStartLocatingUser
                                        (mapView: MKMapView); cdecl;
                                        procedure mapViewDidStopLocatingUser
                                        (mapView: MKMapView); cdecl;
                                        [MethodName
                                        ('mapView:didUpdateUserLocation:')]
                                        procedure mapViewDidUpdateUserLocation
                                        (mapView: MKMapView;
                                        didUpdateUserLocation
                                        : MKUserLocation); cdecl;
                                        [MethodName
                                        ('mapView:didFailToLocateUserWithError:')
                                        ]
                                        procedure mapViewDidFailToLocateUserWithError
                                        (mapView: MKMapView;
                                        didFailToLocateUserWithError
                                        : NSError); cdecl;
                                        [MethodName
                                        ('mapView:annotationView:didChangeDragState:fromOldState:')
                                        ]
                                        procedure mapViewAnnotationViewDidChangeDragStateFromOldState
                                        (mapView: MKMapView;
                                        annotationView: MKAnnotationView;
                                        didChangeDragState
                                        : MKAnnotationViewDragState;
                                        fromOldState
                                        : MKAnnotationViewDragState); cdecl;
                                        [MethodName
                                        ('mapView:didChangeUserTrackingMode:animated:')
                                        ]
                                        procedure mapViewDidChangeUserTrackingModeAnimated
                                        (mapView: MKMapView;
                                        didChangeUserTrackingMode
                                        : MKUserTrackingMode;
                                        animated: Boolean); cdecl;
                                        [MethodName
                                        ('mapView:rendererForOverlay:')]
                                        function mapViewRendererForOverlay
                                        (mapView: MKMapView;
                                        rendererForOverlay: Pointer)
                                        : MKOverlayRenderer; cdecl;
                                        [MethodName
                                        ('mapView:didAddOverlayRenderers:')]
                                        procedure mapViewDidAddOverlayRenderers
                                        (mapView: MKMapView;
                                        didAddOverlayRenderers: NSArray); cdecl;
                                        [MethodName('mapView:viewForOverlay:')]
                                        function mapViewViewForOverlay
                                        (mapView: MKMapView;
                                        viewForOverlay: Pointer)
                                        : MKOverlayView; cdecl;
                                        [MethodName
                                        ('mapView:didAddOverlayViews:')]
                                        procedure mapViewDidAddOverlayViews
                                        (mapView: MKMapView;
                                        didAddOverlayViews: NSArray); cdecl;
                                        end;

                                        MKLocalSearchCompleterDelegate =
                                        interface(IObjectiveC)
                                        ['{B58E7961-30E2-4E5B-8517-DF96CAF3B0F4}']
                                        procedure completerDidUpdateResults
                                        (completer: MKLocalSearchCompleter);
                                        cdecl;
                                        procedure completer
                                        (completer: MKLocalSearchCompleter;
                                        didFailWithError: NSError); cdecl;
                                        end;

                                        MKReverseGeocoderDelegate = interface
                                        (IObjectiveC)
                                        ['{0BCF5080-4BB9-4672-91D5-70896B575D5B}']
                                        [MethodName
                                        ('reverseGeocoder:didFindPlacemark:')]
                                        procedure reverseGeocoderDidFindPlacemark
                                        (geocoder: MKReverseGeocoder;
                                        didFindPlacemark: MKPlacemark);
                                        cdecl;
                                        [MethodName
                                        ('reverseGeocoder:didFailWithError:')]
                                        procedure reverseGeocoderDidFailWithError
                                        (geocoder: MKReverseGeocoder;
                                        didFailWithError: NSError); cdecl;
                                        end;

                                        // ===== Exported string consts =====

                                        function MKMapSizeWorld: Pointer;
                                        function MKMapRectWorld: Pointer;
                                        function MKMapRectNull: Pointer;
                                        function MKLaunchOptionsDirectionsModeKey
                                        : NSString;
                                        function MKLaunchOptionsMapTypeKey
                                        : NSString;
                                        function MKLaunchOptionsShowsTrafficKey
                                        : NSString;
                                        function MKLaunchOptionsDirectionsModeDriving
                                        : NSString;
                                        function MKLaunchOptionsDirectionsModeWalking
                                        : NSString;
                                        function MKLaunchOptionsDirectionsModeTransit
                                        : NSString;
                                        function MKLaunchOptionsMapCenterKey
                                        : NSString;
                                        function MKLaunchOptionsMapSpanKey
                                        : NSString;
                                        function MKLaunchOptionsCameraKey
                                        : NSString;
                                        function MKAnnotationCalloutInfoDidChangeNotification
                                        : NSString;
                                        function MKErrorDomain: NSString;


                                        // ===== External functions =====

                                        const
                                        libMapKit =
                                        '/System/Library/Frameworks/MapKit.framework/MapKit';
                                        function MKCoordinateSpanMake
                                        (latitudeDelta: CLLocationDegrees;
                                        longitudeDelta: CLLocationDegrees)
                                        : MKCoordinateSpan; cdecl;
                                        external libMapKit name _PU +
                                        'MKCoordinateSpanMake';
                                        function MKCoordinateRegionMake
                                        (centerCoordinate
                                        : CLLocationCoordinate2D;
                                        span: MKCoordinateSpan)
                                        : MKCoordinateRegion; cdecl;
                                        external libMapKit name _PU +
                                        'MKCoordinateRegionMake';
                                        function MKCoordinateRegionMakeWithDistance
                                        (centerCoordinate
                                        : CLLocationCoordinate2D;
                                        latitudinalMeters: CLLocationDistance;
                                        longitudinalMeters: CLLocationDistance)
                                        : MKCoordinateRegion; cdecl;
                                        external libMapKit name _PU +
                                        'MKCoordinateRegionMakeWithDistance';
                                        function MKMapPointForCoordinate
                                        (coordinate: CLLocationCoordinate2D)
                                        : MKMapPoint; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapPointForCoordinate';
                                        function MKCoordinateForMapPoint
                                        (mapPoint: MKMapPoint)
                                        : CLLocationCoordinate2D; cdecl;
                                        external libMapKit name _PU +
                                        'MKCoordinateForMapPoint';
                                        function MKMetersPerMapPointAtLatitude
                                        (latitude: CLLocationDegrees)
                                        : CLLocationDistance; cdecl;
                                        external libMapKit name _PU +
                                        'MKMetersPerMapPointAtLatitude';
                                        function MKMapPointsPerMeterAtLatitude
                                        (latitude: CLLocationDegrees): Double;
                                        cdecl; external libMapKit name _PU +
                                        'MKMapPointsPerMeterAtLatitude';
                                        function MKMetersBetweenMapPoints
                                        (a: MKMapPoint; b: MKMapPoint)
                                        : CLLocationDistance; cdecl;
                                        external libMapKit name _PU +
                                        'MKMetersBetweenMapPoints';
                                        function MKMapPointMake(x: Double;
                                        y: Double): MKMapPoint; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapPointMake';
                                        function MKMapSizeMake(width: Double;
                                        height: Double): MKMapSize; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapSizeMake';
                                        function MKMapRectMake(x: Double;
                                        y: Double; width: Double;
                                        height: Double): MKMapRect; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectMake';
                                        function MKMapRectGetMinX
                                        (rect: MKMapRect): Double; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectGetMinX';
                                        function MKMapRectGetMinY
                                        (rect: MKMapRect): Double; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectGetMinY';
                                        function MKMapRectGetMidX
                                        (rect: MKMapRect): Double; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectGetMidX';
                                        function MKMapRectGetMidY
                                        (rect: MKMapRect): Double; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectGetMidY';
                                        function MKMapRectGetMaxX
                                        (rect: MKMapRect): Double; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectGetMaxX';
                                        function MKMapRectGetMaxY
                                        (rect: MKMapRect): Double; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectGetMaxY';
                                        function MKMapRectGetWidth
                                        (rect: MKMapRect): Double; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectGetWidth';
                                        function MKMapRectGetHeight
                                        (rect: MKMapRect): Double; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectGetHeight';
                                        function MKMapPointEqualToPoint
                                        (point1: MKMapPoint; point2: MKMapPoint)
                                        : Boolean; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapPointEqualToPoint';
                                        function MKMapSizeEqualToSize
                                        (size1: MKMapSize; size2: MKMapSize)
                                        : Boolean; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapSizeEqualToSize';
                                        function MKMapRectEqualToRect
                                        (rect1: MKMapRect; rect2: MKMapRect)
                                        : Boolean; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectEqualToRect';
                                        function MKMapRectIsNull
                                        (rect: MKMapRect): Boolean; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectIsNull';
                                        function MKMapRectIsEmpty
                                        (rect: MKMapRect): Boolean; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectIsEmpty';
                                        function MKStringFromMapPoint
                                        (point: MKMapPoint)
                                        : Pointer { NSString }; cdecl;
                                        external libMapKit name _PU +
                                        'MKStringFromMapPoint';
                                        function MKStringFromMapSize
                                        (size: MKMapSize): Pointer { NSString };
                                        cdecl; external libMapKit name _PU +
                                        'MKStringFromMapSize';
                                        function MKStringFromMapRect
                                        (rect: MKMapRect): Pointer { NSString };
                                        cdecl; external libMapKit name _PU +
                                        'MKStringFromMapRect';
                                        function MKMapRectUnion
                                        (rect1: MKMapRect; rect2: MKMapRect)
                                        : MKMapRect; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectUnion';
                                        function MKMapRectIntersection
                                        (rect1: MKMapRect; rect2: MKMapRect)
                                        : MKMapRect; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectIntersection';
                                        function MKMapRectInset(rect: MKMapRect;
                                        dx: Double; dy: Double): MKMapRect;
                                        cdecl; external libMapKit name _PU +
                                        'MKMapRectInset';
                                        function MKMapRectOffset
                                        (rect: MKMapRect; dx: Double;
                                        dy: Double): MKMapRect; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectOffset';
                                        procedure MKMapRectDivide
                                        (rect: MKMapRect; slice: Pointer;
                                        remainder: Pointer; amount: Double;
                                        edge: CGRectEdge); cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectDivide';
                                        function MKMapRectContainsPoint
                                        (rect: MKMapRect; point: MKMapPoint)
                                        : Boolean; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectContainsPoint';
                                        function MKMapRectContainsRect
                                        (rect1: MKMapRect; rect2: MKMapRect)
                                        : Boolean; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectContainsRect';
                                        function MKMapRectIntersectsRect
                                        (rect1: MKMapRect; rect2: MKMapRect)
                                        : Boolean; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectIntersectsRect';
                                        function MKCoordinateRegionForMapRect
                                        (rect: MKMapRect): MKCoordinateRegion;
                                        cdecl; external libMapKit name _PU +
                                        'MKCoordinateRegionForMapRect';
                                        function MKMapRectSpans180thMeridian
                                        (rect: MKMapRect): Boolean; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectSpans180thMeridian';
                                        function MKMapRectRemainder
                                        (rect: MKMapRect): MKMapRect; cdecl;
                                        external libMapKit name _PU +
                                        'MKMapRectRemainder';
                                        function MKRoadWidthAtZoomScale
                                        (zoomScale: MKZoomScale): CGFloat;
                                        cdecl; external libMapKit name _PU +
                                        'MKRoadWidthAtZoomScale';

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

function MKAnnotationCalloutInfoDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libMapKit,
    'MKAnnotationCalloutInfoDidChangeNotification');
end;

function MKErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libMapKit, 'MKErrorDomain');
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

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MapKitModule := dlopen(MarshaledAString(libMapKit), RTLD_LAZY);

finalization

dlclose(MapKitModule);
{$ENDIF IOS}

end.
