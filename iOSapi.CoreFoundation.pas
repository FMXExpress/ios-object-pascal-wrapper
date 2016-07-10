{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreFoundation
//

unit iOSapi.CoreFoundation;

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
  kCFCompareLessThan = -1;
  kCFCompareEqualTo = 0;
  kCFCompareGreaterThan = 1;
  kCFDataSearchBackwards = 1 shl 0;
  kCFDataSearchAnchored = 1 shl 1;
  kCFCharacterSetControl = 1;
  kCFCharacterSetWhitespace = 2;
  kCFCharacterSetWhitespaceAndNewline = 3;
  kCFCharacterSetDecimalDigit = 4;
  kCFCharacterSetLetter = 5;
  kCFCharacterSetLowercaseLetter = 6;
  kCFCharacterSetUppercaseLetter = 7;
  kCFCharacterSetNonBase = 8;
  kCFCharacterSetDecomposable = 9;
  kCFCharacterSetAlphaNumeric = 10;
  kCFCharacterSetPunctuation = 11;
  kCFCharacterSetCapitalizedLetter = 13;
  kCFCharacterSetSymbol = 14;
  kCFCharacterSetNewline = 15;
  kCFCharacterSetIllegal = 12;
  kCFLocaleLanguageDirectionUnknown = 0;
  kCFLocaleLanguageDirectionLeftToRight = 1;
  kCFLocaleLanguageDirectionRightToLeft = 2;
  kCFLocaleLanguageDirectionTopToBottom = 3;
  kCFLocaleLanguageDirectionBottomToTop = 4;
  kCFStringEncodingMacRoman = 0;
  kCFStringEncodingWindowsLatin1 = 1280;
  kCFStringEncodingISOLatin1 = 513;
  kCFStringEncodingNextStepLatin = 2817;
  kCFStringEncodingASCII = 1536;
  kCFStringEncodingUnicode = 256;
  kCFStringEncodingUTF8 = 134217984;
  kCFStringEncodingNonLossyASCII = 3071;
  kCFStringEncodingUTF16 = 256;
  kCFStringEncodingUTF16BE = 268435712;
  kCFStringEncodingUTF16LE = 335544576;
  kCFStringEncodingUTF32 = 201326848;
  kCFStringEncodingUTF32BE = 402653440;
  kCFStringEncodingUTF32LE = 469762304;
  kCFCompareCaseInsensitive = 1;
  kCFCompareBackwards = 4;
  kCFCompareAnchored = 8;
  kCFCompareNonliteral = 16;
  kCFCompareLocalized = 32;
  kCFCompareNumerically = 64;
  kCFCompareDiacriticInsensitive = 128;
  kCFCompareWidthInsensitive = 256;
  kCFCompareForcedOrdering = 512;
  kCFStringNormalizationFormD = 0;
  kCFStringNormalizationFormKD = 1;
  kCFStringNormalizationFormC = 2;
  kCFStringNormalizationFormKC = 3;
  kCFURLPOSIXPathStyle = 0;
  kCFURLHFSPathStyle = 1;
  kCFURLWindowsPathStyle = 2;
  kCFURLComponentScheme = 1;
  kCFURLComponentNetLocation = 2;
  kCFURLComponentPath = 3;
  kCFURLComponentResourceSpecifier = 4;
  kCFURLComponentUser = 5;
  kCFURLComponentPassword = 6;
  kCFURLComponentUserInfo = 7;
  kCFURLComponentHost = 8;
  kCFURLComponentPort = 9;
  kCFURLComponentParameterString = 10;
  kCFURLComponentQuery = 11;
  kCFURLComponentFragment = 12;
  kCFURLBookmarkCreationMinimalBookmarkMask = (1 shl 9);
  kCFURLBookmarkCreationSuitableForBookmarkFile = (1 shl 10);
  kCFURLBookmarkCreationWithSecurityScope = (1 shl 11);
  kCFURLBookmarkCreationSecurityScopeAllowOnlyReadAccess = (1 shl 12);
  kCFURLBookmarkCreationPreferFileIDResolutionMask = (1 shl 8);
  kCFURLBookmarkResolutionWithoutUIMask = (1 shl 8);
  kCFURLBookmarkResolutionWithoutMountingMask = (1 shl 9);
  kCFURLBookmarkResolutionWithSecurityScope = (1 shl 10);
  kCFBookmarkResolutionWithoutUIMask = kCFURLBookmarkResolutionWithoutUIMask;
  kCFBookmarkResolutionWithoutMountingMask =
    kCFURLBookmarkResolutionWithoutMountingMask;
  kCFBundleExecutableArchitectureI386 = 7;
  kCFBundleExecutableArchitecturePPC = 18;
  kCFBundleExecutableArchitectureX86_64 = 16777223;
  kCFBundleExecutableArchitecturePPC64 = 16777234;
  CFByteOrderUnknown = 0;
  CFByteOrderLittleEndian = 1;
  CFByteOrderBigEndian = 2;
  kCFGregorianUnitsYears = (1 shl 0);
  kCFGregorianUnitsMonths = (1 shl 1);
  kCFGregorianUnitsDays = (1 shl 2);
  kCFGregorianUnitsHours = (1 shl 3);
  kCFGregorianUnitsMinutes = (1 shl 4);
  kCFGregorianUnitsSeconds = (1 shl 5);
  kCFGregorianAllUnits = 16777215;
  kCFTimeZoneNameStyleStandard = 0;
  kCFTimeZoneNameStyleShortStandard = 1;
  kCFTimeZoneNameStyleDaylightSaving = 2;
  kCFTimeZoneNameStyleShortDaylightSaving = 3;
  kCFTimeZoneNameStyleGeneric = 4;
  kCFTimeZoneNameStyleShortGeneric = 5;
  kCFCalendarUnitEra = (1 shl 1);
  kCFCalendarUnitYear = (1 shl 2);
  kCFCalendarUnitMonth = (1 shl 3);
  kCFCalendarUnitDay = (1 shl 4);
  kCFCalendarUnitHour = (1 shl 5);
  kCFCalendarUnitMinute = (1 shl 6);
  kCFCalendarUnitSecond = (1 shl 7);
  kCFCalendarUnitWeek = (1 shl 8);
  kCFCalendarUnitWeekday = (1 shl 9);
  kCFCalendarUnitWeekdayOrdinal = (1 shl 10);
  kCFCalendarUnitQuarter = (1 shl 11);
  kCFCalendarUnitWeekOfMonth = (1 shl 12);
  kCFCalendarUnitWeekOfYear = (1 shl 13);
  kCFCalendarUnitYearForWeekOfYear = (1 shl 14);
  kCFCalendarComponentsWrap = (1 shl 0);
  kCFDateFormatterNoStyle = 0;
  kCFDateFormatterShortStyle = 1;
  kCFDateFormatterMediumStyle = 2;
  kCFDateFormatterLongStyle = 3;
  kCFDateFormatterFullStyle = 4;
  kCFRunLoopRunFinished = 1;
  kCFRunLoopRunStopped = 2;
  kCFRunLoopRunTimedOut = 3;
  kCFRunLoopRunHandledSource = 4;
  kCFRunLoopEntry = (1 shl 0);
  kCFRunLoopBeforeTimers = (1 shl 1);
  kCFRunLoopBeforeSources = (1 shl 2);
  kCFRunLoopBeforeWaiting = (1 shl 5);
  kCFRunLoopAfterWaiting = (1 shl 6);
  kCFRunLoopExit = (1 shl 7);
  kCFRunLoopAllActivities = 268435455;
  kCFFileDescriptorReadCallBack = 1 shl 0;
  kCFFileDescriptorWriteCallBack = 1 shl 1;
  kCFFileSecurityClearOwner = 1 shl 0;
  kCFFileSecurityClearGroup = 1 shl 1;
  kCFFileSecurityClearMode = 1 shl 2;
  kCFFileSecurityClearOwnerUUID = 1 shl 3;
  kCFFileSecurityClearGroupUUID = 1 shl 4;
  kCFFileSecurityClearAccessControlList = 1 shl 5;
  kCFMessagePortSuccess = 0;
  kCFMessagePortSendTimeout = -1;
  kCFMessagePortReceiveTimeout = -2;
  kCFMessagePortIsInvalid = -3;
  kCFMessagePortTransportError = -4;
  kCFMessagePortBecameInvalidError = -5;
  CFNotificationSuspensionBehaviorDrop = 1;
  CFNotificationSuspensionBehaviorCoalesce = 2;
  CFNotificationSuspensionBehaviorHold = 3;
  CFNotificationSuspensionBehaviorDeliverImmediately = 4;
  kCFNotificationDeliverImmediately = (1 shl 0);
  kCFNotificationPostToAllSessions = (1 shl 1);
  kCFNumberSInt8Type = 1;
  kCFNumberSInt16Type = 2;
  kCFNumberSInt32Type = 3;
  kCFNumberSInt64Type = 4;
  kCFNumberFloat32Type = 5;
  kCFNumberFloat64Type = 6;
  kCFNumberCharType = 7;
  kCFNumberShortType = 8;
  kCFNumberIntType = 9;
  kCFNumberLongType = 10;
  kCFNumberLongLongType = 11;
  kCFNumberFloatType = 12;
  kCFNumberDoubleType = 13;
  kCFNumberCFIndexType = 14;
  kCFNumberNSIntegerType = 15;
  kCFNumberCGFloatType = 16;
  kCFNumberMaxType = 16;
  kCFNumberFormatterNoStyle = 0;
  kCFNumberFormatterDecimalStyle = 1;
  kCFNumberFormatterCurrencyStyle = 2;
  kCFNumberFormatterPercentStyle = 3;
  kCFNumberFormatterScientificStyle = 4;
  kCFNumberFormatterSpellOutStyle = 5;
  kCFNumberFormatterOrdinalStyle = 6;
  kCFNumberFormatterCurrencyISOCodeStyle = 8;
  kCFNumberFormatterCurrencyPluralStyle = 9;
  kCFNumberFormatterCurrencyAccountingStyle = 10;
  kCFNumberFormatterParseIntegersOnly = 1;
  kCFNumberFormatterRoundCeiling = 0;
  kCFNumberFormatterRoundFloor = 1;
  kCFNumberFormatterRoundDown = 2;
  kCFNumberFormatterRoundUp = 3;
  kCFNumberFormatterRoundHalfEven = 4;
  kCFNumberFormatterRoundHalfDown = 5;
  kCFNumberFormatterRoundHalfUp = 6;
  kCFNumberFormatterPadBeforePrefix = 0;
  kCFNumberFormatterPadAfterPrefix = 1;
  kCFNumberFormatterPadBeforeSuffix = 2;
  kCFNumberFormatterPadAfterSuffix = 3;
  kCFSocketSuccess = 0;
  kCFSocketError = -1;
  kCFSocketTimeout = -2;
  kCFSocketNoCallBack = 0;
  kCFSocketReadCallBack = 1;
  kCFSocketAcceptCallBack = 2;
  kCFSocketDataCallBack = 3;
  kCFSocketConnectCallBack = 4;
  kCFSocketWriteCallBack = 8;
  kCFSocketAutomaticallyReenableReadCallBack = 1;
  kCFSocketAutomaticallyReenableAcceptCallBack = 2;
  kCFSocketAutomaticallyReenableDataCallBack = 3;
  kCFSocketAutomaticallyReenableWriteCallBack = 8;
  kCFSocketLeaveErrors = 64;
  kCFSocketCloseOnInvalidate = 128;
  kCFStreamStatusNotOpen = 0;
  kCFStreamStatusOpening = 1;
  kCFStreamStatusOpen = 2;
  kCFStreamStatusReading = 3;
  kCFStreamStatusWriting = 4;
  kCFStreamStatusAtEnd = 5;
  kCFStreamStatusClosed = 6;
  kCFStreamStatusError = 7;
  kCFStreamEventNone = 0;
  kCFStreamEventOpenCompleted = 1;
  kCFStreamEventHasBytesAvailable = 2;
  kCFStreamEventCanAcceptBytes = 4;
  kCFStreamEventErrorOccurred = 8;
  kCFStreamEventEndEncountered = 16;
  kCFStreamErrorDomainCustom = -1;
  kCFStreamErrorDomainPOSIX = 1;
  kCFStreamErrorDomainMacOSStatus = 2;
  kCFPropertyListImmutable = 0;
  kCFPropertyListMutableContainers = 1;
  kCFPropertyListMutableContainersAndLeaves = 2;
  kCFPropertyListOpenStepFormat = 1;
  kCFPropertyListXMLFormat_v1_0 = 100;
  kCFPropertyListBinaryFormat_v1_0 = 200;
  kCFPropertyListReadCorruptError = 3840;
  kCFPropertyListReadUnknownVersionError = 3841;
  kCFPropertyListReadStreamError = 3842;
  kCFPropertyListWriteStreamError = 3851;
  kCFStringEncodingMacJapanese = 1;
  kCFStringEncodingMacChineseTrad = 2;
  kCFStringEncodingMacKorean = 3;
  kCFStringEncodingMacArabic = 4;
  kCFStringEncodingMacHebrew = 5;
  kCFStringEncodingMacGreek = 6;
  kCFStringEncodingMacCyrillic = 7;
  kCFStringEncodingMacDevanagari = 9;
  kCFStringEncodingMacGurmukhi = 10;
  kCFStringEncodingMacGujarati = 11;
  kCFStringEncodingMacOriya = 12;
  kCFStringEncodingMacBengali = 13;
  kCFStringEncodingMacTamil = 14;
  kCFStringEncodingMacTelugu = 15;
  kCFStringEncodingMacKannada = 16;
  kCFStringEncodingMacMalayalam = 17;
  kCFStringEncodingMacSinhalese = 18;
  kCFStringEncodingMacBurmese = 19;
  kCFStringEncodingMacKhmer = 20;
  kCFStringEncodingMacThai = 21;
  kCFStringEncodingMacLaotian = 22;
  kCFStringEncodingMacGeorgian = 23;
  kCFStringEncodingMacArmenian = 24;
  kCFStringEncodingMacChineseSimp = 25;
  kCFStringEncodingMacTibetan = 26;
  kCFStringEncodingMacMongolian = 27;
  kCFStringEncodingMacEthiopic = 28;
  kCFStringEncodingMacCentralEurRoman = 29;
  kCFStringEncodingMacVietnamese = 30;
  kCFStringEncodingMacExtArabic = 31;
  kCFStringEncodingMacSymbol = 33;
  kCFStringEncodingMacDingbats = 34;
  kCFStringEncodingMacTurkish = 35;
  kCFStringEncodingMacCroatian = 36;
  kCFStringEncodingMacIcelandic = 37;
  kCFStringEncodingMacRomanian = 38;
  kCFStringEncodingMacCeltic = 39;
  kCFStringEncodingMacGaelic = 40;
  kCFStringEncodingMacFarsi = 140;
  kCFStringEncodingMacUkrainian = 152;
  kCFStringEncodingMacInuit = 236;
  kCFStringEncodingMacVT100 = 252;
  kCFStringEncodingMacHFS = 255;
  kCFStringEncodingISOLatin2 = 514;
  kCFStringEncodingISOLatin3 = 515;
  kCFStringEncodingISOLatin4 = 516;
  kCFStringEncodingISOLatinCyrillic = 517;
  kCFStringEncodingISOLatinArabic = 518;
  kCFStringEncodingISOLatinGreek = 519;
  kCFStringEncodingISOLatinHebrew = 520;
  kCFStringEncodingISOLatin5 = 521;
  kCFStringEncodingISOLatin6 = 522;
  kCFStringEncodingISOLatinThai = 523;
  kCFStringEncodingISOLatin7 = 525;
  kCFStringEncodingISOLatin8 = 526;
  kCFStringEncodingISOLatin9 = 527;
  kCFStringEncodingISOLatin10 = 528;
  kCFStringEncodingDOSLatinUS = 1024;
  kCFStringEncodingDOSGreek = 1029;
  kCFStringEncodingDOSBalticRim = 1030;
  kCFStringEncodingDOSLatin1 = 1040;
  kCFStringEncodingDOSGreek1 = 1041;
  kCFStringEncodingDOSLatin2 = 1042;
  kCFStringEncodingDOSCyrillic = 1043;
  kCFStringEncodingDOSTurkish = 1044;
  kCFStringEncodingDOSPortuguese = 1045;
  kCFStringEncodingDOSIcelandic = 1046;
  kCFStringEncodingDOSHebrew = 1047;
  kCFStringEncodingDOSCanadianFrench = 1048;
  kCFStringEncodingDOSArabic = 1049;
  kCFStringEncodingDOSNordic = 1050;
  kCFStringEncodingDOSRussian = 1051;
  kCFStringEncodingDOSGreek2 = 1052;
  kCFStringEncodingDOSThai = 1053;
  kCFStringEncodingDOSJapanese = 1056;
  kCFStringEncodingDOSChineseSimplif = 1057;
  kCFStringEncodingDOSKorean = 1058;
  kCFStringEncodingDOSChineseTrad = 1059;
  kCFStringEncodingWindowsLatin2 = 1281;
  kCFStringEncodingWindowsCyrillic = 1282;
  kCFStringEncodingWindowsGreek = 1283;
  kCFStringEncodingWindowsLatin5 = 1284;
  kCFStringEncodingWindowsHebrew = 1285;
  kCFStringEncodingWindowsArabic = 1286;
  kCFStringEncodingWindowsBalticRim = 1287;
  kCFStringEncodingWindowsVietnamese = 1288;
  kCFStringEncodingWindowsKoreanJohab = 1296;
  kCFStringEncodingANSEL = 1537;
  kCFStringEncodingJIS_X0201_76 = 1568;
  kCFStringEncodingJIS_X0208_83 = 1569;
  kCFStringEncodingJIS_X0208_90 = 1570;
  kCFStringEncodingJIS_X0212_90 = 1571;
  kCFStringEncodingJIS_C6226_78 = 1572;
  kCFStringEncodingShiftJIS_X0213 = 1576;
  kCFStringEncodingShiftJIS_X0213_MenKuTen = 1577;
  kCFStringEncodingGB_2312_80 = 1584;
  kCFStringEncodingGBK_95 = 1585;
  kCFStringEncodingGB_18030_2000 = 1586;
  kCFStringEncodingKSC_5601_87 = 1600;
  kCFStringEncodingKSC_5601_92_Johab = 1601;
  kCFStringEncodingCNS_11643_92_P1 = 1617;
  kCFStringEncodingCNS_11643_92_P2 = 1618;
  kCFStringEncodingCNS_11643_92_P3 = 1619;
  kCFStringEncodingISO_2022_JP = 2080;
  kCFStringEncodingISO_2022_JP_2 = 2081;
  kCFStringEncodingISO_2022_JP_1 = 2082;
  kCFStringEncodingISO_2022_JP_3 = 2083;
  kCFStringEncodingISO_2022_CN = 2096;
  kCFStringEncodingISO_2022_CN_EXT = 2097;
  kCFStringEncodingISO_2022_KR = 2112;
  kCFStringEncodingEUC_JP = 2336;
  kCFStringEncodingEUC_CN = 2352;
  kCFStringEncodingEUC_TW = 2353;
  kCFStringEncodingEUC_KR = 2368;
  kCFStringEncodingShiftJIS = 2561;
  kCFStringEncodingKOI8_R = 2562;
  kCFStringEncodingBig5 = 2563;
  kCFStringEncodingMacRomanLatin1 = 2564;
  kCFStringEncodingHZ_GB_2312 = 2565;
  kCFStringEncodingBig5_HKSCS_1999 = 2566;
  kCFStringEncodingVISCII = 2567;
  kCFStringEncodingKOI8_U = 2568;
  kCFStringEncodingBig5_E = 2569;
  kCFStringEncodingNextStepJapanese = 2818;
  kCFStringEncodingEBCDIC_US = 3073;
  kCFStringEncodingEBCDIC_CP037 = 3074;
  kCFStringEncodingUTF7 = 67109120;
  kCFStringEncodingUTF7_IMAP = 2576;
  kCFStringEncodingShiftJIS_X0213_00 = 1576;
  kCFStringTokenizerUnitWord = 0;
  kCFStringTokenizerUnitSentence = 1;
  kCFStringTokenizerUnitParagraph = 2;
  kCFStringTokenizerUnitLineBreak = 3;
  kCFStringTokenizerUnitWordBoundary = 4;
  kCFStringTokenizerAttributeLatinTranscription = 1 shl 16;
  kCFStringTokenizerAttributeLanguage = 1 shl 17;
  kCFStringTokenizerTokenNone = 0;
  kCFStringTokenizerTokenNormal = 1 shl 0;
  kCFStringTokenizerTokenHasSubTokensMask = 1 shl 1;
  kCFStringTokenizerTokenHasDerivedSubTokensMask = 1 shl 2;
  kCFStringTokenizerTokenHasHasNumbersMask = 1 shl 3;
  kCFStringTokenizerTokenHasNonLettersMask = 1 shl 4;
  kCFStringTokenizerTokenIsCJWordMask = 1 shl 5;
  kCFURLUnknownError = -10;
  kCFURLUnknownSchemeError = -11;
  kCFURLResourceNotFoundError = -12;
  kCFURLResourceAccessViolationError = -13;
  kCFURLRemoteHostUnavailableError = -14;
  kCFURLImproperArgumentsError = -15;
  kCFURLUnknownPropertyKeyError = -16;
  kCFURLPropertyKeyUnavailableError = -17;
  kCFURLTimeoutError = -18;
  kCFURLEnumeratorDefaultBehavior = 0;
  kCFURLEnumeratorDescendRecursively = 1 shl 0;
  kCFURLEnumeratorSkipInvisibles = 1 shl 1;
  kCFURLEnumeratorGenerateFileReferenceURLs = 1 shl 2;
  kCFURLEnumeratorSkipPackageContents = 1 shl 3;
  kCFURLEnumeratorIncludeDirectoriesPreOrder = 1 shl 4;
  kCFURLEnumeratorIncludeDirectoriesPostOrder = 1 shl 5;
  kCFURLEnumeratorSuccess = 1;
  kCFURLEnumeratorEnd = 2;
  kCFURLEnumeratorError = 3;
  kCFURLEnumeratorDirectoryPostOrderSuccess = 4;

type
  // ===== Framework typedefs =====
{$M+}
  CFTypeID = LongWord;
  PCFTypeID = ^CFTypeID;

  CFOptionFlags = LongWord;
  PCFOptionFlags = ^CFOptionFlags;

  CFHashCode = LongWord;
  PCFHashCode = ^CFHashCode;

  CFIndex = LongInt;
  PCFIndex = ^CFIndex;

  CFTypeRef = Pointer;
  CFStringRef = Pointer;
  CFMutableStringRef = Pointer;
  CFPropertyListRef = CFTypeRef;
  CFComparisonResult = CFIndex;
  CFComparatorFunction = function(param1: Pointer; param2: Pointer;
    param3: Pointer): CFComparisonResult; cdecl;

  CFRange = record
    location: CFIndex;
    length: CFIndex;
  end;

  PCFRange = ^CFRange;

  CFNullRef = Pointer;
  CFAllocatorRef = Pointer;
  CFAllocatorRetainCallBack = function(param1: Pointer): Pointer; cdecl;
  CFAllocatorReleaseCallBack = procedure(param1: Pointer); cdecl;
  CFAllocatorCopyDescriptionCallBack = function(param1: Pointer)
    : CFStringRef; cdecl;
  CFAllocatorAllocateCallBack = function(param1: CFIndex; param2: CFOptionFlags;
    param3: Pointer): Pointer; cdecl;
  CFAllocatorReallocateCallBack = function(param1: Pointer; param2: CFIndex;
    param3: CFOptionFlags; param4: Pointer): Pointer; cdecl;
  CFAllocatorDeallocateCallBack = procedure(param1: Pointer;
    param2: Pointer); cdecl;
  CFAllocatorPreferredSizeCallBack = function(param1: CFIndex;
    param2: CFOptionFlags; param3: Pointer): CFIndex; cdecl;

  CFAllocatorContext = record
    version: CFIndex;
    info: Pointer;
    retain: CFAllocatorRetainCallBack;
    release: CFAllocatorReleaseCallBack;
    copyDescription: CFAllocatorCopyDescriptionCallBack;
    allocate: CFAllocatorAllocateCallBack;
    reallocate: CFAllocatorReallocateCallBack;
    deallocate: CFAllocatorDeallocateCallBack;
    preferredSize: CFAllocatorPreferredSizeCallBack;
  end;

  PCFAllocatorContext = ^CFAllocatorContext;

  Boolean = Byte;
  CFArrayRetainCallBack = function(param1: CFAllocatorRef; param2: Pointer)
    : Pointer; cdecl;
  CFArrayReleaseCallBack = procedure(param1: CFAllocatorRef;
    param2: Pointer); cdecl;
  CFArrayCopyDescriptionCallBack = function(param1: Pointer)
    : CFStringRef; cdecl;
  CFArrayEqualCallBack = function(param1: Pointer; param2: Pointer)
    : Boolean; cdecl;

  CFArrayCallBacks = record
    version: CFIndex;
    retain: CFArrayRetainCallBack;
    release: CFArrayReleaseCallBack;
    copyDescription: CFArrayCopyDescriptionCallBack;
    equal: CFArrayEqualCallBack;
  end;

  PCFArrayCallBacks = ^CFArrayCallBacks;

  CFArrayApplierFunction = procedure(param1: Pointer; param2: Pointer); cdecl;
  CFArrayRef = Pointer;
  CFMutableArrayRef = Pointer;
  CFDataRef = Pointer;
  CFMutableDataRef = Pointer;
  CFDataSearchFlags = CFOptionFlags;
  CFDictionaryRetainCallBack = function(param1: CFAllocatorRef; param2: Pointer)
    : Pointer; cdecl;
  CFDictionaryReleaseCallBack = procedure(param1: CFAllocatorRef;
    param2: Pointer); cdecl;
  CFDictionaryCopyDescriptionCallBack = function(param1: Pointer)
    : CFStringRef; cdecl;
  CFDictionaryEqualCallBack = function(param1: Pointer; param2: Pointer)
    : Boolean; cdecl;
  CFDictionaryHashCallBack = function(param1: Pointer): CFHashCode; cdecl;

  CFDictionaryKeyCallBacks = record
    version: CFIndex;
    retain: CFDictionaryRetainCallBack;
    release: CFDictionaryReleaseCallBack;
    copyDescription: CFDictionaryCopyDescriptionCallBack;
    equal: CFDictionaryEqualCallBack;
    hash: CFDictionaryHashCallBack;
  end;

  PCFDictionaryKeyCallBacks = ^CFDictionaryKeyCallBacks;

  CFDictionaryValueCallBacks = record
    version: CFIndex;
    retain: CFDictionaryRetainCallBack;
    release: CFDictionaryReleaseCallBack;
    copyDescription: CFDictionaryCopyDescriptionCallBack;
    equal: CFDictionaryEqualCallBack;
  end;

  PCFDictionaryValueCallBacks = ^CFDictionaryValueCallBacks;

  CFDictionaryApplierFunction = procedure(param1: Pointer; param2: Pointer;
    param3: Pointer); cdecl;
  CFDictionaryRef = Pointer;
  CFMutableDictionaryRef = Pointer;
  CFCharacterSetRef = Pointer;
  CFMutableCharacterSetRef = Pointer;
  CFCharacterSetPredefinedSet = CFIndex;
  UniChar = UInt16;
  UTF32Char = UInt32;
  CFLocaleRef = Pointer;
  LangCode = Int16;
  RegionCode = Int16;
  CFLocaleLanguageDirection = CFIndex;
  CFStringEncoding = UInt32;
  CFStringBuiltInEncodings = CFStringEncoding;
  ConstStr255Param = PByte;
  __builtin_va_list = Pointer;
  StringPtr = PByte;
  ConstStringPtr = PByte;
  CFStringCompareFlags = CFOptionFlags;
  CFStringNormalizationForm = CFIndex;

  CFStringInlineBuffer = record
    buffer: array [0 .. 63] of UniChar;
    theString: CFStringRef;
    directUniCharBuffer: unsigned short *;
    directCStringBuffer: MarshaledAString;
    rangeToBuffer: CFRange;
    bufferedRangeStart: CFIndex;
    bufferedRangeEnd: CFIndex;
  end;

  PCFStringInlineBuffer = ^CFStringInlineBuffer;

  CFAttributedStringRef = Pointer;
  CFMutableAttributedStringRef = Pointer;
  CFBagRetainCallBack = function(param1: CFAllocatorRef; param2: Pointer)
    : Pointer; cdecl;
  CFBagReleaseCallBack = procedure(param1: CFAllocatorRef;
    param2: Pointer); cdecl;
  CFBagCopyDescriptionCallBack = function(param1: Pointer): CFStringRef; cdecl;
  CFBagEqualCallBack = function(param1: Pointer; param2: Pointer)
    : Boolean; cdecl;
  CFBagHashCallBack = function(param1: Pointer): CFHashCode; cdecl;

  CFBagCallBacks = record
    version: CFIndex;
    retain: CFBagRetainCallBack;
    release: CFBagReleaseCallBack;
    copyDescription: CFBagCopyDescriptionCallBack;
    equal: CFBagEqualCallBack;
    hash: CFBagHashCallBack;
  end;

  PCFBagCallBacks = ^CFBagCallBacks;

  CFBagApplierFunction = procedure(param1: Pointer; param2: Pointer); cdecl;
  CFBagRef = Pointer;
  CFMutableBagRef = Pointer;
  TCoreFoundationRetain = function(param1: Pointer): Pointer; cdecl;
  TCoreFoundationRelease = procedure(param1: Pointer); cdecl;
  TCoreFoundationCopyDescription = function(param1: Pointer)
    : CFStringRef; cdecl;

  CFBinaryHeapCompareContext = record
    version: CFIndex;
    info: Pointer;
    retain: TCoreFoundationRetain;
    release: TCoreFoundationRelease;
    copyDescription: TCoreFoundationCopyDescription;
  end;

  PCFBinaryHeapCompareContext = ^CFBinaryHeapCompareContext;

  TCoreFoundationRetain1 = function(param1: CFAllocatorRef; param2: Pointer)
    : Pointer; cdecl;
  TCoreFoundationRelease1 = procedure(param1: CFAllocatorRef;
    param2: Pointer); cdecl;
  TCoreFoundationCompare = function(param1: Pointer; param2: Pointer;
    param3: Pointer): CFComparisonResult; cdecl;

  CFBinaryHeapCallBacks = record
    version: CFIndex;
    retain: TCoreFoundationRetain1;
    release: TCoreFoundationRelease1;
    copyDescription: TCoreFoundationCopyDescription;
    compare: TCoreFoundationCompare;
  end;

  PCFBinaryHeapCallBacks = ^CFBinaryHeapCallBacks;

  CFBinaryHeapApplierFunction = procedure(param1: Pointer;
    param2: Pointer); cdecl;
  CFBinaryHeapRef = Pointer;
  CFBit = UInt32;
  CFBitVectorRef = Pointer;
  CFMutableBitVectorRef = Pointer;
  CFErrorRef = Pointer;
  CFURLPathStyle = CFIndex;
  CFURLRef = Pointer;
  CFURLComponentType = CFIndex;
  CFURLBookmarkCreationOptions = CFOptionFlags;
  CFURLBookmarkResolutionOptions = CFOptionFlags;
  CFURLBookmarkFileCreationOptions = CFOptionFlags;
  CFBundleRef = Pointer;
  CFPlugInRef = Pointer;
  CFBundleRefNum = Int16;
  CFByteOrder = CFIndex;

  CFSwappedFloat32 = record
    v: LongWord;
  end;

  PCFSwappedFloat32 = ^CFSwappedFloat32;

  CFSwappedFloat64 = record
    v: UInt64;
  end;

  PCFSwappedFloat64 = ^CFSwappedFloat64;

  CFTimeInterval = Double;
  PCFTimeInterval = ^CFTimeInterval;

  CFAbsoluteTime = CFTimeInterval;
  CFDateRef = Pointer;
  CFTimeZoneRef = Pointer;

  CFGregorianDate = record
    year: Int32;
    month: Int8;
    day: Int8;
    hour: Int8;
    minute: Int8;
    second: Double;
  end;

  PCFGregorianDate = ^CFGregorianDate;

  CFGregorianUnits = record
    years: Int32;
    months: Int32;
    days: Int32;
    hours: Int32;
    minutes: Int32;
    seconds: Double;
  end;

  PCFGregorianUnits = ^CFGregorianUnits;

  CFGregorianUnitFlags = CFOptionFlags;
  CFTimeZoneNameStyle = CFIndex;
  CFCalendarRef = Pointer;
  CFCalendarUnit = CFOptionFlags;
  CFDateFormatterRef = Pointer;
  CFDateFormatterStyle = CFIndex;
  CFRunLoopRef = Pointer;
  CFRunLoopSourceRef = Pointer;
  CFRunLoopObserverRef = Pointer;
  CFRunLoopTimerRef = Pointer;
  CFRunLoopRunResult = Int32;
  CFRunLoopActivity = CFOptionFlags;
  TCoreFoundationBlock = procedure() of object;
  TCoreFoundationEqual = function(param1: Pointer; param2: Pointer)
    : Boolean; cdecl;
  TCoreFoundationHash = function(param1: Pointer): CFHashCode; cdecl;
  TCoreFoundationSchedule = procedure(param1: Pointer; param2: CFRunLoopRef;
    param3: CFStringRef); cdecl;

  CFRunLoopSourceContext = record
    version: CFIndex;
    info: Pointer;
    retain: TCoreFoundationRetain;
    release: TCoreFoundationRelease;
    copyDescription: TCoreFoundationCopyDescription;
    equal: TCoreFoundationEqual;
    hash: TCoreFoundationHash;
    schedule: TCoreFoundationSchedule;
    cancel: TCoreFoundationSchedule;
    perform: TCoreFoundationRelease;
  end;

  PCFRunLoopSourceContext = ^CFRunLoopSourceContext;

  __darwin_natural_t = Cardinal;
  __darwin_mach_port_name_t = __darwin_natural_t;
  __darwin_mach_port_t = __darwin_mach_port_name_t;
  mach_port_t = __darwin_mach_port_t;
  TCoreFoundationGetPort = function(param1: Pointer): mach_port_t; cdecl;
  TCoreFoundationPerform = function(param1: Pointer; param2: CFIndex;
    param3: CFAllocatorRef; param4: Pointer): Pointer; cdecl;

  CFRunLoopSourceContext1 = record
    version: CFIndex;
    info: Pointer;
    retain: TCoreFoundationRetain;
    release: TCoreFoundationRelease;
    copyDescription: TCoreFoundationCopyDescription;
    equal: TCoreFoundationEqual;
    hash: TCoreFoundationHash;
    getPort: TCoreFoundationGetPort;
    perform: TCoreFoundationPerform;
  end;

  PCFRunLoopSourceContext1 = ^CFRunLoopSourceContext1;

  CFRunLoopObserverContext = record
    version: CFIndex;
    info: Pointer;
    retain: TCoreFoundationRetain;
    release: TCoreFoundationRelease;
    copyDescription: TCoreFoundationCopyDescription;
  end;

  PCFRunLoopObserverContext = ^CFRunLoopObserverContext;

  CFRunLoopObserverCallBack = procedure(param1: CFRunLoopObserverRef;
    param2: CFRunLoopActivity; param3: Pointer); cdecl;
  TCoreFoundationBlock1 = procedure(param1: CFRunLoopObserverRef;
    param2: CFRunLoopActivity) of object;

  CFRunLoopTimerContext = record
    version: CFIndex;
    info: Pointer;
    retain: TCoreFoundationRetain;
    release: TCoreFoundationRelease;
    copyDescription: TCoreFoundationCopyDescription;
  end;

  PCFRunLoopTimerContext = ^CFRunLoopTimerContext;

  CFRunLoopTimerCallBack = procedure(param1: CFRunLoopTimerRef;
    param2: Pointer); cdecl;
  TCoreFoundationBlock2 = procedure(param1: CFRunLoopTimerRef) of object;
  CFFileDescriptorNativeDescriptor = Integer;
  PCFFileDescriptorNativeDescriptor = ^CFFileDescriptorNativeDescriptor;

  CFFileDescriptorRef = Pointer;
  CFFileDescriptorCallBack = procedure(param1: CFFileDescriptorRef;
    param2: CFOptionFlags; param3: Pointer); cdecl;

  CFFileDescriptorContext = record
    version: CFIndex;
    info: Pointer;
    retain: TCoreFoundationRetain;
    release: TCoreFoundationRelease;
    copyDescription: TCoreFoundationCopyDescription;
  end;

  PCFFileDescriptorContext = ^CFFileDescriptorContext;

  CFUUIDRef = Pointer;

  CFUUIDBytes = record
    byte0: Byte;
    byte1: Byte;
    byte2: Byte;
    byte3: Byte;
    byte4: Byte;
    byte5: Byte;
    byte6: Byte;
    byte7: Byte;
    byte8: Byte;
    byte9: Byte;
    byte10: Byte;
    byte11: Byte;
    byte12: Byte;
    byte13: Byte;
    byte14: Byte;
    byte15: Byte;
  end;

  PCFUUIDBytes = ^CFUUIDBytes;

  CFFileSecurityRef = Pointer;
  __darwin_uid_t = LongWord;
  __darwin_gid_t = LongWord;
  __uint16_t = Word;
  __darwin_mode_t = __uint16_t;
  CFFileSecurityClearOptions = CFOptionFlags;
  CFMachPortRef = Pointer;

  CFMachPortContext = record
    version: CFIndex;
    info: Pointer;
    retain: TCoreFoundationRetain;
    release: TCoreFoundationRelease;
    copyDescription: TCoreFoundationCopyDescription;
  end;

  PCFMachPortContext = ^CFMachPortContext;

  CFMachPortCallBack = procedure(param1: CFMachPortRef; param2: Pointer;
    param3: CFIndex; param4: Pointer); cdecl;
  CFMachPortInvalidationCallBack = procedure(param1: CFMachPortRef;
    param2: Pointer); cdecl;
  CFMessagePortRef = Pointer;

  CFMessagePortContext = record
    version: CFIndex;
    info: Pointer;
    retain: TCoreFoundationRetain;
    release: TCoreFoundationRelease;
    copyDescription: TCoreFoundationCopyDescription;
  end;

  PCFMessagePortContext = ^CFMessagePortContext;

  CFMessagePortCallBack = function(param1: CFMessagePortRef; param2: Int32;
    param3: CFDataRef; param4: Pointer): CFDataRef; cdecl;
  CFMessagePortInvalidationCallBack = procedure(param1: CFMessagePortRef;
    param2: Pointer); cdecl;
  dispatch_queue_t = Pointer;
  CFNotificationCenterRef = Pointer;
  CFNotificationCallback = procedure(param1: CFNotificationCenterRef;
    param2: Pointer; param3: CFStringRef; param4: Pointer;
    param5: CFDictionaryRef); cdecl;
  CFNotificationSuspensionBehavior = CFIndex;
  CFBooleanRef = Pointer;
  CFNumberType = CFIndex;
  CFNumberRef = Pointer;
  CFNumberFormatterRef = Pointer;
  CFNumberFormatterStyle = CFIndex;
  CFNumberFormatterOptionFlags = CFOptionFlags;
  CFNumberFormatterRoundingMode = CFIndex;
  CFNumberFormatterPadPosition = CFIndex;
  CFPlugInDynamicRegisterFunction = procedure(param1: CFPlugInRef); cdecl;
  CFPlugInUnloadFunction = procedure(param1: CFPlugInRef); cdecl;
  CFPlugInFactoryFunction = function(param1: CFAllocatorRef; param2: CFUUIDRef)
    : Pointer; cdecl;
  CFPlugInInstanceRef = Pointer;
  CFPlugInInstanceGetInterfaceFunction = function(param1: CFPlugInInstanceRef;
    param2: CFStringRef; param3: Pointer): Boolean; cdecl;
  CFPlugInInstanceDeallocateInstanceDataFunction = procedure
    (param1: Pointer); cdecl;
  HRESULT = Int32;
  ULONG = UInt32;
  LPVOID = Pointer;

  REFIID = CFUUIDBytes;

  TCoreFoundationQueryInterface = function(param1: Pointer; param2: REFIID;
    param3: Pointer): HRESULT; cdecl;
  TCoreFoundationAddRef = function(param1: Pointer): ULONG; cdecl;

  IUnknownVTbl = record
    _reserved: Pointer;
    QueryInterface: TCoreFoundationQueryInterface;
    AddRef: TCoreFoundationAddRef;
    release: TCoreFoundationAddRef;
  end;

  PIUnknownVTbl = ^IUnknownVTbl;

  CFSocketRef = Pointer;
  CFSocketError = CFIndex;

  CFSocketSignature = record
    protocolFamily: Int32;
    socketType: Int32;
    protocol: Int32;
    address: CFDataRef;
  end;

  PCFSocketSignature = ^CFSocketSignature;

  CFSocketCallBackType = CFOptionFlags;
  CFSocketCallBack = procedure(param1: CFSocketRef;
    param2: CFSocketCallBackType; param3: CFDataRef; param4: Pointer;
    param5: Pointer); cdecl;

  CFSocketContext = record
    version: CFIndex;
    info: Pointer;
    retain: TCoreFoundationRetain;
    release: TCoreFoundationRelease;
    copyDescription: TCoreFoundationCopyDescription;
  end;

  PCFSocketContext = ^CFSocketContext;

  CFSocketNativeHandle = Integer;
  PCFSocketNativeHandle = ^CFSocketNativeHandle;

  CFStreamStatus = CFIndex;
  CFStreamEventType = CFOptionFlags;

  CFStreamClientContext = record
    version: CFIndex;
    info: Pointer;
    retain: TCoreFoundationRetain;
    release: TCoreFoundationRelease;
    copyDescription: TCoreFoundationCopyDescription;
  end;

  PCFStreamClientContext = ^CFStreamClientContext;

  CFReadStreamRef = Pointer;
  CFWriteStreamRef = Pointer;
  CFReadStreamClientCallBack = procedure(param1: CFReadStreamRef;
    param2: CFStreamEventType; param3: Pointer); cdecl;
  CFWriteStreamClientCallBack = procedure(param1: CFWriteStreamRef;
    param2: CFStreamEventType; param3: Pointer); cdecl;
  CFStreamErrorDomain = CFIndex;

  CFStreamError = record
    domain: CFIndex;
    error: Int32;
  end;

  PCFStreamError = ^CFStreamError;

  CFPropertyListMutabilityOptions = CFOptionFlags;
  CFPropertyListFormat = CFIndex;
  CFSetRetainCallBack = function(param1: CFAllocatorRef; param2: Pointer)
    : Pointer; cdecl;
  CFSetReleaseCallBack = procedure(param1: CFAllocatorRef;
    param2: Pointer); cdecl;
  CFSetCopyDescriptionCallBack = function(param1: Pointer): CFStringRef; cdecl;
  CFSetEqualCallBack = function(param1: Pointer; param2: Pointer)
    : Boolean; cdecl;
  CFSetHashCallBack = function(param1: Pointer): CFHashCode; cdecl;

  CFSetCallBacks = record
    version: CFIndex;
    retain: CFSetRetainCallBack;
    release: CFSetReleaseCallBack;
    copyDescription: CFSetCopyDescriptionCallBack;
    equal: CFSetEqualCallBack;
    hash: CFSetHashCallBack;
  end;

  PCFSetCallBacks = ^CFSetCallBacks;

  CFSetApplierFunction = procedure(param1: Pointer; param2: Pointer); cdecl;
  CFSetRef = Pointer;
  CFMutableSetRef = Pointer;
  CFStringEncodings = CFIndex;
  CFStringTokenizerRef = Pointer;
  CFStringTokenizerTokenType = CFOptionFlags;
  CFTreeRetainCallBack = function(param1: Pointer): Pointer; cdecl;
  CFTreeReleaseCallBack = procedure(param1: Pointer); cdecl;
  CFTreeCopyDescriptionCallBack = function(param1: Pointer): CFStringRef; cdecl;

  CFTreeContext = record
    version: CFIndex;
    info: Pointer;
    retain: CFTreeRetainCallBack;
    release: CFTreeReleaseCallBack;
    copyDescription: CFTreeCopyDescriptionCallBack;
  end;

  PCFTreeContext = ^CFTreeContext;

  CFTreeApplierFunction = procedure(param1: Pointer; param2: Pointer); cdecl;
  CFTreeRef = Pointer;
  CFURLError = CFIndex;
  CFURLEnumeratorRef = Pointer;
  CFURLEnumeratorOptions = CFOptionFlags;
  CFURLEnumeratorResult = CFIndex;
  // ===== Exported string consts =====

function kCFCoreFoundationVersionNumber: Pointer;
function kCFNull: Pointer;
function kCFAllocatorDefault: Pointer;
function kCFAllocatorSystemDefault: Pointer;
function kCFAllocatorMalloc: Pointer;
function kCFAllocatorMallocZone: Pointer;
function kCFAllocatorNull: Pointer;
function kCFAllocatorUseContext: Pointer;
function kCFTypeArrayCallBacks: Pointer;
function kCFTypeDictionaryKeyCallBacks: Pointer;
function kCFCopyStringDictionaryKeyCallBacks: Pointer;
function kCFTypeDictionaryValueCallBacks: Pointer;
function kCFLocaleCurrentLocaleDidChangeNotification: Pointer;
function kCFLocaleIdentifier: Pointer;
function kCFLocaleLanguageCode: Pointer;
function kCFLocaleCountryCode: Pointer;
function kCFLocaleScriptCode: Pointer;
function kCFLocaleVariantCode: Pointer;
function kCFLocaleExemplarCharacterSet: Pointer;
function kCFLocaleCalendarIdentifier: Pointer;
function kCFLocaleCalendar: Pointer;
function kCFLocaleCollationIdentifier: Pointer;
function kCFLocaleUsesMetricSystem: Pointer;
function kCFLocaleMeasurementSystem: Pointer;
function kCFLocaleDecimalSeparator: Pointer;
function kCFLocaleGroupingSeparator: Pointer;
function kCFLocaleCurrencySymbol: Pointer;
function kCFLocaleCurrencyCode: Pointer;
function kCFLocaleCollatorIdentifier: Pointer;
function kCFLocaleQuotationBeginDelimiterKey: Pointer;
function kCFLocaleQuotationEndDelimiterKey: Pointer;
function kCFLocaleAlternateQuotationBeginDelimiterKey: Pointer;
function kCFLocaleAlternateQuotationEndDelimiterKey: Pointer;
function kCFGregorianCalendar: Pointer;
function kCFBuddhistCalendar: Pointer;
function kCFChineseCalendar: Pointer;
function kCFHebrewCalendar: Pointer;
function kCFIslamicCalendar: Pointer;
function kCFIslamicCivilCalendar: Pointer;
function kCFJapaneseCalendar: Pointer;
function kCFRepublicOfChinaCalendar: Pointer;
function kCFPersianCalendar: Pointer;
function kCFIndianCalendar: Pointer;
function kCFISO8601Calendar: Pointer;
function kCFIslamicTabularCalendar: Pointer;
function kCFIslamicUmmAlQuraCalendar: Pointer;
function kCFStringTransformStripCombiningMarks: Pointer;
function kCFStringTransformToLatin: Pointer;
function kCFStringTransformFullwidthHalfwidth: Pointer;
function kCFStringTransformLatinKatakana: Pointer;
function kCFStringTransformLatinHiragana: Pointer;
function kCFStringTransformHiraganaKatakana: Pointer;
function kCFStringTransformMandarinLatin: Pointer;
function kCFStringTransformLatinHangul: Pointer;
function kCFStringTransformLatinArabic: Pointer;
function kCFStringTransformLatinHebrew: Pointer;
function kCFStringTransformLatinThai: Pointer;
function kCFStringTransformLatinCyrillic: Pointer;
function kCFStringTransformLatinGreek: Pointer;
function kCFStringTransformToXMLHex: Pointer;
function kCFStringTransformToUnicodeName: Pointer;
function kCFStringTransformStripDiacritics: Pointer;
function kCFTypeBagCallBacks: Pointer;
function kCFCopyStringBagCallBacks: Pointer;
function kCFStringBinaryHeapCallBacks: Pointer;
function kCFErrorDomainPOSIX: Pointer;
function kCFErrorDomainOSStatus: Pointer;
function kCFErrorDomainMach: Pointer;
function kCFErrorDomainCocoa: Pointer;
function kCFErrorLocalizedDescriptionKey: Pointer;
function kCFErrorLocalizedFailureReasonKey: Pointer;
function kCFErrorLocalizedRecoverySuggestionKey: Pointer;
function kCFErrorDescriptionKey: Pointer;
function kCFErrorUnderlyingErrorKey: Pointer;
function kCFErrorURLKey: Pointer;
function kCFErrorFilePathKey: Pointer;
function kCFURLKeysOfUnsetValuesKey: Pointer;
function kCFURLNameKey: Pointer;
function kCFURLLocalizedNameKey: Pointer;
function kCFURLIsRegularFileKey: Pointer;
function kCFURLIsDirectoryKey: Pointer;
function kCFURLIsSymbolicLinkKey: Pointer;
function kCFURLIsVolumeKey: Pointer;
function kCFURLIsPackageKey: Pointer;
function kCFURLIsApplicationKey: Pointer;
function kCFURLApplicationIsScriptableKey: Pointer;
function kCFURLIsSystemImmutableKey: Pointer;
function kCFURLIsUserImmutableKey: Pointer;
function kCFURLIsHiddenKey: Pointer;
function kCFURLHasHiddenExtensionKey: Pointer;
function kCFURLCreationDateKey: Pointer;
function kCFURLContentAccessDateKey: Pointer;
function kCFURLContentModificationDateKey: Pointer;
function kCFURLAttributeModificationDateKey: Pointer;
function kCFURLLinkCountKey: Pointer;
function kCFURLParentDirectoryURLKey: Pointer;
function kCFURLVolumeURLKey: Pointer;
function kCFURLTypeIdentifierKey: Pointer;
function kCFURLLocalizedTypeDescriptionKey: Pointer;
function kCFURLLabelNumberKey: Pointer;
function kCFURLLabelColorKey: Pointer;
function kCFURLLocalizedLabelKey: Pointer;
function kCFURLEffectiveIconKey: Pointer;
function kCFURLCustomIconKey: Pointer;
function kCFURLFileResourceIdentifierKey: Pointer;
function kCFURLVolumeIdentifierKey: Pointer;
function kCFURLPreferredIOBlockSizeKey: Pointer;
function kCFURLIsReadableKey: Pointer;
function kCFURLIsWritableKey: Pointer;
function kCFURLIsExecutableKey: Pointer;
function kCFURLFileSecurityKey: Pointer;
function kCFURLIsExcludedFromBackupKey: Pointer;
function kCFURLTagNamesKey: Pointer;
function kCFURLPathKey: Pointer;
function kCFURLIsMountTriggerKey: Pointer;
function kCFURLGenerationIdentifierKey: Pointer;
function kCFURLDocumentIdentifierKey: Pointer;
function kCFURLAddedToDirectoryDateKey: Pointer;
function kCFURLQuarantinePropertiesKey: Pointer;
function kCFURLFileResourceTypeKey: Pointer;
function kCFURLFileResourceTypeNamedPipe: Pointer;
function kCFURLFileResourceTypeCharacterSpecial: Pointer;
function kCFURLFileResourceTypeDirectory: Pointer;
function kCFURLFileResourceTypeBlockSpecial: Pointer;
function kCFURLFileResourceTypeRegular: Pointer;
function kCFURLFileResourceTypeSymbolicLink: Pointer;
function kCFURLFileResourceTypeSocket: Pointer;
function kCFURLFileResourceTypeUnknown: Pointer;
function kCFURLFileSizeKey: Pointer;
function kCFURLFileAllocatedSizeKey: Pointer;
function kCFURLTotalFileSizeKey: Pointer;
function kCFURLTotalFileAllocatedSizeKey: Pointer;
function kCFURLIsAliasFileKey: Pointer;
function kCFURLFileProtectionKey: Pointer;
function kCFURLFileProtectionNone: Pointer;
function kCFURLFileProtectionComplete: Pointer;
function kCFURLFileProtectionCompleteUnlessOpen: Pointer;
function kCFURLFileProtectionCompleteUntilFirstUserAuthentication: Pointer;
function kCFURLVolumeLocalizedFormatDescriptionKey: Pointer;
function kCFURLVolumeTotalCapacityKey: Pointer;
function kCFURLVolumeAvailableCapacityKey: Pointer;
function kCFURLVolumeResourceCountKey: Pointer;
function kCFURLVolumeSupportsPersistentIDsKey: Pointer;
function kCFURLVolumeSupportsSymbolicLinksKey: Pointer;
function kCFURLVolumeSupportsHardLinksKey: Pointer;
function kCFURLVolumeSupportsJournalingKey: Pointer;
function kCFURLVolumeIsJournalingKey: Pointer;
function kCFURLVolumeSupportsSparseFilesKey: Pointer;
function kCFURLVolumeSupportsZeroRunsKey: Pointer;
function kCFURLVolumeSupportsCaseSensitiveNamesKey: Pointer;
function kCFURLVolumeSupportsCasePreservedNamesKey: Pointer;
function kCFURLVolumeSupportsRootDirectoryDatesKey: Pointer;
function kCFURLVolumeSupportsVolumeSizesKey: Pointer;
function kCFURLVolumeSupportsRenamingKey: Pointer;
function kCFURLVolumeSupportsAdvisoryFileLockingKey: Pointer;
function kCFURLVolumeSupportsExtendedSecurityKey: Pointer;
function kCFURLVolumeIsBrowsableKey: Pointer;
function kCFURLVolumeMaximumFileSizeKey: Pointer;
function kCFURLVolumeIsEjectableKey: Pointer;
function kCFURLVolumeIsRemovableKey: Pointer;
function kCFURLVolumeIsInternalKey: Pointer;
function kCFURLVolumeIsAutomountedKey: Pointer;
function kCFURLVolumeIsLocalKey: Pointer;
function kCFURLVolumeIsReadOnlyKey: Pointer;
function kCFURLVolumeCreationDateKey: Pointer;
function kCFURLVolumeURLForRemountingKey: Pointer;
function kCFURLVolumeUUIDStringKey: Pointer;
function kCFURLVolumeNameKey: Pointer;
function kCFURLVolumeLocalizedNameKey: Pointer;
function kCFURLIsUbiquitousItemKey: Pointer;
function kCFURLUbiquitousItemHasUnresolvedConflictsKey: Pointer;
function kCFURLUbiquitousItemIsDownloadedKey: Pointer;
function kCFURLUbiquitousItemIsDownloadingKey: Pointer;
function kCFURLUbiquitousItemIsUploadedKey: Pointer;
function kCFURLUbiquitousItemIsUploadingKey: Pointer;
function kCFURLUbiquitousItemPercentDownloadedKey: Pointer;
function kCFURLUbiquitousItemPercentUploadedKey: Pointer;
function kCFURLUbiquitousItemDownloadingStatusKey: Pointer;
function kCFURLUbiquitousItemDownloadingErrorKey: Pointer;
function kCFURLUbiquitousItemUploadingErrorKey: Pointer;
function kCFURLUbiquitousItemDownloadingStatusNotDownloaded: Pointer;
function kCFURLUbiquitousItemDownloadingStatusDownloaded: Pointer;
function kCFURLUbiquitousItemDownloadingStatusCurrent: Pointer;
function kCFBundleInfoDictionaryVersionKey: Pointer;
function kCFBundleExecutableKey: Pointer;
function kCFBundleIdentifierKey: Pointer;
function kCFBundleVersionKey: Pointer;
function kCFBundleDevelopmentRegionKey: Pointer;
function kCFBundleNameKey: Pointer;
function kCFBundleLocalizationsKey: Pointer;
function kCFAbsoluteTimeIntervalSince1970: Pointer;
function kCFAbsoluteTimeIntervalSince1904: Pointer;
function kCFTimeZoneSystemTimeZoneDidChangeNotification: Pointer;
function kCFDateFormatterIsLenient: Pointer;
function kCFDateFormatterTimeZone: Pointer;
function kCFDateFormatterCalendarName: Pointer;
function kCFDateFormatterDefaultFormat: Pointer;
function kCFDateFormatterTwoDigitStartDate: Pointer;
function kCFDateFormatterDefaultDate: Pointer;
function kCFDateFormatterCalendar: Pointer;
function kCFDateFormatterEraSymbols: Pointer;
function kCFDateFormatterMonthSymbols: Pointer;
function kCFDateFormatterShortMonthSymbols: Pointer;
function kCFDateFormatterWeekdaySymbols: Pointer;
function kCFDateFormatterShortWeekdaySymbols: Pointer;
function kCFDateFormatterAMSymbol: Pointer;
function kCFDateFormatterPMSymbol: Pointer;
function kCFDateFormatterLongEraSymbols: Pointer;
function kCFDateFormatterVeryShortMonthSymbols: Pointer;
function kCFDateFormatterStandaloneMonthSymbols: Pointer;
function kCFDateFormatterShortStandaloneMonthSymbols: Pointer;
function kCFDateFormatterVeryShortStandaloneMonthSymbols: Pointer;
function kCFDateFormatterVeryShortWeekdaySymbols: Pointer;
function kCFDateFormatterStandaloneWeekdaySymbols: Pointer;
function kCFDateFormatterShortStandaloneWeekdaySymbols: Pointer;
function kCFDateFormatterVeryShortStandaloneWeekdaySymbols: Pointer;
function kCFDateFormatterQuarterSymbols: Pointer;
function kCFDateFormatterShortQuarterSymbols: Pointer;
function kCFDateFormatterStandaloneQuarterSymbols: Pointer;
function kCFDateFormatterShortStandaloneQuarterSymbols: Pointer;
function kCFDateFormatterGregorianStartDate: Pointer;
function kCFDateFormatterDoesRelativeDateFormattingKey: Pointer;
function kCFRunLoopDefaultMode: Pointer;
function kCFRunLoopCommonModes: Pointer;
function kCFBooleanTrue: Pointer;
function kCFBooleanFalse: Pointer;
function kCFNumberPositiveInfinity: Pointer;
function kCFNumberNegativeInfinity: Pointer;
function kCFNumberNaN: Pointer;
function kCFNumberFormatterCurrencyCode: Pointer;
function kCFNumberFormatterDecimalSeparator: Pointer;
function kCFNumberFormatterCurrencyDecimalSeparator: Pointer;
function kCFNumberFormatterAlwaysShowDecimalSeparator: Pointer;
function kCFNumberFormatterGroupingSeparator: Pointer;
function kCFNumberFormatterUseGroupingSeparator: Pointer;
function kCFNumberFormatterPercentSymbol: Pointer;
function kCFNumberFormatterZeroSymbol: Pointer;
function kCFNumberFormatterNaNSymbol: Pointer;
function kCFNumberFormatterInfinitySymbol: Pointer;
function kCFNumberFormatterMinusSign: Pointer;
function kCFNumberFormatterPlusSign: Pointer;
function kCFNumberFormatterCurrencySymbol: Pointer;
function kCFNumberFormatterExponentSymbol: Pointer;
function kCFNumberFormatterMinIntegerDigits: Pointer;
function kCFNumberFormatterMaxIntegerDigits: Pointer;
function kCFNumberFormatterMinFractionDigits: Pointer;
function kCFNumberFormatterMaxFractionDigits: Pointer;
function kCFNumberFormatterGroupingSize: Pointer;
function kCFNumberFormatterSecondaryGroupingSize: Pointer;
function kCFNumberFormatterRoundingMode: Pointer;
function kCFNumberFormatterRoundingIncrement: Pointer;
function kCFNumberFormatterFormatWidth: Pointer;
function kCFNumberFormatterPaddingPosition: Pointer;
function kCFNumberFormatterPaddingCharacter: Pointer;
function kCFNumberFormatterDefaultFormat: Pointer;
function kCFNumberFormatterMultiplier: Pointer;
function kCFNumberFormatterPositivePrefix: Pointer;
function kCFNumberFormatterPositiveSuffix: Pointer;
function kCFNumberFormatterNegativePrefix: Pointer;
function kCFNumberFormatterNegativeSuffix: Pointer;
function kCFNumberFormatterPerMillSymbol: Pointer;
function kCFNumberFormatterInternationalCurrencySymbol: Pointer;
function kCFNumberFormatterCurrencyGroupingSeparator: Pointer;
function kCFNumberFormatterIsLenient: Pointer;
function kCFNumberFormatterUseSignificantDigits: Pointer;
function kCFNumberFormatterMinSignificantDigits: Pointer;
function kCFNumberFormatterMaxSignificantDigits: Pointer;
function kCFPlugInDynamicRegistrationKey: Pointer;
function kCFPlugInDynamicRegisterFunctionKey: Pointer;
function kCFPlugInUnloadFunctionKey: Pointer;
function kCFPlugInFactoriesKey: Pointer;
function kCFPlugInTypesKey: Pointer;
function kCFPreferencesAnyApplication: Pointer;
function kCFPreferencesCurrentApplication: Pointer;
function kCFPreferencesAnyHost: Pointer;
function kCFPreferencesCurrentHost: Pointer;
function kCFPreferencesAnyUser: Pointer;
function kCFPreferencesCurrentUser: Pointer;
function kCFSocketCommandKey: Pointer;
function kCFSocketNameKey: Pointer;
function kCFSocketValueKey: Pointer;
function kCFSocketResultKey: Pointer;
function kCFSocketErrorKey: Pointer;
function kCFSocketRegisterCommand: Pointer;
function kCFSocketRetrieveCommand: Pointer;
function kCFStreamPropertyDataWritten: Pointer;
function kCFStreamPropertyAppendToFile: Pointer;
function kCFStreamPropertyFileCurrentOffset: Pointer;
function kCFStreamPropertySocketNativeHandle: Pointer;
function kCFStreamPropertySocketRemoteHostName: Pointer;
function kCFStreamPropertySocketRemotePortNumber: Pointer;
function kCFTypeSetCallBacks: Pointer;
function kCFCopyStringSetCallBacks: Pointer;
function kCFURLFileExists: Pointer;
function kCFURLFileDirectoryContents: Pointer;
function kCFURLFileLength: Pointer;
function kCFURLFileLastModificationTime: Pointer;
function kCFURLFilePOSIXMode: Pointer;
function kCFURLFileOwnerID: Pointer;
function kCFURLHTTPStatusCode: Pointer;
function kCFURLHTTPStatusLine: Pointer;


// ===== External functions =====

const
  libCoreFoundation =
    '/System/Library/Frameworks/CoreFoundation.framework/CoreFoundation';
function CFRangeMake(loc: CFIndex; len: CFIndex): CFRange; cdecl;
  external libCoreFoundation name _PU + 'CFRangeMake';
function __CFRangeMake(loc: CFIndex; len: CFIndex): CFRange; cdecl;
  external libCoreFoundation name _PU + '__CFRangeMake';
function CFNullGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFNullGetTypeID';
function CFAllocatorGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFAllocatorGetTypeID';
procedure CFAllocatorSetDefault(allocator: CFAllocatorRef); cdecl;
  external libCoreFoundation name _PU + 'CFAllocatorSetDefault';
function CFAllocatorGetDefault: CFAllocatorRef; cdecl;
  external libCoreFoundation name _PU + 'CFAllocatorGetDefault';
function CFAllocatorCreate(allocator: CFAllocatorRef; context: Pointer)
  : CFAllocatorRef; cdecl; external libCoreFoundation name _PU +
  'CFAllocatorCreate';
function CFAllocatorAllocate(allocator: CFAllocatorRef; size: CFIndex;
  hint: CFOptionFlags): Pointer; cdecl;
  external libCoreFoundation name _PU + 'CFAllocatorAllocate';
function CFAllocatorReallocate(allocator: CFAllocatorRef; ptr: Pointer;
  newsize: CFIndex; hint: CFOptionFlags): Pointer; cdecl;
  external libCoreFoundation name _PU + 'CFAllocatorReallocate';
procedure CFAllocatorDeallocate(allocator: CFAllocatorRef; ptr: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFAllocatorDeallocate';
function CFAllocatorGetPreferredSizeForSize(allocator: CFAllocatorRef;
  size: CFIndex; hint: CFOptionFlags): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFAllocatorGetPreferredSizeForSize';
procedure CFAllocatorGetContext(allocator: CFAllocatorRef; context: Pointer);
  cdecl; external libCoreFoundation name _PU + 'CFAllocatorGetContext';
function CFGetTypeID(cf: CFTypeRef): CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFGetTypeID';
function CFCopyTypeIDDescription(type_id: CFTypeID): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFCopyTypeIDDescription';
function CFRetain(cf: CFTypeRef): CFTypeRef; cdecl;
  external libCoreFoundation name _PU + 'CFRetain';
procedure CFRelease(cf: CFTypeRef); cdecl;
  external libCoreFoundation name _PU + 'CFRelease';
function CFAutorelease(arg: CFTypeRef): CFTypeRef; cdecl;
  external libCoreFoundation name _PU + 'CFAutorelease';
function CFGetRetainCount(cf: CFTypeRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFGetRetainCount';
function CFEqual(cf1: CFTypeRef; cf2: CFTypeRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFEqual';
function CFHash(cf: CFTypeRef): CFHashCode; cdecl;
  external libCoreFoundation name _PU + 'CFHash';
function CFCopyDescription(cf: CFTypeRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFCopyDescription';
function CFGetAllocator(cf: CFTypeRef): CFAllocatorRef; cdecl;
  external libCoreFoundation name _PU + 'CFGetAllocator';
function CFMakeCollectable(cf: CFTypeRef): CFTypeRef; cdecl;
  external libCoreFoundation name _PU + 'CFMakeCollectable';
function CFArrayGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFArrayGetTypeID';
function CFArrayCreate(allocator: CFAllocatorRef; values: Pointer;
  numValues: CFIndex; callBacks: Pointer): CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFArrayCreate';
function CFArrayCreateCopy(allocator: CFAllocatorRef; theArray: CFArrayRef)
  : CFArrayRef; cdecl; external libCoreFoundation name _PU +
  'CFArrayCreateCopy';
function CFArrayCreateMutable(allocator: CFAllocatorRef; capacity: CFIndex;
  callBacks: Pointer): CFMutableArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFArrayCreateMutable';
function CFArrayCreateMutableCopy(allocator: CFAllocatorRef; capacity: CFIndex;
  theArray: CFArrayRef): CFMutableArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFArrayCreateMutableCopy';
function CFArrayGetCount(theArray: CFArrayRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFArrayGetCount';
function CFArrayGetCountOfValue(theArray: CFArrayRef; range: CFRange;
  value: Pointer): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFArrayGetCountOfValue';
function CFArrayContainsValue(theArray: CFArrayRef; range: CFRange;
  value: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFArrayContainsValue';
function CFArrayGetValueAtIndex(theArray: CFArrayRef; idx: CFIndex): Pointer;
  cdecl; external libCoreFoundation name _PU + 'CFArrayGetValueAtIndex';
procedure CFArrayGetValues(theArray: CFArrayRef; range: CFRange;
  values: Pointer); cdecl; external libCoreFoundation name _PU +
  'CFArrayGetValues';
procedure CFArrayApplyFunction(theArray: CFArrayRef; range: CFRange;
  applier: CFArrayApplierFunction; context: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFArrayApplyFunction';
function CFArrayGetFirstIndexOfValue(theArray: CFArrayRef; range: CFRange;
  value: Pointer): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFArrayGetFirstIndexOfValue';
function CFArrayGetLastIndexOfValue(theArray: CFArrayRef; range: CFRange;
  value: Pointer): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFArrayGetLastIndexOfValue';
function CFArrayBSearchValues(theArray: CFArrayRef; range: CFRange;
  value: Pointer; comparator: CFComparatorFunction; context: Pointer): CFIndex;
  cdecl; external libCoreFoundation name _PU + 'CFArrayBSearchValues';
procedure CFArrayAppendValue(theArray: CFMutableArrayRef; value: Pointer);
  cdecl; external libCoreFoundation name _PU + 'CFArrayAppendValue';
procedure CFArrayInsertValueAtIndex(theArray: CFMutableArrayRef; idx: CFIndex;
  value: Pointer); cdecl; external libCoreFoundation name _PU +
  'CFArrayInsertValueAtIndex';
procedure CFArraySetValueAtIndex(theArray: CFMutableArrayRef; idx: CFIndex;
  value: Pointer); cdecl; external libCoreFoundation name _PU +
  'CFArraySetValueAtIndex';
procedure CFArrayRemoveValueAtIndex(theArray: CFMutableArrayRef; idx: CFIndex);
  cdecl; external libCoreFoundation name _PU + 'CFArrayRemoveValueAtIndex';
procedure CFArrayRemoveAllValues(theArray: CFMutableArrayRef); cdecl;
  external libCoreFoundation name _PU + 'CFArrayRemoveAllValues';
procedure CFArrayReplaceValues(theArray: CFMutableArrayRef; range: CFRange;
  newValues: Pointer; newCount: CFIndex); cdecl;
  external libCoreFoundation name _PU + 'CFArrayReplaceValues';
procedure CFArrayExchangeValuesAtIndices(theArray: CFMutableArrayRef;
  idx1: CFIndex; idx2: CFIndex); cdecl;
  external libCoreFoundation name _PU + 'CFArrayExchangeValuesAtIndices';
procedure CFArraySortValues(theArray: CFMutableArrayRef; range: CFRange;
  comparator: CFComparatorFunction; context: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFArraySortValues';
procedure CFArrayAppendArray(theArray: CFMutableArrayRef;
  otherArray: CFArrayRef; otherRange: CFRange); cdecl;
  external libCoreFoundation name _PU + 'CFArrayAppendArray';
function CFDataGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFDataGetTypeID';
function CFDataCreate(allocator: CFAllocatorRef; bytes: PByte; length: CFIndex)
  : CFDataRef; cdecl; external libCoreFoundation name _PU + 'CFDataCreate';
function CFDataCreateWithBytesNoCopy(allocator: CFAllocatorRef; bytes: PByte;
  length: CFIndex; bytesDeallocator: CFAllocatorRef): CFDataRef; cdecl;
  external libCoreFoundation name _PU + 'CFDataCreateWithBytesNoCopy';
function CFDataCreateCopy(allocator: CFAllocatorRef; theData: CFDataRef)
  : CFDataRef; cdecl; external libCoreFoundation name _PU + 'CFDataCreateCopy';
function CFDataCreateMutable(allocator: CFAllocatorRef; capacity: CFIndex)
  : CFMutableDataRef; cdecl; external libCoreFoundation name _PU +
  'CFDataCreateMutable';
function CFDataCreateMutableCopy(allocator: CFAllocatorRef; capacity: CFIndex;
  theData: CFDataRef): CFMutableDataRef; cdecl;
  external libCoreFoundation name _PU + 'CFDataCreateMutableCopy';
function CFDataGetLength(theData: CFDataRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFDataGetLength';
function CFDataGetBytePtr(theData: CFDataRef): PByte; cdecl;
  external libCoreFoundation name _PU + 'CFDataGetBytePtr';
function CFDataGetMutableBytePtr(theData: CFMutableDataRef): PByte; cdecl;
  external libCoreFoundation name _PU + 'CFDataGetMutableBytePtr';
procedure CFDataGetBytes(theData: CFDataRef; range: CFRange; buffer: PByte);
  cdecl; external libCoreFoundation name _PU + 'CFDataGetBytes';
procedure CFDataSetLength(theData: CFMutableDataRef; length: CFIndex); cdecl;
  external libCoreFoundation name _PU + 'CFDataSetLength';
procedure CFDataIncreaseLength(theData: CFMutableDataRef; extraLength: CFIndex);
  cdecl; external libCoreFoundation name _PU + 'CFDataIncreaseLength';
procedure CFDataAppendBytes(theData: CFMutableDataRef; bytes: PByte;
  length: CFIndex); cdecl; external libCoreFoundation name _PU +
  'CFDataAppendBytes';
procedure CFDataReplaceBytes(theData: CFMutableDataRef; range: CFRange;
  newBytes: PByte; newLength: CFIndex); cdecl;
  external libCoreFoundation name _PU + 'CFDataReplaceBytes';
procedure CFDataDeleteBytes(theData: CFMutableDataRef; range: CFRange); cdecl;
  external libCoreFoundation name _PU + 'CFDataDeleteBytes';
function CFDataFind(theData: CFDataRef; dataToFind: CFDataRef;
  searchRange: CFRange; compareOptions: CFDataSearchFlags): CFRange; cdecl;
  external libCoreFoundation name _PU + 'CFDataFind';
function CFDictionaryGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFDictionaryGetTypeID';
function CFDictionaryCreate(allocator: CFAllocatorRef; keys: Pointer;
  values: Pointer; numValues: CFIndex; keyCallBacks: Pointer;
  valueCallBacks: Pointer): CFDictionaryRef; cdecl;
  external libCoreFoundation name _PU + 'CFDictionaryCreate';
function CFDictionaryCreateCopy(allocator: CFAllocatorRef;
  theDict: CFDictionaryRef): CFDictionaryRef; cdecl;
  external libCoreFoundation name _PU + 'CFDictionaryCreateCopy';
function CFDictionaryCreateMutable(allocator: CFAllocatorRef; capacity: CFIndex;
  keyCallBacks: Pointer; valueCallBacks: Pointer): CFMutableDictionaryRef;
  cdecl; external libCoreFoundation name _PU + 'CFDictionaryCreateMutable';
function CFDictionaryCreateMutableCopy(allocator: CFAllocatorRef;
  capacity: CFIndex; theDict: CFDictionaryRef): CFMutableDictionaryRef; cdecl;
  external libCoreFoundation name _PU + 'CFDictionaryCreateMutableCopy';
function CFDictionaryGetCount(theDict: CFDictionaryRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFDictionaryGetCount';
function CFDictionaryGetCountOfKey(theDict: CFDictionaryRef; key: Pointer)
  : CFIndex; cdecl; external libCoreFoundation name _PU +
  'CFDictionaryGetCountOfKey';
function CFDictionaryGetCountOfValue(theDict: CFDictionaryRef; value: Pointer)
  : CFIndex; cdecl; external libCoreFoundation name _PU +
  'CFDictionaryGetCountOfValue';
function CFDictionaryContainsKey(theDict: CFDictionaryRef; key: Pointer)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFDictionaryContainsKey';
function CFDictionaryContainsValue(theDict: CFDictionaryRef; value: Pointer)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFDictionaryContainsValue';
function CFDictionaryGetValue(theDict: CFDictionaryRef; key: Pointer): Pointer;
  cdecl; external libCoreFoundation name _PU + 'CFDictionaryGetValue';
function CFDictionaryGetValueIfPresent(theDict: CFDictionaryRef; key: Pointer;
  value: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFDictionaryGetValueIfPresent';
procedure CFDictionaryGetKeysAndValues(theDict: CFDictionaryRef; keys: Pointer;
  values: Pointer); cdecl; external libCoreFoundation name _PU +
  'CFDictionaryGetKeysAndValues';
procedure CFDictionaryApplyFunction(theDict: CFDictionaryRef;
  applier: CFDictionaryApplierFunction; context: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFDictionaryApplyFunction';
procedure CFDictionaryAddValue(theDict: CFMutableDictionaryRef; key: Pointer;
  value: Pointer); cdecl; external libCoreFoundation name _PU +
  'CFDictionaryAddValue';
procedure CFDictionarySetValue(theDict: CFMutableDictionaryRef; key: Pointer;
  value: Pointer); cdecl; external libCoreFoundation name _PU +
  'CFDictionarySetValue';
procedure CFDictionaryReplaceValue(theDict: CFMutableDictionaryRef;
  key: Pointer; value: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFDictionaryReplaceValue';
procedure CFDictionaryRemoveValue(theDict: CFMutableDictionaryRef;
  key: Pointer); cdecl; external libCoreFoundation name _PU +
  'CFDictionaryRemoveValue';
procedure CFDictionaryRemoveAllValues(theDict: CFMutableDictionaryRef); cdecl;
  external libCoreFoundation name _PU + 'CFDictionaryRemoveAllValues';
function CFCharacterSetGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetGetTypeID';
function CFCharacterSetGetPredefined(theSetIdentifier
  : CFCharacterSetPredefinedSet): CFCharacterSetRef; cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetGetPredefined';
function CFCharacterSetCreateWithCharactersInRange(alloc: CFAllocatorRef;
  theRange: CFRange): CFCharacterSetRef; cdecl;
  external libCoreFoundation name _PU +
  'CFCharacterSetCreateWithCharactersInRange';
function CFCharacterSetCreateWithCharactersInString(alloc: CFAllocatorRef;
  theString: CFStringRef): CFCharacterSetRef; cdecl;
  external libCoreFoundation name _PU +
  'CFCharacterSetCreateWithCharactersInString';
function CFCharacterSetCreateWithBitmapRepresentation(alloc: CFAllocatorRef;
  theData: CFDataRef): CFCharacterSetRef; cdecl;
  external libCoreFoundation name _PU +
  'CFCharacterSetCreateWithBitmapRepresentation';
function CFCharacterSetCreateInvertedSet(alloc: CFAllocatorRef;
  theSet: CFCharacterSetRef): CFCharacterSetRef; cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetCreateInvertedSet';
function CFCharacterSetIsSupersetOfSet(theSet: CFCharacterSetRef;
  theOtherset: CFCharacterSetRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetIsSupersetOfSet';
function CFCharacterSetHasMemberInPlane(theSet: CFCharacterSetRef;
  thePlane: CFIndex): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetHasMemberInPlane';
function CFCharacterSetCreateMutable(alloc: CFAllocatorRef)
  : CFMutableCharacterSetRef; cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetCreateMutable';
function CFCharacterSetCreateCopy(alloc: CFAllocatorRef;
  theSet: CFCharacterSetRef): CFCharacterSetRef; cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetCreateCopy';
function CFCharacterSetCreateMutableCopy(alloc: CFAllocatorRef;
  theSet: CFCharacterSetRef): CFMutableCharacterSetRef; cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetCreateMutableCopy';
function CFCharacterSetIsCharacterMember(theSet: CFCharacterSetRef;
  theChar: UniChar): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetIsCharacterMember';
function CFCharacterSetIsLongCharacterMember(theSet: CFCharacterSetRef;
  theChar: UTF32Char): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetIsLongCharacterMember';
function CFCharacterSetCreateBitmapRepresentation(alloc: CFAllocatorRef;
  theSet: CFCharacterSetRef): CFDataRef; cdecl;
  external libCoreFoundation name _PU +
  'CFCharacterSetCreateBitmapRepresentation';
procedure CFCharacterSetAddCharactersInRange(theSet: CFMutableCharacterSetRef;
  theRange: CFRange); cdecl; external libCoreFoundation name _PU +
  'CFCharacterSetAddCharactersInRange';
procedure CFCharacterSetRemoveCharactersInRange
  (theSet: CFMutableCharacterSetRef; theRange: CFRange); cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetRemoveCharactersInRange';
procedure CFCharacterSetAddCharactersInString(theSet: CFMutableCharacterSetRef;
  theString: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetAddCharactersInString';
procedure CFCharacterSetRemoveCharactersInString
  (theSet: CFMutableCharacterSetRef; theString: CFStringRef); cdecl;
  external libCoreFoundation name _PU +
  'CFCharacterSetRemoveCharactersInString';
procedure CFCharacterSetUnion(theSet: CFMutableCharacterSetRef;
  theOtherset: CFCharacterSetRef); cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetUnion';
procedure CFCharacterSetIntersect(theSet: CFMutableCharacterSetRef;
  theOtherset: CFCharacterSetRef); cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetIntersect';
procedure CFCharacterSetInvert(theSet: CFMutableCharacterSetRef); cdecl;
  external libCoreFoundation name _PU + 'CFCharacterSetInvert';
function CFLocaleGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFLocaleGetTypeID';
function CFLocaleGetSystem: CFLocaleRef; cdecl;
  external libCoreFoundation name _PU + 'CFLocaleGetSystem';
function CFLocaleCopyCurrent: CFLocaleRef; cdecl;
  external libCoreFoundation name _PU + 'CFLocaleCopyCurrent';
function CFLocaleCopyAvailableLocaleIdentifiers: CFArrayRef; cdecl;
  external libCoreFoundation name _PU +
  'CFLocaleCopyAvailableLocaleIdentifiers';
function CFLocaleCopyISOLanguageCodes: CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFLocaleCopyISOLanguageCodes';
function CFLocaleCopyISOCountryCodes: CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFLocaleCopyISOCountryCodes';
function CFLocaleCopyISOCurrencyCodes: CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFLocaleCopyISOCurrencyCodes';
function CFLocaleCopyCommonISOCurrencyCodes: CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFLocaleCopyCommonISOCurrencyCodes';
function CFLocaleCopyPreferredLanguages: CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFLocaleCopyPreferredLanguages';
function CFLocaleCreateCanonicalLanguageIdentifierFromString
  (allocator: CFAllocatorRef; localeIdentifier: CFStringRef): CFStringRef;
  cdecl; external libCoreFoundation name _PU +
  'CFLocaleCreateCanonicalLanguageIdentifierFromString';
function CFLocaleCreateCanonicalLocaleIdentifierFromString
  (allocator: CFAllocatorRef; localeIdentifier: CFStringRef): CFStringRef;
  cdecl; external libCoreFoundation name _PU +
  'CFLocaleCreateCanonicalLocaleIdentifierFromString';
function CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes
  (allocator: CFAllocatorRef; lcode: LangCode; rcode: RegionCode): CFStringRef;
  cdecl; external libCoreFoundation name _PU +
  'CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes';
function CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode
  (allocator: CFAllocatorRef; lcid: LongWord): CFStringRef; cdecl;
  external libCoreFoundation name _PU +
  'CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode';
function CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier(localeIdentifier
  : CFStringRef): LongWord; cdecl;
  external libCoreFoundation name _PU +
  'CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier';
function CFLocaleGetLanguageCharacterDirection(isoLangCode: CFStringRef)
  : CFLocaleLanguageDirection; cdecl;
  external libCoreFoundation name _PU + 'CFLocaleGetLanguageCharacterDirection';
function CFLocaleGetLanguageLineDirection(isoLangCode: CFStringRef)
  : CFLocaleLanguageDirection; cdecl;
  external libCoreFoundation name _PU + 'CFLocaleGetLanguageLineDirection';
function CFLocaleCreateComponentsFromLocaleIdentifier(allocator: CFAllocatorRef;
  localeID: CFStringRef): CFDictionaryRef; cdecl;
  external libCoreFoundation name _PU +
  'CFLocaleCreateComponentsFromLocaleIdentifier';
function CFLocaleCreateLocaleIdentifierFromComponents(allocator: CFAllocatorRef;
  dictionary: CFDictionaryRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU +
  'CFLocaleCreateLocaleIdentifierFromComponents';
function CFLocaleCreate(allocator: CFAllocatorRef;
  localeIdentifier: CFStringRef): CFLocaleRef; cdecl;
  external libCoreFoundation name _PU + 'CFLocaleCreate';
function CFLocaleCreateCopy(allocator: CFAllocatorRef; locale: CFLocaleRef)
  : CFLocaleRef; cdecl; external libCoreFoundation name _PU +
  'CFLocaleCreateCopy';
function CFLocaleGetIdentifier(locale: CFLocaleRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFLocaleGetIdentifier';
function CFLocaleGetValue(locale: CFLocaleRef; key: CFStringRef): CFTypeRef;
  cdecl; external libCoreFoundation name _PU + 'CFLocaleGetValue';
function CFLocaleCopyDisplayNameForPropertyValue(displayLocale: CFLocaleRef;
  key: CFStringRef; value: CFStringRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU +
  'CFLocaleCopyDisplayNameForPropertyValue';
function CFStringGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFStringGetTypeID';
function CFStringCreateWithPascalString(alloc: CFAllocatorRef;
  pStr: ConstStr255Param; encoding: CFStringEncoding): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateWithPascalString';
function CFStringCreateWithCString(alloc: CFAllocatorRef;
  cStr: MarshaledAString; encoding: CFStringEncoding): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateWithCString';
function CFStringCreateWithBytes(alloc: CFAllocatorRef; bytes: PByte;
  numBytes: CFIndex; encoding: CFStringEncoding;
  isExternalRepresentation: Boolean): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateWithBytes';
function CFStringCreateWithCharacters(alloc: CFAllocatorRef;
  chars: unsigned short *; numChars: CFIndex): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateWithCharacters';
function CFStringCreateWithPascalStringNoCopy(alloc: CFAllocatorRef;
  pStr: ConstStr255Param; encoding: CFStringEncoding;
  contentsDeallocator: CFAllocatorRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateWithPascalStringNoCopy';
function CFStringCreateWithCStringNoCopy(alloc: CFAllocatorRef;
  cStr: MarshaledAString; encoding: CFStringEncoding;
  contentsDeallocator: CFAllocatorRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateWithCStringNoCopy';
function CFStringCreateWithBytesNoCopy(alloc: CFAllocatorRef; bytes: PByte;
  numBytes: CFIndex; encoding: CFStringEncoding;
  isExternalRepresentation: Boolean; contentsDeallocator: CFAllocatorRef)
  : CFStringRef; cdecl; external libCoreFoundation name _PU +
  'CFStringCreateWithBytesNoCopy';
function CFStringCreateWithCharactersNoCopy(alloc: CFAllocatorRef;
  chars: unsigned short *; numChars: CFIndex;
  contentsDeallocator: CFAllocatorRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateWithCharactersNoCopy';
function CFStringCreateWithSubstring(alloc: CFAllocatorRef; str: CFStringRef;
  range: CFRange): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateWithSubstring';
function CFStringCreateCopy(alloc: CFAllocatorRef; theString: CFStringRef)
  : CFStringRef; cdecl; external libCoreFoundation name _PU +
  'CFStringCreateCopy';
function CFStringCreateWithFormat(alloc: CFAllocatorRef;
  formatOptions: CFDictionaryRef; format: CFStringRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateWithFormat';
function CFStringCreateWithFormatAndArguments(alloc: CFAllocatorRef;
  formatOptions: CFDictionaryRef; format: CFStringRef;
  arguments: array of const): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateWithFormatAndArguments';
function CFStringCreateMutable(alloc: CFAllocatorRef; maxLength: CFIndex)
  : CFMutableStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateMutable';
function CFStringCreateMutableCopy(alloc: CFAllocatorRef; maxLength: CFIndex;
  theString: CFStringRef): CFMutableStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateMutableCopy';
function CFStringCreateMutableWithExternalCharactersNoCopy
  (alloc: CFAllocatorRef; chars: unsigned short *; numChars: CFIndex;
  capacity: CFIndex; externalCharactersAllocator: CFAllocatorRef)
  : CFMutableStringRef; cdecl;
  external libCoreFoundation name _PU +
  'CFStringCreateMutableWithExternalCharactersNoCopy';
function CFStringGetLength(theString: CFStringRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFStringGetLength';
function CFStringGetCharacterAtIndex(theString: CFStringRef; idx: CFIndex)
  : UniChar; cdecl; external libCoreFoundation name _PU +
  'CFStringGetCharacterAtIndex';
procedure CFStringGetCharacters(theString: CFStringRef; range: CFRange;
  buffer: unsigned short * ); cdecl;
  external libCoreFoundation name _PU + 'CFStringGetCharacters';
function CFStringGetPascalString(theString: CFStringRef; buffer: StringPtr;
  bufferSize: CFIndex; encoding: CFStringEncoding): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFStringGetPascalString';
function CFStringGetCString(theString: CFStringRef; buffer: MarshaledAString;
  bufferSize: CFIndex; encoding: CFStringEncoding): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFStringGetCString';
function CFStringGetPascalStringPtr(theString: CFStringRef;
  encoding: CFStringEncoding): ConstStringPtr; cdecl;
  external libCoreFoundation name _PU + 'CFStringGetPascalStringPtr';
function CFStringGetCStringPtr(theString: CFStringRef;
  encoding: CFStringEncoding): MarshaledAString; cdecl;
  external libCoreFoundation name _PU + 'CFStringGetCStringPtr';
function CFStringGetCharactersPtr(theString: CFStringRef): unsigned short *;
  cdecl; external libCoreFoundation name _PU + 'CFStringGetCharactersPtr';
function CFStringGetBytes(theString: CFStringRef; range: CFRange;
  encoding: CFStringEncoding; lossByte: Byte; isExternalRepresentation: Boolean;
  buffer: PByte; maxBufLen: CFIndex; usedBufLen: PLongInt): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFStringGetBytes';
function CFStringCreateFromExternalRepresentation(alloc: CFAllocatorRef;
  data: CFDataRef; encoding: CFStringEncoding): CFStringRef; cdecl;
  external libCoreFoundation name _PU +
  'CFStringCreateFromExternalRepresentation';
function CFStringCreateExternalRepresentation(alloc: CFAllocatorRef;
  theString: CFStringRef; encoding: CFStringEncoding; lossByte: Byte)
  : CFDataRef; cdecl; external libCoreFoundation name _PU +
  'CFStringCreateExternalRepresentation';
function CFStringGetSmallestEncoding(theString: CFStringRef): CFStringEncoding;
  cdecl; external libCoreFoundation name _PU + 'CFStringGetSmallestEncoding';
function CFStringGetFastestEncoding(theString: CFStringRef): CFStringEncoding;
  cdecl; external libCoreFoundation name _PU + 'CFStringGetFastestEncoding';
function CFStringGetSystemEncoding: CFStringEncoding; cdecl;
  external libCoreFoundation name _PU + 'CFStringGetSystemEncoding';
function CFStringGetMaximumSizeForEncoding(length: CFIndex;
  encoding: CFStringEncoding): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFStringGetMaximumSizeForEncoding';
function CFStringGetFileSystemRepresentation(&string: CFStringRef;
  buffer: MarshaledAString; maxBufLen: CFIndex): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFStringGetFileSystemRepresentation';
function CFStringGetMaximumSizeOfFileSystemRepresentation(&string: CFStringRef)
  : CFIndex; cdecl; external libCoreFoundation name _PU +
  'CFStringGetMaximumSizeOfFileSystemRepresentation';
function CFStringCreateWithFileSystemRepresentation(alloc: CFAllocatorRef;
  buffer: MarshaledAString): CFStringRef; cdecl;
  external libCoreFoundation name _PU +
  'CFStringCreateWithFileSystemRepresentation';
function CFStringCompareWithOptionsAndLocale(theString1: CFStringRef;
  theString2: CFStringRef; rangeToCompare: CFRange;
  compareOptions: CFStringCompareFlags; locale: CFLocaleRef)
  : CFComparisonResult; cdecl;
  external libCoreFoundation name _PU + 'CFStringCompareWithOptionsAndLocale';
function CFStringCompareWithOptions(theString1: CFStringRef;
  theString2: CFStringRef; rangeToCompare: CFRange;
  compareOptions: CFStringCompareFlags): CFComparisonResult; cdecl;
  external libCoreFoundation name _PU + 'CFStringCompareWithOptions';
function CFStringCompare(theString1: CFStringRef; theString2: CFStringRef;
  compareOptions: CFStringCompareFlags): CFComparisonResult; cdecl;
  external libCoreFoundation name _PU + 'CFStringCompare';
function CFStringFindWithOptionsAndLocale(theString: CFStringRef;
  stringToFind: CFStringRef; rangeToSearch: CFRange;
  searchOptions: CFStringCompareFlags; locale: CFLocaleRef; result: Pointer)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFStringFindWithOptionsAndLocale';
function CFStringFindWithOptions(theString: CFStringRef;
  stringToFind: CFStringRef; rangeToSearch: CFRange;
  searchOptions: CFStringCompareFlags; result: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFStringFindWithOptions';
function CFStringCreateArrayWithFindResults(alloc: CFAllocatorRef;
  theString: CFStringRef; stringToFind: CFStringRef; rangeToSearch: CFRange;
  compareOptions: CFStringCompareFlags): CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateArrayWithFindResults';
function CFStringFind(theString: CFStringRef; stringToFind: CFStringRef;
  compareOptions: CFStringCompareFlags): CFRange; cdecl;
  external libCoreFoundation name _PU + 'CFStringFind';
function CFStringHasPrefix(theString: CFStringRef; prefix: CFStringRef)
  : Boolean; cdecl; external libCoreFoundation name _PU + 'CFStringHasPrefix';
function CFStringHasSuffix(theString: CFStringRef; suffix: CFStringRef)
  : Boolean; cdecl; external libCoreFoundation name _PU + 'CFStringHasSuffix';
function CFStringGetRangeOfComposedCharactersAtIndex(theString: CFStringRef;
  theIndex: CFIndex): CFRange; cdecl;
  external libCoreFoundation name _PU +
  'CFStringGetRangeOfComposedCharactersAtIndex';
function CFStringFindCharacterFromSet(theString: CFStringRef;
  theSet: CFCharacterSetRef; rangeToSearch: CFRange;
  searchOptions: CFStringCompareFlags; result: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFStringFindCharacterFromSet';
procedure CFStringGetLineBounds(theString: CFStringRef; range: CFRange;
  lineBeginIndex: PLongInt; lineEndIndex: PLongInt; contentsEndIndex: PLongInt);
  cdecl; external libCoreFoundation name _PU + 'CFStringGetLineBounds';
procedure CFStringGetParagraphBounds(&string: CFStringRef; range: CFRange;
  parBeginIndex: PLongInt; parEndIndex: PLongInt; contentsEndIndex: PLongInt);
  cdecl; external libCoreFoundation name _PU + 'CFStringGetParagraphBounds';
function CFStringGetHyphenationLocationBeforeIndex(&string: CFStringRef;
  location: CFIndex; limitRange: CFRange; options: CFOptionFlags;
  locale: CFLocaleRef; character: PLongWord): CFIndex; cdecl;
  external libCoreFoundation name _PU +
  'CFStringGetHyphenationLocationBeforeIndex';
function CFStringIsHyphenationAvailableForLocale(locale: CFLocaleRef): Boolean;
  cdecl; external libCoreFoundation name _PU +
  'CFStringIsHyphenationAvailableForLocale';
function CFStringCreateByCombiningStrings(alloc: CFAllocatorRef;
  theArray: CFArrayRef; separatorString: CFStringRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringCreateByCombiningStrings';
function CFStringCreateArrayBySeparatingStrings(alloc: CFAllocatorRef;
  theString: CFStringRef; separatorString: CFStringRef): CFArrayRef; cdecl;
  external libCoreFoundation name _PU +
  'CFStringCreateArrayBySeparatingStrings';
function CFStringGetIntValue(str: CFStringRef): Int32; cdecl;
  external libCoreFoundation name _PU + 'CFStringGetIntValue';
function CFStringGetDoubleValue(str: CFStringRef): Double; cdecl;
  external libCoreFoundation name _PU + 'CFStringGetDoubleValue';
procedure CFStringAppend(theString: CFMutableStringRef;
  appendedString: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFStringAppend';
procedure CFStringAppendCharacters(theString: CFMutableStringRef;
  chars: unsigned short *; numChars: CFIndex); cdecl;
  external libCoreFoundation name _PU + 'CFStringAppendCharacters';
procedure CFStringAppendPascalString(theString: CFMutableStringRef;
  pStr: ConstStr255Param; encoding: CFStringEncoding); cdecl;
  external libCoreFoundation name _PU + 'CFStringAppendPascalString';
procedure CFStringAppendCString(theString: CFMutableStringRef;
  cStr: MarshaledAString; encoding: CFStringEncoding); cdecl;
  external libCoreFoundation name _PU + 'CFStringAppendCString';
procedure CFStringAppendFormat(theString: CFMutableStringRef;
  formatOptions: CFDictionaryRef; format: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFStringAppendFormat';
procedure CFStringAppendFormatAndArguments(theString: CFMutableStringRef;
  formatOptions: CFDictionaryRef; format: CFStringRef;
  arguments: array of const); cdecl;
  external libCoreFoundation name _PU + 'CFStringAppendFormatAndArguments';
procedure CFStringInsert(str: CFMutableStringRef; idx: CFIndex;
  insertedStr: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFStringInsert';
procedure CFStringDelete(theString: CFMutableStringRef; range: CFRange); cdecl;
  external libCoreFoundation name _PU + 'CFStringDelete';
procedure CFStringReplace(theString: CFMutableStringRef; range: CFRange;
  replacement: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFStringReplace';
procedure CFStringReplaceAll(theString: CFMutableStringRef;
  replacement: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFStringReplaceAll';
function CFStringFindAndReplace(theString: CFMutableStringRef;
  stringToFind: CFStringRef; replacementString: CFStringRef;
  rangeToSearch: CFRange; compareOptions: CFStringCompareFlags): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFStringFindAndReplace';
procedure CFStringSetExternalCharactersNoCopy(theString: CFMutableStringRef;
  chars: unsigned short *; length: CFIndex; capacity: CFIndex); cdecl;
  external libCoreFoundation name _PU + 'CFStringSetExternalCharactersNoCopy';
procedure CFStringPad(theString: CFMutableStringRef; padString: CFStringRef;
  length: CFIndex; indexIntoPad: CFIndex); cdecl;
  external libCoreFoundation name _PU + 'CFStringPad';
procedure CFStringTrim(theString: CFMutableStringRef; trimString: CFStringRef);
  cdecl; external libCoreFoundation name _PU + 'CFStringTrim';
procedure CFStringTrimWhitespace(theString: CFMutableStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFStringTrimWhitespace';
procedure CFStringLowercase(theString: CFMutableStringRef; locale: CFLocaleRef);
  cdecl; external libCoreFoundation name _PU + 'CFStringLowercase';
procedure CFStringUppercase(theString: CFMutableStringRef; locale: CFLocaleRef);
  cdecl; external libCoreFoundation name _PU + 'CFStringUppercase';
procedure CFStringCapitalize(theString: CFMutableStringRef;
  locale: CFLocaleRef); cdecl;
  external libCoreFoundation name _PU + 'CFStringCapitalize';
procedure CFStringNormalize(theString: CFMutableStringRef;
  theForm: CFStringNormalizationForm); cdecl;
  external libCoreFoundation name _PU + 'CFStringNormalize';
procedure CFStringFold(theString: CFMutableStringRef;
  theFlags: CFStringCompareFlags; theLocale: CFLocaleRef); cdecl;
  external libCoreFoundation name _PU + 'CFStringFold';
function CFStringTransform(&string: CFMutableStringRef; range: Pointer;
  transform: CFStringRef; reverse: Boolean): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFStringTransform';
function CFStringIsEncodingAvailable(encoding: CFStringEncoding): Boolean;
  cdecl; external libCoreFoundation name _PU + 'CFStringIsEncodingAvailable';
function CFStringGetListOfAvailableEncodings: PLongWord; cdecl;
  external libCoreFoundation name _PU + 'CFStringGetListOfAvailableEncodings';
function CFStringGetNameOfEncoding(encoding: CFStringEncoding): CFStringRef;
  cdecl; external libCoreFoundation name _PU + 'CFStringGetNameOfEncoding';
function CFStringConvertEncodingToNSStringEncoding(encoding: CFStringEncoding)
  : LongWord; cdecl; external libCoreFoundation name _PU +
  'CFStringConvertEncodingToNSStringEncoding';
function CFStringConvertNSStringEncodingToEncoding(encoding: LongWord)
  : CFStringEncoding; cdecl; external libCoreFoundation name _PU +
  'CFStringConvertNSStringEncodingToEncoding';
function CFStringConvertEncodingToWindowsCodepage(encoding: CFStringEncoding)
  : UInt32; cdecl; external libCoreFoundation name _PU +
  'CFStringConvertEncodingToWindowsCodepage';
function CFStringConvertWindowsCodepageToEncoding(codepage: UInt32)
  : CFStringEncoding; cdecl; external libCoreFoundation name _PU +
  'CFStringConvertWindowsCodepageToEncoding';
function CFStringConvertIANACharSetNameToEncoding(theString: CFStringRef)
  : CFStringEncoding; cdecl; external libCoreFoundation name _PU +
  'CFStringConvertIANACharSetNameToEncoding';
function CFStringConvertEncodingToIANACharSetName(encoding: CFStringEncoding)
  : CFStringRef; cdecl; external libCoreFoundation name _PU +
  'CFStringConvertEncodingToIANACharSetName';
function CFStringGetMostCompatibleMacStringEncoding(encoding: CFStringEncoding)
  : CFStringEncoding; cdecl; external libCoreFoundation name _PU +
  'CFStringGetMostCompatibleMacStringEncoding';
procedure CFStringInitInlineBuffer(str: CFStringRef; buf: Pointer;
  range: CFRange); cdecl; external libCoreFoundation name _PU +
  'CFStringInitInlineBuffer';
function CFStringGetCharacterFromInlineBuffer(buf: Pointer; idx: CFIndex)
  : UniChar; cdecl; external libCoreFoundation name _PU +
  'CFStringGetCharacterFromInlineBuffer';
function CFStringIsSurrogateHighCharacter(character: UniChar): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFStringIsSurrogateHighCharacter';
function CFStringIsSurrogateLowCharacter(character: UniChar): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFStringIsSurrogateLowCharacter';
function CFStringGetLongCharacterForSurrogatePair(surrogateHigh: UniChar;
  surrogateLow: UniChar): UTF32Char; cdecl;
  external libCoreFoundation name _PU +
  'CFStringGetLongCharacterForSurrogatePair';
function CFStringGetSurrogatePairForLongCharacter(character: UTF32Char;
  surrogates: unsigned short * ): Boolean; cdecl;
  external libCoreFoundation name _PU +
  'CFStringGetSurrogatePairForLongCharacter';
procedure CFShow(obj: CFTypeRef); cdecl;
  external libCoreFoundation name _PU + 'CFShow';
procedure CFShowStr(str: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFShowStr';
function __CFStringMakeConstantString(cStr: MarshaledAString): CFStringRef;
  cdecl; external libCoreFoundation name _PU + '__CFStringMakeConstantString';
function CFAttributedStringGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFAttributedStringGetTypeID';
function CFAttributedStringCreate(alloc: CFAllocatorRef; str: CFStringRef;
  attributes: CFDictionaryRef): CFAttributedStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFAttributedStringCreate';
function CFAttributedStringCreateWithSubstring(alloc: CFAllocatorRef;
  aStr: CFAttributedStringRef; range: CFRange): CFAttributedStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFAttributedStringCreateWithSubstring';
function CFAttributedStringCreateCopy(alloc: CFAllocatorRef;
  aStr: CFAttributedStringRef): CFAttributedStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFAttributedStringCreateCopy';
function CFAttributedStringGetString(aStr: CFAttributedStringRef): CFStringRef;
  cdecl; external libCoreFoundation name _PU + 'CFAttributedStringGetString';
function CFAttributedStringGetLength(aStr: CFAttributedStringRef): CFIndex;
  cdecl; external libCoreFoundation name _PU + 'CFAttributedStringGetLength';
function CFAttributedStringGetAttributes(aStr: CFAttributedStringRef;
  loc: CFIndex; effectiveRange: Pointer): CFDictionaryRef; cdecl;
  external libCoreFoundation name _PU + 'CFAttributedStringGetAttributes';
function CFAttributedStringGetAttribute(aStr: CFAttributedStringRef;
  loc: CFIndex; attrName: CFStringRef; effectiveRange: Pointer): CFTypeRef;
  cdecl; external libCoreFoundation name _PU + 'CFAttributedStringGetAttribute';
function CFAttributedStringGetAttributesAndLongestEffectiveRange
  (aStr: CFAttributedStringRef; loc: CFIndex; inRange: CFRange;
  longestEffectiveRange: Pointer): CFDictionaryRef; cdecl;
  external libCoreFoundation name _PU +
  'CFAttributedStringGetAttributesAndLongestEffectiveRange';
function CFAttributedStringGetAttributeAndLongestEffectiveRange
  (aStr: CFAttributedStringRef; loc: CFIndex; attrName: CFStringRef;
  inRange: CFRange; longestEffectiveRange: Pointer): CFTypeRef; cdecl;
  external libCoreFoundation name _PU +
  'CFAttributedStringGetAttributeAndLongestEffectiveRange';
function CFAttributedStringCreateMutableCopy(alloc: CFAllocatorRef;
  maxLength: CFIndex; aStr: CFAttributedStringRef)
  : CFMutableAttributedStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFAttributedStringCreateMutableCopy';
function CFAttributedStringCreateMutable(alloc: CFAllocatorRef;
  maxLength: CFIndex): CFMutableAttributedStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFAttributedStringCreateMutable';
procedure CFAttributedStringReplaceString(aStr: CFMutableAttributedStringRef;
  range: CFRange; replacement: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFAttributedStringReplaceString';
function CFAttributedStringGetMutableString(aStr: CFMutableAttributedStringRef)
  : CFMutableStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFAttributedStringGetMutableString';
procedure CFAttributedStringSetAttributes(aStr: CFMutableAttributedStringRef;
  range: CFRange; replacement: CFDictionaryRef; clearOtherAttributes: Boolean);
  cdecl; external libCoreFoundation name _PU +
  'CFAttributedStringSetAttributes';
procedure CFAttributedStringSetAttribute(aStr: CFMutableAttributedStringRef;
  range: CFRange; attrName: CFStringRef; value: CFTypeRef); cdecl;
  external libCoreFoundation name _PU + 'CFAttributedStringSetAttribute';
procedure CFAttributedStringRemoveAttribute(aStr: CFMutableAttributedStringRef;
  range: CFRange; attrName: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFAttributedStringRemoveAttribute';
procedure CFAttributedStringReplaceAttributedString
  (aStr: CFMutableAttributedStringRef; range: CFRange;
  replacement: CFAttributedStringRef); cdecl;
  external libCoreFoundation name _PU +
  'CFAttributedStringReplaceAttributedString';
procedure CFAttributedStringBeginEditing(aStr: CFMutableAttributedStringRef);
  cdecl; external libCoreFoundation name _PU + 'CFAttributedStringBeginEditing';
procedure CFAttributedStringEndEditing(aStr: CFMutableAttributedStringRef);
  cdecl; external libCoreFoundation name _PU + 'CFAttributedStringEndEditing';
function CFBagGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFBagGetTypeID';
function CFBagCreate(allocator: CFAllocatorRef; values: Pointer;
  numValues: CFIndex; callBacks: Pointer): CFBagRef; cdecl;
  external libCoreFoundation name _PU + 'CFBagCreate';
function CFBagCreateCopy(allocator: CFAllocatorRef; theBag: CFBagRef): CFBagRef;
  cdecl; external libCoreFoundation name _PU + 'CFBagCreateCopy';
function CFBagCreateMutable(allocator: CFAllocatorRef; capacity: CFIndex;
  callBacks: Pointer): CFMutableBagRef; cdecl;
  external libCoreFoundation name _PU + 'CFBagCreateMutable';
function CFBagCreateMutableCopy(allocator: CFAllocatorRef; capacity: CFIndex;
  theBag: CFBagRef): CFMutableBagRef; cdecl;
  external libCoreFoundation name _PU + 'CFBagCreateMutableCopy';
function CFBagGetCount(theBag: CFBagRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFBagGetCount';
function CFBagGetCountOfValue(theBag: CFBagRef; value: Pointer): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFBagGetCountOfValue';
function CFBagContainsValue(theBag: CFBagRef; value: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFBagContainsValue';
function CFBagGetValue(theBag: CFBagRef; value: Pointer): Pointer; cdecl;
  external libCoreFoundation name _PU + 'CFBagGetValue';
function CFBagGetValueIfPresent(theBag: CFBagRef; candidate: Pointer;
  value: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFBagGetValueIfPresent';
procedure CFBagGetValues(theBag: CFBagRef; values: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFBagGetValues';
procedure CFBagApplyFunction(theBag: CFBagRef; applier: CFBagApplierFunction;
  context: Pointer); cdecl; external libCoreFoundation name _PU +
  'CFBagApplyFunction';
procedure CFBagAddValue(theBag: CFMutableBagRef; value: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFBagAddValue';
procedure CFBagReplaceValue(theBag: CFMutableBagRef; value: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFBagReplaceValue';
procedure CFBagSetValue(theBag: CFMutableBagRef; value: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFBagSetValue';
procedure CFBagRemoveValue(theBag: CFMutableBagRef; value: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFBagRemoveValue';
procedure CFBagRemoveAllValues(theBag: CFMutableBagRef); cdecl;
  external libCoreFoundation name _PU + 'CFBagRemoveAllValues';
function CFBinaryHeapGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFBinaryHeapGetTypeID';
function CFBinaryHeapCreate(allocator: CFAllocatorRef; capacity: CFIndex;
  callBacks: Pointer; compareContext: Pointer): CFBinaryHeapRef; cdecl;
  external libCoreFoundation name _PU + 'CFBinaryHeapCreate';
function CFBinaryHeapCreateCopy(allocator: CFAllocatorRef; capacity: CFIndex;
  heap: CFBinaryHeapRef): CFBinaryHeapRef; cdecl;
  external libCoreFoundation name _PU + 'CFBinaryHeapCreateCopy';
function CFBinaryHeapGetCount(heap: CFBinaryHeapRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFBinaryHeapGetCount';
function CFBinaryHeapGetCountOfValue(heap: CFBinaryHeapRef; value: Pointer)
  : CFIndex; cdecl; external libCoreFoundation name _PU +
  'CFBinaryHeapGetCountOfValue';
function CFBinaryHeapContainsValue(heap: CFBinaryHeapRef; value: Pointer)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFBinaryHeapContainsValue';
function CFBinaryHeapGetMinimum(heap: CFBinaryHeapRef): Pointer; cdecl;
  external libCoreFoundation name _PU + 'CFBinaryHeapGetMinimum';
function CFBinaryHeapGetMinimumIfPresent(heap: CFBinaryHeapRef; value: Pointer)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFBinaryHeapGetMinimumIfPresent';
procedure CFBinaryHeapGetValues(heap: CFBinaryHeapRef; values: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFBinaryHeapGetValues';
procedure CFBinaryHeapApplyFunction(heap: CFBinaryHeapRef;
  applier: CFBinaryHeapApplierFunction; context: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFBinaryHeapApplyFunction';
procedure CFBinaryHeapAddValue(heap: CFBinaryHeapRef; value: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFBinaryHeapAddValue';
procedure CFBinaryHeapRemoveMinimumValue(heap: CFBinaryHeapRef); cdecl;
  external libCoreFoundation name _PU + 'CFBinaryHeapRemoveMinimumValue';
procedure CFBinaryHeapRemoveAllValues(heap: CFBinaryHeapRef); cdecl;
  external libCoreFoundation name _PU + 'CFBinaryHeapRemoveAllValues';
function CFBitVectorGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFBitVectorGetTypeID';
function CFBitVectorCreate(allocator: CFAllocatorRef; bytes: PByte;
  numBits: CFIndex): CFBitVectorRef; cdecl;
  external libCoreFoundation name _PU + 'CFBitVectorCreate';
function CFBitVectorCreateCopy(allocator: CFAllocatorRef; bv: CFBitVectorRef)
  : CFBitVectorRef; cdecl; external libCoreFoundation name _PU +
  'CFBitVectorCreateCopy';
function CFBitVectorCreateMutable(allocator: CFAllocatorRef; capacity: CFIndex)
  : CFMutableBitVectorRef; cdecl;
  external libCoreFoundation name _PU + 'CFBitVectorCreateMutable';
function CFBitVectorCreateMutableCopy(allocator: CFAllocatorRef;
  capacity: CFIndex; bv: CFBitVectorRef): CFMutableBitVectorRef; cdecl;
  external libCoreFoundation name _PU + 'CFBitVectorCreateMutableCopy';
function CFBitVectorGetCount(bv: CFBitVectorRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFBitVectorGetCount';
function CFBitVectorGetCountOfBit(bv: CFBitVectorRef; range: CFRange;
  value: CFBit): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFBitVectorGetCountOfBit';
function CFBitVectorContainsBit(bv: CFBitVectorRef; range: CFRange;
  value: CFBit): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFBitVectorContainsBit';
function CFBitVectorGetBitAtIndex(bv: CFBitVectorRef; idx: CFIndex): CFBit;
  cdecl; external libCoreFoundation name _PU + 'CFBitVectorGetBitAtIndex';
procedure CFBitVectorGetBits(bv: CFBitVectorRef; range: CFRange; bytes: PByte);
  cdecl; external libCoreFoundation name _PU + 'CFBitVectorGetBits';
function CFBitVectorGetFirstIndexOfBit(bv: CFBitVectorRef; range: CFRange;
  value: CFBit): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFBitVectorGetFirstIndexOfBit';
function CFBitVectorGetLastIndexOfBit(bv: CFBitVectorRef; range: CFRange;
  value: CFBit): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFBitVectorGetLastIndexOfBit';
procedure CFBitVectorSetCount(bv: CFMutableBitVectorRef; count: CFIndex); cdecl;
  external libCoreFoundation name _PU + 'CFBitVectorSetCount';
procedure CFBitVectorFlipBitAtIndex(bv: CFMutableBitVectorRef; idx: CFIndex);
  cdecl; external libCoreFoundation name _PU + 'CFBitVectorFlipBitAtIndex';
procedure CFBitVectorFlipBits(bv: CFMutableBitVectorRef; range: CFRange); cdecl;
  external libCoreFoundation name _PU + 'CFBitVectorFlipBits';
procedure CFBitVectorSetBitAtIndex(bv: CFMutableBitVectorRef; idx: CFIndex;
  value: CFBit); cdecl; external libCoreFoundation name _PU +
  'CFBitVectorSetBitAtIndex';
procedure CFBitVectorSetBits(bv: CFMutableBitVectorRef; range: CFRange;
  value: CFBit); cdecl; external libCoreFoundation name _PU +
  'CFBitVectorSetBits';
procedure CFBitVectorSetAllBits(bv: CFMutableBitVectorRef; value: CFBit); cdecl;
  external libCoreFoundation name _PU + 'CFBitVectorSetAllBits';
function CFErrorGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFErrorGetTypeID';
function CFErrorCreate(allocator: CFAllocatorRef; domain: CFStringRef;
  code: CFIndex; userInfo: CFDictionaryRef): CFErrorRef; cdecl;
  external libCoreFoundation name _PU + 'CFErrorCreate';
function CFErrorCreateWithUserInfoKeysAndValues(allocator: CFAllocatorRef;
  domain: CFStringRef; code: CFIndex; userInfoKeys: Pointer;
  userInfoValues: Pointer; numUserInfoValues: CFIndex): CFErrorRef; cdecl;
  external libCoreFoundation name _PU +
  'CFErrorCreateWithUserInfoKeysAndValues';
function CFErrorGetDomain(err: CFErrorRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFErrorGetDomain';
function CFErrorGetCode(err: CFErrorRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFErrorGetCode';
function CFErrorCopyUserInfo(err: CFErrorRef): CFDictionaryRef; cdecl;
  external libCoreFoundation name _PU + 'CFErrorCopyUserInfo';
function CFErrorCopyDescription(err: CFErrorRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFErrorCopyDescription';
function CFErrorCopyFailureReason(err: CFErrorRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFErrorCopyFailureReason';
function CFErrorCopyRecoverySuggestion(err: CFErrorRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFErrorCopyRecoverySuggestion';
function CFURLGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFURLGetTypeID';
function CFURLCreateWithBytes(allocator: CFAllocatorRef; URLBytes: PByte;
  length: CFIndex; encoding: CFStringEncoding; baseURL: CFURLRef): CFURLRef;
  cdecl; external libCoreFoundation name _PU + 'CFURLCreateWithBytes';
function CFURLCreateData(allocator: CFAllocatorRef; url: CFURLRef;
  encoding: CFStringEncoding; escapeWhitespace: Boolean): CFDataRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCreateData';
function CFURLCreateWithString(allocator: CFAllocatorRef;
  URLString: CFStringRef; baseURL: CFURLRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCreateWithString';
function CFURLCreateAbsoluteURLWithBytes(alloc: CFAllocatorRef;
  relativeURLBytes: PByte; length: CFIndex; encoding: CFStringEncoding;
  baseURL: CFURLRef; useCompatibilityMode: Boolean): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCreateAbsoluteURLWithBytes';
function CFURLCreateWithFileSystemPath(allocator: CFAllocatorRef;
  filePath: CFStringRef; pathStyle: CFURLPathStyle; isDirectory: Boolean)
  : CFURLRef; cdecl; external libCoreFoundation name _PU +
  'CFURLCreateWithFileSystemPath';
function CFURLCreateFromFileSystemRepresentation(allocator: CFAllocatorRef;
  buffer: PByte; bufLen: CFIndex; isDirectory: Boolean): CFURLRef; cdecl;
  external libCoreFoundation name _PU +
  'CFURLCreateFromFileSystemRepresentation';
function CFURLCreateWithFileSystemPathRelativeToBase(allocator: CFAllocatorRef;
  filePath: CFStringRef; pathStyle: CFURLPathStyle; isDirectory: Boolean;
  baseURL: CFURLRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU +
  'CFURLCreateWithFileSystemPathRelativeToBase';
function CFURLCreateFromFileSystemRepresentationRelativeToBase
  (allocator: CFAllocatorRef; buffer: PByte; bufLen: CFIndex;
  isDirectory: Boolean; baseURL: CFURLRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU +
  'CFURLCreateFromFileSystemRepresentationRelativeToBase';
function CFURLGetFileSystemRepresentation(url: CFURLRef;
  resolveAgainstBase: Boolean; buffer: PByte; maxBufLen: CFIndex): Boolean;
  cdecl; external libCoreFoundation name _PU +
  'CFURLGetFileSystemRepresentation';
function CFURLCopyAbsoluteURL(relativeURL: CFURLRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyAbsoluteURL';
function CFURLGetString(anURL: CFURLRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLGetString';
function CFURLGetBaseURL(anURL: CFURLRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLGetBaseURL';
function CFURLCanBeDecomposed(anURL: CFURLRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFURLCanBeDecomposed';
function CFURLCopyScheme(anURL: CFURLRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyScheme';
function CFURLCopyNetLocation(anURL: CFURLRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyNetLocation';
function CFURLCopyPath(anURL: CFURLRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyPath';
function CFURLCopyStrictPath(anURL: CFURLRef; isAbsolute: PByte): CFStringRef;
  cdecl; external libCoreFoundation name _PU + 'CFURLCopyStrictPath';
function CFURLCopyFileSystemPath(anURL: CFURLRef; pathStyle: CFURLPathStyle)
  : CFStringRef; cdecl; external libCoreFoundation name _PU +
  'CFURLCopyFileSystemPath';
function CFURLHasDirectoryPath(anURL: CFURLRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFURLHasDirectoryPath';
function CFURLCopyResourceSpecifier(anURL: CFURLRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyResourceSpecifier';
function CFURLCopyHostName(anURL: CFURLRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyHostName';
function CFURLGetPortNumber(anURL: CFURLRef): Int32; cdecl;
  external libCoreFoundation name _PU + 'CFURLGetPortNumber';
function CFURLCopyUserName(anURL: CFURLRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyUserName';
function CFURLCopyPassword(anURL: CFURLRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyPassword';
function CFURLCopyParameterString(anURL: CFURLRef;
  charactersToLeaveEscaped: CFStringRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyParameterString';
function CFURLCopyQueryString(anURL: CFURLRef;
  charactersToLeaveEscaped: CFStringRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyQueryString';
function CFURLCopyFragment(anURL: CFURLRef;
  charactersToLeaveEscaped: CFStringRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyFragment';
function CFURLCopyLastPathComponent(url: CFURLRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyLastPathComponent';
function CFURLCopyPathExtension(url: CFURLRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyPathExtension';
function CFURLCreateCopyAppendingPathComponent(allocator: CFAllocatorRef;
  url: CFURLRef; pathComponent: CFStringRef; isDirectory: Boolean): CFURLRef;
  cdecl; external libCoreFoundation name _PU +
  'CFURLCreateCopyAppendingPathComponent';
function CFURLCreateCopyDeletingLastPathComponent(allocator: CFAllocatorRef;
  url: CFURLRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU +
  'CFURLCreateCopyDeletingLastPathComponent';
function CFURLCreateCopyAppendingPathExtension(allocator: CFAllocatorRef;
  url: CFURLRef; extension: CFStringRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCreateCopyAppendingPathExtension';
function CFURLCreateCopyDeletingPathExtension(allocator: CFAllocatorRef;
  url: CFURLRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCreateCopyDeletingPathExtension';
function CFURLGetBytes(url: CFURLRef; buffer: PByte; bufferLength: CFIndex)
  : CFIndex; cdecl; external libCoreFoundation name _PU + 'CFURLGetBytes';
function CFURLGetByteRangeForComponent(url: CFURLRef;
  component: CFURLComponentType; rangeIncludingSeparators: Pointer): CFRange;
  cdecl; external libCoreFoundation name _PU + 'CFURLGetByteRangeForComponent';
function CFURLCreateStringByReplacingPercentEscapes(allocator: CFAllocatorRef;
  originalString: CFStringRef; charactersToLeaveEscaped: CFStringRef)
  : CFStringRef; cdecl; external libCoreFoundation name _PU +
  'CFURLCreateStringByReplacingPercentEscapes';
function CFURLCreateStringByReplacingPercentEscapesUsingEncoding
  (allocator: CFAllocatorRef; origString: CFStringRef;
  charsToLeaveEscaped: CFStringRef; encoding: CFStringEncoding): CFStringRef;
  cdecl; external libCoreFoundation name _PU +
  'CFURLCreateStringByReplacingPercentEscapesUsingEncoding';
function CFURLCreateStringByAddingPercentEscapes(allocator: CFAllocatorRef;
  originalString: CFStringRef; charactersToLeaveUnescaped: CFStringRef;
  legalURLCharactersToBeEscaped: CFStringRef; encoding: CFStringEncoding)
  : CFStringRef; cdecl; external libCoreFoundation name _PU +
  'CFURLCreateStringByAddingPercentEscapes';
function CFURLIsFileReferenceURL(url: CFURLRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFURLIsFileReferenceURL';
function CFURLCreateFileReferenceURL(allocator: CFAllocatorRef; url: CFURLRef;
  error: Pointer): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCreateFileReferenceURL';
function CFURLCreateFilePathURL(allocator: CFAllocatorRef; url: CFURLRef;
  error: Pointer): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCreateFilePathURL';
function CFURLCreateFromFSRef(allocator: CFAllocatorRef; fsRef: Pointer)
  : CFURLRef; cdecl; external libCoreFoundation name _PU +
  'CFURLCreateFromFSRef';
function CFURLGetFSRef(url: CFURLRef; fsRef: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFURLGetFSRef';
function CFURLCopyResourcePropertyForKey(url: CFURLRef; key: CFStringRef;
  propertyValueTypeRefPtr: Pointer; error: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyResourcePropertyForKey';
function CFURLCopyResourcePropertiesForKeys(url: CFURLRef; keys: CFArrayRef;
  error: Pointer): CFDictionaryRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCopyResourcePropertiesForKeys';
function CFURLSetResourcePropertyForKey(url: CFURLRef; key: CFStringRef;
  propertyValue: CFTypeRef; error: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFURLSetResourcePropertyForKey';
function CFURLSetResourcePropertiesForKeys(url: CFURLRef;
  keyedPropertyValues: CFDictionaryRef; error: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFURLSetResourcePropertiesForKeys';
procedure CFURLClearResourcePropertyCacheForKey(url: CFURLRef;
  key: CFStringRef); cdecl; external libCoreFoundation name _PU +
  'CFURLClearResourcePropertyCacheForKey';
procedure CFURLClearResourcePropertyCache(url: CFURLRef); cdecl;
  external libCoreFoundation name _PU + 'CFURLClearResourcePropertyCache';
procedure CFURLSetTemporaryResourcePropertyForKey(url: CFURLRef;
  key: CFStringRef; propertyValue: CFTypeRef); cdecl;
  external libCoreFoundation name _PU +
  'CFURLSetTemporaryResourcePropertyForKey';
function CFURLResourceIsReachable(url: CFURLRef; error: Pointer): Boolean;
  cdecl; external libCoreFoundation name _PU + 'CFURLResourceIsReachable';
function CFURLCreateBookmarkData(allocator: CFAllocatorRef; url: CFURLRef;
  options: CFURLBookmarkCreationOptions;
  resourcePropertiesToInclude: CFArrayRef; relativeToURL: CFURLRef;
  error: Pointer): CFDataRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCreateBookmarkData';
function CFURLCreateByResolvingBookmarkData(allocator: CFAllocatorRef;
  bookmark: CFDataRef; options: CFURLBookmarkResolutionOptions;
  relativeToURL: CFURLRef; resourcePropertiesToInclude: CFArrayRef;
  isStale: PByte; error: Pointer): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCreateByResolvingBookmarkData';
function CFURLCreateResourcePropertiesForKeysFromBookmarkData
  (allocator: CFAllocatorRef; resourcePropertiesToReturn: CFArrayRef;
  bookmark: CFDataRef): CFDictionaryRef; cdecl;
  external libCoreFoundation name _PU +
  'CFURLCreateResourcePropertiesForKeysFromBookmarkData';
function CFURLCreateResourcePropertyForKeyFromBookmarkData
  (allocator: CFAllocatorRef; resourcePropertyKey: CFStringRef;
  bookmark: CFDataRef): CFTypeRef; cdecl;
  external libCoreFoundation name _PU +
  'CFURLCreateResourcePropertyForKeyFromBookmarkData';
function CFURLCreateBookmarkDataFromFile(allocator: CFAllocatorRef;
  fileURL: CFURLRef; errorRef: Pointer): CFDataRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCreateBookmarkDataFromFile';
function CFURLWriteBookmarkDataToFile(bookmarkRef: CFDataRef; fileURL: CFURLRef;
  options: CFURLBookmarkFileCreationOptions; errorRef: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFURLWriteBookmarkDataToFile';
function CFURLCreateBookmarkDataFromAliasRecord(allocatorRef: CFAllocatorRef;
  aliasRecordDataRef: CFDataRef): CFDataRef; cdecl;
  external libCoreFoundation name _PU +
  'CFURLCreateBookmarkDataFromAliasRecord';
function CFURLStartAccessingSecurityScopedResource(url: CFURLRef): Boolean;
  cdecl; external libCoreFoundation name _PU +
  'CFURLStartAccessingSecurityScopedResource';
procedure CFURLStopAccessingSecurityScopedResource(url: CFURLRef); cdecl;
  external libCoreFoundation name _PU +
  'CFURLStopAccessingSecurityScopedResource';
function CFBundleGetMainBundle: CFBundleRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetMainBundle';
function CFBundleGetBundleWithIdentifier(bundleID: CFStringRef): CFBundleRef;
  cdecl; external libCoreFoundation name _PU +
  'CFBundleGetBundleWithIdentifier';
function CFBundleGetAllBundles: CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetAllBundles';
function CFBundleGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetTypeID';
function CFBundleCreate(allocator: CFAllocatorRef; bundleURL: CFURLRef)
  : CFBundleRef; cdecl; external libCoreFoundation name _PU + 'CFBundleCreate';
function CFBundleCreateBundlesFromDirectory(allocator: CFAllocatorRef;
  directoryURL: CFURLRef; bundleType: CFStringRef): CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleCreateBundlesFromDirectory';
function CFBundleCopyBundleURL(bundle: CFBundleRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleCopyBundleURL';
function CFBundleGetValueForInfoDictionaryKey(bundle: CFBundleRef;
  key: CFStringRef): CFTypeRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetValueForInfoDictionaryKey';
function CFBundleGetInfoDictionary(bundle: CFBundleRef): CFDictionaryRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetInfoDictionary';
function CFBundleGetLocalInfoDictionary(bundle: CFBundleRef): CFDictionaryRef;
  cdecl; external libCoreFoundation name _PU + 'CFBundleGetLocalInfoDictionary';
procedure CFBundleGetPackageInfo(bundle: CFBundleRef; packageType: PLongWord;
  packageCreator: PLongWord); cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetPackageInfo';
function CFBundleGetIdentifier(bundle: CFBundleRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetIdentifier';
function CFBundleGetVersionNumber(bundle: CFBundleRef): UInt32; cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetVersionNumber';
function CFBundleGetDevelopmentRegion(bundle: CFBundleRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetDevelopmentRegion';
function CFBundleCopySupportFilesDirectoryURL(bundle: CFBundleRef): CFURLRef;
  cdecl; external libCoreFoundation name _PU +
  'CFBundleCopySupportFilesDirectoryURL';
function CFBundleCopyResourcesDirectoryURL(bundle: CFBundleRef): CFURLRef;
  cdecl; external libCoreFoundation name _PU +
  'CFBundleCopyResourcesDirectoryURL';
function CFBundleCopyPrivateFrameworksURL(bundle: CFBundleRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleCopyPrivateFrameworksURL';
function CFBundleCopySharedFrameworksURL(bundle: CFBundleRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleCopySharedFrameworksURL';
function CFBundleCopySharedSupportURL(bundle: CFBundleRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleCopySharedSupportURL';
function CFBundleCopyBuiltInPlugInsURL(bundle: CFBundleRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleCopyBuiltInPlugInsURL';
function CFBundleCopyInfoDictionaryInDirectory(bundleURL: CFURLRef)
  : CFDictionaryRef; cdecl; external libCoreFoundation name _PU +
  'CFBundleCopyInfoDictionaryInDirectory';
function CFBundleGetPackageInfoInDirectory(url: CFURLRef;
  packageType: PLongWord; packageCreator: PLongWord): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetPackageInfoInDirectory';
function CFBundleCopyResourceURL(bundle: CFBundleRef; resourceName: CFStringRef;
  resourceType: CFStringRef; subDirName: CFStringRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleCopyResourceURL';
function CFBundleCopyResourceURLsOfType(bundle: CFBundleRef;
  resourceType: CFStringRef; subDirName: CFStringRef): CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleCopyResourceURLsOfType';
function CFBundleCopyLocalizedString(bundle: CFBundleRef; key: CFStringRef;
  value: CFStringRef; tableName: CFStringRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleCopyLocalizedString';
function CFBundleCopyResourceURLInDirectory(bundleURL: CFURLRef;
  resourceName: CFStringRef; resourceType: CFStringRef; subDirName: CFStringRef)
  : CFURLRef; cdecl; external libCoreFoundation name _PU +
  'CFBundleCopyResourceURLInDirectory';
function CFBundleCopyResourceURLsOfTypeInDirectory(bundleURL: CFURLRef;
  resourceType: CFStringRef; subDirName: CFStringRef): CFArrayRef; cdecl;
  external libCoreFoundation name _PU +
  'CFBundleCopyResourceURLsOfTypeInDirectory';
function CFBundleCopyBundleLocalizations(bundle: CFBundleRef): CFArrayRef;
  cdecl; external libCoreFoundation name _PU +
  'CFBundleCopyBundleLocalizations';
function CFBundleCopyPreferredLocalizationsFromArray(locArray: CFArrayRef)
  : CFArrayRef; cdecl; external libCoreFoundation name _PU +
  'CFBundleCopyPreferredLocalizationsFromArray';
function CFBundleCopyLocalizationsForPreferences(locArray: CFArrayRef;
  prefArray: CFArrayRef): CFArrayRef; cdecl;
  external libCoreFoundation name _PU +
  'CFBundleCopyLocalizationsForPreferences';
function CFBundleCopyResourceURLForLocalization(bundle: CFBundleRef;
  resourceName: CFStringRef; resourceType: CFStringRef; subDirName: CFStringRef;
  localizationName: CFStringRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU +
  'CFBundleCopyResourceURLForLocalization';
function CFBundleCopyResourceURLsOfTypeForLocalization(bundle: CFBundleRef;
  resourceType: CFStringRef; subDirName: CFStringRef;
  localizationName: CFStringRef): CFArrayRef; cdecl;
  external libCoreFoundation name _PU +
  'CFBundleCopyResourceURLsOfTypeForLocalization';
function CFBundleCopyInfoDictionaryForURL(url: CFURLRef): CFDictionaryRef;
  cdecl; external libCoreFoundation name _PU +
  'CFBundleCopyInfoDictionaryForURL';
function CFBundleCopyLocalizationsForURL(url: CFURLRef): CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleCopyLocalizationsForURL';
function CFBundleCopyExecutableArchitecturesForURL(url: CFURLRef): CFArrayRef;
  cdecl; external libCoreFoundation name _PU +
  'CFBundleCopyExecutableArchitecturesForURL';
function CFBundleCopyExecutableURL(bundle: CFBundleRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleCopyExecutableURL';
function CFBundleCopyExecutableArchitectures(bundle: CFBundleRef): CFArrayRef;
  cdecl; external libCoreFoundation name _PU +
  'CFBundleCopyExecutableArchitectures';
function CFBundlePreflightExecutable(bundle: CFBundleRef; error: Pointer)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFBundlePreflightExecutable';
function CFBundleLoadExecutableAndReturnError(bundle: CFBundleRef;
  error: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFBundleLoadExecutableAndReturnError';
function CFBundleLoadExecutable(bundle: CFBundleRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFBundleLoadExecutable';
function CFBundleIsExecutableLoaded(bundle: CFBundleRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFBundleIsExecutableLoaded';
procedure CFBundleUnloadExecutable(bundle: CFBundleRef); cdecl;
  external libCoreFoundation name _PU + 'CFBundleUnloadExecutable';
function CFBundleGetFunctionPointerForName(bundle: CFBundleRef;
  functionName: CFStringRef): Pointer; cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetFunctionPointerForName';
procedure CFBundleGetFunctionPointersForNames(bundle: CFBundleRef;
  functionNames: CFArrayRef; ftbl: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetFunctionPointersForNames';
function CFBundleGetDataPointerForName(bundle: CFBundleRef;
  symbolName: CFStringRef): Pointer; cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetDataPointerForName';
procedure CFBundleGetDataPointersForNames(bundle: CFBundleRef;
  symbolNames: CFArrayRef; stbl: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetDataPointersForNames';
function CFBundleCopyAuxiliaryExecutableURL(bundle: CFBundleRef;
  executableName: CFStringRef): CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleCopyAuxiliaryExecutableURL';
function CFBundleGetPlugIn(bundle: CFBundleRef): CFPlugInRef; cdecl;
  external libCoreFoundation name _PU + 'CFBundleGetPlugIn';
function CFBundleOpenBundleResourceMap(bundle: CFBundleRef): CFBundleRefNum;
  cdecl; external libCoreFoundation name _PU + 'CFBundleOpenBundleResourceMap';
function CFBundleOpenBundleResourceFiles(bundle: CFBundleRef; refNum: PSmallInt;
  localizedRefNum: PSmallInt): Int32; cdecl;
  external libCoreFoundation name _PU + 'CFBundleOpenBundleResourceFiles';
procedure CFBundleCloseBundleResourceMap(bundle: CFBundleRef;
  refNum: CFBundleRefNum); cdecl;
  external libCoreFoundation name _PU + 'CFBundleCloseBundleResourceMap';
function CFByteOrderGetCurrent: CFByteOrder; cdecl;
  external libCoreFoundation name _PU + 'CFByteOrderGetCurrent';
function CFSwapInt16(arg: Word): Word; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt16';
function CFSwapInt32(arg: LongWord): LongWord; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt32';
function CFSwapInt64(arg: UInt64): UInt64; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt64';
function CFSwapInt16BigToHost(arg: Word): Word; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt16BigToHost';
function CFSwapInt32BigToHost(arg: LongWord): LongWord; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt32BigToHost';
function CFSwapInt64BigToHost(arg: UInt64): UInt64; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt64BigToHost';
function CFSwapInt16HostToBig(arg: Word): Word; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt16HostToBig';
function CFSwapInt32HostToBig(arg: LongWord): LongWord; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt32HostToBig';
function CFSwapInt64HostToBig(arg: UInt64): UInt64; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt64HostToBig';
function CFSwapInt16LittleToHost(arg: Word): Word; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt16LittleToHost';
function CFSwapInt32LittleToHost(arg: LongWord): LongWord; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt32LittleToHost';
function CFSwapInt64LittleToHost(arg: UInt64): UInt64; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt64LittleToHost';
function CFSwapInt16HostToLittle(arg: Word): Word; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt16HostToLittle';
function CFSwapInt32HostToLittle(arg: LongWord): LongWord; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt32HostToLittle';
function CFSwapInt64HostToLittle(arg: UInt64): UInt64; cdecl;
  external libCoreFoundation name _PU + 'CFSwapInt64HostToLittle';
function CFConvertFloat32HostToSwapped(arg: Single): CFSwappedFloat32; cdecl;
  external libCoreFoundation name _PU + 'CFConvertFloat32HostToSwapped';
function CFConvertFloat32SwappedToHost(arg: CFSwappedFloat32): Single; cdecl;
  external libCoreFoundation name _PU + 'CFConvertFloat32SwappedToHost';
function CFConvertFloat64HostToSwapped(arg: Double): CFSwappedFloat64; cdecl;
  external libCoreFoundation name _PU + 'CFConvertFloat64HostToSwapped';
function CFConvertFloat64SwappedToHost(arg: CFSwappedFloat64): Double; cdecl;
  external libCoreFoundation name _PU + 'CFConvertFloat64SwappedToHost';
function CFConvertFloatHostToSwapped(arg: Single): CFSwappedFloat32; cdecl;
  external libCoreFoundation name _PU + 'CFConvertFloatHostToSwapped';
function CFConvertFloatSwappedToHost(arg: CFSwappedFloat32): Single; cdecl;
  external libCoreFoundation name _PU + 'CFConvertFloatSwappedToHost';
function CFConvertDoubleHostToSwapped(arg: Double): CFSwappedFloat64; cdecl;
  external libCoreFoundation name _PU + 'CFConvertDoubleHostToSwapped';
function CFConvertDoubleSwappedToHost(arg: CFSwappedFloat64): Double; cdecl;
  external libCoreFoundation name _PU + 'CFConvertDoubleSwappedToHost';
function CFAbsoluteTimeGetCurrent: CFAbsoluteTime; cdecl;
  external libCoreFoundation name _PU + 'CFAbsoluteTimeGetCurrent';
function CFDateGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFDateGetTypeID';
function CFDateCreate(allocator: CFAllocatorRef; at: CFAbsoluteTime): CFDateRef;
  cdecl; external libCoreFoundation name _PU + 'CFDateCreate';
function CFDateGetAbsoluteTime(theDate: CFDateRef): CFAbsoluteTime; cdecl;
  external libCoreFoundation name _PU + 'CFDateGetAbsoluteTime';
function CFDateGetTimeIntervalSinceDate(theDate: CFDateRef;
  otherDate: CFDateRef): CFTimeInterval; cdecl;
  external libCoreFoundation name _PU + 'CFDateGetTimeIntervalSinceDate';
function CFDateCompare(theDate: CFDateRef; otherDate: CFDateRef;
  context: Pointer): CFComparisonResult; cdecl;
  external libCoreFoundation name _PU + 'CFDateCompare';
function CFGregorianDateIsValid(gdate: CFGregorianDate;
  unitFlags: CFOptionFlags): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFGregorianDateIsValid';
function CFGregorianDateGetAbsoluteTime(gdate: CFGregorianDate;
  tz: CFTimeZoneRef): CFAbsoluteTime; cdecl;
  external libCoreFoundation name _PU + 'CFGregorianDateGetAbsoluteTime';
function CFAbsoluteTimeGetGregorianDate(at: CFAbsoluteTime; tz: CFTimeZoneRef)
  : CFGregorianDate; cdecl; external libCoreFoundation name _PU +
  'CFAbsoluteTimeGetGregorianDate';
function CFAbsoluteTimeAddGregorianUnits(at: CFAbsoluteTime; tz: CFTimeZoneRef;
  units: CFGregorianUnits): CFAbsoluteTime; cdecl;
  external libCoreFoundation name _PU + 'CFAbsoluteTimeAddGregorianUnits';
function CFAbsoluteTimeGetDifferenceAsGregorianUnits(at1: CFAbsoluteTime;
  at2: CFAbsoluteTime; tz: CFTimeZoneRef; unitFlags: CFOptionFlags)
  : CFGregorianUnits; cdecl; external libCoreFoundation name _PU +
  'CFAbsoluteTimeGetDifferenceAsGregorianUnits';
function CFAbsoluteTimeGetDayOfWeek(at: CFAbsoluteTime; tz: CFTimeZoneRef)
  : Int32; cdecl; external libCoreFoundation name _PU +
  'CFAbsoluteTimeGetDayOfWeek';
function CFAbsoluteTimeGetDayOfYear(at: CFAbsoluteTime; tz: CFTimeZoneRef)
  : Int32; cdecl; external libCoreFoundation name _PU +
  'CFAbsoluteTimeGetDayOfYear';
function CFAbsoluteTimeGetWeekOfYear(at: CFAbsoluteTime; tz: CFTimeZoneRef)
  : Int32; cdecl; external libCoreFoundation name _PU +
  'CFAbsoluteTimeGetWeekOfYear';
function CFTimeZoneGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneGetTypeID';
function CFTimeZoneCopySystem: CFTimeZoneRef; cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneCopySystem';
procedure CFTimeZoneResetSystem; cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneResetSystem';
function CFTimeZoneCopyDefault: CFTimeZoneRef; cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneCopyDefault';
procedure CFTimeZoneSetDefault(tz: CFTimeZoneRef); cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneSetDefault';
function CFTimeZoneCopyKnownNames: CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneCopyKnownNames';
function CFTimeZoneCopyAbbreviationDictionary: CFDictionaryRef; cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneCopyAbbreviationDictionary';
procedure CFTimeZoneSetAbbreviationDictionary(dict: CFDictionaryRef); cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneSetAbbreviationDictionary';
function CFTimeZoneCreate(allocator: CFAllocatorRef; name: CFStringRef;
  data: CFDataRef): CFTimeZoneRef; cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneCreate';
function CFTimeZoneCreateWithTimeIntervalFromGMT(allocator: CFAllocatorRef;
  ti: CFTimeInterval): CFTimeZoneRef; cdecl;
  external libCoreFoundation name _PU +
  'CFTimeZoneCreateWithTimeIntervalFromGMT';
function CFTimeZoneCreateWithName(allocator: CFAllocatorRef; name: CFStringRef;
  tryAbbrev: Boolean): CFTimeZoneRef; cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneCreateWithName';
function CFTimeZoneGetName(tz: CFTimeZoneRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneGetName';
function CFTimeZoneGetData(tz: CFTimeZoneRef): CFDataRef; cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneGetData';
function CFTimeZoneGetSecondsFromGMT(tz: CFTimeZoneRef; at: CFAbsoluteTime)
  : CFTimeInterval; cdecl; external libCoreFoundation name _PU +
  'CFTimeZoneGetSecondsFromGMT';
function CFTimeZoneCopyAbbreviation(tz: CFTimeZoneRef; at: CFAbsoluteTime)
  : CFStringRef; cdecl; external libCoreFoundation name _PU +
  'CFTimeZoneCopyAbbreviation';
function CFTimeZoneIsDaylightSavingTime(tz: CFTimeZoneRef; at: CFAbsoluteTime)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFTimeZoneIsDaylightSavingTime';
function CFTimeZoneGetDaylightSavingTimeOffset(tz: CFTimeZoneRef;
  at: CFAbsoluteTime): CFTimeInterval; cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneGetDaylightSavingTimeOffset';
function CFTimeZoneGetNextDaylightSavingTimeTransition(tz: CFTimeZoneRef;
  at: CFAbsoluteTime): CFAbsoluteTime; cdecl;
  external libCoreFoundation name _PU +
  'CFTimeZoneGetNextDaylightSavingTimeTransition';
function CFTimeZoneCopyLocalizedName(tz: CFTimeZoneRef;
  style: CFTimeZoneNameStyle; locale: CFLocaleRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFTimeZoneCopyLocalizedName';
function CFCalendarGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFCalendarGetTypeID';
function CFCalendarCopyCurrent: CFCalendarRef; cdecl;
  external libCoreFoundation name _PU + 'CFCalendarCopyCurrent';
function CFCalendarCreateWithIdentifier(allocator: CFAllocatorRef;
  identifier: CFStringRef): CFCalendarRef; cdecl;
  external libCoreFoundation name _PU + 'CFCalendarCreateWithIdentifier';
function CFCalendarGetIdentifier(calendar: CFCalendarRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFCalendarGetIdentifier';
function CFCalendarCopyLocale(calendar: CFCalendarRef): CFLocaleRef; cdecl;
  external libCoreFoundation name _PU + 'CFCalendarCopyLocale';
procedure CFCalendarSetLocale(calendar: CFCalendarRef; locale: CFLocaleRef);
  cdecl; external libCoreFoundation name _PU + 'CFCalendarSetLocale';
function CFCalendarCopyTimeZone(calendar: CFCalendarRef): CFTimeZoneRef; cdecl;
  external libCoreFoundation name _PU + 'CFCalendarCopyTimeZone';
procedure CFCalendarSetTimeZone(calendar: CFCalendarRef; tz: CFTimeZoneRef);
  cdecl; external libCoreFoundation name _PU + 'CFCalendarSetTimeZone';
function CFCalendarGetFirstWeekday(calendar: CFCalendarRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFCalendarGetFirstWeekday';
procedure CFCalendarSetFirstWeekday(calendar: CFCalendarRef; wkdy: CFIndex);
  cdecl; external libCoreFoundation name _PU + 'CFCalendarSetFirstWeekday';
function CFCalendarGetMinimumDaysInFirstWeek(calendar: CFCalendarRef): CFIndex;
  cdecl; external libCoreFoundation name _PU +
  'CFCalendarGetMinimumDaysInFirstWeek';
procedure CFCalendarSetMinimumDaysInFirstWeek(calendar: CFCalendarRef;
  mwd: CFIndex); cdecl; external libCoreFoundation name _PU +
  'CFCalendarSetMinimumDaysInFirstWeek';
function CFCalendarGetMinimumRangeOfUnit(calendar: CFCalendarRef;
  &unit: CFCalendarUnit): CFRange; cdecl;
  external libCoreFoundation name _PU + 'CFCalendarGetMinimumRangeOfUnit';
function CFCalendarGetMaximumRangeOfUnit(calendar: CFCalendarRef;
  &unit: CFCalendarUnit): CFRange; cdecl;
  external libCoreFoundation name _PU + 'CFCalendarGetMaximumRangeOfUnit';
function CFCalendarGetRangeOfUnit(calendar: CFCalendarRef;
  smallerUnit: CFCalendarUnit; biggerUnit: CFCalendarUnit; at: CFAbsoluteTime)
  : CFRange; cdecl; external libCoreFoundation name _PU +
  'CFCalendarGetRangeOfUnit';
function CFCalendarGetOrdinalityOfUnit(calendar: CFCalendarRef;
  smallerUnit: CFCalendarUnit; biggerUnit: CFCalendarUnit; at: CFAbsoluteTime)
  : CFIndex; cdecl; external libCoreFoundation name _PU +
  'CFCalendarGetOrdinalityOfUnit';
function CFCalendarGetTimeRangeOfUnit(calendar: CFCalendarRef;
  &unit: CFCalendarUnit; at: CFAbsoluteTime; startp: PDouble; tip: PDouble)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFCalendarGetTimeRangeOfUnit';
function CFCalendarComposeAbsoluteTime(calendar: CFCalendarRef; at: PDouble;
  componentDesc: MarshaledAString): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFCalendarComposeAbsoluteTime';
function CFCalendarDecomposeAbsoluteTime(calendar: CFCalendarRef;
  at: CFAbsoluteTime; componentDesc: MarshaledAString): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFCalendarDecomposeAbsoluteTime';
function CFCalendarAddComponents(calendar: CFCalendarRef; at: PDouble;
  options: CFOptionFlags; componentDesc: MarshaledAString): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFCalendarAddComponents';
function CFCalendarGetComponentDifference(calendar: CFCalendarRef;
  startingAT: CFAbsoluteTime; resultAT: CFAbsoluteTime; options: CFOptionFlags;
  componentDesc: MarshaledAString): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFCalendarGetComponentDifference';
function CFDateFormatterCreateDateFormatFromTemplate(allocator: CFAllocatorRef;
  tmplate: CFStringRef; options: CFOptionFlags; locale: CFLocaleRef)
  : CFStringRef; cdecl; external libCoreFoundation name _PU +
  'CFDateFormatterCreateDateFormatFromTemplate';
function CFDateFormatterGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFDateFormatterGetTypeID';
function CFDateFormatterCreate(allocator: CFAllocatorRef; locale: CFLocaleRef;
  dateStyle: CFDateFormatterStyle; timeStyle: CFDateFormatterStyle)
  : CFDateFormatterRef; cdecl;
  external libCoreFoundation name _PU + 'CFDateFormatterCreate';
function CFDateFormatterGetLocale(formatter: CFDateFormatterRef): CFLocaleRef;
  cdecl; external libCoreFoundation name _PU + 'CFDateFormatterGetLocale';
function CFDateFormatterGetDateStyle(formatter: CFDateFormatterRef)
  : CFDateFormatterStyle; cdecl;
  external libCoreFoundation name _PU + 'CFDateFormatterGetDateStyle';
function CFDateFormatterGetTimeStyle(formatter: CFDateFormatterRef)
  : CFDateFormatterStyle; cdecl;
  external libCoreFoundation name _PU + 'CFDateFormatterGetTimeStyle';
function CFDateFormatterGetFormat(formatter: CFDateFormatterRef): CFStringRef;
  cdecl; external libCoreFoundation name _PU + 'CFDateFormatterGetFormat';
procedure CFDateFormatterSetFormat(formatter: CFDateFormatterRef;
  formatString: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFDateFormatterSetFormat';
function CFDateFormatterCreateStringWithDate(allocator: CFAllocatorRef;
  formatter: CFDateFormatterRef; date: CFDateRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFDateFormatterCreateStringWithDate';
function CFDateFormatterCreateStringWithAbsoluteTime(allocator: CFAllocatorRef;
  formatter: CFDateFormatterRef; at: CFAbsoluteTime): CFStringRef; cdecl;
  external libCoreFoundation name _PU +
  'CFDateFormatterCreateStringWithAbsoluteTime';
function CFDateFormatterCreateDateFromString(allocator: CFAllocatorRef;
  formatter: CFDateFormatterRef; &string: CFStringRef; rangep: Pointer)
  : CFDateRef; cdecl; external libCoreFoundation name _PU +
  'CFDateFormatterCreateDateFromString';
function CFDateFormatterGetAbsoluteTimeFromString(formatter: CFDateFormatterRef;
  &string: CFStringRef; rangep: Pointer; atp: PDouble): Boolean; cdecl;
  external libCoreFoundation name _PU +
  'CFDateFormatterGetAbsoluteTimeFromString';
procedure CFDateFormatterSetProperty(formatter: CFDateFormatterRef;
  key: CFStringRef; value: CFTypeRef); cdecl;
  external libCoreFoundation name _PU + 'CFDateFormatterSetProperty';
function CFDateFormatterCopyProperty(formatter: CFDateFormatterRef;
  key: CFStringRef): CFTypeRef; cdecl;
  external libCoreFoundation name _PU + 'CFDateFormatterCopyProperty';
function CFRunLoopGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopGetTypeID';
function CFRunLoopGetCurrent: CFRunLoopRef; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopGetCurrent';
function CFRunLoopGetMain: CFRunLoopRef; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopGetMain';
function CFRunLoopCopyCurrentMode(rl: CFRunLoopRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopCopyCurrentMode';
function CFRunLoopCopyAllModes(rl: CFRunLoopRef): CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopCopyAllModes';
procedure CFRunLoopAddCommonMode(rl: CFRunLoopRef; mode: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopAddCommonMode';
function CFRunLoopGetNextTimerFireDate(rl: CFRunLoopRef; mode: CFStringRef)
  : CFAbsoluteTime; cdecl; external libCoreFoundation name _PU +
  'CFRunLoopGetNextTimerFireDate';
procedure CFRunLoopRun; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopRun';
function CFRunLoopRunInMode(mode: CFStringRef; seconds: CFTimeInterval;
  returnAfterSourceHandled: Boolean): CFRunLoopRunResult; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopRunInMode';
function CFRunLoopIsWaiting(rl: CFRunLoopRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopIsWaiting';
procedure CFRunLoopWakeUp(rl: CFRunLoopRef); cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopWakeUp';
procedure CFRunLoopStop(rl: CFRunLoopRef); cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopStop';
procedure CFRunLoopPerformBlock(rl: CFRunLoopRef; mode: CFTypeRef;
  block: TCoreFoundationBlock); cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopPerformBlock';
function CFRunLoopContainsSource(rl: CFRunLoopRef; source: CFRunLoopSourceRef;
  mode: CFStringRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopContainsSource';
procedure CFRunLoopAddSource(rl: CFRunLoopRef; source: CFRunLoopSourceRef;
  mode: CFStringRef); cdecl; external libCoreFoundation name _PU +
  'CFRunLoopAddSource';
procedure CFRunLoopRemoveSource(rl: CFRunLoopRef; source: CFRunLoopSourceRef;
  mode: CFStringRef); cdecl; external libCoreFoundation name _PU +
  'CFRunLoopRemoveSource';
function CFRunLoopContainsObserver(rl: CFRunLoopRef;
  observer: CFRunLoopObserverRef; mode: CFStringRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopContainsObserver';
procedure CFRunLoopAddObserver(rl: CFRunLoopRef; observer: CFRunLoopObserverRef;
  mode: CFStringRef); cdecl; external libCoreFoundation name _PU +
  'CFRunLoopAddObserver';
procedure CFRunLoopRemoveObserver(rl: CFRunLoopRef;
  observer: CFRunLoopObserverRef; mode: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopRemoveObserver';
function CFRunLoopContainsTimer(rl: CFRunLoopRef; timer: CFRunLoopTimerRef;
  mode: CFStringRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopContainsTimer';
procedure CFRunLoopAddTimer(rl: CFRunLoopRef; timer: CFRunLoopTimerRef;
  mode: CFStringRef); cdecl; external libCoreFoundation name _PU +
  'CFRunLoopAddTimer';
procedure CFRunLoopRemoveTimer(rl: CFRunLoopRef; timer: CFRunLoopTimerRef;
  mode: CFStringRef); cdecl; external libCoreFoundation name _PU +
  'CFRunLoopRemoveTimer';
function CFRunLoopSourceGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopSourceGetTypeID';
function CFRunLoopSourceCreate(allocator: CFAllocatorRef; order: CFIndex;
  context: Pointer): CFRunLoopSourceRef; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopSourceCreate';
function CFRunLoopSourceGetOrder(source: CFRunLoopSourceRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopSourceGetOrder';
procedure CFRunLoopSourceInvalidate(source: CFRunLoopSourceRef); cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopSourceInvalidate';
function CFRunLoopSourceIsValid(source: CFRunLoopSourceRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopSourceIsValid';
procedure CFRunLoopSourceGetContext(source: CFRunLoopSourceRef;
  context: Pointer); cdecl; external libCoreFoundation name _PU +
  'CFRunLoopSourceGetContext';
procedure CFRunLoopSourceSignal(source: CFRunLoopSourceRef); cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopSourceSignal';
function CFRunLoopObserverGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopObserverGetTypeID';
function CFRunLoopObserverCreate(allocator: CFAllocatorRef;
  activities: CFOptionFlags; repeats: Boolean; order: CFIndex;
  callout: CFRunLoopObserverCallBack; context: Pointer): CFRunLoopObserverRef;
  cdecl; external libCoreFoundation name _PU + 'CFRunLoopObserverCreate';
function CFRunLoopObserverCreateWithHandler(allocator: CFAllocatorRef;
  activities: CFOptionFlags; repeats: Boolean; order: CFIndex;
  block: TCoreFoundationBlock1): CFRunLoopObserverRef; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopObserverCreateWithHandler';
function CFRunLoopObserverGetActivities(observer: CFRunLoopObserverRef)
  : CFOptionFlags; cdecl; external libCoreFoundation name _PU +
  'CFRunLoopObserverGetActivities';
function CFRunLoopObserverDoesRepeat(observer: CFRunLoopObserverRef): Boolean;
  cdecl; external libCoreFoundation name _PU + 'CFRunLoopObserverDoesRepeat';
function CFRunLoopObserverGetOrder(observer: CFRunLoopObserverRef): CFIndex;
  cdecl; external libCoreFoundation name _PU + 'CFRunLoopObserverGetOrder';
procedure CFRunLoopObserverInvalidate(observer: CFRunLoopObserverRef); cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopObserverInvalidate';
function CFRunLoopObserverIsValid(observer: CFRunLoopObserverRef): Boolean;
  cdecl; external libCoreFoundation name _PU + 'CFRunLoopObserverIsValid';
procedure CFRunLoopObserverGetContext(observer: CFRunLoopObserverRef;
  context: Pointer); cdecl; external libCoreFoundation name _PU +
  'CFRunLoopObserverGetContext';
function CFRunLoopTimerGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopTimerGetTypeID';
function CFRunLoopTimerCreate(allocator: CFAllocatorRef;
  fireDate: CFAbsoluteTime; interval: CFTimeInterval; flags: CFOptionFlags;
  order: CFIndex; callout: CFRunLoopTimerCallBack; context: Pointer)
  : CFRunLoopTimerRef; cdecl; external libCoreFoundation name _PU +
  'CFRunLoopTimerCreate';
function CFRunLoopTimerCreateWithHandler(allocator: CFAllocatorRef;
  fireDate: CFAbsoluteTime; interval: CFTimeInterval; flags: CFOptionFlags;
  order: CFIndex; block: TCoreFoundationBlock2): CFRunLoopTimerRef; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopTimerCreateWithHandler';
function CFRunLoopTimerGetNextFireDate(timer: CFRunLoopTimerRef)
  : CFAbsoluteTime; cdecl; external libCoreFoundation name _PU +
  'CFRunLoopTimerGetNextFireDate';
procedure CFRunLoopTimerSetNextFireDate(timer: CFRunLoopTimerRef;
  fireDate: CFAbsoluteTime); cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopTimerSetNextFireDate';
function CFRunLoopTimerGetInterval(timer: CFRunLoopTimerRef): CFTimeInterval;
  cdecl; external libCoreFoundation name _PU + 'CFRunLoopTimerGetInterval';
function CFRunLoopTimerDoesRepeat(timer: CFRunLoopTimerRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopTimerDoesRepeat';
function CFRunLoopTimerGetOrder(timer: CFRunLoopTimerRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopTimerGetOrder';
procedure CFRunLoopTimerInvalidate(timer: CFRunLoopTimerRef); cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopTimerInvalidate';
function CFRunLoopTimerIsValid(timer: CFRunLoopTimerRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopTimerIsValid';
procedure CFRunLoopTimerGetContext(timer: CFRunLoopTimerRef; context: Pointer);
  cdecl; external libCoreFoundation name _PU + 'CFRunLoopTimerGetContext';
function CFRunLoopTimerGetTolerance(timer: CFRunLoopTimerRef): CFTimeInterval;
  cdecl; external libCoreFoundation name _PU + 'CFRunLoopTimerGetTolerance';
procedure CFRunLoopTimerSetTolerance(timer: CFRunLoopTimerRef;
  tolerance: CFTimeInterval); cdecl;
  external libCoreFoundation name _PU + 'CFRunLoopTimerSetTolerance';
function CFFileDescriptorGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFFileDescriptorGetTypeID';
function CFFileDescriptorCreate(allocator: CFAllocatorRef;
  fd: CFFileDescriptorNativeDescriptor; closeOnInvalidate: Boolean;
  callout: CFFileDescriptorCallBack; context: Pointer): CFFileDescriptorRef;
  cdecl; external libCoreFoundation name _PU + 'CFFileDescriptorCreate';
function CFFileDescriptorGetNativeDescriptor(f: CFFileDescriptorRef)
  : CFFileDescriptorNativeDescriptor; cdecl;
  external libCoreFoundation name _PU + 'CFFileDescriptorGetNativeDescriptor';
procedure CFFileDescriptorGetContext(f: CFFileDescriptorRef; context: Pointer);
  cdecl; external libCoreFoundation name _PU + 'CFFileDescriptorGetContext';
procedure CFFileDescriptorEnableCallBacks(f: CFFileDescriptorRef;
  callBackTypes: CFOptionFlags); cdecl;
  external libCoreFoundation name _PU + 'CFFileDescriptorEnableCallBacks';
procedure CFFileDescriptorDisableCallBacks(f: CFFileDescriptorRef;
  callBackTypes: CFOptionFlags); cdecl;
  external libCoreFoundation name _PU + 'CFFileDescriptorDisableCallBacks';
procedure CFFileDescriptorInvalidate(f: CFFileDescriptorRef); cdecl;
  external libCoreFoundation name _PU + 'CFFileDescriptorInvalidate';
function CFFileDescriptorIsValid(f: CFFileDescriptorRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFFileDescriptorIsValid';
function CFFileDescriptorCreateRunLoopSource(allocator: CFAllocatorRef;
  f: CFFileDescriptorRef; order: CFIndex): CFRunLoopSourceRef; cdecl;
  external libCoreFoundation name _PU + 'CFFileDescriptorCreateRunLoopSource';
function CFUUIDGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFUUIDGetTypeID';
function CFUUIDCreate(alloc: CFAllocatorRef): CFUUIDRef; cdecl;
  external libCoreFoundation name _PU + 'CFUUIDCreate';
function CFUUIDCreateWithBytes(alloc: CFAllocatorRef; byte0: Byte; byte1: Byte;
  byte2: Byte; byte3: Byte; byte4: Byte; byte5: Byte; byte6: Byte; byte7: Byte;
  byte8: Byte; byte9: Byte; byte10: Byte; byte11: Byte; byte12: Byte;
  byte13: Byte; byte14: Byte; byte15: Byte): CFUUIDRef; cdecl;
  external libCoreFoundation name _PU + 'CFUUIDCreateWithBytes';
function CFUUIDCreateFromString(alloc: CFAllocatorRef; uuidStr: CFStringRef)
  : CFUUIDRef; cdecl; external libCoreFoundation name _PU +
  'CFUUIDCreateFromString';
function CFUUIDCreateString(alloc: CFAllocatorRef; uuid: CFUUIDRef)
  : CFStringRef; cdecl; external libCoreFoundation name _PU +
  'CFUUIDCreateString';
function CFUUIDGetConstantUUIDWithBytes(alloc: CFAllocatorRef; byte0: Byte;
  byte1: Byte; byte2: Byte; byte3: Byte; byte4: Byte; byte5: Byte; byte6: Byte;
  byte7: Byte; byte8: Byte; byte9: Byte; byte10: Byte; byte11: Byte;
  byte12: Byte; byte13: Byte; byte14: Byte; byte15: Byte): CFUUIDRef; cdecl;
  external libCoreFoundation name _PU + 'CFUUIDGetConstantUUIDWithBytes';
function CFUUIDGetUUIDBytes(uuid: CFUUIDRef): CFUUIDBytes; cdecl;
  external libCoreFoundation name _PU + 'CFUUIDGetUUIDBytes';
function CFUUIDCreateFromUUIDBytes(alloc: CFAllocatorRef; bytes: CFUUIDBytes)
  : CFUUIDRef; cdecl; external libCoreFoundation name _PU +
  'CFUUIDCreateFromUUIDBytes';
function CFFileSecurityGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFFileSecurityGetTypeID';
function CFFileSecurityCreate(allocator: CFAllocatorRef): CFFileSecurityRef;
  cdecl; external libCoreFoundation name _PU + 'CFFileSecurityCreate';
function CFFileSecurityCreateCopy(allocator: CFAllocatorRef;
  fileSec: CFFileSecurityRef): CFFileSecurityRef; cdecl;
  external libCoreFoundation name _PU + 'CFFileSecurityCreateCopy';
function CFFileSecurityCopyOwnerUUID(fileSec: CFFileSecurityRef;
  ownerUUID: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFFileSecurityCopyOwnerUUID';
function CFFileSecuritySetOwnerUUID(fileSec: CFFileSecurityRef;
  ownerUUID: CFUUIDRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFFileSecuritySetOwnerUUID';
function CFFileSecurityCopyGroupUUID(fileSec: CFFileSecurityRef;
  groupUUID: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFFileSecurityCopyGroupUUID';
function CFFileSecuritySetGroupUUID(fileSec: CFFileSecurityRef;
  groupUUID: CFUUIDRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFFileSecuritySetGroupUUID';
function CFFileSecurityCopyAccessControlList(fileSec: CFFileSecurityRef;
  accessControlList: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFFileSecurityCopyAccessControlList';
function CFFileSecuritySetAccessControlList(fileSec: CFFileSecurityRef;
  accessControlList: Pointer { acl_t } ): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFFileSecuritySetAccessControlList';
function CFFileSecurityGetOwner(fileSec: CFFileSecurityRef; owner: PCardinal)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFFileSecurityGetOwner';
function CFFileSecuritySetOwner(fileSec: CFFileSecurityRef;
  owner: Pointer { uid_t } ): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFFileSecuritySetOwner';
function CFFileSecurityGetGroup(fileSec: CFFileSecurityRef; group: PCardinal)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFFileSecurityGetGroup';
function CFFileSecuritySetGroup(fileSec: CFFileSecurityRef;
  group: Pointer { gid_t } ): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFFileSecuritySetGroup';
function CFFileSecurityGetMode(fileSec: CFFileSecurityRef;
  mode: unsigned short * ): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFFileSecurityGetMode';
function CFFileSecuritySetMode(fileSec: CFFileSecurityRef;
  mode: Pointer { mode_t } ): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFFileSecuritySetMode';
function CFFileSecurityClearProperties(fileSec: CFFileSecurityRef;
  clearPropertyMask: CFFileSecurityClearOptions): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFFileSecurityClearProperties';
function CFMachPortGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFMachPortGetTypeID';
function CFMachPortCreate(allocator: CFAllocatorRef;
  callout: CFMachPortCallBack; context: Pointer; shouldFreeInfo: PByte)
  : CFMachPortRef; cdecl; external libCoreFoundation name _PU +
  'CFMachPortCreate';
function CFMachPortCreateWithPort(allocator: CFAllocatorRef;
  portNum: mach_port_t; callout: CFMachPortCallBack; context: Pointer;
  shouldFreeInfo: PByte): CFMachPortRef; cdecl;
  external libCoreFoundation name _PU + 'CFMachPortCreateWithPort';
function CFMachPortGetPort(port: CFMachPortRef): mach_port_t; cdecl;
  external libCoreFoundation name _PU + 'CFMachPortGetPort';
procedure CFMachPortGetContext(port: CFMachPortRef; context: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFMachPortGetContext';
procedure CFMachPortInvalidate(port: CFMachPortRef); cdecl;
  external libCoreFoundation name _PU + 'CFMachPortInvalidate';
function CFMachPortIsValid(port: CFMachPortRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFMachPortIsValid';
function CFMachPortGetInvalidationCallBack(port: CFMachPortRef)
  : CFMachPortInvalidationCallBack; cdecl;
  external libCoreFoundation name _PU + 'CFMachPortGetInvalidationCallBack';
procedure CFMachPortSetInvalidationCallBack(port: CFMachPortRef;
  callout: CFMachPortInvalidationCallBack); cdecl;
  external libCoreFoundation name _PU + 'CFMachPortSetInvalidationCallBack';
function CFMachPortCreateRunLoopSource(allocator: CFAllocatorRef;
  port: CFMachPortRef; order: CFIndex): CFRunLoopSourceRef; cdecl;
  external libCoreFoundation name _PU + 'CFMachPortCreateRunLoopSource';
function CFMessagePortGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFMessagePortGetTypeID';
function CFMessagePortCreateLocal(allocator: CFAllocatorRef; name: CFStringRef;
  callout: CFMessagePortCallBack; context: Pointer; shouldFreeInfo: PByte)
  : CFMessagePortRef; cdecl; external libCoreFoundation name _PU +
  'CFMessagePortCreateLocal';
function CFMessagePortCreateRemote(allocator: CFAllocatorRef; name: CFStringRef)
  : CFMessagePortRef; cdecl; external libCoreFoundation name _PU +
  'CFMessagePortCreateRemote';
function CFMessagePortIsRemote(ms: CFMessagePortRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFMessagePortIsRemote';
function CFMessagePortGetName(ms: CFMessagePortRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU + 'CFMessagePortGetName';
function CFMessagePortSetName(ms: CFMessagePortRef; newName: CFStringRef)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFMessagePortSetName';
procedure CFMessagePortGetContext(ms: CFMessagePortRef; context: Pointer);
  cdecl; external libCoreFoundation name _PU + 'CFMessagePortGetContext';
procedure CFMessagePortInvalidate(ms: CFMessagePortRef); cdecl;
  external libCoreFoundation name _PU + 'CFMessagePortInvalidate';
function CFMessagePortIsValid(ms: CFMessagePortRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFMessagePortIsValid';
function CFMessagePortGetInvalidationCallBack(ms: CFMessagePortRef)
  : CFMessagePortInvalidationCallBack; cdecl;
  external libCoreFoundation name _PU + 'CFMessagePortGetInvalidationCallBack';
procedure CFMessagePortSetInvalidationCallBack(ms: CFMessagePortRef;
  callout: CFMessagePortInvalidationCallBack); cdecl;
  external libCoreFoundation name _PU + 'CFMessagePortSetInvalidationCallBack';
function CFMessagePortSendRequest(remote: CFMessagePortRef; msgid: Int32;
  data: CFDataRef; sendTimeout: CFTimeInterval; rcvTimeout: CFTimeInterval;
  replyMode: CFStringRef; returnData: Pointer): Int32; cdecl;
  external libCoreFoundation name _PU + 'CFMessagePortSendRequest';
function CFMessagePortCreateRunLoopSource(allocator: CFAllocatorRef;
  local: CFMessagePortRef; order: CFIndex): CFRunLoopSourceRef; cdecl;
  external libCoreFoundation name _PU + 'CFMessagePortCreateRunLoopSource';
procedure CFMessagePortSetDispatchQueue(ms: CFMessagePortRef;
  queue: dispatch_queue_t); cdecl;
  external libCoreFoundation name _PU + 'CFMessagePortSetDispatchQueue';
function CFNotificationCenterGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFNotificationCenterGetTypeID';
function CFNotificationCenterGetLocalCenter: CFNotificationCenterRef; cdecl;
  external libCoreFoundation name _PU + 'CFNotificationCenterGetLocalCenter';
function CFNotificationCenterGetDarwinNotifyCenter: CFNotificationCenterRef;
  cdecl; external libCoreFoundation name _PU +
  'CFNotificationCenterGetDarwinNotifyCenter';
procedure CFNotificationCenterAddObserver(center: CFNotificationCenterRef;
  observer: Pointer; callBack: CFNotificationCallback; name: CFStringRef;
  &object: Pointer; suspensionBehavior: CFNotificationSuspensionBehavior);
  cdecl; external libCoreFoundation name _PU +
  'CFNotificationCenterAddObserver';
procedure CFNotificationCenterRemoveObserver(center: CFNotificationCenterRef;
  observer: Pointer; name: CFStringRef; &object: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFNotificationCenterRemoveObserver';
procedure CFNotificationCenterRemoveEveryObserver
  (center: CFNotificationCenterRef; observer: Pointer); cdecl;
  external libCoreFoundation name _PU +
  'CFNotificationCenterRemoveEveryObserver';
procedure CFNotificationCenterPostNotification(center: CFNotificationCenterRef;
  name: CFStringRef; &object: Pointer; userInfo: CFDictionaryRef;
  deliverImmediately: Boolean); cdecl;
  external libCoreFoundation name _PU + 'CFNotificationCenterPostNotification';
procedure CFNotificationCenterPostNotificationWithOptions
  (center: CFNotificationCenterRef; name: CFStringRef; &object: Pointer;
  userInfo: CFDictionaryRef; options: CFOptionFlags); cdecl;
  external libCoreFoundation name _PU +
  'CFNotificationCenterPostNotificationWithOptions';
function CFBooleanGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFBooleanGetTypeID';
function CFBooleanGetValue(Boolean: CFBooleanRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFBooleanGetValue';
function CFNumberGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFNumberGetTypeID';
function CFNumberCreate(allocator: CFAllocatorRef; theType: CFNumberType;
  valuePtr: Pointer): CFNumberRef; cdecl;
  external libCoreFoundation name _PU + 'CFNumberCreate';
function CFNumberGetType(number: CFNumberRef): CFNumberType; cdecl;
  external libCoreFoundation name _PU + 'CFNumberGetType';
function CFNumberGetByteSize(number: CFNumberRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFNumberGetByteSize';
function CFNumberIsFloatType(number: CFNumberRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFNumberIsFloatType';
function CFNumberGetValue(number: CFNumberRef; theType: CFNumberType;
  valuePtr: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFNumberGetValue';
function CFNumberCompare(number: CFNumberRef; otherNumber: CFNumberRef;
  context: Pointer): CFComparisonResult; cdecl;
  external libCoreFoundation name _PU + 'CFNumberCompare';
function CFNumberFormatterGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFNumberFormatterGetTypeID';
function CFNumberFormatterCreate(allocator: CFAllocatorRef; locale: CFLocaleRef;
  style: CFNumberFormatterStyle): CFNumberFormatterRef; cdecl;
  external libCoreFoundation name _PU + 'CFNumberFormatterCreate';
function CFNumberFormatterGetLocale(formatter: CFNumberFormatterRef)
  : CFLocaleRef; cdecl; external libCoreFoundation name _PU +
  'CFNumberFormatterGetLocale';
function CFNumberFormatterGetStyle(formatter: CFNumberFormatterRef)
  : CFNumberFormatterStyle; cdecl;
  external libCoreFoundation name _PU + 'CFNumberFormatterGetStyle';
function CFNumberFormatterGetFormat(formatter: CFNumberFormatterRef)
  : CFStringRef; cdecl; external libCoreFoundation name _PU +
  'CFNumberFormatterGetFormat';
procedure CFNumberFormatterSetFormat(formatter: CFNumberFormatterRef;
  formatString: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFNumberFormatterSetFormat';
function CFNumberFormatterCreateStringWithNumber(allocator: CFAllocatorRef;
  formatter: CFNumberFormatterRef; number: CFNumberRef): CFStringRef; cdecl;
  external libCoreFoundation name _PU +
  'CFNumberFormatterCreateStringWithNumber';
function CFNumberFormatterCreateStringWithValue(allocator: CFAllocatorRef;
  formatter: CFNumberFormatterRef; numberType: CFNumberType; valuePtr: Pointer)
  : CFStringRef; cdecl; external libCoreFoundation name _PU +
  'CFNumberFormatterCreateStringWithValue';
function CFNumberFormatterCreateNumberFromString(allocator: CFAllocatorRef;
  formatter: CFNumberFormatterRef; &string: CFStringRef; rangep: Pointer;
  options: CFOptionFlags): CFNumberRef; cdecl;
  external libCoreFoundation name _PU +
  'CFNumberFormatterCreateNumberFromString';
function CFNumberFormatterGetValueFromString(formatter: CFNumberFormatterRef;
  &string: CFStringRef; rangep: Pointer; numberType: CFNumberType;
  valuePtr: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFNumberFormatterGetValueFromString';
procedure CFNumberFormatterSetProperty(formatter: CFNumberFormatterRef;
  key: CFStringRef; value: CFTypeRef); cdecl;
  external libCoreFoundation name _PU + 'CFNumberFormatterSetProperty';
function CFNumberFormatterCopyProperty(formatter: CFNumberFormatterRef;
  key: CFStringRef): CFTypeRef; cdecl;
  external libCoreFoundation name _PU + 'CFNumberFormatterCopyProperty';
function CFNumberFormatterGetDecimalInfoForCurrencyCode
  (currencyCode: CFStringRef; defaultFractionDigits: PInt32;
  roundingIncrement: PDouble): Boolean; cdecl;
  external libCoreFoundation name _PU +
  'CFNumberFormatterGetDecimalInfoForCurrencyCode';
function CFPlugInGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFPlugInGetTypeID';
function CFPlugInCreate(allocator: CFAllocatorRef; plugInURL: CFURLRef)
  : CFPlugInRef; cdecl; external libCoreFoundation name _PU + 'CFPlugInCreate';
function CFPlugInGetBundle(plugIn: CFPlugInRef): CFBundleRef; cdecl;
  external libCoreFoundation name _PU + 'CFPlugInGetBundle';
procedure CFPlugInSetLoadOnDemand(plugIn: CFPlugInRef; flag: Boolean); cdecl;
  external libCoreFoundation name _PU + 'CFPlugInSetLoadOnDemand';
function CFPlugInIsLoadOnDemand(plugIn: CFPlugInRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFPlugInIsLoadOnDemand';
function CFPlugInFindFactoriesForPlugInType(typeUUID: CFUUIDRef): CFArrayRef;
  cdecl; external libCoreFoundation name _PU +
  'CFPlugInFindFactoriesForPlugInType';
function CFPlugInFindFactoriesForPlugInTypeInPlugIn(typeUUID: CFUUIDRef;
  plugIn: CFPlugInRef): CFArrayRef; cdecl;
  external libCoreFoundation name _PU +
  'CFPlugInFindFactoriesForPlugInTypeInPlugIn';
function CFPlugInInstanceCreate(allocator: CFAllocatorRef;
  factoryUUID: CFUUIDRef; typeUUID: CFUUIDRef): Pointer; cdecl;
  external libCoreFoundation name _PU + 'CFPlugInInstanceCreate';
function CFPlugInRegisterFactoryFunction(factoryUUID: CFUUIDRef;
  func: CFPlugInFactoryFunction): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFPlugInRegisterFactoryFunction';
function CFPlugInRegisterFactoryFunctionByName(factoryUUID: CFUUIDRef;
  plugIn: CFPlugInRef; functionName: CFStringRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFPlugInRegisterFactoryFunctionByName';
function CFPlugInUnregisterFactory(factoryUUID: CFUUIDRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFPlugInUnregisterFactory';
function CFPlugInRegisterPlugInType(factoryUUID: CFUUIDRef; typeUUID: CFUUIDRef)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFPlugInRegisterPlugInType';
function CFPlugInUnregisterPlugInType(factoryUUID: CFUUIDRef;
  typeUUID: CFUUIDRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFPlugInUnregisterPlugInType';
procedure CFPlugInAddInstanceForFactory(factoryID: CFUUIDRef); cdecl;
  external libCoreFoundation name _PU + 'CFPlugInAddInstanceForFactory';
procedure CFPlugInRemoveInstanceForFactory(factoryID: CFUUIDRef); cdecl;
  external libCoreFoundation name _PU + 'CFPlugInRemoveInstanceForFactory';
function CFPlugInInstanceGetInterfaceFunctionTable
  (instance: CFPlugInInstanceRef; interfaceName: CFStringRef; ftbl: Pointer)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFPlugInInstanceGetInterfaceFunctionTable';
function CFPlugInInstanceGetFactoryName(instance: CFPlugInInstanceRef)
  : CFStringRef; cdecl; external libCoreFoundation name _PU +
  'CFPlugInInstanceGetFactoryName';
function CFPlugInInstanceGetInstanceData(instance: CFPlugInInstanceRef)
  : Pointer; cdecl; external libCoreFoundation name _PU +
  'CFPlugInInstanceGetInstanceData';
function CFPlugInInstanceGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFPlugInInstanceGetTypeID';
function CFPlugInInstanceCreateWithInstanceDataSize(allocator: CFAllocatorRef;
  instanceDataSize: CFIndex;
  deallocateInstanceFunction: CFPlugInInstanceDeallocateInstanceDataFunction;
  factoryName: CFStringRef;
  getInterfaceFunction: CFPlugInInstanceGetInterfaceFunction)
  : CFPlugInInstanceRef; cdecl;
  external libCoreFoundation name _PU +
  'CFPlugInInstanceCreateWithInstanceDataSize';
function CFPreferencesCopyAppValue(key: CFStringRef; applicationID: CFStringRef)
  : CFPropertyListRef; cdecl; external libCoreFoundation name _PU +
  'CFPreferencesCopyAppValue';
function CFPreferencesGetAppBooleanValue(key: CFStringRef;
  applicationID: CFStringRef; keyExistsAndHasValidFormat: PByte): Boolean;
  cdecl; external libCoreFoundation name _PU +
  'CFPreferencesGetAppBooleanValue';
function CFPreferencesGetAppIntegerValue(key: CFStringRef;
  applicationID: CFStringRef; keyExistsAndHasValidFormat: PByte): CFIndex;
  cdecl; external libCoreFoundation name _PU +
  'CFPreferencesGetAppIntegerValue';
procedure CFPreferencesSetAppValue(key: CFStringRef; value: CFPropertyListRef;
  applicationID: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFPreferencesSetAppValue';
procedure CFPreferencesAddSuitePreferencesToApp(applicationID: CFStringRef;
  suiteID: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFPreferencesAddSuitePreferencesToApp';
procedure CFPreferencesRemoveSuitePreferencesFromApp(applicationID: CFStringRef;
  suiteID: CFStringRef); cdecl;
  external libCoreFoundation name _PU +
  'CFPreferencesRemoveSuitePreferencesFromApp';
function CFPreferencesAppSynchronize(applicationID: CFStringRef): Boolean;
  cdecl; external libCoreFoundation name _PU + 'CFPreferencesAppSynchronize';
function CFPreferencesCopyValue(key: CFStringRef; applicationID: CFStringRef;
  userName: CFStringRef; hostName: CFStringRef): CFPropertyListRef; cdecl;
  external libCoreFoundation name _PU + 'CFPreferencesCopyValue';
function CFPreferencesCopyMultiple(keysToFetch: CFArrayRef;
  applicationID: CFStringRef; userName: CFStringRef; hostName: CFStringRef)
  : CFDictionaryRef; cdecl; external libCoreFoundation name _PU +
  'CFPreferencesCopyMultiple';
procedure CFPreferencesSetValue(key: CFStringRef; value: CFPropertyListRef;
  applicationID: CFStringRef; userName: CFStringRef; hostName: CFStringRef);
  cdecl; external libCoreFoundation name _PU + 'CFPreferencesSetValue';
procedure CFPreferencesSetMultiple(keysToSet: CFDictionaryRef;
  keysToRemove: CFArrayRef; applicationID: CFStringRef; userName: CFStringRef;
  hostName: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFPreferencesSetMultiple';
function CFPreferencesSynchronize(applicationID: CFStringRef;
  userName: CFStringRef; hostName: CFStringRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFPreferencesSynchronize';
function CFPreferencesCopyApplicationList(userName: CFStringRef;
  hostName: CFStringRef): CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFPreferencesCopyApplicationList';
function CFPreferencesCopyKeyList(applicationID: CFStringRef;
  userName: CFStringRef; hostName: CFStringRef): CFArrayRef; cdecl;
  external libCoreFoundation name _PU + 'CFPreferencesCopyKeyList';
function CFPreferencesAppValueIsForced(key: CFStringRef;
  applicationID: CFStringRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFPreferencesAppValueIsForced';
function CFSocketGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFSocketGetTypeID';
function CFSocketCreate(allocator: CFAllocatorRef; protocolFamily: Int32;
  socketType: Int32; protocol: Int32; callBackTypes: CFOptionFlags;
  callout: CFSocketCallBack; context: Pointer): CFSocketRef; cdecl;
  external libCoreFoundation name _PU + 'CFSocketCreate';
function CFSocketCreateWithNative(allocator: CFAllocatorRef;
  sock: CFSocketNativeHandle; callBackTypes: CFOptionFlags;
  callout: CFSocketCallBack; context: Pointer): CFSocketRef; cdecl;
  external libCoreFoundation name _PU + 'CFSocketCreateWithNative';
function CFSocketCreateWithSocketSignature(allocator: CFAllocatorRef;
  signature: Pointer; callBackTypes: CFOptionFlags; callout: CFSocketCallBack;
  context: Pointer): CFSocketRef; cdecl;
  external libCoreFoundation name _PU + 'CFSocketCreateWithSocketSignature';
function CFSocketCreateConnectedToSocketSignature(allocator: CFAllocatorRef;
  signature: Pointer; callBackTypes: CFOptionFlags; callout: CFSocketCallBack;
  context: Pointer; timeout: CFTimeInterval): CFSocketRef; cdecl;
  external libCoreFoundation name _PU +
  'CFSocketCreateConnectedToSocketSignature';
function CFSocketSetAddress(s: CFSocketRef; address: CFDataRef): CFSocketError;
  cdecl; external libCoreFoundation name _PU + 'CFSocketSetAddress';
function CFSocketConnectToAddress(s: CFSocketRef; address: CFDataRef;
  timeout: CFTimeInterval): CFSocketError; cdecl;
  external libCoreFoundation name _PU + 'CFSocketConnectToAddress';
procedure CFSocketInvalidate(s: CFSocketRef); cdecl;
  external libCoreFoundation name _PU + 'CFSocketInvalidate';
function CFSocketIsValid(s: CFSocketRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFSocketIsValid';
function CFSocketCopyAddress(s: CFSocketRef): CFDataRef; cdecl;
  external libCoreFoundation name _PU + 'CFSocketCopyAddress';
function CFSocketCopyPeerAddress(s: CFSocketRef): CFDataRef; cdecl;
  external libCoreFoundation name _PU + 'CFSocketCopyPeerAddress';
procedure CFSocketGetContext(s: CFSocketRef; context: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFSocketGetContext';
function CFSocketGetNative(s: CFSocketRef): CFSocketNativeHandle; cdecl;
  external libCoreFoundation name _PU + 'CFSocketGetNative';
function CFSocketCreateRunLoopSource(allocator: CFAllocatorRef; s: CFSocketRef;
  order: CFIndex): CFRunLoopSourceRef; cdecl;
  external libCoreFoundation name _PU + 'CFSocketCreateRunLoopSource';
function CFSocketGetSocketFlags(s: CFSocketRef): CFOptionFlags; cdecl;
  external libCoreFoundation name _PU + 'CFSocketGetSocketFlags';
procedure CFSocketSetSocketFlags(s: CFSocketRef; flags: CFOptionFlags); cdecl;
  external libCoreFoundation name _PU + 'CFSocketSetSocketFlags';
procedure CFSocketDisableCallBacks(s: CFSocketRef;
  callBackTypes: CFOptionFlags); cdecl;
  external libCoreFoundation name _PU + 'CFSocketDisableCallBacks';
procedure CFSocketEnableCallBacks(s: CFSocketRef; callBackTypes: CFOptionFlags);
  cdecl; external libCoreFoundation name _PU + 'CFSocketEnableCallBacks';
function CFSocketSendData(s: CFSocketRef; address: CFDataRef; data: CFDataRef;
  timeout: CFTimeInterval): CFSocketError; cdecl;
  external libCoreFoundation name _PU + 'CFSocketSendData';
function CFSocketRegisterValue(nameServerSignature: Pointer;
  timeout: CFTimeInterval; name: CFStringRef; value: CFPropertyListRef)
  : CFSocketError; cdecl; external libCoreFoundation name _PU +
  'CFSocketRegisterValue';
function CFSocketCopyRegisteredValue(nameServerSignature: Pointer;
  timeout: CFTimeInterval; name: CFStringRef; value: Pointer;
  nameServerAddress: Pointer): CFSocketError; cdecl;
  external libCoreFoundation name _PU + 'CFSocketCopyRegisteredValue';
function CFSocketRegisterSocketSignature(nameServerSignature: Pointer;
  timeout: CFTimeInterval; name: CFStringRef; signature: Pointer)
  : CFSocketError; cdecl; external libCoreFoundation name _PU +
  'CFSocketRegisterSocketSignature';
function CFSocketCopyRegisteredSocketSignature(nameServerSignature: Pointer;
  timeout: CFTimeInterval; name: CFStringRef; signature: Pointer;
  nameServerAddress: Pointer): CFSocketError; cdecl;
  external libCoreFoundation name _PU + 'CFSocketCopyRegisteredSocketSignature';
function CFSocketUnregister(nameServerSignature: Pointer;
  timeout: CFTimeInterval; name: CFStringRef): CFSocketError; cdecl;
  external libCoreFoundation name _PU + 'CFSocketUnregister';
procedure CFSocketSetDefaultNameRegistryPortNumber(port: UInt16); cdecl;
  external libCoreFoundation name _PU +
  'CFSocketSetDefaultNameRegistryPortNumber';
function CFSocketGetDefaultNameRegistryPortNumber: UInt16; cdecl;
  external libCoreFoundation name _PU +
  'CFSocketGetDefaultNameRegistryPortNumber';
function CFReadStreamGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamGetTypeID';
function CFWriteStreamGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamGetTypeID';
function CFReadStreamCreateWithBytesNoCopy(alloc: CFAllocatorRef; bytes: PByte;
  length: CFIndex; bytesDeallocator: CFAllocatorRef): CFReadStreamRef; cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamCreateWithBytesNoCopy';
function CFWriteStreamCreateWithBuffer(alloc: CFAllocatorRef; buffer: PByte;
  bufferCapacity: CFIndex): CFWriteStreamRef; cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamCreateWithBuffer';
function CFWriteStreamCreateWithAllocatedBuffers(alloc: CFAllocatorRef;
  bufferAllocator: CFAllocatorRef): CFWriteStreamRef; cdecl;
  external libCoreFoundation name _PU +
  'CFWriteStreamCreateWithAllocatedBuffers';
function CFReadStreamCreateWithFile(alloc: CFAllocatorRef; fileURL: CFURLRef)
  : CFReadStreamRef; cdecl; external libCoreFoundation name _PU +
  'CFReadStreamCreateWithFile';
function CFWriteStreamCreateWithFile(alloc: CFAllocatorRef; fileURL: CFURLRef)
  : CFWriteStreamRef; cdecl; external libCoreFoundation name _PU +
  'CFWriteStreamCreateWithFile';
procedure CFStreamCreateBoundPair(alloc: CFAllocatorRef; readStream: Pointer;
  writeStream: Pointer; transferBufferSize: CFIndex); cdecl;
  external libCoreFoundation name _PU + 'CFStreamCreateBoundPair';
procedure CFStreamCreatePairWithSocket(alloc: CFAllocatorRef;
  sock: CFSocketNativeHandle; readStream: Pointer; writeStream: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFStreamCreatePairWithSocket';
procedure CFStreamCreatePairWithSocketToHost(alloc: CFAllocatorRef;
  host: CFStringRef; port: UInt32; readStream: Pointer; writeStream: Pointer);
  cdecl; external libCoreFoundation name _PU +
  'CFStreamCreatePairWithSocketToHost';
procedure CFStreamCreatePairWithPeerSocketSignature(alloc: CFAllocatorRef;
  signature: Pointer; readStream: Pointer; writeStream: Pointer); cdecl;
  external libCoreFoundation name _PU +
  'CFStreamCreatePairWithPeerSocketSignature';
function CFReadStreamGetStatus(stream: CFReadStreamRef): CFStreamStatus; cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamGetStatus';
function CFWriteStreamGetStatus(stream: CFWriteStreamRef): CFStreamStatus;
  cdecl; external libCoreFoundation name _PU + 'CFWriteStreamGetStatus';
function CFReadStreamCopyError(stream: CFReadStreamRef): CFErrorRef; cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamCopyError';
function CFWriteStreamCopyError(stream: CFWriteStreamRef): CFErrorRef; cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamCopyError';
function CFReadStreamOpen(stream: CFReadStreamRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamOpen';
function CFWriteStreamOpen(stream: CFWriteStreamRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamOpen';
procedure CFReadStreamClose(stream: CFReadStreamRef); cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamClose';
procedure CFWriteStreamClose(stream: CFWriteStreamRef); cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamClose';
function CFReadStreamHasBytesAvailable(stream: CFReadStreamRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamHasBytesAvailable';
function CFReadStreamRead(stream: CFReadStreamRef; buffer: PByte;
  bufferLength: CFIndex): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamRead';
function CFReadStreamGetBuffer(stream: CFReadStreamRef; maxBytesToRead: CFIndex;
  numBytesRead: PLongInt): PByte; cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamGetBuffer';
function CFWriteStreamCanAcceptBytes(stream: CFWriteStreamRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamCanAcceptBytes';
function CFWriteStreamWrite(stream: CFWriteStreamRef; buffer: PByte;
  bufferLength: CFIndex): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamWrite';
function CFReadStreamCopyProperty(stream: CFReadStreamRef;
  propertyName: CFStringRef): CFTypeRef; cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamCopyProperty';
function CFWriteStreamCopyProperty(stream: CFWriteStreamRef;
  propertyName: CFStringRef): CFTypeRef; cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamCopyProperty';
function CFReadStreamSetProperty(stream: CFReadStreamRef;
  propertyName: CFStringRef; propertyValue: CFTypeRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamSetProperty';
function CFWriteStreamSetProperty(stream: CFWriteStreamRef;
  propertyName: CFStringRef; propertyValue: CFTypeRef): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamSetProperty';
function CFReadStreamSetClient(stream: CFReadStreamRef;
  streamEvents: CFOptionFlags; clientCB: CFReadStreamClientCallBack;
  clientContext: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamSetClient';
function CFWriteStreamSetClient(stream: CFWriteStreamRef;
  streamEvents: CFOptionFlags; clientCB: CFWriteStreamClientCallBack;
  clientContext: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamSetClient';
procedure CFReadStreamScheduleWithRunLoop(stream: CFReadStreamRef;
  runLoop: CFRunLoopRef; runLoopMode: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamScheduleWithRunLoop';
procedure CFWriteStreamScheduleWithRunLoop(stream: CFWriteStreamRef;
  runLoop: CFRunLoopRef; runLoopMode: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamScheduleWithRunLoop';
procedure CFReadStreamUnscheduleFromRunLoop(stream: CFReadStreamRef;
  runLoop: CFRunLoopRef; runLoopMode: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamUnscheduleFromRunLoop';
procedure CFWriteStreamUnscheduleFromRunLoop(stream: CFWriteStreamRef;
  runLoop: CFRunLoopRef; runLoopMode: CFStringRef); cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamUnscheduleFromRunLoop';
procedure CFReadStreamSetDispatchQueue(stream: CFReadStreamRef;
  q: dispatch_queue_t); cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamSetDispatchQueue';
procedure CFWriteStreamSetDispatchQueue(stream: CFWriteStreamRef;
  q: dispatch_queue_t); cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamSetDispatchQueue';
function CFReadStreamCopyDispatchQueue(stream: CFReadStreamRef)
  : dispatch_queue_t; cdecl; external libCoreFoundation name _PU +
  'CFReadStreamCopyDispatchQueue';
function CFWriteStreamCopyDispatchQueue(stream: CFWriteStreamRef)
  : dispatch_queue_t; cdecl; external libCoreFoundation name _PU +
  'CFWriteStreamCopyDispatchQueue';
function CFReadStreamGetError(stream: CFReadStreamRef): CFStreamError; cdecl;
  external libCoreFoundation name _PU + 'CFReadStreamGetError';
function CFWriteStreamGetError(stream: CFWriteStreamRef): CFStreamError; cdecl;
  external libCoreFoundation name _PU + 'CFWriteStreamGetError';
function CFPropertyListCreateFromXMLData(allocator: CFAllocatorRef;
  xmlData: CFDataRef; mutabilityOption: CFOptionFlags; errorString: Pointer)
  : CFPropertyListRef; cdecl; external libCoreFoundation name _PU +
  'CFPropertyListCreateFromXMLData';
function CFPropertyListCreateXMLData(allocator: CFAllocatorRef;
  propertyList: CFPropertyListRef): CFDataRef; cdecl;
  external libCoreFoundation name _PU + 'CFPropertyListCreateXMLData';
function CFPropertyListCreateDeepCopy(allocator: CFAllocatorRef;
  propertyList: CFPropertyListRef; mutabilityOption: CFOptionFlags)
  : CFPropertyListRef; cdecl; external libCoreFoundation name _PU +
  'CFPropertyListCreateDeepCopy';
function CFPropertyListIsValid(plist: CFPropertyListRef;
  format: CFPropertyListFormat): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFPropertyListIsValid';
function CFPropertyListWriteToStream(propertyList: CFPropertyListRef;
  stream: CFWriteStreamRef; format: CFPropertyListFormat; errorString: Pointer)
  : CFIndex; cdecl; external libCoreFoundation name _PU +
  'CFPropertyListWriteToStream';
function CFPropertyListCreateFromStream(allocator: CFAllocatorRef;
  stream: CFReadStreamRef; streamLength: CFIndex;
  mutabilityOption: CFOptionFlags; format: CFIndex; errorString: Pointer)
  : CFPropertyListRef; cdecl; external libCoreFoundation name _PU +
  'CFPropertyListCreateFromStream';
function CFPropertyListCreateWithData(allocator: CFAllocatorRef;
  data: CFDataRef; options: CFOptionFlags; format: CFIndex; error: Pointer)
  : CFPropertyListRef; cdecl; external libCoreFoundation name _PU +
  'CFPropertyListCreateWithData';
function CFPropertyListCreateWithStream(allocator: CFAllocatorRef;
  stream: CFReadStreamRef; streamLength: CFIndex; options: CFOptionFlags;
  format: CFIndex; error: Pointer): CFPropertyListRef; cdecl;
  external libCoreFoundation name _PU + 'CFPropertyListCreateWithStream';
function CFPropertyListWrite(propertyList: CFPropertyListRef;
  stream: CFWriteStreamRef; format: CFPropertyListFormat;
  options: CFOptionFlags; error: Pointer): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFPropertyListWrite';
function CFPropertyListCreateData(allocator: CFAllocatorRef;
  propertyList: CFPropertyListRef; format: CFPropertyListFormat;
  options: CFOptionFlags; error: Pointer): CFDataRef; cdecl;
  external libCoreFoundation name _PU + 'CFPropertyListCreateData';
function CFSetGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFSetGetTypeID';
function CFSetCreate(allocator: CFAllocatorRef; values: Pointer;
  numValues: CFIndex; callBacks: Pointer): CFSetRef; cdecl;
  external libCoreFoundation name _PU + 'CFSetCreate';
function CFSetCreateCopy(allocator: CFAllocatorRef; theSet: CFSetRef): CFSetRef;
  cdecl; external libCoreFoundation name _PU + 'CFSetCreateCopy';
function CFSetCreateMutable(allocator: CFAllocatorRef; capacity: CFIndex;
  callBacks: Pointer): CFMutableSetRef; cdecl;
  external libCoreFoundation name _PU + 'CFSetCreateMutable';
function CFSetCreateMutableCopy(allocator: CFAllocatorRef; capacity: CFIndex;
  theSet: CFSetRef): CFMutableSetRef; cdecl;
  external libCoreFoundation name _PU + 'CFSetCreateMutableCopy';
function CFSetGetCount(theSet: CFSetRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFSetGetCount';
function CFSetGetCountOfValue(theSet: CFSetRef; value: Pointer): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFSetGetCountOfValue';
function CFSetContainsValue(theSet: CFSetRef; value: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFSetContainsValue';
function CFSetGetValue(theSet: CFSetRef; value: Pointer): Pointer; cdecl;
  external libCoreFoundation name _PU + 'CFSetGetValue';
function CFSetGetValueIfPresent(theSet: CFSetRef; candidate: Pointer;
  value: Pointer): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFSetGetValueIfPresent';
procedure CFSetGetValues(theSet: CFSetRef; values: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFSetGetValues';
procedure CFSetApplyFunction(theSet: CFSetRef; applier: CFSetApplierFunction;
  context: Pointer); cdecl; external libCoreFoundation name _PU +
  'CFSetApplyFunction';
procedure CFSetAddValue(theSet: CFMutableSetRef; value: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFSetAddValue';
procedure CFSetReplaceValue(theSet: CFMutableSetRef; value: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFSetReplaceValue';
procedure CFSetSetValue(theSet: CFMutableSetRef; value: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFSetSetValue';
procedure CFSetRemoveValue(theSet: CFMutableSetRef; value: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFSetRemoveValue';
procedure CFSetRemoveAllValues(theSet: CFMutableSetRef); cdecl;
  external libCoreFoundation name _PU + 'CFSetRemoveAllValues';
function CFStringTokenizerCopyBestStringLanguage(&string: CFStringRef;
  range: CFRange): CFStringRef; cdecl;
  external libCoreFoundation name _PU +
  'CFStringTokenizerCopyBestStringLanguage';
function CFStringTokenizerGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFStringTokenizerGetTypeID';
function CFStringTokenizerCreate(alloc: CFAllocatorRef; &string: CFStringRef;
  range: CFRange; options: CFOptionFlags; locale: CFLocaleRef)
  : CFStringTokenizerRef; cdecl;
  external libCoreFoundation name _PU + 'CFStringTokenizerCreate';
procedure CFStringTokenizerSetString(tokenizer: CFStringTokenizerRef;
  &string: CFStringRef; range: CFRange); cdecl;
  external libCoreFoundation name _PU + 'CFStringTokenizerSetString';
function CFStringTokenizerGoToTokenAtIndex(tokenizer: CFStringTokenizerRef;
  index: CFIndex): CFStringTokenizerTokenType; cdecl;
  external libCoreFoundation name _PU + 'CFStringTokenizerGoToTokenAtIndex';
function CFStringTokenizerAdvanceToNextToken(tokenizer: CFStringTokenizerRef)
  : CFStringTokenizerTokenType; cdecl;
  external libCoreFoundation name _PU + 'CFStringTokenizerAdvanceToNextToken';
function CFStringTokenizerGetCurrentTokenRange(tokenizer: CFStringTokenizerRef)
  : CFRange; cdecl; external libCoreFoundation name _PU +
  'CFStringTokenizerGetCurrentTokenRange';
function CFStringTokenizerCopyCurrentTokenAttribute
  (tokenizer: CFStringTokenizerRef; attribute: CFOptionFlags): CFTypeRef; cdecl;
  external libCoreFoundation name _PU +
  'CFStringTokenizerCopyCurrentTokenAttribute';
function CFStringTokenizerGetCurrentSubTokens(tokenizer: CFStringTokenizerRef;
  ranges: Pointer; maxRangeLength: CFIndex; derivedSubTokens: CFMutableArrayRef)
  : CFIndex; cdecl; external libCoreFoundation name _PU +
  'CFStringTokenizerGetCurrentSubTokens';
function CFTreeGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFTreeGetTypeID';
function CFTreeCreate(allocator: CFAllocatorRef; context: Pointer): CFTreeRef;
  cdecl; external libCoreFoundation name _PU + 'CFTreeCreate';
function CFTreeGetParent(tree: CFTreeRef): CFTreeRef; cdecl;
  external libCoreFoundation name _PU + 'CFTreeGetParent';
function CFTreeGetNextSibling(tree: CFTreeRef): CFTreeRef; cdecl;
  external libCoreFoundation name _PU + 'CFTreeGetNextSibling';
function CFTreeGetFirstChild(tree: CFTreeRef): CFTreeRef; cdecl;
  external libCoreFoundation name _PU + 'CFTreeGetFirstChild';
procedure CFTreeGetContext(tree: CFTreeRef; context: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFTreeGetContext';
function CFTreeGetChildCount(tree: CFTreeRef): CFIndex; cdecl;
  external libCoreFoundation name _PU + 'CFTreeGetChildCount';
function CFTreeGetChildAtIndex(tree: CFTreeRef; idx: CFIndex): CFTreeRef; cdecl;
  external libCoreFoundation name _PU + 'CFTreeGetChildAtIndex';
procedure CFTreeGetChildren(tree: CFTreeRef; children: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFTreeGetChildren';
procedure CFTreeApplyFunctionToChildren(tree: CFTreeRef;
  applier: CFTreeApplierFunction; context: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFTreeApplyFunctionToChildren';
function CFTreeFindRoot(tree: CFTreeRef): CFTreeRef; cdecl;
  external libCoreFoundation name _PU + 'CFTreeFindRoot';
procedure CFTreeSetContext(tree: CFTreeRef; context: Pointer); cdecl;
  external libCoreFoundation name _PU + 'CFTreeSetContext';
procedure CFTreePrependChild(tree: CFTreeRef; newChild: CFTreeRef); cdecl;
  external libCoreFoundation name _PU + 'CFTreePrependChild';
procedure CFTreeAppendChild(tree: CFTreeRef; newChild: CFTreeRef); cdecl;
  external libCoreFoundation name _PU + 'CFTreeAppendChild';
procedure CFTreeInsertSibling(tree: CFTreeRef; newSibling: CFTreeRef); cdecl;
  external libCoreFoundation name _PU + 'CFTreeInsertSibling';
procedure CFTreeRemove(tree: CFTreeRef); cdecl;
  external libCoreFoundation name _PU + 'CFTreeRemove';
procedure CFTreeRemoveAllChildren(tree: CFTreeRef); cdecl;
  external libCoreFoundation name _PU + 'CFTreeRemoveAllChildren';
procedure CFTreeSortChildren(tree: CFTreeRef; comparator: CFComparatorFunction;
  context: Pointer); cdecl; external libCoreFoundation name _PU +
  'CFTreeSortChildren';
function CFURLCreateDataAndPropertiesFromResource(alloc: CFAllocatorRef;
  url: CFURLRef; resourceData: Pointer; properties: Pointer;
  desiredProperties: CFArrayRef; errorCode: PLongInt): Boolean; cdecl;
  external libCoreFoundation name _PU +
  'CFURLCreateDataAndPropertiesFromResource';
function CFURLWriteDataAndPropertiesToResource(url: CFURLRef;
  dataToWrite: CFDataRef; propertiesToWrite: CFDictionaryRef;
  errorCode: PLongInt): Boolean; cdecl;
  external libCoreFoundation name _PU + 'CFURLWriteDataAndPropertiesToResource';
function CFURLDestroyResource(url: CFURLRef; errorCode: PLongInt): Boolean;
  cdecl; external libCoreFoundation name _PU + 'CFURLDestroyResource';
function CFURLCreatePropertyFromResource(alloc: CFAllocatorRef; url: CFURLRef;
  &property: CFStringRef; errorCode: PLongInt): CFTypeRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLCreatePropertyFromResource';
function CFURLEnumeratorGetTypeID: CFTypeID; cdecl;
  external libCoreFoundation name _PU + 'CFURLEnumeratorGetTypeID';
function CFURLEnumeratorCreateForDirectoryURL(alloc: CFAllocatorRef;
  directoryURL: CFURLRef; option: CFURLEnumeratorOptions;
  propertyKeys: CFArrayRef): CFURLEnumeratorRef; cdecl;
  external libCoreFoundation name _PU + 'CFURLEnumeratorCreateForDirectoryURL';
function CFURLEnumeratorCreateForMountedVolumes(alloc: CFAllocatorRef;
  option: CFURLEnumeratorOptions; propertyKeys: CFArrayRef): CFURLEnumeratorRef;
  cdecl; external libCoreFoundation name _PU +
  'CFURLEnumeratorCreateForMountedVolumes';
function CFURLEnumeratorGetNextURL(enumerator: CFURLEnumeratorRef; url: Pointer;
  error: Pointer): CFURLEnumeratorResult; cdecl;
  external libCoreFoundation name _PU + 'CFURLEnumeratorGetNextURL';
procedure CFURLEnumeratorSkipDescendents(enumerator: CFURLEnumeratorRef); cdecl;
  external libCoreFoundation name _PU + 'CFURLEnumeratorSkipDescendents';
function CFURLEnumeratorGetDescendentLevel(enumerator: CFURLEnumeratorRef)
  : CFIndex; cdecl; external libCoreFoundation name _PU +
  'CFURLEnumeratorGetDescendentLevel';
function CFURLEnumeratorGetSourceDidChange(enumerator: CFURLEnumeratorRef)
  : Boolean; cdecl; external libCoreFoundation name _PU +
  'CFURLEnumeratorGetSourceDidChange';
function CFCopyHomeDirectoryURL: CFURLRef; cdecl;
  external libCoreFoundation name _PU + 'CFCopyHomeDirectoryURL';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreFoundationModule: THandle;

{$ENDIF IOS}

function kCFCoreFoundationVersionNumber: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFCoreFoundationVersionNumber');
end;

function kCFNull: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFNull');
end;

function kCFAllocatorDefault: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFAllocatorDefault');
end;

function kCFAllocatorSystemDefault: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFAllocatorSystemDefault');
end;

function kCFAllocatorMalloc: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFAllocatorMalloc');
end;

function kCFAllocatorMallocZone: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFAllocatorMallocZone');
end;

function kCFAllocatorNull: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFAllocatorNull');
end;

function kCFAllocatorUseContext: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFAllocatorUseContext');
end;

function kCFTypeArrayCallBacks: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFTypeArrayCallBacks');
end;

function kCFTypeDictionaryKeyCallBacks: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFTypeDictionaryKeyCallBacks');
end;

function kCFCopyStringDictionaryKeyCallBacks: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFCopyStringDictionaryKeyCallBacks');
end;

function kCFTypeDictionaryValueCallBacks: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFTypeDictionaryValueCallBacks');
end;

function kCFLocaleCurrentLocaleDidChangeNotification: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFLocaleCurrentLocaleDidChangeNotification');
end;

function kCFLocaleIdentifier: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleIdentifier');
end;

function kCFLocaleLanguageCode: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleLanguageCode');
end;

function kCFLocaleCountryCode: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleCountryCode');
end;

function kCFLocaleScriptCode: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleScriptCode');
end;

function kCFLocaleVariantCode: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleVariantCode');
end;

function kCFLocaleExemplarCharacterSet: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFLocaleExemplarCharacterSet');
end;

function kCFLocaleCalendarIdentifier: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleCalendarIdentifier');
end;

function kCFLocaleCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleCalendar');
end;

function kCFLocaleCollationIdentifier: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFLocaleCollationIdentifier');
end;

function kCFLocaleUsesMetricSystem: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleUsesMetricSystem');
end;

function kCFLocaleMeasurementSystem: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleMeasurementSystem');
end;

function kCFLocaleDecimalSeparator: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleDecimalSeparator');
end;

function kCFLocaleGroupingSeparator: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleGroupingSeparator');
end;

function kCFLocaleCurrencySymbol: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleCurrencySymbol');
end;

function kCFLocaleCurrencyCode: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleCurrencyCode');
end;

function kCFLocaleCollatorIdentifier: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFLocaleCollatorIdentifier');
end;

function kCFLocaleQuotationBeginDelimiterKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFLocaleQuotationBeginDelimiterKey');
end;

function kCFLocaleQuotationEndDelimiterKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFLocaleQuotationEndDelimiterKey');
end;

function kCFLocaleAlternateQuotationBeginDelimiterKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFLocaleAlternateQuotationBeginDelimiterKey');
end;

function kCFLocaleAlternateQuotationEndDelimiterKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFLocaleAlternateQuotationEndDelimiterKey');
end;

function kCFGregorianCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFGregorianCalendar');
end;

function kCFBuddhistCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFBuddhistCalendar');
end;

function kCFChineseCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFChineseCalendar');
end;

function kCFHebrewCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFHebrewCalendar');
end;

function kCFIslamicCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFIslamicCalendar');
end;

function kCFIslamicCivilCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFIslamicCivilCalendar');
end;

function kCFJapaneseCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFJapaneseCalendar');
end;

function kCFRepublicOfChinaCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFRepublicOfChinaCalendar');
end;

function kCFPersianCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFPersianCalendar');
end;

function kCFIndianCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFIndianCalendar');
end;

function kCFISO8601Calendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFISO8601Calendar');
end;

function kCFIslamicTabularCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFIslamicTabularCalendar');
end;

function kCFIslamicUmmAlQuraCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFIslamicUmmAlQuraCalendar');
end;

function kCFStringTransformStripCombiningMarks: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringTransformStripCombiningMarks');
end;

function kCFStringTransformToLatin: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFStringTransformToLatin');
end;

function kCFStringTransformFullwidthHalfwidth: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringTransformFullwidthHalfwidth');
end;

function kCFStringTransformLatinKatakana: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringTransformLatinKatakana');
end;

function kCFStringTransformLatinHiragana: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringTransformLatinHiragana');
end;

function kCFStringTransformHiraganaKatakana: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringTransformHiraganaKatakana');
end;

function kCFStringTransformMandarinLatin: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringTransformMandarinLatin');
end;

function kCFStringTransformLatinHangul: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringTransformLatinHangul');
end;

function kCFStringTransformLatinArabic: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringTransformLatinArabic');
end;

function kCFStringTransformLatinHebrew: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringTransformLatinHebrew');
end;

function kCFStringTransformLatinThai: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFStringTransformLatinThai');
end;

function kCFStringTransformLatinCyrillic: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringTransformLatinCyrillic');
end;

function kCFStringTransformLatinGreek: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringTransformLatinGreek');
end;

function kCFStringTransformToXMLHex: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFStringTransformToXMLHex');
end;

function kCFStringTransformToUnicodeName: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringTransformToUnicodeName');
end;

function kCFStringTransformStripDiacritics: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringTransformStripDiacritics');
end;

function kCFTypeBagCallBacks: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFTypeBagCallBacks');
end;

function kCFCopyStringBagCallBacks: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFCopyStringBagCallBacks');
end;

function kCFStringBinaryHeapCallBacks: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStringBinaryHeapCallBacks');
end;

function kCFErrorDomainPOSIX: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFErrorDomainPOSIX');
end;

function kCFErrorDomainOSStatus: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFErrorDomainOSStatus');
end;

function kCFErrorDomainMach: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFErrorDomainMach');
end;

function kCFErrorDomainCocoa: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFErrorDomainCocoa');
end;

function kCFErrorLocalizedDescriptionKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFErrorLocalizedDescriptionKey');
end;

function kCFErrorLocalizedFailureReasonKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFErrorLocalizedFailureReasonKey');
end;

function kCFErrorLocalizedRecoverySuggestionKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFErrorLocalizedRecoverySuggestionKey');
end;

function kCFErrorDescriptionKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFErrorDescriptionKey');
end;

function kCFErrorUnderlyingErrorKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFErrorUnderlyingErrorKey');
end;

function kCFErrorURLKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFErrorURLKey');
end;

function kCFErrorFilePathKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFErrorFilePathKey');
end;

function kCFURLKeysOfUnsetValuesKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLKeysOfUnsetValuesKey');
end;

function kCFURLNameKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLNameKey');
end;

function kCFURLLocalizedNameKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLLocalizedNameKey');
end;

function kCFURLIsRegularFileKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsRegularFileKey');
end;

function kCFURLIsDirectoryKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsDirectoryKey');
end;

function kCFURLIsSymbolicLinkKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsSymbolicLinkKey');
end;

function kCFURLIsVolumeKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsVolumeKey');
end;

function kCFURLIsPackageKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsPackageKey');
end;

function kCFURLIsApplicationKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsApplicationKey');
end;

function kCFURLApplicationIsScriptableKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLApplicationIsScriptableKey');
end;

function kCFURLIsSystemImmutableKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsSystemImmutableKey');
end;

function kCFURLIsUserImmutableKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsUserImmutableKey');
end;

function kCFURLIsHiddenKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsHiddenKey');
end;

function kCFURLHasHiddenExtensionKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLHasHiddenExtensionKey');
end;

function kCFURLCreationDateKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLCreationDateKey');
end;

function kCFURLContentAccessDateKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLContentAccessDateKey');
end;

function kCFURLContentModificationDateKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLContentModificationDateKey');
end;

function kCFURLAttributeModificationDateKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLAttributeModificationDateKey');
end;

function kCFURLLinkCountKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLLinkCountKey');
end;

function kCFURLParentDirectoryURLKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLParentDirectoryURLKey');
end;

function kCFURLVolumeURLKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLVolumeURLKey');
end;

function kCFURLTypeIdentifierKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLTypeIdentifierKey');
end;

function kCFURLLocalizedTypeDescriptionKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLLocalizedTypeDescriptionKey');
end;

function kCFURLLabelNumberKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLLabelNumberKey');
end;

function kCFURLLabelColorKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLLabelColorKey');
end;

function kCFURLLocalizedLabelKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLLocalizedLabelKey');
end;

function kCFURLEffectiveIconKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLEffectiveIconKey');
end;

function kCFURLCustomIconKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLCustomIconKey');
end;

function kCFURLFileResourceIdentifierKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLFileResourceIdentifierKey');
end;

function kCFURLVolumeIdentifierKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLVolumeIdentifierKey');
end;

function kCFURLPreferredIOBlockSizeKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLPreferredIOBlockSizeKey');
end;

function kCFURLIsReadableKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsReadableKey');
end;

function kCFURLIsWritableKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsWritableKey');
end;

function kCFURLIsExecutableKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsExecutableKey');
end;

function kCFURLFileSecurityKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLFileSecurityKey');
end;

function kCFURLIsExcludedFromBackupKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLIsExcludedFromBackupKey');
end;

function kCFURLTagNamesKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLTagNamesKey');
end;

function kCFURLPathKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLPathKey');
end;

function kCFURLIsMountTriggerKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsMountTriggerKey');
end;

function kCFURLGenerationIdentifierKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLGenerationIdentifierKey');
end;

function kCFURLDocumentIdentifierKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLDocumentIdentifierKey');
end;

function kCFURLAddedToDirectoryDateKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLAddedToDirectoryDateKey');
end;

function kCFURLQuarantinePropertiesKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLQuarantinePropertiesKey');
end;

function kCFURLFileResourceTypeKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLFileResourceTypeKey');
end;

function kCFURLFileResourceTypeNamedPipe: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLFileResourceTypeNamedPipe');
end;

function kCFURLFileResourceTypeCharacterSpecial: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLFileResourceTypeCharacterSpecial');
end;

function kCFURLFileResourceTypeDirectory: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLFileResourceTypeDirectory');
end;

function kCFURLFileResourceTypeBlockSpecial: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLFileResourceTypeBlockSpecial');
end;

function kCFURLFileResourceTypeRegular: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLFileResourceTypeRegular');
end;

function kCFURLFileResourceTypeSymbolicLink: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLFileResourceTypeSymbolicLink');
end;

function kCFURLFileResourceTypeSocket: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLFileResourceTypeSocket');
end;

function kCFURLFileResourceTypeUnknown: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLFileResourceTypeUnknown');
end;

function kCFURLFileSizeKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLFileSizeKey');
end;

function kCFURLFileAllocatedSizeKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLFileAllocatedSizeKey');
end;

function kCFURLTotalFileSizeKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLTotalFileSizeKey');
end;

function kCFURLTotalFileAllocatedSizeKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLTotalFileAllocatedSizeKey');
end;

function kCFURLIsAliasFileKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsAliasFileKey');
end;

function kCFURLFileProtectionKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLFileProtectionKey');
end;

function kCFURLFileProtectionNone: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLFileProtectionNone');
end;

function kCFURLFileProtectionComplete: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLFileProtectionComplete');
end;

function kCFURLFileProtectionCompleteUnlessOpen: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLFileProtectionCompleteUnlessOpen');
end;

function kCFURLFileProtectionCompleteUntilFirstUserAuthentication: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLFileProtectionCompleteUntilFirstUserAuthentication');
end;

function kCFURLVolumeLocalizedFormatDescriptionKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeLocalizedFormatDescriptionKey');
end;

function kCFURLVolumeTotalCapacityKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeTotalCapacityKey');
end;

function kCFURLVolumeAvailableCapacityKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeAvailableCapacityKey');
end;

function kCFURLVolumeResourceCountKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeResourceCountKey');
end;

function kCFURLVolumeSupportsPersistentIDsKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeSupportsPersistentIDsKey');
end;

function kCFURLVolumeSupportsSymbolicLinksKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeSupportsSymbolicLinksKey');
end;

function kCFURLVolumeSupportsHardLinksKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeSupportsHardLinksKey');
end;

function kCFURLVolumeSupportsJournalingKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeSupportsJournalingKey');
end;

function kCFURLVolumeIsJournalingKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLVolumeIsJournalingKey');
end;

function kCFURLVolumeSupportsSparseFilesKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeSupportsSparseFilesKey');
end;

function kCFURLVolumeSupportsZeroRunsKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeSupportsZeroRunsKey');
end;

function kCFURLVolumeSupportsCaseSensitiveNamesKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeSupportsCaseSensitiveNamesKey');
end;

function kCFURLVolumeSupportsCasePreservedNamesKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeSupportsCasePreservedNamesKey');
end;

function kCFURLVolumeSupportsRootDirectoryDatesKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeSupportsRootDirectoryDatesKey');
end;

function kCFURLVolumeSupportsVolumeSizesKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeSupportsVolumeSizesKey');
end;

function kCFURLVolumeSupportsRenamingKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeSupportsRenamingKey');
end;

function kCFURLVolumeSupportsAdvisoryFileLockingKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeSupportsAdvisoryFileLockingKey');
end;

function kCFURLVolumeSupportsExtendedSecurityKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeSupportsExtendedSecurityKey');
end;

function kCFURLVolumeIsBrowsableKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLVolumeIsBrowsableKey');
end;

function kCFURLVolumeMaximumFileSizeKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeMaximumFileSizeKey');
end;

function kCFURLVolumeIsEjectableKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLVolumeIsEjectableKey');
end;

function kCFURLVolumeIsRemovableKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLVolumeIsRemovableKey');
end;

function kCFURLVolumeIsInternalKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLVolumeIsInternalKey');
end;

function kCFURLVolumeIsAutomountedKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeIsAutomountedKey');
end;

function kCFURLVolumeIsLocalKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLVolumeIsLocalKey');
end;

function kCFURLVolumeIsReadOnlyKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLVolumeIsReadOnlyKey');
end;

function kCFURLVolumeCreationDateKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLVolumeCreationDateKey');
end;

function kCFURLVolumeURLForRemountingKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeURLForRemountingKey');
end;

function kCFURLVolumeUUIDStringKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLVolumeUUIDStringKey');
end;

function kCFURLVolumeNameKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLVolumeNameKey');
end;

function kCFURLVolumeLocalizedNameKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLVolumeLocalizedNameKey');
end;

function kCFURLIsUbiquitousItemKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLIsUbiquitousItemKey');
end;

function kCFURLUbiquitousItemHasUnresolvedConflictsKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLUbiquitousItemHasUnresolvedConflictsKey');
end;

function kCFURLUbiquitousItemIsDownloadedKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLUbiquitousItemIsDownloadedKey');
end;

function kCFURLUbiquitousItemIsDownloadingKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLUbiquitousItemIsDownloadingKey');
end;

function kCFURLUbiquitousItemIsUploadedKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLUbiquitousItemIsUploadedKey');
end;

function kCFURLUbiquitousItemIsUploadingKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLUbiquitousItemIsUploadingKey');
end;

function kCFURLUbiquitousItemPercentDownloadedKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLUbiquitousItemPercentDownloadedKey');
end;

function kCFURLUbiquitousItemPercentUploadedKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLUbiquitousItemPercentUploadedKey');
end;

function kCFURLUbiquitousItemDownloadingStatusKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLUbiquitousItemDownloadingStatusKey');
end;

function kCFURLUbiquitousItemDownloadingErrorKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLUbiquitousItemDownloadingErrorKey');
end;

function kCFURLUbiquitousItemUploadingErrorKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLUbiquitousItemUploadingErrorKey');
end;

function kCFURLUbiquitousItemDownloadingStatusNotDownloaded: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLUbiquitousItemDownloadingStatusNotDownloaded');
end;

function kCFURLUbiquitousItemDownloadingStatusDownloaded: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLUbiquitousItemDownloadingStatusDownloaded');
end;

function kCFURLUbiquitousItemDownloadingStatusCurrent: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLUbiquitousItemDownloadingStatusCurrent');
end;

function kCFBundleInfoDictionaryVersionKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFBundleInfoDictionaryVersionKey');
end;

function kCFBundleExecutableKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFBundleExecutableKey');
end;

function kCFBundleIdentifierKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFBundleIdentifierKey');
end;

function kCFBundleVersionKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFBundleVersionKey');
end;

function kCFBundleDevelopmentRegionKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFBundleDevelopmentRegionKey');
end;

function kCFBundleNameKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFBundleNameKey');
end;

function kCFBundleLocalizationsKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFBundleLocalizationsKey');
end;

function kCFAbsoluteTimeIntervalSince1970: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFAbsoluteTimeIntervalSince1970');
end;

function kCFAbsoluteTimeIntervalSince1904: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFAbsoluteTimeIntervalSince1904');
end;

function kCFTimeZoneSystemTimeZoneDidChangeNotification: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFTimeZoneSystemTimeZoneDidChangeNotification');
end;

function kCFDateFormatterIsLenient: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFDateFormatterIsLenient');
end;

function kCFDateFormatterTimeZone: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFDateFormatterTimeZone');
end;

function kCFDateFormatterCalendarName: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterCalendarName');
end;

function kCFDateFormatterDefaultFormat: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterDefaultFormat');
end;

function kCFDateFormatterTwoDigitStartDate: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterTwoDigitStartDate');
end;

function kCFDateFormatterDefaultDate: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFDateFormatterDefaultDate');
end;

function kCFDateFormatterCalendar: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFDateFormatterCalendar');
end;

function kCFDateFormatterEraSymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFDateFormatterEraSymbols');
end;

function kCFDateFormatterMonthSymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterMonthSymbols');
end;

function kCFDateFormatterShortMonthSymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterShortMonthSymbols');
end;

function kCFDateFormatterWeekdaySymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterWeekdaySymbols');
end;

function kCFDateFormatterShortWeekdaySymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterShortWeekdaySymbols');
end;

function kCFDateFormatterAMSymbol: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFDateFormatterAMSymbol');
end;

function kCFDateFormatterPMSymbol: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFDateFormatterPMSymbol');
end;

function kCFDateFormatterLongEraSymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterLongEraSymbols');
end;

function kCFDateFormatterVeryShortMonthSymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterVeryShortMonthSymbols');
end;

function kCFDateFormatterStandaloneMonthSymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterStandaloneMonthSymbols');
end;

function kCFDateFormatterShortStandaloneMonthSymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterShortStandaloneMonthSymbols');
end;

function kCFDateFormatterVeryShortStandaloneMonthSymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterVeryShortStandaloneMonthSymbols');
end;

function kCFDateFormatterVeryShortWeekdaySymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterVeryShortWeekdaySymbols');
end;

function kCFDateFormatterStandaloneWeekdaySymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterStandaloneWeekdaySymbols');
end;

function kCFDateFormatterShortStandaloneWeekdaySymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterShortStandaloneWeekdaySymbols');
end;

function kCFDateFormatterVeryShortStandaloneWeekdaySymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterVeryShortStandaloneWeekdaySymbols');
end;

function kCFDateFormatterQuarterSymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterQuarterSymbols');
end;

function kCFDateFormatterShortQuarterSymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterShortQuarterSymbols');
end;

function kCFDateFormatterStandaloneQuarterSymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterStandaloneQuarterSymbols');
end;

function kCFDateFormatterShortStandaloneQuarterSymbols: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterShortStandaloneQuarterSymbols');
end;

function kCFDateFormatterGregorianStartDate: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterGregorianStartDate');
end;

function kCFDateFormatterDoesRelativeDateFormattingKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFDateFormatterDoesRelativeDateFormattingKey');
end;

function kCFRunLoopDefaultMode: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFRunLoopDefaultMode');
end;

function kCFRunLoopCommonModes: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFRunLoopCommonModes');
end;

function kCFBooleanTrue: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFBooleanTrue');
end;

function kCFBooleanFalse: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFBooleanFalse');
end;

function kCFNumberPositiveInfinity: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFNumberPositiveInfinity');
end;

function kCFNumberNegativeInfinity: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFNumberNegativeInfinity');
end;

function kCFNumberNaN: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFNumberNaN');
end;

function kCFNumberFormatterCurrencyCode: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterCurrencyCode');
end;

function kCFNumberFormatterDecimalSeparator: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterDecimalSeparator');
end;

function kCFNumberFormatterCurrencyDecimalSeparator: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterCurrencyDecimalSeparator');
end;

function kCFNumberFormatterAlwaysShowDecimalSeparator: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterAlwaysShowDecimalSeparator');
end;

function kCFNumberFormatterGroupingSeparator: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterGroupingSeparator');
end;

function kCFNumberFormatterUseGroupingSeparator: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterUseGroupingSeparator');
end;

function kCFNumberFormatterPercentSymbol: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterPercentSymbol');
end;

function kCFNumberFormatterZeroSymbol: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterZeroSymbol');
end;

function kCFNumberFormatterNaNSymbol: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFNumberFormatterNaNSymbol');
end;

function kCFNumberFormatterInfinitySymbol: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterInfinitySymbol');
end;

function kCFNumberFormatterMinusSign: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFNumberFormatterMinusSign');
end;

function kCFNumberFormatterPlusSign: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFNumberFormatterPlusSign');
end;

function kCFNumberFormatterCurrencySymbol: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterCurrencySymbol');
end;

function kCFNumberFormatterExponentSymbol: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterExponentSymbol');
end;

function kCFNumberFormatterMinIntegerDigits: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterMinIntegerDigits');
end;

function kCFNumberFormatterMaxIntegerDigits: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterMaxIntegerDigits');
end;

function kCFNumberFormatterMinFractionDigits: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterMinFractionDigits');
end;

function kCFNumberFormatterMaxFractionDigits: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterMaxFractionDigits');
end;

function kCFNumberFormatterGroupingSize: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterGroupingSize');
end;

function kCFNumberFormatterSecondaryGroupingSize: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterSecondaryGroupingSize');
end;

function kCFNumberFormatterRoundingMode: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterRoundingMode');
end;

function kCFNumberFormatterRoundingIncrement: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterRoundingIncrement');
end;

function kCFNumberFormatterFormatWidth: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterFormatWidth');
end;

function kCFNumberFormatterPaddingPosition: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterPaddingPosition');
end;

function kCFNumberFormatterPaddingCharacter: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterPaddingCharacter');
end;

function kCFNumberFormatterDefaultFormat: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterDefaultFormat');
end;

function kCFNumberFormatterMultiplier: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterMultiplier');
end;

function kCFNumberFormatterPositivePrefix: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterPositivePrefix');
end;

function kCFNumberFormatterPositiveSuffix: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterPositiveSuffix');
end;

function kCFNumberFormatterNegativePrefix: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterNegativePrefix');
end;

function kCFNumberFormatterNegativeSuffix: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterNegativeSuffix');
end;

function kCFNumberFormatterPerMillSymbol: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterPerMillSymbol');
end;

function kCFNumberFormatterInternationalCurrencySymbol: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterInternationalCurrencySymbol');
end;

function kCFNumberFormatterCurrencyGroupingSeparator: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterCurrencyGroupingSeparator');
end;

function kCFNumberFormatterIsLenient: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFNumberFormatterIsLenient');
end;

function kCFNumberFormatterUseSignificantDigits: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterUseSignificantDigits');
end;

function kCFNumberFormatterMinSignificantDigits: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterMinSignificantDigits');
end;

function kCFNumberFormatterMaxSignificantDigits: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFNumberFormatterMaxSignificantDigits');
end;

function kCFPlugInDynamicRegistrationKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFPlugInDynamicRegistrationKey');
end;

function kCFPlugInDynamicRegisterFunctionKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFPlugInDynamicRegisterFunctionKey');
end;

function kCFPlugInUnloadFunctionKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFPlugInUnloadFunctionKey');
end;

function kCFPlugInFactoriesKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFPlugInFactoriesKey');
end;

function kCFPlugInTypesKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFPlugInTypesKey');
end;

function kCFPreferencesAnyApplication: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFPreferencesAnyApplication');
end;

function kCFPreferencesCurrentApplication: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFPreferencesCurrentApplication');
end;

function kCFPreferencesAnyHost: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFPreferencesAnyHost');
end;

function kCFPreferencesCurrentHost: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFPreferencesCurrentHost');
end;

function kCFPreferencesAnyUser: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFPreferencesAnyUser');
end;

function kCFPreferencesCurrentUser: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFPreferencesCurrentUser');
end;

function kCFSocketCommandKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFSocketCommandKey');
end;

function kCFSocketNameKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFSocketNameKey');
end;

function kCFSocketValueKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFSocketValueKey');
end;

function kCFSocketResultKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFSocketResultKey');
end;

function kCFSocketErrorKey: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFSocketErrorKey');
end;

function kCFSocketRegisterCommand: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFSocketRegisterCommand');
end;

function kCFSocketRetrieveCommand: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFSocketRetrieveCommand');
end;

function kCFStreamPropertyDataWritten: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStreamPropertyDataWritten');
end;

function kCFStreamPropertyAppendToFile: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStreamPropertyAppendToFile');
end;

function kCFStreamPropertyFileCurrentOffset: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStreamPropertyFileCurrentOffset');
end;

function kCFStreamPropertySocketNativeHandle: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStreamPropertySocketNativeHandle');
end;

function kCFStreamPropertySocketRemoteHostName: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStreamPropertySocketRemoteHostName');
end;

function kCFStreamPropertySocketRemotePortNumber: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFStreamPropertySocketRemotePortNumber');
end;

function kCFTypeSetCallBacks: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFTypeSetCallBacks');
end;

function kCFCopyStringSetCallBacks: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFCopyStringSetCallBacks');
end;

function kCFURLFileExists: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLFileExists');
end;

function kCFURLFileDirectoryContents: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLFileDirectoryContents');
end;

function kCFURLFileLength: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLFileLength');
end;

function kCFURLFileLastModificationTime: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation,
    'kCFURLFileLastModificationTime');
end;

function kCFURLFilePOSIXMode: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLFilePOSIXMode');
end;

function kCFURLFileOwnerID: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLFileOwnerID');
end;

function kCFURLHTTPStatusCode: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLHTTPStatusCode');
end;

function kCFURLHTTPStatusLine: Pointer;
begin
  result := CocoaPointerConst(libCoreFoundation, 'kCFURLHTTPStatusLine');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreFoundationModule := dlopen(MarshaledAString(libCoreFoundation), RTLD_LAZY);

finalization

dlclose(CoreFoundationModule);
{$ENDIF IOS}

end.
