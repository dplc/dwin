// Microsoft Data Binding Collection VB 6.0 (SP4)
// Version 1.0

/*[uuid("56bf9020-7a2f-11d0-9482-00a0c91110ed")]*/
module dwin.sys.win32.com.tlb.more.MSBIND;

private import dwin.sys.win32.com.tlb.stdole2;
/*[importlib("msstdfmt.dll")]*/
private import dwin.sys.win32.com.tlb.more.msdatasrc;
private import dwin.sys.win32.com.Core;
private import dwin.sys.win32.com.tlb.more.MSSTDFMT;

// Enums

// Enum of Binding Collection UpdateModes
enum UpdateMode {
  vbUsePropertyAttributes = 0x00000000,
  vbUpdateWhenPropertyChanges = 0x00000001,
  vbUpdateWhenRowChanges = 0x00000002,
}

// Interfaces

// Binding Object
interface DBinding : IDispatch {
  mixin(uuid("3e60c550-7bd6-11d0-9482-00a0c91110ed"));
  // static DWINGUID IID = { 0x3e60c550, 0x7bd6, 0x11d0, 0x94, 0x82, 0x00, 0xa0, 0xc9, 0x11, 0x10, 0xed };
  // Object that is bound to data
  /*[id(0x00000001)]*/ int get_Object(out IUnknown ppObject);
  // Object that is bound to data
  /*[id(0x00000001)]*/ int setref_Object(IUnknown ppObject);
  // Data field or column in recordset that is bound to object
  /*[id(0x00000002)]*/ int get_DataField(out wchar* pbstrDataField);
  // Data field or column in recordset that is bound to object
  /*[id(0x00000002)]*/ int set_DataField(wchar* pbstrDataField);
  // Property name of object that is bound
  /*[id(0x00000003)]*/ int get_PropertyName(out wchar* pbstrPropertyName);
  // Property name of object that is bound
  /*[id(0x00000003)]*/ int set_PropertyName(wchar* pbstrPropertyName);
  // Property marking when data has changed
  /*[id(0x00000004)]*/ int get_DataChanged(out short pfDataChanged);
  // Property marking when data has changed
  /*[id(0x00000004)]*/ int set_DataChanged(short pfDataChanged);
  // DataFormat Object to use when binding to object
  /*[id(0x00000005)]*/ int get_DataFormat(out IDataFormatDisp ppdf);
  // DataFormat Object to use when binding to object
  /*[id(0x00000005)]*/ int setref_DataFormat(IDataFormatDisp ppdf);
  // Key value for use in identifying Binding Object in Binding Collection
  /*[id(0x00000006)]*/ int get_Key(out wchar* pbstrKey);
}

// Binding Collection Object
interface DBindingCollection : IDispatch {
  mixin(uuid("57f12da0-7a2f-11d0-9482-00a0c91110ed"));
  // static DWINGUID IID = { 0x57f12da0, 0x7a2f, 0x11d0, 0x94, 0x82, 0x00, 0xa0, 0xc9, 0x11, 0x10, 0xed };
  // Object representing source of data for Binding Collection
  /*[id(0x00000001)]*/ int get_DataSource(out DataSource ppds);
  // Object representing source of data for Binding Collection
  /*[id(0x00000001)]*/ int setref_DataSource(DataSource ppds);
  // Name of Data Member to use in binding to Data Source, if applicable
  /*[id(0x00000005)]*/ int get_DataMember(out DataMember pdm);
  // Name of Data Member to use in binding to Data Source, if applicable
  /*[id(0x00000005)]*/ int set_DataMember(DataMember pdm);
  // Creates a Binding by associating a control to a data field and adds the Binding to the Binding Collection
  /*[id(0x00000002)]*/ int Add(IDispatch ObjectParam, wchar* PropertyName, wchar* DataField, IDataFormatDisp DataFormat, wchar* Key, out DBinding ppbinding);
  // Removes a Binding from the Binding Collection
  /*[id(0x00000003)]*/ int Remove(DWINVARIANT index);
  // Retrieves a Binding from the Binding Collection
  /*[id(0x00000000)]*/ int get_Item(DWINVARIANT index, out DBinding ppbinding);
  // Returns the number of Bindings in the Binding Collection
  /*[id(0x00000004)]*/ int get_Count(out int Count);
  // Enumerates Bindings in the Binding Collection
  /*[id(0xFFFFFFFC)]*/ int _NewEnum(out IUnknown ppNewEnum);
  // Clears all Bindings from the Binding Collection
  /*[id(0x00000006)]*/ int Clear();
  // Enum of Binding Collection UpdateModes
  /*[id(0x00000007)]*/ int get_UpdateMode(out UpdateMode plUM);
  // Enum of Binding Collection UpdateModes
  /*[id(0x00000007)]*/ int set_UpdateMode(UpdateMode plUM);
  // Method to force all Bindings in Binding Collection to refetch data
  /*[id(0x00000008)]*/ int UpdateControls();
}

// Binding Collection Event Interface
interface DBindingCollectionEvents : IDispatch {
  mixin(uuid("2651dd90-db42-11d1-b1cd-00a0c922e820"));
  // static DWINGUID IID = { 0x2651dd90, 0xdb42, 0x11d1, 0xb1, 0xcd, 0x00, 0xa0, 0xc9, 0x22, 0xe8, 0x20 };
  /+// Binding Collection Error Event
  /*[id(0x0000012C)]*/ void Error(int Error, wchar* Description, DBinding Binding, out short fCancelDisplay);+/
}

// CoClasses

// Binding Object
abstract class Binding {
  mixin(uuid("3e60c551-7bd6-11d0-9482-00a0c91110ed"));
  // static DWINGUID CLSID = { 0x3e60c551, 0x7bd6, 0x11d0, 0x94, 0x82, 0x00, 0xa0, 0xc9, 0x11, 0x10, 0xed };
  mixin Interfaces!(DBinding);
}

// Binding Collection Object
abstract class BindingCollection {
  mixin(uuid("59245250-7a2f-11d0-9482-00a0c91110ed"));
  // static DWINGUID CLSID = { 0x59245250, 0x7a2f, 0x11d0, 0x94, 0x82, 0x00, 0xa0, 0xc9, 0x11, 0x10, 0xed };
  mixin Interfaces!(DBindingCollection);
}
