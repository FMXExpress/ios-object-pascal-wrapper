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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.AddressBook,
  iOSapi.CocoaTypes,
  iOSapi.Contacts,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  PKUnknownError = -1;
  PKInvalidDataError = 1;
  PKUnsupportedVersionError = 2;
  PKInvalidSignature = 3;
  PKNotEntitledError = 4;
  PKPassTypeBarcode = 0;
  PKPassTypePayment = 1;
  PKPassTypeAny = not 0;
  PKPaymentPassActivationStateActivated = 0;
  PKPaymentPassActivationStateRequiresActivation = 1;
  PKPaymentPassActivationStateActivating = 2;
  PKPaymentPassActivationStateSuspended = 3;
  PKPaymentPassActivationStateDeactivated = 4;
  PKPassLibraryDidAddPasses = 0;
  PKPassLibraryShouldReviewPasses = 1;
  PKPassLibraryDidCancelAddPasses = 2;
  PKAutomaticPassPresentationSuppressionResultNotSupported = 0;
  PKAutomaticPassPresentationSuppressionResultAlreadyPresenting = 1;
  PKAutomaticPassPresentationSuppressionResultDenied = 2;
  PKAutomaticPassPresentationSuppressionResultCancelled = 3;
  PKAutomaticPassPresentationSuppressionResultSuccess = 4;
  PKAddPaymentPassErrorUnsupported = 0;
  PKAddPaymentPassErrorUserCancelled = 1;
  PKAddPaymentPassErrorSystemCancelled = 2;
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
  PKPaymentSummaryItemTypeFinal = 0;
  PKPaymentSummaryItemTypePending = 1;
  PKPaymentMethodTypeUnknown = 0;
  PKPaymentMethodTypeDebit = 1;
  PKPaymentMethodTypeCredit = 2;
  PKPaymentMethodTypePrepaid = 3;
  PKPaymentMethodTypeStore = 4;
  PKPaymentAuthorizationStatusSuccess = 0;
  PKPaymentAuthorizationStatusFailure = 1;
  PKPaymentAuthorizationStatusInvalidBillingPostalAddress = 2;
  PKPaymentAuthorizationStatusInvalidShippingPostalAddress = 3;
  PKPaymentAuthorizationStatusInvalidShippingContact = 4;
  PKPaymentAuthorizationStatusPINRequired = 5;
  PKPaymentAuthorizationStatusPINIncorrect = 6;
  PKPaymentAuthorizationStatusPINLockout = 7;
  PKAddPassButtonStyleBlack = 0;
  PKAddPassButtonStyleBlackOutline = 1;
  PKPaymentButtonStyleWhite = 0;
  PKPaymentButtonStyleWhiteOutline = 1;
  PKPaymentButtonStyleBlack = 2;
  PKPaymentButtonTypePlain = 0;
  PKPaymentButtonTypeBuy = 1;
  PKPaymentButtonTypeSetUp = 2;

