// mqsnap 1.0 Type Library
// Version 1.0

/*[uuid("74e5636d-b98c-11d1-9b9b-00e02c064c39")]*/
module dwin.sys.win32.com.tlb.more.mqsnap;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// CoClasses

// MSMQSnapin Class
abstract class MSMQSnapin {
  mixin(uuid("74e5637a-b98c-11d1-9b9b-00e02c064c39"));
  // static DWINGUID CLSID = { 0x74e5637a, 0xb98c, 0x11d1, 0x9b, 0x9b, 0x00, 0xe0, 0x2c, 0x06, 0x4c, 0x39 };
  mixin Interfaces!(IUnknown);
}

// MSMQSnapin Class About
abstract class MSMQSnapinAbout {
  mixin(uuid("74e5637b-b98c-11d1-9b9b-00e02c064c39"));
  // static DWINGUID CLSID = { 0x74e5637b, 0xb98c, 0x11d1, 0x9b, 0x9b, 0x00, 0xe0, 0x2c, 0x06, 0x4c, 0x39 };
  mixin Interfaces!(IUnknown);
}

// MsmqQueueExt Class
abstract class MsmqQueueExt {
  mixin(uuid("e62f8206-b71c-11d1-808d-00a024c48131"));
  // static DWINGUID CLSID = { 0xe62f8206, 0xb71c, 0x11d1, 0x80, 0x8d, 0x00, 0xa0, 0x24, 0xc4, 0x81, 0x31 };
  mixin Interfaces!(IUnknown);
}

// MsmqPrivQ Class
abstract class MsmqPrivQ {
  mixin(uuid("4265a060-4e12-11d2-8292-006094eb6406"));
  // static DWINGUID CLSID = { 0x4265a060, 0x4e12, 0x11d2, 0x82, 0x92, 0x00, 0x60, 0x94, 0xeb, 0x64, 0x06 };
  mixin Interfaces!(IUnknown);
}

// MsmqCompExt Class
abstract class MsmqCompExt {
  mixin(uuid("e62f8208-b71c-11d1-808d-00a024c48131"));
  // static DWINGUID CLSID = { 0xe62f8208, 0xb71c, 0x11d1, 0x80, 0x8d, 0x00, 0xa0, 0x24, 0xc4, 0x81, 0x31 };
  mixin Interfaces!(IUnknown);
}

// EnterpriseDataObject Class
abstract class EnterpriseDataObject {
  mixin(uuid("2e4b37ab-cc8b-11d1-9c85-006008764d0e"));
  // static DWINGUID CLSID = { 0x2e4b37ab, 0xcc8b, 0x11d1, 0x9c, 0x85, 0x00, 0x60, 0x08, 0x76, 0x4d, 0x0e };
  mixin Interfaces!(IUnknown);
}

// LinkDataObject Class
abstract class LinkDataObject {
  mixin(uuid("87b31390-d46d-11d1-8091-00a024c48131"));
  // static DWINGUID CLSID = { 0x87b31390, 0xd46d, 0x11d1, 0x80, 0x91, 0x00, 0xa0, 0x24, 0xc4, 0x81, 0x31 };
  mixin Interfaces!(IUnknown);
}

// UserCertificate Class
abstract class UserCertificate {
  mixin(uuid("8c5b1b50-d46e-11d1-8091-00a024c48131"));
  // static DWINGUID CLSID = { 0x8c5b1b50, 0xd46e, 0x11d1, 0x80, 0x91, 0x00, 0xa0, 0x24, 0xc4, 0x81, 0x31 };
  mixin Interfaces!(IUnknown);
}

// MigratedUserCertificate Class
abstract class MigratedUserCertificate {
  mixin(uuid("fc5bf656-0b7f-11d3-883f-006094eb6406"));
  // static DWINGUID CLSID = { 0xfc5bf656, 0x0b7f, 0x11d3, 0x88, 0x3f, 0x00, 0x60, 0x94, 0xeb, 0x64, 0x06 };
  mixin Interfaces!(IUnknown);
}

// ForeignSiteData Class
abstract class ForeignSiteData {
  mixin(uuid("bc019ba0-d46d-11d1-8091-00a024c48131"));
  // static DWINGUID CLSID = { 0xbc019ba0, 0xd46d, 0x11d1, 0x80, 0x91, 0x00, 0xa0, 0x24, 0xc4, 0x81, 0x31 };
  mixin Interfaces!(IUnknown);
}

// AliasQObject Class
abstract class AliasQObject {
  mixin(uuid("9e4ab987-3cca-4de0-ae36-3d163df44d36"));
  // static DWINGUID CLSID = { 0x9e4ab987, 0x3cca, 0x4de0, 0xae, 0x36, 0x3d, 0x16, 0x3d, 0xf4, 0x4d, 0x36 };
  mixin Interfaces!(IUnknown);
}
