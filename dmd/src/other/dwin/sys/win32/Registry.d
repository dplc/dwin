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

/**
 * Provides classes for working with the Windows _registry.
 * modified by yidabu, 20070922
   under DMD 1.021, tango 0.99.1 RC4, WindosXP SP2
   example:

    import tango.io.Stdout;
    import Registry;

    void main()
    {
        char[] result;
        scope httpkey = RegistryKey.classesRoot.openSubKey(r"HTTP\shell\open\command");
        if(httpkey !is null)
        {
            result = httpkey.getValue!(char[])(null);
            Stdout(result).newline;
            //"C:\Program Files\Internet Explorer\iexplore.exe" -nohome
        }
        else
            Stdout("failed").newline;

    }


 */

module dwin.sys.win32.Registry;


private import dwin.core.Exception;
private import dwin.sys.win32.UserGdi;
private import dwin.sys.win32.CodePage : toString16z;
private import dwin.text.convert.Utf : toString, toString16;
private import dwin.sys.win32.Wrapper : expandEnvironmentStrings;
private import tango.util.Convert;
private import tango.text.convert.Format;
private import tango.sys.Common : SysError;
private import tango.sys.win32.Types;
private import tango.core.Exception;
//private import tango.text.convert.Integer : format;


const int
  REG_UNKOWN = 0,
  REG_STRING = 1,
  REG_EXPANDSTRING = 2,
  REG_BINARY = 3,
  REG_DWORD = 4,
  REG_MULTISTRING = 7,
  REG_QWORD = 11;

/**
 * Identifies the data type of a value in the registry.
 */
public enum RegistryValueKind {
  Unknown = 0,        /// Indicates an unsupported registry data type.
  String = 1,         /// Specifies a string. Equivalent to REG_SZ.
  ExpandString = 2,   /// Specifies a char[] containing references to environment variables. Equivalent to REG_EXPAND_SZ.
  Binary = 3,         /// Specifies binary data in any form. Equivalent to REG_BINARY.
  DWord = 4,          /// Specifies a 32-bit binary number. Equivalent to REG_DWORD.
  MultiString = 7,    /// Specifies an array of strings. Equivalent to REG_MULTI_SZ.
  QWord = 11          /// Specifies a 64-bit binary number. Equivalent to REG_QWORD.
}

/**
    Represents a node in the Windows registry.
    Example:
    ---
        char[] result;
        scope httpkey = RegistryKey.classesRoot.openSubKey(r"HTTP\shell\open\command");
        if(httpkey !is null)
        {
            result = httpkey.getValue!(char[])(null);
            Stdout(result).newline;
            //"C:\Program Files\Internet Explorer\iexplore.exe" -nohome
        }
        else
            Stdout("failed").newline;
    ---

 */
public final class RegistryKey {

  private const char[][] HKEY_NAMES = [
    "HKEY_CLASSES_ROOT", "HKEY_CURRENT_USER", "HKEY_LOCAL_MACHINE", "HKEY_USERS", "HKEY_PERFORMANCE_DATA", "HKEY_CURRENT_CONFIG", "HKEY_DYN_DATA"
  ];

  public static const RegistryKey classesRoot;      /// Defines the types of documents and properties associated with those types. Reads HKEY_CLASSES_ROOT.
  public static const RegistryKey currentUser;      /// Contains information about the current user preferences. Reads HKEY_CURRENT_USER.
  public static const RegistryKey localMachine;     /// Contains configuration data for the local machine. Reads HKEY_LOCAL_MACHINE.
  public static const RegistryKey users;            /// Contains information about the default user configuration. Reads HKEY_USERS.
  public static const RegistryKey performanceData;  /// Contains performance information for software components. Reads HKEY_PERFORMANCE_DATA.
  public static const RegistryKey currentConfig;    /// Contains configuration information about hardware that is not specifiec to the user. Reads HKEY_CURRENT_CONFIG.
  public static const RegistryKey dynData;          /// Contains dynamic registry data. Reads HKEY_DYN_DATA.

