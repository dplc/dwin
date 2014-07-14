/**
 * SQLiteD Base Classes.
 * Authors: icee
 * http://iqk.sourceforge.net/
 * Date: Sep. 7, 2006.
 */

 /*******************************************************************************

         Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved

         Version:        Initial release: April 2008

         Authors:        modified to with Tango by yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

        sqlite.lib version : 3.6.23.1
        
        How do I build sqlite3.lib ?
        1 download sqlite source from sqlite.org :
        http://www.sqlite.org/download.html
        http://www.sqlite.org/sqlite-amalgamation-3_5_8.zip
        2 build command:
        dmc -DTHREADSAFE=1 -DSQLITE_ENABLE_COLUMN_METADATA=1 -c sqlite3.c
        lib -c sqlite3.lib sqlite3.obj


        Example:
        ---
            import  tango.io.FilePath;
            import  dwin.database.sqlite.All;
            void test()
            {
                    char[] path = r"D:\test.db";
                    FilePath fp = FilePath(path);    // cause VM exception if exists
                    if(fp.exists) fp.remove;

                    auto con = new Connection();
                    con.open(path);
                    auto cur = con.createCursor();
                    scope(exit)
                    {
                        cur.close;
                        con.close;
                    }
                    cur.execute("create table catalog (id INT, pid INT, name TEXT);"c);
                    cur.execute("insert into catalog (id, pid, name) values (1, 0, 'name1');"c);
                    cur.execute("insert into catalog (id, pid, name) values (0, 1, 'hello');"c);

                    cur.execute("select * from catalog;");
                    static int[] ts1 = [
                        SQLiteDataType.INT,
                        SQLiteDataType.INT,
                        SQLiteDataType.TEXT];

                    Stdout("fetchAll:").newline;
                    auto datas = cur.fetchAll(ts1);
                    foreach(data; datas)
                    {
                        Stdout.formatln( "id {}, pid {}, name {}",
                            data[0].unpack!(int)(),
                            data[1].unpack!(int)(),
                            data[2].unpack!(char[])() );
                    }

                    Stdout("fetchOne:").newline;
                    cur.execute("select * from catalog where id = 1;");
                    auto da = cur.fetchOne(ts1);
                    Stdout.formatln( "id {}, pid {}, name {}",
                        da[0].unpack!(int)(),
                        da[1].unpack!(int)(),
                        da[2].unpack!(char[])() );

                    Stdout("update:").newline;
                    cur.execute("update catalog set name='name2' where id = 1;");
                    cur.execute("select * from catalog;");
                    da = cur.fetchOne(ts1);
                    Stdout.formatln( "id {}, pid {}, name {}",
                        da[0].unpack!(int)(),
                        da[1].unpack!(int)(),
                        da[2].unpack!(char[])() );

                    Stdout("delete:").newline;
                    cur.execute("delete from catalog where id = 1;");
                    cur.execute("select * from catalog;");
                    datas = cur.fetchAll(ts1);
                    foreach(data; datas)
                    {
                        Stdout.formatln( "id {}, pid {}, name {}",
                            data[0].unpack!(int)(),
                            data[1].unpack!(int)(),
                            data[2].unpack!(char[])() );
                    }
            }
        ---

 *******************************************************************************/



module dwin.database.sqlite.Base;


private import dwin.database.sqlite.c.sqlite3;
public import dwin.database.sqlite._ureg;
public import dwin.database.sqlite._event;
public import dwin.database.sqlite._auth;

version(Phobos)
    private import std.stdarg;
else
    private import tango.stdc.stdarg;

debug
{
    version(Phobos)
        private import std.stdio;
    else
    {
        private import tango.io.Stdout;
        //alias Stdout writefln;
        //alias Stdout write;
        //private import tango.util.log.Trace;
    }
}




// C99 strlen and wcslen:
package int _strlen(char* s) {
	char* p; int lng;
	for(p = s, lng = 0; *p != 0; p++, lng++) {}
	return lng;
}
package int _wcslen(wchar* s) {
	wchar* p; int lng;
	for(p = s, lng = 0; *p != 0; p++, lng++) {}
	return lng;
}

// mixin for dynamic array manipulation:
package template TXArrayEx(T, size_t initial = 1, size_t multiplier = 2) {
	static assert(initial > 0);
	static assert(multiplier > 1);
	T[] rs = new T[initial];
	int i = 0;
	void push(T r) {
		if(!(rs.length > i)) {
			version(ExplicitDelete) {
				T[] temp = rs;
				rs = new T[temp.length * multiplier];
				rs[0 .. temp.length] = temp[0 .. $];
				delete temp;
			} else {
				rs.length = rs.length * multiplier;
			}
		}
		rs[i++] = r;
	}
	T[] pack() {
		rs.length = i;
		return rs;
	}
}

/// int sqlite3_sleep(int ms), return actually requested time in ms.
public alias sqlite3_sleep sleep;

/// Returns: The SQLite3 lib version in char[].
public char[] libVersion() {
	char* v = sqlite3_libversion();
	return v[0 .. _strlen(v)];
}
/// Returns: The SQLite3 lib version number.
public int libVersionNumber() {
	return sqlite3_libversion_number();
}

/// Util function for checking if the string a complete SQL statement.
/// Params:
///   sql = The SQL string.
/// Returns: true if complete.
public bool isSqlComplete(char[] sql) {
	return cast(bool) sqlite3_complete((sql~"\0").ptr);
}

/**
 * SQLiteVMException, Exception relates to the SQLite VM.
 */
public class SQLiteVMException : Exception {
	/// Error code return by the SQLite3 database engine.
	public int code() {
		return _code;
	}
	private int _code = -1;

	public this(int errcode) {
		super("SQLite VM Exception");
		_code = errcode;
	}
	public this(int errcode, char[] detail) {
		super("SQLite VM Exception: " ~ detail);
		_code = errcode;
	}
}
public alias SQLiteVMException SQLiteEngineException;

/// SQLite VM return codes.
public enum SQLiteVMCode {
	OK = SQLITE_OK, // 0, Successful result
	ERROR = SQLITE_ERROR, // 1, SQL error or missing database
	INTERNAL,  // 2, An internal logic error in SQLite
	PERM,      // 3, Access permission denied
	ABORT,     // 4, Callback routine requested an abort
	BUSY,      // 5, The database file is locked
	LOCKED,    // 6, A table in the database is locked
	NOMEM,     // 7, A malloc() failed
	READONLY,  // 8, Attempt to write a readonly database
	INTERRUPT, // 9, Operation terminated by sqlite_interrupt()
	IOERR,     //10, Some kind of disk I/O error occurred
	CORRUPT,   //11, The database disk image is malformed
	NOTFOUND,  //12, (Internal Only) Table or record not found
	FULL,      //13, Insertion failed because database is full
	CANTOPEN,  //14, Unable to open the database file
	PROTOCOL,  //15, Database lock protocol error
	EMPTY,     //16, (Internal Only) Database table is empty
	SCHEMA,    //17, The database schema changed
	TOOBIG,    //18, Too much data for one row of a table
	CONSTRAINT,//19, Abort due to constraint violation
	MISMATCH,  //20, Data type mismatch
	MISUSE,    //21, Library used incorrectly
	NOLFS,     //22, Uses OS features not supported on host
	AUTH,      //23, Authorization denied
	ROW = SQLITE_ROW, // 100, sqlite_step() has another row ready
	DONE = SQLITE_DONE, // 101, sqlite_step() has finished executing
};

