// Microsoft Data Formatting Object Library 6.0 (SP6)
// Version 1.0

/*[uuid("6b263850-900b-11d0-9484-00a0c91110ed")]*/
//module dwin.sys.win32.com.tlb.more.stdformat;
module dwin.sys.win32.com.tlb.more.MSSTDFMT;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// Format type enumeration
enum FormatType {
  fmtGeneral = 0x00000000,
  fmtCustom = 0x00000001,
  fmtPicture = 0x00000002,
  fmtObject = 0x00000003,
  fmtCheckbox = 0x00000004,
  fmtBoolean = 0x00000005,
  fmtBytes = 0x00000006,
}

// First day of week enumeration
enum FirstDayOfWeek {
  fmtDayUseSystem = 0x00000000,
  fmtSunday = 0x00000001,
  fmtMonday = 0x00000002,
  fmtTuesday = 0x00000003,
  fmtWednesday = 0x00000004,
  fmtThursday = 0x00000005,
  fmtFriday = 0x00000006,
  fmtSaturday = 0x00000007,
}

// First week of year enumeration
enum FirstWeekOfYear {
  fmtWeekUseSystem = 0x00000000,
  fmtFirstJan1 = 0x00000001,
  fmtFirstFourDays = 0x00000002,
  fmtFirstFullWeek = 0x00000003,
}

// Aliases

alias IDataFormatDisp DataFormat;

alias IDataFormatsDisp DataFormats;

// Interfaces

// DataFormat Object
interface IDataFormatDisp : IDispatch {
  mixin(uuid("e675f3f0-91b5-11d0-9484-00a0c91110ed"));
  // static DWINGUID IID = { 0xe675f3f0, 0x91b5, 0x11d0, 0x94, 0x84, 0x00, 0xa0, 0xc9, 0x11, 0x10, 0xed };
}

// StdDataValue Object
interface IStdDataValueDisp : IDispatch {
  mixin(uuid("5de7a180-91b1-11d0-9484-00a0c91110ed"));
  // static DWINGUID IID = { 0x5de7a180, 0x91b1, 0x11d0, 0x94, 0x84, 0x00, 0xa0, 0xc9, 0x11, 0x10, 0xed };
  // DataValue object passed to Format/Unformat events
  /*[id(0x00000000)]*/ int set_Value(DWINVARIANT* pvar);
  // DataValue object passed to Format/Unformat events
  /*[id(0x00000000)]*/ int get_Value(out DWINVARIANT pvar);
  // TargetObject object passed to Format/Unformat events
  /*[id(0x00000001)]*/ int setref_TargetObject(IDispatch ObjectParam);
  // TargetObject object passed to Format/Unformat events
  /*[id(0x00000001)]*/ int get_TargetObject(out IDispatch ObjectParam);
}

// StdDataFormat Events
interface IStdDataFormatEvents : IDispatch {
  mixin(uuid("c2f13ed0-91b0-11d0-9484-00a0c91110ed"));
  // static DWINGUID IID = { 0xc2f13ed0, 0x91b0, 0x11d0, 0x94, 0x84, 0x00, 0xa0, 0xc9, 0x11, 0x10, 0xed };
  /+// Format event fired after formatting is applied to data
  /*[id(0x00000001)]*/ int Format(StdDataValue* DataValue);+/
  /+// Unformat event fired before unformatting is applied to data
  /*[id(0x00000002)]*/ int UnFormat(StdDataValue* DataValue);+/
  /+// Changed event fired when format property changed
  /*[id(0x00000003)]*/ int Changed();+/
}

