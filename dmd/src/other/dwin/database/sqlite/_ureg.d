/**
 * support for user defined function, aggregate and collation.
 * icee, 2006.
 */

module dwin.database.sqlite._ureg;

private import dwin.database.sqlite.c.sqlite3;
private import dwin.database.sqlite.Base;


/**
 * Template for mixin helper methods to extract arguments
 * from user-defined function/aggregate execution context and set the result.
 */
package template TXCallEnv() {

	protected sqlite3_context* _ctx;
	protected int _argc;
	protected sqlite3_value** _argp;

	/// Initialize the execution enviroment.
	public void initialize(sqlite3_context* ctx, int argc, sqlite3_value** argp) {
		_ctx = ctx;
		_argc = argc;
		_argp = argp;
	}

	/// Get a argument and move the pointer forward by 1 pos.
	protected int getArgInt() {
		return sqlite3_value_int(*_argp++);
	}
	/// .
	protected long getArgInt64() {
		return sqlite3_value_int64(*_argp++);
	}
	/// .
	protected double getArgDouble() {
		return sqlite3_value_double(*_argp++);
	}
	/// .
	protected char[] getArgText() {
		char[] r = sqlite3_value_text(*_argp)[0 .. sqlite3_value_bytes(*_argp)];
		_argp++;
		return r;
	}
	/// .
	protected wchar[] getArgText16() {
		wchar[] r = cast(wchar[]) sqlite3_value_text16(*_argp)[0 .. sqlite3_value_bytes16(*_argp)/2];
		_argp++;
		return r;
	}
	/// .
	protected void[] getArgBlob() {
		void[] r = sqlite3_value_blob(*_argp)[0 .. sqlite3_value_bytes(*_argp)];
		_argp++;
		return r;
	}
	/// Move the arg pointer forward 1 pos, for a null arg or just to skip it.
	/// Return: Nothing.
	protected void getArgNull() {
		_argp++;
	}
	/// Move the arg pointer backward 1 pos.
	protected void getArgBack() {
		_argp--;
	}
	/// Return: The argument count.
	protected int getArgCount() {
		return _argc;
	}
	/// Return: The argument type.
	protected int getArgType() {
		return sqlite3_value_type(*_argp);
	}
	/// .
	protected SQLiteData getArgData(int type = -1) {
		SQLiteData d;
		if(type < 0) type = mapIToDType(getArgType());
		d.type = type;
		switch(type) {
			case SQLiteDataType.INT:
				d.dataInt = getArgInt();
				break;
			case SQLiteDataType.INT64:
				d.dataInt64 = getArgInt64();
				break;
			case SQLiteDataType.DOUBLE:
				d.dataDouble = getArgDouble();
				break;
			case SQLiteDataType.TEXT:
				d.dataText = getArgText();
				break;
			case SQLiteDataType.TEXT16:
				d.dataText16 = getArgText16();
				break;
			case SQLiteDataType.BLOB:
				d.dataBlob = getArgBlob();
				break;
			case SQLiteDataType.NULL:
				getArgNull();
				break;
			default:
				throw new SQLiteDException("Bad Data Type");
		}
		return d;
	}
	protected sqlite3_value* getArgValuePtr() {
		return *_argp++;
	}

	/// Set the result.
	protected void setResult(int r) {
		sqlite3_result_int(_ctx, r);
	}
	protected void setResult(long r) {
		sqlite3_result_int64(_ctx, r);
	}
	protected void setResult(double r) {
		sqlite3_result_double(_ctx, r);
	}
	protected void setResult(char[] r) {
		sqlite3_result_text(_ctx, r.ptr, r.length, SQLITE_TRANSIENT);
	}
	protected void setResult(wchar[] r) {
		sqlite3_result_text16(_ctx, r.ptr, r.length*2, SQLITE_TRANSIENT);
	}
	protected void setResult(void[] r) {
		sqlite3_result_blob(_ctx, r.ptr, r.length, SQLITE_TRANSIENT);
	}
	protected void setResult() {
		sqlite3_result_null(_ctx);
	}
	protected void setResult(SQLiteData r) {
		switch(r.type) {
			case SQLiteDataType.INT:
				setResult(r.dataInt);
				break;
			case SQLiteDataType.INT64:
				setResult(r.dataInt64);
				break;
			case SQLiteDataType.DOUBLE:
				setResult(r.dataDouble);
				break;
			case SQLiteDataType.TEXT:
				setResult(r.dataText);
				break;
			case SQLiteDataType.TEXT16:
				setResult(r.dataText16);
				break;
			case SQLiteDataType.BLOB:
				setResult(r.dataBlob);
				break;
			case SQLiteDataType.NULL:
				setResult();
				break;
			default:
				throw new SQLiteDException("Bad Data Type");
		}
	}
	protected void setResult(sqlite3_value* r) {
		sqlite3_result_value(_ctx, r);
	}

}