/**
 * SQLiteDException.
 */
public class SQLiteDException : Exception {
	public this(char[] msg) {
		super("SQLite D Exception: " ~ msg);
	}
}

/**
 * Data structure in parameter and recordset.
 */
public struct SQLiteData {
	/// Data fields.
	union {
		int dataInt;
		long dataInt64;
		double dataDouble;
		char[] dataText;
		wchar[] dataText16;
		void[] dataBlob;

		void* dataUser;
	};
	/// Type of Data, enum SQLiteDataType or custom value.
	int type = -1;

	/// Pack D types into SQLiteData struct.
	/// Params:
	///   d = Data in D.
	void pack(int d) {
		type = SQLiteDataType.INT;
		dataInt = d;
	}
	/// .
	void pack(long d) {
		type = SQLiteDataType.INT64;
		dataInt64 = d;
	}
	/// .
	void pack(double d) {
		type = SQLiteDataType.DOUBLE;
		dataDouble = d;
	}
	/// .
	void pack(char[] d) {
		type = SQLiteDataType.TEXT;
		dataText = d;
	}
	/// .
	void pack(wchar[] d) {
		type = SQLiteDataType.TEXT16;
		dataText16 = d;
	}
	/// .
	void pack(void[] d) {
		type = SQLiteDataType.BLOB;
		dataBlob = d;
	}

	/// Pack NULL.
	void pack() {
		type = SQLiteDataType.NULL;
		dataInt64 = 0; // clear the data field?
	}

	/// Pack D types into SQLiteData struct (USER).
	/// Params:
	///   d = Pointer to data in D.
	///   t = Type specified.
	void pack(void* d, int t) {
		assert(t > SQLiteDataType.USER);
		type = t;
		dataUser = d;
	}

	static const SQLiteData NULL = {dataInt64: 0, type: SQLiteDataType.NULL};

	/// Create SQLiteData struct from D types.
	static SQLiteData create(int d) {
		SQLiteData sd;
		sd.pack(d);
		return sd;
	}
	/// .
	static SQLiteData create(long d) {
		SQLiteData sd;
		sd.pack(d);
		return sd;
	}
	/// .
	static SQLiteData create(double d) {
		SQLiteData sd;
		sd.pack(d);
		return sd;
	}
	/// .
	static SQLiteData create(char[] d) {
		SQLiteData sd;
		sd.pack(d);
		return sd;
	}
	/// .
	static SQLiteData create(wchar[] d) {
		SQLiteData sd;
		sd.pack(d);
		return sd;
	}
	/// .
	static SQLiteData create(void[] d) {
		SQLiteData sd;
		sd.pack(d);
		return sd;
	}

	/// Create NULL.
	static SQLiteData create() {
		SQLiteData sd;
		sd.pack();
		return sd;
	}

	/// Create SQLiteData struct (USER) with D types.
	/// Params:
	///   d = Pointer to data in D.
	///   t = Type specified.
	static SQLiteData create(void* d, int t) {
		SQLiteData sd;
		sd.pack(d, t);
		return sd;
	}

	/// Template for unpacking data.
	/// Params:
	///   T = Unpacking type.
	///   silent = Throw Exception or return the default value for a mismatched type.
	T unpack(T, bool silent = false)() {
		static if(is(T == int)) {
			if(type == SQLiteDataType.INT) {
				return dataInt;
			} else {
				static if(silent) {
					return 0;
				} else {
					throw new Exception("Not SQLiteDataType.INT");
				}
			}
		} else static if(is(T == long)) {
			if(type == SQLiteDataType.INT64) {
				return dataInt64;
			} else if(type == SQLiteDataType.INT) {
				return dataInt;
			} else {
				static if(silent) {
					return 0;
				} else {
					throw new Exception("Not SQLiteDataType.INT64");
				}
			}
		} else static if(is(T == double)) {
			if(type == SQLiteDataType.DOUBLE) {
				return dataDouble;
			} else {
				static if(silent) {
					return 0;
				} else {
					throw new Exception("Not SQLiteDataType.DOUBLE");
				}
			}
		} else static if(is(T == char[])) {
			if(type == SQLiteDataType.TEXT) {
				return dataText;
			} else {
				static if(silent) {
					return null;
				} else {
					throw new Exception("Not SQLiteDataType.TEXT");
				}
			}
		} else static if(is(T == wchar[])) {
			if(type == SQLiteDataType.TEXT16) {
				return dataText16;
			} else {
				static if(silent) {
					return null;
				} else {
					throw new Exception("Not SQLiteDataType.TEXT16");
				}
			}
		} else static if(is(T == void[])) {
			if(type == SQLiteDataType.BLOB) {
				return dataBlob;
			} else {
				static if(silent) {
					return null;
				} else {
					throw new Exception("Not SQLiteDataType.BLOB");
				}
			}
		} else {
			pragma(msg, "Bad Required Type");
			static if(silent) {
				T v;
				return v;
			} else {
				throw new Exception("Bad Required Type");
			}
		}
	}
}

/**
 * Data type enum.
 */
public enum SQLiteDataType {
	DECL = -2,
	UNDEF = -1,

	INT = 1,
	INT64,
	DOUBLE,
	TEXT,
	TEXT16,
	BLOB,
	NULL,

	USER};

/**
 * Internal data type enum.
 */
public enum SQLiteInternalType {
	INTEGER = SQLITE_INTEGER,
	FLOAT,
	TEXT,
	BLOB,
	NULL};

/// Map SQLite internal data type to the SQLiteD data type.
public int mapIToDType(int t) {
	switch(t) {
		case SQLiteInternalType.INTEGER:
			return SQLiteDataType.INT64;
		case SQLiteInternalType.FLOAT:
			return SQLiteDataType.DOUBLE;
		case SQLiteInternalType.TEXT:
			return SQLiteDataType.TEXT;
		case SQLiteInternalType.BLOB:
			return SQLiteDataType.BLOB;
		case SQLiteInternalType.NULL:
			return SQLiteDataType.NULL;
		default:
			throw new SQLiteDException("Bad Internal Type");
	}
//	return 0; // never reached.
}

/**
 * Interface of the user data adapter.
 */
public interface IUserDataAdapter {
	/// Convert user-defined type data to SQLite3 normal type.
	SQLiteData normalize(SQLiteData userData);
	/// Get the normal type id from a user type id.
	int normalizeType(int userType);
	/// Convert SQLite3 normal type data to user-defined type specified by the type id.
	SQLiteData customize(int userType, SQLiteData data);
}

/**
 * Interface of the declared type to SQLiteDataType mapper.
 */
public interface IDeclTypeMapper {
	/// Map a decl type to a SQLiteDataType.
	int mapDeclType(char[] declType);
}

/**
 * Registerable Decl Type Mapper.
 */
public class RegDeclTypeMapper : IDeclTypeMapper {
	private int[char[]] _reg;
	/// .
	public void registerDeclType(char[] declType, int type) {
		_reg[declType] = type;
	}
	/// .
	public void unregisterDeclType(char[] declType) {
		_reg.remove(declType);
	}
	/// .
	public int mapDeclType(char[] declType) {
		return _reg[declType];
	}
}

/**
 * Structure for SQLite3 column meta info.
 */
