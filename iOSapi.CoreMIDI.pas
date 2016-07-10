{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreMIDI
//

unit iOSapi.CoreMIDI;

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
  kMIDIInvalidClient = -10830;
  kMIDIInvalidPort = -10831;
  kMIDIWrongEndpointType = -10832;
  kMIDINoConnection = -10833;
  kMIDIUnknownEndpoint = -10834;
  kMIDIUnknownProperty = -10835;
  kMIDIWrongPropertyType = -10836;
  kMIDINoCurrentSetup = -10837;
  kMIDIMessageSendErr = -10838;
  kMIDIServerStartErr = -10839;
  kMIDISetupFormatErr = -10840;
  kMIDIWrongThread = -10841;
  kMIDIObjectNotFound = -10842;
  kMIDIIDNotUnique = -10843;
  kMIDINotPermitted = -10844;
  kMIDIObjectType_Other = -1;
  kMIDIObjectType_Device = 0;
  kMIDIObjectType_Entity = 1;
  kMIDIObjectType_Source = 2;
  kMIDIObjectType_Destination = 3;
  kMIDIObjectType_ExternalDevice = 16 or kMIDIObjectType_Device;
  kMIDIObjectType_ExternalEntity = 16 or kMIDIObjectType_Entity;
  kMIDIObjectType_ExternalSource = 16 or kMIDIObjectType_Source;
  kMIDIObjectType_ExternalDestination = 16 or kMIDIObjectType_Destination;
  kMIDIInvalidUniqueID = 0;
  kMIDIMsgSetupChanged = 1;
  kMIDIMsgObjectAdded = 2;
  kMIDIMsgObjectRemoved = 3;
  kMIDIMsgPropertyChanged = 4;
  kMIDIMsgThruConnectionsChanged = 5;
  kMIDIMsgSerialPortOwnerChanged = 6;
  kMIDIMsgIOError = 7;
  kMIDITransform_None = 0;
  kMIDITransform_FilterOut = 1;
  kMIDITransform_MapControl = 2;
  kMIDITransform_Add = 8;
  kMIDITransform_Scale = 9;
  kMIDITransform_MinValue = 10;
  kMIDITransform_MaxValue = 11;
  kMIDITransform_MapValue = 12;
  kMIDIThruConnection_MaxEndpoints = 8;
  kMIDIControlType_7Bit = 0;
  kMIDIControlType_14Bit = 1;
  kMIDIControlType_7BitRPN = 2;
  kMIDIControlType_14BitRPN = 3;
  kMIDIControlType_7BitNRPN = 4;
  kMIDIControlType_14BitNRPN = 5;
  MIDINetworkConnectionPolicy_NoOne = 0;
  MIDINetworkConnectionPolicy_HostsInContactList = 1;
  MIDINetworkConnectionPolicy_Anyone = 2;

type

  // ===== Forward declarations =====
{$M+}
  MIDINetworkHost = interface;
  MIDINetworkConnection = interface;
  MIDINetworkSession = interface;

  // ===== Framework typedefs =====
{$M+}
  MIDIObjectRef = UInt32;
  MIDIClientRef = MIDIObjectRef;
  MIDIPortRef = MIDIObjectRef;
  MIDIDeviceRef = MIDIObjectRef;
  MIDIEntityRef = MIDIObjectRef;
  MIDIEndpointRef = MIDIObjectRef;
  MIDITimeStamp = UInt64;
  MIDIObjectType = Int32;
  MIDIUniqueID = Int32;
  MIDIPacket = MIDIPacket = record timeStamp: MIDITimeStamp;
length:
UInt16;
data:
array [0 .. 255] of Byte;
end;
PMIDIPacket = ^MIDIPacket;;

MIDIPacketList = record numPackets: UInt32;
packet:
array [0 .. 0] of MIDIPacket;
end;
PMIDIPacketList = ^MIDIPacketList;

Boolean = Byte;
MIDICompletionProc =
procedure(param1: Pointer);
cdecl;

MIDISysexSendRequest = record destination: MIDIEndpointRef;
data:
PByte;
bytesToSend:
UInt32;
complete:
Boolean;
reserved:
array [0 .. 2] of Byte;
completionProc:
MIDICompletionProc;
completionRefCon:
Pointer;
end;
PMIDISysexSendRequest = ^MIDISysexSendRequest;

MIDINotificationMessageID = Int32;

MIDINotification = record messageID: MIDINotificationMessageID;
messageSize:
UInt32;
end;
PMIDINotification = ^MIDINotification;

MIDINotifyProc =
procedure(param1: Pointer; param2: Pointer);
cdecl;
MIDINotifyBlock =
procedure(param1: Pointer) of object;
MIDIReadProc =
procedure(param1: Pointer; param2: Pointer; param3: Pointer);
cdecl;
MIDIReadBlock =
procedure(param1: Pointer; param2: Pointer) of object;

MIDIObjectAddRemoveNotification = record messageID: MIDINotificationMessageID;
messageSize:
UInt32;
parent:
MIDIObjectRef;
parentType:
MIDIObjectType;
child:
MIDIObjectRef;
childType:
MIDIObjectType;
end;
PMIDIObjectAddRemoveNotification = ^MIDIObjectAddRemoveNotification;

CFStringRef = Pointer;

MIDIObjectPropertyChangeNotification = record messageID
  : MIDINotificationMessageID;
messageSize:
UInt32;
&object:
MIDIObjectRef;
objectType:
MIDIObjectType;
propertyName:
CFStringRef;
end;
PMIDIObjectPropertyChangeNotification = ^MIDIObjectPropertyChangeNotification;

OSStatus = Int32;

MIDIIOErrorNotification = record messageID: MIDINotificationMessageID;
messageSize:
UInt32;
driverDevice:
MIDIDeviceRef;
errorCode:
OSStatus;
end;
PMIDIIOErrorNotification = ^MIDIIOErrorNotification;

ItemCount = LongWord;
CFDataRef = Pointer;
CFDictionaryRef = Pointer;
ByteCount = LongWord;
MIDISetupRef = MIDIObjectRef;
MIDIThruConnectionRef = MIDIObjectRef;

MIDIValueMap = record value: array [0 .. 127] of Byte;
end;
PMIDIValueMap = ^MIDIValueMap;

MIDITransformType = UInt16;
MIDITransformControlType = Byte;

MIDITransform = record transform: MIDITransformType;
param:
Int16;
end;
PMIDITransform = ^MIDITransform;

MIDIControlTransform = record controlType: MIDITransformControlType;
remappedControlType:
MIDITransformControlType;
controlNumber:
UInt16;
transform:
MIDITransformType;
param:
Int16;
end;
PMIDIControlTransform = ^MIDIControlTransform;

MIDIThruConnectionEndpoint = record endpointRef: MIDIEndpointRef;
uniqueID:
MIDIUniqueID;
end;
PMIDIThruConnectionEndpoint = ^MIDIThruConnectionEndpoint;

MIDIThruConnectionParams = record version: UInt32;
numSources:
UInt32;
sources:
array [0 .. 7] of MIDIThruConnectionEndpoint;
numDestinations:
UInt32;
destinations:
array [0 .. 7] of MIDIThruConnectionEndpoint;
channelMap:
array [0 .. 15] of Byte;
lowVelocity:
Byte;
highVelocity:
Byte;
lowNote:
Byte;
highNote:
Byte;
noteNumber:
MIDITransform;
velocity:
MIDITransform;
keyPressure:
MIDITransform;
channelPressure:
MIDITransform;
programChange:
MIDITransform;
pitchBend:
MIDITransform;
filterOutSysEx:
Byte;
filterOutMTC:
Byte;
filterOutBeatClock:
Byte;
filterOutTuneRequest:
Byte;
reserved2:
array [0 .. 2] of Byte;
filterOutAllControls:
Byte;
numControlTransforms:
UInt16;
numMaps:
UInt16;
reserved3:
array [0 .. 3] of UInt16;
end;
PMIDIThruConnectionParams = ^MIDIThruConnectionParams;

__darwin_size_t = LongWord;
CFUUIDBytes = record byte0: Byte;
byte1:
Byte;
byte2:
Byte;
byte3:
Byte;
byte4:
Byte;
byte5:
Byte;
byte6:
Byte;
byte7:
Byte;
byte8:
Byte;
byte9:
Byte;
byte10:
Byte;
byte11:
Byte;
byte12:
Byte;
byte13:
Byte;
byte14:
Byte;
byte15:
Byte;
end;;
REFIID = CFUUIDBytes;
HRESULT = Int32;
TCoreMIDIQueryInterface =
function(param1: Pointer; param2: REFIID; param3: Pointer): HRESULT;
cdecl;
ULONG = UInt32;
TCoreMIDIAddRef =
function(param1: Pointer): ULONG;
cdecl;
MIDIDriverRef = Pointer;
MIDIDeviceListRef = MIDIObjectRef;
TCoreMIDIFindDevices =
function(param1: MIDIDriverRef; param2: MIDIDeviceListRef): OSStatus;
cdecl;
TCoreMIDIStop =
function(param1: MIDIDriverRef): OSStatus;
cdecl;
TCoreMIDIConfigure =
function(param1: MIDIDriverRef; param2: MIDIDeviceRef): OSStatus;
cdecl;
TCoreMIDISend =
function(param1: MIDIDriverRef; param2: Pointer; param3: Pointer;
  param4: Pointer): OSStatus;
cdecl;
TCoreMIDIEnableSource =
function(param1: MIDIDriverRef; param2: MIDIEndpointRef; param3: Boolean)
  : OSStatus;
cdecl;
TCoreMIDIFlush =
function(param1: MIDIDriverRef; param2: MIDIEndpointRef; param3: Pointer;
  param4: Pointer): OSStatus;
cdecl;
TCoreMIDIMonitor =
function(param1: MIDIDriverRef; param2: MIDIEndpointRef; param3: Pointer)
  : OSStatus;
cdecl;

MIDIDriverInterface = record _reserved: Pointer;
QueryInterface:
TCoreMIDIQueryInterface;
AddRef:
TCoreMIDIAddRef;
Release:
TCoreMIDIAddRef;
FindDevices:
TCoreMIDIFindDevices;
Start:
TCoreMIDIFindDevices;
Stop:
TCoreMIDIStop;
Configure:
TCoreMIDIConfigure;
Send:
TCoreMIDISend;
EnableSource:
TCoreMIDIEnableSource;
Flush:
TCoreMIDIFlush;
Monitor:
TCoreMIDIMonitor;
end;
PMIDIDriverInterface = ^MIDIDriverInterface;

CFRunLoopRef = Pointer;
NSUInteger = Cardinal;
MIDINetworkConnectionPolicy = NSUInteger;
// ===== Interface declarations =====

MIDINetworkHostClass = interface(NSObjectClass)
  ['{0B93F08E-CFF9-46B9-9830-768F1F24F108}']
  [MethodName('hostWithName:address:port:')]
{ class } function hostWithNameAddressPort(name: NSString; address: NSString;
  port: NSUInteger): Pointer { instancetype };
cdecl;

[MethodName('hostWithName:netService:')]
{ class } function hostWithNameNetService(name: NSString;
  netService: NSNetService): Pointer { instancetype }; cdecl;
[MethodName('hostWithName:netServiceName:netServiceDomain:')]
{ class } function hostWithNameNetServiceNameNetServiceDomain(name: NSString;
    netServiceName: NSString; netServiceDomain: NSString)
    : Pointer { instancetype }; cdecl;
  end;
MIDINetworkHost = interface(NSObject)['{E7AF7518-4D6D-46B3-8533-140A2F0EADD2}']
function hasSameAddressAs(other: MIDINetworkHost): Boolean;
cdecl;

function name: NSString; cdecl;
  function address: NSString; cdecl;
    function port: NSUInteger; cdecl;
      function netServiceName: NSString; cdecl;
        function netServiceDomain: NSString; cdecl;
        end;

    TMIDINetworkHost = class(TOCGenericImport<MIDINetworkHostClass,
      MIDINetworkHost>)
    end;
PMIDINetworkHost = Pointer;

MIDINetworkConnectionClass = interface(NSObjectClass)
  ['{8D384846-BC9C-4D58-A929-04BDB3804DC4}']
{ class } function connectionWithHost(host: MIDINetworkHost)
  : Pointer { instancetype };
cdecl;
end;
MIDINetworkConnection = interface(NSObject)
  ['{9C1D92F1-9897-404E-9A21-0EBF6F22BDAD}']
function host: MIDINetworkHost;
cdecl;
end;

TMIDINetworkConnection = class(TOCGenericImport<MIDINetworkConnectionClass,
  MIDINetworkConnection>)
end;
PMIDINetworkConnection = Pointer;

MIDINetworkSessionClass = interface(NSObjectClass)
  ['{FE05068E-B236-4418-93E8-2F89BA5AC41F}']
{ class } function defaultSession: MIDINetworkSession;
cdecl;
end;
MIDINetworkSession = interface(NSObject)
  ['{469EEE85-0978-4906-886D-C241992DFDB5}']
procedure setEnabled(enabled: Boolean);
cdecl;

function isEnabled: Boolean; cdecl;
  function networkPort: NSUInteger; cdecl;
    function networkName: NSString; cdecl;
      function localName: NSString; cdecl;
        procedure setConnectionPolicy(connectionPolicy
          : MIDINetworkConnectionPolicy); cdecl;
          function connectionPolicy: MIDINetworkConnectionPolicy; cdecl;
            function contacts: NSSet; cdecl;
              function addContact(contact: MIDINetworkHost): Boolean; cdecl;
                function removeContact(contact: MIDINetworkHost)
                  : Boolean; cdecl;
                  function connections: NSSet; cdecl;
                    function addConnection(connection: MIDINetworkConnection)
                      : Boolean; cdecl;
                      function removeConnection
                        (connection: MIDINetworkConnection): Boolean; cdecl;
                        function sourceEndpoint: MIDIEndpointRef; cdecl;
                          function destinationEndpoint: MIDIEndpointRef; cdecl;
                          end;

                      TMIDINetworkSession = class
                        (TOCGenericImport<MIDINetworkSessionClass,
                        MIDINetworkSession>)
                      end;
                  PMIDINetworkSession = Pointer;

                  // ===== Exported string consts =====

                    function kMIDIPropertyName: Pointer;
                      function kMIDIPropertyManufacturer: Pointer;
                        function kMIDIPropertyModel: Pointer;
                          function kMIDIPropertyUniqueID: Pointer;
                            function kMIDIPropertyDeviceID: Pointer;
                              function kMIDIPropertyReceiveChannels: Pointer;
                                function kMIDIPropertyTransmitChannels: Pointer;
                                  function kMIDIPropertyMaxSysExSpeed: Pointer;
                                    function kMIDIPropertyAdvanceScheduleTimeMuSec
                                      : Pointer;
                                      function kMIDIPropertyIsEmbeddedEntity
                                        : Pointer;
                                        function kMIDIPropertyIsBroadcast
                                        : Pointer;
                                        function kMIDIPropertySingleRealtimeEntity
                                        : Pointer;
                                        function kMIDIPropertyConnectionUniqueID
                                        : Pointer;
                                        function kMIDIPropertyOffline: Pointer;
                                        function kMIDIPropertyPrivate: Pointer;
                                        function kMIDIPropertyDriverOwner
                                        : Pointer;
                                        function kMIDIPropertyFactoryPatchNameFile
                                        : Pointer;
                                        function kMIDIPropertyUserPatchNameFile
                                        : Pointer;
                                        function kMIDIPropertyNameConfiguration
                                        : Pointer;
                                        function kMIDIPropertyImage: Pointer;
                                        function kMIDIPropertyDriverVersion
                                        : Pointer;
                                        function kMIDIPropertySupportsGeneralMIDI
                                        : Pointer;
                                        function kMIDIPropertySupportsMMC
                                        : Pointer;
                                        function kMIDIPropertyCanRoute: Pointer;
                                        function kMIDIPropertyReceivesClock
                                        : Pointer;
                                        function kMIDIPropertyReceivesMTC
                                        : Pointer;
                                        function kMIDIPropertyReceivesNotes
                                        : Pointer;
                                        function kMIDIPropertyReceivesProgramChanges
                                        : Pointer;
                                        function kMIDIPropertyReceivesBankSelectMSB
                                        : Pointer;
                                        function kMIDIPropertyReceivesBankSelectLSB
                                        : Pointer;
                                        function kMIDIPropertyTransmitsClock
                                        : Pointer;
                                        function kMIDIPropertyTransmitsMTC
                                        : Pointer;
                                        function kMIDIPropertyTransmitsNotes
                                        : Pointer;
                                        function kMIDIPropertyTransmitsProgramChanges
                                        : Pointer;
                                        function kMIDIPropertyTransmitsBankSelectMSB
                                        : Pointer;
                                        function kMIDIPropertyTransmitsBankSelectLSB
                                        : Pointer;
                                        function kMIDIPropertyPanDisruptsStereo
                                        : Pointer;
                                        function kMIDIPropertyIsSampler
                                        : Pointer;
                                        function kMIDIPropertyIsDrumMachine
                                        : Pointer;
                                        function kMIDIPropertyIsMixer: Pointer;
                                        function kMIDIPropertyIsEffectUnit
                                        : Pointer;
                                        function kMIDIPropertyMaxReceiveChannels
                                        : Pointer;
                                        function kMIDIPropertyMaxTransmitChannels
                                        : Pointer;
                                        function kMIDIPropertyDriverDeviceEditorApp
                                        : Pointer;
                                        function kMIDIPropertySupportsShowControl
                                        : Pointer;
                                        function kMIDIPropertyDisplayName
                                        : Pointer;
                                        function kMIDIDriverPropertyUsesSerial
                                        : Pointer;
                                        function MIDINetworkBonjourServiceType
                                        : NSString;
                                        function MIDINetworkNotificationContactsDidChange
                                        : NSString;
                                        function MIDINetworkNotificationSessionDidChange
                                        : NSString;


                                        // ===== External functions =====

                                        const
                                        libCoreMIDI =
                                        '/System/Library/Frameworks/CoreMIDI.framework/CoreMIDI';
                                        function MIDIClientCreate
                                        (name: CFStringRef;
                                        notifyProc: MIDINotifyProc;
                                        notifyRefCon: Pointer;
                                        outClient: PLongWord): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIClientCreate';
                                        function MIDIClientCreateWithBlock
                                        (name: CFStringRef;
                                        outClient: PLongWord;
                                        notifyBlock: MIDINotifyBlock): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIClientCreateWithBlock';
                                        function MIDIClientDispose
                                        (client: MIDIClientRef): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIClientDispose';
                                        function MIDIInputPortCreate
                                        (client: MIDIClientRef;
                                        portName: CFStringRef;
                                        readProc: MIDIReadProc; refCon: Pointer;
                                        outPort: PLongWord): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIInputPortCreate';
                                        function MIDIInputPortCreateWithBlock
                                        (client: MIDIClientRef;
                                        portName: CFStringRef;
                                        outPort: PLongWord;
                                        readBlock: MIDIReadBlock): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIInputPortCreateWithBlock';
                                        function MIDIOutputPortCreate
                                        (client: MIDIClientRef;
                                        portName: CFStringRef;
                                        outPort: PLongWord): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIOutputPortCreate';
                                        function MIDIPortDispose
                                        (port: MIDIPortRef): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIPortDispose';
                                        function MIDIPortConnectSource
                                        (port: MIDIPortRef;
                                        source: MIDIEndpointRef;
                                        connRefCon: Pointer): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIPortConnectSource';
                                        function MIDIPortDisconnectSource
                                        (port: MIDIPortRef;
                                        source: MIDIEndpointRef): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIPortDisconnectSource';
                                        function MIDIGetNumberOfDevices
                                        : ItemCount; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIGetNumberOfDevices';
                                        function MIDIGetDevice
                                        (deviceIndex0: ItemCount)
                                        : MIDIDeviceRef; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIGetDevice';
                                        function MIDIDeviceGetNumberOfEntities
                                        (device: MIDIDeviceRef): ItemCount;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIDeviceGetNumberOfEntities';
                                        function MIDIDeviceGetEntity
                                        (device: MIDIDeviceRef;
                                        entityIndex0: ItemCount): MIDIEntityRef;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIDeviceGetEntity';
                                        function MIDIEntityGetNumberOfSources
                                        (entity: MIDIEntityRef): ItemCount;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIEntityGetNumberOfSources';
                                        function MIDIEntityGetSource
                                        (entity: MIDIEntityRef;
                                        sourceIndex0: ItemCount)
                                        : MIDIEndpointRef; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIEntityGetSource';
                                        function MIDIEntityGetNumberOfDestinations
                                        (entity: MIDIEntityRef): ItemCount;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIEntityGetNumberOfDestinations';
                                        function MIDIEntityGetDestination
                                        (entity: MIDIEntityRef;
                                        destIndex0: ItemCount): MIDIEndpointRef;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIEntityGetDestination';
                                        function MIDIEntityGetDevice
                                        (inEntity: MIDIEntityRef;
                                        outDevice: PLongWord): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIEntityGetDevice';
                                        function MIDIGetNumberOfSources
                                        : ItemCount; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIGetNumberOfSources';
                                        function MIDIGetSource
                                        (sourceIndex0: ItemCount)
                                        : MIDIEndpointRef; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIGetSource';
                                        function MIDIGetNumberOfDestinations
                                        : ItemCount; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIGetNumberOfDestinations';
                                        function MIDIGetDestination
                                        (destIndex0: ItemCount)
                                        : MIDIEndpointRef; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIGetDestination';
                                        function MIDIEndpointGetEntity
                                        (inEndpoint: MIDIEndpointRef;
                                        outEntity: PLongWord): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIEndpointGetEntity';
                                        function MIDIDestinationCreate
                                        (client: MIDIClientRef;
                                        name: CFStringRef;
                                        readProc: MIDIReadProc; refCon: Pointer;
                                        outDest: PLongWord): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIDestinationCreate';
                                        function MIDIDestinationCreateWithBlock
                                        (client: MIDIClientRef;
                                        name: CFStringRef; outDest: PLongWord;
                                        readBlock: MIDIReadBlock): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIDestinationCreateWithBlock';
                                        function MIDISourceCreate
                                        (client: MIDIClientRef;
                                        name: CFStringRef; outSrc: PLongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDISourceCreate';
                                        function MIDIEndpointDispose
                                        (endpt: MIDIEndpointRef): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIEndpointDispose';
                                        function MIDIGetNumberOfExternalDevices
                                        : ItemCount; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIGetNumberOfExternalDevices';
                                        function MIDIGetExternalDevice
                                        (deviceIndex0: ItemCount)
                                        : MIDIDeviceRef; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIGetExternalDevice';
                                        function MIDIObjectGetIntegerProperty
                                        (obj: MIDIObjectRef;
                                        propertyID: CFStringRef;
                                        outValue: PLongInt): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIObjectGetIntegerProperty';
                                        function MIDIObjectSetIntegerProperty
                                        (obj: MIDIObjectRef;
                                        propertyID: CFStringRef; value: Int32)
                                        : OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIObjectSetIntegerProperty';
                                        function MIDIObjectGetStringProperty
                                        (obj: MIDIObjectRef;
                                        propertyID: CFStringRef; str: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIObjectGetStringProperty';
                                        function MIDIObjectSetStringProperty
                                        (obj: MIDIObjectRef;
                                        propertyID: CFStringRef;
                                        str: CFStringRef): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIObjectSetStringProperty';
                                        function MIDIObjectGetDataProperty
                                        (obj: MIDIObjectRef;
                                        propertyID: CFStringRef;
                                        outData: Pointer): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIObjectGetDataProperty';
                                        function MIDIObjectSetDataProperty
                                        (obj: MIDIObjectRef;
                                        propertyID: CFStringRef;
                                        data: CFDataRef): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIObjectSetDataProperty';
                                        function MIDIObjectGetDictionaryProperty
                                        (obj: MIDIObjectRef;
                                        propertyID: CFStringRef;
                                        outDict: Pointer): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIObjectGetDictionaryProperty';
                                        function MIDIObjectSetDictionaryProperty
                                        (obj: MIDIObjectRef;
                                        propertyID: CFStringRef;
                                        dict: CFDictionaryRef): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIObjectSetDictionaryProperty';
                                        function MIDIObjectGetProperties
                                        (obj: MIDIObjectRef;
                                        outProperties: Pointer; deep: Boolean)
                                        : OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIObjectGetProperties';
                                        function MIDIObjectRemoveProperty
                                        (obj: MIDIObjectRef;
                                        propertyID: CFStringRef): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIObjectRemoveProperty';
                                        function MIDIObjectFindByUniqueID
                                        (inUniqueID: MIDIUniqueID;
                                        outObject: PLongWord;
                                        outObjectType: Int32): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIObjectFindByUniqueID';
                                        function MIDISend(port: MIDIPortRef;
                                        dest: MIDIEndpointRef; pktlist: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDISend';
                                        function MIDISendSysex(request: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDISendSysex';
                                        function MIDIReceived
                                        (src: MIDIEndpointRef; pktlist: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIReceived';
                                        function MIDIFlushOutput
                                        (dest: MIDIEndpointRef): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIFlushOutput';
                                        function MIDIRestart: OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIRestart';
                                        function MIDIPacketNext(pkt: Pointer)
                                        : Pointer; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIPacketNext';
                                        function MIDIPacketListInit
                                        (pktlist: Pointer): Pointer; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIPacketListInit';
                                        function MIDIPacketListAdd
                                        (pktlist: Pointer; listSize: ByteCount;
                                        curPacket: Pointer; time: MIDITimeStamp;
                                        nData: ByteCount; data: PByte): Pointer;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIPacketListAdd';
                                        function MIDISetupCreate
                                        (outSetup: PLongWord): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDISetupCreate';
                                        function MIDISetupDispose
                                        (setup: MIDISetupRef): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDISetupDispose';
                                        function MIDISetupInstall
                                        (setup: MIDISetupRef): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDISetupInstall';
                                        function MIDISetupGetCurrent
                                        (outSetup: PLongWord): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDISetupGetCurrent';
                                        function MIDISetupToData
                                        (setup: MIDISetupRef; outData: Pointer)
                                        : OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDISetupToData';
                                        function MIDISetupFromData
                                        (data: CFDataRef; outSetup: PLongWord)
                                        : OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDISetupFromData';
                                        function MIDIDeviceAddEntity
                                        (device: MIDIDeviceRef;
                                        name: CFStringRef; embedded: Boolean;
                                        numSourceEndpoints: ItemCount;
                                        numDestinationEndpoints: ItemCount;
                                        newEntity: PLongWord): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIDeviceAddEntity';
                                        function MIDIDeviceRemoveEntity
                                        (device: MIDIDeviceRef;
                                        entity: MIDIEntityRef): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIDeviceRemoveEntity';
                                        function MIDIEntityAddOrRemoveEndpoints
                                        (entity: MIDIEntityRef;
                                        numSourceEndpoints: ItemCount;
                                        numDestinationEndpoints: ItemCount)
                                        : OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIEntityAddOrRemoveEndpoints';
                                        function MIDISetupAddDevice
                                        (device: MIDIDeviceRef): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDISetupAddDevice';
                                        function MIDISetupRemoveDevice
                                        (device: MIDIDeviceRef): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDISetupRemoveDevice';
                                        function MIDISetupAddExternalDevice
                                        (device: MIDIDeviceRef): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDISetupAddExternalDevice';
                                        function MIDISetupRemoveExternalDevice
                                        (device: MIDIDeviceRef): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDISetupRemoveExternalDevice';
                                        function MIDIGetSerialPortOwner
                                        (portName: CFStringRef;
                                        outDriverName: Pointer): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIGetSerialPortOwner';
                                        function MIDISetSerialPortOwner
                                        (portName: CFStringRef;
                                        driverName: CFStringRef): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDISetSerialPortOwner';
                                        function MIDIGetSerialPortDrivers
                                        (outDriverNames: Pointer): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIGetSerialPortDrivers';
                                        function MIDIExternalDeviceCreate
                                        (name: CFStringRef;
                                        manufacturer: CFStringRef;
                                        model: CFStringRef;
                                        outDevice: PLongWord): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIExternalDeviceCreate';
                                        function MIDIThruConnectionParamsSize
                                        (ptr: Pointer): LongWord; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIThruConnectionParamsSize';
                                        procedure MIDIThruConnectionParamsInitialize
                                        (inConnectionParams: Pointer); cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIThruConnectionParamsInitialize';
                                        function MIDIThruConnectionCreate
                                        (inPersistentOwnerID: CFStringRef;
                                        inConnectionParams: CFDataRef;
                                        outConnection: PLongWord): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIThruConnectionCreate';
                                        function MIDIThruConnectionDispose
                                        (connection: MIDIThruConnectionRef)
                                        : OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIThruConnectionDispose';
                                        function MIDIThruConnectionGetParams
                                        (connection: MIDIThruConnectionRef;
                                        outConnectionParams: Pointer): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIThruConnectionGetParams';
                                        function MIDIThruConnectionSetParams
                                        (connection: MIDIThruConnectionRef;
                                        inConnectionParams: CFDataRef)
                                        : OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIThruConnectionSetParams';
                                        function MIDIThruConnectionFind
                                        (inPersistentOwnerID: CFStringRef;
                                        outConnectionList: Pointer): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIThruConnectionFind';
                                        function MIDIDeviceCreate
                                        (owner: MIDIDriverRef;
                                        name: CFStringRef;
                                        manufacturer: CFStringRef;
                                        model: CFStringRef;
                                        outDevice: PLongWord): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIDeviceCreate';
                                        function MIDIDeviceDispose
                                        (device: MIDIDeviceRef): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIDeviceDispose';
                                        function MIDIDeviceListGetNumberOfDevices
                                        (devList: MIDIDeviceListRef): ItemCount;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIDeviceListGetNumberOfDevices';
                                        function MIDIDeviceListGetDevice
                                        (devList: MIDIDeviceListRef;
                                        index0: ItemCount): MIDIDeviceRef;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIDeviceListGetDevice';
                                        function MIDIDeviceListAddDevice
                                        (devList: MIDIDeviceListRef;
                                        dev: MIDIDeviceRef): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIDeviceListAddDevice';
                                        function MIDIDeviceListDispose
                                        (devList: MIDIDeviceListRef): OSStatus;
                                        cdecl; external libCoreMIDI name _PU +
                                        'MIDIDeviceListDispose';
                                        function MIDIEndpointSetRefCons
                                        (endpt: MIDIEndpointRef; ref1: Pointer;
                                        ref2: Pointer): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIEndpointSetRefCons';
                                        function MIDIEndpointGetRefCons
                                        (endpt: MIDIEndpointRef; ref1: Pointer;
                                        ref2: Pointer): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIEndpointGetRefCons';
                                        function MIDIGetDriverIORunLoop
                                        : CFRunLoopRef; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIGetDriverIORunLoop';
                                        function MIDIGetDriverDeviceList
                                        (driver: MIDIDriverRef)
                                        : MIDIDeviceListRef; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIGetDriverDeviceList';
                                        function MIDIDriverEnableMonitoring
                                        (driver: MIDIDriverRef;
                                        enabled: Boolean): OSStatus; cdecl;
                                        external libCoreMIDI name _PU +
                                        'MIDIDriverEnableMonitoring';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreMIDIModule: THandle;

{$ENDIF IOS}

function MIDINetworkBonjourServiceType: NSString;
begin
  Result := CocoaNSStringConst(libCoreMIDI, 'MIDINetworkBonjourServiceType');
end;

function MIDINetworkNotificationContactsDidChange: NSString;
begin
  Result := CocoaNSStringConst(libCoreMIDI,
    'MIDINetworkNotificationContactsDidChange');
end;

function MIDINetworkNotificationSessionDidChange: NSString;
begin
  Result := CocoaNSStringConst(libCoreMIDI,
    'MIDINetworkNotificationSessionDidChange');
end;

function kMIDIPropertyName: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyName');
end;

function kMIDIPropertyManufacturer: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyManufacturer');
end;

function kMIDIPropertyModel: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyModel');
end;

function kMIDIPropertyUniqueID: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyUniqueID');
end;

function kMIDIPropertyDeviceID: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyDeviceID');
end;

function kMIDIPropertyReceiveChannels: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyReceiveChannels');
end;

function kMIDIPropertyTransmitChannels: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyTransmitChannels');
end;

function kMIDIPropertyMaxSysExSpeed: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyMaxSysExSpeed');
end;

function kMIDIPropertyAdvanceScheduleTimeMuSec: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI,
    'kMIDIPropertyAdvanceScheduleTimeMuSec');
end;

function kMIDIPropertyIsEmbeddedEntity: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyIsEmbeddedEntity');
end;

function kMIDIPropertyIsBroadcast: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyIsBroadcast');
end;

function kMIDIPropertySingleRealtimeEntity: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertySingleRealtimeEntity');
end;

function kMIDIPropertyConnectionUniqueID: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyConnectionUniqueID');
end;

function kMIDIPropertyOffline: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyOffline');
end;

function kMIDIPropertyPrivate: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyPrivate');
end;

function kMIDIPropertyDriverOwner: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyDriverOwner');
end;

function kMIDIPropertyFactoryPatchNameFile: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyFactoryPatchNameFile');
end;

function kMIDIPropertyUserPatchNameFile: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyUserPatchNameFile');
end;

function kMIDIPropertyNameConfiguration: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyNameConfiguration');
end;

function kMIDIPropertyImage: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyImage');
end;

function kMIDIPropertyDriverVersion: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyDriverVersion');
end;

function kMIDIPropertySupportsGeneralMIDI: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertySupportsGeneralMIDI');
end;

function kMIDIPropertySupportsMMC: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertySupportsMMC');
end;

function kMIDIPropertyCanRoute: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyCanRoute');
end;

function kMIDIPropertyReceivesClock: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyReceivesClock');
end;

function kMIDIPropertyReceivesMTC: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyReceivesMTC');
end;

function kMIDIPropertyReceivesNotes: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyReceivesNotes');
end;

function kMIDIPropertyReceivesProgramChanges: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI,
    'kMIDIPropertyReceivesProgramChanges');
end;

function kMIDIPropertyReceivesBankSelectMSB: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI,
    'kMIDIPropertyReceivesBankSelectMSB');
end;

function kMIDIPropertyReceivesBankSelectLSB: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI,
    'kMIDIPropertyReceivesBankSelectLSB');
end;

function kMIDIPropertyTransmitsClock: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyTransmitsClock');
end;

function kMIDIPropertyTransmitsMTC: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyTransmitsMTC');
end;

function kMIDIPropertyTransmitsNotes: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyTransmitsNotes');
end;

function kMIDIPropertyTransmitsProgramChanges: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI,
    'kMIDIPropertyTransmitsProgramChanges');
end;

function kMIDIPropertyTransmitsBankSelectMSB: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI,
    'kMIDIPropertyTransmitsBankSelectMSB');
