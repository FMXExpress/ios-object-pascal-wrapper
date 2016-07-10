{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework NetworkExtension
//

unit iOSapi.NetworkExtension;

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
  iOSapi.Security;

const
  NEProviderStopReasonNone = 0;
  NEProviderStopReasonUserInitiated = 1;
  NEProviderStopReasonProviderFailed = 2;
  NEProviderStopReasonNoNetworkAvailable = 3;
  NEProviderStopReasonUnrecoverableNetworkChange = 4;
  NEProviderStopReasonProviderDisabled = 5;
  NEProviderStopReasonAuthenticationCanceled = 6;
  NEProviderStopReasonConfigurationFailed = 7;
  NEProviderStopReasonIdleTimeout = 8;
  NEProviderStopReasonConfigurationDisabled = 9;
  NEProviderStopReasonConfigurationRemoved = 10;
  NEProviderStopReasonSuperceded = 11;
  NEProviderStopReasonUserLogout = 12;
  NEProviderStopReasonUserSwitch = 13;
  NEProviderStopReasonConnectionFailed = 14;
  NETunnelProviderErrorNetworkSettingsInvalid = 1;
  NETunnelProviderErrorNetworkSettingsCanceled = 2;
  NETunnelProviderErrorNetworkSettingsFailed = 3;
  NETunnelProviderRoutingMethodDestinationIP = 1;
  NETunnelProviderRoutingMethodSourceApplication = 2;
  NEVPNErrorConfigurationInvalid = 1;
  NEVPNErrorConfigurationDisabled = 2;
  NEVPNErrorConnectionFailed = 3;
  NEVPNErrorConfigurationStale = 4;
  NEVPNErrorConfigurationReadWriteFailed = 5;
  NEVPNErrorConfigurationUnknown = 6;
  NEFilterManagerErrorConfigurationInvalid = 1;
  NEFilterManagerErrorConfigurationDisabled = 2;
  NEFilterManagerErrorConfigurationStale = 3;
  NEFilterManagerErrorConfigurationCannotBeRemoved = 4;
  kNEHotspotHelperCommandTypeNone = 0;
  kNEHotspotHelperCommandTypeFilterScanList = 1;
  kNEHotspotHelperCommandTypeEvaluate = 2;
  kNEHotspotHelperCommandTypeAuthenticate = 3;
  kNEHotspotHelperCommandTypePresentUI = 4;
  kNEHotspotHelperCommandTypeMaintain = 5;
  kNEHotspotHelperCommandTypeLogoff = 6;
  kNEHotspotHelperResultSuccess = 0;
  kNEHotspotHelperResultFailure = 1;
  kNEHotspotHelperResultUIRequired = 2;
  kNEHotspotHelperResultCommandNotRecognized = 3;
  kNEHotspotHelperResultAuthenticationRequired = 4;
  kNEHotspotHelperResultUnsupportedNetwork = 5;
  kNEHotspotHelperResultTemporaryFailure = 6;
  kNEHotspotHelperConfidenceNone = 0;
  kNEHotspotHelperConfidenceLow = 1;
  kNEHotspotHelperConfidenceHigh = 2;
  NEOnDemandRuleActionConnect = 1;
  NEOnDemandRuleActionDisconnect = 2;
  NEOnDemandRuleActionEvaluateConnection = 3;
  NEOnDemandRuleActionIgnore = 4;
  NEOnDemandRuleInterfaceTypeAny = 0;
  NEOnDemandRuleInterfaceTypeEthernet = 1;
  NEOnDemandRuleInterfaceTypeWiFi = 2;
  NEOnDemandRuleInterfaceTypeCellular = 3;
  NEEvaluateConnectionRuleActionConnectIfNeeded = 1;
  NEEvaluateConnectionRuleActionNeverConnect = 2;
  NEVPNStatusInvalid = 0;
  NEVPNStatusDisconnected = 1;
  NEVPNStatusConnecting = 2;
  NEVPNStatusConnected = 3;
  NEVPNStatusReasserting = 4;
  NEVPNStatusDisconnecting = 5;
  NEVPNIKEAuthenticationMethodNone = 0;
  NEVPNIKEAuthenticationMethodCertificate = 1;
  NEVPNIKEAuthenticationMethodSharedSecret = 2;
  NEVPNIKEv2EncryptionAlgorithmDES = 1;
  NEVPNIKEv2EncryptionAlgorithm3DES = 2;
  NEVPNIKEv2EncryptionAlgorithmAES128 = 3;
  NEVPNIKEv2EncryptionAlgorithmAES256 = 4;
  NEVPNIKEv2EncryptionAlgorithmAES128GCM = 5;
  NEVPNIKEv2EncryptionAlgorithmAES256GCM = 6;
  NEVPNIKEv2IntegrityAlgorithmSHA96 = 1;
  NEVPNIKEv2IntegrityAlgorithmSHA160 = 2;
  NEVPNIKEv2IntegrityAlgorithmSHA256 = 3;
  NEVPNIKEv2IntegrityAlgorithmSHA384 = 4;
  NEVPNIKEv2IntegrityAlgorithmSHA512 = 5;
  NEVPNIKEv2DeadPeerDetectionRateNone = 0;
  NEVPNIKEv2DeadPeerDetectionRateLow = 1;
  NEVPNIKEv2DeadPeerDetectionRateMedium = 2;
  NEVPNIKEv2DeadPeerDetectionRateHigh = 3;
  NEVPNIKEv2DiffieHellmanGroup0 = 0;
  NEVPNIKEv2DiffieHellmanGroup1 = 1;
  NEVPNIKEv2DiffieHellmanGroup2 = 2;
  NEVPNIKEv2DiffieHellmanGroup5 = 5;
  NEVPNIKEv2DiffieHellmanGroup14 = 14;
  NEVPNIKEv2DiffieHellmanGroup15 = 15;
  NEVPNIKEv2DiffieHellmanGroup16 = 16;
  NEVPNIKEv2DiffieHellmanGroup17 = 17;
  NEVPNIKEv2DiffieHellmanGroup18 = 18;
  NEVPNIKEv2DiffieHellmanGroup19 = 19;
  NEVPNIKEv2DiffieHellmanGroup20 = 20;
  NEVPNIKEv2DiffieHellmanGroup21 = 21;
  NEVPNIKEv2CertificateTypeRSA = 1;
  NEVPNIKEv2CertificateTypeECDSA256 = 2;
  NEVPNIKEv2CertificateTypeECDSA384 = 3;
  NEVPNIKEv2CertificateTypeECDSA521 = 4;
  NWPathStatusInvalid = 0;
  NWPathStatusSatisfied = 1;
  NWPathStatusUnsatisfied = 2;
  NWPathStatusSatisfiable = 3;
  NWTCPConnectionStateInvalid = 0;
  NWTCPConnectionStateConnecting = 1;
  NWTCPConnectionStateWaiting = 2;
  NWTCPConnectionStateConnected = 3;
  NWTCPConnectionStateDisconnected = 4;
  NWTCPConnectionStateCancelled = 5;
  NWUDPSessionStateInvalid = 0;
  NWUDPSessionStateWaiting = 1;
  NWUDPSessionStatePreparing = 2;
  NWUDPSessionStateReady = 3;
  NWUDPSessionStateFailed = 4;
  NWUDPSessionStateCancelled = 5;

type

  // ===== Forward declarations =====
{$M+}
  NWTCPConnection = interface;
  NWTLSParameters = interface;
  NWUDPSession = interface;
  NWEndpoint = interface;
  NWHostEndpoint = interface;
  NWPath = interface;
  NEVPNProtocol = interface;
  NETunnelNetworkSettings = interface;
  NETunnelProvider = interface;
  NEAppProxyProvider = interface;
  NEVPNConnection = interface;
  NEOnDemandRule = interface;
  NETunnelProviderManager = interface;
  NEAppProxyProviderManager = interface;
  NEFilterProvider = interface;
  NEFilterNewFlowVerdict = interface;
  NEFilterControlVerdict = interface;
  NEFilterControlProvider = interface;
  NEFilterDataVerdict = interface;
  NEFilterRemediationVerdict = interface;
  NEFilterBrowserFlow = interface;
  NEFilterSocketFlow = interface;
  NEFilterDataProvider = interface;
  NEHotspotNetwork = interface;
  NEHotspotHelperResponse = interface;
  NEHotspotHelperCommand = interface;
  NEHotspotHelper = interface;
  NEIPv4Route = interface;
  NEIPv4Settings = interface;
  NEIPv6Route = interface;
  NEIPv6Settings = interface;
  NEEvaluateConnectionRule = interface;
  NEOnDemandRuleConnect = interface;
  NEOnDemandRuleDisconnect = interface;
  NEOnDemandRuleIgnore = interface;
  NEOnDemandRuleEvaluateConnection = interface;
  NEPacketTunnelFlow = interface;
  NEProxySettings = interface;
  NEPacketTunnelNetworkSettings = interface;
  NEPacketTunnelProvider = interface;
  NEProxyServer = interface;
  NETunnelProviderProtocol = interface;
  NETunnelProviderSession = interface;
  NEVPNProtocolIPSec = interface;
  NEVPNIKEv2SecurityAssociationParameters = interface;
  NEVPNProtocolIKEv2 = interface;
  NWBonjourServiceEndpoint = interface;
  NWTCPConnectionAuthenticationDelegate = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  NEProviderStopReason = NSInteger;
  NETunnelProviderError = NSInteger;
  NETunnelProviderRoutingMethod = NSInteger;
  TNetworkExtensionCompletionHandler = procedure(param1: PInteger) of object;
  TNetworkExtensionCompletionHandler1 = procedure() of object;
  NEVPNError = NSInteger;
  TNetworkExtensionCompletionHandler2 = procedure(param1: Integer) of object;
  NSUInteger = Cardinal;
  TNetworkExtensionCompletionHandler3 = procedure
    (param1: NEFilterControlVerdict) of object;
  NEFilterManagerError = NSInteger;
  NEHotspotHelperCommandType = NSInteger;
  NEHotspotHelperResult = NSInteger;
  NEHotspotHelperConfidence = NSInteger;
  NEHotspotHelperHandler = procedure(param1: NEHotspotHelperCommand) of object;
  dispatch_queue_t = Pointer;
  NEOnDemandRuleAction = NSInteger;
  NEOnDemandRuleInterfaceType = NSInteger;
  NEEvaluateConnectionRuleAction = NSInteger;
  TNetworkExtensionCompletionHandler4 = procedure(param1: NSArray;
    param2: NSArray) of object;
  TNetworkExtensionCompletionHandler5 = procedure(param1: NSError) of object;
  NEVPNStatus = NSInteger;
  TNetworkExtensionResponseHandler = procedure(param1: NSData) of object;
  NEVPNIKEAuthenticationMethod = NSInteger;
  NEVPNIKEv2EncryptionAlgorithm = NSInteger;
  NEVPNIKEv2IntegrityAlgorithm = NSInteger;
  NEVPNIKEv2DeadPeerDetectionRate = NSInteger;
  NEVPNIKEv2DiffieHellmanGroup = NSInteger;
  NEVPNIKEv2CertificateType = NSInteger;
  NWPathStatus = NSInteger;
  NWTCPConnectionState = NSInteger;
  TNetworkExtensionCompletionHandler6 = procedure(param1: NSData;
    param2: NSError) of object;
  SecIdentityRef = Pointer;
  TNetworkExtensionCompletionHandler7 = procedure(param1: SecIdentityRef;
    param2: NSArray) of object;
  SecTrustRef = Pointer;
  TNetworkExtensionCompletionHandler8 = procedure(param1: SecTrustRef)
    of object;
  NWUDPSessionState = NSInteger;
  TNetworkExtensionHandler = procedure(param1: NSArray; param2: NSError)
    of object;
  // ===== Interface declarations =====

  NWTCPConnectionClass = interface(NSObjectClass)
    ['{BF208B3E-3151-4C26-AAE8-AA05D07FB66B}']
  end;

  NWTCPConnection = interface(NSObject)
    ['{B91B8683-87F5-418F-9083-C22443D86EEB}']
    function initWithUpgradeForConnection(connection: NWTCPConnection)
      : Pointer { instancetype }; cdecl;
    function state: NWTCPConnectionState; cdecl;
    function isViable: Boolean; cdecl;
    function hasBetterPath: Boolean; cdecl;
    function endpoint: NWEndpoint; cdecl;
    function connectedPath: NWPath; cdecl;
    function localAddress: NWEndpoint; cdecl;
    function remoteAddress: NWEndpoint; cdecl;
    function txtRecord: NSData; cdecl;
    function error: NSError; cdecl;
    procedure cancel; cdecl;
    procedure readLength(length: NSUInteger;
      completionHandler: TNetworkExtensionCompletionHandler6); cdecl;
    procedure readMinimumLength(minimum: NSUInteger; maximumLength: NSUInteger;
      completionHandler: TNetworkExtensionCompletionHandler6); cdecl;
    procedure write(data: NSData;
      completionHandler: TNetworkExtensionCompletionHandler5); cdecl;
    procedure writeClose; cdecl;
  end;

  TNWTCPConnection = class(TOCGenericImport<NWTCPConnectionClass,
    NWTCPConnection>)
  end;

  PNWTCPConnection = Pointer;

  NWTLSParametersClass = interface(NSObjectClass)
    ['{324DE046-3B12-4AD5-BB93-60228A244BB6}']
  end;

  NWTLSParameters = interface(NSObject)
    ['{C5E80D7F-1A10-40B2-97F9-88685F78163E}']
    procedure setTLSSessionID(TLSSessionID: NSData); cdecl;
    function TLSSessionID: NSData; cdecl;
    procedure setSSLCipherSuites(SSLCipherSuites: NSSet); cdecl;
    function SSLCipherSuites: NSSet; cdecl;
    procedure setMinimumSSLProtocolVersion(minimumSSLProtocolVersion
      : NSUInteger); cdecl;
    function minimumSSLProtocolVersion: NSUInteger; cdecl;
    procedure setMaximumSSLProtocolVersion(maximumSSLProtocolVersion
      : NSUInteger); cdecl;
    function maximumSSLProtocolVersion: NSUInteger; cdecl;
  end;

  TNWTLSParameters = class(TOCGenericImport<NWTLSParametersClass,
    NWTLSParameters>)
  end;

  PNWTLSParameters = Pointer;

  NWUDPSessionClass = interface(NSObjectClass)
    ['{8C50C4A6-7B35-4FCB-BA74-17E523BBA5A2}']
  end;

  NWUDPSession = interface(NSObject)
    ['{52392C9E-E226-4EDB-B788-18EB69DB61FB}']
    function initWithUpgradeForSession(session: NWUDPSession)
      : Pointer { instancetype }; cdecl;
    function state: NWUDPSessionState; cdecl;
    function endpoint: NWEndpoint; cdecl;
    function resolvedEndpoint: NWEndpoint; cdecl;
    function isViable: Boolean; cdecl;
    function hasBetterPath: Boolean; cdecl;
    function currentPath: NWPath; cdecl;
    procedure tryNextResolvedEndpoint; cdecl;
    function maximumDatagramLength: NSUInteger; cdecl;
    procedure setReadHandler(handler: TNetworkExtensionHandler;
      maxDatagrams: NSUInteger); cdecl;
    procedure writeMultipleDatagrams(datagramArray: NSArray;
      completionHandler: TNetworkExtensionCompletionHandler5); cdecl;
    procedure writeDatagram(datagram: NSData;
      completionHandler: TNetworkExtensionCompletionHandler5); cdecl;
    procedure cancel; cdecl;
  end;

  TNWUDPSession = class(TOCGenericImport<NWUDPSessionClass, NWUDPSession>)
  end;

  PNWUDPSession = Pointer;

  NWEndpointClass = interface(NSObjectClass)
    ['{EADD2141-7416-4FBA-94EB-67EA2F57F6F6}']
  end;

  NWEndpoint = interface(NSObject)
    ['{8BF31D3F-ACB9-4E1F-90CC-28FBEFC0F3CE}']
  end;

  TNWEndpoint = class(TOCGenericImport<NWEndpointClass, NWEndpoint>)
  end;

  PNWEndpoint = Pointer;

  NWHostEndpointClass = interface(NWEndpointClass)
    ['{FD8410FA-EF32-4ED8-AB2E-D390CB02ADC6}']
    { class } function endpointWithHostname(hostname: NSString; port: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  NWHostEndpoint = interface(NWEndpoint)
    ['{A13FADA5-9CA2-4222-9B4C-EEA4D9F2DC98}']
    function hostname: NSString; cdecl;
    function port: NSString; cdecl;
  end;

  TNWHostEndpoint = class(TOCGenericImport<NWHostEndpointClass, NWHostEndpoint>)
  end;

  PNWHostEndpoint = Pointer;

  NWPathClass = interface(NSObjectClass)
    ['{77791570-6D95-4471-9253-B769179454BF}']
  end;

  NWPath = interface(NSObject)
    ['{9C20A4BB-5FAC-44B7-8E4C-A0162833B86A}']
    function status: NWPathStatus; cdecl;
    function isExpensive: Boolean; cdecl;
    function isEqualToPath(path: NWPath): Boolean; cdecl;
  end;

  TNWPath = class(TOCGenericImport<NWPathClass, NWPath>)
  end;

  PNWPath = Pointer;

  NEVPNProtocolClass = interface(NSObjectClass)
    ['{BC1F4CF0-F927-413C-945F-8628CABF8A33}']
  end;

  NEVPNProtocol = interface(NSObject)
    ['{832AEBA0-4F53-4C20-A458-B1212B7351F9}']
    procedure setServerAddress(serverAddress: NSString); cdecl;
    function serverAddress: NSString; cdecl;
    procedure setUsername(username: NSString); cdecl;
    function username: NSString; cdecl;
    procedure setPasswordReference(passwordReference: NSData); cdecl;
    function passwordReference: NSData; cdecl;
    procedure setIdentityReference(identityReference: NSData); cdecl;
    function identityReference: NSData; cdecl;
    procedure setIdentityData(identityData: NSData); cdecl;
    function identityData: NSData; cdecl;
    procedure setIdentityDataPassword(identityDataPassword: NSString); cdecl;
    function identityDataPassword: NSString; cdecl;
    procedure setDisconnectOnSleep(disconnectOnSleep: Boolean); cdecl;
    function disconnectOnSleep: Boolean; cdecl;
    procedure setProxySettings(proxySettings: NEProxySettings); cdecl;
    function proxySettings: NEProxySettings; cdecl;
  end;

  TNEVPNProtocol = class(TOCGenericImport<NEVPNProtocolClass, NEVPNProtocol>)
  end;

  PNEVPNProtocol = Pointer;

  NETunnelNetworkSettingsClass = interface(NSObjectClass)
    ['{202A17B9-29F2-4090-BFD2-31E45A869E37}']
  end;

  NETunnelNetworkSettings = interface(NSObject)
    ['{3881BE8C-44AC-477A-9359-3593AB3523E3}']
    function initWithTunnelRemoteAddress(address: NSString)
      : Pointer { instancetype }; cdecl;
    function tunnelRemoteAddress: NSString; cdecl;
    procedure setDNSSettings(DNSSettings: NEDNSSettings); cdecl;
    function DNSSettings: NEDNSSettings; cdecl;
    procedure setProxySettings(proxySettings: NEProxySettings); cdecl;
    function proxySettings: NEProxySettings; cdecl;
  end;

  TNETunnelNetworkSettings = class
    (TOCGenericImport<NETunnelNetworkSettingsClass, NETunnelNetworkSettings>)
  end;

  PNETunnelNetworkSettings = Pointer;

  NETunnelProviderClass = interface(NEProviderClass)
    ['{FDB2CE3E-7EA1-4E07-9EC6-8A99B5C59F2B}']
  end;

  NETunnelProvider = interface(NEProvider)
    ['{9BD639FF-2497-4A3B-A1E2-0D325E3F9FD4}']
    procedure handleAppMessage(messageData: Pointer;
      completionHandler: TNetworkExtensionCompletionHandler); cdecl;
    procedure setTunnelNetworkSettings(tunnelNetworkSettings
      : NETunnelNetworkSettings;
      completionHandler: TNetworkExtensionCompletionHandler); cdecl;
    function protocolConfiguration: NEVPNProtocol; cdecl;
    function routingMethod: NETunnelProviderRoutingMethod; cdecl;
    procedure setReasserting(reasserting: Boolean); cdecl;
    function reasserting: Boolean; cdecl;
  end;

  TNETunnelProvider = class(TOCGenericImport<NETunnelProviderClass,
    NETunnelProvider>)
  end;

  PNETunnelProvider = Pointer;

  NEAppProxyProviderClass = interface(NETunnelProviderClass)
    ['{4F70BE8F-1DCF-4F4F-81DE-C4963BD66396}']
  end;

  NEAppProxyProvider = interface(NETunnelProvider)
    ['{7AAD5BA9-223A-4810-AE31-1568676406E8}']
    procedure startProxyWithOptions(options: Pointer;
      completionHandler: TNetworkExtensionCompletionHandler); cdecl;
    procedure stopProxyWithReason(reason: NEProviderStopReason;
      completionHandler: TNetworkExtensionCompletionHandler1); cdecl;
    procedure cancelProxyWithError(error: Pointer); cdecl;
    function handleNewFlow(flow: NEAppProxyFlow): Boolean; cdecl;
  end;

  TNEAppProxyProvider = class(TOCGenericImport<NEAppProxyProviderClass,
    NEAppProxyProvider>)
  end;

  PNEAppProxyProvider = Pointer;

  NEVPNConnectionClass = interface(NSObjectClass)
    ['{EA68597A-52C8-46A6-90F4-33ECB2CAAE53}']
  end;

  NEVPNConnection = interface(NSObject)
    ['{CBB41A3D-C056-4A1C-BB37-BA0F8F541E16}']
    function startVPNTunnelAndReturnError(error: NSError): Boolean; cdecl;
    function startVPNTunnelWithOptions(options: NSDictionary;
      andReturnError: NSError): Boolean; cdecl;
    procedure stopVPNTunnel; cdecl;
    function status: NEVPNStatus; cdecl;
    function connectedDate: NSDate; cdecl;
  end;

  TNEVPNConnection = class(TOCGenericImport<NEVPNConnectionClass,
    NEVPNConnection>)
  end;

  PNEVPNConnection = Pointer;

  NEOnDemandRuleClass = interface(NSObjectClass)
    ['{63FBE0AD-B299-498D-9079-B04BADDB4EBB}']
  end;

  NEOnDemandRule = interface(NSObject)
    ['{AB699596-F607-45A2-9040-849CCC0FF0E4}']
    function action: NEOnDemandRuleAction; cdecl;
    procedure setDNSSearchDomainMatch(DNSSearchDomainMatch: NSArray); cdecl;
    function DNSSearchDomainMatch: NSArray; cdecl;
    procedure setDNSServerAddressMatch(DNSServerAddressMatch: NSArray); cdecl;
    function DNSServerAddressMatch: NSArray; cdecl;
    procedure setInterfaceTypeMatch(interfaceTypeMatch
      : NEOnDemandRuleInterfaceType); cdecl;
    function interfaceTypeMatch: NEOnDemandRuleInterfaceType; cdecl;
    procedure setSSIDMatch(SSIDMatch: NSArray); cdecl;
    function SSIDMatch: NSArray; cdecl;
    procedure setProbeURL(probeURL: NSURL); cdecl;
    function probeURL: NSURL; cdecl;
  end;

  TNEOnDemandRule = class(TOCGenericImport<NEOnDemandRuleClass, NEOnDemandRule>)
  end;

  PNEOnDemandRule = Pointer;

  NETunnelProviderManagerClass = interface(NEVPNManagerClass)
    ['{956D33BF-2AF6-4657-8A04-04AA0BC1C51C}']
    { class } procedure loadAllFromPreferencesWithCompletionHandler
      (completionHandler: TNetworkExtensionCompletionHandler2); cdecl;
  end;

  NETunnelProviderManager = interface(NEVPNManager)
    ['{754F3B77-BB6C-4F40-872D-13B96733CDC7}']
    function copyAppRules: Pointer; cdecl;
    function routingMethod: NETunnelProviderRoutingMethod; cdecl;
  end;

  TNETunnelProviderManager = class
    (TOCGenericImport<NETunnelProviderManagerClass, NETunnelProviderManager>)
  end;

  PNETunnelProviderManager = Pointer;

  NEAppProxyProviderManagerClass = interface(NETunnelProviderManagerClass)
    ['{387BAB65-7ADA-48FA-B51E-CBF09163A75B}']
    { class } procedure loadAllFromPreferencesWithCompletionHandler
      (completionHandler: TNetworkExtensionCompletionHandler2); cdecl;
  end;

  NEAppProxyProviderManager = interface(NETunnelProviderManager)
    ['{6B7CFF3E-B3A3-4FAE-B68F-F7BF425B58FC}']
  end;

  TNEAppProxyProviderManager = class
    (TOCGenericImport<NEAppProxyProviderManagerClass,
    NEAppProxyProviderManager>)
  end;

  PNEAppProxyProviderManager = Pointer;

  NEFilterProviderClass = interface(NEProviderClass)
    ['{ECF94409-A4EA-4A19-8371-EAECCA094D5F}']
  end;

  NEFilterProvider = interface(NEProvider)
    ['{089DC5FC-8CE4-40B9-BB7B-56143CEEA047}']
    procedure startFilterWithCompletionHandler(completionHandler
      : TNetworkExtensionCompletionHandler); cdecl;
    procedure stopFilterWithReason(reason: NEProviderStopReason;
      completionHandler: TNetworkExtensionCompletionHandler1); cdecl;
    function filterConfiguration: NEFilterProviderConfiguration; cdecl;
  end;

  TNEFilterProvider = class(TOCGenericImport<NEFilterProviderClass,
    NEFilterProvider>)
  end;

  PNEFilterProvider = Pointer;

  NEFilterNewFlowVerdictClass = interface(NEFilterVerdictClass)
    ['{2C2B6A20-185E-4D1C-B16B-511C0BD77864}']
    { class } function needRulesVerdict: NEFilterNewFlowVerdict; cdecl;
    { class } function allowVerdict: NEFilterNewFlowVerdict; cdecl;
    { class } function dropVerdict: NEFilterNewFlowVerdict; cdecl;
    { class } function remediateVerdictWithRemediationURLMapKey
      (remediationURLMapKey: NSString; remediationButtonTextMapKey: NSString)
      : NEFilterNewFlowVerdict; cdecl;
    { class } function URLAppendStringVerdictWithMapKey(urlAppendMapKey
      : NSString): NEFilterNewFlowVerdict; cdecl;
    { class } function filterDataVerdictWithFilterInbound
      (filterInbound: Boolean; peekInboundBytes: NSUInteger;
      filterOutbound: Boolean; peekOutboundBytes: NSUInteger)
      : NEFilterNewFlowVerdict; cdecl;
  end;

  NEFilterNewFlowVerdict = interface(NEFilterVerdict)
    ['{88C69BB0-D7D0-4976-BCE0-B2EBB0DA9479}']
  end;

  TNEFilterNewFlowVerdict = class(TOCGenericImport<NEFilterNewFlowVerdictClass,
    NEFilterNewFlowVerdict>)
  end;

  PNEFilterNewFlowVerdict = Pointer;

  NEFilterControlVerdictClass = interface(NEFilterNewFlowVerdictClass)
    ['{402CA610-2ECD-41FF-B321-04C6A2D581B2}']
    { class } function allowVerdictWithUpdateRules(updateRules: Boolean)
      : NEFilterControlVerdict; cdecl;
    { class } function dropVerdictWithUpdateRules(updateRules: Boolean)
      : NEFilterControlVerdict; cdecl;
    { class } function updateRules: NEFilterControlVerdict; cdecl;
  end;

  NEFilterControlVerdict = interface(NEFilterNewFlowVerdict)
    ['{A522B14A-5441-4618-87B8-25E8CBA281AB}']
  end;

  TNEFilterControlVerdict = class(TOCGenericImport<NEFilterControlVerdictClass,
    NEFilterControlVerdict>)
  end;

  PNEFilterControlVerdict = Pointer;

  NEFilterControlProviderClass = interface(NEFilterProviderClass)
    ['{2208ACB0-F2A5-4751-BA1B-75E6829DA7BC}']
  end;

  NEFilterControlProvider = interface(NEFilterProvider)
    ['{0607B2E2-AB11-4E75-B3FB-56739BE4C8B5}']
    procedure handleRemediationForFlow(flow: NEFilterFlow;
      completionHandler: TNetworkExtensionCompletionHandler3); cdecl;
    procedure handleNewFlow(flow: NEFilterFlow;
      completionHandler: TNetworkExtensionCompletionHandler3); cdecl;
    procedure notifyRulesChanged; cdecl;
  end;

  TNEFilterControlProvider = class
    (TOCGenericImport<NEFilterControlProviderClass, NEFilterControlProvider>)
  end;

  PNEFilterControlProvider = Pointer;

  NEFilterDataVerdictClass = interface(NEFilterVerdictClass)
    ['{89588800-3287-4E30-90FF-16253F319165}']
    { class } function allowVerdict: NEFilterDataVerdict; cdecl;
    { class } function dropVerdict: NEFilterDataVerdict; cdecl;
    { class } function remediateVerdictWithRemediationURLMapKey
      (remediationURLMapKey: NSString; remediationButtonTextMapKey: NSString)
      : NEFilterDataVerdict; cdecl;
    { class } function dataVerdictWithPassBytes(passBytes: NSUInteger;
      peekBytes: NSUInteger): NEFilterDataVerdict; cdecl;
    { class } function needRulesVerdict: NEFilterDataVerdict; cdecl;
  end;

  NEFilterDataVerdict = interface(NEFilterVerdict)
    ['{6C814FAD-E253-40AF-B179-8E8CF7303416}']
  end;

  TNEFilterDataVerdict = class(TOCGenericImport<NEFilterDataVerdictClass,
    NEFilterDataVerdict>)
  end;

  PNEFilterDataVerdict = Pointer;

  NEFilterRemediationVerdictClass = interface(NEFilterVerdictClass)
    ['{C351A5F9-2A43-47EA-9FCD-B9A430DEF52C}']
    { class } function allowVerdict: NEFilterRemediationVerdict; cdecl;
    { class } function dropVerdict: NEFilterRemediationVerdict; cdecl;
    { class } function needRulesVerdict: NEFilterRemediationVerdict; cdecl;
  end;

  NEFilterRemediationVerdict = interface(NEFilterVerdict)
    ['{85078941-9DDC-4237-9EA8-4B8BABCA7843}']
  end;

  TNEFilterRemediationVerdict = class
    (TOCGenericImport<NEFilterRemediationVerdictClass,
    NEFilterRemediationVerdict>)
  end;

  PNEFilterRemediationVerdict = Pointer;

  NEFilterBrowserFlowClass = interface(NEFilterFlowClass)
    ['{C7B69BFA-0F4E-400A-A04F-B6F5863B4CA1}']
  end;

  NEFilterBrowserFlow = interface(NEFilterFlow)
    ['{284D99C3-3C36-4F1B-830F-27FDBC4E871E}']
    function request: PInteger; cdecl;
    function response: PInteger; cdecl;
    function parentURL: PInteger; cdecl;
  end;

  TNEFilterBrowserFlow = class(TOCGenericImport<NEFilterBrowserFlowClass,
    NEFilterBrowserFlow>)
  end;

  PNEFilterBrowserFlow = Pointer;

  NEFilterSocketFlowClass = interface(NEFilterFlowClass)
    ['{63460A9B-B61D-4C88-BC8A-2167372F8175}']
  end;

  NEFilterSocketFlow = interface(NEFilterFlow)
    ['{FB26D7A2-71DF-4E18-9066-26B8D9396C4C}']
    function remoteEndpoint: NWEndpoint; cdecl;
    function localEndpoint: NWEndpoint; cdecl;
    procedure setSocketFamily(socketFamily: Integer); cdecl;
    function socketFamily: Integer; cdecl;
    procedure setSocketType(socketType: Integer); cdecl;
    function socketType: Integer; cdecl;
    procedure setSocketProtocol(socketProtocol: Integer); cdecl;
    function socketProtocol: Integer; cdecl;
  end;

  TNEFilterSocketFlow = class(TOCGenericImport<NEFilterSocketFlowClass,
    NEFilterSocketFlow>)
  end;

  PNEFilterSocketFlow = Pointer;

  NEFilterDataProviderClass = interface(NEFilterProviderClass)
    ['{CB18705F-B7B2-4E47-8672-F5AF3B2769C5}']
  end;

  NEFilterDataProvider = interface(NEFilterProvider)
    ['{ED6A7148-2DA2-481B-88E0-5B5AA3D97A15}']
    function handleNewFlow(flow: NEFilterFlow): NEFilterNewFlowVerdict; cdecl;
    function handleInboundDataFromFlow(flow: NEFilterFlow;
      readBytesStartOffset: NSUInteger; readBytes: Pointer)
      : NEFilterDataVerdict; cdecl;
    function handleOutboundDataFromFlow(flow: NEFilterFlow;
      readBytesStartOffset: NSUInteger; readBytes: Pointer)
      : NEFilterDataVerdict; cdecl;
    function handleInboundDataCompleteForFlow(flow: NEFilterFlow)
      : NEFilterDataVerdict; cdecl;
    function handleOutboundDataCompleteForFlow(flow: NEFilterFlow)
      : NEFilterDataVerdict; cdecl;
    function handleRemediationForFlow(flow: NEFilterFlow)
      : NEFilterRemediationVerdict; cdecl;
    procedure handleRulesChanged; cdecl;
  end;

  TNEFilterDataProvider = class(TOCGenericImport<NEFilterDataProviderClass,
    NEFilterDataProvider>)
  end;

  PNEFilterDataProvider = Pointer;

  NEHotspotNetworkClass = interface(NSObjectClass)
    ['{ABA67E27-8455-46CB-9BB9-9F5DCEA267E2}']
  end;

  NEHotspotNetwork = interface(NSObject)
    ['{5D89937C-CDF0-40E1-B1E0-E51B0082BE46}']
    function SSID: NSString; cdecl;
    function BSSID: NSString; cdecl;
    function signalStrength: Double; cdecl;
    function isSecure: Boolean; cdecl;
    function didAutoJoin: Boolean; cdecl;
    function didJustJoin: Boolean; cdecl;
    function isChosenHelper: Boolean; cdecl;
    procedure setConfidence(confidence: NEHotspotHelperConfidence); cdecl;
    procedure setPassword(password: NSString); cdecl;
  end;

  TNEHotspotNetwork = class(TOCGenericImport<NEHotspotNetworkClass,
    NEHotspotNetwork>)
  end;

  PNEHotspotNetwork = Pointer;

  NEHotspotHelperResponseClass = interface(NSObjectClass)
    ['{986FC952-308E-42E9-9832-A81A32A318E6}']
  end;

  NEHotspotHelperResponse = interface(NSObject)
    ['{99B62E1E-62A5-4707-ACE8-7E3595B7AE07}']
    procedure setNetwork(network: NEHotspotNetwork); cdecl;
    procedure setNetworkList(networkList: NSArray); cdecl;
    procedure deliver; cdecl;
  end;

  TNEHotspotHelperResponse = class
    (TOCGenericImport<NEHotspotHelperResponseClass, NEHotspotHelperResponse>)
  end;

  PNEHotspotHelperResponse = Pointer;

  NEHotspotHelperCommandClass = interface(NSObjectClass)
    ['{BDDE879E-274C-4E47-8B04-67A1EE366071}']
  end;

  NEHotspotHelperCommand = interface(NSObject)
    ['{89E59541-D185-4965-A732-083E685383DA}']
    function commandType: NEHotspotHelperCommandType; cdecl;
    function network: NEHotspotNetwork; cdecl;
    function networkList: NSArray; cdecl;
    function createResponse(result: NEHotspotHelperResult)
      : NEHotspotHelperResponse; cdecl;
    function createTCPConnection(endpoint: NWEndpoint): NWTCPConnection; cdecl;
    function createUDPSession(endpoint: NWEndpoint): NWUDPSession; cdecl;
  end;

  TNEHotspotHelperCommand = class(TOCGenericImport<NEHotspotHelperCommandClass,
    NEHotspotHelperCommand>)
  end;

  PNEHotspotHelperCommand = Pointer;

  NEHotspotHelperClass = interface(NSObjectClass)
    ['{690C3165-F9AB-4EBD-8810-3AB29B54ABA8}']
    { class } function registerWithOptions(options: NSDictionary;
      queue: dispatch_queue_t; handler: NEHotspotHelperHandler): Boolean; cdecl;
    { class } function logoff(network: NEHotspotNetwork): Boolean; cdecl;
    { class } function supportedNetworkInterfaces: NSArray; cdecl;
  end;

  NEHotspotHelper = interface(NSObject)
    ['{FE22551A-53B2-45D0-B362-72F457CF8E12}']
    procedure bindToHotspotHelperCommand
      (command: NEHotspotHelperCommand); cdecl;
  end;

  TNEHotspotHelper = class(TOCGenericImport<NEHotspotHelperClass,
    NEHotspotHelper>)
  end;

  PNEHotspotHelper = Pointer;

  NEIPv4RouteClass = interface(NSObjectClass)
    ['{5DC59A5D-7824-4360-A6DC-A335A4BE5385}']
    { class } function defaultRoute: NEIPv4Route; cdecl;
  end;

  NEIPv4Route = interface(NSObject)
    ['{8B566B0F-6F28-42E6-B8C7-F98776955F91}']
    function initWithDestinationAddress(address: NSString; subnetMask: NSString)
      : Pointer { instancetype }; cdecl;
    function destinationAddress: NSString; cdecl;
    function destinationSubnetMask: NSString; cdecl;
    procedure setGatewayAddress(gatewayAddress: NSString); cdecl;
    function gatewayAddress: NSString; cdecl;
  end;

  TNEIPv4Route = class(TOCGenericImport<NEIPv4RouteClass, NEIPv4Route>)
  end;

  PNEIPv4Route = Pointer;

  NEIPv4SettingsClass = interface(NSObjectClass)
    ['{AAC65464-AE26-4E3D-AB0F-66B4EFBD9E49}']
  end;

  NEIPv4Settings = interface(NSObject)
    ['{63805FB1-3029-492F-84A6-7E57C0B6AE18}']
    function initWithAddresses(addresses: NSArray; subnetMasks: NSArray)
      : Pointer { instancetype }; cdecl;
    function addresses: NSArray; cdecl;
    function subnetMasks: NSArray; cdecl;
    procedure setIncludedRoutes(includedRoutes: NSArray); cdecl;
    function includedRoutes: NSArray; cdecl;
    procedure setExcludedRoutes(excludedRoutes: NSArray); cdecl;
    function excludedRoutes: NSArray; cdecl;
  end;

  TNEIPv4Settings = class(TOCGenericImport<NEIPv4SettingsClass, NEIPv4Settings>)
  end;

  PNEIPv4Settings = Pointer;

  NEIPv6RouteClass = interface(NSObjectClass)
    ['{FFF7AF18-D249-4CAB-B214-FCD33665B759}']
    { class } function defaultRoute: NEIPv6Route; cdecl;
  end;

  NEIPv6Route = interface(NSObject)
    ['{0E688E0B-F87F-490C-8FFE-0DFB67EFDF5F}']
    function initWithDestinationAddress(address: NSString;
      networkPrefixLength: NSNumber): Pointer { instancetype }; cdecl;
    function destinationAddress: NSString; cdecl;
    function destinationNetworkPrefixLength: NSNumber; cdecl;
    procedure setGatewayAddress(gatewayAddress: NSString); cdecl;
    function gatewayAddress: NSString; cdecl;
  end;

  TNEIPv6Route = class(TOCGenericImport<NEIPv6RouteClass, NEIPv6Route>)
  end;

  PNEIPv6Route = Pointer;

  NEIPv6SettingsClass = interface(NSObjectClass)
    ['{F5B1AD5D-4FA9-4BF2-9025-5D8571C6A965}']
  end;

  NEIPv6Settings = interface(NSObject)
    ['{3629FD3F-DC47-480E-A477-5A6733738A7A}']
    function initWithAddresses(addresses: NSArray;
      networkPrefixLengths: NSArray): Pointer { instancetype }; cdecl;
    function addresses: NSArray; cdecl;
    function networkPrefixLengths: NSArray; cdecl;
    procedure setIncludedRoutes(includedRoutes: NSArray); cdecl;
    function includedRoutes: NSArray; cdecl;
    procedure setExcludedRoutes(excludedRoutes: NSArray); cdecl;
    function excludedRoutes: NSArray; cdecl;
  end;

  TNEIPv6Settings = class(TOCGenericImport<NEIPv6SettingsClass, NEIPv6Settings>)
  end;

  PNEIPv6Settings = Pointer;

  NEEvaluateConnectionRuleClass = interface(NSObjectClass)
    ['{607CF5A7-E349-429F-8F72-90D752E0C38C}']
  end;

  NEEvaluateConnectionRule = interface(NSObject)
    ['{89C9DBDE-8C2A-48B6-AD9E-4387B68A80A5}']
    function initWithMatchDomains(domains: NSArray;
      andAction: NEEvaluateConnectionRuleAction)
      : Pointer { instancetype }; cdecl;
    function action: NEEvaluateConnectionRuleAction; cdecl;
    function matchDomains: NSArray; cdecl;
    procedure setUseDNSServers(useDNSServers: NSArray); cdecl;
    function useDNSServers: NSArray; cdecl;
    procedure setProbeURL(probeURL: NSURL); cdecl;
    function probeURL: NSURL; cdecl;
  end;

  TNEEvaluateConnectionRule = class
    (TOCGenericImport<NEEvaluateConnectionRuleClass, NEEvaluateConnectionRule>)
  end;

  PNEEvaluateConnectionRule = Pointer;

  NEOnDemandRuleConnectClass = interface(NEOnDemandRuleClass)
    ['{C5EBB3F1-E8AF-46C8-B0F0-A2024DD8717D}']
  end;

  NEOnDemandRuleConnect = interface(NEOnDemandRule)
    ['{CF315D15-63C6-4397-8DBD-4B22E63AA32F}']
  end;

  TNEOnDemandRuleConnect = class(TOCGenericImport<NEOnDemandRuleConnectClass,
    NEOnDemandRuleConnect>)
  end;

  PNEOnDemandRuleConnect = Pointer;

  NEOnDemandRuleDisconnectClass = interface(NEOnDemandRuleClass)
    ['{F14E254A-79AC-406A-9880-FC4E06F730EB}']
  end;

  NEOnDemandRuleDisconnect = interface(NEOnDemandRule)
    ['{826957E5-315F-4886-B554-AB669104D061}']
  end;

  TNEOnDemandRuleDisconnect = class
    (TOCGenericImport<NEOnDemandRuleDisconnectClass, NEOnDemandRuleDisconnect>)
  end;

  PNEOnDemandRuleDisconnect = Pointer;

  NEOnDemandRuleIgnoreClass = interface(NEOnDemandRuleClass)
    ['{5AEA7D41-4E54-4BA9-9CBE-AC4F6C577442}']
  end;

  NEOnDemandRuleIgnore = interface(NEOnDemandRule)
    ['{7D528436-D4F3-456F-9414-66BF70E470B0}']
  end;

  TNEOnDemandRuleIgnore = class(TOCGenericImport<NEOnDemandRuleIgnoreClass,
    NEOnDemandRuleIgnore>)
  end;

  PNEOnDemandRuleIgnore = Pointer;

  NEOnDemandRuleEvaluateConnectionClass = interface(NEOnDemandRuleClass)
    ['{D7FFCA25-3A31-47AB-A166-41FD15A4D56C}']
  end;

  NEOnDemandRuleEvaluateConnection = interface(NEOnDemandRule)
    ['{5E0CB857-16EB-4800-AF8A-7E1E985357F8}']
    procedure setConnectionRules(connectionRules: NSArray); cdecl;
    function connectionRules: NSArray; cdecl;
  end;

  TNEOnDemandRuleEvaluateConnection = class
    (TOCGenericImport<NEOnDemandRuleEvaluateConnectionClass,
    NEOnDemandRuleEvaluateConnection>)
  end;

  PNEOnDemandRuleEvaluateConnection = Pointer;

  NEPacketTunnelFlowClass = interface(NSObjectClass)
    ['{8879B445-F35E-44B9-9421-883AE4B949A6}']
  end;

  NEPacketTunnelFlow = interface(NSObject)
    ['{F0F925E1-83D2-4B7D-AC83-EF7DC9A15FA0}']
    procedure readPacketsWithCompletionHandler(completionHandler
      : TNetworkExtensionCompletionHandler4); cdecl;
    function writePackets(packets: NSArray; withProtocols: NSArray)
      : Boolean; cdecl;
  end;

  TNEPacketTunnelFlow = class(TOCGenericImport<NEPacketTunnelFlowClass,
    NEPacketTunnelFlow>)
  end;

  PNEPacketTunnelFlow = Pointer;

  NEProxySettingsClass = interface(NSObjectClass)
    ['{E05AE80E-FC1C-43EA-9D9C-70726BC0B86C}']
  end;

  NEProxySettings = interface(NSObject)
    ['{406A4479-4423-46AC-943A-E88C836BF868}']
    procedure setAutoProxyConfigurationEnabled(autoProxyConfigurationEnabled
      : Boolean); cdecl;
    function autoProxyConfigurationEnabled: Boolean; cdecl;
    procedure setProxyAutoConfigurationURL(proxyAutoConfigurationURL
      : NSURL); cdecl;
    function proxyAutoConfigurationURL: NSURL; cdecl;
    procedure setProxyAutoConfigurationJavaScript
      (proxyAutoConfigurationJavaScript: NSString); cdecl;
    function proxyAutoConfigurationJavaScript: NSString; cdecl;
    procedure setHTTPEnabled(HTTPEnabled: Boolean); cdecl;
    function HTTPEnabled: Boolean; cdecl;
    procedure setHTTPServer(HTTPServer: NEProxyServer); cdecl;
    function HTTPServer: NEProxyServer; cdecl;
    procedure setHTTPSEnabled(HTTPSEnabled: Boolean); cdecl;
    function HTTPSEnabled: Boolean; cdecl;
    procedure setHTTPSServer(HTTPSServer: NEProxyServer); cdecl;
    function HTTPSServer: NEProxyServer; cdecl;
    procedure setExcludeSimpleHostnames(excludeSimpleHostnames: Boolean); cdecl;
    function excludeSimpleHostnames: Boolean; cdecl;
    procedure setExceptionList(exceptionList: NSArray); cdecl;
    function exceptionList: NSArray; cdecl;
    procedure setMatchDomains(matchDomains: NSArray); cdecl;
    function matchDomains: NSArray; cdecl;
  end;

  TNEProxySettings = class(TOCGenericImport<NEProxySettingsClass,
    NEProxySettings>)
  end;

  PNEProxySettings = Pointer;

  NEPacketTunnelNetworkSettingsClass = interface(NETunnelNetworkSettingsClass)
    ['{E8AD4190-641E-495F-B3C1-1E63F45B0105}']
  end;

  NEPacketTunnelNetworkSettings = interface(NETunnelNetworkSettings)
    ['{9A034259-CA6A-4703-A73D-6C0C9895D0B2}']
    procedure setIPv4Settings(IPv4Settings: NEIPv4Settings); cdecl;
    function IPv4Settings: NEIPv4Settings; cdecl;
    procedure setIPv6Settings(IPv6Settings: NEIPv6Settings); cdecl;
    function IPv6Settings: NEIPv6Settings; cdecl;
    procedure setTunnelOverheadBytes(tunnelOverheadBytes: NSNumber); cdecl;
    function tunnelOverheadBytes: NSNumber; cdecl;
    procedure setMTU(MTU: NSNumber); cdecl;
    function MTU: NSNumber; cdecl;
  end;

  TNEPacketTunnelNetworkSettings = class
    (TOCGenericImport<NEPacketTunnelNetworkSettingsClass,
    NEPacketTunnelNetworkSettings>)
  end;

  PNEPacketTunnelNetworkSettings = Pointer;

  NEPacketTunnelProviderClass = interface(NETunnelProviderClass)
    ['{1AC1AFEF-1A16-4E88-9960-772489918D78}']
  end;

  NEPacketTunnelProvider = interface(NETunnelProvider)
    ['{69FAD372-C8FB-478D-AF2A-937FBA5A50FA}']
    procedure startTunnelWithOptions(options: NSDictionary;
      completionHandler: TNetworkExtensionCompletionHandler5); cdecl;
    procedure stopTunnelWithReason(reason: NEProviderStopReason;
      completionHandler: TNetworkExtensionCompletionHandler1); cdecl;
    procedure cancelTunnelWithError(error: NSError); cdecl;
    function packetFlow: NEPacketTunnelFlow; cdecl;
    function createTCPConnectionThroughTunnelToEndpoint(remoteEndpoint
      : NWEndpoint; enableTLS: Boolean; TLSParameters: NWTLSParameters;
      delegate: Pointer): NWTCPConnection; cdecl;
    function createUDPSessionThroughTunnelToEndpoint(remoteEndpoint: NWEndpoint;
      fromEndpoint: NWHostEndpoint): NWUDPSession; cdecl;
  end;

  TNEPacketTunnelProvider = class(TOCGenericImport<NEPacketTunnelProviderClass,
    NEPacketTunnelProvider>)
  end;

  PNEPacketTunnelProvider = Pointer;

  NEProxyServerClass = interface(NSObjectClass)
    ['{E570C57B-6E14-41E3-93D7-0BADE909B7DF}']
  end;

  NEProxyServer = interface(NSObject)
    ['{D75F3A78-330A-46E2-A20E-D08F06D038F7}']
    function initWithAddress(address: NSString; port: NSInteger)
      : Pointer { instancetype }; cdecl;
    function address: NSString; cdecl;
    function port: NSInteger; cdecl;
    procedure setAuthenticationRequired(authenticationRequired: Boolean); cdecl;
    function authenticationRequired: Boolean; cdecl;
    procedure setUsername(username: NSString); cdecl;
    function username: NSString; cdecl;
    procedure setPassword(password: NSString); cdecl;
    function password: NSString; cdecl;
  end;

  TNEProxyServer = class(TOCGenericImport<NEProxyServerClass, NEProxyServer>)
  end;

  PNEProxyServer = Pointer;

  NETunnelProviderProtocolClass = interface(NEVPNProtocolClass)
    ['{3DD8738E-A599-42A9-99E5-022D5167E566}']
  end;

  NETunnelProviderProtocol = interface(NEVPNProtocol)
    ['{0506CC6E-2812-469A-8FFC-082FC2ADA87D}']
    procedure setProviderConfiguration(providerConfiguration
      : NSDictionary); cdecl;
    function providerConfiguration: NSDictionary; cdecl;
    procedure setProviderBundleIdentifier(providerBundleIdentifier
      : NSString); cdecl;
    function providerBundleIdentifier: NSString; cdecl;
  end;

  TNETunnelProviderProtocol = class
    (TOCGenericImport<NETunnelProviderProtocolClass, NETunnelProviderProtocol>)
  end;

  PNETunnelProviderProtocol = Pointer;

  NETunnelProviderSessionClass = interface(NEVPNConnectionClass)
    ['{07D61695-4FEF-4B89-895F-D096D2D15D6A}']
  end;

  NETunnelProviderSession = interface(NEVPNConnection)
    ['{74983C47-D9F1-4DDA-BCEC-99F3DEAF2B63}']
    function startTunnelWithOptions(options: NSDictionary;
      andReturnError: NSError): Boolean; cdecl;
    procedure stopTunnel; cdecl;
    function sendProviderMessage(messageData: NSData; returnError: NSError;
      responseHandler: TNetworkExtensionResponseHandler): Boolean; cdecl;
  end;

  TNETunnelProviderSession = class
    (TOCGenericImport<NETunnelProviderSessionClass, NETunnelProviderSession>)
  end;

  PNETunnelProviderSession = Pointer;

  NEVPNProtocolIPSecClass = interface(NEVPNProtocolClass)
    ['{A183B54D-A344-4291-BFC9-23E12DAE0B9A}']
  end;

  NEVPNProtocolIPSec = interface(NEVPNProtocol)
    ['{512A5414-24AA-478C-8A0B-4F64DD2AF4D7}']
    procedure setAuthenticationMethod(authenticationMethod
      : NEVPNIKEAuthenticationMethod); cdecl;
    function authenticationMethod: NEVPNIKEAuthenticationMethod; cdecl;
    procedure setUseExtendedAuthentication(useExtendedAuthentication
      : Boolean); cdecl;
    function useExtendedAuthentication: Boolean; cdecl;
    procedure setSharedSecretReference(sharedSecretReference: NSData); cdecl;
    function sharedSecretReference: NSData; cdecl;
    procedure setLocalIdentifier(localIdentifier: NSString); cdecl;
    function localIdentifier: NSString; cdecl;
    procedure setRemoteIdentifier(remoteIdentifier: NSString); cdecl;
    function remoteIdentifier: NSString; cdecl;
  end;

  TNEVPNProtocolIPSec = class(TOCGenericImport<NEVPNProtocolIPSecClass,
    NEVPNProtocolIPSec>)
  end;

  PNEVPNProtocolIPSec = Pointer;

  NEVPNIKEv2SecurityAssociationParametersClass = interface(NSObjectClass)
    ['{68DF646E-625D-4393-87E8-7413B1C7B78B}']
  end;

  NEVPNIKEv2SecurityAssociationParameters = interface(NSObject)
    ['{1F0B7F01-6B29-416A-8CBD-6B1CEC1DB7E5}']
    procedure setEncryptionAlgorithm(encryptionAlgorithm
      : NEVPNIKEv2EncryptionAlgorithm); cdecl;
    function encryptionAlgorithm: NEVPNIKEv2EncryptionAlgorithm; cdecl;
    procedure setIntegrityAlgorithm(integrityAlgorithm
      : NEVPNIKEv2IntegrityAlgorithm); cdecl;
    function integrityAlgorithm: NEVPNIKEv2IntegrityAlgorithm; cdecl;
    procedure setDiffieHellmanGroup(diffieHellmanGroup
      : NEVPNIKEv2DiffieHellmanGroup); cdecl;
    function diffieHellmanGroup: NEVPNIKEv2DiffieHellmanGroup; cdecl;
    procedure setLifetimeMinutes(lifetimeMinutes: Int32); cdecl;
    function lifetimeMinutes: Int32; cdecl;
  end;

  TNEVPNIKEv2SecurityAssociationParameters = class
    (TOCGenericImport<NEVPNIKEv2SecurityAssociationParametersClass,
    NEVPNIKEv2SecurityAssociationParameters>)
  end;

  PNEVPNIKEv2SecurityAssociationParameters = Pointer;

  NEVPNProtocolIKEv2Class = interface(NEVPNProtocolIPSecClass)
    ['{A6B91E16-5DEC-454A-BAFE-CED8DBE655B5}']
  end;

  NEVPNProtocolIKEv2 = interface(NEVPNProtocolIPSec)
    ['{C46E0332-EA14-4D58-B493-3BDED67D93B1}']
    procedure setDeadPeerDetectionRate(deadPeerDetectionRate
      : NEVPNIKEv2DeadPeerDetectionRate); cdecl;
    function deadPeerDetectionRate: NEVPNIKEv2DeadPeerDetectionRate; cdecl;
    procedure setServerCertificateIssuerCommonName
      (serverCertificateIssuerCommonName: NSString); cdecl;
    function serverCertificateIssuerCommonName: NSString; cdecl;
    procedure setServerCertificateCommonName(serverCertificateCommonName
      : NSString); cdecl;
    function serverCertificateCommonName: NSString; cdecl;
    procedure setCertificateType(certificateType
      : NEVPNIKEv2CertificateType); cdecl;
    function certificateType: NEVPNIKEv2CertificateType; cdecl;
    procedure setUseConfigurationAttributeInternalIPSubnet
      (useConfigurationAttributeInternalIPSubnet: Boolean); cdecl;
    function useConfigurationAttributeInternalIPSubnet: Boolean; cdecl;
    function IKESecurityAssociationParameters
      : NEVPNIKEv2SecurityAssociationParameters; cdecl;
    function childSecurityAssociationParameters
      : NEVPNIKEv2SecurityAssociationParameters; cdecl;
    procedure setDisableMOBIKE(disableMOBIKE: Boolean); cdecl;
    function disableMOBIKE: Boolean; cdecl;
    procedure setDisableRedirect(disableRedirect: Boolean); cdecl;
    function disableRedirect: Boolean; cdecl;
    procedure setEnablePFS(enablePFS: Boolean); cdecl;
    function enablePFS: Boolean; cdecl;
    procedure setEnableRevocationCheck(enableRevocationCheck: Boolean); cdecl;
    function enableRevocationCheck: Boolean; cdecl;
    procedure setStrictRevocationCheck(strictRevocationCheck: Boolean); cdecl;
    function strictRevocationCheck: Boolean; cdecl;
  end;

  TNEVPNProtocolIKEv2 = class(TOCGenericImport<NEVPNProtocolIKEv2Class,
    NEVPNProtocolIKEv2>)
  end;

  PNEVPNProtocolIKEv2 = Pointer;

  NWBonjourServiceEndpointClass = interface(NWEndpointClass)
    ['{1EC4F94F-FBA0-4ADC-821F-7190D1F816CE}']
    { class } function endpointWithName(name: NSString; &type: NSString;
      domain: NSString): Pointer { instancetype }; cdecl;
  end;

  NWBonjourServiceEndpoint = interface(NWEndpoint)
    ['{FE9045B6-7621-45B9-BD30-CAE4F084F029}']
    function name: NSString; cdecl;
    function &type: NSString; cdecl;
    function domain: NSString; cdecl;
  end;

  TNWBonjourServiceEndpoint = class
    (TOCGenericImport<NWBonjourServiceEndpointClass, NWBonjourServiceEndpoint>)
  end;

  PNWBonjourServiceEndpoint = Pointer;

  // ===== Protocol declarations =====

  NWTCPConnectionAuthenticationDelegate = interface(IObjectiveC)
    ['{06B7590B-0712-4E20-AF0B-3463C7846F23}']
    function shouldProvideIdentityForConnection(connection: NWTCPConnection)
      : Boolean; cdecl;
    procedure provideIdentityForConnection(connection: NWTCPConnection;
      completionHandler: TNetworkExtensionCompletionHandler7); cdecl;
    function shouldEvaluateTrustForConnection(connection: NWTCPConnection)
      : Boolean; cdecl;
    procedure evaluateTrustForConnection(connection: NWTCPConnection;
      peerCertificateChain: NSArray;
      completionHandler: TNetworkExtensionCompletionHandler8); cdecl;
  end;

  // ===== Exported string consts =====

function NEAppProxyErrorDomain: Pointer;
function NETunnelProviderErrorDomain: NSString;
function NEVPNErrorDomain: NSString;
function NEVPNConfigurationChangeNotification: NSString;
function NEFilterProviderRemediationMapRemediationURLs: NSString;
function NEFilterProviderRemediationMapRemediationButtonTexts: NSString;
function NEFilterErrorDomain: NSString;
function NEFilterConfigurationDidChangeNotification: NSString;
function kNEHotspotHelperOptionDisplayName: NSString;
function NEVPNStatusDidChangeNotification: NSString;
function NEVPNConnectionStartOptionUsername: NSString;
function NEVPNConnectionStartOptionPassword: NSString;


// ===== External functions =====

const
  libNetworkExtension =
    '/System/Library/Frameworks/NetworkExtension.framework/NetworkExtension';
function NS_ENUM(NSInteger: Integer; NEAppProxyFlowError: Integer): Integer;
  cdecl; external libNetworkExtension name _PU + 'NS_ENUM';
function NS_ENUM_AVAILABLE: Integer; cdecl;
  external libNetworkExtension name _PU + 'NS_ENUM_AVAILABLE';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  NetworkExtensionModule: THandle;

{$ENDIF IOS}

function NETunnelProviderErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension,
    'NETunnelProviderErrorDomain');
end;

function NEVPNErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension, 'NEVPNErrorDomain');
end;

function NEVPNConfigurationChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension,
    'NEVPNConfigurationChangeNotification');
end;

function NEFilterProviderRemediationMapRemediationURLs: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension,
    'NEFilterProviderRemediationMapRemediationURLs');
end;

function NEFilterProviderRemediationMapRemediationButtonTexts: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension,
    'NEFilterProviderRemediationMapRemediationButtonTexts');
end;

function NEFilterErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension, 'NEFilterErrorDomain');
end;

function NEFilterConfigurationDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension,
    'NEFilterConfigurationDidChangeNotification');
end;

function kNEHotspotHelperOptionDisplayName: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension,
    'kNEHotspotHelperOptionDisplayName');
end;

function NEVPNStatusDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension,
    'NEVPNStatusDidChangeNotification');
end;

function NEVPNConnectionStartOptionUsername: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension,
    'NEVPNConnectionStartOptionUsername');
end;

function NEVPNConnectionStartOptionPassword: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension,
    'NEVPNConnectionStartOptionPassword');
end;

function NEAppProxyErrorDomain: Pointer;
begin
  result := CocoaPointerConst(libNetworkExtension, 'NEAppProxyErrorDomain');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

NetworkExtensionModule := dlopen(MarshaledAString(libNetworkExtension),
  RTLD_LAZY);

finalization

dlclose(NetworkExtensionModule);
{$ENDIF IOS}

end.
