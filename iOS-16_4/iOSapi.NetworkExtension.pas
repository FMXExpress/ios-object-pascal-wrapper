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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
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
  NEProviderStopReasonSleep = 15;
  NEProviderStopReasonAppUpdate = 16;
  NETunnelProviderErrorNetworkSettingsInvalid = 1;
  NETunnelProviderErrorNetworkSettingsCanceled = 2;
  NETunnelProviderErrorNetworkSettingsFailed = 3;
  NETunnelProviderRoutingMethodDestinationIP = 1;
  NETunnelProviderRoutingMethodSourceApplication = 2;
  NETunnelProviderRoutingMethodNetworkRule = 3;
  NEVPNErrorConfigurationInvalid = 1;
  NEVPNErrorConfigurationDisabled = 2;
  NEVPNErrorConnectionFailed = 3;
  NEVPNErrorConfigurationStale = 4;
  NEVPNErrorConfigurationReadWriteFailed = 5;
  NEVPNErrorConfigurationUnknown = 6;
  NEAppPushManagerErrorConfigurationInvalid = 1;
  NEAppPushManagerErrorConfigurationNotLoaded = 2;
  NEAppPushManagerErrorInternalError = 3;
  NEAppPushManagerErrorInactiveSession = 4;
  NEDNSProxyManagerErrorConfigurationInvalid = 1;
  NEDNSProxyManagerErrorConfigurationDisabled = 2;
  NEDNSProxyManagerErrorConfigurationStale = 3;
  NEDNSProxyManagerErrorConfigurationCannotBeRemoved = 4;
  NEDNSProtocolCleartext = 1;
  NEDNSProtocolTLS = 2;
  NEDNSProtocolHTTPS = 3;
  NEDNSSettingsManagerErrorConfigurationInvalid = 1;
  NEDNSSettingsManagerErrorConfigurationDisabled = 2;
  NEDNSSettingsManagerErrorConfigurationStale = 3;
  NEDNSSettingsManagerErrorConfigurationCannotBeRemoved = 4;
  NENetworkRuleProtocolAny = 0;
  NENetworkRuleProtocolTCP = 1;
  NENetworkRuleProtocolUDP = 2;
  NETrafficDirectionAny = 0;
  NETrafficDirectionInbound = 1;
  NETrafficDirectionOutbound = 2;
  NEFilterReportFrequencyNone = 0;
  NEFilterReportFrequencyLow = 1;
  NEFilterReportFrequencyMedium = 2;
  NEFilterReportFrequencyHigh = 3;
  NEFilterActionInvalid = 0;
  NEFilterActionAllow = 1;
  NEFilterActionDrop = 2;
  NEFilterActionRemediate = 3;
  NEFilterActionFilterData = 4;
  NEFilterReportEventNewFlow = 1;
  NEFilterReportEventDataDecision = 2;
  NEFilterReportEventFlowClosed = 3;
  NEFilterReportEventStatistics = 4;
  NEFilterDataAttributeHasIPHeader = 1;
  NEFilterManagerErrorConfigurationInvalid = 1;
  NEFilterManagerErrorConfigurationDisabled = 2;
  NEFilterManagerErrorConfigurationStale = 3;
  NEFilterManagerErrorConfigurationCannotBeRemoved = 4;
  NEFilterManagerErrorConfigurationPermissionDenied = 5;
  NEFilterManagerErrorConfigurationInternalError = 6;
  NEFilterManagerGradeFirewall = 1;
  NEFilterManagerGradeInspector = 2;
  NEFilterPacketProviderVerdictAllow = 0;
  NEFilterPacketProviderVerdictDrop = 1;
  NEFilterPacketProviderVerdictDelay = 2;
  NEHotspotConfigurationEAPTypeEAPTLS = 13;
  NEHotspotConfigurationEAPTypeEAPTTLS = 21;
  NEHotspotConfigurationEAPTypeEAPPEAP = 25;
  NEHotspotConfigurationEAPTypeEAPFAST = 43;
  NEHotspotConfigurationEAPTTLSInnerAuthenticationPAP = 0;
  NEHotspotConfigurationEAPTTLSInnerAuthenticationCHAP = 1;
  NEHotspotConfigurationEAPTTLSInnerAuthenticationMSCHAP = 2;
  NEHotspotConfigurationEAPTTLSInnerAuthenticationMSCHAPv2 = 3;
  NEHotspotConfigurationEAPTTLSInnerAuthenticationEAP = 4;
  NEHotspotConfigurationEAPTLSVersion_1_0 = 0;
  NEHotspotConfigurationEAPTLSVersion_1_1 = 1;
  NEHotspotConfigurationEAPTLSVersion_1_2 = 2;
  NEHotspotConfigurationErrorInvalid = 0;
  NEHotspotConfigurationErrorInvalidSSID = 1;
  NEHotspotConfigurationErrorInvalidWPAPassphrase = 2;
  NEHotspotConfigurationErrorInvalidWEPPassphrase = 3;
  NEHotspotConfigurationErrorInvalidEAPSettings = 4;
  NEHotspotConfigurationErrorInvalidHS20Settings = 5;
  NEHotspotConfigurationErrorInvalidHS20DomainName = 6;
  NEHotspotConfigurationErrorUserDenied = 7;
  NEHotspotConfigurationErrorInternal = 8;
  NEHotspotConfigurationErrorPending = 9;
  NEHotspotConfigurationErrorSystemConfiguration = 10;
  NEHotspotConfigurationErrorUnknown = 11;
  NEHotspotConfigurationErrorJoinOnceNotSupported = 12;
  NEHotspotConfigurationErrorAlreadyAssociated = 13;
  NEHotspotConfigurationErrorApplicationIsNotInForeground = 14;
  NEHotspotConfigurationErrorInvalidSSIDPrefix = 15;
  NEHotspotNetworkSecurityTypeOpen = 0;
  NEHotspotNetworkSecurityTypeWEP = 1;
  NEHotspotNetworkSecurityTypePersonal = 2;
  NEHotspotNetworkSecurityTypeEnterprise = 3;
  NEHotspotNetworkSecurityTypeUnknown = 4;
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
  NEVPNConnectionErrorOverslept = 1;
  NEVPNConnectionErrorNoNetworkAvailable = 2;
  NEVPNConnectionErrorUnrecoverableNetworkChange = 3;
  NEVPNConnectionErrorConfigurationFailed = 4;
  NEVPNConnectionErrorServerAddressResolutionFailed = 5;
  NEVPNConnectionErrorServerNotResponding = 6;
  NEVPNConnectionErrorServerDead = 7;
  NEVPNConnectionErrorAuthenticationFailed = 8;
  NEVPNConnectionErrorClientCertificateInvalid = 9;
  NEVPNConnectionErrorClientCertificateNotYetValid = 10;
  NEVPNConnectionErrorClientCertificateExpired = 11;
  NEVPNConnectionErrorPluginFailed = 12;
  NEVPNConnectionErrorConfigurationNotFound = 13;
  NEVPNConnectionErrorPluginDisabled = 14;
  NEVPNConnectionErrorNegotiationFailed = 15;
  NEVPNConnectionErrorServerDisconnected = 16;
  NEVPNConnectionErrorServerCertificateInvalid = 17;
  NEVPNConnectionErrorServerCertificateNotYetValid = 18;
  NEVPNConnectionErrorServerCertificateExpired = 19;
  NEVPNIKEAuthenticationMethodNone = 0;
  NEVPNIKEAuthenticationMethodCertificate = 1;
  NEVPNIKEAuthenticationMethodSharedSecret = 2;
  NEVPNIKEv2EncryptionAlgorithmDES = 1;
  NEVPNIKEv2EncryptionAlgorithm3DES = 2;
  NEVPNIKEv2EncryptionAlgorithmAES128 = 3;
  NEVPNIKEv2EncryptionAlgorithmAES256 = 4;
  NEVPNIKEv2EncryptionAlgorithmAES128GCM = 5;
  NEVPNIKEv2EncryptionAlgorithmAES256GCM = 6;
  NEVPNIKEv2EncryptionAlgorithmChaCha20Poly1305 = 7;
  NEVPNIKEv2IntegrityAlgorithmSHA96 = 1;
  NEVPNIKEv2IntegrityAlgorithmSHA160 = 2;
  NEVPNIKEv2IntegrityAlgorithmSHA256 = 3;
  NEVPNIKEv2IntegrityAlgorithmSHA384 = 4;
  NEVPNIKEv2IntegrityAlgorithmSHA512 = 5;
  NEVPNIKEv2DeadPeerDetectionRateNone = 0;
  NEVPNIKEv2DeadPeerDetectionRateLow = 1;
  NEVPNIKEv2DeadPeerDetectionRateMedium = 2;
  NEVPNIKEv2DeadPeerDetectionRateHigh = 3;
  NEVPNIKEv2DiffieHellmanGroupInvalid = 0;
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
  NEVPNIKEv2DiffieHellmanGroup31 = 31;
  NEVPNIKEv2CertificateTypeRSA = 1;
  NEVPNIKEv2CertificateTypeECDSA256 = 2;
  NEVPNIKEv2CertificateTypeECDSA384 = 3;
  NEVPNIKEv2CertificateTypeECDSA521 = 4;
  NEVPNIKEv2CertificateTypeEd25519 = 5;
  NEVPNIKEv2TLSVersionDefault = 0;
  NEVPNIKEv2TLSVersion1_0 = 1;
  NEVPNIKEv2TLSVersion1_1 = 2;
  NEVPNIKEv2TLSVersion1_2 = 3;
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
  NETunnelProvider = interface;
  NEAppProxyProvider = interface;
  NEVPNConnection = interface;
  NEOnDemandRule = interface;
  NETunnelProviderManager = interface;
  NEAppProxyProviderManager = interface;
  NEAppPushDelegate = interface;
  NEAppPushProvider = interface;
  NEDNSProxyProviderProtocol = interface;
  NEDNSProxyProvider = interface;
  NEDNSOverTLSSettings = interface;
  NEDNSOverHTTPSSettings = interface;
  NEIPv4Settings = interface;
  NEIPv6Settings = interface;
  NEPacketTunnelNetworkSettings = interface;
  NEEthernetTunnelNetworkSettings = interface;
  NEPacketTunnelFlow = interface;
  NEPacketTunnelProvider = interface;
  NEEthernetTunnelProvider = interface;
  NEFilterBrowserFlow = interface;
  NEFilterSocketFlow = interface;
  NEFilterProvider = interface;
  NEFilterNewFlowVerdict = interface;
  NEFilterControlVerdict = interface;
  NEFilterControlProvider = interface;
  NEFilterDataVerdict = interface;
  NEFilterRemediationVerdict = interface;
  NEFilterDataProvider = interface;
  NEPacket = interface;
  NEFilterPacketProvider = interface;
  NEHotspotHS20Settings = interface;
  NEHotspotEAPSettings = interface;
  NEHotspotConfiguration = interface;
  NEHotspotConfigurationManager = interface;
  NEHotspotNetwork = interface;
  NEHotspotHelperResponse = interface;
  NEHotspotHelperCommand = interface;
  NEHotspotHelper = interface;
  NEIPv4Route = interface;
  NEIPv6Route = interface;
  NEEvaluateConnectionRule = interface;
  NEOnDemandRuleConnect = interface;
  NEOnDemandRuleDisconnect = interface;
  NEOnDemandRuleIgnore = interface;
  NEOnDemandRuleEvaluateConnection = interface;
  NETransparentProxyManager = interface;
  NETransparentProxyNetworkSettings = interface;
  NETransparentProxyProvider = interface;
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
  PNSInteger = ^NSInteger;

  NEProviderStopReason = NSInteger;
  NETunnelProviderError = NSInteger;
  NETunnelProviderRoutingMethod = NSInteger;
  TNetworkExtensionCompletionHandler = procedure(param1: PInteger) of object;
  TNetworkExtensionCompletionHandler1 = procedure() of object;
  NEVPNError = NSInteger;
  TNetworkExtensionCompletionHandler2 = procedure(param1: Integer) of object;
  NEAppPushManagerError = NSInteger;
  NEDNSProxyManagerError = NSInteger;
  NEDNSProtocol = NSInteger;
  NEDNSSettingsManagerError = NSInteger;
  NENetworkRuleProtocol = NSInteger;
  NETrafficDirection = NSInteger;
  NEFilterReportFrequency = NSInteger;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  NEFilterAction = NSInteger;
  NEFilterReportEvent = NSInteger;
  TNetworkExtensionCompletionHandler3 = procedure
    (param1: NEFilterControlVerdict) of object;
  NEFilterDataAttribute = NSInteger;
  NEFilterManagerError = NSInteger;
  NEFilterManagerGrade = NSInteger;
  NEFilterPacketProviderVerdict = NSInteger;
  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  NEFilterPacketHandler = function(param1: NEFilterPacketContext;
    param2: Integer; param3: NETrafficDirection; param4: Pointer;
    param5: LongWord): NEFilterPacketProviderVerdict; cdecl;
  NEHotspotConfigurationEAPType = NSInteger;
  NEHotspotConfigurationTTLSInnerAuthenticationType = NSInteger;
  NEHotspotConfigurationEAPTLSVersion = NSInteger;
  SecIdentityRef = Pointer;
  PSecIdentityRef = ^SecIdentityRef;
  NEHotspotConfigurationError = NSInteger;
  TNetworkExtensionCompletionHandler4 = procedure(param1: NSError) of object;
  TNetworkExtensionCompletionHandler5 = procedure(param1: NSArray) of object;
  NEHotspotNetworkSecurityType = NSInteger;
  TNetworkExtensionCompletionHandler6 = procedure(param1: NEHotspotNetwork)
    of object;
  NEHotspotHelperCommandType = NSInteger;
  NEHotspotHelperResult = NSInteger;
  NEHotspotHelperConfidence = NSInteger;
  NEHotspotHelperHandler = procedure(param1: NEHotspotHelperCommand) of object;
  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;
  NEOnDemandRuleAction = NSInteger;
  NEOnDemandRuleInterfaceType = NSInteger;
  NEEvaluateConnectionRuleAction = NSInteger;
  __uint8_t = Byte;
  P__uint8_t = ^__uint8_t;

  sa_family_t = __uint8_t;
  Psa_family_t = ^sa_family_t;
  TNetworkExtensionCompletionHandler7 = procedure(param1: NSArray;
    param2: NSArray) of object;
  TNetworkExtensionCompletionHandler8 = procedure(param1: NSArray;
    param2: NSError) of object;
  NEVPNStatus = NSInteger;
  NEVPNConnectionError = NSInteger;
  TNetworkExtensionResponseHandler = procedure(param1: NSData) of object;
  NEVPNIKEAuthenticationMethod = NSInteger;
  NEVPNIKEv2EncryptionAlgorithm = NSInteger;
  NEVPNIKEv2IntegrityAlgorithm = NSInteger;
  NEVPNIKEv2DeadPeerDetectionRate = NSInteger;
  NEVPNIKEv2DiffieHellmanGroup = NSInteger;
  NEVPNIKEv2CertificateType = NSInteger;
  NEVPNIKEv2TLSVersion = NSInteger;
  NWPathStatus = NSInteger;
  NWTCPConnectionState = NSInteger;
  TNetworkExtensionCompletionHandler9 = procedure(param1: NSData;
    param2: NSError) of object;
  TNetworkExtensionCompletionHandler10 = procedure(param1: SecIdentityRef;
    param2: NSArray) of object;
  SecTrustRef = Pointer;
  PSecTrustRef = ^SecTrustRef;
  TNetworkExtensionCompletionHandler11 = procedure(param1: SecTrustRef)
    of object;
  NWUDPSessionState = NSInteger;
  // ===== Interface declarations =====

  NWTCPConnectionClass = interface(NSObjectClass)
    ['{1F8F27A9-F79F-4A16-B572-126630B1A9A3}']
  end;

  NWTCPConnection = interface(NSObject)
    ['{03D613F7-DFE5-4CC2-AC96-121CA6052331}']
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
      completionHandler: TNetworkExtensionCompletionHandler9); cdecl;
    procedure readMinimumLength(minimum: NSUInteger; maximumLength: NSUInteger;
      completionHandler: TNetworkExtensionCompletionHandler9); cdecl;
    procedure write(data: NSData;
      completionHandler: TNetworkExtensionCompletionHandler4); cdecl;
    procedure writeClose; cdecl;
  end;

  TNWTCPConnection = class(TOCGenericImport<NWTCPConnectionClass,
    NWTCPConnection>)
  end;

  PNWTCPConnection = Pointer;

  NWTLSParametersClass = interface(NSObjectClass)
    ['{55611919-6780-4DA7-BA84-27B3CCF7B949}']
  end;

  NWTLSParameters = interface(NSObject)
    ['{DF4F6060-EA19-479F-BA2F-7A8997A5336C}']
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
    ['{737D0B93-D926-44F5-8464-038361CE9558}']
  end;

  NWUDPSession = interface(NSObject)
    ['{AE165F6B-BF86-481F-A07D-1DC4DDE712A1}']
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
    procedure setReadHandler(handler: TNetworkExtensionCompletionHandler8;
      maxDatagrams: NSUInteger); cdecl;
    procedure writeMultipleDatagrams(datagramArray: NSArray;
      completionHandler: TNetworkExtensionCompletionHandler4); cdecl;
    procedure writeDatagram(datagram: NSData;
      completionHandler: TNetworkExtensionCompletionHandler4); cdecl;
    procedure cancel; cdecl;
  end;

  TNWUDPSession = class(TOCGenericImport<NWUDPSessionClass, NWUDPSession>)
  end;

  PNWUDPSession = Pointer;

  NWEndpointClass = interface(NSObjectClass)
    ['{01D1A76B-C645-4BAB-B03B-7915608564F8}']
  end;

  NWEndpoint = interface(NSObject)
    ['{BE9F113B-C8CD-4884-9E5E-6BF65202B262}']
  end;

  TNWEndpoint = class(TOCGenericImport<NWEndpointClass, NWEndpoint>)
  end;

  PNWEndpoint = Pointer;

  NWHostEndpointClass = interface(NWEndpointClass)
    ['{2E2123D5-7F3B-4F93-B0BA-473AFB10F326}']
    { class } function endpointWithHostname(hostname: NSString; port: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  NWHostEndpoint = interface(NWEndpoint)
    ['{0E2B2FEE-2C0B-4CAD-9B17-2256AFD6BD4B}']
    function hostname: NSString; cdecl;
    function port: NSString; cdecl;
  end;

  TNWHostEndpoint = class(TOCGenericImport<NWHostEndpointClass, NWHostEndpoint>)
  end;

  PNWHostEndpoint = Pointer;

  NWPathClass = interface(NSObjectClass)
    ['{14F9160E-0DE2-468B-B801-09F96CD3BD5E}']
  end;

  NWPath = interface(NSObject)
    ['{2DC1A451-27FD-411F-8323-25A144AE19FC}']
    function status: NWPathStatus; cdecl;
    function isExpensive: Boolean; cdecl;
    function isConstrained: Boolean; cdecl;
    function isEqualToPath(path: NWPath): Boolean; cdecl;
  end;

  TNWPath = class(TOCGenericImport<NWPathClass, NWPath>)
  end;

  PNWPath = Pointer;

  NETunnelProviderClass = interface(NEProviderClass)
    ['{6E007704-A8F5-4E25-A5E1-9EFE726B60CC}']
  end;

  NETunnelProvider = interface(NEProvider)
    ['{CD6678FC-F363-4B53-9A88-6EAA4E223A3C}']
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
    ['{16D5E83B-0945-4486-9151-F3D8AF291F92}']
  end;

  NEAppProxyProvider = interface(NETunnelProvider)
    ['{07A4C451-32C5-4EEB-A638-A4D4C927B787}']
    procedure startProxyWithOptions(options: Pointer;
      completionHandler: TNetworkExtensionCompletionHandler); cdecl;
    procedure stopProxyWithReason(reason: NEProviderStopReason;
      completionHandler: TNetworkExtensionCompletionHandler1); cdecl;
    procedure cancelProxyWithError(error: Pointer); cdecl;
    function handleNewFlow(flow: NEAppProxyFlow): Boolean; cdecl;
    function handleNewUDPFlow(flow: NEAppProxyUDPFlow;
      initialRemoteEndpoint: NWEndpoint): Boolean; cdecl;
  end;

  TNEAppProxyProvider = class(TOCGenericImport<NEAppProxyProviderClass,
    NEAppProxyProvider>)
  end;

  PNEAppProxyProvider = Pointer;

  NEVPNConnectionClass = interface(NSObjectClass)
    ['{675452BF-B966-4BDE-9C36-DCDFB99C95ED}']
  end;

  NEVPNConnection = interface(NSObject)
    ['{63EBC99A-DE4D-4079-84B4-67E597A878D7}']
    function startVPNTunnelAndReturnError(error: NSError): Boolean; cdecl;
    function startVPNTunnelWithOptions(options: NSDictionary;
      andReturnError: NSError): Boolean; cdecl;
    procedure stopVPNTunnel; cdecl;
    procedure fetchLastDisconnectErrorWithCompletionHandler
      (handler: TNetworkExtensionCompletionHandler4); cdecl;
    function status: NEVPNStatus; cdecl;
    function connectedDate: NSDate; cdecl;
    function manager: NEVPNManager; cdecl;
  end;

  TNEVPNConnection = class(TOCGenericImport<NEVPNConnectionClass,
    NEVPNConnection>)
  end;

  PNEVPNConnection = Pointer;

  NEOnDemandRuleClass = interface(NSObjectClass)
    ['{048261EB-EBDD-4875-85A2-82563B0BACB4}']
  end;

  NEOnDemandRule = interface(NSObject)
    ['{6B42C3A9-8D52-473B-9EF9-48A615FD295E}']
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
    ['{7BB8002E-7377-4BFD-AF95-1DCF814A55B2}']
    { class } procedure loadAllFromPreferencesWithCompletionHandler
      (completionHandler: TNetworkExtensionCompletionHandler2); cdecl;
    { class } function forPerAppVPN: Pointer { instancetype }; cdecl;
  end;

  NETunnelProviderManager = interface(NEVPNManager)
    ['{23D4D713-A43A-498A-823B-F25631930D34}']
    function copyAppRules: Pointer; cdecl;
    function routingMethod: NETunnelProviderRoutingMethod; cdecl;
  end;

  TNETunnelProviderManager = class
    (TOCGenericImport<NETunnelProviderManagerClass, NETunnelProviderManager>)
  end;

  PNETunnelProviderManager = Pointer;

  NEAppProxyProviderManagerClass = interface(NETunnelProviderManagerClass)
    ['{59A832D9-E0F5-4994-8513-2F44D1C6C4CD}']
    { class } procedure loadAllFromPreferencesWithCompletionHandler
      (completionHandler: TNetworkExtensionCompletionHandler2); cdecl;
  end;

  NEAppProxyProviderManager = interface(NETunnelProviderManager)
    ['{02008714-CB42-4A56-B2E5-496FAB03CF94}']
  end;

  TNEAppProxyProviderManager = class
    (TOCGenericImport<NEAppProxyProviderManagerClass,
    NEAppProxyProviderManager>)
  end;

  PNEAppProxyProviderManager = Pointer;

  NEAppPushProviderClass = interface(NEProviderClass)
    ['{936EAC99-EE95-42CB-B259-64FA8464FA8F}']
  end;

  NEAppPushProvider = interface(NEProvider)
    ['{5CBDC6DC-F040-40B0-961E-48D07EEDE3B4}']
    procedure startWithCompletionHandler(completionHandler
      : TNetworkExtensionCompletionHandler); cdecl;
    procedure start; cdecl;
    procedure stopWithReason(reason: NEProviderStopReason;
      completionHandler: TNetworkExtensionCompletionHandler1); cdecl;
    procedure reportIncomingCallWithUserInfo(userInfo: Pointer); cdecl;
    procedure reportPushToTalkMessageWithUserInfo(userInfo: Pointer); cdecl;
    procedure handleTimerEvent; cdecl;
  end;

  TNEAppPushProvider = class(TOCGenericImport<NEAppPushProviderClass,
    NEAppPushProvider>)
  end;

  PNEAppPushProvider = Pointer;

  NEDNSProxyProviderProtocolClass = interface(NEVPNProtocolClass)
    ['{F1C2E9D2-B944-4052-85B6-DE2C59E718F6}']
  end;

  NEDNSProxyProviderProtocol = interface(NEVPNProtocol)
    ['{D94F2533-2A40-496B-A3B0-9D79F51956DA}']
    procedure setProviderBundleIdentifier(providerBundleIdentifier
      : NSString); cdecl;
    function providerBundleIdentifier: NSString; cdecl;
  end;

  TNEDNSProxyProviderProtocol = class
    (TOCGenericImport<NEDNSProxyProviderProtocolClass,
    NEDNSProxyProviderProtocol>)
  end;

  PNEDNSProxyProviderProtocol = Pointer;

  NEDNSProxyProviderClass = interface(NEProviderClass)
    ['{D9A99097-03A3-4451-A3D7-0D81C5BB90D1}']
  end;

  NEDNSProxyProvider = interface(NEProvider)
    ['{CB057544-1263-43A0-9641-018389C0D5A2}']
    procedure startProxyWithOptions(options: Pointer;
      completionHandler: TNetworkExtensionCompletionHandler); cdecl;
    procedure stopProxyWithReason(reason: NEProviderStopReason;
      completionHandler: TNetworkExtensionCompletionHandler1); cdecl;
    procedure cancelProxyWithError(error: Pointer); cdecl;
    function handleNewFlow(flow: NEAppProxyFlow): Boolean; cdecl;
    function handleNewUDPFlow(flow: NEAppProxyUDPFlow;
      initialRemoteEndpoint: NWEndpoint): Boolean; cdecl;
  end;

  TNEDNSProxyProvider = class(TOCGenericImport<NEDNSProxyProviderClass,
    NEDNSProxyProvider>)
  end;

  PNEDNSProxyProvider = Pointer;

  NEDNSOverTLSSettingsClass = interface(NEDNSSettingsClass)
    ['{7BB7678C-0D7B-4587-83F0-93E878B4A01F}']
  end;

  NEDNSOverTLSSettings = interface(NEDNSSettings)
    ['{93AC662C-5D3A-4BCC-9866-4E361CEDEB28}']
    procedure setServerName(serverName: NSString); cdecl;
    function serverName: NSString; cdecl;
    procedure setIdentityReference(identityReference: PInteger); cdecl;
    function identityReference: PInteger; cdecl;
  end;

  TNEDNSOverTLSSettings = class(TOCGenericImport<NEDNSOverTLSSettingsClass,
    NEDNSOverTLSSettings>)
  end;

  PNEDNSOverTLSSettings = Pointer;

  NEDNSOverHTTPSSettingsClass = interface(NEDNSSettingsClass)
    ['{98E2CF54-EF6F-4767-89B0-68D64FB91EB2}']
  end;

  NEDNSOverHTTPSSettings = interface(NEDNSSettings)
    ['{EC910207-5C87-43C7-9986-5F431854F6BE}']
    procedure setServerURL(serverURL: PInteger); cdecl;
    function serverURL: PInteger; cdecl;
    procedure setIdentityReference(identityReference: PInteger); cdecl;
    function identityReference: PInteger; cdecl;
  end;

  TNEDNSOverHTTPSSettings = class(TOCGenericImport<NEDNSOverHTTPSSettingsClass,
    NEDNSOverHTTPSSettings>)
  end;

  PNEDNSOverHTTPSSettings = Pointer;

  NEIPv4SettingsClass = interface(NSObjectClass)
    ['{D47E1A4A-FC17-4238-BA5B-1D560AD56133}']
    { class } function settingsWithAutomaticAddressing
      : Pointer { instancetype }; cdecl;
  end;

  NEIPv4Settings = interface(NSObject)
    ['{295FC111-6F85-4E5C-92F9-A9A69402F757}']
    function initWithAddresses(addresses: NSArray; subnetMasks: NSArray)
      : Pointer { instancetype }; cdecl;
    function addresses: NSArray; cdecl;
    function subnetMasks: NSArray; cdecl;
    procedure setRouter(router: NSString); cdecl;
    function router: NSString; cdecl;
    procedure setIncludedRoutes(includedRoutes: NSArray); cdecl;
    function includedRoutes: NSArray; cdecl;
    procedure setExcludedRoutes(excludedRoutes: NSArray); cdecl;
    function excludedRoutes: NSArray; cdecl;
  end;

  TNEIPv4Settings = class(TOCGenericImport<NEIPv4SettingsClass, NEIPv4Settings>)
  end;

  PNEIPv4Settings = Pointer;

  NEIPv6SettingsClass = interface(NSObjectClass)
    ['{F5F5FEA3-B5D0-4E30-A441-F0AD9C64B2B4}']
    { class } function settingsWithAutomaticAddressing
      : Pointer { instancetype }; cdecl;
    { class } function settingsWithLinkLocalAddressing
      : Pointer { instancetype }; cdecl;
  end;

  NEIPv6Settings = interface(NSObject)
    ['{2125CE9D-197C-43E8-A39C-B59F734FD429}']
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

  NEPacketTunnelNetworkSettingsClass = interface(NETunnelNetworkSettingsClass)
    ['{8844C7E9-84B3-4D46-9228-BDED1817E00E}']
  end;

  NEPacketTunnelNetworkSettings = interface(NETunnelNetworkSettings)
    ['{7B99491C-4C37-42A6-9F9A-2ED0D9FCB425}']
    procedure setIPv4Settings(IPv4Settings: NEIPv4Settings); cdecl;
    function IPv4Settings: NEIPv4Settings; cdecl;
    procedure setIPv6Settings(IPv6Settings: NEIPv6Settings); cdecl;
    function IPv6Settings: NEIPv6Settings; cdecl;
    procedure setTunnelOverheadBytes(tunnelOverheadBytes: PInteger); cdecl;
    function tunnelOverheadBytes: PInteger; cdecl;
    procedure setMTU(MTU: PInteger); cdecl;
    function MTU: PInteger; cdecl;
  end;

  TNEPacketTunnelNetworkSettings = class
    (TOCGenericImport<NEPacketTunnelNetworkSettingsClass,
    NEPacketTunnelNetworkSettings>)
  end;

  PNEPacketTunnelNetworkSettings = Pointer;

  NEEthernetTunnelNetworkSettingsClass = interface
    (NEPacketTunnelNetworkSettingsClass)
    ['{3FA81E9D-A110-47FA-B3AD-B9BD6BD2C965}']
  end;

  NEEthernetTunnelNetworkSettings = interface(NEPacketTunnelNetworkSettings)
    ['{C5ABF0C0-FB9A-4D52-8613-B87CB1AEA5A5}']
    function initWithTunnelRemoteAddress(address: NSString;
      ethernetAddress: NSString; MTU: NSInteger)
      : Pointer { instancetype }; cdecl;
    function ethernetAddress: NSString; cdecl;
  end;

  TNEEthernetTunnelNetworkSettings = class
    (TOCGenericImport<NEEthernetTunnelNetworkSettingsClass,
    NEEthernetTunnelNetworkSettings>)
  end;

  PNEEthernetTunnelNetworkSettings = Pointer;

  NEPacketTunnelFlowClass = interface(NSObjectClass)
    ['{57CB73B7-424D-4B90-9B26-FE6C9FD4AC7A}']
  end;

  NEPacketTunnelFlow = interface(NSObject)
    ['{ACC8F23C-1AF6-499D-9170-9AFDC47C963E}']
    procedure readPacketsWithCompletionHandler(completionHandler
      : TNetworkExtensionCompletionHandler7); cdecl;
    function writePackets(packets: NSArray; withProtocols: NSArray)
      : Boolean; cdecl;
    procedure readPacketObjectsWithCompletionHandler(completionHandler
      : TNetworkExtensionCompletionHandler5); cdecl;
    function writePacketObjects(packets: NSArray): Boolean; cdecl;
  end;

  TNEPacketTunnelFlow = class(TOCGenericImport<NEPacketTunnelFlowClass,
    NEPacketTunnelFlow>)
  end;

  PNEPacketTunnelFlow = Pointer;

  NEPacketTunnelProviderClass = interface(NETunnelProviderClass)
    ['{B1A4109C-7A46-4838-9BE3-32E37480F7C6}']
  end;

  NEPacketTunnelProvider = interface(NETunnelProvider)
    ['{DFE3BFC1-24B5-4263-B45E-8859A27AEF65}']
    procedure startTunnelWithOptions(options: Pointer;
      completionHandler: TNetworkExtensionCompletionHandler); cdecl;
    procedure stopTunnelWithReason(reason: NEProviderStopReason;
      completionHandler: TNetworkExtensionCompletionHandler1); cdecl;
    procedure cancelTunnelWithError(error: Pointer); cdecl;
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

  NEEthernetTunnelProviderClass = interface(NEPacketTunnelProviderClass)
    ['{357FCB88-140C-4CA7-8E79-8C78CDFD055A}']
  end;

  NEEthernetTunnelProvider = interface(NEPacketTunnelProvider)
    ['{6934CDD6-06C4-4791-8290-24D304CD5962}']
  end;

  TNEEthernetTunnelProvider = class
    (TOCGenericImport<NEEthernetTunnelProviderClass, NEEthernetTunnelProvider>)
  end;

  PNEEthernetTunnelProvider = Pointer;

  NEFilterBrowserFlowClass = interface(NEFilterFlowClass)
    ['{AB0694D8-B373-4616-99C2-EAD7396EFA63}']
  end;

  NEFilterBrowserFlow = interface(NEFilterFlow)
    ['{BF1749EF-7341-4F01-9EBD-C865B1559723}']
    function request: PInteger; cdecl;
    function response: PInteger; cdecl;
    function parentURL: PInteger; cdecl;
  end;

  TNEFilterBrowserFlow = class(TOCGenericImport<NEFilterBrowserFlowClass,
    NEFilterBrowserFlow>)
  end;

  PNEFilterBrowserFlow = Pointer;

  NEFilterSocketFlowClass = interface(NEFilterFlowClass)
    ['{2BB88B41-F167-42BE-8E3D-1B30A654C48C}']
  end;

  NEFilterSocketFlow = interface(NEFilterFlow)
    ['{8A69FEF3-9883-4D8C-B80C-7A85D09CDB8D}']
    function remoteEndpoint: NWEndpoint; cdecl;
    function remoteHostname: NSString; cdecl;
    function localEndpoint: NWEndpoint; cdecl;
    function socketFamily: Integer; cdecl;
    function socketType: Integer; cdecl;
    function socketProtocol: Integer; cdecl;
  end;

  TNEFilterSocketFlow = class(TOCGenericImport<NEFilterSocketFlowClass,
    NEFilterSocketFlow>)
  end;

  PNEFilterSocketFlow = Pointer;

  NEFilterProviderClass = interface(NEProviderClass)
    ['{B75ED679-EC3F-4AFC-8AE7-98320C8454AC}']
  end;

  NEFilterProvider = interface(NEProvider)
    ['{58E00416-BAF8-4BD7-A708-C1B9CBE52BBA}']
    procedure startFilterWithCompletionHandler(completionHandler
      : TNetworkExtensionCompletionHandler); cdecl;
    procedure stopFilterWithReason(reason: NEProviderStopReason;
      completionHandler: TNetworkExtensionCompletionHandler1); cdecl;
    function filterConfiguration: NEFilterProviderConfiguration; cdecl;
    procedure handleReport(report: NEFilterReport); cdecl;
  end;

  TNEFilterProvider = class(TOCGenericImport<NEFilterProviderClass,
    NEFilterProvider>)
  end;

  PNEFilterProvider = Pointer;

  NEFilterNewFlowVerdictClass = interface(NEFilterVerdictClass)
    ['{E6441B4B-5671-4440-9247-7CF6D081A9C9}']
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
    { class } function pauseVerdict: NEFilterNewFlowVerdict; cdecl;
  end;

  NEFilterNewFlowVerdict = interface(NEFilterVerdict)
    ['{13F1C075-3CF6-4757-B6E6-294F278866CA}']
    procedure setStatisticsReportFrequency(statisticsReportFrequency
      : NEFilterReportFrequency); cdecl;
    function statisticsReportFrequency: NEFilterReportFrequency; cdecl;
  end;

  TNEFilterNewFlowVerdict = class(TOCGenericImport<NEFilterNewFlowVerdictClass,
    NEFilterNewFlowVerdict>)
  end;

  PNEFilterNewFlowVerdict = Pointer;

  NEFilterControlVerdictClass = interface(NEFilterNewFlowVerdictClass)
    ['{62F0CCDA-AFED-42D4-B89F-DB080B33A044}']
    { class } function allowVerdictWithUpdateRules(updateRules: Boolean)
      : NEFilterControlVerdict; cdecl;
    { class } function dropVerdictWithUpdateRules(updateRules: Boolean)
      : NEFilterControlVerdict; cdecl;
    { class } function updateRules: NEFilterControlVerdict; cdecl;
  end;

  NEFilterControlVerdict = interface(NEFilterNewFlowVerdict)
    ['{FA525F88-F159-40B4-BAB0-005D5AB084C3}']
  end;

  TNEFilterControlVerdict = class(TOCGenericImport<NEFilterControlVerdictClass,
    NEFilterControlVerdict>)
  end;

  PNEFilterControlVerdict = Pointer;

  NEFilterControlProviderClass = interface(NEFilterProviderClass)
    ['{20984787-487D-4707-833D-97D39194A291}']
  end;

  NEFilterControlProvider = interface(NEFilterProvider)
    ['{DA985B76-4418-4E64-AEC0-F5D994EC327D}']
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
    ['{71191A88-B057-41B3-9ED6-E8D1662DBB13}']
    { class } function allowVerdict: NEFilterDataVerdict; cdecl;
    { class } function dropVerdict: NEFilterDataVerdict; cdecl;
    { class } function remediateVerdictWithRemediationURLMapKey
      (remediationURLMapKey: NSString; remediationButtonTextMapKey: NSString)
      : NEFilterDataVerdict; cdecl;
    { class } function dataVerdictWithPassBytes(passBytes: NSUInteger;
      peekBytes: NSUInteger): NEFilterDataVerdict; cdecl;
    { class } function needRulesVerdict: NEFilterDataVerdict; cdecl;
    { class } function pauseVerdict: NEFilterDataVerdict; cdecl;
  end;

  NEFilterDataVerdict = interface(NEFilterVerdict)
    ['{4B99A7F8-B888-4CE4-B2C1-8B9D11529552}']
    procedure setStatisticsReportFrequency(statisticsReportFrequency
      : NEFilterReportFrequency); cdecl;
    function statisticsReportFrequency: NEFilterReportFrequency; cdecl;
  end;

  TNEFilterDataVerdict = class(TOCGenericImport<NEFilterDataVerdictClass,
    NEFilterDataVerdict>)
  end;

  PNEFilterDataVerdict = Pointer;

  NEFilterRemediationVerdictClass = interface(NEFilterVerdictClass)
    ['{0B925FC3-E6AB-47B6-B6BD-A3FCD117D068}']
    { class } function allowVerdict: NEFilterRemediationVerdict; cdecl;
    { class } function dropVerdict: NEFilterRemediationVerdict; cdecl;
    { class } function needRulesVerdict: NEFilterRemediationVerdict; cdecl;
  end;

  NEFilterRemediationVerdict = interface(NEFilterVerdict)
    ['{9C7142B8-1E61-46C6-BEAB-A2527C8F7AAE}']
  end;

  TNEFilterRemediationVerdict = class
    (TOCGenericImport<NEFilterRemediationVerdictClass,
    NEFilterRemediationVerdict>)
  end;

  PNEFilterRemediationVerdict = Pointer;

  NEFilterDataProviderClass = interface(NEFilterProviderClass)
    ['{287D1294-109F-4C4E-B894-F06B978F795D}']
  end;

  NEFilterDataProvider = interface(NEFilterProvider)
    ['{04723496-7A3E-4B13-BFB2-BC9C84282783}']
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
    procedure applySettings(settings: NEFilterSettings;
      completionHandler: TNetworkExtensionCompletionHandler); cdecl;
    procedure resumeFlow(flow: NEFilterFlow;
      withVerdict: NEFilterVerdict); cdecl;
    procedure updateFlow(flow: NEFilterSocketFlow;
      usingVerdict: NEFilterDataVerdict;
      forDirection: NETrafficDirection); cdecl;
  end;

  TNEFilterDataProvider = class(TOCGenericImport<NEFilterDataProviderClass,
    NEFilterDataProvider>)
  end;

  PNEFilterDataProvider = Pointer;

  NEPacketClass = interface(NSObjectClass)
    ['{12EDF76D-E60F-4C4E-9FEC-14586AF2F04B}']
  end;

  NEPacket = interface(NSObject)
    ['{C1312284-F7ED-4099-BFC8-ED2898FC2FFC}']
    function initWithData(data: NSData; protocolFamily: sa_family_t)
      : Pointer { instancetype }; cdecl;
    function data: NSData; cdecl;
    function protocolFamily: sa_family_t; cdecl;
    function direction: NETrafficDirection; cdecl;
    function metadata: NEFlowMetaData; cdecl;
  end;

  TNEPacket = class(TOCGenericImport<NEPacketClass, NEPacket>)
  end;

  PNEPacket = Pointer;

  NEFilterPacketProviderClass = interface(NEFilterProviderClass)
    ['{170D61EF-B627-4ECD-838C-5EBC6AC34333}']
  end;

  NEFilterPacketProvider = interface(NEFilterProvider)
    ['{AA288431-38EC-4A6B-A4BB-7B90A40318A8}']
    procedure setPacketHandler(packetHandler: NEFilterPacketHandler); cdecl;
    function packetHandler: NEFilterPacketHandler; cdecl;
    function delayCurrentPacket(context: NEFilterPacketContext)
      : NEPacket; cdecl;
    procedure allowPacket(packet: NEPacket); cdecl;
  end;

  TNEFilterPacketProvider = class(TOCGenericImport<NEFilterPacketProviderClass,
    NEFilterPacketProvider>)
  end;

  PNEFilterPacketProvider = Pointer;

  NEHotspotHS20SettingsClass = interface(NSObjectClass)
    ['{68C3CFF3-6731-4565-A318-530BA868C23D}']
  end;

  NEHotspotHS20Settings = interface(NSObject)
    ['{25BB4AF0-0BBF-489D-8310-47F513EF012E}']
    function domainName: NSString; cdecl;
    procedure setRoamingEnabled(roamingEnabled: Boolean); cdecl;
    function isRoamingEnabled: Boolean; cdecl;
    procedure setRoamingConsortiumOIs(roamingConsortiumOIs: NSArray); cdecl;
    function roamingConsortiumOIs: NSArray; cdecl;
    procedure setNaiRealmNames(naiRealmNames: NSArray); cdecl;
    function naiRealmNames: NSArray; cdecl;
    procedure setMCCAndMNCs(MCCAndMNCs: NSArray); cdecl;
    function MCCAndMNCs: NSArray; cdecl;
    function initWithDomainName(domainName: NSString; roamingEnabled: Boolean)
      : Pointer { instancetype }; cdecl;
  end;

  TNEHotspotHS20Settings = class(TOCGenericImport<NEHotspotHS20SettingsClass,
    NEHotspotHS20Settings>)
  end;

  PNEHotspotHS20Settings = Pointer;

  NEHotspotEAPSettingsClass = interface(NSObjectClass)
    ['{3EDFF88A-DF5D-4112-A68B-DC74AAA57A6B}']
  end;

  NEHotspotEAPSettings = interface(NSObject)
    ['{DE0BE2FE-5C79-42DF-8D91-80E76F1D371F}']
    procedure setSupportedEAPTypes(supportedEAPTypes: NSArray); cdecl;
    function supportedEAPTypes: NSArray; cdecl;
    procedure setUsername(username: NSString); cdecl;
    function username: NSString; cdecl;
    procedure setOuterIdentity(outerIdentity: NSString); cdecl;
    function outerIdentity: NSString; cdecl;
    procedure setTtlsInnerAuthenticationType(ttlsInnerAuthenticationType
      : NEHotspotConfigurationTTLSInnerAuthenticationType); cdecl;
    function ttlsInnerAuthenticationType
      : NEHotspotConfigurationTTLSInnerAuthenticationType; cdecl;
    procedure setPassword(password: NSString); cdecl;
    function password: NSString; cdecl;
    procedure setTrustedServerNames(trustedServerNames: NSArray); cdecl;
    function trustedServerNames: NSArray; cdecl;
    procedure setTlsClientCertificateRequired(tlsClientCertificateRequired
      : Boolean); cdecl;
    function isTLSClientCertificateRequired: Boolean; cdecl;
    procedure setPreferredTLSVersion(preferredTLSVersion
      : NEHotspotConfigurationEAPTLSVersion); cdecl;
    function preferredTLSVersion: NEHotspotConfigurationEAPTLSVersion; cdecl;
    function setIdentity(identity: SecIdentityRef): Boolean; cdecl;
    function setTrustedServerCertificates(certificates: NSArray)
      : Boolean; cdecl;
  end;

  TNEHotspotEAPSettings = class(TOCGenericImport<NEHotspotEAPSettingsClass,
    NEHotspotEAPSettings>)
  end;

  PNEHotspotEAPSettings = Pointer;

  NEHotspotConfigurationClass = interface(NSObjectClass)
    ['{3AA622FB-C3F5-445E-AC1A-CE0431D9D464}']
  end;

  NEHotspotConfiguration = interface(NSObject)
    ['{4259D990-19F9-448F-A71C-BE813475FBB2}']
    function SSID: NSString; cdecl;
    function SSIDPrefix: NSString; cdecl;
    procedure setJoinOnce(joinOnce: Boolean); cdecl;
    function joinOnce: Boolean; cdecl;
    procedure setLifeTimeInDays(lifeTimeInDays: NSNumber); cdecl;
    function lifeTimeInDays: NSNumber; cdecl;
    procedure setHidden(hidden: Boolean); cdecl;
    function hidden: Boolean; cdecl;
    [MethodName('initWithSSID:')]
    function initWithSSID(SSID: NSString): Pointer { instancetype }; cdecl;
    [MethodName('initWithSSID:passphrase:isWEP:')]
    function initWithSSIDPassphraseIsWEP(SSID: NSString; passphrase: NSString;
      isWEP: Boolean): Pointer { instancetype }; cdecl;
    [MethodName('initWithSSID:eapSettings:')]
    function initWithSSIDEapSettings(SSID: NSString;
      eapSettings: NEHotspotEAPSettings): Pointer { instancetype }; cdecl;
    function initWithHS20Settings(hs20Settings: NEHotspotHS20Settings;
      eapSettings: NEHotspotEAPSettings): Pointer { instancetype }; cdecl;
    [MethodName('initWithSSIDPrefix:')]
    function initWithSSIDPrefix(SSIDPrefix: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithSSIDPrefix:passphrase:isWEP:')]
    function initWithSSIDPrefixPassphraseIsWEP(SSIDPrefix: NSString;
      passphrase: NSString; isWEP: Boolean): Pointer { instancetype }; cdecl;
  end;

  TNEHotspotConfiguration = class(TOCGenericImport<NEHotspotConfigurationClass,
    NEHotspotConfiguration>)
  end;

  PNEHotspotConfiguration = Pointer;

  NEHotspotConfigurationManagerClass = interface(NSObjectClass)
    ['{647D30C2-845A-4F7B-BD20-3854FF7FD88D}']
  end;

  NEHotspotConfigurationManager = interface(NSObject)
    ['{38220617-CC23-4013-94B3-197E54E2F2E6}']
    procedure setSharedManager(sharedManager
      : NEHotspotConfigurationManager); cdecl;
    function sharedManager: NEHotspotConfigurationManager; cdecl;
    procedure applyConfiguration(configuration: NEHotspotConfiguration;
      completionHandler: TNetworkExtensionCompletionHandler4); cdecl;
    procedure removeConfigurationForSSID(SSID: NSString); cdecl;
    procedure removeConfigurationForHS20DomainName(domainName: NSString); cdecl;
    procedure getConfiguredSSIDsWithCompletionHandler(completionHandler
      : TNetworkExtensionCompletionHandler5); cdecl;
  end;

  TNEHotspotConfigurationManager = class
    (TOCGenericImport<NEHotspotConfigurationManagerClass,
    NEHotspotConfigurationManager>)
  end;

  PNEHotspotConfigurationManager = Pointer;

  NEHotspotNetworkClass = interface(NSObjectClass)
    ['{1A975598-1941-489F-B630-9CCD472C195D}']
    { class } procedure fetchCurrentWithCompletionHandler(completionHandler
      : TNetworkExtensionCompletionHandler6); cdecl;
  end;

  NEHotspotNetwork = interface(NSObject)
    ['{FBFD5E6D-5E34-4E25-B873-2A399CFDC2F9}']
    function SSID: NSString; cdecl;
    function BSSID: NSString; cdecl;
    function securityType: NEHotspotNetworkSecurityType; cdecl;
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
    ['{8A8F2DBF-D0FD-4B9C-8B4D-E8B912C9B56D}']
  end;

  NEHotspotHelperResponse = interface(NSObject)
    ['{5F5E9918-10B1-43EE-B6B0-A8E9AE502ACD}']
    procedure setNetwork(network: NEHotspotNetwork); cdecl;
    procedure setNetworkList(networkList: NSArray); cdecl;
    procedure deliver; cdecl;
  end;

  TNEHotspotHelperResponse = class
    (TOCGenericImport<NEHotspotHelperResponseClass, NEHotspotHelperResponse>)
  end;

  PNEHotspotHelperResponse = Pointer;

  NEHotspotHelperCommandClass = interface(NSObjectClass)
    ['{F1CF1824-DE90-4A3D-9021-60F1F8FCF09A}']
  end;

  NEHotspotHelperCommand = interface(NSObject)
    ['{9F711776-0C44-4970-B750-920A018471DF}']
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
    ['{D5757F15-1DEC-4D48-87BB-7527DB7F4B50}']
    { class } function registerWithOptions(options: NSDictionary;
      queue: dispatch_queue_t; handler: NEHotspotHelperHandler): Boolean; cdecl;
    { class } function logoff(network: NEHotspotNetwork): Boolean; cdecl;
    { class } function supportedNetworkInterfaces: NSArray; cdecl;
  end;

  NEHotspotHelper = interface(NSObject)
    ['{7CB9A0E4-677D-493E-8A16-28C43F8CE890}']
    procedure bindToHotspotHelperCommand
      (command: NEHotspotHelperCommand); cdecl;
  end;

  TNEHotspotHelper = class(TOCGenericImport<NEHotspotHelperClass,
    NEHotspotHelper>)
  end;

  PNEHotspotHelper = Pointer;

  NEIPv4RouteClass = interface(NSObjectClass)
    ['{16F4700D-C3C1-4B4D-A936-0E17CB97B3B9}']
    { class } function defaultRoute: NEIPv4Route; cdecl;
  end;

  NEIPv4Route = interface(NSObject)
    ['{4FCED326-8E0A-485A-B48D-9CFA83581175}']
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

  NEIPv6RouteClass = interface(NSObjectClass)
    ['{2ACA3065-524A-4DD9-8C08-D265A91A8FA9}']
    { class } function defaultRoute: NEIPv6Route; cdecl;
  end;

  NEIPv6Route = interface(NSObject)
    ['{784DAF8C-0204-4479-8135-948B9E6469F7}']
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

  NEEvaluateConnectionRuleClass = interface(NSObjectClass)
    ['{B558C4A0-E7C6-419F-82DF-EC09A789A214}']
  end;

  NEEvaluateConnectionRule = interface(NSObject)
    ['{DFB63194-DAF8-4A33-BB10-15EE8DAF0AEA}']
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
    ['{51E8E879-DABB-49A4-B56D-BFC59A608D8A}']
  end;

  NEOnDemandRuleConnect = interface(NEOnDemandRule)
    ['{602BFB62-2EFE-4154-9F57-4244A357FE69}']
  end;

  TNEOnDemandRuleConnect = class(TOCGenericImport<NEOnDemandRuleConnectClass,
    NEOnDemandRuleConnect>)
  end;

  PNEOnDemandRuleConnect = Pointer;

  NEOnDemandRuleDisconnectClass = interface(NEOnDemandRuleClass)
    ['{A0B2E1D5-CF58-4BA4-B00B-935ACCA0125A}']
  end;

  NEOnDemandRuleDisconnect = interface(NEOnDemandRule)
    ['{73115335-396B-4DEF-B0E4-505BF9D87702}']
  end;

  TNEOnDemandRuleDisconnect = class
    (TOCGenericImport<NEOnDemandRuleDisconnectClass, NEOnDemandRuleDisconnect>)
  end;

  PNEOnDemandRuleDisconnect = Pointer;

  NEOnDemandRuleIgnoreClass = interface(NEOnDemandRuleClass)
    ['{08F0506E-6878-4D49-B773-6A539D7DF6C7}']
  end;

  NEOnDemandRuleIgnore = interface(NEOnDemandRule)
    ['{820E7D4E-904E-46C6-85E2-2FEEDB08657E}']
  end;

  TNEOnDemandRuleIgnore = class(TOCGenericImport<NEOnDemandRuleIgnoreClass,
    NEOnDemandRuleIgnore>)
  end;

  PNEOnDemandRuleIgnore = Pointer;

  NEOnDemandRuleEvaluateConnectionClass = interface(NEOnDemandRuleClass)
    ['{AA1A9107-D147-4623-948F-9D7F051F8B66}']
  end;

  NEOnDemandRuleEvaluateConnection = interface(NEOnDemandRule)
    ['{4795AB3B-51B6-4514-9D35-75A76C572E17}']
    procedure setConnectionRules(connectionRules: NSArray); cdecl;
    function connectionRules: NSArray; cdecl;
  end;

  TNEOnDemandRuleEvaluateConnection = class
    (TOCGenericImport<NEOnDemandRuleEvaluateConnectionClass,
    NEOnDemandRuleEvaluateConnection>)
  end;

  PNEOnDemandRuleEvaluateConnection = Pointer;

  NETransparentProxyManagerClass = interface(NEVPNManagerClass)
    ['{01DCE2FF-45A3-4989-8F50-B5E9AFD0F947}']
    { class } procedure loadAllFromPreferencesWithCompletionHandler
      (completionHandler: TNetworkExtensionCompletionHandler8); cdecl;
  end;

  NETransparentProxyManager = interface(NEVPNManager)
    ['{9A799E29-7D3A-4209-B815-B870F0264CAD}']
  end;

  TNETransparentProxyManager = class
    (TOCGenericImport<NETransparentProxyManagerClass,
    NETransparentProxyManager>)
  end;

  PNETransparentProxyManager = Pointer;

  NETransparentProxyNetworkSettingsClass = interface
    (NETunnelNetworkSettingsClass)
    ['{C999ECEA-9226-4AEC-96F5-7055EA270BF7}']
  end;

  NETransparentProxyNetworkSettings = interface(NETunnelNetworkSettings)
    ['{9781ABBF-FE97-467E-938A-80165DF7D3A8}']
    procedure setIncludedNetworkRules(includedNetworkRules: NSArray); cdecl;
    function includedNetworkRules: NSArray; cdecl;
    procedure setExcludedNetworkRules(excludedNetworkRules: NSArray); cdecl;
    function excludedNetworkRules: NSArray; cdecl;
  end;

  TNETransparentProxyNetworkSettings = class
    (TOCGenericImport<NETransparentProxyNetworkSettingsClass,
    NETransparentProxyNetworkSettings>)
  end;

  PNETransparentProxyNetworkSettings = Pointer;

  NETransparentProxyProviderClass = interface(NEAppProxyProviderClass)
    ['{8E8980F6-5EEC-42EF-8879-360A2BF1877B}']
  end;

  NETransparentProxyProvider = interface(NEAppProxyProvider)
    ['{2BF1A793-2C33-4378-8460-29A41E5A994C}']
  end;

  TNETransparentProxyProvider = class
    (TOCGenericImport<NETransparentProxyProviderClass,
    NETransparentProxyProvider>)
  end;

  PNETransparentProxyProvider = Pointer;

  NETunnelProviderProtocolClass = interface(NEVPNProtocolClass)
    ['{75C56BE1-A06A-4408-804D-1498951C24C8}']
  end;

  NETunnelProviderProtocol = interface(NEVPNProtocol)
    ['{83CB88AA-81B9-4987-88F1-B659A56DDEAC}']
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
    ['{18F5F73D-93E5-4B5E-8C31-633F358D896F}']
  end;

  NETunnelProviderSession = interface(NEVPNConnection)
    ['{369A8368-794E-4749-9BBB-3D775967923F}']
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
    ['{CACB1B4D-B0CD-4764-A730-E55B77D1CBDF}']
  end;

  NEVPNProtocolIPSec = interface(NEVPNProtocol)
    ['{4887F73A-7E58-4337-B2AC-15FAC0A3D441}']
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
    ['{BAFCF1BB-151B-4A9B-8C74-BFDCF458E40D}']
  end;

  NEVPNIKEv2SecurityAssociationParameters = interface(NSObject)
    ['{00B43A1D-9858-45F0-9B31-9956B93B157D}']
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
    ['{69317D46-8396-4851-9867-1873DF81E246}']
  end;

  NEVPNProtocolIKEv2 = interface(NEVPNProtocolIPSec)
    ['{85EC0442-81FA-4F8A-818A-87D1A2D19FAE}']
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
    procedure setMinimumTLSVersion(minimumTLSVersion
      : NEVPNIKEv2TLSVersion); cdecl;
    function minimumTLSVersion: NEVPNIKEv2TLSVersion; cdecl;
    procedure setMaximumTLSVersion(maximumTLSVersion
      : NEVPNIKEv2TLSVersion); cdecl;
    function maximumTLSVersion: NEVPNIKEv2TLSVersion; cdecl;
    procedure setEnableFallback(enableFallback: Boolean); cdecl;
    function enableFallback: Boolean; cdecl;
    procedure setMTU(MTU: NSUInteger); cdecl;
    function MTU: NSUInteger; cdecl;
  end;

  TNEVPNProtocolIKEv2 = class(TOCGenericImport<NEVPNProtocolIKEv2Class,
    NEVPNProtocolIKEv2>)
  end;

  PNEVPNProtocolIKEv2 = Pointer;

  NWBonjourServiceEndpointClass = interface(NWEndpointClass)
    ['{F7AE4765-2163-421A-A1CC-E2C66C36E2D2}']
    { class } function endpointWithName(name: NSString; &type: NSString;
      domain: NSString): Pointer { instancetype }; cdecl;
  end;

  NWBonjourServiceEndpoint = interface(NWEndpoint)
    ['{DBF5F1A5-2C79-45A9-89CE-10FFEAF37E0D}']
    function name: NSString; cdecl;
    function &type: NSString; cdecl;
    function domain: NSString; cdecl;
  end;

  TNWBonjourServiceEndpoint = class
    (TOCGenericImport<NWBonjourServiceEndpointClass, NWBonjourServiceEndpoint>)
  end;

  PNWBonjourServiceEndpoint = Pointer;

  // ===== Protocol declarations =====

  NEAppPushDelegate = interface(IObjectiveC)
    ['{7C6BF9D5-C796-413D-A607-581823D9DB1E}']
    procedure appPushManager(manager: NEAppPushManager;
      didReceiveIncomingCallWithUserInfo: Pointer); cdecl;
  end;

  NWTCPConnectionAuthenticationDelegate = interface(IObjectiveC)
    ['{E18C2A18-D12A-4819-872D-8D3D3AEB4F64}']
    function shouldProvideIdentityForConnection(connection: NWTCPConnection)
      : Boolean; cdecl;
    procedure provideIdentityForConnection(connection: NWTCPConnection;
      completionHandler: TNetworkExtensionCompletionHandler10); cdecl;
    function shouldEvaluateTrustForConnection(connection: NWTCPConnection)
      : Boolean; cdecl;
    procedure evaluateTrustForConnection(connection: NWTCPConnection;
      peerCertificateChain: NSArray;
      completionHandler: TNetworkExtensionCompletionHandler11); cdecl;
  end;

  // ===== Exported string consts =====

function NEAppProxyErrorDomain: Pointer;
function NETunnelProviderErrorDomain: NSString;
function NEVPNErrorDomain: NSString;
function NEVPNConfigurationChangeNotification: NSString;
function NEDNSProxyErrorDomain: NSString;
function NEDNSProxyConfigurationDidChangeNotification: NSString;
function NEDNSSettingsErrorDomain: NSString;
function NEDNSSettingsConfigurationDidChangeNotification: NSString;
function NEFilterProviderRemediationMapRemediationURLs: NSString;
function NEFilterProviderRemediationMapRemediationButtonTexts: NSString;
function NEFilterErrorDomain: NSString;
function NEFilterConfigurationDidChangeNotification: NSString;
function NEHotspotConfigurationErrorDomain: NSString;
function kNEHotspotHelperOptionDisplayName: NSString;
function NEVPNStatusDidChangeNotification: NSString;
function NEVPNConnectionStartOptionUsername: NSString;
function NEVPNConnectionStartOptionPassword: NSString;
function NEVPNConnectionErrorDomain: NSString;


// ===== External functions =====

const
  libNetworkExtension =
    '/System/Library/Frameworks/NetworkExtension.framework/NetworkExtension';
function NS_ENUM(NSInteger: Integer; NEAppProxyFlowError: Integer): Integer;
  cdecl; external libNetworkExtension name _PU + 'NS_ENUM';
function API_AVAILABLE(macos: function(): Integer; cdecl;
  ios: function(): Integer; cdecl): Integer; cdecl;
  external libNetworkExtension name _PU + 'API_AVAILABLE';
function CF_SWIFT_NAME(param1: Integer): NSInteger; cdecl;
  external libNetworkExtension name _PU + 'CF_SWIFT_NAME';

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

function NEDNSProxyErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension, 'NEDNSProxyErrorDomain');
end;

function NEDNSProxyConfigurationDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension,
    'NEDNSProxyConfigurationDidChangeNotification');
end;

function NEDNSSettingsErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension, 'NEDNSSettingsErrorDomain');
end;

function NEDNSSettingsConfigurationDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension,
    'NEDNSSettingsConfigurationDidChangeNotification');
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

function NEHotspotConfigurationErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension,
    'NEHotspotConfigurationErrorDomain');
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

function NEVPNConnectionErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libNetworkExtension,
    'NEVPNConnectionErrorDomain');
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
