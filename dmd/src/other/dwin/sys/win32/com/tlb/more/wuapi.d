// WUAPI 2.0 Type Library
// Version 2.0

/*[uuid("b596cc9f-56e5-419e-a622-e01bb457431e")]*/
//module dwin.sys.win32.com.tlb.more.wuapi;
module dwin.sys.win32.com.tlb.more.wuapi;

//import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Enums

// Defines the possible restrictions for IUpdateLockdown::LockDown() to impose on an object
enum tagUpdateLockdownOption {
  uloForWebsiteAccess = 0x00000001,
}

// Defines the possible service options when adding an update service
enum tagUpdateServiceOption {
  usoNonVolatileService = 0x00000001,
}

// Defines contexts under which an UpdateException can be raised.
enum tagUpdateExceptionContext {
  uecGeneral = 0x00000001,
  uecWindowsDriver = 0x00000002,
  uecWindowsInstaller = 0x00000003,
}

// Defines possible levels of impact that may be caused by (un)installing an Update.
enum tagInstallationImpact {
  iiNormal = 0x00000000,
  iiMinor = 0x00000001,
  iiRequiresExclusiveHandling = 0x00000002,
}

// Defines possible reboot behaviors exhibited by an Update during (un)installation.
enum tagInstallationRebootBehavior {
  irbNeverReboots = 0x00000000,
  irbAlwaysRequiresReboot = 0x00000001,
  irbCanRequestReboot = 0x00000002,
}

// Defines possible types of an update.
enum tagUpdateType {
  utSoftware = 0x00000001,
  utDriver = 0x00000002,
}

// Defines actions an Update can be explicitly deployed for.
enum tagDeploymentAction {
  daNone = 0x00000000,
  daInstallation = 0x00000001,
  daUninstallation = 0x00000002,
}

// Defines possible priorities for a download operation.
enum tagDownloadPriority {
  dpLow = 0x00000001,
  dpNormal = 0x00000002,
  dpHigh = 0x00000003,
}

// Defines possible results of a download, (un)install, or verification operation on an update.
enum tagOperationResultCode {
  orcNotStarted = 0x00000000,
  orcInProgress = 0x00000001,
  orcSucceeded = 0x00000002,
  orcSucceededWithErrors = 0x00000003,
  orcFailed = 0x00000004,
  orcAborted = 0x00000005,
}

// Defines the possible phases during a download operation.
enum tagDownloadPhase {
  dphInitializing = 0x00000001,
  dphDownloading = 0x00000002,
  dphVerifying = 0x00000003,
}

// Defines operations that can be attempted on an Update.
enum tagUpdateOperation {
  uoInstallation = 0x00000001,
  uoUninstallation = 0x00000002,
}

// Defines possible server selections the Searcher can search against.
enum tagServerSelection {
  ssDefault = 0x00000000,
  ssManagedServer = 0x00000001,
  ssWindowsUpdate = 0x00000002,
  ssOthers = 0x00000003,
}

// Defines possible ways in which elevated users will be notified about Automatic Updates events.
enum tagAutomaticUpdatesNotificationLevel {
  aunlNotConfigured = 0x00000000,
  aunlDisabled = 0x00000001,
  aunlNotifyBeforeDownload = 0x00000002,
  aunlNotifyBeforeInstallation = 0x00000003,
  aunlScheduledInstallation = 0x00000004,
}

// Defines possible day(s) of week when Automatic Updates may (un)install updates.
enum tagAutomaticUpdatesScheduledInstallationDay {
  ausidEveryDay = 0x00000000,
  ausidEverySunday = 0x00000001,
  ausidEveryMonday = 0x00000002,
  ausidEveryTuesday = 0x00000003,
  ausidEveryWednesday = 0x00000004,
  ausidEveryThursday = 0x00000005,
  ausidEveryFriday = 0x00000006,
  ausidEverySaturday = 0x00000007,
}

// Unions

union __MIDL_IWinTypes_0009 {
  int hInproc;
  int hRemote;
}

// Structs

struct _RemotableHandle {
  int fContext;
  __MIDL_IWinTypes_0009 u;
}

// Aliases

// Defines the possible restrictions for IUpdateLockdown::LockDown() to impose on an object
alias tagUpdateLockdownOption UpdateLockdownOption;

// Defines the possible service options when adding an update service
alias tagUpdateServiceOption UpdateServiceOption;

// Defines contexts under which an UpdateException can be raised.
alias tagUpdateExceptionContext UpdateExceptionContext;

// Defines possible levels of impact that may be caused by (un)installing an Update.
alias tagInstallationImpact InstallationImpact;

// Defines possible reboot behaviors exhibited by an Update during (un)installation.
alias tagInstallationRebootBehavior InstallationRebootBehavior;

// Defines possible types of an update.
alias tagUpdateType UpdateType;

// Defines actions an Update can be explicitly deployed for.
alias tagDeploymentAction DeploymentAction;

// Defines possible priorities for a download operation.
alias tagDownloadPriority DownloadPriority;

// Defines possible results of a download, (un)install, or verification operation on an update.
alias tagOperationResultCode OperationResultCode;

// Defines the possible phases during a download operation.
alias tagDownloadPhase DownloadPhase;

// Defines operations that can be attempted on an Update.
alias tagUpdateOperation UpdateOperation;

// Defines possible server selections the Searcher can search against.
alias tagServerSelection ServerSelection;

alias _RemotableHandle* wireHWND;

// Defines possible ways in which elevated users will be notified about Automatic Updates events.
alias tagAutomaticUpdatesNotificationLevel AutomaticUpdatesNotificationLevel;

// Defines possible day(s) of week when Automatic Updates may (un)install updates.
alias tagAutomaticUpdatesScheduledInstallationDay AutomaticUpdatesScheduledInstallationDay;

// Interfaces

// IUpdateLockdown Interface
interface IUpdateLockdown : IUnknown {
  mixin(uuid("a976c28d-75a1-42aa-94ae-8af8b872089a"));
  // static DWINGUID IID = { 0xa976c28d, 0x75a1, 0x42aa, 0x94, 0xae, 0x8a, 0xf8, 0xb8, 0x72, 0x08, 0x9a };
  // Restricts access to functionality the object provides.
  /*[id(0x60010001)]*/ int LockDown(int flags);
}

// IUpdateException Interface
interface IUpdateException : IDispatch {
  mixin(uuid("a376dd5e-09d4-427f-af7c-fed5b6e1c1d6"));
  // static DWINGUID IID = { 0xa376dd5e, 0x09d4, 0x427f, 0xaf, 0x7c, 0xfe, 0xd5, 0xb6, 0xe1, 0xc1, 0xd6 };
  // Gets a message that describes the current exception.
  /*[id(0x00000000)]*/ int get_Message(out wchar* retval);
  // Gets HRESULT, a coded numerical value that is assigned to a specific exception.
  /*[id(0x60020001)]*/ int get_HResult(out int retval);
  // Gets a numerical value that indicates the context of the current exception.
  /*[id(0x60020002)]*/ int get_Context(out UpdateExceptionContext retval);
}

// IInvalidProductLicenseException Interface
interface IInvalidProductLicenseException : IUpdateException {
  mixin(uuid("a37d00f5-7bb0-4953-b414-f9e98326f2e8"));
  // static DWINGUID IID = { 0xa37d00f5, 0x7bb0, 0x4953, 0xb4, 0x14, 0xf9, 0xe9, 0x83, 0x26, 0xf2, 0xe8 };
  // Gets the language-invariant name of the product
  /*[id(0x60030001)]*/ int get_Product(out wchar* retval);
}