// build key from name, nargs and encoding:
package void[] _buildKey(char[] name, int nargs, int enc) {
	return cast(void[])name~(cast(void*)&nargs)[0..4]~(cast(void*)&enc)[0..4];
}
// build key from name and encoding:
package void[] _buildKey(char[] name, int enc) {
	return cast(void[])name~(cast(void*)&enc)[0..4];
}

/**
 * Interface for user-defined function.
 */
public interface IUserFunction {

	/// Return: Name to be registered.
	public char[] name();// const
	/// Return: Arguments number required.
	public int argsRequired();
	/// Return: Text encoding prefered.
	public int encoding();

	/// Initialize the execution enviroment.
	public void initialize(sqlite3_context* ctx, int argc, sqlite3_value** argp);
	/// Implement this method to parse arguments and do real work then set the result.
	public void call();

}

/**
 * Abstract base class for user-defined function, with helper methods mixin.
 */
public abstract class UserFunctionBase : IUserFunction {

	public abstract char[] name();
	public abstract int argsRequired();
	public abstract int encoding();

	mixin TXCallEnv;

	public abstract void call();

}

// enum delegate or function pointer.
package enum UImpType {
	NULL,
	DG,
	FP};

alias SQLiteData delegate(SQLiteData[]) DgUserFunction;
alias SQLiteData function(SQLiteData[]) FpUserFunction;

/**
 * User function class which works as a proxy of the delegate/function pointer.
 */
public class UserFunctionProxy : UserFunctionBase {

	private UImpType _type;
	private union {
		DgUserFunction _dg;
		FpUserFunction _fp;
	}

	private char[] _name;
	public char[] name() {
		return _name;
	}
	private int _nargs;
	public int argsRequired() {
		return _nargs;
	}
	private int _encoding;
	public int encoding() {
		return _encoding;
	}

	public this(DgUserFunction dg, char[] name, int nargs, int encoding) {
		_type = UImpType.DG;
		_dg = dg;
		_name = name.dup;
		_nargs = nargs;
		_encoding = encoding;
	}
	public this(FpUserFunction fp, char[] name, int nargs, int encoding) {
		_type = UImpType.FP;
		_fp = fp;
		_name = name.dup;
		_nargs = nargs;
		_encoding = encoding;
	}

	public void call() {
		// build args:
		SQLiteData[] args = new SQLiteData[_argc];
		for(size_t i= 0; i < _argc; i++) {
			args[i] = getArgData();
		}
		// call func:
		SQLiteData r;
		if(_type == UImpType.DG) {
			r = _dg(args);
		} else if(_type == UImpType.FP) {
			r = _fp(args);
		}
		// set result:
		setResult(r);
	}

}

