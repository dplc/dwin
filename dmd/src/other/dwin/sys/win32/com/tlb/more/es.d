// EventSystem 1.0 Type Library
// Version 1.0

/*[uuid("4e14fb90-2e22-11d1-9964-00c04fbbb345")]*/
//module dwin.sys.win32.com.tlb.more.eventsystem;
module dwin.sys.win32.com.tlb.more.es;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum __MIDL_IEventObjectChange_0001 {
  EOC_NewObject = 0x00000000,
  EOC_ModifiedObject = 0x00000001,
  EOC_DeletedObject = 0x00000002,
}

// Structs

struct __MIDL___MIDL_itf_ESTlb_0267_0001 {
  uint cbSize;
  EOC_ChangeType changeType;
  wchar* objectID;
  wchar* partitionId;
  wchar* applicationId;
  DWINGUID[10] reserved;
}

// Aliases

alias __MIDL_IEventObjectChange_0001 EOC_ChangeType;

alias __MIDL___MIDL_itf_ESTlb_0267_0001 COMEVENTSYSCHANGEINFO;

// Interfaces

// IEnumEventObject Interface
interface IEnumEventObject : IUnknown {
  mixin(uuid("f4a07d63-2e25-11d1-9964-00c04fbbb345"));
  // static DWINGUID IID = { 0xf4a07d63, 0x2e25, 0x11d1, 0x99, 0x64, 0x00, 0xc0, 0x4f, 0xbb, 0xb3, 0x45 };
  // method Clone
  /*[id(0x00000001)]*/ int Clone(out IEnumEventObject ppInterface);
  // method Next
  /*[id(0x00000003)]*/ int Next(uint cReqElem, out IUnknown ppInterface, out uint cRetElem);
  // method Reset
  /*[id(0x00000004)]*/ int Reset();
  // method Skip
  /*[id(0x00000005)]*/ int Skip(uint cSkipElem);
}

// IEventObjectCollection Interface
interface IEventObjectCollection : IDispatch {
  mixin(uuid("f89ac270-d4eb-11d1-b682-00805fc79216"));
  // static DWINGUID IID = { 0xf89ac270, 0xd4eb, 0x11d1, 0xb6, 0x82, 0x00, 0x80, 0x5f, 0xc7, 0x92, 0x16 };
  // Create new IEnumVARIANT
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppUnkEnum);
  /*[id(0x00000000)]*/ int get_Item(wchar* objectID, out DWINVARIANT pItem);
  // Create new IEnumEventObject
  /*[id(0x00000001)]*/ int get_NewEnum(out IEnumEventObject ppEnum);
  // Number of items in the collection
  /*[id(0x00000002)]*/ int get_Count(out int pCount);
  // Add an item to the collection
  /*[id(0x00000003)]*/ int Add(DWINVARIANT* Item, wchar* objectID);
  // Remove an item from the collection
  /*[id(0x00000004)]*/ int Remove(wchar* objectID);
}

// IEventControl Interface
interface IEventControl : IDispatch {
  mixin(uuid("0343e2f4-86f6-11d1-b760-00c04fb926af"));
  // static DWINGUID IID = { 0x0343e2f4, 0x86f6, 0x11d1, 0xb7, 0x60, 0x00, 0xc0, 0x4f, 0xb9, 0x26, 0xaf };
  // method SetPublisherFilter
  /*[id(0x00000001)]*/ int SetPublisherFilter(wchar* methodName, IPublisherFilter pPublisherFilter);
  // property AllowInprocActivation
  /*[id(0x00000002)]*/ int get_AllowInprocActivation(out int pfAllowInprocActivation);
  // property AllowInprocActivation
  /*[id(0x00000002)]*/ int set_AllowInprocActivation(int pfAllowInprocActivation);
  // Get a self-updating collection of subscriptions to a given method
  /*[id(0x00000003)]*/ int GetSubscriptions(wchar* methodName, wchar* optionalCriteria, int* optionalErrorIndex, out IEventObjectCollection ppCollection);
  // Establish the default query to use when not filtering
  /*[id(0x00000004)]*/ int SetDefaultQuery(wchar* methodName, wchar* criteria, out int errorIndex);
}

