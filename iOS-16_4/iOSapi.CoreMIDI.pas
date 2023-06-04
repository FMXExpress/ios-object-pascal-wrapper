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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
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
  kMIDIUnknownError = -10845;
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
  kMIDIProtocol_1_0 = 1;
  kMIDIProtocol_2_0 = 2;
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
  kMIDIMessageTypeUtility = 0;
  kMIDIMessageTypeSystem = 1;
  kMIDIMessageTypeChannelVoice1 = 2;
  kMIDIMessageTypeSysEx = 3;
  kMIDIMessageTypeChannelVoice2 = 4;
  kMIDIMessageTypeData128 = 5;
  kMIDIMessageTypeUnknownF = 15;
  kMIDICVStatusNoteOff = 8;
  kMIDICVStatusNoteOn = 9;
  kMIDICVStatusPolyPressure = 10;
  kMIDICVStatusControlChange = 11;
  kMIDICVStatusProgramChange = 12;
  kMIDICVStatusChannelPressure = 13;
  kMIDICVStatusPitchBend = 14;
  kMIDICVStatusRegisteredPNC = 0;
  kMIDICVStatusAssignablePNC = 1;
  kMIDICVStatusRegisteredControl = 2;
  kMIDICVStatusAssignableControl = 3;
  kMIDICVStatusRelRegisteredControl = 4;
  kMIDICVStatusRelAssignableControl = 5;
  kMIDICVStatusPerNotePitchBend = 6;
  kMIDICVStatusPerNoteMgmt = 15;
  kMIDIStatusStartOfExclusive = 240;
  kMIDIStatusEndOfExclusive = 247;
  kMIDIStatusMTC = 241;
  kMIDIStatusSongPosPointer = 242;
  kMIDIStatusSongSelect = 243;
  kMIDIStatusTuneRequest = 246;
  kMIDIStatusTimingClock = 248;
  kMIDIStatusStart = 250;
  kMIDIStatusContinue = 251;
  kMIDIStatusStop = 252;
  kMIDIStatusActiveSending = 254;
  kMIDIStatusActiveSensing = kMIDIStatusActiveSending;
  kMIDIStatusSystemReset = 255;
  kMIDISysExStatusComplete = 0;
  kMIDISysExStatusStart = 1;
  kMIDISysExStatusContinue = 2;
  kMIDISysExStatusEnd = 3;
  kMIDISysExStatusMixedDataSetHeader = 8;
  kMIDISysExStatusMixedDataSetPayload = 9;
  kMIDIUtilityStatusNOOP = 0;
  kMIDIUtilityStatusJitterReductionClock = 1;
  kMIDIUtilityStatusJitterReductionTimestamp = 2;
  kMIDINoteAttributeNone = 0;
  kMIDINoteAttributeManufacturerSpecific = 1;
  kMIDINoteAttributeProfileSpecific = 2;
  kMIDINoteAttributePitch = 3;
  kMIDIProgramChangeBankValid = 1;
  kMIDIPerNoteManagementReset = 1;
  kMIDIPerNoteManagementDetach = 2;
  MIDINetworkConnectionPolicy_NoOne = 0;
  MIDINetworkConnectionPolicy_HostsInContactList = 1;
  MIDINetworkConnectionPolicy_Anyone = 2;

