// DfsShlEx 1.0 Type Library
// Version 1.0

/*[uuid("eccdf535-45cc-11ce-b9bf-0080c87cdba6")]*/
module dwin.sys.win32.com.tlb.more.dfsshlex;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// CoClasses

// DfsShell Class
abstract class DfsShell {
  mixin(uuid("eccdf543-45cc-11ce-b9bf-0080c87cdba6"));
  // static DWINGUID CLSID = { 0xeccdf543, 0x45cc, 0x11ce, 0xb9, 0xbf, 0x00, 0x80, 0xc8, 0x7c, 0xdb, 0xa6 };
  mixin Interfaces!(IUnknown);
}