// IPublisherFilter Interface
interface IPublisherFilter : IUnknown {
  mixin(uuid("465e5cc0-7b26-11d1-88fb-0080c7d771bf"));
  // static DWINGUID IID = { 0x465e5cc0, 0x7b26, 0x11d1, 0x88, 0xfb, 0x00, 0x80, 0xc7, 0xd7, 0x71, 0xbf };
  // User-called method to initialize the publisher filter after it is installed
  /*[id(0x60010000)]*/ int Initialize(wchar* methodName, IDispatch dispUserDefined);
  // Prepare to fire all subscriptions in your collection
  /*[id(0x60010001)]*/ int PrepareToFire(wchar* methodName, IFiringControl firingControl);
}

// IFiringControl Interface
interface IFiringControl : IDispatch {
  mixin(uuid("e0498c93-4efe-11d1-9971-00c04fbbb345"));
  // static DWINGUID IID = { 0xe0498c93, 0x4efe, 0x11d1, 0x99, 0x71, 0x00, 0xc0, 0x4f, 0xbb, 0xb3, 0x45 };
  // Fire a single subscription
  /*[id(0x00000001)]*/ int FireSubscription(IEventSubscription subscription);
}

// IEventSubscription Interface
interface IEventSubscription : IDispatch {
  mixin(uuid("4a6b0e15-2e38-11d1-9965-00c04fbbb345"));
  // static DWINGUID IID = { 0x4a6b0e15, 0x2e38, 0x11d1, 0x99, 0x65, 0x00, 0xc0, 0x4f, 0xbb, 0xb3, 0x45 };
  // property SubscriptionID
  /*[id(0x00000001)]*/ int get_SubscriptionID(out wchar* pbstrSubscriptionID);
  // property SubscriptionID
  /*[id(0x00000001)]*/ int set_SubscriptionID(wchar* pbstrSubscriptionID);
  // property SubscriptionName
  /*[id(0x00000002)]*/ int get_SubscriptionName(out wchar* pbstrSubscriptionName);
  // property SubscriptionName
  /*[id(0x00000002)]*/ int set_SubscriptionName(wchar* pbstrSubscriptionName);
  // property PublisherID
  /*[id(0x00000003)]*/ int get_PublisherID(out wchar* pbstrPublisherID);
  // property PublisherID
  /*[id(0x00000003)]*/ int set_PublisherID(wchar* pbstrPublisherID);
  // property EventClassID
  /*[id(0x00000004)]*/ int get_EventClassID(out wchar* pbstrEventClassID);
  // property EventClassID
  /*[id(0x00000004)]*/ int set_EventClassID(wchar* pbstrEventClassID);
  // property MethodName
  /*[id(0x00000005)]*/ int get_methodName(out wchar* pbstrMethodName);
  // property MethodName
  /*[id(0x00000005)]*/ int set_methodName(wchar* pbstrMethodName);
  // property SubscriberCLSID
  /*[id(0x00000006)]*/ int get_SubscriberCLSID(out wchar* pbstrSubscriberCLSID);
  // property SubscriberCLSID
  /*[id(0x00000006)]*/ int set_SubscriberCLSID(wchar* pbstrSubscriberCLSID);
  // property SubscriberInterface
  /*[id(0x00000007)]*/ int get_SubscriberInterface(out IUnknown ppSubscriberInterface);
  // property SubscriberInterface
  /*[id(0x00000007)]*/ int set_SubscriberInterface(IUnknown ppSubscriberInterface);
  // property PerUser
  /*[id(0x00000008)]*/ int get_PerUser(out int pfPerUser);
  // property PerUser
  /*[id(0x00000008)]*/ int set_PerUser(int pfPerUser);
  // property OwnerSID
  /*[id(0x00000009)]*/ int get_OwnerSID(out wchar* pbstrOwnerSID);
  // property OwnerSID
  /*[id(0x00000009)]*/ int set_OwnerSID(wchar* pbstrOwnerSID);
  // property Enabled
  /*[id(0x0000000A)]*/ int get_Enabled(out int pfEnabled);
  // property Enabled
  /*[id(0x0000000A)]*/ int set_Enabled(int pfEnabled);
  // property Description
  /*[id(0x0000000B)]*/ int get_Description(out wchar* pbstrDescription);
  // property Description
  /*[id(0x0000000B)]*/ int set_Description(wchar* pbstrDescription);
  // property MachineName
  /*[id(0x0000000C)]*/ int get_MachineName(out wchar* pbstrMachineName);
  // property MachineName
  /*[id(0x0000000C)]*/ int set_MachineName(wchar* pbstrMachineName);
  // method GetPublisherProperty
  /*[id(0x0000000D)]*/ int GetPublisherProperty(wchar* bstrPropertyName, out DWINVARIANT propertyValue);
  // method PutPublisherProperty
  /*[id(0x0000000E)]*/ int PutPublisherProperty(wchar* bstrPropertyName, DWINVARIANT* propertyValue);
  // method RemovePublisherProperty
  /*[id(0x0000000F)]*/ int RemovePublisherProperty(wchar* bstrPropertyName);
  // method GetPublisherPropertyCollection
  /*[id(0x00000010)]*/ int GetPublisherPropertyCollection(out IEventObjectCollection collection);
  // method GetSubscriberProperty
  /*[id(0x00000011)]*/ int GetSubscriberProperty(wchar* bstrPropertyName, out DWINVARIANT propertyValue);
  // method PutSubscriberProperty
  /*[id(0x00000012)]*/ int PutSubscriberProperty(wchar* bstrPropertyName, DWINVARIANT* propertyValue);
  // method RemoveSubscriberProperty
  /*[id(0x00000013)]*/ int RemoveSubscriberProperty(wchar* bstrPropertyName);
  // method GetSubscriberPropertyCollection
  /*[id(0x00000014)]*/ int GetSubscriberPropertyCollection(out IEventObjectCollection collection);
  // property InterfaceID
  /*[id(0x00000015)]*/ int get_InterfaceID(out wchar* pbstrInterfaceID);
  // property InterfaceID
  /*[id(0x00000015)]*/ int set_InterfaceID(wchar* pbstrInterfaceID);
}

