{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreText
//

unit iOSapi.CoreText;

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
  iOSapi.Foundation;

const
  kCTFontClassMaskShift = 28;
  kCTFontTraitItalic = (1 shl 0);
  kCTFontTraitBold = (1 shl 1);
  kCTFontTraitExpanded = (1 shl 5);
  kCTFontTraitCondensed = (1 shl 6);
  kCTFontTraitMonoSpace = (1 shl 10);
  kCTFontTraitVertical = (1 shl 11);
  kCTFontTraitUIOptimized = (1 shl 12);
  kCTFontTraitColorGlyphs = (1 shl 13);
  kCTFontTraitComposite = (1 shl 14);
  kCTFontTraitClassMask = (15 shl kCTFontClassMaskShift);
  kCTFontItalicTrait = kCTFontTraitItalic;
  kCTFontBoldTrait = kCTFontTraitBold;
  kCTFontExpandedTrait = kCTFontTraitExpanded;
  kCTFontCondensedTrait = kCTFontTraitCondensed;
  kCTFontMonoSpaceTrait = kCTFontTraitMonoSpace;
  kCTFontVerticalTrait = kCTFontTraitVertical;
  kCTFontUIOptimizedTrait = kCTFontTraitUIOptimized;
  kCTFontColorGlyphsTrait = kCTFontTraitColorGlyphs;
  kCTFontCompositeTrait = kCTFontTraitComposite;
  kCTFontClassMaskTrait = kCTFontTraitClassMask;
  kCTFontClassUnknown = (0 shl kCTFontClassMaskShift);
  kCTFontClassOldStyleSerifs = (1 shl kCTFontClassMaskShift);
  kCTFontClassTransitionalSerifs = (2 shl kCTFontClassMaskShift);
  kCTFontClassModernSerifs = (3 shl kCTFontClassMaskShift);
  kCTFontClassClarendonSerifs = (4 shl kCTFontClassMaskShift);
  kCTFontClassSlabSerifs = (5 shl kCTFontClassMaskShift);
  kCTFontClassFreeformSerifs = (7 shl kCTFontClassMaskShift);
  kCTFontClassSansSerif = (8 shl kCTFontClassMaskShift);
  kCTFontClassOrnamentals = (9 shl kCTFontClassMaskShift);
  kCTFontClassScripts = (10 shl kCTFontClassMaskShift);
  kCTFontClassSymbolic = (12 shl kCTFontClassMaskShift);
  kCTFontUnknownClass = kCTFontClassUnknown;
  kCTFontOldStyleSerifsClass = kCTFontClassOldStyleSerifs;
  kCTFontTransitionalSerifsClass = kCTFontClassTransitionalSerifs;
  kCTFontModernSerifsClass = kCTFontClassModernSerifs;
  kCTFontClarendonSerifsClass = kCTFontClassClarendonSerifs;
  kCTFontSlabSerifsClass = kCTFontClassSlabSerifs;
  kCTFontFreeformSerifsClass = kCTFontClassFreeformSerifs;
  kCTFontSansSerifClass = kCTFontClassSansSerif;
  kCTFontOrnamentalsClass = kCTFontClassOrnamentals;
  kCTFontScriptsClass = kCTFontClassScripts;
  kCTFontSymbolicClass = kCTFontClassSymbolic;
  kCTFontOrientationDefault = 0;
  kCTFontOrientationHorizontal = 1;
  kCTFontOrientationVertical = 2;
  kCTFontDefaultOrientation = kCTFontOrientationDefault;
  kCTFontHorizontalOrientation = kCTFontOrientationHorizontal;
  kCTFontVerticalOrientation = kCTFontOrientationVertical;
  kCTFontFormatUnrecognized = 0;
  kCTFontFormatOpenTypePostScript = 1;
  kCTFontFormatOpenTypeTrueType = 2;
  kCTFontFormatTrueType = 3;
  kCTFontFormatPostScript = 4;
  kCTFontFormatBitmap = 5;
  kCTFontPrioritySystem = 10000;
  kCTFontPriorityNetwork = 20000;
  kCTFontPriorityComputer = 30000;
  kCTFontPriorityUser = 40000;
  kCTFontPriorityDynamic = 50000;
  kCTFontPriorityProcess = 60000;
  kCTFontDescriptorMatchingDidBegin = 0;
  kCTFontDescriptorMatchingDidFinish = 1;
  kCTFontDescriptorMatchingWillBeginQuerying = 2;
  kCTFontDescriptorMatchingStalled = 3;
  kCTFontDescriptorMatchingWillBeginDownloading = 4;
  kCTFontDescriptorMatchingDownloading = 5;
  kCTFontDescriptorMatchingDidFinishDownloading = 6;
  kCTFontDescriptorMatchingDidMatch = 7;
  kCTFontDescriptorMatchingDidFailWithError = 8;
  kCTFontOptionsDefault = 0;
  kCTFontOptionsPreventAutoActivation = 1 shl 0;
  kCTFontOptionsPreventAutoDownload = 1 shl 1;
  kCTFontOptionsPreferSystemFont = 1 shl 2;
  kCTFontUIFontNone = LongWord(-1);
  kCTFontUIFontUser = 0;
  kCTFontUIFontUserFixedPitch = 1;
  kCTFontUIFontSystem = 2;
  kCTFontUIFontEmphasizedSystem = 3;
  kCTFontUIFontSmallSystem = 4;
  kCTFontUIFontSmallEmphasizedSystem = 5;
  kCTFontUIFontMiniSystem = 6;
  kCTFontUIFontMiniEmphasizedSystem = 7;
  kCTFontUIFontViews = 8;
  kCTFontUIFontApplication = 9;
  kCTFontUIFontLabel = 10;
  kCTFontUIFontMenuTitle = 11;
  kCTFontUIFontMenuItem = 12;
  kCTFontUIFontMenuItemMark = 13;
  kCTFontUIFontMenuItemCmdKey = 14;
  kCTFontUIFontWindowTitle = 15;
  kCTFontUIFontPushButton = 16;
  kCTFontUIFontUtilityWindowTitle = 17;
  kCTFontUIFontAlertHeader = 18;
  kCTFontUIFontSystemDetail = 19;
  kCTFontUIFontEmphasizedSystemDetail = 20;
  kCTFontUIFontToolbar = 21;
  kCTFontUIFontSmallToolbar = 22;
  kCTFontUIFontMessage = 23;
  kCTFontUIFontPalette = 24;
  kCTFontUIFontToolTip = 25;
  kCTFontUIFontControlContent = 26;
  kCTFontNoFontType = kCTFontUIFontNone;
  kCTFontUserFontType = kCTFontUIFontUser;
  kCTFontUserFixedPitchFontType = kCTFontUIFontUserFixedPitch;
  kCTFontSystemFontType = kCTFontUIFontSystem;
  kCTFontEmphasizedSystemFontType = kCTFontUIFontEmphasizedSystem;
  kCTFontSmallSystemFontType = kCTFontUIFontSmallSystem;
  kCTFontSmallEmphasizedSystemFontType = kCTFontUIFontSmallEmphasizedSystem;
  kCTFontMiniSystemFontType = kCTFontUIFontMiniSystem;
  kCTFontMiniEmphasizedSystemFontType = kCTFontUIFontMiniEmphasizedSystem;
  kCTFontViewsFontType = kCTFontUIFontViews;
  kCTFontApplicationFontType = kCTFontUIFontApplication;
  kCTFontLabelFontType = kCTFontUIFontLabel;
  kCTFontMenuTitleFontType = kCTFontUIFontMenuTitle;
  kCTFontMenuItemFontType = kCTFontUIFontMenuItem;
  kCTFontMenuItemMarkFontType = kCTFontUIFontMenuItemMark;
  kCTFontMenuItemCmdKeyFontType = kCTFontUIFontMenuItemCmdKey;
  kCTFontWindowTitleFontType = kCTFontUIFontWindowTitle;
  kCTFontPushButtonFontType = kCTFontUIFontPushButton;
  kCTFontUtilityWindowTitleFontType = kCTFontUIFontUtilityWindowTitle;
  kCTFontAlertHeaderFontType = kCTFontUIFontAlertHeader;
  kCTFontSystemDetailFontType = kCTFontUIFontSystemDetail;
  kCTFontEmphasizedSystemDetailFontType = kCTFontUIFontEmphasizedSystemDetail;
  kCTFontToolbarFontType = kCTFontUIFontToolbar;
  kCTFontSmallToolbarFontType = kCTFontUIFontSmallToolbar;
  kCTFontMessageFontType = kCTFontUIFontMessage;
  kCTFontPaletteFontType = kCTFontUIFontPalette;
  kCTFontToolTipFontType = kCTFontUIFontToolTip;
  kCTFontControlContentFontType = kCTFontUIFontControlContent;
  kCTFontTableBASE = 1111577413;
  kCTFontTableCBDT = 1128416340;
  kCTFontTableCBLC = 1128418371;
  kCTFontTableCFF = 1128678944;
  kCTFontTableCFF2 = 1128678962;
  kCTFontTableCOLR = 1129270354;
  kCTFontTableCPAL = 1129333068;
  kCTFontTableDSIG = 1146308935;
  kCTFontTableEBDT = 1161970772;
  kCTFontTableEBLC = 1161972803;
  kCTFontTableEBSC = 1161974595;
  kCTFontTableGDEF = 1195656518;
  kCTFontTableGPOS = 1196445523;
  kCTFontTableGSUB = 1196643650;
  kCTFontTableHVAR = 1213612370;
  kCTFontTableJSTF = 1246975046;
  kCTFontTableLTSH = 1280594760;
  kCTFontTableMATH = 1296127048;
  kCTFontTableMERG = 1296388679;
  kCTFontTableMVAR = 1297498450;
  kCTFontTableOS2 = 1330851634;
  kCTFontTablePCLT = 1346587732;
  kCTFontTableSTAT = 1398030676;
  kCTFontTableSVG = 1398163232;
  kCTFontTableVDMX = 1447316824;
  kCTFontTableVORG = 1448038983;
  kCTFontTableVVAR = 1448493394;
  kCTFontTableZapf = 1516335206;
  kCTFontTableAcnt = 1633906292;
  kCTFontTableAnkr = 1634626418;
  kCTFontTableAvar = 1635148146;
  kCTFontTableBdat = 1650745716;
  kCTFontTableBhed = 1651008868;
  kCTFontTableBloc = 1651273571;
  kCTFontTableBsln = 1651731566;
  kCTFontTableCidg = 1667851367;
  kCTFontTableCmap = 1668112752;
  kCTFontTableCvar = 1668702578;
  kCTFontTableCvt = 1668707360;
  kCTFontTableFdsc = 1717859171;
  kCTFontTableFeat = 1717920116;
  kCTFontTableFmtx = 1718449272;
  kCTFontTableFond = 1718578788;
  kCTFontTableFpgm = 1718642541;
  kCTFontTableFvar = 1719034226;
  kCTFontTableGasp = 1734439792;
  kCTFontTableGlyf = 1735162214;
  kCTFontTableGvar = 1735811442;
  kCTFontTableHdmx = 1751412088;
  kCTFontTableHead = 1751474532;
  kCTFontTableHhea = 1751672161;
  kCTFontTableHmtx = 1752003704;
  kCTFontTableHsty = 1752396921;
  kCTFontTableJust = 1786082164;
  kCTFontTableKern = 1801810542;
  kCTFontTableKerx = 1801810552;
  kCTFontTableLcar = 1818452338;
  kCTFontTableLoca = 1819239265;
  kCTFontTableLtag = 1819566439;
  kCTFontTableMaxp = 1835104368;
  kCTFontTableMeta = 1835365473;
  kCTFontTableMort = 1836020340;
  kCTFontTableMorx = 1836020344;
  kCTFontTableName = 1851878757;
  kCTFontTableOpbd = 1869636196;
  kCTFontTablePost = 1886352244;
  kCTFontTablePrep = 1886545264;
  kCTFontTableProp = 1886547824;
  kCTFontTableSbit = 1935829364;
  kCTFontTableSbix = 1935829368;
  kCTFontTableTrak = 1953653099;
  kCTFontTableVhea = 1986553185;
  kCTFontTableVmtx = 1986884728;
  kCTFontTableXref = 2020762982;
  kCTFontTableOptionNoOptions = 0;
  kCTFontTableOptionExcludeSynthetic = (1 shl 0);
  kCTFontCollectionCopyDefaultOptions = 0;
  kCTFontCollectionCopyUnique = (1 shl 0);
  kCTFontCollectionCopyStandardSort = (1 shl 1);
  kCTFontManagerErrorFileNotFound = 101;
  kCTFontManagerErrorInsufficientPermissions = 102;
  kCTFontManagerErrorUnrecognizedFormat = 103;
  kCTFontManagerErrorInvalidFontData = 104;
  kCTFontManagerErrorAlreadyRegistered = 105;
  kCTFontManagerErrorExceededResourceLimit = 106;
  kCTFontManagerErrorAssetNotFound = 107;
  kCTFontManagerErrorNotRegistered = 201;
  kCTFontManagerErrorInUse = 202;
  kCTFontManagerErrorSystemRequired = 203;
  kCTFontManagerErrorRegistrationFailed = 301;
  kCTFontManagerErrorMissingEntitlement = 302;
  kCTFontManagerErrorInsufficientInfo = 303;
  kCTFontManagerErrorCancelledByUser = 304;
  kCTFontManagerErrorDuplicatedName = 305;
  kCTFontManagerErrorInvalidFilePath = 306;
  kCTFontManagerErrorUnsupportedScope = 307;
  kCTFontManagerScopeNone = 0;
  kCTFontManagerScopeProcess = 1;
  kCTFontManagerScopePersistent = 2;
  kCTFontManagerScopeSession = 3;
  kCTFontManagerScopeUser = 2;
  kCTFontManagerAutoActivationDefault = 0;
  kCTFontManagerAutoActivationDisabled = 1;
  kCTFontManagerAutoActivationEnabled = 2;
  kCTFontManagerAutoActivationPromptUser = 3;
  kCTFrameProgressionTopToBottom = 0;
  kCTFrameProgressionRightToLeft = 1;
  kCTFrameProgressionLeftToRight = 2;
  kCTFramePathFillEvenOdd = 0;
  kCTFramePathFillWindingNumber = 1;
  kCTLineBoundsExcludeTypographicLeading = 1 shl 0;
  kCTLineBoundsExcludeTypographicShifts = 1 shl 1;
  kCTLineBoundsUseHangingPunctuation = 1 shl 2;
  kCTLineBoundsUseGlyphPathBounds = 1 shl 3;
  kCTLineBoundsUseOpticalBounds = 1 shl 4;
  kCTLineBoundsIncludeLanguageExtents = 1 shl 5;
  kCTLineTruncationStart = 0;
  kCTLineTruncationEnd = 1;
  kCTLineTruncationMiddle = 2;
  kCTCharacterCollectionIdentityMapping = 0;
  kCTCharacterCollectionAdobeCNS1 = 1;
  kCTCharacterCollectionAdobeGB1 = 2;
  kCTCharacterCollectionAdobeJapan1 = 3;
  kCTCharacterCollectionAdobeJapan2 = 4;
  kCTCharacterCollectionAdobeKorea1 = 5;
  kCTIdentityMappingCharacterCollection = kCTCharacterCollectionIdentityMapping;
  kCTAdobeCNS1CharacterCollection = kCTCharacterCollectionAdobeCNS1;
  kCTAdobeGB1CharacterCollection = kCTCharacterCollectionAdobeGB1;
  kCTAdobeJapan1CharacterCollection = kCTCharacterCollectionAdobeJapan1;
  kCTAdobeJapan2CharacterCollection = kCTCharacterCollectionAdobeJapan2;
  kCTAdobeKorea1CharacterCollection = kCTCharacterCollectionAdobeKorea1;
  kCTTextAlignmentLeft = 0;
  kCTTextAlignmentRight = 1;
  kCTTextAlignmentCenter = 2;
  kCTTextAlignmentJustified = 3;
  kCTTextAlignmentNatural = 4;
  kCTLeftTextAlignment = kCTTextAlignmentLeft;
  kCTRightTextAlignment = kCTTextAlignmentRight;
  kCTCenterTextAlignment = kCTTextAlignmentCenter;
  kCTJustifiedTextAlignment = kCTTextAlignmentJustified;
  kCTNaturalTextAlignment = kCTTextAlignmentNatural;
  kCTLineBreakByWordWrapping = 0;
  kCTLineBreakByCharWrapping = 1;
  kCTLineBreakByClipping = 2;
  kCTLineBreakByTruncatingHead = 3;
  kCTLineBreakByTruncatingTail = 4;
  kCTLineBreakByTruncatingMiddle = 5;
  kCTWritingDirectionNatural = -1;
  kCTWritingDirectionLeftToRight = 0;
  kCTWritingDirectionRightToLeft = 1;
  kCTParagraphStyleSpecifierAlignment = 0;
  kCTParagraphStyleSpecifierFirstLineHeadIndent = 1;
  kCTParagraphStyleSpecifierHeadIndent = 2;
  kCTParagraphStyleSpecifierTailIndent = 3;
  kCTParagraphStyleSpecifierTabStops = 4;
  kCTParagraphStyleSpecifierDefaultTabInterval = 5;
  kCTParagraphStyleSpecifierLineBreakMode = 6;
  kCTParagraphStyleSpecifierLineHeightMultiple = 7;
  kCTParagraphStyleSpecifierMaximumLineHeight = 8;
  kCTParagraphStyleSpecifierMinimumLineHeight = 9;
  kCTParagraphStyleSpecifierLineSpacing = 10;
  kCTParagraphStyleSpecifierParagraphSpacing = 11;
  kCTParagraphStyleSpecifierParagraphSpacingBefore = 12;
  kCTParagraphStyleSpecifierBaseWritingDirection = 13;
  kCTParagraphStyleSpecifierMaximumLineSpacing = 14;
  kCTParagraphStyleSpecifierMinimumLineSpacing = 15;
  kCTParagraphStyleSpecifierLineSpacingAdjustment = 16;
  kCTParagraphStyleSpecifierLineBoundsOptions = 17;
  kCTParagraphStyleSpecifierCount = 18;
  kCTRubyAlignmentInvalid = Byte(-1);
  kCTRubyAlignmentAuto = 0;
  kCTRubyAlignmentStart = 1;
  kCTRubyAlignmentCenter = 2;
  kCTRubyAlignmentEnd = 3;
  kCTRubyAlignmentDistributeLetter = 4;
  kCTRubyAlignmentDistributeSpace = 5;
  kCTRubyAlignmentLineEdge = 6;
  kCTRubyOverhangInvalid = Byte(-1);
  kCTRubyOverhangAuto = 0;
  kCTRubyOverhangStart = 1;
  kCTRubyOverhangEnd = 2;
  kCTRubyOverhangNone = 3;
  kCTRubyPositionBefore = 0;
  kCTRubyPositionAfter = 1;
  kCTRubyPositionInterCharacter = 2;
  kCTRubyPositionInline = 3;
  kCTRubyPositionCount = 4;
  kCTRunStatusNoStatus = 0;
  kCTRunStatusRightToLeft = (1 shl 0);
  kCTRunStatusNonMonotonic = (1 shl 1);
  kCTRunStatusHasNonIdentityMatrix = (1 shl 2);
  kCTRunDelegateVersion1 = 1;
  kCTRunDelegateCurrentVersion = kCTRunDelegateVersion1;
  kCTUnderlineStyleNone = 0;
  kCTUnderlineStyleSingle = 1;
  kCTUnderlineStyleThick = 2;
  kCTUnderlineStyleDouble = 9;
  kCTUnderlinePatternSolid = 0;
  kCTUnderlinePatternDot = 256;
  kCTUnderlinePatternDash = 512;
  kCTUnderlinePatternDashDot = 768;
  kCTUnderlinePatternDashDotDot = 1024;
  kCTWritingDirectionEmbedding = (0 shl 1);
  kCTWritingDirectionOverride = (1 shl 1);
  kAllTypographicFeaturesType = 0;
  kLigaturesType = 1;
  kCursiveConnectionType = 2;
  kLetterCaseType = 3;
  kVerticalSubstitutionType = 4;
  kLinguisticRearrangementType = 5;
  kNumberSpacingType = 6;
  kSmartSwashType = 8;
  kDiacriticsType = 9;
  kVerticalPositionType = 10;
  kFractionsType = 11;
  kOverlappingCharactersType = 13;
  kTypographicExtrasType = 14;
  kMathematicalExtrasType = 15;
  kOrnamentSetsType = 16;
  kCharacterAlternativesType = 17;
  kDesignComplexityType = 18;
  kStyleOptionsType = 19;
  kCharacterShapeType = 20;
  kNumberCaseType = 21;
  kTextSpacingType = 22;
  kTransliterationType = 23;
  kAnnotationType = 24;
  kKanaSpacingType = 25;
  kIdeographicSpacingType = 26;
  kUnicodeDecompositionType = 27;
  kRubyKanaType = 28;
  kCJKSymbolAlternativesType = 29;
  kIdeographicAlternativesType = 30;
  kCJKVerticalRomanPlacementType = 31;
  kItalicCJKRomanType = 32;
  kCaseSensitiveLayoutType = 33;
  kAlternateKanaType = 34;
  kStylisticAlternativesType = 35;
  kContextualAlternatesType = 36;
  kLowerCaseType = 37;
  kUpperCaseType = 38;
  kLanguageTagType = 39;
  kCJKRomanSpacingType = 103;
  kLastFeatureType = -1;
  kAllTypeFeaturesOnSelector = 0;
  kAllTypeFeaturesOffSelector = 1;
  kRequiredLigaturesOnSelector = 0;
  kRequiredLigaturesOffSelector = 1;
  kCommonLigaturesOnSelector = 2;
  kCommonLigaturesOffSelector = 3;
  kRareLigaturesOnSelector = 4;
  kRareLigaturesOffSelector = 5;
  kLogosOnSelector = 6;
  kLogosOffSelector = 7;
  kRebusPicturesOnSelector = 8;
  kRebusPicturesOffSelector = 9;
  kDiphthongLigaturesOnSelector = 10;
  kDiphthongLigaturesOffSelector = 11;
  kSquaredLigaturesOnSelector = 12;
  kSquaredLigaturesOffSelector = 13;
  kAbbrevSquaredLigaturesOnSelector = 14;
  kAbbrevSquaredLigaturesOffSelector = 15;
  kSymbolLigaturesOnSelector = 16;
  kSymbolLigaturesOffSelector = 17;
  kContextualLigaturesOnSelector = 18;
  kContextualLigaturesOffSelector = 19;
  kHistoricalLigaturesOnSelector = 20;
  kHistoricalLigaturesOffSelector = 21;
  kUnconnectedSelector = 0;
  kPartiallyConnectedSelector = 1;
  kCursiveSelector = 2;
  kUpperAndLowerCaseSelector = 0;
  kAllCapsSelector = 1;
  kAllLowerCaseSelector = 2;
  kSmallCapsSelector = 3;
  kInitialCapsSelector = 4;
  kInitialCapsAndSmallCapsSelector = 5;
  kSubstituteVerticalFormsOnSelector = 0;
  kSubstituteVerticalFormsOffSelector = 1;
  kLinguisticRearrangementOnSelector = 0;
  kLinguisticRearrangementOffSelector = 1;
  kMonospacedNumbersSelector = 0;
  kProportionalNumbersSelector = 1;
  kThirdWidthNumbersSelector = 2;
  kQuarterWidthNumbersSelector = 3;
  kWordInitialSwashesOnSelector = 0;
  kWordInitialSwashesOffSelector = 1;
  kWordFinalSwashesOnSelector = 2;
  kWordFinalSwashesOffSelector = 3;
  kLineInitialSwashesOnSelector = 4;
  kLineInitialSwashesOffSelector = 5;
  kLineFinalSwashesOnSelector = 6;
  kLineFinalSwashesOffSelector = 7;
  kNonFinalSwashesOnSelector = 8;
  kNonFinalSwashesOffSelector = 9;
  kShowDiacriticsSelector = 0;
  kHideDiacriticsSelector = 1;
  kDecomposeDiacriticsSelector = 2;
  kNormalPositionSelector = 0;
  kSuperiorsSelector = 1;
  kInferiorsSelector = 2;
  kOrdinalsSelector = 3;
  kScientificInferiorsSelector = 4;
  kNoFractionsSelector = 0;
  kVerticalFractionsSelector = 1;
  kDiagonalFractionsSelector = 2;
  kPreventOverlapOnSelector = 0;
  kPreventOverlapOffSelector = 1;
  kHyphensToEmDashOnSelector = 0;
  kHyphensToEmDashOffSelector = 1;
  kHyphenToEnDashOnSelector = 2;
  kHyphenToEnDashOffSelector = 3;
  kSlashedZeroOnSelector = 4;
  kSlashedZeroOffSelector = 5;
  kFormInterrobangOnSelector = 6;
  kFormInterrobangOffSelector = 7;
  kSmartQuotesOnSelector = 8;
  kSmartQuotesOffSelector = 9;
  kPeriodsToEllipsisOnSelector = 10;
  kPeriodsToEllipsisOffSelector = 11;
  kHyphenToMinusOnSelector = 0;
  kHyphenToMinusOffSelector = 1;
  kAsteriskToMultiplyOnSelector = 2;
  kAsteriskToMultiplyOffSelector = 3;
  kSlashToDivideOnSelector = 4;
  kSlashToDivideOffSelector = 5;
  kInequalityLigaturesOnSelector = 6;
  kInequalityLigaturesOffSelector = 7;
  kExponentsOnSelector = 8;
  kExponentsOffSelector = 9;
  kMathematicalGreekOnSelector = 10;
  kMathematicalGreekOffSelector = 11;
  kNoOrnamentsSelector = 0;
  kDingbatsSelector = 1;
  kPiCharactersSelector = 2;
  kFleuronsSelector = 3;
  kDecorativeBordersSelector = 4;
  kInternationalSymbolsSelector = 5;
  kMathSymbolsSelector = 6;
  kNoAlternatesSelector = 0;
  kDesignLevel1Selector = 0;
  kDesignLevel2Selector = 1;
  kDesignLevel3Selector = 2;
  kDesignLevel4Selector = 3;
  kDesignLevel5Selector = 4;
  kNoStyleOptionsSelector = 0;
  kDisplayTextSelector = 1;
  kEngravedTextSelector = 2;
  kIlluminatedCapsSelector = 3;
  kTitlingCapsSelector = 4;
  kTallCapsSelector = 5;
  kTraditionalCharactersSelector = 0;
  kSimplifiedCharactersSelector = 1;
  kJIS1978CharactersSelector = 2;
  kJIS1983CharactersSelector = 3;
  kJIS1990CharactersSelector = 4;
  kTraditionalAltOneSelector = 5;
  kTraditionalAltTwoSelector = 6;
  kTraditionalAltThreeSelector = 7;
  kTraditionalAltFourSelector = 8;
  kTraditionalAltFiveSelector = 9;
  kExpertCharactersSelector = 10;
  kJIS2004CharactersSelector = 11;
  kHojoCharactersSelector = 12;
  kNLCCharactersSelector = 13;
  kTraditionalNamesCharactersSelector = 14;
  kLowerCaseNumbersSelector = 0;
  kUpperCaseNumbersSelector = 1;
  kProportionalTextSelector = 0;
  kMonospacedTextSelector = 1;
  kHalfWidthTextSelector = 2;
  kThirdWidthTextSelector = 3;
  kQuarterWidthTextSelector = 4;
  kAltProportionalTextSelector = 5;
  kAltHalfWidthTextSelector = 6;
  kNoTransliterationSelector = 0;
  kHanjaToHangulSelector = 1;
  kHiraganaToKatakanaSelector = 2;
  kKatakanaToHiraganaSelector = 3;
  kKanaToRomanizationSelector = 4;
  kRomanizationToHiraganaSelector = 5;
  kRomanizationToKatakanaSelector = 6;
  kHanjaToHangulAltOneSelector = 7;
  kHanjaToHangulAltTwoSelector = 8;
  kHanjaToHangulAltThreeSelector = 9;
  kNoAnnotationSelector = 0;
  kBoxAnnotationSelector = 1;
  kRoundedBoxAnnotationSelector = 2;
  kCircleAnnotationSelector = 3;
  kInvertedCircleAnnotationSelector = 4;
  kParenthesisAnnotationSelector = 5;
  kPeriodAnnotationSelector = 6;
  kRomanNumeralAnnotationSelector = 7;
  kDiamondAnnotationSelector = 8;
  kInvertedBoxAnnotationSelector = 9;
  kInvertedRoundedBoxAnnotationSelector = 10;
  kFullWidthKanaSelector = 0;
  kProportionalKanaSelector = 1;
  kFullWidthIdeographsSelector = 0;
  kProportionalIdeographsSelector = 1;
  kHalfWidthIdeographsSelector = 2;
  kCanonicalCompositionOnSelector = 0;
  kCanonicalCompositionOffSelector = 1;
  kCompatibilityCompositionOnSelector = 2;
  kCompatibilityCompositionOffSelector = 3;
  kTranscodingCompositionOnSelector = 4;
  kTranscodingCompositionOffSelector = 5;
  kNoRubyKanaSelector = 0;
  kRubyKanaSelector = 1;
  kRubyKanaOnSelector = 2;
  kRubyKanaOffSelector = 3;
  kNoCJKSymbolAlternativesSelector = 0;
  kCJKSymbolAltOneSelector = 1;
  kCJKSymbolAltTwoSelector = 2;
  kCJKSymbolAltThreeSelector = 3;
  kCJKSymbolAltFourSelector = 4;
  kCJKSymbolAltFiveSelector = 5;
  kNoIdeographicAlternativesSelector = 0;
  kIdeographicAltOneSelector = 1;
  kIdeographicAltTwoSelector = 2;
  kIdeographicAltThreeSelector = 3;
  kIdeographicAltFourSelector = 4;
  kIdeographicAltFiveSelector = 5;
  kCJKVerticalRomanCenteredSelector = 0;
  kCJKVerticalRomanHBaselineSelector = 1;
  kNoCJKItalicRomanSelector = 0;
  kCJKItalicRomanSelector = 1;
  kCJKItalicRomanOnSelector = 2;
  kCJKItalicRomanOffSelector = 3;
  kCaseSensitiveLayoutOnSelector = 0;
  kCaseSensitiveLayoutOffSelector = 1;
  kCaseSensitiveSpacingOnSelector = 2;
  kCaseSensitiveSpacingOffSelector = 3;
  kAlternateHorizKanaOnSelector = 0;
  kAlternateHorizKanaOffSelector = 1;
  kAlternateVertKanaOnSelector = 2;
  kAlternateVertKanaOffSelector = 3;
  kNoStylisticAlternatesSelector = 0;
  kStylisticAltOneOnSelector = 2;
  kStylisticAltOneOffSelector = 3;
  kStylisticAltTwoOnSelector = 4;
  kStylisticAltTwoOffSelector = 5;
  kStylisticAltThreeOnSelector = 6;
  kStylisticAltThreeOffSelector = 7;
  kStylisticAltFourOnSelector = 8;
  kStylisticAltFourOffSelector = 9;
  kStylisticAltFiveOnSelector = 10;
  kStylisticAltFiveOffSelector = 11;
  kStylisticAltSixOnSelector = 12;
  kStylisticAltSixOffSelector = 13;
  kStylisticAltSevenOnSelector = 14;
  kStylisticAltSevenOffSelector = 15;
  kStylisticAltEightOnSelector = 16;
  kStylisticAltEightOffSelector = 17;
  kStylisticAltNineOnSelector = 18;
  kStylisticAltNineOffSelector = 19;
  kStylisticAltTenOnSelector = 20;
  kStylisticAltTenOffSelector = 21;
  kStylisticAltElevenOnSelector = 22;
  kStylisticAltElevenOffSelector = 23;
  kStylisticAltTwelveOnSelector = 24;
  kStylisticAltTwelveOffSelector = 25;
  kStylisticAltThirteenOnSelector = 26;
  kStylisticAltThirteenOffSelector = 27;
  kStylisticAltFourteenOnSelector = 28;
  kStylisticAltFourteenOffSelector = 29;
  kStylisticAltFifteenOnSelector = 30;
  kStylisticAltFifteenOffSelector = 31;
  kStylisticAltSixteenOnSelector = 32;
  kStylisticAltSixteenOffSelector = 33;
  kStylisticAltSeventeenOnSelector = 34;
  kStylisticAltSeventeenOffSelector = 35;
  kStylisticAltEighteenOnSelector = 36;
  kStylisticAltEighteenOffSelector = 37;
  kStylisticAltNineteenOnSelector = 38;
  kStylisticAltNineteenOffSelector = 39;
  kStylisticAltTwentyOnSelector = 40;
  kStylisticAltTwentyOffSelector = 41;
  kContextualAlternatesOnSelector = 0;
  kContextualAlternatesOffSelector = 1;
  kSwashAlternatesOnSelector = 2;
  kSwashAlternatesOffSelector = 3;
  kContextualSwashAlternatesOnSelector = 4;
  kContextualSwashAlternatesOffSelector = 5;
  kDefaultLowerCaseSelector = 0;
  kLowerCaseSmallCapsSelector = 1;
  kLowerCasePetiteCapsSelector = 2;
  kDefaultUpperCaseSelector = 0;
  kUpperCaseSmallCapsSelector = 1;
  kUpperCasePetiteCapsSelector = 2;
  kHalfWidthCJKRomanSelector = 0;
  kProportionalCJKRomanSelector = 1;
  kDefaultCJKRomanSelector = 2;
  kFullWidthCJKRomanSelector = 3;
  kSFNTLookupSimpleArray = 0;
  kSFNTLookupSegmentSingle = 2;
  kSFNTLookupSegmentArray = 4;
  kSFNTLookupSingleTable = 6;
  kSFNTLookupTrimmedArray = 8;
  kSFNTLookupVector = 10;
  kSTClassEndOfText = 0;
  kSTClassOutOfBounds = 1;
  kSTClassDeletedGlyph = 2;
  kSTClassEndOfLine = 3;
  kSTSetMark = 32768;
  kSTNoAdvance = 16384;
  kSTMarkEnd = 8192;
  kSTLigActionMask = 16383;
  kSTRearrVerbMask = 15;
  kSTXHasLigAction = 8192;
  kSTKCrossStreamReset = 8192;
  kLCARTag = 1818452338;
  kLCARCurrentVersion = 65536;
  kLCARLinearFormat = 0;
  kLCARCtlPointFormat = 1;
  kJUSTTag = 1786082164;
  kJUSTCurrentVersion = 65536;
  kJUSTStandardFormat = 0;
  kJUSTnoGlyphcode = 65535;
  kJUSTpcDecompositionAction = 0;
  kJUSTpcUnconditionalAddAction = 1;
  kJUSTpcConditionalAddAction = 2;
  kJUSTpcGlyphStretchAction = 3;
  kJUSTpcDuctilityAction = 4;
  kJUSTpcGlyphRepeatAddAction = 5;
  kJUSTKashidaPriority = 0;
  kJUSTSpacePriority = 1;
  kJUSTLetterPriority = 2;
  kJUSTNullPriority = 3;
  kJUSTPriorityCount = 4;
  kJUSTOverridePriority = 32768;
  kJUSTOverrideLimits = 16384;
  kJUSTOverrideUnlimited = 8192;
  kJUSTUnlimited = 4096;
  kJUSTPriorityMask = 3;
  kOPBDTag = 1869636196;
  kOPBDCurrentVersion = 65536;
  kOPBDDistanceFormat = 0;
  kOPBDControlPointFormat = 1;
  kMORTTag = 1836020340;
  kMORTCurrentVersion = 65536;
  kMORTCoverVertical = 32768;
  kMORTCoverDescending = 16384;
  kMORTCoverIgnoreVertical = 8192;
  kMORTCoverTypeMask = 15;
  kMORTRearrangementType = 0;
  kMORTContextualType = 1;
  kMORTLigatureType = 2;
  kMORTSwashType = 4;
  kMORTInsertionType = 5;
  kMORTLigLastAction = Integer(2147483648);
  kMORTLigStoreLigature = 1073741824;
  kMORTLigFormOffsetMask = 1073741823;
  kMORTLigFormOffsetShift = 2;
  kMORTraNoAction = 0;
  kMORTraxA = 1;
  kMORTraDx = 2;
  kMORTraDxA = 3;
  kMORTraxAB = 4;
  kMORTraxBA = 5;
  kMORTraCDx = 6;
  kMORTraDCx = 7;
  kMORTraCDxA = 8;
  kMORTraDCxA = 9;
  kMORTraDxAB = 10;
  kMORTraDxBA = 11;
  kMORTraCDxAB = 12;
  kMORTraCDxBA = 13;
  kMORTraDCxAB = 14;
  kMORTraDCxBA = 15;
  kMORTDoInsertionsBefore = 128;
  kMORTIsSplitVowelPiece = 64;
  kMORTInsertionsCountMask = 63;
  kMORTCurrInsertKashidaLike = 8192;
  kMORTMarkInsertKashidaLike = 4096;
  kMORTCurrInsertBefore = 2048;
  kMORTMarkInsertBefore = 1024;
  kMORTMarkJustTableCountMask = 16256;
  kMORTMarkJustTableCountShift = 7;
  kMORTCurrJustTableCountMask = 127;
  kMORTCurrJustTableCountShift = 0;
  kMORTCurrInsertCountMask = 992;
  kMORTCurrInsertCountShift = 5;
  kMORTMarkInsertCountMask = 31;
  kMORTMarkInsertCountShift = 0;
  kMORXTag = 1836020344;
  kMORXCurrentVersion = 131072;
  kMORXCoverVertical = Integer(2147483648);
  kMORXCoverDescending = 1073741824;
  kMORXCoverIgnoreVertical = 536870912;
  kMORXCoverLogicalOrder = 268435456;
  kMORXCoverTypeMask = 255;
  kPROPTag = 1886547824;
  kPROPCurrentVersion = 196608;
  kPROPPairOffsetShift = 8;
  kPROPPairOffsetSign = 7;
  kPROPIsFloaterMask = 32768;
  kPROPCanHangLTMask = 16384;
  kPROPCanHangRBMask = 8192;
  kPROPUseRLPairMask = 4096;
  kPROPPairOffsetMask = 3840;
  kPROPRightConnectMask = 128;
  kPROPZeroReserved = 96;
  kPROPDirectionMask = 31;
  kPROPLDirectionClass = 0;
  kPROPRDirectionClass = 1;
  kPROPALDirectionClass = 2;
  kPROPENDirectionClass = 3;
  kPROPESDirectionClass = 4;
  kPROPETDirectionClass = 5;
  kPROPANDirectionClass = 6;
  kPROPCSDirectionClass = 7;
  kPROPPSDirectionClass = 8;
  kPROPSDirectionClass = 9;
  kPROPWSDirectionClass = 10;
  kPROPONDirectionClass = 11;
  kPROPSENDirectionClass = 12;
  kPROPLREDirectionClass = 13;
  kPROPLRODirectionClass = 14;
  kPROPRLEDirectionClass = 15;
  kPROPRLODirectionClass = 16;
  kPROPPDFDirectionClass = 17;
  kPROPNSMDirectionClass = 18;
  kPROPBNDirectionClass = 19;
  kPROPNumDirectionClasses = 20;
  kTRAKTag = 1953653099;
  kTRAKCurrentVersion = 65536;
  kTRAKUniformFormat = 0;
  kKERNTag = 1801810542;
  kKERNCurrentVersion = 65536;
  kKERNVertical = 32768;
  kKERNResetCrossStream = 32768;
  kKERNCrossStream = 16384;
  kKERNVariation = 8192;
  kKERNUnusedBits = 7936;
  kKERNFormatMask = 255;
  kKERNOrderedList = 0;
  kKERNStateTable = 1;
  kKERNSimpleArray = 2;
  kKERNIndexArray = 3;
  kKERNLineStart = 1;
  kKERNLineEndKerning = 2;
  kKERNNoCrossKerning = 4;
  kKERNNotesRequested = 8;
  kKERNNoStakeNote = 1;
  kKERNCrossStreamResetNote = 2;
  kKERNNotApplied = 1;
  kKERXTag = 1801810552;
  kKERXCurrentVersion = 131072;
  kKERXVertical = Integer(2147483648);
  kKERXResetCrossStream = 32768;
  kKERXCrossStream = 1073741824;
  kKERXVariation = 536870912;
  kKERXDescending = 268435456;
  kKERXUnusedBits = 268435200;
  kKERXFormatMask = 255;
  kKERXOrderedList = 0;
  kKERXStateTable = 1;
  kKERXSimpleArray = 2;
  kKERXControlPoint = 4;
  kKERXIndexArray = 6;
  kKERXLineStart = 1;
  kKERXLineEndKerning = 2;
  kKERXNoCrossKerning = 4;
  kKERXNotesRequested = 8;
  kKERXNoStakeNote = 1;
  kKERXCrossStreamResetNote = 2;
  kKERXNotApplied = 1;
  kKERXActionTypeMask = (3 shl 30);
  kKERXActionTypeControlPoints = (0 shl 30);
  kKERXActionTypeAnchorPoints = (1 shl 30);
  kKERXActionTypeCoordinates = (2 shl 30);
  kKERXUnusedFlags = 1056964608;
  kKERXActionOffsetMask = 16777215;
  kKERXValuesAreLong = 1;
  kBSLNTag = 1651731566;
  kBSLNCurrentVersion = 65536;
  kBSLNDistanceFormatNoMap = 0;
  kBSLNDistanceFormatWithMap = 1;
  kBSLNControlPointFormatNoMap = 2;
  kBSLNControlPointFormatWithMap = 3;
  kBSLNRomanBaseline = 0;
  kBSLNIdeographicCenterBaseline = 1;
  kBSLNIdeographicLowBaseline = 2;
  kBSLNHangingBaseline = 3;
  kBSLNMathBaseline = 4;
  kBSLNIdeographicHighBaseline = 5;
  kBSLNLastBaseline = 31;
  kBSLNNumBaselineClasses = kBSLNLastBaseline + 1;
  kBSLNNoBaseline = 255;
  kBSLNNoBaselineOverride = 255;
  kANKRCurrentVersion = 0;
  kLTAGCurrentVersion = 1;
  sizeof_sfntDirectory = 12;
  cmapFontTableTag = 1668112752;
  kFontUnicodePlatform = 0;
  kFontMacintoshPlatform = 1;
  kFontReservedPlatform = 2;
  kFontMicrosoftPlatform = 3;
  kFontCustomPlatform = 4;
  kFontUnicodeDefaultSemantics = 0;
  kFontUnicodeV1_1Semantics = 1;
  kFontISO10646_1993Semantics = 2;
  kFontUnicodeV2_0BMPOnlySemantics = 3;
  kFontUnicodeV2_0FullCoverageSemantics = 4;
  kFontUnicodeV4_0VariationSequenceSemantics = 5;
  kFontUnicode_FullRepertoire = 6;
  kFontRomanScript = 0;
  kFontJapaneseScript = 1;
  kFontTraditionalChineseScript = 2;
  kFontChineseScript = kFontTraditionalChineseScript;
  kFontKoreanScript = 3;
  kFontArabicScript = 4;
  kFontHebrewScript = 5;
  kFontGreekScript = 6;
  kFontCyrillicScript = 7;
  kFontRussian = kFontCyrillicScript;
  kFontRSymbolScript = 8;
  kFontDevanagariScript = 9;
  kFontGurmukhiScript = 10;
  kFontGujaratiScript = 11;
  kFontOriyaScript = 12;
  kFontBengaliScript = 13;
  kFontTamilScript = 14;
  kFontTeluguScript = 15;
  kFontKannadaScript = 16;
  kFontMalayalamScript = 17;
  kFontSinhaleseScript = 18;
  kFontBurmeseScript = 19;
  kFontKhmerScript = 20;
  kFontThaiScript = 21;
  kFontLaotianScript = 22;
  kFontGeorgianScript = 23;
  kFontArmenianScript = 24;
  kFontSimpleChineseScript = 25;
  kFontTibetanScript = 26;
  kFontMongolianScript = 27;
  kFontGeezScript = 28;
  kFontEthiopicScript = kFontGeezScript;
  kFontAmharicScript = kFontGeezScript;
  kFontSlavicScript = 29;
  kFontEastEuropeanRomanScript = kFontSlavicScript;
  kFontVietnameseScript = 30;
  kFontExtendedArabicScript = 31;
  kFontSindhiScript = kFontExtendedArabicScript;
  kFontUninterpretedScript = 32;
  kFontMicrosoftSymbolScript = 0;
  kFontMicrosoftStandardScript = 1;
  kFontMicrosoftUCS4Script = 10;
  kFontCustom8BitScript = 0;
  kFontCustom816BitScript = 1;
  kFontCustom16BitScript = 2;
  kFontEnglishLanguage = 0;
  kFontFrenchLanguage = 1;
  kFontGermanLanguage = 2;
  kFontItalianLanguage = 3;
  kFontDutchLanguage = 4;
  kFontSwedishLanguage = 5;
  kFontSpanishLanguage = 6;
  kFontDanishLanguage = 7;
  kFontPortugueseLanguage = 8;
  kFontNorwegianLanguage = 9;
  kFontHebrewLanguage = 10;
  kFontJapaneseLanguage = 11;
  kFontArabicLanguage = 12;
  kFontFinnishLanguage = 13;
  kFontGreekLanguage = 14;
  kFontIcelandicLanguage = 15;
  kFontMalteseLanguage = 16;
  kFontTurkishLanguage = 17;
  kFontCroatianLanguage = 18;
  kFontTradChineseLanguage = 19;
  kFontUrduLanguage = 20;
  kFontHindiLanguage = 21;
  kFontThaiLanguage = 22;
  kFontKoreanLanguage = 23;
  kFontLithuanianLanguage = 24;
  kFontPolishLanguage = 25;
  kFontHungarianLanguage = 26;
  kFontEstonianLanguage = 27;
  kFontLettishLanguage = 28;
  kFontLatvianLanguage = kFontLettishLanguage;
  kFontSaamiskLanguage = 29;
  kFontLappishLanguage = kFontSaamiskLanguage;
  kFontFaeroeseLanguage = 30;
  kFontFarsiLanguage = 31;
  kFontPersianLanguage = kFontFarsiLanguage;
  kFontRussianLanguage = 32;
  kFontSimpChineseLanguage = 33;
  kFontFlemishLanguage = 34;
  kFontIrishLanguage = 35;
  kFontAlbanianLanguage = 36;
  kFontRomanianLanguage = 37;
  kFontCzechLanguage = 38;
  kFontSlovakLanguage = 39;
  kFontSlovenianLanguage = 40;
  kFontYiddishLanguage = 41;
  kFontSerbianLanguage = 42;
  kFontMacedonianLanguage = 43;
  kFontBulgarianLanguage = 44;
  kFontUkrainianLanguage = 45;
  kFontByelorussianLanguage = 46;
  kFontUzbekLanguage = 47;
  kFontKazakhLanguage = 48;
  kFontAzerbaijaniLanguage = 49;
  kFontAzerbaijanArLanguage = 50;
  kFontArmenianLanguage = 51;
  kFontGeorgianLanguage = 52;
  kFontMoldavianLanguage = 53;
  kFontKirghizLanguage = 54;
  kFontTajikiLanguage = 55;
  kFontTurkmenLanguage = 56;
  kFontMongolianLanguage = 57;
  kFontMongolianCyrLanguage = 58;
  kFontPashtoLanguage = 59;
  kFontKurdishLanguage = 60;
  kFontKashmiriLanguage = 61;
  kFontSindhiLanguage = 62;
  kFontTibetanLanguage = 63;
  kFontNepaliLanguage = 64;
  kFontSanskritLanguage = 65;
  kFontMarathiLanguage = 66;
  kFontBengaliLanguage = 67;
  kFontAssameseLanguage = 68;
  kFontGujaratiLanguage = 69;
  kFontPunjabiLanguage = 70;
  kFontOriyaLanguage = 71;
  kFontMalayalamLanguage = 72;
  kFontKannadaLanguage = 73;
  kFontTamilLanguage = 74;
  kFontTeluguLanguage = 75;
  kFontSinhaleseLanguage = 76;
  kFontBurmeseLanguage = 77;
  kFontKhmerLanguage = 78;
  kFontLaoLanguage = 79;
  kFontVietnameseLanguage = 80;
  kFontIndonesianLanguage = 81;
  kFontTagalogLanguage = 82;
  kFontMalayRomanLanguage = 83;
  kFontMalayArabicLanguage = 84;
  kFontAmharicLanguage = 85;
  kFontTigrinyaLanguage = 86;
  kFontGallaLanguage = 87;
  kFontOromoLanguage = kFontGallaLanguage;
  kFontSomaliLanguage = 88;
  kFontSwahiliLanguage = 89;
  kFontRuandaLanguage = 90;
  kFontRundiLanguage = 91;
  kFontChewaLanguage = 92;
  kFontMalagasyLanguage = 93;
  kFontEsperantoLanguage = 94;
  kFontWelshLanguage = 128;
  kFontBasqueLanguage = 129;
  kFontCatalanLanguage = 130;
  kFontLatinLanguage = 131;
  kFontQuechuaLanguage = 132;
  kFontGuaraniLanguage = 133;
  kFontAymaraLanguage = 134;
  kFontTatarLanguage = 135;
  kFontUighurLanguage = 136;
  kFontDzongkhaLanguage = 137;
  kFontJavaneseRomLanguage = 138;
  kFontSundaneseRomLanguage = 139;
  kFontNoPlatformCode = Cardinal((not 0));
  kFontNoScriptCode = Cardinal((not 0));
  kFontNoLanguageCode = Cardinal((not 0));
  sizeof_sfntCMapSubHeader = 6;
  sizeof_sfntCMapExtendedSubHeader = 12;
  sizeof_sfntCMapEncoding = 8;
  sizeof_sfntCMapHeader = 4;
  nameFontTableTag = 1851878757;
  kFontCopyrightName = 0;
  kFontFamilyName = 1;
  kFontStyleName = 2;
  kFontUniqueName = 3;
  kFontFullName = 4;
  kFontVersionName = 5;
  kFontPostscriptName = 6;
  kFontTrademarkName = 7;
  kFontManufacturerName = 8;
  kFontDesignerName = 9;
  kFontDescriptionName = 10;
  kFontVendorURLName = 11;
  kFontDesignerURLName = 12;
  kFontLicenseDescriptionName = 13;
  kFontLicenseInfoURLName = 14;
  kFontPreferredFamilyName = 16;
  kFontPreferredSubfamilyName = 17;
  kFontMacCompatibleFullName = 18;
  kFontSampleTextName = 19;
  kFontPostScriptCIDName = 20;
  kFontLastReservedName = 255;
  kFontNoNameCode = Cardinal((not 0));
  sizeof_sfntNameRecord = 12;
  sizeof_sfntNameHeader = 6;
  variationFontTableTag = 1719034226;
  sizeof_sfntVariationAxis = 20;
  sizeof_sfntInstance = 4;
  sizeof_sfntVariationHeader = 16;
  descriptorFontTableTag = 1717859171;
  sizeof_sfntDescriptorHeader = 8;
  featureFontTableTag = 1717920116;
  os2FontTableTag = 1330851634;
  nonGlyphID = 65535;

type
  // ===== Framework typedefs =====
{$M+}
  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  CTFontSymbolicTraits = LongWord;
  CTFontStylisticClass = LongWord;
  CTFontDescriptorRef = Pointer;
  PCTFontDescriptorRef = ^CTFontDescriptorRef;
  CFTypeID = LongWord;
  PCFTypeID = ^CFTypeID;

  CTFontOrientation = LongWord;
  CTFontFormat = LongWord;
  CTFontPriority = LongWord;
  PCTFontPriority = ^CTFontPriority;
  CGFloat = Single;
  PCGFloat = ^CGFloat;

  CFDictionaryRef = Pointer;
  PCFDictionaryRef = ^CFDictionaryRef;
  CFNumberRef = Pointer;
  PCFNumberRef = ^CFNumberRef;
  CFSetRef = Pointer;
  PCFSetRef = ^CFSetRef;
  CFArrayRef = Pointer;
  PCFArrayRef = ^CFArrayRef;
  CTFontDescriptorMatchingState = LongWord;
  CTFontDescriptorProgressHandler = function
    (param1: CTFontDescriptorMatchingState; param2: CFDictionaryRef)
    : Integer; cdecl;
  CFTypeRef = Pointer;
  PCFTypeRef = ^CFTypeRef;
  CTFontRef = Pointer;
  PCTFontRef = ^CTFontRef;
  CFOptionFlags = LongWord;
  PCFOptionFlags = ^CFOptionFlags;

  CTFontOptions = CFOptionFlags;
  CTFontUIFontType = LongWord;
  CFIndex = LongInt;
  PCFIndex = ^CFIndex;

  CFRange = record
    location: CFIndex;
    length: CFIndex;
  end;

  PCFRange = ^CFRange;

  CGAffineTransform = record
    a: CGFloat;
    b: CGFloat;
    c: CGFloat;
    d: CGFloat;
    tx: CGFloat;
    ty: CGFloat;
  end;

  PCGAffineTransform = ^CGAffineTransform;

  CFCharacterSetRef = Pointer;
  PCFCharacterSetRef = ^CFCharacterSetRef;
  CFStringEncoding = UInt32;
  PCFStringEncoding = ^CFStringEncoding;
  UniChar = UInt16;
  PUniChar = ^UniChar;
  CGFontIndex = Word;
  PCGFontIndex = ^CGFontIndex;

  CGGlyph = CGFontIndex;
  PCGGlyph = ^CGGlyph;

  CGPoint = record
    x: CGFloat;
    y: CGFloat;
  end;

  PCGPoint = ^CGPoint;

  CGSize = record
    width: CGFloat;
    height: CGFloat;
  end;

  PCGSize = ^CGSize;

  CGRect = record
    origin: CGPoint;
    size: CGSize;
  end;

  PCGRect = ^CGRect;

  CGPathRef = Pointer;
  PCGPathRef = ^CGPathRef;
  CGFontRef = Pointer;
  PCGFontRef = ^CGFontRef;
  ATSFontRef = UInt32;
  PATSFontRef = ^ATSFontRef;
  ConstStr255Param = PByte;
  PConstStr255Param = ^ConstStr255Param;
  FourCharCode = UInt32;
  PFourCharCode = ^FourCharCode;
  CTFontTableTag = FourCharCode;
  PCTFontTableTag = ^CTFontTableTag;
  CTFontTableOptions = LongWord;
  CFDataRef = Pointer;
  PCFDataRef = ^CFDataRef;
  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  CGContextRef = Pointer;
  PCGContextRef = ^CGContextRef;
  CTFontCollectionRef = Pointer;
  PCTFontCollectionRef = ^CTFontCollectionRef;
  CTMutableFontCollectionRef = Pointer;
  PCTMutableFontCollectionRef = ^CTMutableFontCollectionRef;
  CFComparisonResult = CFIndex;
  CTFontCollectionSortDescriptorsCallback = function
    (param1: CTFontDescriptorRef; param2: CTFontDescriptorRef; param3: Pointer)
    : CFComparisonResult; cdecl;
  PCTFontCollectionSortDescriptorsCallback = ^
    CTFontCollectionSortDescriptorsCallback;
  CTFontCollectionCopyOptions = LongWord;
  CTFontManagerError = CFIndex;
  CFURLRef = Pointer;
  PCFURLRef = ^CFURLRef;
  CTFontManagerScope = LongWord;
  TCoreTextRegistrationHandler = function(param1: CFArrayRef; param2: Integer)
    : Integer; cdecl;
  CFBundleRef = Pointer;
  PCFBundleRef = ^CFBundleRef;
  TCoreTextCompletionHandler = procedure(param1: CFArrayRef) of object;
  __int32_t = Integer;
  P__int32_t = ^__int32_t;

  __darwin_pid_t = __int32_t;
  P__darwin_pid_t = ^__darwin_pid_t;
  TCoreTextCreateMatchesCallback = function(param1: CFDictionaryRef;
    param2: Pointer { pid_t } ): CFArrayRef; cdecl;
  CFRunLoopSourceRef = Pointer;
  PCFRunLoopSourceRef = ^CFRunLoopSourceRef;
  CTFontManagerAutoActivationSetting = LongWord;
  CTFrameRef = Pointer;
  PCTFrameRef = ^CTFrameRef;
  CTFrameProgression = LongWord;
  CTFramePathFillRule = LongWord;
  CTLineRef = Pointer;
  PCTLineRef = ^CTLineRef;
  CTLineBoundsOptions = CFOptionFlags;
  CTLineTruncationType = LongWord;
  CFAttributedStringRef = Pointer;
  PCFAttributedStringRef = ^CFAttributedStringRef;
  TCoreTextBlock = procedure(param1: Double; param2: CFIndex; param3: Integer;
    param4: PInteger) of object;
  CTTypesetterRef = Pointer;
  PCTTypesetterRef = ^CTTypesetterRef;
  CTFramesetterRef = Pointer;
  PCTFramesetterRef = ^CTFramesetterRef;
  CTGlyphInfoRef = Pointer;
  PCTGlyphInfoRef = ^CTGlyphInfoRef;
  CTCharacterCollection = Word;
  CTParagraphStyleRef = Pointer;
  PCTParagraphStyleRef = ^CTParagraphStyleRef;
  CTTextAlignment = Byte;
  CTLineBreakMode = Byte;
  CTWritingDirection = Int8;
  CTParagraphStyleSpecifier = LongWord;

  CTParagraphStyleSetting = record
    spec: CTParagraphStyleSpecifier;
    valueSize: LongWord;
    value: Pointer;
  end;

  PCTParagraphStyleSetting = ^CTParagraphStyleSetting;

  CTRubyAnnotationRef = Pointer;
  PCTRubyAnnotationRef = ^CTRubyAnnotationRef;
  CTRubyAlignment = Byte;
  CTRubyOverhang = Byte;
  CTRubyPosition = Byte;
  CTRunRef = Pointer;
  PCTRunRef = ^CTRunRef;
  CTRunStatus = LongWord;
  CTRunDelegateRef = Pointer;
  PCTRunDelegateRef = ^CTRunDelegateRef;
  CTRunDelegateDeallocateCallback = procedure(param1: Pointer); cdecl;
  PCTRunDelegateDeallocateCallback = ^CTRunDelegateDeallocateCallback;
  CTRunDelegateGetAscentCallback = function(param1: Pointer): CGFloat; cdecl;
  PCTRunDelegateGetAscentCallback = ^CTRunDelegateGetAscentCallback;
  CTRunDelegateGetDescentCallback = function(param1: Pointer): CGFloat; cdecl;
  PCTRunDelegateGetDescentCallback = ^CTRunDelegateGetDescentCallback;
  CTRunDelegateGetWidthCallback = function(param1: Pointer): CGFloat; cdecl;
  PCTRunDelegateGetWidthCallback = ^CTRunDelegateGetWidthCallback;

  CTRunDelegateCallbacks = record
    version: CFIndex;
    dealloc: CTRunDelegateDeallocateCallback;
    getAscent: CTRunDelegateGetAscentCallback;
    getDescent: CTRunDelegateGetDescentCallback;
    getWidth: CTRunDelegateGetWidthCallback;
  end;

  PCTRunDelegateCallbacks = ^CTRunDelegateCallbacks;

  CTUnderlineStyle = Int32;
  CTUnderlineStyleModifiers = Int32;
  CTTextTabRef = Pointer;
  PCTTextTabRef = ^CTTextTabRef;
  SFNTLookupTableFormat = UInt16;
  PSFNTLookupTableFormat = ^SFNTLookupTableFormat;
  SFNTLookupValue = UInt16;
  PSFNTLookupValue = ^SFNTLookupValue;
  SFNTLookupOffset = UInt16;
  PSFNTLookupOffset = ^SFNTLookupOffset;
  SFNTLookupKind = UInt32;
  PSFNTLookupKind = ^SFNTLookupKind;

  SFNTLookupBinarySearchHeader = record
    unitSize: UInt16;
    nUnits: UInt16;
    searchRange: UInt16;
    entrySelector: UInt16;
    rangeShift: UInt16;
  end;

  PSFNTLookupBinarySearchHeader = ^SFNTLookupBinarySearchHeader;

  SFNTLookupArrayHeader = record
    lookupValues: array [0 .. 0] of SFNTLookupValue;
  end;

  PSFNTLookupArrayHeader = ^SFNTLookupArrayHeader;

  SFNTLookupTrimmedArrayHeader = record
    firstGlyph: UInt16;
    count: UInt16;
    valueArray: array [0 .. 0] of SFNTLookupValue;
  end;

  PSFNTLookupTrimmedArrayHeader = ^SFNTLookupTrimmedArrayHeader;

  SFNTLookupVectorHeader = record
    valueSize: UInt16;
    firstGlyph: UInt16;
    count: UInt16;
    values: array [0 .. 0] of Byte;
  end;

  PSFNTLookupVectorHeader = ^SFNTLookupVectorHeader;

  SFNTLookupSegment = record
    lastGlyph: UInt16;
    firstGlyph: UInt16;
    value: array [0 .. 0] of UInt16;
  end;

  PSFNTLookupSegment = ^SFNTLookupSegment;

  SFNTLookupSegmentHeader = record
    binSearch: SFNTLookupBinarySearchHeader;
    segments: array [0 .. 0] of SFNTLookupSegment;
  end;

  PSFNTLookupSegmentHeader = ^SFNTLookupSegmentHeader;

  SFNTLookupSingle = record
    glyph: UInt16;
    value: array [0 .. 0] of UInt16;
  end;

  PSFNTLookupSingle = ^SFNTLookupSingle;

  SFNTLookupSingleHeader = record
    binSearch: SFNTLookupBinarySearchHeader;
    entries: array [0 .. 0] of SFNTLookupSingle;
  end;

  PSFNTLookupSingleHeader = ^SFNTLookupSingleHeader;

  SFNTLookupFormatSpecificHeader = record
    case Integer of
      0:
        (theArray: SFNTLookupArrayHeader);
      1:
        (segment: SFNTLookupSegmentHeader);
      2:
        (Single: SFNTLookupSingleHeader);
      3:
        (trimmedArray: SFNTLookupTrimmedArrayHeader);
      4:
        (vector: SFNTLookupVectorHeader);
  end;

  PSFNTLookupFormatSpecificHeader = ^SFNTLookupFormatSpecificHeader;

  SFNTLookupTable = record
    format: SFNTLookupTableFormat;
    fsHeader: SFNTLookupFormatSpecificHeader;
  end;

  PSFNTLookupTable = ^SFNTLookupTable;

  SFNTLookupTablePtr = PSFNTLookupTable;
  PSFNTLookupTablePtr = ^SFNTLookupTablePtr;
  SFNTLookupTableHandle = PSFNTLookupTablePtr;
  PSFNTLookupTableHandle = ^SFNTLookupTableHandle;
  STClass = Byte;
  PSTClass = ^STClass;
  STEntryIndex = Byte;
  PSTEntryIndex = ^STEntryIndex;

  STHeader = record
    filler: Byte;
    nClasses: STClass;
    classTableOffset: UInt16;
    stateArrayOffset: UInt16;
    entryTableOffset: UInt16;
  end;

  PSTHeader = ^STHeader;

  STClassTable = record
    firstGlyph: UInt16;
    nGlyphs: UInt16;
    classes: array [0 .. 0] of STClass;
  end;

  PSTClassTable = ^STClassTable;

  STEntryZero = record
    newState: UInt16;
    flags: UInt16;
  end;

  PSTEntryZero = ^STEntryZero;

  STEntryOne = record
    newState: UInt16;
    flags: UInt16;
    offset1: UInt16;
  end;

  PSTEntryOne = ^STEntryOne;

  STEntryTwo = record
    newState: UInt16;
    flags: UInt16;
    offset1: UInt16;
    offset2: UInt16;
  end;

  PSTEntryTwo = ^STEntryTwo;

  STXClass = UInt16;
  PSTXClass = ^STXClass;
  STXStateIndex = UInt16;
  PSTXStateIndex = ^STXStateIndex;
  STXEntryIndex = UInt16;
  PSTXEntryIndex = ^STXEntryIndex;

  STXHeader = record
    nClasses: UInt32;
    classTableOffset: UInt32;
    stateArrayOffset: UInt32;
    entryTableOffset: UInt32;
  end;

  PSTXHeader = ^STXHeader;

  STXClassTable = SFNTLookupTable;

  STXEntryZero = record
    newState: STXStateIndex;
    flags: UInt16;
  end;

  PSTXEntryZero = ^STXEntryZero;

  STXEntryOne = record
    newState: STXStateIndex;
    flags: UInt16;
    index1: UInt16;
  end;

  PSTXEntryOne = ^STXEntryOne;

  STXEntryTwo = record
    newState: STXStateIndex;
    flags: UInt16;
    index1: UInt16;
    index2: UInt16;
  end;

  PSTXEntryTwo = ^STXEntryTwo;

  LcarCaretClassEntry = record
    count: UInt16;
    partials: array [0 .. 0] of UInt16;
  end;

  PLcarCaretClassEntry = ^LcarCaretClassEntry;

  LcarCaretTable = record
    version: Integer;
    format: UInt16;
    lookup: SFNTLookupTable;
  end;

  PLcarCaretTable = ^LcarCaretTable;

  LcarCaretTablePtr = PLcarCaretTable;
  PLcarCaretTablePtr = ^LcarCaretTablePtr;
  JustPCActionType = UInt16;
  PJustPCActionType = ^JustPCActionType;
  JustificationFlags = UInt16;
  PJustificationFlags = ^JustificationFlags;

  JustPCDecompositionAction = record
    lowerLimit: Integer;
    upperLimit: Integer;
    order: UInt16;
    count: UInt16;
    glyphs: array [0 .. 0] of UInt16;
  end;

  PJustPCDecompositionAction = ^JustPCDecompositionAction;

  JustPCUnconditionalAddAction = UInt16;
  PJustPCUnconditionalAddAction = ^JustPCUnconditionalAddAction;

  JustPCConditionalAddAction = record
    substThreshold: Integer;
    addGlyph: UInt16;
    substGlyph: UInt16;
  end;

  PJustPCConditionalAddAction = ^JustPCConditionalAddAction;

  JustPCDuctilityAction = record
    ductilityAxis: UInt32;
    minimumLimit: Integer;
    noStretchValue: Integer;
    maximumLimit: Integer;
  end;

  PJustPCDuctilityAction = ^JustPCDuctilityAction;

  JustPCGlyphRepeatAddAction = record
    flags: UInt16;
    glyph: UInt16;
  end;

  PJustPCGlyphRepeatAddAction = ^JustPCGlyphRepeatAddAction;

  JustPCActionSubrecord = record
    theClass: UInt16;
    theType: JustPCActionType;
    length: UInt32;
    data: UInt32;
  end;

  PJustPCActionSubrecord = ^JustPCActionSubrecord;

  JustPCAction = record
    actionCount: UInt32;
    actions: array [0 .. 0] of JustPCActionSubrecord;
  end;

  PJustPCAction = ^JustPCAction;

  JustWidthDeltaEntry = record
    justClass: UInt32;
    beforeGrowLimit: Integer;
    beforeShrinkLimit: Integer;
    afterGrowLimit: Integer;
    afterShrinkLimit: Integer;
    growFlags: JustificationFlags;
    shrinkFlags: JustificationFlags;
  end;

  PJustWidthDeltaEntry = ^JustWidthDeltaEntry;

  JustWidthDeltaGroup = record
    count: UInt32;
    entries: array [0 .. 0] of JustWidthDeltaEntry;
  end;

  PJustWidthDeltaGroup = ^JustWidthDeltaGroup;

  JustPostcompTable = record
    lookupTable: SFNTLookupTable;
  end;

  PJustPostcompTable = ^JustPostcompTable;

  JustDirectionTable = record
    justClass: UInt16;
    widthDeltaClusters: UInt16;
    postcomp: UInt16;
    lookup: SFNTLookupTable;
  end;

  PJustDirectionTable = ^JustDirectionTable;

  JustTable = record
    version: Integer;
    format: UInt16;
    horizHeaderOffset: UInt16;
    vertHeaderOffset: UInt16;
  end;

  PJustTable = ^JustTable;

  OpbdTableFormat = UInt16;
  POpbdTableFormat = ^OpbdTableFormat;

  OpbdSideValues = record
    leftSideShift: Int16;
    topSideShift: Int16;
    rightSideShift: Int16;
    bottomSideShift: Int16;
  end;

  POpbdSideValues = ^OpbdSideValues;

  OpbdTable = record
    version: Integer;
    format: OpbdTableFormat;
    lookupTable: SFNTLookupTable;
  end;

  POpbdTable = ^OpbdTable;

  MortSubtableMaskFlags = UInt32;
  PMortSubtableMaskFlags = ^MortSubtableMaskFlags;
  MortLigatureActionEntry = UInt32;
  PMortLigatureActionEntry = ^MortLigatureActionEntry;

  MortRearrangementSubtable = record
    header: STHeader;
  end;

  PMortRearrangementSubtable = ^MortRearrangementSubtable;

  MortContextualSubtable = record
    header: STHeader;
    substitutionTableOffset: UInt16;
  end;

  PMortContextualSubtable = ^MortContextualSubtable;

  MortLigatureSubtable = record
    header: STHeader;
    ligatureActionTableOffset: UInt16;
    componentTableOffset: UInt16;
    ligatureTableOffset: UInt16;
  end;

  PMortLigatureSubtable = ^MortLigatureSubtable;

  MortSwashSubtable = record
    lookup: SFNTLookupTable;
  end;

  PMortSwashSubtable = ^MortSwashSubtable;

  MortInsertionSubtable = record
    header: STHeader;
  end;

  PMortInsertionSubtable = ^MortInsertionSubtable;

  MortSpecificSubtable = record
    case Integer of
      0:
        (rearrangement: MortRearrangementSubtable);
      1:
        (contextual: MortContextualSubtable);
      2:
        (ligature: MortLigatureSubtable);
      3:
        (swash: MortSwashSubtable);
      4:
        (insertion: MortInsertionSubtable);
  end;

  PMortSpecificSubtable = ^MortSpecificSubtable;

  MortSubtable = record
    length: UInt16;
    coverage: UInt16;
    flags: MortSubtableMaskFlags;
    u: MortSpecificSubtable;
  end;

  PMortSubtable = ^MortSubtable;

  MortFeatureEntry = record
    featureType: UInt16;
    featureSelector: UInt16;
    enableFlags: MortSubtableMaskFlags;
    disableFlags: MortSubtableMaskFlags;
  end;

  PMortFeatureEntry = ^MortFeatureEntry;

  MortChain = record
    defaultFlags: MortSubtableMaskFlags;
    length: UInt32;
    nFeatures: UInt16;
    nSubtables: UInt16;
    featureEntries: array [0 .. 0] of MortFeatureEntry;
  end;

  PMortChain = ^MortChain;

  MortTable = record
    version: Integer;
    nChains: UInt32;
    chains: array [0 .. 0] of MortChain;
  end;

  PMortTable = ^MortTable;

  MorxRearrangementSubtable = record
    header: STXHeader;
  end;

  PMorxRearrangementSubtable = ^MorxRearrangementSubtable;

  MorxContextualSubtable = record
    header: STXHeader;
    substitutionTableOffset: UInt32;
  end;

  PMorxContextualSubtable = ^MorxContextualSubtable;

  MorxLigatureSubtable = record
    header: STXHeader;
    ligatureActionTableOffset: UInt32;
    componentTableOffset: UInt32;
    ligatureTableOffset: UInt32;
  end;

  PMorxLigatureSubtable = ^MorxLigatureSubtable;

  MorxInsertionSubtable = record
    header: STXHeader;
    insertionGlyphTableOffset: UInt32;
  end;

  PMorxInsertionSubtable = ^MorxInsertionSubtable;

  MorxSpecificSubtable = record
    case Integer of
      0:
        (rearrangement: MorxRearrangementSubtable);
      1:
        (contextual: MorxContextualSubtable);
      2:
        (ligature: MorxLigatureSubtable);
      3:
        (swash: MortSwashSubtable);
      4:
        (insertion: MorxInsertionSubtable);
  end;

  PMorxSpecificSubtable = ^MorxSpecificSubtable;

  MorxSubtable = record
    length: UInt32;
    coverage: UInt32;
    flags: MortSubtableMaskFlags;
    u: MorxSpecificSubtable;
  end;

  PMorxSubtable = ^MorxSubtable;

  MorxChain = record
    defaultFlags: MortSubtableMaskFlags;
    length: UInt32;
    nFeatures: UInt32;
    nSubtables: UInt32;
    featureEntries: array [0 .. 0] of MortFeatureEntry;
  end;

  PMorxChain = ^MorxChain;

  MorxTable = record
    version: Integer;
    nChains: UInt32;
    chains: array [0 .. 0] of MorxChain;
  end;

  PMorxTable = ^MorxTable;

  PropCharProperties = UInt16;
  PPropCharProperties = ^PropCharProperties;

  PropTable = record
    version: Integer;
    format: UInt16;
    defaultProps: PropCharProperties;
    lookup: SFNTLookupTable;
  end;

  PPropTable = ^PropTable;

  PropLookupSegment = record
    lastGlyph: UInt16;
    firstGlyph: UInt16;
    value: UInt16;
  end;

  PPropLookupSegment = ^PropLookupSegment;

  PropLookupSingle = record
    glyph: UInt16;
    props: PropCharProperties;
  end;

  PPropLookupSingle = ^PropLookupSingle;

  TrakValue = Int16;
  PTrakValue = ^TrakValue;

  TrakTableEntry = record
    track: Integer;
    nameTableIndex: UInt16;
    sizesOffset: UInt16;
  end;

  PTrakTableEntry = ^TrakTableEntry;

  TrakTableData = record
    nTracks: UInt16;
    nSizes: UInt16;
    sizeTableOffset: UInt32;
    trakTable: array [0 .. 0] of TrakTableEntry;
  end;

  PTrakTableData = ^TrakTableData;

  trakTable = record
    version: Integer;
    format: UInt16;
    horizOffset: UInt16;
    vertOffset: UInt16;
  end;

  PTrakTable = ^trakTable;

  KernTableFormat = Byte;
  PKernTableFormat = ^KernTableFormat;
  KernSubtableInfo = UInt16;
  PKernSubtableInfo = ^KernSubtableInfo;
  KernKerningValue = Int16;
  PKernKerningValue = ^KernKerningValue;
  KernArrayOffset = UInt16;
  PKernArrayOffset = ^KernArrayOffset;

  KernVersion0Header = record
    version: UInt16;
    nTables: UInt16;
    firstSubtable: array [0 .. 0] of UInt16;
  end;

  PKernVersion0Header = ^KernVersion0Header;

  KernTableHeader = record
    version: Integer;
    nTables: Int32;
    firstSubtable: array [0 .. 0] of UInt16;
  end;

  PKernTableHeader = ^KernTableHeader;

  KernTableHeaderPtr = PKernTableHeader;
  PKernTableHeaderPtr = ^KernTableHeaderPtr;
  KernTableHeaderHandle = PKernTableHeaderPtr;
  PKernTableHeaderHandle = ^KernTableHeaderHandle;

  KernKerningPair = record
    left: UInt16;
    right: UInt16;
  end;

  PKernKerningPair = ^KernKerningPair;

  KernOrderedListEntry = record
    pair: KernKerningPair;
    value: KernKerningValue;
  end;

  PKernOrderedListEntry = ^KernOrderedListEntry;

  KernOrderedListEntryPtr = PKernOrderedListEntry;
  PKernOrderedListEntryPtr = ^KernOrderedListEntryPtr;

  KernOrderedListHeader = record
    nPairs: UInt16;
    searchRange: UInt16;
    entrySelector: UInt16;
    rangeShift: UInt16;
    table: array [0 .. 0] of UInt16;
  end;

  PKernOrderedListHeader = ^KernOrderedListHeader;

  KernStateHeader = record
    header: STHeader;
    valueTable: UInt16;
    firstTable: array [0 .. 0] of Byte;
  end;

  PKernStateHeader = ^KernStateHeader;

  KernStateEntry = record
    newState: UInt16;
    flags: UInt16;
  end;

  PKernStateEntry = ^KernStateEntry;

  KernOffsetTable = record
    firstGlyph: UInt16;
    nGlyphs: UInt16;
    offsetTable: array [0 .. 0] of KernArrayOffset;
  end;

  PKernOffsetTable = ^KernOffsetTable;

  KernOffsetTablePtr = PKernOffsetTable;
  PKernOffsetTablePtr = ^KernOffsetTablePtr;

  KernSimpleArrayHeader = record
    rowWidth: UInt16;
    leftOffsetTable: UInt16;
    rightOffsetTable: UInt16;
    theArray: KernArrayOffset;
    firstTable: array [0 .. 0] of UInt16;
  end;

  PKernSimpleArrayHeader = ^KernSimpleArrayHeader;

  KernIndexArrayHeader = record
    glyphCount: UInt16;
    kernValueCount: Byte;
    leftClassCount: Byte;
    rightClassCount: Byte;
    flags: Byte;
    kernValue: array [0 .. 0] of Int16;
    leftClass: array [0 .. 0] of Byte;
    rightClass: array [0 .. 0] of Byte;
    kernIndex: array [0 .. 0] of Byte;
  end;

  PKernIndexArrayHeader = ^KernIndexArrayHeader;

  KernFormatSpecificHeader = record
    case Integer of
      0:
        (orderedList: KernOrderedListHeader);
      1:
        (stateTable: KernStateHeader);
      2:
        (simpleArray: KernSimpleArrayHeader);
      3:
        (indexArray: KernIndexArrayHeader);
  end;

  PKernFormatSpecificHeader = ^KernFormatSpecificHeader;

  KernVersion0SubtableHeader = record
    version: UInt16;
    length: UInt16;
    stInfo: KernSubtableInfo;
    fsHeader: KernFormatSpecificHeader;
  end;

  PKernVersion0SubtableHeader = ^KernVersion0SubtableHeader;

  KernSubtableHeader = record
    length: Int32;
    stInfo: KernSubtableInfo;
    tupleIndex: Int16;
    fsHeader: KernFormatSpecificHeader;
  end;

  PKernSubtableHeader = ^KernSubtableHeader;

  KernSubtableHeaderPtr = PKernSubtableHeader;
  PKernSubtableHeaderPtr = ^KernSubtableHeaderPtr;
  KerxSubtableCoverage = UInt32;
  PKerxSubtableCoverage = ^KerxSubtableCoverage;
  KerxArrayOffset = UInt32;
  PKerxArrayOffset = ^KerxArrayOffset;

  KerxTableHeader = record
    version: Integer;
    nTables: UInt32;
    firstSubtable: array [0 .. 0] of UInt32;
  end;

  PKerxTableHeader = ^KerxTableHeader;

  KerxTableHeaderPtr = PKerxTableHeader;
  PKerxTableHeaderPtr = ^KerxTableHeaderPtr;
  KerxTableHeaderHandle = PKerxTableHeaderPtr;
  PKerxTableHeaderHandle = ^KerxTableHeaderHandle;

  KerxKerningPair = record
    left: UInt16;
    right: UInt16;
  end;

  PKerxKerningPair = ^KerxKerningPair;

  KerxOrderedListEntry = record
    pair: KerxKerningPair;
    value: KernKerningValue;
  end;

  PKerxOrderedListEntry = ^KerxOrderedListEntry;

  KerxOrderedListEntryPtr = PKerxOrderedListEntry;
  PKerxOrderedListEntryPtr = ^KerxOrderedListEntryPtr;

  KerxOrderedListHeader = record
    nPairs: UInt32;
    searchRange: UInt32;
    entrySelector: UInt32;
    rangeShift: UInt32;
    table: array [0 .. 0] of UInt32;
  end;

  PKerxOrderedListHeader = ^KerxOrderedListHeader;

  KerxStateHeader = record
    header: STXHeader;
    valueTable: UInt32;
    firstTable: array [0 .. 0] of Byte;
  end;

  PKerxStateHeader = ^KerxStateHeader;

  KerxStateEntry = record
    newState: UInt16;
    flags: UInt16;
    valueIndex: UInt16;
  end;

  PKerxStateEntry = ^KerxStateEntry;

  KerxControlPointHeader = record
    header: STXHeader;
    flags: UInt32;
    firstTable: array [0 .. 0] of Byte;
  end;

  PKerxControlPointHeader = ^KerxControlPointHeader;

  KerxControlPointEntry = record
    newState: UInt16;
    flags: UInt16;
    actionIndex: UInt16;
  end;

  PKerxControlPointEntry = ^KerxControlPointEntry;

  KerxControlPointAction = record
    markControlPoint: UInt16;
    currControlPoint: UInt16;
  end;

  PKerxControlPointAction = ^KerxControlPointAction;

  KerxAnchorPointAction = record
    markAnchorPoint: UInt16;
    currAnchorPoint: UInt16;
  end;

  PKerxAnchorPointAction = ^KerxAnchorPointAction;

  KerxCoordinateAction = record
    markX: UInt16;
    markY: UInt16;
    currX: UInt16;
    currY: UInt16;
  end;

  PKerxCoordinateAction = ^KerxCoordinateAction;

  KerxSimpleArrayHeader = record
    rowWidth: UInt32;
    leftOffsetTable: UInt32;
    rightOffsetTable: UInt32;
    theArray: KerxArrayOffset;
    firstTable: array [0 .. 0] of UInt32;
  end;

  PKerxSimpleArrayHeader = ^KerxSimpleArrayHeader;

  KerxIndexArrayHeader = record
    flags: UInt32;
    rowCount: UInt16;
    columnCount: UInt16;
    rowIndexTableOffset: UInt32;
    columnIndexTableOffset: UInt32;
    kerningArrayOffset: UInt32;
    kerningVectorOffset: UInt32;
  end;

  PKerxIndexArrayHeader = ^KerxIndexArrayHeader;

  KerxFormatSpecificHeader = record
    case Integer of
      0:
        (orderedList: KerxOrderedListHeader);
      1:
        (stateTable: KerxStateHeader);
      2:
        (simpleArray: KerxSimpleArrayHeader);
      3:
        (indexArray: KerxIndexArrayHeader);
      4:
        (controlPoint: KerxControlPointHeader);
  end;

  PKerxFormatSpecificHeader = ^KerxFormatSpecificHeader;

  KerxSubtableHeader = record
    length: UInt32;
    stInfo: KerxSubtableCoverage;
    tupleCount: UInt32;
    fsHeader: KerxFormatSpecificHeader;
  end;

  PKerxSubtableHeader = ^KerxSubtableHeader;

  KerxSubtableHeaderPtr = PKerxSubtableHeader;
  PKerxSubtableHeaderPtr = ^KerxSubtableHeaderPtr;
  BslnBaselineClass = UInt32;
  PBslnBaselineClass = ^BslnBaselineClass;
  BslnBaselineRecord = array [0 .. 31] of Integer;
  PBslnBaselineRecord = ^BslnBaselineRecord;

  BslnFormat0Part = record
    deltas: array [0 .. 31] of Int16;
  end;

  PBslnFormat0Part = ^BslnFormat0Part;

  BslnFormat1Part = record
    deltas: array [0 .. 31] of Int16;
    mappingData: SFNTLookupTable;
  end;

  PBslnFormat1Part = ^BslnFormat1Part;

  BslnFormat2Part = record
    stdGlyph: UInt16;
    ctlPoints: array [0 .. 31] of Int16;
  end;

  PBslnFormat2Part = ^BslnFormat2Part;

  BslnFormat3Part = record
    stdGlyph: UInt16;
    ctlPoints: array [0 .. 31] of Int16;
    mappingData: SFNTLookupTable;
  end;

  PBslnFormat3Part = ^BslnFormat3Part;

  BslnFormatUnion = record
    case Integer of
      0:
        (fmt0Part: BslnFormat0Part);
      1:
        (fmt1Part: BslnFormat1Part);
      2:
        (fmt2Part: BslnFormat2Part);
      3:
        (fmt3Part: BslnFormat3Part);
  end;

  PBslnFormatUnion = ^BslnFormatUnion;

  BslnTableFormat = UInt16;
  PBslnTableFormat = ^BslnTableFormat;

  BslnTable = record
    version: Integer;
    format: BslnTableFormat;
    defaultBaseline: UInt16;
    parts: BslnFormatUnion;
  end;

  PBslnTable = ^BslnTable;

  BslnTablePtr = PBslnTable;
  PBslnTablePtr = ^BslnTablePtr;

  ALMXHeader = record
    version: Integer;
    flags: UInt16;
    NMasters: UInt16;
    firstGlyph: UInt16;
    lastGlyph: UInt16;
    lookup: SFNTLookupTable;
  end;

  PALMXHeader = ^ALMXHeader;

  ALMXGlyphEntry = record
    GlyphIndexOffset: Int16;
    HorizontalAdvance: Int16;
    XOffsetToHOrigin: Int16;
    VerticalAdvance: Int16;
    YOffsetToVOrigin: Int16;
  end;

  PALMXGlyphEntry = ^ALMXGlyphEntry;

  ROTAHeader = record
    version: Integer;
    flags: UInt16;
    NMasters: UInt16;
    firstGlyph: UInt16;
    lastGlyph: UInt16;
    lookup: SFNTLookupTable;
  end;

  PROTAHeader = ^ROTAHeader;

  ROTAGlyphEntry = record
    GlyphIndexOffset: Int16;
    HBaselineOffset: Int16;
    VBaselineOffset: Int16;
  end;

  PROTAGlyphEntry = ^ROTAGlyphEntry;

  AnchorPoint = record
    x: Int16;
    y: Int16;
  end;

  PAnchorPoint = ^AnchorPoint;

  AnchorPointTable = record
    nPoints: UInt32;
    points: array [0 .. 0] of AnchorPoint;
  end;

  PAnchorPointTable = ^AnchorPointTable;

  AnkrTable = record
    version: UInt16;
    flags: UInt16;
    lookupTableOffset: UInt32;
    anchorPointTableOffset: UInt32;
  end;

  PAnkrTable = ^AnkrTable;

  LtagStringRange = record
    offset: UInt16;
    length: UInt16;
  end;

  PLtagStringRange = ^LtagStringRange;

  LtagTable = record
    version: UInt32;
    flags: UInt32;
    numTags: UInt32;
    tagRange: array [0 .. 0] of LtagStringRange;
  end;

  PLtagTable = ^LtagTable;

  sfntDirectoryEntry = record
    tableTag: FourCharCode;
    checkSum: UInt32;
    offset: UInt32;
    length: UInt32;
  end;

  PsfntDirectoryEntry = ^sfntDirectoryEntry;

  sfntDirectory = record
    format: FourCharCode;
    numOffsets: UInt16;
    searchRange: UInt16;
    entrySelector: UInt16;
    rangeShift: UInt16;
    table: array [0 .. 0] of sfntDirectoryEntry;
  end;

  PsfntDirectory = ^sfntDirectory;

  sfntCMapSubHeader = record
    format: UInt16;
    length: UInt16;
    languageID: UInt16;
  end;

  PsfntCMapSubHeader = ^sfntCMapSubHeader;

  sfntCMapExtendedSubHeader = record
    format: UInt16;
    reserved: UInt16;
    length: UInt32;
    language: UInt32;
  end;

  PsfntCMapExtendedSubHeader = ^sfntCMapExtendedSubHeader;

  sfntCMapEncoding = record
    platformID: UInt16;
    scriptID: UInt16;
    offset: UInt32;
  end;

  PsfntCMapEncoding = ^sfntCMapEncoding;

  sfntCMapHeader = record
    version: UInt16;
    numTables: UInt16;
    encoding: array [0 .. 0] of sfntCMapEncoding;
  end;

  PsfntCMapHeader = ^sfntCMapHeader;

  sfntNameRecord = record
    platformID: UInt16;
    scriptID: UInt16;
    languageID: UInt16;
    nameID: UInt16;
    length: UInt16;
    offset: UInt16;
  end;

  PsfntNameRecord = ^sfntNameRecord;

  sfntNameHeader = record
    format: UInt16;
    count: UInt16;
    stringOffset: UInt16;
    rec: array [0 .. 0] of sfntNameRecord;
  end;

  PsfntNameHeader = ^sfntNameHeader;

  sfntVariationAxis = record
    axisTag: FourCharCode;
    minValue: Integer;
    defaultValue: Integer;
    maxValue: Integer;
    flags: Int16;
    nameID: Int16;
  end;

  PsfntVariationAxis = ^sfntVariationAxis;

  sfntInstance = record
    nameID: Int16;
    flags: Int16;
    coord: array [0 .. 0] of Integer;
  end;

  PsfntInstance = ^sfntInstance;

  sfntVariationHeader = record
    version: Integer;
    offsetToData: UInt16;
    countSizePairs: UInt16;
    axisCount: UInt16;
    axisSize: UInt16;
    instanceCount: UInt16;
    instanceSize: UInt16;
    axis: array [0 .. 0] of sfntVariationAxis;
    instance: array [0 .. 0] of sfntInstance;
  end;

  PsfntVariationHeader = ^sfntVariationHeader;

  sfntFontDescriptor = record
    name: FourCharCode;
    value: Integer;
  end;

  PsfntFontDescriptor = ^sfntFontDescriptor;

  sfntDescriptorHeader = record
    version: Integer;
    descriptorCount: Int32;
    descriptor: array [0 .. 0] of sfntFontDescriptor;
  end;

  PsfntDescriptorHeader = ^sfntDescriptorHeader;

  sfntFeatureName = record
    featureType: UInt16;
    settingCount: UInt16;
    offsetToSettings: Int32;
    featureFlags: UInt16;
    nameID: Int16;
  end;

  PsfntFeatureName = ^sfntFeatureName;

  sfntFontFeatureSetting = record
    setting: UInt16;
    nameID: Int16;
  end;

  PsfntFontFeatureSetting = ^sfntFontFeatureSetting;

  sfntFontRunFeature = record
    featureType: UInt16;
    setting: UInt16;
  end;

  PsfntFontRunFeature = ^sfntFontRunFeature;

  sfntFeatureHeader = record
    version: Int32;
    featureNameCount: UInt16;
    featureSetCount: UInt16;
    reserved: Int32;
    names: array [0 .. 0] of sfntFeatureName;
    settings: array [0 .. 0] of sfntFontFeatureSetting;
    runs: array [0 .. 0] of sfntFontRunFeature;
  end;

  PsfntFeatureHeader = ^sfntFeatureHeader;

  FontNameCode = UInt32;
  PFontNameCode = ^FontNameCode;
  FontPlatformCode = UInt32;
  PFontPlatformCode = ^FontPlatformCode;
  FontScriptCode = UInt32;
  PFontScriptCode = ^FontScriptCode;
  FontLanguageCode = UInt32;
  PFontLanguageCode = ^FontLanguageCode;

  FontVariation = record
    name: FourCharCode;
    value: Integer;
  end;

  PFontVariation = ^FontVariation;

  // ===== Exported string consts =====

function kCTFontSymbolicTrait: Pointer;
function kCTFontWeightTrait: Pointer;
function kCTFontWidthTrait: Pointer;
function kCTFontSlantTrait: Pointer;
function kCTFontURLAttribute: Pointer;
function kCTFontNameAttribute: Pointer;
function kCTFontDisplayNameAttribute: Pointer;
function kCTFontFamilyNameAttribute: Pointer;
function kCTFontStyleNameAttribute: Pointer;
function kCTFontTraitsAttribute: Pointer;
function kCTFontVariationAttribute: Pointer;
function kCTFontVariationAxesAttribute: Pointer;
function kCTFontSizeAttribute: Pointer;
function kCTFontMatrixAttribute: Pointer;
function kCTFontCascadeListAttribute: Pointer;
function kCTFontCharacterSetAttribute: Pointer;
function kCTFontLanguagesAttribute: Pointer;
function kCTFontBaselineAdjustAttribute: Pointer;
function kCTFontMacintoshEncodingsAttribute: Pointer;
function kCTFontFeaturesAttribute: Pointer;
function kCTFontFeatureSettingsAttribute: Pointer;
function kCTFontFixedAdvanceAttribute: Pointer;
function kCTFontOrientationAttribute: Pointer;
function kCTFontFormatAttribute: Pointer;
function kCTFontRegistrationScopeAttribute: Pointer;
function kCTFontPriorityAttribute: Pointer;
function kCTFontEnabledAttribute: Pointer;
function kCTFontDownloadableAttribute: Pointer;
function kCTFontDownloadedAttribute: Pointer;
function kCTFontOpticalSizeAttribute: Pointer;
function kCTFontDescriptorMatchingSourceDescriptor: Pointer;
function kCTFontDescriptorMatchingDescriptors: Pointer;
function kCTFontDescriptorMatchingResult: Pointer;
function kCTFontDescriptorMatchingPercentage: Pointer;
function kCTFontDescriptorMatchingCurrentAssetSize: Pointer;
function kCTFontDescriptorMatchingTotalDownloadedSize: Pointer;
function kCTFontDescriptorMatchingTotalAssetSize: Pointer;
function kCTFontDescriptorMatchingError: Pointer;
function kCTFontCopyrightNameKey: Pointer;
function kCTFontFamilyNameKey: Pointer;
function kCTFontSubFamilyNameKey: Pointer;
function kCTFontStyleNameKey: Pointer;
function kCTFontUniqueNameKey: Pointer;
function kCTFontFullNameKey: Pointer;
function kCTFontVersionNameKey: Pointer;
function kCTFontPostScriptNameKey: Pointer;
function kCTFontTrademarkNameKey: Pointer;
function kCTFontManufacturerNameKey: Pointer;
function kCTFontDesignerNameKey: Pointer;
function kCTFontDescriptionNameKey: Pointer;
function kCTFontVendorURLNameKey: Pointer;
function kCTFontDesignerURLNameKey: Pointer;
function kCTFontLicenseNameKey: Pointer;
function kCTFontLicenseURLNameKey: Pointer;
function kCTFontSampleTextNameKey: Pointer;
function kCTFontPostScriptCIDNameKey: Pointer;
function kCTFontVariationAxisIdentifierKey: Pointer;
function kCTFontVariationAxisMinimumValueKey: Pointer;
function kCTFontVariationAxisMaximumValueKey: Pointer;
function kCTFontVariationAxisDefaultValueKey: Pointer;
function kCTFontVariationAxisNameKey: Pointer;
function kCTFontVariationAxisHiddenKey: Pointer;
function kCTFontOpenTypeFeatureTag: Pointer;
function kCTFontOpenTypeFeatureValue: Pointer;
function kCTFontFeatureTypeIdentifierKey: Pointer;
function kCTFontFeatureTypeNameKey: Pointer;
function kCTFontFeatureTypeExclusiveKey: Pointer;
function kCTFontFeatureTypeSelectorsKey: Pointer;
function kCTFontFeatureSelectorIdentifierKey: Pointer;
function kCTFontFeatureSelectorNameKey: Pointer;
function kCTFontFeatureSelectorDefaultKey: Pointer;
function kCTFontFeatureSelectorSettingKey: Pointer;
function kCTFontFeatureSampleTextKey: Pointer;
function kCTFontFeatureTooltipTextKey: Pointer;
function kCTBaselineClassRoman: Pointer;
function kCTBaselineClassIdeographicCentered: Pointer;
function kCTBaselineClassIdeographicLow: Pointer;
function kCTBaselineClassIdeographicHigh: Pointer;
function kCTBaselineClassHanging: Pointer;
function kCTBaselineClassMath: Pointer;
function kCTBaselineReferenceFont: Pointer;
function kCTBaselineOriginalFont: Pointer;
function kCTFontCollectionRemoveDuplicatesOption: Pointer;
function kCTFontCollectionIncludeDisabledFontsOption: Pointer;
function kCTFontCollectionDisallowAutoActivationOption: Pointer;
function kCTFontManagerErrorDomain: Pointer;
function kCTFontManagerErrorFontURLsKey: Pointer;
function kCTFontManagerErrorFontDescriptorsKey: Pointer;
function kCTFontManagerErrorFontAssetNameKey: Pointer;
function kCTFontRegistrationUserInfoAttribute: Pointer;
function kCTFontManagerBundleIdentifier: Pointer;
function kCTFontManagerRegisteredFontsChangedNotification: Pointer;
function kCTFrameProgressionAttributeName: Pointer;
function kCTFramePathFillRuleAttributeName: Pointer;
function kCTFramePathWidthAttributeName: Pointer;
function kCTFrameClippingPathsAttributeName: Pointer;
function kCTFramePathClippingPathAttributeName: Pointer;
function kCTTypesetterOptionAllowUnboundedLayout: Pointer;
function kCTTypesetterOptionDisableBidiProcessing: Pointer;
function kCTTypesetterOptionForcedEmbeddingLevel: Pointer;
function kCTRubyAnnotationSizeFactorAttributeName: Pointer;
function kCTRubyAnnotationScaleToFitAttributeName: Pointer;
function kCTFontAttributeName: Pointer;
function kCTForegroundColorFromContextAttributeName: Pointer;
function kCTKernAttributeName: Pointer;
function kCTTrackingAttributeName: Pointer;
function kCTLigatureAttributeName: Pointer;
function kCTForegroundColorAttributeName: Pointer;
function kCTBackgroundColorAttributeName: Pointer;
function kCTParagraphStyleAttributeName: Pointer;
function kCTStrokeWidthAttributeName: Pointer;
function kCTStrokeColorAttributeName: Pointer;
function kCTUnderlineStyleAttributeName: Pointer;
function kCTSuperscriptAttributeName: Pointer;
function kCTUnderlineColorAttributeName: Pointer;
function kCTVerticalFormsAttributeName: Pointer;
function kCTHorizontalInVerticalFormsAttributeName: Pointer;
function kCTGlyphInfoAttributeName: Pointer;
function kCTCharacterShapeAttributeName: Pointer;
function kCTLanguageAttributeName: Pointer;
function kCTRunDelegateAttributeName: Pointer;
function kCTBaselineClassAttributeName: Pointer;
function kCTBaselineInfoAttributeName: Pointer;
function kCTBaselineReferenceInfoAttributeName: Pointer;
function kCTBaselineOffsetAttributeName: Pointer;
function kCTWritingDirectionAttributeName: Pointer;
function kCTRubyAnnotationAttributeName: Pointer;
function kCTTabColumnTerminatorsAttributeName: Pointer;


// ===== External functions =====

const
  libCoreText = '/System/Library/Frameworks/CoreText.framework/CoreText';
function CTFontDescriptorGetTypeID: CFTypeID; cdecl;
  external libCoreText name _PU + 'CTFontDescriptorGetTypeID';
function CTFontDescriptorCreateWithNameAndSize(name: CFStringRef; size: CGFloat)
  : CTFontDescriptorRef; cdecl;
  external libCoreText name _PU + 'CTFontDescriptorCreateWithNameAndSize';
function CTFontDescriptorCreateWithAttributes(attributes: CFDictionaryRef)
  : CTFontDescriptorRef; cdecl;
  external libCoreText name _PU + 'CTFontDescriptorCreateWithAttributes';
function CTFontDescriptorCreateCopyWithAttributes(original: CTFontDescriptorRef;
  attributes: CFDictionaryRef): CTFontDescriptorRef; cdecl;
  external libCoreText name _PU + 'CTFontDescriptorCreateCopyWithAttributes';
function CTFontDescriptorCreateCopyWithFamily(original: CTFontDescriptorRef;
  family: CFStringRef): CTFontDescriptorRef; cdecl;
  external libCoreText name _PU + 'CTFontDescriptorCreateCopyWithFamily';
function CTFontDescriptorCreateCopyWithSymbolicTraits
  (original: CTFontDescriptorRef; symTraitValue: CTFontSymbolicTraits;
  symTraitMask: CTFontSymbolicTraits): CTFontDescriptorRef; cdecl;
  external libCoreText name _PU +
  'CTFontDescriptorCreateCopyWithSymbolicTraits';
function CTFontDescriptorCreateCopyWithVariation(original: CTFontDescriptorRef;
  variationIdentifier: CFNumberRef; variationValue: CGFloat)
  : CTFontDescriptorRef; cdecl;
  external libCoreText name _PU + 'CTFontDescriptorCreateCopyWithVariation';
function CTFontDescriptorCreateCopyWithFeature(original: CTFontDescriptorRef;
  featureTypeIdentifier: CFNumberRef; featureSelectorIdentifier: CFNumberRef)
  : CTFontDescriptorRef; cdecl;
  external libCoreText name _PU + 'CTFontDescriptorCreateCopyWithFeature';
function CTFontDescriptorCreateMatchingFontDescriptors
  (descriptor: CTFontDescriptorRef; mandatoryAttributes: CFSetRef): CFArrayRef;
  cdecl; external libCoreText name _PU +
  'CTFontDescriptorCreateMatchingFontDescriptors';
function CTFontDescriptorCreateMatchingFontDescriptor
  (descriptor: CTFontDescriptorRef; mandatoryAttributes: CFSetRef)
  : CTFontDescriptorRef; cdecl;
  external libCoreText name _PU +
  'CTFontDescriptorCreateMatchingFontDescriptor';
function CTFontDescriptorMatchFontDescriptorsWithProgressHandler
  (descriptors: CFArrayRef; mandatoryAttributes: CFSetRef;
  progressBlock: CTFontDescriptorProgressHandler): Integer; cdecl;
  external libCoreText name _PU +
  'CTFontDescriptorMatchFontDescriptorsWithProgressHandler';
function CTFontDescriptorCopyAttributes(descriptor: CTFontDescriptorRef)
  : CFDictionaryRef; cdecl;
  external libCoreText name _PU + 'CTFontDescriptorCopyAttributes';
function CTFontDescriptorCopyAttribute(descriptor: CTFontDescriptorRef;
  attribute: CFStringRef): CFTypeRef; cdecl;
  external libCoreText name _PU + 'CTFontDescriptorCopyAttribute';
function CTFontDescriptorCopyLocalizedAttribute(descriptor: CTFontDescriptorRef;
  attribute: CFStringRef; language: PCFStringRef): CFTypeRef; cdecl;
  external libCoreText name _PU + 'CTFontDescriptorCopyLocalizedAttribute';
function CTFontGetTypeID: CFTypeID; cdecl;
  external libCoreText name _PU + 'CTFontGetTypeID';
function CTFontCreateWithName(name: CFStringRef; size: CGFloat; matrix: Pointer)
  : CTFontRef; cdecl; external libCoreText name _PU + 'CTFontCreateWithName';
function CTFontCreateWithFontDescriptor(descriptor: CTFontDescriptorRef;
  size: CGFloat; matrix: Pointer): CTFontRef; cdecl;
  external libCoreText name _PU + 'CTFontCreateWithFontDescriptor';
function CTFontCreateWithNameAndOptions(name: CFStringRef; size: CGFloat;
  matrix: Pointer; options: CTFontOptions): CTFontRef; cdecl;
  external libCoreText name _PU + 'CTFontCreateWithNameAndOptions';
function CTFontCreateWithFontDescriptorAndOptions
  (descriptor: CTFontDescriptorRef; size: CGFloat; matrix: Pointer;
  options: CTFontOptions): CTFontRef; cdecl;
  external libCoreText name _PU + 'CTFontCreateWithFontDescriptorAndOptions';
function CTFontCreateUIFontForLanguage(uiType: CTFontUIFontType; size: CGFloat;
  language: CFStringRef): CTFontRef; cdecl;
  external libCoreText name _PU + 'CTFontCreateUIFontForLanguage';
function CTFontCreateCopyWithAttributes(font: CTFontRef; size: CGFloat;
  matrix: Pointer; attributes: CTFontDescriptorRef): CTFontRef; cdecl;
  external libCoreText name _PU + 'CTFontCreateCopyWithAttributes';
function CTFontCreateCopyWithSymbolicTraits(font: CTFontRef; size: CGFloat;
  matrix: Pointer; symTraitValue: CTFontSymbolicTraits;
  symTraitMask: CTFontSymbolicTraits): CTFontRef; cdecl;
  external libCoreText name _PU + 'CTFontCreateCopyWithSymbolicTraits';
function CTFontCreateCopyWithFamily(font: CTFontRef; size: CGFloat;
  matrix: Pointer; family: CFStringRef): CTFontRef; cdecl;
  external libCoreText name _PU + 'CTFontCreateCopyWithFamily';
function CTFontCreateForString(currentFont: CTFontRef; &string: CFStringRef;
  range: CFRange): CTFontRef; cdecl;
  external libCoreText name _PU + 'CTFontCreateForString';
function CTFontCreateForStringWithLanguage(currentFont: CTFontRef;
  &string: CFStringRef; range: CFRange; language: CFStringRef): CTFontRef;
  cdecl; external libCoreText name _PU + 'CTFontCreateForStringWithLanguage';
function CTFontCopyFontDescriptor(font: CTFontRef): CTFontDescriptorRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyFontDescriptor';
function CTFontCopyAttribute(font: CTFontRef; attribute: CFStringRef)
  : CFTypeRef; cdecl; external libCoreText name _PU + 'CTFontCopyAttribute';
function CTFontGetSize(font: CTFontRef): CGFloat; cdecl;
  external libCoreText name _PU + 'CTFontGetSize';
function CTFontGetMatrix(font: CTFontRef): CGAffineTransform; cdecl;
  external libCoreText name _PU + 'CTFontGetMatrix';
function CTFontGetSymbolicTraits(font: CTFontRef): CTFontSymbolicTraits; cdecl;
  external libCoreText name _PU + 'CTFontGetSymbolicTraits';
function CTFontCopyTraits(font: CTFontRef): CFDictionaryRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyTraits';
function CTFontCopyPostScriptName(font: CTFontRef): CFStringRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyPostScriptName';
function CTFontCopyFamilyName(font: CTFontRef): CFStringRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyFamilyName';
function CTFontCopyFullName(font: CTFontRef): CFStringRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyFullName';
function CTFontCopyDisplayName(font: CTFontRef): CFStringRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyDisplayName';
function CTFontCopyName(font: CTFontRef; nameKey: CFStringRef): CFStringRef;
  cdecl; external libCoreText name _PU + 'CTFontCopyName';
function CTFontCopyLocalizedName(font: CTFontRef; nameKey: CFStringRef;
  actualLanguage: PCFStringRef): CFStringRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyLocalizedName';
function CTFontCopyCharacterSet(font: CTFontRef): CFCharacterSetRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyCharacterSet';
function CTFontGetStringEncoding(font: CTFontRef): CFStringEncoding; cdecl;
  external libCoreText name _PU + 'CTFontGetStringEncoding';
function CTFontCopySupportedLanguages(font: CTFontRef): CFArrayRef; cdecl;
  external libCoreText name _PU + 'CTFontCopySupportedLanguages';
function CTFontGetGlyphsForCharacters(font: CTFontRef; characters: UniChar;
  glyphs: CGGlyph; count: CFIndex): Integer; cdecl;
  external libCoreText name _PU + 'CTFontGetGlyphsForCharacters';
function CTFontGetAscent(font: CTFontRef): CGFloat; cdecl;
  external libCoreText name _PU + 'CTFontGetAscent';
function CTFontGetDescent(font: CTFontRef): CGFloat; cdecl;
  external libCoreText name _PU + 'CTFontGetDescent';
function CTFontGetLeading(font: CTFontRef): CGFloat; cdecl;
  external libCoreText name _PU + 'CTFontGetLeading';
function CTFontGetUnitsPerEm(font: CTFontRef): Cardinal; cdecl;
  external libCoreText name _PU + 'CTFontGetUnitsPerEm';
function CTFontGetGlyphCount(font: CTFontRef): CFIndex; cdecl;
  external libCoreText name _PU + 'CTFontGetGlyphCount';
function CTFontGetBoundingBox(font: CTFontRef): CGRect; cdecl;
  external libCoreText name _PU + 'CTFontGetBoundingBox';
function CTFontGetUnderlinePosition(font: CTFontRef): CGFloat; cdecl;
  external libCoreText name _PU + 'CTFontGetUnderlinePosition';
function CTFontGetUnderlineThickness(font: CTFontRef): CGFloat; cdecl;
  external libCoreText name _PU + 'CTFontGetUnderlineThickness';
function CTFontGetSlantAngle(font: CTFontRef): CGFloat; cdecl;
  external libCoreText name _PU + 'CTFontGetSlantAngle';
function CTFontGetCapHeight(font: CTFontRef): CGFloat; cdecl;
  external libCoreText name _PU + 'CTFontGetCapHeight';
function CTFontGetXHeight(font: CTFontRef): CGFloat; cdecl;
  external libCoreText name _PU + 'CTFontGetXHeight';
function CTFontGetGlyphWithName(font: CTFontRef; glyphName: CFStringRef)
  : CGGlyph; cdecl; external libCoreText name _PU + 'CTFontGetGlyphWithName';
function CTFontCopyNameForGlyph(font: CTFontRef; glyph: CGGlyph): CFStringRef;
  cdecl; external libCoreText name _PU + 'CTFontCopyNameForGlyph';
function CTFontGetBoundingRectsForGlyphs(font: CTFontRef;
  orientation: CTFontOrientation; glyphs: CGGlyph; boundingRects: CGRect;
  count: CFIndex): CGRect; cdecl;
  external libCoreText name _PU + 'CTFontGetBoundingRectsForGlyphs';
function CTFontGetOpticalBoundsForGlyphs(font: CTFontRef; glyphs: CGGlyph;
  boundingRects: CGRect; count: CFIndex; options: CFOptionFlags): CGRect; cdecl;
  external libCoreText name _PU + 'CTFontGetOpticalBoundsForGlyphs';
function CTFontGetAdvancesForGlyphs(font: CTFontRef;
  orientation: CTFontOrientation; glyphs: CGGlyph; advances: CGSize;
  count: CFIndex): Double; cdecl;
  external libCoreText name _PU + 'CTFontGetAdvancesForGlyphs';
procedure CTFontGetVerticalTranslationsForGlyphs(font: CTFontRef;
  glyphs: CGGlyph; translations: CGSize; count: CFIndex); cdecl;
  external libCoreText name _PU + 'CTFontGetVerticalTranslationsForGlyphs';
function CTFontCreatePathForGlyph(font: CTFontRef; glyph: CGGlyph;
  matrix: PCGAffineTransform): CGPathRef; cdecl;
  external libCoreText name _PU + 'CTFontCreatePathForGlyph';
function CTFontCopyVariationAxes(font: CTFontRef): CFArrayRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyVariationAxes';
function CTFontCopyVariation(font: CTFontRef): CFDictionaryRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyVariation';
function CTFontCopyFeatures(font: CTFontRef): CFArrayRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyFeatures';
function CTFontCopyFeatureSettings(font: CTFontRef): CFArrayRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyFeatureSettings';
function CTFontCopyGraphicsFont(font: CTFontRef;
  attributes: PCTFontDescriptorRef): CGFontRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyGraphicsFont';
function CTFontCreateWithGraphicsFont(graphicsFont: CGFontRef; size: CGFloat;
  matrix: PCGAffineTransform; attributes: CTFontDescriptorRef): CTFontRef;
  cdecl; external libCoreText name _PU + 'CTFontCreateWithGraphicsFont';
function CTFontGetPlatformFont(font: CTFontRef;
  attributes: PCTFontDescriptorRef): ATSFontRef; cdecl;
  external libCoreText name _PU + 'CTFontGetPlatformFont';
function CTFontCreateWithPlatformFont(platformFont: ATSFontRef; size: CGFloat;
  matrix: PCGAffineTransform; attributes: CTFontDescriptorRef): CTFontRef;
  cdecl; external libCoreText name _PU + 'CTFontCreateWithPlatformFont';
function CTFontCreateWithQuickdrawInstance(name: ConstStr255Param;
  identifier: Int16; style: Byte; size: CGFloat): CTFontRef; cdecl;
  external libCoreText name _PU + 'CTFontCreateWithQuickdrawInstance';
function CTFontCopyAvailableTables(font: CTFontRef; options: CTFontTableOptions)
  : CFArrayRef; cdecl; external libCoreText name _PU +
  'CTFontCopyAvailableTables';
function CTFontCopyTable(font: CTFontRef; table: CTFontTableTag;
  options: CTFontTableOptions): CFDataRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyTable';
procedure CTFontDrawGlyphs(font: CTFontRef; glyphs: CGGlyph; positions: CGPoint;
  count: LongWord; context: CGContextRef); cdecl;
  external libCoreText name _PU + 'CTFontDrawGlyphs';
function CTFontGetLigatureCaretPositions(font: CTFontRef; glyph: CGGlyph;
  positions: CGFloat; maxPositions: CFIndex): CFIndex; cdecl;
  external libCoreText name _PU + 'CTFontGetLigatureCaretPositions';
function CTFontCopyDefaultCascadeListForLanguages(font: CTFontRef;
  languagePrefList: CFArrayRef): CFArrayRef; cdecl;
  external libCoreText name _PU + 'CTFontCopyDefaultCascadeListForLanguages';
function CTFontCollectionGetTypeID: CFTypeID; cdecl;
  external libCoreText name _PU + 'CTFontCollectionGetTypeID';
function CTFontCollectionCreateFromAvailableFonts(options: CFDictionaryRef)
  : CTFontCollectionRef; cdecl;
  external libCoreText name _PU + 'CTFontCollectionCreateFromAvailableFonts';
function CTFontCollectionCreateWithFontDescriptors(queryDescriptors: CFArrayRef;
  options: CFDictionaryRef): CTFontCollectionRef; cdecl;
  external libCoreText name _PU + 'CTFontCollectionCreateWithFontDescriptors';
function CTFontCollectionCreateCopyWithFontDescriptors
  (original: CTFontCollectionRef; queryDescriptors: CFArrayRef;
  options: CFDictionaryRef): CTFontCollectionRef; cdecl;
  external libCoreText name _PU +
  'CTFontCollectionCreateCopyWithFontDescriptors';
function CTFontCollectionCreateMutableCopy(original: CTFontCollectionRef)
  : CTMutableFontCollectionRef; cdecl;
  external libCoreText name _PU + 'CTFontCollectionCreateMutableCopy';
function CTFontCollectionCopyQueryDescriptors(collection: CTFontCollectionRef)
  : CFArrayRef; cdecl; external libCoreText name _PU +
  'CTFontCollectionCopyQueryDescriptors';
procedure CTFontCollectionSetQueryDescriptors
  (collection: CTMutableFontCollectionRef; descriptors: CFArrayRef); cdecl;
  external libCoreText name _PU + 'CTFontCollectionSetQueryDescriptors';
function CTFontCollectionCopyExclusionDescriptors
  (collection: CTFontCollectionRef): CFArrayRef; cdecl;
  external libCoreText name _PU + 'CTFontCollectionCopyExclusionDescriptors';
procedure CTFontCollectionSetExclusionDescriptors
  (collection: CTMutableFontCollectionRef; descriptors: CFArrayRef); cdecl;
  external libCoreText name _PU + 'CTFontCollectionSetExclusionDescriptors';
function CTFontCollectionCreateMatchingFontDescriptors
  (collection: CTFontCollectionRef): CFArrayRef; cdecl;
  external libCoreText name _PU +
  'CTFontCollectionCreateMatchingFontDescriptors';
function CTFontCollectionCreateMatchingFontDescriptorsSortedWithCallback
  (collection: CTFontCollectionRef;
  sortCallback: CTFontCollectionSortDescriptorsCallback; refCon: Pointer)
  : CFArrayRef; cdecl; external libCoreText name _PU +
  'CTFontCollectionCreateMatchingFontDescriptorsSortedWithCallback';
function CTFontCollectionCreateMatchingFontDescriptorsWithOptions
  (collection: CTFontCollectionRef; options: CFDictionaryRef): CFArrayRef;
  cdecl; external libCoreText name _PU +
  'CTFontCollectionCreateMatchingFontDescriptorsWithOptions';
function CTFontCollectionCreateMatchingFontDescriptorsForFamily
  (collection: CTFontCollectionRef; familyName: CFStringRef;
  options: CFDictionaryRef): CFArrayRef; cdecl;
  external libCoreText name _PU +
  'CTFontCollectionCreateMatchingFontDescriptorsForFamily';
function CTFontCollectionCopyFontAttribute(collection: CTFontCollectionRef;
  attributeName: CFStringRef; options: CTFontCollectionCopyOptions): CFArrayRef;
  cdecl; external libCoreText name _PU + 'CTFontCollectionCopyFontAttribute';
function CTFontCollectionCopyFontAttributes(collection: CTFontCollectionRef;
  attributeNames: CFSetRef; options: CTFontCollectionCopyOptions): CFArrayRef;
  cdecl; external libCoreText name _PU + 'CTFontCollectionCopyFontAttributes';
function CTFontManagerCopyAvailablePostScriptNames: CFArrayRef; cdecl;
  external libCoreText name _PU + 'CTFontManagerCopyAvailablePostScriptNames';
function CTFontManagerCopyAvailableFontFamilyNames: CFArrayRef; cdecl;
  external libCoreText name _PU + 'CTFontManagerCopyAvailableFontFamilyNames';
function CTFontManagerCopyAvailableFontURLs: CFArrayRef; cdecl;
  external libCoreText name _PU + 'CTFontManagerCopyAvailableFontURLs';
function CTFontManagerCompareFontFamilyNames(family1: Pointer; family2: Pointer;
  context: Pointer): CFComparisonResult; cdecl;
  external libCoreText name _PU + 'CTFontManagerCompareFontFamilyNames';
function CTFontManagerCreateFontDescriptorsFromURL(fileURL: CFURLRef)
  : CFArrayRef; cdecl; external libCoreText name _PU +
  'CTFontManagerCreateFontDescriptorsFromURL';
function CTFontManagerCreateFontDescriptorFromData(data: CFDataRef)
  : CTFontDescriptorRef; cdecl;
  external libCoreText name _PU + 'CTFontManagerCreateFontDescriptorFromData';
function CTFontManagerCreateFontDescriptorsFromData(data: CFDataRef)
  : CFArrayRef; cdecl; external libCoreText name _PU +
  'CTFontManagerCreateFontDescriptorsFromData';
function CTFontManagerRegisterFontsForURL(fontURL: CFURLRef;
  scope: CTFontManagerScope; error: Pointer): Integer; cdecl;
  external libCoreText name _PU + 'CTFontManagerRegisterFontsForURL';
function CTFontManagerUnregisterFontsForURL(fontURL: CFURLRef;
  scope: CTFontManagerScope; error: Pointer): Integer; cdecl;
  external libCoreText name _PU + 'CTFontManagerUnregisterFontsForURL';
function CTFontManagerRegisterGraphicsFont(font: CGFontRef; error: Pointer)
  : Integer; cdecl; external libCoreText name _PU +
  'CTFontManagerRegisterGraphicsFont';
function CTFontManagerUnregisterGraphicsFont(font: CGFontRef; error: Pointer)
  : Integer; cdecl; external libCoreText name _PU +
  'CTFontManagerUnregisterGraphicsFont';
function CTFontManagerRegisterFontsForURLs(fontURLs: CFArrayRef;
  scope: CTFontManagerScope; errors: PCFArrayRef): Integer; cdecl;
  external libCoreText name _PU + 'CTFontManagerRegisterFontsForURLs';
function CTFontManagerUnregisterFontsForURLs(fontURLs: CFArrayRef;
  scope: CTFontManagerScope; errors: PCFArrayRef): Integer; cdecl;
  external libCoreText name _PU + 'CTFontManagerUnregisterFontsForURLs';
procedure CTFontManagerRegisterFontURLs(fontURLs: CFArrayRef;
  scope: CTFontManagerScope; enabled: Integer;
  registrationHandler: TCoreTextRegistrationHandler); cdecl;
  external libCoreText name _PU + 'CTFontManagerRegisterFontURLs';
procedure CTFontManagerUnregisterFontURLs(fontURLs: CFArrayRef;
  scope: CTFontManagerScope; registrationHandler: TCoreTextRegistrationHandler);
  cdecl; external libCoreText name _PU + 'CTFontManagerUnregisterFontURLs';
procedure CTFontManagerRegisterFontDescriptors(fontDescriptors: CFArrayRef;
  scope: CTFontManagerScope; enabled: Integer;
  registrationHandler: TCoreTextRegistrationHandler); cdecl;
  external libCoreText name _PU + 'CTFontManagerRegisterFontDescriptors';
procedure CTFontManagerUnregisterFontDescriptors(fontDescriptors: CFArrayRef;
  scope: CTFontManagerScope; registrationHandler: TCoreTextRegistrationHandler);
  cdecl; external libCoreText name _PU +
  'CTFontManagerUnregisterFontDescriptors';
procedure CTFontManagerRegisterFontsWithAssetNames(fontAssetNames: CFArrayRef;
  bundle: CFBundleRef; scope: CTFontManagerScope; enabled: Integer;
  registrationHandler: TCoreTextRegistrationHandler); cdecl;
  external libCoreText name _PU + 'CTFontManagerRegisterFontsWithAssetNames';
procedure CTFontManagerEnableFontDescriptors(descriptors: CFArrayRef;
  enable: Integer); cdecl;
  external libCoreText name _PU + 'CTFontManagerEnableFontDescriptors';
function CTFontManagerGetScopeForURL(fontURL: CFURLRef): CTFontManagerScope;
  cdecl; external libCoreText name _PU + 'CTFontManagerGetScopeForURL';
function CTFontManagerCopyRegisteredFontDescriptors(scope: CTFontManagerScope;
  enabled: Integer): CFArrayRef; cdecl;
  external libCoreText name _PU + 'CTFontManagerCopyRegisteredFontDescriptors';
procedure CTFontManagerRequestFonts(fontDescriptors: CFArrayRef;
  completionHandler: TCoreTextCompletionHandler); cdecl;
  external libCoreText name _PU + 'CTFontManagerRequestFonts';
function CTFontManagerIsSupportedFont(fontURL: CFURLRef): Integer; cdecl;
  external libCoreText name _PU + 'CTFontManagerIsSupportedFont';
function CTFontManagerCreateFontRequestRunLoopSource(sourceOrder: CFIndex;
  createMatchesCallback: TCoreTextCreateMatchesCallback): CFRunLoopSourceRef;
  cdecl; external libCoreText name _PU +
  'CTFontManagerCreateFontRequestRunLoopSource';
procedure CTFontManagerSetAutoActivationSetting(bundleIdentifier: CFStringRef;
  setting: CTFontManagerAutoActivationSetting); cdecl;
  external libCoreText name _PU + 'CTFontManagerSetAutoActivationSetting';
function CTFontManagerGetAutoActivationSetting(bundleIdentifier: CFStringRef)
  : CTFontManagerAutoActivationSetting; cdecl;
  external libCoreText name _PU + 'CTFontManagerGetAutoActivationSetting';
function CTFrameGetTypeID: CFTypeID; cdecl;
  external libCoreText name _PU + 'CTFrameGetTypeID';
function CTFrameGetStringRange(frame: CTFrameRef): CFRange; cdecl;
  external libCoreText name _PU + 'CTFrameGetStringRange';
function CTFrameGetVisibleStringRange(frame: CTFrameRef): CFRange; cdecl;
  external libCoreText name _PU + 'CTFrameGetVisibleStringRange';
function CTFrameGetPath(frame: CTFrameRef): CGPathRef; cdecl;
  external libCoreText name _PU + 'CTFrameGetPath';
function CTFrameGetFrameAttributes(frame: CTFrameRef): CFDictionaryRef; cdecl;
  external libCoreText name _PU + 'CTFrameGetFrameAttributes';
function CTFrameGetLines(frame: CTFrameRef): CFArrayRef; cdecl;
  external libCoreText name _PU + 'CTFrameGetLines';
procedure CTFrameGetLineOrigins(frame: CTFrameRef; range: CFRange;
  origins: CGPoint); cdecl;
  external libCoreText name _PU + 'CTFrameGetLineOrigins';
procedure CTFrameDraw(frame: CTFrameRef; context: CGContextRef); cdecl;
  external libCoreText name _PU + 'CTFrameDraw';
function CTLineGetTypeID: CFTypeID; cdecl;
  external libCoreText name _PU + 'CTLineGetTypeID';
function CTLineCreateWithAttributedString(attrString: CFAttributedStringRef)
  : CTLineRef; cdecl; external libCoreText name _PU +
  'CTLineCreateWithAttributedString';
function CTLineCreateTruncatedLine(line: CTLineRef; width: Double;
  truncationType: CTLineTruncationType; truncationToken: CTLineRef): CTLineRef;
  cdecl; external libCoreText name _PU + 'CTLineCreateTruncatedLine';
function CTLineCreateJustifiedLine(line: CTLineRef;
  justificationFactor: CGFloat; justificationWidth: Double): CTLineRef; cdecl;
  external libCoreText name _PU + 'CTLineCreateJustifiedLine';
function CTLineGetGlyphCount(line: CTLineRef): CFIndex; cdecl;
  external libCoreText name _PU + 'CTLineGetGlyphCount';
function CTLineGetGlyphRuns(line: CTLineRef): CFArrayRef; cdecl;
  external libCoreText name _PU + 'CTLineGetGlyphRuns';
function CTLineGetStringRange(line: CTLineRef): CFRange; cdecl;
  external libCoreText name _PU + 'CTLineGetStringRange';
function CTLineGetPenOffsetForFlush(line: CTLineRef; flushFactor: CGFloat;
  flushWidth: Double): Double; cdecl;
  external libCoreText name _PU + 'CTLineGetPenOffsetForFlush';
procedure CTLineDraw(line: CTLineRef; context: CGContextRef); cdecl;
  external libCoreText name _PU + 'CTLineDraw';
function CTLineGetTypographicBounds(line: CTLineRef; ascent: PCGFloat;
  descent: PCGFloat; leading: PCGFloat): Double; cdecl;
  external libCoreText name _PU + 'CTLineGetTypographicBounds';
function CTLineGetBoundsWithOptions(line: CTLineRef;
  options: CTLineBoundsOptions): CGRect; cdecl;
  external libCoreText name _PU + 'CTLineGetBoundsWithOptions';
function CTLineGetTrailingWhitespaceWidth(line: CTLineRef): Double; cdecl;
  external libCoreText name _PU + 'CTLineGetTrailingWhitespaceWidth';
function CTLineGetImageBounds(line: CTLineRef; context: CGContextRef): CGRect;
  cdecl; external libCoreText name _PU + 'CTLineGetImageBounds';
function CTLineGetStringIndexForPosition(line: CTLineRef; position: CGPoint)
  : CFIndex; cdecl; external libCoreText name _PU +
  'CTLineGetStringIndexForPosition';
function CTLineGetOffsetForStringIndex(line: CTLineRef; charIndex: CFIndex;
  secondaryOffset: PCGFloat): CGFloat; cdecl;
  external libCoreText name _PU + 'CTLineGetOffsetForStringIndex';
procedure CTLineEnumerateCaretOffsets(line: CTLineRef; block: TCoreTextBlock);
  cdecl; external libCoreText name _PU + 'CTLineEnumerateCaretOffsets';
function CTTypesetterGetTypeID: CFTypeID; cdecl;
  external libCoreText name _PU + 'CTTypesetterGetTypeID';
function CTTypesetterCreateWithAttributedString(&string: CFAttributedStringRef)
  : CTTypesetterRef; cdecl;
  external libCoreText name _PU + 'CTTypesetterCreateWithAttributedString';
function CTTypesetterCreateWithAttributedStringAndOptions
  (&string: CFAttributedStringRef; options: CFDictionaryRef): CTTypesetterRef;
  cdecl; external libCoreText name _PU +
  'CTTypesetterCreateWithAttributedStringAndOptions';
function CTTypesetterCreateLineWithOffset(typesetter: CTTypesetterRef;
  stringRange: CFRange; offset: Double): CTLineRef; cdecl;
  external libCoreText name _PU + 'CTTypesetterCreateLineWithOffset';
function CTTypesetterCreateLine(typesetter: CTTypesetterRef;
  stringRange: CFRange): CTLineRef; cdecl;
  external libCoreText name _PU + 'CTTypesetterCreateLine';
function CTTypesetterSuggestLineBreakWithOffset(typesetter: CTTypesetterRef;
  startIndex: CFIndex; width: Double; offset: Double): CFIndex; cdecl;
  external libCoreText name _PU + 'CTTypesetterSuggestLineBreakWithOffset';
function CTTypesetterSuggestLineBreak(typesetter: CTTypesetterRef;
  startIndex: CFIndex; width: Double): CFIndex; cdecl;
  external libCoreText name _PU + 'CTTypesetterSuggestLineBreak';
function CTTypesetterSuggestClusterBreakWithOffset(typesetter: CTTypesetterRef;
  startIndex: CFIndex; width: Double; offset: Double): CFIndex; cdecl;
  external libCoreText name _PU + 'CTTypesetterSuggestClusterBreakWithOffset';
function CTTypesetterSuggestClusterBreak(typesetter: CTTypesetterRef;
  startIndex: CFIndex; width: Double): CFIndex; cdecl;
  external libCoreText name _PU + 'CTTypesetterSuggestClusterBreak';
function CTFramesetterGetTypeID: CFTypeID; cdecl;
  external libCoreText name _PU + 'CTFramesetterGetTypeID';
function CTFramesetterCreateWithTypesetter(typesetter: CTTypesetterRef)
  : CTFramesetterRef; cdecl;
  external libCoreText name _PU + 'CTFramesetterCreateWithTypesetter';
function CTFramesetterCreateWithAttributedString
  (attrString: CFAttributedStringRef): CTFramesetterRef; cdecl;
  external libCoreText name _PU + 'CTFramesetterCreateWithAttributedString';
function CTFramesetterCreateFrame(framesetter: CTFramesetterRef;
  stringRange: CFRange; path: CGPathRef; frameAttributes: CFDictionaryRef)
  : CTFrameRef; cdecl; external libCoreText name _PU +
  'CTFramesetterCreateFrame';
function CTFramesetterGetTypesetter(framesetter: CTFramesetterRef)
  : CTTypesetterRef; cdecl;
  external libCoreText name _PU + 'CTFramesetterGetTypesetter';
function CTFramesetterSuggestFrameSizeWithConstraints
  (framesetter: CTFramesetterRef; stringRange: CFRange;
  frameAttributes: CFDictionaryRef; constraints: CGSize; fitRange: PCFRange)
  : CGSize; cdecl; external libCoreText name _PU +
  'CTFramesetterSuggestFrameSizeWithConstraints';
function CTGlyphInfoGetTypeID: CFTypeID; cdecl;
  external libCoreText name _PU + 'CTGlyphInfoGetTypeID';
function CTGlyphInfoCreateWithGlyphName(glyphName: CFStringRef; font: CTFontRef;
  baseString: CFStringRef): CTGlyphInfoRef; cdecl;
  external libCoreText name _PU + 'CTGlyphInfoCreateWithGlyphName';
function CTGlyphInfoCreateWithGlyph(glyph: CGGlyph; font: CTFontRef;
  baseString: CFStringRef): CTGlyphInfoRef; cdecl;
  external libCoreText name _PU + 'CTGlyphInfoCreateWithGlyph';
function CTGlyphInfoCreateWithCharacterIdentifier(cid: CGFontIndex;
  collection: CTCharacterCollection; baseString: CFStringRef): CTGlyphInfoRef;
  cdecl; external libCoreText name _PU +
  'CTGlyphInfoCreateWithCharacterIdentifier';
function CTGlyphInfoGetGlyphName(glyphInfo: CTGlyphInfoRef): CFStringRef; cdecl;
  external libCoreText name _PU + 'CTGlyphInfoGetGlyphName';
function CTGlyphInfoGetGlyph(glyphInfo: CTGlyphInfoRef): CGGlyph; cdecl;
  external libCoreText name _PU + 'CTGlyphInfoGetGlyph';
function CTGlyphInfoGetCharacterIdentifier(glyphInfo: CTGlyphInfoRef)
  : CGFontIndex; cdecl; external libCoreText name _PU +
  'CTGlyphInfoGetCharacterIdentifier';
function CTGlyphInfoGetCharacterCollection(glyphInfo: CTGlyphInfoRef)
  : CTCharacterCollection; cdecl;
  external libCoreText name _PU + 'CTGlyphInfoGetCharacterCollection';
function CTParagraphStyleGetTypeID: CFTypeID; cdecl;
  external libCoreText name _PU + 'CTParagraphStyleGetTypeID';
function CTParagraphStyleCreate(settings: PCTParagraphStyleSetting;
  settingCount: LongWord): CTParagraphStyleRef; cdecl;
  external libCoreText name _PU + 'CTParagraphStyleCreate';
function CTParagraphStyleCreateCopy(paragraphStyle: CTParagraphStyleRef)
  : CTParagraphStyleRef; cdecl;
  external libCoreText name _PU + 'CTParagraphStyleCreateCopy';
function CTParagraphStyleGetValueForSpecifier(paragraphStyle
  : CTParagraphStyleRef; spec: CTParagraphStyleSpecifier;
  valueBufferSize: LongWord; valueBuffer: Pointer): Integer; cdecl;
  external libCoreText name _PU + 'CTParagraphStyleGetValueForSpecifier';
function CTRubyAnnotationGetTypeID: CFTypeID; cdecl;
  external libCoreText name _PU + 'CTRubyAnnotationGetTypeID';
function CTRubyAnnotationCreate(alignment: CTRubyAlignment;
  overhang: CTRubyOverhang; sizeFactor: CGFloat; text: CFStringRef)
  : CTRubyAnnotationRef; cdecl;
  external libCoreText name _PU + 'CTRubyAnnotationCreate';
function CTRubyAnnotationCreateWithAttributes(alignment: CTRubyAlignment;
  overhang: CTRubyOverhang; position: CTRubyPosition; &string: CFStringRef;
  attributes: CFDictionaryRef): CTRubyAnnotationRef; cdecl;
  external libCoreText name _PU + 'CTRubyAnnotationCreateWithAttributes';
function CTRubyAnnotationCreateCopy(rubyAnnotation: CTRubyAnnotationRef)
  : CTRubyAnnotationRef; cdecl;
  external libCoreText name _PU + 'CTRubyAnnotationCreateCopy';
function CTRubyAnnotationGetAlignment(rubyAnnotation: CTRubyAnnotationRef)
  : CTRubyAlignment; cdecl;
  external libCoreText name _PU + 'CTRubyAnnotationGetAlignment';
function CTRubyAnnotationGetOverhang(rubyAnnotation: CTRubyAnnotationRef)
  : CTRubyOverhang; cdecl;
  external libCoreText name _PU + 'CTRubyAnnotationGetOverhang';
function CTRubyAnnotationGetSizeFactor(rubyAnnotation: CTRubyAnnotationRef)
  : CGFloat; cdecl; external libCoreText name _PU +
  'CTRubyAnnotationGetSizeFactor';
function CTRubyAnnotationGetTextForPosition(rubyAnnotation: CTRubyAnnotationRef;
  position: CTRubyPosition): CFStringRef; cdecl;
  external libCoreText name _PU + 'CTRubyAnnotationGetTextForPosition';
function CTRunGetTypeID: CFTypeID; cdecl;
  external libCoreText name _PU + 'CTRunGetTypeID';
function CTRunGetGlyphCount(run: CTRunRef): CFIndex; cdecl;
  external libCoreText name _PU + 'CTRunGetGlyphCount';
function CTRunGetAttributes(run: CTRunRef): CFDictionaryRef; cdecl;
  external libCoreText name _PU + 'CTRunGetAttributes';
function CTRunGetStatus(run: CTRunRef): CTRunStatus; cdecl;
  external libCoreText name _PU + 'CTRunGetStatus';
function CTRunGetGlyphsPtr(run: CTRunRef): PCGGlyph; cdecl;
  external libCoreText name _PU + 'CTRunGetGlyphsPtr';
procedure CTRunGetGlyphs(run: CTRunRef; range: CFRange; buffer: CGGlyph); cdecl;
  external libCoreText name _PU + 'CTRunGetGlyphs';
function CTRunGetPositionsPtr(run: CTRunRef): PCGPoint; cdecl;
  external libCoreText name _PU + 'CTRunGetPositionsPtr';
procedure CTRunGetPositions(run: CTRunRef; range: CFRange; buffer: CGPoint);
  cdecl; external libCoreText name _PU + 'CTRunGetPositions';
function CTRunGetAdvancesPtr(run: CTRunRef): Pointer; cdecl;
  external libCoreText name _PU + 'CTRunGetAdvancesPtr';
procedure CTRunGetAdvances(run: CTRunRef; range: CFRange; buffer: CGSize);
  cdecl; external libCoreText name _PU + 'CTRunGetAdvances';
function CTRunGetStringIndicesPtr(run: CTRunRef): PCFIndex; cdecl;
  external libCoreText name _PU + 'CTRunGetStringIndicesPtr';
procedure CTRunGetStringIndices(run: CTRunRef; range: CFRange; buffer: CFIndex);
  cdecl; external libCoreText name _PU + 'CTRunGetStringIndices';
function CTRunGetStringRange(run: CTRunRef): CFRange; cdecl;
  external libCoreText name _PU + 'CTRunGetStringRange';
function CTRunGetTypographicBounds(run: CTRunRef; range: CFRange;
  ascent: PCGFloat; descent: PCGFloat; leading: PCGFloat): Double; cdecl;
  external libCoreText name _PU + 'CTRunGetTypographicBounds';
function CTRunGetImageBounds(run: CTRunRef; context: CGContextRef;
  range: CFRange): CGRect; cdecl;
  external libCoreText name _PU + 'CTRunGetImageBounds';
function CTRunGetTextMatrix(run: CTRunRef): CGAffineTransform; cdecl;
  external libCoreText name _PU + 'CTRunGetTextMatrix';
procedure CTRunGetBaseAdvancesAndOrigins(runRef: CTRunRef; range: CFRange;
  advancesBuffer: CGSize; originsBuffer: CGPoint); cdecl;
  external libCoreText name _PU + 'CTRunGetBaseAdvancesAndOrigins';
procedure CTRunDraw(run: CTRunRef; context: CGContextRef; range: CFRange);
  cdecl; external libCoreText name _PU + 'CTRunDraw';
function CTRunDelegateGetTypeID: CFTypeID; cdecl;
  external libCoreText name _PU + 'CTRunDelegateGetTypeID';
function CTRunDelegateCreate(callbacks: PCTRunDelegateCallbacks;
  refCon: Pointer): CTRunDelegateRef; cdecl;
  external libCoreText name _PU + 'CTRunDelegateCreate';
function CTRunDelegateGetRefCon(runDelegate: CTRunDelegateRef): Pointer; cdecl;
  external libCoreText name _PU + 'CTRunDelegateGetRefCon';
function CTTextTabGetTypeID: CFTypeID; cdecl;
  external libCoreText name _PU + 'CTTextTabGetTypeID';
function CTTextTabCreate(alignment: CTTextAlignment; location: Double;
  options: CFDictionaryRef): CTTextTabRef; cdecl;
  external libCoreText name _PU + 'CTTextTabCreate';
function CTTextTabGetAlignment(tab: CTTextTabRef): CTTextAlignment; cdecl;
  external libCoreText name _PU + 'CTTextTabGetAlignment';
function CTTextTabGetLocation(tab: CTTextTabRef): Double; cdecl;
  external libCoreText name _PU + 'CTTextTabGetLocation';
function CTTextTabGetOptions(tab: CTTextTabRef): CFDictionaryRef; cdecl;
  external libCoreText name _PU + 'CTTextTabGetOptions';
function CTGetCoreTextVersion: LongWord; cdecl;
  external libCoreText name _PU + 'CTGetCoreTextVersion';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreTextModule: THandle;

{$ENDIF IOS}

function kCTFontSymbolicTrait: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontSymbolicTrait');
end;

function kCTFontWeightTrait: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontWeightTrait');
end;

function kCTFontWidthTrait: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontWidthTrait');
end;

function kCTFontSlantTrait: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontSlantTrait');
end;

function kCTFontURLAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontURLAttribute');
end;

function kCTFontNameAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontNameAttribute');
end;

function kCTFontDisplayNameAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontDisplayNameAttribute');
end;

function kCTFontFamilyNameAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFamilyNameAttribute');
end;

function kCTFontStyleNameAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontStyleNameAttribute');
end;

function kCTFontTraitsAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontTraitsAttribute');
end;

function kCTFontVariationAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontVariationAttribute');
end;

function kCTFontVariationAxesAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontVariationAxesAttribute');
end;

function kCTFontSizeAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontSizeAttribute');
end;

function kCTFontMatrixAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontMatrixAttribute');
end;

function kCTFontCascadeListAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontCascadeListAttribute');
end;

function kCTFontCharacterSetAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontCharacterSetAttribute');
end;

function kCTFontLanguagesAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontLanguagesAttribute');
end;

function kCTFontBaselineAdjustAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontBaselineAdjustAttribute');
end;

function kCTFontMacintoshEncodingsAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontMacintoshEncodingsAttribute');
end;

function kCTFontFeaturesAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFeaturesAttribute');
end;

function kCTFontFeatureSettingsAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFeatureSettingsAttribute');
end;

function kCTFontFixedAdvanceAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFixedAdvanceAttribute');
end;

function kCTFontOrientationAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontOrientationAttribute');
end;

function kCTFontFormatAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFormatAttribute');
end;

function kCTFontRegistrationScopeAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontRegistrationScopeAttribute');
end;

function kCTFontPriorityAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontPriorityAttribute');
end;

function kCTFontEnabledAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontEnabledAttribute');
end;

function kCTFontDownloadableAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontDownloadableAttribute');
end;

function kCTFontDownloadedAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontDownloadedAttribute');
end;

function kCTFontOpticalSizeAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontOpticalSizeAttribute');
end;

function kCTFontDescriptorMatchingSourceDescriptor: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontDescriptorMatchingSourceDescriptor');
end;

function kCTFontDescriptorMatchingDescriptors: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontDescriptorMatchingDescriptors');
end;

function kCTFontDescriptorMatchingResult: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontDescriptorMatchingResult');
end;

function kCTFontDescriptorMatchingPercentage: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontDescriptorMatchingPercentage');
end;

function kCTFontDescriptorMatchingCurrentAssetSize: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontDescriptorMatchingCurrentAssetSize');
end;

function kCTFontDescriptorMatchingTotalDownloadedSize: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontDescriptorMatchingTotalDownloadedSize');
end;

function kCTFontDescriptorMatchingTotalAssetSize: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontDescriptorMatchingTotalAssetSize');
end;

function kCTFontDescriptorMatchingError: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontDescriptorMatchingError');
end;

function kCTFontCopyrightNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontCopyrightNameKey');
end;

function kCTFontFamilyNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFamilyNameKey');
end;

function kCTFontSubFamilyNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontSubFamilyNameKey');
end;

function kCTFontStyleNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontStyleNameKey');
end;

function kCTFontUniqueNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontUniqueNameKey');
end;

function kCTFontFullNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFullNameKey');
end;

function kCTFontVersionNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontVersionNameKey');
end;

function kCTFontPostScriptNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontPostScriptNameKey');
end;

function kCTFontTrademarkNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontTrademarkNameKey');
end;

function kCTFontManufacturerNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontManufacturerNameKey');
end;

function kCTFontDesignerNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontDesignerNameKey');
end;

function kCTFontDescriptionNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontDescriptionNameKey');
end;

function kCTFontVendorURLNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontVendorURLNameKey');
end;

function kCTFontDesignerURLNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontDesignerURLNameKey');
end;

function kCTFontLicenseNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontLicenseNameKey');
end;

function kCTFontLicenseURLNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontLicenseURLNameKey');
end;

function kCTFontSampleTextNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontSampleTextNameKey');
end;

function kCTFontPostScriptCIDNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontPostScriptCIDNameKey');
end;

function kCTFontVariationAxisIdentifierKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontVariationAxisIdentifierKey');
end;

function kCTFontVariationAxisMinimumValueKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontVariationAxisMinimumValueKey');
end;

function kCTFontVariationAxisMaximumValueKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontVariationAxisMaximumValueKey');
end;

function kCTFontVariationAxisDefaultValueKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontVariationAxisDefaultValueKey');
end;

function kCTFontVariationAxisNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontVariationAxisNameKey');
end;

function kCTFontVariationAxisHiddenKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontVariationAxisHiddenKey');
end;

function kCTFontOpenTypeFeatureTag: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontOpenTypeFeatureTag');
end;

function kCTFontOpenTypeFeatureValue: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontOpenTypeFeatureValue');
end;

function kCTFontFeatureTypeIdentifierKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFeatureTypeIdentifierKey');
end;

function kCTFontFeatureTypeNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFeatureTypeNameKey');
end;

function kCTFontFeatureTypeExclusiveKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFeatureTypeExclusiveKey');
end;

function kCTFontFeatureTypeSelectorsKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFeatureTypeSelectorsKey');
end;

function kCTFontFeatureSelectorIdentifierKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontFeatureSelectorIdentifierKey');
end;

function kCTFontFeatureSelectorNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFeatureSelectorNameKey');
end;

function kCTFontFeatureSelectorDefaultKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFeatureSelectorDefaultKey');
end;

function kCTFontFeatureSelectorSettingKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFeatureSelectorSettingKey');
end;

function kCTFontFeatureSampleTextKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFeatureSampleTextKey');
end;

function kCTFontFeatureTooltipTextKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontFeatureTooltipTextKey');
end;

function kCTBaselineClassRoman: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTBaselineClassRoman');
end;

function kCTBaselineClassIdeographicCentered: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTBaselineClassIdeographicCentered');
end;

function kCTBaselineClassIdeographicLow: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTBaselineClassIdeographicLow');
end;

function kCTBaselineClassIdeographicHigh: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTBaselineClassIdeographicHigh');
end;

function kCTBaselineClassHanging: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTBaselineClassHanging');
end;

function kCTBaselineClassMath: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTBaselineClassMath');
end;

function kCTBaselineReferenceFont: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTBaselineReferenceFont');
end;

function kCTBaselineOriginalFont: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTBaselineOriginalFont');
end;

function kCTFontCollectionRemoveDuplicatesOption: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontCollectionRemoveDuplicatesOption');
end;

function kCTFontCollectionIncludeDisabledFontsOption: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontCollectionIncludeDisabledFontsOption');
end;

function kCTFontCollectionDisallowAutoActivationOption: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontCollectionDisallowAutoActivationOption');
end;

function kCTFontManagerErrorDomain: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontManagerErrorDomain');
end;

function kCTFontManagerErrorFontURLsKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontManagerErrorFontURLsKey');
end;

function kCTFontManagerErrorFontDescriptorsKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontManagerErrorFontDescriptorsKey');
end;

function kCTFontManagerErrorFontAssetNameKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontManagerErrorFontAssetNameKey');
end;

function kCTFontRegistrationUserInfoAttribute: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontRegistrationUserInfoAttribute');
end;

function kCTFontManagerBundleIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontManagerBundleIdentifier');
end;

function kCTFontManagerRegisteredFontsChangedNotification: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFontManagerRegisteredFontsChangedNotification');
end;

function kCTFrameProgressionAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFrameProgressionAttributeName');
end;

function kCTFramePathFillRuleAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFramePathFillRuleAttributeName');
end;

function kCTFramePathWidthAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFramePathWidthAttributeName');
end;

function kCTFrameClippingPathsAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFrameClippingPathsAttributeName');
end;

function kCTFramePathClippingPathAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTFramePathClippingPathAttributeName');
end;

function kCTTypesetterOptionAllowUnboundedLayout: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTTypesetterOptionAllowUnboundedLayout');
end;

function kCTTypesetterOptionDisableBidiProcessing: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTTypesetterOptionDisableBidiProcessing');
end;

function kCTTypesetterOptionForcedEmbeddingLevel: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTTypesetterOptionForcedEmbeddingLevel');
end;

function kCTRubyAnnotationSizeFactorAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTRubyAnnotationSizeFactorAttributeName');
end;

function kCTRubyAnnotationScaleToFitAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTRubyAnnotationScaleToFitAttributeName');
end;

function kCTFontAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTFontAttributeName');
end;

function kCTForegroundColorFromContextAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTForegroundColorFromContextAttributeName');
end;

function kCTKernAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTKernAttributeName');
end;

function kCTTrackingAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTTrackingAttributeName');
end;

function kCTLigatureAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTLigatureAttributeName');
end;

function kCTForegroundColorAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTForegroundColorAttributeName');
end;

function kCTBackgroundColorAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTBackgroundColorAttributeName');
end;

function kCTParagraphStyleAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTParagraphStyleAttributeName');
end;

function kCTStrokeWidthAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTStrokeWidthAttributeName');
end;

function kCTStrokeColorAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTStrokeColorAttributeName');
end;

function kCTUnderlineStyleAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTUnderlineStyleAttributeName');
end;

function kCTSuperscriptAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTSuperscriptAttributeName');
end;

function kCTUnderlineColorAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTUnderlineColorAttributeName');
end;

function kCTVerticalFormsAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTVerticalFormsAttributeName');
end;

function kCTHorizontalInVerticalFormsAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTHorizontalInVerticalFormsAttributeName');
end;

function kCTGlyphInfoAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTGlyphInfoAttributeName');
end;

function kCTCharacterShapeAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTCharacterShapeAttributeName');
end;

function kCTLanguageAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTLanguageAttributeName');
end;

function kCTRunDelegateAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTRunDelegateAttributeName');
end;

function kCTBaselineClassAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTBaselineClassAttributeName');
end;

function kCTBaselineInfoAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTBaselineInfoAttributeName');
end;

function kCTBaselineReferenceInfoAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTBaselineReferenceInfoAttributeName');
end;

function kCTBaselineOffsetAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTBaselineOffsetAttributeName');
end;

function kCTWritingDirectionAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTWritingDirectionAttributeName');
end;

function kCTRubyAnnotationAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText, 'kCTRubyAnnotationAttributeName');
end;

function kCTTabColumnTerminatorsAttributeName: Pointer;
begin
  Result := CocoaPointerConst(libCoreText,
    'kCTTabColumnTerminatorsAttributeName');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreTextModule := dlopen(MarshaledAString(libCoreText), RTLD_LAZY);

finalization

dlclose(CoreTextModule);
{$ENDIF IOS}

end.
