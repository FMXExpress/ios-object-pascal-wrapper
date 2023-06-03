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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

const
  SSL_NULL_WITH_NULL_NULL = 0;
  SSL_RSA_WITH_NULL_MD5 = 1;
  SSL_RSA_WITH_NULL_SHA = 2;
  SSL_RSA_EXPORT_WITH_RC4_40_MD5 = 3;
  SSL_RSA_WITH_RC4_128_MD5 = 4;
  SSL_RSA_WITH_RC4_128_SHA = 5;
  SSL_RSA_EXPORT_WITH_RC2_CBC_40_MD5 = 6;
  SSL_RSA_WITH_IDEA_CBC_SHA = 7;
  SSL_RSA_EXPORT_WITH_DES40_CBC_SHA = 8;
  SSL_RSA_WITH_DES_CBC_SHA = 9;
  SSL_RSA_WITH_3DES_EDE_CBC_SHA = 10;
  SSL_DH_DSS_EXPORT_WITH_DES40_CBC_SHA = 11;
  SSL_DH_DSS_WITH_DES_CBC_SHA = 12;
  SSL_DH_DSS_WITH_3DES_EDE_CBC_SHA = 13;
  SSL_DH_RSA_EXPORT_WITH_DES40_CBC_SHA = 14;
  SSL_DH_RSA_WITH_DES_CBC_SHA = 15;
  SSL_DH_RSA_WITH_3DES_EDE_CBC_SHA = 16;
  SSL_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA = 17;
  SSL_DHE_DSS_WITH_DES_CBC_SHA = 18;
  SSL_DHE_DSS_WITH_3DES_EDE_CBC_SHA = 19;
  SSL_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA = 20;
  SSL_DHE_RSA_WITH_DES_CBC_SHA = 21;
  SSL_DHE_RSA_WITH_3DES_EDE_CBC_SHA = 22;
  SSL_DH_anon_EXPORT_WITH_RC4_40_MD5 = 23;
  SSL_DH_anon_WITH_RC4_128_MD5 = 24;
  SSL_DH_anon_EXPORT_WITH_DES40_CBC_SHA = 25;
  SSL_DH_anon_WITH_DES_CBC_SHA = 26;
  SSL_DH_anon_WITH_3DES_EDE_CBC_SHA = 27;
  SSL_FORTEZZA_DMS_WITH_NULL_SHA = 28;
  SSL_FORTEZZA_DMS_WITH_FORTEZZA_CBC_SHA = 29;
  TLS_RSA_WITH_AES_128_CBC_SHA = 47;
  TLS_DH_DSS_WITH_AES_128_CBC_SHA = 48;
  TLS_DH_RSA_WITH_AES_128_CBC_SHA = 49;
  TLS_DHE_DSS_WITH_AES_128_CBC_SHA = 50;
  TLS_DHE_RSA_WITH_AES_128_CBC_SHA = 51;
  TLS_DH_anon_WITH_AES_128_CBC_SHA = 52;
  TLS_RSA_WITH_AES_256_CBC_SHA = 53;
  TLS_DH_DSS_WITH_AES_256_CBC_SHA = 54;
  TLS_DH_RSA_WITH_AES_256_CBC_SHA = 55;
  TLS_DHE_DSS_WITH_AES_256_CBC_SHA = 56;
  TLS_DHE_RSA_WITH_AES_256_CBC_SHA = 57;
  TLS_DH_anon_WITH_AES_256_CBC_SHA = 58;
  TLS_ECDH_ECDSA_WITH_NULL_SHA = 49153;
  TLS_ECDH_ECDSA_WITH_RC4_128_SHA = 49154;
  TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA = 49155;
  TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA = 49156;
  TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA = 49157;
  TLS_ECDHE_ECDSA_WITH_NULL_SHA = 49158;
  TLS_ECDHE_ECDSA_WITH_RC4_128_SHA = 49159;
  TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA = 49160;
  TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA = 49161;
  TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA = 49162;
  TLS_ECDH_RSA_WITH_NULL_SHA = 49163;
  TLS_ECDH_RSA_WITH_RC4_128_SHA = 49164;
  TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA = 49165;
  TLS_ECDH_RSA_WITH_AES_128_CBC_SHA = 49166;
  TLS_ECDH_RSA_WITH_AES_256_CBC_SHA = 49167;
  TLS_ECDHE_RSA_WITH_NULL_SHA = 49168;
  TLS_ECDHE_RSA_WITH_RC4_128_SHA = 49169;
  TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA = 49170;
  TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA = 49171;
  TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA = 49172;
  TLS_ECDH_anon_WITH_NULL_SHA = 49173;
  TLS_ECDH_anon_WITH_RC4_128_SHA = 49174;
  TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA = 49175;
  TLS_ECDH_anon_WITH_AES_128_CBC_SHA = 49176;
  TLS_ECDH_anon_WITH_AES_256_CBC_SHA = 49177;
  TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA = 49205;
  TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA = 49206;
  TLS_PSK_WITH_CHACHA20_POLY1305_SHA256 = 52395;
  TLS_NULL_WITH_NULL_NULL = 0;
  TLS_RSA_WITH_NULL_MD5 = 1;
  TLS_RSA_WITH_NULL_SHA = 2;
  TLS_RSA_WITH_RC4_128_MD5 = 4;
  TLS_RSA_WITH_RC4_128_SHA = 5;
  TLS_RSA_WITH_3DES_EDE_CBC_SHA = 10;
  TLS_RSA_WITH_NULL_SHA256 = 59;
  TLS_RSA_WITH_AES_128_CBC_SHA256 = 60;
  TLS_RSA_WITH_AES_256_CBC_SHA256 = 61;
  TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA = 13;
  TLS_DH_RSA_WITH_3DES_EDE_CBC_SHA = 16;
  TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA = 19;
  TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA = 22;
  TLS_DH_DSS_WITH_AES_128_CBC_SHA256 = 62;
  TLS_DH_RSA_WITH_AES_128_CBC_SHA256 = 63;
  TLS_DHE_DSS_WITH_AES_128_CBC_SHA256 = 64;
  TLS_DHE_RSA_WITH_AES_128_CBC_SHA256 = 103;
  TLS_DH_DSS_WITH_AES_256_CBC_SHA256 = 104;
  TLS_DH_RSA_WITH_AES_256_CBC_SHA256 = 105;
  TLS_DHE_DSS_WITH_AES_256_CBC_SHA256 = 106;
  TLS_DHE_RSA_WITH_AES_256_CBC_SHA256 = 107;
  TLS_DH_anon_WITH_RC4_128_MD5 = 24;
  TLS_DH_anon_WITH_3DES_EDE_CBC_SHA = 27;
  TLS_DH_anon_WITH_AES_128_CBC_SHA256 = 108;
  TLS_DH_anon_WITH_AES_256_CBC_SHA256 = 109;
  TLS_PSK_WITH_RC4_128_SHA = 138;
  TLS_PSK_WITH_3DES_EDE_CBC_SHA = 139;
  TLS_PSK_WITH_AES_128_CBC_SHA = 140;
  TLS_PSK_WITH_AES_256_CBC_SHA = 141;
  TLS_DHE_PSK_WITH_RC4_128_SHA = 142;
  TLS_DHE_PSK_WITH_3DES_EDE_CBC_SHA = 143;
  TLS_DHE_PSK_WITH_AES_128_CBC_SHA = 144;
  TLS_DHE_PSK_WITH_AES_256_CBC_SHA = 145;
  TLS_RSA_PSK_WITH_RC4_128_SHA = 146;
  TLS_RSA_PSK_WITH_3DES_EDE_CBC_SHA = 147;
  TLS_RSA_PSK_WITH_AES_128_CBC_SHA = 148;
  TLS_RSA_PSK_WITH_AES_256_CBC_SHA = 149;
  TLS_PSK_WITH_NULL_SHA = 44;
  TLS_DHE_PSK_WITH_NULL_SHA = 45;
  TLS_RSA_PSK_WITH_NULL_SHA = 46;
  TLS_RSA_WITH_AES_128_GCM_SHA256 = 156;
  TLS_RSA_WITH_AES_256_GCM_SHA384 = 157;
  TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 = 158;
  TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 = 159;
  TLS_DH_RSA_WITH_AES_128_GCM_SHA256 = 160;
  TLS_DH_RSA_WITH_AES_256_GCM_SHA384 = 161;
  TLS_DHE_DSS_WITH_AES_128_GCM_SHA256 = 162;
  TLS_DHE_DSS_WITH_AES_256_GCM_SHA384 = 163;
  TLS_DH_DSS_WITH_AES_128_GCM_SHA256 = 164;
  TLS_DH_DSS_WITH_AES_256_GCM_SHA384 = 165;
  TLS_DH_anon_WITH_AES_128_GCM_SHA256 = 166;
  TLS_DH_anon_WITH_AES_256_GCM_SHA384 = 167;
  TLS_PSK_WITH_AES_128_GCM_SHA256 = 168;
  TLS_PSK_WITH_AES_256_GCM_SHA384 = 169;
  TLS_DHE_PSK_WITH_AES_128_GCM_SHA256 = 170;
  TLS_DHE_PSK_WITH_AES_256_GCM_SHA384 = 171;
  TLS_RSA_PSK_WITH_AES_128_GCM_SHA256 = 172;
  TLS_RSA_PSK_WITH_AES_256_GCM_SHA384 = 173;
  TLS_PSK_WITH_AES_128_CBC_SHA256 = 174;
  TLS_PSK_WITH_AES_256_CBC_SHA384 = 175;
  TLS_PSK_WITH_NULL_SHA256 = 176;
  TLS_PSK_WITH_NULL_SHA384 = 177;
  TLS_DHE_PSK_WITH_AES_128_CBC_SHA256 = 178;
  TLS_DHE_PSK_WITH_AES_256_CBC_SHA384 = 179;
  TLS_DHE_PSK_WITH_NULL_SHA256 = 180;
  TLS_DHE_PSK_WITH_NULL_SHA384 = 181;
  TLS_RSA_PSK_WITH_AES_128_CBC_SHA256 = 182;
  TLS_RSA_PSK_WITH_AES_256_CBC_SHA384 = 183;
  TLS_RSA_PSK_WITH_NULL_SHA256 = 184;
  TLS_RSA_PSK_WITH_NULL_SHA384 = 185;
  TLS_AES_128_GCM_SHA256 = 4865;
  TLS_AES_256_GCM_SHA384 = 4866;
  TLS_CHACHA20_POLY1305_SHA256 = 4867;
  TLS_AES_128_CCM_SHA256 = 4868;
  TLS_AES_128_CCM_8_SHA256 = 4869;
  TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 = 49187;
  TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 = 49188;
  TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256 = 49189;
  TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384 = 49190;
  TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 = 49191;
  TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 = 49192;
  TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256 = 49193;
  TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384 = 49194;
  TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 = 49195;
  TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 = 49196;
  TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256 = 49197;
  TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384 = 49198;
  TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 = 49199;
  TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 = 49200;
  TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256 = 49201;
  TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384 = 49202;
  TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 = 52392;
  TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 = 52393;
  TLS_EMPTY_RENEGOTIATION_INFO_SCSV = 255;
  SSL_RSA_WITH_RC2_CBC_MD5 = 65408;
  SSL_RSA_WITH_IDEA_CBC_MD5 = 65409;
  SSL_RSA_WITH_DES_CBC_MD5 = 65410;
  SSL_RSA_WITH_3DES_EDE_CBC_MD5 = 65411;
  SSL_NO_SUCH_CIPHERSUITE = 65535;
  kSSLCiphersuiteGroupDefault = 0;
  kSSLCiphersuiteGroupCompatibility = 1;
  kSSLCiphersuiteGroupLegacy = 2;
  kSSLCiphersuiteGroupATS = 3;
  kSSLCiphersuiteGroupATSCompatibility = 4;
  errSecSuccess = 0;
  errSecUnimplemented = -4;
  errSecDiskFull = -34;
  errSecDskFull = errSecDiskFull;
  errSecIO = -36;
  errSecOpWr = -49;
  errSecParam = -50;
  errSecWrPerm = -61;
  errSecAllocate = -108;
  errSecUserCanceled = -128;
  errSecBadReq = -909;
  errSecInternalComponent = -2070;
  errSecCoreFoundationUnknown = -4960;
  errSecMissingEntitlement = -34018;
  errSecRestrictedAPI = -34020;
  errSecNotAvailable = -25291;
  errSecReadOnly = -25292;
  errSecAuthFailed = -25293;
  errSecNoSuchKeychain = -25294;
  errSecInvalidKeychain = -25295;
  errSecDuplicateKeychain = -25296;
  errSecDuplicateCallback = -25297;
  errSecInvalidCallback = -25298;
  errSecDuplicateItem = -25299;
  errSecItemNotFound = -25300;
  errSecBufferTooSmall = -25301;
  errSecDataTooLarge = -25302;
  errSecNoSuchAttr = -25303;
  errSecInvalidItemRef = -25304;
  errSecInvalidSearchRef = -25305;
  errSecNoSuchClass = -25306;
  errSecNoDefaultKeychain = -25307;
  errSecInteractionNotAllowed = -25308;
  errSecReadOnlyAttr = -25309;
  errSecWrongSecVersion = -25310;
  errSecKeySizeNotAllowed = -25311;
  errSecNoStorageModule = -25312;
  errSecNoCertificateModule = -25313;
  errSecNoPolicyModule = -25314;
  errSecInteractionRequired = -25315;
  errSecDataNotAvailable = -25316;
  errSecDataNotModifiable = -25317;
  errSecCreateChainFailed = -25318;
  errSecInvalidPrefsDomain = -25319;
  errSecInDarkWake = -25320;
  errSecACLNotSimple = -25240;
  errSecPolicyNotFound = -25241;
  errSecInvalidTrustSetting = -25242;
  errSecNoAccessForItem = -25243;
  errSecInvalidOwnerEdit = -25244;
  errSecTrustNotAvailable = -25245;
  errSecUnsupportedFormat = -25256;
  errSecUnknownFormat = -25257;
  errSecKeyIsSensitive = -25258;
  errSecMultiplePrivKeys = -25259;
  errSecPassphraseRequired = -25260;
  errSecInvalidPasswordRef = -25261;
  errSecInvalidTrustSettings = -25262;
  errSecNoTrustSettings = -25263;
  errSecPkcs12VerifyFailure = -25264;
  errSecNotSigner = -26267;
  errSecDecode = -26275;
  errSecServiceNotAvailable = -67585;
  errSecInsufficientClientID = -67586;
  errSecDeviceReset = -67587;
  errSecDeviceFailed = -67588;
  errSecAppleAddAppACLSubject = -67589;
  errSecApplePublicKeyIncomplete = -67590;
  errSecAppleSignatureMismatch = -67591;
  errSecAppleInvalidKeyStartDate = -67592;
  errSecAppleInvalidKeyEndDate = -67593;
  errSecConversionError = -67594;
  errSecAppleSSLv2Rollback = -67595;
  errSecQuotaExceeded = -67596;
  errSecFileTooBig = -67597;
  errSecInvalidDatabaseBlob = -67598;
  errSecInvalidKeyBlob = -67599;
  errSecIncompatibleDatabaseBlob = -67600;
  errSecIncompatibleKeyBlob = -67601;
  errSecHostNameMismatch = -67602;
  errSecUnknownCriticalExtensionFlag = -67603;
  errSecNoBasicConstraints = -67604;
  errSecNoBasicConstraintsCA = -67605;
  errSecInvalidAuthorityKeyID = -67606;
  errSecInvalidSubjectKeyID = -67607;
  errSecInvalidKeyUsageForPolicy = -67608;
  errSecInvalidExtendedKeyUsage = -67609;
  errSecInvalidIDLinkage = -67610;
  errSecPathLengthConstraintExceeded = -67611;
  errSecInvalidRoot = -67612;
  errSecCRLExpired = -67613;
  errSecCRLNotValidYet = -67614;
  errSecCRLNotFound = -67615;
  errSecCRLServerDown = -67616;
  errSecCRLBadURI = -67617;
  errSecUnknownCertExtension = -67618;
  errSecUnknownCRLExtension = -67619;
  errSecCRLNotTrusted = -67620;
  errSecCRLPolicyFailed = -67621;
  errSecIDPFailure = -67622;
  errSecSMIMEEmailAddressesNotFound = -67623;
  errSecSMIMEBadExtendedKeyUsage = -67624;
  errSecSMIMEBadKeyUsage = -67625;
  errSecSMIMEKeyUsageNotCritical = -67626;
  errSecSMIMENoEmailAddress = -67627;
  errSecSMIMESubjAltNameNotCritical = -67628;
  errSecSSLBadExtendedKeyUsage = -67629;
  errSecOCSPBadResponse = -67630;
  errSecOCSPBadRequest = -67631;
  errSecOCSPUnavailable = -67632;
  errSecOCSPStatusUnrecognized = -67633;
  errSecEndOfData = -67634;
  errSecIncompleteCertRevocationCheck = -67635;
  errSecNetworkFailure = -67636;
  errSecOCSPNotTrustedToAnchor = -67637;
  errSecRecordModified = -67638;
  errSecOCSPSignatureError = -67639;
  errSecOCSPNoSigner = -67640;
  errSecOCSPResponderMalformedReq = -67641;
  errSecOCSPResponderInternalError = -67642;
  errSecOCSPResponderTryLater = -67643;
  errSecOCSPResponderSignatureRequired = -67644;
  errSecOCSPResponderUnauthorized = -67645;
  errSecOCSPResponseNonceMismatch = -67646;
  errSecCodeSigningBadCertChainLength = -67647;
  errSecCodeSigningNoBasicConstraints = -67648;
  errSecCodeSigningBadPathLengthConstraint = -67649;
  errSecCodeSigningNoExtendedKeyUsage = -67650;
  errSecCodeSigningDevelopment = -67651;
  errSecResourceSignBadCertChainLength = -67652;
  errSecResourceSignBadExtKeyUsage = -67653;
  errSecTrustSettingDeny = -67654;
  errSecInvalidSubjectName = -67655;
  errSecUnknownQualifiedCertStatement = -67656;
  errSecMobileMeRequestQueued = -67657;
  errSecMobileMeRequestRedirected = -67658;
  errSecMobileMeServerError = -67659;
  errSecMobileMeServerNotAvailable = -67660;
  errSecMobileMeServerAlreadyExists = -67661;
  errSecMobileMeServerServiceErr = -67662;
  errSecMobileMeRequestAlreadyPending = -67663;
  errSecMobileMeNoRequestPending = -67664;
  errSecMobileMeCSRVerifyFailure = -67665;
  errSecMobileMeFailedConsistencyCheck = -67666;
  errSecNotInitialized = -67667;
  errSecInvalidHandleUsage = -67668;
  errSecPVCReferentNotFound = -67669;
  errSecFunctionIntegrityFail = -67670;
  errSecInternalError = -67671;
  errSecMemoryError = -67672;
  errSecInvalidData = -67673;
  errSecMDSError = -67674;
  errSecInvalidPointer = -67675;
  errSecSelfCheckFailed = -67676;
  errSecFunctionFailed = -67677;
  errSecModuleManifestVerifyFailed = -67678;
  errSecInvalidGUID = -67679;
  errSecInvalidHandle = -67680;
  errSecInvalidDBList = -67681;
  errSecInvalidPassthroughID = -67682;
  errSecInvalidNetworkAddress = -67683;
  errSecCRLAlreadySigned = -67684;
  errSecInvalidNumberOfFields = -67685;
  errSecVerificationFailure = -67686;
  errSecUnknownTag = -67687;
  errSecInvalidSignature = -67688;
  errSecInvalidName = -67689;
  errSecInvalidCertificateRef = -67690;
  errSecInvalidCertificateGroup = -67691;
  errSecTagNotFound = -67692;
  errSecInvalidQuery = -67693;
  errSecInvalidValue = -67694;
  errSecCallbackFailed = -67695;
  errSecACLDeleteFailed = -67696;
  errSecACLReplaceFailed = -67697;
  errSecACLAddFailed = -67698;
  errSecACLChangeFailed = -67699;
  errSecInvalidAccessCredentials = -67700;
  errSecInvalidRecord = -67701;
  errSecInvalidACL = -67702;
  errSecInvalidSampleValue = -67703;
  errSecIncompatibleVersion = -67704;
  errSecPrivilegeNotGranted = -67705;
  errSecInvalidScope = -67706;
  errSecPVCAlreadyConfigured = -67707;
  errSecInvalidPVC = -67708;
  errSecEMMLoadFailed = -67709;
  errSecEMMUnloadFailed = -67710;
  errSecAddinLoadFailed = -67711;
  errSecInvalidKeyRef = -67712;
  errSecInvalidKeyHierarchy = -67713;
  errSecAddinUnloadFailed = -67714;
  errSecLibraryReferenceNotFound = -67715;
  errSecInvalidAddinFunctionTable = -67716;
  errSecInvalidServiceMask = -67717;
  errSecModuleNotLoaded = -67718;
  errSecInvalidSubServiceID = -67719;
  errSecAttributeNotInContext = -67720;
  errSecModuleManagerInitializeFailed = -67721;
  errSecModuleManagerNotFound = -67722;
  errSecEventNotificationCallbackNotFound = -67723;
  errSecInputLengthError = -67724;
  errSecOutputLengthError = -67725;
  errSecPrivilegeNotSupported = -67726;
  errSecDeviceError = -67727;
  errSecAttachHandleBusy = -67728;
  errSecNotLoggedIn = -67729;
  errSecAlgorithmMismatch = -67730;
  errSecKeyUsageIncorrect = -67731;
  errSecKeyBlobTypeIncorrect = -67732;
  errSecKeyHeaderInconsistent = -67733;
  errSecUnsupportedKeyFormat = -67734;
  errSecUnsupportedKeySize = -67735;
  errSecInvalidKeyUsageMask = -67736;
  errSecUnsupportedKeyUsageMask = -67737;
  errSecInvalidKeyAttributeMask = -67738;
  errSecUnsupportedKeyAttributeMask = -67739;
  errSecInvalidKeyLabel = -67740;
  errSecUnsupportedKeyLabel = -67741;
  errSecInvalidKeyFormat = -67742;
  errSecUnsupportedVectorOfBuffers = -67743;
  errSecInvalidInputVector = -67744;
  errSecInvalidOutputVector = -67745;
  errSecInvalidContext = -67746;
  errSecInvalidAlgorithm = -67747;
  errSecInvalidAttributeKey = -67748;
  errSecMissingAttributeKey = -67749;
  errSecInvalidAttributeInitVector = -67750;
  errSecMissingAttributeInitVector = -67751;
  errSecInvalidAttributeSalt = -67752;
  errSecMissingAttributeSalt = -67753;
  errSecInvalidAttributePadding = -67754;
  errSecMissingAttributePadding = -67755;
  errSecInvalidAttributeRandom = -67756;
  errSecMissingAttributeRandom = -67757;
  errSecInvalidAttributeSeed = -67758;
  errSecMissingAttributeSeed = -67759;
  errSecInvalidAttributePassphrase = -67760;
  errSecMissingAttributePassphrase = -67761;
  errSecInvalidAttributeKeyLength = -67762;
  errSecMissingAttributeKeyLength = -67763;
  errSecInvalidAttributeBlockSize = -67764;
  errSecMissingAttributeBlockSize = -67765;
  errSecInvalidAttributeOutputSize = -67766;
  errSecMissingAttributeOutputSize = -67767;
  errSecInvalidAttributeRounds = -67768;
  errSecMissingAttributeRounds = -67769;
  errSecInvalidAlgorithmParms = -67770;
  errSecMissingAlgorithmParms = -67771;
  errSecInvalidAttributeLabel = -67772;
  errSecMissingAttributeLabel = -67773;
  errSecInvalidAttributeKeyType = -67774;
  errSecMissingAttributeKeyType = -67775;
  errSecInvalidAttributeMode = -67776;
  errSecMissingAttributeMode = -67777;
  errSecInvalidAttributeEffectiveBits = -67778;
  errSecMissingAttributeEffectiveBits = -67779;
  errSecInvalidAttributeStartDate = -67780;
  errSecMissingAttributeStartDate = -67781;
  errSecInvalidAttributeEndDate = -67782;
  errSecMissingAttributeEndDate = -67783;
  errSecInvalidAttributeVersion = -67784;
  errSecMissingAttributeVersion = -67785;
  errSecInvalidAttributePrime = -67786;
  errSecMissingAttributePrime = -67787;
  errSecInvalidAttributeBase = -67788;
  errSecMissingAttributeBase = -67789;
  errSecInvalidAttributeSubprime = -67790;
  errSecMissingAttributeSubprime = -67791;
  errSecInvalidAttributeIterationCount = -67792;
  errSecMissingAttributeIterationCount = -67793;
  errSecInvalidAttributeDLDBHandle = -67794;
  errSecMissingAttributeDLDBHandle = -67795;
  errSecInvalidAttributeAccessCredentials = -67796;
  errSecMissingAttributeAccessCredentials = -67797;
  errSecInvalidAttributePublicKeyFormat = -67798;
  errSecMissingAttributePublicKeyFormat = -67799;
  errSecInvalidAttributePrivateKeyFormat = -67800;
  errSecMissingAttributePrivateKeyFormat = -67801;
  errSecInvalidAttributeSymmetricKeyFormat = -67802;
  errSecMissingAttributeSymmetricKeyFormat = -67803;
  errSecInvalidAttributeWrappedKeyFormat = -67804;
  errSecMissingAttributeWrappedKeyFormat = -67805;
  errSecStagedOperationInProgress = -67806;
  errSecStagedOperationNotStarted = -67807;
  errSecVerifyFailed = -67808;
  errSecQuerySizeUnknown = -67809;
  errSecBlockSizeMismatch = -67810;
  errSecPublicKeyInconsistent = -67811;
  errSecDeviceVerifyFailed = -67812;
  errSecInvalidLoginName = -67813;
  errSecAlreadyLoggedIn = -67814;
  errSecInvalidDigestAlgorithm = -67815;
  errSecInvalidCRLGroup = -67816;
  errSecCertificateCannotOperate = -67817;
  errSecCertificateExpired = -67818;
  errSecCertificateNotValidYet = -67819;
  errSecCertificateRevoked = -67820;
  errSecCertificateSuspended = -67821;
  errSecInsufficientCredentials = -67822;
  errSecInvalidAction = -67823;
  errSecInvalidAuthority = -67824;
  errSecVerifyActionFailed = -67825;
  errSecInvalidCertAuthority = -67826;
  errSecInvalidCRLAuthority = -67827;
  errSecInvaldCRLAuthority = errSecInvalidCRLAuthority;
  errSecInvalidCRLEncoding = -67828;
  errSecInvalidCRLType = -67829;
  errSecInvalidCRL = -67830;
  errSecInvalidFormType = -67831;
  errSecInvalidID = -67832;
  errSecInvalidIdentifier = -67833;
  errSecInvalidIndex = -67834;
  errSecInvalidPolicyIdentifiers = -67835;
  errSecInvalidTimeString = -67836;
  errSecInvalidReason = -67837;
  errSecInvalidRequestInputs = -67838;
  errSecInvalidResponseVector = -67839;
  errSecInvalidStopOnPolicy = -67840;
  errSecInvalidTuple = -67841;
  errSecMultipleValuesUnsupported = -67842;
  errSecNotTrusted = -67843;
  errSecNoDefaultAuthority = -67844;
  errSecRejectedForm = -67845;
  errSecRequestLost = -67846;
  errSecRequestRejected = -67847;
  errSecUnsupportedAddressType = -67848;
  errSecUnsupportedService = -67849;
  errSecInvalidTupleGroup = -67850;
  errSecInvalidBaseACLs = -67851;
  errSecInvalidTupleCredentials = -67852;
  errSecInvalidTupleCredendtials = errSecInvalidTupleCredentials;
  errSecInvalidEncoding = -67853;
  errSecInvalidValidityPeriod = -67854;
  errSecInvalidRequestor = -67855;
  errSecRequestDescriptor = -67856;
  errSecInvalidBundleInfo = -67857;
  errSecInvalidCRLIndex = -67858;
  errSecNoFieldValues = -67859;
  errSecUnsupportedFieldFormat = -67860;
  errSecUnsupportedIndexInfo = -67861;
  errSecUnsupportedLocality = -67862;
  errSecUnsupportedNumAttributes = -67863;
  errSecUnsupportedNumIndexes = -67864;
  errSecUnsupportedNumRecordTypes = -67865;
  errSecFieldSpecifiedMultiple = -67866;
  errSecIncompatibleFieldFormat = -67867;
  errSecInvalidParsingModule = -67868;
  errSecDatabaseLocked = -67869;
  errSecDatastoreIsOpen = -67870;
  errSecMissingValue = -67871;
  errSecUnsupportedQueryLimits = -67872;
  errSecUnsupportedNumSelectionPreds = -67873;
  errSecUnsupportedOperator = -67874;
  errSecInvalidDBLocation = -67875;
  errSecInvalidAccessRequest = -67876;
  errSecInvalidIndexInfo = -67877;
  errSecInvalidNewOwner = -67878;
  errSecInvalidModifyMode = -67879;
  errSecMissingRequiredExtension = -67880;
  errSecExtendedKeyUsageNotCritical = -67881;
  errSecTimestampMissing = -67882;
  errSecTimestampInvalid = -67883;
  errSecTimestampNotTrusted = -67884;
  errSecTimestampServiceNotAvailable = -67885;
  errSecTimestampBadAlg = -67886;
  errSecTimestampBadRequest = -67887;
  errSecTimestampBadDataFormat = -67888;
  errSecTimestampTimeNotAvailable = -67889;
  errSecTimestampUnacceptedPolicy = -67890;
  errSecTimestampUnacceptedExtension = -67891;
  errSecTimestampAddInfoNotAvailable = -67892;
  errSecTimestampSystemFailure = -67893;
  errSecSigningTimeMissing = -67894;
  errSecTimestampRejection = -67895;
  errSecTimestampWaiting = -67896;
  errSecTimestampRevocationWarning = -67897;
  errSecTimestampRevocationNotification = -67898;
  errSecCertificatePolicyNotAllowed = -67899;
  errSecCertificateNameNotAllowed = -67900;
  errSecCertificateValidityPeriodTooLong = -67901;
  errSecCertificateIsCA = -67902;
  errSecCertificateDuplicateExtension = -67903;
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
  errSSLTransportReset = -9852;
  errSSLNetworkTimeout = -9853;
  errSSLConfigurationFailed = -9854;
  errSSLUnsupportedExtension = -9855;
  errSSLUnexpectedMessage = -9856;
  errSSLDecompressFail = -9857;
  errSSLHandshakeFail = -9858;
  errSSLDecodeError = -9859;
  errSSLInappropriateFallback = -9860;
  errSSLMissingExtension = -9861;
  errSSLBadCertificateStatusResponse = -9862;
  errSSLCertificateRequired = -9863;
  errSSLUnknownPSKIdentity = -9864;
  errSSLUnrecognizedName = -9865;
  errSSLATSViolation = -9880;
  errSSLATSMinimumVersionViolation = -9881;
  errSSLATSCiphersuiteViolation = -9882;
  errSSLATSMinimumKeySizeViolation = -9883;
  errSSLATSLeafCertificateHashAlgorithmViolation = -9884;
  errSSLATSCertificateHashAlgorithmViolation = -9885;
  errSSLATSCertificateTrustViolation = -9886;
  errSSLEarlyDataRejected = -9890;
  kSecAccessControlUserPresence = 1 shl 0;
  kSecAccessControlBiometryAny = 1 shl 1;
  kSecAccessControlTouchIDAny = 1 shl 1;
  kSecAccessControlBiometryCurrentSet = 1 shl 3;
  kSecAccessControlTouchIDCurrentSet = 1 shl 3;
  kSecAccessControlDevicePasscode = 1 shl 4;
  kSecAccessControlWatch = 1 shl 5;
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
  kSecKeyOperationTypeSign = 0;
  kSecKeyOperationTypeVerify = 1;
  kSecKeyOperationTypeEncrypt = 2;
  kSecKeyOperationTypeDecrypt = 3;
  kSecKeyOperationTypeKeyExchange = 4;
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
  tls_protocol_version_TLSv10 = 769;
  tls_protocol_version_TLSv11 = 770;
  tls_protocol_version_TLSv12 = 771;
  tls_protocol_version_TLSv13 = 772;
  tls_protocol_version_DTLSv10 = 65279;
  tls_protocol_version_DTLSv12 = 65277;
  tls_ciphersuite_RSA_WITH_3DES_EDE_CBC_SHA = 10;
  tls_ciphersuite_RSA_WITH_AES_128_CBC_SHA = 47;
  tls_ciphersuite_RSA_WITH_AES_256_CBC_SHA = 53;
  tls_ciphersuite_RSA_WITH_AES_128_GCM_SHA256 = 156;
  tls_ciphersuite_RSA_WITH_AES_256_GCM_SHA384 = 157;
  tls_ciphersuite_RSA_WITH_AES_128_CBC_SHA256 = 60;
  tls_ciphersuite_RSA_WITH_AES_256_CBC_SHA256 = 61;
  tls_ciphersuite_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA = 49160;
  tls_ciphersuite_ECDHE_ECDSA_WITH_AES_128_CBC_SHA = 49161;
  tls_ciphersuite_ECDHE_ECDSA_WITH_AES_256_CBC_SHA = 49162;
  tls_ciphersuite_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA = 49170;
  tls_ciphersuite_ECDHE_RSA_WITH_AES_128_CBC_SHA = 49171;
  tls_ciphersuite_ECDHE_RSA_WITH_AES_256_CBC_SHA = 49172;
  tls_ciphersuite_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 = 49187;
  tls_ciphersuite_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 = 49188;
  tls_ciphersuite_ECDHE_RSA_WITH_AES_128_CBC_SHA256 = 49191;
  tls_ciphersuite_ECDHE_RSA_WITH_AES_256_CBC_SHA384 = 49192;
  tls_ciphersuite_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 = 49195;
  tls_ciphersuite_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 = 49196;
  tls_ciphersuite_ECDHE_RSA_WITH_AES_128_GCM_SHA256 = 49199;
  tls_ciphersuite_ECDHE_RSA_WITH_AES_256_GCM_SHA384 = 49200;
  tls_ciphersuite_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 = 52392;
  tls_ciphersuite_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 = 52393;
  tls_ciphersuite_AES_128_GCM_SHA256 = 4865;
  tls_ciphersuite_AES_256_GCM_SHA384 = 4866;
  tls_ciphersuite_CHACHA20_POLY1305_SHA256 = 4867;
  tls_ciphersuite_group_default = 0;
  tls_ciphersuite_group_compatibility = 1;
  tls_ciphersuite_group_legacy = 2;
  tls_ciphersuite_group_ats = 3;
  tls_ciphersuite_group_ats_compatibility = 4;
  kSSLProtocolUnknown = 0;
  __AVAILABILITY_INTERNAL__IPHONE_5_0_DEP__IPHONE_13_0 = 0;
  kTLSProtocol1 = 1;
  kTLSProtocol11 = 0;
  kTLSProtocol12 = 0;
  kDTLSProtocol1 = 0;
  kTLSProtocol13 = 0;
  kDTLSProtocol12 = 0;
  kTLSProtocolMaxSupported = 0;
  kSSLProtocol2 = 0;
  kSSLProtocol3 = 0;
  kSSLProtocol3Only = 0;
  kTLSProtocol1Only = 0;
  kSSLProtocolAll = 0;
  kSSLSessionOptionBreakOnServerAuth = 0;
  __AVAILABILITY_INTERNAL__IPHONE_2_0_DEP__IPHONE_13_0 = 0;
  kSSLSessionOptionBreakOnCertRequested = 1;
  kSSLSessionOptionBreakOnClientAuth = 0;
  kSSLSessionOptionFalseStart = 0;
  kSSLSessionOptionSendOneByteRecord = 0;
  kSSLSessionOptionAllowServerIdentityChange = 0;
  kSSLSessionOptionFallback = 0;
  kSSLSessionOptionBreakOnClientHello = 0;
  kSSLSessionOptionAllowRenegotiation = 0;
  kSSLSessionOptionEnableSessionTickets = 0;
  kSSLIdle = 0;
  kSSLHandshake = 0;
  kSSLConnected = 0;
  kSSLClosed = 0;
  kSSLAborted = 0;
  kSSLClientCertNone = 0;
  kSSLClientCertRequested = 0;
  kSSLClientCertSent = 0;
  kSSLClientCertRejected = 0;
  kSSLServerSide = 0;
  kSSLClientSide = 0;
  kSSLStreamType = 0;
  kSSLDatagramType = 0;
  kNeverAuthenticate = 0;
  kAlwaysAuthenticate = 1;
  kTryAuthenticate = 2;