// IMultiInterfaceEventControl Interface
interface IMultiInterfaceEventControl : IUnknown {
  mixin(uuid("0343e2f5-86f6-11d1-b760-00c04fb926af"));
  // static DWINGUID IID = { 0x0343e2f5, 0x86f6, 0x11d1, 0xb7, 0x60, 0x00, 0xc0, 0x4f, 0xb9, 0x26, 0xaf };
  // method SetMultiInterfacePublisherFilter
  /*[id(0x60010000)]*/ int SetMultiInterfacePublisherFilter(IMultiInterfacePublisherFilter classFilter);
  // Get a self-updating collection of subscriptions to an IID/method
  /*[id(0x60010001)]*/ int GetSubscriptions(ref DWINGUID eventIID, wchar* bstrMethodName, wchar* optionalCriteria, int* optionalErrorIndex, out IEventObjectCollection ppCollection);
  // Establish the default query to use when not filtering.
  /*[id(0x60010002)]*/ int SetDefaultQuery(ref DWINGUID eventIID, wchar* bstrMethodName, wchar* bstrCriteria, out int errorIndex);
  // property AllowInprocActivation
  /*[id(0x60010003)]*/ int get_AllowInprocActivation(out int pfAllowInprocActivation);
  // property AllowInprocActivation
  /*[id(0x60010003)]*/ int set_AllowInprocActivation(int pfAllowInprocActivation);
  // property FireInParallel
  /*[id(0x60010005)]*/ int get_FireInParallel(out int pfFireInParallel);
  // property FireInParallel
  /*[id(0x60010005)]*/ int set_FireInParallel(int pfFireInParallel);
}