  private HANDLE hkey_;
  private char[] name_;
  private bool systemKey_;
  private bool perfDataKey_;
  private bool writable_;
  private bool remoteKey_;
  private bool dirty_;

  static this() {
    classesRoot = get(cast(HANDLE)HKEY_CLASSES_ROOT);
    currentUser = get(cast(HANDLE)HKEY_CURRENT_USER);
    localMachine = get(cast(HANDLE)HKEY_LOCAL_MACHINE);
    users = get(cast(HANDLE)HKEY_USERS);
    performanceData = get(cast(HANDLE)HKEY_PERFORMANCE_DATA);
    currentConfig = get(cast(HANDLE)HKEY_CURRENT_CONFIG);
    dynData = get(cast(HANDLE)HKEY_DYN_DATA);
  }

  ~this() {
    close();
  }

  /**
   * Retrieves a char[] representation of this key.
   * Returns: A char[] representing the key.
   */
  //public override char[] toString() {
  public char[] toString() {
    return name_;
  }

  /**
   * Closes the key.
   */
  public void close() {
    if (hkey_ != HANDLE.init) {
      if (!systemKey_) {
        RegCloseKey(hkey_);
        hkey_ = HANDLE.init;
      }
    }
  }

  /**
   * Writes all the attributes of this key to the registry.
   */
  public void flush() {
    if (hkey_ != HANDLE.init && dirty_)
      RegFlushKey(hkey_);
  }

  /**
   * Retrieves a subkey.
   * Params:
   *   name = Name or path of the subkey to open.
   *   writable = true if you need write access to the key.
   * Returns: The subkey requested, or null if the operation failed.
   */
  public RegistryKey openSubKey(char[] name, bool writable = false) {
    HANDLE hkey;
    int r = RegOpenKeyEx(hkey_, name.toString16z(), 0, (writable ? (KEY_READ | KEY_WRITE) : KEY_READ), hkey);
    //int r = RegOpenKeyEx(hkey_, name.toString16z(), 0, (writable ? (KEY_READ | KEY_WRITE) : KEY_READ), cast(void**)hkey);
    if (r == ERROR_SUCCESS && hkey != HANDLE.init && hkey != INVALID_HANDLE_VALUE) {
      auto key = new RegistryKey(hkey, writable, false, false, false);
      key.name_ = this.name_ ~ '\\' ~ name;
      return key;
    }
    if (r == ERROR_ACCESS_DENIED)
      issueError(r, name_ ~ '\\' ~ name);
    return null;
  }

  public RegistryKey createSubKey(char[] name) {
    HANDLE hkey;
    uint disposition;
    int r = RegCreateKeyEx(hkey_, name.toString16z(), 0, null, 0, KEY_READ | KEY_WRITE, null, hkey, disposition);
    //int r = RegCreateKeyEx(hkey_, name.toString16z(), 0, null, 0, KEY_READ | KEY_WRITE, cast(LPSECURITY_ATTRIBUTES)null, cast(void**)hkey, &disposition);
    if (r == ERROR_SUCCESS && hkey != HANDLE.init && hkey != INVALID_HANDLE_VALUE) {
      auto key = new RegistryKey(hkey, true, false, false, false);
      if (name.length == 0)
        key.name_ = name_;
      else
        key.name_ = name_ ~ '\\' ~ name;
      return key;
    }
    if (r != ERROR_SUCCESS)
      issueError(r, name_ ~ '\\' ~ name);
    return null;
  }

  /**
   * Retrieves a subkey if it exists, otherwise it creates it first.
   * Params:
   *   name = Name or path of the subkey to ensure
   *   writable = true if you need write access to the key.
   * Returns: The subkey requested, or null if the operation failed.
   */
  public RegistryKey ensureKey(char[] name, bool writable = true) {
    auto key = openSubKey(name, writable);
    if (key is null) {
      key = createSubKey(name);
    }
    return key;
  }

