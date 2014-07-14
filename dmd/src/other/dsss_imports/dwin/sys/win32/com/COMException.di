module dwin.sys.win32.com.COMException;

private import dwin.sys.win32.com.Util: SUCCEEDED, FAILED;
private import dwin.sys.win32.UserGdi : FormatMessage;
private import dwin.core.Exception;
    
private import tango.sys.win32.Types : 
    FORMAT_MESSAGE_FROM_SYSTEM, FORMAT_MESSAGE_IGNORE_INSERTS, 
    E_NOTIMPL, E_NOINTERFACE, E_POINTER, E_ACCESSDENIED, E_OUTOFMEMORY, E_INVALIDARG;
private import tango.core.Exception : OutOfMemoryException;
    
private static import tango.text.convert.Utf;
private static import tango.text.convert.Format;    

alias char[] string;

class COMException : Exception {

  int errorCode_;

  /**
   * Initializes a new instance with a specified error code.
   * Params: errorCode = The error code (HRESULT) value associated with this exception.
   */
  this(int errorCode) {
    super(getErrorMessage(errorCode));
    errorCode_ = errorCode;
  }

  /**
   * Initializes a new instance with a specified message and error code.
   * Params:
   *   message = The error _message that explains this exception.
   *   errorCode = The error code (HRESULT) value associated with this exception.
   */
  this(string message, int errorCode) {
    super(message);
    errorCode_ = errorCode;
  }

  /**
   * Gets the HRESULT of the error.
   * Returns: The HRESULT of the error.
   */
  int errorCode() {
    return errorCode_;
  }

  private static string getErrorMessage(int errorCode) {
    wchar[256] buffer;
    uint result = FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS, null, errorCode, 0, buffer.ptr, buffer.length + 1, null);
    if (result != 0) {
      string s = tango.text.convert.Utf.toString(buffer[0 .. result]);

      // Remove trailing characters
      while (result > 0) {
        char c = s[result - 1];
        if (c > ' ' && c != '.')
          break;
        result--;
      }

      //return format("%s. (Exception from HRESULT: 0x%08X)", s[0 .. result], cast(uint)errorCode);
      return tango.text.convert.Format.Format("{0}. (Exception from HRESULT: 0x{1:x8})", s[0 .. result], cast(uint)errorCode);
    }

    //return format("Unspecified error (0x%08X)", cast(uint)errorCode);
    return tango.text.convert.Format.Format("Unspecified error (0x{0:x8})", cast(uint)errorCode);
  }

  // added
  public this(char[] message) {
    super(message);
  }    
  
}
//

public class IEException : COMException {

    this(char[] msg)
    {
    super(msg);
    }

}

Exception exceptionForHR(int errorCode) {
  switch (errorCode) {
    case E_NOTIMPL:
      return new NotImplementedException;
    case E_NOINTERFACE:
      return new InvalidCastException;
    case E_POINTER:
      return new NullReferenceException;
    case E_ACCESSDENIED:
      return new UnauthorizedAccessException;
    case E_OUTOFMEMORY:
      return new OutOfMemoryException("Out of Memory", __LINE__);
    case E_INVALIDARG:
      return new ArgumentException;
    default:
  }
  return new COMException(errorCode);
}

void throwExceptionForHR(int errorCode)
in {
  assert(FAILED(errorCode));
}
body {
  if (FAILED(errorCode))
    throw exceptionForHR(errorCode);
}


version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
