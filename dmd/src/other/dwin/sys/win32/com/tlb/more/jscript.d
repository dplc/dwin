// Microsoft JScript Globals
// Version 1.0

/*[uuid("3eef9759-35fc-11d1-8ce4-00c04fc2b085")]*/
//module dwin.sys.win32.com.tlb.more.jsglobal;
module dwin.sys.win32.com.tlb.more.jscript;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

interface GlobalObj : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b086"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x86 };
  /+/*[id(0x00000002)]*/ DWINVARIANT Array();+/
  /+/*[id(0x00000003)]*/ DWINVARIANT Boolean();+/
  /+/*[id(0x00000004)]*/ DWINVARIANT Date();+/
  /+/*[id(0x00000005)]*/ DWINVARIANT Function();+/
  /+/*[id(0x00000006)]*/ DWINVARIANT Number();+/
  /+/*[id(0x00000007)]*/ DWINVARIANT Object();+/
  /+/*[id(0x00000008)]*/ DWINVARIANT String();+/
  /+/*[id(0x00000009)]*/ DWINVARIANT RegExp();+/
  /+/*[id(0x0000000A)]*/ DWINVARIANT ActiveXObject();+/
  /+/*[id(0x0000000B)]*/ DWINVARIANT VBArray();+/
  /+/*[id(0x0000000C)]*/ DWINVARIANT Enumerator();+/
  /+/*[id(0x0000000D)]*/ DWINVARIANT escape(DWINVARIANT String);+/
  /+/*[id(0x0000000E)]*/ DWINVARIANT eval(DWINVARIANT x);+/
  /+/*[id(0x0000000F)]*/ DWINVARIANT isNaN(DWINVARIANT Number);+/
  /+/*[id(0x00000010)]*/ DWINVARIANT isFinite(DWINVARIANT Number);+/
  /+/*[id(0x00000011)]*/ DWINVARIANT parseInt(DWINVARIANT String, DWINVARIANT radix);+/
  /+/*[id(0x00000012)]*/ DWINVARIANT parseFloat(DWINVARIANT String);+/
  /+/*[id(0x00000013)]*/ DWINVARIANT unescape(DWINVARIANT String);+/
  /+/*[id(0x00000014)]*/ DWINVARIANT GetObject(DWINVARIANT path, DWINVARIANT classname);+/
  /+/*[id(0x00000015)]*/ DWINVARIANT ScriptEngine();+/
  /+/*[id(0x00000016)]*/ DWINVARIANT ScriptEngineMajorVersion();+/
  /+/*[id(0x00000017)]*/ DWINVARIANT ScriptEngineMinorVersion();+/
  /+/*[id(0x00000018)]*/ DWINVARIANT ScriptEngineBuildVersion();+/
  /+/*[id(0x00000019)]*/ DWINVARIANT CollectGarbage();+/
  /+/*[id(0x0000001A)]*/ DWINVARIANT Math();+/
  /+const DWINVARIANT NaN;+/
  /+const DWINVARIANT Infinity;+/
}

interface DateObj : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b087"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x87 };
  /+/*[id(0x00000064)]*/ DWINVARIANT parse(DWINVARIANT String);+/
  /+/*[id(0x00000065)]*/ DWINVARIANT UTC(DWINVARIANT year, DWINVARIANT month, DWINVARIANT Date, DWINVARIANT hours, DWINVARIANT minutes, DWINVARIANT seconds, DWINVARIANT ms);+/
}

