// mqgentr 1.0 Type Library
// Version 1.0

/*[uuid("84b536e5-e95b-4646-8c5e-9af072eb2361")]*/
module dwin.sys.win32.com.tlb.more.mqgentr;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IMqGenObj Interface
interface IMqGenObj : IDispatch {
  mixin(uuid("73395c88-702f-4278-afc1-5c044b914585"));
  // static DWINGUID IID = { 0x73395c88, 0x702f, 0x4278, 0xaf, 0xc1, 0x5c, 0x04, 0x4b, 0x91, 0x45, 0x85 };
  // method InvokeTransactionalRuleHandlers
  /*[id(0x00000001)]*/ int InvokeTransactionalRuleHandlers(wchar* bstrTrigID, wchar* bstrRegPath, IUnknown pPropBagUnknown, uint dwRuleResult);
}

// CoClasses

// MqGenObj Class
abstract class MqGenObj {
  mixin(uuid("73362520-16de-41e9-8e46-b5102c4afc2b"));
  // static DWINGUID CLSID = { 0x73362520, 0x16de, 0x41e9, 0x8e, 0x46, 0xb5, 0x10, 0x2c, 0x4a, 0xfc, 0x2b };
  mixin Interfaces!(IMqGenObj);
}