// IUpdate Interface
interface IUpdate : IDispatch {
  mixin(uuid("6a92b07a-d821-4682-b423-5c805022cc4d"));
  // static DWINGUID IID = { 0x6a92b07a, 0xd821, 0x4682, 0xb4, 0x23, 0x5c, 0x80, 0x50, 0x22, 0xcc, 0x4d };
  // Gets the localized title of the Update.
  /*[id(0x00000000)]*/ int get_Title(out wchar* retval);
  // Gets a value indicating whether the Update is flagged to be automatically selected by web sites such as Windows Update or Microsoft Update.
  /*[id(0x60020001)]*/ int get_AutoSelectOnWebSites(out short retval);
  // Gets information on the ordered list of bundled updates of the Update.
  /*[id(0x60020002)]*/ int get_BundledUpdates(out IUpdateCollection retval);
  // Indicates whether the source media of the Update is potentially required for (un)installation.
  /*[id(0x60020003)]*/ int get_CanRequireSource(out short retval);
  // Gets the categories that the update belongs to.
  /*[id(0x60020004)]*/ int get_Categories(out ICategoryCollection retval);
  // Gets the date by which the Update must be installed.
  /*[id(0x60020005)]*/ int get_Deadline(out DWINVARIANT retval);
  // Indicates whether delta-compressed content is available on the server for the Update.
  /*[id(0x60020006)]*/ int get_DeltaCompressedContentAvailable(out short retval);
  // Indicates whether to prefer delta-compressed content when downloading and/or (un)installing the Update, if such content is available.
  /*[id(0x60020007)]*/ int get_DeltaCompressedContentPreferred(out short retval);
  // Gets the localized description of the Update.
  /*[id(0x60020008)]*/ int get_Description(out wchar* retval);
  // Indicates whether the end-user license agreement associated with the Update has been accepted for the target computer.
  /*[id(0x60020009)]*/ int get_EulaAccepted(out short retval);
  // Gets the full, localized text of the end-user license agreement associated with the Update.
  /*[id(0x6002000A)]*/ int get_EulaText(out wchar* retval);
  // Gets a value specifying the install handler of the Update.
  /*[id(0x6002000B)]*/ int get_HandlerID(out wchar* retval);
  // Gets the globally-unique identity of the Update.
  /*[id(0x6002000C)]*/ int get_Identity(out IUpdateIdentity retval);
  // Gets information on the image associated with the Update.
  /*[id(0x6002000D)]*/ int get_Image(out IImageInformation retval);
  // Gets the installation options of the Update.
  /*[id(0x6002000E)]*/ int get_InstallationBehavior(out IInstallationBehavior retval);
  // Gets a value indicating whether the Update is a beta release.
  /*[id(0x6002000F)]*/ int get_IsBeta(out short retval);
  // Indicates whether all of the Update's content is cached on the target computer.
  /*[id(0x60020010)]*/ int get_IsDownloaded(out short retval);
  // Indicates whether the Update has been hidden by the user for installation.
  /*[id(0x60020011)]*/ int get_IsHidden(out short retval);
  // Indicates whether the Update has been hidden by the user for installation.
  /*[id(0x60020011)]*/ int set_IsHidden(short retval);
  // Indicates whether the Update was installed on the target computer when the search was performed.
  /*[id(0x60020012)]*/ int get_IsInstalled(out short retval);
  // Gets a value indicating whether installation of the Update is mandatory.
  /*[id(0x60020013)]*/ int get_IsMandatory(out short retval);
  // Indicates whether the caller can uninstall the Update, if installed, from the target computer.
  /*[id(0x60020014)]*/ int get_IsUninstallable(out short retval);
  // Gets the languages that the Update supports.
  /*[id(0x60020015)]*/ int get_Languages(out IStringCollection retval);
  // Gets the published date of the Update.
  /*[id(0x60020016)]*/ int get_LastDeploymentChangeTime(out double retval);
  // Gets the maximum download size of the Update.
  /*[id(0x60020017)]*/ int get_MaxDownloadSize(out DECIMAL retval);
  // Gets the minimum download size of the Update.
  /*[id(0x60020018)]*/ int get_MinDownloadSize(out DECIMAL retval);
  // Gets language-specific strings specifying the hyperlinks to more info on the Update.
  /*[id(0x60020019)]*/ int get_MoreInfoUrls(out IStringCollection retval);
  // Gets the Microsoft Security Response Center severity rating of the Update.
  /*[id(0x6002001A)]*/ int get_MsrcSeverity(out wchar* retval);
  // Gets the recommended CPU speed, in megahertz, for installing the Update.
  /*[id(0x6002001B)]*/ int get_RecommendedCpuSpeed(out int retval);
  // Gets the recommended hard disk free space, in megabytes, for installing the Update.
  /*[id(0x6002001C)]*/ int get_RecommendedHardDiskSpace(out int retval);
  // Gets the recommended physical memory size, in megabytes, for installing the Update.
  /*[id(0x6002001D)]*/ int get_RecommendedMemory(out int retval);
  // Gets the localized release notes of the Update.
  /*[id(0x6002001E)]*/ int get_ReleaseNotes(out wchar* retval);
  // Gets the security bulletin IDs associated with the Update.
  /*[id(0x6002001F)]*/ int get_SecurityBulletinIDs(out IStringCollection retval);
  // Gets a collection of update IDs specifying the Updates that the Update supersedes.
  /*[id(0x60020021)]*/ int get_SupersededUpdateIDs(out IStringCollection retval);
  // Gets the language-specific hyperlink to the support information on the Update.
  /*[id(0x60020022)]*/ int get_SupportUrl(out wchar* retval);
  // Gets the type of the Update.
  /*[id(0x60020023)]*/ int get_Type(out UpdateType retval);
  // Gets the uninstallation notes of the Update.
  /*[id(0x60020024)]*/ int get_UninstallationNotes(out wchar* retval);
  // Gets the uninstallation options of the Update.
  /*[id(0x60020025)]*/ int get_UninstallationBehavior(out IInstallationBehavior retval);
  // Gets the uninstallation steps of the Update.
  /*[id(0x60020026)]*/ int get_UninstallationSteps(out IStringCollection retval);
  // Gets the knowledge base article IDs associated with the Update.
  /*[id(0x60020028)]*/ int get_KBArticleIDs(out IStringCollection retval);
  // Accepts the end-user license agreement associated with the Update.
  /*[id(0x60020027)]*/ int AcceptEula();
  // Indicates the action an Update is deployed for.
  /*[id(0x60020029)]*/ int get_DeploymentAction(out DeploymentAction retval);
  // Copies the contents of the Update into a specified path.
  /*[id(0x6002002A)]*/ int CopyFromCache(wchar* path, short toExtractCabFiles);
  // Indicates the suggested download priority of the Update.
  /*[id(0x6002002B)]*/ int get_DownloadPriority(out DownloadPriority retval);
  // Gets file information on the immediate download contents of the Update.
  /*[id(0x6002002C)]*/ int get_DownloadContents(out IUpdateDownloadContentCollection retval);
}

// IUpdateCollection Interface
interface IUpdateCollection : IDispatch {
  mixin(uuid("07f7438c-7709-4ca5-b518-91279288134e"));
  // static DWINGUID IID = { 0x07f7438c, 0x7709, 0x4ca5, 0xb5, 0x18, 0x91, 0x27, 0x92, 0x88, 0x13, 0x4e };
  // Gets an element in the collection.
  /*[id(0x00000000)]*/ int get_Item(int index, out IUpdate retval);
  // Gets an element in the collection.
  /*[id(0x00000000)]*/ int set_Item(int index, IUpdate retval);
  // Gets an IEnumVARIANT interface on an object that can be used to enumerate the collection.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown retval);
  // Gets the number of elements contained in the collection.
  /*[id(0x60020001)]*/ int get_Count(out int retval);
  // Gets a boolean value indicating whether the collection is read-only.
  /*[id(0x60020002)]*/ int get_ReadOnly(out short retval);
  // Adds an item to the collection.
  /*[id(0x60020003)]*/ int Add(IUpdate value, out int retval);
  // Removes all elements from the collection.
  /*[id(0x60020004)]*/ int Clear();
  // Creates a shallow read-writable copy of the collection.
  /*[id(0x60020005)]*/ int Copy(out IUpdateCollection retval);
  // Inserts an item to the collection at the specified position.
  /*[id(0x60020006)]*/ int Insert(int index, IUpdate value);
  // Removes the item at the specified index from the collection.
  /*[id(0x60020007)]*/ int RemoveAt(int index);
}

// ICategoryCollection Interface
interface ICategoryCollection : IDispatch {
  mixin(uuid("3a56bfb8-576c-43f7-9335-fe4838fd7e37"));
  // static DWINGUID IID = { 0x3a56bfb8, 0x576c, 0x43f7, 0x93, 0x35, 0xfe, 0x48, 0x38, 0xfd, 0x7e, 0x37 };
  // Gets an element in the collection.
  /*[id(0x00000000)]*/ int get_Item(int index, out ICategory retval);
  // Gets an IEnumVARIANT interface on an object that can be used to enumerate the collection.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown retval);
  // Gets the number of elements contained in the collection.
  /*[id(0x60020001)]*/ int get_Count(out int retval);
}

// ICategory Interface
interface ICategory : IDispatch {
  mixin(uuid("81ddc1b8-9d35-47a6-b471-5b80f519223b"));
  // static DWINGUID IID = { 0x81ddc1b8, 0x9d35, 0x47a6, 0xb4, 0x71, 0x5b, 0x80, 0xf5, 0x19, 0x22, 0x3b };
  // Gets the localized name of the Category.
  /*[id(0x00000000)]*/ int get_Name(out wchar* retval);
  // Gets the category ID of the Category.
  /*[id(0x60020001)]*/ int get_CategoryID(out wchar* retval);
  // Gets the children of the Category.
  /*[id(0x60020002)]*/ int get_Children(out ICategoryCollection retval);
  // Gets the description of the Category.
  /*[id(0x60020003)]*/ int get_Description(out wchar* retval);
  // Gets information on the image associated with the Category.
  /*[id(0x60020004)]*/ int get_Image(out IImageInformation retval);
  // Gets the recommended display order of the Category among its siblings.
  /*[id(0x60020005)]*/ int get_Order(out int retval);
  // Gets the parent of the Category.
  /*[id(0x60020006)]*/ int get_Parent(out ICategory retval);
  // Gets the type of the Category.
  /*[id(0x60020007)]*/ int get_Type(out wchar* retval);
  // Gets the updates which immediately belong to the Category.
  /*[id(0x60020008)]*/ int get_Updates(out IUpdateCollection retval);
}

// IImageInformation Interface
interface IImageInformation : IDispatch {
  mixin(uuid("7c907864-346c-4aeb-8f3f-57da289f969f"));
  // static DWINGUID IID = { 0x7c907864, 0x346c, 0x4aeb, 0x8f, 0x3f, 0x57, 0xda, 0x28, 0x9f, 0x96, 0x9f };
  // Gets the ATL text of the image.
  /*[id(0x60020001)]*/ int get_AltText(out wchar* retval);
  // Gets the height of the image, in pixels.
  /*[id(0x60020002)]*/ int get_Height(out int retval);
  // Gets the source location of the image.
  /*[id(0x60020003)]*/ int get_Source(out wchar* retval);
  // Gets the width of the image, in pixels.
  /*[id(0x60020004)]*/ int get_Width(out int retval);
}

