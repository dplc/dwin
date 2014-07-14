module dwin.sys.win32.com.Util;

/**
 * Determines whether the operation was successful.
 */
bool SUCCEEDED(int hr) {
  return hr >= 0;
}

/**
 * Determines whether the operation was unsuccessful.
 */
bool FAILED(int hr) {
  return hr < 0;
}

void** outval(T)(out T ppv)
in {
  assert(&ppv != null);
}
body {
  return cast(void**)&ppv;
}

template tMAKE_SCODE(uint sev, uint fac, uint code) {
  const tMAKE_SCODE = ((sev << 31) | (fac << 16) | code);
}