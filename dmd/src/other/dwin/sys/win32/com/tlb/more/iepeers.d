// iextag 1.0 Type Library
// Version 1.0

/*[uuid("7e8bc440-aeff-11d1-89c2-00c04fb6bfc4")]*/
//module dwin.sys.win32.com.tlb.more.iextag;
module dwin.sys.win32.com.tlb.more.iepeers;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IPeerFactory Interface
interface IPeerFactory : IUnknown {
  mixin(uuid("6663f9d3-b482-11d1-89c6-00c04fb6bfc4"));
  // static DWINGUID IID = { 0x6663f9d3, 0xb482, 0x11d1, 0x89, 0xc6, 0x00, 0xc0, 0x4f, 0xb6, 0xbf, 0xc4 };
}

// IClientCaps Interface
interface IClientCaps : IDispatch {
  mixin(uuid("7e8bc44d-aeff-11d1-89c2-00c04fb6bfc4"));
  // static DWINGUID IID = { 0x7e8bc44d, 0xaeff, 0x11d1, 0x89, 0xc2, 0x00, 0xc0, 0x4f, 0xb6, 0xbf, 0xc4 };
  /*[id(0x00000001)]*/ int get_javaEnabled(out short pVal);
  /*[id(0x00000002)]*/ int get_cookieEnabled(out short pVal);
  /*[id(0x00000003)]*/ int get_cpuClass(out wchar* p);
  /*[id(0x00000004)]*/ int get_systemLanguage(out wchar* p);
  /*[id(0x00000006)]*/ int get_userLanguage(out wchar* p);
  /*[id(0x00000007)]*/ int get_platform(out wchar* p);
  /*[id(0x00000009)]*/ int get_connectionSpeed(out int p);
  /*[id(0x0000000A)]*/ int get_onLine(out short p);
  /*[id(0x0000000B)]*/ int get_colorDepth(out int p);
  /*[id(0x0000000C)]*/ int get_bufferDepth(out int p);
  /*[id(0x0000000D)]*/ int get_width(out int p);
  /*[id(0x0000000E)]*/ int get_height(out int p);
  /*[id(0x0000000F)]*/ int get_availHeight(out int p);
  /*[id(0x00000010)]*/ int get_availWidth(out int p);
  /*[id(0x00000011)]*/ int get_connectionType(out wchar* p);
  /*[id(0x00000012)]*/ int isComponentInstalled(wchar* bstrName, wchar* bstrType, wchar* bStrVer, out short p);
  /*[id(0x00000013)]*/ int getComponentVersion(wchar* bstrName, wchar* bstrType, out wchar* pbstrVer);
  /*[id(0x00000014)]*/ int compareVersions(wchar* bstrVer1, wchar* bstrVer2, out int p);
  /*[id(0x00000015)]*/ int addComponentRequest(wchar* bstrName, wchar* bstrType, wchar* bStrVer);
  /*[id(0x00000016)]*/ int doComponentRequest(out short p);
  /*[id(0x00000017)]*/ int clearComponentRequest();
}

interface IIntelliForms : IDispatch {
  mixin(uuid("9b9f68e6-1aaa-11d2-bca5-00c04fd929db"));
  // static DWINGUID IID = { 0x9b9f68e6, 0x1aaa, 0x11d2, 0xbc, 0xa5, 0x00, 0xc0, 0x4f, 0xd9, 0x29, 0xdb };
  /*[id(0x00000001)]*/ int get_enabled(out short pVal);
  /*[id(0x00000001)]*/ int set_enabled(short pVal);
}

// IHomePage Interface
interface IHomePage : IDispatch {
  mixin(uuid("766bf2af-d650-11d1-9811-00c04fc31d2e"));
  // static DWINGUID IID = { 0x766bf2af, 0xd650, 0x11d1, 0x98, 0x11, 0x00, 0xc0, 0x4f, 0xc3, 0x1d, 0x2e };
  /*[id(0x00000001)]*/ int navigateHomePage();
  /*[id(0x00000002)]*/ int setHomePage(wchar* bstrURL);
  /*[id(0x00000003)]*/ int isHomePage(wchar* bstrURL, out short p);
}

