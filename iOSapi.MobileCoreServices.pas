{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework MobileCoreServices
//

unit iOSapi.MobileCoreServices;

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

type
  // ===== Framework typedefs =====
{$M+}
  CFStringRef = Pointer;
  CFArrayRef = Pointer;
  Boolean = Byte;
  CFDictionaryRef = Pointer;
  CFURLRef = Pointer;
  FourCharCode = UInt32;
  OSType = FourCharCode;
  // ===== Exported string consts =====

function kUTTypeItem: Pointer;
function kUTTypeContent: Pointer;
function kUTTypeCompositeContent: Pointer;
function kUTTypeMessage: Pointer;
function kUTTypeContact: Pointer;
function kUTTypeArchive: Pointer;
function kUTTypeDiskImage: Pointer;
function kUTTypeData: Pointer;
function kUTTypeDirectory: Pointer;
function kUTTypeResolvable: Pointer;
function kUTTypeSymLink: Pointer;
function kUTTypeExecutable: Pointer;
function kUTTypeMountPoint: Pointer;
function kUTTypeAliasFile: Pointer;
function kUTTypeAliasRecord: Pointer;
function kUTTypeURLBookmarkData: Pointer;
function kUTTypeURL: Pointer;
function kUTTypeFileURL: Pointer;
function kUTTypeText: Pointer;
function kUTTypePlainText: Pointer;
function kUTTypeUTF8PlainText: Pointer;
function kUTTypeUTF16ExternalPlainText: Pointer;
function kUTTypeUTF16PlainText: Pointer;
function kUTTypeDelimitedText: Pointer;
function kUTTypeCommaSeparatedText: Pointer;
function kUTTypeTabSeparatedText: Pointer;
function kUTTypeUTF8TabSeparatedText: Pointer;
function kUTTypeRTF: Pointer;
function kUTTypeHTML: Pointer;
function kUTTypeXML: Pointer;
function kUTTypeSourceCode: Pointer;
function kUTTypeAssemblyLanguageSource: Pointer;
function kUTTypeCSource: Pointer;
function kUTTypeObjectiveCSource: Pointer;
function kUTTypeSwiftSource: Pointer;
function kUTTypeCPlusPlusSource: Pointer;
function kUTTypeObjectiveCPlusPlusSource: Pointer;
function kUTTypeCHeader: Pointer;
function kUTTypeCPlusPlusHeader: Pointer;
function kUTTypeJavaSource: Pointer;
function kUTTypeScript: Pointer;
function kUTTypeAppleScript: Pointer;
function kUTTypeOSAScript: Pointer;
function kUTTypeOSAScriptBundle: Pointer;
function kUTTypeJavaScript: Pointer;
function kUTTypeShellScript: Pointer;
function kUTTypePerlScript: Pointer;
function kUTTypePythonScript: Pointer;
function kUTTypeRubyScript: Pointer;
function kUTTypePHPScript: Pointer;
function kUTTypeJSON: Pointer;
function kUTTypePropertyList: Pointer;
function kUTTypeXMLPropertyList: Pointer;
function kUTTypeBinaryPropertyList: Pointer;
function kUTTypePDF: Pointer;
function kUTTypeRTFD: Pointer;
function kUTTypeFlatRTFD: Pointer;
function kUTTypeTXNTextAndMultimediaData: Pointer;
function kUTTypeWebArchive: Pointer;
function kUTTypeImage: Pointer;
function kUTTypeJPEG: Pointer;
function kUTTypeJPEG2000: Pointer;
function kUTTypeTIFF: Pointer;
function kUTTypePICT: Pointer;
function kUTTypeGIF: Pointer;
function kUTTypePNG: Pointer;
function kUTTypeQuickTimeImage: Pointer;
function kUTTypeAppleICNS: Pointer;
function kUTTypeBMP: Pointer;
function kUTTypeICO: Pointer;
function kUTTypeRawImage: Pointer;
function kUTTypeScalableVectorGraphics: Pointer;
function kUTTypeLivePhoto: Pointer;
function kUTTypeAudiovisualContent: Pointer;
function kUTTypeMovie: Pointer;
function kUTTypeVideo: Pointer;
function kUTTypeAudio: Pointer;
function kUTTypeQuickTimeMovie: Pointer;
function kUTTypeMPEG: Pointer;
function kUTTypeMPEG2Video: Pointer;
function kUTTypeMPEG2TransportStream: Pointer;
function kUTTypeMP3: Pointer;
function kUTTypeMPEG4: Pointer;
function kUTTypeMPEG4Audio: Pointer;
function kUTTypeAppleProtectedMPEG4Audio: Pointer;
function kUTTypeAppleProtectedMPEG4Video: Pointer;
function kUTTypeAVIMovie: Pointer;
function kUTTypeAudioInterchangeFileFormat: Pointer;
function kUTTypeWaveformAudio: Pointer;
function kUTTypeMIDIAudio: Pointer;
function kUTTypePlaylist: Pointer;
function kUTTypeM3UPlaylist: Pointer;
function kUTTypeFolder: Pointer;
function kUTTypeVolume: Pointer;
function kUTTypePackage: Pointer;
function kUTTypeBundle: Pointer;
function kUTTypePluginBundle: Pointer;
function kUTTypeSpotlightImporter: Pointer;
function kUTTypeQuickLookGenerator: Pointer;
function kUTTypeXPCService: Pointer;
function kUTTypeFramework: Pointer;
function kUTTypeApplication: Pointer;
function kUTTypeApplicationBundle: Pointer;
function kUTTypeApplicationFile: Pointer;
function kUTTypeUnixExecutable: Pointer;
function kUTTypeWindowsExecutable: Pointer;
function kUTTypeJavaClass: Pointer;
function kUTTypeJavaArchive: Pointer;
function kUTTypeSystemPreferencesPane: Pointer;
function kUTTypeGNUZipArchive: Pointer;
function kUTTypeBzip2Archive: Pointer;
function kUTTypeZipArchive: Pointer;
function kUTTypeSpreadsheet: Pointer;
function kUTTypePresentation: Pointer;
function kUTTypeDatabase: Pointer;
function kUTTypeVCard: Pointer;
function kUTTypeToDoItem: Pointer;
function kUTTypeCalendarEvent: Pointer;
function kUTTypeEmailMessage: Pointer;
function kUTTypeInternetLocation: Pointer;
function kUTTypeInkText: Pointer;
function kUTTypeFont: Pointer;
function kUTTypeBookmark: Pointer;
function kUTType3DContent: Pointer;
function kUTTypePKCS12: Pointer;
function kUTTypeX509Certificate: Pointer;
function kUTTypeElectronicPublication: Pointer;
function kUTTypeLog: Pointer;
function kUTExportedTypeDeclarationsKey: Pointer;
function kUTImportedTypeDeclarationsKey: Pointer;
function kUTTypeIdentifierKey: Pointer;
function kUTTypeTagSpecificationKey: Pointer;
function kUTTypeConformsToKey: Pointer;
function kUTTypeDescriptionKey: Pointer;
function kUTTypeIconFileKey: Pointer;
function kUTTypeReferenceURLKey: Pointer;
function kUTTypeVersionKey: Pointer;
function kUTTagClassFilenameExtension: Pointer;
function kUTTagClassMIMEType: Pointer;
function kUTTagClassNSPboardType: Pointer;
function kUTTagClassOSType: Pointer;


// ===== External functions =====

const
  libMobileCoreServices =
    '/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices';
function UTTypeCreatePreferredIdentifierForTag(inTagClass: CFStringRef;
  inTag: CFStringRef; inConformingToUTI: CFStringRef): CFStringRef; cdecl;
  external libMobileCoreServices name _PU +
  'UTTypeCreatePreferredIdentifierForTag';
function UTTypeCreateAllIdentifiersForTag(inTagClass: CFStringRef;
  inTag: CFStringRef; inConformingToUTI: CFStringRef): CFArrayRef; cdecl;
  external libMobileCoreServices name _PU + 'UTTypeCreateAllIdentifiersForTag';
function UTTypeCopyPreferredTagWithClass(inUTI: CFStringRef;
  inTagClass: CFStringRef): CFStringRef; cdecl;
  external libMobileCoreServices name _PU + 'UTTypeCopyPreferredTagWithClass';
function UTTypeCopyAllTagsWithClass(inUTI: CFStringRef; inTagClass: CFStringRef)
  : CFArrayRef; cdecl; external libMobileCoreServices name _PU +
  'UTTypeCopyAllTagsWithClass';
function UTTypeEqual(inUTI1: CFStringRef; inUTI2: CFStringRef): Boolean; cdecl;
  external libMobileCoreServices name _PU + 'UTTypeEqual';
function UTTypeConformsTo(inUTI: CFStringRef; inConformsToUTI: CFStringRef)
  : Boolean; cdecl; external libMobileCoreServices name _PU +
  'UTTypeConformsTo';
function UTTypeCopyDescription(inUTI: CFStringRef): CFStringRef; cdecl;
  external libMobileCoreServices name _PU + 'UTTypeCopyDescription';
function UTTypeIsDeclared(inUTI: CFStringRef): Boolean; cdecl;
  external libMobileCoreServices name _PU + 'UTTypeIsDeclared';
function UTTypeIsDynamic(inUTI: CFStringRef): Boolean; cdecl;
  external libMobileCoreServices name _PU + 'UTTypeIsDynamic';
function UTTypeCopyDeclaration(inUTI: CFStringRef): CFDictionaryRef; cdecl;
  external libMobileCoreServices name _PU + 'UTTypeCopyDeclaration';
function UTTypeCopyDeclaringBundleURL(inUTI: CFStringRef): CFURLRef; cdecl;
  external libMobileCoreServices name _PU + 'UTTypeCopyDeclaringBundleURL';
function UTCreateStringForOSType(inOSType: OSType): CFStringRef; cdecl;
  external libMobileCoreServices name _PU + 'UTCreateStringForOSType';
function UTGetOSTypeFromString(inString: CFStringRef): OSType; cdecl;
  external libMobileCoreServices name _PU + 'UTGetOSTypeFromString';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  MobileCoreServicesModule: THandle;

{$ENDIF IOS}

function kUTTypeItem: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeItem');
end;

function kUTTypeContent: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeContent');
end;

function kUTTypeCompositeContent: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeCompositeContent');
end;

function kUTTypeMessage: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeMessage');
end;

function kUTTypeContact: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeContact');
end;

function kUTTypeArchive: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeArchive');
end;

function kUTTypeDiskImage: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeDiskImage');
end;

function kUTTypeData: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeData');
end;

function kUTTypeDirectory: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeDirectory');
end;

function kUTTypeResolvable: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeResolvable');
end;

function kUTTypeSymLink: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeSymLink');
end;

function kUTTypeExecutable: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeExecutable');
end;

function kUTTypeMountPoint: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeMountPoint');
end;

function kUTTypeAliasFile: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeAliasFile');
end;

function kUTTypeAliasRecord: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeAliasRecord');
end;

function kUTTypeURLBookmarkData: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeURLBookmarkData');
end;

function kUTTypeURL: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeURL');
end;

function kUTTypeFileURL: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeFileURL');
end;

function kUTTypeText: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeText');
end;

function kUTTypePlainText: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypePlainText');
end;

function kUTTypeUTF8PlainText: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeUTF8PlainText');
end;

function kUTTypeUTF16ExternalPlainText: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeUTF16ExternalPlainText');
end;

function kUTTypeUTF16PlainText: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeUTF16PlainText');
end;

function kUTTypeDelimitedText: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeDelimitedText');
end;

function kUTTypeCommaSeparatedText: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeCommaSeparatedText');
end;

function kUTTypeTabSeparatedText: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeTabSeparatedText');
end;

function kUTTypeUTF8TabSeparatedText: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeUTF8TabSeparatedText');
end;

function kUTTypeRTF: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeRTF');
end;

function kUTTypeHTML: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeHTML');
end;

function kUTTypeXML: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeXML');
end;

function kUTTypeSourceCode: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeSourceCode');
end;

function kUTTypeAssemblyLanguageSource: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeAssemblyLanguageSource');
end;

function kUTTypeCSource: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeCSource');
end;

function kUTTypeObjectiveCSource: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeObjectiveCSource');
end;

function kUTTypeSwiftSource: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeSwiftSource');
end;

function kUTTypeCPlusPlusSource: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeCPlusPlusSource');
end;

function kUTTypeObjectiveCPlusPlusSource: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeObjectiveCPlusPlusSource');
end;

function kUTTypeCHeader: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeCHeader');
end;

function kUTTypeCPlusPlusHeader: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeCPlusPlusHeader');
end;

function kUTTypeJavaSource: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeJavaSource');
end;

function kUTTypeScript: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeScript');
end;

function kUTTypeAppleScript: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeAppleScript');
end;

function kUTTypeOSAScript: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeOSAScript');
end;

function kUTTypeOSAScriptBundle: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeOSAScriptBundle');
end;

function kUTTypeJavaScript: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeJavaScript');
end;

function kUTTypeShellScript: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeShellScript');
end;

function kUTTypePerlScript: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypePerlScript');
end;

function kUTTypePythonScript: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypePythonScript');
end;

function kUTTypeRubyScript: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeRubyScript');
end;

function kUTTypePHPScript: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypePHPScript');
end;

function kUTTypeJSON: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeJSON');
end;

function kUTTypePropertyList: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypePropertyList');
end;

function kUTTypeXMLPropertyList: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeXMLPropertyList');
end;

function kUTTypeBinaryPropertyList: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeBinaryPropertyList');
end;

function kUTTypePDF: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypePDF');
end;

function kUTTypeRTFD: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeRTFD');
end;

function kUTTypeFlatRTFD: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeFlatRTFD');
end;

function kUTTypeTXNTextAndMultimediaData: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeTXNTextAndMultimediaData');
end;

function kUTTypeWebArchive: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeWebArchive');
end;

function kUTTypeImage: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeImage');
end;

function kUTTypeJPEG: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeJPEG');
end;

function kUTTypeJPEG2000: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeJPEG2000');
end;

function kUTTypeTIFF: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeTIFF');
end;

function kUTTypePICT: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypePICT');
end;

function kUTTypeGIF: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeGIF');
end;

function kUTTypePNG: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypePNG');
end;

function kUTTypeQuickTimeImage: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeQuickTimeImage');
end;

function kUTTypeAppleICNS: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeAppleICNS');
end;

function kUTTypeBMP: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeBMP');
end;

function kUTTypeICO: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeICO');
end;

function kUTTypeRawImage: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeRawImage');
end;

function kUTTypeScalableVectorGraphics: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeScalableVectorGraphics');
end;

function kUTTypeLivePhoto: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeLivePhoto');
end;

function kUTTypeAudiovisualContent: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeAudiovisualContent');
end;

function kUTTypeMovie: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeMovie');
end;

function kUTTypeVideo: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeVideo');
end;

function kUTTypeAudio: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeAudio');
end;

function kUTTypeQuickTimeMovie: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeQuickTimeMovie');
end;

function kUTTypeMPEG: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeMPEG');
end;

function kUTTypeMPEG2Video: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeMPEG2Video');
end;

function kUTTypeMPEG2TransportStream: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeMPEG2TransportStream');
end;

function kUTTypeMP3: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeMP3');
end;

function kUTTypeMPEG4: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeMPEG4');
end;

function kUTTypeMPEG4Audio: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeMPEG4Audio');
end;

function kUTTypeAppleProtectedMPEG4Audio: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeAppleProtectedMPEG4Audio');
end;

function kUTTypeAppleProtectedMPEG4Video: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeAppleProtectedMPEG4Video');
end;

function kUTTypeAVIMovie: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeAVIMovie');
end;

function kUTTypeAudioInterchangeFileFormat: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeAudioInterchangeFileFormat');
end;

function kUTTypeWaveformAudio: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeWaveformAudio');
end;

function kUTTypeMIDIAudio: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeMIDIAudio');
end;

function kUTTypePlaylist: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypePlaylist');
end;

function kUTTypeM3UPlaylist: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeM3UPlaylist');
end;

function kUTTypeFolder: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeFolder');
end;

function kUTTypeVolume: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeVolume');
end;

function kUTTypePackage: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypePackage');
end;

function kUTTypeBundle: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeBundle');
end;

function kUTTypePluginBundle: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypePluginBundle');
end;

function kUTTypeSpotlightImporter: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeSpotlightImporter');
end;

function kUTTypeQuickLookGenerator: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeQuickLookGenerator');
end;

function kUTTypeXPCService: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeXPCService');
end;

function kUTTypeFramework: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeFramework');
end;

function kUTTypeApplication: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeApplication');
end;

function kUTTypeApplicationBundle: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeApplicationBundle');
end;

function kUTTypeApplicationFile: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeApplicationFile');
end;

function kUTTypeUnixExecutable: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeUnixExecutable');
end;

function kUTTypeWindowsExecutable: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeWindowsExecutable');
end;

function kUTTypeJavaClass: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeJavaClass');
end;

function kUTTypeJavaArchive: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeJavaArchive');
end;

function kUTTypeSystemPreferencesPane: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeSystemPreferencesPane');
end;

function kUTTypeGNUZipArchive: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeGNUZipArchive');
end;

function kUTTypeBzip2Archive: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeBzip2Archive');
end;

function kUTTypeZipArchive: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeZipArchive');
end;

function kUTTypeSpreadsheet: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeSpreadsheet');
end;

function kUTTypePresentation: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypePresentation');
end;

function kUTTypeDatabase: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeDatabase');
end;

function kUTTypeVCard: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeVCard');
end;

function kUTTypeToDoItem: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeToDoItem');
end;

function kUTTypeCalendarEvent: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeCalendarEvent');
end;

function kUTTypeEmailMessage: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeEmailMessage');
end;

function kUTTypeInternetLocation: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeInternetLocation');
end;

function kUTTypeInkText: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeInkText');
end;

function kUTTypeFont: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeFont');
end;

function kUTTypeBookmark: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeBookmark');
end;

function kUTType3DContent: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTType3DContent');
end;

function kUTTypePKCS12: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypePKCS12');
end;

function kUTTypeX509Certificate: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeX509Certificate');
end;

function kUTTypeElectronicPublication: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeElectronicPublication');
end;

function kUTTypeLog: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeLog');
end;

function kUTExportedTypeDeclarationsKey: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTExportedTypeDeclarationsKey');
end;

function kUTImportedTypeDeclarationsKey: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTImportedTypeDeclarationsKey');
end;

function kUTTypeIdentifierKey: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeIdentifierKey');
end;

function kUTTypeTagSpecificationKey: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTypeTagSpecificationKey');
end;

function kUTTypeConformsToKey: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeConformsToKey');
end;

function kUTTypeDescriptionKey: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeDescriptionKey');
end;

function kUTTypeIconFileKey: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeIconFileKey');
end;

function kUTTypeReferenceURLKey: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeReferenceURLKey');
end;

function kUTTypeVersionKey: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTypeVersionKey');
end;

function kUTTagClassFilenameExtension: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices,
    'kUTTagClassFilenameExtension');
end;

function kUTTagClassMIMEType: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTagClassMIMEType');
end;

function kUTTagClassNSPboardType: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTagClassNSPboardType');
end;

function kUTTagClassOSType: Pointer;
begin
  Result := CocoaPointerConst(libMobileCoreServices, 'kUTTagClassOSType');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MobileCoreServicesModule := dlopen(MarshaledAString(libMobileCoreServices),
  RTLD_LAZY);

finalization

dlclose(MobileCoreServicesModule);
{$ENDIF IOS}

end.