// IMultiInterfacePublisherFilter Interface
interface IMultiInterfacePublisherFilter : IUnknown {
  mixin(uuid("465e5cc1-7b26-11d1-88fb-0080c7d771bf"));
  // static DWINGUID IID = { 0x465e5cc1, 0x7b26, 0x11d1, 0x88, 0xfb, 0x00, 0x80, 0xc7, 0xd7, 0x71, 0xbf };
  // User-called method to initialize the publisher filter after it is installed
  /*[id(0x60010000)]*/ int Initialize(IMultiInterfaceEventControl pEIC);
  // Prepare to fire all subscriptions in your collection
  /*[id(0x60010001)]*/ int PrepareToFire(ref DWINGUID iid, wchar* methodName, IFiringControl firingControl);
}

// IEventSystem Interface
interface IEventSystem : IDispatch {
  mixin(uuid("4e14fb9f-2e22-11d1-9964-00c04fbbb345"));
  // static DWINGUID IID = { 0x4e14fb9f, 0x2e22, 0x11d1, 0x99, 0x64, 0x00, 0xc0, 0x4f, 0xbb, 0xb3, 0x45 };
  // method Query
  /*[id(0x00000001)]*/ int Query(wchar* progID, wchar* queryCriteria, out int errorIndex, out IUnknown ppInterface);
  // method Store
  /*[id(0x00000002)]*/ int Store(wchar* progID, IUnknown pInterface);
  // method Remove
  /*[id(0x00000003)]*/ int Remove(wchar* progID, wchar* queryCriteria, out int errorIndex);
  // method get_EventObjectChangeEventClassID
  /*[id(0x00000004)]*/ int get_EventObjectChangeEventClassID(out wchar* pbstrEventClassID);
  // method QueryS
  /*[id(0x00000005)]*/ int QueryS(wchar* progID, wchar* queryCriteria, out IUnknown ppInterface);
  // method RemoveS
  /*[id(0x00000006)]*/ int RemoveS(wchar* progID, wchar* queryCriteria);
}

// IEventPublisher Interface
interface IEventPublisher : IDispatch {
  mixin(uuid("e341516b-2e32-11d1-9964-00c04fbbb345"));
  // static DWINGUID IID = { 0xe341516b, 0x2e32, 0x11d1, 0x99, 0x64, 0x00, 0xc0, 0x4f, 0xbb, 0xb3, 0x45 };
  // property PublisherID
  /*[id(0x00000001)]*/ int get_PublisherID(out wchar* pbstrPublisherID);
  // property PublisherID
  /*[id(0x00000001)]*/ int set_PublisherID(wchar* pbstrPublisherID);
  // property PublisherName
  /*[id(0x00000002)]*/ int get_PublisherName(out wchar* pbstrPublisherName);
  // property PublisherName
  /*[id(0x00000002)]*/ int set_PublisherName(wchar* pbstrPublisherName);
  // property PublisherType
  /*[id(0x00000003)]*/ int get_PublisherType(out wchar* pbstrPublisherType);
  // property PublisherType
  /*[id(0x00000003)]*/ int set_PublisherType(wchar* pbstrPublisherType);
  // property OwnerSID
  /*[id(0x00000004)]*/ int get_OwnerSID(out wchar* pbstrOwnerSID);
  // property OwnerSID
  /*[id(0x00000004)]*/ int set_OwnerSID(wchar* pbstrOwnerSID);
  // property Description
  /*[id(0x00000005)]*/ int get_Description(out wchar* pbstrDescription);
  // property Description
  /*[id(0x00000005)]*/ int set_Description(wchar* pbstrDescription);
  // method GetDefaultProperty
  /*[id(0x00000006)]*/ int GetDefaultProperty(wchar* bstrPropertyName, out DWINVARIANT propertyValue);
  // method PutDefaultProperty
  /*[id(0x00000007)]*/ int PutDefaultProperty(wchar* bstrPropertyName, DWINVARIANT* propertyValue);
  // method RemoveDefaultProperty
  /*[id(0x00000008)]*/ int RemoveDefaultProperty(wchar* bstrPropertyName);
  // method GetDefaultPropertyCollection
  /*[id(0x00000009)]*/ int GetDefaultPropertyCollection(out IEventObjectCollection collection);
}

