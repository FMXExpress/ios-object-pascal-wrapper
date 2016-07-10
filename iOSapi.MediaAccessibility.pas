{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework MediaAccessibility
//

unit iOSapi.MediaAccessibility;

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
  iOSapi.CoreGraphics,
  iOSapi.CoreText,
  iOSapi.Foundation;

const
  kMACaptionAppearanceDomainDefault = 0;
  kMACaptionAppearanceDomainUser = 1;
  kMACaptionAppearanceDisplayTypeForcedOnly = 0;
  kMACaptionAppearanceDisplayTypeAutomatic = 1;
  kMACaptionAppearanceDisplayTypeAlwaysOn = 2;
  kMACaptionAppearanceBehaviorUseValue = 0;
  kMACaptionAppearanceBehaviorUseContentIfAvailable = 1;
  kMACaptionAppearanceFontStyleDefault = 0;
  kMACaptionAppearanceFontStyleMonospacedWithSerif = 1;
  kMACaptionAppearanceFontStyleProportionalWithSerif = 2;
  kMACaptionAppearanceFontStyleMonospacedWithoutSerif = 3;
  kMACaptionAppearanceFontStyleProportionalWithoutSerif = 4;
  kMACaptionAppearanceFontStyleCasual = 5;
  kMACaptionAppearanceFontStyleCursive = 6;
  kMACaptionAppearanceFontStyleSmallCapital = 7;
  kMACaptionAppearanceTextEdgeStyleUndefined = 0;
  kMACaptionAppearanceTextEdgeStyleNone = 1;
  kMACaptionAppearanceTextEdgeStyleRaised = 2;
  kMACaptionAppearanceTextEdgeStyleDepressed = 3;
  kMACaptionAppearanceTextEdgeStyleUniform = 4;
  kMACaptionAppearanceTextEdgeStyleDropShadow = 5;

type
  // ===== Framework typedefs =====
{$M+}
  CFStringRef = Pointer;
  CFArrayRef = Pointer;
  CFIndex = LongInt;
  MACaptionAppearanceDomain = CFIndex;
  MACaptionAppearanceDisplayType = CFIndex;
  MACaptionAppearanceBehavior = CFIndex;
  MACaptionAppearanceFontStyle = CFIndex;
  MACaptionAppearanceTextEdgeStyle = CFIndex;
  CGColorRef = Pointer;
  CGFloat = Single;
  CTFontDescriptorRef = Pointer;
  // ===== Exported string consts =====

function kMAAudibleMediaSettingsChangedNotification: Pointer;
function MAMediaCharacteristicDescribesVideoForAccessibility: Pointer;
function kMACaptionAppearanceSettingsChangedNotification: Pointer;
function MAMediaCharacteristicDescribesMusicAndSoundForAccessibility: Pointer;
function MAMediaCharacteristicTranscribesSpokenDialogForAccessibility: Pointer;


// ===== External functions =====

const
  libMediaAccessibility =
    '/System/Library/Frameworks/MediaAccessibility.framework/MediaAccessibility';
function MAAudibleMediaCopyPreferredCharacteristics: CFArrayRef; cdecl;
  external libMediaAccessibility name _PU +
  'MAAudibleMediaCopyPreferredCharacteristics';
function MACaptionAppearanceAddSelectedLanguage
  (domain: MACaptionAppearanceDomain; language: CFStringRef): Integer; cdecl;
  external libMediaAccessibility name _PU +
  'MACaptionAppearanceAddSelectedLanguage';
function MACaptionAppearanceCopySelectedLanguages
  (domain: MACaptionAppearanceDomain): CFArrayRef; cdecl;
  external libMediaAccessibility name _PU +
  'MACaptionAppearanceCopySelectedLanguages';
function MACaptionAppearanceGetDisplayType(domain: MACaptionAppearanceDomain)
  : MACaptionAppearanceDisplayType; cdecl;
  external libMediaAccessibility name _PU + 'MACaptionAppearanceGetDisplayType';
procedure MACaptionAppearanceSetDisplayType(domain: MACaptionAppearanceDomain;
  displayType: MACaptionAppearanceDisplayType); cdecl;
  external libMediaAccessibility name _PU + 'MACaptionAppearanceSetDisplayType';
function MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics
  (domain: MACaptionAppearanceDomain): CFArrayRef; cdecl;
  external libMediaAccessibility name _PU +
  'MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics';
function MACaptionAppearanceCopyForegroundColor
  (domain: MACaptionAppearanceDomain; behavior: CFIndex): CGColorRef; cdecl;
  external libMediaAccessibility name _PU +
  'MACaptionAppearanceCopyForegroundColor';
function MACaptionAppearanceCopyBackgroundColor
  (domain: MACaptionAppearanceDomain; behavior: CFIndex): CGColorRef; cdecl;
  external libMediaAccessibility name _PU +
  'MACaptionAppearanceCopyBackgroundColor';
function MACaptionAppearanceCopyWindowColor(domain: MACaptionAppearanceDomain;
  behavior: CFIndex): CGColorRef; cdecl;
  external libMediaAccessibility name _PU +
  'MACaptionAppearanceCopyWindowColor';
function MACaptionAppearanceGetForegroundOpacity
  (domain: MACaptionAppearanceDomain; behavior: CFIndex): CGFloat; cdecl;
  external libMediaAccessibility name _PU +
  'MACaptionAppearanceGetForegroundOpacity';
function MACaptionAppearanceGetBackgroundOpacity
  (domain: MACaptionAppearanceDomain; behavior: CFIndex): CGFloat; cdecl;
  external libMediaAccessibility name _PU +
  'MACaptionAppearanceGetBackgroundOpacity';
function MACaptionAppearanceGetWindowOpacity(domain: MACaptionAppearanceDomain;
  behavior: CFIndex): CGFloat; cdecl;
  external libMediaAccessibility name _PU +
  'MACaptionAppearanceGetWindowOpacity';
function MACaptionAppearanceGetWindowRoundedCornerRadius
  (domain: MACaptionAppearanceDomain; behavior: CFIndex): CGFloat; cdecl;
  external libMediaAccessibility name _PU +
  'MACaptionAppearanceGetWindowRoundedCornerRadius';
function MACaptionAppearanceCopyFontDescriptorForStyle
  (domain: MACaptionAppearanceDomain; behavior: CFIndex;
  fontStyle: MACaptionAppearanceFontStyle): CTFontDescriptorRef; cdecl;
  external libMediaAccessibility name _PU +
  'MACaptionAppearanceCopyFontDescriptorForStyle';
function MACaptionAppearanceGetRelativeCharacterSize
  (domain: MACaptionAppearanceDomain; behavior: CFIndex): CGFloat; cdecl;
  external libMediaAccessibility name _PU +
  'MACaptionAppearanceGetRelativeCharacterSize';
function MACaptionAppearanceGetTextEdgeStyle(domain: MACaptionAppearanceDomain;
  behavior: CFIndex): MACaptionAppearanceTextEdgeStyle; cdecl;
  external libMediaAccessibility name _PU +
  'MACaptionAppearanceGetTextEdgeStyle';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  MediaAccessibilityModule: THandle;

{$ENDIF IOS}

function kMAAudibleMediaSettingsChangedNotification: Pointer;
begin
  Result := CocoaPointerConst(libMediaAccessibility,
    'kMAAudibleMediaSettingsChangedNotification');
end;

function MAMediaCharacteristicDescribesVideoForAccessibility: Pointer;
begin
  Result := CocoaPointerConst(libMediaAccessibility,
    'MAMediaCharacteristicDescribesVideoForAccessibility');
end;

function kMACaptionAppearanceSettingsChangedNotification: Pointer;
begin
  Result := CocoaPointerConst(libMediaAccessibility,
    'kMACaptionAppearanceSettingsChangedNotification');
end;

function MAMediaCharacteristicDescribesMusicAndSoundForAccessibility: Pointer;
begin
  Result := CocoaPointerConst(libMediaAccessibility,
    'MAMediaCharacteristicDescribesMusicAndSoundForAccessibility');
end;

function MAMediaCharacteristicTranscribesSpokenDialogForAccessibility: Pointer;
begin
  Result := CocoaPointerConst(libMediaAccessibility,
    'MAMediaCharacteristicTranscribesSpokenDialogForAccessibility');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MediaAccessibilityModule := dlopen(MarshaledAString(libMediaAccessibility),
  RTLD_LAZY);

finalization

dlclose(MediaAccessibilityModule);
{$ENDIF IOS}

end.
