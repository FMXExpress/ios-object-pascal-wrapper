{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework IOKit
//

unit iOSapi.IOKit;

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
  kIOCFSerializeToBinary = 1;
  kIODefaultMemoryType = 0;
  kIODefaultCache = 0;
  kIOInhibitCache = 1;
  kIOWriteThruCache = 2;
  kIOCopybackCache = 3;
  kIOWriteCombineCache = 4;
  kIOCopybackInnerCache = 5;
  kIOPostedWrite = 6;
  kIORealTimeCache = 7;
  kIOPostedReordered = 8;
  kIOPostedCombinedReordered = 9;
  kIOMapAnywhere = 1;
  kIOMapCacheMask = 3840;
  kIOMapCacheShift = 8;
  kIOMapDefaultCache = kIODefaultCache shl kIOMapCacheShift;
  kIOMapInhibitCache = kIOInhibitCache shl kIOMapCacheShift;
  kIOMapWriteThruCache = kIOWriteThruCache shl kIOMapCacheShift;
  kIOMapCopybackCache = kIOCopybackCache shl kIOMapCacheShift;
  kIOMapWriteCombineCache = kIOWriteCombineCache shl kIOMapCacheShift;
  kIOMapCopybackInnerCache = kIOCopybackInnerCache shl kIOMapCacheShift;
  kIOMapPostedWrite = kIOPostedWrite shl kIOMapCacheShift;
  kIOMapRealTimeCache = kIORealTimeCache shl kIOMapCacheShift;
  kIOMapPostedReordered = kIOPostedReordered shl kIOMapCacheShift;
  kIOMapPostedCombinedReordered = kIOPostedCombinedReordered shl
    kIOMapCacheShift;
  kIOMapUserOptionsMask = 4095;
  kIOMapReadOnly = 4096;
  kIOMapStatic = 16777216;
  kIOMapReference = 33554432;
  kIOMapUnique = 67108864;
  kIOMapPrefault = 268435456;
  kIOMapOverwrite = 536870912;
  kIOMapGuardedMask = 3221225472;
  kIOMapGuardedSmall = 1073741824;
  kIOMapGuardedLarge = 2147483648;
  kNanosecondScale = 1;
  kMicrosecondScale = 1000;
  kMillisecondScale = 1000 * 1000;
  kSecondScale = 1000 * 1000 * 1000;
  kTickScale = (kSecondScale / 100);
  kIOConnectMethodVarOutputSize = -3;
  kIOMaxBusStall40usec = 40000;
  kIOMaxBusStall30usec = 30000;
  kIOMaxBusStall25usec = 25000;
  kIOMaxBusStall20usec = 20000;
  kIOMaxBusStall10usec = 10000;
  kIOMaxBusStall5usec = 5000;
  kIOMaxBusStallNone = 0;
  kFirstIOKitNotificationType = 100;
  kIOServicePublishNotificationType = 100;
  kIOServiceMatchedNotificationType = 101;
  kIOServiceTerminatedNotificationType = 102;
  kIOAsyncCompletionNotificationType = 150;
  kIOServiceMessageNotificationType = 160;
  kLastIOKitNotificationType = 199;
  kIOKitNoticationTypeMask = 4095;
  kIOKitNoticationTypeSizeAdjShift = 30;
  kIOKitNoticationMsgSizeMask = 3;
  kOSNotificationMessageID = 53;
  kOSAsyncCompleteMessageID = 57;
  kMaxAsyncArgs = 16;
  kIOAsyncReservedIndex = 0;
  kIOAsyncReservedCount = 1;
  kIOAsyncCalloutFuncIndex = kIOAsyncReservedCount;
  kIOAsyncCalloutRefconIndex = 2;
  kIOAsyncCalloutCount = 3;
  kIOMatchingCalloutFuncIndex = kIOAsyncReservedCount;
  kIOMatchingCalloutRefconIndex = 2;
  kIOMatchingCalloutCount = 3;
  kIOInterestCalloutFuncIndex = kIOAsyncReservedCount;
  kIOInterestCalloutRefconIndex = 2;
  kIOInterestCalloutServiceIndex = 3;
  kIOInterestCalloutCount = 4;
  kOSAsyncRef64Count = 8;
  kOSAsyncRef64Size = kOSAsyncRef64Count *
    (Integer(SizeOf(io_user_reference_t)));
  kOSAsyncRefCount = 8;
  kOSAsyncRefSize = 32;
  kIOServiceInteractionAllowed = 1;
  kIORegistryIterateRecursively = 1;
  kIORegistryIterateParents = 2;

type
  // ===== Framework typedefs =====
{$M+}
  CFTypeRef = Pointer;
  PCFTypeRef = ^CFTypeRef;
  CFOptionFlags = LongWord;
  PCFOptionFlags = ^CFOptionFlags;

  CFDataRef = Pointer;
  PCFDataRef = ^CFDataRef;
  CFAllocatorRef = Pointer;
  PCFAllocatorRef = ^CFAllocatorRef;
  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  kern_return_t = Integer;
  Pkern_return_t = ^kern_return_t;

  IOReturn = kern_return_t;
  PIOReturn = ^IOReturn;

  _IODataQueueEntry = record
    size: UInt32;
    data: array [0 .. 3] of Byte;
  end;

  P_IODataQueueEntry = ^_IODataQueueEntry;
  IODataQueueEntry = _IODataQueueEntry;
  PIODataQueueEntry = ^IODataQueueEntry;

  _IODataQueueMemory = record
    queueSize: UInt32;
    head: UInt32;
    tail: UInt32;
    queue: array [0 .. 0] of IODataQueueEntry;
  end;

  P_IODataQueueMemory = ^_IODataQueueMemory;
  IODataQueueMemory = _IODataQueueMemory;
  PIODataQueueMemory = ^IODataQueueMemory;

  mach_msg_bits_t = Cardinal;
  Pmach_msg_bits_t = ^mach_msg_bits_t;

  __darwin_natural_t = Cardinal;
  P__darwin_natural_t = ^__darwin_natural_t;

  natural_t = __darwin_natural_t;
  Pnatural_t = ^natural_t;
  mach_msg_size_t = natural_t;
  Pmach_msg_size_t = ^mach_msg_size_t;
  __darwin_mach_port_name_t = __darwin_natural_t;
  P__darwin_mach_port_name_t = ^__darwin_mach_port_name_t;
  __darwin_mach_port_t = __darwin_mach_port_name_t;
  P__darwin_mach_port_t = ^__darwin_mach_port_t;
  mach_port_t = __darwin_mach_port_t;
  Pmach_port_t = ^mach_port_t;
  mach_port_name_t = natural_t;
  Pmach_port_name_t = ^mach_port_name_t;
  integer_t = Integer;
  Pinteger_t = ^integer_t;

  mach_msg_id_t = integer_t;
  Pmach_msg_id_t = ^mach_msg_id_t;

  mach_msg_header_t = record
    msgh_bits: mach_msg_bits_t;
    msgh_size: mach_msg_size_t;
    msgh_remote_port: mach_port_t;
    msgh_local_port: mach_port_t;
    msgh_voucher_port: mach_port_name_t;
    msgh_id: mach_msg_id_t;
  end;

  Pmach_msg_header_t = ^mach_msg_header_t;

  _IODataQueueAppendix = record
    version: UInt32;
    msgh: mach_msg_header_t;
  end;

  P_IODataQueueAppendix = ^_IODataQueueAppendix;
  IODataQueueAppendix = _IODataQueueAppendix;
  PIODataQueueAppendix = ^IODataQueueAppendix;

  Boolean = Byte;
  PBoolean = ^Boolean;

  IOOptionBits = UInt32;
  PIOOptionBits = ^IOOptionBits;
  IOFixed = Int32;
  PIOFixed = ^IOFixed;
  IOVersion = UInt32;
  PIOVersion = ^IOVersion;
  IOItemCount = UInt32;
  PIOItemCount = ^IOItemCount;
  IOCacheMode = UInt32;
  PIOCacheMode = ^IOCacheMode;
  IOByteCount32 = UInt32;
  PIOByteCount32 = ^IOByteCount32;
  IOByteCount64 = UInt64;
  PIOByteCount64 = ^IOByteCount64;
  IOPhysicalAddress32 = UInt32;
  PIOPhysicalAddress32 = ^IOPhysicalAddress32;
  IOPhysicalAddress64 = UInt64;
  PIOPhysicalAddress64 = ^IOPhysicalAddress64;
  IOPhysicalLength32 = UInt32;
  PIOPhysicalLength32 = ^IOPhysicalLength32;
  IOPhysicalLength64 = UInt64;
  PIOPhysicalLength64 = ^IOPhysicalLength64;
  vm_offset_t = natural_t;
  Pvm_offset_t = ^vm_offset_t;
  vm_address_t = vm_offset_t;
  Pvm_address_t = ^vm_address_t;
  IOVirtualAddress = vm_address_t;
  PIOVirtualAddress = ^IOVirtualAddress;
  IOByteCount = IOByteCount32;
  PIOByteCount = ^IOByteCount;
  IOLogicalAddress = IOVirtualAddress;
  PIOLogicalAddress = ^IOLogicalAddress;
  IOPhysicalAddress = IOPhysicalAddress32;
  PIOPhysicalAddress = ^IOPhysicalAddress;
  IOPhysicalLength = IOPhysicalLength32;
  PIOPhysicalLength = ^IOPhysicalLength;

  IOPhysicalRange = record
    address: IOPhysicalAddress;
    length: IOByteCount;
  end;

  PIOPhysicalRange = ^IOPhysicalRange;

  IOVirtualRange = record
    address: IOVirtualAddress;
    length: IOByteCount;
  end;

  PIOVirtualRange = ^IOVirtualRange;

  mach_vm_address_t = LongWord;
  Pmach_vm_address_t = ^mach_vm_address_t;
  mach_vm_size_t = LongWord;
  Pmach_vm_size_t = ^mach_vm_size_t;

  IOAddressRange = record
    address: mach_vm_address_t;
    length: mach_vm_size_t;
  end;

  PIOAddressRange = ^IOAddressRange;

  IONamedValue = record
    value: Integer;
    name: MarshaledAString;
  end;

  PIONamedValue = ^IONamedValue;

  IOAlignment = Cardinal;
  PIOAlignment = ^IOAlignment;

  io_object_t = mach_port_t;
  Pio_object_t = ^io_object_t;
  io_connect_t = io_object_t;
  Pio_connect_t = ^io_connect_t;
  io_enumerator_t = io_object_t;
  Pio_enumerator_t = ^io_enumerator_t;
  io_ident_t = io_object_t;
  Pio_ident_t = ^io_ident_t;
  io_iterator_t = io_object_t;
  Pio_iterator_t = ^io_iterator_t;
  io_registry_entry_t = io_object_t;
  Pio_registry_entry_t = ^io_registry_entry_t;
  io_service_t = io_object_t;
  Pio_service_t = ^io_service_t;
  uext_object_t = io_object_t;
  Puext_object_t = ^uext_object_t;
  IODeviceNumber = Cardinal;
  PIODeviceNumber = ^IODeviceNumber;

  io_user_reference_t = natural_t;
  Pio_user_reference_t = ^io_user_reference_t;
  OSAsyncReference64 = array [0 .. 7] of io_user_reference_t;
  POSAsyncReference64 = ^OSAsyncReference64;
  OSAsyncReference = array [0 .. 7] of natural_t;
  POSAsyncReference = ^OSAsyncReference;

  OSNotificationHeader = record
    size: mach_msg_size_t;
    &type: natural_t;
    reference: OSAsyncReference;
    content: ^Byte;
  end;

  POSNotificationHeader = ^OSNotificationHeader;

  IOServiceInterestContent = record
    messageType: natural_t;
    messageArgument: array [0 .. 0] of Pointer;
  end;

  PIOServiceInterestContent = ^IOServiceInterestContent;

  IOAsyncCompletionContent = record
    result: IOReturn;
    args: ^Pointer;
  end;

  PIOAsyncCompletionContent = ^IOAsyncCompletionContent;

  IONotificationPortRef = Pointer;
  PIONotificationPortRef = ^IONotificationPortRef;
  IOServiceMatchingCallback = procedure(param1: Pointer;
    param2: io_iterator_t); cdecl;
  PIOServiceMatchingCallback = ^IOServiceMatchingCallback;
  IOServiceInterestCallback = procedure(param1: Pointer; param2: io_service_t;
    param3: LongWord; param4: Pointer); cdecl;
  PIOServiceInterestCallback = ^IOServiceInterestCallback;
  CFRunLoopSourceRef = Pointer;
  PCFRunLoopSourceRef = ^CFRunLoopSourceRef;
  dispatch_queue_t = Pointer;
  Pdispatch_queue_t = ^dispatch_queue_t;
  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  CFDictionaryRef = Pointer;
  PCFDictionaryRef = ^CFDictionaryRef;
  uintptr_t = LongWord;
  Puintptr_t = ^uintptr_t;

  task_t = mach_port_t;
  Ptask_t = ^task_t;
  task_port_t = task_t;
  Ptask_port_t = ^task_port_t;
  CFMutableDictionaryRef = Pointer;
  PCFMutableDictionaryRef = ^CFMutableDictionaryRef;
  IOAsyncCallback0 = procedure(param1: Pointer; param2: IOReturn); cdecl;
  PIOAsyncCallback0 = ^IOAsyncCallback0;
  IOAsyncCallback1 = procedure(param1: Pointer; param2: IOReturn;
    param3: Pointer); cdecl;
  PIOAsyncCallback1 = ^IOAsyncCallback1;
  IOAsyncCallback2 = procedure(param1: Pointer; param2: IOReturn;
    param3: Pointer; param4: Pointer); cdecl;
  PIOAsyncCallback2 = ^IOAsyncCallback2;
  IOAsyncCallback = procedure(param1: Pointer; param2: IOReturn;
    param3: Pointer; param4: LongWord); cdecl;
  PIOAsyncCallback = ^IOAsyncCallback;

  IOObject = record
  end;

  PIOObject = ^IOObject;

  IOMessage = UInt32;
  PIOMessage = ^IOMessage;
  // ===== Exported string consts =====

function kIOMainPortDefault: Pointer;
function kIOMasterPortDefault: Pointer;


// ===== External functions =====

const
  libIOKit = '/System/Library/Frameworks/IOKit.framework/IOKit';
function IOCFSerialize(&object: CFTypeRef; options: CFOptionFlags): CFDataRef;
  cdecl; external libIOKit name _PU + 'IOCFSerialize';
function IOCFUnserialize(buffer: MarshaledAString; allocator: CFAllocatorRef;
  options: CFOptionFlags; errorString: Pointer): CFTypeRef; cdecl;
  external libIOKit name _PU + 'IOCFUnserialize';
function IOCFUnserializeBinary(buffer: MarshaledAString; bufferSize: LongWord;
  allocator: CFAllocatorRef; options: CFOptionFlags; errorString: Pointer)
  : CFTypeRef; cdecl; external libIOKit name _PU + 'IOCFUnserializeBinary';
function IOCFUnserializeWithSize(buffer: MarshaledAString; bufferSize: LongWord;
  allocator: CFAllocatorRef; options: CFOptionFlags; errorString: Pointer)
  : CFTypeRef; cdecl; external libIOKit name _PU + 'IOCFUnserializeWithSize';
function IODataQueueDataAvailable(dataQueue: Pointer): Boolean; cdecl;
  external libIOKit name _PU + 'IODataQueueDataAvailable';
function IODataQueuePeek(dataQueue: Pointer): Pointer; cdecl;
  external libIOKit name _PU + 'IODataQueuePeek';
function IODataQueueDequeue(dataQueue: Pointer; data: Pointer;
  dataSize: PLongWord): IOReturn; cdecl;
  external libIOKit name _PU + 'IODataQueueDequeue';
function IODataQueueWaitForAvailableData(dataQueue: Pointer;
  notificationPort: mach_port_t): IOReturn; cdecl;
  external libIOKit name _PU + 'IODataQueueWaitForAvailableData';
function IODataQueueAllocateNotificationPort: mach_port_t; cdecl;
  external libIOKit name _PU + 'IODataQueueAllocateNotificationPort';
function IODataQueueEnqueue(dataQueue: Pointer; data: Pointer;
  dataSize: LongWord): IOReturn; cdecl;
  external libIOKit name _PU + 'IODataQueueEnqueue';
function IODataQueueSetNotificationPort(dataQueue: Pointer;
  notifyPort: mach_port_t): IOReturn; cdecl;
  external libIOKit name _PU + 'IODataQueueSetNotificationPort';
function IOMainPort(bootstrapPort: mach_port_t; mainPort: Pmach_port_t)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOMainPort';
function IOMasterPort(bootstrapPort: mach_port_t; mainPort: Pmach_port_t)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOMasterPort';
function IONotificationPortCreate(mainPort: mach_port_t): IONotificationPortRef;
  cdecl; external libIOKit name _PU + 'IONotificationPortCreate';
procedure IONotificationPortDestroy(notify: IONotificationPortRef); cdecl;
  external libIOKit name _PU + 'IONotificationPortDestroy';
function IONotificationPortGetRunLoopSource(notify: IONotificationPortRef)
  : CFRunLoopSourceRef; cdecl;
  external libIOKit name _PU + 'IONotificationPortGetRunLoopSource';
function IONotificationPortGetMachPort(notify: IONotificationPortRef)
  : mach_port_t; cdecl;
  external libIOKit name _PU + 'IONotificationPortGetMachPort';
function IONotificationPortSetImportanceReceiver(notify: IONotificationPortRef)
  : kern_return_t; cdecl;
  external libIOKit name _PU + 'IONotificationPortSetImportanceReceiver';
procedure IONotificationPortSetDispatchQueue(notify: IONotificationPortRef;
  queue: dispatch_queue_t); cdecl;
  external libIOKit name _PU + 'IONotificationPortSetDispatchQueue';
procedure IODispatchCalloutFromMessage(unused: Pointer; msg: Pmach_msg_header_t;
  reference: Pointer); cdecl;
  external libIOKit name _PU + 'IODispatchCalloutFromMessage';
function IOCreateReceivePort(msgType: LongWord; recvPort: Pmach_port_t)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOCreateReceivePort';
function IOObjectRelease(&object: io_object_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOObjectRelease';
function IOObjectRetain(&object: io_object_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOObjectRetain';
function IOObjectGetClass(&object: io_object_t; className: Byte): kern_return_t;
  cdecl; external libIOKit name _PU + 'IOObjectGetClass';
function IOObjectCopyClass(&object: io_object_t): CFStringRef; cdecl;
  external libIOKit name _PU + 'IOObjectCopyClass';
function IOObjectCopySuperclassForClass(className: CFStringRef): CFStringRef;
  cdecl; external libIOKit name _PU + 'IOObjectCopySuperclassForClass';
function IOObjectCopyBundleIdentifierForClass(className: CFStringRef)
  : CFStringRef; cdecl;
  external libIOKit name _PU + 'IOObjectCopyBundleIdentifierForClass';
function IOObjectConformsTo(&object: io_object_t; className: Byte): Integer;
  cdecl; external libIOKit name _PU + 'IOObjectConformsTo';
function IOObjectIsEqualTo(&object: io_object_t; anObject: io_object_t)
  : Integer; cdecl; external libIOKit name _PU + 'IOObjectIsEqualTo';
function IOObjectGetKernelRetainCount(&object: io_object_t): LongWord; cdecl;
  external libIOKit name _PU + 'IOObjectGetKernelRetainCount';
function IOObjectGetUserRetainCount(&object: io_object_t): LongWord; cdecl;
  external libIOKit name _PU + 'IOObjectGetUserRetainCount';
function IOObjectGetRetainCount(&object: io_object_t): LongWord; cdecl;
  external libIOKit name _PU + 'IOObjectGetRetainCount';
function IOIteratorNext(iterator: io_iterator_t): io_object_t; cdecl;
  external libIOKit name _PU + 'IOIteratorNext';
procedure IOIteratorReset(iterator: io_iterator_t); cdecl;
  external libIOKit name _PU + 'IOIteratorReset';
function IOIteratorIsValid(iterator: io_iterator_t): Integer; cdecl;
  external libIOKit name _PU + 'IOIteratorIsValid';
function IOServiceGetMatchingService(mainPort: mach_port_t;
  matching: CFDictionaryRef): io_service_t; cdecl;
  external libIOKit name _PU + 'IOServiceGetMatchingService';
function IOServiceGetMatchingServices(mainPort: mach_port_t;
  matching: CFDictionaryRef; existing: Pio_iterator_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOServiceGetMatchingServices';
function IOServiceAddNotification(mainPort: mach_port_t; notificationType: Byte;
  matching: CFDictionaryRef; wakePort: mach_port_t; reference: uintptr_t;
  notification: Pio_iterator_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOServiceAddNotification';
function IOServiceAddMatchingNotification(notifyPort: IONotificationPortRef;
  notificationType: Byte; matching: CFDictionaryRef;
  callback: IOServiceMatchingCallback; refCon: Pointer;
  notification: Pio_iterator_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOServiceAddMatchingNotification';
function IOServiceAddInterestNotification(notifyPort: IONotificationPortRef;
  service: io_service_t; interestType: Byte;
  callback: IOServiceInterestCallback; refCon: Pointer;
  notification: Pio_object_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOServiceAddInterestNotification';
function IOServiceMatchPropertyTable(service: io_service_t;
  matching: CFDictionaryRef; matches: PInteger): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOServiceMatchPropertyTable';
function IOServiceGetBusyState(service: io_service_t; busyState: PLongWord)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOServiceGetBusyState';
function IOServiceWaitQuiet(service: io_service_t; waitTime: Pointer)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOServiceWaitQuiet';
function IOKitGetBusyState(mainPort: mach_port_t; busyState: PLongWord)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOKitGetBusyState';
function IOKitWaitQuietWithOptions(mainPort: mach_port_t; waitTime: Pointer;
  options: IOOptionBits): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOKitWaitQuietWithOptions';
function IOKitWaitQuiet(mainPort: mach_port_t; waitTime: Pointer)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOKitWaitQuiet';
function IOServiceOpen(service: io_service_t; owningTask: task_port_t;
  &type: LongWord; connect: Pio_connect_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOServiceOpen';
function IOServiceRequestProbe(service: io_service_t; options: LongWord)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOServiceRequestProbe';
function IOServiceAuthorize(service: io_service_t; options: LongWord)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOServiceAuthorize';
function IOServiceOpenAsFileDescriptor(service: io_service_t; oflag: Integer)
  : Integer; cdecl; external libIOKit name _PU +
  'IOServiceOpenAsFileDescriptor';
function IOServiceClose(connect: io_connect_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOServiceClose';
function IOConnectAddRef(connect: io_connect_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectAddRef';
function IOConnectRelease(connect: io_connect_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectRelease';
function IOConnectGetService(connect: io_connect_t; service: Pio_service_t)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOConnectGetService';
function IOConnectSetNotificationPort(connect: io_connect_t; &type: LongWord;
  port: mach_port_t; reference: uintptr_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectSetNotificationPort';
function IOConnectMapMemory(connect: io_connect_t; memoryType: LongWord;
  intoTask: task_port_t; atAddress: Pvm_address_t; ofSize: Pnatural_t;
  options: IOOptionBits): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectMapMemory';
function IOConnectMapMemory64(connect: io_connect_t; memoryType: LongWord;
  intoTask: task_port_t; atAddress: Pmach_vm_address_t; ofSize: Pmach_vm_size_t;
  options: IOOptionBits): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectMapMemory64';
function IOConnectUnmapMemory(connect: io_connect_t; memoryType: LongWord;
  fromTask: task_port_t; atAddress: vm_address_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectUnmapMemory';
function IOConnectUnmapMemory64(connect: io_connect_t; memoryType: LongWord;
  fromTask: task_port_t; atAddress: mach_vm_address_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectUnmapMemory64';
function IOConnectSetCFProperties(connect: io_connect_t; properties: CFTypeRef)
  : kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectSetCFProperties';
function IOConnectSetCFProperty(connect: io_connect_t;
  propertyName: CFStringRef; &property: CFTypeRef): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectSetCFProperty';
function IOConnectCallMethod(connection: mach_port_t; selector: LongWord;
  input: PUInt64; inputCnt: LongWord; inputStruct: Pointer;
  inputStructCnt: LongWord; output: PUInt64; outputCnt: PLongWord;
  outputStruct: Pointer; outputStructCnt: PLongWord): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectCallMethod';
function IOConnectCallAsyncMethod(connection: mach_port_t; selector: LongWord;
  wake_port: mach_port_t; reference: PUInt64; referenceCnt: LongWord;
  input: PUInt64; inputCnt: LongWord; inputStruct: Pointer;
  inputStructCnt: LongWord; output: PUInt64; outputCnt: PLongWord;
  outputStruct: Pointer; outputStructCnt: PLongWord): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectCallAsyncMethod';
function IOConnectCallStructMethod(connection: mach_port_t; selector: LongWord;
  inputStruct: Pointer; inputStructCnt: LongWord; outputStruct: Pointer;
  outputStructCnt: PLongWord): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectCallStructMethod';
function IOConnectCallAsyncStructMethod(connection: mach_port_t;
  selector: LongWord; wake_port: mach_port_t; reference: PUInt64;
  referenceCnt: LongWord; inputStruct: Pointer; inputStructCnt: LongWord;
  outputStruct: Pointer; outputStructCnt: PLongWord): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectCallAsyncStructMethod';
function IOConnectCallScalarMethod(connection: mach_port_t; selector: LongWord;
  input: PUInt64; inputCnt: LongWord; output: PUInt64; outputCnt: PLongWord)
  : kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectCallScalarMethod';
function IOConnectCallAsyncScalarMethod(connection: mach_port_t;
  selector: LongWord; wake_port: mach_port_t; reference: PUInt64;
  referenceCnt: LongWord; input: PUInt64; inputCnt: LongWord; output: PUInt64;
  outputCnt: PLongWord): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectCallAsyncScalarMethod';
function IOConnectTrap0(connect: io_connect_t; index: LongWord): kern_return_t;
  cdecl; external libIOKit name _PU + 'IOConnectTrap0';
function IOConnectTrap1(connect: io_connect_t; index: LongWord; p1: uintptr_t)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOConnectTrap1';
function IOConnectTrap2(connect: io_connect_t; index: LongWord; p1: uintptr_t;
  p2: uintptr_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectTrap2';
function IOConnectTrap3(connect: io_connect_t; index: LongWord; p1: uintptr_t;
  p2: uintptr_t; p3: uintptr_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectTrap3';
function IOConnectTrap4(connect: io_connect_t; index: LongWord; p1: uintptr_t;
  p2: uintptr_t; p3: uintptr_t; p4: uintptr_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectTrap4';
function IOConnectTrap5(connect: io_connect_t; index: LongWord; p1: uintptr_t;
  p2: uintptr_t; p3: uintptr_t; p4: uintptr_t; p5: uintptr_t): kern_return_t;
  cdecl; external libIOKit name _PU + 'IOConnectTrap5';
function IOConnectTrap6(connect: io_connect_t; index: LongWord; p1: uintptr_t;
  p2: uintptr_t; p3: uintptr_t; p4: uintptr_t; p5: uintptr_t; p6: uintptr_t)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOConnectTrap6';
function IOConnectAddClient(connect: io_connect_t; client: io_connect_t)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOConnectAddClient';
function IORegistryGetRootEntry(mainPort: mach_port_t): io_registry_entry_t;
  cdecl; external libIOKit name _PU + 'IORegistryGetRootEntry';
function IORegistryEntryFromPath(mainPort: mach_port_t; path: Byte)
  : io_registry_entry_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntryFromPath';
function IORegistryEntryCopyFromPath(mainPort: mach_port_t; path: CFStringRef)
  : io_registry_entry_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntryCopyFromPath';
function IORegistryCreateIterator(mainPort: mach_port_t; plane: Byte;
  options: IOOptionBits; iterator: Pio_iterator_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryCreateIterator';
function IORegistryEntryCreateIterator(entry: io_registry_entry_t; plane: Byte;
  options: IOOptionBits; iterator: Pio_iterator_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntryCreateIterator';
function IORegistryIteratorEnterEntry(iterator: io_iterator_t): kern_return_t;
  cdecl; external libIOKit name _PU + 'IORegistryIteratorEnterEntry';
function IORegistryIteratorExitEntry(iterator: io_iterator_t): kern_return_t;
  cdecl; external libIOKit name _PU + 'IORegistryIteratorExitEntry';
function IORegistryEntryGetName(entry: io_registry_entry_t; name: Byte)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IORegistryEntryGetName';
function IORegistryEntryGetNameInPlane(entry: io_registry_entry_t; plane: Byte;
  name: Byte): kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntryGetNameInPlane';
function IORegistryEntryGetLocationInPlane(entry: io_registry_entry_t;
  plane: Byte; location: Byte): kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntryGetLocationInPlane';
function IORegistryEntryGetPath(entry: io_registry_entry_t; plane: Byte;
  path: Byte): kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntryGetPath';
function IORegistryEntryCopyPath(entry: io_registry_entry_t; plane: Byte)
  : CFStringRef; cdecl; external libIOKit name _PU + 'IORegistryEntryCopyPath';
function IORegistryEntryGetRegistryEntryID(entry: io_registry_entry_t;
  entryID: PUInt64): kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntryGetRegistryEntryID';
function IORegistryEntryCreateCFProperties(entry: io_registry_entry_t;
  properties: Pointer; allocator: CFAllocatorRef; options: IOOptionBits)
  : kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntryCreateCFProperties';
function IORegistryEntryCreateCFProperty(entry: io_registry_entry_t;
  key: CFStringRef; allocator: CFAllocatorRef; options: IOOptionBits)
  : CFTypeRef; cdecl; external libIOKit name _PU +
  'IORegistryEntryCreateCFProperty';
function IORegistryEntrySearchCFProperty(entry: io_registry_entry_t;
  plane: Byte; key: CFStringRef; allocator: CFAllocatorRef;
  options: IOOptionBits): CFTypeRef; cdecl;
  external libIOKit name _PU + 'IORegistryEntrySearchCFProperty';
function IORegistryEntryGetProperty(entry: io_registry_entry_t;
  propertyName: Byte; buffer: Byte; size: PLongWord): kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntryGetProperty';
function IORegistryEntrySetCFProperties(entry: io_registry_entry_t;
  properties: CFTypeRef): kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntrySetCFProperties';
function IORegistryEntrySetCFProperty(entry: io_registry_entry_t;
  propertyName: CFStringRef; &property: CFTypeRef): kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntrySetCFProperty';
function IORegistryEntryGetChildIterator(entry: io_registry_entry_t;
  plane: Byte; iterator: Pio_iterator_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntryGetChildIterator';
function IORegistryEntryGetChildEntry(entry: io_registry_entry_t; plane: Byte;
  child: Pio_registry_entry_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntryGetChildEntry';
function IORegistryEntryGetParentIterator(entry: io_registry_entry_t;
  plane: Byte; iterator: Pio_iterator_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntryGetParentIterator';
function IORegistryEntryGetParentEntry(entry: io_registry_entry_t; plane: Byte;
  parent: Pio_registry_entry_t): kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryEntryGetParentEntry';
function IORegistryEntryInPlane(entry: io_registry_entry_t; plane: Byte)
  : Integer; cdecl; external libIOKit name _PU + 'IORegistryEntryInPlane';
function IOServiceMatching(name: MarshaledAString): CFMutableDictionaryRef;
  cdecl; external libIOKit name _PU + 'IOServiceMatching';
function IOServiceNameMatching(name: MarshaledAString): CFMutableDictionaryRef;
  cdecl; external libIOKit name _PU + 'IOServiceNameMatching';
function IOBSDNameMatching(mainPort: mach_port_t; options: LongWord;
  bsdName: MarshaledAString): CFMutableDictionaryRef; cdecl;
  external libIOKit name _PU + 'IOBSDNameMatching';
function IOOpenFirmwarePathMatching(mainPort: mach_port_t; options: LongWord;
  path: MarshaledAString): CFMutableDictionaryRef; cdecl;
  external libIOKit name _PU + 'IOOpenFirmwarePathMatching';
function IORegistryEntryIDMatching(entryID: UInt64): CFMutableDictionaryRef;
  cdecl; external libIOKit name _PU + 'IORegistryEntryIDMatching';
function IOServiceOFPathToBSDName(mainPort: mach_port_t; openFirmwarePath: Byte;
  bsdName: Byte): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOServiceOFPathToBSDName';
function OSGetNotificationFromMessage(msg: Pmach_msg_header_t; index: LongWord;
  &type: PLongWord; reference: Puintptr_t; content: Pointer; size: Pnatural_t)
  : kern_return_t; cdecl;
  external libIOKit name _PU + 'OSGetNotificationFromMessage';
function IOCatalogueSendData(mainPort: mach_port_t; flag: LongWord;
  buffer: MarshaledAString; size: LongWord): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOCatalogueSendData';
function IOCatalogueTerminate(mainPort: mach_port_t; flag: LongWord;
  description: Byte): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOCatalogueTerminate';
function IOCatalogueGetData(mainPort: mach_port_t; flag: LongWord;
  buffer: MarshaledAString; size: PLongWord): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOCatalogueGetData';
function IOCatalogueModuleLoaded(mainPort: mach_port_t; name: Byte)
  : kern_return_t; cdecl;
  external libIOKit name _PU + 'IOCatalogueModuleLoaded';
function IOCatalogueReset(mainPort: mach_port_t; flag: LongWord): kern_return_t;
  cdecl; external libIOKit name _PU + 'IOCatalogueReset';
function IORegistryDisposeEnumerator(enumerator: io_enumerator_t)
  : kern_return_t; cdecl;
  external libIOKit name _PU + 'IORegistryDisposeEnumerator';
function IOMapMemory(connect: io_connect_t; memoryType: LongWord;
  intoTask: task_port_t; atAddress: Pvm_address_t; ofSize: Pnatural_t;
  flags: LongWord): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOMapMemory';
function IOCompatibiltyNumber(connect: mach_port_t; objectNumber: PLongWord)
  : kern_return_t; cdecl; external libIOKit name _PU + 'IOCompatibiltyNumber';
function IOConnectMethodScalarIScalarO(connect: io_connect_t; index: LongWord;
  scalarInputCount: IOItemCount; scalarOutputCount: IOItemCount): kern_return_t;
  cdecl; external libIOKit name _PU + 'IOConnectMethodScalarIScalarO';
function IOConnectMethodScalarIStructureO(connect: io_connect_t;
  index: LongWord; scalarInputCount: IOItemCount; structureSize: PIOByteCount)
  : kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectMethodScalarIStructureO';
function IOConnectMethodScalarIStructureI(connect: io_connect_t;
  index: LongWord; scalarInputCount: IOItemCount; structureSize: IOByteCount)
  : kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectMethodScalarIStructureI';
function IOConnectMethodStructureIStructureO(connect: io_connect_t;
  index: LongWord; structureInputSize: IOItemCount;
  structureOutputSize: PIOByteCount; inputStructure: Pointer;
  ouputStructure: Pointer): kern_return_t; cdecl;
  external libIOKit name _PU + 'IOConnectMethodStructureIStructureO';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  IOKitModule: THandle;

{$ENDIF IOS}

function kIOMainPortDefault: Pointer;
begin
  result := CocoaPointerConst(libIOKit, 'kIOMainPortDefault');
end;

function kIOMasterPortDefault: Pointer;
begin
  result := CocoaPointerConst(libIOKit, 'kIOMasterPortDefault');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

IOKitModule := dlopen(MarshaledAString(libIOKit), RTLD_LAZY);

finalization

dlclose(IOKitModule);
{$ENDIF IOS}

end.
