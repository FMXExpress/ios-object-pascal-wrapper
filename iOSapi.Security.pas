{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework Security
//

unit iOSapi.Security;

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
  errSecSuccess = 0;
  errSecUnimplemented = -4;
  errSecIO = -36;
  errSecOpWr = -49;
  errSecParam = -50;
  errSecAllocate = -108;
  errSecUserCanceled = -128;
  errSecBadReq = -909;
  errSecInternalComponent = -2070;
  errSecNotAvailable = -25291;
  errSecDuplicateItem = -25299;
  errSecItemNotFound = -25300;
  errSecInteractionNotAllowed = -25308;
  errSecDecode = -26275;
  errSecAuthFailed = -25293;
  kSecAccessControlUserPresence = 1 shl 0;
  kSecAccessControlTouchIDAny = 1 shl 1;
  kSecAccessControlTouchIDCurrentSet = 1 shl 3;
  kSecAccessControlDevicePasscode = 1 shl 4;
  kSecAccessControlOr = 1 shl 14;
  kSecAccessControlAnd = 1 shl 15;
  kSecAccessControlPrivateKeyUsage = 1 shl 30;
  kSecAccessControlApplicationPassword = 1 shl 31;
  kSecPaddingNone = 0;
  kSecPaddingPKCS1 = 1;
  kSecPaddingOAEP = 2;
  kSecPaddingSigRaw = 16384;
  kSecPaddingPKCS1MD2 = 32768;
  kSecPaddingPKCS1MD5 = 32769;
  kSecPaddingPKCS1SHA1 = 32770;
  kSecPaddingPKCS1SHA224 = 32771;
  kSecPaddingPKCS1SHA256 = 32772;
  kSecPaddingPKCS1SHA384 = 32773;
  kSecPaddingPKCS1SHA512 = 32774;
  kSecRevocationOCSPMethod = (1 shl 0);
  kSecRevocationCRLMethod = (1 shl 1);
  kSecRevocationPreferCRL = (1 shl 2);
  kSecRevocationRequirePositiveResponse = (1 shl 3);
  kSecRevocationNetworkAccessDisabled = (1 shl 4);
  kSecRevocationUseAnyAvailableMethod = (kSecRevocationOCSPMethod or
    kSecRevocationCRLMethod);
  kSecTrustResultInvalid = 0;
  kSecTrustResultProceed = 1;
  kSecTrustResultConfirm = 2;
  kSecTrustResultDeny = 3;
  kSecTrustResultUnspecified = 4;
  kSecTrustResultRecoverableTrustFailure = 5;
  kSecTrustResultFatalTrustFailure = 6;
  kSecTrustResultOtherError = 7;
  kSSLProtocolUnknown = 0;
  kSSLProtocol3 = 2;
  kTLSProtocol1 = 4;
  kTLSProtocol11 = 7;
  kTLSProtocol12 = 8;
  kDTLSProtocol1 = 9;
  kSSLProtocol2 = 1;
  kSSLProtocol3Only = 3;
  kTLSProtocol1Only = 5;
  kSSLProtocolAll = 6;
  kSSLSessionOptionBreakOnServerAuth = 0;
  kSSLSessionOptionBreakOnCertRequested = 1;
  kSSLSessionOptionBreakOnClientAuth = 2;
  kSSLSessionOptionFalseStart = 3;
  kSSLSessionOptionSendOneByteRecord = 4;
  kSSLSessionOptionAllowServerIdentityChange = 5;
  kSSLSessionOptionFallback = 6;
  kSSLSessionOptionBreakOnClientHello = 7;
  kSSLIdle = 0;
  kSSLHandshake = 1;
  kSSLConnected = 2;
  kSSLClosed = 3;
  kSSLAborted = 4;
  kSSLClientCertNone = 0;
  kSSLClientCertRequested = 1;
  kSSLClientCertSent = 2;
  kSSLClientCertRejected = 3;
  errSSLProtocol = -9800;
  errSSLNegotiation = -9801;
  errSSLFatalAlert = -9802;
  errSSLWouldBlock = -9803;
  errSSLSessionNotFound = -9804;
  errSSLClosedGraceful = -9805;
  errSSLClosedAbort = -9806;
  errSSLXCertChainInvalid = -9807;
  errSSLBadCert = -9808;
  errSSLCrypto = -9809;
  errSSLInternal = -9810;
  errSSLModuleAttach = -9811;
  errSSLUnknownRootCert = -9812;
  errSSLNoRootCert = -9813;
  errSSLCertExpired = -9814;
  errSSLCertNotYetValid = -9815;
  errSSLClosedNoNotify = -9816;
  errSSLBufferOverflow = -9817;
  errSSLBadCipherSuite = -9818;
  errSSLPeerUnexpectedMsg = -9819;
  errSSLPeerBadRecordMac = -9820;
  errSSLPeerDecryptionFail = -9821;
  errSSLPeerRecordOverflow = -9822;
  errSSLPeerDecompressFail = -9823;
  errSSLPeerHandshakeFail = -9824;
  errSSLPeerBadCert = -9825;
  errSSLPeerUnsupportedCert = -9826;
  errSSLPeerCertRevoked = -9827;
  errSSLPeerCertExpired = -9828;
  errSSLPeerCertUnknown = -9829;
  errSSLIllegalParam = -9830;
  errSSLPeerUnknownCA = -9831;
  errSSLPeerAccessDenied = -9832;
  errSSLPeerDecodeError = -9833;
  errSSLPeerDecryptError = -9834;
  errSSLPeerExportRestriction = -9835;
  errSSLPeerProtocolVersion = -9836;
  errSSLPeerInsufficientSecurity = -9837;
  errSSLPeerInternalError = -9838;
  errSSLPeerUserCancelled = -9839;
  errSSLPeerNoRenegotiation = -9840;
  errSSLPeerAuthCompleted = -9841;
  errSSLClientCertRequested = -9842;
  errSSLHostNameMismatch = -9843;
  errSSLConnectionRefused = -9844;
  errSSLDecryptionFail = -9845;
  errSSLBadRecordMac = -9846;
  errSSLRecordOverflow = -9847;
  errSSLBadConfiguration = -9848;
  errSSLUnexpectedRecord = -9849;
  errSSLWeakPeerEphemeralDHKey = -9850;
  errSSLClientHelloReceived = -9851;
  kSSLServerSide = 0;
  kSSLClientSide = 1;
  kSSLStreamType = 0;
  kSSLDatagramType = 1;
  kSSLSessionStrengthPolicyDefault = 0;
  kSSLSessionStrengthPolicyATSv1 = 1;
  kSSLSessionStrengthPolicyATSv1_noPFS = 2;
  kNeverAuthenticate = 0;
  kAlwaysAuthenticate = 1;
  kTryAuthenticate = 2;

type
  // ===== Framework typedefs =====
{$M+}
  SSLCipherSuite = Word;
  SecCertificateRef = Pointer;
  SecIdentityRef = Pointer;
  SecKeyRef = Pointer;
  SecPolicyRef = Pointer;
  SecAccessControlRef = Pointer;
  CFTypeID = LongWord;
  CFIndex = LongInt;
  SecAccessControlCreateFlags = CFIndex;
  CFAllocatorRef = Pointer;
  CFTypeRef = Pointer;
  CFDataRef = Pointer;
  CFStringRef = Pointer;
  OSStatus = Int32;
  CFDictionaryRef = Pointer;
  SecPadding = LongWord;
  __darwin_size_t = LongWord;
  Boolean = Byte;
  CFOptionFlags = LongWord;
  SecRandomRef = Pointer;
  CFErrorRef = Pointer;
  TSecurityCompletionHandler = procedure(param1: CFErrorRef) of object;
  CFArrayRef = Pointer;
  TSecurityCompletionHandler1 = procedure(param1: CFArrayRef;
    param2: CFErrorRef) of object;
  SecTrustResultType = LongWord;
  SecTrustRef = Pointer;
  SecTrustCallback = procedure(param1: SecTrustRef; param2: SecTrustResultType)
    of object;
  CFDateRef = Pointer;
  CFTimeInterval = Double;
  CFAbsoluteTime = CFTimeInterval;
  dispatch_queue_t = Pointer;
  SSLContextRef = Pointer;
  SSLConnectionRef = Pointer;
  SSLProtocol = Integer;
  SSLSessionOption = Integer;
  SSLSessionState = Integer;
  SSLClientCertificateState = Integer;
  SSLReadFunc = function(param1: SSLConnectionRef; param2: Pointer;
    param3: PLongWord): OSStatus; cdecl;
  SSLWriteFunc = function(param1: SSLConnectionRef; param2: Pointer;
    param3: PLongWord): OSStatus; cdecl;
  SSLProtocolSide = Integer;
  SSLConnectionType = Integer;
  SSLSessionStrengthPolicy = Integer;
  SSLAuthenticate = Integer;
  // ===== Exported string consts =====

function kSecImportExportPassphrase: Pointer;
function kSecImportItemLabel: Pointer;
function kSecImportItemKeyID: Pointer;
function kSecImportItemTrust: Pointer;
function kSecImportItemCertChain: Pointer;
function kSecImportItemIdentity: Pointer;
function kSecClass: Pointer;
function kSecClassGenericPassword: Pointer;
function kSecClassInternetPassword: Pointer;
function kSecClassCertificate: Pointer;
function kSecClassKey: Pointer;
function kSecClassIdentity: Pointer;
function kSecAttrAccessible: Pointer;
function kSecAttrAccessControl: Pointer;
function kSecAttrAccessGroup: Pointer;
function kSecAttrSynchronizable: Pointer;
function kSecAttrCreationDate: Pointer;
function kSecAttrModificationDate: Pointer;
function kSecAttrDescription: Pointer;
function kSecAttrComment: Pointer;
function kSecAttrCreator: Pointer;
function kSecAttrType: Pointer;
function kSecAttrLabel: Pointer;
function kSecAttrIsInvisible: Pointer;
function kSecAttrIsNegative: Pointer;
function kSecAttrAccount: Pointer;
function kSecAttrService: Pointer;
function kSecAttrGeneric: Pointer;
function kSecAttrSecurityDomain: Pointer;
function kSecAttrServer: Pointer;
function kSecAttrProtocol: Pointer;
function kSecAttrAuthenticationType: Pointer;
function kSecAttrPort: Pointer;
function kSecAttrPath: Pointer;
function kSecAttrSubject: Pointer;
function kSecAttrIssuer: Pointer;
function kSecAttrSerialNumber: Pointer;
function kSecAttrSubjectKeyID: Pointer;
function kSecAttrPublicKeyHash: Pointer;
function kSecAttrCertificateType: Pointer;
function kSecAttrCertificateEncoding: Pointer;
function kSecAttrKeyClass: Pointer;
function kSecAttrApplicationLabel: Pointer;
function kSecAttrIsPermanent: Pointer;
function kSecAttrApplicationTag: Pointer;
function kSecAttrKeyType: Pointer;
function kSecAttrKeySizeInBits: Pointer;
function kSecAttrEffectiveKeySize: Pointer;
function kSecAttrCanEncrypt: Pointer;
function kSecAttrCanDecrypt: Pointer;
function kSecAttrCanDerive: Pointer;
function kSecAttrCanSign: Pointer;
function kSecAttrCanVerify: Pointer;
function kSecAttrCanWrap: Pointer;
function kSecAttrCanUnwrap: Pointer;
function kSecAttrSyncViewHint: Pointer;
function kSecAttrTokenID: Pointer;
function kSecAttrAccessibleWhenUnlocked: Pointer;
function kSecAttrAccessibleAfterFirstUnlock: Pointer;
function kSecAttrAccessibleAlways: Pointer;
function kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly: Pointer;
function kSecAttrAccessibleWhenUnlockedThisDeviceOnly: Pointer;
function kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly: Pointer;
function kSecAttrAccessibleAlwaysThisDeviceOnly: Pointer;
function kSecAttrProtocolFTP: Pointer;
function kSecAttrProtocolFTPAccount: Pointer;
function kSecAttrProtocolHTTP: Pointer;
function kSecAttrProtocolIRC: Pointer;
function kSecAttrProtocolNNTP: Pointer;
function kSecAttrProtocolPOP3: Pointer;
function kSecAttrProtocolSMTP: Pointer;
function kSecAttrProtocolSOCKS: Pointer;
function kSecAttrProtocolIMAP: Pointer;
function kSecAttrProtocolLDAP: Pointer;
function kSecAttrProtocolAppleTalk: Pointer;
function kSecAttrProtocolAFP: Pointer;
function kSecAttrProtocolTelnet: Pointer;
function kSecAttrProtocolSSH: Pointer;
function kSecAttrProtocolFTPS: Pointer;
function kSecAttrProtocolHTTPS: Pointer;
function kSecAttrProtocolHTTPProxy: Pointer;
function kSecAttrProtocolHTTPSProxy: Pointer;
function kSecAttrProtocolFTPProxy: Pointer;
function kSecAttrProtocolSMB: Pointer;
function kSecAttrProtocolRTSP: Pointer;
function kSecAttrProtocolRTSPProxy: Pointer;
function kSecAttrProtocolDAAP: Pointer;
function kSecAttrProtocolEPPC: Pointer;
function kSecAttrProtocolIPP: Pointer;
function kSecAttrProtocolNNTPS: Pointer;
function kSecAttrProtocolLDAPS: Pointer;
function kSecAttrProtocolTelnetS: Pointer;
function kSecAttrProtocolIMAPS: Pointer;
function kSecAttrProtocolIRCS: Pointer;
function kSecAttrProtocolPOP3S: Pointer;
function kSecAttrAuthenticationTypeNTLM: Pointer;
function kSecAttrAuthenticationTypeMSN: Pointer;
function kSecAttrAuthenticationTypeDPA: Pointer;
function kSecAttrAuthenticationTypeRPA: Pointer;
function kSecAttrAuthenticationTypeHTTPBasic: Pointer;
function kSecAttrAuthenticationTypeHTTPDigest: Pointer;
function kSecAttrAuthenticationTypeHTMLForm: Pointer;
function kSecAttrAuthenticationTypeDefault: Pointer;
function kSecAttrKeyClassPublic: Pointer;
function kSecAttrKeyClassPrivate: Pointer;
function kSecAttrKeyClassSymmetric: Pointer;
function kSecAttrKeyTypeRSA: Pointer;
function kSecAttrKeyTypeEC: Pointer;
function kSecAttrSynchronizableAny: Pointer;
function kSecMatchPolicy: Pointer;
function kSecMatchItemList: Pointer;
function kSecMatchSearchList: Pointer;
function kSecMatchIssuers: Pointer;
function kSecMatchEmailAddressIfPresent: Pointer;
function kSecMatchSubjectContains: Pointer;
function kSecMatchCaseInsensitive: Pointer;
function kSecMatchTrustedOnly: Pointer;
function kSecMatchValidOnDate: Pointer;
function kSecMatchLimit: Pointer;
function kSecMatchLimitOne: Pointer;
function kSecMatchLimitAll: Pointer;
function kSecReturnData: Pointer;
function kSecReturnAttributes: Pointer;
function kSecReturnRef: Pointer;
function kSecReturnPersistentRef: Pointer;
function kSecValueData: Pointer;
function kSecValueRef: Pointer;
function kSecValuePersistentRef: Pointer;
function kSecUseItemList: Pointer;
function kSecUseOperationPrompt: Pointer;
function kSecUseNoAuthenticationUI: Pointer;
function kSecUseAuthenticationUI: Pointer;
function kSecUseAuthenticationContext: Pointer;
function kSecUseAuthenticationUIAllow: Pointer;
function kSecUseAuthenticationUIFail: Pointer;
function kSecUseAuthenticationUISkip: Pointer;
function kSecAttrTokenIDSecureEnclave: Pointer;
function kSecPrivateKeyAttrs: Pointer;
function kSecPublicKeyAttrs: Pointer;
function kSecPolicyAppleX509Basic: Pointer;
function kSecPolicyAppleSSL: Pointer;
function kSecPolicyAppleSMIME: Pointer;
function kSecPolicyAppleEAP: Pointer;
function kSecPolicyAppleIPsec: Pointer;
function kSecPolicyApplePKINITClient: Pointer;
function kSecPolicyApplePKINITServer: Pointer;
function kSecPolicyAppleCodeSigning: Pointer;
function kSecPolicyMacAppStoreReceipt: Pointer;
function kSecPolicyAppleIDValidation: Pointer;
function kSecPolicyAppleTimeStamping: Pointer;
function kSecPolicyAppleRevocation: Pointer;
function kSecPolicyApplePayIssuerEncryption: Pointer;
function kSecPolicyOid: Pointer;
function kSecPolicyName: Pointer;
function kSecPolicyClient: Pointer;
function kSecPolicyRevocationFlags: Pointer;
function kSecRandomDefault: Pointer;
function kSecSharedPassword: Pointer;
function kSecPropertyTypeTitle: Pointer;
function kSecPropertyTypeError: Pointer;
function kSecTrustEvaluationDate: Pointer;
function kSecTrustExtendedValidation: Pointer;
function kSecTrustOrganizationName: Pointer;
function kSecTrustResultValue: Pointer;
function kSecTrustRevocationChecked: Pointer;
function kSecTrustRevocationValidUntilDate: Pointer;
function kSecTrustCertificateTransparency: Pointer;


// ===== External functions =====

const
  libSecurity = '/System/Library/Frameworks/Security.framework/Security';
function CF_ENUM(param1: SSLCipherSuite): Integer; cdecl;
  external libSecurity name _PU + 'CF_ENUM';
function SecAccessControlGetTypeID: CFTypeID; cdecl;
  external libSecurity name _PU + 'SecAccessControlGetTypeID';
function SecAccessControlCreateWithFlags(allocator: CFAllocatorRef;
  protection: CFTypeRef; flags: SecAccessControlCreateFlags; error: Pointer)
  : SecAccessControlRef; cdecl;
  external libSecurity name _PU + 'SecAccessControlCreateWithFlags';
function SecCertificateGetTypeID: CFTypeID; cdecl;
  external libSecurity name _PU + 'SecCertificateGetTypeID';
function SecCertificateCreateWithData(allocator: CFAllocatorRef;
  data: CFDataRef): SecCertificateRef; cdecl;
  external libSecurity name _PU + 'SecCertificateCreateWithData';
function SecCertificateCopyData(certificate: SecCertificateRef): CFDataRef;
  cdecl; external libSecurity name _PU + 'SecCertificateCopyData';
function SecCertificateCopySubjectSummary(certificate: SecCertificateRef)
  : CFStringRef; cdecl; external libSecurity name _PU +
  'SecCertificateCopySubjectSummary';
function SecIdentityGetTypeID: CFTypeID; cdecl;
  external libSecurity name _PU + 'SecIdentityGetTypeID';
function SecIdentityCopyCertificate(identityRef: SecIdentityRef;
  certificateRef: Pointer): OSStatus; cdecl;
  external libSecurity name _PU + 'SecIdentityCopyCertificate';
function SecIdentityCopyPrivateKey(identityRef: SecIdentityRef;
  privateKeyRef: Pointer): OSStatus; cdecl;
  external libSecurity name _PU + 'SecIdentityCopyPrivateKey';
function SecPKCS12Import(pkcs12_data: CFDataRef; options: CFDictionaryRef;
  items: Pointer): OSStatus; cdecl;
  external libSecurity name _PU + 'SecPKCS12Import';
function SecItemCopyMatching(query: CFDictionaryRef; result: Pointer): OSStatus;
  cdecl; external libSecurity name _PU + 'SecItemCopyMatching';
function SecItemAdd(attributes: CFDictionaryRef; result: Pointer): OSStatus;
  cdecl; external libSecurity name _PU + 'SecItemAdd';
function SecItemUpdate(query: CFDictionaryRef;
  attributesToUpdate: CFDictionaryRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SecItemUpdate';
function SecItemDelete(query: CFDictionaryRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SecItemDelete';
function SecKeyGetTypeID: CFTypeID; cdecl;
  external libSecurity name _PU + 'SecKeyGetTypeID';
function SecKeyGeneratePair(parameters: CFDictionaryRef; publicKey: Pointer;
  privateKey: Pointer): OSStatus; cdecl;
  external libSecurity name _PU + 'SecKeyGeneratePair';
function SecKeyRawSign(key: SecKeyRef; padding: SecPadding; dataToSign: PByte;
  dataToSignLen: LongWord; sig: PByte; sigLen: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SecKeyRawSign';
function SecKeyRawVerify(key: SecKeyRef; padding: SecPadding; signedData: PByte;
  signedDataLen: LongWord; sig: PByte; sigLen: LongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SecKeyRawVerify';
function SecKeyEncrypt(key: SecKeyRef; padding: SecPadding; plainText: PByte;
  plainTextLen: LongWord; cipherText: PByte; cipherTextLen: PLongWord)
  : OSStatus; cdecl; external libSecurity name _PU + 'SecKeyEncrypt';
function SecKeyDecrypt(key: SecKeyRef; padding: SecPadding; cipherText: PByte;
  cipherTextLen: LongWord; plainText: PByte; plainTextLen: PLongWord): OSStatus;
  cdecl; external libSecurity name _PU + 'SecKeyDecrypt';
function SecKeyGetBlockSize(key: SecKeyRef): LongWord; cdecl;
  external libSecurity name _PU + 'SecKeyGetBlockSize';
function SecPolicyGetTypeID: CFTypeID; cdecl;
  external libSecurity name _PU + 'SecPolicyGetTypeID';
function SecPolicyCopyProperties(policyRef: SecPolicyRef): CFDictionaryRef;
  cdecl; external libSecurity name _PU + 'SecPolicyCopyProperties';
function SecPolicyCreateBasicX509: SecPolicyRef; cdecl;
  external libSecurity name _PU + 'SecPolicyCreateBasicX509';
function SecPolicyCreateSSL(server: Boolean; hostname: CFStringRef)
  : SecPolicyRef; cdecl; external libSecurity name _PU + 'SecPolicyCreateSSL';
function SecPolicyCreateRevocation(revocationFlags: CFOptionFlags)
  : SecPolicyRef; cdecl; external libSecurity name _PU +
  'SecPolicyCreateRevocation';
function SecPolicyCreateWithProperties(policyIdentifier: CFTypeRef;
  properties: CFDictionaryRef): SecPolicyRef; cdecl;
  external libSecurity name _PU + 'SecPolicyCreateWithProperties';
function SecRandomCopyBytes(rnd: SecRandomRef; count: LongWord; bytes: PByte)
  : Integer; cdecl; external libSecurity name _PU + 'SecRandomCopyBytes';
procedure SecAddSharedWebCredential(fqdn: CFStringRef; account: CFStringRef;
  password: CFStringRef; completionHandler: TSecurityCompletionHandler); cdecl;
  external libSecurity name _PU + 'SecAddSharedWebCredential';
procedure SecRequestSharedWebCredential(fqdn: CFStringRef; account: CFStringRef;
  completionHandler: TSecurityCompletionHandler1); cdecl;
  external libSecurity name _PU + 'SecRequestSharedWebCredential';
function SecCreateSharedWebCredentialPassword: CFStringRef; cdecl;
  external libSecurity name _PU + 'SecCreateSharedWebCredentialPassword';
function SecTrustGetTypeID: CFTypeID; cdecl;
  external libSecurity name _PU + 'SecTrustGetTypeID';
function SecTrustCreateWithCertificates(certificates: CFTypeRef;
  policies: CFTypeRef; trust: Pointer): OSStatus; cdecl;
  external libSecurity name _PU + 'SecTrustCreateWithCertificates';
function SecTrustSetPolicies(trust: SecTrustRef; policies: CFTypeRef): OSStatus;
  cdecl; external libSecurity name _PU + 'SecTrustSetPolicies';
function SecTrustCopyPolicies(trust: SecTrustRef; policies: Pointer): OSStatus;
  cdecl; external libSecurity name _PU + 'SecTrustCopyPolicies';
function SecTrustSetNetworkFetchAllowed(trust: SecTrustRef; allowFetch: Boolean)
  : OSStatus; cdecl; external libSecurity name _PU +
  'SecTrustSetNetworkFetchAllowed';
function SecTrustGetNetworkFetchAllowed(trust: SecTrustRef; allowFetch: PByte)
  : OSStatus; cdecl; external libSecurity name _PU +
  'SecTrustGetNetworkFetchAllowed';
function SecTrustSetAnchorCertificates(trust: SecTrustRef;
  anchorCertificates: CFArrayRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SecTrustSetAnchorCertificates';
function SecTrustSetAnchorCertificatesOnly(trust: SecTrustRef;
  anchorCertificatesOnly: Boolean): OSStatus; cdecl;
  external libSecurity name _PU + 'SecTrustSetAnchorCertificatesOnly';
function SecTrustCopyCustomAnchorCertificates(trust: SecTrustRef;
  anchors: Pointer): OSStatus; cdecl;
  external libSecurity name _PU + 'SecTrustCopyCustomAnchorCertificates';
function SecTrustSetVerifyDate(trust: SecTrustRef; verifyDate: CFDateRef)
  : OSStatus; cdecl; external libSecurity name _PU + 'SecTrustSetVerifyDate';
function SecTrustGetVerifyTime(trust: SecTrustRef): CFAbsoluteTime; cdecl;
  external libSecurity name _PU + 'SecTrustGetVerifyTime';
function SecTrustEvaluate(trust: SecTrustRef; result: PLongWord): OSStatus;
  cdecl; external libSecurity name _PU + 'SecTrustEvaluate';
function SecTrustEvaluateAsync(trust: SecTrustRef; queue: dispatch_queue_t;
  result: SecTrustCallback): OSStatus; cdecl;
  external libSecurity name _PU + 'SecTrustEvaluateAsync';
function SecTrustGetTrustResult(trust: SecTrustRef; result: PLongWord)
  : OSStatus; cdecl; external libSecurity name _PU + 'SecTrustGetTrustResult';
function SecTrustCopyPublicKey(trust: SecTrustRef): SecKeyRef; cdecl;
  external libSecurity name _PU + 'SecTrustCopyPublicKey';
function SecTrustGetCertificateCount(trust: SecTrustRef): CFIndex; cdecl;
  external libSecurity name _PU + 'SecTrustGetCertificateCount';
function SecTrustGetCertificateAtIndex(trust: SecTrustRef; ix: CFIndex)
  : SecCertificateRef; cdecl;
  external libSecurity name _PU + 'SecTrustGetCertificateAtIndex';
function SecTrustCopyExceptions(trust: SecTrustRef): CFDataRef; cdecl;
  external libSecurity name _PU + 'SecTrustCopyExceptions';
function SecTrustSetExceptions(trust: SecTrustRef; exceptions: CFDataRef)
  : Integer; cdecl; external libSecurity name _PU + 'SecTrustSetExceptions';
function SecTrustCopyProperties(trust: SecTrustRef): CFArrayRef; cdecl;
  external libSecurity name _PU + 'SecTrustCopyProperties';
function SecTrustCopyResult(trust: SecTrustRef): CFDictionaryRef; cdecl;
  external libSecurity name _PU + 'SecTrustCopyResult';
function SecTrustSetOCSPResponse(trust: SecTrustRef; responseData: CFTypeRef)
  : OSStatus; cdecl; external libSecurity name _PU + 'SecTrustSetOCSPResponse';
function SSLContextGetTypeID: CFTypeID; cdecl;
  external libSecurity name _PU + 'SSLContextGetTypeID';
function SSLCreateContext(alloc: CFAllocatorRef; protocolSide: SSLProtocolSide;
  connectionType: SSLConnectionType): SSLContextRef; cdecl;
  external libSecurity name _PU + 'SSLCreateContext';
function SSLGetSessionState(context: SSLContextRef; state: Integer): OSStatus;
  cdecl; external libSecurity name _PU + 'SSLGetSessionState';
function SSLSetSessionOption(context: SSLContextRef; option: SSLSessionOption;
  value: Boolean): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetSessionOption';
function SSLGetSessionOption(context: SSLContextRef; option: SSLSessionOption;
  value: PByte): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetSessionOption';
function SSLSetIOFuncs(context: SSLContextRef; readFunc: SSLReadFunc;
  writeFunc: SSLWriteFunc): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetIOFuncs';
function SSLSetProtocolVersionMin(context: SSLContextRef;
  minVersion: SSLProtocol): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetProtocolVersionMin';
function SSLGetProtocolVersionMin(context: SSLContextRef; minVersion: Integer)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLGetProtocolVersionMin';
function SSLSetProtocolVersionMax(context: SSLContextRef;
  maxVersion: SSLProtocol): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetProtocolVersionMax';
function SSLGetProtocolVersionMax(context: SSLContextRef; maxVersion: Integer)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLGetProtocolVersionMax';
function SSLSetCertificate(context: SSLContextRef; certRefs: CFArrayRef)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLSetCertificate';
function SSLSetConnection(context: SSLContextRef; connection: SSLConnectionRef)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLSetConnection';
function SSLGetConnection(context: SSLContextRef; connection: Pointer)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLGetConnection';
function SSLSetPeerDomainName(context: SSLContextRef;
  peerName: MarshaledAString; peerNameLen: LongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetPeerDomainName';
function SSLGetPeerDomainNameLength(context: SSLContextRef;
  peerNameLen: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetPeerDomainNameLength';
function SSLGetPeerDomainName(context: SSLContextRef;
  peerName: MarshaledAString; peerNameLen: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetPeerDomainName';
function SSLSetDatagramHelloCookie(dtlsContext: SSLContextRef; cookie: Pointer;
  cookieLen: LongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetDatagramHelloCookie';
function SSLSetMaxDatagramRecordSize(dtlsContext: SSLContextRef;
  maxSize: LongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetMaxDatagramRecordSize';
function SSLGetMaxDatagramRecordSize(dtlsContext: SSLContextRef;
  maxSize: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetMaxDatagramRecordSize';
function SSLGetNegotiatedProtocolVersion(context: SSLContextRef;
  protocol: Integer): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetNegotiatedProtocolVersion';
function SSLGetNumberSupportedCiphers(context: SSLContextRef;
  numCiphers: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetNumberSupportedCiphers';
function SSLGetSupportedCiphers(context: SSLContextRef; ciphers: PWord;
  numCiphers: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetSupportedCiphers';
function SSLSetEnabledCiphers(context: SSLContextRef; ciphers: PWord;
  numCiphers: LongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetEnabledCiphers';
function SSLGetNumberEnabledCiphers(context: SSLContextRef;
  numCiphers: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetNumberEnabledCiphers';
function SSLGetEnabledCiphers(context: SSLContextRef; ciphers: PWord;
  numCiphers: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetEnabledCiphers';
function SSLSetSessionStrengthPolicy(context: SSLContextRef;
  policyStrength: SSLSessionStrengthPolicy): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetSessionStrengthPolicy';
function SSLCopyPeerTrust(context: SSLContextRef; trust: Pointer): OSStatus;
  cdecl; external libSecurity name _PU + 'SSLCopyPeerTrust';
function SSLSetPeerID(context: SSLContextRef; peerID: Pointer;
  peerIDLen: LongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetPeerID';
function SSLGetPeerID(context: SSLContextRef; peerID: Pointer;
  peerIDLen: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetPeerID';
function SSLGetNegotiatedCipher(context: SSLContextRef; cipherSuite: PWord)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLGetNegotiatedCipher';
function SSLSetEncryptionCertificate(context: SSLContextRef;
  certRefs: CFArrayRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetEncryptionCertificate';
function SSLSetClientSideAuthenticate(context: SSLContextRef;
  auth: SSLAuthenticate): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetClientSideAuthenticate';
function SSLAddDistinguishedName(context: SSLContextRef; derDN: Pointer;
  derDNLen: LongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLAddDistinguishedName';
function SSLCopyDistinguishedNames(context: SSLContextRef; names: Pointer)
  : OSStatus; cdecl; external libSecurity name _PU +
  'SSLCopyDistinguishedNames';
function SSLGetClientCertificateState(context: SSLContextRef;
  clientState: Integer): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetClientCertificateState';
function SSLHandshake(context: SSLContextRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLHandshake';
function SSLWrite(context: SSLContextRef; data: Pointer; dataLength: LongWord;
  processed: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLWrite';
function SSLRead(context: SSLContextRef; data: Pointer; dataLength: LongWord;
  processed: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLRead';
function SSLGetBufferedReadSize(context: SSLContextRef; bufSize: PLongWord)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLGetBufferedReadSize';
function SSLGetDatagramWriteSize(dtlsContext: SSLContextRef; bufSize: PLongWord)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLGetDatagramWriteSize';
function SSLClose(context: SSLContextRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLClose';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  SecurityModule: THandle;

{$ENDIF IOS}

function kSecImportExportPassphrase: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecImportExportPassphrase');
end;

function kSecImportItemLabel: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecImportItemLabel');
end;

function kSecImportItemKeyID: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecImportItemKeyID');
end;

function kSecImportItemTrust: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecImportItemTrust');
end;

function kSecImportItemCertChain: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecImportItemCertChain');
end;

function kSecImportItemIdentity: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecImportItemIdentity');
end;

function kSecClass: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecClass');
end;

function kSecClassGenericPassword: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecClassGenericPassword');
end;

function kSecClassInternetPassword: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecClassInternetPassword');
end;

function kSecClassCertificate: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecClassCertificate');
end;

function kSecClassKey: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecClassKey');
end;

function kSecClassIdentity: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecClassIdentity');
end;

function kSecAttrAccessible: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAccessible');
end;

function kSecAttrAccessControl: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAccessControl');
end;

function kSecAttrAccessGroup: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAccessGroup');
end;

function kSecAttrSynchronizable: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrSynchronizable');
end;

function kSecAttrCreationDate: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrCreationDate');
end;

function kSecAttrModificationDate: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrModificationDate');
end;

function kSecAttrDescription: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrDescription');
end;

function kSecAttrComment: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrComment');
end;

function kSecAttrCreator: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrCreator');
end;

function kSecAttrType: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrType');
end;

function kSecAttrLabel: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrLabel');
end;

function kSecAttrIsInvisible: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrIsInvisible');
end;

function kSecAttrIsNegative: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrIsNegative');
end;

function kSecAttrAccount: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAccount');
end;

function kSecAttrService: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrService');
end;

function kSecAttrGeneric: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrGeneric');
end;

function kSecAttrSecurityDomain: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrSecurityDomain');
end;

function kSecAttrServer: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrServer');
end;

function kSecAttrProtocol: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocol');
end;

function kSecAttrAuthenticationType: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAuthenticationType');
end;

function kSecAttrPort: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrPort');
end;

function kSecAttrPath: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrPath');
end;

function kSecAttrSubject: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrSubject');
end;

function kSecAttrIssuer: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrIssuer');
end;

function kSecAttrSerialNumber: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrSerialNumber');
end;

function kSecAttrSubjectKeyID: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrSubjectKeyID');
end;

function kSecAttrPublicKeyHash: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrPublicKeyHash');
end;

function kSecAttrCertificateType: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrCertificateType');
end;

function kSecAttrCertificateEncoding: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrCertificateEncoding');
end;

function kSecAttrKeyClass: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyClass');
end;

function kSecAttrApplicationLabel: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrApplicationLabel');
end;

function kSecAttrIsPermanent: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrIsPermanent');
end;

function kSecAttrApplicationTag: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrApplicationTag');
end;

function kSecAttrKeyType: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyType');
end;

function kSecAttrKeySizeInBits: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeySizeInBits');
end;

function kSecAttrEffectiveKeySize: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrEffectiveKeySize');
end;

function kSecAttrCanEncrypt: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrCanEncrypt');
end;

function kSecAttrCanDecrypt: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrCanDecrypt');
end;

function kSecAttrCanDerive: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrCanDerive');
end;

function kSecAttrCanSign: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrCanSign');
end;

function kSecAttrCanVerify: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrCanVerify');
end;

function kSecAttrCanWrap: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrCanWrap');
end;

function kSecAttrCanUnwrap: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrCanUnwrap');
end;

function kSecAttrSyncViewHint: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrSyncViewHint');
end;

function kSecAttrTokenID: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrTokenID');
end;

function kSecAttrAccessibleWhenUnlocked: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAccessibleWhenUnlocked');
end;

function kSecAttrAccessibleAfterFirstUnlock: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecAttrAccessibleAfterFirstUnlock');
end;

function kSecAttrAccessibleAlways: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAccessibleAlways');
end;

function kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly');
end;

function kSecAttrAccessibleWhenUnlockedThisDeviceOnly: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecAttrAccessibleWhenUnlockedThisDeviceOnly');
end;

function kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly');
end;

function kSecAttrAccessibleAlwaysThisDeviceOnly: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecAttrAccessibleAlwaysThisDeviceOnly');
end;

function kSecAttrProtocolFTP: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolFTP');
end;

function kSecAttrProtocolFTPAccount: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolFTPAccount');
end;

function kSecAttrProtocolHTTP: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolHTTP');
end;

function kSecAttrProtocolIRC: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolIRC');
end;

function kSecAttrProtocolNNTP: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolNNTP');
end;

function kSecAttrProtocolPOP3: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolPOP3');
end;

function kSecAttrProtocolSMTP: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolSMTP');
end;

function kSecAttrProtocolSOCKS: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolSOCKS');
end;

function kSecAttrProtocolIMAP: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolIMAP');
end;

function kSecAttrProtocolLDAP: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolLDAP');
end;

function kSecAttrProtocolAppleTalk: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolAppleTalk');
end;

function kSecAttrProtocolAFP: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolAFP');
end;

function kSecAttrProtocolTelnet: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolTelnet');
end;

function kSecAttrProtocolSSH: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolSSH');
end;

function kSecAttrProtocolFTPS: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolFTPS');
end;

function kSecAttrProtocolHTTPS: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolHTTPS');
end;

function kSecAttrProtocolHTTPProxy: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolHTTPProxy');
end;

function kSecAttrProtocolHTTPSProxy: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolHTTPSProxy');
end;

function kSecAttrProtocolFTPProxy: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolFTPProxy');
end;

function kSecAttrProtocolSMB: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolSMB');
end;

function kSecAttrProtocolRTSP: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolRTSP');
end;

function kSecAttrProtocolRTSPProxy: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolRTSPProxy');
end;

function kSecAttrProtocolDAAP: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolDAAP');
end;

function kSecAttrProtocolEPPC: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolEPPC');
end;

function kSecAttrProtocolIPP: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolIPP');
end;

function kSecAttrProtocolNNTPS: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolNNTPS');
end;

function kSecAttrProtocolLDAPS: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolLDAPS');
end;

function kSecAttrProtocolTelnetS: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolTelnetS');
end;

function kSecAttrProtocolIMAPS: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolIMAPS');
end;

function kSecAttrProtocolIRCS: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolIRCS');
end;

function kSecAttrProtocolPOP3S: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrProtocolPOP3S');
end;

function kSecAttrAuthenticationTypeNTLM: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAuthenticationTypeNTLM');
end;

function kSecAttrAuthenticationTypeMSN: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAuthenticationTypeMSN');
end;

function kSecAttrAuthenticationTypeDPA: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAuthenticationTypeDPA');
end;

function kSecAttrAuthenticationTypeRPA: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAuthenticationTypeRPA');
end;

function kSecAttrAuthenticationTypeHTTPBasic: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecAttrAuthenticationTypeHTTPBasic');
end;

function kSecAttrAuthenticationTypeHTTPDigest: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecAttrAuthenticationTypeHTTPDigest');
end;

function kSecAttrAuthenticationTypeHTMLForm: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecAttrAuthenticationTypeHTMLForm');
end;

function kSecAttrAuthenticationTypeDefault: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAuthenticationTypeDefault');
end;

function kSecAttrKeyClassPublic: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyClassPublic');
end;

function kSecAttrKeyClassPrivate: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyClassPrivate');
end;

function kSecAttrKeyClassSymmetric: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyClassSymmetric');
end;

function kSecAttrKeyTypeRSA: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyTypeRSA');
end;

function kSecAttrKeyTypeEC: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyTypeEC');
end;

function kSecAttrSynchronizableAny: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrSynchronizableAny');
end;

function kSecMatchPolicy: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchPolicy');
end;

function kSecMatchItemList: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchItemList');
end;

function kSecMatchSearchList: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchSearchList');
end;

function kSecMatchIssuers: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchIssuers');
end;

function kSecMatchEmailAddressIfPresent: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchEmailAddressIfPresent');
end;

function kSecMatchSubjectContains: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchSubjectContains');
end;

function kSecMatchCaseInsensitive: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchCaseInsensitive');
end;

function kSecMatchTrustedOnly: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchTrustedOnly');
end;

function kSecMatchValidOnDate: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchValidOnDate');
end;

function kSecMatchLimit: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchLimit');
end;

function kSecMatchLimitOne: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchLimitOne');
end;

function kSecMatchLimitAll: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchLimitAll');
end;

function kSecReturnData: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecReturnData');
end;

function kSecReturnAttributes: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecReturnAttributes');
end;

function kSecReturnRef: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecReturnRef');
end;

function kSecReturnPersistentRef: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecReturnPersistentRef');
end;

function kSecValueData: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecValueData');
end;

function kSecValueRef: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecValueRef');
end;

function kSecValuePersistentRef: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecValuePersistentRef');
end;

function kSecUseItemList: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecUseItemList');
end;

function kSecUseOperationPrompt: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecUseOperationPrompt');
end;

function kSecUseNoAuthenticationUI: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecUseNoAuthenticationUI');
end;

function kSecUseAuthenticationUI: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecUseAuthenticationUI');
end;

function kSecUseAuthenticationContext: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecUseAuthenticationContext');
end;

function kSecUseAuthenticationUIAllow: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecUseAuthenticationUIAllow');
end;

function kSecUseAuthenticationUIFail: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecUseAuthenticationUIFail');
end;

function kSecUseAuthenticationUISkip: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecUseAuthenticationUISkip');
end;

function kSecAttrTokenIDSecureEnclave: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrTokenIDSecureEnclave');
end;

function kSecPrivateKeyAttrs: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPrivateKeyAttrs');
end;

function kSecPublicKeyAttrs: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPublicKeyAttrs');
end;

function kSecPolicyAppleX509Basic: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyAppleX509Basic');
end;

function kSecPolicyAppleSSL: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyAppleSSL');
end;

function kSecPolicyAppleSMIME: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyAppleSMIME');
end;

function kSecPolicyAppleEAP: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyAppleEAP');
end;

function kSecPolicyAppleIPsec: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyAppleIPsec');
end;

function kSecPolicyApplePKINITClient: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyApplePKINITClient');
end;

function kSecPolicyApplePKINITServer: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyApplePKINITServer');
end;

function kSecPolicyAppleCodeSigning: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyAppleCodeSigning');
end;

function kSecPolicyMacAppStoreReceipt: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyMacAppStoreReceipt');
end;

function kSecPolicyAppleIDValidation: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyAppleIDValidation');
end;

function kSecPolicyAppleTimeStamping: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyAppleTimeStamping');
end;

function kSecPolicyAppleRevocation: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyAppleRevocation');
end;

function kSecPolicyApplePayIssuerEncryption: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecPolicyApplePayIssuerEncryption');
end;

function kSecPolicyOid: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyOid');
end;

function kSecPolicyName: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyName');
end;

function kSecPolicyClient: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyClient');
end;

function kSecPolicyRevocationFlags: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyRevocationFlags');
end;

function kSecRandomDefault: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecRandomDefault');
end;

function kSecSharedPassword: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecSharedPassword');
end;

function kSecPropertyTypeTitle: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPropertyTypeTitle');
end;

function kSecPropertyTypeError: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPropertyTypeError');
end;

function kSecTrustEvaluationDate: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecTrustEvaluationDate');
end;

function kSecTrustExtendedValidation: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecTrustExtendedValidation');
end;

function kSecTrustOrganizationName: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecTrustOrganizationName');
end;

function kSecTrustResultValue: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecTrustResultValue');
end;

function kSecTrustRevocationChecked: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecTrustRevocationChecked');
end;

function kSecTrustRevocationValidUntilDate: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecTrustRevocationValidUntilDate');
end;

function kSecTrustCertificateTransparency: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecTrustCertificateTransparency');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

SecurityModule := dlopen(MarshaledAString(libSecurity), RTLD_LAZY);

finalization

dlclose(SecurityModule);
{$ENDIF IOS}

end.
