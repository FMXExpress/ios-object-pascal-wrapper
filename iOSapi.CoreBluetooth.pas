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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

const
  CBCentralManagerStateUnknown = 0;
  CBCentralManagerStateResetting = 1;
  CBCentralManagerStateUnsupported = 2;
  CBCentralManagerStateUnauthorized = 3;
  CBCentralManagerStatePoweredOff = 4;
  CBCentralManagerStatePoweredOn = 5;
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
  CBPeripheralManagerStateUnknown = 0;
  CBPeripheralManagerStateResetting = 1;
  CBPeripheralManagerStateUnsupported = 2;
  CBPeripheralManagerStateUnauthorized = 3;
  CBPeripheralManagerStatePoweredOff = 4;
  CBPeripheralManagerStatePoweredOn = 5;
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
  CBCentralManagerDelegate = interface;
  CBCentralManager = interface;
  CBMutableCharacteristic = interface;
  CBMutableDescriptor = interface;
  CBPeripheralDelegate = interface;
  CBMutableService = interface;
  CBPeripheralManagerDelegate = interface;
  CBPeripheralManager = interface;

  // ===== Framework typedefs =====
{$M+}
  NSUInteger = Cardinal;
  NSInteger = Integer;
  CBCentralManagerState = NSInteger;
  dispatch_queue_t = Pointer;
  CBCharacteristicProperties = NSUInteger;
  CBAttributePermissions = NSUInteger;
  CBError = NSInteger;
  CBATTError = NSInteger;
  CBPeripheralState = NSInteger;
  CBCharacteristicWriteType = NSInteger;
  CBPeripheralManagerAuthorizationStatus = NSInteger;
  CBPeripheralManagerState = NSInteger;
  CBPeripheralManagerConnectionLatency = NSInteger;
  CFUUIDRef = Pointer;
  // ===== Interface declarations =====

  CBPeerClass = interface(NSObjectClass)
    ['{4ECAFCA4-DBAE-41C7-92A0-ECB795876ECA}']
  end;

  CBPeer = interface(NSObject)
    ['{8DE9433A-A885-4D1F-8BDA-1627AA3F1474}']
    function identifier: NSUUID; cdecl;
  end;

  TCBPeer = class(TOCGenericImport<CBPeerClass, CBPeer>)
  end;

  PCBPeer = Pointer;

  CBCentralClass = interface(CBPeerClass)
    ['{F5F1BCCC-FF64-4D2F-9671-E5BD657F768E}']
  end;

  CBCentral = interface(CBPeer)
    ['{2B46E280-C93E-45F0-8DC9-EFA320223AE7}']
    function maximumUpdateValueLength: NSUInteger; cdecl;
  end;

  TCBCentral = class(TOCGenericImport<CBCentralClass, CBCentral>)
  end;

  PCBCentral = Pointer;

  CBAttributeClass = interface(NSObjectClass)
    ['{C4BA027C-4251-4EEC-BEF2-030D46DE10C7}']
  end;

  CBAttribute = interface(NSObject)
    ['{9C2A095D-077A-410B-90DB-067B2F3E9B9F}']
    function UUID: CBUUID; cdecl;
  end;

  TCBAttribute = class(TOCGenericImport<CBAttributeClass, CBAttribute>)
  end;

  PCBAttribute = Pointer;

  CBCharacteristicClass = interface(CBAttributeClass)
    ['{35D36D68-4F13-4300-BD2D-CD9DF14F7060}']
  end;

  CBCharacteristic = interface(CBAttribute)
    ['{3CDFBCC9-B465-416E-844B-2639D2BF4CE4}']
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
    ['{80DF44B7-1D60-4286-9DAB-3F6FFB3EADDC}']
  end;

  CBATTRequest = interface(NSObject)
    ['{5D448132-A679-4480-959F-20C3F2A7E8C5}']
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
    ['{B2060101-375C-4412-B567-FCF875A16766}']
    { class } function UUIDWithString(theString: NSString): CBUUID; cdecl;
    { class } function UUIDWithData(theData: NSData): CBUUID; cdecl;
    { class } function UUIDWithCFUUID(theUUID: CFUUIDRef): CBUUID; cdecl;
    { class } function UUIDWithNSUUID(theUUID: NSUUID): CBUUID; cdecl;
  end;

  CBUUID = interface(NSObject)
    ['{D2EFA577-ECA9-4077-B03F-4B6F7D023BE0}']
    function data: NSData; cdecl;
    function UUIDString: NSString; cdecl;
  end;

  TCBUUID = class(TOCGenericImport<CBUUIDClass, CBUUID>)
  end;

  PCBUUID = Pointer;

  CBPeripheralClass = interface(CBPeerClass)
    ['{00FE9087-0706-40C9-A5A3-DD7BD52F815B}']
  end;

  CBPeripheral = interface(CBPeer)
    ['{EAB1BBCE-3949-4564-A1E5-3A306B9726BD}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function name: NSString; cdecl;
    function RSSI: NSNumber; cdecl;
    function state: CBPeripheralState; cdecl;
    function services: NSArray; cdecl;
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
  end;

  TCBPeripheral = class(TOCGenericImport<CBPeripheralClass, CBPeripheral>)
  end;

  PCBPeripheral = Pointer;

  CBServiceClass = interface(CBAttributeClass)
    ['{186E468D-F30F-4FB4-87E1-2E2C9A838695}']
  end;

  CBService = interface(CBAttribute)
    ['{E7B17806-45C6-43F6-A80B-2E6EC45D7284}']
    function peripheral: CBPeripheral; cdecl;
    function isPrimary: Boolean; cdecl;
    function includedServices: NSArray; cdecl;
    function characteristics: NSArray; cdecl;
  end;

  TCBService = class(TOCGenericImport<CBServiceClass, CBService>)
  end;

  PCBService = Pointer;

  CBDescriptorClass = interface(CBAttributeClass)
    ['{84749F2D-66E2-4FFD-8F6A-944BC7052F8E}']
  end;

  CBDescriptor = interface(CBAttribute)
    ['{E70FBD5F-DD38-488B-9D97-9CA235A57A0B}']
    function characteristic: CBCharacteristic; cdecl;
    function value: Pointer; cdecl;
  end;

  TCBDescriptor = class(TOCGenericImport<CBDescriptorClass, CBDescriptor>)
  end;

  PCBDescriptor = Pointer;

  CBCentralManagerClass = interface(NSObjectClass)
    ['{96387365-D4E7-410D-AF69-7C6F0C0DB98F}']
  end;

  CBCentralManager = interface(NSObject)
    ['{AEA08BA3-0CD3-4434-9F73-094338541F40}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function state: CBCentralManagerState; cdecl;
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
  end;

  TCBCentralManager = class(TOCGenericImport<CBCentralManagerClass,
    CBCentralManager>)
  end;

  PCBCentralManager = Pointer;

  CBMutableCharacteristicClass = interface(CBCharacteristicClass)
    ['{5EE3FE6B-8E08-4860-8AC7-AFCE44F2FF9E}']
  end;

  CBMutableCharacteristic = interface(CBCharacteristic)
    ['{18810D12-D062-4860-A04E-B46EDD89A05C}']
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
    ['{DF08191B-5B15-4A78-8BAE-1E424A0352BF}']
  end;

  CBMutableDescriptor = interface(CBDescriptor)
    ['{9EC6851F-71F5-45FA-BEFE-B2C4C13E1CAD}']
    function initWithType(UUID: CBUUID; value: Pointer)
      : Pointer { instancetype }; cdecl;
  end;

  TCBMutableDescriptor = class(TOCGenericImport<CBMutableDescriptorClass,
    CBMutableDescriptor>)
  end;

  PCBMutableDescriptor = Pointer;

  CBMutableServiceClass = interface(CBServiceClass)
    ['{65D61F08-E9E2-490B-966B-0E0B2E4AA9C8}']
  end;

  CBMutableService = interface(CBService)
    ['{B0B5BBC2-0AEA-4122-BDDD-227B9FF082BE}']
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

  CBPeripheralManagerClass = interface(NSObjectClass)
    ['{B8A33568-B7F7-4474-8056-5B93588B8F72}']
    { class } function authorizationStatus
      : CBPeripheralManagerAuthorizationStatus; cdecl;
  end;

  CBPeripheralManager = interface(NSObject)
    ['{66B6B134-8D9D-466D-9537-65298A0A749E}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function state: CBPeripheralManagerState; cdecl;
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
  end;

  TCBPeripheralManager = class(TOCGenericImport<CBPeripheralManagerClass,
    CBPeripheralManager>)
  end;

  PCBPeripheralManager = Pointer;

  // ===== Protocol declarations =====

  CBCentralManagerDelegate = interface(IObjectiveC)
    ['{B05987B2-5C31-4D91-940F-9F87D78ADCC3}']
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
  end;

  CBPeripheralDelegate = interface(IObjectiveC)
    ['{26BD6C07-2B42-4019-AE3D-CAB99AFF7289}']
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
  end;

  CBPeripheralManagerDelegate = interface(IObjectiveC)
    ['{511FE45B-8F7C-4056-9B73-8066F05C79AC}']
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
function CBCentralManagerScanOptionAllowDuplicatesKey: NSString;
function CBCentralManagerScanOptionSolicitedServiceUUIDsKey: NSString;
function CBConnectPeripheralOptionNotifyOnConnectionKey: NSString;
function CBConnectPeripheralOptionNotifyOnDisconnectionKey: NSString;
function CBConnectPeripheralOptionNotifyOnNotificationKey: NSString;
function CBCentralManagerRestoredStatePeripheralsKey: NSString;
function CBCentralManagerRestoredStateScanServicesKey: NSString;
function CBCentralManagerRestoredStateScanOptionsKey: NSString;
function CBErrorDomain: NSString;
function CBATTErrorDomain: NSString;
function CBPeripheralManagerOptionShowPowerAlertKey: NSString;
function CBPeripheralManagerOptionRestoreIdentifierKey: NSString;
function CBPeripheralManagerRestoredStateServicesKey: NSString;
function CBPeripheralManagerRestoredStateAdvertisementDataKey: NSString;
function CBUUIDCharacteristicExtendedPropertiesString: NSString;
function CBUUIDCharacteristicUserDescriptionString: NSString;
function CBUUIDClientCharacteristicConfigurationString: NSString;
function CBUUIDServerCharacteristicConfigurationString: NSString;
function CBUUIDCharacteristicFormatString: NSString;
function CBUUIDCharacteristicAggregateFormatString: NSString;


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

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

CoreBluetoothModule := dlopen(MarshaledAString(libCoreBluetooth), RTLD_LAZY);

finalization

dlclose(CoreBluetoothModule);
{$ENDIF IOS}

end.
