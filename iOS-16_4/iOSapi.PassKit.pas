{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework PassKit
//

unit iOSapi.PassKit;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.AddressBook,
  iOSapi.CocoaTypes,
  iOSapi.Contacts,
  iOSapi.CoreGraphics,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  PKPaymentAuthorizationStatusSuccess = 0;
  PKPaymentAuthorizationStatusFailure = 1;
  PKPaymentAuthorizationStatusInvalidBillingPostalAddress = 2;
  PKPaymentAuthorizationStatusInvalidShippingPostalAddress = 3;
  PKPaymentAuthorizationStatusInvalidShippingContact = 4;
  PKPaymentAuthorizationStatusPINRequired = 5;
  PKPaymentAuthorizationStatusPINIncorrect = 6;
  PKPaymentAuthorizationStatusPINLockout = 7;
  PKPaymentButtonStyleWhite = 0;
  PKPaymentButtonStyleWhiteOutline = 1;
  PKPaymentButtonStyleBlack = 2;
  PKPaymentButtonStyleAutomatic = 3;
  PKPaymentButtonTypePlain = 0;
  PKPaymentButtonTypeBuy = 1;
  PKPaymentButtonTypeSetUp = 2;
  PKPaymentButtonTypeInStore = 3;
  PKPaymentButtonTypeDonate = 4;
  PKPaymentButtonTypeCheckout = 5;
  PKPaymentButtonTypeBook = 6;
  PKPaymentButtonTypeSubscribe = 7;
  PKPaymentButtonTypeReload = 8;
  PKPaymentButtonTypeAddMoney = 9;
  PKPaymentButtonTypeTopUp = 10;
  PKPaymentButtonTypeOrder = 11;
  PKPaymentButtonTypeRent = 12;
  PKPaymentButtonTypeSupport = 13;
  PKPaymentButtonTypeContribute = 14;
  PKPaymentButtonTypeTip = 15;
  PKPaymentButtonTypeContinue = 16;
  PKRadioTechnologyNone = 0;
  PKRadioTechnologyNFC = 1 shl 0;
  PKRadioTechnologyBluetooth = 1 shl 1;
  PKPassTypeBarcode = 0;
  PKPassTypeSecureElement = 1;
  PKPassTypePayment = PKPassTypeSecureElement;
  PKPassTypeAny = not NSUInteger(0);
  PKSecureElementPassActivationStateActivated = 0;
  PKSecureElementPassActivationStateRequiresActivation = 1;
  PKSecureElementPassActivationStateActivating = 2;
  PKSecureElementPassActivationStateSuspended = 3;
  PKSecureElementPassActivationStateDeactivated = 4;
  PKPaymentPassActivationStateActivated = 0;
  PKPaymentPassActivationStateRequiresActivation = 1;
  PKPaymentPassActivationStateActivating = 2;
  PKPaymentPassActivationStateSuspended = 3;
  PKPaymentPassActivationStateDeactivated = 4;
  PKUnknownError = -1;
  PKInvalidDataError = 1;
  PKUnsupportedVersionError = 2;
  PKInvalidSignature = 3;
  PKNotEntitledError = 4;
  PKPaymentUnknownError = -1;
  PKPaymentShippingContactInvalidError = 1;
  PKPaymentBillingContactInvalidError = 2;
  PKPaymentShippingAddressUnserviceableError = 3;
  PKPaymentCouponCodeInvalidError = 4;
  PKPaymentCouponCodeExpiredError = 5;
  PKAddPaymentPassErrorUnsupported = 0;
  PKAddPaymentPassErrorUserCancelled = 1;
  PKAddPaymentPassErrorSystemCancelled = 2;
  PKAddSecureElementPassUnknownError = 0;
  PKAddSecureElementPassUserCanceledError = 1;
  PKAddSecureElementPassUnavailableError = 2;
  PKAddSecureElementPassInvalidConfigurationError = 3;
  PKAddSecureElementPassDeviceNotSupportedError = 4;
  PKAddSecureElementPassDeviceNotReadyError = 5;
  PKAddSecureElementPassOSVersionNotSupportedError = 6;
  PKShareSecureElementPassUnknownError = 0;
  PKShareSecureElementPassSetupError = 1;
  PKPassLibraryDidAddPasses = 0;
  PKPassLibraryShouldReviewPasses = 1;
  PKPassLibraryDidCancelAddPasses = 2;
  PKAutomaticPassPresentationSuppressionResultNotSupported = 0;
  PKAutomaticPassPresentationSuppressionResultAlreadyPresenting = 1;
  PKAutomaticPassPresentationSuppressionResultDenied = 2;
  PKAutomaticPassPresentationSuppressionResultCancelled = 3;
  PKAutomaticPassPresentationSuppressionResultSuccess = 4;
  PKPaymentSummaryItemTypeFinal = 0;
  PKPaymentSummaryItemTypePending = 1;
  PKMerchantCapability3DS = 1 shl 0;
  PKMerchantCapabilityEMV = 1 shl 1;
  PKMerchantCapabilityCredit = 1 shl 2;
  PKMerchantCapabilityDebit = 1 shl 3;
  PKAddressFieldNone = 0;
  PKAddressFieldPostalAddress = 1 shl 0;
  PKAddressFieldPhone = 1 shl 1;
  PKAddressFieldEmail = 1 shl 2;
  PKAddressFieldName = 1 shl 3;
  PKAddressFieldAll = (PKAddressFieldPostalAddress or PKAddressFieldPhone or
    PKAddressFieldEmail or PKAddressFieldName);
  PKShippingTypeShipping = 0;
  PKShippingTypeDelivery = 1;
  PKShippingTypeStorePickup = 2;
  PKShippingTypeServicePickup = 3;
  PKShippingContactEditingModeEnabled = 1;
  PKShippingContactEditingModeStorePickup = 2;
  PKPaymentMethodTypeUnknown = 0;
  PKPaymentMethodTypeDebit = 1;
  PKPaymentMethodTypeCredit = 2;
  PKPaymentMethodTypePrepaid = 3;
  PKPaymentMethodTypeStore = 4;
  PKPaymentMethodTypeEMoney = 5;
  PKAddPassButtonStyleBlack = 0;
  PKAddPassButtonStyleBlackOutline = 1;
  PKAddPaymentPassStylePayment = 0;
  PKAddPaymentPassStyleAccess = 1;
  PKDisbursementRequestScheduleOneTime = 0;
  PKDisbursementRequestScheduleFuture = 1;
  PKBarcodeEventConfigurationDataTypeUnknown = 0;
  PKBarcodeEventConfigurationDataTypeSigningKeyMaterial = 1;
  PKBarcodeEventConfigurationDataTypeSigningCertificate = 2;
  PKAddShareablePassConfigurationPrimaryActionAdd = 0;
  PKAddShareablePassConfigurationPrimaryActionShare = 1;
  PKIssuerProvisioningExtensionAuthorizationResultCanceled = 0;
  PKIssuerProvisioningExtensionAuthorizationResultAuthorized = 1;
  PKShareSecureElementPassResultCanceled = 0;
  PKShareSecureElementPassResultShared = 1;
  PKShareSecureElementPassResultFailed = 2;
  PKVehicleConnectionErrorCodeUnknown = 0;
  PKVehicleConnectionErrorCodeSessionUnableToStart = 1;
  PKVehicleConnectionErrorCodeSessionNotActive = 2;
  PKVehicleConnectionSessionConnectionStateDisconnected = 0;
  PKVehicleConnectionSessionConnectionStateConnected = 1;
  PKVehicleConnectionSessionConnectionStateConnecting = 2;
  PKVehicleConnectionSessionConnectionStateFailedToConnect = 3;
  PKIdentityErrorUnknown = 0;
  PKIdentityErrorNotSupported = 1;
  PKIdentityErrorCancelled = 2;
  PKIdentityErrorNetworkUnavailable = 3;
  PKIdentityErrorNoElementsRequested = 4;
  PKIdentityErrorRequestAlreadyInProgress = 5;
  PKIdentityErrorInvalidNonce = 6;
  PKIdentityErrorInvalidElement = 7;
  PKIdentityButtonStyleBlack = 0;
  PKIdentityButtonStyleBlackOutline = 1;
  PKIdentityButtonLabelVerifyIdentity = 0;
  PKIdentityButtonLabelVerify = 1;
  PKIdentityButtonLabelVerifyAge = 2;
  PKIdentityButtonLabelContinue = 3;

type

  // ===== Forward declarations =====
{$M+}
  PKObject = interface;
  PKPaymentPass = interface;
  PKSecureElementPass = interface;
  PKPass = interface;
  PKPassLibrary = interface;
  PKLabeledValue = interface;
  PKContact = interface;
  PKStoredValuePassBalance = interface;
  PKStoredValuePassProperties = interface;
  PKTransitPassProperties = interface;
  PKSuicaPassProperties = interface;
  PKDateComponentsRange = interface;
  PKPaymentSummaryItem = interface;
  PKDeferredPaymentSummaryItem = interface;
  PKRecurringPaymentSummaryItem = interface;
  PKShippingMethod = interface;
  PKAutomaticReloadPaymentSummaryItem = interface;
  PKAutomaticReloadPaymentRequest = interface;
  PKRecurringPaymentRequest = interface;
  PKDeferredPaymentRequest = interface;
  PKPaymentTokenContext = interface;
  PKPaymentRequest = interface;
  PKPaymentMerchantSession = interface;
  PKPaymentOrderDetails = interface;
  PKPaymentAuthorizationResult = interface;
  PKPaymentRequestUpdate = interface;
  PKPaymentRequestShippingContactUpdate = interface;
  PKPaymentRequestShippingMethodUpdate = interface;
  PKPaymentRequestPaymentMethodUpdate = interface;
  PKPaymentRequestMerchantSessionUpdate = interface;
  PKPaymentRequestCouponCodeUpdate = interface;
  PKPaymentMethod = interface;
  PKPaymentToken = interface;
  PKPayment = interface;
  PKPaymentAuthorizationViewController = interface;
  PKPaymentAuthorizationViewControllerDelegate = interface;
  PKPaymentAuthorizationController = interface;
  PKPaymentAuthorizationControllerDelegate = interface;
  PKAddPassButton = interface;
  PKPaymentButton = interface;
  PKAddPassesViewController = interface;
  PKAddPassesViewControllerDelegate = interface;
  PKAddPaymentPassRequestConfiguration = interface;
  PKAddPaymentPassRequest = interface;
  PKAddPaymentPassViewController = interface;
  PKAddPaymentPassViewControllerDelegate = interface;
  PKDisbursementVoucher = interface;
  PKDisbursementRequest = interface;
  PKDisbursementAuthorizationController = interface;
  PKDisbursementAuthorizationControllerDelegate = interface;
  PKBarcodeEventMetadataRequest = interface;
  PKBarcodeEventMetadataResponse = interface;
  PKBarcodeEventSignatureRequest = interface;
  PKBarcodeEventSignatureResponse = interface;
  PKBarcodeEventConfigurationRequest = interface;
  PKPaymentInformationEventExtension = interface;
  PKPaymentInformationRequestHandling = interface;
  PKAddSecureElementPassConfiguration = interface;
  PKAddSecureElementPassViewController = interface;
  PKAddSecureElementPassViewControllerDelegate = interface;
  PKAddCarKeyPassConfiguration = interface;
  PKShareablePassMetadataPreview = interface;
  PKShareablePassMetadata = interface;
  PKAddShareablePassConfiguration = interface;
  PKIssuerProvisioningExtensionAuthorizationProviding = interface;
  PKIssuerProvisioningExtensionStatus = interface;
  PKIssuerProvisioningExtensionPassEntry = interface;
  PKIssuerProvisioningExtensionHandler = interface;
  PKIssuerProvisioningExtensionPaymentPassEntry = interface;
  PKShareSecureElementPassViewController = interface;
  PKShareSecureElementPassViewControllerDelegate = interface;
  PKVehicleConnectionDelegate = interface;
  PKVehicleConnectionSession = interface;
  PKIdentityDocument = interface;
  PKIdentityRequest = interface;
  PKIdentityDocumentDescriptor = interface;
  PKIdentityAuthorizationController = interface;
  PKIdentityElement = interface;
  PKIdentityIntentToStore = interface;
  PKIdentityDriversLicenseDescriptor = interface;
  PKIdentityButton = interface;

  // ===== Framework typedefs =====
{$M+}
  PKEncryptionScheme = NSString;
  PPKEncryptionScheme = ^PKEncryptionScheme;
  PKPaymentNetwork = NSString;
  PPKPaymentNetwork = ^PKPaymentNetwork;
  PKContactField = NSString;
  PPKContactField = ^PKContactField;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  PKPaymentAuthorizationStatus = NSInteger;
  PKPaymentButtonStyle = NSInteger;
  PKPaymentButtonType = NSInteger;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  PKRadioTechnology = NSUInteger;
  PKPassType = NSUInteger;
  PKSecureElementPassActivationState = NSInteger;
  PKPaymentPassActivationState = NSUInteger;
  PKPassKitErrorCode = NSInteger;
  PKPaymentErrorCode = NSInteger;
  PKPaymentErrorKey = NSString;
  PPKPaymentErrorKey = ^PKPaymentErrorKey;
  PKAddPaymentPassError = NSInteger;
  PKAddSecureElementPassErrorCode = NSInteger;
  PKShareSecureElementPassErrorCode = NSInteger;
  PKPassLibraryAddPassesStatus = NSInteger;
  PKAutomaticPassPresentationSuppressionResult = NSUInteger;
  PKSuppressionRequestToken = NSUInteger;
  PPKSuppressionRequestToken = ^PKSuppressionRequestToken;
  TPassKitResponseHandler = procedure
    (param1: PKAutomaticPassPresentationSuppressionResult) of object;
  TPassKitWithCompletionHandler = procedure
    (param1: PKPassLibraryAddPassesStatus) of object;
  TPassKitCompletion = procedure(param1: Boolean; param2: NSError) of object;
  TPassKitCompletion1 = procedure(param1: NSData; param2: NSData;
    param3: NSError) of object;
  TPassKitCompletion2 = procedure(param1: NSDictionary; param2: NSError)
    of object;
  TPassKitCompletion3 = procedure(param1: NSData; param2: NSError) of object;
  PKPassLibraryNotificationName = NSString;
  PPKPassLibraryNotificationName = ^PKPassLibraryNotificationName;
  PKPassLibraryNotificationKey = NSString;
  PPKPassLibraryNotificationKey = ^PKPassLibraryNotificationKey;
  PKStoredValuePassBalanceType = NSString;
  PPKStoredValuePassBalanceType = ^PKStoredValuePassBalanceType;
  PKPaymentSummaryItemType = NSUInteger;
  NSCalendarUnit = NSUInteger;
  PKMerchantCapability = NSUInteger;
  PKAddressField = NSUInteger;
  PKShippingType = NSUInteger;
  PKShippingContactEditingMode = NSUInteger;
  CFTypeRef = Pointer;
  PCFTypeRef = ^CFTypeRef;
  ABRecordRef = CFTypeRef;
  PABRecordRef = ^ABRecordRef;
  PKPaymentMethodType = NSUInteger;
  TPassKitHandler = procedure(param1: PKPaymentAuthorizationResult) of object;
  TPassKitDidRequestMerchantSessionUpdate = procedure
    (param1: PKPaymentRequestMerchantSessionUpdate) of object;
  TPassKitHandler1 = procedure(param1: PKPaymentRequestCouponCodeUpdate)
    of object;
  TPassKitHandler2 = procedure(param1: PKPaymentRequestShippingMethodUpdate)
    of object;
  TPassKitHandler3 = procedure(param1: PKPaymentRequestShippingContactUpdate)
    of object;
  TPassKitHandler4 = procedure(param1: PKPaymentRequestPaymentMethodUpdate)
    of object;
  TPassKitCompletion4 = procedure(param1: PKPaymentAuthorizationStatus)
    of object;
  TPassKitCompletion5 = procedure(param1: PKPaymentAuthorizationStatus;
    param2: NSArray) of object;
  TPassKitCompletion6 = procedure(param1: PKPaymentAuthorizationStatus;
    param2: NSArray; param3: NSArray) of object;
  TPassKitCompletion7 = procedure(param1: NSArray) of object;
  TPassKitCompletion8 = procedure(param1: Boolean) of object;
  TPassKitCompletion9 = procedure() of object;
  PKAddPassButtonStyle = NSInteger;
  CGFloat = Single;
  PCGFloat = ^CGFloat;

  PKAddPaymentPassStyle = NSInteger;
  TPassKitCompletionHandler = procedure(param1: PKAddPaymentPassRequest)
    of object;
  PKDisbursementRequestSchedule = NSInteger;
  PKBarcodeEventConfigurationDataType = NSInteger;
  PKInformationRequestCompletionBlock = procedure
    (param1: PKBarcodeEventMetadataResponse) of object;
  PKSignatureRequestCompletionBlock = procedure
    (param1: PKBarcodeEventSignatureResponse) of object;
  CGImageRef = Pointer;
  PCGImageRef = ^CGImageRef;
  PKAddShareablePassConfigurationPrimaryAction = NSUInteger;
  TPassKitCompletion10 = procedure(param1: PKAddShareablePassConfiguration;
    param2: NSError) of object;
  PKIssuerProvisioningExtensionAuthorizationResult = NSInteger;
  TPassKitCompletionHandler1 = procedure
    (param1: PKIssuerProvisioningExtensionAuthorizationResult) of object;
  TPassKitCompletion11 = procedure(param1: PKIssuerProvisioningExtensionStatus)
    of object;
  PKShareSecureElementPassResult = NSInteger;
  PKVehicleConnectionErrorCode = NSInteger;
  PKVehicleConnectionSessionConnectionState = NSInteger;
  TPassKitCompletion12 = procedure(param1: PKVehicleConnectionSession;
    param2: NSError) of object;
  TPassKitCompletion13 = procedure(param1: PKIdentityDocument; param2: NSError)
    of object;
  NSErrorDomain = NSString;
  PNSErrorDomain = ^NSErrorDomain;
  PKIdentityError = NSInteger;
  PKIdentityButtonStyle = NSInteger;
  PKIdentityButtonLabel = NSInteger;
  // ===== Interface declarations =====

  PKObjectClass = interface(NSObjectClass)
    ['{445EB337-71F8-4633-BE7C-626A6A713DB8}']
  end;

  PKObject = interface(NSObject)
    ['{97F78562-B809-44FA-834E-0AC05EE524D9}']
  end;

  TPKObject = class(TOCGenericImport<PKObjectClass, PKObject>)
  end;

  PPKObject = Pointer;

  PKPassClass = interface(PKObjectClass)
    ['{C2BEF8DA-EF0F-4EAA-B8F8-299DD9526013}']
  end;

  PKPass = interface(PKObject)
    ['{8AF73A47-AB81-4F13-98E1-6A1A9A8C8D47}']
    function initWithData(data: NSData; error: NSError)
      : Pointer { instancetype }; cdecl;
    function passType: PKPassType; cdecl;
    function paymentPass: PKPaymentPass; cdecl;
    function secureElementPass: PKSecureElementPass; cdecl;
    function serialNumber: NSString; cdecl;
    function passTypeIdentifier: NSString; cdecl;
    function webServiceURL: NSURL; cdecl;
    function authenticationToken: NSString; cdecl;
    function icon: UIImage; cdecl;
    function localizedName: NSString; cdecl;
    function localizedDescription: NSString; cdecl;
    function organizationName: NSString; cdecl;
    function relevantDate: NSDate; cdecl;
    function userInfo: NSDictionary; cdecl;
    function passURL: NSURL; cdecl;
    function isRemotePass: Boolean; cdecl;
    function deviceName: NSString; cdecl;
    function localizedValueForFieldKey(key: NSString): Pointer; cdecl;
  end;

  TPKPass = class(TOCGenericImport<PKPassClass, PKPass>)
  end;

  PPKPass = Pointer;

  PKSecureElementPassClass = interface(PKPassClass)
    ['{E556A056-4E4E-4F03-A729-29B83CA5C93A}']
  end;

  PKSecureElementPass = interface(PKPass)
    ['{D4FF1425-B98E-4EED-8F5C-E4CD27C82D85}']
    function primaryAccountIdentifier: NSString; cdecl;
    function primaryAccountNumberSuffix: NSString; cdecl;
    function deviceAccountIdentifier: NSString; cdecl;
    function deviceAccountNumberSuffix: NSString; cdecl;
    function passActivationState: PKSecureElementPassActivationState; cdecl;
    function devicePassIdentifier: NSString; cdecl;
    function pairedTerminalIdentifier: NSString; cdecl;
  end;

  TPKSecureElementPass = class(TOCGenericImport<PKSecureElementPassClass,
    PKSecureElementPass>)
  end;

  PPKSecureElementPass = Pointer;

  PKPaymentPassClass = interface(PKSecureElementPassClass)
    ['{8BDC8767-55C3-4A3A-81CF-B4D6168DD602}']
  end;

  PKPaymentPass = interface(PKSecureElementPass)
    ['{5E3F1004-A060-4BCC-85FC-25B7467682D3}']
    function activationState: PKPaymentPassActivationState; cdecl;
  end;

  TPKPaymentPass = class(TOCGenericImport<PKPaymentPassClass, PKPaymentPass>)
  end;

  PPKPaymentPass = Pointer;

  PKPassLibraryClass = interface(NSObjectClass)
    ['{55F5ED2F-3E0E-44E9-9E6B-D01598C3DA73}']
    { class } function isPassLibraryAvailable: Boolean; cdecl;
    { class } function
      requestAutomaticPassPresentationSuppressionWithResponseHandler
      (responseHandler: TPassKitResponseHandler)
      : PKSuppressionRequestToken; cdecl;
    { class } procedure endAutomaticPassPresentationSuppressionWithRequestToken
      (requestToken: PKSuppressionRequestToken); cdecl;
    { class } function isSuppressingAutomaticPassPresentation: Boolean; cdecl;
    { class } function isPaymentPassActivationAvailable: Boolean; cdecl;
  end;

  PKPassLibrary = interface(NSObject)
    ['{73D3FAB3-99DE-499C-B00F-1AECFE2A261D}']
    function isPaymentPassActivationAvailable: Boolean; cdecl;
    function isSecureElementPassActivationAvailable: Boolean; cdecl;
    function passes: NSArray; cdecl;
    function passWithPassTypeIdentifier(identifier: NSString;
      serialNumber: NSString): PKPass; cdecl;
    function passesOfType(passType: PKPassType): NSArray; cdecl;
    function remotePaymentPasses: NSArray; cdecl;
    function remoteSecureElementPasses: NSArray; cdecl;
    procedure removePass(pass: PKPass); cdecl;
    function containsPass(pass: PKPass): Boolean; cdecl;
    function replacePassWithPass(pass: PKPass): Boolean; cdecl;
    procedure addPasses(passes: NSArray;
      withCompletionHandler: TPassKitWithCompletionHandler); cdecl;
    procedure openPaymentSetup; cdecl;
    procedure presentPaymentPass(pass: PKPaymentPass); cdecl;
    procedure presentSecureElementPass(pass: PKSecureElementPass); cdecl;
    function canAddPaymentPassWithPrimaryAccountIdentifier
      (primaryAccountIdentifier: NSString): Boolean; cdecl;
    function canAddSecureElementPassWithPrimaryAccountIdentifier
      (primaryAccountIdentifier: NSString): Boolean; cdecl;
    function canAddFelicaPass: Boolean; cdecl;
    [MethodName('activatePaymentPass:withActivationData:completion:')]
    procedure activatePaymentPassWithActivationDataCompletion
      (paymentPass: PKPaymentPass; withActivationData: NSData;
      completion: TPassKitCompletion); cdecl;
    [MethodName('activatePaymentPass:withActivationCode:completion:')]
    procedure activatePaymentPassWithActivationCodeCompletion
      (paymentPass: PKPaymentPass; withActivationCode: NSString;
      completion: TPassKitCompletion); cdecl;
    procedure activateSecureElementPass(secureElementPass: PKSecureElementPass;
      withActivationData: NSData; completion: TPassKitCompletion); cdecl;
    procedure signData(signData: NSData;
      withSecureElementPass: PKSecureElementPass;
      completion: TPassKitCompletion1); cdecl;
    procedure encryptedServiceProviderDataForSecureElementPass(secureElementPass
      : PKSecureElementPass; completion: TPassKitCompletion2); cdecl;
    procedure serviceProviderDataForSecureElementPass(secureElementPass
      : PKSecureElementPass; completion: TPassKitCompletion3); cdecl;
  end;

  TPKPassLibrary = class(TOCGenericImport<PKPassLibraryClass, PKPassLibrary>)
  end;

  PPKPassLibrary = Pointer;

  PKLabeledValueClass = interface(NSObjectClass)
    ['{379FEB3A-5CA6-4D99-BAC5-BA872B79A122}']
  end;

  PKLabeledValue = interface(NSObject)
    ['{A3307ADE-10B8-4C6C-83EF-2CD1CC111E87}']
    function initWithLabel(&label: NSString; value: NSString)
      : Pointer { instancetype }; cdecl;
    function &label: NSString; cdecl;
    function value: NSString; cdecl;
  end;

  TPKLabeledValue = class(TOCGenericImport<PKLabeledValueClass, PKLabeledValue>)
  end;

  PPKLabeledValue = Pointer;

  PKContactClass = interface(NSObjectClass)
    ['{F1BC1BF5-1227-4A3C-810B-12D902DC5180}']
  end;

  PKContact = interface(NSObject)
    ['{E842EF42-BF2D-4E5F-84CD-6E8DF459EF61}']
    procedure setName(name: NSPersonNameComponents); cdecl;
    function name: NSPersonNameComponents; cdecl;
    procedure setPostalAddress(postalAddress: CNPostalAddress); cdecl;
    function postalAddress: CNPostalAddress; cdecl;
    procedure setPhoneNumber(phoneNumber: CNPhoneNumber); cdecl;
    function phoneNumber: CNPhoneNumber; cdecl;
    procedure setEmailAddress(emailAddress: NSString); cdecl;
    function emailAddress: NSString; cdecl;
    procedure setSupplementarySubLocality(supplementarySubLocality
      : NSString); cdecl;
    function supplementarySubLocality: NSString; cdecl;
  end;

  TPKContact = class(TOCGenericImport<PKContactClass, PKContact>)
  end;

  PPKContact = Pointer;

  PKStoredValuePassBalanceClass = interface(NSObjectClass)
    ['{50A27267-C00C-41BA-816A-E5D1C8F26A11}']
  end;

  PKStoredValuePassBalance = interface(NSObject)
    ['{96496063-AA59-4E0C-9C6C-B74B4BDB5437}']
    function amount: NSDecimalNumber; cdecl;
    function currencyCode: NSString; cdecl;
    function balanceType: PKStoredValuePassBalanceType; cdecl;
    function expiryDate: NSDate; cdecl;
    function isEqualToBalance(balance: PKStoredValuePassBalance)
      : Boolean; cdecl;
  end;

  TPKStoredValuePassBalance = class
    (TOCGenericImport<PKStoredValuePassBalanceClass, PKStoredValuePassBalance>)
  end;

  PPKStoredValuePassBalance = Pointer;

  PKStoredValuePassPropertiesClass = interface(NSObjectClass)
    ['{ED591774-8EA9-4B0B-8D36-C915F373B2E8}']
    { class } function passPropertiesForPass(pass: PKPass)
      : Pointer { instancetype }; cdecl;
  end;

  PKStoredValuePassProperties = interface(NSObject)
    ['{DD6D5CE5-6B85-43C7-AF28-DAB0AF6A5AE1}']
    function isBlacklisted: Boolean; cdecl;
    function isBlocked: Boolean; cdecl;
    function expirationDate: NSDate; cdecl;
    function balances: NSArray; cdecl;
  end;

  TPKStoredValuePassProperties = class
    (TOCGenericImport<PKStoredValuePassPropertiesClass,
    PKStoredValuePassProperties>)
  end;

  PPKStoredValuePassProperties = Pointer;

  PKTransitPassPropertiesClass = interface(PKStoredValuePassPropertiesClass)
    ['{66461F3D-EF9B-4F41-9AB9-6F94B1AFE91B}']
  end;

  PKTransitPassProperties = interface(PKStoredValuePassProperties)
    ['{F874D9C3-3FF0-4746-B021-614A00C38A13}']
    function transitBalance: NSDecimalNumber; cdecl;
    function transitBalanceCurrencyCode: NSString; cdecl;
    function isBlacklisted: Boolean; cdecl;
    function expirationDate: NSDate; cdecl;
    function isBlocked: Boolean; cdecl;
    function isInStation: Boolean; cdecl;
  end;

  TPKTransitPassProperties = class
    (TOCGenericImport<PKTransitPassPropertiesClass, PKTransitPassProperties>)
  end;

  PPKTransitPassProperties = Pointer;

  PKSuicaPassPropertiesClass = interface(PKTransitPassPropertiesClass)
    ['{4E412781-9D2E-461D-8DB1-AE9C4A85D5CB}']
    { class } function passPropertiesForPass(pass: PKPass)
      : Pointer { instancetype }; cdecl;
  end;

  PKSuicaPassProperties = interface(PKTransitPassProperties)
    ['{D0EDC79D-DBC5-4821-8662-E71540C4D741}']
    function transitBalance: NSDecimalNumber; cdecl;
    function transitBalanceCurrencyCode: NSString; cdecl;
    function isInStation: Boolean; cdecl;
    function isInShinkansenStation: Boolean; cdecl;
    function isBalanceAllowedForCommute: Boolean; cdecl;
    function isLowBalanceGateNotificationEnabled: Boolean; cdecl;
    function isGreenCarTicketUsed: Boolean; cdecl;
    function isBlacklisted: Boolean; cdecl;
  end;

  TPKSuicaPassProperties = class(TOCGenericImport<PKSuicaPassPropertiesClass,
    PKSuicaPassProperties>)
  end;

  PPKSuicaPassProperties = Pointer;

  PKDateComponentsRangeClass = interface(NSObjectClass)
    ['{6168002F-731A-4492-9399-04DDC3E72264}']
  end;

  PKDateComponentsRange = interface(NSObject)
    ['{AA1ADF5F-B7D7-4FD3-8A3E-3DCE75757669}']
    function initWithStartDateComponents(startDateComponents: NSDateComponents;
      endDateComponents: NSDateComponents): Pointer { instancetype }; cdecl;
    function startDateComponents: NSDateComponents; cdecl;
    function endDateComponents: NSDateComponents; cdecl;
  end;

  TPKDateComponentsRange = class(TOCGenericImport<PKDateComponentsRangeClass,
    PKDateComponentsRange>)
  end;

  PPKDateComponentsRange = Pointer;

  PKPaymentSummaryItemClass = interface(NSObjectClass)
    ['{70A69810-DE41-46FB-AF03-B18274DFE5B5}']
    [MethodName('summaryItemWithLabel:amount:')]
    { class } function summaryItemWithLabelAmount(&label: NSString;
      amount: NSDecimalNumber): Pointer { instancetype }; cdecl;
    [MethodName('summaryItemWithLabel:amount:type:')]
    { class } function summaryItemWithLabelAmountType(&label: NSString;
      amount: NSDecimalNumber; &type: PKPaymentSummaryItemType)
      : Pointer { instancetype }; cdecl;
  end;

  PKPaymentSummaryItem = interface(NSObject)
    ['{F968785A-1B56-48CA-A9A8-29E3116107FB}']
    procedure setLabel(&label: NSString); cdecl;
    function &label: NSString; cdecl;
    procedure setAmount(amount: NSDecimalNumber); cdecl;
    function amount: NSDecimalNumber; cdecl;
    procedure setType(&type: PKPaymentSummaryItemType); cdecl;
    function &type: PKPaymentSummaryItemType; cdecl;
  end;

  TPKPaymentSummaryItem = class(TOCGenericImport<PKPaymentSummaryItemClass,
    PKPaymentSummaryItem>)
  end;

  PPKPaymentSummaryItem = Pointer;

  PKDeferredPaymentSummaryItemClass = interface(PKPaymentSummaryItemClass)
    ['{82A848AB-5044-4C96-99BA-94EF28BF0673}']
  end;

  PKDeferredPaymentSummaryItem = interface(PKPaymentSummaryItem)
    ['{A8543D6D-6AB4-49D2-BDB5-9B2BB9BF54E1}']
    procedure setDeferredDate(deferredDate: NSDate); cdecl;
    function deferredDate: NSDate; cdecl;
  end;

  TPKDeferredPaymentSummaryItem = class
    (TOCGenericImport<PKDeferredPaymentSummaryItemClass,
    PKDeferredPaymentSummaryItem>)
  end;

  PPKDeferredPaymentSummaryItem = Pointer;

  PKRecurringPaymentSummaryItemClass = interface(PKPaymentSummaryItemClass)
    ['{FC1B4053-7C08-484C-BE2B-D62085F40A29}']
  end;

  PKRecurringPaymentSummaryItem = interface(PKPaymentSummaryItem)
    ['{C86AFD75-D3D1-4936-81C8-D4334ACF0583}']
    procedure setStartDate(startDate: NSDate); cdecl;
    function startDate: NSDate; cdecl;
    procedure setIntervalUnit(intervalUnit: NSCalendarUnit); cdecl;
    function intervalUnit: NSCalendarUnit; cdecl;
    procedure setIntervalCount(intervalCount: NSInteger); cdecl;
    function intervalCount: NSInteger; cdecl;
    procedure setEndDate(endDate: NSDate); cdecl;
    function endDate: NSDate; cdecl;
  end;

  TPKRecurringPaymentSummaryItem = class
    (TOCGenericImport<PKRecurringPaymentSummaryItemClass,
    PKRecurringPaymentSummaryItem>)
  end;

  PPKRecurringPaymentSummaryItem = Pointer;

  PKShippingMethodClass = interface(PKPaymentSummaryItemClass)
    ['{F55C7A9F-B242-4790-8FA9-1DA2EE91DC24}']
  end;

  PKShippingMethod = interface(PKPaymentSummaryItem)
    ['{A530D465-DAC7-4A43-8CDE-CB62F895C4B1}']
    procedure setIdentifier(identifier: NSString); cdecl;
    function identifier: NSString; cdecl;
    procedure setDetail(detail: NSString); cdecl;
    function detail: NSString; cdecl;
    procedure setDateComponentsRange(dateComponentsRange
      : PKDateComponentsRange); cdecl;
    function dateComponentsRange: PKDateComponentsRange; cdecl;
  end;

  TPKShippingMethod = class(TOCGenericImport<PKShippingMethodClass,
    PKShippingMethod>)
  end;

  PPKShippingMethod = Pointer;

  PKAutomaticReloadPaymentSummaryItemClass = interface
    (PKPaymentSummaryItemClass)
    ['{A7618B32-CBB2-46FB-8CAA-E8FC8FB4947B}']
  end;

  PKAutomaticReloadPaymentSummaryItem = interface(PKPaymentSummaryItem)
    ['{117F0274-2DB1-489B-827A-D5255A909671}']
    procedure setThresholdAmount(thresholdAmount: NSDecimalNumber); cdecl;
    function thresholdAmount: NSDecimalNumber; cdecl;
  end;

  TPKAutomaticReloadPaymentSummaryItem = class
    (TOCGenericImport<PKAutomaticReloadPaymentSummaryItemClass,
    PKAutomaticReloadPaymentSummaryItem>)
  end;

  PPKAutomaticReloadPaymentSummaryItem = Pointer;

  PKAutomaticReloadPaymentRequestClass = interface(NSObjectClass)
    ['{89F9A115-EA3B-463A-AD7E-D9B3D4AD6B12}']
  end;

  PKAutomaticReloadPaymentRequest = interface(NSObject)
    ['{F00C6C29-84E5-4ACE-960D-96D086F02109}']
    procedure setPaymentDescription(paymentDescription: NSString); cdecl;
    function paymentDescription: NSString; cdecl;
    procedure setAutomaticReloadBilling(automaticReloadBilling
      : PKAutomaticReloadPaymentSummaryItem); cdecl;
    function automaticReloadBilling: PKAutomaticReloadPaymentSummaryItem; cdecl;
    procedure setBillingAgreement(billingAgreement: NSString); cdecl;
    function billingAgreement: NSString; cdecl;
    procedure setManagementURL(managementURL: NSURL); cdecl;
    function managementURL: NSURL; cdecl;
    procedure setTokenNotificationURL(tokenNotificationURL: NSURL); cdecl;
    function tokenNotificationURL: NSURL; cdecl;
    function initWithPaymentDescription(paymentDescription: NSString;
      automaticReloadBilling: PKAutomaticReloadPaymentSummaryItem;
      managementURL: NSURL): Pointer { instancetype }; cdecl;
  end;

  TPKAutomaticReloadPaymentRequest = class
    (TOCGenericImport<PKAutomaticReloadPaymentRequestClass,
    PKAutomaticReloadPaymentRequest>)
  end;

  PPKAutomaticReloadPaymentRequest = Pointer;

  PKRecurringPaymentRequestClass = interface(NSObjectClass)
    ['{06A9EB50-CCAF-48BE-91AA-1D4F73C96C3B}']
  end;

  PKRecurringPaymentRequest = interface(NSObject)
    ['{26237CAC-CF8C-4CA4-8C9D-A2D214AA0BE2}']
    procedure setPaymentDescription(paymentDescription: NSString); cdecl;
    function paymentDescription: NSString; cdecl;
    procedure setRegularBilling(regularBilling
      : PKRecurringPaymentSummaryItem); cdecl;
    function regularBilling: PKRecurringPaymentSummaryItem; cdecl;
    procedure setTrialBilling(trialBilling
      : PKRecurringPaymentSummaryItem); cdecl;
    function trialBilling: PKRecurringPaymentSummaryItem; cdecl;
    procedure setBillingAgreement(billingAgreement: NSString); cdecl;
    function billingAgreement: NSString; cdecl;
    procedure setManagementURL(managementURL: NSURL); cdecl;
    function managementURL: NSURL; cdecl;
    procedure setTokenNotificationURL(tokenNotificationURL: NSURL); cdecl;
    function tokenNotificationURL: NSURL; cdecl;
    function initWithPaymentDescription(paymentDescription: NSString;
      regularBilling: PKRecurringPaymentSummaryItem; managementURL: NSURL)
      : Pointer { instancetype }; cdecl;
  end;

  TPKRecurringPaymentRequest = class
    (TOCGenericImport<PKRecurringPaymentRequestClass,
    PKRecurringPaymentRequest>)
  end;

  PPKRecurringPaymentRequest = Pointer;

  PKDeferredPaymentRequestClass = interface(NSObjectClass)
    ['{BAA83D91-F3CF-43F4-BB40-E8925E6253F3}']
  end;

  PKDeferredPaymentRequest = interface(NSObject)
    ['{DDCF6CA4-8562-459B-8854-916DDE7C20C6}']
    procedure setPaymentDescription(paymentDescription: NSString); cdecl;
    function paymentDescription: NSString; cdecl;
    procedure setDeferredBilling(deferredBilling
      : PKDeferredPaymentSummaryItem); cdecl;
    function deferredBilling: PKDeferredPaymentSummaryItem; cdecl;
    procedure setBillingAgreement(billingAgreement: NSString); cdecl;
    function billingAgreement: NSString; cdecl;
    procedure setManagementURL(managementURL: NSURL); cdecl;
    function managementURL: NSURL; cdecl;
    procedure setTokenNotificationURL(tokenNotificationURL: NSURL); cdecl;
    function tokenNotificationURL: NSURL; cdecl;
    procedure setFreeCancellationDate(freeCancellationDate: NSDate); cdecl;
    function freeCancellationDate: NSDate; cdecl;
    procedure setFreeCancellationDateTimeZone(freeCancellationDateTimeZone
      : NSTimeZone); cdecl;
    function freeCancellationDateTimeZone: NSTimeZone; cdecl;
    function initWithPaymentDescription(paymentDescription: NSString;
      deferredBilling: PKDeferredPaymentSummaryItem; managementURL: NSURL)
      : Pointer { instancetype }; cdecl;
  end;

  TPKDeferredPaymentRequest = class
    (TOCGenericImport<PKDeferredPaymentRequestClass, PKDeferredPaymentRequest>)
  end;

  PPKDeferredPaymentRequest = Pointer;

  PKPaymentTokenContextClass = interface(NSObjectClass)
    ['{F0F4A7E9-071A-45D0-8439-7A6B74CF301F}']
  end;

  PKPaymentTokenContext = interface(NSObject)
    ['{3E5AA64F-E01F-4546-A5D8-7BDE1481EDEA}']
    procedure setMerchantIdentifier(merchantIdentifier: NSString); cdecl;
    function merchantIdentifier: NSString; cdecl;
    procedure setExternalIdentifier(externalIdentifier: NSString); cdecl;
    function externalIdentifier: NSString; cdecl;
    procedure setMerchantName(merchantName: NSString); cdecl;
    function merchantName: NSString; cdecl;
    procedure setMerchantDomain(merchantDomain: NSString); cdecl;
    function merchantDomain: NSString; cdecl;
    procedure setAmount(amount: NSDecimalNumber); cdecl;
    function amount: NSDecimalNumber; cdecl;
    function initWithMerchantIdentifier(merchantIdentifier: NSString;
      externalIdentifier: NSString; merchantName: NSString;
      merchantDomain: NSString; amount: NSDecimalNumber)
      : Pointer { instancetype }; cdecl;
  end;

  TPKPaymentTokenContext = class(TOCGenericImport<PKPaymentTokenContextClass,
    PKPaymentTokenContext>)
  end;

  PPKPaymentTokenContext = Pointer;

  PKPaymentRequestClass = interface(NSObjectClass)
    ['{65336D11-51A9-4215-8340-401391AA3B65}']
    { class } function availableNetworks: NSArray; cdecl;
    { class } function paymentContactInvalidErrorWithContactField
      (field: PKContactField; localizedDescription: NSString): NSError; cdecl;
    { class } function paymentShippingAddressInvalidErrorWithKey
      (postalAddressKey: NSString; localizedDescription: NSString)
      : NSError; cdecl;
    { class } function paymentBillingAddressInvalidErrorWithKey(postalAddressKey
      : NSString; localizedDescription: NSString): NSError; cdecl;
    { class } function
      paymentShippingAddressUnserviceableErrorWithLocalizedDescription
      (localizedDescription: NSString): NSError; cdecl;
    { class } function paymentCouponCodeInvalidErrorWithLocalizedDescription
      (localizedDescription: NSString): NSError; cdecl;
    { class } function paymentCouponCodeExpiredErrorWithLocalizedDescription
      (localizedDescription: NSString): NSError; cdecl;
  end;

  PKPaymentRequest = interface(NSObject)
    ['{54C35B06-8E3C-4378-837F-2EC82F7642E4}']
    procedure setMerchantIdentifier(merchantIdentifier: NSString); cdecl;
    function merchantIdentifier: NSString; cdecl;
    procedure setCountryCode(countryCode: NSString); cdecl;
    function countryCode: NSString; cdecl;
    procedure setSupportedNetworks(supportedNetworks: NSArray); cdecl;
    function supportedNetworks: NSArray; cdecl;
    procedure setMerchantCapabilities(merchantCapabilities
      : PKMerchantCapability); cdecl;
    function merchantCapabilities: PKMerchantCapability; cdecl;
    procedure setSupportsCouponCode(supportsCouponCode: Boolean); cdecl;
    function supportsCouponCode: Boolean; cdecl;
    procedure setCouponCode(couponCode: NSString); cdecl;
    function couponCode: NSString; cdecl;
    procedure setPaymentSummaryItems(paymentSummaryItems: NSArray); cdecl;
    function paymentSummaryItems: NSArray; cdecl;
    procedure setCurrencyCode(currencyCode: NSString); cdecl;
    function currencyCode: NSString; cdecl;
    procedure setRequiredBillingContactFields(requiredBillingContactFields
      : NSSet); cdecl;
    function requiredBillingContactFields: NSSet; cdecl;
    procedure setRequiredBillingAddressFields(requiredBillingAddressFields
      : PKAddressField); cdecl;
    function requiredBillingAddressFields: PKAddressField; cdecl;
    procedure setBillingContact(billingContact: PKContact); cdecl;
    function billingContact: PKContact; cdecl;
    procedure setRequiredShippingContactFields(requiredShippingContactFields
      : NSSet); cdecl;
    function requiredShippingContactFields: NSSet; cdecl;
    procedure setRequiredShippingAddressFields(requiredShippingAddressFields
      : PKAddressField); cdecl;
    function requiredShippingAddressFields: PKAddressField; cdecl;
    procedure setShippingContact(shippingContact: PKContact); cdecl;
    function shippingContact: PKContact; cdecl;
    procedure setShippingMethods(shippingMethods: NSArray); cdecl;
    function shippingMethods: NSArray; cdecl;
    procedure setShippingType(shippingType: PKShippingType); cdecl;
    function shippingType: PKShippingType; cdecl;
    procedure setShippingContactEditingMode(shippingContactEditingMode
      : PKShippingContactEditingMode); cdecl;
    function shippingContactEditingMode: PKShippingContactEditingMode; cdecl;
    procedure setApplicationData(applicationData: NSData); cdecl;
    function applicationData: NSData; cdecl;
    procedure setSupportedCountries(supportedCountries: NSSet); cdecl;
    function supportedCountries: NSSet; cdecl;
    procedure setShippingAddress(shippingAddress: ABRecordRef); cdecl;
    function shippingAddress: ABRecordRef; cdecl;
    procedure setBillingAddress(billingAddress: ABRecordRef); cdecl;
    function billingAddress: ABRecordRef; cdecl;
    procedure setMultiTokenContexts(multiTokenContexts: NSArray); cdecl;
    function multiTokenContexts: NSArray; cdecl;
    procedure setRecurringPaymentRequest(recurringPaymentRequest
      : PKRecurringPaymentRequest); cdecl;
    function recurringPaymentRequest: PKRecurringPaymentRequest; cdecl;
    procedure setAutomaticReloadPaymentRequest(automaticReloadPaymentRequest
      : PKAutomaticReloadPaymentRequest); cdecl;
    function automaticReloadPaymentRequest
      : PKAutomaticReloadPaymentRequest; cdecl;
    procedure setDeferredPaymentRequest(deferredPaymentRequest
      : PKDeferredPaymentRequest); cdecl;
    function deferredPaymentRequest: PKDeferredPaymentRequest; cdecl;
  end;

  TPKPaymentRequest = class(TOCGenericImport<PKPaymentRequestClass,
    PKPaymentRequest>)
  end;

  PPKPaymentRequest = Pointer;

  PKPaymentMerchantSessionClass = interface(NSObjectClass)
    ['{F4F729F0-B06C-42BE-8A20-4B4800AC5E4D}']
  end;

  PKPaymentMerchantSession = interface(NSObject)
    ['{F8C346A6-97E8-4E50-80BD-A91AA38E5A4D}']
    function initWithDictionary(dictionary: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  TPKPaymentMerchantSession = class
    (TOCGenericImport<PKPaymentMerchantSessionClass, PKPaymentMerchantSession>)
  end;

  PPKPaymentMerchantSession = Pointer;

  PKPaymentOrderDetailsClass = interface(NSObjectClass)
    ['{6859E957-74E3-4136-9ABF-6073A38AA4B2}']
  end;

  PKPaymentOrderDetails = interface(NSObject)
    ['{211977BD-4AA8-4DA5-B888-1744AD4C3D66}']
    function initWithOrderTypeIdentifier(orderTypeIdentifier: NSString;
      orderIdentifier: NSString; webServiceURL: NSURL;
      authenticationToken: NSString): Pointer { instancetype }; cdecl;
    procedure setOrderTypeIdentifier(orderTypeIdentifier: NSString); cdecl;
    function orderTypeIdentifier: NSString; cdecl;
    procedure setOrderIdentifier(orderIdentifier: NSString); cdecl;
    function orderIdentifier: NSString; cdecl;
    procedure setWebServiceURL(webServiceURL: NSURL); cdecl;
    function webServiceURL: NSURL; cdecl;
    procedure setAuthenticationToken(authenticationToken: NSString); cdecl;
    function authenticationToken: NSString; cdecl;
  end;

  TPKPaymentOrderDetails = class(TOCGenericImport<PKPaymentOrderDetailsClass,
    PKPaymentOrderDetails>)
  end;

  PPKPaymentOrderDetails = Pointer;

  PKPaymentAuthorizationResultClass = interface(NSObjectClass)
    ['{623C959E-569A-4038-86C7-B4255A724B1F}']
  end;

  PKPaymentAuthorizationResult = interface(NSObject)
    ['{6EE49594-79D4-4912-B09D-4E3AC81E7A1E}']
    function initWithStatus(status: PKPaymentAuthorizationStatus;
      errors: NSArray): Pointer { instancetype }; cdecl;
    procedure setStatus(status: PKPaymentAuthorizationStatus); cdecl;
    function status: PKPaymentAuthorizationStatus; cdecl;
    procedure setErrors(errors: NSArray); cdecl;
    function errors: NSArray; cdecl;
    procedure setOrderDetails(orderDetails: PKPaymentOrderDetails); cdecl;
    function orderDetails: PKPaymentOrderDetails; cdecl;
  end;

  TPKPaymentAuthorizationResult = class
    (TOCGenericImport<PKPaymentAuthorizationResultClass,
    PKPaymentAuthorizationResult>)
  end;

  PPKPaymentAuthorizationResult = Pointer;

  PKPaymentRequestUpdateClass = interface(NSObjectClass)
    ['{30B3AD09-F699-403F-A956-DAC241F4DDF0}']
  end;

  PKPaymentRequestUpdate = interface(NSObject)
    ['{BDFA646F-749D-4055-8E99-20E55CD9DD16}']
    function initWithPaymentSummaryItems(paymentSummaryItems: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setStatus(status: PKPaymentAuthorizationStatus); cdecl;
    function status: PKPaymentAuthorizationStatus; cdecl;
    procedure setPaymentSummaryItems(paymentSummaryItems: NSArray); cdecl;
    function paymentSummaryItems: NSArray; cdecl;
    procedure setShippingMethods(shippingMethods: NSArray); cdecl;
    function shippingMethods: NSArray; cdecl;
    procedure setMultiTokenContexts(multiTokenContexts: NSArray); cdecl;
    function multiTokenContexts: NSArray; cdecl;
    procedure setRecurringPaymentRequest(recurringPaymentRequest
      : PKRecurringPaymentRequest); cdecl;
    function recurringPaymentRequest: PKRecurringPaymentRequest; cdecl;
    procedure setAutomaticReloadPaymentRequest(automaticReloadPaymentRequest
      : PKAutomaticReloadPaymentRequest); cdecl;
    function automaticReloadPaymentRequest
      : PKAutomaticReloadPaymentRequest; cdecl;
    procedure setDeferredPaymentRequest(deferredPaymentRequest
      : PKDeferredPaymentRequest); cdecl;
    function deferredPaymentRequest: PKDeferredPaymentRequest; cdecl;
  end;

  TPKPaymentRequestUpdate = class(TOCGenericImport<PKPaymentRequestUpdateClass,
    PKPaymentRequestUpdate>)
  end;

  PPKPaymentRequestUpdate = Pointer;

  PKPaymentRequestShippingContactUpdateClass = interface
    (PKPaymentRequestUpdateClass)
    ['{ACC36DDD-CE34-4DF5-8393-539E117D8F32}']
  end;

  PKPaymentRequestShippingContactUpdate = interface(PKPaymentRequestUpdate)
    ['{A5A14DA3-6349-477E-B768-269EE1E3F27C}']
    function initWithErrors(errors: NSArray; paymentSummaryItems: NSArray;
      shippingMethods: NSArray): Pointer { instancetype }; cdecl;
    procedure setShippingMethods(shippingMethods: NSArray); cdecl;
    function shippingMethods: NSArray; cdecl;
    procedure setErrors(errors: NSArray); cdecl;
    function errors: NSArray; cdecl;
  end;

  TPKPaymentRequestShippingContactUpdate = class
    (TOCGenericImport<PKPaymentRequestShippingContactUpdateClass,
    PKPaymentRequestShippingContactUpdate>)
  end;

  PPKPaymentRequestShippingContactUpdate = Pointer;

  PKPaymentRequestShippingMethodUpdateClass = interface
    (PKPaymentRequestUpdateClass)
    ['{E81ABAD5-843B-451D-BBF5-A16EBEBB7575}']
  end;

  PKPaymentRequestShippingMethodUpdate = interface(PKPaymentRequestUpdate)
    ['{D5436AF3-5803-4A06-A710-F196CED5D115}']
  end;

  TPKPaymentRequestShippingMethodUpdate = class
    (TOCGenericImport<PKPaymentRequestShippingMethodUpdateClass,
    PKPaymentRequestShippingMethodUpdate>)
  end;

  PPKPaymentRequestShippingMethodUpdate = Pointer;

  PKPaymentRequestPaymentMethodUpdateClass = interface
    (PKPaymentRequestUpdateClass)
    ['{0D2F5D3A-05C0-4300-AA87-2D68B42FCA2D}']
  end;

  PKPaymentRequestPaymentMethodUpdate = interface(PKPaymentRequestUpdate)
    ['{7EAD355A-E4FA-40D3-B690-51CF422BA312}']
    function initWithErrors(errors: NSArray; paymentSummaryItems: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setErrors(errors: NSArray); cdecl;
    function errors: NSArray; cdecl;
  end;

  TPKPaymentRequestPaymentMethodUpdate = class
    (TOCGenericImport<PKPaymentRequestPaymentMethodUpdateClass,
    PKPaymentRequestPaymentMethodUpdate>)
  end;

  PPKPaymentRequestPaymentMethodUpdate = Pointer;

  PKPaymentRequestMerchantSessionUpdateClass = interface(NSObjectClass)
    ['{CBBAA6C7-BA05-4B4F-8A0F-4A5F061F8C5D}']
  end;

  PKPaymentRequestMerchantSessionUpdate = interface(NSObject)
    ['{EA06113D-EFB8-4DCB-B819-7470782CEABC}']
    function initWithStatus(status: PKPaymentAuthorizationStatus;
      merchantSession: PKPaymentMerchantSession)
      : Pointer { instancetype }; cdecl;
    procedure setStatus(status: PKPaymentAuthorizationStatus); cdecl;
    function status: PKPaymentAuthorizationStatus; cdecl;
    procedure setSession(session: PKPaymentMerchantSession); cdecl;
    function session: PKPaymentMerchantSession; cdecl;
  end;

  TPKPaymentRequestMerchantSessionUpdate = class
    (TOCGenericImport<PKPaymentRequestMerchantSessionUpdateClass,
    PKPaymentRequestMerchantSessionUpdate>)
  end;

  PPKPaymentRequestMerchantSessionUpdate = Pointer;

  PKPaymentRequestCouponCodeUpdateClass = interface(PKPaymentRequestUpdateClass)
    ['{4A0A98D8-0BEC-4E6B-A537-E625FD7007E1}']
  end;

  PKPaymentRequestCouponCodeUpdate = interface(PKPaymentRequestUpdate)
    ['{EC1777A0-817A-478F-B5E1-41B92242D3A8}']
    function initWithErrors(errors: NSArray; paymentSummaryItems: NSArray;
      shippingMethods: NSArray): Pointer { instancetype }; cdecl;
    procedure setErrors(errors: NSArray); cdecl;
    function errors: NSArray; cdecl;
  end;

  TPKPaymentRequestCouponCodeUpdate = class
    (TOCGenericImport<PKPaymentRequestCouponCodeUpdateClass,
    PKPaymentRequestCouponCodeUpdate>)
  end;

  PPKPaymentRequestCouponCodeUpdate = Pointer;

  PKPaymentMethodClass = interface(NSObjectClass)
    ['{C9CDC09B-7269-48F9-8FF0-03DA2ADAB719}']
  end;

  PKPaymentMethod = interface(NSObject)
    ['{8D8E0AE8-7D3C-4E5A-ABB4-D165750F32BA}']
    function displayName: NSString; cdecl;
    function network: PKPaymentNetwork; cdecl;
    function &type: PKPaymentMethodType; cdecl;
    function paymentPass: PKPaymentPass; cdecl;
    function secureElementPass: PKSecureElementPass; cdecl;
    function billingAddress: CNContact; cdecl;
  end;

  TPKPaymentMethod = class(TOCGenericImport<PKPaymentMethodClass,
    PKPaymentMethod>)
  end;

  PPKPaymentMethod = Pointer;

  PKPaymentTokenClass = interface(NSObjectClass)
    ['{7451A683-A0F1-4550-9760-A46D0E7E0AEA}']
  end;

  PKPaymentToken = interface(NSObject)
    ['{9E65BB51-7358-429F-BE14-6D202CB1272B}']
    function paymentMethod: PKPaymentMethod; cdecl;
    function paymentInstrumentName: NSString; cdecl;
    function paymentNetwork: NSString; cdecl;
    function transactionIdentifier: NSString; cdecl;
    function paymentData: NSData; cdecl;
  end;

  TPKPaymentToken = class(TOCGenericImport<PKPaymentTokenClass, PKPaymentToken>)
  end;

  PPKPaymentToken = Pointer;

  PKPaymentClass = interface(NSObjectClass)
    ['{36247928-CBEB-466B-A9FB-40F22F4FF30B}']
  end;

  PKPayment = interface(NSObject)
    ['{532ECFCD-5B40-442D-B9F2-4E103CABF16A}']
    function token: PKPaymentToken; cdecl;
    function billingContact: PKContact; cdecl;
    function billingAddress: ABRecordRef; cdecl;
    function shippingContact: PKContact; cdecl;
    function shippingAddress: ABRecordRef; cdecl;
    function shippingMethod: PKShippingMethod; cdecl;
  end;

  TPKPayment = class(TOCGenericImport<PKPaymentClass, PKPayment>)
  end;

  PPKPayment = Pointer;

  PKPaymentAuthorizationViewControllerClass = interface(UIViewControllerClass)
    ['{D1498B71-D8E2-4C68-AF59-5AF6D801E9AA}']
    { class } function canMakePayments: Boolean; cdecl;
    [MethodName('canMakePaymentsUsingNetworks:')]
    { class } function canMakePaymentsUsingNetworks(supportedNetworks: NSArray)
      : Boolean; cdecl;
    [MethodName('canMakePaymentsUsingNetworks:capabilities:')]
    { class } function canMakePaymentsUsingNetworksCapabilities
      (supportedNetworks: NSArray; capabilities: PKMerchantCapability)
      : Boolean; cdecl;
  end;

  PKPaymentAuthorizationViewController = interface(UIViewController)
    ['{DB80CAB6-4C80-4C52-9878-A6D80164DE38}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function initWithPaymentRequest(request: PKPaymentRequest)
      : Pointer { instancetype }; cdecl;
  end;

  TPKPaymentAuthorizationViewController = class
    (TOCGenericImport<PKPaymentAuthorizationViewControllerClass,
    PKPaymentAuthorizationViewController>)
  end;

  PPKPaymentAuthorizationViewController = Pointer;

  PKPaymentAuthorizationControllerClass = interface(NSObjectClass)
    ['{2885E27F-575D-4042-9805-C1C4B9E2AD5F}']
    { class } function canMakePayments: Boolean; cdecl;
    [MethodName('canMakePaymentsUsingNetworks:')]
    { class } function canMakePaymentsUsingNetworks(supportedNetworks: NSArray)
      : Boolean; cdecl;
    [MethodName('canMakePaymentsUsingNetworks:capabilities:')]
    { class } function canMakePaymentsUsingNetworksCapabilities
      (supportedNetworks: NSArray; capabilities: PKMerchantCapability)
      : Boolean; cdecl;
  end;

  PKPaymentAuthorizationController = interface(NSObject)
    ['{611F998A-C034-4CDC-9923-EBBD08766BF3}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function initWithPaymentRequest(request: PKPaymentRequest)
      : Pointer { instancetype }; cdecl;
    procedure presentWithCompletion(completion: TPassKitCompletion8); cdecl;
    procedure dismissWithCompletion(completion: TPassKitCompletion9); cdecl;
  end;

  TPKPaymentAuthorizationController = class
    (TOCGenericImport<PKPaymentAuthorizationControllerClass,
    PKPaymentAuthorizationController>)
  end;

  PPKPaymentAuthorizationController = Pointer;

  PKAddPassButtonClass = interface(UIButtonClass)
    ['{FC18BFEF-CA7E-4DD2-9ACB-9BABB7D6F6B5}']
    { class } function addPassButtonWithStyle(addPassButtonStyle
      : PKAddPassButtonStyle): Pointer { instancetype }; cdecl;
  end;

  PKAddPassButton = interface(UIButton)
    ['{32747968-BA89-4CB8-8FB4-05DB935C13F8}']
    function initWithAddPassButtonStyle(style: PKAddPassButtonStyle)
      : Pointer { instancetype }; cdecl;
    procedure setAddPassButtonStyle(addPassButtonStyle
      : PKAddPassButtonStyle); cdecl;
    function addPassButtonStyle: PKAddPassButtonStyle; cdecl;
  end;

  TPKAddPassButton = class(TOCGenericImport<PKAddPassButtonClass,
    PKAddPassButton>)
  end;

  PPKAddPassButton = Pointer;

  PKPaymentButtonClass = interface(UIButtonClass)
    ['{A263628C-A34C-41BF-9F9B-34C93DD427FB}']
    { class } function buttonWithType(buttonType: PKPaymentButtonType;
      style: PKPaymentButtonStyle): Pointer { instancetype }; cdecl;
  end;

  PKPaymentButton = interface(UIButton)
    ['{F1AF4B92-860A-4BA3-B038-5A5230D1F432}']
    function initWithPaymentButtonType(&type: PKPaymentButtonType;
      paymentButtonStyle: PKPaymentButtonStyle)
      : Pointer { instancetype }; cdecl;
    procedure setCornerRadius(cornerRadius: CGFloat); cdecl;
    function cornerRadius: CGFloat; cdecl;
  end;

  TPKPaymentButton = class(TOCGenericImport<PKPaymentButtonClass,
    PKPaymentButton>)
  end;

  PPKPaymentButton = Pointer;

  PKAddPassesViewControllerClass = interface(UIViewControllerClass)
    ['{8E3B9856-367D-4C0F-B682-E6845B16373A}']
    { class } function canAddPasses: Boolean; cdecl;
  end;

  PKAddPassesViewController = interface(UIViewController)
    ['{8F03B469-43B5-4131-A7E0-1C68DCBD10DB}']
    function initWithPass(pass: PKPass): Pointer { instancetype }; cdecl;
    function initWithPasses(passes: NSArray): Pointer { instancetype }; cdecl;
    function initWithIssuerData(issuerData: NSData; signature: NSData;
      error: NSError): Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
  end;

  TPKAddPassesViewController = class
    (TOCGenericImport<PKAddPassesViewControllerClass,
    PKAddPassesViewController>)
  end;

  PPKAddPassesViewController = Pointer;

  PKAddPaymentPassRequestConfigurationClass = interface(NSObjectClass)
    ['{EC80FC8C-352A-4DB4-9AFE-048948BC3ED7}']
  end;

  PKAddPaymentPassRequestConfiguration = interface(NSObject)
    ['{38A56EB3-5896-4E35-B598-52EFC91D71AF}']
    function initWithEncryptionScheme(encryptionScheme: PKEncryptionScheme)
      : Pointer { instancetype }; cdecl;
    function encryptionScheme: PKEncryptionScheme; cdecl;
    procedure setStyle(style: PKAddPaymentPassStyle); cdecl;
    function style: PKAddPaymentPassStyle; cdecl;
    procedure setCardholderName(cardholderName: NSString); cdecl;
    function cardholderName: NSString; cdecl;
    procedure setPrimaryAccountSuffix(primaryAccountSuffix: NSString); cdecl;
    function primaryAccountSuffix: NSString; cdecl;
    procedure setCardDetails(cardDetails: NSArray); cdecl;
    function cardDetails: NSArray; cdecl;
    procedure setLocalizedDescription(localizedDescription: NSString); cdecl;
    function localizedDescription: NSString; cdecl;
    procedure setPrimaryAccountIdentifier(primaryAccountIdentifier
      : NSString); cdecl;
    function primaryAccountIdentifier: NSString; cdecl;
    procedure setPaymentNetwork(paymentNetwork: PKPaymentNetwork); cdecl;
    function paymentNetwork: PKPaymentNetwork; cdecl;
    procedure setProductIdentifiers(productIdentifiers: NSSet); cdecl;
    function productIdentifiers: NSSet; cdecl;
    procedure setRequiresFelicaSecureElement(requiresFelicaSecureElement
      : Boolean); cdecl;
    function requiresFelicaSecureElement: Boolean; cdecl;
  end;

  TPKAddPaymentPassRequestConfiguration = class
    (TOCGenericImport<PKAddPaymentPassRequestConfigurationClass,
    PKAddPaymentPassRequestConfiguration>)
  end;

  PPKAddPaymentPassRequestConfiguration = Pointer;

  PKAddPaymentPassRequestClass = interface(NSObjectClass)
    ['{B5C806D1-E7F9-42D9-8CC5-1292E76662A4}']
  end;

  PKAddPaymentPassRequest = interface(NSObject)
    ['{DDE3C8CE-520D-482A-92AA-010CDF571767}']
    function init: Pointer { instancetype }; cdecl;
    procedure setEncryptedPassData(encryptedPassData: NSData); cdecl;
    function encryptedPassData: NSData; cdecl;
    procedure setActivationData(activationData: NSData); cdecl;
    function activationData: NSData; cdecl;
    procedure setEphemeralPublicKey(ephemeralPublicKey: NSData); cdecl;
    function ephemeralPublicKey: NSData; cdecl;
    procedure setWrappedKey(wrappedKey: NSData); cdecl;
    function wrappedKey: NSData; cdecl;
  end;

  TPKAddPaymentPassRequest = class
    (TOCGenericImport<PKAddPaymentPassRequestClass, PKAddPaymentPassRequest>)
  end;

  PPKAddPaymentPassRequest = Pointer;

  PKAddPaymentPassViewControllerClass = interface(UIViewControllerClass)
    ['{CECB36F8-37E8-4CF8-B606-1E9B1CFB6EB8}']
    { class } function canAddPaymentPass: Boolean; cdecl;
  end;

  PKAddPaymentPassViewController = interface(UIViewController)
    ['{C530CEA4-C636-4756-BF8C-0EE7CAF9444B}']
    function initWithRequestConfiguration(configuration
      : PKAddPaymentPassRequestConfiguration; delegate: Pointer)
      : Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
  end;

  TPKAddPaymentPassViewController = class
    (TOCGenericImport<PKAddPaymentPassViewControllerClass,
    PKAddPaymentPassViewController>)
  end;

  PPKAddPaymentPassViewController = Pointer;

  PKDisbursementVoucherClass = interface(NSObjectClass)
    ['{2A822F11-3052-442A-B0C9-34218FACA35A}']
  end;

  PKDisbursementVoucher = interface(NSObject)
    ['{C697814E-0FE9-473A-B399-14A073661AD1}']
    function data: NSData; cdecl;
    function redemptionURL: NSURL; cdecl;
  end;

  TPKDisbursementVoucher = class(TOCGenericImport<PKDisbursementVoucherClass,
    PKDisbursementVoucher>)
  end;

  PPKDisbursementVoucher = Pointer;

  PKDisbursementRequestClass = interface(NSObjectClass)
    ['{6539A8DD-A12B-4455-A9AD-480EA984A24F}']
  end;

  PKDisbursementRequest = interface(NSObject)
    ['{22BA7AF9-9F7A-4270-8F67-448FB9E11466}']
    procedure setAmount(amount: NSDecimalNumber); cdecl;
    function amount: NSDecimalNumber; cdecl;
    procedure setCurrencyCode(currencyCode: NSString); cdecl;
    function currencyCode: NSString; cdecl;
    procedure setCountryCode(countryCode: NSString); cdecl;
    function countryCode: NSString; cdecl;
    procedure setRequestSchedule(requestSchedule
      : PKDisbursementRequestSchedule); cdecl;
    function requestSchedule: PKDisbursementRequestSchedule; cdecl;
    procedure setSummaryItems(summaryItems: NSArray); cdecl;
    function summaryItems: NSArray; cdecl;
  end;

  TPKDisbursementRequest = class(TOCGenericImport<PKDisbursementRequestClass,
    PKDisbursementRequest>)
  end;

  PPKDisbursementRequest = Pointer;

  PKDisbursementAuthorizationControllerClass = interface(NSObjectClass)
    ['{3BE4D781-6443-4F07-BBCA-A03C58F6A05A}']
    { class } function supportsDisbursements: Boolean; cdecl;
  end;

  PKDisbursementAuthorizationController = interface(NSObject)
    ['{9AF51063-E8B5-4AF6-A35B-8FDB27A4A41F}']
    function initWithDisbursementRequest(disbursementRequest
      : PKDisbursementRequest; delegate: Pointer)
      : Pointer { instancetype }; cdecl;
    function delegate: Pointer; cdecl;
    procedure authorizeDisbursementWithCompletion
      (completion: TPassKitCompletion); cdecl;
  end;

  TPKDisbursementAuthorizationController = class
    (TOCGenericImport<PKDisbursementAuthorizationControllerClass,
    PKDisbursementAuthorizationController>)
  end;

  PPKDisbursementAuthorizationController = Pointer;

  PKBarcodeEventMetadataRequestClass = interface(NSObjectClass)
    ['{CDDD6BB5-49FF-49D7-B826-E3042318A5E2}']
  end;

  PKBarcodeEventMetadataRequest = interface(NSObject)
    ['{4A02BEA4-1FDD-4D3D-A8DA-475A0B509C06}']
    function deviceAccountIdentifier: NSString; cdecl;
    function lastUsedBarcodeIdentifier: NSString; cdecl;
  end;

  TPKBarcodeEventMetadataRequest = class
    (TOCGenericImport<PKBarcodeEventMetadataRequestClass,
    PKBarcodeEventMetadataRequest>)
  end;

  PPKBarcodeEventMetadataRequest = Pointer;

  PKBarcodeEventMetadataResponseClass = interface(NSObjectClass)
    ['{D92CA29F-EF40-4F11-A6E6-B1C02BC84194}']
  end;

  PKBarcodeEventMetadataResponse = interface(NSObject)
    ['{AEDED059-CD1F-44BF-BC13-C33E1B079AD5}']
    function initWithPaymentInformation(paymentInformation: NSData)
      : Pointer { instancetype }; cdecl;
    procedure setPaymentInformation(paymentInformation: NSData); cdecl;
    function paymentInformation: NSData; cdecl;
  end;

  TPKBarcodeEventMetadataResponse = class
    (TOCGenericImport<PKBarcodeEventMetadataResponseClass,
    PKBarcodeEventMetadataResponse>)
  end;

  PPKBarcodeEventMetadataResponse = Pointer;

  PKBarcodeEventSignatureRequestClass = interface(NSObjectClass)
    ['{FE136470-C346-4BB5-A38C-2EEF1C689601}']
  end;

  PKBarcodeEventSignatureRequest = interface(NSObject)
    ['{D2DEB1C0-7D5F-479B-9BDD-EA9C75541F13}']
    function deviceAccountIdentifier: NSString; cdecl;
    function transactionIdentifier: NSString; cdecl;
    function barcodeIdentifier: NSString; cdecl;
    function rawMerchantName: NSString; cdecl;
    function merchantName: NSString; cdecl;
    function transactionDate: NSDate; cdecl;
    function currencyCode: NSString; cdecl;
    function amount: NSNumber; cdecl;
    function transactionStatus: NSString; cdecl;
    function partialSignature: NSData; cdecl;
  end;

  TPKBarcodeEventSignatureRequest = class
    (TOCGenericImport<PKBarcodeEventSignatureRequestClass,
    PKBarcodeEventSignatureRequest>)
  end;

  PPKBarcodeEventSignatureRequest = Pointer;

  PKBarcodeEventSignatureResponseClass = interface(NSObjectClass)
    ['{AE797EC5-4D06-45E8-9C89-DCB971E910BA}']
  end;

  PKBarcodeEventSignatureResponse = interface(NSObject)
    ['{E30BB957-4D76-4BB5-8756-F6EF94855C16}']
    function initWithSignedData(signedData: NSData)
      : Pointer { instancetype }; cdecl;
    procedure setSignedData(signedData: NSData); cdecl;
    function signedData: NSData; cdecl;
  end;

  TPKBarcodeEventSignatureResponse = class
    (TOCGenericImport<PKBarcodeEventSignatureResponseClass,
    PKBarcodeEventSignatureResponse>)
  end;

  PPKBarcodeEventSignatureResponse = Pointer;

  PKBarcodeEventConfigurationRequestClass = interface(NSObjectClass)
    ['{15D4B3E4-8730-4703-B058-A8F022C73549}']
  end;

  PKBarcodeEventConfigurationRequest = interface(NSObject)
    ['{54FD225B-C5D8-4BA7-845B-7CB90CAA3ABC}']
    function deviceAccountIdentifier: NSString; cdecl;
    function configurationData: NSData; cdecl;
    function configurationDataType: PKBarcodeEventConfigurationDataType; cdecl;
  end;

  TPKBarcodeEventConfigurationRequest = class
    (TOCGenericImport<PKBarcodeEventConfigurationRequestClass,
    PKBarcodeEventConfigurationRequest>)
  end;

  PPKBarcodeEventConfigurationRequest = Pointer;

  PKPaymentInformationEventExtensionClass = interface(NSObjectClass)
    ['{16C61078-4699-4063-8A7E-6C505EBB2BD2}']
  end;

  PKPaymentInformationEventExtension = interface(NSObject)
    ['{9E66170F-4216-4F80-BD93-AEF3BE5B224F}']
  end;

  TPKPaymentInformationEventExtension = class
    (TOCGenericImport<PKPaymentInformationEventExtensionClass,
    PKPaymentInformationEventExtension>)
  end;

  PPKPaymentInformationEventExtension = Pointer;

  PKAddSecureElementPassConfigurationClass = interface(NSObjectClass)
    ['{0EDCA912-8639-4830-A0DE-ADD1BEE061EC}']
  end;

  PKAddSecureElementPassConfiguration = interface(NSObject)
    ['{09D8DC1A-BD1B-48B1-B216-AFD32DBAD89B}']
    procedure setIssuerIdentifier(issuerIdentifier: NSString); cdecl;
    function issuerIdentifier: NSString; cdecl;
    procedure setLocalizedDescription(localizedDescription: NSString); cdecl;
    function localizedDescription: NSString; cdecl;
  end;

  TPKAddSecureElementPassConfiguration = class
    (TOCGenericImport<PKAddSecureElementPassConfigurationClass,
    PKAddSecureElementPassConfiguration>)
  end;

  PPKAddSecureElementPassConfiguration = Pointer;

  PKAddSecureElementPassViewControllerClass = interface(UIViewControllerClass)
    ['{17FB070B-332A-47AA-8720-DA06C302E5EE}']
    { class } function canAddSecureElementPassWithConfiguration
      (configuration: PKAddSecureElementPassConfiguration): Boolean; cdecl;
  end;

  PKAddSecureElementPassViewController = interface(UIViewController)
    ['{6CB5F223-094F-4E84-9BA6-466A96132165}']
    function initWithConfiguration(configuration
      : PKAddSecureElementPassConfiguration; delegate: Pointer)
      : Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
  end;

  TPKAddSecureElementPassViewController = class
    (TOCGenericImport<PKAddSecureElementPassViewControllerClass,
    PKAddSecureElementPassViewController>)
  end;

  PPKAddSecureElementPassViewController = Pointer;

  PKAddCarKeyPassConfigurationClass = interface
    (PKAddSecureElementPassConfigurationClass)
    ['{06926ABB-9467-4C88-B76D-79FC0EFB9D5B}']
  end;

  PKAddCarKeyPassConfiguration = interface(PKAddSecureElementPassConfiguration)
    ['{616DFF8C-BA3D-4956-919A-5DD0AEBDBB74}']
    procedure setPassword(password: NSString); cdecl;
    function password: NSString; cdecl;
    procedure setSupportedRadioTechnologies(supportedRadioTechnologies
      : PKRadioTechnology); cdecl;
    function supportedRadioTechnologies: PKRadioTechnology; cdecl;
    procedure setManufacturerIdentifier(manufacturerIdentifier
      : NSString); cdecl;
    function manufacturerIdentifier: NSString; cdecl;
    procedure setProvisioningTemplateIdentifier(provisioningTemplateIdentifier
      : NSString); cdecl;
    function provisioningTemplateIdentifier: NSString; cdecl;
  end;

  TPKAddCarKeyPassConfiguration = class
    (TOCGenericImport<PKAddCarKeyPassConfigurationClass,
    PKAddCarKeyPassConfiguration>)
  end;

  PPKAddCarKeyPassConfiguration = Pointer;

  PKShareablePassMetadataPreviewClass = interface(NSObjectClass)
    ['{8128D1C5-02B3-4C25-ACF4-7AD1360BA1A7}']
    { class } function previewWithPassThumbnail(passThumbnail: CGImageRef;
      localizedDescription: NSString): PKShareablePassMetadataPreview; cdecl;
    { class } function previewWithTemplateIdentifier(templateIdentifier
      : NSString): PKShareablePassMetadataPreview; cdecl;
  end;

  PKShareablePassMetadataPreview = interface(NSObject)
    ['{89A77763-CD0D-4B67-B1E0-C7412B85D75D}']
    function initWithPassThumbnail(passThumbnail: CGImageRef;
      localizedDescription: NSString): Pointer { instancetype }; cdecl;
    function initWithTemplateIdentifier(templateIdentifier: NSString)
      : Pointer { instancetype }; cdecl;
    function passThumbnailImage: CGImageRef; cdecl;
    function localizedDescription: NSString; cdecl;
    procedure setOwnerDisplayName(ownerDisplayName: NSString); cdecl;
    function ownerDisplayName: NSString; cdecl;
    function provisioningTemplateIdentifier: NSString; cdecl;
  end;

  TPKShareablePassMetadataPreview = class
    (TOCGenericImport<PKShareablePassMetadataPreviewClass,
    PKShareablePassMetadataPreview>)
  end;

  PPKShareablePassMetadataPreview = Pointer;

  PKShareablePassMetadataClass = interface(NSObjectClass)
    ['{4176F3E1-FE59-42A4-9B22-426F070C9AA3}']
  end;

  PKShareablePassMetadata = interface(NSObject)
    ['{70E8A421-71F0-4602-AAB3-42D832A8D5C1}']
    [MethodName
      ('initWithProvisioningCredentialIdentifier:cardConfigurationIdentifier:sharingInstanceIdentifier:passThumbnailImage:ownerDisplayName:localizedDescription:')
      ]
    function initWithProvisioningCredentialIdentifierCardConfigurationIdentifierSharingInstanceIdentifierPassThumbnailImageOwnerDisplayNameLocalizedDescription
      (credentialIdentifier: NSString; cardConfigurationIdentifier: NSString;
      sharingInstanceIdentifier: NSString; passThumbnailImage: CGImageRef;
      ownerDisplayName: NSString; localizedDescription: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('initWithProvisioningCredentialIdentifier:sharingInstanceIdentifier:passThumbnailImage:ownerDisplayName:localizedDescription:accountHash:templateIdentifier:relyingPartyIdentifier:requiresUnifiedAccessCapableDevice:')
      ]
    function initWithProvisioningCredentialIdentifierSharingInstanceIdentifierPassThumbnailImageOwnerDisplayNameLocalizedDescriptionAccountHashTemplateIdentifierRelyingPartyIdentifierRequiresUnifiedAccessCapableDevice
      (credentialIdentifier: NSString; sharingInstanceIdentifier: NSString;
      passThumbnailImage: CGImageRef; ownerDisplayName: NSString;
      localizedDescription: NSString; accountHash: NSString;
      templateIdentifier: NSString; relyingPartyIdentifier: NSString;
      requiresUnifiedAccessCapableDevice: Boolean)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('initWithProvisioningCredentialIdentifier:sharingInstanceIdentifier:cardTemplateIdentifier:preview:')
      ]
    function initWithProvisioningCredentialIdentifierSharingInstanceIdentifierCardTemplateIdentifierPreview
      (credentialIdentifier: NSString; sharingInstanceIdentifier: NSString;
      cardTemplateIdentifier: NSString; preview: PKShareablePassMetadataPreview)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('initWithProvisioningCredentialIdentifier:sharingInstanceIdentifier:cardConfigurationIdentifier:preview:')
      ]
    function initWithProvisioningCredentialIdentifierSharingInstanceIdentifierCardConfigurationIdentifierPreview
      (credentialIdentifier: NSString; sharingInstanceIdentifier: NSString;
      cardConfigurationIdentifier: NSString;
      preview: PKShareablePassMetadataPreview): Pointer { instancetype }; cdecl;
    function credentialIdentifier: NSString; cdecl;
    function sharingInstanceIdentifier: NSString; cdecl;
    function templateIdentifier: NSString; cdecl;
    function cardTemplateIdentifier: NSString; cdecl;
    function cardConfigurationIdentifier: NSString; cdecl;
    procedure setRequiresUnifiedAccessCapableDevice
      (requiresUnifiedAccessCapableDevice: Boolean); cdecl;
    function requiresUnifiedAccessCapableDevice: Boolean; cdecl;
    procedure setServerEnvironmentIdentifier(serverEnvironmentIdentifier
      : NSString); cdecl;
    function serverEnvironmentIdentifier: NSString; cdecl;
    function preview: PKShareablePassMetadataPreview; cdecl;
    function passThumbnailImage: CGImageRef; cdecl;
    function localizedDescription: NSString; cdecl;
    function ownerDisplayName: NSString; cdecl;
    procedure setAccountHash(accountHash: NSString); cdecl;
    function accountHash: NSString; cdecl;
    procedure setRelyingPartyIdentifier(relyingPartyIdentifier
      : NSString); cdecl;
    function relyingPartyIdentifier: NSString; cdecl;
  end;

  TPKShareablePassMetadata = class
    (TOCGenericImport<PKShareablePassMetadataClass, PKShareablePassMetadata>)
  end;

  PPKShareablePassMetadata = Pointer;

  PKAddShareablePassConfigurationClass = interface
    (PKAddSecureElementPassConfigurationClass)
    ['{FB2ECD4E-2E52-4DAA-BD75-4CAB070E33B6}']
    [MethodName
      ('configurationForPassMetadata:provisioningPolicyIdentifier:primaryAction:completion:')
      ]
    { class } procedure
      configurationForPassMetadataProvisioningPolicyIdentifierPrimaryActionCompletion
      (passMetadata: NSArray; provisioningPolicyIdentifier: NSString;
      primaryAction: PKAddShareablePassConfigurationPrimaryAction;
      completion: TPassKitCompletion10); cdecl;
    [MethodName('configurationForPassMetadata:primaryAction:completion:')]
    { class } procedure configurationForPassMetadataPrimaryActionCompletion
      (passMetadata: NSArray;
      primaryAction: PKAddShareablePassConfigurationPrimaryAction;
      completion: TPassKitCompletion10); cdecl;
  end;

  PKAddShareablePassConfiguration = interface
    (PKAddSecureElementPassConfiguration)
    ['{1AB507CA-C743-4752-915B-8C5CBCA4C90E}']
    function primaryAction: PKAddShareablePassConfigurationPrimaryAction; cdecl;
    function credentialsMetadata: NSArray; cdecl;
    function provisioningPolicyIdentifier: NSString; cdecl;
  end;

  TPKAddShareablePassConfiguration = class
    (TOCGenericImport<PKAddShareablePassConfigurationClass,
    PKAddShareablePassConfiguration>)
  end;

  PPKAddShareablePassConfiguration = Pointer;

  PKIssuerProvisioningExtensionStatusClass = interface(NSObjectClass)
    ['{6D625657-8EE6-4753-964D-AF2647AFCCA2}']
  end;

  PKIssuerProvisioningExtensionStatus = interface(NSObject)
    ['{A9EB203A-5458-4735-B4CF-DAB568CA3C0E}']
    function init: Pointer { instancetype }; cdecl;
    procedure setRequiresAuthentication(requiresAuthentication: Boolean); cdecl;
    function requiresAuthentication: Boolean; cdecl;
    procedure setPassEntriesAvailable(passEntriesAvailable: Boolean); cdecl;
    function passEntriesAvailable: Boolean; cdecl;
    procedure setRemotePassEntriesAvailable(remotePassEntriesAvailable
      : Boolean); cdecl;
    function remotePassEntriesAvailable: Boolean; cdecl;
  end;

  TPKIssuerProvisioningExtensionStatus = class
    (TOCGenericImport<PKIssuerProvisioningExtensionStatusClass,
    PKIssuerProvisioningExtensionStatus>)
  end;

  PPKIssuerProvisioningExtensionStatus = Pointer;

  PKIssuerProvisioningExtensionPassEntryClass = interface(NSObjectClass)
    ['{B04E1FF1-CB0C-4515-97B3-ACD40A30A914}']
  end;

  PKIssuerProvisioningExtensionPassEntry = interface(NSObject)
    ['{E4134F7C-75A5-4F6C-98F2-427AA6235577}']
    function identifier: NSString; cdecl;
    function title: NSString; cdecl;
    function art: CGImageRef; cdecl;
  end;

  TPKIssuerProvisioningExtensionPassEntry = class
    (TOCGenericImport<PKIssuerProvisioningExtensionPassEntryClass,
    PKIssuerProvisioningExtensionPassEntry>)
  end;

  PPKIssuerProvisioningExtensionPassEntry = Pointer;

  PKIssuerProvisioningExtensionHandlerClass = interface(NSObjectClass)
    ['{EC68C528-C556-4B85-946B-6BAA159EE759}']
  end;

  PKIssuerProvisioningExtensionHandler = interface(NSObject)
    ['{1B0D7A2D-F206-47DD-AAE2-6B7C6B23B63E}']
    procedure statusWithCompletion(completion: TPassKitCompletion11); cdecl;
    procedure passEntriesWithCompletion(completion: TPassKitCompletion7); cdecl;
    procedure remotePassEntriesWithCompletion
      (completion: TPassKitCompletion7); cdecl;
    procedure generateAddPaymentPassRequestForPassEntryWithIdentifier
      (identifier: NSString;
      configuration: PKAddPaymentPassRequestConfiguration;
      certificateChain: NSArray; nonce: NSData; nonceSignature: NSData;
      completionHandler: TPassKitCompletionHandler); cdecl;
  end;

  TPKIssuerProvisioningExtensionHandler = class
    (TOCGenericImport<PKIssuerProvisioningExtensionHandlerClass,
    PKIssuerProvisioningExtensionHandler>)
  end;

  PPKIssuerProvisioningExtensionHandler = Pointer;

  PKIssuerProvisioningExtensionPaymentPassEntryClass = interface
    (PKIssuerProvisioningExtensionPassEntryClass)
    ['{ACB12109-10B3-45EF-AE28-D3B7EC227B6C}']
  end;

  PKIssuerProvisioningExtensionPaymentPassEntry = interface
    (PKIssuerProvisioningExtensionPassEntry)
    ['{4A64C841-2519-41F9-A781-92D7433276E9}']
    function initWithIdentifier(identifier: NSString; title: NSString;
      art: CGImageRef; addRequestConfiguration
      : PKAddPaymentPassRequestConfiguration): Pointer { instancetype }; cdecl;
    function addRequestConfiguration
      : PKAddPaymentPassRequestConfiguration; cdecl;
  end;

  TPKIssuerProvisioningExtensionPaymentPassEntry = class
    (TOCGenericImport<PKIssuerProvisioningExtensionPaymentPassEntryClass,
    PKIssuerProvisioningExtensionPaymentPassEntry>)
  end;

  PPKIssuerProvisioningExtensionPaymentPassEntry = Pointer;

  PKShareSecureElementPassViewControllerClass = interface(UIViewControllerClass)
    ['{439D44F9-84C4-4E6F-A78A-CD7D33F44929}']
  end;

  PKShareSecureElementPassViewController = interface(UIViewController)
    ['{BD77D99C-4D22-4890-814E-31730166ED0E}']
    function initWithSecureElementPass(pass: PKSecureElementPass;
      delegate: Pointer): Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setPromptToShareURL(promptToShareURL: Boolean); cdecl;
    function promptToShareURL: Boolean; cdecl;
  end;

  TPKShareSecureElementPassViewController = class
    (TOCGenericImport<PKShareSecureElementPassViewControllerClass,
    PKShareSecureElementPassViewController>)
  end;

  PPKShareSecureElementPassViewController = Pointer;

  PKVehicleConnectionSessionClass = interface(NSObjectClass)
    ['{DE63CB92-A2DB-436B-9F98-0E47B1DBDE28}']
    { class } procedure sessionForPass(pass: PKSecureElementPass;
      delegate: Pointer; completion: TPassKitCompletion12); cdecl;
  end;

  PKVehicleConnectionSession = interface(NSObject)
    ['{F7426B70-5A29-46D3-8BD2-A551614E319E}']
    function delegate: Pointer; cdecl;
    function connectionStatus: PKVehicleConnectionSessionConnectionState; cdecl;
    function sendData(message: NSData; error: NSError): Boolean; cdecl;
    procedure invalidate; cdecl;
  end;

  TPKVehicleConnectionSession = class
    (TOCGenericImport<PKVehicleConnectionSessionClass,
    PKVehicleConnectionSession>)
  end;

  PPKVehicleConnectionSession = Pointer;

  PKIdentityDocumentClass = interface(NSObjectClass)
    ['{0AACBA40-5D16-4F5F-9DC9-1A5D2E8962FC}']
  end;

  PKIdentityDocument = interface(NSObject)
    ['{3E43E82B-5936-46A5-BF8C-3633CFB31463}']
    function encryptedData: NSData; cdecl;
  end;

  TPKIdentityDocument = class(TOCGenericImport<PKIdentityDocumentClass,
    PKIdentityDocument>)
  end;

  PPKIdentityDocument = Pointer;

  PKIdentityRequestClass = interface(NSObjectClass)
    ['{89812037-2852-4B86-93FE-5102F7E2BFCA}']
  end;

  PKIdentityRequest = interface(NSObject)
    ['{3C4B5C24-D03D-48AD-A7BC-7154DA33C82A}']
    procedure setDescriptor(descriptor: Pointer); cdecl;
    function descriptor: Pointer; cdecl;
    procedure setNonce(nonce: NSData); cdecl;
    function nonce: NSData; cdecl;
    procedure setMerchantIdentifier(merchantIdentifier: NSString); cdecl;
    function merchantIdentifier: NSString; cdecl;
  end;

  TPKIdentityRequest = class(TOCGenericImport<PKIdentityRequestClass,
    PKIdentityRequest>)
  end;

  PPKIdentityRequest = Pointer;

  PKIdentityAuthorizationControllerClass = interface(NSObjectClass)
    ['{90030638-9927-45BF-915D-BBA76F252278}']
  end;

  PKIdentityAuthorizationController = interface(NSObject)
    ['{6C06FA1D-7ED7-4D7F-B782-BB3ABA6BE192}']
    procedure checkCanRequestDocument(descriptor: Pointer;
      completion: TPassKitCompletion8); cdecl;
    procedure requestDocument(request: PKIdentityRequest;
      completion: TPassKitCompletion13); cdecl;
    procedure cancelRequest; cdecl;
  end;

  TPKIdentityAuthorizationController = class
    (TOCGenericImport<PKIdentityAuthorizationControllerClass,
    PKIdentityAuthorizationController>)
  end;

  PPKIdentityAuthorizationController = Pointer;

  PKIdentityElementClass = interface(NSObjectClass)
    ['{EBAF532F-5428-4F58-BBCE-CB2CBF821BC9}']
    { class } function ageThresholdElementWithAge(age: NSInteger)
      : Pointer { instancetype }; cdecl;
  end;

  PKIdentityElement = interface(NSObject)
    ['{714F8474-3169-46CA-9011-05B1485795F9}']
    procedure setGivenNameElement(givenNameElement: PKIdentityElement); cdecl;
    function givenNameElement: PKIdentityElement; cdecl;
    procedure setFamilyNameElement(familyNameElement: PKIdentityElement); cdecl;
    function familyNameElement: PKIdentityElement; cdecl;
    procedure setPortraitElement(portraitElement: PKIdentityElement); cdecl;
    function portraitElement: PKIdentityElement; cdecl;
    procedure setAddressElement(addressElement: PKIdentityElement); cdecl;
    function addressElement: PKIdentityElement; cdecl;
    procedure setIssuingAuthorityElement(issuingAuthorityElement
      : PKIdentityElement); cdecl;
    function issuingAuthorityElement: PKIdentityElement; cdecl;
    procedure setDocumentIssueDateElement(documentIssueDateElement
      : PKIdentityElement); cdecl;
    function documentIssueDateElement: PKIdentityElement; cdecl;
    procedure setDocumentExpirationDateElement(documentExpirationDateElement
      : PKIdentityElement); cdecl;
    function documentExpirationDateElement: PKIdentityElement; cdecl;
    procedure setDocumentNumberElement(documentNumberElement
      : PKIdentityElement); cdecl;
    function documentNumberElement: PKIdentityElement; cdecl;
    procedure setDrivingPrivilegesElement(drivingPrivilegesElement
      : PKIdentityElement); cdecl;
    function drivingPrivilegesElement: PKIdentityElement; cdecl;
    procedure setAgeElement(ageElement: PKIdentityElement); cdecl;
    function ageElement: PKIdentityElement; cdecl;
    procedure setDateOfBirthElement(dateOfBirthElement
      : PKIdentityElement); cdecl;
    function dateOfBirthElement: PKIdentityElement; cdecl;
  end;

  TPKIdentityElement = class(TOCGenericImport<PKIdentityElementClass,
    PKIdentityElement>)
  end;

  PPKIdentityElement = Pointer;

  PKIdentityIntentToStoreClass = interface(NSObjectClass)
    ['{3A2F641B-B2FF-41C0-A245-7C776CE91C78}']
    { class } function mayStoreIntentForDays(days: NSInteger)
      : Pointer { instancetype }; cdecl;
  end;

  PKIdentityIntentToStore = interface(NSObject)
    ['{EB177555-BD7F-4A71-8211-44E48B845853}']
    procedure setWillNotStoreIntent(willNotStoreIntent
      : PKIdentityIntentToStore); cdecl;
    function willNotStoreIntent: PKIdentityIntentToStore; cdecl;
    procedure setMayStoreIntent(mayStoreIntent: PKIdentityIntentToStore); cdecl;
    function mayStoreIntent: PKIdentityIntentToStore; cdecl;
  end;

  TPKIdentityIntentToStore = class
    (TOCGenericImport<PKIdentityIntentToStoreClass, PKIdentityIntentToStore>)
  end;

  PPKIdentityIntentToStore = Pointer;

  PKIdentityDriversLicenseDescriptorClass = interface(NSObjectClass)
    ['{73646D4A-D4EE-42F6-B05E-9C24BB801DC6}']
  end;

  PKIdentityDriversLicenseDescriptor = interface(NSObject)
    ['{47D00E5A-9B9E-41E1-845E-E3662F0B5F2D}']
  end;

  TPKIdentityDriversLicenseDescriptor = class
    (TOCGenericImport<PKIdentityDriversLicenseDescriptorClass,
    PKIdentityDriversLicenseDescriptor>)
  end;

  PPKIdentityDriversLicenseDescriptor = Pointer;

  PKIdentityButtonClass = interface(UIControlClass)
    ['{23E48711-6FCC-4FD3-8F7A-9A39E90F1E23}']
    { class } function buttonWithLabel(&label: PKIdentityButtonLabel;
      style: PKIdentityButtonStyle): Pointer { instancetype }; cdecl;
  end;

  PKIdentityButton = interface(UIControl)
    ['{97CAC7BF-A42C-4294-BD64-013FF0984DA7}']
    function initWithLabel(&label: PKIdentityButtonLabel;
      style: PKIdentityButtonStyle): Pointer { instancetype }; cdecl;
    procedure setCornerRadius(cornerRadius: CGFloat); cdecl;
    function cornerRadius: CGFloat; cdecl;
  end;

  TPKIdentityButton = class(TOCGenericImport<PKIdentityButtonClass,
    PKIdentityButton>)
  end;

  PPKIdentityButton = Pointer;

  // ===== Protocol declarations =====

  PKPaymentAuthorizationViewControllerDelegate = interface(IObjectiveC)
    ['{83D6A674-FA70-4D9A-8740-2EF5C519E8BB}']
    procedure paymentAuthorizationViewControllerDidFinish
      (controller: PKPaymentAuthorizationViewController); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didAuthorizePayment:handler:')]
    procedure paymentAuthorizationViewControllerDidAuthorizePaymentHandler
      (controller: PKPaymentAuthorizationViewController;
      didAuthorizePayment: PKPayment; handler: TPassKitHandler); cdecl;
    procedure paymentAuthorizationViewControllerWillAuthorizePayment
      (controller: PKPaymentAuthorizationViewController); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didRequestMerchantSessionUpdate:')]
    procedure paymentAuthorizationViewControllerDidRequestMerchantSessionUpdate
      (controller: PKPaymentAuthorizationViewController;
      didRequestMerchantSessionUpdate
      : TPassKitDidRequestMerchantSessionUpdate); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didChangeCouponCode:handler:')]
    procedure paymentAuthorizationViewControllerDidChangeCouponCodeHandler
      (controller: PKPaymentAuthorizationViewController;
      didChangeCouponCode: NSString; handler: TPassKitHandler1); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didSelectShippingMethod:handler:')]
    procedure paymentAuthorizationViewControllerDidSelectShippingMethodHandler
      (controller: PKPaymentAuthorizationViewController;
      didSelectShippingMethod: PKShippingMethod;
      handler: TPassKitHandler2); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didSelectShippingContact:handler:')]
    procedure paymentAuthorizationViewControllerDidSelectShippingContactHandler
      (controller: PKPaymentAuthorizationViewController;
      didSelectShippingContact: PKContact; handler: TPassKitHandler3); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didSelectPaymentMethod:handler:')]
    procedure paymentAuthorizationViewControllerDidSelectPaymentMethodHandler
      (controller: PKPaymentAuthorizationViewController;
      didSelectPaymentMethod: PKPaymentMethod;
      handler: TPassKitHandler4); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didAuthorizePayment:completion:')]
    procedure paymentAuthorizationViewControllerDidAuthorizePaymentCompletion
      (controller: PKPaymentAuthorizationViewController;
      didAuthorizePayment: PKPayment; completion: TPassKitCompletion4); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didSelectShippingMethod:completion:')
      ]
    procedure paymentAuthorizationViewControllerDidSelectShippingMethodCompletion
      (controller: PKPaymentAuthorizationViewController;
      didSelectShippingMethod: PKShippingMethod;
      completion: TPassKitCompletion5); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didSelectShippingAddress:completion:')
      ]
    procedure paymentAuthorizationViewControllerDidSelectShippingAddressCompletion
      (controller: PKPaymentAuthorizationViewController;
      didSelectShippingAddress: ABRecordRef;
      completion: TPassKitCompletion6); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didSelectShippingContact:completion:')
      ]
    procedure paymentAuthorizationViewControllerDidSelectShippingContactCompletion
      (controller: PKPaymentAuthorizationViewController;
      didSelectShippingContact: PKContact;
      completion: TPassKitCompletion6); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didSelectPaymentMethod:completion:')]
    procedure paymentAuthorizationViewControllerDidSelectPaymentMethodCompletion
      (controller: PKPaymentAuthorizationViewController;
      didSelectPaymentMethod: PKPaymentMethod;
      completion: TPassKitCompletion7); cdecl;
  end;

  PKPaymentAuthorizationControllerDelegate = interface(IObjectiveC)
    ['{1BC02638-19E7-4682-9080-F4879E39982D}']
    procedure paymentAuthorizationControllerDidFinish
      (controller: PKPaymentAuthorizationController); cdecl;
    [MethodName('paymentAuthorizationController:didAuthorizePayment:handler:')]
    procedure paymentAuthorizationControllerDidAuthorizePaymentHandler
      (controller: PKPaymentAuthorizationController;
      didAuthorizePayment: PKPayment; handler: TPassKitHandler); cdecl;
    [MethodName
      ('paymentAuthorizationController:didAuthorizePayment:completion:')]
    procedure paymentAuthorizationControllerDidAuthorizePaymentCompletion
      (controller: PKPaymentAuthorizationController;
      didAuthorizePayment: PKPayment; completion: TPassKitCompletion4); cdecl;
    procedure paymentAuthorizationControllerWillAuthorizePayment
      (controller: PKPaymentAuthorizationController); cdecl;
    [MethodName
      ('paymentAuthorizationController:didRequestMerchantSessionUpdate:')]
    procedure paymentAuthorizationControllerDidRequestMerchantSessionUpdate
      (controller: PKPaymentAuthorizationController;
      didRequestMerchantSessionUpdate
      : TPassKitDidRequestMerchantSessionUpdate); cdecl;
    [MethodName('paymentAuthorizationController:didChangeCouponCode:handler:')]
    procedure paymentAuthorizationControllerDidChangeCouponCodeHandler
      (controller: PKPaymentAuthorizationController;
      didChangeCouponCode: NSString; handler: TPassKitHandler1); cdecl;
    [MethodName
      ('paymentAuthorizationController:didSelectShippingMethod:handler:')]
    procedure paymentAuthorizationControllerDidSelectShippingMethodHandler
      (controller: PKPaymentAuthorizationController;
      didSelectShippingMethod: PKShippingMethod;
      handler: TPassKitHandler2); cdecl;
    [MethodName
      ('paymentAuthorizationController:didSelectShippingContact:handler:')]
    procedure paymentAuthorizationControllerDidSelectShippingContactHandler
      (controller: PKPaymentAuthorizationController;
      didSelectShippingContact: PKContact; handler: TPassKitHandler3); cdecl;
    [MethodName
      ('paymentAuthorizationController:didSelectPaymentMethod:handler:')]
    procedure paymentAuthorizationControllerDidSelectPaymentMethodHandler
      (controller: PKPaymentAuthorizationController;
      didSelectPaymentMethod: PKPaymentMethod;
      handler: TPassKitHandler4); cdecl;
    [MethodName
      ('paymentAuthorizationController:didSelectShippingMethod:completion:')]
    procedure paymentAuthorizationControllerDidSelectShippingMethodCompletion
      (controller: PKPaymentAuthorizationController;
      didSelectShippingMethod: PKShippingMethod;
      completion: TPassKitCompletion5); cdecl;
    [MethodName
      ('paymentAuthorizationController:didSelectShippingContact:completion:')]
    procedure paymentAuthorizationControllerDidSelectShippingContactCompletion
      (controller: PKPaymentAuthorizationController;
      didSelectShippingContact: PKContact;
      completion: TPassKitCompletion6); cdecl;
    [MethodName
      ('paymentAuthorizationController:didSelectPaymentMethod:completion:')]
    procedure paymentAuthorizationControllerDidSelectPaymentMethodCompletion
      (controller: PKPaymentAuthorizationController;
      didSelectPaymentMethod: PKPaymentMethod;
      completion: TPassKitCompletion7); cdecl;
    function presentationWindowForPaymentAuthorizationController
      (controller: PKPaymentAuthorizationController): UIWindow; cdecl;
  end;

  PKAddPassesViewControllerDelegate = interface(IObjectiveC)
    ['{9EBBD1A9-5F98-48F8-A48E-85F50FC81172}']
    procedure addPassesViewControllerDidFinish
      (controller: PKAddPassesViewController); cdecl;
  end;

  PKAddPaymentPassViewControllerDelegate = interface(IObjectiveC)
    ['{60C38123-6216-41BD-B3C1-1516F150FA3A}']
    [MethodName
      ('addPaymentPassViewController:generateRequestWithCertificateChain:nonce:nonceSignature:completionHandler:')
      ]
    procedure addPaymentPassViewControllerGenerateRequestWithCertificateChainNonceNonceSignatureCompletionHandler
      (controller: PKAddPaymentPassViewController;
      generateRequestWithCertificateChain: NSArray; nonce: NSData;
      nonceSignature: NSData;
      completionHandler: TPassKitCompletionHandler); cdecl;
    [MethodName
      ('addPaymentPassViewController:didFinishAddingPaymentPass:error:')]
    procedure addPaymentPassViewControllerDidFinishAddingPaymentPassError
      (controller: PKAddPaymentPassViewController;
      didFinishAddingPaymentPass: PKPaymentPass; error: NSError); cdecl;
  end;

  PKDisbursementAuthorizationControllerDelegate = interface(IObjectiveC)
    ['{26AD5C90-9ED7-431A-937E-A6666D9D5396}']
    procedure disbursementAuthorizationController
      (controller: PKDisbursementAuthorizationController;
      didAuthorizeWithDisbursementVoucher: PKDisbursementVoucher); cdecl;
    procedure disbursementAuthorizationControllerDidFinish
      (controller: PKDisbursementAuthorizationController); cdecl;
  end;

  PKPaymentInformationRequestHandling = interface(IObjectiveC)
    ['{95D87124-E96C-4E6D-8778-59F4FD44BF1E}']
    procedure handleInformationRequest(infoRequest
      : PKBarcodeEventMetadataRequest;
      completion: PKInformationRequestCompletionBlock); cdecl;
    procedure handleSignatureRequest(signatureRequest
      : PKBarcodeEventSignatureRequest;
      completion: PKSignatureRequestCompletionBlock); cdecl;
    procedure handleConfigurationRequest(configurationRequest
      : PKBarcodeEventConfigurationRequest;
      completion: TPassKitCompletion9); cdecl;
  end;

  PKAddSecureElementPassViewControllerDelegate = interface(IObjectiveC)
    ['{0A1723C7-D449-4D9B-BED2-2215ABCA40BA}']
    [MethodName
      ('addSecureElementPassViewController:didFinishAddingSecureElementPass:error:')
      ]
    procedure addSecureElementPassViewControllerDidFinishAddingSecureElementPassError
      (controller: PKAddSecureElementPassViewController;
      didFinishAddingSecureElementPass: PKSecureElementPass;
      error: NSError); cdecl;
    [MethodName
      ('addSecureElementPassViewController:didFinishAddingSecureElementPasses:error:')
      ]
    procedure addSecureElementPassViewControllerDidFinishAddingSecureElementPassesError
      (controller: PKAddSecureElementPassViewController;
      didFinishAddingSecureElementPasses: NSArray; error: NSError); cdecl;
  end;

  PKIssuerProvisioningExtensionAuthorizationProviding = interface(IObjectiveC)
    ['{A6ACA1FF-3C21-4544-A4A2-9D8C86E61A58}']
    procedure setCompletionHandler(completionHandler
      : TPassKitCompletionHandler1); cdecl;
    function completionHandler: TPassKitCompletionHandler1; cdecl;
  end;

  PKShareSecureElementPassViewControllerDelegate = interface(IObjectiveC)
    ['{B23C30B3-06A9-464B-93FB-88EF58E9C462}']
    [MethodName('shareSecureElementPassViewController:didFinishWithResult:')]
    procedure shareSecureElementPassViewControllerDidFinishWithResult
      (controller: PKShareSecureElementPassViewController;
      didFinishWithResult: PKShareSecureElementPassResult); cdecl;
    [MethodName
      ('shareSecureElementPassViewController:didCreateShareURL:activationCode:')
      ]
    procedure shareSecureElementPassViewControllerDidCreateShareURLActivationCode
      (controller: PKShareSecureElementPassViewController;
      didCreateShareURL: NSURL; activationCode: NSString); cdecl;
  end;

  PKVehicleConnectionDelegate = interface(IObjectiveC)
    ['{D6A51F98-7DA5-4796-B410-73182043C90E}']
    procedure sessionDidChangeConnectionState
      (newState: PKVehicleConnectionSessionConnectionState); cdecl;
    procedure sessionDidReceiveData(data: NSData); cdecl;
  end;

  PKIdentityDocumentDescriptor = interface(IObjectiveC)
    ['{406B7A2E-CD78-437B-A559-8F09BA8C17EC}']
    function elements: NSArray; cdecl;
    function intentToStoreForElement(element: PKIdentityElement)
      : PKIdentityIntentToStore; cdecl;
    procedure addElements(elements: NSArray;
      withIntentToStore: PKIdentityIntentToStore); cdecl;
  end;

  // ===== Exported string consts =====

function PKEncryptionSchemeECC_V2: Pointer;
function PKEncryptionSchemeRSA_V2: Pointer;
function PKPaymentNetworkAmex: Pointer;
function PKPaymentNetworkBancomat: Pointer;
function PKPaymentNetworkBancontact: Pointer;
function PKPaymentNetworkCarteBancaire: Pointer;
function PKPaymentNetworkCarteBancaires: Pointer;
function PKPaymentNetworkCartesBancaires: Pointer;
function PKPaymentNetworkChinaUnionPay: Pointer;
function PKPaymentNetworkDankort: Pointer;
function PKPaymentNetworkDiscover: Pointer;
function PKPaymentNetworkEftpos: Pointer;
function PKPaymentNetworkElectron: Pointer;
function PKPaymentNetworkElo: Pointer;
function PKPaymentNetworkIDCredit: Pointer;
function PKPaymentNetworkInterac: Pointer;
function PKPaymentNetworkJCB: Pointer;
function PKPaymentNetworkMada: Pointer;
function PKPaymentNetworkMaestro: Pointer;
function PKPaymentNetworkMasterCard: Pointer;
function PKPaymentNetworkMir: Pointer;
function PKPaymentNetworkPrivateLabel: Pointer;
function PKPaymentNetworkQuicPay: Pointer;
function PKPaymentNetworkSuica: Pointer;
function PKPaymentNetworkVisa: Pointer;
function PKPaymentNetworkVPay: Pointer;
function PKPaymentNetworkBarcode: Pointer;
function PKPaymentNetworkGirocard: Pointer;
function PKPaymentNetworkWaon: Pointer;
function PKPaymentNetworkNanaco: Pointer;
function PKPaymentNetworkPostFinance: Pointer;
function PKContactFieldPostalAddress: Pointer;
function PKContactFieldEmailAddress: Pointer;
function PKContactFieldPhoneNumber: Pointer;
function PKContactFieldName: Pointer;
function PKContactFieldPhoneticName: Pointer;
function PKPassKitErrorDomain: NSString;
function PKPaymentErrorDomain: NSString;
function PKPaymentErrorContactFieldUserInfoKey: Pointer;
function PKPaymentErrorPostalAddressUserInfoKey: Pointer;
function PKAddSecureElementPassErrorDomain: NSString;
function PKShareSecureElementPassErrorDomain: NSString;
function PKPassLibraryDidChangeNotification: Pointer;
function PKPassLibraryRemotePaymentPassesDidChangeNotification: Pointer;
function PKPassLibraryAddedPassesUserInfoKey: Pointer;
function PKPassLibraryReplacementPassesUserInfoKey: Pointer;
function PKPassLibraryRemovedPassInfosUserInfoKey: Pointer;
function PKPassLibraryPassTypeIdentifierUserInfoKey: Pointer;
function PKPassLibrarySerialNumberUserInfoKey: Pointer;
function PKPassLibraryRecoveredPassesUserInfoKey: Pointer;
function PKStoredValuePassBalanceTypeCash: Pointer;
function PKStoredValuePassBalanceTypeLoyaltyPoints: Pointer;
function PKIdentityErrorDomain: Pointer;


// ===== External functions =====

const
  libPassKit = '/System/Library/Frameworks/PassKit.framework/PassKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  PassKitModule: THandle;

{$ENDIF IOS}

function PKPassKitErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libPassKit, 'PKPassKitErrorDomain');
end;

function PKPaymentErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libPassKit, 'PKPaymentErrorDomain');
end;

function PKAddSecureElementPassErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libPassKit, 'PKAddSecureElementPassErrorDomain');
end;

function PKShareSecureElementPassErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libPassKit,
    'PKShareSecureElementPassErrorDomain');
end;

function PKEncryptionSchemeECC_V2: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKEncryptionSchemeECC_V2');
end;

function PKEncryptionSchemeRSA_V2: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKEncryptionSchemeRSA_V2');
end;

function PKPaymentNetworkAmex: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkAmex');
end;

function PKPaymentNetworkBancomat: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkBancomat');
end;

function PKPaymentNetworkBancontact: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkBancontact');
end;

function PKPaymentNetworkCarteBancaire: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkCarteBancaire');
end;

function PKPaymentNetworkCarteBancaires: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkCarteBancaires');
end;

function PKPaymentNetworkCartesBancaires: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkCartesBancaires');
end;

function PKPaymentNetworkChinaUnionPay: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkChinaUnionPay');
end;

function PKPaymentNetworkDankort: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkDankort');
end;

function PKPaymentNetworkDiscover: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkDiscover');
end;

function PKPaymentNetworkEftpos: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkEftpos');
end;

function PKPaymentNetworkElectron: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkElectron');
end;

