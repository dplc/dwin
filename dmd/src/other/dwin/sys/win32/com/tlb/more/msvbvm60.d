// Visual Basic For Applications
// Version 6.0

/*[uuid("000204ef-0000-0000-c000-000000000046")]*/
//module dwin.sys.win32.com.tlb.more.vba;
module dwin.sys.win32.com.tlb.more.msvbvm60;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

enum VbVarType {
  vbEmpty = 0x00000000,
  vbNull = 0x00000001,
  vbInteger = 0x00000002,
  vbLong = 0x00000003,
  vbSingle = 0x00000004,
  vbDouble = 0x00000005,
  vbCurrency = 0x00000006,
  vbDate = 0x00000007,
  vbString = 0x00000008,
  vbObject = 0x00000009,
  vbError = 0x0000000A,
  vbBoolean = 0x0000000B,
  vbVariant = 0x0000000C,
  vbDataObject = 0x0000000D,
  vbDecimal = 0x0000000E,
  vbByte = 0x00000011,
  vbUserDefinedType = 0x00000024,
  vbArray = 0x00002000,
}

enum VbMsgBoxStyle {
  vbOKOnly = 0x00000000,
  vbOKCancel = 0x00000001,
  vbAbortRetryIgnore = 0x00000002,
  vbYesNoCancel = 0x00000003,
  vbYesNo = 0x00000004,
  vbRetryCancel = 0x00000005,
  vbCritical = 0x00000010,
  vbQuestion = 0x00000020,
  vbExclamation = 0x00000030,
  vbInformation = 0x00000040,
  vbDefaultButton1 = 0x00000000,
  vbDefaultButton2 = 0x00000100,
  vbDefaultButton3 = 0x00000200,
  vbDefaultButton4 = 0x00000300,
  vbApplicationModal = 0x00000000,
  vbSystemModal = 0x00001000,
  vbMsgBoxHelpButton = 0x00004000,
  vbMsgBoxRight = 0x00080000,
  vbMsgBoxRtlReading = 0x00100000,
  vbMsgBoxSetForeground = 0x00010000,
}

enum VbMsgBoxResult {
  vbOK = 0x00000001,
  vbCancel = 0x00000002,
  vbAbort = 0x00000003,
  vbRetry = 0x00000004,
  vbIgnore = 0x00000005,
  vbYes = 0x00000006,
  vbNo = 0x00000007,
}

enum VbFileAttribute {
  vbNormal = 0x00000000,
  vbReadOnly = 0x00000001,
  vbHidden = 0x00000002,
  vbSystem = 0x00000004,
  vbVolume = 0x00000008,
  vbDirectory = 0x00000010,
  vbArchive = 0x00000020,
  vbAlias = 0x00000040,
}

enum VbStrConv {
  vbUpperCase = 0x00000001,
  vbLowerCase = 0x00000002,
  vbProperCase = 0x00000003,
  vbWide = 0x00000004,
  vbNarrow = 0x00000008,
  vbKatakana = 0x00000010,
  vbHiragana = 0x00000020,
  vbUnicode = 0x00000040,
  vbFromUnicode = 0x00000080,
}

enum VbDayOfWeek {
  vbUseSystemDayOfWeek = 0x00000000,
  vbSunday = 0x00000001,
  vbMonday = 0x00000002,
  vbTuesday = 0x00000003,
  vbWednesday = 0x00000004,
  vbThursday = 0x00000005,
  vbFriday = 0x00000006,
  vbSaturday = 0x00000007,
}

enum VbFirstWeekOfYear {
  vbUseSystem = 0x00000000,
  vbFirstJan1 = 0x00000001,
  vbFirstFourDays = 0x00000002,
  vbFirstFullWeek = 0x00000003,
}