// IUpdateIdentity Interface
interface IUpdateIdentity : IDispatch {
  mixin(uuid("46297823-9940-4c09-aed9-cd3ea6d05968"));
  // static DWINGUID IID = { 0x46297823, 0x9940, 0x4c09, 0xae, 0xd9, 0xcd, 0x3e, 0xa6, 0xd0, 0x59, 0x68 };
  // Gets the revision number of the Update.
  /*[id(0x60020002)]*/ int get_RevisionNumber(out int retval);
  // Gets a string identifying the Update in a globally-unique manner.
  /*[id(0x60020003)]*/ int get_UpdateID(out wchar* retval);
}

// IInstallationBehavior Interface
interface IInstallationBehavior : IDispatch {
  mixin(uuid("d9a59339-e245-4dbd-9686-4d5763e39624"));
  // static DWINGUID IID = { 0xd9a59339, 0xe245, 0x4dbd, 0x96, 0x86, 0x4d, 0x57, 0x63, 0xe3, 0x96, 0x24 };
  // Gets a value indicating whether (un)installation of the Update can request user input.
  /*[id(0x60020001)]*/ int get_CanRequestUserInput(out short retval);
  // Gets a value assessing how (un)installation of the Update will impact the target computer.
  /*[id(0x60020002)]*/ int get_Impact(out InstallationImpact retval);
  // Gets a value specifying the reboot behavior exhibited by (un)installing the Update.
  /*[id(0x60020003)]*/ int get_RebootBehavior(out InstallationRebootBehavior retval);
  // Gets a value indicating whether (un)installation of the Update requires network connectivity.
  /*[id(0x60020004)]*/ int get_RequiresNetworkConnectivity(out short retval);
}

// IStringCollection Interface
interface IStringCollection : IDispatch {
  mixin(uuid("eff90582-2ddc-480f-a06d-60f3fbc362c3"));
  // static DWINGUID IID = { 0xeff90582, 0x2ddc, 0x480f, 0xa0, 0x6d, 0x60, 0xf3, 0xfb, 0xc3, 0x62, 0xc3 };
  // Gets an element in the collection.
  /*[id(0x00000000)]*/ int get_Item(int index, out wchar* retval);
  // Gets an element in the collection.
  /*[id(0x00000000)]*/ int set_Item(int index, wchar* retval);
  // Gets an IEnumVARIANT interface on an object that can be used to enumerate the collection.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown retval);
  // Gets the number of elements contained in the collection.
  /*[id(0x60020001)]*/ int get_Count(out int retval);
  // Gets a boolean value indicating whether the collection is read-only.
  /*[id(0x60020002)]*/ int get_ReadOnly(out short retval);
  // Adds an item to the collection.
  /*[id(0x60020003)]*/ int Add(wchar* value, out int retval);
  // Removes all elements from the collection.
  /*[id(0x60020004)]*/ int Clear();
  // Creates a deep read-writable copy of the collection.
  /*[id(0x60020005)]*/ int Copy(out IStringCollection retval);
  // Inserts an item to the collection at the specified position.
  /*[id(0x60020006)]*/ int Insert(int index, wchar* value);
  // Removes the item at the specified index from the collection.
  /*[id(0x60020007)]*/ int RemoveAt(int index);
}

// IUpdateDownloadContentCollection Interface
interface IUpdateDownloadContentCollection : IDispatch {
  mixin(uuid("bc5513c8-b3b8-4bf7-a4d4-361c0d8c88ba"));
  // static DWINGUID IID = { 0xbc5513c8, 0xb3b8, 0x4bf7, 0xa4, 0xd4, 0x36, 0x1c, 0x0d, 0x8c, 0x88, 0xba };
  // Gets an element in the collection.
  /*[id(0x00000000)]*/ int get_Item(int index, out IUpdateDownloadContent retval);
  // Gets an IEnumVARIANT interface on an object that can be used to enumerate the collection.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown retval);
  // Gets the number of elements contained in the collection.
  /*[id(0x60020001)]*/ int get_Count(out int retval);
}

// IUpdateDownloadContent Interface
interface IUpdateDownloadContent : IDispatch {
  mixin(uuid("54a2cb2d-9a0c-48b6-8a50-9abb69ee2d02"));
  // static DWINGUID IID = { 0x54a2cb2d, 0x9a0c, 0x48b6, 0x8a, 0x50, 0x9a, 0xbb, 0x69, 0xee, 0x2d, 0x02 };
  // Gets the location of the download content on the hosting server.
  /*[id(0x60020001)]*/ int get_DownloadUrl(out wchar* retval);
}

// IUpdate2 Interface
interface IUpdate2 : IUpdate {
  mixin(uuid("144fe9b0-d23d-4a8b-8634-fb4457533b7a"));
  // static DWINGUID IID = { 0x144fe9b0, 0xd23d, 0x4a8b, 0x86, 0x34, 0xfb, 0x44, 0x57, 0x53, 0x3b, 0x7a };
  // Gets a value indicating whether the computer still needs to be rebooted after (un)installing this update.
  /*[id(0x60030001)]*/ int get_RebootRequired(out short retval);
  // Indicates whether the update is present on the machine.
  /*[id(0x60030003)]*/ int get_IsPresent(out short retval);
  // Gets the CVE IDs associated with the Update.
  /*[id(0x60030004)]*/ int get_CveIDs(out IStringCollection retval);
  // Copies externally provided update binaries to install cache.
  /*[id(0x60030002)]*/ int CopyToCache(IStringCollection pFiles);
}

// IWindowsDriverUpdate Interface
interface IWindowsDriverUpdate : IUpdate {
  mixin(uuid("b383cd1a-5ce9-4504-9f63-764b1236f191"));
  // static DWINGUID IID = { 0xb383cd1a, 0x5ce9, 0x4504, 0x9f, 0x63, 0x76, 0x4b, 0x12, 0x36, 0xf1, 0x91 };
  // Specifes the class of the WindowsDriverUpdate.
  /*[id(0x60030001)]*/ int get_DriverClass(out wchar* retval);
  // Specifies the hardware ID or compatible ID that the WindowsDriverUpdate must match to be installable.
  /*[id(0x60030002)]*/ int get_DriverHardwareID(out wchar* retval);
  // Specifies the language-invariant name of the manufacturer of the WindowsDriverUpdate.
  /*[id(0x60030003)]*/ int get_DriverManufacturer(out wchar* retval);
  // Specifies the language-invariant model name of the device for which the WindowsDriverUpdate is intended.
  /*[id(0x60030004)]*/ int get_DriverModel(out wchar* retval);
  // Specifies the language-invariant name of the provider of theWindowsDriverUpdate.
  /*[id(0x60030005)]*/ int get_DriverProvider(out wchar* retval);
  // Specifies the driver version date of the WindowsDriverUpdate.
  /*[id(0x60030006)]*/ int get_DriverVerDate(out double retval);
  // Returns the problem number of the matching device for the WindowsDriverUpdate.
  /*[id(0x60030007)]*/ int get_DeviceProblemNumber(out int retval);
  // Returns the status of the matching device for the WindowsDriverUpdate.
  /*[id(0x60030008)]*/ int get_DeviceStatus(out int retval);
}

// IWindowsDriverUpdate2 Interface
interface IWindowsDriverUpdate2 : IWindowsDriverUpdate {
  mixin(uuid("615c4269-7a48-43bd-96b7-bf6ca27d6c3e"));
  // static DWINGUID IID = { 0x615c4269, 0x7a48, 0x43bd, 0x96, 0xb7, 0xbf, 0x6c, 0xa2, 0x7d, 0x6c, 0x3e };
  // Gets a value indicating whether the computer still needs to be rebooted after (un)installing this update.
  /*[id(0x60040001)]*/ int get_RebootRequired(out short retval);
  // Indicates whether the update is present on the machine.
  /*[id(0x60040003)]*/ int get_IsPresent(out short retval);
  // Gets the CVE IDs associated with the Update.
  /*[id(0x60040004)]*/ int get_CveIDs(out IStringCollection retval);
  // Copies externally provided update binaries to install cache.
  /*[id(0x60040002)]*/ int CopyToCache(IStringCollection pFiles);
}

// ISearchCompletedCallback Interface
interface ISearchCompletedCallback : IUnknown {
  mixin(uuid("88aee058-d4b0-4725-a2f1-814a67ae964c"));
  // static DWINGUID IID = { 0x88aee058, 0xd4b0, 0x4725, 0xa2, 0xf1, 0x81, 0x4a, 0x67, 0xae, 0x96, 0x4c };
  // Handles the notification about the completion of an asynchronous search initiated by calling UpdateSearcher.BeginSearch.
  /*[id(0x60010001)]*/ int Invoke(ISearchJob searchJob, ISearchCompletedCallbackArgs callbackArgs);
}

// ISearchJob Interface
interface ISearchJob : IDispatch {
  mixin(uuid("7366ea16-7a1a-4ea2-b042-973d3e9cd99b"));
  // static DWINGUID IID = { 0x7366ea16, 0x7a1a, 0x4ea2, 0xb0, 0x42, 0x97, 0x3d, 0x3e, 0x9c, 0xd9, 0x9b };
  // Gets the caller-specified state object passed to the UpdateSearcher.BeginSearch method.
  /*[id(0x60020001)]*/ int get_AsyncState(out DWINVARIANT retval);
  // Gets a value indicating whether the call has been completely processed.
  /*[id(0x60020002)]*/ int get_IsCompleted(out short retval);
  // Waits for asynchronous operation to complete and releases all callbacks, if any.
  /*[id(0x60020003)]*/ int CleanUp();
  // Requests to abort the asynchronous search.
  /*[id(0x60020004)]*/ int RequestAbort();
}

