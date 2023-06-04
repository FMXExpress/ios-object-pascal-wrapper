{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreServices
//

unit iOSapi.CoreServices;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

type
  // ===== Framework typedefs =====
{$M+}
  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  CFArrayRef = Pointer;
  PCFArrayRef = ^CFArrayRef;
  Boolean = Byte;
  PBoolean = ^Boolean;

  CFDictionaryRef = Pointer;
  PCFDictionaryRef = ^CFDictionaryRef;
  CFURLRef = Pointer;
  PCFURLRef = ^CFURLRef;
  FourCharCode = UInt32;
  PFourCharCode = ^FourCharCode;
  OSType = FourCharCode;
  POSType = ^OSType;
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
  libCoreServices =
    '/System/Library/Frameworks/CoreServices.framework/CoreServices';
function UTTypeCreatePreferredIdentifierForTag(inTagClass: CFStringRef;
  inTag: CFStringRef; inConformingToUTI: CFStringRef): CFStringRef; cdecl;
  external libCoreServices name _PU + 'UTTypeCreatePreferredIdentifierForTag';
function UTTypeCreateAllIdentifiersForTag(inTagClass: CFStringRef;
  inTag: CFStringRef; inConformingToUTI: CFStringRef): CFArrayRef; cdecl;
  external libCoreServices name _PU + 'UTTypeCreateAllIdentifiersForTag';
function UTTypeCopyPreferredTagWithClass(inUTI: CFStringRef;
  inTagClass: CFStringRef): CFStringRef; cdecl;
  external libCoreServices name _PU + 'UTTypeCopyPreferredTagWithClass';
function UTTypeCopyAllTagsWithClass(inUTI: CFStringRef; inTagClass: CFStringRef)
  : CFArrayRef; cdecl; external libCoreServices name _PU +
  'UTTypeCopyAllTagsWithClass';
function UTTypeEqual(inUTI1: CFStringRef; inUTI2: CFStringRef): Boolean; cdecl;
  external libCoreServices name _PU + 'UTTypeEqual';
function UTTypeConformsTo(inUTI: CFStringRef; inConformsToUTI: CFStringRef)
  : Boolean; cdecl; external libCoreServices name _PU + 'UTTypeConformsTo';
function UTTypeCopyDescription(inUTI: CFStringRef): CFStringRef; cdecl;
  external libCoreServices name _PU + 'UTTypeCopyDescription';
function UTTypeIsDeclared(inUTI: CFStringRef): Boolean; cdecl;
  external libCoreServices name _PU + 'UTTypeIsDeclared';
function UTTypeIsDynamic(inUTI: CFStringRef): Boolean; cdecl;
  external libCoreServices name _PU + 'UTTypeIsDynamic';
function UTTypeCopyDeclaration(inUTI: CFStringRef): CFDictionaryRef; cdecl;
  external libCoreServices name _PU + 'UTTypeCopyDeclaration';
function UTTypeCopyDeclaringBundleURL(inUTI: CFStringRef): CFURLRef; cdecl;
  external libCoreServices name _PU + 'UTTypeCopyDeclaringBundleURL';
function UTCreateStringForOSType(inOSType: OSType): CFStringRef; cdecl;
  external libCoreServices name _PU + 'UTCreateStringForOSType';
function UTGetOSTypeFromString(inString: CFStringRef): OSType; cdecl;
  external libCoreServices name _PU + 'UTGetOSTypeFromString';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreServicesModule: THandle;

{$ENDIF IOS}

function kUTTypeItem: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeItem');
end;

function kUTTypeContent: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeContent');
end;

function kUTTypeCompositeContent: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeCompositeContent');
end;

function kUTTypeMessage: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeMessage');
end;

function kUTTypeContact: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeContact');
end;

function kUTTypeArchive: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeArchive');
end;

function kUTTypeDiskImage: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeDiskImage');
end;

function kUTTypeData: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeData');
end;

function kUTTypeDirectory: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeDirectory');
end;

function kUTTypeResolvable: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeResolvable');
end;

function kUTTypeSymLink: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeSymLink');
end;

function kUTTypeExecutable: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeExecutable');
end;

function kUTTypeMountPoint: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeMountPoint');
end;

function kUTTypeAliasFile: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeAliasFile');
end;

function kUTTypeAliasRecord: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeAliasRecord');
end;

function kUTTypeURLBookmarkData: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeURLBookmarkData');
end;

function kUTTypeURL: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeURL');
end;

function kUTTypeFileURL: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeFileURL');
end;

function kUTTypeText: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeText');
end;

function kUTTypePlainText: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypePlainText');
end;

function kUTTypeUTF8PlainText: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeUTF8PlainText');
end;

function kUTTypeUTF16ExternalPlainText: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeUTF16ExternalPlainText');
end;

function kUTTypeUTF16PlainText: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeUTF16PlainText');
end;

function kUTTypeDelimitedText: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeDelimitedText');
end;

function kUTTypeCommaSeparatedText: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeCommaSeparatedText');
end;

function kUTTypeTabSeparatedText: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeTabSeparatedText');
end;

function kUTTypeUTF8TabSeparatedText: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeUTF8TabSeparatedText');
end;

function kUTTypeRTF: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeRTF');
end;

function kUTTypeHTML: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeHTML');
end;

function kUTTypeXML: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeXML');
end;

function kUTTypeSourceCode: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeSourceCode');
end;

function kUTTypeAssemblyLanguageSource: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeAssemblyLanguageSource');
end;

function kUTTypeCSource: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeCSource');
end;

function kUTTypeObjectiveCSource: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeObjectiveCSource');
end;

function kUTTypeSwiftSource: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeSwiftSource');
end;

function kUTTypeCPlusPlusSource: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeCPlusPlusSource');
end;

function kUTTypeObjectiveCPlusPlusSource: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices,
    'kUTTypeObjectiveCPlusPlusSource');