function PKPaymentNetworkElo: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkElo');
end;

function PKPaymentNetworkIDCredit: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkIDCredit');
end;

function PKPaymentNetworkInterac: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkInterac');
end;

function PKPaymentNetworkJCB: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkJCB');
end;

function PKPaymentNetworkMada: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkMada');
end;

function PKPaymentNetworkMaestro: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkMaestro');
end;

function PKPaymentNetworkMasterCard: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkMasterCard');
end;

function PKPaymentNetworkMir: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkMir');
end;

function PKPaymentNetworkPrivateLabel: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkPrivateLabel');
end;

function PKPaymentNetworkQuicPay: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkQuicPay');
end;

function PKPaymentNetworkSuica: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkSuica');
end;

function PKPaymentNetworkVisa: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkVisa');
end;

function PKPaymentNetworkVPay: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkVPay');
end;

function PKPaymentNetworkBarcode: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkBarcode');
end;

function PKPaymentNetworkGirocard: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkGirocard');
end;

function PKPaymentNetworkWaon: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkWaon');
end;

function PKPaymentNetworkNanaco: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkNanaco');
end;

function PKPaymentNetworkPostFinance: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPaymentNetworkPostFinance');
end;

function PKContactFieldPostalAddress: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKContactFieldPostalAddress');
end;