// ISearchCompletedCallbackArgs Interface
interface ISearchCompletedCallbackArgs : IDispatch {
  mixin(uuid("a700a634-2850-4c47-938a-9e4b6e5af9a6"));
  // static DWINGUID IID = { 0xa700a634, 0x2850, 0x4c47, 0x93, 0x8a, 0x9e, 0x4b, 0x6e, 0x5a, 0xf9, 0xa6 };
}

// IDownloadCompletedCallback Interface
interface IDownloadCompletedCallback : IUnknown {
  mixin(uuid("77254866-9f5b-4c8e-b9e2-c77a8530d64b"));
  // static DWINGUID IID = { 0x77254866, 0x9f5b, 0x4c8e, 0xb9, 0xe2, 0xc7, 0x7a, 0x85, 0x30, 0xd6, 0x4b };
  // Handles the notification about the completion of an asynchronous download initiated by calling UpdateDownloader.BeginDownload.
  /*[id(0x60010001)]*/ int Invoke(IDownloadJob downloadJob, IDownloadCompletedCallbackArgs callbackArgs);
}

// IDownloadJob Interface
interface IDownloadJob : IDispatch {
  mixin(uuid("c574de85-7358-43f6-aae8-8697e62d8ba7"));
  // static DWINGUID IID = { 0xc574de85, 0x7358, 0x43f6, 0xaa, 0xe8, 0x86, 0x97, 0xe6, 0x2d, 0x8b, 0xa7 };
  // Gets the caller-specified state object passed to the UpdateDownloader.BeginDownload method.
  /*[id(0x60020001)]*/ int get_AsyncState(out DWINVARIANT retval);
  // Gets a value indicating whether the call has been completely processed.
  /*[id(0x60020002)]*/ int get_IsCompleted(out short retval);
  // Gets a read-only collection of the updates specified in the download.
  /*[id(0x60020003)]*/ int get_Updates(out IUpdateCollection retval);
  // Waits for asynchronous operation to complete and releases all callbacks, if any.
  /*[id(0x60020004)]*/ int CleanUp();
  // Gets the current progress of the download.
  /*[id(0x60020005)]*/ int GetProgress(out IDownloadProgress retval);
  // Requests to abort the asynchronous download.
  /*[id(0x60020006)]*/ int RequestAbort();
}

// IDownloadProgress Interface
interface IDownloadProgress : IDispatch {
  mixin(uuid("d31a5bac-f719-4178-9dbb-5e2cb47fd18a"));
  // static DWINGUID IID = { 0xd31a5bac, 0xf719, 0x4178, 0x9d, 0xbb, 0x5e, 0x2c, 0xb4, 0x7f, 0xd1, 0x8a };
  // Gets a value specifying how much data has been transferred for the content file(s) of the update being downloaded, in bytes.
  /*[id(0x60020001)]*/ int get_CurrentUpdateBytesDownloaded(out DECIMAL retval);
  // Gets a value approximating how much data should be transferred for the content file(s) of the update being downloaded, in bytes.
  /*[id(0x60020002)]*/ int get_CurrentUpdateBytesToDownload(out DECIMAL retval);
  // Gets a zero-based index value into the updates specified in the download for the one which content file(s) are being downloaded.
  /*[id(0x60020003)]*/ int get_CurrentUpdateIndex(out int retval);
  // Gets a value estimating how far the download has progressed, in percents.
  /*[id(0x60020004)]*/ int get_PercentComplete(out int retval);
  // Gets a value specifying how much overall data has been transferred by the download, in bytes.
  /*[id(0x60020005)]*/ int get_TotalBytesDownloaded(out DECIMAL retval);
  // Gets a value approximating how much data should be transferred over all updates by the download, in bytes.
  /*[id(0x60020006)]*/ int get_TotalBytesToDownload(out DECIMAL retval);
  // Gets the result of the download on a specified update.
  /*[id(0x60020007)]*/ int GetUpdateResult(int updateIndex, out IUpdateDownloadResult retval);
  // Gets a DownloadPhase enumeration value specifying the current phase of the download in progress.
  /*[id(0x60020008)]*/ int get_CurrentUpdateDownloadPhase(out DownloadPhase retval);
  // Gets a value estimating how far the download of the current update has progressed, in percents.
  /*[id(0x60020009)]*/ int get_CurrentUpdatePercentComplete(out int retval);
}

// IUpdateDownloadResult Interface
interface IUpdateDownloadResult : IDispatch {
  mixin(uuid("bf99af76-b575-42ad-8aa4-33cbb5477af1"));
  // static DWINGUID IID = { 0xbf99af76, 0xb575, 0x42ad, 0x8a, 0xa4, 0x33, 0xcb, 0xb5, 0x47, 0x7a, 0xf1 };
  // Gets the HRESULT value returned from the operation on the update.
  /*[id(0x60020001)]*/ int get_HResult(out int retval);
  // Gets an OperationResultCode enumeration value specifying the result of the operation on the update.
  /*[id(0x60020002)]*/ int get_ResultCode(out OperationResultCode retval);
}

// IDownloadCompletedCallbackArgs Interface
interface IDownloadCompletedCallbackArgs : IDispatch {
  mixin(uuid("fa565b23-498c-47a0-979d-e7d5b1813360"));
  // static DWINGUID IID = { 0xfa565b23, 0x498c, 0x47a0, 0x97, 0x9d, 0xe7, 0xd5, 0xb1, 0x81, 0x33, 0x60 };
}

// IDownloadProgressChangedCallback Interface
interface IDownloadProgressChangedCallback : IUnknown {
  mixin(uuid("8c3f1cdd-6173-4591-aebd-a56a53ca77c1"));
  // static DWINGUID IID = { 0x8c3f1cdd, 0x6173, 0x4591, 0xae, 0xbd, 0xa5, 0x6a, 0x53, 0xca, 0x77, 0xc1 };
  // Handles the notification about the change of progress of an asynchronous download initiated by calling UpdateDownloader.BeginDownload.
  /*[id(0x60010001)]*/ int Invoke(IDownloadJob downloadJob, IDownloadProgressChangedCallbackArgs callbackArgs);
}

// IDownloadProgressChangedCallbackArgs Interface
interface IDownloadProgressChangedCallbackArgs : IDispatch {
  mixin(uuid("324ff2c6-4981-4b04-9412-57481745ab24"));
  // static DWINGUID IID = { 0x324ff2c6, 0x4981, 0x4b04, 0x94, 0x12, 0x57, 0x48, 0x17, 0x45, 0xab, 0x24 };
  // Gets the progress of the asynchronous download at the time the callback was made.
  /*[id(0x60020001)]*/ int get_Progress(out IDownloadProgress retval);
}

// IInstallationCompletedCallback Interface
interface IInstallationCompletedCallback : IUnknown {
  mixin(uuid("45f4f6f3-d602-4f98-9a8a-3efa152ad2d3"));
  // static DWINGUID IID = { 0x45f4f6f3, 0xd602, 0x4f98, 0x9a, 0x8a, 0x3e, 0xfa, 0x15, 0x2a, 0xd2, 0xd3 };
  // Handles the notification about the completion of an asynchronous (un)installation initiated by the corresponding UpdateInstaller.BeginInstall or UpdateInstaller.BeginUninstall call.
  /*[id(0x60010001)]*/ int Invoke(IInstallationJob installationJob, IInstallationCompletedCallbackArgs callbackArgs);
}

// IInstallationJob Interface
interface IInstallationJob : IDispatch {
  mixin(uuid("5c209f0b-bad5-432a-9556-4699bed2638a"));
  // static DWINGUID IID = { 0x5c209f0b, 0xbad5, 0x432a, 0x95, 0x56, 0x46, 0x99, 0xbe, 0xd2, 0x63, 0x8a };
  // Gets the caller-specified state object passed to the corresponding UpdateInstaller.BeginInstall or UpdateInstaller.BeginUninstall methods.
  /*[id(0x60020001)]*/ int get_AsyncState(out DWINVARIANT retval);
  // Gets a value indicating whether the call has been completely processed.
  /*[id(0x60020002)]*/ int get_IsCompleted(out short retval);
  // Gets a read-only collection of the updates specified in the (un)installation.
  /*[id(0x60020003)]*/ int get_Updates(out IUpdateCollection retval);
  // Waits for asynchronous operation to complete and releases all callbacks, if any.
  /*[id(0x60020004)]*/ int CleanUp();
  // Gets the current progress of the (un)installation.
  /*[id(0x60020005)]*/ int GetProgress(out IInstallationProgress retval);
  // Requests to abort the asynchronous (un)installation.
  /*[id(0x60020006)]*/ int RequestAbort();
}

// IInstallationProgress Interface
interface IInstallationProgress : IDispatch {
  mixin(uuid("345c8244-43a3-4e32-a368-65f073b76f36"));
  // static DWINGUID IID = { 0x345c8244, 0x43a3, 0x4e32, 0xa3, 0x68, 0x65, 0xf0, 0x73, 0xb7, 0x6f, 0x36 };
  // Gets a zero-based index value into the updates specified in the (un)installation for the one which content file(s) are being (un)installed.
  /*[id(0x60020001)]*/ int get_CurrentUpdateIndex(out int retval);
  // Gets a value specifying how much the (un)installation has completed upon the update being (un)installed, in percents.
  /*[id(0x60020002)]*/ int get_CurrentUpdatePercentComplete(out int retval);
  // Gets a value specifying how much overall the (un)installation has completed, in percents.
  /*[id(0x60020003)]*/ int get_PercentComplete(out int retval);
  // Gets the result of the (un)installation on a specified update.
  /*[id(0x60020004)]*/ int GetUpdateResult(int updateIndex, out IUpdateInstallationResult retval);
}

