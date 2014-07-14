/*
 * Copyright (c) 2007 John Chapman
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

//modified by yidabu for use with Tango
module dwin.sys.win32.com.Client;

private import  dwin.sys.win32.com.Core,
                dwin.sys.win32.CodePage,
                dwin.sys.win32.Registry,
                dwin.text.convert.Utf,
                dwin.core.Exception;

private import  dwin.sys.win32.headers.objidl; //IConnectionPointContainer
private import  dwin.sys.win32.headers.winerror; //DISP_E_UNKNOWNINTERFACE
private import  dwin.sys.win32.headers.oleauto; //LoadTypeLib

private static import dwin.sys.win32.CodePage;
    alias dwin.sys.win32.CodePage.toString16z toUtf16z;

private import tango.core.Traits : ParameterTupleOf;
    //alias Traits.ParameterTupleOf ParameterTypeTuple; //recurse alias


private import tango.text.Ascii : toLower;
private import tango.stdc.string : memcpy;    
private import tango.sys.win32.UserGdi;

private import bstr = dwin.sys.win32.com.Bstr;
private import dwin.core.Exception;
    
alias char[] string;
    

/*
public enum DispatchFlags {
  InvokeMethod = DISPATCH_METHOD,
  GetProperty = DISPATCH_PROPERTYGET,
  PutProperty = DISPATCH_PROPERTYPUT
}
*/
/*
private DWINVARIANT invokeMemberById(int dispId, DispatchFlags flags, IDispatch target, ...) {

  DWINVARIANT[] argsToVariants(TypeInfo[] args, va_list argptr) {
    DWINVARIANT[] list;

    foreach (arg; args) {
      if (arg == typeid(bool))
        list ~= DWINVARIANT(va_arg!(bool)(argptr));
      else if (arg == typeid(ubyte))
        list ~= DWINVARIANT(va_arg!(ubyte)(argptr));
      else if (arg == typeid(byte))
        list ~= DWINVARIANT(va_arg!(byte)(argptr));
      else if (arg == typeid(ushort))
        list ~= DWINVARIANT(va_arg!(ushort)(argptr));
      else if (arg == typeid(short))
        list ~= DWINVARIANT(va_arg!(short)(argptr));
      else if (arg == typeid(uint))
        list ~= DWINVARIANT(va_arg!(uint)(argptr));
      else if (arg == typeid(int))
        list ~= DWINVARIANT(va_arg!(int)(argptr));
      else if (arg == typeid(ulong))
        list ~= DWINVARIANT(va_arg!(ulong)(argptr));
      else if (arg == typeid(long))
        list ~= DWINVARIANT(va_arg!(long)(argptr));
      else if (arg == typeid(float))
        list ~= DWINVARIANT(va_arg!(float)(argptr));
      else if (arg == typeid(double))
        list ~= DWINVARIANT(va_arg!(double)(argptr));
      else if (arg == typeid(char[]))
        list ~= DWINVARIANT(va_arg!(char[])(argptr));
      else if (arg == typeid(IDispatch))
        list ~= DWINVARIANT(va_arg!(IDispatch)(argptr));
      else if (arg == typeid(IUnknown))
        list ~= DWINVARIANT(va_arg!(IUnknown)(argptr));
      else if (arg == typeid(Object))
        list ~= DWINVARIANT(va_arg!(Object)(argptr));
      else if (arg == typeid(DWINVARIANT*)) {
        DWINVARIANT v;
        v.vt = cast(VARTYPE)(VT_BYREF | VT_VARIANT);
        v.pvarVal = va_arg!(DWINVARIANT*)(argptr);
        list ~= v;
      }
      else if (arg == typeid(SAFEARRAY*)) {
        DWINVARIANT v;
        v.vt = cast(VARTYPE)(VT_ARRAY | VT_VARIANT);
        v.parray = va_arg!(SAFEARRAY*)(argptr);
        list ~= v;
      }
    }

    return list.reverse;
  }

  TypeInfo[] args = _arguments;
  va_list argptr = _argptr;

  if (args.length == 2) {
    if (args[0] == typeid(TypeInfo[]) && args[1] == typeid(va_list)) {
      args = va_arg!(TypeInfo[])(argptr);
      argptr = *cast(va_list*)(argptr);
    }
  }

  if ((flags & DispatchFlags.PutProperty) != 0 && args.length > 1) {
    DWINVARIANT var = invokeMemberById(dispId, DispatchFlags.GetProperty, target);
    if (auto indexer = var.pdispVal) {
      try {
        var = invokeMemberById(0, DispatchFlags.GetProperty, indexer, args[0 .. 1], argptr);
        if (auto value = var.pdispVal) {
          try {
            return invokeMemberById(0, DispatchFlags.PutProperty, value, args[1 .. $], argptr + args[0].tsize());
          }
          finally {
            tryRelease(value);
          }
        }
      }
      finally {
        tryRelease(indexer);
      }
    }
  }

  DISPPARAMS params;
  DWINVARIANT[] vargs = argsToVariants(args, argptr);

  if (vargs.length > 0) {
    params.rgvarg = vargs.ptr;
    params.cArgs = vargs.length;

    if ((flags & DispatchFlags.PutProperty) != 0) {
      int dispIdNamed = DISPID_PROPERTYPUT;
      params.rgdispidNamedArgs = &dispIdNamed;
      params.cNamedArgs = 1;
    }
  }

  DWINVARIANT result;
  EXCEPINFO excep;
  int hr = target.Invoke(dispId, DWINGUID.empty, LOCALE_USER_DEFAULT, cast(ushort)flags, &params, &result, &excep, null);

  if (params.cArgs > 0) {
    for (uint i = 0; i < params.cArgs; i++) {
      params.rgvarg[i].clear();
    }
  }

  return result;
}
*/

