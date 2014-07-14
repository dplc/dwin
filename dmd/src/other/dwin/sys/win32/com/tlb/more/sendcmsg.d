// SendCMsg 1.0 Type Library
// Version 1.0

/*[uuid("b1aff7c2-0c49-11d1-bb12-00c04fc9a3a3")]*/
module dwin.sys.win32.com.tlb.more.sendcmsg;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// ISendConsoleMessageApp Interface
interface ISendConsoleMessageApp : IUnknown {
  mixin(uuid("b1aff7cf-0c49-11d1-bb12-00c04fc9a3a3"));
  // static DWINGUID IID = { 0xb1aff7cf, 0x0c49, 0x11d1, 0xbb, 0x12, 0x00, 0xc0, 0x4f, 0xc9, 0xa3, 0xa3 };
}

// CoClasses

// SendConsoleMessageApp Class
abstract class SendConsoleMessageApp {
  mixin(uuid("b1aff7d0-0c49-11d1-bb12-00c04fc9a3a3"));
  // static DWINGUID CLSID = { 0xb1aff7d0, 0x0c49, 0x11d1, 0xbb, 0x12, 0x00, 0xc0, 0x4f, 0xc9, 0xa3, 0xa3 };
  mixin Interfaces!(ISendConsoleMessageApp);
}