type
  // ===== Framework typedefs =====
{$M+}
  SSLCipherSuite = Word;
  PSSLCipherSuite = ^SSLCipherSuite;
  SSLCiphersuiteGroup = Integer;
  SecCertificateRef = Pointer;
  PSecCertificateRef = ^SecCertificateRef;
  SecIdentityRef = Pointer;
  PSecIdentityRef = ^SecIdentityRef;
  SecKeyRef = Pointer;
  PSecKeyRef = ^SecKeyRef;
  SecPolicyRef = Pointer;
  PSecPolicyRef = ^SecPolicyRef;
  SecAccessControlRef = Pointer;
  PSecAccessControlRef = ^SecAccessControlRef;
  SecKeychainRef = Pointer;
  PSecKeychainRef = ^SecKeychainRef;
  SecKeychainItemRef = Pointer;
  PSecKeychainItemRef = ^SecKeychainItemRef;
  SecKeychainSearchRef = Pointer;
  PSecKeychainSearchRef = ^SecKeychainSearchRef;
  FourCharCode = UInt32;
  PFourCharCode = ^FourCharCode;
  OSType = FourCharCode;
  POSType = ^OSType;
  SecKeychainAttrType = OSType;
  PSecKeychainAttrType = ^SecKeychainAttrType;

  SecKeychainAttribute = record
    tag: SecKeychainAttrType;
    length: UInt32;
    data: Pointer;
  end;

  PSecKeychainAttribute = ^SecKeychainAttribute;

  SecKeychainAttributePtr = PSecKeychainAttribute;
  PSecKeychainAttributePtr = ^SecKeychainAttributePtr;

  SecKeychainAttributeList = record
    count: UInt32;
    attr: PSecKeychainAttribute;
  end;

  PSecKeychainAttributeList = ^SecKeychainAttributeList;

  SecKeychainStatus = UInt32;
  PSecKeychainStatus = ^SecKeychainStatus;
  SecTrustedApplicationRef = Pointer;
  PSecTrustedApplicationRef = ^SecTrustedApplicationRef;
  SecAccessRef = Pointer;
  PSecAccessRef = ^SecAccessRef;
  SecACLRef = Pointer;
  PSecACLRef = ^SecACLRef;
  SecPasswordRef = Pointer;
  PSecPasswordRef = ^SecPasswordRef;

  SecKeychainAttributeInfo = record
    count: UInt32;
    tag: PLongWord;
    format: PLongWord;
  end;

  PSecKeychainAttributeInfo = ^SecKeychainAttributeInfo;

  OSStatus = Int32;
  POSStatus = ^OSStatus;
  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  CFTypeID = LongWord;
  PCFTypeID = ^CFTypeID;

  CFOptionFlags = LongWord;
  PCFOptionFlags = ^CFOptionFlags;

  SecAccessControlCreateFlags = CFOptionFlags;
  CFAllocatorRef = Pointer;
  PCFAllocatorRef = ^CFAllocatorRef;
  CFTypeRef = Pointer;
  PCFTypeRef = ^CFTypeRef;
  CFDataRef = Pointer;
  PCFDataRef = ^CFDataRef;
  CFDictionaryRef = Pointer;
  PCFDictionaryRef = ^CFDictionaryRef;
  SecPadding = LongWord;
  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  SecKeyAlgorithm = CFStringRef;
  PSecKeyAlgorithm = ^SecKeyAlgorithm;
  Boolean = Byte;
  PBoolean = ^Boolean;

  SecKeyKeyExchangeParameter = CFStringRef;
  PSecKeyKeyExchangeParameter = ^SecKeyKeyExchangeParameter;
  CFIndex = LongInt;
  PCFIndex = ^CFIndex;

  SecKeyOperationType = CFIndex;
  sec_object_t = Pointer;
  Psec_object_t = ^sec_object_t;
  SecTrustResultType = LongWord;
  SecTrustRef = Pointer;
  PSecTrustRef = ^SecTrustRef;
  SecTrustCallback = procedure(param1: SecTrustRef; param2: SecTrustResultType)
    of object;
  CFArrayRef = Pointer;
  PCFArrayRef = ^CFArrayRef;
  CFDateRef = Pointer;
  PCFDateRef = ^CFDateRef;
  CFTimeInterval = Double;
  PCFTimeInterval = ^CFTimeInterval;

  CFAbsoluteTime = CFTimeInterval;
  PCFAbsoluteTime = ^CFAbsoluteTime;
  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;
  CFErrorRef = Pointer;
  PCFErrorRef = ^CFErrorRef;
  SecTrustWithErrorCallback = procedure(param1: SecTrustRef; param2: Integer;
    param3: CFErrorRef) of object;
  sec_trust_t = Pointer;
  Psec_trust_t = ^sec_trust_t;
  sec_identity_t = Pointer;
  Psec_identity_t = ^sec_identity_t;
  sec_certificate_t = Pointer;
  Psec_certificate_t = ^sec_certificate_t;
  tls_protocol_version_t = Word;
  tls_ciphersuite_t = Word;
  tls_ciphersuite_group_t = Word;
  SSLProtocol = Integer;
  TSecurityHandler = procedure(param1: sec_certificate_t) of object;
  sec_protocol_options_t = Pointer;
  Psec_protocol_options_t = ^sec_protocol_options_t;
  dispatch_data_t = Pointer;
  Pdispatch_data_t = ^dispatch_data_t;
  sec_protocol_pre_shared_key_selection_complete_t = procedure
    (param1: dispatch_data_t) of object;
  sec_protocol_pre_shared_key_selection_t = procedure
    (param1: sec_protocol_options_t; param2: dispatch_data_t;
    param3: sec_protocol_pre_shared_key_selection_complete_t) of object;
  sec_protocol_key_update_complete_t = procedure() of object;
  sec_protocol_key_update_t = procedure(param1: sec_protocol_options_t;
    param2: sec_protocol_key_update_complete_t) of object;
  sec_protocol_challenge_complete_t = procedure(param1: sec_identity_t)
    of object;
  sec_protocol_challenge_t = procedure(param1: sec_protocol_key_update_t;
    param2: sec_protocol_challenge_complete_t) of object;
  sec_protocol_verify_complete_t = procedure(param1: Integer) of object;
  sec_protocol_verify_t = procedure(param1: sec_protocol_key_update_t;
    param2: sec_trust_t; param3: sec_protocol_verify_complete_t) of object;
  sec_protocol_metadata_t = Pointer;
  Psec_protocol_metadata_t = ^sec_protocol_metadata_t;
  TSecurityHandler1 = procedure(param1: dispatch_data_t) of object;
  TSecurityHandler2 = procedure(param1: Word) of object;
  TSecurityHandler3 = procedure(param1: dispatch_data_t;
    param2: dispatch_data_t) of object;
  SecRandomRef = Pointer;
  PSecRandomRef = ^SecRandomRef;
  TSecurityCompletionHandler = procedure(param1: CFErrorRef) of object;
  TSecurityCompletionHandler1 = procedure(param1: CFArrayRef;
    param2: CFErrorRef) of object;
  SSLContextRef = Pointer;
  PSSLContextRef = ^SSLContextRef;
  SSLConnectionRef = Pointer;
  PSSLConnectionRef = ^SSLConnectionRef;
  SSLSessionOption = Integer;
  SSLSessionState = Integer;
  SSLClientCertificateState = Integer;
  SSLReadFunc = function(param1: SSLConnectionRef; param2: Pointer;
    param3: PLongWord): OSStatus; cdecl;
  PSSLReadFunc = ^SSLReadFunc;
  SSLWriteFunc = function(param1: SSLConnectionRef; param2: Pointer;
    param3: PLongWord): OSStatus; cdecl;
  PSSLWriteFunc = ^SSLWriteFunc;
  SSLProtocolSide = Integer;
  SSLConnectionType = Integer;
  SSLAuthenticate = Integer;
  // ===== Exported string consts =====