// IEventClass Interface
interface IEventClass : IDispatch {
  mixin(uuid("fb2b72a0-7a68-11d1-88f9-0080c7d771bf"));
  // static DWINGUID IID = { 0xfb2b72a0, 0x7a68, 0x11d1, 0x88, 0xf9, 0x00, 0x80, 0xc7, 0xd7, 0x71, 0xbf };
  // property EventClassID
  /*[id(0x00000001)]*/ int get_EventClassID(out wchar* pbstrEventClassID);
  // property EventClassID
  /*[id(0x00000001)]*/ int set_EventClassID(wchar* pbstrEventClassID);
  // property EventClassName
  /*[id(0x00000002)]*/ int get_EventClassName(out wchar* pbstrEventClassName);
  // property EventClassName
  /*[id(0x00000002)]*/ int set_EventClassName(wchar* pbstrEventClassName);
  // property OwnerSID
  /*[id(0x00000003)]*/ int get_OwnerSID(out wchar* pbstrOwnerSID);
  // property OwnerSID
  /*[id(0x00000003)]*/ int set_OwnerSID(wchar* pbstrOwnerSID);
  // property FiringInterfaceID
  /*[id(0x00000004)]*/ int get_FiringInterfaceID(out wchar* pbstrFiringInterfaceID);
  // property FiringInterfaceID
  /*[id(0x00000004)]*/ int set_FiringInterfaceID(wchar* pbstrFiringInterfaceID);
  // property Description
  /*[id(0x00000005)]*/ int get_Description(out wchar* pbstrDescription);
  // property Description
  /*[id(0x00000005)]*/ int set_Description(wchar* pbstrDescription);
  // property CustomConfigCLSID
  /*[id(0x00000006)]*/ int get_CustomConfigCLSID(out wchar* pbstrCustomConfigCLSID);
  // property CustomConfigCLSID
  /*[id(0x00000006)]*/ int set_CustomConfigCLSID(wchar* pbstrCustomConfigCLSID);
  // property TypeLib
  /*[id(0x00000007)]*/ int get_TypeLib(out wchar* pbstrTypeLib);
  // property TypeLib
  /*[id(0x00000007)]*/ int set_TypeLib(wchar* pbstrTypeLib);
}

// IEventClass2 Interface
interface IEventClass2 : IEventClass {
  mixin(uuid("fb2b72a1-7a68-11d1-88f9-0080c7d771bf"));
  // static DWINGUID IID = { 0xfb2b72a1, 0x7a68, 0x11d1, 0x88, 0xf9, 0x00, 0x80, 0xc7, 0xd7, 0x71, 0xbf };
  // property PublisherID
  /*[id(0x00000008)]*/ int get_PublisherID(out wchar* pbstrPublisherID);
  // property PublisherID
  /*[id(0x00000008)]*/ int set_PublisherID(wchar* pbstrPublisherID);
  // property MultiInterfacePublisherFilterCLSID
  /*[id(0x00000009)]*/ int get_MultiInterfacePublisherFilterCLSID(out wchar* pbstrPubFilCLSID);
  // property MultiInterfacePublisherFilterCLSID
  /*[id(0x00000009)]*/ int set_MultiInterfacePublisherFilterCLSID(wchar* pbstrPubFilCLSID);
  // property AllowInprocActivation
  /*[id(0x0000000A)]*/ int get_AllowInprocActivation(out int pfAllowInprocActivation);
  // property AllowInprocActivation
  /*[id(0x0000000A)]*/ int set_AllowInprocActivation(int pfAllowInprocActivation);
  // property FireInParallel
  /*[id(0x0000000B)]*/ int get_FireInParallel(out int pfFireInParallel);
  // property FireInParallel
  /*[id(0x0000000B)]*/ int set_FireInParallel(int pfFireInParallel);
}