/// For user functions support, mixin to Connection.
package template TXUserFunction() {

	static if(!is(typeof(this):Connection)) pragma(msg, __FILE__"("/*__LINE__*/"TXUserFunction""): Mixin Context Mismatch!");

	// use sqlite3* _pdb from the mixin context.

	// hold the refs for remove and anti-gc:
	private IUserFunction[void[]] _reg;

	private void _addToReg(IUserFunction uf, char[] name, int nargs, int enc) {
		if(!uf) throw new SQLiteDException("User Function NULL");
		assert(-2 < nargs && nargs < 128);
		assert(0 < enc && enc < 6);
		if(enc == SQLITE_ANY) {
			_reg[_buildKey(name, nargs, SQLITE_UTF8)] = uf;
			_reg[_buildKey(name, nargs, SQLITE_UTF16LE)] = uf;
			_reg[_buildKey(name, nargs, SQLITE_UTF16BE)] = uf;
		} else {
			if(enc == SQLITE_UTF16) enc = SQLITE_UTF16_NATIVE;
			_reg[_buildKey(name, nargs, enc)] = uf;
		}
	}
	private void _removeFromReg(char[] name, int nargs, int enc) {
		if(enc == SQLITE_ANY) {
			_removeFromReg(name, nargs, SQLITE_UTF8);
			_removeFromReg(name, nargs, SQLITE_UTF16LE);
			_removeFromReg(name, nargs, SQLITE_UTF16BE);
		} else {
			if(enc == SQLITE_UTF16) enc = SQLITE_UTF16_NATIVE;
			void[] key = _buildKey(name, nargs, enc);
			if(key in _reg) {
				_reg.remove(key);
			} else {
				throw new SQLiteDException("User Function Not Exist");
			}
		}
	}

	/// Register a user function.
	/// Params:
	///   uf = IUserFunction object.
	/// Return: Nothing.
	public void registerUserFunction(IUserFunction uf) {
		_checkConnectionAvailable();
		int errcode = sqlite3_create_function(_pdb, (uf.name~"\0").ptr, uf.argsRequired, uf.encoding,
			cast(void*)uf,
			&_callback3_user_func, null, null);
		if(errcode) throw new SQLiteVMException(errcode);
		_addToReg(uf, uf.name, uf.argsRequired, uf.encoding);
	}

	/// Register a user function.
	/// Params:
	///   func = Delegate of D function.
	///   name = Registered function name.
	///   nargs = Number of accepted arguments.
	///   encoding = Prefered text encoding.
	/// Return: Nothing.
	public void registerUserFunction(DgUserFunction func, char[] name, int nargs, int encoding = SQLiteEncoding.UTF8) {
		UserFunctionProxy uf = new UserFunctionProxy(func, name, nargs, encoding);
		registerUserFunction(uf);
	}

	/// Register a user function.
	/// Params:
	///   func = Pointer to D function.
	///   name = Registered function name.
	///   nargs = Number of accepted arguments.
	///   encoding = Prefered text encoding.
	/// Return: Nothing.
	public void registerUserFunction(FpUserFunction func, char[] name, int nargs, int encoding = SQLiteEncoding.UTF8) {
		UserFunctionProxy uf = new UserFunctionProxy(func, name, nargs, encoding);
		registerUserFunction(uf);
	}

	/// Unregister a user function.
	public void unregisterUserFunction(IUserFunction uf) {
		_checkConnectionAvailable();
		int errcode = sqlite3_create_function(_pdb, (uf.name~"\0").ptr, uf.argsRequired, uf.encoding, null, null, null, null);
		if(errcode) throw new SQLiteVMException(errcode);
		_removeFromReg(uf.name, uf.argsRequired, uf.encoding);
	}
	public void unregisterUserFunction(char[] name, int nargs, int encoding = SQLiteEncoding.UTF8) {
		_checkConnectionAvailable();
		int errcode = sqlite3_create_function(_pdb, (name~"\0").ptr, nargs, encoding, null, null, null, null);
		if(errcode) throw new SQLiteVMException(errcode);
		_removeFromReg(name, nargs, encoding);
	}

}

/**
 * Interface for user-defined aggregate.
 */
public interface IUserAggregate {

	/// Return: Name to be registered.
	public char[] name();// const
	/// Return: Arguments number required.
	public int argsRequired();
	/// Return: Text encoding prefered.
	public int encoding();

	/// Initialize the execution enviroment.
	public void initialize(sqlite3_context* ctx, int argc, sqlite3_value** argp);
	/// Implement this method to parse arguments and do real work for every step.
	public void step();
	/// To finalize and set the result.
	public void finalize();

}

/**
 * Abstract base class for user-defined aggregate, with helper methods mixin.
 */
public abstract class UserAggregateBase : IUserAggregate {

	public abstract char[] name();
	public abstract int argsRequired();
	public abstract int encoding();

	mixin TXCallEnv;

	public abstract void step();
	public abstract void finalize();

}

