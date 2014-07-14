// Microsoft Multicast Address Allocation Client COM Wrapper 1.0 Type Library
// Version 1.0

/*[uuid("64217cc0-a285-11d1-8697-006008b0e5d2")]*/
module dwin.sys.win32.com.tlb.more.mdhcp;
//module dwin.sys.win32.com.tlb.more.mcast;

private import dwin.sys.win32.com.tlb.stdole2;
private import dwin.sys.win32.com.Core;

// Interfaces

// IMcastScope Interface
interface IMcastScope : IDispatch {
  mixin(uuid("df0daef4-a289-11d1-8697-006008b0e5d2"));
  // static DWINGUID IID = { 0xdf0daef4, 0xa289, 0x11d1, 0x86, 0x97, 0x00, 0x60, 0x08, 0xb0, 0xe5, 0xd2 };
  // Get the scope ID for this scope.
  /*[id(0x00000001)]*/ int get_ScopeID(out int pID);
  // Get the server ID for this scope.
  /*[id(0x00000002)]*/ int get_ServerID(out int pID);
  // Get the interface ID for this scope.
  /*[id(0x00000003)]*/ int get_InterfaceID(out int pID);
  // Get a textual description of this scope.
  /*[id(0x00000004)]*/ int get_ScopeDescription(out wchar* ppDescription);
  // Get the TTL for leases in this scope.
  /*[id(0x00000005)]*/ int get_TTL(out int pTTL);
}

// TAPI 3.0 IEnumBstr interface
interface IEnumBstr : IUnknown {
  mixin(uuid("35372049-0bc6-11d2-a033-00c04fb6809f"));
  // static DWINGUID IID = { 0x35372049, 0x0bc6, 0x11d2, 0xa0, 0x33, 0x00, 0xc0, 0x4f, 0xb6, 0x80, 0x9f };
  /*[id(0x60010000)]*/ int Next(uint celt, out wchar* ppStrings, ref uint pceltFetched);
  /*[id(0x60010001)]*/ int Reset();
  /*[id(0x60010002)]*/ int Skip(uint celt);
  /*[id(0x60010003)]*/ int Clone(out IEnumBstr ppEnum);
}

// IMcastLeaseInfo Interface
interface IMcastLeaseInfo : IDispatch {
  mixin(uuid("df0daefd-a289-11d1-8697-006008b0e5d2"));
  // static DWINGUID IID = { 0xdf0daefd, 0xa289, 0x11d1, 0x86, 0x97, 0x00, 0x60, 0x08, 0xb0, 0xe5, 0xd2 };
  // Get the request ID
  /*[id(0x00000001)]*/ int get_RequestID(out wchar* ppRequestID);
  // The start time of the lease.
  /*[id(0x00000002)]*/ int get_LeaseStartTime(out double pTime);
  // The start time of the lease.
  /*[id(0x00000002)]*/ int set_LeaseStartTime(double pTime);
  // The stop time of the lease.
  /*[id(0x00000003)]*/ int get_LeaseStopTime(out double pTime);
  // The stop time of the lease.
  /*[id(0x00000003)]*/ int set_LeaseStopTime(double pTime);
  // The number of addresses of the lease.
  /*[id(0x00000004)]*/ int get_AddressCount(out int pCount);
  // The ip address of server where the lease was requested/renewed.
  /*[id(0x00000005)]*/ int get_ServerAddress(out wchar* ppAddress);
  // The TTL of this lease assignment.
  /*[id(0x00000006)]*/ int get_TTL(out int pTTL);
  // Get a collection of the addresses for this lease.
  /*[id(0x00000007)]*/ int get_Addresses(out DWINVARIANT pVariant);
  // Get an enumeration of the addresses for this lease.
  /*[id(0x00000008)]*/ int EnumerateAddresses(out IEnumBstr ppEnumAddresses);
}

// IEnumMcastScope Interface
interface IEnumMcastScope : IUnknown {
  mixin(uuid("df0daf09-a289-11d1-8697-006008b0e5d2"));
  // static DWINGUID IID = { 0xdf0daf09, 0xa289, 0x11d1, 0x86, 0x97, 0x00, 0x60, 0x08, 0xb0, 0xe5, 0xd2 };
  /*[id(0x60010000)]*/ int Next(uint celt, out IMcastScope ppScopes, ref uint pceltFetched);
  /*[id(0x60010001)]*/ int Reset();
  /*[id(0x60010002)]*/ int Skip(uint celt);
  /*[id(0x60010003)]*/ int Clone(out IEnumMcastScope ppEnum);
}

// IMcastAddressAllocation Interface
interface IMcastAddressAllocation : IDispatch {
  mixin(uuid("df0daef1-a289-11d1-8697-006008b0e5d2"));
  // static DWINGUID IID = { 0xdf0daef1, 0xa289, 0x11d1, 0x86, 0x97, 0x00, 0x60, 0x08, 0xb0, 0xe5, 0xd2 };
  // Get a collection of available scopes.
  /*[id(0x00000001)]*/ int get_Scopes(out DWINVARIANT pVariant);
  // Get an enumeration of available scopes.
  /*[id(0x00000002)]*/ int EnumerateScopes(out IEnumMcastScope ppEnumMcastScope);
  // Request a lease for one or more multicast addresses.
  /*[id(0x00000003)]*/ int RequestAddress(IMcastScope pScope, double LeaseStartTime, double LeaseStopTime, int NumAddresses, out IMcastLeaseInfo ppLeaseResponse);
  // Renew a lease.
  /*[id(0x00000004)]*/ int RenewAddress(int lReserved, IMcastLeaseInfo pRenewRequest, out IMcastLeaseInfo ppRenewResponse);
  // Release (unreserve) a lease.
  /*[id(0x00000005)]*/ int ReleaseAddress(IMcastLeaseInfo pReleaseRequest);
  // Create a lease info object -- C++ version.
  /*[id(0x00000006)]*/ int CreateLeaseInfo(double LeaseStartTime, double LeaseStopTime, uint dwNumAddresses, wchar** ppAddresses, wchar* pRequestID, wchar* pServerAddress, out IMcastLeaseInfo ppReleaseRequest);
  // Create a lease info object -- Automation version.
  /*[id(0x00000007)]*/ int CreateLeaseInfoFromVariant(double LeaseStartTime, double LeaseStopTime, DWINVARIANT vAddresses, wchar* pRequestID, wchar* pServerAddress, out IMcastLeaseInfo ppReleaseRequest);
}

// CoClasses

// Multicast Address Allocation Class
abstract class McastAddressAllocation {
  mixin(uuid("df0daef2-a289-11d1-8697-006008b0e5d2"));
  // static DWINGUID CLSID = { 0xdf0daef2, 0xa289, 0x11d1, 0x86, 0x97, 0x00, 0x60, 0x08, 0xb0, 0xe5, 0xd2 };
  mixin Interfaces!(IMcastAddressAllocation);
}
