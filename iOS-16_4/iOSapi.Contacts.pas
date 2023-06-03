{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework Contacts
//

unit iOSapi.Contacts;

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
  CNContactTypePerson = 0;
  CNContactTypeOrganization = 1;
  CNContactSortOrderNone = 0;
  CNContactSortOrderUserDefault = 1;
  CNContactSortOrderGivenName = 2;
  CNContactSortOrderFamilyName = 3;
  CNContactFormatterStyleFullName = 0;
  CNContactFormatterStylePhoneticFullName = 1;
  CNContactDisplayNameOrderUserDefault = 0;
  CNContactDisplayNameOrderGivenNameFirst = 1;
  CNContactDisplayNameOrderFamilyNameFirst = 2;
  CNEntityTypeContacts = 0;
  CNAuthorizationStatusNotDetermined = 0;
  CNAuthorizationStatusRestricted = 1;
  CNAuthorizationStatusDenied = 2;
  CNAuthorizationStatusAuthorized = 3;
  CNContainerTypeUnassigned = 0;
  CNContainerTypeLocal = 1;
  CNContainerTypeExchange = 2;
  CNContainerTypeCardDAV = 3;
  CNErrorCodeCommunicationError = 1;
  CNErrorCodeDataAccessError = 2;
  CNErrorCodeAuthorizationDenied = 100;
  CNErrorCodeNoAccessableWritableContainers = 101;
  CNErrorCodeUnauthorizedKeys = 102;
  CNErrorCodeFeatureDisabledByUser = 103;
  CNErrorCodeRecordDoesNotExist = 200;
  CNErrorCodeInsertedRecordAlreadyExists = 201;
  CNErrorCodeContainmentCycle = 202;
  CNErrorCodeContainmentScope = 203;
  CNErrorCodeParentRecordDoesNotExist = 204;
  CNErrorCodeRecordIdentifierInvalid = 205;
  CNErrorCodeRecordNotWritable = 206;
  CNErrorCodeParentContainerNotWritable = 207;
  CNErrorCodeValidationMultipleErrors = 300;
  CNErrorCodeValidationTypeMismatch = 301;
  CNErrorCodeValidationConfigurationError = 302;
  CNErrorCodePredicateInvalid = 400;
  CNErrorCodePolicyViolation = 500;
  CNErrorCodeClientIdentifierInvalid = 600;
  CNErrorCodeClientIdentifierDoesNotExist = 601;
  CNErrorCodeClientIdentifierCollision = 602;
  CNErrorCodeChangeHistoryExpired = 603;
  CNErrorCodeChangeHistoryInvalidAnchor = 604;
  CNErrorCodeChangeHistoryInvalidFetchRequest = 605;
  CNErrorCodeVCardMalformed = 700;
  CNErrorCodeVCardSummarizationError = 701;
  CNPostalAddressFormatterStyleMailingAddress = 0;

type

  // ===== Forward declarations =====
{$M+}
  CNChangeHistoryEventVisitor = interface;
  CNContact = interface;
  CNGroup = interface;
  CNChangeHistoryEvent = interface;
  CNChangeHistoryDropEverythingEvent = interface;
  CNChangeHistoryAddContactEvent = interface;
  CNChangeHistoryUpdateContactEvent = interface;
  CNChangeHistoryDeleteContactEvent = interface;
  CNChangeHistoryAddGroupEvent = interface;
  CNChangeHistoryUpdateGroupEvent = interface;
  CNChangeHistoryDeleteGroupEvent = interface;
  CNChangeHistoryAddMemberToGroupEvent = interface;
  CNChangeHistoryRemoveMemberFromGroupEvent = interface;
  CNChangeHistoryAddSubgroupToGroupEvent = interface;
  CNChangeHistoryRemoveSubgroupFromGroupEvent = interface;
  CNFetchRequest = interface;
  CNKeyDescriptor = interface;
  CNChangeHistoryFetchRequest = interface;
  CNLabeledValue = interface;
  CNPhoneNumber = interface;
  CNPostalAddress = interface;
  CNContactRelation = interface;
  CNSocialProfile = interface;
  CNInstantMessageAddress = interface;
  Contacts = interface;
  CNContactFetchRequest = interface;
  CNContactFormatter = interface;
  CNContactProperty = interface;
  CNContainer = interface;
  CNFetchResult = interface;
  CNSaveRequest = interface;
  CNContactStore = interface;
  CNContactsUserDefaults = interface;
  CNContactVCardSerialization = interface;
  CNMutableContact = interface;
  CNMutableGroup = interface;
  CNMutablePostalAddress = interface;
  CNPostalAddressFormatter = interface;

  // ===== Framework typedefs =====
{$M+}
  ValueType = Pointer;
  PValueType = ^ValueType;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  CNContactType = NSInteger;
  CNContactSortOrder = NSInteger;
  NSComparisonResult = NSInteger;
  NSComparator = function(param1: Pointer; param2: Pointer)
    : NSComparisonResult; cdecl;
  CNContactFormatterStyle = NSInteger;
  CNContactDisplayNameOrder = NSInteger;
  CNEntityType = NSInteger;
  CNAuthorizationStatus = NSInteger;
  TContactsCompletionHandler = procedure(param1: Boolean; param2: NSError)
    of object;
  TContactsUsingBlock = procedure(param1: CNContact; param2: PBoolean)
    of object;
  CNContainerType = NSInteger;
  CNErrorCode = NSInteger;
  CNPostalAddressFormatterStyle = NSInteger;
  // ===== Interface declarations =====

  CNContactClass = interface(NSObjectClass)
    ['{E827C74A-84E0-44D7-93C1-2E10933FEB02}']
    { class } function localizedStringForKey(key: NSString): NSString; cdecl;
    { class } function comparatorForNameSortOrder(sortOrder: CNContactSortOrder)
      : NSComparator; cdecl;
    { class } function descriptorForAllComparatorKeys: Pointer; cdecl;
    { class } function predicateForContactsMatchingName(name: NSString)
      : NSPredicate; cdecl;
    { class } function predicateForContactsMatchingEmailAddress
      (emailAddress: NSString): NSPredicate; cdecl;
    { class } function predicateForContactsMatchingPhoneNumber
      (phoneNumber: CNPhoneNumber): NSPredicate; cdecl;
    { class } function predicateForContactsWithIdentifiers(identifiers: NSArray)
      : NSPredicate; cdecl;
    { class } function predicateForContactsInGroupWithIdentifier(groupIdentifier
      : NSString): NSPredicate; cdecl;
    { class } function predicateForContactsInContainerWithIdentifier
      (containerIdentifier: NSString): NSPredicate; cdecl;
  end;

  CNContact = interface(NSObject)
    ['{6823F9F2-D340-4A4F-A20D-F464237400A4}']
    function identifier: NSString; cdecl;
    function contactType: CNContactType; cdecl;
    function namePrefix: NSString; cdecl;
    function givenName: NSString; cdecl;
    function middleName: NSString; cdecl;
    function familyName: NSString; cdecl;
    function previousFamilyName: NSString; cdecl;
    function nameSuffix: NSString; cdecl;
    function nickname: NSString; cdecl;
    function organizationName: NSString; cdecl;
    function departmentName: NSString; cdecl;
    function jobTitle: NSString; cdecl;
    function phoneticGivenName: NSString; cdecl;
    function phoneticMiddleName: NSString; cdecl;
    function phoneticFamilyName: NSString; cdecl;
    function phoneticOrganizationName: NSString; cdecl;
    function note: NSString; cdecl;
    function imageData: NSData; cdecl;
    function thumbnailImageData: NSData; cdecl;
    function imageDataAvailable: Boolean; cdecl;
    function phoneNumbers: NSArray; cdecl;
    function emailAddresses: NSArray; cdecl;
    function postalAddresses: NSArray; cdecl;
    function urlAddresses: NSArray; cdecl;
    function contactRelations: NSArray; cdecl;
    function socialProfiles: NSArray; cdecl;
    function instantMessageAddresses: NSArray; cdecl;
    function birthday: NSDateComponents; cdecl;
    function nonGregorianBirthday: NSDateComponents; cdecl;
    function dates: NSArray; cdecl;
    function isKeyAvailable(key: NSString): Boolean; cdecl;
    function areKeysAvailable(keyDescriptors: NSArray): Boolean; cdecl;
    function isUnifiedWithContactWithIdentifier(contactIdentifier: NSString)
      : Boolean; cdecl;
  end;

  TCNContact = class(TOCGenericImport<CNContactClass, CNContact>)
  end;

  PCNContact = Pointer;

  CNGroupClass = interface(NSObjectClass)
    ['{EF18E467-6B5B-4009-A568-890F4AE4F7DD}']
    { class } function predicateForGroupsWithIdentifiers(identifiers: NSArray)
      : NSPredicate; cdecl;
    { class } function predicateForSubgroupsInGroupWithIdentifier
      (parentGroupIdentifier: NSString): NSPredicate; cdecl;
    { class } function predicateForGroupsInContainerWithIdentifier
      (containerIdentifier: NSString): NSPredicate; cdecl;
  end;

  CNGroup = interface(NSObject)
    ['{6860A6C6-4F72-4CD5-A4C1-426F636BA959}']
    function identifier: NSString; cdecl;
    function name: NSString; cdecl;
  end;

  TCNGroup = class(TOCGenericImport<CNGroupClass, CNGroup>)
  end;

  PCNGroup = Pointer;

  CNChangeHistoryEventClass = interface(NSObjectClass)
    ['{70FB1BDC-85AF-47FD-99C5-BC5C4DE12422}']
  end;

  CNChangeHistoryEvent = interface(NSObject)
    ['{357AC7E4-DFFB-408D-89E2-A6F798651D4F}']
    procedure acceptEventVisitor(visitor: Pointer); cdecl;
  end;

  TCNChangeHistoryEvent = class(TOCGenericImport<CNChangeHistoryEventClass,
    CNChangeHistoryEvent>)
  end;

  PCNChangeHistoryEvent = Pointer;

  CNChangeHistoryDropEverythingEventClass = interface(CNChangeHistoryEventClass)
    ['{9CE1F0A3-6068-4BF7-9EEE-337DB26F86E4}']
  end;

  CNChangeHistoryDropEverythingEvent = interface(CNChangeHistoryEvent)
    ['{6073F5F1-AEF9-4A14-AD63-C6336DE77AC5}']
  end;

  TCNChangeHistoryDropEverythingEvent = class
    (TOCGenericImport<CNChangeHistoryDropEverythingEventClass,
    CNChangeHistoryDropEverythingEvent>)
  end;

  PCNChangeHistoryDropEverythingEvent = Pointer;

  CNChangeHistoryAddContactEventClass = interface(CNChangeHistoryEventClass)
    ['{982D878A-4683-4964-9DF1-6EF7812D95A8}']
  end;

  CNChangeHistoryAddContactEvent = interface(CNChangeHistoryEvent)
    ['{44BCA135-4984-4705-A221-78C3CEC526BD}']
    function contact: CNContact; cdecl;
    function containerIdentifier: NSString; cdecl;
  end;

  TCNChangeHistoryAddContactEvent = class
    (TOCGenericImport<CNChangeHistoryAddContactEventClass,
    CNChangeHistoryAddContactEvent>)
  end;

  PCNChangeHistoryAddContactEvent = Pointer;

  CNChangeHistoryUpdateContactEventClass = interface(CNChangeHistoryEventClass)
    ['{E5E0B0D0-80BD-4528-9173-AB99075B7696}']
  end;

  CNChangeHistoryUpdateContactEvent = interface(CNChangeHistoryEvent)
    ['{2074A6B2-9A06-40C4-9456-7A64BB861CBC}']
    function contact: CNContact; cdecl;
  end;

  TCNChangeHistoryUpdateContactEvent = class
    (TOCGenericImport<CNChangeHistoryUpdateContactEventClass,
    CNChangeHistoryUpdateContactEvent>)
  end;

  PCNChangeHistoryUpdateContactEvent = Pointer;

  CNChangeHistoryDeleteContactEventClass = interface(CNChangeHistoryEventClass)
    ['{18638645-0C22-4404-B14D-14E5FAC19404}']
  end;

  CNChangeHistoryDeleteContactEvent = interface(CNChangeHistoryEvent)
    ['{77AE2E8D-C7AE-4603-9F29-D9F1F07EF8C5}']
    function contactIdentifier: NSString; cdecl;
  end;

  TCNChangeHistoryDeleteContactEvent = class
    (TOCGenericImport<CNChangeHistoryDeleteContactEventClass,
    CNChangeHistoryDeleteContactEvent>)
  end;

  PCNChangeHistoryDeleteContactEvent = Pointer;

  CNChangeHistoryAddGroupEventClass = interface(CNChangeHistoryEventClass)
    ['{1D012F6E-D785-45D4-9A59-7EFD2A6E0F3E}']
  end;

  CNChangeHistoryAddGroupEvent = interface(CNChangeHistoryEvent)
    ['{3E5AE085-8AB0-4DEA-8A07-263058280172}']
    function group: CNGroup; cdecl;
    function containerIdentifier: NSString; cdecl;
  end;

  TCNChangeHistoryAddGroupEvent = class
    (TOCGenericImport<CNChangeHistoryAddGroupEventClass,
    CNChangeHistoryAddGroupEvent>)
  end;

  PCNChangeHistoryAddGroupEvent = Pointer;

  CNChangeHistoryUpdateGroupEventClass = interface(CNChangeHistoryEventClass)
    ['{F49A27CF-56E1-44DB-B656-BC4DC527F3E1}']
  end;

  CNChangeHistoryUpdateGroupEvent = interface(CNChangeHistoryEvent)
    ['{A0887A00-DF73-46C4-89BB-5B08BC1598BF}']
    function group: CNGroup; cdecl;
  end;

  TCNChangeHistoryUpdateGroupEvent = class
    (TOCGenericImport<CNChangeHistoryUpdateGroupEventClass,
    CNChangeHistoryUpdateGroupEvent>)
  end;

  PCNChangeHistoryUpdateGroupEvent = Pointer;

  CNChangeHistoryDeleteGroupEventClass = interface(CNChangeHistoryEventClass)
    ['{5FF201D2-7324-4574-B5D1-21A11E4E25F9}']
  end;

  CNChangeHistoryDeleteGroupEvent = interface(CNChangeHistoryEvent)
    ['{CF9FCC06-2CBC-4DB8-AE77-3790030BA26C}']
    function groupIdentifier: NSString; cdecl;
  end;

  TCNChangeHistoryDeleteGroupEvent = class
    (TOCGenericImport<CNChangeHistoryDeleteGroupEventClass,
    CNChangeHistoryDeleteGroupEvent>)
  end;

  PCNChangeHistoryDeleteGroupEvent = Pointer;

  CNChangeHistoryAddMemberToGroupEventClass = interface
    (CNChangeHistoryEventClass)
    ['{EFCEF624-96A7-4202-A86E-F53F17216954}']
  end;

  CNChangeHistoryAddMemberToGroupEvent = interface(CNChangeHistoryEvent)
    ['{EF13BC3D-A91E-48B9-A0FB-43F019109771}']
    function member: CNContact; cdecl;
    function group: CNGroup; cdecl;
  end;

  TCNChangeHistoryAddMemberToGroupEvent = class
    (TOCGenericImport<CNChangeHistoryAddMemberToGroupEventClass,
    CNChangeHistoryAddMemberToGroupEvent>)
  end;

  PCNChangeHistoryAddMemberToGroupEvent = Pointer;

  CNChangeHistoryRemoveMemberFromGroupEventClass = interface
    (CNChangeHistoryEventClass)
    ['{D4C69445-4E6B-4845-A555-6E1B5D20B8FF}']
  end;

  CNChangeHistoryRemoveMemberFromGroupEvent = interface(CNChangeHistoryEvent)
    ['{3BD00078-A118-4CAE-8B22-6D5446207C4D}']
    function member: CNContact; cdecl;
    function group: CNGroup; cdecl;
  end;

  TCNChangeHistoryRemoveMemberFromGroupEvent = class
    (TOCGenericImport<CNChangeHistoryRemoveMemberFromGroupEventClass,
    CNChangeHistoryRemoveMemberFromGroupEvent>)
  end;

  PCNChangeHistoryRemoveMemberFromGroupEvent = Pointer;

  CNChangeHistoryAddSubgroupToGroupEventClass = interface
    (CNChangeHistoryEventClass)
    ['{29490FCA-3B61-4D0D-822F-9760B69E73B5}']
  end;

  CNChangeHistoryAddSubgroupToGroupEvent = interface(CNChangeHistoryEvent)
    ['{2F757A5A-E8A5-4C0D-B770-24B165790872}']
    function subgroup: CNGroup; cdecl;
    function group: CNGroup; cdecl;
  end;

  TCNChangeHistoryAddSubgroupToGroupEvent = class
    (TOCGenericImport<CNChangeHistoryAddSubgroupToGroupEventClass,
    CNChangeHistoryAddSubgroupToGroupEvent>)
  end;

  PCNChangeHistoryAddSubgroupToGroupEvent = Pointer;

  CNChangeHistoryRemoveSubgroupFromGroupEventClass = interface
    (CNChangeHistoryEventClass)
    ['{4A217BDC-A7CE-46D8-B850-56545C9088C7}']
  end;

  CNChangeHistoryRemoveSubgroupFromGroupEvent = interface(CNChangeHistoryEvent)
    ['{802F89C2-9335-4052-B899-713FD115191A}']
    function subgroup: CNGroup; cdecl;
    function group: CNGroup; cdecl;
  end;

  TCNChangeHistoryRemoveSubgroupFromGroupEvent = class
    (TOCGenericImport<CNChangeHistoryRemoveSubgroupFromGroupEventClass,
    CNChangeHistoryRemoveSubgroupFromGroupEvent>)
  end;

  PCNChangeHistoryRemoveSubgroupFromGroupEvent = Pointer;

  CNFetchRequestClass = interface(NSObjectClass)
    ['{6F606B6D-3AE6-4B0C-A819-84084A58DA08}']
  end;

  CNFetchRequest = interface(NSObject)
    ['{D70F7410-4167-49C7-92CB-E5DF665234AC}']
  end;

  TCNFetchRequest = class(TOCGenericImport<CNFetchRequestClass, CNFetchRequest>)
  end;

  PCNFetchRequest = Pointer;

  CNChangeHistoryFetchRequestClass = interface(CNFetchRequestClass)
    ['{34C0B867-143C-442A-8913-0B199FC271C4}']
  end;

  CNChangeHistoryFetchRequest = interface(CNFetchRequest)
    ['{7E95BE82-08F8-45BF-9895-8B33D03B70F5}']
    procedure setStartingToken(startingToken: NSData); cdecl;
    function startingToken: NSData; cdecl;
    procedure setAdditionalContactKeyDescriptors(additionalContactKeyDescriptors
      : NSArray); cdecl;
    function additionalContactKeyDescriptors: NSArray; cdecl;
    procedure setShouldUnifyResults(shouldUnifyResults: Boolean); cdecl;
    function shouldUnifyResults: Boolean; cdecl;
    procedure setMutableObjects(mutableObjects: Boolean); cdecl;
    function mutableObjects: Boolean; cdecl;
    procedure setIncludeGroupChanges(includeGroupChanges: Boolean); cdecl;
    function includeGroupChanges: Boolean; cdecl;
    procedure setExcludedTransactionAuthors(excludedTransactionAuthors
      : NSArray); cdecl;
    function excludedTransactionAuthors: NSArray; cdecl;
  end;

  TCNChangeHistoryFetchRequest = class
    (TOCGenericImport<CNChangeHistoryFetchRequestClass,
    CNChangeHistoryFetchRequest>)
  end;

  PCNChangeHistoryFetchRequest = Pointer;

  CNLabeledValueClass = interface(NSObjectClass)
    ['{503334C1-8E84-4F0D-9D0B-B3CFA5F5D455}']
    { class } function labeledValueWithLabel(&label: NSString; value: ValueType)
      : Pointer { instancetype }; cdecl;
    { class } function localizedStringForLabel(&label: NSString)
      : NSString; cdecl;
  end;

  CNLabeledValue = interface(NSObject)
    ['{9C1071B2-BCEE-47CE-890E-E3687F05670B}']
    function identifier: NSString; cdecl;
    function &label: NSString; cdecl;
    function value: ValueType; cdecl;
    function initWithLabel(&label: NSString; value: ValueType)
      : Pointer { instancetype }; cdecl;
    [MethodName('labeledValueBySettingLabel:')]
    function labeledValueBySettingLabel(&label: NSString)
      : Pointer { instancetype }; cdecl;
    function labeledValueBySettingValue(value: ValueType)
      : Pointer { instancetype }; cdecl;
    [MethodName('labeledValueBySettingLabel:value:')]
    function labeledValueBySettingLabelValue(&label: NSString; value: ValueType)
      : Pointer { instancetype }; cdecl;
  end;

  TCNLabeledValue = class(TOCGenericImport<CNLabeledValueClass, CNLabeledValue>)
  end;

  PCNLabeledValue = Pointer;

  CNPhoneNumberClass = interface(NSObjectClass)
    ['{0B1D8725-19C6-44E4-ABEE-5412E50EB84C}']
    { class } function phoneNumberWithStringValue(stringValue: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function new: Pointer { instancetype }; cdecl;
  end;

  CNPhoneNumber = interface(NSObject)
    ['{B286C3AE-FD0A-4479-B8E3-F5D4C11ABA36}']
    function initWithStringValue(&string: NSString)
      : Pointer { instancetype }; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function stringValue: NSString; cdecl;
  end;

  TCNPhoneNumber = class(TOCGenericImport<CNPhoneNumberClass, CNPhoneNumber>)
  end;

  PCNPhoneNumber = Pointer;

  CNPostalAddressClass = interface(NSObjectClass)
    ['{A32F1904-3C1F-431A-8A66-A2A457DCBC4E}']
    { class } function localizedStringForKey(key: NSString): NSString; cdecl;
  end;

  CNPostalAddress = interface(NSObject)
    ['{C8CD331A-8EB7-4B04-80E1-E37BD3E330B0}']
    function street: NSString; cdecl;
    function subLocality: NSString; cdecl;
    function city: NSString; cdecl;
    function subAdministrativeArea: NSString; cdecl;
    function state: NSString; cdecl;
    function postalCode: NSString; cdecl;
    function country: NSString; cdecl;
    function ISOCountryCode: NSString; cdecl;
  end;

  TCNPostalAddress = class(TOCGenericImport<CNPostalAddressClass,
    CNPostalAddress>)
  end;

  PCNPostalAddress = Pointer;

  CNContactRelationClass = interface(NSObjectClass)
    ['{7D1BAE10-7B92-48A4-8D2A-942D6F2EDF91}']
    { class } function contactRelationWithName(name: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  CNContactRelation = interface(NSObject)
    ['{AE51B5BC-0BAC-4F8D-9FEB-B681469CBC26}']
    function initWithName(name: NSString): Pointer { instancetype }; cdecl;
    function name: NSString; cdecl;
  end;

  TCNContactRelation = class(TOCGenericImport<CNContactRelationClass,
    CNContactRelation>)
  end;

  PCNContactRelation = Pointer;

  CNSocialProfileClass = interface(NSObjectClass)
    ['{D7512B01-1866-4D24-87B6-6F8553F21B9E}']
    { class } function localizedStringForKey(key: NSString): NSString; cdecl;
    { class } function localizedStringForService(service: NSString)
      : NSString; cdecl;
  end;

  CNSocialProfile = interface(NSObject)
    ['{178BFE9F-AB91-48C6-9942-9A60E1D641FE}']
    function urlString: NSString; cdecl;
    function username: NSString; cdecl;
    function userIdentifier: NSString; cdecl;
    function service: NSString; cdecl;
    function initWithUrlString(urlString: NSString; username: NSString;
      userIdentifier: NSString; service: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  TCNSocialProfile = class(TOCGenericImport<CNSocialProfileClass,
    CNSocialProfile>)
  end;

  PCNSocialProfile = Pointer;

  CNInstantMessageAddressClass = interface(NSObjectClass)
    ['{C83505A4-E0A8-45B9-AB22-FA2D9F7E776E}']
    { class } function localizedStringForKey(key: NSString): NSString; cdecl;
    { class } function localizedStringForService(service: NSString)
      : NSString; cdecl;
  end;

  CNInstantMessageAddress = interface(NSObject)
    ['{8C654BC1-49E6-446A-B70A-C80B8E51A127}']
    function username: NSString; cdecl;
    function service: NSString; cdecl;
    function initWithUsername(username: NSString; service: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  TCNInstantMessageAddress = class
    (TOCGenericImport<CNInstantMessageAddressClass, CNInstantMessageAddress>)
  end;

  PCNInstantMessageAddress = Pointer;

  Contacts = interface(IObjectiveC)
    ['{CE7F253E-81D9-493D-9842-235A11EE82DF}']
  end;

  CNContactFetchRequestClass = interface(CNFetchRequestClass)
    ['{23E38679-B55B-4B73-98EE-C2AFD2C4EF5E}']
  end;

  CNContactFetchRequest = interface(CNFetchRequest)
    ['{BCCF8BB4-D7E6-49DB-9235-C0005BAE1C73}']
    function initWithKeysToFetch(keysToFetch: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setPredicate(predicate: NSPredicate); cdecl;
    function predicate: NSPredicate; cdecl;
    procedure setKeysToFetch(keysToFetch: NSArray); cdecl;
    function keysToFetch: NSArray; cdecl;
    procedure setMutableObjects(mutableObjects: Boolean); cdecl;
    function mutableObjects: Boolean; cdecl;
    procedure setUnifyResults(unifyResults: Boolean); cdecl;
    function unifyResults: Boolean; cdecl;
    procedure setSortOrder(sortOrder: CNContactSortOrder); cdecl;
    function sortOrder: CNContactSortOrder; cdecl;
  end;

  TCNContactFetchRequest = class(TOCGenericImport<CNContactFetchRequestClass,
    CNContactFetchRequest>)
  end;

  PCNContactFetchRequest = Pointer;

  CNContactFormatterClass = interface(NSFormatterClass)
    ['{CE523F96-2443-43D8-B3B7-AA77FE1783D1}']
    { class } function descriptorForRequiredKeysForStyle
      (style: CNContactFormatterStyle): Pointer; cdecl;
    { class } function stringFromContact(contact: CNContact;
      style: CNContactFormatterStyle): NSString; cdecl;
    { class } function attributedStringFromContact(contact: CNContact;
      style: CNContactFormatterStyle; defaultAttributes: NSDictionary)
      : NSAttributedString; cdecl;
    { class } function nameOrderForContact(contact: CNContact)
      : CNContactDisplayNameOrder; cdecl;
    { class } function delimiterForContact(contact: CNContact): NSString; cdecl;
  end;

  CNContactFormatter = interface(NSFormatter)
    ['{83409D9F-C4FE-4BDB-8B3A-C6ED13727A14}']
    procedure setDescriptorForRequiredKeysForNameOrder
      (descriptorForRequiredKeysForNameOrder: Pointer); cdecl;
    function descriptorForRequiredKeysForNameOrder: Pointer; cdecl;
    procedure setDescriptorForRequiredKeysForDelimiter
      (descriptorForRequiredKeysForDelimiter: Pointer); cdecl;
    function descriptorForRequiredKeysForDelimiter: Pointer; cdecl;
    procedure setStyle(style: CNContactFormatterStyle); cdecl;
    function style: CNContactFormatterStyle; cdecl;
    function stringFromContact(contact: CNContact): NSString; cdecl;
    function attributedStringFromContact(contact: CNContact;
      defaultAttributes: NSDictionary): NSAttributedString; cdecl;
  end;

  TCNContactFormatter = class(TOCGenericImport<CNContactFormatterClass,
    CNContactFormatter>)
  end;

  PCNContactFormatter = Pointer;

  CNContactPropertyClass = interface(NSObjectClass)
    ['{52186EC0-52E2-4D30-871D-A0658ADFAABD}']
  end;

  CNContactProperty = interface(NSObject)
    ['{7F41E5AF-F4DD-4C4B-88F5-085ED433BC3B}']
    function contact: CNContact; cdecl;
    function key: NSString; cdecl;
    function value: Pointer; cdecl;
    function identifier: NSString; cdecl;
    function &label: NSString; cdecl;
  end;

  TCNContactProperty = class(TOCGenericImport<CNContactPropertyClass,
    CNContactProperty>)
  end;

  PCNContactProperty = Pointer;

  CNContainerClass = interface(NSObjectClass)
    ['{F0DF7C36-9F97-4CF0-B8C5-69E34557D375}']
    { class } function predicateForContainersWithIdentifiers
      (identifiers: NSArray): NSPredicate; cdecl;
    { class } function predicateForContainerOfContactWithIdentifier
      (contactIdentifier: NSString): NSPredicate; cdecl;
    { class } function predicateForContainerOfGroupWithIdentifier
      (groupIdentifier: NSString): NSPredicate; cdecl;
  end;

  CNContainer = interface(NSObject)
    ['{5A0A3C09-F868-401E-8E84-C9EDF13CDF97}']
    function identifier: NSString; cdecl;
    function name: NSString; cdecl;
    function &type: CNContainerType; cdecl;
  end;

  TCNContainer = class(TOCGenericImport<CNContainerClass, CNContainer>)
  end;

  PCNContainer = Pointer;

  CNFetchResultClass = interface(NSObjectClass)
    ['{75D4C9CF-854B-4131-848F-5B323EC94166}']
  end;

  CNFetchResult = interface(NSObject)
    ['{22ACADF9-650A-4D19-B4D9-8110529985A6}']
    function value: ValueType; cdecl;
    function currentHistoryToken: NSData; cdecl;
  end;

  TCNFetchResult = class(TOCGenericImport<CNFetchResultClass, CNFetchResult>)
  end;

  PCNFetchResult = Pointer;

  CNSaveRequestClass = interface(NSObjectClass)
    ['{60D35C7F-BBC2-4E72-88A5-D0DDBF3D5B08}']
  end;

  CNSaveRequest = interface(NSObject)
    ['{1F4B35E5-75FF-4B39-A1DB-344C912945D9}']
    procedure addContact(contact: CNMutableContact;
      toContainerWithIdentifier: NSString); cdecl;
    procedure updateContact(contact: CNMutableContact); cdecl;
    procedure deleteContact(contact: CNMutableContact); cdecl;
    procedure addGroup(group: CNMutableGroup;
      toContainerWithIdentifier: NSString); cdecl;
    procedure updateGroup(group: CNMutableGroup); cdecl;
    procedure deleteGroup(group: CNMutableGroup); cdecl;
    procedure addSubgroup(subgroup: CNGroup; toGroup: CNGroup); cdecl;
    procedure removeSubgroup(subgroup: CNGroup; fromGroup: CNGroup); cdecl;
    procedure addMember(contact: CNContact; toGroup: CNGroup); cdecl;
    procedure removeMember(contact: CNContact; fromGroup: CNGroup); cdecl;
    procedure setTransactionAuthor(transactionAuthor: NSString); cdecl;
    function transactionAuthor: NSString; cdecl;
    procedure setShouldRefetchContacts(shouldRefetchContacts: Boolean); cdecl;
    function shouldRefetchContacts: Boolean; cdecl;
  end;

  TCNSaveRequest = class(TOCGenericImport<CNSaveRequestClass, CNSaveRequest>)
  end;

  PCNSaveRequest = Pointer;

  CNContactStoreClass = interface(NSObjectClass)
    ['{FD54AE7B-D4E7-46EB-818C-C8C5F23955CD}']
    { class } function authorizationStatusForEntityType
      (entityType: CNEntityType): CNAuthorizationStatus; cdecl;
  end;

  CNContactStore = interface(NSObject)
    ['{5CDCE2FD-B092-4DE0-BACB-57BBD12BFDDF}']
    procedure requestAccessForEntityType(entityType: CNEntityType;
      completionHandler: TContactsCompletionHandler); cdecl;
    function unifiedContactsMatchingPredicate(predicate: NSPredicate;
      keysToFetch: NSArray; error: NSError): NSArray; cdecl;
    function unifiedContactWithIdentifier(identifier: NSString;
      keysToFetch: NSArray; error: NSError): CNContact; cdecl;
    function unifiedMeContactWithKeysToFetch(keys: NSArray; error: NSError)
      : CNContact; cdecl;
    function enumeratorForContactFetchRequest(request: CNContactFetchRequest;
      error: NSError): CNFetchResult; cdecl;
    function enumeratorForChangeHistoryFetchRequest
      (request: CNChangeHistoryFetchRequest; error: NSError)
      : CNFetchResult; cdecl;
    function enumerateContactsWithFetchRequest(fetchRequest
      : CNContactFetchRequest; error: NSError; usingBlock: TContactsUsingBlock)
      : Boolean; cdecl;
    function groupsMatchingPredicate(predicate: NSPredicate; error: NSError)
      : NSArray; cdecl;
    function containersMatchingPredicate(predicate: NSPredicate; error: NSError)
      : NSArray; cdecl;
    function executeSaveRequest(saveRequest: CNSaveRequest; error: NSError)
      : Boolean; cdecl;
    function currentHistoryToken: NSData; cdecl;
    function defaultContainerIdentifier: NSString; cdecl;
  end;

  TCNContactStore = class(TOCGenericImport<CNContactStoreClass, CNContactStore>)
  end;

  PCNContactStore = Pointer;

  CNContactsUserDefaultsClass = interface(NSObjectClass)
    ['{550A3DF6-04DC-4B90-A5A1-84CFEB786B21}']
    { class } function sharedDefaults: Pointer { instancetype }; cdecl;
  end;

  CNContactsUserDefaults = interface(NSObject)
    ['{28096F22-975C-40D1-B0EE-0AFE3178CE8F}']
    function sortOrder: CNContactSortOrder; cdecl;
    function countryCode: NSString; cdecl;
  end;

  TCNContactsUserDefaults = class(TOCGenericImport<CNContactsUserDefaultsClass,
    CNContactsUserDefaults>)
  end;

  PCNContactsUserDefaults = Pointer;

  CNContactVCardSerializationClass = interface(NSObjectClass)
    ['{7372889C-07C2-41C4-87D0-93F3AD8C7266}']
    { class } function descriptorForRequiredKeys: Pointer; cdecl;
    { class } function dataWithContacts(Contacts: NSArray; error: NSError)
      : NSData; cdecl;
    { class } function contactsWithData(data: NSData; error: NSError)
      : NSArray; cdecl;
  end;

  CNContactVCardSerialization = interface(NSObject)
    ['{37AEFBDC-74C1-4569-A849-9BCAAA558850}']
  end;

  TCNContactVCardSerialization = class
    (TOCGenericImport<CNContactVCardSerializationClass,
    CNContactVCardSerialization>)
  end;

  PCNContactVCardSerialization = Pointer;

  CNMutableContactClass = interface(CNContactClass)
    ['{5178C157-8235-455C-9ABA-6B236CA7C339}']
  end;

  CNMutableContact = interface(CNContact)
    ['{430330AC-1578-4EE8-A184-3668DD34F77C}']
    procedure setContactType(contactType: CNContactType); cdecl;
    function contactType: CNContactType; cdecl;
    procedure setNamePrefix(namePrefix: NSString); cdecl;
    function namePrefix: NSString; cdecl;
    procedure setGivenName(givenName: NSString); cdecl;
    function givenName: NSString; cdecl;
    procedure setMiddleName(middleName: NSString); cdecl;
    function middleName: NSString; cdecl;
    procedure setFamilyName(familyName: NSString); cdecl;
    function familyName: NSString; cdecl;
    procedure setPreviousFamilyName(previousFamilyName: NSString); cdecl;
    function previousFamilyName: NSString; cdecl;
    procedure setNameSuffix(nameSuffix: NSString); cdecl;
    function nameSuffix: NSString; cdecl;
    procedure setNickname(nickname: NSString); cdecl;
    function nickname: NSString; cdecl;
    procedure setOrganizationName(organizationName: NSString); cdecl;
    function organizationName: NSString; cdecl;
    procedure setDepartmentName(departmentName: NSString); cdecl;
    function departmentName: NSString; cdecl;
    procedure setJobTitle(jobTitle: NSString); cdecl;
    function jobTitle: NSString; cdecl;
    procedure setPhoneticGivenName(phoneticGivenName: NSString); cdecl;
    function phoneticGivenName: NSString; cdecl;
    procedure setPhoneticMiddleName(phoneticMiddleName: NSString); cdecl;
    function phoneticMiddleName: NSString; cdecl;
    procedure setPhoneticFamilyName(phoneticFamilyName: NSString); cdecl;
    function phoneticFamilyName: NSString; cdecl;
    procedure setPhoneticOrganizationName(phoneticOrganizationName
      : NSString); cdecl;
    function phoneticOrganizationName: NSString; cdecl;
    procedure setNote(note: NSString); cdecl;
    function note: NSString; cdecl;
    procedure setImageData(imageData: NSData); cdecl;
    function imageData: NSData; cdecl;
    procedure setPhoneNumbers(phoneNumbers: NSArray); cdecl;
    function phoneNumbers: NSArray; cdecl;
    procedure setEmailAddresses(emailAddresses: NSArray); cdecl;
    function emailAddresses: NSArray; cdecl;
    procedure setPostalAddresses(postalAddresses: NSArray); cdecl;
    function postalAddresses: NSArray; cdecl;
    procedure setUrlAddresses(urlAddresses: NSArray); cdecl;
    function urlAddresses: NSArray; cdecl;
    procedure setContactRelations(contactRelations: NSArray); cdecl;
    function contactRelations: NSArray; cdecl;
    procedure setSocialProfiles(socialProfiles: NSArray); cdecl;
    function socialProfiles: NSArray; cdecl;
    procedure setInstantMessageAddresses(instantMessageAddresses
      : NSArray); cdecl;
    function instantMessageAddresses: NSArray; cdecl;
    procedure setBirthday(birthday: NSDateComponents); cdecl;
    function birthday: NSDateComponents; cdecl;
    procedure setNonGregorianBirthday(nonGregorianBirthday
      : NSDateComponents); cdecl;
    function nonGregorianBirthday: NSDateComponents; cdecl;
    procedure setDates(dates: NSArray); cdecl;
    function dates: NSArray; cdecl;
  end;

  TCNMutableContact = class(TOCGenericImport<CNMutableContactClass,
    CNMutableContact>)
  end;

  PCNMutableContact = Pointer;

  CNMutableGroupClass = interface(CNGroupClass)
    ['{189A9603-8C36-47D8-AF59-3FE9885A880F}']
  end;

  CNMutableGroup = interface(CNGroup)
    ['{502F27F5-1B14-48FA-A94D-FD05D5338577}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TCNMutableGroup = class(TOCGenericImport<CNMutableGroupClass, CNMutableGroup>)
  end;

  PCNMutableGroup = Pointer;

  CNMutablePostalAddressClass = interface(CNPostalAddressClass)
    ['{B403DA08-86BC-442E-B497-A755625A5463}']
  end;

  CNMutablePostalAddress = interface(CNPostalAddress)
    ['{5928DB63-5A4A-4964-8D3D-116D76E3F4E7}']
    procedure setStreet(street: NSString); cdecl;
    function street: NSString; cdecl;
    procedure setSubLocality(subLocality: NSString); cdecl;
    function subLocality: NSString; cdecl;
    procedure setCity(city: NSString); cdecl;
    function city: NSString; cdecl;
    procedure setSubAdministrativeArea(subAdministrativeArea: NSString); cdecl;
    function subAdministrativeArea: NSString; cdecl;
    procedure setState(state: NSString); cdecl;
    function state: NSString; cdecl;
    procedure setPostalCode(postalCode: NSString); cdecl;
    function postalCode: NSString; cdecl;
    procedure setCountry(country: NSString); cdecl;
    function country: NSString; cdecl;
    procedure setISOCountryCode(ISOCountryCode: NSString); cdecl;
    function ISOCountryCode: NSString; cdecl;
  end;

  TCNMutablePostalAddress = class(TOCGenericImport<CNMutablePostalAddressClass,
    CNMutablePostalAddress>)
  end;

  PCNMutablePostalAddress = Pointer;

  CNPostalAddressFormatterClass = interface(NSFormatterClass)
    ['{7D2D0F6B-DDBC-476A-B58D-BBA7FFED4D21}']
    { class } function stringFromPostalAddress(postalAddress: CNPostalAddress;
      style: CNPostalAddressFormatterStyle): NSString; cdecl;
    { class } function attributedStringFromPostalAddress(postalAddress
      : CNPostalAddress; style: CNPostalAddressFormatterStyle;
      withDefaultAttributes: NSDictionary): NSAttributedString; cdecl;
  end;

  CNPostalAddressFormatter = interface(NSFormatter)
    ['{FB962CC1-4DE3-4E85-B109-26373E06AA13}']
    procedure setStyle(style: CNPostalAddressFormatterStyle); cdecl;
    function style: CNPostalAddressFormatterStyle; cdecl;
    function stringFromPostalAddress(postalAddress: CNPostalAddress)
      : NSString; cdecl;
    function attributedStringFromPostalAddress(postalAddress: CNPostalAddress;
      withDefaultAttributes: NSDictionary): NSAttributedString; cdecl;
  end;

  TCNPostalAddressFormatter = class
    (TOCGenericImport<CNPostalAddressFormatterClass, CNPostalAddressFormatter>)
  end;

  PCNPostalAddressFormatter = Pointer;

  // ===== Protocol declarations =====

  CNChangeHistoryEventVisitor = interface(IObjectiveC)
    ['{53523C9D-DC24-406E-BD40-4A23B77447A0}']
    procedure visitDropEverythingEvent
      (event: CNChangeHistoryDropEverythingEvent); cdecl;
    procedure visitAddContactEvent
      (event: CNChangeHistoryAddContactEvent); cdecl;
    procedure visitUpdateContactEvent
      (event: CNChangeHistoryUpdateContactEvent); cdecl;
    procedure visitDeleteContactEvent
      (event: CNChangeHistoryDeleteContactEvent); cdecl;
    procedure visitAddGroupEvent(event: CNChangeHistoryAddGroupEvent); cdecl;
    procedure visitUpdateGroupEvent
      (event: CNChangeHistoryUpdateGroupEvent); cdecl;
    procedure visitDeleteGroupEvent
      (event: CNChangeHistoryDeleteGroupEvent); cdecl;
    procedure visitAddMemberToGroupEvent
      (event: CNChangeHistoryAddMemberToGroupEvent); cdecl;
    procedure visitRemoveMemberFromGroupEvent
      (event: CNChangeHistoryRemoveMemberFromGroupEvent); cdecl;
    procedure visitAddSubgroupToGroupEvent
      (event: CNChangeHistoryAddSubgroupToGroupEvent); cdecl;
    procedure visitRemoveSubgroupFromGroupEvent
      (event: CNChangeHistoryRemoveSubgroupFromGroupEvent); cdecl;
  end;

  CNKeyDescriptor = interface(IObjectiveC)
    ['{6DD16EE9-660F-45C1-9FF7-AE887C5AC90B}']
  end;

  // ===== Exported string consts =====

function CNLabelHome: NSString;
function CNLabelWork: NSString;
function CNLabelSchool: NSString;
function CNLabelOther: NSString;
function CNLabelEmailiCloud: NSString;
function CNLabelURLAddressHomePage: NSString;
function CNLabelDateAnniversary: NSString;
function CNLabelPhoneNumberiPhone: NSString;
function CNLabelPhoneNumberAppleWatch: NSString;
function CNLabelPhoneNumberMobile: NSString;
function CNLabelPhoneNumberMain: NSString;
function CNLabelPhoneNumberHomeFax: NSString;
function CNLabelPhoneNumberWorkFax: NSString;
function CNLabelPhoneNumberOtherFax: NSString;
function CNLabelPhoneNumberPager: NSString;
function CNPostalAddressStreetKey: NSString;
function CNPostalAddressSubLocalityKey: NSString;
function CNPostalAddressCityKey: NSString;
function CNPostalAddressSubAdministrativeAreaKey: NSString;
function CNPostalAddressStateKey: NSString;
function CNPostalAddressPostalCodeKey: NSString;
function CNPostalAddressCountryKey: NSString;
function CNPostalAddressISOCountryCodeKey: NSString;
function CNLabelContactRelationAssistant: NSString;
function CNLabelContactRelationManager: NSString;
function CNLabelContactRelationColleague: NSString;
function CNLabelContactRelationTeacher: NSString;
function CNLabelContactRelationSibling: NSString;
function CNLabelContactRelationYoungerSibling: NSString;
function CNLabelContactRelationElderSibling: NSString;
function CNLabelContactRelationSister: NSString;
function CNLabelContactRelationYoungerSister: NSString;
function CNLabelContactRelationYoungestSister: NSString;
function CNLabelContactRelationElderSister: NSString;
function CNLabelContactRelationEldestSister: NSString;
function CNLabelContactRelationBrother: NSString;
function CNLabelContactRelationYoungerBrother: NSString;
function CNLabelContactRelationYoungestBrother: NSString;
function CNLabelContactRelationElderBrother: NSString;
function CNLabelContactRelationEldestBrother: NSString;
function CNLabelContactRelationFriend: NSString;
function CNLabelContactRelationMaleFriend: NSString;
function CNLabelContactRelationFemaleFriend: NSString;
function CNLabelContactRelationSpouse: NSString;
function CNLabelContactRelationWife: NSString;
function CNLabelContactRelationHusband: NSString;
function CNLabelContactRelationPartner: NSString;
function CNLabelContactRelationMalePartner: NSString;
function CNLabelContactRelationFemalePartner: NSString;
function CNLabelContactRelationGirlfriendOrBoyfriend: NSString;
function CNLabelContactRelationGirlfriend: NSString;
function CNLabelContactRelationBoyfriend: NSString;
function CNLabelContactRelationParent: NSString;
function CNLabelContactRelationMother: NSString;
function CNLabelContactRelationFather: NSString;
function CNLabelContactRelationChild: NSString;
function CNLabelContactRelationDaughter: NSString;
function CNLabelContactRelationSon: NSString;
function CNLabelContactRelationGrandparent: NSString;
function CNLabelContactRelationGrandmother: NSString;
function CNLabelContactRelationGrandmotherMothersMother: NSString;
function CNLabelContactRelationGrandmotherFathersMother: NSString;
function CNLabelContactRelationGrandfather: NSString;
function CNLabelContactRelationGrandfatherMothersFather: NSString;
function CNLabelContactRelationGrandfatherFathersFather: NSString;
function CNLabelContactRelationGreatGrandparent: NSString;
function CNLabelContactRelationGreatGrandmother: NSString;
function CNLabelContactRelationGreatGrandfather: NSString;
function CNLabelContactRelationGrandchild: NSString;
function CNLabelContactRelationGranddaughter: NSString;
function CNLabelContactRelationGranddaughterDaughtersDaughter: NSString;
function CNLabelContactRelationGranddaughterSonsDaughter: NSString;
function CNLabelContactRelationGrandson: NSString;
function CNLabelContactRelationGrandsonDaughtersSon: NSString;
function CNLabelContactRelationGrandsonSonsSon: NSString;
function CNLabelContactRelationGreatGrandchild: NSString;
function CNLabelContactRelationGreatGranddaughter: NSString;
function CNLabelContactRelationGreatGrandson: NSString;
function CNLabelContactRelationParentInLaw: NSString;
function CNLabelContactRelationMotherInLaw: NSString;
function CNLabelContactRelationMotherInLawWifesMother: NSString;
function CNLabelContactRelationMotherInLawHusbandsMother: NSString;
function CNLabelContactRelationFatherInLaw: NSString;
function CNLabelContactRelationFatherInLawWifesFather: NSString;
function CNLabelContactRelationFatherInLawHusbandsFather: NSString;
function CNLabelContactRelationCoParentInLaw: NSString;
function CNLabelContactRelationCoMotherInLaw: NSString;
function CNLabelContactRelationCoFatherInLaw: NSString;
function CNLabelContactRelationSiblingInLaw: NSString;
function CNLabelContactRelationYoungerSiblingInLaw: NSString;
function CNLabelContactRelationElderSiblingInLaw: NSString;
function CNLabelContactRelationSisterInLaw: NSString;
function CNLabelContactRelationYoungerSisterInLaw: NSString;
function CNLabelContactRelationElderSisterInLaw: NSString;
function CNLabelContactRelationSisterInLawSpousesSister: NSString;
function CNLabelContactRelationSisterInLawWifesSister: NSString;
function CNLabelContactRelationSisterInLawHusbandsSister: NSString;
function CNLabelContactRelationSisterInLawBrothersWife: NSString;
function CNLabelContactRelationSisterInLawYoungerBrothersWife: NSString;
function CNLabelContactRelationSisterInLawElderBrothersWife: NSString;
function CNLabelContactRelationBrotherInLaw: NSString;
function CNLabelContactRelationYoungerBrotherInLaw: NSString;
function CNLabelContactRelationElderBrotherInLaw: NSString;
function CNLabelContactRelationBrotherInLawSpousesBrother: NSString;
function CNLabelContactRelationBrotherInLawHusbandsBrother: NSString;
function CNLabelContactRelationBrotherInLawWifesBrother: NSString;
function CNLabelContactRelationBrotherInLawSistersHusband: NSString;
function CNLabelContactRelationBrotherInLawYoungerSistersHusband: NSString;
function CNLabelContactRelationBrotherInLawElderSistersHusband: NSString;
function CNLabelContactRelationSisterInLawWifesBrothersWife: NSString;
function CNLabelContactRelationSisterInLawHusbandsBrothersWife: NSString;
function CNLabelContactRelationBrotherInLawWifesSistersHusband: NSString;
function CNLabelContactRelationBrotherInLawHusbandsSistersHusband: NSString;
function CNLabelContactRelationCoSiblingInLaw: NSString;
function CNLabelContactRelationCoSisterInLaw: NSString;
function CNLabelContactRelationCoBrotherInLaw: NSString;
function CNLabelContactRelationChildInLaw: NSString;
function CNLabelContactRelationDaughterInLaw: NSString;
function CNLabelContactRelationSonInLaw: NSString;
function CNLabelContactRelationCousin: NSString;
function CNLabelContactRelationYoungerCousin: NSString;
function CNLabelContactRelationElderCousin: NSString;
function CNLabelContactRelationMaleCousin: NSString;
function CNLabelContactRelationFemaleCousin: NSString;
function CNLabelContactRelationCousinParentsSiblingsChild: NSString;
function CNLabelContactRelationCousinParentsSiblingsSon: NSString;
function CNLabelContactRelationYoungerCousinParentsSiblingsSon: NSString;
function CNLabelContactRelationElderCousinParentsSiblingsSon: NSString;
function CNLabelContactRelationCousinParentsSiblingsDaughter: NSString;
function CNLabelContactRelationYoungerCousinParentsSiblingsDaughter: NSString;
function CNLabelContactRelationElderCousinParentsSiblingsDaughter: NSString;
function CNLabelContactRelationCousinMothersSistersDaughter: NSString;
function CNLabelContactRelationYoungerCousinMothersSistersDaughter: NSString;
function CNLabelContactRelationElderCousinMothersSistersDaughter: NSString;
function CNLabelContactRelationCousinMothersSistersSon: NSString;
function CNLabelContactRelationYoungerCousinMothersSistersSon: NSString;
function CNLabelContactRelationElderCousinMothersSistersSon: NSString;
function CNLabelContactRelationCousinMothersBrothersDaughter: NSString;
function CNLabelContactRelationYoungerCousinMothersBrothersDaughter: NSString;
function CNLabelContactRelationElderCousinMothersBrothersDaughter: NSString;
function CNLabelContactRelationCousinMothersBrothersSon: NSString;
function CNLabelContactRelationYoungerCousinMothersBrothersSon: NSString;
function CNLabelContactRelationElderCousinMothersBrothersSon: NSString;
function CNLabelContactRelationCousinFathersSistersDaughter: NSString;
function CNLabelContactRelationYoungerCousinFathersSistersDaughter: NSString;
function CNLabelContactRelationElderCousinFathersSistersDaughter: NSString;
function CNLabelContactRelationCousinFathersSistersSon: NSString;
function CNLabelContactRelationYoungerCousinFathersSistersSon: NSString;
function CNLabelContactRelationElderCousinFathersSistersSon: NSString;
function CNLabelContactRelationCousinFathersBrothersDaughter: NSString;
function CNLabelContactRelationYoungerCousinFathersBrothersDaughter: NSString;
function CNLabelContactRelationElderCousinFathersBrothersDaughter: NSString;
function CNLabelContactRelationCousinFathersBrothersSon: NSString;
function CNLabelContactRelationYoungerCousinFathersBrothersSon: NSString;
function CNLabelContactRelationElderCousinFathersBrothersSon: NSString;
function CNLabelContactRelationCousinGrandparentsSiblingsChild: NSString;
function CNLabelContactRelationCousinGrandparentsSiblingsDaughter: NSString;
function CNLabelContactRelationCousinGrandparentsSiblingsSon: NSString;
function CNLabelContactRelationYoungerCousinMothersSiblingsSonOrFathersSistersSon
  : NSString;
function CNLabelContactRelationElderCousinMothersSiblingsSonOrFathersSistersSon
  : NSString;
function CNLabelContactRelationYoungerCousinMothersSiblingsDaughterOrFathersSistersDaughter
  : NSString;
function CNLabelContactRelationElderCousinMothersSiblingsDaughterOrFathersSistersDaughter
  : NSString;
function CNLabelContactRelationParentsSibling: NSString;
function CNLabelContactRelationParentsYoungerSibling: NSString;
function CNLabelContactRelationParentsElderSibling: NSString;
function CNLabelContactRelationParentsSiblingMothersSibling: NSString;
function CNLabelContactRelationParentsSiblingMothersYoungerSibling: NSString;
function CNLabelContactRelationParentsSiblingMothersElderSibling: NSString;
function CNLabelContactRelationParentsSiblingFathersSibling: NSString;
function CNLabelContactRelationParentsSiblingFathersYoungerSibling: NSString;
function CNLabelContactRelationParentsSiblingFathersElderSibling: NSString;
function CNLabelContactRelationAunt: NSString;
function CNLabelContactRelationAuntParentsSister: NSString;
function CNLabelContactRelationAuntParentsYoungerSister: NSString;
function CNLabelContactRelationAuntParentsElderSister: NSString;
function CNLabelContactRelationAuntFathersSister: NSString;
function CNLabelContactRelationAuntFathersYoungerSister: NSString;
function CNLabelContactRelationAuntFathersElderSister: NSString;
function CNLabelContactRelationAuntFathersBrothersWife: NSString;
function CNLabelContactRelationAuntFathersYoungerBrothersWife: NSString;
function CNLabelContactRelationAuntFathersElderBrothersWife: NSString;
function CNLabelContactRelationAuntMothersSister: NSString;
function CNLabelContactRelationAuntMothersYoungerSister: NSString;
function CNLabelContactRelationAuntMothersElderSister: NSString;
function CNLabelContactRelationAuntMothersBrothersWife: NSString;
function CNLabelContactRelationGrandaunt: NSString;
function CNLabelContactRelationUncle: NSString;
function CNLabelContactRelationUncleParentsBrother: NSString;
function CNLabelContactRelationUncleParentsYoungerBrother: NSString;
function CNLabelContactRelationUncleParentsElderBrother: NSString;
function CNLabelContactRelationUncleMothersBrother: NSString;
function CNLabelContactRelationUncleMothersYoungerBrother: NSString;
function CNLabelContactRelationUncleMothersElderBrother: NSString;
function CNLabelContactRelationUncleMothersSistersHusband: NSString;
function CNLabelContactRelationUncleFathersBrother: NSString;
function CNLabelContactRelationUncleFathersYoungerBrother: NSString;
function CNLabelContactRelationUncleFathersElderBrother: NSString;
function CNLabelContactRelationUncleFathersSistersHusband: NSString;
function CNLabelContactRelationUncleFathersYoungerSistersHusband: NSString;
function CNLabelContactRelationUncleFathersElderSistersHusband: NSString;
function CNLabelContactRelationGranduncle: NSString;
function CNLabelContactRelationSiblingsChild: NSString;
function CNLabelContactRelationNiece: NSString;
function CNLabelContactRelationNieceSistersDaughter: NSString;
function CNLabelContactRelationNieceBrothersDaughter: NSString;
function CNLabelContactRelationNieceSistersDaughterOrWifesSiblingsDaughter
  : NSString;
function CNLabelContactRelationNieceBrothersDaughterOrHusbandsSiblingsDaughter
  : NSString;
function CNLabelContactRelationNephew: NSString;
function CNLabelContactRelationNephewSistersSon: NSString;
function CNLabelContactRelationNephewBrothersSon: NSString;
function CNLabelContactRelationNephewBrothersSonOrHusbandsSiblingsSon: NSString;
function CNLabelContactRelationNephewSistersSonOrWifesSiblingsSon: NSString;
function CNLabelContactRelationGrandniece: NSString;
function CNLabelContactRelationGrandnieceSistersGranddaughter: NSString;
function CNLabelContactRelationGrandnieceBrothersGranddaughter: NSString;
function CNLabelContactRelationGrandnephew: NSString;
function CNLabelContactRelationGrandnephewSistersGrandson: NSString;
function CNLabelContactRelationGrandnephewBrothersGrandson: NSString;
function CNLabelContactRelationStepparent: NSString;
function CNLabelContactRelationStepmother: NSString;
function CNLabelContactRelationStepfather: NSString;
function CNLabelContactRelationStepchild: NSString;
function CNLabelContactRelationStepdaughter: NSString;
function CNLabelContactRelationStepson: NSString;
function CNLabelContactRelationStepsister: NSString;
function CNLabelContactRelationStepbrother: NSString;
function CNLabelContactRelationMotherInLawOrStepmother: NSString;
function CNLabelContactRelationFatherInLawOrStepfather: NSString;
function CNLabelContactRelationDaughterInLawOrStepdaughter: NSString;
function CNLabelContactRelationSonInLawOrStepson: NSString;
function CNLabelContactRelationCousinOrSiblingsChild: NSString;
function CNLabelContactRelationNieceOrCousin: NSString;
function CNLabelContactRelationNephewOrCousin: NSString;
function CNLabelContactRelationGrandchildOrSiblingsChild: NSString;
function CNLabelContactRelationGranddaughterOrNiece: NSString;
function CNLabelContactRelationGrandsonOrNephew: NSString;
function CNLabelContactRelationGreatGrandchildOrSiblingsGrandchild: NSString;
function CNLabelContactRelationDaughterInLawOrSisterInLaw: NSString;
function CNLabelContactRelationSonInLawOrBrotherInLaw: NSString;
function CNSocialProfileURLStringKey: NSString;
function CNSocialProfileUsernameKey: NSString;
function CNSocialProfileUserIdentifierKey: NSString;
function CNSocialProfileServiceKey: NSString;
function CNSocialProfileServiceFacebook: NSString;
function CNSocialProfileServiceFlickr: NSString;
function CNSocialProfileServiceLinkedIn: NSString;
function CNSocialProfileServiceMySpace: NSString;
function CNSocialProfileServiceSinaWeibo: NSString;
function CNSocialProfileServiceTencentWeibo: NSString;
function CNSocialProfileServiceTwitter: NSString;
function CNSocialProfileServiceYelp: NSString;
function CNSocialProfileServiceGameCenter: NSString;
function CNInstantMessageAddressUsernameKey: NSString;
function CNInstantMessageAddressServiceKey: NSString;
function CNInstantMessageServiceAIM: NSString;
function CNInstantMessageServiceFacebook: NSString;
function CNInstantMessageServiceGaduGadu: NSString;
function CNInstantMessageServiceGoogleTalk: NSString;
function CNInstantMessageServiceICQ: NSString;
function CNInstantMessageServiceJabber: NSString;
function CNInstantMessageServiceMSN: NSString;
function CNInstantMessageServiceQQ: NSString;
function CNInstantMessageServiceSkype: NSString;
function CNInstantMessageServiceYahoo: NSString;
function CNContactPropertyNotFetchedExceptionName: NSString;
function CNContactIdentifierKey: NSString;
function CNContactNamePrefixKey: NSString;
function CNContactGivenNameKey: NSString;
function CNContactMiddleNameKey: NSString;
function CNContactFamilyNameKey: NSString;
function CNContactPreviousFamilyNameKey: NSString;
function CNContactNameSuffixKey: NSString;
function CNContactNicknameKey: NSString;
function CNContactOrganizationNameKey: NSString;
function CNContactDepartmentNameKey: NSString;
function CNContactJobTitleKey: NSString;
function CNContactPhoneticGivenNameKey: NSString;
function CNContactPhoneticMiddleNameKey: NSString;
function CNContactPhoneticFamilyNameKey: NSString;
function CNContactPhoneticOrganizationNameKey: NSString;
function CNContactBirthdayKey: NSString;
function CNContactNonGregorianBirthdayKey: NSString;
function CNContactNoteKey: NSString;
function CNContactImageDataKey: NSString;
function CNContactThumbnailImageDataKey: NSString;
function CNContactImageDataAvailableKey: NSString;
function CNContactTypeKey: NSString;
function CNContactPhoneNumbersKey: NSString;
function CNContactEmailAddressesKey: NSString;
function CNContactPostalAddressesKey: NSString;
function CNContactDatesKey: NSString;
function CNContactUrlAddressesKey: NSString;
function CNContactRelationsKey: NSString;
function CNContactSocialProfilesKey: NSString;
function CNContactInstantMessageAddressesKey: NSString;
function CNContactPropertyAttribute: NSString;
function CNContactStoreDidChangeNotification: NSString;
function CNContainerIdentifierKey: NSString;
function CNContainerNameKey: NSString;
function CNContainerTypeKey: NSString;
function CNErrorDomain: NSString;
function CNErrorUserInfoAffectedRecordsKey: NSString;
function CNErrorUserInfoAffectedRecordIdentifiersKey: NSString;
function CNErrorUserInfoValidationErrorsKey: NSString;
function CNErrorUserInfoKeyPathsKey: NSString;
function CNGroupIdentifierKey: NSString;
function CNGroupNameKey: NSString;
function CNPostalAddressPropertyAttribute: NSString;
function CNPostalAddressLocalizedPropertyNameAttribute: NSString;


// ===== External functions =====

const
  libContacts = '/System/Library/Frameworks/Contacts.framework/Contacts';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  ContactsModule: THandle;

{$ENDIF IOS}

function CNLabelHome: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelHome');
end;

function CNLabelWork: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelWork');
end;

function CNLabelSchool: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelSchool');
end;

function CNLabelOther: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelOther');
end;

function CNLabelEmailiCloud: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelEmailiCloud');
end;

function CNLabelURLAddressHomePage: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelURLAddressHomePage');
end;

function CNLabelDateAnniversary: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelDateAnniversary');
end;

function CNLabelPhoneNumberiPhone: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberiPhone');
end;

function CNLabelPhoneNumberAppleWatch: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberAppleWatch');
end;

function CNLabelPhoneNumberMobile: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberMobile');
end;

function CNLabelPhoneNumberMain: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberMain');
end;

function CNLabelPhoneNumberHomeFax: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberHomeFax');
end;

function CNLabelPhoneNumberWorkFax: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberWorkFax');
end;

function CNLabelPhoneNumberOtherFax: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberOtherFax');
end;

function CNLabelPhoneNumberPager: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelPhoneNumberPager');
end;

function CNPostalAddressStreetKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressStreetKey');
end;

function CNPostalAddressSubLocalityKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressSubLocalityKey');
end;

function CNPostalAddressCityKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressCityKey');
end;

function CNPostalAddressSubAdministrativeAreaKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNPostalAddressSubAdministrativeAreaKey');
end;

function CNPostalAddressStateKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressStateKey');
end;

function CNPostalAddressPostalCodeKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressPostalCodeKey');
end;

function CNPostalAddressCountryKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressCountryKey');
end;

function CNPostalAddressISOCountryCodeKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressISOCountryCodeKey');
end;

function CNLabelContactRelationAssistant: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationAssistant');
end;

function CNLabelContactRelationManager: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationManager');
end;

function CNLabelContactRelationColleague: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationColleague');
end;

function CNLabelContactRelationTeacher: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationTeacher');
end;

function CNLabelContactRelationSibling: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationSibling');
end;

function CNLabelContactRelationYoungerSibling: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerSibling');
end;

function CNLabelContactRelationElderSibling: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderSibling');
end;

function CNLabelContactRelationSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationSister');
end;

function CNLabelContactRelationYoungerSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerSister');
end;

function CNLabelContactRelationYoungestSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungestSister');
end;

function CNLabelContactRelationElderSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderSister');
end;

function CNLabelContactRelationEldestSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationEldestSister');
end;

function CNLabelContactRelationBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationBrother');
end;

function CNLabelContactRelationYoungerBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerBrother');
end;

function CNLabelContactRelationYoungestBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungestBrother');
end;

function CNLabelContactRelationElderBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderBrother');
end;

function CNLabelContactRelationEldestBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationEldestBrother');
end;

function CNLabelContactRelationFriend: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationFriend');
end;

function CNLabelContactRelationMaleFriend: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationMaleFriend');
end;

function CNLabelContactRelationFemaleFriend: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationFemaleFriend');
end;

function CNLabelContactRelationSpouse: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationSpouse');
end;

function CNLabelContactRelationWife: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationWife');
end;

function CNLabelContactRelationHusband: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationHusband');
end;

function CNLabelContactRelationPartner: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationPartner');
end;

function CNLabelContactRelationMalePartner: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationMalePartner');
end;

function CNLabelContactRelationFemalePartner: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationFemalePartner');
end;

function CNLabelContactRelationGirlfriendOrBoyfriend: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGirlfriendOrBoyfriend');
end;

function CNLabelContactRelationGirlfriend: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationGirlfriend');
end;

function CNLabelContactRelationBoyfriend: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationBoyfriend');
end;

function CNLabelContactRelationParent: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationParent');
end;

function CNLabelContactRelationMother: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationMother');
end;

function CNLabelContactRelationFather: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationFather');
end;

function CNLabelContactRelationChild: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationChild');
end;

function CNLabelContactRelationDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationDaughter');
end;

function CNLabelContactRelationSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationSon');
end;

function CNLabelContactRelationGrandparent: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandparent');
end;

function CNLabelContactRelationGrandmother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandmother');
end;

function CNLabelContactRelationGrandmotherMothersMother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandmotherMothersMother');
end;

function CNLabelContactRelationGrandmotherFathersMother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandmotherFathersMother');
end;

function CNLabelContactRelationGrandfather: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandfather');
end;

function CNLabelContactRelationGrandfatherMothersFather: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandfatherMothersFather');
end;

function CNLabelContactRelationGrandfatherFathersFather: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandfatherFathersFather');
end;

function CNLabelContactRelationGreatGrandparent: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGreatGrandparent');
end;

function CNLabelContactRelationGreatGrandmother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGreatGrandmother');
end;

function CNLabelContactRelationGreatGrandfather: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGreatGrandfather');
end;

function CNLabelContactRelationGrandchild: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationGrandchild');
end;

function CNLabelContactRelationGranddaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGranddaughter');
end;

function CNLabelContactRelationGranddaughterDaughtersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGranddaughterDaughtersDaughter');
end;

function CNLabelContactRelationGranddaughterSonsDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGranddaughterSonsDaughter');
end;

function CNLabelContactRelationGrandson: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationGrandson');
end;

function CNLabelContactRelationGrandsonDaughtersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandsonDaughtersSon');
end;

function CNLabelContactRelationGrandsonSonsSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandsonSonsSon');
end;

function CNLabelContactRelationGreatGrandchild: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGreatGrandchild');
end;

function CNLabelContactRelationGreatGranddaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGreatGranddaughter');
end;

function CNLabelContactRelationGreatGrandson: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGreatGrandson');
end;

function CNLabelContactRelationParentInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationParentInLaw');
end;

function CNLabelContactRelationMotherInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationMotherInLaw');
end;

function CNLabelContactRelationMotherInLawWifesMother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationMotherInLawWifesMother');
end;

function CNLabelContactRelationMotherInLawHusbandsMother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationMotherInLawHusbandsMother');
end;

function CNLabelContactRelationFatherInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationFatherInLaw');
end;

function CNLabelContactRelationFatherInLawWifesFather: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationFatherInLawWifesFather');
end;

function CNLabelContactRelationFatherInLawHusbandsFather: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationFatherInLawHusbandsFather');
end;

function CNLabelContactRelationCoParentInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCoParentInLaw');
end;

function CNLabelContactRelationCoMotherInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCoMotherInLaw');
end;

function CNLabelContactRelationCoFatherInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCoFatherInLaw');
end;

function CNLabelContactRelationSiblingInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationSiblingInLaw');
end;

function CNLabelContactRelationYoungerSiblingInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerSiblingInLaw');
end;

function CNLabelContactRelationElderSiblingInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderSiblingInLaw');
end;

function CNLabelContactRelationSisterInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationSisterInLaw');
end;

function CNLabelContactRelationYoungerSisterInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerSisterInLaw');
end;

function CNLabelContactRelationElderSisterInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderSisterInLaw');
end;

function CNLabelContactRelationSisterInLawSpousesSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationSisterInLawSpousesSister');
end;

function CNLabelContactRelationSisterInLawWifesSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationSisterInLawWifesSister');
end;

function CNLabelContactRelationSisterInLawHusbandsSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationSisterInLawHusbandsSister');
end;

function CNLabelContactRelationSisterInLawBrothersWife: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationSisterInLawBrothersWife');
end;

function CNLabelContactRelationSisterInLawYoungerBrothersWife: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationSisterInLawYoungerBrothersWife');
end;

function CNLabelContactRelationSisterInLawElderBrothersWife: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationSisterInLawElderBrothersWife');
end;

function CNLabelContactRelationBrotherInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationBrotherInLaw');
end;

function CNLabelContactRelationYoungerBrotherInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerBrotherInLaw');
end;

function CNLabelContactRelationElderBrotherInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderBrotherInLaw');
end;

function CNLabelContactRelationBrotherInLawSpousesBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationBrotherInLawSpousesBrother');
end;

function CNLabelContactRelationBrotherInLawHusbandsBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationBrotherInLawHusbandsBrother');
end;

function CNLabelContactRelationBrotherInLawWifesBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationBrotherInLawWifesBrother');
end;

function CNLabelContactRelationBrotherInLawSistersHusband: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationBrotherInLawSistersHusband');
end;

function CNLabelContactRelationBrotherInLawYoungerSistersHusband: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationBrotherInLawYoungerSistersHusband');
end;

function CNLabelContactRelationBrotherInLawElderSistersHusband: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationBrotherInLawElderSistersHusband');
end;

function CNLabelContactRelationSisterInLawWifesBrothersWife: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationSisterInLawWifesBrothersWife');
end;

function CNLabelContactRelationSisterInLawHusbandsBrothersWife: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationSisterInLawHusbandsBrothersWife');
end;

function CNLabelContactRelationBrotherInLawWifesSistersHusband: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationBrotherInLawWifesSistersHusband');
end;

function CNLabelContactRelationBrotherInLawHusbandsSistersHusband: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationBrotherInLawHusbandsSistersHusband');
end;

function CNLabelContactRelationCoSiblingInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCoSiblingInLaw');
end;

function CNLabelContactRelationCoSisterInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCoSisterInLaw');
end;

function CNLabelContactRelationCoBrotherInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCoBrotherInLaw');
end;

function CNLabelContactRelationChildInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationChildInLaw');
end;

function CNLabelContactRelationDaughterInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationDaughterInLaw');
end;

function CNLabelContactRelationSonInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationSonInLaw');
end;

function CNLabelContactRelationCousin: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationCousin');
end;

function CNLabelContactRelationYoungerCousin: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerCousin');
end;

function CNLabelContactRelationElderCousin: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderCousin');
end;

function CNLabelContactRelationMaleCousin: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationMaleCousin');
end;

function CNLabelContactRelationFemaleCousin: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationFemaleCousin');
end;

function CNLabelContactRelationCousinParentsSiblingsChild: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinParentsSiblingsChild');
end;

function CNLabelContactRelationCousinParentsSiblingsSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinParentsSiblingsSon');
end;

function CNLabelContactRelationYoungerCousinParentsSiblingsSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerCousinParentsSiblingsSon');
end;

function CNLabelContactRelationElderCousinParentsSiblingsSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderCousinParentsSiblingsSon');
end;

function CNLabelContactRelationCousinParentsSiblingsDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinParentsSiblingsDaughter');
end;

function CNLabelContactRelationYoungerCousinParentsSiblingsDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerCousinParentsSiblingsDaughter');
end;

function CNLabelContactRelationElderCousinParentsSiblingsDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderCousinParentsSiblingsDaughter');
end;

function CNLabelContactRelationCousinMothersSistersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinMothersSistersDaughter');
end;

function CNLabelContactRelationYoungerCousinMothersSistersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerCousinMothersSistersDaughter');
end;

function CNLabelContactRelationElderCousinMothersSistersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderCousinMothersSistersDaughter');
end;

function CNLabelContactRelationCousinMothersSistersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinMothersSistersSon');
end;

function CNLabelContactRelationYoungerCousinMothersSistersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerCousinMothersSistersSon');
end;

function CNLabelContactRelationElderCousinMothersSistersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderCousinMothersSistersSon');
end;

function CNLabelContactRelationCousinMothersBrothersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinMothersBrothersDaughter');
end;

function CNLabelContactRelationYoungerCousinMothersBrothersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerCousinMothersBrothersDaughter');
end;

function CNLabelContactRelationElderCousinMothersBrothersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderCousinMothersBrothersDaughter');
end;

function CNLabelContactRelationCousinMothersBrothersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinMothersBrothersSon');
end;

function CNLabelContactRelationYoungerCousinMothersBrothersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerCousinMothersBrothersSon');
end;

function CNLabelContactRelationElderCousinMothersBrothersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderCousinMothersBrothersSon');
end;

function CNLabelContactRelationCousinFathersSistersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinFathersSistersDaughter');
end;

function CNLabelContactRelationYoungerCousinFathersSistersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerCousinFathersSistersDaughter');
end;

function CNLabelContactRelationElderCousinFathersSistersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderCousinFathersSistersDaughter');
end;

function CNLabelContactRelationCousinFathersSistersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinFathersSistersSon');
end;

function CNLabelContactRelationYoungerCousinFathersSistersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerCousinFathersSistersSon');
end;

function CNLabelContactRelationElderCousinFathersSistersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderCousinFathersSistersSon');
end;

function CNLabelContactRelationCousinFathersBrothersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinFathersBrothersDaughter');
end;

function CNLabelContactRelationYoungerCousinFathersBrothersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerCousinFathersBrothersDaughter');
end;

function CNLabelContactRelationElderCousinFathersBrothersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderCousinFathersBrothersDaughter');
end;

function CNLabelContactRelationCousinFathersBrothersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinFathersBrothersSon');
end;

function CNLabelContactRelationYoungerCousinFathersBrothersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerCousinFathersBrothersSon');
end;

function CNLabelContactRelationElderCousinFathersBrothersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderCousinFathersBrothersSon');
end;

function CNLabelContactRelationCousinGrandparentsSiblingsChild: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinGrandparentsSiblingsChild');
end;

function CNLabelContactRelationCousinGrandparentsSiblingsDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinGrandparentsSiblingsDaughter');
end;

function CNLabelContactRelationCousinGrandparentsSiblingsSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinGrandparentsSiblingsSon');
end;

function CNLabelContactRelationYoungerCousinMothersSiblingsSonOrFathersSistersSon
  : NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerCousinMothersSiblingsSonOrFathersSistersSon');
end;

function CNLabelContactRelationElderCousinMothersSiblingsSonOrFathersSistersSon
  : NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderCousinMothersSiblingsSonOrFathersSistersSon');
end;

function CNLabelContactRelationYoungerCousinMothersSiblingsDaughterOrFathersSistersDaughter
  : NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationYoungerCousinMothersSiblingsDaughterOrFathersSistersDaughter');
end;

function CNLabelContactRelationElderCousinMothersSiblingsDaughterOrFathersSistersDaughter
  : NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationElderCousinMothersSiblingsDaughterOrFathersSistersDaughter');
end;

function CNLabelContactRelationParentsSibling: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationParentsSibling');
end;

function CNLabelContactRelationParentsYoungerSibling: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationParentsYoungerSibling');
end;

function CNLabelContactRelationParentsElderSibling: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationParentsElderSibling');
end;

function CNLabelContactRelationParentsSiblingMothersSibling: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationParentsSiblingMothersSibling');
end;

function CNLabelContactRelationParentsSiblingMothersYoungerSibling: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationParentsSiblingMothersYoungerSibling');
end;

function CNLabelContactRelationParentsSiblingMothersElderSibling: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationParentsSiblingMothersElderSibling');
end;

function CNLabelContactRelationParentsSiblingFathersSibling: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationParentsSiblingFathersSibling');
end;

function CNLabelContactRelationParentsSiblingFathersYoungerSibling: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationParentsSiblingFathersYoungerSibling');
end;

function CNLabelContactRelationParentsSiblingFathersElderSibling: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationParentsSiblingFathersElderSibling');
end;

function CNLabelContactRelationAunt: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationAunt');
end;

function CNLabelContactRelationAuntParentsSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationAuntParentsSister');
end;

function CNLabelContactRelationAuntParentsYoungerSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationAuntParentsYoungerSister');
end;

function CNLabelContactRelationAuntParentsElderSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationAuntParentsElderSister');
end;

function CNLabelContactRelationAuntFathersSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationAuntFathersSister');
end;

function CNLabelContactRelationAuntFathersYoungerSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationAuntFathersYoungerSister');
end;

function CNLabelContactRelationAuntFathersElderSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationAuntFathersElderSister');
end;

function CNLabelContactRelationAuntFathersBrothersWife: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationAuntFathersBrothersWife');
end;

function CNLabelContactRelationAuntFathersYoungerBrothersWife: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationAuntFathersYoungerBrothersWife');
end;

function CNLabelContactRelationAuntFathersElderBrothersWife: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationAuntFathersElderBrothersWife');
end;

function CNLabelContactRelationAuntMothersSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationAuntMothersSister');
end;

function CNLabelContactRelationAuntMothersYoungerSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationAuntMothersYoungerSister');
end;

function CNLabelContactRelationAuntMothersElderSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationAuntMothersElderSister');
end;

function CNLabelContactRelationAuntMothersBrothersWife: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationAuntMothersBrothersWife');
end;

function CNLabelContactRelationGrandaunt: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationGrandaunt');
end;

function CNLabelContactRelationUncle: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationUncle');
end;

function CNLabelContactRelationUncleParentsBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationUncleParentsBrother');
end;

function CNLabelContactRelationUncleParentsYoungerBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationUncleParentsYoungerBrother');
end;

function CNLabelContactRelationUncleParentsElderBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationUncleParentsElderBrother');
end;

function CNLabelContactRelationUncleMothersBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationUncleMothersBrother');
end;

function CNLabelContactRelationUncleMothersYoungerBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationUncleMothersYoungerBrother');
end;

function CNLabelContactRelationUncleMothersElderBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationUncleMothersElderBrother');
end;

function CNLabelContactRelationUncleMothersSistersHusband: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationUncleMothersSistersHusband');
end;

function CNLabelContactRelationUncleFathersBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationUncleFathersBrother');
end;

function CNLabelContactRelationUncleFathersYoungerBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationUncleFathersYoungerBrother');
end;

function CNLabelContactRelationUncleFathersElderBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationUncleFathersElderBrother');
end;

function CNLabelContactRelationUncleFathersSistersHusband: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationUncleFathersSistersHusband');
end;

function CNLabelContactRelationUncleFathersYoungerSistersHusband: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationUncleFathersYoungerSistersHusband');
end;

function CNLabelContactRelationUncleFathersElderSistersHusband: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationUncleFathersElderSistersHusband');
end;

function CNLabelContactRelationGranduncle: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationGranduncle');
end;

function CNLabelContactRelationSiblingsChild: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationSiblingsChild');
end;

function CNLabelContactRelationNiece: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationNiece');
end;

function CNLabelContactRelationNieceSistersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationNieceSistersDaughter');
end;

function CNLabelContactRelationNieceBrothersDaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationNieceBrothersDaughter');
end;

function CNLabelContactRelationNieceSistersDaughterOrWifesSiblingsDaughter
  : NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationNieceSistersDaughterOrWifesSiblingsDaughter');
end;

function CNLabelContactRelationNieceBrothersDaughterOrHusbandsSiblingsDaughter
  : NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationNieceBrothersDaughterOrHusbandsSiblingsDaughter');
end;

function CNLabelContactRelationNephew: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationNephew');
end;

function CNLabelContactRelationNephewSistersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationNephewSistersSon');
end;

function CNLabelContactRelationNephewBrothersSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationNephewBrothersSon');
end;

function CNLabelContactRelationNephewBrothersSonOrHusbandsSiblingsSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationNephewBrothersSonOrHusbandsSiblingsSon');
end;

function CNLabelContactRelationNephewSistersSonOrWifesSiblingsSon: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationNephewSistersSonOrWifesSiblingsSon');
end;

function CNLabelContactRelationGrandniece: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationGrandniece');
end;

function CNLabelContactRelationGrandnieceSistersGranddaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandnieceSistersGranddaughter');
end;

function CNLabelContactRelationGrandnieceBrothersGranddaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandnieceBrothersGranddaughter');
end;

function CNLabelContactRelationGrandnephew: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandnephew');
end;

function CNLabelContactRelationGrandnephewSistersGrandson: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandnephewSistersGrandson');
end;

function CNLabelContactRelationGrandnephewBrothersGrandson: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandnephewBrothersGrandson');
end;

function CNLabelContactRelationStepparent: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationStepparent');
end;

function CNLabelContactRelationStepmother: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationStepmother');
end;

function CNLabelContactRelationStepfather: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationStepfather');
end;

function CNLabelContactRelationStepchild: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationStepchild');
end;

function CNLabelContactRelationStepdaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationStepdaughter');
end;

function CNLabelContactRelationStepson: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationStepson');
end;

function CNLabelContactRelationStepsister: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationStepsister');
end;

function CNLabelContactRelationStepbrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationStepbrother');
end;

function CNLabelContactRelationMotherInLawOrStepmother: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationMotherInLawOrStepmother');
end;

function CNLabelContactRelationFatherInLawOrStepfather: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationFatherInLawOrStepfather');
end;

function CNLabelContactRelationDaughterInLawOrStepdaughter: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationDaughterInLawOrStepdaughter');
end;

function CNLabelContactRelationSonInLawOrStepson: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationSonInLawOrStepson');
end;

function CNLabelContactRelationCousinOrSiblingsChild: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationCousinOrSiblingsChild');
end;

function CNLabelContactRelationNieceOrCousin: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationNieceOrCousin');
end;

function CNLabelContactRelationNephewOrCousin: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationNephewOrCousin');
end;

function CNLabelContactRelationGrandchildOrSiblingsChild: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandchildOrSiblingsChild');
end;

function CNLabelContactRelationGranddaughterOrNiece: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGranddaughterOrNiece');
end;

function CNLabelContactRelationGrandsonOrNephew: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGrandsonOrNephew');
end;

function CNLabelContactRelationGreatGrandchildOrSiblingsGrandchild: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationGreatGrandchildOrSiblingsGrandchild');
end;

function CNLabelContactRelationDaughterInLawOrSisterInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationDaughterInLawOrSisterInLaw');
end;

function CNLabelContactRelationSonInLawOrBrotherInLaw: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNLabelContactRelationSonInLawOrBrotherInLaw');
end;

function CNSocialProfileURLStringKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileURLStringKey');
end;

function CNSocialProfileUsernameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileUsernameKey');
end;

function CNSocialProfileUserIdentifierKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileUserIdentifierKey');
end;

function CNSocialProfileServiceKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceKey');
end;

function CNSocialProfileServiceFacebook: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceFacebook');
end;

function CNSocialProfileServiceFlickr: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceFlickr');
end;

function CNSocialProfileServiceLinkedIn: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceLinkedIn');
end;

function CNSocialProfileServiceMySpace: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceMySpace');
end;

function CNSocialProfileServiceSinaWeibo: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceSinaWeibo');
end;

function CNSocialProfileServiceTencentWeibo: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNSocialProfileServiceTencentWeibo');
end;

function CNSocialProfileServiceTwitter: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceTwitter');
end;

function CNSocialProfileServiceYelp: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceYelp');
end;

function CNSocialProfileServiceGameCenter: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNSocialProfileServiceGameCenter');
end;

function CNInstantMessageAddressUsernameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNInstantMessageAddressUsernameKey');
end;

function CNInstantMessageAddressServiceKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNInstantMessageAddressServiceKey');
end;

function CNInstantMessageServiceAIM: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceAIM');
end;

function CNInstantMessageServiceFacebook: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceFacebook');
end;

function CNInstantMessageServiceGaduGadu: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceGaduGadu');
end;

function CNInstantMessageServiceGoogleTalk: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNInstantMessageServiceGoogleTalk');
end;

function CNInstantMessageServiceICQ: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceICQ');
end;

function CNInstantMessageServiceJabber: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceJabber');
end;

function CNInstantMessageServiceMSN: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceMSN');
end;

function CNInstantMessageServiceQQ: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceQQ');
end;

function CNInstantMessageServiceSkype: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceSkype');
end;

function CNInstantMessageServiceYahoo: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNInstantMessageServiceYahoo');
end;

function CNContactPropertyNotFetchedExceptionName: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNContactPropertyNotFetchedExceptionName');
end;

function CNContactIdentifierKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactIdentifierKey');
end;

function CNContactNamePrefixKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactNamePrefixKey');
end;

function CNContactGivenNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactGivenNameKey');
end;

function CNContactMiddleNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactMiddleNameKey');
end;

function CNContactFamilyNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactFamilyNameKey');
end;

function CNContactPreviousFamilyNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPreviousFamilyNameKey');
end;

function CNContactNameSuffixKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactNameSuffixKey');
end;

function CNContactNicknameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactNicknameKey');
end;

function CNContactOrganizationNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactOrganizationNameKey');
end;

function CNContactDepartmentNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactDepartmentNameKey');
end;

function CNContactJobTitleKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactJobTitleKey');
end;

function CNContactPhoneticGivenNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPhoneticGivenNameKey');
end;

function CNContactPhoneticMiddleNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPhoneticMiddleNameKey');
end;

function CNContactPhoneticFamilyNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPhoneticFamilyNameKey');
end;

function CNContactPhoneticOrganizationNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNContactPhoneticOrganizationNameKey');
end;

function CNContactBirthdayKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactBirthdayKey');
end;

function CNContactNonGregorianBirthdayKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactNonGregorianBirthdayKey');
end;

function CNContactNoteKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactNoteKey');
end;

function CNContactImageDataKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactImageDataKey');
end;

function CNContactThumbnailImageDataKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactThumbnailImageDataKey');
end;

function CNContactImageDataAvailableKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactImageDataAvailableKey');
end;

function CNContactTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactTypeKey');
end;

function CNContactPhoneNumbersKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPhoneNumbersKey');
end;

function CNContactEmailAddressesKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactEmailAddressesKey');
end;

function CNContactPostalAddressesKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPostalAddressesKey');
end;

function CNContactDatesKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactDatesKey');
end;

function CNContactUrlAddressesKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactUrlAddressesKey');
end;

function CNContactRelationsKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactRelationsKey');
end;

function CNContactSocialProfilesKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactSocialProfilesKey');
end;

function CNContactInstantMessageAddressesKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNContactInstantMessageAddressesKey');
end;

function CNContactPropertyAttribute: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContactPropertyAttribute');
end;

function CNContactStoreDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNContactStoreDidChangeNotification');
end;

function CNContainerIdentifierKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContainerIdentifierKey');
end;

function CNContainerNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContainerNameKey');
end;

function CNContainerTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNContainerTypeKey');
end;

function CNErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNErrorDomain');
end;

function CNErrorUserInfoAffectedRecordsKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNErrorUserInfoAffectedRecordsKey');
end;

function CNErrorUserInfoAffectedRecordIdentifiersKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNErrorUserInfoAffectedRecordIdentifiersKey');
end;

function CNErrorUserInfoValidationErrorsKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNErrorUserInfoValidationErrorsKey');
end;

function CNErrorUserInfoKeyPathsKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNErrorUserInfoKeyPathsKey');
end;

function CNGroupIdentifierKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNGroupIdentifierKey');
end;

function CNGroupNameKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNGroupNameKey');
end;

function CNPostalAddressPropertyAttribute: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressPropertyAttribute');
end;

function CNPostalAddressLocalizedPropertyNameAttribute: NSString;
begin
  Result := CocoaNSStringConst(libContacts,
    'CNPostalAddressLocalizedPropertyNameAttribute');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

ContactsModule := dlopen(MarshaledAString(libContacts), RTLD_LAZY);

finalization

dlclose(ContactsModule);
{$ENDIF IOS}

end.
