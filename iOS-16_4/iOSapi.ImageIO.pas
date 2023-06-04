{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework ImageIO
//

unit iOSapi.ImageIO;

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
  kCGImageAnimationStatus_ParameterError = -22140;
  kCGImageAnimationStatus_CorruptInputImage = -22141;
  kCGImageAnimationStatus_UnsupportedFormat = -22142;
  kCGImageAnimationStatus_IncompleteInputImage = -22143;
  kCGImageAnimationStatus_AllocationFailure = -22144;
  kCGImageMetadataTypeInvalid = -1;
  kCGImageMetadataTypeDefault = 0;
  kCGImageMetadataTypeString = 1;
  kCGImageMetadataTypeArrayUnordered = 2;
  kCGImageMetadataTypeArrayOrdered = 3;
  kCGImageMetadataTypeAlternateArray = 4;
  kCGImageMetadataTypeAlternateText = 5;
  kCGImageMetadataTypeStructure = 6;
  kCGImageMetadataErrorUnknown = 0;
  kCGImageMetadataErrorUnsupportedFormat = 1;
  kCGImageMetadataErrorBadArgument = 2;
  kCGImageMetadataErrorConflictingArguments = 3;
  kCGImageMetadataErrorPrefixConflict = 4;
  kCGImageStatusUnexpectedEOF = -5;
  kCGImageStatusInvalidData = -4;
  kCGImageStatusUnknownType = -3;
  kCGImageStatusReadingHeader = -2;
  kCGImageStatusIncomplete = -1;
  kCGImageStatusComplete = 0;
  kCGImagePropertyOrientationUp = 1;
  kCGImagePropertyOrientationUpMirrored = 2;
  kCGImagePropertyOrientationDown = 3;
  kCGImagePropertyOrientationDownMirrored = 4;
  kCGImagePropertyOrientationLeftMirrored = 5;
  kCGImagePropertyOrientationRight = 6;
  kCGImagePropertyOrientationRightMirrored = 7;
  kCGImagePropertyOrientationLeft = 8;
  kCGImageTGACompressionNone = 0;
  kCGImageTGACompressionRLE = 1;

type
  // ===== Framework typedefs =====
{$M+}
  OSStatus = Int32;
  POSStatus = ^OSStatus;
  CGImageAnimationStatus = OSStatus;
  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  CGImageRef = Pointer;
  PCGImageRef = ^CGImageRef;
  CGImageSourceAnimationBlock = procedure(param1: LongWord; param2: CGImageRef;
    param3: PInteger) of object;
  CFURLRef = Pointer;
  PCFURLRef = ^CFURLRef;
  CFDictionaryRef = Pointer;
  PCFDictionaryRef = ^CFDictionaryRef;
  CFDataRef = Pointer;
  PCFDataRef = ^CFDataRef;
  CGImageDestinationRef = Pointer;
  PCGImageDestinationRef = ^CGImageDestinationRef;
  CGImageSourceRef = Pointer;
  PCGImageSourceRef = ^CGImageSourceRef;
  CGImageMetadataRef = Pointer;
  PCGImageMetadataRef = ^CGImageMetadataRef;
  CFTypeID = LongWord;
  PCFTypeID = ^CFTypeID;

  CGMutableImageMetadataRef = Pointer;
  PCGMutableImageMetadataRef = ^CGMutableImageMetadataRef;
  CGImageMetadataTagRef = Pointer;
  PCGImageMetadataTagRef = ^CGImageMetadataTagRef;
  CGImageMetadataType = Int32;
  CFTypeRef = Pointer;
  PCFTypeRef = ^CFTypeRef;
  CFArrayRef = Pointer;
  PCFArrayRef = ^CFArrayRef;
  CGImageMetadataTagBlock = function(param1: CFStringRef;
    param2: CGImageMetadataTagRef): Integer; cdecl;
  CGImageMetadataErrors = Int32;
  CGImageSourceStatus = Int32;
  CGDataProviderRef = Pointer;
  PCGDataProviderRef = ^CGDataProviderRef;
  CGDataConsumerRef = Pointer;
  PCGDataConsumerRef = ^CGDataConsumerRef;
  CFMutableDataRef = Pointer;
  PCFMutableDataRef = ^CFMutableDataRef;
  CGImagePropertyOrientation = LongWord;
  CGImagePropertyTGACompression = LongWord;
  // ===== Exported string consts =====

function kCGImageAnimationStartIndex: Pointer;
function kCGImageAnimationDelayTime: Pointer;
function kCGImageAnimationLoopCount: Pointer;
function kCGImageMetadataNamespaceExif: Pointer;
function kCGImageMetadataNamespaceExifAux: Pointer;
function kCGImageMetadataNamespaceExifEX: Pointer;
function kCGImageMetadataNamespaceDublinCore: Pointer;
function kCGImageMetadataNamespaceIPTCCore: Pointer;
function kCGImageMetadataNamespaceIPTCExtension: Pointer;
function kCGImageMetadataNamespacePhotoshop: Pointer;
function kCGImageMetadataNamespaceTIFF: Pointer;
function kCGImageMetadataNamespaceXMPBasic: Pointer;
function kCGImageMetadataNamespaceXMPRights: Pointer;
function kCGImageMetadataPrefixExif: Pointer;
function kCGImageMetadataPrefixExifAux: Pointer;
function kCGImageMetadataPrefixExifEX: Pointer;
function kCGImageMetadataPrefixDublinCore: Pointer;
function kCGImageMetadataPrefixIPTCCore: Pointer;
function kCGImageMetadataPrefixIPTCExtension: Pointer;
function kCGImageMetadataPrefixPhotoshop: Pointer;
function kCGImageMetadataPrefixTIFF: Pointer;
function kCGImageMetadataPrefixXMPBasic: Pointer;
function kCGImageMetadataPrefixXMPRights: Pointer;
function kCGImageMetadataEnumerateRecursively: Pointer;
function kCFErrorDomainCGImageMetadata: Pointer;
function kCGImageSourceTypeIdentifierHint: Pointer;
function kCGImageSourceShouldCache: Pointer;
function kCGImageSourceShouldCacheImmediately: Pointer;
function kCGImageSourceShouldAllowFloat: Pointer;
function kCGImageSourceCreateThumbnailFromImageIfAbsent: Pointer;
function kCGImageSourceCreateThumbnailFromImageAlways: Pointer;
function kCGImageSourceThumbnailMaxPixelSize: Pointer;
function kCGImageSourceCreateThumbnailWithTransform: Pointer;
function kCGImageSourceSubsampleFactor: Pointer;
function kCGImageDestinationLossyCompressionQuality: Pointer;
function kCGImageDestinationBackgroundColor: Pointer;
function kCGImageDestinationImageMaxPixelSize: Pointer;
function kCGImageDestinationEmbedThumbnail: Pointer;
function kCGImageDestinationOptimizeColorForSharing: Pointer;
function kCGImageDestinationPreserveGainMap: Pointer;
function kCGImageDestinationMetadata: Pointer;
function kCGImageDestinationMergeMetadata: Pointer;
function kCGImageMetadataShouldExcludeXMP: Pointer;
function kCGImageMetadataShouldExcludeGPS: Pointer;
function kCGImageDestinationDateTime: Pointer;
function kCGImageDestinationOrientation: Pointer;
function kCGImagePropertyTIFFDictionary: Pointer;
function kCGImagePropertyGIFDictionary: Pointer;
function kCGImagePropertyJFIFDictionary: Pointer;
function kCGImagePropertyHEIFDictionary: Pointer;
function kCGImagePropertyHEICSDictionary: Pointer;
function kCGImagePropertyExifDictionary: Pointer;
function kCGImagePropertyPNGDictionary: Pointer;
function kCGImagePropertyIPTCDictionary: Pointer;
function kCGImagePropertyGPSDictionary: Pointer;
function kCGImagePropertyRawDictionary: Pointer;
function kCGImagePropertyCIFFDictionary: Pointer;
function kCGImagePropertyMakerCanonDictionary: Pointer;
function kCGImagePropertyMakerNikonDictionary: Pointer;
function kCGImagePropertyMakerMinoltaDictionary: Pointer;
function kCGImagePropertyMakerFujiDictionary: Pointer;
function kCGImagePropertyMakerOlympusDictionary: Pointer;
function kCGImagePropertyMakerPentaxDictionary: Pointer;
function kCGImageProperty8BIMDictionary: Pointer;
function kCGImagePropertyDNGDictionary: Pointer;
function kCGImagePropertyExifAuxDictionary: Pointer;
function kCGImagePropertyOpenEXRDictionary: Pointer;
function kCGImagePropertyMakerAppleDictionary: Pointer;
function kCGImagePropertyFileContentsDictionary: Pointer;
function kCGImagePropertyWebPDictionary: Pointer;
function kCGImagePropertyTGADictionary: Pointer;
function kCGImagePropertyFileSize: Pointer;
function kCGImagePropertyPixelHeight: Pointer;
function kCGImagePropertyPixelWidth: Pointer;
function kCGImagePropertyDPIHeight: Pointer;
function kCGImagePropertyDPIWidth: Pointer;
function kCGImagePropertyDepth: Pointer;
function kCGImagePropertyOrientation: Pointer;
function kCGImagePropertyIsFloat: Pointer;
function kCGImagePropertyIsIndexed: Pointer;
function kCGImagePropertyHasAlpha: Pointer;
function kCGImagePropertyColorModel: Pointer;
function kCGImagePropertyProfileName: Pointer;
function kCGImagePropertyPrimaryImage: Pointer;
function kCGImagePropertyColorModelRGB: Pointer;
function kCGImagePropertyColorModelGray: Pointer;
function kCGImagePropertyColorModelCMYK: Pointer;
function kCGImagePropertyColorModelLab: Pointer;
function kCGImagePropertyTIFFCompression: Pointer;
function kCGImagePropertyTIFFPhotometricInterpretation: Pointer;
function kCGImagePropertyTIFFDocumentName: Pointer;
function kCGImagePropertyTIFFImageDescription: Pointer;
function kCGImagePropertyTIFFMake: Pointer;
function kCGImagePropertyTIFFModel: Pointer;
function kCGImagePropertyTIFFOrientation: Pointer;
function kCGImagePropertyTIFFXResolution: Pointer;
function kCGImagePropertyTIFFYResolution: Pointer;
function kCGImagePropertyTIFFResolutionUnit: Pointer;
function kCGImagePropertyTIFFSoftware: Pointer;
function kCGImagePropertyTIFFTransferFunction: Pointer;
function kCGImagePropertyTIFFDateTime: Pointer;
function kCGImagePropertyTIFFArtist: Pointer;
function kCGImagePropertyTIFFHostComputer: Pointer;
function kCGImagePropertyTIFFCopyright: Pointer;
function kCGImagePropertyTIFFWhitePoint: Pointer;
function kCGImagePropertyTIFFPrimaryChromaticities: Pointer;
function kCGImagePropertyTIFFTileWidth: Pointer;
function kCGImagePropertyTIFFTileLength: Pointer;
function kCGImagePropertyJFIFVersion: Pointer;
function kCGImagePropertyJFIFXDensity: Pointer;
function kCGImagePropertyJFIFYDensity: Pointer;
function kCGImagePropertyJFIFDensityUnit: Pointer;
function kCGImagePropertyJFIFIsProgressive: Pointer;
function kCGImagePropertyHEICSLoopCount: Pointer;
function kCGImagePropertyHEICSDelayTime: Pointer;
function kCGImagePropertyHEICSUnclampedDelayTime: Pointer;
function kCGImagePropertyHEICSCanvasPixelWidth: Pointer;
function kCGImagePropertyHEICSCanvasPixelHeight: Pointer;
function kCGImagePropertyHEICSFrameInfoArray: Pointer;
function kCGImagePropertyExifExposureTime: Pointer;
function kCGImagePropertyExifFNumber: Pointer;
function kCGImagePropertyExifExposureProgram: Pointer;
function kCGImagePropertyExifSpectralSensitivity: Pointer;
function kCGImagePropertyExifISOSpeedRatings: Pointer;
function kCGImagePropertyExifOECF: Pointer;
function kCGImagePropertyExifSensitivityType: Pointer;
function kCGImagePropertyExifStandardOutputSensitivity: Pointer;
function kCGImagePropertyExifRecommendedExposureIndex: Pointer;
function kCGImagePropertyExifISOSpeed: Pointer;
function kCGImagePropertyExifISOSpeedLatitudeyyy: Pointer;
function kCGImagePropertyExifISOSpeedLatitudezzz: Pointer;
function kCGImagePropertyExifVersion: Pointer;
function kCGImagePropertyExifDateTimeOriginal: Pointer;
function kCGImagePropertyExifDateTimeDigitized: Pointer;
function kCGImagePropertyExifOffsetTime: Pointer;
function kCGImagePropertyExifOffsetTimeOriginal: Pointer;
function kCGImagePropertyExifOffsetTimeDigitized: Pointer;
function kCGImagePropertyExifComponentsConfiguration: Pointer;
function kCGImagePropertyExifCompressedBitsPerPixel: Pointer;
function kCGImagePropertyExifShutterSpeedValue: Pointer;
function kCGImagePropertyExifApertureValue: Pointer;
function kCGImagePropertyExifBrightnessValue: Pointer;
function kCGImagePropertyExifExposureBiasValue: Pointer;
function kCGImagePropertyExifMaxApertureValue: Pointer;
function kCGImagePropertyExifSubjectDistance: Pointer;
function kCGImagePropertyExifMeteringMode: Pointer;
function kCGImagePropertyExifLightSource: Pointer;
function kCGImagePropertyExifFlash: Pointer;
function kCGImagePropertyExifFocalLength: Pointer;
function kCGImagePropertyExifSubjectArea: Pointer;
function kCGImagePropertyExifMakerNote: Pointer;
function kCGImagePropertyExifUserComment: Pointer;
function kCGImagePropertyExifSubsecTime: Pointer;
function kCGImagePropertyExifSubsecTimeOriginal: Pointer;
function kCGImagePropertyExifSubsecTimeDigitized: Pointer;
function kCGImagePropertyExifFlashPixVersion: Pointer;
function kCGImagePropertyExifColorSpace: Pointer;
function kCGImagePropertyExifPixelXDimension: Pointer;
function kCGImagePropertyExifPixelYDimension: Pointer;
function kCGImagePropertyExifRelatedSoundFile: Pointer;
function kCGImagePropertyExifFlashEnergy: Pointer;
function kCGImagePropertyExifSpatialFrequencyResponse: Pointer;
function kCGImagePropertyExifFocalPlaneXResolution: Pointer;
function kCGImagePropertyExifFocalPlaneYResolution: Pointer;
function kCGImagePropertyExifFocalPlaneResolutionUnit: Pointer;
function kCGImagePropertyExifSubjectLocation: Pointer;
function kCGImagePropertyExifExposureIndex: Pointer;
function kCGImagePropertyExifSensingMethod: Pointer;
function kCGImagePropertyExifFileSource: Pointer;
function kCGImagePropertyExifSceneType: Pointer;
function kCGImagePropertyExifCFAPattern: Pointer;
function kCGImagePropertyExifCustomRendered: Pointer;
function kCGImagePropertyExifExposureMode: Pointer;
function kCGImagePropertyExifWhiteBalance: Pointer;
function kCGImagePropertyExifDigitalZoomRatio: Pointer;
function kCGImagePropertyExifFocalLenIn35mmFilm: Pointer;
function kCGImagePropertyExifSceneCaptureType: Pointer;
function kCGImagePropertyExifGainControl: Pointer;
function kCGImagePropertyExifContrast: Pointer;
function kCGImagePropertyExifSaturation: Pointer;
function kCGImagePropertyExifSharpness: Pointer;
function kCGImagePropertyExifDeviceSettingDescription: Pointer;
function kCGImagePropertyExifSubjectDistRange: Pointer;
function kCGImagePropertyExifImageUniqueID: Pointer;
function kCGImagePropertyExifCameraOwnerName: Pointer;
function kCGImagePropertyExifBodySerialNumber: Pointer;
function kCGImagePropertyExifLensSpecification: Pointer;
function kCGImagePropertyExifLensMake: Pointer;
function kCGImagePropertyExifLensModel: Pointer;
function kCGImagePropertyExifLensSerialNumber: Pointer;
function kCGImagePropertyExifGamma: Pointer;
function kCGImagePropertyExifCompositeImage: Pointer;
function kCGImagePropertyExifSourceImageNumberOfCompositeImage: Pointer;
function kCGImagePropertyExifSourceExposureTimesOfCompositeImage: Pointer;
function kCGImagePropertyExifSubsecTimeOrginal: Pointer;
function kCGImagePropertyExifAuxLensInfo: Pointer;
function kCGImagePropertyExifAuxLensModel: Pointer;
function kCGImagePropertyExifAuxSerialNumber: Pointer;
function kCGImagePropertyExifAuxLensID: Pointer;
function kCGImagePropertyExifAuxLensSerialNumber: Pointer;
function kCGImagePropertyExifAuxImageNumber: Pointer;
function kCGImagePropertyExifAuxFlashCompensation: Pointer;
function kCGImagePropertyExifAuxOwnerName: Pointer;
function kCGImagePropertyExifAuxFirmware: Pointer;
function kCGImagePropertyGIFLoopCount: Pointer;
function kCGImagePropertyGIFDelayTime: Pointer;
function kCGImagePropertyGIFImageColorMap: Pointer;
function kCGImagePropertyGIFHasGlobalColorMap: Pointer;
function kCGImagePropertyGIFUnclampedDelayTime: Pointer;
function kCGImagePropertyGIFCanvasPixelWidth: Pointer;
function kCGImagePropertyGIFCanvasPixelHeight: Pointer;
function kCGImagePropertyGIFFrameInfoArray: Pointer;
function kCGImagePropertyPNGAuthor: Pointer;
function kCGImagePropertyPNGChromaticities: Pointer;
function kCGImagePropertyPNGComment: Pointer;
function kCGImagePropertyPNGCopyright: Pointer;
function kCGImagePropertyPNGCreationTime: Pointer;
function kCGImagePropertyPNGDescription: Pointer;
function kCGImagePropertyPNGDisclaimer: Pointer;
function kCGImagePropertyPNGGamma: Pointer;
function kCGImagePropertyPNGInterlaceType: Pointer;
function kCGImagePropertyPNGModificationTime: Pointer;
function kCGImagePropertyPNGSoftware: Pointer;
function kCGImagePropertyPNGSource: Pointer;
function kCGImagePropertyPNGsRGBIntent: Pointer;
function kCGImagePropertyPNGTitle: Pointer;
function kCGImagePropertyPNGWarning: Pointer;
function kCGImagePropertyPNGXPixelsPerMeter: Pointer;
function kCGImagePropertyPNGYPixelsPerMeter: Pointer;
function kCGImagePropertyPNGPixelsAspectRatio: Pointer;
function kCGImagePropertyAPNGLoopCount: Pointer;
function kCGImagePropertyAPNGDelayTime: Pointer;
function kCGImagePropertyAPNGUnclampedDelayTime: Pointer;
function kCGImagePropertyAPNGFrameInfoArray: Pointer;
function kCGImagePropertyAPNGCanvasPixelWidth: Pointer;
function kCGImagePropertyAPNGCanvasPixelHeight: Pointer;
function kCGImagePropertyWebPLoopCount: Pointer;
function kCGImagePropertyWebPDelayTime: Pointer;
function kCGImagePropertyWebPUnclampedDelayTime: Pointer;
function kCGImagePropertyWebPFrameInfoArray: Pointer;
function kCGImagePropertyWebPCanvasPixelWidth: Pointer;
function kCGImagePropertyWebPCanvasPixelHeight: Pointer;
function kCGImagePropertyGPSVersion: Pointer;
function kCGImagePropertyGPSLatitudeRef: Pointer;
function kCGImagePropertyGPSLatitude: Pointer;
function kCGImagePropertyGPSLongitudeRef: Pointer;
function kCGImagePropertyGPSLongitude: Pointer;
function kCGImagePropertyGPSAltitudeRef: Pointer;
function kCGImagePropertyGPSAltitude: Pointer;
function kCGImagePropertyGPSTimeStamp: Pointer;
function kCGImagePropertyGPSSatellites: Pointer;
function kCGImagePropertyGPSStatus: Pointer;
function kCGImagePropertyGPSMeasureMode: Pointer;
function kCGImagePropertyGPSDOP: Pointer;
function kCGImagePropertyGPSSpeedRef: Pointer;
function kCGImagePropertyGPSSpeed: Pointer;
function kCGImagePropertyGPSTrackRef: Pointer;
function kCGImagePropertyGPSTrack: Pointer;
function kCGImagePropertyGPSImgDirectionRef: Pointer;
function kCGImagePropertyGPSImgDirection: Pointer;
function kCGImagePropertyGPSMapDatum: Pointer;
function kCGImagePropertyGPSDestLatitudeRef: Pointer;
function kCGImagePropertyGPSDestLatitude: Pointer;
function kCGImagePropertyGPSDestLongitudeRef: Pointer;
function kCGImagePropertyGPSDestLongitude: Pointer;
function kCGImagePropertyGPSDestBearingRef: Pointer;
function kCGImagePropertyGPSDestBearing: Pointer;
function kCGImagePropertyGPSDestDistanceRef: Pointer;
function kCGImagePropertyGPSDestDistance: Pointer;
function kCGImagePropertyGPSProcessingMethod: Pointer;
function kCGImagePropertyGPSAreaInformation: Pointer;
function kCGImagePropertyGPSDateStamp: Pointer;
function kCGImagePropertyGPSDifferental: Pointer;
function kCGImagePropertyGPSHPositioningError: Pointer;
function kCGImagePropertyIPTCObjectTypeReference: Pointer;
function kCGImagePropertyIPTCObjectAttributeReference: Pointer;
function kCGImagePropertyIPTCObjectName: Pointer;
function kCGImagePropertyIPTCEditStatus: Pointer;
function kCGImagePropertyIPTCEditorialUpdate: Pointer;
function kCGImagePropertyIPTCUrgency: Pointer;
function kCGImagePropertyIPTCSubjectReference: Pointer;
function kCGImagePropertyIPTCCategory: Pointer;
function kCGImagePropertyIPTCSupplementalCategory: Pointer;
function kCGImagePropertyIPTCFixtureIdentifier: Pointer;
function kCGImagePropertyIPTCKeywords: Pointer;
function kCGImagePropertyIPTCContentLocationCode: Pointer;
function kCGImagePropertyIPTCContentLocationName: Pointer;
function kCGImagePropertyIPTCReleaseDate: Pointer;
function kCGImagePropertyIPTCReleaseTime: Pointer;
function kCGImagePropertyIPTCExpirationDate: Pointer;
function kCGImagePropertyIPTCExpirationTime: Pointer;
function kCGImagePropertyIPTCSpecialInstructions: Pointer;
function kCGImagePropertyIPTCActionAdvised: Pointer;
function kCGImagePropertyIPTCReferenceService: Pointer;
function kCGImagePropertyIPTCReferenceDate: Pointer;
function kCGImagePropertyIPTCReferenceNumber: Pointer;
function kCGImagePropertyIPTCDateCreated: Pointer;
function kCGImagePropertyIPTCTimeCreated: Pointer;
function kCGImagePropertyIPTCDigitalCreationDate: Pointer;
function kCGImagePropertyIPTCDigitalCreationTime: Pointer;
function kCGImagePropertyIPTCOriginatingProgram: Pointer;
function kCGImagePropertyIPTCProgramVersion: Pointer;
function kCGImagePropertyIPTCObjectCycle: Pointer;
function kCGImagePropertyIPTCByline: Pointer;
function kCGImagePropertyIPTCBylineTitle: Pointer;
function kCGImagePropertyIPTCCity: Pointer;
function kCGImagePropertyIPTCSubLocation: Pointer;
function kCGImagePropertyIPTCProvinceState: Pointer;
function kCGImagePropertyIPTCCountryPrimaryLocationCode: Pointer;
function kCGImagePropertyIPTCCountryPrimaryLocationName: Pointer;
function kCGImagePropertyIPTCOriginalTransmissionReference: Pointer;
function kCGImagePropertyIPTCHeadline: Pointer;
function kCGImagePropertyIPTCCredit: Pointer;
function kCGImagePropertyIPTCSource: Pointer;
function kCGImagePropertyIPTCCopyrightNotice: Pointer;
function kCGImagePropertyIPTCContact: Pointer;
function kCGImagePropertyIPTCCaptionAbstract: Pointer;
function kCGImagePropertyIPTCWriterEditor: Pointer;
function kCGImagePropertyIPTCImageType: Pointer;
function kCGImagePropertyIPTCImageOrientation: Pointer;
function kCGImagePropertyIPTCLanguageIdentifier: Pointer;
function kCGImagePropertyIPTCStarRating: Pointer;
function kCGImagePropertyIPTCCreatorContactInfo: Pointer;
function kCGImagePropertyIPTCRightsUsageTerms: Pointer;
function kCGImagePropertyIPTCScene: Pointer;
function kCGImagePropertyIPTCExtAboutCvTerm: Pointer;
function kCGImagePropertyIPTCExtAboutCvTermCvId: Pointer;
function kCGImagePropertyIPTCExtAboutCvTermId: Pointer;
function kCGImagePropertyIPTCExtAboutCvTermName: Pointer;
function kCGImagePropertyIPTCExtAboutCvTermRefinedAbout: Pointer;
function kCGImagePropertyIPTCExtAddlModelInfo: Pointer;
function kCGImagePropertyIPTCExtArtworkOrObject: Pointer;
function kCGImagePropertyIPTCExtArtworkCircaDateCreated: Pointer;
function kCGImagePropertyIPTCExtArtworkContentDescription: Pointer;
function kCGImagePropertyIPTCExtArtworkContributionDescription: Pointer;
function kCGImagePropertyIPTCExtArtworkCopyrightNotice: Pointer;
function kCGImagePropertyIPTCExtArtworkCreator: Pointer;
function kCGImagePropertyIPTCExtArtworkCreatorID: Pointer;
function kCGImagePropertyIPTCExtArtworkCopyrightOwnerID: Pointer;
function kCGImagePropertyIPTCExtArtworkCopyrightOwnerName: Pointer;
function kCGImagePropertyIPTCExtArtworkLicensorID: Pointer;
function kCGImagePropertyIPTCExtArtworkLicensorName: Pointer;
function kCGImagePropertyIPTCExtArtworkDateCreated: Pointer;
function kCGImagePropertyIPTCExtArtworkPhysicalDescription: Pointer;
function kCGImagePropertyIPTCExtArtworkSource: Pointer;
function kCGImagePropertyIPTCExtArtworkSourceInventoryNo: Pointer;
function kCGImagePropertyIPTCExtArtworkSourceInvURL: Pointer;
function kCGImagePropertyIPTCExtArtworkStylePeriod: Pointer;
function kCGImagePropertyIPTCExtArtworkTitle: Pointer;
function kCGImagePropertyIPTCExtAudioBitrate: Pointer;
function kCGImagePropertyIPTCExtAudioBitrateMode: Pointer;
function kCGImagePropertyIPTCExtAudioChannelCount: Pointer;
function kCGImagePropertyIPTCExtCircaDateCreated: Pointer;
function kCGImagePropertyIPTCExtContainerFormat: Pointer;
function kCGImagePropertyIPTCExtContainerFormatIdentifier: Pointer;
function kCGImagePropertyIPTCExtContainerFormatName: Pointer;
function kCGImagePropertyIPTCExtContributor: Pointer;
function kCGImagePropertyIPTCExtContributorIdentifier: Pointer;
function kCGImagePropertyIPTCExtContributorName: Pointer;
function kCGImagePropertyIPTCExtContributorRole: Pointer;
function kCGImagePropertyIPTCExtCopyrightYear: Pointer;
function kCGImagePropertyIPTCExtCreator: Pointer;
function kCGImagePropertyIPTCExtCreatorIdentifier: Pointer;
function kCGImagePropertyIPTCExtCreatorName: Pointer;
function kCGImagePropertyIPTCExtCreatorRole: Pointer;
function kCGImagePropertyIPTCExtControlledVocabularyTerm: Pointer;
function kCGImagePropertyIPTCExtDataOnScreen: Pointer;
function kCGImagePropertyIPTCExtDataOnScreenRegion: Pointer;
function kCGImagePropertyIPTCExtDataOnScreenRegionD: Pointer;
function kCGImagePropertyIPTCExtDataOnScreenRegionH: Pointer;
function kCGImagePropertyIPTCExtDataOnScreenRegionText: Pointer;
function kCGImagePropertyIPTCExtDataOnScreenRegionUnit: Pointer;
function kCGImagePropertyIPTCExtDataOnScreenRegionW: Pointer;
function kCGImagePropertyIPTCExtDataOnScreenRegionX: Pointer;
function kCGImagePropertyIPTCExtDataOnScreenRegionY: Pointer;
function kCGImagePropertyIPTCExtDigitalImageGUID: Pointer;
function kCGImagePropertyIPTCExtDigitalSourceFileType: Pointer;
function kCGImagePropertyIPTCExtDigitalSourceType: Pointer;
function kCGImagePropertyIPTCExtDopesheet: Pointer;
function kCGImagePropertyIPTCExtDopesheetLink: Pointer;
function kCGImagePropertyIPTCExtDopesheetLinkLink: Pointer;
function kCGImagePropertyIPTCExtDopesheetLinkLinkQualifier: Pointer;
function kCGImagePropertyIPTCExtEmbdEncRightsExpr: Pointer;
function kCGImagePropertyIPTCExtEmbeddedEncodedRightsExpr: Pointer;
function kCGImagePropertyIPTCExtEmbeddedEncodedRightsExprType: Pointer;
function kCGImagePropertyIPTCExtEmbeddedEncodedRightsExprLangID: Pointer;
function kCGImagePropertyIPTCExtEpisode: Pointer;
function kCGImagePropertyIPTCExtEpisodeIdentifier: Pointer;
function kCGImagePropertyIPTCExtEpisodeName: Pointer;
function kCGImagePropertyIPTCExtEpisodeNumber: Pointer;
function kCGImagePropertyIPTCExtEvent: Pointer;
function kCGImagePropertyIPTCExtShownEvent: Pointer;
function kCGImagePropertyIPTCExtShownEventIdentifier: Pointer;
function kCGImagePropertyIPTCExtShownEventName: Pointer;
function kCGImagePropertyIPTCExtExternalMetadataLink: Pointer;
function kCGImagePropertyIPTCExtFeedIdentifier: Pointer;
function kCGImagePropertyIPTCExtGenre: Pointer;
function kCGImagePropertyIPTCExtGenreCvId: Pointer;
function kCGImagePropertyIPTCExtGenreCvTermId: Pointer;
function kCGImagePropertyIPTCExtGenreCvTermName: Pointer;
function kCGImagePropertyIPTCExtGenreCvTermRefinedAbout: Pointer;
function kCGImagePropertyIPTCExtHeadline: Pointer;
function kCGImagePropertyIPTCExtIPTCLastEdited: Pointer;
function kCGImagePropertyIPTCExtLinkedEncRightsExpr: Pointer;
function kCGImagePropertyIPTCExtLinkedEncodedRightsExpr: Pointer;
function kCGImagePropertyIPTCExtLinkedEncodedRightsExprType: Pointer;
function kCGImagePropertyIPTCExtLinkedEncodedRightsExprLangID: Pointer;
function kCGImagePropertyIPTCExtLocationCreated: Pointer;
function kCGImagePropertyIPTCExtLocationCity: Pointer;
function kCGImagePropertyIPTCExtLocationCountryCode: Pointer;
function kCGImagePropertyIPTCExtLocationCountryName: Pointer;
function kCGImagePropertyIPTCExtLocationGPSAltitude: Pointer;
function kCGImagePropertyIPTCExtLocationGPSLatitude: Pointer;
function kCGImagePropertyIPTCExtLocationGPSLongitude: Pointer;
function kCGImagePropertyIPTCExtLocationIdentifier: Pointer;
function kCGImagePropertyIPTCExtLocationLocationId: Pointer;
function kCGImagePropertyIPTCExtLocationLocationName: Pointer;
function kCGImagePropertyIPTCExtLocationProvinceState: Pointer;
function kCGImagePropertyIPTCExtLocationSublocation: Pointer;
function kCGImagePropertyIPTCExtLocationWorldRegion: Pointer;
function kCGImagePropertyIPTCExtLocationShown: Pointer;
function kCGImagePropertyIPTCExtMaxAvailHeight: Pointer;
function kCGImagePropertyIPTCExtMaxAvailWidth: Pointer;
function kCGImagePropertyIPTCExtModelAge: Pointer;
function kCGImagePropertyIPTCExtOrganisationInImageCode: Pointer;
function kCGImagePropertyIPTCExtOrganisationInImageName: Pointer;
function kCGImagePropertyIPTCExtPersonHeard: Pointer;
function kCGImagePropertyIPTCExtPersonHeardIdentifier: Pointer;
function kCGImagePropertyIPTCExtPersonHeardName: Pointer;
function kCGImagePropertyIPTCExtPersonInImage: Pointer;
function kCGImagePropertyIPTCExtPersonInImageWDetails: Pointer;
function kCGImagePropertyIPTCExtPersonInImageCharacteristic: Pointer;
function kCGImagePropertyIPTCExtPersonInImageCvTermCvId: Pointer;
function kCGImagePropertyIPTCExtPersonInImageCvTermId: Pointer;
function kCGImagePropertyIPTCExtPersonInImageCvTermName: Pointer;
function kCGImagePropertyIPTCExtPersonInImageCvTermRefinedAbout: Pointer;
function kCGImagePropertyIPTCExtPersonInImageDescription: Pointer;
function kCGImagePropertyIPTCExtPersonInImageId: Pointer;
function kCGImagePropertyIPTCExtPersonInImageName: Pointer;
function kCGImagePropertyIPTCExtProductInImage: Pointer;
function kCGImagePropertyIPTCExtProductInImageDescription: Pointer;
function kCGImagePropertyIPTCExtProductInImageGTIN: Pointer;
function kCGImagePropertyIPTCExtProductInImageName: Pointer;
function kCGImagePropertyIPTCExtPublicationEvent: Pointer;
function kCGImagePropertyIPTCExtPublicationEventDate: Pointer;
function kCGImagePropertyIPTCExtPublicationEventIdentifier: Pointer;
function kCGImagePropertyIPTCExtPublicationEventName: Pointer;
function kCGImagePropertyIPTCExtRating: Pointer;
function kCGImagePropertyIPTCExtRatingRatingRegion: Pointer;
function kCGImagePropertyIPTCExtRatingRegionCity: Pointer;
function kCGImagePropertyIPTCExtRatingRegionCountryCode: Pointer;
function kCGImagePropertyIPTCExtRatingRegionCountryName: Pointer;
function kCGImagePropertyIPTCExtRatingRegionGPSAltitude: Pointer;
function kCGImagePropertyIPTCExtRatingRegionGPSLatitude: Pointer;
function kCGImagePropertyIPTCExtRatingRegionGPSLongitude: Pointer;
function kCGImagePropertyIPTCExtRatingRegionIdentifier: Pointer;
function kCGImagePropertyIPTCExtRatingRegionLocationId: Pointer;
function kCGImagePropertyIPTCExtRatingRegionLocationName: Pointer;
function kCGImagePropertyIPTCExtRatingRegionProvinceState: Pointer;
function kCGImagePropertyIPTCExtRatingRegionSublocation: Pointer;
function kCGImagePropertyIPTCExtRatingRegionWorldRegion: Pointer;
function kCGImagePropertyIPTCExtRatingScaleMaxValue: Pointer;
function kCGImagePropertyIPTCExtRatingScaleMinValue: Pointer;
function kCGImagePropertyIPTCExtRatingSourceLink: Pointer;
function kCGImagePropertyIPTCExtRatingValue: Pointer;
function kCGImagePropertyIPTCExtRatingValueLogoLink: Pointer;
function kCGImagePropertyIPTCExtRegistryID: Pointer;
function kCGImagePropertyIPTCExtRegistryEntryRole: Pointer;
function kCGImagePropertyIPTCExtRegistryItemID: Pointer;
function kCGImagePropertyIPTCExtRegistryOrganisationID: Pointer;
function kCGImagePropertyIPTCExtReleaseReady: Pointer;
function kCGImagePropertyIPTCExtSeason: Pointer;
function kCGImagePropertyIPTCExtSeasonIdentifier: Pointer;
function kCGImagePropertyIPTCExtSeasonName: Pointer;
function kCGImagePropertyIPTCExtSeasonNumber: Pointer;
function kCGImagePropertyIPTCExtSeries: Pointer;
function kCGImagePropertyIPTCExtSeriesIdentifier: Pointer;
function kCGImagePropertyIPTCExtSeriesName: Pointer;
function kCGImagePropertyIPTCExtStorylineIdentifier: Pointer;
function kCGImagePropertyIPTCExtStreamReady: Pointer;
function kCGImagePropertyIPTCExtStylePeriod: Pointer;
function kCGImagePropertyIPTCExtSupplyChainSource: Pointer;
function kCGImagePropertyIPTCExtSupplyChainSourceIdentifier: Pointer;
function kCGImagePropertyIPTCExtSupplyChainSourceName: Pointer;
function kCGImagePropertyIPTCExtTemporalCoverage: Pointer;
function kCGImagePropertyIPTCExtTemporalCoverageFrom: Pointer;
function kCGImagePropertyIPTCExtTemporalCoverageTo: Pointer;
function kCGImagePropertyIPTCExtTranscript: Pointer;
function kCGImagePropertyIPTCExtTranscriptLink: Pointer;
function kCGImagePropertyIPTCExtTranscriptLinkLink: Pointer;
function kCGImagePropertyIPTCExtTranscriptLinkLinkQualifier: Pointer;
function kCGImagePropertyIPTCExtVideoBitrate: Pointer;
function kCGImagePropertyIPTCExtVideoBitrateMode: Pointer;
function kCGImagePropertyIPTCExtVideoDisplayAspectRatio: Pointer;
function kCGImagePropertyIPTCExtVideoEncodingProfile: Pointer;
function kCGImagePropertyIPTCExtVideoShotType: Pointer;
function kCGImagePropertyIPTCExtVideoShotTypeIdentifier: Pointer;
function kCGImagePropertyIPTCExtVideoShotTypeName: Pointer;
function kCGImagePropertyIPTCExtVideoStreamsCount: Pointer;
function kCGImagePropertyIPTCExtVisualColor: Pointer;
function kCGImagePropertyIPTCExtWorkflowTag: Pointer;
function kCGImagePropertyIPTCExtWorkflowTagCvId: Pointer;
function kCGImagePropertyIPTCExtWorkflowTagCvTermId: Pointer;
function kCGImagePropertyIPTCExtWorkflowTagCvTermName: Pointer;
function kCGImagePropertyIPTCExtWorkflowTagCvTermRefinedAbout: Pointer;
function kCGImagePropertyIPTCContactInfoCity: Pointer;
function kCGImagePropertyIPTCContactInfoCountry: Pointer;
function kCGImagePropertyIPTCContactInfoAddress: Pointer;
function kCGImagePropertyIPTCContactInfoPostalCode: Pointer;
function kCGImagePropertyIPTCContactInfoStateProvince: Pointer;
function kCGImagePropertyIPTCContactInfoEmails: Pointer;
function kCGImagePropertyIPTCContactInfoPhones: Pointer;
function kCGImagePropertyIPTCContactInfoWebURLs: Pointer;
function kCGImageProperty8BIMLayerNames: Pointer;
function kCGImageProperty8BIMVersion: Pointer;
function kCGImagePropertyDNGVersion: Pointer;
function kCGImagePropertyDNGBackwardVersion: Pointer;
function kCGImagePropertyDNGUniqueCameraModel: Pointer;
function kCGImagePropertyDNGLocalizedCameraModel: Pointer;
function kCGImagePropertyDNGCameraSerialNumber: Pointer;
function kCGImagePropertyDNGLensInfo: Pointer;
function kCGImagePropertyDNGBlackLevel: Pointer;
function kCGImagePropertyDNGWhiteLevel: Pointer;
function kCGImagePropertyDNGCalibrationIlluminant1: Pointer;
function kCGImagePropertyDNGCalibrationIlluminant2: Pointer;
function kCGImagePropertyDNGColorMatrix1: Pointer;
function kCGImagePropertyDNGColorMatrix2: Pointer;
function kCGImagePropertyDNGCameraCalibration1: Pointer;
function kCGImagePropertyDNGCameraCalibration2: Pointer;
function kCGImagePropertyDNGAsShotNeutral: Pointer;
function kCGImagePropertyDNGAsShotWhiteXY: Pointer;
function kCGImagePropertyDNGBaselineExposure: Pointer;
function kCGImagePropertyDNGBaselineNoise: Pointer;
function kCGImagePropertyDNGBaselineSharpness: Pointer;
function kCGImagePropertyDNGPrivateData: Pointer;
function kCGImagePropertyDNGCameraCalibrationSignature: Pointer;
function kCGImagePropertyDNGProfileCalibrationSignature: Pointer;
function kCGImagePropertyDNGNoiseProfile: Pointer;
function kCGImagePropertyDNGWarpRectilinear: Pointer;
function kCGImagePropertyDNGWarpFisheye: Pointer;
function kCGImagePropertyDNGFixVignetteRadial: Pointer;
function kCGImagePropertyDNGActiveArea: Pointer;
function kCGImagePropertyDNGAnalogBalance: Pointer;
function kCGImagePropertyDNGAntiAliasStrength: Pointer;
function kCGImagePropertyDNGAsShotICCProfile: Pointer;
function kCGImagePropertyDNGAsShotPreProfileMatrix: Pointer;
function kCGImagePropertyDNGAsShotProfileName: Pointer;
function kCGImagePropertyDNGBaselineExposureOffset: Pointer;
function kCGImagePropertyDNGBayerGreenSplit: Pointer;
function kCGImagePropertyDNGBestQualityScale: Pointer;
function kCGImagePropertyDNGBlackLevelDeltaH: Pointer;
function kCGImagePropertyDNGBlackLevelDeltaV: Pointer;
function kCGImagePropertyDNGBlackLevelRepeatDim: Pointer;
function kCGImagePropertyDNGCFALayout: Pointer;
function kCGImagePropertyDNGCFAPlaneColor: Pointer;
function kCGImagePropertyDNGChromaBlurRadius: Pointer;
function kCGImagePropertyDNGColorimetricReference: Pointer;
function kCGImagePropertyDNGCurrentICCProfile: Pointer;
function kCGImagePropertyDNGCurrentPreProfileMatrix: Pointer;
function kCGImagePropertyDNGDefaultBlackRender: Pointer;
function kCGImagePropertyDNGDefaultCropOrigin: Pointer;
function kCGImagePropertyDNGDefaultCropSize: Pointer;
function kCGImagePropertyDNGDefaultScale: Pointer;
function kCGImagePropertyDNGDefaultUserCrop: Pointer;
function kCGImagePropertyDNGExtraCameraProfiles: Pointer;
function kCGImagePropertyDNGForwardMatrix1: Pointer;
function kCGImagePropertyDNGForwardMatrix2: Pointer;
function kCGImagePropertyDNGLinearizationTable: Pointer;
function kCGImagePropertyDNGLinearResponseLimit: Pointer;
function kCGImagePropertyDNGMakerNoteSafety: Pointer;
function kCGImagePropertyDNGMaskedAreas: Pointer;
function kCGImagePropertyDNGNewRawImageDigest: Pointer;
function kCGImagePropertyDNGNoiseReductionApplied: Pointer;
function kCGImagePropertyDNGOpcodeList1: Pointer;
function kCGImagePropertyDNGOpcodeList2: Pointer;
function kCGImagePropertyDNGOpcodeList3: Pointer;
function kCGImagePropertyDNGOriginalBestQualityFinalSize: Pointer;
function kCGImagePropertyDNGOriginalDefaultCropSize: Pointer;
function kCGImagePropertyDNGOriginalDefaultFinalSize: Pointer;
function kCGImagePropertyDNGOriginalRawFileData: Pointer;
function kCGImagePropertyDNGOriginalRawFileDigest: Pointer;
function kCGImagePropertyDNGOriginalRawFileName: Pointer;
function kCGImagePropertyDNGPreviewApplicationName: Pointer;
function kCGImagePropertyDNGPreviewApplicationVersion: Pointer;
function kCGImagePropertyDNGPreviewColorSpace: Pointer;
function kCGImagePropertyDNGPreviewDateTime: Pointer;
function kCGImagePropertyDNGPreviewSettingsDigest: Pointer;
function kCGImagePropertyDNGPreviewSettingsName: Pointer;
function kCGImagePropertyDNGProfileCopyright: Pointer;
function kCGImagePropertyDNGProfileEmbedPolicy: Pointer;
function kCGImagePropertyDNGProfileHueSatMapData1: Pointer;
function kCGImagePropertyDNGProfileHueSatMapData2: Pointer;
function kCGImagePropertyDNGProfileHueSatMapDims: Pointer;
function kCGImagePropertyDNGProfileHueSatMapEncoding: Pointer;
function kCGImagePropertyDNGProfileLookTableData: Pointer;
function kCGImagePropertyDNGProfileLookTableDims: Pointer;
function kCGImagePropertyDNGProfileLookTableEncoding: Pointer;
function kCGImagePropertyDNGProfileName: Pointer;
function kCGImagePropertyDNGProfileToneCurve: Pointer;
function kCGImagePropertyDNGRawDataUniqueID: Pointer;
function kCGImagePropertyDNGRawImageDigest: Pointer;
function kCGImagePropertyDNGRawToPreviewGain: Pointer;
function kCGImagePropertyDNGReductionMatrix1: Pointer;
function kCGImagePropertyDNGReductionMatrix2: Pointer;
function kCGImagePropertyDNGRowInterleaveFactor: Pointer;
function kCGImagePropertyDNGShadowScale: Pointer;
function kCGImagePropertyDNGSubTileBlockSize: Pointer;
function kCGImagePropertyCIFFDescription: Pointer;
function kCGImagePropertyCIFFFirmware: Pointer;
function kCGImagePropertyCIFFOwnerName: Pointer;
function kCGImagePropertyCIFFImageName: Pointer;
function kCGImagePropertyCIFFImageFileName: Pointer;
function kCGImagePropertyCIFFReleaseMethod: Pointer;
function kCGImagePropertyCIFFReleaseTiming: Pointer;
function kCGImagePropertyCIFFRecordID: Pointer;
function kCGImagePropertyCIFFSelfTimingTime: Pointer;
function kCGImagePropertyCIFFCameraSerialNumber: Pointer;
function kCGImagePropertyCIFFImageSerialNumber: Pointer;
function kCGImagePropertyCIFFContinuousDrive: Pointer;
function kCGImagePropertyCIFFFocusMode: Pointer;
function kCGImagePropertyCIFFMeteringMode: Pointer;
function kCGImagePropertyCIFFShootingMode: Pointer;
function kCGImagePropertyCIFFLensModel: Pointer;
function kCGImagePropertyCIFFLensMaxMM: Pointer;
function kCGImagePropertyCIFFLensMinMM: Pointer;
function kCGImagePropertyCIFFWhiteBalanceIndex: Pointer;
function kCGImagePropertyCIFFFlashExposureComp: Pointer;
function kCGImagePropertyCIFFMeasuredEV: Pointer;
function kCGImagePropertyMakerNikonISOSetting: Pointer;
function kCGImagePropertyMakerNikonColorMode: Pointer;
function kCGImagePropertyMakerNikonQuality: Pointer;
function kCGImagePropertyMakerNikonWhiteBalanceMode: Pointer;
function kCGImagePropertyMakerNikonSharpenMode: Pointer;
function kCGImagePropertyMakerNikonFocusMode: Pointer;
function kCGImagePropertyMakerNikonFlashSetting: Pointer;
function kCGImagePropertyMakerNikonISOSelection: Pointer;
function kCGImagePropertyMakerNikonFlashExposureComp: Pointer;
function kCGImagePropertyMakerNikonImageAdjustment: Pointer;
function kCGImagePropertyMakerNikonLensAdapter: Pointer;
function kCGImagePropertyMakerNikonLensType: Pointer;
function kCGImagePropertyMakerNikonLensInfo: Pointer;
function kCGImagePropertyMakerNikonFocusDistance: Pointer;
function kCGImagePropertyMakerNikonDigitalZoom: Pointer;
function kCGImagePropertyMakerNikonShootingMode: Pointer;
function kCGImagePropertyMakerNikonCameraSerialNumber: Pointer;
function kCGImagePropertyMakerNikonShutterCount: Pointer;
function kCGImagePropertyMakerCanonOwnerName: Pointer;
function kCGImagePropertyMakerCanonCameraSerialNumber: Pointer;
function kCGImagePropertyMakerCanonImageSerialNumber: Pointer;
function kCGImagePropertyMakerCanonFlashExposureComp: Pointer;
function kCGImagePropertyMakerCanonContinuousDrive: Pointer;
function kCGImagePropertyMakerCanonLensModel: Pointer;
function kCGImagePropertyMakerCanonFirmware: Pointer;
function kCGImagePropertyMakerCanonAspectRatioInfo: Pointer;
function kCGImagePropertyOpenEXRAspectRatio: Pointer;
function kCGImagePropertyTGACompression: Pointer;
function kCGImagePropertyPNGCompressionFilter: Pointer;
function kCGImagePropertyOpenEXRCompression: Pointer;
function kCGImagePropertyPNGTransparency: Pointer;
function kCGImageAuxiliaryDataTypeDepth: Pointer;
function kCGImageAuxiliaryDataTypeDisparity: Pointer;
function kCGImageAuxiliaryDataTypePortraitEffectsMatte: Pointer;
function kCGImageAuxiliaryDataTypeSemanticSegmentationSkinMatte: Pointer;
function kCGImageAuxiliaryDataTypeSemanticSegmentationHairMatte: Pointer;
function kCGImageAuxiliaryDataTypeSemanticSegmentationTeethMatte: Pointer;
function kCGImageAuxiliaryDataTypeSemanticSegmentationGlassesMatte: Pointer;
function kCGImageAuxiliaryDataTypeSemanticSegmentationSkyMatte: Pointer;
function kCGImageAuxiliaryDataTypeHDRGainMap: Pointer;
function kCGImageAuxiliaryDataInfoData: Pointer;
function kCGImageAuxiliaryDataInfoDataDescription: Pointer;
function kCGImageAuxiliaryDataInfoMetadata: Pointer;
function kCGImagePropertyImageCount: Pointer;
function kCGImagePropertyWidth: Pointer;
function kCGImagePropertyHeight: Pointer;
function kCGImagePropertyBytesPerRow: Pointer;
function kCGImagePropertyNamedColorSpace: Pointer;
function kCGImagePropertyPixelFormat: Pointer;
function kCGImagePropertyImages: Pointer;
function kCGImagePropertyThumbnailImages: Pointer;
function kCGImagePropertyAuxiliaryData: Pointer;
function kCGImagePropertyAuxiliaryDataType: Pointer;
function kCGImagePropertyImageIndex: Pointer;
function kCGImagePropertyGroups: Pointer;
function kCGImagePropertyGroupIndex: Pointer;
function kCGImagePropertyGroupType: Pointer;
function kCGImagePropertyGroupTypeStereoPair: Pointer;
function kCGImagePropertyGroupTypeAlternate: Pointer;
function kCGImagePropertyGroupImagesAlternate: Pointer;
function kCGImagePropertyGroupImageIndexLeft: Pointer;
function kCGImagePropertyGroupImageIndexRight: Pointer;
function kCGImagePropertyGroupImageIsLeftImage: Pointer;
function kCGImagePropertyGroupImageIsRightImage: Pointer;
function kCGImagePropertyGroupImageIsAlternateImage: Pointer;
function kCGImagePropertyGroupImageBaseline: Pointer;
function kCGImagePropertyGroupImageDisparityAdjustment: Pointer;
function kIIOMetadata_CameraExtrinsicsKey: Pointer;
function kIIOCameraExtrinsics_CoordinateSystemID: Pointer;
function kIIOCameraExtrinsics_Position: Pointer;
function kIIOCameraExtrinsics_Rotation: Pointer;
function kIIOMetadata_CameraModelKey: Pointer;
function kIIOCameraModel_ModelType: Pointer;
function kIIOCameraModelType_SimplifiedPinhole: Pointer;
function kIIOCameraModelType_GenericPinhole: Pointer;
function kIIOCameraModel_Intrinsics: Pointer;


// ===== External functions =====

const
  libImageIO = '/System/Library/Frameworks/ImageIO.framework/ImageIO';
function CGAnimateImageAtURLWithBlock(url: CFURLRef; options: CFDictionaryRef;
  block: CGImageSourceAnimationBlock): OSStatus; cdecl;
  external libImageIO name _PU + 'CGAnimateImageAtURLWithBlock';
function CGAnimateImageDataWithBlock(data: CFDataRef; options: CFDictionaryRef;
  block: CGImageSourceAnimationBlock): OSStatus; cdecl;
  external libImageIO name _PU + 'CGAnimateImageDataWithBlock';
function CGImageMetadataGetTypeID: CFTypeID; cdecl;
  external libImageIO name _PU + 'CGImageMetadataGetTypeID';
function CGImageMetadataCreateMutable: CGMutableImageMetadataRef; cdecl;
  external libImageIO name _PU + 'CGImageMetadataCreateMutable';
function CGImageMetadataCreateMutableCopy(metadata: CGImageMetadataRef)
  : CGMutableImageMetadataRef; cdecl;
  external libImageIO name _PU + 'CGImageMetadataCreateMutableCopy';
function CGImageMetadataTagGetTypeID: CFTypeID; cdecl;
  external libImageIO name _PU + 'CGImageMetadataTagGetTypeID';
function CGImageMetadataTagCreate(xmlns: CFStringRef; prefix: CFStringRef;
  name: CFStringRef; &type: CGImageMetadataType; value: CFTypeRef)
  : CGImageMetadataTagRef; cdecl;
  external libImageIO name _PU + 'CGImageMetadataTagCreate';
function CGImageMetadataTagCopyNamespace(tag: CGImageMetadataTagRef)
  : CFStringRef; cdecl; external libImageIO name _PU +
  'CGImageMetadataTagCopyNamespace';
function CGImageMetadataTagCopyPrefix(tag: CGImageMetadataTagRef): CFStringRef;
  cdecl; external libImageIO name _PU + 'CGImageMetadataTagCopyPrefix';
function CGImageMetadataTagCopyName(tag: CGImageMetadataTagRef): CFStringRef;
  cdecl; external libImageIO name _PU + 'CGImageMetadataTagCopyName';
function CGImageMetadataTagCopyValue(tag: CGImageMetadataTagRef): CFTypeRef;
  cdecl; external libImageIO name _PU + 'CGImageMetadataTagCopyValue';
function CGImageMetadataTagGetType(tag: CGImageMetadataTagRef)
  : CGImageMetadataType; cdecl;
  external libImageIO name _PU + 'CGImageMetadataTagGetType';
function CGImageMetadataTagCopyQualifiers(tag: CGImageMetadataTagRef)
  : CFArrayRef; cdecl; external libImageIO name _PU +
  'CGImageMetadataTagCopyQualifiers';
function CGImageMetadataCopyTags(metadata: CGImageMetadataRef): CFArrayRef;
  cdecl; external libImageIO name _PU + 'CGImageMetadataCopyTags';
function CGImageMetadataCopyTagWithPath(metadata: CGImageMetadataRef;
  parent: CGImageMetadataTagRef; path: CFStringRef): CGImageMetadataTagRef;
  cdecl; external libImageIO name _PU + 'CGImageMetadataCopyTagWithPath';
function CGImageMetadataCopyStringValueWithPath(metadata: CGImageMetadataRef;
  parent: CGImageMetadataTagRef; path: CFStringRef): CFStringRef; cdecl;
  external libImageIO name _PU + 'CGImageMetadataCopyStringValueWithPath';
function CGImageMetadataRegisterNamespaceForPrefix
  (metadata: CGMutableImageMetadataRef; xmlns: CFStringRef; prefix: CFStringRef;
  err: Pointer): Integer; cdecl;
  external libImageIO name _PU + 'CGImageMetadataRegisterNamespaceForPrefix';
function CGImageMetadataSetTagWithPath(metadata: CGMutableImageMetadataRef;
  parent: CGImageMetadataTagRef; path: CFStringRef; tag: CGImageMetadataTagRef)
  : Integer; cdecl; external libImageIO name _PU +
  'CGImageMetadataSetTagWithPath';
function CGImageMetadataSetValueWithPath(metadata: CGMutableImageMetadataRef;
  parent: CGImageMetadataTagRef; path: CFStringRef; value: CFTypeRef): Integer;
  cdecl; external libImageIO name _PU + 'CGImageMetadataSetValueWithPath';
function CGImageMetadataRemoveTagWithPath(metadata: CGMutableImageMetadataRef;
  parent: CGImageMetadataTagRef; path: CFStringRef): Integer; cdecl;
  external libImageIO name _PU + 'CGImageMetadataRemoveTagWithPath';
procedure CGImageMetadataEnumerateTagsUsingBlock(metadata: CGImageMetadataRef;
  rootPath: CFStringRef; options: CFDictionaryRef;
  block: CGImageMetadataTagBlock); cdecl;
  external libImageIO name _PU + 'CGImageMetadataEnumerateTagsUsingBlock';
function CGImageMetadataCopyTagMatchingImageProperty
  (metadata: CGImageMetadataRef; dictionaryName: CFStringRef;
  propertyName: CFStringRef): CGImageMetadataTagRef; cdecl;
  external libImageIO name _PU + 'CGImageMetadataCopyTagMatchingImageProperty';
function CGImageMetadataSetValueMatchingImageProperty
  (metadata: CGMutableImageMetadataRef; dictionaryName: CFStringRef;
  propertyName: CFStringRef; value: CFTypeRef): Integer; cdecl;
  external libImageIO name _PU + 'CGImageMetadataSetValueMatchingImageProperty';
function CGImageMetadataCreateXMPData(metadata: CGImageMetadataRef;
  options: CFDictionaryRef): CFDataRef; cdecl;
  external libImageIO name _PU + 'CGImageMetadataCreateXMPData';
function CGImageMetadataCreateFromXMPData(data: CFDataRef): CGImageMetadataRef;
  cdecl; external libImageIO name _PU + 'CGImageMetadataCreateFromXMPData';
function CGImageSourceGetTypeID: CFTypeID; cdecl;
  external libImageIO name _PU + 'CGImageSourceGetTypeID';
function CGImageSourceCopyTypeIdentifiers: CFArrayRef; cdecl;
  external libImageIO name _PU + 'CGImageSourceCopyTypeIdentifiers';
function CGImageSourceCreateWithDataProvider(provider: CGDataProviderRef;
  options: CFDictionaryRef): CGImageSourceRef; cdecl;
  external libImageIO name _PU + 'CGImageSourceCreateWithDataProvider';
function CGImageSourceCreateWithData(data: CFDataRef; options: CFDictionaryRef)
  : CGImageSourceRef; cdecl;
  external libImageIO name _PU + 'CGImageSourceCreateWithData';
function CGImageSourceCreateWithURL(url: CFURLRef; options: CFDictionaryRef)
  : CGImageSourceRef; cdecl;
  external libImageIO name _PU + 'CGImageSourceCreateWithURL';
function CGImageSourceGetType(isrc: CGImageSourceRef): CFStringRef; cdecl;
  external libImageIO name _PU + 'CGImageSourceGetType';
function CGImageSourceGetCount(isrc: CGImageSourceRef): LongWord; cdecl;
  external libImageIO name _PU + 'CGImageSourceGetCount';
function CGImageSourceCopyProperties(isrc: CGImageSourceRef;
  options: CFDictionaryRef): CFDictionaryRef; cdecl;
  external libImageIO name _PU + 'CGImageSourceCopyProperties';
function CGImageSourceCopyPropertiesAtIndex(isrc: CGImageSourceRef;
  index: LongWord; options: CFDictionaryRef): CFDictionaryRef; cdecl;
  external libImageIO name _PU + 'CGImageSourceCopyPropertiesAtIndex';
function CGImageSourceCopyMetadataAtIndex(isrc: CGImageSourceRef;
  index: LongWord; options: CFDictionaryRef): CGImageMetadataRef; cdecl;
  external libImageIO name _PU + 'CGImageSourceCopyMetadataAtIndex';
function CGImageSourceCreateImageAtIndex(isrc: CGImageSourceRef;
  index: LongWord; options: CFDictionaryRef): CGImageRef; cdecl;
  external libImageIO name _PU + 'CGImageSourceCreateImageAtIndex';
procedure CGImageSourceRemoveCacheAtIndex(isrc: CGImageSourceRef;
  index: LongWord); cdecl;
  external libImageIO name _PU + 'CGImageSourceRemoveCacheAtIndex';
function CGImageSourceCreateThumbnailAtIndex(isrc: CGImageSourceRef;
  index: LongWord; options: CFDictionaryRef): CGImageRef; cdecl;
  external libImageIO name _PU + 'CGImageSourceCreateThumbnailAtIndex';
function CGImageSourceCreateIncremental(options: CFDictionaryRef)
  : CGImageSourceRef; cdecl;
  external libImageIO name _PU + 'CGImageSourceCreateIncremental';
procedure CGImageSourceUpdateData(isrc: CGImageSourceRef; data: CFDataRef;
  final: Integer); cdecl;
  external libImageIO name _PU + 'CGImageSourceUpdateData';
procedure CGImageSourceUpdateDataProvider(isrc: CGImageSourceRef;
  provider: CGDataProviderRef; final: Integer); cdecl;
  external libImageIO name _PU + 'CGImageSourceUpdateDataProvider';
function CGImageSourceGetStatus(isrc: CGImageSourceRef): CGImageSourceStatus;
  cdecl; external libImageIO name _PU + 'CGImageSourceGetStatus';
function CGImageSourceGetStatusAtIndex(isrc: CGImageSourceRef; index: LongWord)
  : CGImageSourceStatus; cdecl;
  external libImageIO name _PU + 'CGImageSourceGetStatusAtIndex';
function CGImageSourceGetPrimaryImageIndex(isrc: CGImageSourceRef): LongWord;
  cdecl; external libImageIO name _PU + 'CGImageSourceGetPrimaryImageIndex';
function CGImageSourceCopyAuxiliaryDataInfoAtIndex(isrc: CGImageSourceRef;
  index: LongWord; auxiliaryImageDataType: CFStringRef): CFDictionaryRef; cdecl;
  external libImageIO name _PU + 'CGImageSourceCopyAuxiliaryDataInfoAtIndex';
function CGImageDestinationGetTypeID: CFTypeID; cdecl;
  external libImageIO name _PU + 'CGImageDestinationGetTypeID';
function CGImageDestinationCopyTypeIdentifiers: CFArrayRef; cdecl;
  external libImageIO name _PU + 'CGImageDestinationCopyTypeIdentifiers';
function CGImageDestinationCreateWithDataConsumer(consumer: CGDataConsumerRef;
  &type: CFStringRef; count: LongWord; options: CFDictionaryRef)
  : CGImageDestinationRef; cdecl;
  external libImageIO name _PU + 'CGImageDestinationCreateWithDataConsumer';
function CGImageDestinationCreateWithData(data: CFMutableDataRef;
  &type: CFStringRef; count: LongWord; options: CFDictionaryRef)
  : CGImageDestinationRef; cdecl;
  external libImageIO name _PU + 'CGImageDestinationCreateWithData';
function CGImageDestinationCreateWithURL(url: CFURLRef; &type: CFStringRef;
  count: LongWord; options: CFDictionaryRef): CGImageDestinationRef; cdecl;
  external libImageIO name _PU + 'CGImageDestinationCreateWithURL';
procedure CGImageDestinationSetProperties(idst: CGImageDestinationRef;
  properties: CFDictionaryRef); cdecl;
  external libImageIO name _PU + 'CGImageDestinationSetProperties';
procedure CGImageDestinationAddImage(idst: CGImageDestinationRef;
  image: CGImageRef; properties: CFDictionaryRef); cdecl;
  external libImageIO name _PU + 'CGImageDestinationAddImage';
procedure CGImageDestinationAddImageFromSource(idst: CGImageDestinationRef;
  isrc: CGImageSourceRef; index: LongWord; properties: CFDictionaryRef); cdecl;
  external libImageIO name _PU + 'CGImageDestinationAddImageFromSource';
function CGImageDestinationFinalize(idst: CGImageDestinationRef): Integer;
  cdecl; external libImageIO name _PU + 'CGImageDestinationFinalize';
procedure CGImageDestinationAddImageAndMetadata(idst: CGImageDestinationRef;
  image: CGImageRef; metadata: CGImageMetadataRef; options: CFDictionaryRef);
  cdecl; external libImageIO name _PU + 'CGImageDestinationAddImageAndMetadata';
function CGImageDestinationCopyImageSource(idst: CGImageDestinationRef;
  isrc: CGImageSourceRef; options: CFDictionaryRef; err: Pointer): Integer;
  cdecl; external libImageIO name _PU + 'CGImageDestinationCopyImageSource';
procedure CGImageDestinationAddAuxiliaryDataInfo(idst: CGImageDestinationRef;
  auxiliaryImageDataType: CFStringRef;
  auxiliaryDataInfoDictionary: CFDictionaryRef); cdecl;
  external libImageIO name _PU + 'CGImageDestinationAddAuxiliaryDataInfo';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  ImageIOModule: THandle;

{$ENDIF IOS}

function kCGImageAnimationStartIndex: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageAnimationStartIndex');
end;

function kCGImageAnimationDelayTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageAnimationDelayTime');
end;

function kCGImageAnimationLoopCount: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageAnimationLoopCount');
end;

function kCGImageMetadataNamespaceExif: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceExif');
end;

function kCGImageMetadataNamespaceExifAux: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceExifAux');
end;

function kCGImageMetadataNamespaceExifEX: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceExifEX');
end;

function kCGImageMetadataNamespaceDublinCore: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageMetadataNamespaceDublinCore');
end;

function kCGImageMetadataNamespaceIPTCCore: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceIPTCCore');
end;

function kCGImageMetadataNamespaceIPTCExtension: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageMetadataNamespaceIPTCExtension');
end;

function kCGImageMetadataNamespacePhotoshop: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespacePhotoshop');
end;

function kCGImageMetadataNamespaceTIFF: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceTIFF');
end;

function kCGImageMetadataNamespaceXMPBasic: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceXMPBasic');
end;

function kCGImageMetadataNamespaceXMPRights: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceXMPRights');
end;

function kCGImageMetadataPrefixExif: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixExif');
end;

function kCGImageMetadataPrefixExifAux: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixExifAux');
end;

function kCGImageMetadataPrefixExifEX: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixExifEX');
end;

function kCGImageMetadataPrefixDublinCore: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixDublinCore');
end;

function kCGImageMetadataPrefixIPTCCore: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixIPTCCore');
end;

function kCGImageMetadataPrefixIPTCExtension: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageMetadataPrefixIPTCExtension');
end;

function kCGImageMetadataPrefixPhotoshop: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixPhotoshop');
end;

function kCGImageMetadataPrefixTIFF: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixTIFF');
end;

function kCGImageMetadataPrefixXMPBasic: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixXMPBasic');
end;

function kCGImageMetadataPrefixXMPRights: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixXMPRights');
end;

function kCGImageMetadataEnumerateRecursively: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageMetadataEnumerateRecursively');
end;

function kCFErrorDomainCGImageMetadata: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCFErrorDomainCGImageMetadata');
end;

function kCGImageSourceTypeIdentifierHint: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageSourceTypeIdentifierHint');
end;

function kCGImageSourceShouldCache: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageSourceShouldCache');
end;

function kCGImageSourceShouldCacheImmediately: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageSourceShouldCacheImmediately');
end;

function kCGImageSourceShouldAllowFloat: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageSourceShouldAllowFloat');
end;

function kCGImageSourceCreateThumbnailFromImageIfAbsent: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageSourceCreateThumbnailFromImageIfAbsent');
end;

function kCGImageSourceCreateThumbnailFromImageAlways: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageSourceCreateThumbnailFromImageAlways');
end;

function kCGImageSourceThumbnailMaxPixelSize: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageSourceThumbnailMaxPixelSize');
end;

function kCGImageSourceCreateThumbnailWithTransform: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageSourceCreateThumbnailWithTransform');
end;

function kCGImageSourceSubsampleFactor: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageSourceSubsampleFactor');
end;

function kCGImageDestinationLossyCompressionQuality: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageDestinationLossyCompressionQuality');
end;

function kCGImageDestinationBackgroundColor: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageDestinationBackgroundColor');
end;

function kCGImageDestinationImageMaxPixelSize: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageDestinationImageMaxPixelSize');
end;

function kCGImageDestinationEmbedThumbnail: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageDestinationEmbedThumbnail');
end;

function kCGImageDestinationOptimizeColorForSharing: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageDestinationOptimizeColorForSharing');
end;

function kCGImageDestinationPreserveGainMap: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageDestinationPreserveGainMap');
end;

function kCGImageDestinationMetadata: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageDestinationMetadata');
end;

function kCGImageDestinationMergeMetadata: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageDestinationMergeMetadata');
end;

function kCGImageMetadataShouldExcludeXMP: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataShouldExcludeXMP');
end;

function kCGImageMetadataShouldExcludeGPS: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataShouldExcludeGPS');
end;

function kCGImageDestinationDateTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageDestinationDateTime');
end;

function kCGImageDestinationOrientation: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageDestinationOrientation');
end;

function kCGImagePropertyTIFFDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFDictionary');
end;

function kCGImagePropertyGIFDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGIFDictionary');
end;

function kCGImagePropertyJFIFDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyJFIFDictionary');
end;

function kCGImagePropertyHEIFDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyHEIFDictionary');
end;

function kCGImagePropertyHEICSDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyHEICSDictionary');
end;

function kCGImagePropertyExifDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifDictionary');
end;

function kCGImagePropertyPNGDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGDictionary');
end;

function kCGImagePropertyIPTCDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCDictionary');
end;

function kCGImagePropertyGPSDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDictionary');
end;

function kCGImagePropertyRawDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyRawDictionary');
end;

function kCGImagePropertyCIFFDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFDictionary');
end;

function kCGImagePropertyMakerCanonDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerCanonDictionary');
end;

function kCGImagePropertyMakerNikonDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonDictionary');
end;

function kCGImagePropertyMakerMinoltaDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerMinoltaDictionary');
end;

function kCGImagePropertyMakerFujiDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerFujiDictionary');
end;

function kCGImagePropertyMakerOlympusDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerOlympusDictionary');
end;

function kCGImagePropertyMakerPentaxDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerPentaxDictionary');
end;

function kCGImageProperty8BIMDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageProperty8BIMDictionary');
end;

function kCGImagePropertyDNGDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGDictionary');
end;

function kCGImagePropertyExifAuxDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxDictionary');
end;

function kCGImagePropertyOpenEXRDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyOpenEXRDictionary');
end;

function kCGImagePropertyMakerAppleDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerAppleDictionary');
end;

function kCGImagePropertyFileContentsDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyFileContentsDictionary');
end;

function kCGImagePropertyWebPDictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyWebPDictionary');
end;

function kCGImagePropertyTGADictionary: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTGADictionary');
end;

function kCGImagePropertyFileSize: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyFileSize');
end;

function kCGImagePropertyPixelHeight: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPixelHeight');
end;

function kCGImagePropertyPixelWidth: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPixelWidth');
end;

function kCGImagePropertyDPIHeight: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDPIHeight');
end;

function kCGImagePropertyDPIWidth: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDPIWidth');
end;

function kCGImagePropertyDepth: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDepth');
end;

function kCGImagePropertyOrientation: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyOrientation');
end;

function kCGImagePropertyIsFloat: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIsFloat');
end;

function kCGImagePropertyIsIndexed: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIsIndexed');
end;

function kCGImagePropertyHasAlpha: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyHasAlpha');
end;

function kCGImagePropertyColorModel: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyColorModel');
end;

function kCGImagePropertyProfileName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyProfileName');
end;

function kCGImagePropertyPrimaryImage: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPrimaryImage');
end;

function kCGImagePropertyColorModelRGB: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyColorModelRGB');
end;

function kCGImagePropertyColorModelGray: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyColorModelGray');
end;

function kCGImagePropertyColorModelCMYK: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyColorModelCMYK');
end;

function kCGImagePropertyColorModelLab: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyColorModelLab');
end;

function kCGImagePropertyTIFFCompression: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFCompression');
end;

function kCGImagePropertyTIFFPhotometricInterpretation: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyTIFFPhotometricInterpretation');
end;

function kCGImagePropertyTIFFDocumentName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFDocumentName');
end;

function kCGImagePropertyTIFFImageDescription: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyTIFFImageDescription');
end;

function kCGImagePropertyTIFFMake: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFMake');
end;

function kCGImagePropertyTIFFModel: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFModel');
end;

function kCGImagePropertyTIFFOrientation: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFOrientation');
end;

function kCGImagePropertyTIFFXResolution: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFXResolution');
end;

function kCGImagePropertyTIFFYResolution: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFYResolution');
end;

function kCGImagePropertyTIFFResolutionUnit: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFResolutionUnit');
end;

function kCGImagePropertyTIFFSoftware: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFSoftware');
end;

function kCGImagePropertyTIFFTransferFunction: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyTIFFTransferFunction');
end;

function kCGImagePropertyTIFFDateTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFDateTime');
end;

function kCGImagePropertyTIFFArtist: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFArtist');
end;

function kCGImagePropertyTIFFHostComputer: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFHostComputer');
end;

function kCGImagePropertyTIFFCopyright: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFCopyright');
end;

function kCGImagePropertyTIFFWhitePoint: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFWhitePoint');
end;

function kCGImagePropertyTIFFPrimaryChromaticities: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyTIFFPrimaryChromaticities');
end;

function kCGImagePropertyTIFFTileWidth: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFTileWidth');
end;

function kCGImagePropertyTIFFTileLength: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFTileLength');
end;

function kCGImagePropertyJFIFVersion: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyJFIFVersion');
end;

function kCGImagePropertyJFIFXDensity: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyJFIFXDensity');
end;

function kCGImagePropertyJFIFYDensity: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyJFIFYDensity');
end;

function kCGImagePropertyJFIFDensityUnit: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyJFIFDensityUnit');
end;

function kCGImagePropertyJFIFIsProgressive: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyJFIFIsProgressive');
end;

function kCGImagePropertyHEICSLoopCount: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyHEICSLoopCount');
end;

function kCGImagePropertyHEICSDelayTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyHEICSDelayTime');
end;

function kCGImagePropertyHEICSUnclampedDelayTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyHEICSUnclampedDelayTime');
end;

function kCGImagePropertyHEICSCanvasPixelWidth: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyHEICSCanvasPixelWidth');
end;

function kCGImagePropertyHEICSCanvasPixelHeight: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyHEICSCanvasPixelHeight');
end;

function kCGImagePropertyHEICSFrameInfoArray: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyHEICSFrameInfoArray');
end;

function kCGImagePropertyExifExposureTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifExposureTime');
end;

function kCGImagePropertyExifFNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFNumber');
end;

function kCGImagePropertyExifExposureProgram: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifExposureProgram');
end;

function kCGImagePropertyExifSpectralSensitivity: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifSpectralSensitivity');
end;

function kCGImagePropertyExifISOSpeedRatings: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifISOSpeedRatings');
end;

function kCGImagePropertyExifOECF: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifOECF');
end;

function kCGImagePropertyExifSensitivityType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifSensitivityType');
end;

function kCGImagePropertyExifStandardOutputSensitivity: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifStandardOutputSensitivity');
end;

function kCGImagePropertyExifRecommendedExposureIndex: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifRecommendedExposureIndex');
end;

function kCGImagePropertyExifISOSpeed: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifISOSpeed');
end;

function kCGImagePropertyExifISOSpeedLatitudeyyy: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifISOSpeedLatitudeyyy');
end;

function kCGImagePropertyExifISOSpeedLatitudezzz: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifISOSpeedLatitudezzz');
end;

function kCGImagePropertyExifVersion: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifVersion');
end;

function kCGImagePropertyExifDateTimeOriginal: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifDateTimeOriginal');
end;

function kCGImagePropertyExifDateTimeDigitized: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifDateTimeDigitized');
end;

function kCGImagePropertyExifOffsetTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifOffsetTime');
end;

function kCGImagePropertyExifOffsetTimeOriginal: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifOffsetTimeOriginal');
end;

function kCGImagePropertyExifOffsetTimeDigitized: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifOffsetTimeDigitized');
end;

function kCGImagePropertyExifComponentsConfiguration: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifComponentsConfiguration');
end;

function kCGImagePropertyExifCompressedBitsPerPixel: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifCompressedBitsPerPixel');
end;

function kCGImagePropertyExifShutterSpeedValue: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifShutterSpeedValue');
end;

function kCGImagePropertyExifApertureValue: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifApertureValue');
end;

function kCGImagePropertyExifBrightnessValue: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifBrightnessValue');
end;

function kCGImagePropertyExifExposureBiasValue: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifExposureBiasValue');
end;

function kCGImagePropertyExifMaxApertureValue: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifMaxApertureValue');
end;

function kCGImagePropertyExifSubjectDistance: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifSubjectDistance');
end;

function kCGImagePropertyExifMeteringMode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifMeteringMode');
end;

function kCGImagePropertyExifLightSource: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifLightSource');
end;

function kCGImagePropertyExifFlash: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFlash');
end;

function kCGImagePropertyExifFocalLength: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFocalLength');
end;

function kCGImagePropertyExifSubjectArea: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSubjectArea');
end;

function kCGImagePropertyExifMakerNote: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifMakerNote');
end;

function kCGImagePropertyExifUserComment: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifUserComment');
end;

function kCGImagePropertyExifSubsecTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSubsecTime');
end;

function kCGImagePropertyExifSubsecTimeOriginal: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifSubsecTimeOriginal');
end;

function kCGImagePropertyExifSubsecTimeDigitized: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifSubsecTimeDigitized');
end;

function kCGImagePropertyExifFlashPixVersion: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifFlashPixVersion');
end;

function kCGImagePropertyExifColorSpace: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifColorSpace');
end;

function kCGImagePropertyExifPixelXDimension: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifPixelXDimension');
end;

function kCGImagePropertyExifPixelYDimension: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifPixelYDimension');
end;

function kCGImagePropertyExifRelatedSoundFile: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifRelatedSoundFile');
end;

function kCGImagePropertyExifFlashEnergy: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFlashEnergy');
end;

function kCGImagePropertyExifSpatialFrequencyResponse: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifSpatialFrequencyResponse');
end;

function kCGImagePropertyExifFocalPlaneXResolution: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifFocalPlaneXResolution');
end;

function kCGImagePropertyExifFocalPlaneYResolution: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifFocalPlaneYResolution');
end;

function kCGImagePropertyExifFocalPlaneResolutionUnit: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifFocalPlaneResolutionUnit');
end;

function kCGImagePropertyExifSubjectLocation: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifSubjectLocation');
end;

function kCGImagePropertyExifExposureIndex: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifExposureIndex');
end;

function kCGImagePropertyExifSensingMethod: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSensingMethod');
end;

function kCGImagePropertyExifFileSource: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFileSource');
end;

function kCGImagePropertyExifSceneType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSceneType');
end;

function kCGImagePropertyExifCFAPattern: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifCFAPattern');
end;

function kCGImagePropertyExifCustomRendered: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifCustomRendered');
end;

function kCGImagePropertyExifExposureMode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifExposureMode');
end;

function kCGImagePropertyExifWhiteBalance: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifWhiteBalance');
end;

function kCGImagePropertyExifDigitalZoomRatio: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifDigitalZoomRatio');
end;

function kCGImagePropertyExifFocalLenIn35mmFilm: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifFocalLenIn35mmFilm');
end;

function kCGImagePropertyExifSceneCaptureType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifSceneCaptureType');
end;

function kCGImagePropertyExifGainControl: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifGainControl');
end;

function kCGImagePropertyExifContrast: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifContrast');
end;

function kCGImagePropertyExifSaturation: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSaturation');
end;

function kCGImagePropertyExifSharpness: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSharpness');
end;

function kCGImagePropertyExifDeviceSettingDescription: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifDeviceSettingDescription');
end;

function kCGImagePropertyExifSubjectDistRange: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifSubjectDistRange');
end;

function kCGImagePropertyExifImageUniqueID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifImageUniqueID');
end;

function kCGImagePropertyExifCameraOwnerName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifCameraOwnerName');
end;

function kCGImagePropertyExifBodySerialNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifBodySerialNumber');
end;

function kCGImagePropertyExifLensSpecification: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifLensSpecification');
end;

function kCGImagePropertyExifLensMake: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifLensMake');
end;

function kCGImagePropertyExifLensModel: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifLensModel');
end;

function kCGImagePropertyExifLensSerialNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifLensSerialNumber');
end;

function kCGImagePropertyExifGamma: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifGamma');
end;

function kCGImagePropertyExifCompositeImage: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifCompositeImage');
end;

function kCGImagePropertyExifSourceImageNumberOfCompositeImage: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifSourceImageNumberOfCompositeImage');
end;

function kCGImagePropertyExifSourceExposureTimesOfCompositeImage: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifSourceExposureTimesOfCompositeImage');
end;

function kCGImagePropertyExifSubsecTimeOrginal: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifSubsecTimeOrginal');
end;

function kCGImagePropertyExifAuxLensInfo: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxLensInfo');
end;

function kCGImagePropertyExifAuxLensModel: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxLensModel');
end;

function kCGImagePropertyExifAuxSerialNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifAuxSerialNumber');
end;

function kCGImagePropertyExifAuxLensID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxLensID');
end;

function kCGImagePropertyExifAuxLensSerialNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifAuxLensSerialNumber');
end;

function kCGImagePropertyExifAuxImageNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxImageNumber');
end;

function kCGImagePropertyExifAuxFlashCompensation: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyExifAuxFlashCompensation');
end;

function kCGImagePropertyExifAuxOwnerName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxOwnerName');
end;

function kCGImagePropertyExifAuxFirmware: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxFirmware');
end;

function kCGImagePropertyGIFLoopCount: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGIFLoopCount');
end;

function kCGImagePropertyGIFDelayTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGIFDelayTime');
end;

function kCGImagePropertyGIFImageColorMap: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGIFImageColorMap');
end;

function kCGImagePropertyGIFHasGlobalColorMap: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGIFHasGlobalColorMap');
end;

function kCGImagePropertyGIFUnclampedDelayTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGIFUnclampedDelayTime');
end;

function kCGImagePropertyGIFCanvasPixelWidth: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGIFCanvasPixelWidth');
end;

function kCGImagePropertyGIFCanvasPixelHeight: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGIFCanvasPixelHeight');
end;

function kCGImagePropertyGIFFrameInfoArray: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGIFFrameInfoArray');
end;

function kCGImagePropertyPNGAuthor: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGAuthor');
end;

function kCGImagePropertyPNGChromaticities: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGChromaticities');
end;

function kCGImagePropertyPNGComment: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGComment');
end;

function kCGImagePropertyPNGCopyright: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGCopyright');
end;

function kCGImagePropertyPNGCreationTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGCreationTime');
end;

function kCGImagePropertyPNGDescription: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGDescription');
end;

function kCGImagePropertyPNGDisclaimer: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGDisclaimer');
end;

function kCGImagePropertyPNGGamma: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGGamma');
end;

function kCGImagePropertyPNGInterlaceType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGInterlaceType');
end;

function kCGImagePropertyPNGModificationTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyPNGModificationTime');
end;

function kCGImagePropertyPNGSoftware: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGSoftware');
end;

function kCGImagePropertyPNGSource: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGSource');
end;

function kCGImagePropertyPNGsRGBIntent: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGsRGBIntent');
end;

function kCGImagePropertyPNGTitle: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGTitle');
end;

function kCGImagePropertyPNGWarning: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGWarning');
end;

function kCGImagePropertyPNGXPixelsPerMeter: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGXPixelsPerMeter');
end;

function kCGImagePropertyPNGYPixelsPerMeter: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGYPixelsPerMeter');
end;

function kCGImagePropertyPNGPixelsAspectRatio: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyPNGPixelsAspectRatio');
end;

function kCGImagePropertyAPNGLoopCount: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyAPNGLoopCount');
end;

function kCGImagePropertyAPNGDelayTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyAPNGDelayTime');
end;

function kCGImagePropertyAPNGUnclampedDelayTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyAPNGUnclampedDelayTime');
end;

function kCGImagePropertyAPNGFrameInfoArray: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyAPNGFrameInfoArray');
end;

function kCGImagePropertyAPNGCanvasPixelWidth: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyAPNGCanvasPixelWidth');
end;

function kCGImagePropertyAPNGCanvasPixelHeight: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyAPNGCanvasPixelHeight');
end;

function kCGImagePropertyWebPLoopCount: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyWebPLoopCount');
end;

function kCGImagePropertyWebPDelayTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyWebPDelayTime');
end;

function kCGImagePropertyWebPUnclampedDelayTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyWebPUnclampedDelayTime');
end;

function kCGImagePropertyWebPFrameInfoArray: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyWebPFrameInfoArray');
end;

function kCGImagePropertyWebPCanvasPixelWidth: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyWebPCanvasPixelWidth');
end;

function kCGImagePropertyWebPCanvasPixelHeight: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyWebPCanvasPixelHeight');
end;

function kCGImagePropertyGPSVersion: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSVersion');
end;

function kCGImagePropertyGPSLatitudeRef: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSLatitudeRef');
end;

function kCGImagePropertyGPSLatitude: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSLatitude');
end;

function kCGImagePropertyGPSLongitudeRef: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSLongitudeRef');
end;

function kCGImagePropertyGPSLongitude: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSLongitude');
end;

function kCGImagePropertyGPSAltitudeRef: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSAltitudeRef');
end;

function kCGImagePropertyGPSAltitude: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSAltitude');
end;

function kCGImagePropertyGPSTimeStamp: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSTimeStamp');
end;

function kCGImagePropertyGPSSatellites: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSSatellites');
end;

function kCGImagePropertyGPSStatus: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSStatus');
end;

function kCGImagePropertyGPSMeasureMode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSMeasureMode');
end;

function kCGImagePropertyGPSDOP: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDOP');
end;

function kCGImagePropertyGPSSpeedRef: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSSpeedRef');
end;

function kCGImagePropertyGPSSpeed: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSSpeed');
end;

function kCGImagePropertyGPSTrackRef: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSTrackRef');
end;

function kCGImagePropertyGPSTrack: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSTrack');
end;

function kCGImagePropertyGPSImgDirectionRef: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSImgDirectionRef');
end;

function kCGImagePropertyGPSImgDirection: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSImgDirection');
end;

function kCGImagePropertyGPSMapDatum: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSMapDatum');
end;

function kCGImagePropertyGPSDestLatitudeRef: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestLatitudeRef');
end;

function kCGImagePropertyGPSDestLatitude: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestLatitude');
end;

function kCGImagePropertyGPSDestLongitudeRef: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGPSDestLongitudeRef');
end;

function kCGImagePropertyGPSDestLongitude: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestLongitude');
end;

function kCGImagePropertyGPSDestBearingRef: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestBearingRef');
end;

function kCGImagePropertyGPSDestBearing: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestBearing');
end;

function kCGImagePropertyGPSDestDistanceRef: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestDistanceRef');
end;

function kCGImagePropertyGPSDestDistance: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestDistance');
end;

function kCGImagePropertyGPSProcessingMethod: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGPSProcessingMethod');
end;

function kCGImagePropertyGPSAreaInformation: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSAreaInformation');
end;

function kCGImagePropertyGPSDateStamp: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDateStamp');
end;

function kCGImagePropertyGPSDifferental: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDifferental');
end;

function kCGImagePropertyGPSHPositioningError: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGPSHPositioningError');
end;

function kCGImagePropertyIPTCObjectTypeReference: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCObjectTypeReference');
end;

function kCGImagePropertyIPTCObjectAttributeReference: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCObjectAttributeReference');
end;

function kCGImagePropertyIPTCObjectName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCObjectName');
end;

function kCGImagePropertyIPTCEditStatus: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCEditStatus');
end;

function kCGImagePropertyIPTCEditorialUpdate: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCEditorialUpdate');
end;

function kCGImagePropertyIPTCUrgency: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCUrgency');
end;

function kCGImagePropertyIPTCSubjectReference: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCSubjectReference');
end;

function kCGImagePropertyIPTCCategory: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCCategory');
end;

function kCGImagePropertyIPTCSupplementalCategory: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCSupplementalCategory');
end;

function kCGImagePropertyIPTCFixtureIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCFixtureIdentifier');
end;

function kCGImagePropertyIPTCKeywords: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCKeywords');
end;

function kCGImagePropertyIPTCContentLocationCode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCContentLocationCode');
end;

function kCGImagePropertyIPTCContentLocationName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCContentLocationName');
end;

function kCGImagePropertyIPTCReleaseDate: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCReleaseDate');
end;

function kCGImagePropertyIPTCReleaseTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCReleaseTime');
end;

function kCGImagePropertyIPTCExpirationDate: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExpirationDate');
end;

function kCGImagePropertyIPTCExpirationTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExpirationTime');
end;

function kCGImagePropertyIPTCSpecialInstructions: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCSpecialInstructions');
end;

function kCGImagePropertyIPTCActionAdvised: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCActionAdvised');
end;

function kCGImagePropertyIPTCReferenceService: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCReferenceService');
end;

function kCGImagePropertyIPTCReferenceDate: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCReferenceDate');
end;

function kCGImagePropertyIPTCReferenceNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCReferenceNumber');
end;

function kCGImagePropertyIPTCDateCreated: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCDateCreated');
end;

function kCGImagePropertyIPTCTimeCreated: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCTimeCreated');
end;

function kCGImagePropertyIPTCDigitalCreationDate: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCDigitalCreationDate');
end;

function kCGImagePropertyIPTCDigitalCreationTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCDigitalCreationTime');
end;

function kCGImagePropertyIPTCOriginatingProgram: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCOriginatingProgram');
end;

function kCGImagePropertyIPTCProgramVersion: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCProgramVersion');
end;

function kCGImagePropertyIPTCObjectCycle: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCObjectCycle');
end;

function kCGImagePropertyIPTCByline: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCByline');
end;

function kCGImagePropertyIPTCBylineTitle: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCBylineTitle');
end;

function kCGImagePropertyIPTCCity: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCCity');
end;

function kCGImagePropertyIPTCSubLocation: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCSubLocation');
end;

function kCGImagePropertyIPTCProvinceState: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCProvinceState');
end;

function kCGImagePropertyIPTCCountryPrimaryLocationCode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCCountryPrimaryLocationCode');
end;

function kCGImagePropertyIPTCCountryPrimaryLocationName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCCountryPrimaryLocationName');
end;

function kCGImagePropertyIPTCOriginalTransmissionReference: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCOriginalTransmissionReference');
end;

function kCGImagePropertyIPTCHeadline: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCHeadline');
end;

function kCGImagePropertyIPTCCredit: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCCredit');
end;

function kCGImagePropertyIPTCSource: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCSource');
end;

function kCGImagePropertyIPTCCopyrightNotice: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCCopyrightNotice');
end;

function kCGImagePropertyIPTCContact: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCContact');
end;

function kCGImagePropertyIPTCCaptionAbstract: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCCaptionAbstract');
end;

function kCGImagePropertyIPTCWriterEditor: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCWriterEditor');
end;

function kCGImagePropertyIPTCImageType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCImageType');
end;

function kCGImagePropertyIPTCImageOrientation: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCImageOrientation');
end;

function kCGImagePropertyIPTCLanguageIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCLanguageIdentifier');
end;

function kCGImagePropertyIPTCStarRating: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCStarRating');
end;

function kCGImagePropertyIPTCCreatorContactInfo: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCCreatorContactInfo');
end;

function kCGImagePropertyIPTCRightsUsageTerms: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCRightsUsageTerms');
end;

function kCGImagePropertyIPTCScene: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCScene');
end;

function kCGImagePropertyIPTCExtAboutCvTerm: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtAboutCvTerm');
end;

function kCGImagePropertyIPTCExtAboutCvTermCvId: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtAboutCvTermCvId');
end;

function kCGImagePropertyIPTCExtAboutCvTermId: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtAboutCvTermId');
end;

function kCGImagePropertyIPTCExtAboutCvTermName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtAboutCvTermName');
end;

function kCGImagePropertyIPTCExtAboutCvTermRefinedAbout: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtAboutCvTermRefinedAbout');
end;

function kCGImagePropertyIPTCExtAddlModelInfo: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtAddlModelInfo');
end;

function kCGImagePropertyIPTCExtArtworkOrObject: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkOrObject');
end;

function kCGImagePropertyIPTCExtArtworkCircaDateCreated: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkCircaDateCreated');
end;

function kCGImagePropertyIPTCExtArtworkContentDescription: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkContentDescription');
end;

function kCGImagePropertyIPTCExtArtworkContributionDescription: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkContributionDescription');
end;

function kCGImagePropertyIPTCExtArtworkCopyrightNotice: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkCopyrightNotice');
end;

function kCGImagePropertyIPTCExtArtworkCreator: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkCreator');
end;

function kCGImagePropertyIPTCExtArtworkCreatorID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkCreatorID');
end;

function kCGImagePropertyIPTCExtArtworkCopyrightOwnerID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkCopyrightOwnerID');
end;

function kCGImagePropertyIPTCExtArtworkCopyrightOwnerName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkCopyrightOwnerName');
end;

function kCGImagePropertyIPTCExtArtworkLicensorID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkLicensorID');
end;

function kCGImagePropertyIPTCExtArtworkLicensorName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkLicensorName');
end;

function kCGImagePropertyIPTCExtArtworkDateCreated: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkDateCreated');
end;

function kCGImagePropertyIPTCExtArtworkPhysicalDescription: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkPhysicalDescription');
end;

function kCGImagePropertyIPTCExtArtworkSource: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkSource');
end;

function kCGImagePropertyIPTCExtArtworkSourceInventoryNo: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkSourceInventoryNo');
end;

function kCGImagePropertyIPTCExtArtworkSourceInvURL: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkSourceInvURL');
end;

function kCGImagePropertyIPTCExtArtworkStylePeriod: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkStylePeriod');
end;

function kCGImagePropertyIPTCExtArtworkTitle: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtArtworkTitle');
end;

function kCGImagePropertyIPTCExtAudioBitrate: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtAudioBitrate');
end;

function kCGImagePropertyIPTCExtAudioBitrateMode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtAudioBitrateMode');
end;

function kCGImagePropertyIPTCExtAudioChannelCount: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtAudioChannelCount');
end;

function kCGImagePropertyIPTCExtCircaDateCreated: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtCircaDateCreated');
end;

function kCGImagePropertyIPTCExtContainerFormat: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtContainerFormat');
end;

function kCGImagePropertyIPTCExtContainerFormatIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtContainerFormatIdentifier');
end;

function kCGImagePropertyIPTCExtContainerFormatName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtContainerFormatName');
end;

function kCGImagePropertyIPTCExtContributor: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtContributor');
end;

function kCGImagePropertyIPTCExtContributorIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtContributorIdentifier');
end;

function kCGImagePropertyIPTCExtContributorName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtContributorName');
end;

function kCGImagePropertyIPTCExtContributorRole: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtContributorRole');
end;

function kCGImagePropertyIPTCExtCopyrightYear: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtCopyrightYear');
end;

function kCGImagePropertyIPTCExtCreator: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtCreator');
end;

function kCGImagePropertyIPTCExtCreatorIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtCreatorIdentifier');
end;

function kCGImagePropertyIPTCExtCreatorName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtCreatorName');
end;

function kCGImagePropertyIPTCExtCreatorRole: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtCreatorRole');
end;

function kCGImagePropertyIPTCExtControlledVocabularyTerm: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtControlledVocabularyTerm');
end;

function kCGImagePropertyIPTCExtDataOnScreen: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDataOnScreen');
end;

function kCGImagePropertyIPTCExtDataOnScreenRegion: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDataOnScreenRegion');
end;

function kCGImagePropertyIPTCExtDataOnScreenRegionD: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDataOnScreenRegionD');
end;

function kCGImagePropertyIPTCExtDataOnScreenRegionH: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDataOnScreenRegionH');
end;

function kCGImagePropertyIPTCExtDataOnScreenRegionText: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDataOnScreenRegionText');
end;

function kCGImagePropertyIPTCExtDataOnScreenRegionUnit: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDataOnScreenRegionUnit');
end;

function kCGImagePropertyIPTCExtDataOnScreenRegionW: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDataOnScreenRegionW');
end;

function kCGImagePropertyIPTCExtDataOnScreenRegionX: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDataOnScreenRegionX');
end;

function kCGImagePropertyIPTCExtDataOnScreenRegionY: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDataOnScreenRegionY');
end;

function kCGImagePropertyIPTCExtDigitalImageGUID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDigitalImageGUID');
end;

function kCGImagePropertyIPTCExtDigitalSourceFileType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDigitalSourceFileType');
end;

function kCGImagePropertyIPTCExtDigitalSourceType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDigitalSourceType');
end;

function kCGImagePropertyIPTCExtDopesheet: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtDopesheet');
end;

function kCGImagePropertyIPTCExtDopesheetLink: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDopesheetLink');
end;

function kCGImagePropertyIPTCExtDopesheetLinkLink: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDopesheetLinkLink');
end;

function kCGImagePropertyIPTCExtDopesheetLinkLinkQualifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtDopesheetLinkLinkQualifier');
end;

function kCGImagePropertyIPTCExtEmbdEncRightsExpr: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtEmbdEncRightsExpr');
end;

function kCGImagePropertyIPTCExtEmbeddedEncodedRightsExpr: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtEmbeddedEncodedRightsExpr');
end;

function kCGImagePropertyIPTCExtEmbeddedEncodedRightsExprType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtEmbeddedEncodedRightsExprType');
end;

function kCGImagePropertyIPTCExtEmbeddedEncodedRightsExprLangID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtEmbeddedEncodedRightsExprLangID');
end;

function kCGImagePropertyIPTCExtEpisode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtEpisode');
end;

function kCGImagePropertyIPTCExtEpisodeIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtEpisodeIdentifier');
end;

function kCGImagePropertyIPTCExtEpisodeName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtEpisodeName');
end;

function kCGImagePropertyIPTCExtEpisodeNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtEpisodeNumber');
end;

function kCGImagePropertyIPTCExtEvent: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtEvent');
end;

function kCGImagePropertyIPTCExtShownEvent: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtShownEvent');
end;

function kCGImagePropertyIPTCExtShownEventIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtShownEventIdentifier');
end;

function kCGImagePropertyIPTCExtShownEventName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtShownEventName');
end;

function kCGImagePropertyIPTCExtExternalMetadataLink: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtExternalMetadataLink');
end;

function kCGImagePropertyIPTCExtFeedIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtFeedIdentifier');
end;

function kCGImagePropertyIPTCExtGenre: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtGenre');
end;

function kCGImagePropertyIPTCExtGenreCvId: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtGenreCvId');
end;

function kCGImagePropertyIPTCExtGenreCvTermId: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtGenreCvTermId');
end;

function kCGImagePropertyIPTCExtGenreCvTermName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtGenreCvTermName');
end;

function kCGImagePropertyIPTCExtGenreCvTermRefinedAbout: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtGenreCvTermRefinedAbout');
end;

function kCGImagePropertyIPTCExtHeadline: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtHeadline');
end;

function kCGImagePropertyIPTCExtIPTCLastEdited: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtIPTCLastEdited');
end;

function kCGImagePropertyIPTCExtLinkedEncRightsExpr: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLinkedEncRightsExpr');
end;

function kCGImagePropertyIPTCExtLinkedEncodedRightsExpr: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLinkedEncodedRightsExpr');
end;

function kCGImagePropertyIPTCExtLinkedEncodedRightsExprType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLinkedEncodedRightsExprType');
end;

function kCGImagePropertyIPTCExtLinkedEncodedRightsExprLangID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLinkedEncodedRightsExprLangID');
end;

function kCGImagePropertyIPTCExtLocationCreated: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationCreated');
end;

function kCGImagePropertyIPTCExtLocationCity: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationCity');
end;

function kCGImagePropertyIPTCExtLocationCountryCode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationCountryCode');
end;

function kCGImagePropertyIPTCExtLocationCountryName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationCountryName');
end;

function kCGImagePropertyIPTCExtLocationGPSAltitude: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationGPSAltitude');
end;

function kCGImagePropertyIPTCExtLocationGPSLatitude: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationGPSLatitude');
end;

function kCGImagePropertyIPTCExtLocationGPSLongitude: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationGPSLongitude');
end;

function kCGImagePropertyIPTCExtLocationIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationIdentifier');
end;

function kCGImagePropertyIPTCExtLocationLocationId: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationLocationId');
end;

function kCGImagePropertyIPTCExtLocationLocationName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationLocationName');
end;

function kCGImagePropertyIPTCExtLocationProvinceState: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationProvinceState');
end;

function kCGImagePropertyIPTCExtLocationSublocation: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationSublocation');
end;

function kCGImagePropertyIPTCExtLocationWorldRegion: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationWorldRegion');
end;

function kCGImagePropertyIPTCExtLocationShown: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtLocationShown');
end;

function kCGImagePropertyIPTCExtMaxAvailHeight: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtMaxAvailHeight');
end;

function kCGImagePropertyIPTCExtMaxAvailWidth: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtMaxAvailWidth');
end;

function kCGImagePropertyIPTCExtModelAge: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtModelAge');
end;

function kCGImagePropertyIPTCExtOrganisationInImageCode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtOrganisationInImageCode');
end;

function kCGImagePropertyIPTCExtOrganisationInImageName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtOrganisationInImageName');
end;

function kCGImagePropertyIPTCExtPersonHeard: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtPersonHeard');
end;

function kCGImagePropertyIPTCExtPersonHeardIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPersonHeardIdentifier');
end;

function kCGImagePropertyIPTCExtPersonHeardName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPersonHeardName');
end;

function kCGImagePropertyIPTCExtPersonInImage: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPersonInImage');
end;

function kCGImagePropertyIPTCExtPersonInImageWDetails: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPersonInImageWDetails');
end;

function kCGImagePropertyIPTCExtPersonInImageCharacteristic: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPersonInImageCharacteristic');
end;

function kCGImagePropertyIPTCExtPersonInImageCvTermCvId: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPersonInImageCvTermCvId');
end;

function kCGImagePropertyIPTCExtPersonInImageCvTermId: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPersonInImageCvTermId');
end;

function kCGImagePropertyIPTCExtPersonInImageCvTermName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPersonInImageCvTermName');
end;

function kCGImagePropertyIPTCExtPersonInImageCvTermRefinedAbout: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPersonInImageCvTermRefinedAbout');
end;

function kCGImagePropertyIPTCExtPersonInImageDescription: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPersonInImageDescription');
end;

function kCGImagePropertyIPTCExtPersonInImageId: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPersonInImageId');
end;

function kCGImagePropertyIPTCExtPersonInImageName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPersonInImageName');
end;

function kCGImagePropertyIPTCExtProductInImage: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtProductInImage');
end;

function kCGImagePropertyIPTCExtProductInImageDescription: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtProductInImageDescription');
end;

function kCGImagePropertyIPTCExtProductInImageGTIN: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtProductInImageGTIN');
end;

function kCGImagePropertyIPTCExtProductInImageName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtProductInImageName');
end;

function kCGImagePropertyIPTCExtPublicationEvent: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPublicationEvent');
end;

function kCGImagePropertyIPTCExtPublicationEventDate: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPublicationEventDate');
end;

function kCGImagePropertyIPTCExtPublicationEventIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPublicationEventIdentifier');
end;

function kCGImagePropertyIPTCExtPublicationEventName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtPublicationEventName');
end;

function kCGImagePropertyIPTCExtRating: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtRating');
end;

function kCGImagePropertyIPTCExtRatingRatingRegion: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingRatingRegion');
end;

function kCGImagePropertyIPTCExtRatingRegionCity: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingRegionCity');
end;

function kCGImagePropertyIPTCExtRatingRegionCountryCode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingRegionCountryCode');
end;

function kCGImagePropertyIPTCExtRatingRegionCountryName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingRegionCountryName');
end;

function kCGImagePropertyIPTCExtRatingRegionGPSAltitude: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingRegionGPSAltitude');
end;

function kCGImagePropertyIPTCExtRatingRegionGPSLatitude: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingRegionGPSLatitude');
end;

function kCGImagePropertyIPTCExtRatingRegionGPSLongitude: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingRegionGPSLongitude');
end;

function kCGImagePropertyIPTCExtRatingRegionIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingRegionIdentifier');
end;

function kCGImagePropertyIPTCExtRatingRegionLocationId: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingRegionLocationId');
end;

function kCGImagePropertyIPTCExtRatingRegionLocationName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingRegionLocationName');
end;

function kCGImagePropertyIPTCExtRatingRegionProvinceState: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingRegionProvinceState');
end;

function kCGImagePropertyIPTCExtRatingRegionSublocation: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingRegionSublocation');
end;

function kCGImagePropertyIPTCExtRatingRegionWorldRegion: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingRegionWorldRegion');
end;

function kCGImagePropertyIPTCExtRatingScaleMaxValue: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingScaleMaxValue');
end;

function kCGImagePropertyIPTCExtRatingScaleMinValue: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingScaleMinValue');
end;

function kCGImagePropertyIPTCExtRatingSourceLink: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingSourceLink');
end;

function kCGImagePropertyIPTCExtRatingValue: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtRatingValue');
end;

function kCGImagePropertyIPTCExtRatingValueLogoLink: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRatingValueLogoLink');
end;

function kCGImagePropertyIPTCExtRegistryID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtRegistryID');
end;

function kCGImagePropertyIPTCExtRegistryEntryRole: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRegistryEntryRole');
end;

function kCGImagePropertyIPTCExtRegistryItemID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRegistryItemID');
end;

function kCGImagePropertyIPTCExtRegistryOrganisationID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtRegistryOrganisationID');
end;

function kCGImagePropertyIPTCExtReleaseReady: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtReleaseReady');
end;

function kCGImagePropertyIPTCExtSeason: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtSeason');
end;

function kCGImagePropertyIPTCExtSeasonIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtSeasonIdentifier');
end;

function kCGImagePropertyIPTCExtSeasonName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtSeasonName');
end;

function kCGImagePropertyIPTCExtSeasonNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtSeasonNumber');
end;

function kCGImagePropertyIPTCExtSeries: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtSeries');
end;

function kCGImagePropertyIPTCExtSeriesIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtSeriesIdentifier');
end;

function kCGImagePropertyIPTCExtSeriesName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtSeriesName');
end;

function kCGImagePropertyIPTCExtStorylineIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtStorylineIdentifier');
end;

function kCGImagePropertyIPTCExtStreamReady: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtStreamReady');
end;

function kCGImagePropertyIPTCExtStylePeriod: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtStylePeriod');
end;

function kCGImagePropertyIPTCExtSupplyChainSource: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtSupplyChainSource');
end;

function kCGImagePropertyIPTCExtSupplyChainSourceIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtSupplyChainSourceIdentifier');
end;

function kCGImagePropertyIPTCExtSupplyChainSourceName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtSupplyChainSourceName');
end;

function kCGImagePropertyIPTCExtTemporalCoverage: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtTemporalCoverage');
end;

function kCGImagePropertyIPTCExtTemporalCoverageFrom: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtTemporalCoverageFrom');
end;

function kCGImagePropertyIPTCExtTemporalCoverageTo: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtTemporalCoverageTo');
end;

function kCGImagePropertyIPTCExtTranscript: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtTranscript');
end;

function kCGImagePropertyIPTCExtTranscriptLink: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtTranscriptLink');
end;

function kCGImagePropertyIPTCExtTranscriptLinkLink: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtTranscriptLinkLink');
end;

function kCGImagePropertyIPTCExtTranscriptLinkLinkQualifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtTranscriptLinkLinkQualifier');
end;

function kCGImagePropertyIPTCExtVideoBitrate: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtVideoBitrate');
end;

function kCGImagePropertyIPTCExtVideoBitrateMode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtVideoBitrateMode');
end;

function kCGImagePropertyIPTCExtVideoDisplayAspectRatio: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtVideoDisplayAspectRatio');
end;

function kCGImagePropertyIPTCExtVideoEncodingProfile: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtVideoEncodingProfile');
end;

function kCGImagePropertyIPTCExtVideoShotType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtVideoShotType');
end;

function kCGImagePropertyIPTCExtVideoShotTypeIdentifier: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtVideoShotTypeIdentifier');
end;

function kCGImagePropertyIPTCExtVideoShotTypeName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtVideoShotTypeName');
end;

function kCGImagePropertyIPTCExtVideoStreamsCount: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtVideoStreamsCount');
end;

function kCGImagePropertyIPTCExtVisualColor: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtVisualColor');
end;

function kCGImagePropertyIPTCExtWorkflowTag: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExtWorkflowTag');
end;

function kCGImagePropertyIPTCExtWorkflowTagCvId: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtWorkflowTagCvId');
end;

function kCGImagePropertyIPTCExtWorkflowTagCvTermId: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtWorkflowTagCvTermId');
end;

function kCGImagePropertyIPTCExtWorkflowTagCvTermName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtWorkflowTagCvTermName');
end;

function kCGImagePropertyIPTCExtWorkflowTagCvTermRefinedAbout: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCExtWorkflowTagCvTermRefinedAbout');
end;

function kCGImagePropertyIPTCContactInfoCity: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCContactInfoCity');
end;

function kCGImagePropertyIPTCContactInfoCountry: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCContactInfoCountry');
end;

function kCGImagePropertyIPTCContactInfoAddress: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCContactInfoAddress');
end;

function kCGImagePropertyIPTCContactInfoPostalCode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCContactInfoPostalCode');
end;

function kCGImagePropertyIPTCContactInfoStateProvince: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCContactInfoStateProvince');
end;

function kCGImagePropertyIPTCContactInfoEmails: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCContactInfoEmails');
end;

function kCGImagePropertyIPTCContactInfoPhones: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCContactInfoPhones');
end;

function kCGImagePropertyIPTCContactInfoWebURLs: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyIPTCContactInfoWebURLs');
end;

function kCGImageProperty8BIMLayerNames: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageProperty8BIMLayerNames');
end;

function kCGImageProperty8BIMVersion: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageProperty8BIMVersion');
end;

function kCGImagePropertyDNGVersion: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGVersion');
end;

function kCGImagePropertyDNGBackwardVersion: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGBackwardVersion');
end;

function kCGImagePropertyDNGUniqueCameraModel: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGUniqueCameraModel');
end;

function kCGImagePropertyDNGLocalizedCameraModel: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGLocalizedCameraModel');
end;

function kCGImagePropertyDNGCameraSerialNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGCameraSerialNumber');
end;

function kCGImagePropertyDNGLensInfo: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGLensInfo');
end;

function kCGImagePropertyDNGBlackLevel: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGBlackLevel');
end;

function kCGImagePropertyDNGWhiteLevel: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGWhiteLevel');
end;

function kCGImagePropertyDNGCalibrationIlluminant1: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGCalibrationIlluminant1');
end;

function kCGImagePropertyDNGCalibrationIlluminant2: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGCalibrationIlluminant2');
end;

function kCGImagePropertyDNGColorMatrix1: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGColorMatrix1');
end;

function kCGImagePropertyDNGColorMatrix2: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGColorMatrix2');
end;

function kCGImagePropertyDNGCameraCalibration1: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGCameraCalibration1');
end;

function kCGImagePropertyDNGCameraCalibration2: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGCameraCalibration2');
end;

function kCGImagePropertyDNGAsShotNeutral: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGAsShotNeutral');
end;

function kCGImagePropertyDNGAsShotWhiteXY: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGAsShotWhiteXY');
end;

function kCGImagePropertyDNGBaselineExposure: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGBaselineExposure');
end;

function kCGImagePropertyDNGBaselineNoise: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGBaselineNoise');
end;

function kCGImagePropertyDNGBaselineSharpness: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGBaselineSharpness');
end;

function kCGImagePropertyDNGPrivateData: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGPrivateData');
end;

function kCGImagePropertyDNGCameraCalibrationSignature: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGCameraCalibrationSignature');
end;

function kCGImagePropertyDNGProfileCalibrationSignature: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGProfileCalibrationSignature');
end;

function kCGImagePropertyDNGNoiseProfile: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGNoiseProfile');
end;

function kCGImagePropertyDNGWarpRectilinear: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGWarpRectilinear');
end;

function kCGImagePropertyDNGWarpFisheye: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGWarpFisheye');
end;

function kCGImagePropertyDNGFixVignetteRadial: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGFixVignetteRadial');
end;

function kCGImagePropertyDNGActiveArea: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGActiveArea');
end;

function kCGImagePropertyDNGAnalogBalance: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGAnalogBalance');
end;

function kCGImagePropertyDNGAntiAliasStrength: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGAntiAliasStrength');
end;

function kCGImagePropertyDNGAsShotICCProfile: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGAsShotICCProfile');
end;

function kCGImagePropertyDNGAsShotPreProfileMatrix: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGAsShotPreProfileMatrix');
end;

function kCGImagePropertyDNGAsShotProfileName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGAsShotProfileName');
end;

function kCGImagePropertyDNGBaselineExposureOffset: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGBaselineExposureOffset');
end;

function kCGImagePropertyDNGBayerGreenSplit: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGBayerGreenSplit');
end;

function kCGImagePropertyDNGBestQualityScale: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGBestQualityScale');
end;

function kCGImagePropertyDNGBlackLevelDeltaH: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGBlackLevelDeltaH');
end;

function kCGImagePropertyDNGBlackLevelDeltaV: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGBlackLevelDeltaV');
end;

function kCGImagePropertyDNGBlackLevelRepeatDim: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGBlackLevelRepeatDim');
end;

function kCGImagePropertyDNGCFALayout: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGCFALayout');
end;

function kCGImagePropertyDNGCFAPlaneColor: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGCFAPlaneColor');
end;

function kCGImagePropertyDNGChromaBlurRadius: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGChromaBlurRadius');
end;

function kCGImagePropertyDNGColorimetricReference: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGColorimetricReference');
end;

function kCGImagePropertyDNGCurrentICCProfile: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGCurrentICCProfile');
end;

function kCGImagePropertyDNGCurrentPreProfileMatrix: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGCurrentPreProfileMatrix');
end;

function kCGImagePropertyDNGDefaultBlackRender: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGDefaultBlackRender');
end;

function kCGImagePropertyDNGDefaultCropOrigin: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGDefaultCropOrigin');
end;

function kCGImagePropertyDNGDefaultCropSize: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGDefaultCropSize');
end;

function kCGImagePropertyDNGDefaultScale: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGDefaultScale');
end;

function kCGImagePropertyDNGDefaultUserCrop: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGDefaultUserCrop');
end;

function kCGImagePropertyDNGExtraCameraProfiles: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGExtraCameraProfiles');
end;

function kCGImagePropertyDNGForwardMatrix1: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGForwardMatrix1');
end;

function kCGImagePropertyDNGForwardMatrix2: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGForwardMatrix2');
end;

function kCGImagePropertyDNGLinearizationTable: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGLinearizationTable');
end;

function kCGImagePropertyDNGLinearResponseLimit: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGLinearResponseLimit');
end;

function kCGImagePropertyDNGMakerNoteSafety: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGMakerNoteSafety');
end;

function kCGImagePropertyDNGMaskedAreas: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGMaskedAreas');
end;

function kCGImagePropertyDNGNewRawImageDigest: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGNewRawImageDigest');
end;

function kCGImagePropertyDNGNoiseReductionApplied: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGNoiseReductionApplied');
end;

function kCGImagePropertyDNGOpcodeList1: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGOpcodeList1');
end;

function kCGImagePropertyDNGOpcodeList2: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGOpcodeList2');
end;

function kCGImagePropertyDNGOpcodeList3: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGOpcodeList3');
end;

function kCGImagePropertyDNGOriginalBestQualityFinalSize: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGOriginalBestQualityFinalSize');
end;

function kCGImagePropertyDNGOriginalDefaultCropSize: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGOriginalDefaultCropSize');
end;

function kCGImagePropertyDNGOriginalDefaultFinalSize: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGOriginalDefaultFinalSize');
end;

function kCGImagePropertyDNGOriginalRawFileData: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGOriginalRawFileData');
end;

function kCGImagePropertyDNGOriginalRawFileDigest: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGOriginalRawFileDigest');
end;

function kCGImagePropertyDNGOriginalRawFileName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGOriginalRawFileName');
end;

function kCGImagePropertyDNGPreviewApplicationName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGPreviewApplicationName');
end;

function kCGImagePropertyDNGPreviewApplicationVersion: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGPreviewApplicationVersion');
end;

function kCGImagePropertyDNGPreviewColorSpace: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGPreviewColorSpace');
end;

function kCGImagePropertyDNGPreviewDateTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGPreviewDateTime');
end;

function kCGImagePropertyDNGPreviewSettingsDigest: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGPreviewSettingsDigest');
end;

function kCGImagePropertyDNGPreviewSettingsName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGPreviewSettingsName');
end;

function kCGImagePropertyDNGProfileCopyright: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGProfileCopyright');
end;

function kCGImagePropertyDNGProfileEmbedPolicy: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGProfileEmbedPolicy');
end;

function kCGImagePropertyDNGProfileHueSatMapData1: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGProfileHueSatMapData1');
end;

function kCGImagePropertyDNGProfileHueSatMapData2: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGProfileHueSatMapData2');
end;

function kCGImagePropertyDNGProfileHueSatMapDims: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGProfileHueSatMapDims');
end;

function kCGImagePropertyDNGProfileHueSatMapEncoding: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGProfileHueSatMapEncoding');
end;

function kCGImagePropertyDNGProfileLookTableData: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGProfileLookTableData');
end;

function kCGImagePropertyDNGProfileLookTableDims: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGProfileLookTableDims');
end;

function kCGImagePropertyDNGProfileLookTableEncoding: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGProfileLookTableEncoding');
end;

function kCGImagePropertyDNGProfileName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGProfileName');
end;

function kCGImagePropertyDNGProfileToneCurve: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGProfileToneCurve');
end;

function kCGImagePropertyDNGRawDataUniqueID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGRawDataUniqueID');
end;

function kCGImagePropertyDNGRawImageDigest: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGRawImageDigest');
end;

function kCGImagePropertyDNGRawToPreviewGain: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGRawToPreviewGain');
end;

function kCGImagePropertyDNGReductionMatrix1: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGReductionMatrix1');
end;

function kCGImagePropertyDNGReductionMatrix2: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGReductionMatrix2');
end;

function kCGImagePropertyDNGRowInterleaveFactor: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGRowInterleaveFactor');
end;

function kCGImagePropertyDNGShadowScale: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGShadowScale');
end;

function kCGImagePropertyDNGSubTileBlockSize: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyDNGSubTileBlockSize');
end;

function kCGImagePropertyCIFFDescription: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFDescription');
end;

function kCGImagePropertyCIFFFirmware: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFFirmware');
end;

function kCGImagePropertyCIFFOwnerName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFOwnerName');
end;

function kCGImagePropertyCIFFImageName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFImageName');
end;

function kCGImagePropertyCIFFImageFileName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFImageFileName');
end;

function kCGImagePropertyCIFFReleaseMethod: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFReleaseMethod');
end;

function kCGImagePropertyCIFFReleaseTiming: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFReleaseTiming');
end;

function kCGImagePropertyCIFFRecordID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFRecordID');
end;

function kCGImagePropertyCIFFSelfTimingTime: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFSelfTimingTime');
end;

function kCGImagePropertyCIFFCameraSerialNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyCIFFCameraSerialNumber');
end;

function kCGImagePropertyCIFFImageSerialNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyCIFFImageSerialNumber');
end;

function kCGImagePropertyCIFFContinuousDrive: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyCIFFContinuousDrive');
end;

function kCGImagePropertyCIFFFocusMode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFFocusMode');
end;

function kCGImagePropertyCIFFMeteringMode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFMeteringMode');
end;

function kCGImagePropertyCIFFShootingMode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFShootingMode');
end;

function kCGImagePropertyCIFFLensModel: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFLensModel');
end;

function kCGImagePropertyCIFFLensMaxMM: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFLensMaxMM');
end;

function kCGImagePropertyCIFFLensMinMM: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFLensMinMM');
end;

function kCGImagePropertyCIFFWhiteBalanceIndex: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyCIFFWhiteBalanceIndex');
end;

function kCGImagePropertyCIFFFlashExposureComp: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyCIFFFlashExposureComp');
end;

function kCGImagePropertyCIFFMeasuredEV: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFMeasuredEV');
end;

function kCGImagePropertyMakerNikonISOSetting: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonISOSetting');
end;

function kCGImagePropertyMakerNikonColorMode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonColorMode');
end;

function kCGImagePropertyMakerNikonQuality: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonQuality');
end;

function kCGImagePropertyMakerNikonWhiteBalanceMode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonWhiteBalanceMode');
end;

function kCGImagePropertyMakerNikonSharpenMode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonSharpenMode');
end;

function kCGImagePropertyMakerNikonFocusMode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonFocusMode');
end;

function kCGImagePropertyMakerNikonFlashSetting: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonFlashSetting');
end;

function kCGImagePropertyMakerNikonISOSelection: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonISOSelection');
end;

function kCGImagePropertyMakerNikonFlashExposureComp: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonFlashExposureComp');
end;

function kCGImagePropertyMakerNikonImageAdjustment: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonImageAdjustment');
end;

function kCGImagePropertyMakerNikonLensAdapter: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonLensAdapter');
end;

function kCGImagePropertyMakerNikonLensType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonLensType');
end;

function kCGImagePropertyMakerNikonLensInfo: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonLensInfo');
end;

function kCGImagePropertyMakerNikonFocusDistance: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonFocusDistance');
end;

function kCGImagePropertyMakerNikonDigitalZoom: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonDigitalZoom');
end;

function kCGImagePropertyMakerNikonShootingMode: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonShootingMode');
end;

function kCGImagePropertyMakerNikonCameraSerialNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonCameraSerialNumber');
end;

function kCGImagePropertyMakerNikonShutterCount: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerNikonShutterCount');
end;

function kCGImagePropertyMakerCanonOwnerName: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerCanonOwnerName');
end;

function kCGImagePropertyMakerCanonCameraSerialNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerCanonCameraSerialNumber');
end;

function kCGImagePropertyMakerCanonImageSerialNumber: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerCanonImageSerialNumber');
end;

function kCGImagePropertyMakerCanonFlashExposureComp: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerCanonFlashExposureComp');
end;

function kCGImagePropertyMakerCanonContinuousDrive: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerCanonContinuousDrive');
end;

function kCGImagePropertyMakerCanonLensModel: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerCanonLensModel');
end;

function kCGImagePropertyMakerCanonFirmware: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerCanonFirmware');
end;

function kCGImagePropertyMakerCanonAspectRatioInfo: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyMakerCanonAspectRatioInfo');
end;

function kCGImagePropertyOpenEXRAspectRatio: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyOpenEXRAspectRatio');
end;

function kCGImagePropertyTGACompression: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTGACompression');
end;

function kCGImagePropertyPNGCompressionFilter: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyPNGCompressionFilter');
end;

function kCGImagePropertyOpenEXRCompression: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyOpenEXRCompression');
end;

function kCGImagePropertyPNGTransparency: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGTransparency');
end;

function kCGImageAuxiliaryDataTypeDepth: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageAuxiliaryDataTypeDepth');
end;

function kCGImageAuxiliaryDataTypeDisparity: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageAuxiliaryDataTypeDisparity');
end;

function kCGImageAuxiliaryDataTypePortraitEffectsMatte: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageAuxiliaryDataTypePortraitEffectsMatte');
end;

function kCGImageAuxiliaryDataTypeSemanticSegmentationSkinMatte: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageAuxiliaryDataTypeSemanticSegmentationSkinMatte');
end;

function kCGImageAuxiliaryDataTypeSemanticSegmentationHairMatte: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageAuxiliaryDataTypeSemanticSegmentationHairMatte');
end;

function kCGImageAuxiliaryDataTypeSemanticSegmentationTeethMatte: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageAuxiliaryDataTypeSemanticSegmentationTeethMatte');
end;

function kCGImageAuxiliaryDataTypeSemanticSegmentationGlassesMatte: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageAuxiliaryDataTypeSemanticSegmentationGlassesMatte');
end;

function kCGImageAuxiliaryDataTypeSemanticSegmentationSkyMatte: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageAuxiliaryDataTypeSemanticSegmentationSkyMatte');
end;

function kCGImageAuxiliaryDataTypeHDRGainMap: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageAuxiliaryDataTypeHDRGainMap');
end;

function kCGImageAuxiliaryDataInfoData: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageAuxiliaryDataInfoData');
end;

function kCGImageAuxiliaryDataInfoDataDescription: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImageAuxiliaryDataInfoDataDescription');
end;

function kCGImageAuxiliaryDataInfoMetadata: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImageAuxiliaryDataInfoMetadata');
end;

function kCGImagePropertyImageCount: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyImageCount');
end;

function kCGImagePropertyWidth: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyWidth');
end;

function kCGImagePropertyHeight: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyHeight');
end;

function kCGImagePropertyBytesPerRow: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyBytesPerRow');
end;

function kCGImagePropertyNamedColorSpace: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyNamedColorSpace');
end;

function kCGImagePropertyPixelFormat: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPixelFormat');
end;

function kCGImagePropertyImages: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyImages');
end;

function kCGImagePropertyThumbnailImages: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyThumbnailImages');
end;

function kCGImagePropertyAuxiliaryData: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyAuxiliaryData');
end;

function kCGImagePropertyAuxiliaryDataType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyAuxiliaryDataType');
end;

function kCGImagePropertyImageIndex: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyImageIndex');
end;

function kCGImagePropertyGroups: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGroups');
end;

function kCGImagePropertyGroupIndex: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGroupIndex');
end;

function kCGImagePropertyGroupType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGroupType');
end;

function kCGImagePropertyGroupTypeStereoPair: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGroupTypeStereoPair');
end;

function kCGImagePropertyGroupTypeAlternate: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGroupTypeAlternate');
end;

function kCGImagePropertyGroupImagesAlternate: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGroupImagesAlternate');
end;

function kCGImagePropertyGroupImageIndexLeft: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGroupImageIndexLeft');
end;

function kCGImagePropertyGroupImageIndexRight: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGroupImageIndexRight');
end;

function kCGImagePropertyGroupImageIsLeftImage: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGroupImageIsLeftImage');
end;

function kCGImagePropertyGroupImageIsRightImage: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGroupImageIsRightImage');
end;

function kCGImagePropertyGroupImageIsAlternateImage: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGroupImageIsAlternateImage');
end;

function kCGImagePropertyGroupImageBaseline: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGroupImageBaseline');
end;

function kCGImagePropertyGroupImageDisparityAdjustment: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kCGImagePropertyGroupImageDisparityAdjustment');
end;

function kIIOMetadata_CameraExtrinsicsKey: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kIIOMetadata_CameraExtrinsicsKey');
end;

function kIIOCameraExtrinsics_CoordinateSystemID: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kIIOCameraExtrinsics_CoordinateSystemID');
end;

function kIIOCameraExtrinsics_Position: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kIIOCameraExtrinsics_Position');
end;

function kIIOCameraExtrinsics_Rotation: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kIIOCameraExtrinsics_Rotation');
end;

function kIIOMetadata_CameraModelKey: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kIIOMetadata_CameraModelKey');
end;

function kIIOCameraModel_ModelType: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kIIOCameraModel_ModelType');
end;

function kIIOCameraModelType_SimplifiedPinhole: Pointer;
begin
  Result := CocoaPointerConst(libImageIO,
    'kIIOCameraModelType_SimplifiedPinhole');
end;

function kIIOCameraModelType_GenericPinhole: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kIIOCameraModelType_GenericPinhole');
end;

function kIIOCameraModel_Intrinsics: Pointer;
begin
  Result := CocoaPointerConst(libImageIO, 'kIIOCameraModel_Intrinsics');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

ImageIOModule := dlopen(MarshaledAString(libImageIO), RTLD_LAZY);

finalization

dlclose(ImageIOModule);
{$ENDIF IOS}

end.
