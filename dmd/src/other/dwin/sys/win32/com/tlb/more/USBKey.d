// USBKey 1.0 Type Library
// Version 1.0

/*[uuid("a70de293-c8d5-472a-8624-8a6e34c0d0d2")]*/
//module dwin.sys.win32.com.tlb.more.usbkey;
module dwin.sys.win32.com.tlb.more.USBKey;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IAxUSBKey Interface
interface IAxUSBKey : IDispatch {
  mixin(uuid("d964db1f-4f92-4267-a629-a2b694ed1f2f"));
  // static DWINGUID IID = { 0xd964db1f, 0x4f92, 0x4267, 0xa6, 0x29, 0xa2, 0xb6, 0x94, 0xed, 0x1f, 0x2f };
  // method SetMediaLib
  /*[id(0x00000001)]*/ int SetMediaLib(int id, out int pRet);
  // method SetMediaType
  /*[id(0x00000002)]*/ int SetMediaType(wchar* code);
  // method InitCard
  /*[id(0x00000003)]*/ int InitCard(wchar* pin, out int pRet);
  // method GetMediaID
  /*[id(0x00000004)]*/ int GetMediaID(out wchar* pRet);
  // property LastError
  /*[id(0x00000005)]*/ int get_LastError(out int pVal);
  // property LastError
  /*[id(0x00000005)]*/ int set_LastError(int pVal);
}

// CoClasses

// AxUSBKey Class
abstract class AxUSBKey {
  mixin(uuid("da215190-98b2-47de-ae24-da95481dffba"));
  // static DWINGUID CLSID = { 0xda215190, 0x98b2, 0x47de, 0xae, 0x24, 0xda, 0x95, 0x48, 0x1d, 0xff, 0xba };
  mixin Interfaces!(IAxUSBKey);
}