type

  // ===== Forward declarations =====
{$M+}
  PKObject = interface;
  PKPaymentPass = interface;
  PKPass = interface;
  PKPassLibrary = interface;
  PKContact = interface;
  PKAddPassesViewController = interface;
  PKAddPassesViewControllerDelegate = interface;
  PKAddPaymentPassViewController = interface;
  PKAddPaymentPassRequestConfiguration = interface;
  PKAddPaymentPassRequest = interface;
  PKAddPaymentPassViewControllerDelegate = interface;
  PKPaymentSummaryItem = interface;
  PKShippingMethod = interface;
  PKPaymentRequest = interface;
  PKPaymentMethod = interface;
  PKPaymentToken = interface;
  PKPayment = interface;
  PKPaymentAuthorizationViewController = interface;
  PKPaymentAuthorizationViewControllerDelegate = interface;
  PKAddPassButton = interface;
  PKPaymentButton = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PKPassKitErrorCode = NSInteger;
  NSUInteger = Cardinal;
  PKPassType = NSUInteger;
  PKPaymentPassActivationState = NSUInteger;
  PKPassLibraryAddPassesStatus = NSInteger;
  PKAutomaticPassPresentationSuppressionResult = NSUInteger;
  PKSuppressionRequestToken = NSUInteger;
  TPassKitResponseHandler = procedure
    (param1: PKAutomaticPassPresentationSuppressionResult) of object;
  TPassKitWithCompletionHandler = procedure
    (param1: PKPassLibraryAddPassesStatus) of object;
  TPassKitCompletion = procedure(param1: Boolean; param2: NSError) of object;
  PKAddPaymentPassError = NSInteger;
  TPassKitCompletionHandler = procedure(param1: PKAddPaymentPassRequest)
    of object;
  PKMerchantCapability = NSUInteger;
  PKAddressField = NSUInteger;
  PKShippingType = NSUInteger;
  PKPaymentSummaryItemType = NSUInteger;
  CFTypeRef = Pointer;
  ABRecordRef = CFTypeRef;
  PKPaymentMethodType = NSUInteger;
  PKPaymentAuthorizationStatus = NSInteger;
  TPassKitCompletion1 = procedure(param1: PKPaymentAuthorizationStatus)
    of object;
  TPassKitCompletion2 = procedure(param1: PKPaymentAuthorizationStatus;
    param2: NSArray) of object;
  TPassKitCompletion3 = procedure(param1: PKPaymentAuthorizationStatus;
    param2: NSArray; param3: NSArray) of object;
  TPassKitCompletion4 = procedure(param1: NSArray) of object;
  PKAddPassButtonStyle = NSInteger;
  PKPaymentButtonStyle = NSInteger;
  PKPaymentButtonType = NSInteger;
  // ===== Interface declarations =====

  PKObjectClass = interface(NSObjectClass)
    ['{DEBA2BAA-AA34-4901-BD0D-0DDDDE0216E1}']
  end;

  PKObject = interface(NSObject)
    ['{FAE08D2A-5190-4CF4-9C5F-CF62A244842D}']
  end;

  TPKObject = class(TOCGenericImport<PKObjectClass, PKObject>)
  end;

  PPKObject = Pointer;

  PKPassClass = interface(PKObjectClass)
    ['{6BCC7BEA-5D5B-4D09-BD75-FDDCAAEBB32A}']
  end;

  PKPass = interface(PKObject)
    ['{96A6CE12-255F-45F5-80FF-5876EDF7B59B}']
    function initWithData(data: NSData; error: NSError)
      : Pointer { instancetype }; cdecl;
    function passType: PKPassType; cdecl;
    function paymentPass: PKPaymentPass; cdecl;
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

  PKPaymentPassClass = interface(PKPassClass)
    ['{73BBB8A3-854B-4532-97E1-48ED1C7CBD27}']
  end;

  PKPaymentPass = interface(PKPass)
    ['{172395A9-46DC-4DDB-BAF2-56043EE51D55}']
    function primaryAccountIdentifier: NSString; cdecl;
    function primaryAccountNumberSuffix: NSString; cdecl;
    function deviceAccountIdentifier: NSString; cdecl;
    function deviceAccountNumberSuffix: NSString; cdecl;
    function activationState: PKPaymentPassActivationState; cdecl;
  end;

  TPKPaymentPass = class(TOCGenericImport<PKPaymentPassClass, PKPaymentPass>)
  end;

  PPKPaymentPass = Pointer;

  PKPassLibraryClass = interface(NSObjectClass)
    ['{2FA5121B-AF8A-4ACB-852C-660B64F5B013}']
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
    ['{DDEA93AA-2C4B-4448-A537-17E4BD6938E5}']
    function isPaymentPassActivationAvailable: Boolean; cdecl;
    function passes: NSArray; cdecl;
    function passWithPassTypeIdentifier(identifier: NSString;
      serialNumber: NSString): PKPass; cdecl;
    function passesOfType(passType: PKPassType): NSArray; cdecl;
    function remotePaymentPasses: NSArray; cdecl;
    procedure removePass(pass: PKPass); cdecl;
    function containsPass(pass: PKPass): Boolean; cdecl;
    function replacePassWithPass(pass: PKPass): Boolean; cdecl;
    procedure addPasses(passes: NSArray;
      withCompletionHandler: TPassKitWithCompletionHandler); cdecl;
    procedure openPaymentSetup; cdecl;
    function canAddPaymentPassWithPrimaryAccountIdentifier
      (primaryAccountIdentifier: NSString): Boolean; cdecl;
    [MethodName('activatePaymentPass:withActivationData:completion:')]
    procedure activatePaymentPassWithActivationDataCompletion
      (paymentPass: PKPaymentPass; withActivationData: NSData;
      completion: TPassKitCompletion); cdecl;
    [MethodName('activatePaymentPass:withActivationCode:completion:')]
    procedure activatePaymentPassWithActivationCodeCompletion
      (paymentPass: PKPaymentPass; withActivationCode: NSString;
      completion: TPassKitCompletion); cdecl;
  end;

  TPKPassLibrary = class(TOCGenericImport<PKPassLibraryClass, PKPassLibrary>)
  end;

  PPKPassLibrary = Pointer;

  PKContactClass = interface(NSObjectClass)
    ['{8CC9B96D-C9C0-4918-B023-8FD42ECE9427}']
  end;

  PKContact = interface(NSObject)
    ['{9439CF81-33D7-4F34-BA6E-6DD6B85CE593}']
    procedure setName(name: NSPersonNameComponents); cdecl;
    function name: NSPersonNameComponents; cdecl;
    procedure setPostalAddress(postalAddress: CNPostalAddress); cdecl;
    function postalAddress: CNPostalAddress; cdecl;
    procedure setEmailAddress(emailAddress: NSString); cdecl;
    function emailAddress: NSString; cdecl;
    procedure setPhoneNumber(phoneNumber: CNPhoneNumber); cdecl;
    function phoneNumber: CNPhoneNumber; cdecl;
    procedure setSupplementarySubLocality(supplementarySubLocality
      : NSString); cdecl;
    function supplementarySubLocality: NSString; cdecl;
  end;

  TPKContact = class(TOCGenericImport<PKContactClass, PKContact>)
  end;

  PPKContact = Pointer;

  PKAddPassesViewControllerClass = interface(UIViewControllerClass)
    ['{E3671CC6-DF8F-4748-9CE9-CF8BDCA1F54D}']
    { class } function canAddPasses: Boolean; cdecl;
  end;

  PKAddPassesViewController = interface(UIViewController)
    ['{99AA3DFA-B6B0-4C22-9F88-B65991CBC751}']
    function initWithPass(pass: PKPass): Pointer { instancetype }; cdecl;
    function initWithPasses(passes: NSArray): Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
  end;

  TPKAddPassesViewController = class
    (TOCGenericImport<PKAddPassesViewControllerClass,
    PKAddPassesViewController>)
  end;

  PPKAddPassesViewController = Pointer;

  PKAddPaymentPassViewControllerClass = interface(UIViewControllerClass)
    ['{01A824B8-21AD-4944-A200-C40AF1DAA479}']
    { class } function canAddPaymentPass: Boolean; cdecl;
  end;

  PKAddPaymentPassViewController = interface(UIViewController)
    ['{B80350DD-C4AE-48D5-AE71-6885AEC72E36}']
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

  PKAddPaymentPassRequestConfigurationClass = interface(NSObjectClass)
    ['{0402B5FC-D88B-4531-B315-5029EB83BB71}']
  end;

  PKAddPaymentPassRequestConfiguration = interface(NSObject)
    ['{6F40DCFD-A5C0-40F6-82E3-57AC116FA29D}']
    function initWithEncryptionScheme(encryptionScheme: NSString)
      : Pointer { instancetype }; cdecl;
    function encryptionScheme: NSString; cdecl;
    procedure setCardholderName(cardholderName: NSString); cdecl;
    function cardholderName: NSString; cdecl;
    procedure setPrimaryAccountSuffix(primaryAccountSuffix: NSString); cdecl;
    function primaryAccountSuffix: NSString; cdecl;
    procedure setLocalizedDescription(localizedDescription: NSString); cdecl;
    function localizedDescription: NSString; cdecl;
    procedure setPrimaryAccountIdentifier(primaryAccountIdentifier
      : NSString); cdecl;
    function primaryAccountIdentifier: NSString; cdecl;
    procedure setPaymentNetwork(paymentNetwork: NSString); cdecl;
    function paymentNetwork: NSString; cdecl;
  end;

  TPKAddPaymentPassRequestConfiguration = class
    (TOCGenericImport<PKAddPaymentPassRequestConfigurationClass,
    PKAddPaymentPassRequestConfiguration>)
  end;

  PPKAddPaymentPassRequestConfiguration = Pointer;

  PKAddPaymentPassRequestClass = interface(NSObjectClass)
    ['{58FEEC80-5F52-444A-A6B6-A354319BD0CA}']
  end;

  PKAddPaymentPassRequest = interface(NSObject)
    ['{787273DC-0BAB-4DE8-AD79-727CC4319671}']
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

  PKPaymentSummaryItemClass = interface(NSObjectClass)
    ['{7804B521-8420-4721-B2E2-98C430FE6928}']
    [MethodName('summaryItemWithLabel:amount:')]
    { class } function summaryItemWithLabelAmount(&label: NSString;
      amount: NSDecimalNumber): Pointer { instancetype }; cdecl;
    [MethodName('summaryItemWithLabel:amount:type:')]
    { class } function summaryItemWithLabelAmountType(&label: NSString;
      amount: NSDecimalNumber; &type: PKPaymentSummaryItemType)
      : Pointer { instancetype }; cdecl;
  end;

  PKPaymentSummaryItem = interface(NSObject)
    ['{396CCE07-AA6D-44F0-A44A-83E9957EB960}']
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

  PKShippingMethodClass = interface(PKPaymentSummaryItemClass)
    ['{ADC50C57-7D83-43F0-937C-E8F0856DDCEB}']
  end;

  PKShippingMethod = interface(PKPaymentSummaryItem)
    ['{76220F62-C2B5-4A73-960B-CFC4A331DB39}']
    procedure setIdentifier(identifier: NSString); cdecl;
    function identifier: NSString; cdecl;
    procedure setDetail(detail: NSString); cdecl;
    function detail: NSString; cdecl;
  end;

  TPKShippingMethod = class(TOCGenericImport<PKShippingMethodClass,
    PKShippingMethod>)
  end;

  PPKShippingMethod = Pointer;

  PKPaymentRequestClass = interface(NSObjectClass)
    ['{0A4E4E50-3791-4FB1-9CE5-268103982E8D}']
  end;

  PKPaymentRequest = interface(NSObject)
    ['{F9B865B9-319D-4910-8207-8DF09977AED0}']
    procedure setMerchantIdentifier(merchantIdentifier: NSString); cdecl;
    function merchantIdentifier: NSString; cdecl;
    procedure setCountryCode(countryCode: NSString); cdecl;
    function countryCode: NSString; cdecl;
    procedure setSupportedNetworks(supportedNetworks: NSArray); cdecl;
    function supportedNetworks: NSArray; cdecl;
    procedure setMerchantCapabilities(merchantCapabilities
      : PKMerchantCapability); cdecl;
    function merchantCapabilities: PKMerchantCapability; cdecl;
    procedure setPaymentSummaryItems(paymentSummaryItems: NSArray); cdecl;
    function paymentSummaryItems: NSArray; cdecl;
    procedure setCurrencyCode(currencyCode: NSString); cdecl;
    function currencyCode: NSString; cdecl;
    procedure setRequiredBillingAddressFields(requiredBillingAddressFields
      : PKAddressField); cdecl;
    function requiredBillingAddressFields: PKAddressField; cdecl;
    procedure setBillingAddress(billingAddress: ABRecordRef); cdecl;
    function billingAddress: ABRecordRef; cdecl;
    procedure setBillingContact(billingContact: PKContact); cdecl;
    function billingContact: PKContact; cdecl;
    procedure setRequiredShippingAddressFields(requiredShippingAddressFields
      : PKAddressField); cdecl;
    function requiredShippingAddressFields: PKAddressField; cdecl;
    procedure setShippingAddress(shippingAddress: ABRecordRef); cdecl;
    function shippingAddress: ABRecordRef; cdecl;
    procedure setShippingContact(shippingContact: PKContact); cdecl;
    function shippingContact: PKContact; cdecl;
    procedure setShippingMethods(shippingMethods: NSArray); cdecl;
    function shippingMethods: NSArray; cdecl;
    procedure setShippingType(shippingType: PKShippingType); cdecl;
    function shippingType: PKShippingType; cdecl;
    procedure setApplicationData(applicationData: NSData); cdecl;
    function applicationData: NSData; cdecl;
  end;

  TPKPaymentRequest = class(TOCGenericImport<PKPaymentRequestClass,
    PKPaymentRequest>)
  end;

  PPKPaymentRequest = Pointer;

  PKPaymentMethodClass = interface(NSObjectClass)
    ['{E2623C80-BAEB-4CC5-8A98-A31AB9FB4C95}']
  end;

  PKPaymentMethod = interface(NSObject)
    ['{1245DA0D-5665-4493-A9F8-4E853188A9F6}']
    function displayName: NSString; cdecl;
    function network: NSString; cdecl;
    function &type: PKPaymentMethodType; cdecl;
    function paymentPass: PKPaymentPass; cdecl;
  end;

  TPKPaymentMethod = class(TOCGenericImport<PKPaymentMethodClass,
    PKPaymentMethod>)
  end;

  PPKPaymentMethod = Pointer;

  PKPaymentTokenClass = interface(NSObjectClass)
    ['{524230C6-258E-4EA0-B108-56C199AAEAB8}']
  end;

  PKPaymentToken = interface(NSObject)
    ['{46CABD42-08E6-4926-A185-742B99BD8287}']
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
    ['{D5CEA904-AC43-4003-8DE4-964BE1DD0868}']
  end;

  PKPayment = interface(NSObject)
    ['{07C824AF-69EF-4D39-BAB9-B6997DBBE774}']
    function token: PKPaymentToken; cdecl;
    function billingAddress: ABRecordRef; cdecl;
    function billingContact: PKContact; cdecl;
    function shippingAddress: ABRecordRef; cdecl;
    function shippingContact: PKContact; cdecl;
    function shippingMethod: PKShippingMethod; cdecl;
  end;

  TPKPayment = class(TOCGenericImport<PKPaymentClass, PKPayment>)
  end;

  PPKPayment = Pointer;

  PKPaymentAuthorizationViewControllerClass = interface(UIViewControllerClass)
    ['{1FDCA290-3040-4D99-A193-E7C1A2063AE7}']
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
    ['{780257E1-40E8-4295-AC80-2DEB19F89083}']
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

  PKAddPassButtonClass = interface(UIButtonClass)
    ['{7EC1A522-E0DA-46FB-8532-B323D3807B48}']
    { class } function addPassButtonWithStyle(addPassButtonStyle
      : PKAddPassButtonStyle): Pointer { instancetype }; cdecl;
  end;

  PKAddPassButton = interface(UIButton)
    ['{24C0D165-2F4E-411F-AE91-D523F3B30A0E}']
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
    ['{E07CD216-2BF5-4DC7-AD6F-8FD60B8B3793}']
    { class } function buttonWithType(buttonType: PKPaymentButtonType;
      style: PKPaymentButtonStyle): Pointer { instancetype }; cdecl;
  end;

  PKPaymentButton = interface(UIButton)
    ['{76B38605-B2DF-4AD7-8E1F-148EF3AFC56D}']
    function initWithPaymentButtonType(&type: PKPaymentButtonType;
      paymentButtonStyle: PKPaymentButtonStyle)
      : Pointer { instancetype }; cdecl;
  end;

  TPKPaymentButton = class(TOCGenericImport<PKPaymentButtonClass,
    PKPaymentButton>)
  end;

  PPKPaymentButton = Pointer;

  // ===== Protocol declarations =====

  PKAddPassesViewControllerDelegate = interface(IObjectiveC)
    ['{1E327B83-9E25-4441-BE7D-4E3547C93F7C}']
    procedure addPassesViewControllerDidFinish
      (controller: PKAddPassesViewController); cdecl;
  end;

  PKAddPaymentPassViewControllerDelegate = interface(IObjectiveC)
    ['{3175244D-4628-4CAF-8298-D96BF862279D}']
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

  PKPaymentAuthorizationViewControllerDelegate = interface(IObjectiveC)
    ['{FE2F7083-8C2E-4377-A838-A734B550138E}']
    [MethodName
      ('paymentAuthorizationViewController:didAuthorizePayment:completion:')]
    procedure paymentAuthorizationViewControllerDidAuthorizePaymentCompletion
      (controller: PKPaymentAuthorizationViewController;
      didAuthorizePayment: PKPayment; completion: TPassKitCompletion1); cdecl;
    procedure paymentAuthorizationViewControllerDidFinish
      (controller: PKPaymentAuthorizationViewController); cdecl;
    procedure paymentAuthorizationViewControllerWillAuthorizePayment
      (controller: PKPaymentAuthorizationViewController); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didSelectShippingMethod:completion:')
      ]
    procedure paymentAuthorizationViewControllerDidSelectShippingMethodCompletion
      (controller: PKPaymentAuthorizationViewController;
      didSelectShippingMethod: PKShippingMethod;
      completion: TPassKitCompletion2); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didSelectShippingAddress:completion:')
      ]
    procedure paymentAuthorizationViewControllerDidSelectShippingAddressCompletion
      (controller: PKPaymentAuthorizationViewController;
      didSelectShippingAddress: ABRecordRef;
      completion: TPassKitCompletion3); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didSelectShippingContact:completion:')
      ]
    procedure paymentAuthorizationViewControllerDidSelectShippingContactCompletion
      (controller: PKPaymentAuthorizationViewController;
      didSelectShippingContact: PKContact;
      completion: TPassKitCompletion3); cdecl;
    [MethodName
      ('paymentAuthorizationViewController:didSelectPaymentMethod:completion:')]
    procedure paymentAuthorizationViewControllerDidSelectPaymentMethodCompletion
      (controller: PKPaymentAuthorizationViewController;
      didSelectPaymentMethod: PKPaymentMethod;
      completion: TPassKitCompletion4); cdecl;
  end;

  // ===== Exported string consts =====

