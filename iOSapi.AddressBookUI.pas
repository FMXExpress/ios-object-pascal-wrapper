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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.AddressBook,
  iOSapi.CocoaTypes,
  iOSapi.Foundation,
  iOSapi.QuartzCore,
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
  ABAddressBookRef = CFTypeRef;
  ABRecordRef = CFTypeRef;
  ABPropertyID = Int32;
  ABMultiValueIdentifier = Int32;
  // ===== Interface declarations =====

  ABNewPersonViewControllerClass = interface(UIViewControllerClass)
    ['{4571460B-69EC-489F-BAE6-C7E432D360B7}']
  end;

  ABNewPersonViewController = interface(UIViewController)
    ['{BCE90F05-F212-4A2C-B757-98AA1C014FDE}']
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
    ['{192F2AEB-B84C-445A-8E96-1E7A55082649}']
  end;

  ABPeoplePickerNavigationController = interface(UINavigationController)
    ['{2A306CAC-B549-4712-9830-16ADA399B323}']
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
    ['{5E7F229A-B5B6-4A7B-AE3E-A8ABE0730AEB}']
  end;

  ABPersonViewController = interface(UIViewController)
    ['{A9A07ADA-BF64-4C43-9E43-2F1CE94E6FA9}']
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
    ['{A1E52885-B132-41E7-8CC2-CB36211C2C6D}']
  end;

  ABUnknownPersonViewController = interface(UIViewController)
    ['{075CEC2F-47F5-44E4-9445-ADD753BE18C3}']
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
    ['{E4AE69F9-61EE-40C8-B50D-C65203E913B5}']
    procedure newPersonViewController(newPersonView: ABNewPersonViewController;
      didCompleteWithNewPerson: ABRecordRef); cdecl;
  end;

  ABPeoplePickerNavigationControllerDelegate = interface(IObjectiveC)
    ['{8B8ED31E-1D13-41A1-BE75-A03C103B60B1}']
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
    ['{CD9E87CC-53A9-430D-A1BC-1D6662F4E2D4}']
    function personViewController(personViewController: ABPersonViewController;
      shouldPerformDefaultActionForPerson: ABRecordRef; &property: ABPropertyID;
      identifier: ABMultiValueIdentifier): Boolean; cdecl;
  end;

  ABUnknownPersonViewControllerDelegate = interface(IObjectiveC)
    ['{BF851CF9-0A0E-4257-95B5-9FB52124A7F1}']
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
