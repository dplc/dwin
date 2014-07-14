// Wave MSP 2.0 Type Library
// Version 2.0

/*[uuid("4ddb6d35-3bc1-11d2-86f2-006008b0e5d2")]*/
module dwin.sys.win32.com.tlb.more.wavemsp;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// ITMSPAddress Interface
interface ITMSPAddress : IUnknown {
  mixin(uuid("ee3bd600-3868-11d2-a045-00c04fb6809f"));
  // static DWINGUID IID = { 0xee3bd600, 0x3868, 0x11d2, 0xa0, 0x45, 0x00, 0xc0, 0x4f, 0xb6, 0x80, 0x9f };
  /*[id(0x60010000)]*/ int Initialize(int* hEvent);
  /*[id(0x60010001)]*/ int Shutdown();
  /*[id(0x60010002)]*/ int CreateMSPCall(int* hCall, uint dwReserved, uint dwMediaType, IUnknown pOuterUnknown, out IUnknown ppStreamControl);
  /*[id(0x60010003)]*/ int ShutdownMSPCall(IUnknown pStreamControl);
  /*[id(0x60010004)]*/ int ReceiveTSPData(IUnknown pMSPCall, ubyte* pBuffer, uint dwSize);
  /*[id(0x60010005)]*/ int GetEvent(ref uint pdwSize, ref ubyte pEventBuffer);
}

// CoClasses

// Wave MSP Class
abstract class WaveMSP {
  mixin(uuid("4ddb6d36-3bc1-11d2-86f2-006008b0e5d2"));
  // static DWINGUID CLSID = { 0x4ddb6d36, 0x3bc1, 0x11d2, 0x86, 0xf2, 0x00, 0x60, 0x08, 0xb0, 0xe5, 0xd2 };
  mixin Interfaces!(ITMSPAddress);
}
