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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
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
  CNErrorCodeRecordDoesNotExist = 200;
  CNErrorCodeInsertedRecordAlreadyExists = 201;
  CNErrorCodeContainmentCycle = 202;
  CNErrorCodeContainmentScope = 203;
  CNErrorCodeParentRecordDoesNotExist = 204;
  CNErrorCodeValidationMultipleErrors = 300;
  CNErrorCodeValidationTypeMismatch = 301;
  CNErrorCodeValidationConfigurationError = 302;
  CNErrorCodePredicateInvalid = 400;
  CNErrorCodePolicyViolation = 500;
  CNPostalAddressFormatterStyleMailingAddress = 0;

type

  // ===== Forward declarations =====
{$M+}
  CNLabeledValue = interface;
  CNPhoneNumber = interface;
  CNPostalAddress = interface;
  CNContactRelation = interface;
  CNSocialProfile = interface;
  CNInstantMessageAddress = interface;
  CNKeyDescriptor = interface;
  Contacts = interface;
  CNContact = interface;
  CNContactFetchRequest = interface;
  CNContactFormatter = interface;
  CNContactProperty = interface;
  CNGroup = interface;
  CNContainer = interface;
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
  NSInteger = Integer;
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

  CNLabeledValueClass = interface(NSObjectClass)
    ['{9AF85254-C188-4BAA-86AA-0D4AF21D6950}']
    { class } function labeledValueWithLabel(&label: NSString; value: ValueType)
      : Pointer { instancetype }; cdecl;
    { class } function localizedStringForLabel(&label: NSString)
      : NSString; cdecl;
  end;

  CNLabeledValue = interface(NSObject)
    ['{0072401A-B7BD-40F1-803C-E7D7BE584F93}']
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
    ['{BDD29137-690E-4B03-904D-29E552F8C424}']
    { class } function phoneNumberWithStringValue(stringValue: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  CNPhoneNumber = interface(NSObject)
    ['{1E821774-AB1B-43DB-9E41-098571A41366}']
    function initWithStringValue(&string: NSString)
      : Pointer { instancetype }; cdecl;
    function stringValue: NSString; cdecl;
  end;

  TCNPhoneNumber = class(TOCGenericImport<CNPhoneNumberClass, CNPhoneNumber>)
  end;

  PCNPhoneNumber = Pointer;

  CNPostalAddressClass = interface(NSObjectClass)
    ['{0E3E6898-79E9-40E4-8221-674B5DEB9803}']
    { class } function localizedStringForKey(key: NSString): NSString; cdecl;
  end;

  CNPostalAddress = interface(NSObject)
    ['{D80DD77D-0E41-40A2-89C8-82E9E08C6CA5}']
    function street: NSString; cdecl;
    function city: NSString; cdecl;
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
    ['{9BE7C697-B9BE-4BA8-B792-53E81B7877DE}']
    { class } function contactRelationWithName(name: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  CNContactRelation = interface(NSObject)
    ['{4C0099FD-9C87-4E20-9195-07C2DF35821E}']
    function initWithName(name: NSString): Pointer { instancetype }; cdecl;
    function name: NSString; cdecl;
  end;

  TCNContactRelation = class(TOCGenericImport<CNContactRelationClass,
    CNContactRelation>)
  end;

  PCNContactRelation = Pointer;

  CNSocialProfileClass = interface(NSObjectClass)
    ['{3CE0C0F9-ECFE-4B7A-93FC-D51A681C7D7E}']
    { class } function localizedStringForKey(key: NSString): NSString; cdecl;
    { class } function localizedStringForService(service: NSString)
      : NSString; cdecl;
  end;

  CNSocialProfile = interface(NSObject)
    ['{7B53EE6A-D574-4999-BC7C-6DE825DA8A6D}']
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
    ['{E04C4F1F-53FC-42DC-8C38-82CD0927FF58}']
    { class } function localizedStringForKey(key: NSString): NSString; cdecl;
    { class } function localizedStringForService(service: NSString)
      : NSString; cdecl;
  end;

  CNInstantMessageAddress = interface(NSObject)
    ['{2A8B81A1-9946-4509-9EF7-C2E84B364474}']
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
    ['{6572B26B-5A50-49CE-BB49-4352BCB2796A}']
  end;

  CNContactClass = interface(NSObjectClass)
    ['{D7EBFEA0-9C12-4573-9F13-4530E7C6A111}']
    { class } function localizedStringForKey(key: NSString): NSString; cdecl;
    { class } function comparatorForNameSortOrder(sortOrder: CNContactSortOrder)
      : NSComparator; cdecl;
    { class } function descriptorForAllComparatorKeys: Pointer; cdecl;
    { class } function predicateForContactsMatchingName(name: NSString)
      : NSPredicate; cdecl;
    { class } function predicateForContactsWithIdentifiers(identifiers: NSArray)
      : NSPredicate; cdecl;
    { class } function predicateForContactsInGroupWithIdentifier(groupIdentifier
      : NSString): NSPredicate; cdecl;
    { class } function predicateForContactsInContainerWithIdentifier
      (containerIdentifier: NSString): NSPredicate; cdecl;
  end;

  CNContact = interface(NSObject)
    ['{5C7D5B34-FB7C-4F8D-8C1C-2AD37692092A}']
    function identifier: NSString; cdecl;
    function contactType: CNContactType; cdecl;
    function namePrefix: NSString; cdecl;
    function givenName: NSString; cdecl;
    function middleName: NSString; cdecl;
    function familyName: NSString; cdecl;
    function previousFamilyName: NSString; cdecl;
    function nameSuffix: NSString; cdecl;
    function nickname: NSString; cdecl;
    function phoneticGivenName: NSString; cdecl;
    function phoneticMiddleName: NSString; cdecl;
    function phoneticFamilyName: NSString; cdecl;
    function organizationName: NSString; cdecl;
    function departmentName: NSString; cdecl;
    function jobTitle: NSString; cdecl;
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

  CNContactFetchRequestClass = interface(NSObjectClass)
    ['{A7B56B11-6E9D-48D7-8D23-246F2E5E246C}']
  end;

  CNContactFetchRequest = interface(NSObject)
    ['{10859CBC-D67F-4EDD-8CF0-053366B99248}']
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
    ['{C7DE3481-C891-4ADC-B3C3-40211342EAD5}']
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
    ['{9F998152-B92E-4262-A360-77FAC06856FE}']
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
    ['{EFDCA0E9-60DA-49D3-B448-693C7DD89C7D}']
  end;

  CNContactProperty = interface(NSObject)
    ['{2C0FFBCD-966E-4C41-8F91-E8154BFBD91A}']
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

  CNGroupClass = interface(NSObjectClass)
    ['{7A25A248-C1A2-463D-9A06-B24FA59B0F56}']
    { class } function predicateForGroupsWithIdentifiers(identifiers: NSArray)
      : NSPredicate; cdecl;
    { class } function predicateForSubgroupsInGroupWithIdentifier
      (parentGroupIdentifier: NSString): NSPredicate; cdecl;
    { class } function predicateForGroupsInContainerWithIdentifier
      (containerIdentifier: NSString): NSPredicate; cdecl;
  end;

  CNGroup = interface(NSObject)
    ['{BFAB12DE-5957-40AD-B917-90FF4F30F652}']
    function identifier: NSString; cdecl;
    function name: NSString; cdecl;
  end;

  TCNGroup = class(TOCGenericImport<CNGroupClass, CNGroup>)
  end;

  PCNGroup = Pointer;

  CNContainerClass = interface(NSObjectClass)
    ['{59AAF493-977D-47C7-870D-A47441106B53}']
    { class } function predicateForContainersWithIdentifiers
      (identifiers: NSArray): NSPredicate; cdecl;
    { class } function predicateForContainerOfContactWithIdentifier
      (contactIdentifier: NSString): NSPredicate; cdecl;
    { class } function predicateForContainerOfGroupWithIdentifier
      (groupIdentifier: NSString): NSPredicate; cdecl;
  end;

  CNContainer = interface(NSObject)
    ['{5C94966E-6B2C-436F-91EE-5BF439992985}']
    function identifier: NSString; cdecl;
    function name: NSString; cdecl;
    function &type: CNContainerType; cdecl;
  end;

  TCNContainer = class(TOCGenericImport<CNContainerClass, CNContainer>)
  end;

  PCNContainer = Pointer;

  CNSaveRequestClass = interface(NSObjectClass)
    ['{9BC47015-3CB9-4CF7-890E-864DA8138184}']
  end;

  CNSaveRequest = interface(NSObject)
    ['{E2B0168C-F1FA-4194-8D2F-895D9A68515F}']
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
  end;

  TCNSaveRequest = class(TOCGenericImport<CNSaveRequestClass, CNSaveRequest>)
  end;

  PCNSaveRequest = Pointer;

  CNContactStoreClass = interface(NSObjectClass)
    ['{B73377C4-6388-4B26-8E6D-54B6518CCF64}']
    { class } function authorizationStatusForEntityType
      (entityType: CNEntityType): CNAuthorizationStatus; cdecl;
  end;

  CNContactStore = interface(NSObject)
    ['{D48CB2B3-5E92-4393-A5BD-75C7A04514BC}']
    procedure requestAccessForEntityType(entityType: CNEntityType;
      completionHandler: TContactsCompletionHandler); cdecl;
    function unifiedContactsMatchingPredicate(predicate: NSPredicate;
      keysToFetch: NSArray; error: NSError): NSArray; cdecl;
    function unifiedContactWithIdentifier(identifier: NSString;
      keysToFetch: NSArray; error: NSError): CNContact; cdecl;
    function unifiedMeContactWithKeysToFetch(keys: NSArray; error: NSError)
      : CNContact; cdecl;
    function enumerateContactsWithFetchRequest(fetchRequest
      : CNContactFetchRequest; error: NSError; usingBlock: TContactsUsingBlock)
      : Boolean; cdecl;
    function groupsMatchingPredicate(predicate: NSPredicate; error: NSError)
      : NSArray; cdecl;
    function containersMatchingPredicate(predicate: NSPredicate; error: NSError)
      : NSArray; cdecl;
    function executeSaveRequest(saveRequest: CNSaveRequest; error: NSError)
      : Boolean; cdecl;
    function defaultContainerIdentifier: NSString; cdecl;
  end;

  TCNContactStore = class(TOCGenericImport<CNContactStoreClass, CNContactStore>)
  end;

  PCNContactStore = Pointer;

  CNContactsUserDefaultsClass = interface(NSObjectClass)
    ['{21CA7D8E-7EDA-4546-88B8-B1F1BECB0DC2}']
    { class } function sharedDefaults: Pointer { instancetype }; cdecl;
  end;

  CNContactsUserDefaults = interface(NSObject)
    ['{1095AB37-3D0A-43CA-85AE-E758D63B05F0}']
    function sortOrder: CNContactSortOrder; cdecl;
    function countryCode: NSString; cdecl;
  end;

  TCNContactsUserDefaults = class(TOCGenericImport<CNContactsUserDefaultsClass,
    CNContactsUserDefaults>)
  end;

  PCNContactsUserDefaults = Pointer;

  CNContactVCardSerializationClass = interface(NSObjectClass)
    ['{881CDF64-7170-4356-BAC4-BBD3B63A4595}']
    { class } function descriptorForRequiredKeys: Pointer; cdecl;
    { class } function dataWithContacts(Contacts: NSArray; error: NSError)
      : NSData; cdecl;
    { class } function contactsWithData(data: NSData; error: NSError)
      : NSArray; cdecl;
  end;

  CNContactVCardSerialization = interface(NSObject)
    ['{EDF86933-C403-46E8-B410-8FA6C057D807}']
  end;

  TCNContactVCardSerialization = class
    (TOCGenericImport<CNContactVCardSerializationClass,
    CNContactVCardSerialization>)
  end;

  PCNContactVCardSerialization = Pointer;

  CNMutableContactClass = interface(CNContactClass)
    ['{58557E1B-34D8-4159-ADEA-43FE89472266}']
  end;

  CNMutableContact = interface(CNContact)
    ['{18C9F731-1E92-4185-9BC5-CAFFE7F1A8ED}']
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
    procedure setPhoneticGivenName(phoneticGivenName: NSString); cdecl;
    function phoneticGivenName: NSString; cdecl;
    procedure setPhoneticMiddleName(phoneticMiddleName: NSString); cdecl;
    function phoneticMiddleName: NSString; cdecl;
    procedure setPhoneticFamilyName(phoneticFamilyName: NSString); cdecl;
    function phoneticFamilyName: NSString; cdecl;
    procedure setOrganizationName(organizationName: NSString); cdecl;
    function organizationName: NSString; cdecl;
    procedure setDepartmentName(departmentName: NSString); cdecl;
    function departmentName: NSString; cdecl;
    procedure setJobTitle(jobTitle: NSString); cdecl;
    function jobTitle: NSString; cdecl;
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
    ['{4F247EA8-EFEC-488C-BC6E-9E6ED71320F0}']
  end;

  CNMutableGroup = interface(CNGroup)
    ['{042A911D-1AF6-4372-B398-04E406760CD6}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TCNMutableGroup = class(TOCGenericImport<CNMutableGroupClass, CNMutableGroup>)
  end;

  PCNMutableGroup = Pointer;

  CNMutablePostalAddressClass = interface(CNPostalAddressClass)
    ['{385867BB-4593-4CDB-9554-D13D16521C13}']
  end;

  CNMutablePostalAddress = interface(CNPostalAddress)
    ['{C3148613-8E2E-4D7E-BBD9-832AF6642C8B}']
    procedure setStreet(street: NSString); cdecl;
    function street: NSString; cdecl;
    procedure setCity(city: NSString); cdecl;
    function city: NSString; cdecl;
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
    ['{0DBC7BB3-86BB-4009-9335-C2256F4C8937}']
    { class } function stringFromPostalAddress(postalAddress: CNPostalAddress;
      style: CNPostalAddressFormatterStyle): NSString; cdecl;
    { class } function attributedStringFromPostalAddress(postalAddress
      : CNPostalAddress; style: CNPostalAddressFormatterStyle;
      withDefaultAttributes: NSDictionary): NSAttributedString; cdecl;
  end;

  CNPostalAddressFormatter = interface(NSFormatter)
    ['{751094FA-BE68-4BA0-9592-7E0914508523}']
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

  CNKeyDescriptor = interface(IObjectiveC)
    ['{47644D8E-C306-4A4B-B4E9-0CF68ED797B3}']
  end;

  // ===== Exported string consts =====

function CNLabelHome: NSString;
function CNLabelWork: NSString;
function CNLabelOther: NSString;
function CNLabelEmailiCloud: NSString;
function CNLabelURLAddressHomePage: NSString;
function CNLabelDateAnniversary: NSString;
function CNLabelPhoneNumberiPhone: NSString;
function CNLabelPhoneNumberMobile: NSString;
function CNLabelPhoneNumberMain: NSString;
function CNLabelPhoneNumberHomeFax: NSString;
function CNLabelPhoneNumberWorkFax: NSString;
function CNLabelPhoneNumberOtherFax: NSString;
function CNLabelPhoneNumberPager: NSString;
function CNPostalAddressStreetKey: NSString;
function CNPostalAddressCityKey: NSString;
function CNPostalAddressStateKey: NSString;
function CNPostalAddressPostalCodeKey: NSString;
function CNPostalAddressCountryKey: NSString;
function CNPostalAddressISOCountryCodeKey: NSString;
function CNLabelContactRelationFather: NSString;
function CNLabelContactRelationMother: NSString;
function CNLabelContactRelationParent: NSString;
function CNLabelContactRelationBrother: NSString;
function CNLabelContactRelationSister: NSString;
function CNLabelContactRelationChild: NSString;
function CNLabelContactRelationFriend: NSString;
function CNLabelContactRelationSpouse: NSString;
function CNLabelContactRelationPartner: NSString;
function CNLabelContactRelationAssistant: NSString;
function CNLabelContactRelationManager: NSString;
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
function CNContactPhoneticGivenNameKey: NSString;
function CNContactPhoneticMiddleNameKey: NSString;
function CNContactPhoneticFamilyNameKey: NSString;
function CNContactOrganizationNameKey: NSString;
function CNContactDepartmentNameKey: NSString;
function CNContactJobTitleKey: NSString;
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

function CNPostalAddressCityKey: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNPostalAddressCityKey');
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

function CNLabelContactRelationFather: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationFather');
end;

function CNLabelContactRelationMother: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationMother');
end;

function CNLabelContactRelationParent: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationParent');
end;

function CNLabelContactRelationBrother: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationBrother');
end;

function CNLabelContactRelationSister: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationSister');
end;

function CNLabelContactRelationChild: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationChild');
end;

function CNLabelContactRelationFriend: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationFriend');
end;

function CNLabelContactRelationSpouse: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationSpouse');
end;

function CNLabelContactRelationPartner: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationPartner');
end;

function CNLabelContactRelationAssistant: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationAssistant');
end;

function CNLabelContactRelationManager: NSString;
begin
  Result := CocoaNSStringConst(libContacts, 'CNLabelContactRelationManager');
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