public struct SQLiteColumnMeta {
	char[] declType, collationSequence;
	bool isNotNull, isPrimaryKey, isAutoIncrement;
}
//version(SQLITE_ENABLE_COLUMN_METADATA) {
//}

/**
 * SQLite3 text encoding enum.
 */
public enum SQLiteEncoding {
	UTF8 = SQLITE_UTF8,
	UTF16LE = SQLITE_UTF16LE,
	UTF16BE = SQLITE_UTF16BE,
	UTF16 = SQLITE_UTF16,
	ANY = SQLITE_ANY};

version(LittleEndian) {
	const int SQLITE_UTF16_NATIVE = SQLITE_UTF16LE;
} else { // BigEndian
	const int SQLITE_UTF16_NATIVE = SQLITE_UTF16BE;
}

/**
 * SQLiteD Connection.
 */
public class Connection {

	protected sqlite3* _pdb;
	/// Returns: Database pointer for used in low-level SQLite3 API.
	public sqlite3* dbPtr() {
		return _pdb;
	}

	protected char[] _path = null;
	/// Database file path.
	public char[] path() {
		if(_path) return _path.dup;
		else return null;
	}

	/// Is connection available.
	public bool available() {
		return cast(bool)_pdb;
	}

	// indicate Connection closed:
	protected bool _closed = false;
	/// .
	public bool closed() {
		return _closed;
	}

	/// Connection constructor.
	public this() {
        version(Phobos)
            debug writefln("debug: ", this.classinfo.name);
        //else
            //debug Stdout.formatln("debug: {}", this.classinfo.name);
	}
	/// Connection constructor and open the Connection with the specified file name.
	public this(char[] path) {
        version(Phobos)
            debug writefln("debug: ", this.classinfo.name);
        else
            debug Stdout.formatln("debug: {}", this.classinfo.name);
		open(path);
	}
	public ~this() {
        version(Phobos)
            debug writefln("debug: ~", this.classinfo.name);
        else
            debug Stdout.formatln("debug: ~{}", this.classinfo.name);
		if(available()) close();
	}

	/// Open database connection.
	/// Params:
	///   path = Path to SQLite3 database file or ":memory:".
	/// Throws: SQLiteVMException, SQLiteDException.
	public void open(char[] path) {
		if(_closed) throw new SQLiteDException("Connection Has Already Closed");
		if(_pdb) throw new SQLiteDException("Connection Has Already Opened");
		_path = path.dup;
		int errcode = sqlite3_open((path~"\0").ptr, &_pdb);
		if(errcode) {
			throw new SQLiteVMException(errcode, "Can't Open Connection");
		}
	}
	//version(SQLiteDUTF16) {
	//public void open(wchar[] name) {
	//	if(_closed) throw new SQLiteDException("Connection Has Already Closed");
	//	if(_pdb) throw new SQLiteDException("Connection Has Already Opened");
	//	int errcode = sqlite3_open16(name~"\0", &_pdb);
	//	if(errcode) {
	//		throw new SQLiteVMException(errcode, "Can't Open Connection");
	//	}
	//}
	//}

	/// Close database connection.
	/// Connection must be closed before being destroyed,
	/// Before Connection closed, the Cursors and Statements created by this Connection must be closed first.
	/// Throws: SQLiteVMException, SQLiteDException.
	public void close() {
		if(!_pdb) return; // closed or not opened yet.
		int errcode = sqlite3_close(_pdb);
		if(errcode) throw new SQLiteVMException(errcode,
			"Connection Is Still Available, "
			"Close All Cursors And Statements Created By It And Try Again");
		// A closed Connection is not available:
		_pdb = null;
		// A closed Connection can't be re-opened, create a new one instead:
		_closed = true;
	}

	/// Interrupt the database engine execution.
	/// Throws: SQLiteDException.
	public void interrupt() {
		_checkConnectionAvailable();
		sqlite3_interrupt(_pdb);
	}

	/// Set the SQLite3 VM busy timeout.
	/// Throws: SQLiteDException.
	public int setBusyTimeout(int ms) {
		_checkConnectionAvailable();
		return sqlite3_busy_timeout(_pdb, ms);
	}

	/// Mixin to support user functions.
	mixin TXUserFunction;

	/// Mixin to support user aggregates.
	mixin TXUserAggregate;

	/// Mixin to support user collations.
	mixin TXUserCollation;

	/// Mixin to support DB event.
	mixin TXEvent;

	/// Mixin to support DB authorization.
	mixin TXAuth;

	protected IUserDataAdapter _uda;
	/// Adapter to handle user extended data type.
	public IUserDataAdapter userDataAdapter() {
		return _uda;
	}
	/// .
	public IUserDataAdapter userDataAdapter(IUserDataAdapter uda) {
		return _uda = uda;
	}

	protected IDeclTypeMapper _dtm;
	/// Mapper for converting a decl type to the associated SQLiteDataType.
	public IDeclTypeMapper declTypeMapper() {
		return _dtm;
	}
	/// .
	public IDeclTypeMapper declTypeMapper(IDeclTypeMapper dtm) {
		return _dtm = dtm;
	}

	/// Returns: Whether the SQLite3 VM is in the auto-commit mode or not.
	/// Throws: SQLiteDException.
	public bool isAutoCommit() {
		_checkConnectionAvailable();
		return cast(bool) sqlite3_get_autocommit(_pdb);
	}

	/// Begin a transaction.
	/// Throws: SQLiteVMException, SQLiteDException.
	public void beginTransaction() {
		_checkConnectionAvailable();
		int errcode = sqlite3_exec(_pdb, "begin;", null, null, null);
		if(errcode) throw new SQLiteVMException(errcode);
	}
	/// .
	public alias beginTransaction begin;

	/// Commit current transaction.
	/// Throws: SQLiteVMException, SQLiteDException.
	public void commitTransaction() {
		_checkConnectionAvailable();
		int errcode = sqlite3_exec(_pdb, "commit;", null, null, null);
		if(errcode) throw new SQLiteVMException(errcode);
	}
	/// .
	public alias commitTransaction commit;

	/// Rollback current transaction.
	/// Throws: SQLiteVMException, SQLiteDException.
	public void rollbackTransaction() {
		_checkConnectionAvailable();
		int errcode = sqlite3_exec(_pdb, "rollback;", null, null, null);
		if(errcode) throw new SQLiteVMException(errcode);
	}
	/// .
	public alias rollbackTransaction rollback;

	/// Changes by last execution.
	/// Throws: SQLiteDException.
	public int changes() {
		_checkConnectionAvailable();
		return sqlite3_changes(_pdb);
	}

	/// Total changes after connection opened.
	/// Throws: SQLiteDException.
	public int totalChanges() {
		_checkConnectionAvailable();
		return sqlite3_total_changes(_pdb);
	}

	/// Last inserted rowid.
	/// Throws: SQLiteDException.
	public long lastInsertRowId() {
		_checkConnectionAvailable();
		return sqlite3_last_insert_rowid(_pdb);
	}

