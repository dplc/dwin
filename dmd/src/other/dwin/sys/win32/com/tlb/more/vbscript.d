// Microsoft VBScript Globals
// Version 1.0

/*[uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b185")]*/
//module dwin.sys.win32.com.tlb.more.vbscript_global;
module dwin.sys.win32.com.tlb.more.vbscript;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

interface GlobalObj : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b186"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb1, 0x86 };
  /+/*[id(0x00000064)]*/ DWINVARIANT CCur(DWINVARIANT expression);+/
  /+/*[id(0x00000065)]*/ DWINVARIANT CInt(DWINVARIANT expression);+/
  /+/*[id(0x00000066)]*/ DWINVARIANT CLng(DWINVARIANT expression);+/
  /+/*[id(0x00000067)]*/ DWINVARIANT CBool(DWINVARIANT expression);+/
  /+/*[id(0x00000068)]*/ DWINVARIANT CByte(DWINVARIANT expression);+/
  /+/*[id(0x00000069)]*/ DWINVARIANT CDate(DWINVARIANT expression);+/
  /+/*[id(0x0000006A)]*/ DWINVARIANT CDbl(DWINVARIANT expression);+/
  /+/*[id(0x0000006B)]*/ DWINVARIANT CSng(DWINVARIANT expression);+/
  /+/*[id(0x0000006C)]*/ DWINVARIANT CStr(DWINVARIANT expression);+/
  /+/*[id(0x0000006D)]*/ DWINVARIANT Hex(DWINVARIANT number);+/
  /+/*[id(0x0000006E)]*/ DWINVARIANT Oct(DWINVARIANT number);+/
  /+/*[id(0x0000006F)]*/ DWINVARIANT VarType(DWINVARIANT varname);+/
  /+/*[id(0x00000070)]*/ DWINVARIANT IsDate(DWINVARIANT expression);+/
  /+/*[id(0x00000071)]*/ DWINVARIANT IsEmpty(DWINVARIANT expression);+/
  /+/*[id(0x00000072)]*/ DWINVARIANT IsNull(DWINVARIANT expression);+/
  /+/*[id(0x00000073)]*/ DWINVARIANT IsNumeric(DWINVARIANT expression);+/
  /+/*[id(0x00000074)]*/ DWINVARIANT IsArray(DWINVARIANT expression);+/
  /+/*[id(0x00000075)]*/ DWINVARIANT IsObject(DWINVARIANT identifier);+/
  /+/*[id(0x00000076)]*/ DWINVARIANT Atn(DWINVARIANT number);+/
  /+/*[id(0x00000077)]*/ DWINVARIANT Cos(DWINVARIANT number);+/
  /+/*[id(0x00000078)]*/ DWINVARIANT Sin(DWINVARIANT number);+/
  /+/*[id(0x00000079)]*/ DWINVARIANT Tan(DWINVARIANT number);+/
  /+/*[id(0x0000007A)]*/ DWINVARIANT Exp(DWINVARIANT number);+/
  /+/*[id(0x0000007B)]*/ DWINVARIANT Log(DWINVARIANT number);+/
  /+/*[id(0x0000007C)]*/ DWINVARIANT Sqr(DWINVARIANT number);+/
  /+/*[id(0x0000007D)]*/ DWINVARIANT Randomize(DWINVARIANT number);+/
  /+/*[id(0x0000007E)]*/ DWINVARIANT Rnd(DWINVARIANT number);+/
  /+/*[id(0x0000007F)]*/ DWINVARIANT Timer();+/
  /+/*[id(0x00000080)]*/ DWINVARIANT LBound(DWINVARIANT arrayname);+/
  /+/*[id(0x00000081)]*/ DWINVARIANT UBound(DWINVARIANT arrayname);+/
  /+/*[id(0x00000082)]*/ DWINVARIANT RGB(DWINVARIANT red, DWINVARIANT green, DWINVARIANT blue);+/
  /+/*[id(0x00000083)]*/ DWINVARIANT Len(DWINVARIANT string);+/
  /+/*[id(0x00000084)]*/ DWINVARIANT LenB(DWINVARIANT string);+/
  /+/*[id(0x00000085)]*/ DWINVARIANT Left(DWINVARIANT string, DWINVARIANT length);+/
  /+/*[id(0x00000086)]*/ DWINVARIANT LeftB(DWINVARIANT string, DWINVARIANT length);+/
  /+/*[id(0x00000087)]*/ DWINVARIANT Right(DWINVARIANT string, DWINVARIANT length);+/
  /+/*[id(0x00000088)]*/ DWINVARIANT RightB(DWINVARIANT string, DWINVARIANT length);+/
  /+/*[id(0x00000089)]*/ DWINVARIANT Mid(DWINVARIANT string, DWINVARIANT start, DWINVARIANT length);+/
  /+/*[id(0x0000008A)]*/ DWINVARIANT MidB(DWINVARIANT string, DWINVARIANT start, DWINVARIANT length);+/
  /+/*[id(0x0000008B)]*/ DWINVARIANT StrComp(DWINVARIANT string1, DWINVARIANT string2, DWINVARIANT compare);+/
  /+/*[id(0x0000008C)]*/ DWINVARIANT LCase(DWINVARIANT string);+/
  /+/*[id(0x0000008D)]*/ DWINVARIANT UCase(DWINVARIANT string);+/
  /+/*[id(0x0000008E)]*/ DWINVARIANT LTrim(DWINVARIANT string);+/
  /+/*[id(0x0000008F)]*/ DWINVARIANT RTrim(DWINVARIANT string);+/
  /+/*[id(0x00000090)]*/ DWINVARIANT Trim(DWINVARIANT string);+/
  /+/*[id(0x00000091)]*/ DWINVARIANT Space(DWINVARIANT number);+/
  /+/*[id(0x00000092)]*/ DWINVARIANT string(DWINVARIANT number, DWINVARIANT character);+/
  /+/*[id(0x00000093)]*/ DWINVARIANT InStr(DWINVARIANT start, DWINVARIANT string, DWINVARIANT string2, DWINVARIANT compare);+/
  /+/*[id(0x00000094)]*/ DWINVARIANT InStrB(DWINVARIANT start, DWINVARIANT string, DWINVARIANT string2, DWINVARIANT compare);+/
  /+/*[id(0x00000095)]*/ DWINVARIANT AscB(DWINVARIANT string);+/
  /+/*[id(0x00000096)]*/ DWINVARIANT ChrB(DWINVARIANT charcode);+/
  /+/*[id(0x00000097)]*/ DWINVARIANT Asc(DWINVARIANT string);+/
  /+/*[id(0x00000098)]*/ DWINVARIANT Chr(DWINVARIANT charcode);+/
  /+/*[id(0x00000099)]*/ DWINVARIANT AscW(DWINVARIANT string);+/
  /+/*[id(0x0000009A)]*/ DWINVARIANT ChrW(DWINVARIANT charcode);+/
  /+/*[id(0x0000009B)]*/ DWINVARIANT Abs(DWINVARIANT number);+/
  /+/*[id(0x0000009C)]*/ DWINVARIANT Fix(DWINVARIANT number);+/
  /+/*[id(0x0000009D)]*/ DWINVARIANT Int(DWINVARIANT number);+/
  /+/*[id(0x0000009E)]*/ DWINVARIANT Sgn(DWINVARIANT number);+/
  /+/*[id(0x0000009F)]*/ DWINVARIANT Now();+/
  /+/*[id(0x000000A0)]*/ DWINVARIANT Date();+/
  /+/*[id(0x000000A1)]*/ DWINVARIANT Time();+/
  /+/*[id(0x000000A2)]*/ DWINVARIANT Day(DWINVARIANT Date);+/
  /+/*[id(0x000000A3)]*/ DWINVARIANT Month(DWINVARIANT Date);+/
  /+/*[id(0x000000A4)]*/ DWINVARIANT Weekday(DWINVARIANT Date, DWINVARIANT firstdayofweek);+/
  /+/*[id(0x000000A5)]*/ DWINVARIANT Year(DWINVARIANT Date);+/
  /+/*[id(0x000000A6)]*/ DWINVARIANT Hour(DWINVARIANT Time);+/
  /+/*[id(0x000000A7)]*/ DWINVARIANT Minute(DWINVARIANT Time);+/
  /+/*[id(0x000000A8)]*/ DWINVARIANT Second(DWINVARIANT Time);+/
  /+/*[id(0x000000A9)]*/ DWINVARIANT DateValue(DWINVARIANT Date);+/
  /+/*[id(0x000000AA)]*/ DWINVARIANT TimeValue(DWINVARIANT Time);+/
  /+/*[id(0x000000AB)]*/ DWINVARIANT DateSerial(DWINVARIANT Year, DWINVARIANT Month, DWINVARIANT Date);+/
  /+/*[id(0x000000AC)]*/ DWINVARIANT TimeSerial(DWINVARIANT Hour, DWINVARIANT Minute, DWINVARIANT Second);+/
  /+/*[id(0x000000AD)]*/ DWINVARIANT InputBox(DWINVARIANT prompt, DWINVARIANT title, DWINVARIANT defaultValue, DWINVARIANT xpos, DWINVARIANT ypos, DWINVARIANT helpfile, DWINVARIANT context);+/
  /+/*[id(0x000000AE)]*/ DWINVARIANT MsgBox(DWINVARIANT prompt, DWINVARIANT buttons, DWINVARIANT title, DWINVARIANT helpfile, DWINVARIANT context);+/
  /+/*[id(0x000000AF)]*/ DWINVARIANT CreateObject(DWINVARIANT classValue);+/
  /+/*[id(0x000000B0)]*/ DWINVARIANT GetObject(DWINVARIANT pathname, DWINVARIANT classValue);+/
  /+/*[id(0x000000B1)]*/ DWINVARIANT DateAdd(DWINVARIANT interval, DWINVARIANT number, DWINVARIANT Date);+/
  /+/*[id(0x000000B2)]*/ DWINVARIANT DateDiff(DWINVARIANT interval, DWINVARIANT date1, DWINVARIANT date2, DWINVARIANT firstdayofweek, DWINVARIANT firstdayofyear);+/
  /+/*[id(0x000000B3)]*/ DWINVARIANT DatePart(DWINVARIANT interval, DWINVARIANT Date, DWINVARIANT firstdayofweek, DWINVARIANT firstdayofyear);+/
  /+/*[id(0x000000B4)]*/ DWINVARIANT TypeName(DWINVARIANT varname);+/
  /+/*[id(0x000000B5)]*/ DWINVARIANT Array(DWINVARIANT arglist);+/
  /+/*[id(0x000000B6)]*/ DWINVARIANT Erase(DWINVARIANT arraylist);+/
  /+/*[id(0x000000B7)]*/ DWINVARIANT Filter(DWINVARIANT InputStrings, DWINVARIANT Value, DWINVARIANT Include, DWINVARIANT compare);+/
  /+/*[id(0x000000B8)]*/ DWINVARIANT Join(DWINVARIANT list, DWINVARIANT delimiter);+/
  /+/*[id(0x000000B9)]*/ DWINVARIANT Split(DWINVARIANT expression, DWINVARIANT delimiter, DWINVARIANT count, DWINVARIANT compare);+/
  /+/*[id(0x000000BA)]*/ DWINVARIANT Replace(DWINVARIANT expression, DWINVARIANT find, DWINVARIANT replacement, DWINVARIANT start, DWINVARIANT count, DWINVARIANT compare);+/
  /+/*[id(0x000000BB)]*/ DWINVARIANT StrReverse(DWINVARIANT string1);+/
  /+/*[id(0x000000BC)]*/ DWINVARIANT InStrRev(DWINVARIANT string1, DWINVARIANT string2, DWINVARIANT start, DWINVARIANT compare);+/
  /+/*[id(0x000000BD)]*/ DWINVARIANT LoadPicture(DWINVARIANT stringexpression);+/
  /+/*[id(0x000000BE)]*/ DWINVARIANT ScriptEngine();+/
  /+/*[id(0x000000BF)]*/ DWINVARIANT ScriptEngineMajorVersion();+/
  /+/*[id(0x000000C0)]*/ DWINVARIANT ScriptEngineMinorVersion();+/
  /+/*[id(0x000000C1)]*/ DWINVARIANT ScriptEngineBuildVersion();+/
  /+/*[id(0x000000C2)]*/ DWINVARIANT FormatNumber(DWINVARIANT expression, DWINVARIANT NumDigitsAfterDecimal, DWINVARIANT IncludeLeadingDigit, DWINVARIANT UseParensForNegativeNumbers, DWINVARIANT GroupDigits);+/
  /+/*[id(0x000000C3)]*/ DWINVARIANT FormatCurrency(DWINVARIANT expression, DWINVARIANT NumDigitsAfterDecimal, DWINVARIANT IncludeLeadingDigit, DWINVARIANT UseParensForNegativeNumbers, DWINVARIANT GroupDigits);+/
  /+/*[id(0x000000C4)]*/ DWINVARIANT FormatPercent(DWINVARIANT expression, DWINVARIANT NumDigitsAfterDecimal, DWINVARIANT IncludeLeadingDigit, DWINVARIANT UseParensForNegativeNumbers, DWINVARIANT GroupDigits);+/
  /+/*[id(0x000000C5)]*/ DWINVARIANT FormatDateTime(DWINVARIANT Date, DWINVARIANT NamedFormat);+/
  /+/*[id(0x000000C6)]*/ DWINVARIANT WeekdayName(DWINVARIANT Weekday, DWINVARIANT abbreviate, DWINVARIANT firstdayofweek);+/
  /+/*[id(0x000000C7)]*/ DWINVARIANT MonthName(DWINVARIANT Month, DWINVARIANT abbreviate);+/
  /+/*[id(0x000000C8)]*/ DWINVARIANT Round(DWINVARIANT expression, DWINVARIANT numdecimalplaces);+/
  /+/*[id(0x000000C9)]*/ DWINVARIANT Escape(DWINVARIANT string);+/
  /+/*[id(0x000000CA)]*/ DWINVARIANT Unescape(DWINVARIANT string);+/
  /+/*[id(0x000000CB)]*/ DWINVARIANT Eval(DWINVARIANT string);+/
  /+/*[id(0x000000CC)]*/ DWINVARIANT Execute(DWINVARIANT string);+/
  /+/*[id(0x000000CD)]*/ DWINVARIANT ExecuteGlobal(DWINVARIANT string);+/
  /+/*[id(0x000000CE)]*/ DWINVARIANT GetRef(DWINVARIANT string);+/
  /+const DWINVARIANT vbUseSystem;+/
  /+const DWINVARIANT vbUseSystemDayOfWeek;+/
  /+const DWINVARIANT vbSunday;+/
  /+const DWINVARIANT vbMonday;+/
  /+const DWINVARIANT vbTuesday;+/
  /+const DWINVARIANT vbWednesday;+/
  /+const DWINVARIANT vbThursday;+/
  /+const DWINVARIANT vbFriday;+/
  /+const DWINVARIANT vbSaturday;+/
  /+const DWINVARIANT vbFirstJan1;+/
  /+const DWINVARIANT vbFirstFourDays;+/
  /+const DWINVARIANT vbFirstFullWeek;+/
  /+const DWINVARIANT vbOKOnly;+/
  /+const DWINVARIANT vbOKCancel;+/
  /+const DWINVARIANT vbAbortRetryIgnore;+/
  /+const DWINVARIANT vbYesNoCancel;+/
  /+const DWINVARIANT vbYesNo;+/
  /+const DWINVARIANT vbRetryCancel;+/
  /+const DWINVARIANT vbCritical;+/
  /+const DWINVARIANT vbQuestion;+/
  /+const DWINVARIANT vbExclamation;+/
  /+const DWINVARIANT vbInformation;+/
  /+const DWINVARIANT vbDefaultButton1;+/
  /+const DWINVARIANT vbDefaultButton2;+/
  /+const DWINVARIANT vbDefaultButton3;+/
  /+const DWINVARIANT vbDefaultButton4;+/
  /+const DWINVARIANT vbApplicationModal;+/
  /+const DWINVARIANT vbSystemModal;+/
  /+const DWINVARIANT vbOK;+/
  /+const DWINVARIANT vbCancel;+/
  /+const DWINVARIANT vbAbort;+/
  /+const DWINVARIANT vbRetry;+/
  /+const DWINVARIANT vbIgnore;+/
  /+const DWINVARIANT vbYes;+/
  /+const DWINVARIANT vbNo;+/
  /+const DWINVARIANT vbEmpty;+/
  /+const DWINVARIANT vbNull;+/
  /+const DWINVARIANT vbInteger;+/
  /+const DWINVARIANT vbLong;+/
  /+const DWINVARIANT vbSingle;+/
  /+const DWINVARIANT vbDouble;+/
  /+const DWINVARIANT vbCurrency;+/
  /+const DWINVARIANT vbDate;+/
  /+const DWINVARIANT vbString;+/
  /+const DWINVARIANT vbObject;+/
  /+const DWINVARIANT vbError;+/
  /+const DWINVARIANT vbBoolean;+/
  /+const DWINVARIANT vbVariant;+/
  /+const DWINVARIANT vbDataObject;+/
  /+const DWINVARIANT vbDecimal;+/
  /+const DWINVARIANT vbByte;+/
  /+const DWINVARIANT vbArray;+/
  /+const DWINVARIANT vbTrue;+/
  /+const DWINVARIANT vbFalse;+/
  /+const DWINVARIANT vbUseDefault;+/
  /+const DWINVARIANT vbBinaryCompare;+/
  /+const DWINVARIANT vbTextCompare;+/
  /+const DWINVARIANT vbDatabaseCompare;+/
  /+const DWINVARIANT vbGeneralDate;+/
  /+const DWINVARIANT vbLongDate;+/
  /+const DWINVARIANT vbShortDate;+/
  /+const DWINVARIANT vbLongTime;+/
  /+const DWINVARIANT vbShortTime;+/
  /+const DWINVARIANT vbObjectError;+/
  /+const DWINVARIANT vbBlack;+/
  /+const DWINVARIANT vbBlue;+/
  /+const DWINVARIANT vbCyan;+/
  /+const DWINVARIANT vbGreen;+/
  /+const DWINVARIANT vbMagenta;+/
  /+const DWINVARIANT vbRed;+/
  /+const DWINVARIANT vbWhite;+/
  /+const DWINVARIANT vbYellow;+/
  /+const DWINVARIANT vbCr;+/
  /+const DWINVARIANT vbCrLf;+/
  /+const DWINVARIANT vbNewLine;+/
  /+const DWINVARIANT vbFormFeed;+/
  /+const DWINVARIANT vbLf;+/
  /+const DWINVARIANT vbNullChar;+/
  /+const DWINVARIANT vbNullString;+/
  /+const DWINVARIANT vbTab;+/
  /+const DWINVARIANT vbVerticalTab;+/
  /+const DWINVARIANT vbMsgBoxHelpButton;+/
  /+const DWINVARIANT VbMsgBoxSetForeground;+/
  /+const DWINVARIANT vbMsgBoxRight;+/
  /+const DWINVARIANT vbMsgBoxRtlReading;+/
}

interface ErrObj : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b187"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb1, 0x87 };
  /+/*[id(0x00000064)]*/ DWINVARIANT Clear();+/
  /+/*[id(0x00000065)]*/ DWINVARIANT Raise(DWINVARIANT number, DWINVARIANT Source, DWINVARIANT Description, DWINVARIANT helpfile, DWINVARIANT HelpContext);+/
  /+const DWINVARIANT Description;+/
  /+const DWINVARIANT HelpContext;+/
  /+const DWINVARIANT helpfile;+/
  /+const DWINVARIANT number;+/
  /+const DWINVARIANT Source;+/
}