enum VbIMEStatus {
  vbIMENoOp = 0x00000000,
  vbIMEModeNoControl = 0x00000000,
  vbIMEOn = 0x00000001,
  vbIMEModeOn = 0x00000001,
  vbIMEOff = 0x00000002,
  vbIMEModeOff = 0x00000002,
  vbIMEDisable = 0x00000003,
  vbIMEModeDisable = 0x00000003,
  vbIMEHiragana = 0x00000004,
  vbIMEModeHiragana = 0x00000004,
  vbIMEKatakanaDbl = 0x00000005,
  vbIMEModeKatakana = 0x00000005,
  vbIMEKatakanaSng = 0x00000006,
  vbIMEModeKatakanaHalf = 0x00000006,
  vbIMEAlphaDbl = 0x00000007,
  vbIMEModeAlphaFull = 0x00000007,
  vbIMEAlphaSng = 0x00000008,
  vbIMEModeAlpha = 0x00000008,
  vbIMEModeHangulFull = 0x00000009,
  vbIMEModeHangul = 0x0000000A,
}

enum VbAppWinStyle {
  vbHide = 0x00000000,
  vbNormalFocus = 0x00000001,
  vbMinimizedFocus = 0x00000002,
  vbMaximizedFocus = 0x00000003,
  vbNormalNoFocus = 0x00000004,
  vbMinimizedNoFocus = 0x00000006,
}

enum VbCompareMethod {
  vbBinaryCompare = 0x00000000,
  vbTextCompare = 0x00000001,
  vbDatabaseCompare = 0x00000002,
}

enum VbCalendar {
  vbCalGreg = 0x00000000,
  vbCalHijri = 0x00000001,
}

enum VbDateTimeFormat {
  vbGeneralDate = 0x00000000,
  vbLongDate = 0x00000001,
  vbShortDate = 0x00000002,
  vbLongTime = 0x00000003,
  vbShortTime = 0x00000004,
}

enum VbTriState {
  vbUseDefault = 0xFFFFFFFE,
  vbTrue = 0xFFFFFFFF,
  vbFalse = 0x00000000,
}

enum VbCallType {
  VbMethod = 0x00000001,
  VbGet = 0x00000002,
  VbLet = 0x00000004,
  VbSet = 0x00000008,
}

// Interfaces

interface _HiddenInterface {
  mixin(uuid("1e196b20-1f3c-1069-996b-00dd010ef676"));
  // static DWINGUID IID = { 0x1e196b20, 0x1f3c, 0x1069, 0x99, 0x6b, 0x00, 0xdd, 0x01, 0x0e, 0xf6, 0x76 };
  /*[id(0x60000000)]*/ void LCase();
  /*[id(0x60000001)]*/ void Left();
  /*[id(0x60000002)]*/ void LTrim();
  /*[id(0x60000003)]*/ void Right();
  /*[id(0x60000004)]*/ void RTrim();
  /*[id(0x60000005)]*/ void Space();
  /*[id(0x60000006)]*/ void Trim();
  /*[id(0x60000007)]*/ void String();
  /*[id(0x60000008)]*/ void UCase();
  /*[id(0x60000009)]*/ void Str();
  /*[id(0x6000000A)]*/ void Chr();
  /*[id(0x6000000B)]*/ void Date();
  /*[id(0x6000000C)]*/ void Time();
  /*[id(0x6000000D)]*/ void Hex();
  /*[id(0x6000000E)]*/ void Oct();
  /*[id(0x6000000F)]*/ void LeftB();
  /*[id(0x60000010)]*/ void RightB();
  /*[id(0x60000011)]*/ void Mid();
  /*[id(0x60000012)]*/ void MidB();
  /*[id(0x60000013)]*/ void StrConv();
  /*[id(0x60000014)]*/ void Error();
  /*[id(0x60000015)]*/ void CurDir();
  /*[id(0x60000016)]*/ void Format();
  /*[id(0x60000017)]*/ void Environ();
  /*[id(0x60000018)]*/ void Command();
  /*[id(0x60000019)]*/ void ChrB();
  /*[id(0x6000001A)]*/ void ChrW();
}