	version(SQLITE_ENABLE_COLUMN_METADATA) {

	/// Get the column meta info.
	/// Throws: SQLiteVMException, SQLiteDException.
	public SQLiteColumnMeta getColumnMeta(char[] database, char[] table, char[] column) {
		char* dt, cs;
		int nn, pk, ai;
		SQLiteColumnMeta meta;
		_checkConnectionAvailable();
		int errcode = sqlite3_table_column_metadata(_pdb,
			(database~"\0").ptr,
			(table~"\0").ptr,
			(column~"\0").ptr,
			&dt, &cs,
			&nn, &pk, &ai);
		if(errcode) throw new SQLiteVMException(errcode);
		meta.declType = dt[0 .. _strlen(dt)].dup;
		meta.collationSequence = cs[0 .. _strlen(cs)].dup;
		meta.isNotNull = cast(bool)nn;
		meta.isPrimaryKey = cast(bool)pk;
		meta.isAutoIncrement = cast(bool)ai;
		return meta;
	}

	}

	protected void _checkConnectionAvailable() {
		if(!_pdb) throw new SQLiteDException("Connection Not Available");
	}

	/// Create cursor associated to this connection.
	/// Returns: Instance of Cursor.
	/// Throws: SQLiteDException.
	public Cursor createCursor() {
		_checkConnectionAvailable();
		Cursor cur = new Cursor(this);
		return cur;
	}

	/// Create statement associated to this connection.
	/// Returns: Instance of Statement.
	/// Throws: SQLiteDException.
	public Statement createStatement() {
		_checkConnectionAvailable();
		Statement stmt = new Statement(this);
		return stmt;
	}
	/// .
	public Statement createStatement(char[] sql) {
		_checkConnectionAvailable();
		Statement stmt = new Statement(this);
		stmt.prepare(sql);
		return stmt;
	}

	/// Create script (multi-statements) associated to this connection.
	/// Returns: Instance of Script.
	/// Throws: SQLiteDException.
	public Script createScript() {
		_checkConnectionAvailable();
		Script s = new Script(this);
		return s;
	}
	/// .
	public Script createScript(char[] sql) {
		_checkConnectionAvailable();
		Script s = new Script(this);
		s.feed(sql);
		return s;
	}

	/// Get last error code.
	/// Throws: SQLiteDException.
	public int getErrorCode() {
		_checkConnectionAvailable();
		return sqlite3_errcode(_pdb);
	}
	/// Get last error description.
	/// Throws: SQLiteDException.
	public char[] getErrorText() {
		_checkConnectionAvailable();
		char* msg = sqlite3_errmsg(_pdb);
		return msg[0 .. _strlen(msg)];
	}
	/// .
	public wchar[] getErrorText16() {
		_checkConnectionAvailable();
		wchar* msg = cast(wchar*)sqlite3_errmsg16(_pdb);
		return msg[0 .. _wcslen(msg)];
	}

	public void setEnabledExtendedErrorCodes(bool v) {
		int r = sqlite3_extended_result_codes(_pdb, v);
	}

}

/**
 * SQLiteD Statement.
 */
public class Statement {

	protected Connection _con;
	/// Returns: Database Connection of Statement.
	public Connection connection() {
		return _con;
	}

	//protected sqlite3* _pdb;
	protected sqlite3* _pdb() {
		return _con._pdb;
	}
	/// Returns: Database pointer for used in low-level SQLite3 API.
	public sqlite3* dbPtr() {
		return _con._pdb;
	}

	protected sqlite3_stmt* _pstmt;
	/// Returns: Stmt pointer for used in low-level SQLite3 API.
	public sqlite3_stmt* stmtPtr() {
		return _pstmt;
	}

	protected char[] _sql = null;
	/// SQL Text representation of Statement.
	public char[] sql() {
		if(_sql) return _sql.dup;
		else return null;
	}
	deprecated public alias sql sqlText;

	protected this(Connection con) {
		_con = con;
		//_pdb = con._pdb;
	}

	public ~this() {
        version(Phobos)
            debug writefln("debug: ~", this.classinfo.name);
        //else
            //debug Stdout.formatln("debug: ~{}", this.classinfo.name);
		if(_pstmt) finalize();
	}

	/// Is Statement available.
	public bool available() {
		return cast(bool)_pstmt;
	}

	protected void _checkStatementAvailable() {
		if(!_pstmt) throw new SQLiteDException("Statement Not Available");
	}

	protected void _checkConnectionAvailable() {
		if(!_con.available) {
			throw new SQLiteDException("Connection Not Available");
		}
	}

	/// Prepare the Statement.
	/// Params:
	///   sql = SQL text to be prepare.
	/// Returns: Error code returned by the SQLite VM.
	/// Throws: SQLiteDException.
	public int prepare(char[] sql) {
		_checkConnectionAvailable();
		if(_pstmt) finalize();
		//_sql = sql.dup;
		//return sqlite3_prepare_v2(_pdb, sql.ptr, sql.length, &_pstmt, null);
		char* ptail;
		int errcode = sqlite3_prepare_v2(_pdb, sql.ptr, sql.length, &_pstmt, &ptail);
		_sql = sql[0 .. (ptail-sql.ptr)].dup;
		return errcode;
	}

	/// Prepare the Statement, output the remainder.
	/// Params:
	///   sql = SQL text to be prepare.
	///   rsql = Out param to place the remainder, can be the same as sql.
	/// Returns: Error code returned by the SQLite VM.
	/// Throws: SQLiteDException.
	public int prepare(char[] sql, out char[] rsql) {
		_checkConnectionAvailable();
		if(_pstmt) finalize();
		char* ptail;
		int errcode = sqlite3_prepare_v2(_pdb, sql.ptr, sql.length, &_pstmt, &ptail);
		_sql = sql[0 .. (ptail-sql.ptr)].dup;
		rsql = sql[(ptail-sql.ptr) .. $]; // not .dup
		return errcode;
	}

	/// Compile the Statement.
	/// Same as prepare but throw SQLiteVMException when compilation error occurrence.
	/// Throws: SQLiteDException, SQLiteVMException.
	public void compile(char[] sql) {
		int errcode = prepare(sql);
		if(errcode) throw new SQLiteVMException(errcode);
	}
	/// .
	public void compile(char[] sql, out char[] rsql) {
		int errcode = prepare(sql, rsql);
		if(errcode) throw new SQLiteVMException(errcode);
	}

	/// Bind parameters to Statement.
	/// Throws: SQLiteDException, SQLiteVMException.
	public void bindParameters(SQLiteData[] params) {
		foreach(int i, SQLiteData d; params) {
			bindParameter(i, d);
		}
	}

	/// .
	public void bindParameters(SQLiteData[char[]] params) {
		foreach(char[] n, SQLiteData d; params) {
			bindParameter(getParameterIndex(n), d);
		}
	}

	/// .
	public void bindParameters(...) {
		bindParameters(_arguments, _argptr);
	}

	public void bindParameters(TypeInfo[] _arguments, void* _argptr) {
		for(int i= 0; i < _arguments.length; i++) {
			if(_arguments[i] == typeid(int)) {
				bindParameter(i, va_arg!(int)(_argptr));
			} else if(_arguments[i] == typeid(long)) {
				bindParameter(i, va_arg!(long)(_argptr));
			} else if(_arguments[i] == typeid(double)) {
				bindParameter(i, va_arg!(double)(_argptr));
			} else if(_arguments[i] == typeid(char[])) {
				bindParameter(i, va_arg!(char[])(_argptr));
			} else if(_arguments[i] == typeid(wchar[])) {
				bindParameter(i, va_arg!(wchar[])(_argptr));
			} else if(_arguments[i] == typeid(void[])) {
				bindParameter(i, va_arg!(void[])(_argptr));
			} else if(_arguments[i] == typeid(SQLiteData)) {
				bindParameter(i, va_arg!(SQLiteData)(_argptr));
			} else {
				throw new SQLiteDException("Invalid Parameter Type");
			}
		}
	}

