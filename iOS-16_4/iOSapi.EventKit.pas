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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
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
  EKErrorInvalidInviteReplyCalendar = 31;
  EKErrorNotificationsCollectionFlagNotSet = 32;
  EKErrorSourceMismatch = 33;
  EKErrorNotificationCollectionMismatch = 34;
  EKErrorNotificationSavedWithoutCollection = 35;
  EKErrorReminderAlarmContainsEmailOrUrl = 36;
  EKErrorLast = 37;
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
  EKVirtualConferenceRoomTypeDescriptor = interface;
  EKVirtualConferenceURLDescriptor = interface;
  EKVirtualConferenceDescriptor = interface;
  EKVirtualConferenceProvider = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  EKAuthorizationStatus = NSInteger;
  EKWeekday = NSInteger;
  EKRecurrenceFrequency = NSInteger;
  EKParticipantType = NSInteger;
  EKParticipantRole = NSInteger;
  EKParticipantScheduleStatus = NSInteger;
  EKParticipantStatus = NSInteger;
  EKCalendarType = NSInteger;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  EKCalendarEventAvailabilityMask = NSUInteger;
  EKSourceType = NSInteger;
  EKEntityType = NSUInteger;
  EKEntityMask = NSUInteger;
  EKAlarmProximity = NSInteger;
  EKAlarmType = NSInteger;
  EKReminderPriority = NSUInteger;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  CGColorRef = Pointer;
  PCGColorRef = ^CGColorRef;
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
  PCFTypeRef = ^CFTypeRef;
  ABAddressBookRef = CFTypeRef;
  PABAddressBookRef = ^ABAddressBookRef;
  ABRecordRef = CFTypeRef;
  PABRecordRef = ^ABRecordRef;
  EKVirtualConferenceRoomTypeIdentifier = NSString;
  PEKVirtualConferenceRoomTypeIdentifier = ^
    EKVirtualConferenceRoomTypeIdentifier;
  TEventKitCompletionHandler = procedure(param1: NSArray; param2: NSError)
    of object;
  TEventKitCompletionHandler1 = procedure(param1: EKVirtualConferenceDescriptor;
    param2: NSError) of object;
  // ===== Interface declarations =====

  EKObjectClass = interface(NSObjectClass)
    ['{272387F9-2260-42C8-9640-00030F231A7B}']
  end;

  EKObject = interface(NSObject)
    ['{060565A0-8391-4B93-9BDC-99C0F62D57DC}']
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
    ['{2D8FAD29-430F-4E52-8FB0-0727D42D3114}']
  end;

  EKCalendarItem = interface(EKObject)
    ['{050E003D-840B-47FA-8F32-7EBF425023FC}']
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
    ['{99D24CC9-24B3-42A9-A63A-2F865B36DE65}']
    { class } function locationWithTitle(title: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function locationWithMapItem(mapItem: MKMapItem)
      : Pointer { instancetype }; cdecl;
  end;

  EKStructuredLocation = interface(EKObject)
    ['{3DB9C7A4-AD1F-49A1-BE67-AF61C0619037}']
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
    ['{475E89D9-4D10-40F7-BAF4-A3F8A7F94483}']
    { class } function alarmWithAbsoluteDate(date: NSDate): EKAlarm; cdecl;
    { class } function alarmWithRelativeOffset(offset: NSTimeInterval)
      : EKAlarm; cdecl;
  end;

  EKAlarm = interface(EKObject)
    ['{A4E812E1-B640-4724-A60A-F3B349911578}']
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
    ['{7D428B80-A518-4916-AC04-7B10D5EB23F4}']
    { class } function authorizationStatusForEntityType
      (entityType: EKEntityType): EKAuthorizationStatus; cdecl;
  end;

  EKEventStore = interface(NSObject)
    ['{0C559BBA-75B0-47B0-8AB2-7F8184A6A794}']
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
    ['{49CD889C-3B9A-4BB1-8EB7-5EDBD7EC20AC}']
  end;

  EKSource = interface(EKObject)
    ['{40E67D47-CA0B-443E-900D-7E982C53BDF6}']
    function sourceIdentifier: NSString; cdecl;
    function sourceType: EKSourceType; cdecl;
    function title: NSString; cdecl;
    function calendars: NSSet; cdecl;
    function calendarsForEntityType(entityType: EKEntityType): NSSet; cdecl;
    function isDelegate: Boolean; cdecl;
  end;

  TEKSource = class(TOCGenericImport<EKSourceClass, EKSource>)
  end;

  PEKSource = Pointer;

  EKCalendarClass = interface(EKObjectClass)
    ['{EE2E8EA8-D72C-4122-B9C3-89524BBFD520}']
    { class } function calendarWithEventStore(eventStore: EKEventStore)
      : EKCalendar; cdecl;
    { class } function calendarForEntityType(entityType: EKEntityType;
      eventStore: EKEventStore): EKCalendar; cdecl;
  end;

  EKCalendar = interface(EKObject)
    ['{75085406-BF17-4E94-A211-BFF7A320E4C5}']
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
    ['{79CD904D-706B-451F-B4F4-17A8CDE325C6}']
  end;

  EKRecurrenceRule = interface(EKObject)
    ['{C69064EC-A1ED-4771-A0EA-FCCB7990563A}']
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
    ['{717AA06C-41DB-4125-BFCA-D31CEE83350F}']
  end;

  EKParticipant = interface(EKObject)
    ['{E3461A68-DBAA-4943-8251-B19B38F79D04}']
    function URL: NSURL; cdecl;
    function name: NSString; cdecl;
    function participantStatus: EKParticipantStatus; cdecl;
    function participantRole: EKParticipantRole; cdecl;
    function participantType: EKParticipantType; cdecl;
    function isCurrentUser: Boolean; cdecl;
    function contactPredicate: NSPredicate; cdecl;
    function ABRecordWithAddressBook(addressBook: ABAddressBookRef)
      : ABRecordRef; cdecl;
  end;

  TEKParticipant = class(TOCGenericImport<EKParticipantClass, EKParticipant>)
  end;

  PEKParticipant = Pointer;

  EKEventClass = interface(EKCalendarItemClass)
    ['{F2F7BCE5-98E4-4966-BF52-3C76685A4E72}']
    { class } function eventWithEventStore(eventStore: EKEventStore)
      : EKEvent; cdecl;
  end;

  EKEvent = interface(EKCalendarItem)
    ['{E5B38B97-B6F3-4229-AE4E-6DDF7F034160}']
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
    ['{A824D3FD-67A2-4553-A3FA-C03534D40F6C}']
    { class } function reminderWithEventStore(eventStore: EKEventStore)
      : EKReminder; cdecl;
  end;

  EKReminder = interface(EKCalendarItem)
    ['{91731CA0-3E54-4887-B7B3-D4C421F1A9D6}']
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
    ['{B54F940F-5605-43D6-9B37-00B631017B68}']
    [MethodName('dayOfWeek:')]
    { class } function dayOfWeek(dayOfTheWeek: EKWeekday)
      : Pointer { instancetype }; cdecl;
    [MethodName('dayOfWeek:weekNumber:')]
    { class } function dayOfWeekWeekNumber(dayOfTheWeek: EKWeekday;
      weekNumber: NSInteger): Pointer { instancetype }; cdecl;
  end;

  EKRecurrenceDayOfWeek = interface(NSObject)
    ['{71C631C5-E01A-467E-A092-F47FB85AE8D8}']
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
    ['{3F99F6A5-4266-4952-80B2-E26ADA7A3DA3}']
    { class } function recurrenceEndWithEndDate(endDate: NSDate)
      : Pointer { instancetype }; cdecl;
    { class } function recurrenceEndWithOccurrenceCount(occurrenceCount
      : NSUInteger): Pointer { instancetype }; cdecl;
  end;

  EKRecurrenceEnd = interface(NSObject)
    ['{D2612D91-2EFF-44EB-B36B-B4FCF45F29DA}']
    function endDate: NSDate; cdecl;
    function occurrenceCount: NSUInteger; cdecl;
  end;

  TEKRecurrenceEnd = class(TOCGenericImport<EKRecurrenceEndClass,
    EKRecurrenceEnd>)
  end;

  PEKRecurrenceEnd = Pointer;

  EKVirtualConferenceRoomTypeDescriptorClass = interface(NSObjectClass)
    ['{0AE4D43D-06E3-4710-8A35-6C0CE989EBB4}']
  end;

  EKVirtualConferenceRoomTypeDescriptor = interface(NSObject)
    ['{7645C1E6-1EBC-4EE7-B598-F49D5A3734A7}']
    function initWithTitle(title: NSString;
      identifier: EKVirtualConferenceRoomTypeIdentifier)
      : Pointer { instancetype }; cdecl;
    function title: NSString; cdecl;
    function identifier: EKVirtualConferenceRoomTypeIdentifier; cdecl;
  end;

  TEKVirtualConferenceRoomTypeDescriptor = class
    (TOCGenericImport<EKVirtualConferenceRoomTypeDescriptorClass,
    EKVirtualConferenceRoomTypeDescriptor>)
  end;

  PEKVirtualConferenceRoomTypeDescriptor = Pointer;

  EKVirtualConferenceURLDescriptorClass = interface(NSObjectClass)
    ['{F1C31528-6F13-48C5-A0CD-B2D78F8C2910}']
  end;

  EKVirtualConferenceURLDescriptor = interface(NSObject)
    ['{BEB60DFC-4D9F-43EB-AEF2-1222BB80C8E1}']
    function initWithTitle(title: NSString; URL: NSURL)
      : Pointer { instancetype }; cdecl;
    function title: NSString; cdecl;
    function URL: NSURL; cdecl;
  end;

  TEKVirtualConferenceURLDescriptor = class
    (TOCGenericImport<EKVirtualConferenceURLDescriptorClass,
    EKVirtualConferenceURLDescriptor>)
  end;

  PEKVirtualConferenceURLDescriptor = Pointer;

  EKVirtualConferenceDescriptorClass = interface(NSObjectClass)
    ['{5439490E-9A53-4FC4-81A9-E3D0D234AB41}']
  end;

  EKVirtualConferenceDescriptor = interface(NSObject)
    ['{45AA8A94-8D0C-492F-8887-A24165E98C78}']
    function initWithTitle(title: NSString; URLDescriptors: NSArray;
      conferenceDetails: NSString): Pointer { instancetype }; cdecl;
    function title: NSString; cdecl;
    function URLDescriptors: NSArray; cdecl;
    function conferenceDetails: NSString; cdecl;
  end;

  TEKVirtualConferenceDescriptor = class
    (TOCGenericImport<EKVirtualConferenceDescriptorClass,
    EKVirtualConferenceDescriptor>)
  end;

  PEKVirtualConferenceDescriptor = Pointer;

  EKVirtualConferenceProviderClass = interface(NSObjectClass)
    ['{2F991A84-D52D-4DA5-8FEC-D44F65A3AAAA}']
  end;

  EKVirtualConferenceProvider = interface(NSObject)
    ['{F5D88E26-DAE7-4821-B4BE-D6018F6AEA60}']
    procedure fetchAvailableRoomTypesWithCompletionHandler(completionHandler
      : TEventKitCompletionHandler); cdecl;
    procedure fetchVirtualConferenceForIdentifier
      (identifier: EKVirtualConferenceRoomTypeIdentifier;
      completionHandler: TEventKitCompletionHandler1); cdecl;
  end;

  TEKVirtualConferenceProvider = class
    (TOCGenericImport<EKVirtualConferenceProviderClass,
    EKVirtualConferenceProvider>)
  end;

  PEKVirtualConferenceProvider = Pointer;

  // ===== Exported string consts =====

function EKErrorDomain: NSString;
function EKEventStoreChangedNotification: NSString;
function __AVAILABILITY_INTERNAL__IPHONE_16_0: Pointer;


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

function __AVAILABILITY_INTERNAL__IPHONE_16_0: Pointer;
begin
  Result := CocoaPointerConst(libEventKit,
    '__AVAILABILITY_INTERNAL__IPHONE_16_0');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

EventKitModule := dlopen(MarshaledAString(libEventKit), RTLD_LAZY);

finalization

dlclose(EventKitModule);
{$ENDIF IOS}

end.
