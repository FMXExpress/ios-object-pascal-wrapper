{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreBluetooth
//

unit iOSapi.CoreBluetooth;

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
  CBManagerStateUnknown = 0;
  CBManagerStateResetting = 1;
  CBManagerStateUnsupported = 2;
  CBManagerStateUnauthorized = 3;
  CBManagerStatePoweredOff = 4;
  CBManagerStatePoweredOn = 5;
  CBManagerAuthorizationNotDetermined = 0;
  CBManagerAuthorizationRestricted = 1;
  CBManagerAuthorizationDenied = 2;
  CBManagerAuthorizationAllowedAlways = 3;
  CBCentralManagerStateUnknown = CBManagerStateUnknown;
  CBCentralManagerStateResetting = CBManagerStateResetting;
  CBCentralManagerStateUnsupported = CBManagerStateUnsupported;
  CBCentralManagerStateUnauthorized = CBManagerStateUnauthorized;
  CBCentralManagerStatePoweredOff = CBManagerStatePoweredOff;
  CBCentralManagerStatePoweredOn = CBManagerStatePoweredOn;
  CBConnectionEventPeerDisconnected = 0;
  CBConnectionEventPeerConnected = 1;
  CBCentralManagerFeatureExtendedScanAndConnect = 1 shl 0;
  CBCharacteristicPropertyBroadcast = 1;
  CBCharacteristicPropertyRead = 2;
  CBCharacteristicPropertyWriteWithoutResponse = 4;
  CBCharacteristicPropertyWrite = 8;
  CBCharacteristicPropertyNotify = 16;
  CBCharacteristicPropertyIndicate = 32;
  CBCharacteristicPropertyAuthenticatedSignedWrites = 64;
  CBCharacteristicPropertyExtendedProperties = 128;
  CBCharacteristicPropertyNotifyEncryptionRequired = 256;
  CBCharacteristicPropertyIndicateEncryptionRequired = 512;
  CBAttributePermissionsReadable = 1;
  CBAttributePermissionsWriteable = 2;
  CBAttributePermissionsReadEncryptionRequired = 4;
  CBAttributePermissionsWriteEncryptionRequired = 8;
  CBErrorUnknown = 0;
  CBErrorInvalidParameters = 1;
  CBErrorInvalidHandle = 2;
  CBErrorNotConnected = 3;
  CBErrorOutOfSpace = 4;
  CBErrorOperationCancelled = 5;
  CBErrorConnectionTimeout = 6;
  CBErrorPeripheralDisconnected = 7;
  CBErrorUUIDNotAllowed = 8;
  CBErrorAlreadyAdvertising = 9;
  CBErrorConnectionFailed = 10;
  CBErrorConnectionLimitReached = 11;
  CBErrorUnkownDevice = 12;
  __AVAILABILITY_INTERNAL__IPHONE_9_0_DEP__IPHONE_13_0 = 12;
  CBErrorUnknownDevice = 12;
  CBErrorOperationNotSupported = 13;
  CBErrorPeerRemovedPairingInformation = 14;
  __AVAILABILITY_INTERNAL__IPHONE_13_4 = 14;
  CBErrorEncryptionTimedOut = 15;
  CBErrorTooManyLEPairedDevices = 0;
  __AVAILABILITY_INTERNAL__IPHONE_14_0 = 16;
  CBErrorLeGattExceededBackgroundNotificationLimit = 17;
  CBErrorLeGattNearBackgroundNotificationLimit = 18;
  CBATTErrorSuccess = 0;
  CBATTErrorInvalidHandle = 1;
  CBATTErrorReadNotPermitted = 2;
  CBATTErrorWriteNotPermitted = 3;
  CBATTErrorInvalidPdu = 4;
  CBATTErrorInsufficientAuthentication = 5;
  CBATTErrorRequestNotSupported = 6;
  CBATTErrorInvalidOffset = 7;
  CBATTErrorInsufficientAuthorization = 8;
  CBATTErrorPrepareQueueFull = 9;
  CBATTErrorAttributeNotFound = 10;
  CBATTErrorAttributeNotLong = 11;
  CBATTErrorInsufficientEncryptionKeySize = 12;
  CBATTErrorInvalidAttributeValueLength = 13;
  CBATTErrorUnlikelyError = 14;
  CBATTErrorInsufficientEncryption = 15;
  CBATTErrorUnsupportedGroupType = 16;
  CBATTErrorInsufficientResources = 17;
  CBPeripheralStateDisconnected = 0;
  CBPeripheralStateConnecting = 1;
  CBPeripheralStateConnected = 2;
  CBPeripheralStateDisconnecting = 3;
  CBCharacteristicWriteWithResponse = 0;
  CBCharacteristicWriteWithoutResponse = 1;
  CBPeripheralManagerAuthorizationStatusNotDetermined = 0;
  CBPeripheralManagerAuthorizationStatusRestricted = 1;
  CBPeripheralManagerAuthorizationStatusDenied = 2;
  CBPeripheralManagerAuthorizationStatusAuthorized = 3;
  CBPeripheralManagerStateUnknown = CBManagerStateUnknown;
  CBPeripheralManagerStateResetting = CBManagerStateResetting;
  CBPeripheralManagerStateUnsupported = CBManagerStateUnsupported;
  CBPeripheralManagerStateUnauthorized = CBManagerStateUnauthorized;
  CBPeripheralManagerStatePoweredOff = CBManagerStatePoweredOff;
  CBPeripheralManagerStatePoweredOn = CBManagerStatePoweredOn;
  CBPeripheralManagerConnectionLatencyLow = 0;
  CBPeripheralManagerConnectionLatencyMedium = 1;
  CBPeripheralManagerConnectionLatencyHigh = 2;

type

  // ===== Forward declarations =====
{$M+}
  CBCentral = interface;
  CBCharacteristic = interface;
  CBATTRequest = interface;
  CBUUID = interface;
  CBPeripheral = interface;
  CBService = interface;
  CBDescriptor = interface;
  CBAttribute = interface;
  CBPeer = interface;
  CBManager = interface;
  CBCentralManagerDelegate = interface;
  CBCentralManager = interface;
  CBMutableCharacteristic = interface;
  CBMutableDescriptor = interface;
  CBL2CAPChannel = interface;
  CBPeripheralDelegate = interface;
  CBMutableService = interface;
  CBPeripheralManagerDelegate = interface;
  CBPeripheralManager = interface;

  // ===== Framework typedefs =====
{$M+}
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  CBConnectionEventMatchingOption = NSString;
  PCBConnectionEventMatchingOption = ^CBConnectionEventMatchingOption;
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  CBManagerState = NSInteger;
  CBManagerAuthorization = NSInteger;
  CBCentralManagerState = NSInteger;
  CBConnectionEvent = NSInteger;
  CBCentralManagerFeature = NSUInteger;
  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;
  CBCharacteristicProperties = NSUInteger;
  CBAttributePermissions = NSUInteger;
  CBError = NSInteger;
  CBATTError = NSInteger;
  CBL2CAPPSM = Word;
  PCBL2CAPPSM = ^CBL2CAPPSM;
  CBPeripheralState = NSInteger;
  CBCharacteristicWriteType = NSInteger;
  CBPeripheralManagerAuthorizationStatus = NSInteger;
  CBPeripheralManagerState = NSInteger;
  CBPeripheralManagerConnectionLatency = NSInteger;
  CFUUIDRef = Pointer;
  PCFUUIDRef = ^CFUUIDRef;
  // ===== Interface declarations =====

  CBPeerClass = interface(NSObjectClass)
    ['{50A16980-D70A-47BC-98A9-5869F76BE59E}']
  end;

  CBPeer = interface(NSObject)
    ['{82588DFE-ACE9-4E07-A204-D24CA5A43BC5}']
    function identifier: NSUUID; cdecl;
  end;

  TCBPeer = class(TOCGenericImport<CBPeerClass, CBPeer>)
  end;

  PCBPeer = Pointer;

  CBCentralClass = interface(CBPeerClass)
    ['{8FED01A6-2B22-429C-889C-B59E5ABC53EB}']
  end;

  CBCentral = interface(CBPeer)
    ['{00375E29-68A9-45CA-8D33-7DB9AC7C89F7}']
    function maximumUpdateValueLength: NSUInteger; cdecl;
  end;

  TCBCentral = class(TOCGenericImport<CBCentralClass, CBCentral>)
  end;

  PCBCentral = Pointer;

  CBAttributeClass = interface(NSObjectClass)
    ['{77DC893A-6F5B-4D49-9C00-F2DB4ED456A2}']
  end;

  CBAttribute = interface(NSObject)
    ['{FF3BE806-12BC-4D2C-841E-A0D688537A83}']
    function UUID: CBUUID; cdecl;
  end;

  TCBAttribute = class(TOCGenericImport<CBAttributeClass, CBAttribute>)
  end;

  PCBAttribute = Pointer;

  CBCharacteristicClass = interface(CBAttributeClass)
    ['{28D1E2FE-938F-4CB4-B2BA-94B26D616282}']
  end;

  CBCharacteristic = interface(CBAttribute)
    ['{0416B919-DAE6-4EDB-A726-FA38438E550B}']
    function service: CBService; cdecl;
    function properties: CBCharacteristicProperties; cdecl;
    function value: NSData; cdecl;
    function descriptors: NSArray; cdecl;
    function isBroadcasted: Boolean; cdecl;
    function isNotifying: Boolean; cdecl;
  end;

  TCBCharacteristic = class(TOCGenericImport<CBCharacteristicClass,
    CBCharacteristic>)
  end;

  PCBCharacteristic = Pointer;

  CBATTRequestClass = interface(NSObjectClass)
    ['{BBEF3D73-73FB-4C34-A85F-D99682890833}']
  end;

  CBATTRequest = interface(NSObject)
    ['{BDAABD7B-318E-4B29-98D7-2209391738F7}']
    function central: CBCentral; cdecl;
    function characteristic: CBCharacteristic; cdecl;
    function offset: NSUInteger; cdecl;
    procedure setValue(value: NSData); cdecl;
    function value: NSData; cdecl;
  end;

  TCBATTRequest = class(TOCGenericImport<CBATTRequestClass, CBATTRequest>)
  end;

  PCBATTRequest = Pointer;

  CBUUIDClass = interface(NSObjectClass)
    ['{48E05F21-F481-4BD6-A328-44573A5FB246}']
    { class } function UUIDWithString(theString: NSString): CBUUID; cdecl;
    { class } function UUIDWithData(theData: NSData): CBUUID; cdecl;
    { class } function UUIDWithCFUUID(theUUID: CFUUIDRef): CBUUID; cdecl;
    { class } function UUIDWithNSUUID(theUUID: NSUUID): CBUUID; cdecl;
  end;

  CBUUID = interface(NSObject)
    ['{5C8C9693-59DC-44EF-AB61-93B7F2A8F9BA}']
    function data: NSData; cdecl;
    function UUIDString: NSString; cdecl;
  end;

  TCBUUID = class(TOCGenericImport<CBUUIDClass, CBUUID>)
  end;

  PCBUUID = Pointer;

  CBPeripheralClass = interface(CBPeerClass)
    ['{0E301093-44E9-4782-A8A7-DBE737D2D3B5}']
  end;

  CBPeripheral = interface(CBPeer)
    ['{EB1F54E8-DA1E-454F-90D9-5DF20DD62E3A}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function name: NSString; cdecl;
    function RSSI: NSNumber; cdecl;
    function state: CBPeripheralState; cdecl;
    function services: NSArray; cdecl;
    function canSendWriteWithoutResponse: Boolean; cdecl;
    function ancsAuthorized: Boolean; cdecl;
    procedure readRSSI; cdecl;
    procedure discoverServices(serviceUUIDs: NSArray); cdecl;
    procedure discoverIncludedServices(includedServiceUUIDs: NSArray;
      forService: CBService); cdecl;
    procedure discoverCharacteristics(characteristicUUIDs: NSArray;
      forService: CBService); cdecl;
    procedure readValueForCharacteristic(characteristic
      : CBCharacteristic); cdecl;
    function maximumWriteValueLengthForType(&type: CBCharacteristicWriteType)
      : NSUInteger; cdecl;
    [MethodName('writeValue:forCharacteristic:type:')]
    procedure writeValueForCharacteristicType(data: NSData;
      forCharacteristic: CBCharacteristic;
      &type: CBCharacteristicWriteType); cdecl;
    procedure setNotifyValue(enabled: Boolean;
      forCharacteristic: CBCharacteristic); cdecl;
    procedure discoverDescriptorsForCharacteristic(characteristic
      : CBCharacteristic); cdecl;
    procedure readValueForDescriptor(descriptor: CBDescriptor); cdecl;
    [MethodName('writeValue:forDescriptor:')]
    procedure writeValueForDescriptor(data: NSData;
      forDescriptor: CBDescriptor); cdecl;
    procedure openL2CAPChannel(PSM: CBL2CAPPSM); cdecl;
  end;

  TCBPeripheral = class(TOCGenericImport<CBPeripheralClass, CBPeripheral>)
  end;

  PCBPeripheral = Pointer;

  CBServiceClass = interface(CBAttributeClass)
    ['{BE52788E-D024-46F5-9340-E195255D42A2}']
  end;

  CBService = interface(CBAttribute)
    ['{738ABFE1-109C-4BBB-A729-02B1C598FAB8}']
    function peripheral: CBPeripheral; cdecl;
    function isPrimary: Boolean; cdecl;
    function includedServices: NSArray; cdecl;
    function characteristics: NSArray; cdecl;
  end;

  TCBService = class(TOCGenericImport<CBServiceClass, CBService>)
  end;

  PCBService = Pointer;

  CBDescriptorClass = interface(CBAttributeClass)
    ['{B93D3353-909E-42F6-AA38-EB06BE155228}']
  end;

  CBDescriptor = interface(CBAttribute)
    ['{5C2B25B8-8A35-44DB-AC2D-5D764433C81D}']
    function characteristic: CBCharacteristic; cdecl;
    function value: Pointer; cdecl;
  end;

  TCBDescriptor = class(TOCGenericImport<CBDescriptorClass, CBDescriptor>)
  end;

  PCBDescriptor = Pointer;

  CBManagerClass = interface(NSObjectClass)
    ['{0761D032-22EF-46AC-ABD7-D5372CDD137E}']
  end;

  CBManager = interface(NSObject)
    ['{D0A7B917-950C-4056-B842-D1324C1A460C}']
    function state: CBManagerState; cdecl;
    function authorization: CBManagerAuthorization; cdecl;
  end;

  TCBManager = class(TOCGenericImport<CBManagerClass, CBManager>)
  end;

  PCBManager = Pointer;

  CBCentralManagerClass = interface(CBManagerClass)
    ['{4DFA4A4F-8FBC-4F8B-9F52-0E728E2F4EA3}']
    { class } function supportsFeatures(features: CBCentralManagerFeature)
      : Boolean; cdecl;
  end;

  CBCentralManager = interface(CBManager)
    ['{14AF7455-C070-4058-8CD3-2799C55DAB91}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function isScanning: Boolean; cdecl;
    [MethodName('initWithDelegate:queue:')]
    function initWithDelegateQueue(delegate: Pointer; queue: dispatch_queue_t)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithDelegate:queue:options:')]
    function initWithDelegateQueueOptions(delegate: Pointer;
      queue: dispatch_queue_t; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function retrievePeripheralsWithIdentifiers(identifiers: NSArray)
      : NSArray; cdecl;
    function retrieveConnectedPeripheralsWithServices(serviceUUIDs: NSArray)
      : NSArray; cdecl;
    procedure scanForPeripheralsWithServices(serviceUUIDs: NSArray;
      options: NSDictionary); cdecl;
    procedure stopScan; cdecl;
    procedure connectPeripheral(peripheral: CBPeripheral;
      options: NSDictionary); cdecl;
    procedure cancelPeripheralConnection(peripheral: CBPeripheral); cdecl;
    procedure registerForConnectionEventsWithOptions
      (options: NSDictionary); cdecl;
  end;

  TCBCentralManager = class(TOCGenericImport<CBCentralManagerClass,
    CBCentralManager>)
  end;

  PCBCentralManager = Pointer;

  CBMutableCharacteristicClass = interface(CBCharacteristicClass)
    ['{32042C6A-FD06-4EC4-8F7F-1F4FEAC26FB6}']
  end;

  CBMutableCharacteristic = interface(CBCharacteristic)
    ['{482A7C52-16D0-4058-9BF6-3F3E03AB1502}']
    procedure setPermissions(permissions: CBAttributePermissions); cdecl;
    function permissions: CBAttributePermissions; cdecl;
    function subscribedCentrals: NSArray; cdecl;
    procedure setProperties(properties: CBCharacteristicProperties); cdecl;
    function properties: CBCharacteristicProperties; cdecl;
    procedure setValue(value: NSData); cdecl;
    function value: NSData; cdecl;
    procedure setDescriptors(descriptors: NSArray); cdecl;
    function descriptors: NSArray; cdecl;
    function initWithType(UUID: CBUUID; properties: CBCharacteristicProperties;
      value: NSData; permissions: CBAttributePermissions)
      : Pointer { instancetype }; cdecl;
  end;

  TCBMutableCharacteristic = class
    (TOCGenericImport<CBMutableCharacteristicClass, CBMutableCharacteristic>)
  end;

  PCBMutableCharacteristic = Pointer;

  CBMutableDescriptorClass = interface(CBDescriptorClass)
    ['{E7F1C608-2560-4CA4-8AF6-AAC35071F89B}']
  end;

  CBMutableDescriptor = interface(CBDescriptor)
    ['{5CB1FDF0-5C0F-4A04-AE15-65CEF784C84A}']
    function initWithType(UUID: CBUUID; value: Pointer)
      : Pointer { instancetype }; cdecl;
  end;

  TCBMutableDescriptor = class(TOCGenericImport<CBMutableDescriptorClass,
    CBMutableDescriptor>)
  end;

  PCBMutableDescriptor = Pointer;

  CBL2CAPChannelClass = interface(NSObjectClass)
    ['{675D9A59-1A3C-449E-BB5C-BF27DFB24405}']
  end;

  CBL2CAPChannel = interface(NSObject)
    ['{07A60AD1-C13F-4EAA-A6FA-2861D74F4EB8}']
    function peer: CBPeer; cdecl;
    function inputStream: NSInputStream; cdecl;
    function outputStream: NSOutputStream; cdecl;
    function PSM: CBL2CAPPSM; cdecl;
  end;

  TCBL2CAPChannel = class(TOCGenericImport<CBL2CAPChannelClass, CBL2CAPChannel>)
  end;

  PCBL2CAPChannel = Pointer;

  CBMutableServiceClass = interface(CBServiceClass)
    ['{129E1AAD-B1D1-4EE7-98EA-BDCA465B7742}']
  end;

  CBMutableService = interface(CBService)
    ['{42192A9B-3165-4EF9-A546-C2BE59CD569C}']
    procedure setIncludedServices(includedServices: NSArray); cdecl;
    function includedServices: NSArray; cdecl;
    procedure setCharacteristics(characteristics: NSArray); cdecl;
    function characteristics: NSArray; cdecl;
    function initWithType(UUID: CBUUID; primary: Boolean)
      : Pointer { instancetype }; cdecl;
  end;

  TCBMutableService = class(TOCGenericImport<CBMutableServiceClass,
    CBMutableService>)
  end;

  PCBMutableService = Pointer;

  CBPeripheralManagerClass = interface(CBManagerClass)
    ['{4D70FE33-122A-4DEA-A5CD-752E7B0374C7}']
    { class } function authorizationStatus
      : CBPeripheralManagerAuthorizationStatus; cdecl;
  end;

  CBPeripheralManager = interface(CBManager)
    ['{96E47815-F796-4EC7-BB62-062945D5FBA3}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function isAdvertising: Boolean; cdecl;
    [MethodName('initWithDelegate:queue:')]
    function initWithDelegateQueue(delegate: Pointer; queue: dispatch_queue_t)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithDelegate:queue:options:')]
    function initWithDelegateQueueOptions(delegate: Pointer;
      queue: dispatch_queue_t; options: NSDictionary)
      : Pointer { instancetype }; cdecl;
    procedure startAdvertising(advertisementData: NSDictionary); cdecl;
    procedure stopAdvertising; cdecl;
    procedure setDesiredConnectionLatency
      (latency: CBPeripheralManagerConnectionLatency;
      forCentral: CBCentral); cdecl;
    procedure addService(service: CBMutableService); cdecl;
    procedure removeService(service: CBMutableService); cdecl;
    procedure removeAllServices; cdecl;
    procedure respondToRequest(request: CBATTRequest;
      withResult: CBATTError); cdecl;
    function updateValue(value: NSData;
      forCharacteristic: CBMutableCharacteristic; onSubscribedCentrals: NSArray)
      : Boolean; cdecl;
    procedure publishL2CAPChannelWithEncryption(encryptionRequired
      : Boolean); cdecl;
    procedure unpublishL2CAPChannel(PSM: CBL2CAPPSM); cdecl;
  end;

  TCBPeripheralManager = class(TOCGenericImport<CBPeripheralManagerClass,
    CBPeripheralManager>)
  end;

  PCBPeripheralManager = Pointer;

  // ===== Protocol declarations =====

  CBCentralManagerDelegate = interface(IObjectiveC)
    ['{3B42BA4A-96B0-4727-99EA-DCB6D2BD258A}']
    procedure centralManagerDidUpdateState(central: CBCentralManager); cdecl;
    [MethodName('centralManager:willRestoreState:')]
    procedure centralManagerWillRestoreState(central: CBCentralManager;
      willRestoreState: NSDictionary); cdecl;
    [MethodName('centralManager:didDiscoverPeripheral:advertisementData:RSSI:')]
    procedure centralManagerDidDiscoverPeripheralAdvertisementDataRSSI
      (central: CBCentralManager; didDiscoverPeripheral: CBPeripheral;
      advertisementData: NSDictionary; RSSI: NSNumber); cdecl;
    [MethodName('centralManager:didConnectPeripheral:')]
    procedure centralManagerDidConnectPeripheral(central: CBCentralManager;
      didConnectPeripheral: CBPeripheral); cdecl;
    [MethodName('centralManager:didFailToConnectPeripheral:error:')]
    procedure centralManagerDidFailToConnectPeripheralError
      (central: CBCentralManager; didFailToConnectPeripheral: CBPeripheral;
      error: NSError); cdecl;
    [MethodName('centralManager:didDisconnectPeripheral:error:')]
    procedure centralManagerDidDisconnectPeripheralError
      (central: CBCentralManager; didDisconnectPeripheral: CBPeripheral;
      error: NSError); cdecl;
    [MethodName('centralManager:connectionEventDidOccur:forPeripheral:')]
    procedure centralManagerConnectionEventDidOccurForPeripheral
      (central: CBCentralManager; connectionEventDidOccur: CBConnectionEvent;
      forPeripheral: CBPeripheral); cdecl;
    [MethodName('centralManager:didUpdateANCSAuthorizationForPeripheral:')]
    procedure centralManagerDidUpdateANCSAuthorizationForPeripheral
      (central: CBCentralManager; didUpdateANCSAuthorizationForPeripheral
      : CBPeripheral); cdecl;
  end;

  CBPeripheralDelegate = interface(IObjectiveC)
    ['{99667223-E49F-4771-9C2F-479AC5DB9111}']
    procedure peripheralDidUpdateName(peripheral: CBPeripheral); cdecl;
    [MethodName('peripheral:didModifyServices:')]
    procedure peripheralDidModifyServices(peripheral: CBPeripheral;
      didModifyServices: NSArray); cdecl;
    procedure peripheralDidUpdateRSSI(peripheral: CBPeripheral;
      error: NSError); cdecl;
    [MethodName('peripheral:didReadRSSI:error:')]
    procedure peripheralDidReadRSSIError(peripheral: CBPeripheral;
      didReadRSSI: NSNumber; error: NSError); cdecl;
    [MethodName('peripheral:didDiscoverServices:')]
    procedure peripheralDidDiscoverServices(peripheral: CBPeripheral;
      didDiscoverServices: NSError); cdecl;
    [MethodName('peripheral:didDiscoverIncludedServicesForService:error:')]
    procedure peripheralDidDiscoverIncludedServicesForServiceError
      (peripheral: CBPeripheral; didDiscoverIncludedServicesForService
      : CBService; error: NSError); cdecl;
    [MethodName('peripheral:didDiscoverCharacteristicsForService:error:')]
    procedure peripheralDidDiscoverCharacteristicsForServiceError
      (peripheral: CBPeripheral; didDiscoverCharacteristicsForService
      : CBService; error: NSError); cdecl;
    [MethodName('peripheral:didUpdateValueForCharacteristic:error:')]
    procedure peripheralDidUpdateValueForCharacteristicError
      (peripheral: CBPeripheral; didUpdateValueForCharacteristic
      : CBCharacteristic; error: NSError); cdecl;
    [MethodName('peripheral:didWriteValueForCharacteristic:error:')]
    procedure peripheralDidWriteValueForCharacteristicError
      (peripheral: CBPeripheral;
      didWriteValueForCharacteristic: CBCharacteristic; error: NSError); cdecl;
    [MethodName
      ('peripheral:didUpdateNotificationStateForCharacteristic:error:')]
    procedure peripheralDidUpdateNotificationStateForCharacteristicError
      (peripheral: CBPeripheral; didUpdateNotificationStateForCharacteristic
      : CBCharacteristic; error: NSError); cdecl;
    [MethodName('peripheral:didDiscoverDescriptorsForCharacteristic:error:')]
    procedure peripheralDidDiscoverDescriptorsForCharacteristicError
      (peripheral: CBPeripheral; didDiscoverDescriptorsForCharacteristic
      : CBCharacteristic; error: NSError); cdecl;
    [MethodName('peripheral:didUpdateValueForDescriptor:error:')]
    procedure peripheralDidUpdateValueForDescriptorError
      (peripheral: CBPeripheral; didUpdateValueForDescriptor: CBDescriptor;
      error: NSError); cdecl;
    [MethodName('peripheral:didWriteValueForDescriptor:error:')]
    procedure peripheralDidWriteValueForDescriptorError
      (peripheral: CBPeripheral; didWriteValueForDescriptor: CBDescriptor;
      error: NSError); cdecl;
    procedure peripheralIsReadyToSendWriteWithoutResponse
      (peripheral: CBPeripheral); cdecl;
    [MethodName('peripheral:didOpenL2CAPChannel:error:')]
    procedure peripheralDidOpenL2CAPChannelError(peripheral: CBPeripheral;
      didOpenL2CAPChannel: CBL2CAPChannel; error: NSError); cdecl;
  end;

  CBPeripheralManagerDelegate = interface(IObjectiveC)
    ['{9332DABE-4BBA-4233-971D-1AD362B7DA95}']
    procedure peripheralManagerDidUpdateState
      (peripheral: CBPeripheralManager); cdecl;
    [MethodName('peripheralManager:willRestoreState:')]
    procedure peripheralManagerWillRestoreState(peripheral: CBPeripheralManager;
      willRestoreState: NSDictionary); cdecl;
    procedure peripheralManagerDidStartAdvertising
      (peripheral: CBPeripheralManager; error: NSError); cdecl;
    [MethodName('peripheralManager:didAddService:error:')]
    procedure peripheralManagerDidAddServiceError
      (peripheral: CBPeripheralManager; didAddService: CBService;
      error: NSError); cdecl;
    [MethodName('peripheralManager:central:didSubscribeToCharacteristic:')]
    procedure peripheralManagerCentralDidSubscribeToCharacteristic
      (peripheral: CBPeripheralManager; central: CBCentral;
      didSubscribeToCharacteristic: CBCharacteristic); cdecl;
    [MethodName('peripheralManager:central:didUnsubscribeFromCharacteristic:')]
    procedure peripheralManagerCentralDidUnsubscribeFromCharacteristic
      (peripheral: CBPeripheralManager; central: CBCentral;
      didUnsubscribeFromCharacteristic: CBCharacteristic); cdecl;
    [MethodName('peripheralManager:didReceiveReadRequest:')]
    procedure peripheralManagerDidReceiveReadRequest
      (peripheral: CBPeripheralManager;
      didReceiveReadRequest: CBATTRequest); cdecl;
    [MethodName('peripheralManager:didReceiveWriteRequests:')]
    procedure peripheralManagerDidReceiveWriteRequests
      (peripheral: CBPeripheralManager;
      didReceiveWriteRequests: NSArray); cdecl;
    procedure peripheralManagerIsReadyToUpdateSubscribers
      (peripheral: CBPeripheralManager); cdecl;
    [MethodName('peripheralManager:didPublishL2CAPChannel:error:')]
    procedure peripheralManagerDidPublishL2CAPChannelError
      (peripheral: CBPeripheralManager; didPublishL2CAPChannel: CBL2CAPPSM;
      error: NSError); cdecl;
    [MethodName('peripheralManager:didUnpublishL2CAPChannel:error:')]
    procedure peripheralManagerDidUnpublishL2CAPChannelError
      (peripheral: CBPeripheralManager; didUnpublishL2CAPChannel: CBL2CAPPSM;
      error: NSError); cdecl;
    [MethodName('peripheralManager:didOpenL2CAPChannel:error:')]
    procedure peripheralManagerDidOpenL2CAPChannelError
      (peripheral: CBPeripheralManager; didOpenL2CAPChannel: CBL2CAPChannel;
      error: NSError); cdecl;
  end;

  // ===== Exported string consts =====

function CBAdvertisementDataLocalNameKey: NSString;
function CBAdvertisementDataTxPowerLevelKey: NSString;
function CBAdvertisementDataServiceUUIDsKey: NSString;
function CBAdvertisementDataServiceDataKey: NSString;
function CBAdvertisementDataManufacturerDataKey: NSString;
function CBAdvertisementDataOverflowServiceUUIDsKey: NSString;
function CBAdvertisementDataIsConnectable: NSString;
function CBAdvertisementDataSolicitedServiceUUIDsKey: NSString;
function CBCentralManagerOptionShowPowerAlertKey: NSString;
function CBCentralManagerOptionRestoreIdentifierKey: NSString;
function CBCentralManagerOptionDeviceAccessForMedia: NSString;
function CBCentralManagerScanOptionAllowDuplicatesKey: NSString;
function CBCentralManagerScanOptionSolicitedServiceUUIDsKey: NSString;
function CBConnectPeripheralOptionNotifyOnConnectionKey: NSString;
function CBConnectPeripheralOptionNotifyOnDisconnectionKey: NSString;
function CBConnectPeripheralOptionNotifyOnNotificationKey: NSString;
function CBConnectPeripheralOptionStartDelayKey: NSString;
function CBConnectPeripheralOptionEnableTransportBridgingKey: NSString;
function CBConnectPeripheralOptionRequiresANCS: NSString;
function CBCentralManagerRestoredStatePeripheralsKey: NSString;
function CBCentralManagerRestoredStateScanServicesKey: NSString;
function CBCentralManagerRestoredStateScanOptionsKey: NSString;
function CBConnectionEventMatchingOptionServiceUUIDs: Pointer;
function CBConnectionEventMatchingOptionPeripheralUUIDs: Pointer;
function CBErrorDomain: NSString;
function CBATTErrorDomain: NSString;
function CBPeripheralManagerOptionShowPowerAlertKey: NSString;
function CBPeripheralManagerOptionRestoreIdentifierKey: NSString;
function CBPeripheralManagerRestoredStateServicesKey: NSString;
function CBPeripheralManagerRestoredStateAdvertisementDataKey: NSString;
function __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_13_0: Pointer;
function CBUUIDCharacteristicExtendedPropertiesString: NSString;
function CBUUIDCharacteristicUserDescriptionString: NSString;
function CBUUIDClientCharacteristicConfigurationString: NSString;
function CBUUIDServerCharacteristicConfigurationString: NSString;
function CBUUIDCharacteristicFormatString: NSString;
function CBUUIDCharacteristicAggregateFormatString: NSString;
function CBUUIDCharacteristicValidRangeString: NSString;
function CBUUIDL2CAPPSMCharacteristicString: NSString;


// ===== External functions =====

const
  libCoreBluetooth =
    '/System/Library/Frameworks/CoreBluetooth.framework/CoreBluetooth';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  CoreBluetoothModule: THandle;

{$ENDIF IOS}

function CBAdvertisementDataLocalNameKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBAdvertisementDataLocalNameKey');
end;

function CBAdvertisementDataTxPowerLevelKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBAdvertisementDataTxPowerLevelKey');
end;

function CBAdvertisementDataServiceUUIDsKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBAdvertisementDataServiceUUIDsKey');
end;

function CBAdvertisementDataServiceDataKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBAdvertisementDataServiceDataKey');
end;

function CBAdvertisementDataManufacturerDataKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBAdvertisementDataManufacturerDataKey');
end;

function CBAdvertisementDataOverflowServiceUUIDsKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBAdvertisementDataOverflowServiceUUIDsKey');
end;

function CBAdvertisementDataIsConnectable: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBAdvertisementDataIsConnectable');
end;

function CBAdvertisementDataSolicitedServiceUUIDsKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBAdvertisementDataSolicitedServiceUUIDsKey');
end;

function CBCentralManagerOptionShowPowerAlertKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBCentralManagerOptionShowPowerAlertKey');
end;

function CBCentralManagerOptionRestoreIdentifierKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBCentralManagerOptionRestoreIdentifierKey');
end;

function CBCentralManagerOptionDeviceAccessForMedia: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBCentralManagerOptionDeviceAccessForMedia');
end;

function CBCentralManagerScanOptionAllowDuplicatesKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBCentralManagerScanOptionAllowDuplicatesKey');
end;

function CBCentralManagerScanOptionSolicitedServiceUUIDsKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBCentralManagerScanOptionSolicitedServiceUUIDsKey');
end;

function CBConnectPeripheralOptionNotifyOnConnectionKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBConnectPeripheralOptionNotifyOnConnectionKey');
end;

function CBConnectPeripheralOptionNotifyOnDisconnectionKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBConnectPeripheralOptionNotifyOnDisconnectionKey');
end;

function CBConnectPeripheralOptionNotifyOnNotificationKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBConnectPeripheralOptionNotifyOnNotificationKey');
end;

function CBConnectPeripheralOptionStartDelayKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBConnectPeripheralOptionStartDelayKey');
end;

function CBConnectPeripheralOptionEnableTransportBridgingKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBConnectPeripheralOptionEnableTransportBridgingKey');
end;

function CBConnectPeripheralOptionRequiresANCS: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBConnectPeripheralOptionRequiresANCS');
end;

function CBCentralManagerRestoredStatePeripheralsKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBCentralManagerRestoredStatePeripheralsKey');
end;

function CBCentralManagerRestoredStateScanServicesKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBCentralManagerRestoredStateScanServicesKey');
end;

function CBCentralManagerRestoredStateScanOptionsKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBCentralManagerRestoredStateScanOptionsKey');
end;

function CBErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth, 'CBErrorDomain');
end;

function CBATTErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth, 'CBATTErrorDomain');
end;

function CBPeripheralManagerOptionShowPowerAlertKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBPeripheralManagerOptionShowPowerAlertKey');
end;

function CBPeripheralManagerOptionRestoreIdentifierKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBPeripheralManagerOptionRestoreIdentifierKey');
end;

function CBPeripheralManagerRestoredStateServicesKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBPeripheralManagerRestoredStateServicesKey');
end;

function CBPeripheralManagerRestoredStateAdvertisementDataKey: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBPeripheralManagerRestoredStateAdvertisementDataKey');
end;

function CBUUIDCharacteristicExtendedPropertiesString: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBUUIDCharacteristicExtendedPropertiesString');
end;

function CBUUIDCharacteristicUserDescriptionString: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBUUIDCharacteristicUserDescriptionString');
end;

function CBUUIDClientCharacteristicConfigurationString: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBUUIDClientCharacteristicConfigurationString');
end;

function CBUUIDServerCharacteristicConfigurationString: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBUUIDServerCharacteristicConfigurationString');
end;

function CBUUIDCharacteristicFormatString: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBUUIDCharacteristicFormatString');
end;

function CBUUIDCharacteristicAggregateFormatString: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBUUIDCharacteristicAggregateFormatString');
end;

function CBUUIDCharacteristicValidRangeString: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBUUIDCharacteristicValidRangeString');
end;

function CBUUIDL2CAPPSMCharacteristicString: NSString;
begin
  Result := CocoaNSStringConst(libCoreBluetooth,
    'CBUUIDL2CAPPSMCharacteristicString');
end;

function CBConnectionEventMatchingOptionServiceUUIDs: Pointer;
begin
  Result := CocoaPointerConst(libCoreBluetooth,
    'CBConnectionEventMatchingOptionServiceUUIDs');
end;

function CBConnectionEventMatchingOptionPeripheralUUIDs: Pointer;
begin
  Result := CocoaPointerConst(libCoreBluetooth,
    'CBConnectionEventMatchingOptionPeripheralUUIDs');
end;

function __AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_13_0: Pointer;
begin
  Result := CocoaPointerConst(libCoreBluetooth,
    '__AVAILABILITY_INTERNAL__IPHONE_7_0_DEP__IPHONE_13_0');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreBluetoothModule := dlopen(MarshaledAString(libCoreBluetooth), RTLD_LAZY);

finalization

dlclose(CoreBluetoothModule);
{$ENDIF IOS}

end.
