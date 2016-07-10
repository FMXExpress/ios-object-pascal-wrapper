{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework EventKitUI
//

unit iOSapi.EventKitUI;

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
  iOSapi.EventKit,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  EKCalendarChooserSelectionStyleSingle = 0;
  EKCalendarChooserSelectionStyleMultiple = 1;
  EKCalendarChooserDisplayAllCalendars = 0;
  EKCalendarChooserDisplayWritableCalendarsOnly = 1;
  EKEventEditViewActionCanceled = 0;
  EKEventEditViewActionSaved = 1;
  EKEventEditViewActionDeleted = 2;
  EKEventEditViewActionCancelled = EKEventEditViewActionCanceled;
  EKEventViewActionDone = 0;
  EKEventViewActionResponded = 1;
  EKEventViewActionDeleted = 2;

type

  // ===== Forward declarations =====
{$M+}
  EKCalendarChooserDelegate = interface;
  EKCalendarChooser = interface;
  EKEventEditViewDelegate = interface;
  EKEventEditViewController = interface;
  EKEventViewDelegate = interface;
  EKEventViewController = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  EKCalendarChooserSelectionStyle = NSInteger;
  EKCalendarChooserDisplayStyle = NSInteger;
  NSUInteger = Cardinal;
  EKEntityType = NSUInteger;
  EKEventEditViewAction = NSInteger;
  EKEventViewAction = NSInteger;
  // ===== Interface declarations =====

  EKCalendarChooserClass = interface(UIViewControllerClass)
    ['{F34345CE-A042-4BB2-BF48-1BCA82CDEEBD}']
  end;

  EKCalendarChooser = interface(UIViewController)
    ['{87530007-958C-472A-B688-860063B6BA5B}']
    [MethodName('initWithSelectionStyle:displayStyle:eventStore:')]
    function initWithSelectionStyleDisplayStyleEventStore(selectionStyle
      : EKCalendarChooserSelectionStyle;
      displayStyle: EKCalendarChooserDisplayStyle; eventStore: EKEventStore)
      : Pointer; cdecl;
    [MethodName('initWithSelectionStyle:displayStyle:entityType:eventStore:')]
    function initWithSelectionStyleDisplayStyleEntityTypeEventStore
      (style: EKCalendarChooserSelectionStyle;
      displayStyle: EKCalendarChooserDisplayStyle; entityType: EKEntityType;
      eventStore: EKEventStore): Pointer; cdecl;
    function selectionStyle: EKCalendarChooserSelectionStyle; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setShowsDoneButton(showsDoneButton: Boolean); cdecl;
    function showsDoneButton: Boolean; cdecl;
    procedure setShowsCancelButton(showsCancelButton: Boolean); cdecl;
    function showsCancelButton: Boolean; cdecl;
    procedure setSelectedCalendars(selectedCalendars: NSSet); cdecl;
    function selectedCalendars: NSSet; cdecl;
  end;

  TEKCalendarChooser = class(TOCGenericImport<EKCalendarChooserClass,
    EKCalendarChooser>)
  end;

  PEKCalendarChooser = Pointer;

  EKEventEditViewControllerClass = interface(UINavigationControllerClass)
    ['{3F086835-BAA8-4370-9928-2A91EE1593A8}']
  end;

  EKEventEditViewController = interface(UINavigationController)
    ['{B2D32269-6251-4F90-9FB0-1FC4584920ED}']
    procedure setEditViewDelegate(editViewDelegate: Pointer); cdecl;
    function editViewDelegate: Pointer; cdecl;
    procedure setEventStore(eventStore: EKEventStore); cdecl;
    function eventStore: EKEventStore; cdecl;
    procedure setEvent(event: EKEvent); cdecl;
    function event: EKEvent; cdecl;
    procedure cancelEditing; cdecl;
  end;

  TEKEventEditViewController = class
    (TOCGenericImport<EKEventEditViewControllerClass,
    EKEventEditViewController>)
  end;

  PEKEventEditViewController = Pointer;

  EKEventViewControllerClass = interface(UIViewControllerClass)
    ['{9811AC4F-112B-4E0F-AB8A-2640D310A034}']
  end;

  EKEventViewController = interface(UIViewController)
    ['{3734E069-E1A0-4CAA-A41C-CE0C89E4FA12}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setEvent(event: EKEvent); cdecl;
    function event: EKEvent; cdecl;
    procedure setAllowsEditing(allowsEditing: Boolean); cdecl;
    function allowsEditing: Boolean; cdecl;
    procedure setAllowsCalendarPreview(allowsCalendarPreview: Boolean); cdecl;
    function allowsCalendarPreview: Boolean; cdecl;
  end;

  TEKEventViewController = class(TOCGenericImport<EKEventViewControllerClass,
    EKEventViewController>)
  end;

  PEKEventViewController = Pointer;

  // ===== Protocol declarations =====

  EKCalendarChooserDelegate = interface(IObjectiveC)
    ['{209FA6BF-F6C9-4FF4-95F9-B1523079F491}']
    procedure calendarChooserSelectionDidChange(calendarChooser
      : EKCalendarChooser); cdecl;
    procedure calendarChooserDidFinish(calendarChooser
      : EKCalendarChooser); cdecl;
    procedure calendarChooserDidCancel(calendarChooser
      : EKCalendarChooser); cdecl;
  end;

  EKEventEditViewDelegate = interface(IObjectiveC)
    ['{636FD9A4-D2ED-4155-8FA3-0B4DD1A1980D}']
    procedure eventEditViewController(controller: EKEventEditViewController;
      didCompleteWithAction: EKEventEditViewAction); cdecl;
    function eventEditViewControllerDefaultCalendarForNewEvents
      (controller: EKEventEditViewController): EKCalendar; cdecl;
  end;

  EKEventViewDelegate = interface(IObjectiveC)
    ['{97EE893A-41D6-45A4-BF4C-8E0B0D1F0E17}']
    procedure eventViewController(controller: EKEventViewController;
      didCompleteWithAction: EKEventViewAction); cdecl;
  end;

  // ===== External functions =====

const
  libEventKitUI = '/System/Library/Frameworks/EventKitUI.framework/EventKitUI';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  EventKitUIModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

EventKitUIModule := dlopen(MarshaledAString(libEventKitUI), RTLD_LAZY);

finalization

dlclose(EventKitUIModule);
{$ENDIF IOS}

end.
