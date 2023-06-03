{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework Foundation
//

unit iOSapi.Foundation;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  System.Generics.Collections,
  System.SysUtils,
  iOSapi.CocoaTypes,
  iOSapi.Security;

const
  NSOrderedAscending = -1;
  NSOrderedSame = 0;
  NSOrderedDescending = 1;
  NSEnumerationConcurrent = (1 shl 0);
  NSEnumerationReverse = (1 shl 1);
  NSSortConcurrent = (1 shl 0);
  NSSortStable = (1 shl 4);
  NSQualityOfServiceUserInteractive = 33;
  NSQualityOfServiceUserInitiated = 25;
  NSQualityOfServiceUtility = 17;
  NSQualityOfServiceBackground = 9;
  NSQualityOfServiceDefault = -1;
  NSCollectionChangeInsert = 0;
  NSCollectionChangeRemove = 1;
  NSOrderedCollectionDifferenceCalculationOmitInsertedObjects = (1 shl 0);
  NSOrderedCollectionDifferenceCalculationOmitRemovedObjects = (1 shl 1);
  NSOrderedCollectionDifferenceCalculationInferMoves = (1 shl 2);
  NSBinarySearchingFirstEqual = (1 shl 8);
  NSBinarySearchingLastEqual = (1 shl 9);
  NSBinarySearchingInsertionIndex = (1 shl 10);
  NSItemProviderRepresentationVisibilityAll = 0;
  NSItemProviderRepresentationVisibilityTeam = 1;
  NSItemProviderRepresentationVisibilityGroup = 2;
  NSItemProviderRepresentationVisibilityOwnProcess = 3;
  NSItemProviderFileOptionOpenInPlace = 1;
  NSItemProviderUnknownError = -1;
  NSItemProviderItemUnavailableError = -1000;
  NSItemProviderUnexpectedValueClassError = -1100;
  NSItemProviderUnavailableCoercionError = -1200;
  NSCaseInsensitiveSearch = 1;
  NSLiteralSearch = 2;
  NSBackwardsSearch = 4;
  NSAnchoredSearch = 8;
  NSNumericSearch = 64;
  NSDiacriticInsensitiveSearch = 128;
  NSWidthInsensitiveSearch = 256;
  NSForcedOrderingSearch = 512;
  NSRegularExpressionSearch = 1024;
  NSASCIIStringEncoding = 1;
  NSNEXTSTEPStringEncoding = 2;
  NSJapaneseEUCStringEncoding = 3;
  NSUTF8StringEncoding = 4;
  NSISOLatin1StringEncoding = 5;
  NSSymbolStringEncoding = 6;
  NSNonLossyASCIIStringEncoding = 7;
  NSShiftJISStringEncoding = 8;
  NSISOLatin2StringEncoding = 9;
  NSUnicodeStringEncoding = 10;
  NSWindowsCP1251StringEncoding = 11;
  NSWindowsCP1252StringEncoding = 12;
  NSWindowsCP1253StringEncoding = 13;
  NSWindowsCP1254StringEncoding = 14;
  NSWindowsCP1250StringEncoding = 15;
  NSISO2022JPStringEncoding = 21;
  NSMacOSRomanStringEncoding = 30;
  NSUTF16StringEncoding = NSUnicodeStringEncoding;
  NSUTF16BigEndianStringEncoding = 2415919360;
  NSUTF16LittleEndianStringEncoding = 2483028224;
  NSUTF32StringEncoding = 2348810496;
  NSUTF32BigEndianStringEncoding = 2550137088;
  NSUTF32LittleEndianStringEncoding = 2617245952;
  NSStringEncodingConversionAllowLossy = 1;
  NSStringEncodingConversionExternalRepresentation = 2;
  NSStringEnumerationByLines = 0;
  NSStringEnumerationByParagraphs = 1;
  NSStringEnumerationByComposedCharacterSequences = 2;
  NSStringEnumerationByWords = 3;
  NSStringEnumerationBySentences = 4;
  NSStringEnumerationByCaretPositions = 5;
  NSStringEnumerationByDeletionClusters = 6;
  NSStringEnumerationReverse = 1 shl 8;
  NSStringEnumerationSubstringNotRequired = 1 shl 9;
  NSStringEnumerationLocalized = 1 shl 10;
  NSProprietaryStringEncoding = 65536;
  NSBundleExecutableArchitectureI386 = 7;
  NSBundleExecutableArchitecturePPC = 18;
  NSBundleExecutableArchitectureX86_64 = 16777223;
  NSBundleExecutableArchitecturePPC64 = 16777234;
  NSBundleExecutableArchitectureARM64 = 16777228;
  NS_UnknownByteOrder = CFByteOrderUnknown;
  NS_LittleEndian = CFByteOrderLittleEndian;
  NS_BigEndian = CFByteOrderBigEndian;
  NSCalendarUnitEra = kCFCalendarUnitEra;
  NSCalendarUnitYear = kCFCalendarUnitYear;
  NSCalendarUnitMonth = kCFCalendarUnitMonth;
  NSCalendarUnitDay = kCFCalendarUnitDay;
  NSCalendarUnitHour = kCFCalendarUnitHour;
  NSCalendarUnitMinute = kCFCalendarUnitMinute;
  NSCalendarUnitSecond = kCFCalendarUnitSecond;
  NSCalendarUnitWeekday = kCFCalendarUnitWeekday;
  NSCalendarUnitWeekdayOrdinal = kCFCalendarUnitWeekdayOrdinal;
  NSCalendarUnitQuarter = kCFCalendarUnitQuarter;
  NSCalendarUnitWeekOfMonth = kCFCalendarUnitWeekOfMonth;
  NSCalendarUnitWeekOfYear = kCFCalendarUnitWeekOfYear;
  NSCalendarUnitYearForWeekOfYear = kCFCalendarUnitYearForWeekOfYear;
  NSCalendarUnitNanosecond = (1 shl 15);
  NSCalendarUnitCalendar = (1 shl 20);
  NSCalendarUnitTimeZone = (1 shl 21);
  NSEraCalendarUnit = NSCalendarUnitEra;
  NSYearCalendarUnit = NSCalendarUnitYear;
  NSMonthCalendarUnit = NSCalendarUnitMonth;
  NSDayCalendarUnit = NSCalendarUnitDay;
  NSHourCalendarUnit = NSCalendarUnitHour;
  NSMinuteCalendarUnit = NSCalendarUnitMinute;
  NSSecondCalendarUnit = NSCalendarUnitSecond;
  NSWeekCalendarUnit = kCFCalendarUnitWeek;
  NSWeekdayCalendarUnit = NSCalendarUnitWeekday;
  NSWeekdayOrdinalCalendarUnit = NSCalendarUnitWeekdayOrdinal;
  NSQuarterCalendarUnit = NSCalendarUnitQuarter;
  NSWeekOfMonthCalendarUnit = NSCalendarUnitWeekOfMonth;
  NSWeekOfYearCalendarUnit = NSCalendarUnitWeekOfYear;
  NSYearForWeekOfYearCalendarUnit = NSCalendarUnitYearForWeekOfYear;
  NSCalendarCalendarUnit = NSCalendarUnitCalendar;
  NSTimeZoneCalendarUnit = NSCalendarUnitTimeZone;
  NSCalendarWrapComponents = (1 shl 0);
  NSCalendarMatchStrictly = (1 shl 1);
  NSCalendarSearchBackwards = (1 shl 2);
  NSCalendarMatchPreviousTimePreservingSmallerUnits = (1 shl 8);
  NSCalendarMatchNextTimePreservingSmallerUnits = (1 shl 9);
  NSCalendarMatchNextTime = (1 shl 10);
  NSCalendarMatchFirst = (1 shl 12);
  NSCalendarMatchLast = (1 shl 13);
  NSWrapCalendarComponents = NSCalendarWrapComponents;
  NSDateComponentUndefined = 2147483647;
  NSUndefinedDateComponent = NSDateComponentUndefined;
  NSOpenStepUnicodeReservedBase = 62464;
  NSDecodingFailurePolicyRaiseException = 0;
  NSDecodingFailurePolicySetErrorAndReturn = 1;
  NSDataReadingMappedIfSafe = 1 shl 0;
  NSDataReadingUncached = 1 shl 1;
  NSDataReadingMappedAlways = 1 shl 3;
  NSDataReadingMapped = NSDataReadingMappedIfSafe;
  NSMappedRead = NSDataReadingMapped;
  NSUncachedRead = NSDataReadingUncached;
  NSDataWritingAtomic = 1 shl 0;
  NSDataWritingWithoutOverwriting = 1 shl 1;
  NSDataWritingFileProtectionNone = 268435456;
  NSDataWritingFileProtectionComplete = 536870912;
  NSDataWritingFileProtectionCompleteUnlessOpen = 805306368;
  NSDataWritingFileProtectionCompleteUntilFirstUserAuthentication = 1073741824;
  NSDataWritingFileProtectionMask = 4026531840;
  NSAtomicWrite = NSDataWritingAtomic;
  NSDataSearchBackwards = 1 shl 0;
  NSDataSearchAnchored = 1 shl 1;
  NSDataBase64Encoding64CharacterLineLength = 1 shl 0;
  NSDataBase64Encoding76CharacterLineLength = 1 shl 1;
  NSDataBase64EncodingEndLineWithCarriageReturn = 1 shl 4;
  NSDataBase64EncodingEndLineWithLineFeed = 1 shl 5;
  NSDataBase64DecodingIgnoreUnknownCharacters = 1 shl 0;
  NSDataCompressionAlgorithmLZFSE = 0;
  NSDataCompressionAlgorithmLZ4 = 1;
  NSDataCompressionAlgorithmLZMA = 2;
  NSDataCompressionAlgorithmZlib = 3;
  NSAttributedStringEnumerationReverse = (1 shl 1);
  NSAttributedStringEnumerationLongestEffectiveRangeNotRequired = (1 shl 20);
  NSInlinePresentationIntentEmphasized = 1 shl 0;
  NSInlinePresentationIntentStronglyEmphasized = 1 shl 1;
  NSInlinePresentationIntentCode = 1 shl 2;
  NSInlinePresentationIntentStrikethrough = 1 shl 5;
  NSInlinePresentationIntentSoftBreak = 1 shl 6;
  NSInlinePresentationIntentLineBreak = 1 shl 7;
  NSInlinePresentationIntentInlineHTML = 1 shl 8;
  NSInlinePresentationIntentBlockHTML = 1 shl 9;
  NSAttributedStringMarkdownParsingFailureReturnError = 0;
  NSAttributedStringMarkdownParsingFailureReturnPartiallyParsedIfPossible = 1;
  NSAttributedStringMarkdownInterpretedSyntaxFull = 0;
  NSAttributedStringMarkdownInterpretedSyntaxInlineOnly = 1;
  NSAttributedStringMarkdownInterpretedSyntaxInlineOnlyPreservingWhitespace = 2;
  NSAttributedStringFormattingInsertArgumentAttributesWithoutMerging = 1 shl 0;
  NSAttributedStringFormattingApplyReplacementIndexAttribute = 1 shl 1;
  NSPresentationIntentKindParagraph = 0;
  NSPresentationIntentKindHeader = 1;
  NSPresentationIntentKindOrderedList = 2;
  NSPresentationIntentKindUnorderedList = 3;
  NSPresentationIntentKindListItem = 4;
  NSPresentationIntentKindCodeBlock = 5;
  NSPresentationIntentKindBlockQuote = 6;
  NSPresentationIntentKindThematicBreak = 7;
  NSPresentationIntentKindTable = 8;
  NSPresentationIntentKindTableHeaderRow = 9;
  NSPresentationIntentKindTableRow = 10;
  NSPresentationIntentKindTableCell = 11;
  NSPresentationIntentTableColumnAlignmentLeft = 0;
  NSPresentationIntentTableColumnAlignmentCenter = 1;
  NSPresentationIntentTableColumnAlignmentRight = 2;
  NSFormattingContextUnknown = 0;
  NSFormattingContextDynamic = 1;
  NSFormattingContextStandalone = 2;
  NSFormattingContextListItem = 3;
  NSFormattingContextBeginningOfSentence = 4;
  NSFormattingContextMiddleOfSentence = 5;
  NSFormattingUnitStyleShort = 1;
  NSFormattingUnitStyleMedium = 2;
  NSFormattingUnitStyleLong = 3;
  NSDateFormatterNoStyle = kCFDateFormatterNoStyle;
  NSDateFormatterShortStyle = kCFDateFormatterShortStyle;
  NSDateFormatterMediumStyle = kCFDateFormatterMediumStyle;
  NSDateFormatterLongStyle = kCFDateFormatterLongStyle;
  NSDateFormatterFullStyle = kCFDateFormatterFullStyle;
  NSDateFormatterBehaviorDefault = 0;
  NSDateFormatterBehavior10_4 = 1040;
  NSDateIntervalFormatterNoStyle = 0;
  NSDateIntervalFormatterShortStyle = 1;
  NSDateIntervalFormatterMediumStyle = 2;
  NSDateIntervalFormatterLongStyle = 3;
  NSDateIntervalFormatterFullStyle = 4;
  NSISO8601DateFormatWithYear = kCFISO8601DateFormatWithYear;
  NSISO8601DateFormatWithMonth = kCFISO8601DateFormatWithMonth;
  NSISO8601DateFormatWithWeekOfYear = kCFISO8601DateFormatWithWeekOfYear;
  NSISO8601DateFormatWithDay = kCFISO8601DateFormatWithDay;
  NSISO8601DateFormatWithTime = kCFISO8601DateFormatWithTime;
  NSISO8601DateFormatWithTimeZone = kCFISO8601DateFormatWithTimeZone;
  NSISO8601DateFormatWithSpaceBetweenDateAndTime =
    kCFISO8601DateFormatWithSpaceBetweenDateAndTime;
  NSISO8601DateFormatWithDashSeparatorInDate =
    kCFISO8601DateFormatWithDashSeparatorInDate;
  NSISO8601DateFormatWithColonSeparatorInTime =
    kCFISO8601DateFormatWithColonSeparatorInTime;
  NSISO8601DateFormatWithColonSeparatorInTimeZone =
    kCFISO8601DateFormatWithColonSeparatorInTimeZone;
  NSISO8601DateFormatWithFractionalSeconds =
    kCFISO8601DateFormatWithFractionalSeconds;
  NSISO8601DateFormatWithFullDate = kCFISO8601DateFormatWithFullDate;
  NSISO8601DateFormatWithFullTime = kCFISO8601DateFormatWithFullTime;
  NSISO8601DateFormatWithInternetDateTime =
    kCFISO8601DateFormatWithInternetDateTime;
  NSMassFormatterUnitGram = 11;
  NSMassFormatterUnitKilogram = 14;
  NSMassFormatterUnitOunce = (6 shl 8) + 1;
  NSMassFormatterUnitPound = (6 shl 8) + 2;
  NSMassFormatterUnitStone = (6 shl 8) + 3;
  NSLengthFormatterUnitMillimeter = 8;
  NSLengthFormatterUnitCentimeter = 9;
  NSLengthFormatterUnitMeter = 11;
  NSLengthFormatterUnitKilometer = 14;
  NSLengthFormatterUnitInch = (5 shl 8) + 1;
  NSLengthFormatterUnitFoot = (5 shl 8) + 2;
  NSLengthFormatterUnitYard = (5 shl 8) + 3;
  NSLengthFormatterUnitMile = (5 shl 8) + 4;
  NSEnergyFormatterUnitJoule = 11;
  NSEnergyFormatterUnitKilojoule = 14;
  NSEnergyFormatterUnitCalorie = (7 shl 8) + 1;
  NSEnergyFormatterUnitKilocalorie = (7 shl 8) + 2;
  NSNumberFormatterBehaviorDefault = 0;
  NSNumberFormatterBehavior10_4 = 1040;
  NSNumberFormatterNoStyle = kCFNumberFormatterNoStyle;
  NSNumberFormatterDecimalStyle = kCFNumberFormatterDecimalStyle;
  NSNumberFormatterCurrencyStyle = kCFNumberFormatterCurrencyStyle;
  NSNumberFormatterPercentStyle = kCFNumberFormatterPercentStyle;
  NSNumberFormatterScientificStyle = kCFNumberFormatterScientificStyle;
  NSNumberFormatterSpellOutStyle = kCFNumberFormatterSpellOutStyle;
  NSNumberFormatterOrdinalStyle = kCFNumberFormatterOrdinalStyle;
  NSNumberFormatterCurrencyISOCodeStyle =
    kCFNumberFormatterCurrencyISOCodeStyle;
  NSNumberFormatterCurrencyPluralStyle = kCFNumberFormatterCurrencyPluralStyle;
  NSNumberFormatterCurrencyAccountingStyle =
    kCFNumberFormatterCurrencyAccountingStyle;
  NSNumberFormatterPadBeforePrefix = kCFNumberFormatterPadBeforePrefix;
  NSNumberFormatterPadAfterPrefix = kCFNumberFormatterPadAfterPrefix;
  NSNumberFormatterPadBeforeSuffix = kCFNumberFormatterPadBeforeSuffix;
  NSNumberFormatterPadAfterSuffix = kCFNumberFormatterPadAfterSuffix;
  NSNumberFormatterRoundCeiling = kCFNumberFormatterRoundCeiling;
  NSNumberFormatterRoundFloor = kCFNumberFormatterRoundFloor;
  NSNumberFormatterRoundDown = kCFNumberFormatterRoundDown;
  NSNumberFormatterRoundUp = kCFNumberFormatterRoundUp;
  NSNumberFormatterRoundHalfEven = kCFNumberFormatterRoundHalfEven;
  NSNumberFormatterRoundHalfDown = kCFNumberFormatterRoundHalfDown;
  NSNumberFormatterRoundHalfUp = kCFNumberFormatterRoundHalfUp;
  NSLocaleLanguageDirectionUnknown = kCFLocaleLanguageDirectionUnknown;
  NSLocaleLanguageDirectionLeftToRight = kCFLocaleLanguageDirectionLeftToRight;
  NSLocaleLanguageDirectionRightToLeft = kCFLocaleLanguageDirectionRightToLeft;
  NSLocaleLanguageDirectionTopToBottom = kCFLocaleLanguageDirectionTopToBottom;
  NSLocaleLanguageDirectionBottomToTop = kCFLocaleLanguageDirectionBottomToTop;
  NSMeasurementFormatterUnitOptionsProvidedUnit = (1 shl 0);
  NSMeasurementFormatterUnitOptionsNaturalScale = (1 shl 1);
  NSMeasurementFormatterUnitOptionsTemperatureWithoutUnit = (1 shl 2);
  NSPersonNameComponentsFormatterStyleDefault = 0;
  NSPersonNameComponentsFormatterStyleShort = 1;
  NSPersonNameComponentsFormatterStyleMedium = 2;
  NSPersonNameComponentsFormatterStyleLong = 3;
  NSPersonNameComponentsFormatterStyleAbbreviated = 4;
  NSPersonNameComponentsFormatterPhonetic = (1 shl 1);
  NSRelativeDateTimeFormatterStyleNumeric = 0;
  NSRelativeDateTimeFormatterStyleNamed = 1;
  NSRelativeDateTimeFormatterUnitsStyleFull = 0;
  NSRelativeDateTimeFormatterUnitsStyleSpellOut = 1;
  NSRelativeDateTimeFormatterUnitsStyleShort = 2;
  NSRelativeDateTimeFormatterUnitsStyleAbbreviated = 3;
  NSRoundPlain = 0;
  NSRoundDown = 1;
  NSRoundUp = 2;
  NSRoundBankers = 3;
  NSCalculationNoError = 0;
  NSCalculationLossOfPrecision = 1;
  NSCalculationUnderflow = 2;
  NSCalculationOverflow = 3;
  NSCalculationDivideByZero = 4;
  NSApplicationDirectory = 1;
  NSDemoApplicationDirectory = 2;
  NSDeveloperApplicationDirectory = 3;
  NSAdminApplicationDirectory = 4;
  NSLibraryDirectory = 5;
  NSDeveloperDirectory = 6;
  NSUserDirectory = 7;
  NSDocumentationDirectory = 8;
  NSDocumentDirectory = 9;
  NSCoreServiceDirectory = 10;
  NSAutosavedInformationDirectory = 11;
  NSDesktopDirectory = 12;
  NSCachesDirectory = 13;
  NSApplicationSupportDirectory = 14;
  NSDownloadsDirectory = 15;
  NSInputMethodsDirectory = 16;
  NSMoviesDirectory = 17;
  NSMusicDirectory = 18;
  NSPicturesDirectory = 19;
  NSPrinterDescriptionDirectory = 20;
  NSSharedPublicDirectory = 21;
  NSPreferencePanesDirectory = 22;
  NSApplicationScriptsDirectory = 23;
  NSItemReplacementDirectory = 99;
  NSAllApplicationsDirectory = 100;
  NSAllLibrariesDirectory = 101;
  NSTrashDirectory = 102;
  NSUserDomainMask = 1;
  NSLocalDomainMask = 2;
  NSNetworkDomainMask = 4;
  NSSystemDomainMask = 8;
  NSAllDomainsMask = 65535;
  NSURLBookmarkCreationPreferFileIDResolution = (1 shl 8);
  NSURLBookmarkCreationMinimalBookmark = (1 shl 9);
  NSURLBookmarkCreationSuitableForBookmarkFile = (1 shl 10);
  NSURLBookmarkCreationWithSecurityScope = (1 shl 11);
  NSURLBookmarkCreationSecurityScopeAllowOnlyReadAccess = (1 shl 12);
  NSURLBookmarkCreationWithoutImplicitSecurityScope = (1 shl 29);
  NSURLBookmarkResolutionWithoutUI = (1 shl 8);
  NSURLBookmarkResolutionWithoutMounting = (1 shl 9);
  NSURLBookmarkResolutionWithSecurityScope = (1 shl 10);
  NSURLBookmarkResolutionWithoutImplicitStartAccessing = (1 shl 15);
  NSVolumeEnumerationSkipHiddenVolumes = 1 shl 1;
  NSVolumeEnumerationProduceFileReferenceURLs = 1 shl 2;
  NSDirectoryEnumerationSkipsSubdirectoryDescendants = 1 shl 0;
  NSDirectoryEnumerationSkipsPackageDescendants = 1 shl 1;
  NSDirectoryEnumerationSkipsHiddenFiles = 1 shl 2;
  NSDirectoryEnumerationIncludesDirectoriesPostOrder = 1 shl 3;
  NSDirectoryEnumerationProducesRelativePathURLs = 1 shl 4;
  NSFileManagerItemReplacementUsingNewMetadataOnly = 1 shl 0;
  NSFileManagerItemReplacementWithoutDeletingBackupItem = 1 shl 1;
  NSURLRelationshipContains = 0;
  NSURLRelationshipSame = 1;
  NSURLRelationshipOther = 2;
  NSFileManagerUnmountAllPartitionsAndEjectDisk = 1 shl 0;
  NSFileManagerUnmountWithoutUI = 1 shl 1;
  NSPointerFunctionsStrongMemory = (0 shl 0);
  NSPointerFunctionsZeroingWeakMemory = (1 shl 0);
  NSPointerFunctionsOpaqueMemory = (2 shl 0);
  NSPointerFunctionsMallocMemory = (3 shl 0);
  NSPointerFunctionsMachVirtualMemory = (4 shl 0);
  NSPointerFunctionsWeakMemory = (5 shl 0);
  NSPointerFunctionsObjectPersonality = (0 shl 8);
  NSPointerFunctionsOpaquePersonality = (1 shl 8);
  NSPointerFunctionsObjectPointerPersonality = (2 shl 8);
  NSPointerFunctionsCStringPersonality = (3 shl 8);
  NSPointerFunctionsStructPersonality = (4 shl 8);
  NSPointerFunctionsIntegerPersonality = (5 shl 8);
  NSPointerFunctionsCopyIn = (1 shl 16);
  NSHTTPCookieAcceptPolicyAlways = 0;
  NSHTTPCookieAcceptPolicyNever = 1;
  NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain = 2;
  NSJSONReadingMutableContainers = (1 shl 0);
  NSJSONReadingMutableLeaves = (1 shl 1);
  NSJSONReadingFragmentsAllowed = (1 shl 2);
  NSJSONReadingJSON5Allowed = (1 shl 3);
  NSJSONReadingTopLevelDictionaryAssumed = (1 shl 4);
  NSJSONReadingAllowFragments = NSJSONReadingFragmentsAllowed;
  NSJSONWritingPrettyPrinted = (1 shl 0);
  NSJSONWritingSortedKeys = (1 shl 1);
  NSJSONWritingFragmentsAllowed = (1 shl 2);
  NSJSONWritingWithoutEscapingSlashes = (1 shl 3);
  NSKeyValueObservingOptionNew = 1;
  NSKeyValueObservingOptionOld = 2;
  NSKeyValueObservingOptionInitial = 4;
  NSKeyValueObservingOptionPrior = 8;
  NSKeyValueChangeSetting = 1;
  NSKeyValueChangeInsertion = 2;
  NSKeyValueChangeRemoval = 3;
  NSKeyValueChangeReplacement = 4;
  NSKeyValueUnionSetMutation = 1;
  NSKeyValueMinusSetMutation = 2;
  NSKeyValueIntersectSetMutation = 3;
  NSKeyValueSetSetMutation = 4;
  NSPropertyListImmutable = kCFPropertyListImmutable;
  NSPropertyListMutableContainers = kCFPropertyListMutableContainers;
  NSPropertyListMutableContainersAndLeaves =
    kCFPropertyListMutableContainersAndLeaves;
  NSPropertyListOpenStepFormat = kCFPropertyListOpenStepFormat;
  NSPropertyListXMLFormat_v1_0 = kCFPropertyListXMLFormat_v1_0;
  NSPropertyListBinaryFormat_v1_0 = kCFPropertyListBinaryFormat_v1_0;
  NSGrammaticalGenderNotSet = 0;
  NSGrammaticalGenderFeminine = 1;
  NSGrammaticalGenderMasculine = 2;
  NSGrammaticalGenderNeuter = 3;
  NSGrammaticalPartOfSpeechNotSet = 0;
  NSGrammaticalPartOfSpeechDeterminer = 1;
  NSGrammaticalPartOfSpeechPronoun = 2;
  NSGrammaticalPartOfSpeechLetter = 3;
  NSGrammaticalPartOfSpeechAdverb = 4;
  NSGrammaticalPartOfSpeechParticle = 5;
  NSGrammaticalPartOfSpeechAdjective = 6;
  NSGrammaticalPartOfSpeechAdposition = 7;
  NSGrammaticalPartOfSpeechVerb = 8;
  NSGrammaticalPartOfSpeechNoun = 9;
  NSGrammaticalPartOfSpeechConjunction = 10;
  NSGrammaticalPartOfSpeechNumeral = 11;
  NSGrammaticalPartOfSpeechInterjection = 12;
  NSGrammaticalPartOfSpeechPreposition = 13;
  NSGrammaticalPartOfSpeechAbbreviation = 14;
  NSGrammaticalNumberNotSet = 0;
  NSGrammaticalNumberSingular = 1;
  NSGrammaticalNumberZero = 2;
  NSGrammaticalNumberPlural = 3;
  NSGrammaticalNumberPluralTwo = 4;
  NSGrammaticalNumberPluralFew = 5;
  NSGrammaticalNumberPluralMany = 6;
  NSPostWhenIdle = 1;
  NSPostASAP = 2;
  NSPostNow = 3;
  NSNotificationNoCoalescing = 0;
  NSNotificationCoalescingOnName = 1;
  NSNotificationCoalescingOnSender = 2;
  NSOperationQueuePriorityVeryLow = -8;
  NSOperationQueuePriorityLow = -4;
  NSOperationQueuePriorityNormal = 0;
  NSOperationQueuePriorityHigh = 4;
  NSOperationQueuePriorityVeryHigh = 8;
  NSMachPortDeallocateNone = 0;
  NSMachPortDeallocateSendRight = (1 shl 0);
  NSMachPortDeallocateReceiveRight = (1 shl 1);
  NSWindowsNTOperatingSystem = 1;
  NSWindows95OperatingSystem = 2;
  NSSolarisOperatingSystem = 3;
  NSHPUXOperatingSystem = 4;
  NSMACHOperatingSystem = 5;
  NSSunOSOperatingSystem = 6;
  NSOSF1OperatingSystem = 7;
  NSActivityIdleDisplaySleepDisabled = (1 shl 40);
  NSActivityIdleSystemSleepDisabled = (1 shl 20);
  NSActivitySuddenTerminationDisabled = (1 shl 14);
  NSActivityAutomaticTerminationDisabled = (1 shl 15);
  NSActivityAnimationTrackingEnabled = (1 shl 45);
  NSActivityTrackingEnabled = (1 shl 46);
  NSActivityUserInitiated = (16777215 or NSActivityIdleSystemSleepDisabled);
  NSActivityUserInitiatedAllowingIdleSystemSleep = (NSActivityUserInitiated and
    not NSActivityIdleSystemSleepDisabled);
  NSActivityBackground = 255;
  NSActivityLatencyCritical = 1095216660480;
  NSActivityUserInteractive = (NSActivityUserInitiated or
    NSActivityLatencyCritical);
  NSProcessInfoThermalStateNominal = 0;
  NSProcessInfoThermalStateFair = 1;
  NSProcessInfoThermalStateSerious = 2;
  NSProcessInfoThermalStateCritical = 3;
  NSTextCheckingTypeOrthography = 1 shl 0;
  NSTextCheckingTypeSpelling = 1 shl 1;
  NSTextCheckingTypeGrammar = 1 shl 2;
  NSTextCheckingTypeDate = 1 shl 3;
  NSTextCheckingTypeAddress = 1 shl 4;
  NSTextCheckingTypeLink = 1 shl 5;
  NSTextCheckingTypeQuote = 1 shl 6;
  NSTextCheckingTypeDash = 1 shl 7;
  NSTextCheckingTypeReplacement = 1 shl 8;
  NSTextCheckingTypeCorrection = 1 shl 9;
  NSTextCheckingTypeRegularExpression = 1 shl 10;
  NSTextCheckingTypePhoneNumber = 1 shl 11;
  NSTextCheckingTypeTransitInformation = 1 shl 12;
  NSTextCheckingAllSystemTypes = 4294967295;
  NSTextCheckingAllCustomTypes = 4294967295 shl 32;
  NSTextCheckingAllTypes = (NSTextCheckingAllSystemTypes or
    NSTextCheckingAllCustomTypes);
  NSRegularExpressionCaseInsensitive = 1 shl 0;
  NSRegularExpressionAllowCommentsAndWhitespace = 1 shl 1;
  NSRegularExpressionIgnoreMetacharacters = 1 shl 2;
  NSRegularExpressionDotMatchesLineSeparators = 1 shl 3;
  NSRegularExpressionAnchorsMatchLines = 1 shl 4;
  NSRegularExpressionUseUnixLineSeparators = 1 shl 5;
  NSRegularExpressionUseUnicodeWordBoundaries = 1 shl 6;
  NSMatchingReportProgress = 1 shl 0;
  NSMatchingReportCompletion = 1 shl 1;
  NSMatchingAnchored = 1 shl 2;
  NSMatchingWithTransparentBounds = 1 shl 3;
  NSMatchingWithoutAnchoringBounds = 1 shl 4;
  NSMatchingProgress = 1 shl 0;
  NSMatchingCompleted = 1 shl 1;
  NSMatchingHitEnd = 1 shl 2;
  NSMatchingRequiredEnd = 1 shl 3;
  NSMatchingInternalError = 1 shl 4;
  NSStreamStatusNotOpen = 0;
  NSStreamStatusOpening = 1;
  NSStreamStatusOpen = 2;
  NSStreamStatusReading = 3;
  NSStreamStatusWriting = 4;
  NSStreamStatusAtEnd = 5;
  NSStreamStatusClosed = 6;
  NSStreamStatusError = 7;
  NSStreamEventNone = 0;
  NSStreamEventOpenCompleted = 1 shl 0;
  NSStreamEventHasBytesAvailable = 1 shl 1;
  NSStreamEventHasSpaceAvailable = 1 shl 2;
  NSStreamEventErrorOccurred = 1 shl 3;
  NSStreamEventEndEncountered = 1 shl 4;
  NSTimeZoneNameStyleStandard = 0;
  NSTimeZoneNameStyleShortStandard = 1;
  NSTimeZoneNameStyleDaylightSaving = 2;
  NSTimeZoneNameStyleShortDaylightSaving = 3;
  NSTimeZoneNameStyleGeneric = 4;
  NSTimeZoneNameStyleShortGeneric = 5;
  NSURLCacheStorageAllowed = 0;
  NSURLCacheStorageAllowedInMemoryOnly = 1;
  NSURLCacheStorageNotAllowed = 2;
  NSURLCredentialPersistenceNone = 0;
  NSURLCredentialPersistenceForSession = 1;
  NSURLCredentialPersistencePermanent = 2;
  NSURLCredentialPersistenceSynchronizable = 3;
  NSURLErrorCancelledReasonUserForceQuitApplication = 0;
  NSURLErrorCancelledReasonBackgroundUpdatesDisabled = 1;
  NSURLErrorCancelledReasonInsufficientSystemResources = 2;
  NSURLErrorNetworkUnavailableReasonCellular = 0;
  NSURLErrorNetworkUnavailableReasonExpensive = 1;
  NSURLErrorNetworkUnavailableReasonConstrained = 2;
  NSURLErrorUnknown = -1;
  NSURLErrorCancelled = -999;
  NSURLErrorBadURL = -1000;
  NSURLErrorTimedOut = -1001;
  NSURLErrorUnsupportedURL = -1002;
  NSURLErrorCannotFindHost = -1003;
  NSURLErrorCannotConnectToHost = -1004;
  NSURLErrorNetworkConnectionLost = -1005;
  NSURLErrorDNSLookupFailed = -1006;
  NSURLErrorHTTPTooManyRedirects = -1007;
  NSURLErrorResourceUnavailable = -1008;
  NSURLErrorNotConnectedToInternet = -1009;
  NSURLErrorRedirectToNonExistentLocation = -1010;
  NSURLErrorBadServerResponse = -1011;
  NSURLErrorUserCancelledAuthentication = -1012;
  NSURLErrorUserAuthenticationRequired = -1013;
  NSURLErrorZeroByteResource = -1014;
  NSURLErrorCannotDecodeRawData = -1015;
  NSURLErrorCannotDecodeContentData = -1016;
  NSURLErrorCannotParseResponse = -1017;
  NSURLErrorAppTransportSecurityRequiresSecureConnection = -1022;
  NSURLErrorFileDoesNotExist = -1100;
  NSURLErrorFileIsDirectory = -1101;
  NSURLErrorNoPermissionsToReadFile = -1102;
  NSURLErrorDataLengthExceedsMaximum = -1103;
  NSURLErrorFileOutsideSafeArea = -1104;
  NSURLErrorSecureConnectionFailed = -1200;
  NSURLErrorServerCertificateHasBadDate = -1201;
  NSURLErrorServerCertificateUntrusted = -1202;
  NSURLErrorServerCertificateHasUnknownRoot = -1203;
  NSURLErrorServerCertificateNotYetValid = -1204;
  NSURLErrorClientCertificateRejected = -1205;
  NSURLErrorClientCertificateRequired = -1206;
  NSURLErrorCannotLoadFromNetwork = -2000;
  NSURLErrorCannotCreateFile = -3000;
  NSURLErrorCannotOpenFile = -3001;
  NSURLErrorCannotCloseFile = -3002;
  NSURLErrorCannotWriteToFile = -3003;
  NSURLErrorCannotRemoveFile = -3004;
  NSURLErrorCannotMoveFile = -3005;
  NSURLErrorDownloadDecodingFailedMidStream = -3006;
  NSURLErrorDownloadDecodingFailedToComplete = -3007;
  NSURLErrorInternationalRoamingOff = -1018;
  NSURLErrorCallIsActive = -1019;
  NSURLErrorDataNotAllowed = -1020;
  NSURLErrorRequestBodyStreamExhausted = -1021;
  NSURLErrorBackgroundSessionRequiresSharedContainer = -995;
  NSURLErrorBackgroundSessionInUseByAnotherProcess = -996;
  NSURLErrorBackgroundSessionWasDisconnected = -997;
  NSURLRequestUseProtocolCachePolicy = 0;
  NSURLRequestReloadIgnoringLocalCacheData = 1;
  NSURLRequestReloadIgnoringLocalAndRemoteCacheData = 4;
  NSURLRequestReloadIgnoringCacheData =
    NSURLRequestReloadIgnoringLocalCacheData;
  NSURLRequestReturnCacheDataElseLoad = 2;
  NSURLRequestReturnCacheDataDontLoad = 3;
  NSURLRequestReloadRevalidatingCacheData = 5;
  NSURLNetworkServiceTypeDefault = 0;
  NSURLNetworkServiceTypeVoIP = 1;
  NSURLNetworkServiceTypeVideo = 2;
  NSURLNetworkServiceTypeBackground = 3;
  NSURLNetworkServiceTypeVoice = 4;
  NSURLNetworkServiceTypeResponsiveData = 6;
  NSURLNetworkServiceTypeAVStreaming = 8;
  NSURLNetworkServiceTypeResponsiveAV = 9;
  NSURLNetworkServiceTypeCallSignaling = 11;
  NSURLRequestAttributionDeveloper = 0;
  NSURLRequestAttributionUser = 1;
  NSXMLParserResolveExternalEntitiesNever = 0;
  NSXMLParserResolveExternalEntitiesNoNetwork = 1;
  NSXMLParserResolveExternalEntitiesSameOriginOnly = 2;
  NSXMLParserResolveExternalEntitiesAlways = 3;
  NSXMLParserInternalError = 1;
  NSXMLParserOutOfMemoryError = 2;
  NSXMLParserDocumentStartError = 3;
  NSXMLParserEmptyDocumentError = 4;
  NSXMLParserPrematureDocumentEndError = 5;
  NSXMLParserInvalidHexCharacterRefError = 6;
  NSXMLParserInvalidDecimalCharacterRefError = 7;
  NSXMLParserInvalidCharacterRefError = 8;
  NSXMLParserInvalidCharacterError = 9;
  NSXMLParserCharacterRefAtEOFError = 10;
  NSXMLParserCharacterRefInPrologError = 11;
  NSXMLParserCharacterRefInEpilogError = 12;
  NSXMLParserCharacterRefInDTDError = 13;
  NSXMLParserEntityRefAtEOFError = 14;
  NSXMLParserEntityRefInPrologError = 15;
  NSXMLParserEntityRefInEpilogError = 16;
  NSXMLParserEntityRefInDTDError = 17;
  NSXMLParserParsedEntityRefAtEOFError = 18;
  NSXMLParserParsedEntityRefInPrologError = 19;
  NSXMLParserParsedEntityRefInEpilogError = 20;
  NSXMLParserParsedEntityRefInInternalSubsetError = 21;
  NSXMLParserEntityReferenceWithoutNameError = 22;
  NSXMLParserEntityReferenceMissingSemiError = 23;
  NSXMLParserParsedEntityRefNoNameError = 24;
  NSXMLParserParsedEntityRefMissingSemiError = 25;
  NSXMLParserUndeclaredEntityError = 26;
  NSXMLParserUnparsedEntityError = 28;
  NSXMLParserEntityIsExternalError = 29;
  NSXMLParserEntityIsParameterError = 30;
  NSXMLParserUnknownEncodingError = 31;
  NSXMLParserEncodingNotSupportedError = 32;
  NSXMLParserStringNotStartedError = 33;
  NSXMLParserStringNotClosedError = 34;
  NSXMLParserNamespaceDeclarationError = 35;
  NSXMLParserEntityNotStartedError = 36;
  NSXMLParserEntityNotFinishedError = 37;
  NSXMLParserLessThanSymbolInAttributeError = 38;
  NSXMLParserAttributeNotStartedError = 39;
  NSXMLParserAttributeNotFinishedError = 40;
  NSXMLParserAttributeHasNoValueError = 41;
  NSXMLParserAttributeRedefinedError = 42;
  NSXMLParserLiteralNotStartedError = 43;
  NSXMLParserLiteralNotFinishedError = 44;
  NSXMLParserCommentNotFinishedError = 45;
  NSXMLParserProcessingInstructionNotStartedError = 46;
  NSXMLParserProcessingInstructionNotFinishedError = 47;
  NSXMLParserNotationNotStartedError = 48;
  NSXMLParserNotationNotFinishedError = 49;
  NSXMLParserAttributeListNotStartedError = 50;
  NSXMLParserAttributeListNotFinishedError = 51;
  NSXMLParserMixedContentDeclNotStartedError = 52;
  NSXMLParserMixedContentDeclNotFinishedError = 53;
  NSXMLParserElementContentDeclNotStartedError = 54;
  NSXMLParserElementContentDeclNotFinishedError = 55;
  NSXMLParserXMLDeclNotStartedError = 56;
  NSXMLParserXMLDeclNotFinishedError = 57;
  NSXMLParserConditionalSectionNotStartedError = 58;
  NSXMLParserConditionalSectionNotFinishedError = 59;
  NSXMLParserExternalSubsetNotFinishedError = 60;
  NSXMLParserDOCTYPEDeclNotFinishedError = 61;
  NSXMLParserMisplacedCDATAEndStringError = 62;
  NSXMLParserCDATANotFinishedError = 63;
  NSXMLParserMisplacedXMLDeclarationError = 64;
  NSXMLParserSpaceRequiredError = 65;
  NSXMLParserSeparatorRequiredError = 66;
  NSXMLParserNMTOKENRequiredError = 67;
  NSXMLParserNAMERequiredError = 68;
  NSXMLParserPCDATARequiredError = 69;
  NSXMLParserURIRequiredError = 70;
  NSXMLParserPublicIdentifierRequiredError = 71;
  NSXMLParserLTRequiredError = 72;
  NSXMLParserGTRequiredError = 73;
  NSXMLParserLTSlashRequiredError = 74;
  NSXMLParserEqualExpectedError = 75;
  NSXMLParserTagNameMismatchError = 76;
  NSXMLParserUnfinishedTagError = 77;
  NSXMLParserStandaloneValueError = 78;
  NSXMLParserInvalidEncodingNameError = 79;
  NSXMLParserCommentContainsDoubleHyphenError = 80;
  NSXMLParserInvalidEncodingError = 81;
  NSXMLParserExternalStandaloneEntityError = 82;
  NSXMLParserInvalidConditionalSectionError = 83;
  NSXMLParserEntityValueRequiredError = 84;
  NSXMLParserNotWellBalancedError = 85;
  NSXMLParserExtraContentError = 86;
  NSXMLParserInvalidCharacterInEntityError = 87;
  NSXMLParserParsedEntityRefInInternalError = 88;
  NSXMLParserEntityRefLoopError = 89;
  NSXMLParserEntityBoundaryError = 90;
  NSXMLParserInvalidURIError = 91;
  NSXMLParserURIFragmentError = 92;
  NSXMLParserNoDTDError = 94;
  NSXMLParserDelegateAbortedParseError = 512;
  NSXPCConnectionPrivileged = (1 shl 12);
  NSFileNoSuchFileError = 4;
  NSFileLockingError = 255;
  NSFileReadUnknownError = 256;
  NSFileReadNoPermissionError = 257;
  NSFileReadInvalidFileNameError = 258;
  NSFileReadCorruptFileError = 259;
  NSFileReadNoSuchFileError = 260;
  NSFileReadInapplicableStringEncodingError = 261;
  NSFileReadUnsupportedSchemeError = 262;
  NSFileReadTooLargeError = 263;
  NSFileReadUnknownStringEncodingError = 264;
  NSFileWriteUnknownError = 512;
  NSFileWriteNoPermissionError = 513;
  NSFileWriteInvalidFileNameError = 514;
  NSFileWriteFileExistsError = 516;
  NSFileWriteInapplicableStringEncodingError = 517;
  NSFileWriteUnsupportedSchemeError = 518;
  NSFileWriteOutOfSpaceError = 640;
  NSFileWriteVolumeReadOnlyError = 642;
  NSFileManagerUnmountUnknownError = 768;
  NSFileManagerUnmountBusyError = 769;
  NSKeyValueValidationError = 1024;
  NSFormattingError = 2048;
  NSUserCancelledError = 3072;
  NSFeatureUnsupportedError = 3328;
  NSExecutableNotLoadableError = 3584;
  NSExecutableArchitectureMismatchError = 3585;
  NSExecutableRuntimeMismatchError = 3586;
  NSExecutableLoadError = 3587;
  NSExecutableLinkError = 3588;
  NSFileErrorMinimum = 0;
  NSFileErrorMaximum = 1023;
  NSValidationErrorMinimum = 1024;
  NSValidationErrorMaximum = 2047;
  NSExecutableErrorMinimum = 3584;
  NSExecutableErrorMaximum = 3839;
  NSFormattingErrorMinimum = 2048;
  NSFormattingErrorMaximum = 2559;
  NSPropertyListReadCorruptError = 3840;
  NSPropertyListReadUnknownVersionError = 3841;
  NSPropertyListReadStreamError = 3842;
  NSPropertyListWriteStreamError = 3851;
  NSPropertyListWriteInvalidError = 3852;
  NSPropertyListErrorMinimum = 3840;
  NSPropertyListErrorMaximum = 4095;
  NSXPCConnectionInterrupted = 4097;
  NSXPCConnectionInvalid = 4099;
  NSXPCConnectionReplyInvalid = 4101;
  NSXPCConnectionCodeSigningRequirementFailure = 4102;
  NSXPCConnectionErrorMinimum = 4096;
  NSXPCConnectionErrorMaximum = 4224;
  NSUbiquitousFileUnavailableError = 4353;
  NSUbiquitousFileNotUploadedDueToQuotaError = 4354;
  NSUbiquitousFileUbiquityServerNotAvailable = 4355;
  NSUbiquitousFileErrorMinimum = 4352;
  NSUbiquitousFileErrorMaximum = 4607;
  NSUserActivityHandoffFailedError = 4608;
  NSUserActivityConnectionUnavailableError = 4609;
  NSUserActivityRemoteApplicationTimedOutError = 4610;
  NSUserActivityHandoffUserInfoTooLargeError = 4611;
  NSUserActivityErrorMinimum = 4608;
  NSUserActivityErrorMaximum = 4863;
  NSCoderReadCorruptError = 4864;
  NSCoderValueNotFoundError = 4865;
  NSCoderInvalidValueError = 4866;
  NSCoderErrorMinimum = 4864;
  NSCoderErrorMaximum = 4991;
  NSBundleErrorMinimum = 4992;
  NSBundleErrorMaximum = 5119;
  NSBundleOnDemandResourceOutOfSpaceError = 4992;
  NSBundleOnDemandResourceExceededMaximumSizeError = 4993;
  NSBundleOnDemandResourceInvalidTagError = 4994;
  NSCloudSharingNetworkFailureError = 5120;
  NSCloudSharingQuotaExceededError = 5121;
  NSCloudSharingTooManyParticipantsError = 5122;
  NSCloudSharingConflictError = 5123;
  NSCloudSharingNoPermissionError = 5124;
  NSCloudSharingOtherError = 5375;
  NSCloudSharingErrorMinimum = 5120;
  NSCloudSharingErrorMaximum = 5375;
  NSCompressionFailedError = 5376;
  NSDecompressionFailedError = 5377;
  NSCompressionErrorMinimum = 5376;
  NSCompressionErrorMaximum = 5503;
  NSByteCountFormatterUseDefault = 0;
  NSByteCountFormatterUseBytes = 1 shl 0;
  NSByteCountFormatterUseKB = 1 shl 1;
  NSByteCountFormatterUseMB = 1 shl 2;
  NSByteCountFormatterUseGB = 1 shl 3;
  NSByteCountFormatterUseTB = 1 shl 4;
  NSByteCountFormatterUsePB = 1 shl 5;
  NSByteCountFormatterUseEB = 1 shl 6;
  NSByteCountFormatterUseZB = 1 shl 7;
  NSByteCountFormatterUseYBOrHigher = 255 shl 8;
  NSByteCountFormatterUseAll = 65535;
  NSByteCountFormatterCountStyleFile = 0;
  NSByteCountFormatterCountStyleMemory = 1;
  NSByteCountFormatterCountStyleDecimal = 2;
  NSByteCountFormatterCountStyleBinary = 3;
  NSCaseInsensitivePredicateOption = 1;
  NSDiacriticInsensitivePredicateOption = 2;
  NSNormalizedPredicateOption = 4;
  NSDirectPredicateModifier = 0;
  NSAllPredicateModifier = 1;
  NSAnyPredicateModifier = 2;
  NSLessThanPredicateOperatorType = 0;
  NSLessThanOrEqualToPredicateOperatorType = 1;
  NSGreaterThanPredicateOperatorType = 2;
  NSGreaterThanOrEqualToPredicateOperatorType = 3;
  NSEqualToPredicateOperatorType = 4;
  NSNotEqualToPredicateOperatorType = 5;
  NSMatchesPredicateOperatorType = 6;
  NSLikePredicateOperatorType = 7;
  NSBeginsWithPredicateOperatorType = 8;
  NSEndsWithPredicateOperatorType = 9;
  NSInPredicateOperatorType = 10;
  NSCustomSelectorPredicateOperatorType = 11;
  NSContainsPredicateOperatorType = 99;
  NSBetweenPredicateOperatorType = 100;
  NSNotPredicateType = 0;
  NSAndPredicateType = 1;
  NSOrPredicateType = 2;
  NSDateComponentsFormatterUnitsStylePositional = 0;
  NSDateComponentsFormatterUnitsStyleAbbreviated = 1;
  NSDateComponentsFormatterUnitsStyleShort = 2;
  NSDateComponentsFormatterUnitsStyleFull = 3;
  NSDateComponentsFormatterUnitsStyleSpellOut = 4;
  NSDateComponentsFormatterUnitsStyleBrief = 5;
  NSDateComponentsFormatterZeroFormattingBehaviorNone = (0);
  NSDateComponentsFormatterZeroFormattingBehaviorDefault = (1 shl 0);
  NSDateComponentsFormatterZeroFormattingBehaviorDropLeading = (1 shl 1);
  NSDateComponentsFormatterZeroFormattingBehaviorDropMiddle = (1 shl 2);
  NSDateComponentsFormatterZeroFormattingBehaviorDropTrailing = (1 shl 3);
  NSDateComponentsFormatterZeroFormattingBehaviorDropAll =
    (NSDateComponentsFormatterZeroFormattingBehaviorDropLeading or
    NSDateComponentsFormatterZeroFormattingBehaviorDropMiddle or
    NSDateComponentsFormatterZeroFormattingBehaviorDropTrailing);
  NSDateComponentsFormatterZeroFormattingBehaviorPad = (1 shl 16);
  NSConstantValueExpressionType = 0;
  NSEvaluatedObjectExpressionType = 1;
  NSVariableExpressionType = 2;
  NSKeyPathExpressionType = 3;
  NSFunctionExpressionType = 4;
  NSUnionSetExpressionType = 5;
  NSIntersectSetExpressionType = 6;
  NSMinusSetExpressionType = 7;
  NSSubqueryExpressionType = 13;
  NSAggregateExpressionType = 14;
  NSAnyKeyExpressionType = 15;
  NSBlockExpressionType = 19;
  NSConditionalExpressionType = 20;
  NSFileCoordinatorReadingWithoutChanges = 1 shl 0;
  NSFileCoordinatorReadingResolvesSymbolicLink = 1 shl 1;
  NSFileCoordinatorReadingImmediatelyAvailableMetadataOnly = 1 shl 2;
  NSFileCoordinatorReadingForUploading = 1 shl 3;
  NSFileCoordinatorWritingForDeleting = 1 shl 0;
  NSFileCoordinatorWritingForMoving = 1 shl 1;
  NSFileCoordinatorWritingForMerging = 1 shl 2;
  NSFileCoordinatorWritingForReplacing = 1 shl 3;
  NSFileCoordinatorWritingContentIndependentMetadataOnly = 1 shl 4;
  NSFileVersionAddingByMoving = 1 shl 0;
  NSFileVersionReplacingByMoving = 1 shl 0;
  NSFileWrapperReadingImmediate = 1 shl 0;
  NSFileWrapperReadingWithoutMapping = 1 shl 1;
  NSFileWrapperWritingAtomic = 1 shl 0;
  NSFileWrapperWritingWithNameUpdating = 1 shl 1;
  NSLinguisticTaggerUnitWord = 0;
  NSLinguisticTaggerUnitSentence = 1;
  NSLinguisticTaggerUnitParagraph = 2;
  NSLinguisticTaggerUnitDocument = 3;
  NSLinguisticTaggerOmitWords = 1 shl 0;
  NSLinguisticTaggerOmitPunctuation = 1 shl 1;
  NSLinguisticTaggerOmitWhitespace = 1 shl 2;
  NSLinguisticTaggerOmitOther = 1 shl 3;
  NSLinguisticTaggerJoinNames = 1 shl 4;
  NSNetServicesUnknownError = -72000;
  NSNetServicesCollisionError = -72001;
  NSNetServicesNotFoundError = -72002;
  NSNetServicesActivityInProgress = -72003;
  NSNetServicesBadArgumentError = -72004;
  NSNetServicesCancelledError = -72005;
  NSNetServicesInvalidError = -72006;
  NSNetServicesTimeoutError = -72007;
  NSNetServicesMissingRequiredConfigurationError = -72008;
  NSNetServiceNoAutoRename = 1 shl 0;
  NSNetServiceListenForConnections = 1 shl 1;
  NSUbiquitousKeyValueStoreServerChange = 0;
  NSUbiquitousKeyValueStoreInitialSyncChange = 1;
  NSUbiquitousKeyValueStoreQuotaViolationChange = 2;
  NSUbiquitousKeyValueStoreAccountChange = 3;
  NSURLSessionTaskStateRunning = 0;
  NSURLSessionTaskStateSuspended = 1;
  NSURLSessionTaskStateCanceling = 2;
  NSURLSessionTaskStateCompleted = 3;
  NSURLSessionWebSocketMessageTypeData = 0;
  NSURLSessionWebSocketMessageTypeString = 1;
  NSURLSessionWebSocketCloseCodeInvalid = 0;
  NSURLSessionWebSocketCloseCodeNormalClosure = 1000;
  NSURLSessionWebSocketCloseCodeGoingAway = 1001;
  NSURLSessionWebSocketCloseCodeProtocolError = 1002;
  NSURLSessionWebSocketCloseCodeUnsupportedData = 1003;
  NSURLSessionWebSocketCloseCodeNoStatusReceived = 1005;
  NSURLSessionWebSocketCloseCodeAbnormalClosure = 1006;
  NSURLSessionWebSocketCloseCodeInvalidFramePayloadData = 1007;
  NSURLSessionWebSocketCloseCodePolicyViolation = 1008;
  NSURLSessionWebSocketCloseCodeMessageTooBig = 1009;
  NSURLSessionWebSocketCloseCodeMandatoryExtensionMissing = 1010;
  NSURLSessionWebSocketCloseCodeInternalServerError = 1011;
  NSURLSessionWebSocketCloseCodeTLSHandshakeFailure = 1015;
  NSURLSessionMultipathServiceTypeNone = 0;
  NSURLSessionMultipathServiceTypeHandover = 1;
  NSURLSessionMultipathServiceTypeInteractive = 2;
  NSURLSessionMultipathServiceTypeAggregate = 3;
  NSURLSessionDelayedRequestContinueLoading = 0;
  NSURLSessionDelayedRequestUseNewRequest = 1;
  NSURLSessionDelayedRequestCancel = 2;
  NSURLSessionAuthChallengeUseCredential = 0;
  NSURLSessionAuthChallengePerformDefaultHandling = 1;
  NSURLSessionAuthChallengeCancelAuthenticationChallenge = 2;
  NSURLSessionAuthChallengeRejectProtectionSpace = 3;
  NSURLSessionResponseCancel = 0;
  NSURLSessionResponseAllow = 1;
  NSURLSessionResponseBecomeDownload = 2;
  NSURLSessionResponseBecomeStream = 3;
  NSURLSessionTaskMetricsResourceFetchTypeUnknown = 0;
  NSURLSessionTaskMetricsResourceFetchTypeNetworkLoad = 1;
  NSURLSessionTaskMetricsResourceFetchTypeServerPush = 2;
  NSURLSessionTaskMetricsResourceFetchTypeLocalCache = 3;
  NSURLSessionTaskMetricsDomainResolutionProtocolUnknown = 0;
  NSURLSessionTaskMetricsDomainResolutionProtocolUDP = 1;
  NSURLSessionTaskMetricsDomainResolutionProtocolTCP = 2;
  NSURLSessionTaskMetricsDomainResolutionProtocolTLS = 3;
  NSURLSessionTaskMetricsDomainResolutionProtocolHTTPS = 4;

type

  // ===== Forward declarations =====
{$M+}
  NSString = interface;
  NSInvocation = interface;
  NSMethodSignature = interface;
  NSCoder = interface;
  NSEnumerator = interface;
  NSCopying = interface;
  NSMutableCopying = interface;
  NSCoding = interface;
  NSSecureCoding = interface;
  NSCoderMethods = interface;
  NSDiscardableContent = interface;
  NSDiscardableContentProxy = interface;
  NSArray = interface;
  NSFastEnumeration = interface;
  NSDictionary = interface;
  NSValue = interface;
  NSNumber = interface;
  NSOrderedCollectionChange = interface;
  NSIndexSet = interface;
  NSMutableIndexSet = interface;
  NSOrderedCollectionDifference = interface;
  NSData = interface;
  NSURL = interface;
  NSMutableArray = interface;
  NSAutoreleasePool = interface;
  NSItemProvider = interface;
  NSProgress = interface;
  NSItemProviderWriting = interface;
  NSItemProviderReading = interface;
  NSCharacterSet = interface;
  NSError = interface;
  NSLocale = interface;
  NSMutableString = interface;
  NSSimpleCString = interface;
  NSConstantString = interface;
  NSSet = interface;
  NSMutableDictionary = interface;
  NSMutableSet = interface;
  NSCountedSet = interface;
  NSUUID = interface;
  NSXPCConnection = interface;
  NSLock = interface;
  NSProgressReporting = interface;
  NSOperationQueue = interface;
  NSNotification = interface;
  NSNotificationCenter = interface;
  NSBundle = interface;
  NSBundleResourceRequest = interface;
  NSDate = interface;
  NSDateComponents = interface;
  NSTimeZone = interface;
  NSCalendar = interface;
  NSMutableCharacterSet = interface;
  NSMutableData = interface;
  NSPurgeableData = interface;
  NSDateInterval = interface;
  NSAttributedString = interface;
  NSMutableAttributedString = interface;
  NSAttributedStringMarkdownSourcePosition = interface;
  NSAttributedStringMarkdownParsingOptions = interface;
  NSPresentationIntent = interface;
  NSFormatter = interface;
  NSDateFormatter = interface;
  NSDateIntervalFormatter = interface;
  NSISO8601DateFormatter = interface;
  NSNumberFormatter = interface;
  NSMassFormatter = interface;
  NSLengthFormatter = interface;
  NSEnergyFormatter = interface;
  NSUnitConverter = interface;
  NSUnitConverterLinear = interface;
  NSUnit = interface;
  NSDimension = interface;
  NSUnitAcceleration = interface;
  NSUnitAngle = interface;
  NSUnitArea = interface;
  NSUnitConcentrationMass = interface;
  NSUnitDispersion = interface;
  NSUnitDuration = interface;
  NSUnitElectricCharge = interface;
  NSUnitElectricCurrent = interface;
  NSUnitElectricPotentialDifference = interface;
  NSUnitElectricResistance = interface;
  NSUnitEnergy = interface;
  NSUnitFrequency = interface;
  NSUnitFuelEfficiency = interface;
  NSUnitInformationStorage = interface;
  NSUnitLength = interface;
  NSUnitIlluminance = interface;
  NSUnitMass = interface;
  NSUnitPower = interface;
  NSUnitPressure = interface;
  NSUnitSpeed = interface;
  NSUnitTemperature = interface;
  NSUnitVolume = interface;
  NSMeasurement = interface;
  NSRecursiveLock = interface;
  NSCache = interface;
  NSDecimalNumberHandler = interface;
  NSMeasurementFormatter = interface;
  NSPersonNameComponents = interface;
  NSPersonNameComponentsFormatter = interface;
  NSRelativeDateTimeFormatter = interface;
  NSListFormatter = interface;
  NSScanner = interface;
  NSException = interface;
  NSAssertionHandler = interface;
  NSDecimalNumber = interface;
  NSDecimalNumberBehaviors = interface;
  NSErrorRecoveryAttempting = interface;
  NSTimer = interface;
  NSPort = interface;
  NSRunLoop = interface;
  NSDelayedPerforming = interface;
  NSFileHandle = interface;
  NSPipe = interface;
  NSURLQueryItem = interface;
  NSURLComponents = interface;
  NSFileSecurity = interface;
  NSDirectoryEnumerator = interface;
  NSFileProviderService = interface;
  NSFileManagerDelegate = interface;
  NSFileManager = interface;
  NSCopyLinkMoveHandler = interface;
  NSPointerFunctions = interface;
  NSHashTable = interface;
  NSHTTPCookie = interface;
  NSURLSessionTask = interface;
  NSSortDescriptor = interface;
  NSHTTPCookieStorage = interface;
  NSIndexPath = interface;
  NSMorphology = interface;
  NSInflectionRule = interface;
  NSInflectionRuleExplicit = interface;
  NSOutputStream = interface;
  NSInputStream = interface;
  NSJSONSerialization = interface;
  NSOrderedSet = interface;
  NSMutableOrderedSet = interface;
  NSKeyValueCoding = interface;
  NSKeyValueObserving = interface;
  NSKeyValueObserverRegistration = interface;
  NSKeyValueObserverNotification = interface;
  NSKeyValueObservingCustomization = interface;
  NSPropertyListSerialization = interface;
  NSKeyedArchiverDelegate = interface;
  NSKeyedUnarchiverDelegate = interface;
  NSKeyedArchiver = interface;
  NSKeyedUnarchiver = interface;
  NSKeyedArchiverObjectSubstitution = interface;
  NSKeyedUnarchiverObjectSubstitution = interface;
  NSLocking = interface;
  NSConditionLock = interface;
  NSCondition = interface;
  NSMapTable = interface;
  NSMorphologyCustomPronoun = interface;
  NSNotificationQueue = interface;
  NSNull = interface;
  NSOperation = interface;
  NSBlockOperation = interface;
  NSInvocationOperation = interface;
  NSOrthography = interface;
  NSPointerArray = interface;
  NSPortDelegate = interface;
  NSMachPortDelegate = interface;
  NSMachPort = interface;
  NSMessagePort = interface;
  NSProcessInfo = interface;
  NSProxy = interface;
  NSRegularExpression = interface;
  NSTextCheckingResult = interface;
  NSDataDetector = interface;
  NSStreamDelegate = interface;
  NSStream = interface;
  NSThread = interface;
  NSThreadPerformAdditions = interface;
  NSURLAuthenticationChallenge = interface;
  NSURLCredential = interface;
  NSURLProtectionSpace = interface;
  NSURLResponse = interface;
  NSURLAuthenticationChallengeSender = interface;
  NSURLRequest = interface;
  NSURLSessionDataTask = interface;
  NSCachedURLResponse = interface;
  NSURLCache = interface;
  NSURLConnectionDelegate = interface;
  NSURLConnection = interface;
  NSURLConnectionDataDelegate = interface;
  NSURLConnectionDownloadDelegate = interface;
  NSURLCredentialStorage = interface;
  NSMutableURLRequest = interface;
  NSURLProtocol = interface;
  NSURLProtocolClient = interface;
  NSHTTPURLResponse = interface;
  NSUserDefaults = interface;
  NSValueTransformer = interface;
  NSSecureUnarchiveFromDataTransformer = interface;
  NSXMLParserDelegate = interface;
  NSXMLParser = interface;
  NSXPCListener = interface;
  NSXPCInterface = interface;
  NSXPCListenerEndpoint = interface;
  NSXPCListenerDelegate = interface;
  NSXPCProxyCreating = interface;
  NSXPCCoder = interface;
  NSByteCountFormatter = interface;
  NSCacheDelegate = interface;
  NSPredicate = interface;
  NSExpression = interface;
  NSComparisonPredicate = interface;
  NSCompoundPredicate = interface;
  NSDateComponentsFormatter = interface;
  NSExtensionContext = interface;
  NSExtensionItem = interface;
  NSExtensionRequestHandling = interface;
  NSFilePresenter = interface;
  NSFileAccessIntent = interface;
  NSFileCoordinator = interface;
  NSFileVersion = interface;
  NSFileWrapper = interface;
  NSLinguisticTagger = interface;
  NSMetadataItem = interface;
  NSMetadataQueryAttributeValueTuple = interface;
  NSMetadataQueryResultGroup = interface;
  NSMetadataQueryDelegate = interface;
  NSMetadataQuery = interface;
  NSNetServiceDelegate = interface;
  NSNetServiceBrowserDelegate = interface;
  NSNetService = interface;
  NSNetServiceBrowser = interface;
  NSUbiquitousKeyValueStore = interface;
  NSUndoManager = interface;
  NSURLSessionUploadTask = interface;
  NSURLSessionDownloadTask = interface;
  NSURLSession = interface;
  NSURLSessionStreamTask = interface;
  NSURLSessionWebSocketTask = interface;
  NSURLSessionConfiguration = interface;
  NSURLSessionDelegate = interface;
  NSURLSessionTaskDelegate = interface;
  NSURLSessionTaskMetrics = interface;
  NSURLSessionWebSocketMessage = interface;
  NSURLSessionDataDelegate = interface;
  NSURLSessionDownloadDelegate = interface;
  NSURLSessionStreamDelegate = interface;
  NSURLSessionWebSocketDelegate = interface;
  NSURLSessionTaskTransactionMetrics = interface;
  NSUserActivityDelegate = interface;
  NSUserActivity = interface;

  // ===== Framework typedefs =====
{$M+}
  NSExceptionName = NSString;
  PNSExceptionName = ^NSExceptionName;
  NSRunLoopMode = NSString;
  PNSRunLoopMode = ^NSRunLoopMode;
  SEL = SEL *;
  PSEL = ^SEL;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  NSComparisonResult = NSInteger;
  NSComparator = function(param1: Pointer; param2: Pointer)
    : NSComparisonResult; cdecl;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  NSEnumerationOptions = NSUInteger;
  NSSortOptions = NSUInteger;
  NSQualityOfService = NSInteger;

  _NSZone = record
  end;

  P_NSZone = ^_NSZone;
  NSZone = _NSZone;
  PNSZone = ^NSZone;

  CFTypeRef = Pointer;
  PCFTypeRef = ^CFTypeRef;

  NSFastEnumerationState = record
    state: LongWord;
    itemsPtr: Pointer;
    mutationsPtr: PLongWord;
    extra: array [0 .. 4] of LongWord;
  end;

  PNSFastEnumerationState = ^NSFastEnumerationState;

  ObjectType = Pointer;
  PObjectType = ^ObjectType;

  _NSRange = record
    location: NSUInteger;
    length: NSUInteger;
  end;

  P_NSRange = ^_NSRange;
  NSRange = _NSRange;
  PNSRange = ^NSRange;

  NSRangePointer = Pointer;
  PNSRangePointer = ^NSRangePointer;
  NSCollectionChangeType = NSInteger;
  TFoundationBlock = procedure(param1: NSUInteger; param2: PBoolean) of object;
  TFoundationPredicate = function(param1: NSUInteger; param2: PBoolean)
    : Boolean; cdecl;
  TFoundationBlock1 = procedure(param1: NSRange; param2: PBoolean) of object;
  NSOrderedCollectionDifferenceCalculationOptions = NSUInteger;
  TFoundationBlock2 = function(param1: NSOrderedCollectionChange)
    : NSOrderedCollectionChange; cdecl;
  TFoundationComparator = function(param1: ObjectType; param2: ObjectType;
    param3: Pointer): NSInteger; cdecl;
  TFoundationBlock3 = procedure(param1: ObjectType; param2: NSUInteger;
    param3: PBoolean) of object;
  TFoundationPredicate1 = function(param1: ObjectType; param2: NSUInteger;
    param3: PBoolean): Boolean; cdecl;
  NSBinarySearchingOptions = NSUInteger;
  TFoundationUsingEquivalenceTest = function(param1: ObjectType;
    param2: ObjectType): Boolean; cdecl;
  unichar = Word;
  Punichar = ^unichar;

  NSItemProviderRepresentationVisibility = NSInteger;
  NSItemProviderFileOptions = NSInteger;
  TFoundationForItemProviderCompletionHandler = procedure(param1: NSData;
    param2: NSError) of object;
  NSItemProviderCompletionHandler = procedure(param1: Pointer; param2: NSError)
    of object;
  NSItemProviderLoadHandler = procedure(param1: NSItemProviderCompletionHandler;
    param2: Pointer; param3: NSDictionary) of object;
  TFoundationLoadHandler = function
    (param1: TFoundationForItemProviderCompletionHandler): NSProgress; cdecl;
  TFoundationBlock4 = procedure(param1: NSURL; param2: Boolean; param3: NSError)
    of object;
  TFoundationLoadHandler1 = function(param1: TFoundationBlock4)
    : NSProgress; cdecl;
  TFoundationCompletionHandler = procedure(param1: NSURL; param2: NSError)
    of object;
  TFoundationBlock5 = procedure(param1: Pointer; param2: NSError) of object;
  TFoundationLoadHandler2 = function(param1: TFoundationBlock5)
    : NSProgress; cdecl;
  NSItemProviderErrorCode = NSInteger;
  NSStringCompareOptions = NSUInteger;
  NSStringEncoding = NSUInteger;
  PNSStringEncoding = ^NSStringEncoding;
  NSStringEncodingConversionOptions = NSUInteger;
  NSStringEnumerationOptions = NSUInteger;
  TFoundationUsingBlock = procedure(param1: NSString; param2: NSRange;
    param3: NSRange; param4: PBoolean) of object;
  TFoundationBlock6 = procedure(param1: NSString; param2: PBoolean) of object;
  NSStringTransform = NSString;
  PNSStringTransform = ^NSStringTransform;
  TFoundationDeallocator = procedure(param1: Punichar; param2: NSUInteger)
    of object;
  __builtin_va_list = Pointer;
  P__builtin_va_list = ^__builtin_va_list;
  __darwin_va_list = __builtin_va_list;
  P__darwin_va_list = ^__darwin_va_list;
  TFoundationDeallocator1 = procedure(param1: Pointer; param2: NSUInteger)
    of object;
  NSStringEncodingDetectionOptionsKey = NSString;
  PNSStringEncodingDetectionOptionsKey = ^NSStringEncodingDetectionOptionsKey;
  KeyType = Pointer;
  PKeyType = ^KeyType;
  TFoundationBlock7 = procedure(param1: KeyType; param2: ObjectType;
    param3: PBoolean) of object;
  TFoundationPredicate2 = function(param1: KeyType; param2: ObjectType;
    param3: PBoolean): Boolean; cdecl;
  K = Pointer;
  PK = ^K;
  TFoundationBlock8 = procedure(param1: ObjectType; param2: PBoolean) of object;
  TFoundationPredicate3 = function(param1: ObjectType; param2: PBoolean)
    : Boolean; cdecl;
  NSProgressKind = NSString;
  PNSProgressKind = ^NSProgressKind;
  NSProgressUserInfoKey = NSString;
  PNSProgressUserInfoKey = ^NSProgressUserInfoKey;
  NSProgressFileOperationKind = NSString;
  PNSProgressFileOperationKind = ^NSProgressFileOperationKind;
  TFoundationUsingBlock1 = procedure() of object;
  NSProgressUnpublishingHandler = procedure() of object;
  NSProgressPublishingHandler = function(param1: NSProgress)
    : NSProgressUnpublishingHandler; cdecl;
  NSNotificationName = NSString;
  PNSNotificationName = ^NSNotificationName;
  TFoundationUsingBlock2 = procedure(param1: NSNotification) of object;
  TFoundationCompletionHandler1 = procedure(param1: NSError) of object;
  TFoundationCompletionHandler2 = procedure(param1: Boolean) of object;

  NSSwappedFloat = record
    v: Cardinal;
  end;

  PNSSwappedFloat = ^NSSwappedFloat;

  NSSwappedDouble = record
    v: UInt64;
  end;

  PNSSwappedDouble = ^NSSwappedDouble;

  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  NSCalendarIdentifier = NSString;
  PNSCalendarIdentifier = ^NSCalendarIdentifier;
  NSCalendarUnit = NSUInteger;
  NSCalendarOptions = NSUInteger;
  TFoundationUsingBlock3 = procedure(param1: NSDate; param2: Boolean;
    param3: PBoolean) of object;
  UTF32Char = UInt32;
  PUTF32Char = ^UTF32Char;
  NSDecodingFailurePolicy = NSInteger;
  NSDataReadingOptions = NSUInteger;
  NSDataWritingOptions = NSUInteger;
  NSDataSearchOptions = NSUInteger;
  NSDataBase64EncodingOptions = NSUInteger;
  NSDataBase64DecodingOptions = NSUInteger;
  TFoundationBlock9 = procedure(param1: Pointer; param2: NSRange;
    param3: PBoolean) of object;
  NSDataCompressionAlgorithm = NSInteger;
  NSAttributedStringKey = NSString;
  PNSAttributedStringKey = ^NSAttributedStringKey;
  NSAttributedStringEnumerationOptions = NSUInteger;
  TFoundationUsingBlock4 = procedure(param1: NSDictionary; param2: NSRange;
    param3: PBoolean) of object;
  NSInlinePresentationIntent = NSUInteger;
  NSAttributedStringMarkdownParsingFailurePolicy = NSInteger;
  NSAttributedStringMarkdownInterpretedSyntax = NSInteger;
  NSAttributedStringFormattingOptions = NSUInteger;
  NSPresentationIntentKind = NSInteger;
  NSPresentationIntentTableColumnAlignment = NSInteger;
  NSFormattingContext = NSInteger;
  NSFormattingUnitStyle = NSInteger;
  NSDateFormatterStyle = NSUInteger;
  NSDateFormatterBehavior = NSUInteger;
  NSDateIntervalFormatterStyle = NSUInteger;
  NSISO8601DateFormatOptions = NSUInteger;
  NSMassFormatterUnit = NSInteger;
  NSLengthFormatterUnit = NSInteger;
  NSEnergyFormatterUnit = NSInteger;
  UnitType = NSUnit;
  PUnitType = ^UnitType;
  NSNumberFormatterBehavior = NSUInteger;
  NSNumberFormatterStyle = NSUInteger;
  NSNumberFormatterPadPosition = NSUInteger;
  NSNumberFormatterRoundingMode = NSUInteger;
  NSLocaleKey = NSString;
  PNSLocaleKey = ^NSLocaleKey;
  NSLocaleLanguageDirection = NSUInteger;
  NSMeasurementFormatterUnitOptions = NSUInteger;
  NSPersonNameComponentsFormatterStyle = NSInteger;
  NSPersonNameComponentsFormatterOptions = NSUInteger;
  NSRelativeDateTimeFormatterStyle = NSInteger;
  NSRelativeDateTimeFormatterUnitsStyle = NSInteger;
  NSRoundingMode = NSUInteger;
  NSCalculationError = NSUInteger;

  NSDecimal = record
    _exponent: Integer;
    _length: Cardinal;
    _isNegative: Cardinal;
    _isCompact: Cardinal;
    _reserved: Cardinal;
    _mantissa: array [0 .. 7] of Word;
  end;

  PNSDecimal = ^NSDecimal;

  NSUncaughtExceptionHandler = procedure(param1: NSException); cdecl;
  PNSUncaughtExceptionHandler = ^NSUncaughtExceptionHandler;
  TFoundationNSGetUncaughtExceptionHandler = PNSUncaughtExceptionHandler;
  NSErrorDomain = NSString;
  PNSErrorDomain = ^NSErrorDomain;
  NSErrorUserInfoKey = NSString;
  PNSErrorUserInfoKey = ^NSErrorUserInfoKey;
  TFoundationProvider = function(param1: NSError; param2: NSErrorUserInfoKey)
    : Pointer; cdecl;
  CFRunLoopRef = Pointer;
  PCFRunLoopRef = ^CFRunLoopRef;
  TFoundationReadabilityHandler = procedure(param1: NSFileHandle) of object;
  NSSearchPathDirectory = NSUInteger;
  NSSearchPathDomainMask = NSUInteger;
  NSURLResourceKey = NSString;
  PNSURLResourceKey = ^NSURLResourceKey;
  NSURLBookmarkCreationOptions = NSUInteger;
  NSURLBookmarkResolutionOptions = NSUInteger;
  NSURLBookmarkFileCreationOptions = NSUInteger;
  PNSURLBookmarkFileCreationOptions = ^NSURLBookmarkFileCreationOptions;
  NSURLFileResourceType = NSString;
  PNSURLFileResourceType = ^NSURLFileResourceType;
  NSURLThumbnailDictionaryItem = NSString;
  PNSURLThumbnailDictionaryItem = ^NSURLThumbnailDictionaryItem;
  NSURLFileProtectionType = NSString;
  PNSURLFileProtectionType = ^NSURLFileProtectionType;
  NSURLUbiquitousItemDownloadingStatus = NSString;
  PNSURLUbiquitousItemDownloadingStatus = ^NSURLUbiquitousItemDownloadingStatus;
  NSURLUbiquitousSharedItemRole = NSString;
  PNSURLUbiquitousSharedItemRole = ^NSURLUbiquitousSharedItemRole;
  NSURLUbiquitousSharedItemPermissions = NSString;
  PNSURLUbiquitousSharedItemPermissions = ^NSURLUbiquitousSharedItemPermissions;
  NSFileAttributeKey = NSString;
  PNSFileAttributeKey = ^NSFileAttributeKey;
  NSFileAttributeType = NSString;
  PNSFileAttributeType = ^NSFileAttributeType;
  NSFileProtectionType = NSString;
  PNSFileProtectionType = ^NSFileProtectionType;
  NSFileProviderServiceName = NSString;
  PNSFileProviderServiceName = ^NSFileProviderServiceName;
  NSVolumeEnumerationOptions = NSUInteger;
  NSDirectoryEnumerationOptions = NSUInteger;
  NSFileManagerItemReplacementOptions = NSUInteger;
  NSURLRelationship = NSInteger;
  NSFileManagerUnmountOptions = NSUInteger;
  TFoundationErrorHandler = function(param1: NSURL; param2: NSError)
    : Boolean; cdecl;
  TFoundationCompletionHandler3 = procedure(param1: NSDictionary;
    param2: NSError) of object;
  TFoundationCompletionHandler4 = procedure(param1: NSXPCConnection;
    param2: NSError) of object;
  FourCharCode = UInt32;
  PFourCharCode = ^FourCharCode;
  OSType = FourCharCode;
  POSType = ^OSType;
  NSPointerFunctionsOptions = NSUInteger;
  TFoundationBlock10 = function(param1: Pointer): NSUInteger; cdecl;
  TFoundationHashFunction = function(param1: Pointer;
    param2: TFoundationBlock10): NSUInteger; cdecl;
  TFoundationIsEqualFunction = function(param1: Pointer; param2: Pointer;
    param3: TFoundationBlock10): Boolean; cdecl;
  TFoundationDescriptionFunction = function(param1: Pointer): NSString; cdecl;
  TFoundationRelinquishFunction = procedure(param1: Pointer;
    param2: TFoundationBlock10); cdecl;
  TFoundationAcquireFunction = function(param1: Pointer;
    param2: TFoundationBlock10; param3: Boolean): Pointer; cdecl;
  NSHashTableOptions = NSUInteger;
  PNSHashTableOptions = ^NSHashTableOptions;

  NSHashEnumerator = record
    _pi: NSUInteger;
    _si: NSUInteger;
    _bs: Pointer;
  end;

  PNSHashEnumerator = ^NSHashEnumerator;

  TFoundationHash = function(param1: NSHashTable; param2: Pointer)
    : NSUInteger; cdecl;
  TFoundationIsEqual = function(param1: NSHashTable; param2: Pointer;
    param3: Pointer): Boolean; cdecl;
  TFoundationRetain = procedure(param1: NSHashTable; param2: Pointer); cdecl;
  TFoundationDescribe = function(param1: NSHashTable; param2: Pointer)
    : NSString; cdecl;

  NSHashTableCallBacks = record
    hash: TFoundationHash;
    isEqual: TFoundationIsEqual;
    retain: TFoundationRetain;
    release: TFoundationRetain;
    describe: TFoundationDescribe;
  end;

  PNSHashTableCallBacks = ^NSHashTableCallBacks;

  NSHTTPCookiePropertyKey = NSString;
  PNSHTTPCookiePropertyKey = ^NSHTTPCookiePropertyKey;
  NSHTTPCookieStringPolicy = NSString;
  PNSHTTPCookieStringPolicy = ^NSHTTPCookieStringPolicy;
  NSHTTPCookieAcceptPolicy = NSUInteger;
  TFoundationCompletionHandler5 = procedure(param1: NSArray) of object;
  IMP = procedure(); cdecl;
  PIMP = ^IMP;
  NSJSONReadingOptions = NSUInteger;
  NSJSONWritingOptions = NSUInteger;
  NSKeyValueOperator = NSString;
  PNSKeyValueOperator = ^NSKeyValueOperator;
  NSKeyValueObservingOptions = NSUInteger;
  NSKeyValueChange = NSUInteger;
  NSKeyValueSetMutationKind = NSUInteger;
  NSKeyValueChangeKey = NSString;
  PNSKeyValueChangeKey = ^NSKeyValueChangeKey;
  NSPropertyListMutabilityOptions = NSUInteger;
  NSPropertyListFormat = NSUInteger;
  NSPropertyListReadOptions = NSPropertyListMutabilityOptions;
  PNSPropertyListReadOptions = ^NSPropertyListReadOptions;
  NSPropertyListWriteOptions = NSUInteger;
  PNSPropertyListWriteOptions = ^NSPropertyListWriteOptions;
  NSMapTableOptions = NSUInteger;
  PNSMapTableOptions = ^NSMapTableOptions;

  NSMapEnumerator = record
    _pi: NSUInteger;
    _si: NSUInteger;
    _bs: Pointer;
  end;

  PNSMapEnumerator = ^NSMapEnumerator;

  TFoundationHash1 = function(param1: NSMapTable; param2: Pointer)
    : NSUInteger; cdecl;
  TFoundationIsEqual1 = function(param1: NSMapTable; param2: Pointer;
    param3: Pointer): Boolean; cdecl;
  TFoundationRetain1 = procedure(param1: NSMapTable; param2: Pointer); cdecl;
  TFoundationDescribe1 = function(param1: NSMapTable; param2: Pointer)
    : NSString; cdecl;

  NSMapTableKeyCallBacks = record
    hash: TFoundationHash1;
    isEqual: TFoundationIsEqual1;
    retain: TFoundationRetain1;
    release: TFoundationRetain1;
    describe: TFoundationDescribe1;
    notAKeyMarker: Pointer;
  end;

  PNSMapTableKeyCallBacks = ^NSMapTableKeyCallBacks;

  NSMapTableValueCallBacks = record
    retain: TFoundationRetain1;
    release: TFoundationRetain1;
    describe: TFoundationDescribe1;
  end;

  PNSMapTableValueCallBacks = ^NSMapTableValueCallBacks;

  NSGrammaticalGender = NSInteger;
  NSGrammaticalPartOfSpeech = NSInteger;
  NSGrammaticalNumber = NSInteger;
  NSPostingStyle = NSUInteger;
  NSNotificationCoalescing = NSUInteger;
  NSOperationQueuePriority = NSInteger;
  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;
  NSSocketNativeHandle = Integer;
  PNSSocketNativeHandle = ^NSSocketNativeHandle;

  NSMachPortOptions = NSUInteger;

  NSOperatingSystemVersion = record
    majorVersion: NSInteger;
    minorVersion: NSInteger;
    patchVersion: NSInteger;
  end;

  PNSOperatingSystemVersion = ^NSOperatingSystemVersion;

  NSActivityOptions = UInt64;
  NSProcessInfoThermalState = NSInteger;
  NSTextCheckingType = UInt64;
  NSTextCheckingTypes = UInt64;
  PNSTextCheckingTypes = ^NSTextCheckingTypes;
  NSTextCheckingKey = NSString;
  PNSTextCheckingKey = ^NSTextCheckingKey;
  NSRegularExpressionOptions = NSUInteger;
  NSMatchingOptions = NSUInteger;
  NSMatchingFlags = NSUInteger;
  TFoundationUsingBlock5 = procedure(param1: NSTextCheckingResult;
    param2: NSMatchingFlags; param3: PBoolean) of object;
  NSStreamPropertyKey = NSString;
  PNSStreamPropertyKey = ^NSStreamPropertyKey;
  NSStreamStatus = NSUInteger;
  NSStreamEvent = NSUInteger;
  NSStreamSocketSecurityLevel = NSString;
  PNSStreamSocketSecurityLevel = ^NSStreamSocketSecurityLevel;
  NSStreamSOCKSProxyConfiguration = NSString;
  PNSStreamSOCKSProxyConfiguration = ^NSStreamSOCKSProxyConfiguration;
  NSStreamSOCKSProxyVersion = NSString;
  PNSStreamSOCKSProxyVersion = ^NSStreamSOCKSProxyVersion;
  NSStreamNetworkServiceTypeValue = NSString;
  PNSStreamNetworkServiceTypeValue = ^NSStreamNetworkServiceTypeValue;
  NSTimeZoneNameStyle = NSInteger;
  TFoundationBlock11 = procedure(param1: NSTimer) of object;
  NSURLCacheStoragePolicy = NSUInteger;
  TFoundationCompletionHandler6 = procedure(param1: NSCachedURLResponse)
    of object;
  TFoundationCompletionHandler7 = procedure(param1: NSURLResponse;
    param2: NSData; param3: NSError) of object;
  NSURLCredentialPersistence = NSUInteger;
  SecIdentityRef = Pointer;
  PSecIdentityRef = ^SecIdentityRef;
  SecTrustRef = Pointer;
  PSecTrustRef = ^SecTrustRef;
  TFoundationCompletionHandler8 = procedure(param1: NSDictionary) of object;
  TFoundationCompletionHandler9 = procedure(param1: NSURLCredential) of object;
  NSURLErrorNetworkUnavailableReason = NSInteger;
  NSURLRequestCachePolicy = NSUInteger;
  NSURLRequestNetworkServiceType = NSUInteger;
  NSURLRequestAttribution = NSUInteger;
  NSValueTransformerName = NSString;
  PNSValueTransformerName = ^NSValueTransformerName;
  NSXMLParserExternalEntityResolvingPolicy = NSUInteger;
  NSXMLParserError = NSInteger;
  NSXPCConnectionOptions = NSUInteger;
  __int32_t = Integer;
  P__int32_t = ^__int32_t;

  __darwin_pid_t = __int32_t;
  P__darwin_pid_t = ^__darwin_pid_t;
  au_asid_t = Pointer { pid_t };
  Pau_asid_t = ^au_asid_t;
  __darwin_uid_t = LongWord;
  P__darwin_uid_t = ^__darwin_uid_t;
  __darwin_gid_t = LongWord;
  P__darwin_gid_t = ^__darwin_gid_t;
  NSByteCountFormatterUnits = NSUInteger;
  NSByteCountFormatterCountStyle = NSInteger;
  TFoundationBlock12 = function(param1: Pointer; param2: NSDictionary)
    : Boolean; cdecl;
  NSComparisonPredicateOptions = NSUInteger;
  NSComparisonPredicateModifier = NSUInteger;
  NSPredicateOperatorType = NSUInteger;
  NSCompoundPredicateType = NSUInteger;
  NSDateComponentsFormatterUnitsStyle = NSInteger;
  NSDateComponentsFormatterZeroFormattingBehavior = NSUInteger;
  NSExpressionType = NSUInteger;
  TFoundationBlock13 = function(param1: Pointer; param2: NSArray;
    param3: NSMutableDictionary): Pointer; cdecl;
  NSFileCoordinatorReadingOptions = NSUInteger;
  NSFileCoordinatorWritingOptions = NSUInteger;
  TFoundationByAccessor = procedure(param1: NSURL) of object;
  TFoundationByAccessor1 = procedure(param1: NSURL; param2: NSURL) of object;
  TFoundationByAccessor2 = procedure(param1: TFoundationUsingBlock1) of object;
  NSFileVersionAddingOptions = NSUInteger;
  NSFileVersionReplacingOptions = NSUInteger;
  TFoundationCompletionHandler10 = procedure(param1: NSArray; param2: NSError)
    of object;
  NSFileWrapperReadingOptions = NSUInteger;
  NSFileWrapperWritingOptions = NSUInteger;
  NSLinguisticTagScheme = NSString;
  PNSLinguisticTagScheme = ^NSLinguisticTagScheme;
  NSLinguisticTag = NSString;
  PNSLinguisticTag = ^NSLinguisticTag;
  NSLinguisticTaggerUnit = NSInteger;
  NSLinguisticTaggerOptions = NSUInteger;
  TFoundationUsingBlock6 = procedure(param1: NSLinguisticTag; param2: NSRange;
    param3: PBoolean) of object;
  TFoundationUsingBlock7 = procedure(param1: NSLinguisticTag; param2: NSRange;
    param3: NSRange; param4: PBoolean) of object;
  TFoundationBlock14 = procedure(param1: Pointer; param2: NSUInteger;
    param3: PBoolean) of object;
  NSNetServicesError = NSInteger;
  NSNetServiceOptions = NSUInteger;
  TFoundationHandler = procedure(param1: Pointer) of object;
  TFoundationCompletionHandler11 = procedure(param1: NSArray; param2: NSArray;
    param3: NSArray) of object;
  TFoundationCompletionHandler12 = procedure(param1: NSData;
    param2: NSURLResponse; param3: NSError) of object;
  TFoundationCompletionHandler13 = procedure(param1: NSURL;
    param2: NSURLResponse; param3: NSError) of object;
  NSURLSessionTaskState = NSInteger;
  TFoundationCompletionHandler14 = procedure(param1: NSData) of object;
  NSURLSessionWebSocketMessageType = NSInteger;
  NSURLSessionWebSocketCloseCode = NSInteger;
  TFoundationCompletionHandler15 = procedure
    (param1: NSURLSessionWebSocketMessage; param2: NSError) of object;
  NSURLSessionMultipathServiceType = NSInteger;
  SSLProtocol = Integer;
  tls_protocol_version_t = Word;
  NSURLSessionDelayedRequestDisposition = NSInteger;
  NSURLSessionAuthChallengeDisposition = NSInteger;
  NSURLSessionResponseDisposition = NSInteger;
  TFoundationCompletionHandler16 = procedure
    (param1: NSURLSessionAuthChallengeDisposition; param2: NSURLCredential)
    of object;
  TFoundationCompletionHandler17 = procedure
    (param1: NSURLSessionDelayedRequestDisposition; param2: NSURLRequest)
    of object;
  TFoundationCompletionHandler18 = procedure(param1: NSURLRequest) of object;
  TFoundationNeedNewBodyStream = procedure(param1: NSInputStream) of object;
  TFoundationCompletionHandler19 = procedure
    (param1: NSURLSessionResponseDisposition) of object;
  NSURLSessionTaskMetricsResourceFetchType = NSInteger;
  NSURLSessionTaskMetricsDomainResolutionProtocol = NSInteger;
  NSUserActivityPersistentIdentifier = NSString;
  PNSUserActivityPersistentIdentifier = ^NSUserActivityPersistentIdentifier;
  TFoundationCompletionHandler20 = procedure(param1: NSInputStream;
    param2: NSOutputStream; param3: NSError) of object;
  // ===== Interface declarations =====

  NSStringClass = interface(NSObjectClass)
    ['{46660071-18D6-404A-8DE8-AE6A56342B12}']
    { class } function localizedNameOfStringEncoding(encoding: NSStringEncoding)
      : NSString; cdecl;
    { class } function &string: Pointer { instancetype }; cdecl;
    { class } function stringWithString(&string: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function stringWithCharacters(characters: Punichar;
      length: NSUInteger): Pointer { instancetype }; cdecl;
    { class } function stringWithUTF8String(nullTerminatedCString
      : MarshaledAString): Pointer { instancetype }; cdecl;
    { class } function stringWithFormat(format: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function localizedStringWithFormat(format: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function stringWithValidatedFormat(format: NSString;
      validFormatSpecifiers: NSString; error: NSError)
      : Pointer { instancetype }; cdecl;
    { class } function localizedStringWithValidatedFormat(format: NSString;
      validFormatSpecifiers: NSString; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName('stringWithCString:encoding:')]
    { class } function stringWithCStringEncoding(cString: MarshaledAString;
      encoding: NSStringEncoding): Pointer { instancetype }; cdecl;
    [MethodName('stringWithContentsOfURL:encoding:error:')]
    { class } function stringWithContentsOfURLEncodingError(url: NSURL;
      encoding: NSStringEncoding; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName('stringWithContentsOfFile:encoding:error:')]
    { class } function stringWithContentsOfFileEncodingError(path: NSString;
      encoding: NSStringEncoding; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName('stringWithContentsOfURL:usedEncoding:error:')]
    { class } function stringWithContentsOfURLUsedEncodingError(url: NSURL;
      usedEncoding: PNSStringEncoding; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName('stringWithContentsOfFile:usedEncoding:error:')]
    { class } function stringWithContentsOfFileUsedEncodingError(path: NSString;
      usedEncoding: PNSStringEncoding; error: NSError)
      : Pointer { instancetype }; cdecl;
    { class } function stringEncodingForData(data: NSData;
      encodingOptions: NSDictionary; convertedString: NSString;
      usedLossyConversion: PBoolean): NSStringEncoding; cdecl;
    [MethodName('stringWithContentsOfFile:')]
    { class } function stringWithContentsOfFile(path: NSString): Pointer; cdecl;
    [MethodName('stringWithContentsOfURL:')]
    { class } function stringWithContentsOfURL(url: NSURL): Pointer; cdecl;
    [MethodName('stringWithCString:length:')]
    { class } function stringWithCStringLength(bytes: MarshaledAString;
      length: NSUInteger): Pointer; cdecl;
    [MethodName('stringWithCString:')]
    { class } function stringWithCString(bytes: MarshaledAString)
      : Pointer; cdecl;
    { class } function pathWithComponents(components: NSArray): NSString; cdecl;
  end;

  NSString = interface(NSObject)
    ['{21AF7930-5A82-491E-B718-F6B436F52188}']
    function length: NSUInteger; cdecl;
    function characterAtIndex(index: NSUInteger): unichar; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function substringFromIndex(from: NSUInteger): NSString; cdecl;
    function substringToIndex(&to: NSUInteger): NSString; cdecl;
    function substringWithRange(range: NSRange): NSString; cdecl;
    [MethodName('getCharacters:range:')]
    procedure getCharactersRange(buffer: Punichar; range: NSRange); cdecl;
    [MethodName('compare:')]
    function compare(&string: NSString): NSComparisonResult; cdecl;
    [MethodName('compare:options:')]
    function compareOptions(&string: NSString; options: NSStringCompareOptions)
      : NSComparisonResult; cdecl;
    [MethodName('compare:options:range:')]
    function compareOptionsRange(&string: NSString;
      options: NSStringCompareOptions; range: NSRange)
      : NSComparisonResult; cdecl;
    [MethodName('compare:options:range:locale:')]
    function compareOptionsRangeLocale(&string: NSString;
      options: NSStringCompareOptions; range: NSRange; locale: Pointer)
      : NSComparisonResult; cdecl;
    function caseInsensitiveCompare(&string: NSString)
      : NSComparisonResult; cdecl;
    function localizedCompare(&string: NSString): NSComparisonResult; cdecl;
    function localizedCaseInsensitiveCompare(&string: NSString)
      : NSComparisonResult; cdecl;
    function localizedStandardCompare(&string: NSString)
      : NSComparisonResult; cdecl;
    function isEqualToString(aString: NSString): Boolean; cdecl;
    function hasPrefix(str: NSString): Boolean; cdecl;
    function hasSuffix(str: NSString): Boolean; cdecl;
    function commonPrefixWithString(str: NSString;
      options: NSStringCompareOptions): NSString; cdecl;
    function containsString(str: NSString): Boolean; cdecl;
    function localizedCaseInsensitiveContainsString(str: NSString)
      : Boolean; cdecl;
    function localizedStandardContainsString(str: NSString): Boolean; cdecl;
    function localizedStandardRangeOfString(str: NSString): NSRange; cdecl;
    [MethodName('rangeOfString:')]
    function rangeOfString(searchString: NSString): NSRange; cdecl;
    [MethodName('rangeOfString:options:')]
    function rangeOfStringOptions(searchString: NSString;
      options: NSStringCompareOptions): NSRange; cdecl;
    [MethodName('rangeOfString:options:range:')]
    function rangeOfStringOptionsRange(searchString: NSString;
      options: NSStringCompareOptions; range: NSRange): NSRange; cdecl;
    [MethodName('rangeOfString:options:range:locale:')]
    function rangeOfStringOptionsRangeLocale(searchString: NSString;
      options: NSStringCompareOptions; range: NSRange; locale: NSLocale)
      : NSRange; cdecl;
    [MethodName('rangeOfCharacterFromSet:')]
    function rangeOfCharacterFromSet(searchSet: NSCharacterSet): NSRange; cdecl;
    [MethodName('rangeOfCharacterFromSet:options:')]
    function rangeOfCharacterFromSetOptions(searchSet: NSCharacterSet;
      options: NSStringCompareOptions): NSRange; cdecl;
    [MethodName('rangeOfCharacterFromSet:options:range:')]
    function rangeOfCharacterFromSetOptionsRange(searchSet: NSCharacterSet;
      options: NSStringCompareOptions; range: NSRange): NSRange; cdecl;
    function rangeOfComposedCharacterSequenceAtIndex(index: NSUInteger)
      : NSRange; cdecl;
    function rangeOfComposedCharacterSequencesForRange(range: NSRange)
      : NSRange; cdecl;
    function stringByAppendingString(aString: NSString): NSString; cdecl;
    function stringByAppendingFormat(format: NSString): NSString; cdecl;
    function doubleValue: Double; cdecl;
    function floatValue: Single; cdecl;
    function intValue: Integer; cdecl;
    function integerValue: NSInteger; cdecl;
    function longLongValue: Int64; cdecl;
    function boolValue: Boolean; cdecl;
    function uppercaseString: NSString; cdecl;
    function lowercaseString: NSString; cdecl;
    function capitalizedString: NSString; cdecl;
    function localizedUppercaseString: NSString; cdecl;
    function localizedLowercaseString: NSString; cdecl;
    function localizedCapitalizedString: NSString; cdecl;
    function uppercaseStringWithLocale(locale: NSLocale): NSString; cdecl;
    function lowercaseStringWithLocale(locale: NSLocale): NSString; cdecl;
    function capitalizedStringWithLocale(locale: NSLocale): NSString; cdecl;
    procedure getLineStart(startPtr: PNSUInteger; &end: PNSUInteger;
      contentsEnd: PNSUInteger; forRange: NSRange); cdecl;
    function lineRangeForRange(range: NSRange): NSRange; cdecl;
    procedure getParagraphStart(startPtr: PNSUInteger; &end: PNSUInteger;
      contentsEnd: PNSUInteger; forRange: NSRange); cdecl;
    function paragraphRangeForRange(range: NSRange): NSRange; cdecl;
    procedure enumerateSubstringsInRange(range: NSRange;
      options: NSStringEnumerationOptions;
      usingBlock: TFoundationUsingBlock); cdecl;
    procedure enumerateLinesUsingBlock(block: TFoundationBlock6); cdecl;
    function UTF8String: MarshaledAString; cdecl;
    function fastestEncoding: NSStringEncoding; cdecl;
    function smallestEncoding: NSStringEncoding; cdecl;
    [MethodName('dataUsingEncoding:allowLossyConversion:')]
    function dataUsingEncodingAllowLossyConversion(encoding: NSStringEncoding;
      allowLossyConversion: Boolean): NSData; cdecl;
    [MethodName('dataUsingEncoding:')]
    function dataUsingEncoding(encoding: NSStringEncoding): NSData; cdecl;
    function canBeConvertedToEncoding(encoding: NSStringEncoding)
      : Boolean; cdecl;
    function cStringUsingEncoding(encoding: NSStringEncoding)
      : MarshaledAString; cdecl;
    [MethodName('getCString:maxLength:encoding:')]
    function getCStringMaxLengthEncoding(buffer: MarshaledAString;
      maxLength: NSUInteger; encoding: NSStringEncoding): Boolean; cdecl;
    function getBytes(buffer: Pointer; maxLength: NSUInteger;
      usedLength: PNSUInteger; encoding: NSStringEncoding;
      options: NSStringEncodingConversionOptions; range: NSRange;
      remainingRange: NSRangePointer): Boolean; cdecl;
    function maximumLengthOfBytesUsingEncoding(enc: NSStringEncoding)
      : NSUInteger; cdecl;
    function lengthOfBytesUsingEncoding(enc: NSStringEncoding)
      : NSUInteger; cdecl;
    procedure setAvailableStringEncodings(availableStringEncodings
      : PNSStringEncoding); cdecl;
    function availableStringEncodings: PNSStringEncoding; cdecl;
    procedure setDefaultCStringEncoding(defaultCStringEncoding
      : NSStringEncoding); cdecl;
    function defaultCStringEncoding: NSStringEncoding; cdecl;
    function decomposedStringWithCanonicalMapping: NSString; cdecl;
    function precomposedStringWithCanonicalMapping: NSString; cdecl;
    function decomposedStringWithCompatibilityMapping: NSString; cdecl;
    function precomposedStringWithCompatibilityMapping: NSString; cdecl;
    function componentsSeparatedByString(separator: NSString): NSArray; cdecl;
    function componentsSeparatedByCharactersInSet(separator: NSCharacterSet)
      : NSArray; cdecl;
    function stringByTrimmingCharactersInSet(&set: NSCharacterSet)
      : NSString; cdecl;
    function stringByPaddingToLength(newLength: NSUInteger;
      withString: NSString; startingAtIndex: NSUInteger): NSString; cdecl;
    function stringByFoldingWithOptions(options: NSStringCompareOptions;
      locale: NSLocale): NSString; cdecl;
    [MethodName
      ('stringByReplacingOccurrencesOfString:withString:options:range:')]
    function stringByReplacingOccurrencesOfStringWithStringOptionsRange
      (target: NSString; withString: NSString; options: NSStringCompareOptions;
      range: NSRange): NSString; cdecl;
    [MethodName('stringByReplacingOccurrencesOfString:withString:')]
    function stringByReplacingOccurrencesOfStringWithString(target: NSString;
      withString: NSString): NSString; cdecl;
    function stringByReplacingCharactersInRange(range: NSRange;
      withString: NSString): NSString; cdecl;
    function stringByApplyingTransform(transform: NSStringTransform;
      reverse: Boolean): NSString; cdecl;
    [MethodName('writeToURL:atomically:encoding:error:')]
    function writeToURLAtomicallyEncodingError(url: NSURL; atomically: Boolean;
      encoding: NSStringEncoding; error: NSError): Boolean; cdecl;
    [MethodName('writeToFile:atomically:encoding:error:')]
    function writeToFileAtomicallyEncodingError(path: NSString;
      atomically: Boolean; encoding: NSStringEncoding; error: NSError)
      : Boolean; cdecl;
    function description: NSString; cdecl;
    function hash: NSUInteger; cdecl;
    [MethodName('initWithCharactersNoCopy:length:freeWhenDone:')]
    function initWithCharactersNoCopyLengthFreeWhenDone(characters: Punichar;
      length: NSUInteger; freeWhenDone: Boolean)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithCharactersNoCopy:length:deallocator:')]
    function initWithCharactersNoCopyLengthDeallocator(chars: Punichar;
      length: NSUInteger; deallocator: TFoundationDeallocator)
      : Pointer { instancetype }; cdecl;
    function initWithCharacters(characters: Punichar; length: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithUTF8String(nullTerminatedCString: MarshaledAString)
      : Pointer { instancetype }; cdecl;
    function initWithString(aString: NSString): Pointer { instancetype }; cdecl;
    [MethodName('initWithFormat:')]
    function initWithFormat(format: NSString): Pointer { instancetype }; cdecl;
    [MethodName('initWithFormat:arguments:')]
    function initWithFormatArguments(format: NSString;
      arguments: array of const): Pointer { instancetype }; cdecl;
    [MethodName('initWithFormat:locale:')]
    function initWithFormatLocale(format: NSString; locale: Pointer)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithFormat:locale:arguments:')]
    function initWithFormatLocaleArguments(format: NSString; locale: Pointer;
      arguments: array of const): Pointer { instancetype }; cdecl;
    [MethodName('initWithValidatedFormat:validFormatSpecifiers:error:')]
    function initWithValidatedFormatValidFormatSpecifiersError(format: NSString;
      validFormatSpecifiers: NSString; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithValidatedFormat:validFormatSpecifiers:locale:error:')]
    function initWithValidatedFormatValidFormatSpecifiersLocaleError
      (format: NSString; validFormatSpecifiers: NSString; locale: Pointer;
      error: NSError): Pointer { instancetype }; cdecl;
    [MethodName
      ('initWithValidatedFormat:validFormatSpecifiers:arguments:error:')]
    function initWithValidatedFormatValidFormatSpecifiersArgumentsError
      (format: NSString; validFormatSpecifiers: NSString;
      arguments: array of const; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:')]
    function initWithValidatedFormatValidFormatSpecifiersLocaleArgumentsError
      (format: NSString; validFormatSpecifiers: NSString; locale: Pointer;
      arguments: array of const; error: NSError)
      : Pointer { instancetype }; cdecl;
    function initWithData(data: NSData; encoding: NSStringEncoding)
      : Pointer { instancetype }; cdecl;
    function initWithBytes(bytes: Pointer; length: NSUInteger;
      encoding: NSStringEncoding): Pointer { instancetype }; cdecl;
    [MethodName('initWithBytesNoCopy:length:encoding:freeWhenDone:')]
    function initWithBytesNoCopyLengthEncodingFreeWhenDone(bytes: Pointer;
      length: NSUInteger; encoding: NSStringEncoding; freeWhenDone: Boolean)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithBytesNoCopy:length:encoding:deallocator:')]
    function initWithBytesNoCopyLengthEncodingDeallocator(bytes: Pointer;
      length: NSUInteger; encoding: NSStringEncoding;
      deallocator: TFoundationDeallocator1): Pointer { instancetype }; cdecl;
    [MethodName('initWithCString:encoding:')]
    function initWithCStringEncoding(nullTerminatedCString: MarshaledAString;
      encoding: NSStringEncoding): Pointer { instancetype }; cdecl;
    [MethodName('initWithContentsOfURL:encoding:error:')]
    function initWithContentsOfURLEncodingError(url: NSURL;
      encoding: NSStringEncoding; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithContentsOfFile:encoding:error:')]
    function initWithContentsOfFileEncodingError(path: NSString;
      encoding: NSStringEncoding; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithContentsOfURL:usedEncoding:error:')]
    function initWithContentsOfURLUsedEncodingError(url: NSURL;
      usedEncoding: PNSStringEncoding; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithContentsOfFile:usedEncoding:error:')]
    function initWithContentsOfFileUsedEncodingError(path: NSString;
      usedEncoding: PNSStringEncoding; error: NSError)
      : Pointer { instancetype }; cdecl;
    function propertyList: Pointer; cdecl;
    function propertyListFromStringsFileFormat: NSDictionary; cdecl;
    function cString: MarshaledAString; cdecl;
    function lossyCString: MarshaledAString; cdecl;
    function cStringLength: NSUInteger; cdecl;
    [MethodName('getCString:')]
    procedure getCString(bytes: MarshaledAString); cdecl;
    [MethodName('getCString:maxLength:')]
    procedure getCStringMaxLength(bytes: MarshaledAString;
      maxLength: NSUInteger); cdecl;
    [MethodName('getCString:maxLength:range:remainingRange:')]
    procedure getCStringMaxLengthRangeRemainingRange(bytes: MarshaledAString;
      maxLength: NSUInteger; range: NSRange;
      remainingRange: NSRangePointer); cdecl;
    [MethodName('writeToFile:atomically:')]
    function writeToFileAtomically(path: NSString; atomically: Boolean)
      : Boolean; cdecl;
    [MethodName('writeToURL:atomically:')]
    function writeToURLAtomically(url: NSURL; atomically: Boolean)
      : Boolean; cdecl;
    [MethodName('initWithContentsOfFile:')]
    function initWithContentsOfFile(path: NSString): Pointer; cdecl;
    [MethodName('initWithContentsOfURL:')]
    function initWithContentsOfURL(url: NSURL): Pointer; cdecl;
    function initWithCStringNoCopy(bytes: MarshaledAString; length: NSUInteger;
      freeWhenDone: Boolean): Pointer; cdecl;
    [MethodName('initWithCString:length:')]
    function initWithCStringLength(bytes: MarshaledAString; length: NSUInteger)
      : Pointer; cdecl;
    [MethodName('initWithCString:')]
    function initWithCString(bytes: MarshaledAString): Pointer; cdecl;
    [MethodName('getCharacters:')]
    procedure getCharacters(buffer: Punichar); cdecl;
    function variantFittingPresentationWidth(width: NSInteger): NSString; cdecl;
    function pathComponents: NSArray; cdecl;
    function isAbsolutePath: Boolean; cdecl;
    function lastPathComponent: NSString; cdecl;
    function stringByDeletingLastPathComponent: NSString; cdecl;
    function stringByAppendingPathComponent(str: NSString): NSString; cdecl;
    function pathExtension: NSString; cdecl;
    function stringByDeletingPathExtension: NSString; cdecl;
    function stringByAppendingPathExtension(str: NSString): NSString; cdecl;
    function stringByAbbreviatingWithTildeInPath: NSString; cdecl;
    function stringByExpandingTildeInPath: NSString; cdecl;
    function stringByStandardizingPath: NSString; cdecl;
    function stringByResolvingSymlinksInPath: NSString; cdecl;
    function stringsByAppendingPaths(paths: NSArray): NSArray; cdecl;
    function completePathIntoString(outputName: NSString;
      caseSensitive: Boolean; matchesIntoArray: NSArray; filterTypes: NSArray)
      : NSUInteger; cdecl;
    function fileSystemRepresentation: MarshaledAString; cdecl;
    function getFileSystemRepresentation(cname: MarshaledAString;
      maxLength: NSUInteger): Boolean; cdecl;
    function stringByAddingPercentEncodingWithAllowedCharacters
      (allowedCharacters: NSCharacterSet): NSString; cdecl;
    function stringByRemovingPercentEncoding: NSString; cdecl;
    function stringByAddingPercentEscapesUsingEncoding(enc: NSStringEncoding)
      : NSString; cdecl;
    function stringByReplacingPercentEscapesUsingEncoding(enc: NSStringEncoding)
      : NSString; cdecl;
    function linguisticTagsInRange(range: NSRange;
      scheme: NSLinguisticTagScheme; options: NSLinguisticTaggerOptions;
      orthography: NSOrthography; tokenRanges: NSArray): NSArray; cdecl;
    procedure enumerateLinguisticTagsInRange(range: NSRange;
      scheme: NSLinguisticTagScheme; options: NSLinguisticTaggerOptions;
      orthography: NSOrthography; usingBlock: TFoundationUsingBlock7); cdecl;
  end;

  TNSString = class(TOCGenericImport<NSStringClass, NSString>)
  end;

  PNSString = Pointer;

  NSInvocationClass = interface(NSObjectClass)
    ['{F3C7DC76-9C53-4EA7-BF0C-0D58DC08DF24}']
    { class } function invocationWithMethodSignature(sig: NSMethodSignature)
      : NSInvocation; cdecl;
  end;

  NSInvocation = interface(NSObject)
    ['{8AE98BC7-A13C-4A81-A6E5-CB7665547A20}']
    function methodSignature: NSMethodSignature; cdecl;
    procedure retainArguments; cdecl;
    function argumentsRetained: Boolean; cdecl;
    procedure setTarget(target: Pointer); cdecl;
    function target: Pointer; cdecl;
    procedure setSelector(selector: SEL); cdecl;
    function selector: SEL; cdecl;
    procedure getReturnValue(retLoc: Pointer); cdecl;
    procedure setReturnValue(retLoc: Pointer); cdecl;
    procedure getArgument(argumentLocation: Pointer; atIndex: NSInteger); cdecl;
    procedure setArgument(argumentLocation: Pointer; atIndex: NSInteger); cdecl;
    procedure invoke; cdecl;
    procedure invokeWithTarget(target: Pointer); cdecl;
    procedure invokeUsingIMP(IMP: IMP); cdecl;
  end;

  TNSInvocation = class(TOCGenericImport<NSInvocationClass, NSInvocation>)
  end;

  PNSInvocation = Pointer;

  NSMethodSignatureClass = interface(NSObjectClass)
    ['{14A2C9FF-6191-4F1E-9036-882F6D9B6BCA}']
    { class } function signatureWithObjCTypes(types: MarshaledAString)
      : NSMethodSignature; cdecl;
  end;

  NSMethodSignature = interface(NSObject)
    ['{4939C206-1020-4E12-B80C-16E25D3A538E}']
    function numberOfArguments: NSUInteger; cdecl;
    function getArgumentTypeAtIndex(idx: NSUInteger): MarshaledAString; cdecl;
    function frameLength: NSUInteger; cdecl;
    function isOneway: Boolean; cdecl;
    function methodReturnType: MarshaledAString; cdecl;
    function methodReturnLength: NSUInteger; cdecl;
  end;

  TNSMethodSignature = class(TOCGenericImport<NSMethodSignatureClass,
    NSMethodSignature>)
  end;

  PNSMethodSignature = Pointer;

  NSCoderClass = interface(NSObjectClass)
    ['{6E97C6CA-E059-4E35-98C8-F9D2D343B04B}']
  end;

  NSCoder = interface(NSObject)
    ['{5EC7AD4D-B47B-45E9-93F5-F05420F0560F}']
    procedure encodeValueOfObjCType(&type: MarshaledAString;
      at: Pointer); cdecl;
    procedure encodeDataObject(data: NSData); cdecl;
    function decodeDataObject: NSData; cdecl;
    [MethodName('decodeValueOfObjCType:at:size:')]
    procedure decodeValueOfObjCTypeAtSize(&type: MarshaledAString; at: Pointer;
      size: NSUInteger); cdecl;
    function versionForClassName(className: NSString): NSInteger; cdecl;
    [MethodName('encodeObject:')]
    procedure encodeObject(&object: Pointer); cdecl;
    procedure encodeRootObject(rootObject: Pointer); cdecl;
    procedure encodeBycopyObject(anObject: Pointer); cdecl;
    procedure encodeByrefObject(anObject: Pointer); cdecl;
    [MethodName('encodeConditionalObject:')]
    procedure encodeConditionalObject(&object: Pointer); cdecl;
    procedure encodeValuesOfObjCTypes(types: MarshaledAString); cdecl;
    procedure encodeArrayOfObjCType(&type: MarshaledAString; count: NSUInteger;
      at: Pointer); cdecl;
    [MethodName('encodeBytes:length:')]
    procedure encodeBytesLength(byteaddr: Pointer; length: NSUInteger); cdecl;
    function decodeObject: Pointer; cdecl;
    function decodeTopLevelObjectAndReturnError(error: NSError): Pointer; cdecl;
    procedure decodeValuesOfObjCTypes(types: MarshaledAString); cdecl;
    procedure decodeArrayOfObjCType(itemType: MarshaledAString;
      count: NSUInteger; at: Pointer); cdecl;
    function decodeBytesWithReturnedLength(lengthp: PNSUInteger)
      : Pointer; cdecl;
    procedure setObjectZone(zone: Pointer); cdecl;
    function objectZone: Pointer; cdecl;
    function systemVersion: Cardinal; cdecl;
    function allowsKeyedCoding: Boolean; cdecl;
    [MethodName('encodeObject:forKey:')]
    procedure encodeObjectForKey(&object: Pointer; forKey: NSString); cdecl;
    [MethodName('encodeConditionalObject:forKey:')]
    procedure encodeConditionalObjectForKey(&object: Pointer;
      forKey: NSString); cdecl;
    procedure encodeBool(value: Boolean; forKey: NSString); cdecl;
    procedure encodeInt(value: Integer; forKey: NSString); cdecl;
    procedure encodeInt32(value: Int32; forKey: NSString); cdecl;
    procedure encodeInt64(value: Int64; forKey: NSString); cdecl;
    procedure encodeFloat(value: Single; forKey: NSString); cdecl;
    procedure encodeDouble(value: Double; forKey: NSString); cdecl;
    [MethodName('encodeBytes:length:forKey:')]
    procedure encodeBytesLengthForKey(bytes: PByte; length: NSUInteger;
      forKey: NSString); cdecl;
    function containsValueForKey(key: NSString): Boolean; cdecl;
    function decodeObjectForKey(key: NSString): Pointer; cdecl;
    function decodeTopLevelObjectForKey(key: NSString; error: NSError)
      : Pointer; cdecl;
    function decodeBoolForKey(key: NSString): Boolean; cdecl;
    function decodeIntForKey(key: NSString): Integer; cdecl;
    function decodeInt32ForKey(key: NSString): Int32; cdecl;
    function decodeInt64ForKey(key: NSString): Int64; cdecl;
    function decodeFloatForKey(key: NSString): Single; cdecl;
    function decodeDoubleForKey(key: NSString): Double; cdecl;
    function decodeBytesForKey(key: NSString; returnedLength: PNSUInteger)
      : PByte; cdecl;
    procedure encodeInteger(value: NSInteger; forKey: NSString); cdecl;
    function decodeIntegerForKey(key: NSString): NSInteger; cdecl;
    function requiresSecureCoding: Boolean; cdecl;
    function decodeObjectOfClass(aClass: Pointer; forKey: NSString)
      : Pointer; cdecl;
    function decodeTopLevelObjectOfClass(aClass: Pointer; forKey: NSString;
      error: NSError): Pointer; cdecl;
    function decodeArrayOfObjectsOfClass(cls: Pointer; forKey: NSString)
      : NSArray; cdecl;
    function decodeDictionaryWithKeysOfClass(keyCls: Pointer;
      objectsOfClass: Pointer; forKey: NSString): NSDictionary; cdecl;
    function decodeObjectOfClasses(classes: NSSet; forKey: NSString)
      : Pointer; cdecl;
    function decodeTopLevelObjectOfClasses(classes: NSSet; forKey: NSString;
      error: NSError): Pointer; cdecl;
    function decodeArrayOfObjectsOfClasses(classes: NSSet; forKey: NSString)
      : NSArray; cdecl;
    function decodeDictionaryWithKeysOfClasses(keyClasses: NSSet;
      objectsOfClasses: NSSet; forKey: NSString): NSDictionary; cdecl;
    function decodePropertyListForKey(key: NSString): Pointer; cdecl;
    function allowedClasses: NSSet; cdecl;
    procedure failWithError(error: NSError); cdecl;
    function decodingFailurePolicy: NSDecodingFailurePolicy; cdecl;
    function error: NSError; cdecl;
    [MethodName('decodeValueOfObjCType:at:')]
    procedure decodeValueOfObjCTypeAt(&type: MarshaledAString;
      at: Pointer); cdecl;
  end;

  TNSCoder = class(TOCGenericImport<NSCoderClass, NSCoder>)
  end;

  PNSCoder = Pointer;

  NSEnumeratorClass = interface(NSObjectClass)
    ['{4EBBE97C-AA1E-4A38-94C4-06435F7CF982}']
  end;

  NSEnumerator = interface(NSObject)
    ['{65570CD6-5183-4024-AACE-1EDCA2A405D2}']
    function nextObject: ObjectType; cdecl;
    function allObjects: NSArray; cdecl;
  end;

  TNSEnumerator = class(TOCGenericImport<NSEnumeratorClass, NSEnumerator>)
  end;

  PNSEnumerator = Pointer;

  NSCoderMethods = interface(IObjectiveC)
    ['{F7D39E20-ADB6-4629-93DB-6D56EF521408}']
    function version: NSInteger; cdecl;
    procedure setVersion(aVersion: NSInteger); cdecl;
    function classForCoder: Pointer; cdecl;
    function replacementObjectForCoder(coder: NSCoder): Pointer; cdecl;
    function awakeAfterUsingCoder(coder: NSCoder): Pointer; cdecl;
  end;

  NSDiscardableContentProxy = interface(IObjectiveC)
    ['{2DEEDBF2-F97D-4AC7-BC37-A5A2C9A30C96}']
    function autoContentAccessingProxy: Pointer; cdecl;
  end;

  NSArrayClass = interface(NSObjectClass)
    ['{C6FB8CF8-71C8-442D-97F4-8A17E0BE1F4A}']
    { class } function &array: Pointer { instancetype }; cdecl;
    { class } function arrayWithObject(anObject: ObjectType)
      : Pointer { instancetype }; cdecl;
    [MethodName('arrayWithObjects:count:')]
    { class } function arrayWithObjectsCount(objects: ObjectType;
      count: NSUInteger): Pointer { instancetype }; cdecl;
    [MethodName('arrayWithObjects:')]
    { class } function arrayWithObjects(firstObj: ObjectType)
      : Pointer { instancetype }; cdecl;
    { class } function arrayWithArray(&array: NSArray)
      : Pointer { instancetype }; cdecl;
    [MethodName('arrayWithContentsOfURL:error:')]
    { class } function arrayWithContentsOfURLError(url: NSURL; error: NSError)
      : NSArray; cdecl;
    { class } function arrayWithContentsOfFile(path: NSString): NSArray; cdecl;
    [MethodName('arrayWithContentsOfURL:')]
    { class } function arrayWithContentsOfURL(url: NSURL): NSArray; cdecl;
  end;

  NSArray = interface(NSObject)
    ['{D66B1363-62CA-4176-BB13-583F438B6CE8}']
    function count: NSUInteger; cdecl;
    function objectAtIndex(index: NSUInteger): ObjectType; cdecl;
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithObjects:count:')]
    function initWithObjectsCount(objects: ObjectType; count: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function arrayByAddingObject(anObject: ObjectType): NSArray; cdecl;
    function arrayByAddingObjectsFromArray(otherArray: NSArray): NSArray; cdecl;
    function componentsJoinedByString(separator: NSString): NSString; cdecl;
    function containsObject(anObject: ObjectType): Boolean; cdecl;
    function description: NSString; cdecl;
    [MethodName('descriptionWithLocale:')]
    function descriptionWithLocale(locale: Pointer): NSString; cdecl;
    [MethodName('descriptionWithLocale:indent:')]
    function descriptionWithLocaleIndent(locale: Pointer; indent: NSUInteger)
      : NSString; cdecl;
    function firstObjectCommonWithArray(otherArray: NSArray): ObjectType; cdecl;
    [MethodName('getObjects:range:')]
    procedure getObjectsRange(objects: ObjectType; range: NSRange); cdecl;
    [MethodName('indexOfObject:')]
    function indexOfObject(anObject: ObjectType): NSUInteger; cdecl;
    [MethodName('indexOfObject:inRange:')]
    function indexOfObjectInRange(anObject: ObjectType; inRange: NSRange)
      : NSUInteger; cdecl;
    [MethodName('indexOfObjectIdenticalTo:')]
    function indexOfObjectIdenticalTo(anObject: ObjectType): NSUInteger; cdecl;
    [MethodName('indexOfObjectIdenticalTo:inRange:')]
    function indexOfObjectIdenticalToInRange(anObject: ObjectType;
      inRange: NSRange): NSUInteger; cdecl;
    function isEqualToArray(otherArray: NSArray): Boolean; cdecl;
    function firstObject: ObjectType; cdecl;
    function lastObject: ObjectType; cdecl;
    function objectEnumerator: NSEnumerator; cdecl;
    function reverseObjectEnumerator: NSEnumerator; cdecl;
    function sortedArrayHint: NSData; cdecl;
    [MethodName('sortedArrayUsingFunction:context:')]
    function sortedArrayUsingFunctionContext(comparator: TFoundationComparator;
      context: Pointer): NSArray; cdecl;
    [MethodName('sortedArrayUsingFunction:context:hint:')]
    function sortedArrayUsingFunctionContextHint
      (comparator: TFoundationComparator; context: Pointer; hint: NSData)
      : NSArray; cdecl;
    function sortedArrayUsingSelector(comparator: SEL): NSArray; cdecl;
    function subarrayWithRange(range: NSRange): NSArray; cdecl;
    [MethodName('writeToURL:error:')]
    function writeToURLError(url: NSURL; error: NSError): Boolean; cdecl;
    [MethodName('makeObjectsPerformSelector:')]
    procedure makeObjectsPerformSelector(aSelector: SEL); cdecl;
    [MethodName('makeObjectsPerformSelector:withObject:')]
    procedure makeObjectsPerformSelectorWithObject(aSelector: SEL;
      withObject: Pointer); cdecl;
    function objectsAtIndexes(indexes: NSIndexSet): NSArray; cdecl;
    function objectAtIndexedSubscript(idx: NSUInteger): ObjectType; cdecl;
    procedure enumerateObjectsUsingBlock(block: TFoundationBlock3); cdecl;
    procedure enumerateObjectsWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock3); cdecl;
    procedure enumerateObjectsAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; usingBlock: TFoundationBlock3); cdecl;
    function indexOfObjectPassingTest(predicate: TFoundationPredicate1)
      : NSUInteger; cdecl;
    function indexOfObjectWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate1): NSUInteger; cdecl;
    function indexOfObjectAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; passingTest: TFoundationPredicate1)
      : NSUInteger; cdecl;
    function indexesOfObjectsPassingTest(predicate: TFoundationPredicate1)
      : NSIndexSet; cdecl;
    function indexesOfObjectsWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate1): NSIndexSet; cdecl;
    function indexesOfObjectsAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; passingTest: TFoundationPredicate1)
      : NSIndexSet; cdecl;
    function sortedArrayUsingComparator(cmptr: NSComparator): NSArray; cdecl;
    function sortedArrayWithOptions(opts: NSSortOptions;
      usingComparator: NSComparator): NSArray; cdecl;
    [MethodName('indexOfObject:inSortedRange:options:usingComparator:')]
    function indexOfObjectInSortedRangeOptionsUsingComparator(obj: ObjectType;
      inSortedRange: NSRange; options: NSBinarySearchingOptions;
      usingComparator: NSComparator): NSUInteger; cdecl;
    [MethodName('initWithObjects:')]
    function initWithObjects(firstObj: ObjectType)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithArray:')]
    function initWithArray(&array: NSArray): Pointer { instancetype }; cdecl;
    [MethodName('initWithArray:copyItems:')]
    function initWithArrayCopyItems(&array: NSArray; copyItems: Boolean)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithContentsOfURL:error:')]
    function initWithContentsOfURLError(url: NSURL; error: NSError)
      : NSArray; cdecl;
    [MethodName('differenceFromArray:withOptions:usingEquivalenceTest:')]
    function differenceFromArrayWithOptionsUsingEquivalenceTest(other: NSArray;
      withOptions: NSOrderedCollectionDifferenceCalculationOptions;
      usingEquivalenceTest: TFoundationUsingEquivalenceTest)
      : NSOrderedCollectionDifference; cdecl;
    [MethodName('differenceFromArray:withOptions:')]
    function differenceFromArrayWithOptions(other: NSArray;
      withOptions: NSOrderedCollectionDifferenceCalculationOptions)
      : NSOrderedCollectionDifference; cdecl;
    [MethodName('differenceFromArray:')]
    function differenceFromArray(other: NSArray)
      : NSOrderedCollectionDifference; cdecl;
    function arrayByApplyingDifference(difference
      : NSOrderedCollectionDifference): NSArray; cdecl;
    [MethodName('getObjects:')]
    procedure getObjects(objects: ObjectType); cdecl;
    function initWithContentsOfFile(path: NSString): NSArray; cdecl;
    [MethodName('initWithContentsOfURL:')]
    function initWithContentsOfURL(url: NSURL): NSArray; cdecl;
    function writeToFile(path: NSString; atomically: Boolean): Boolean; cdecl;
    [MethodName('writeToURL:atomically:')]
    function writeToURLAtomically(url: NSURL; atomically: Boolean)
      : Boolean; cdecl;
    function pathsMatchingExtensions(filterTypes: NSArray): NSArray; cdecl;
    function valueForKey(key: NSString): Pointer; cdecl;
    procedure setValue(value: Pointer; forKey: NSString); cdecl;
    [MethodName('addObserver:toObjectsAtIndexes:forKeyPath:options:context:')]
    procedure addObserverToObjectsAtIndexesForKeyPathOptionsContext
      (observer: NSObject; toObjectsAtIndexes: NSIndexSet; forKeyPath: NSString;
      options: NSKeyValueObservingOptions; context: Pointer); cdecl;
    [MethodName('removeObserver:fromObjectsAtIndexes:forKeyPath:context:')]
    procedure removeObserverFromObjectsAtIndexesForKeyPathContext
      (observer: NSObject; fromObjectsAtIndexes: NSIndexSet;
      forKeyPath: NSString; context: Pointer); cdecl;
    [MethodName('removeObserver:fromObjectsAtIndexes:forKeyPath:')]
    procedure removeObserverFromObjectsAtIndexesForKeyPath(observer: NSObject;
      fromObjectsAtIndexes: NSIndexSet; forKeyPath: NSString); cdecl;
    [MethodName('addObserver:forKeyPath:options:context:')]
    procedure addObserverForKeyPathOptionsContext(observer: NSObject;
      forKeyPath: NSString; options: NSKeyValueObservingOptions;
      context: Pointer); cdecl;
    [MethodName('removeObserver:forKeyPath:context:')]
    procedure removeObserverForKeyPathContext(observer: NSObject;
      forKeyPath: NSString; context: Pointer); cdecl;
    [MethodName('removeObserver:forKeyPath:')]
    procedure removeObserverForKeyPath(observer: NSObject;
      forKeyPath: NSString); cdecl;
    function sortedArrayUsingDescriptors(sortDescriptors: NSArray)
      : NSArray; cdecl;
    function filteredArrayUsingPredicate(predicate: NSPredicate)
      : NSArray; cdecl;
  end;

  TNSArray = class(TOCGenericImport<NSArrayClass, NSArray>)
  end;

  PNSArray = Pointer;

  NSDictionaryClass = interface(NSObjectClass)
    ['{72C329E3-A85D-40BF-A104-6FB48B5E95AA}']
    { class } function dictionaryWithContentsOfFile(path: NSString)
      : NSDictionary; cdecl;
    [MethodName('dictionaryWithContentsOfURL:')]
    { class } function dictionaryWithContentsOfURL(url: NSURL)
      : NSDictionary; cdecl;
    { class } function dictionary: Pointer { instancetype }; cdecl;
    { class } function dictionaryWithObject(&object: ObjectType;
      forKey: Pointer): Pointer { instancetype }; cdecl;
    [MethodName('dictionaryWithObjects:forKeys:count:')]
    { class } function dictionaryWithObjectsForKeysCount(objects: ObjectType;
      forKeys: Pointer; count: NSUInteger): Pointer { instancetype }; cdecl;
    { class } function dictionaryWithObjectsAndKeys(firstObject: Pointer)
      : Pointer { instancetype }; cdecl;
    { class } function dictionaryWithDictionary(dict: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('dictionaryWithObjects:forKeys:')]
    { class } function dictionaryWithObjectsForKeys(objects: NSArray;
      forKeys: NSArray): Pointer { instancetype }; cdecl;
    [MethodName('dictionaryWithContentsOfURL:error:')]
    { class } function dictionaryWithContentsOfURLError(url: NSURL;
      error: NSError): NSDictionary; cdecl;
    { class } function sharedKeySetForKeys(keys: NSArray): Pointer; cdecl;
  end;

  NSDictionary = interface(NSObject)
    ['{283CC408-8FDE-4721-8A82-97CF3169675A}']
    function count: NSUInteger; cdecl;
    function objectForKey(aKey: KeyType): ObjectType; cdecl;
    function keyEnumerator: NSEnumerator; cdecl;
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithObjects:forKeys:count:')]
    function initWithObjectsForKeysCount(objects: ObjectType; forKeys: Pointer;
      count: NSUInteger): Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function allKeys: NSArray; cdecl;
    function allKeysForObject(anObject: ObjectType): NSArray; cdecl;
    function allValues: NSArray; cdecl;
    function description: NSString; cdecl;
    function descriptionInStringsFileFormat: NSString; cdecl;
    [MethodName('descriptionWithLocale:')]
    function descriptionWithLocale(locale: Pointer): NSString; cdecl;
    [MethodName('descriptionWithLocale:indent:')]
    function descriptionWithLocaleIndent(locale: Pointer; indent: NSUInteger)
      : NSString; cdecl;
    function isEqualToDictionary(otherDictionary: NSDictionary): Boolean; cdecl;
    function objectEnumerator: NSEnumerator; cdecl;
    function objectsForKeys(keys: NSArray; notFoundMarker: ObjectType)
      : NSArray; cdecl;
    [MethodName('writeToURL:error:')]
    function writeToURLError(url: NSURL; error: NSError): Boolean; cdecl;
    function keysSortedByValueUsingSelector(comparator: SEL): NSArray; cdecl;
    [MethodName('getObjects:andKeys:count:')]
    procedure getObjectsAndKeysCount(objects: ObjectType; andKeys: KeyType;
      count: NSUInteger); cdecl;
    function objectForKeyedSubscript(key: KeyType): ObjectType; cdecl;
    procedure enumerateKeysAndObjectsUsingBlock
      (block: TFoundationBlock7); cdecl;
    procedure enumerateKeysAndObjectsWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock7); cdecl;
    function keysSortedByValueUsingComparator(cmptr: NSComparator)
      : NSArray; cdecl;
    function keysSortedByValueWithOptions(opts: NSSortOptions;
      usingComparator: NSComparator): NSArray; cdecl;
    function keysOfEntriesPassingTest(predicate: TFoundationPredicate2)
      : NSSet; cdecl;
    function keysOfEntriesWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate2): NSSet; cdecl;
    [MethodName('getObjects:andKeys:')]
    procedure getObjectsAndKeys(objects: ObjectType; andKeys: KeyType); cdecl;
    function initWithContentsOfFile(path: NSString): NSDictionary; cdecl;
    [MethodName('initWithContentsOfURL:')]
    function initWithContentsOfURL(url: NSURL): NSDictionary; cdecl;
    function writeToFile(path: NSString; atomically: Boolean): Boolean; cdecl;
    [MethodName('writeToURL:atomically:')]
    function writeToURLAtomically(url: NSURL; atomically: Boolean)
      : Boolean; cdecl;
    function initWithObjectsAndKeys(firstObject: Pointer)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithDictionary:')]
    function initWithDictionary(otherDictionary: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithDictionary:copyItems:')]
    function initWithDictionaryCopyItems(otherDictionary: NSDictionary;
      copyItems: Boolean): Pointer { instancetype }; cdecl;
    [MethodName('initWithObjects:forKeys:')]
    function initWithObjectsForKeys(objects: NSArray; forKeys: NSArray)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithContentsOfURL:error:')]
    function initWithContentsOfURLError(url: NSURL; error: NSError)
      : NSDictionary; cdecl;
    function countByEnumeratingWithState(state: PNSFastEnumerationState;
      objects: K; count: NSUInteger): NSUInteger; cdecl;
    function fileSize: UInt64; cdecl;
    function fileModificationDate: NSDate; cdecl;
    function fileType: NSString; cdecl;
    function filePosixPermissions: NSUInteger; cdecl;
    function fileOwnerAccountName: NSString; cdecl;
    function fileGroupOwnerAccountName: NSString; cdecl;
    function fileSystemNumber: NSInteger; cdecl;
    function fileSystemFileNumber: NSUInteger; cdecl;
    function fileExtensionHidden: Boolean; cdecl;
    function fileHFSCreatorCode: OSType; cdecl;
    function fileHFSTypeCode: OSType; cdecl;
    function fileIsImmutable: Boolean; cdecl;
    function fileIsAppendOnly: Boolean; cdecl;
    function fileCreationDate: NSDate; cdecl;
    function fileOwnerAccountID: NSNumber; cdecl;
    function fileGroupOwnerAccountID: NSNumber; cdecl;
    function valueForKey(key: NSString): ObjectType; cdecl;
  end;

  TNSDictionary = class(TOCGenericImport<NSDictionaryClass, NSDictionary>)
  end;

  PNSDictionary = Pointer;

  NSValueClass = interface(NSObjectClass)
    ['{9F38C685-EDAA-417B-86F3-4EBBDFBF6262}']
    { class } function valueWithBytes(value: Pointer;
      objCType: MarshaledAString): NSValue; cdecl;
    { class } function value(value: Pointer; withObjCType: MarshaledAString)
      : NSValue; cdecl;
    { class } function valueWithNonretainedObject(anObject: Pointer)
      : NSValue; cdecl;
    { class } function valueWithPointer(Pointer: Pointer): NSValue; cdecl;
    { class } function valueWithRange(range: NSRange): NSValue; cdecl;
  end;

  NSValue = interface(NSObject)
    ['{6DF5110E-1DF7-42DC-B2ED-D7FDF7C3B535}']
    [MethodName('getValue:size:')]
    procedure getValueSize(value: Pointer; size: NSUInteger); cdecl;
    function objCType: MarshaledAString; cdecl;
    function initWithBytes(value: Pointer; objCType: MarshaledAString)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function nonretainedObjectValue: Pointer; cdecl;
    function pointerValue: Pointer; cdecl;
    function isEqualToValue(value: NSValue): Boolean; cdecl;
    [MethodName('getValue:')]
    procedure getValue(value: Pointer); cdecl;
    function rangeValue: NSRange; cdecl;
  end;

  TNSValue = class(TOCGenericImport<NSValueClass, NSValue>)
  end;

  PNSValue = Pointer;

  NSNumberClass = interface(NSValueClass)
    ['{EB8DA2DC-05A0-4465-B9FF-20FD9691E5A4}']
    { class } function numberWithChar(value: Byte): NSNumber; cdecl;
    { class } function numberWithUnsignedChar(value: Byte): NSNumber; cdecl;
    { class } function numberWithShort(value: SmallInt): NSNumber; cdecl;
    { class } function numberWithUnsignedShort(value: Word): NSNumber; cdecl;
    { class } function numberWithInt(value: Integer): NSNumber; cdecl;
    { class } function numberWithUnsignedInt(value: Cardinal): NSNumber; cdecl;
    { class } function numberWithLong(value: LongInt): NSNumber; cdecl;
    { class } function numberWithUnsignedLong(value: LongWord): NSNumber; cdecl;
    { class } function numberWithLongLong(value: Int64): NSNumber; cdecl;
    { class } function numberWithUnsignedLongLong(value: UInt64)
      : NSNumber; cdecl;
    { class } function numberWithFloat(value: Single): NSNumber; cdecl;
    { class } function numberWithDouble(value: Double): NSNumber; cdecl;
    { class } function numberWithBool(value: Boolean): NSNumber; cdecl;
    { class } function numberWithInteger(value: NSInteger): NSNumber; cdecl;
    { class } function numberWithUnsignedInteger(value: NSUInteger)
      : NSNumber; cdecl;
  end;

  NSNumber = interface(NSValue)
    ['{C41866E9-1D36-4ACD-BEA5-46E8CED10502}']
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function initWithChar(value: Byte): NSNumber; cdecl;
    function initWithUnsignedChar(value: Byte): NSNumber; cdecl;
    function initWithShort(value: SmallInt): NSNumber; cdecl;
    function initWithUnsignedShort(value: Word): NSNumber; cdecl;
    function initWithInt(value: Integer): NSNumber; cdecl;
    function initWithUnsignedInt(value: Cardinal): NSNumber; cdecl;
    function initWithLong(value: LongInt): NSNumber; cdecl;
    function initWithUnsignedLong(value: LongWord): NSNumber; cdecl;
    function initWithLongLong(value: Int64): NSNumber; cdecl;
    function initWithUnsignedLongLong(value: UInt64): NSNumber; cdecl;
    function initWithFloat(value: Single): NSNumber; cdecl;
    function initWithDouble(value: Double): NSNumber; cdecl;
    function initWithBool(value: Boolean): NSNumber; cdecl;
    function initWithInteger(value: NSInteger): NSNumber; cdecl;
    function initWithUnsignedInteger(value: NSUInteger): NSNumber; cdecl;
    function charValue: Byte; cdecl;
    function unsignedCharValue: Byte; cdecl;
    function shortValue: SmallInt; cdecl;
    function unsignedShortValue: Word; cdecl;
    function intValue: Integer; cdecl;
    function unsignedIntValue: Cardinal; cdecl;
    function longValue: LongInt; cdecl;
    function unsignedLongValue: LongWord; cdecl;
    function longLongValue: Int64; cdecl;
    function unsignedLongLongValue: UInt64; cdecl;
    function floatValue: Single; cdecl;
    function doubleValue: Double; cdecl;
    function boolValue: Boolean; cdecl;
    function integerValue: NSInteger; cdecl;
    function unsignedIntegerValue: NSUInteger; cdecl;
    function stringValue: NSString; cdecl;
    function compare(otherNumber: NSNumber): NSComparisonResult; cdecl;
    function isEqualToNumber(number: NSNumber): Boolean; cdecl;
    function descriptionWithLocale(locale: Pointer): NSString; cdecl;
    function decimalValue: NSDecimal; cdecl;
  end;

  TNSNumber = class(TOCGenericImport<NSNumberClass, NSNumber>)
  end;

  PNSNumber = Pointer;

  NSOrderedCollectionChangeClass = interface(NSObjectClass)
    ['{69D3D8A5-8BD5-45F5-AC1C-E110581450DD}']
    [MethodName('changeWithObject:type:index:')]
    { class } function changeWithObjectTypeIndex(anObject: ObjectType;
      &type: NSCollectionChangeType; index: NSUInteger)
      : NSOrderedCollectionChange; cdecl;
    [MethodName('changeWithObject:type:index:associatedIndex:')]
    { class } function changeWithObjectTypeIndexAssociatedIndex
      (anObject: ObjectType; &type: NSCollectionChangeType; index: NSUInteger;
      associatedIndex: NSUInteger): NSOrderedCollectionChange; cdecl;
  end;

  NSOrderedCollectionChange = interface(NSObject)
    ['{943EE32F-6114-4C09-8D66-939860164A32}']
    function &object: ObjectType; cdecl;
    function changeType: NSCollectionChangeType; cdecl;
    function index: NSUInteger; cdecl;
    function associatedIndex: NSUInteger; cdecl;
    function init: Pointer; cdecl;
    [MethodName('initWithObject:type:index:')]
    function initWithObjectTypeIndex(anObject: ObjectType;
      &type: NSCollectionChangeType; index: NSUInteger)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithObject:type:index:associatedIndex:')]
    function initWithObjectTypeIndexAssociatedIndex(anObject: ObjectType;
      &type: NSCollectionChangeType; index: NSUInteger;
      associatedIndex: NSUInteger): Pointer { instancetype }; cdecl;
  end;

  TNSOrderedCollectionChange = class
    (TOCGenericImport<NSOrderedCollectionChangeClass,
    NSOrderedCollectionChange>)
  end;

  PNSOrderedCollectionChange = Pointer;

  NSIndexSetClass = interface(NSObjectClass)
    ['{97A3791B-B611-492B-B084-CC4209A73CE7}']
    { class } function indexSet: Pointer { instancetype }; cdecl;
    { class } function indexSetWithIndex(value: NSUInteger)
      : Pointer { instancetype }; cdecl;
    { class } function indexSetWithIndexesInRange(range: NSRange)
      : Pointer { instancetype }; cdecl;
  end;

  NSIndexSet = interface(NSObject)
    ['{A9273B70-F220-45B1-B8EF-D611D63D7D12}']
    function initWithIndexesInRange(range: NSRange)
      : Pointer { instancetype }; cdecl;
    function initWithIndexSet(indexSet: NSIndexSet)
      : Pointer { instancetype }; cdecl;
    function initWithIndex(value: NSUInteger): Pointer { instancetype }; cdecl;
    function isEqualToIndexSet(indexSet: NSIndexSet): Boolean; cdecl;
    function count: NSUInteger; cdecl;
    function firstIndex: NSUInteger; cdecl;
    function lastIndex: NSUInteger; cdecl;
    function indexGreaterThanIndex(value: NSUInteger): NSUInteger; cdecl;
    function indexLessThanIndex(value: NSUInteger): NSUInteger; cdecl;
    function indexGreaterThanOrEqualToIndex(value: NSUInteger)
      : NSUInteger; cdecl;
    function indexLessThanOrEqualToIndex(value: NSUInteger): NSUInteger; cdecl;
    function getIndexes(indexBuffer: PNSUInteger; maxCount: NSUInteger;
      inIndexRange: NSRangePointer): NSUInteger; cdecl;
    function countOfIndexesInRange(range: NSRange): NSUInteger; cdecl;
    function containsIndex(value: NSUInteger): Boolean; cdecl;
    function containsIndexesInRange(range: NSRange): Boolean; cdecl;
    function containsIndexes(indexSet: NSIndexSet): Boolean; cdecl;
    function intersectsIndexesInRange(range: NSRange): Boolean; cdecl;
    procedure enumerateIndexesUsingBlock(block: TFoundationBlock); cdecl;
    procedure enumerateIndexesWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock); cdecl;
    procedure enumerateIndexesInRange(range: NSRange;
      options: NSEnumerationOptions; usingBlock: TFoundationBlock); cdecl;
    function indexPassingTest(predicate: TFoundationPredicate)
      : NSUInteger; cdecl;
    function indexWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate): NSUInteger; cdecl;
    function indexInRange(range: NSRange; options: NSEnumerationOptions;
      passingTest: TFoundationPredicate): NSUInteger; cdecl;
    function indexesPassingTest(predicate: TFoundationPredicate)
      : NSIndexSet; cdecl;
    function indexesWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate): NSIndexSet; cdecl;
    function indexesInRange(range: NSRange; options: NSEnumerationOptions;
      passingTest: TFoundationPredicate): NSIndexSet; cdecl;
    procedure enumerateRangesUsingBlock(block: TFoundationBlock1); cdecl;
    procedure enumerateRangesWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock1); cdecl;
    procedure enumerateRangesInRange(range: NSRange;
      options: NSEnumerationOptions; usingBlock: TFoundationBlock1); cdecl;
  end;

  TNSIndexSet = class(TOCGenericImport<NSIndexSetClass, NSIndexSet>)
  end;

  PNSIndexSet = Pointer;

  NSMutableIndexSetClass = interface(NSIndexSetClass)
    ['{7B942D1A-EC2C-4D67-8E7A-4304DAAB41BD}']
  end;

  NSMutableIndexSet = interface(NSIndexSet)
    ['{7EF86838-551B-4967-AE4D-4E1135F4F99A}']
    procedure addIndexes(indexSet: NSIndexSet); cdecl;
    procedure removeIndexes(indexSet: NSIndexSet); cdecl;
    procedure removeAllIndexes; cdecl;
    procedure addIndex(value: NSUInteger); cdecl;
    procedure removeIndex(value: NSUInteger); cdecl;
    procedure addIndexesInRange(range: NSRange); cdecl;
    procedure removeIndexesInRange(range: NSRange); cdecl;
    procedure shiftIndexesStartingAtIndex(index: NSUInteger;
      by: NSInteger); cdecl;
  end;

  TNSMutableIndexSet = class(TOCGenericImport<NSMutableIndexSetClass,
    NSMutableIndexSet>)
  end;

  PNSMutableIndexSet = Pointer;

  NSOrderedCollectionDifferenceClass = interface(NSObjectClass)
    ['{6323BA12-2FA7-447D-9AF3-04B76140DD2C}']
  end;

  NSOrderedCollectionDifference = interface(NSObject)
    ['{28A1FF00-5776-4295-9B44-437C4F4A8B7D}']
    function initWithChanges(changes: NSArray): Pointer { instancetype }; cdecl;
    [MethodName
      ('initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:')
      ]
    function initWithInsertIndexesInsertedObjectsRemoveIndexesRemovedObjectsAdditionalChanges
      (inserts: NSIndexSet; insertedObjects: NSArray; removeIndexes: NSIndexSet;
      removedObjects: NSArray; additionalChanges: NSArray)
      : Pointer { instancetype }; cdecl;
    [MethodName
      ('initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:')]
    function initWithInsertIndexesInsertedObjectsRemoveIndexesRemovedObjects
      (inserts: NSIndexSet; insertedObjects: NSArray; removeIndexes: NSIndexSet;
      removedObjects: NSArray): Pointer { instancetype }; cdecl;
    function insertions: NSArray; cdecl;
    function removals: NSArray; cdecl;
    function hasChanges: Boolean; cdecl;
    function differenceByTransformingChangesWithBlock(block: TFoundationBlock2)
      : NSOrderedCollectionDifference; cdecl;
    function inverseDifference: Pointer { instancetype }; cdecl;
  end;

  TNSOrderedCollectionDifference = class
    (TOCGenericImport<NSOrderedCollectionDifferenceClass,
    NSOrderedCollectionDifference>)
  end;

  PNSOrderedCollectionDifference = Pointer;

  NSDataClass = interface(NSObjectClass)
    ['{A191CA33-1058-4077-9670-A9C02088E414}']
    { class } function data: Pointer { instancetype }; cdecl;
    { class } function dataWithBytes(bytes: Pointer; length: NSUInteger)
      : Pointer { instancetype }; cdecl;
    [MethodName('dataWithBytesNoCopy:length:')]
    { class } function dataWithBytesNoCopyLength(bytes: Pointer;
      length: NSUInteger): Pointer { instancetype }; cdecl;
    [MethodName('dataWithBytesNoCopy:length:freeWhenDone:')]
    { class } function dataWithBytesNoCopyLengthFreeWhenDone(bytes: Pointer;
      length: NSUInteger; freeWhenDone: Boolean)
      : Pointer { instancetype }; cdecl;
    [MethodName('dataWithContentsOfFile:options:error:')]
    { class } function dataWithContentsOfFileOptionsError(path: NSString;
      options: NSDataReadingOptions; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName('dataWithContentsOfURL:options:error:')]
    { class } function dataWithContentsOfURLOptionsError(url: NSURL;
      options: NSDataReadingOptions; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName('dataWithContentsOfFile:')]
    { class } function dataWithContentsOfFile(path: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('dataWithContentsOfURL:')]
    { class } function dataWithContentsOfURL(url: NSURL)
      : Pointer { instancetype }; cdecl;
    { class } function dataWithData(data: NSData)
      : Pointer { instancetype }; cdecl;
    { class } function dataWithContentsOfMappedFile(path: NSString)
      : Pointer; cdecl;
  end;

  NSData = interface(NSObject)
    ['{CC7B02CF-DC1E-4095-8671-CFCE5FD3D580}']
    function length: NSUInteger; cdecl;
    function bytes: Pointer; cdecl;
    function description: NSString; cdecl;
    [MethodName('getBytes:length:')]
    procedure getBytesLength(buffer: Pointer; length: NSUInteger); cdecl;
    [MethodName('getBytes:range:')]
    procedure getBytesRange(buffer: Pointer; range: NSRange); cdecl;
    function isEqualToData(other: NSData): Boolean; cdecl;
    function subdataWithRange(range: NSRange): NSData; cdecl;
    [MethodName('writeToFile:atomically:')]
    function writeToFileAtomically(path: NSString; atomically: Boolean)
      : Boolean; cdecl;
    [MethodName('writeToURL:atomically:')]
    function writeToURLAtomically(url: NSURL; atomically: Boolean)
      : Boolean; cdecl;
    [MethodName('writeToFile:options:error:')]
    function writeToFileOptionsError(path: NSString;
      options: NSDataWritingOptions; error: NSError): Boolean; cdecl;
    [MethodName('writeToURL:options:error:')]
    function writeToURLOptionsError(url: NSURL; options: NSDataWritingOptions;
      error: NSError): Boolean; cdecl;
    function rangeOfData(dataToFind: NSData; options: NSDataSearchOptions;
      range: NSRange): NSRange; cdecl;
    procedure enumerateByteRangesUsingBlock(block: TFoundationBlock9); cdecl;
    function initWithBytes(bytes: Pointer; length: NSUInteger)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithBytesNoCopy:length:')]
    function initWithBytesNoCopyLength(bytes: Pointer; length: NSUInteger)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithBytesNoCopy:length:freeWhenDone:')]
    function initWithBytesNoCopyLengthFreeWhenDone(bytes: Pointer;
      length: NSUInteger; freeWhenDone: Boolean)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithBytesNoCopy:length:deallocator:')]
    function initWithBytesNoCopyLengthDeallocator(bytes: Pointer;
      length: NSUInteger; deallocator: TFoundationDeallocator1)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithContentsOfFile:options:error:')]
    function initWithContentsOfFileOptionsError(path: NSString;
      options: NSDataReadingOptions; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithContentsOfURL:options:error:')]
    function initWithContentsOfURLOptionsError(url: NSURL;
      options: NSDataReadingOptions; error: NSError)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithContentsOfFile:')]
    function initWithContentsOfFile(path: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithContentsOfURL:')]
    function initWithContentsOfURL(url: NSURL): Pointer { instancetype }; cdecl;
    function initWithData(data: NSData): Pointer { instancetype }; cdecl;
    function initWithBase64EncodedString(base64String: NSString;
      options: NSDataBase64DecodingOptions): Pointer { instancetype }; cdecl;
    function base64EncodedStringWithOptions
      (options: NSDataBase64EncodingOptions): NSString; cdecl;
    function initWithBase64EncodedData(base64Data: NSData;
      options: NSDataBase64DecodingOptions): Pointer { instancetype }; cdecl;
    function base64EncodedDataWithOptions(options: NSDataBase64EncodingOptions)
      : NSData; cdecl;
    function decompressedDataUsingAlgorithm
      (algorithm: NSDataCompressionAlgorithm; error: NSError)
      : Pointer { instancetype }; cdecl;
    function compressedDataUsingAlgorithm(algorithm: NSDataCompressionAlgorithm;
      error: NSError): Pointer { instancetype }; cdecl;
    [MethodName('getBytes:')]
    procedure getBytes(buffer: Pointer); cdecl;
    function initWithContentsOfMappedFile(path: NSString): Pointer; cdecl;
    function initWithBase64Encoding(base64String: NSString): Pointer; cdecl;
    function base64Encoding: NSString; cdecl;
  end;

  TNSData = class(TOCGenericImport<NSDataClass, NSData>)
  end;

  PNSData = Pointer;

  NSURLClass = interface(NSObjectClass)
    ['{DB2F64AD-A709-4D80-B3E2-45B4C3169C15}']
    [MethodName('fileURLWithPath:isDirectory:relativeToURL:')]
    { class } function fileURLWithPathIsDirectoryRelativeToURL(path: NSString;
      isDirectory: Boolean; relativeToURL: NSURL): NSURL; cdecl;
    [MethodName('fileURLWithPath:relativeToURL:')]
    { class } function fileURLWithPathRelativeToURL(path: NSString;
      relativeToURL: NSURL): NSURL; cdecl;
    [MethodName('fileURLWithPath:isDirectory:')]
    { class } function fileURLWithPathIsDirectory(path: NSString;
      isDirectory: Boolean): NSURL; cdecl;
    [MethodName('fileURLWithPath:')]
    { class } function fileURLWithPath(path: NSString): NSURL; cdecl;
    { class } function fileURLWithFileSystemRepresentation
      (path: MarshaledAString; isDirectory: Boolean; relativeToURL: NSURL)
      : NSURL; cdecl;
    [MethodName('URLWithString:')]
    { class } function URLWithString(URLString: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('URLWithString:relativeToURL:')]
    { class } function URLWithStringRelativeToURL(URLString: NSString;
      relativeToURL: NSURL): Pointer { instancetype }; cdecl;
    { class } function URLWithDataRepresentation(data: NSData;
      relativeToURL: NSURL): NSURL; cdecl;
    { class } function absoluteURLWithDataRepresentation(data: NSData;
      relativeToURL: NSURL): NSURL; cdecl;
    { class } function URLByResolvingBookmarkData(bookmarkData: NSData;
      options: NSURLBookmarkResolutionOptions; relativeToURL: NSURL;
      bookmarkDataIsStale: PBoolean; error: NSError)
      : Pointer { instancetype }; cdecl;
    { class } function resourceValuesForKeys(keys: NSArray;
      fromBookmarkData: NSData): NSDictionary; cdecl;
    { class } function writeBookmarkData(bookmarkData: NSData; toURL: NSURL;
      options: NSURLBookmarkFileCreationOptions; error: NSError)
      : Boolean; cdecl;
    { class } function bookmarkDataWithContentsOfURL(bookmarkFileURL: NSURL;
      error: NSError): NSData; cdecl;
    { class } function URLByResolvingAliasFileAtURL(url: NSURL;
      options: NSURLBookmarkResolutionOptions; error: NSError)
      : Pointer { instancetype }; cdecl;
    { class } function fileURLWithPathComponents(components: NSArray)
      : NSURL; cdecl;
  end;

  NSURL = interface(NSObject)
    ['{7CCD1537-2C47-42DE-A17F-F3A479D0C15C}']
    function initWithScheme(scheme: NSString; host: NSString; path: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initFileURLWithPath:isDirectory:relativeToURL:')]
    function initFileURLWithPathIsDirectoryRelativeToURL(path: NSString;
      isDirectory: Boolean; relativeToURL: NSURL)
      : Pointer { instancetype }; cdecl;
    [MethodName('initFileURLWithPath:relativeToURL:')]
    function initFileURLWithPathRelativeToURL(path: NSString;
      relativeToURL: NSURL): Pointer { instancetype }; cdecl;
    [MethodName('initFileURLWithPath:isDirectory:')]
    function initFileURLWithPathIsDirectory(path: NSString;
      isDirectory: Boolean): Pointer { instancetype }; cdecl;
    [MethodName('initFileURLWithPath:')]
    function initFileURLWithPath(path: NSString)
      : Pointer { instancetype }; cdecl;
    function initFileURLWithFileSystemRepresentation(path: MarshaledAString;
      isDirectory: Boolean; relativeToURL: NSURL)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithString:')]
    function initWithString(URLString: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithString:relativeToURL:')]
    function initWithStringRelativeToURL(URLString: NSString;
      relativeToURL: NSURL): Pointer { instancetype }; cdecl;
    function initWithDataRepresentation(data: NSData; relativeToURL: NSURL)
      : Pointer { instancetype }; cdecl;
    function initAbsoluteURLWithDataRepresentation(data: NSData;
      relativeToURL: NSURL): Pointer { instancetype }; cdecl;
    function dataRepresentation: NSData; cdecl;
    function absoluteString: NSString; cdecl;
    function relativeString: NSString; cdecl;
    function baseURL: NSURL; cdecl;
    function absoluteURL: NSURL; cdecl;
    function scheme: NSString; cdecl;
    function resourceSpecifier: NSString; cdecl;
    function host: NSString; cdecl;
    function port: NSNumber; cdecl;
    function user: NSString; cdecl;
    function password: NSString; cdecl;
    function path: NSString; cdecl;
    function fragment: NSString; cdecl;
    function parameterString: NSString; cdecl;
    function query: NSString; cdecl;
    function relativePath: NSString; cdecl;
    function hasDirectoryPath: Boolean; cdecl;
    function getFileSystemRepresentation(buffer: MarshaledAString;
      maxLength: NSUInteger): Boolean; cdecl;
    function fileSystemRepresentation: MarshaledAString; cdecl;
    function isFileURL: Boolean; cdecl;
    function standardizedURL: NSURL; cdecl;
    function checkResourceIsReachableAndReturnError(error: NSError)
      : Boolean; cdecl;
    function isFileReferenceURL: Boolean; cdecl;
    function fileReferenceURL: NSURL; cdecl;
    function filePathURL: NSURL; cdecl;
    function getResourceValue(value: Pointer; forKey: NSURLResourceKey;
      error: NSError): Boolean; cdecl;
    function resourceValuesForKeys(keys: NSArray; error: NSError)
      : NSDictionary; cdecl;
    function setResourceValue(value: Pointer; forKey: NSURLResourceKey;
      error: NSError): Boolean; cdecl;
    function setResourceValues(keyedValues: NSDictionary; error: NSError)
      : Boolean; cdecl;
    procedure removeCachedResourceValueForKey(key: NSURLResourceKey); cdecl;
    procedure removeAllCachedResourceValues; cdecl;
    procedure setTemporaryResourceValue(value: Pointer;
      forKey: NSURLResourceKey); cdecl;
    function bookmarkDataWithOptions(options: NSURLBookmarkCreationOptions;
      includingResourceValuesForKeys: NSArray; relativeToURL: NSURL;
      error: NSError): NSData; cdecl;
    function initByResolvingBookmarkData(bookmarkData: NSData;
      options: NSURLBookmarkResolutionOptions; relativeToURL: NSURL;
      bookmarkDataIsStale: PBoolean; error: NSError)
      : Pointer { instancetype }; cdecl;
    function startAccessingSecurityScopedResource: Boolean; cdecl;
    procedure stopAccessingSecurityScopedResource; cdecl;
    function getPromisedItemResourceValue(value: Pointer;
      forKey: NSURLResourceKey; error: NSError): Boolean; cdecl;
    function promisedItemResourceValuesForKeys(keys: NSArray; error: NSError)
      : NSDictionary; cdecl;
    function checkPromisedItemIsReachableAndReturnError(error: NSError)
      : Boolean; cdecl;
    function pathComponents: NSArray; cdecl;
    function lastPathComponent: NSString; cdecl;
    function pathExtension: NSString; cdecl;
    [MethodName('URLByAppendingPathComponent:')]
    function URLByAppendingPathComponent(pathComponent: NSString): NSURL; cdecl;
    [MethodName('URLByAppendingPathComponent:isDirectory:')]
    function URLByAppendingPathComponentIsDirectory(pathComponent: NSString;
      isDirectory: Boolean): NSURL; cdecl;
    function URLByDeletingLastPathComponent: NSURL; cdecl;
    function URLByAppendingPathExtension(pathExtension: NSString): NSURL; cdecl;
    function URLByDeletingPathExtension: NSURL; cdecl;
    function URLByStandardizingPath: NSURL; cdecl;
    function URLByResolvingSymlinksInPath: NSURL; cdecl;
  end;

  TNSURL = class(TOCGenericImport<NSURLClass, NSURL>)
  end;

  PNSURL = Pointer;

  NSMutableArrayClass = interface(NSArrayClass)
    ['{E420C4D4-FE21-47DC-90BF-541DB60A0C22}']
    { class } function arrayWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
    { class } function arrayWithContentsOfFile(path: NSString)
      : NSMutableArray; cdecl;
    { class } function arrayWithContentsOfURL(url: NSURL)
      : NSMutableArray; cdecl;
  end;

  NSMutableArray = interface(NSArray)
    ['{CDA37A4B-E012-46CE-9470-27D078B055A6}']
    procedure addObject(anObject: ObjectType); cdecl;
    procedure insertObject(anObject: ObjectType; atIndex: NSUInteger); cdecl;
    procedure removeLastObject; cdecl;
    procedure removeObjectAtIndex(index: NSUInteger); cdecl;
    procedure replaceObjectAtIndex(index: NSUInteger;
      withObject: ObjectType); cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    procedure addObjectsFromArray(otherArray: NSArray); cdecl;
    procedure exchangeObjectAtIndex(idx1: NSUInteger;
      withObjectAtIndex: NSUInteger); cdecl;
    procedure removeAllObjects; cdecl;
    [MethodName('removeObject:inRange:')]
    procedure removeObjectInRange(anObject: ObjectType;
      inRange: NSRange); cdecl;
    [MethodName('removeObject:')]
    procedure removeObject(anObject: ObjectType); cdecl;
    [MethodName('removeObjectIdenticalTo:inRange:')]
    procedure removeObjectIdenticalToInRange(anObject: ObjectType;
      inRange: NSRange); cdecl;
    [MethodName('removeObjectIdenticalTo:')]
    procedure removeObjectIdenticalTo(anObject: ObjectType); cdecl;
    procedure removeObjectsFromIndices(indices: PNSUInteger;
      numIndices: NSUInteger); cdecl;
    procedure removeObjectsInArray(otherArray: NSArray); cdecl;
    procedure removeObjectsInRange(range: NSRange); cdecl;
    [MethodName('replaceObjectsInRange:withObjectsFromArray:range:')]
    procedure replaceObjectsInRangeWithObjectsFromArrayRange(range: NSRange;
      withObjectsFromArray: NSArray; range1: NSRange); cdecl;
    [MethodName('replaceObjectsInRange:withObjectsFromArray:')]
    procedure replaceObjectsInRangeWithObjectsFromArray(range: NSRange;
      withObjectsFromArray: NSArray); cdecl;
    procedure setArray(otherArray: NSArray); cdecl;
    procedure sortUsingFunction(compare: TFoundationComparator;
      context: Pointer); cdecl;
    procedure sortUsingSelector(comparator: SEL); cdecl;
    procedure insertObjects(objects: NSArray; atIndexes: NSIndexSet); cdecl;
    procedure removeObjectsAtIndexes(indexes: NSIndexSet); cdecl;
    procedure replaceObjectsAtIndexes(indexes: NSIndexSet;
      withObjects: NSArray); cdecl;
    procedure setObject(obj: ObjectType; atIndexedSubscript: NSUInteger); cdecl;
    procedure sortUsingComparator(cmptr: NSComparator); cdecl;
    procedure sortWithOptions(opts: NSSortOptions;
      usingComparator: NSComparator); cdecl;
    function initWithContentsOfFile(path: NSString): NSMutableArray; cdecl;
    function initWithContentsOfURL(url: NSURL): NSMutableArray; cdecl;
    procedure applyDifference(difference: NSOrderedCollectionDifference); cdecl;
    procedure sortUsingDescriptors(sortDescriptors: NSArray); cdecl;
    procedure filterUsingPredicate(predicate: NSPredicate); cdecl;
  end;

  TNSMutableArray = class(TOCGenericImport<NSMutableArrayClass, NSMutableArray>)
  end;

  PNSMutableArray = Pointer;

  NSAutoreleasePoolClass = interface(NSObjectClass)
    ['{C38DE149-E04C-4ECA-96A7-22079A1CC021}']
    { class } procedure addObject(anObject: Pointer); cdecl;
  end;

  NSAutoreleasePool = interface(NSObject)
    ['{F6D3FC15-40CB-46F1-8879-7A3CE1B5AB01}']
    procedure addObject(anObject: Pointer); cdecl;
    procedure drain; cdecl;
  end;

  TNSAutoreleasePool = class(TOCGenericImport<NSAutoreleasePoolClass,
    NSAutoreleasePool>)
  end;

  PNSAutoreleasePool = Pointer;

  NSItemProviderClass = interface(NSObjectClass)
    ['{4BC2AD01-8992-4764-A257-51C25E2A38DF}']
  end;

  NSItemProvider = interface(NSObject)
    ['{E8239608-B793-4579-9A7C-849B1C2F8614}']
    function init: Pointer { instancetype }; cdecl;
    procedure registerDataRepresentationForTypeIdentifier(typeIdentifier
      : NSString; visibility: NSItemProviderRepresentationVisibility;
      loadHandler: TFoundationLoadHandler); cdecl;
    procedure registerFileRepresentationForTypeIdentifier(typeIdentifier
      : NSString; fileOptions: NSItemProviderFileOptions;
      visibility: NSItemProviderRepresentationVisibility;
      loadHandler: TFoundationLoadHandler1); cdecl;
    function registeredTypeIdentifiers: NSArray; cdecl;
    function registeredTypeIdentifiersWithFileOptions
      (fileOptions: NSItemProviderFileOptions): NSArray; cdecl;
    function hasItemConformingToTypeIdentifier(typeIdentifier: NSString)
      : Boolean; cdecl;
    function hasRepresentationConformingToTypeIdentifier(typeIdentifier
      : NSString; fileOptions: NSItemProviderFileOptions): Boolean; cdecl;
    function loadDataRepresentationForTypeIdentifier(typeIdentifier: NSString;
      completionHandler: TFoundationForItemProviderCompletionHandler)
      : NSProgress; cdecl;
    function loadFileRepresentationForTypeIdentifier(typeIdentifier: NSString;
      completionHandler: TFoundationCompletionHandler): NSProgress; cdecl;
    function loadInPlaceFileRepresentationForTypeIdentifier(typeIdentifier
      : NSString; completionHandler: TFoundationBlock4): NSProgress; cdecl;
    procedure setSuggestedName(suggestedName: NSString); cdecl;
    function suggestedName: NSString; cdecl;
    function initWithObject(&object: Pointer): Pointer { instancetype }; cdecl;
    procedure registerObject(&object: Pointer;
      visibility: NSItemProviderRepresentationVisibility); cdecl;
    procedure registerObjectOfClass(aClass: Pointer;
      visibility: NSItemProviderRepresentationVisibility;
      loadHandler: TFoundationLoadHandler2); cdecl;
    function canLoadObjectOfClass(aClass: Pointer): Boolean; cdecl;
    function loadObjectOfClass(aClass: Pointer;
      completionHandler: TFoundationBlock5): NSProgress; cdecl;
    function initWithItem(item: Pointer; typeIdentifier: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithContentsOfURL(fileURL: NSURL)
      : Pointer { instancetype }; cdecl;
    procedure registerItemForTypeIdentifier(typeIdentifier: NSString;
      loadHandler: NSItemProviderLoadHandler); cdecl;
    procedure loadItemForTypeIdentifier(typeIdentifier: NSString;
      options: NSDictionary;
      completionHandler: NSItemProviderCompletionHandler); cdecl;
    procedure setPreviewImageHandler(previewImageHandler
      : NSItemProviderLoadHandler); cdecl;
    function previewImageHandler: NSItemProviderLoadHandler; cdecl;
    procedure loadPreviewImageWithOptions(options: NSDictionary;
      completionHandler: NSItemProviderCompletionHandler); cdecl;
  end;

  TNSItemProvider = class(TOCGenericImport<NSItemProviderClass, NSItemProvider>)
  end;

  PNSItemProvider = Pointer;

  NSProgressClass = interface(NSObjectClass)
    ['{015150A7-04EB-44CD-8C7F-EF3E20727719}']
    { class } function currentProgress: NSProgress; cdecl;
    [MethodName('progressWithTotalUnitCount:')]
    { class } function progressWithTotalUnitCount(unitCount: Int64)
      : NSProgress; cdecl;
    { class } function discreteProgressWithTotalUnitCount(unitCount: Int64)
      : NSProgress; cdecl;
    [MethodName('progressWithTotalUnitCount:parent:pendingUnitCount:')]
    { class } function progressWithTotalUnitCountParentPendingUnitCount
      (unitCount: Int64; parent: NSProgress; pendingUnitCount: Int64)
      : NSProgress; cdecl;
    { class } function addSubscriberForFileURL(url: NSURL;
      withPublishingHandler: NSProgressPublishingHandler): Pointer; cdecl;
    { class } procedure removeSubscriber(subscriber: Pointer); cdecl;
  end;

  NSProgress = interface(NSObject)
    ['{F5C0B534-0821-462D-A781-D43BCE026AE7}']
    function initWithParent(parentProgressOrNil: NSProgress;
      userInfo: NSDictionary): Pointer { instancetype }; cdecl;
    procedure becomeCurrentWithPendingUnitCount(unitCount: Int64); cdecl;
    procedure performAsCurrentWithPendingUnitCount(unitCount: Int64;
      usingBlock: TFoundationUsingBlock1); cdecl;
    procedure resignCurrent; cdecl;
    procedure addChild(child: NSProgress; withPendingUnitCount: Int64); cdecl;
    procedure setTotalUnitCount(totalUnitCount: Int64); cdecl;
    function totalUnitCount: Int64; cdecl;
    procedure setCompletedUnitCount(completedUnitCount: Int64); cdecl;
    function completedUnitCount: Int64; cdecl;
    procedure setLocalizedDescription(localizedDescription: NSString); cdecl;
    function localizedDescription: NSString; cdecl;
    procedure setLocalizedAdditionalDescription(localizedAdditionalDescription
      : NSString); cdecl;
    function localizedAdditionalDescription: NSString; cdecl;
    procedure setCancellable(cancellable: Boolean); cdecl;
    function isCancellable: Boolean; cdecl;
    procedure setPausable(pausable: Boolean); cdecl;
    function isPausable: Boolean; cdecl;
    function isCancelled: Boolean; cdecl;
    function isPaused: Boolean; cdecl;
    procedure setCancellationHandler(cancellationHandler
      : TFoundationUsingBlock1); cdecl;
    function cancellationHandler: TFoundationUsingBlock1; cdecl;
    procedure setPausingHandler(pausingHandler: TFoundationUsingBlock1); cdecl;
    function pausingHandler: TFoundationUsingBlock1; cdecl;
    procedure setResumingHandler(resumingHandler
      : TFoundationUsingBlock1); cdecl;
    function resumingHandler: TFoundationUsingBlock1; cdecl;
    procedure setUserInfoObject(objectOrNil: Pointer;
      forKey: NSProgressUserInfoKey); cdecl;
    function isIndeterminate: Boolean; cdecl;
    function fractionCompleted: Double; cdecl;
    function isFinished: Boolean; cdecl;
    procedure cancel; cdecl;
    procedure pause; cdecl;
    procedure resume; cdecl;
    function userInfo: NSDictionary; cdecl;
    procedure setKind(kind: NSProgressKind); cdecl;
    function kind: NSProgressKind; cdecl;
    procedure setEstimatedTimeRemaining(estimatedTimeRemaining
      : NSNumber); cdecl;
    function estimatedTimeRemaining: NSNumber; cdecl;
    procedure setThroughput(throughput: NSNumber); cdecl;
    function throughput: NSNumber; cdecl;
    procedure setFileOperationKind(fileOperationKind
      : NSProgressFileOperationKind); cdecl;
    function fileOperationKind: NSProgressFileOperationKind; cdecl;
    procedure setFileURL(fileURL: NSURL); cdecl;
    function fileURL: NSURL; cdecl;
    procedure setFileTotalCount(fileTotalCount: NSNumber); cdecl;
    function fileTotalCount: NSNumber; cdecl;
    procedure setFileCompletedCount(fileCompletedCount: NSNumber); cdecl;
    function fileCompletedCount: NSNumber; cdecl;
    procedure publish; cdecl;
    procedure unpublish; cdecl;
    function isOld: Boolean; cdecl;
  end;

  TNSProgress = class(TOCGenericImport<NSProgressClass, NSProgress>)
  end;

  PNSProgress = Pointer;

  NSCharacterSetClass = interface(NSObjectClass)
    ['{F65A6029-732F-49E5-A09B-15A020E48506}']
    { class } function characterSetWithRange(aRange: NSRange)
      : NSCharacterSet; cdecl;
    { class } function characterSetWithCharactersInString(aString: NSString)
      : NSCharacterSet; cdecl;
    { class } function characterSetWithBitmapRepresentation(data: NSData)
      : NSCharacterSet; cdecl;
    { class } function characterSetWithContentsOfFile(fName: NSString)
      : NSCharacterSet; cdecl;
  end;

  NSCharacterSet = interface(NSObject)
    ['{6534359E-DB70-4FF8-B2B7-CC7628ACBD07}']
    function controlCharacterSet: NSCharacterSet; cdecl;
    function whitespaceCharacterSet: NSCharacterSet; cdecl;
    function whitespaceAndNewlineCharacterSet: NSCharacterSet; cdecl;
    function decimalDigitCharacterSet: NSCharacterSet; cdecl;
    function letterCharacterSet: NSCharacterSet; cdecl;
    function lowercaseLetterCharacterSet: NSCharacterSet; cdecl;
    function uppercaseLetterCharacterSet: NSCharacterSet; cdecl;
    function nonBaseCharacterSet: NSCharacterSet; cdecl;
    function alphanumericCharacterSet: NSCharacterSet; cdecl;
    function decomposableCharacterSet: NSCharacterSet; cdecl;
    function illegalCharacterSet: NSCharacterSet; cdecl;
    function punctuationCharacterSet: NSCharacterSet; cdecl;
    function capitalizedLetterCharacterSet: NSCharacterSet; cdecl;
    function symbolCharacterSet: NSCharacterSet; cdecl;
    function newlineCharacterSet: NSCharacterSet; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function characterIsMember(aCharacter: unichar): Boolean; cdecl;
    function bitmapRepresentation: NSData; cdecl;
    function invertedSet: NSCharacterSet; cdecl;
    function longCharacterIsMember(theLongChar: UTF32Char): Boolean; cdecl;
    function isSupersetOfSet(theOtherSet: NSCharacterSet): Boolean; cdecl;
    function hasMemberInPlane(thePlane: Byte): Boolean; cdecl;
    procedure setURLUserAllowedCharacterSet(URLUserAllowedCharacterSet
      : NSCharacterSet); cdecl;
    function URLUserAllowedCharacterSet: NSCharacterSet; cdecl;
    procedure setURLPasswordAllowedCharacterSet(URLPasswordAllowedCharacterSet
      : NSCharacterSet); cdecl;
    function URLPasswordAllowedCharacterSet: NSCharacterSet; cdecl;
    procedure setURLHostAllowedCharacterSet(URLHostAllowedCharacterSet
      : NSCharacterSet); cdecl;
    function URLHostAllowedCharacterSet: NSCharacterSet; cdecl;
    procedure setURLPathAllowedCharacterSet(URLPathAllowedCharacterSet
      : NSCharacterSet); cdecl;
    function URLPathAllowedCharacterSet: NSCharacterSet; cdecl;
    procedure setURLQueryAllowedCharacterSet(URLQueryAllowedCharacterSet
      : NSCharacterSet); cdecl;
    function URLQueryAllowedCharacterSet: NSCharacterSet; cdecl;
    procedure setURLFragmentAllowedCharacterSet(URLFragmentAllowedCharacterSet
      : NSCharacterSet); cdecl;
    function URLFragmentAllowedCharacterSet: NSCharacterSet; cdecl;
  end;

  TNSCharacterSet = class(TOCGenericImport<NSCharacterSetClass, NSCharacterSet>)
  end;

  PNSCharacterSet = Pointer;

  NSErrorClass = interface(NSObjectClass)
    ['{D214FE66-829A-44FE-ADAB-EEEA1D532485}']
    { class } function errorWithDomain(domain: NSErrorDomain; code: NSInteger;
      userInfo: NSDictionary): Pointer { instancetype }; cdecl;
    { class } procedure setUserInfoValueProviderForDomain
      (errorDomain: NSErrorDomain; provider: TFoundationProvider); cdecl;
    { class } function userInfoValueProviderForDomain
      (errorDomain: NSErrorDomain): TFoundationProvider; cdecl;
  end;

  NSError = interface(NSObject)
    ['{DB268D55-DCA2-4DCE-8A67-38476A7E15F5}']
    function initWithDomain(domain: NSErrorDomain; code: NSInteger;
      userInfo: NSDictionary): Pointer { instancetype }; cdecl;
    function domain: NSErrorDomain; cdecl;
    function code: NSInteger; cdecl;
    function userInfo: NSDictionary; cdecl;
    function localizedDescription: NSString; cdecl;
    function localizedFailureReason: NSString; cdecl;
    function localizedRecoverySuggestion: NSString; cdecl;
    function localizedRecoveryOptions: NSArray; cdecl;
    function recoveryAttempter: Pointer; cdecl;
    function helpAnchor: NSString; cdecl;
    function underlyingErrors: NSArray; cdecl;
  end;

  TNSError = class(TOCGenericImport<NSErrorClass, NSError>)
  end;

  PNSError = Pointer;

  NSLocaleClass = interface(NSObjectClass)
    ['{19E998C6-1447-4AED-897A-9E9CEB1F67F1}']
    { class } function localeWithLocaleIdentifier(ident: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function componentsFromLocaleIdentifier(&string: NSString)
      : NSDictionary; cdecl;
    { class } function localeIdentifierFromComponents(dict: NSDictionary)
      : NSString; cdecl;
    { class } function canonicalLocaleIdentifierFromString(&string: NSString)
      : NSString; cdecl;
    { class } function canonicalLanguageIdentifierFromString(&string: NSString)
      : NSString; cdecl;
    { class } function localeIdentifierFromWindowsLocaleCode(lcid: LongWord)
      : NSString; cdecl;
    { class } function windowsLocaleCodeFromLocaleIdentifier(localeIdentifier
      : NSString): LongWord; cdecl;
    { class } function characterDirectionForLanguage(isoLangCode: NSString)
      : NSLocaleLanguageDirection; cdecl;
    { class } function lineDirectionForLanguage(isoLangCode: NSString)
      : NSLocaleLanguageDirection; cdecl;
  end;

  NSLocale = interface(NSObject)
    ['{7BC1E36B-43CA-4798-99D4-9E84692D6650}']
    function objectForKey(key: NSLocaleKey): Pointer; cdecl;
    function displayNameForKey(key: NSLocaleKey; value: Pointer)
      : NSString; cdecl;
    function initWithLocaleIdentifier(&string: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function localeIdentifier: NSString; cdecl;
    function localizedStringForLocaleIdentifier(localeIdentifier: NSString)
      : NSString; cdecl;
    function languageCode: NSString; cdecl;
    function localizedStringForLanguageCode(languageCode: NSString)
      : NSString; cdecl;
    function countryCode: NSString; cdecl;
    function localizedStringForCountryCode(countryCode: NSString)
      : NSString; cdecl;
    function scriptCode: NSString; cdecl;
    function localizedStringForScriptCode(scriptCode: NSString)
      : NSString; cdecl;
    function variantCode: NSString; cdecl;
    function localizedStringForVariantCode(variantCode: NSString)
      : NSString; cdecl;
    function exemplarCharacterSet: NSCharacterSet; cdecl;
    function calendarIdentifier: NSString; cdecl;
    function localizedStringForCalendarIdentifier(calendarIdentifier: NSString)
      : NSString; cdecl;
    function collationIdentifier: NSString; cdecl;
    function localizedStringForCollationIdentifier(collationIdentifier
      : NSString): NSString; cdecl;
    function usesMetricSystem: Boolean; cdecl;
    function decimalSeparator: NSString; cdecl;
    function groupingSeparator: NSString; cdecl;
    function currencySymbol: NSString; cdecl;
    function currencyCode: NSString; cdecl;
    function localizedStringForCurrencyCode(currencyCode: NSString)
      : NSString; cdecl;
    function collatorIdentifier: NSString; cdecl;
    function localizedStringForCollatorIdentifier(collatorIdentifier: NSString)
      : NSString; cdecl;
    function quotationBeginDelimiter: NSString; cdecl;
    function quotationEndDelimiter: NSString; cdecl;
    function alternateQuotationBeginDelimiter: NSString; cdecl;
    function alternateQuotationEndDelimiter: NSString; cdecl;
    procedure setAutoupdatingCurrentLocale(autoupdatingCurrentLocale
      : NSLocale); cdecl;
    function autoupdatingCurrentLocale: NSLocale; cdecl;
    procedure setCurrentLocale(currentLocale: NSLocale); cdecl;
    function currentLocale: NSLocale; cdecl;
    procedure setSystemLocale(systemLocale: NSLocale); cdecl;
    function systemLocale: NSLocale; cdecl;
    function init: Pointer { instancetype }; cdecl;
    procedure setAvailableLocaleIdentifiers(availableLocaleIdentifiers
      : NSArray); cdecl;
    function availableLocaleIdentifiers: NSArray; cdecl;
    procedure setISOLanguageCodes(ISOLanguageCodes: NSArray); cdecl;
    function ISOLanguageCodes: NSArray; cdecl;
    procedure setISOCountryCodes(ISOCountryCodes: NSArray); cdecl;
    function ISOCountryCodes: NSArray; cdecl;
    procedure setISOCurrencyCodes(ISOCurrencyCodes: NSArray); cdecl;
    function ISOCurrencyCodes: NSArray; cdecl;
    procedure setCommonISOCurrencyCodes(commonISOCurrencyCodes: NSArray); cdecl;
    function commonISOCurrencyCodes: NSArray; cdecl;
    procedure setPreferredLanguages(preferredLanguages: NSArray); cdecl;
    function preferredLanguages: NSArray; cdecl;
  end;

  TNSLocale = class(TOCGenericImport<NSLocaleClass, NSLocale>)
  end;

  PNSLocale = Pointer;

  NSMutableStringClass = interface(NSStringClass)
    ['{C6C47FA5-8033-4171-B402-7A345DF5135F}']
    { class } function stringWithCapacity(capacity: NSUInteger)
      : NSMutableString; cdecl;
  end;

  NSMutableString = interface(NSString)
    ['{FEE08F10-94CE-4010-865A-F2F87F6EA2E2}']
    procedure replaceCharactersInRange(range: NSRange;
      withString: NSString); cdecl;
    procedure insertString(aString: NSString; atIndex: NSUInteger); cdecl;
    procedure deleteCharactersInRange(range: NSRange); cdecl;
    procedure appendString(aString: NSString); cdecl;
    procedure appendFormat(format: NSString); cdecl;
    procedure setString(aString: NSString); cdecl;
    function replaceOccurrencesOfString(target: NSString; withString: NSString;
      options: NSStringCompareOptions; range: NSRange): NSUInteger; cdecl;
    function applyTransform(transform: NSStringTransform; reverse: Boolean;
      range: NSRange; updatedRange: NSRangePointer): Boolean; cdecl;
    function initWithCapacity(capacity: NSUInteger): NSMutableString; cdecl;
  end;

  TNSMutableString = class(TOCGenericImport<NSMutableStringClass,
    NSMutableString>)
  end;

  PNSMutableString = Pointer;

  NSSimpleCStringClass = interface(NSStringClass)
    ['{D08E1107-F0BB-445E-BE3D-D16FB7749672}']
  end;

  NSSimpleCString = interface(NSString)
    ['{CBE4CD49-D01A-4837-9031-01DE4EB7DA9A}']
  end;

  TNSSimpleCString = class(TOCGenericImport<NSSimpleCStringClass,
    NSSimpleCString>)
  end;

  PNSSimpleCString = Pointer;

  NSConstantStringClass = interface(NSSimpleCStringClass)
    ['{783E5C09-52D7-42D3-B24F-7E4B8B16B4AB}']
  end;

  NSConstantString = interface(NSSimpleCString)
    ['{82DCE0F4-F235-4CAB-9FA2-CA51472D10C5}']
  end;

  TNSConstantString = class(TOCGenericImport<NSConstantStringClass,
    NSConstantString>)
  end;

  PNSConstantString = Pointer;

  NSSetClass = interface(NSObjectClass)
    ['{72E77DCD-5940-455A-BA3B-9766C93E4350}']
    { class } function &set: Pointer { instancetype }; cdecl;
    { class } function setWithObject(&object: ObjectType)
      : Pointer { instancetype }; cdecl;
    [MethodName('setWithObjects:count:')]
    { class } function setWithObjectsCount(objects: ObjectType;
      count: NSUInteger): Pointer { instancetype }; cdecl;
    [MethodName('setWithObjects:')]
    { class } function setWithObjects(firstObj: ObjectType)
      : Pointer { instancetype }; cdecl;
    { class } function setWithSet(&set: NSSet): Pointer { instancetype }; cdecl;
    { class } function setWithArray(&array: NSArray)
      : Pointer { instancetype }; cdecl;
  end;

  NSSet = interface(NSObject)
    ['{56CD7D4A-44F8-4349-9677-614816B817AE}']
    function count: NSUInteger; cdecl;
    function member(&object: ObjectType): ObjectType; cdecl;
    function objectEnumerator: NSEnumerator; cdecl;
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithObjects:count:')]
    function initWithObjectsCount(objects: ObjectType; count: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function allObjects: NSArray; cdecl;
    function anyObject: ObjectType; cdecl;
    function containsObject(anObject: ObjectType): Boolean; cdecl;
    function description: NSString; cdecl;
    function descriptionWithLocale(locale: Pointer): NSString; cdecl;
    function intersectsSet(otherSet: NSSet): Boolean; cdecl;
    function isEqualToSet(otherSet: NSSet): Boolean; cdecl;
    function isSubsetOfSet(otherSet: NSSet): Boolean; cdecl;
    [MethodName('makeObjectsPerformSelector:')]
    procedure makeObjectsPerformSelector(aSelector: SEL); cdecl;
    [MethodName('makeObjectsPerformSelector:withObject:')]
    procedure makeObjectsPerformSelectorWithObject(aSelector: SEL;
      withObject: Pointer); cdecl;
    function setByAddingObject(anObject: ObjectType): NSSet; cdecl;
    function setByAddingObjectsFromSet(other: NSSet): NSSet; cdecl;
    function setByAddingObjectsFromArray(other: NSArray): NSSet; cdecl;
    procedure enumerateObjectsUsingBlock(block: TFoundationBlock8); cdecl;
    procedure enumerateObjectsWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock8); cdecl;
    function objectsPassingTest(predicate: TFoundationPredicate3): NSSet; cdecl;
    function objectsWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate3): NSSet; cdecl;
    [MethodName('initWithObjects:')]
    function initWithObjects(firstObj: ObjectType)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithSet:')]
    function initWithSet(&set: NSSet): Pointer { instancetype }; cdecl;
    [MethodName('initWithSet:copyItems:')]
    function initWithSetCopyItems(&set: NSSet; copyItems: Boolean)
      : Pointer { instancetype }; cdecl;
    function initWithArray(&array: NSArray): Pointer { instancetype }; cdecl;
    function valueForKey(key: NSString): Pointer; cdecl;
    procedure setValue(value: Pointer; forKey: NSString); cdecl;
    procedure addObserver(observer: NSObject; forKeyPath: NSString;
      options: NSKeyValueObservingOptions; context: Pointer); cdecl;
    [MethodName('removeObserver:forKeyPath:context:')]
    procedure removeObserverForKeyPathContext(observer: NSObject;
      forKeyPath: NSString; context: Pointer); cdecl;
    [MethodName('removeObserver:forKeyPath:')]
    procedure removeObserverForKeyPath(observer: NSObject;
      forKeyPath: NSString); cdecl;
    function sortedArrayUsingDescriptors(sortDescriptors: NSArray)
      : NSArray; cdecl;
    function filteredSetUsingPredicate(predicate: NSPredicate): NSSet; cdecl;
  end;

  TNSSet = class(TOCGenericImport<NSSetClass, NSSet>)
  end;

  PNSSet = Pointer;

  NSMutableDictionaryClass = interface(NSDictionaryClass)
    ['{F09ACE4A-4CB3-4E67-B444-E5909649F6AB}']
    { class } function dictionaryWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
    { class } function dictionaryWithContentsOfFile(path: NSString)
      : NSMutableDictionary; cdecl;
    { class } function dictionaryWithContentsOfURL(url: NSURL)
      : NSMutableDictionary; cdecl;
    { class } function dictionaryWithSharedKeySet(keyset: Pointer)
      : NSMutableDictionary; cdecl;
  end;

  NSMutableDictionary = interface(NSDictionary)
    ['{2AB2E151-CC84-4DF1-8694-83F775C7911F}']
    procedure removeObjectForKey(aKey: KeyType); cdecl;
    [MethodName('setObject:forKey:')]
    procedure setObjectForKey(anObject: ObjectType; forKey: Pointer); cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    procedure addEntriesFromDictionary(otherDictionary: NSDictionary); cdecl;
    procedure removeAllObjects; cdecl;
    procedure removeObjectsForKeys(keyArray: NSArray); cdecl;
    procedure setDictionary(otherDictionary: NSDictionary); cdecl;
    [MethodName('setObject:forKeyedSubscript:')]
    procedure setObjectForKeyedSubscript(obj: ObjectType;
      forKeyedSubscript: Pointer); cdecl;
    function initWithContentsOfFile(path: NSString): NSMutableDictionary; cdecl;
    function initWithContentsOfURL(url: NSURL): NSMutableDictionary; cdecl;
    procedure setValue(value: ObjectType; forKey: NSString); cdecl;
  end;

  TNSMutableDictionary = class(TOCGenericImport<NSMutableDictionaryClass,
    NSMutableDictionary>)
  end;

  PNSMutableDictionary = Pointer;

  NSMutableSetClass = interface(NSSetClass)
    ['{9268619F-EB97-477D-900F-77A71D785EC3}']
    { class } function setWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
  end;

  NSMutableSet = interface(NSSet)
    ['{23855775-3618-4F79-BFF6-115EF736F7B4}']
    procedure addObject(&object: ObjectType); cdecl;
    procedure removeObject(&object: ObjectType); cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
    procedure addObjectsFromArray(&array: NSArray); cdecl;
    procedure intersectSet(otherSet: NSSet); cdecl;
    procedure minusSet(otherSet: NSSet); cdecl;
    procedure removeAllObjects; cdecl;
    procedure unionSet(otherSet: NSSet); cdecl;
    procedure setSet(otherSet: NSSet); cdecl;
    procedure filterUsingPredicate(predicate: NSPredicate); cdecl;
  end;

  TNSMutableSet = class(TOCGenericImport<NSMutableSetClass, NSMutableSet>)
  end;

  PNSMutableSet = Pointer;

  NSCountedSetClass = interface(NSMutableSetClass)
    ['{AFF5ACCC-BC25-4569-9E45-FAF7F8F01E83}']
  end;

  NSCountedSet = interface(NSMutableSet)
    ['{E5B59C88-5A4B-48A6-BC81-3BDFB4663BA6}']
    function initWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithArray(&array: NSArray): Pointer { instancetype }; cdecl;
    function initWithSet(&set: NSSet): Pointer { instancetype }; cdecl;
    function countForObject(&object: ObjectType): NSUInteger; cdecl;
    function objectEnumerator: NSEnumerator; cdecl;
    procedure addObject(&object: ObjectType); cdecl;
    procedure removeObject(&object: ObjectType); cdecl;
  end;

  TNSCountedSet = class(TOCGenericImport<NSCountedSetClass, NSCountedSet>)
  end;

  PNSCountedSet = Pointer;

  NSUUIDClass = interface(NSObjectClass)
    ['{40FB6B8A-00F1-4295-A9E2-669CC2BBD538}']
    { class } function UUID: Pointer { instancetype }; cdecl;
  end;

  NSUUID = interface(NSObject)
    ['{49D4EB1B-CEF2-4498-A552-9DD83F6B6FA0}']
    function init: Pointer { instancetype }; cdecl;
    function initWithUUIDString(&string: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithUUIDBytes(bytes: Byte): Pointer { instancetype }; cdecl;
    procedure getUUIDBytes(UUID: Byte); cdecl;
    function compare(otherUUID: NSUUID): NSComparisonResult; cdecl;
    function UUIDString: NSString; cdecl;
  end;

  TNSUUID = class(TOCGenericImport<NSUUIDClass, NSUUID>)
  end;

  PNSUUID = Pointer;

  NSXPCConnectionClass = interface(NSObjectClass)
    ['{42BF3FEB-B281-49EA-BD35-3E469B8534C5}']
    { class } function currentConnection: NSXPCConnection; cdecl;
  end;

  NSXPCConnection = interface(NSObject)
    ['{6BFBCA91-1576-45E9-8A92-103F37E07789}']
    function initWithServiceName(serviceName: NSString)
      : Pointer { instancetype }; cdecl;
    function serviceName: NSString; cdecl;
    function initWithMachServiceName(name: NSString;
      options: NSXPCConnectionOptions): Pointer { instancetype }; cdecl;
    function initWithListenerEndpoint(endpoint: NSXPCListenerEndpoint)
      : Pointer { instancetype }; cdecl;
    function endpoint: NSXPCListenerEndpoint; cdecl;
    procedure setExportedInterface(exportedInterface: NSXPCInterface); cdecl;
    function exportedInterface: NSXPCInterface; cdecl;
    procedure setExportedObject(exportedObject: Pointer); cdecl;
    function exportedObject: Pointer; cdecl;
    procedure setRemoteObjectInterface(remoteObjectInterface
      : NSXPCInterface); cdecl;
    function remoteObjectInterface: NSXPCInterface; cdecl;
    function remoteObjectProxy: Pointer; cdecl;
    function remoteObjectProxyWithErrorHandler
      (handler: TFoundationCompletionHandler1): Pointer; cdecl;
    function synchronousRemoteObjectProxyWithErrorHandler
      (handler: TFoundationCompletionHandler1): Pointer; cdecl;
    procedure setInterruptionHandler(interruptionHandler
      : TFoundationUsingBlock1); cdecl;
    function interruptionHandler: TFoundationUsingBlock1; cdecl;
    procedure setInvalidationHandler(invalidationHandler
      : TFoundationUsingBlock1); cdecl;
    function invalidationHandler: TFoundationUsingBlock1; cdecl;
    procedure resume; cdecl;
    procedure suspend; cdecl;
    procedure activate; cdecl;
    procedure invalidate; cdecl;
    function auditSessionIdentifier: au_asid_t; cdecl;
    function processIdentifier: Pointer { pid_t }; cdecl;
    function effectiveUserIdentifier: Pointer { uid_t }; cdecl;
    function effectiveGroupIdentifier: Pointer { gid_t }; cdecl;
    procedure scheduleSendBarrierBlock(block: TFoundationUsingBlock1); cdecl;
    procedure setCodeSigningRequirement(requirement: NSString); cdecl;
  end;

  TNSXPCConnection = class(TOCGenericImport<NSXPCConnectionClass,
    NSXPCConnection>)
  end;

  PNSXPCConnection = Pointer;

  NSLockClass = interface(NSObjectClass)
    ['{17C5379D-CE06-4C66-AF97-8E2FD6087845}']
  end;

  NSLock = interface(NSObject)
    ['{B37CA9FB-B3CC-4D1B-8D2A-77EE508E4D6C}']
    function tryLock: Boolean; cdecl;
    function lockBeforeDate(limit: NSDate): Boolean; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TNSLock = class(TOCGenericImport<NSLockClass, NSLock>)
  end;

  PNSLock = Pointer;

  NSOperationQueueClass = interface(NSObjectClass)
    ['{8F6D9B85-A67D-4896-B0FE-E84DDD830111}']
  end;

  NSOperationQueue = interface(NSObject)
    ['{365C0904-CEFC-4993-BE9E-DC8349DDAE59}']
    function progress: NSProgress; cdecl;
    procedure addOperation(op: NSOperation); cdecl;
    procedure addOperations(ops: NSArray; waitUntilFinished: Boolean); cdecl;
    procedure addOperationWithBlock(block: TFoundationUsingBlock1); cdecl;
    procedure addBarrierBlock(barrier: TFoundationUsingBlock1); cdecl;
    procedure setMaxConcurrentOperationCount(maxConcurrentOperationCount
      : NSInteger); cdecl;
    function maxConcurrentOperationCount: NSInteger; cdecl;
    procedure setSuspended(suspended: Boolean); cdecl;
    function isSuspended: Boolean; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setQualityOfService(qualityOfService: NSQualityOfService); cdecl;
    function qualityOfService: NSQualityOfService; cdecl;
    procedure setUnderlyingQueue(underlyingQueue: dispatch_queue_t); cdecl;
    function underlyingQueue: dispatch_queue_t; cdecl;
    procedure cancelAllOperations; cdecl;
    procedure waitUntilAllOperationsAreFinished; cdecl;
    procedure setCurrentQueue(currentQueue: NSOperationQueue); cdecl;
    function currentQueue: NSOperationQueue; cdecl;
    procedure setMainQueue(mainQueue: NSOperationQueue); cdecl;
    function mainQueue: NSOperationQueue; cdecl;
    function operations: NSArray; cdecl;
    function operationCount: NSUInteger; cdecl;
  end;

  TNSOperationQueue = class(TOCGenericImport<NSOperationQueueClass,
    NSOperationQueue>)
  end;

  PNSOperationQueue = Pointer;

  NSNotificationClass = interface(NSObjectClass)
    ['{BC52D15D-CFB2-499B-A112-A114B0CF54B9}']
    [MethodName('notificationWithName:object:')]
    { class } function notificationWithNameObject(aName: NSNotificationName;
      &object: Pointer): Pointer { instancetype }; cdecl;
    [MethodName('notificationWithName:object:userInfo:')]
    { class } function notificationWithNameObjectUserInfo
      (aName: NSNotificationName; &object: Pointer; userInfo: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  NSNotification = interface(NSObject)
    ['{368DEB48-2854-461D-854C-044604C86379}']
    function name: NSNotificationName; cdecl;
    function &object: Pointer; cdecl;
    function userInfo: NSDictionary; cdecl;
    function initWithName(name: NSNotificationName; &object: Pointer;
      userInfo: NSDictionary): Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function init: Pointer { instancetype }; cdecl;
  end;

  TNSNotification = class(TOCGenericImport<NSNotificationClass, NSNotification>)
  end;

  PNSNotification = Pointer;

  NSNotificationCenterClass = interface(NSObjectClass)
    ['{19902CEF-F4FA-4B6E-AA1E-68F0AA6322CA}']
  end;

  NSNotificationCenter = interface(NSObject)
    ['{DBBCE759-16D8-43F8-A921-CF402DD20963}']
    procedure setDefaultCenter(defaultCenter: NSNotificationCenter); cdecl;
    function defaultCenter: NSNotificationCenter; cdecl;
    procedure addObserver(observer: Pointer; selector: SEL;
      name: NSNotificationName; &object: Pointer); cdecl;
    procedure postNotification(notification: NSNotification); cdecl;
    [MethodName('postNotificationName:object:')]
    procedure postNotificationNameObject(aName: NSNotificationName;
      &object: Pointer); cdecl;
    [MethodName('postNotificationName:object:userInfo:')]
    procedure postNotificationNameObjectUserInfo(aName: NSNotificationName;
      &object: Pointer; userInfo: NSDictionary); cdecl;
    [MethodName('removeObserver:')]
    procedure removeObserver(observer: Pointer); cdecl;
    [MethodName('removeObserver:name:object:')]
    procedure removeObserverNameObject(observer: Pointer;
      name: NSNotificationName; &object: Pointer); cdecl;
    function addObserverForName(name: NSNotificationName; &object: Pointer;
      queue: NSOperationQueue; usingBlock: TFoundationUsingBlock2)
      : Pointer; cdecl;
  end;

  TNSNotificationCenter = class(TOCGenericImport<NSNotificationCenterClass,
    NSNotificationCenter>)
  end;

  PNSNotificationCenter = Pointer;

  NSBundleClass = interface(NSObjectClass)
    ['{27B50731-CF35-4486-A57C-9ACBBBDE212C}']
    { class } function bundleWithPath(path: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function bundleWithURL(url: NSURL)
      : Pointer { instancetype }; cdecl;
    { class } function bundleForClass(aClass: Pointer): NSBundle; cdecl;
    { class } function bundleWithIdentifier(identifier: NSString)
      : NSBundle; cdecl;
    { class } function URLForResource(name: NSString; withExtension: NSString;
      subdirectory: NSString; inBundleWithURL: NSURL): NSURL; cdecl;
    { class } function URLsForResourcesWithExtension(ext: NSString;
      subdirectory: NSString; inBundleWithURL: NSURL): NSArray; cdecl;
    { class } function pathForResource(name: NSString; ofType: NSString;
      inDirectory: NSString): NSString; cdecl;
    { class } function pathsForResourcesOfType(ext: NSString;
      inDirectory: NSString): NSArray; cdecl;
    [MethodName('preferredLocalizationsFromArray:')]
    { class } function preferredLocalizationsFromArray(localizationsArray
      : NSArray): NSArray; cdecl;
    [MethodName('preferredLocalizationsFromArray:forPreferences:')]
    { class } function preferredLocalizationsFromArrayForPreferences
      (localizationsArray: NSArray; forPreferences: NSArray): NSArray; cdecl;
  end;

  NSBundle = interface(NSObject)
    ['{92A8A8D5-C384-4B5D-ADBF-EB927538B19F}']
    procedure setMainBundle(mainBundle: NSBundle); cdecl;
    function mainBundle: NSBundle; cdecl;
    function initWithPath(path: NSString): Pointer { instancetype }; cdecl;
    function initWithURL(url: NSURL): Pointer { instancetype }; cdecl;
    procedure setAllBundles(allBundles: NSArray); cdecl;
    function allBundles: NSArray; cdecl;
    procedure setAllFrameworks(allFrameworks: NSArray); cdecl;
    function allFrameworks: NSArray; cdecl;
    function load: Boolean; cdecl;
    function isLoaded: Boolean; cdecl;
    function unload: Boolean; cdecl;
    function preflightAndReturnError(error: NSError): Boolean; cdecl;
    function loadAndReturnError(error: NSError): Boolean; cdecl;
    function bundleURL: NSURL; cdecl;
    function resourceURL: NSURL; cdecl;
    function executableURL: NSURL; cdecl;
    function URLForAuxiliaryExecutable(executableName: NSString): NSURL; cdecl;
    function privateFrameworksURL: NSURL; cdecl;
    function sharedFrameworksURL: NSURL; cdecl;
    function sharedSupportURL: NSURL; cdecl;
    function builtInPlugInsURL: NSURL; cdecl;
    function appStoreReceiptURL: NSURL; cdecl;
    function bundlePath: NSString; cdecl;
    function resourcePath: NSString; cdecl;
    function executablePath: NSString; cdecl;
    function pathForAuxiliaryExecutable(executableName: NSString)
      : NSString; cdecl;
    function privateFrameworksPath: NSString; cdecl;
    function sharedFrameworksPath: NSString; cdecl;
    function sharedSupportPath: NSString; cdecl;
    function builtInPlugInsPath: NSString; cdecl;
    [MethodName('URLForResource:withExtension:')]
    function URLForResourceWithExtension(name: NSString;
      withExtension: NSString): NSURL; cdecl;
    [MethodName('URLForResource:withExtension:subdirectory:')]
    function URLForResourceWithExtensionSubdirectory(name: NSString;
      withExtension: NSString; subdirectory: NSString): NSURL; cdecl;
    [MethodName('URLForResource:withExtension:subdirectory:localization:')]
    function URLForResourceWithExtensionSubdirectoryLocalization(name: NSString;
      withExtension: NSString; subdirectory: NSString; localization: NSString)
      : NSURL; cdecl;
    [MethodName('URLsForResourcesWithExtension:subdirectory:')]
    function URLsForResourcesWithExtensionSubdirectory(ext: NSString;
      subdirectory: NSString): NSArray; cdecl;
    [MethodName('URLsForResourcesWithExtension:subdirectory:localization:')]
    function URLsForResourcesWithExtensionSubdirectoryLocalization
      (ext: NSString; subdirectory: NSString; localization: NSString)
      : NSArray; cdecl;
    [MethodName('pathForResource:ofType:')]
    function pathForResourceOfType(name: NSString; ofType: NSString)
      : NSString; cdecl;
    [MethodName('pathForResource:ofType:inDirectory:')]
    function pathForResourceOfTypeInDirectory(name: NSString; ofType: NSString;
      inDirectory: NSString): NSString; cdecl;
    [MethodName('pathForResource:ofType:inDirectory:forLocalization:')]
    function pathForResourceOfTypeInDirectoryForLocalization(name: NSString;
      ofType: NSString; inDirectory: NSString; forLocalization: NSString)
      : NSString; cdecl;
    [MethodName('pathsForResourcesOfType:inDirectory:')]
    function pathsForResourcesOfTypeInDirectory(ext: NSString;
      inDirectory: NSString): NSArray; cdecl;
    [MethodName('pathsForResourcesOfType:inDirectory:forLocalization:')]
    function pathsForResourcesOfTypeInDirectoryForLocalization(ext: NSString;
      inDirectory: NSString; forLocalization: NSString): NSArray; cdecl;
    function localizedStringForKey(key: NSString; value: NSString;
      table: NSString): NSString; cdecl;
    function localizedAttributedStringForKey(key: NSString; value: NSString;
      table: NSString): NSAttributedString; cdecl;
    function bundleIdentifier: NSString; cdecl;
    function infoDictionary: NSDictionary; cdecl;
    function localizedInfoDictionary: NSDictionary; cdecl;
    function objectForInfoDictionaryKey(key: NSString): Pointer; cdecl;
    function classNamed(className: NSString): Pointer; cdecl;
    function principalClass: Pointer; cdecl;
    function preferredLocalizations: NSArray; cdecl;
    function localizations: NSArray; cdecl;
    function developmentLocalization: NSString; cdecl;
    function executableArchitectures: NSArray; cdecl;
    procedure setPreservationPriority(priority: Double; forTags: NSSet); cdecl;
    function preservationPriorityForTag(tag: NSString): Double; cdecl;
  end;

  TNSBundle = class(TOCGenericImport<NSBundleClass, NSBundle>)
  end;

  PNSBundle = Pointer;

  NSBundleResourceRequestClass = interface(NSObjectClass)
    ['{BD19A8C7-225D-4DCD-91ED-4AA13A8F4B9F}']
  end;

  NSBundleResourceRequest = interface(NSObject)
    ['{32C263CF-5B22-4978-8629-FD08725BF98F}']
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithTags:')]
    function initWithTags(tags: NSSet): Pointer { instancetype }; cdecl;
    [MethodName('initWithTags:bundle:')]
    function initWithTagsBundle(tags: NSSet; bundle: NSBundle)
      : Pointer { instancetype }; cdecl;
    procedure setLoadingPriority(loadingPriority: Double); cdecl;
    function loadingPriority: Double; cdecl;
    function tags: NSSet; cdecl;
    function bundle: NSBundle; cdecl;
    procedure beginAccessingResourcesWithCompletionHandler(completionHandler
      : TFoundationCompletionHandler1); cdecl;
    procedure conditionallyBeginAccessingResourcesWithCompletionHandler
      (completionHandler: TFoundationCompletionHandler2); cdecl;
    procedure endAccessingResources; cdecl;
    function progress: NSProgress; cdecl;
  end;

  TNSBundleResourceRequest = class
    (TOCGenericImport<NSBundleResourceRequestClass, NSBundleResourceRequest>)
  end;

  PNSBundleResourceRequest = Pointer;

  NSDateClass = interface(NSObjectClass)
    ['{07CA78DC-F126-4B4F-A734-070AED404DF4}']
    { class } function date: Pointer { instancetype }; cdecl;
    { class } function dateWithTimeIntervalSinceNow(secs: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
    { class } function dateWithTimeIntervalSinceReferenceDate
      (ti: NSTimeInterval): Pointer { instancetype }; cdecl;
    { class } function dateWithTimeIntervalSince1970(secs: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
    { class } function dateWithTimeInterval(secsToBeAdded: NSTimeInterval;
      sinceDate: NSDate): Pointer { instancetype }; cdecl;
  end;

  NSDate = interface(NSObject)
    ['{257E89E2-FBD2-4158-9BAA-4F8CD57383B0}']
    function timeIntervalSinceReferenceDate: NSTimeInterval; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithTimeIntervalSinceReferenceDate(ti: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function timeIntervalSinceDate(anotherDate: NSDate): NSTimeInterval; cdecl;
    function timeIntervalSinceNow: NSTimeInterval; cdecl;
    function timeIntervalSince1970: NSTimeInterval; cdecl;
    function addTimeInterval(seconds: NSTimeInterval): Pointer; cdecl;
    function dateByAddingTimeInterval(ti: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
    function earlierDate(anotherDate: NSDate): NSDate; cdecl;
    function laterDate(anotherDate: NSDate): NSDate; cdecl;
    function compare(other: NSDate): NSComparisonResult; cdecl;
    function isEqualToDate(otherDate: NSDate): Boolean; cdecl;
    function description: NSString; cdecl;
    function descriptionWithLocale(locale: Pointer): NSString; cdecl;
    procedure setTimeIntervalSinceReferenceDate(timeIntervalSinceReferenceDate
      : NSTimeInterval); cdecl;
    procedure setDistantFuture(distantFuture: NSDate); cdecl;
    function distantFuture: NSDate; cdecl;
    procedure setDistantPast(distantPast: NSDate); cdecl;
    function distantPast: NSDate; cdecl;
    procedure setNow(now: NSDate); cdecl;
    function now: NSDate; cdecl;
    function initWithTimeIntervalSinceNow(secs: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
    function initWithTimeIntervalSince1970(secs: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
    function initWithTimeInterval(secsToBeAdded: NSTimeInterval;
      sinceDate: NSDate): Pointer { instancetype }; cdecl;
  end;

  TNSDate = class(TOCGenericImport<NSDateClass, NSDate>)
  end;

  PNSDate = Pointer;

  NSDateComponentsClass = interface(NSObjectClass)
    ['{8FA3C4C0-0EB8-48A9-B356-0892D797253F}']
  end;

  NSDateComponents = interface(NSObject)
    ['{34FF63E4-937F-4A1B-BD83-CA95E011D21D}']
    procedure setCalendar(calendar: NSCalendar); cdecl;
    function calendar: NSCalendar; cdecl;
    procedure setTimeZone(timeZone: NSTimeZone); cdecl;
    function timeZone: NSTimeZone; cdecl;
    procedure setEra(era: NSInteger); cdecl;
    function era: NSInteger; cdecl;
    procedure setYear(year: NSInteger); cdecl;
    function year: NSInteger; cdecl;
    procedure setMonth(month: NSInteger); cdecl;
    function month: NSInteger; cdecl;
    procedure setDay(day: NSInteger); cdecl;
    function day: NSInteger; cdecl;
    procedure setHour(hour: NSInteger); cdecl;
    function hour: NSInteger; cdecl;
    procedure setMinute(minute: NSInteger); cdecl;
    function minute: NSInteger; cdecl;
    procedure setSecond(second: NSInteger); cdecl;
    function second: NSInteger; cdecl;
    procedure setNanosecond(nanosecond: NSInteger); cdecl;
    function nanosecond: NSInteger; cdecl;
    procedure setWeekday(weekday: NSInteger); cdecl;
    function weekday: NSInteger; cdecl;
    procedure setWeekdayOrdinal(weekdayOrdinal: NSInteger); cdecl;
    function weekdayOrdinal: NSInteger; cdecl;
    procedure setQuarter(quarter: NSInteger); cdecl;
    function quarter: NSInteger; cdecl;
    procedure setWeekOfMonth(weekOfMonth: NSInteger); cdecl;
    function weekOfMonth: NSInteger; cdecl;
    procedure setWeekOfYear(weekOfYear: NSInteger); cdecl;
    function weekOfYear: NSInteger; cdecl;
    procedure setYearForWeekOfYear(yearForWeekOfYear: NSInteger); cdecl;
    function yearForWeekOfYear: NSInteger; cdecl;
    procedure setLeapMonth(leapMonth: Boolean); cdecl;
    function isLeapMonth: Boolean; cdecl;
    function date: NSDate; cdecl;
    function week: NSInteger; cdecl;
    procedure setWeek(v: NSInteger); cdecl;
    procedure setValue(value: NSInteger; forComponent: NSCalendarUnit); cdecl;
    function valueForComponent(&unit: NSCalendarUnit): NSInteger; cdecl;
    function isValidDate: Boolean; cdecl;
    function isValidDateInCalendar(calendar: NSCalendar): Boolean; cdecl;
  end;

  TNSDateComponents = class(TOCGenericImport<NSDateComponentsClass,
    NSDateComponents>)
  end;

  PNSDateComponents = Pointer;

  NSTimeZoneClass = interface(NSObjectClass)
    ['{9DD167CD-AB2D-4899-BFAB-4E3EB2CC34C3}']
    { class } procedure resetSystemTimeZone; cdecl;
    { class } function abbreviationDictionary: NSDictionary; cdecl;
    [MethodName('timeZoneWithName:')]
    { class } function timeZoneWithName(tzName: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('timeZoneWithName:data:')]
    { class } function timeZoneWithNameData(tzName: NSString; data: NSData)
      : Pointer { instancetype }; cdecl;
    { class } function timeZoneForSecondsFromGMT(seconds: NSInteger)
      : Pointer { instancetype }; cdecl;
    { class } function timeZoneWithAbbreviation(abbreviation: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  NSTimeZone = interface(NSObject)
    ['{BA19EBE2-859D-4BDB-8A3F-1B3D61B053FA}']
    function name: NSString; cdecl;
    function data: NSData; cdecl;
    function secondsFromGMTForDate(aDate: NSDate): NSInteger; cdecl;
    function abbreviationForDate(aDate: NSDate): NSString; cdecl;
    function isDaylightSavingTimeForDate(aDate: NSDate): Boolean; cdecl;
    function daylightSavingTimeOffsetForDate(aDate: NSDate)
      : NSTimeInterval; cdecl;
    function nextDaylightSavingTimeTransitionAfterDate(aDate: NSDate)
      : NSDate; cdecl;
    procedure setSystemTimeZone(systemTimeZone: NSTimeZone); cdecl;
    function systemTimeZone: NSTimeZone; cdecl;
    procedure setDefaultTimeZone(defaultTimeZone: NSTimeZone); cdecl;
    function defaultTimeZone: NSTimeZone; cdecl;
    procedure setLocalTimeZone(localTimeZone: NSTimeZone); cdecl;
    function localTimeZone: NSTimeZone; cdecl;
    procedure setKnownTimeZoneNames(knownTimeZoneNames: NSArray); cdecl;
    function knownTimeZoneNames: NSArray; cdecl;
    procedure setAbbreviationDictionary(abbreviationDictionary
      : NSDictionary); cdecl;
    function abbreviationDictionary: NSDictionary; cdecl;
    procedure setTimeZoneDataVersion(timeZoneDataVersion: NSString); cdecl;
    function timeZoneDataVersion: NSString; cdecl;
    function secondsFromGMT: NSInteger; cdecl;
    function abbreviation: NSString; cdecl;
    function isDaylightSavingTime: Boolean; cdecl;
    function daylightSavingTimeOffset: NSTimeInterval; cdecl;
    function nextDaylightSavingTimeTransition: NSDate; cdecl;
    function description: NSString; cdecl;
    function isEqualToTimeZone(aTimeZone: NSTimeZone): Boolean; cdecl;
    function localizedName(style: NSTimeZoneNameStyle; locale: NSLocale)
      : NSString; cdecl;
    [MethodName('initWithName:')]
    function initWithName(tzName: NSString): Pointer { instancetype }; cdecl;
    [MethodName('initWithName:data:')]
    function initWithNameData(tzName: NSString; data: NSData)
      : Pointer { instancetype }; cdecl;
  end;

  TNSTimeZone = class(TOCGenericImport<NSTimeZoneClass, NSTimeZone>)
  end;

  PNSTimeZone = Pointer;

  NSCalendarClass = interface(NSObjectClass)
    ['{7AF211B9-D785-4318-B73B-80F14D91E158}']
    { class } function calendarWithIdentifier(calendarIdentifierConstant
      : NSCalendarIdentifier): NSCalendar; cdecl;
  end;

  NSCalendar = interface(NSObject)
    ['{547DF366-BDB8-487A-87BE-3A39739CA3C0}']
    procedure setCurrentCalendar(currentCalendar: NSCalendar); cdecl;
    function currentCalendar: NSCalendar; cdecl;
    procedure setAutoupdatingCurrentCalendar(autoupdatingCurrentCalendar
      : NSCalendar); cdecl;
    function autoupdatingCurrentCalendar: NSCalendar; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithCalendarIdentifier(ident: NSCalendarIdentifier)
      : Pointer; cdecl;
    function calendarIdentifier: NSCalendarIdentifier; cdecl;
    procedure setLocale(locale: NSLocale); cdecl;
    function locale: NSLocale; cdecl;
    procedure setTimeZone(timeZone: NSTimeZone); cdecl;
    function timeZone: NSTimeZone; cdecl;
    procedure setFirstWeekday(firstWeekday: NSUInteger); cdecl;
    function firstWeekday: NSUInteger; cdecl;
    procedure setMinimumDaysInFirstWeek(minimumDaysInFirstWeek
      : NSUInteger); cdecl;
    function minimumDaysInFirstWeek: NSUInteger; cdecl;
    function eraSymbols: NSArray; cdecl;
    function longEraSymbols: NSArray; cdecl;
    function monthSymbols: NSArray; cdecl;
    function shortMonthSymbols: NSArray; cdecl;
    function veryShortMonthSymbols: NSArray; cdecl;
    function standaloneMonthSymbols: NSArray; cdecl;
    function shortStandaloneMonthSymbols: NSArray; cdecl;
    function veryShortStandaloneMonthSymbols: NSArray; cdecl;
    function weekdaySymbols: NSArray; cdecl;
    function shortWeekdaySymbols: NSArray; cdecl;
    function veryShortWeekdaySymbols: NSArray; cdecl;
    function standaloneWeekdaySymbols: NSArray; cdecl;
    function shortStandaloneWeekdaySymbols: NSArray; cdecl;
    function veryShortStandaloneWeekdaySymbols: NSArray; cdecl;
    function quarterSymbols: NSArray; cdecl;
    function shortQuarterSymbols: NSArray; cdecl;
    function standaloneQuarterSymbols: NSArray; cdecl;
    function shortStandaloneQuarterSymbols: NSArray; cdecl;
    function AMSymbol: NSString; cdecl;
    function PMSymbol: NSString; cdecl;
    function minimumRangeOfUnit(&unit: NSCalendarUnit): NSRange; cdecl;
    function maximumRangeOfUnit(&unit: NSCalendarUnit): NSRange; cdecl;
    [MethodName('rangeOfUnit:inUnit:forDate:')]
    function rangeOfUnitInUnitForDate(smaller: NSCalendarUnit;
      inUnit: NSCalendarUnit; forDate: NSDate): NSRange; cdecl;
    function ordinalityOfUnit(smaller: NSCalendarUnit; inUnit: NSCalendarUnit;
      forDate: NSDate): NSUInteger; cdecl;
    [MethodName('rangeOfUnit:startDate:interval:forDate:')]
    function rangeOfUnitStartDateIntervalForDate(&unit: NSCalendarUnit;
      startDate: NSDate; interval: PNSTimeInterval; forDate: NSDate)
      : Boolean; cdecl;
    function dateFromComponents(comps: NSDateComponents): NSDate; cdecl;
    [MethodName('components:fromDate:')]
    function componentsFromDate(unitFlags: NSCalendarUnit; fromDate: NSDate)
      : NSDateComponents; cdecl;
    function dateByAddingComponents(comps: NSDateComponents; toDate: NSDate;
      options: NSCalendarOptions): NSDate; cdecl;
    [MethodName('components:fromDate:toDate:options:')]
    function componentsFromDateToDateOptions(unitFlags: NSCalendarUnit;
      fromDate: NSDate; toDate: NSDate; options: NSCalendarOptions)
      : NSDateComponents; cdecl;
    [MethodName('getEra:year:month:day:fromDate:')]
    procedure getEraYearMonthDayFromDate(eraValuePointer: PNSInteger;
      year: PNSInteger; month: PNSInteger; day: PNSInteger;
      fromDate: NSDate); cdecl;
    [MethodName('getEra:yearForWeekOfYear:weekOfYear:weekday:fromDate:')]
    procedure getEraYearForWeekOfYearWeekOfYearWeekdayFromDate(eraValuePointer
      : PNSInteger; yearForWeekOfYear: PNSInteger; weekOfYear: PNSInteger;
      weekday: PNSInteger; fromDate: NSDate); cdecl;
    procedure getHour(hourValuePointer: PNSInteger; minute: PNSInteger;
      second: PNSInteger; nanosecond: PNSInteger; fromDate: NSDate); cdecl;
    function component(&unit: NSCalendarUnit; fromDate: NSDate)
      : NSInteger; cdecl;
    [MethodName('dateWithEra:year:month:day:hour:minute:second:nanosecond:')]
    function dateWithEraYearMonthDayHourMinuteSecondNanosecond
      (eraValue: NSInteger; year: NSInteger; month: NSInteger; day: NSInteger;
      hour: NSInteger; minute: NSInteger; second: NSInteger;
      nanosecond: NSInteger): NSDate; cdecl;
    [MethodName
      ('dateWithEra:yearForWeekOfYear:weekOfYear:weekday:hour:minute:second:nanosecond:')
      ]
    function dateWithEraYearForWeekOfYearWeekOfYearWeekdayHourMinuteSecondNanosecond
      (eraValue: NSInteger; yearForWeekOfYear: NSInteger; weekOfYear: NSInteger;
      weekday: NSInteger; hour: NSInteger; minute: NSInteger; second: NSInteger;
      nanosecond: NSInteger): NSDate; cdecl;
    function startOfDayForDate(date: NSDate): NSDate; cdecl;
    function componentsInTimeZone(timeZone: NSTimeZone; fromDate: NSDate)
      : NSDateComponents; cdecl;
    function compareDate(date1: NSDate; toDate: NSDate;
      toUnitGranularity: NSCalendarUnit): NSComparisonResult; cdecl;
    [MethodName('isDate:equalToDate:toUnitGranularity:')]
    function isDateEqualToDateToUnitGranularity(date1: NSDate;
      equalToDate: NSDate; toUnitGranularity: NSCalendarUnit): Boolean; cdecl;
    [MethodName('isDate:inSameDayAsDate:')]
    function isDateInSameDayAsDate(date1: NSDate; inSameDayAsDate: NSDate)
      : Boolean; cdecl;
    function isDateInToday(date: NSDate): Boolean; cdecl;
    function isDateInYesterday(date: NSDate): Boolean; cdecl;
    function isDateInTomorrow(date: NSDate): Boolean; cdecl;
    function isDateInWeekend(date: NSDate): Boolean; cdecl;
    function rangeOfWeekendStartDate(datep: NSDate; interval: PNSTimeInterval;
      containingDate: NSDate): Boolean; cdecl;
    function nextWeekendStartDate(datep: NSDate; interval: PNSTimeInterval;
      options: NSCalendarOptions; afterDate: NSDate): Boolean; cdecl;
    [MethodName('components:fromDateComponents:toDateComponents:options:')]
    function componentsFromDateComponentsToDateComponentsOptions
      (unitFlags: NSCalendarUnit; fromDateComponents: NSDateComponents;
      toDateComponents: NSDateComponents; options: NSCalendarOptions)
      : NSDateComponents; cdecl;
    function dateByAddingUnit(&unit: NSCalendarUnit; value: NSInteger;
      toDate: NSDate; options: NSCalendarOptions): NSDate; cdecl;
    procedure enumerateDatesStartingAfterDate(start: NSDate;
      matchingComponents: NSDateComponents; options: NSCalendarOptions;
      usingBlock: TFoundationUsingBlock3); cdecl;
    [MethodName('nextDateAfterDate:matchingComponents:options:')]
    function nextDateAfterDateMatchingComponentsOptions(date: NSDate;
      matchingComponents: NSDateComponents; options: NSCalendarOptions)
      : NSDate; cdecl;
    [MethodName('nextDateAfterDate:matchingUnit:value:options:')]
    function nextDateAfterDateMatchingUnitValueOptions(date: NSDate;
      matchingUnit: NSCalendarUnit; value: NSInteger;
      options: NSCalendarOptions): NSDate; cdecl;
    [MethodName('nextDateAfterDate:matchingHour:minute:second:options:')]
    function nextDateAfterDateMatchingHourMinuteSecondOptions(date: NSDate;
      matchingHour: NSInteger; minute: NSInteger; second: NSInteger;
      options: NSCalendarOptions): NSDate; cdecl;
    function dateBySettingUnit(&unit: NSCalendarUnit; value: NSInteger;
      ofDate: NSDate; options: NSCalendarOptions): NSDate; cdecl;
    function dateBySettingHour(h: NSInteger; minute: NSInteger;
      second: NSInteger; ofDate: NSDate; options: NSCalendarOptions)
      : NSDate; cdecl;
    function date(date: NSDate; matchesComponents: NSDateComponents)
      : Boolean; cdecl;
  end;

  TNSCalendar = class(TOCGenericImport<NSCalendarClass, NSCalendar>)
  end;

  PNSCalendar = Pointer;

  NSMutableCharacterSetClass = interface(NSCharacterSetClass)
    ['{35D0ABC9-BDF0-43F0-B8E2-5D2A8A2EC23F}']
    { class } function controlCharacterSet: NSMutableCharacterSet; cdecl;
    { class } function whitespaceCharacterSet: NSMutableCharacterSet; cdecl;
    { class } function whitespaceAndNewlineCharacterSet
      : NSMutableCharacterSet; cdecl;
    { class } function decimalDigitCharacterSet: NSMutableCharacterSet; cdecl;
    { class } function letterCharacterSet: NSMutableCharacterSet; cdecl;
    { class } function lowercaseLetterCharacterSet
      : NSMutableCharacterSet; cdecl;
    { class } function uppercaseLetterCharacterSet
      : NSMutableCharacterSet; cdecl;
    { class } function nonBaseCharacterSet: NSMutableCharacterSet; cdecl;
    { class } function alphanumericCharacterSet: NSMutableCharacterSet; cdecl;
    { class } function decomposableCharacterSet: NSMutableCharacterSet; cdecl;
    { class } function illegalCharacterSet: NSMutableCharacterSet; cdecl;
    { class } function punctuationCharacterSet: NSMutableCharacterSet; cdecl;
    { class } function capitalizedLetterCharacterSet
      : NSMutableCharacterSet; cdecl;
    { class } function symbolCharacterSet: NSMutableCharacterSet; cdecl;
    { class } function newlineCharacterSet: NSMutableCharacterSet; cdecl;
    { class } function characterSetWithRange(aRange: NSRange)
      : NSMutableCharacterSet; cdecl;
    { class } function characterSetWithCharactersInString(aString: NSString)
      : NSMutableCharacterSet; cdecl;
    { class } function characterSetWithBitmapRepresentation(data: NSData)
      : NSMutableCharacterSet; cdecl;
    { class } function characterSetWithContentsOfFile(fName: NSString)
      : NSMutableCharacterSet; cdecl;
  end;

  NSMutableCharacterSet = interface(NSCharacterSet)
    ['{771E275A-9BBF-4D5F-8327-0952F44D11D4}']
    procedure addCharactersInRange(aRange: NSRange); cdecl;
    procedure removeCharactersInRange(aRange: NSRange); cdecl;
    procedure addCharactersInString(aString: NSString); cdecl;
    procedure removeCharactersInString(aString: NSString); cdecl;
    procedure formUnionWithCharacterSet(otherSet: NSCharacterSet); cdecl;
    procedure formIntersectionWithCharacterSet(otherSet: NSCharacterSet); cdecl;
    procedure invert; cdecl;
  end;

  TNSMutableCharacterSet = class(TOCGenericImport<NSMutableCharacterSetClass,
    NSMutableCharacterSet>)
  end;

  PNSMutableCharacterSet = Pointer;

  NSMutableDataClass = interface(NSDataClass)
    ['{CC7701E2-B841-4D53-B7AC-B8AC99E066BB}']
    { class } function dataWithCapacity(aNumItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
    { class } function dataWithLength(length: NSUInteger)
      : Pointer { instancetype }; cdecl;
  end;

  NSMutableData = interface(NSData)
    ['{633BCA95-8C76-495D-9BD7-A3A9D037CE82}']
    function mutableBytes: Pointer; cdecl;
    procedure setLength(length: NSUInteger); cdecl;
    function length: NSUInteger; cdecl;
    procedure appendBytes(bytes: Pointer; length: NSUInteger); cdecl;
    procedure appendData(other: NSData); cdecl;
    procedure increaseLengthBy(extraLength: NSUInteger); cdecl;
    [MethodName('replaceBytesInRange:withBytes:')]
    procedure replaceBytesInRangeWithBytes(range: NSRange;
      withBytes: Pointer); cdecl;
    procedure resetBytesInRange(range: NSRange); cdecl;
    procedure setData(data: NSData); cdecl;
    [MethodName('replaceBytesInRange:withBytes:length:')]
    procedure replaceBytesInRangeWithBytesLength(range: NSRange;
      withBytes: Pointer; length: NSUInteger); cdecl;
    function initWithCapacity(capacity: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithLength(length: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function decompressUsingAlgorithm(algorithm: NSDataCompressionAlgorithm;
      error: NSError): Boolean; cdecl;
    function compressUsingAlgorithm(algorithm: NSDataCompressionAlgorithm;
      error: NSError): Boolean; cdecl;
  end;

  TNSMutableData = class(TOCGenericImport<NSMutableDataClass, NSMutableData>)
  end;

  PNSMutableData = Pointer;

  NSPurgeableDataClass = interface(NSMutableDataClass)
    ['{DBE3D1FE-6290-4C86-B74F-1DC96BFF350E}']
  end;

  NSPurgeableData = interface(NSMutableData)
    ['{EDD0AFB7-B262-4F4B-8CB2-01F655B0A06D}']
  end;

  TNSPurgeableData = class(TOCGenericImport<NSPurgeableDataClass,
    NSPurgeableData>)
  end;

  PNSPurgeableData = Pointer;

  NSDateIntervalClass = interface(NSObjectClass)
    ['{10570938-1283-4E12-8939-B436DF74115B}']
  end;

  NSDateInterval = interface(NSObject)
    ['{47814474-BF1B-407D-B02C-7CBE5235B0A6}']
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function duration: NSTimeInterval; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    [MethodName('initWithStartDate:duration:')]
    function initWithStartDateDuration(startDate: NSDate;
      duration: NSTimeInterval): Pointer { instancetype }; cdecl;
    [MethodName('initWithStartDate:endDate:')]
    function initWithStartDateEndDate(startDate: NSDate; endDate: NSDate)
      : Pointer { instancetype }; cdecl;
    function compare(dateInterval: NSDateInterval): NSComparisonResult; cdecl;
    function isEqualToDateInterval(dateInterval: NSDateInterval)
      : Boolean; cdecl;
    function intersectsDateInterval(dateInterval: NSDateInterval)
      : Boolean; cdecl;
    function intersectionWithDateInterval(dateInterval: NSDateInterval)
      : NSDateInterval; cdecl;
    function containsDate(date: NSDate): Boolean; cdecl;
  end;

  TNSDateInterval = class(TOCGenericImport<NSDateIntervalClass, NSDateInterval>)
  end;

  PNSDateInterval = Pointer;

  NSAttributedStringClass = interface(NSObjectClass)
    ['{91C6C63A-D4BE-44EC-ACE7-6D55543EC550}']
    [MethodName('localizedAttributedStringWithFormat:')]
    { class } function localizedAttributedStringWithFormat
      (format: NSAttributedString): Pointer { instancetype }; cdecl;
    [MethodName('localizedAttributedStringWithFormat:options:')]
    { class } function localizedAttributedStringWithFormatOptions
      (format: NSAttributedString; options: NSAttributedStringFormattingOptions)
      : Pointer { instancetype }; cdecl;
  end;

  NSAttributedString = interface(NSObject)
    ['{20F04B1A-64D4-49A7-BB24-F0EF16816116}']
    function &string: NSString; cdecl;
    [MethodName('attributesAtIndex:effectiveRange:')]
    function attributesAtIndexEffectiveRange(location: NSUInteger;
      effectiveRange: NSRangePointer): NSDictionary; cdecl;
    function length: NSUInteger; cdecl;
    [MethodName('attribute:atIndex:effectiveRange:')]
    function attributeAtIndexEffectiveRange(attrName: NSAttributedStringKey;
      atIndex: NSUInteger; effectiveRange: NSRangePointer): Pointer; cdecl;
    function attributedSubstringFromRange(range: NSRange)
      : NSAttributedString; cdecl;
    [MethodName('attributesAtIndex:longestEffectiveRange:inRange:')]
    function attributesAtIndexLongestEffectiveRangeInRange(location: NSUInteger;
      longestEffectiveRange: NSRangePointer; inRange: NSRange)
      : NSDictionary; cdecl;
    [MethodName('attribute:atIndex:longestEffectiveRange:inRange:')]
    function attributeAtIndexLongestEffectiveRangeInRange
      (attrName: NSAttributedStringKey; atIndex: NSUInteger;
      longestEffectiveRange: NSRangePointer; inRange: NSRange): Pointer; cdecl;
    function isEqualToAttributedString(other: NSAttributedString)
      : Boolean; cdecl;
    [MethodName('initWithString:')]
    function initWithString(str: NSString): Pointer { instancetype }; cdecl;
    [MethodName('initWithString:attributes:')]
    function initWithStringAttributes(str: NSString; attributes: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function initWithAttributedString(attrStr: NSAttributedString)
      : Pointer { instancetype }; cdecl;
    procedure enumerateAttributesInRange(enumerationRange: NSRange;
      options: NSAttributedStringEnumerationOptions;
      usingBlock: TFoundationUsingBlock4); cdecl;
    procedure enumerateAttribute(attrName: NSAttributedStringKey;
      inRange: NSRange; options: NSAttributedStringEnumerationOptions;
      usingBlock: TFoundationBlock9); cdecl;
    function initWithContentsOfMarkdownFileAtURL(markdownFile: NSURL;
      options: NSAttributedStringMarkdownParsingOptions; baseURL: NSURL;
      error: NSError): Pointer { instancetype }; cdecl;
    function initWithMarkdown(markdown: NSData;
      options: NSAttributedStringMarkdownParsingOptions; baseURL: NSURL;
      error: NSError): Pointer { instancetype }; cdecl;
    function initWithMarkdownString(markdownString: NSString;
      options: NSAttributedStringMarkdownParsingOptions; baseURL: NSURL;
      error: NSError): Pointer { instancetype }; cdecl;
    [MethodName('initWithFormat:options:locale:')]
    function initWithFormatOptionsLocale(format: NSAttributedString;
      options: NSAttributedStringFormattingOptions; locale: NSLocale)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithFormat:options:locale:arguments:')]
    function initWithFormatOptionsLocaleArguments(format: NSAttributedString;
      options: NSAttributedStringFormattingOptions; locale: NSLocale;
      arguments: array of const): Pointer { instancetype }; cdecl;
    function attributedStringByInflectingString: NSAttributedString; cdecl;
  end;

  TNSAttributedString = class(TOCGenericImport<NSAttributedStringClass,
    NSAttributedString>)
  end;

  PNSAttributedString = Pointer;

  NSMutableAttributedStringClass = interface(NSAttributedStringClass)
    ['{082655C8-A7FE-48A9-BF33-6CED2423CB22}']
  end;

  NSMutableAttributedString = interface(NSAttributedString)
    ['{33BA2A00-1C37-4C4C-9837-62F3D090609D}']
    [MethodName('replaceCharactersInRange:withString:')]
    procedure replaceCharactersInRangeWithString(range: NSRange;
      withString: NSString); cdecl;
    procedure setAttributes(attrs: NSDictionary; range: NSRange); cdecl;
    function mutableString: NSMutableString; cdecl;
    procedure addAttribute(name: NSAttributedStringKey; value: Pointer;
      range: NSRange); cdecl;
    procedure addAttributes(attrs: NSDictionary; range: NSRange); cdecl;
    procedure removeAttribute(name: NSAttributedStringKey;
      range: NSRange); cdecl;
    [MethodName('replaceCharactersInRange:withAttributedString:')]
    procedure replaceCharactersInRangeWithAttributedString(range: NSRange;
      withAttributedString: NSAttributedString); cdecl;
    procedure insertAttributedString(attrString: NSAttributedString;
      atIndex: NSUInteger); cdecl;
    procedure appendAttributedString(attrString: NSAttributedString); cdecl;
    procedure deleteCharactersInRange(range: NSRange); cdecl;
    procedure setAttributedString(attrString: NSAttributedString); cdecl;
    procedure beginEditing; cdecl;
    procedure endEditing; cdecl;
    procedure appendLocalizedFormat(format: NSAttributedString); cdecl;
  end;

  TNSMutableAttributedString = class
    (TOCGenericImport<NSMutableAttributedStringClass,
    NSMutableAttributedString>)
  end;

  PNSMutableAttributedString = Pointer;

  NSAttributedStringMarkdownSourcePositionClass = interface(NSObjectClass)
    ['{DA20C149-B594-4416-AF56-A8184D2973F3}']
  end;

  NSAttributedStringMarkdownSourcePosition = interface(NSObject)
    ['{B5AE2C94-0465-42D9-BB13-B4BE5D832D94}']
    function startLine: NSInteger; cdecl;
    function startColumn: NSInteger; cdecl;
    function endLine: NSInteger; cdecl;
    function endColumn: NSInteger; cdecl;
    function initWithStartLine(startLine: NSInteger; startColumn: NSInteger;
      endLine: NSInteger; endColumn: NSInteger)
      : Pointer { instancetype }; cdecl;
    function rangeInString(&string: NSString): NSRange; cdecl;
  end;

  TNSAttributedStringMarkdownSourcePosition = class
    (TOCGenericImport<NSAttributedStringMarkdownSourcePositionClass,
    NSAttributedStringMarkdownSourcePosition>)
  end;

  PNSAttributedStringMarkdownSourcePosition = Pointer;

  NSAttributedStringMarkdownParsingOptionsClass = interface(NSObjectClass)
    ['{EC31F2E6-B00A-463A-A7C8-72384A71D484}']
  end;

  NSAttributedStringMarkdownParsingOptions = interface(NSObject)
    ['{FFACEC50-9D88-46B2-B6C4-FA052FB2B29F}']
    function init: Pointer { instancetype }; cdecl;
    procedure setAllowsExtendedAttributes(allowsExtendedAttributes
      : Boolean); cdecl;
    function allowsExtendedAttributes: Boolean; cdecl;
    procedure setInterpretedSyntax(interpretedSyntax
      : NSAttributedStringMarkdownInterpretedSyntax); cdecl;
    function interpretedSyntax
      : NSAttributedStringMarkdownInterpretedSyntax; cdecl;
    procedure setFailurePolicy(failurePolicy
      : NSAttributedStringMarkdownParsingFailurePolicy); cdecl;
    function failurePolicy
      : NSAttributedStringMarkdownParsingFailurePolicy; cdecl;
    procedure setLanguageCode(languageCode: NSString); cdecl;
    function languageCode: NSString; cdecl;
    procedure setAppliesSourcePositionAttributes(appliesSourcePositionAttributes
      : Boolean); cdecl;
    function appliesSourcePositionAttributes: Boolean; cdecl;
  end;

  TNSAttributedStringMarkdownParsingOptions = class
    (TOCGenericImport<NSAttributedStringMarkdownParsingOptionsClass,
    NSAttributedStringMarkdownParsingOptions>)
  end;

  PNSAttributedStringMarkdownParsingOptions = Pointer;

  NSPresentationIntentClass = interface(NSObjectClass)
    ['{AF63A4F6-F0DE-4DA9-AEC1-6117B16A3D60}']
    { class } function paragraphIntentWithIdentity(identity: NSInteger;
      nestedInsideIntent: NSPresentationIntent): NSPresentationIntent; cdecl;
    { class } function headerIntentWithIdentity(identity: NSInteger;
      level: NSInteger; nestedInsideIntent: NSPresentationIntent)
      : NSPresentationIntent; cdecl;
    { class } function codeBlockIntentWithIdentity(identity: NSInteger;
      languageHint: NSString; nestedInsideIntent: NSPresentationIntent)
      : NSPresentationIntent; cdecl;
    { class } function thematicBreakIntentWithIdentity(identity: NSInteger;
      nestedInsideIntent: NSPresentationIntent): NSPresentationIntent; cdecl;
    { class } function orderedListIntentWithIdentity(identity: NSInteger;
      nestedInsideIntent: NSPresentationIntent): NSPresentationIntent; cdecl;
    { class } function unorderedListIntentWithIdentity(identity: NSInteger;
      nestedInsideIntent: NSPresentationIntent): NSPresentationIntent; cdecl;
    { class } function listItemIntentWithIdentity(identity: NSInteger;
      ordinal: NSInteger; nestedInsideIntent: NSPresentationIntent)
      : NSPresentationIntent; cdecl;
    { class } function blockQuoteIntentWithIdentity(identity: NSInteger;
      nestedInsideIntent: NSPresentationIntent): NSPresentationIntent; cdecl;
    { class } function tableIntentWithIdentity(identity: NSInteger;
      columnCount: NSInteger; alignments: NSArray;
      nestedInsideIntent: NSPresentationIntent): NSPresentationIntent; cdecl;
    { class } function tableHeaderRowIntentWithIdentity(identity: NSInteger;
      nestedInsideIntent: NSPresentationIntent): NSPresentationIntent; cdecl;
    { class } function tableRowIntentWithIdentity(identity: NSInteger;
      row: NSInteger; nestedInsideIntent: NSPresentationIntent)
      : NSPresentationIntent; cdecl;
    { class } function tableCellIntentWithIdentity(identity: NSInteger;
      column: NSInteger; nestedInsideIntent: NSPresentationIntent)
      : NSPresentationIntent; cdecl;
  end;

  NSPresentationIntent = interface(NSObject)
    ['{ADBDDE7E-BC41-4EC9-B849-1685BD34C75F}']
    function intentKind: NSPresentationIntentKind; cdecl;
    function parentIntent: NSPresentationIntent; cdecl;
    function identity: NSInteger; cdecl;
    function ordinal: NSInteger; cdecl;
    function columnAlignments: NSArray; cdecl;
    function columnCount: NSInteger; cdecl;
    function headerLevel: NSInteger; cdecl;
    function languageHint: NSString; cdecl;
    function column: NSInteger; cdecl;
    function row: NSInteger; cdecl;
    function indentationLevel: NSInteger; cdecl;
    function isEquivalentToPresentationIntent(other: NSPresentationIntent)
      : Boolean; cdecl;
  end;

  TNSPresentationIntent = class(TOCGenericImport<NSPresentationIntentClass,
    NSPresentationIntent>)
  end;

  PNSPresentationIntent = Pointer;

  NSFormatterClass = interface(NSObjectClass)
    ['{6FC63083-EB88-4A0B-95B8-6EDFD8C2C903}']
  end;

  NSFormatter = interface(NSObject)
    ['{D8B5EC62-2D0B-491E-8B83-D72E497CF281}']
    function stringForObjectValue(obj: Pointer): NSString; cdecl;
    function attributedStringForObjectValue(obj: Pointer;
      withDefaultAttributes: NSDictionary): NSAttributedString; cdecl;
    function editingStringForObjectValue(obj: Pointer): NSString; cdecl;
    function getObjectValue(obj: Pointer; forString: NSString;
      errorDescription: NSString): Boolean; cdecl;
    [MethodName('isPartialStringValid:newEditingString:errorDescription:')]
    function isPartialStringValidNewEditingStringErrorDescription
      (partialString: NSString; newEditingString: NSString;
      errorDescription: NSString): Boolean; cdecl;
    [MethodName
      ('isPartialStringValid:proposedSelectedRange:originalString:originalSelectedRange:errorDescription:')
      ]
    function isPartialStringValidProposedSelectedRangeOriginalStringOriginalSelectedRangeErrorDescription
      (partialStringPtr: NSString; proposedSelectedRange: NSRangePointer;
      originalString: NSString; originalSelectedRange: NSRange;
      errorDescription: NSString): Boolean; cdecl;
  end;

  TNSFormatter = class(TOCGenericImport<NSFormatterClass, NSFormatter>)
  end;

  PNSFormatter = Pointer;

  NSDateFormatterClass = interface(NSFormatterClass)
    ['{8FFE0E82-39D2-44F4-AFF1-234118A84DAD}']
    { class } function localizedStringFromDate(date: NSDate;
      dateStyle: NSDateFormatterStyle; timeStyle: NSDateFormatterStyle)
      : NSString; cdecl;
    { class } function dateFormatFromTemplate(tmplate: NSString;
      options: NSUInteger; locale: NSLocale): NSString; cdecl;
  end;

  NSDateFormatter = interface(NSFormatter)
    ['{60BBD766-E87F-48D0-B078-A5DA0579D29F}']
    procedure setFormattingContext(formattingContext
      : NSFormattingContext); cdecl;
    function formattingContext: NSFormattingContext; cdecl;
    function getObjectValue(obj: Pointer; forString: NSString; range: Pointer;
      error: NSError): Boolean; cdecl;
    function stringFromDate(date: NSDate): NSString; cdecl;
    function dateFromString(&string: NSString): NSDate; cdecl;
    procedure setDefaultFormatterBehavior(defaultFormatterBehavior
      : NSDateFormatterBehavior); cdecl;
    function defaultFormatterBehavior: NSDateFormatterBehavior; cdecl;
    procedure setLocalizedDateFormatFromTemplate(dateFormatTemplate
      : NSString); cdecl;
    procedure setDateFormat(dateFormat: NSString); cdecl;
    function dateFormat: NSString; cdecl;
    procedure setDateStyle(dateStyle: NSDateFormatterStyle); cdecl;
    function dateStyle: NSDateFormatterStyle; cdecl;
    procedure setTimeStyle(timeStyle: NSDateFormatterStyle); cdecl;
    function timeStyle: NSDateFormatterStyle; cdecl;
    procedure setLocale(locale: NSLocale); cdecl;
    function locale: NSLocale; cdecl;
    procedure setGeneratesCalendarDates(generatesCalendarDates: Boolean); cdecl;
    function generatesCalendarDates: Boolean; cdecl;
    procedure setFormatterBehavior(formatterBehavior
      : NSDateFormatterBehavior); cdecl;
    function formatterBehavior: NSDateFormatterBehavior; cdecl;
    procedure setTimeZone(timeZone: NSTimeZone); cdecl;
    function timeZone: NSTimeZone; cdecl;
    procedure setCalendar(calendar: NSCalendar); cdecl;
    function calendar: NSCalendar; cdecl;
    procedure setLenient(lenient: Boolean); cdecl;
    function isLenient: Boolean; cdecl;
    procedure setTwoDigitStartDate(twoDigitStartDate: NSDate); cdecl;
    function twoDigitStartDate: NSDate; cdecl;
    procedure setDefaultDate(defaultDate: NSDate); cdecl;
    function defaultDate: NSDate; cdecl;
    procedure setEraSymbols(eraSymbols: NSArray); cdecl;
    function eraSymbols: NSArray; cdecl;
    procedure setMonthSymbols(monthSymbols: NSArray); cdecl;
    function monthSymbols: NSArray; cdecl;
    procedure setShortMonthSymbols(shortMonthSymbols: NSArray); cdecl;
    function shortMonthSymbols: NSArray; cdecl;
    procedure setWeekdaySymbols(weekdaySymbols: NSArray); cdecl;
    function weekdaySymbols: NSArray; cdecl;
    procedure setShortWeekdaySymbols(shortWeekdaySymbols: NSArray); cdecl;
    function shortWeekdaySymbols: NSArray; cdecl;
    procedure setAMSymbol(AMSymbol: NSString); cdecl;
    function AMSymbol: NSString; cdecl;
    procedure setPMSymbol(PMSymbol: NSString); cdecl;
    function PMSymbol: NSString; cdecl;
    procedure setLongEraSymbols(longEraSymbols: NSArray); cdecl;
    function longEraSymbols: NSArray; cdecl;
    procedure setVeryShortMonthSymbols(veryShortMonthSymbols: NSArray); cdecl;
    function veryShortMonthSymbols: NSArray; cdecl;
    procedure setStandaloneMonthSymbols(standaloneMonthSymbols: NSArray); cdecl;
    function standaloneMonthSymbols: NSArray; cdecl;
    procedure setShortStandaloneMonthSymbols(shortStandaloneMonthSymbols
      : NSArray); cdecl;
    function shortStandaloneMonthSymbols: NSArray; cdecl;
    procedure setVeryShortStandaloneMonthSymbols(veryShortStandaloneMonthSymbols
      : NSArray); cdecl;
    function veryShortStandaloneMonthSymbols: NSArray; cdecl;
    procedure setVeryShortWeekdaySymbols(veryShortWeekdaySymbols
      : NSArray); cdecl;
    function veryShortWeekdaySymbols: NSArray; cdecl;
    procedure setStandaloneWeekdaySymbols(standaloneWeekdaySymbols
      : NSArray); cdecl;
    function standaloneWeekdaySymbols: NSArray; cdecl;
    procedure setShortStandaloneWeekdaySymbols(shortStandaloneWeekdaySymbols
      : NSArray); cdecl;
    function shortStandaloneWeekdaySymbols: NSArray; cdecl;
    procedure setVeryShortStandaloneWeekdaySymbols
      (veryShortStandaloneWeekdaySymbols: NSArray); cdecl;
    function veryShortStandaloneWeekdaySymbols: NSArray; cdecl;
    procedure setQuarterSymbols(quarterSymbols: NSArray); cdecl;
    function quarterSymbols: NSArray; cdecl;
    procedure setShortQuarterSymbols(shortQuarterSymbols: NSArray); cdecl;
    function shortQuarterSymbols: NSArray; cdecl;
    procedure setStandaloneQuarterSymbols(standaloneQuarterSymbols
      : NSArray); cdecl;
    function standaloneQuarterSymbols: NSArray; cdecl;
    procedure setShortStandaloneQuarterSymbols(shortStandaloneQuarterSymbols
      : NSArray); cdecl;
    function shortStandaloneQuarterSymbols: NSArray; cdecl;
    procedure setGregorianStartDate(gregorianStartDate: NSDate); cdecl;
    function gregorianStartDate: NSDate; cdecl;
    procedure setDoesRelativeDateFormatting(doesRelativeDateFormatting
      : Boolean); cdecl;
    function doesRelativeDateFormatting: Boolean; cdecl;
  end;

  TNSDateFormatter = class(TOCGenericImport<NSDateFormatterClass,
    NSDateFormatter>)
  end;

  PNSDateFormatter = Pointer;

  NSDateIntervalFormatterClass = interface(NSFormatterClass)
    ['{4C12E7DB-86BD-4670-9FC0-47F0D205F108}']
  end;

  NSDateIntervalFormatter = interface(NSFormatter)
    ['{539D305E-BA5E-461F-B86A-D09B8D0342A1}']
    procedure setLocale(locale: NSLocale); cdecl;
    function locale: NSLocale; cdecl;
    procedure setCalendar(calendar: NSCalendar); cdecl;
    function calendar: NSCalendar; cdecl;
    procedure setTimeZone(timeZone: NSTimeZone); cdecl;
    function timeZone: NSTimeZone; cdecl;
    procedure setDateTemplate(dateTemplate: NSString); cdecl;
    function dateTemplate: NSString; cdecl;
    procedure setDateStyle(dateStyle: NSDateIntervalFormatterStyle); cdecl;
    function dateStyle: NSDateIntervalFormatterStyle; cdecl;
    procedure setTimeStyle(timeStyle: NSDateIntervalFormatterStyle); cdecl;
    function timeStyle: NSDateIntervalFormatterStyle; cdecl;
    function stringFromDate(fromDate: NSDate; toDate: NSDate): NSString; cdecl;
    function stringFromDateInterval(dateInterval: NSDateInterval)
      : NSString; cdecl;
  end;

  TNSDateIntervalFormatter = class
    (TOCGenericImport<NSDateIntervalFormatterClass, NSDateIntervalFormatter>)
  end;

  PNSDateIntervalFormatter = Pointer;

  NSISO8601DateFormatterClass = interface(NSFormatterClass)
    ['{1B351D2B-F7DE-4E70-BC5C-B1BADFEAAF0E}']
    { class } function stringFromDate(date: NSDate; timeZone: NSTimeZone;
      formatOptions: NSISO8601DateFormatOptions): NSString; cdecl;
  end;

  NSISO8601DateFormatter = interface(NSFormatter)
    ['{E0647327-B76B-40E9-8837-C3465EFC0B9A}']
    procedure setTimeZone(timeZone: NSTimeZone); cdecl;
    function timeZone: NSTimeZone; cdecl;
    procedure setFormatOptions(formatOptions
      : NSISO8601DateFormatOptions); cdecl;
    function formatOptions: NSISO8601DateFormatOptions; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function stringFromDate(date: NSDate): NSString; cdecl;
    function dateFromString(&string: NSString): NSDate; cdecl;
  end;

  TNSISO8601DateFormatter = class(TOCGenericImport<NSISO8601DateFormatterClass,
    NSISO8601DateFormatter>)
  end;

  PNSISO8601DateFormatter = Pointer;

  NSNumberFormatterClass = interface(NSFormatterClass)
    ['{D566C1CC-CEB3-4023-85A7-1949AF355823}']
    { class } function localizedStringFromNumber(num: NSNumber;
      numberStyle: NSNumberFormatterStyle): NSString; cdecl;
    { class } function defaultFormatterBehavior
      : NSNumberFormatterBehavior; cdecl;
    { class } procedure setDefaultFormatterBehavior
      (behavior: NSNumberFormatterBehavior); cdecl;
  end;

  NSNumberFormatter = interface(NSFormatter)
    ['{B7C9DFE8-7E84-4CA9-BE7D-ADFA923D92DF}']
    procedure setFormattingContext(formattingContext
      : NSFormattingContext); cdecl;
    function formattingContext: NSFormattingContext; cdecl;
    function getObjectValue(obj: Pointer; forString: NSString; range: Pointer;
      error: NSError): Boolean; cdecl;
    function stringFromNumber(number: NSNumber): NSString; cdecl;
    function numberFromString(&string: NSString): NSNumber; cdecl;
    procedure setNumberStyle(numberStyle: NSNumberFormatterStyle); cdecl;
    function numberStyle: NSNumberFormatterStyle; cdecl;
    procedure setLocale(locale: NSLocale); cdecl;
    function locale: NSLocale; cdecl;
    procedure setGeneratesDecimalNumbers(generatesDecimalNumbers
      : Boolean); cdecl;
    function generatesDecimalNumbers: Boolean; cdecl;
    procedure setFormatterBehavior(formatterBehavior
      : NSNumberFormatterBehavior); cdecl;
    function formatterBehavior: NSNumberFormatterBehavior; cdecl;
    procedure setNegativeFormat(negativeFormat: NSString); cdecl;
    function negativeFormat: NSString; cdecl;
    procedure setTextAttributesForNegativeValues(textAttributesForNegativeValues
      : NSDictionary); cdecl;
    function textAttributesForNegativeValues: NSDictionary; cdecl;
    procedure setPositiveFormat(positiveFormat: NSString); cdecl;
    function positiveFormat: NSString; cdecl;
    procedure setTextAttributesForPositiveValues(textAttributesForPositiveValues
      : NSDictionary); cdecl;
    function textAttributesForPositiveValues: NSDictionary; cdecl;
    procedure setAllowsFloats(allowsFloats: Boolean); cdecl;
    function allowsFloats: Boolean; cdecl;
    procedure setDecimalSeparator(decimalSeparator: NSString); cdecl;
    function decimalSeparator: NSString; cdecl;
    procedure setAlwaysShowsDecimalSeparator(alwaysShowsDecimalSeparator
      : Boolean); cdecl;
    function alwaysShowsDecimalSeparator: Boolean; cdecl;
    procedure setCurrencyDecimalSeparator(currencyDecimalSeparator
      : NSString); cdecl;
    function currencyDecimalSeparator: NSString; cdecl;
    procedure setUsesGroupingSeparator(usesGroupingSeparator: Boolean); cdecl;
    function usesGroupingSeparator: Boolean; cdecl;
    procedure setGroupingSeparator(groupingSeparator: NSString); cdecl;
    function groupingSeparator: NSString; cdecl;
    procedure setZeroSymbol(zeroSymbol: NSString); cdecl;
    function zeroSymbol: NSString; cdecl;
    procedure setTextAttributesForZero(textAttributesForZero
      : NSDictionary); cdecl;
    function textAttributesForZero: NSDictionary; cdecl;
    procedure setNilSymbol(nilSymbol: NSString); cdecl;
    function nilSymbol: NSString; cdecl;
    procedure setTextAttributesForNil(textAttributesForNil
      : NSDictionary); cdecl;
    function textAttributesForNil: NSDictionary; cdecl;
    procedure setNotANumberSymbol(notANumberSymbol: NSString); cdecl;
    function notANumberSymbol: NSString; cdecl;
    procedure setTextAttributesForNotANumber(textAttributesForNotANumber
      : NSDictionary); cdecl;
    function textAttributesForNotANumber: NSDictionary; cdecl;
    procedure setPositiveInfinitySymbol(positiveInfinitySymbol
      : NSString); cdecl;
    function positiveInfinitySymbol: NSString; cdecl;
    procedure setTextAttributesForPositiveInfinity
      (textAttributesForPositiveInfinity: NSDictionary); cdecl;
    function textAttributesForPositiveInfinity: NSDictionary; cdecl;
    procedure setNegativeInfinitySymbol(negativeInfinitySymbol
      : NSString); cdecl;
    function negativeInfinitySymbol: NSString; cdecl;
    procedure setTextAttributesForNegativeInfinity
      (textAttributesForNegativeInfinity: NSDictionary); cdecl;
    function textAttributesForNegativeInfinity: NSDictionary; cdecl;
    procedure setPositivePrefix(positivePrefix: NSString); cdecl;
    function positivePrefix: NSString; cdecl;
    procedure setPositiveSuffix(positiveSuffix: NSString); cdecl;
    function positiveSuffix: NSString; cdecl;
    procedure setNegativePrefix(negativePrefix: NSString); cdecl;
    function negativePrefix: NSString; cdecl;
    procedure setNegativeSuffix(negativeSuffix: NSString); cdecl;
    function negativeSuffix: NSString; cdecl;
    procedure setCurrencyCode(currencyCode: NSString); cdecl;
    function currencyCode: NSString; cdecl;
    procedure setCurrencySymbol(currencySymbol: NSString); cdecl;
    function currencySymbol: NSString; cdecl;
    procedure setInternationalCurrencySymbol(internationalCurrencySymbol
      : NSString); cdecl;
    function internationalCurrencySymbol: NSString; cdecl;
    procedure setPercentSymbol(percentSymbol: NSString); cdecl;
    function percentSymbol: NSString; cdecl;
    procedure setPerMillSymbol(perMillSymbol: NSString); cdecl;
    function perMillSymbol: NSString; cdecl;
    procedure setMinusSign(minusSign: NSString); cdecl;
    function minusSign: NSString; cdecl;
    procedure setPlusSign(plusSign: NSString); cdecl;
    function plusSign: NSString; cdecl;
    procedure setExponentSymbol(exponentSymbol: NSString); cdecl;
    function exponentSymbol: NSString; cdecl;
    procedure setGroupingSize(groupingSize: NSUInteger); cdecl;
    function groupingSize: NSUInteger; cdecl;
    procedure setSecondaryGroupingSize(secondaryGroupingSize
      : NSUInteger); cdecl;
    function secondaryGroupingSize: NSUInteger; cdecl;
    procedure setMultiplier(multiplier: NSNumber); cdecl;
    function multiplier: NSNumber; cdecl;
    procedure setFormatWidth(formatWidth: NSUInteger); cdecl;
    function formatWidth: NSUInteger; cdecl;
    procedure setPaddingCharacter(paddingCharacter: NSString); cdecl;
    function paddingCharacter: NSString; cdecl;
    procedure setPaddingPosition(paddingPosition
      : NSNumberFormatterPadPosition); cdecl;
    function paddingPosition: NSNumberFormatterPadPosition; cdecl;
    procedure setRoundingMode(roundingMode
      : NSNumberFormatterRoundingMode); cdecl;
    function roundingMode: NSNumberFormatterRoundingMode; cdecl;
    procedure setRoundingIncrement(roundingIncrement: NSNumber); cdecl;
    function roundingIncrement: NSNumber; cdecl;
    procedure setMinimumIntegerDigits(minimumIntegerDigits: NSUInteger); cdecl;
    function minimumIntegerDigits: NSUInteger; cdecl;
    procedure setMaximumIntegerDigits(maximumIntegerDigits: NSUInteger); cdecl;
    function maximumIntegerDigits: NSUInteger; cdecl;
    procedure setMinimumFractionDigits(minimumFractionDigits
      : NSUInteger); cdecl;
    function minimumFractionDigits: NSUInteger; cdecl;
    procedure setMaximumFractionDigits(maximumFractionDigits
      : NSUInteger); cdecl;
    function maximumFractionDigits: NSUInteger; cdecl;
    procedure setMinimum(minimum: NSNumber); cdecl;
    function minimum: NSNumber; cdecl;
    procedure setMaximum(maximum: NSNumber); cdecl;
    function maximum: NSNumber; cdecl;
    procedure setCurrencyGroupingSeparator(currencyGroupingSeparator
      : NSString); cdecl;
    function currencyGroupingSeparator: NSString; cdecl;
    procedure setLenient(lenient: Boolean); cdecl;
    function isLenient: Boolean; cdecl;
    procedure setUsesSignificantDigits(usesSignificantDigits: Boolean); cdecl;
    function usesSignificantDigits: Boolean; cdecl;
    procedure setMinimumSignificantDigits(minimumSignificantDigits
      : NSUInteger); cdecl;
    function minimumSignificantDigits: NSUInteger; cdecl;
    procedure setMaximumSignificantDigits(maximumSignificantDigits
      : NSUInteger); cdecl;
    function maximumSignificantDigits: NSUInteger; cdecl;
    procedure setPartialStringValidationEnabled(partialStringValidationEnabled
      : Boolean); cdecl;
    function isPartialStringValidationEnabled: Boolean; cdecl;
  end;

  TNSNumberFormatter = class(TOCGenericImport<NSNumberFormatterClass,
    NSNumberFormatter>)
  end;

  PNSNumberFormatter = Pointer;

  NSMassFormatterClass = interface(NSFormatterClass)
    ['{2C1490AB-88E4-4DA8-8945-0CB1F97F6DF4}']
  end;

  NSMassFormatter = interface(NSFormatter)
    ['{EF371F29-3C98-4ABC-9FCF-6ECDA91FAEDC}']
    procedure setNumberFormatter(numberFormatter: NSNumberFormatter); cdecl;
    function numberFormatter: NSNumberFormatter; cdecl;
    procedure setUnitStyle(unitStyle: NSFormattingUnitStyle); cdecl;
    function unitStyle: NSFormattingUnitStyle; cdecl;
    procedure setForPersonMassUse(forPersonMassUse: Boolean); cdecl;
    function isForPersonMassUse: Boolean; cdecl;
    function stringFromValue(value: Double; &unit: NSMassFormatterUnit)
      : NSString; cdecl;
    function stringFromKilograms(numberInKilograms: Double): NSString; cdecl;
    function unitStringFromValue(value: Double; &unit: NSMassFormatterUnit)
      : NSString; cdecl;
    function unitStringFromKilograms(numberInKilograms: Double;
      usedUnit: PNSMassFormatterUnit): NSString; cdecl;
    function getObjectValue(obj: Pointer; forString: NSString;
      errorDescription: NSString): Boolean; cdecl;
  end;

  TNSMassFormatter = class(TOCGenericImport<NSMassFormatterClass,
    NSMassFormatter>)
  end;

  PNSMassFormatter = Pointer;

  NSLengthFormatterClass = interface(NSFormatterClass)
    ['{B455B2B7-84F9-4E07-A4DC-7C56604FF30D}']
  end;

  NSLengthFormatter = interface(NSFormatter)
    ['{9D5975AB-4824-4E2D-A619-85D1BD4DCCE7}']
    procedure setNumberFormatter(numberFormatter: NSNumberFormatter); cdecl;
    function numberFormatter: NSNumberFormatter; cdecl;
    procedure setUnitStyle(unitStyle: NSFormattingUnitStyle); cdecl;
    function unitStyle: NSFormattingUnitStyle; cdecl;
    procedure setForPersonHeightUse(forPersonHeightUse: Boolean); cdecl;
    function isForPersonHeightUse: Boolean; cdecl;
    function stringFromValue(value: Double; &unit: NSLengthFormatterUnit)
      : NSString; cdecl;
    function stringFromMeters(numberInMeters: Double): NSString; cdecl;
    function unitStringFromValue(value: Double; &unit: NSLengthFormatterUnit)
      : NSString; cdecl;
    function unitStringFromMeters(numberInMeters: Double;
      usedUnit: PNSLengthFormatterUnit): NSString; cdecl;
    function getObjectValue(obj: Pointer; forString: NSString;
      errorDescription: NSString): Boolean; cdecl;
  end;

  TNSLengthFormatter = class(TOCGenericImport<NSLengthFormatterClass,
    NSLengthFormatter>)
  end;

  PNSLengthFormatter = Pointer;

  NSEnergyFormatterClass = interface(NSFormatterClass)
    ['{CC48E5CC-4037-4B63-B3CF-F45B84E22BC9}']
  end;

  NSEnergyFormatter = interface(NSFormatter)
    ['{C40FB2F9-1873-47E3-A9CB-A905F7475283}']
    procedure setNumberFormatter(numberFormatter: NSNumberFormatter); cdecl;
    function numberFormatter: NSNumberFormatter; cdecl;
    procedure setUnitStyle(unitStyle: NSFormattingUnitStyle); cdecl;
    function unitStyle: NSFormattingUnitStyle; cdecl;
    procedure setForFoodEnergyUse(forFoodEnergyUse: Boolean); cdecl;
    function isForFoodEnergyUse: Boolean; cdecl;
    function stringFromValue(value: Double; &unit: NSEnergyFormatterUnit)
      : NSString; cdecl;
    function stringFromJoules(numberInJoules: Double): NSString; cdecl;
    function unitStringFromValue(value: Double; &unit: NSEnergyFormatterUnit)
      : NSString; cdecl;
    function unitStringFromJoules(numberInJoules: Double;
      usedUnit: PNSEnergyFormatterUnit): NSString; cdecl;
    function getObjectValue(obj: Pointer; forString: NSString;
      errorDescription: NSString): Boolean; cdecl;
  end;

  TNSEnergyFormatter = class(TOCGenericImport<NSEnergyFormatterClass,
    NSEnergyFormatter>)
  end;

  PNSEnergyFormatter = Pointer;

  NSUnitConverterClass = interface(NSObjectClass)
    ['{3C50CCD9-6D36-45B0-9B2E-7BF6DE7AE82D}']
  end;

  NSUnitConverter = interface(NSObject)
    ['{E08F114B-620D-4D21-9DE2-A43E6795458B}']
    function baseUnitValueFromValue(value: Double): Double; cdecl;
    function valueFromBaseUnitValue(baseUnitValue: Double): Double; cdecl;
  end;

  TNSUnitConverter = class(TOCGenericImport<NSUnitConverterClass,
    NSUnitConverter>)
  end;

  PNSUnitConverter = Pointer;

  NSUnitConverterLinearClass = interface(NSUnitConverterClass)
    ['{44F70F9E-2D26-4720-A942-ECFAB7591EF4}']
  end;

  NSUnitConverterLinear = interface(NSUnitConverter)
    ['{1DDB0B7B-0E53-4BB2-AF3C-6ABA28CE2B41}']
    function coefficient: Double; cdecl;
    function constant: Double; cdecl;
    [MethodName('initWithCoefficient:')]
    function initWithCoefficient(coefficient: Double)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithCoefficient:constant:')]
    function initWithCoefficientConstant(coefficient: Double; constant: Double)
      : Pointer { instancetype }; cdecl;
  end;

  TNSUnitConverterLinear = class(TOCGenericImport<NSUnitConverterLinearClass,
    NSUnitConverterLinear>)
  end;

  PNSUnitConverterLinear = Pointer;

  NSUnitClass = interface(NSObjectClass)
    ['{8D4A710C-5BB9-4F16-A986-DF2F2AB4A670}']
    { class } function new: Pointer { instancetype }; cdecl;
  end;

  NSUnit = interface(NSObject)
    ['{E0368A09-EE7D-4313-B11D-9CA1B8DC115A}']
    function symbol: NSString; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithSymbol(symbol: NSString): Pointer { instancetype }; cdecl;
  end;

  TNSUnit = class(TOCGenericImport<NSUnitClass, NSUnit>)
  end;

  PNSUnit = Pointer;

  NSDimensionClass = interface(NSUnitClass)
    ['{299C7983-DCB6-48EC-A563-80F288005BD4}']
    { class } function baseUnit: Pointer { instancetype }; cdecl;
  end;

  NSDimension = interface(NSUnit)
    ['{2C375041-0513-4A65-92FD-23EF45F4346C}']
    function converter: NSUnitConverter; cdecl;
    function initWithSymbol(symbol: NSString; converter: NSUnitConverter)
      : Pointer { instancetype }; cdecl;
  end;

  TNSDimension = class(TOCGenericImport<NSDimensionClass, NSDimension>)
  end;

  PNSDimension = Pointer;

  NSUnitAccelerationClass = interface(NSDimensionClass)
    ['{6AA13974-3DDC-4808-866B-5F19CA854D4A}']
  end;

  NSUnitAcceleration = interface(NSDimension)
    ['{7751D39E-64EA-4778-A79E-DE483A2E8BA2}']
    procedure setMetersPerSecondSquared(metersPerSecondSquared
      : NSUnitAcceleration); cdecl;
    function metersPerSecondSquared: NSUnitAcceleration; cdecl;
    procedure setGravity(gravity: NSUnitAcceleration); cdecl;
    function gravity: NSUnitAcceleration; cdecl;
  end;

  TNSUnitAcceleration = class(TOCGenericImport<NSUnitAccelerationClass,
    NSUnitAcceleration>)
  end;

  PNSUnitAcceleration = Pointer;

  NSUnitAngleClass = interface(NSDimensionClass)
    ['{5F08C314-483A-4411-8A5B-1EB93BE3B64A}']
  end;

  NSUnitAngle = interface(NSDimension)
    ['{605F8408-FBBD-4E59-9DEB-9524FF6F945F}']
    procedure setDegrees(degrees: NSUnitAngle); cdecl;
    function degrees: NSUnitAngle; cdecl;
    procedure setArcMinutes(arcMinutes: NSUnitAngle); cdecl;
    function arcMinutes: NSUnitAngle; cdecl;
    procedure setArcSeconds(arcSeconds: NSUnitAngle); cdecl;
    function arcSeconds: NSUnitAngle; cdecl;
    procedure setRadians(radians: NSUnitAngle); cdecl;
    function radians: NSUnitAngle; cdecl;
    procedure setGradians(gradians: NSUnitAngle); cdecl;
    function gradians: NSUnitAngle; cdecl;
    procedure setRevolutions(revolutions: NSUnitAngle); cdecl;
    function revolutions: NSUnitAngle; cdecl;
  end;

  TNSUnitAngle = class(TOCGenericImport<NSUnitAngleClass, NSUnitAngle>)
  end;

  PNSUnitAngle = Pointer;

  NSUnitAreaClass = interface(NSDimensionClass)
    ['{3C941214-5B1C-413E-A3C9-C03107B378C1}']
  end;

  NSUnitArea = interface(NSDimension)
    ['{54448F42-E412-4E9A-9267-137393E22C69}']
    procedure setSquareMegameters(squareMegameters: NSUnitArea); cdecl;
    function squareMegameters: NSUnitArea; cdecl;
    procedure setSquareKilometers(squareKilometers: NSUnitArea); cdecl;
    function squareKilometers: NSUnitArea; cdecl;
    procedure setSquareMeters(squareMeters: NSUnitArea); cdecl;
    function squareMeters: NSUnitArea; cdecl;
    procedure setSquareCentimeters(squareCentimeters: NSUnitArea); cdecl;
    function squareCentimeters: NSUnitArea; cdecl;
    procedure setSquareMillimeters(squareMillimeters: NSUnitArea); cdecl;
    function squareMillimeters: NSUnitArea; cdecl;
    procedure setSquareMicrometers(squareMicrometers: NSUnitArea); cdecl;
    function squareMicrometers: NSUnitArea; cdecl;
    procedure setSquareNanometers(squareNanometers: NSUnitArea); cdecl;
    function squareNanometers: NSUnitArea; cdecl;
    procedure setSquareInches(squareInches: NSUnitArea); cdecl;
    function squareInches: NSUnitArea; cdecl;
    procedure setSquareFeet(squareFeet: NSUnitArea); cdecl;
    function squareFeet: NSUnitArea; cdecl;
    procedure setSquareYards(squareYards: NSUnitArea); cdecl;
    function squareYards: NSUnitArea; cdecl;
    procedure setSquareMiles(squareMiles: NSUnitArea); cdecl;
    function squareMiles: NSUnitArea; cdecl;
    procedure setAcres(acres: NSUnitArea); cdecl;
    function acres: NSUnitArea; cdecl;
    procedure setAres(ares: NSUnitArea); cdecl;
    function ares: NSUnitArea; cdecl;
    procedure setHectares(hectares: NSUnitArea); cdecl;
    function hectares: NSUnitArea; cdecl;
  end;

  TNSUnitArea = class(TOCGenericImport<NSUnitAreaClass, NSUnitArea>)
  end;

  PNSUnitArea = Pointer;

  NSUnitConcentrationMassClass = interface(NSDimensionClass)
    ['{A5AB3ABE-CA1C-42C0-922F-27E21A3B7A82}']
    { class } function millimolesPerLiterWithGramsPerMole(gramsPerMole: Double)
      : NSUnitConcentrationMass; cdecl;
  end;

  NSUnitConcentrationMass = interface(NSDimension)
    ['{FCE42006-9D26-4D60-9E04-713E68E056FA}']
    procedure setGramsPerLiter(gramsPerLiter: NSUnitConcentrationMass); cdecl;
    function gramsPerLiter: NSUnitConcentrationMass; cdecl;
    procedure setMilligramsPerDeciliter(milligramsPerDeciliter
      : NSUnitConcentrationMass); cdecl;
    function milligramsPerDeciliter: NSUnitConcentrationMass; cdecl;
  end;

  TNSUnitConcentrationMass = class
    (TOCGenericImport<NSUnitConcentrationMassClass, NSUnitConcentrationMass>)
  end;

  PNSUnitConcentrationMass = Pointer;

  NSUnitDispersionClass = interface(NSDimensionClass)
    ['{E8F027F6-9AA7-4590-8D56-36A50864218A}']
  end;

  NSUnitDispersion = interface(NSDimension)
    ['{5198C6D1-C6E9-461C-98A2-32D6CB76F9E2}']
    procedure setPartsPerMillion(partsPerMillion: NSUnitDispersion); cdecl;
    function partsPerMillion: NSUnitDispersion; cdecl;
  end;

  TNSUnitDispersion = class(TOCGenericImport<NSUnitDispersionClass,
    NSUnitDispersion>)
  end;

  PNSUnitDispersion = Pointer;

  NSUnitDurationClass = interface(NSDimensionClass)
    ['{1F8F5964-B4D2-4075-B561-DDD9C8E5893A}']
  end;

  NSUnitDuration = interface(NSDimension)
    ['{63D52DB6-24B2-4E45-9C63-C4AB0537AF32}']
    procedure setHours(hours: NSUnitDuration); cdecl;
    function hours: NSUnitDuration; cdecl;
    procedure setMinutes(minutes: NSUnitDuration); cdecl;
    function minutes: NSUnitDuration; cdecl;
    procedure setSeconds(seconds: NSUnitDuration); cdecl;
    function seconds: NSUnitDuration; cdecl;
    procedure setMilliseconds(milliseconds: NSUnitDuration); cdecl;
    function milliseconds: NSUnitDuration; cdecl;
    procedure setMicroseconds(microseconds: NSUnitDuration); cdecl;
    function microseconds: NSUnitDuration; cdecl;
    procedure setNanoseconds(nanoseconds: NSUnitDuration); cdecl;
    function nanoseconds: NSUnitDuration; cdecl;
    procedure setPicoseconds(picoseconds: NSUnitDuration); cdecl;
    function picoseconds: NSUnitDuration; cdecl;
  end;

  TNSUnitDuration = class(TOCGenericImport<NSUnitDurationClass, NSUnitDuration>)
  end;

  PNSUnitDuration = Pointer;

  NSUnitElectricChargeClass = interface(NSDimensionClass)
    ['{01BA4AA7-7232-4A25-8905-802275F41593}']
  end;

  NSUnitElectricCharge = interface(NSDimension)
    ['{97556214-1482-4F73-A6F1-CF38085844EF}']
    procedure setCoulombs(coulombs: NSUnitElectricCharge); cdecl;
    function coulombs: NSUnitElectricCharge; cdecl;
    procedure setMegaampereHours(megaampereHours: NSUnitElectricCharge); cdecl;
    function megaampereHours: NSUnitElectricCharge; cdecl;
    procedure setKiloampereHours(kiloampereHours: NSUnitElectricCharge); cdecl;
    function kiloampereHours: NSUnitElectricCharge; cdecl;
    procedure setAmpereHours(ampereHours: NSUnitElectricCharge); cdecl;
    function ampereHours: NSUnitElectricCharge; cdecl;
    procedure setMilliampereHours(milliampereHours
      : NSUnitElectricCharge); cdecl;
    function milliampereHours: NSUnitElectricCharge; cdecl;
    procedure setMicroampereHours(microampereHours
      : NSUnitElectricCharge); cdecl;
    function microampereHours: NSUnitElectricCharge; cdecl;
  end;

  TNSUnitElectricCharge = class(TOCGenericImport<NSUnitElectricChargeClass,
    NSUnitElectricCharge>)
  end;

  PNSUnitElectricCharge = Pointer;

  NSUnitElectricCurrentClass = interface(NSDimensionClass)
    ['{B73CB5CE-1500-4E99-93B0-7308EB821F2E}']
  end;

  NSUnitElectricCurrent = interface(NSDimension)
    ['{5B475895-7393-422C-9F86-94782AE5A3B2}']
    procedure setMegaamperes(megaamperes: NSUnitElectricCurrent); cdecl;
    function megaamperes: NSUnitElectricCurrent; cdecl;
    procedure setKiloamperes(kiloamperes: NSUnitElectricCurrent); cdecl;
    function kiloamperes: NSUnitElectricCurrent; cdecl;
    procedure setAmperes(amperes: NSUnitElectricCurrent); cdecl;
    function amperes: NSUnitElectricCurrent; cdecl;
    procedure setMilliamperes(milliamperes: NSUnitElectricCurrent); cdecl;
    function milliamperes: NSUnitElectricCurrent; cdecl;
    procedure setMicroamperes(microamperes: NSUnitElectricCurrent); cdecl;
    function microamperes: NSUnitElectricCurrent; cdecl;
  end;

  TNSUnitElectricCurrent = class(TOCGenericImport<NSUnitElectricCurrentClass,
    NSUnitElectricCurrent>)
  end;

  PNSUnitElectricCurrent = Pointer;

  NSUnitElectricPotentialDifferenceClass = interface(NSDimensionClass)
    ['{24E075A9-BA4F-429B-8290-A756FE0A0217}']
  end;

  NSUnitElectricPotentialDifference = interface(NSDimension)
    ['{5CE6D9A3-D2D0-4A99-A5BE-E2491BDA72F0}']
    procedure setMegavolts(megavolts: NSUnitElectricPotentialDifference); cdecl;
    function megavolts: NSUnitElectricPotentialDifference; cdecl;
    procedure setKilovolts(kilovolts: NSUnitElectricPotentialDifference); cdecl;
    function kilovolts: NSUnitElectricPotentialDifference; cdecl;
    procedure setVolts(volts: NSUnitElectricPotentialDifference); cdecl;
    function volts: NSUnitElectricPotentialDifference; cdecl;
    procedure setMillivolts(millivolts
      : NSUnitElectricPotentialDifference); cdecl;
    function millivolts: NSUnitElectricPotentialDifference; cdecl;
    procedure setMicrovolts(microvolts
      : NSUnitElectricPotentialDifference); cdecl;
    function microvolts: NSUnitElectricPotentialDifference; cdecl;
  end;

  TNSUnitElectricPotentialDifference = class
    (TOCGenericImport<NSUnitElectricPotentialDifferenceClass,
    NSUnitElectricPotentialDifference>)
  end;

  PNSUnitElectricPotentialDifference = Pointer;

  NSUnitElectricResistanceClass = interface(NSDimensionClass)
    ['{123EA169-9CC6-46E0-BCA6-C9116D7EF771}']
  end;

  NSUnitElectricResistance = interface(NSDimension)
    ['{109F25B7-E144-4C23-AF6D-6FA26DD392B3}']
    procedure setMegaohms(megaohms: NSUnitElectricResistance); cdecl;
    function megaohms: NSUnitElectricResistance; cdecl;
    procedure setKiloohms(kiloohms: NSUnitElectricResistance); cdecl;
    function kiloohms: NSUnitElectricResistance; cdecl;
    procedure setOhms(ohms: NSUnitElectricResistance); cdecl;
    function ohms: NSUnitElectricResistance; cdecl;
    procedure setMilliohms(milliohms: NSUnitElectricResistance); cdecl;
    function milliohms: NSUnitElectricResistance; cdecl;
    procedure setMicroohms(microohms: NSUnitElectricResistance); cdecl;
    function microohms: NSUnitElectricResistance; cdecl;
  end;

  TNSUnitElectricResistance = class
    (TOCGenericImport<NSUnitElectricResistanceClass, NSUnitElectricResistance>)
  end;

  PNSUnitElectricResistance = Pointer;

  NSUnitEnergyClass = interface(NSDimensionClass)
    ['{C2D1B4AF-9E2E-4B6E-8378-4893BC33F6C7}']
  end;

  NSUnitEnergy = interface(NSDimension)
    ['{DFD7AE46-D202-4C7D-9679-33E185BAF284}']
    procedure setKilojoules(kilojoules: NSUnitEnergy); cdecl;
    function kilojoules: NSUnitEnergy; cdecl;
    procedure setJoules(joules: NSUnitEnergy); cdecl;
    function joules: NSUnitEnergy; cdecl;
    procedure setKilocalories(kilocalories: NSUnitEnergy); cdecl;
    function kilocalories: NSUnitEnergy; cdecl;
    procedure setCalories(calories: NSUnitEnergy); cdecl;
    function calories: NSUnitEnergy; cdecl;
    procedure setKilowattHours(kilowattHours: NSUnitEnergy); cdecl;
    function kilowattHours: NSUnitEnergy; cdecl;
  end;

  TNSUnitEnergy = class(TOCGenericImport<NSUnitEnergyClass, NSUnitEnergy>)
  end;

  PNSUnitEnergy = Pointer;

  NSUnitFrequencyClass = interface(NSDimensionClass)
    ['{6A7FC724-7FF5-4DD5-A2D2-EC2A1AB77310}']
  end;

  NSUnitFrequency = interface(NSDimension)
    ['{3DAD19DE-AF48-432E-B784-07693262F759}']
    procedure setTerahertz(terahertz: NSUnitFrequency); cdecl;
    function terahertz: NSUnitFrequency; cdecl;
    procedure setGigahertz(gigahertz: NSUnitFrequency); cdecl;
    function gigahertz: NSUnitFrequency; cdecl;
    procedure setMegahertz(megahertz: NSUnitFrequency); cdecl;
    function megahertz: NSUnitFrequency; cdecl;
    procedure setKilohertz(kilohertz: NSUnitFrequency); cdecl;
    function kilohertz: NSUnitFrequency; cdecl;
    procedure setHertz(hertz: NSUnitFrequency); cdecl;
    function hertz: NSUnitFrequency; cdecl;
    procedure setMillihertz(millihertz: NSUnitFrequency); cdecl;
    function millihertz: NSUnitFrequency; cdecl;
    procedure setMicrohertz(microhertz: NSUnitFrequency); cdecl;
    function microhertz: NSUnitFrequency; cdecl;
    procedure setNanohertz(nanohertz: NSUnitFrequency); cdecl;
    function nanohertz: NSUnitFrequency; cdecl;
    procedure setFramesPerSecond(framesPerSecond: NSUnitFrequency); cdecl;
    function framesPerSecond: NSUnitFrequency; cdecl;
  end;

  TNSUnitFrequency = class(TOCGenericImport<NSUnitFrequencyClass,
    NSUnitFrequency>)
  end;

  PNSUnitFrequency = Pointer;

  NSUnitFuelEfficiencyClass = interface(NSDimensionClass)
    ['{0F4CDC0B-3A2A-41C5-9CB0-1035DAD4A362}']
  end;

  NSUnitFuelEfficiency = interface(NSDimension)
    ['{0CEB9224-8C92-4187-9AD6-74B4D0D9E5AB}']
    procedure setLitersPer100Kilometers(litersPer100Kilometers
      : NSUnitFuelEfficiency); cdecl;
    function litersPer100Kilometers: NSUnitFuelEfficiency; cdecl;
    procedure setMilesPerImperialGallon(milesPerImperialGallon
      : NSUnitFuelEfficiency); cdecl;
    function milesPerImperialGallon: NSUnitFuelEfficiency; cdecl;
    procedure setMilesPerGallon(milesPerGallon: NSUnitFuelEfficiency); cdecl;
    function milesPerGallon: NSUnitFuelEfficiency; cdecl;
  end;

  TNSUnitFuelEfficiency = class(TOCGenericImport<NSUnitFuelEfficiencyClass,
    NSUnitFuelEfficiency>)
  end;

  PNSUnitFuelEfficiency = Pointer;

  NSUnitInformationStorageClass = interface(NSDimensionClass)
    ['{6A34F9F8-E013-4364-8F88-ABBBB265F8F9}']
  end;

  NSUnitInformationStorage = interface(NSDimension)
    ['{A40BA4DC-D34F-4D91-89D3-76D699911628}']
    function bytes: NSUnitInformationStorage; cdecl;
    function bits: NSUnitInformationStorage; cdecl;
    function nibbles: NSUnitInformationStorage; cdecl;
    function yottabytes: NSUnitInformationStorage; cdecl;
    function zettabytes: NSUnitInformationStorage; cdecl;
    function exabytes: NSUnitInformationStorage; cdecl;
    function petabytes: NSUnitInformationStorage; cdecl;
    function terabytes: NSUnitInformationStorage; cdecl;
    function gigabytes: NSUnitInformationStorage; cdecl;
    function megabytes: NSUnitInformationStorage; cdecl;
    function kilobytes: NSUnitInformationStorage; cdecl;
    function yottabits: NSUnitInformationStorage; cdecl;
    function zettabits: NSUnitInformationStorage; cdecl;
    function exabits: NSUnitInformationStorage; cdecl;
    function petabits: NSUnitInformationStorage; cdecl;
    function terabits: NSUnitInformationStorage; cdecl;
    function gigabits: NSUnitInformationStorage; cdecl;
    function megabits: NSUnitInformationStorage; cdecl;
    function kilobits: NSUnitInformationStorage; cdecl;
    function yobibytes: NSUnitInformationStorage; cdecl;
    function zebibytes: NSUnitInformationStorage; cdecl;
    function exbibytes: NSUnitInformationStorage; cdecl;
    function pebibytes: NSUnitInformationStorage; cdecl;
    function tebibytes: NSUnitInformationStorage; cdecl;
    function gibibytes: NSUnitInformationStorage; cdecl;
    function mebibytes: NSUnitInformationStorage; cdecl;
    function kibibytes: NSUnitInformationStorage; cdecl;
    function yobibits: NSUnitInformationStorage; cdecl;
    function zebibits: NSUnitInformationStorage; cdecl;
    function exbibits: NSUnitInformationStorage; cdecl;
    function pebibits: NSUnitInformationStorage; cdecl;
    function tebibits: NSUnitInformationStorage; cdecl;
    function gibibits: NSUnitInformationStorage; cdecl;
    function mebibits: NSUnitInformationStorage; cdecl;
    function kibibits: NSUnitInformationStorage; cdecl;
  end;

  TNSUnitInformationStorage = class
    (TOCGenericImport<NSUnitInformationStorageClass, NSUnitInformationStorage>)
  end;

  PNSUnitInformationStorage = Pointer;

  NSUnitLengthClass = interface(NSDimensionClass)
    ['{6AE836AB-8E66-4952-81E4-8C19CE28DAA1}']
  end;

  NSUnitLength = interface(NSDimension)
    ['{BAC0301D-25CC-4237-B791-5695CBE032C1}']
    procedure setMegameters(megameters: NSUnitLength); cdecl;
    function megameters: NSUnitLength; cdecl;
    procedure setKilometers(kilometers: NSUnitLength); cdecl;
    function kilometers: NSUnitLength; cdecl;
    procedure setHectometers(hectometers: NSUnitLength); cdecl;
    function hectometers: NSUnitLength; cdecl;
    procedure setDecameters(decameters: NSUnitLength); cdecl;
    function decameters: NSUnitLength; cdecl;
    procedure setMeters(meters: NSUnitLength); cdecl;
    function meters: NSUnitLength; cdecl;
    procedure setDecimeters(decimeters: NSUnitLength); cdecl;
    function decimeters: NSUnitLength; cdecl;
    procedure setCentimeters(centimeters: NSUnitLength); cdecl;
    function centimeters: NSUnitLength; cdecl;
    procedure setMillimeters(millimeters: NSUnitLength); cdecl;
    function millimeters: NSUnitLength; cdecl;
    procedure setMicrometers(micrometers: NSUnitLength); cdecl;
    function micrometers: NSUnitLength; cdecl;
    procedure setNanometers(nanometers: NSUnitLength); cdecl;
    function nanometers: NSUnitLength; cdecl;
    procedure setPicometers(picometers: NSUnitLength); cdecl;
    function picometers: NSUnitLength; cdecl;
    procedure setInches(inches: NSUnitLength); cdecl;
    function inches: NSUnitLength; cdecl;
    procedure setFeet(feet: NSUnitLength); cdecl;
    function feet: NSUnitLength; cdecl;
    procedure setYards(yards: NSUnitLength); cdecl;
    function yards: NSUnitLength; cdecl;
    procedure setMiles(miles: NSUnitLength); cdecl;
    function miles: NSUnitLength; cdecl;
    procedure setScandinavianMiles(scandinavianMiles: NSUnitLength); cdecl;
    function scandinavianMiles: NSUnitLength; cdecl;
    procedure setLightyears(lightyears: NSUnitLength); cdecl;
    function lightyears: NSUnitLength; cdecl;
    procedure setNauticalMiles(nauticalMiles: NSUnitLength); cdecl;
    function nauticalMiles: NSUnitLength; cdecl;
    procedure setFathoms(fathoms: NSUnitLength); cdecl;
    function fathoms: NSUnitLength; cdecl;
    procedure setFurlongs(furlongs: NSUnitLength); cdecl;
    function furlongs: NSUnitLength; cdecl;
    procedure setAstronomicalUnits(astronomicalUnits: NSUnitLength); cdecl;
    function astronomicalUnits: NSUnitLength; cdecl;
    procedure setParsecs(parsecs: NSUnitLength); cdecl;
    function parsecs: NSUnitLength; cdecl;
  end;

  TNSUnitLength = class(TOCGenericImport<NSUnitLengthClass, NSUnitLength>)
  end;

  PNSUnitLength = Pointer;

  NSUnitIlluminanceClass = interface(NSDimensionClass)
    ['{AC8A9A3B-A8DE-4801-BE4C-BABAECD8C89C}']
  end;

  NSUnitIlluminance = interface(NSDimension)
    ['{0748839E-475E-4415-A971-62AC2D527531}']
    procedure setLux(lux: NSUnitIlluminance); cdecl;
    function lux: NSUnitIlluminance; cdecl;
  end;

  TNSUnitIlluminance = class(TOCGenericImport<NSUnitIlluminanceClass,
    NSUnitIlluminance>)
  end;

  PNSUnitIlluminance = Pointer;

  NSUnitMassClass = interface(NSDimensionClass)
    ['{581291F2-8C07-46E4-8A6C-0D9A117E297F}']
  end;

  NSUnitMass = interface(NSDimension)
    ['{2B37D196-A420-4C94-A125-0C77EB2DDC86}']
    procedure setKilograms(kilograms: NSUnitMass); cdecl;
    function kilograms: NSUnitMass; cdecl;
    procedure setGrams(grams: NSUnitMass); cdecl;
    function grams: NSUnitMass; cdecl;
    procedure setDecigrams(decigrams: NSUnitMass); cdecl;
    function decigrams: NSUnitMass; cdecl;
    procedure setCentigrams(centigrams: NSUnitMass); cdecl;
    function centigrams: NSUnitMass; cdecl;
    procedure setMilligrams(milligrams: NSUnitMass); cdecl;
    function milligrams: NSUnitMass; cdecl;
    procedure setMicrograms(micrograms: NSUnitMass); cdecl;
    function micrograms: NSUnitMass; cdecl;
    procedure setNanograms(nanograms: NSUnitMass); cdecl;
    function nanograms: NSUnitMass; cdecl;
    procedure setPicograms(picograms: NSUnitMass); cdecl;
    function picograms: NSUnitMass; cdecl;
    procedure setOunces(ounces: NSUnitMass); cdecl;
    function ounces: NSUnitMass; cdecl;
    procedure setPoundsMass(poundsMass: NSUnitMass); cdecl;
    function poundsMass: NSUnitMass; cdecl;
    procedure setStones(stones: NSUnitMass); cdecl;
    function stones: NSUnitMass; cdecl;
    procedure setMetricTons(metricTons: NSUnitMass); cdecl;
    function metricTons: NSUnitMass; cdecl;
    procedure setShortTons(shortTons: NSUnitMass); cdecl;
    function shortTons: NSUnitMass; cdecl;
    procedure setCarats(carats: NSUnitMass); cdecl;
    function carats: NSUnitMass; cdecl;
    procedure setOuncesTroy(ouncesTroy: NSUnitMass); cdecl;
    function ouncesTroy: NSUnitMass; cdecl;
    procedure setSlugs(slugs: NSUnitMass); cdecl;
    function slugs: NSUnitMass; cdecl;
  end;

  TNSUnitMass = class(TOCGenericImport<NSUnitMassClass, NSUnitMass>)
  end;

  PNSUnitMass = Pointer;

  NSUnitPowerClass = interface(NSDimensionClass)
    ['{8D5CAE6E-0AC0-4480-8298-F9F46CC3620B}']
  end;

  NSUnitPower = interface(NSDimension)
    ['{19F08630-A7BC-49F7-AD56-EE52ADFAC4D4}']
    procedure setTerawatts(terawatts: NSUnitPower); cdecl;
    function terawatts: NSUnitPower; cdecl;
    procedure setGigawatts(gigawatts: NSUnitPower); cdecl;
    function gigawatts: NSUnitPower; cdecl;
    procedure setMegawatts(megawatts: NSUnitPower); cdecl;
    function megawatts: NSUnitPower; cdecl;
    procedure setKilowatts(kilowatts: NSUnitPower); cdecl;
    function kilowatts: NSUnitPower; cdecl;
    procedure setWatts(watts: NSUnitPower); cdecl;
    function watts: NSUnitPower; cdecl;
    procedure setMilliwatts(milliwatts: NSUnitPower); cdecl;
    function milliwatts: NSUnitPower; cdecl;
    procedure setMicrowatts(microwatts: NSUnitPower); cdecl;
    function microwatts: NSUnitPower; cdecl;
    procedure setNanowatts(nanowatts: NSUnitPower); cdecl;
    function nanowatts: NSUnitPower; cdecl;
    procedure setPicowatts(picowatts: NSUnitPower); cdecl;
    function picowatts: NSUnitPower; cdecl;
    procedure setFemtowatts(femtowatts: NSUnitPower); cdecl;
    function femtowatts: NSUnitPower; cdecl;
    procedure setHorsepower(horsepower: NSUnitPower); cdecl;
    function horsepower: NSUnitPower; cdecl;
  end;

  TNSUnitPower = class(TOCGenericImport<NSUnitPowerClass, NSUnitPower>)
  end;

  PNSUnitPower = Pointer;

  NSUnitPressureClass = interface(NSDimensionClass)
    ['{CADA2DAA-5687-4563-B95D-BF665CE2633E}']
  end;

  NSUnitPressure = interface(NSDimension)
    ['{BB7F0C7F-D3E8-40F1-B5B6-87B4940F56D5}']
    procedure setNewtonsPerMetersSquared(newtonsPerMetersSquared
      : NSUnitPressure); cdecl;
    function newtonsPerMetersSquared: NSUnitPressure; cdecl;
    procedure setGigapascals(gigapascals: NSUnitPressure); cdecl;
    function gigapascals: NSUnitPressure; cdecl;
    procedure setMegapascals(megapascals: NSUnitPressure); cdecl;
    function megapascals: NSUnitPressure; cdecl;
    procedure setKilopascals(kilopascals: NSUnitPressure); cdecl;
    function kilopascals: NSUnitPressure; cdecl;
    procedure setHectopascals(hectopascals: NSUnitPressure); cdecl;
    function hectopascals: NSUnitPressure; cdecl;
    procedure setInchesOfMercury(inchesOfMercury: NSUnitPressure); cdecl;
    function inchesOfMercury: NSUnitPressure; cdecl;
    procedure setBars(bars: NSUnitPressure); cdecl;
    function bars: NSUnitPressure; cdecl;
    procedure setMillibars(millibars: NSUnitPressure); cdecl;
    function millibars: NSUnitPressure; cdecl;
    procedure setMillimetersOfMercury(millimetersOfMercury
      : NSUnitPressure); cdecl;
    function millimetersOfMercury: NSUnitPressure; cdecl;
    procedure setPoundsForcePerSquareInch(poundsForcePerSquareInch
      : NSUnitPressure); cdecl;
    function poundsForcePerSquareInch: NSUnitPressure; cdecl;
  end;

  TNSUnitPressure = class(TOCGenericImport<NSUnitPressureClass, NSUnitPressure>)
  end;

  PNSUnitPressure = Pointer;

  NSUnitSpeedClass = interface(NSDimensionClass)
    ['{73E81FE3-A8D3-4D53-B281-DD8367628C06}']
  end;

  NSUnitSpeed = interface(NSDimension)
    ['{8412F9A1-F02E-4A7A-8B82-E4971E344192}']
    procedure setMetersPerSecond(metersPerSecond: NSUnitSpeed); cdecl;
    function metersPerSecond: NSUnitSpeed; cdecl;
    procedure setKilometersPerHour(kilometersPerHour: NSUnitSpeed); cdecl;
    function kilometersPerHour: NSUnitSpeed; cdecl;
    procedure setMilesPerHour(milesPerHour: NSUnitSpeed); cdecl;
    function milesPerHour: NSUnitSpeed; cdecl;
    procedure setKnots(knots: NSUnitSpeed); cdecl;
    function knots: NSUnitSpeed; cdecl;
  end;

  TNSUnitSpeed = class(TOCGenericImport<NSUnitSpeedClass, NSUnitSpeed>)
  end;

  PNSUnitSpeed = Pointer;

  NSUnitTemperatureClass = interface(NSDimensionClass)
    ['{B5E217F0-FBEE-4BEC-A59E-D8CD2DD2BA7D}']
  end;

  NSUnitTemperature = interface(NSDimension)
    ['{CDF35C74-E982-4762-A006-9C9EEE8CA078}']
    procedure setKelvin(kelvin: NSUnitTemperature); cdecl;
    function kelvin: NSUnitTemperature; cdecl;
    procedure setCelsius(celsius: NSUnitTemperature); cdecl;
    function celsius: NSUnitTemperature; cdecl;
    procedure setFahrenheit(fahrenheit: NSUnitTemperature); cdecl;
    function fahrenheit: NSUnitTemperature; cdecl;
  end;

  TNSUnitTemperature = class(TOCGenericImport<NSUnitTemperatureClass,
    NSUnitTemperature>)
  end;

  PNSUnitTemperature = Pointer;

  NSUnitVolumeClass = interface(NSDimensionClass)
    ['{31127D4D-29E7-42F3-828D-507B210160C5}']
  end;

  NSUnitVolume = interface(NSDimension)
    ['{C2A92F87-2B98-4632-9091-43351B84231D}']
    procedure setMegaliters(megaliters: NSUnitVolume); cdecl;
    function megaliters: NSUnitVolume; cdecl;
    procedure setKiloliters(kiloliters: NSUnitVolume); cdecl;
    function kiloliters: NSUnitVolume; cdecl;
    procedure setLiters(liters: NSUnitVolume); cdecl;
    function liters: NSUnitVolume; cdecl;
    procedure setDeciliters(deciliters: NSUnitVolume); cdecl;
    function deciliters: NSUnitVolume; cdecl;
    procedure setCentiliters(centiliters: NSUnitVolume); cdecl;
    function centiliters: NSUnitVolume; cdecl;
    procedure setMilliliters(milliliters: NSUnitVolume); cdecl;
    function milliliters: NSUnitVolume; cdecl;
    procedure setCubicKilometers(cubicKilometers: NSUnitVolume); cdecl;
    function cubicKilometers: NSUnitVolume; cdecl;
    procedure setCubicMeters(cubicMeters: NSUnitVolume); cdecl;
    function cubicMeters: NSUnitVolume; cdecl;
    procedure setCubicDecimeters(cubicDecimeters: NSUnitVolume); cdecl;
    function cubicDecimeters: NSUnitVolume; cdecl;
    procedure setCubicCentimeters(cubicCentimeters: NSUnitVolume); cdecl;
    function cubicCentimeters: NSUnitVolume; cdecl;
    procedure setCubicMillimeters(cubicMillimeters: NSUnitVolume); cdecl;
    function cubicMillimeters: NSUnitVolume; cdecl;
    procedure setCubicInches(cubicInches: NSUnitVolume); cdecl;
    function cubicInches: NSUnitVolume; cdecl;
    procedure setCubicFeet(cubicFeet: NSUnitVolume); cdecl;
    function cubicFeet: NSUnitVolume; cdecl;
    procedure setCubicYards(cubicYards: NSUnitVolume); cdecl;
    function cubicYards: NSUnitVolume; cdecl;
    procedure setCubicMiles(cubicMiles: NSUnitVolume); cdecl;
    function cubicMiles: NSUnitVolume; cdecl;
    procedure setAcreFeet(acreFeet: NSUnitVolume); cdecl;
    function acreFeet: NSUnitVolume; cdecl;
    procedure setBushels(bushels: NSUnitVolume); cdecl;
    function bushels: NSUnitVolume; cdecl;
    procedure setTeaspoons(teaspoons: NSUnitVolume); cdecl;
    function teaspoons: NSUnitVolume; cdecl;
    procedure setTablespoons(tablespoons: NSUnitVolume); cdecl;
    function tablespoons: NSUnitVolume; cdecl;
    procedure setFluidOunces(fluidOunces: NSUnitVolume); cdecl;
    function fluidOunces: NSUnitVolume; cdecl;
    procedure setCups(cups: NSUnitVolume); cdecl;
    function cups: NSUnitVolume; cdecl;
    procedure setPints(pints: NSUnitVolume); cdecl;
    function pints: NSUnitVolume; cdecl;
    procedure setQuarts(quarts: NSUnitVolume); cdecl;
    function quarts: NSUnitVolume; cdecl;
    procedure setGallons(gallons: NSUnitVolume); cdecl;
    function gallons: NSUnitVolume; cdecl;
    procedure setImperialTeaspoons(imperialTeaspoons: NSUnitVolume); cdecl;
    function imperialTeaspoons: NSUnitVolume; cdecl;
    procedure setImperialTablespoons(imperialTablespoons: NSUnitVolume); cdecl;
    function imperialTablespoons: NSUnitVolume; cdecl;
    procedure setImperialFluidOunces(imperialFluidOunces: NSUnitVolume); cdecl;
    function imperialFluidOunces: NSUnitVolume; cdecl;
    procedure setImperialPints(imperialPints: NSUnitVolume); cdecl;
    function imperialPints: NSUnitVolume; cdecl;
    procedure setImperialQuarts(imperialQuarts: NSUnitVolume); cdecl;
    function imperialQuarts: NSUnitVolume; cdecl;
    procedure setImperialGallons(imperialGallons: NSUnitVolume); cdecl;
    function imperialGallons: NSUnitVolume; cdecl;
    procedure setMetricCups(metricCups: NSUnitVolume); cdecl;
    function metricCups: NSUnitVolume; cdecl;
  end;

  TNSUnitVolume = class(TOCGenericImport<NSUnitVolumeClass, NSUnitVolume>)
  end;

  PNSUnitVolume = Pointer;

  NSMeasurementClass = interface(NSObjectClass)
    ['{EF577F58-A5DC-470E-BE03-5C7F9C505431}']
  end;

  NSMeasurement = interface(NSObject)
    ['{52168420-9639-46B4-B64F-1BE5EF988477}']
    function &unit: UnitType; cdecl;
    function doubleValue: Double; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithDoubleValue(doubleValue: Double; &unit: UnitType)
      : Pointer { instancetype }; cdecl;
    function canBeConvertedToUnit(&unit: NSUnit): Boolean; cdecl;
    function measurementByConvertingToUnit(&unit: NSUnit): NSMeasurement; cdecl;
    function measurementByAddingMeasurement(measurement: NSMeasurement)
      : NSMeasurement; cdecl;
    function measurementBySubtractingMeasurement(measurement: NSMeasurement)
      : NSMeasurement; cdecl;
  end;

  TNSMeasurement = class(TOCGenericImport<NSMeasurementClass, NSMeasurement>)
  end;

  PNSMeasurement = Pointer;

  NSRecursiveLockClass = interface(NSObjectClass)
    ['{257F08B6-708C-4FC1-805E-86D9090F3E84}']
  end;

  NSRecursiveLock = interface(NSObject)
    ['{CAFEEF8E-4EAE-4F2A-821F-D801115D9100}']
    function tryLock: Boolean; cdecl;
    function lockBeforeDate(limit: NSDate): Boolean; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TNSRecursiveLock = class(TOCGenericImport<NSRecursiveLockClass,
    NSRecursiveLock>)
  end;

  PNSRecursiveLock = Pointer;

  NSCacheClass = interface(NSObjectClass)
    ['{0BCDC8F8-F391-4B2C-97A1-590BEE4B1221}']
  end;

  NSCache = interface(NSObject)
    ['{3ED3300D-4C83-4883-AC90-4A4D639B0874}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function objectForKey(key: KeyType): ObjectType; cdecl;
    [MethodName('setObject:forKey:')]
    procedure setObjectForKey(obj: ObjectType; forKey: KeyType); cdecl;
    [MethodName('setObject:forKey:cost:')]
    procedure setObjectForKeyCost(obj: ObjectType; forKey: KeyType;
      cost: NSUInteger); cdecl;
    procedure removeObjectForKey(key: KeyType); cdecl;
    procedure removeAllObjects; cdecl;
    procedure setTotalCostLimit(totalCostLimit: NSUInteger); cdecl;
    function totalCostLimit: NSUInteger; cdecl;
    procedure setCountLimit(countLimit: NSUInteger); cdecl;
    function countLimit: NSUInteger; cdecl;
    procedure setEvictsObjectsWithDiscardedContent
      (evictsObjectsWithDiscardedContent: Boolean); cdecl;
    function evictsObjectsWithDiscardedContent: Boolean; cdecl;
  end;

  TNSCache = class(TOCGenericImport<NSCacheClass, NSCache>)
  end;

  PNSCache = Pointer;

  NSDecimalNumberHandlerClass = interface(NSObjectClass)
    ['{596F3F7F-A1A3-4E90-B797-1E36DBDF9CC8}']
    { class } function decimalNumberHandlerWithRoundingMode
      (roundingMode: NSRoundingMode; scale: SmallInt; raiseOnExactness: Boolean;
      raiseOnOverflow: Boolean; raiseOnUnderflow: Boolean;
      raiseOnDivideByZero: Boolean): Pointer { instancetype }; cdecl;
  end;

  NSDecimalNumberHandler = interface(NSObject)
    ['{2C6A9A31-3C37-4C29-8FF8-7285A8DE0AB3}']
    procedure setDefaultDecimalNumberHandler(defaultDecimalNumberHandler
      : NSDecimalNumberHandler); cdecl;
    function defaultDecimalNumberHandler: NSDecimalNumberHandler; cdecl;
    function initWithRoundingMode(roundingMode: NSRoundingMode; scale: SmallInt;
      raiseOnExactness: Boolean; raiseOnOverflow: Boolean;
      raiseOnUnderflow: Boolean; raiseOnDivideByZero: Boolean)
      : Pointer { instancetype }; cdecl;
  end;

  TNSDecimalNumberHandler = class(TOCGenericImport<NSDecimalNumberHandlerClass,
    NSDecimalNumberHandler>)
  end;

  PNSDecimalNumberHandler = Pointer;

  NSMeasurementFormatterClass = interface(NSFormatterClass)
    ['{7BC69674-557A-4685-9465-03C6931AE375}']
  end;

  NSMeasurementFormatter = interface(NSFormatter)
    ['{6C4EE47A-A2EE-4EAC-A227-D9C7D3FE8B27}']
    procedure setUnitOptions(unitOptions
      : NSMeasurementFormatterUnitOptions); cdecl;
    function unitOptions: NSMeasurementFormatterUnitOptions; cdecl;
    procedure setUnitStyle(unitStyle: NSFormattingUnitStyle); cdecl;
    function unitStyle: NSFormattingUnitStyle; cdecl;
    procedure setLocale(locale: NSLocale); cdecl;
    function locale: NSLocale; cdecl;
    procedure setNumberFormatter(numberFormatter: NSNumberFormatter); cdecl;
    function numberFormatter: NSNumberFormatter; cdecl;
    function stringFromMeasurement(measurement: NSMeasurement): NSString; cdecl;
    function stringFromUnit(&unit: NSUnit): NSString; cdecl;
  end;

  TNSMeasurementFormatter = class(TOCGenericImport<NSMeasurementFormatterClass,
    NSMeasurementFormatter>)
  end;

  PNSMeasurementFormatter = Pointer;

  NSPersonNameComponentsClass = interface(NSObjectClass)
    ['{E7E2EA66-0717-4FD2-950E-18FD8A53B52B}']
  end;

  NSPersonNameComponents = interface(NSObject)
    ['{DFB5905B-00CB-4D92-93A7-28AF944D87CC}']
    procedure setNamePrefix(namePrefix: NSString); cdecl;
    function namePrefix: NSString; cdecl;
    procedure setGivenName(givenName: NSString); cdecl;
    function givenName: NSString; cdecl;
    procedure setMiddleName(middleName: NSString); cdecl;
    function middleName: NSString; cdecl;
    procedure setFamilyName(familyName: NSString); cdecl;
    function familyName: NSString; cdecl;
    procedure setNameSuffix(nameSuffix: NSString); cdecl;
    function nameSuffix: NSString; cdecl;
    procedure setNickname(nickname: NSString); cdecl;
    function nickname: NSString; cdecl;
    procedure setPhoneticRepresentation(phoneticRepresentation
      : NSPersonNameComponents); cdecl;
    function phoneticRepresentation: NSPersonNameComponents; cdecl;
  end;

  TNSPersonNameComponents = class(TOCGenericImport<NSPersonNameComponentsClass,
    NSPersonNameComponents>)
  end;

  PNSPersonNameComponents = Pointer;

  NSPersonNameComponentsFormatterClass = interface(NSFormatterClass)
    ['{ADA603F0-9D63-406C-9B62-DD78C1D09E2F}']
    { class } function localizedStringFromPersonNameComponents
      (components: NSPersonNameComponents;
      style: NSPersonNameComponentsFormatterStyle;
      options: NSPersonNameComponentsFormatterOptions): NSString; cdecl;
  end;

  NSPersonNameComponentsFormatter = interface(NSFormatter)
    ['{5BA4B999-8CA3-46F8-8938-7FDD210309E2}']
    procedure setStyle(style: NSPersonNameComponentsFormatterStyle); cdecl;
    function style: NSPersonNameComponentsFormatterStyle; cdecl;
    procedure setPhonetic(phonetic: Boolean); cdecl;
    function isPhonetic: Boolean; cdecl;
    procedure setLocale(locale: NSLocale); cdecl;
    function locale: NSLocale; cdecl;
    function stringFromPersonNameComponents(components: NSPersonNameComponents)
      : NSString; cdecl;
    function annotatedStringFromPersonNameComponents
      (components: NSPersonNameComponents): NSAttributedString; cdecl;
    function personNameComponentsFromString(&string: NSString)
      : NSPersonNameComponents; cdecl;
    function getObjectValue(obj: Pointer; forString: NSString;
      errorDescription: NSString): Boolean; cdecl;
  end;

  TNSPersonNameComponentsFormatter = class
    (TOCGenericImport<NSPersonNameComponentsFormatterClass,
    NSPersonNameComponentsFormatter>)
  end;

  PNSPersonNameComponentsFormatter = Pointer;

  NSRelativeDateTimeFormatterClass = interface(NSFormatterClass)
    ['{4094A7D4-1916-4D1B-A464-88513F263D95}']
  end;

  NSRelativeDateTimeFormatter = interface(NSFormatter)
    ['{E91233A3-60B9-4E12-AD26-5E4A094AC347}']
    procedure setDateTimeStyle(dateTimeStyle
      : NSRelativeDateTimeFormatterStyle); cdecl;
    function dateTimeStyle: NSRelativeDateTimeFormatterStyle; cdecl;
    procedure setUnitsStyle(unitsStyle
      : NSRelativeDateTimeFormatterUnitsStyle); cdecl;
    function unitsStyle: NSRelativeDateTimeFormatterUnitsStyle; cdecl;
    procedure setFormattingContext(formattingContext
      : NSFormattingContext); cdecl;
    function formattingContext: NSFormattingContext; cdecl;
    procedure setCalendar(calendar: NSCalendar); cdecl;
    function calendar: NSCalendar; cdecl;
    procedure setLocale(locale: NSLocale); cdecl;
    function locale: NSLocale; cdecl;
    function localizedStringFromDateComponents(dateComponents: NSDateComponents)
      : NSString; cdecl;
    function localizedStringFromTimeInterval(timeInterval: NSTimeInterval)
      : NSString; cdecl;
    function localizedStringForDate(date: NSDate; relativeToDate: NSDate)
      : NSString; cdecl;
    function stringForObjectValue(obj: Pointer): NSString; cdecl;
  end;

  TNSRelativeDateTimeFormatter = class
    (TOCGenericImport<NSRelativeDateTimeFormatterClass,
    NSRelativeDateTimeFormatter>)
  end;

  PNSRelativeDateTimeFormatter = Pointer;

  NSListFormatterClass = interface(NSFormatterClass)
    ['{E2A7E0CB-FC40-4940-AC38-7F3562973C55}']
    { class } function localizedStringByJoiningStrings(strings: NSArray)
      : NSString; cdecl;
  end;

  NSListFormatter = interface(NSFormatter)
    ['{26DFBC9D-9F44-49DC-BE0B-E3A95318712C}']
    procedure setLocale(locale: NSLocale); cdecl;
    function locale: NSLocale; cdecl;
    procedure setItemFormatter(itemFormatter: NSFormatter); cdecl;
    function itemFormatter: NSFormatter; cdecl;
    function stringFromItems(items: NSArray): NSString; cdecl;
    function stringForObjectValue(obj: Pointer): NSString; cdecl;
  end;

  TNSListFormatter = class(TOCGenericImport<NSListFormatterClass,
    NSListFormatter>)
  end;

  PNSListFormatter = Pointer;

  NSScannerClass = interface(NSObjectClass)
    ['{4BDA9EAD-5C4D-4C69-9F5D-7B9DC65A1ADD}']
    { class } function scannerWithString(&string: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function localizedScannerWithString(&string: NSString)
      : Pointer; cdecl;
  end;

  NSScanner = interface(NSObject)
    ['{7B625ACB-A313-48EC-92B6-E209F09B1BAE}']
    function &string: NSString; cdecl;
    procedure setScanLocation(scanLocation: NSUInteger); cdecl;
    function scanLocation: NSUInteger; cdecl;
    procedure setCharactersToBeSkipped(charactersToBeSkipped
      : NSCharacterSet); cdecl;
    function charactersToBeSkipped: NSCharacterSet; cdecl;
    procedure setCaseSensitive(caseSensitive: Boolean); cdecl;
    function caseSensitive: Boolean; cdecl;
    procedure setLocale(locale: Pointer); cdecl;
    function locale: Pointer; cdecl;
    function initWithString(&string: NSString): Pointer { instancetype }; cdecl;
    function scanInt(result: PInteger): Boolean; cdecl;
    function scanInteger(result: PNSInteger): Boolean; cdecl;
    function scanLongLong(result: PInt64): Boolean; cdecl;
    function scanUnsignedLongLong(result: PUInt64): Boolean; cdecl;
    function scanFloat(result: PSingle): Boolean; cdecl;
    function scanDouble(result: PDouble): Boolean; cdecl;
    function scanHexInt(result: PCardinal): Boolean; cdecl;
    function scanHexLongLong(result: PUInt64): Boolean; cdecl;
    function scanHexFloat(result: PSingle): Boolean; cdecl;
    function scanHexDouble(result: PDouble): Boolean; cdecl;
    function scanString(&string: NSString; intoString: NSString)
      : Boolean; cdecl;
    function scanCharactersFromSet(&set: NSCharacterSet; intoString: NSString)
      : Boolean; cdecl;
    function scanUpToString(&string: NSString; intoString: NSString)
      : Boolean; cdecl;
    function scanUpToCharactersFromSet(&set: NSCharacterSet;
      intoString: NSString): Boolean; cdecl;
    function isAtEnd: Boolean; cdecl;
    function scanDecimal(dcm: PNSDecimal): Boolean; cdecl;
  end;

  TNSScanner = class(TOCGenericImport<NSScannerClass, NSScanner>)
  end;

  PNSScanner = Pointer;

  NSExceptionClass = interface(NSObjectClass)
    ['{0DED9CC1-562E-457B-8287-A60CD2D61BB8}']
    { class } function exceptionWithName(name: NSExceptionName;
      reason: NSString; userInfo: NSDictionary): NSException; cdecl;
    [MethodName('raise:format:')]
    { class } procedure raiseFormat(name: NSExceptionName;
      format: NSString); cdecl;
    [MethodName('raise:format:arguments:')]
    { class } procedure raiseFormatArguments(name: NSExceptionName;
      format: NSString; arguments: array of const); cdecl;
  end;

  NSException = interface(NSObject)
    ['{70C66D57-9EB9-4D36-BBBC-7069E14F45CC}']
    function initWithName(aName: NSExceptionName; reason: NSString;
      userInfo: NSDictionary): Pointer { instancetype }; cdecl;
    function name: NSExceptionName; cdecl;
    function reason: NSString; cdecl;
    function userInfo: NSDictionary; cdecl;
    function callStackReturnAddresses: NSArray; cdecl;
    function callStackSymbols: NSArray; cdecl;
    procedure &raise; cdecl;
  end;

  TNSException = class(TOCGenericImport<NSExceptionClass, NSException>)
  end;

  PNSException = Pointer;

  NSAssertionHandlerClass = interface(NSObjectClass)
    ['{146C4460-2BB8-4F75-9B14-4A601DDD3197}']
  end;

  NSAssertionHandler = interface(NSObject)
    ['{CCB3AFBA-F9EE-4CD9-85E5-47FD620371CF}']
    procedure setCurrentHandler(currentHandler: NSAssertionHandler); cdecl;
    function currentHandler: NSAssertionHandler; cdecl;
    procedure handleFailureInMethod(selector: SEL; &object: Pointer;
      &file: NSString; lineNumber: NSInteger; description: NSString); cdecl;
    procedure handleFailureInFunction(functionName: NSString; &file: NSString;
      lineNumber: NSInteger; description: NSString); cdecl;
  end;

  TNSAssertionHandler = class(TOCGenericImport<NSAssertionHandlerClass,
    NSAssertionHandler>)
  end;

  PNSAssertionHandler = Pointer;

  NSDecimalNumberClass = interface(NSNumberClass)
    ['{419611B0-6DB1-4A5B-99BF-E821CB684BDF}']
    { class } function decimalNumberWithMantissa(mantissa: UInt64;
      exponent: SmallInt; isNegative: Boolean): NSDecimalNumber; cdecl;
    { class } function decimalNumberWithDecimal(dcm: NSDecimal)
      : NSDecimalNumber; cdecl;
    [MethodName('decimalNumberWithString:')]
    { class } function decimalNumberWithString(numberValue: NSString)
      : NSDecimalNumber; cdecl;
    [MethodName('decimalNumberWithString:locale:')]
    { class } function decimalNumberWithStringLocale(numberValue: NSString;
      locale: Pointer): NSDecimalNumber; cdecl;
  end;

  NSDecimalNumber = interface(NSNumber)
    ['{7ABAB06B-3A3F-4A1B-A51F-067295429BA1}']
    function initWithMantissa(mantissa: UInt64; exponent: SmallInt;
      isNegative: Boolean): Pointer { instancetype }; cdecl;
    function initWithDecimal(dcm: NSDecimal): Pointer { instancetype }; cdecl;
    [MethodName('initWithString:')]
    function initWithString(numberValue: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithString:locale:')]
    function initWithStringLocale(numberValue: NSString; locale: Pointer)
      : Pointer { instancetype }; cdecl;
    function descriptionWithLocale(locale: Pointer): NSString; cdecl;
    function decimalValue: NSDecimal; cdecl;
    procedure setZero(zero: NSDecimalNumber); cdecl;
    function zero: NSDecimalNumber; cdecl;
    procedure setOne(one: NSDecimalNumber); cdecl;
    function one: NSDecimalNumber; cdecl;
    procedure setMinimumDecimalNumber(minimumDecimalNumber
      : NSDecimalNumber); cdecl;
    function minimumDecimalNumber: NSDecimalNumber; cdecl;
    procedure setMaximumDecimalNumber(maximumDecimalNumber
      : NSDecimalNumber); cdecl;
    function maximumDecimalNumber: NSDecimalNumber; cdecl;
    procedure setNotANumber(notANumber: NSDecimalNumber); cdecl;
    function notANumber: NSDecimalNumber; cdecl;
    [MethodName('decimalNumberByAdding:')]
    function decimalNumberByAdding(decimalNumber: NSDecimalNumber)
      : NSDecimalNumber; cdecl;
    [MethodName('decimalNumberByAdding:withBehavior:')]
    function decimalNumberByAddingWithBehavior(decimalNumber: NSDecimalNumber;
      withBehavior: Pointer): NSDecimalNumber; cdecl;
    [MethodName('decimalNumberBySubtracting:')]
    function decimalNumberBySubtracting(decimalNumber: NSDecimalNumber)
      : NSDecimalNumber; cdecl;
    [MethodName('decimalNumberBySubtracting:withBehavior:')]
    function decimalNumberBySubtractingWithBehavior(decimalNumber
      : NSDecimalNumber; withBehavior: Pointer): NSDecimalNumber; cdecl;
    [MethodName('decimalNumberByMultiplyingBy:')]
    function decimalNumberByMultiplyingBy(decimalNumber: NSDecimalNumber)
      : NSDecimalNumber; cdecl;
    [MethodName('decimalNumberByMultiplyingBy:withBehavior:')]
    function decimalNumberByMultiplyingByWithBehavior(decimalNumber
      : NSDecimalNumber; withBehavior: Pointer): NSDecimalNumber; cdecl;
    [MethodName('decimalNumberByDividingBy:')]
    function decimalNumberByDividingBy(decimalNumber: NSDecimalNumber)
      : NSDecimalNumber; cdecl;
    [MethodName('decimalNumberByDividingBy:withBehavior:')]
    function decimalNumberByDividingByWithBehavior(decimalNumber
      : NSDecimalNumber; withBehavior: Pointer): NSDecimalNumber; cdecl;
    [MethodName('decimalNumberByRaisingToPower:')]
    function decimalNumberByRaisingToPower(power: NSUInteger)
      : NSDecimalNumber; cdecl;
    [MethodName('decimalNumberByRaisingToPower:withBehavior:')]
    function decimalNumberByRaisingToPowerWithBehavior(power: NSUInteger;
      withBehavior: Pointer): NSDecimalNumber; cdecl;
    [MethodName('decimalNumberByMultiplyingByPowerOf10:')]
    function decimalNumberByMultiplyingByPowerOf10(power: SmallInt)
      : NSDecimalNumber; cdecl;
    [MethodName('decimalNumberByMultiplyingByPowerOf10:withBehavior:')]
    function decimalNumberByMultiplyingByPowerOf10WithBehavior(power: SmallInt;
      withBehavior: Pointer): NSDecimalNumber; cdecl;
    function decimalNumberByRoundingAccordingToBehavior(behavior: Pointer)
      : NSDecimalNumber; cdecl;
    function compare(decimalNumber: NSNumber): NSComparisonResult; cdecl;
    procedure setDefaultBehavior(defaultBehavior: Pointer); cdecl;
    function defaultBehavior: Pointer; cdecl;
    function objCType: MarshaledAString; cdecl;
    function doubleValue: Double; cdecl;
  end;

  TNSDecimalNumber = class(TOCGenericImport<NSDecimalNumberClass,
    NSDecimalNumber>)
  end;

  PNSDecimalNumber = Pointer;

  NSErrorRecoveryAttempting = interface(IObjectiveC)
    ['{5DE22295-FC93-4746-ABB9-BE0B4C0DC82E}']
    [MethodName
      ('attemptRecoveryFromError:optionIndex:delegate:didRecoverSelector:contextInfo:')
      ]
    procedure attemptRecoveryFromErrorOptionIndexDelegateDidRecoverSelectorContextInfo
      (error: NSError; optionIndex: NSUInteger; delegate: Pointer;
      didRecoverSelector: SEL; contextInfo: Pointer); cdecl;
    [MethodName('attemptRecoveryFromError:optionIndex:')]
    function attemptRecoveryFromErrorOptionIndex(error: NSError;
      optionIndex: NSUInteger): Boolean; cdecl;
  end;

  NSTimerClass = interface(NSObjectClass)
    ['{B8DDADD0-1898-49AC-BFD9-667266187B51}']
    [MethodName('timerWithTimeInterval:invocation:repeats:')]
    { class } function timerWithTimeIntervalInvocationRepeats
      (ti: NSTimeInterval; invocation: NSInvocation; repeats: Boolean)
      : NSTimer; cdecl;
    [MethodName('scheduledTimerWithTimeInterval:invocation:repeats:')]
    { class } function scheduledTimerWithTimeIntervalInvocationRepeats
      (ti: NSTimeInterval; invocation: NSInvocation; repeats: Boolean)
      : NSTimer; cdecl;
    [MethodName('timerWithTimeInterval:target:selector:userInfo:repeats:')]
    { class } function timerWithTimeIntervalTargetSelectorUserInfoRepeats
      (ti: NSTimeInterval; target: Pointer; selector: SEL; userInfo: Pointer;
      repeats: Boolean): NSTimer; cdecl;
    [MethodName
      ('scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:')]
    { class } function
      scheduledTimerWithTimeIntervalTargetSelectorUserInfoRepeats
      (ti: NSTimeInterval; target: Pointer; selector: SEL; userInfo: Pointer;
      repeats: Boolean): NSTimer; cdecl;
    [MethodName('timerWithTimeInterval:repeats:block:')]
    { class } function timerWithTimeIntervalRepeatsBlock
      (interval: NSTimeInterval; repeats: Boolean; block: TFoundationBlock11)
      : NSTimer; cdecl;
    [MethodName('scheduledTimerWithTimeInterval:repeats:block:')]
    { class } function scheduledTimerWithTimeIntervalRepeatsBlock
      (interval: NSTimeInterval; repeats: Boolean; block: TFoundationBlock11)
      : NSTimer; cdecl;
  end;

  NSTimer = interface(NSObject)
    ['{1757CE8C-5EB3-4DF4-89F5-16346F3CCA22}']
    [MethodName('initWithFireDate:interval:repeats:block:')]
    function initWithFireDateIntervalRepeatsBlock(date: NSDate;
      interval: NSTimeInterval; repeats: Boolean; block: TFoundationBlock11)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithFireDate:interval:target:selector:userInfo:repeats:')]
    function initWithFireDateIntervalTargetSelectorUserInfoRepeats(date: NSDate;
      interval: NSTimeInterval; target: Pointer; selector: SEL;
      userInfo: Pointer; repeats: Boolean): Pointer { instancetype }; cdecl;
    procedure fire; cdecl;
    procedure setFireDate(fireDate: NSDate); cdecl;
    function fireDate: NSDate; cdecl;
    function timeInterval: NSTimeInterval; cdecl;
    procedure setTolerance(tolerance: NSTimeInterval); cdecl;
    function tolerance: NSTimeInterval; cdecl;
    procedure invalidate; cdecl;
    function isValid: Boolean; cdecl;
    function userInfo: Pointer; cdecl;
  end;

  TNSTimer = class(TOCGenericImport<NSTimerClass, NSTimer>)
  end;

  PNSTimer = Pointer;

  NSPortClass = interface(NSObjectClass)
    ['{3625F0D7-5898-4810-AD0E-29B0315D2F24}']
    { class } function port: NSPort; cdecl;
  end;

  NSPort = interface(NSObject)
    ['{DE69D3C6-EFF9-4BFC-8347-F5B651C978C4}']
    procedure invalidate; cdecl;
    function isValid: Boolean; cdecl;
    procedure setDelegate(anObject: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure scheduleInRunLoop(runLoop: NSRunLoop;
      forMode: NSRunLoopMode); cdecl;
    procedure removeFromRunLoop(runLoop: NSRunLoop;
      forMode: NSRunLoopMode); cdecl;
    function reservedSpaceLength: NSUInteger; cdecl;
    [MethodName('sendBeforeDate:components:from:reserved:')]
    function sendBeforeDateComponentsFromReserved(limitDate: NSDate;
      components: NSMutableArray; from: NSPort; reserved: NSUInteger)
      : Boolean; cdecl;
    [MethodName('sendBeforeDate:msgid:components:from:reserved:')]
    function sendBeforeDateMsgidComponentsFromReserved(limitDate: NSDate;
      msgid: NSUInteger; components: NSMutableArray; from: NSPort;
      reserved: NSUInteger): Boolean; cdecl;
  end;

  TNSPort = class(TOCGenericImport<NSPortClass, NSPort>)
  end;

  PNSPort = Pointer;

  NSRunLoopClass = interface(NSObjectClass)
    ['{D4E3FB9F-6907-4854-B96C-F92BCA182B44}']
  end;

  NSRunLoop = interface(NSObject)
    ['{6BEEF730-A2C8-4628-93C7-A81249873846}']
    procedure setCurrentRunLoop(currentRunLoop: NSRunLoop); cdecl;
    function currentRunLoop: NSRunLoop; cdecl;
    procedure setMainRunLoop(mainRunLoop: NSRunLoop); cdecl;
    function mainRunLoop: NSRunLoop; cdecl;
    function currentMode: NSRunLoopMode; cdecl;
    function getCFRunLoop: CFRunLoopRef; cdecl;
    procedure addTimer(timer: NSTimer; forMode: NSRunLoopMode); cdecl;
    procedure addPort(aPort: NSPort; forMode: NSRunLoopMode); cdecl;
    procedure removePort(aPort: NSPort; forMode: NSRunLoopMode); cdecl;
    function limitDateForMode(mode: NSRunLoopMode): NSDate; cdecl;
    procedure acceptInputForMode(mode: NSRunLoopMode;
      beforeDate: NSDate); cdecl;
    procedure run; cdecl;
    procedure runUntilDate(limitDate: NSDate); cdecl;
    function runMode(mode: NSRunLoopMode; beforeDate: NSDate): Boolean; cdecl;
    procedure performInModes(modes: NSArray;
      block: TFoundationUsingBlock1); cdecl;
    procedure performBlock(block: TFoundationUsingBlock1); cdecl;
    procedure performSelector(aSelector: SEL; target: Pointer;
      argument: Pointer; order: NSUInteger; modes: NSArray); cdecl;
    procedure cancelPerformSelector(aSelector: SEL; target: Pointer;
      argument: Pointer); cdecl;
    procedure cancelPerformSelectorsWithTarget(target: Pointer); cdecl;
  end;

  TNSRunLoop = class(TOCGenericImport<NSRunLoopClass, NSRunLoop>)
  end;

  PNSRunLoop = Pointer;

  NSDelayedPerforming = interface(IObjectiveC)
    ['{CEC8A83E-9E1E-42A6-AD21-305168214507}']
    [MethodName('performSelector:withObject:afterDelay:inModes:')]
    procedure performSelectorWithObjectAfterDelayInModes(aSelector: SEL;
      withObject: Pointer; afterDelay: NSTimeInterval; inModes: NSArray); cdecl;
    [MethodName('performSelector:withObject:afterDelay:')]
    procedure performSelectorWithObjectAfterDelay(aSelector: SEL;
      withObject: Pointer; afterDelay: NSTimeInterval); cdecl;
    [MethodName('cancelPreviousPerformRequestsWithTarget:selector:object:')]
    procedure cancelPreviousPerformRequestsWithTargetSelectorObject
      (aTarget: Pointer; selector: SEL; &object: Pointer); cdecl;
    [MethodName('cancelPreviousPerformRequestsWithTarget:')]
    procedure cancelPreviousPerformRequestsWithTarget(aTarget: Pointer); cdecl;
  end;

  NSFileHandleClass = interface(NSObjectClass)
    ['{6BD7FF9E-FA92-4928-AA04-E837666F2404}']
    { class } function fileHandleForReadingAtPath(path: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function fileHandleForWritingAtPath(path: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function fileHandleForUpdatingAtPath(path: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function fileHandleForReadingFromURL(url: NSURL; error: NSError)
      : Pointer { instancetype }; cdecl;
    { class } function fileHandleForWritingToURL(url: NSURL; error: NSError)
      : Pointer { instancetype }; cdecl;
    { class } function fileHandleForUpdatingURL(url: NSURL; error: NSError)
      : Pointer { instancetype }; cdecl;
  end;

  NSFileHandle = interface(NSObject)
    ['{5D57B683-0A2D-4161-80BA-BAD3858481EA}']
    function availableData: NSData; cdecl;
    [MethodName('initWithFileDescriptor:closeOnDealloc:')]
    function initWithFileDescriptorCloseOnDealloc(fd: Integer;
      closeOnDealloc: Boolean): Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function readDataToEndOfFileAndReturnError(error: NSError): NSData; cdecl;
    function readDataUpToLength(length: NSUInteger; error: NSError)
      : NSData; cdecl;
    [MethodName('writeData:error:')]
    function writeDataError(data: NSData; error: NSError): Boolean; cdecl;
    function getOffset(offsetInFile: PUInt64; error: NSError): Boolean; cdecl;
    function seekToEndReturningOffset(offsetInFile: PUInt64; error: NSError)
      : Boolean; cdecl;
    function seekToOffset(offset: UInt64; error: NSError): Boolean; cdecl;
    function truncateAtOffset(offset: UInt64; error: NSError): Boolean; cdecl;
    function synchronizeAndReturnError(error: NSError): Boolean; cdecl;
    function closeAndReturnError(error: NSError): Boolean; cdecl;
    function offsetInFile: UInt64; cdecl;
    procedure setFileHandleWithStandardInput(fileHandleWithStandardInput
      : NSFileHandle); cdecl;
    function fileHandleWithStandardInput: NSFileHandle; cdecl;
    procedure setFileHandleWithStandardOutput(fileHandleWithStandardOutput
      : NSFileHandle); cdecl;
    function fileHandleWithStandardOutput: NSFileHandle; cdecl;
    procedure setFileHandleWithStandardError(fileHandleWithStandardError
      : NSFileHandle); cdecl;
    function fileHandleWithStandardError: NSFileHandle; cdecl;
    procedure setFileHandleWithNullDevice(fileHandleWithNullDevice
      : NSFileHandle); cdecl;
    function fileHandleWithNullDevice: NSFileHandle; cdecl;
    procedure readInBackgroundAndNotifyForModes(modes: NSArray); cdecl;
    procedure readInBackgroundAndNotify; cdecl;
    procedure readToEndOfFileInBackgroundAndNotifyForModes
      (modes: NSArray); cdecl;
    procedure readToEndOfFileInBackgroundAndNotify; cdecl;
    procedure acceptConnectionInBackgroundAndNotifyForModes
      (modes: NSArray); cdecl;
    procedure acceptConnectionInBackgroundAndNotify; cdecl;
    procedure waitForDataInBackgroundAndNotifyForModes(modes: NSArray); cdecl;
    procedure waitForDataInBackgroundAndNotify; cdecl;
    procedure setReadabilityHandler(readabilityHandler
      : TFoundationReadabilityHandler); cdecl;
    function readabilityHandler: TFoundationReadabilityHandler; cdecl;
    procedure setWriteabilityHandler(writeabilityHandler
      : TFoundationReadabilityHandler); cdecl;
    function writeabilityHandler: TFoundationReadabilityHandler; cdecl;
    [MethodName('initWithFileDescriptor:')]
    function initWithFileDescriptor(fd: Integer)
      : Pointer { instancetype }; cdecl;
    function fileDescriptor: Integer; cdecl;
    function readDataToEndOfFile: NSData; cdecl;
    function readDataOfLength(length: NSUInteger): NSData; cdecl;
    [MethodName('writeData:')]
    procedure writeData(data: NSData); cdecl;
    function seekToEndOfFile: UInt64; cdecl;
    procedure seekToFileOffset(offset: UInt64); cdecl;
    procedure truncateFileAtOffset(offset: UInt64); cdecl;
    procedure synchronizeFile; cdecl;
    procedure closeFile; cdecl;
  end;

  TNSFileHandle = class(TOCGenericImport<NSFileHandleClass, NSFileHandle>)
  end;

  PNSFileHandle = Pointer;

  NSPipeClass = interface(NSObjectClass)
    ['{F666BC76-897A-42B8-9477-BFFE1F1354FF}']
    { class } function pipe: NSPipe; cdecl;
  end;

  NSPipe = interface(NSObject)
    ['{52ECDB14-6849-4D49-9469-3C43768C57D2}']
    function fileHandleForReading: NSFileHandle; cdecl;
    function fileHandleForWriting: NSFileHandle; cdecl;
  end;

  TNSPipe = class(TOCGenericImport<NSPipeClass, NSPipe>)
  end;

  PNSPipe = Pointer;

  NSURLQueryItemClass = interface(NSObjectClass)
    ['{ABF2BF84-E7AD-4C21-8343-891C94CC9528}']
    { class } function queryItemWithName(name: NSString; value: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  NSURLQueryItem = interface(NSObject)
    ['{5F7F5A30-533F-4AE9-B716-91F0F285C309}']
    function initWithName(name: NSString; value: NSString)
      : Pointer { instancetype }; cdecl;
    function name: NSString; cdecl;
    function value: NSString; cdecl;
  end;

  TNSURLQueryItem = class(TOCGenericImport<NSURLQueryItemClass, NSURLQueryItem>)
  end;

  PNSURLQueryItem = Pointer;

  NSURLComponentsClass = interface(NSObjectClass)
    ['{6EE4D38D-EAF8-41F9-B646-02FA5AF3DEBF}']
    { class } function componentsWithURL(url: NSURL;
      resolvingAgainstBaseURL: Boolean): Pointer { instancetype }; cdecl;
    { class } function componentsWithString(URLString: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  NSURLComponents = interface(NSObject)
    ['{701412BA-0C16-40EE-A77E-F76EF5288AEF}']
    function init: Pointer { instancetype }; cdecl;
    function initWithURL(url: NSURL; resolvingAgainstBaseURL: Boolean)
      : Pointer { instancetype }; cdecl;
    function initWithString(URLString: NSString)
      : Pointer { instancetype }; cdecl;
    function url: NSURL; cdecl;
    function URLRelativeToURL(baseURL: NSURL): NSURL; cdecl;
    function &string: NSString; cdecl;
    procedure setScheme(scheme: NSString); cdecl;
    function scheme: NSString; cdecl;
    procedure setUser(user: NSString); cdecl;
    function user: NSString; cdecl;
    procedure setPassword(password: NSString); cdecl;
    function password: NSString; cdecl;
    procedure setHost(host: NSString); cdecl;
    function host: NSString; cdecl;
    procedure setPort(port: NSNumber); cdecl;
    function port: NSNumber; cdecl;
    procedure setPath(path: NSString); cdecl;
    function path: NSString; cdecl;
    procedure setQuery(query: NSString); cdecl;
    function query: NSString; cdecl;
    procedure setFragment(fragment: NSString); cdecl;
    function fragment: NSString; cdecl;
    procedure setPercentEncodedUser(percentEncodedUser: NSString); cdecl;
    function percentEncodedUser: NSString; cdecl;
    procedure setPercentEncodedPassword(percentEncodedPassword
      : NSString); cdecl;
    function percentEncodedPassword: NSString; cdecl;
    procedure setPercentEncodedHost(percentEncodedHost: NSString); cdecl;
    function percentEncodedHost: NSString; cdecl;
    procedure setPercentEncodedPath(percentEncodedPath: NSString); cdecl;
    function percentEncodedPath: NSString; cdecl;
    procedure setPercentEncodedQuery(percentEncodedQuery: NSString); cdecl;
    function percentEncodedQuery: NSString; cdecl;
    procedure setPercentEncodedFragment(percentEncodedFragment
      : NSString); cdecl;
    function percentEncodedFragment: NSString; cdecl;
    procedure setEncodedHost(encodedHost: NSString); cdecl;
    function encodedHost: NSString; cdecl;
    function rangeOfScheme: NSRange; cdecl;
    function rangeOfUser: NSRange; cdecl;
    function rangeOfPassword: NSRange; cdecl;
    function rangeOfHost: NSRange; cdecl;
    function rangeOfPort: NSRange; cdecl;
    function rangeOfPath: NSRange; cdecl;
    function rangeOfQuery: NSRange; cdecl;
    function rangeOfFragment: NSRange; cdecl;
    procedure setQueryItems(queryItems: NSArray); cdecl;
    function queryItems: NSArray; cdecl;
    procedure setPercentEncodedQueryItems(percentEncodedQueryItems
      : NSArray); cdecl;
    function percentEncodedQueryItems: NSArray; cdecl;
  end;

  TNSURLComponents = class(TOCGenericImport<NSURLComponentsClass,
    NSURLComponents>)
  end;

  PNSURLComponents = Pointer;

  NSFileSecurityClass = interface(NSObjectClass)
    ['{DB4CD339-E254-44E9-869A-DDD20AF049CD}']
  end;

  NSFileSecurity = interface(NSObject)
    ['{340EA1E1-C9C1-4C9E-9DAF-C42B37859317}']
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
  end;

  TNSFileSecurity = class(TOCGenericImport<NSFileSecurityClass, NSFileSecurity>)
  end;

  PNSFileSecurity = Pointer;

  NSDirectoryEnumeratorClass = interface(NSEnumeratorClass)
    ['{E98F8366-F8EF-4D67-B935-7612EEE43997}']
  end;

  NSDirectoryEnumerator = interface(NSEnumerator)
    ['{EFF5EC3F-7615-49AE-874F-5CF55425CD30}']
    function fileAttributes: NSDictionary; cdecl;
    function directoryAttributes: NSDictionary; cdecl;
    function isEnumeratingDirectoryPostOrder: Boolean; cdecl;
    procedure skipDescendents; cdecl;
    function level: NSUInteger; cdecl;
    procedure skipDescendants; cdecl;
  end;

  TNSDirectoryEnumerator = class(TOCGenericImport<NSDirectoryEnumeratorClass,
    NSDirectoryEnumerator>)
  end;

  PNSDirectoryEnumerator = Pointer;

  NSFileProviderServiceClass = interface(NSObjectClass)
    ['{C4581ADB-523B-499E-94D2-8B147A30A7F9}']
  end;

  NSFileProviderService = interface(NSObject)
    ['{85A78E87-1587-49F8-BAA2-8EB9D765351D}']
    procedure getFileProviderConnectionWithCompletionHandler(completionHandler
      : TFoundationCompletionHandler4); cdecl;
    function name: NSFileProviderServiceName; cdecl;
  end;

  TNSFileProviderService = class(TOCGenericImport<NSFileProviderServiceClass,
    NSFileProviderService>)
  end;

  PNSFileProviderService = Pointer;

  NSFileManagerClass = interface(NSObjectClass)
    ['{9F5A0256-99B6-46E7-BD44-1A118E16E212}']
  end;

  NSFileManager = interface(NSObject)
    ['{2EBB1E23-48F7-42A7-8FF4-F8A188327F06}']
    procedure setDefaultManager(defaultManager: NSFileManager); cdecl;
    function defaultManager: NSFileManager; cdecl;
    function mountedVolumeURLsIncludingResourceValuesForKeys
      (propertyKeys: NSArray; options: NSVolumeEnumerationOptions)
      : NSArray; cdecl;
    procedure unmountVolumeAtURL(url: NSURL;
      options: NSFileManagerUnmountOptions;
      completionHandler: TFoundationCompletionHandler1); cdecl;
    function contentsOfDirectoryAtURL(url: NSURL;
      includingPropertiesForKeys: NSArray;
      options: NSDirectoryEnumerationOptions; error: NSError): NSArray; cdecl;
    function URLsForDirectory(directory: NSSearchPathDirectory;
      inDomains: NSSearchPathDomainMask): NSArray; cdecl;
    function URLForDirectory(directory: NSSearchPathDirectory;
      inDomain: NSSearchPathDomainMask; appropriateForURL: NSURL;
      create: Boolean; error: NSError): NSURL; cdecl;
    [MethodName('getRelationship:ofDirectoryAtURL:toItemAtURL:error:')]
    function getRelationshipOfDirectoryAtURLToItemAtURLError(outRelationship
      : PNSURLRelationship; ofDirectoryAtURL: NSURL; toItemAtURL: NSURL;
      error: NSError): Boolean; cdecl;
    [MethodName('getRelationship:ofDirectory:inDomain:toItemAtURL:error:')]
    function getRelationshipOfDirectoryInDomainToItemAtURLError(outRelationship
      : PNSURLRelationship; ofDirectory: NSSearchPathDirectory;
      inDomain: NSSearchPathDomainMask; toItemAtURL: NSURL; error: NSError)
      : Boolean; cdecl;
    function createDirectoryAtURL(url: NSURL;
      withIntermediateDirectories: Boolean; attributes: NSDictionary;
      error: NSError): Boolean; cdecl;
    function createSymbolicLinkAtURL(url: NSURL; withDestinationURL: NSURL;
      error: NSError): Boolean; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function setAttributes(attributes: NSDictionary; ofItemAtPath: NSString;
      error: NSError): Boolean; cdecl;
    [MethodName
      ('createDirectoryAtPath:withIntermediateDirectories:attributes:error:')]
    function createDirectoryAtPathWithIntermediateDirectoriesAttributesError
      (path: NSString; withIntermediateDirectories: Boolean;
      attributes: NSDictionary; error: NSError): Boolean; cdecl;
    function contentsOfDirectoryAtPath(path: NSString; error: NSError)
      : NSArray; cdecl;
    function subpathsOfDirectoryAtPath(path: NSString; error: NSError)
      : NSArray; cdecl;
    function attributesOfItemAtPath(path: NSString; error: NSError)
      : NSDictionary; cdecl;
    function attributesOfFileSystemForPath(path: NSString; error: NSError)
      : NSDictionary; cdecl;
    [MethodName('createSymbolicLinkAtPath:withDestinationPath:error:')]
    function createSymbolicLinkAtPathWithDestinationPathError(path: NSString;
      withDestinationPath: NSString; error: NSError): Boolean; cdecl;
    function destinationOfSymbolicLinkAtPath(path: NSString; error: NSError)
      : NSString; cdecl;
    function copyItemAtPath(srcPath: NSString; toPath: NSString; error: NSError)
      : Boolean; cdecl;
    function moveItemAtPath(srcPath: NSString; toPath: NSString; error: NSError)
      : Boolean; cdecl;
    function linkItemAtPath(srcPath: NSString; toPath: NSString; error: NSError)
      : Boolean; cdecl;
    function removeItemAtPath(path: NSString; error: NSError): Boolean; cdecl;
    function copyItemAtURL(srcURL: NSURL; toURL: NSURL; error: NSError)
      : Boolean; cdecl;
    function moveItemAtURL(srcURL: NSURL; toURL: NSURL; error: NSError)
      : Boolean; cdecl;
    function linkItemAtURL(srcURL: NSURL; toURL: NSURL; error: NSError)
      : Boolean; cdecl;
    function removeItemAtURL(url: NSURL; error: NSError): Boolean; cdecl;
    function trashItemAtURL(url: NSURL; resultingItemURL: NSURL; error: NSError)
      : Boolean; cdecl;
    function fileAttributesAtPath(path: NSString; traverseLink: Boolean)
      : NSDictionary; cdecl;
    function changeFileAttributes(attributes: NSDictionary; atPath: NSString)
      : Boolean; cdecl;
    function directoryContentsAtPath(path: NSString): NSArray; cdecl;
    function fileSystemAttributesAtPath(path: NSString): NSDictionary; cdecl;
    function pathContentOfSymbolicLinkAtPath(path: NSString): NSString; cdecl;
    [MethodName('createSymbolicLinkAtPath:pathContent:')]
    function createSymbolicLinkAtPathPathContent(path: NSString;
      pathContent: NSString): Boolean; cdecl;
    [MethodName('createDirectoryAtPath:attributes:')]
    function createDirectoryAtPathAttributes(path: NSString;
      attributes: NSDictionary): Boolean; cdecl;
    function currentDirectoryPath: NSString; cdecl;
    function changeCurrentDirectoryPath(path: NSString): Boolean; cdecl;
    [MethodName('fileExistsAtPath:')]
    function fileExistsAtPath(path: NSString): Boolean; cdecl;
    [MethodName('fileExistsAtPath:isDirectory:')]
    function fileExistsAtPathIsDirectory(path: NSString; isDirectory: PBoolean)
      : Boolean; cdecl;
    function isReadableFileAtPath(path: NSString): Boolean; cdecl;
    function isWritableFileAtPath(path: NSString): Boolean; cdecl;
    function isExecutableFileAtPath(path: NSString): Boolean; cdecl;
    function isDeletableFileAtPath(path: NSString): Boolean; cdecl;
    function contentsEqualAtPath(path1: NSString; andPath: NSString)
      : Boolean; cdecl;
    function displayNameAtPath(path: NSString): NSString; cdecl;
    function componentsToDisplayForPath(path: NSString): NSArray; cdecl;
    function enumeratorAtPath(path: NSString): NSDirectoryEnumerator; cdecl;
    function enumeratorAtURL(url: NSURL; includingPropertiesForKeys: NSArray;
      options: NSDirectoryEnumerationOptions;
      errorHandler: TFoundationErrorHandler): NSDirectoryEnumerator; cdecl;
    function subpathsAtPath(path: NSString): NSArray; cdecl;
    function contentsAtPath(path: NSString): NSData; cdecl;
    function createFileAtPath(path: NSString; contents: NSData;
      attributes: NSDictionary): Boolean; cdecl;
    function fileSystemRepresentationWithPath(path: NSString)
      : MarshaledAString; cdecl;
    function stringWithFileSystemRepresentation(str: MarshaledAString;
      length: NSUInteger): NSString; cdecl;
    function replaceItemAtURL(originalItemURL: NSURL; withItemAtURL: NSURL;
      backupItemName: NSString; options: NSFileManagerItemReplacementOptions;
      resultingItemURL: NSURL; error: NSError): Boolean; cdecl;
    function setUbiquitous(flag: Boolean; itemAtURL: NSURL;
      destinationURL: NSURL; error: NSError): Boolean; cdecl;
    function isUbiquitousItemAtURL(url: NSURL): Boolean; cdecl;
    function startDownloadingUbiquitousItemAtURL(url: NSURL; error: NSError)
      : Boolean; cdecl;
    function evictUbiquitousItemAtURL(url: NSURL; error: NSError)
      : Boolean; cdecl;
    function URLForUbiquityContainerIdentifier(containerIdentifier: NSString)
      : NSURL; cdecl;
    function URLForPublishingUbiquitousItemAtURL(url: NSURL;
      expirationDate: NSDate; error: NSError): NSURL; cdecl;
    function ubiquityIdentityToken: Pointer; cdecl;
    procedure getFileProviderServicesForItemAtURL(url: NSURL;
      completionHandler: TFoundationCompletionHandler3); cdecl;
    function containerURLForSecurityApplicationGroupIdentifier(groupIdentifier
      : NSString): NSURL; cdecl;
    function homeDirectoryForCurrentUser: NSURL; cdecl;
    function temporaryDirectory: NSURL; cdecl;
    function homeDirectoryForUser(userName: NSString): NSURL; cdecl;
  end;

  TNSFileManager = class(TOCGenericImport<NSFileManagerClass, NSFileManager>)
  end;

  PNSFileManager = Pointer;

  NSCopyLinkMoveHandler = interface(IObjectiveC)
    ['{44B40FFA-EB7B-41B4-897C-94AB8039E4F0}']
    [MethodName('fileManager:shouldProceedAfterError:')]
    function fileManagerShouldProceedAfterError(fm: NSFileManager;
      shouldProceedAfterError: NSDictionary): Boolean; cdecl;
    [MethodName('fileManager:willProcessPath:')]
    procedure fileManagerWillProcessPath(fm: NSFileManager;
      willProcessPath: NSString); cdecl;
  end;

  NSPointerFunctionsClass = interface(NSObjectClass)
    ['{753AB829-50C9-46D3-B0DC-35D7D9945AF3}']
    { class } function pointerFunctionsWithOptions
      (options: NSPointerFunctionsOptions): NSPointerFunctions; cdecl;
  end;

  NSPointerFunctions = interface(NSObject)
    ['{50C7A312-87BA-4258-B790-1ADDE8FA89B1}']
    function initWithOptions(options: NSPointerFunctionsOptions)
      : Pointer { instancetype }; cdecl;
    procedure setHashFunction(hashFunction: TFoundationHashFunction); cdecl;
    function hashFunction: TFoundationHashFunction; cdecl;
    procedure setIsEqualFunction(isEqualFunction
      : TFoundationIsEqualFunction); cdecl;
    function isEqualFunction: TFoundationIsEqualFunction; cdecl;
    procedure setSizeFunction(sizeFunction: TFoundationBlock10); cdecl;
    function sizeFunction: TFoundationBlock10; cdecl;
    procedure setDescriptionFunction(descriptionFunction
      : TFoundationDescriptionFunction); cdecl;
    function descriptionFunction: TFoundationDescriptionFunction; cdecl;
    procedure setRelinquishFunction(relinquishFunction
      : TFoundationRelinquishFunction); cdecl;
    function relinquishFunction: TFoundationRelinquishFunction; cdecl;
    procedure setAcquireFunction(acquireFunction
      : TFoundationAcquireFunction); cdecl;
    function acquireFunction: TFoundationAcquireFunction; cdecl;
    procedure setUsesStrongWriteBarrier(usesStrongWriteBarrier: Boolean); cdecl;
    function usesStrongWriteBarrier: Boolean; cdecl;
    procedure setUsesWeakReadAndWriteBarriers(usesWeakReadAndWriteBarriers
      : Boolean); cdecl;
    function usesWeakReadAndWriteBarriers: Boolean; cdecl;
  end;

  TNSPointerFunctions = class(TOCGenericImport<NSPointerFunctionsClass,
    NSPointerFunctions>)
  end;

  PNSPointerFunctions = Pointer;

  NSHashTableClass = interface(NSObjectClass)
    ['{96100976-031E-438E-A67F-27F919DD4D71}']
    { class } function hashTableWithOptions(options: NSPointerFunctionsOptions)
      : NSHashTable; cdecl;
    { class } function hashTableWithWeakObjects: Pointer; cdecl;
    { class } function weakObjectsHashTable: NSHashTable; cdecl;
  end;

  NSHashTable = interface(NSObject)
    ['{4B3DC48F-8CF4-410D-96B2-E3A1DC5A4EB0}']
    function initWithOptions(options: NSPointerFunctionsOptions;
      capacity: NSUInteger): Pointer { instancetype }; cdecl;
    function initWithPointerFunctions(functions: NSPointerFunctions;
      capacity: NSUInteger): Pointer { instancetype }; cdecl;
    function pointerFunctions: NSPointerFunctions; cdecl;
    function count: NSUInteger; cdecl;
    function member(&object: ObjectType): ObjectType; cdecl;
    function objectEnumerator: NSEnumerator; cdecl;
    procedure addObject(&object: ObjectType); cdecl;
    procedure removeObject(&object: ObjectType); cdecl;
    procedure removeAllObjects; cdecl;
    function allObjects: NSArray; cdecl;
    function anyObject: ObjectType; cdecl;
    function containsObject(anObject: ObjectType): Boolean; cdecl;
    function intersectsHashTable(other: NSHashTable): Boolean; cdecl;
    function isEqualToHashTable(other: NSHashTable): Boolean; cdecl;
    function isSubsetOfHashTable(other: NSHashTable): Boolean; cdecl;
    procedure intersectHashTable(other: NSHashTable); cdecl;
    procedure unionHashTable(other: NSHashTable); cdecl;
    procedure minusHashTable(other: NSHashTable); cdecl;
    function setRepresentation: NSSet; cdecl;
  end;

  TNSHashTable = class(TOCGenericImport<NSHashTableClass, NSHashTable>)
  end;

  PNSHashTable = Pointer;

  NSHTTPCookieClass = interface(NSObjectClass)
    ['{6EEC12B7-E759-448B-936D-825EE40A9A64}']
    { class } function cookieWithProperties(properties: NSDictionary)
      : NSHTTPCookie; cdecl;
    { class } function requestHeaderFieldsWithCookies(cookies: NSArray)
      : NSDictionary; cdecl;
    { class } function cookiesWithResponseHeaderFields
      (headerFields: NSDictionary; forURL: NSURL): NSArray; cdecl;
  end;

  NSHTTPCookie = interface(NSObject)
    ['{68213D01-01D4-480A-89F5-79DBFD05274E}']
    function initWithProperties(properties: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function properties: NSDictionary; cdecl;
    function version: NSUInteger; cdecl;
    function name: NSString; cdecl;
    function value: NSString; cdecl;
    function expiresDate: NSDate; cdecl;
    function isSessionOnly: Boolean; cdecl;
    function domain: NSString; cdecl;
    function path: NSString; cdecl;
    function isSecure: Boolean; cdecl;
    function isHTTPOnly: Boolean; cdecl;
    function comment: NSString; cdecl;
    function commentURL: NSURL; cdecl;
    function portList: NSArray; cdecl;
    function sameSitePolicy: NSHTTPCookieStringPolicy; cdecl;
  end;

  TNSHTTPCookie = class(TOCGenericImport<NSHTTPCookieClass, NSHTTPCookie>)
  end;

  PNSHTTPCookie = Pointer;

  NSURLSessionTaskClass = interface(NSObjectClass)
    ['{5F5D69DD-AC98-428C-A2E8-7FCF1C11171A}']
    { class } function new: Pointer { instancetype }; cdecl;
  end;

  NSURLSessionTask = interface(NSObject)
    ['{E9CB5E48-7EB1-4A8D-8F2F-67326FE8F180}']
    function taskIdentifier: NSUInteger; cdecl;
    function originalRequest: NSURLRequest; cdecl;
    function currentRequest: NSURLRequest; cdecl;
    function response: NSURLResponse; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function progress: NSProgress; cdecl;
    procedure setEarliestBeginDate(earliestBeginDate: NSDate); cdecl;
    function earliestBeginDate: NSDate; cdecl;
    procedure setCountOfBytesClientExpectsToSend(countOfBytesClientExpectsToSend
      : Int64); cdecl;
    function countOfBytesClientExpectsToSend: Int64; cdecl;
    procedure setCountOfBytesClientExpectsToReceive
      (countOfBytesClientExpectsToReceive: Int64); cdecl;
    function countOfBytesClientExpectsToReceive: Int64; cdecl;
    function countOfBytesSent: Int64; cdecl;
    function countOfBytesReceived: Int64; cdecl;
    function countOfBytesExpectedToSend: Int64; cdecl;
    function countOfBytesExpectedToReceive: Int64; cdecl;
    procedure setTaskDescription(taskDescription: NSString); cdecl;
    function taskDescription: NSString; cdecl;
    procedure cancel; cdecl;
    function state: NSURLSessionTaskState; cdecl;
    function error: NSError; cdecl;
    procedure suspend; cdecl;
    procedure resume; cdecl;
    procedure setPriority(priority: Single); cdecl;
    function priority: Single; cdecl;
    procedure setPrefersIncrementalDelivery(prefersIncrementalDelivery
      : Boolean); cdecl;
    function prefersIncrementalDelivery: Boolean; cdecl;
    function init: Pointer { instancetype }; cdecl;
  end;

  TNSURLSessionTask = class(TOCGenericImport<NSURLSessionTaskClass,
    NSURLSessionTask>)
  end;

  PNSURLSessionTask = Pointer;

  NSSortDescriptorClass = interface(NSObjectClass)
    ['{8B74F4F9-E552-4921-AFFB-FFE824DD52AF}']
    [MethodName('sortDescriptorWithKey:ascending:')]
    { class } function sortDescriptorWithKeyAscending(key: NSString;
      ascending: Boolean): Pointer { instancetype }; cdecl;
    [MethodName('sortDescriptorWithKey:ascending:selector:')]
    { class } function sortDescriptorWithKeyAscendingSelector(key: NSString;
      ascending: Boolean; selector: SEL): Pointer { instancetype }; cdecl;
    [MethodName('sortDescriptorWithKey:ascending:comparator:')]
    { class } function sortDescriptorWithKeyAscendingComparator(key: NSString;
      ascending: Boolean; comparator: NSComparator)
      : Pointer { instancetype }; cdecl;
  end;

  NSSortDescriptor = interface(NSObject)
    ['{FF91C5DA-379B-40CF-997F-2BA480F1481D}']
    [MethodName('initWithKey:ascending:')]
    function initWithKeyAscending(key: NSString; ascending: Boolean)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithKey:ascending:selector:')]
    function initWithKeyAscendingSelector(key: NSString; ascending: Boolean;
      selector: SEL): Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function key: NSString; cdecl;
    function ascending: Boolean; cdecl;
    function selector: SEL; cdecl;
    procedure allowEvaluation; cdecl;
    [MethodName('initWithKey:ascending:comparator:')]
    function initWithKeyAscendingComparator(key: NSString; ascending: Boolean;
      comparator: NSComparator): Pointer { instancetype }; cdecl;
    function comparator: NSComparator; cdecl;
    function compareObject(object1: Pointer; toObject: Pointer)
      : NSComparisonResult; cdecl;
    function reversedSortDescriptor: Pointer; cdecl;
  end;

  TNSSortDescriptor = class(TOCGenericImport<NSSortDescriptorClass,
    NSSortDescriptor>)
  end;

  PNSSortDescriptor = Pointer;

  NSHTTPCookieStorageClass = interface(NSObjectClass)
    ['{49D9B7C2-D750-4056-948A-9C1AD28889F9}']
    { class } function sharedCookieStorageForGroupContainerIdentifier
      (identifier: NSString): NSHTTPCookieStorage; cdecl;
  end;

  NSHTTPCookieStorage = interface(NSObject)
    ['{FDB210B4-F6DA-4387-AB37-F6B68D74B4CA}']
    procedure setSharedHTTPCookieStorage(sharedHTTPCookieStorage
      : NSHTTPCookieStorage); cdecl;
    function sharedHTTPCookieStorage: NSHTTPCookieStorage; cdecl;
    function cookies: NSArray; cdecl;
    procedure setCookie(cookie: NSHTTPCookie); cdecl;
    procedure deleteCookie(cookie: NSHTTPCookie); cdecl;
    procedure removeCookiesSinceDate(date: NSDate); cdecl;
    function cookiesForURL(url: NSURL): NSArray; cdecl;
    procedure setCookies(cookies: NSArray; forURL: NSURL;
      mainDocumentURL: NSURL); cdecl;
    procedure setCookieAcceptPolicy(cookieAcceptPolicy
      : NSHTTPCookieAcceptPolicy); cdecl;
    function cookieAcceptPolicy: NSHTTPCookieAcceptPolicy; cdecl;
    function sortedCookiesUsingDescriptors(sortOrder: NSArray): NSArray; cdecl;
    procedure storeCookies(cookies: NSArray; forTask: NSURLSessionTask); cdecl;
    procedure getCookiesForTask(task: NSURLSessionTask;
      completionHandler: TFoundationCompletionHandler5); cdecl;
  end;

  TNSHTTPCookieStorage = class(TOCGenericImport<NSHTTPCookieStorageClass,
    NSHTTPCookieStorage>)
  end;

  PNSHTTPCookieStorage = Pointer;

  NSIndexPathClass = interface(NSObjectClass)
    ['{14F9FDCF-7A4C-4B81-AF11-D56A3349AB0E}']
    { class } function indexPathWithIndex(index: NSUInteger)
      : Pointer { instancetype }; cdecl;
    { class } function indexPathWithIndexes(indexes: NSUInteger;
      length: NSUInteger): Pointer { instancetype }; cdecl;
  end;

  NSIndexPath = interface(NSObject)
    ['{A93D5536-7C1F-49A6-85A1-14728EE07ED7}']
    function initWithIndexes(indexes: NSUInteger; length: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithIndex(index: NSUInteger): Pointer { instancetype }; cdecl;
    function indexPathByAddingIndex(index: NSUInteger): NSIndexPath; cdecl;
    function indexPathByRemovingLastIndex: NSIndexPath; cdecl;
    function indexAtPosition(position: NSUInteger): NSUInteger; cdecl;
    function length: NSUInteger; cdecl;
    [MethodName('getIndexes:range:')]
    procedure getIndexesRange(indexes: PNSUInteger; range: NSRange); cdecl;
    function compare(otherObject: NSIndexPath): NSComparisonResult; cdecl;
    [MethodName('getIndexes:')]
    procedure getIndexes(indexes: PNSUInteger); cdecl;
  end;

  TNSIndexPath = class(TOCGenericImport<NSIndexPathClass, NSIndexPath>)
  end;

  PNSIndexPath = Pointer;

  NSMorphologyClass = interface(NSObjectClass)
    ['{33A0D1C9-4806-4B65-973C-21ECA0EA5AD5}']
  end;

  NSMorphology = interface(NSObject)
    ['{48979866-73A0-40E6-B196-B590B19247E9}']
    procedure setGrammaticalGender(grammaticalGender
      : NSGrammaticalGender); cdecl;
    function grammaticalGender: NSGrammaticalGender; cdecl;
    procedure setPartOfSpeech(partOfSpeech: NSGrammaticalPartOfSpeech); cdecl;
    function partOfSpeech: NSGrammaticalPartOfSpeech; cdecl;
    procedure setNumber(number: NSGrammaticalNumber); cdecl;
    function number: NSGrammaticalNumber; cdecl;
    function customPronounForLanguage(language: NSString)
      : NSMorphologyCustomPronoun; cdecl;
    function setCustomPronoun(features: NSMorphologyCustomPronoun;
      forLanguage: NSString; error: NSError): Boolean; cdecl;
    function isUnspecified: Boolean; cdecl;
    procedure setUserMorphology(userMorphology: NSMorphology); cdecl;
    function userMorphology: NSMorphology; cdecl;
  end;

  TNSMorphology = class(TOCGenericImport<NSMorphologyClass, NSMorphology>)
  end;

  PNSMorphology = Pointer;

  NSInflectionRuleClass = interface(NSObjectClass)
    ['{345F6315-BCA7-4F06-A274-6719E24BBF7F}']
    { class } function canInflectLanguage(language: NSString): Boolean; cdecl;
  end;

  NSInflectionRule = interface(NSObject)
    ['{49152824-7FB9-45D1-8D91-C326AA8083AA}']
    procedure setAutomaticRule(automaticRule: NSInflectionRule); cdecl;
    function automaticRule: NSInflectionRule; cdecl;
    procedure setCanInflectPreferredLocalization(canInflectPreferredLocalization
      : Boolean); cdecl;
    function canInflectPreferredLocalization: Boolean; cdecl;
  end;

  TNSInflectionRule = class(TOCGenericImport<NSInflectionRuleClass,
    NSInflectionRule>)
  end;

  PNSInflectionRule = Pointer;

  NSInflectionRuleExplicitClass = interface(NSInflectionRuleClass)
    ['{58F5B378-A9AC-4546-A3D7-9AA43D922752}']
  end;

  NSInflectionRuleExplicit = interface(NSInflectionRule)
    ['{C7EE1156-0EDB-4C3D-8F66-27917194CACD}']
    function initWithMorphology(morphology: NSMorphology)
      : Pointer { instancetype }; cdecl;
    function morphology: NSMorphology; cdecl;
  end;

  TNSInflectionRuleExplicit = class
    (TOCGenericImport<NSInflectionRuleExplicitClass, NSInflectionRuleExplicit>)
  end;

  PNSInflectionRuleExplicit = Pointer;

  NSStreamClass = interface(NSObjectClass)
    ['{4865176E-D6D6-4E2F-96F9-181C493BF8D5}']
    { class } procedure getStreamsToHostWithName(hostname: NSString;
      port: NSInteger; inputStream: NSInputStream;
      outputStream: NSOutputStream); cdecl;
    { class } procedure getBoundStreamsWithBufferSize(bufferSize: NSUInteger;
      inputStream: NSInputStream; outputStream: NSOutputStream); cdecl;
  end;

  NSStream = interface(NSObject)
    ['{B4E771EB-30CB-40FA-998F-ADEAC8CABCF8}']
    procedure open; cdecl;
    procedure close; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function propertyForKey(key: NSStreamPropertyKey): Pointer; cdecl;
    function setProperty(&property: Pointer; forKey: NSStreamPropertyKey)
      : Boolean; cdecl;
    procedure scheduleInRunLoop(aRunLoop: NSRunLoop;
      forMode: NSRunLoopMode); cdecl;
    procedure removeFromRunLoop(aRunLoop: NSRunLoop;
      forMode: NSRunLoopMode); cdecl;
    function streamStatus: NSStreamStatus; cdecl;
    function streamError: NSError; cdecl;
  end;

  TNSStream = class(TOCGenericImport<NSStreamClass, NSStream>)
  end;

  PNSStream = Pointer;

  NSOutputStreamClass = interface(NSStreamClass)
    ['{7B9F2B29-1666-4E90-8836-96AC31F64331}']
    { class } function outputStreamToMemory: Pointer { instancetype }; cdecl;
    { class } function outputStreamToBuffer(buffer: PByte; capacity: NSUInteger)
      : Pointer { instancetype }; cdecl;
    { class } function outputStreamToFileAtPath(path: NSString; append: Boolean)
      : Pointer { instancetype }; cdecl;
    { class } function outputStreamWithURL(url: NSURL; append: Boolean)
      : Pointer { instancetype }; cdecl;
  end;

  NSOutputStream = interface(NSStream)
    ['{0E3FA0A8-65DB-4F08-B31B-7AD4D95CC60D}']
    function write(buffer: PByte; maxLength: NSUInteger): NSInteger; cdecl;
    function hasSpaceAvailable: Boolean; cdecl;
    function initToMemory: Pointer { instancetype }; cdecl;
    function initToBuffer(buffer: PByte; capacity: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithURL(url: NSURL; append: Boolean)
      : Pointer { instancetype }; cdecl;
    function initToFileAtPath(path: NSString; append: Boolean)
      : Pointer { instancetype }; cdecl;
  end;

  TNSOutputStream = class(TOCGenericImport<NSOutputStreamClass, NSOutputStream>)
  end;

  PNSOutputStream = Pointer;

  NSInputStreamClass = interface(NSStreamClass)
    ['{BFC3832A-4E05-4192-9DA8-016E8B7CB9E8}']
    { class } function inputStreamWithData(data: NSData)
      : Pointer { instancetype }; cdecl;
    { class } function inputStreamWithFileAtPath(path: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function inputStreamWithURL(url: NSURL)
      : Pointer { instancetype }; cdecl;
  end;

  NSInputStream = interface(NSStream)
    ['{EC88BE7C-824E-4910-8CB8-DEA3D5F46ACE}']
    function read(buffer: PByte; maxLength: NSUInteger): NSInteger; cdecl;
    function getBuffer(buffer: PByte; length: PNSUInteger): Boolean; cdecl;
    function hasBytesAvailable: Boolean; cdecl;
    function initWithData(data: NSData): Pointer { instancetype }; cdecl;
    function initWithURL(url: NSURL): Pointer { instancetype }; cdecl;
    function initWithFileAtPath(path: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  TNSInputStream = class(TOCGenericImport<NSInputStreamClass, NSInputStream>)
  end;

  PNSInputStream = Pointer;

  NSJSONSerializationClass = interface(NSObjectClass)
    ['{75D95AE0-AD08-4334-9DA4-2BCAD307DC0F}']
    { class } function isValidJSONObject(obj: Pointer): Boolean; cdecl;
    { class } function dataWithJSONObject(obj: Pointer;
      options: NSJSONWritingOptions; error: NSError): NSData; cdecl;
    { class } function JSONObjectWithData(data: NSData;
      options: NSJSONReadingOptions; error: NSError): Pointer; cdecl;
    { class } function writeJSONObject(obj: Pointer; toStream: NSOutputStream;
      options: NSJSONWritingOptions; error: NSError): NSInteger; cdecl;
    { class } function JSONObjectWithStream(stream: NSInputStream;
      options: NSJSONReadingOptions; error: NSError): Pointer; cdecl;
  end;

  NSJSONSerialization = interface(NSObject)
    ['{FAB87844-7B87-43CD-8DD3-0FE51F8F9E3F}']
  end;

  TNSJSONSerialization = class(TOCGenericImport<NSJSONSerializationClass,
    NSJSONSerialization>)
  end;

  PNSJSONSerialization = Pointer;

  NSOrderedSetClass = interface(NSObjectClass)
    ['{2D763FE7-4052-4682-97CF-4E9A9E5E9984}']
    { class } function orderedSet: Pointer { instancetype }; cdecl;
    { class } function orderedSetWithObject(&object: ObjectType)
      : Pointer { instancetype }; cdecl;
    [MethodName('orderedSetWithObjects:count:')]
    { class } function orderedSetWithObjectsCount(objects: ObjectType;
      count: NSUInteger): Pointer { instancetype }; cdecl;
    [MethodName('orderedSetWithObjects:')]
    { class } function orderedSetWithObjects(firstObj: ObjectType)
      : Pointer { instancetype }; cdecl;
    [MethodName('orderedSetWithOrderedSet:')]
    { class } function orderedSetWithOrderedSet(&set: NSOrderedSet)
      : Pointer { instancetype }; cdecl;
    [MethodName('orderedSetWithOrderedSet:range:copyItems:')]
    { class } function orderedSetWithOrderedSetRangeCopyItems
      (&set: NSOrderedSet; range: NSRange; copyItems: Boolean)
      : Pointer { instancetype }; cdecl;
    [MethodName('orderedSetWithArray:')]
    { class } function orderedSetWithArray(&array: NSArray)
      : Pointer { instancetype }; cdecl;
    [MethodName('orderedSetWithArray:range:copyItems:')]
    { class } function orderedSetWithArrayRangeCopyItems(&array: NSArray;
      range: NSRange; copyItems: Boolean): Pointer { instancetype }; cdecl;
    [MethodName('orderedSetWithSet:')]
    { class } function orderedSetWithSet(&set: NSSet)
      : Pointer { instancetype }; cdecl;
    [MethodName('orderedSetWithSet:copyItems:')]
    { class } function orderedSetWithSetCopyItems(&set: NSSet;
      copyItems: Boolean): Pointer { instancetype }; cdecl;
  end;

  NSOrderedSet = interface(NSObject)
    ['{C4A0106F-5D0D-4165-86A6-73FA7972DAFD}']
    function count: NSUInteger; cdecl;
    function objectAtIndex(idx: NSUInteger): ObjectType; cdecl;
    [MethodName('indexOfObject:')]
    function indexOfObject(&object: ObjectType): NSUInteger; cdecl;
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithObjects:count:')]
    function initWithObjectsCount(objects: ObjectType; count: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    procedure getObjects(objects: ObjectType; range: NSRange); cdecl;
    function objectsAtIndexes(indexes: NSIndexSet): NSArray; cdecl;
    function firstObject: ObjectType; cdecl;
    function lastObject: ObjectType; cdecl;
    function isEqualToOrderedSet(other: NSOrderedSet): Boolean; cdecl;
    function containsObject(&object: ObjectType): Boolean; cdecl;
    function intersectsOrderedSet(other: NSOrderedSet): Boolean; cdecl;
    function intersectsSet(&set: NSSet): Boolean; cdecl;
    function isSubsetOfOrderedSet(other: NSOrderedSet): Boolean; cdecl;
    function isSubsetOfSet(&set: NSSet): Boolean; cdecl;
    function objectAtIndexedSubscript(idx: NSUInteger): ObjectType; cdecl;
    function objectEnumerator: NSEnumerator; cdecl;
    function reverseObjectEnumerator: NSEnumerator; cdecl;
    function reversedOrderedSet: NSOrderedSet; cdecl;
    function &array: NSArray; cdecl;
    function &set: NSSet; cdecl;
    procedure enumerateObjectsUsingBlock(block: TFoundationBlock3); cdecl;
    procedure enumerateObjectsWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock3); cdecl;
    procedure enumerateObjectsAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; usingBlock: TFoundationBlock3); cdecl;
    function indexOfObjectPassingTest(predicate: TFoundationPredicate1)
      : NSUInteger; cdecl;
    function indexOfObjectWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate1): NSUInteger; cdecl;
    function indexOfObjectAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; passingTest: TFoundationPredicate1)
      : NSUInteger; cdecl;
    function indexesOfObjectsPassingTest(predicate: TFoundationPredicate1)
      : NSIndexSet; cdecl;
    function indexesOfObjectsWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate1): NSIndexSet; cdecl;
    function indexesOfObjectsAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; passingTest: TFoundationPredicate1)
      : NSIndexSet; cdecl;
    [MethodName('indexOfObject:inSortedRange:options:usingComparator:')]
    function indexOfObjectInSortedRangeOptionsUsingComparator
      (&object: ObjectType; inSortedRange: NSRange;
      options: NSBinarySearchingOptions; usingComparator: NSComparator)
      : NSUInteger; cdecl;
    function sortedArrayUsingComparator(cmptr: NSComparator): NSArray; cdecl;
    function sortedArrayWithOptions(opts: NSSortOptions;
      usingComparator: NSComparator): NSArray; cdecl;
    function description: NSString; cdecl;
    [MethodName('descriptionWithLocale:')]
    function descriptionWithLocale(locale: Pointer): NSString; cdecl;
    [MethodName('descriptionWithLocale:indent:')]
    function descriptionWithLocaleIndent(locale: Pointer; indent: NSUInteger)
      : NSString; cdecl;
    function initWithObject(&object: ObjectType)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithObjects:')]
    function initWithObjects(firstObj: ObjectType)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithOrderedSet:')]
    function initWithOrderedSet(&set: NSOrderedSet)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithOrderedSet:copyItems:')]
    function initWithOrderedSetCopyItems(&set: NSOrderedSet; copyItems: Boolean)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithOrderedSet:range:copyItems:')]
    function initWithOrderedSetRangeCopyItems(&set: NSOrderedSet;
      range: NSRange; copyItems: Boolean): Pointer { instancetype }; cdecl;
    [MethodName('initWithArray:')]
    function initWithArray(&array: NSArray): Pointer { instancetype }; cdecl;
    [MethodName('initWithArray:copyItems:')]
    function initWithArrayCopyItems(&set: NSArray; copyItems: Boolean)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithArray:range:copyItems:')]
    function initWithArrayRangeCopyItems(&set: NSArray; range: NSRange;
      copyItems: Boolean): Pointer { instancetype }; cdecl;
    [MethodName('initWithSet:')]
    function initWithSet(&set: NSSet): Pointer { instancetype }; cdecl;
    [MethodName('initWithSet:copyItems:')]
    function initWithSetCopyItems(&set: NSSet; copyItems: Boolean)
      : Pointer { instancetype }; cdecl;
    [MethodName('differenceFromOrderedSet:withOptions:usingEquivalenceTest:')]
    function differenceFromOrderedSetWithOptionsUsingEquivalenceTest
      (other: NSOrderedSet;
      withOptions: NSOrderedCollectionDifferenceCalculationOptions;
      usingEquivalenceTest: TFoundationUsingEquivalenceTest)
      : NSOrderedCollectionDifference; cdecl;
    [MethodName('differenceFromOrderedSet:withOptions:')]
    function differenceFromOrderedSetWithOptions(other: NSOrderedSet;
      withOptions: NSOrderedCollectionDifferenceCalculationOptions)
      : NSOrderedCollectionDifference; cdecl;
    [MethodName('differenceFromOrderedSet:')]
    function differenceFromOrderedSet(other: NSOrderedSet)
      : NSOrderedCollectionDifference; cdecl;
    function orderedSetByApplyingDifference(difference
      : NSOrderedCollectionDifference): NSOrderedSet; cdecl;
    function valueForKey(key: NSString): Pointer; cdecl;
    procedure setValue(value: Pointer; forKey: NSString); cdecl;
    procedure addObserver(observer: NSObject; forKeyPath: NSString;
      options: NSKeyValueObservingOptions; context: Pointer); cdecl;
    [MethodName('removeObserver:forKeyPath:context:')]
    procedure removeObserverForKeyPathContext(observer: NSObject;
      forKeyPath: NSString; context: Pointer); cdecl;
    [MethodName('removeObserver:forKeyPath:')]
    procedure removeObserverForKeyPath(observer: NSObject;
      forKeyPath: NSString); cdecl;
    function sortedArrayUsingDescriptors(sortDescriptors: NSArray)
      : NSArray; cdecl;
    function filteredOrderedSetUsingPredicate(p: NSPredicate)
      : NSOrderedSet; cdecl;
  end;

  TNSOrderedSet = class(TOCGenericImport<NSOrderedSetClass, NSOrderedSet>)
  end;

  PNSOrderedSet = Pointer;

  NSMutableOrderedSetClass = interface(NSOrderedSetClass)
    ['{174956EE-4D13-4372-9F63-06E8955DF09A}']
    { class } function orderedSetWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
  end;

  NSMutableOrderedSet = interface(NSOrderedSet)
    ['{03885572-F2E1-4761-919C-EF3E5E019457}']
    procedure insertObject(&object: ObjectType; atIndex: NSUInteger); cdecl;
    procedure removeObjectAtIndex(idx: NSUInteger); cdecl;
    procedure replaceObjectAtIndex(idx: NSUInteger;
      withObject: ObjectType); cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
    procedure addObject(&object: ObjectType); cdecl;
    procedure addObjects(objects: ObjectType; count: NSUInteger); cdecl;
    procedure addObjectsFromArray(&array: NSArray); cdecl;
    procedure exchangeObjectAtIndex(idx1: NSUInteger;
      withObjectAtIndex: NSUInteger); cdecl;
    procedure moveObjectsAtIndexes(indexes: NSIndexSet;
      toIndex: NSUInteger); cdecl;
    procedure insertObjects(objects: NSArray; atIndexes: NSIndexSet); cdecl;
    [MethodName('setObject:atIndex:')]
    procedure setObjectAtIndex(obj: ObjectType; atIndex: NSUInteger); cdecl;
    [MethodName('setObject:atIndexedSubscript:')]
    procedure setObjectAtIndexedSubscript(obj: ObjectType;
      atIndexedSubscript: NSUInteger); cdecl;
    procedure replaceObjectsInRange(range: NSRange; withObjects: ObjectType;
      count: NSUInteger); cdecl;
    procedure replaceObjectsAtIndexes(indexes: NSIndexSet;
      withObjects: NSArray); cdecl;
    procedure removeObjectsInRange(range: NSRange); cdecl;
    procedure removeObjectsAtIndexes(indexes: NSIndexSet); cdecl;
    procedure removeAllObjects; cdecl;
    procedure removeObject(&object: ObjectType); cdecl;
    procedure removeObjectsInArray(&array: NSArray); cdecl;
    procedure intersectOrderedSet(other: NSOrderedSet); cdecl;
    procedure minusOrderedSet(other: NSOrderedSet); cdecl;
    procedure unionOrderedSet(other: NSOrderedSet); cdecl;
    procedure intersectSet(other: NSSet); cdecl;
    procedure minusSet(other: NSSet); cdecl;
    procedure unionSet(other: NSSet); cdecl;
    procedure sortUsingComparator(cmptr: NSComparator); cdecl;
    procedure sortWithOptions(opts: NSSortOptions;
      usingComparator: NSComparator); cdecl;
    procedure sortRange(range: NSRange; options: NSSortOptions;
      usingComparator: NSComparator); cdecl;
    procedure applyDifference(difference: NSOrderedCollectionDifference); cdecl;
    procedure sortUsingDescriptors(sortDescriptors: NSArray); cdecl;
    procedure filterUsingPredicate(p: NSPredicate); cdecl;
  end;

  TNSMutableOrderedSet = class(TOCGenericImport<NSMutableOrderedSetClass,
    NSMutableOrderedSet>)
  end;

  PNSMutableOrderedSet = Pointer;

  NSKeyValueCoding = interface(IObjectiveC)
    ['{F9DA214B-F7BF-41ED-8113-E94F0795A72E}']
    procedure setAccessInstanceVariablesDirectly(accessInstanceVariablesDirectly
      : Boolean); cdecl;
    function accessInstanceVariablesDirectly: Boolean; cdecl;
    function valueForKey(key: NSString): Pointer; cdecl;
    [MethodName('setValue:forKey:')]
    procedure setValueForKey(value: Pointer; forKey: NSString); cdecl;
    [MethodName('validateValue:forKey:error:')]
    function validateValueForKeyError(ioValue: Pointer; forKey: NSString;
      error: NSError): Boolean; cdecl;
    function mutableArrayValueForKey(key: NSString): NSMutableArray; cdecl;
    function mutableOrderedSetValueForKey(key: NSString)
      : NSMutableOrderedSet; cdecl;
    function mutableSetValueForKey(key: NSString): NSMutableSet; cdecl;
    function valueForKeyPath(keyPath: NSString): Pointer; cdecl;
    [MethodName('setValue:forKeyPath:')]
    procedure setValueForKeyPath(value: Pointer; forKeyPath: NSString); cdecl;
    [MethodName('validateValue:forKeyPath:error:')]
    function validateValueForKeyPathError(ioValue: Pointer;
      forKeyPath: NSString; error: NSError): Boolean; cdecl;
    function mutableArrayValueForKeyPath(keyPath: NSString)
      : NSMutableArray; cdecl;
    function mutableOrderedSetValueForKeyPath(keyPath: NSString)
      : NSMutableOrderedSet; cdecl;
    function mutableSetValueForKeyPath(keyPath: NSString): NSMutableSet; cdecl;
    function valueForUndefinedKey(key: NSString): Pointer; cdecl;
    [MethodName('setValue:forUndefinedKey:')]
    procedure setValueForUndefinedKey(value: Pointer;
      forUndefinedKey: NSString); cdecl;
    procedure setNilValueForKey(key: NSString); cdecl;
    function dictionaryWithValuesForKeys(keys: NSArray): NSDictionary; cdecl;
    procedure setValuesForKeysWithDictionary(keyedValues: NSDictionary); cdecl;
  end;

  NSKeyValueObserving = interface(IObjectiveC)
    ['{657C4415-0FE3-4A76-863A-9FD261CCCC6E}']
    procedure observeValueForKeyPath(keyPath: NSString; ofObject: Pointer;
      change: NSDictionary; context: Pointer); cdecl;
  end;

  NSKeyValueObserverRegistration = interface(IObjectiveC)
    ['{CA54D885-26DB-49BF-8E16-11329C58116B}']
    procedure addObserver(observer: NSObject; forKeyPath: NSString;
      options: NSKeyValueObservingOptions; context: Pointer); cdecl;
    [MethodName('removeObserver:forKeyPath:context:')]
    procedure removeObserverForKeyPathContext(observer: NSObject;
      forKeyPath: NSString; context: Pointer); cdecl;
    [MethodName('removeObserver:forKeyPath:')]
    procedure removeObserverForKeyPath(observer: NSObject;
      forKeyPath: NSString); cdecl;
  end;

  NSKeyValueObserverNotification = interface(IObjectiveC)
    ['{DC6EDDBC-73CB-4C36-B96D-BD8CFFF064A1}']
    [MethodName('willChangeValueForKey:')]
    procedure willChangeValueForKey(key: NSString); cdecl;
    [MethodName('didChangeValueForKey:')]
    procedure didChangeValueForKey(key: NSString); cdecl;
    procedure willChange(changeKind: NSKeyValueChange;
      valuesAtIndexes: NSIndexSet; forKey: NSString); cdecl;
    procedure didChange(changeKind: NSKeyValueChange;
      valuesAtIndexes: NSIndexSet; forKey: NSString); cdecl;
    [MethodName('willChangeValueForKey:withSetMutation:usingObjects:')]
    procedure willChangeValueForKeyWithSetMutationUsingObjects(key: NSString;
      withSetMutation: NSKeyValueSetMutationKind; usingObjects: NSSet); cdecl;
    [MethodName('didChangeValueForKey:withSetMutation:usingObjects:')]
    procedure didChangeValueForKeyWithSetMutationUsingObjects(key: NSString;
      withSetMutation: NSKeyValueSetMutationKind; usingObjects: NSSet); cdecl;
  end;

  NSKeyValueObservingCustomization = interface(IObjectiveC)
    ['{B526EE69-41F7-43D2-BA46-AB3B1D7C3E6D}']
    function keyPathsForValuesAffectingValueForKey(key: NSString): NSSet; cdecl;
    function automaticallyNotifiesObserversForKey(key: NSString)
      : Boolean; cdecl;
    procedure setObservationInfo(observationInfo: Pointer); cdecl;
    function observationInfo: Pointer; cdecl;
  end;

  NSPropertyListSerializationClass = interface(NSObjectClass)
    ['{BBB0EB13-D821-4C6D-A986-740B360BA915}']
    { class } function propertyList(plist: Pointer;
      isValidForFormat: NSPropertyListFormat): Boolean; cdecl;
    { class } function dataWithPropertyList(plist: Pointer;
      format: NSPropertyListFormat; options: NSPropertyListWriteOptions;
      error: NSError): NSData; cdecl;
    { class } function writePropertyList(plist: Pointer;
      toStream: NSOutputStream; format: NSPropertyListFormat;
      options: NSPropertyListWriteOptions; error: NSError): NSInteger; cdecl;
    { class } function propertyListWithData(data: NSData;
      options: NSPropertyListReadOptions; format: PNSPropertyListFormat;
      error: NSError): Pointer; cdecl;
    { class } function propertyListWithStream(stream: NSInputStream;
      options: NSPropertyListReadOptions; format: PNSPropertyListFormat;
      error: NSError): Pointer; cdecl;
    { class } function dataFromPropertyList(plist: Pointer;
      format: NSPropertyListFormat; errorDescription: NSString): NSData; cdecl;
    { class } function propertyListFromData(data: NSData;
      mutabilityOption: NSPropertyListMutabilityOptions;
      format: PNSPropertyListFormat; errorDescription: NSString)
      : Pointer; cdecl;
  end;

  NSPropertyListSerialization = interface(NSObject)
    ['{517ABC28-079B-4A0B-A0B8-1CBC88A9C7C3}']
  end;

  TNSPropertyListSerialization = class
    (TOCGenericImport<NSPropertyListSerializationClass,
    NSPropertyListSerialization>)
  end;

  PNSPropertyListSerialization = Pointer;

  NSKeyedArchiverClass = interface(NSCoderClass)
    ['{A59D0FEF-E603-438E-9E90-5A37914AB593}']
    [MethodName('archivedDataWithRootObject:requiringSecureCoding:error:')]
    { class } function archivedDataWithRootObjectRequiringSecureCodingError
      (&object: Pointer; requiringSecureCoding: Boolean; error: NSError)
      : NSData; cdecl;
    [MethodName('archivedDataWithRootObject:')]
    { class } function archivedDataWithRootObject(rootObject: Pointer)
      : NSData; cdecl;
    { class } function archiveRootObject(rootObject: Pointer; toFile: NSString)
      : Boolean; cdecl;
    { class } procedure setClassName(codedName: NSString;
      forClass: Pointer); cdecl;
    { class } function classNameForClass(cls: Pointer): NSString; cdecl;
  end;

  NSKeyedArchiver = interface(NSCoder)
    ['{586A3122-8345-4641-9E3E-37B47B6A647D}']
    function initRequiringSecureCoding(requiresSecureCoding: Boolean)
      : Pointer { instancetype }; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initForWritingWithMutableData(data: NSMutableData)
      : Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setOutputFormat(outputFormat: NSPropertyListFormat); cdecl;
    function outputFormat: NSPropertyListFormat; cdecl;
    function encodedData: NSData; cdecl;
    procedure finishEncoding; cdecl;
    procedure setClassName(codedName: NSString; forClass: Pointer); cdecl;
    function classNameForClass(cls: Pointer): NSString; cdecl;
    procedure encodeObject(&object: Pointer; forKey: NSString); cdecl;
    procedure encodeConditionalObject(&object: Pointer;
      forKey: NSString); cdecl;
    procedure encodeBool(value: Boolean; forKey: NSString); cdecl;
    procedure encodeInt(value: Integer; forKey: NSString); cdecl;
    procedure encodeInt32(value: Int32; forKey: NSString); cdecl;
    procedure encodeInt64(value: Int64; forKey: NSString); cdecl;
    procedure encodeFloat(value: Single; forKey: NSString); cdecl;
    procedure encodeDouble(value: Double; forKey: NSString); cdecl;
    procedure encodeBytes(bytes: PByte; length: NSUInteger;
      forKey: NSString); cdecl;
    procedure setRequiresSecureCoding(requiresSecureCoding: Boolean); cdecl;
    function requiresSecureCoding: Boolean; cdecl;
  end;

  TNSKeyedArchiver = class(TOCGenericImport<NSKeyedArchiverClass,
    NSKeyedArchiver>)
  end;

  PNSKeyedArchiver = Pointer;

  NSKeyedUnarchiverClass = interface(NSCoderClass)
    ['{E76307D6-7F09-4AFC-B099-C3883396C8BF}']
    { class } function unarchivedObjectOfClass(cls: Pointer; fromData: NSData;
      error: NSError): Pointer; cdecl;
    { class } function unarchivedArrayOfObjectsOfClass(cls: Pointer;
      fromData: NSData; error: NSError): NSArray; cdecl;
    { class } function unarchivedDictionaryWithKeysOfClass(keyCls: Pointer;
      objectsOfClass: Pointer; fromData: NSData; error: NSError)
      : NSDictionary; cdecl;
    { class } function unarchivedObjectOfClasses(classes: NSSet;
      fromData: NSData; error: NSError): Pointer; cdecl;
    { class } function unarchivedArrayOfObjectsOfClasses(classes: NSSet;
      fromData: NSData; error: NSError): NSArray; cdecl;
    { class } function unarchivedDictionaryWithKeysOfClasses(keyClasses: NSSet;
      objectsOfClasses: NSSet; fromData: NSData; error: NSError)
      : NSDictionary; cdecl;
    { class } function unarchiveObjectWithData(data: NSData): Pointer; cdecl;
    { class } function unarchiveTopLevelObjectWithData(data: NSData;
      error: NSError): Pointer; cdecl;
    { class } function unarchiveObjectWithFile(path: NSString): Pointer; cdecl;
    { class } procedure setClass(cls: Pointer; forClassName: NSString); cdecl;
    { class } function classForClassName(codedName: NSString): Pointer; cdecl;
  end;

  NSKeyedUnarchiver = interface(NSCoder)
    ['{06FBBBFB-34D0-4789-AB76-5275E0144681}']
    function initForReadingFromData(data: NSData; error: NSError)
      : Pointer { instancetype }; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initForReadingWithData(data: NSData)
      : Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure finishDecoding; cdecl;
    procedure setClass(cls: Pointer; forClassName: NSString); cdecl;
    function classForClassName(codedName: NSString): Pointer; cdecl;
    function containsValueForKey(key: NSString): Boolean; cdecl;
    function decodeObjectForKey(key: NSString): Pointer; cdecl;
    function decodeBoolForKey(key: NSString): Boolean; cdecl;
    function decodeIntForKey(key: NSString): Integer; cdecl;
    function decodeInt32ForKey(key: NSString): Int32; cdecl;
    function decodeInt64ForKey(key: NSString): Int64; cdecl;
    function decodeFloatForKey(key: NSString): Single; cdecl;
    function decodeDoubleForKey(key: NSString): Double; cdecl;
    function decodeBytesForKey(key: NSString; returnedLength: PNSUInteger)
      : PByte; cdecl;
    procedure setRequiresSecureCoding(requiresSecureCoding: Boolean); cdecl;
    function requiresSecureCoding: Boolean; cdecl;
    procedure setDecodingFailurePolicy(decodingFailurePolicy
      : NSDecodingFailurePolicy); cdecl;
    function decodingFailurePolicy: NSDecodingFailurePolicy; cdecl;
  end;

  TNSKeyedUnarchiver = class(TOCGenericImport<NSKeyedUnarchiverClass,
    NSKeyedUnarchiver>)
  end;

  PNSKeyedUnarchiver = Pointer;

  NSKeyedArchiverObjectSubstitution = interface(IObjectiveC)
    ['{12B472CF-B54B-4A43-B923-7AFFDE4D9AED}']
    function classForKeyedArchiver: Pointer; cdecl;
    function replacementObjectForKeyedArchiver(archiver: NSKeyedArchiver)
      : Pointer; cdecl;
    function classFallbacksForKeyedArchiver: NSArray; cdecl;
  end;

  NSKeyedUnarchiverObjectSubstitution = interface(IObjectiveC)
    ['{7BA3DC80-0CFA-48B3-8ED9-22B19990B8A2}']
    function classForKeyedUnarchiver: Pointer; cdecl;
  end;

  NSConditionLockClass = interface(NSObjectClass)
    ['{C7CC39E0-7339-4D06-87AE-69AE01C0F0F9}']
  end;

  NSConditionLock = interface(NSObject)
    ['{C30BE498-6D59-458F-92ED-8D5B39EF391D}']
    function initWithCondition(condition: NSInteger)
      : Pointer { instancetype }; cdecl;
    function condition: NSInteger; cdecl;
    [MethodName('lockWhenCondition:')]
    procedure lockWhenCondition(condition: NSInteger); cdecl;
    function tryLock: Boolean; cdecl;
    function tryLockWhenCondition(condition: NSInteger): Boolean; cdecl;
    procedure unlockWithCondition(condition: NSInteger); cdecl;
    function lockBeforeDate(limit: NSDate): Boolean; cdecl;
    [MethodName('lockWhenCondition:beforeDate:')]
    function lockWhenConditionBeforeDate(condition: NSInteger;
      beforeDate: NSDate): Boolean; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TNSConditionLock = class(TOCGenericImport<NSConditionLockClass,
    NSConditionLock>)
  end;

  PNSConditionLock = Pointer;

  NSConditionClass = interface(NSObjectClass)
    ['{09ABB8B5-0176-43BF-A3C1-FAD1D814A329}']
  end;

  NSCondition = interface(NSObject)
    ['{48E2FB43-AC11-403F-82AF-33747821519D}']
    procedure wait; cdecl;
    function waitUntilDate(limit: NSDate): Boolean; cdecl;
    procedure signal; cdecl;
    procedure broadcast; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TNSCondition = class(TOCGenericImport<NSConditionClass, NSCondition>)
  end;

  PNSCondition = Pointer;

  NSMapTableClass = interface(NSObjectClass)
    ['{EEDF2644-C26A-4592-93AF-CCF5DB31E156}']
    { class } function mapTableWithKeyOptions
      (keyOptions: NSPointerFunctionsOptions;
      valueOptions: NSPointerFunctionsOptions): NSMapTable; cdecl;
    { class } function mapTableWithStrongToStrongObjects: Pointer; cdecl;
    { class } function mapTableWithWeakToStrongObjects: Pointer; cdecl;
    { class } function mapTableWithStrongToWeakObjects: Pointer; cdecl;
    { class } function mapTableWithWeakToWeakObjects: Pointer; cdecl;
    { class } function strongToStrongObjectsMapTable: NSMapTable; cdecl;
    { class } function weakToStrongObjectsMapTable: NSMapTable; cdecl;
    { class } function strongToWeakObjectsMapTable: NSMapTable; cdecl;
    { class } function weakToWeakObjectsMapTable: NSMapTable; cdecl;
  end;

  NSMapTable = interface(NSObject)
    ['{FD32B720-F44F-402F-B483-1E0E37D05DA5}']
    function initWithKeyOptions(keyOptions: NSPointerFunctionsOptions;
      valueOptions: NSPointerFunctionsOptions; capacity: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithKeyPointerFunctions(keyFunctions: NSPointerFunctions;
      valuePointerFunctions: NSPointerFunctions; capacity: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function keyPointerFunctions: NSPointerFunctions; cdecl;
    function valuePointerFunctions: NSPointerFunctions; cdecl;
    function objectForKey(aKey: KeyType): ObjectType; cdecl;
    procedure removeObjectForKey(aKey: KeyType); cdecl;
    procedure setObject(anObject: ObjectType; forKey: KeyType); cdecl;
    function count: NSUInteger; cdecl;
    function keyEnumerator: NSEnumerator; cdecl;
    function objectEnumerator: NSEnumerator; cdecl;
    procedure removeAllObjects; cdecl;
    function dictionaryRepresentation: NSDictionary; cdecl;
  end;

  TNSMapTable = class(TOCGenericImport<NSMapTableClass, NSMapTable>)
  end;

  PNSMapTable = Pointer;

  NSMorphologyCustomPronounClass = interface(NSObjectClass)
    ['{C0F840F4-E831-4C18-9C11-7D0235D5F9B1}']
    { class } function isSupportedForLanguage(language: NSString)
      : Boolean; cdecl;
    { class } function requiredKeysForLanguage(language: NSString)
      : NSArray; cdecl;
  end;

  NSMorphologyCustomPronoun = interface(NSObject)
    ['{974A1488-7742-48D8-AAF7-85F8403C965F}']
    procedure setSubjectForm(subjectForm: NSString); cdecl;
    function subjectForm: NSString; cdecl;
    procedure setObjectForm(objectForm: NSString); cdecl;
    function objectForm: NSString; cdecl;
    procedure setPossessiveForm(possessiveForm: NSString); cdecl;
    function possessiveForm: NSString; cdecl;
    procedure setPossessiveAdjectiveForm(possessiveAdjectiveForm
      : NSString); cdecl;
    function possessiveAdjectiveForm: NSString; cdecl;
    procedure setReflexiveForm(reflexiveForm: NSString); cdecl;
    function reflexiveForm: NSString; cdecl;
  end;

  TNSMorphologyCustomPronoun = class
    (TOCGenericImport<NSMorphologyCustomPronounClass,
    NSMorphologyCustomPronoun>)
  end;

  PNSMorphologyCustomPronoun = Pointer;

  NSNotificationQueueClass = interface(NSObjectClass)
    ['{5CDEE2A6-753A-46CE-9B88-7B187420D4DF}']
  end;

  NSNotificationQueue = interface(NSObject)
    ['{69DD0D8B-F9E4-4EAA-ADA0-0CB5854CE68E}']
    procedure setDefaultQueue(defaultQueue: NSNotificationQueue); cdecl;
    function defaultQueue: NSNotificationQueue; cdecl;
    function initWithNotificationCenter(notificationCenter
      : NSNotificationCenter): Pointer { instancetype }; cdecl;
    [MethodName('enqueueNotification:postingStyle:')]
    procedure enqueueNotificationPostingStyle(notification: NSNotification;
      postingStyle: NSPostingStyle); cdecl;
    [MethodName('enqueueNotification:postingStyle:coalesceMask:forModes:')]
    procedure enqueueNotificationPostingStyleCoalesceMaskForModes
      (notification: NSNotification; postingStyle: NSPostingStyle;
      coalesceMask: NSNotificationCoalescing; forModes: NSArray); cdecl;
    procedure dequeueNotificationsMatching(notification: NSNotification;
      coalesceMask: NSUInteger); cdecl;
  end;

  TNSNotificationQueue = class(TOCGenericImport<NSNotificationQueueClass,
    NSNotificationQueue>)
  end;

  PNSNotificationQueue = Pointer;

  NSNullClass = interface(NSObjectClass)
    ['{0D4629E7-3F4B-476E-924D-6C7741FF5AD3}']
    { class } function null: NSNull; cdecl;
  end;

  NSNull = interface(NSObject)
    ['{48CDC44C-DDD3-435E-8767-CD7B60EEECC3}']
  end;

  TNSNull = class(TOCGenericImport<NSNullClass, NSNull>)
  end;

  PNSNull = Pointer;

  NSOperationClass = interface(NSObjectClass)
    ['{D55F3DA7-2091-454F-B27E-098296AC76A3}']
  end;

  NSOperation = interface(NSObject)
    ['{0E66DAE7-4A0F-44F4-AD52-95858F735CC1}']
    procedure start; cdecl;
    procedure main; cdecl;
    function isCancelled: Boolean; cdecl;
    procedure cancel; cdecl;
    function isExecuting: Boolean; cdecl;
    function isFinished: Boolean; cdecl;
    function isConcurrent: Boolean; cdecl;
    function isAsynchronous: Boolean; cdecl;
    function isReady: Boolean; cdecl;
    procedure addDependency(op: NSOperation); cdecl;
    procedure removeDependency(op: NSOperation); cdecl;
    function dependencies: NSArray; cdecl;
    procedure setQueuePriority(queuePriority: NSOperationQueuePriority); cdecl;
    function queuePriority: NSOperationQueuePriority; cdecl;
    procedure setCompletionBlock(completionBlock
      : TFoundationUsingBlock1); cdecl;
    function completionBlock: TFoundationUsingBlock1; cdecl;
    procedure waitUntilFinished; cdecl;
    procedure setThreadPriority(threadPriority: Double); cdecl;
    function threadPriority: Double; cdecl;
    procedure setQualityOfService(qualityOfService: NSQualityOfService); cdecl;
    function qualityOfService: NSQualityOfService; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TNSOperation = class(TOCGenericImport<NSOperationClass, NSOperation>)
  end;

  PNSOperation = Pointer;

  NSBlockOperationClass = interface(NSOperationClass)
    ['{92A61224-B443-4FDA-B5CA-F8D7E00A108D}']
    { class } function blockOperationWithBlock(block: TFoundationUsingBlock1)
      : Pointer { instancetype }; cdecl;
  end;

  NSBlockOperation = interface(NSOperation)
    ['{F4C8F8EF-11FF-4E6B-935F-6B993693D190}']
    procedure addExecutionBlock(block: TFoundationUsingBlock1); cdecl;
    function executionBlocks: NSArray; cdecl;
  end;

  TNSBlockOperation = class(TOCGenericImport<NSBlockOperationClass,
    NSBlockOperation>)
  end;

  PNSBlockOperation = Pointer;

  NSInvocationOperationClass = interface(NSOperationClass)
    ['{4A72CC62-AE9F-4223-AE2D-D0310C1DF4A3}']
  end;

  NSInvocationOperation = interface(NSOperation)
    ['{129CE27F-6620-4848-B958-4CE4947D9691}']
    function initWithTarget(target: Pointer; selector: SEL; &object: Pointer)
      : Pointer { instancetype }; cdecl;
    function initWithInvocation(inv: NSInvocation)
      : Pointer { instancetype }; cdecl;
    function invocation: NSInvocation; cdecl;
    function result: Pointer; cdecl;
  end;

  TNSInvocationOperation = class(TOCGenericImport<NSInvocationOperationClass,
    NSInvocationOperation>)
  end;

  PNSInvocationOperation = Pointer;

  NSOrthographyClass = interface(NSObjectClass)
    ['{548AF9AB-035F-4D1B-BCC8-1A59DDB01853}']
    { class } function defaultOrthographyForLanguage(language: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function orthographyWithDominantScript(script: NSString;
      languageMap: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  NSOrthography = interface(NSObject)
    ['{F4F35402-69BC-449F-A9EF-AEF1291B79F1}']
    function dominantScript: NSString; cdecl;
    function languageMap: NSDictionary; cdecl;
    function initWithDominantScript(script: NSString; languageMap: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function languagesForScript(script: NSString): NSArray; cdecl;
    function dominantLanguageForScript(script: NSString): NSString; cdecl;
    function dominantLanguage: NSString; cdecl;
    function allScripts: NSArray; cdecl;
    function allLanguages: NSArray; cdecl;
  end;

  TNSOrthography = class(TOCGenericImport<NSOrthographyClass, NSOrthography>)
  end;

  PNSOrthography = Pointer;

  NSPointerArrayClass = interface(NSObjectClass)
    ['{47037979-2B89-4610-AD13-CD1271FEE1D3}']
    { class } function pointerArrayWithOptions
      (options: NSPointerFunctionsOptions): NSPointerArray; cdecl;
    { class } function pointerArrayWithPointerFunctions
      (functions: NSPointerFunctions): NSPointerArray; cdecl;
    { class } function strongObjectsPointerArray: NSPointerArray; cdecl;
    { class } function weakObjectsPointerArray: NSPointerArray; cdecl;
  end;

  NSPointerArray = interface(NSObject)
    ['{33E3ED1D-AE26-4769-B035-C83A4AA3A73A}']
    function initWithOptions(options: NSPointerFunctionsOptions)
      : Pointer { instancetype }; cdecl;
    function initWithPointerFunctions(functions: NSPointerFunctions)
      : Pointer { instancetype }; cdecl;
    function pointerFunctions: NSPointerFunctions; cdecl;
    function pointerAtIndex(index: NSUInteger): Pointer; cdecl;
    procedure addPointer(Pointer: Pointer); cdecl;
    procedure removePointerAtIndex(index: NSUInteger); cdecl;
    procedure insertPointer(item: Pointer; atIndex: NSUInteger); cdecl;
    procedure replacePointerAtIndex(index: NSUInteger;
      withPointer: Pointer); cdecl;
    procedure compact; cdecl;
    procedure setCount(count: NSUInteger); cdecl;
    function count: NSUInteger; cdecl;
    function allObjects: NSArray; cdecl;
  end;

  TNSPointerArray = class(TOCGenericImport<NSPointerArrayClass, NSPointerArray>)
  end;

  PNSPointerArray = Pointer;

  NSMachPortClass = interface(NSPortClass)
    ['{069C91A0-65A0-49D9-AAEA-08252716C78B}']
    [MethodName('portWithMachPort:')]
    { class } function portWithMachPort(machPort: LongWord): NSPort; cdecl;
    [MethodName('portWithMachPort:options:')]
    { class } function portWithMachPortOptions(machPort: LongWord;
      options: NSMachPortOptions): NSPort; cdecl;
  end;

  NSMachPort = interface(NSPort)
    ['{C028154F-2922-49FD-B8C2-EE19DEE8902E}']
    [MethodName('initWithMachPort:')]
    function initWithMachPort(machPort: LongWord)
      : Pointer { instancetype }; cdecl;
    procedure setDelegate(anObject: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    [MethodName('initWithMachPort:options:')]
    function initWithMachPortOptions(machPort: LongWord;
      options: NSMachPortOptions): Pointer { instancetype }; cdecl;
    function machPort: LongWord; cdecl;
    procedure scheduleInRunLoop(runLoop: NSRunLoop;
      forMode: NSRunLoopMode); cdecl;
    procedure removeFromRunLoop(runLoop: NSRunLoop;
      forMode: NSRunLoopMode); cdecl;
  end;

  TNSMachPort = class(TOCGenericImport<NSMachPortClass, NSMachPort>)
  end;

  PNSMachPort = Pointer;

  NSMessagePortClass = interface(NSPortClass)
    ['{63BCDEA3-A9B3-4475-BF79-8FEFD3E4C67D}']
  end;

  NSMessagePort = interface(NSPort)
    ['{E0575851-89C9-456D-8BEB-3C7733D2FB96}']
  end;

  TNSMessagePort = class(TOCGenericImport<NSMessagePortClass, NSMessagePort>)
  end;

  PNSMessagePort = Pointer;

  NSProcessInfoClass = interface(NSObjectClass)
    ['{C0F99AFD-8BE9-46C5-846D-53F93D138A93}']
  end;

  NSProcessInfo = interface(NSObject)
    ['{721BBE94-64EC-40E1-9728-7760E3ECC5A8}']
    procedure setProcessInfo(processInfo: NSProcessInfo); cdecl;
    function processInfo: NSProcessInfo; cdecl;
    function environment: NSDictionary; cdecl;
    function arguments: NSArray; cdecl;
    function hostname: NSString; cdecl;
    procedure setProcessName(processName: NSString); cdecl;
    function processName: NSString; cdecl;
    function processIdentifier: Integer; cdecl;
    function globallyUniqueString: NSString; cdecl;
    function operatingSystem: NSUInteger; cdecl;
    function operatingSystemName: NSString; cdecl;
    function operatingSystemVersionString: NSString; cdecl;
    function operatingSystemVersion: NSOperatingSystemVersion; cdecl;
    function processorCount: NSUInteger; cdecl;
    function activeProcessorCount: NSUInteger; cdecl;
    function physicalMemory: UInt64; cdecl;
    function isOperatingSystemAtLeastVersion(version: NSOperatingSystemVersion)
      : Boolean; cdecl;
    function systemUptime: NSTimeInterval; cdecl;
    procedure disableSuddenTermination; cdecl;
    procedure enableSuddenTermination; cdecl;
    procedure disableAutomaticTermination(reason: NSString); cdecl;
    procedure enableAutomaticTermination(reason: NSString); cdecl;
    procedure setAutomaticTerminationSupportEnabled
      (automaticTerminationSupportEnabled: Boolean); cdecl;
    function automaticTerminationSupportEnabled: Boolean; cdecl;
    function beginActivityWithOptions(options: NSActivityOptions;
      reason: NSString): Pointer; cdecl;
    procedure endActivity(activity: Pointer); cdecl;
    procedure performActivityWithOptions(options: NSActivityOptions;
      reason: NSString; usingBlock: TFoundationUsingBlock1); cdecl;
    procedure performExpiringActivityWithReason(reason: NSString;
      usingBlock: TFoundationCompletionHandler2); cdecl;
    function userName: NSString; cdecl;
    function fullUserName: NSString; cdecl;
    function thermalState: NSProcessInfoThermalState; cdecl;
    function isLowPowerModeEnabled: Boolean; cdecl;
    function isMacCatalystApp: Boolean; cdecl;
    function isiOSAppOnMac: Boolean; cdecl;
  end;

  TNSProcessInfo = class(TOCGenericImport<NSProcessInfoClass, NSProcessInfo>)
  end;

  PNSProcessInfo = Pointer;

  NSProxyClass = interface(IObjectiveCClass)
    ['{BB036D60-9270-45F8-A00B-50DD1A931F17}']
    { class } function alloc: Pointer; cdecl;
    { class } function allocWithZone(zone: Pointer): Pointer; cdecl;
    { class } function &class: Pointer; cdecl;
    { class } function respondsToSelector(aSelector: SEL): Boolean; cdecl;
  end;

  NSProxy = interface(IObjectiveCInstance)
    ['{D9E4158D-8F0A-4900-91E1-8827AA64DD93}']
    procedure forwardInvocation(invocation: NSInvocation); cdecl;
    function methodSignatureForSelector(SEL: SEL): NSMethodSignature; cdecl;
    procedure dealloc; cdecl;
    procedure finalize; cdecl;
    function description: NSString; cdecl;
    function debugDescription: NSString; cdecl;
    function allowsWeakReference: Boolean; cdecl;
    function retainWeakReference: Boolean; cdecl;
  end;

  TNSProxy = class(TOCGenericImport<NSProxyClass, NSProxy>)
  end;

  PNSProxy = Pointer;

  NSRegularExpressionClass = interface(NSObjectClass)
    ['{426088DA-4E98-4523-84F0-36D0F609AA22}']
    { class } function regularExpressionWithPattern(pattern: NSString;
      options: NSRegularExpressionOptions; error: NSError)
      : NSRegularExpression; cdecl;
    { class } function escapedPatternForString(&string: NSString)
      : NSString; cdecl;
    { class } function escapedTemplateForString(&string: NSString)
      : NSString; cdecl;
  end;

  NSRegularExpression = interface(NSObject)
    ['{CD87C05F-9B3E-4538-9CB1-0C38168D473C}']
    function initWithPattern(pattern: NSString;
      options: NSRegularExpressionOptions; error: NSError)
      : Pointer { instancetype }; cdecl;
    function pattern: NSString; cdecl;
    function options: NSRegularExpressionOptions; cdecl;
    function numberOfCaptureGroups: NSUInteger; cdecl;
    procedure enumerateMatchesInString(&string: NSString;
      options: NSMatchingOptions; range: NSRange;
      usingBlock: TFoundationUsingBlock5); cdecl;
    function matchesInString(&string: NSString; options: NSMatchingOptions;
      range: NSRange): NSArray; cdecl;
    function numberOfMatchesInString(&string: NSString;
      options: NSMatchingOptions; range: NSRange): NSUInteger; cdecl;
    function firstMatchInString(&string: NSString; options: NSMatchingOptions;
      range: NSRange): NSTextCheckingResult; cdecl;
    function rangeOfFirstMatchInString(&string: NSString;
      options: NSMatchingOptions; range: NSRange): NSRange; cdecl;
    function stringByReplacingMatchesInString(&string: NSString;
      options: NSMatchingOptions; range: NSRange; withTemplate: NSString)
      : NSString; cdecl;
    function replaceMatchesInString(&string: NSMutableString;
      options: NSMatchingOptions; range: NSRange; withTemplate: NSString)
      : NSUInteger; cdecl;
    function replacementStringForResult(result: NSTextCheckingResult;
      inString: NSString; offset: NSInteger; template: NSString)
      : NSString; cdecl;
  end;

  TNSRegularExpression = class(TOCGenericImport<NSRegularExpressionClass,
    NSRegularExpression>)
  end;

  PNSRegularExpression = Pointer;

  NSTextCheckingResultClass = interface(NSObjectClass)
    ['{56667944-9D7A-4BD6-88FF-7B7727BAEA1F}']
    { class } function orthographyCheckingResultWithRange(range: NSRange;
      orthography: NSOrthography): NSTextCheckingResult; cdecl;
    { class } function spellCheckingResultWithRange(range: NSRange)
      : NSTextCheckingResult; cdecl;
    { class } function grammarCheckingResultWithRange(range: NSRange;
      details: NSArray): NSTextCheckingResult; cdecl;
    [MethodName('dateCheckingResultWithRange:date:')]
    { class } function dateCheckingResultWithRangeDate(range: NSRange;
      date: NSDate): NSTextCheckingResult; cdecl;
    [MethodName('dateCheckingResultWithRange:date:timeZone:duration:')]
    { class } function dateCheckingResultWithRangeDateTimeZoneDuration
      (range: NSRange; date: NSDate; timeZone: NSTimeZone;
      duration: NSTimeInterval): NSTextCheckingResult; cdecl;
    { class } function addressCheckingResultWithRange(range: NSRange;
      components: NSDictionary): NSTextCheckingResult; cdecl;
    { class } function linkCheckingResultWithRange(range: NSRange; url: NSURL)
      : NSTextCheckingResult; cdecl;
    { class } function quoteCheckingResultWithRange(range: NSRange;
      replacementString: NSString): NSTextCheckingResult; cdecl;
    { class } function dashCheckingResultWithRange(range: NSRange;
      replacementString: NSString): NSTextCheckingResult; cdecl;
    { class } function replacementCheckingResultWithRange(range: NSRange;
      replacementString: NSString): NSTextCheckingResult; cdecl;
    [MethodName('correctionCheckingResultWithRange:replacementString:')]
    { class } function correctionCheckingResultWithRangeReplacementString
      (range: NSRange; replacementString: NSString)
      : NSTextCheckingResult; cdecl;
    [MethodName
      ('correctionCheckingResultWithRange:replacementString:alternativeStrings:')
      ]
    { class } function
      correctionCheckingResultWithRangeReplacementStringAlternativeStrings
      (range: NSRange; replacementString: NSString; alternativeStrings: NSArray)
      : NSTextCheckingResult; cdecl;
    { class } function regularExpressionCheckingResultWithRanges
      (ranges: NSRangePointer; count: NSUInteger;
      regularExpression: NSRegularExpression): NSTextCheckingResult; cdecl;
    { class } function phoneNumberCheckingResultWithRange(range: NSRange;
      phoneNumber: NSString): NSTextCheckingResult; cdecl;
    { class } function transitInformationCheckingResultWithRange(range: NSRange;
      components: NSDictionary): NSTextCheckingResult; cdecl;
  end;

  NSTextCheckingResult = interface(NSObject)
    ['{12FDD0AD-1624-4C19-9C90-61503688F640}']
    function resultType: NSTextCheckingType; cdecl;
    function range: NSRange; cdecl;
    function orthography: NSOrthography; cdecl;
    function grammarDetails: NSArray; cdecl;
    function date: NSDate; cdecl;
    function timeZone: NSTimeZone; cdecl;
    function duration: NSTimeInterval; cdecl;
    function components: NSDictionary; cdecl;
    function url: NSURL; cdecl;
    function replacementString: NSString; cdecl;
    function alternativeStrings: NSArray; cdecl;
    function regularExpression: NSRegularExpression; cdecl;
    function phoneNumber: NSString; cdecl;
    function numberOfRanges: NSUInteger; cdecl;
    function rangeAtIndex(idx: NSUInteger): NSRange; cdecl;
    function rangeWithName(name: NSString): NSRange; cdecl;
    function resultByAdjustingRangesWithOffset(offset: NSInteger)
      : NSTextCheckingResult; cdecl;
    function addressComponents: NSDictionary; cdecl;
  end;

  TNSTextCheckingResult = class(TOCGenericImport<NSTextCheckingResultClass,
    NSTextCheckingResult>)
  end;

  PNSTextCheckingResult = Pointer;

  NSDataDetectorClass = interface(NSRegularExpressionClass)
    ['{19A014E5-560E-4097-8B4B-DF445D850921}']
    { class } function dataDetectorWithTypes(checkingTypes: NSTextCheckingTypes;
      error: NSError): NSDataDetector; cdecl;
  end;

  NSDataDetector = interface(NSRegularExpression)
    ['{12C98151-3E83-48A6-8260-0B7C59F7382A}']
    function initWithTypes(checkingTypes: NSTextCheckingTypes; error: NSError)
      : Pointer { instancetype }; cdecl;
    function checkingTypes: NSTextCheckingTypes; cdecl;
  end;

  TNSDataDetector = class(TOCGenericImport<NSDataDetectorClass, NSDataDetector>)
  end;

  PNSDataDetector = Pointer;

  NSThreadClass = interface(NSObjectClass)
    ['{D26B842A-8434-4D15-9977-9C4FE00D207B}']
    { class } procedure detachNewThreadWithBlock
      (block: TFoundationUsingBlock1); cdecl;
    { class } procedure detachNewThreadSelector(selector: SEL;
      toTarget: Pointer; withObject: Pointer); cdecl;
    { class } function isMultiThreaded: Boolean; cdecl;
    { class } procedure sleepUntilDate(date: NSDate); cdecl;
    { class } procedure sleepForTimeInterval(ti: NSTimeInterval); cdecl;
    { class } procedure exit; cdecl;
    { class } function threadPriority: Double; cdecl;
    { class } function setThreadPriority(p: Double): Boolean; cdecl;
  end;

  NSThread = interface(NSObject)
    ['{61726F5B-4E4F-42A9-A700-CA580BF6A066}']
    procedure setCurrentThread(currentThread: NSThread); cdecl;
    function currentThread: NSThread; cdecl;
    function threadDictionary: NSMutableDictionary; cdecl;
    procedure setThreadPriority(threadPriority: Double); cdecl;
    function threadPriority: Double; cdecl;
    procedure setQualityOfService(qualityOfService: NSQualityOfService); cdecl;
    function qualityOfService: NSQualityOfService; cdecl;
    procedure setCallStackReturnAddresses(callStackReturnAddresses
      : NSArray); cdecl;
    function callStackReturnAddresses: NSArray; cdecl;
    procedure setCallStackSymbols(callStackSymbols: NSArray); cdecl;
    function callStackSymbols: NSArray; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setStackSize(stackSize: NSUInteger); cdecl;
    function stackSize: NSUInteger; cdecl;
    function isMainThread: Boolean; cdecl;
    procedure setMainThread(mainThread: NSThread); cdecl;
    function mainThread: NSThread; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithTarget(target: Pointer; selector: SEL; &object: Pointer)
      : Pointer { instancetype }; cdecl;
    function initWithBlock(block: TFoundationUsingBlock1)
      : Pointer { instancetype }; cdecl;
    function isExecuting: Boolean; cdecl;
    function isFinished: Boolean; cdecl;
    function isCancelled: Boolean; cdecl;
    procedure cancel; cdecl;
    procedure start; cdecl;
    procedure main; cdecl;
  end;

  TNSThread = class(TOCGenericImport<NSThreadClass, NSThread>)
  end;

  PNSThread = Pointer;

  NSThreadPerformAdditions = interface(IObjectiveC)
    ['{809A20FA-8009-4948-85B4-8FB0A768DE09}']
    [MethodName('performSelectorOnMainThread:withObject:waitUntilDone:modes:')]
    procedure performSelectorOnMainThreadWithObjectWaitUntilDoneModes
      (aSelector: SEL; withObject: Pointer; waitUntilDone: Boolean;
      modes: NSArray); cdecl;
    [MethodName('performSelectorOnMainThread:withObject:waitUntilDone:')]
    procedure performSelectorOnMainThreadWithObjectWaitUntilDone(aSelector: SEL;
      withObject: Pointer; waitUntilDone: Boolean); cdecl;
    [MethodName('performSelector:onThread:withObject:waitUntilDone:modes:')]
    procedure performSelectorOnThreadWithObjectWaitUntilDoneModes
      (aSelector: SEL; onThread: NSThread; withObject: Pointer;
      waitUntilDone: Boolean; modes: NSArray); cdecl;
    [MethodName('performSelector:onThread:withObject:waitUntilDone:')]
    procedure performSelectorOnThreadWithObjectWaitUntilDone(aSelector: SEL;
      onThread: NSThread; withObject: Pointer; waitUntilDone: Boolean); cdecl;
    procedure performSelectorInBackground(aSelector: SEL;
      withObject: Pointer); cdecl;
  end;

  NSURLAuthenticationChallengeClass = interface(NSObjectClass)
    ['{0FFD6420-A923-4831-A3F6-40864C96DDFA}']
  end;

  NSURLAuthenticationChallenge = interface(NSObject)
    ['{B120BDEA-83ED-4F89-877F-0A4BDA6236CE}']
    function initWithProtectionSpace(space: NSURLProtectionSpace;
      proposedCredential: NSURLCredential; previousFailureCount: NSInteger;
      failureResponse: NSURLResponse; error: NSError; sender: Pointer)
      : Pointer { instancetype }; cdecl;
    function initWithAuthenticationChallenge
      (challenge: NSURLAuthenticationChallenge; sender: Pointer)
      : Pointer { instancetype }; cdecl;
    function protectionSpace: NSURLProtectionSpace; cdecl;
    function proposedCredential: NSURLCredential; cdecl;
    function previousFailureCount: NSInteger; cdecl;
    function failureResponse: NSURLResponse; cdecl;
    function error: NSError; cdecl;
    function sender: Pointer; cdecl;
  end;

  TNSURLAuthenticationChallenge = class
    (TOCGenericImport<NSURLAuthenticationChallengeClass,
    NSURLAuthenticationChallenge>)
  end;

  PNSURLAuthenticationChallenge = Pointer;

  NSURLCredentialClass = interface(NSObjectClass)
    ['{3E152D50-1AAB-46C4-A09D-BF6A91A5F439}']
    { class } function credentialWithUser(user: NSString; password: NSString;
      persistence: NSURLCredentialPersistence): NSURLCredential; cdecl;
    { class } function credentialWithIdentity(identity: SecIdentityRef;
      certificates: NSArray; persistence: NSURLCredentialPersistence)
      : NSURLCredential; cdecl;
    { class } function credentialForTrust(trust: SecTrustRef)
      : NSURLCredential; cdecl;
  end;

  NSURLCredential = interface(NSObject)
    ['{162CAF2C-0D74-445C-83E3-192000C6718F}']
    function persistence: NSURLCredentialPersistence; cdecl;
    function initWithUser(user: NSString; password: NSString;
      persistence: NSURLCredentialPersistence): Pointer { instancetype }; cdecl;
    function user: NSString; cdecl;
    function password: NSString; cdecl;
    function hasPassword: Boolean; cdecl;
    function initWithIdentity(identity: SecIdentityRef; certificates: NSArray;
      persistence: NSURLCredentialPersistence): Pointer { instancetype }; cdecl;
    function identity: SecIdentityRef; cdecl;
    function certificates: NSArray; cdecl;
    function initWithTrust(trust: SecTrustRef): Pointer { instancetype }; cdecl;
  end;

  TNSURLCredential = class(TOCGenericImport<NSURLCredentialClass,
    NSURLCredential>)
  end;

  PNSURLCredential = Pointer;

  NSURLProtectionSpaceClass = interface(NSObjectClass)
    ['{B235193C-F437-40EB-A016-1F7D6F3C019A}']
  end;

  NSURLProtectionSpace = interface(NSObject)
    ['{E442480B-8E3D-48B0-B3F9-69DEF813608B}']
    function initWithHost(host: NSString; port: NSInteger; protocol: NSString;
      realm: NSString; authenticationMethod: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithProxyHost(host: NSString; port: NSInteger; &type: NSString;
      realm: NSString; authenticationMethod: NSString)
      : Pointer { instancetype }; cdecl;
    function realm: NSString; cdecl;
    function receivesCredentialSecurely: Boolean; cdecl;
    function isProxy: Boolean; cdecl;
    function host: NSString; cdecl;
    function port: NSInteger; cdecl;
    function proxyType: NSString; cdecl;
    function protocol: NSString; cdecl;
    function authenticationMethod: NSString; cdecl;
    function distinguishedNames: NSArray; cdecl;
    function serverTrust: SecTrustRef; cdecl;
  end;

  TNSURLProtectionSpace = class(TOCGenericImport<NSURLProtectionSpaceClass,
    NSURLProtectionSpace>)
  end;

  PNSURLProtectionSpace = Pointer;

  NSURLResponseClass = interface(NSObjectClass)
    ['{72540C95-4456-435B-BB9D-4039D8B86149}']
  end;

  NSURLResponse = interface(NSObject)
    ['{22464328-D5AC-4A26-81DF-852A04C58C96}']
    function initWithURL(url: NSURL; MIMEType: NSString;
      expectedContentLength: NSInteger; textEncodingName: NSString)
      : Pointer { instancetype }; cdecl;
    function url: NSURL; cdecl;
    function MIMEType: NSString; cdecl;
    function expectedContentLength: Int64; cdecl;
    function textEncodingName: NSString; cdecl;
    function suggestedFilename: NSString; cdecl;
  end;

  TNSURLResponse = class(TOCGenericImport<NSURLResponseClass, NSURLResponse>)
  end;

  PNSURLResponse = Pointer;

  NSURLRequestClass = interface(NSObjectClass)
    ['{DBABEB9A-CDA7-415E-9BC5-BB1BC2E6A7EA}']
    [MethodName('requestWithURL:')]
    { class } function requestWithURL(url: NSURL)
      : Pointer { instancetype }; cdecl;
    [MethodName('requestWithURL:cachePolicy:timeoutInterval:')]
    { class } function requestWithURLCachePolicyTimeoutInterval(url: NSURL;
      cachePolicy: NSURLRequestCachePolicy; timeoutInterval: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
  end;

  NSURLRequest = interface(NSObject)
    ['{4688E77B-64E5-45B3-868D-08615B18F3CA}']
    procedure setSupportsSecureCoding(supportsSecureCoding: Boolean); cdecl;
    function supportsSecureCoding: Boolean; cdecl;
    [MethodName('initWithURL:')]
    function initWithURL(url: NSURL): Pointer { instancetype }; cdecl;
    [MethodName('initWithURL:cachePolicy:timeoutInterval:')]
    function initWithURLCachePolicyTimeoutInterval(url: NSURL;
      cachePolicy: NSURLRequestCachePolicy; timeoutInterval: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
    function url: NSURL; cdecl;
    function cachePolicy: NSURLRequestCachePolicy; cdecl;
    function timeoutInterval: NSTimeInterval; cdecl;
    function mainDocumentURL: NSURL; cdecl;
    function networkServiceType: NSURLRequestNetworkServiceType; cdecl;
    function allowsCellularAccess: Boolean; cdecl;
    function allowsExpensiveNetworkAccess: Boolean; cdecl;
    function allowsConstrainedNetworkAccess: Boolean; cdecl;
    function assumesHTTP3Capable: Boolean; cdecl;
    function attribution: NSURLRequestAttribution; cdecl;
    function requiresDNSSECValidation: Boolean; cdecl;
    function HTTPMethod: NSString; cdecl;
    function allHTTPHeaderFields: NSDictionary; cdecl;
    function valueForHTTPHeaderField(field: NSString): NSString; cdecl;
    function HTTPBody: NSData; cdecl;
    function HTTPBodyStream: NSInputStream; cdecl;
    function HTTPShouldHandleCookies: Boolean; cdecl;
    function HTTPShouldUsePipelining: Boolean; cdecl;
  end;

  TNSURLRequest = class(TOCGenericImport<NSURLRequestClass, NSURLRequest>)
  end;

  PNSURLRequest = Pointer;

  NSURLSessionDataTaskClass = interface(NSURLSessionTaskClass)
    ['{22776DD8-1305-4827-9F59-F3E61BA3FB5B}']
    { class } function new: Pointer { instancetype }; cdecl;
  end;

  NSURLSessionDataTask = interface(NSURLSessionTask)
    ['{7C7677C0-B701-4016-B91C-FA615709760E}']
    function init: Pointer { instancetype }; cdecl;
  end;

  TNSURLSessionDataTask = class(TOCGenericImport<NSURLSessionDataTaskClass,
    NSURLSessionDataTask>)
  end;

  PNSURLSessionDataTask = Pointer;

  NSCachedURLResponseClass = interface(NSObjectClass)
    ['{CE17F4B3-100B-470A-B06A-83F6AF5D8951}']
  end;

  NSCachedURLResponse = interface(NSObject)
    ['{957D7F46-4271-40FD-B1E6-5C84D1D6BFF6}']
    [MethodName('initWithResponse:data:')]
    function initWithResponseData(response: NSURLResponse; data: NSData)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithResponse:data:userInfo:storagePolicy:')]
    function initWithResponseDataUserInfoStoragePolicy(response: NSURLResponse;
      data: NSData; userInfo: NSDictionary;
      storagePolicy: NSURLCacheStoragePolicy): Pointer { instancetype }; cdecl;
    function response: NSURLResponse; cdecl;
    function data: NSData; cdecl;
    function userInfo: NSDictionary; cdecl;
    function storagePolicy: NSURLCacheStoragePolicy; cdecl;
  end;

  TNSCachedURLResponse = class(TOCGenericImport<NSCachedURLResponseClass,
    NSCachedURLResponse>)
  end;

  PNSCachedURLResponse = Pointer;

  NSURLCacheClass = interface(NSObjectClass)
    ['{77C87C1A-F50C-4E99-8410-DE41936AF28C}']
  end;

  NSURLCache = interface(NSObject)
    ['{421CA365-B24A-4D4E-BE94-C04F69A78187}']
    procedure setSharedURLCache(sharedURLCache: NSURLCache); cdecl;
    function sharedURLCache: NSURLCache; cdecl;
    [MethodName('initWithMemoryCapacity:diskCapacity:diskPath:')]
    function initWithMemoryCapacityDiskCapacityDiskPath(memoryCapacity
      : NSUInteger; diskCapacity: NSUInteger; diskPath: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithMemoryCapacity:diskCapacity:directoryURL:')]
    function initWithMemoryCapacityDiskCapacityDirectoryURL(memoryCapacity
      : NSUInteger; diskCapacity: NSUInteger; directoryURL: NSURL)
      : Pointer { instancetype }; cdecl;
    function cachedResponseForRequest(request: NSURLRequest)
      : NSCachedURLResponse; cdecl;
    [MethodName('storeCachedResponse:forRequest:')]
    procedure storeCachedResponseForRequest(cachedResponse: NSCachedURLResponse;
      forRequest: NSURLRequest); cdecl;
    procedure removeCachedResponseForRequest(request: NSURLRequest); cdecl;
    procedure removeAllCachedResponses; cdecl;
    procedure removeCachedResponsesSinceDate(date: NSDate); cdecl;
    procedure setMemoryCapacity(memoryCapacity: NSUInteger); cdecl;
    function memoryCapacity: NSUInteger; cdecl;
    procedure setDiskCapacity(diskCapacity: NSUInteger); cdecl;
    function diskCapacity: NSUInteger; cdecl;
    function currentMemoryUsage: NSUInteger; cdecl;
    function currentDiskUsage: NSUInteger; cdecl;
    [MethodName('storeCachedResponse:forDataTask:')]
    procedure storeCachedResponseForDataTask(cachedResponse
      : NSCachedURLResponse; forDataTask: NSURLSessionDataTask); cdecl;
    procedure getCachedResponseForDataTask(dataTask: NSURLSessionDataTask;
      completionHandler: TFoundationCompletionHandler6); cdecl;
    procedure removeCachedResponseForDataTask
      (dataTask: NSURLSessionDataTask); cdecl;
  end;

  TNSURLCache = class(TOCGenericImport<NSURLCacheClass, NSURLCache>)
  end;

  PNSURLCache = Pointer;

  NSURLConnectionClass = interface(NSObjectClass)
    ['{F8757BE5-FB8A-4F81-A697-5F639350E7B5}']
    { class } function connectionWithRequest(request: NSURLRequest;
      delegate: Pointer): NSURLConnection; cdecl;
    { class } function canHandleRequest(request: NSURLRequest): Boolean; cdecl;
    { class } function sendSynchronousRequest(request: NSURLRequest;
      returningResponse: NSURLResponse; error: NSError): NSData; cdecl;
    { class } procedure sendAsynchronousRequest(request: NSURLRequest;
      queue: NSOperationQueue;
      completionHandler: TFoundationCompletionHandler7); cdecl;
  end;

  NSURLConnection = interface(NSObject)
    ['{119ADFFA-53FD-4BE7-8558-07B4501D8709}']
    [MethodName('initWithRequest:delegate:startImmediately:')]
    function initWithRequestDelegateStartImmediately(request: NSURLRequest;
      delegate: Pointer; startImmediately: Boolean)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithRequest:delegate:')]
    function initWithRequestDelegate(request: NSURLRequest; delegate: Pointer)
      : Pointer { instancetype }; cdecl;
    function originalRequest: NSURLRequest; cdecl;
    function currentRequest: NSURLRequest; cdecl;
    procedure start; cdecl;
    procedure cancel; cdecl;
    procedure scheduleInRunLoop(aRunLoop: NSRunLoop;
      forMode: NSRunLoopMode); cdecl;
    procedure unscheduleFromRunLoop(aRunLoop: NSRunLoop;
      forMode: NSRunLoopMode); cdecl;
    procedure setDelegateQueue(queue: NSOperationQueue); cdecl;
  end;

  TNSURLConnection = class(TOCGenericImport<NSURLConnectionClass,
    NSURLConnection>)
  end;

  PNSURLConnection = Pointer;

  NSURLCredentialStorageClass = interface(NSObjectClass)
    ['{2D611198-FABF-4ACA-B872-97BBCF8E7F52}']
  end;

  NSURLCredentialStorage = interface(NSObject)
    ['{4204E0F1-5F18-4031-B38A-81A33FF6FA7A}']
    procedure setSharedCredentialStorage(sharedCredentialStorage
      : NSURLCredentialStorage); cdecl;
    function sharedCredentialStorage: NSURLCredentialStorage; cdecl;
    function credentialsForProtectionSpace(space: NSURLProtectionSpace)
      : NSDictionary; cdecl;
    function allCredentials: NSDictionary; cdecl;
    [MethodName('setCredential:forProtectionSpace:')]
    procedure setCredentialForProtectionSpace(credential: NSURLCredential;
      forProtectionSpace: NSURLProtectionSpace); cdecl;
    [MethodName('removeCredential:forProtectionSpace:')]
    procedure removeCredentialForProtectionSpace(credential: NSURLCredential;
      forProtectionSpace: NSURLProtectionSpace); cdecl;
    [MethodName('removeCredential:forProtectionSpace:options:')]
    procedure removeCredentialForProtectionSpaceOptions
      (credential: NSURLCredential; forProtectionSpace: NSURLProtectionSpace;
      options: NSDictionary); cdecl;
    function defaultCredentialForProtectionSpace(space: NSURLProtectionSpace)
      : NSURLCredential; cdecl;
    [MethodName('setDefaultCredential:forProtectionSpace:')]
    procedure setDefaultCredentialForProtectionSpace
      (credential: NSURLCredential;
      forProtectionSpace: NSURLProtectionSpace); cdecl;
    procedure getCredentialsForProtectionSpace(protectionSpace
      : NSURLProtectionSpace; task: NSURLSessionTask;
      completionHandler: TFoundationCompletionHandler8); cdecl;
    [MethodName('setCredential:forProtectionSpace:task:')]
    procedure setCredentialForProtectionSpaceTask(credential: NSURLCredential;
      forProtectionSpace: NSURLProtectionSpace; task: NSURLSessionTask); cdecl;
    [MethodName('removeCredential:forProtectionSpace:options:task:')]
    procedure removeCredentialForProtectionSpaceOptionsTask
      (credential: NSURLCredential; forProtectionSpace: NSURLProtectionSpace;
      options: NSDictionary; task: NSURLSessionTask); cdecl;
    procedure getDefaultCredentialForProtectionSpace
      (space: NSURLProtectionSpace; task: NSURLSessionTask;
      completionHandler: TFoundationCompletionHandler9); cdecl;
    [MethodName('setDefaultCredential:forProtectionSpace:task:')]
    procedure setDefaultCredentialForProtectionSpaceTask
      (credential: NSURLCredential; forProtectionSpace: NSURLProtectionSpace;
      task: NSURLSessionTask); cdecl;
  end;

  TNSURLCredentialStorage = class(TOCGenericImport<NSURLCredentialStorageClass,
    NSURLCredentialStorage>)
  end;

  PNSURLCredentialStorage = Pointer;

  NSMutableURLRequestClass = interface(NSURLRequestClass)
    ['{769F1A73-29E6-47CA-B395-283930F23BDE}']
  end;

  NSMutableURLRequest = interface(NSURLRequest)
    ['{7BD9063E-304E-4433-B159-368E59635919}']
    procedure setURL(url: NSURL); cdecl;
    function url: NSURL; cdecl;
    procedure setCachePolicy(cachePolicy: NSURLRequestCachePolicy); cdecl;
    function cachePolicy: NSURLRequestCachePolicy; cdecl;
    procedure setTimeoutInterval(timeoutInterval: NSTimeInterval); cdecl;
    function timeoutInterval: NSTimeInterval; cdecl;
    procedure setMainDocumentURL(mainDocumentURL: NSURL); cdecl;
    function mainDocumentURL: NSURL; cdecl;
    procedure setNetworkServiceType(networkServiceType
      : NSURLRequestNetworkServiceType); cdecl;
    function networkServiceType: NSURLRequestNetworkServiceType; cdecl;
    procedure setAllowsCellularAccess(allowsCellularAccess: Boolean); cdecl;
    function allowsCellularAccess: Boolean; cdecl;
    procedure setAllowsExpensiveNetworkAccess(allowsExpensiveNetworkAccess
      : Boolean); cdecl;
    function allowsExpensiveNetworkAccess: Boolean; cdecl;
    procedure setAllowsConstrainedNetworkAccess(allowsConstrainedNetworkAccess
      : Boolean); cdecl;
    function allowsConstrainedNetworkAccess: Boolean; cdecl;
    procedure setAssumesHTTP3Capable(assumesHTTP3Capable: Boolean); cdecl;
    function assumesHTTP3Capable: Boolean; cdecl;
    procedure setAttribution(attribution: NSURLRequestAttribution); cdecl;
    function attribution: NSURLRequestAttribution; cdecl;
    procedure setRequiresDNSSECValidation(requiresDNSSECValidation
      : Boolean); cdecl;
    function requiresDNSSECValidation: Boolean; cdecl;
    procedure setHTTPMethod(HTTPMethod: NSString); cdecl;
    function HTTPMethod: NSString; cdecl;
    procedure setAllHTTPHeaderFields(allHTTPHeaderFields: NSDictionary); cdecl;
    function allHTTPHeaderFields: NSDictionary; cdecl;
    procedure setValue(value: NSString; forHTTPHeaderField: NSString); cdecl;
    procedure addValue(value: NSString; forHTTPHeaderField: NSString); cdecl;
    procedure setHTTPBody(HTTPBody: NSData); cdecl;
    function HTTPBody: NSData; cdecl;
    procedure setHTTPBodyStream(HTTPBodyStream: NSInputStream); cdecl;
    function HTTPBodyStream: NSInputStream; cdecl;
    procedure setHTTPShouldHandleCookies(HTTPShouldHandleCookies
      : Boolean); cdecl;
    function HTTPShouldHandleCookies: Boolean; cdecl;
    procedure setHTTPShouldUsePipelining(HTTPShouldUsePipelining
      : Boolean); cdecl;
    function HTTPShouldUsePipelining: Boolean; cdecl;
  end;

  TNSMutableURLRequest = class(TOCGenericImport<NSMutableURLRequestClass,
    NSMutableURLRequest>)
  end;

  PNSMutableURLRequest = Pointer;

  NSURLProtocolClass = interface(NSObjectClass)
    ['{718D16B8-ACCB-45A8-AB19-8FA8C7AEE90D}']
    { class } function canInitWithRequest(request: NSURLRequest)
      : Boolean; cdecl;
    { class } function canonicalRequestForRequest(request: NSURLRequest)
      : NSURLRequest; cdecl;
    { class } function requestIsCacheEquivalent(a: NSURLRequest;
      toRequest: NSURLRequest): Boolean; cdecl;
    { class } function propertyForKey(key: NSString; inRequest: NSURLRequest)
      : Pointer; cdecl;
    { class } procedure setProperty(value: Pointer; forKey: NSString;
      inRequest: NSMutableURLRequest); cdecl;
    { class } procedure removePropertyForKey(key: NSString;
      inRequest: NSMutableURLRequest); cdecl;
    { class } function registerClass(protocolClass: Pointer): Boolean; cdecl;
    { class } procedure unregisterClass(protocolClass: Pointer); cdecl;
    { class } function canInitWithTask(task: NSURLSessionTask): Boolean; cdecl;
  end;

  NSURLProtocol = interface(NSObject)
    ['{493D7E12-E926-43C8-8315-7FE01D33DF9F}']
    function initWithRequest(request: NSURLRequest;
      cachedResponse: NSCachedURLResponse; client: Pointer)
      : Pointer { instancetype }; cdecl;
    function client: Pointer; cdecl;
    function request: NSURLRequest; cdecl;
    function cachedResponse: NSCachedURLResponse; cdecl;
    procedure startLoading; cdecl;
    procedure stopLoading; cdecl;
    function initWithTask(task: NSURLSessionTask;
      cachedResponse: NSCachedURLResponse; client: Pointer)
      : Pointer { instancetype }; cdecl;
    function task: NSURLSessionTask; cdecl;
  end;

  TNSURLProtocol = class(TOCGenericImport<NSURLProtocolClass, NSURLProtocol>)
  end;

  PNSURLProtocol = Pointer;

  NSHTTPURLResponseClass = interface(NSURLResponseClass)
    ['{4D96125E-ABD1-4CDA-9B04-E454E405FCF6}']
    { class } function localizedStringForStatusCode(statusCode: NSInteger)
      : NSString; cdecl;
  end;

  NSHTTPURLResponse = interface(NSURLResponse)
    ['{339A0A25-232D-4E73-89FF-530F9BF0820C}']
    function initWithURL(url: NSURL; statusCode: NSInteger;
      HTTPVersion: NSString; headerFields: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function statusCode: NSInteger; cdecl;
    function allHeaderFields: NSDictionary; cdecl;
    function valueForHTTPHeaderField(field: NSString): NSString; cdecl;
  end;

  TNSHTTPURLResponse = class(TOCGenericImport<NSHTTPURLResponseClass,
    NSHTTPURLResponse>)
  end;

  PNSHTTPURLResponse = Pointer;

  NSUserDefaultsClass = interface(NSObjectClass)
    ['{4D373D1A-2DC3-48F4-B0D7-6EFDB496BAF9}']
    { class } procedure resetStandardUserDefaults; cdecl;
  end;

  NSUserDefaults = interface(NSObject)
    ['{D8D5EBD1-DF18-4A17-A887-9D91E6D1AAB1}']
    procedure setStandardUserDefaults(standardUserDefaults
      : NSUserDefaults); cdecl;
    function standardUserDefaults: NSUserDefaults; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithSuiteName(suitename: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithUser(userName: NSString): Pointer; cdecl;
    function objectForKey(defaultName: NSString): Pointer; cdecl;
    procedure setObject(value: Pointer; forKey: NSString); cdecl;
    procedure removeObjectForKey(defaultName: NSString); cdecl;
    function stringForKey(defaultName: NSString): NSString; cdecl;
    function arrayForKey(defaultName: NSString): NSArray; cdecl;
    function dictionaryForKey(defaultName: NSString): NSDictionary; cdecl;
    function dataForKey(defaultName: NSString): NSData; cdecl;
    function stringArrayForKey(defaultName: NSString): NSArray; cdecl;
    function integerForKey(defaultName: NSString): NSInteger; cdecl;
    function floatForKey(defaultName: NSString): Single; cdecl;
    function doubleForKey(defaultName: NSString): Double; cdecl;
    function boolForKey(defaultName: NSString): Boolean; cdecl;
    function URLForKey(defaultName: NSString): NSURL; cdecl;
    procedure setInteger(value: NSInteger; forKey: NSString); cdecl;
    procedure setFloat(value: Single; forKey: NSString); cdecl;
    procedure setDouble(value: Double; forKey: NSString); cdecl;
    procedure setBool(value: Boolean; forKey: NSString); cdecl;
    procedure setURL(url: NSURL; forKey: NSString); cdecl;
    procedure registerDefaults(registrationDictionary: NSDictionary); cdecl;
    procedure addSuiteNamed(suitename: NSString); cdecl;
    procedure removeSuiteNamed(suitename: NSString); cdecl;
    function dictionaryRepresentation: NSDictionary; cdecl;
    function volatileDomainNames: NSArray; cdecl;
    function volatileDomainForName(domainName: NSString): NSDictionary; cdecl;
    procedure setVolatileDomain(domain: NSDictionary; forName: NSString); cdecl;
    procedure removeVolatileDomainForName(domainName: NSString); cdecl;
    function persistentDomainNames: NSArray; cdecl;
    function persistentDomainForName(domainName: NSString): NSDictionary; cdecl;
    procedure setPersistentDomain(domain: NSDictionary;
      forName: NSString); cdecl;
    procedure removePersistentDomainForName(domainName: NSString); cdecl;
    function synchronize: Boolean; cdecl;
    [MethodName('objectIsForcedForKey:')]
    function objectIsForcedForKey(key: NSString): Boolean; cdecl;
    [MethodName('objectIsForcedForKey:inDomain:')]
    function objectIsForcedForKeyInDomain(key: NSString; inDomain: NSString)
      : Boolean; cdecl;
  end;

  TNSUserDefaults = class(TOCGenericImport<NSUserDefaultsClass, NSUserDefaults>)
  end;

  PNSUserDefaults = Pointer;

  NSValueTransformerClass = interface(NSObjectClass)
    ['{DC9563B5-F174-44EF-B6C5-C8D6D9A44BA0}']
    { class } procedure setValueTransformer(transformer: NSValueTransformer;
      forName: NSValueTransformerName); cdecl;
    { class } function valueTransformerForName(name: NSValueTransformerName)
      : NSValueTransformer; cdecl;
    { class } function valueTransformerNames: NSArray; cdecl;
    { class } function transformedValueClass: Pointer; cdecl;
    { class } function allowsReverseTransformation: Boolean; cdecl;
  end;

  NSValueTransformer = interface(NSObject)
    ['{55B44D33-9FF1-4ECA-8AF6-9E7A2AB831D1}']
    function transformedValue(value: Pointer): Pointer; cdecl;
    function reverseTransformedValue(value: Pointer): Pointer; cdecl;
  end;

  TNSValueTransformer = class(TOCGenericImport<NSValueTransformerClass,
    NSValueTransformer>)
  end;

  PNSValueTransformer = Pointer;

  NSSecureUnarchiveFromDataTransformerClass = interface(NSValueTransformerClass)
    ['{2D7AD3C3-599B-4D21-8F31-ECE63C52F3F5}']
  end;

  NSSecureUnarchiveFromDataTransformer = interface(NSValueTransformer)
    ['{CBF94212-3B51-4078-A164-4A0CBCB66FAB}']
    procedure setAllowedTopLevelClasses(allowedTopLevelClasses: NSArray); cdecl;
    function allowedTopLevelClasses: NSArray; cdecl;
  end;

  TNSSecureUnarchiveFromDataTransformer = class
    (TOCGenericImport<NSSecureUnarchiveFromDataTransformerClass,
    NSSecureUnarchiveFromDataTransformer>)
  end;

  PNSSecureUnarchiveFromDataTransformer = Pointer;

  NSXMLParserClass = interface(NSObjectClass)
    ['{367C745C-A271-4BFB-866A-8902C7B104FB}']
  end;

  NSXMLParser = interface(NSObject)
    ['{4893ABC3-F19E-48D8-94B7-76BD5E6AA007}']
    function initWithContentsOfURL(url: NSURL): Pointer { instancetype }; cdecl;
    function initWithData(data: NSData): Pointer { instancetype }; cdecl;
    function initWithStream(stream: NSInputStream)
      : Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setShouldProcessNamespaces(shouldProcessNamespaces
      : Boolean); cdecl;
    function shouldProcessNamespaces: Boolean; cdecl;
    procedure setShouldReportNamespacePrefixes(shouldReportNamespacePrefixes
      : Boolean); cdecl;
    function shouldReportNamespacePrefixes: Boolean; cdecl;
    procedure setExternalEntityResolvingPolicy(externalEntityResolvingPolicy
      : NSXMLParserExternalEntityResolvingPolicy); cdecl;
    function externalEntityResolvingPolicy
      : NSXMLParserExternalEntityResolvingPolicy; cdecl;
    procedure setAllowedExternalEntityURLs(allowedExternalEntityURLs
      : NSSet); cdecl;
    function allowedExternalEntityURLs: NSSet; cdecl;
    function parse: Boolean; cdecl;
    procedure abortParsing; cdecl;
    function parserError: NSError; cdecl;
    procedure setShouldResolveExternalEntities(shouldResolveExternalEntities
      : Boolean); cdecl;
    function shouldResolveExternalEntities: Boolean; cdecl;
    function publicID: NSString; cdecl;
    function systemID: NSString; cdecl;
    function lineNumber: NSInteger; cdecl;
    function columnNumber: NSInteger; cdecl;
  end;

  TNSXMLParser = class(TOCGenericImport<NSXMLParserClass, NSXMLParser>)
  end;

  PNSXMLParser = Pointer;

  NSXPCListenerClass = interface(NSObjectClass)
    ['{4C5D66A5-BD24-4E12-B0DB-B0C777ABAD9C}']
    { class } function serviceListener: NSXPCListener; cdecl;
    { class } function anonymousListener: NSXPCListener; cdecl;
  end;

  NSXPCListener = interface(NSObject)
    ['{4BBA3548-B8C8-43C7-88CB-922BFB27DE7A}']
    function initWithMachServiceName(name: NSString)
      : Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function endpoint: NSXPCListenerEndpoint; cdecl;
    procedure resume; cdecl;
    procedure suspend; cdecl;
    procedure activate; cdecl;
    procedure invalidate; cdecl;
    procedure setConnectionCodeSigningRequirement(requirement: NSString); cdecl;
  end;

  TNSXPCListener = class(TOCGenericImport<NSXPCListenerClass, NSXPCListener>)
  end;

  PNSXPCListener = Pointer;

  NSXPCInterfaceClass = interface(NSObjectClass)
    ['{586E07B1-21A9-42E6-B9DC-D2ABE80428F3}']
    { class } function interfaceWithProtocol(protocol: Pointer)
      : NSXPCInterface; cdecl;
  end;

  NSXPCInterface = interface(NSObject)
    ['{AB36E9B1-AF0E-4BF6-B0B9-2F427A31F64F}']
    procedure setProtocol(protocol: Pointer); cdecl;
    function protocol: Pointer; cdecl;
    procedure setClasses(classes: NSSet; forSelector: SEL;
      argumentIndex: NSUInteger; ofReply: Boolean); cdecl;
    function classesForSelector(SEL: SEL; argumentIndex: NSUInteger;
      ofReply: Boolean): NSSet; cdecl;
    procedure setInterface(ifc: NSXPCInterface; forSelector: SEL;
      argumentIndex: NSUInteger; ofReply: Boolean); cdecl;
    function interfaceForSelector(SEL: SEL; argumentIndex: NSUInteger;
      ofReply: Boolean): NSXPCInterface; cdecl;
  end;

  TNSXPCInterface = class(TOCGenericImport<NSXPCInterfaceClass, NSXPCInterface>)
  end;

  PNSXPCInterface = Pointer;

  NSXPCListenerEndpointClass = interface(NSObjectClass)
    ['{279FA9EE-7B59-4721-99E8-5BD555235250}']
  end;

  NSXPCListenerEndpoint = interface(NSObject)
    ['{47C09BF4-9F34-47DF-BF36-3D52F822DBBD}']
  end;

  TNSXPCListenerEndpoint = class(TOCGenericImport<NSXPCListenerEndpointClass,
    NSXPCListenerEndpoint>)
  end;

  PNSXPCListenerEndpoint = Pointer;

  NSXPCCoderClass = interface(NSCoderClass)
    ['{675EAB1C-98A4-4B8C-A89D-BED742CF2178}']
  end;

  NSXPCCoder = interface(NSCoder)
    ['{040E524A-96A5-450F-A9B4-B0ED407FF8CB}']
    procedure setUserInfo(userInfo: Pointer); cdecl;
    function userInfo: Pointer; cdecl;
    function connection: NSXPCConnection; cdecl;
  end;

  TNSXPCCoder = class(TOCGenericImport<NSXPCCoderClass, NSXPCCoder>)
  end;

  PNSXPCCoder = Pointer;

  NSByteCountFormatterClass = interface(NSFormatterClass)
    ['{13E1232F-20BD-4D8F-8FF7-EEAE1CFCF930}']
    { class } function stringFromByteCount(byteCount: Int64;
      countStyle: NSByteCountFormatterCountStyle): NSString; cdecl;
    { class } function stringFromMeasurement(measurement: NSMeasurement;
      countStyle: NSByteCountFormatterCountStyle): NSString; cdecl;
  end;

  NSByteCountFormatter = interface(NSFormatter)
    ['{834881DB-922A-4E32-8FE6-327F865D6DA8}']
    function stringFromByteCount(byteCount: Int64): NSString; cdecl;
    function stringFromMeasurement(measurement: NSMeasurement): NSString; cdecl;
    function stringForObjectValue(obj: Pointer): NSString; cdecl;
    procedure setAllowedUnits(allowedUnits: NSByteCountFormatterUnits); cdecl;
    function allowedUnits: NSByteCountFormatterUnits; cdecl;
    procedure setCountStyle(countStyle: NSByteCountFormatterCountStyle); cdecl;
    function countStyle: NSByteCountFormatterCountStyle; cdecl;
    procedure setAllowsNonnumericFormatting(allowsNonnumericFormatting
      : Boolean); cdecl;
    function allowsNonnumericFormatting: Boolean; cdecl;
    procedure setIncludesUnit(includesUnit: Boolean); cdecl;
    function includesUnit: Boolean; cdecl;
    procedure setIncludesCount(includesCount: Boolean); cdecl;
    function includesCount: Boolean; cdecl;
    procedure setIncludesActualByteCount(includesActualByteCount
      : Boolean); cdecl;
    function includesActualByteCount: Boolean; cdecl;
    procedure setAdaptive(adaptive: Boolean); cdecl;
    function isAdaptive: Boolean; cdecl;
    procedure setZeroPadsFractionDigits(zeroPadsFractionDigits: Boolean); cdecl;
    function zeroPadsFractionDigits: Boolean; cdecl;
    procedure setFormattingContext(formattingContext
      : NSFormattingContext); cdecl;
    function formattingContext: NSFormattingContext; cdecl;
  end;

  TNSByteCountFormatter = class(TOCGenericImport<NSByteCountFormatterClass,
    NSByteCountFormatter>)
  end;

  PNSByteCountFormatter = Pointer;

  NSPredicateClass = interface(NSObjectClass)
    ['{BDBFE0F5-DCF5-4DDE-97B8-20A20D557C64}']
    [MethodName('predicateWithFormat:argumentArray:')]
    { class } function predicateWithFormatArgumentArray(predicateFormat
      : NSString; argumentArray: NSArray): NSPredicate; cdecl;
    [MethodName('predicateWithFormat:')]
    { class } function predicateWithFormat(predicateFormat: NSString)
      : NSPredicate; cdecl;
    [MethodName('predicateWithFormat:arguments:')]
    { class } function predicateWithFormatArguments(predicateFormat: NSString;
      arguments: array of const): NSPredicate; cdecl;
    { class } function predicateFromMetadataQueryString(queryString: NSString)
      : NSPredicate; cdecl;
    { class } function predicateWithValue(value: Boolean): NSPredicate; cdecl;
    { class } function predicateWithBlock(block: TFoundationBlock12)
      : NSPredicate; cdecl;
  end;

  NSPredicate = interface(NSObject)
    ['{3D6D7FAA-88BC-43EF-A282-FDCB33F2046D}']
    function predicateFormat: NSString; cdecl;
    function predicateWithSubstitutionVariables(variables: NSDictionary)
      : Pointer { instancetype }; cdecl;
    [MethodName('evaluateWithObject:')]
    function evaluateWithObject(&object: Pointer): Boolean; cdecl;
    [MethodName('evaluateWithObject:substitutionVariables:')]
    function evaluateWithObjectSubstitutionVariables(&object: Pointer;
      substitutionVariables: NSDictionary): Boolean; cdecl;
    procedure allowEvaluation; cdecl;
  end;

  TNSPredicate = class(TOCGenericImport<NSPredicateClass, NSPredicate>)
  end;

  PNSPredicate = Pointer;

  NSExpressionClass = interface(NSObjectClass)
    ['{8BC4D2E6-6A37-4270-9253-31D68A28F6AD}']
    [MethodName('expressionWithFormat:argumentArray:')]
    { class } function expressionWithFormatArgumentArray(expressionFormat
      : NSString; argumentArray: NSArray): NSExpression; cdecl;
    [MethodName('expressionWithFormat:')]
    { class } function expressionWithFormat(expressionFormat: NSString)
      : NSExpression; cdecl;
    [MethodName('expressionWithFormat:arguments:')]
    { class } function expressionWithFormatArguments(expressionFormat: NSString;
      arguments: array of const): NSExpression; cdecl;
    { class } function expressionForConstantValue(obj: Pointer)
      : NSExpression; cdecl;
    { class } function expressionForEvaluatedObject: NSExpression; cdecl;
    { class } function expressionForVariable(&string: NSString)
      : NSExpression; cdecl;
    { class } function expressionForKeyPath(keyPath: NSString)
      : NSExpression; cdecl;
    [MethodName('expressionForFunction:arguments:')]
    { class } function expressionForFunctionArguments(name: NSString;
      arguments: NSArray): NSExpression; cdecl;
    { class } function expressionForAggregate(subexpressions: NSArray)
      : NSExpression; cdecl;
    { class } function expressionForUnionSet(left: NSExpression;
      &with: NSExpression): NSExpression; cdecl;
    { class } function expressionForIntersectSet(left: NSExpression;
      &with: NSExpression): NSExpression; cdecl;
    { class } function expressionForMinusSet(left: NSExpression;
      &with: NSExpression): NSExpression; cdecl;
    { class } function expressionForSubquery(expression: NSExpression;
      usingIteratorVariable: NSString; predicate: NSPredicate)
      : NSExpression; cdecl;
    [MethodName('expressionForFunction:selectorName:arguments:')]
    { class } function expressionForFunctionSelectorNameArguments
      (target: NSExpression; selectorName: NSString; arguments: NSArray)
      : NSExpression; cdecl;
    { class } function expressionForAnyKey: NSExpression; cdecl;
    { class } function expressionForBlock(block: TFoundationBlock13;
      arguments: NSArray): NSExpression; cdecl;
    { class } function expressionForConditional(predicate: NSPredicate;
      trueExpression: NSExpression; falseExpression: NSExpression)
      : NSExpression; cdecl;
  end;

  NSExpression = interface(NSObject)
    ['{4747BD9B-A81E-4AD1-9513-E2EF5C82D53C}']
    function initWithExpressionType(&type: NSExpressionType)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function expressionType: NSExpressionType; cdecl;
    function constantValue: Pointer; cdecl;
    function keyPath: NSString; cdecl;
    function &function: NSString; cdecl;
    function variable: NSString; cdecl;
    function operand: NSExpression; cdecl;
    function arguments: NSArray; cdecl;
    function collection: Pointer; cdecl;
    function predicate: NSPredicate; cdecl;
    function leftExpression: NSExpression; cdecl;
    function rightExpression: NSExpression; cdecl;
    function trueExpression: NSExpression; cdecl;
    function falseExpression: NSExpression; cdecl;
    function expressionBlock: TFoundationBlock13; cdecl;
    function expressionValueWithObject(&object: Pointer;
      context: NSMutableDictionary): Pointer; cdecl;
    procedure allowEvaluation; cdecl;
  end;

  TNSExpression = class(TOCGenericImport<NSExpressionClass, NSExpression>)
  end;

  PNSExpression = Pointer;

  NSComparisonPredicateClass = interface(NSPredicateClass)
    ['{438FFE3C-3C77-434E-9BB1-FDF42FF95C3D}']
    [MethodName
      ('predicateWithLeftExpression:rightExpression:modifier:type:options:')]
    { class } function
      predicateWithLeftExpressionRightExpressionModifierTypeOptions
      (lhs: NSExpression; rightExpression: NSExpression;
      modifier: NSComparisonPredicateModifier; &type: NSPredicateOperatorType;
      options: NSComparisonPredicateOptions): NSComparisonPredicate; cdecl;
    [MethodName('predicateWithLeftExpression:rightExpression:customSelector:')]
    { class } function predicateWithLeftExpressionRightExpressionCustomSelector
      (lhs: NSExpression; rightExpression: NSExpression; customSelector: SEL)
      : NSComparisonPredicate; cdecl;
  end;

  NSComparisonPredicate = interface(NSPredicate)
    ['{BAFBCEEF-0F9A-4CBD-AE53-D7C4E10B4BF4}']
    [MethodName
      ('initWithLeftExpression:rightExpression:modifier:type:options:')]
    function initWithLeftExpressionRightExpressionModifierTypeOptions
      (lhs: NSExpression; rightExpression: NSExpression;
      modifier: NSComparisonPredicateModifier; &type: NSPredicateOperatorType;
      options: NSComparisonPredicateOptions): Pointer { instancetype }; cdecl;
    [MethodName('initWithLeftExpression:rightExpression:customSelector:')]
    function initWithLeftExpressionRightExpressionCustomSelector
      (lhs: NSExpression; rightExpression: NSExpression; customSelector: SEL)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function predicateOperatorType: NSPredicateOperatorType; cdecl;
    function comparisonPredicateModifier: NSComparisonPredicateModifier; cdecl;
    function leftExpression: NSExpression; cdecl;
    function rightExpression: NSExpression; cdecl;
    function customSelector: SEL; cdecl;
    function options: NSComparisonPredicateOptions; cdecl;
  end;

  TNSComparisonPredicate = class(TOCGenericImport<NSComparisonPredicateClass,
    NSComparisonPredicate>)
  end;

  PNSComparisonPredicate = Pointer;

  NSCompoundPredicateClass = interface(NSPredicateClass)
    ['{697A14B4-9249-4C83-B6CC-753308F29C4B}']
    { class } function andPredicateWithSubpredicates(subpredicates: NSArray)
      : NSCompoundPredicate; cdecl;
    { class } function orPredicateWithSubpredicates(subpredicates: NSArray)
      : NSCompoundPredicate; cdecl;
    { class } function notPredicateWithSubpredicate(predicate: NSPredicate)
      : NSCompoundPredicate; cdecl;
  end;

  NSCompoundPredicate = interface(NSPredicate)
    ['{9DB9556F-EB11-45B5-85E7-E33FF858B8BC}']
    function initWithType(&type: NSCompoundPredicateType;
      subpredicates: NSArray): Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
    function compoundPredicateType: NSCompoundPredicateType; cdecl;
    function subpredicates: NSArray; cdecl;
  end;

  TNSCompoundPredicate = class(TOCGenericImport<NSCompoundPredicateClass,
    NSCompoundPredicate>)
  end;

  PNSCompoundPredicate = Pointer;

  NSDateComponentsFormatterClass = interface(NSFormatterClass)
    ['{603F43E0-B38B-478C-89AF-1BEB12A5E223}']
    { class } function localizedStringFromDateComponents
      (components: NSDateComponents;
      unitsStyle: NSDateComponentsFormatterUnitsStyle): NSString; cdecl;
  end;

  NSDateComponentsFormatter = interface(NSFormatter)
    ['{08F5DB2D-2430-46DB-B291-67ED1C6AD1C2}']
    function stringForObjectValue(obj: Pointer): NSString; cdecl;
    function stringFromDateComponents(components: NSDateComponents)
      : NSString; cdecl;
    function stringFromDate(startDate: NSDate; toDate: NSDate): NSString; cdecl;
    function stringFromTimeInterval(ti: NSTimeInterval): NSString; cdecl;
    procedure setUnitsStyle(unitsStyle
      : NSDateComponentsFormatterUnitsStyle); cdecl;
    function unitsStyle: NSDateComponentsFormatterUnitsStyle; cdecl;
    procedure setAllowedUnits(allowedUnits: NSCalendarUnit); cdecl;
    function allowedUnits: NSCalendarUnit; cdecl;
    procedure setZeroFormattingBehavior(zeroFormattingBehavior
      : NSDateComponentsFormatterZeroFormattingBehavior); cdecl;
    function zeroFormattingBehavior
      : NSDateComponentsFormatterZeroFormattingBehavior; cdecl;
    procedure setCalendar(calendar: NSCalendar); cdecl;
    function calendar: NSCalendar; cdecl;
    procedure setReferenceDate(referenceDate: NSDate); cdecl;
    function referenceDate: NSDate; cdecl;
    procedure setAllowsFractionalUnits(allowsFractionalUnits: Boolean); cdecl;
    function allowsFractionalUnits: Boolean; cdecl;
    procedure setMaximumUnitCount(maximumUnitCount: NSInteger); cdecl;
    function maximumUnitCount: NSInteger; cdecl;
    procedure setCollapsesLargestUnit(collapsesLargestUnit: Boolean); cdecl;
    function collapsesLargestUnit: Boolean; cdecl;
    procedure setIncludesApproximationPhrase(includesApproximationPhrase
      : Boolean); cdecl;
    function includesApproximationPhrase: Boolean; cdecl;
    procedure setIncludesTimeRemainingPhrase(includesTimeRemainingPhrase
      : Boolean); cdecl;
    function includesTimeRemainingPhrase: Boolean; cdecl;
    procedure setFormattingContext(formattingContext
      : NSFormattingContext); cdecl;
    function formattingContext: NSFormattingContext; cdecl;
    function getObjectValue(obj: Pointer; forString: NSString;
      errorDescription: NSString): Boolean; cdecl;
  end;

  TNSDateComponentsFormatter = class
    (TOCGenericImport<NSDateComponentsFormatterClass,
    NSDateComponentsFormatter>)
  end;

  PNSDateComponentsFormatter = Pointer;

  NSExtensionContextClass = interface(NSObjectClass)
    ['{3898D9CE-E164-4651-8D88-8577115EA861}']
  end;

  NSExtensionContext = interface(NSObject)
    ['{9386DF2D-D44C-4ACB-B6AD-329155C0FCDA}']
    function inputItems: NSArray; cdecl;
    procedure completeRequestReturningItems(items: NSArray;
      completionHandler: TFoundationCompletionHandler2); cdecl;
    procedure cancelRequestWithError(error: NSError); cdecl;
    procedure openURL(url: NSURL;
      completionHandler: TFoundationCompletionHandler2); cdecl;
  end;

  TNSExtensionContext = class(TOCGenericImport<NSExtensionContextClass,
    NSExtensionContext>)
  end;

  PNSExtensionContext = Pointer;

  NSExtensionItemClass = interface(NSObjectClass)
    ['{168A23DE-EBEA-44FE-80F3-09DDD9902761}']
  end;

  NSExtensionItem = interface(NSObject)
    ['{FF72B6F8-032C-4740-A3D4-BA576B9275CF}']
    procedure setAttributedTitle(attributedTitle: NSAttributedString); cdecl;
    function attributedTitle: NSAttributedString; cdecl;
    procedure setAttributedContentText(attributedContentText
      : NSAttributedString); cdecl;
    function attributedContentText: NSAttributedString; cdecl;
    procedure setAttachments(attachments: NSArray); cdecl;
    function attachments: NSArray; cdecl;
    procedure setUserInfo(userInfo: NSDictionary); cdecl;
    function userInfo: NSDictionary; cdecl;
  end;

  TNSExtensionItem = class(TOCGenericImport<NSExtensionItemClass,
    NSExtensionItem>)
  end;

  PNSExtensionItem = Pointer;

  NSFileAccessIntentClass = interface(NSObjectClass)
    ['{CBDCE281-A0A9-414D-8A40-E1E31C1920A1}']
    { class } function readingIntentWithURL(url: NSURL;
      options: NSFileCoordinatorReadingOptions)
      : Pointer { instancetype }; cdecl;
    { class } function writingIntentWithURL(url: NSURL;
      options: NSFileCoordinatorWritingOptions)
      : Pointer { instancetype }; cdecl;
  end;

  NSFileAccessIntent = interface(NSObject)
    ['{F97BE25C-BB23-4885-B8B4-30B7CE76CC99}']
    function url: NSURL; cdecl;
  end;

  TNSFileAccessIntent = class(TOCGenericImport<NSFileAccessIntentClass,
    NSFileAccessIntent>)
  end;

  PNSFileAccessIntent = Pointer;

  NSFileCoordinatorClass = interface(NSObjectClass)
    ['{D1A3849B-2BDC-4AD4-9403-66130110BFF0}']
    { class } procedure addFilePresenter(filePresenter: Pointer); cdecl;
    { class } procedure removeFilePresenter(filePresenter: Pointer); cdecl;
  end;

  NSFileCoordinator = interface(NSObject)
    ['{B45BC260-5073-49A8-B986-175EAC2C6411}']
    procedure setFilePresenters(filePresenters: NSArray); cdecl;
    function filePresenters: NSArray; cdecl;
    function initWithFilePresenter(filePresenterOrNil: Pointer)
      : Pointer { instancetype }; cdecl;
    procedure setPurposeIdentifier(purposeIdentifier: NSString); cdecl;
    function purposeIdentifier: NSString; cdecl;
    procedure coordinateAccessWithIntents(intents: NSArray;
      queue: NSOperationQueue;
      byAccessor: TFoundationCompletionHandler1); cdecl;
    [MethodName('coordinateReadingItemAtURL:options:error:byAccessor:')]
    procedure coordinateReadingItemAtURLOptionsErrorByAccessor(url: NSURL;
      options: NSFileCoordinatorReadingOptions; error: NSError;
      byAccessor: TFoundationByAccessor); cdecl;
    [MethodName('coordinateWritingItemAtURL:options:error:byAccessor:')]
    procedure coordinateWritingItemAtURLOptionsErrorByAccessor(url: NSURL;
      options: NSFileCoordinatorWritingOptions; error: NSError;
      byAccessor: TFoundationByAccessor); cdecl;
    [MethodName
      ('coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:')
      ]
    procedure coordinateReadingItemAtURLOptionsWritingItemAtURLOptionsErrorByAccessor
      (readingURL: NSURL; options: NSFileCoordinatorReadingOptions;
      writingItemAtURL: NSURL; options1: NSFileCoordinatorWritingOptions;
      error: NSError; byAccessor: TFoundationByAccessor1); cdecl;
    [MethodName
      ('coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:')
      ]
    procedure coordinateWritingItemAtURLOptionsWritingItemAtURLOptionsErrorByAccessor
      (url1: NSURL; options: NSFileCoordinatorWritingOptions;
      writingItemAtURL: NSURL; options1: NSFileCoordinatorWritingOptions;
      error: NSError; byAccessor: TFoundationByAccessor1); cdecl;
    [MethodName
      ('prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:error:byAccessor:')
      ]
    procedure prepareForReadingItemsAtURLs(readingURLs: NSArray;
      options: NSFileCoordinatorReadingOptions; writingItemsAtURLs: NSArray;
      options1: NSFileCoordinatorWritingOptions; error: NSError;
      byAccessor: TFoundationByAccessor2); cdecl;
    [MethodName('itemAtURL:willMoveToURL:')]
    procedure itemAtURLWillMoveToURL(oldURL: NSURL;
      willMoveToURL: NSURL); cdecl;
    [MethodName('itemAtURL:didMoveToURL:')]
    procedure itemAtURLDidMoveToURL(oldURL: NSURL; didMoveToURL: NSURL); cdecl;
    [MethodName('itemAtURL:didChangeUbiquityAttributes:')]
    procedure itemAtURLDidChangeUbiquityAttributes(url: NSURL;
      didChangeUbiquityAttributes: NSSet); cdecl;
    procedure cancel; cdecl;
  end;

  TNSFileCoordinator = class(TOCGenericImport<NSFileCoordinatorClass,
    NSFileCoordinator>)
  end;

  PNSFileCoordinator = Pointer;

  NSFileVersionClass = interface(NSObjectClass)
    ['{1C3AA0FE-28D8-4722-9616-732D6DD171A5}']
    { class } function currentVersionOfItemAtURL(url: NSURL)
      : NSFileVersion; cdecl;
    { class } function otherVersionsOfItemAtURL(url: NSURL): NSArray; cdecl;
    { class } function unresolvedConflictVersionsOfItemAtURL(url: NSURL)
      : NSArray; cdecl;
    { class } procedure getNonlocalVersionsOfItemAtURL(url: NSURL;
      completionHandler: TFoundationCompletionHandler10); cdecl;
    { class } function versionOfItemAtURL(url: NSURL;
      forPersistentIdentifier: Pointer): NSFileVersion; cdecl;
    { class } function addVersionOfItemAtURL(url: NSURL;
      withContentsOfURL: NSURL; options: NSFileVersionAddingOptions;
      error: NSError): NSFileVersion; cdecl;
    { class } function temporaryDirectoryURLForNewVersionOfItemAtURL(url: NSURL)
      : NSURL; cdecl;
    { class } function removeOtherVersionsOfItemAtURL(url: NSURL;
      error: NSError): Boolean; cdecl;
  end;

  NSFileVersion = interface(NSObject)
    ['{8A82FAF6-2889-403E-A6D5-32AD87BDFBD2}']
    function url: NSURL; cdecl;
    function localizedName: NSString; cdecl;
    function localizedNameOfSavingComputer: NSString; cdecl;
    function originatorNameComponents: NSPersonNameComponents; cdecl;
    function modificationDate: NSDate; cdecl;
    function persistentIdentifier: Pointer; cdecl;
    function isConflict: Boolean; cdecl;
    procedure setResolved(resolved: Boolean); cdecl;
    function isResolved: Boolean; cdecl;
    procedure setDiscardable(discardable: Boolean); cdecl;
    function isDiscardable: Boolean; cdecl;
    function hasLocalContents: Boolean; cdecl;
    function hasThumbnail: Boolean; cdecl;
    function replaceItemAtURL(url: NSURL;
      options: NSFileVersionReplacingOptions; error: NSError): NSURL; cdecl;
    function removeAndReturnError(outError: NSError): Boolean; cdecl;
  end;

  TNSFileVersion = class(TOCGenericImport<NSFileVersionClass, NSFileVersion>)
  end;

  PNSFileVersion = Pointer;

  NSFileWrapperClass = interface(NSObjectClass)
    ['{0E87B783-2A43-43D7-8F80-19C2234D818C}']
  end;

  NSFileWrapper = interface(NSObject)
    ['{4FFD428B-9C8B-49EE-B3EB-EC2ABAC2A2F2}']
    function initWithURL(url: NSURL; options: NSFileWrapperReadingOptions;
      error: NSError): Pointer { instancetype }; cdecl;
    function initDirectoryWithFileWrappers(childrenByPreferredName
      : NSDictionary): Pointer { instancetype }; cdecl;
    function initRegularFileWithContents(contents: NSData)
      : Pointer { instancetype }; cdecl;
    function initSymbolicLinkWithDestinationURL(url: NSURL)
      : Pointer { instancetype }; cdecl;
    function initWithSerializedRepresentation(serializeRepresentation: NSData)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(inCoder: NSCoder): Pointer { instancetype }; cdecl;
    function isDirectory: Boolean; cdecl;
    function isRegularFile: Boolean; cdecl;
    function isSymbolicLink: Boolean; cdecl;
    procedure setPreferredFilename(preferredFilename: NSString); cdecl;
    function preferredFilename: NSString; cdecl;
    procedure setFilename(filename: NSString); cdecl;
    function filename: NSString; cdecl;
    procedure setFileAttributes(fileAttributes: NSDictionary); cdecl;
    function fileAttributes: NSDictionary; cdecl;
    function matchesContentsOfURL(url: NSURL): Boolean; cdecl;
    function readFromURL(url: NSURL; options: NSFileWrapperReadingOptions;
      error: NSError): Boolean; cdecl;
    function writeToURL(url: NSURL; options: NSFileWrapperWritingOptions;
      originalContentsURL: NSURL; error: NSError): Boolean; cdecl;
    function serializedRepresentation: NSData; cdecl;
    function addFileWrapper(child: NSFileWrapper): NSString; cdecl;
    function addRegularFileWithContents(data: NSData;
      preferredFilename: NSString): NSString; cdecl;
    procedure removeFileWrapper(child: NSFileWrapper); cdecl;
    function fileWrappers: NSDictionary; cdecl;
    function keyForFileWrapper(child: NSFileWrapper): NSString; cdecl;
    function regularFileContents: NSData; cdecl;
    function symbolicLinkDestinationURL: NSURL; cdecl;
  end;

  TNSFileWrapper = class(TOCGenericImport<NSFileWrapperClass, NSFileWrapper>)
  end;

  PNSFileWrapper = Pointer;

  NSLinguisticTaggerClass = interface(NSObjectClass)
    ['{ED04D2DF-D94D-493A-8F79-7D348F5BE311}']
    { class } function availableTagSchemesForUnit(&unit: NSLinguisticTaggerUnit;
      language: NSString): NSArray; cdecl;
    { class } function availableTagSchemesForLanguage(language: NSString)
      : NSArray; cdecl;
    { class } function dominantLanguageForString(&string: NSString)
      : NSString; cdecl;
    { class } function tagForString(&string: NSString; atIndex: NSUInteger;
      &unit: NSLinguisticTaggerUnit; scheme: NSLinguisticTagScheme;
      orthography: NSOrthography; tokenRange: NSRangePointer)
      : NSLinguisticTag; cdecl;
    { class } function tagsForString(&string: NSString; range: NSRange;
      &unit: NSLinguisticTaggerUnit; scheme: NSLinguisticTagScheme;
      options: NSLinguisticTaggerOptions; orthography: NSOrthography;
      tokenRanges: NSArray): NSArray; cdecl;
    { class } procedure enumerateTagsForString(&string: NSString;
      range: NSRange; &unit: NSLinguisticTaggerUnit;
      scheme: NSLinguisticTagScheme; options: NSLinguisticTaggerOptions;
      orthography: NSOrthography; usingBlock: TFoundationUsingBlock6); cdecl;
  end;

  NSLinguisticTagger = interface(NSObject)
    ['{104AFDE6-B587-489E-A95A-6CD1A74516B2}']
    function initWithTagSchemes(tagSchemes: NSArray; options: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function tagSchemes: NSArray; cdecl;
    procedure setString(&string: NSString); cdecl;
    function &string: NSString; cdecl;
    procedure setOrthography(orthography: NSOrthography; range: NSRange); cdecl;
    function orthographyAtIndex(charIndex: NSUInteger;
      effectiveRange: NSRangePointer): NSOrthography; cdecl;
    procedure stringEditedInRange(newRange: NSRange;
      changeInLength: NSInteger); cdecl;
    function tokenRangeAtIndex(charIndex: NSUInteger;
      &unit: NSLinguisticTaggerUnit): NSRange; cdecl;
    function sentenceRangeForRange(range: NSRange): NSRange; cdecl;
    [MethodName('enumerateTagsInRange:unit:scheme:options:usingBlock:')]
    procedure enumerateTagsInRangeUnitSchemeOptionsUsingBlock(range: NSRange;
      &unit: NSLinguisticTaggerUnit; scheme: NSLinguisticTagScheme;
      options: NSLinguisticTaggerOptions;
      usingBlock: TFoundationUsingBlock6); cdecl;
    [MethodName('tagAtIndex:unit:scheme:tokenRange:')]
    function tagAtIndexUnitSchemeTokenRange(charIndex: NSUInteger;
      &unit: NSLinguisticTaggerUnit; scheme: NSLinguisticTagScheme;
      tokenRange: NSRangePointer): NSLinguisticTag; cdecl;
    [MethodName('tagsInRange:unit:scheme:options:tokenRanges:')]
    function tagsInRangeUnitSchemeOptionsTokenRanges(range: NSRange;
      &unit: NSLinguisticTaggerUnit; scheme: NSLinguisticTagScheme;
      options: NSLinguisticTaggerOptions; tokenRanges: NSArray): NSArray; cdecl;
    [MethodName('enumerateTagsInRange:scheme:options:usingBlock:')]
    procedure enumerateTagsInRangeSchemeOptionsUsingBlock(range: NSRange;
      scheme: NSLinguisticTagScheme; options: NSLinguisticTaggerOptions;
      usingBlock: TFoundationUsingBlock7); cdecl;
    [MethodName('tagAtIndex:scheme:tokenRange:sentenceRange:')]
    function tagAtIndexSchemeTokenRangeSentenceRange(charIndex: NSUInteger;
      scheme: NSLinguisticTagScheme; tokenRange: NSRangePointer;
      sentenceRange: NSRangePointer): NSLinguisticTag; cdecl;
    [MethodName('tagsInRange:scheme:options:tokenRanges:')]
    function tagsInRangeSchemeOptionsTokenRanges(range: NSRange;
      scheme: NSString; options: NSLinguisticTaggerOptions;
      tokenRanges: NSArray): NSArray; cdecl;
    function dominantLanguage: NSString; cdecl;
    function possibleTagsAtIndex(charIndex: NSUInteger; scheme: NSString;
      tokenRange: NSRangePointer; sentenceRange: NSRangePointer;
      scores: NSArray): NSArray; cdecl;
  end;

  TNSLinguisticTagger = class(TOCGenericImport<NSLinguisticTaggerClass,
    NSLinguisticTagger>)
  end;

  PNSLinguisticTagger = Pointer;

  NSMetadataItemClass = interface(NSObjectClass)
    ['{067C9B75-1E53-497F-9346-26188D6E2C6A}']
  end;

  NSMetadataItem = interface(NSObject)
    ['{CE24BE64-7091-41DA-A580-0E8DF51950B5}']
    function initWithURL(url: NSURL): Pointer { instancetype }; cdecl;
    function valueForAttribute(key: NSString): Pointer; cdecl;
    function valuesForAttributes(keys: NSArray): NSDictionary; cdecl;
    function attributes: NSArray; cdecl;
  end;

  TNSMetadataItem = class(TOCGenericImport<NSMetadataItemClass, NSMetadataItem>)
  end;

  PNSMetadataItem = Pointer;

  NSMetadataQueryAttributeValueTupleClass = interface(NSObjectClass)
    ['{69C3EE55-A313-4CC3-88CB-E6C212CAEEF7}']
  end;

  NSMetadataQueryAttributeValueTuple = interface(NSObject)
    ['{76E23E2F-7AAA-4819-B234-1C2A4EC993C2}']
    function attribute: NSString; cdecl;
    function value: Pointer; cdecl;
    function count: NSUInteger; cdecl;
  end;

  TNSMetadataQueryAttributeValueTuple = class
    (TOCGenericImport<NSMetadataQueryAttributeValueTupleClass,
    NSMetadataQueryAttributeValueTuple>)
  end;

  PNSMetadataQueryAttributeValueTuple = Pointer;

  NSMetadataQueryResultGroupClass = interface(NSObjectClass)
    ['{38C5CCAB-58C2-4A28-9C9C-9850520FE96D}']
  end;

  NSMetadataQueryResultGroup = interface(NSObject)
    ['{D15F63C2-BCB5-4BD8-B3A1-DB0A82D8296A}']
    function attribute: NSString; cdecl;
    function value: Pointer; cdecl;
    function subgroups: NSArray; cdecl;
    function resultCount: NSUInteger; cdecl;
    function resultAtIndex(idx: NSUInteger): Pointer; cdecl;
    function results: NSArray; cdecl;
  end;

  TNSMetadataQueryResultGroup = class
    (TOCGenericImport<NSMetadataQueryResultGroupClass,
    NSMetadataQueryResultGroup>)
  end;

  PNSMetadataQueryResultGroup = Pointer;

  NSMetadataQueryClass = interface(NSObjectClass)
    ['{6C0EAE98-B1B1-429A-8DEF-BF5CD5353921}']
  end;

  NSMetadataQuery = interface(NSObject)
    ['{ADAF38D7-097A-4AAA-918D-11A6A97825F5}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setPredicate(predicate: NSPredicate); cdecl;
    function predicate: NSPredicate; cdecl;
    procedure setSortDescriptors(sortDescriptors: NSArray); cdecl;
    function sortDescriptors: NSArray; cdecl;
    procedure setValueListAttributes(valueListAttributes: NSArray); cdecl;
    function valueListAttributes: NSArray; cdecl;
    procedure setGroupingAttributes(groupingAttributes: NSArray); cdecl;
    function groupingAttributes: NSArray; cdecl;
    procedure setNotificationBatchingInterval(notificationBatchingInterval
      : NSTimeInterval); cdecl;
    function notificationBatchingInterval: NSTimeInterval; cdecl;
    procedure setSearchScopes(searchScopes: NSArray); cdecl;
    function searchScopes: NSArray; cdecl;
    procedure setSearchItems(searchItems: NSArray); cdecl;
    function searchItems: NSArray; cdecl;
    procedure setOperationQueue(operationQueue: NSOperationQueue); cdecl;
    function operationQueue: NSOperationQueue; cdecl;
    function startQuery: Boolean; cdecl;
    procedure stopQuery; cdecl;
    function isStarted: Boolean; cdecl;
    function isGathering: Boolean; cdecl;
    function isStopped: Boolean; cdecl;
    procedure disableUpdates; cdecl;
    procedure enableUpdates; cdecl;
    function resultCount: NSUInteger; cdecl;
    function resultAtIndex(idx: NSUInteger): Pointer; cdecl;
    procedure enumerateResultsUsingBlock(block: TFoundationBlock14); cdecl;
    procedure enumerateResultsWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock14); cdecl;
    function results: NSArray; cdecl;
    function indexOfResult(result: Pointer): NSUInteger; cdecl;
    function valueLists: NSDictionary; cdecl;
    function groupedResults: NSArray; cdecl;
    function valueOfAttribute(attrName: NSString; forResultAtIndex: NSUInteger)
      : Pointer; cdecl;
  end;

  TNSMetadataQuery = class(TOCGenericImport<NSMetadataQueryClass,
    NSMetadataQuery>)
  end;

  PNSMetadataQuery = Pointer;

  NSNetServiceClass = interface(NSObjectClass)
    ['{B900B6DB-7D17-42F0-8117-DAC80B9A25C3}']
    { class } function dictionaryFromTXTRecordData(txtData: NSData)
      : NSDictionary; cdecl;
    { class } function dataFromTXTRecordDictionary(txtDictionary: NSDictionary)
      : NSData; cdecl;
  end;

  NSNetService = interface(NSObject)
    ['{246C8B74-2372-4519-8061-BFBF8187F3FC}']
    [MethodName('initWithDomain:type:name:port:')]
    function initWithDomainTypeNamePort(domain: NSString; &type: NSString;
      name: NSString; port: Integer): Pointer { instancetype }; cdecl;
    [MethodName('initWithDomain:type:name:')]
    function initWithDomainTypeName(domain: NSString; &type: NSString;
      name: NSString): Pointer { instancetype }; cdecl;
    procedure scheduleInRunLoop(aRunLoop: NSRunLoop;
      forMode: NSRunLoopMode); cdecl;
    procedure removeFromRunLoop(aRunLoop: NSRunLoop;
      forMode: NSRunLoopMode); cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setIncludesPeerToPeer(includesPeerToPeer: Boolean); cdecl;
    function includesPeerToPeer: Boolean; cdecl;
    function name: NSString; cdecl;
    function &type: NSString; cdecl;
    function domain: NSString; cdecl;
    function hostname: NSString; cdecl;
    function addresses: NSArray; cdecl;
    function port: NSInteger; cdecl;
    procedure publish; cdecl;
    procedure publishWithOptions(options: NSNetServiceOptions); cdecl;
    procedure resolve; cdecl;
    procedure stop; cdecl;
    procedure resolveWithTimeout(timeout: NSTimeInterval); cdecl;
    function getInputStream(inputStream: NSInputStream;
      outputStream: NSOutputStream): Boolean; cdecl;
    function setTXTRecordData(recordData: NSData): Boolean; cdecl;
    function TXTRecordData: NSData; cdecl;
    procedure startMonitoring; cdecl;
    procedure stopMonitoring; cdecl;
  end;

  TNSNetService = class(TOCGenericImport<NSNetServiceClass, NSNetService>)
  end;

  PNSNetService = Pointer;

  NSNetServiceBrowserClass = interface(NSObjectClass)
    ['{564B2E08-2E49-4D23-B63A-EC64077E4026}']
  end;

  NSNetServiceBrowser = interface(NSObject)
    ['{AF4AC3D4-C7DC-4F9B-81CA-1597EE132AA7}']
    function init: Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setIncludesPeerToPeer(includesPeerToPeer: Boolean); cdecl;
    function includesPeerToPeer: Boolean; cdecl;
    procedure scheduleInRunLoop(aRunLoop: NSRunLoop;
      forMode: NSRunLoopMode); cdecl;
    procedure removeFromRunLoop(aRunLoop: NSRunLoop;
      forMode: NSRunLoopMode); cdecl;
    procedure searchForBrowsableDomains; cdecl;
    procedure searchForRegistrationDomains; cdecl;
    procedure searchForServicesOfType(&type: NSString;
      inDomain: NSString); cdecl;
    procedure stop; cdecl;
  end;

  TNSNetServiceBrowser = class(TOCGenericImport<NSNetServiceBrowserClass,
    NSNetServiceBrowser>)
  end;

  PNSNetServiceBrowser = Pointer;

  NSUbiquitousKeyValueStoreClass = interface(NSObjectClass)
    ['{47FBD5EF-4661-4CAA-B2CC-E1B9D769A8AE}']
  end;

  NSUbiquitousKeyValueStore = interface(NSObject)
    ['{F0AE0173-5E5F-4133-8E62-6A499F6B37A6}']
    procedure setDefaultStore(defaultStore: NSUbiquitousKeyValueStore); cdecl;
    function defaultStore: NSUbiquitousKeyValueStore; cdecl;
    function objectForKey(aKey: NSString): Pointer; cdecl;
    procedure setObject(anObject: Pointer; forKey: NSString); cdecl;
    procedure removeObjectForKey(aKey: NSString); cdecl;
    function stringForKey(aKey: NSString): NSString; cdecl;
    function arrayForKey(aKey: NSString): NSArray; cdecl;
    function dictionaryForKey(aKey: NSString): NSDictionary; cdecl;
    function dataForKey(aKey: NSString): NSData; cdecl;
    function longLongForKey(aKey: NSString): Int64; cdecl;
    function doubleForKey(aKey: NSString): Double; cdecl;
    function boolForKey(aKey: NSString): Boolean; cdecl;
    procedure setString(aString: NSString; forKey: NSString); cdecl;
    procedure setData(aData: NSData; forKey: NSString); cdecl;
    procedure setArray(anArray: NSArray; forKey: NSString); cdecl;
    procedure setDictionary(aDictionary: NSDictionary; forKey: NSString); cdecl;
    procedure setLongLong(value: Int64; forKey: NSString); cdecl;
    procedure setDouble(value: Double; forKey: NSString); cdecl;
    procedure setBool(value: Boolean; forKey: NSString); cdecl;
    function dictionaryRepresentation: NSDictionary; cdecl;
    function synchronize: Boolean; cdecl;
  end;

  TNSUbiquitousKeyValueStore = class
    (TOCGenericImport<NSUbiquitousKeyValueStoreClass,
    NSUbiquitousKeyValueStore>)
  end;

  PNSUbiquitousKeyValueStore = Pointer;

  NSUndoManagerClass = interface(NSObjectClass)
    ['{0C991DF3-FB6D-451D-A222-4FDBA71231B7}']
  end;

  NSUndoManager = interface(NSObject)
    ['{1BB16977-89DF-43CB-A983-94C9213CC23B}']
    procedure beginUndoGrouping; cdecl;
    procedure endUndoGrouping; cdecl;
    function groupingLevel: NSInteger; cdecl;
    procedure disableUndoRegistration; cdecl;
    procedure enableUndoRegistration; cdecl;
    function isUndoRegistrationEnabled: Boolean; cdecl;
    procedure setGroupsByEvent(groupsByEvent: Boolean); cdecl;
    function groupsByEvent: Boolean; cdecl;
    procedure setLevelsOfUndo(levelsOfUndo: NSUInteger); cdecl;
    function levelsOfUndo: NSUInteger; cdecl;
    procedure setRunLoopModes(runLoopModes: NSArray); cdecl;
    function runLoopModes: NSArray; cdecl;
    procedure undo; cdecl;
    procedure redo; cdecl;
    procedure undoNestedGroup; cdecl;
    function canUndo: Boolean; cdecl;
    function canRedo: Boolean; cdecl;
    function isUndoing: Boolean; cdecl;
    function isRedoing: Boolean; cdecl;
    procedure removeAllActions; cdecl;
    procedure removeAllActionsWithTarget(target: Pointer); cdecl;
    [MethodName('registerUndoWithTarget:selector:object:')]
    procedure registerUndoWithTargetSelectorObject(target: Pointer;
      selector: SEL; &object: Pointer); cdecl;
    function prepareWithInvocationTarget(target: Pointer): Pointer; cdecl;
    [MethodName('registerUndoWithTarget:handler:')]
    procedure registerUndoWithTargetHandler(target: Pointer;
      handler: TFoundationHandler); cdecl;
    procedure setActionIsDiscardable(discardable: Boolean); cdecl;
    function undoActionIsDiscardable: Boolean; cdecl;
    function redoActionIsDiscardable: Boolean; cdecl;
    function undoActionName: NSString; cdecl;
    function redoActionName: NSString; cdecl;
    procedure setActionName(actionName: NSString); cdecl;
    function undoMenuItemTitle: NSString; cdecl;
    function redoMenuItemTitle: NSString; cdecl;
    function undoMenuTitleForUndoActionName(actionName: NSString)
      : NSString; cdecl;
    function redoMenuTitleForUndoActionName(actionName: NSString)
      : NSString; cdecl;
  end;

  TNSUndoManager = class(TOCGenericImport<NSUndoManagerClass, NSUndoManager>)
  end;

  PNSUndoManager = Pointer;

  NSURLSessionUploadTaskClass = interface(NSURLSessionDataTaskClass)
    ['{8FCFD4B3-F9E1-45B0-A266-60854EDA71BC}']
    { class } function new: Pointer { instancetype }; cdecl;
  end;

  NSURLSessionUploadTask = interface(NSURLSessionDataTask)
    ['{4C95A532-96CD-4515-89AB-B57F20F6CD9F}']
    function init: Pointer { instancetype }; cdecl;
  end;

  TNSURLSessionUploadTask = class(TOCGenericImport<NSURLSessionUploadTaskClass,
    NSURLSessionUploadTask>)
  end;

  PNSURLSessionUploadTask = Pointer;

  NSURLSessionDownloadTaskClass = interface(NSURLSessionTaskClass)
    ['{774A2A16-5542-4961-A587-5F83607F0F72}']
    { class } function new: Pointer { instancetype }; cdecl;
  end;

  NSURLSessionDownloadTask = interface(NSURLSessionTask)
    ['{0A1D8E48-4A2E-48D9-BA46-40BEC6A2EE58}']
    procedure cancelByProducingResumeData(completionHandler
      : TFoundationCompletionHandler14); cdecl;
    function init: Pointer { instancetype }; cdecl;
  end;

  TNSURLSessionDownloadTask = class
    (TOCGenericImport<NSURLSessionDownloadTaskClass, NSURLSessionDownloadTask>)
  end;

  PNSURLSessionDownloadTask = Pointer;

  NSURLSessionClass = interface(NSObjectClass)
    ['{B551935D-327C-424B-BB31-8E375017FF52}']
    [MethodName('sessionWithConfiguration:')]
    { class } function sessionWithConfiguration(configuration
      : NSURLSessionConfiguration): NSURLSession; cdecl;
    [MethodName('sessionWithConfiguration:delegate:delegateQueue:')]
    { class } function sessionWithConfigurationDelegateDelegateQueue
      (configuration: NSURLSessionConfiguration; delegate: Pointer;
      delegateQueue: NSOperationQueue): NSURLSession; cdecl;
    { class } function new: Pointer { instancetype }; cdecl;
  end;

  NSURLSession = interface(NSObject)
    ['{309582AD-BB5E-4679-8801-D77E9F550491}']
    procedure setSharedSession(sharedSession: NSURLSession); cdecl;
    function sharedSession: NSURLSession; cdecl;
    function delegateQueue: NSOperationQueue; cdecl;
    function delegate: Pointer; cdecl;
    function configuration: NSURLSessionConfiguration; cdecl;
    procedure setSessionDescription(sessionDescription: NSString); cdecl;
    function sessionDescription: NSString; cdecl;
    procedure finishTasksAndInvalidate; cdecl;
    procedure invalidateAndCancel; cdecl;
    procedure resetWithCompletionHandler(completionHandler
      : TFoundationUsingBlock1); cdecl;
    procedure flushWithCompletionHandler(completionHandler
      : TFoundationUsingBlock1); cdecl;
    procedure getTasksWithCompletionHandler(completionHandler
      : TFoundationCompletionHandler11); cdecl;
    procedure getAllTasksWithCompletionHandler(completionHandler
      : TFoundationCompletionHandler5); cdecl;
    [MethodName('dataTaskWithRequest:')]
    function dataTaskWithRequest(request: NSURLRequest)
      : NSURLSessionDataTask; cdecl;
    [MethodName('dataTaskWithURL:')]
    function dataTaskWithURL(url: NSURL): NSURLSessionDataTask; cdecl;
    [MethodName('uploadTaskWithRequest:fromFile:')]
    function uploadTaskWithRequestFromFile(request: NSURLRequest;
      fromFile: NSURL): NSURLSessionUploadTask; cdecl;
    [MethodName('uploadTaskWithRequest:fromData:')]
    function uploadTaskWithRequestFromData(request: NSURLRequest;
      fromData: NSData): NSURLSessionUploadTask; cdecl;
    function uploadTaskWithStreamedRequest(request: NSURLRequest)
      : NSURLSessionUploadTask; cdecl;
    [MethodName('downloadTaskWithRequest:')]
    function downloadTaskWithRequest(request: NSURLRequest)
      : NSURLSessionDownloadTask; cdecl;
    [MethodName('downloadTaskWithURL:')]
    function downloadTaskWithURL(url: NSURL): NSURLSessionDownloadTask; cdecl;
    [MethodName('downloadTaskWithResumeData:')]
    function downloadTaskWithResumeData(resumeData: NSData)
      : NSURLSessionDownloadTask; cdecl;
    function streamTaskWithHostName(hostname: NSString; port: NSInteger)
      : NSURLSessionStreamTask; cdecl;
    function streamTaskWithNetService(service: NSNetService)
      : NSURLSessionStreamTask; cdecl;
    [MethodName('webSocketTaskWithURL:')]
    function webSocketTaskWithURL(url: NSURL): NSURLSessionWebSocketTask; cdecl;
    [MethodName('webSocketTaskWithURL:protocols:')]
    function webSocketTaskWithURLProtocols(url: NSURL; protocols: NSArray)
      : NSURLSessionWebSocketTask; cdecl;
    function webSocketTaskWithRequest(request: NSURLRequest)
      : NSURLSessionWebSocketTask; cdecl;
    function init: Pointer { instancetype }; cdecl;
    [MethodName('dataTaskWithRequest:completionHandler:')]
    function dataTaskWithRequestCompletionHandler(request: NSURLRequest;
      completionHandler: TFoundationCompletionHandler12)
      : NSURLSessionDataTask; cdecl;
    [MethodName('dataTaskWithURL:completionHandler:')]
    function dataTaskWithURLCompletionHandler(url: NSURL;
      completionHandler: TFoundationCompletionHandler12)
      : NSURLSessionDataTask; cdecl;
    [MethodName('uploadTaskWithRequest:fromFile:completionHandler:')]
    function uploadTaskWithRequestFromFileCompletionHandler
      (request: NSURLRequest; fromFile: NSURL;
      completionHandler: TFoundationCompletionHandler12)
      : NSURLSessionUploadTask; cdecl;
    [MethodName('uploadTaskWithRequest:fromData:completionHandler:')]
    function uploadTaskWithRequestFromDataCompletionHandler
      (request: NSURLRequest; fromData: NSData;
      completionHandler: TFoundationCompletionHandler12)
      : NSURLSessionUploadTask; cdecl;
    [MethodName('downloadTaskWithRequest:completionHandler:')]
    function downloadTaskWithRequestCompletionHandler(request: NSURLRequest;
      completionHandler: TFoundationCompletionHandler13)
      : NSURLSessionDownloadTask; cdecl;
    [MethodName('downloadTaskWithURL:completionHandler:')]
    function downloadTaskWithURLCompletionHandler(url: NSURL;
      completionHandler: TFoundationCompletionHandler13)
      : NSURLSessionDownloadTask; cdecl;
    [MethodName('downloadTaskWithResumeData:completionHandler:')]
    function downloadTaskWithResumeDataCompletionHandler(resumeData: NSData;
      completionHandler: TFoundationCompletionHandler13)
      : NSURLSessionDownloadTask; cdecl;
  end;

  TNSURLSession = class(TOCGenericImport<NSURLSessionClass, NSURLSession>)
  end;

  PNSURLSession = Pointer;

  NSURLSessionStreamTaskClass = interface(NSURLSessionTaskClass)
    ['{A42221B7-595D-4B07-A993-464C5ACEA117}']
    { class } function new: Pointer { instancetype }; cdecl;
  end;

  NSURLSessionStreamTask = interface(NSURLSessionTask)
    ['{7A0DC690-D867-4146-983A-3D931D0ACA85}']
    procedure readDataOfMinLength(minBytes: NSUInteger; maxLength: NSUInteger;
      timeout: NSTimeInterval;
      completionHandler: TFoundationCompletionHandler14); cdecl;
    procedure writeData(data: NSData; timeout: NSTimeInterval;
      completionHandler: TFoundationCompletionHandler1); cdecl;
    procedure captureStreams; cdecl;
    procedure closeWrite; cdecl;
    procedure closeRead; cdecl;
    procedure startSecureConnection; cdecl;
    procedure stopSecureConnection; cdecl;
    function init: Pointer { instancetype }; cdecl;
  end;

  TNSURLSessionStreamTask = class(TOCGenericImport<NSURLSessionStreamTaskClass,
    NSURLSessionStreamTask>)
  end;

  PNSURLSessionStreamTask = Pointer;

  NSURLSessionWebSocketTaskClass = interface(NSURLSessionTaskClass)
    ['{D484E7C6-3910-49AE-AB6D-65627304B9F8}']
  end;

  NSURLSessionWebSocketTask = interface(NSURLSessionTask)
    ['{FB4498B3-EEEB-4EAA-9C5A-00843D583752}']
    procedure sendMessage(message: NSURLSessionWebSocketMessage;
      completionHandler: TFoundationCompletionHandler1); cdecl;
    procedure receiveMessageWithCompletionHandler(completionHandler
      : TFoundationCompletionHandler15); cdecl;
    procedure sendPingWithPongReceiveHandler(pongReceiveHandler
      : TFoundationCompletionHandler1); cdecl;
    procedure cancelWithCloseCode(closeCode: NSURLSessionWebSocketCloseCode;
      reason: NSData); cdecl;
    procedure setMaximumMessageSize(maximumMessageSize: NSInteger); cdecl;
    function maximumMessageSize: NSInteger; cdecl;
    function closeCode: NSURLSessionWebSocketCloseCode; cdecl;
    function closeReason: NSData; cdecl;
  end;

  TNSURLSessionWebSocketTask = class
    (TOCGenericImport<NSURLSessionWebSocketTaskClass,
    NSURLSessionWebSocketTask>)
  end;

  PNSURLSessionWebSocketTask = Pointer;

  NSURLSessionConfigurationClass = interface(NSObjectClass)
    ['{9F848DD1-616A-4051-9478-5A1B5A526CA7}']
    { class } function backgroundSessionConfigurationWithIdentifier
      (identifier: NSString): NSURLSessionConfiguration; cdecl;
    { class } function new: Pointer { instancetype }; cdecl;
    { class } function backgroundSessionConfiguration(identifier: NSString)
      : NSURLSessionConfiguration; cdecl;
  end;

  NSURLSessionConfiguration = interface(NSObject)
    ['{E437D0C1-3373-4B94-AA18-0ADE5639C2DA}']
    procedure setDefaultSessionConfiguration(defaultSessionConfiguration
      : NSURLSessionConfiguration); cdecl;
    function defaultSessionConfiguration: NSURLSessionConfiguration; cdecl;
    procedure setEphemeralSessionConfiguration(ephemeralSessionConfiguration
      : NSURLSessionConfiguration); cdecl;
    function ephemeralSessionConfiguration: NSURLSessionConfiguration; cdecl;
    function identifier: NSString; cdecl;
    procedure setRequestCachePolicy(requestCachePolicy
      : NSURLRequestCachePolicy); cdecl;
    function requestCachePolicy: NSURLRequestCachePolicy; cdecl;
    procedure setTimeoutIntervalForRequest(timeoutIntervalForRequest
      : NSTimeInterval); cdecl;
    function timeoutIntervalForRequest: NSTimeInterval; cdecl;
    procedure setTimeoutIntervalForResource(timeoutIntervalForResource
      : NSTimeInterval); cdecl;
    function timeoutIntervalForResource: NSTimeInterval; cdecl;
    procedure setNetworkServiceType(networkServiceType
      : NSURLRequestNetworkServiceType); cdecl;
    function networkServiceType: NSURLRequestNetworkServiceType; cdecl;
    procedure setAllowsCellularAccess(allowsCellularAccess: Boolean); cdecl;
    function allowsCellularAccess: Boolean; cdecl;
    procedure setAllowsExpensiveNetworkAccess(allowsExpensiveNetworkAccess
      : Boolean); cdecl;
    function allowsExpensiveNetworkAccess: Boolean; cdecl;
    procedure setAllowsConstrainedNetworkAccess(allowsConstrainedNetworkAccess
      : Boolean); cdecl;
    function allowsConstrainedNetworkAccess: Boolean; cdecl;
    procedure setRequiresDNSSECValidation(requiresDNSSECValidation
      : Boolean); cdecl;
    function requiresDNSSECValidation: Boolean; cdecl;
    procedure setWaitsForConnectivity(waitsForConnectivity: Boolean); cdecl;
    function waitsForConnectivity: Boolean; cdecl;
    procedure setDiscretionary(discretionary: Boolean); cdecl;
    function isDiscretionary: Boolean; cdecl;
    procedure setSharedContainerIdentifier(sharedContainerIdentifier
      : NSString); cdecl;
    function sharedContainerIdentifier: NSString; cdecl;
    procedure setSessionSendsLaunchEvents(sessionSendsLaunchEvents
      : Boolean); cdecl;
    function sessionSendsLaunchEvents: Boolean; cdecl;
    procedure setConnectionProxyDictionary(connectionProxyDictionary
      : NSDictionary); cdecl;
    function connectionProxyDictionary: NSDictionary; cdecl;
    procedure setTLSMinimumSupportedProtocol(TLSMinimumSupportedProtocol
      : SSLProtocol); cdecl;
    function TLSMinimumSupportedProtocol: SSLProtocol; cdecl;
    procedure setTLSMaximumSupportedProtocol(TLSMaximumSupportedProtocol
      : SSLProtocol); cdecl;
    function TLSMaximumSupportedProtocol: SSLProtocol; cdecl;
    procedure setTLSMinimumSupportedProtocolVersion
      (TLSMinimumSupportedProtocolVersion: tls_protocol_version_t); cdecl;
    function TLSMinimumSupportedProtocolVersion: tls_protocol_version_t; cdecl;
    procedure setTLSMaximumSupportedProtocolVersion
      (TLSMaximumSupportedProtocolVersion: tls_protocol_version_t); cdecl;
    function TLSMaximumSupportedProtocolVersion: tls_protocol_version_t; cdecl;
    procedure setHTTPShouldUsePipelining(HTTPShouldUsePipelining
      : Boolean); cdecl;
    function HTTPShouldUsePipelining: Boolean; cdecl;
    procedure setHTTPShouldSetCookies(HTTPShouldSetCookies: Boolean); cdecl;
    function HTTPShouldSetCookies: Boolean; cdecl;
    procedure setHTTPCookieAcceptPolicy(HTTPCookieAcceptPolicy
      : NSHTTPCookieAcceptPolicy); cdecl;
    function HTTPCookieAcceptPolicy: NSHTTPCookieAcceptPolicy; cdecl;
    procedure setHTTPAdditionalHeaders(HTTPAdditionalHeaders
      : NSDictionary); cdecl;
    function HTTPAdditionalHeaders: NSDictionary; cdecl;
    procedure setHTTPMaximumConnectionsPerHost(HTTPMaximumConnectionsPerHost
      : NSInteger); cdecl;
    function HTTPMaximumConnectionsPerHost: NSInteger; cdecl;
    procedure setHTTPCookieStorage(HTTPCookieStorage
      : NSHTTPCookieStorage); cdecl;
    function HTTPCookieStorage: NSHTTPCookieStorage; cdecl;
    procedure setURLCredentialStorage(URLCredentialStorage
      : NSURLCredentialStorage); cdecl;
    function URLCredentialStorage: NSURLCredentialStorage; cdecl;
    procedure setURLCache(URLCache: NSURLCache); cdecl;
    function URLCache: NSURLCache; cdecl;
    procedure setShouldUseExtendedBackgroundIdleMode
      (shouldUseExtendedBackgroundIdleMode: Boolean); cdecl;
    function shouldUseExtendedBackgroundIdleMode: Boolean; cdecl;
    procedure setProtocolClasses(protocolClasses: NSArray); cdecl;
    function protocolClasses: NSArray; cdecl;
    procedure setMultipathServiceType(multipathServiceType
      : NSURLSessionMultipathServiceType); cdecl;
    function multipathServiceType: NSURLSessionMultipathServiceType; cdecl;
    function init: Pointer { instancetype }; cdecl;
  end;

  TNSURLSessionConfiguration = class
    (TOCGenericImport<NSURLSessionConfigurationClass,
    NSURLSessionConfiguration>)
  end;

  PNSURLSessionConfiguration = Pointer;

  NSURLSessionTaskMetricsClass = interface(NSObjectClass)
    ['{0B752DB9-BD96-4448-B6D8-075ECDDCBB58}']
    { class } function new: Pointer { instancetype }; cdecl;
  end;

  NSURLSessionTaskMetrics = interface(NSObject)
    ['{6BEB890D-539B-4F92-B93F-F384AB2FE956}']
    function transactionMetrics: NSArray; cdecl;
    function taskInterval: NSDateInterval; cdecl;
    function redirectCount: NSUInteger; cdecl;
    function init: Pointer { instancetype }; cdecl;
  end;

  TNSURLSessionTaskMetrics = class
    (TOCGenericImport<NSURLSessionTaskMetricsClass, NSURLSessionTaskMetrics>)
  end;

  PNSURLSessionTaskMetrics = Pointer;

  NSURLSessionWebSocketMessageClass = interface(NSObjectClass)
    ['{23DEF07D-E564-463C-8A2B-7DF9D1F85D02}']
  end;

  NSURLSessionWebSocketMessage = interface(NSObject)
    ['{2A9E6A93-10BD-4303-AB13-BADD305B29B4}']
    function initWithData(data: NSData): Pointer { instancetype }; cdecl;
    function initWithString(&string: NSString): Pointer { instancetype }; cdecl;
    function &type: NSURLSessionWebSocketMessageType; cdecl;
    function data: NSData; cdecl;
    function &string: NSString; cdecl;
  end;

  TNSURLSessionWebSocketMessage = class
    (TOCGenericImport<NSURLSessionWebSocketMessageClass,
    NSURLSessionWebSocketMessage>)
  end;

  PNSURLSessionWebSocketMessage = Pointer;

  NSURLSessionTaskTransactionMetricsClass = interface(NSObjectClass)
    ['{9C685B4F-81FA-400B-B387-5228EC469E7C}']
    { class } function new: Pointer { instancetype }; cdecl;
  end;

  NSURLSessionTaskTransactionMetrics = interface(NSObject)
    ['{4BBECFEE-5E11-4E34-9D70-5EBD24E2AA44}']
    function request: NSURLRequest; cdecl;
    function response: NSURLResponse; cdecl;
    function fetchStartDate: NSDate; cdecl;
    function domainLookupStartDate: NSDate; cdecl;
    function domainLookupEndDate: NSDate; cdecl;
    function connectStartDate: NSDate; cdecl;
    function secureConnectionStartDate: NSDate; cdecl;
    function secureConnectionEndDate: NSDate; cdecl;
    function connectEndDate: NSDate; cdecl;
    function requestStartDate: NSDate; cdecl;
    function requestEndDate: NSDate; cdecl;
    function responseStartDate: NSDate; cdecl;
    function responseEndDate: NSDate; cdecl;
    function networkProtocolName: NSString; cdecl;
    function isProxyConnection: Boolean; cdecl;
    function isReusedConnection: Boolean; cdecl;
    function resourceFetchType: NSURLSessionTaskMetricsResourceFetchType; cdecl;
    function countOfRequestHeaderBytesSent: Int64; cdecl;
    function countOfRequestBodyBytesSent: Int64; cdecl;
    function countOfRequestBodyBytesBeforeEncoding: Int64; cdecl;
    function countOfResponseHeaderBytesReceived: Int64; cdecl;
    function countOfResponseBodyBytesReceived: Int64; cdecl;
    function countOfResponseBodyBytesAfterDecoding: Int64; cdecl;
    function localAddress: NSString; cdecl;
    function localPort: NSNumber; cdecl;
    function remoteAddress: NSString; cdecl;
    function remotePort: NSNumber; cdecl;
    function negotiatedTLSProtocolVersion: NSNumber; cdecl;
    function negotiatedTLSCipherSuite: NSNumber; cdecl;
    function isCellular: Boolean; cdecl;
    function isExpensive: Boolean; cdecl;
    function isConstrained: Boolean; cdecl;
    function isMultipath: Boolean; cdecl;
    function domainResolutionProtocol
      : NSURLSessionTaskMetricsDomainResolutionProtocol; cdecl;
    function init: Pointer { instancetype }; cdecl;
  end;

  TNSURLSessionTaskTransactionMetrics = class
    (TOCGenericImport<NSURLSessionTaskTransactionMetricsClass,
    NSURLSessionTaskTransactionMetrics>)
  end;

  PNSURLSessionTaskTransactionMetrics = Pointer;

  NSUserActivityClass = interface(NSObjectClass)
    ['{C5BFDBBD-BF58-4C56-A650-A4F81FA1F0A9}']
    { class } procedure deleteSavedUserActivitiesWithPersistentIdentifiers
      (persistentIdentifiers: NSArray;
      completionHandler: TFoundationUsingBlock1); cdecl;
    { class } procedure deleteAllSavedUserActivitiesWithCompletionHandler
      (handler: TFoundationUsingBlock1); cdecl;
  end;

  NSUserActivity = interface(NSObject)
    ['{C6AAD2AD-8D75-4CA1-A699-43E8068BA7B1}']
    function initWithActivityType(activityType: NSString)
      : Pointer { instancetype }; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function activityType: NSString; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setUserInfo(userInfo: NSDictionary); cdecl;
    function userInfo: NSDictionary; cdecl;
    procedure addUserInfoEntriesFromDictionary(otherDictionary
      : NSDictionary); cdecl;
    procedure setRequiredUserInfoKeys(requiredUserInfoKeys: NSSet); cdecl;
    function requiredUserInfoKeys: NSSet; cdecl;
    procedure setNeedsSave(needsSave: Boolean); cdecl;
    function needsSave: Boolean; cdecl;
    procedure setWebpageURL(webpageURL: NSURL); cdecl;
    function webpageURL: NSURL; cdecl;
    procedure setReferrerURL(referrerURL: NSURL); cdecl;
    function referrerURL: NSURL; cdecl;
    procedure setExpirationDate(expirationDate: NSDate); cdecl;
    function expirationDate: NSDate; cdecl;
    procedure setKeywords(keywords: NSSet); cdecl;
    function keywords: NSSet; cdecl;
    procedure setSupportsContinuationStreams(supportsContinuationStreams
      : Boolean); cdecl;
    function supportsContinuationStreams: Boolean; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setTargetContentIdentifier(targetContentIdentifier
      : NSString); cdecl;
    function targetContentIdentifier: NSString; cdecl;
    procedure becomeCurrent; cdecl;
    procedure resignCurrent; cdecl;
    procedure invalidate; cdecl;
    procedure getContinuationStreamsWithCompletionHandler(completionHandler
      : TFoundationCompletionHandler20); cdecl;
    procedure setEligibleForHandoff(eligibleForHandoff: Boolean); cdecl;
    function isEligibleForHandoff: Boolean; cdecl;
    procedure setEligibleForSearch(eligibleForSearch: Boolean); cdecl;
    function isEligibleForSearch: Boolean; cdecl;
    procedure setEligibleForPublicIndexing(eligibleForPublicIndexing
      : Boolean); cdecl;
    function isEligibleForPublicIndexing: Boolean; cdecl;
    procedure setEligibleForPrediction(eligibleForPrediction: Boolean); cdecl;
    function isEligibleForPrediction: Boolean; cdecl;
    procedure setPersistentIdentifier(persistentIdentifier
      : NSUserActivityPersistentIdentifier); cdecl;
    function persistentIdentifier: NSUserActivityPersistentIdentifier; cdecl;
  end;

  TNSUserActivity = class(TOCGenericImport<NSUserActivityClass, NSUserActivity>)
  end;

  PNSUserActivity = Pointer;

  // ===== Protocol declarations =====

  NSCopying = interface(IObjectiveC)
    ['{42EBC7DA-BC71-4D71-88EA-95ABBABD57EE}']
    function copyWithZone(zone: Pointer): Pointer; cdecl;
  end;

  NSMutableCopying = interface(IObjectiveC)
    ['{5598E291-A4A2-4474-96BB-61C7CEE25369}']
    function mutableCopyWithZone(zone: Pointer): Pointer; cdecl;
  end;

  NSCoding = interface(IObjectiveC)
    ['{E079A8F7-AA40-4943-86AB-AEC9923643FB}']
    procedure encodeWithCoder(coder: NSCoder); cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
  end;

  NSSecureCoding = interface(IObjectiveC)
    ['{ECDBBE6A-A3C1-46A8-83EB-DBF6876A93AD}']
    procedure setSupportsSecureCoding(supportsSecureCoding: Boolean); cdecl;
    function supportsSecureCoding: Boolean; cdecl;
  end;

  NSDiscardableContent = interface(IObjectiveC)
    ['{DB18575E-433E-4593-9393-E7ECDB2E3062}']
    function beginContentAccess: Boolean; cdecl;
    procedure endContentAccess; cdecl;
    procedure discardContentIfPossible; cdecl;
    function isContentDiscarded: Boolean; cdecl;
  end;

  NSFastEnumeration = interface(IObjectiveC)
    ['{BE9683C0-EC3C-4227-BAD5-EF07ADE18D83}']
    function countByEnumeratingWithState(state: PNSFastEnumerationState;
      objects: Pointer; count: NSUInteger): NSUInteger; cdecl;
  end;

  NSItemProviderWriting = interface(IObjectiveC)
    ['{ADF92057-2A7B-48C6-BB5C-29F0BD5A22BA}']
    procedure setWritableTypeIdentifiersForItemProvider
      (writableTypeIdentifiersForItemProvider: NSArray); cdecl;
    function writableTypeIdentifiersForItemProvider: NSArray; cdecl;
    function itemProviderVisibilityForRepresentationWithTypeIdentifier
      (typeIdentifier: NSString): NSItemProviderRepresentationVisibility; cdecl;
    function loadDataWithTypeIdentifier(typeIdentifier: NSString;
      forItemProviderCompletionHandler
      : TFoundationForItemProviderCompletionHandler): NSProgress; cdecl;
  end;

  NSItemProviderReading = interface(IObjectiveC)
    ['{D78060A6-8881-4268-BE43-447E9D665644}']
    procedure setReadableTypeIdentifiersForItemProvider
      (readableTypeIdentifiersForItemProvider: NSArray); cdecl;
    function readableTypeIdentifiersForItemProvider: NSArray; cdecl;
    function objectWithItemProviderData(data: NSData; typeIdentifier: NSString;
      error: NSError): Pointer { instancetype }; cdecl;
  end;

  NSProgressReporting = interface(IObjectiveC)
    ['{D1D0B6FE-7065-41DC-8F35-B55DF152CFCB}']
    function progress: NSProgress; cdecl;
  end;

  NSDecimalNumberBehaviors = interface(IObjectiveC)
    ['{FCAC9A47-DA84-464F-BE9A-756A55E7E766}']
    function roundingMode: NSRoundingMode; cdecl;
    function scale: SmallInt; cdecl;
    function exceptionDuringOperation(operation: SEL; error: NSCalculationError;
      leftOperand: NSDecimalNumber; rightOperand: NSDecimalNumber)
      : NSDecimalNumber; cdecl;
  end;

  NSFileManagerDelegate = interface(IObjectiveC)
    ['{FD1BDBAF-FA42-4C99-A01B-1E6054B2F931}']
    [MethodName('fileManager:shouldCopyItemAtPath:toPath:')]
    function fileManagerShouldCopyItemAtPathToPath(fileManager: NSFileManager;
      shouldCopyItemAtPath: NSString; toPath: NSString): Boolean; cdecl;
    [MethodName('fileManager:shouldCopyItemAtURL:toURL:')]
    function fileManagerShouldCopyItemAtURLToURL(fileManager: NSFileManager;
      shouldCopyItemAtURL: NSURL; toURL: NSURL): Boolean; cdecl;
    [MethodName
      ('fileManager:shouldProceedAfterError:copyingItemAtPath:toPath:')]
    function fileManagerShouldProceedAfterErrorCopyingItemAtPathToPath
      (fileManager: NSFileManager; shouldProceedAfterError: NSError;
      copyingItemAtPath: NSString; toPath: NSString): Boolean; cdecl;
    [MethodName('fileManager:shouldProceedAfterError:copyingItemAtURL:toURL:')]
    function fileManagerShouldProceedAfterErrorCopyingItemAtURLToURL
      (fileManager: NSFileManager; shouldProceedAfterError: NSError;
      copyingItemAtURL: NSURL; toURL: NSURL): Boolean; cdecl;
    [MethodName('fileManager:shouldMoveItemAtPath:toPath:')]
    function fileManagerShouldMoveItemAtPathToPath(fileManager: NSFileManager;
      shouldMoveItemAtPath: NSString; toPath: NSString): Boolean; cdecl;
    [MethodName('fileManager:shouldMoveItemAtURL:toURL:')]
    function fileManagerShouldMoveItemAtURLToURL(fileManager: NSFileManager;
      shouldMoveItemAtURL: NSURL; toURL: NSURL): Boolean; cdecl;
    [MethodName('fileManager:shouldProceedAfterError:movingItemAtPath:toPath:')]
    function fileManagerShouldProceedAfterErrorMovingItemAtPathToPath
      (fileManager: NSFileManager; shouldProceedAfterError: NSError;
      movingItemAtPath: NSString; toPath: NSString): Boolean; cdecl;
    [MethodName('fileManager:shouldProceedAfterError:movingItemAtURL:toURL:')]
    function fileManagerShouldProceedAfterErrorMovingItemAtURLToURL
      (fileManager: NSFileManager; shouldProceedAfterError: NSError;
      movingItemAtURL: NSURL; toURL: NSURL): Boolean; cdecl;
    [MethodName('fileManager:shouldLinkItemAtPath:toPath:')]
    function fileManagerShouldLinkItemAtPathToPath(fileManager: NSFileManager;
      shouldLinkItemAtPath: NSString; toPath: NSString): Boolean; cdecl;
    [MethodName('fileManager:shouldLinkItemAtURL:toURL:')]
    function fileManagerShouldLinkItemAtURLToURL(fileManager: NSFileManager;
      shouldLinkItemAtURL: NSURL; toURL: NSURL): Boolean; cdecl;
    [MethodName
      ('fileManager:shouldProceedAfterError:linkingItemAtPath:toPath:')]
    function fileManagerShouldProceedAfterErrorLinkingItemAtPathToPath
      (fileManager: NSFileManager; shouldProceedAfterError: NSError;
      linkingItemAtPath: NSString; toPath: NSString): Boolean; cdecl;
    [MethodName('fileManager:shouldProceedAfterError:linkingItemAtURL:toURL:')]
    function fileManagerShouldProceedAfterErrorLinkingItemAtURLToURL
      (fileManager: NSFileManager; shouldProceedAfterError: NSError;
      linkingItemAtURL: NSURL; toURL: NSURL): Boolean; cdecl;
    [MethodName('fileManager:shouldRemoveItemAtPath:')]
    function fileManagerShouldRemoveItemAtPath(fileManager: NSFileManager;
      shouldRemoveItemAtPath: NSString): Boolean; cdecl;
    [MethodName('fileManager:shouldRemoveItemAtURL:')]
    function fileManagerShouldRemoveItemAtURL(fileManager: NSFileManager;
      shouldRemoveItemAtURL: NSURL): Boolean; cdecl;
    [MethodName('fileManager:shouldProceedAfterError:removingItemAtPath:')]
    function fileManagerShouldProceedAfterErrorRemovingItemAtPath
      (fileManager: NSFileManager; shouldProceedAfterError: NSError;
      removingItemAtPath: NSString): Boolean; cdecl;
    [MethodName('fileManager:shouldProceedAfterError:removingItemAtURL:')]
    function fileManagerShouldProceedAfterErrorRemovingItemAtURL
      (fileManager: NSFileManager; shouldProceedAfterError: NSError;
      removingItemAtURL: NSURL): Boolean; cdecl;
  end;

  NSKeyedArchiverDelegate = interface(IObjectiveC)
    ['{B6887DDA-811B-42A3-B02E-53E23ABF78BA}']
    [MethodName('archiver:willEncodeObject:')]
    function archiverWillEncodeObject(archiver: NSKeyedArchiver;
      willEncodeObject: Pointer): Pointer; cdecl;
    [MethodName('archiver:didEncodeObject:')]
    procedure archiverDidEncodeObject(archiver: NSKeyedArchiver;
      didEncodeObject: Pointer); cdecl;
    [MethodName('archiver:willReplaceObject:withObject:')]
    procedure archiverWillReplaceObjectWithObject(archiver: NSKeyedArchiver;
      willReplaceObject: Pointer; withObject: Pointer); cdecl;
    procedure archiverWillFinish(archiver: NSKeyedArchiver); cdecl;
    procedure archiverDidFinish(archiver: NSKeyedArchiver); cdecl;
  end;

  NSKeyedUnarchiverDelegate = interface(IObjectiveC)
    ['{2F85DFAA-E8B6-4253-948E-B66E753F4BC2}']
    [MethodName('unarchiver:cannotDecodeObjectOfClassName:originalClasses:')]
    function unarchiverCannotDecodeObjectOfClassNameOriginalClasses
      (unarchiver: NSKeyedUnarchiver; cannotDecodeObjectOfClassName: NSString;
      originalClasses: NSArray): Pointer; cdecl;
    [MethodName('unarchiver:didDecodeObject:')]
    function unarchiverDidDecodeObject(unarchiver: NSKeyedUnarchiver;
      didDecodeObject: Pointer): Pointer; cdecl;
    [MethodName('unarchiver:willReplaceObject:withObject:')]
    procedure unarchiverWillReplaceObjectWithObject
      (unarchiver: NSKeyedUnarchiver; willReplaceObject: Pointer;
      withObject: Pointer); cdecl;
    procedure unarchiverWillFinish(unarchiver: NSKeyedUnarchiver); cdecl;
    procedure unarchiverDidFinish(unarchiver: NSKeyedUnarchiver); cdecl;
  end;

  NSLocking = interface(IObjectiveC)
    ['{0F48651A-DBEE-4D9C-96B3-9718A11F96F4}']
    procedure lock; cdecl;
    procedure unlock; cdecl;
  end;

  NSPortDelegate = interface(IObjectiveC)
    ['{18D4A0FF-3FC3-4027-BA9C-4895EDF41772}']
    procedure handlePortMessage(message: NSPortMessage); cdecl;
  end;

  NSMachPortDelegate = interface(IObjectiveC)
    ['{AF040FB7-603C-427F-96DB-24F6245AAB56}']
    procedure handleMachMessage(msg: Pointer); cdecl;
  end;

  NSStreamDelegate = interface(IObjectiveC)
    ['{8ABF66B9-32F5-4DA6-98EC-CADC64752D96}']
    procedure stream(aStream: NSStream; handleEvent: NSStreamEvent); cdecl;
  end;

  NSURLAuthenticationChallengeSender = interface(IObjectiveC)
    ['{946FA2FF-CCC0-4CB5-AF8D-3CD3507E3369}']
    procedure useCredential(credential: NSURLCredential;
      forAuthenticationChallenge: NSURLAuthenticationChallenge); cdecl;
    procedure continueWithoutCredentialForAuthenticationChallenge
      (challenge: NSURLAuthenticationChallenge); cdecl;
    procedure cancelAuthenticationChallenge
      (challenge: NSURLAuthenticationChallenge); cdecl;
    procedure performDefaultHandlingForAuthenticationChallenge
      (challenge: NSURLAuthenticationChallenge); cdecl;
    procedure rejectProtectionSpaceAndContinueWithChallenge
      (challenge: NSURLAuthenticationChallenge); cdecl;
  end;

  NSURLConnectionDelegate = interface(IObjectiveC)
    ['{E7C6BC1F-9FC4-400A-895D-8757EF6C181A}']
    [MethodName('connection:didFailWithError:')]
    procedure connectionDidFailWithError(connection: NSURLConnection;
      didFailWithError: NSError); cdecl;
    function connectionShouldUseCredentialStorage(connection: NSURLConnection)
      : Boolean; cdecl;
    [MethodName('connection:willSendRequestForAuthenticationChallenge:')]
    procedure connectionWillSendRequestForAuthenticationChallenge
      (connection: NSURLConnection; willSendRequestForAuthenticationChallenge
      : NSURLAuthenticationChallenge); cdecl;
    [MethodName('connection:canAuthenticateAgainstProtectionSpace:')]
    function connectionCanAuthenticateAgainstProtectionSpace
      (connection: NSURLConnection; canAuthenticateAgainstProtectionSpace
      : NSURLProtectionSpace): Boolean; cdecl;
    [MethodName('connection:didReceiveAuthenticationChallenge:')]
    procedure connectionDidReceiveAuthenticationChallenge
      (connection: NSURLConnection;
      didReceiveAuthenticationChallenge: NSURLAuthenticationChallenge); cdecl;
    [MethodName('connection:didCancelAuthenticationChallenge:')]
    procedure connectionDidCancelAuthenticationChallenge
      (connection: NSURLConnection;
      didCancelAuthenticationChallenge: NSURLAuthenticationChallenge); cdecl;
  end;

  NSURLConnectionDataDelegate = interface(IObjectiveC)
    ['{E848D428-44EA-44A8-95BE-D8AC20572BE9}']
    [MethodName('connection:willSendRequest:redirectResponse:')]
    function connectionWillSendRequestRedirectResponse
      (connection: NSURLConnection; willSendRequest: NSURLRequest;
      redirectResponse: NSURLResponse): NSURLRequest; cdecl;
    [MethodName('connection:didReceiveResponse:')]
    procedure connectionDidReceiveResponse(connection: NSURLConnection;
      didReceiveResponse: NSURLResponse); cdecl;
    [MethodName('connection:didReceiveData:')]
    procedure connectionDidReceiveData(connection: NSURLConnection;
      didReceiveData: NSData); cdecl;
    [MethodName('connection:needNewBodyStream:')]
    function connectionNeedNewBodyStream(connection: NSURLConnection;
      needNewBodyStream: NSURLRequest): NSInputStream; cdecl;
    [MethodName
      ('connection:didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:')
      ]
    procedure connectionDidSendBodyDataTotalBytesWrittenTotalBytesExpectedToWrite
      (connection: NSURLConnection; didSendBodyData: NSInteger;
      totalBytesWritten: NSInteger;
      totalBytesExpectedToWrite: NSInteger); cdecl;
    [MethodName('connection:willCacheResponse:')]
    function connectionWillCacheResponse(connection: NSURLConnection;
      willCacheResponse: NSCachedURLResponse): NSCachedURLResponse; cdecl;
    procedure connectionDidFinishLoading(connection: NSURLConnection); cdecl;
  end;

  NSURLConnectionDownloadDelegate = interface(IObjectiveC)
    ['{DB73534C-FAA9-456A-A079-69CFDCCFC309}']
    procedure connection(connection: NSURLConnection; didWriteData: Int64;
      totalBytesWritten: Int64; expectedTotalBytes: Int64); cdecl;
    procedure connectionDidResumeDownloading(connection: NSURLConnection;
      totalBytesWritten: Int64; expectedTotalBytes: Int64); cdecl;
    procedure connectionDidFinishDownloading(connection: NSURLConnection;
      destinationURL: NSURL); cdecl;
  end;

  NSURLProtocolClient = interface(IObjectiveC)
    ['{A48B5ACD-FB24-4FE4-8287-188990494475}']
    [MethodName('URLProtocol:wasRedirectedToRequest:redirectResponse:')]
    procedure URLProtocolWasRedirectedToRequestRedirectResponse
      (protocol: NSURLProtocol; wasRedirectedToRequest: NSURLRequest;
      redirectResponse: NSURLResponse); cdecl;
    [MethodName('URLProtocol:cachedResponseIsValid:')]
    procedure URLProtocolCachedResponseIsValid(protocol: NSURLProtocol;
      cachedResponseIsValid: NSCachedURLResponse); cdecl;
    [MethodName('URLProtocol:didReceiveResponse:cacheStoragePolicy:')]
    procedure URLProtocolDidReceiveResponseCacheStoragePolicy
      (protocol: NSURLProtocol; didReceiveResponse: NSURLResponse;
      cacheStoragePolicy: NSURLCacheStoragePolicy); cdecl;
    [MethodName('URLProtocol:didLoadData:')]
    procedure URLProtocolDidLoadData(protocol: NSURLProtocol;
      didLoadData: NSData); cdecl;
    procedure URLProtocolDidFinishLoading(protocol: NSURLProtocol); cdecl;
    [MethodName('URLProtocol:didFailWithError:')]
    procedure URLProtocolDidFailWithError(protocol: NSURLProtocol;
      didFailWithError: NSError); cdecl;
    [MethodName('URLProtocol:didReceiveAuthenticationChallenge:')]
    procedure URLProtocolDidReceiveAuthenticationChallenge
      (protocol: NSURLProtocol; didReceiveAuthenticationChallenge
      : NSURLAuthenticationChallenge); cdecl;
    [MethodName('URLProtocol:didCancelAuthenticationChallenge:')]
    procedure URLProtocolDidCancelAuthenticationChallenge
      (protocol: NSURLProtocol; didCancelAuthenticationChallenge
      : NSURLAuthenticationChallenge); cdecl;
  end;

  NSXMLParserDelegate = interface(IObjectiveC)
    ['{4291C8F0-B213-42D1-96C0-096D8B408C77}']
    procedure parserDidStartDocument(parser: NSXMLParser); cdecl;
    procedure parserDidEndDocument(parser: NSXMLParser); cdecl;
    [MethodName('parser:foundNotationDeclarationWithName:publicID:systemID:')]
    procedure parserFoundNotationDeclarationWithNamePublicIDSystemID
      (parser: NSXMLParser; foundNotationDeclarationWithName: NSString;
      publicID: NSString; systemID: NSString); cdecl;
    [MethodName
      ('parser:foundUnparsedEntityDeclarationWithName:publicID:systemID:notationName:')
      ]
    procedure parserFoundUnparsedEntityDeclarationWithNamePublicIDSystemIDNotationName
      (parser: NSXMLParser; foundUnparsedEntityDeclarationWithName: NSString;
      publicID: NSString; systemID: NSString; notationName: NSString); cdecl;
    [MethodName
      ('parser:foundAttributeDeclarationWithName:forElement:type:defaultValue:')
      ]
    procedure parserFoundAttributeDeclarationWithNameForElementTypeDefaultValue
      (parser: NSXMLParser; foundAttributeDeclarationWithName: NSString;
      forElement: NSString; &type: NSString; defaultValue: NSString); cdecl;
    [MethodName('parser:foundElementDeclarationWithName:model:')]
    procedure parserFoundElementDeclarationWithNameModel(parser: NSXMLParser;
      foundElementDeclarationWithName: NSString; model: NSString); cdecl;
    [MethodName('parser:foundInternalEntityDeclarationWithName:value:')]
    procedure parserFoundInternalEntityDeclarationWithNameValue
      (parser: NSXMLParser; foundInternalEntityDeclarationWithName: NSString;
      value: NSString); cdecl;
    [MethodName
      ('parser:foundExternalEntityDeclarationWithName:publicID:systemID:')]
    procedure parserFoundExternalEntityDeclarationWithNamePublicIDSystemID
      (parser: NSXMLParser; foundExternalEntityDeclarationWithName: NSString;
      publicID: NSString; systemID: NSString); cdecl;
    [MethodName
      ('parser:didStartElement:namespaceURI:qualifiedName:attributes:')]
    procedure parserDidStartElementNamespaceURIQualifiedNameAttributes
      (parser: NSXMLParser; didStartElement: NSString; namespaceURI: NSString;
      qualifiedName: NSString; attributes: NSDictionary); cdecl;
    [MethodName('parser:didEndElement:namespaceURI:qualifiedName:')]
    procedure parserDidEndElementNamespaceURIQualifiedName(parser: NSXMLParser;
      didEndElement: NSString; namespaceURI: NSString;
      qualifiedName: NSString); cdecl;
    [MethodName('parser:didStartMappingPrefix:toURI:')]
    procedure parserDidStartMappingPrefixToURI(parser: NSXMLParser;
      didStartMappingPrefix: NSString; toURI: NSString); cdecl;
    [MethodName('parser:didEndMappingPrefix:')]
    procedure parserDidEndMappingPrefix(parser: NSXMLParser;
      didEndMappingPrefix: NSString); cdecl;
    [MethodName('parser:foundCharacters:')]
    procedure parserFoundCharacters(parser: NSXMLParser;
      foundCharacters: NSString); cdecl;
    [MethodName('parser:foundIgnorableWhitespace:')]
    procedure parserFoundIgnorableWhitespace(parser: NSXMLParser;
      foundIgnorableWhitespace: NSString); cdecl;
    [MethodName('parser:foundProcessingInstructionWithTarget:data:')]
    procedure parserFoundProcessingInstructionWithTargetData
      (parser: NSXMLParser; foundProcessingInstructionWithTarget: NSString;
      data: NSString); cdecl;
    [MethodName('parser:foundComment:')]
    procedure parserFoundComment(parser: NSXMLParser;
      foundComment: NSString); cdecl;
    [MethodName('parser:foundCDATA:')]
    procedure parserFoundCDATA(parser: NSXMLParser; foundCDATA: NSData); cdecl;
    [MethodName('parser:resolveExternalEntityName:systemID:')]
    function parserResolveExternalEntityNameSystemID(parser: NSXMLParser;
      resolveExternalEntityName: NSString; systemID: NSString): NSData; cdecl;
    [MethodName('parser:parseErrorOccurred:')]
    procedure parserParseErrorOccurred(parser: NSXMLParser;
      parseErrorOccurred: NSError); cdecl;
    [MethodName('parser:validationErrorOccurred:')]
    procedure parserValidationErrorOccurred(parser: NSXMLParser;
      validationErrorOccurred: NSError); cdecl;
  end;

  NSXPCListenerDelegate = interface(IObjectiveC)
    ['{B4CD0A7F-2983-48D5-B366-950AE1BF8ECA}']
    function listener(listener: NSXPCListener;
      shouldAcceptNewConnection: NSXPCConnection): Boolean; cdecl;
  end;

  NSXPCProxyCreating = interface(IObjectiveC)
    ['{B8B26774-3331-4E70-9A09-A08B9F69F621}']
    function remoteObjectProxy: Pointer; cdecl;
    function remoteObjectProxyWithErrorHandler
      (handler: TFoundationCompletionHandler1): Pointer; cdecl;
    function synchronousRemoteObjectProxyWithErrorHandler
      (handler: TFoundationCompletionHandler1): Pointer; cdecl;
  end;

  NSCacheDelegate = interface(IObjectiveC)
    ['{50534CD1-4E49-40CD-A516-9DB11C02B5DD}']
    procedure cache(cache: NSCache; willEvictObject: Pointer); cdecl;
  end;

  NSExtensionRequestHandling = interface(IObjectiveC)
    ['{67C2A1C0-3E65-4568-86C5-3432EDF923D9}']
    procedure beginRequestWithExtensionContext
      (context: NSExtensionContext); cdecl;
  end;

  NSFilePresenter = interface(IObjectiveC)
    ['{EE835C07-260D-4B7A-B317-8571C73F7FC4}']
    function presentedItemURL: NSURL; cdecl;
    function presentedItemOperationQueue: NSOperationQueue; cdecl;
    function primaryPresentedItemURL: NSURL; cdecl;
    procedure relinquishPresentedItemToReader
      (reader: TFoundationByAccessor2); cdecl;
    procedure relinquishPresentedItemToWriter
      (writer: TFoundationByAccessor2); cdecl;
    procedure savePresentedItemChangesWithCompletionHandler(completionHandler
      : TFoundationCompletionHandler1); cdecl;
    procedure accommodatePresentedItemDeletionWithCompletionHandler
      (completionHandler: TFoundationCompletionHandler1); cdecl;
    procedure presentedItemDidMoveToURL(newURL: NSURL); cdecl;
    procedure presentedItemDidChange; cdecl;
    procedure presentedItemDidChangeUbiquityAttributes
      (attributes: NSSet); cdecl;
    function observedPresentedItemUbiquityAttributes: NSSet; cdecl;
    procedure presentedItemDidGainVersion(version: NSFileVersion); cdecl;
    procedure presentedItemDidLoseVersion(version: NSFileVersion); cdecl;
    procedure presentedItemDidResolveConflictVersion
      (version: NSFileVersion); cdecl;
    procedure accommodatePresentedSubitemDeletionAtURL(url: NSURL;
      completionHandler: TFoundationCompletionHandler1); cdecl;
    procedure presentedSubitemDidAppearAtURL(url: NSURL); cdecl;
    [MethodName('presentedSubitemAtURL:didMoveToURL:')]
    procedure presentedSubitemAtURLDidMoveToURL(oldURL: NSURL;
      didMoveToURL: NSURL); cdecl;
    procedure presentedSubitemDidChangeAtURL(url: NSURL); cdecl;
    [MethodName('presentedSubitemAtURL:didGainVersion:')]
    procedure presentedSubitemAtURLDidGainVersion(url: NSURL;
      didGainVersion: NSFileVersion); cdecl;
    [MethodName('presentedSubitemAtURL:didLoseVersion:')]
    procedure presentedSubitemAtURLDidLoseVersion(url: NSURL;
      didLoseVersion: NSFileVersion); cdecl;
    [MethodName('presentedSubitemAtURL:didResolveConflictVersion:')]
    procedure presentedSubitemAtURLDidResolveConflictVersion(url: NSURL;
      didResolveConflictVersion: NSFileVersion); cdecl;
  end;

  NSMetadataQueryDelegate = interface(IObjectiveC)
    ['{21B08CF9-D298-41B8-922F-A9DBC34D8835}']
    [MethodName('metadataQuery:replacementObjectForResultObject:')]
    function metadataQueryReplacementObjectForResultObject
      (query: NSMetadataQuery; replacementObjectForResultObject: NSMetadataItem)
      : Pointer; cdecl;
    [MethodName('metadataQuery:replacementValueForAttribute:value:')]
    function metadataQueryReplacementValueForAttributeValue
      (query: NSMetadataQuery; replacementValueForAttribute: NSString;
      value: Pointer): Pointer; cdecl;
  end;

  NSNetServiceDelegate = interface(IObjectiveC)
    ['{A8405FE2-733A-4D2D-BD64-F9F818A395CA}']
    procedure netServiceWillPublish(sender: NSNetService); cdecl;
    procedure netServiceDidPublish(sender: NSNetService); cdecl;
    [MethodName('netService:didNotPublish:')]
    procedure netServiceDidNotPublish(sender: NSNetService;
      didNotPublish: NSDictionary); cdecl;
    procedure netServiceWillResolve(sender: NSNetService); cdecl;
    procedure netServiceDidResolveAddress(sender: NSNetService); cdecl;
    [MethodName('netService:didNotResolve:')]
    procedure netServiceDidNotResolve(sender: NSNetService;
      didNotResolve: NSDictionary); cdecl;
    procedure netServiceDidStop(sender: NSNetService); cdecl;
    [MethodName('netService:didUpdateTXTRecordData:')]
    procedure netServiceDidUpdateTXTRecordData(sender: NSNetService;
      didUpdateTXTRecordData: NSData); cdecl;
    [MethodName('netService:didAcceptConnectionWithInputStream:outputStream:')]
    procedure netServiceDidAcceptConnectionWithInputStreamOutputStream
      (sender: NSNetService; didAcceptConnectionWithInputStream: NSInputStream;
      outputStream: NSOutputStream); cdecl;
  end;

  NSNetServiceBrowserDelegate = interface(IObjectiveC)
    ['{BF124476-AF5A-4BF9-B434-D7C7E8EB2CB7}']
    procedure netServiceBrowserWillSearch(browser: NSNetServiceBrowser); cdecl;
    procedure netServiceBrowserDidStopSearch
      (browser: NSNetServiceBrowser); cdecl;
    [MethodName('netServiceBrowser:didNotSearch:')]
    procedure netServiceBrowserDidNotSearch(browser: NSNetServiceBrowser;
      didNotSearch: NSDictionary); cdecl;
    [MethodName('netServiceBrowser:didFindDomain:moreComing:')]
    procedure netServiceBrowserDidFindDomainMoreComing
      (browser: NSNetServiceBrowser; didFindDomain: NSString;
      moreComing: Boolean); cdecl;
    [MethodName('netServiceBrowser:didFindService:moreComing:')]
    procedure netServiceBrowserDidFindServiceMoreComing
      (browser: NSNetServiceBrowser; didFindService: NSNetService;
      moreComing: Boolean); cdecl;
    [MethodName('netServiceBrowser:didRemoveDomain:moreComing:')]
    procedure netServiceBrowserDidRemoveDomainMoreComing
      (browser: NSNetServiceBrowser; didRemoveDomain: NSString;
      moreComing: Boolean); cdecl;
    [MethodName('netServiceBrowser:didRemoveService:moreComing:')]
    procedure netServiceBrowserDidRemoveServiceMoreComing
      (browser: NSNetServiceBrowser; didRemoveService: NSNetService;
      moreComing: Boolean); cdecl;
  end;

  NSURLSessionDelegate = interface(IObjectiveC)
    ['{9F23842F-4A6F-4048-9333-52357378B9D0}']
    [MethodName('URLSession:didBecomeInvalidWithError:')]
    procedure URLSessionDidBecomeInvalidWithError(session: NSURLSession;
      didBecomeInvalidWithError: NSError); cdecl;
    [MethodName('URLSession:didReceiveChallenge:completionHandler:')]
    procedure URLSessionDidReceiveChallengeCompletionHandler
      (session: NSURLSession; didReceiveChallenge: NSURLAuthenticationChallenge;
      completionHandler: TFoundationCompletionHandler16); cdecl;
    procedure URLSessionDidFinishEventsForBackgroundURLSession
      (session: NSURLSession); cdecl;
  end;

  NSURLSessionTaskDelegate = interface(IObjectiveC)
    ['{2845A9D4-360A-4A40-AC40-04137F8A4364}']
    [MethodName('URLSession:didCreateTask:')]
    procedure URLSessionDidCreateTask(session: NSURLSession;
      didCreateTask: NSURLSessionTask); cdecl;
    [MethodName('URLSession:task:willBeginDelayedRequest:completionHandler:')]
    procedure URLSessionTaskWillBeginDelayedRequestCompletionHandler
      (session: NSURLSession; task: NSURLSessionTask;
      willBeginDelayedRequest: NSURLRequest;
      completionHandler: TFoundationCompletionHandler17); cdecl;
    [MethodName('URLSession:taskIsWaitingForConnectivity:')]
    procedure URLSessionTaskIsWaitingForConnectivity(session: NSURLSession;
      taskIsWaitingForConnectivity: NSURLSessionTask); cdecl;
    [MethodName
      ('URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:')
      ]
    procedure URLSessionTaskWillPerformHTTPRedirectionNewRequestCompletionHandler
      (session: NSURLSession; task: NSURLSessionTask;
      willPerformHTTPRedirection: NSHTTPURLResponse; newRequest: NSURLRequest;
      completionHandler: TFoundationCompletionHandler18); cdecl;
    [MethodName('URLSession:task:didReceiveChallenge:completionHandler:')]
    procedure URLSessionTaskDidReceiveChallengeCompletionHandler
      (session: NSURLSession; task: NSURLSessionTask;
      didReceiveChallenge: NSURLAuthenticationChallenge;
      completionHandler: TFoundationCompletionHandler16); cdecl;
    [MethodName('URLSession:task:needNewBodyStream:')]
    procedure URLSessionTaskNeedNewBodyStream(session: NSURLSession;
      task: NSURLSessionTask;
      needNewBodyStream: TFoundationNeedNewBodyStream); cdecl;
    [MethodName
      ('URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:')
      ]
    procedure URLSessionTaskDidSendBodyDataTotalBytesSentTotalBytesExpectedToSend
      (session: NSURLSession; task: NSURLSessionTask; didSendBodyData: Int64;
      totalBytesSent: Int64; totalBytesExpectedToSend: Int64); cdecl;
    [MethodName('URLSession:task:didFinishCollectingMetrics:')]
    procedure URLSessionTaskDidFinishCollectingMetrics(session: NSURLSession;
      task: NSURLSessionTask;
      didFinishCollectingMetrics: NSURLSessionTaskMetrics); cdecl;
    [MethodName('URLSession:task:didCompleteWithError:')]
    procedure URLSessionTaskDidCompleteWithError(session: NSURLSession;
      task: NSURLSessionTask; didCompleteWithError: NSError); cdecl;
  end;

  NSURLSessionDataDelegate = interface(IObjectiveC)
    ['{03F20F0C-0FFB-4789-ADB8-589CEE111D09}']
    [MethodName('URLSession:dataTask:didReceiveResponse:completionHandler:')]
    procedure URLSessionDataTaskDidReceiveResponseCompletionHandler
      (session: NSURLSession; dataTask: NSURLSessionDataTask;
      didReceiveResponse: NSURLResponse;
      completionHandler: TFoundationCompletionHandler19); cdecl;
    [MethodName('URLSession:dataTask:didBecomeDownloadTask:')]
    procedure URLSessionDataTaskDidBecomeDownloadTask(session: NSURLSession;
      dataTask: NSURLSessionDataTask;
      didBecomeDownloadTask: NSURLSessionDownloadTask); cdecl;
    [MethodName('URLSession:dataTask:didBecomeStreamTask:')]
    procedure URLSessionDataTaskDidBecomeStreamTask(session: NSURLSession;
      dataTask: NSURLSessionDataTask;
      didBecomeStreamTask: NSURLSessionStreamTask); cdecl;
    [MethodName('URLSession:dataTask:didReceiveData:')]
    procedure URLSessionDataTaskDidReceiveData(session: NSURLSession;
      dataTask: NSURLSessionDataTask; didReceiveData: NSData); cdecl;
    [MethodName('URLSession:dataTask:willCacheResponse:completionHandler:')]
    procedure URLSessionDataTaskWillCacheResponseCompletionHandler
      (session: NSURLSession; dataTask: NSURLSessionDataTask;
      willCacheResponse: NSCachedURLResponse;
      completionHandler: TFoundationCompletionHandler6); cdecl;
  end;

  NSURLSessionDownloadDelegate = interface(IObjectiveC)
    ['{1D47B7AD-A35D-43D0-B9F5-DCBB71414ACF}']
    [MethodName('URLSession:downloadTask:didFinishDownloadingToURL:')]
    procedure URLSessionDownloadTaskDidFinishDownloadingToURL
      (session: NSURLSession; downloadTask: NSURLSessionDownloadTask;
      didFinishDownloadingToURL: NSURL); cdecl;
    [MethodName
      ('URLSession:downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:')
      ]
    procedure URLSessionDownloadTaskDidWriteDataTotalBytesWrittenTotalBytesExpectedToWrite
      (session: NSURLSession; downloadTask: NSURLSessionDownloadTask;
      didWriteData: Int64; totalBytesWritten: Int64;
      totalBytesExpectedToWrite: Int64); cdecl;
    [MethodName
      ('URLSession:downloadTask:didResumeAtOffset:expectedTotalBytes:')]
    procedure URLSessionDownloadTaskDidResumeAtOffsetExpectedTotalBytes
      (session: NSURLSession; downloadTask: NSURLSessionDownloadTask;
      didResumeAtOffset: Int64; expectedTotalBytes: Int64); cdecl;
  end;

  NSURLSessionStreamDelegate = interface(IObjectiveC)
    ['{FC96C321-4DBA-49C1-B823-8A1BC410C386}']
    [MethodName('URLSession:readClosedForStreamTask:')]
    procedure URLSessionReadClosedForStreamTask(session: NSURLSession;
      readClosedForStreamTask: NSURLSessionStreamTask); cdecl;
    [MethodName('URLSession:writeClosedForStreamTask:')]
    procedure URLSessionWriteClosedForStreamTask(session: NSURLSession;
      writeClosedForStreamTask: NSURLSessionStreamTask); cdecl;
    [MethodName('URLSession:betterRouteDiscoveredForStreamTask:')]
    procedure URLSessionBetterRouteDiscoveredForStreamTask
      (session: NSURLSession; betterRouteDiscoveredForStreamTask
      : NSURLSessionStreamTask); cdecl;
    [MethodName('URLSession:streamTask:didBecomeInputStream:outputStream:')]
    procedure URLSessionStreamTaskDidBecomeInputStreamOutputStream
      (session: NSURLSession; streamTask: NSURLSessionStreamTask;
      didBecomeInputStream: NSInputStream; outputStream: NSOutputStream); cdecl;
  end;

  NSURLSessionWebSocketDelegate = interface(IObjectiveC)
    ['{083F70A3-A766-4FC6-8F3A-29B0D4FB2C33}']
    [MethodName('URLSession:webSocketTask:didOpenWithProtocol:')]
    procedure URLSessionWebSocketTaskDidOpenWithProtocol(session: NSURLSession;
      webSocketTask: NSURLSessionWebSocketTask;
      didOpenWithProtocol: NSString); cdecl;
    [MethodName('URLSession:webSocketTask:didCloseWithCode:reason:')]
    procedure URLSessionWebSocketTaskDidCloseWithCodeReason
      (session: NSURLSession; webSocketTask: NSURLSessionWebSocketTask;
      didCloseWithCode: NSURLSessionWebSocketCloseCode; reason: NSData); cdecl;
  end;

  NSUserActivityDelegate = interface(IObjectiveC)
    ['{EAF1AD27-0D79-4D67-A4C0-B57DB68E03E1}']
    procedure userActivityWillSave(userActivity: NSUserActivity); cdecl;
    procedure userActivityWasContinued(userActivity: NSUserActivity); cdecl;
    procedure userActivity(userActivity: NSUserActivity;
      didReceiveInputStream: NSInputStream;
      outputStream: NSOutputStream); cdecl;
  end;

  // ===== Exported string consts =====

function NSFoundationVersionNumber: Pointer;
function NSItemProviderPreferredImageSizeKey: NSString;
function NSExtensionJavaScriptPreprocessingResultsKey: NSString;
function NSExtensionJavaScriptFinalizeArgumentKey: NSString;
function NSItemProviderErrorDomain: NSString;
function NSStringTransformLatinToKatakana: Pointer;
function NSStringTransformLatinToHiragana: Pointer;
function NSStringTransformLatinToHangul: Pointer;
function NSStringTransformLatinToArabic: Pointer;
function NSStringTransformLatinToHebrew: Pointer;
function NSStringTransformLatinToThai: Pointer;
function NSStringTransformLatinToCyrillic: Pointer;
function NSStringTransformLatinToGreek: Pointer;
function NSStringTransformToLatin: Pointer;
function NSStringTransformMandarinToLatin: Pointer;
function NSStringTransformHiraganaToKatakana: Pointer;
function NSStringTransformFullwidthToHalfwidth: Pointer;
function NSStringTransformToXMLHex: Pointer;
function NSStringTransformToUnicodeName: Pointer;
function NSStringTransformStripCombiningMarks: Pointer;
function NSStringTransformStripDiacritics: Pointer;
function NSStringEncodingDetectionSuggestedEncodingsKey: Pointer;
function NSStringEncodingDetectionDisallowedEncodingsKey: Pointer;
function NSStringEncodingDetectionUseOnlySuggestedEncodingsKey: Pointer;
function NSStringEncodingDetectionAllowLossyKey: Pointer;
function NSStringEncodingDetectionFromWindowsKey: Pointer;
function NSStringEncodingDetectionLossySubstitutionKey: Pointer;
function NSStringEncodingDetectionLikelyLanguageKey: Pointer;
function NSCharacterConversionException: Pointer;
function NSParseErrorException: Pointer;
function NSProgressEstimatedTimeRemainingKey: Pointer;
function NSProgressThroughputKey: Pointer;
function NSProgressKindFile: Pointer;
function NSProgressFileOperationKindKey: Pointer;
function NSProgressFileOperationKindDownloading: Pointer;
function NSProgressFileOperationKindDecompressingAfterDownloading: Pointer;
function NSProgressFileOperationKindReceiving: Pointer;
function NSProgressFileOperationKindCopying: Pointer;
function NSProgressFileOperationKindUploading: Pointer;
function NSProgressFileOperationKindDuplicating: Pointer;
function NSProgressFileURLKey: Pointer;
function NSProgressFileTotalCountKey: Pointer;
function NSProgressFileCompletedCountKey: Pointer;
function NSProgressFileAnimationImageKey: Pointer;
function NSProgressFileAnimationImageOriginalRectKey: Pointer;
function NSProgressFileIconKey: Pointer;
function NSBundleDidLoadNotification: Pointer;
function NSLoadedClasses: NSString;
function NSBundleResourceRequestLowDiskSpaceNotification: Pointer;
function NSBundleResourceRequestLoadingPriorityUrgent: Pointer;
function NSSystemClockDidChangeNotification: Pointer;
function NSCalendarIdentifierGregorian: Pointer;
function NSCalendarIdentifierBuddhist: Pointer;
function NSCalendarIdentifierChinese: Pointer;
function NSCalendarIdentifierCoptic: Pointer;
function NSCalendarIdentifierEthiopicAmeteMihret: Pointer;
function NSCalendarIdentifierEthiopicAmeteAlem: Pointer;
function NSCalendarIdentifierHebrew: Pointer;
function NSCalendarIdentifierISO8601: Pointer;
function NSCalendarIdentifierIndian: Pointer;
function NSCalendarIdentifierIslamic: Pointer;
function NSCalendarIdentifierIslamicCivil: Pointer;
function NSCalendarIdentifierJapanese: Pointer;
function NSCalendarIdentifierPersian: Pointer;
function NSCalendarIdentifierRepublicOfChina: Pointer;
function NSCalendarIdentifierIslamicTabular: Pointer;
function NSCalendarIdentifierIslamicUmmAlQura: Pointer;
function NSCalendarDayChangedNotification: Pointer;
function NSInlinePresentationIntentAttributeName: Pointer;
function NSAlternateDescriptionAttributeName: Pointer;
function NSImageURLAttributeName: Pointer;
function NSLanguageIdentifierAttributeName: Pointer;
function NSMarkdownSourcePositionAttributeName: Pointer;
function NSReplacementIndexAttributeName: Pointer;
function NSMorphologyAttributeName: Pointer;
function NSInflectionRuleAttributeName: Pointer;
function NSInflectionAlternativeAttributeName: Pointer;
function NSPresentationIntentAttributeName: Pointer;
function NSCurrentLocaleDidChangeNotification: Pointer;
function NSLocaleIdentifier: Pointer;
function NSLocaleLanguageCode: Pointer;
function NSLocaleCountryCode: Pointer;
function NSLocaleScriptCode: Pointer;
function NSLocaleVariantCode: Pointer;
function NSLocaleExemplarCharacterSet: Pointer;
function NSLocaleCalendar: Pointer;
function NSLocaleCollationIdentifier: Pointer;
function NSLocaleUsesMetricSystem: Pointer;
function NSLocaleMeasurementSystem: Pointer;
function NSLocaleDecimalSeparator: Pointer;
function NSLocaleGroupingSeparator: Pointer;
function NSLocaleCurrencySymbol: Pointer;
function NSLocaleCurrencyCode: Pointer;
function NSLocaleCollatorIdentifier: Pointer;
function NSLocaleQuotationBeginDelimiterKey: Pointer;
function NSLocaleQuotationEndDelimiterKey: Pointer;
function NSLocaleAlternateQuotationBeginDelimiterKey: Pointer;
function NSLocaleAlternateQuotationEndDelimiterKey: Pointer;
function NSGregorianCalendar: NSString;
function NSBuddhistCalendar: NSString;
function NSChineseCalendar: NSString;
function NSHebrewCalendar: NSString;
function NSIslamicCalendar: NSString;
function NSIslamicCivilCalendar: NSString;
function NSJapaneseCalendar: NSString;
function NSRepublicOfChinaCalendar: NSString;
function NSPersianCalendar: NSString;
function NSIndianCalendar: NSString;
function NSISO8601Calendar: NSString;
function NSPersonNameComponentKey: NSString;
function NSPersonNameComponentGivenName: NSString;
function NSPersonNameComponentFamilyName: NSString;
function NSPersonNameComponentMiddleName: NSString;
function NSPersonNameComponentPrefix: NSString;
function NSPersonNameComponentSuffix: NSString;
function NSPersonNameComponentNickname: NSString;
function NSPersonNameComponentDelimiter: NSString;
function NSGenericException: Pointer;
function NSRangeException: Pointer;
function NSInvalidArgumentException: Pointer;
function NSInternalInconsistencyException: Pointer;
function NSMallocException: Pointer;
function NSObjectInaccessibleException: Pointer;
function NSObjectNotAvailableException: Pointer;
function NSDestinationInvalidException: Pointer;
function NSPortTimeoutException: Pointer;
function NSInvalidSendPortException: Pointer;
function NSInvalidReceivePortException: Pointer;
function NSPortSendException: Pointer;
function NSPortReceiveException: Pointer;
function NSOldStyleException: Pointer;
function NSInconsistentArchiveException: Pointer;
function NSAssertionHandlerKey: NSString;
function NSDecimalNumberExactnessException: Pointer;
function NSDecimalNumberOverflowException: Pointer;
function NSDecimalNumberUnderflowException: Pointer;
function NSDecimalNumberDivideByZeroException: Pointer;
function NSCocoaErrorDomain: Pointer;
function NSPOSIXErrorDomain: Pointer;
function NSOSStatusErrorDomain: Pointer;
function NSMachErrorDomain: Pointer;
function NSUnderlyingErrorKey: Pointer;
function NSMultipleUnderlyingErrorsKey: Pointer;
function NSLocalizedDescriptionKey: Pointer;
function NSLocalizedFailureReasonErrorKey: Pointer;
function NSLocalizedRecoverySuggestionErrorKey: Pointer;
function NSLocalizedRecoveryOptionsErrorKey: Pointer;
function NSRecoveryAttempterErrorKey: Pointer;
function NSHelpAnchorErrorKey: Pointer;
function NSDebugDescriptionErrorKey: Pointer;
function NSLocalizedFailureErrorKey: Pointer;
function NSStringEncodingErrorKey: Pointer;
function NSURLErrorKey: Pointer;
function NSFilePathErrorKey: Pointer;
function NSDefaultRunLoopMode: Pointer;
function NSRunLoopCommonModes: Pointer;
function NSFileHandleOperationException: Pointer;
function NSFileHandleReadCompletionNotification: Pointer;
function NSFileHandleReadToEndOfFileCompletionNotification: Pointer;
function NSFileHandleConnectionAcceptedNotification: Pointer;
function NSFileHandleDataAvailableNotification: Pointer;
function NSFileHandleNotificationDataItem: NSString;
function NSFileHandleNotificationFileHandleItem: NSString;
function NSFileHandleNotificationMonitorModes: NSString;
function NSURLFileScheme: NSString;
function NSURLKeysOfUnsetValuesKey: Pointer;
function NSURLNameKey: Pointer;
function NSURLLocalizedNameKey: Pointer;
function NSURLIsRegularFileKey: Pointer;
function NSURLIsDirectoryKey: Pointer;
function NSURLIsSymbolicLinkKey: Pointer;
function NSURLIsVolumeKey: Pointer;
function NSURLIsPackageKey: Pointer;
function NSURLIsApplicationKey: Pointer;
function NSURLApplicationIsScriptableKey: Pointer;
function NSURLIsSystemImmutableKey: Pointer;
function NSURLIsUserImmutableKey: Pointer;
function NSURLIsHiddenKey: Pointer;
function NSURLHasHiddenExtensionKey: Pointer;
function NSURLCreationDateKey: Pointer;
function NSURLContentAccessDateKey: Pointer;
function NSURLContentModificationDateKey: Pointer;
function NSURLAttributeModificationDateKey: Pointer;
function NSURLLinkCountKey: Pointer;
function NSURLParentDirectoryURLKey: Pointer;
function NSURLVolumeURLKey: Pointer;
function NSURLTypeIdentifierKey: Pointer;
function NSURLContentTypeKey: Pointer;
function NSURLLocalizedTypeDescriptionKey: Pointer;
function NSURLLabelNumberKey: Pointer;
function NSURLLabelColorKey: Pointer;
function NSURLLocalizedLabelKey: Pointer;
function NSURLEffectiveIconKey: Pointer;
function NSURLCustomIconKey: Pointer;
function NSURLFileResourceIdentifierKey: Pointer;
function NSURLVolumeIdentifierKey: Pointer;
function NSURLPreferredIOBlockSizeKey: Pointer;
function NSURLIsReadableKey: Pointer;
function NSURLIsWritableKey: Pointer;
function NSURLIsExecutableKey: Pointer;
function NSURLFileSecurityKey: Pointer;
function NSURLIsExcludedFromBackupKey: Pointer;
function NSURLTagNamesKey: Pointer;
function NSURLPathKey: Pointer;
function NSURLCanonicalPathKey: Pointer;
function NSURLIsMountTriggerKey: Pointer;
function NSURLGenerationIdentifierKey: Pointer;
function NSURLDocumentIdentifierKey: Pointer;
function NSURLAddedToDirectoryDateKey: Pointer;
function NSURLQuarantinePropertiesKey: Pointer;
function NSURLFileResourceTypeKey: Pointer;
function NSURLFileIdentifierKey: Pointer;
function NSURLFileContentIdentifierKey: Pointer;
function NSURLMayShareFileContentKey: Pointer;
function NSURLMayHaveExtendedAttributesKey: Pointer;
function NSURLIsPurgeableKey: Pointer;
function NSURLIsSparseKey: Pointer;
function NSURLFileResourceTypeNamedPipe: Pointer;
function NSURLFileResourceTypeCharacterSpecial: Pointer;
function NSURLFileResourceTypeDirectory: Pointer;
function NSURLFileResourceTypeBlockSpecial: Pointer;
function NSURLFileResourceTypeRegular: Pointer;
function NSURLFileResourceTypeSymbolicLink: Pointer;
function NSURLFileResourceTypeSocket: Pointer;
function NSURLFileResourceTypeUnknown: Pointer;
function NSURLThumbnailDictionaryKey: Pointer;
function NSURLThumbnailKey: Pointer;
function NSThumbnail1024x1024SizeKey: Pointer;
function NSURLFileSizeKey: Pointer;
function NSURLFileAllocatedSizeKey: Pointer;
function NSURLTotalFileSizeKey: Pointer;
function NSURLTotalFileAllocatedSizeKey: Pointer;
function NSURLIsAliasFileKey: Pointer;
function NSURLFileProtectionKey: Pointer;
function NSURLFileProtectionNone: Pointer;
function NSURLFileProtectionComplete: Pointer;
function NSURLFileProtectionCompleteUnlessOpen: Pointer;
function NSURLFileProtectionCompleteUntilFirstUserAuthentication: Pointer;
function NSURLVolumeLocalizedFormatDescriptionKey: Pointer;
function NSURLVolumeTotalCapacityKey: Pointer;
function NSURLVolumeAvailableCapacityKey: Pointer;
function NSURLVolumeResourceCountKey: Pointer;
function NSURLVolumeSupportsPersistentIDsKey: Pointer;
function NSURLVolumeSupportsSymbolicLinksKey: Pointer;
function NSURLVolumeSupportsHardLinksKey: Pointer;
function NSURLVolumeSupportsJournalingKey: Pointer;
function NSURLVolumeIsJournalingKey: Pointer;
function NSURLVolumeSupportsSparseFilesKey: Pointer;
function NSURLVolumeSupportsZeroRunsKey: Pointer;
function NSURLVolumeSupportsCaseSensitiveNamesKey: Pointer;
function NSURLVolumeSupportsCasePreservedNamesKey: Pointer;
function NSURLVolumeSupportsRootDirectoryDatesKey: Pointer;
function NSURLVolumeSupportsVolumeSizesKey: Pointer;
function NSURLVolumeSupportsRenamingKey: Pointer;
function NSURLVolumeSupportsAdvisoryFileLockingKey: Pointer;
function NSURLVolumeSupportsExtendedSecurityKey: Pointer;
function NSURLVolumeIsBrowsableKey: Pointer;
function NSURLVolumeMaximumFileSizeKey: Pointer;
function NSURLVolumeIsEjectableKey: Pointer;
function NSURLVolumeIsRemovableKey: Pointer;
function NSURLVolumeIsInternalKey: Pointer;
function NSURLVolumeIsAutomountedKey: Pointer;
function NSURLVolumeIsLocalKey: Pointer;
function NSURLVolumeIsReadOnlyKey: Pointer;
function NSURLVolumeCreationDateKey: Pointer;
function NSURLVolumeURLForRemountingKey: Pointer;
function NSURLVolumeUUIDStringKey: Pointer;
function NSURLVolumeNameKey: Pointer;
function NSURLVolumeLocalizedNameKey: Pointer;
function NSURLVolumeIsEncryptedKey: Pointer;
function NSURLVolumeIsRootFileSystemKey: Pointer;
function NSURLVolumeSupportsCompressionKey: Pointer;
function NSURLVolumeSupportsFileCloningKey: Pointer;
function NSURLVolumeSupportsSwapRenamingKey: Pointer;
function NSURLVolumeSupportsExclusiveRenamingKey: Pointer;
function NSURLVolumeSupportsImmutableFilesKey: Pointer;
function NSURLVolumeSupportsAccessPermissionsKey: Pointer;
function NSURLVolumeSupportsFileProtectionKey: Pointer;
function NSURLVolumeAvailableCapacityForImportantUsageKey: Pointer;
function NSURLVolumeAvailableCapacityForOpportunisticUsageKey: Pointer;
function NSURLVolumeTypeNameKey: Pointer;
function NSURLVolumeSubtypeKey: Pointer;
function NSURLVolumeMountFromLocationKey: Pointer;
function NSURLIsUbiquitousItemKey: Pointer;
function NSURLUbiquitousItemHasUnresolvedConflictsKey: Pointer;
function NSURLUbiquitousItemIsDownloadedKey: Pointer;
function NSURLUbiquitousItemIsDownloadingKey: Pointer;
function NSURLUbiquitousItemIsUploadedKey: Pointer;
function NSURLUbiquitousItemIsUploadingKey: Pointer;
function NSURLUbiquitousItemPercentDownloadedKey: Pointer;
function NSURLUbiquitousItemPercentUploadedKey: Pointer;
function NSURLUbiquitousItemDownloadingStatusKey: Pointer;
function NSURLUbiquitousItemDownloadingErrorKey: Pointer;
function NSURLUbiquitousItemUploadingErrorKey: Pointer;
function NSURLUbiquitousItemDownloadRequestedKey: Pointer;
function NSURLUbiquitousItemContainerDisplayNameKey: Pointer;
function NSURLUbiquitousItemIsExcludedFromSyncKey: Pointer;
function NSURLUbiquitousItemIsSharedKey: Pointer;
function NSURLUbiquitousSharedItemCurrentUserRoleKey: Pointer;
function NSURLUbiquitousSharedItemCurrentUserPermissionsKey: Pointer;
function NSURLUbiquitousSharedItemOwnerNameComponentsKey: Pointer;
function NSURLUbiquitousSharedItemMostRecentEditorNameComponentsKey: Pointer;
function NSURLUbiquitousItemDownloadingStatusNotDownloaded: Pointer;
function NSURLUbiquitousItemDownloadingStatusDownloaded: Pointer;
function NSURLUbiquitousItemDownloadingStatusCurrent: Pointer;
function NSURLUbiquitousSharedItemRoleOwner: Pointer;
function NSURLUbiquitousSharedItemRoleParticipant: Pointer;
function NSURLUbiquitousSharedItemPermissionsReadOnly: Pointer;
function NSURLUbiquitousSharedItemPermissionsReadWrite: Pointer;
function NSFileManagerUnmountDissentingProcessIdentifierErrorKey: NSString;
function NSUbiquityIdentityDidChangeNotification: Pointer;
function NSFileType: Pointer;
function NSFileTypeDirectory: Pointer;
function NSFileTypeRegular: Pointer;
function NSFileTypeSymbolicLink: Pointer;
function NSFileTypeSocket: Pointer;
function NSFileTypeCharacterSpecial: Pointer;
function NSFileTypeBlockSpecial: Pointer;
function NSFileTypeUnknown: Pointer;
function NSFileSize: Pointer;
function NSFileModificationDate: Pointer;
function NSFileReferenceCount: Pointer;
function NSFileDeviceIdentifier: Pointer;
function NSFileOwnerAccountName: Pointer;
function NSFileGroupOwnerAccountName: Pointer;
function NSFilePosixPermissions: Pointer;
function NSFileSystemNumber: Pointer;
function NSFileSystemFileNumber: Pointer;
function NSFileExtensionHidden: Pointer;
function NSFileHFSCreatorCode: Pointer;
function NSFileHFSTypeCode: Pointer;
function NSFileImmutable: Pointer;
function NSFileAppendOnly: Pointer;
function NSFileCreationDate: Pointer;
function NSFileOwnerAccountID: Pointer;
function NSFileGroupOwnerAccountID: Pointer;
function NSFileBusy: Pointer;
function NSFileProtectionKey: Pointer;
function NSFileProtectionNone: Pointer;
function NSFileProtectionComplete: Pointer;
function NSFileProtectionCompleteUnlessOpen: Pointer;
function NSFileProtectionCompleteUntilFirstUserAuthentication: Pointer;
function NSFileSystemSize: Pointer;
function NSFileSystemFreeSize: Pointer;
function NSFileSystemNodes: Pointer;
function NSFileSystemFreeNodes: Pointer;
function NSIntegerHashCallBacks: Pointer;
function NSNonOwnedPointerHashCallBacks: Pointer;
function NSNonRetainedObjectHashCallBacks: Pointer;
function NSObjectHashCallBacks: Pointer;
function NSOwnedObjectIdentityHashCallBacks: Pointer;
function NSOwnedPointerHashCallBacks: Pointer;
function NSPointerToStructHashCallBacks: Pointer;
function NSIntHashCallBacks: Pointer;
function NSHTTPCookieName: Pointer;
function NSHTTPCookieValue: Pointer;
function NSHTTPCookieOriginURL: Pointer;
function NSHTTPCookieVersion: Pointer;
function NSHTTPCookieDomain: Pointer;
function NSHTTPCookiePath: Pointer;
function NSHTTPCookieSecure: Pointer;
function NSHTTPCookieExpires: Pointer;
function NSHTTPCookieComment: Pointer;
function NSHTTPCookieCommentURL: Pointer;
function NSHTTPCookieDiscard: Pointer;
function NSHTTPCookieMaximumAge: Pointer;
function NSHTTPCookiePort: Pointer;
function NSHTTPCookieSameSitePolicy: Pointer;
function NSHTTPCookieSameSiteLax: Pointer;
function NSHTTPCookieSameSiteStrict: Pointer;
function NSHTTPCookieManagerAcceptPolicyChangedNotification: Pointer;
function NSHTTPCookieManagerCookiesChangedNotification: Pointer;
function NSUndefinedKeyException: Pointer;
function NSAverageKeyValueOperator: Pointer;
function NSCountKeyValueOperator: Pointer;
function NSDistinctUnionOfArraysKeyValueOperator: Pointer;
function NSDistinctUnionOfObjectsKeyValueOperator: Pointer;
function NSDistinctUnionOfSetsKeyValueOperator: Pointer;
function NSMaximumKeyValueOperator: Pointer;
function NSMinimumKeyValueOperator: Pointer;
function NSSumKeyValueOperator: Pointer;
function NSUnionOfArraysKeyValueOperator: Pointer;
function NSUnionOfObjectsKeyValueOperator: Pointer;
function NSUnionOfSetsKeyValueOperator: Pointer;
function NSKeyValueChangeKindKey: Pointer;
function NSKeyValueChangeNewKey: Pointer;
function NSKeyValueChangeOldKey: Pointer;
function NSKeyValueChangeIndexesKey: Pointer;
function NSKeyValueChangeNotificationIsPriorKey: Pointer;
function NSInvalidArchiveOperationException: Pointer;
function NSInvalidUnarchiveOperationException: Pointer;
function NSKeyedArchiveRootObjectKey: NSString;
function NSIntegerMapKeyCallBacks: Pointer;
function NSNonOwnedPointerMapKeyCallBacks: Pointer;
function NSNonOwnedPointerOrNullMapKeyCallBacks: Pointer;
function NSNonRetainedObjectMapKeyCallBacks: Pointer;
function NSObjectMapKeyCallBacks: Pointer;
function NSOwnedPointerMapKeyCallBacks: Pointer;
function NSIntMapKeyCallBacks: Pointer;
function NSIntegerMapValueCallBacks: Pointer;
function NSNonOwnedPointerMapValueCallBacks: Pointer;
function NSObjectMapValueCallBacks: Pointer;
function NSNonRetainedObjectMapValueCallBacks: Pointer;
function NSOwnedPointerMapValueCallBacks: Pointer;
function NSIntMapValueCallBacks: Pointer;
function NSInvocationOperationVoidResultException: Pointer;
function NSInvocationOperationCancelledException: Pointer;
function NSPortDidBecomeInvalidNotification: Pointer;
function NSProcessInfoThermalStateDidChangeNotification: Pointer;
function NSProcessInfoPowerStateDidChangeNotification: Pointer;
function NSTextCheckingNameKey: Pointer;
function NSTextCheckingJobTitleKey: Pointer;
function NSTextCheckingOrganizationKey: Pointer;
function NSTextCheckingStreetKey: Pointer;
function NSTextCheckingCityKey: Pointer;
function NSTextCheckingStateKey: Pointer;
function NSTextCheckingZIPKey: Pointer;
function NSTextCheckingCountryKey: Pointer;
function NSTextCheckingPhoneKey: Pointer;
function NSTextCheckingAirlineKey: Pointer;
function NSTextCheckingFlightKey: Pointer;
function NSStreamSocketSecurityLevelKey: Pointer;
function NSStreamSocketSecurityLevelNone: Pointer;
function NSStreamSocketSecurityLevelSSLv2: Pointer;
function NSStreamSocketSecurityLevelSSLv3: Pointer;
function NSStreamSocketSecurityLevelTLSv1: Pointer;
function NSStreamSocketSecurityLevelNegotiatedSSL: Pointer;
function NSStreamSOCKSProxyConfigurationKey: Pointer;
function NSStreamSOCKSProxyHostKey: Pointer;
function NSStreamSOCKSProxyPortKey: Pointer;
function NSStreamSOCKSProxyVersionKey: Pointer;
function NSStreamSOCKSProxyUserKey: Pointer;
function NSStreamSOCKSProxyPasswordKey: Pointer;
function NSStreamSOCKSProxyVersion4: Pointer;
function NSStreamSOCKSProxyVersion5: Pointer;
function NSStreamDataWrittenToMemoryStreamKey: Pointer;
function NSStreamFileCurrentOffsetKey: Pointer;
function NSStreamSocketSSLErrorDomain: Pointer;
function NSStreamSOCKSErrorDomain: Pointer;
function NSStreamNetworkServiceType: Pointer;
function NSStreamNetworkServiceTypeVoIP: Pointer;
function NSStreamNetworkServiceTypeVideo: Pointer;
function NSStreamNetworkServiceTypeBackground: Pointer;
function NSStreamNetworkServiceTypeVoice: Pointer;
function NSStreamNetworkServiceTypeCallSignaling: Pointer;
function NSWillBecomeMultiThreadedNotification: Pointer;
function NSDidBecomeSingleThreadedNotification: Pointer;
function NSThreadWillExitNotification: Pointer;
function NSSystemTimeZoneDidChangeNotification: Pointer;
function NSURLProtectionSpaceHTTP: NSString;
function NSURLProtectionSpaceHTTPS: NSString;
function NSURLProtectionSpaceFTP: NSString;
function NSURLProtectionSpaceHTTPProxy: NSString;
function NSURLProtectionSpaceHTTPSProxy: NSString;
function NSURLProtectionSpaceFTPProxy: NSString;
function NSURLProtectionSpaceSOCKSProxy: NSString;
function NSURLAuthenticationMethodDefault: NSString;
function NSURLAuthenticationMethodHTTPBasic: NSString;
function NSURLAuthenticationMethodHTTPDigest: NSString;
function NSURLAuthenticationMethodHTMLForm: NSString;
function NSURLAuthenticationMethodNTLM: NSString;
function NSURLAuthenticationMethodNegotiate: NSString;
function NSURLAuthenticationMethodClientCertificate: NSString;
function NSURLAuthenticationMethodServerTrust: NSString;
function NSURLCredentialStorageChangedNotification: Pointer;
function NSURLCredentialStorageRemoveSynchronizableCredentials: NSString;
function NSURLErrorDomain: Pointer;
function NSURLErrorFailingURLErrorKey: NSString;
function NSURLErrorFailingURLStringErrorKey: NSString;
function NSErrorFailingURLStringKey: NSString;
function NSURLErrorFailingURLPeerTrustErrorKey: NSString;
function NSURLErrorBackgroundTaskCancelledReasonKey: NSString;
function NSURLErrorNetworkUnavailableReasonKey: Pointer;
function NSGlobalDomain: NSString;
function NSArgumentDomain: NSString;
function NSRegistrationDomain: NSString;
function NSUserDefaultsSizeLimitExceededNotification: Pointer;
function NSUbiquitousUserDefaultsNoCloudAccountNotification: Pointer;
function NSUbiquitousUserDefaultsDidChangeAccountsNotification: Pointer;
function NSUbiquitousUserDefaultsCompletedInitialSyncNotification: Pointer;
function NSUserDefaultsDidChangeNotification: Pointer;
function NSNegateBooleanTransformerName: Pointer;
function NSIsNilTransformerName: Pointer;
function NSIsNotNilTransformerName: Pointer;
function NSUnarchiveFromDataTransformerName: Pointer;
function NSKeyedUnarchiveFromDataTransformerName: Pointer;
function NSSecureUnarchiveFromDataTransformerName: Pointer;
function NSXMLParserErrorDomain: Pointer;
function NSExtensionItemsAndErrorsKey: NSString;
function NSExtensionHostWillEnterForegroundNotification: NSString;
function NSExtensionHostDidEnterBackgroundNotification: NSString;
function NSExtensionHostWillResignActiveNotification: NSString;
function NSExtensionHostDidBecomeActiveNotification: NSString;
function NSExtensionItemAttributedTitleKey: NSString;
function NSExtensionItemAttributedContentTextKey: NSString;
function NSExtensionItemAttachmentsKey: NSString;
function NSLinguisticTagSchemeTokenType: Pointer;
function NSLinguisticTagSchemeLexicalClass: Pointer;
function NSLinguisticTagSchemeNameType: Pointer;
function NSLinguisticTagSchemeNameTypeOrLexicalClass: Pointer;
function NSLinguisticTagSchemeLemma: Pointer;
function NSLinguisticTagSchemeLanguage: Pointer;
function NSLinguisticTagSchemeScript: Pointer;
function NSLinguisticTagWord: Pointer;
function NSLinguisticTagPunctuation: Pointer;
function NSLinguisticTagWhitespace: Pointer;
function NSLinguisticTagOther: Pointer;
function NSLinguisticTagNoun: Pointer;
function NSLinguisticTagVerb: Pointer;
function NSLinguisticTagAdjective: Pointer;
function NSLinguisticTagAdverb: Pointer;
function NSLinguisticTagPronoun: Pointer;
function NSLinguisticTagDeterminer: Pointer;
function NSLinguisticTagParticle: Pointer;
function NSLinguisticTagPreposition: Pointer;
function NSLinguisticTagNumber: Pointer;
function NSLinguisticTagConjunction: Pointer;
function NSLinguisticTagInterjection: Pointer;
function NSLinguisticTagClassifier: Pointer;
function NSLinguisticTagIdiom: Pointer;
function NSLinguisticTagOtherWord: Pointer;
function NSLinguisticTagSentenceTerminator: Pointer;
function NSLinguisticTagOpenQuote: Pointer;
function NSLinguisticTagCloseQuote: Pointer;
function NSLinguisticTagOpenParenthesis: Pointer;
function NSLinguisticTagCloseParenthesis: Pointer;
function NSLinguisticTagWordJoiner: Pointer;
function NSLinguisticTagDash: Pointer;
function NSLinguisticTagOtherPunctuation: Pointer;
function NSLinguisticTagParagraphBreak: Pointer;
function NSLinguisticTagOtherWhitespace: Pointer;
function NSLinguisticTagPersonalName: Pointer;
function NSLinguisticTagPlaceName: Pointer;
function NSLinguisticTagOrganizationName: Pointer;
function NSMetadataItemFSNameKey: NSString;
function NSMetadataItemDisplayNameKey: NSString;
function NSMetadataItemURLKey: NSString;
function NSMetadataItemPathKey: NSString;
function NSMetadataItemFSSizeKey: NSString;
function NSMetadataItemFSCreationDateKey: NSString;
function NSMetadataItemFSContentChangeDateKey: NSString;
function NSMetadataItemContentTypeKey: NSString;
function NSMetadataItemContentTypeTreeKey: NSString;
function NSMetadataItemIsUbiquitousKey: NSString;
function NSMetadataUbiquitousItemHasUnresolvedConflictsKey: NSString;
function NSMetadataUbiquitousItemIsDownloadedKey: NSString;
function NSMetadataUbiquitousItemDownloadingStatusKey: NSString;
function NSMetadataUbiquitousItemDownloadingStatusNotDownloaded: NSString;
function NSMetadataUbiquitousItemDownloadingStatusDownloaded: NSString;
function NSMetadataUbiquitousItemDownloadingStatusCurrent: NSString;
function NSMetadataUbiquitousItemIsDownloadingKey: NSString;
function NSMetadataUbiquitousItemIsUploadedKey: NSString;
function NSMetadataUbiquitousItemIsUploadingKey: NSString;
function NSMetadataUbiquitousItemPercentDownloadedKey: NSString;
function NSMetadataUbiquitousItemPercentUploadedKey: NSString;
function NSMetadataUbiquitousItemDownloadingErrorKey: NSString;
function NSMetadataUbiquitousItemUploadingErrorKey: NSString;
function NSMetadataUbiquitousItemDownloadRequestedKey: NSString;
function NSMetadataUbiquitousItemIsExternalDocumentKey: NSString;
function NSMetadataUbiquitousItemContainerDisplayNameKey: NSString;
function NSMetadataUbiquitousItemURLInLocalContainerKey: NSString;
function NSMetadataUbiquitousItemIsSharedKey: NSString;
function NSMetadataUbiquitousSharedItemCurrentUserRoleKey: NSString;
function NSMetadataUbiquitousSharedItemCurrentUserPermissionsKey: NSString;
function NSMetadataUbiquitousSharedItemOwnerNameComponentsKey: NSString;
function NSMetadataUbiquitousSharedItemMostRecentEditorNameComponentsKey
  : NSString;
function NSMetadataUbiquitousSharedItemRoleOwner: NSString;
function NSMetadataUbiquitousSharedItemRoleParticipant: NSString;
function NSMetadataUbiquitousSharedItemPermissionsReadOnly: NSString;
function NSMetadataUbiquitousSharedItemPermissionsReadWrite: NSString;
function NSMetadataItemAttributeChangeDateKey: NSString;
function NSMetadataItemKeywordsKey: NSString;
function NSMetadataItemTitleKey: NSString;
function NSMetadataItemAuthorsKey: NSString;
function NSMetadataItemEditorsKey: NSString;
function NSMetadataItemParticipantsKey: NSString;
function NSMetadataItemProjectsKey: NSString;
function NSMetadataItemDownloadedDateKey: NSString;
function NSMetadataItemWhereFromsKey: NSString;
function NSMetadataItemCommentKey: NSString;
function NSMetadataItemCopyrightKey: NSString;
function NSMetadataItemLastUsedDateKey: NSString;
function NSMetadataItemContentCreationDateKey: NSString;
function NSMetadataItemContentModificationDateKey: NSString;
function NSMetadataItemDateAddedKey: NSString;
function NSMetadataItemDurationSecondsKey: NSString;
function NSMetadataItemContactKeywordsKey: NSString;
function NSMetadataItemVersionKey: NSString;
function NSMetadataItemPixelHeightKey: NSString;
function NSMetadataItemPixelWidthKey: NSString;
function NSMetadataItemPixelCountKey: NSString;
function NSMetadataItemColorSpaceKey: NSString;
function NSMetadataItemBitsPerSampleKey: NSString;
function NSMetadataItemFlashOnOffKey: NSString;
function NSMetadataItemFocalLengthKey: NSString;
function NSMetadataItemAcquisitionMakeKey: NSString;
function NSMetadataItemAcquisitionModelKey: NSString;
function NSMetadataItemISOSpeedKey: NSString;
function NSMetadataItemOrientationKey: NSString;
function NSMetadataItemLayerNamesKey: NSString;
function NSMetadataItemWhiteBalanceKey: NSString;
function NSMetadataItemApertureKey: NSString;
function NSMetadataItemProfileNameKey: NSString;
function NSMetadataItemResolutionWidthDPIKey: NSString;
function NSMetadataItemResolutionHeightDPIKey: NSString;
function NSMetadataItemExposureModeKey: NSString;
function NSMetadataItemExposureTimeSecondsKey: NSString;
function NSMetadataItemEXIFVersionKey: NSString;
function NSMetadataItemCameraOwnerKey: NSString;
function NSMetadataItemFocalLength35mmKey: NSString;
function NSMetadataItemLensModelKey: NSString;
function NSMetadataItemEXIFGPSVersionKey: NSString;
function NSMetadataItemAltitudeKey: NSString;
function NSMetadataItemLatitudeKey: NSString;
function NSMetadataItemLongitudeKey: NSString;
function NSMetadataItemSpeedKey: NSString;
function NSMetadataItemTimestampKey: NSString;
function NSMetadataItemGPSTrackKey: NSString;
function NSMetadataItemImageDirectionKey: NSString;
function NSMetadataItemNamedLocationKey: NSString;
function NSMetadataItemGPSStatusKey: NSString;
function NSMetadataItemGPSMeasureModeKey: NSString;
function NSMetadataItemGPSDOPKey: NSString;
function NSMetadataItemGPSMapDatumKey: NSString;
function NSMetadataItemGPSDestLatitudeKey: NSString;
function NSMetadataItemGPSDestLongitudeKey: NSString;
function NSMetadataItemGPSDestBearingKey: NSString;
function NSMetadataItemGPSDestDistanceKey: NSString;
function NSMetadataItemGPSProcessingMethodKey: NSString;
function NSMetadataItemGPSAreaInformationKey: NSString;
function NSMetadataItemGPSDateStampKey: NSString;
function NSMetadataItemGPSDifferentalKey: NSString;
function NSMetadataItemCodecsKey: NSString;
function NSMetadataItemMediaTypesKey: NSString;
function NSMetadataItemStreamableKey: NSString;
function NSMetadataItemTotalBitRateKey: NSString;
function NSMetadataItemVideoBitRateKey: NSString;
function NSMetadataItemAudioBitRateKey: NSString;
function NSMetadataItemDeliveryTypeKey: NSString;
function NSMetadataItemAlbumKey: NSString;
function NSMetadataItemHasAlphaChannelKey: NSString;
function NSMetadataItemRedEyeOnOffKey: NSString;
function NSMetadataItemMeteringModeKey: NSString;
function NSMetadataItemMaxApertureKey: NSString;
function NSMetadataItemFNumberKey: NSString;
function NSMetadataItemExposureProgramKey: NSString;
function NSMetadataItemExposureTimeStringKey: NSString;
function NSMetadataItemHeadlineKey: NSString;
function NSMetadataItemInstructionsKey: NSString;
function NSMetadataItemCityKey: NSString;
function NSMetadataItemStateOrProvinceKey: NSString;
function NSMetadataItemCountryKey: NSString;
function NSMetadataItemTextContentKey: NSString;
function NSMetadataItemAudioSampleRateKey: NSString;
function NSMetadataItemAudioChannelCountKey: NSString;
function NSMetadataItemTempoKey: NSString;
function NSMetadataItemKeySignatureKey: NSString;
function NSMetadataItemTimeSignatureKey: NSString;
function NSMetadataItemAudioEncodingApplicationKey: NSString;
function NSMetadataItemComposerKey: NSString;
function NSMetadataItemLyricistKey: NSString;
function NSMetadataItemAudioTrackNumberKey: NSString;
function NSMetadataItemRecordingDateKey: NSString;
function NSMetadataItemMusicalGenreKey: NSString;
function NSMetadataItemIsGeneralMIDISequenceKey: NSString;
function NSMetadataItemRecordingYearKey: NSString;
function NSMetadataItemOrganizationsKey: NSString;
function NSMetadataItemLanguagesKey: NSString;
function NSMetadataItemRightsKey: NSString;
function NSMetadataItemPublishersKey: NSString;
function NSMetadataItemContributorsKey: NSString;
function NSMetadataItemCoverageKey: NSString;
function NSMetadataItemSubjectKey: NSString;
function NSMetadataItemThemeKey: NSString;
function NSMetadataItemDescriptionKey: NSString;
function NSMetadataItemIdentifierKey: NSString;
function NSMetadataItemAudiencesKey: NSString;
function NSMetadataItemNumberOfPagesKey: NSString;
function NSMetadataItemPageWidthKey: NSString;
function NSMetadataItemPageHeightKey: NSString;
function NSMetadataItemSecurityMethodKey: NSString;
function NSMetadataItemCreatorKey: NSString;
function NSMetadataItemEncodingApplicationsKey: NSString;
function NSMetadataItemDueDateKey: NSString;
function NSMetadataItemStarRatingKey: NSString;
function NSMetadataItemPhoneNumbersKey: NSString;
function NSMetadataItemEmailAddressesKey: NSString;
function NSMetadataItemInstantMessageAddressesKey: NSString;
function NSMetadataItemKindKey: NSString;
function NSMetadataItemRecipientsKey: NSString;
function NSMetadataItemFinderCommentKey: NSString;
function NSMetadataItemFontsKey: NSString;
function NSMetadataItemAppleLoopsRootKeyKey: NSString;
function NSMetadataItemAppleLoopsKeyFilterTypeKey: NSString;
function NSMetadataItemAppleLoopsLoopModeKey: NSString;
function NSMetadataItemAppleLoopDescriptorsKey: NSString;
function NSMetadataItemMusicalInstrumentCategoryKey: NSString;
function NSMetadataItemMusicalInstrumentNameKey: NSString;
function NSMetadataItemCFBundleIdentifierKey: NSString;
function NSMetadataItemInformationKey: NSString;
function NSMetadataItemDirectorKey: NSString;
function NSMetadataItemProducerKey: NSString;
function NSMetadataItemGenreKey: NSString;
function NSMetadataItemPerformersKey: NSString;
function NSMetadataItemOriginalFormatKey: NSString;
function NSMetadataItemOriginalSourceKey: NSString;
function NSMetadataItemAuthorEmailAddressesKey: NSString;
function NSMetadataItemRecipientEmailAddressesKey: NSString;
function NSMetadataItemAuthorAddressesKey: NSString;
function NSMetadataItemRecipientAddressesKey: NSString;
function NSMetadataItemIsLikelyJunkKey: NSString;
function NSMetadataItemExecutableArchitecturesKey: NSString;
function NSMetadataItemExecutablePlatformKey: NSString;
function NSMetadataItemApplicationCategoriesKey: NSString;
function NSMetadataItemIsApplicationManagedKey: NSString;
function NSMetadataQueryDidStartGatheringNotification: Pointer;
function NSMetadataQueryGatheringProgressNotification: Pointer;
function NSMetadataQueryDidFinishGatheringNotification: Pointer;
function NSMetadataQueryDidUpdateNotification: Pointer;
function NSMetadataQueryUpdateAddedItemsKey: NSString;
function NSMetadataQueryUpdateChangedItemsKey: NSString;
function NSMetadataQueryUpdateRemovedItemsKey: NSString;
function NSMetadataQueryResultContentRelevanceAttribute: NSString;
function NSMetadataQueryUserHomeScope: NSString;
function NSMetadataQueryLocalComputerScope: NSString;
function NSMetadataQueryNetworkScope: NSString;
function NSMetadataQueryIndexedLocalComputerScope: NSString;
function NSMetadataQueryIndexedNetworkScope: NSString;
function NSMetadataQueryUbiquitousDocumentsScope: NSString;
function NSMetadataQueryUbiquitousDataScope: NSString;
function NSMetadataQueryAccessibleUbiquitousExternalDocumentsScope: NSString;
function NSNetServicesErrorCode: NSString;
function NSNetServicesErrorDomain: Pointer;
function NSUbiquitousKeyValueStoreDidChangeExternallyNotification: Pointer;
function NSUbiquitousKeyValueStoreChangeReasonKey: NSString;
function NSUbiquitousKeyValueStoreChangedKeysKey: NSString;
function NSUndoManagerGroupIsDiscardableKey: NSString;
function NSUndoManagerCheckpointNotification: Pointer;
function NSUndoManagerWillUndoChangeNotification: Pointer;
function NSUndoManagerWillRedoChangeNotification: Pointer;
function NSUndoManagerDidUndoChangeNotification: Pointer;
function NSUndoManagerDidRedoChangeNotification: Pointer;
function NSUndoManagerDidOpenUndoGroupNotification: Pointer;
function NSUndoManagerWillCloseUndoGroupNotification: Pointer;
function NSUndoManagerDidCloseUndoGroupNotification: Pointer;
function NSURLSessionTransferSizeUnknown: Pointer;
function NSURLSessionTaskPriorityDefault: Pointer;
function NSURLSessionTaskPriorityLow: Pointer;
function NSURLSessionTaskPriorityHigh: Pointer;
function NSURLSessionDownloadTaskResumeData: NSString;
function NSUserActivityTypeBrowsingWeb: NSString;


// ===== External functions =====

const
  libFoundation = '/System/Library/Frameworks/Foundation.framework/Foundation';
function NSStringFromSelector(aSelector: SEL): Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSStringFromSelector';
function NSSelectorFromString(aSelectorName: Pointer { NSString } ): SEL; cdecl;
  external libFoundation name _PU + 'NSSelectorFromString';
function NSStringFromClass(aClass: Pointer): Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSStringFromClass';
function NSClassFromString(aClassName: Pointer { NSString } ): Pointer; cdecl;
  external libFoundation name _PU + 'NSClassFromString';
function NSStringFromProtocol(proto: Pointer { Pointer } )
  : Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSStringFromProtocol';
function NSProtocolFromString(namestr: Pointer { NSString } )
  : Pointer { Pointer }; cdecl;
  external libFoundation name _PU + 'NSProtocolFromString';
function NSGetSizeAndAlignment(typePtr: MarshaledAString; sizep: PCardinal;
  alignp: PCardinal): MarshaledAString; cdecl;
  external libFoundation name _PU + 'NSGetSizeAndAlignment';
function NSDefaultMallocZone: Pointer; cdecl;
  external libFoundation name _PU + 'NSDefaultMallocZone';
function NSCreateZone(startSize: NSUInteger; granularity: NSUInteger;
  canFree: Boolean): Pointer; cdecl;
  external libFoundation name _PU + 'NSCreateZone';
procedure NSRecycleZone(zone: Pointer); cdecl;
  external libFoundation name _PU + 'NSRecycleZone';
procedure NSSetZoneName(zone: Pointer; name: Pointer { NSString } ); cdecl;
  external libFoundation name _PU + 'NSSetZoneName';
function NSZoneName(zone: Pointer): Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSZoneName';
function NSZoneFromPointer(ptr: Pointer): Pointer; cdecl;
  external libFoundation name _PU + 'NSZoneFromPointer';
function NSZoneMalloc(zone: Pointer; size: NSUInteger): Pointer; cdecl;
  external libFoundation name _PU + 'NSZoneMalloc';
function NSZoneCalloc(zone: Pointer; numElems: NSUInteger; byteSize: NSUInteger)
  : Pointer; cdecl; external libFoundation name _PU + 'NSZoneCalloc';
function NSZoneRealloc(zone: Pointer; ptr: Pointer; size: NSUInteger): Pointer;
  cdecl; external libFoundation name _PU + 'NSZoneRealloc';
procedure NSZoneFree(zone: Pointer; ptr: Pointer); cdecl;
  external libFoundation name _PU + 'NSZoneFree';
function NSMakeCollectable(cf: CFTypeRef): Pointer; cdecl;
  external libFoundation name _PU + 'NSMakeCollectable';
function NSPageSize: NSUInteger; cdecl;
  external libFoundation name _PU + 'NSPageSize';
function NSLogPageSize: NSUInteger; cdecl;
  external libFoundation name _PU + 'NSLogPageSize';
function NSRoundUpToMultipleOfPageSize(bytes: NSUInteger): NSUInteger; cdecl;
  external libFoundation name _PU + 'NSRoundUpToMultipleOfPageSize';
function NSRoundDownToMultipleOfPageSize(bytes: NSUInteger): NSUInteger; cdecl;
  external libFoundation name _PU + 'NSRoundDownToMultipleOfPageSize';
function NSAllocateMemoryPages(bytes: NSUInteger): Pointer; cdecl;
  external libFoundation name _PU + 'NSAllocateMemoryPages';
procedure NSDeallocateMemoryPages(ptr: Pointer; bytes: NSUInteger); cdecl;
  external libFoundation name _PU + 'NSDeallocateMemoryPages';
procedure NSCopyMemoryPages(source: Pointer; dest: Pointer; bytes: NSUInteger);
  cdecl; external libFoundation name _PU + 'NSCopyMemoryPages';
function NSRealMemoryAvailable: NSUInteger; cdecl;
  external libFoundation name _PU + 'NSRealMemoryAvailable';
function NSAllocateObject(aClass: Pointer; extraBytes: NSUInteger;
  zone: Pointer): Pointer; cdecl;
  external libFoundation name _PU + 'NSAllocateObject';
procedure NSDeallocateObject(&object: Pointer); cdecl;
  external libFoundation name _PU + 'NSDeallocateObject';
function NSCopyObject(&object: Pointer; extraBytes: NSUInteger; zone: Pointer)
  : Pointer; cdecl; external libFoundation name _PU + 'NSCopyObject';
function NSShouldRetainWithZone(anObject: Pointer; requestedZone: Pointer)
  : Boolean; cdecl; external libFoundation name _PU + 'NSShouldRetainWithZone';
procedure NSIncrementExtraRefCount(&object: Pointer); cdecl;
  external libFoundation name _PU + 'NSIncrementExtraRefCount';
function NSDecrementExtraRefCountWasZero(&object: Pointer): Boolean; cdecl;
  external libFoundation name _PU + 'NSDecrementExtraRefCountWasZero';
function NSExtraRefCount(&object: Pointer): NSUInteger; cdecl;
  external libFoundation name _PU + 'NSExtraRefCount';
function CFBridgingRetain(X: Pointer): CFTypeRef; cdecl;
  external libFoundation name _PU + 'CFBridgingRetain';
function CFBridgingRelease(X: CFTypeRef): Pointer; cdecl;
  external libFoundation name _PU + 'CFBridgingRelease';
function NSMakeRange(loc: NSUInteger; len: NSUInteger): NSRange; cdecl;
  external libFoundation name _PU + 'NSMakeRange';
function NSMaxRange(range: NSRange): NSUInteger; cdecl;
  external libFoundation name _PU + 'NSMaxRange';
function NSLocationInRange(loc: NSUInteger; range: NSRange): Boolean; cdecl;
  external libFoundation name _PU + 'NSLocationInRange';
function NSEqualRanges(range1: NSRange; range2: NSRange): Boolean; cdecl;
  external libFoundation name _PU + 'NSEqualRanges';
function NSUnionRange(range1: NSRange; range2: NSRange): NSRange; cdecl;
  external libFoundation name _PU + 'NSUnionRange';
function NSIntersectionRange(range1: NSRange; range2: NSRange): NSRange; cdecl;
  external libFoundation name _PU + 'NSIntersectionRange';
function NSStringFromRange(range: NSRange): Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSStringFromRange';
function NSRangeFromString(aString: Pointer { NSString } ): NSRange; cdecl;
  external libFoundation name _PU + 'NSRangeFromString';
function NSHostByteOrder: LongInt; cdecl;
  external libFoundation name _PU + 'NSHostByteOrder';
function NSSwapShort(inv: Word): Word; cdecl;
  external libFoundation name _PU + 'NSSwapShort';
function NSSwapInt(inv: Cardinal): Cardinal; cdecl;
  external libFoundation name _PU + 'NSSwapInt';
function NSSwapLong(inv: LongWord): LongWord; cdecl;
  external libFoundation name _PU + 'NSSwapLong';
function NSSwapLongLong(inv: UInt64): UInt64; cdecl;
  external libFoundation name _PU + 'NSSwapLongLong';
function NSSwapBigShortToHost(X: Word): Word; cdecl;
  external libFoundation name _PU + 'NSSwapBigShortToHost';
function NSSwapBigIntToHost(X: Cardinal): Cardinal; cdecl;
  external libFoundation name _PU + 'NSSwapBigIntToHost';
function NSSwapBigLongToHost(X: LongWord): LongWord; cdecl;
  external libFoundation name _PU + 'NSSwapBigLongToHost';
function NSSwapBigLongLongToHost(X: UInt64): UInt64; cdecl;
  external libFoundation name _PU + 'NSSwapBigLongLongToHost';
function NSSwapHostShortToBig(X: Word): Word; cdecl;
  external libFoundation name _PU + 'NSSwapHostShortToBig';
function NSSwapHostIntToBig(X: Cardinal): Cardinal; cdecl;
  external libFoundation name _PU + 'NSSwapHostIntToBig';
function NSSwapHostLongToBig(X: LongWord): LongWord; cdecl;
  external libFoundation name _PU + 'NSSwapHostLongToBig';
function NSSwapHostLongLongToBig(X: UInt64): UInt64; cdecl;
  external libFoundation name _PU + 'NSSwapHostLongLongToBig';
function NSSwapLittleShortToHost(X: Word): Word; cdecl;
  external libFoundation name _PU + 'NSSwapLittleShortToHost';
function NSSwapLittleIntToHost(X: Cardinal): Cardinal; cdecl;
  external libFoundation name _PU + 'NSSwapLittleIntToHost';
function NSSwapLittleLongToHost(X: LongWord): LongWord; cdecl;
  external libFoundation name _PU + 'NSSwapLittleLongToHost';
function NSSwapLittleLongLongToHost(X: UInt64): UInt64; cdecl;
  external libFoundation name _PU + 'NSSwapLittleLongLongToHost';
function NSSwapHostShortToLittle(X: Word): Word; cdecl;
  external libFoundation name _PU + 'NSSwapHostShortToLittle';
function NSSwapHostIntToLittle(X: Cardinal): Cardinal; cdecl;
  external libFoundation name _PU + 'NSSwapHostIntToLittle';
function NSSwapHostLongToLittle(X: LongWord): LongWord; cdecl;
  external libFoundation name _PU + 'NSSwapHostLongToLittle';
function NSSwapHostLongLongToLittle(X: UInt64): UInt64; cdecl;
  external libFoundation name _PU + 'NSSwapHostLongLongToLittle';
function NSConvertHostFloatToSwapped(X: Single): NSSwappedFloat; cdecl;
  external libFoundation name _PU + 'NSConvertHostFloatToSwapped';
function NSConvertSwappedFloatToHost(X: NSSwappedFloat): Single; cdecl;
  external libFoundation name _PU + 'NSConvertSwappedFloatToHost';
function NSConvertHostDoubleToSwapped(X: Double): NSSwappedDouble; cdecl;
  external libFoundation name _PU + 'NSConvertHostDoubleToSwapped';
function NSConvertSwappedDoubleToHost(X: NSSwappedDouble): Double; cdecl;
  external libFoundation name _PU + 'NSConvertSwappedDoubleToHost';
function NSSwapFloat(X: NSSwappedFloat): NSSwappedFloat; cdecl;
  external libFoundation name _PU + 'NSSwapFloat';
function NSSwapDouble(X: NSSwappedDouble): NSSwappedDouble; cdecl;
  external libFoundation name _PU + 'NSSwapDouble';
function NSSwapBigDoubleToHost(X: NSSwappedDouble): Double; cdecl;
  external libFoundation name _PU + 'NSSwapBigDoubleToHost';
function NSSwapBigFloatToHost(X: NSSwappedFloat): Single; cdecl;
  external libFoundation name _PU + 'NSSwapBigFloatToHost';
function NSSwapHostDoubleToBig(X: Double): NSSwappedDouble; cdecl;
  external libFoundation name _PU + 'NSSwapHostDoubleToBig';
function NSSwapHostFloatToBig(X: Single): NSSwappedFloat; cdecl;
  external libFoundation name _PU + 'NSSwapHostFloatToBig';
function NSSwapLittleDoubleToHost(X: NSSwappedDouble): Double; cdecl;
  external libFoundation name _PU + 'NSSwapLittleDoubleToHost';
function NSSwapLittleFloatToHost(X: NSSwappedFloat): Single; cdecl;
  external libFoundation name _PU + 'NSSwapLittleFloatToHost';
function NSSwapHostDoubleToLittle(X: Double): NSSwappedDouble; cdecl;
  external libFoundation name _PU + 'NSSwapHostDoubleToLittle';
function NSSwapHostFloatToLittle(X: Single): NSSwappedFloat; cdecl;
  external libFoundation name _PU + 'NSSwapHostFloatToLittle';
function NSDecimalIsNotANumber(dcm: PNSDecimal): Boolean; cdecl;
  external libFoundation name _PU + 'NSDecimalIsNotANumber';
procedure NSDecimalCopy(destination: PNSDecimal; source: PNSDecimal); cdecl;
  external libFoundation name _PU + 'NSDecimalCopy';
procedure NSDecimalCompact(number: PNSDecimal); cdecl;
  external libFoundation name _PU + 'NSDecimalCompact';
function NSDecimalCompare(leftOperand: PNSDecimal; rightOperand: PNSDecimal)
  : NSComparisonResult; cdecl;
  external libFoundation name _PU + 'NSDecimalCompare';
procedure NSDecimalRound(result: PNSDecimal; number: PNSDecimal;
  scale: NSInteger; roundingMode: NSRoundingMode); cdecl;
  external libFoundation name _PU + 'NSDecimalRound';
function NSDecimalNormalize(number1: PNSDecimal; number2: PNSDecimal;
  roundingMode: NSRoundingMode): NSCalculationError; cdecl;
  external libFoundation name _PU + 'NSDecimalNormalize';
function NSDecimalAdd(result: PNSDecimal; leftOperand: PNSDecimal;
  rightOperand: PNSDecimal; roundingMode: NSRoundingMode): NSCalculationError;
  cdecl; external libFoundation name _PU + 'NSDecimalAdd';
function NSDecimalSubtract(result: PNSDecimal; leftOperand: PNSDecimal;
  rightOperand: PNSDecimal; roundingMode: NSRoundingMode): NSCalculationError;
  cdecl; external libFoundation name _PU + 'NSDecimalSubtract';
function NSDecimalMultiply(result: PNSDecimal; leftOperand: PNSDecimal;
  rightOperand: PNSDecimal; roundingMode: NSRoundingMode): NSCalculationError;
  cdecl; external libFoundation name _PU + 'NSDecimalMultiply';
function NSDecimalDivide(result: PNSDecimal; leftOperand: PNSDecimal;
  rightOperand: PNSDecimal; roundingMode: NSRoundingMode): NSCalculationError;
  cdecl; external libFoundation name _PU + 'NSDecimalDivide';
function NSDecimalPower(result: PNSDecimal; number: PNSDecimal;
  power: NSUInteger; roundingMode: NSRoundingMode): NSCalculationError; cdecl;
  external libFoundation name _PU + 'NSDecimalPower';
function NSDecimalMultiplyByPowerOf10(result: PNSDecimal; number: PNSDecimal;
  power: SmallInt; roundingMode: NSRoundingMode): NSCalculationError; cdecl;
  external libFoundation name _PU + 'NSDecimalMultiplyByPowerOf10';
function NSDecimalString(dcm: PNSDecimal; locale: Pointer)
  : Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSDecimalString';
function NSGetUncaughtExceptionHandler
  : TFoundationNSGetUncaughtExceptionHandler; cdecl;
  external libFoundation name _PU + 'NSGetUncaughtExceptionHandler';
procedure NSSetUncaughtExceptionHandler
  (param1: TFoundationNSGetUncaughtExceptionHandler); cdecl;
  external libFoundation name _PU + 'NSSetUncaughtExceptionHandler';
function NSUserName: Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSUserName';
function NSFullUserName: Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSFullUserName';
function NSHomeDirectory: Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSHomeDirectory';
function NSHomeDirectoryForUser(userName: Pointer { NSString } )
  : Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSHomeDirectoryForUser';
function NSTemporaryDirectory: Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSTemporaryDirectory';
function NSOpenStepRootDirectory: Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSOpenStepRootDirectory';
function NSSearchPathForDirectoriesInDomains(directory: NSSearchPathDirectory;
  domainMask: NSSearchPathDomainMask; expandTilde: Boolean)
  : Pointer { NSArray }; cdecl;
  external libFoundation name _PU + 'NSSearchPathForDirectoriesInDomains';
procedure NSFreeHashTable(table: Pointer { NSHashTable } ); cdecl;
  external libFoundation name _PU + 'NSFreeHashTable';
procedure NSResetHashTable(table: Pointer { NSHashTable } ); cdecl;
  external libFoundation name _PU + 'NSResetHashTable';
function NSCompareHashTables(table1: Pointer { NSHashTable };
  table2: Pointer { NSHashTable } ): Boolean; cdecl;
  external libFoundation name _PU + 'NSCompareHashTables';
function NSCopyHashTableWithZone(table: Pointer { NSHashTable }; zone: Pointer)
  : Pointer { NSHashTable }; cdecl;
  external libFoundation name _PU + 'NSCopyHashTableWithZone';
function NSHashGet(table: Pointer { NSHashTable }; Pointer: Pointer): Pointer;
  cdecl; external libFoundation name _PU + 'NSHashGet';
procedure NSHashInsert(table: Pointer { NSHashTable }; Pointer: Pointer); cdecl;
  external libFoundation name _PU + 'NSHashInsert';
procedure NSHashInsertKnownAbsent(table: Pointer { NSHashTable };
  Pointer: Pointer); cdecl;
  external libFoundation name _PU + 'NSHashInsertKnownAbsent';
function NSHashInsertIfAbsent(table: Pointer { NSHashTable }; Pointer: Pointer)
  : Pointer; cdecl; external libFoundation name _PU + 'NSHashInsertIfAbsent';
procedure NSHashRemove(table: Pointer { NSHashTable }; Pointer: Pointer); cdecl;
  external libFoundation name _PU + 'NSHashRemove';
function NSEnumerateHashTable(table: Pointer { NSHashTable } )
  : NSHashEnumerator; cdecl;
  external libFoundation name _PU + 'NSEnumerateHashTable';
function NSNextHashEnumeratorItem(enumerator: PNSHashEnumerator): Pointer;
  cdecl; external libFoundation name _PU + 'NSNextHashEnumeratorItem';
procedure NSEndHashTableEnumeration(enumerator: PNSHashEnumerator); cdecl;
  external libFoundation name _PU + 'NSEndHashTableEnumeration';
function NSCountHashTable(table: Pointer { NSHashTable } ): NSUInteger; cdecl;
  external libFoundation name _PU + 'NSCountHashTable';
function NSStringFromHashTable(table: Pointer { NSHashTable } )
  : Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSStringFromHashTable';
function NSAllHashTableObjects(table: Pointer { NSHashTable } )
  : Pointer { NSArray }; cdecl;
  external libFoundation name _PU + 'NSAllHashTableObjects';
function NSCreateHashTableWithZone(callBacks: NSHashTableCallBacks;
  capacity: NSUInteger; zone: Pointer): Pointer { NSHashTable }; cdecl;
  external libFoundation name _PU + 'NSCreateHashTableWithZone';
function NSCreateHashTable(callBacks: NSHashTableCallBacks;
  capacity: NSUInteger): Pointer { NSHashTable }; cdecl;
  external libFoundation name _PU + 'NSCreateHashTable';
procedure NSFreeMapTable(table: Pointer { NSMapTable } ); cdecl;
  external libFoundation name _PU + 'NSFreeMapTable';
procedure NSResetMapTable(table: Pointer { NSMapTable } ); cdecl;
  external libFoundation name _PU + 'NSResetMapTable';
function NSCompareMapTables(table1: Pointer { NSMapTable };
  table2: Pointer { NSMapTable } ): Boolean; cdecl;
  external libFoundation name _PU + 'NSCompareMapTables';
function NSCopyMapTableWithZone(table: Pointer { NSMapTable }; zone: Pointer)
  : Pointer { NSMapTable }; cdecl;
  external libFoundation name _PU + 'NSCopyMapTableWithZone';
function NSMapMember(table: Pointer { NSMapTable }; key: Pointer;
  originalKey: Pointer; value: Pointer): Boolean; cdecl;
  external libFoundation name _PU + 'NSMapMember';
function NSMapGet(table: Pointer { NSMapTable }; key: Pointer): Pointer; cdecl;
  external libFoundation name _PU + 'NSMapGet';
procedure NSMapInsert(table: Pointer { NSMapTable }; key: Pointer;
  value: Pointer); cdecl; external libFoundation name _PU + 'NSMapInsert';
procedure NSMapInsertKnownAbsent(table: Pointer { NSMapTable }; key: Pointer;
  value: Pointer); cdecl; external libFoundation name _PU +
  'NSMapInsertKnownAbsent';
function NSMapInsertIfAbsent(table: Pointer { NSMapTable }; key: Pointer;
  value: Pointer): Pointer; cdecl;
  external libFoundation name _PU + 'NSMapInsertIfAbsent';
procedure NSMapRemove(table: Pointer { NSMapTable }; key: Pointer); cdecl;
  external libFoundation name _PU + 'NSMapRemove';
function NSEnumerateMapTable(table: Pointer { NSMapTable } ): NSMapEnumerator;
  cdecl; external libFoundation name _PU + 'NSEnumerateMapTable';
function NSNextMapEnumeratorPair(enumerator: PNSMapEnumerator; key: Pointer;
  value: Pointer): Boolean; cdecl;
  external libFoundation name _PU + 'NSNextMapEnumeratorPair';
procedure NSEndMapTableEnumeration(enumerator: PNSMapEnumerator); cdecl;
  external libFoundation name _PU + 'NSEndMapTableEnumeration';
function NSCountMapTable(table: Pointer { NSMapTable } ): NSUInteger; cdecl;
  external libFoundation name _PU + 'NSCountMapTable';
function NSStringFromMapTable(table: Pointer { NSMapTable } )
  : Pointer { NSString }; cdecl;
  external libFoundation name _PU + 'NSStringFromMapTable';
function NSAllMapTableKeys(table: Pointer { NSMapTable } ): Pointer { NSArray };
  cdecl; external libFoundation name _PU + 'NSAllMapTableKeys';
function NSAllMapTableValues(table: Pointer { NSMapTable } )
  : Pointer { NSArray }; cdecl;
  external libFoundation name _PU + 'NSAllMapTableValues';
function NSCreateMapTableWithZone(keyCallBacks: NSMapTableKeyCallBacks;
  valueCallBacks: NSMapTableValueCallBacks; capacity: NSUInteger; zone: Pointer)
  : Pointer { NSMapTable }; cdecl;
  external libFoundation name _PU + 'NSCreateMapTableWithZone';
function NSCreateMapTable(keyCallBacks: NSMapTableKeyCallBacks;
  valueCallBacks: NSMapTableValueCallBacks; capacity: NSUInteger)
  : Pointer { NSMapTable }; cdecl;
  external libFoundation name _PU + 'NSCreateMapTable';

// Utility method for loading an pointer constant from a framework
function CocoaPointerConst(Fwk: string; ConstStr: string): Pointer;
// Utility method for loading an NSString constant from a framework
function CocoaNSStringConst(Fwk: string; ConstStr: string): NSString;

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  FoundationModule: THandle;

{$ENDIF IOS}

var
  FrameworkDic: TDictionary<string, THandle>;

procedure FreeFrameworkDic;
var
  Fwk: THandle;
begin
  if FrameworkDic <> nil then
  begin
    for Fwk in FrameworkDic.Values do
      FreeLibrary(Fwk);
    FrameworkDic.Free;
  end;
end;

function CocoaPointerConst(Fwk: string; ConstStr: string): Pointer;
var
  FrameworkMod: HMODULE;
begin
  if FrameworkDic = nil then
    FrameworkDic := TDictionary<string, THandle>.create;

  result := nil;
  FrameworkMod := 0;

  if not FrameworkDic.TryGetValue(Fwk, FrameworkMod) then
  begin
    FrameworkMod := LoadLibrary(PWideChar(Fwk));
    FrameworkDic.Add(Fwk, FrameworkMod);
  end;

  if FrameworkMod <> 0 then
    result := GetProcAddress(FrameworkMod, PWideChar(ConstStr));
end;

function CocoaNSStringConst(Fwk: string; ConstStr: string): NSString;
var
  obj: Pointer;
begin
  obj := Pointer(CocoaPointerConst(Fwk, ConstStr)^);
  if obj <> nil then
    result := TNSString.Wrap(obj)
  else
    result := nil;
end;

function CocoaConst(Fwk: string; ConstStr: string): Pointer;
begin
  result := Pointer(CocoaPointerConst(Fwk, ConstStr)^);
end;

function NSItemProviderPreferredImageSizeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSItemProviderPreferredImageSizeKey');
end;

function NSExtensionJavaScriptPreprocessingResultsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSExtensionJavaScriptPreprocessingResultsKey');
end;

function NSExtensionJavaScriptFinalizeArgumentKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSExtensionJavaScriptFinalizeArgumentKey');
end;

function NSItemProviderErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSItemProviderErrorDomain');
end;

function NSLoadedClasses: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLoadedClasses');
end;

function NSGregorianCalendar: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSGregorianCalendar');
end;

function NSBuddhistCalendar: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSBuddhistCalendar');
end;

function NSChineseCalendar: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSChineseCalendar');
end;

function NSHebrewCalendar: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHebrewCalendar');
end;

function NSIslamicCalendar: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSIslamicCalendar');
end;

function NSIslamicCivilCalendar: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSIslamicCivilCalendar');
end;

function NSJapaneseCalendar: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSJapaneseCalendar');
end;

function NSRepublicOfChinaCalendar: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSRepublicOfChinaCalendar');
end;

function NSPersianCalendar: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSPersianCalendar');
end;

function NSIndianCalendar: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSIndianCalendar');
end;

function NSISO8601Calendar: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSISO8601Calendar');
end;

function NSPersonNameComponentKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSPersonNameComponentKey');
end;

function NSPersonNameComponentGivenName: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSPersonNameComponentGivenName');
end;

function NSPersonNameComponentFamilyName: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSPersonNameComponentFamilyName');
end;

function NSPersonNameComponentMiddleName: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSPersonNameComponentMiddleName');
end;

function NSPersonNameComponentPrefix: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSPersonNameComponentPrefix');
end;

function NSPersonNameComponentSuffix: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSPersonNameComponentSuffix');
end;

function NSPersonNameComponentNickname: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSPersonNameComponentNickname');
end;

function NSPersonNameComponentDelimiter: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSPersonNameComponentDelimiter');
end;

function NSAssertionHandlerKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSAssertionHandlerKey');
end;

function NSFileHandleNotificationDataItem: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSFileHandleNotificationDataItem');
end;

function NSFileHandleNotificationFileHandleItem: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSFileHandleNotificationFileHandleItem');
end;

function NSFileHandleNotificationMonitorModes: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSFileHandleNotificationMonitorModes');
end;

function NSURLFileScheme: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileScheme');
end;

function NSFileManagerUnmountDissentingProcessIdentifierErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSFileManagerUnmountDissentingProcessIdentifierErrorKey');
end;

function NSKeyedArchiveRootObjectKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSKeyedArchiveRootObjectKey');
end;

function NSURLProtectionSpaceHTTP: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLProtectionSpaceHTTP');
end;

function NSURLProtectionSpaceHTTPS: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLProtectionSpaceHTTPS');
end;

function NSURLProtectionSpaceFTP: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLProtectionSpaceFTP');
end;

function NSURLProtectionSpaceHTTPProxy: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLProtectionSpaceHTTPProxy');
end;

function NSURLProtectionSpaceHTTPSProxy: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLProtectionSpaceHTTPSProxy');
end;

function NSURLProtectionSpaceFTPProxy: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLProtectionSpaceFTPProxy');
end;

function NSURLProtectionSpaceSOCKSProxy: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLProtectionSpaceSOCKSProxy');
end;

function NSURLAuthenticationMethodDefault: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLAuthenticationMethodDefault');
end;

function NSURLAuthenticationMethodHTTPBasic: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLAuthenticationMethodHTTPBasic');
end;

function NSURLAuthenticationMethodHTTPDigest: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLAuthenticationMethodHTTPDigest');
end;

function NSURLAuthenticationMethodHTMLForm: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLAuthenticationMethodHTMLForm');
end;

function NSURLAuthenticationMethodNTLM: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLAuthenticationMethodNTLM');
end;

function NSURLAuthenticationMethodNegotiate: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLAuthenticationMethodNegotiate');
end;

function NSURLAuthenticationMethodClientCertificate: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLAuthenticationMethodClientCertificate');
end;

function NSURLAuthenticationMethodServerTrust: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLAuthenticationMethodServerTrust');
end;

function NSURLCredentialStorageRemoveSynchronizableCredentials: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLCredentialStorageRemoveSynchronizableCredentials');
end;

function NSURLErrorFailingURLErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLErrorFailingURLErrorKey');
end;

function NSURLErrorFailingURLStringErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLErrorFailingURLStringErrorKey');
end;

function NSErrorFailingURLStringKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSErrorFailingURLStringKey');
end;

function NSURLErrorFailingURLPeerTrustErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLErrorFailingURLPeerTrustErrorKey');
end;

function NSURLErrorBackgroundTaskCancelledReasonKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLErrorBackgroundTaskCancelledReasonKey');
end;

function NSGlobalDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSGlobalDomain');
end;

function NSArgumentDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSArgumentDomain');
end;

function NSRegistrationDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSRegistrationDomain');
end;

function NSExtensionItemsAndErrorsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSExtensionItemsAndErrorsKey');
end;

function NSExtensionHostWillEnterForegroundNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSExtensionHostWillEnterForegroundNotification');
end;

function NSExtensionHostDidEnterBackgroundNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSExtensionHostDidEnterBackgroundNotification');
end;

function NSExtensionHostWillResignActiveNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSExtensionHostWillResignActiveNotification');
end;

function NSExtensionHostDidBecomeActiveNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSExtensionHostDidBecomeActiveNotification');
end;

function NSExtensionItemAttributedTitleKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSExtensionItemAttributedTitleKey');
end;

function NSExtensionItemAttributedContentTextKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSExtensionItemAttributedContentTextKey');
end;

function NSExtensionItemAttachmentsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSExtensionItemAttachmentsKey');
end;

function NSMetadataItemFSNameKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemFSNameKey');
end;

function NSMetadataItemDisplayNameKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemDisplayNameKey');
end;

function NSMetadataItemURLKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemURLKey');
end;

function NSMetadataItemPathKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemPathKey');
end;

function NSMetadataItemFSSizeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemFSSizeKey');
end;

function NSMetadataItemFSCreationDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemFSCreationDateKey');
end;

function NSMetadataItemFSContentChangeDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemFSContentChangeDateKey');
end;

function NSMetadataItemContentTypeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemContentTypeKey');
end;

function NSMetadataItemContentTypeTreeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemContentTypeTreeKey');
end;

function NSMetadataItemIsUbiquitousKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemIsUbiquitousKey');
end;

function NSMetadataUbiquitousItemHasUnresolvedConflictsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemHasUnresolvedConflictsKey');
end;

function NSMetadataUbiquitousItemIsDownloadedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemIsDownloadedKey');
end;

function NSMetadataUbiquitousItemDownloadingStatusKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemDownloadingStatusKey');
end;

function NSMetadataUbiquitousItemDownloadingStatusNotDownloaded: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemDownloadingStatusNotDownloaded');
end;

function NSMetadataUbiquitousItemDownloadingStatusDownloaded: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemDownloadingStatusDownloaded');
end;

function NSMetadataUbiquitousItemDownloadingStatusCurrent: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemDownloadingStatusCurrent');
end;

function NSMetadataUbiquitousItemIsDownloadingKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemIsDownloadingKey');
end;

function NSMetadataUbiquitousItemIsUploadedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemIsUploadedKey');
end;

function NSMetadataUbiquitousItemIsUploadingKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemIsUploadingKey');
end;

function NSMetadataUbiquitousItemPercentDownloadedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemPercentDownloadedKey');
end;

function NSMetadataUbiquitousItemPercentUploadedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemPercentUploadedKey');
end;

function NSMetadataUbiquitousItemDownloadingErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemDownloadingErrorKey');
end;

function NSMetadataUbiquitousItemUploadingErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemUploadingErrorKey');
end;

function NSMetadataUbiquitousItemDownloadRequestedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemDownloadRequestedKey');
end;

function NSMetadataUbiquitousItemIsExternalDocumentKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemIsExternalDocumentKey');
end;

function NSMetadataUbiquitousItemContainerDisplayNameKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemContainerDisplayNameKey');
end;

function NSMetadataUbiquitousItemURLInLocalContainerKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemURLInLocalContainerKey');
end;

function NSMetadataUbiquitousItemIsSharedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousItemIsSharedKey');
end;

function NSMetadataUbiquitousSharedItemCurrentUserRoleKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousSharedItemCurrentUserRoleKey');
end;

function NSMetadataUbiquitousSharedItemCurrentUserPermissionsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousSharedItemCurrentUserPermissionsKey');
end;

function NSMetadataUbiquitousSharedItemOwnerNameComponentsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousSharedItemOwnerNameComponentsKey');
end;

function NSMetadataUbiquitousSharedItemMostRecentEditorNameComponentsKey
  : NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousSharedItemMostRecentEditorNameComponentsKey');
end;

function NSMetadataUbiquitousSharedItemRoleOwner: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousSharedItemRoleOwner');
end;

function NSMetadataUbiquitousSharedItemRoleParticipant: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousSharedItemRoleParticipant');
end;

function NSMetadataUbiquitousSharedItemPermissionsReadOnly: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousSharedItemPermissionsReadOnly');
end;

function NSMetadataUbiquitousSharedItemPermissionsReadWrite: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataUbiquitousSharedItemPermissionsReadWrite');
end;

function NSMetadataItemAttributeChangeDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemAttributeChangeDateKey');
end;

function NSMetadataItemKeywordsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemKeywordsKey');
end;

function NSMetadataItemTitleKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemTitleKey');
end;

function NSMetadataItemAuthorsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemAuthorsKey');
end;

function NSMetadataItemEditorsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemEditorsKey');
end;

function NSMetadataItemParticipantsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemParticipantsKey');
end;

function NSMetadataItemProjectsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemProjectsKey');
end;

function NSMetadataItemDownloadedDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemDownloadedDateKey');
end;

function NSMetadataItemWhereFromsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemWhereFromsKey');
end;

function NSMetadataItemCommentKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemCommentKey');
end;

function NSMetadataItemCopyrightKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemCopyrightKey');
end;

function NSMetadataItemLastUsedDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemLastUsedDateKey');
end;

function NSMetadataItemContentCreationDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemContentCreationDateKey');
end;

function NSMetadataItemContentModificationDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemContentModificationDateKey');
end;

function NSMetadataItemDateAddedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemDateAddedKey');
end;

function NSMetadataItemDurationSecondsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemDurationSecondsKey');
end;

function NSMetadataItemContactKeywordsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemContactKeywordsKey');
end;

function NSMetadataItemVersionKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemVersionKey');
end;

function NSMetadataItemPixelHeightKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemPixelHeightKey');
end;

function NSMetadataItemPixelWidthKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemPixelWidthKey');
end;

function NSMetadataItemPixelCountKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemPixelCountKey');
end;

function NSMetadataItemColorSpaceKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemColorSpaceKey');
end;

function NSMetadataItemBitsPerSampleKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemBitsPerSampleKey');
end;

function NSMetadataItemFlashOnOffKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemFlashOnOffKey');
end;

function NSMetadataItemFocalLengthKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemFocalLengthKey');
end;

function NSMetadataItemAcquisitionMakeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemAcquisitionMakeKey');
end;

function NSMetadataItemAcquisitionModelKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemAcquisitionModelKey');
end;

function NSMetadataItemISOSpeedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemISOSpeedKey');
end;

function NSMetadataItemOrientationKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemOrientationKey');
end;

function NSMetadataItemLayerNamesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemLayerNamesKey');
end;

function NSMetadataItemWhiteBalanceKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemWhiteBalanceKey');
end;

function NSMetadataItemApertureKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemApertureKey');
end;

function NSMetadataItemProfileNameKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemProfileNameKey');
end;

function NSMetadataItemResolutionWidthDPIKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemResolutionWidthDPIKey');
end;

function NSMetadataItemResolutionHeightDPIKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemResolutionHeightDPIKey');
end;

function NSMetadataItemExposureModeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemExposureModeKey');
end;

function NSMetadataItemExposureTimeSecondsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemExposureTimeSecondsKey');
end;

function NSMetadataItemEXIFVersionKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemEXIFVersionKey');
end;

function NSMetadataItemCameraOwnerKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemCameraOwnerKey');
end;

function NSMetadataItemFocalLength35mmKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemFocalLength35mmKey');
end;

function NSMetadataItemLensModelKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemLensModelKey');
end;

function NSMetadataItemEXIFGPSVersionKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemEXIFGPSVersionKey');
end;

function NSMetadataItemAltitudeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemAltitudeKey');
end;

function NSMetadataItemLatitudeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemLatitudeKey');
end;

function NSMetadataItemLongitudeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemLongitudeKey');
end;

function NSMetadataItemSpeedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemSpeedKey');
end;

function NSMetadataItemTimestampKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemTimestampKey');
end;

function NSMetadataItemGPSTrackKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemGPSTrackKey');
end;

function NSMetadataItemImageDirectionKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemImageDirectionKey');
end;

function NSMetadataItemNamedLocationKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemNamedLocationKey');
end;

function NSMetadataItemGPSStatusKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemGPSStatusKey');
end;

function NSMetadataItemGPSMeasureModeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemGPSMeasureModeKey');
end;

function NSMetadataItemGPSDOPKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemGPSDOPKey');
end;

function NSMetadataItemGPSMapDatumKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemGPSMapDatumKey');
end;

function NSMetadataItemGPSDestLatitudeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemGPSDestLatitudeKey');
end;

function NSMetadataItemGPSDestLongitudeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemGPSDestLongitudeKey');
end;

function NSMetadataItemGPSDestBearingKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemGPSDestBearingKey');
end;

function NSMetadataItemGPSDestDistanceKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemGPSDestDistanceKey');
end;

function NSMetadataItemGPSProcessingMethodKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemGPSProcessingMethodKey');
end;

function NSMetadataItemGPSAreaInformationKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemGPSAreaInformationKey');
end;

function NSMetadataItemGPSDateStampKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemGPSDateStampKey');
end;

function NSMetadataItemGPSDifferentalKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemGPSDifferentalKey');
end;

function NSMetadataItemCodecsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemCodecsKey');
end;

function NSMetadataItemMediaTypesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemMediaTypesKey');
end;

function NSMetadataItemStreamableKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemStreamableKey');
end;

function NSMetadataItemTotalBitRateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemTotalBitRateKey');
end;

function NSMetadataItemVideoBitRateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemVideoBitRateKey');
end;

function NSMetadataItemAudioBitRateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemAudioBitRateKey');
end;

function NSMetadataItemDeliveryTypeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemDeliveryTypeKey');
end;

function NSMetadataItemAlbumKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemAlbumKey');
end;

function NSMetadataItemHasAlphaChannelKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemHasAlphaChannelKey');
end;

function NSMetadataItemRedEyeOnOffKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemRedEyeOnOffKey');
end;

function NSMetadataItemMeteringModeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemMeteringModeKey');
end;

function NSMetadataItemMaxApertureKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemMaxApertureKey');
end;

function NSMetadataItemFNumberKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemFNumberKey');
end;

function NSMetadataItemExposureProgramKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemExposureProgramKey');
end;

function NSMetadataItemExposureTimeStringKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemExposureTimeStringKey');
end;

function NSMetadataItemHeadlineKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemHeadlineKey');
end;

function NSMetadataItemInstructionsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemInstructionsKey');
end;

function NSMetadataItemCityKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemCityKey');
end;

function NSMetadataItemStateOrProvinceKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemStateOrProvinceKey');
end;

function NSMetadataItemCountryKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemCountryKey');
end;

function NSMetadataItemTextContentKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemTextContentKey');
end;

function NSMetadataItemAudioSampleRateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemAudioSampleRateKey');
end;

function NSMetadataItemAudioChannelCountKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemAudioChannelCountKey');
end;

function NSMetadataItemTempoKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemTempoKey');
end;

function NSMetadataItemKeySignatureKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemKeySignatureKey');
end;

function NSMetadataItemTimeSignatureKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemTimeSignatureKey');
end;

function NSMetadataItemAudioEncodingApplicationKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemAudioEncodingApplicationKey');
end;

function NSMetadataItemComposerKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemComposerKey');
end;

function NSMetadataItemLyricistKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemLyricistKey');
end;

function NSMetadataItemAudioTrackNumberKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemAudioTrackNumberKey');
end;

function NSMetadataItemRecordingDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemRecordingDateKey');
end;

function NSMetadataItemMusicalGenreKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemMusicalGenreKey');
end;

function NSMetadataItemIsGeneralMIDISequenceKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemIsGeneralMIDISequenceKey');
end;

function NSMetadataItemRecordingYearKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemRecordingYearKey');
end;

function NSMetadataItemOrganizationsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemOrganizationsKey');
end;

function NSMetadataItemLanguagesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemLanguagesKey');
end;

function NSMetadataItemRightsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemRightsKey');
end;

function NSMetadataItemPublishersKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemPublishersKey');
end;

function NSMetadataItemContributorsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemContributorsKey');
end;

function NSMetadataItemCoverageKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemCoverageKey');
end;

function NSMetadataItemSubjectKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemSubjectKey');
end;

function NSMetadataItemThemeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemThemeKey');
end;

function NSMetadataItemDescriptionKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemDescriptionKey');
end;

function NSMetadataItemIdentifierKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemIdentifierKey');
end;

function NSMetadataItemAudiencesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemAudiencesKey');
end;

function NSMetadataItemNumberOfPagesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemNumberOfPagesKey');
end;

function NSMetadataItemPageWidthKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemPageWidthKey');
end;

function NSMetadataItemPageHeightKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemPageHeightKey');
end;

function NSMetadataItemSecurityMethodKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemSecurityMethodKey');
end;

function NSMetadataItemCreatorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemCreatorKey');
end;

function NSMetadataItemEncodingApplicationsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemEncodingApplicationsKey');
end;

function NSMetadataItemDueDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemDueDateKey');
end;

function NSMetadataItemStarRatingKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemStarRatingKey');
end;

function NSMetadataItemPhoneNumbersKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemPhoneNumbersKey');
end;

function NSMetadataItemEmailAddressesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemEmailAddressesKey');
end;

function NSMetadataItemInstantMessageAddressesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemInstantMessageAddressesKey');
end;

function NSMetadataItemKindKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemKindKey');
end;

function NSMetadataItemRecipientsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemRecipientsKey');
end;

function NSMetadataItemFinderCommentKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemFinderCommentKey');
end;

function NSMetadataItemFontsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemFontsKey');
end;

function NSMetadataItemAppleLoopsRootKeyKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemAppleLoopsRootKeyKey');
end;

function NSMetadataItemAppleLoopsKeyFilterTypeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemAppleLoopsKeyFilterTypeKey');
end;

function NSMetadataItemAppleLoopsLoopModeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemAppleLoopsLoopModeKey');
end;

function NSMetadataItemAppleLoopDescriptorsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemAppleLoopDescriptorsKey');
end;

function NSMetadataItemMusicalInstrumentCategoryKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemMusicalInstrumentCategoryKey');
end;

function NSMetadataItemMusicalInstrumentNameKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemMusicalInstrumentNameKey');
end;

function NSMetadataItemCFBundleIdentifierKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemCFBundleIdentifierKey');
end;

function NSMetadataItemInformationKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemInformationKey');
end;

function NSMetadataItemDirectorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemDirectorKey');
end;

function NSMetadataItemProducerKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemProducerKey');
end;

function NSMetadataItemGenreKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemGenreKey');
end;

function NSMetadataItemPerformersKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemPerformersKey');
end;

function NSMetadataItemOriginalFormatKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemOriginalFormatKey');
end;

function NSMetadataItemOriginalSourceKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemOriginalSourceKey');
end;

function NSMetadataItemAuthorEmailAddressesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemAuthorEmailAddressesKey');
end;

function NSMetadataItemRecipientEmailAddressesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemRecipientEmailAddressesKey');
end;

function NSMetadataItemAuthorAddressesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemAuthorAddressesKey');
end;

function NSMetadataItemRecipientAddressesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemRecipientAddressesKey');
end;

function NSMetadataItemIsLikelyJunkKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataItemIsLikelyJunkKey');
end;

function NSMetadataItemExecutableArchitecturesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemExecutableArchitecturesKey');
end;

function NSMetadataItemExecutablePlatformKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemExecutablePlatformKey');
end;

function NSMetadataItemApplicationCategoriesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemApplicationCategoriesKey');
end;

function NSMetadataItemIsApplicationManagedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataItemIsApplicationManagedKey');
end;

function NSMetadataQueryUpdateAddedItemsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryUpdateAddedItemsKey');
end;

function NSMetadataQueryUpdateChangedItemsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryUpdateChangedItemsKey');
end;

function NSMetadataQueryUpdateRemovedItemsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryUpdateRemovedItemsKey');
end;

function NSMetadataQueryResultContentRelevanceAttribute: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryResultContentRelevanceAttribute');
end;

function NSMetadataQueryUserHomeScope: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataQueryUserHomeScope');
end;

function NSMetadataQueryLocalComputerScope: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryLocalComputerScope');
end;

function NSMetadataQueryNetworkScope: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMetadataQueryNetworkScope');
end;

function NSMetadataQueryIndexedLocalComputerScope: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryIndexedLocalComputerScope');
end;

function NSMetadataQueryIndexedNetworkScope: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryIndexedNetworkScope');
end;

function NSMetadataQueryUbiquitousDocumentsScope: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryUbiquitousDocumentsScope');
end;

function NSMetadataQueryUbiquitousDataScope: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryUbiquitousDataScope');
end;

function NSMetadataQueryAccessibleUbiquitousExternalDocumentsScope: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryAccessibleUbiquitousExternalDocumentsScope');
end;

function NSNetServicesErrorCode: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSNetServicesErrorCode');
end;

function NSUbiquitousKeyValueStoreChangeReasonKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUbiquitousKeyValueStoreChangeReasonKey');
end;

function NSUbiquitousKeyValueStoreChangedKeysKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUbiquitousKeyValueStoreChangedKeysKey');
end;

function NSUndoManagerGroupIsDiscardableKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUndoManagerGroupIsDiscardableKey');
end;

function NSURLSessionDownloadTaskResumeData: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLSessionDownloadTaskResumeData');
end;

function NSUserActivityTypeBrowsingWeb: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSUserActivityTypeBrowsingWeb');
end;

function NSFoundationVersionNumber: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFoundationVersionNumber');
end;

function NSStringTransformLatinToKatakana: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringTransformLatinToKatakana');
end;

function NSStringTransformLatinToHiragana: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringTransformLatinToHiragana');
end;

function NSStringTransformLatinToHangul: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStringTransformLatinToHangul');
end;

function NSStringTransformLatinToArabic: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStringTransformLatinToArabic');
end;

function NSStringTransformLatinToHebrew: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStringTransformLatinToHebrew');
end;

function NSStringTransformLatinToThai: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStringTransformLatinToThai');
end;

function NSStringTransformLatinToCyrillic: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringTransformLatinToCyrillic');
end;

function NSStringTransformLatinToGreek: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStringTransformLatinToGreek');
end;

function NSStringTransformToLatin: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStringTransformToLatin');
end;

function NSStringTransformMandarinToLatin: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringTransformMandarinToLatin');
end;

function NSStringTransformHiraganaToKatakana: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringTransformHiraganaToKatakana');
end;

function NSStringTransformFullwidthToHalfwidth: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringTransformFullwidthToHalfwidth');
end;

function NSStringTransformToXMLHex: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStringTransformToXMLHex');
end;

function NSStringTransformToUnicodeName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStringTransformToUnicodeName');
end;

function NSStringTransformStripCombiningMarks: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringTransformStripCombiningMarks');
end;

function NSStringTransformStripDiacritics: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringTransformStripDiacritics');
end;

function NSStringEncodingDetectionSuggestedEncodingsKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringEncodingDetectionSuggestedEncodingsKey');
end;

function NSStringEncodingDetectionDisallowedEncodingsKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringEncodingDetectionDisallowedEncodingsKey');
end;

function NSStringEncodingDetectionUseOnlySuggestedEncodingsKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringEncodingDetectionUseOnlySuggestedEncodingsKey');
end;

function NSStringEncodingDetectionAllowLossyKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringEncodingDetectionAllowLossyKey');
end;

function NSStringEncodingDetectionFromWindowsKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringEncodingDetectionFromWindowsKey');
end;

function NSStringEncodingDetectionLossySubstitutionKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringEncodingDetectionLossySubstitutionKey');
end;

function NSStringEncodingDetectionLikelyLanguageKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStringEncodingDetectionLikelyLanguageKey');
end;

function NSCharacterConversionException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSCharacterConversionException');
end;

function NSParseErrorException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSParseErrorException');
end;

function NSProgressEstimatedTimeRemainingKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSProgressEstimatedTimeRemainingKey');
end;

function NSProgressThroughputKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSProgressThroughputKey');
end;

function NSProgressKindFile: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSProgressKindFile');
end;

function NSProgressFileOperationKindKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSProgressFileOperationKindKey');
end;

function NSProgressFileOperationKindDownloading: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSProgressFileOperationKindDownloading');
end;

function NSProgressFileOperationKindDecompressingAfterDownloading: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSProgressFileOperationKindDecompressingAfterDownloading');
end;

function NSProgressFileOperationKindReceiving: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSProgressFileOperationKindReceiving');
end;

function NSProgressFileOperationKindCopying: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSProgressFileOperationKindCopying');
end;

function NSProgressFileOperationKindUploading: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSProgressFileOperationKindUploading');
end;

function NSProgressFileOperationKindDuplicating: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSProgressFileOperationKindDuplicating');
end;

function NSProgressFileURLKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSProgressFileURLKey');
end;

function NSProgressFileTotalCountKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSProgressFileTotalCountKey');
end;

function NSProgressFileCompletedCountKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSProgressFileCompletedCountKey');
end;

function NSProgressFileAnimationImageKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSProgressFileAnimationImageKey');
end;

function NSProgressFileAnimationImageOriginalRectKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSProgressFileAnimationImageOriginalRectKey');
end;

function NSProgressFileIconKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSProgressFileIconKey');
end;

function NSBundleDidLoadNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSBundleDidLoadNotification');
end;

function NSBundleResourceRequestLowDiskSpaceNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSBundleResourceRequestLowDiskSpaceNotification');
end;

function NSBundleResourceRequestLoadingPriorityUrgent: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSBundleResourceRequestLoadingPriorityUrgent');
end;

function NSSystemClockDidChangeNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSSystemClockDidChangeNotification');
end;

function NSCalendarIdentifierGregorian: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSCalendarIdentifierGregorian');
end;

function NSCalendarIdentifierBuddhist: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSCalendarIdentifierBuddhist');
end;

function NSCalendarIdentifierChinese: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSCalendarIdentifierChinese');
end;

function NSCalendarIdentifierCoptic: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSCalendarIdentifierCoptic');
end;

function NSCalendarIdentifierEthiopicAmeteMihret: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSCalendarIdentifierEthiopicAmeteMihret');
end;

function NSCalendarIdentifierEthiopicAmeteAlem: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSCalendarIdentifierEthiopicAmeteAlem');
end;

function NSCalendarIdentifierHebrew: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSCalendarIdentifierHebrew');
end;

function NSCalendarIdentifierISO8601: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSCalendarIdentifierISO8601');
end;

function NSCalendarIdentifierIndian: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSCalendarIdentifierIndian');
end;

function NSCalendarIdentifierIslamic: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSCalendarIdentifierIslamic');
end;

function NSCalendarIdentifierIslamicCivil: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSCalendarIdentifierIslamicCivil');
end;

function NSCalendarIdentifierJapanese: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSCalendarIdentifierJapanese');
end;

function NSCalendarIdentifierPersian: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSCalendarIdentifierPersian');
end;

function NSCalendarIdentifierRepublicOfChina: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSCalendarIdentifierRepublicOfChina');
end;

function NSCalendarIdentifierIslamicTabular: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSCalendarIdentifierIslamicTabular');
end;

function NSCalendarIdentifierIslamicUmmAlQura: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSCalendarIdentifierIslamicUmmAlQura');
end;

function NSCalendarDayChangedNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSCalendarDayChangedNotification');
end;

function NSInlinePresentationIntentAttributeName: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSInlinePresentationIntentAttributeName');
end;

function NSAlternateDescriptionAttributeName: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSAlternateDescriptionAttributeName');
end;

function NSImageURLAttributeName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSImageURLAttributeName');
end;

function NSLanguageIdentifierAttributeName: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSLanguageIdentifierAttributeName');
end;

function NSMarkdownSourcePositionAttributeName: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSMarkdownSourcePositionAttributeName');
end;

function NSReplacementIndexAttributeName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSReplacementIndexAttributeName');
end;

function NSMorphologyAttributeName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSMorphologyAttributeName');
end;

function NSInflectionRuleAttributeName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSInflectionRuleAttributeName');
end;

function NSInflectionAlternativeAttributeName: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSInflectionAlternativeAttributeName');
end;

function NSPresentationIntentAttributeName: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSPresentationIntentAttributeName');
end;

function NSCurrentLocaleDidChangeNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSCurrentLocaleDidChangeNotification');
end;

function NSLocaleIdentifier: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleIdentifier');
end;

function NSLocaleLanguageCode: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleLanguageCode');
end;

function NSLocaleCountryCode: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleCountryCode');
end;

function NSLocaleScriptCode: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleScriptCode');
end;

function NSLocaleVariantCode: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleVariantCode');
end;

function NSLocaleExemplarCharacterSet: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleExemplarCharacterSet');
end;

function NSLocaleCalendar: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleCalendar');
end;

function NSLocaleCollationIdentifier: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleCollationIdentifier');
end;

function NSLocaleUsesMetricSystem: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleUsesMetricSystem');
end;

function NSLocaleMeasurementSystem: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleMeasurementSystem');
end;

function NSLocaleDecimalSeparator: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleDecimalSeparator');
end;

function NSLocaleGroupingSeparator: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleGroupingSeparator');
end;

function NSLocaleCurrencySymbol: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleCurrencySymbol');
end;

function NSLocaleCurrencyCode: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleCurrencyCode');
end;

function NSLocaleCollatorIdentifier: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocaleCollatorIdentifier');
end;

function NSLocaleQuotationBeginDelimiterKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSLocaleQuotationBeginDelimiterKey');
end;

function NSLocaleQuotationEndDelimiterKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSLocaleQuotationEndDelimiterKey');
end;

function NSLocaleAlternateQuotationBeginDelimiterKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSLocaleAlternateQuotationBeginDelimiterKey');
end;

function NSLocaleAlternateQuotationEndDelimiterKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSLocaleAlternateQuotationEndDelimiterKey');
end;

function NSGenericException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSGenericException');
end;

function NSRangeException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSRangeException');
end;

function NSInvalidArgumentException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSInvalidArgumentException');
end;

function NSInternalInconsistencyException: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSInternalInconsistencyException');
end;

function NSMallocException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSMallocException');
end;

function NSObjectInaccessibleException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSObjectInaccessibleException');
end;

function NSObjectNotAvailableException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSObjectNotAvailableException');
end;

function NSDestinationInvalidException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSDestinationInvalidException');
end;

function NSPortTimeoutException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSPortTimeoutException');
end;

function NSInvalidSendPortException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSInvalidSendPortException');
end;

function NSInvalidReceivePortException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSInvalidReceivePortException');
end;

function NSPortSendException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSPortSendException');
end;

function NSPortReceiveException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSPortReceiveException');
end;

function NSOldStyleException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSOldStyleException');
end;

function NSInconsistentArchiveException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSInconsistentArchiveException');
end;

function NSDecimalNumberExactnessException: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSDecimalNumberExactnessException');
end;

function NSDecimalNumberOverflowException: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSDecimalNumberOverflowException');
end;

function NSDecimalNumberUnderflowException: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSDecimalNumberUnderflowException');
end;

function NSDecimalNumberDivideByZeroException: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSDecimalNumberDivideByZeroException');
end;

function NSCocoaErrorDomain: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSCocoaErrorDomain');
end;

function NSPOSIXErrorDomain: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSPOSIXErrorDomain');
end;

function NSOSStatusErrorDomain: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSOSStatusErrorDomain');
end;

function NSMachErrorDomain: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSMachErrorDomain');
end;

function NSUnderlyingErrorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSUnderlyingErrorKey');
end;

function NSMultipleUnderlyingErrorsKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSMultipleUnderlyingErrorsKey');
end;

function NSLocalizedDescriptionKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocalizedDescriptionKey');
end;

function NSLocalizedFailureReasonErrorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSLocalizedFailureReasonErrorKey');
end;

function NSLocalizedRecoverySuggestionErrorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSLocalizedRecoverySuggestionErrorKey');
end;

function NSLocalizedRecoveryOptionsErrorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSLocalizedRecoveryOptionsErrorKey');
end;

function NSRecoveryAttempterErrorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSRecoveryAttempterErrorKey');
end;

function NSHelpAnchorErrorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHelpAnchorErrorKey');
end;

function NSDebugDescriptionErrorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSDebugDescriptionErrorKey');
end;

function NSLocalizedFailureErrorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLocalizedFailureErrorKey');
end;

function NSStringEncodingErrorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStringEncodingErrorKey');
end;

function NSURLErrorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLErrorKey');
end;

function NSFilePathErrorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFilePathErrorKey');
end;

function NSDefaultRunLoopMode: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSDefaultRunLoopMode');
end;

function NSRunLoopCommonModes: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSRunLoopCommonModes');
end;

function NSFileHandleOperationException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileHandleOperationException');
end;

function NSFileHandleReadCompletionNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSFileHandleReadCompletionNotification');
end;

function NSFileHandleReadToEndOfFileCompletionNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSFileHandleReadToEndOfFileCompletionNotification');
end;

function NSFileHandleConnectionAcceptedNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSFileHandleConnectionAcceptedNotification');
end;

function NSFileHandleDataAvailableNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSFileHandleDataAvailableNotification');
end;

function NSURLKeysOfUnsetValuesKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLKeysOfUnsetValuesKey');
end;

function NSURLNameKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLNameKey');
end;

function NSURLLocalizedNameKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLLocalizedNameKey');
end;

function NSURLIsRegularFileKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsRegularFileKey');
end;

function NSURLIsDirectoryKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsDirectoryKey');
end;

function NSURLIsSymbolicLinkKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsSymbolicLinkKey');
end;

function NSURLIsVolumeKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsVolumeKey');
end;

function NSURLIsPackageKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsPackageKey');
end;

function NSURLIsApplicationKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsApplicationKey');
end;

function NSURLApplicationIsScriptableKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLApplicationIsScriptableKey');
end;

function NSURLIsSystemImmutableKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsSystemImmutableKey');
end;

function NSURLIsUserImmutableKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsUserImmutableKey');
end;

function NSURLIsHiddenKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsHiddenKey');
end;

function NSURLHasHiddenExtensionKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLHasHiddenExtensionKey');
end;

function NSURLCreationDateKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLCreationDateKey');
end;

function NSURLContentAccessDateKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLContentAccessDateKey');
end;

function NSURLContentModificationDateKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLContentModificationDateKey');
end;

function NSURLAttributeModificationDateKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLAttributeModificationDateKey');
end;

function NSURLLinkCountKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLLinkCountKey');
end;

function NSURLParentDirectoryURLKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLParentDirectoryURLKey');
end;

function NSURLVolumeURLKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeURLKey');
end;

function NSURLTypeIdentifierKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLTypeIdentifierKey');
end;

function NSURLContentTypeKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLContentTypeKey');
end;

function NSURLLocalizedTypeDescriptionKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLLocalizedTypeDescriptionKey');
end;

function NSURLLabelNumberKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLLabelNumberKey');
end;

function NSURLLabelColorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLLabelColorKey');
end;

function NSURLLocalizedLabelKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLLocalizedLabelKey');
end;

function NSURLEffectiveIconKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLEffectiveIconKey');
end;

function NSURLCustomIconKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLCustomIconKey');
end;

function NSURLFileResourceIdentifierKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileResourceIdentifierKey');
end;

function NSURLVolumeIdentifierKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeIdentifierKey');
end;

function NSURLPreferredIOBlockSizeKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLPreferredIOBlockSizeKey');
end;

function NSURLIsReadableKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsReadableKey');
end;

function NSURLIsWritableKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsWritableKey');
end;

function NSURLIsExecutableKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsExecutableKey');
end;

function NSURLFileSecurityKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileSecurityKey');
end;

function NSURLIsExcludedFromBackupKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsExcludedFromBackupKey');
end;

function NSURLTagNamesKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLTagNamesKey');
end;

function NSURLPathKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLPathKey');
end;

function NSURLCanonicalPathKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLCanonicalPathKey');
end;

function NSURLIsMountTriggerKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsMountTriggerKey');
end;

function NSURLGenerationIdentifierKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLGenerationIdentifierKey');
end;

function NSURLDocumentIdentifierKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLDocumentIdentifierKey');
end;

function NSURLAddedToDirectoryDateKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLAddedToDirectoryDateKey');
end;

function NSURLQuarantinePropertiesKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLQuarantinePropertiesKey');
end;

function NSURLFileResourceTypeKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileResourceTypeKey');
end;

function NSURLFileIdentifierKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileIdentifierKey');
end;

function NSURLFileContentIdentifierKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileContentIdentifierKey');
end;

function NSURLMayShareFileContentKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLMayShareFileContentKey');
end;

function NSURLMayHaveExtendedAttributesKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLMayHaveExtendedAttributesKey');
end;

function NSURLIsPurgeableKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsPurgeableKey');
end;

function NSURLIsSparseKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsSparseKey');
end;

function NSURLFileResourceTypeNamedPipe: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileResourceTypeNamedPipe');
end;

function NSURLFileResourceTypeCharacterSpecial: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLFileResourceTypeCharacterSpecial');
end;

function NSURLFileResourceTypeDirectory: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileResourceTypeDirectory');
end;

function NSURLFileResourceTypeBlockSpecial: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLFileResourceTypeBlockSpecial');
end;

function NSURLFileResourceTypeRegular: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileResourceTypeRegular');
end;

function NSURLFileResourceTypeSymbolicLink: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLFileResourceTypeSymbolicLink');
end;

function NSURLFileResourceTypeSocket: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileResourceTypeSocket');
end;

function NSURLFileResourceTypeUnknown: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileResourceTypeUnknown');
end;

function NSURLThumbnailDictionaryKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLThumbnailDictionaryKey');
end;

function NSURLThumbnailKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLThumbnailKey');
end;

function NSThumbnail1024x1024SizeKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSThumbnail1024x1024SizeKey');
end;

function NSURLFileSizeKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileSizeKey');
end;

function NSURLFileAllocatedSizeKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileAllocatedSizeKey');
end;

function NSURLTotalFileSizeKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLTotalFileSizeKey');
end;

function NSURLTotalFileAllocatedSizeKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLTotalFileAllocatedSizeKey');
end;

function NSURLIsAliasFileKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsAliasFileKey');
end;

function NSURLFileProtectionKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileProtectionKey');
end;

function NSURLFileProtectionNone: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileProtectionNone');
end;

function NSURLFileProtectionComplete: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLFileProtectionComplete');
end;

function NSURLFileProtectionCompleteUnlessOpen: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLFileProtectionCompleteUnlessOpen');
end;

function NSURLFileProtectionCompleteUntilFirstUserAuthentication: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLFileProtectionCompleteUntilFirstUserAuthentication');
end;

function NSURLVolumeLocalizedFormatDescriptionKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeLocalizedFormatDescriptionKey');
end;

function NSURLVolumeTotalCapacityKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeTotalCapacityKey');
end;

function NSURLVolumeAvailableCapacityKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeAvailableCapacityKey');
end;

function NSURLVolumeResourceCountKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeResourceCountKey');
end;

function NSURLVolumeSupportsPersistentIDsKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsPersistentIDsKey');
end;

function NSURLVolumeSupportsSymbolicLinksKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsSymbolicLinksKey');
end;

function NSURLVolumeSupportsHardLinksKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeSupportsHardLinksKey');
end;

function NSURLVolumeSupportsJournalingKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsJournalingKey');
end;

function NSURLVolumeIsJournalingKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeIsJournalingKey');
end;

function NSURLVolumeSupportsSparseFilesKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsSparseFilesKey');
end;

function NSURLVolumeSupportsZeroRunsKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeSupportsZeroRunsKey');
end;

function NSURLVolumeSupportsCaseSensitiveNamesKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsCaseSensitiveNamesKey');
end;

function NSURLVolumeSupportsCasePreservedNamesKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsCasePreservedNamesKey');
end;

function NSURLVolumeSupportsRootDirectoryDatesKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsRootDirectoryDatesKey');
end;

function NSURLVolumeSupportsVolumeSizesKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsVolumeSizesKey');
end;

function NSURLVolumeSupportsRenamingKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeSupportsRenamingKey');
end;

function NSURLVolumeSupportsAdvisoryFileLockingKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsAdvisoryFileLockingKey');
end;

function NSURLVolumeSupportsExtendedSecurityKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsExtendedSecurityKey');
end;

function NSURLVolumeIsBrowsableKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeIsBrowsableKey');
end;

function NSURLVolumeMaximumFileSizeKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeMaximumFileSizeKey');
end;

function NSURLVolumeIsEjectableKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeIsEjectableKey');
end;

function NSURLVolumeIsRemovableKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeIsRemovableKey');
end;

function NSURLVolumeIsInternalKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeIsInternalKey');
end;

function NSURLVolumeIsAutomountedKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeIsAutomountedKey');
end;

function NSURLVolumeIsLocalKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeIsLocalKey');
end;

function NSURLVolumeIsReadOnlyKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeIsReadOnlyKey');
end;

function NSURLVolumeCreationDateKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeCreationDateKey');
end;

function NSURLVolumeURLForRemountingKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeURLForRemountingKey');
end;

function NSURLVolumeUUIDStringKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeUUIDStringKey');
end;

function NSURLVolumeNameKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeNameKey');
end;

function NSURLVolumeLocalizedNameKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeLocalizedNameKey');
end;

function NSURLVolumeIsEncryptedKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeIsEncryptedKey');
end;

function NSURLVolumeIsRootFileSystemKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeIsRootFileSystemKey');
end;

function NSURLVolumeSupportsCompressionKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsCompressionKey');
end;

function NSURLVolumeSupportsFileCloningKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsFileCloningKey');
end;

function NSURLVolumeSupportsSwapRenamingKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsSwapRenamingKey');
end;

function NSURLVolumeSupportsExclusiveRenamingKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsExclusiveRenamingKey');
end;

function NSURLVolumeSupportsImmutableFilesKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsImmutableFilesKey');
end;

function NSURLVolumeSupportsAccessPermissionsKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsAccessPermissionsKey');
end;

function NSURLVolumeSupportsFileProtectionKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeSupportsFileProtectionKey');
end;

function NSURLVolumeAvailableCapacityForImportantUsageKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeAvailableCapacityForImportantUsageKey');
end;

function NSURLVolumeAvailableCapacityForOpportunisticUsageKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLVolumeAvailableCapacityForOpportunisticUsageKey');
end;

function NSURLVolumeTypeNameKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeTypeNameKey');
end;

function NSURLVolumeSubtypeKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeSubtypeKey');
end;

function NSURLVolumeMountFromLocationKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLVolumeMountFromLocationKey');
end;

function NSURLIsUbiquitousItemKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLIsUbiquitousItemKey');
end;

function NSURLUbiquitousItemHasUnresolvedConflictsKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemHasUnresolvedConflictsKey');
end;

function NSURLUbiquitousItemIsDownloadedKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemIsDownloadedKey');
end;

function NSURLUbiquitousItemIsDownloadingKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemIsDownloadingKey');
end;

function NSURLUbiquitousItemIsUploadedKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemIsUploadedKey');
end;

function NSURLUbiquitousItemIsUploadingKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemIsUploadingKey');
end;

function NSURLUbiquitousItemPercentDownloadedKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemPercentDownloadedKey');
end;

function NSURLUbiquitousItemPercentUploadedKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemPercentUploadedKey');
end;

function NSURLUbiquitousItemDownloadingStatusKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemDownloadingStatusKey');
end;

function NSURLUbiquitousItemDownloadingErrorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemDownloadingErrorKey');
end;

function NSURLUbiquitousItemUploadingErrorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemUploadingErrorKey');
end;

function NSURLUbiquitousItemDownloadRequestedKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemDownloadRequestedKey');
end;

function NSURLUbiquitousItemContainerDisplayNameKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemContainerDisplayNameKey');
end;

function NSURLUbiquitousItemIsExcludedFromSyncKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemIsExcludedFromSyncKey');
end;

function NSURLUbiquitousItemIsSharedKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLUbiquitousItemIsSharedKey');
end;

function NSURLUbiquitousSharedItemCurrentUserRoleKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousSharedItemCurrentUserRoleKey');
end;

function NSURLUbiquitousSharedItemCurrentUserPermissionsKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousSharedItemCurrentUserPermissionsKey');
end;

function NSURLUbiquitousSharedItemOwnerNameComponentsKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousSharedItemOwnerNameComponentsKey');
end;

function NSURLUbiquitousSharedItemMostRecentEditorNameComponentsKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousSharedItemMostRecentEditorNameComponentsKey');
end;

function NSURLUbiquitousItemDownloadingStatusNotDownloaded: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemDownloadingStatusNotDownloaded');
end;

function NSURLUbiquitousItemDownloadingStatusDownloaded: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemDownloadingStatusDownloaded');
end;

function NSURLUbiquitousItemDownloadingStatusCurrent: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousItemDownloadingStatusCurrent');
end;

function NSURLUbiquitousSharedItemRoleOwner: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousSharedItemRoleOwner');
end;

function NSURLUbiquitousSharedItemRoleParticipant: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousSharedItemRoleParticipant');
end;

function NSURLUbiquitousSharedItemPermissionsReadOnly: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousSharedItemPermissionsReadOnly');
end;

function NSURLUbiquitousSharedItemPermissionsReadWrite: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLUbiquitousSharedItemPermissionsReadWrite');
end;

function NSUbiquityIdentityDidChangeNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUbiquityIdentityDidChangeNotification');
end;

function NSFileType: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileType');
end;

function NSFileTypeDirectory: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileTypeDirectory');
end;

function NSFileTypeRegular: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileTypeRegular');
end;

function NSFileTypeSymbolicLink: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileTypeSymbolicLink');
end;

function NSFileTypeSocket: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileTypeSocket');
end;

function NSFileTypeCharacterSpecial: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileTypeCharacterSpecial');
end;

function NSFileTypeBlockSpecial: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileTypeBlockSpecial');
end;

function NSFileTypeUnknown: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileTypeUnknown');
end;

function NSFileSize: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileSize');
end;

function NSFileModificationDate: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileModificationDate');
end;

function NSFileReferenceCount: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileReferenceCount');
end;

function NSFileDeviceIdentifier: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileDeviceIdentifier');
end;

function NSFileOwnerAccountName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileOwnerAccountName');
end;

function NSFileGroupOwnerAccountName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileGroupOwnerAccountName');
end;

function NSFilePosixPermissions: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFilePosixPermissions');
end;

function NSFileSystemNumber: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileSystemNumber');
end;

function NSFileSystemFileNumber: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileSystemFileNumber');
end;

function NSFileExtensionHidden: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileExtensionHidden');
end;

function NSFileHFSCreatorCode: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileHFSCreatorCode');
end;

function NSFileHFSTypeCode: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileHFSTypeCode');
end;

function NSFileImmutable: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileImmutable');
end;

function NSFileAppendOnly: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileAppendOnly');
end;

function NSFileCreationDate: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileCreationDate');
end;

function NSFileOwnerAccountID: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileOwnerAccountID');
end;

function NSFileGroupOwnerAccountID: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileGroupOwnerAccountID');
end;

function NSFileBusy: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileBusy');
end;

function NSFileProtectionKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileProtectionKey');
end;

function NSFileProtectionNone: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileProtectionNone');
end;

function NSFileProtectionComplete: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileProtectionComplete');
end;

function NSFileProtectionCompleteUnlessOpen: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSFileProtectionCompleteUnlessOpen');
end;

function NSFileProtectionCompleteUntilFirstUserAuthentication: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSFileProtectionCompleteUntilFirstUserAuthentication');
end;

function NSFileSystemSize: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileSystemSize');
end;

function NSFileSystemFreeSize: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileSystemFreeSize');
end;

function NSFileSystemNodes: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileSystemNodes');
end;

function NSFileSystemFreeNodes: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSFileSystemFreeNodes');
end;

function NSIntegerHashCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSIntegerHashCallBacks');
end;

function NSNonOwnedPointerHashCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSNonOwnedPointerHashCallBacks');
end;

function NSNonRetainedObjectHashCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSNonRetainedObjectHashCallBacks');
end;

function NSObjectHashCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSObjectHashCallBacks');
end;

function NSOwnedObjectIdentityHashCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSOwnedObjectIdentityHashCallBacks');
end;

function NSOwnedPointerHashCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSOwnedPointerHashCallBacks');
end;

function NSPointerToStructHashCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSPointerToStructHashCallBacks');
end;

function NSIntHashCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSIntHashCallBacks');
end;

function NSHTTPCookieName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieName');
end;

function NSHTTPCookieValue: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieValue');
end;

function NSHTTPCookieOriginURL: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieOriginURL');
end;

function NSHTTPCookieVersion: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieVersion');
end;

function NSHTTPCookieDomain: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieDomain');
end;

function NSHTTPCookiePath: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookiePath');
end;

function NSHTTPCookieSecure: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieSecure');
end;

function NSHTTPCookieExpires: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieExpires');
end;

function NSHTTPCookieComment: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieComment');
end;

function NSHTTPCookieCommentURL: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieCommentURL');
end;

function NSHTTPCookieDiscard: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieDiscard');
end;

function NSHTTPCookieMaximumAge: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieMaximumAge');
end;

function NSHTTPCookiePort: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookiePort');
end;

function NSHTTPCookieSameSitePolicy: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieSameSitePolicy');
end;

function NSHTTPCookieSameSiteLax: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieSameSiteLax');
end;

function NSHTTPCookieSameSiteStrict: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSHTTPCookieSameSiteStrict');
end;

function NSHTTPCookieManagerAcceptPolicyChangedNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSHTTPCookieManagerAcceptPolicyChangedNotification');
end;

function NSHTTPCookieManagerCookiesChangedNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSHTTPCookieManagerCookiesChangedNotification');
end;

function NSUndefinedKeyException: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSUndefinedKeyException');
end;

function NSAverageKeyValueOperator: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSAverageKeyValueOperator');
end;

function NSCountKeyValueOperator: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSCountKeyValueOperator');
end;

function NSDistinctUnionOfArraysKeyValueOperator: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSDistinctUnionOfArraysKeyValueOperator');
end;

function NSDistinctUnionOfObjectsKeyValueOperator: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSDistinctUnionOfObjectsKeyValueOperator');
end;

function NSDistinctUnionOfSetsKeyValueOperator: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSDistinctUnionOfSetsKeyValueOperator');
end;

function NSMaximumKeyValueOperator: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSMaximumKeyValueOperator');
end;

function NSMinimumKeyValueOperator: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSMinimumKeyValueOperator');
end;

function NSSumKeyValueOperator: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSSumKeyValueOperator');
end;

function NSUnionOfArraysKeyValueOperator: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSUnionOfArraysKeyValueOperator');
end;

function NSUnionOfObjectsKeyValueOperator: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUnionOfObjectsKeyValueOperator');
end;

function NSUnionOfSetsKeyValueOperator: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSUnionOfSetsKeyValueOperator');
end;

function NSKeyValueChangeKindKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSKeyValueChangeKindKey');
end;

function NSKeyValueChangeNewKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSKeyValueChangeNewKey');
end;

function NSKeyValueChangeOldKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSKeyValueChangeOldKey');
end;

function NSKeyValueChangeIndexesKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSKeyValueChangeIndexesKey');
end;

function NSKeyValueChangeNotificationIsPriorKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSKeyValueChangeNotificationIsPriorKey');
end;

function NSInvalidArchiveOperationException: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSInvalidArchiveOperationException');
end;

function NSInvalidUnarchiveOperationException: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSInvalidUnarchiveOperationException');
end;

function NSIntegerMapKeyCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSIntegerMapKeyCallBacks');
end;

function NSNonOwnedPointerMapKeyCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSNonOwnedPointerMapKeyCallBacks');
end;

function NSNonOwnedPointerOrNullMapKeyCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSNonOwnedPointerOrNullMapKeyCallBacks');
end;

function NSNonRetainedObjectMapKeyCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSNonRetainedObjectMapKeyCallBacks');
end;

function NSObjectMapKeyCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSObjectMapKeyCallBacks');
end;

function NSOwnedPointerMapKeyCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSOwnedPointerMapKeyCallBacks');
end;

function NSIntMapKeyCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSIntMapKeyCallBacks');
end;

function NSIntegerMapValueCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSIntegerMapValueCallBacks');
end;

function NSNonOwnedPointerMapValueCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSNonOwnedPointerMapValueCallBacks');
end;

function NSObjectMapValueCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSObjectMapValueCallBacks');
end;

function NSNonRetainedObjectMapValueCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSNonRetainedObjectMapValueCallBacks');
end;

function NSOwnedPointerMapValueCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSOwnedPointerMapValueCallBacks');
end;

function NSIntMapValueCallBacks: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSIntMapValueCallBacks');
end;

function NSInvocationOperationVoidResultException: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSInvocationOperationVoidResultException');
end;

function NSInvocationOperationCancelledException: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSInvocationOperationCancelledException');
end;

function NSPortDidBecomeInvalidNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSPortDidBecomeInvalidNotification');
end;

function NSProcessInfoThermalStateDidChangeNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSProcessInfoThermalStateDidChangeNotification');
end;

function NSProcessInfoPowerStateDidChangeNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSProcessInfoPowerStateDidChangeNotification');
end;

function NSTextCheckingNameKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSTextCheckingNameKey');
end;

function NSTextCheckingJobTitleKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSTextCheckingJobTitleKey');
end;

function NSTextCheckingOrganizationKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSTextCheckingOrganizationKey');
end;

function NSTextCheckingStreetKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSTextCheckingStreetKey');
end;

function NSTextCheckingCityKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSTextCheckingCityKey');
end;

function NSTextCheckingStateKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSTextCheckingStateKey');
end;

function NSTextCheckingZIPKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSTextCheckingZIPKey');
end;

function NSTextCheckingCountryKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSTextCheckingCountryKey');
end;

function NSTextCheckingPhoneKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSTextCheckingPhoneKey');
end;

function NSTextCheckingAirlineKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSTextCheckingAirlineKey');
end;

function NSTextCheckingFlightKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSTextCheckingFlightKey');
end;

function NSStreamSocketSecurityLevelKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamSocketSecurityLevelKey');
end;

function NSStreamSocketSecurityLevelNone: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamSocketSecurityLevelNone');
end;

function NSStreamSocketSecurityLevelSSLv2: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStreamSocketSecurityLevelSSLv2');
end;

function NSStreamSocketSecurityLevelSSLv3: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStreamSocketSecurityLevelSSLv3');
end;

function NSStreamSocketSecurityLevelTLSv1: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStreamSocketSecurityLevelTLSv1');
end;

function NSStreamSocketSecurityLevelNegotiatedSSL: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStreamSocketSecurityLevelNegotiatedSSL');
end;

function NSStreamSOCKSProxyConfigurationKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStreamSOCKSProxyConfigurationKey');
end;

function NSStreamSOCKSProxyHostKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamSOCKSProxyHostKey');
end;

function NSStreamSOCKSProxyPortKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamSOCKSProxyPortKey');
end;

function NSStreamSOCKSProxyVersionKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamSOCKSProxyVersionKey');
end;

function NSStreamSOCKSProxyUserKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamSOCKSProxyUserKey');
end;

function NSStreamSOCKSProxyPasswordKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamSOCKSProxyPasswordKey');
end;

function NSStreamSOCKSProxyVersion4: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamSOCKSProxyVersion4');
end;

function NSStreamSOCKSProxyVersion5: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamSOCKSProxyVersion5');
end;

function NSStreamDataWrittenToMemoryStreamKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStreamDataWrittenToMemoryStreamKey');
end;

function NSStreamFileCurrentOffsetKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamFileCurrentOffsetKey');
end;

function NSStreamSocketSSLErrorDomain: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamSocketSSLErrorDomain');
end;

function NSStreamSOCKSErrorDomain: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamSOCKSErrorDomain');
end;

function NSStreamNetworkServiceType: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamNetworkServiceType');
end;

function NSStreamNetworkServiceTypeVoIP: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamNetworkServiceTypeVoIP');
end;

function NSStreamNetworkServiceTypeVideo: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamNetworkServiceTypeVideo');
end;

function NSStreamNetworkServiceTypeBackground: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStreamNetworkServiceTypeBackground');
end;

function NSStreamNetworkServiceTypeVoice: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSStreamNetworkServiceTypeVoice');
end;

function NSStreamNetworkServiceTypeCallSignaling: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSStreamNetworkServiceTypeCallSignaling');
end;

function NSWillBecomeMultiThreadedNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSWillBecomeMultiThreadedNotification');
end;

function NSDidBecomeSingleThreadedNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSDidBecomeSingleThreadedNotification');
end;

function NSThreadWillExitNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSThreadWillExitNotification');
end;

function NSSystemTimeZoneDidChangeNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSSystemTimeZoneDidChangeNotification');
end;

function NSURLCredentialStorageChangedNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLCredentialStorageChangedNotification');
end;

function NSURLErrorDomain: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLErrorDomain');
end;

function NSURLErrorNetworkUnavailableReasonKey: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSURLErrorNetworkUnavailableReasonKey');
end;

function NSUserDefaultsSizeLimitExceededNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUserDefaultsSizeLimitExceededNotification');
end;

function NSUbiquitousUserDefaultsNoCloudAccountNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUbiquitousUserDefaultsNoCloudAccountNotification');
end;

function NSUbiquitousUserDefaultsDidChangeAccountsNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUbiquitousUserDefaultsDidChangeAccountsNotification');
end;

function NSUbiquitousUserDefaultsCompletedInitialSyncNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUbiquitousUserDefaultsCompletedInitialSyncNotification');
end;

function NSUserDefaultsDidChangeNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUserDefaultsDidChangeNotification');
end;

function NSNegateBooleanTransformerName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSNegateBooleanTransformerName');
end;

function NSIsNilTransformerName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSIsNilTransformerName');
end;

function NSIsNotNilTransformerName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSIsNotNilTransformerName');
end;

function NSUnarchiveFromDataTransformerName: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUnarchiveFromDataTransformerName');
end;

function NSKeyedUnarchiveFromDataTransformerName: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSKeyedUnarchiveFromDataTransformerName');
end;

function NSSecureUnarchiveFromDataTransformerName: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSSecureUnarchiveFromDataTransformerName');
end;

function NSXMLParserErrorDomain: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSXMLParserErrorDomain');
end;

function NSLinguisticTagSchemeTokenType: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagSchemeTokenType');
end;

function NSLinguisticTagSchemeLexicalClass: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSLinguisticTagSchemeLexicalClass');
end;

function NSLinguisticTagSchemeNameType: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagSchemeNameType');
end;

function NSLinguisticTagSchemeNameTypeOrLexicalClass: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSLinguisticTagSchemeNameTypeOrLexicalClass');
end;

function NSLinguisticTagSchemeLemma: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagSchemeLemma');
end;

function NSLinguisticTagSchemeLanguage: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagSchemeLanguage');
end;

function NSLinguisticTagSchemeScript: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagSchemeScript');
end;

function NSLinguisticTagWord: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagWord');
end;

function NSLinguisticTagPunctuation: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagPunctuation');
end;

function NSLinguisticTagWhitespace: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagWhitespace');
end;

function NSLinguisticTagOther: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagOther');
end;

function NSLinguisticTagNoun: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagNoun');
end;

function NSLinguisticTagVerb: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagVerb');
end;

function NSLinguisticTagAdjective: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagAdjective');
end;

function NSLinguisticTagAdverb: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagAdverb');
end;

function NSLinguisticTagPronoun: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagPronoun');
end;

function NSLinguisticTagDeterminer: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagDeterminer');
end;

function NSLinguisticTagParticle: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagParticle');
end;

function NSLinguisticTagPreposition: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagPreposition');
end;

function NSLinguisticTagNumber: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagNumber');
end;

function NSLinguisticTagConjunction: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagConjunction');
end;

function NSLinguisticTagInterjection: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagInterjection');
end;

function NSLinguisticTagClassifier: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagClassifier');
end;

function NSLinguisticTagIdiom: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagIdiom');
end;

function NSLinguisticTagOtherWord: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagOtherWord');
end;

function NSLinguisticTagSentenceTerminator: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSLinguisticTagSentenceTerminator');
end;

function NSLinguisticTagOpenQuote: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagOpenQuote');
end;

function NSLinguisticTagCloseQuote: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagCloseQuote');
end;

function NSLinguisticTagOpenParenthesis: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagOpenParenthesis');
end;

function NSLinguisticTagCloseParenthesis: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagCloseParenthesis');
end;

function NSLinguisticTagWordJoiner: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagWordJoiner');
end;

function NSLinguisticTagDash: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagDash');
end;

function NSLinguisticTagOtherPunctuation: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagOtherPunctuation');
end;

function NSLinguisticTagParagraphBreak: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagParagraphBreak');
end;

function NSLinguisticTagOtherWhitespace: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagOtherWhitespace');
end;

function NSLinguisticTagPersonalName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagPersonalName');
end;

function NSLinguisticTagPlaceName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagPlaceName');
end;

function NSLinguisticTagOrganizationName: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSLinguisticTagOrganizationName');
end;

function NSMetadataQueryDidStartGatheringNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSMetadataQueryDidStartGatheringNotification');
end;

function NSMetadataQueryGatheringProgressNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSMetadataQueryGatheringProgressNotification');
end;

function NSMetadataQueryDidFinishGatheringNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSMetadataQueryDidFinishGatheringNotification');
end;

function NSMetadataQueryDidUpdateNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSMetadataQueryDidUpdateNotification');
end;

function NSNetServicesErrorDomain: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSNetServicesErrorDomain');
end;

function NSUbiquitousKeyValueStoreDidChangeExternallyNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUbiquitousKeyValueStoreDidChangeExternallyNotification');
end;

function NSUndoManagerCheckpointNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUndoManagerCheckpointNotification');
end;

function NSUndoManagerWillUndoChangeNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUndoManagerWillUndoChangeNotification');
end;

function NSUndoManagerWillRedoChangeNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUndoManagerWillRedoChangeNotification');
end;

function NSUndoManagerDidUndoChangeNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUndoManagerDidUndoChangeNotification');
end;

function NSUndoManagerDidRedoChangeNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUndoManagerDidRedoChangeNotification');
end;

function NSUndoManagerDidOpenUndoGroupNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUndoManagerDidOpenUndoGroupNotification');
end;

function NSUndoManagerWillCloseUndoGroupNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUndoManagerWillCloseUndoGroupNotification');
end;

function NSUndoManagerDidCloseUndoGroupNotification: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSUndoManagerDidCloseUndoGroupNotification');
end;

function NSURLSessionTransferSizeUnknown: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLSessionTransferSizeUnknown');
end;

function NSURLSessionTaskPriorityDefault: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLSessionTaskPriorityDefault');
end;

function NSURLSessionTaskPriorityLow: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLSessionTaskPriorityLow');
end;

function NSURLSessionTaskPriorityHigh: Pointer;
begin
  result := CocoaPointerConst(libFoundation, 'NSURLSessionTaskPriorityHigh');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

FoundationModule := dlopen(MarshaledAString(libFoundation), RTLD_LAZY);

finalization

dlclose(FoundationModule);
{$ENDIF IOS}

end.