end;

function kMIDIPropertyTransmitsBankSelectLSB: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI,
    'kMIDIPropertyTransmitsBankSelectLSB');
end;

function kMIDIPropertyPanDisruptsStereo: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyPanDisruptsStereo');
end;

function kMIDIPropertyIsSampler: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyIsSampler');
end;

function kMIDIPropertyIsDrumMachine: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyIsDrumMachine');
end;

function kMIDIPropertyIsMixer: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyIsMixer');
end;

function kMIDIPropertyIsEffectUnit: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyIsEffectUnit');
end;

function kMIDIPropertyMaxReceiveChannels: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyMaxReceiveChannels');
end;

function kMIDIPropertyMaxTransmitChannels: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyMaxTransmitChannels');
end;

function kMIDIPropertyDriverDeviceEditorApp: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI,
    'kMIDIPropertyDriverDeviceEditorApp');
end;

function kMIDIPropertySupportsShowControl: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertySupportsShowControl');
end;

function kMIDIPropertyDisplayName: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyDisplayName');
end;

function kMIDIDriverPropertyUsesSerial: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIDriverPropertyUsesSerial');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreMIDIModule := dlopen(MarshaledAString(libCoreMIDI), RTLD_LAZY);

finalization

dlclose(CoreMIDIModule);
{$ENDIF IOS}

end.