/*
public TResult invokeMember(TResult = DWINVARIANT)(char[] name, DispatchFlags flags, IDispatch target, ...) {
  if (target is null)
    throw new ArgumentNullException("target");

  TypeInfo[] args = _arguments;
  va_list argptr = _argptr;

  if (args.length == 2) {
    if (args[0] == typeid(TypeInfo[]) && args[1] == typeid(va_list)) {
      args = va_arg!(TypeInfo[])(argptr);
      argptr = *cast(va_list*)(argptr);
    }
  }

  int dispId = DISPID_UNKNOWN;
  wchar* bstrMemberName = bstr.fromString(name);
  int hr = target.GetIDsOfNames(DWINGUID.empty, &bstrMemberName, 1, LOCALE_USER_DEFAULT, &dispId);
  bstr.free(bstrMemberName);

  if (SUCCEEDED(hr) && dispId != DISPID_UNKNOWN) {
    DWINVARIANT result = invokeMemberById(dispId, flags, target, args, argptr);
    static if (is(TResult == DWINVARIANT))
      return result;
    else
      return com_cast!(TResult)(result);
  }

  char[] typeName;
  ITypeInfo typeInfo;

  if (SUCCEEDED(target.GetTypeInfo(0, LOCALE_USER_DEFAULT, typeInfo))) {
    wchar* bstrTypeName;
    typeInfo.GetDocumentation(-1, &bstrTypeName, null, null, null);
    typeName = bstr.toString(bstrTypeName);

    tryRelease(typeInfo);
  }

  //throw new MissingMemberException(typeName, name);
  throw new MissingMemberException(typeName ~ name);

}
*/


/**
 * Represents a late-bound COM object.
 *
 * Examples:
 * Automating CDOSYS:
 * ---
 * // Create an instance of the Message object
 * scope message = new DispatchObject("CDO.Message");
 *
 * // Build the mail message
 * message.set("Subject", "Hello, World!");
 * message.set("TextBody", "Just saying hello.");
 * message.set("From", "me@home.com"); // Replace 'me@home.com' with your email address
 * message.set("To", "world@large.com"); // Replace 'world@large.com' with the recipient's email address
 *
 * // Configure CDOSYS to send via a remote SMTP server
 * scope config = message.get("Configuration");
 * // Set the appropriate values
 * config.set("Fields", "http://schemas.microsoft.com/cdo/configuration/sendusing", 2); // cdoSendUsingPort = 2
 * config.set("Fields", "http://schemas.microsoft.com/cdo/configuration/smtpserverport", 25);
 * config.set("Fields", "http://schemas.microsoft.com/cdo/configuration/smtpserver", "mail.remote.com"); // Replace 'mail.remote.com' with your remote server's address
 * config.set("Fields", "http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", 1); // cdoBasic = 1
 * config.set("Fields", "http://schemas.microsoft.com/cdo/configuration/sendusername", "username"); // Replace 'username' with your account's user name
 * config.set("Fields", "http://schemas.microsoft.com/cdo/configuration/sendpassword", "password"); // Replace 'password' with your account's password
 *
 * scope fields = config.get("Fields");
 * fields.call("Update");
 *
 * message.call("Send");
 * ---
 * Automating Microsoft Office Word:
 * ---
 * void main() {
 *   scope word = new DispatchObject("Word.Application");
 *   word.set("Visible", true);
 *   scope document = word.get("Documents").call("Add");
 * }
 * ---
 * Automating Internet Explorer:
 * ---
 * abstract final class InternetExplorer {
 *
 *   static class Application : DispatchObject {
 *
 *     this() {
 *       super("InternetExplorer.Application");
 *     }
 *
 *     void visible(bool value) {
 *       set("Visible", value);
 *     }
 *
 *     bool visible() {
 *       return get!(bool)("Visible");
 *     }
 *
 *     void navigate(string url) {
 *       call("Navigate", url);
 *     }
 *
 *   }
 *
 * }
 *
 * void main() {
 *   scope ie = new InternetExplorer.Application;
 *   ie.visible = true;
 *   ie.navigate("www.google.com");
 * }
 * ---
 */
class DispatchObject {

  private IDispatch target_;
  private DWINVARIANT result_;