	/// Bind parameter to Statement.
	/// Params:
	///   index = Index of parameter, 0-based.
	///   param = The parameter.
	/// Throws: SQLiteDException, SQLiteVMException.
	public void bindParameter(int index, SQLiteData param) {
		_checkStatementAvailable();
		// filter extended data types to a SQLite3 storage type:
		if(param.type > SQLiteDataType.USER && _con._uda !is null) {
			param = _con._uda.normalize(param);
		}
		index++; // 0-based to 1-based.
		int errcode; // OK/RANGE/NOMEM/MISUSE
		switch(param.type) {
			case SQLiteDataType.INT:
				errcode = sqlite3_bind_int(_pstmt, index, param.dataInt);
				break;
			case SQLiteDataType.INT64:
				errcode = sqlite3_bind_int64(_pstmt, index, param.dataInt64);
				break;
			case SQLiteDataType.DOUBLE:
				errcode = sqlite3_bind_double(_pstmt, index, param.dataDouble);
				break;
			case SQLiteDataType.TEXT:
				errcode = sqlite3_bind_text(_pstmt, index, param.dataText.ptr, param.dataText.length, SQLITE_TRANSIENT);
				break;
			case SQLiteDataType.TEXT16:
				errcode = sqlite3_bind_text16(_pstmt, index, param.dataText16.ptr, param.dataText16.length * 2, SQLITE_TRANSIENT);
				break;
			case SQLiteDataType.BLOB:
				errcode = sqlite3_bind_blob(_pstmt, index, param.dataBlob.ptr, param.dataBlob.length, SQLITE_TRANSIENT);
				break;
			case SQLiteDataType.NULL:
				errcode = sqlite3_bind_null(_pstmt, index);
				break;
			default:
				throw new SQLiteDException("Invalid Parameter (SQLiteData)Type");
		}
		if(errcode) throw new SQLiteVMException(errcode);
	}

	/// .
	public void bindParameter(int index, int param) {
		_checkStatementAvailable();
		int errcode = sqlite3_bind_int(_pstmt, index + 1, param);
		if(errcode) throw new SQLiteVMException(errcode);
	}

	/// .
	public void bindParameter(int index, long param) {
		_checkStatementAvailable();
		int errcode = sqlite3_bind_int64(_pstmt, index + 1, param);
		if(errcode) throw new SQLiteVMException(errcode);
	}

	/// .
	public void bindParameter(int index, double param) {
		_checkStatementAvailable();
		int errcode = sqlite3_bind_double(_pstmt, index + 1, param);
		if(errcode) throw new SQLiteVMException(errcode);
	}

	/// .
	public void bindParameter(int index, char[] param) {
		_checkStatementAvailable();
		int errcode = sqlite3_bind_text(_pstmt, index + 1, param.ptr, param.length, SQLITE_TRANSIENT);
		if(errcode) throw new SQLiteVMException(errcode);
	}

	/// .
	public void bindParameter(int index, wchar[] param) {
		_checkStatementAvailable();
		int errcode = sqlite3_bind_text16(_pstmt, index + 1, param.ptr, param.length * 2, SQLITE_TRANSIENT);
		if(errcode) throw new SQLiteVMException(errcode);
	}

	/// .
	public void bindParameter(int index, void[] param) {
		_checkStatementAvailable();
		int errcode = sqlite3_bind_blob(_pstmt, index + 1, param.ptr, param.length, SQLITE_TRANSIENT);
		if(errcode) throw new SQLiteVMException(errcode);
	}

	/// .
	/// Use the memory outside VM, no transient.
	public void bindParameterE(int index, char[] param) {
		_checkStatementAvailable();
		int errcode = sqlite3_bind_text(_pstmt, index + 1, param.ptr, param.length, SQLITE_STATIC);
		if(errcode) throw new SQLiteVMException(errcode);
	}
	/// .
	public void bindParameterE(int index, wchar[] param) {
		_checkStatementAvailable();
		int errcode = sqlite3_bind_text16(_pstmt, index + 1, param.ptr, param.length * 2, SQLITE_STATIC);
		if(errcode) throw new SQLiteVMException(errcode);
	}
	/// .
	public void bindParameterE(int index, void[] param) {
		_checkStatementAvailable();
		int errcode = sqlite3_bind_blob(_pstmt, index + 1, param.ptr, param.length, SQLITE_STATIC);
		if(errcode) throw new SQLiteVMException(errcode);
	}

	/// .
	public void bindParameterNull(int index) {
		_checkStatementAvailable();
		int errcode = sqlite3_bind_null(_pstmt, index + 1);
		if(errcode) throw new SQLiteVMException(errcode);
	}
	/// .
	public alias bindParameterNull clearParameter;

	/// Get parameters count.
	public int getParameterCount() {
		_checkStatementAvailable();
		return sqlite3_bind_parameter_count(_pstmt);
	}
	/// Get index from parameter name.
	public int getParameterIndex(char[] name) {
		_checkStatementAvailable();
		return sqlite3_bind_parameter_index(_pstmt, (name~"\0").ptr) - 1;
	}
	/// Get name from parameter index.
	public char[] getParameterName(int index) {
		_checkStatementAvailable();
		char* n = sqlite3_bind_parameter_name(_pstmt, index + 1);
		if(n == null) return null;
		return n[0 .. _strlen(n)].dup;
	}

	/// Set all parameters to null.
	public void clearParameters() {
		int c = getParameterCount(); // check included.
		for(size_t i= 1; i <= c; i++) sqlite3_bind_null(_pstmt, i);
		//this function is in the sqlite3.h,
		//but has not been actually implemented (exported):
		//sqlite3_clear_bindings(_pstmt);
	}

	/// Transfer parameters to another Statement.
	/// Throws: SQLiteDException.
	public int transferParameters(Statement stmt) {
		_checkStatementAvailable();
		stmt._checkStatementAvailable();
		return sqlite3_transfer_bindings(this._pstmt, stmt._pstmt);
	}

	/// Step Statement execution, direct call on this is not recommended.
	/// Throws: SQLiteDException.
	public int step() {
		_checkStatementAvailable();
		return sqlite3_step(_pstmt);// DONE/ROW/BUSY/ERROR/MISUSE
	}

	//protected int _step() {
	//	return sqlite3_step(_pstmt);// DONE/ROW/BUSY/ERROR/MISUSE
	//}

	/// Reset Statement.
	/// Throws: SQLiteDException.
	public int reset() {
		_checkStatementAvailable();
		return sqlite3_reset(_pstmt);
	}

	// finalize statement and release resource.
	protected int finalize() {
		int errcode = sqlite3_finalize(_pstmt);
		if(!errcode) _pstmt = null;
		return errcode;// OK/ABORT
	}

	/// Close Statement.
	/// Statement must be closed before being destroyed.
	/// Throws: SQLiteVMException.
	public void close() {
		if(_pstmt) {
			int errcode = finalize();
			if(errcode) throw new SQLiteVMException(errcode);
		}
	}

	/// Is Statement expired.
	public bool isExpired() {
		if(!_pstmt) return true;
		return cast(bool) sqlite3_expired(_pstmt);
	}

