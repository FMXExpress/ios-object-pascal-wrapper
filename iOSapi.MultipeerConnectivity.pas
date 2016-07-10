{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework MultipeerConnectivity
//

unit iOSapi.MultipeerConnectivity;

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
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  MCErrorUnknown = 0;
  MCErrorNotConnected = 1;
  MCErrorInvalidParameter = 2;
  MCErrorUnsupported = 3;
  MCErrorTimedOut = 4;
  MCErrorCancelled = 5;
  MCErrorUnavailable = 6;
  MCSessionSendDataReliable = 0;
  MCSessionSendDataUnreliable = 1;
  MCSessionStateNotConnected = 0;
  MCSessionStateConnecting = 1;
  MCSessionStateConnected = 2;
  MCEncryptionOptional = 0;
  MCEncryptionRequired = 1;
  MCEncryptionNone = 2;

type

  // ===== Forward declarations =====
{$M+}
  MCPeerID = interface;
  MCSessionDelegate = interface;
  MCSession = interface;
  MCAdvertiserAssistantDelegate = interface;
  MCAdvertiserAssistant = interface;
  MCNearbyServiceBrowserDelegate = interface;
  MCNearbyServiceBrowser = interface;
  MCBrowserViewControllerDelegate = interface;
  MCBrowserViewController = interface;
  MCNearbyServiceAdvertiserDelegate = interface;
  MCNearbyServiceAdvertiser = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  MCErrorCode = NSInteger;
  MCSessionSendDataMode = NSInteger;
  MCSessionState = NSInteger;
  MCEncryptionPreference = NSInteger;
  NSUInteger = Cardinal;
  TMultipeerConnectivityWithCompletionHandler = procedure(param1: NSError)
    of object;
  TMultipeerConnectivityCertificateHandler = procedure(param1: Boolean)
    of object;
  TMultipeerConnectivityWithCompletionHandler1 = procedure(param1: NSData;
    param2: NSError) of object;
  NSTimeInterval = Double;
  TMultipeerConnectivityInvitationHandler = procedure(param1: Boolean;
    param2: MCSession) of object;
  // ===== Interface declarations =====

  MCPeerIDClass = interface(NSObjectClass)
    ['{D5B3B874-F2B6-4EF0-B89A-71DA254B6660}']
  end;

  MCPeerID = interface(NSObject)
    ['{2A0C7FFF-346E-4ABB-9FFF-FFFD3272DEFA}']
    function initWithDisplayName(myDisplayName: NSString)
      : Pointer { instancetype }; cdecl;
    function displayName: NSString; cdecl;
  end;

  TMCPeerID = class(TOCGenericImport<MCPeerIDClass, MCPeerID>)
  end;

  PMCPeerID = Pointer;

  MCSessionClass = interface(NSObjectClass)
    ['{69EFF440-0AB8-4BFD-B19F-B6C7139089DC}']
  end;

  MCSession = interface(NSObject)
    ['{14FAB644-1F3B-40BB-910A-2DB458BE7187}']
    [MethodName('initWithPeer:')]
    function initWithPeer(myPeerID: MCPeerID): Pointer { instancetype }; cdecl;
    [MethodName('initWithPeer:securityIdentity:encryptionPreference:')]
    function initWithPeerSecurityIdentityEncryptionPreference
      (myPeerID: MCPeerID; securityIdentity: NSArray;
      encryptionPreference: MCEncryptionPreference)
      : Pointer { instancetype }; cdecl;
    function sendData(data: NSData; toPeers: NSArray;
      withMode: MCSessionSendDataMode; error: NSError): Boolean; cdecl;
    procedure disconnect; cdecl;
    function sendResourceAtURL(resourceURL: NSURL; withName: NSString;
      toPeer: MCPeerID;
      withCompletionHandler: TMultipeerConnectivityWithCompletionHandler)
      : NSProgress; cdecl;
    function startStreamWithName(streamName: NSString; toPeer: MCPeerID;
      error: NSError): NSOutputStream; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function myPeerID: MCPeerID; cdecl;
    function securityIdentity: NSArray; cdecl;
    function encryptionPreference: MCEncryptionPreference; cdecl;
    function connectedPeers: NSArray; cdecl;
    procedure nearbyConnectionDataForPeer(peerID: MCPeerID;
      withCompletionHandler
      : TMultipeerConnectivityWithCompletionHandler1); cdecl;
    procedure connectPeer(peerID: MCPeerID;
      withNearbyConnectionData: NSData); cdecl;
    procedure cancelConnectPeer(peerID: MCPeerID); cdecl;
  end;

  TMCSession = class(TOCGenericImport<MCSessionClass, MCSession>)
  end;

  PMCSession = Pointer;

  MCAdvertiserAssistantClass = interface(NSObjectClass)
    ['{1A98656F-E7F1-4ED1-BBD8-BEEA7B3A54C1}']
  end;

  MCAdvertiserAssistant = interface(NSObject)
    ['{CD471700-4185-4B52-B6FA-0EF675CA10F9}']
    function initWithServiceType(serviceType: NSString;
      discoveryInfo: NSDictionary; session: MCSession)
      : Pointer { instancetype }; cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function session: MCSession; cdecl;
    function discoveryInfo: NSDictionary; cdecl;
    function serviceType: NSString; cdecl;
  end;

  TMCAdvertiserAssistant = class(TOCGenericImport<MCAdvertiserAssistantClass,
    MCAdvertiserAssistant>)
  end;

  PMCAdvertiserAssistant = Pointer;

  MCNearbyServiceBrowserClass = interface(NSObjectClass)
    ['{F59E863E-6B40-485F-8AF6-8B00E1B90AF5}']
  end;

  MCNearbyServiceBrowser = interface(NSObject)
    ['{CE925AA7-6330-453F-BB57-6BF902D516BF}']
    function initWithPeer(myPeerID: MCPeerID; serviceType: NSString)
      : Pointer { instancetype }; cdecl;
    procedure startBrowsingForPeers; cdecl;
    procedure stopBrowsingForPeers; cdecl;
    procedure invitePeer(peerID: MCPeerID; toSession: MCSession;
      withContext: NSData; timeout: NSTimeInterval); cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function myPeerID: MCPeerID; cdecl;
    function serviceType: NSString; cdecl;
  end;

  TMCNearbyServiceBrowser = class(TOCGenericImport<MCNearbyServiceBrowserClass,
    MCNearbyServiceBrowser>)
  end;

  PMCNearbyServiceBrowser = Pointer;

  MCBrowserViewControllerClass = interface(UIViewControllerClass)
    ['{ECA637D9-0410-477D-A713-AA7389D5F9B0}']
  end;

  MCBrowserViewController = interface(UIViewController)
    ['{A9AA91C9-E72E-40BF-95EA-01F8F01D85AE}']
    function initWithServiceType(serviceType: NSString; session: MCSession)
      : Pointer { instancetype }; cdecl;
    function initWithBrowser(browser: MCNearbyServiceBrowser;
      session: MCSession): Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function browser: MCNearbyServiceBrowser; cdecl;
    function session: MCSession; cdecl;
    procedure setMinimumNumberOfPeers(minimumNumberOfPeers: NSUInteger); cdecl;
    function minimumNumberOfPeers: NSUInteger; cdecl;
    procedure setMaximumNumberOfPeers(maximumNumberOfPeers: NSUInteger); cdecl;
    function maximumNumberOfPeers: NSUInteger; cdecl;
  end;

  TMCBrowserViewController = class
    (TOCGenericImport<MCBrowserViewControllerClass, MCBrowserViewController>)
  end;

  PMCBrowserViewController = Pointer;

  MCNearbyServiceAdvertiserClass = interface(NSObjectClass)
    ['{390558AC-19C8-4097-9E91-EDD596B03D8D}']
  end;

  MCNearbyServiceAdvertiser = interface(NSObject)
    ['{33CCE1A9-6F31-492E-816D-90CC41257452}']
    function initWithPeer(myPeerID: MCPeerID; discoveryInfo: NSDictionary;
      serviceType: NSString): Pointer { instancetype }; cdecl;
    procedure startAdvertisingPeer; cdecl;
    procedure stopAdvertisingPeer; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function myPeerID: MCPeerID; cdecl;
    function discoveryInfo: NSDictionary; cdecl;
    function serviceType: NSString; cdecl;
  end;

  TMCNearbyServiceAdvertiser = class
    (TOCGenericImport<MCNearbyServiceAdvertiserClass,
    MCNearbyServiceAdvertiser>)
  end;

  PMCNearbyServiceAdvertiser = Pointer;

  // ===== Protocol declarations =====

  MCSessionDelegate = interface(IObjectiveC)
    ['{2DC28D82-FC1D-4FE9-B107-4FC05818F93A}']
    [MethodName('session:peer:didChangeState:')]
    procedure sessionPeerDidChangeState(session: MCSession; peer: MCPeerID;
      didChangeState: MCSessionState); cdecl;
    [MethodName('session:didReceiveData:fromPeer:')]
    procedure sessionDidReceiveDataFromPeer(session: MCSession;
      didReceiveData: NSData; fromPeer: MCPeerID); cdecl;
    [MethodName('session:didReceiveStream:withName:fromPeer:')]
    procedure sessionDidReceiveStreamWithNameFromPeer(session: MCSession;
      didReceiveStream: NSInputStream; withName: NSString;
      fromPeer: MCPeerID); cdecl;
    [MethodName
      ('session:didStartReceivingResourceWithName:fromPeer:withProgress:')]
    procedure sessionDidStartReceivingResourceWithNameFromPeerWithProgress
      (session: MCSession; didStartReceivingResourceWithName: NSString;
      fromPeer: MCPeerID; withProgress: NSProgress); cdecl;
    [MethodName
      ('session:didFinishReceivingResourceWithName:fromPeer:atURL:withError:')]
    procedure sessionDidFinishReceivingResourceWithNameFromPeerAtURLWithError
      (session: MCSession; didFinishReceivingResourceWithName: NSString;
      fromPeer: MCPeerID; atURL: NSURL; withError: NSError); cdecl;
    [MethodName('session:didReceiveCertificate:fromPeer:certificateHandler:')]
    procedure sessionDidReceiveCertificateFromPeerCertificateHandler
      (session: MCSession; didReceiveCertificate: NSArray; fromPeer: MCPeerID;
      certificateHandler: TMultipeerConnectivityCertificateHandler); cdecl;
  end;

  MCAdvertiserAssistantDelegate = interface(IObjectiveC)
    ['{53B3EEB6-116A-44F3-8652-4E787655F45D}']
    procedure advertiserAssistantWillPresentInvitation(advertiserAssistant
      : MCAdvertiserAssistant); cdecl;
    procedure advertiserAssistantDidDismissInvitation(advertiserAssistant
      : MCAdvertiserAssistant); cdecl;
  end;

  MCNearbyServiceBrowserDelegate = interface(IObjectiveC)
    ['{3AC45DA3-DF3E-4F5B-9FAF-69C86E602E81}']
    [MethodName('browser:foundPeer:withDiscoveryInfo:')]
    procedure browserFoundPeerWithDiscoveryInfo(browser: MCNearbyServiceBrowser;
      foundPeer: MCPeerID; withDiscoveryInfo: NSDictionary); cdecl;
    [MethodName('browser:lostPeer:')]
    procedure browserLostPeer(browser: MCNearbyServiceBrowser;
      lostPeer: MCPeerID); cdecl;
    [MethodName('browser:didNotStartBrowsingForPeers:')]
    procedure browserDidNotStartBrowsingForPeers
      (browser: MCNearbyServiceBrowser;
      didNotStartBrowsingForPeers: NSError); cdecl;
  end;

  MCBrowserViewControllerDelegate = interface(IObjectiveC)
    ['{A9BCDD2E-DD64-4488-A697-10E63AD51C8C}']
    procedure browserViewControllerDidFinish(browserViewController
      : MCBrowserViewController); cdecl;
    procedure browserViewControllerWasCancelled(browserViewController
      : MCBrowserViewController); cdecl;
    function browserViewController(browserViewController
      : MCBrowserViewController; shouldPresentNearbyPeer: MCPeerID;
      withDiscoveryInfo: NSDictionary): Boolean; cdecl;
  end;

  MCNearbyServiceAdvertiserDelegate = interface(IObjectiveC)
    ['{C87CFCF5-FE02-4006-B83A-9E7941ED7E98}']
    [MethodName
      ('advertiser:didReceiveInvitationFromPeer:withContext:invitationHandler:')
      ]
    procedure advertiserDidReceiveInvitationFromPeerWithContextInvitationHandler
      (advertiser: MCNearbyServiceAdvertiser;
      didReceiveInvitationFromPeer: MCPeerID; withContext: NSData;
      invitationHandler: TMultipeerConnectivityInvitationHandler); cdecl;
    [MethodName('advertiser:didNotStartAdvertisingPeer:')]
    procedure advertiserDidNotStartAdvertisingPeer
      (advertiser: MCNearbyServiceAdvertiser;
      didNotStartAdvertisingPeer: NSError); cdecl;
  end;

  // ===== Exported string consts =====

function MCErrorDomain: NSString;
function kMCSessionMinimumNumberOfPeers: Pointer;
function kMCSessionMaximumNumberOfPeers: Pointer;


// ===== External functions =====

const
  libMultipeerConnectivity =
    '/System/Library/Frameworks/MultipeerConnectivity.framework/MultipeerConnectivity';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  MultipeerConnectivityModule: THandle;

{$ENDIF IOS}

function MCErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libMultipeerConnectivity, 'MCErrorDomain');
end;

function kMCSessionMinimumNumberOfPeers: Pointer;
begin
  Result := CocoaPointerConst(libMultipeerConnectivity,
    'kMCSessionMinimumNumberOfPeers');
end;

function kMCSessionMaximumNumberOfPeers: Pointer;
begin
  Result := CocoaPointerConst(libMultipeerConnectivity,
    'kMCSessionMaximumNumberOfPeers');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MultipeerConnectivityModule :=
  dlopen(MarshaledAString(libMultipeerConnectivity), RTLD_LAZY);

finalization

dlclose(MultipeerConnectivityModule);
{$ENDIF IOS}

end.