  /**
   * Deletes the specified subkey.
   * Params: name = The _name of the subkey to delete.
   */
  public void deleteSubKey(char[] name) {
    RegDeleteKey(hkey_, name.toString16z());
  }

  public void deleteSubKeyTree(char[] name) {
    scope key = openSubKey(name, true);
    if (key !is null) {
      if (key.subKeyCount > 0) {
        foreach (subkey; key.subKeyNames)
          key.deleteSubKeyTree(subkey);
      }

      key.close();

      int r = RegDeleteKey(hkey_, name.toString16z());
      if (r != ERROR_SUCCESS)
        issueError(r, null);
    }
    else
      throw new RegistryException("Cannot delete a subkey tree because the subkey does not exist.");
  }

  /**
   * Deletes the specified value from the registry.
   * Params: name = The _name of the value to delete.
   */
  public void deleteValue(char[] name) {
    RegDeleteValue(hkey_, name.toString16z());
  }

  /**
   * Retrieves the registry data type of the value associated with the specified _name.
   * Params: name = The _name of the value whose registry data type is to be retrieved.
   * Returns: A value representing the registry data type of the value associated with name.
   */
  public RegistryValueKind getValueKind(char[] name) {
    uint cb, type;
    RegQueryValueEx(hkey_, name.toString16z(), null, &type, null, &cb);
    return cast(RegistryValueKind)type;
  }

  /**
   * Retrieves the value associated with the specified _name.
   * Params:
   *   name = The _name of the value to retrieve.
   *   defaultValue = The value to return if name does not exist.
   *   doNotExpand = Specify false to expand environment values.
   * Returns: The value associated with name, or defaultValue if name is not found.
   */
  public T getValue(T)(char[] name, T defaultValue = T.init, bool doNotExpand = false) {
    uint cb, type;
    if (RegQueryValueEx(hkey_, name.toString16z(), null, &type, null, &cb) == 0) {
      static if (is(T == int)) {
        if (type == REG_DWORD) {
          int b;
          RegQueryValueEx(hkey_, name.toString16z(), null, &type, cast(ubyte*)&b, &cb);
          return b;
        }
      }
      else static if (is(T == long)) {
        if (type == REG_QWORD) {
          long b;
          RegQueryValueEx(hkey_, name.toString16z(), null, &type, cast(ubyte*)&b, &cb);
          return b;
        }
      }
      else static if (is(T : char[])) {
        if (type == REG_SZ || type == REG_EXPAND_SZ) {
          wchar[] b = new wchar[cb / 2];
          RegQueryValueEx(hkey_, name.toString16z(), null, &type, cast(ubyte*)b.ptr, &cb);
          char[] result = .toString(b.ptr);

          if (!doNotExpand && type == REG_EXPAND_SZ)
            return expandEnvironmentStrings(result);

          return result;
        }
      }
      else static if (is(T : char[][])) {
        if (type == REG_MULTI_SZ) {
          char[][] result;

          wchar[] b = new wchar[cb / 2];
          RegQueryValueEx(hkey_, name.toString16z(), null, &type, cast(ubyte*)b.ptr, &cb);

          uint index = 0;
          auto end = b.length;
          while (index < end) {
            uint pos = index;
            while (pos < end && b[pos] != '\0') pos++;

            if (pos < end) {
              if (pos - index > 0) result ~= .toString(b.ptr, index, pos);
              else if (pos != end - 1) result ~= "";
            }
            else result ~= .toString(b.ptr, index, end);

            index = pos + 1;
          }

          return result;
        }
      }
      else static if (is(T == ubyte[])) {
        if (type == REG_BINARY || type == REG_DWORD_BIG_ENDIAN) {
          ubyte[] b = new ubyte[cb];
          RegQueryValueEx(hkey_, name.toString16z(), null, &type, b.ptr, &cb);
          return b;
        }
      }
    }
    return defaultValue;
  }

  /**
   * Sets the _value of a name/value pair in the registry key using the specified registry data type.
   * Params:
   *   name = The _name of the _value to be stored.
   *   value = The data to be stored.
   *   valueKind = The registry data type to use when storing the data.
   */