// IUpdateInstallationResult Interface
interface IUpdateInstallationResult : IDispatch {
  mixin(uuid("d940f0f8-3cbb-4fd0-993f-471e7f2328ad"));
  // static DWINGUID IID = { 0xd940f0f8, 0x3cbb, 0x4fd0, 0x99, 0x3f, 0x47, 0x1e, 0x7f, 0x23, 0x28, 0xad };
  // Gets the HRESULT value from the operation on the update.
  /*[id(0x60020001)]*/ int get_HResult(out int retval);
  // Indicates whether system reboot is required on the target computer to complete the installation on the Update.
  /*[id(0x60020002)]*/ int get_RebootRequired(out short retval);
  // Gets an OperationResultCode enumeration value specifying the result of the operation on the update.
  /*[id(0x60020003)]*/ int get_ResultCode(out OperationResultCode retval);
}

// IInstallationCompletedCallbackArgs Interface
interface IInstallationCompletedCallbackArgs : IDispatch {
  mixin(uuid("250e2106-8efb-4705-9653-ef13c581b6a1"));
  // static DWINGUID IID = { 0x250e2106, 0x8efb, 0x4705, 0x96, 0x53, 0xef, 0x13, 0xc5, 0x81, 0xb6, 0xa1 };
}

// IInstallationProgressChangedCallback Interface
interface IInstallationProgressChangedCallback : IUnknown {
  mixin(uuid("e01402d5-f8da-43ba-a012-38894bd048f1"));
  // static DWINGUID IID = { 0xe01402d5, 0xf8da, 0x43ba, 0xa0, 0x12, 0x38, 0x89, 0x4b, 0xd0, 0x48, 0xf1 };
  // Handles the notification about the change of progress of an asynchronous (un)installation initiated by the corresponding UpdateInstaller.BeginInstall or Update.BeginUninstall call.
  /*[id(0x60010001)]*/ int Invoke(IInstallationJob installationJob, IInstallationProgressChangedCallbackArgs callbackArgs);
}

// IInstallationProgressChangedCallbackArgs Interface
interface IInstallationProgressChangedCallbackArgs : IDispatch {
  mixin(uuid("e4f14e1e-689d-4218-a0b9-bc189c484a01"));
  // static DWINGUID IID = { 0xe4f14e1e, 0x689d, 0x4218, 0xa0, 0xb9, 0xbc, 0x18, 0x9c, 0x48, 0x4a, 0x01 };
  // Gets the progress of the asynchronous (un)installation at the time the callback was made.
  /*[id(0x60020001)]*/ int get_Progress(out IInstallationProgress retval);
}

// IUpdateHistoryEntry Interface
interface IUpdateHistoryEntry : IDispatch {
  mixin(uuid("be56a644-af0e-4e0e-a311-c1d8e695cbff"));
  // static DWINGUID IID = { 0xbe56a644, 0xaf0e, 0x4e0e, 0xa3, 0x11, 0xc1, 0xd8, 0xe6, 0x95, 0xcb, 0xff };
  // Gets an Operation enumeration value specifying the the operation on the update.
  /*[id(0x60020001)]*/ int get_Operation(out UpdateOperation retval);
  // Gets an OperationResultCode enumeration value specifying the result of the operation on the update.
  /*[id(0x60020002)]*/ int get_ResultCode(out OperationResultCode retval);
  // Gets the HRESULT value returned from the operation on the update.
  /*[id(0x60020003)]*/ int get_HResult(out int retval);
  // Gets the date and time when the update was applied.
  /*[id(0x60020004)]*/ int get_Date(out double retval);
  // Gets the globally-unique identity of the update.
  /*[id(0x60020005)]*/ int get_UpdateIdentity(out IUpdateIdentity retval);
  // Gets the title of the update.
  /*[id(0x60020006)]*/ int get_Title(out wchar* retval);
  // Gets the description of the update.
  /*[id(0x60020007)]*/ int get_Description(out wchar* retval);
  // Gets the unmapped result code returned from the operation on the update.
  /*[id(0x60020008)]*/ int get_UnmappedResultCode(out int retval);
  // Gets the identifier of the client application that processed the update.
  /*[id(0x60020009)]*/ int get_ClientApplicationID(out wchar* retval);
  // Gets the kind of service where the update came from.
  /*[id(0x6002000A)]*/ int get_ServerSelection(out ServerSelection retval);
  // Gets the identifier of the service where the update came from.
  /*[id(0x6002000B)]*/ int get_ServiceID(out wchar* retval);
  // Gets steps to uninstall update.
  /*[id(0x6002000C)]*/ int get_UninstallationSteps(out IStringCollection retval);
  // Gets uninstallation notes.
  /*[id(0x6002000D)]*/ int get_UninstallationNotes(out wchar* retval);
  // Gets support URL.
  /*[id(0x6002000E)]*/ int get_SupportUrl(out wchar* retval);
}

// IUpdateHistoryEntry2 Interface
interface IUpdateHistoryEntry2 : IUpdateHistoryEntry {
  mixin(uuid("c2bfb780-4539-4132-ab8c-0a8772013ab6"));
  // static DWINGUID IID = { 0xc2bfb780, 0x4539, 0x4132, 0xab, 0x8c, 0x0a, 0x87, 0x72, 0x01, 0x3a, 0xb6 };
  // Gets the categories that the update belongs to.
  /*[id(0x60030001)]*/ int get_Categories(out ICategoryCollection retval);
}

// IUpdateDownloadContent2 Interface
interface IUpdateDownloadContent2 : IUpdateDownloadContent {
  mixin(uuid("c97ad11b-f257-420b-9d9f-377f733f6f68"));
  // static DWINGUID IID = { 0xc97ad11b, 0xf257, 0x420b, 0x9d, 0x9f, 0x37, 0x7f, 0x73, 0x3f, 0x6f, 0x68 };
  // Returns whether this forms part of the delta compressed download content.
  /*[id(0x60030001)]*/ int get_IsDeltaCompressedContent(out short retval);
}

// IUpdateSearcher2 Interface
interface IUpdateSearcher2 : IUpdateSearcher {
  mixin(uuid("4cbdcb2d-1589-4beb-bd1c-3e582ff0add0"));
  // static DWINGUID IID = { 0x4cbdcb2d, 0x1589, 0x4beb, 0xbd, 0x1c, 0x3e, 0x58, 0x2f, 0xf0, 0xad, 0xd0 };
  // Gets whether to ignore download priority of updates when computing potential supersedence.
  /*[id(0x60030001)]*/ int get_IgnoreDownloadPriority(out short retval);
  // Gets whether to ignore download priority of updates when computing potential supersedence.
  /*[id(0x60030001)]*/ int set_IgnoreDownloadPriority(short retval);
}

// IUpdateSearcher Interface
interface IUpdateSearcher : IDispatch {
  mixin(uuid("8f45abf1-f9ae-4b95-a933-f0f66e5056ea"));
  // static DWINGUID IID = { 0x8f45abf1, 0xf9ae, 0x4b95, 0xa9, 0x33, 0xf0, 0xf6, 0x6e, 0x50, 0x56, 0xea };
  // Indicates whether future calls to BeginSearch and Search can automatically upgrade the MSUS client as a side-effect.
  /*[id(0x60020001)]*/ int get_CanAutomaticallyUpgradeService(out short retval);
  // Indicates whether future calls to BeginSearch and Search can automatically upgrade the MSUS client as a side-effect.
  /*[id(0x60020001)]*/ int set_CanAutomaticallyUpgradeService(short retval);
  // Gets the identifier of the current client application.
  /*[id(0x60020003)]*/ int get_ClientApplicationID(out wchar* retval);
  // Gets the identifier of the current client application.
  /*[id(0x60020003)]*/ int set_ClientApplicationID(wchar* retval);
  // Indicates whether to include, in the search results, updates that are superseded by any other updates in the results.
  /*[id(0x60020004)]*/ int get_IncludePotentiallySupersededUpdates(out short retval);
  // Indicates whether to include, in the search results, updates that are superseded by any other updates in the results.
  /*[id(0x60020004)]*/ int set_IncludePotentiallySupersededUpdates(short retval);
  // Gets the server specified.
  /*[id(0x60020007)]*/ int get_ServerSelection(out ServerSelection retval);
  // Gets the server specified.
  /*[id(0x60020007)]*/ int set_ServerSelection(ServerSelection retval);
  // Starts an asynchronous search using the currently configured search options.
  /*[id(0x60020008)]*/ int BeginSearch(wchar* criteria, IUnknown onCompleted, DWINVARIANT state, out ISearchJob retval);
  // Completes an asynchronous search.
  /*[id(0x60020009)]*/ int EndSearch(ISearchJob searchJob, out ISearchResult retval);
  // Convert string into one that can be used as a literal value in a search criteria string.
  /*[id(0x6002000A)]*/ int EscapeString(wchar* unescaped, out wchar* retval);
  // Synchronously queries the target computer for the history of update events.
  /*[id(0x6002000B)]*/ int QueryHistory(int startIndex, int Count, out IUpdateHistoryEntryCollection retval);
  // Perform a synchronous search using the currently configured search options.
  /*[id(0x6002000C)]*/ int Search(wchar* criteria, out ISearchResult retval);
  // Indicates whether the UpdateSearcher goes online when searching for updates.
  /*[id(0x6002000D)]*/ int get_Online(out short retval);
  // Indicates whether the UpdateSearcher goes online when searching for updates.
  /*[id(0x6002000D)]*/ int set_Online(short retval);
  // Get number of update events on the target computer.
  /*[id(0x6002000E)]*/ int GetTotalHistoryCount(out int retval);
  // Gets the Non-Windows Update Service ID specified.
  /*[id(0x6002000F)]*/ int get_ServiceID(out wchar* retval);
  // Gets the Non-Windows Update Service ID specified.
  /*[id(0x6002000F)]*/ int set_ServiceID(wchar* retval);
}