function PKContactFieldEmailAddress: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKContactFieldEmailAddress');
end;

function PKContactFieldPhoneNumber: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKContactFieldPhoneNumber');
end;

function PKContactFieldName: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKContactFieldName');
end;

function PKContactFieldPhoneticName: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKContactFieldPhoneticName');
end;

function PKPaymentErrorContactFieldUserInfoKey: Pointer;
begin
  Result := CocoaPointerConst(libPassKit,
    'PKPaymentErrorContactFieldUserInfoKey');
end;

function PKPaymentErrorPostalAddressUserInfoKey: Pointer;
begin
  Result := CocoaPointerConst(libPassKit,
    'PKPaymentErrorPostalAddressUserInfoKey');
end;

function PKPassLibraryDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKPassLibraryDidChangeNotification');
end;

function PKPassLibraryRemotePaymentPassesDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libPassKit,
    'PKPassLibraryRemotePaymentPassesDidChangeNotification');
end;

function PKPassLibraryAddedPassesUserInfoKey: Pointer;
begin
  Result := CocoaPointerConst(libPassKit,
    'PKPassLibraryAddedPassesUserInfoKey');
end;

function PKPassLibraryReplacementPassesUserInfoKey: Pointer;
begin
  Result := CocoaPointerConst(libPassKit,
    'PKPassLibraryReplacementPassesUserInfoKey');