interface MathObj : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b088"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x88 };
  /+/*[id(0x000000D0)]*/ DWINVARIANT abs(DWINVARIANT x);+/
  /+/*[id(0x000000D1)]*/ DWINVARIANT acos(DWINVARIANT x);+/
  /+/*[id(0x000000D2)]*/ DWINVARIANT asin(DWINVARIANT x);+/
  /+/*[id(0x000000D3)]*/ DWINVARIANT atan(DWINVARIANT x);+/
  /+/*[id(0x000000D4)]*/ DWINVARIANT atan2(DWINVARIANT x, DWINVARIANT y);+/
  /+/*[id(0x000000D5)]*/ DWINVARIANT ceil(DWINVARIANT x);+/
  /+/*[id(0x000000D6)]*/ DWINVARIANT cos(DWINVARIANT x);+/
  /+/*[id(0x000000D7)]*/ DWINVARIANT exp(DWINVARIANT x);+/
  /+/*[id(0x000000D8)]*/ DWINVARIANT floor(DWINVARIANT x);+/
  /+/*[id(0x000000D9)]*/ DWINVARIANT log(DWINVARIANT x);+/
  /+/*[id(0x000000DA)]*/ DWINVARIANT max(DWINVARIANT x, DWINVARIANT y);+/
  /+/*[id(0x000000DB)]*/ DWINVARIANT min(DWINVARIANT x, DWINVARIANT y);+/
  /+/*[id(0x000000DC)]*/ DWINVARIANT pow(DWINVARIANT x, DWINVARIANT y);+/
  /+/*[id(0x000000DD)]*/ DWINVARIANT random();+/
  /+/*[id(0x000000DE)]*/ DWINVARIANT round(DWINVARIANT x);+/
  /+/*[id(0x000000DF)]*/ DWINVARIANT sin(DWINVARIANT x);+/
  /+/*[id(0x000000E0)]*/ DWINVARIANT sqrt(DWINVARIANT x);+/
  /+/*[id(0x000000E1)]*/ DWINVARIANT tan(DWINVARIANT x);+/
  /+const DWINVARIANT E;+/
  /+const DWINVARIANT LOG2E;+/
  /+const DWINVARIANT LOG10E;+/
  /+const DWINVARIANT LN2;+/
  /+const DWINVARIANT LN10;+/
  /+const DWINVARIANT PI;+/
  /+const DWINVARIANT SQRT2;+/
  /+const DWINVARIANT SQRT1_2;+/
}

interface NumberObj : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b089"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x89 };
  /+const DWINVARIANT MAX_VALUE;+/
  /+const DWINVARIANT MIN_VALUE;+/
  /+const DWINVARIANT NaN;+/
  /+const DWINVARIANT NEGATIVE_INFINITY;+/
  /+const DWINVARIANT POSITIVE_INFINITY;+/
}

interface RegExpObj : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b090"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x90 };
  /+const DWINVARIANT index;+/
  /+const DWINVARIANT input;+/
  /+const DWINVARIANT lastIndex;+/
}

interface StringObj : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b091"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x91 };
  /+/*[id(0x000001F4)]*/ DWINVARIANT fromCharCode(DWINVARIANT char0);+/
}

