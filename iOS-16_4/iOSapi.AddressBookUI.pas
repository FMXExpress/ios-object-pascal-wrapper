{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework AddressBookUI
//

unit iOSapi.AddressBookUI;

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
  iOSapi.Foundation,
  iOSapi.UIKit;

type

  // ===== Forward declarations =====
{$M+}
  ABNewPersonViewControllerDelegate = interface;
  ABNewPersonViewController = interface;
  ABPeoplePickerNavigationControllerDelegate = interface;
  ABPeoplePickerNavigationController = interface;
  ABPersonViewControllerDelegate = interface;
  ABPersonViewController = interface;
  ABUnknownPersonViewControllerDelegate = interface;
  ABUnknownPersonViewController = interface;

  // ===== Framework typedefs =====
{$M+}
  CFTypeRef = Pointer;
  PCFTypeRef = ^CFTypeRef;
  ABAddressBookRef = CFTypeRef;
  PABAddressBookRef = ^ABAddressBookRef;
  ABRecordRef = CFTypeRef;
  PABRecordRef = ^ABRecordRef;
  ABPropertyID = Int32;
  PABPropertyID = ^ABPropertyID;
  ABMultiValueIdentifier = Int32;
  PABMultiValueIdentifier = ^ABMultiValueIdentifier;
  // ===== Interface declarations =====

  ABNewPersonViewControllerClass = interface(UIViewControllerClass)
    ['{B5329348-2444-42AC-B61B-78B24C761B03}']
  end;

  ABNewPersonViewController = interface(UIViewController)
    ['{7C52379B-40F3-4C5F-A629-61AF30DE8F90}']
    procedure setNewPersonViewDelegate(newPersonViewDelegate: Pointer); cdecl;
    function newPersonViewDelegate: Pointer; cdecl;
    procedure setAddressBook(AddressBook: ABAddressBookRef); cdecl;
    function AddressBook: ABAddressBookRef; cdecl;
    procedure setDisplayedPerson(displayedPerson: ABRecordRef); cdecl;
    function displayedPerson: ABRecordRef; cdecl;
    procedure setParentGroup(parentGroup: ABRecordRef); cdecl;
    function parentGroup: ABRecordRef; cdecl;
  end;

  TABNewPersonViewController = class
    (TOCGenericImport<ABNewPersonViewControllerClass,
    ABNewPersonViewController>)
  end;

  PABNewPersonViewController = Pointer;

  ABPeoplePickerNavigationControllerClass = interface
    (UINavigationControllerClass)
    ['{AA8D8E8C-A28D-43EC-82C5-F9FD2F69D8D0}']
  end;

  ABPeoplePickerNavigationController = interface(UINavigationController)
    ['{A9B9392B-E833-4EC5-A658-7E29E38EC5B9}']
    procedure setPeoplePickerDelegate(peoplePickerDelegate: Pointer); cdecl;
    function peoplePickerDelegate: Pointer; cdecl;
    procedure setDisplayedProperties(displayedProperties: NSArray); cdecl;
    function displayedProperties: NSArray; cdecl;
    procedure setAddressBook(AddressBook: ABAddressBookRef); cdecl;
    function AddressBook: ABAddressBookRef; cdecl;
    procedure setPredicateForEnablingPerson(predicateForEnablingPerson
      : NSPredicate); cdecl;
    function predicateForEnablingPerson: NSPredicate; cdecl;
    procedure setPredicateForSelectionOfPerson(predicateForSelectionOfPerson
      : NSPredicate); cdecl;
    function predicateForSelectionOfPerson: NSPredicate; cdecl;
    procedure setPredicateForSelectionOfProperty(predicateForSelectionOfProperty
      : NSPredicate); cdecl;
    function predicateForSelectionOfProperty: NSPredicate; cdecl;
  end;

  TABPeoplePickerNavigationController = class
    (TOCGenericImport<ABPeoplePickerNavigationControllerClass,
    ABPeoplePickerNavigationController>)
  end;

  PABPeoplePickerNavigationController = Pointer;

  ABPersonViewControllerClass = interface(UIViewControllerClass)
    ['{01868C8E-7D7A-42F9-8AEB-9FAE2F605C99}']
  end;

  ABPersonViewController = interface(UIViewController)
    ['{B96EC87A-CC3D-4361-B60B-30B36D39C3BD}']
    procedure setPersonViewDelegate(personViewDelegate: Pointer); cdecl;
    function personViewDelegate: Pointer; cdecl;
    procedure setAddressBook(AddressBook: ABAddressBookRef); cdecl;
    function AddressBook: ABAddressBookRef; cdecl;
    procedure setDisplayedPerson(displayedPerson: ABRecordRef); cdecl;
    function displayedPerson: ABRecordRef; cdecl;
    procedure setDisplayedProperties(displayedProperties: NSArray); cdecl;
    function displayedProperties: NSArray; cdecl;
    procedure setAllowsEditing(allowsEditing: Boolean); cdecl;
    function allowsEditing: Boolean; cdecl;
    procedure setAllowsActions(allowsActions: Boolean); cdecl;
    function allowsActions: Boolean; cdecl;
    procedure setShouldShowLinkedPeople(shouldShowLinkedPeople: Boolean); cdecl;
    function shouldShowLinkedPeople: Boolean; cdecl;
    procedure setHighlightedItemForProperty(&property: ABPropertyID;
      withIdentifier: ABMultiValueIdentifier); cdecl;
  end;

  TABPersonViewController = class(TOCGenericImport<ABPersonViewControllerClass,
    ABPersonViewController>)
  end;

  PABPersonViewController = Pointer;

  ABUnknownPersonViewControllerClass = interface(UIViewControllerClass)
    ['{D471741E-D32E-437C-8EB4-3A31C97A6118}']
  end;

  ABUnknownPersonViewController = interface(UIViewController)
    ['{D42C78CE-1230-4F5C-A27C-FE4E1A4A90F6}']
    procedure setUnknownPersonViewDelegate(unknownPersonViewDelegate
      : Pointer); cdecl;
    function unknownPersonViewDelegate: Pointer; cdecl;
    procedure setAddressBook(AddressBook: ABAddressBookRef); cdecl;
    function AddressBook: ABAddressBookRef; cdecl;
    procedure setDisplayedPerson(displayedPerson: ABRecordRef); cdecl;
    function displayedPerson: ABRecordRef; cdecl;
    procedure setAlternateName(alternateName: NSString); cdecl;
    function alternateName: NSString; cdecl;
    procedure setMessage(message: NSString); cdecl;
    function message: NSString; cdecl;
    procedure setAllowsActions(allowsActions: Boolean); cdecl;
    function allowsActions: Boolean; cdecl;
    procedure setAllowsAddingToAddressBook(allowsAddingToAddressBook
      : Boolean); cdecl;
    function allowsAddingToAddressBook: Boolean; cdecl;
  end;

  TABUnknownPersonViewController = class
    (TOCGenericImport<ABUnknownPersonViewControllerClass,
    ABUnknownPersonViewController>)
  end;

  PABUnknownPersonViewController = Pointer;

  // ===== Protocol declarations =====

  ABNewPersonViewControllerDelegate = interface(IObjectiveC)
    ['{AE0A0F4B-18E3-4971-BE54-8F5C290EB49A}']
    procedure newPersonViewController(newPersonView: ABNewPersonViewController;
      didCompleteWithNewPerson: ABRecordRef); cdecl;
  end;

  ABPeoplePickerNavigationControllerDelegate = interface(IObjectiveC)
    ['{C5DC5ECF-8C93-4505-B3C9-AFE2B13FBDA3}']
    [MethodName('peoplePickerNavigationController:didSelectPerson:')]
    procedure peoplePickerNavigationControllerDidSelectPerson
      (peoplePicker: ABPeoplePickerNavigationController;
      didSelectPerson: ABRecordRef); cdecl;
    [MethodName
      ('peoplePickerNavigationController:didSelectPerson:property:identifier:')]
    procedure peoplePickerNavigationControllerDidSelectPersonPropertyIdentifier
      (peoplePicker: ABPeoplePickerNavigationController;
      didSelectPerson: ABRecordRef; &property: ABPropertyID;
      identifier: ABMultiValueIdentifier); cdecl;
    procedure peoplePickerNavigationControllerDidCancel
      (peoplePicker: ABPeoplePickerNavigationController); cdecl;
    [MethodName
      ('peoplePickerNavigationController:shouldContinueAfterSelectingPerson:')]
    function peoplePickerNavigationControllerShouldContinueAfterSelectingPerson
      (peoplePicker: ABPeoplePickerNavigationController;
      shouldContinueAfterSelectingPerson: ABRecordRef): Boolean; cdecl;
    [MethodName
      ('peoplePickerNavigationController:shouldContinueAfterSelectingPerson:property:identifier:')
      ]
    function peoplePickerNavigationControllerShouldContinueAfterSelectingPersonPropertyIdentifier
      (peoplePicker: ABPeoplePickerNavigationController;
      shouldContinueAfterSelectingPerson: ABRecordRef; &property: ABPropertyID;
      identifier: ABMultiValueIdentifier): Boolean; cdecl;
  end;

  ABPersonViewControllerDelegate = interface(IObjectiveC)
    ['{3A655B62-EAFD-424E-9F35-00FEA0549D53}']
    function personViewController(personViewController: ABPersonViewController;
      shouldPerformDefaultActionForPerson: ABRecordRef; &property: ABPropertyID;
      identifier: ABMultiValueIdentifier): Boolean; cdecl;
  end;

  ABUnknownPersonViewControllerDelegate = interface(IObjectiveC)
    ['{289ECDAF-9BD8-417A-933D-E36C8AAFE338}']
    [MethodName('unknownPersonViewController:didResolveToPerson:')]
    procedure unknownPersonViewControllerDidResolveToPerson
      (unknownCardViewController: ABUnknownPersonViewController;
      didResolveToPerson: ABRecordRef); cdecl;
    [MethodName
      ('unknownPersonViewController:shouldPerformDefaultActionForPerson:property:identifier:')
      ]
    function unknownPersonViewControllerShouldPerformDefaultActionForPersonPropertyIdentifier
      (personViewController: ABUnknownPersonViewController;
      shouldPerformDefaultActionForPerson: ABRecordRef; &property: ABPropertyID;
      identifier: ABMultiValueIdentifier): Boolean; cdecl;
  end;

  // ===== Exported string consts =====

function NSString: Pointer;
function ABPersonNamePrefixProperty: NSString;
function ABPersonGivenNameProperty: NSString;
function ABPersonMiddleNameProperty: NSString;
function ABPersonFamilyNameProperty: NSString;
function ABPersonNameSuffixProperty: NSString;
function ABPersonPreviousFamilyNameProperty: NSString;
function ABPersonNicknameProperty: NSString;
function ABPersonPhoneticGivenNameProperty: NSString;
function ABPersonPhoneticMiddleNameProperty: NSString;
function ABPersonPhoneticFamilyNameProperty: NSString;
function ABPersonOrganizationNameProperty: NSString;
function ABPersonDepartmentNameProperty: NSString;
function ABPersonJobTitleProperty: NSString;
function ABPersonBirthdayProperty: NSString;
function ABPersonNoteProperty: NSString;
function ABPersonPhoneNumbersProperty: NSString;
function ABPersonEmailAddressesProperty: NSString;
function ABPersonUrlAddressesProperty: NSString;
function ABPersonDatesProperty: NSString;
function ABPersonInstantMessageAddressesProperty: NSString;
function ABPersonRelatedNamesProperty: NSString;
function ABPersonSocialProfilesProperty: NSString;
function ABPersonPostalAddressesProperty: NSString;


// ===== External functions =====

const
  libAddressBookUI =
    '/System/Library/Frameworks/AddressBookUI.framework/AddressBookUI';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AddressBookUIModule: THandle;

{$ENDIF IOS}

function ABPersonNamePrefixProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI, 'ABPersonNamePrefixProperty');
end;

function ABPersonGivenNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI, 'ABPersonGivenNameProperty');
end;

function ABPersonMiddleNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI, 'ABPersonMiddleNameProperty');
end;

function ABPersonFamilyNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI, 'ABPersonFamilyNameProperty');
end;

function ABPersonNameSuffixProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI, 'ABPersonNameSuffixProperty');
end;

function ABPersonPreviousFamilyNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI,
    'ABPersonPreviousFamilyNameProperty');
end;

function ABPersonNicknameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI, 'ABPersonNicknameProperty');
end;

function ABPersonPhoneticGivenNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI,
    'ABPersonPhoneticGivenNameProperty');
end;

function ABPersonPhoneticMiddleNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI,
    'ABPersonPhoneticMiddleNameProperty');
end;

function ABPersonPhoneticFamilyNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI,
    'ABPersonPhoneticFamilyNameProperty');
end;

function ABPersonOrganizationNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI,
    'ABPersonOrganizationNameProperty');
end;

function ABPersonDepartmentNameProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI,
    'ABPersonDepartmentNameProperty');
end;

function ABPersonJobTitleProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI, 'ABPersonJobTitleProperty');
end;

function ABPersonBirthdayProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI, 'ABPersonBirthdayProperty');
end;

function ABPersonNoteProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI, 'ABPersonNoteProperty');
end;

function ABPersonPhoneNumbersProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI,
    'ABPersonPhoneNumbersProperty');
end;

function ABPersonEmailAddressesProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI,
    'ABPersonEmailAddressesProperty');
end;

function ABPersonUrlAddressesProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI,
    'ABPersonUrlAddressesProperty');
end;

function ABPersonDatesProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI, 'ABPersonDatesProperty');
end;

function ABPersonInstantMessageAddressesProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI,
    'ABPersonInstantMessageAddressesProperty');
end;

function ABPersonRelatedNamesProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI,
    'ABPersonRelatedNamesProperty');
end;

function ABPersonSocialProfilesProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI,
    'ABPersonSocialProfilesProperty');
end;

function ABPersonPostalAddressesProperty: NSString;
begin
  Result := CocoaNSStringConst(libAddressBookUI,
    'ABPersonPostalAddressesProperty');
end;

function NSString: Pointer;
begin
  Result := CocoaPointerConst(libAddressBookUI, 'NSString');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

AddressBookUIModule := dlopen(MarshaledAString(libAddressBookUI), RTLD_LAZY);

finalization

dlclose(AddressBookUIModule);
{$ENDIF IOS}

end.
