// Windows Media Player Compatibility Layer
// Version 1.0

/*[uuid("73f0dd5c-d071-46b6-a8bf-897c84eaac49")]*/
module dwin.sys.win32.com.tlb.more.wmpdxm;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IWMPDXM: Not Public.  Internal interface used by Windows Media Player.
interface IWMPDXM : IDispatch {
  mixin(uuid("5eaee12f-333c-45f6-9799-24ddc12ebef3"));
  // static DWINGUID IID = { 0x5eaee12f, 0x333c, 0x45f6, 0x97, 0x99, 0x24, 0xdd, 0xc1, 0x2e, 0xbe, 0xf3 };
  /*[id(0x00000001)]*/ int get_wmpdxm(out IDispatch ppWMPDXM);
  /*[id(0x00000002)]*/ int set_OnUpdateUI(IDispatch value);
  /*[id(0x00000003)]*/ int NotifyVolumeChange(int lVolume);
  /*[id(0x00000004)]*/ int NotifyMuteChange(short vbMute);
  /*[id(0x00000006)]*/ int get_StartTime(out double pStartTime);
  /*[id(0x00000007)]*/ int getTimeString(double dTime, out wchar* pVal);
}

// IWMPEmbed: Not Public.  Internal interface used by Windows Media Player.
interface IWMPEmbed : IDispatch {
  mixin(uuid("47c41e8a-34b2-417c-9cf2-09731fa298b6"));
  // static DWINGUID IID = { 0x47c41e8a, 0x34b2, 0x417c, 0x9c, 0xf2, 0x09, 0x73, 0x1f, 0xa2, 0x98, 0xb6 };
  /*[id(0x00000064)]*/ int get_loop(out short pvbLoop);
  /*[id(0x00000064)]*/ int set_loop(short pvbLoop);
}