interface ArrayInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b092"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x92 };
  /+/*[id(0x00000259)]*/ ArrayInstance concat(DWINVARIANT Array);+/
  /+/*[id(0x0000025A)]*/ StringInstance join(DWINVARIANT separator);+/
  /+/*[id(0x0000025B)]*/ DWINVARIANT pop();+/
  /+/*[id(0x0000025C)]*/ DWINVARIANT push(DWINVARIANT value);+/
  /+/*[id(0x0000025D)]*/ ArrayInstance reverse();+/
  /+/*[id(0x0000025E)]*/ DWINVARIANT shift();+/
  /+/*[id(0x0000025F)]*/ ArrayInstance slice(DWINVARIANT start, DWINVARIANT end);+/
  /+/*[id(0x00000260)]*/ ArrayInstance sort(DWINVARIANT sortfunction);+/
  /+/*[id(0x00000261)]*/ ArrayInstance splice(DWINVARIANT start, DWINVARIANT deletecount);+/
  /+/*[id(0x00000262)]*/ StringInstance toString();+/
  /+/*[id(0x00000263)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x00000264)]*/ ArrayInstance valueOf();+/
  /+/*[id(0x00000265)]*/ DWINVARIANT unshift(DWINVARIANT value);+/
  /+/*[id(0x00000266)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x00000267)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x00000268)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
  /+const DWINVARIANT length;+/
}

interface FunctionInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b093"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x93 };
  /+/*[id(0x000002BD)]*/ StringInstance toString();+/
  /+/*[id(0x000002BE)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x000002BF)]*/ FunctionInstance valueOf();+/
  /+/*[id(0x000002C0)]*/ DWINVARIANT apply(DWINVARIANT thisValue, DWINVARIANT argArray);+/
  /+/*[id(0x000002C1)]*/ DWINVARIANT call(DWINVARIANT thisValue);+/
  /+/*[id(0x000002C2)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x000002C3)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x000002C4)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
  /+const DWINVARIANT length;+/
}

interface StringInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b094"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x94 };
  /+/*[id(0x00000321)]*/ StringInstance toString();+/
  /+/*[id(0x00000322)]*/ StringInstance valueOf();+/
  /+/*[id(0x00000323)]*/ StringInstance anchor(DWINVARIANT anchorString);+/
  /+/*[id(0x00000324)]*/ StringInstance big();+/
  /+/*[id(0x00000325)]*/ StringInstance blink();+/
  /+/*[id(0x00000326)]*/ StringInstance bold();+/
  /+/*[id(0x00000327)]*/ StringInstance charAt(DWINVARIANT index);+/
  /+/*[id(0x00000328)]*/ DWINVARIANT charCodeAt(DWINVARIANT index);+/
  /+/*[id(0x00000329)]*/ StringInstance concat(DWINVARIANT String);+/
  /+/*[id(0x0000032A)]*/ StringInstance fixed();+/
  /+/*[id(0x0000032B)]*/ StringInstance fontcolor(DWINVARIANT colorval);+/
  /+/*[id(0x0000032C)]*/ StringInstance fontsize(DWINVARIANT size);+/
  /+/*[id(0x0000032D)]*/ DWINVARIANT indexOf(DWINVARIANT substring, DWINVARIANT startindex);+/
  /+/*[id(0x0000032E)]*/ StringInstance italics();+/
  /+/*[id(0x0000032F)]*/ DWINVARIANT lastIndexOf(DWINVARIANT substring, DWINVARIANT startindex);+/
  /+/*[id(0x00000330)]*/ StringInstance link(DWINVARIANT linkstring);+/
  /+/*[id(0x00000331)]*/ DWINVARIANT match(DWINVARIANT RegExp);+/
  /+/*[id(0x00000332)]*/ StringInstance replace(DWINVARIANT RegExp, DWINVARIANT replacetext);+/
  /+/*[id(0x00000333)]*/ DWINVARIANT search(DWINVARIANT RegExp);+/
  /+/*[id(0x00000334)]*/ StringInstance slice(DWINVARIANT start, DWINVARIANT end);+/
  /+/*[id(0x00000335)]*/ StringInstance small();+/
  /+/*[id(0x00000336)]*/ ArrayInstance split(DWINVARIANT RegExp);+/
  /+/*[id(0x00000337)]*/ StringInstance strike();+/
  /+/*[id(0x00000338)]*/ StringInstance sub();+/
  /+/*[id(0x00000339)]*/ StringInstance substring(DWINVARIANT start, DWINVARIANT end);+/
  /+/*[id(0x0000033A)]*/ StringInstance substr(DWINVARIANT start, DWINVARIANT length);+/
  /+/*[id(0x0000033B)]*/ StringInstance sup();+/
  /+/*[id(0x0000033C)]*/ StringInstance toLowerCase();+/
  /+/*[id(0x0000033D)]*/ StringInstance toUpperCase();+/
  /+/*[id(0x0000033E)]*/ StringInstance toLocaleLowerCase();+/
  /+/*[id(0x0000033F)]*/ StringInstance toLocaleUpperCase();+/
  /+/*[id(0x00000340)]*/ DWINVARIANT localeCompare(DWINVARIANT that);+/
  /+/*[id(0x00000341)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x00000342)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x00000343)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
  /+const DWINVARIANT length;+/
}

interface BoolInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b095"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x95 };
  /+/*[id(0x00000384)]*/ StringInstance toString();+/
  /+/*[id(0x00000385)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x00000386)]*/ DWINVARIANT valueOf();+/
  /+/*[id(0x00000387)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x00000388)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x00000389)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
}

interface NumberInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b096"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x96 };
  /+/*[id(0x000003E8)]*/ StringInstance toString(DWINVARIANT radix);+/
  /+/*[id(0x000003E9)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x000003EA)]*/ StringInstance toFixed(DWINVARIANT fractionDigits);+/
  /+/*[id(0x000003EB)]*/ StringInstance toExponential(DWINVARIANT fractionDigits);+/
  /+/*[id(0x000003EC)]*/ StringInstance toPrecision(DWINVARIANT precision);+/
  /+/*[id(0x000003ED)]*/ DWINVARIANT valueOf();+/
  /+/*[id(0x000003EE)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x000003EF)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x000003F0)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
}

interface ObjectInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b097"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x97 };
  /+/*[id(0x0000044C)]*/ StringInstance toString();+/
  /+/*[id(0x0000044D)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x0000044E)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x0000044F)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x00000450)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
  /+/*[id(0x00000451)]*/ ObjectInstance valueOf();+/
}

