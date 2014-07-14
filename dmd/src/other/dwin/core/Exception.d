// D import file generated from 'core\Exception.d'
module dwin.core.Exception;

private import tango.core.Exception;

public class FormatException : TextException {

    this(char[] msg)
{
super(msg);
}

}

class NotImplementedException : Exception {

  this(char[] message = "The operation is not implemented.") {
    super(message);
  }
}

class InvalidCastException : Exception {

  this(char[] message = "Specified cast is not valid.") {
    super(message);
  }

}

public class InvalidOperationException : TextException {
    public this(char[] msg) 
    {
        super(msg);
    }  
    public this() 
    {
        super("");
    }      
}
class UnauthorizedAccessException : Exception {

  this(char[] message = "Access is denied.") {
    super(message);
  }

}


class NullReferenceException : Exception {

  this(char[] message = "Object reference not set to an instance of an object.") {
    super(message);
  }

}
public class ArgumentOutOfRangeException : IllegalArgumentException {
    public this(char[] msg) 
    {
        super(msg);
    }
}

class ArgumentException : Exception {

  private char[] paramName_;

  this(char[] message = "Value does not fall within the expected range.") {
    super(message);
  }

  this(char[] message, char[] paramName) {
    super(message);
    paramName_ = paramName;
  }

  final char[] paramName() {
    return paramName_;
  }

}

class ArgumentNullException : ArgumentException {

  this() {
    super("Specified argument was out of the range of valid values.");
  }

  this(char[] paramName, char[] message = "Specified argument was out of the range of valid values.") {
    super(message, paramName);
  }

}



//movied into COMException module
/+

//juno.com.core
/**
 * The exception thrown when an unrecognized HRESULT is returned from a COM operation.
 */
public class COMException : Exception {

  private int errorCode_;

  /**
   * Initializes a new instance with a specified error code.
   * Params: errorCode = The error code (HRESULT) value associated with this exception.
   */
  
  //Tango not support int type msg
  /*
  public this(int errorCode = E_FAIL) {
    errorCode_ = errorCode;
    //super(getErrorMessage(errorCode));
  }
  */

  /**
   * Initializes a new instance with a specified message and reference to the inner exception that caused this exception.
   * Params:
   *   message = The error _message that explains this exception.
   *   cause = The exception that caused this exception.
   */
  
  //public this(char[] message, Exception cause = null) {
  //  super(message, cause);
  //}
  public this(char[] message) {
    super(message);
  }  

  /**
   * Gets the HRESULT of the error.
   * Returns: The HRESULT of the error.
   */
  public int errorCode() {
    return errorCode_;
  }

  /*
  private static char[] getErrorMessage(int error) {
    wchar[256] buffer;
    size_t r = FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS, null, error, LOCALE_USER_DEFAULT, buffer.ptr, buffer.length + 1, null);
    if (r != 0) {
      char[] s = toUtf8(buffer.ptr, 0, r);
      while (r > 0) {
        char ch = s[r - 1];
        if (ch > ' ' && ch != '.')
          break;
        r--;
      }
      return format("{0}. (Exception from HRESULT: 0x{1:X8})", s[0 .. r], error);
    }
    return format("Unspecified error (0x{0:X8})", error);
  }
  */

}
+/

public class Win32Exception : Exception {
    public this(char[] msg) 
    {
        super(msg);
    }
}
class MissingMemberException : Exception {

  this(char[] message = "Member not found.") {
    super(message);
  }

  this(char[] className, char[] memberName) {
    super("Member '" ~ className ~ "." ~ memberName ~ "' not found.");
  }

}