  this(DWINGUID clsid, ExecutionContext context = ExecutionContext.InProcessServer | ExecutionContext.LocalServer) {
    target_ = coCreate!(IDispatch)(clsid, context);
    if (target_ is null)
      throw new InvalidOperationException;
  }

  this(DWINGUID clsid, string server, ExecutionContext context = ExecutionContext.InProcessServer | ExecutionContext.RemoteServer) {
    target_ = coCreateEx!(IDispatch)(clsid, server, context);
    if (target_ is null)
      throw new InvalidOperationException;
  }

  /**
   */
  this(string progId, ExecutionContext context = ExecutionContext.InProcessServer | ExecutionContext.LocalServer) {
    target_ = coCreate!(IDispatch)(progId, context);
    if (target_ is null)
      throw new InvalidOperationException;
  }

  this(string progId, string server, ExecutionContext context = ExecutionContext.InProcessServer | ExecutionContext.RemoteServer) {
    target_ = coCreateEx!(IDispatch)(progId, server, context);
    if (target_ is null)
      throw new InvalidOperationException;
  }

  /**
   */
  this(IDispatch target) {
    // AddRef?
    target_ = target;
  }

  /**
   * ditto
   */
  this(DWINVARIANT target) {
    this(target.pdispVal);
  }

  private this(DWINVARIANT result, uint ignore) {
    this(com_cast!(IDispatch)(result));
    result_ = result;
  }

  ~this() {
    release();
  }

  /**
   */
  final void release() {
    result_.clear();

    if (target_ !is null) {
      tryRelease(target_);
      target_ = null;
    }
  }

  /**
   */
  R call(R = DispatchObject)(string name, ...) {
    static if (is(R == DispatchObject))
      return new DispatchObject(invokeMethod(target_, name, _arguments, _argptr), 0);
    else {
      R ret = invokeMethod!(R)(target_, name, _arguments, _argptr);
      result_ = ret;
      return ret;
    }
  }

  /**
   */
  /*
  R get(R = DispatchObject)(string name) {
    static if (is(R == DispatchObject))
      return new DispatchObject(getProperty(target_, name), 0);
    else {
      R ret = getProperty!(R)(target_, name);
      result_ = ret;
      return ret;
    }
  }
  */
  
  // how about more arguments ? January 10, 2011
  R get(R = DispatchObject)(string name, ...) {
    static if (is(R == DispatchObject))
      return new DispatchObject(getProperty(target_, name, _arguments, _argptr), 0);
    else {
      R ret = getProperty!(R)(target_, name, _arguments, _argptr);
      result_ = ret;
      return ret;
    }
  }    

  /**
   */
  void set(string name, ...) {
    setProperty(target_, name, _arguments, _argptr);
  }

  /**
   */
  final IDispatch target() {
    return target_;
  }

  final DWINVARIANT result() {
    return result_;
  }

}


/**
 * Example:
 * ---
 * abstract final class InternetExplorer {
 *
 *   static class Application : DispatchObject {
 *
 *     this() {
 *       super("InternetExplorer.Application");
 *     }
 *
 *     void visible(bool value) {
 *       set("Visible", value);
 *     }
 *
 *     bool visible() {
 *       return get!(bool)("Visible");
 *     }
 *
 *     void navigate(char[] url) {
 *       call("Navigate", url);
 *     }
 *
 *   }
 *
 * }
 *
 * void main() {
 *   scope ie = new InternetExplorer.Application;
 *   ie.visible = true;
 *   ie.navigate("www.google.com");
 * }
 * ---
 */

/+
public class DispatchObject {

  private IDispatch target_;

  /**
   * Params: progId = The identifier.
   */
  public this(char[] progId) {
    target_ = coCreate!(IDispatch)(progId, ExecutionContext.InProcessServer | ExecutionContext.LocalServer);
    if (target_ is null)
      throw new InvalidOperationException;
  }

  ~this() {
    release();
  }

  /**
   * Params: target = The object.
   */
  public this(IDispatch target) {
    target_ = target;
  }

  /**
   * Params: target = The object.
   */
  public this(DWINVARIANT target) {
    this(safe_com_cast!(IDispatch)(target));
  }

  /**
   * Releases the target.
   */
  public final void release() {
    if (target_ !is null) {
      tryRelease(target_);
      target_ = null;
    }
  }

  /**
   * Calls the method specified by name using the specified arguments.
   */
  public TResult call(TResult = DWINVARIANT)(char[] name, ...) {
    return invokeMember!(TResult)(name, DispatchFlags.InvokeMethod, target_, _arguments, _argptr);
  }

  /**
   * Calls the _get accessor specified by name using the specified arguments.
   */
  public TResult get(TResult = DWINVARIANT)(char[] name, ...) {
    return invokeMember!(TResult)(name, DispatchFlags.GetProperty, target_, _arguments, _argptr);
  }

  /**
   * Calls the _set accessor specified by name using the specified arguments.
   */
  public void set(char[] name, ...) {
    invokeMember(name, DispatchFlags.PutProperty, target_, _arguments, _argptr);
  }

