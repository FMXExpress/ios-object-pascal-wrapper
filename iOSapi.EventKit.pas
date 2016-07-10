{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework EventKit
//

unit iOSapi.EventKit;

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
  iOSapi.CoreGraphics,
  iOSapi.CoreLocation,
  iOSapi.Foundation;

const
  EKAuthorizationStatusNotDetermined = 0;
  EKAuthorizationStatusRestricted = 1;
  EKAuthorizationStatusDenied = 2;
  EKAuthorizationStatusAuthorized = 3;
  EKWeekdaySunday = 1;
  EKWeekdayMonday = 2;
  EKWeekdayTuesday = 3;
  EKWeekdayWednesday = 4;
  EKWeekdayThursday = 5;
  EKWeekdayFriday = 6;
  EKWeekdaySaturday = 7;
  EKSunday = EKWeekdaySunday;
  EKMonday = EKWeekdayMonday;
  EKTuesday = EKWeekdayTuesday;
  EKWednesday = EKWeekdayWednesday;
  EKThursday = EKWeekdayThursday;
  EKFriday = EKWeekdayFriday;
  EKSaturday = EKWeekdaySaturday;
  EKRecurrenceFrequencyDaily = 0;
  EKRecurrenceFrequencyWeekly = 1;
  EKRecurrenceFrequencyMonthly = 2;
  EKRecurrenceFrequencyYearly = 3;
  EKParticipantTypeUnknown = 0;
  EKParticipantTypePerson = 1;
  EKParticipantTypeRoom = 2;
  EKParticipantTypeResource = 3;
  EKParticipantTypeGroup = 4;
  EKParticipantRoleUnknown = 0;
  EKParticipantRoleRequired = 1;
  EKParticipantRoleOptional = 2;
  EKParticipantRoleChair = 3;
  EKParticipantRoleNonParticipant = 4;
  EKParticipantScheduleStatusNone = 0;
  EKParticipantScheduleStatusPending = 1;
  EKParticipantScheduleStatusSent = 2;
  EKParticipantScheduleStatusDelivered = 3;
  EKParticipantScheduleStatusRecipientNotRecognized = 4;
  EKParticipantScheduleStatusNoPrivileges = 5;
  EKParticipantScheduleStatusDeliveryFailed = 6;
  EKParticipantScheduleStatusCannotDeliver = 7;
  EKParticipantScheduleStatusRecipientNotAllowed = 8;
  EKParticipantStatusUnknown = 0;
  EKParticipantStatusPending = 1;
  EKParticipantStatusAccepted = 2;
  EKParticipantStatusDeclined = 3;
  EKParticipantStatusTentative = 4;
  EKParticipantStatusDelegated = 5;
  EKParticipantStatusCompleted = 6;
  EKParticipantStatusInProcess = 7;
  EKCalendarTypeLocal = 0;
  EKCalendarTypeCalDAV = 1;
  EKCalendarTypeExchange = 2;
  EKCalendarTypeSubscription = 3;
  EKCalendarTypeBirthday = 4;
  EKCalendarEventAvailabilityNone = 0;
  EKCalendarEventAvailabilityBusy = (1 shl 0);
  EKCalendarEventAvailabilityFree = (1 shl 1);
  EKCalendarEventAvailabilityTentative = (1 shl 2);
  EKCalendarEventAvailabilityUnavailable = (1 shl 3);
  EKSourceTypeLocal = 0;
  EKSourceTypeExchange = 1;
  EKSourceTypeCalDAV = 2;
  EKSourceTypeMobileMe = 3;
  EKSourceTypeSubscribed = 4;
  EKSourceTypeBirthdays = 5;
  EKEntityTypeEvent = 0;
  EKEntityTypeReminder = 1;
  EKEntityMaskEvent = (1 shl EKEntityTypeEvent);
  EKEntityMaskReminder = (1 shl EKEntityTypeReminder);
  EKAlarmProximityNone = 0;
  EKAlarmProximityEnter = 1;
  EKAlarmProximityLeave = 2;
  EKAlarmTypeDisplay = 0;
  EKAlarmTypeAudio = 1;
  EKAlarmTypeProcedure = 2;
  EKAlarmTypeEmail = 3;
  EKReminderPriorityNone = 0;
  EKReminderPriorityHigh = 1;
  EKReminderPriorityMedium = 5;
  EKReminderPriorityLow = 9;
  EKErrorEventNotMutable = 0;
  EKErrorNoCalendar = 1;
  EKErrorNoStartDate = 2;
  EKErrorNoEndDate = 3;
  EKErrorDatesInverted = 4;
  EKErrorInternalFailure = 5;
  EKErrorCalendarReadOnly = 6;
  EKErrorDurationGreaterThanRecurrence = 7;
  EKErrorAlarmGreaterThanRecurrence = 8;
  EKErrorStartDateTooFarInFuture = 9;
  EKErrorStartDateCollidesWithOtherOccurrence = 10;
  EKErrorObjectBelongsToDifferentStore = 11;
  EKErrorInvitesCannotBeMoved = 12;
  EKErrorInvalidSpan = 13;
  EKErrorCalendarHasNoSource = 14;
  EKErrorCalendarSourceCannotBeModified = 15;
  EKErrorCalendarIsImmutable = 16;
  EKErrorSourceDoesNotAllowCalendarAddDelete = 17;
  EKErrorRecurringReminderRequiresDueDate = 18;
  EKErrorStructuredLocationsNotSupported = 19;
  EKErrorReminderLocationsNotSupported = 20;
  EKErrorAlarmProximityNotSupported = 21;
  EKErrorCalendarDoesNotAllowEvents = 22;
  EKErrorCalendarDoesNotAllowReminders = 23;
  EKErrorSourceDoesNotAllowReminders = 24;
  EKErrorSourceDoesNotAllowEvents = 25;
  EKErrorPriorityIsInvalid = 26;
  EKErrorInvalidEntityType = 27;
  EKErrorProcedureAlarmsNotMutable = 28;
  EKErrorEventStoreNotAuthorized = 29;
  EKErrorOSNotSupported = 30;
  EKErrorLast = 31;
  EKEventAvailabilityNotSupported = -1;
  EKEventAvailabilityBusy = 0;
  EKEventAvailabilityFree = 1;
  EKEventAvailabilityTentative = 2;
  EKEventAvailabilityUnavailable = 3;
  EKEventStatusNone = 0;
  EKEventStatusConfirmed = 1;
  EKEventStatusTentative = 2;
  EKEventStatusCanceled = 3;
  EKSpanThisEvent = 0;
  EKSpanFutureEvents = 1;

type

  // ===== Forward declarations =====
{$M+}
  EKObject = interface;
  EKCalendarItem = interface;
  EKStructuredLocation = interface;
  EKAlarm = interface;
  EKEventStore = interface;
  EKSource = interface;
  EKCalendar = interface;
  EKRecurrenceRule = interface;
  EKParticipant = interface;
  EKEvent = interface;
  EKReminder = interface;
  EKRecurrenceDayOfWeek = interface;
  EKRecurrenceEnd = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  EKAuthorizationStatus = NSInteger;
  EKWeekday = NSInteger;
  EKRecurrenceFrequency = NSInteger;
  EKParticipantType = NSInteger;
  EKParticipantRole = NSInteger;
  EKParticipantScheduleStatus = NSInteger;
  EKParticipantStatus = NSInteger;
  EKCalendarType = NSInteger;
  NSUInteger = Cardinal;
  EKCalendarEventAvailabilityMask = NSUInteger;
  EKSourceType = NSInteger;
  EKEntityType = NSUInteger;
  EKEntityMask = NSUInteger;
  EKAlarmProximity = NSInteger;
  EKAlarmType = NSInteger;
  EKReminderPriority = NSUInteger;
  NSTimeInterval = Double;
  CGColorRef = Pointer;
  EKErrorCode = NSInteger;
  EKEventAvailability = NSInteger;
  EKEventStatus = NSInteger;
  NSComparisonResult = NSInteger;
  EKSpan = NSInteger;
  EKEventSearchCallback = procedure(param1: EKEvent; param2: PBoolean)
    of object;
  EKEventStoreRequestAccessCompletionHandler = procedure(param1: Boolean;
    param2: NSError) of object;
  TEventKitCompletion = procedure(param1: NSArray) of object;
  CFTypeRef = Pointer;
  ABAddressBookRef = CFTypeRef;
  ABRecordRef = CFTypeRef;
  // ===== Interface declarations =====

  EKObjectClass = interface(NSObjectClass)
    ['{A0F96108-28D1-4097-9BDC-DA2953681CCD}']
  end;

  EKObject = interface(NSObject)
    ['{57CFBD1A-B7C3-4FE1-8B7C-D1984F94A1D3}']
    function hasChanges: Boolean; cdecl;
    function isNew: Boolean; cdecl;
    procedure reset; cdecl;
    procedure rollback; cdecl;
    function refresh: Boolean; cdecl;
  end;

  TEKObject = class(TOCGenericImport<EKObjectClass, EKObject>)
  end;

  PEKObject = Pointer;

  EKCalendarItemClass = interface(EKObjectClass)
    ['{D5EAFBB2-2212-4E92-88E0-BA6287B452B5}']
  end;

  EKCalendarItem = interface(EKObject)
    ['{0EDF256C-2E0B-4FCA-ACD3-40FDE41D09C4}']
    function UUID: NSString; cdecl;
    procedure setCalendar(calendar: EKCalendar); cdecl;
    function calendar: EKCalendar; cdecl;
    function calendarItemIdentifier: NSString; cdecl;
    function calendarItemExternalIdentifier: NSString; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setLocation(location: NSString); cdecl;
    function location: NSString; cdecl;
    procedure setNotes(notes: NSString); cdecl;
    function notes: NSString; cdecl;
    procedure setURL(URL: NSURL); cdecl;
    function URL: NSURL; cdecl;
    function lastModifiedDate: NSDate; cdecl;
    function creationDate: NSDate; cdecl;
    procedure setTimeZone(timeZone: NSTimeZone); cdecl;
    function timeZone: NSTimeZone; cdecl;
    function hasAlarms: Boolean; cdecl;
    function hasRecurrenceRules: Boolean; cdecl;
    function hasAttendees: Boolean; cdecl;
    function hasNotes: Boolean; cdecl;
    function attendees: NSArray; cdecl;
    procedure setAlarms(alarms: NSArray); cdecl;
    function alarms: NSArray; cdecl;
    procedure addAlarm(alarm: EKAlarm); cdecl;
    procedure removeAlarm(alarm: EKAlarm); cdecl;
    procedure setRecurrenceRules(recurrenceRules: NSArray); cdecl;
    function recurrenceRules: NSArray; cdecl;
    procedure addRecurrenceRule(rule: EKRecurrenceRule); cdecl;
    procedure removeRecurrenceRule(rule: EKRecurrenceRule); cdecl;
  end;

  TEKCalendarItem = class(TOCGenericImport<EKCalendarItemClass, EKCalendarItem>)
  end;

  PEKCalendarItem = Pointer;

  EKStructuredLocationClass = interface(EKObjectClass)
    ['{45033D8E-4F16-45C8-A2D8-8E99CB3953F0}']
    { class } function locationWithTitle(title: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function locationWithMapItem(mapItem: MKMapItem)
      : Pointer { instancetype }; cdecl;
  end;

  EKStructuredLocation = interface(EKObject)
    ['{89E9A5C7-57FB-4ADC-B74F-973F5FF81274}']
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setGeoLocation(geoLocation: CLLocation); cdecl;
    function geoLocation: CLLocation; cdecl;
    procedure setRadius(radius: Double); cdecl;
    function radius: Double; cdecl;
  end;

  TEKStructuredLocation = class(TOCGenericImport<EKStructuredLocationClass,
    EKStructuredLocation>)
  end;

  PEKStructuredLocation = Pointer;

  EKAlarmClass = interface(EKObjectClass)
    ['{01B3E359-BBA3-4F69-AB3E-771EDBA9E313}']
    { class } function alarmWithAbsoluteDate(date: NSDate): EKAlarm; cdecl;
    { class } function alarmWithRelativeOffset(offset: NSTimeInterval)
      : EKAlarm; cdecl;
  end;

  EKAlarm = interface(EKObject)
    ['{697D4684-532D-4F4C-A8BF-4FBFEFDD8DAE}']
    procedure setRelativeOffset(relativeOffset: NSTimeInterval); cdecl;
    function relativeOffset: NSTimeInterval; cdecl;
    procedure setAbsoluteDate(absoluteDate: NSDate); cdecl;
    function absoluteDate: NSDate; cdecl;
    procedure setStructuredLocation(structuredLocation
      : EKStructuredLocation); cdecl;
    function structuredLocation: EKStructuredLocation; cdecl;
    procedure setProximity(proximity: EKAlarmProximity); cdecl;
    function proximity: EKAlarmProximity; cdecl;
    function &type: EKAlarmType; cdecl;
    procedure setEmailAddress(emailAddress: NSString); cdecl;
    function emailAddress: NSString; cdecl;
    procedure setSoundName(soundName: NSString); cdecl;
    function soundName: NSString; cdecl;
    procedure setURL(URL: NSURL); cdecl;
    function URL: NSURL; cdecl;
  end;

  TEKAlarm = class(TOCGenericImport<EKAlarmClass, EKAlarm>)
  end;

  PEKAlarm = Pointer;

  EKEventStoreClass = interface(NSObjectClass)
    ['{93E93764-8C35-427B-BE18-11C4AF66C321}']
    { class } function authorizationStatusForEntityType
      (entityType: EKEntityType): EKAuthorizationStatus; cdecl;
  end;

  EKEventStore = interface(NSObject)
    ['{382A0517-2E3B-4C03-BE99-2A450B79C579}']
    function initWithAccessToEntityTypes(entityTypes: EKEntityMask)
      : Pointer; cdecl;
    function init: Pointer; cdecl;
    function initWithSources(sources: NSArray): Pointer { instancetype }; cdecl;
    procedure requestAccessToEntityType(entityType: EKEntityType;
      completion: EKEventStoreRequestAccessCompletionHandler); cdecl;
    function eventStoreIdentifier: NSString; cdecl;
    function delegateSources: NSArray; cdecl;
    function sources: NSArray; cdecl;
    function sourceWithIdentifier(identifier: NSString): EKSource; cdecl;
    function calendars: NSArray; cdecl;
    function calendarsForEntityType(entityType: EKEntityType): NSArray; cdecl;
    function defaultCalendarForNewEvents: EKCalendar; cdecl;
    function defaultCalendarForNewReminders: EKCalendar; cdecl;
    function calendarWithIdentifier(identifier: NSString): EKCalendar; cdecl;
    function saveCalendar(calendar: EKCalendar; commit: Boolean; error: NSError)
      : Boolean; cdecl;
    function removeCalendar(calendar: EKCalendar; commit: Boolean;
      error: NSError): Boolean; cdecl;
    function calendarItemWithIdentifier(identifier: NSString)
      : EKCalendarItem; cdecl;
    function calendarItemsWithExternalIdentifier(externalIdentifier: NSString)
      : NSArray; cdecl;
    [MethodName('saveEvent:span:error:')]
    function saveEventSpanError(event: EKEvent; span: EKSpan; error: NSError)
      : Boolean; cdecl;
    [MethodName('removeEvent:span:error:')]
    function removeEventSpanError(event: EKEvent; span: EKSpan; error: NSError)
      : Boolean; cdecl;
    [MethodName('saveEvent:span:commit:error:')]
    function saveEventSpanCommitError(event: EKEvent; span: EKSpan;
      commit: Boolean; error: NSError): Boolean; cdecl;
    [MethodName('removeEvent:span:commit:error:')]
    function removeEventSpanCommitError(event: EKEvent; span: EKSpan;
      commit: Boolean; error: NSError): Boolean; cdecl;
    function eventWithIdentifier(identifier: NSString): EKEvent; cdecl;
    function eventsMatchingPredicate(predicate: NSPredicate): NSArray; cdecl;
    procedure enumerateEventsMatchingPredicate(predicate: NSPredicate;
      usingBlock: EKEventSearchCallback); cdecl;
    function predicateForEventsWithStartDate(startDate: NSDate; endDate: NSDate;
      calendars: NSArray): NSPredicate; cdecl;
    function saveReminder(reminder: EKReminder; commit: Boolean; error: NSError)
      : Boolean; cdecl;
    function removeReminder(reminder: EKReminder; commit: Boolean;
      error: NSError): Boolean; cdecl;
    function fetchRemindersMatchingPredicate(predicate: NSPredicate;
      completion: TEventKitCompletion): Pointer; cdecl;
    procedure cancelFetchRequest(fetchIdentifier: Pointer); cdecl;
    function predicateForRemindersInCalendars(calendars: NSArray)
      : NSPredicate; cdecl;
    function predicateForIncompleteRemindersWithDueDateStarting
      (startDate: NSDate; ending: NSDate; calendars: NSArray)
      : NSPredicate; cdecl;
    function predicateForCompletedRemindersWithCompletionDateStarting
      (startDate: NSDate; ending: NSDate; calendars: NSArray)
      : NSPredicate; cdecl;
    function commit(error: NSError): Boolean; cdecl;
    procedure reset; cdecl;
    procedure refreshSourcesIfNecessary; cdecl;
  end;

  TEKEventStore = class(TOCGenericImport<EKEventStoreClass, EKEventStore>)
  end;

  PEKEventStore = Pointer;

  EKSourceClass = interface(EKObjectClass)
    ['{7BF5A4F7-01BD-4DEE-8E4D-8F936A1A419D}']
  end;

  EKSource = interface(EKObject)
    ['{A4CC3D8C-48F7-4934-940A-0C9C04BC8132}']
    function sourceIdentifier: NSString; cdecl;
    function sourceType: EKSourceType; cdecl;
    function title: NSString; cdecl;
    function calendars: NSSet; cdecl;
    function calendarsForEntityType(entityType: EKEntityType): NSSet; cdecl;
  end;

  TEKSource = class(TOCGenericImport<EKSourceClass, EKSource>)
  end;

  PEKSource = Pointer;

  EKCalendarClass = interface(EKObjectClass)
    ['{AF315EF6-4A7C-400E-BA71-DB17D8F51AFB}']
    { class } function calendarWithEventStore(eventStore: EKEventStore)
      : EKCalendar; cdecl;
    { class } function calendarForEntityType(entityType: EKEntityType;
      eventStore: EKEventStore): EKCalendar; cdecl;
  end;

  EKCalendar = interface(EKObject)
    ['{995FA6C2-C491-45F6-ADAA-39BB914DAF4E}']
    procedure setSource(source: EKSource); cdecl;
    function source: EKSource; cdecl;
    function calendarIdentifier: NSString; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    function &type: EKCalendarType; cdecl;
    function allowsContentModifications: Boolean; cdecl;
    function isSubscribed: Boolean; cdecl;
    function isImmutable: Boolean; cdecl;
    procedure setCGColor(CGColor: CGColorRef); cdecl;
    function CGColor: CGColorRef; cdecl;
    function supportedEventAvailabilities
      : EKCalendarEventAvailabilityMask; cdecl;
    function allowedEntityTypes: EKEntityMask; cdecl;
  end;

  TEKCalendar = class(TOCGenericImport<EKCalendarClass, EKCalendar>)
  end;

  PEKCalendar = Pointer;

  EKRecurrenceRuleClass = interface(EKObjectClass)
    ['{807380C0-1794-4A05-A990-598E4100CE7C}']
  end;

  EKRecurrenceRule = interface(EKObject)
    ['{25E0D0B1-777C-4584-9EE9-44EDBD8593BA}']
    [MethodName('initRecurrenceWithFrequency:interval:end:')]
    function initRecurrenceWithFrequencyIntervalEnd
      (&type: EKRecurrenceFrequency; interval: NSInteger; &end: EKRecurrenceEnd)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('initRecurrenceWithFrequency:interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:')
      ]
    function initRecurrenceWithFrequencyIntervalDaysOfTheWeekDaysOfTheMonthMonthsOfTheYearWeeksOfTheYearDaysOfTheYearSetPositionsEnd
      (&type: EKRecurrenceFrequency; interval: NSInteger;
      daysOfTheWeek: NSArray; daysOfTheMonth: NSArray; monthsOfTheYear: NSArray;
      weeksOfTheYear: NSArray; daysOfTheYear: NSArray; setPositions: NSArray;
      &end: EKRecurrenceEnd): Pointer { instancetype }; cdecl;
    function calendarIdentifier: NSString; cdecl;
    procedure setRecurrenceEnd(recurrenceEnd: EKRecurrenceEnd); cdecl;
    function recurrenceEnd: EKRecurrenceEnd; cdecl;
    function frequency: EKRecurrenceFrequency; cdecl;
    function interval: NSInteger; cdecl;
    function firstDayOfTheWeek: NSInteger; cdecl;
    function daysOfTheWeek: NSArray; cdecl;
    function daysOfTheMonth: NSArray; cdecl;
    function daysOfTheYear: NSArray; cdecl;
    function weeksOfTheYear: NSArray; cdecl;
    function monthsOfTheYear: NSArray; cdecl;
    function setPositions: NSArray; cdecl;
  end;

  TEKRecurrenceRule = class(TOCGenericImport<EKRecurrenceRuleClass,
    EKRecurrenceRule>)
  end;

  PEKRecurrenceRule = Pointer;

  EKParticipantClass = interface(EKObjectClass)
    ['{D5D0DB3D-8240-460E-A85D-9539DB235C8A}']
  end;

  EKParticipant = interface(EKObject)
    ['{D633099A-960F-438C-9487-5E2A57CF291A}']
    function URL: NSURL; cdecl;
    function name: NSString; cdecl;
    function participantStatus: EKParticipantStatus; cdecl;
    function participantRole: EKParticipantRole; cdecl;
    function participantType: EKParticipantType; cdecl;
    function isCurrentUser: Boolean; cdecl;
    function contactPredicate: NSPredicate; cdecl;
    function ABRecordWithAddressBook(AddressBook: ABAddressBookRef)
      : ABRecordRef; cdecl;
  end;

  TEKParticipant = class(TOCGenericImport<EKParticipantClass, EKParticipant>)
  end;

  PEKParticipant = Pointer;

  EKEventClass = interface(EKCalendarItemClass)
    ['{ED3586B0-00AF-4225-A27C-42B82A31CE41}']
    { class } function eventWithEventStore(eventStore: EKEventStore)
      : EKEvent; cdecl;
  end;

  EKEvent = interface(EKCalendarItem)
    ['{D04C33C0-5A5B-4084-A899-D830671DCBD7}']
    function eventIdentifier: NSString; cdecl;
    procedure setAllDay(allDay: Boolean); cdecl;
    function isAllDay: Boolean; cdecl;
    procedure setStartDate(startDate: NSDate); cdecl;
    function startDate: NSDate; cdecl;
    procedure setEndDate(endDate: NSDate); cdecl;
    function endDate: NSDate; cdecl;
    procedure setStructuredLocation(structuredLocation
      : EKStructuredLocation); cdecl;
    function structuredLocation: EKStructuredLocation; cdecl;
    function compareStartDateWithEvent(other: EKEvent)
      : NSComparisonResult; cdecl;
    function organizer: EKParticipant; cdecl;
    procedure setAvailability(availability: EKEventAvailability); cdecl;
    function availability: EKEventAvailability; cdecl;
    function status: EKEventStatus; cdecl;
    function isDetached: Boolean; cdecl;
    function occurrenceDate: NSDate; cdecl;
    function refresh: Boolean; cdecl;
    function birthdayContactIdentifier: NSString; cdecl;
    function birthdayPersonID: NSInteger; cdecl;
    function birthdayPersonUniqueID: NSString; cdecl;
  end;

  TEKEvent = class(TOCGenericImport<EKEventClass, EKEvent>)
  end;

  PEKEvent = Pointer;

  EKReminderClass = interface(EKCalendarItemClass)
    ['{809408B1-138B-40D3-BF99-E66D73D41134}']
    { class } function reminderWithEventStore(eventStore: EKEventStore)
      : EKReminder; cdecl;
  end;

  EKReminder = interface(EKCalendarItem)
    ['{F5CE7862-436E-4325-8AD6-3066AB940154}']
    procedure setStartDateComponents(startDateComponents
      : NSDateComponents); cdecl;
    function startDateComponents: NSDateComponents; cdecl;
    procedure setDueDateComponents(dueDateComponents: NSDateComponents); cdecl;
    function dueDateComponents: NSDateComponents; cdecl;
    procedure setCompleted(completed: Boolean); cdecl;
    function isCompleted: Boolean; cdecl;
    procedure setCompletionDate(completionDate: NSDate); cdecl;
    function completionDate: NSDate; cdecl;
    procedure setPriority(priority: NSUInteger); cdecl;
    function priority: NSUInteger; cdecl;
  end;

  TEKReminder = class(TOCGenericImport<EKReminderClass, EKReminder>)
  end;

  PEKReminder = Pointer;

  EKRecurrenceDayOfWeekClass = interface(NSObjectClass)
    ['{FF3DD0B4-6502-4537-AC22-E4D3515878F5}']
    [MethodName('dayOfWeek:')]
    { class } function dayOfWeek(dayOfTheWeek: EKWeekday)
      : Pointer { instancetype }; cdecl;
    [MethodName('dayOfWeek:weekNumber:')]
    { class } function dayOfWeekWeekNumber(dayOfTheWeek: EKWeekday;
      weekNumber: NSInteger): Pointer { instancetype }; cdecl;
  end;

  EKRecurrenceDayOfWeek = interface(NSObject)
    ['{E3EA3BE1-043A-4269-95FF-845D0294DFB3}']
    function initWithDayOfTheWeek(dayOfTheWeek: EKWeekday;
      weekNumber: NSInteger): Pointer; cdecl;
    function dayOfTheWeek: EKWeekday; cdecl;
    function weekNumber: NSInteger; cdecl;
  end;

  TEKRecurrenceDayOfWeek = class(TOCGenericImport<EKRecurrenceDayOfWeekClass,
    EKRecurrenceDayOfWeek>)
  end;

  PEKRecurrenceDayOfWeek = Pointer;

  EKRecurrenceEndClass = interface(NSObjectClass)
    ['{25778F06-60F5-4EC6-97E4-F682BF4BB94A}']
    { class } function recurrenceEndWithEndDate(endDate: NSDate)
      : Pointer { instancetype }; cdecl;
    { class } function recurrenceEndWithOccurrenceCount(occurrenceCount
      : NSUInteger): Pointer { instancetype }; cdecl;
  end;

  EKRecurrenceEnd = interface(NSObject)
    ['{75A0A693-5D43-404C-A6E6-2309540114E9}']
    function endDate: NSDate; cdecl;
    function occurrenceCount: NSUInteger; cdecl;
  end;

  TEKRecurrenceEnd = class(TOCGenericImport<EKRecurrenceEndClass,
    EKRecurrenceEnd>)
  end;

  PEKRecurrenceEnd = Pointer;

  // ===== Exported string consts =====

function EKErrorDomain: NSString;
function EKEventStoreChangedNotification: NSString;


// ===== External functions =====

const
  libEventKit = '/System/Library/Frameworks/EventKit.framework/EventKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  EventKitModule: THandle;

{$ENDIF IOS}

function EKErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libEventKit, 'EKErrorDomain');
end;

function EKEventStoreChangedNotification: NSString;
begin
  Result := CocoaNSStringConst(libEventKit, 'EKEventStoreChangedNotification');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

EventKitModule := dlopen(MarshaledAString(libEventKit), RTLD_LAZY);

finalization

dlclose(EventKitModule);
{$ENDIF IOS}

end.
