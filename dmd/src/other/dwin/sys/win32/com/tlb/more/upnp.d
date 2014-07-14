// UPnP 1.0 Type Library
// Version 1.0

/*[uuid("db3442a7-a2e9-4a59-9cb5-f5c1a5d901e5")]*/
module dwin.sys.win32.com.tlb.more.upnp;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IUPnPDeviceFinder Interface
interface IUPnPDeviceFinder : IDispatch {
  mixin(uuid("adda3d55-6f72-4319-bff9-18600a539b10"));
  // static DWINGUID IID = { 0xadda3d55, 0x6f72, 0x4319, 0xbf, 0xf9, 0x18, 0x60, 0x0a, 0x53, 0x9b, 0x10 };
  // method FindByType
  /*[id(0x600203E9)]*/ int FindByType(wchar* bstrTypeURI, uint dwFlags, out IUPnPDevices pDevices);
  // method CreateAsyncFind
  /*[id(0x600203EC)]*/ int CreateAsyncFind(wchar* bstrTypeURI, uint dwFlags, IUnknown punkDeviceFinderCallback, out int plFindData);
  // method StartAsyncFind
  /*[id(0x600203ED)]*/ int StartAsyncFind(int lFindData);
  // method CancelAsyncFind
  /*[id(0x600203EE)]*/ int CancelAsyncFind(int lFindData);
  // method FindByUDN
  /*[id(0x600203EB)]*/ int FindByUDN(wchar* bstrUDN, out IUPnPDevice pDevice);
}

// IUPnPDevices Interface
interface IUPnPDevices : IDispatch {
  mixin(uuid("fdbc0c73-bda3-4c66-ac4f-f2d96fdad68c"));
  // static DWINGUID IID = { 0xfdbc0c73, 0xbda3, 0x4c66, 0xac, 0x4f, 0xf2, 0xd9, 0x6f, 0xda, 0xd6, 0x8c };
  // property Count
  /*[id(0x60020DAD)]*/ int get_Count(out int plCount);
  // property _NewEnum
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppunk);
  // property Item
  /*[id(0x00000000)]*/ int get_Item(wchar* bstrUDN, out IUPnPDevice ppDevice);
}

// IUPnPDevice Interface
interface IUPnPDevice : IDispatch {
  mixin(uuid("3d44d0d1-98c9-4889-acd1-f9d674bf2221"));
  // static DWINGUID IID = { 0x3d44d0d1, 0x98c9, 0x4889, 0xac, 0xd1, 0xf9, 0xd6, 0x74, 0xbf, 0x22, 0x21 };
  // denotes whether the device is the highest-level device in the device tree
  /*[id(0x60020FA1)]*/ int get_IsRootDevice(out short pvarb);
  // returns the top device in the device tree
  /*[id(0x60020FA2)]*/ int get_RootDevice(out IUPnPDevice ppudRootDevice);
  // returns the parent of the current device
  /*[id(0x60020FA3)]*/ int get_ParentDevice(out IUPnPDevice ppudDeviceParent);
  // denotes whether the current device contains child devices
  /*[id(0x60020FA4)]*/ int get_HasChildren(out short pvarb);
  // returns a collection of the children of the current device
  /*[id(0x60020FA5)]*/ int get_Children(out IUPnPDevices ppudChildren);
  // returns the UDN of the device
  /*[id(0x60020FA6)]*/ int get_UniqueDeviceName(out wchar* pbstr);
  // returns the (optional) display name of the device
  /*[id(0x60020FA7)]*/ int get_FriendlyName(out wchar* pbstr);
  // returns the device type URI
  /*[id(0x60020FA8)]*/ int get_Type(out wchar* pbstr);
  // obtains a presentation URL to a web page that can control the device
  /*[id(0x60020FA9)]*/ int get_PresentationURL(out wchar* pbstr);
  // displayable manufacturer name
  /*[id(0x60020FAA)]*/ int get_ManufacturerName(out wchar* pbstr);
  // URL to the manufacturer's website
  /*[id(0x60020FAB)]*/ int get_ManufacturerURL(out wchar* pbstr);
  // a displayable string containing the model name
  /*[id(0x60020FAC)]*/ int get_ModelName(out wchar* pbstr);
  // a displayable string containing the model number
  /*[id(0x60020FAD)]*/ int get_ModelNumber(out wchar* pbstr);
  // displayable summary of the device's function
  /*[id(0x60020FAE)]*/ int get_Description(out wchar* pbstr);
  // URL to a webpage containing model-specific information
  /*[id(0x60020FAF)]*/ int get_ModelURL(out wchar* pbstr);
  // displayable product code
  /*[id(0x60020FB0)]*/ int get_UPC(out wchar* pbstr);
  // displayable serial number
  /*[id(0x60020FB1)]*/ int get_SerialNumber(out wchar* pbstr);
  // retrieves an url from which an icon of the specified format can be loaded
  /*[id(0x60020FB3)]*/ int IconURL(wchar* bstrEncodingFormat, int lSizeX, int lSizeY, int lBitDepth, out wchar* pbstrIconURL);
  // returns the collection of services exposed by the device
  /*[id(0x60020FB4)]*/ int get_Services(out IUPnPServices ppusServices);
}