    void setValue(T)(char[] name, T value, RegistryValueKind kind = RegistryValueKind.Unknown) {
        if (!writable_)
          throw new UnauthorizedAccessException("Cannot write to the registry key.");

        if (kind == RegistryValueKind.Unknown) {
          static if (is(T == int) || is(T == uint)) kind = RegistryValueKind.DWord;
          else static if (is(T == long) || is(T == ulong)) kind = RegistryValueKind.QWord;
          else static if (is(T : char[])) kind = RegistryValueKind.String;
          else static if (is(T : char[][])) kind = RegistryValueKind.MultiString;
          else static if (is(T == ubyte[])) kind = RegistryValueKind.Binary;
          else kind = RegistryValueKind.String;
        }

        wchar* lpName = name.toString16z();

        int ret = ERROR_SUCCESS;
        try {
          switch (kind) {
            case RegistryValueKind.DWord:
              uint data;
              static if (is(T : uint))
                data = cast(uint)value;
              else static if (is(T : char[]))
                data = to!(uint)(value);
              else
                throw new InvalidCastException("");

              ret = RegSetValueEx(hkey_, lpName, 0, REG_DWORD, cast(ubyte*)&data, uint.sizeof);
              break;

            case RegistryValueKind.QWord:
              ulong data;
              static if (is(T : ulong))
                data = cast(ulong)value;
              else static if (is(T : char[]))
                data = to!(ulong)(value);
              else
                throw new InvalidCastException("");

              ret = RegSetValueEx(hkey_, lpName, 0, REG_QWORD, cast(ubyte*)&data, ulong.sizeof);
              break;

            case RegistryValueKind.String, RegistryValueKind.ExpandString:
              char[] data;
              static if (is(T : char[]))
                data = value;
              else
                data = Format("{}", value);

              ret = RegSetValueEx(hkey_, lpName, 0, REG_SZ, cast(ubyte*)data.toString16z(), (data.length * wchar.sizeof) + 2);
              break;

            case RegistryValueKind.MultiString:
              static if (is(T : char[][])) {
                uint size;
                foreach (s; value)
                  size += (s.length + 1) * wchar.sizeof;

                wchar[] buffer = new wchar[size];
                int cur;
                foreach (s; value) {
                  wstring ws = toString16(s);

                  int pos = cur + ws.length;
                  buffer[cur .. pos] = ws;
                  buffer[pos] = '\0';

                  cur = pos + 1;
                }

                ret = RegSetValueEx(hkey_, lpName, 0, REG_MULTI_SZ, cast(ubyte*)buffer.ptr, buffer.length);
              }
              else
                throw new InvalidCastException("");
              break;

            case RegistryValueKind.Binary:
              static if (is(T : ubyte[]))
                ret = RegSetValueEx(hkey_, lpName, 0, REG_BINARY, (cast(ubyte[])value).ptr, value.length);
              else
                throw new InvalidCastException("");
              break;

            default:
          }
        }
        catch (IllegalArgumentException) {
          throw new ArgumentException("The type of the value argument did not match the specified RegistryValueKind or the value could not be properly converted.");
        }
        catch (InvalidCastException) {
          throw new ArgumentException("The type of the value argument did not match the specified RegistryValueKind or the value could not be properly converted.");
        }

        if (ret != ERROR_SUCCESS)
          issueError(ret,"");
        else
          dirty_ = true;
  }  

  
  /*
  public void setValue(T)(char[] name, T value, RegistryValueKind valueKind = RegistryValueKind.Unknown) {
    if (valueKind == RegistryValueKind.Unknown) {
      static if (is(T : char[]))
        valueKind = RegistryValueKind.String;
      else static if (is(T : char[][]))
        valueKind = RegistryValueKind.MultiString;
      else static if (is(T == ubyte[]))
        valueKind = RegistryValueKind.Binary;
      else static if (is(T == int))
        valueKind = RegistryValueKind.DWord;
      else static if (is(T == long))
        valueKind = RegistryValueKind.QWord;
      else
        valueKind = RegistryValueKind.String;
    }

    int r = ERROR_SUCCESS;

    switch (valueKind) {
      case RegistryValueKind.String, RegistryValueKind.ExpandString:
        char[] s;
        static if (!is(T : char[]))
          s = .toString(value);
        else
          s = value;
        r = RegSetValueEx(hkey_, name.toString16z(), 0, REG_SZ, cast(ubyte*)s.toString16z(), (s.length * 2) + 2);
        break;
      case RegistryValueKind.MultiString:
        break;
      case RegistryValueKind.Binary:
        r = RegSetValueEx(hkey_, name.toString16z(), 0, REG_BINARY, cast(ubyte*)value.ptr, value.length);
        break;
      case RegistryValueKind.DWord:
        r = RegSetValueEx(hkey_, name.toString16z(), 0, REG_DWORD, cast(ubyte*)&value, int.sizeof);
        break;
      case RegistryValueKind.QWord:
        r = RegSetValueEx(hkey_, name.toString16z(), 0, REG_QWORD, cast(ubyte*)&value, long.sizeof);
        break;
      default:
    }

    if (r == ERROR_SUCCESS)
      dirty_ = true;
  }
  */