  /**
   * Retrieves the _target.
   */
  public final IDispatch target() {
    return target_;
  }

}
+/


private struct MethodProxy {

  int delegate() method;
  VARTYPE returnType;
  VARTYPE[] paramTypes;

  static MethodProxy opCall(R, T...)(R delegate(T) method) {
    MethodProxy self;
    self = method;
    return self;
  }

  void opAssign(R, T...)(R delegate(T) dg) {
    //alias ParameterTypeTuple!(dg) params;
    alias ParameterTupleOf!(dg) params;

    method = cast(int delegate())dg;
    returnType = VariantType!(R);
    paramTypes.length = params.length;
    foreach (i, paramType; params) {
      paramTypes[i] = VariantType!(paramType);
    }
  }

  int invoke(DWINVARIANT*[] args, DWINVARIANT* result) {

    uint variantSize(VARTYPE vt) {
      switch (vt) {
        case VT_UI8, VT_I8, VT_CY:
          return long.sizeof / int.sizeof;
        case VT_R8, VT_DATE:
          return double.sizeof / int.sizeof;
        case VT_VARIANT:
          return (VARIANT.sizeof + 3) / int.sizeof;
        default:
      }

      return 1;
    }

    // Like DispCallFunc, but using delegates

    uint paramCount;
    for (int i = 0; i < paramTypes.length; i++) {
      paramCount += variantSize(paramTypes[i]);
    }

    auto argptr = cast(int*)HeapAlloc(GetProcessHeap(), 0, paramCount * int.sizeof);

    uint pos;
    for (int i = 0; i < paramTypes.length; i++) {
      DWINVARIANT* p = args[i];
      if (paramTypes[i] == VT_VARIANT)
        memcpy(&argptr[pos], p, variantSize(paramTypes[i]) * int.sizeof);
      else
        memcpy(&argptr[pos], &p.lVal, variantSize(paramTypes[i]) * int.sizeof);
      pos += variantSize(paramTypes[i]);
    }

    int ret = 0;

    switch (paramCount) {
      case 0: ret = method(); break;
      case 1: ret = (cast(int delegate(int))method)(argptr[0]); break;
      case 2: ret = (cast(int delegate(int, int))method)(argptr[0], argptr[1]); break;
      case 3: ret = (cast(int delegate(int, int, int))method)(argptr[0], argptr[1], argptr[2]); break;
      case 4: ret = (cast(int delegate(int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3]); break;
      case 5: ret = (cast(int delegate(int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4]); break;
      case 6: ret = (cast(int delegate(int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5]); break;
      case 7: ret = (cast(int delegate(int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6]); break;
      case 8: ret = (cast(int delegate(int, int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6], argptr[7]); break;
      case 9: ret = (cast(int delegate(int, int, int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6], argptr[7], argptr[8]); break;
      case 10: ret = (cast(int delegate(int, int, int, int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6], argptr[7], argptr[8], argptr[9]); break;
      case 11: ret = (cast(int delegate(int, int, int, int, int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6], argptr[7], argptr[8], argptr[9], argptr[10]); break;
      case 12: ret = (cast(int delegate(int, int, int, int, int, int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6], argptr[7], argptr[8], argptr[9], argptr[10], argptr[11]); break;
      case 13: ret = (cast(int delegate(int, int, int, int, int, int, int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6], argptr[7], argptr[8], argptr[9], argptr[10], argptr[11], argptr[12]); break;
      case 14: ret = (cast(int delegate(int, int, int, int, int, int, int, int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6], argptr[7], argptr[8], argptr[9], argptr[10], argptr[11], argptr[12], argptr[13]); break;
      case 15: ret = (cast(int delegate(int, int, int, int, int, int, int, int, int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6], argptr[7], argptr[8], argptr[9], argptr[10], argptr[11], argptr[12], argptr[13], argptr[14]); break;
      case 16: ret = (cast(int delegate(int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6], argptr[7], argptr[8], argptr[9], argptr[10], argptr[11], argptr[12], argptr[13], argptr[14], argptr[15]); break;
      case 17: ret = (cast(int delegate(int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6], argptr[7], argptr[8], argptr[9], argptr[10], argptr[11], argptr[12], argptr[13], argptr[14], argptr[15], argptr[16]); break;
      case 18: ret = (cast(int delegate(int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6], argptr[7], argptr[8], argptr[9], argptr[10], argptr[11], argptr[12], argptr[13], argptr[14], argptr[15], argptr[16], argptr[17]); break;
      case 19: ret = (cast(int delegate(int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6], argptr[7], argptr[8], argptr[9], argptr[10], argptr[11], argptr[12], argptr[13], argptr[14], argptr[15], argptr[16], argptr[17], argptr[18]); break;
      case 20: ret = (cast(int delegate(int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int))method)(argptr[0], argptr[1], argptr[2], argptr[3], argptr[4], argptr[5], argptr[6], argptr[7], argptr[8], argptr[9], argptr[10], argptr[11], argptr[12], argptr[13], argptr[14], argptr[15], argptr[16], argptr[17], argptr[18], argptr[19]); break;
      default:
        return DISP_E_BADPARAMCOUNT;
    }

    if (result !is null && returnType != VT_VOID) {
      result.vt = returnType;
      result.lVal = ret;
    }

    HeapFree(GetProcessHeap(), 0, argptr);
    return S_OK;
  }

}

public class EventCookie(T) {

  private IConnectionPoint cp_;
  private uint cookie_;

  public this(IUnknown source) {
    auto cpc = safe_com_cast!(IConnectionPointContainer)(source);
    if (cpc !is null) {
      scope(exit) tryRelease(cpc);

      if (cpc.FindConnectionPoint(uuidof!(T), cp_) != S_OK)
        throw new ArgumentException("Source object does not expose '" ~ T.stringof ~ "' event interface.");
    }
  }

  ~this() {
    close();
  }

  void advise(IUnknown sink) {
    if (cp_.Advise(sink, this.cookie_) != S_OK) {
      this.cookie_ = 0;
      tryRelease(cp_);
      throw new InvalidOperationException("Could not Advise() the event interface '" ~ T.stringof ~ "'.");
    }

    if (cp_ is null || this.cookie_ == 0) {
      if (cp_ !is null)
        tryRelease(cp_);
      throw new ArgumentException("Connection point for event interface '" ~ T.stringof ~ "' cannot be created.");
    }
  }

  void unadvise() {
    if (cp_ !is null && this.cookie_ != 0) {
      try {
        cp_.Unadvise(this.cookie_);
      }
      finally {
        tryRelease(cp_);
        cp_ = null;
        this.cookie_ = 0;
      }
    }
  }

}

// port note: member xxx_  changed to this.xxx_ to pass dmd 1.042 by yidabu on May 20 2009
class EventProvider(T) : Implements!(T) {

  extern(D):

  private MethodProxy[int] methodTable_;
  private int[string] nameTable_;

  private IConnectionPoint connectionPoint_;
  private uint cookie_;

  this(IUnknown source) {
    auto cpc = safe_com_cast!(IConnectionPointContainer)(source);
    if (cpc !is null) {
      scope(exit) tryRelease(cpc);

      if (cpc.FindConnectionPoint(uuidof!(T), this.connectionPoint_) != S_OK)
        throw new ArgumentException("Source object does not expose '" ~ T.stringof ~ "' event interface.");

      if (this.connectionPoint_.Advise(this, this.cookie_) != S_OK) {
        this.cookie_ = 0;
        tryRelease(this.connectionPoint_);
        throw new InvalidOperationException("Could not Advise() the event interface '" ~ T.stringof ~ "'.");
      }
    }

    if (this.connectionPoint_ is null || this.cookie_ == 0) {
      if (this.connectionPoint_ !is null)
        tryRelease(this.connectionPoint_);
      throw new ArgumentException("Connection point for event interface '" ~ T.stringof ~ "' cannot be created.");
    }
  }

  ~this() {
    if (this.connectionPoint_ !is null && this.cookie_ != 0) {
      try {
        this.connectionPoint_.Unadvise(this.cookie_);
      }
      finally {
        tryRelease(this.connectionPoint_);
        this.connectionPoint_ = null;
        this.cookie_ = 0;
      }
    }
  }

  void bind(ID, R, P...)(ID member, R delegate(P) handler) {
    static if (is(ID : string)) {
      bool found;
      int dispId = DISPID_UNKNOWN;
      if (tryFindDispId(member, dispId))
        bind(dispId, handler);
      else
        throw new ArgumentException("Member '" ~ member ~ "' not found in type '" ~ T.stringof ~ "'.");
    }
    else static if (is(ID : int)) {
      MethodProxy m = handler;
      methodTable_[member] = m;
    }
  }

  private bool tryFindDispId(string name, out int dispId) {

    void ensureNameTable() {
      if (this.nameTable_ == null) {
        scope clsidKey = RegistryKey.classesRoot.openSubKey("Interface\\" ~ uuidof!(T).toString("P"));
        if (clsidKey !is null) {
          scope typeLibRefKey = clsidKey.openSubKey("TypeLib");
          if (typeLibRefKey !is null) {
            string typeLibVersion = typeLibRefKey.getValue!(string)("Version");
            if (typeLibVersion == null) {
              scope versionKey = clsidKey.openSubKey("Version");
              if (versionKey !is null)
                typeLibVersion = versionKey.getValue!(string)(null);
            }

            scope typeLibKey = RegistryKey.classesRoot.openSubKey("TypeLib\\" ~ typeLibRefKey.getValue!(string)(null));
            if (typeLibKey !is null) {
              scope pathKey = typeLibKey.openSubKey(typeLibVersion ~ "\\0\\Win32");
              if (pathKey !is null) {
                ITypeLib typeLib;
                if (LoadTypeLib(pathKey.getValue!(string)(null).toUtf16z(), typeLib) == S_OK) {
                  scope(exit) tryRelease(typeLib);

                  ITypeInfo typeInfo;
                  if (typeLib.GetTypeInfoOfGuid(uuidof!(T), typeInfo) == S_OK) {
                    scope(exit) tryRelease(typeInfo);

                    TYPEATTR* typeAttr;
                    if (typeInfo.GetTypeAttr(typeAttr) == S_OK) {
                      scope(exit) typeInfo.ReleaseTypeAttr(typeAttr);

                      for (uint i = 0; i < typeAttr.cFuncs; i++) {
                        FUNCDESC* funcDesc;
                        if (typeInfo.GetFuncDesc(i, funcDesc) == S_OK) {
                          scope(exit) typeInfo.ReleaseFuncDesc(funcDesc);

                          wchar* bstrName;
                          if (typeInfo.GetDocumentation(funcDesc.memid, &bstrName, null, null, null) == S_OK) {
                            string memberName = bstr.toString(bstrName);
                            this.nameTable_[memberName.toLower()] = funcDesc.memid;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    dispId = DISPID_UNKNOWN;

    ensureNameTable();

    if (auto value = name.toLower() in this.nameTable_) {
      dispId = *value;
      return true;
    }

    return false;
  }

  extern(Windows):

  override int Invoke(int dispIdMember, ref DWINGUID riid, uint lcid, ushort wFlags, DISPPARAMS* pDispParams, DWINVARIANT* pVarResult, EXCEPINFO* pExcepInfo, uint* puArgError) {
    if (riid != DWINGUID.empty)
      return DISP_E_UNKNOWNINTERFACE;

    try {
      if (auto handler = dispIdMember in this.methodTable_) {
        DWINVARIANT*[8] args;
        for (int i = 0; i < handler.paramTypes.length && i < 8; i++) {
          args[i] = &pDispParams.rgvarg[handler.paramTypes.length - i - 1];
        }

        DWINVARIANT result;
        if (pVarResult == null)
          pVarResult = &result;

        int hr = handler.invoke(args, pVarResult);

        for (int i = 0; i < handler.paramTypes.length; i++) {
          if (args[i].vt == (VT_BYREF | VT_BOOL)) {
            // Fix bools to VARIANT_BOOL
            *args[i].pboolVal = (*args[i].pboolVal == 0) ? VARIANT_FALSE : VARIANT_TRUE;
          }
        }

        return hr;
      }
      else
        return DISP_E_MEMBERNOTFOUND;
    }
    catch {
      return E_FAIL;
    }

    //return S_OK;
  }

}


/*
private struct SinkInfo {

  int delegate() method;
  VARTYPE returnType;
  VARTYPE[] paramTypes;

  static SinkInfo opCall(R, T ...)(R delegate(T) method) {
    //alias ParameterTypeTuple!(method) params;
    alias ParameterTupleOf!(method) params;

    SinkInfo si;
    si.method = cast(int delegate())method;
    si.returnType = VariantType!(R);
    si.paramTypes.length = params.length;

    foreach (i, paramType; params) {
      si.paramTypes[i] = VariantType!(paramType);
    }

    return si;
  }

  int invoke(DWINVARIANT*[] args, DWINVARIANT* result) {

    uint sizeOf(VARTYPE vt) {
      switch (vt) {
        case VT_UI8, VT_I8, VT_CY:
          return long.sizeof / uint.sizeof;
        case VT_R8:
          return double.sizeof / uint.sizeof;
        case VT_VARIANT:
          return (DWINVARIANT.sizeof + 3) / uint.sizeof;
        default:
      }
      return 1;
    }

    bool copyVariant(uint* ptr, DWINVARIANT* var, VARTYPE vt) {
      uint size = sizeOf(vt) * uint.sizeof;
      if (var.vt == vt) {
        memcpy(ptr, &var.lVal, size);
        return true;
      }
      if (vt == VT_VARIANT) {
        memcpy(ptr, var, size);
        return true;
      }
      if ((var.vt & VT_BYREF) && (var.vt & ~VT_BYREF) == vt) {
        memcpy(ptr, cast(void*)var.lVal, size);
        return true;
      }
      if (vt == VT_UNKNOWN && var.vt == VT_DISPATCH) {
        memcpy(ptr, &var.lVal, size);
        return true;
      }
      DWINVARIANT v;
      if (VariantChangeType(&v, var, 0, vt) == S_OK) {
        memcpy(ptr, &var.lVal, size);
        return true;
      }
      return false;
    }

    int invokeMethod(int delegate() method, uint count, uint* ptr) {
      bool hasReturn = (returnType != VT_VOID);
      int hr = DISP_E_BADPARAMCOUNT;

      switch (count) {
        case 0:
          return hr = method(), hasReturn ? hr : S_OK;
        case 1:
          return hr = (cast(int delegate(uint))method)(ptr[0]), hasReturn ? hr : S_OK;
        case 2:
          return hr = (cast(int delegate(uint, uint))method)(ptr[0], ptr[1]), hasReturn ? hr : S_OK;
        case 3:
          return hr = (cast(int delegate(uint, uint, uint))method)(ptr[0], ptr[1], ptr[2]), hasReturn ? hr : S_OK;
        case 4:
          return hr = (cast(int delegate(uint, uint, uint, uint))method)(ptr[0], ptr[1], ptr[2], ptr[3]), hasReturn ? hr : S_OK;
        case 5:
          return hr = (cast(int delegate(uint, uint, uint, uint, uint))method)(ptr[0], ptr[1], ptr[2], ptr[3], ptr[4]), hasReturn ? hr : S_OK;
        case 6:
          return hr = (cast(int delegate(uint, uint, uint, uint, uint, uint))method)(ptr[0], ptr[1], ptr[2], ptr[3], ptr[4], ptr[5]), hasReturn ? hr : S_OK;
        case 7:
          return hr = (cast(int delegate(uint, uint, uint, uint, uint, uint, uint))method)(ptr[0], ptr[1], ptr[2], ptr[3], ptr[4], ptr[5], ptr[6]), hasReturn ? hr : S_OK;
        case 8:
          return hr = (cast(int delegate(uint, uint, uint, uint, uint, uint, uint, uint))method)(ptr[0], ptr[1], ptr[2], ptr[3], ptr[4], ptr[5], ptr[6], ptr[7]), hasReturn ? hr : S_OK;
        case 9:
          return hr = (cast(int delegate(uint, uint, uint, uint, uint, uint, uint, uint, uint))method)(ptr[0], ptr[1], ptr[2], ptr[3], ptr[4], ptr[5], ptr[6], ptr[7], ptr[8]), hasReturn ? hr : S_OK;
        case 10:
          return hr = (cast(int delegate(uint, uint, uint, uint, uint, uint, uint, uint, uint, uint))method)(ptr[0], ptr[1], ptr[2], ptr[3], ptr[4], ptr[5], ptr[6], ptr[7], ptr[8], ptr[9]), hasReturn ? hr : S_OK;
        case 11:
          return hr = (cast(int delegate(uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint))method)(ptr[0], ptr[1], ptr[2], ptr[3], ptr[4], ptr[5], ptr[6], ptr[7], ptr[8], ptr[9], ptr[10]), hasReturn ? hr : S_OK;
        case 12:
          return hr = (cast(int delegate(uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint))method)(ptr[0], ptr[1], ptr[2], ptr[3], ptr[4], ptr[5], ptr[6], ptr[7], ptr[8], ptr[9], ptr[10], ptr[11]), hasReturn ? hr : S_OK;
        default:
      }

      return hr;
    }

    uint count = 0;
    for (int i = 0; i < paramTypes.length; i++) {
      count += sizeOf(paramTypes[i]);
    }

    auto ptr = cast(uint*)HeapAlloc(GetProcessHeap(), 0, count * uint.sizeof);

    uint offset = 0;
    for (int i = 0; i < paramTypes.length; i++) {
      DWINVARIANT* pArg = args[i];
      copyVariant(ptr + offset, pArg, paramTypes[i]);
      offset += sizeOf(paramTypes[i]);
    }

    int hr = invokeMethod(method, count, ptr);

    if (result !is null && returnType != VT_VOID) {
      result.vt = returnType;
      result.lVal = hr;
    }

    HeapFree(GetProcessHeap(), 0, ptr);
    return S_OK;
  }

}

public class EventCookie(T) {

  private IConnectionPoint cp_;
  private uint cookie_;

  public this(IUnknown source) {
    auto cpc = safe_com_cast!(IConnectionPointContainer)(source);
    if (cpc !is null) {
      releaseAfter (cpc, {
        if (cpc.FindConnectionPoint(T.IID, cp_) != S_OK)
          throw new IllegalArgumentException("Source object does not expose '" ~ T.stringof ~ "' event interface.");
      });
    }
  }

  ~this() {
    close();
  }

  public void advise(IUnknown sink) {
    if (cp_.Advise(sink, cookie_) != S_OK) {
      cookie_ = 0;
      tryRelease(cp_);
      throw new InvalidOperationException("Could not Advise() the event interface '" ~ T.stringof ~ "'.");
    }

    if (cp_ is null || cookie_ == 0) {
      if (cp_ !is null)
        tryRelease(cp_);
      throw new IllegalArgumentException("Connection point for event interface '" ~ T.stringof ~ "' cannot be created.");
    }
  }

  public void unadvise() {
    if (cp_ !is null && cookie_ != 0) {
      try {
        cp_.Unadvise(cookie_);
      }
      finally {
        tryRelease(cp_);
        cp_ = null;
        cookie_ = 0;
      }
    }
  }

}

public class EventProvider(T) : Implements!(T) {

  extern (D):

  private int[char[]] nameTable_;
  private SinkInfo[int] sinkTable_;

  private IConnectionPoint connectionPoint_;
  private uint cookie_;

  public this(IUnknown source) {
    auto cpc = safe_com_cast!(IConnectionPointContainer)(source);
    if (cpc !is null) {
      releaseAfter (cpc, {
        if (cpc.FindConnectionPoint(T.IID, connectionPoint_) != S_OK)
          throw new IllegalArgumentException("Source object does not expose '" ~ T.stringof ~ "' event interface.");

        if (connectionPoint_.Advise(this, cookie_) != S_OK) {
          cookie_ = 0;
          tryRelease(connectionPoint_);
          throw new InvalidOperationException("Could not Advise() the event interface '" ~ T.stringof ~ "'.");
        }
      });
    }

    if (connectionPoint_ is null || cookie_ == 0) {
      if (connectionPoint_ !is null)
        tryRelease(connectionPoint_);
      throw new IllegalArgumentException("Connection point for event interface '" ~ T.stringof ~ "' cannot be created.");
    }
  }

  ~this() {
    if (connectionPoint_ !is null && cookie_ != 0) {
      try {
        connectionPoint_.Unadvise(cookie_);
      }
      finally {
        tryRelease(connectionPoint_);
        connectionPoint_ = null;
        cookie_ = 0;
      }
    }
  }

  public void attach(ID, TResult, TParams ...)(ID member, TResult delegate(TParams) handler) {
    static if (is(ID : char[])) {
      bool found;
      int dispId = DISPID_UNKNOWN;
      if (tryFindDispId(member, dispId))
        attach(dispId, handler);
      else
        throw new IllegalArgumentException("Member '" ~ member ~ "' not found in type '" ~ T.stringof ~ "'.");
    }
    else static if (is(ID : int)) {
      SinkInfo s = handler;
      sinkTable_[member] = s;
    }
  }

  private bool tryFindDispId(char[] name, out int dispId) {

    void initNameTable() {
      scope clsidKey = RegistryKey.classesRoot.openSubKey("Interface\\" ~ T.IID.toString());
      if (clsidKey !is null) {
        scope typeLibRefKey = clsidKey.openSubKey("TypeLib");
        if (typeLibRefKey !is null) {
          char[] typeLibVersion = typeLibRefKey.getValue!(char[])("Version");
          if (typeLibRefKey is null) {
            scope versionKey = clsidKey.openSubKey("Version");
            if (versionKey !is null)
              typeLibVersion = versionKey.getValue!(char[])(null);
          }

          scope typeLibKey = RegistryKey.classesRoot.openSubKey("TypeLib\\" ~ typeLibRefKey.getValue!(char[])(null));
          if (typeLibKey !is null) {
            scope pathKey = typeLibKey.openSubKey(typeLibVersion ~ "\\0\\Win32");
            if (pathKey !is null) {
              ITypeLib typeLib = null;
              if (LoadTypeLib(pathKey.getValue!(char[])(null).toString16z(), typeLib) == S_OK) {
                scope (exit) tryRelease(typeLib);

                ITypeInfo typeInfo = null;
                if (typeLib.GetTypeInfoOfGuid(T.IID, typeInfo) == S_OK) {
                  scope (exit) tryRelease(typeInfo);

                  TYPEATTR* typeAttr;
                  if (typeInfo.GetTypeAttr(typeAttr) == S_OK) {
                    scope (exit) typeInfo.ReleaseTypeAttr(typeAttr);

                    for (uint i = 0; i < typeAttr.cFuncs; i++) {
                      FUNCDESC* funcDesc;
                      if (typeInfo.GetFuncDesc(i, funcDesc) == S_OK) {
                        scope (exit) typeInfo.ReleaseFuncDesc(funcDesc);

                        wchar* bstrName;
                        if (typeInfo.GetDocumentation(funcDesc.memid, &bstrName, null, null, null) == S_OK) {
                          char[] memberName = bstr.toString(bstrName);
                          nameTable_[memberName.toLower()] = funcDesc.memid;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    dispId = DISPID_UNKNOWN;
    
    if (nameTable_ is null)
      initNameTable();

    if (auto value = name.toLower() in nameTable_) {
      dispId = *value;
      return true;
    }

    return false;
  }

  extern (Windows)
  override int Invoke(int dispIdMember, ref DWINGUID riid, uint lcid, ushort wFlags, DISPPARAMS* pDispParams, DWINVARIANT* pVarResult, EXCEPINFO* pExcepInfo, uint* puArgErr) {
    if (auto handler = dispIdMember in sinkTable_) {
      DWINVARIANT*[8] args;
      for (int i = 0; i < handler.paramTypes.length && i < 8; i++) {
        args[i] = &pDispParams.rgvarg[handler.paramTypes.length - i - 1];
      }

      DWINVARIANT result;
      if (pVarResult is null)
        pVarResult = &result;

      int hr = handler.invoke(args, pVarResult);

      for (int i = 0; i < handler.paramTypes.length; i++) {
        if (args[i].vt == (VT_BYREF | VT_BOOL)) {
          // Fix bools to VARIANT_BOOL.
          if (*args[i].pboolVal == 1)
            *args[i].pboolVal = VARIANT_TRUE;
        }
      }

      return hr;
    }
    return DISP_E_MEMBERNOTFOUND;
  }

}
*/
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
