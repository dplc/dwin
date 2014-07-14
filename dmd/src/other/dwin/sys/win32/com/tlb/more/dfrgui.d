// DfrgUI 1.0 Type Library
// Version 1.0

/*[uuid("202d3ae0-2f0e-11d1-a1f6-0080c88593a5")]*/
module dwin.sys.win32.com.tlb.more.dfrgui;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IDfrgCtl Interface
interface IDfrgCtl : IDispatch {
  mixin(uuid("202d3aee-2f0e-11d1-a1f6-0080c88593a5"));
  // static DWINGUID IID = { 0x202d3aee, 0x2f0e, 0x11d1, 0xa1, 0xf6, 0x00, 0x80, 0xc8, 0x85, 0x93, 0xa5 };
  /*[id(0xFFFFFE08)]*/ int set_BorderStyle(int pnBorderStyle);
  /*[id(0xFFFFFE08)]*/ int get_BorderStyle(out int pnBorderStyle);
  /*[id(0xFFFFFDF8)]*/ int set_Appearance(int pnAppearance);
  /*[id(0xFFFFFDF8)]*/ int get_Appearance(out int pnAppearance);
  /*[id(0xFFFFFDFE)]*/ int set_Enabled(int pVal);
  /*[id(0xFFFFFDFE)]*/ int get_Enabled(out int pVal);
  /*[id(0xFFFFFE02)]*/ int set_FillColor(OLE_COLOR pclr);
  /*[id(0xFFFFFE02)]*/ int get_FillColor(out OLE_COLOR pclr);
  // property Command
  /*[id(0x00000001)]*/ int get_Command(out short pVal);
  // property Command
  /*[id(0x00000001)]*/ int set_Command(short pVal);
  // property EngineState
  /*[id(0x00000002)]*/ int get_EngineState(out short pVal);
  // property ReportStatus
  /*[id(0x00000003)]*/ int get_ReportStatus(out int pVal);
  // property IsEnginePaused
  /*[id(0x00000004)]*/ int get_IsEnginePaused(out int pVal);
  // property IsEngineRunning
  /*[id(0x00000005)]*/ int get_IsEngineRunning(out int pVal);
  // property IsDefragInProcess
  /*[id(0x00000006)]*/ int get_IsDefragInProcess(out int pVal);
  // property IsVolListLocked
  /*[id(0x00000007)]*/ int get_IsVolListLocked(out int pVal);
  // property IsOkToRun
  /*[id(0x00000008)]*/ int get_IsOkToRun(out int pVal);
}

// Dfrg Control Events
interface IDfrgEvents : IUnknown {
  mixin(uuid("57bc50bf-780b-11d1-8c44-0060083e866c"));
  // static DWINGUID IID = { 0x57bc50bf, 0x780b, 0x11d1, 0x8c, 0x44, 0x00, 0x60, 0x08, 0x3e, 0x86, 0x6c };
  // method StatusChanged
  /*[id(0x00000001)]*/ int StatusChanged(wchar* bszStatus);
  // method IsOKToRun
  /*[id(0x00000002)]*/ int IsOkToRun(int bOK);
}

// IGraphicsWindow Interface
interface IGraphicsWindow : IDispatch {
  mixin(uuid("8b43cf5d-56ed-11d1-8857-0060975ec077"));
  // static DWINGUID IID = { 0x8b43cf5d, 0x56ed, 0x11d1, 0x88, 0x57, 0x00, 0x60, 0x97, 0x5e, 0xc0, 0x77 };
}

// CoClasses

// DfrgCtl Class
abstract class DfrgCtl {
  mixin(uuid("202d3aef-2f0e-11d1-a1f6-0080c88593a5"));
  // static DWINGUID CLSID = { 0x202d3aef, 0x2f0e, 0x11d1, 0xa1, 0xf6, 0x00, 0x80, 0xc8, 0x85, 0x93, 0xa5 };
  mixin Interfaces!(IDfrgCtl);
}

// GraphicsWindow Class
abstract class GraphicsWindow {
  mixin(uuid("8b43cf5e-56ed-11d1-8857-0060975ec077"));
  // static DWINGUID CLSID = { 0x8b43cf5e, 0x56ed, 0x11d1, 0x88, 0x57, 0x00, 0x60, 0x97, 0x5e, 0xc0, 0x77 };
  mixin Interfaces!(IGraphicsWindow);
}