function kSecImportExportPassphrase: Pointer;
function kSecImportExportKeychain: Pointer;
function kSecImportExportAccess: Pointer;
function kSecImportItemLabel: Pointer;
function kSecImportItemKeyID: Pointer;
function kSecImportItemTrust: Pointer;
function kSecImportItemCertChain: Pointer;
function kSecImportItemIdentity: Pointer;
function kSecClass: Pointer;
function kSecClassInternetPassword: Pointer;
function kSecClassGenericPassword: Pointer;
function kSecClassCertificate: Pointer;
function kSecClassKey: Pointer;
function kSecClassIdentity: Pointer;
function kSecAttrAccessible: Pointer;
function kSecAttrAccess: Pointer;
function kSecAttrAccessControl: Pointer;
function kSecAttrAccessGroup: Pointer;
function kSecAttrSynchronizable: Pointer;
function kSecAttrSynchronizableAny: Pointer;
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
function kSecAttrIsSensitive: Pointer;
function kSecAttrIsExtractable: Pointer;
function kSecAttrApplicationTag: Pointer;
function kSecAttrKeyType: Pointer;
function kSecAttrPRF: Pointer;
function kSecAttrSalt: Pointer;
function kSecAttrRounds: Pointer;
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
function kSecAttrPersistantReference: Pointer;
function kSecAttrPersistentReference: Pointer;
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
function kSecAttrKeyTypeDSA: Pointer;
function kSecAttrKeyTypeAES: Pointer;
function kSecAttrKeyTypeDES: Pointer;
function kSecAttrKeyType3DES: Pointer;
function kSecAttrKeyTypeRC4: Pointer;
function kSecAttrKeyTypeRC2: Pointer;
function kSecAttrKeyTypeCAST: Pointer;
function kSecAttrKeyTypeECDSA: Pointer;
function kSecAttrKeyTypeEC: Pointer;
function kSecAttrKeyTypeECSECPrimeRandom: Pointer;
function kSecAttrPRFHmacAlgSHA1: Pointer;
function kSecAttrPRFHmacAlgSHA224: Pointer;
function kSecAttrPRFHmacAlgSHA256: Pointer;
function kSecAttrPRFHmacAlgSHA384: Pointer;
function kSecAttrPRFHmacAlgSHA512: Pointer;
function kSecMatchPolicy: Pointer;
function kSecMatchItemList: Pointer;
function kSecMatchSearchList: Pointer;
function kSecMatchIssuers: Pointer;
function kSecMatchEmailAddressIfPresent: Pointer;
function kSecMatchSubjectContains: Pointer;
function kSecMatchSubjectStartsWith: Pointer;
function kSecMatchSubjectEndsWith: Pointer;
function kSecMatchSubjectWholeString: Pointer;
function kSecMatchCaseInsensitive: Pointer;
function kSecMatchDiacriticInsensitive: Pointer;
function kSecMatchWidthInsensitive: Pointer;
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
function kSecUseKeychain: Pointer;
function kSecUseOperationPrompt: Pointer;
function kSecUseNoAuthenticationUI: Pointer;
function kSecUseAuthenticationUI: Pointer;
function kSecUseAuthenticationContext: Pointer;
function kSecUseDataProtectionKeychain: Pointer;
function kSecUseUserIndependentKeychain: Pointer;
function kSecUseAuthenticationUIAllow: Pointer;
function kSecUseAuthenticationUIFail: Pointer;
function kSecUseAuthenticationUISkip: Pointer;
function kSecAttrTokenIDSecureEnclave: Pointer;
function kSecAttrAccessGroupToken: Pointer;
function kSecPrivateKeyAttrs: Pointer;
function kSecPublicKeyAttrs: Pointer;
function kSecKeyAlgorithmRSASignatureRaw: Pointer;
function kSecKeyAlgorithmRSASignatureDigestPKCS1v15Raw: Pointer;
function kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA1: Pointer;
function kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA224: Pointer;
function kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA256: Pointer;
function kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA384: Pointer;
function kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA512: Pointer;
function kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA1: Pointer;
function kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA224: Pointer;
function kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA256: Pointer;
function kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA384: Pointer;
function kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA512: Pointer;
function kSecKeyAlgorithmRSASignatureDigestPSSSHA1: Pointer;
function kSecKeyAlgorithmRSASignatureDigestPSSSHA224: Pointer;
function kSecKeyAlgorithmRSASignatureDigestPSSSHA256: Pointer;
function kSecKeyAlgorithmRSASignatureDigestPSSSHA384: Pointer;
function kSecKeyAlgorithmRSASignatureDigestPSSSHA512: Pointer;
function kSecKeyAlgorithmRSASignatureMessagePSSSHA1: Pointer;
function kSecKeyAlgorithmRSASignatureMessagePSSSHA224: Pointer;
function kSecKeyAlgorithmRSASignatureMessagePSSSHA256: Pointer;
function kSecKeyAlgorithmRSASignatureMessagePSSSHA384: Pointer;
function kSecKeyAlgorithmRSASignatureMessagePSSSHA512: Pointer;
function kSecKeyAlgorithmECDSASignatureRFC4754: Pointer;
function kSecKeyAlgorithmECDSASignatureDigestX962: Pointer;
function kSecKeyAlgorithmECDSASignatureDigestX962SHA1: Pointer;
function kSecKeyAlgorithmECDSASignatureDigestX962SHA224: Pointer;
function kSecKeyAlgorithmECDSASignatureDigestX962SHA256: Pointer;
function kSecKeyAlgorithmECDSASignatureDigestX962SHA384: Pointer;
function kSecKeyAlgorithmECDSASignatureDigestX962SHA512: Pointer;
function kSecKeyAlgorithmECDSASignatureMessageX962SHA1: Pointer;
function kSecKeyAlgorithmECDSASignatureMessageX962SHA224: Pointer;
function kSecKeyAlgorithmECDSASignatureMessageX962SHA256: Pointer;
function kSecKeyAlgorithmECDSASignatureMessageX962SHA384: Pointer;
function kSecKeyAlgorithmECDSASignatureMessageX962SHA512: Pointer;
function kSecKeyAlgorithmRSAEncryptionRaw: Pointer;
function kSecKeyAlgorithmRSAEncryptionPKCS1: Pointer;
function kSecKeyAlgorithmRSAEncryptionOAEPSHA1: Pointer;
function kSecKeyAlgorithmRSAEncryptionOAEPSHA224: Pointer;
function kSecKeyAlgorithmRSAEncryptionOAEPSHA256: Pointer;
function kSecKeyAlgorithmRSAEncryptionOAEPSHA384: Pointer;
function kSecKeyAlgorithmRSAEncryptionOAEPSHA512: Pointer;
function kSecKeyAlgorithmRSAEncryptionOAEPSHA1AESGCM: Pointer;
function kSecKeyAlgorithmRSAEncryptionOAEPSHA224AESGCM: Pointer;
function kSecKeyAlgorithmRSAEncryptionOAEPSHA256AESGCM: Pointer;
function kSecKeyAlgorithmRSAEncryptionOAEPSHA384AESGCM: Pointer;
function kSecKeyAlgorithmRSAEncryptionOAEPSHA512AESGCM: Pointer;
function kSecKeyAlgorithmECIESEncryptionStandardX963SHA1AESGCM: Pointer;
function kSecKeyAlgorithmECIESEncryptionStandardX963SHA224AESGCM: Pointer;
function kSecKeyAlgorithmECIESEncryptionStandardX963SHA256AESGCM: Pointer;
function kSecKeyAlgorithmECIESEncryptionStandardX963SHA384AESGCM: Pointer;
function kSecKeyAlgorithmECIESEncryptionStandardX963SHA512AESGCM: Pointer;
function kSecKeyAlgorithmECIESEncryptionCofactorX963SHA1AESGCM: Pointer;
function kSecKeyAlgorithmECIESEncryptionCofactorX963SHA224AESGCM: Pointer;
function kSecKeyAlgorithmECIESEncryptionCofactorX963SHA256AESGCM: Pointer;
function kSecKeyAlgorithmECIESEncryptionCofactorX963SHA384AESGCM: Pointer;
function kSecKeyAlgorithmECIESEncryptionCofactorX963SHA512AESGCM: Pointer;
function kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA224AESGCM
  : Pointer;
function kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM
  : Pointer;
function kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA384AESGCM
  : Pointer;
function kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA512AESGCM
  : Pointer;
function kSecKeyAlgorithmECIESEncryptionCofactorVariableIVX963SHA224AESGCM
  : Pointer;
function kSecKeyAlgorithmECIESEncryptionCofactorVariableIVX963SHA256AESGCM
  : Pointer;
function kSecKeyAlgorithmECIESEncryptionCofactorVariableIVX963SHA384AESGCM
  : Pointer;
function kSecKeyAlgorithmECIESEncryptionCofactorVariableIVX963SHA512AESGCM
  : Pointer;
function kSecKeyAlgorithmECDHKeyExchangeStandard: Pointer;
function kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA1: Pointer;
function kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA224: Pointer;
function kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA256: Pointer;
function kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA384: Pointer;
function kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA512: Pointer;
function kSecKeyAlgorithmECDHKeyExchangeCofactor: Pointer;
function kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA1: Pointer;
function kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA224: Pointer;
function kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA256: Pointer;
function kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA384: Pointer;
function kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA512: Pointer;
function kSecKeyKeyExchangeParameterRequestedSize: Pointer;
function kSecKeyKeyExchangeParameterSharedInfo: Pointer;
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
function kSecPolicyApplePassbookSigning: Pointer;
function kSecPolicyApplePayIssuerEncryption: Pointer;
function kSecPolicyOid: Pointer;
function kSecPolicyName: Pointer;
function kSecPolicyClient: Pointer;
function kSecPolicyRevocationFlags: Pointer;
function kSecPolicyTeamIdentifier: Pointer;
function kSecPropertyTypeTitle: Pointer;
function kSecPropertyTypeError: Pointer;
function kSecTrustEvaluationDate: Pointer;
function kSecTrustExtendedValidation: Pointer;
function kSecTrustOrganizationName: Pointer;
function kSecTrustResultValue: Pointer;
function kSecTrustRevocationChecked: Pointer;
function kSecTrustRevocationValidUntilDate: Pointer;
function kSecTrustCertificateTransparency: Pointer;
function kSecTrustCertificateTransparencyWhiteList: Pointer;
function kSecRandomDefault: Pointer;
function kSecSharedPassword: Pointer;
function kSSLSessionConfig_default: Pointer;
function kSSLSessionConfig_ATSv1: Pointer;
function kSSLSessionConfig_ATSv1_noPFS: Pointer;
function kSSLSessionConfig_standard: Pointer;
function kSSLSessionConfig_RC4_fallback: Pointer;
function kSSLSessionConfig_TLSv1_fallback: Pointer;
function kSSLSessionConfig_TLSv1_RC4_fallback: Pointer;
function kSSLSessionConfig_legacy: Pointer;
function kSSLSessionConfig_legacy_DHE: Pointer;
function kSSLSessionConfig_anonymous: Pointer;
function kSSLSessionConfig_3DES_fallback: Pointer;
function kSSLSessionConfig_TLSv1_3DES_fallback: Pointer;