  /**
   * Returns: The _name of the key.
   */
  public char[] name() {
    return name_;
  }

  /**
   * Retrieves the count of subkeys of this key.
   * Returns: The number of subkeys.
   */
  public int subKeyCount() {
    uint result;
    RegQueryInfoKey(hkey_, null, null, null, &result, null, null, null, null, null, null, null);
    return result;
  }

  /**
   * Returns: An array of strings containing the subkey names.
   */
  public char[][] subKeyNames() {
    int count = subKeyCount;
    char[][] result = new char[][count];

    if (count > 0) {
      wchar[256] buffer;
      for (int index = 0; index < count; index++) {
        auto cch = buffer.length;
        RegEnumKeyEx(hkey_, index, buffer.ptr, &cch, null, null, null, null);
        result[index] = .toString(buffer.ptr);
      }
    }

    return result;
  }

  /**
   * Retrieves the count of values in the key.
   * Returns: The number of values.
   */
  public int valueCount() {
    uint result;
    RegQueryInfoKey(hkey_, null, null, null, null, null, null, &result, null, null, null, null);
    return result;
  }

  /**
   * Retrieves an array of strings containing the value names associated with this key.
   * Returns: An array of strings containing the value names.
   */
  public char[][] valueNames() {
    int count = valueCount;
    char[][] result = new char[][count];

    if (count > 0) {
      wchar[256] buffer;
      for (int index = 0; index < count; index++) {
        auto cch = buffer.length;
        RegEnumValue(hkey_, index, buffer.ptr, &cch, null, null, null, null);
        result[index] = .toString(buffer.ptr);
      }
    }

    return result;
  }

  private this(HANDLE hKey, bool writable, bool systemKey = false, bool remoteKey = false, bool perfDataKey = false) {
    hkey_ = hKey;
    writable_ = writable;
    systemKey_ = systemKey;
    perfDataKey_ = perfDataKey;
  }

  private static RegistryKey get(HANDLE hKey) {
    auto key = new RegistryKey(hKey, true, true, false, hKey == HKEY_PERFORMANCE_DATA);
    key.name_ = HKEY_NAMES[cast(int)hKey & 0x0FFFFFFF];
    return key;
  }


  private void issueError(int errorCode, char[] s) {
    switch (errorCode) {
      case ERROR_FILE_NOT_FOUND:
        throw new RegistryException("The specified registry key does not exist.");
      case ERROR_ACCESS_DENIED:
        throw new RegistryException("Access to the registry key '" ~ s ~ "' is denied.");
      default:
        throw new Win32Exception(SysError.lookup(errorCode) ~ "\r\n" ~ s );
    }

  }


}