alias void delegate(SQLiteData[]) DgUserAggregateStep;
alias void function(SQLiteData[]) FpUserAggregateStep;
alias SQLiteData delegate() DgUserAggregateFinal;
alias SQLiteData function() FpUserAggregateFinal;

/**
 * User aggregate class which works as a proxy of the delegate/function pointer.
 */
public class UserAggregateProxy : UserAggregateBase {

	private UImpType _typeStep;
	private union {
		DgUserAggregateStep _dgStep;
		FpUserAggregateStep _fpStep;
	}
	private UImpType _typeFinal;
	private union {
		DgUserAggregateFinal _dgFinal;
		FpUserAggregateFinal _fpFinal;
	}

	char[] _name;
	char[] name() {
		return _name;
	}
	int _nargs;
	int argsRequired() {
		return _nargs;
	}
	int _encoding;
	int encoding() {
		return _encoding;
	}

	public this(DgUserAggregateStep step, DgUserAggregateFinal finl, char[] name, int nargs, int encoding) {
		_typeStep = _typeFinal = UImpType.DG;
		_dgStep = step;
		_dgFinal = finl;
		_name = name.dup;
		_nargs = nargs;
		_encoding = encoding;
	}
	public this(FpUserAggregateStep step, FpUserAggregateFinal finl, char[] name, int nargs, int encoding) {
		_typeStep = _typeFinal = UImpType.FP;
		_fpStep = step;
		_fpFinal = finl;
		_name = name.dup;
		_nargs = nargs;
		_encoding = encoding;
	}

	public void step() {
		// build args:
		SQLiteData[] args = new SQLiteData[_argc];
		for(size_t i= 0; i < _argc; i++) {
			args[i] = getArgData();
		}
		// call step:
		if(_typeStep == UImpType.DG) {
			_dgStep(args);
		} else if(_typeStep == UImpType.FP) {
			_fpStep(args);
		}
	}
	public void finalize() {
		// set result:
		if(_typeFinal == UImpType.DG) {
			setResult(_dgFinal());
		} else if(_typeFinal == UImpType.FP) {
			setResult(_fpFinal());
		}
	}

}