// ISearchResult Interface
interface ISearchResult : IDispatch {
  mixin(uuid("d40cff62-e08c-4498-941a-01e25f0fd33c"));
  // static DWINGUID IID = { 0xd40cff62, 0xe08c, 0x4498, 0x94, 0x1a, 0x01, 0xe2, 0x5f, 0x0f, 0xd3, 0x3c };
  // Gets an OperationResultCode enumeration value specifying the overall result of the search.
  /*[id(0x60020001)]*/ int get_ResultCode(out OperationResultCode retval);
  // Gets the root categories currently available on the target  computer.
  /*[id(0x60020002)]*/ int get_RootCategories(out ICategoryCollection retval);
  // Gets a collection of Updates resulted from the search.
  /*[id(0x60020003)]*/ int get_Updates(out IUpdateCollection retval);
  // Gets a collection of warnings resulted from the search.
  /*[id(0x60020004)]*/ int get_Warnings(out IUpdateExceptionCollection retval);
}

// IUpdateExceptionCollection Interface
interface IUpdateExceptionCollection : IDispatch {
  mixin(uuid("503626a3-8e14-4729-9355-0fe664bd2321"));
  // static DWINGUID IID = { 0x503626a3, 0x8e14, 0x4729, 0x93, 0x55, 0x0f, 0xe6, 0x64, 0xbd, 0x23, 0x21 };
  // Gets an element in the collection.
  /*[id(0x00000000)]*/ int get_Item(int index, out IUpdateException retval);
  // Gets an IEnumVARIANT interface on an object that can be used to enumerate the collection.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown retval);
  // Gets the number of elements contained in the collection.
  /*[id(0x60020001)]*/ int get_Count(out int retval);
}

// IUpdateHistoryEntryCollection Interface
interface IUpdateHistoryEntryCollection : IDispatch {
  mixin(uuid("a7f04f3c-a290-435b-aadf-a116c3357a5c"));
  // static DWINGUID IID = { 0xa7f04f3c, 0xa290, 0x435b, 0xaa, 0xdf, 0xa1, 0x16, 0xc3, 0x35, 0x7a, 0x5c };
  // Gets an element in the collection.
  /*[id(0x00000000)]*/ int get_Item(int index, out IUpdateHistoryEntry retval);
  // Gets an IEnumVARIANT interface on an object that can be used to enumerate the collection.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown retval);
  // Gets the number of elements contained in the collection.
  /*[id(0x60020001)]*/ int get_Count(out int retval);
}

// IWebProxy Interface
interface IWebProxy : IDispatch {
  mixin(uuid("174c81fe-aecd-4dae-b8a0-2c6318dd86a8"));
  // static DWINGUID IID = { 0x174c81fe, 0xaecd, 0x4dae, 0xb8, 0xa0, 0x2c, 0x63, 0x18, 0xdd, 0x86, 0xa8 };
  // Gets the address of the proxy server.
  /*[id(0x60020001)]*/ int get_Address(out wchar* retval);
  // Gets the address of the proxy server.
  /*[id(0x60020001)]*/ int set_Address(wchar* retval);
  // Gets a collection of addresses that do not use the proxy server.
  /*[id(0x60020002)]*/ int get_BypassList(out IStringCollection retval);
  // Gets a collection of addresses that do not use the proxy server.
  /*[id(0x60020002)]*/ int set_BypassList(IStringCollection retval);
  // Gets a value indicating whether to bypass the proxy server for local addresses.
  /*[id(0x60020003)]*/ int get_BypassProxyOnLocal(out short retval);
  // Gets a value indicating whether to bypass the proxy server for local addresses.
  /*[id(0x60020003)]*/ int set_BypassProxyOnLocal(short retval);
  // Gets a boolean value indicating whether the WebProxy object is read-only.
  /*[id(0x60020004)]*/ int get_ReadOnly(out short retval);
  // Gets the user name to submit to the proxy server for authentication.
  /*[id(0x60020005)]*/ int get_UserName(out wchar* retval);
  // Gets the user name to submit to the proxy server for authentication.
  /*[id(0x60020005)]*/ int set_UserName(wchar* retval);
  // Sets the password to submit to the proxy server for authentication.
  /*[id(0x60020006)]*/ int SetPassword(wchar* value);
  // Launches the Credentials UI to prompt user for password for proxy authentication.
  /*[id(0x60020007)]*/ int PromptForCredentials(IUnknown parentWindow, wchar* Title);
  // Launches the Credentials UI to prompt user for password for proxy authentication.
  /*[id(0x60020008)]*/ int PromptForCredentialsFromHwnd(wireHWND parentWindow, wchar* Title);
  // Indicates whether to automatically detect proxy settings.
  /*[id(0x60020009)]*/ int get_AutoDetect(out short retval);
  // Indicates whether to automatically detect proxy settings.
  /*[id(0x60020009)]*/ int set_AutoDetect(short retval);
}

// ISystemInformation Interface
interface ISystemInformation : IDispatch {
  mixin(uuid("ade87bf7-7b56-4275-8fab-b9b0e591844b"));
  // static DWINGUID IID = { 0xade87bf7, 0x7b56, 0x4275, 0x8f, 0xab, 0xb9, 0xb0, 0xe5, 0x91, 0x84, 0x4b };
  // Gets the hyperlink to the support information on the OEM hardware.
  /*[id(0x60020001)]*/ int get_OemHardwareSupportLink(out wchar* retval);
  // Gets a value indicating whether a system reboot is required to complete (un)installation of one or more Updates.
  /*[id(0x60020002)]*/ int get_RebootRequired(out short retval);
}

// IWindowsUpdateAgentInfo Interface
interface IWindowsUpdateAgentInfo : IDispatch {
  mixin(uuid("85713fa1-7796-4fa2-be3b-e2d6124dd373"));
  // static DWINGUID IID = { 0x85713fa1, 0x7796, 0x4fa2, 0xbe, 0x3b, 0xe2, 0xd6, 0x12, 0x4d, 0xd3, 0x73 };
  // Get Windows Update Agent Info.
  /*[id(0x60020001)]*/ int GetInfo(DWINVARIANT varInfoIdentifier, out DWINVARIANT retval);
}

// IAutomaticUpdates Interface
interface IAutomaticUpdates : IDispatch {
  mixin(uuid("673425bf-c082-4c7c-bdfd-569464b8e0ce"));
  // static DWINGUID IID = { 0x673425bf, 0xc082, 0x4c7c, 0xbd, 0xfd, 0x56, 0x94, 0x64, 0xb8, 0xe0, 0xce };
  // Triggers automatic updating now if it is not yet started.
  /*[id(0x60020001)]*/ int DetectNow();
  // Pauses automatic updating.
  /*[id(0x60020002)]*/ int Pause();
  // Resumes automatic updating if paused.
  /*[id(0x60020003)]*/ int Resume();
  // Display a dialog box showing settings for Automatic Updates.
  /*[id(0x60020004)]*/ int ShowSettingsDialog();
  // Returns the settings to configure Automatic Updates.
  /*[id(0x60020005)]*/ int get_Settings(out IAutomaticUpdatesSettings retval);
  // Indicates whether all the components that Automatic Updates requires are up and running.
  /*[id(0x60020006)]*/ int get_ServiceEnabled(out short retval);
  // Enables all the components that Automatic Updates requires.
  /*[id(0x60020007)]*/ int EnableService();
}

// IAutomaticUpdatesSettings Interface
interface IAutomaticUpdatesSettings : IDispatch {
  mixin(uuid("2ee48f22-af3c-405f-8970-f71be12ee9a2"));
  // static DWINGUID IID = { 0x2ee48f22, 0xaf3c, 0x405f, 0x89, 0x70, 0xf7, 0x1b, 0xe1, 0x2e, 0xe9, 0xa2 };
  // Indicates how elevated users will be notified about Automatic Updates events.
  /*[id(0x60020001)]*/ int get_NotificationLevel(out AutomaticUpdatesNotificationLevel retval);
  // Indicates how elevated users will be notified about Automatic Updates events.
  /*[id(0x60020001)]*/ int set_NotificationLevel(AutomaticUpdatesNotificationLevel retval);
  // Indicates whether the settings are read-only.
  /*[id(0x60020002)]*/ int get_ReadOnly(out short retval);
  // Indicates whether the Automatic Updates service is required by Group Policy.
  /*[id(0x60020003)]*/ int get_Required(out short retval);
  // Indicates which day(s) of week Automatic Updates may (un)install updates.
  /*[id(0x60020004)]*/ int get_ScheduledInstallationDay(out AutomaticUpdatesScheduledInstallationDay retval);
  // Indicates which day(s) of week Automatic Updates may (un)install updates.
  /*[id(0x60020004)]*/ int set_ScheduledInstallationDay(AutomaticUpdatesScheduledInstallationDay retval);
  // Indicates the time when Automatic Updates may (un)install updates.
  /*[id(0x60020005)]*/ int get_ScheduledInstallationTime(out int retval);
  // Indicates the time when Automatic Updates may (un)install updates.
  /*[id(0x60020005)]*/ int set_ScheduledInstallationTime(int retval);
  // Gets the up-to-date settings.
  /*[id(0x60020006)]*/ int Refresh();
  // Applies the settings.
  /*[id(0x60020007)]*/ int Save();
}

