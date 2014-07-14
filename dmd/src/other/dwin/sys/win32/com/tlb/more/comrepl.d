// ComPlus 1.0 Catalog Replication Type Library
// Version 1.0

/*[uuid("98315905-7be5-11d2-adc1-00a02463d6e7")]*/
module dwin.sys.win32.com.tlb.more.comrepl;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// ICOMReplicate Interface
interface ICOMReplicate : IDispatch {
  mixin(uuid("52f25063-a5f1-11d2-ae04-00a02463d6e7"));
  // static DWINGUID IID = { 0x52f25063, 0xa5f1, 0x11d2, 0xae, 0x04, 0x00, 0xa0, 0x24, 0x63, 0xd6, 0xe7 };
  // Initializes the replication session
  /*[id(0x00000001)]*/ int Initialize(wchar* bstrSourceComputer, int lOptions);
  // Exports catalog data on the source computer
  /*[id(0x00000002)]*/ int ExportSourceCatalogFiles();
  // Returns status information about a replicate target
  /*[id(0x00000004)]*/ int GetTargetStatus(wchar* bstrTargetComputer, out int plStatus, out wchar* pbstrMaster);
  // Copies catalog data to a target computer
  /*[id(0x00000005)]*/ int CopyFilesToTarget(wchar* bstrTargetComputer);
  // Installs new catalog data on a target
  /*[id(0x00000006)]*/ int InstallTarget(wchar* bstrTargetComputer);
  // Removes temporary files on the source
  /*[id(0x00000007)]*/ int CleanupSourceShares();
  // Returns the name of the log file
  /*[id(0x00000008)]*/ int GetLogFile(out wchar* pbstrLogFile);
  // Returns the name of the log file
  /*[id(0x00000009)]*/ int RollbackTarget(wchar* bstrTargetComputer);
}

// ICOMReplicateCatalog Interface
interface ICOMReplicateCatalog : IDispatch {
  mixin(uuid("98315904-7be5-11d2-adc1-00a02463d6e7"));
  // static DWINGUID IID = { 0x98315904, 0x7be5, 0x11d2, 0xad, 0xc1, 0x00, 0xa0, 0x24, 0x63, 0xd6, 0xe7 };
  // Initializes the replication session
  /*[id(0x00000001)]*/ int Initialize(int lOptions);
  // Exports catalog data on the source computer
  /*[id(0x00000002)]*/ int ExportSourceCatalogFiles(wchar* bstrSourceComputer);
  // Copies catalog data to a target computer
  /*[id(0x00000003)]*/ int CopyCatalogFilesToTarget(wchar* bstrTargetComputer);
  // Installs new catalog data on a target
  /*[id(0x00000004)]*/ int InstallCatalogOnTarget(wchar* bstrTargetComputer);
  // Removes temporary files on the source
  /*[id(0x00000005)]*/ int CleanupSource();
  // Returns the name of the log file
  /*[id(0x00000006)]*/ int GetLogFilePath(out wchar* pbstrLogFile);
}

// ICOMReplicate2 Interface
interface ICOMReplicate2 : ICOMReplicate {
  mixin(uuid("64787ff9-eca5-4bb4-9302-5e47218e0399"));
  // static DWINGUID IID = { 0x64787ff9, 0xeca5, 0x4bb4, 0x93, 0x02, 0x5e, 0x47, 0x21, 0x8e, 0x03, 0x99 };
  // Returns the OS version of the target computer
  /*[id(0x0000000A)]*/ int GetOSVersion(wchar* bstrTargetComputer, out int plOSVersion);
}

// CoClasses

// ReplicateCatalog Class
abstract class ReplicateCatalog {
  mixin(uuid("8c836af9-ffac-11d0-8ed4-00c04fc2c17b"));
  // static DWINGUID CLSID = { 0x8c836af9, 0xffac, 0x11d0, 0x8e, 0xd4, 0x00, 0xc0, 0x4f, 0xc2, 0xc1, 0x7b };
  mixin Interfaces!(ICOMReplicate, ICOMReplicateCatalog, ICOMReplicate2);
}