end;

function PKPassLibraryRemovedPassInfosUserInfoKey: Pointer;
begin
  Result := CocoaPointerConst(libPassKit,
    'PKPassLibraryRemovedPassInfosUserInfoKey');
end;

function PKPassLibraryPassTypeIdentifierUserInfoKey: Pointer;
begin
  Result := CocoaPointerConst(libPassKit,
    'PKPassLibraryPassTypeIdentifierUserInfoKey');
end;

function PKPassLibrarySerialNumberUserInfoKey: Pointer;
begin
  Result := CocoaPointerConst(libPassKit,
    'PKPassLibrarySerialNumberUserInfoKey');
end;

function PKPassLibraryRecoveredPassesUserInfoKey: Pointer;
begin
  Result := CocoaPointerConst(libPassKit,
    'PKPassLibraryRecoveredPassesUserInfoKey');
end;

function PKStoredValuePassBalanceTypeCash: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKStoredValuePassBalanceTypeCash');
end;

function PKStoredValuePassBalanceTypeLoyaltyPoints: Pointer;
begin
  Result := CocoaPointerConst(libPassKit,
    'PKStoredValuePassBalanceTypeLoyaltyPoints');
end;

function PKIdentityErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libPassKit, 'PKIdentityErrorDomain');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

PassKitModule := dlopen(MarshaledAString(libPassKit), RTLD_LAZY);

finalization

dlclose(PassKitModule);
{$ENDIF IOS}

end.