// IUpdateDownloader Interface
interface IUpdateDownloader : IDispatch {
  mixin(uuid("68f1c6f9-7ecc-4666-a464-247fe12496c3"));
  // static DWINGUID IID = { 0x68f1c6f9, 0x7ecc, 0x4666, 0xa4, 0x64, 0x24, 0x7f, 0xe1, 0x24, 0x96, 0xc3 };
  // Gets the identifier of the current client application.
  /*[id(0x60020001)]*/ int get_ClientApplicationID(out wchar* retval);
  // Gets the identifier of the current client application.
  /*[id(0x60020001)]*/ int set_ClientApplicationID(wchar* retval);
  // Indicates whether to forcefully download the specified updates.
  /*[id(0x60020002)]*/ int get_IsForced(out short retval);
  // Indicates whether to forcefully download the specified updates.
  /*[id(0x60020002)]*/ int set_IsForced(short retval);
  // Gets the desired priority level of the download.
  /*[id(0x60020003)]*/ int get_Priority(out DownloadPriority retval);
  // Gets the desired priority level of the download.
  /*[id(0x60020003)]*/ int set_Priority(DownloadPriority retval);
  // Gets the updates to download.
  /*[id(0x60020004)]*/ int get_Updates(out IUpdateCollection retval);
  // Gets the updates to download.
  /*[id(0x60020004)]*/ int set_Updates(IUpdateCollection retval);
  // Begins an asynchronous operation to download the content file(s) associated with the updates.
  /*[id(0x60020005)]*/ int BeginDownload(IUnknown onProgressChanged, IUnknown onCompleted, DWINVARIANT state, out IDownloadJob retval);
  // Synchronously downloads the content file(s) of the update(s) to the local cache on the target computer.
  /*[id(0x60020006)]*/ int Download(out IDownloadResult retval);
  // Completes an asynchronous download.
  /*[id(0x60020007)]*/ int EndDownload(IDownloadJob value, out IDownloadResult retval);
}

// IDownloadResult Interface
interface IDownloadResult : IDispatch {
  mixin(uuid("daa4fdd0-4727-4dbe-a1e7-745dca317144"));
  // static DWINGUID IID = { 0xdaa4fdd0, 0x4727, 0x4dbe, 0xa1, 0xe7, 0x74, 0x5d, 0xca, 0x31, 0x71, 0x44 };
  // Gets the HRESULT value returned from the download.
  /*[id(0x60020001)]*/ int get_HResult(out int retval);
  // Gets an OperationResultCode enumeration value specifying the overall result of the download.
  /*[id(0x60020002)]*/ int get_ResultCode(out OperationResultCode retval);
  // Gets the result of the download on a specified update.
  /*[id(0x60020003)]*/ int GetUpdateResult(int updateIndex, out IUpdateDownloadResult retval);
}

// IUpdateInstaller2 Interface
interface IUpdateInstaller2 : IUpdateInstaller {
  mixin(uuid("3442d4fe-224d-4cee-98cf-30e0c4d229e6"));
  // static DWINGUID IID = { 0x3442d4fe, 0x224d, 0x4cee, 0x98, 0xcf, 0x30, 0xe0, 0xc4, 0xd2, 0x29, 0xe6 };
  // Returns whether no UI interaction will be forced.
  /*[id(0x60030001)]*/ int get_ForceQuiet(out short retval);
  // Returns whether no UI interaction will be forced.
  /*[id(0x60030001)]*/ int set_ForceQuiet(short retval);
}

// IUpdateInstaller Interface
interface IUpdateInstaller : IDispatch {
  mixin(uuid("7b929c68-ccdc-4226-96b1-8724600b54c2"));
  // static DWINGUID IID = { 0x7b929c68, 0xccdc, 0x4226, 0x96, 0xb1, 0x87, 0x24, 0x60, 0x0b, 0x54, 0xc2 };
  // Gets the identifier of the current client application.
  /*[id(0x60020001)]*/ int get_ClientApplicationID(out wchar* retval);
  // Gets the identifier of the current client application.
  /*[id(0x60020001)]*/ int set_ClientApplicationID(wchar* retval);
  // Indicates whether to forcefully (un)install the specified updates.
  /*[id(0x60020002)]*/ int get_IsForced(out short retval);
  // Indicates whether to forcefully (un)install the specified updates.
  /*[id(0x60020002)]*/ int set_IsForced(short retval);
  // Gets the window on top of which the wizard dialog box should be shown.
  /*[id(0x60020003)]*/ int get_ParentHwnd(out wireHWND retval);
  // Gets the window on top of which the wizard dialog box should be shown.
  /*[id(0x60020003)]*/ int set_ParentHwnd(wireHWND retval);
  // Sets the web browser window on top of which the wizard dialog box should be shown.
  /*[id(0x60020004)]*/ int set_parentWindow(IUnknown retval);
  // Sets the web browser window on top of which the wizard dialog box should be shown.
  /*[id(0x60020004)]*/ int get_parentWindow(out IUnknown retval);
  // Gets the updates to (un)install.
  /*[id(0x60020005)]*/ int get_Updates(out IUpdateCollection retval);
  // Gets the updates to (un)install.
  /*[id(0x60020005)]*/ int set_Updates(IUpdateCollection retval);
  // Begins an asynchronous operation to install the updates.
  /*[id(0x60020006)]*/ int BeginInstall(IUnknown onProgressChanged, IUnknown onCompleted, DWINVARIANT state, out IInstallationJob retval);
  // Begins an asynchronous operation to uninstall the updates.
  /*[id(0x60020007)]*/ int BeginUninstall(IUnknown onProgressChanged, IUnknown onCompleted, DWINVARIANT state, out IInstallationJob retval);
  // Completes an asynchronous installation.
  /*[id(0x60020008)]*/ int EndInstall(IInstallationJob value, out IInstallationResult retval);
  // Completes an asynchronous uninstallation.
  /*[id(0x60020009)]*/ int EndUninstall(IInstallationJob value, out IInstallationResult retval);
  // Synchronously installs updates onto the target computer.
  /*[id(0x6002000A)]*/ int Install(out IInstallationResult retval);
  // Interactively guides the local user to go through the steps to install updates.
  /*[id(0x6002000B)]*/ int RunWizard(wchar* dialogTitle, out IInstallationResult retval);
  // Indicates whether (un)installation can be performed on the target computer at this moment.
  /*[id(0x6002000C)]*/ int get_IsBusy(out short retval);
  // Synchronously uninstalls the updates from the target computer.
  /*[id(0x6002000D)]*/ int Uninstall(out IInstallationResult retval);
  // Indicates whether to show source prompts to the user, when needed, while installing updates.
  /*[id(0x6002000E)]*/ int get_AllowSourcePrompts(out short retval);
  // Indicates whether to show source prompts to the user, when needed, while installing updates.
  /*[id(0x6002000E)]*/ int set_AllowSourcePrompts(short retval);
  // Gets a value indicating whether a system reboot is required before (un)installing updates.
  /*[id(0x6002000F)]*/ int get_RebootRequiredBeforeInstallation(out short retval);
}

// IInstallationResult Interface
interface IInstallationResult : IDispatch {
  mixin(uuid("a43c56d6-7451-48d4-af96-b6cd2d0d9b7a"));
  // static DWINGUID IID = { 0xa43c56d6, 0x7451, 0x48d4, 0xaf, 0x96, 0xb6, 0xcd, 0x2d, 0x0d, 0x9b, 0x7a };
  // Gets the HRESULT returned from the (un)installation.
  /*[id(0x60020001)]*/ int get_HResult(out int retval);
  // Indicates whether a system reboot is required on the target computer to complete the (un)installation.
  /*[id(0x60020002)]*/ int get_RebootRequired(out short retval);
  // Gets an OperationResultCode enumeration value specifying the overall result of the (un)installation.
  /*[id(0x60020003)]*/ int get_ResultCode(out OperationResultCode retval);
  // Gets the result of the (un)installation on a specified update.
  /*[id(0x60020004)]*/ int GetUpdateResult(int updateIndex, out IUpdateInstallationResult retval);
}

// IUpdateSession2 Interface
interface IUpdateSession2 : IUpdateSession {
  mixin(uuid("91caf7b0-eb23-49ed-9937-c52d817f46f7"));
  // static DWINGUID IID = { 0x91caf7b0, 0xeb23, 0x49ed, 0x99, 0x37, 0xc5, 0x2d, 0x81, 0x7f, 0x46, 0xf7 };
  // Gets the locale being used for update results.
  /*[id(0x60030001)]*/ int get_UserLocale(out uint retval);
  // Gets the locale being used for update results.
  /*[id(0x60030001)]*/ int set_UserLocale(uint retval);
}

// IUpdateSession Interface
interface IUpdateSession : IDispatch {
  mixin(uuid("816858a4-260d-4260-933a-2585f1abc76b"));
  // static DWINGUID IID = { 0x816858a4, 0x260d, 0x4260, 0x93, 0x3a, 0x25, 0x85, 0xf1, 0xab, 0xc7, 0x6b };
  // Gets the identifier of the current client application.
  /*[id(0x60020001)]*/ int get_ClientApplicationID(out wchar* retval);
  // Gets the identifier of the current client application.
  /*[id(0x60020001)]*/ int set_ClientApplicationID(wchar* retval);
  // Gets a boolean value indicating whether the UpdateSession object is read-only.
  /*[id(0x60020002)]*/ int get_ReadOnly(out short retval);
  // Gets the proxy settings required to reaching the server for future operations in the UpdateSession.
  /*[id(0x60020003)]*/ int get_WebProxy(out IWebProxy retval);
  // Gets the proxy settings required to reaching the server for future operations in the UpdateSession.
  /*[id(0x60020003)]*/ int set_WebProxy(IWebProxy retval);
  // Creates an UpdateSearcher within the UpdateSession.
  /*[id(0x60020004)]*/ int CreateUpdateSearcher(out IUpdateSearcher retval);
  // Creates an UpdateDownloader within the UpdateSession.
  /*[id(0x60020005)]*/ int CreateUpdateDownloader(out IUpdateDownloader retval);
  // Creates an UpdateInstaller within the UpdateSession.
  /*[id(0x60020006)]*/ int CreateUpdateInstaller(out IUpdateInstaller retval);
}