/// For user aggregates support, mixin to Connection.
package template TXUserAggregate() {

	static if(!is(typeof(this):Connection)) pragma(msg, __FILE__"("/*__LINE__*/"TXUserAggregate""): Mixin Context Mismatch!");

	// use sqlite3* _pdb from the mixin context.

	// hold the refs for remove and anti-gc:
	private IUserAggregate[void[]] _reg;

	private void _addToReg(IUserAggregate ua, char[] name, int nargs, int enc) {
		if(!ua) throw new SQLiteDException("User Aggregate NULL");
		assert(-2 < nargs && nargs < 128);
		assert(0 < enc && enc < 6);
		if(enc == SQLITE_ANY) {
			_reg[_buildKey(name, nargs, SQLITE_UTF8)] = ua;
			_reg[_buildKey(name, nargs, SQLITE_UTF16LE)] = ua;
			_reg[_buildKey(name, nargs, SQLITE_UTF16BE)] = ua;
		} else {
			if(enc == SQLITE_UTF16) enc = SQLITE_UTF16_NATIVE;
			_reg[_buildKey(name, nargs, enc)] = ua;
		}
	}
	private void _removeFromReg(char[] name, int nargs, int enc) {
		if(enc == SQLITE_ANY) {
			_removeFromReg(name, nargs, SQLITE_UTF8);
			_removeFromReg(name, nargs, SQLITE_UTF16LE);
			_removeFromReg(name, nargs, SQLITE_UTF16BE);
		} else {
			if(enc == SQLITE_UTF16) enc = SQLITE_UTF16_NATIVE;
			void[] key = _buildKey(name, nargs, enc);
			if(key in _reg) {
				_reg.remove(key);
			} else {
				throw new SQLiteDException("User Aggregate Not Exist");
			}
		}
	}

	/// Register a user aggregate.
	/// Params:
	///   ua = IUserAggregate object.
	/// Return: Nothing.
	public void registerUserAggregate(IUserAggregate ua) {
		_checkConnectionAvailable();
		int errcode = sqlite3_create_function(_pdb, (ua.name~"\0").ptr, ua.argsRequired, ua.encoding,
			cast(void*)ua,
			null,
			&_callback3_user_step,
			&_callback3_user_final);
		if(errcode) throw new SQLiteVMException(errcode);
		_addToReg(ua, ua.name, ua.argsRequired, ua.encoding);
	}

	/// Register a user aggregate.
	/// Params:
	///   step = Delegate of D function for step.
	///   final = Delegate of D function for final.
	///   name = Registered aggregate name.
	///   nargs = Number of accepted arguments.
	///   encoding = Prefered text encoding.
	/// Return: Nothing.
	public void registerUserAggregate(DgUserAggregateStep step, DgUserAggregateFinal finl, char[] name, int nargs, int encoding = SQLiteEncoding.UTF8) {
		UserAggregateProxy ua = new UserAggregateProxy(step, finl, name, nargs, encoding);
		registerUserAggregate(ua);
	}

	/// Register a user aggregate.
	/// Params:
	///   step = Pointer to D function for step.
	///   final = Pointer to D function for final.
	///   name = Registered aggregate name.
	///   nargs = Number of accepted arguments.
	///   encoding = Prefered text encoding.
	/// Return: Nothing.
	public void registerUserAggregate(FpUserAggregateStep step, FpUserAggregateFinal finl, char[] name, int nargs, int encoding = SQLiteEncoding.UTF8) {
		UserAggregateProxy ua = new UserAggregateProxy(step, finl, name, nargs, encoding);
		registerUserAggregate(ua);
	}

	/// Unregister a user aggregate.
	public void unregisterUserAggregate(IUserAggregate ua) {
		_checkConnectionAvailable();
		int errcode = sqlite3_create_function(_pdb, (ua.name~"\0").ptr, ua.argsRequired, ua.encoding, null, null, null, null);
		if(errcode) throw new SQLiteVMException(errcode);
		_removeFromReg(ua.name, ua.argsRequired, ua.encoding);
	}
	public void unregisterUserAggregate(char[] name, int nargs, int encoding = SQLiteEncoding.UTF8) {
		_checkConnectionAvailable();
		int errcode = sqlite3_create_function(_pdb, (name~"\0").ptr, nargs, encoding, null, null, null, null);
		if(errcode) throw new SQLiteVMException(errcode);
		_removeFromReg(name, nargs, encoding);
	}

}

/**
 * Interface for user-defined collation.
 */
public interface IUserCollation {

	/// Return: Name to be registered.
	public char[] name();
	/// Return: Text encoding required.
	public int encoding();

	/// Compare the 2 string.
	/// Params:
	///   s1, s2 = Text encoded in the encoding specified.
	/// Return: Negative, zero or positive for the case of s1 is less than, equal to or greater than s2.
	public int compare(void[] s1, void[] s2);

}

alias int delegate(void[] s1, void[] s2) DgUserCollation;
alias int function(void[] s1, void[] s2) FpUserCollation;

/**
 * User collation class which works as a proxy of the delegate/function pointer.
 */
public class UserCollationProxy : IUserCollation {

	UImpType _type;
	private union {
		DgUserCollation _dg;
		FpUserCollation _fp;
	}

	char[] _name;
	char[] name() {
		return _name;
	}
	int _encoding;
	int encoding() {
		return _encoding;
	}

	public this(DgUserCollation dg, char[] name, int encoding) {
		_type = UImpType.DG;
		_dg = dg;
		_name = name.dup;
		_encoding = encoding;
	}
	public this(FpUserCollation fp, char[] name, int encoding) {
		_type = UImpType.FP;
		_fp = fp;
		_name = name.dup;
		_encoding = encoding;
	}

	public int compare(void[] s1, void[] s2) {
		if(_type == UImpType.DG) {
			return _dg(s1, s2);
		} else/+ if(_type == UImpType.FP)+/ {
			return _fp(s1, s2);
		}
	}

}

