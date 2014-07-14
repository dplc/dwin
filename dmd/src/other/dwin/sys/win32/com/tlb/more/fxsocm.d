// FaxControl 1.0 Type Library
// Version 1.0

/*[uuid("e4de3030-0142-4aca-ba48-8613b56a2555")]*/
//module dwin.sys.win32.com.tlb.more.faxcontrol;
module dwin.sys.win32.com.tlb.more.fxsocm;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IFaxControl Interface
interface IFaxControl : IDispatch {
  mixin(uuid("32b56515-d48b-4dd9-87ac-9216f6beaa6f"));
  // static DWINGUID IID = { 0x32b56515, 0xd48b, 0x4dd9, 0x87, 0xac, 0x92, 0x16, 0xf6, 0xbe, 0xaa, 0x6f };
  // property IsFaxServiceInstalled
  /*[id(0x00000001)]*/ int get_IsFaxServiceInstalled(out short pbVal);
  // property IsLocalFaxPrinterInstalled
  /*[id(0x00000002)]*/ int get_IsLocalFaxPrinterInstalled(out short pbVal);
  // method InstallFaxService
  /*[id(0x00000003)]*/ int InstallFaxService();
  // method InstallLocalFaxPrinter
  /*[id(0x00000004)]*/ int InstallLocalFaxPrinter();
}

// CoClasses

// FaxControl Class
abstract class FaxControl {
  mixin(uuid("98f63271-6c09-48b3-a571-990155932d0b"));
  // static DWINGUID CLSID = { 0x98f63271, 0x6c09, 0x48b3, 0xa5, 0x71, 0x99, 0x01, 0x55, 0x93, 0x2d, 0x0b };
  mixin Interfaces!(IFaxControl);
}
