{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework AddressBook
//

unit iOSapi.AddressBook;

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
  kABPersonType = 0;
  kABGroupType = 1;
  kABSourceType = 2;
  kABInvalidPropertyType = 0;
  kABStringPropertyType = 1;
  kABIntegerPropertyType = 2;
  kABRealPropertyType = 3;
  kABDateTimePropertyType = 4;
  kABDictionaryPropertyType = 5;
  kABMultiStringPropertyType = (1 shl 8) or kABStringPropertyType;
  kABMultiIntegerPropertyType = (1 shl 8) or kABIntegerPropertyType;
  kABMultiRealPropertyType = (1 shl 8) or kABRealPropertyType;
  kABMultiDateTimePropertyType = (1 shl 8) or kABDateTimePropertyType;
  kABMultiDictionaryPropertyType = (1 shl 8) or kABDictionaryPropertyType;
  kABOperationNotPermittedByStoreError = 0;
  kABOperationNotPermittedByUserError = 1;
  kABAuthorizationStatusNotDetermined = 0;
  kABAuthorizationStatusRestricted = 1;
  kABAuthorizationStatusDenied = 2;
  kABAuthorizationStatusAuthorized = 3;
  kABSourceTypeLocal = 0;
  kABSourceTypeExchange = 1;
  kABSourceTypeExchangeGAL = kABSourceTypeExchange or 16777216;
  kABSourceTypeMobileMe = 2;
  kABSourceTypeLDAP = 3 or 16777216;
  kABSourceTypeCardDAV = 4;
  kABSourceTypeCardDAVSearch = kABSourceTypeCardDAV or 16777216;
  kABPersonSortByFirstName = 0;
  kABPersonSortByLastName = 1;
  kABPersonCompositeNameFormatFirstNameFirst = 0;
  kABPersonCompositeNameFormatLastNameFirst = 1;
  kABPersonImageFormatThumbnail = 0;
  kABPersonImageFormatOriginalSize = 2;

type
  // ===== Framework typedefs =====
{$M+}
  CFTypeRef = Pointer;
  PCFTypeRef = ^CFTypeRef;
  ABRecordRef = CFTypeRef;
  PABRecordRef = ^ABRecordRef;
  ABRecordID = Int32;
  PABRecordID = ^ABRecordID;
  ABPropertyID = Int32;
  PABPropertyID = ^ABPropertyID;
  ABRecordType = LongWord;
  PABRecordType = ^ABRecordType;
  ABPropertyType = LongWord;
  PABPropertyType = ^ABPropertyType;
  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  ABAddressBookRef = CFTypeRef;
  PABAddressBookRef = ^ABAddressBookRef;
  CFIndex = LongInt;
  PCFIndex = ^CFIndex;

  ABAuthorizationStatus = CFIndex;
  CFDictionaryRef = Pointer;
  PCFDictionaryRef = ^CFDictionaryRef;
  CFErrorRef = Pointer;
  PCFErrorRef = ^CFErrorRef;
  ABAddressBookRequestAccessCompletionHandler = procedure(param1: Integer;
    param2: CFErrorRef) of object;
  ABExternalChangeCallback = procedure(param1: ABAddressBookRef;
    param2: CFDictionaryRef; param3: Pointer); cdecl;
  PABExternalChangeCallback = ^ABExternalChangeCallback;
  ABSourceType = Integer;
  PABSourceType = ^ABSourceType;

  CFArrayRef = Pointer;
  PCFArrayRef = ^CFArrayRef;
  ABPersonSortOrdering = LongWord;
  PABPersonSortOrdering = ^ABPersonSortOrdering;
  ABPersonCompositeNameFormat = LongWord;
  PABPersonCompositeNameFormat = ^ABPersonCompositeNameFormat;
  ABPersonImageFormat = Cardinal;
  CFDataRef = Pointer;
  PCFDataRef = ^CFDataRef;
  CFComparisonResult = CFIndex;
  CFNumberRef = Pointer;
  PCFNumberRef = ^CFNumberRef;
  ABMultiValueRef = CFTypeRef;
  PABMultiValueRef = ^ABMultiValueRef;
  ABMultiValueIdentifier = Int32;
  PABMultiValueIdentifier = ^ABMultiValueIdentifier;
  ABMutableMultiValueRef = CFTypeRef;
  PABMutableMultiValueRef = ^ABMutableMultiValueRef;
  // ===== Exported string consts =====

function ABAddressBookErrorDomain: Pointer;
function kABSourceNameProperty: Pointer;
function kABSourceTypeProperty: Pointer;
function kABWorkLabel: Pointer;
function kABHomeLabel: Pointer;
function kABOtherLabel: Pointer;
function kABPersonFirstNameProperty: Pointer;
function kABPersonLastNameProperty: Pointer;
function kABPersonMiddleNameProperty: Pointer;
function kABPersonPrefixProperty: Pointer;
function kABPersonSuffixProperty: Pointer;
function kABPersonNicknameProperty: Pointer;
function kABPersonFirstNamePhoneticProperty: Pointer;
function kABPersonLastNamePhoneticProperty: Pointer;
function kABPersonMiddleNamePhoneticProperty: Pointer;
function kABPersonOrganizationProperty: Pointer;
function kABPersonDepartmentProperty: Pointer;
function kABPersonJobTitleProperty: Pointer;
function kABPersonEmailProperty: Pointer;
function kABPersonBirthdayProperty: Pointer;
function kABPersonNoteProperty: Pointer;
function kABPersonCreationDateProperty: Pointer;
function kABPersonModificationDateProperty: Pointer;
function kABPersonAddressProperty: Pointer;
function kABPersonAddressStreetKey: Pointer;
function kABPersonAddressCityKey: Pointer;
function kABPersonAddressStateKey: Pointer;
function kABPersonAddressZIPKey: Pointer;
function kABPersonAddressCountryKey: Pointer;
function kABPersonAddressCountryCodeKey: Pointer;
function kABPersonDateProperty: Pointer;
function kABPersonAnniversaryLabel: Pointer;
function kABPersonKindProperty: Pointer;
function kABPersonKindPerson: Pointer;
function kABPersonKindOrganization: Pointer;
function kABPersonPhoneProperty: Pointer;
function kABPersonPhoneMobileLabel: Pointer;
function kABPersonPhoneIPhoneLabel: Pointer;
function kABPersonPhoneMainLabel: Pointer;
function kABPersonPhoneHomeFAXLabel: Pointer;
function kABPersonPhoneWorkFAXLabel: Pointer;
function kABPersonPhoneOtherFAXLabel: Pointer;
function kABPersonPhonePagerLabel: Pointer;
function kABPersonInstantMessageProperty: Pointer;
function kABPersonInstantMessageServiceKey: Pointer;
function kABPersonInstantMessageServiceYahoo: Pointer;
function kABPersonInstantMessageServiceJabber: Pointer;
function kABPersonInstantMessageServiceMSN: Pointer;
function kABPersonInstantMessageServiceICQ: Pointer;
function kABPersonInstantMessageServiceAIM: Pointer;
function kABPersonInstantMessageServiceQQ: Pointer;
function kABPersonInstantMessageServiceGoogleTalk: Pointer;
function kABPersonInstantMessageServiceSkype: Pointer;
function kABPersonInstantMessageServiceFacebook: Pointer;
function kABPersonInstantMessageServiceGaduGadu: Pointer;
function kABPersonInstantMessageUsernameKey: Pointer;
function kABPersonURLProperty: Pointer;
function kABPersonHomePageLabel: Pointer;
function kABPersonRelatedNamesProperty: Pointer;
function kABPersonFatherLabel: Pointer;
function kABPersonMotherLabel: Pointer;
function kABPersonParentLabel: Pointer;
function kABPersonBrotherLabel: Pointer;
function kABPersonSisterLabel: Pointer;
function kABPersonChildLabel: Pointer;
function kABPersonFriendLabel: Pointer;
function kABPersonSpouseLabel: Pointer;
function kABPersonPartnerLabel: Pointer;
function kABPersonAssistantLabel: Pointer;
function kABPersonManagerLabel: Pointer;
function kABPersonSocialProfileProperty: Pointer;
function kABPersonSocialProfileURLKey: Pointer;
function kABPersonSocialProfileServiceKey: Pointer;
function kABPersonSocialProfileUsernameKey: Pointer;
function kABPersonSocialProfileUserIdentifierKey: Pointer;
function kABPersonSocialProfileServiceTwitter: Pointer;
function kABPersonSocialProfileServiceSinaWeibo: Pointer;
function kABPersonSocialProfileServiceGameCenter: Pointer;
function kABPersonSocialProfileServiceFacebook: Pointer;
function kABPersonSocialProfileServiceMyspace: Pointer;
function kABPersonSocialProfileServiceLinkedIn: Pointer;
function kABPersonSocialProfileServiceFlickr: Pointer;
function kABPersonAlternateBirthdayProperty: Pointer;
function kABPersonAlternateBirthdayCalendarIdentifierKey: Pointer;
function kABPersonAlternateBirthdayEraKey: Pointer;
function kABPersonAlternateBirthdayYearKey: Pointer;
function kABPersonAlternateBirthdayMonthKey: Pointer;
function kABPersonAlternateBirthdayIsLeapMonthKey: Pointer;
function kABPersonAlternateBirthdayDayKey: Pointer;
function kABGroupNameProperty: Pointer;


// ===== External functions =====

const
  libAddressBook =
    '/System/Library/Frameworks/AddressBook.framework/AddressBook';
function ABRecordGetRecordID(&record: ABRecordRef): ABRecordID; cdecl;
  external libAddressBook name _PU + 'ABRecordGetRecordID';
function ABRecordGetRecordType(&record: ABRecordRef): ABRecordType; cdecl;
  external libAddressBook name _PU + 'ABRecordGetRecordType';
function ABRecordCopyValue(&record: ABRecordRef; &property: ABPropertyID)
  : CFTypeRef; cdecl; external libAddressBook name _PU + 'ABRecordCopyValue';
function ABRecordSetValue(&record: ABRecordRef; &property: ABPropertyID;
  value: CFTypeRef; error: Pointer): Integer; cdecl;
  external libAddressBook name _PU + 'ABRecordSetValue';
function ABRecordRemoveValue(&record: ABRecordRef; &property: ABPropertyID;
  error: Pointer): Integer; cdecl;
  external libAddressBook name _PU + 'ABRecordRemoveValue';
function ABRecordCopyCompositeName(&record: ABRecordRef): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABRecordCopyCompositeName';
function ABAddressBookGetAuthorizationStatus: ABAuthorizationStatus; cdecl;
  external libAddressBook name _PU + 'ABAddressBookGetAuthorizationStatus';
function ABAddressBookCreateWithOptions(options: CFDictionaryRef;
  error: Pointer): ABAddressBookRef; cdecl;
  external libAddressBook name _PU + 'ABAddressBookCreateWithOptions';
function ABAddressBookCreate: ABAddressBookRef; cdecl;
  external libAddressBook name _PU + 'ABAddressBookCreate';
procedure ABAddressBookRequestAccessWithCompletion
  (AddressBook: ABAddressBookRef;
  completion: ABAddressBookRequestAccessCompletionHandler); cdecl;
  external libAddressBook name _PU + 'ABAddressBookRequestAccessWithCompletion';
function ABAddressBookSave(AddressBook: ABAddressBookRef; error: PCFErrorRef)
  : Integer; cdecl; external libAddressBook name _PU + 'ABAddressBookSave';
function ABAddressBookHasUnsavedChanges(AddressBook: ABAddressBookRef): Integer;
  cdecl; external libAddressBook name _PU + 'ABAddressBookHasUnsavedChanges';
function ABAddressBookAddRecord(AddressBook: ABAddressBookRef;
  &record: ABRecordRef; error: PCFErrorRef): Integer; cdecl;
  external libAddressBook name _PU + 'ABAddressBookAddRecord';
function ABAddressBookRemoveRecord(AddressBook: ABAddressBookRef;
  &record: ABRecordRef; error: PCFErrorRef): Integer; cdecl;
  external libAddressBook name _PU + 'ABAddressBookRemoveRecord';
function ABAddressBookCopyLocalizedLabel(&label: CFStringRef): CFStringRef;
  cdecl; external libAddressBook name _PU + 'ABAddressBookCopyLocalizedLabel';
procedure ABAddressBookRegisterExternalChangeCallback
  (AddressBook: ABAddressBookRef; callback: ABExternalChangeCallback;
  context: Pointer); cdecl; external libAddressBook name _PU +
  'ABAddressBookRegisterExternalChangeCallback';
procedure ABAddressBookUnregisterExternalChangeCallback
  (AddressBook: ABAddressBookRef; callback: ABExternalChangeCallback;
  context: Pointer); cdecl; external libAddressBook name _PU +
  'ABAddressBookUnregisterExternalChangeCallback';
procedure ABAddressBookRevert(AddressBook: ABAddressBookRef); cdecl;
  external libAddressBook name _PU + 'ABAddressBookRevert';
function ABAddressBookCopyDefaultSource(AddressBook: ABAddressBookRef)
  : ABRecordRef; cdecl; external libAddressBook name _PU +
  'ABAddressBookCopyDefaultSource';
function ABAddressBookGetSourceWithRecordID(AddressBook: ABAddressBookRef;
  sourceID: ABRecordID): ABRecordRef; cdecl;
  external libAddressBook name _PU + 'ABAddressBookGetSourceWithRecordID';
function ABAddressBookCopyArrayOfAllSources(AddressBook: ABAddressBookRef)
  : CFArrayRef; cdecl; external libAddressBook name _PU +
  'ABAddressBookCopyArrayOfAllSources';
function ABPersonCreate: ABRecordRef; cdecl;
  external libAddressBook name _PU + 'ABPersonCreate';
function ABPersonCreateInSource(source: ABRecordRef): ABRecordRef; cdecl;
  external libAddressBook name _PU + 'ABPersonCreateInSource';
function ABPersonCopySource(person: ABRecordRef): ABRecordRef; cdecl;
  external libAddressBook name _PU + 'ABPersonCopySource';
function ABPersonCopyArrayOfAllLinkedPeople(person: ABRecordRef): CFArrayRef;
  cdecl; external libAddressBook name _PU +
  'ABPersonCopyArrayOfAllLinkedPeople';
function ABPersonGetTypeOfProperty(&property: ABPropertyID): ABPropertyType;
  cdecl; external libAddressBook name _PU + 'ABPersonGetTypeOfProperty';
function ABPersonCopyLocalizedPropertyName(&property: ABPropertyID)
  : CFStringRef; cdecl; external libAddressBook name _PU +
  'ABPersonCopyLocalizedPropertyName';
function ABPersonGetSortOrdering: ABPersonSortOrdering; cdecl;
  external libAddressBook name _PU + 'ABPersonGetSortOrdering';
function ABPersonGetCompositeNameFormat: ABPersonCompositeNameFormat; cdecl;
  external libAddressBook name _PU + 'ABPersonGetCompositeNameFormat';
function ABPersonGetCompositeNameFormatForRecord(&record: ABRecordRef)
  : ABPersonCompositeNameFormat; cdecl;
  external libAddressBook name _PU + 'ABPersonGetCompositeNameFormatForRecord';
function ABPersonCopyCompositeNameDelimiterForRecord(&record: ABRecordRef)
  : CFStringRef; cdecl; external libAddressBook name _PU +
  'ABPersonCopyCompositeNameDelimiterForRecord';
function ABPersonSetImageData(person: ABRecordRef; imageData: CFDataRef;
  error: PCFErrorRef): Integer; cdecl;
  external libAddressBook name _PU + 'ABPersonSetImageData';
function ABPersonCopyImageData(person: ABRecordRef): CFDataRef; cdecl;
  external libAddressBook name _PU + 'ABPersonCopyImageData';
function ABPersonCopyImageDataWithFormat(person: ABRecordRef;
  format: ABPersonImageFormat): CFDataRef; cdecl;
  external libAddressBook name _PU + 'ABPersonCopyImageDataWithFormat';
function ABPersonHasImageData(person: ABRecordRef): Integer; cdecl;
  external libAddressBook name _PU + 'ABPersonHasImageData';
function ABPersonRemoveImageData(person: ABRecordRef; error: PCFErrorRef)
  : Integer; cdecl; external libAddressBook name _PU +
  'ABPersonRemoveImageData';
function ABPersonComparePeopleByName(person1: ABRecordRef; person2: ABRecordRef;
  ordering: ABPersonSortOrdering): CFComparisonResult; cdecl;
  external libAddressBook name _PU + 'ABPersonComparePeopleByName';
function ABAddressBookGetPersonCount(AddressBook: ABAddressBookRef): CFIndex;
  cdecl; external libAddressBook name _PU + 'ABAddressBookGetPersonCount';
function ABAddressBookGetPersonWithRecordID(AddressBook: ABAddressBookRef;
  recordID: ABRecordID): ABRecordRef; cdecl;
  external libAddressBook name _PU + 'ABAddressBookGetPersonWithRecordID';
function ABAddressBookCopyArrayOfAllPeople(AddressBook: ABAddressBookRef)
  : CFArrayRef; cdecl; external libAddressBook name _PU +
  'ABAddressBookCopyArrayOfAllPeople';
function ABAddressBookCopyArrayOfAllPeopleInSource
  (AddressBook: ABAddressBookRef; source: ABRecordRef): CFArrayRef; cdecl;
  external libAddressBook name _PU +
  'ABAddressBookCopyArrayOfAllPeopleInSource';
function ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering
  (AddressBook: ABAddressBookRef; source: ABRecordRef;
  sortOrdering: ABPersonSortOrdering): CFArrayRef; cdecl;
  external libAddressBook name _PU +
  'ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering';
function ABAddressBookCopyPeopleWithName(AddressBook: ABAddressBookRef;
  name: CFStringRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABAddressBookCopyPeopleWithName';
function ABPersonCreatePeopleInSourceWithVCardRepresentation
  (source: ABRecordRef; vCardData: CFDataRef): CFArrayRef; cdecl;
  external libAddressBook name _PU +
  'ABPersonCreatePeopleInSourceWithVCardRepresentation';
function ABPersonCreateVCardRepresentationWithPeople(people: CFArrayRef)
  : CFDataRef; cdecl; external libAddressBook name _PU +
  'ABPersonCreateVCardRepresentationWithPeople';
function ABGroupCreate: ABRecordRef; cdecl;
  external libAddressBook name _PU + 'ABGroupCreate';
function ABGroupCreateInSource(source: ABRecordRef): ABRecordRef; cdecl;
  external libAddressBook name _PU + 'ABGroupCreateInSource';
function ABGroupCopySource(group: ABRecordRef): ABRecordRef; cdecl;
  external libAddressBook name _PU + 'ABGroupCopySource';
function ABGroupCopyArrayOfAllMembers(group: ABRecordRef): CFArrayRef; cdecl;
  external libAddressBook name _PU + 'ABGroupCopyArrayOfAllMembers';
function ABGroupCopyArrayOfAllMembersWithSortOrdering(group: ABRecordRef;
  sortOrdering: ABPersonSortOrdering): CFArrayRef; cdecl;
  external libAddressBook name _PU +
  'ABGroupCopyArrayOfAllMembersWithSortOrdering';
function ABGroupAddMember(group: ABRecordRef; person: ABRecordRef;
  error: PCFErrorRef): Integer; cdecl;
  external libAddressBook name _PU + 'ABGroupAddMember';
function ABGroupRemoveMember(group: ABRecordRef; member: ABRecordRef;
  error: PCFErrorRef): Integer; cdecl;
  external libAddressBook name _PU + 'ABGroupRemoveMember';
function ABAddressBookGetGroupWithRecordID(AddressBook: ABAddressBookRef;
  recordID: ABRecordID): ABRecordRef; cdecl;
  external libAddressBook name _PU + 'ABAddressBookGetGroupWithRecordID';
function ABAddressBookGetGroupCount(AddressBook: ABAddressBookRef): CFIndex;
  cdecl; external libAddressBook name _PU + 'ABAddressBookGetGroupCount';
function ABAddressBookCopyArrayOfAllGroups(AddressBook: ABAddressBookRef)
  : CFArrayRef; cdecl; external libAddressBook name _PU +
  'ABAddressBookCopyArrayOfAllGroups';
function ABAddressBookCopyArrayOfAllGroupsInSource
  (AddressBook: ABAddressBookRef; source: ABRecordRef): CFArrayRef; cdecl;
  external libAddressBook name _PU +
  'ABAddressBookCopyArrayOfAllGroupsInSource';
function ABMultiValueGetPropertyType(multiValue: ABMultiValueRef)
  : ABPropertyType; cdecl; external libAddressBook name _PU +
  'ABMultiValueGetPropertyType';
function ABMultiValueGetCount(multiValue: ABMultiValueRef): CFIndex; cdecl;
  external libAddressBook name _PU + 'ABMultiValueGetCount';
function ABMultiValueCopyValueAtIndex(multiValue: ABMultiValueRef;
  index: CFIndex): CFTypeRef; cdecl;
  external libAddressBook name _PU + 'ABMultiValueCopyValueAtIndex';
function ABMultiValueCopyArrayOfAllValues(multiValue: ABMultiValueRef)
  : CFArrayRef; cdecl; external libAddressBook name _PU +
  'ABMultiValueCopyArrayOfAllValues';
function ABMultiValueCopyLabelAtIndex(multiValue: ABMultiValueRef;
  index: CFIndex): CFStringRef; cdecl;
  external libAddressBook name _PU + 'ABMultiValueCopyLabelAtIndex';
function ABMultiValueGetIndexForIdentifier(multiValue: ABMultiValueRef;
  identifier: ABMultiValueIdentifier): CFIndex; cdecl;
  external libAddressBook name _PU + 'ABMultiValueGetIndexForIdentifier';
function ABMultiValueGetIdentifierAtIndex(multiValue: ABMultiValueRef;
  index: CFIndex): ABMultiValueIdentifier; cdecl;
  external libAddressBook name _PU + 'ABMultiValueGetIdentifierAtIndex';
function ABMultiValueGetFirstIndexOfValue(multiValue: ABMultiValueRef;
  value: CFTypeRef): CFIndex; cdecl;
  external libAddressBook name _PU + 'ABMultiValueGetFirstIndexOfValue';
function ABMultiValueCreateMutable(&type: ABPropertyType)
  : ABMutableMultiValueRef; cdecl;
  external libAddressBook name _PU + 'ABMultiValueCreateMutable';
function ABMultiValueCreateMutableCopy(multiValue: ABMultiValueRef)
  : ABMutableMultiValueRef; cdecl;
  external libAddressBook name _PU + 'ABMultiValueCreateMutableCopy';
function ABMultiValueAddValueAndLabel(multiValue: ABMutableMultiValueRef;
  value: CFTypeRef; &label: CFStringRef; outIdentifier: PABMultiValueIdentifier)
  : Integer; cdecl; external libAddressBook name _PU +
  'ABMultiValueAddValueAndLabel';
function ABMultiValueInsertValueAndLabelAtIndex
  (multiValue: ABMutableMultiValueRef; value: CFTypeRef; &label: CFStringRef;
  index: CFIndex; outIdentifier: PABMultiValueIdentifier): Integer; cdecl;
  external libAddressBook name _PU + 'ABMultiValueInsertValueAndLabelAtIndex';
function ABMultiValueRemoveValueAndLabelAtIndex
  (multiValue: ABMutableMultiValueRef; index: CFIndex): Integer; cdecl;
  external libAddressBook name _PU + 'ABMultiValueRemoveValueAndLabelAtIndex';
function ABMultiValueReplaceValueAtIndex(multiValue: ABMutableMultiValueRef;
  value: CFTypeRef; index: CFIndex): Integer; cdecl;
  external libAddressBook name _PU + 'ABMultiValueReplaceValueAtIndex';
function ABMultiValueReplaceLabelAtIndex(multiValue: ABMutableMultiValueRef;
  &label: CFStringRef; index: CFIndex): Integer; cdecl;
  external libAddressBook name _PU + 'ABMultiValueReplaceLabelAtIndex';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AddressBookModule: THandle;

{$ENDIF IOS}

function ABAddressBookErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'ABAddressBookErrorDomain');
end;

function kABSourceNameProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABSourceNameProperty');
end;

function kABSourceTypeProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABSourceTypeProperty');
end;

function kABWorkLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABWorkLabel');
end;

function kABHomeLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABHomeLabel');
end;

function kABOtherLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABOtherLabel');
end;

function kABPersonFirstNameProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonFirstNameProperty');
end;

function kABPersonLastNameProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonLastNameProperty');
end;

function kABPersonMiddleNameProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonMiddleNameProperty');
end;

function kABPersonPrefixProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonPrefixProperty');
end;

function kABPersonSuffixProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonSuffixProperty');
end;

function kABPersonNicknameProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonNicknameProperty');
end;

function kABPersonFirstNamePhoneticProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonFirstNamePhoneticProperty');
end;

function kABPersonLastNamePhoneticProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonLastNamePhoneticProperty');
end;

function kABPersonMiddleNamePhoneticProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonMiddleNamePhoneticProperty');
end;

function kABPersonOrganizationProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonOrganizationProperty');
end;

function kABPersonDepartmentProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonDepartmentProperty');
end;

function kABPersonJobTitleProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonJobTitleProperty');
end;

function kABPersonEmailProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonEmailProperty');
end;

function kABPersonBirthdayProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonBirthdayProperty');
end;

function kABPersonNoteProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonNoteProperty');
end;

function kABPersonCreationDateProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonCreationDateProperty');
end;

function kABPersonModificationDateProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonModificationDateProperty');
end;

function kABPersonAddressProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonAddressProperty');
end;

function kABPersonAddressStreetKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonAddressStreetKey');
end;

function kABPersonAddressCityKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonAddressCityKey');
end;

function kABPersonAddressStateKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonAddressStateKey');
end;

function kABPersonAddressZIPKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonAddressZIPKey');
end;

function kABPersonAddressCountryKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonAddressCountryKey');
end;

function kABPersonAddressCountryCodeKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonAddressCountryCodeKey');
end;

function kABPersonDateProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonDateProperty');
end;

function kABPersonAnniversaryLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonAnniversaryLabel');
end;

function kABPersonKindProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonKindProperty');
end;

function kABPersonKindPerson: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonKindPerson');
end;

function kABPersonKindOrganization: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonKindOrganization');
end;

function kABPersonPhoneProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonPhoneProperty');
end;

function kABPersonPhoneMobileLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonPhoneMobileLabel');
end;

function kABPersonPhoneIPhoneLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonPhoneIPhoneLabel');
end;

function kABPersonPhoneMainLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonPhoneMainLabel');
end;

function kABPersonPhoneHomeFAXLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonPhoneHomeFAXLabel');
end;

function kABPersonPhoneWorkFAXLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonPhoneWorkFAXLabel');
end;

function kABPersonPhoneOtherFAXLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonPhoneOtherFAXLabel');
end;

function kABPersonPhonePagerLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonPhonePagerLabel');
end;

function kABPersonInstantMessageProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonInstantMessageProperty');
end;

function kABPersonInstantMessageServiceKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonInstantMessageServiceKey');
end;

function kABPersonInstantMessageServiceYahoo: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonInstantMessageServiceYahoo');
end;

function kABPersonInstantMessageServiceJabber: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonInstantMessageServiceJabber');
end;

function kABPersonInstantMessageServiceMSN: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonInstantMessageServiceMSN');
end;

function kABPersonInstantMessageServiceICQ: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonInstantMessageServiceICQ');
end;

function kABPersonInstantMessageServiceAIM: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonInstantMessageServiceAIM');
end;

function kABPersonInstantMessageServiceQQ: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonInstantMessageServiceQQ');
end;

function kABPersonInstantMessageServiceGoogleTalk: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonInstantMessageServiceGoogleTalk');
end;

function kABPersonInstantMessageServiceSkype: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonInstantMessageServiceSkype');
end;

function kABPersonInstantMessageServiceFacebook: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonInstantMessageServiceFacebook');
end;

function kABPersonInstantMessageServiceGaduGadu: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonInstantMessageServiceGaduGadu');
end;

function kABPersonInstantMessageUsernameKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonInstantMessageUsernameKey');
end;

function kABPersonURLProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonURLProperty');
end;

function kABPersonHomePageLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonHomePageLabel');
end;

function kABPersonRelatedNamesProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonRelatedNamesProperty');
end;

function kABPersonFatherLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonFatherLabel');
end;

function kABPersonMotherLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonMotherLabel');
end;

function kABPersonParentLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonParentLabel');
end;

function kABPersonBrotherLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonBrotherLabel');
end;

function kABPersonSisterLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonSisterLabel');
end;

function kABPersonChildLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonChildLabel');
end;

function kABPersonFriendLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonFriendLabel');
end;

function kABPersonSpouseLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonSpouseLabel');
end;

function kABPersonPartnerLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonPartnerLabel');
end;

function kABPersonAssistantLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonAssistantLabel');
end;

function kABPersonManagerLabel: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonManagerLabel');
end;

function kABPersonSocialProfileProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonSocialProfileProperty');
end;

function kABPersonSocialProfileURLKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABPersonSocialProfileURLKey');
end;

function kABPersonSocialProfileServiceKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonSocialProfileServiceKey');
end;

function kABPersonSocialProfileUsernameKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonSocialProfileUsernameKey');
end;

function kABPersonSocialProfileUserIdentifierKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonSocialProfileUserIdentifierKey');
end;

function kABPersonSocialProfileServiceTwitter: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonSocialProfileServiceTwitter');
end;

function kABPersonSocialProfileServiceSinaWeibo: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonSocialProfileServiceSinaWeibo');
end;

function kABPersonSocialProfileServiceGameCenter: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonSocialProfileServiceGameCenter');
end;

function kABPersonSocialProfileServiceFacebook: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonSocialProfileServiceFacebook');
end;

function kABPersonSocialProfileServiceMyspace: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonSocialProfileServiceMyspace');
end;

function kABPersonSocialProfileServiceLinkedIn: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonSocialProfileServiceLinkedIn');
end;

function kABPersonSocialProfileServiceFlickr: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonSocialProfileServiceFlickr');
end;

function kABPersonAlternateBirthdayProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonAlternateBirthdayProperty');
end;

function kABPersonAlternateBirthdayCalendarIdentifierKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonAlternateBirthdayCalendarIdentifierKey');
end;

function kABPersonAlternateBirthdayEraKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonAlternateBirthdayEraKey');
end;

function kABPersonAlternateBirthdayYearKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonAlternateBirthdayYearKey');
end;

function kABPersonAlternateBirthdayMonthKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonAlternateBirthdayMonthKey');
end;

function kABPersonAlternateBirthdayIsLeapMonthKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonAlternateBirthdayIsLeapMonthKey');
end;

function kABPersonAlternateBirthdayDayKey: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook,
    'kABPersonAlternateBirthdayDayKey');
end;

function kABGroupNameProperty: Pointer;
begin
  Result := CocoaPointerConst(libAddressBook, 'kABGroupNameProperty');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

AddressBookModule := dlopen(MarshaledAString(libAddressBook), RTLD_LAZY);

finalization

dlclose(AddressBookModule);
{$ENDIF IOS}

end.