end;

function kUTTypeCHeader: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeCHeader');
end;

function kUTTypeCPlusPlusHeader: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeCPlusPlusHeader');
end;

function kUTTypeJavaSource: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeJavaSource');
end;

function kUTTypeScript: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeScript');
end;

function kUTTypeAppleScript: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeAppleScript');
end;

function kUTTypeOSAScript: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeOSAScript');
end;

function kUTTypeOSAScriptBundle: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeOSAScriptBundle');
end;

function kUTTypeJavaScript: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeJavaScript');
end;

function kUTTypeShellScript: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeShellScript');
end;

function kUTTypePerlScript: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypePerlScript');
end;

function kUTTypePythonScript: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypePythonScript');
end;

function kUTTypeRubyScript: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeRubyScript');
end;

function kUTTypePHPScript: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypePHPScript');
end;

function kUTTypeJSON: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeJSON');
end;

function kUTTypePropertyList: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypePropertyList');
end;

function kUTTypeXMLPropertyList: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeXMLPropertyList');
end;

function kUTTypeBinaryPropertyList: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeBinaryPropertyList');
end;

function kUTTypePDF: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypePDF');
end;

function kUTTypeRTFD: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeRTFD');
end;

function kUTTypeFlatRTFD: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeFlatRTFD');
end;

function kUTTypeTXNTextAndMultimediaData: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices,
    'kUTTypeTXNTextAndMultimediaData');
end;

function kUTTypeWebArchive: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeWebArchive');
end;

function kUTTypeImage: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeImage');
end;

function kUTTypeJPEG: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeJPEG');
end;

function kUTTypeJPEG2000: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeJPEG2000');
end;

function kUTTypeTIFF: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeTIFF');
end;

function kUTTypePICT: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypePICT');
end;

function kUTTypeGIF: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeGIF');
end;

function kUTTypePNG: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypePNG');
end;

function kUTTypeQuickTimeImage: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeQuickTimeImage');
end;

function kUTTypeAppleICNS: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeAppleICNS');
end;

function kUTTypeBMP: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeBMP');
end;

function kUTTypeICO: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeICO');
end;

function kUTTypeRawImage: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeRawImage');
end;

function kUTTypeScalableVectorGraphics: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeScalableVectorGraphics');
end;

function kUTTypeLivePhoto: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeLivePhoto');
end;

function kUTTypeAudiovisualContent: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeAudiovisualContent');
end;

function kUTTypeMovie: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeMovie');
end;

function kUTTypeVideo: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeVideo');
end;

function kUTTypeAudio: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeAudio');
end;

function kUTTypeQuickTimeMovie: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeQuickTimeMovie');
end;

function kUTTypeMPEG: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeMPEG');
end;

function kUTTypeMPEG2Video: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeMPEG2Video');
end;

function kUTTypeMPEG2TransportStream: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeMPEG2TransportStream');
end;

function kUTTypeMP3: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeMP3');
end;

function kUTTypeMPEG4: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeMPEG4');
end;