function PKEncryptionSchemeECC_V2: NSString;
function PKPaymentNetworkAmex: NSString;
function PKPaymentNetworkChinaUnionPay: NSString;
function PKPaymentNetworkDiscover: NSString;
function PKPaymentNetworkInterac: NSString;
function PKPaymentNetworkMasterCard: NSString;
function PKPaymentNetworkPrivateLabel: NSString;
function PKPaymentNetworkVisa: NSString;
function PKPassKitErrorDomain: NSString;
function PKPassLibraryDidChangeNotification: NSString;
function PKPassLibraryRemotePaymentPassesDidChangeNotification: NSString;
function PKPassLibraryAddedPassesUserInfoKey: NSString;
function PKPassLibraryReplacementPassesUserInfoKey: NSString;
function PKPassLibraryRemovedPassInfosUserInfoKey: NSString;
function PKPassLibraryPassTypeIdentifierUserInfoKey: NSString;
function PKPassLibrarySerialNumberUserInfoKey: NSString;


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

function PKEncryptionSchemeECC_V2: NSString;
begin
  Result := CocoaNSStringConst(libPassKit, 'PKEncryptionSchemeECC_V2');
end;

function PKPaymentNetworkAmex: NSString;
begin
  Result := CocoaNSStringConst(libPassKit, 'PKPaymentNetworkAmex');
