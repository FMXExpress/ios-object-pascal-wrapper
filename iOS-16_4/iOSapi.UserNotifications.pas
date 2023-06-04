{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework UserNotifications
//

unit iOSapi.UserNotifications;

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
  UNErrorCodeNotificationsNotAllowed = 1;
  UNErrorCodeAttachmentInvalidURL = 100;
  UNErrorCodeAttachmentUnrecognizedType = 101;
  UNErrorCodeAttachmentInvalidFileSize = 102;
  UNErrorCodeAttachmentNotInDataStore = 103;
  UNErrorCodeAttachmentMoveIntoDataStoreFailed = 104;
  UNErrorCodeAttachmentCorrupt = 105;
  UNErrorCodeNotificationInvalidNoDate = 1400;
  UNErrorCodeNotificationInvalidNoContent = 1401;
  UNErrorCodeContentProvidingObjectNotAllowed = 1500;
  UNErrorCodeContentProvidingInvalid = 1501;
  UNErrorCodeBadgeInputInvalid = 1600;
  UNNotificationActionOptionAuthenticationRequired = (1 shl 0);
  UNNotificationActionOptionDestructive = (1 shl 1);
  UNNotificationActionOptionForeground = (1 shl 2);
  UNNotificationCategoryOptionCustomDismissAction = (1 shl 0);
  UNNotificationCategoryOptionAllowInCarPlay = (1 shl 1);
  UNNotificationCategoryOptionHiddenPreviewsShowTitle = (1 shl 2);
  UNNotificationCategoryOptionHiddenPreviewsShowSubtitle = (1 shl 3);
  UNNotificationCategoryOptionAllowAnnouncement = (1 shl 4);
  UNNotificationInterruptionLevelPassive = 0;
  UNNotificationInterruptionLevelActive = 1;
  UNNotificationInterruptionLevelTimeSensitive = 2;
  UNNotificationInterruptionLevelCritical = 3;
  UNAuthorizationStatusNotDetermined = 0;
  UNAuthorizationStatusDenied = 1;
  UNAuthorizationStatusAuthorized = 2;
  UNAuthorizationStatusProvisional = 3;
  UNAuthorizationStatusEphemeral = 4;
  UNShowPreviewsSettingAlways = 0;
  UNShowPreviewsSettingWhenAuthenticated = 1;
  UNShowPreviewsSettingNever = 2;
  UNNotificationSettingNotSupported = 0;
  UNNotificationSettingDisabled = 1;
  UNNotificationSettingEnabled = 2;
  UNAlertStyleNone = 0;
  UNAlertStyleBanner = 1;
  UNAlertStyleAlert = 2;
  UNAuthorizationOptionBadge = (1 shl 0);
  UNAuthorizationOptionSound = (1 shl 1);
  UNAuthorizationOptionAlert = (1 shl 2);
  UNAuthorizationOptionCarPlay = (1 shl 3);
  UNAuthorizationOptionCriticalAlert = (1 shl 4);
  UNAuthorizationOptionProvidesAppNotificationSettings = (1 shl 5);
  UNAuthorizationOptionProvisional = (1 shl 6);
  UNAuthorizationOptionAnnouncement = (1 shl 7);
  UNAuthorizationOptionTimeSensitive = (1 shl 8);
  UNNotificationPresentationOptionBadge = (1 shl 0);
  UNNotificationPresentationOptionSound = (1 shl 1);
  UNNotificationPresentationOptionAlert = (1 shl 2);
  UNNotificationPresentationOptionList = (1 shl 3);
  UNNotificationPresentationOptionBanner = (1 shl 4);

type

  // ===== Forward declarations =====
{$M+}
  UNUserNotificationCenterSupport = interface;
  UNNotificationRequest = interface;
  UNNotification = interface;
  UNNotificationActionIcon = interface;
  UNNotificationAction = interface;
  UNTextInputNotificationAction = interface;
  UNNotificationAttachment = interface;
  UNNotificationCategory = interface;
  UNNotificationSound = interface;
  UNNotificationContent = interface;
  UNNotificationContentProviding = interface;
  UNMutableNotificationContent = interface;
  UNNotificationTrigger = interface;
  UNNotificationResponse = interface;
  UNTextInputNotificationResponse = interface;
  UNNotificationServiceExtension = interface;
  UNNotificationSettings = interface;
  UNPushNotificationTrigger = interface;
  UNTimeIntervalNotificationTrigger = interface;
  UNCalendarNotificationTrigger = interface;
  UNLocationNotificationTrigger = interface;
  UNUserNotificationCenterDelegate = interface;
  UNUserNotificationCenter = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  UNErrorCode = NSInteger;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  UNNotificationActionOptions = NSUInteger;
  UNNotificationCategoryOptions = NSUInteger;
  UNNotificationInterruptionLevel = NSUInteger;
  TUserNotificationsWithContentHandler = procedure
    (param1: UNNotificationContent) of object;
  UNAuthorizationStatus = NSInteger;
  UNShowPreviewsSetting = NSInteger;
  UNNotificationSetting = NSInteger;
  UNAlertStyle = NSInteger;
  UNNotificationSoundName = NSString;
  PUNNotificationSoundName = ^UNNotificationSoundName;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  UNAuthorizationOptions = NSUInteger;
  TUserNotificationsCompletionHandler = procedure(param1: Boolean;
    param2: NSError) of object;
  TUserNotificationsCompletionHandler1 = procedure(param1: NSSet) of object;
  TUserNotificationsCompletionHandler2 = procedure
    (param1: UNNotificationSettings) of object;
  TUserNotificationsWithCompletionHandler = procedure(param1: NSError)
    of object;
  TUserNotificationsCompletionHandler3 = procedure(param1: NSArray) of object;
  UNNotificationPresentationOptions = NSUInteger;
  TUserNotificationsWithCompletionHandler1 = procedure
    (param1: UNNotificationPresentationOptions) of object;
  TUserNotificationsWithCompletionHandler2 = procedure() of object;
  // ===== Interface declarations =====

  UNUserNotificationCenterSupport = interface(IObjectiveC)
    ['{1B37E558-83CF-43C6-9B77-2678FDB76B25}']
    function localizedUserNotificationStringForKey(key: NSString;
      arguments: NSArray): NSString; cdecl;
  end;

  UNNotificationRequestClass = interface(NSObjectClass)
    ['{414A92D3-BE01-4C9D-AA43-7F1CCFF50896}']
    { class } function requestWithIdentifier(identifier: NSString;
      content: UNNotificationContent; trigger: UNNotificationTrigger)
      : Pointer { instancetype }; cdecl;
  end;

  UNNotificationRequest = interface(NSObject)
    ['{42DA46B8-6E39-44DF-B7A5-6F16A1C77278}']
    function identifier: NSString; cdecl;
    function content: UNNotificationContent; cdecl;
    function trigger: UNNotificationTrigger; cdecl;
  end;

  TUNNotificationRequest = class(TOCGenericImport<UNNotificationRequestClass,
    UNNotificationRequest>)
  end;

  PUNNotificationRequest = Pointer;

  UNNotificationClass = interface(NSObjectClass)
    ['{E60229B0-DE9B-4DCC-BF6C-50E94FA43D4B}']
  end;

  UNNotification = interface(NSObject)
    ['{7D4417F9-5B2B-4849-B23A-FC8ED3C6AF40}']
    function date: NSDate; cdecl;
    function request: UNNotificationRequest; cdecl;
  end;

  TUNNotification = class(TOCGenericImport<UNNotificationClass, UNNotification>)
  end;

  PUNNotification = Pointer;

  UNNotificationActionIconClass = interface(NSObjectClass)
    ['{7087E16A-3A67-4894-9971-A68D27881A51}']
    { class } function iconWithTemplateImageName(templateImageName: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function iconWithSystemImageName(systemImageName: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  UNNotificationActionIcon = interface(NSObject)
    ['{BA762382-6D31-46B8-B380-59359270A93F}']
  end;

  TUNNotificationActionIcon = class
    (TOCGenericImport<UNNotificationActionIconClass, UNNotificationActionIcon>)
  end;

  PUNNotificationActionIcon = Pointer;

  UNNotificationActionClass = interface(NSObjectClass)
    ['{8344A78E-12BB-495E-B40C-29951FD6974C}']
    [MethodName('actionWithIdentifier:title:options:')]
    { class } function actionWithIdentifierTitleOptions(identifier: NSString;
      title: NSString; options: UNNotificationActionOptions)
      : Pointer { instancetype }; cdecl;
    [MethodName('actionWithIdentifier:title:options:icon:')]
    { class } function actionWithIdentifierTitleOptionsIcon
      (identifier: NSString; title: NSString;
      options: UNNotificationActionOptions; icon: UNNotificationActionIcon)
      : Pointer { instancetype }; cdecl;
  end;

  UNNotificationAction = interface(NSObject)
    ['{04C8B1B5-9804-4A06-85B9-9D5E4DD3A282}']
    function identifier: NSString; cdecl;
    function title: NSString; cdecl;
    function options: UNNotificationActionOptions; cdecl;
    function icon: UNNotificationActionIcon; cdecl;
  end;

  TUNNotificationAction = class(TOCGenericImport<UNNotificationActionClass,
    UNNotificationAction>)
  end;

  PUNNotificationAction = Pointer;

  UNTextInputNotificationActionClass = interface(UNNotificationActionClass)
    ['{37139BB8-E8D3-4EF6-9A53-49ABABAE57A5}']
    [MethodName
      ('actionWithIdentifier:title:options:textInputButtonTitle:textInputPlaceholder:')
      ]
    { class } function
      actionWithIdentifierTitleOptionsTextInputButtonTitleTextInputPlaceholder
      (identifier: NSString; title: NSString;
      options: UNNotificationActionOptions; textInputButtonTitle: NSString;
      textInputPlaceholder: NSString): Pointer { instancetype }; cdecl;
    [MethodName
      ('actionWithIdentifier:title:options:icon:textInputButtonTitle:textInputPlaceholder:')
      ]
    { class } function
      actionWithIdentifierTitleOptionsIconTextInputButtonTitleTextInputPlaceholder
      (identifier: NSString; title: NSString;
      options: UNNotificationActionOptions; icon: UNNotificationActionIcon;
      textInputButtonTitle: NSString; textInputPlaceholder: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  UNTextInputNotificationAction = interface(UNNotificationAction)
    ['{7141B849-688C-495A-BC39-1506B5DCD6C5}']
    function textInputButtonTitle: NSString; cdecl;
    function textInputPlaceholder: NSString; cdecl;
  end;

  TUNTextInputNotificationAction = class
    (TOCGenericImport<UNTextInputNotificationActionClass,
    UNTextInputNotificationAction>)
  end;

  PUNTextInputNotificationAction = Pointer;

  UNNotificationAttachmentClass = interface(NSObjectClass)
    ['{4796AED3-BE60-4385-A0DE-084EE3999A6B}']
    { class } function attachmentWithIdentifier(identifier: NSString;
      URL: NSURL; options: NSDictionary; error: NSError)
      : Pointer { instancetype }; cdecl;
  end;

  UNNotificationAttachment = interface(NSObject)
    ['{B7DEA080-D207-4E6C-A431-21939A638F7B}']
    function identifier: NSString; cdecl;
    function URL: NSURL; cdecl;
    function &type: NSString; cdecl;
  end;

  TUNNotificationAttachment = class
    (TOCGenericImport<UNNotificationAttachmentClass, UNNotificationAttachment>)
  end;

  PUNNotificationAttachment = Pointer;

  UNNotificationCategoryClass = interface(NSObjectClass)
    ['{3FC785CD-522E-4EB2-8ACB-074B9EF4362A}']
    [MethodName('categoryWithIdentifier:actions:intentIdentifiers:options:')]
    { class } function categoryWithIdentifierActionsIntentIdentifiersOptions
      (identifier: NSString; actions: NSArray; intentIdentifiers: NSArray;
      options: UNNotificationCategoryOptions): Pointer { instancetype }; cdecl;
    [MethodName
      ('categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:options:')
      ]
    { class } function
      categoryWithIdentifierActionsIntentIdentifiersHiddenPreviewsBodyPlaceholderOptions
      (identifier: NSString; actions: NSArray; intentIdentifiers: NSArray;
      hiddenPreviewsBodyPlaceholder: NSString;
      options: UNNotificationCategoryOptions): Pointer { instancetype }; cdecl;
    [MethodName
      ('categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:')
      ]
    { class } function
      categoryWithIdentifierActionsIntentIdentifiersHiddenPreviewsBodyPlaceholderCategorySummaryFormatOptions
      (identifier: NSString; actions: NSArray; intentIdentifiers: NSArray;
      hiddenPreviewsBodyPlaceholder: NSString; categorySummaryFormat: NSString;
      options: UNNotificationCategoryOptions): Pointer { instancetype }; cdecl;
  end;

  UNNotificationCategory = interface(NSObject)
    ['{A7C5EFD1-EEA8-4459-A6AA-B6ECF5EA4714}']
    function identifier: NSString; cdecl;
    function actions: NSArray; cdecl;
    function intentIdentifiers: NSArray; cdecl;
    function options: UNNotificationCategoryOptions; cdecl;
    function hiddenPreviewsBodyPlaceholder: NSString; cdecl;
    function categorySummaryFormat: NSString; cdecl;
  end;

  TUNNotificationCategory = class(TOCGenericImport<UNNotificationCategoryClass,
    UNNotificationCategory>)
  end;

  PUNNotificationCategory = Pointer;

  UNNotificationSoundClass = interface(NSObjectClass)
    ['{98613F35-B979-48BE-ADF3-3368AFAA0F44}']
    { class } function defaultCriticalSoundWithAudioVolume(volume: Single)
      : Pointer { instancetype }; cdecl;
    { class } function soundNamed(name: UNNotificationSoundName)
      : Pointer { instancetype }; cdecl;
    { class } function ringtoneSoundNamed(name: UNNotificationSoundName)
      : Pointer { instancetype }; cdecl;
    [MethodName('criticalSoundNamed:')]
    { class } function criticalSoundNamed(name: UNNotificationSoundName)
      : Pointer { instancetype }; cdecl;
    [MethodName('criticalSoundNamed:withAudioVolume:')]
    { class } function criticalSoundNamedWithAudioVolume
      (name: UNNotificationSoundName; withAudioVolume: Single)
      : Pointer { instancetype }; cdecl;
  end;

  UNNotificationSound = interface(NSObject)
    ['{4DF6AC2D-1906-4318-99C9-ECB43640164C}']
    procedure setDefaultSound(defaultSound: UNNotificationSound); cdecl;
    function defaultSound: UNNotificationSound; cdecl;
    procedure setDefaultRingtoneSound(defaultRingtoneSound
      : UNNotificationSound); cdecl;
    function defaultRingtoneSound: UNNotificationSound; cdecl;
    procedure setDefaultCriticalSound(defaultCriticalSound
      : UNNotificationSound); cdecl;
    function defaultCriticalSound: UNNotificationSound; cdecl;
  end;

  TUNNotificationSound = class(TOCGenericImport<UNNotificationSoundClass,
    UNNotificationSound>)
  end;

  PUNNotificationSound = Pointer;

  UNNotificationContentClass = interface(NSObjectClass)
    ['{E0E28757-8B8F-44DB-B419-5B3EFBDCF356}']
  end;

  UNNotificationContent = interface(NSObject)
    ['{409B55E2-F7A4-48F4-8F61-95B899612EBC}']
    function attachments: NSArray; cdecl;
    function badge: NSNumber; cdecl;
    function body: NSString; cdecl;
    function categoryIdentifier: NSString; cdecl;
    function launchImageName: NSString; cdecl;
    function sound: UNNotificationSound; cdecl;
    function subtitle: NSString; cdecl;
    function threadIdentifier: NSString; cdecl;
    function title: NSString; cdecl;
    function userInfo: NSDictionary; cdecl;
    function summaryArgument: NSString; cdecl;
    function summaryArgumentCount: NSUInteger; cdecl;
    function targetContentIdentifier: NSString; cdecl;
    function interruptionLevel: UNNotificationInterruptionLevel; cdecl;
    function relevanceScore: Double; cdecl;
    function filterCriteria: NSString; cdecl;
    function contentByUpdatingWithProvider(provider: Pointer; error: NSError)
      : UNNotificationContent; cdecl;
  end;

  TUNNotificationContent = class(TOCGenericImport<UNNotificationContentClass,
    UNNotificationContent>)
  end;

  PUNNotificationContent = Pointer;

  UNMutableNotificationContentClass = interface(UNNotificationContentClass)
    ['{95BD5DDE-BE6F-4D22-AD65-E2373B253572}']
  end;

  UNMutableNotificationContent = interface(UNNotificationContent)
    ['{B4403BF1-5FE7-46A8-A29B-1869A7415F20}']
    procedure setAttachments(attachments: NSArray); cdecl;
    function attachments: NSArray; cdecl;
    procedure setBadge(badge: NSNumber); cdecl;
    function badge: NSNumber; cdecl;
    procedure setBody(body: NSString); cdecl;
    function body: NSString; cdecl;
    procedure setCategoryIdentifier(categoryIdentifier: NSString); cdecl;
    function categoryIdentifier: NSString; cdecl;
    procedure setLaunchImageName(launchImageName: NSString); cdecl;
    function launchImageName: NSString; cdecl;
    procedure setSound(sound: UNNotificationSound); cdecl;
    function sound: UNNotificationSound; cdecl;
    procedure setSubtitle(subtitle: NSString); cdecl;
    function subtitle: NSString; cdecl;
    procedure setThreadIdentifier(threadIdentifier: NSString); cdecl;
    function threadIdentifier: NSString; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setUserInfo(userInfo: NSDictionary); cdecl;
    function userInfo: NSDictionary; cdecl;
    procedure setSummaryArgument(summaryArgument: NSString); cdecl;
    function summaryArgument: NSString; cdecl;
    procedure setSummaryArgumentCount(summaryArgumentCount: NSUInteger); cdecl;
    function summaryArgumentCount: NSUInteger; cdecl;
    procedure setTargetContentIdentifier(targetContentIdentifier
      : NSString); cdecl;
    function targetContentIdentifier: NSString; cdecl;
    procedure setInterruptionLevel(interruptionLevel
      : UNNotificationInterruptionLevel); cdecl;
    function interruptionLevel: UNNotificationInterruptionLevel; cdecl;
    procedure setRelevanceScore(relevanceScore: Double); cdecl;
    function relevanceScore: Double; cdecl;
    procedure setFilterCriteria(filterCriteria: NSString); cdecl;
    function filterCriteria: NSString; cdecl;
  end;

  TUNMutableNotificationContent = class
    (TOCGenericImport<UNMutableNotificationContentClass,
    UNMutableNotificationContent>)
  end;

  PUNMutableNotificationContent = Pointer;

  UNNotificationTriggerClass = interface(NSObjectClass)
    ['{ECBA0F24-5879-41DB-8AC1-39839B7365B0}']
  end;

  UNNotificationTrigger = interface(NSObject)
    ['{0ECEEB50-1306-4612-A056-568F1C006F6B}']
    function repeats: Boolean; cdecl;
  end;

  TUNNotificationTrigger = class(TOCGenericImport<UNNotificationTriggerClass,
    UNNotificationTrigger>)
  end;

  PUNNotificationTrigger = Pointer;

  UNNotificationResponseClass = interface(NSObjectClass)
    ['{2D901FEA-1628-4E98-848C-BD1DD10FE6A7}']
  end;

  UNNotificationResponse = interface(NSObject)
    ['{52C796C8-9456-48AA-BA14-AB621517D3B0}']
    function notification: UNNotification; cdecl;
    function actionIdentifier: NSString; cdecl;
  end;

  TUNNotificationResponse = class(TOCGenericImport<UNNotificationResponseClass,
    UNNotificationResponse>)
  end;

  PUNNotificationResponse = Pointer;

  UNTextInputNotificationResponseClass = interface(UNNotificationResponseClass)
    ['{8A33E302-ACC4-4759-A9DE-BF3A36729663}']
  end;

  UNTextInputNotificationResponse = interface(UNNotificationResponse)
    ['{D1302E05-814B-414C-9290-A770E189B364}']
    function userText: NSString; cdecl;
  end;

  TUNTextInputNotificationResponse = class
    (TOCGenericImport<UNTextInputNotificationResponseClass,
    UNTextInputNotificationResponse>)
  end;

  PUNTextInputNotificationResponse = Pointer;

  UNNotificationServiceExtensionClass = interface(NSObjectClass)
    ['{81E5A794-6222-4AD7-97D1-604341423F3B}']
  end;

  UNNotificationServiceExtension = interface(NSObject)
    ['{B7E5BF1C-10E7-4C11-8957-7992CFFB414D}']
    procedure didReceiveNotificationRequest(request: UNNotificationRequest;
      withContentHandler: TUserNotificationsWithContentHandler); cdecl;
    procedure serviceExtensionTimeWillExpire; cdecl;
  end;

  TUNNotificationServiceExtension = class
    (TOCGenericImport<UNNotificationServiceExtensionClass,
    UNNotificationServiceExtension>)
  end;

  PUNNotificationServiceExtension = Pointer;

  UNNotificationSettingsClass = interface(NSObjectClass)
    ['{27A6107A-2B35-4B0F-B7EE-39CE60FBA28B}']
  end;

  UNNotificationSettings = interface(NSObject)
    ['{4184C2AE-E8DA-4DB4-A4A1-7FE5F1E556B3}']
    function authorizationStatus: UNAuthorizationStatus; cdecl;
    function soundSetting: UNNotificationSetting; cdecl;
    function badgeSetting: UNNotificationSetting; cdecl;
    function alertSetting: UNNotificationSetting; cdecl;
    function notificationCenterSetting: UNNotificationSetting; cdecl;
    function lockScreenSetting: UNNotificationSetting; cdecl;
    function carPlaySetting: UNNotificationSetting; cdecl;
    function alertStyle: UNAlertStyle; cdecl;
    function showPreviewsSetting: UNShowPreviewsSetting; cdecl;
    function criticalAlertSetting: UNNotificationSetting; cdecl;
    function providesAppNotificationSettings: Boolean; cdecl;
    function announcementSetting: UNNotificationSetting; cdecl;
    function timeSensitiveSetting: UNNotificationSetting; cdecl;
    function scheduledDeliverySetting: UNNotificationSetting; cdecl;
    function directMessagesSetting: UNNotificationSetting; cdecl;
  end;

  TUNNotificationSettings = class(TOCGenericImport<UNNotificationSettingsClass,
    UNNotificationSettings>)
  end;

  PUNNotificationSettings = Pointer;

  UNPushNotificationTriggerClass = interface(UNNotificationTriggerClass)
    ['{0E265CF0-2267-4356-A653-B456389F4A25}']
  end;

  UNPushNotificationTrigger = interface(UNNotificationTrigger)
    ['{DD567402-035D-4398-A1CD-6D9751BA4E0B}']
  end;

  TUNPushNotificationTrigger = class
    (TOCGenericImport<UNPushNotificationTriggerClass,
    UNPushNotificationTrigger>)
  end;

  PUNPushNotificationTrigger = Pointer;

  UNTimeIntervalNotificationTriggerClass = interface(UNNotificationTriggerClass)
    ['{8A223A1E-C933-4B4E-852F-FFB08F619668}']
    { class } function triggerWithTimeInterval(timeInterval: NSTimeInterval;
      repeats: Boolean): Pointer { instancetype }; cdecl;
  end;

  UNTimeIntervalNotificationTrigger = interface(UNNotificationTrigger)
    ['{96A43B19-ECC6-41E6-AB75-50003BB6F6B9}']
    function timeInterval: NSTimeInterval; cdecl;
    function nextTriggerDate: NSDate; cdecl;
  end;

  TUNTimeIntervalNotificationTrigger = class
    (TOCGenericImport<UNTimeIntervalNotificationTriggerClass,
    UNTimeIntervalNotificationTrigger>)
  end;

  PUNTimeIntervalNotificationTrigger = Pointer;

  UNCalendarNotificationTriggerClass = interface(UNNotificationTriggerClass)
    ['{904EB36E-F1BB-49AE-825C-5B114FFBF328}']
    { class } function triggerWithDateMatchingComponents(dateComponents
      : NSDateComponents; repeats: Boolean): Pointer { instancetype }; cdecl;
  end;

  UNCalendarNotificationTrigger = interface(UNNotificationTrigger)
    ['{F8059BDD-629F-4D7C-B477-C808193009AC}']
    function dateComponents: NSDateComponents; cdecl;
    function nextTriggerDate: NSDate; cdecl;
  end;

  TUNCalendarNotificationTrigger = class
    (TOCGenericImport<UNCalendarNotificationTriggerClass,
    UNCalendarNotificationTrigger>)
  end;

  PUNCalendarNotificationTrigger = Pointer;

  UNLocationNotificationTriggerClass = interface(UNNotificationTriggerClass)
    ['{6FE2377D-2C7D-482E-A523-CF8E4D27F0EE}']
    { class } function triggerWithRegion(region: CLRegion; repeats: Boolean)
      : Pointer { instancetype }; cdecl;
  end;

  UNLocationNotificationTrigger = interface(UNNotificationTrigger)
    ['{B689168F-2AEA-41C8-BEDE-B0925ED01619}']
    function region: CLRegion; cdecl;
  end;

  TUNLocationNotificationTrigger = class
    (TOCGenericImport<UNLocationNotificationTriggerClass,
    UNLocationNotificationTrigger>)
  end;

  PUNLocationNotificationTrigger = Pointer;

  UNUserNotificationCenterClass = interface(NSObjectClass)
    ['{1869D9EF-E081-4E48-A3C1-82573C0F7996}']
    { class } function currentNotificationCenter
      : UNUserNotificationCenter; cdecl;
  end;

  UNUserNotificationCenter = interface(NSObject)
    ['{FA1E5373-86AA-4380-A311-6415E412E514}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function supportsContentExtensions: Boolean; cdecl;
    procedure requestAuthorizationWithOptions(options: UNAuthorizationOptions;
      completionHandler: TUserNotificationsCompletionHandler); cdecl;
    procedure setNotificationCategories(categories: NSSet); cdecl;
    procedure getNotificationCategoriesWithCompletionHandler(completionHandler
      : TUserNotificationsCompletionHandler1); cdecl;
    procedure getNotificationSettingsWithCompletionHandler(completionHandler
      : TUserNotificationsCompletionHandler2); cdecl;
    procedure addNotificationRequest(request: UNNotificationRequest;
      withCompletionHandler: TUserNotificationsWithCompletionHandler); cdecl;
    procedure getPendingNotificationRequestsWithCompletionHandler
      (completionHandler: TUserNotificationsCompletionHandler3); cdecl;
    procedure removePendingNotificationRequestsWithIdentifiers
      (identifiers: NSArray); cdecl;
    procedure removeAllPendingNotificationRequests; cdecl;
    procedure getDeliveredNotificationsWithCompletionHandler(completionHandler
      : TUserNotificationsCompletionHandler3); cdecl;
    procedure removeDeliveredNotificationsWithIdentifiers
      (identifiers: NSArray); cdecl;
    procedure removeAllDeliveredNotifications; cdecl;
    procedure setBadgeCount(newBadgeCount: NSInteger;
      withCompletionHandler: TUserNotificationsWithCompletionHandler); cdecl;
  end;

  TUNUserNotificationCenter = class
    (TOCGenericImport<UNUserNotificationCenterClass, UNUserNotificationCenter>)
  end;

  PUNUserNotificationCenter = Pointer;

  // ===== Protocol declarations =====

  UNNotificationContentProviding = interface(IObjectiveC)
    ['{F76DFC43-7CE8-4FE9-A0B6-C90830C81D99}']
  end;

  UNUserNotificationCenterDelegate = interface(IObjectiveC)
    ['{328BA5C1-922E-4F1D-806B-F1194AAE4CFB}']
    [MethodName
      ('userNotificationCenter:willPresentNotification:withCompletionHandler:')]
    procedure userNotificationCenterWillPresentNotificationWithCompletionHandler
      (center: UNUserNotificationCenter;
      willPresentNotification: UNNotification;
      withCompletionHandler: TUserNotificationsWithCompletionHandler1); cdecl;
    [MethodName
      ('userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:')
      ]
    procedure userNotificationCenterDidReceiveNotificationResponseWithCompletionHandler
      (center: UNUserNotificationCenter;
      didReceiveNotificationResponse: UNNotificationResponse;
      withCompletionHandler: TUserNotificationsWithCompletionHandler2); cdecl;
    [MethodName('userNotificationCenter:openSettingsForNotification:')]
    procedure userNotificationCenterOpenSettingsForNotification
      (center: UNUserNotificationCenter;
      openSettingsForNotification: UNNotification); cdecl;
  end;

  // ===== Exported string consts =====

function UNErrorDomain: NSString;
function UNNotificationAttachmentOptionsTypeHintKey: NSString;
function UNNotificationAttachmentOptionsThumbnailHiddenKey: NSString;
function UNNotificationAttachmentOptionsThumbnailClippingRectKey: NSString;
function UNNotificationAttachmentOptionsThumbnailTimeKey: NSString;
function UNNotificationDefaultActionIdentifier: NSString;
function UNNotificationDismissActionIdentifier: NSString;


// ===== External functions =====

const
  libUserNotifications =
    '/System/Library/Frameworks/UserNotifications.framework/UserNotifications';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  UserNotificationsModule: THandle;

{$ENDIF IOS}

function UNErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libUserNotifications, 'UNErrorDomain');
end;

function UNNotificationAttachmentOptionsTypeHintKey: NSString;
begin
  Result := CocoaNSStringConst(libUserNotifications,
    'UNNotificationAttachmentOptionsTypeHintKey');
end;

function UNNotificationAttachmentOptionsThumbnailHiddenKey: NSString;
begin
  Result := CocoaNSStringConst(libUserNotifications,
    'UNNotificationAttachmentOptionsThumbnailHiddenKey');
end;

function UNNotificationAttachmentOptionsThumbnailClippingRectKey: NSString;
begin
  Result := CocoaNSStringConst(libUserNotifications,
    'UNNotificationAttachmentOptionsThumbnailClippingRectKey');
end;

function UNNotificationAttachmentOptionsThumbnailTimeKey: NSString;
begin
  Result := CocoaNSStringConst(libUserNotifications,
    'UNNotificationAttachmentOptionsThumbnailTimeKey');
end;

function UNNotificationDefaultActionIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libUserNotifications,
    'UNNotificationDefaultActionIdentifier');
end;

function UNNotificationDismissActionIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libUserNotifications,
    'UNNotificationDismissActionIdentifier');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

UserNotificationsModule := dlopen(MarshaledAString(libUserNotifications),
  RTLD_LAZY);

finalization

dlclose(UserNotificationsModule);
{$ENDIF IOS}

end.
