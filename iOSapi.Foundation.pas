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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
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
  NSBinarySearchingFirstEqual = (1 shl 8);
  NSBinarySearchingLastEqual = (1 shl 9);
  NSBinarySearchingInsertionIndex = (1 shl 10);
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
  NSStringEnumerationReverse = 1 shl 8;
  NSStringEnumerationSubstringNotRequired = 1 shl 9;
  NSStringEnumerationLocalized = 1 shl 10;
  NSProprietaryStringEncoding = 65536;
  NSBundleExecutableArchitectureI386 = 7;
  NSBundleExecutableArchitecturePPC = 18;
  NSBundleExecutableArchitectureX86_64 = 16777223;
  NSBundleExecutableArchitecturePPC64 = 16777234;
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
  NSPersonNameComponentsFormatterStyleDefault = 0;
  NSPersonNameComponentsFormatterStyleShort = 1;
  NSPersonNameComponentsFormatterStyleMedium = 2;
  NSPersonNameComponentsFormatterStyleLong = 3;
  NSPersonNameComponentsFormatterStyleAbbreviated = 4;
  NSPersonNameComponentsFormatterPhonetic = (1 shl 1);
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
  NSVolumeEnumerationSkipHiddenVolumes = 1 shl 1;
  NSVolumeEnumerationProduceFileReferenceURLs = 1 shl 2;
  NSDirectoryEnumerationSkipsSubdirectoryDescendants = 1 shl 0;
  NSDirectoryEnumerationSkipsPackageDescendants = 1 shl 1;
  NSDirectoryEnumerationSkipsHiddenFiles = 1 shl 2;
  NSFileManagerItemReplacementUsingNewMetadataOnly = 1 shl 0;
  NSFileManagerItemReplacementWithoutDeletingBackupItem = 1 shl 1;
  NSURLRelationshipContains = 0;
  NSURLRelationshipSame = 1;
  NSURLRelationshipOther = 2;
  NSFileManagerUnmountAllPartitionsAndEjectDisk = 1 shl 0;
  NSFileManagerUnmountWithoutUI = 1 shl 1;
  NSPointerFunctionsStrongMemory = (0 shl 0);
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
  NSJSONReadingAllowFragments = (1 shl 2);
  NSJSONWritingPrettyPrinted = (1 shl 0);
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
  NSLocaleLanguageDirectionUnknown = kCFLocaleLanguageDirectionUnknown;
  NSLocaleLanguageDirectionLeftToRight = kCFLocaleLanguageDirectionLeftToRight;
  NSLocaleLanguageDirectionRightToLeft = kCFLocaleLanguageDirectionRightToLeft;
  NSLocaleLanguageDirectionTopToBottom = kCFLocaleLanguageDirectionTopToBottom;
  NSLocaleLanguageDirectionBottomToTop = kCFLocaleLanguageDirectionBottomToTop;
  NSPostWhenIdle = 1;
  NSPostASAP = 2;
  NSPostNow = 3;
  NSNotificationNoCoalescing = 0;
  NSNotificationCoalescingOnName = 1;
  NSNotificationCoalescingOnSender = 2;
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
  NSActivityUserInitiated = (16777215 or NSActivityIdleSystemSleepDisabled);
  NSActivityUserInitiatedAllowingIdleSystemSleep = (NSActivityUserInitiated and
    not NSActivityIdleSystemSleepDisabled);
  NSActivityBackground = 255;
  NSActivityLatencyCritical = 1095216660480;
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
  NSURLBookmarkCreationPreferFileIDResolution = (1 shl 8);
  NSURLBookmarkCreationMinimalBookmark = (1 shl 9);
  NSURLBookmarkCreationSuitableForBookmarkFile = (1 shl 10);
  NSURLBookmarkCreationWithSecurityScope = (1 shl 11);
  NSURLBookmarkCreationSecurityScopeAllowOnlyReadAccess = (1 shl 12);
  NSURLBookmarkResolutionWithoutUI = (1 shl 8);
  NSURLBookmarkResolutionWithoutMounting = (1 shl 9);
  NSURLBookmarkResolutionWithSecurityScope = (1 shl 10);
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
  NSCoderErrorMinimum = 4864;
  NSCoderErrorMaximum = 4991;
  NSBundleErrorMinimum = 4992;
  NSBundleErrorMaximum = 5119;
  NSBundleOnDemandResourceOutOfSpaceError = 4992;
  NSBundleOnDemandResourceExceededMaximumSizeError = 4993;
  NSBundleOnDemandResourceInvalidTagError = 4994;
  NSAttributedStringEnumerationReverse = (1 shl 1);
  NSAttributedStringEnumerationLongestEffectiveRangeNotRequired = (1 shl 20);
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
  NSItemProviderUnknownError = -1;
  NSItemProviderItemUnavailableError = -1000;
  NSItemProviderUnexpectedValueClassError = -1100;
  NSItemProviderUnavailableCoercionError = -1200;
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
  NSURLSessionAuthChallengeUseCredential = 0;
  NSURLSessionAuthChallengePerformDefaultHandling = 1;
  NSURLSessionAuthChallengeCancelAuthenticationChallenge = 2;
  NSURLSessionAuthChallengeRejectProtectionSpace = 3;
  NSURLSessionResponseCancel = 0;
  NSURLSessionResponseAllow = 1;
  NSURLSessionResponseBecomeDownload = 2;
  NSURLSessionResponseBecomeStream = 3;

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
  NSData = interface;
  NSIndexSet = interface;
  NSURL = interface;
  NSMutableArray = interface;
  NSAutoreleasePool = interface;
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
  NSLock = interface;
  NSProgress = interface;
  NSProgressReporting = interface;
  NSBundle = interface;
  NSBundleResourceRequest = interface;
  NSDate = interface;
  NSDateComponents = interface;
  NSTimeZone = interface;
  NSCalendar = interface;
  NSMutableCharacterSet = interface;
  NSMutableData = interface;
  NSPurgeableData = interface;
  NSAttributedString = interface;
  NSFormatter = interface;
  NSDateFormatter = interface;
  NSDateIntervalFormatter = interface;
  NSNumberFormatter = interface;
  NSMassFormatter = interface;
  NSLengthFormatter = interface;
  NSEnergyFormatter = interface;
  NSPersonNameComponents = interface;
  NSPersonNameComponentsFormatter = interface;
  NSScanner = interface;
  NSDecimalNumber = interface;
  NSDecimalNumberBehaviors = interface;
  NSDecimalNumberHandler = interface;
  NSErrorRecoveryAttempting = interface;
  NSException = interface;
  NSAssertionHandler = interface;
  NSFileHandle = interface;
  NSPipe = interface;
  NSDirectoryEnumerator = interface;
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
  NSMutableIndexSet = interface;
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
  NSRecursiveLock = interface;
  NSCondition = interface;
  NSMapTable = interface;
  NSOperationQueue = interface;
  NSNotification = interface;
  NSNotificationCenter = interface;
  NSNotificationQueue = interface;
  NSNull = interface;
  NSCache = interface;
  NSOperation = interface;
  NSBlockOperation = interface;
  NSInvocationOperation = interface;
  NSOrthography = interface;
  NSPointerArray = interface;
  NSRunLoop = interface;
  NSPortDelegate = interface;
  NSMachPortDelegate = interface;
  NSPort = interface;
  NSMachPort = interface;
  NSMessagePort = interface;
  NSProcessInfo = interface;
  NSProxy = interface;
  NSRegularExpression = interface;
  NSTextCheckingResult = interface;
  NSDataDetector = interface;
  NSTimer = interface;
  NSDelayedPerforming = interface;
  NSStreamDelegate = interface;
  NSStream = interface;
  NSThread = interface;
  NSThreadPerformAdditions = interface;
  NSURLQueryItem = interface;
  NSURLComponents = interface;
  NSFileSecurity = interface;
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
  NSXMLParserDelegate = interface;
  NSXMLParser = interface;
  NSMutableAttributedString = interface;
  NSByteCountFormatter = interface;
  NSCacheDelegate = interface;
  NSPredicate = interface;
  NSExpression = interface;
  NSComparisonPredicate = interface;
  NSCompoundPredicate = interface;
  NSDateComponentsFormatter = interface;
  NSExtensionContext = interface;
  NSItemProvider = interface;
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
  NSURLSessionConfiguration = interface;
  NSURLSessionDelegate = interface;
  NSURLSessionTaskDelegate = interface;
  NSURLSessionDataDelegate = interface;
  NSURLSessionDownloadDelegate = interface;
  NSURLSessionStreamDelegate = interface;
  NSUserActivityDelegate = interface;
  NSUserActivity = interface;

  // ===== Framework typedefs =====
{$M+}
  SEL = SEL *;
  NSInteger = Integer;
  NSComparisonResult = NSInteger;
  NSComparator = function(param1: Pointer; param2: Pointer)
    : NSComparisonResult; cdecl;
  NSUInteger = Cardinal;
  NSEnumerationOptions = NSUInteger;
  NSSortOptions = NSUInteger;
  NSQualityOfService = NSInteger;

  _NSZone = record
  end;

  P_NSZone = ^_NSZone;
  NSZone = _NSZone;

  CFTypeRef = Pointer;

  NSFastEnumerationState = record
    state: LongWord;
    itemsPtr: Pointer;
    mutationsPtr: PLongWord;
    extra: array [0 .. 4] of LongWord;
  end;

  PNSFastEnumerationState = ^NSFastEnumerationState;

  ObjectType = Pointer;

  _NSRange = record
    location: NSUInteger;
    length: NSUInteger;
  end;

  P_NSRange = ^_NSRange;
  NSRange = _NSRange;

  NSRangePointer = Pointer;
  TFoundationComparator = function(param1: ObjectType; param2: ObjectType;
    param3: Pointer): NSInteger; cdecl;
  TFoundationBlock = procedure(param1: ObjectType; param2: NSUInteger;
    param3: PBoolean) of object;
  TFoundationPredicate = function(param1: ObjectType; param2: NSUInteger;
    param3: PBoolean): Boolean; cdecl;
  NSBinarySearchingOptions = NSUInteger;
  unichar = Word;
  Punichar = ^unichar;

  NSStringCompareOptions = NSUInteger;
  NSStringEncoding = NSUInteger;
  NSStringEncodingConversionOptions = NSUInteger;
  NSStringEnumerationOptions = NSUInteger;
  TFoundationUsingBlock = procedure(param1: NSString; param2: NSRange;
    param3: NSRange; param4: PBoolean) of object;
  TFoundationBlock1 = procedure(param1: NSString; param2: PBoolean) of object;
  __builtin_va_list = Pointer;
  __darwin_va_list = __builtin_va_list;
  KeyType = Pointer;
  TFoundationBlock2 = procedure(param1: KeyType; param2: ObjectType;
    param3: PBoolean) of object;
  TFoundationPredicate1 = function(param1: KeyType; param2: ObjectType;
    param3: PBoolean): Boolean; cdecl;
  TFoundationBlock3 = procedure(param1: ObjectType; param2: PBoolean) of object;
  TFoundationPredicate2 = function(param1: ObjectType; param2: PBoolean)
    : Boolean; cdecl;
  TFoundationCancellationHandler = procedure() of object;
  NSProgressUnpublishingHandler = procedure() of object;
  NSProgressPublishingHandler = function(param1: NSProgress)
    : NSProgressUnpublishingHandler; cdecl;
  TFoundationCompletionHandler = procedure(param1: NSError) of object;
  TFoundationCompletionHandler1 = procedure(param1: Boolean) of object;

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

  NSCalendarUnit = NSUInteger;
  NSCalendarOptions = NSUInteger;
  TFoundationUsingBlock1 = procedure(param1: NSDate; param2: Boolean;
    param3: PBoolean) of object;
  UTF32Char = UInt32;
  NSDataReadingOptions = NSUInteger;
  NSDataWritingOptions = NSUInteger;
  NSDataSearchOptions = NSUInteger;
  NSDataBase64EncodingOptions = NSUInteger;
  NSDataBase64DecodingOptions = NSUInteger;
  TFoundationBlock4 = procedure(param1: Pointer; param2: NSRange;
    param3: PBoolean) of object;
  TFoundationDeallocator = procedure(param1: Pointer; param2: NSUInteger)
    of object;
  NSFormattingContext = NSInteger;
  NSFormattingUnitStyle = NSInteger;
  NSDateFormatterStyle = NSUInteger;
  NSDateFormatterBehavior = NSUInteger;
  NSDateIntervalFormatterStyle = NSUInteger;
  NSMassFormatterUnit = NSInteger;
  NSLengthFormatterUnit = NSInteger;
  NSEnergyFormatterUnit = NSInteger;
  NSPersonNameComponentsFormatterStyle = NSInteger;
  NSPersonNameComponentsFormatterOptions = NSUInteger;
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

  TFoundationProvider = function(param1: NSError; param2: NSString)
    : Pointer; cdecl;
  NSUncaughtExceptionHandler = procedure(param1: NSException); cdecl;
  TFoundationNSGetUncaughtExceptionHandler = procedure
    (param1: NSException); cdecl;
  TFoundationReadabilityHandler = procedure(param1: NSFileHandle) of object;
  NSSearchPathDirectory = NSUInteger;
  NSSearchPathDomainMask = NSUInteger;
  NSVolumeEnumerationOptions = NSUInteger;
  NSDirectoryEnumerationOptions = NSUInteger;
  NSFileManagerItemReplacementOptions = NSUInteger;
  NSURLRelationship = NSInteger;
  NSFileManagerUnmountOptions = NSUInteger;
  TFoundationErrorHandler = function(param1: NSURL; param2: NSError)
    : Boolean; cdecl;
  FourCharCode = UInt32;
  OSType = FourCharCode;
  NSPointerFunctionsOptions = NSUInteger;
  TFoundationBlock5 = function(param1: Pointer): NSUInteger; cdecl;
  TFoundationHashFunction = function(param1: Pointer; param2: TFoundationBlock5)
    : NSUInteger; cdecl;
  TFoundationIsEqualFunction = function(param1: Pointer; param2: Pointer;
    param3: TFoundationBlock5): Boolean; cdecl;
  TFoundationDescriptionFunction = function(param1: Pointer): NSString; cdecl;
  TFoundationRelinquishFunction = procedure(param1: Pointer;
    param2: TFoundationBlock5); cdecl;
  TFoundationAcquireFunction = function(param1: Pointer;
    param2: TFoundationBlock5; param3: Boolean): Pointer; cdecl;
  NSHashTableOptions = NSUInteger;
  NSHTTPCookieAcceptPolicy = NSUInteger;
  TFoundationCompletionHandler2 = procedure(param1: NSArray) of object;
  TFoundationBlock6 = procedure(param1: NSUInteger; param2: PBoolean) of object;
  TFoundationPredicate3 = function(param1: NSUInteger; param2: PBoolean)
    : Boolean; cdecl;
  TFoundationBlock7 = procedure(param1: NSRange; param2: PBoolean) of object;
  NSJSONReadingOptions = NSUInteger;
  NSJSONWritingOptions = NSUInteger;
  NSKeyValueObservingOptions = NSUInteger;
  NSKeyValueChange = NSUInteger;
  NSKeyValueSetMutationKind = NSUInteger;
  NSPropertyListMutabilityOptions = NSUInteger;
  NSPropertyListFormat = NSUInteger;
  NSPropertyListReadOptions = NSPropertyListMutabilityOptions;
  NSPropertyListWriteOptions = NSUInteger;
  NSLocaleLanguageDirection = NSUInteger;
  NSMapTableOptions = NSUInteger;
  TFoundationUsingBlock2 = procedure(param1: NSNotification) of object;
  NSPostingStyle = NSUInteger;
  NSNotificationCoalescing = NSUInteger;
  NSNumberFormatterBehavior = NSUInteger;
  NSNumberFormatterStyle = NSUInteger;
  NSNumberFormatterPadPosition = NSUInteger;
  NSNumberFormatterRoundingMode = NSUInteger;
  NSOperationQueuePriority = NSInteger;
  dispatch_queue_t = Pointer;
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
  NSRegularExpressionOptions = NSUInteger;
  NSMatchingOptions = NSUInteger;
  NSMatchingFlags = NSUInteger;
  TFoundationUsingBlock3 = procedure(param1: NSTextCheckingResult;
    param2: NSMatchingFlags; param3: PBoolean) of object;
  CFRunLoopRef = Pointer;
  NSStreamStatus = NSUInteger;
  NSStreamEvent = NSUInteger;
  NSTimeZoneNameStyle = NSInteger;
  NSURLBookmarkCreationOptions = NSUInteger;
  NSURLBookmarkResolutionOptions = NSUInteger;
  NSURLBookmarkFileCreationOptions = NSUInteger;
  NSURLCacheStoragePolicy = NSUInteger;
  TFoundationCompletionHandler3 = procedure(param1: NSCachedURLResponse)
    of object;
  TFoundationCompletionHandler4 = procedure(param1: NSURLResponse;
    param2: NSData; param3: NSError) of object;
  NSURLCredentialPersistence = NSUInteger;
  SecIdentityRef = Pointer;
  SecTrustRef = Pointer;
  TFoundationCompletionHandler5 = procedure(param1: NSDictionary) of object;
  TFoundationCompletionHandler6 = procedure(param1: NSURLCredential) of object;
  NSURLRequestCachePolicy = NSUInteger;
  NSURLRequestNetworkServiceType = NSUInteger;
  NSXMLParserExternalEntityResolvingPolicy = NSUInteger;
  NSXMLParserError = NSInteger;
  NSAttributedStringEnumerationOptions = NSUInteger;
  TFoundationUsingBlock4 = procedure(param1: NSDictionary; param2: NSRange;
    param3: PBoolean) of object;
  NSByteCountFormatterUnits = NSUInteger;
  NSByteCountFormatterCountStyle = NSInteger;
  TFoundationBlock8 = function(param1: Pointer; param2: NSDictionary)
    : Boolean; cdecl;
  NSComparisonPredicateOptions = NSUInteger;
  NSComparisonPredicateModifier = NSUInteger;
  NSPredicateOperatorType = NSUInteger;
  NSCompoundPredicateType = NSUInteger;
  NSDateComponentsFormatterUnitsStyle = NSInteger;
  NSDateComponentsFormatterZeroFormattingBehavior = NSUInteger;
  NSExpressionType = NSUInteger;
  TFoundationBlock9 = function(param1: Pointer; param2: NSArray;
    param3: NSMutableDictionary): Pointer; cdecl;
  NSItemProviderCompletionHandler = procedure(param1: Pointer; param2: NSError)
    of object;
  NSItemProviderLoadHandler = procedure(param1: NSItemProviderCompletionHandler;
    param2: Pointer; param3: NSDictionary) of object;
  NSItemProviderErrorCode = NSInteger;
  NSFileCoordinatorReadingOptions = NSUInteger;
  NSFileCoordinatorWritingOptions = NSUInteger;
  TFoundationByAccessor = procedure(param1: NSURL) of object;
  TFoundationByAccessor1 = procedure(param1: NSURL; param2: NSURL) of object;
  TFoundationByAccessor2 = procedure(param1: TFoundationCancellationHandler)
    of object;
  NSFileVersionAddingOptions = NSUInteger;
  NSFileVersionReplacingOptions = NSUInteger;
  TFoundationCompletionHandler7 = procedure(param1: NSArray; param2: NSError)
    of object;
  NSFileWrapperReadingOptions = NSUInteger;
  NSFileWrapperWritingOptions = NSUInteger;
  NSLinguisticTaggerOptions = NSUInteger;
  TFoundationBlock10 = procedure(param1: Pointer; param2: NSUInteger;
    param3: PBoolean) of object;
  NSNetServicesError = NSInteger;
  NSNetServiceOptions = NSUInteger;
  TFoundationHandler = procedure(param1: Pointer) of object;
  TFoundationCompletionHandler8 = procedure(param1: NSArray; param2: NSArray;
    param3: NSArray) of object;
  TFoundationCompletionHandler9 = procedure(param1: NSData;
    param2: NSURLResponse; param3: NSError) of object;
  TFoundationCompletionHandler10 = procedure(param1: NSURL;
    param2: NSURLResponse; param3: NSError) of object;
  NSURLSessionTaskState = NSInteger;
  TFoundationCompletionHandler11 = procedure(param1: NSData) of object;
  TFoundationCompletionHandler12 = procedure(param1: NSData; param2: Boolean;
    param3: NSError) of object;
  SSLProtocol = Integer;
  NSURLSessionAuthChallengeDisposition = NSInteger;
  NSURLSessionResponseDisposition = NSInteger;
  TFoundationCompletionHandler13 = procedure
    (param1: NSURLSessionAuthChallengeDisposition; param2: NSURLCredential)
    of object;
  TFoundationCompletionHandler14 = procedure(param1: NSURLRequest) of object;
  TFoundationNeedNewBodyStream = procedure(param1: NSInputStream) of object;
  TFoundationCompletionHandler15 = procedure
    (param1: NSURLSessionResponseDisposition) of object;
  TFoundationCompletionHandler16 = procedure(param1: NSInputStream;
    param2: NSOutputStream; param3: NSError) of object;
  // ===== Interface declarations =====

  NSStringClass = interface(NSObjectClass)
    ['{A340EABB-8730-45BB-B958-1923180712B4}']
    { class } function availableStringEncodings: PNSStringEncoding; cdecl;
    { class } function localizedNameOfStringEncoding(encoding: NSStringEncoding)
      : NSString; cdecl;
    { class } function defaultCStringEncoding: NSStringEncoding; cdecl;
    { class } function &string: Pointer { instancetype }; cdecl;
    { class } function stringWithString(&string: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function stringWithCharacters(characters: unsigned short *;
      length: NSUInteger): Pointer { instancetype }; cdecl;
    { class } function stringWithUTF8String(nullTerminatedCString
      : MarshaledAString): Pointer { instancetype }; cdecl;
    { class } function stringWithFormat(format: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function localizedStringWithFormat(format: NSString)
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
    ['{E44E01B3-CF7F-45B6-A144-8F0D19622801}']
    function length: NSUInteger; cdecl;
    function characterAtIndex(index: NSUInteger): unichar; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function substringFromIndex(from: NSUInteger): NSString; cdecl;
    function substringToIndex(&to: NSUInteger): NSString; cdecl;
    function substringWithRange(range: NSRange): NSString; cdecl;
    [MethodName('getCharacters:range:')]
    procedure getCharactersRange(buffer: unsigned short *;
      range: NSRange); cdecl;
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
    procedure getLineStart(startPtr: PCardinal; &end: PCardinal;
      contentsEnd: PCardinal; forRange: NSRange); cdecl;
    function lineRangeForRange(range: NSRange): NSRange; cdecl;
    procedure getParagraphStart(startPtr: PCardinal; &end: PCardinal;
      contentsEnd: PCardinal; forRange: NSRange); cdecl;
    function paragraphRangeForRange(range: NSRange): NSRange; cdecl;
    procedure enumerateSubstringsInRange(range: NSRange;
      options: NSStringEnumerationOptions;
      usingBlock: TFoundationUsingBlock); cdecl;
    procedure enumerateLinesUsingBlock(block: TFoundationBlock1); cdecl;
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
      usedLength: PCardinal; encoding: NSStringEncoding;
      options: NSStringEncodingConversionOptions; range: NSRange;
      remainingRange: NSRangePointer): Boolean; cdecl;
    function maximumLengthOfBytesUsingEncoding(enc: NSStringEncoding)
      : NSUInteger; cdecl;
    function lengthOfBytesUsingEncoding(enc: NSStringEncoding)
      : NSUInteger; cdecl;
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
    function stringByApplyingTransform(transform: NSString; reverse: Boolean)
      : NSString; cdecl;
    [MethodName('writeToURL:atomically:encoding:error:')]
    function writeToURLAtomicallyEncodingError(url: NSURL; atomically: Boolean;
      encoding: NSStringEncoding; error: NSError): Boolean; cdecl;
    [MethodName('writeToFile:atomically:encoding:error:')]
    function writeToFileAtomicallyEncodingError(path: NSString;
      atomically: Boolean; encoding: NSStringEncoding; error: NSError)
      : Boolean; cdecl;
    function description: NSString; cdecl;
    function hash: NSUInteger; cdecl;
    function initWithCharactersNoCopy(characters: unsigned short *;
      length: NSUInteger; freeWhenDone: Boolean)
      : Pointer { instancetype }; cdecl;
    function initWithCharacters(characters: unsigned short *;
      length: NSUInteger): Pointer { instancetype }; cdecl;
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
    function initWithData(data: NSData; encoding: NSStringEncoding)
      : Pointer { instancetype }; cdecl;
    function initWithBytes(bytes: Pointer; length: NSUInteger;
      encoding: NSStringEncoding): Pointer { instancetype }; cdecl;
    function initWithBytesNoCopy(bytes: Pointer; length: NSUInteger;
      encoding: NSStringEncoding; freeWhenDone: Boolean)
      : Pointer { instancetype }; cdecl;
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
    procedure getCharacters(buffer: unsigned short * ); cdecl;
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
    function linguisticTagsInRange(range: NSRange; scheme: NSString;
      options: NSLinguisticTaggerOptions; orthography: NSOrthography;
      tokenRanges: NSArray): NSArray; cdecl;
    procedure enumerateLinguisticTagsInRange(range: NSRange; scheme: NSString;
      options: NSLinguisticTaggerOptions; orthography: NSOrthography;
      usingBlock: TFoundationUsingBlock); cdecl;
  end;

  TNSString = class(TOCGenericImport<NSStringClass, NSString>)
  end;

  PNSString = Pointer;

  NSInvocationClass = interface(NSObjectClass)
    ['{2F1719B2-D0D2-4155-9D87-80E342097CE0}']
    { class } function invocationWithMethodSignature(sig: NSMethodSignature)
      : NSInvocation; cdecl;
  end;

  NSInvocation = interface(NSObject)
    ['{DF644173-81DE-4234-8ACD-EEF5C077D236}']
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
  end;

  TNSInvocation = class(TOCGenericImport<NSInvocationClass, NSInvocation>)
  end;

  PNSInvocation = Pointer;

  NSMethodSignatureClass = interface(NSObjectClass)
    ['{F9CFAFFB-B39A-41F0-902B-52AE6B11D72B}']
    { class } function signatureWithObjCTypes(types: MarshaledAString)
      : NSMethodSignature; cdecl;
  end;

  NSMethodSignature = interface(NSObject)
    ['{B13FF103-0007-4ECA-BDC0-820BE4EF439D}']
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
    ['{139C7D0C-4676-4011-80BA-4958D97F338F}']
  end;

  NSCoder = interface(NSObject)
    ['{7230C8C5-5F73-4978-8E04-8D523DF1FBB0}']
    procedure encodeValueOfObjCType(&type: MarshaledAString;
      at: Pointer); cdecl;
    procedure encodeDataObject(data: NSData); cdecl;
    procedure decodeValueOfObjCType(&type: MarshaledAString;
      at: Pointer); cdecl;
    function decodeDataObject: NSData; cdecl;
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
    function decodeBytesWithReturnedLength(lengthp: PCardinal): Pointer; cdecl;
    procedure setObjectZone(zone: Pointer); cdecl;
    function objectZone: Pointer; cdecl;
    function systemVersion: Cardinal; cdecl;
    function allowsKeyedCoding: Boolean; cdecl;
    [MethodName('encodeObject:forKey:')]
    procedure encodeObjectForKey(objv: Pointer; forKey: NSString); cdecl;
    [MethodName('encodeConditionalObject:forKey:')]
    procedure encodeConditionalObjectForKey(objv: Pointer;
      forKey: NSString); cdecl;
    procedure encodeBool(boolv: Boolean; forKey: NSString); cdecl;
    procedure encodeInt(intv: Integer; forKey: NSString); cdecl;
    procedure encodeInt32(intv: Int32; forKey: NSString); cdecl;
    procedure encodeInt64(intv: Int64; forKey: NSString); cdecl;
    procedure encodeFloat(realv: Single; forKey: NSString); cdecl;
    procedure encodeDouble(realv: Double; forKey: NSString); cdecl;
    [MethodName('encodeBytes:length:forKey:')]
    procedure encodeBytesLengthForKey(bytesp: PByte; length: NSUInteger;
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
    function decodeBytesForKey(key: NSString; returnedLength: PCardinal)
      : PByte; cdecl;
    procedure encodeInteger(intv: NSInteger; forKey: NSString); cdecl;
    function decodeIntegerForKey(key: NSString): NSInteger; cdecl;
    function requiresSecureCoding: Boolean; cdecl;
    function decodeObjectOfClass(aClass: Pointer; forKey: NSString)
      : Pointer; cdecl;
    function decodeTopLevelObjectOfClass(aClass: Pointer; forKey: NSString;
      error: NSError): Pointer; cdecl;
    function decodeObjectOfClasses(classes: NSSet; forKey: NSString)
      : Pointer; cdecl;
    function decodeTopLevelObjectOfClasses(classes: NSSet; forKey: NSString;
      error: NSError): Pointer; cdecl;
    function decodePropertyListForKey(key: NSString): Pointer; cdecl;
    function allowedClasses: NSSet; cdecl;
    procedure failWithError(error: NSError); cdecl;
  end;

  TNSCoder = class(TOCGenericImport<NSCoderClass, NSCoder>)
  end;

  PNSCoder = Pointer;

  NSEnumeratorClass = interface(NSObjectClass)
    ['{859ADD2D-9A18-473A-980C-4B4411D8D27C}']
  end;

  NSEnumerator = interface(NSObject)
    ['{BE8C2C29-38DA-4056-BBC2-939B037B00C7}']
    function nextObject: ObjectType; cdecl;
    function allObjects: NSArray; cdecl;
  end;

  TNSEnumerator = class(TOCGenericImport<NSEnumeratorClass, NSEnumerator>)
  end;

  PNSEnumerator = Pointer;

  NSCoderMethods = interface(IObjectiveC)
    ['{B541E5CF-97AD-4325-9FC3-31F7AFDFD3E1}']
    function version: NSInteger; cdecl;
    procedure setVersion(aVersion: NSInteger); cdecl;
    function classForCoder: Pointer; cdecl;
    function replacementObjectForCoder(aCoder: NSCoder): Pointer; cdecl;
    function awakeAfterUsingCoder(aDecoder: NSCoder): Pointer; cdecl;
  end;

  NSDiscardableContentProxy = interface(IObjectiveC)
    ['{15CA7248-2E3B-410B-A4BE-89CEB32258CA}']
    function autoContentAccessingProxy: Pointer; cdecl;
  end;

  NSArrayClass = interface(NSObjectClass)
    ['{908704B3-B200-4EAA-BCC0-1C9F49FE1878}']
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
    { class } function arrayWithContentsOfFile(path: NSString): NSArray; cdecl;
    { class } function arrayWithContentsOfURL(url: NSURL): NSArray; cdecl;
  end;

  NSArray = interface(NSObject)
    ['{DC6C1C19-E50E-49DB-950D-BDE6BF42C562}']
    function count: NSUInteger; cdecl;
    function objectAtIndex(index: NSUInteger): ObjectType; cdecl;
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithObjects:count:')]
    function initWithObjectsCount(objects: ObjectType; count: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
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
    function writeToFile(path: NSString; atomically: Boolean): Boolean; cdecl;
    function writeToURL(url: NSURL; atomically: Boolean): Boolean; cdecl;
    [MethodName('makeObjectsPerformSelector:')]
    procedure makeObjectsPerformSelector(aSelector: SEL); cdecl;
    [MethodName('makeObjectsPerformSelector:withObject:')]
    procedure makeObjectsPerformSelectorWithObject(aSelector: SEL;
      withObject: Pointer); cdecl;
    function objectsAtIndexes(indexes: NSIndexSet): NSArray; cdecl;
    function objectAtIndexedSubscript(idx: NSUInteger): ObjectType; cdecl;
    procedure enumerateObjectsUsingBlock(block: TFoundationBlock); cdecl;
    procedure enumerateObjectsWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock); cdecl;
    procedure enumerateObjectsAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; usingBlock: TFoundationBlock); cdecl;
    function indexOfObjectPassingTest(predicate: TFoundationPredicate)
      : NSUInteger; cdecl;
    function indexOfObjectWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate): NSUInteger; cdecl;
    function indexOfObjectAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; passingTest: TFoundationPredicate)
      : NSUInteger; cdecl;
    function indexesOfObjectsPassingTest(predicate: TFoundationPredicate)
      : NSIndexSet; cdecl;
    function indexesOfObjectsWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate): NSIndexSet; cdecl;
    function indexesOfObjectsAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; passingTest: TFoundationPredicate)
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
    function initWithContentsOfFile(path: NSString): NSArray; cdecl;
    function initWithContentsOfURL(url: NSURL): NSArray; cdecl;
    [MethodName('getObjects:')]
    procedure getObjects(objects: ObjectType); cdecl;
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
    ['{E80A9750-ECDB-4FE5-9DE1-6E4728EAF480}']
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
    { class } function dictionaryWithContentsOfFile(path: NSString)
      : NSDictionary; cdecl;
    { class } function dictionaryWithContentsOfURL(url: NSURL)
      : NSDictionary; cdecl;
    { class } function sharedKeySetForKeys(keys: NSArray): Pointer; cdecl;
  end;

  NSDictionary = interface(NSObject)
    ['{A28CD249-49CF-4262-A3FB-037EA4959498}']
    function count: NSUInteger; cdecl;
    function objectForKey(aKey: KeyType): ObjectType; cdecl;
    function keyEnumerator: NSEnumerator; cdecl;
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithObjects:forKeys:count:')]
    function initWithObjectsForKeysCount(objects: ObjectType; forKeys: Pointer;
      count: NSUInteger): Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
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
    function writeToFile(path: NSString; atomically: Boolean): Boolean; cdecl;
    function writeToURL(url: NSURL; atomically: Boolean): Boolean; cdecl;
    function keysSortedByValueUsingSelector(comparator: SEL): NSArray; cdecl;
    [MethodName('getObjects:andKeys:count:')]
    procedure getObjectsAndKeysCount(objects: ObjectType; andKeys: KeyType;
      count: NSUInteger); cdecl;
    function objectForKeyedSubscript(key: KeyType): ObjectType; cdecl;
    procedure enumerateKeysAndObjectsUsingBlock
      (block: TFoundationBlock2); cdecl;
    procedure enumerateKeysAndObjectsWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock2); cdecl;
    function keysSortedByValueUsingComparator(cmptr: NSComparator)
      : NSArray; cdecl;
    function keysSortedByValueWithOptions(opts: NSSortOptions;
      usingComparator: NSComparator): NSArray; cdecl;
    function keysOfEntriesPassingTest(predicate: TFoundationPredicate1)
      : NSSet; cdecl;
    function keysOfEntriesWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate1): NSSet; cdecl;
    [MethodName('getObjects:andKeys:')]
    procedure getObjectsAndKeys(objects: ObjectType; andKeys: KeyType); cdecl;
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
    function initWithContentsOfFile(path: NSString): NSDictionary; cdecl;
    function initWithContentsOfURL(url: NSURL): NSDictionary; cdecl;
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
    ['{A8B02C01-9D8A-4F1A-90A3-A5821C4AE5DC}']
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
    ['{D55E2FBD-9C8B-4E4F-A014-751C420626FC}']
    procedure getValue(value: Pointer); cdecl;
    function objCType: MarshaledAString; cdecl;
    function initWithBytes(value: Pointer; objCType: MarshaledAString)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function nonretainedObjectValue: Pointer; cdecl;
    function pointerValue: Pointer; cdecl;
    function isEqualToValue(value: NSValue): Boolean; cdecl;
    function rangeValue: NSRange; cdecl;
  end;

  TNSValue = class(TOCGenericImport<NSValueClass, NSValue>)
  end;

  PNSValue = Pointer;

  NSNumberClass = interface(NSValueClass)
    ['{3C2C61CB-B081-4DCC-923C-9EB04F27BF4C}']
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
    ['{C0517B6A-7E16-4BE0-AD88-14CC08B17B4C}']
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
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

  NSDataClass = interface(NSObjectClass)
    ['{C0991BE9-381A-46BB-A454-F49691383177}']
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
    ['{BA5EE9FA-B5F1-41BD-9F1D-9395A763383F}']
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
    procedure enumerateByteRangesUsingBlock(block: TFoundationBlock4); cdecl;
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
      length: NSUInteger; deallocator: TFoundationDeallocator)
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
    [MethodName('getBytes:')]
    procedure getBytes(buffer: Pointer); cdecl;
    function initWithContentsOfMappedFile(path: NSString): Pointer; cdecl;
    function initWithBase64Encoding(base64String: NSString): Pointer; cdecl;
    function base64Encoding: NSString; cdecl;
  end;

  TNSData = class(TOCGenericImport<NSDataClass, NSData>)
  end;

  PNSData = Pointer;

  NSIndexSetClass = interface(NSObjectClass)
    ['{3DDABD31-A275-4529-92EE-3A5A1247ABAB}']
    { class } function indexSet: Pointer { instancetype }; cdecl;
    { class } function indexSetWithIndex(value: NSUInteger)
      : Pointer { instancetype }; cdecl;
    { class } function indexSetWithIndexesInRange(range: NSRange)
      : Pointer { instancetype }; cdecl;
  end;

  NSIndexSet = interface(NSObject)
    ['{5E1E8551-0B88-4A68-B9A6-CAB83BE5CFE2}']
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
    function getIndexes(indexBuffer: PCardinal; maxCount: NSUInteger;
      inIndexRange: NSRangePointer): NSUInteger; cdecl;
    function countOfIndexesInRange(range: NSRange): NSUInteger; cdecl;
    function containsIndex(value: NSUInteger): Boolean; cdecl;
    function containsIndexesInRange(range: NSRange): Boolean; cdecl;
    function containsIndexes(indexSet: NSIndexSet): Boolean; cdecl;
    function intersectsIndexesInRange(range: NSRange): Boolean; cdecl;
    procedure enumerateIndexesUsingBlock(block: TFoundationBlock6); cdecl;
    procedure enumerateIndexesWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock6); cdecl;
    procedure enumerateIndexesInRange(range: NSRange;
      options: NSEnumerationOptions; usingBlock: TFoundationBlock6); cdecl;
    function indexPassingTest(predicate: TFoundationPredicate3)
      : NSUInteger; cdecl;
    function indexWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate3): NSUInteger; cdecl;
    function indexInRange(range: NSRange; options: NSEnumerationOptions;
      passingTest: TFoundationPredicate3): NSUInteger; cdecl;
    function indexesPassingTest(predicate: TFoundationPredicate3)
      : NSIndexSet; cdecl;
    function indexesWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate3): NSIndexSet; cdecl;
    function indexesInRange(range: NSRange; options: NSEnumerationOptions;
      passingTest: TFoundationPredicate3): NSIndexSet; cdecl;
    procedure enumerateRangesUsingBlock(block: TFoundationBlock7); cdecl;
    procedure enumerateRangesWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock7); cdecl;
    procedure enumerateRangesInRange(range: NSRange;
      options: NSEnumerationOptions; usingBlock: TFoundationBlock7); cdecl;
  end;

  TNSIndexSet = class(TOCGenericImport<NSIndexSetClass, NSIndexSet>)
  end;

  PNSIndexSet = Pointer;

  NSURLClass = interface(NSObjectClass)
    ['{B6CF0679-80F3-4706-8BA4-4F162F2C4FD0}']
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
    ['{82F94C2C-E54C-4FAA-850C-D18D00969210}']
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
    function getResourceValue(value: Pointer; forKey: NSString; error: NSError)
      : Boolean; cdecl;
    function resourceValuesForKeys(keys: NSArray; error: NSError)
      : NSDictionary; cdecl;
    function setResourceValue(value: Pointer; forKey: NSString; error: NSError)
      : Boolean; cdecl;
    function setResourceValues(keyedValues: NSDictionary; error: NSError)
      : Boolean; cdecl;
    procedure removeCachedResourceValueForKey(key: NSString); cdecl;
    procedure removeAllCachedResourceValues; cdecl;
    procedure setTemporaryResourceValue(value: Pointer;
      forKey: NSString); cdecl;
    function bookmarkDataWithOptions(options: NSURLBookmarkCreationOptions;
      includingResourceValuesForKeys: NSArray; relativeToURL: NSURL;
      error: NSError): NSData; cdecl;
    function initByResolvingBookmarkData(bookmarkData: NSData;
      options: NSURLBookmarkResolutionOptions; relativeToURL: NSURL;
      bookmarkDataIsStale: PBoolean; error: NSError)
      : Pointer { instancetype }; cdecl;
    function startAccessingSecurityScopedResource: Boolean; cdecl;
    procedure stopAccessingSecurityScopedResource; cdecl;
    function getPromisedItemResourceValue(value: Pointer; forKey: NSString;
      error: NSError): Boolean; cdecl;
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
    ['{F0F280D6-DB8B-49FD-9269-796D45DD0E44}']
    { class } function arrayWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
    { class } function arrayWithContentsOfFile(path: NSString)
      : NSMutableArray; cdecl;
    { class } function arrayWithContentsOfURL(url: NSURL)
      : NSMutableArray; cdecl;
  end;

  NSMutableArray = interface(NSArray)
    ['{3CC08169-7A7D-4B87-B87A-28CD3DE326F8}']
    procedure addObject(anObject: ObjectType); cdecl;
    procedure insertObject(anObject: ObjectType; atIndex: NSUInteger); cdecl;
    procedure removeLastObject; cdecl;
    procedure removeObjectAtIndex(index: NSUInteger); cdecl;
    procedure replaceObjectAtIndex(index: NSUInteger;
      withObject: ObjectType); cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
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
    procedure removeObjectsFromIndices(indices: PCardinal;
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
    procedure sortUsingDescriptors(sortDescriptors: NSArray); cdecl;
    procedure filterUsingPredicate(predicate: NSPredicate); cdecl;
  end;

  TNSMutableArray = class(TOCGenericImport<NSMutableArrayClass, NSMutableArray>)
  end;

  PNSMutableArray = Pointer;

  NSAutoreleasePoolClass = interface(NSObjectClass)
    ['{708DA615-0D9D-489A-93FB-35542E8818E9}']
    { class } procedure addObject(anObject: Pointer); cdecl;
  end;

  NSAutoreleasePool = interface(NSObject)
    ['{00883D52-A6F1-46BC-996C-7E58FE020859}']
    procedure addObject(anObject: Pointer); cdecl;
    procedure drain; cdecl;
  end;

  TNSAutoreleasePool = class(TOCGenericImport<NSAutoreleasePoolClass,
    NSAutoreleasePool>)
  end;

  PNSAutoreleasePool = Pointer;

  NSCharacterSetClass = interface(NSObjectClass)
    ['{817676E0-F66C-40BB-B4C9-4554D638E2DD}']
    { class } function controlCharacterSet: NSCharacterSet; cdecl;
    { class } function whitespaceCharacterSet: NSCharacterSet; cdecl;
    { class } function whitespaceAndNewlineCharacterSet: NSCharacterSet; cdecl;
    { class } function decimalDigitCharacterSet: NSCharacterSet; cdecl;
    { class } function letterCharacterSet: NSCharacterSet; cdecl;
    { class } function lowercaseLetterCharacterSet: NSCharacterSet; cdecl;
    { class } function uppercaseLetterCharacterSet: NSCharacterSet; cdecl;
    { class } function nonBaseCharacterSet: NSCharacterSet; cdecl;
    { class } function alphanumericCharacterSet: NSCharacterSet; cdecl;
    { class } function decomposableCharacterSet: NSCharacterSet; cdecl;
    { class } function illegalCharacterSet: NSCharacterSet; cdecl;
    { class } function punctuationCharacterSet: NSCharacterSet; cdecl;
    { class } function capitalizedLetterCharacterSet: NSCharacterSet; cdecl;
    { class } function symbolCharacterSet: NSCharacterSet; cdecl;
    { class } function newlineCharacterSet: NSCharacterSet; cdecl;
    { class } function characterSetWithRange(aRange: NSRange)
      : NSCharacterSet; cdecl;
    { class } function characterSetWithCharactersInString(aString: NSString)
      : NSCharacterSet; cdecl;
    { class } function characterSetWithBitmapRepresentation(data: NSData)
      : NSCharacterSet; cdecl;
    { class } function characterSetWithContentsOfFile(fName: NSString)
      : NSCharacterSet; cdecl;
    { class } function URLUserAllowedCharacterSet: NSCharacterSet; cdecl;
    { class } function URLPasswordAllowedCharacterSet: NSCharacterSet; cdecl;
    { class } function URLHostAllowedCharacterSet: NSCharacterSet; cdecl;
    { class } function URLPathAllowedCharacterSet: NSCharacterSet; cdecl;
    { class } function URLQueryAllowedCharacterSet: NSCharacterSet; cdecl;
    { class } function URLFragmentAllowedCharacterSet: NSCharacterSet; cdecl;
  end;

  NSCharacterSet = interface(NSObject)
    ['{2902BF19-6E34-4F09-8261-96583EC870AD}']
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function characterIsMember(aCharacter: unichar): Boolean; cdecl;
    function bitmapRepresentation: NSData; cdecl;
    function invertedSet: NSCharacterSet; cdecl;
    function longCharacterIsMember(theLongChar: UTF32Char): Boolean; cdecl;
    function isSupersetOfSet(theOtherSet: NSCharacterSet): Boolean; cdecl;
    function hasMemberInPlane(thePlane: Byte): Boolean; cdecl;
  end;

  TNSCharacterSet = class(TOCGenericImport<NSCharacterSetClass, NSCharacterSet>)
  end;

  PNSCharacterSet = Pointer;

  NSErrorClass = interface(NSObjectClass)
    ['{F748581A-6652-41E6-BE36-CCF727C3CC9D}']
    { class } function errorWithDomain(domain: NSString; code: NSInteger;
      userInfo: NSDictionary): Pointer { instancetype }; cdecl;
    { class } procedure setUserInfoValueProviderForDomain(errorDomain: NSString;
      provider: TFoundationProvider); cdecl;
    { class } function userInfoValueProviderForDomain(errorDomain: NSString)
      : TFoundationProvider; cdecl;
  end;

  NSError = interface(NSObject)
    ['{ADE9F7C1-9FDC-4459-908D-391FFDCBF19C}']
    function initWithDomain(domain: NSString; code: NSInteger;
      userInfo: NSDictionary): Pointer { instancetype }; cdecl;
    function domain: NSString; cdecl;
    function code: NSInteger; cdecl;
    function userInfo: NSDictionary; cdecl;
    function localizedDescription: NSString; cdecl;
    function localizedFailureReason: NSString; cdecl;
    function localizedRecoverySuggestion: NSString; cdecl;
    function localizedRecoveryOptions: NSArray; cdecl;
    function recoveryAttempter: Pointer; cdecl;
    function helpAnchor: NSString; cdecl;
  end;

  TNSError = class(TOCGenericImport<NSErrorClass, NSError>)
  end;

  PNSError = Pointer;

  NSLocaleClass = interface(NSObjectClass)
    ['{A0FCB652-C127-4CA5-B626-AF06A2C4EE3F}']
    { class } function autoupdatingCurrentLocale: NSLocale; cdecl;
    { class } function currentLocale: NSLocale; cdecl;
    { class } function systemLocale: NSLocale; cdecl;
    { class } function localeWithLocaleIdentifier(ident: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function availableLocaleIdentifiers: NSArray; cdecl;
    { class } function ISOLanguageCodes: NSArray; cdecl;
    { class } function ISOCountryCodes: NSArray; cdecl;
    { class } function ISOCurrencyCodes: NSArray; cdecl;
    { class } function commonISOCurrencyCodes: NSArray; cdecl;
    { class } function preferredLanguages: NSArray; cdecl;
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
    ['{3857D4BE-75BF-405A-A299-7B274C41E87E}']
    function objectForKey(key: Pointer): Pointer; cdecl;
    function displayNameForKey(key: Pointer; value: Pointer): NSString; cdecl;
    function initWithLocaleIdentifier(&string: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function localeIdentifier: NSString; cdecl;
  end;

  TNSLocale = class(TOCGenericImport<NSLocaleClass, NSLocale>)
  end;

  PNSLocale = Pointer;

  NSMutableStringClass = interface(NSStringClass)
    ['{74B61400-A357-46C0-858E-F424C4E4E8B1}']
    { class } function stringWithCapacity(capacity: NSUInteger)
      : NSMutableString; cdecl;
  end;

  NSMutableString = interface(NSString)
    ['{73084E45-85A5-44AB-87FE-DFDBE06A0633}']
    procedure replaceCharactersInRange(range: NSRange;
      withString: NSString); cdecl;
    procedure insertString(aString: NSString; atIndex: NSUInteger); cdecl;
    procedure deleteCharactersInRange(range: NSRange); cdecl;
    procedure appendString(aString: NSString); cdecl;
    procedure appendFormat(format: NSString); cdecl;
    procedure setString(aString: NSString); cdecl;
    function replaceOccurrencesOfString(target: NSString; withString: NSString;
      options: NSStringCompareOptions; range: NSRange): NSUInteger; cdecl;
    function applyTransform(transform: NSString; reverse: Boolean;
      range: NSRange; updatedRange: NSRangePointer): Boolean; cdecl;
    function initWithCapacity(capacity: NSUInteger): NSMutableString; cdecl;
  end;

  TNSMutableString = class(TOCGenericImport<NSMutableStringClass,
    NSMutableString>)
  end;

  PNSMutableString = Pointer;

  NSSimpleCStringClass = interface(NSStringClass)
    ['{D1D3F5E4-8857-41C3-BF43-378A383F1003}']
  end;

  NSSimpleCString = interface(NSString)
    ['{6F8FBDE5-A6F9-4A00-A7DA-52DCAC5EF555}']
  end;

  TNSSimpleCString = class(TOCGenericImport<NSSimpleCStringClass,
    NSSimpleCString>)
  end;

  PNSSimpleCString = Pointer;

  NSConstantStringClass = interface(NSSimpleCStringClass)
    ['{6507CD3A-EB3B-4A89-B10E-557E28F08412}']
  end;

  NSConstantString = interface(NSSimpleCString)
    ['{E174337F-3244-42AE-BB50-062F9019FCF1}']
  end;

  TNSConstantString = class(TOCGenericImport<NSConstantStringClass,
    NSConstantString>)
  end;

  PNSConstantString = Pointer;

  NSSetClass = interface(NSObjectClass)
    ['{8AFEF1DD-A43F-401F-9001-19ACE02E9E49}']
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
    ['{04419C71-FA0F-4FF8-A713-41AB240661E5}']
    function count: NSUInteger; cdecl;
    function member(&object: ObjectType): ObjectType; cdecl;
    function objectEnumerator: NSEnumerator; cdecl;
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithObjects:count:')]
    function initWithObjectsCount(objects: ObjectType; count: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
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
    procedure enumerateObjectsUsingBlock(block: TFoundationBlock3); cdecl;
    procedure enumerateObjectsWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock3); cdecl;
    function objectsPassingTest(predicate: TFoundationPredicate2): NSSet; cdecl;
    function objectsWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate2): NSSet; cdecl;
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
    ['{9999F1E1-204B-45FC-8155-C5C107935C0F}']
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
    ['{D5677158-7A61-4A69-BADD-A45B79DDF53C}']
    procedure removeObjectForKey(aKey: KeyType); cdecl;
    [MethodName('setObject:forKey:')]
    procedure setObjectForKey(anObject: ObjectType; forKey: Pointer); cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
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
    ['{6BA8E2A6-0ED9-44C1-8ADB-27ACC017BA7A}']
    { class } function setWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
  end;

  NSMutableSet = interface(NSSet)
    ['{10D600A7-6344-41DE-972F-FD646BEAF22C}']
    procedure addObject(&object: ObjectType); cdecl;
    procedure removeObject(&object: ObjectType); cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
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
    ['{D26ACDAE-880A-4F95-A31B-FEA4C28A931D}']
  end;

  NSCountedSet = interface(NSMutableSet)
    ['{49785235-7DFD-40EA-A5F5-F95480B104AF}']
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
    ['{27B52893-25C6-4397-B51B-E447AA1E9758}']
    { class } function UUID: Pointer { instancetype }; cdecl;
  end;

  NSUUID = interface(NSObject)
    ['{EBDD0B8C-644A-4363-9E89-B21B50E6318B}']
    function init: Pointer { instancetype }; cdecl;
    function initWithUUIDString(&string: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithUUIDBytes(bytes: Byte): Pointer { instancetype }; cdecl;
    procedure getUUIDBytes(UUID: Byte); cdecl;
    function UUIDString: NSString; cdecl;
  end;

  TNSUUID = class(TOCGenericImport<NSUUIDClass, NSUUID>)
  end;

  PNSUUID = Pointer;

  NSLockClass = interface(NSObjectClass)
    ['{F5602808-2F0A-4D11-B016-7CCDC6184E93}']
  end;

  NSLock = interface(NSObject)
    ['{5157EF78-3ABD-4F2E-BAB6-CB39D9C1C58D}']
    function tryLock: Boolean; cdecl;
    function lockBeforeDate(limit: NSDate): Boolean; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TNSLock = class(TOCGenericImport<NSLockClass, NSLock>)
  end;

  PNSLock = Pointer;

  NSProgressClass = interface(NSObjectClass)
    ['{A3701202-7C43-416D-B303-201993841A8B}']
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
    ['{F4799915-0A9A-4D70-860E-AF4400B57943}']
    function initWithParent(parentProgressOrNil: NSProgress;
      userInfo: NSDictionary): Pointer { instancetype }; cdecl;
    procedure becomeCurrentWithPendingUnitCount(unitCount: Int64); cdecl;
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
      : TFoundationCancellationHandler); cdecl;
    function cancellationHandler: TFoundationCancellationHandler; cdecl;
    procedure setPausingHandler(pausingHandler
      : TFoundationCancellationHandler); cdecl;
    function pausingHandler: TFoundationCancellationHandler; cdecl;
    procedure setResumingHandler(resumingHandler
      : TFoundationCancellationHandler); cdecl;
    function resumingHandler: TFoundationCancellationHandler; cdecl;
    procedure setUserInfoObject(objectOrNil: Pointer; forKey: NSString); cdecl;
    function isIndeterminate: Boolean; cdecl;
    function fractionCompleted: Double; cdecl;
    procedure cancel; cdecl;
    procedure pause; cdecl;
    procedure resume; cdecl;
    function userInfo: NSDictionary; cdecl;
    procedure setKind(kind: NSString); cdecl;
    function kind: NSString; cdecl;
    procedure publish; cdecl;
    procedure unpublish; cdecl;
    function isOld: Boolean; cdecl;
  end;

  TNSProgress = class(TOCGenericImport<NSProgressClass, NSProgress>)
  end;

  PNSProgress = Pointer;

  NSBundleClass = interface(NSObjectClass)
    ['{71DFD264-496A-4D6A-9E8E-D431DE1E6EA9}']
    { class } function mainBundle: NSBundle; cdecl;
    { class } function bundleWithPath(path: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function bundleWithURL(url: NSURL)
      : Pointer { instancetype }; cdecl;
    { class } function bundleForClass(aClass: Pointer): NSBundle; cdecl;
    { class } function bundleWithIdentifier(identifier: NSString)
      : NSBundle; cdecl;
    { class } function allBundles: NSArray; cdecl;
    { class } function allFrameworks: NSArray; cdecl;
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
    ['{370BAE8A-7319-4165-8F97-CD0C1A3CA5F0}']
    function initWithPath(path: NSString): Pointer { instancetype }; cdecl;
    function initWithURL(url: NSURL): Pointer { instancetype }; cdecl;
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
    ['{98B21EA9-12CC-4AA0-97A8-2BF1E0A1B8C1}']
  end;

  NSBundleResourceRequest = interface(NSObject)
    ['{0B1FF702-A71C-4606-A241-176B816F4196}']
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
      : TFoundationCompletionHandler); cdecl;
    procedure conditionallyBeginAccessingResourcesWithCompletionHandler
      (completionHandler: TFoundationCompletionHandler1); cdecl;
    procedure endAccessingResources; cdecl;
    function progress: NSProgress; cdecl;
  end;

  TNSBundleResourceRequest = class
    (TOCGenericImport<NSBundleResourceRequestClass, NSBundleResourceRequest>)
  end;

  PNSBundleResourceRequest = Pointer;

  NSDateClass = interface(NSObjectClass)
    ['{747F944F-CE48-4E19-B941-C845DB5A0ECC}']
    { class } function timeIntervalSinceReferenceDate: NSTimeInterval; cdecl;
    { class } function date: Pointer { instancetype }; cdecl;
    { class } function dateWithTimeIntervalSinceNow(secs: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
    { class } function dateWithTimeIntervalSinceReferenceDate
      (ti: NSTimeInterval): Pointer { instancetype }; cdecl;
    { class } function dateWithTimeIntervalSince1970(secs: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
    { class } function dateWithTimeInterval(secsToBeAdded: NSTimeInterval;
      sinceDate: NSDate): Pointer { instancetype }; cdecl;
    { class } function distantFuture: NSDate; cdecl;
    { class } function distantPast: NSDate; cdecl;
  end;

  NSDate = interface(NSObject)
    ['{4C030A37-5A3F-437E-8C73-425CAB16F229}']
    function timeIntervalSinceReferenceDate: NSTimeInterval; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithTimeIntervalSinceReferenceDate(ti: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
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
    ['{9499C045-00CA-4C1D-8A58-94D40D944090}']
  end;

  NSDateComponents = interface(NSObject)
    ['{CA557739-15CB-4B0C-9299-1F160687E45A}']
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
    ['{D246554A-74FE-4833-A453-258C0CC9B217}']
    { class } function systemTimeZone: NSTimeZone; cdecl;
    { class } procedure resetSystemTimeZone; cdecl;
    { class } function defaultTimeZone: NSTimeZone; cdecl;
    { class } procedure setDefaultTimeZone(aTimeZone: NSTimeZone); cdecl;
    { class } function localTimeZone: NSTimeZone; cdecl;
    { class } function knownTimeZoneNames: NSArray; cdecl;
    { class } function abbreviationDictionary: NSDictionary; cdecl;
    { class } procedure setAbbreviationDictionary(dict: NSDictionary); cdecl;
    { class } function timeZoneDataVersion: NSString; cdecl;
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
    ['{51917F97-46E5-4347-9FD3-7F4161852A59}']
    function name: NSString; cdecl;
    function data: NSData; cdecl;
    function secondsFromGMTForDate(aDate: NSDate): NSInteger; cdecl;
    function abbreviationForDate(aDate: NSDate): NSString; cdecl;
    function isDaylightSavingTimeForDate(aDate: NSDate): Boolean; cdecl;
    function daylightSavingTimeOffsetForDate(aDate: NSDate)
      : NSTimeInterval; cdecl;
    function nextDaylightSavingTimeTransitionAfterDate(aDate: NSDate)
      : NSDate; cdecl;
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
    ['{A851A51A-7552-4EA5-9309-87E94EC6DD2F}']
    { class } function currentCalendar: NSCalendar; cdecl;
    { class } function autoupdatingCurrentCalendar: NSCalendar; cdecl;
    { class } function calendarWithIdentifier(calendarIdentifierConstant
      : NSString): NSCalendar; cdecl;
  end;

  NSCalendar = interface(NSObject)
    ['{AFC24102-316B-496E-9EBD-71501A3114FA}']
    function initWithCalendarIdentifier(ident: NSString): Pointer; cdecl;
    function calendarIdentifier: NSString; cdecl;
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
      startDate: NSDate; interval: PDouble; forDate: NSDate): Boolean; cdecl;
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
    procedure getEraYearMonthDayFromDate(eraValuePointer: PInteger;
      year: PInteger; month: PInteger; day: PInteger; fromDate: NSDate); cdecl;
    [MethodName('getEra:yearForWeekOfYear:weekOfYear:weekday:fromDate:')]
    procedure getEraYearForWeekOfYearWeekOfYearWeekdayFromDate(eraValuePointer
      : PInteger; yearForWeekOfYear: PInteger; weekOfYear: PInteger;
      weekday: PInteger; fromDate: NSDate); cdecl;
    procedure getHour(hourValuePointer: PInteger; minute: PInteger;
      second: PInteger; nanosecond: PInteger; fromDate: NSDate); cdecl;
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
    function rangeOfWeekendStartDate(datep: NSDate; interval: PDouble;
      containingDate: NSDate): Boolean; cdecl;
    function nextWeekendStartDate(datep: NSDate; interval: PDouble;
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
      usingBlock: TFoundationUsingBlock1); cdecl;
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
    ['{DBE5AD79-C8B8-46EC-B5EC-90D9BB5D63F1}']
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
    ['{75A0D468-D8A7-4C00-A9DB-18B636C554A9}']
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
    ['{4C5F3932-1DE2-4338-B36D-83C3587C5670}']
    { class } function dataWithCapacity(aNumItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
    { class } function dataWithLength(length: NSUInteger)
      : Pointer { instancetype }; cdecl;
  end;

  NSMutableData = interface(NSData)
    ['{4A5F6952-3167-44B6-A7F1-346E5C4D98AC}']
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
  end;

  TNSMutableData = class(TOCGenericImport<NSMutableDataClass, NSMutableData>)
  end;

  PNSMutableData = Pointer;

  NSPurgeableDataClass = interface(NSMutableDataClass)
    ['{E27E6D58-1D19-40D4-A8E4-BD02EC1032E1}']
  end;

  NSPurgeableData = interface(NSMutableData)
    ['{67F228A9-B518-456D-AB35-E3B16D06E9EA}']
  end;

  TNSPurgeableData = class(TOCGenericImport<NSPurgeableDataClass,
    NSPurgeableData>)
  end;

  PNSPurgeableData = Pointer;

  NSAttributedStringClass = interface(NSObjectClass)
    ['{B2933B78-826B-4F90-830C-8B5880FD7492}']
  end;

  NSAttributedString = interface(NSObject)
    ['{BD1941BB-2276-4FE6-B732-BD8936F83842}']
    function &string: NSString; cdecl;
    [MethodName('attributesAtIndex:effectiveRange:')]
    function attributesAtIndexEffectiveRange(location: NSUInteger;
      effectiveRange: NSRangePointer): NSDictionary; cdecl;
    function length: NSUInteger; cdecl;
    [MethodName('attribute:atIndex:effectiveRange:')]
    function attributeAtIndexEffectiveRange(attrName: NSString;
      atIndex: NSUInteger; effectiveRange: NSRangePointer): Pointer; cdecl;
    function attributedSubstringFromRange(range: NSRange)
      : NSAttributedString; cdecl;
    [MethodName('attributesAtIndex:longestEffectiveRange:inRange:')]
    function attributesAtIndexLongestEffectiveRangeInRange(location: NSUInteger;
      longestEffectiveRange: NSRangePointer; inRange: NSRange)
      : NSDictionary; cdecl;
    [MethodName('attribute:atIndex:longestEffectiveRange:inRange:')]
    function attributeAtIndexLongestEffectiveRangeInRange(attrName: NSString;
      atIndex: NSUInteger; longestEffectiveRange: NSRangePointer;
      inRange: NSRange): Pointer; cdecl;
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
    procedure enumerateAttribute(attrName: NSString; inRange: NSRange;
      options: NSAttributedStringEnumerationOptions;
      usingBlock: TFoundationBlock4); cdecl;
  end;

  TNSAttributedString = class(TOCGenericImport<NSAttributedStringClass,
    NSAttributedString>)
  end;

  PNSAttributedString = Pointer;

  NSFormatterClass = interface(NSObjectClass)
    ['{DE01EF5A-1326-4BEB-BB2A-85E79287D394}']
  end;

  NSFormatter = interface(NSObject)
    ['{B43FD3A9-001A-45AB-A85C-C72D0765158E}']
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
    ['{9D80E5F9-8D13-419D-B9A3-F3A6417318FA}']
    { class } function localizedStringFromDate(date: NSDate;
      dateStyle: NSDateFormatterStyle; timeStyle: NSDateFormatterStyle)
      : NSString; cdecl;
    { class } function dateFormatFromTemplate(tmplate: NSString;
      options: NSUInteger; locale: NSLocale): NSString; cdecl;
    { class } function defaultFormatterBehavior: NSDateFormatterBehavior; cdecl;
    { class } procedure setDefaultFormatterBehavior
      (behavior: NSDateFormatterBehavior); cdecl;
  end;

  NSDateFormatter = interface(NSFormatter)
    ['{9E498772-00B6-47A9-9420-4CEB1F044604}']
    procedure setFormattingContext(formattingContext
      : NSFormattingContext); cdecl;
    function formattingContext: NSFormattingContext; cdecl;
    function getObjectValue(obj: Pointer; forString: NSString; range: Pointer;
      error: NSError): Boolean; cdecl;
    function stringFromDate(date: NSDate): NSString; cdecl;
    function dateFromString(&string: NSString): NSDate; cdecl;
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
    ['{257EF209-8246-4729-845E-B8BB445ABA38}']
  end;

  NSDateIntervalFormatter = interface(NSFormatter)
    ['{CDCFB9F9-CAEC-43CA-A2C4-2361B0B55EF6}']
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
  end;

  TNSDateIntervalFormatter = class
    (TOCGenericImport<NSDateIntervalFormatterClass, NSDateIntervalFormatter>)
  end;

  PNSDateIntervalFormatter = Pointer;

  NSNumberFormatterClass = interface(NSFormatterClass)
    ['{90010AA1-01BB-4BC7-A6D3-99712F4AA380}']
    { class } function localizedStringFromNumber(num: NSNumber;
      numberStyle: NSNumberFormatterStyle): NSString; cdecl;
    { class } function defaultFormatterBehavior
      : NSNumberFormatterBehavior; cdecl;
    { class } procedure setDefaultFormatterBehavior
      (behavior: NSNumberFormatterBehavior); cdecl;
  end;

  NSNumberFormatter = interface(NSFormatter)
    ['{40E76149-0547-4BB7-9C05-6C75F4AC160F}']
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
    ['{37841E7E-1969-4F3F-B39F-793B76FE0CE7}']
  end;

  NSMassFormatter = interface(NSFormatter)
    ['{FF32C791-599E-44E9-8807-C3315B3455FB}']
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
      usedUnit: NSInteger): NSString; cdecl;
    function getObjectValue(obj: Pointer; forString: NSString;
      errorDescription: NSString): Boolean; cdecl;
  end;

  TNSMassFormatter = class(TOCGenericImport<NSMassFormatterClass,
    NSMassFormatter>)
  end;

  PNSMassFormatter = Pointer;

  NSLengthFormatterClass = interface(NSFormatterClass)
    ['{D574BF1F-6581-425C-BFA8-E5F3C2B2248B}']
  end;

  NSLengthFormatter = interface(NSFormatter)
    ['{ECC5B14E-9978-4B1E-9E01-F449F5F3E7F7}']
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
    function unitStringFromMeters(numberInMeters: Double; usedUnit: NSInteger)
      : NSString; cdecl;
    function getObjectValue(obj: Pointer; forString: NSString;
      errorDescription: NSString): Boolean; cdecl;
  end;

  TNSLengthFormatter = class(TOCGenericImport<NSLengthFormatterClass,
    NSLengthFormatter>)
  end;

  PNSLengthFormatter = Pointer;

  NSEnergyFormatterClass = interface(NSFormatterClass)
    ['{BD5EAA08-AA0F-4233-9A3F-F57203FBDAE0}']
  end;

  NSEnergyFormatter = interface(NSFormatter)
    ['{00FF430C-F8B1-4507-9BE7-502FDE51BA7F}']
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
    function unitStringFromJoules(numberInJoules: Double; usedUnit: NSInteger)
      : NSString; cdecl;
    function getObjectValue(obj: Pointer; forString: NSString;
      errorDescription: NSString): Boolean; cdecl;
  end;

  TNSEnergyFormatter = class(TOCGenericImport<NSEnergyFormatterClass,
    NSEnergyFormatter>)
  end;

  PNSEnergyFormatter = Pointer;

  NSPersonNameComponentsClass = interface(NSObjectClass)
    ['{F5D0BB94-6AD3-49A4-8263-35E096418C63}']
  end;

  NSPersonNameComponents = interface(NSObject)
    ['{556A3678-773D-4F87-A096-0248BECD9B02}']
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
    ['{D7341213-B784-4689-ACBA-EA3CB49000A2}']
    { class } function localizedStringFromPersonNameComponents
      (components: NSPersonNameComponents;
      style: NSPersonNameComponentsFormatterStyle;
      options: NSPersonNameComponentsFormatterOptions): NSString; cdecl;
  end;

  NSPersonNameComponentsFormatter = interface(NSFormatter)
    ['{6BD2EA55-C199-4058-B92C-152438F22D82}']
    procedure setStyle(style: NSPersonNameComponentsFormatterStyle); cdecl;
    function style: NSPersonNameComponentsFormatterStyle; cdecl;
    procedure setPhonetic(phonetic: Boolean); cdecl;
    function isPhonetic: Boolean; cdecl;
    function stringFromPersonNameComponents(components: NSPersonNameComponents)
      : NSString; cdecl;
    function annotatedStringFromPersonNameComponents
      (components: NSPersonNameComponents): NSAttributedString; cdecl;
    function getObjectValue(obj: Pointer; forString: NSString;
      errorDescription: NSString): Boolean; cdecl;
  end;

  TNSPersonNameComponentsFormatter = class
    (TOCGenericImport<NSPersonNameComponentsFormatterClass,
    NSPersonNameComponentsFormatter>)
  end;

  PNSPersonNameComponentsFormatter = Pointer;

  NSScannerClass = interface(NSObjectClass)
    ['{64338A6F-6672-46EE-A3F0-527DD4FF89BE}']
    { class } function scannerWithString(&string: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function localizedScannerWithString(&string: NSString)
      : Pointer; cdecl;
  end;

  NSScanner = interface(NSObject)
    ['{5FE84C1A-E3D8-416E-9A9B-7B55DDB426B5}']
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
    function scanInteger(result: PInteger): Boolean; cdecl;
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
    function scanDecimal(dcm: Pointer): Boolean; cdecl;
  end;

  TNSScanner = class(TOCGenericImport<NSScannerClass, NSScanner>)
  end;

  PNSScanner = Pointer;

  NSDecimalNumberClass = interface(NSNumberClass)
    ['{F3807DAF-8F96-4BEC-BF41-4E967E313563}']
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
    { class } function zero: NSDecimalNumber; cdecl;
    { class } function one: NSDecimalNumber; cdecl;
    { class } function minimumDecimalNumber: NSDecimalNumber; cdecl;
    { class } function maximumDecimalNumber: NSDecimalNumber; cdecl;
    { class } function notANumber: NSDecimalNumber; cdecl;
    { class } procedure setDefaultBehavior(behavior: Pointer); cdecl;
    { class } function defaultBehavior: Pointer; cdecl;
  end;

  NSDecimalNumber = interface(NSNumber)
    ['{657661F7-B6B4-4EEA-BE43-CA2E58B577C5}']
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
    function objCType: MarshaledAString; cdecl;
    function doubleValue: Double; cdecl;
  end;

  TNSDecimalNumber = class(TOCGenericImport<NSDecimalNumberClass,
    NSDecimalNumber>)
  end;

  PNSDecimalNumber = Pointer;

  NSDecimalNumberHandlerClass = interface(NSObjectClass)
    ['{218854A5-6A78-4549-99E5-4041998FA607}']
    { class } function defaultDecimalNumberHandler
      : NSDecimalNumberHandler; cdecl;
    { class } function decimalNumberHandlerWithRoundingMode
      (roundingMode: NSRoundingMode; scale: SmallInt; raiseOnExactness: Boolean;
      raiseOnOverflow: Boolean; raiseOnUnderflow: Boolean;
      raiseOnDivideByZero: Boolean): Pointer { instancetype }; cdecl;
  end;

  NSDecimalNumberHandler = interface(NSObject)
    ['{B02CC885-E144-462E-9CAE-68F41E0AF46C}']
    function initWithRoundingMode(roundingMode: NSRoundingMode; scale: SmallInt;
      raiseOnExactness: Boolean; raiseOnOverflow: Boolean;
      raiseOnUnderflow: Boolean; raiseOnDivideByZero: Boolean)
      : Pointer { instancetype }; cdecl;
  end;

  TNSDecimalNumberHandler = class(TOCGenericImport<NSDecimalNumberHandlerClass,
    NSDecimalNumberHandler>)
  end;

  PNSDecimalNumberHandler = Pointer;

  NSErrorRecoveryAttempting = interface(IObjectiveC)
    ['{866D213E-066A-4246-B085-81629781CD48}']
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

  NSExceptionClass = interface(NSObjectClass)
    ['{BFF1750C-631B-4BD1-9166-3ABD2E130543}']
    { class } function exceptionWithName(name: NSString; reason: NSString;
      userInfo: NSDictionary): NSException; cdecl;
    [MethodName('raise:format:')]
    { class } procedure raiseFormat(name: NSString; format: NSString); cdecl;
    [MethodName('raise:format:arguments:')]
    { class } procedure raiseFormatArguments(name: NSString; format: NSString;
      arguments: array of const); cdecl;
  end;

  NSException = interface(NSObject)
    ['{A2CFDFB9-B93B-439D-9B8B-EEDD3CF968F6}']
    function initWithName(aName: NSString; reason: NSString;
      userInfo: NSDictionary): Pointer { instancetype }; cdecl;
    function name: NSString; cdecl;
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
    ['{4DE1BBE6-6597-43AB-BB31-F229CC053456}']
    { class } function currentHandler: NSAssertionHandler; cdecl;
  end;

  NSAssertionHandler = interface(NSObject)
    ['{99E8011B-620A-45B8-B946-4CB5EAA9A480}']
    procedure handleFailureInMethod(selector: SEL; &object: Pointer;
      &file: NSString; lineNumber: NSInteger; description: NSString); cdecl;
    procedure handleFailureInFunction(functionName: NSString; &file: NSString;
      lineNumber: NSInteger; description: NSString); cdecl;
  end;

  TNSAssertionHandler = class(TOCGenericImport<NSAssertionHandlerClass,
    NSAssertionHandler>)
  end;

  PNSAssertionHandler = Pointer;

  NSFileHandleClass = interface(NSObjectClass)
    ['{19E59E52-774A-436C-B075-5C31D0D954A9}']
    { class } function fileHandleWithStandardInput: NSFileHandle; cdecl;
    { class } function fileHandleWithStandardOutput: NSFileHandle; cdecl;
    { class } function fileHandleWithStandardError: NSFileHandle; cdecl;
    { class } function fileHandleWithNullDevice: NSFileHandle; cdecl;
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
    ['{80389A05-A077-47E7-80EE-C440D6863FC2}']
    function availableData: NSData; cdecl;
    function readDataToEndOfFile: NSData; cdecl;
    function readDataOfLength(length: NSUInteger): NSData; cdecl;
    procedure writeData(data: NSData); cdecl;
    function offsetInFile: UInt64; cdecl;
    function seekToEndOfFile: UInt64; cdecl;
    procedure seekToFileOffset(offset: UInt64); cdecl;
    procedure truncateFileAtOffset(offset: UInt64); cdecl;
    procedure synchronizeFile; cdecl;
    procedure closeFile; cdecl;
    [MethodName('initWithFileDescriptor:closeOnDealloc:')]
    function initWithFileDescriptorCloseOnDealloc(fd: Integer;
      closeOnDealloc: Boolean): Pointer { instancetype }; cdecl;
    function initWithCoder(coder: NSCoder): Pointer { instancetype }; cdecl;
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
  end;

  TNSFileHandle = class(TOCGenericImport<NSFileHandleClass, NSFileHandle>)
  end;

  PNSFileHandle = Pointer;

  NSPipeClass = interface(NSObjectClass)
    ['{417A11B1-C875-45E6-B56A-3329124A534B}']
    { class } function pipe: NSPipe; cdecl;
  end;

  NSPipe = interface(NSObject)
    ['{53A81490-3591-4841-87CA-C2953BE09184}']
    function fileHandleForReading: NSFileHandle; cdecl;
    function fileHandleForWriting: NSFileHandle; cdecl;
  end;

  TNSPipe = class(TOCGenericImport<NSPipeClass, NSPipe>)
  end;

  PNSPipe = Pointer;

  NSDirectoryEnumeratorClass = interface(NSEnumeratorClass)
    ['{FFD2545A-A1BC-440D-96BA-FFC7CA07B925}']
  end;

  NSDirectoryEnumerator = interface(NSEnumerator)
    ['{66E11D1F-0623-4812-8FEF-5E2366BD7D9A}']
    function fileAttributes: NSDictionary; cdecl;
    function directoryAttributes: NSDictionary; cdecl;
    procedure skipDescendents; cdecl;
    function level: NSUInteger; cdecl;
    procedure skipDescendants; cdecl;
  end;

  TNSDirectoryEnumerator = class(TOCGenericImport<NSDirectoryEnumeratorClass,
    NSDirectoryEnumerator>)
  end;

  PNSDirectoryEnumerator = Pointer;

  NSFileManagerClass = interface(NSObjectClass)
    ['{E0650E82-0FFF-42C2-A7E5-2B8DF718B6A1}']
    { class } function defaultManager: NSFileManager; cdecl;
  end;

  NSFileManager = interface(NSObject)
    ['{BFF41ECD-0913-4595-BE1F-67112C8156A1}']
    function mountedVolumeURLsIncludingResourceValuesForKeys
      (propertyKeys: NSArray; options: NSVolumeEnumerationOptions)
      : NSArray; cdecl;
    procedure unmountVolumeAtURL(url: NSURL;
      options: NSFileManagerUnmountOptions;
      completionHandler: TFoundationCompletionHandler); cdecl;
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
      : NSInteger; ofDirectoryAtURL: NSURL; toItemAtURL: NSURL; error: NSError)
      : Boolean; cdecl;
    [MethodName('getRelationship:ofDirectory:inDomain:toItemAtURL:error:')]
    function getRelationshipOfDirectoryInDomainToItemAtURLError(outRelationship
      : NSInteger; ofDirectory: NSSearchPathDirectory;
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
    function containerURLForSecurityApplicationGroupIdentifier(groupIdentifier
      : NSString): NSURL; cdecl;
  end;

  TNSFileManager = class(TOCGenericImport<NSFileManagerClass, NSFileManager>)
  end;

  PNSFileManager = Pointer;

  NSCopyLinkMoveHandler = interface(IObjectiveC)
    ['{989DC90B-9AFD-480F-96F4-611ABDC8F6EF}']
    [MethodName('fileManager:shouldProceedAfterError:')]
    function fileManagerShouldProceedAfterError(fm: NSFileManager;
      shouldProceedAfterError: NSDictionary): Boolean; cdecl;
    [MethodName('fileManager:willProcessPath:')]
    procedure fileManagerWillProcessPath(fm: NSFileManager;
      willProcessPath: NSString); cdecl;
  end;

  NSPointerFunctionsClass = interface(NSObjectClass)
    ['{DCE0A462-A72C-427E-8A3E-8ACB9C7E9620}']
    { class } function pointerFunctionsWithOptions
      (options: NSPointerFunctionsOptions): NSPointerFunctions; cdecl;
  end;

  NSPointerFunctions = interface(NSObject)
    ['{5710FD70-11C7-4188-B43C-8FA16A9B2B8C}']
    function initWithOptions(options: NSPointerFunctionsOptions)
      : Pointer { instancetype }; cdecl;
    procedure setHashFunction(hashFunction: TFoundationHashFunction); cdecl;
    function hashFunction: TFoundationHashFunction; cdecl;
    procedure setIsEqualFunction(isEqualFunction
      : TFoundationIsEqualFunction); cdecl;
    function isEqualFunction: TFoundationIsEqualFunction; cdecl;
    procedure setSizeFunction(sizeFunction: TFoundationBlock5); cdecl;
    function sizeFunction: TFoundationBlock5; cdecl;
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
    ['{18A574BA-10A6-4F4A-8F4C-4350572669F9}']
    { class } function hashTableWithOptions(options: NSPointerFunctionsOptions)
      : NSHashTable; cdecl;
    { class } function weakObjectsHashTable: NSHashTable; cdecl;
  end;

  NSHashTable = interface(NSObject)
    ['{240F9076-6BDA-40BA-B1C6-4A160BAAB585}']
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
    ['{AB514D47-2ADC-4827-9180-359C92E8D2EB}']
    { class } function cookieWithProperties(properties: NSDictionary)
      : NSHTTPCookie; cdecl;
    { class } function requestHeaderFieldsWithCookies(cookies: NSArray)
      : NSDictionary; cdecl;
    { class } function cookiesWithResponseHeaderFields
      (headerFields: NSDictionary; forURL: NSURL): NSArray; cdecl;
  end;

  NSHTTPCookie = interface(NSObject)
    ['{C5807943-F91A-49B9-89FE-232A3151E294}']
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
  end;

  TNSHTTPCookie = class(TOCGenericImport<NSHTTPCookieClass, NSHTTPCookie>)
  end;

  PNSHTTPCookie = Pointer;

  NSURLSessionTaskClass = interface(NSObjectClass)
    ['{0C449E06-3784-4407-9FFD-7EF6DE2E1E33}']
  end;

  NSURLSessionTask = interface(NSObject)
    ['{E41CAE23-18E9-4398-9CE4-9D9776F1C658}']
    function taskIdentifier: NSUInteger; cdecl;
    function originalRequest: NSURLRequest; cdecl;
    function currentRequest: NSURLRequest; cdecl;
    function response: NSURLResponse; cdecl;
    function countOfBytesReceived: Int64; cdecl;
    function countOfBytesSent: Int64; cdecl;
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
  end;

  TNSURLSessionTask = class(TOCGenericImport<NSURLSessionTaskClass,
    NSURLSessionTask>)
  end;

  PNSURLSessionTask = Pointer;

  NSSortDescriptorClass = interface(NSObjectClass)
    ['{432A7852-56F7-4B99-B257-1E0985896A90}']
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
    ['{305E98E5-8EE0-4612-9386-C21096CEC173}']
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
    ['{CBDEE206-6BA0-4C6D-AD0D-C32AFBF98B7F}']
    { class } function sharedHTTPCookieStorage: NSHTTPCookieStorage; cdecl;
    { class } function sharedCookieStorageForGroupContainerIdentifier
      (identifier: NSString): NSHTTPCookieStorage; cdecl;
  end;

  NSHTTPCookieStorage = interface(NSObject)
    ['{86A3CAF4-E442-4169-BF73-7629B33BA87B}']
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
      completionHandler: TFoundationCompletionHandler2); cdecl;
  end;

  TNSHTTPCookieStorage = class(TOCGenericImport<NSHTTPCookieStorageClass,
    NSHTTPCookieStorage>)
  end;

  PNSHTTPCookieStorage = Pointer;

  NSIndexPathClass = interface(NSObjectClass)
    ['{D38B55CA-A20C-4D3E-8379-BBFD3BEB7A75}']
    { class } function indexPathWithIndex(index: NSUInteger)
      : Pointer { instancetype }; cdecl;
    { class } function indexPathWithIndexes(indexes: NSUInteger;
      length: NSUInteger): Pointer { instancetype }; cdecl;
  end;

  NSIndexPath = interface(NSObject)
    ['{2DA88AE1-4800-4F4D-98D3-3F380E88395E}']
    function initWithIndexes(indexes: NSUInteger; length: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithIndex(index: NSUInteger): Pointer { instancetype }; cdecl;
    function indexPathByAddingIndex(index: NSUInteger): NSIndexPath; cdecl;
    function indexPathByRemovingLastIndex: NSIndexPath; cdecl;
    function indexAtPosition(position: NSUInteger): NSUInteger; cdecl;
    function length: NSUInteger; cdecl;
    [MethodName('getIndexes:range:')]
    procedure getIndexesRange(indexes: PCardinal; range: NSRange); cdecl;
    function compare(otherObject: NSIndexPath): NSComparisonResult; cdecl;
    [MethodName('getIndexes:')]
    procedure getIndexes(indexes: PCardinal); cdecl;
  end;

  TNSIndexPath = class(TOCGenericImport<NSIndexPathClass, NSIndexPath>)
  end;

  PNSIndexPath = Pointer;

  NSMutableIndexSetClass = interface(NSIndexSetClass)
    ['{B3B1E60B-6CE3-4B70-85B7-5D057E432889}']
  end;

  NSMutableIndexSet = interface(NSIndexSet)
    ['{1A6F86E9-507A-4CAF-B03D-932C22B75EA9}']
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

  NSStreamClass = interface(NSObjectClass)
    ['{0F766F3F-F974-4AF2-A544-A7433B3C4207}']
    { class } procedure getStreamsToHostWithName(hostname: NSString;
      port: NSInteger; inputStream: NSInputStream;
      outputStream: NSOutputStream); cdecl;
    { class } procedure getBoundStreamsWithBufferSize(bufferSize: NSUInteger;
      inputStream: NSInputStream; outputStream: NSOutputStream); cdecl;
  end;

  NSStream = interface(NSObject)
    ['{F31216E4-280B-4071-A51C-F83C925966EB}']
    procedure open; cdecl;
    procedure close; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function propertyForKey(key: NSString): Pointer; cdecl;
    function setProperty(&property: Pointer; forKey: NSString): Boolean; cdecl;
    procedure scheduleInRunLoop(aRunLoop: NSRunLoop; forMode: NSString); cdecl;
    procedure removeFromRunLoop(aRunLoop: NSRunLoop; forMode: NSString); cdecl;
    function streamStatus: NSStreamStatus; cdecl;
    function streamError: NSError; cdecl;
  end;

  TNSStream = class(TOCGenericImport<NSStreamClass, NSStream>)
  end;

  PNSStream = Pointer;

  NSOutputStreamClass = interface(NSStreamClass)
    ['{77734287-2C7A-4623-B10B-811AF191DE61}']
    { class } function outputStreamToMemory: Pointer { instancetype }; cdecl;
    { class } function outputStreamToBuffer(buffer: PByte; capacity: NSUInteger)
      : Pointer { instancetype }; cdecl;
    { class } function outputStreamToFileAtPath(path: NSString; append: Boolean)
      : Pointer { instancetype }; cdecl;
    { class } function outputStreamWithURL(url: NSURL; append: Boolean)
      : Pointer { instancetype }; cdecl;
  end;

  NSOutputStream = interface(NSStream)
    ['{59452F1E-5127-4D08-AAFB-FAEC7AB0A7DA}']
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
    ['{55A2828D-651E-4464-A3F1-74936A12883F}']
    { class } function inputStreamWithData(data: NSData)
      : Pointer { instancetype }; cdecl;
    { class } function inputStreamWithFileAtPath(path: NSString)
      : Pointer { instancetype }; cdecl;
    { class } function inputStreamWithURL(url: NSURL)
      : Pointer { instancetype }; cdecl;
  end;

  NSInputStream = interface(NSStream)
    ['{5646A8CA-CDFD-4D6D-893A-A48E31496E76}']
    function read(buffer: PByte; maxLength: NSUInteger): NSInteger; cdecl;
    function getBuffer(buffer: PByte; length: PCardinal): Boolean; cdecl;
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
    ['{120EF00A-A0C6-48B7-A03D-BC233042563E}']
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
    ['{F304B44F-04FD-45E4-AFCD-0813EA7A7CB8}']
  end;

  TNSJSONSerialization = class(TOCGenericImport<NSJSONSerializationClass,
    NSJSONSerialization>)
  end;

  PNSJSONSerialization = Pointer;

  NSOrderedSetClass = interface(NSObjectClass)
    ['{EAC40661-F5DC-4BCE-8131-37FE3CCC49B5}']
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
    ['{9CD8DCB2-5E86-42D2-85DF-4E64CF6A4266}']
    function count: NSUInteger; cdecl;
    function objectAtIndex(idx: NSUInteger): ObjectType; cdecl;
    [MethodName('indexOfObject:')]
    function indexOfObject(&object: ObjectType): NSUInteger; cdecl;
    function init: Pointer { instancetype }; cdecl;
    [MethodName('initWithObjects:count:')]
    function initWithObjectsCount(objects: ObjectType; count: NSUInteger)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
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
    procedure enumerateObjectsUsingBlock(block: TFoundationBlock); cdecl;
    procedure enumerateObjectsWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock); cdecl;
    procedure enumerateObjectsAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; usingBlock: TFoundationBlock); cdecl;
    function indexOfObjectPassingTest(predicate: TFoundationPredicate)
      : NSUInteger; cdecl;
    function indexOfObjectWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate): NSUInteger; cdecl;
    function indexOfObjectAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; passingTest: TFoundationPredicate)
      : NSUInteger; cdecl;
    function indexesOfObjectsPassingTest(predicate: TFoundationPredicate)
      : NSIndexSet; cdecl;
    function indexesOfObjectsWithOptions(opts: NSEnumerationOptions;
      passingTest: TFoundationPredicate): NSIndexSet; cdecl;
    function indexesOfObjectsAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; passingTest: TFoundationPredicate)
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
    ['{B5E9F83F-97BE-4F04-96E3-11F247287993}']
    { class } function orderedSetWithCapacity(numItems: NSUInteger)
      : Pointer { instancetype }; cdecl;
  end;

  NSMutableOrderedSet = interface(NSOrderedSet)
    ['{E3A65631-3C11-43E4-8390-00CD02CF2AAB}']
    procedure insertObject(&object: ObjectType; atIndex: NSUInteger); cdecl;
    procedure removeObjectAtIndex(idx: NSUInteger); cdecl;
    procedure replaceObjectAtIndex(idx: NSUInteger;
      withObject: ObjectType); cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
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
    procedure sortUsingDescriptors(sortDescriptors: NSArray); cdecl;
    procedure filterUsingPredicate(p: NSPredicate); cdecl;
  end;

  TNSMutableOrderedSet = class(TOCGenericImport<NSMutableOrderedSetClass,
    NSMutableOrderedSet>)
  end;

  PNSMutableOrderedSet = Pointer;

  NSKeyValueCoding = interface(IObjectiveC)
    ['{FF080D6F-159A-41F4-9E02-1EED1B393364}']
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
    ['{F322FABF-F4F9-4CC9-A089-6DD163C92DFA}']
    procedure observeValueForKeyPath(keyPath: NSString; ofObject: Pointer;
      change: NSDictionary; context: Pointer); cdecl;
  end;

  NSKeyValueObserverRegistration = interface(IObjectiveC)
    ['{7F3A7045-D697-4118-ADF5-B4558ABEA91B}']
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
    ['{12F8E1FF-9F8D-413A-BBA3-E2075D41EDB9}']
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
    ['{BD7211A9-74E3-4451-A28A-6D9D4208A314}']
    function keyPathsForValuesAffectingValueForKey(key: NSString): NSSet; cdecl;
    function automaticallyNotifiesObserversForKey(key: NSString)
      : Boolean; cdecl;
    procedure setObservationInfo(observationInfo: Pointer); cdecl;
    function observationInfo: Pointer; cdecl;
  end;

  NSPropertyListSerializationClass = interface(NSObjectClass)
    ['{084A775A-9CC1-4E9E-BB67-E47A635DA19C}']
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
    ['{926A6A52-01FF-4809-94C2-32379636CE2E}']
  end;

  TNSPropertyListSerialization = class
    (TOCGenericImport<NSPropertyListSerializationClass,
    NSPropertyListSerialization>)
  end;

  PNSPropertyListSerialization = Pointer;

  NSKeyedArchiverClass = interface(NSCoderClass)
    ['{D255158A-EA60-4D21-93B3-904AD941157B}']
    { class } function archivedDataWithRootObject(rootObject: Pointer)
      : NSData; cdecl;
    { class } function archiveRootObject(rootObject: Pointer; toFile: NSString)
      : Boolean; cdecl;
    { class } procedure setClassName(codedName: NSString;
      forClass: Pointer); cdecl;
    { class } function classNameForClass(cls: Pointer): NSString; cdecl;
  end;

  NSKeyedArchiver = interface(NSCoder)
    ['{B860FFD8-FBAD-4D95-8360-BF2568C8BA50}']
    function initForWritingWithMutableData(data: NSMutableData)
      : Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setOutputFormat(outputFormat: NSPropertyListFormat); cdecl;
    function outputFormat: NSPropertyListFormat; cdecl;
    procedure finishEncoding; cdecl;
    procedure setClassName(codedName: NSString; forClass: Pointer); cdecl;
    function classNameForClass(cls: Pointer): NSString; cdecl;
    procedure encodeObject(objv: Pointer; forKey: NSString); cdecl;
    procedure encodeConditionalObject(objv: Pointer; forKey: NSString); cdecl;
    procedure encodeBool(boolv: Boolean; forKey: NSString); cdecl;
    procedure encodeInt(intv: Integer; forKey: NSString); cdecl;
    procedure encodeInt32(intv: Int32; forKey: NSString); cdecl;
    procedure encodeInt64(intv: Int64; forKey: NSString); cdecl;
    procedure encodeFloat(realv: Single; forKey: NSString); cdecl;
    procedure encodeDouble(realv: Double; forKey: NSString); cdecl;
    procedure encodeBytes(bytesp: PByte; length: NSUInteger;
      forKey: NSString); cdecl;
    procedure setRequiresSecureCoding(requiresSecureCoding: Boolean); cdecl;
    function requiresSecureCoding: Boolean; cdecl;
  end;

  TNSKeyedArchiver = class(TOCGenericImport<NSKeyedArchiverClass,
    NSKeyedArchiver>)
  end;

  PNSKeyedArchiver = Pointer;

  NSKeyedUnarchiverClass = interface(NSCoderClass)
    ['{C6A5D1BB-34E3-47D6-B647-DF12F33A5700}']
    { class } function unarchiveObjectWithData(data: NSData): Pointer; cdecl;
    { class } function unarchiveTopLevelObjectWithData(data: NSData;
      error: NSError): Pointer; cdecl;
    { class } function unarchiveObjectWithFile(path: NSString): Pointer; cdecl;
    { class } procedure setClass(cls: Pointer; forClassName: NSString); cdecl;
    { class } function classForClassName(codedName: NSString): Pointer; cdecl;
  end;

  NSKeyedUnarchiver = interface(NSCoder)
    ['{F2CE53A2-4465-4669-923D-7B44882E085C}']
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
    function decodeBytesForKey(key: NSString; returnedLength: PCardinal)
      : PByte; cdecl;
    procedure setRequiresSecureCoding(requiresSecureCoding: Boolean); cdecl;
    function requiresSecureCoding: Boolean; cdecl;
  end;

  TNSKeyedUnarchiver = class(TOCGenericImport<NSKeyedUnarchiverClass,
    NSKeyedUnarchiver>)
  end;

  PNSKeyedUnarchiver = Pointer;

  NSKeyedArchiverObjectSubstitution = interface(IObjectiveC)
    ['{A94B3C8B-E919-425C-B7FF-48D8AA2055B6}']
    function classForKeyedArchiver: Pointer; cdecl;
    function replacementObjectForKeyedArchiver(archiver: NSKeyedArchiver)
      : Pointer; cdecl;
    function classFallbacksForKeyedArchiver: NSArray; cdecl;
  end;

  NSKeyedUnarchiverObjectSubstitution = interface(IObjectiveC)
    ['{2967CF23-4992-4D80-9157-C1043EAABE2E}']
    function classForKeyedUnarchiver: Pointer; cdecl;
  end;

  NSConditionLockClass = interface(NSObjectClass)
    ['{BE980640-7D06-42E9-AFF2-649F9B4CCF98}']
  end;

  NSConditionLock = interface(NSObject)
    ['{0EE00EE9-4001-441F-83CA-1960FBEB9170}']
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

  NSRecursiveLockClass = interface(NSObjectClass)
    ['{978A1CB0-5496-4239-A18A-B2E44DA7C1C9}']
  end;

  NSRecursiveLock = interface(NSObject)
    ['{88160181-2490-4819-AD89-850DE4E93D03}']
    function tryLock: Boolean; cdecl;
    function lockBeforeDate(limit: NSDate): Boolean; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
  end;

  TNSRecursiveLock = class(TOCGenericImport<NSRecursiveLockClass,
    NSRecursiveLock>)
  end;

  PNSRecursiveLock = Pointer;

  NSConditionClass = interface(NSObjectClass)
    ['{9B3B014D-8442-4B33-B66D-BB0E6E875218}']
  end;

  NSCondition = interface(NSObject)
    ['{681D4EFA-70BF-4051-B577-B66F5D17E7CB}']
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
    ['{5CF44D91-C7A1-4741-95BE-E2D911F4DCE1}']
    { class } function mapTableWithKeyOptions
      (keyOptions: NSPointerFunctionsOptions;
      valueOptions: NSPointerFunctionsOptions): NSMapTable; cdecl;
    { class } function strongToStrongObjectsMapTable: NSMapTable; cdecl;
    { class } function weakToStrongObjectsMapTable: NSMapTable; cdecl;
    { class } function strongToWeakObjectsMapTable: NSMapTable; cdecl;
    { class } function weakToWeakObjectsMapTable: NSMapTable; cdecl;
  end;

  NSMapTable = interface(NSObject)
    ['{40FF7BF1-E5F4-4341-9010-719E4AD8EC04}']
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

  NSOperationQueueClass = interface(NSObjectClass)
    ['{902D6231-32A7-496F-A0F6-249625A13A94}']
    { class } function currentQueue: NSOperationQueue; cdecl;
    { class } function mainQueue: NSOperationQueue; cdecl;
  end;

  NSOperationQueue = interface(NSObject)
    ['{5D4A7DDA-B41F-4EC4-B955-4245329936A8}']
    procedure addOperation(op: NSOperation); cdecl;
    procedure addOperations(ops: NSArray; waitUntilFinished: Boolean); cdecl;
    procedure addOperationWithBlock
      (block: TFoundationCancellationHandler); cdecl;
    function operations: NSArray; cdecl;
    function operationCount: NSUInteger; cdecl;
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
  end;

  TNSOperationQueue = class(TOCGenericImport<NSOperationQueueClass,
    NSOperationQueue>)
  end;

  PNSOperationQueue = Pointer;

  NSNotificationClass = interface(NSObjectClass)
    ['{0789ED62-9C87-442E-A36F-5F6405541110}']
    [MethodName('notificationWithName:object:')]
    { class } function notificationWithNameObject(aName: NSString;
      &object: Pointer): Pointer { instancetype }; cdecl;
    [MethodName('notificationWithName:object:userInfo:')]
    { class } function notificationWithNameObjectUserInfo(aName: NSString;
      &object: Pointer; userInfo: NSDictionary)
      : Pointer { instancetype }; cdecl;
  end;

  NSNotification = interface(NSObject)
    ['{54BBDCB2-734A-4149-AE22-1AD8E43CE496}']
    function name: NSString; cdecl;
    function &object: Pointer; cdecl;
    function userInfo: NSDictionary; cdecl;
    function initWithName(name: NSString; &object: Pointer;
      userInfo: NSDictionary): Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
    function init: Pointer { instancetype }; cdecl;
  end;

  TNSNotification = class(TOCGenericImport<NSNotificationClass, NSNotification>)
  end;

  PNSNotification = Pointer;

  NSNotificationCenterClass = interface(NSObjectClass)
    ['{CE97498F-2582-48B8-A735-8AF33F5AD9DF}']
    { class } function defaultCenter: NSNotificationCenter; cdecl;
  end;

  NSNotificationCenter = interface(NSObject)
    ['{9C1F0BC8-84A1-48AD-9AC5-686EF2F30FE0}']
    procedure addObserver(observer: Pointer; selector: SEL; name: NSString;
      &object: Pointer); cdecl;
    procedure postNotification(notification: NSNotification); cdecl;
    [MethodName('postNotificationName:object:')]
    procedure postNotificationNameObject(aName: NSString;
      &object: Pointer); cdecl;
    [MethodName('postNotificationName:object:userInfo:')]
    procedure postNotificationNameObjectUserInfo(aName: NSString;
      &object: Pointer; userInfo: NSDictionary); cdecl;
    [MethodName('removeObserver:')]
    procedure removeObserver(observer: Pointer); cdecl;
    [MethodName('removeObserver:name:object:')]
    procedure removeObserverNameObject(observer: Pointer; name: NSString;
      &object: Pointer); cdecl;
    function addObserverForName(name: NSString; &object: Pointer;
      queue: NSOperationQueue; usingBlock: TFoundationUsingBlock2)
      : Pointer; cdecl;
  end;

  TNSNotificationCenter = class(TOCGenericImport<NSNotificationCenterClass,
    NSNotificationCenter>)
  end;

  PNSNotificationCenter = Pointer;

  NSNotificationQueueClass = interface(NSObjectClass)
    ['{02054EDB-F4E6-4DDA-88F3-A03AA52B6889}']
    { class } function defaultQueue: NSNotificationQueue; cdecl;
  end;

  NSNotificationQueue = interface(NSObject)
    ['{2BE6EFC3-6E86-4657-8607-75A06A070332}']
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
    ['{D587D85A-C9C9-4195-9F3B-F996E4087EEF}']
    { class } function null: NSNull; cdecl;
  end;

  NSNull = interface(NSObject)
    ['{BC48022A-AF82-418B-8F93-F9D52223461A}']
  end;

  TNSNull = class(TOCGenericImport<NSNullClass, NSNull>)
  end;

  PNSNull = Pointer;

  NSCacheClass = interface(NSObjectClass)
    ['{21253673-6DA1-4705-9B35-5B7A89FC8944}']
  end;

  NSCache = interface(NSObject)
    ['{C2AB77BA-EA33-4046-AD23-9F38177B2721}']
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

  NSOperationClass = interface(NSObjectClass)
    ['{372A08CB-8463-4585-91CE-EA37742994EC}']
  end;

  NSOperation = interface(NSObject)
    ['{85844E7D-2A06-416D-9FCF-3D26241B22E2}']
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
      : TFoundationCancellationHandler); cdecl;
    function completionBlock: TFoundationCancellationHandler; cdecl;
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
    ['{6CEBF0B4-2E83-4F48-A546-B224C92DFD00}']
    { class } function blockOperationWithBlock
      (block: TFoundationCancellationHandler): Pointer { instancetype }; cdecl;
  end;

  NSBlockOperation = interface(NSOperation)
    ['{45C8B78A-7458-45B3-8C5D-7919E629E512}']
    procedure addExecutionBlock(block: TFoundationCancellationHandler); cdecl;
    function executionBlocks: NSArray; cdecl;
  end;

  TNSBlockOperation = class(TOCGenericImport<NSBlockOperationClass,
    NSBlockOperation>)
  end;

  PNSBlockOperation = Pointer;

  NSInvocationOperationClass = interface(NSOperationClass)
    ['{558346B3-B877-46EC-B8EA-7D488E176427}']
  end;

  NSInvocationOperation = interface(NSOperation)
    ['{6B968D26-0CEF-41A2-BDFE-C720F9016D5F}']
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
    ['{F407EF2E-0D2D-40AA-84F1-1617AB5AC0B1}']
    { class } function orthographyWithDominantScript(script: NSString;
      languageMap: NSDictionary): Pointer { instancetype }; cdecl;
  end;

  NSOrthography = interface(NSObject)
    ['{D8C57685-0667-4E62-9AD3-6A2A9021C074}']
    function dominantScript: NSString; cdecl;
    function languageMap: NSDictionary; cdecl;
    function initWithDominantScript(script: NSString; languageMap: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
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
    ['{007A5A0E-F446-44D9-A075-7A383AC395C2}']
    { class } function pointerArrayWithOptions
      (options: NSPointerFunctionsOptions): NSPointerArray; cdecl;
    { class } function pointerArrayWithPointerFunctions
      (functions: NSPointerFunctions): NSPointerArray; cdecl;
    { class } function strongObjectsPointerArray: NSPointerArray; cdecl;
    { class } function weakObjectsPointerArray: NSPointerArray; cdecl;
  end;

  NSPointerArray = interface(NSObject)
    ['{5CF1EE36-030D-4D13-B70D-84114BC6E40C}']
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

  NSRunLoopClass = interface(NSObjectClass)
    ['{F526FBB0-F9E7-4AFF-9035-1F7C1EC3BD50}']
    { class } function currentRunLoop: NSRunLoop; cdecl;
    { class } function mainRunLoop: NSRunLoop; cdecl;
  end;

  NSRunLoop = interface(NSObject)
    ['{C68F1400-A500-4846-B7A7-9417901C52B9}']
    function currentMode: NSString; cdecl;
    function getCFRunLoop: CFRunLoopRef; cdecl;
    procedure addTimer(timer: NSTimer; forMode: NSString); cdecl;
    procedure addPort(aPort: NSPort; forMode: NSString); cdecl;
    procedure removePort(aPort: NSPort; forMode: NSString); cdecl;
    function limitDateForMode(mode: NSString): NSDate; cdecl;
    procedure acceptInputForMode(mode: NSString; beforeDate: NSDate); cdecl;
    procedure run; cdecl;
    procedure runUntilDate(limitDate: NSDate); cdecl;
    function runMode(mode: NSString; beforeDate: NSDate): Boolean; cdecl;
    procedure performSelector(aSelector: SEL; target: Pointer;
      argument: Pointer; order: NSUInteger; modes: NSArray); cdecl;
    procedure cancelPerformSelector(aSelector: SEL; target: Pointer;
      argument: Pointer); cdecl;
    procedure cancelPerformSelectorsWithTarget(target: Pointer); cdecl;
  end;

  TNSRunLoop = class(TOCGenericImport<NSRunLoopClass, NSRunLoop>)
  end;

  PNSRunLoop = Pointer;

  NSPortClass = interface(NSObjectClass)
    ['{DE79D71F-CF40-4534-8A7B-65DC92BF18CA}']
    { class } function port: NSPort; cdecl;
  end;

  NSPort = interface(NSObject)
    ['{99359785-3B79-490E-9C1E-6D194C89BDDF}']
    procedure invalidate; cdecl;
    function isValid: Boolean; cdecl;
    procedure setDelegate(anObject: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure scheduleInRunLoop(runLoop: NSRunLoop; forMode: NSString); cdecl;
    procedure removeFromRunLoop(runLoop: NSRunLoop; forMode: NSString); cdecl;
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

  NSMachPortClass = interface(NSPortClass)
    ['{338A030C-9B75-4712-9EF4-B4AD91100D4E}']
    [MethodName('portWithMachPort:')]
    { class } function portWithMachPort(machPort: LongWord): NSPort; cdecl;
    [MethodName('portWithMachPort:options:')]
    { class } function portWithMachPortOptions(machPort: LongWord;
      options: NSMachPortOptions): NSPort; cdecl;
  end;

  NSMachPort = interface(NSPort)
    ['{A07032EA-2F28-4F8A-801D-FA47531D9168}']
    [MethodName('initWithMachPort:')]
    function initWithMachPort(machPort: LongWord)
      : Pointer { instancetype }; cdecl;
    procedure setDelegate(anObject: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    [MethodName('initWithMachPort:options:')]
    function initWithMachPortOptions(machPort: LongWord;
      options: NSMachPortOptions): Pointer { instancetype }; cdecl;
    function machPort: LongWord; cdecl;
    procedure scheduleInRunLoop(runLoop: NSRunLoop; forMode: NSString); cdecl;
    procedure removeFromRunLoop(runLoop: NSRunLoop; forMode: NSString); cdecl;
  end;

  TNSMachPort = class(TOCGenericImport<NSMachPortClass, NSMachPort>)
  end;

  PNSMachPort = Pointer;

  NSMessagePortClass = interface(NSPortClass)
    ['{D086E913-51EF-47D1-BB4B-4AA209B50417}']
  end;

  NSMessagePort = interface(NSPort)
    ['{E33F5240-0145-490E-9E77-7858CEAE412E}']
  end;

  TNSMessagePort = class(TOCGenericImport<NSMessagePortClass, NSMessagePort>)
  end;

  PNSMessagePort = Pointer;

  NSProcessInfoClass = interface(NSObjectClass)
    ['{098DE64F-16C0-45D6-BFE1-714203C778B7}']
    { class } function processInfo: NSProcessInfo; cdecl;
  end;

  NSProcessInfo = interface(NSObject)
    ['{426DCA0B-0DFE-40B9-BEAA-1289FF657761}']
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
      reason: NSString; usingBlock: TFoundationCancellationHandler); cdecl;
    procedure performExpiringActivityWithReason(reason: NSString;
      usingBlock: TFoundationCompletionHandler1); cdecl;
    function thermalState: NSProcessInfoThermalState; cdecl;
    function isLowPowerModeEnabled: Boolean; cdecl;
  end;

  TNSProcessInfo = class(TOCGenericImport<NSProcessInfoClass, NSProcessInfo>)
  end;

  PNSProcessInfo = Pointer;

  NSProxyClass = interface(IObjectiveCClass)
    ['{74DF6657-983E-4FE1-823C-CF78605A24B2}']
    { class } function alloc: Pointer; cdecl;
    { class } function allocWithZone(zone: Pointer): Pointer; cdecl;
    { class } function &class: Pointer; cdecl;
    { class } function respondsToSelector(aSelector: SEL): Boolean; cdecl;
  end;

  NSProxy = interface(IObjectiveCInstance)
    ['{83801A51-EF7F-4233-A9D9-C81F94B78CCA}']
    procedure forwardInvocation(invocation: NSInvocation); cdecl;
    function methodSignatureForSelector(SEL: SEL): NSMethodSignature; cdecl;
    procedure dealloc; cdecl;
    procedure finalize; cdecl;
    function description: NSString; cdecl;
    function debugDescription: NSString; cdecl;
  end;

  TNSProxy = class(TOCGenericImport<NSProxyClass, NSProxy>)
  end;

  PNSProxy = Pointer;

  NSRegularExpressionClass = interface(NSObjectClass)
    ['{A6210A75-A93A-44F9-858C-BB93211C01D3}']
    { class } function regularExpressionWithPattern(pattern: NSString;
      options: NSRegularExpressionOptions; error: NSError)
      : NSRegularExpression; cdecl;
    { class } function escapedPatternForString(&string: NSString)
      : NSString; cdecl;
    { class } function escapedTemplateForString(&string: NSString)
      : NSString; cdecl;
  end;

  NSRegularExpression = interface(NSObject)
    ['{6B11F135-1333-47DA-BDBE-6127992945FB}']
    function initWithPattern(pattern: NSString;
      options: NSRegularExpressionOptions; error: NSError)
      : Pointer { instancetype }; cdecl;
    function pattern: NSString; cdecl;
    function options: NSRegularExpressionOptions; cdecl;
    function numberOfCaptureGroups: NSUInteger; cdecl;
    procedure enumerateMatchesInString(&string: NSString;
      options: NSMatchingOptions; range: NSRange;
      usingBlock: TFoundationUsingBlock3); cdecl;
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
    ['{27C4BA76-8DF5-4A1A-9F05-D185FE0A446E}']
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
    ['{B985B581-DB88-4D23-B9AF-44C8948F987A}']
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
    function addressComponents: NSDictionary; cdecl;
    function numberOfRanges: NSUInteger; cdecl;
    function rangeAtIndex(idx: NSUInteger): NSRange; cdecl;
    function resultByAdjustingRangesWithOffset(offset: NSInteger)
      : NSTextCheckingResult; cdecl;
  end;

  TNSTextCheckingResult = class(TOCGenericImport<NSTextCheckingResultClass,
    NSTextCheckingResult>)
  end;

  PNSTextCheckingResult = Pointer;

  NSDataDetectorClass = interface(NSRegularExpressionClass)
    ['{45D711A1-28C3-439F-AB88-639261B930A1}']
    { class } function dataDetectorWithTypes(checkingTypes: NSTextCheckingTypes;
      error: NSError): NSDataDetector; cdecl;
  end;

  NSDataDetector = interface(NSRegularExpression)
    ['{7FBD4F4D-799B-4598-9B98-1E80D5F63771}']
    function initWithTypes(checkingTypes: NSTextCheckingTypes; error: NSError)
      : Pointer { instancetype }; cdecl;
    function checkingTypes: NSTextCheckingTypes; cdecl;
  end;

  TNSDataDetector = class(TOCGenericImport<NSDataDetectorClass, NSDataDetector>)
  end;

  PNSDataDetector = Pointer;

  NSTimerClass = interface(NSObjectClass)
    ['{867C145A-9A6B-43A5-8B12-E64BDC3DE79D}']
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
  end;

  NSTimer = interface(NSObject)
    ['{A8400676-30AE-4FC0-9FD0-8C9021D0E6D7}']
    function initWithFireDate(date: NSDate; interval: NSTimeInterval;
      target: Pointer; selector: SEL; userInfo: Pointer; repeats: Boolean)
      : Pointer { instancetype }; cdecl;
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

  NSDelayedPerforming = interface(IObjectiveC)
    ['{81B528DD-4CD7-44DA-9B10-DD6F20D8B806}']
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

  NSThreadClass = interface(NSObjectClass)
    ['{2E87D5EB-6A70-460B-9636-639FB6910123}']
    { class } function currentThread: NSThread; cdecl;
    { class } procedure detachNewThreadSelector(selector: SEL;
      toTarget: Pointer; withObject: Pointer); cdecl;
    { class } function isMultiThreaded: Boolean; cdecl;
    { class } procedure sleepUntilDate(date: NSDate); cdecl;
    { class } procedure sleepForTimeInterval(ti: NSTimeInterval); cdecl;
    { class } procedure exit; cdecl;
    { class } function threadPriority: Double; cdecl;
    { class } function setThreadPriority(p: Double): Boolean; cdecl;
    { class } function callStackReturnAddresses: NSArray; cdecl;
    { class } function callStackSymbols: NSArray; cdecl;
    { class } function isMainThread: Boolean; cdecl;
    { class } function mainThread: NSThread; cdecl;
  end;

  NSThread = interface(NSObject)
    ['{4C2A705B-A21E-4618-9E4B-3C7E5E9B5F75}']
    function threadDictionary: NSMutableDictionary; cdecl;
    procedure setThreadPriority(threadPriority: Double); cdecl;
    function threadPriority: Double; cdecl;
    procedure setQualityOfService(qualityOfService: NSQualityOfService); cdecl;
    function qualityOfService: NSQualityOfService; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setStackSize(stackSize: NSUInteger); cdecl;
    function stackSize: NSUInteger; cdecl;
    function isMainThread: Boolean; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithTarget(target: Pointer; selector: SEL; &object: Pointer)
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
    ['{8724116F-FB3A-4DFD-AB43-3D28B7D3CD4D}']
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

  NSURLQueryItemClass = interface(NSObjectClass)
    ['{19163563-F948-4604-88B5-F8E83E63A017}']
    { class } function queryItemWithName(name: NSString; value: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  NSURLQueryItem = interface(NSObject)
    ['{CEAA0597-BD51-4314-8DC7-036A8B1521A2}']
    function initWithName(name: NSString; value: NSString)
      : Pointer { instancetype }; cdecl;
    function name: NSString; cdecl;
    function value: NSString; cdecl;
  end;

  TNSURLQueryItem = class(TOCGenericImport<NSURLQueryItemClass, NSURLQueryItem>)
  end;

  PNSURLQueryItem = Pointer;

  NSURLComponentsClass = interface(NSObjectClass)
    ['{C95B468B-371E-46A7-A1D6-E5142FDDB2E7}']
    { class } function componentsWithURL(url: NSURL;
      resolvingAgainstBaseURL: Boolean): Pointer { instancetype }; cdecl;
    { class } function componentsWithString(URLString: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  NSURLComponents = interface(NSObject)
    ['{73D99931-95FE-4B92-9D62-1F045D69E0BC}']
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
  end;

  TNSURLComponents = class(TOCGenericImport<NSURLComponentsClass,
    NSURLComponents>)
  end;

  PNSURLComponents = Pointer;

  NSFileSecurityClass = interface(NSObjectClass)
    ['{60B629A5-CD07-446D-8833-ED7B1BDE3368}']
  end;

  NSFileSecurity = interface(NSObject)
    ['{E9FDE020-9A47-42DA-AE5E-72BCBA3A0946}']
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
  end;

  TNSFileSecurity = class(TOCGenericImport<NSFileSecurityClass, NSFileSecurity>)
  end;

  PNSFileSecurity = Pointer;

  NSURLAuthenticationChallengeClass = interface(NSObjectClass)
    ['{658693F3-108E-46B0-9B7D-60DE50DE3DFD}']
  end;

  NSURLAuthenticationChallenge = interface(NSObject)
    ['{7FC49806-45F8-4F7D-8EF7-175A67203933}']
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
    ['{AB00A524-C36F-4F01-9BB4-08E4B93465E5}']
    { class } function credentialWithUser(user: NSString; password: NSString;
      persistence: NSURLCredentialPersistence): NSURLCredential; cdecl;
    { class } function credentialWithIdentity(identity: SecIdentityRef;
      certificates: NSArray; persistence: NSURLCredentialPersistence)
      : NSURLCredential; cdecl;
    { class } function credentialForTrust(trust: SecTrustRef)
      : NSURLCredential; cdecl;
  end;

  NSURLCredential = interface(NSObject)
    ['{B0369223-E41F-4141-B592-74E468ED49D0}']
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
    ['{94C7C2EF-C664-4707-8957-9B55764DD25C}']
  end;

  NSURLProtectionSpace = interface(NSObject)
    ['{BE640381-14CD-47FF-90EA-0BA3A87DB868}']
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
    ['{EE127D12-EFB9-4B07-A165-48A31478177E}']
  end;

  NSURLResponse = interface(NSObject)
    ['{C2826815-41A8-43C7-B3BC-C6974FAB0AEA}']
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
    ['{32A3090F-AA66-4EF9-9F2B-0D8611DE1CA5}']
    [MethodName('requestWithURL:')]
    { class } function requestWithURL(url: NSURL)
      : Pointer { instancetype }; cdecl;
    { class } function supportsSecureCoding: Boolean; cdecl;
    [MethodName('requestWithURL:cachePolicy:timeoutInterval:')]
    { class } function requestWithURLCachePolicyTimeoutInterval(url: NSURL;
      cachePolicy: NSURLRequestCachePolicy; timeoutInterval: NSTimeInterval)
      : Pointer { instancetype }; cdecl;
  end;

  NSURLRequest = interface(NSObject)
    ['{0B7BF22B-AF23-4D21-AB4F-D4AB9069D619}']
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
    ['{D71E044A-7064-4CF7-8CA5-DC78A4DE7E33}']
  end;

  NSURLSessionDataTask = interface(NSURLSessionTask)
    ['{E89D19CE-BE47-4A5C-8DC6-8984AFB29735}']
  end;

  TNSURLSessionDataTask = class(TOCGenericImport<NSURLSessionDataTaskClass,
    NSURLSessionDataTask>)
  end;

  PNSURLSessionDataTask = Pointer;

  NSCachedURLResponseClass = interface(NSObjectClass)
    ['{D9E94D08-B037-49B7-BD73-A280600CA9BA}']
  end;

  NSCachedURLResponse = interface(NSObject)
    ['{A9626B16-3438-4D45-B8FB-4F16A4AE31DF}']
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
    ['{7A14FA5D-5138-4466-9AE6-ECDB692C5C05}']
    { class } function sharedURLCache: NSURLCache; cdecl;
    { class } procedure setSharedURLCache(cache: NSURLCache); cdecl;
  end;

  NSURLCache = interface(NSObject)
    ['{E80F79C4-0597-4B2D-99B6-CA7D496D7ABE}']
    function initWithMemoryCapacity(memoryCapacity: NSUInteger;
      diskCapacity: NSUInteger; diskPath: NSString)
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
      completionHandler: TFoundationCompletionHandler3); cdecl;
    procedure removeCachedResponseForDataTask
      (dataTask: NSURLSessionDataTask); cdecl;
  end;

  TNSURLCache = class(TOCGenericImport<NSURLCacheClass, NSURLCache>)
  end;

  PNSURLCache = Pointer;

  NSURLConnectionClass = interface(NSObjectClass)
    ['{9A41FA13-2930-4928-801E-3FCD7EC88968}']
    { class } function connectionWithRequest(request: NSURLRequest;
      delegate: Pointer): NSURLConnection; cdecl;
    { class } function canHandleRequest(request: NSURLRequest): Boolean; cdecl;
    { class } function sendSynchronousRequest(request: NSURLRequest;
      returningResponse: NSURLResponse; error: NSError): NSData; cdecl;
    { class } procedure sendAsynchronousRequest(request: NSURLRequest;
      queue: NSOperationQueue;
      completionHandler: TFoundationCompletionHandler4); cdecl;
  end;

  NSURLConnection = interface(NSObject)
    ['{9CA5672B-18FD-4E6F-87A6-179F5E4D3BCE}']
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
    procedure scheduleInRunLoop(aRunLoop: NSRunLoop; forMode: NSString); cdecl;
    procedure unscheduleFromRunLoop(aRunLoop: NSRunLoop;
      forMode: NSString); cdecl;
    procedure setDelegateQueue(queue: NSOperationQueue); cdecl;
  end;

  TNSURLConnection = class(TOCGenericImport<NSURLConnectionClass,
    NSURLConnection>)
  end;

  PNSURLConnection = Pointer;

  NSURLCredentialStorageClass = interface(NSObjectClass)
    ['{D7B1EF57-8241-49BD-89B0-2098402FB82A}']
    { class } function sharedCredentialStorage: NSURLCredentialStorage; cdecl;
  end;

  NSURLCredentialStorage = interface(NSObject)
    ['{3B65654C-C247-4405-BB6D-C53E6BF01E64}']
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
      completionHandler: TFoundationCompletionHandler5); cdecl;
    [MethodName('setCredential:forProtectionSpace:task:')]
    procedure setCredentialForProtectionSpaceTask(credential: NSURLCredential;
      forProtectionSpace: NSURLProtectionSpace; task: NSURLSessionTask); cdecl;
    [MethodName('removeCredential:forProtectionSpace:options:task:')]
    procedure removeCredentialForProtectionSpaceOptionsTask
      (credential: NSURLCredential; forProtectionSpace: NSURLProtectionSpace;
      options: NSDictionary; task: NSURLSessionTask); cdecl;
    procedure getDefaultCredentialForProtectionSpace
      (space: NSURLProtectionSpace; task: NSURLSessionTask;
      completionHandler: TFoundationCompletionHandler6); cdecl;
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
    ['{78AE8599-9AB8-43C9-B85F-D329B2B84B4F}']
  end;

  NSMutableURLRequest = interface(NSURLRequest)
    ['{AD5E533E-7085-4517-8280-E040144851D3}']
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
    ['{EED50978-30EC-43DA-A046-6AC9712DDDB4}']
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
    ['{2F73B964-321F-497D-814E-3BA7C17DCEBF}']
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
    ['{E30F2798-BCC1-427A-997B-24604760BBEE}']
    { class } function localizedStringForStatusCode(statusCode: NSInteger)
      : NSString; cdecl;
  end;

  NSHTTPURLResponse = interface(NSURLResponse)
    ['{AD10FDFE-8692-4DBC-856B-20201B3BE9DD}']
    function initWithURL(url: NSURL; statusCode: NSInteger;
      HTTPVersion: NSString; headerFields: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function statusCode: NSInteger; cdecl;
    function allHeaderFields: NSDictionary; cdecl;
  end;

  TNSHTTPURLResponse = class(TOCGenericImport<NSHTTPURLResponseClass,
    NSHTTPURLResponse>)
  end;

  PNSHTTPURLResponse = Pointer;

  NSUserDefaultsClass = interface(NSObjectClass)
    ['{4102FD60-8A42-466B-883E-235C80D7B463}']
    { class } function standardUserDefaults: NSUserDefaults; cdecl;
    { class } procedure resetStandardUserDefaults; cdecl;
  end;

  NSUserDefaults = interface(NSObject)
    ['{29841C55-BF8C-4181-BEF6-D985370B4FFE}']
    function init: Pointer { instancetype }; cdecl;
    function initWithSuiteName(suitename: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithUser(username: NSString): Pointer; cdecl;
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
    ['{D2884F23-50D2-4E63-8F68-EBA3BFECA9CE}']
    { class } procedure setValueTransformer(transformer: NSValueTransformer;
      forName: NSString); cdecl;
    { class } function valueTransformerForName(name: NSString)
      : NSValueTransformer; cdecl;
    { class } function valueTransformerNames: NSArray; cdecl;
    { class } function transformedValueClass: Pointer; cdecl;
    { class } function allowsReverseTransformation: Boolean; cdecl;
  end;

  NSValueTransformer = interface(NSObject)
    ['{F11864C6-7077-4E02-A23B-DCB00CED497A}']
    function transformedValue(value: Pointer): Pointer; cdecl;
    function reverseTransformedValue(value: Pointer): Pointer; cdecl;
  end;

  TNSValueTransformer = class(TOCGenericImport<NSValueTransformerClass,
    NSValueTransformer>)
  end;

  PNSValueTransformer = Pointer;

  NSXMLParserClass = interface(NSObjectClass)
    ['{C0E997C7-56C2-40CA-9FE1-C938D0DD834C}']
  end;

  NSXMLParser = interface(NSObject)
    ['{75E69DA6-ACDF-487A-B291-39572B34F578}']
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

  NSMutableAttributedStringClass = interface(NSAttributedStringClass)
    ['{E3694907-50C6-4E11-856E-851A2238D1B6}']
  end;

  NSMutableAttributedString = interface(NSAttributedString)
    ['{0FAE7BC1-180E-4889-B69B-700B88067A81}']
    [MethodName('replaceCharactersInRange:withString:')]
    procedure replaceCharactersInRangeWithString(range: NSRange;
      withString: NSString); cdecl;
    procedure setAttributes(attrs: NSDictionary; range: NSRange); cdecl;
    function mutableString: NSMutableString; cdecl;
    procedure addAttribute(name: NSString; value: Pointer;
      range: NSRange); cdecl;
    procedure addAttributes(attrs: NSDictionary; range: NSRange); cdecl;
    procedure removeAttribute(name: NSString; range: NSRange); cdecl;
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
  end;

  TNSMutableAttributedString = class
    (TOCGenericImport<NSMutableAttributedStringClass,
    NSMutableAttributedString>)
  end;

  PNSMutableAttributedString = Pointer;

  NSByteCountFormatterClass = interface(NSFormatterClass)
    ['{96E9D5CA-CD98-4500-9B8A-5875F75D2D04}']
    { class } function stringFromByteCount(byteCount: Int64;
      countStyle: NSByteCountFormatterCountStyle): NSString; cdecl;
  end;

  NSByteCountFormatter = interface(NSFormatter)
    ['{077D653E-0DC1-4C9D-A888-FB71BFD7ED02}']
    function stringFromByteCount(byteCount: Int64): NSString; cdecl;
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
    ['{49E846FC-F120-4F86-800D-B3320DC873C8}']
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
    { class } function predicateWithBlock(block: TFoundationBlock8)
      : NSPredicate; cdecl;
  end;

  NSPredicate = interface(NSObject)
    ['{DCF1E23B-0E4B-4F2B-BA90-8AC5B4891AEF}']
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
    ['{CF131C63-483B-44A5-A327-DF297EE4D44B}']
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
      usingIteratorVariable: NSString; predicate: Pointer): NSExpression; cdecl;
    [MethodName('expressionForFunction:selectorName:arguments:')]
    { class } function expressionForFunctionSelectorNameArguments
      (target: NSExpression; selectorName: NSString; arguments: NSArray)
      : NSExpression; cdecl;
    { class } function expressionForAnyKey: NSExpression; cdecl;
    { class } function expressionForBlock(block: TFoundationBlock9;
      arguments: NSArray): NSExpression; cdecl;
    { class } function expressionForConditional(predicate: NSPredicate;
      trueExpression: NSExpression; falseExpression: NSExpression)
      : NSExpression; cdecl;
  end;

  NSExpression = interface(NSObject)
    ['{6E17CFAA-CCE0-4744-B974-928B1AA33D55}']
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
    function expressionBlock: TFoundationBlock9; cdecl;
    function expressionValueWithObject(&object: Pointer;
      context: NSMutableDictionary): Pointer; cdecl;
    procedure allowEvaluation; cdecl;
  end;

  TNSExpression = class(TOCGenericImport<NSExpressionClass, NSExpression>)
  end;

  PNSExpression = Pointer;

  NSComparisonPredicateClass = interface(NSPredicateClass)
    ['{7AF24ECD-DB3D-4502-9A84-4BF484FD9609}']
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
    ['{53F1664E-7F4A-4458-B7EB-1ACC06685E5D}']
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
    ['{6F9188A2-F15A-4DA8-B990-23EFFD34938C}']
    { class } function andPredicateWithSubpredicates(subpredicates: NSArray)
      : NSCompoundPredicate; cdecl;
    { class } function orPredicateWithSubpredicates(subpredicates: NSArray)
      : NSCompoundPredicate; cdecl;
    { class } function notPredicateWithSubpredicate(predicate: NSPredicate)
      : NSCompoundPredicate; cdecl;
  end;

  NSCompoundPredicate = interface(NSPredicate)
    ['{F5384E3A-A6C8-462D-BA19-F56AF26865C3}']
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
    ['{1ACF438D-A775-4673-AB8A-5D1B758A38F4}']
    { class } function localizedStringFromDateComponents
      (components: NSDateComponents;
      unitsStyle: NSDateComponentsFormatterUnitsStyle): NSString; cdecl;
  end;

  NSDateComponentsFormatter = interface(NSFormatter)
    ['{12F6ACB7-A36D-4FCA-AD6A-1D477330C86D}']
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
    ['{896C6A8D-E5C8-4EB1-8ECE-7D434BBD3484}']
  end;

  NSExtensionContext = interface(NSObject)
    ['{4A39F071-AC2C-44C8-A9A2-1584BED5D9E4}']
    function inputItems: NSArray; cdecl;
    procedure completeRequestReturningItems(items: NSArray;
      completionHandler: TFoundationCompletionHandler1); cdecl;
    procedure cancelRequestWithError(error: NSError); cdecl;
    procedure openURL(url: NSURL;
      completionHandler: TFoundationCompletionHandler1); cdecl;
  end;

  TNSExtensionContext = class(TOCGenericImport<NSExtensionContextClass,
    NSExtensionContext>)
  end;

  PNSExtensionContext = Pointer;

  NSItemProviderClass = interface(NSObjectClass)
    ['{C3E9C33D-11C3-4350-A84A-3D7856E2FF82}']
  end;

  NSItemProvider = interface(NSObject)
    ['{58493511-0F6A-488D-A430-55DF6CB023A1}']
    function initWithItem(item: Pointer; typeIdentifier: NSString)
      : Pointer { instancetype }; cdecl;
    function initWithContentsOfURL(fileURL: NSURL)
      : Pointer { instancetype }; cdecl;
    procedure registerItemForTypeIdentifier(typeIdentifier: NSString;
      loadHandler: NSItemProviderLoadHandler); cdecl;
    function registeredTypeIdentifiers: NSArray; cdecl;
    function hasItemConformingToTypeIdentifier(typeIdentifier: NSString)
      : Boolean; cdecl;
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

  NSExtensionItemClass = interface(NSObjectClass)
    ['{EF106A84-E347-4410-9EB6-1C6ECAE1284F}']
  end;

  NSExtensionItem = interface(NSObject)
    ['{D862721B-36BB-4C84-8328-4EB2F785B1D3}']
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
    ['{B4595427-3A8C-4DFC-94D0-A43AF02049AD}']
    { class } function readingIntentWithURL(url: NSURL;
      options: NSFileCoordinatorReadingOptions)
      : Pointer { instancetype }; cdecl;
    { class } function writingIntentWithURL(url: NSURL;
      options: NSFileCoordinatorWritingOptions)
      : Pointer { instancetype }; cdecl;
  end;

  NSFileAccessIntent = interface(NSObject)
    ['{CB97E601-CF2F-4661-8AEE-17F86EE477DC}']
    function url: NSURL; cdecl;
  end;

  TNSFileAccessIntent = class(TOCGenericImport<NSFileAccessIntentClass,
    NSFileAccessIntent>)
  end;

  PNSFileAccessIntent = Pointer;

  NSFileCoordinatorClass = interface(NSObjectClass)
    ['{DCAF5E05-86EB-44E9-B01B-03CE98B2859F}']
    { class } procedure addFilePresenter(filePresenter: Pointer); cdecl;
    { class } procedure removeFilePresenter(filePresenter: Pointer); cdecl;
    { class } function filePresenters: NSArray; cdecl;
  end;

  NSFileCoordinator = interface(NSObject)
    ['{CDF4A2CD-A015-4C65-96DF-C07274654E8C}']
    function initWithFilePresenter(filePresenterOrNil: Pointer)
      : Pointer { instancetype }; cdecl;
    procedure setPurposeIdentifier(purposeIdentifier: NSString); cdecl;
    function purposeIdentifier: NSString; cdecl;
    procedure coordinateAccessWithIntents(intents: NSArray;
      queue: NSOperationQueue; byAccessor: TFoundationCompletionHandler); cdecl;
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
    procedure cancel; cdecl;
  end;

  TNSFileCoordinator = class(TOCGenericImport<NSFileCoordinatorClass,
    NSFileCoordinator>)
  end;

  PNSFileCoordinator = Pointer;

  NSFileVersionClass = interface(NSObjectClass)
    ['{8AB08E91-21A3-4027-A3CA-E6887ED2DAD8}']
    { class } function currentVersionOfItemAtURL(url: NSURL)
      : NSFileVersion; cdecl;
    { class } function otherVersionsOfItemAtURL(url: NSURL): NSArray; cdecl;
    { class } function unresolvedConflictVersionsOfItemAtURL(url: NSURL)
      : NSArray; cdecl;
    { class } procedure getNonlocalVersionsOfItemAtURL(url: NSURL;
      completionHandler: TFoundationCompletionHandler7); cdecl;
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
    ['{D122C2F5-9246-4A62-AB9E-D7EDCB7E6E1A}']
    function url: NSURL; cdecl;
    function localizedName: NSString; cdecl;
    function localizedNameOfSavingComputer: NSString; cdecl;
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
    ['{C7FCB2AE-A896-4A53-B708-93F81AB19E95}']
  end;

  NSFileWrapper = interface(NSObject)
    ['{7491346A-B870-4A72-A76A-C1CD321B8562}']
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
    ['{F0FCABFF-0BB5-40BB-940B-A8235682A468}']
    { class } function availableTagSchemesForLanguage(language: NSString)
      : NSArray; cdecl;
  end;

  NSLinguisticTagger = interface(NSObject)
    ['{250CC3F2-680A-41EB-B119-C89062F4217D}']
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
    procedure enumerateTagsInRange(range: NSRange; scheme: NSString;
      options: NSLinguisticTaggerOptions;
      usingBlock: TFoundationUsingBlock); cdecl;
    function sentenceRangeForRange(range: NSRange): NSRange; cdecl;
    function tagAtIndex(charIndex: NSUInteger; scheme: NSString;
      tokenRange: NSRangePointer; sentenceRange: NSRangePointer)
      : NSString; cdecl;
    function tagsInRange(range: NSRange; scheme: NSString;
      options: NSLinguisticTaggerOptions; tokenRanges: NSArray): NSArray; cdecl;
    function possibleTagsAtIndex(charIndex: NSUInteger; scheme: NSString;
      tokenRange: NSRangePointer; sentenceRange: NSRangePointer;
      scores: NSArray): NSArray; cdecl;
  end;

  TNSLinguisticTagger = class(TOCGenericImport<NSLinguisticTaggerClass,
    NSLinguisticTagger>)
  end;

  PNSLinguisticTagger = Pointer;

  NSMetadataItemClass = interface(NSObjectClass)
    ['{EFBF53E5-AE2A-4AD9-8AFB-0797048E72DA}']
  end;

  NSMetadataItem = interface(NSObject)
    ['{1AE7CBBF-CD65-4552-AD78-21F4534654F8}']
    function initWithURL(url: NSURL): Pointer { instancetype }; cdecl;
    function valueForAttribute(key: NSString): Pointer; cdecl;
    function valuesForAttributes(keys: NSArray): NSDictionary; cdecl;
    function attributes: NSArray; cdecl;
  end;

  TNSMetadataItem = class(TOCGenericImport<NSMetadataItemClass, NSMetadataItem>)
  end;

  PNSMetadataItem = Pointer;

  NSMetadataQueryAttributeValueTupleClass = interface(NSObjectClass)
    ['{98F2E47B-0853-4ED5-96B8-4513CE31ACDE}']
  end;

  NSMetadataQueryAttributeValueTuple = interface(NSObject)
    ['{2CF2B629-396F-449F-B662-4F89853DE52D}']
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
    ['{9532205B-C9AA-427D-8D5E-3C18C41B98F6}']
  end;

  NSMetadataQueryResultGroup = interface(NSObject)
    ['{171F002F-0C68-49B6-8061-FAB07CD739C0}']
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
    ['{6F600872-7A34-4065-84E8-E03B360F6DEE}']
  end;

  NSMetadataQuery = interface(NSObject)
    ['{4C64CDCA-9D5C-445F-AFE5-DB24E12228D9}']
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
    procedure enumerateResultsUsingBlock(block: TFoundationBlock10); cdecl;
    procedure enumerateResultsWithOptions(opts: NSEnumerationOptions;
      usingBlock: TFoundationBlock10); cdecl;
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
    ['{A2CFC0B0-BEC2-406D-AE00-879D20913DDF}']
    { class } function dictionaryFromTXTRecordData(txtData: NSData)
      : NSDictionary; cdecl;
    { class } function dataFromTXTRecordDictionary(txtDictionary: NSDictionary)
      : NSData; cdecl;
  end;

  NSNetService = interface(NSObject)
    ['{47D41E1C-D74D-4375-8E18-F38BA10DE8C3}']
    [MethodName('initWithDomain:type:name:port:')]
    function initWithDomainTypeNamePort(domain: NSString; &type: NSString;
      name: NSString; port: Integer): Pointer { instancetype }; cdecl;
    [MethodName('initWithDomain:type:name:')]
    function initWithDomainTypeName(domain: NSString; &type: NSString;
      name: NSString): Pointer { instancetype }; cdecl;
    procedure scheduleInRunLoop(aRunLoop: NSRunLoop; forMode: NSString); cdecl;
    procedure removeFromRunLoop(aRunLoop: NSRunLoop; forMode: NSString); cdecl;
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
    ['{AE75C27E-DC8F-4C90-9E39-7A72977A71E9}']
  end;

  NSNetServiceBrowser = interface(NSObject)
    ['{4A84BC56-5275-4AEA-8054-7EE638370715}']
    function init: Pointer { instancetype }; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setIncludesPeerToPeer(includesPeerToPeer: Boolean); cdecl;
    function includesPeerToPeer: Boolean; cdecl;
    procedure scheduleInRunLoop(aRunLoop: NSRunLoop; forMode: NSString); cdecl;
    procedure removeFromRunLoop(aRunLoop: NSRunLoop; forMode: NSString); cdecl;
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
    ['{F6A1EDAA-145A-4E2F-B602-11BDE26AD9AE}']
    { class } function defaultStore: NSUbiquitousKeyValueStore; cdecl;
  end;

  NSUbiquitousKeyValueStore = interface(NSObject)
    ['{F0C18F3B-A7AE-4001-8887-459F2B8F7192}']
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
    ['{73E0AA35-7E0A-401C-9CE0-246642C8DC21}']
  end;

  NSUndoManager = interface(NSObject)
    ['{C3C1ACBB-3471-4E9A-BF4F-B33807085056}']
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
    ['{D1873EBB-DC62-40CE-B3FB-036EF3D2B19E}']
  end;

  NSURLSessionUploadTask = interface(NSURLSessionDataTask)
    ['{19A9D824-0434-447B-8BFE-A240792DA159}']
  end;

  TNSURLSessionUploadTask = class(TOCGenericImport<NSURLSessionUploadTaskClass,
    NSURLSessionUploadTask>)
  end;

  PNSURLSessionUploadTask = Pointer;

  NSURLSessionDownloadTaskClass = interface(NSURLSessionTaskClass)
    ['{3B963E1A-B000-4956-B922-48B6D8655E19}']
  end;

  NSURLSessionDownloadTask = interface(NSURLSessionTask)
    ['{8A0783EC-0BC8-4036-B82B-D818E4A477CF}']
    procedure cancelByProducingResumeData(completionHandler
      : TFoundationCompletionHandler11); cdecl;
  end;

  TNSURLSessionDownloadTask = class
    (TOCGenericImport<NSURLSessionDownloadTaskClass, NSURLSessionDownloadTask>)
  end;

  PNSURLSessionDownloadTask = Pointer;

  NSURLSessionClass = interface(NSObjectClass)
    ['{EB634DA9-4376-452C-AC06-A30F67F4A524}']
    { class } function sharedSession: NSURLSession; cdecl;
    [MethodName('sessionWithConfiguration:')]
    { class } function sessionWithConfiguration(configuration
      : NSURLSessionConfiguration): NSURLSession; cdecl;
    [MethodName('sessionWithConfiguration:delegate:delegateQueue:')]
    { class } function sessionWithConfigurationDelegateDelegateQueue
      (configuration: NSURLSessionConfiguration; delegate: Pointer;
      delegateQueue: NSOperationQueue): NSURLSession; cdecl;
  end;

  NSURLSession = interface(NSObject)
    ['{27CC7CC5-E961-4334-A257-7FBBACDEAAFB}']
    function delegateQueue: NSOperationQueue; cdecl;
    function delegate: Pointer; cdecl;
    function configuration: NSURLSessionConfiguration; cdecl;
    procedure setSessionDescription(sessionDescription: NSString); cdecl;
    function sessionDescription: NSString; cdecl;
    procedure finishTasksAndInvalidate; cdecl;
    procedure invalidateAndCancel; cdecl;
    procedure resetWithCompletionHandler(completionHandler
      : TFoundationCancellationHandler); cdecl;
    procedure flushWithCompletionHandler(completionHandler
      : TFoundationCancellationHandler); cdecl;
    procedure getTasksWithCompletionHandler(completionHandler
      : TFoundationCompletionHandler8); cdecl;
    procedure getAllTasksWithCompletionHandler(completionHandler
      : TFoundationCompletionHandler2); cdecl;
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
    [MethodName('dataTaskWithRequest:completionHandler:')]
    function dataTaskWithRequestCompletionHandler(request: NSURLRequest;
      completionHandler: TFoundationCompletionHandler9)
      : NSURLSessionDataTask; cdecl;
    [MethodName('dataTaskWithURL:completionHandler:')]
    function dataTaskWithURLCompletionHandler(url: NSURL;
      completionHandler: TFoundationCompletionHandler9)
      : NSURLSessionDataTask; cdecl;
    [MethodName('uploadTaskWithRequest:fromFile:completionHandler:')]
    function uploadTaskWithRequestFromFileCompletionHandler
      (request: NSURLRequest; fromFile: NSURL;
      completionHandler: TFoundationCompletionHandler9)
      : NSURLSessionUploadTask; cdecl;
    [MethodName('uploadTaskWithRequest:fromData:completionHandler:')]
    function uploadTaskWithRequestFromDataCompletionHandler
      (request: NSURLRequest; fromData: NSData;
      completionHandler: TFoundationCompletionHandler9)
      : NSURLSessionUploadTask; cdecl;
    [MethodName('downloadTaskWithRequest:completionHandler:')]
    function downloadTaskWithRequestCompletionHandler(request: NSURLRequest;
      completionHandler: TFoundationCompletionHandler10)
      : NSURLSessionDownloadTask; cdecl;
    [MethodName('downloadTaskWithURL:completionHandler:')]
    function downloadTaskWithURLCompletionHandler(url: NSURL;
      completionHandler: TFoundationCompletionHandler10)
      : NSURLSessionDownloadTask; cdecl;
    [MethodName('downloadTaskWithResumeData:completionHandler:')]
    function downloadTaskWithResumeDataCompletionHandler(resumeData: NSData;
      completionHandler: TFoundationCompletionHandler10)
      : NSURLSessionDownloadTask; cdecl;
  end;

  TNSURLSession = class(TOCGenericImport<NSURLSessionClass, NSURLSession>)
  end;

  PNSURLSession = Pointer;

  NSURLSessionStreamTaskClass = interface(NSURLSessionTaskClass)
    ['{E03C1257-5DF0-4F3F-9C54-BACC5DC08C64}']
  end;

  NSURLSessionStreamTask = interface(NSURLSessionTask)
    ['{DFB2445B-1890-48E9-9AF2-79223B17FBCE}']
    procedure readDataOfMinLength(minBytes: NSUInteger; maxLength: NSUInteger;
      timeout: NSTimeInterval;
      completionHandler: TFoundationCompletionHandler12); cdecl;
    procedure writeData(data: NSData; timeout: NSTimeInterval;
      completionHandler: TFoundationCompletionHandler); cdecl;
    procedure captureStreams; cdecl;
    procedure closeWrite; cdecl;
    procedure closeRead; cdecl;
    procedure startSecureConnection; cdecl;
    procedure stopSecureConnection; cdecl;
  end;

  TNSURLSessionStreamTask = class(TOCGenericImport<NSURLSessionStreamTaskClass,
    NSURLSessionStreamTask>)
  end;

  PNSURLSessionStreamTask = Pointer;

  NSURLSessionConfigurationClass = interface(NSObjectClass)
    ['{85F34856-44C3-48FA-9ACD-9297DB6A19A3}']
    { class } function defaultSessionConfiguration
      : NSURLSessionConfiguration; cdecl;
    { class } function ephemeralSessionConfiguration
      : NSURLSessionConfiguration; cdecl;
    { class } function backgroundSessionConfigurationWithIdentifier
      (identifier: NSString): NSURLSessionConfiguration; cdecl;
    { class } function backgroundSessionConfiguration(identifier: NSString)
      : NSURLSessionConfiguration; cdecl;
  end;

  NSURLSessionConfiguration = interface(NSObject)
    ['{12532CFA-3AC5-410B-91C4-4835EF26CBA1}']
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
  end;

  TNSURLSessionConfiguration = class
    (TOCGenericImport<NSURLSessionConfigurationClass,
    NSURLSessionConfiguration>)
  end;

  PNSURLSessionConfiguration = Pointer;

  NSUserActivityClass = interface(NSObjectClass)
    ['{9274EEDC-6CE6-412A-A2BC-478D43876C66}']
  end;

  NSUserActivity = interface(NSObject)
    ['{420FA507-52C0-4380-9625-884D636CD3F0}']
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
    procedure setExpirationDate(expirationDate: NSDate); cdecl;
    function expirationDate: NSDate; cdecl;
    procedure setKeywords(keywords: NSSet); cdecl;
    function keywords: NSSet; cdecl;
    procedure setSupportsContinuationStreams(supportsContinuationStreams
      : Boolean); cdecl;
    function supportsContinuationStreams: Boolean; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure becomeCurrent; cdecl;
    procedure resignCurrent; cdecl;
    procedure invalidate; cdecl;
    procedure getContinuationStreamsWithCompletionHandler(completionHandler
      : TFoundationCompletionHandler16); cdecl;
    procedure setEligibleForHandoff(eligibleForHandoff: Boolean); cdecl;
    function isEligibleForHandoff: Boolean; cdecl;
    procedure setEligibleForSearch(eligibleForSearch: Boolean); cdecl;
    function isEligibleForSearch: Boolean; cdecl;
    procedure setEligibleForPublicIndexing(eligibleForPublicIndexing
      : Boolean); cdecl;
    function isEligibleForPublicIndexing: Boolean; cdecl;
  end;

  TNSUserActivity = class(TOCGenericImport<NSUserActivityClass, NSUserActivity>)
  end;

  PNSUserActivity = Pointer;

  // ===== Protocol declarations =====

  NSCopying = interface(IObjectiveC)
    ['{7CF7C122-1641-463D-AC85-2BFBD6D66064}']
    function copyWithZone(zone: Pointer): Pointer; cdecl;
  end;

  NSMutableCopying = interface(IObjectiveC)
    ['{B01A6C11-0D99-478A-8DC7-FDDF9B2AF195}']
    function mutableCopyWithZone(zone: Pointer): Pointer; cdecl;
  end;

  NSCoding = interface(IObjectiveC)
    ['{5E51CD24-A817-4991-9B9A-33D01B1EFE96}']
    procedure encodeWithCoder(aCoder: NSCoder); cdecl;
    function initWithCoder(aDecoder: NSCoder): Pointer { instancetype }; cdecl;
  end;

  NSSecureCoding = interface(IObjectiveC)
    ['{B10FFF43-6CE7-4DF1-B681-580DE75DAC78}']
    function supportsSecureCoding: Boolean; cdecl;
  end;

  NSDiscardableContent = interface(IObjectiveC)
    ['{1211344A-262A-4DCE-BB79-68633E0458F6}']
    function beginContentAccess: Boolean; cdecl;
    procedure endContentAccess; cdecl;
    procedure discardContentIfPossible; cdecl;
    function isContentDiscarded: Boolean; cdecl;
  end;

  NSFastEnumeration = interface(IObjectiveC)
    ['{83651A73-B989-4682-B7BC-F2DC79336B45}']
    function countByEnumeratingWithState(state: Pointer; objects: Pointer;
      count: NSUInteger): NSUInteger; cdecl;
  end;

  NSProgressReporting = interface(IObjectiveC)
    ['{E8B7A48C-EC76-450E-9A7D-172520ED897F}']
    function progress: NSProgress; cdecl;
  end;

  NSDecimalNumberBehaviors = interface(IObjectiveC)
    ['{378CFA43-5326-422B-9259-61A58A2D7C77}']
    function roundingMode: NSRoundingMode; cdecl;
    function scale: SmallInt; cdecl;
    function exceptionDuringOperation(operation: SEL; error: NSCalculationError;
      leftOperand: NSDecimalNumber; rightOperand: NSDecimalNumber)
      : NSDecimalNumber; cdecl;
  end;

  NSFileManagerDelegate = interface(IObjectiveC)
    ['{85D0B4FC-9CA7-4CEF-ACED-F51DDBB8FA45}']
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
    ['{0A7DCA92-E17F-40F7-94A0-272252A12B91}']
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
    ['{DCBC8F39-F28B-4DF3-AA35-68A8F0BA54F8}']
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
    ['{60D45F15-4BDD-49F3-8101-5923ADDA3DCF}']
    procedure lock; cdecl;
    procedure unlock; cdecl;
  end;

  NSPortDelegate = interface(IObjectiveC)
    ['{7C08C5E5-6382-46CE-8B6B-455A0EBC6376}']
    procedure handlePortMessage(message: NSPortMessage); cdecl;
  end;

  NSMachPortDelegate = interface(IObjectiveC)
    ['{168E4B0B-FA3D-45E6-A506-6B99AEEAC0C6}']
    procedure handleMachMessage(msg: Pointer); cdecl;
  end;

  NSStreamDelegate = interface(IObjectiveC)
    ['{1C4E6C7D-0A3F-4C7C-ACF4-D96D721055C1}']
    procedure stream(aStream: NSStream; handleEvent: NSStreamEvent); cdecl;
  end;

  NSURLAuthenticationChallengeSender = interface(IObjectiveC)
    ['{B1A853FC-3317-42FA-8B3A-A92492902DE9}']
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
    ['{3F93A469-F5D5-4165-9C99-D979DA35EF08}']
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
    ['{EBE9BA62-C448-43B1-8876-4428FBBB3CC1}']
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
    ['{DB385645-7573-4761-98DA-90B99526F533}']
    procedure connection(connection: NSURLConnection; didWriteData: Int64;
      totalBytesWritten: Int64; expectedTotalBytes: Int64); cdecl;
    procedure connectionDidResumeDownloading(connection: NSURLConnection;
      totalBytesWritten: Int64; expectedTotalBytes: Int64); cdecl;
    procedure connectionDidFinishDownloading(connection: NSURLConnection;
      destinationURL: NSURL); cdecl;
  end;

  NSURLProtocolClient = interface(IObjectiveC)
    ['{68FA3BD8-1CDD-4084-8D61-D6F36DEA799F}']
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
    ['{B3F4FE42-1B3D-4280-A107-30960FE3C694}']
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

  NSCacheDelegate = interface(IObjectiveC)
    ['{B7523C77-2D80-4B53-81EB-8001E053695B}']
    procedure cache(cache: NSCache; willEvictObject: Pointer); cdecl;
  end;

  NSExtensionRequestHandling = interface(IObjectiveC)
    ['{5050E8E0-1634-4EA9-A5C8-A82DF5D6CF73}']
    procedure beginRequestWithExtensionContext
      (context: NSExtensionContext); cdecl;
  end;

  NSFilePresenter = interface(IObjectiveC)
    ['{6337ABB4-C5A5-4C76-924A-1075225575A5}']
    function presentedItemURL: NSURL; cdecl;
    function presentedItemOperationQueue: NSOperationQueue; cdecl;
    function primaryPresentedItemURL: NSURL; cdecl;
    procedure relinquishPresentedItemToReader
      (reader: TFoundationByAccessor2); cdecl;
    procedure relinquishPresentedItemToWriter
      (writer: TFoundationByAccessor2); cdecl;
    procedure savePresentedItemChangesWithCompletionHandler(completionHandler
      : TFoundationCompletionHandler); cdecl;
    procedure accommodatePresentedItemDeletionWithCompletionHandler
      (completionHandler: TFoundationCompletionHandler); cdecl;
    procedure presentedItemDidMoveToURL(newURL: NSURL); cdecl;
    procedure presentedItemDidChange; cdecl;
    procedure presentedItemDidGainVersion(version: NSFileVersion); cdecl;
    procedure presentedItemDidLoseVersion(version: NSFileVersion); cdecl;
    procedure presentedItemDidResolveConflictVersion
      (version: NSFileVersion); cdecl;
    procedure accommodatePresentedSubitemDeletionAtURL(url: NSURL;
      completionHandler: TFoundationCompletionHandler); cdecl;
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
    ['{D9CE46CE-BCEE-485E-94A1-7976AEC23BE9}']
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
    ['{607727B9-EE0F-40F9-8A89-311F59A89473}']
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
    ['{AAEECF85-C7E4-4F96-B835-67B2BB1F96F1}']
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
    ['{AAE6155A-590E-40E7-846A-1E6C289A808F}']
    [MethodName('URLSession:didBecomeInvalidWithError:')]
    procedure URLSessionDidBecomeInvalidWithError(session: NSURLSession;
      didBecomeInvalidWithError: NSError); cdecl;
    [MethodName('URLSession:didReceiveChallenge:completionHandler:')]
    procedure URLSessionDidReceiveChallengeCompletionHandler
      (session: NSURLSession; didReceiveChallenge: NSURLAuthenticationChallenge;
      completionHandler: TFoundationCompletionHandler13); cdecl;
    procedure URLSessionDidFinishEventsForBackgroundURLSession
      (session: NSURLSession); cdecl;
  end;

  NSURLSessionTaskDelegate = interface(IObjectiveC)
    ['{689225BF-4E7A-41C1-A8A8-61C29BCF89AB}']
    [MethodName
      ('URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:')
      ]
    procedure URLSessionTaskWillPerformHTTPRedirectionNewRequestCompletionHandler
      (session: NSURLSession; task: NSURLSessionTask;
      willPerformHTTPRedirection: NSHTTPURLResponse; newRequest: NSURLRequest;
      completionHandler: TFoundationCompletionHandler14); cdecl;
    [MethodName('URLSession:task:didReceiveChallenge:completionHandler:')]
    procedure URLSessionTaskDidReceiveChallengeCompletionHandler
      (session: NSURLSession; task: NSURLSessionTask;
      didReceiveChallenge: NSURLAuthenticationChallenge;
      completionHandler: TFoundationCompletionHandler13); cdecl;
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
    [MethodName('URLSession:task:didCompleteWithError:')]
    procedure URLSessionTaskDidCompleteWithError(session: NSURLSession;
      task: NSURLSessionTask; didCompleteWithError: NSError); cdecl;
  end;

  NSURLSessionDataDelegate = interface(IObjectiveC)
    ['{1E2F883D-96C8-42EA-B2D2-0AAD88DFA713}']
    [MethodName('URLSession:dataTask:didReceiveResponse:completionHandler:')]
    procedure URLSessionDataTaskDidReceiveResponseCompletionHandler
      (session: NSURLSession; dataTask: NSURLSessionDataTask;
      didReceiveResponse: NSURLResponse;
      completionHandler: TFoundationCompletionHandler15); cdecl;
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
      completionHandler: TFoundationCompletionHandler3); cdecl;
  end;

  NSURLSessionDownloadDelegate = interface(IObjectiveC)
    ['{1B6E2994-5683-48EC-91FF-B446022AE9AA}']
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
    ['{6D9395AB-3F9E-4A73-844E-79D4DDF4CA14}']
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

  NSUserActivityDelegate = interface(IObjectiveC)
    ['{732D526B-1589-410C-99E0-FFCFCD6A8750}']
    procedure userActivityWillSave(userActivity: NSUserActivity); cdecl;
    procedure userActivityWasContinued(userActivity: NSUserActivity); cdecl;
    procedure userActivity(userActivity: NSUserActivity;
      didReceiveInputStream: NSInputStream;
      outputStream: NSOutputStream); cdecl;
  end;

  // ===== Exported string consts =====

function NSFoundationVersionNumber: Pointer;
function NSStringTransformLatinToKatakana: NSString;
function NSStringTransformLatinToHiragana: NSString;
function NSStringTransformLatinToHangul: NSString;
function NSStringTransformLatinToArabic: NSString;
function NSStringTransformLatinToHebrew: NSString;
function NSStringTransformLatinToThai: NSString;
function NSStringTransformLatinToCyrillic: NSString;
function NSStringTransformLatinToGreek: NSString;
function NSStringTransformToLatin: NSString;
function NSStringTransformMandarinToLatin: NSString;
function NSStringTransformHiraganaToKatakana: NSString;
function NSStringTransformFullwidthToHalfwidth: NSString;
function NSStringTransformToXMLHex: NSString;
function NSStringTransformToUnicodeName: NSString;
function NSStringTransformStripCombiningMarks: NSString;
function NSStringTransformStripDiacritics: NSString;
function NSStringEncodingDetectionSuggestedEncodingsKey: NSString;
function NSStringEncodingDetectionDisallowedEncodingsKey: NSString;
function NSStringEncodingDetectionUseOnlySuggestedEncodingsKey: NSString;
function NSStringEncodingDetectionAllowLossyKey: NSString;
function NSStringEncodingDetectionFromWindowsKey: NSString;
function NSStringEncodingDetectionLossySubstitutionKey: NSString;
function NSStringEncodingDetectionLikelyLanguageKey: NSString;
function NSCharacterConversionException: NSString;
function NSParseErrorException: NSString;
function _NSConstantStringClassReference: Pointer;
function NSProgressEstimatedTimeRemainingKey: NSString;
function NSProgressThroughputKey: NSString;
function NSProgressKindFile: NSString;
function NSProgressFileOperationKindKey: NSString;
function NSProgressFileOperationKindDownloading: NSString;
function NSProgressFileOperationKindDecompressingAfterDownloading: NSString;
function NSProgressFileOperationKindReceiving: NSString;
function NSProgressFileOperationKindCopying: NSString;
function NSProgressFileURLKey: NSString;
function NSProgressFileTotalCountKey: NSString;
function NSProgressFileCompletedCountKey: NSString;
function NSProgressFileAnimationImageKey: NSString;
function NSProgressFileAnimationImageOriginalRectKey: NSString;
function NSProgressFileIconKey: NSString;
function NSBundleDidLoadNotification: NSString;
function NSLoadedClasses: NSString;
function NSBundleResourceRequestLowDiskSpaceNotification: NSString;
function NSBundleResourceRequestLoadingPriorityUrgent: Pointer;
function NSSystemClockDidChangeNotification: NSString;
function NSCalendarIdentifierGregorian: NSString;
function NSCalendarIdentifierBuddhist: NSString;
function NSCalendarIdentifierChinese: NSString;
function NSCalendarIdentifierCoptic: NSString;
function NSCalendarIdentifierEthiopicAmeteMihret: NSString;
function NSCalendarIdentifierEthiopicAmeteAlem: NSString;
function NSCalendarIdentifierHebrew: NSString;
function NSCalendarIdentifierISO8601: NSString;
function NSCalendarIdentifierIndian: NSString;
function NSCalendarIdentifierIslamic: NSString;
function NSCalendarIdentifierIslamicCivil: NSString;
function NSCalendarIdentifierJapanese: NSString;
function NSCalendarIdentifierPersian: NSString;
function NSCalendarIdentifierRepublicOfChina: NSString;
function NSCalendarIdentifierIslamicTabular: NSString;
function NSCalendarIdentifierIslamicUmmAlQura: NSString;
function NSCalendarDayChangedNotification: NSString;
function NSPersonNameComponentKey: NSString;
function NSPersonNameComponentGivenName: NSString;
function NSPersonNameComponentFamilyName: NSString;
function NSPersonNameComponentMiddleName: NSString;
function NSPersonNameComponentPrefix: NSString;
function NSPersonNameComponentSuffix: NSString;
function NSPersonNameComponentNickname: NSString;
function NSPersonNameComponentDelimiter: NSString;
function NSDecimalNumberExactnessException: NSString;
function NSDecimalNumberOverflowException: NSString;
function NSDecimalNumberUnderflowException: NSString;
function NSDecimalNumberDivideByZeroException: NSString;
function NSCocoaErrorDomain: NSString;
function NSPOSIXErrorDomain: NSString;
function NSOSStatusErrorDomain: NSString;
function NSMachErrorDomain: NSString;
function NSUnderlyingErrorKey: NSString;
function NSLocalizedDescriptionKey: NSString;
function NSLocalizedFailureReasonErrorKey: NSString;
function NSLocalizedRecoverySuggestionErrorKey: NSString;
function NSLocalizedRecoveryOptionsErrorKey: NSString;
function NSRecoveryAttempterErrorKey: NSString;
function NSHelpAnchorErrorKey: NSString;
function NSStringEncodingErrorKey: NSString;
function NSURLErrorKey: NSString;
function NSFilePathErrorKey: NSString;
function NSGenericException: NSString;
function NSRangeException: NSString;
function NSInvalidArgumentException: NSString;
function NSInternalInconsistencyException: NSString;
function NSMallocException: NSString;
function NSObjectInaccessibleException: NSString;
function NSObjectNotAvailableException: NSString;
function NSDestinationInvalidException: NSString;
function NSPortTimeoutException: NSString;
function NSInvalidSendPortException: NSString;
function NSInvalidReceivePortException: NSString;
function NSPortSendException: NSString;
function NSPortReceiveException: NSString;
function NSOldStyleException: NSString;
function NSAssertionHandlerKey: NSString;
function NSFileHandleOperationException: NSString;
function NSFileHandleReadCompletionNotification: NSString;
function NSFileHandleReadToEndOfFileCompletionNotification: NSString;
function NSFileHandleConnectionAcceptedNotification: NSString;
function NSFileHandleDataAvailableNotification: NSString;
function NSFileHandleNotificationDataItem: NSString;
function NSFileHandleNotificationFileHandleItem: NSString;
function NSFileHandleNotificationMonitorModes: NSString;
function NSFileManagerUnmountDissentingProcessIdentifierErrorKey: NSString;
function NSUbiquityIdentityDidChangeNotification: NSString;
function NSFileType: NSString;
function NSFileTypeDirectory: NSString;
function NSFileTypeRegular: NSString;
function NSFileTypeSymbolicLink: NSString;
function NSFileTypeSocket: NSString;
function NSFileTypeCharacterSpecial: NSString;
function NSFileTypeBlockSpecial: NSString;
function NSFileTypeUnknown: NSString;
function NSFileSize: NSString;
function NSFileModificationDate: NSString;
function NSFileReferenceCount: NSString;
function NSFileDeviceIdentifier: NSString;
function NSFileOwnerAccountName: NSString;
function NSFileGroupOwnerAccountName: NSString;
function NSFilePosixPermissions: NSString;
function NSFileSystemNumber: NSString;
function NSFileSystemFileNumber: NSString;
function NSFileExtensionHidden: NSString;
function NSFileHFSCreatorCode: NSString;
function NSFileHFSTypeCode: NSString;
function NSFileImmutable: NSString;
function NSFileAppendOnly: NSString;
function NSFileCreationDate: NSString;
function NSFileOwnerAccountID: NSString;
function NSFileGroupOwnerAccountID: NSString;
function NSFileBusy: NSString;
function NSFileProtectionKey: NSString;
function NSFileProtectionNone: NSString;
function NSFileProtectionComplete: NSString;
function NSFileProtectionCompleteUnlessOpen: NSString;
function NSFileProtectionCompleteUntilFirstUserAuthentication: NSString;
function NSFileSystemSize: NSString;
function NSFileSystemFreeSize: NSString;
function NSFileSystemNodes: NSString;
function NSFileSystemFreeNodes: NSString;
function NSHTTPCookieName: NSString;
function NSHTTPCookieValue: NSString;
function NSHTTPCookieOriginURL: NSString;
function NSHTTPCookieVersion: NSString;
function NSHTTPCookieDomain: NSString;
function NSHTTPCookiePath: NSString;
function NSHTTPCookieSecure: NSString;
function NSHTTPCookieExpires: NSString;
function NSHTTPCookieComment: NSString;
function NSHTTPCookieCommentURL: NSString;
function NSHTTPCookieDiscard: NSString;
function NSHTTPCookieMaximumAge: NSString;
function NSHTTPCookiePort: NSString;
function NSHTTPCookieManagerAcceptPolicyChangedNotification: NSString;
function NSHTTPCookieManagerCookiesChangedNotification: NSString;
function NSUndefinedKeyException: NSString;
function NSAverageKeyValueOperator: NSString;
function NSCountKeyValueOperator: NSString;
function NSDistinctUnionOfArraysKeyValueOperator: NSString;
function NSDistinctUnionOfObjectsKeyValueOperator: NSString;
function NSDistinctUnionOfSetsKeyValueOperator: NSString;
function NSMaximumKeyValueOperator: NSString;
function NSMinimumKeyValueOperator: NSString;
function NSSumKeyValueOperator: NSString;
function NSUnionOfArraysKeyValueOperator: NSString;
function NSUnionOfObjectsKeyValueOperator: NSString;
function NSUnionOfSetsKeyValueOperator: NSString;
function NSKeyValueChangeKindKey: NSString;
function NSKeyValueChangeNewKey: NSString;
function NSKeyValueChangeOldKey: NSString;
function NSKeyValueChangeIndexesKey: NSString;
function NSKeyValueChangeNotificationIsPriorKey: NSString;
function NSInvalidArchiveOperationException: NSString;
function NSInvalidUnarchiveOperationException: NSString;
function NSKeyedArchiveRootObjectKey: NSString;
function NSCurrentLocaleDidChangeNotification: NSString;
function NSLocaleIdentifier: NSString;
function NSLocaleLanguageCode: NSString;
function NSLocaleCountryCode: NSString;
function NSLocaleScriptCode: NSString;
function NSLocaleVariantCode: NSString;
function NSLocaleExemplarCharacterSet: NSString;
function NSLocaleCalendar: NSString;
function NSLocaleCollationIdentifier: NSString;
function NSLocaleUsesMetricSystem: NSString;
function NSLocaleMeasurementSystem: NSString;
function NSLocaleDecimalSeparator: NSString;
function NSLocaleGroupingSeparator: NSString;
function NSLocaleCurrencySymbol: NSString;
function NSLocaleCurrencyCode: NSString;
function NSLocaleCollatorIdentifier: NSString;
function NSLocaleQuotationBeginDelimiterKey: NSString;
function NSLocaleQuotationEndDelimiterKey: NSString;
function NSLocaleAlternateQuotationBeginDelimiterKey: NSString;
function NSLocaleAlternateQuotationEndDelimiterKey: NSString;
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
function NSInvocationOperationVoidResultException: NSString;
function NSInvocationOperationCancelledException: NSString;
function NSPortDidBecomeInvalidNotification: NSString;
function NSProcessInfoThermalStateDidChangeNotification: NSString;
function NSProcessInfoPowerStateDidChangeNotification: NSString;
function NSTextCheckingNameKey: NSString;
function NSTextCheckingJobTitleKey: NSString;
function NSTextCheckingOrganizationKey: NSString;
function NSTextCheckingStreetKey: NSString;
function NSTextCheckingCityKey: NSString;
function NSTextCheckingStateKey: NSString;
function NSTextCheckingZIPKey: NSString;
function NSTextCheckingCountryKey: NSString;
function NSTextCheckingPhoneKey: NSString;
function NSTextCheckingAirlineKey: NSString;
function NSTextCheckingFlightKey: NSString;
function NSDefaultRunLoopMode: NSString;
function NSRunLoopCommonModes: NSString;
function NSStreamSocketSecurityLevelKey: NSString;
function NSStreamSocketSecurityLevelNone: NSString;
function NSStreamSocketSecurityLevelSSLv2: NSString;
function NSStreamSocketSecurityLevelSSLv3: NSString;
function NSStreamSocketSecurityLevelTLSv1: NSString;
function NSStreamSocketSecurityLevelNegotiatedSSL: NSString;
function NSStreamSOCKSProxyConfigurationKey: NSString;
function NSStreamSOCKSProxyHostKey: NSString;
function NSStreamSOCKSProxyPortKey: NSString;
function NSStreamSOCKSProxyVersionKey: NSString;
function NSStreamSOCKSProxyUserKey: NSString;
function NSStreamSOCKSProxyPasswordKey: NSString;
function NSStreamSOCKSProxyVersion4: NSString;
function NSStreamSOCKSProxyVersion5: NSString;
function NSStreamDataWrittenToMemoryStreamKey: NSString;
function NSStreamFileCurrentOffsetKey: NSString;
function NSStreamSocketSSLErrorDomain: NSString;
function NSStreamSOCKSErrorDomain: NSString;
function NSStreamNetworkServiceType: NSString;
function NSStreamNetworkServiceTypeVoIP: NSString;
function NSStreamNetworkServiceTypeVideo: NSString;
function NSStreamNetworkServiceTypeBackground: NSString;
function NSStreamNetworkServiceTypeVoice: NSString;
function NSWillBecomeMultiThreadedNotification: NSString;
function NSDidBecomeSingleThreadedNotification: NSString;
function NSThreadWillExitNotification: NSString;
function NSSystemTimeZoneDidChangeNotification: NSString;
function NSURLFileScheme: NSString;
function NSURLKeysOfUnsetValuesKey: NSString;
function NSURLNameKey: NSString;
function NSURLLocalizedNameKey: NSString;
function NSURLIsRegularFileKey: NSString;
function NSURLIsDirectoryKey: NSString;
function NSURLIsSymbolicLinkKey: NSString;
function NSURLIsVolumeKey: NSString;
function NSURLIsPackageKey: NSString;
function NSURLIsApplicationKey: NSString;
function NSURLApplicationIsScriptableKey: NSString;
function NSURLIsSystemImmutableKey: NSString;
function NSURLIsUserImmutableKey: NSString;
function NSURLIsHiddenKey: NSString;
function NSURLHasHiddenExtensionKey: NSString;
function NSURLCreationDateKey: NSString;
function NSURLContentAccessDateKey: NSString;
function NSURLContentModificationDateKey: NSString;
function NSURLAttributeModificationDateKey: NSString;
function NSURLLinkCountKey: NSString;
function NSURLParentDirectoryURLKey: NSString;
function NSURLVolumeURLKey: NSString;
function NSURLTypeIdentifierKey: NSString;
function NSURLLocalizedTypeDescriptionKey: NSString;
function NSURLLabelNumberKey: NSString;
function NSURLLabelColorKey: NSString;
function NSURLLocalizedLabelKey: NSString;
function NSURLEffectiveIconKey: NSString;
function NSURLCustomIconKey: NSString;
function NSURLFileResourceIdentifierKey: NSString;
function NSURLVolumeIdentifierKey: NSString;
function NSURLPreferredIOBlockSizeKey: NSString;
function NSURLIsReadableKey: NSString;
function NSURLIsWritableKey: NSString;
function NSURLIsExecutableKey: NSString;
function NSURLFileSecurityKey: NSString;
function NSURLIsExcludedFromBackupKey: NSString;
function NSURLTagNamesKey: NSString;
function NSURLPathKey: NSString;
function NSURLIsMountTriggerKey: NSString;
function NSURLGenerationIdentifierKey: NSString;
function NSURLDocumentIdentifierKey: NSString;
function NSURLAddedToDirectoryDateKey: NSString;
function NSURLQuarantinePropertiesKey: NSString;
function NSURLFileResourceTypeKey: NSString;
function NSURLFileResourceTypeNamedPipe: NSString;
function NSURLFileResourceTypeCharacterSpecial: NSString;
function NSURLFileResourceTypeDirectory: NSString;
function NSURLFileResourceTypeBlockSpecial: NSString;
function NSURLFileResourceTypeRegular: NSString;
function NSURLFileResourceTypeSymbolicLink: NSString;
function NSURLFileResourceTypeSocket: NSString;
function NSURLFileResourceTypeUnknown: NSString;
function NSURLThumbnailDictionaryKey: NSString;
function NSURLThumbnailKey: NSString;
function NSThumbnail1024x1024SizeKey: NSString;
function NSURLFileSizeKey: NSString;
function NSURLFileAllocatedSizeKey: NSString;
function NSURLTotalFileSizeKey: NSString;
function NSURLTotalFileAllocatedSizeKey: NSString;
function NSURLIsAliasFileKey: NSString;
function NSURLFileProtectionKey: NSString;
function NSURLFileProtectionNone: NSString;
function NSURLFileProtectionComplete: NSString;
function NSURLFileProtectionCompleteUnlessOpen: NSString;
function NSURLFileProtectionCompleteUntilFirstUserAuthentication: NSString;
function NSURLVolumeLocalizedFormatDescriptionKey: NSString;
function NSURLVolumeTotalCapacityKey: NSString;
function NSURLVolumeAvailableCapacityKey: NSString;
function NSURLVolumeResourceCountKey: NSString;
function NSURLVolumeSupportsPersistentIDsKey: NSString;
function NSURLVolumeSupportsSymbolicLinksKey: NSString;
function NSURLVolumeSupportsHardLinksKey: NSString;
function NSURLVolumeSupportsJournalingKey: NSString;
function NSURLVolumeIsJournalingKey: NSString;
function NSURLVolumeSupportsSparseFilesKey: NSString;
function NSURLVolumeSupportsZeroRunsKey: NSString;
function NSURLVolumeSupportsCaseSensitiveNamesKey: NSString;
function NSURLVolumeSupportsCasePreservedNamesKey: NSString;
function NSURLVolumeSupportsRootDirectoryDatesKey: NSString;
function NSURLVolumeSupportsVolumeSizesKey: NSString;
function NSURLVolumeSupportsRenamingKey: NSString;
function NSURLVolumeSupportsAdvisoryFileLockingKey: NSString;
function NSURLVolumeSupportsExtendedSecurityKey: NSString;
function NSURLVolumeIsBrowsableKey: NSString;
function NSURLVolumeMaximumFileSizeKey: NSString;
function NSURLVolumeIsEjectableKey: NSString;
function NSURLVolumeIsRemovableKey: NSString;
function NSURLVolumeIsInternalKey: NSString;
function NSURLVolumeIsAutomountedKey: NSString;
function NSURLVolumeIsLocalKey: NSString;
function NSURLVolumeIsReadOnlyKey: NSString;
function NSURLVolumeCreationDateKey: NSString;
function NSURLVolumeURLForRemountingKey: NSString;
function NSURLVolumeUUIDStringKey: NSString;
function NSURLVolumeNameKey: NSString;
function NSURLVolumeLocalizedNameKey: NSString;
function NSURLIsUbiquitousItemKey: NSString;
function NSURLUbiquitousItemHasUnresolvedConflictsKey: NSString;
function NSURLUbiquitousItemIsDownloadedKey: NSString;
function NSURLUbiquitousItemIsDownloadingKey: NSString;
function NSURLUbiquitousItemIsUploadedKey: NSString;
function NSURLUbiquitousItemIsUploadingKey: NSString;
function NSURLUbiquitousItemPercentDownloadedKey: NSString;
function NSURLUbiquitousItemPercentUploadedKey: NSString;
function NSURLUbiquitousItemDownloadingStatusKey: NSString;
function NSURLUbiquitousItemDownloadingErrorKey: NSString;
function NSURLUbiquitousItemUploadingErrorKey: NSString;
function NSURLUbiquitousItemDownloadRequestedKey: NSString;
function NSURLUbiquitousItemContainerDisplayNameKey: NSString;
function NSURLUbiquitousItemDownloadingStatusNotDownloaded: NSString;
function NSURLUbiquitousItemDownloadingStatusDownloaded: NSString;
function NSURLUbiquitousItemDownloadingStatusCurrent: NSString;
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
function NSURLCredentialStorageChangedNotification: NSString;
function NSURLCredentialStorageRemoveSynchronizableCredentials: NSString;
function NSURLErrorDomain: NSString;
function NSURLErrorFailingURLErrorKey: NSString;
function NSURLErrorFailingURLStringErrorKey: NSString;
function NSErrorFailingURLStringKey: NSString;
function NSURLErrorFailingURLPeerTrustErrorKey: NSString;
function NSURLErrorBackgroundTaskCancelledReasonKey: NSString;
function NSGlobalDomain: NSString;
function NSArgumentDomain: NSString;
function NSRegistrationDomain: NSString;
function NSUserDefaultsSizeLimitExceededNotification: NSString;
function NSUbiquitousUserDefaultsDidChangeAccountsNotification: NSString;
function NSUbiquitousUserDefaultsCompletedInitialSyncNotification: NSString;
function NSUserDefaultsDidChangeNotification: NSString;
function NSNegateBooleanTransformerName: NSString;
function NSIsNilTransformerName: NSString;
function NSIsNotNilTransformerName: NSString;
function NSUnarchiveFromDataTransformerName: NSString;
function NSKeyedUnarchiveFromDataTransformerName: NSString;
function NSXMLParserErrorDomain: NSString;
function NSExtensionItemsAndErrorsKey: NSString;
function NSExtensionHostWillEnterForegroundNotification: NSString;
function NSExtensionHostDidEnterBackgroundNotification: NSString;
function NSExtensionHostWillResignActiveNotification: NSString;
function NSExtensionHostDidBecomeActiveNotification: NSString;
function NSItemProviderPreferredImageSizeKey: NSString;
function NSExtensionJavaScriptPreprocessingResultsKey: NSString;
function NSExtensionJavaScriptFinalizeArgumentKey: NSString;
function NSItemProviderErrorDomain: NSString;
function NSExtensionItemAttributedTitleKey: NSString;
function NSExtensionItemAttributedContentTextKey: NSString;
function NSExtensionItemAttachmentsKey: NSString;
function NSLinguisticTagSchemeTokenType: NSString;
function NSLinguisticTagSchemeLexicalClass: NSString;
function NSLinguisticTagSchemeNameType: NSString;
function NSLinguisticTagSchemeNameTypeOrLexicalClass: NSString;
function NSLinguisticTagSchemeLemma: NSString;
function NSLinguisticTagSchemeLanguage: NSString;
function NSLinguisticTagSchemeScript: NSString;
function NSLinguisticTagWord: NSString;
function NSLinguisticTagPunctuation: NSString;
function NSLinguisticTagWhitespace: NSString;
function NSLinguisticTagOther: NSString;
function NSLinguisticTagNoun: NSString;
function NSLinguisticTagVerb: NSString;
function NSLinguisticTagAdjective: NSString;
function NSLinguisticTagAdverb: NSString;
function NSLinguisticTagPronoun: NSString;
function NSLinguisticTagDeterminer: NSString;
function NSLinguisticTagParticle: NSString;
function NSLinguisticTagPreposition: NSString;
function NSLinguisticTagNumber: NSString;
function NSLinguisticTagConjunction: NSString;
function NSLinguisticTagInterjection: NSString;
function NSLinguisticTagClassifier: NSString;
function NSLinguisticTagIdiom: NSString;
function NSLinguisticTagOtherWord: NSString;
function NSLinguisticTagSentenceTerminator: NSString;
function NSLinguisticTagOpenQuote: NSString;
function NSLinguisticTagCloseQuote: NSString;
function NSLinguisticTagOpenParenthesis: NSString;
function NSLinguisticTagCloseParenthesis: NSString;
function NSLinguisticTagWordJoiner: NSString;
function NSLinguisticTagDash: NSString;
function NSLinguisticTagOtherPunctuation: NSString;
function NSLinguisticTagParagraphBreak: NSString;
function NSLinguisticTagOtherWhitespace: NSString;
function NSLinguisticTagPersonalName: NSString;
function NSLinguisticTagPlaceName: NSString;
function NSLinguisticTagOrganizationName: NSString;
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
function NSMetadataQueryDidStartGatheringNotification: NSString;
function NSMetadataQueryGatheringProgressNotification: NSString;
function NSMetadataQueryDidFinishGatheringNotification: NSString;
function NSMetadataQueryDidUpdateNotification: NSString;
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
function NSNetServicesErrorDomain: NSString;
function NSUbiquitousKeyValueStoreDidChangeExternallyNotification: NSString;
function NSUbiquitousKeyValueStoreChangeReasonKey: NSString;
function NSUbiquitousKeyValueStoreChangedKeysKey: NSString;
function NSUndoManagerGroupIsDiscardableKey: NSString;
function NSUndoManagerCheckpointNotification: NSString;
function NSUndoManagerWillUndoChangeNotification: NSString;
function NSUndoManagerWillRedoChangeNotification: NSString;
function NSUndoManagerDidUndoChangeNotification: NSString;
function NSUndoManagerDidRedoChangeNotification: NSString;
function NSUndoManagerDidOpenUndoGroupNotification: NSString;
function NSUndoManagerWillCloseUndoGroupNotification: NSString;
function NSUndoManagerDidCloseUndoGroupNotification: NSString;
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
function NSDecimalIsNotANumber(dcm: Pointer): Boolean; cdecl;
  external libFoundation name _PU + 'NSDecimalIsNotANumber';
procedure NSDecimalCopy(destination: Pointer; source: Pointer); cdecl;
  external libFoundation name _PU + 'NSDecimalCopy';
procedure NSDecimalCompact(number: Pointer); cdecl;
  external libFoundation name _PU + 'NSDecimalCompact';
function NSDecimalCompare(leftOperand: Pointer; rightOperand: Pointer)
  : NSComparisonResult; cdecl;
  external libFoundation name _PU + 'NSDecimalCompare';
procedure NSDecimalRound(result: Pointer; number: Pointer; scale: NSInteger;
  roundingMode: NSRoundingMode); cdecl;
  external libFoundation name _PU + 'NSDecimalRound';
function NSDecimalNormalize(number1: Pointer; number2: Pointer;
  roundingMode: NSRoundingMode): NSCalculationError; cdecl;
  external libFoundation name _PU + 'NSDecimalNormalize';
function NSDecimalAdd(result: Pointer; leftOperand: Pointer;
  rightOperand: Pointer; roundingMode: NSRoundingMode): NSCalculationError;
  cdecl; external libFoundation name _PU + 'NSDecimalAdd';
function NSDecimalSubtract(result: Pointer; leftOperand: Pointer;
  rightOperand: Pointer; roundingMode: NSRoundingMode): NSCalculationError;
  cdecl; external libFoundation name _PU + 'NSDecimalSubtract';
function NSDecimalMultiply(result: Pointer; leftOperand: Pointer;
  rightOperand: Pointer; roundingMode: NSRoundingMode): NSCalculationError;
  cdecl; external libFoundation name _PU + 'NSDecimalMultiply';
function NSDecimalDivide(result: Pointer; leftOperand: Pointer;
  rightOperand: Pointer; roundingMode: NSRoundingMode): NSCalculationError;
  cdecl; external libFoundation name _PU + 'NSDecimalDivide';
function NSDecimalPower(result: Pointer; number: Pointer; power: NSUInteger;
  roundingMode: NSRoundingMode): NSCalculationError; cdecl;
  external libFoundation name _PU + 'NSDecimalPower';
function NSDecimalMultiplyByPowerOf10(result: Pointer; number: Pointer;
  power: SmallInt; roundingMode: NSRoundingMode): NSCalculationError; cdecl;
  external libFoundation name _PU + 'NSDecimalMultiplyByPowerOf10';
function NSDecimalString(dcm: Pointer; locale: Pointer): Pointer { NSString };
  cdecl; external libFoundation name _PU + 'NSDecimalString';
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
function NSHomeDirectoryForUser(username: Pointer { NSString } )
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

function NSStringTransformLatinToKatakana: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringTransformLatinToKatakana');
end;

function NSStringTransformLatinToHiragana: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringTransformLatinToHiragana');
end;

function NSStringTransformLatinToHangul: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStringTransformLatinToHangul');
end;

function NSStringTransformLatinToArabic: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStringTransformLatinToArabic');
end;

function NSStringTransformLatinToHebrew: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStringTransformLatinToHebrew');
end;

function NSStringTransformLatinToThai: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStringTransformLatinToThai');
end;

function NSStringTransformLatinToCyrillic: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringTransformLatinToCyrillic');
end;

function NSStringTransformLatinToGreek: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStringTransformLatinToGreek');
end;

function NSStringTransformToLatin: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStringTransformToLatin');
end;

function NSStringTransformMandarinToLatin: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringTransformMandarinToLatin');
end;

function NSStringTransformHiraganaToKatakana: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringTransformHiraganaToKatakana');
end;

function NSStringTransformFullwidthToHalfwidth: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringTransformFullwidthToHalfwidth');
end;

function NSStringTransformToXMLHex: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStringTransformToXMLHex');
end;

function NSStringTransformToUnicodeName: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStringTransformToUnicodeName');
end;

function NSStringTransformStripCombiningMarks: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringTransformStripCombiningMarks');
end;

function NSStringTransformStripDiacritics: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringTransformStripDiacritics');
end;

function NSStringEncodingDetectionSuggestedEncodingsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringEncodingDetectionSuggestedEncodingsKey');
end;

function NSStringEncodingDetectionDisallowedEncodingsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringEncodingDetectionDisallowedEncodingsKey');
end;

function NSStringEncodingDetectionUseOnlySuggestedEncodingsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringEncodingDetectionUseOnlySuggestedEncodingsKey');
end;

function NSStringEncodingDetectionAllowLossyKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringEncodingDetectionAllowLossyKey');
end;

function NSStringEncodingDetectionFromWindowsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringEncodingDetectionFromWindowsKey');
end;

function NSStringEncodingDetectionLossySubstitutionKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringEncodingDetectionLossySubstitutionKey');
end;

function NSStringEncodingDetectionLikelyLanguageKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStringEncodingDetectionLikelyLanguageKey');
end;

function NSCharacterConversionException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSCharacterConversionException');
end;

function NSParseErrorException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSParseErrorException');
end;

function NSProgressEstimatedTimeRemainingKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSProgressEstimatedTimeRemainingKey');
end;

function NSProgressThroughputKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSProgressThroughputKey');
end;

function NSProgressKindFile: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSProgressKindFile');
end;

function NSProgressFileOperationKindKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSProgressFileOperationKindKey');
end;

function NSProgressFileOperationKindDownloading: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSProgressFileOperationKindDownloading');
end;

function NSProgressFileOperationKindDecompressingAfterDownloading: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSProgressFileOperationKindDecompressingAfterDownloading');
end;

function NSProgressFileOperationKindReceiving: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSProgressFileOperationKindReceiving');
end;

function NSProgressFileOperationKindCopying: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSProgressFileOperationKindCopying');
end;

function NSProgressFileURLKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSProgressFileURLKey');
end;

function NSProgressFileTotalCountKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSProgressFileTotalCountKey');
end;

function NSProgressFileCompletedCountKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSProgressFileCompletedCountKey');
end;

function NSProgressFileAnimationImageKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSProgressFileAnimationImageKey');
end;

function NSProgressFileAnimationImageOriginalRectKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSProgressFileAnimationImageOriginalRectKey');
end;

function NSProgressFileIconKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSProgressFileIconKey');
end;

function NSBundleDidLoadNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSBundleDidLoadNotification');
end;

function NSLoadedClasses: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLoadedClasses');
end;

function NSBundleResourceRequestLowDiskSpaceNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSBundleResourceRequestLowDiskSpaceNotification');
end;

function NSSystemClockDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSSystemClockDidChangeNotification');
end;

function NSCalendarIdentifierGregorian: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSCalendarIdentifierGregorian');
end;

function NSCalendarIdentifierBuddhist: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSCalendarIdentifierBuddhist');
end;

function NSCalendarIdentifierChinese: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSCalendarIdentifierChinese');
end;

function NSCalendarIdentifierCoptic: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSCalendarIdentifierCoptic');
end;

function NSCalendarIdentifierEthiopicAmeteMihret: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSCalendarIdentifierEthiopicAmeteMihret');
end;

function NSCalendarIdentifierEthiopicAmeteAlem: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSCalendarIdentifierEthiopicAmeteAlem');
end;

function NSCalendarIdentifierHebrew: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSCalendarIdentifierHebrew');
end;

function NSCalendarIdentifierISO8601: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSCalendarIdentifierISO8601');
end;

function NSCalendarIdentifierIndian: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSCalendarIdentifierIndian');
end;

function NSCalendarIdentifierIslamic: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSCalendarIdentifierIslamic');
end;

function NSCalendarIdentifierIslamicCivil: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSCalendarIdentifierIslamicCivil');
end;

function NSCalendarIdentifierJapanese: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSCalendarIdentifierJapanese');
end;

function NSCalendarIdentifierPersian: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSCalendarIdentifierPersian');
end;

function NSCalendarIdentifierRepublicOfChina: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSCalendarIdentifierRepublicOfChina');
end;

function NSCalendarIdentifierIslamicTabular: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSCalendarIdentifierIslamicTabular');
end;

function NSCalendarIdentifierIslamicUmmAlQura: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSCalendarIdentifierIslamicUmmAlQura');
end;

function NSCalendarDayChangedNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSCalendarDayChangedNotification');
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

function NSDecimalNumberExactnessException: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSDecimalNumberExactnessException');
end;

function NSDecimalNumberOverflowException: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSDecimalNumberOverflowException');
end;

function NSDecimalNumberUnderflowException: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSDecimalNumberUnderflowException');
end;

function NSDecimalNumberDivideByZeroException: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSDecimalNumberDivideByZeroException');
end;

function NSCocoaErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSCocoaErrorDomain');
end;

function NSPOSIXErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSPOSIXErrorDomain');
end;

function NSOSStatusErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSOSStatusErrorDomain');
end;

function NSMachErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMachErrorDomain');
end;

function NSUnderlyingErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSUnderlyingErrorKey');
end;

function NSLocalizedDescriptionKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocalizedDescriptionKey');
end;

function NSLocalizedFailureReasonErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSLocalizedFailureReasonErrorKey');
end;

function NSLocalizedRecoverySuggestionErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSLocalizedRecoverySuggestionErrorKey');
end;

function NSLocalizedRecoveryOptionsErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSLocalizedRecoveryOptionsErrorKey');
end;

function NSRecoveryAttempterErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSRecoveryAttempterErrorKey');
end;

function NSHelpAnchorErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHelpAnchorErrorKey');
end;

function NSStringEncodingErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStringEncodingErrorKey');
end;

function NSURLErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLErrorKey');
end;

function NSFilePathErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFilePathErrorKey');
end;

function NSGenericException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSGenericException');
end;

function NSRangeException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSRangeException');
end;

function NSInvalidArgumentException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSInvalidArgumentException');
end;

function NSInternalInconsistencyException: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSInternalInconsistencyException');
end;

function NSMallocException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMallocException');
end;

function NSObjectInaccessibleException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSObjectInaccessibleException');
end;

function NSObjectNotAvailableException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSObjectNotAvailableException');
end;

function NSDestinationInvalidException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSDestinationInvalidException');
end;

function NSPortTimeoutException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSPortTimeoutException');
end;

function NSInvalidSendPortException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSInvalidSendPortException');
end;

function NSInvalidReceivePortException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSInvalidReceivePortException');
end;

function NSPortSendException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSPortSendException');
end;

function NSPortReceiveException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSPortReceiveException');
end;

function NSOldStyleException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSOldStyleException');
end;

function NSAssertionHandlerKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSAssertionHandlerKey');
end;

function NSFileHandleOperationException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileHandleOperationException');
end;

function NSFileHandleReadCompletionNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSFileHandleReadCompletionNotification');
end;

function NSFileHandleReadToEndOfFileCompletionNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSFileHandleReadToEndOfFileCompletionNotification');
end;

function NSFileHandleConnectionAcceptedNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSFileHandleConnectionAcceptedNotification');
end;

function NSFileHandleDataAvailableNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSFileHandleDataAvailableNotification');
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

function NSFileManagerUnmountDissentingProcessIdentifierErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSFileManagerUnmountDissentingProcessIdentifierErrorKey');
end;

function NSUbiquityIdentityDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUbiquityIdentityDidChangeNotification');
end;

function NSFileType: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileType');
end;

function NSFileTypeDirectory: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileTypeDirectory');
end;

function NSFileTypeRegular: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileTypeRegular');
end;

function NSFileTypeSymbolicLink: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileTypeSymbolicLink');
end;

function NSFileTypeSocket: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileTypeSocket');
end;

function NSFileTypeCharacterSpecial: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileTypeCharacterSpecial');
end;

function NSFileTypeBlockSpecial: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileTypeBlockSpecial');
end;

function NSFileTypeUnknown: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileTypeUnknown');
end;

function NSFileSize: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileSize');
end;

function NSFileModificationDate: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileModificationDate');
end;

function NSFileReferenceCount: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileReferenceCount');
end;

function NSFileDeviceIdentifier: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileDeviceIdentifier');
end;

function NSFileOwnerAccountName: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileOwnerAccountName');
end;

function NSFileGroupOwnerAccountName: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileGroupOwnerAccountName');
end;

function NSFilePosixPermissions: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFilePosixPermissions');
end;

function NSFileSystemNumber: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileSystemNumber');
end;

function NSFileSystemFileNumber: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileSystemFileNumber');
end;

function NSFileExtensionHidden: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileExtensionHidden');
end;

function NSFileHFSCreatorCode: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileHFSCreatorCode');
end;

function NSFileHFSTypeCode: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileHFSTypeCode');
end;

function NSFileImmutable: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileImmutable');
end;

function NSFileAppendOnly: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileAppendOnly');
end;

function NSFileCreationDate: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileCreationDate');
end;

function NSFileOwnerAccountID: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileOwnerAccountID');
end;

function NSFileGroupOwnerAccountID: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileGroupOwnerAccountID');
end;

function NSFileBusy: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileBusy');
end;

function NSFileProtectionKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileProtectionKey');
end;

function NSFileProtectionNone: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileProtectionNone');
end;

function NSFileProtectionComplete: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileProtectionComplete');
end;

function NSFileProtectionCompleteUnlessOpen: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSFileProtectionCompleteUnlessOpen');
end;

function NSFileProtectionCompleteUntilFirstUserAuthentication: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSFileProtectionCompleteUntilFirstUserAuthentication');
end;

function NSFileSystemSize: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileSystemSize');
end;

function NSFileSystemFreeSize: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileSystemFreeSize');
end;

function NSFileSystemNodes: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileSystemNodes');
end;

function NSFileSystemFreeNodes: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSFileSystemFreeNodes');
end;

function NSHTTPCookieName: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHTTPCookieName');
end;

function NSHTTPCookieValue: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHTTPCookieValue');
end;

function NSHTTPCookieOriginURL: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHTTPCookieOriginURL');
end;

function NSHTTPCookieVersion: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHTTPCookieVersion');
end;

function NSHTTPCookieDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHTTPCookieDomain');
end;

function NSHTTPCookiePath: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHTTPCookiePath');
end;

function NSHTTPCookieSecure: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHTTPCookieSecure');
end;

function NSHTTPCookieExpires: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHTTPCookieExpires');
end;

function NSHTTPCookieComment: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHTTPCookieComment');
end;

function NSHTTPCookieCommentURL: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHTTPCookieCommentURL');
end;

function NSHTTPCookieDiscard: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHTTPCookieDiscard');
end;

function NSHTTPCookieMaximumAge: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHTTPCookieMaximumAge');
end;

function NSHTTPCookiePort: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSHTTPCookiePort');
end;

function NSHTTPCookieManagerAcceptPolicyChangedNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSHTTPCookieManagerAcceptPolicyChangedNotification');
end;

function NSHTTPCookieManagerCookiesChangedNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSHTTPCookieManagerCookiesChangedNotification');
end;

function NSUndefinedKeyException: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSUndefinedKeyException');
end;

function NSAverageKeyValueOperator: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSAverageKeyValueOperator');
end;

function NSCountKeyValueOperator: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSCountKeyValueOperator');
end;

function NSDistinctUnionOfArraysKeyValueOperator: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSDistinctUnionOfArraysKeyValueOperator');
end;

function NSDistinctUnionOfObjectsKeyValueOperator: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSDistinctUnionOfObjectsKeyValueOperator');
end;

function NSDistinctUnionOfSetsKeyValueOperator: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSDistinctUnionOfSetsKeyValueOperator');
end;

function NSMaximumKeyValueOperator: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMaximumKeyValueOperator');
end;

function NSMinimumKeyValueOperator: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSMinimumKeyValueOperator');
end;

function NSSumKeyValueOperator: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSSumKeyValueOperator');
end;

function NSUnionOfArraysKeyValueOperator: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUnionOfArraysKeyValueOperator');
end;

function NSUnionOfObjectsKeyValueOperator: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUnionOfObjectsKeyValueOperator');
end;

function NSUnionOfSetsKeyValueOperator: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSUnionOfSetsKeyValueOperator');
end;

function NSKeyValueChangeKindKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSKeyValueChangeKindKey');
end;

function NSKeyValueChangeNewKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSKeyValueChangeNewKey');
end;

function NSKeyValueChangeOldKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSKeyValueChangeOldKey');
end;

function NSKeyValueChangeIndexesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSKeyValueChangeIndexesKey');
end;

function NSKeyValueChangeNotificationIsPriorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSKeyValueChangeNotificationIsPriorKey');
end;

function NSInvalidArchiveOperationException: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSInvalidArchiveOperationException');
end;

function NSInvalidUnarchiveOperationException: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSInvalidUnarchiveOperationException');
end;

function NSKeyedArchiveRootObjectKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSKeyedArchiveRootObjectKey');
end;

function NSCurrentLocaleDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSCurrentLocaleDidChangeNotification');
end;

function NSLocaleIdentifier: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleIdentifier');
end;

function NSLocaleLanguageCode: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleLanguageCode');
end;

function NSLocaleCountryCode: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleCountryCode');
end;

function NSLocaleScriptCode: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleScriptCode');
end;

function NSLocaleVariantCode: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleVariantCode');
end;

function NSLocaleExemplarCharacterSet: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleExemplarCharacterSet');
end;

function NSLocaleCalendar: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleCalendar');
end;

function NSLocaleCollationIdentifier: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleCollationIdentifier');
end;

function NSLocaleUsesMetricSystem: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleUsesMetricSystem');
end;

function NSLocaleMeasurementSystem: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleMeasurementSystem');
end;

function NSLocaleDecimalSeparator: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleDecimalSeparator');
end;

function NSLocaleGroupingSeparator: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleGroupingSeparator');
end;

function NSLocaleCurrencySymbol: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleCurrencySymbol');
end;

function NSLocaleCurrencyCode: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleCurrencyCode');
end;

function NSLocaleCollatorIdentifier: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLocaleCollatorIdentifier');
end;

function NSLocaleQuotationBeginDelimiterKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSLocaleQuotationBeginDelimiterKey');
end;

function NSLocaleQuotationEndDelimiterKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSLocaleQuotationEndDelimiterKey');
end;

function NSLocaleAlternateQuotationBeginDelimiterKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSLocaleAlternateQuotationBeginDelimiterKey');
end;

function NSLocaleAlternateQuotationEndDelimiterKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSLocaleAlternateQuotationEndDelimiterKey');
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

function NSInvocationOperationVoidResultException: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSInvocationOperationVoidResultException');
end;

function NSInvocationOperationCancelledException: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSInvocationOperationCancelledException');
end;

function NSPortDidBecomeInvalidNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSPortDidBecomeInvalidNotification');
end;

function NSProcessInfoThermalStateDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSProcessInfoThermalStateDidChangeNotification');
end;

function NSProcessInfoPowerStateDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSProcessInfoPowerStateDidChangeNotification');
end;

function NSTextCheckingNameKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSTextCheckingNameKey');
end;

function NSTextCheckingJobTitleKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSTextCheckingJobTitleKey');
end;

function NSTextCheckingOrganizationKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSTextCheckingOrganizationKey');
end;

function NSTextCheckingStreetKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSTextCheckingStreetKey');
end;

function NSTextCheckingCityKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSTextCheckingCityKey');
end;

function NSTextCheckingStateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSTextCheckingStateKey');
end;

function NSTextCheckingZIPKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSTextCheckingZIPKey');
end;

function NSTextCheckingCountryKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSTextCheckingCountryKey');
end;

function NSTextCheckingPhoneKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSTextCheckingPhoneKey');
end;

function NSTextCheckingAirlineKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSTextCheckingAirlineKey');
end;

function NSTextCheckingFlightKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSTextCheckingFlightKey');
end;

function NSDefaultRunLoopMode: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSDefaultRunLoopMode');
end;

function NSRunLoopCommonModes: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSRunLoopCommonModes');
end;

function NSStreamSocketSecurityLevelKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStreamSocketSecurityLevelKey');
end;

function NSStreamSocketSecurityLevelNone: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStreamSocketSecurityLevelNone');
end;

function NSStreamSocketSecurityLevelSSLv2: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStreamSocketSecurityLevelSSLv2');
end;

function NSStreamSocketSecurityLevelSSLv3: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStreamSocketSecurityLevelSSLv3');
end;

function NSStreamSocketSecurityLevelTLSv1: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStreamSocketSecurityLevelTLSv1');
end;

function NSStreamSocketSecurityLevelNegotiatedSSL: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStreamSocketSecurityLevelNegotiatedSSL');
end;

function NSStreamSOCKSProxyConfigurationKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStreamSOCKSProxyConfigurationKey');
end;

function NSStreamSOCKSProxyHostKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStreamSOCKSProxyHostKey');
end;

function NSStreamSOCKSProxyPortKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStreamSOCKSProxyPortKey');
end;

function NSStreamSOCKSProxyVersionKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStreamSOCKSProxyVersionKey');
end;

function NSStreamSOCKSProxyUserKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStreamSOCKSProxyUserKey');
end;

function NSStreamSOCKSProxyPasswordKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStreamSOCKSProxyPasswordKey');
end;

function NSStreamSOCKSProxyVersion4: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStreamSOCKSProxyVersion4');
end;

function NSStreamSOCKSProxyVersion5: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStreamSOCKSProxyVersion5');
end;

function NSStreamDataWrittenToMemoryStreamKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStreamDataWrittenToMemoryStreamKey');
end;

function NSStreamFileCurrentOffsetKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStreamFileCurrentOffsetKey');
end;

function NSStreamSocketSSLErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStreamSocketSSLErrorDomain');
end;

function NSStreamSOCKSErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStreamSOCKSErrorDomain');
end;

function NSStreamNetworkServiceType: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStreamNetworkServiceType');
end;

function NSStreamNetworkServiceTypeVoIP: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSStreamNetworkServiceTypeVoIP');
end;

function NSStreamNetworkServiceTypeVideo: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStreamNetworkServiceTypeVideo');
end;

function NSStreamNetworkServiceTypeBackground: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStreamNetworkServiceTypeBackground');
end;

function NSStreamNetworkServiceTypeVoice: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSStreamNetworkServiceTypeVoice');
end;

function NSWillBecomeMultiThreadedNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSWillBecomeMultiThreadedNotification');
end;

function NSDidBecomeSingleThreadedNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSDidBecomeSingleThreadedNotification');
end;

function NSThreadWillExitNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSThreadWillExitNotification');
end;

function NSSystemTimeZoneDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSSystemTimeZoneDidChangeNotification');
end;

function NSURLFileScheme: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileScheme');
end;

function NSURLKeysOfUnsetValuesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLKeysOfUnsetValuesKey');
end;

function NSURLNameKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLNameKey');
end;

function NSURLLocalizedNameKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLLocalizedNameKey');
end;

function NSURLIsRegularFileKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsRegularFileKey');
end;

function NSURLIsDirectoryKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsDirectoryKey');
end;

function NSURLIsSymbolicLinkKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsSymbolicLinkKey');
end;

function NSURLIsVolumeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsVolumeKey');
end;

function NSURLIsPackageKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsPackageKey');
end;

function NSURLIsApplicationKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsApplicationKey');
end;

function NSURLApplicationIsScriptableKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLApplicationIsScriptableKey');
end;

function NSURLIsSystemImmutableKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsSystemImmutableKey');
end;

function NSURLIsUserImmutableKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsUserImmutableKey');
end;

function NSURLIsHiddenKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsHiddenKey');
end;

function NSURLHasHiddenExtensionKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLHasHiddenExtensionKey');
end;

function NSURLCreationDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLCreationDateKey');
end;

function NSURLContentAccessDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLContentAccessDateKey');
end;

function NSURLContentModificationDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLContentModificationDateKey');
end;

function NSURLAttributeModificationDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLAttributeModificationDateKey');
end;

function NSURLLinkCountKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLLinkCountKey');
end;

function NSURLParentDirectoryURLKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLParentDirectoryURLKey');
end;

function NSURLVolumeURLKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeURLKey');
end;

function NSURLTypeIdentifierKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLTypeIdentifierKey');
end;

function NSURLLocalizedTypeDescriptionKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLLocalizedTypeDescriptionKey');
end;

function NSURLLabelNumberKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLLabelNumberKey');
end;

function NSURLLabelColorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLLabelColorKey');
end;

function NSURLLocalizedLabelKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLLocalizedLabelKey');
end;

function NSURLEffectiveIconKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLEffectiveIconKey');
end;

function NSURLCustomIconKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLCustomIconKey');
end;

function NSURLFileResourceIdentifierKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileResourceIdentifierKey');
end;

function NSURLVolumeIdentifierKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeIdentifierKey');
end;

function NSURLPreferredIOBlockSizeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLPreferredIOBlockSizeKey');
end;

function NSURLIsReadableKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsReadableKey');
end;

function NSURLIsWritableKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsWritableKey');
end;

function NSURLIsExecutableKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsExecutableKey');
end;

function NSURLFileSecurityKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileSecurityKey');
end;

function NSURLIsExcludedFromBackupKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsExcludedFromBackupKey');
end;

function NSURLTagNamesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLTagNamesKey');
end;

function NSURLPathKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLPathKey');
end;

function NSURLIsMountTriggerKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsMountTriggerKey');
end;

function NSURLGenerationIdentifierKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLGenerationIdentifierKey');
end;

function NSURLDocumentIdentifierKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLDocumentIdentifierKey');
end;

function NSURLAddedToDirectoryDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLAddedToDirectoryDateKey');
end;

function NSURLQuarantinePropertiesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLQuarantinePropertiesKey');
end;

function NSURLFileResourceTypeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileResourceTypeKey');
end;

function NSURLFileResourceTypeNamedPipe: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileResourceTypeNamedPipe');
end;

function NSURLFileResourceTypeCharacterSpecial: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLFileResourceTypeCharacterSpecial');
end;

function NSURLFileResourceTypeDirectory: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileResourceTypeDirectory');
end;

function NSURLFileResourceTypeBlockSpecial: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLFileResourceTypeBlockSpecial');
end;

function NSURLFileResourceTypeRegular: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileResourceTypeRegular');
end;

function NSURLFileResourceTypeSymbolicLink: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLFileResourceTypeSymbolicLink');
end;

function NSURLFileResourceTypeSocket: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileResourceTypeSocket');
end;

function NSURLFileResourceTypeUnknown: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileResourceTypeUnknown');
end;

function NSURLThumbnailDictionaryKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLThumbnailDictionaryKey');
end;

function NSURLThumbnailKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLThumbnailKey');
end;

function NSThumbnail1024x1024SizeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSThumbnail1024x1024SizeKey');
end;

function NSURLFileSizeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileSizeKey');
end;

function NSURLFileAllocatedSizeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileAllocatedSizeKey');
end;

function NSURLTotalFileSizeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLTotalFileSizeKey');
end;

function NSURLTotalFileAllocatedSizeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLTotalFileAllocatedSizeKey');
end;

function NSURLIsAliasFileKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsAliasFileKey');
end;

function NSURLFileProtectionKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileProtectionKey');
end;

function NSURLFileProtectionNone: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileProtectionNone');
end;

function NSURLFileProtectionComplete: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLFileProtectionComplete');
end;

function NSURLFileProtectionCompleteUnlessOpen: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLFileProtectionCompleteUnlessOpen');
end;

function NSURLFileProtectionCompleteUntilFirstUserAuthentication: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLFileProtectionCompleteUntilFirstUserAuthentication');
end;

function NSURLVolumeLocalizedFormatDescriptionKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLVolumeLocalizedFormatDescriptionKey');
end;

function NSURLVolumeTotalCapacityKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeTotalCapacityKey');
end;

function NSURLVolumeAvailableCapacityKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLVolumeAvailableCapacityKey');
end;

function NSURLVolumeResourceCountKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeResourceCountKey');
end;

function NSURLVolumeSupportsPersistentIDsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLVolumeSupportsPersistentIDsKey');
end;

function NSURLVolumeSupportsSymbolicLinksKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLVolumeSupportsSymbolicLinksKey');
end;

function NSURLVolumeSupportsHardLinksKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLVolumeSupportsHardLinksKey');
end;

function NSURLVolumeSupportsJournalingKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLVolumeSupportsJournalingKey');
end;

function NSURLVolumeIsJournalingKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeIsJournalingKey');
end;

function NSURLVolumeSupportsSparseFilesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLVolumeSupportsSparseFilesKey');
end;

function NSURLVolumeSupportsZeroRunsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeSupportsZeroRunsKey');
end;

function NSURLVolumeSupportsCaseSensitiveNamesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLVolumeSupportsCaseSensitiveNamesKey');
end;

function NSURLVolumeSupportsCasePreservedNamesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLVolumeSupportsCasePreservedNamesKey');
end;

function NSURLVolumeSupportsRootDirectoryDatesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLVolumeSupportsRootDirectoryDatesKey');
end;

function NSURLVolumeSupportsVolumeSizesKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLVolumeSupportsVolumeSizesKey');
end;

function NSURLVolumeSupportsRenamingKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeSupportsRenamingKey');
end;

function NSURLVolumeSupportsAdvisoryFileLockingKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLVolumeSupportsAdvisoryFileLockingKey');
end;

function NSURLVolumeSupportsExtendedSecurityKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLVolumeSupportsExtendedSecurityKey');
end;

function NSURLVolumeIsBrowsableKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeIsBrowsableKey');
end;

function NSURLVolumeMaximumFileSizeKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeMaximumFileSizeKey');
end;

function NSURLVolumeIsEjectableKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeIsEjectableKey');
end;

function NSURLVolumeIsRemovableKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeIsRemovableKey');
end;

function NSURLVolumeIsInternalKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeIsInternalKey');
end;

function NSURLVolumeIsAutomountedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeIsAutomountedKey');
end;

function NSURLVolumeIsLocalKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeIsLocalKey');
end;

function NSURLVolumeIsReadOnlyKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeIsReadOnlyKey');
end;

function NSURLVolumeCreationDateKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeCreationDateKey');
end;

function NSURLVolumeURLForRemountingKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeURLForRemountingKey');
end;

function NSURLVolumeUUIDStringKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeUUIDStringKey');
end;

function NSURLVolumeNameKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeNameKey');
end;

function NSURLVolumeLocalizedNameKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLVolumeLocalizedNameKey');
end;

function NSURLIsUbiquitousItemKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLIsUbiquitousItemKey');
end;

function NSURLUbiquitousItemHasUnresolvedConflictsKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemHasUnresolvedConflictsKey');
end;

function NSURLUbiquitousItemIsDownloadedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemIsDownloadedKey');
end;

function NSURLUbiquitousItemIsDownloadingKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemIsDownloadingKey');
end;

function NSURLUbiquitousItemIsUploadedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemIsUploadedKey');
end;

function NSURLUbiquitousItemIsUploadingKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemIsUploadingKey');
end;

function NSURLUbiquitousItemPercentDownloadedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemPercentDownloadedKey');
end;

function NSURLUbiquitousItemPercentUploadedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemPercentUploadedKey');
end;

function NSURLUbiquitousItemDownloadingStatusKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemDownloadingStatusKey');
end;

function NSURLUbiquitousItemDownloadingErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemDownloadingErrorKey');
end;

function NSURLUbiquitousItemUploadingErrorKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemUploadingErrorKey');
end;

function NSURLUbiquitousItemDownloadRequestedKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemDownloadRequestedKey');
end;

function NSURLUbiquitousItemContainerDisplayNameKey: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemContainerDisplayNameKey');
end;

function NSURLUbiquitousItemDownloadingStatusNotDownloaded: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemDownloadingStatusNotDownloaded');
end;

function NSURLUbiquitousItemDownloadingStatusDownloaded: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemDownloadingStatusDownloaded');
end;

function NSURLUbiquitousItemDownloadingStatusCurrent: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLUbiquitousItemDownloadingStatusCurrent');
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

function NSURLCredentialStorageChangedNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLCredentialStorageChangedNotification');
end;

function NSURLCredentialStorageRemoveSynchronizableCredentials: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSURLCredentialStorageRemoveSynchronizableCredentials');
end;

function NSURLErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSURLErrorDomain');
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

function NSUserDefaultsSizeLimitExceededNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUserDefaultsSizeLimitExceededNotification');
end;

function NSUbiquitousUserDefaultsDidChangeAccountsNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUbiquitousUserDefaultsDidChangeAccountsNotification');
end;

function NSUbiquitousUserDefaultsCompletedInitialSyncNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUbiquitousUserDefaultsCompletedInitialSyncNotification');
end;

function NSUserDefaultsDidChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUserDefaultsDidChangeNotification');
end;

function NSNegateBooleanTransformerName: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSNegateBooleanTransformerName');
end;

function NSIsNilTransformerName: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSIsNilTransformerName');
end;

function NSIsNotNilTransformerName: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSIsNotNilTransformerName');
end;

function NSUnarchiveFromDataTransformerName: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUnarchiveFromDataTransformerName');
end;

function NSKeyedUnarchiveFromDataTransformerName: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSKeyedUnarchiveFromDataTransformerName');
end;

function NSXMLParserErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSXMLParserErrorDomain');
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

function NSLinguisticTagSchemeTokenType: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagSchemeTokenType');
end;

function NSLinguisticTagSchemeLexicalClass: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSLinguisticTagSchemeLexicalClass');
end;

function NSLinguisticTagSchemeNameType: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagSchemeNameType');
end;

function NSLinguisticTagSchemeNameTypeOrLexicalClass: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSLinguisticTagSchemeNameTypeOrLexicalClass');
end;

function NSLinguisticTagSchemeLemma: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagSchemeLemma');
end;

function NSLinguisticTagSchemeLanguage: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagSchemeLanguage');
end;

function NSLinguisticTagSchemeScript: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagSchemeScript');
end;

function NSLinguisticTagWord: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagWord');
end;

function NSLinguisticTagPunctuation: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagPunctuation');
end;

function NSLinguisticTagWhitespace: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagWhitespace');
end;

function NSLinguisticTagOther: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagOther');
end;

function NSLinguisticTagNoun: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagNoun');
end;

function NSLinguisticTagVerb: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagVerb');
end;

function NSLinguisticTagAdjective: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagAdjective');
end;

function NSLinguisticTagAdverb: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagAdverb');
end;

function NSLinguisticTagPronoun: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagPronoun');
end;

function NSLinguisticTagDeterminer: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagDeterminer');
end;

function NSLinguisticTagParticle: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagParticle');
end;

function NSLinguisticTagPreposition: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagPreposition');
end;

function NSLinguisticTagNumber: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagNumber');
end;

function NSLinguisticTagConjunction: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagConjunction');
end;

function NSLinguisticTagInterjection: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagInterjection');
end;

function NSLinguisticTagClassifier: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagClassifier');
end;

function NSLinguisticTagIdiom: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagIdiom');
end;

function NSLinguisticTagOtherWord: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagOtherWord');
end;

function NSLinguisticTagSentenceTerminator: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSLinguisticTagSentenceTerminator');
end;

function NSLinguisticTagOpenQuote: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagOpenQuote');
end;

function NSLinguisticTagCloseQuote: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagCloseQuote');
end;

function NSLinguisticTagOpenParenthesis: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagOpenParenthesis');
end;

function NSLinguisticTagCloseParenthesis: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSLinguisticTagCloseParenthesis');
end;

function NSLinguisticTagWordJoiner: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagWordJoiner');
end;

function NSLinguisticTagDash: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagDash');
end;

function NSLinguisticTagOtherPunctuation: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSLinguisticTagOtherPunctuation');
end;

function NSLinguisticTagParagraphBreak: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagParagraphBreak');
end;

function NSLinguisticTagOtherWhitespace: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagOtherWhitespace');
end;

function NSLinguisticTagPersonalName: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagPersonalName');
end;

function NSLinguisticTagPlaceName: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSLinguisticTagPlaceName');
end;

function NSLinguisticTagOrganizationName: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSLinguisticTagOrganizationName');
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

function NSMetadataQueryDidStartGatheringNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryDidStartGatheringNotification');
end;

function NSMetadataQueryGatheringProgressNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryGatheringProgressNotification');
end;

function NSMetadataQueryDidFinishGatheringNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryDidFinishGatheringNotification');
end;

function NSMetadataQueryDidUpdateNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSMetadataQueryDidUpdateNotification');
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

function NSNetServicesErrorDomain: NSString;
begin
  result := CocoaNSStringConst(libFoundation, 'NSNetServicesErrorDomain');
end;

function NSUbiquitousKeyValueStoreDidChangeExternallyNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUbiquitousKeyValueStoreDidChangeExternallyNotification');
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

function NSUndoManagerCheckpointNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUndoManagerCheckpointNotification');
end;

function NSUndoManagerWillUndoChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUndoManagerWillUndoChangeNotification');
end;

function NSUndoManagerWillRedoChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUndoManagerWillRedoChangeNotification');
end;

function NSUndoManagerDidUndoChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUndoManagerDidUndoChangeNotification');
end;

function NSUndoManagerDidRedoChangeNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUndoManagerDidRedoChangeNotification');
end;

function NSUndoManagerDidOpenUndoGroupNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUndoManagerDidOpenUndoGroupNotification');
end;

function NSUndoManagerWillCloseUndoGroupNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUndoManagerWillCloseUndoGroupNotification');
end;

function NSUndoManagerDidCloseUndoGroupNotification: NSString;
begin
  result := CocoaNSStringConst(libFoundation,
    'NSUndoManagerDidCloseUndoGroupNotification');
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

function _NSConstantStringClassReference: Pointer;
begin
  result := CocoaPointerConst(libFoundation, '_NSConstantStringClassReference');
end;

function NSBundleResourceRequestLoadingPriorityUrgent: Pointer;
begin
  result := CocoaPointerConst(libFoundation,
    'NSBundleResourceRequestLoadingPriorityUrgent');
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