// ===== External functions =====

const
  libSecurity = '/System/Library/Frameworks/Security.framework/Security';
function SecCopyErrorMessageString(status: OSStatus; reserved: Pointer)
  : CFStringRef; cdecl; external libSecurity name _PU +
  'SecCopyErrorMessageString';
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
function SecCertificateCopyCommonName(certificate: SecCertificateRef;
  commonName: PCFStringRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SecCertificateCopyCommonName';
function SecCertificateCopyEmailAddresses(certificate: SecCertificateRef;
  emailAddresses: Pointer): OSStatus; cdecl;
  external libSecurity name _PU + 'SecCertificateCopyEmailAddresses';
function SecCertificateCopyNormalizedIssuerSequence
  (certificate: SecCertificateRef): CFDataRef; cdecl;
  external libSecurity name _PU + 'SecCertificateCopyNormalizedIssuerSequence';
function SecCertificateCopyNormalizedSubjectSequence
  (certificate: SecCertificateRef): CFDataRef; cdecl;
  external libSecurity name _PU + 'SecCertificateCopyNormalizedSubjectSequence';
function SecCertificateCopyKey(certificate: SecCertificateRef): SecKeyRef;
  cdecl; external libSecurity name _PU + 'SecCertificateCopyKey';
function SecCertificateCopyPublicKey(certificate: SecCertificateRef): SecKeyRef;
  cdecl; external libSecurity name _PU + 'SecCertificateCopyPublicKey';
function SecCertificateCopySerialNumberData(certificate: SecCertificateRef;
  error: Pointer): CFDataRef; cdecl;
  external libSecurity name _PU + 'SecCertificateCopySerialNumberData';
function SecCertificateCopySerialNumber(certificate: SecCertificateRef)
  : CFDataRef; cdecl; external libSecurity name _PU +
  'SecCertificateCopySerialNumber';
function SecIdentityGetTypeID: CFTypeID; cdecl;
  external libSecurity name _PU + 'SecIdentityGetTypeID';
function SecIdentityCopyCertificate(identityRef: SecIdentityRef;
  certificateRef: PSecCertificateRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SecIdentityCopyCertificate';
function SecIdentityCopyPrivateKey(identityRef: SecIdentityRef;
  privateKeyRef: PSecKeyRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SecIdentityCopyPrivateKey';
function SecPKCS12Import(pkcs12_data: CFDataRef; options: CFDictionaryRef;
  items: Pointer): OSStatus; cdecl;
  external libSecurity name _PU + 'SecPKCS12Import';
function SecItemCopyMatching(query: CFDictionaryRef; result: PCFTypeRef)
  : OSStatus; cdecl; external libSecurity name _PU + 'SecItemCopyMatching';
function SecItemAdd(attributes: CFDictionaryRef; result: PCFTypeRef): OSStatus;
  cdecl; external libSecurity name _PU + 'SecItemAdd';
function SecItemUpdate(query: CFDictionaryRef;
  attributesToUpdate: CFDictionaryRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SecItemUpdate';
function SecItemDelete(query: CFDictionaryRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SecItemDelete';
function SecKeyGetTypeID: CFTypeID; cdecl;
  external libSecurity name _PU + 'SecKeyGetTypeID';
function SecKeyGeneratePair(parameters: CFDictionaryRef; publicKey: PSecKeyRef;
  privateKey: PSecKeyRef): OSStatus; cdecl;
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
function SecKeyCreateRandomKey(parameters: CFDictionaryRef; error: Pointer)
  : SecKeyRef; cdecl; external libSecurity name _PU + 'SecKeyCreateRandomKey';
function SecKeyCreateWithData(keyData: CFDataRef; attributes: CFDictionaryRef;
  error: Pointer): SecKeyRef; cdecl;
  external libSecurity name _PU + 'SecKeyCreateWithData';
function SecKeyGetBlockSize(key: SecKeyRef): LongWord; cdecl;
  external libSecurity name _PU + 'SecKeyGetBlockSize';
function SecKeyCopyExternalRepresentation(key: SecKeyRef; error: Pointer)
  : CFDataRef; cdecl; external libSecurity name _PU +
  'SecKeyCopyExternalRepresentation';
function SecKeyCopyAttributes(key: SecKeyRef): CFDictionaryRef; cdecl;
  external libSecurity name _PU + 'SecKeyCopyAttributes';
function SecKeyCopyPublicKey(key: SecKeyRef): SecKeyRef; cdecl;
  external libSecurity name _PU + 'SecKeyCopyPublicKey';
function SecKeyCreateSignature(key: SecKeyRef; algorithm: SecKeyAlgorithm;
  dataToSign: CFDataRef; error: Pointer): CFDataRef; cdecl;
  external libSecurity name _PU + 'SecKeyCreateSignature';
function SecKeyVerifySignature(key: SecKeyRef; algorithm: SecKeyAlgorithm;
  signedData: CFDataRef; signature: CFDataRef; error: Pointer): Boolean; cdecl;
  external libSecurity name _PU + 'SecKeyVerifySignature';
function SecKeyCreateEncryptedData(key: SecKeyRef; algorithm: SecKeyAlgorithm;
  plainText: CFDataRef; error: Pointer): CFDataRef; cdecl;
  external libSecurity name _PU + 'SecKeyCreateEncryptedData';
function SecKeyCreateDecryptedData(key: SecKeyRef; algorithm: SecKeyAlgorithm;
  cipherText: CFDataRef; error: Pointer): CFDataRef; cdecl;
  external libSecurity name _PU + 'SecKeyCreateDecryptedData';
function SecKeyCopyKeyExchangeResult(privateKey: SecKeyRef;
  algorithm: SecKeyAlgorithm; publicKey: SecKeyRef; parameters: CFDictionaryRef;
  error: Pointer): CFDataRef; cdecl;
  external libSecurity name _PU + 'SecKeyCopyKeyExchangeResult';
function SecKeyIsAlgorithmSupported(key: SecKeyRef;
  operation: SecKeyOperationType; algorithm: SecKeyAlgorithm): Boolean; cdecl;
  external libSecurity name _PU + 'SecKeyIsAlgorithmSupported';
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
function sec_retain(obj: Pointer): Pointer; cdecl;
  external libSecurity name _PU + 'sec_retain';
procedure sec_release(obj: Pointer); cdecl;
  external libSecurity name _PU + 'sec_release';
function SecTrustGetTypeID: CFTypeID; cdecl;
  external libSecurity name _PU + 'SecTrustGetTypeID';
function SecTrustCreateWithCertificates(certificates: CFTypeRef;
  policies: CFTypeRef; trust: PSecTrustRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SecTrustCreateWithCertificates';
function SecTrustSetPolicies(trust: SecTrustRef; policies: CFTypeRef): OSStatus;
  cdecl; external libSecurity name _PU + 'SecTrustSetPolicies';
function SecTrustCopyPolicies(trust: SecTrustRef; policies: Pointer): OSStatus;
  cdecl; external libSecurity name _PU + 'SecTrustCopyPolicies';
function SecTrustSetNetworkFetchAllowed(trust: SecTrustRef; allowFetch: Boolean)
  : OSStatus; cdecl; external libSecurity name _PU +
  'SecTrustSetNetworkFetchAllowed';
function SecTrustGetNetworkFetchAllowed(trust: SecTrustRef;
  allowFetch: PBoolean): OSStatus; cdecl;
  external libSecurity name _PU + 'SecTrustGetNetworkFetchAllowed';
function SecTrustSetAnchorCertificates(trust: SecTrustRef;
  anchorCertificates: CFArrayRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SecTrustSetAnchorCertificates';
function SecTrustSetAnchorCertificatesOnly(trust: SecTrustRef;
  anchorCertificatesOnly: Boolean): OSStatus; cdecl;
  external libSecurity name _PU + 'SecTrustSetAnchorCertificatesOnly';
function SecTrustCopyCustomAnchorCertificates(trust: SecTrustRef;
  anchors: PCFArrayRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SecTrustCopyCustomAnchorCertificates';
function SecTrustSetVerifyDate(trust: SecTrustRef; verifyDate: CFDateRef)
  : OSStatus; cdecl; external libSecurity name _PU + 'SecTrustSetVerifyDate';
function SecTrustGetVerifyTime(trust: SecTrustRef): CFAbsoluteTime; cdecl;
  external libSecurity name _PU + 'SecTrustGetVerifyTime';
function SecTrustEvaluate(trust: SecTrustRef; result: PSecTrustResultType)
  : OSStatus; cdecl; external libSecurity name _PU + 'SecTrustEvaluate';
function SecTrustEvaluateAsync(trust: SecTrustRef; queue: dispatch_queue_t;
  result: SecTrustCallback): OSStatus; cdecl;
  external libSecurity name _PU + 'SecTrustEvaluateAsync';
function SecTrustEvaluateWithError(trust: SecTrustRef; error: Pointer): Integer;
  cdecl; external libSecurity name _PU + 'SecTrustEvaluateWithError';
function SecTrustEvaluateAsyncWithError(trust: SecTrustRef;
  queue: dispatch_queue_t; result: SecTrustWithErrorCallback): OSStatus; cdecl;
  external libSecurity name _PU + 'SecTrustEvaluateAsyncWithError';
function SecTrustGetTrustResult(trust: SecTrustRef; result: PSecTrustResultType)
  : OSStatus; cdecl; external libSecurity name _PU + 'SecTrustGetTrustResult';
function SecTrustCopyPublicKey(trust: SecTrustRef): SecKeyRef; cdecl;
  external libSecurity name _PU + 'SecTrustCopyPublicKey';
function SecTrustCopyKey(trust: SecTrustRef): SecKeyRef; cdecl;
  external libSecurity name _PU + 'SecTrustCopyKey';
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
function SecTrustSetSignedCertificateTimestamps(trust: SecTrustRef;
  sctArray: CFArrayRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SecTrustSetSignedCertificateTimestamps';
function SecTrustCopyCertificateChain(trust: SecTrustRef): CFArrayRef; cdecl;
  external libSecurity name _PU + 'SecTrustCopyCertificateChain';
function sec_trust_create(trust: SecTrustRef): sec_trust_t; cdecl;
  external libSecurity name _PU + 'sec_trust_create';
function sec_trust_copy_ref(trust: sec_trust_t): SecTrustRef; cdecl;
  external libSecurity name _PU + 'sec_trust_copy_ref';
function sec_identity_create(identity: SecIdentityRef): sec_identity_t; cdecl;
  external libSecurity name _PU + 'sec_identity_create';
function sec_identity_create_with_certificates(identity: SecIdentityRef;
  certificates: CFArrayRef): sec_identity_t; cdecl;
  external libSecurity name _PU + 'sec_identity_create_with_certificates';
function sec_identity_access_certificates(identity: sec_identity_t;
  handler: TSecurityHandler): Integer; cdecl;
  external libSecurity name _PU + 'sec_identity_access_certificates';
function sec_identity_copy_ref(identity: sec_identity_t): SecIdentityRef; cdecl;
  external libSecurity name _PU + 'sec_identity_copy_ref';
function sec_identity_copy_certificates_ref(identity: sec_identity_t)
  : CFArrayRef; cdecl; external libSecurity name _PU +
  'sec_identity_copy_certificates_ref';
function sec_certificate_create(certificate: SecCertificateRef)
  : sec_certificate_t; cdecl;
  external libSecurity name _PU + 'sec_certificate_create';
function sec_certificate_copy_ref(certificate: sec_certificate_t)
  : SecCertificateRef; cdecl;
  external libSecurity name _PU + 'sec_certificate_copy_ref';
function sec_protocol_options_are_equal(optionsA: sec_protocol_options_t;
  optionsB: sec_protocol_options_t): Integer; cdecl;
  external libSecurity name _PU + 'sec_protocol_options_are_equal';
procedure sec_protocol_options_set_local_identity
  (options: sec_protocol_options_t; identity: sec_identity_t); cdecl;
  external libSecurity name _PU + 'sec_protocol_options_set_local_identity';
procedure sec_protocol_options_append_tls_ciphersuite
  (options: sec_protocol_options_t; ciphersuite: tls_ciphersuite_t); cdecl;
  external libSecurity name _PU + 'sec_protocol_options_append_tls_ciphersuite';
procedure sec_protocol_options_add_tls_ciphersuite
  (options: sec_protocol_options_t; ciphersuite: SSLCipherSuite); cdecl;
  external libSecurity name _PU + 'sec_protocol_options_add_tls_ciphersuite';
procedure sec_protocol_options_append_tls_ciphersuite_group
  (options: sec_protocol_options_t; group: tls_ciphersuite_group_t); cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_append_tls_ciphersuite_group';
procedure sec_protocol_options_add_tls_ciphersuite_group
  (options: sec_protocol_options_t; group: SSLCiphersuiteGroup); cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_add_tls_ciphersuite_group';
procedure sec_protocol_options_set_tls_min_version
  (options: sec_protocol_options_t; version: SSLProtocol); cdecl;
  external libSecurity name _PU + 'sec_protocol_options_set_tls_min_version';
procedure sec_protocol_options_set_min_tls_protocol_version
  (options: sec_protocol_options_t; version: tls_protocol_version_t); cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_set_min_tls_protocol_version';
function sec_protocol_options_get_default_min_tls_protocol_version
  : tls_protocol_version_t; cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_get_default_min_tls_protocol_version';
function sec_protocol_options_get_default_min_dtls_protocol_version
  : tls_protocol_version_t; cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_get_default_min_dtls_protocol_version';
procedure sec_protocol_options_set_tls_max_version
  (options: sec_protocol_options_t; version: SSLProtocol); cdecl;
  external libSecurity name _PU + 'sec_protocol_options_set_tls_max_version';
procedure sec_protocol_options_set_max_tls_protocol_version
  (options: sec_protocol_options_t; version: tls_protocol_version_t); cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_set_max_tls_protocol_version';
function sec_protocol_options_get_default_max_tls_protocol_version
  : tls_protocol_version_t; cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_get_default_max_tls_protocol_version';
function sec_protocol_options_get_default_max_dtls_protocol_version
  : tls_protocol_version_t; cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_get_default_max_dtls_protocol_version';
function sec_protocol_options_get_enable_encrypted_client_hello
  (options: sec_protocol_options_t): Integer; cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_get_enable_encrypted_client_hello';
function sec_protocol_options_get_quic_use_legacy_codepoint
  (options: sec_protocol_options_t): Integer; cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_get_quic_use_legacy_codepoint';
procedure sec_protocol_options_add_tls_application_protocol
  (options: sec_protocol_options_t; application_protocol: MarshaledAString);
  cdecl; external libSecurity name _PU +
  'sec_protocol_options_add_tls_application_protocol';
procedure sec_protocol_options_set_tls_server_name
  (options: sec_protocol_options_t; server_name: MarshaledAString); cdecl;
  external libSecurity name _PU + 'sec_protocol_options_set_tls_server_name';
procedure sec_protocol_options_set_tls_diffie_hellman_parameters
  (options: sec_protocol_options_t; params: dispatch_data_t); cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_set_tls_diffie_hellman_parameters';
procedure sec_protocol_options_add_pre_shared_key
  (options: sec_protocol_options_t; psk: dispatch_data_t;
  psk_identity: dispatch_data_t); cdecl;
  external libSecurity name _PU + 'sec_protocol_options_add_pre_shared_key';
procedure sec_protocol_options_set_tls_pre_shared_key_identity_hint
  (options: sec_protocol_options_t; psk_identity_hint: dispatch_data_t); cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_set_tls_pre_shared_key_identity_hint';
procedure sec_protocol_options_set_pre_shared_key_selection_block
  (options: sec_protocol_options_t;
  psk_selection_block: sec_protocol_pre_shared_key_selection_t;
  psk_selection_queue: dispatch_queue_t); cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_set_pre_shared_key_selection_block';
procedure sec_protocol_options_set_tls_tickets_enabled
  (options: sec_protocol_options_t; tickets_enabled: Integer); cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_set_tls_tickets_enabled';
procedure sec_protocol_options_set_tls_is_fallback_attempt
  (options: sec_protocol_options_t; is_fallback_attempt: Integer); cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_set_tls_is_fallback_attempt';
procedure sec_protocol_options_set_tls_resumption_enabled
  (options: sec_protocol_options_t; resumption_enabled: Integer); cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_set_tls_resumption_enabled';
procedure sec_protocol_options_set_tls_false_start_enabled
  (options: sec_protocol_options_t; false_start_enabled: Integer); cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_set_tls_false_start_enabled';
procedure sec_protocol_options_set_tls_ocsp_enabled
  (options: sec_protocol_options_t; ocsp_enabled: Integer); cdecl;
  external libSecurity name _PU + 'sec_protocol_options_set_tls_ocsp_enabled';
procedure sec_protocol_options_set_tls_sct_enabled
  (options: sec_protocol_options_t; sct_enabled: Integer); cdecl;
  external libSecurity name _PU + 'sec_protocol_options_set_tls_sct_enabled';
procedure sec_protocol_options_set_tls_renegotiation_enabled
  (options: sec_protocol_options_t; renegotiation_enabled: Integer); cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_set_tls_renegotiation_enabled';
procedure sec_protocol_options_set_peer_authentication_required
  (options: sec_protocol_options_t; peer_authentication_required: Integer);
  cdecl; external libSecurity name _PU +
  'sec_protocol_options_set_peer_authentication_required';
procedure sec_protocol_options_set_peer_authentication_optional
  (options: sec_protocol_options_t; peer_authentication_optional: Integer);
  cdecl; external libSecurity name _PU +
  'sec_protocol_options_set_peer_authentication_optional';
procedure sec_protocol_options_set_enable_encrypted_client_hello
  (options: sec_protocol_options_t; enable_encrypted_client_hello: Integer);
  cdecl; external libSecurity name _PU +
  'sec_protocol_options_set_enable_encrypted_client_hello';
procedure sec_protocol_options_set_quic_use_legacy_codepoint
  (options: sec_protocol_options_t; quic_use_legacy_codepoint: Integer); cdecl;
  external libSecurity name _PU +
  'sec_protocol_options_set_quic_use_legacy_codepoint';
procedure sec_protocol_options_set_key_update_block
  (options: sec_protocol_options_t; key_update_block: sec_protocol_key_update_t;
  key_update_queue: dispatch_queue_t); cdecl;
  external libSecurity name _PU + 'sec_protocol_options_set_key_update_block';
procedure sec_protocol_options_set_challenge_block
  (options: sec_protocol_options_t; challenge_block: sec_protocol_challenge_t;
  challenge_queue: dispatch_queue_t); cdecl;
  external libSecurity name _PU + 'sec_protocol_options_set_challenge_block';
procedure sec_protocol_options_set_verify_block(options: sec_protocol_options_t;
  verify_block: sec_protocol_verify_t; verify_block_queue: dispatch_queue_t);
  cdecl; external libSecurity name _PU +
  'sec_protocol_options_set_verify_block';
function sec_protocol_metadata_get_negotiated_protocol
  (metadata: sec_protocol_metadata_t): MarshaledAString; cdecl;
  external libSecurity name _PU +
  'sec_protocol_metadata_get_negotiated_protocol';
function sec_protocol_metadata_copy_peer_public_key
  (metadata: sec_protocol_metadata_t): dispatch_data_t; cdecl;
  external libSecurity name _PU + 'sec_protocol_metadata_copy_peer_public_key';
function sec_protocol_metadata_get_negotiated_tls_protocol_version
  (metadata: sec_protocol_metadata_t): tls_protocol_version_t; cdecl;
  external libSecurity name _PU +
  'sec_protocol_metadata_get_negotiated_tls_protocol_version';
function sec_protocol_metadata_get_negotiated_protocol_version
  (metadata: sec_protocol_metadata_t): SSLProtocol; cdecl;
  external libSecurity name _PU +
  'sec_protocol_metadata_get_negotiated_protocol_version';
function sec_protocol_metadata_get_negotiated_tls_ciphersuite
  (metadata: sec_protocol_metadata_t): tls_ciphersuite_t; cdecl;
  external libSecurity name _PU +
  'sec_protocol_metadata_get_negotiated_tls_ciphersuite';
function sec_protocol_metadata_get_negotiated_ciphersuite
  (metadata: sec_protocol_metadata_t): SSLCipherSuite; cdecl;
  external libSecurity name _PU +
  'sec_protocol_metadata_get_negotiated_ciphersuite';
function sec_protocol_metadata_get_early_data_accepted
  (metadata: sec_protocol_metadata_t): Integer; cdecl;
  external libSecurity name _PU +
  'sec_protocol_metadata_get_early_data_accepted';
function sec_protocol_metadata_access_peer_certificate_chain
  (metadata: sec_protocol_metadata_t; handler: TSecurityHandler): Integer;
  cdecl; external libSecurity name _PU +
  'sec_protocol_metadata_access_peer_certificate_chain';
function sec_protocol_metadata_access_ocsp_response
  (metadata: sec_protocol_metadata_t; handler: TSecurityHandler1): Integer;
  cdecl; external libSecurity name _PU +
  'sec_protocol_metadata_access_ocsp_response';
function sec_protocol_metadata_access_supported_signature_algorithms
  (metadata: sec_protocol_metadata_t; handler: TSecurityHandler2): Integer;
  cdecl; external libSecurity name _PU +
  'sec_protocol_metadata_access_supported_signature_algorithms';
function sec_protocol_metadata_access_distinguished_names
  (metadata: sec_protocol_metadata_t; handler: TSecurityHandler1): Integer;
  cdecl; external libSecurity name _PU +
  'sec_protocol_metadata_access_distinguished_names';
function sec_protocol_metadata_access_pre_shared_keys
  (metadata: sec_protocol_metadata_t; handler: TSecurityHandler3): Integer;
  cdecl; external libSecurity name _PU +
  'sec_protocol_metadata_access_pre_shared_keys';
function sec_protocol_metadata_get_server_name
  (metadata: sec_protocol_metadata_t): MarshaledAString; cdecl;
  external libSecurity name _PU + 'sec_protocol_metadata_get_server_name';
function sec_protocol_metadata_peers_are_equal
  (metadataA: sec_protocol_metadata_t; metadataB: sec_protocol_metadata_t)
  : Integer; cdecl; external libSecurity name _PU +
  'sec_protocol_metadata_peers_are_equal';
function sec_protocol_metadata_challenge_parameters_are_equal
  (metadataA: sec_protocol_metadata_t; metadataB: sec_protocol_metadata_t)
  : Integer; cdecl; external libSecurity name _PU +
  'sec_protocol_metadata_challenge_parameters_are_equal';
function sec_protocol_metadata_create_secret(metadata: sec_protocol_metadata_t;
  label_len: LongWord; &label: MarshaledAString; exporter_length: LongWord)
  : dispatch_data_t; cdecl;
  external libSecurity name _PU + 'sec_protocol_metadata_create_secret';
function sec_protocol_metadata_create_secret_with_context
  (metadata: sec_protocol_metadata_t; label_len: LongWord;
  &label: MarshaledAString; context_len: LongWord; context: PByte;
  exporter_length: LongWord): dispatch_data_t; cdecl;
  external libSecurity name _PU +
  'sec_protocol_metadata_create_secret_with_context';
function SecRandomCopyBytes(rnd: SecRandomRef; count: LongWord; bytes: Pointer)
  : Integer; cdecl; external libSecurity name _PU + 'SecRandomCopyBytes';
procedure SecAddSharedWebCredential(fqdn: CFStringRef; account: CFStringRef;
  password: CFStringRef; completionHandler: TSecurityCompletionHandler); cdecl;
  external libSecurity name _PU + 'SecAddSharedWebCredential';
procedure SecRequestSharedWebCredential(fqdn: CFStringRef; account: CFStringRef;
  completionHandler: TSecurityCompletionHandler1); cdecl;
  external libSecurity name _PU + 'SecRequestSharedWebCredential';
function SecCreateSharedWebCredentialPassword: CFStringRef; cdecl;
  external libSecurity name _PU + 'SecCreateSharedWebCredentialPassword';
function SSLContextGetTypeID: CFTypeID; cdecl;
  external libSecurity name _PU + 'SSLContextGetTypeID';
function SSLCreateContext(alloc: CFAllocatorRef; protocolSide: SSLProtocolSide;
  connectionType: SSLConnectionType): SSLContextRef; cdecl;
  external libSecurity name _PU + 'SSLCreateContext';
function SSLGetSessionState(context: SSLContextRef; state: PSSLSessionState)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLGetSessionState';
function SSLSetSessionOption(context: SSLContextRef; option: SSLSessionOption;
  value: Boolean): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetSessionOption';
function SSLGetSessionOption(context: SSLContextRef; option: SSLSessionOption;
  value: PBoolean): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetSessionOption';
function SSLSetIOFuncs(context: SSLContextRef; readFunc: SSLReadFunc;
  writeFunc: SSLWriteFunc): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetIOFuncs';
function SSLSetSessionConfig(context: SSLContextRef; config: CFStringRef)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLSetSessionConfig';
function SSLSetProtocolVersionMin(context: SSLContextRef;
  minVersion: SSLProtocol): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetProtocolVersionMin';
function SSLGetProtocolVersionMin(context: SSLContextRef;
  minVersion: PSSLProtocol): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetProtocolVersionMin';
function SSLSetProtocolVersionMax(context: SSLContextRef;
  maxVersion: SSLProtocol): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetProtocolVersionMax';
function SSLGetProtocolVersionMax(context: SSLContextRef;
  maxVersion: PSSLProtocol): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetProtocolVersionMax';
function SSLSetCertificate(context: SSLContextRef; certRefs: CFArrayRef)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLSetCertificate';
function SSLSetConnection(context: SSLContextRef; connection: SSLConnectionRef)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLSetConnection';
function SSLGetConnection(context: SSLContextRef; connection: PSSLConnectionRef)
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
function SSLCopyRequestedPeerNameLength(ctx: SSLContextRef;
  peerNameLen: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLCopyRequestedPeerNameLength';
function SSLCopyRequestedPeerName(context: SSLContextRef;
  peerName: MarshaledAString; peerNameLen: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLCopyRequestedPeerName';
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
  protocol: PSSLProtocol): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetNegotiatedProtocolVersion';
function SSLGetNumberSupportedCiphers(context: SSLContextRef;
  numCiphers: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetNumberSupportedCiphers';
function SSLGetSupportedCiphers(context: SSLContextRef;
  ciphers: PSSLCipherSuite; numCiphers: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetSupportedCiphers';
function SSLGetNumberEnabledCiphers(context: SSLContextRef;
  numCiphers: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetNumberEnabledCiphers';
function SSLSetEnabledCiphers(context: SSLContextRef; ciphers: PSSLCipherSuite;
  numCiphers: LongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetEnabledCiphers';
function SSLGetEnabledCiphers(context: SSLContextRef; ciphers: PSSLCipherSuite;
  numCiphers: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetEnabledCiphers';
function SSLSetSessionTicketsEnabled(context: SSLContextRef; enabled: Boolean)
  : OSStatus; cdecl; external libSecurity name _PU +
  'SSLSetSessionTicketsEnabled';
function SSLCopyPeerTrust(context: SSLContextRef; trust: PSecTrustRef)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLCopyPeerTrust';
function SSLSetPeerID(context: SSLContextRef; peerID: Pointer;
  peerIDLen: LongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetPeerID';
function SSLGetPeerID(context: SSLContextRef; peerID: Pointer;
  peerIDLen: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetPeerID';
function SSLGetNegotiatedCipher(context: SSLContextRef;
  ciphersuite: PSSLCipherSuite): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetNegotiatedCipher';
function SSLSetALPNProtocols(context: SSLContextRef; protocols: CFArrayRef)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLSetALPNProtocols';
function SSLCopyALPNProtocols(context: SSLContextRef; protocols: PCFArrayRef)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLCopyALPNProtocols';
function SSLSetOCSPResponse(context: SSLContextRef; response: CFDataRef)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLSetOCSPResponse';
function SSLSetEncryptionCertificate(context: SSLContextRef;
  certRefs: CFArrayRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetEncryptionCertificate';
function SSLSetClientSideAuthenticate(context: SSLContextRef;
  auth: SSLAuthenticate): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetClientSideAuthenticate';
function SSLAddDistinguishedName(context: SSLContextRef; derDN: Pointer;
  derDNLen: LongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLAddDistinguishedName';
function SSLCopyDistinguishedNames(context: SSLContextRef; names: PCFArrayRef)
  : OSStatus; cdecl; external libSecurity name _PU +
  'SSLCopyDistinguishedNames';
function SSLGetClientCertificateState(context: SSLContextRef;
  clientState: PSSLClientCertificateState): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLGetClientCertificateState';
function SSLHandshake(context: SSLContextRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLHandshake';
function SSLReHandshake(context: SSLContextRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLReHandshake';
function SSLWrite(context: SSLContextRef; data: Pointer; dataLength: LongWord;
  processed: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLWrite';
function SSLRead(context: SSLContextRef; data: Pointer; dataLength: LongWord;
  processed: PLongWord): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLRead';
function SSLGetBufferedReadSize(context: SSLContextRef; bufferSize: PLongWord)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLGetBufferedReadSize';
function SSLGetDatagramWriteSize(dtlsContext: SSLContextRef; bufSize: PLongWord)
  : OSStatus; cdecl; external libSecurity name _PU + 'SSLGetDatagramWriteSize';
function SSLClose(context: SSLContextRef): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLClose';
function SSLSetError(context: SSLContextRef; status: OSStatus): OSStatus; cdecl;
  external libSecurity name _PU + 'SSLSetError';

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

function kSecImportExportKeychain: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecImportExportKeychain');
end;

function kSecImportExportAccess: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecImportExportAccess');
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

function kSecClassInternetPassword: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecClassInternetPassword');
end;

function kSecClassGenericPassword: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecClassGenericPassword');
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

function kSecAttrAccess: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAccess');
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

function kSecAttrSynchronizableAny: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrSynchronizableAny');
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

function kSecAttrIsSensitive: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrIsSensitive');
end;

function kSecAttrIsExtractable: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrIsExtractable');
end;

function kSecAttrApplicationTag: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrApplicationTag');
end;

function kSecAttrKeyType: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyType');
end;

function kSecAttrPRF: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrPRF');
end;

function kSecAttrSalt: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrSalt');
end;

function kSecAttrRounds: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrRounds');
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

function kSecAttrPersistantReference: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrPersistantReference');
end;

function kSecAttrPersistentReference: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrPersistentReference');
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

function kSecAttrKeyTypeDSA: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyTypeDSA');
end;

function kSecAttrKeyTypeAES: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyTypeAES');
end;

function kSecAttrKeyTypeDES: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyTypeDES');
end;

function kSecAttrKeyType3DES: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyType3DES');
end;

function kSecAttrKeyTypeRC4: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyTypeRC4');
end;

function kSecAttrKeyTypeRC2: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyTypeRC2');
end;

function kSecAttrKeyTypeCAST: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyTypeCAST');
end;

function kSecAttrKeyTypeECDSA: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyTypeECDSA');
end;

function kSecAttrKeyTypeEC: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyTypeEC');
end;

function kSecAttrKeyTypeECSECPrimeRandom: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrKeyTypeECSECPrimeRandom');
end;

function kSecAttrPRFHmacAlgSHA1: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrPRFHmacAlgSHA1');
end;

function kSecAttrPRFHmacAlgSHA224: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrPRFHmacAlgSHA224');
end;

function kSecAttrPRFHmacAlgSHA256: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrPRFHmacAlgSHA256');
end;

function kSecAttrPRFHmacAlgSHA384: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrPRFHmacAlgSHA384');
end;

function kSecAttrPRFHmacAlgSHA512: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrPRFHmacAlgSHA512');
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

function kSecMatchSubjectStartsWith: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchSubjectStartsWith');
end;

function kSecMatchSubjectEndsWith: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchSubjectEndsWith');
end;

function kSecMatchSubjectWholeString: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchSubjectWholeString');
end;

function kSecMatchCaseInsensitive: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchCaseInsensitive');
end;

function kSecMatchDiacriticInsensitive: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchDiacriticInsensitive');
end;

function kSecMatchWidthInsensitive: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecMatchWidthInsensitive');
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

function kSecUseKeychain: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecUseKeychain');
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

function kSecUseDataProtectionKeychain: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecUseDataProtectionKeychain');
end;

function kSecUseUserIndependentKeychain: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecUseUserIndependentKeychain');
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

function kSecAttrAccessGroupToken: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecAttrAccessGroupToken');
end;

function kSecPrivateKeyAttrs: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPrivateKeyAttrs');
end;

function kSecPublicKeyAttrs: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPublicKeyAttrs');
end;

function kSecKeyAlgorithmRSASignatureRaw: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecKeyAlgorithmRSASignatureRaw');
end;

function kSecKeyAlgorithmRSASignatureDigestPKCS1v15Raw: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureDigestPKCS1v15Raw');
end;

function kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA1: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA1');
end;

function kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA224: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA224');
end;

function kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA256: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA256');
end;

function kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA384: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA384');
end;

function kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA512: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA512');
end;

function kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA1: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA1');
end;

function kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA224: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA224');
end;

function kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA256: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA256');
end;

function kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA384: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA384');
end;

function kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA512: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA512');
end;

function kSecKeyAlgorithmRSASignatureDigestPSSSHA1: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureDigestPSSSHA1');
end;

function kSecKeyAlgorithmRSASignatureDigestPSSSHA224: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureDigestPSSSHA224');
end;

function kSecKeyAlgorithmRSASignatureDigestPSSSHA256: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureDigestPSSSHA256');
end;

function kSecKeyAlgorithmRSASignatureDigestPSSSHA384: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureDigestPSSSHA384');
end;

function kSecKeyAlgorithmRSASignatureDigestPSSSHA512: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureDigestPSSSHA512');
end;

function kSecKeyAlgorithmRSASignatureMessagePSSSHA1: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureMessagePSSSHA1');
end;

function kSecKeyAlgorithmRSASignatureMessagePSSSHA224: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureMessagePSSSHA224');
end;

function kSecKeyAlgorithmRSASignatureMessagePSSSHA256: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureMessagePSSSHA256');
end;

function kSecKeyAlgorithmRSASignatureMessagePSSSHA384: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureMessagePSSSHA384');
end;

function kSecKeyAlgorithmRSASignatureMessagePSSSHA512: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSASignatureMessagePSSSHA512');
end;

function kSecKeyAlgorithmECDSASignatureRFC4754: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDSASignatureRFC4754');
end;

function kSecKeyAlgorithmECDSASignatureDigestX962: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDSASignatureDigestX962');
end;

function kSecKeyAlgorithmECDSASignatureDigestX962SHA1: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDSASignatureDigestX962SHA1');
end;

function kSecKeyAlgorithmECDSASignatureDigestX962SHA224: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDSASignatureDigestX962SHA224');
end;

function kSecKeyAlgorithmECDSASignatureDigestX962SHA256: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDSASignatureDigestX962SHA256');
end;

function kSecKeyAlgorithmECDSASignatureDigestX962SHA384: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDSASignatureDigestX962SHA384');
end;

function kSecKeyAlgorithmECDSASignatureDigestX962SHA512: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDSASignatureDigestX962SHA512');
end;

function kSecKeyAlgorithmECDSASignatureMessageX962SHA1: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDSASignatureMessageX962SHA1');
end;

function kSecKeyAlgorithmECDSASignatureMessageX962SHA224: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDSASignatureMessageX962SHA224');
end;

function kSecKeyAlgorithmECDSASignatureMessageX962SHA256: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDSASignatureMessageX962SHA256');
end;

function kSecKeyAlgorithmECDSASignatureMessageX962SHA384: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDSASignatureMessageX962SHA384');
end;

function kSecKeyAlgorithmECDSASignatureMessageX962SHA512: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDSASignatureMessageX962SHA512');
end;

function kSecKeyAlgorithmRSAEncryptionRaw: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecKeyAlgorithmRSAEncryptionRaw');
end;

function kSecKeyAlgorithmRSAEncryptionPKCS1: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSAEncryptionPKCS1');
end;

function kSecKeyAlgorithmRSAEncryptionOAEPSHA1: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSAEncryptionOAEPSHA1');
end;

function kSecKeyAlgorithmRSAEncryptionOAEPSHA224: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSAEncryptionOAEPSHA224');
end;

function kSecKeyAlgorithmRSAEncryptionOAEPSHA256: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSAEncryptionOAEPSHA256');
end;

function kSecKeyAlgorithmRSAEncryptionOAEPSHA384: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSAEncryptionOAEPSHA384');
end;

function kSecKeyAlgorithmRSAEncryptionOAEPSHA512: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSAEncryptionOAEPSHA512');
end;

function kSecKeyAlgorithmRSAEncryptionOAEPSHA1AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSAEncryptionOAEPSHA1AESGCM');
end;

function kSecKeyAlgorithmRSAEncryptionOAEPSHA224AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSAEncryptionOAEPSHA224AESGCM');
end;

function kSecKeyAlgorithmRSAEncryptionOAEPSHA256AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSAEncryptionOAEPSHA256AESGCM');
end;

function kSecKeyAlgorithmRSAEncryptionOAEPSHA384AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSAEncryptionOAEPSHA384AESGCM');
end;

function kSecKeyAlgorithmRSAEncryptionOAEPSHA512AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmRSAEncryptionOAEPSHA512AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionStandardX963SHA1AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionStandardX963SHA1AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionStandardX963SHA224AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionStandardX963SHA224AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionStandardX963SHA256AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionStandardX963SHA256AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionStandardX963SHA384AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionStandardX963SHA384AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionStandardX963SHA512AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionStandardX963SHA512AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionCofactorX963SHA1AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionCofactorX963SHA1AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionCofactorX963SHA224AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionCofactorX963SHA224AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionCofactorX963SHA256AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionCofactorX963SHA256AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionCofactorX963SHA384AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionCofactorX963SHA384AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionCofactorX963SHA512AESGCM: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionCofactorX963SHA512AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA224AESGCM
  : Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA224AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM
  : Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA384AESGCM
  : Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA384AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA512AESGCM
  : Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA512AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionCofactorVariableIVX963SHA224AESGCM
  : Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionCofactorVariableIVX963SHA224AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionCofactorVariableIVX963SHA256AESGCM
  : Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionCofactorVariableIVX963SHA256AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionCofactorVariableIVX963SHA384AESGCM
  : Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionCofactorVariableIVX963SHA384AESGCM');
end;

function kSecKeyAlgorithmECIESEncryptionCofactorVariableIVX963SHA512AESGCM
  : Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECIESEncryptionCofactorVariableIVX963SHA512AESGCM');
end;

function kSecKeyAlgorithmECDHKeyExchangeStandard: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDHKeyExchangeStandard');
end;

function kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA1: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA1');
end;

function kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA224: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA224');
end;

function kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA256: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA256');
end;

function kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA384: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA384');
end;

function kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA512: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA512');
end;

function kSecKeyAlgorithmECDHKeyExchangeCofactor: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDHKeyExchangeCofactor');
end;

function kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA1: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA1');
end;

function kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA224: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA224');
end;

function kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA256: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA256');
end;

function kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA384: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA384');
end;

function kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA512: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyAlgorithmECDHKeyExchangeCofactorX963SHA512');
end;

function kSecKeyKeyExchangeParameterRequestedSize: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyKeyExchangeParameterRequestedSize');
end;

function kSecKeyKeyExchangeParameterSharedInfo: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecKeyKeyExchangeParameterSharedInfo');
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

function kSecPolicyApplePassbookSigning: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyApplePassbookSigning');
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

function kSecPolicyTeamIdentifier: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecPolicyTeamIdentifier');
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

function kSecTrustCertificateTransparencyWhiteList: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSecTrustCertificateTransparencyWhiteList');
end;

function kSecRandomDefault: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecRandomDefault');
end;

function kSecSharedPassword: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSecSharedPassword');
end;

function kSSLSessionConfig_default: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSSLSessionConfig_default');
end;

function kSSLSessionConfig_ATSv1: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSSLSessionConfig_ATSv1');
end;

function kSSLSessionConfig_ATSv1_noPFS: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSSLSessionConfig_ATSv1_noPFS');
end;

function kSSLSessionConfig_standard: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSSLSessionConfig_standard');
end;

function kSSLSessionConfig_RC4_fallback: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSSLSessionConfig_RC4_fallback');
end;

function kSSLSessionConfig_TLSv1_fallback: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSSLSessionConfig_TLSv1_fallback');
end;

function kSSLSessionConfig_TLSv1_RC4_fallback: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSSLSessionConfig_TLSv1_RC4_fallback');
end;

function kSSLSessionConfig_legacy: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSSLSessionConfig_legacy');
end;

function kSSLSessionConfig_legacy_DHE: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSSLSessionConfig_legacy_DHE');
end;

function kSSLSessionConfig_anonymous: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSSLSessionConfig_anonymous');
end;

function kSSLSessionConfig_3DES_fallback: Pointer;
begin
  result := CocoaPointerConst(libSecurity, 'kSSLSessionConfig_3DES_fallback');
end;

function kSSLSessionConfig_TLSv1_3DES_fallback: Pointer;
begin
  result := CocoaPointerConst(libSecurity,
    'kSSLSessionConfig_TLSv1_3DES_fallback');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

SecurityModule := dlopen(MarshaledAString(libSecurity), RTLD_LAZY);

finalization

dlclose(SecurityModule);
{$ENDIF IOS}

end.
