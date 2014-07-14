// Windows Genuine Advantage Validation Tool
// Version 1.0

/*[uuid("5e649a63-7ee9-43f4-9926-0deaa462a8fb")]*/
module dwin.sys.win32.com.tlb.more.LegitCheckControl;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// ILegitCheck Interface
interface ILegitCheck : IDispatch {
  mixin(uuid("36cff953-fb06-45ad-896f-94a0259ab3dd"));
  // static DWINGUID IID = { 0x36cff953, 0xfb06, 0x45ad, 0x89, 0x6f, 0x94, 0xa0, 0x25, 0x9a, 0xb3, 0xdd };
  // method LegitCheck
  /*[id(0x00000001)]*/ int LegitCheck(out wchar* resultCode);
  // property WPA_PID
  /*[id(0x00000002)]*/ int get_WPA_PID(out wchar* pVal);
  // property WPA_PIDType
  /*[id(0x00000003)]*/ int get_WPA_PIDType(out int pVal);
  // property LegitCheck_MPAErrorCode
  /*[id(0x00000004)]*/ int get_LegitCheck_MPAErrorCode(out int pVal);
  // property HashCode
  /*[id(0x00000005)]*/ int set_HashCode(wchar* value);
  // method Brand
  /*[id(0x00000006)]*/ int Brand(wchar* productKey);
  // property Brand_MPAErrorCode
  /*[id(0x00000007)]*/ int get_Brand_MPAErrorCode(out int pVal);
  // method GetMachineDetails
  /*[id(0x00000008)]*/ int GetMachineDetails(out wchar* xmlOutput);
  // method IsAdministrator
  /*[id(0x00000009)]*/ int IsAdministrator(out short isAdmin);
  // property DisableVLKCheck
  /*[id(0x0000000A)]*/ int set_DisableVLKCheck(short newVal);
  // property DisableVLKCheck
  /*[id(0x0000000A)]*/ int get_DisableVLKCheck(out short newVal);
  // method GetNextStep
  /*[id(0x0000000B)]*/ int GetNextStep(wchar* resultCode, out wchar* pUrl);
  // property EnablePingBacks
  /*[id(0x0000000C)]*/ int set_EnablePingBacks(short newVal);
  // property EnablePingBacks
  /*[id(0x0000000C)]*/ int get_EnablePingBacks(out short newVal);
  // method GetLastErrors
  /*[id(0x0000000D)]*/ int GetLastErrors(out wchar* pErrors);
  // property Brand_PID
  /*[id(0x0000000E)]*/ int get_Brand_PID(out wchar* pVal);
  // method BrandEx
  /*[id(0x0000000F)]*/ int BrandEx(out wchar* xmlOutput);
  // property PartnerID
  /*[id(0x00000010)]*/ int set_PartnerID(int value);
  // method GetBlob
  /*[id(0x00000011)]*/ int GetBlob(wchar* passcode, out wchar* output);
  // property Notifiable
  /*[id(0x00000012)]*/ int get_Notifiable(out short newVal);
  // property ReduceReminders
  /*[id(0x00000013)]*/ int get_ReduceReminders(out short newVal);
  // property ReduceReminders
  /*[id(0x00000013)]*/ int set_ReduceReminders(short newVal);
  // method SetUserDisable
  /*[id(0x00000014)]*/ int SetUserDisable(int lType, short vbDisable);
  // method GetUserDisable
  /*[id(0x00000015)]*/ int GetUserDisable(int lType, out short pvbDisable);
  // property HttpAuthenticate
  /*[id(0x00000016)]*/ int set_HttpAuthenticate(short value);
}

// CoClasses

// Windows Genuine Advantage Validation Tool
abstract class LegitCheck {
  mixin(uuid("17492023-c23a-453e-a040-c7c580bbf700"));
  // static DWINGUID CLSID = { 0x17492023, 0xc23a, 0x453e, 0xa0, 0x40, 0xc7, 0xc5, 0x80, 0xbb, 0xf7, 0x00 };
  mixin Interfaces!(ILegitCheck);
}