// IUPnPServices Interface
interface IUPnPServices : IDispatch {
  mixin(uuid("3f8c8e9e-9a7a-4dc8-bc41-ff31fa374956"));
  // static DWINGUID IID = { 0x3f8c8e9e, 0x9a7a, 0x4dc8, 0xbc, 0x41, 0xff, 0x31, 0xfa, 0x37, 0x49, 0x56 };
  // property Count
  /*[id(0x600207D1)]*/ int get_Count(out int plCount);
  // property _NewEnum
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppunk);
  // property Item
  /*[id(0x00000000)]*/ int get_Item(wchar* bstrServiceId, out IUPnPService ppService);
}

// IUPnPService Interface
interface IUPnPService : IDispatch {
  mixin(uuid("a295019c-dc65-47dd-90dc-7fe918a1ab44"));
  // static DWINGUID IID = { 0xa295019c, 0xdc65, 0x47dd, 0x90, 0xdc, 0x7f, 0xe9, 0x18, 0xa1, 0xab, 0x44 };
  // method QueryStateVariable
  /*[id(0x600209C5)]*/ int QueryStateVariable(wchar* bstrVariableName, out DWINVARIANT pValue);
  // method InvokeAction
  /*[id(0x600209C6)]*/ int InvokeAction(wchar* bstrActionName, DWINVARIANT vInActionArgs, ref DWINVARIANT pvOutActionArgs, out DWINVARIANT pvRetVal);
  // property ServiceTypeIdentifier
  /*[id(0x600209C7)]*/ int get_ServiceTypeIdentifier(out wchar* pVal);
  // method AddStateChangeCallback
  /*[id(0x600209C8)]*/ int AddCallback(IUnknown pUnkCallback);
  // property Id
  /*[id(0x600209C9)]*/ int get_Id(out wchar* pbstrId);
  // property LastTransportStatus
  /*[id(0x600209CA)]*/ int get_LastTransportStatus(out int plValue);
}

// IUPnPDescriptionDocument Interface
interface IUPnPDescriptionDocument : IDispatch {
  mixin(uuid("11d1c1b2-7daa-4c9e-9595-7f82ed206d1e"));
  // static DWINGUID IID = { 0x11d1c1b2, 0x7daa, 0x4c9e, 0x95, 0x95, 0x7f, 0x82, 0xed, 0x20, 0x6d, 0x1e };
  // the current status of the document's loading process
  /*[id(0xFFFFFDF3)]*/ int get_ReadyState(out int plReadyState);
  // loads a document synchronously from an URL
  /*[id(0x60021195)]*/ int Load(wchar* bstrUrl);
  // starts an asynchronous download, returning immediately
  /*[id(0x60021196)]*/ int LoadAsync(wchar* bstrUrl, IUnknown pUnkCallback);
  // the success or failure code of the completed load operation
  /*[id(0x60021197)]*/ int get_LoadResult(out int phrError);
  // stops an asynchronous loading operation
  /*[id(0x60021198)]*/ int Abort();
  // returns the root device of the loaded document's device tree
  /*[id(0x60021199)]*/ int RootDevice(out IUPnPDevice ppudRootDevice);
  // returns a device by its unique device name (UDN)
  /*[id(0x6002119A)]*/ int DeviceByUDN(wchar* bstrUDN, out IUPnPDevice ppudDevice);
}

