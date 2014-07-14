// MTS 2.0 Admin Type Library
// Version 1.0

/*[uuid("6eb22880-8a19-11d0-81b6-00a0c9231c29")]*/
module dwin.sys.win32.com.tlb.more.mtsadmin;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// Package install options - these options can be or'ed together
enum __MIDL___MIDL_itf_mtxadmin_0107_0001 {
  mtsInstallUsers = 0x00000001,
}

// Package export options - these options can be or'ed together
enum __MIDL___MIDL_itf_mtxadmin_0107_0002 {
  mtsExportUsers = 0x00000001,
}

// Error codes (HRESULTS)
enum __MIDL___MIDL_itf_mtxadmin_0107_0003 {
  mtsErrObjectErrors = 0x80110401,
  mtsErrObjectInvalid = 0x80110402,
  mtsErrKeyMissing = 0x80110403,
  mtsErrAlreadyInstalled = 0x80110404,
  mtsErrDownloadFailed = 0x80110405,
  mtsErrPDFWriteFail = 0x80110407,
  mtsErrPDFReadFail = 0x80110408,
  mtsErrPDFVersion = 0x80110409,
  mtsErrCoReqCompInstalled = 0x80110410,
  mtsErrBadPath = 0x8011040A,
  mtsErrPackageExists = 0x8011040B,
  mtsErrRoleExists = 0x8011040C,
  mtsErrCantCopyFile = 0x8011040D,
  mtsErrNoTypeLib = 0x8011040E,
  mtsErrNoUser = 0x8011040F,
  mtsErrInvalidUserids = 0x80110410,
  mtsErrNoRegistryCLSID = 0x80110411,
  mtsErrBadRegistryProgID = 0x80110412,
  mtsErrAuthenticationLevel = 0x80110413,
  mtsErrUserPasswdNotValid = 0x80110414,
  mtsErrNoRegistryRead = 0x80110415,
  mtsErrNoRegistryWrite = 0x80110416,
  mtsErrNoRegistryRepair = 0x80110417,
  mtsErrCLSIDOrIIDMismatch = 0x80110418,
  mtsErrRemoteInterface = 0x80110419,
  mtsErrDllRegisterServer = 0x8011041A,
  mtsErrNoServerShare = 0x8011041B,
  mtsErrNoAccessToUNC = 0x8011041C,
  mtsErrDllLoadFailed = 0x8011041D,
  mtsErrBadRegistryLibID = 0x8011041E,
  mtsErrPackDirNotFound = 0x8011041F,
  mtsErrTreatAs = 0x80110420,
  mtsErrBadForward = 0x80110421,
  mtsErrBadIID = 0x80110422,
  mtsErrRegistrarFailed = 0x80110423,
  mtsErrCompFileDoesNotExist = 0x80110424,
  mtsErrCompFileLoadDLLFail = 0x80110425,
  mtsErrCompFileGetClassObj = 0x80110426,
  mtsErrCompFileClassNotAvail = 0x80110427,
  mtsErrCompFileBadTLB = 0x80110428,
  mtsErrCompFileNotInstallable = 0x80110429,
  mtsErrNotChangeable = 0x8011042A,
  mtsErrNotDeletable = 0x8011042B,
  mtsErrSession = 0x8011042C,
  mtsErrCompFileNoRegistrar = 0x80110434,
}

// Aliases

// Package install options - these options can be or'ed together
alias __MIDL___MIDL_itf_mtxadmin_0107_0001 MTSPackageInstallOptions;

// Package export options - these options can be or'ed together
alias __MIDL___MIDL_itf_mtxadmin_0107_0002 MTSPackageExportOptions;

// Error codes (HRESULTS)
alias __MIDL___MIDL_itf_mtxadmin_0107_0003 MTSAdminErrorCodes;

// Interfaces