/// For user collations support, mixin to Connection.
package template TXUserCollation() {

	static if(!is(typeof(this):Connection)) pragma(msg, __FILE__"("/*__LINE__*/"TXUserCollation""): Mixin Context Mismatch!");

	// use sqlite3* _pdb from the mixin context.

	// hold the refs for remove and anti-gc:
	private IUserCollation[void[]] _reg;

	private void _addToReg(IUserCollation uc, char[] name, int enc) {
		if(!uc) throw new SQLiteDException("User Collation NULL");
		assert(0 < enc && enc < 5);
		if(enc == SQLITE_UTF16) enc = SQLITE_UTF16_NATIVE;
		//_reg[_buildKey(name, enc)] = uc;
		// for the DMD -O bug:
		//_reg[(_buildKey(name, enc)~"C")[0..$-1]] = uc;
		_reg[_buildKey(name, enc, 0)] = uc;
	}
	private void _removeFromReg(char[] name, int enc) {
		if(enc == SQLITE_UTF16) enc = SQLITE_UTF16_NATIVE;
		//void[] key = _buildKey(name, enc);
		// no bug, but corresponds with _addToReg:
		void[] key = _buildKey(name, enc, 0);
		if(key in _reg) {
			_reg.remove(key);
		} else {
			throw new SQLiteDException("User Collation Not Exist");
		}
	}

	/// Register a user collation.
	/// Params:
	///   uc = IUserCollation object.
	/// Return: Nothing.
	public void registerUserCollation(IUserCollation uc) {
		_checkConnectionAvailable();
		int errcode = sqlite3_create_collation(_pdb, (uc.name~"\0").ptr, uc.encoding,
			cast(void*)uc,
			&_callback3_user_compare);
		if(errcode) throw new SQLiteVMException(errcode);
		_addToReg(uc, uc.name, uc.encoding);
	}

	/// Register a user collation.
	/// Params:
	///   coll = Delegate of D function.
	///   name = Registered collation name.
	///   encoding = Prefered text encoding.
	/// Return: Nothing.
	public void registerUserCollation(DgUserCollation coll, char[] name, int encoding = SQLiteEncoding.UTF8) {
		UserCollationProxy uc = new UserCollationProxy(coll, name, encoding);
		registerUserCollation(uc);
	}

	/// Register a user collation.
	/// Params:
	///   coll = Pointer to D function.
	///   name = Registered collation name.
	///   encoding = Prefered text encoding.
	/// Return: Nothing.
	public void registerUserCollation(FpUserCollation coll, char[] name, int encoding = SQLiteEncoding.UTF8) {
		UserCollationProxy uc = new UserCollationProxy(coll, name, encoding);
		registerUserCollation(uc);
	}

	/// Unregister a user collation.
	public void unregisterUserCollation(IUserCollation uc) {
		_checkConnectionAvailable();
		int errcode = sqlite3_create_collation(_pdb, (uc.name~"\0").ptr, uc.encoding, null, null);
		if(errcode) throw new SQLiteVMException(errcode);
		_removeFromReg(uc.name, uc.encoding);
	}
	public void unregisterUserCollation(char[] name, int encoding = SQLiteEncoding.UTF8) {
		_checkConnectionAvailable();
		int errcode = sqlite3_create_collation(_pdb, (name~"\0").ptr, encoding, null, null);
		if(errcode) throw new SQLiteVMException(errcode);
		_removeFromReg(name, encoding);
	}

}

extern(C) {

void _callback3_user_func(sqlite3_context* context, int argc, sqlite3_value** argp) {
	IUserFunction uf = cast(IUserFunction)sqlite3_user_data(context);
	uf.initialize(context, argc, argp);
	uf.call();
}

void _callback3_user_step(sqlite3_context* context, int argc, sqlite3_value** argp) {
	IUserAggregate ua = cast(IUserAggregate)sqlite3_user_data(context);
	ua.initialize(context, argc, argp);
	ua.step();
}

void _callback3_user_final(sqlite3_context* context) {
	IUserAggregate ua = cast(IUserAggregate)sqlite3_user_data(context);
	ua.initialize(context, 0, null);
	ua.finalize();
}

int _callback3_user_compare(void* pu, int lng1, void* s1, int lng2, void* s2) {
	IUserCollation uc = cast(IUserCollation)pu;
	return uc.compare(s1[0 .. lng1], s2[0 .. lng2]);
}

}
