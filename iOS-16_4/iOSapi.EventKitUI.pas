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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
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
  EKDayOccurrenceView = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  EKCalendarChooserSelectionStyle = NSInteger;
  EKCalendarChooserDisplayStyle = NSInteger;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  EKEntityType = NSUInteger;
  EKEventEditViewAction = NSInteger;
  EKEventViewAction = NSInteger;
  UIUserInterfaceSizeClass = NSInteger;
  // ===== Interface declarations =====

  EKCalendarChooserClass = interface(UIViewControllerClass)
    ['{8BB61E32-2674-483F-B2B8-A953E7163D41}']
  end;

  EKCalendarChooser = interface(UIViewController)
    ['{0E0C504B-0B03-48B3-992D-D2A78DD7183E}']
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
    ['{494578FB-18EB-4AC8-888A-3D60EE3A3F9B}']
  end;

  EKEventEditViewController = interface(UINavigationController)
    ['{C96234D3-D0C1-42AE-816C-A3CBE5AA2698}']
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
    ['{4DDEB409-CFC4-4063-B73D-0023925A6DC0}']
  end;

  EKEventViewController = interface(UIViewController)
    ['{86CF98FC-DE2C-49A9-BDE2-C0DA09F63309}']
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

  EKDayOccurrenceView = interface(IObjectiveC)
    ['{3F605498-7B70-4481-9D9C-DA76A5EB489D}']
    function ek_defaultOccurrenceSecondaryTextFont: UIFont; cdecl;
    function ek_defaultOccurrencePrimaryTextFontForSizeClass
      (sizeClass: UIUserInterfaceSizeClass): UIFont; cdecl;
    function ek_defaultOccurrenceSmallPrimaryTextFontForSizeClass
      (sizeClass: UIUserInterfaceSizeClass): UIFont; cdecl;
  end;

  // ===== Protocol declarations =====

  EKCalendarChooserDelegate = interface(IObjectiveC)
    ['{1A1B6DB7-B039-4019-B8FC-3D3B03DF106E}']
    procedure calendarChooserSelectionDidChange(calendarChooser
      : EKCalendarChooser); cdecl;
    procedure calendarChooserDidFinish(calendarChooser
      : EKCalendarChooser); cdecl;
    procedure calendarChooserDidCancel(calendarChooser
      : EKCalendarChooser); cdecl;
  end;

  EKEventEditViewDelegate = interface(IObjectiveC)
    ['{E1EB6CB9-A8FC-44BC-B235-6D519CA8B049}']
    procedure eventEditViewController(controller: EKEventEditViewController;
      didCompleteWithAction: EKEventEditViewAction); cdecl;
    function eventEditViewControllerDefaultCalendarForNewEvents
      (controller: EKEventEditViewController): EKCalendar; cdecl;
  end;

  EKEventViewDelegate = interface(IObjectiveC)
    ['{1AC3C8C4-6F44-4658-A526-1BF830B3723E}']
    procedure eventViewController(controller: EKEventViewController;
      didCompleteWithAction: EKEventViewAction); cdecl;
  end;

  // ===== External functions =====

const
  libEventKitUI = '/System/Library/Frameworks/EventKitUI.framework/EventKitUI';
function EventKitUIBundle: Pointer { NSBundle }; cdecl;
  external libEventKitUI name _PU + 'EventKitUIBundle';

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