// IEventObjectChange Interface
interface IEventObjectChange : IUnknown {
  mixin(uuid("f4a07d70-2e25-11d1-9964-00c04fbbb345"));
  // static DWINGUID IID = { 0xf4a07d70, 0x2e25, 0x11d1, 0x99, 0x64, 0x00, 0xc0, 0x4f, 0xbb, 0xb3, 0x45 };
  // method ChangedSubscription
  /*[id(0x60010000)]*/ int ChangedSubscription(EOC_ChangeType changeType, wchar* bstrSubscriptionID);
  // method ChangedEventClass
  /*[id(0x60010001)]*/ int ChangedEventClass(EOC_ChangeType changeType, wchar* bstrEventClassID);
  // method ChangedPublisher
  /*[id(0x60010002)]*/ int ChangedPublisher(EOC_ChangeType changeType, wchar* bstrPublisherID);
}

// IEventObjectChange2 Interface
interface IEventObjectChange2 : IUnknown {
  mixin(uuid("7701a9c3-bd68-438f-83e0-67bf4f53a422"));
  // static DWINGUID IID = { 0x7701a9c3, 0xbd68, 0x438f, 0x83, 0xe0, 0x67, 0xbf, 0x4f, 0x53, 0xa4, 0x22 };
  // method ChangedSubscription
  /*[id(0x60010000)]*/ int ChangedSubscription(COMEVENTSYSCHANGEINFO* pInfo);
  // method ChangedEventClass
  /*[id(0x60010001)]*/ int ChangedEventClass(COMEVENTSYSCHANGEINFO* pInfo);
}

// IEventProperty Interface
interface IEventProperty : IDispatch {
  mixin(uuid("da538ee2-f4de-11d1-b6bb-00805fc79216"));
  // static DWINGUID IID = { 0xda538ee2, 0xf4de, 0x11d1, 0xb6, 0xbb, 0x00, 0x80, 0x5f, 0xc7, 0x92, 0x16 };
  // property Name
  /*[id(0x00000001)]*/ int get_Name(out wchar* propertyName);
  // property Name
  /*[id(0x00000001)]*/ int set_Name(wchar* propertyName);
  // property Value
  /*[id(0x00000002)]*/ int get_Value(out DWINVARIANT propertyValue);
  // property Value
  /*[id(0x00000002)]*/ int set_Value(DWINVARIANT* propertyValue);
}

// IEventClass3 Interface
interface IEventClass3 : IEventClass2 {
  mixin(uuid("7fb7ea43-2d76-4ea8-8cd9-3decc270295e"));
  // static DWINGUID IID = { 0x7fb7ea43, 0x2d76, 0x4ea8, 0x8c, 0xd9, 0x3d, 0xec, 0xc2, 0x70, 0x29, 0x5e };
  // property EventClassPartitionID
  /*[id(0x0000000C)]*/ int get_EventClassPartitionID(out wchar* pbstrEventClassPartitionID);
  // property EventClassPartitionID
  /*[id(0x0000000C)]*/ int set_EventClassPartitionID(wchar* pbstrEventClassPartitionID);
  // property EventClassApplicationID
  /*[id(0x0000000D)]*/ int get_EventClassApplicationID(out wchar* pbstrEventClassApplicationID);
  // property EventClassApplicationID
  /*[id(0x0000000D)]*/ int set_EventClassApplicationID(wchar* pbstrEventClassApplicationID);
}