// IUpdateServiceManager Interface
interface IUpdateServiceManager : IDispatch {
  mixin(uuid("23857e3c-02ba-44a3-9423-b1c900805f37"));
  // static DWINGUID IID = { 0x23857e3c, 0x02ba, 0x44a3, 0x94, 0x23, 0xb1, 0xc9, 0x00, 0x80, 0x5f, 0x37 };
  // Gets the services registered with the Windows Update Agent.
  /*[id(0x60020001)]*/ int get_Services(out IUpdateServiceCollection retval);
  // Registers a service with the Windows Update Agent.
  /*[id(0x60020002)]*/ int AddService(wchar* ServiceID, wchar* authorizationCabPath, out IUpdateService retval);
  // Registers the service with Automatic Updates.
  /*[id(0x60020003)]*/ int RegisterServiceWithAU(wchar* ServiceID);
  // Removes a service registration from the Windows Update Agent.
  /*[id(0x60020004)]*/ int RemoveService(wchar* ServiceID);
  // Unregisters the service from Automatic Updates.
  /*[id(0x60020005)]*/ int UnregisterServiceWithAU(wchar* ServiceID);
  // Adds the scan package service.
  /*[id(0x60020006)]*/ int AddScanPackageService(wchar* serviceName, wchar* scanFileLocation, int flags, out IUpdateService ppService);
  // Sets options for the functionality this object provides.
  /*[id(0x60010007)]*/ int SetOption(wchar* optionName, DWINVARIANT optionValue);
}

// IUpdateServiceCollection Interface
interface IUpdateServiceCollection : IDispatch {
  mixin(uuid("9b0353aa-0e52-44ff-b8b0-1f7fa0437f88"));
  // static DWINGUID IID = { 0x9b0353aa, 0x0e52, 0x44ff, 0xb8, 0xb0, 0x1f, 0x7f, 0xa0, 0x43, 0x7f, 0x88 };
  // Gets an element in the collection.
  /*[id(0x00000000)]*/ int get_Item(int index, out IUpdateService retval);
  // Gets an IEnumVARIANT interface on an object that can be used to enumerate the collection.
  /*[id(0xFFFFFFFC)]*/ int get__NewEnum(out IUnknown retval);
  // Gets the number of elements contained in the collection.
  /*[id(0x60020001)]*/ int get_Count(out int retval);
}

// IUpdateService Interface
interface IUpdateService : IDispatch {
  mixin(uuid("76b3b17e-aed6-4da5-85f0-83587f81abe3"));
  // static DWINGUID IID = { 0x76b3b17e, 0xaed6, 0x4da5, 0x85, 0xf0, 0x83, 0x58, 0x7f, 0x81, 0xab, 0xe3 };
  // Name of the Service.
  /*[id(0x00000000)]*/ int get_Name(out wchar* retval);
  // SHA1 hash of the certificate used to sign contents.
  /*[id(0x60020001)]*/ int get_ContentValidationCert(out DWINVARIANT retval);
  // Gets the date on which the Authorization Cab expires.
  /*[id(0x60020002)]*/ int get_ExpirationDate(out double retval);
  // Indicates whether the Service is a managed service.
  /*[id(0x60020003)]*/ int get_IsManaged(out short retval);
  // Indicates whether the Service is registered with Automatic Updates.
  /*[id(0x60020004)]*/ int get_IsRegisteredWithAU(out short retval);
  // Gets the date on which the Authorization Cab was issued.
  /*[id(0x60020005)]*/ int get_IssueDate(out double retval);
  // Indicates whether the Service offers Windows updates.
  /*[id(0x60020006)]*/ int get_OffersWindowsUpdates(out short retval);
  // URLs for the redirector cab.
  /*[id(0x60020007)]*/ int get_RedirectUrls(out IStringCollection retval);
  // Gets the identifier of the Service.
  /*[id(0x60020008)]*/ int get_ServiceID(out wchar* retval);
  // Indicates whether the service is registered as a scan package service.
  /*[id(0x6002000A)]*/ int get_IsScanPackageService(out short retval);
  // Indicates whether the service can register with AU.
  /*[id(0x6002000B)]*/ int get_CanRegisterWithAU(out short retval);
  // Indicates the service URL.
  /*[id(0x6002000C)]*/ int get_ServiceUrl(out wchar* retval);
  // Indicates the prefix for setup files.
  /*[id(0x6002000D)]*/ int get_SetupPrefix(out wchar* retval);
}

// CoClasses

// StringCollection Class
abstract class StringCollection {
  mixin(uuid("72c97d74-7c3b-40ae-b77d-abdb22eba6fb"));
  // static DWINGUID CLSID = { 0x72c97d74, 0x7c3b, 0x40ae, 0xb7, 0x7d, 0xab, 0xdb, 0x22, 0xeb, 0xa6, 0xfb };
  mixin Interfaces!(IStringCollection);
}

// UpdateSearcher Class
abstract class UpdateSearcher {
  mixin(uuid("b699e5e8-67ff-4177-88b0-3684a3388bfb"));
  // static DWINGUID CLSID = { 0xb699e5e8, 0x67ff, 0x4177, 0x88, 0xb0, 0x36, 0x84, 0xa3, 0x38, 0x8b, 0xfb };
  mixin Interfaces!(IUpdateSearcher2);
}

// WebProxy Class
abstract class WebProxy {
  mixin(uuid("650503cf-9108-4ddc-a2ce-6c2341e1c582"));
  // static DWINGUID CLSID = { 0x650503cf, 0x9108, 0x4ddc, 0xa2, 0xce, 0x6c, 0x23, 0x41, 0xe1, 0xc5, 0x82 };
  mixin Interfaces!(IWebProxy);
}

// SystemInformation Class
abstract class SystemInformation {
  mixin(uuid("c01b9ba0-bea7-41ba-b604-d0a36f469133"));
  // static DWINGUID CLSID = { 0xc01b9ba0, 0xbea7, 0x41ba, 0xb6, 0x04, 0xd0, 0xa3, 0x6f, 0x46, 0x91, 0x33 };
  mixin Interfaces!(ISystemInformation);
}

// WindowsUpdateAgentInfo Class
abstract class WindowsUpdateAgentInfo {
  mixin(uuid("c2e88c2f-6f5b-4aaa-894b-55c847ad3a2d"));
  // static DWINGUID CLSID = { 0xc2e88c2f, 0x6f5b, 0x4aaa, 0x89, 0x4b, 0x55, 0xc8, 0x47, 0xad, 0x3a, 0x2d };
  mixin Interfaces!(IWindowsUpdateAgentInfo);
}

// AutomaticUpdates Class
abstract class AutomaticUpdates {
  mixin(uuid("bfe18e9c-6d87-4450-b37c-e02f0b373803"));
  // static DWINGUID CLSID = { 0xbfe18e9c, 0x6d87, 0x4450, 0xb3, 0x7c, 0xe0, 0x2f, 0x0b, 0x37, 0x38, 0x03 };
  mixin Interfaces!(IAutomaticUpdates);
}

// UpdateCollection Class
abstract class UpdateCollection {
  mixin(uuid("13639463-00db-4646-803d-528026140d88"));
  // static DWINGUID CLSID = { 0x13639463, 0x00db, 0x4646, 0x80, 0x3d, 0x52, 0x80, 0x26, 0x14, 0x0d, 0x88 };
  mixin Interfaces!(IUpdateCollection);
}

// UpdateDownloader Class
abstract class UpdateDownloader {
  mixin(uuid("5baf654a-5a07-4264-a255-9ff54c7151e7"));
  // static DWINGUID CLSID = { 0x5baf654a, 0x5a07, 0x4264, 0xa2, 0x55, 0x9f, 0xf5, 0x4c, 0x71, 0x51, 0xe7 };
  mixin Interfaces!(IUpdateDownloader);
}

// UpdateInstaller Class
abstract class UpdateInstaller {
  mixin(uuid("d2e0fe7f-d23e-48e1-93c0-6fa8cc346474"));
  // static DWINGUID CLSID = { 0xd2e0fe7f, 0xd23e, 0x48e1, 0x93, 0xc0, 0x6f, 0xa8, 0xcc, 0x34, 0x64, 0x74 };
  mixin Interfaces!(IUpdateInstaller2);
}

// UpdateSession Class
abstract class UpdateSession {
  mixin(uuid("4cb43d7f-7eee-4906-8698-60da1c38f2fe"));
  // static DWINGUID CLSID = { 0x4cb43d7f, 0x7eee, 0x4906, 0x86, 0x98, 0x60, 0xda, 0x1c, 0x38, 0xf2, 0xfe };
  mixin Interfaces!(IUpdateSession2);
}

// UpdateServiceManager Class
abstract class UpdateServiceManager {
  mixin(uuid("f8d253d9-89a4-4daa-87b6-1168369f0b21"));
  // static DWINGUID CLSID = { 0xf8d253d9, 0x89a4, 0x4daa, 0x87, 0xb6, 0x11, 0x68, 0x36, 0x9f, 0x0b, 0x21 };
  mixin Interfaces!(IUpdateServiceManager);
}