// StdDataFormat Object
interface IStdDataFormatDisp : IDataFormatDisp {
  mixin(uuid("6c51b910-900b-11d0-9484-00a0c91110ed"));
  // static DWINGUID IID = { 0x6c51b910, 0x900b, 0x11d0, 0x94, 0x84, 0x00, 0xa0, 0xc9, 0x11, 0x10, 0xed };
  // Format type enumeration
  /*[id(0x00000001)]*/ int get_Type(out FormatType ptype);
  // Format type enumeration
  /*[id(0x00000001)]*/ int set_Type(FormatType ptype);
  // Format string used for formatting data
  /*[id(0x00000002)]*/ int get_Format(out wchar* pbstr);
  // Format string used for formatting data
  /*[id(0x00000002)]*/ int set_Format(wchar* pbstr);
  // Value to use if data to be formatted is true
  /*[id(0x00000003)]*/ int get_TrueValue(out DWINVARIANT pvar);
  // Value to use if data to be formatted is true
  /*[id(0x00000003)]*/ int set_TrueValue(DWINVARIANT* pvar);
  // Value to use if data to be formatted is false
  /*[id(0x00000004)]*/ int get_FalseValue(out DWINVARIANT pvar);
  // Value to use if data to be formatted is false
  /*[id(0x00000004)]*/ int set_FalseValue(DWINVARIANT* pvar);
  // Value to use if data to be formatted is NULL variant
  /*[id(0x00000005)]*/ int get_NullValue(out DWINVARIANT pvar);
  // Value to use if data to be formatted is NULL variant
  /*[id(0x00000005)]*/ int set_NullValue(DWINVARIANT* pvar);
  // First day of week enumeration
  /*[id(0x00000006)]*/ int get_FirstDayOfWeek(out FirstDayOfWeek pl);
  // First day of week enumeration
  /*[id(0x00000006)]*/ int set_FirstDayOfWeek(FirstDayOfWeek pl);
  // First week of year enumeration
  /*[id(0x00000007)]*/ int get_FirstWeekOfYear(out FirstWeekOfYear pl);
  // First week of year enumeration
  /*[id(0x00000007)]*/ int set_FirstWeekOfYear(FirstWeekOfYear pl);
}

// DataFormats Collection
interface IDataFormatsDisp : IDispatch {
  mixin(uuid("a1741ef6-ffc6-11d0-bd02-00c04fc2fb86"));
  // static DWINGUID IID = { 0xa1741ef6, 0xffc6, 0x11d0, 0xbd, 0x02, 0x00, 0xc0, 0x4f, 0xc2, 0xfb, 0x86 };
}

// StdDataFormats Object
interface IStdDataFormatsDisp : IDataFormatsDisp {
  mixin(uuid("99ff4676-ffc3-11d0-bd02-00c04fc2fb86"));
  // static DWINGUID IID = { 0x99ff4676, 0xffc3, 0x11d0, 0xbd, 0x02, 0x00, 0xc0, 0x4f, 0xc2, 0xfb, 0x86 };
  /*[id(0x00000001)]*/ int get_Count(out int plCount);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown _ppNewEnum);
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT Index, out DataFormat ppFormat);
  /*[id(0x00000005)]*/ int _ItemField(DWINVARIANT Field, out wchar* pbstrField);
  /*[id(0x00000002)]*/ int Add(DataFormat* pFormat, DWINVARIANT Index);
  /*[id(0x00000003)]*/ int Remove(DWINVARIANT Index);
  /*[id(0x00000004)]*/ int Clear();
}

// CoClasses

// StdDataValue Object
abstract class StdDataValue {
  mixin(uuid("2b11e9b0-9f09-11d0-9484-00a0c91110ed"));
  // static DWINGUID CLSID = { 0x2b11e9b0, 0x9f09, 0x11d0, 0x94, 0x84, 0x00, 0xa0, 0xc9, 0x11, 0x10, 0xed };
  mixin Interfaces!(IStdDataValueDisp);
}

// StdDataFormat Object
abstract class StdDataFormat {
  mixin(uuid("6d835690-900b-11d0-9484-00a0c91110ed"));
  // static DWINGUID CLSID = { 0x6d835690, 0x900b, 0x11d0, 0x94, 0x84, 0x00, 0xa0, 0xc9, 0x11, 0x10, 0xed };
  mixin Interfaces!(IStdDataFormatDisp);
}

// StdDataFormats Object
abstract class StdDataFormats {
  mixin(uuid("99ff4677-ffc3-11d0-bd02-00c04fc2fb86"));
  // static DWINGUID CLSID = { 0x99ff4677, 0xffc3, 0x11d0, 0xbd, 0x02, 0x00, 0xc0, 0x4f, 0xc2, 0xfb, 0x86 };
  mixin Interfaces!(IStdDataFormatsDisp);
}