	/// Returns: True for a SQL SELECT statement.
	/// (Test the column count to determine whether it is a SELECT statement.)
	public bool isSqlSelect() {
		if(!_pstmt) return false;
		return cast(bool)(sqlite3_column_count(_pstmt) > 0);
	}

	/// Get column count.
	/// Throws: SQLiteDException.
	public int getColumnCount() {
		_checkStatementAvailable();
		return sqlite3_column_count(_pstmt);
	}

	/// Get data count.
	/// Throws: SQLiteDException.
	public int getDataCount() {
		_checkStatementAvailable();
		return sqlite3_data_count(_pstmt);
	}

	protected void _checkDataAvailable(int iCol) {
		if(getDataCount() < iCol + 1) {
			throw new SQLiteDException("Not A Row Or Column Index Out Of Range");
		}
	}
	protected void _checkColumnAvailable(int iCol) {
		if(getColumnCount() < iCol + 1) {
			throw new SQLiteDException("Not <Select> Or Column Index Out Of Range");
		}
	}

	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public int getColumnInt(int iCol) {
		_checkDataAvailable(iCol);
		return sqlite3_column_int(_pstmt, iCol);
	}
	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public long getColumnInt64(int iCol) {
		_checkDataAvailable(iCol);
		return sqlite3_column_int64(_pstmt, iCol);
	}
	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public double getColumnDouble(int iCol) {
		_checkDataAvailable(iCol);
		return sqlite3_column_double(_pstmt, iCol);
	}
	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public char[] getColumnText(int iCol) {
		_checkDataAvailable(iCol);
		return sqlite3_column_text(_pstmt, iCol)[0 .. sqlite3_column_bytes(_pstmt, iCol)].dup;
	}
	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public wchar[] getColumnText16(int iCol) {
		_checkDataAvailable(iCol);
		return cast(wchar[])sqlite3_column_text16(_pstmt, iCol)[0 .. sqlite3_column_bytes16(_pstmt, iCol)/2].dup;
	}
	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public void[] getColumnBlob(int iCol) {
		_checkDataAvailable(iCol);
		return sqlite3_column_blob(_pstmt, iCol)[0 .. sqlite3_column_bytes(_pstmt, iCol)].dup;
	}
	/// Get column data.
	/// Use VM internal memory,
	/// the memory block is likely to be free after Statement finalized.
	public char[] getColumnTextI(int iCol) {
		_checkDataAvailable(iCol);
		return sqlite3_column_text(_pstmt, iCol)[0 .. sqlite3_column_bytes(_pstmt, iCol)];
	}
	/// Get column data.
	/// Use VM internal memory.
	public wchar[] getColumnText16I(int iCol) {
		_checkDataAvailable(iCol);
		return cast(wchar[])sqlite3_column_text16(_pstmt, iCol)[0 .. sqlite3_column_bytes16(_pstmt, iCol)/2];
	}
	/// Get column data.
	/// Use VM internal memory.
	public void[] getColumnBlobI(int iCol) {
		_checkDataAvailable(iCol);
		return sqlite3_column_blob(_pstmt, iCol)[0 .. sqlite3_column_bytes(_pstmt, iCol)];
	}

	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	///   type = Required data type.
	/// Throws: SQLiteDException.
	public SQLiteData getColumnData(int iCol, int type = -1) {
		SQLiteData d;
		if(type == -1) { // use internal storage type
			type = mapIToDType(getColumnInternalType(iCol));
		} else if(type == -2 && _con._dtm !is null) { // use column decl type
			type = _con._dtm.mapDeclType(getColumnDeclType(iCol));
		}
		// get storage type for the extended user data type:
		if(type > SQLiteDataType.USER && _con._uda !is null) {
			d.type = _con._uda.normalizeType(type);
		} else {
			d.type = type;
		}
		switch(type) {
			case SQLiteDataType.INT:
				d.dataInt = getColumnInt(iCol);
				break;
			case SQLiteDataType.INT64:
				d.dataInt64 = getColumnInt64(iCol);
				break;
			case SQLiteDataType.DOUBLE:
				d.dataDouble = getColumnDouble(iCol);
				break;
			case SQLiteDataType.TEXT:
				d.dataText = getColumnText(iCol);
				break;
			case SQLiteDataType.TEXT16:
				d.dataText16 = getColumnText16(iCol);
				break;
			case SQLiteDataType.BLOB:
				d.dataBlob = getColumnBlob(iCol);
				break;
			case SQLiteDataType.NULL:
				break;
			default:
				throw new SQLiteDException("Invalid Parameter Type");
		}
		// adapter to handle extended data type:
		if(d.type != type) d = _con._uda.customize(type, d);
		return d;
	}

	/// Get column type.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public int getColumnInternalType(int iCol) {
		_checkDataAvailable(iCol);
		return sqlite3_column_type(_pstmt, iCol);
	}

	/// Get column declared type.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public char[] getColumnDeclType(int iCol) {
		_checkColumnAvailable(iCol);
		char* t = sqlite3_column_decltype(_pstmt, iCol);
		if(t == null) return null;
		return t[0 .. _strlen(t)].dup;
	}
	/// .
	public wchar[] getColumnDeclType16(int iCol) {
		_checkColumnAvailable(iCol);
		wchar* t = cast(wchar*)sqlite3_column_decltype16(_pstmt, iCol);
		if(t == null) return null;
		return t[0 .. _wcslen(t)].dup;
	}

	/// Get column name.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public char[] getColumnName(int iCol) {
		_checkColumnAvailable(iCol);
		char* t = sqlite3_column_name(_pstmt, iCol);
		if(t == null) return null;
		return t[0 .. _strlen(t)].dup;
	}
	/// .
	public wchar[] getColumnName16(int iCol) {
		_checkColumnAvailable(iCol);
		wchar* t = cast(wchar*)sqlite3_column_name16(_pstmt, iCol);
		if(t == null) return null;
		return t[0 .. _wcslen(t)].dup;
	}

	// need the sqlite3 lib compiled with the "SQLITE_ENABLE_COLUMN_METADATA" symbol defined:

	version(SQLITE_ENABLE_COLUMN_METADATA) {

	/// .
	public char[] getColumnOriginName(int iCol) {
		_checkColumnAvailable(iCol);
		char* t = sqlite3_column_origin_name(_pstmt, iCol);
		if(t == null) return null;
		return t[0 .. _strlen(t)].dup;
	}
	/// .
	public wchar[] getColumnOriginName16(int iCol) {
		_checkColumnAvailable(iCol);
		wchar* t = cast(wchar*)sqlite3_column_origin_name16(_pstmt, iCol);
		if(t == null) return null;
		return t[0 .. _wcslen(t)].dup;
	}

	/// .
	public char[] getColumnTableName(int iCol) {
		_checkColumnAvailable(iCol);
		char* t = sqlite3_column_table_name(_pstmt, iCol);
		if(t == null) return null;
		return t[0 .. _strlen(t)].dup;
	}
	/// .
	public wchar[] getColumnTableName16(int iCol) {
		_checkColumnAvailable(iCol);
		wchar* t = cast(wchar*)sqlite3_column_table_name16(_pstmt, iCol);
		if(t == null) return null;
		return t[0 .. _wcslen(t)].dup;
	}

	/// .
	public char[] getColumnDatabaseName(int iCol) {
		_checkColumnAvailable(iCol);
		char* t = sqlite3_column_database_name(_pstmt, iCol);
		if(t == null) return null;
		return t[0 .. _strlen(t)].dup;
	}
	/// .
	public wchar[] getColumnDatabaseName16(int iCol) {
		_checkColumnAvailable(iCol);
		wchar* t = cast(wchar*)sqlite3_column_database_name16(_pstmt, iCol);
		if(t == null) return null;
		return t[0 .. _wcslen(t)].dup;
	}

	}

}