end;

function PKPaymentNetworkChinaUnionPay: NSString;
begin
  Result := CocoaNSStringConst(libPassKit, 'PKPaymentNetworkChinaUnionPay');
end;

function PKPaymentNetworkDiscover: NSString;
begin
  Result := CocoaNSStringConst(libPassKit, 'PKPaymentNetworkDiscover');
end;

function PKPaymentNetworkInterac: NSString;
begin
  Result := CocoaNSStringConst(libPassKit, 'PKPaymentNetworkInterac');
end;

function PKPaymentNetworkMasterCard: NSString;
begin
  Result := CocoaNSStringConst(libPassKit, 'PKPaymentNetworkMasterCard');
end;

function PKPaymentNetworkPrivateLabel: NSString;
begin
  Result := CocoaNSStringConst(libPassKit, 'PKPaymentNetworkPrivateLabel');
end;

function PKPaymentNetworkVisa: NSString;
begin
  Result := CocoaNSStringConst(libPassKit, 'PKPaymentNetworkVisa');
end;

function PKPassKitErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libPassKit, 'PKPassKitErrorDomain');
end;

function PKPassLibraryDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libPassKit,
    'PKPassLibraryDidChangeNotification');
end;

function PKPassLibraryRemotePaymentPassesDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libPassKit,
    'PKPassLibraryRemotePaymentPassesDidChangeNotification');
end;

function PKPassLibraryAddedPassesUserInfoKey: NSString;
begin
  Result := CocoaNSStringConst(libPassKit,
    'PKPassLibraryAddedPassesUserInfoKey');
end;

function PKPassLibraryReplacementPassesUserInfoKey: NSString;
begin
  Result := CocoaNSStringConst(libPassKit,
    'PKPassLibraryReplacementPassesUserInfoKey');
end;

function PKPassLibraryRemovedPassInfosUserInfoKey: NSString;
begin
  Result := CocoaNSStringConst(libPassKit,
    'PKPassLibraryRemovedPassInfosUserInfoKey');
end;

function PKPassLibraryPassTypeIdentifierUserInfoKey: NSString;
begin
  Result := CocoaNSStringConst(libPassKit,
    'PKPassLibraryPassTypeIdentifierUserInfoKey');
end;

function PKPassLibrarySerialNumberUserInfoKey: NSString;
begin
  Result := CocoaNSStringConst(libPassKit,
    'PKPassLibrarySerialNumberUserInfoKey');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

PassKitModule := dlopen(MarshaledAString(libPassKit), RTLD_LAZY);

finalization

dlclose(PassKitModule);
{$ENDIF IOS}

end.