interface _ErrObject : IDispatch {
  mixin(uuid("a4c466b8-499f-101b-bb78-00aa00383cbb"));
  // static DWINGUID IID = { 0xa4c466b8, 0x499f, 0x101b, 0xbb, 0x78, 0x00, 0xaa, 0x00, 0x38, 0x3c, 0xbb };
  /*[id(0x00000000)]*/ int get_Number(out int pi4);
  /*[id(0x00000000)]*/ int set_Number(int pi4);
  /*[id(0x60020002)]*/ int get_Source(out wchar* pbstr);
  /*[id(0x60020002)]*/ int set_Source(wchar* pbstr);
  /*[id(0x60020004)]*/ int get_Description(out wchar* pbstr);
  /*[id(0x60020004)]*/ int set_Description(wchar* pbstr);
  /*[id(0x60020006)]*/ int get_HelpFile(out wchar* pbstr);
  /*[id(0x60020006)]*/ int set_HelpFile(wchar* pbstr);
  /*[id(0x60020008)]*/ int get_HelpContext(out int pi4);
  /*[id(0x60020008)]*/ int set_HelpContext(int pi4);
  /*[id(0x6002000A)]*/ int Raise(int Number, DWINVARIANT* Source, DWINVARIANT* Description, DWINVARIANT* HelpFile, DWINVARIANT* HelpContext);
  /*[id(0x6002000B)]*/ void Clear();
  /*[id(0x6002000C)]*/ int get_LastDllError(out int pi4);
}

interface _Collection : IDispatch {
  mixin(uuid("a4c46780-499f-101b-bb78-00aa00383cbb"));
  // static DWINGUID IID = { 0xa4c46780, 0x499f, 0x101b, 0xbb, 0x78, 0x00, 0xaa, 0x00, 0x38, 0x3c, 0xbb };
  /*[id(0x00000000)]*/ int Item(DWINVARIANT* Index, out DWINVARIANT pvarRet);
  /*[id(0x00000001)]*/ int Add(DWINVARIANT* Item, DWINVARIANT* Key, DWINVARIANT* Before, DWINVARIANT* After);
  /*[id(0x00000002)]*/ int Count(out int pi4);
  /*[id(0x00000003)]*/ int Remove(DWINVARIANT* Index);
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown ppunk);
}

// CoClasses

abstract class ErrObject {
  mixin(uuid("a4c46654-499f-101b-bb78-00aa00383cbb"));
  // static DWINGUID CLSID = { 0xa4c46654, 0x499f, 0x101b, 0xbb, 0x78, 0x00, 0xaa, 0x00, 0x38, 0x3c, 0xbb };
  mixin Interfaces!(_ErrObject);
}

abstract class Collection {
  mixin(uuid("a4c4671c-499f-101b-bb78-00aa00383cbb"));
  // static DWINGUID CLSID = { 0xa4c4671c, 0x499f, 0x101b, 0xbb, 0x78, 0x00, 0xaa, 0x00, 0x38, 0x3c, 0xbb };
  mixin Interfaces!(_Collection);
}

// Global variables
const int vbObjectError = 0x80040000;
const char* vbNullString = "";
const char* vbNullChar = "\0";
const char* vbCrLf = "\r\n";
const char* vbNewLine = "\r\n";
const char* vbCr = "\r";
const char* vbLf = "\n";
const char* vbBack = "\b";
const char* vbFormFeed = "\f";
const char* vbTab = "\t";
const char* vbVerticalTab = "\v";

// Global functions

extern (Windows):

