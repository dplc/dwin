// Microsoft Scriptlet Library
// Version 1.0

/*[uuid("06290c00-48aa-11d2-8432-006008c3fbfc")]*/
//module dwin.sys.win32.com.tlb.more.scriptlet;
module dwin.sys.win32.com.tlb.more.scrobj;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

interface IBehaviorHandlerOM : IUnknown {
  mixin(uuid("06290c01-48aa-11d2-8432-006008c3fbfc"));
  // static DWINGUID IID = { 0x06290c01, 0x48aa, 0x11d2, 0x84, 0x32, 0x00, 0x60, 0x08, 0xc3, 0xfb, 0xfc };
  /*[id(0x00000000)]*/ int get_element(out IDispatch ppdispElement);
  /*[id(0x00000001)]*/ int createEventObject(out IDispatch ppdispEventObject);
  /*[id(0x00000002)]*/ int fireEvent(wchar* bstrEvent, IDispatch pdispEventObject);
  /*[id(0x00000003)]*/ int attachNotification(IDispatch pdispHandler);
}

interface DIBehaviorHandlerOM : IDispatch {
  mixin(uuid("06290c02-48aa-11d2-8432-006008c3fbfc"));
  // static DWINGUID IID = { 0x06290c02, 0x48aa, 0x11d2, 0x84, 0x32, 0x00, 0x60, 0x08, 0xc3, 0xfb, 0xfc };
  /+/*[id(0x00000000)]*/ IDispatch get_element();+/
  /+/*[id(0x00000001)]*/ IDispatch createEventObject();+/
  /+/*[id(0x00000002)]*/ void fireEvent(wchar* bstrEvent, IDispatch pdispEventObject);+/
  /+/*[id(0x00000003)]*/ void attachNotification(IDispatch pdispHandler);+/
}

// Scriptlet.GenerateTypeLib Interface
interface IGenScriptletTLib : IDispatch {
  mixin(uuid("2de0a190-a1a4-11d1-b382-00a0c911e8b2"));
  // static DWINGUID IID = { 0x2de0a190, 0xa1a4, 0x11d1, 0xb3, 0x82, 0x00, 0xa0, 0xc9, 0x11, 0xe8, 0xb2 };
  // Add a new scriptlet to the type library
  /*[id(0x00000001)]*/ int AddURL(wchar* bstrURL);
  // The path to the type library
  /*[id(0x00000002)]*/ int set_Path(wchar* pbstrPath);
  // The path to the type library
  /*[id(0x00000002)]*/ int get_Path(out wchar* pbstrPath);
  // The documentation for the type library
  /*[id(0x00000004)]*/ int set_Doc(wchar* pbstrDoc);
  // The documentation for the type library
  /*[id(0x00000004)]*/ int get_Doc(out wchar* pbstrDoc);
  // The name of the type library
  /*[id(0x00000005)]*/ int set_Name(wchar* pbstrName);
  // The name of the type library
  /*[id(0x00000005)]*/ int get_Name(out wchar* pbstrName);
  // The major version number of the type library
  /*[id(0x00000006)]*/ int set_MajorVersion(ushort pMajorVer);
  // The major version number of the type library
  /*[id(0x00000006)]*/ int get_MajorVersion(out ushort pMajorVer);
  // The minor version number of the type library
  /*[id(0x00000007)]*/ int set_MinorVersion(ushort pMinorVer);
  // The minor version number of the type library
  /*[id(0x00000007)]*/ int get_MinorVersion(out ushort pMinorVer);
  // Write the type library out to disk.
  /*[id(0x00000003)]*/ int Write();
  // Forget all the scriptlets added so far and start over.
  /*[id(0x00000008)]*/ int Reset();
  // The DWINGUID for the type library
  /*[id(0x00000009)]*/ int set_GUID(wchar* pbstrGUID);
  // The DWINGUID for the type library
  /*[id(0x00000009)]*/ int get_GUID(out wchar* pbstrGUID);
}