interface DateInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b098"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x98 };
  /+/*[id(0x000004B0)]*/ StringInstance toString();+/
  /+/*[id(0x000004B1)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x000004B2)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x000004B3)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x000004B4)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
  /+/*[id(0x000004B5)]*/ DateInstance valueOf();+/
  /+/*[id(0x000004B6)]*/ StringInstance toUTCString();+/
  /+/*[id(0x000004B7)]*/ StringInstance toDateString();+/
  /+/*[id(0x000004B8)]*/ StringInstance toTimeString();+/
  /+/*[id(0x000004B9)]*/ StringInstance toLocaleDateString();+/
  /+/*[id(0x000004BA)]*/ StringInstance toLocaleTimeString();+/
  /+/*[id(0x000004BB)]*/ DWINVARIANT getTime();+/
  /+/*[id(0x000004BC)]*/ DWINVARIANT getFullYear();+/
  /+/*[id(0x000004BD)]*/ DWINVARIANT getUTCFullYear();+/
  /+/*[id(0x000004BE)]*/ DWINVARIANT getMonth();+/
  /+/*[id(0x000004BF)]*/ DWINVARIANT getUTCMonth();+/
  /+/*[id(0x000004C0)]*/ DWINVARIANT getDate();+/
  /+/*[id(0x000004C1)]*/ DWINVARIANT getUTCDate();+/
  /+/*[id(0x000004C2)]*/ DWINVARIANT getDay();+/
  /+/*[id(0x000004C3)]*/ DWINVARIANT getUTCDay();+/
  /+/*[id(0x000004C4)]*/ DWINVARIANT getHours();+/
  /+/*[id(0x000004C5)]*/ DWINVARIANT getUTCHours();+/
  /+/*[id(0x000004C6)]*/ DWINVARIANT getMinutes();+/
  /+/*[id(0x000004C7)]*/ DWINVARIANT getUTCMinutes();+/
  /+/*[id(0x000004C8)]*/ DWINVARIANT getSeconds();+/
  /+/*[id(0x000004C9)]*/ DWINVARIANT getUTCSeconds();+/
  /+/*[id(0x000004CA)]*/ DWINVARIANT getMilliseconds();+/
  /+/*[id(0x000004CB)]*/ DWINVARIANT getUTCMilliseconds();+/
  /+/*[id(0x000004CC)]*/ DWINVARIANT getTimezoneOffset();+/
  /+/*[id(0x000004CD)]*/ DateInstance setTime(DWINVARIANT time);+/
  /+/*[id(0x000004CE)]*/ DateInstance setMilliseconds(DWINVARIANT milliseconds);+/
  /+/*[id(0x000004CF)]*/ DateInstance setUTCMilliseconds(DWINVARIANT milliseconds);+/
  /+/*[id(0x000004D0)]*/ DateInstance setSeconds(DWINVARIANT seconds, DWINVARIANT milliseconds);+/
  /+/*[id(0x000004D1)]*/ DateInstance setUTCSeconds(DWINVARIANT seconds, DWINVARIANT milliseconds);+/
  /+/*[id(0x000004D2)]*/ DateInstance setMinutes(DWINVARIANT minutes, DWINVARIANT seconds, DWINVARIANT milliseconds);+/
  /+/*[id(0x000004D3)]*/ DateInstance setUTCMinutes(DWINVARIANT minutes, DWINVARIANT seconds, DWINVARIANT milliseconds);+/
  /+/*[id(0x000004D4)]*/ DateInstance setHours(DWINVARIANT hours, DWINVARIANT minutes, DWINVARIANT seconds, DWINVARIANT milliseconds);+/
  /+/*[id(0x000004D5)]*/ DateInstance setUTCHours(DWINVARIANT hours, DWINVARIANT minutes, DWINVARIANT seconds, DWINVARIANT milliseconds);+/
  /+/*[id(0x000004D6)]*/ DateInstance setDate(DWINVARIANT Date);+/
  /+/*[id(0x000004D7)]*/ DateInstance setUTCDate(DWINVARIANT Date);+/
  /+/*[id(0x000004D8)]*/ DateInstance setMonth(DWINVARIANT month, DWINVARIANT Date);+/
  /+/*[id(0x000004D9)]*/ DateInstance setUTCMonth(DWINVARIANT month, DWINVARIANT Date);+/
  /+/*[id(0x000004DA)]*/ DateInstance setFullYear(DWINVARIANT year, DWINVARIANT month, DWINVARIANT Date);+/
  /+/*[id(0x000004DB)]*/ DateInstance setUTCFullYear(DWINVARIANT year, DWINVARIANT month, DWINVARIANT Date);+/
}