// ICatalog Interface
interface ICatalog : IDispatch {
  mixin(uuid("6eb22870-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID IID = { 0x6eb22870, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  // Gets a collection on the local catalog - without reading any objects from the catalog data store
  /*[id(0x00000001)]*/ int GetCollection(wchar* bstrCollName, out IDispatch ppCatalogCollection);
  // Connects to a catalog data store and returns a root collection
  /*[id(0x00000002)]*/ int Connect(wchar* bstrConnectString, out IDispatch ppCatalogCollection);
  // Gets the major version number of the MTS Admin objects
  /*[id(0x00000003)]*/ int get_MajorVersion(out int retval);
  // Gets the minor version number of the MTS Admin objects
  /*[id(0x00000004)]*/ int get_MinorVersion(out int retval);
}

// ICatalogObject Interface
interface ICatalogObject : IDispatch {
  mixin(uuid("6eb22871-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID IID = { 0x6eb22871, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  // Gets a property value
  /*[id(0x00000001)]*/ int get_Value(wchar* bstrPropName, out DWINVARIANT retval);
  // Gets a property value
  /*[id(0x00000001)]*/ int set_Value(wchar* bstrPropName, DWINVARIANT retval);
  // Gets the value of the key property
  /*[id(0x00000002)]*/ int get_Key(out DWINVARIANT retval);
  // Gets the name of the object
  /*[id(0x00000003)]*/ int get_Name(out DWINVARIANT retval);
  // True if the property cannot be set
  /*[id(0x00000004)]*/ int IsPropertyReadOnly(wchar* bstrPropName, out short retval);
  // True if all properties were successfully read from the catalog data store
  /*[id(0x00000005)]*/ int get_Valid(out short retval);
  // True if the property only supports set
  /*[id(0x00000006)]*/ int IsPropertyWriteOnly(wchar* bstrPropName, out short retval);
}

// ICatalogCollection Interface
interface ICatalogCollection : IDispatch {
  mixin(uuid("6eb22872-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID IID = { 0x6eb22872, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown ppEnumVariant);
  // Returns an object by index
  /*[id(0x00000001)]*/ int get_Item(int lIndex, out IDispatch ppCatalogObject);
  // Returns number of objects in the collection.
  /*[id(0x60020002)]*/ int get_Count(out int retval);
  // Removes an item, given the index
  /*[id(0x60020003)]*/ int Remove(int lIndex);
  // Adds an object to the collection - returns the new object 
  /*[id(0x60020004)]*/ int Add(out IDispatch ppCatalogObject);
  // Reads all the collection objects from the catalog data store
  /*[id(0x00000002)]*/ int Populate();
  // Saves changes made to the collection into the catalog data store
  /*[id(0x00000003)]*/ int SaveChanges(out int retval);
  // Gets a collection related to a specific object - without reading any objects from the catalog data store
  /*[id(0x00000004)]*/ int GetCollection(wchar* bstrCollName, DWINVARIANT varObjectKey, out IDispatch ppCatalogCollection);
  // Gets the name of the collection
  /*[id(0x00000006)]*/ int get_Name(out DWINVARIANT retval);
  // Returns true if Add is enabled
  /*[id(0x00000007)]*/ int get_AddEnabled(out short retval);
  // Returns true if Remove is enabled
  /*[id(0x00000008)]*/ int get_RemoveEnabled(out short retval);
  // Get the utility interface
  /*[id(0x00000009)]*/ int GetUtilInterface(out IDispatch ppUtil);
  // Gets the major version number of the Catalog data store
  /*[id(0x0000000A)]*/ int get_DataStoreMajorVersion(out int retval);
  // Gets the minor version number of the Catalog data store
  /*[id(0x0000000B)]*/ int get_DataStoreMinorVersion(out int retval);
  // Reads selected objects from the catalog data store
  /*[id(0x0000000C)]*/ int PopulateByKey(SAFEARRAY aKeys);
  // Reserved for future use
  /*[id(0x0000000D)]*/ int PopulateByQuery(wchar* bstrQueryString, int lQueryType);
}

// IComponentUtil Interface
interface IComponentUtil : IDispatch {
  mixin(uuid("6eb22873-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID IID = { 0x6eb22873, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  // Installs all components described by a given typelib/DLL
  /*[id(0x00000001)]*/ int InstallComponent(wchar* bstrDLLFile, wchar* bstrTypelibFile, wchar* bstrProxyStubDLLFile);
  // Imports a component that is already regsitered as an inproc server - supply the CLSID
  /*[id(0x00000002)]*/ int ImportComponent(wchar* bstrCLSID);
  // Imports a component that is already regsitered as an inproc server - supply the ProgID
  /*[id(0x00000003)]*/ int ImportComponentByName(wchar* bstrProgID);
  // Returns the list of installable CLSIDs in the DLL/Typelib
  /*[id(0x00000004)]*/ int GetCLSIDs(wchar* bstrDLLFile, wchar* bstrTypelibFile, out SAFEARRAY aCLSIDs);
}

// IPackageUtil Interface
interface IPackageUtil : IDispatch {
  mixin(uuid("6eb22874-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID IID = { 0x6eb22874, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  // Installs a package - valid only within the Packages collection
  /*[id(0x00000001)]*/ int InstallPackage(wchar* bstrPackageFile, wchar* bstrInstallPath, int lOptions);
  // Exports a package - you identify the package by package ID - valid only within the Packages collection
  /*[id(0x00000002)]*/ int ExportPackage(wchar* bstrPackageID, wchar* bstrPackageFile, int lOptions);
  // Initiates shutdown of a package
  /*[id(0x00000003)]*/ int ShutdownPackage(wchar* bstrPackageID);
}

// IRemoteComponentUtil Interface
interface IRemoteComponentUtil : IDispatch {
  mixin(uuid("6eb22875-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID IID = { 0x6eb22875, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  // Pulls remote components from a package on a remote sever - you supply the server, packageID and CLSID
  /*[id(0x0000000A)]*/ int InstallRemoteComponent(wchar* bstrServer, wchar* bstrPackageID, wchar* bstrCLSID);
  // Pulls remote components from a package on a remote sever - you supply the server, package name and progID
  /*[id(0x0000000B)]*/ int InstallRemoteComponentByName(wchar* bstrServer, wchar* bstrPackageName, wchar* bstrProgID);
}

// IRoleAssociationUtil Interface
interface IRoleAssociationUtil : IDispatch {
  mixin(uuid("6eb22876-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID IID = { 0x6eb22876, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  // Associates the role with the component or component/interface - supply the roleID
  /*[id(0x00000001)]*/ int AssociateRole(wchar* bstrRoleID);
  // Associates the role with the component or component/interface
  /*[id(0x00000002)]*/ int AssociateRoleByName(wchar* bstrRoleName);
}

// CoClasses

// Catalog Class
abstract class Catalog {
  mixin(uuid("6eb22881-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID CLSID = { 0x6eb22881, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  mixin Interfaces!(ICatalog);
}

// CatalogObject Class
abstract class CatalogObject {
  mixin(uuid("6eb22882-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID CLSID = { 0x6eb22882, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  mixin Interfaces!(ICatalogObject);
}

// CatalogCollection Class
abstract class CatalogCollection {
  mixin(uuid("6eb22883-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID CLSID = { 0x6eb22883, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  mixin Interfaces!(ICatalogCollection);
}

// ComponentUtil Class
abstract class ComponentUtil {
  mixin(uuid("6eb22884-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID CLSID = { 0x6eb22884, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  mixin Interfaces!(IComponentUtil);
}

// PackageUtil Class
abstract class PackageUtil {
  mixin(uuid("6eb22885-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID CLSID = { 0x6eb22885, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  mixin Interfaces!(IPackageUtil);
}

// RemoteComponentUtil Class
abstract class RemoteComponentUtil {
  mixin(uuid("6eb22886-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID CLSID = { 0x6eb22886, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  mixin Interfaces!(IRemoteComponentUtil);
}

// CRoleAssociationUtil Class
abstract class RoleAssociationUtil {
  mixin(uuid("6eb22887-8a19-11d0-81b6-00a0c9231c29"));
  // static DWINGUID CLSID = { 0x6eb22887, 0x8a19, 0x11d0, 0x81, 0xb6, 0x00, 0xa0, 0xc9, 0x23, 0x1c, 0x29 };
  mixin Interfaces!(IRoleAssociationUtil);
}