// IEventClassParallelFiringTimeout Interface
interface IEventClassParallelFiringTimeout : IUnknown {
  mixin(uuid("a5657e5c-7bae-4e81-9c17-284655918763"));
  // static DWINGUID IID = { 0xa5657e5c, 0x7bae, 0x4e81, 0x9c, 0x17, 0x28, 0x46, 0x55, 0x91, 0x87, 0x63 };
  // property ParallelFiringTimeout
  /*[id(0x00000001)]*/ int get_ParallelFiringTimeout(out uint pdwParallelFiringTimeout);
  // property ParallelFiringTimeout
  /*[id(0x00000001)]*/ int set_ParallelFiringTimeout(uint pdwParallelFiringTimeout);
}

// IEventSubscription2 Interface
interface IEventSubscription2 : IEventSubscription {
  mixin(uuid("4a6b0e16-2e38-11d1-9965-00c04fbbb345"));
  // static DWINGUID IID = { 0x4a6b0e16, 0x2e38, 0x11d1, 0x99, 0x65, 0x00, 0xc0, 0x4f, 0xbb, 0xb3, 0x45 };
  // property FilterCriteria
  /*[id(0x00000016)]*/ int get_FilterCriteria(out wchar* pbstrFilterCriteria);
  // property FilterCriteria
  /*[id(0x00000016)]*/ int set_FilterCriteria(wchar* pbstrFilterCriteria);
  // property SubscriberMoniker
  /*[id(0x00000017)]*/ int get_SubscriberMoniker(out wchar* pbstrMoniker);
  // property SubscriberMoniker
  /*[id(0x00000017)]*/ int set_SubscriberMoniker(wchar* pbstrMoniker);
}

// IEventSubscription3 Interface
interface IEventSubscription3 : IEventSubscription2 {
  mixin(uuid("fbc1d17d-c498-43a0-81af-423ddd530af6"));
  // static DWINGUID IID = { 0xfbc1d17d, 0xc498, 0x43a0, 0x81, 0xaf, 0x42, 0x3d, 0xdd, 0x53, 0x0a, 0xf6 };
  // property EventClassPartitionID
  /*[id(0x00000018)]*/ int get_EventClassPartitionID(out wchar* pbstrEventClassPartitionID);
  // property EventClassPartitionID
  /*[id(0x00000018)]*/ int set_EventClassPartitionID(wchar* pbstrEventClassPartitionID);
  // property EventClassApplicationID
  /*[id(0x00000019)]*/ int get_EventClassApplicationID(out wchar* pbstrEventClassApplicationID);
  // property EventClassApplicationID
  /*[id(0x00000019)]*/ int set_EventClassApplicationID(wchar* pbstrEventClassApplicationID);
  // property SubscriberPartitionID
  /*[id(0x0000001A)]*/ int get_SubscriberPartitionID(out wchar* pbstrSubscriberPartitionID);
  // property SubscriberPartitionID
  /*[id(0x0000001A)]*/ int set_SubscriberPartitionID(wchar* pbstrSubscriberPartitionID);
  // property SubscriberApplicationID
  /*[id(0x0000001B)]*/ int get_SubscriberApplicationID(out wchar* pbstrSubscriberApplicationID);
  // property SubscriberApplicationID
  /*[id(0x0000001B)]*/ int set_SubscriberApplicationID(wchar* pbstrSubscriberApplicationID);
}

// IEventSystem2 Interface
interface IEventSystem2 : IEventSystem {
  mixin(uuid("99cc098f-a48a-4e9c-8e58-965c0afc19d5"));
  // static DWINGUID IID = { 0x99cc098f, 0xa48a, 0x4e9c, 0x8e, 0x58, 0x96, 0x5c, 0x0a, 0xfc, 0x19, 0xd5 };
  // method GetVersion
  /*[id(0x00000007)]*/ int GetVersion(out int pnVersion);
  // method VerifyTransientSubscribers
  /*[id(0x00000008)]*/ int VerifyTransientSubscribers();
}