/**
 * SQLiteD Script, for the batch execution.
 */
public class Script {

	private Connection _con;
	/// Returns: Database Connection of Script.
	public Connection connection() {
		return _con;
	}

	protected this(Connection con) {
		_con = con;
	}
	public ~this() {
        version(Phobos)
            debug writefln("debug: ~", this.classinfo.name);
        //else
            //debug Stdout.formatln("debug: ~{}", this.classinfo.name);
	}

	private char[] _sql;
	/// Returns: Text representation of the SQL script.
	public char[] sql() {
		return _sql; // not .dup
	}
	deprecated public alias sql sqlText;

	private char[] _csql;
	/// Feed SQL script text in.
	public void feed(char[] sql) {
		_sql = _csql = sql; // not .dup, may be a large script.
		_sc = 0;
	}
	/// Reset to the start of the script, after getStatement's.
	public void reset() {
		_csql = _sql;
		_sc = 0;
	}

	private int _sc = 0;
	/// .
	public int statementCount() {
		return _sc;
	}

	/// Get the next Statement, return null if the end is reached.
	/// Throws: SQLiteDException, SQLiteVMException.
	public Statement getStatement() {
		if(!_csql.length) return null;
		Statement stmt = _con.createStatement();
		int errcode = stmt.prepare(_csql, _csql);
		if(errcode) throw new SQLiteVMException(errcode);
		if(!stmt.available) return null; // white text.
		_sc++;
		return stmt;
	}

	/// .
	public int opApply(int delegate(inout Statement stmt) dg) {
		int r;
		Statement stmt;
		while((stmt = getStatement()) !is null) {
			r = dg(stmt);
			if(r) break;
		}
		return r;
	}

}

/**
 * SQLiteD Cursor.
 */
public class Cursor {

	protected Connection _con;
	/// Returns: Database Connection of Statement.
	public Connection connection() {
		return _con;
	}

	// inside Statement created by self:
	protected Statement _cstmt;
	// Statement currently executed:
	protected Statement _stmt;
	public Statement statement() {
		return _stmt;
	}

	// indicate Cursor closed:
	protected bool _closed = false;
	/// .
	public bool closed() {
		return _closed;
	}

	protected this(Connection con) {
        version(Phobos)
            debug writefln("debug: ", this.classinfo.name);
        else
            debug Stdout.formatln("debug: {}", this.classinfo.name);
		_con = con;
		_cstmt = con.createStatement();
	}
	public ~this() {
        version(Phobos)
		debug writefln("debug: ~", this.classinfo.name);
        else
            debug Stdout.formatln("debug: ~{}", this.classinfo.name);
	}

	/// Close Cursor.
	/// Cursor must be closed before being destroyed.
	public void close() {
		_cstmt.close();
		// A closed Cursor can't execute new SQL statements,
		// _stmt (next, reset, data...) still available if a outside Statement is used?
		_closed = true;
	}

	protected void checkClosed() {
		if(_closed) throw new SQLiteDException("Cursor Has Already Closed");
	}

	/// Is Cursor executing a SQL SELECT statement.
	/// (Test the column count to determine whether it is a SELECT statement.)
	public bool isSqlSelect() {
		if(!_stmt.available()) return false;
		return cast(bool)(_stmt.getColumnCount() > 0);
	}

	/// Is Cursor position a row.
	public bool isRow() {
		if(!_stmt.available()) return false;
		return cast(bool)(_stmt.getDataCount() > 0);
	}
	//private bool _isRow;

	private int _affectedRows = 0;
	/// Affected rows by last execution, (INSERT/DELETE/UPDATE).
	/// For a SELECT statement, return the rows count currently reached.
	public int affectedRows() {
		return _affectedRows;
	}

	/// Execute SQL statement.
	/// Params:
	///   sql = SQL statement text.
	/// Returns: true if cursor position is a row.
	/// Throws: SQLiteDException, SQLiteVMException.
	public bool execute(char[] sql) {
		checkClosed();
		int errcode;
		if(_cstmt.available) {
			errcode = _cstmt.finalize();
			if(errcode) throw new SQLiteVMException(errcode);
		}
		errcode = _cstmt.prepare(sql);
		if(errcode) throw new SQLiteVMException(errcode);
		return execute(_cstmt);
	}
	/// Execute SQL statement with parameters.
	/// Params:
	///   sql = SQL statement text.
	///   params = Parameters to be bound to statement.
	/// Returns: true if cursor position is a row.
	/// Throws: SQLiteDException, SQLiteVMException.
	public bool execute(char[] sql, SQLiteData[] params) {
		checkClosed();
		int errcode;
		if(_cstmt.available) {
			errcode = _cstmt.finalize();
			if(errcode) throw new SQLiteVMException(errcode);
		}
		errcode = _cstmt.prepare(sql);
		if(errcode) throw new SQLiteVMException(errcode);
		_cstmt.bindParameters(params);
		return execute(_cstmt);
	}
	/// .
	public bool execute(char[] sql, SQLiteData[char[]] params) {
		checkClosed();
		int errcode;
		if(_cstmt.available) {
			errcode = _cstmt.finalize();
			if(errcode) throw new SQLiteVMException(errcode);
		}
		errcode = _cstmt.prepare(sql);
		if(errcode) throw new SQLiteVMException(errcode);
		_cstmt.bindParameters(params);
		return execute(_cstmt);
	}

	/// .
	public bool vaExecute(char[] sql, ...) {
		return vaExecute(sql, _arguments, _argptr);
	}

	public bool vaExecute(char[] sql, TypeInfo[] _arguments, void* _argptr) {
		checkClosed();
		int errcode;
		if(_cstmt.available) {
			errcode = _cstmt.finalize();
			if(errcode) throw new SQLiteVMException(errcode);
		}
		errcode = _cstmt.prepare(sql);
		if(errcode) throw new SQLiteVMException(errcode);
		_cstmt.bindParameters(_arguments, _argptr);
		return execute(_cstmt);
	}

	/// Execute SQL statement.
	/// Params:
	///   stmt = Prepared SQL Statement.
	/// Returns: true if cursor position is a row.
	/// Throws: SQLiteDException, SQLiteVMException.
	public bool execute(Statement stmt) {
		checkClosed();
		if(stmt._con !is _con) throw new SQLiteDException("Same Connection Required");
		int errcode;
		_stmt = stmt;
		_stmt.reset(); // reset the statement, available check included.
		_affectedRows = 0;
		errcode = _stmt.step();
		if(errcode == SQLITE_ROW) {
			//_isRow = true;
			_affectedRows = 1;
			return true;
		} else {
			//_isRow = false;
			if(errcode == SQLITE_DONE) {
				if(!isSqlSelect) _affectedRows = _con.changes;
				return false;
			} else {
				throw new SQLiteVMException(errcode);
			}
		}
	}

