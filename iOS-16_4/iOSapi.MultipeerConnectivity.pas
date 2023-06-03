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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
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
  PNSInteger = ^NSInteger;

  MCErrorCode = NSInteger;
  MCSessionSendDataMode = NSInteger;
  MCSessionState = NSInteger;
  MCEncryptionPreference = NSInteger;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  TMultipeerConnectivityWithCompletionHandler = procedure(param1: NSError)
    of object;
  TMultipeerConnectivityCertificateHandler = procedure(param1: Boolean)
    of object;
  TMultipeerConnectivityWithCompletionHandler1 = procedure(param1: NSData;
    param2: NSError) of object;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  TMultipeerConnectivityInvitationHandler = procedure(param1: Boolean;
    param2: MCSession) of object;
  // ===== Interface declarations =====

  MCPeerIDClass = interface(NSObjectClass)
    ['{398720A1-FDC7-43C0-AB83-DA7E77EB77F4}']
  end;

  MCPeerID = interface(NSObject)
    ['{42094552-03F7-48CF-BB83-79348C53A4AD}']
    function initWithDisplayName(myDisplayName: NSString)
      : Pointer { instancetype }; cdecl;
    function displayName: NSString; cdecl;
  end;

  TMCPeerID = class(TOCGenericImport<MCPeerIDClass, MCPeerID>)
  end;

  PMCPeerID = Pointer;

  MCSessionClass = interface(NSObjectClass)
    ['{DA4863B3-F9B9-47B8-8E5B-FE5F38C598F4}']
  end;

  MCSession = interface(NSObject)
    ['{57412D02-F9FB-411B-B2F7-DF02C886A5F7}']
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
    ['{8D7E6B69-5F7D-4F9B-8F08-8275016EF261}']
  end;

  MCAdvertiserAssistant = interface(NSObject)
    ['{064248FC-F224-4DC5-9189-C1B47BEDC420}']
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
    ['{6E08D6B9-608D-471F-835C-E055FF8EE66F}']
  end;

  MCNearbyServiceBrowser = interface(NSObject)
    ['{7D39CF3D-7D5F-43FB-AEAC-982027CB2F7A}']
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
    ['{19C21E65-69A5-4938-A8D6-69B0FFF407AF}']
  end;

  MCBrowserViewController = interface(UIViewController)
    ['{6909CA4E-0AB0-4237-AB5A-ED5F2CBA3B50}']
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
    ['{C69909A6-EC4F-4666-B39F-76DE06A7C975}']
  end;

  MCNearbyServiceAdvertiser = interface(NSObject)
    ['{9F07EACA-A013-4E8E-9FBA-DE150DB8328B}']
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
    ['{2B7CDC75-4D1E-4588-8775-192D1DD9309F}']
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
    ['{6AB05C58-9024-41E8-9014-CCA52AC18515}']
    procedure advertiserAssistantWillPresentInvitation(advertiserAssistant
      : MCAdvertiserAssistant); cdecl;
    procedure advertiserAssistantDidDismissInvitation(advertiserAssistant
      : MCAdvertiserAssistant); cdecl;
  end;

  MCNearbyServiceBrowserDelegate = interface(IObjectiveC)
    ['{785D1319-86BF-4EFB-A13C-743295B4D3CB}']
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
    ['{2D2F2973-8ED3-44B7-8C10-F7B963CBCBD2}']
    procedure browserViewControllerDidFinish(browserViewController
      : MCBrowserViewController); cdecl;
    procedure browserViewControllerWasCancelled(browserViewController
      : MCBrowserViewController); cdecl;
    function browserViewController(browserViewController
      : MCBrowserViewController; shouldPresentNearbyPeer: MCPeerID;
      withDiscoveryInfo: NSDictionary): Boolean; cdecl;
  end;

  MCNearbyServiceAdvertiserDelegate = interface(IObjectiveC)
    ['{C340D54E-7CFA-4A8D-9000-7C967881AB53}']
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
