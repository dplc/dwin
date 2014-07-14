// igfxpph 1.0 Type Library
// Version 1.0

/*[uuid("3ab1674b-ccff-11d2-8b20-00a0c93cb1f4")]*/
module dwin.sys.win32.com.tlb.more.igfxpph;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IGraphicsShellExt Interface
interface IGraphicsShellExt : IDispatch {
  mixin(uuid("3ab16759-ccff-11d2-8b20-00a0c93cb1f4"));
  // static DWINGUID IID = { 0x3ab16759, 0xccff, 0x11d2, 0x8b, 0x20, 0x00, 0xa0, 0xc9, 0x3c, 0xb1, 0xf4 };
}

// CoClasses

// GraphicsShellExt Class
abstract class GraphicsShellExt {
  mixin(uuid("3ab1675a-ccff-11d2-8b20-00a0c93cb1f4"));
  // static DWINGUID CLSID = { 0x3ab1675a, 0xccff, 0x11d2, 0x8b, 0x20, 0x00, 0xa0, 0xc9, 0x3c, 0xb1, 0xf4 };
  mixin Interfaces!(IGraphicsShellExt);
}