	/// Execute SQL script.
	/// Params:
	///   sql = The SQL script text.
	///   callback = Callback which takes the Cursor object as the argument.
	/// Returns: Nothing.
	/// Throws: SQLiteDException, SQLiteVMException.
	public void executeScript(char[] sql, void delegate(Cursor cur) callback) {
		checkClosed();
		Script scr = _con.createScript();
		scr.feed(sql);
		executeScript(scr, callback);
	}
	/// Execute SQL script.
	/// Params:
	///   scr = The SQL Script object.
	///   callback = Callback which takes the Cursor object as the argument.
	/// Returns: Nothing.
	/// Throws: SQLiteDException, SQLiteVMException.
	public void executeScript(Script scr, void delegate(Cursor cur) callback) {
		checkClosed();
		foreach(Statement stmt; scr) {
			bool isr = execute(stmt);
			while(isr) {
				callback(this);
				isr = next();
			}
			stmt.finalize();
		}
	}
	/// Execute SQL script.
	/// .
	/// Break if callback return non-zero.
	public void executeScript(char[] sql, int delegate(Cursor cur) callback) {
		checkClosed();
		Script scr = _con.createScript();
		scr.feed(sql);
		executeScript(scr, callback);
	}
	/// Execute SQL script.
	/// .
	/// Break if callback return non-zero.
	public void executeScript(Script scr, int delegate(Cursor cur) callback) {
		checkClosed();
		foreach(Statement stmt; scr) {
			bool isr = execute(stmt);
			while(isr) {
				if(callback(this)) break;
				isr = next();
			}
			stmt.finalize();
		}
	}

	/// Move Cursor to next position.
	/// Returns: true if cursor position is a row.
	/// Throws: SQLiteDException, SQLiteVMException.
	public bool next() {
		int errcode;
		errcode = _stmt.step(); // available check included.
		if(errcode == SQLITE_ROW) {
			//_isRow = true;
			_affectedRows++;
			return true;
		} else {
			//_isRow = false;
			if(errcode == SQLITE_DONE) {
				if(!isSqlSelect) _affectedRows = _con.changes;
				return false;
			} else {
				throw new SQLiteVMException(errcode);
			}
		}
	}

	/// Reset Cursor (to first position).
	/// Throws: SQLiteDException, SQLiteVMException.
	public void reset() {
		int errcode;
		errcode = _stmt.reset(); // available check included.
		if(errcode) throw new SQLiteVMException(errcode);
		_affectedRows = 0;
	}

	/// Step until reaching the SQLITE_DONE, mainly for test purpose.
	/// Throws: SQLiteDException, SQLiteVMException.
	public void done() {
		if(isRow()) for(;next();) {}
	}

	/// Fetch a row.
	/// Params:
	///   types = Required data types, null for all -1.
	/// Returns: Array of column data.
	/// Throws: SQLiteDException, SQLiteVMException.
	public SQLiteData[] fetchOne(int[] types = null) {
		int width = _stmt.getDataCount();
		if(!width) return null;
		SQLiteData[] r = new SQLiteData[width];
		if(types is null) {
			for(size_t i= 0; i < width; i++) {
				r[i] = _stmt.getColumnData(i);
			}
		} else {
			for(size_t i= 0; i < width; i++) {
				r[i] = _stmt.getColumnData(i, types[i]);
			}
		}
		next();
		return r;
	}

	/// Fetch all rows.
	/// Params:
	///   types = Required data types.
	/// Returns: Array of array of column data.
	/// Throws: SQLiteDException, SQLiteVMException.
	public SQLiteData[][] fetchAll(int[] types = null) {
		mixin TXArrayEx!(SQLiteData[]);
		SQLiteData[] r;
		while((r = fetchOne(types)) !is null) {
			push(r);
		}
		return pack();
	}

	/// Fetch rows.
	/// Params:
	///   n = Number of rows.
	///   types = Required data types.
	/// Returns: Array of array of column data.
	/// Throws: SQLiteDException, SQLiteVMException.
	public SQLiteData[][] fetch(int n, int[] types = null) {
		SQLiteData[][] rs = new SQLiteData[][n];
		for(size_t i= 0; i < n; i++) {
			SQLiteData[] r = fetchOne(types);
			if(r is null) {
				rs.length = i;
				break;
			}
			rs[i] = r;
		}
		return rs;
	}
	/// .
	public alias fetch fetchRows;

	protected void _checkConnectionAvailable() {
		if(!_con.available) {
			throw new SQLiteDException("Connection Not Available");
		}
	}

	protected void _checkStatementAvailable() {
		if(!_stmt.available) {
			throw new SQLiteDException("Statement Not Available");
		}
	}

	/// Get column count, (SQL compile-time).
	/// Throws: SQLiteDException.
	public int getColumnCount() {
		return _stmt.getColumnCount();
	}

	/// Get data count, (SQL exec-time).
	/// Throws: SQLiteDException.
	public int getDataCount() {
		return _stmt.getDataCount();
	}

	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public int getColumnInt(int iCol) {
		return _stmt.getColumnInt(iCol);
	}
	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public long getColumnInt64(int iCol) {
		return _stmt.getColumnInt64(iCol);
	}
	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public double getColumnDouble(int iCol) {
		return _stmt.getColumnDouble(iCol);
	}
	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public char[] getColumnText(int iCol) {
		return _stmt.getColumnText(iCol);
	}
	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public wchar[] getColumnText16(int iCol) {
		return _stmt.getColumnText16(iCol);
	}
	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public void[] getColumnBlob(int iCol) {
		return _stmt.getColumnBlob(iCol);
	}

	/// Get column data.
	/// Params:
	///   iCol = Index of column, 0-based.
	///   type = Required data type.
	/// Throws: SQLiteDException.
	public SQLiteData getColumnData(int iCol, int type = -1) {
		return _stmt.getColumnData(iCol, type);
	}

	/// Get column type.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public int getColumnInternalType(int iCol) {
		return _stmt.getColumnInternalType(iCol);
	}

	/// Get column declared type.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public char[] getColumnDeclType(int iCol) {
		return _stmt.getColumnDeclType(iCol);
	}
	/// .
	public wchar[] getColumnDeclType16(int iCol) {
		return _stmt.getColumnDeclType16(iCol);
	}

	/// Get column name.
	/// Params:
	///   iCol = Index of column, 0-based.
	/// Throws: SQLiteDException.
	public char[] getColumnName(int iCol) {
		return _stmt.getColumnName(iCol);
	}
	/// .
	public wchar[] getColumnName16(int iCol) {
		return _stmt.getColumnName16(iCol);
	}

	/// Need the sqlite3 lib compiled with the "SQLITE_ENABLE_COLUMN_METADATA" symbol defined:

	version(SQLITE_ENABLE_COLUMN_METADATA) {

	/// .
	public char[] getColumnOriginName(int iCol) {
		return _stmt.getColumnOriginName(iCol);
	}
	/// .
	public wchar[] getColumnOriginName16(int iCol) {
		return _stmt.getColumnOriginName16(iCol);
	}

	/// .
	public char[] getColumnTableName(int iCol) {
		return _stmt.getColumnTableName(iCol);
	}
	/// .
	public wchar[] getColumnTableName16(int iCol) {
		return _stmt.getColumnTableName16(iCol);
	}

	/// .
	public char[] getColumnDatabaseName(int iCol) {
		return _stmt.getColumnDatabaseName(iCol);
	}
	/// .
	public wchar[] getColumnDatabaseName16(int iCol) {
		return _stmt.getColumnDatabaseName16(iCol);
	}

	}

}
