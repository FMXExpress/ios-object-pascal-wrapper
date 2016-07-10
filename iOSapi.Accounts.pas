{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework Accounts
//

unit iOSapi.Accounts;

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
  ACAccountCredentialRenewResultRenewed = 0;
  ACAccountCredentialRenewResultRejected = 1;
  ACAccountCredentialRenewResultFailed = 2;
  ACErrorUnknown = 1;
  ACErrorAccountMissingRequiredProperty = 2;
  ACErrorAccountAuthenticationFailed = 3;
  ACErrorAccountTypeInvalid = 4;
  ACErrorAccountAlreadyExists = 5;
  ACErrorAccountNotFound = 6;
  ACErrorPermissionDenied = 7;
  ACErrorAccessInfoInvalid = 8;
  ACErrorClientPermissionDenied = 9;
  ACErrorAccessDeniedByProtectionPolicy = 10;
  ACErrorCredentialNotFound = 11;
  ACErrorFetchCredentialFailed = 12;
  ACErrorStoreCredentialFailed = 13;
  ACErrorRemoveCredentialFailed = 14;
  ACErrorUpdatingNonexistentAccount = 15;
  ACErrorInvalidClientBundleID = 16;
  ACErrorDeniedByPlugin = 17;
  ACErrorCoreDataSaveFailed = 18;
  ACErrorFailedSerializingAccountInfo = 19;
  ACErrorInvalidCommand = 20;
  ACErrorMissingTransportMessageID = 21;
  ACErrorCredentialItemNotFound = 22;
  ACErrorCredentialItemNotExpired = 23;

type

  // ===== Forward declarations =====
{$M+}
  ACAccountType = interface;
  ACAccountCredential = interface;
  ACAccount = interface;
  ACAccountStore = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  ACAccountCredentialRenewResult = NSInteger;
  ACAccountStoreSaveCompletionHandler = procedure(param1: Boolean;
    param2: NSError) of object;
  ACAccountStoreRemoveCompletionHandler = procedure(param1: Boolean;
    param2: NSError) of object;
  ACAccountStoreRequestAccessCompletionHandler = procedure(param1: Boolean;
    param2: NSError) of object;
  ACAccountStoreCredentialRenewalHandler = procedure
    (param1: ACAccountCredentialRenewResult; param2: NSError) of object;
  ACErrorCode = Cardinal;
  // ===== Interface declarations =====

  ACAccountTypeClass = interface(NSObjectClass)
    ['{829694E1-7A28-418B-8E8A-00FDFD40A51B}']
  end;

  ACAccountType = interface(NSObject)
    ['{479922BC-DCFD-4883-BDC6-0687172438A4}']
    function accountTypeDescription: NSString; cdecl;
    function identifier: NSString; cdecl;
    function accessGranted: Boolean; cdecl;
  end;

  TACAccountType = class(TOCGenericImport<ACAccountTypeClass, ACAccountType>)
  end;

  PACAccountType = Pointer;

  ACAccountCredentialClass = interface(NSObjectClass)
    ['{53A85F29-8D86-4445-9268-346B736C3029}']
  end;

  ACAccountCredential = interface(NSObject)
    ['{224D30B9-4618-4D7F-9F17-07361E444F40}']
    function initWithOAuthToken(token: NSString; tokenSecret: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithOAuth2Token(token: NSString; refreshToken: NSString;
      expiryDate: NSDate): Pointer { instancetype }; cdecl;
    procedure setOauthToken(oauthToken: NSString); cdecl;
    function oauthToken: NSString; cdecl;
  end;

  TACAccountCredential = class(TOCGenericImport<ACAccountCredentialClass,
    ACAccountCredential>)
  end;

  PACAccountCredential = Pointer;

  ACAccountClass = interface(NSObjectClass)
    ['{718EF0A3-D30E-4570-A1D8-252B2392A4C8}']
  end;

  ACAccount = interface(NSObject)
    ['{4FE256F6-3201-48A8-9ABA-547A4BF03D66}']
    function initWithAccountType(&type: ACAccountType)
      : Pointer { instancetype }; cdecl;
    function identifier: NSString; cdecl;
    procedure setAccountType(accountType: ACAccountType); cdecl;
    function accountType: ACAccountType; cdecl;
    procedure setAccountDescription(accountDescription: NSString); cdecl;
    function accountDescription: NSString; cdecl;
    procedure setUsername(username: NSString); cdecl;
    function username: NSString; cdecl;
    function userFullName: NSString; cdecl;
    procedure setCredential(credential: ACAccountCredential); cdecl;
    function credential: ACAccountCredential; cdecl;
  end;

  TACAccount = class(TOCGenericImport<ACAccountClass, ACAccount>)
  end;

  PACAccount = Pointer;

  ACAccountStoreClass = interface(NSObjectClass)
    ['{3AECC229-444C-4A62-99CA-721618B142B6}']
  end;

  ACAccountStore = interface(NSObject)
    ['{57B09B8C-01D7-42AA-BBA1-D8EA8A252067}']
    function Accounts: NSArray; cdecl;
    function accountWithIdentifier(identifier: NSString): ACAccount; cdecl;
    function accountTypeWithAccountTypeIdentifier(typeIdentifier: NSString)
      : ACAccountType; cdecl;
    function accountsWithAccountType(accountType: ACAccountType)
      : NSArray; cdecl;
    procedure saveAccount(account: ACAccount;
      withCompletionHandler: ACAccountStoreSaveCompletionHandler); cdecl;
    [MethodName('requestAccessToAccountsWithType:withCompletionHandler:')]
    procedure requestAccessToAccountsWithTypeWithCompletionHandler
      (accountType: ACAccountType;
      withCompletionHandler
      : ACAccountStoreRequestAccessCompletionHandler); cdecl;
    [MethodName('requestAccessToAccountsWithType:options:completion:')]
    procedure requestAccessToAccountsWithTypeOptionsCompletion
      (accountType: ACAccountType; options: NSDictionary;
      completion: ACAccountStoreRequestAccessCompletionHandler); cdecl;
    procedure renewCredentialsForAccount(account: ACAccount;
      completion: ACAccountStoreCredentialRenewalHandler); cdecl;
    procedure removeAccount(account: ACAccount;
      withCompletionHandler: ACAccountStoreRemoveCompletionHandler); cdecl;
  end;

  TACAccountStore = class(TOCGenericImport<ACAccountStoreClass, ACAccountStore>)
  end;

  PACAccountStore = Pointer;

  // ===== Exported string consts =====

function ACAccountStoreDidChangeNotification: NSString;
function ACAccountTypeIdentifierTwitter: NSString;
function ACAccountTypeIdentifierFacebook: NSString;
function ACAccountTypeIdentifierSinaWeibo: NSString;
function ACAccountTypeIdentifierTencentWeibo: NSString;
function ACAccountTypeIdentifierLinkedIn: NSString;
function ACFacebookAppIdKey: NSString;
function ACFacebookPermissionsKey: NSString;
function ACFacebookAudienceKey: NSString;
function ACFacebookAudienceEveryone: NSString;
function ACFacebookAudienceFriends: NSString;
function ACFacebookAudienceOnlyMe: NSString;
function ACLinkedInAppIdKey: NSString;
function ACLinkedInPermissionsKey: NSString;
function ACTencentWeiboAppIdKey: NSString;
function ACErrorDomain: NSString;


// ===== External functions =====

const
  libAccounts = '/System/Library/Frameworks/Accounts.framework/Accounts';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  AccountsModule: THandle;

{$ENDIF IOS}

function ACAccountStoreDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAccounts,
    'ACAccountStoreDidChangeNotification');
end;

function ACAccountTypeIdentifierTwitter: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACAccountTypeIdentifierTwitter');
end;

function ACAccountTypeIdentifierFacebook: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACAccountTypeIdentifierFacebook');
end;

function ACAccountTypeIdentifierSinaWeibo: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACAccountTypeIdentifierSinaWeibo');
end;

function ACAccountTypeIdentifierTencentWeibo: NSString;
begin
  Result := CocoaNSStringConst(libAccounts,
    'ACAccountTypeIdentifierTencentWeibo');
end;

function ACAccountTypeIdentifierLinkedIn: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACAccountTypeIdentifierLinkedIn');
end;

function ACFacebookAppIdKey: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACFacebookAppIdKey');
end;

function ACFacebookPermissionsKey: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACFacebookPermissionsKey');
end;

function ACFacebookAudienceKey: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACFacebookAudienceKey');
end;

function ACFacebookAudienceEveryone: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACFacebookAudienceEveryone');
end;

function ACFacebookAudienceFriends: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACFacebookAudienceFriends');
end;

function ACFacebookAudienceOnlyMe: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACFacebookAudienceOnlyMe');
end;

function ACLinkedInAppIdKey: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACLinkedInAppIdKey');
end;

function ACLinkedInPermissionsKey: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACLinkedInPermissionsKey');
end;

function ACTencentWeiboAppIdKey: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACTencentWeiboAppIdKey');
end;

function ACErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libAccounts, 'ACErrorDomain');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

AccountsModule := dlopen(MarshaledAString(libAccounts), RTLD_LAZY);

finalization

dlclose(AccountsModule);
{$ENDIF IOS}

end.