function kUTTypeMPEG4Audio: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeMPEG4Audio');
end;

function kUTTypeAppleProtectedMPEG4Audio: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices,
    'kUTTypeAppleProtectedMPEG4Audio');
end;

function kUTTypeAppleProtectedMPEG4Video: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices,
    'kUTTypeAppleProtectedMPEG4Video');
end;

function kUTTypeAVIMovie: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeAVIMovie');
end;

function kUTTypeAudioInterchangeFileFormat: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices,
    'kUTTypeAudioInterchangeFileFormat');
end;

function kUTTypeWaveformAudio: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeWaveformAudio');
end;

function kUTTypeMIDIAudio: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeMIDIAudio');
end;

function kUTTypePlaylist: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypePlaylist');
end;

function kUTTypeM3UPlaylist: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeM3UPlaylist');
end;

function kUTTypeFolder: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeFolder');
end;

function kUTTypeVolume: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeVolume');
end;

function kUTTypePackage: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypePackage');
end;

function kUTTypeBundle: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeBundle');
end;

function kUTTypePluginBundle: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypePluginBundle');
end;

function kUTTypeSpotlightImporter: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeSpotlightImporter');
end;

function kUTTypeQuickLookGenerator: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeQuickLookGenerator');
end;

function kUTTypeXPCService: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeXPCService');
end;

function kUTTypeFramework: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeFramework');
end;

function kUTTypeApplication: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeApplication');
end;

function kUTTypeApplicationBundle: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeApplicationBundle');
end;

function kUTTypeApplicationFile: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeApplicationFile');
end;

function kUTTypeUnixExecutable: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeUnixExecutable');
end;

function kUTTypeWindowsExecutable: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeWindowsExecutable');
end;

function kUTTypeJavaClass: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeJavaClass');
end;

function kUTTypeJavaArchive: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeJavaArchive');
end;

function kUTTypeSystemPreferencesPane: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeSystemPreferencesPane');
end;

function kUTTypeGNUZipArchive: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeGNUZipArchive');
end;

function kUTTypeBzip2Archive: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeBzip2Archive');
end;

function kUTTypeZipArchive: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeZipArchive');
end;

function kUTTypeSpreadsheet: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeSpreadsheet');
end;

function kUTTypePresentation: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypePresentation');
end;

function kUTTypeDatabase: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeDatabase');
end;

function kUTTypeVCard: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeVCard');
end;

function kUTTypeToDoItem: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeToDoItem');
end;

function kUTTypeCalendarEvent: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeCalendarEvent');
end;

function kUTTypeEmailMessage: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeEmailMessage');
end;

function kUTTypeInternetLocation: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeInternetLocation');
end;

function kUTTypeInkText: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeInkText');
end;

function kUTTypeFont: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeFont');
end;

function kUTTypeBookmark: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeBookmark');
end;

function kUTType3DContent: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTType3DContent');
end;

function kUTTypePKCS12: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypePKCS12');
end;

function kUTTypeX509Certificate: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeX509Certificate');
end;

function kUTTypeElectronicPublication: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeElectronicPublication');
end;

function kUTTypeLog: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeLog');
end;

function kUTExportedTypeDeclarationsKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices,
    'kUTExportedTypeDeclarationsKey');
end;

function kUTImportedTypeDeclarationsKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices,
    'kUTImportedTypeDeclarationsKey');
end;

function kUTTypeIdentifierKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeIdentifierKey');
end;

function kUTTypeTagSpecificationKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeTagSpecificationKey');
end;

function kUTTypeConformsToKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeConformsToKey');
end;

function kUTTypeDescriptionKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeDescriptionKey');
end;

function kUTTypeIconFileKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeIconFileKey');
end;

function kUTTypeReferenceURLKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeReferenceURLKey');
end;

function kUTTypeVersionKey: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTypeVersionKey');
end;

function kUTTagClassFilenameExtension: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTagClassFilenameExtension');
end;

function kUTTagClassMIMEType: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTagClassMIMEType');
end;

function kUTTagClassNSPboardType: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTagClassNSPboardType');
end;

function kUTTagClassOSType: Pointer;
begin
  Result := CocoaPointerConst(libCoreServices, 'kUTTagClassOSType');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreServicesModule := dlopen(MarshaledAString(libCoreServices), RTLD_LAZY);

finalization

dlclose(CoreServicesModule);
{$ENDIF IOS}

end.