/*[id(0x60000000)]*/ short Asc(wchar* String);
/*[id(0x60000001)]*/ wchar* _B_str_Chr(int CharCode);
/*[id(0x60000002)]*/ DWINVARIANT _B_var_Chr(int CharCode);
/*[id(0x60000003)]*/ wchar* _B_str_LCase(wchar* String);
/*[id(0x60000004)]*/ DWINVARIANT _B_var_LCase(DWINVARIANT* String);
/*[id(0x60000005)]*/ wchar* _B_str_Mid(wchar* String, int Start, DWINVARIANT* Length);
/*[id(0x60000006)]*/ DWINVARIANT _B_var_Mid(DWINVARIANT* String, int Start, DWINVARIANT* Length);
/*[id(0x60000007)]*/ wchar* _B_str_MidB(wchar* String, int Start, DWINVARIANT* Length);
/*[id(0x60000008)]*/ DWINVARIANT _B_var_MidB(DWINVARIANT* String, int Start, DWINVARIANT* Length);
/*[id(0x60000009)]*/ DWINVARIANT InStr(DWINVARIANT* Start, DWINVARIANT* String1, DWINVARIANT* String2, VbCompareMethod Compare);
/*[id(0x6000000A)]*/ DWINVARIANT InStrB(DWINVARIANT* Start, DWINVARIANT* String1, DWINVARIANT* String2, VbCompareMethod Compare);
/*[id(0x6000000B)]*/ wchar* _B_str_Left(wchar* String, int Length);
/*[id(0x6000000C)]*/ DWINVARIANT _B_var_Left(DWINVARIANT* String, int Length);
/*[id(0x6000000D)]*/ wchar* _B_str_LeftB(wchar* String, int Length);
/*[id(0x6000000E)]*/ DWINVARIANT _B_var_LeftB(DWINVARIANT* String, int Length);
/*[id(0x6000000F)]*/ wchar* _B_str_LTrim(wchar* String);
/*[id(0x60000010)]*/ DWINVARIANT _B_var_LTrim(DWINVARIANT* String);
/*[id(0x60000011)]*/ wchar* _B_str_RightB(wchar* String, int Length);
/*[id(0x60000012)]*/ DWINVARIANT _B_var_RightB(DWINVARIANT* String, int Length);
/*[id(0x60000013)]*/ wchar* _B_str_Right(wchar* String, int Length);
/*[id(0x60000014)]*/ DWINVARIANT _B_var_Right(DWINVARIANT* String, int Length);
/*[id(0x60000015)]*/ wchar* _B_str_RTrim(wchar* String);
/*[id(0x60000016)]*/ DWINVARIANT _B_var_RTrim(DWINVARIANT* String);
/*[id(0x60000017)]*/ wchar* _B_str_Space(int Number);
/*[id(0x60000018)]*/ DWINVARIANT _B_var_Space(int Number);
/*[id(0x60000019)]*/ DWINVARIANT _B_var_StrConv(DWINVARIANT* String, VbStrConv Conversion, int LocaleID);
/*[id(0x6000001A)]*/ wchar* _B_str_String(int Number, DWINVARIANT* Character);
/*[id(0x6000001B)]*/ DWINVARIANT _B_var_String(int Number, DWINVARIANT* Character);
/*[id(0x6000001C)]*/ wchar* _B_str_Trim(wchar* String);
/*[id(0x6000001D)]*/ DWINVARIANT _B_var_Trim(DWINVARIANT* String);
/*[id(0x6000001E)]*/ wchar* _B_str_UCase(wchar* String);
/*[id(0x6000001F)]*/ DWINVARIANT _B_var_UCase(DWINVARIANT* String);
/*[id(0x60000020)]*/ DWINVARIANT StrComp(DWINVARIANT* String1, DWINVARIANT* String2, VbCompareMethod Compare);
/*[id(0x60000021)]*/ wchar* _B_str_Format(DWINVARIANT* Expression, DWINVARIANT* Format, VbDayOfWeek FirstDayOfWeek, VbFirstWeekOfYear FirstWeekOfYear);
/*[id(0x60000022)]*/ DWINVARIANT _B_var_Format(DWINVARIANT* Expression, DWINVARIANT* Format, VbDayOfWeek FirstDayOfWeek, VbFirstWeekOfYear FirstWeekOfYear);
/*[id(0x60000023)]*/ DWINVARIANT Len(DWINVARIANT* Expression);
/*[id(0x60000024)]*/ DWINVARIANT LenB(DWINVARIANT* Expression);
/*[id(0x60000025)]*/ ubyte AscB(wchar* String);
/*[id(0x60000026)]*/ wchar* _B_str_ChrB(ubyte CharCode);
/*[id(0x60000027)]*/ DWINVARIANT _B_var_ChrB(ubyte CharCode);
/*[id(0x60000028)]*/ short AscW(wchar* String);
/*[id(0x60000029)]*/ wchar* _B_str_ChrW(int CharCode);
/*[id(0x6000002A)]*/ DWINVARIANT _B_var_ChrW(int CharCode);
// Formats expression as date
/*[id(0x6000002B)]*/ wchar* FormatDateTime(DWINVARIANT* Expression, VbDateTimeFormat NamedFormat);
// Formats expression as number
/*[id(0x6000002C)]*/ wchar* FormatNumber(DWINVARIANT* Expression, int NumDigitsAfterDecimal, VbTriState IncludeLeadingDigit, VbTriState UseParensForNegativeNumbers, VbTriState GroupDigits);
// Formats expression as percent
/*[id(0x6000002D)]*/ wchar* FormatPercent(DWINVARIANT* Expression, int NumDigitsAfterDecimal, VbTriState IncludeLeadingDigit, VbTriState UseParensForNegativeNumbers, VbTriState GroupDigits);
// Formats expression as currency
/*[id(0x6000002E)]*/ wchar* FormatCurrency(DWINVARIANT* Expression, int NumDigitsAfterDecimal, VbTriState IncludeLeadingDigit, VbTriState UseParensForNegativeNumbers, VbTriState GroupDigits);
// Returns localized weekday name
/*[id(0x6000002F)]*/ wchar* WeekdayName(int Weekday, short Abbreviate, VbDayOfWeek FirstDayOfWeek);
// Returns localized month name
/*[id(0x60000030)]*/ wchar* MonthName(int Month, short Abbreviate);
// Find and replace a substring within a string
/*[id(0x60000031)]*/ wchar* Replace(wchar* Expression, wchar* Find, wchar* Replace, int Start, int Count, VbCompareMethod Compare);
// Reverse a string
/*[id(0x60000032)]*/ wchar* StrReverse(wchar* Expression);
// Join array elements into a string
/*[id(0x60000033)]*/ wchar* Join(DWINVARIANT* SourceArray, DWINVARIANT* Delimiter);
// Return array of matches
/*[id(0x60000034)]*/ DWINVARIANT Filter(DWINVARIANT* SourceArray, wchar* Match, short Include, VbCompareMethod Compare);
// Returns the position of the last occurrence of one string within another
/*[id(0x60000035)]*/ int InStrRev(wchar* StringCheck, wchar* StringMatch, int Start, VbCompareMethod Compare);
// Split a string into an array
/*[id(0x60000036)]*/ DWINVARIANT Split(wchar* Expression, DWINVARIANT* Delimiter, int Limit, VbCompareMethod Compare);
/*[id(0x60000000)]*/ wchar* _B_str_Hex(DWINVARIANT* Number);
/*[id(0x60000001)]*/ DWINVARIANT _B_var_Hex(DWINVARIANT* Number);
/*[id(0x60000002)]*/ wchar* _B_str_Oct(DWINVARIANT* Number);
/*[id(0x60000003)]*/ DWINVARIANT _B_var_Oct(DWINVARIANT* Number);
/*[id(0x60000004)]*/ int MacID(wchar* Constant);
/*[id(0x60000005)]*/ wchar* _B_str_Str(DWINVARIANT* Number);
/*[id(0x60000006)]*/ DWINVARIANT _B_var_Str(DWINVARIANT* Number);
/*[id(0x60000007)]*/ double Val(wchar* String);
/*[id(0x60000008)]*/ wchar* CStr(DWINVARIANT* Expression);
/*[id(0x60000009)]*/ ubyte CByte(DWINVARIANT* Expression);
/*[id(0x6000000A)]*/ short CBool(DWINVARIANT* Expression);
/*[id(0x6000000B)]*/ long CCur(DWINVARIANT* Expression);
/*[id(0x6000000C)]*/ double CDate(DWINVARIANT* Expression);
/*[id(0x6000000D)]*/ DWINVARIANT CVDate(DWINVARIANT* Expression);
/*[id(0x6000000E)]*/ short CInt(DWINVARIANT* Expression);
/*[id(0x6000000F)]*/ int CLng(DWINVARIANT* Expression);
/*[id(0x60000010)]*/ float CSng(DWINVARIANT* Expression);
/*[id(0x60000011)]*/ double CDbl(DWINVARIANT* Expression);
/*[id(0x60000012)]*/ DWINVARIANT CVar(DWINVARIANT* Expression);
/*[id(0x60000013)]*/ DWINVARIANT CVErr(DWINVARIANT* Expression);
/*[id(0x60000014)]*/ wchar* _B_str_Error(DWINVARIANT* ErrorNumber);
/*[id(0x60000015)]*/ DWINVARIANT _B_var_Error(DWINVARIANT* ErrorNumber);
/*[id(0x60000016)]*/ DWINVARIANT Fix(DWINVARIANT* Number);
/*[id(0x60000017)]*/ DWINVARIANT Int(DWINVARIANT* Number);
/*[id(0x60000018)]*/ int CDec(DWINVARIANT* Expression, out DWINVARIANT pvar);
/*[id(0x60000000)]*/ void ChDir(wchar* Path);
/*[id(0x60000001)]*/ void ChDrive(wchar* Drive);
/*[id(0x60000002)]*/ short EOF(short FileNumber);
/*[id(0x60000003)]*/ int FileAttr(short FileNumber, short ReturnType);
/*[id(0x60000004)]*/ void FileCopy(wchar* Source, wchar* Destination);
/*[id(0x60000005)]*/ DWINVARIANT FileDateTime(wchar* PathName);
/*[id(0x60000006)]*/ int FileLen(wchar* PathName);
/*[id(0x60000007)]*/ VbFileAttribute GetAttr(wchar* PathName);
/*[id(0x60000008)]*/ void Kill(DWINVARIANT* PathName);
/*[id(0x60000009)]*/ int Loc(short FileNumber);
/*[id(0x6000000A)]*/ int LOF(short FileNumber);
/*[id(0x6000000B)]*/ void MkDir(wchar* Path);
/*[id(0x6000000C)]*/ void Reset();
/*[id(0x6000000D)]*/ void RmDir(wchar* Path);
/*[id(0x6000000E)]*/ int Seek(short FileNumber);
/*[id(0x6000000F)]*/ void SetAttr(wchar* PathName, VbFileAttribute Attributes);
/*[id(0x60000010)]*/ wchar* _B_str_CurDir(DWINVARIANT* Drive);
/*[id(0x60000011)]*/ DWINVARIANT _B_var_CurDir(DWINVARIANT* Drive);
/*[id(0x60000012)]*/ short FreeFile(DWINVARIANT* RangeNumber);
/*[id(0x60000013)]*/ wchar* Dir(DWINVARIANT* PathName, VbFileAttribute Attributes);
/*[id(0x60000000)]*/ DWINVARIANT _B_var_Date();
///*[id(0x60000001)]*/ void _B_str_Date();
///*[id(0x60000000)]*/ void _B_var_Date();
/*[id(0x60000001)]*/ wchar* _B_str_Date();
/*[id(0x60000004)]*/ DWINVARIANT DateSerial(short Year, short Month, short Day);
/*[id(0x60000005)]*/ DWINVARIANT DateValue(wchar* Date);
/*[id(0x60000006)]*/ DWINVARIANT Day(DWINVARIANT* Date);
/*[id(0x60000007)]*/ DWINVARIANT Hour(DWINVARIANT* Time);
/*[id(0x60000008)]*/ DWINVARIANT Minute(DWINVARIANT* Time);
/*[id(0x60000009)]*/ DWINVARIANT Month(DWINVARIANT* Date);
/*[id(0x6000000A)]*/ DWINVARIANT Now();
/*[id(0x6000000B)]*/ DWINVARIANT Second(DWINVARIANT* Time);
/*[id(0x6000000C)]*/ DWINVARIANT _B_var_Time();
///*[id(0x6000000D)]*/ void _B_str_Time();
///*[id(0x6000000C)]*/ void _B_var_Time();
/*[id(0x6000000D)]*/ wchar* _B_str_Time();
/*[id(0x60000010)]*/ float Timer();
/*[id(0x60000011)]*/ DWINVARIANT TimeSerial(short Hour, short Minute, short Second);
/*[id(0x60000012)]*/ DWINVARIANT TimeValue(wchar* Time);
/*[id(0x60000013)]*/ DWINVARIANT Weekday(DWINVARIANT* Date, VbDayOfWeek FirstDayOfWeek);
/*[id(0x60000014)]*/ DWINVARIANT Year(DWINVARIANT* Date);
/*[id(0x60000015)]*/ DWINVARIANT DateAdd(wchar* Interval, double Number, DWINVARIANT* Date);
/*[id(0x60000016)]*/ DWINVARIANT DateDiff(wchar* Interval, DWINVARIANT* Date1, DWINVARIANT* Date2, VbDayOfWeek FirstDayOfWeek, VbFirstWeekOfYear FirstWeekOfYear);
/*[id(0x60000017)]*/ DWINVARIANT DatePart(wchar* Interval, DWINVARIANT* Date, VbDayOfWeek FirstDayOfWeek, VbFirstWeekOfYear FirstWeekOfYear);
/*[id(0x60000018)]*/ VbCalendar Calendar();
///*[id(0x60000018)]*/ void Calendar();
/*[id(0x60000000)]*/ int Erl();
/*[id(0x60000001)]*/ ErrObject* Err();
/*[id(0x60000002)]*/ VbIMEStatus IMEStatus();
/*[id(0x60000003)]*/ short IsArray(DWINVARIANT* VarName);
/*[id(0x60000004)]*/ short IsDate(DWINVARIANT* Expression);
/*[id(0x60000005)]*/ short IsEmpty(DWINVARIANT* Expression);
/*[id(0x60000006)]*/ short IsError(DWINVARIANT* Expression);
/*[id(0x60000007)]*/ short IsMissing(DWINVARIANT* ArgName);
/*[id(0x60000008)]*/ short IsNull(DWINVARIANT* Expression);
/*[id(0x60000009)]*/ short IsNumeric(DWINVARIANT* Expression);
/*[id(0x6000000A)]*/ short IsObject(DWINVARIANT* Expression);
/*[id(0x6000000B)]*/ wchar* TypeName(DWINVARIANT* VarName);
/*[id(0x6000000C)]*/ VbVarType VarType(DWINVARIANT* VarName);
/*[id(0x6000000D)]*/ int QBColor(short Color);
/*[id(0x6000000E)]*/ int RGB(short Red, short Green, short Blue);
/*[id(0x60000000)]*/ void AppActivate(DWINVARIANT* Title, DWINVARIANT* Wait);
/*[id(0x60000001)]*/ void Beep();
/*[id(0x60000002)]*/ DWINVARIANT CreateObject(wchar* Class, wchar* ServerName);
/*[id(0x60000003)]*/ short DoEvents();
/*[id(0x60000004)]*/ DWINVARIANT GetObject(DWINVARIANT* PathName, DWINVARIANT* Class);
/*[id(0x60000005)]*/ wchar* InputBox(DWINVARIANT* Prompt, DWINVARIANT* Title, DWINVARIANT* Default, DWINVARIANT* XPos, DWINVARIANT* YPos, DWINVARIANT* HelpFile, DWINVARIANT* Context);
/*[id(0x60000006)]*/ wchar* MacScript(wchar* Script);
/*[id(0x60000007)]*/ VbMsgBoxResult MsgBox(DWINVARIANT* Prompt, VbMsgBoxStyle Buttons, DWINVARIANT* Title, DWINVARIANT* HelpFile, DWINVARIANT* Context);
/*[id(0x60000008)]*/ void SendKeys(wchar* String, DWINVARIANT* Wait);
/*[id(0x60000009)]*/ double Shell(DWINVARIANT* PathName, VbAppWinStyle WindowStyle);
/*[id(0x6000000A)]*/ DWINVARIANT Partition(DWINVARIANT* Number, DWINVARIANT* Start, DWINVARIANT* Stop, DWINVARIANT* Interval);
/*[id(0x6000000B)]*/ DWINVARIANT Choose(float Index, SAFEARRAY* Choice);
/*[id(0x6000000C)]*/ DWINVARIANT _B_var_Environ(DWINVARIANT* Expression);
/*[id(0x6000000D)]*/ wchar* _B_str_Environ(DWINVARIANT* Expression);
/*[id(0x6000000E)]*/ DWINVARIANT Switch(SAFEARRAY* VarExpr);
/*[id(0x6000000F)]*/ DWINVARIANT _B_var_Command();
/*[id(0x60000010)]*/ wchar* _B_str_Command();
/*[id(0x60000011)]*/ DWINVARIANT IIf(DWINVARIANT* Expression, DWINVARIANT* TruePart, DWINVARIANT* FalsePart);
/*[id(0x60000012)]*/ wchar* GetSetting(wchar* AppName, wchar* Section, wchar* Key, DWINVARIANT Default);
/*[id(0x60000013)]*/ void SaveSetting(wchar* AppName, wchar* Section, wchar* Key, wchar* Setting);
/*[id(0x60000014)]*/ void DeleteSetting(wchar* AppName, DWINVARIANT Section, DWINVARIANT Key);
/*[id(0x60000015)]*/ DWINVARIANT GetAllSettings(wchar* AppName, wchar* Section);
// Support IDispatch::Invoke
/*[id(0x60000016)]*/ DWINVARIANT CallByName(IDispatch ObjectParam, wchar* ProcName, VbCallType CallType, SAFEARRAY* Args, int lcid);
/*[id(0x60000000)]*/ DWINVARIANT Abs(DWINVARIANT* Number);
/*[id(0x60000001)]*/ double Atn(double Number);
/*[id(0x60000002)]*/ double Cos(double Number);
/*[id(0x60000003)]*/ double Exp(double Number);
/*[id(0x60000004)]*/ double Log(double Number);
/*[id(0x60000005)]*/ void Randomize(DWINVARIANT* Number);
/*[id(0x60000006)]*/ float Rnd(DWINVARIANT* Number);
/*[id(0x60000007)]*/ double Sin(double Number);
/*[id(0x60000008)]*/ double Sqr(double Number);
/*[id(0x60000009)]*/ double Tan(double Number);
/*[id(0x6000000A)]*/ DWINVARIANT Sgn(DWINVARIANT* Number);
// Round to a given number of decimal places
/*[id(0x6000000B)]*/ DWINVARIANT Round(DWINVARIANT* Number, int NumDigitsAfterDecimal);
/*[id(0x60000000)]*/ double SLN(double Cost, double Salvage, double Life);
/*[id(0x60000001)]*/ double SYD(double Cost, double Salvage, double Life, double Period);
/*[id(0x60000002)]*/ double DDB(double Cost, double Salvage, double Life, double Period, DWINVARIANT* Factor);
/*[id(0x60000003)]*/ double IPmt(double Rate, double Per, double NPer, double PV, DWINVARIANT* FV, DWINVARIANT* Due);
/*[id(0x60000004)]*/ double PPmt(double Rate, double Per, double NPer, double PV, DWINVARIANT* FV, DWINVARIANT* Due);
/*[id(0x60000005)]*/ double Pmt(double Rate, double NPer, double PV, DWINVARIANT* FV, DWINVARIANT* Due);
/*[id(0x60000006)]*/ double PV(double Rate, double NPer, double Pmt, DWINVARIANT* FV, DWINVARIANT* Due);
/*[id(0x60000007)]*/ double FV(double Rate, double NPer, double Pmt, DWINVARIANT* PV, DWINVARIANT* Due);
/*[id(0x60000008)]*/ double NPer(double Rate, double Pmt, double PV, DWINVARIANT* FV, DWINVARIANT* Due);
/*[id(0x60000009)]*/ double Rate(double NPer, double Pmt, double PV, DWINVARIANT* FV, DWINVARIANT* Due, DWINVARIANT* Guess);
/*[id(0x6000000A)]*/ double IRR(SAFEARRAY* ValueArray, DWINVARIANT* Guess);
/*[id(0x6000000B)]*/ double MIRR(SAFEARRAY* ValueArray, double FinanceRate, double ReinvestRate);
/*[id(0x6000000C)]*/ double NPV(double Rate, SAFEARRAY* ValueArray);
/*[id(0x60000000)]*/ DWINVARIANT Array(SAFEARRAY* ArgList);
/*[id(0x60000001)]*/ wchar* _B_str_InputB(int Number, short FileNumber);
/*[id(0x60000002)]*/ DWINVARIANT _B_var_InputB(int Number, short FileNumber);
/*[id(0x60000003)]*/ wchar* _B_str_Input(int Number, short FileNumber);
/*[id(0x60000004)]*/ DWINVARIANT _B_var_Input(int Number, short FileNumber);
/*[id(0x60000005)]*/ void Width(short FileNumber, short Width);
/*[id(0x60000006)]*/ int VarPtr(void* Ptr);
/*[id(0x60000007)]*/ int StrPtr(wchar* Ptr);
/*[id(0x60000008)]*/ int ObjPtr(IUnknown Ptr);