interface RegExpInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b099"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x99 };
  /+/*[id(0x00000519)]*/ StringInstance toString();+/
  /+/*[id(0x0000051A)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x0000051B)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x0000051C)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x0000051D)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
  /+/*[id(0x0000051E)]*/ ArrayInstance exec(DWINVARIANT String);+/
  /+const StringInstance source;+/
  /+const DWINVARIANT global;+/
  /+const DWINVARIANT ignoreCase;+/
  /+const DWINVARIANT multiline;+/
  /+const DWINVARIANT lastIndex;+/
}

interface ErrorInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b09a"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x9a };
  /+/*[id(0x0000057D)]*/ StringInstance toString();+/
  /+/*[id(0x0000057E)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x0000057F)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x00000580)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x00000581)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
  /+const StringInstance name;+/
  /+const StringInstance message;+/
  /+const DWINVARIANT ignoreCase;+/
  /+const DWINVARIANT multiline;+/
  /+const DWINVARIANT lastIndex;+/
}

interface EvalErrorInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b09b"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x9b };
  /+/*[id(0x0000057D)]*/ StringInstance toString();+/
  /+/*[id(0x0000057E)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x0000057F)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x00000580)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x00000581)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
  /+const StringInstance name;+/
  /+const StringInstance message;+/
  /+const DWINVARIANT ignoreCase;+/
  /+const DWINVARIANT multiline;+/
  /+const DWINVARIANT lastIndex;+/
}

interface RangeErrorInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b09c"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x9c };
  /+/*[id(0x0000057D)]*/ StringInstance toString();+/
  /+/*[id(0x0000057E)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x0000057F)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x00000580)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x00000581)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
  /+const StringInstance name;+/
  /+const StringInstance message;+/
  /+const DWINVARIANT ignoreCase;+/
  /+const DWINVARIANT multiline;+/
  /+const DWINVARIANT lastIndex;+/
}

interface ReferenceErrorInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b09d"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x9d };
  /+/*[id(0x0000057D)]*/ StringInstance toString();+/
  /+/*[id(0x0000057E)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x0000057F)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x00000580)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x00000581)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
  /+const StringInstance name;+/
  /+const StringInstance message;+/
  /+const DWINVARIANT ignoreCase;+/
  /+const DWINVARIANT multiline;+/
  /+const DWINVARIANT lastIndex;+/
}

interface SyntaxErrorInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b09e"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x9e };
  /+/*[id(0x0000057D)]*/ StringInstance toString();+/
  /+/*[id(0x0000057E)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x0000057F)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x00000580)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x00000581)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
  /+const StringInstance name;+/
  /+const StringInstance message;+/
  /+const DWINVARIANT ignoreCase;+/
  /+const DWINVARIANT multiline;+/
  /+const DWINVARIANT lastIndex;+/
}

interface TypeErrorInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b09f"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0x9f };
  /+/*[id(0x0000057D)]*/ StringInstance toString();+/
  /+/*[id(0x0000057E)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x0000057F)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x00000580)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x00000581)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
  /+const StringInstance name;+/
  /+const StringInstance message;+/
  /+const DWINVARIANT ignoreCase;+/
  /+const DWINVARIANT multiline;+/
  /+const DWINVARIANT lastIndex;+/
}

interface URIErrorInstance : IDispatch {
  mixin(uuid("3eef9758-35fc-11d1-8ce4-00c04fc2b0a0"));
  // static DWINGUID IID = { 0x3eef9758, 0x35fc, 0x11d1, 0x8c, 0xe4, 0x00, 0xc0, 0x4f, 0xc2, 0xb0, 0xa0 };
  /+/*[id(0x0000057D)]*/ StringInstance toString();+/
  /+/*[id(0x0000057E)]*/ StringInstance toLocaleString();+/
  /+/*[id(0x0000057F)]*/ DWINVARIANT hasOwnProperty(DWINVARIANT propertyName);+/
  /+/*[id(0x00000580)]*/ DWINVARIANT propertyIsEnumerable(DWINVARIANT propertyName);+/
  /+/*[id(0x00000581)]*/ DWINVARIANT isPrototypeOf(DWINVARIANT obj);+/
  /+const StringInstance name;+/
  /+const StringInstance message;+/
  /+const DWINVARIANT ignoreCase;+/
  /+const DWINVARIANT multiline;+/
  /+const DWINVARIANT lastIndex;+/
}
