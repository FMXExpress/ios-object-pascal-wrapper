{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework iAd
//

unit iOSapi.iAd;

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
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  ADErrorUnknown = 0;
  ADErrorServerFailure = 1;
  ADErrorLoadingThrottled = 2;
  ADErrorInventoryUnavailable = 3;
  ADErrorConfigurationError = 4;
  ADErrorBannerVisibleWithoutContent = 5;
  ADErrorApplicationInactive = 6;
  ADErrorAdUnloaded = 7;
  ADErrorAssetLoadFailure = 8;
  ADAdTypeBanner = 0;
  ADAdTypeMediumRectangle = 1;
  ADClientErrorUnknown = 0;
  ADClientErrorLimitAdTracking = 1;
  ADInterstitialPresentationPolicyNone = 0;
  ADInterstitialPresentationPolicyAutomatic = 1;
  ADInterstitialPresentationPolicyManual = 2;

type

  // ===== Forward declarations =====
{$M+}
  ADBannerViewDelegate = interface;
  ADBannerView = interface;
  ADClient = interface;
  ADInterstitialAdDelegate = interface;
  ADInterstitialAd = interface;
  iAdPreroll = interface;
  iAdAdditions = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  ADError = NSInteger;
  ADAdType = NSInteger;
  CGFloat = Single;
  CGSize = CGSize = record width: CGFloat;
height:
CGFloat;
end;
PCGSize = ^CGSize;;
TiAdCompletionHandler =
procedure(param1: Boolean) of object;
TiAdCompletionHandler1 =
procedure(param1: NSDate; param2: NSDate) of object;
TiAdCompletionHandler2 =
procedure(param1: NSDictionary; param2: NSError) of object;
ADClientError = NSInteger;
TiAdCompletionHandler3 =
procedure(param1: NSError) of object;
ADInterstitialPresentationPolicy = NSInteger;
// ===== Interface declarations =====

ADBannerViewClass = interface(UIViewClass)
  ['{7E4A5612-D0F2-4301-86C6-EBA955C66C5F}']
{ class } function sizeFromBannerContentSizeIdentifier(contentSizeIdentifier
  : NSString): CGSize;
cdecl;
end;
ADBannerView = interface(UIView)['{D032BED8-721A-4A35-93B1-29469CE0BA95}']
function initWithAdType(&type: ADAdType): Pointer { instancetype };
cdecl;

function adType: ADAdType; cdecl;
  procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
      function isBannerLoaded: Boolean; cdecl;
        function isBannerViewActionInProgress: Boolean; cdecl;
          procedure cancelBannerViewAction; cdecl;
            procedure setAdvertisingSection(advertisingSection
              : NSString); cdecl;
              function advertisingSection: NSString; cdecl;
                procedure setRequiredContentSizeIdentifiers
                  (requiredContentSizeIdentifiers: NSSet); cdecl;
                  function requiredContentSizeIdentifiers: NSSet; cdecl;
                    procedure setCurrentContentSizeIdentifier
                      (currentContentSizeIdentifier: NSString); cdecl;
                      function currentContentSizeIdentifier: NSString; cdecl;
                      end;

                  TADBannerView = class
                    (TOCGenericImport<ADBannerViewClass, ADBannerView>)
                  end;
              PADBannerView = Pointer;

              ADClientClass = interface(NSObjectClass)
                ['{6833D597-03C5-4EDD-A276-3D16AEE34381}']
              { class } function sharedClient: ADClient;
              cdecl;
              end;
          ADClient = interface(NSObject)
            ['{6B4B4123-F292-45DF-86CE-B4F7F878D185}']
          procedure determineAppInstallationAttributionWithCompletionHandler
            (completionHandler: TiAdCompletionHandler);
          cdecl;
            procedure lookupAdConversionDetails(completionHandler
              : TiAdCompletionHandler1); cdecl;
              procedure requestAttributionDetailsWithBlock(completionHandler
                : TiAdCompletionHandler2); cdecl;
                procedure addClientToSegments(segmentIdentifiers: NSArray;
                  replaceExisting: Boolean); cdecl;
                end;

            TADClient = class(TOCGenericImport<ADClientClass, ADClient>)
            end;
        PADClient = Pointer;

        ADInterstitialAdClass = interface(NSObjectClass)
          ['{5B4BD295-29F5-4635-8CCC-90016A56A1A3}']
        end;
    ADInterstitialAd = interface(NSObject)
      ['{2BA3C76F-87BD-4138-885B-942E2F2345BA}']
    procedure setDelegate(delegate: Pointer);
    cdecl;
      function delegate: Pointer; cdecl;
        function isLoaded: Boolean; cdecl;
          function isActionInProgress: Boolean; cdecl;
            procedure cancelAction; cdecl;
              function presentInView(containerView: UIView): Boolean; cdecl;
                procedure presentFromViewController(viewController
                  : UIViewController); cdecl;
                end;

            TADInterstitialAd = class(TOCGenericImport<ADInterstitialAdClass,
              ADInterstitialAd>)
            end;
        PADInterstitialAd = Pointer;

        iAdPreroll = interface(IObjectiveC)
          ['{D6AEC5A0-7A1D-4C7A-AD0C-0BBFA5B60408}']
        procedure preparePrerollAds;
        cdecl;
          procedure playPrerollAdWithCompletionHandler(completionHandler
            : TiAdCompletionHandler3); cdecl;
            procedure cancelPreroll; cdecl;
            end;

        iAdAdditions = interface(IObjectiveC)
          ['{691EAD3B-DCA3-4ECA-BC6D-07C226683C95}']
        procedure prepareInterstitialAds;
        cdecl;
          procedure setInterstitialPresentationPolicy
            (interstitialPresentationPolicy
            : ADInterstitialPresentationPolicy); cdecl;
            function interstitialPresentationPolicy
              : ADInterstitialPresentationPolicy; cdecl;
              procedure setCanDisplayBannerAds(canDisplayBannerAds
                : Boolean); cdecl;
                function canDisplayBannerAds: Boolean; cdecl;
                  function originalContentView: UIView; cdecl;
                    function isPresentingFullScreenAd: Boolean; cdecl;
                      function isDisplayingBannerAd: Boolean; cdecl;
                        function requestInterstitialAdPresentation
                          : Boolean; cdecl;
                          function shouldPresentInterstitialAd: Boolean; cdecl;
                          end;

                      // ===== Protocol declarations =====

                      ADBannerViewDelegate = interface(IObjectiveC)
                        ['{C6B024BF-88A2-45DF-88F1-FC8CD02AB763}']
                      procedure bannerViewWillLoadAd(banner: ADBannerView);
                      cdecl;
                        procedure bannerViewDidLoadAd
                          (banner: ADBannerView); cdecl;
                          procedure bannerView(banner: ADBannerView;
                            didFailToReceiveAdWithError: NSError); cdecl;
                            function bannerViewActionShouldBegin
                              (banner: ADBannerView;
                              willLeaveApplication: Boolean): Boolean; cdecl;
                              procedure bannerViewActionDidFinish
                                (banner: ADBannerView); cdecl;
                              end;

                          ADInterstitialAdDelegate = interface(IObjectiveC)
                            ['{EA072C27-250C-4D0B-B799-9EBBF64AF731}']
                          procedure interstitialAdDidUnload(interstitialAd
                            : ADInterstitialAd);
                          cdecl;
                            procedure interstitialAd(interstitialAd
                              : ADInterstitialAd;
                              didFailWithError: NSError); cdecl;
                              procedure interstitialAdWillLoad
                                (interstitialAd: ADInterstitialAd); cdecl;
                                procedure interstitialAdDidLoad
                                  (interstitialAd: ADInterstitialAd); cdecl;
                                  function interstitialAdActionShouldBegin
                                    (interstitialAd: ADInterstitialAd;
                                    willLeaveApplication: Boolean)
                                    : Boolean; cdecl;
                                    procedure interstitialAdActionDidFinish
                                      (interstitialAd: ADInterstitialAd); cdecl;
                                    end;

                                // ===== Exported string consts =====

                                  function ADErrorDomain: NSString;
                                    function ADBannerContentSizeIdentifier320x50
                                      : NSString;
                                      function ADBannerContentSizeIdentifier480x32
                                        : NSString;
                                        function ADBannerContentSizeIdentifierPortrait
                                        : NSString;
                                        function ADBannerContentSizeIdentifierLandscape
                                        : NSString;
                                        function ADClientErrorDomain: NSString;


                                        // ===== External functions =====

                                        const
                                        libiAd = '/System/Library/Frameworks/iAd.framework/iAd';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  iAdModule: THandle;

{$ENDIF IOS}

function ADErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libiAd, 'ADErrorDomain');
end;

function ADBannerContentSizeIdentifier320x50: NSString;
begin
  Result := CocoaNSStringConst(libiAd, 'ADBannerContentSizeIdentifier320x50');
end;

function ADBannerContentSizeIdentifier480x32: NSString;
begin
  Result := CocoaNSStringConst(libiAd, 'ADBannerContentSizeIdentifier480x32');
end;

function ADBannerContentSizeIdentifierPortrait: NSString;
begin
  Result := CocoaNSStringConst(libiAd, 'ADBannerContentSizeIdentifierPortrait');
end;

function ADBannerContentSizeIdentifierLandscape: NSString;
begin
  Result := CocoaNSStringConst(libiAd,
    'ADBannerContentSizeIdentifierLandscape');
end;

function ADClientErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libiAd, 'ADClientErrorDomain');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

iAdModule := dlopen(MarshaledAString(libiAd), RTLD_LAZY);

finalization

dlclose(iAdModule);
{$ENDIF IOS}

end.