interface IHTMLUserDataOM : IDispatch {
  mixin(uuid("3050f48f-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f48f, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int get_XMLDocument(out IDispatch p);
  /*[id(0x00000002)]*/ int save(wchar* strName);
  /*[id(0x00000003)]*/ int load(wchar* strName);
  /*[id(0x00000004)]*/ int getAttribute(wchar* name, out DWINVARIANT pValue);
  /*[id(0x00000005)]*/ int setAttribute(wchar* name, DWINVARIANT value);
  /*[id(0x00000006)]*/ int removeAttribute(wchar* name);
  /*[id(0x00000007)]*/ int set_expires(wchar* pbstr);
  /*[id(0x00000007)]*/ int get_expires(out wchar* pbstr);
}

interface HTMLPersistEvents : IDispatch {
  mixin(uuid("3050f4c7-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f4c7, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /+/*[id(0x00000001)]*/ void onsave();+/
  /+/*[id(0x00000002)]*/ void onload();+/
}

interface IHTMLPersistDataOM : IDispatch {
  mixin(uuid("3050f4c0-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f4c0, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000003)]*/ int get_XMLDocument(out IDispatch p);
  /*[id(0x00000004)]*/ int getAttribute(wchar* name, out DWINVARIANT pValue);
  /*[id(0x00000005)]*/ int setAttribute(wchar* name, DWINVARIANT value);
  /*[id(0x00000006)]*/ int removeAttribute(wchar* name);
}

interface IHTMLPersistData : IUnknown {
  mixin(uuid("3050f4c5-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f4c5, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int save(IUnknown pUnk, int lType, out short fContinueBroacast);
  /*[id(0x00000002)]*/ int load(IUnknown pUnk, int lType, out short fDoDefault);
  /*[id(0x00000003)]*/ int queryType(int lType, out short pfSupportsType);
}

interface IDownloadBehavior : IDispatch {
  mixin(uuid("3050f5bd-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f5bd, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int startDownload(wchar* bstrURL, IDispatch pdispCallback);
}

interface IHtmlArea : IDispatch {
  mixin(uuid("3050f64e-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f64e, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int set_value(wchar* p);
  /*[id(0x00000001)]*/ int get_value(out wchar* p);
  /*[id(0x00000002)]*/ int select();
}

interface IHTMLSelectElement3 : IDispatch {
  mixin(uuid("3050f687-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f687, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int clearSelection();
  /*[id(0x00000002)]*/ int selectAll();
  /*[id(0x00000003)]*/ int set_name(wchar* pbstrName);
  /*[id(0x00000003)]*/ int get_name(out wchar* pbstrName);
  /*[id(0x00000004)]*/ int set_size(int plSize);
  /*[id(0x00000004)]*/ int get_size(out int plSize);
  /*[id(0x00000005)]*/ int set_selectedIndex(int plIndex);
  /*[id(0x00000005)]*/ int get_selectedIndex(out int plIndex);
  /*[id(0x00000006)]*/ int set_multiple(short bMultiple);
  /*[id(0x00000006)]*/ int get_multiple(out short bMultiple);
  /*[id(0x00000007)]*/ int get_length(out int plLength);
  /*[id(0x00000008)]*/ int get_type(out wchar* pbstrType);
  /*[id(0x00000009)]*/ int get_options(out IDispatch ppOptions);
  /*[id(0x0000000A)]*/ int remove(int lIndex);
  /*[id(0x0000000B)]*/ int add(IDispatch pOption, DWINVARIANT varIndex);
  /*[id(0xFFFFFFFC)]*/ int get__newEnum(out IUnknown p);
  /*[id(0x00000000)]*/ int item(DWINVARIANT name, DWINVARIANT index, out IDispatch pdisp);
  /*[id(0x0000000E)]*/ int tags(DWINVARIANT tagName, out IDispatch pdisp);
  /*[id(0x0000000F)]*/ int urns(DWINVARIANT urn, out IDispatch pdisp);
}

interface IHTMLOptionElement2 : IDispatch {
  mixin(uuid("3050f697-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f697, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int set_value(wchar* p);
  /*[id(0x00000001)]*/ int get_value(out wchar* p);
  /*[id(0x00000002)]*/ int set_selected(short p);
  /*[id(0x00000002)]*/ int get_selected(out short p);
  /*[id(0x00000003)]*/ int set_defaultSelected(short p);
  /*[id(0x00000003)]*/ int get_defaultSelected(out short p);
  /*[id(0x00000004)]*/ int set_index(int plIndex);
  /*[id(0x00000004)]*/ int get_index(out int plIndex);
  /*[id(0x00000005)]*/ int set_text(wchar* pbstrText);
  /*[id(0x00000005)]*/ int get_text(out wchar* pbstrText);
}

interface ICombobox : IDispatch {
  mixin(uuid("3050f677-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f677, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int set_value(wchar* p);
  /*[id(0x00000001)]*/ int get_value(out wchar* p);
}

interface ICheckBox : IDispatch {
  mixin(uuid("3050f685-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f685, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int set_value(wchar* p);
  /*[id(0x00000001)]*/ int get_value(out wchar* p);
}

interface IRadioButton : IDispatch {
  mixin(uuid("3050f69b-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f69b, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int set_value(wchar* p);
  /*[id(0x00000001)]*/ int get_value(out wchar* p);
}

// Iwfolders Interface
interface Iwfolders : IDispatch {
  mixin(uuid("bae31f98-1b81-11d2-a97a-00c04f8ecb02"));
  // static DWINGUID IID = { 0xbae31f98, 0x1b81, 0x11d2, 0xa9, 0x7a, 0x00, 0xc0, 0x4f, 0x8e, 0xcb, 0x02 };
  // method navigate
  /*[id(0x00000001)]*/ int navigate(wchar* bstrURL, out wchar* pbstrRetVal);
  // method navigateFrame
  /*[id(0x00000002)]*/ int navigateFrame(wchar* bstrURL, wchar* bstrTargetFrame, out wchar* pbstrRetVal);
  /*[id(0x00000003)]*/ int navigateNoSite(wchar* bstrURL, wchar* bstrTargetFrame, uint dwhwnd, IUnknown pwb);
}

// IAnchorClick Interface
interface IAnchorClick : IDispatch {
  mixin(uuid("13d5413b-33b9-11d2-95a7-00c04f8ecb02"));
  // static DWINGUID IID = { 0x13d5413b, 0x33b9, 0x11d2, 0x95, 0xa7, 0x00, 0xc0, 0x4f, 0x8e, 0xcb, 0x02 };
  // ProcOnClick navigate
  /*[id(0x00000001)]*/ int ProcOnClick();
}

interface ILayoutRect : IDispatch {
  mixin(uuid("3050f665-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f665, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int set_nextRect(wchar* pbstrElementId);
  /*[id(0x00000001)]*/ int get_nextRect(out wchar* pbstrElementId);
  /*[id(0x00000002)]*/ int set_contentSrc(DWINVARIANT pvarContentSrc);
  /*[id(0x00000002)]*/ int get_contentSrc(out DWINVARIANT pvarContentSrc);
  /*[id(0x00000003)]*/ int set_honorPageBreaks(short p);
  /*[id(0x00000003)]*/ int get_honorPageBreaks(out short p);
  /*[id(0x00000004)]*/ int set_honorPageRules(short p);
  /*[id(0x00000004)]*/ int get_honorPageRules(out short p);
  /*[id(0x00000005)]*/ int set_nextRectElement(IDispatch ppElem);
  /*[id(0x00000005)]*/ int get_nextRectElement(out IDispatch ppElem);
  /*[id(0x00000006)]*/ int get_contentDocument(out IDispatch pDoc);
}

interface LayoutRectEvents : IDispatch {
  mixin(uuid("3050f674-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f674, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /+/*[id(0x00000001)]*/ void onpage();+/
  /+/*[id(0x00000002)]*/ void onlayoutcomplete();+/
}

interface IDeviceRect : IDispatch {
  mixin(uuid("3050f6d5-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f6d5, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
}

interface IScrollBar : IDispatch {
  mixin(uuid("3050f689-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f689, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int set_min(int p);
  /*[id(0x00000001)]*/ int get_min(out int p);
  /*[id(0x00000002)]*/ int set_max(int p);
  /*[id(0x00000002)]*/ int get_max(out int p);
  /*[id(0x00000003)]*/ int set_position(int p);
  /*[id(0x00000003)]*/ int get_position(out int p);
  /*[id(0x00000004)]*/ int set_unit(int p);
  /*[id(0x00000004)]*/ int get_unit(out int p);
  /*[id(0x00000005)]*/ int set_block(int p);
  /*[id(0x00000005)]*/ int get_block(out int p);
  /*[id(0x00000006)]*/ int set_orientation(wchar* p);
  /*[id(0x00000006)]*/ int get_orientation(out wchar* p);
  /*[id(0x00000007)]*/ int set_visibleUnits(int p);
  /*[id(0x00000007)]*/ int get_visibleUnits(out int p);
}

interface ISpinButton : IDispatch {
  mixin(uuid("3050f68b-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f68b, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
}

interface ISliderBar : IDispatch {
  mixin(uuid("3050f68d-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f68d, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int set_min(int p);
  /*[id(0x00000001)]*/ int get_min(out int p);
  /*[id(0x00000002)]*/ int set_max(int p);
  /*[id(0x00000002)]*/ int get_max(out int p);
  /*[id(0x00000003)]*/ int set_position(int p);
  /*[id(0x00000003)]*/ int get_position(out int p);
  /*[id(0x00000004)]*/ int set_unit(int p);
  /*[id(0x00000004)]*/ int get_unit(out int p);
  /*[id(0x00000005)]*/ int set_block(int p);
  /*[id(0x00000005)]*/ int get_block(out int p);
  /*[id(0x00000006)]*/ int set_orientation(wchar* p);
  /*[id(0x00000006)]*/ int get_orientation(out wchar* p);
}

interface IUtilityButton : IDispatch {
  mixin(uuid("3050f6af-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f6af, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
}

interface ITemplatePrinter2 : ITemplatePrinter {
  mixin(uuid("3050f83f-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f83f, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000025)]*/ int set_selectionEnabled(short p);
  /*[id(0x00000025)]*/ int get_selectionEnabled(out short p);
  /*[id(0x00000026)]*/ int set_frameActiveEnabled(short p);
  /*[id(0x00000026)]*/ int get_frameActiveEnabled(out short p);
  /*[id(0x00000027)]*/ int set_orientation(wchar* p);
  /*[id(0x00000027)]*/ int get_orientation(out wchar* p);
  /*[id(0x00000028)]*/ int set_usePrinterCopyCollate(short p);
  /*[id(0x00000028)]*/ int get_usePrinterCopyCollate(out short p);
  /*[id(0x00000029)]*/ int deviceSupports(wchar* bstrProperty, out DWINVARIANT pvar);
}

interface ITemplatePrinter : IDispatch {
  mixin(uuid("3050f6b4-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f6b4, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int startDoc(wchar* bstrTitle, out short p);
  /*[id(0x00000002)]*/ int stopDoc();
  /*[id(0x00000003)]*/ int printBlankPage();
  /*[id(0x00000004)]*/ int printPage(IDispatch pElemDisp);
  /*[id(0x00000005)]*/ int ensurePrintDialogDefaults(out short p);
  /*[id(0x00000006)]*/ int showPrintDialog(out short p);
  /*[id(0x00000007)]*/ int showPageSetupDialog(out short p);
  /*[id(0x00000008)]*/ int printNonNative(IUnknown pMarkup, out short p);
  /*[id(0x00000009)]*/ int printNonNativeFrames(IUnknown pMarkup, short fActiveFrame);
  /*[id(0x0000000A)]*/ int set_framesetDocument(short p);
  /*[id(0x0000000A)]*/ int get_framesetDocument(out short p);
  /*[id(0x0000000B)]*/ int set_frameActive(short p);
  /*[id(0x0000000B)]*/ int get_frameActive(out short p);
  /*[id(0x0000000C)]*/ int set_frameAsShown(short p);
  /*[id(0x0000000C)]*/ int get_frameAsShown(out short p);
  /*[id(0x0000000D)]*/ int set_selection(short p);
  /*[id(0x0000000D)]*/ int get_selection(out short p);
  /*[id(0x0000000E)]*/ int set_selectedPages(short p);
  /*[id(0x0000000E)]*/ int get_selectedPages(out short p);
  /*[id(0x0000000F)]*/ int set_currentPage(short p);
  /*[id(0x0000000F)]*/ int get_currentPage(out short p);
  /*[id(0x00000010)]*/ int set_currentPageAvail(short p);
  /*[id(0x00000010)]*/ int get_currentPageAvail(out short p);
  /*[id(0x00000011)]*/ int set_collate(short p);
  /*[id(0x00000011)]*/ int get_collate(out short p);
  /*[id(0x00000012)]*/ int get_duplex(out short p);
  /*[id(0x00000013)]*/ int set_copies(ushort p);
  /*[id(0x00000013)]*/ int get_copies(out ushort p);
  /*[id(0x00000014)]*/ int set_pageFrom(ushort p);
  /*[id(0x00000014)]*/ int get_pageFrom(out ushort p);
  /*[id(0x00000015)]*/ int set_pageTo(ushort p);
  /*[id(0x00000015)]*/ int get_pageTo(out ushort p);
  /*[id(0x00000016)]*/ int set_tableOfLinks(short p);
  /*[id(0x00000016)]*/ int get_tableOfLinks(out short p);
  /*[id(0x00000017)]*/ int set_allLinkedDocuments(short p);
  /*[id(0x00000017)]*/ int get_allLinkedDocuments(out short p);
  /*[id(0x00000018)]*/ int set_header(wchar* bstrHeader);
  /*[id(0x00000018)]*/ int get_header(out wchar* bstrHeader);
  /*[id(0x00000019)]*/ int set_footer(wchar* bstrFooter);
  /*[id(0x00000019)]*/ int get_footer(out wchar* bstrFooter);
  /*[id(0x0000001A)]*/ int set_marginLeft(int p);
  /*[id(0x0000001A)]*/ int get_marginLeft(out int p);
  /*[id(0x0000001B)]*/ int set_marginRight(int p);
  /*[id(0x0000001B)]*/ int get_marginRight(out int p);
  /*[id(0x0000001C)]*/ int set_marginTop(int p);
  /*[id(0x0000001C)]*/ int get_marginTop(out int p);
  /*[id(0x0000001D)]*/ int set_marginBottom(int p);
  /*[id(0x0000001D)]*/ int get_marginBottom(out int p);
  /*[id(0x0000001E)]*/ int get_pageWidth(out int p);
  /*[id(0x0000001F)]*/ int get_pageHeight(out int p);
  /*[id(0x00000020)]*/ int get_unprintableLeft(out int p);
  /*[id(0x00000021)]*/ int get_unprintableTop(out int p);
  /*[id(0x00000022)]*/ int get_unprintableRight(out int p);
  /*[id(0x00000023)]*/ int get_unprintableBottom(out int p);
  /*[id(0x00000024)]*/ int updatePageStatus(int* p);
}

interface IHeaderFooter : IDispatch {
  mixin(uuid("3050f6ce-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID IID = { 0x3050f6ce, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  /*[id(0x00000001)]*/ int get_htmlHead(out wchar* p);
  /*[id(0x00000002)]*/ int get_htmlFoot(out wchar* p);
  /*[id(0x00000003)]*/ int set_textHead(wchar* p);
  /*[id(0x00000003)]*/ int get_textHead(out wchar* p);
  /*[id(0x00000004)]*/ int set_textFoot(wchar* p);
  /*[id(0x00000004)]*/ int get_textFoot(out wchar* p);
  /*[id(0x00000005)]*/ int set_page(uint p);
  /*[id(0x00000005)]*/ int get_page(out uint p);
  /*[id(0x00000006)]*/ int set_pageTotal(uint p);
  /*[id(0x00000006)]*/ int get_pageTotal(out uint p);
  /*[id(0x00000007)]*/ int set_URL(wchar* p);
  /*[id(0x00000007)]*/ int get_URL(out wchar* p);
  /*[id(0x00000008)]*/ int set_title(wchar* p);
  /*[id(0x00000008)]*/ int get_title(out wchar* p);
  /*[id(0x00000009)]*/ int set_dateShort(wchar* p);
  /*[id(0x00000009)]*/ int get_dateShort(out wchar* p);
  /*[id(0x0000000A)]*/ int set_dateLong(wchar* p);
  /*[id(0x0000000A)]*/ int get_dateLong(out wchar* p);
  /*[id(0x0000000B)]*/ int set_timeShort(wchar* p);
  /*[id(0x0000000B)]*/ int get_timeShort(out wchar* p);
  /*[id(0x0000000C)]*/ int set_timeLong(wchar* p);
  /*[id(0x0000000C)]*/ int get_timeLong(out wchar* p);
}

// CoClasses

// PeerFactory Class
abstract class PeerFactory {
  mixin(uuid("3050f4cf-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f4cf, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IPeerFactory);
}

// ClientCaps Class
abstract class ClientCaps {
  mixin(uuid("7e8bc44e-aeff-11d1-89c2-00c04fb6bfc4"));
  // static DWINGUID CLSID = { 0x7e8bc44e, 0xaeff, 0x11d1, 0x89, 0xc2, 0x00, 0xc0, 0x4f, 0xb6, 0xbf, 0xc4 };
  mixin Interfaces!(IClientCaps);
}

abstract class IntelliForms {
  mixin(uuid("613ab92e-16bf-11d2-bca5-00c04fd929db"));
  // static DWINGUID CLSID = { 0x613ab92e, 0x16bf, 0x11d2, 0xbc, 0xa5, 0x00, 0xc0, 0x4f, 0xd9, 0x29, 0xdb };
  mixin Interfaces!(IIntelliForms);
}

abstract class HomePage {
  mixin(uuid("766bf2ae-d650-11d1-9811-00c04fc31d2e"));
  // static DWINGUID CLSID = { 0x766bf2ae, 0xd650, 0x11d1, 0x98, 0x11, 0x00, 0xc0, 0x4f, 0xc3, 0x1d, 0x2e };
  mixin Interfaces!(IHomePage);
}

abstract class CPersistUserData {
  mixin(uuid("3050f48e-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f48e, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IHTMLUserDataOM);
}

abstract class CPersistDataPeer {
  mixin(uuid("3050f487-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f487, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IHTMLPersistDataOM, IHTMLPersistData);
}

abstract class CPersistShortcut {
  mixin(uuid("3050f4c6-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f4c6, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IHTMLPersistDataOM, IHTMLPersistData);
}

abstract class CPersistHistory {
  mixin(uuid("3050f4c8-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f4c8, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IHTMLPersistDataOM, IHTMLPersistData);
}

abstract class CPersistSnapshot {
  mixin(uuid("3050f4c9-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f4c9, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IHTMLPersistDataOM, IHTMLPersistData);
}

abstract class CDownloadBehavior {
  mixin(uuid("3050f5be-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f5be, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IDownloadBehavior);
}

abstract class CHtmlArea {
  mixin(uuid("3050f64f-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f64f, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IHtmlArea);
}

abstract class CIESelectElement {
  mixin(uuid("3050f688-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f688, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IHTMLSelectElement3);
}

abstract class CIEOptionElement {
  mixin(uuid("3050f698-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f698, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IHTMLOptionElement2);
}

abstract class CCombobox {
  mixin(uuid("3050f678-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f678, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(ICombobox);
}

abstract class CCheckBox {
  mixin(uuid("3050f686-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f686, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(ICheckBox);
}

abstract class CRadioButton {
  mixin(uuid("3050f69c-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f69c, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IRadioButton);
}

// Web Folders Class
abstract class wfolders {
  mixin(uuid("bae31f9a-1b81-11d2-a97a-00c04f8ecb02"));
  // static DWINGUID CLSID = { 0xbae31f9a, 0x1b81, 0x11d2, 0xa9, 0x7a, 0x00, 0xc0, 0x4f, 0x8e, 0xcb, 0x02 };
  mixin Interfaces!(Iwfolders);
}

// AnchorClick Class
abstract class AnchorClick {
  mixin(uuid("13d5413c-33b9-11d2-95a7-00c04f8ecb02"));
  // static DWINGUID CLSID = { 0x13d5413c, 0x33b9, 0x11d2, 0x95, 0xa7, 0x00, 0xc0, 0x4f, 0x8e, 0xcb, 0x02 };
  mixin Interfaces!(IAnchorClick);
}

abstract class CLayoutRect {
  mixin(uuid("3050f664-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f664, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(ILayoutRect);
}

abstract class CDeviceRect {
  mixin(uuid("3050f6d4-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f6d4, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IDeviceRect);
}

abstract class CScrollBar {
  mixin(uuid("3050f68a-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f68a, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IScrollBar);
}

abstract class CSpinButton {
  mixin(uuid("3050f68c-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f68c, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(ISpinButton);
}

abstract class CSliderBar {
  mixin(uuid("3050f68e-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f68e, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(ISliderBar);
}

abstract class CUtilityButton {
  mixin(uuid("3050f6b0-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f6b0, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IUtilityButton);
}

abstract class CTemplatePrinter {
  mixin(uuid("3050f6b3-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f6b3, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(ITemplatePrinter2);
}

abstract class CHeaderFooter {
  mixin(uuid("3050f6cd-98b5-11cf-bb82-00aa00bdce0b"));
  // static DWINGUID CLSID = { 0x3050f6cd, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b };
  mixin Interfaces!(IHeaderFooter);
}