type

  // ===== Forward declarations =====
{$M+}
  MIDINetworkHost = interface;
  MIDINetworkConnection = interface;
  MIDINetworkSession = interface;
  MIDICISession = interface;
  MIDICIProfile = interface;
  MIDICIProfileState = interface;
  MIDICIResponder = interface;
  MIDICIDiscoveredNode = interface;
  MIDICIDeviceInfo = interface;
  MIDICIDiscoveryManager = interface;
  MIDICIProfileResponderDelegate = interface;

  // ===== Framework typedefs =====
{$M+}
  MIDIObjectRef = UInt32;
  PMIDIObjectRef = ^MIDIObjectRef;
  MIDIClientRef = MIDIObjectRef;
  PMIDIClientRef = ^MIDIClientRef;
  MIDIPortRef = MIDIObjectRef;
  PMIDIPortRef = ^MIDIPortRef;
  MIDIDeviceRef = MIDIObjectRef;
  PMIDIDeviceRef = ^MIDIDeviceRef;
  MIDIEntityRef = MIDIObjectRef;
  PMIDIEntityRef = ^MIDIEntityRef;
  MIDIEndpointRef = MIDIObjectRef;
  PMIDIEndpointRef = ^MIDIEndpointRef;
  MIDITimeStamp = UInt64;
  PMIDITimeStamp = ^MIDITimeStamp;
  MIDIObjectType = Int32;
  MIDIUniqueID = Int32;
  PMIDIUniqueID = ^MIDIUniqueID;
  MIDIProtocolID = Int32;

  MIDIEventPacket = record
    timeStamp: MIDITimeStamp;
    wordCount: UInt32;
    words: array [0 .. 63] of UInt32;
  end;

  PMIDIEventPacket = ^MIDIEventPacket;

  MIDIEventList = record
    protocol: MIDIProtocolID;
    numPackets: UInt32;
    packet: array [0 .. 0] of MIDIEventPacket;
  end;

  PMIDIEventList = ^MIDIEventList;

  MIDIPacket = record
    timeStamp: MIDITimeStamp;
    length: UInt16;
    data: array [0 .. 255] of Byte;
  end;

  PMIDIPacket = ^MIDIPacket;

  MIDIPacketList = record
    numPackets: UInt32;
    packet: array [0 .. 0] of MIDIPacket;
  end;

  PMIDIPacketList = ^MIDIPacketList;

  Boolean = Byte;
  PBoolean = ^Boolean;

  MIDICompletionProc = procedure(param1: Pointer); cdecl;
  PMIDICompletionProc = ^MIDICompletionProc;

  MIDISysexSendRequest = record
    destination: MIDIEndpointRef;
    data: PByte;
    bytesToSend: UInt32;
    complete: Boolean;
    reserved: array [0 .. 2] of Byte;
    completionProc: MIDICompletionProc;
    completionRefCon: Pointer;
  end;

  PMIDISysexSendRequest = ^MIDISysexSendRequest;

  MIDINotificationMessageID = Int32;

  MIDINotification = record
    messageID: MIDINotificationMessageID;
    messageSize: UInt32;
  end;

  PMIDINotification = ^MIDINotification;

  MIDINotifyProc = procedure(param1: PMIDINotification; param2: Pointer); cdecl;
  PMIDINotifyProc = ^MIDINotifyProc;
  MIDINotifyBlock = procedure(param1: PMIDINotification) of object;
  MIDIReceiveBlock = procedure(param1: PMIDIEventList; param2: Pointer)
    of object;
  MIDIReadProc = procedure(param1: PMIDIPacketList; param2: Pointer;
    param3: Pointer); cdecl;
  PMIDIReadProc = ^MIDIReadProc;
  MIDIReadBlock = procedure(param1: PMIDIPacketList; param2: Pointer) of object;

  MIDIObjectAddRemoveNotification = record
    messageID: MIDINotificationMessageID;
    messageSize: UInt32;
    parent: MIDIObjectRef;
    parentType: MIDIObjectType;
    child: MIDIObjectRef;
    childType: MIDIObjectType;
  end;

  PMIDIObjectAddRemoveNotification = ^MIDIObjectAddRemoveNotification;

  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;

  MIDIObjectPropertyChangeNotification = record
    messageID: MIDINotificationMessageID;
    messageSize: UInt32;
    &object: MIDIObjectRef;
    objectType: MIDIObjectType;
    propertyName: CFStringRef;
  end;

  PMIDIObjectPropertyChangeNotification = ^MIDIObjectPropertyChangeNotification;

  OSStatus = Int32;
  POSStatus = ^OSStatus;

  MIDIIOErrorNotification = record
    messageID: MIDINotificationMessageID;
    messageSize: UInt32;
    driverDevice: MIDIDeviceRef;
    errorCode: OSStatus;
  end;

  PMIDIIOErrorNotification = ^MIDIIOErrorNotification;

  ItemCount = LongWord;
  PItemCount = ^ItemCount;

  CFDataRef = Pointer;
  PCFDataRef = ^CFDataRef;
  CFDictionaryRef = Pointer;
  PCFDictionaryRef = ^CFDictionaryRef;
  ByteCount = LongWord;
  PByteCount = ^ByteCount;

  MIDISetupRef = MIDIObjectRef;
  PMIDISetupRef = ^MIDISetupRef;
  MIDIThruConnectionRef = MIDIObjectRef;
  PMIDIThruConnectionRef = ^MIDIThruConnectionRef;

  MIDIValueMap = record
    value: array [0 .. 127] of Byte;
  end;

  PMIDIValueMap = ^MIDIValueMap;

  MIDITransformType = UInt16;
  MIDITransformControlType = Byte;

  MIDITransform = record
    transform: MIDITransformType;
    param: Int16;
  end;

  PMIDITransform = ^MIDITransform;

  MIDIControlTransform = record
    controlType: MIDITransformControlType;
    remappedControlType: MIDITransformControlType;
    controlNumber: UInt16;
    transform: MIDITransformType;
    param: Int16;
  end;

  PMIDIControlTransform = ^MIDIControlTransform;

  MIDIThruConnectionEndpoint = record
    endpointRef: MIDIEndpointRef;
    uniqueID: MIDIUniqueID;
  end;

  PMIDIThruConnectionEndpoint = ^MIDIThruConnectionEndpoint;

  MIDIThruConnectionParams = record
    version: UInt32;
    numSources: UInt32;
    sources: array [0 .. 7] of MIDIThruConnectionEndpoint;
    numDestinations: UInt32;
    destinations: array [0 .. 7] of MIDIThruConnectionEndpoint;
    channelMap: array [0 .. 15] of Byte;
    lowVelocity: Byte;
    highVelocity: Byte;
    lowNote: Byte;
    highNote: Byte;
    noteNumber: MIDITransform;
    velocity: MIDITransform;
    keyPressure: MIDITransform;
    channelPressure: MIDITransform;
    programChange: MIDITransform;
    pitchBend: MIDITransform;
    filterOutSysEx: Byte;
    filterOutMTC: Byte;
    filterOutBeatClock: Byte;
    filterOutTuneRequest: Byte;
    reserved2: array [0 .. 2] of Byte;
    filterOutAllControls: Byte;
    numControlTransforms: UInt16;
    numMaps: UInt16;
    reserved3: array [0 .. 3] of UInt16;
  end;

  PMIDIThruConnectionParams = ^MIDIThruConnectionParams;

  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

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

  REFIID = CFUUIDBytes;

  HRESULT = Int32;
  PHRESULT = ^HRESULT;
  TCoreMIDIQueryInterface = function(param1: Pointer; param2: REFIID;
    param3: Pointer): HRESULT; cdecl;
  ULONG = UInt32;
  PULONG = ^ULONG;
  TCoreMIDIAddRef = function(param1: Pointer): ULONG; cdecl;
  MIDIDriverRef = Pointer;
  PMIDIDriverRef = ^MIDIDriverRef;
  MIDIDeviceListRef = MIDIObjectRef;
  PMIDIDeviceListRef = ^MIDIDeviceListRef;
  TCoreMIDIFindDevices = function(param1: MIDIDriverRef;
    param2: MIDIDeviceListRef): OSStatus; cdecl;
  TCoreMIDIStop = function(param1: MIDIDriverRef): OSStatus; cdecl;
  TCoreMIDIConfigure = function(param1: MIDIDriverRef; param2: MIDIDeviceRef)
    : OSStatus; cdecl;
  TCoreMIDISend = function(param1: MIDIDriverRef; param2: PMIDIPacketList;
    param3: Pointer; param4: Pointer): OSStatus; cdecl;
  TCoreMIDIEnableSource = function(param1: MIDIDriverRef;
    param2: MIDIEndpointRef; param3: Boolean): OSStatus; cdecl;
  TCoreMIDIFlush = function(param1: MIDIDriverRef; param2: MIDIEndpointRef;
    param3: Pointer; param4: Pointer): OSStatus; cdecl;
  TCoreMIDIMonitor = function(param1: MIDIDriverRef; param2: MIDIEndpointRef;
    param3: PMIDIPacketList): OSStatus; cdecl;
  TCoreMIDISendPackets = function(param1: MIDIDriverRef; param2: PMIDIEventList;
    param3: Pointer; param4: Pointer): OSStatus; cdecl;
  TCoreMIDIMonitorEvents = function(param1: MIDIDriverRef;
    param2: MIDIEndpointRef; param3: PMIDIEventList): OSStatus; cdecl;

  MIDIDriverInterface = record
    _reserved: Pointer;
    QueryInterface: TCoreMIDIQueryInterface;
    AddRef: TCoreMIDIAddRef;
    Release: TCoreMIDIAddRef;
    FindDevices: TCoreMIDIFindDevices;
    Start: TCoreMIDIFindDevices;
    Stop: TCoreMIDIStop;
    Configure: TCoreMIDIConfigure;
    Send: TCoreMIDISend;
    EnableSource: TCoreMIDIEnableSource;
    Flush: TCoreMIDIFlush;
    Monitor: TCoreMIDIMonitor;
    SendPackets: TCoreMIDISendPackets;
    MonitorEvents: TCoreMIDIMonitorEvents;
  end;

  PMIDIDriverInterface = ^MIDIDriverInterface;

  CFRunLoopRef = Pointer;
  PCFRunLoopRef = ^CFRunLoopRef;
  MIDIMessageType = Cardinal;
  MIDICVStatus = Cardinal;
  MIDISystemStatus = Cardinal;
  MIDISysExStatus = Cardinal;
  MIDIUtilityStatus = Cardinal;
  MIDINoteAttribute = Byte;
  MIDIProgramChangeOptions = Byte;
  MIDIPerNoteManagementOptions = Byte;
  MIDIMessage_32 = UInt32;
  PMIDIMessage_32 = ^MIDIMessage_32;

  MIDIMessage_64 = record
    word0: UInt32;
    word1: UInt32;
  end;

  PMIDIMessage_64 = ^MIDIMessage_64;

  MIDIMessage_96 = record
    word0: UInt32;
    word1: UInt32;
    word2: UInt32;
  end;

  PMIDIMessage_96 = ^MIDIMessage_96;

  MIDIMessage_128 = record
    word0: UInt32;
    word1: UInt32;
    word2: UInt32;
    word3: UInt32;
  end;

  PMIDIMessage_128 = ^MIDIMessage_128;

  MIDIUniversalMessage = record
    &type: MIDIMessageType;
    group: Byte;
    reserved: array [0 .. 2] of Byte;
    case Integer of
      0:
        (status: MIDIUtilityStatus;
          case Integer of
            0: (jitterReductionClock: UInt16);
            1: (jitterReductionTimestamp: UInt16);

          );
      1:
        (status: MIDISystemStatus;
          case Integer of
            0: (timeCode: Byte);
            1: (songPositionPointer: UInt16);
            2: (songSelect: Byte);

          );
      2:
        (status: MIDICVStatus;
          channel: Byte;
          reserved: array [0 .. 2] of Byte;
          case Integer of
            0: (number: Byte; velocity: Byte;);
            1: (noteNumber: Byte; pressure: Byte;);
            2: (index: Byte; data: Byte;);
            3: (&program: Byte);
            4: (channelPressure: Byte);
            5: (pitchBend: UInt16);

          );
      3:
        (status: MIDISysExStatus;
          channel: Byte;
          data: array [0 .. 5] of Byte;
          reserved: Byte;
        );
      4:
        (status: MIDICVStatus;
          channel: Byte;
          reserved: array [0 .. 2] of Byte;
          case Integer of
            0: (number: Byte; attributeType: MIDINoteAttribute;
              velocity: UInt16; attribute: UInt16;);
            1: (noteNumber: Byte; reserved: Byte; pressure: UInt32;);
            2: (index: Byte; reserved: Byte; data: UInt32;);
            3: (options: MIDIProgramChangeOptions; &program: Byte;
              reserved: array [0 .. 1] of Byte; bank: UInt16;);
            4: (data: UInt32; reserved: array [0 .. 1] of Byte;);
            5: (data: UInt32; reserved: array [0 .. 1] of Byte;);
            6: (noteNumber: Byte; index: Byte; data: UInt32;);
            7: (bank: Byte; index: Byte; data: UInt32;);
            8: (noteNumber: Byte; reserved: Byte; bend: UInt32;);
            9: (note: Byte; options: MIDIPerNoteManagementOptions;
              reserved: array [0 .. 3] of Byte;);

          );
      5:
        (status: MIDISysExStatus;
          case Integer of
            0: (ByteCount: Byte; streamID: Byte; data: array [0 .. 12] of Byte;
              reserved: Byte;);
            1: (mdsID: Byte; data: array [0 .. 13] of Byte; reserved: Byte;);

          );
      6:
        (words: array [0 .. 3] of UInt32;
        );

  end;

  PMIDIUniversalMessage = ^MIDIUniversalMessage;

  MIDIEventVisitor = procedure(param1: Pointer; param2: MIDITimeStamp;
    param3: MIDIUniversalMessage); cdecl;
  PMIDIEventVisitor = ^MIDIEventVisitor;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  MIDINetworkConnectionPolicy = NSUInteger;
  MIDIChannelNumber = Byte;
  PMIDIChannelNumber = ^MIDIChannelNumber;

  MIDICIDeviceIdentification = record
    manufacturer: array [0 .. 2] of Byte;
    family: array [0 .. 1] of Byte;
    modelNumber: array [0 .. 1] of Byte;
    revisionLevel: array [0 .. 3] of Byte;
    reserved: array [0 .. 4] of Byte;
  end;

  PMIDICIDeviceIdentification = ^MIDICIDeviceIdentification;

  MIDICIInitiatiorMUID = NSNumber;
  PMIDICIInitiatiorMUID = ^MIDICIInitiatiorMUID;
  MIDICIProfileStateList = NSArray;
  PMIDICIProfileStateList = ^MIDICIProfileStateList;
  MIDICIProfileChangedBlock = procedure(param1: MIDICISession;
    param2: MIDIChannelNumber; param3: MIDICIProfile; param4: Boolean)
    of object;
  MIDICISessionDisconnectBlock = procedure(param1: MIDICISession;
    param2: NSError) of object;
  MIDICIProfileSpecificDataBlock = procedure(param1: MIDICISession;
    param2: MIDIChannelNumber; param3: MIDICIProfile; param4: NSData) of object;
  MIDICIDiscoveryResponseBlock = procedure(param1: NSArray) of object;
  TCoreMIDIDataReadyHandler = procedure() of object;
  // ===== Interface declarations =====

  MIDINetworkHostClass = interface(NSObjectClass)
    ['{499FAC16-3D4B-4E68-9C2F-D8C02CABC6C7}']
    [MethodName('hostWithName:address:port:')]
    { class } function hostWithNameAddressPort(name: NSString;
      address: NSString; port: NSUInteger): Pointer { instancetype }; cdecl;
    [MethodName('hostWithName:netService:')]
    { class } function hostWithNameNetService(name: NSString;
      netService: NSNetService): Pointer { instancetype }; cdecl;
    [MethodName('hostWithName:netServiceName:netServiceDomain:')]
    { class } function hostWithNameNetServiceNameNetServiceDomain
      (name: NSString; netServiceName: NSString; netServiceDomain: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  MIDINetworkHost = interface(NSObject)
    ['{141A5667-3C77-4FFE-AED3-F46C53DD02A2}']
    function hasSameAddressAs(other: MIDINetworkHost): Boolean; cdecl;
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
    ['{AF7EA050-5279-43A8-9B40-78FB057393C7}']
    { class } function connectionWithHost(host: MIDINetworkHost)
      : Pointer { instancetype }; cdecl;
  end;

  MIDINetworkConnection = interface(NSObject)
    ['{B8503F66-DA55-4F4F-AF1B-47909836AD76}']
    function host: MIDINetworkHost; cdecl;
  end;

  TMIDINetworkConnection = class(TOCGenericImport<MIDINetworkConnectionClass,
    MIDINetworkConnection>)
  end;

  PMIDINetworkConnection = Pointer;

  MIDINetworkSessionClass = interface(NSObjectClass)
    ['{EF0DF717-9130-4D8F-BE87-E43914914E6F}']
    { class } function defaultSession: MIDINetworkSession; cdecl;
  end;

  MIDINetworkSession = interface(NSObject)
    ['{707194AA-0910-47F8-B1BA-1CE4A8A45CD3}']
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    function networkPort: NSUInteger; cdecl;
    function networkName: NSString; cdecl;
    function localName: NSString; cdecl;
    procedure setConnectionPolicy(connectionPolicy
      : MIDINetworkConnectionPolicy); cdecl;
    function connectionPolicy: MIDINetworkConnectionPolicy; cdecl;
    function contacts: NSSet; cdecl;
    function addContact(contact: MIDINetworkHost): Boolean; cdecl;
    function removeContact(contact: MIDINetworkHost): Boolean; cdecl;
    function connections: NSSet; cdecl;
    function addConnection(connection: MIDINetworkConnection): Boolean; cdecl;
    function removeConnection(connection: MIDINetworkConnection)
      : Boolean; cdecl;
    function sourceEndpoint: MIDIEndpointRef; cdecl;
    function destinationEndpoint: MIDIEndpointRef; cdecl;
  end;

  TMIDINetworkSession = class(TOCGenericImport<MIDINetworkSessionClass,
    MIDINetworkSession>)
  end;

  PMIDINetworkSession = Pointer;

  MIDICISessionClass = interface(NSObjectClass)
    ['{21FF057E-182D-4020-A0A5-0475DCF733E7}']
  end;

  MIDICISession = interface(NSObject)
    ['{5CF47901-0DA5-4315-898D-26EC7D3E7268}']
    function initWithDiscoveredNode(discoveredNode: MIDICIDiscoveredNode;
      dataReadyHandler: TCoreMIDIDataReadyHandler;
      disconnectHandler: MIDICISessionDisconnectBlock)
      : Pointer { instancetype }; cdecl;
    function midiDestination: MIDIEntityRef; cdecl;
    function supportsProfileCapability: Boolean; cdecl;
    function supportsPropertyCapability: Boolean; cdecl;
    function deviceInfo: MIDICIDeviceInfo; cdecl;
    function maxSysExSize: NSNumber; cdecl;
    function maxPropertyRequests: NSNumber; cdecl;
    function profileStateForChannel(channel: MIDIChannelNumber)
      : MIDICIProfileState; cdecl;
    function enableProfile(profile: MIDICIProfile; onChannel: MIDIChannelNumber;
      error: NSError): Boolean; cdecl;
    function disableProfile(profile: MIDICIProfile;
      onChannel: MIDIChannelNumber; error: NSError): Boolean; cdecl;
    function sendProfile(profile: MIDICIProfile; onChannel: MIDIChannelNumber;
      profileData: NSData): Boolean; cdecl;
    procedure setProfileChangedCallback(profileChangedCallback
      : MIDICIProfileChangedBlock); cdecl;
    function profileChangedCallback: MIDICIProfileChangedBlock; cdecl;
    procedure setProfileSpecificDataHandler(profileSpecificDataHandler
      : MIDICIProfileSpecificDataBlock); cdecl;
    function profileSpecificDataHandler: MIDICIProfileSpecificDataBlock; cdecl;
  end;

  TMIDICISession = class(TOCGenericImport<MIDICISessionClass, MIDICISession>)
  end;

  PMIDICISession = Pointer;

  MIDICIProfileClass = interface(NSObjectClass)
    ['{136C80DB-DC29-4B59-AFBD-7AA6CE396A98}']
  end;

  MIDICIProfile = interface(NSObject)
    ['{7141A401-3D9F-4CEB-81AD-17D9DDBF10CB}']
    function name: NSString; cdecl;
    function profileID: NSData; cdecl;
    [MethodName('initWithData:')]
    function initWithData(data: NSData): Pointer { instancetype }; cdecl;
    [MethodName('initWithData:name:')]
    function initWithDataName(data: NSData; name: NSString)
      : Pointer { instancetype }; cdecl;
  end;

  TMIDICIProfile = class(TOCGenericImport<MIDICIProfileClass, MIDICIProfile>)
  end;

  PMIDICIProfile = Pointer;

  MIDICIProfileStateClass = interface(NSObjectClass)
    ['{B582C31C-D08B-4FAA-A514-EFB2205CA5D2}']
  end;

  MIDICIProfileState = interface(NSObject)
    ['{F0384C35-8240-40F5-B73B-72FF6F7536B3}']
    function midiChannel: MIDIChannelNumber; cdecl;
    function enabledProfiles: NSArray; cdecl;
    function disabledProfiles: NSArray; cdecl;
    function initWithChannel(midiChannelNum: MIDIChannelNumber;
      enabledProfiles: NSArray; disabledProfiles: NSArray)
      : Pointer { instancetype }; cdecl;
    function initWithEnabledProfiles(enabled: NSArray;
      disabledProfiles: NSArray): Pointer { instancetype }; cdecl;
  end;

  TMIDICIProfileState = class(TOCGenericImport<MIDICIProfileStateClass,
    MIDICIProfileState>)
  end;

  PMIDICIProfileState = Pointer;

  MIDICIResponderClass = interface(NSObjectClass)
    ['{D39CB37E-9A4D-445C-AA09-82EF97367853}']
  end;

  MIDICIResponder = interface(NSObject)
    ['{9AE92F12-54D0-4B6A-A350-15CE972B2952}']
    function initiators: NSArray; cdecl;
    function profileDelegate: Pointer; cdecl;
    function deviceInfo: MIDICIDeviceInfo; cdecl;
    function initWithDeviceInfo(deviceInfo: MIDICIDeviceInfo;
      profileDelegate: Pointer; profileStates: MIDICIProfileStateList;
      supportProperties: Boolean): Pointer { instancetype }; cdecl;
    function notifyProfile(aProfile: MIDICIProfile;
      onChannel: MIDIChannelNumber; isEnabled: Boolean): Boolean; cdecl;
    function sendProfile(aProfile: MIDICIProfile; onChannel: MIDIChannelNumber;
      profileData: NSData): Boolean; cdecl;
    function Start: Boolean; cdecl;
    procedure Stop; cdecl;
  end;

  TMIDICIResponder = class(TOCGenericImport<MIDICIResponderClass,
    MIDICIResponder>)
  end;

  PMIDICIResponder = Pointer;

  MIDICIDiscoveredNodeClass = interface(NSObjectClass)
    ['{70777160-215A-48E7-A696-8118661376A0}']
  end;

  MIDICIDiscoveredNode = interface(NSObject)
    ['{BD624F0B-2CAC-4097-894E-A1FE82FFCFFC}']
    function destination: MIDIEntityRef; cdecl;
    function deviceInfo: MIDICIDeviceInfo; cdecl;
    function supportsProfiles: Boolean; cdecl;
    function supportsProperties: Boolean; cdecl;
    function maximumSysExSize: NSNumber; cdecl;
  end;

  TMIDICIDiscoveredNode = class(TOCGenericImport<MIDICIDiscoveredNodeClass,
    MIDICIDiscoveredNode>)
  end;

  PMIDICIDiscoveredNode = Pointer;

  MIDICIDeviceInfoClass = interface(NSObjectClass)
    ['{9EB3DC4C-8DCF-4127-B3E6-92654C498033}']
  end;

  MIDICIDeviceInfo = interface(NSObject)
    ['{E1BA512C-D762-4129-BA2B-A4F18ED92357}']
    function manufacturerID: NSData; cdecl;
    function family: NSData; cdecl;
    function modelNumber: NSData; cdecl;
    function revisionLevel: NSData; cdecl;
    function midiDestination: MIDIEndpointRef; cdecl;
    function initWithDestination(midiDestination: MIDIEntityRef;
      manufacturer: NSData; family: NSData; model: NSData; revision: NSData)
      : Pointer { instancetype }; cdecl;
  end;

  TMIDICIDeviceInfo = class(TOCGenericImport<MIDICIDeviceInfoClass,
    MIDICIDeviceInfo>)
  end;

  PMIDICIDeviceInfo = Pointer;

  MIDICIDiscoveryManagerClass = interface(NSObjectClass)
    ['{58AAEEAB-C2B4-4C25-B588-2BE92686BA96}']
    { class } function sharedInstance: MIDICIDiscoveryManager; cdecl;
  end;

  MIDICIDiscoveryManager = interface(NSObject)
    ['{EDEED7CB-5DBA-4511-9ECC-1C6EAB75638D}']
    procedure discoverWithHandler(completedHandler
      : MIDICIDiscoveryResponseBlock); cdecl;
  end;

  TMIDICIDiscoveryManager = class(TOCGenericImport<MIDICIDiscoveryManagerClass,
    MIDICIDiscoveryManager>)
  end;

  PMIDICIDiscoveryManager = Pointer;

  // ===== Protocol declarations =====

  MIDICIProfileResponderDelegate = interface(IObjectiveC)
    ['{ADAE5625-EDF3-4849-81DA-8B94FD049C60}']
    function connectInitiator(initiatorMUID: MIDICIInitiatiorMUID;
      withDeviceInfo: MIDICIDeviceInfo): Boolean; cdecl;
    procedure initiatorDisconnected(initiatorMUID: MIDICIInitiatiorMUID); cdecl;
    function willSetProfile(aProfile: MIDICIProfile;
      onChannel: MIDIChannelNumber; enabled: Boolean): Boolean; cdecl;
    procedure handleDataForProfile(aProfile: MIDICIProfile;
      onChannel: MIDIChannelNumber; data: NSData); cdecl;
  end;

  // ===== Exported string consts =====

function kMIDIPropertyName: Pointer;
function kMIDIPropertyManufacturer: Pointer;
function kMIDIPropertyModel: Pointer;
function kMIDIPropertyUniqueID: Pointer;
function kMIDIPropertyDeviceID: Pointer;
function kMIDIPropertyReceiveChannels: Pointer;
function kMIDIPropertyTransmitChannels: Pointer;
function kMIDIPropertyMaxSysExSpeed: Pointer;
function kMIDIPropertyAdvanceScheduleTimeMuSec: Pointer;
function kMIDIPropertyIsEmbeddedEntity: Pointer;
function kMIDIPropertyIsBroadcast: Pointer;
function kMIDIPropertySingleRealtimeEntity: Pointer;
function kMIDIPropertyConnectionUniqueID: Pointer;
function kMIDIPropertyOffline: Pointer;
function kMIDIPropertyPrivate: Pointer;
function kMIDIPropertyDriverOwner: Pointer;
function kMIDIPropertyFactoryPatchNameFile: Pointer;
function kMIDIPropertyUserPatchNameFile: Pointer;
function kMIDIPropertyNameConfiguration: Pointer;
function kMIDIPropertyNameConfigurationDictionary: Pointer;
function kMIDIPropertyImage: Pointer;
function kMIDIPropertyDriverVersion: Pointer;
function kMIDIPropertySupportsGeneralMIDI: Pointer;
function kMIDIPropertySupportsMMC: Pointer;
function kMIDIPropertyCanRoute: Pointer;
function kMIDIPropertyReceivesClock: Pointer;
function kMIDIPropertyReceivesMTC: Pointer;
function kMIDIPropertyReceivesNotes: Pointer;
function kMIDIPropertyReceivesProgramChanges: Pointer;
function kMIDIPropertyReceivesBankSelectMSB: Pointer;
function kMIDIPropertyReceivesBankSelectLSB: Pointer;
function kMIDIPropertyTransmitsClock: Pointer;
function kMIDIPropertyTransmitsMTC: Pointer;
function kMIDIPropertyTransmitsNotes: Pointer;
function kMIDIPropertyTransmitsProgramChanges: Pointer;
function kMIDIPropertyTransmitsBankSelectMSB: Pointer;
function kMIDIPropertyTransmitsBankSelectLSB: Pointer;
function kMIDIPropertyPanDisruptsStereo: Pointer;
function kMIDIPropertyIsSampler: Pointer;
function kMIDIPropertyIsDrumMachine: Pointer;
function kMIDIPropertyIsMixer: Pointer;
function kMIDIPropertyIsEffectUnit: Pointer;
function kMIDIPropertyMaxReceiveChannels: Pointer;
function kMIDIPropertyMaxTransmitChannels: Pointer;
function kMIDIPropertyDriverDeviceEditorApp: Pointer;
function kMIDIPropertySupportsShowControl: Pointer;
function kMIDIPropertyDisplayName: Pointer;
function kMIDIPropertyProtocolID: Pointer;
function kMIDIDriverPropertyUsesSerial: Pointer;
function MIDINetworkBonjourServiceType: NSString;
function MIDINetworkNotificationContactsDidChange: NSString;
function MIDINetworkNotificationSessionDidChange: NSString;


// ===== External functions =====

const
  libCoreMIDI = '/System/Library/Frameworks/CoreMIDI.framework/CoreMIDI';
function MIDIClientCreate(name: CFStringRef; notifyProc: MIDINotifyProc;
  notifyRefCon: Pointer; outClient: PMIDIClientRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIClientCreate';
function MIDIClientCreateWithBlock(name: CFStringRef; outClient: PMIDIClientRef;
  notifyBlock: MIDINotifyBlock): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIClientCreateWithBlock';
function MIDIClientDispose(client: MIDIClientRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIClientDispose';
function MIDIInputPortCreateWithProtocol(client: MIDIClientRef;
  portName: CFStringRef; protocol: MIDIProtocolID; outPort: PMIDIPortRef;
  receiveBlock: MIDIReceiveBlock): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIInputPortCreateWithProtocol';
function MIDIInputPortCreate(client: MIDIClientRef; portName: CFStringRef;
  readProc: MIDIReadProc; refCon: Pointer; outPort: PMIDIPortRef): OSStatus;
  cdecl; external libCoreMIDI name _PU + 'MIDIInputPortCreate';
function MIDIInputPortCreateWithBlock(client: MIDIClientRef;
  portName: CFStringRef; outPort: PMIDIPortRef; readBlock: MIDIReadBlock)
  : OSStatus; cdecl; external libCoreMIDI name _PU +
  'MIDIInputPortCreateWithBlock';
function MIDIOutputPortCreate(client: MIDIClientRef; portName: CFStringRef;
  outPort: PMIDIPortRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIOutputPortCreate';
function MIDIPortDispose(port: MIDIPortRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIPortDispose';
function MIDIPortConnectSource(port: MIDIPortRef; source: MIDIEndpointRef;
  connRefCon: Pointer): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIPortConnectSource';
function MIDIPortDisconnectSource(port: MIDIPortRef; source: MIDIEndpointRef)
  : OSStatus; cdecl; external libCoreMIDI name _PU + 'MIDIPortDisconnectSource';
function MIDIGetNumberOfDevices: ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetNumberOfDevices';
function MIDIGetDevice(deviceIndex0: ItemCount): MIDIDeviceRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetDevice';
function MIDIDeviceGetNumberOfEntities(device: MIDIDeviceRef): ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceGetNumberOfEntities';
function MIDIDeviceGetEntity(device: MIDIDeviceRef; entityIndex0: ItemCount)
  : MIDIEntityRef; cdecl; external libCoreMIDI name _PU + 'MIDIDeviceGetEntity';
function MIDIEntityGetNumberOfSources(entity: MIDIEntityRef): ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIEntityGetNumberOfSources';
function MIDIEntityGetSource(entity: MIDIEntityRef; sourceIndex0: ItemCount)
  : MIDIEndpointRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIEntityGetSource';
function MIDIEntityGetNumberOfDestinations(entity: MIDIEntityRef): ItemCount;
  cdecl; external libCoreMIDI name _PU + 'MIDIEntityGetNumberOfDestinations';
function MIDIEntityGetDestination(entity: MIDIEntityRef; destIndex0: ItemCount)
  : MIDIEndpointRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIEntityGetDestination';
function MIDIEntityGetDevice(inEntity: MIDIEntityRef; outDevice: PMIDIDeviceRef)
  : OSStatus; cdecl; external libCoreMIDI name _PU + 'MIDIEntityGetDevice';
function MIDIGetNumberOfSources: ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetNumberOfSources';
function MIDIGetSource(sourceIndex0: ItemCount): MIDIEndpointRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetSource';
function MIDIGetNumberOfDestinations: ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetNumberOfDestinations';
function MIDIGetDestination(destIndex0: ItemCount): MIDIEndpointRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetDestination';
function MIDIEndpointGetEntity(inEndpoint: MIDIEndpointRef;
  outEntity: PMIDIEntityRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIEndpointGetEntity';
function MIDIDestinationCreateWithProtocol(client: MIDIClientRef;
  name: CFStringRef; protocol: MIDIProtocolID; outDest: PMIDIEndpointRef;
  readBlock: MIDIReceiveBlock): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIDestinationCreateWithProtocol';
function MIDIDestinationCreate(client: MIDIClientRef; name: CFStringRef;
  readProc: MIDIReadProc; refCon: Pointer; outDest: PMIDIEndpointRef): OSStatus;
  cdecl; external libCoreMIDI name _PU + 'MIDIDestinationCreate';
function MIDIDestinationCreateWithBlock(client: MIDIClientRef;
  name: CFStringRef; outDest: PMIDIEndpointRef; readBlock: MIDIReadBlock)
  : OSStatus; cdecl; external libCoreMIDI name _PU +
  'MIDIDestinationCreateWithBlock';
function MIDISourceCreateWithProtocol(client: MIDIClientRef; name: CFStringRef;
  protocol: MIDIProtocolID; outSrc: PMIDIEndpointRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISourceCreateWithProtocol';
function MIDISourceCreate(client: MIDIClientRef; name: CFStringRef;
  outSrc: PMIDIEndpointRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISourceCreate';
function MIDIEndpointDispose(endpt: MIDIEndpointRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIEndpointDispose';
function MIDIGetNumberOfExternalDevices: ItemCount; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetNumberOfExternalDevices';
function MIDIGetExternalDevice(deviceIndex0: ItemCount): MIDIDeviceRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetExternalDevice';
function MIDIObjectGetIntegerProperty(obj: MIDIObjectRef;
  propertyID: CFStringRef; outValue: PLongInt): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectGetIntegerProperty';
function MIDIObjectSetIntegerProperty(obj: MIDIObjectRef;
  propertyID: CFStringRef; value: Int32): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectSetIntegerProperty';
function MIDIObjectGetStringProperty(obj: MIDIObjectRef;
  propertyID: CFStringRef; str: PCFStringRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectGetStringProperty';
function MIDIObjectSetStringProperty(obj: MIDIObjectRef;
  propertyID: CFStringRef; str: CFStringRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectSetStringProperty';
function MIDIObjectGetDataProperty(obj: MIDIObjectRef; propertyID: CFStringRef;
  outData: Pointer): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectGetDataProperty';
function MIDIObjectSetDataProperty(obj: MIDIObjectRef; propertyID: CFStringRef;
  data: CFDataRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectSetDataProperty';
function MIDIObjectGetDictionaryProperty(obj: MIDIObjectRef;
  propertyID: CFStringRef; outDict: Pointer): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectGetDictionaryProperty';
function MIDIObjectSetDictionaryProperty(obj: MIDIObjectRef;
  propertyID: CFStringRef; dict: CFDictionaryRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectSetDictionaryProperty';
function MIDIObjectGetProperties(obj: MIDIObjectRef; outProperties: Pointer;
  deep: Boolean): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectGetProperties';
function MIDIObjectRemoveProperty(obj: MIDIObjectRef; propertyID: CFStringRef)
  : OSStatus; cdecl; external libCoreMIDI name _PU + 'MIDIObjectRemoveProperty';
function MIDIObjectFindByUniqueID(inUniqueID: MIDIUniqueID;
  outObject: PMIDIObjectRef; outObjectType: PMIDIObjectType): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIObjectFindByUniqueID';
function MIDISendEventList(port: MIDIPortRef; dest: MIDIEndpointRef;
  evtlist: PMIDIEventList): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISendEventList';
function MIDISend(port: MIDIPortRef; dest: MIDIEndpointRef;
  pktlist: PMIDIPacketList): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISend';
function MIDISendSysex(request: PMIDISysexSendRequest): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISendSysex';
function MIDIReceivedEventList(src: MIDIEndpointRef; evtlist: PMIDIEventList)
  : OSStatus; cdecl; external libCoreMIDI name _PU + 'MIDIReceivedEventList';
function MIDIReceived(src: MIDIEndpointRef; pktlist: PMIDIPacketList): OSStatus;
  cdecl; external libCoreMIDI name _PU + 'MIDIReceived';
function MIDIFlushOutput(dest: MIDIEndpointRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIFlushOutput';
function MIDIRestart: OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIRestart';
function MIDIEventPacketNext(pkt: PMIDIEventPacket): PMIDIEventPacket; cdecl;
  external libCoreMIDI name _PU + 'MIDIEventPacketNext';
function MIDIEventListInit(evtlist: PMIDIEventList; protocol: MIDIProtocolID)
  : PMIDIEventPacket; cdecl;
  external libCoreMIDI name _PU + 'MIDIEventListInit';
function MIDIEventListAdd(evtlist: PMIDIEventList; listSize: ByteCount;
  curPacket: PMIDIEventPacket; time: MIDITimeStamp; wordCount: ByteCount;
  words: PLongWord): PMIDIEventPacket; cdecl;
  external libCoreMIDI name _PU + 'MIDIEventListAdd';
function MIDIPacketNext(pkt: PMIDIPacket): PMIDIPacket; cdecl;
  external libCoreMIDI name _PU + 'MIDIPacketNext';
function MIDIPacketListInit(pktlist: PMIDIPacketList): PMIDIPacket; cdecl;
  external libCoreMIDI name _PU + 'MIDIPacketListInit';
function MIDIPacketListAdd(pktlist: PMIDIPacketList; listSize: ByteCount;
  curPacket: PMIDIPacket; time: MIDITimeStamp; nData: ByteCount; data: PByte)
  : PMIDIPacket; cdecl; external libCoreMIDI name _PU + 'MIDIPacketListAdd';
function MIDISetupCreate(outSetup: PMIDISetupRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupCreate';
function MIDISetupDispose(setup: MIDISetupRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupDispose';
function MIDISetupInstall(setup: MIDISetupRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupInstall';
function MIDISetupGetCurrent(outSetup: PMIDISetupRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupGetCurrent';
function MIDISetupToData(setup: MIDISetupRef; outData: PCFDataRef): OSStatus;
  cdecl; external libCoreMIDI name _PU + 'MIDISetupToData';
function MIDISetupFromData(data: CFDataRef; outSetup: PMIDISetupRef): OSStatus;
  cdecl; external libCoreMIDI name _PU + 'MIDISetupFromData';
function MIDIDeviceNewEntity(device: MIDIDeviceRef; name: CFStringRef;
  protocol: MIDIProtocolID; embedded: Boolean; numSourceEndpoints: ItemCount;
  numDestinationEndpoints: ItemCount; newEntity: PMIDIEntityRef): OSStatus;
  cdecl; external libCoreMIDI name _PU + 'MIDIDeviceNewEntity';
function MIDIDeviceAddEntity(device: MIDIDeviceRef; name: CFStringRef;
  embedded: Boolean; numSourceEndpoints: ItemCount;
  numDestinationEndpoints: ItemCount; newEntity: PMIDIEntityRef): OSStatus;
  cdecl; external libCoreMIDI name _PU + 'MIDIDeviceAddEntity';
function MIDIDeviceRemoveEntity(device: MIDIDeviceRef; entity: MIDIEntityRef)
  : OSStatus; cdecl; external libCoreMIDI name _PU + 'MIDIDeviceRemoveEntity';
function MIDIEntityAddOrRemoveEndpoints(entity: MIDIEntityRef;
  numSourceEndpoints: ItemCount; numDestinationEndpoints: ItemCount): OSStatus;
  cdecl; external libCoreMIDI name _PU + 'MIDIEntityAddOrRemoveEndpoints';
function MIDISetupAddDevice(device: MIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupAddDevice';
function MIDISetupRemoveDevice(device: MIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupRemoveDevice';
function MIDISetupAddExternalDevice(device: MIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupAddExternalDevice';
function MIDISetupRemoveExternalDevice(device: MIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDISetupRemoveExternalDevice';
function MIDIGetSerialPortOwner(portName: CFStringRef;
  outDriverName: PCFStringRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetSerialPortOwner';
function MIDISetSerialPortOwner(portName: CFStringRef; driverName: CFStringRef)
  : OSStatus; cdecl; external libCoreMIDI name _PU + 'MIDISetSerialPortOwner';
function MIDIGetSerialPortDrivers(outDriverNames: Pointer): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetSerialPortDrivers';
function MIDIExternalDeviceCreate(name: CFStringRef; manufacturer: CFStringRef;
  model: CFStringRef; outDevice: PMIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIExternalDeviceCreate';
function MIDIThruConnectionParamsSize(ptr: PMIDIThruConnectionParams): LongWord;
  cdecl; external libCoreMIDI name _PU + 'MIDIThruConnectionParamsSize';
procedure MIDIThruConnectionParamsInitialize(inConnectionParams
  : PMIDIThruConnectionParams); cdecl;
  external libCoreMIDI name _PU + 'MIDIThruConnectionParamsInitialize';
function MIDIThruConnectionCreate(inPersistentOwnerID: CFStringRef;
  inConnectionParams: CFDataRef; outConnection: PMIDIThruConnectionRef)
  : OSStatus; cdecl; external libCoreMIDI name _PU + 'MIDIThruConnectionCreate';
function MIDIThruConnectionDispose(connection: MIDIThruConnectionRef): OSStatus;
  cdecl; external libCoreMIDI name _PU + 'MIDIThruConnectionDispose';
function MIDIThruConnectionGetParams(connection: MIDIThruConnectionRef;
  outConnectionParams: PCFDataRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIThruConnectionGetParams';
function MIDIThruConnectionSetParams(connection: MIDIThruConnectionRef;
  inConnectionParams: CFDataRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIThruConnectionSetParams';
function MIDIThruConnectionFind(inPersistentOwnerID: CFStringRef;
  outConnectionList: PCFDataRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIThruConnectionFind';
function MIDIDeviceCreate(owner: MIDIDriverRef; name: CFStringRef;
  manufacturer: CFStringRef; model: CFStringRef; outDevice: PMIDIDeviceRef)
  : OSStatus; cdecl; external libCoreMIDI name _PU + 'MIDIDeviceCreate';
function MIDIDeviceDispose(device: MIDIDeviceRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceDispose';
function MIDIDeviceListGetNumberOfDevices(devList: MIDIDeviceListRef)
  : ItemCount; cdecl; external libCoreMIDI name _PU +
  'MIDIDeviceListGetNumberOfDevices';
function MIDIDeviceListGetDevice(devList: MIDIDeviceListRef; index0: ItemCount)
  : MIDIDeviceRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceListGetDevice';
function MIDIDeviceListAddDevice(devList: MIDIDeviceListRef; dev: MIDIDeviceRef)
  : OSStatus; cdecl; external libCoreMIDI name _PU + 'MIDIDeviceListAddDevice';
function MIDIDeviceListDispose(devList: MIDIDeviceListRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIDeviceListDispose';
function MIDIEndpointSetRefCons(endpt: MIDIEndpointRef; ref1: Pointer;
  ref2: Pointer): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIEndpointSetRefCons';
function MIDIEndpointGetRefCons(endpt: MIDIEndpointRef; ref1: Pointer;
  ref2: Pointer): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIEndpointGetRefCons';
function MIDIGetDriverIORunLoop: CFRunLoopRef; cdecl;
  external libCoreMIDI name _PU + 'MIDIGetDriverIORunLoop';
function MIDIGetDriverDeviceList(driver: MIDIDriverRef): MIDIDeviceListRef;
  cdecl; external libCoreMIDI name _PU + 'MIDIGetDriverDeviceList';
function MIDIDriverEnableMonitoring(driver: MIDIDriverRef; enabled: Boolean)
  : OSStatus; cdecl; external libCoreMIDI name _PU +
  'MIDIDriverEnableMonitoring';
function MIDIMessageTypeForUPWord(word: UInt32): MIDIMessageType; cdecl;
  external libCoreMIDI name _PU + 'MIDIMessageTypeForUPWord';
function MIDI1UPChannelVoiceMessage(group: Byte; status: Byte; channel: Byte;
  data1: Byte; data2: Byte): MIDIMessage_32; cdecl;
  external libCoreMIDI name _PU + 'MIDI1UPChannelVoiceMessage';
function MIDI1UPNoteOff(group: Byte; channel: Byte; noteNumber: Byte;
  velocity: Byte): MIDIMessage_32; cdecl;
  external libCoreMIDI name _PU + 'MIDI1UPNoteOff';
function MIDI1UPNoteOn(group: Byte; channel: Byte; noteNumber: Byte;
  velocity: Byte): MIDIMessage_32; cdecl;
  external libCoreMIDI name _PU + 'MIDI1UPNoteOn';
function MIDI1UPControlChange(group: Byte; channel: Byte; index: Byte;
  data: Byte): MIDIMessage_32; cdecl;
  external libCoreMIDI name _PU + 'MIDI1UPControlChange';
function MIDI1UPPitchBend(group: Byte; channel: Byte; lsb: Byte; msb: Byte)
  : MIDIMessage_32; cdecl; external libCoreMIDI name _PU + 'MIDI1UPPitchBend';
function MIDI1UPSystemCommon(group: Byte; status: Byte; byte1: Byte;
  byte2: Byte): MIDIMessage_32; cdecl;
  external libCoreMIDI name _PU + 'MIDI1UPSystemCommon';
function MIDI1UPSysEx(group: Byte; status: Byte; bytesUsed: Byte; byte1: Byte;
  byte2: Byte; byte3: Byte; byte4: Byte; byte5: Byte; byte6: Byte)
  : MIDIMessage_64; cdecl; external libCoreMIDI name _PU + 'MIDI1UPSysEx';
function MIDI1UPSysExArray(group: Byte; status: Byte; &begin: PByte;
  &end: PByte): MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI1UPSysExArray';
function MIDI2ChannelVoiceMessage(group: Byte; status: Byte; channel: Byte;
  index: UInt16; value: UInt32): MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI2ChannelVoiceMessage';
function MIDI2NoteOn(group: Byte; channel: Byte; noteNumber: Byte;
  attributeType: Byte; attributeData: UInt16; velocity: UInt16): MIDIMessage_64;
  cdecl; external libCoreMIDI name _PU + 'MIDI2NoteOn';
function MIDI2NoteOff(group: Byte; channel: Byte; noteNumber: Byte;
  attributeType: Byte; attributeData: UInt16; velocity: UInt16): MIDIMessage_64;
  cdecl; external libCoreMIDI name _PU + 'MIDI2NoteOff';
function MIDI2PolyPressure(group: Byte; channel: Byte; noteNumber: Byte;
  value: UInt32): MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI2PolyPressure';
function MIDI2RegisteredPNC(group: Byte; channel: Byte; noteNumber: Byte;
  index: Byte; value: UInt32): MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI2RegisteredPNC';
function MIDI2AssignablePNC(group: Byte; channel: Byte; noteNumber: Byte;
  index: Byte; value: UInt32): MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI2AssignablePNC';
function MIDI2PerNoteManagment(group: Byte; channel: Byte; noteNumber: Byte;
  detachPNCs: Integer; resetPNCsToDefault: Integer): MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI2PerNoteManagment';
function MIDI2ControlChange(group: Byte; channel: Byte; index: Byte;
  value: UInt32): MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI2ControlChange';
function MIDI2RegisteredControl(group: Byte; channel: Byte; bank: Byte;
  index: Byte; value: UInt32): MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI2RegisteredControl';
function MIDI2AssignableControl(group: Byte; channel: Byte; bank: Byte;
  index: Byte; value: UInt32): MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI2AssignableControl';
function MIDI2RelRegisteredControl(group: Byte; channel: Byte; bank: Byte;
  index: Byte; value: UInt32): MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI2RelRegisteredControl';
function MIDI2RelAssignableControl(group: Byte; channel: Byte; bank: Byte;
  index: Byte; value: UInt32): MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI2RelAssignableControl';
function MIDI2ProgramChange(group: Byte; channel: Byte; bankIsValid: Integer;
  &program: Byte; bank_msb: Byte; bank_lsb: Byte): MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI2ProgramChange';
function MIDI2ChannelPressure(group: Byte; channel: Byte; value: UInt32)
  : MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI2ChannelPressure';
function MIDI2PitchBend(group: Byte; channel: Byte; value: UInt32)
  : MIDIMessage_64; cdecl; external libCoreMIDI name _PU + 'MIDI2PitchBend';
function MIDI2PerNotePitchBend(group: Byte; channel: Byte; noteNumber: Byte;
  value: UInt32): MIDIMessage_64; cdecl;
  external libCoreMIDI name _PU + 'MIDI2PerNotePitchBend';
procedure MIDIEventListForEachEvent(evtlist: PMIDIEventList;
  visitor: MIDIEventVisitor; visitorContext: Pointer); cdecl;
  external libCoreMIDI name _PU + 'MIDIEventListForEachEvent';
function MIDIBluetoothDriverActivateAllConnections: OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIBluetoothDriverActivateAllConnections';
function MIDIBluetoothDriverDisconnect(uuid: CFStringRef): OSStatus; cdecl;
  external libCoreMIDI name _PU + 'MIDIBluetoothDriverDisconnect';

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

function kMIDIPropertyNameConfigurationDictionary: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI,
    'kMIDIPropertyNameConfigurationDictionary');
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

function kMIDIPropertyProtocolID: Pointer;
begin
  Result := CocoaPointerConst(libCoreMIDI, 'kMIDIPropertyProtocolID');
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
