// krnlprov 1.0 Type Library
// Version 1.0

/*[uuid("6b100e1a-1385-4d1f-a02e-6e705a76bb6c")]*/
module dwin.sys.win32.com.tlb.more.krnlprov;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

interface IWbemEventProvider : IUnknown {
  mixin(uuid("e245105b-b06e-11d0-ad61-00c04fd8fdff"));
  // static DWINGUID IID = { 0xe245105b, 0xb06e, 0x11d0, 0xad, 0x61, 0x00, 0xc0, 0x4f, 0xd8, 0xfd, 0xff };
  /*[id(0x60010000)]*/ int ProvideEvents(IWbemObjectSink pSink, int lFlags);
}

interface IWbemObjectSink : IUnknown {
  mixin(uuid("7c857801-7381-11cf-884d-00aa004b2e24"));
  // static DWINGUID IID = { 0x7c857801, 0x7381, 0x11cf, 0x88, 0x4d, 0x00, 0xaa, 0x00, 0x4b, 0x2e, 0x24 };
  /*[id(0x60010000)]*/ int Indicate(int lObjectCount, IWbemClassObject* apObjArray);
  /*[id(0x60010001)]*/ int SetStatus(int lFlags, int hResult, wchar* strParam, IWbemClassObject pObjParam);
}

interface IWbemClassObject : IUnknown {
  mixin(uuid("dc12a681-737f-11cf-884d-00aa004b2e24"));
  // static DWINGUID IID = { 0xdc12a681, 0x737f, 0x11cf, 0x88, 0x4d, 0x00, 0xaa, 0x00, 0x4b, 0x2e, 0x24 };
  /*[id(0x60010000)]*/ int GetQualifierSet(out IWbemQualifierSet ppQualSet);
  /*[id(0x60010001)]*/ int Get(wchar* wszName, int lFlags, ref DWINVARIANT pVal, ref int pType, ref int plFlavor);
  /*[id(0x60010002)]*/ int Put(wchar* wszName, int lFlags, DWINVARIANT* pVal, int Type);
  /*[id(0x60010003)]*/ int Delete(wchar* wszName);
  /*[id(0x60010004)]*/ int GetNames(wchar* wszQualifierName, int lFlags, DWINVARIANT* pQualifierVal, out SAFEARRAY pNames);
  /*[id(0x60010005)]*/ int BeginEnumeration(int lEnumFlags);
  /*[id(0x60010006)]*/ int Next(int lFlags, ref wchar* strName, ref DWINVARIANT pVal, ref int pType, ref int plFlavor);
  /*[id(0x60010007)]*/ int EndEnumeration();
  /*[id(0x60010008)]*/ int GetPropertyQualifierSet(wchar* wszProperty, out IWbemQualifierSet ppQualSet);
  /*[id(0x60010009)]*/ int Clone(out IWbemClassObject ppCopy);
  /*[id(0x6001000A)]*/ int GetObjectText(int lFlags, out wchar* pstrObjectText);
  /*[id(0x6001000B)]*/ int SpawnDerivedClass(int lFlags, out IWbemClassObject ppNewClass);
  /*[id(0x6001000C)]*/ int SpawnInstance(int lFlags, out IWbemClassObject ppNewInstance);
  /*[id(0x6001000D)]*/ int CompareTo(int lFlags, IWbemClassObject pCompareTo);
  /*[id(0x6001000E)]*/ int GetPropertyOrigin(wchar* wszName, out wchar* pstrClassName);
  /*[id(0x6001000F)]*/ int InheritsFrom(wchar* strAncestor);
  /*[id(0x60010010)]*/ int GetMethod(wchar* wszName, int lFlags, out IWbemClassObject ppInSignature, out IWbemClassObject ppOutSignature);
  /*[id(0x60010011)]*/ int PutMethod(wchar* wszName, int lFlags, IWbemClassObject pInSignature, IWbemClassObject pOutSignature);
  /*[id(0x60010012)]*/ int DeleteMethod(wchar* wszName);
  /*[id(0x60010013)]*/ int BeginMethodEnumeration(int lEnumFlags);
  /*[id(0x60010014)]*/ int NextMethod(int lFlags, ref wchar* pstrName, ref IWbemClassObject ppInSignature, ref IWbemClassObject ppOutSignature);
  /*[id(0x60010015)]*/ int EndMethodEnumeration();
  /*[id(0x60010016)]*/ int GetMethodQualifierSet(wchar* wszMethod, out IWbemQualifierSet ppQualSet);
  /*[id(0x60010017)]*/ int GetMethodOrigin(wchar* wszMethodName, out wchar* pstrClassName);
}

interface IWbemQualifierSet : IUnknown {
  mixin(uuid("dc12a680-737f-11cf-884d-00aa004b2e24"));
  // static DWINGUID IID = { 0xdc12a680, 0x737f, 0x11cf, 0x88, 0x4d, 0x00, 0xaa, 0x00, 0x4b, 0x2e, 0x24 };
  /*[id(0x60010000)]*/ int Get(wchar* wszName, int lFlags, ref DWINVARIANT pVal, ref int plFlavor);
  /*[id(0x60010001)]*/ int Put(wchar* wszName, DWINVARIANT* pVal, int lFlavor);
  /*[id(0x60010002)]*/ int Delete(wchar* wszName);
  /*[id(0x60010003)]*/ int GetNames(int lFlags, out SAFEARRAY pNames);
  /*[id(0x60010004)]*/ int BeginEnumeration(int lFlags);
  /*[id(0x60010005)]*/ int Next(int lFlags, ref wchar* pstrName, ref DWINVARIANT pVal, ref int plFlavor);
  /*[id(0x60010006)]*/ int EndEnumeration();
}

// CoClasses

// KernelTraceProvider Class
abstract class KernelTraceProvider {
  mixin(uuid("9877d8a7-fda1-43f9-aeea-f90747ea66b0"));
  // static DWINGUID CLSID = { 0x9877d8a7, 0xfda1, 0x43f9, 0xae, 0xea, 0xf9, 0x07, 0x47, 0xea, 0x66, 0xb0 };
  mixin Interfaces!(IWbemEventProvider);
}