interface IUPnPDeviceHostSetup : IUnknown {
  mixin(uuid("6bd34909-54e7-4fbf-8562-7b89709a589a"));
  // static DWINGUID IID = { 0x6bd34909, 0x54e7, 0x4fbf, 0x85, 0x62, 0x7b, 0x89, 0x70, 0x9a, 0x58, 0x9a };
  /*[id(0x60010000)]*/ int AskIfNotAlreadyEnabled(out short pbEnabled);
}

interface IUPnPDeviceDocumentAccess : IUnknown {
  mixin(uuid("e7772804-3287-418e-9072-cf2b47238981"));
  // static DWINGUID IID = { 0xe7772804, 0x3287, 0x418e, 0x90, 0x72, 0xcf, 0x2b, 0x47, 0x23, 0x89, 0x81 };
  /*[id(0x60010000)]*/ int GetDocumentURL(out wchar* pbstrDocument);
}

// CoClasses

// UPnPDeviceFinder Class
abstract class UPnPDeviceFinder {
  mixin(uuid("e2085f28-feb7-404a-b8e7-e659bdeaaa02"));
  // static DWINGUID CLSID = { 0xe2085f28, 0xfeb7, 0x404a, 0xb8, 0xe7, 0xe6, 0x59, 0xbd, 0xea, 0xaa, 0x02 };
  mixin Interfaces!(IUPnPDeviceFinder);
}

// UPnPDevices Class
abstract class UPnPDevices {
  mixin(uuid("b9e84ffd-ad3c-40a4-b835-0882ebcbaaa8"));
  // static DWINGUID CLSID = { 0xb9e84ffd, 0xad3c, 0x40a4, 0xb8, 0x35, 0x08, 0x82, 0xeb, 0xcb, 0xaa, 0xa8 };
  mixin Interfaces!(IUPnPDevices);
}

// UPnPDevice Class
abstract class UPnPDevice {
  mixin(uuid("a32552c5-ba61-457a-b59a-a2561e125e33"));
  // static DWINGUID CLSID = { 0xa32552c5, 0xba61, 0x457a, 0xb5, 0x9a, 0xa2, 0x56, 0x1e, 0x12, 0x5e, 0x33 };
  mixin Interfaces!(IUPnPDevice);
}

// UPnPServices Class
abstract class UPnPServices {
  mixin(uuid("c0bc4b4a-a406-4efc-932f-b8546b8100cc"));
  // static DWINGUID CLSID = { 0xc0bc4b4a, 0xa406, 0x4efc, 0x93, 0x2f, 0xb8, 0x54, 0x6b, 0x81, 0x00, 0xcc };
  mixin Interfaces!(IUPnPServices);
}

// UPnPService Class
abstract class UPnPService {
  mixin(uuid("c624ba95-fbcb-4409-8c03-8cceec533ef1"));
  // static DWINGUID CLSID = { 0xc624ba95, 0xfbcb, 0x4409, 0x8c, 0x03, 0x8c, 0xce, 0xec, 0x53, 0x3e, 0xf1 };
  mixin Interfaces!(IUPnPService);
}

// UPnPDescriptionDocument Class
abstract class UPnPDescriptionDocument {
  mixin(uuid("1d8a9b47-3a28-4ce2-8a4b-bd34e45bceeb"));
  // static DWINGUID CLSID = { 0x1d8a9b47, 0x3a28, 0x4ce2, 0x8a, 0x4b, 0xbd, 0x34, 0xe4, 0x5b, 0xce, 0xeb };
  mixin Interfaces!(IUPnPDescriptionDocument);
}

// UPnPDeviceHostSetup Class
abstract class UPnPDeviceHostSetup {
  mixin(uuid("b4609411-c81c-4cce-8c76-c6b50c9402c6"));
  // static DWINGUID CLSID = { 0xb4609411, 0xc81c, 0x4cce, 0x8c, 0x76, 0xc6, 0xb5, 0x0c, 0x94, 0x02, 0xc6 };
  mixin Interfaces!(IUnknown);
}
