/**
 * support for SQLite DB event, (_handler and _hook).
 */

module dwin.database.sqlite._event;

private import dwin.database.sqlite.c.sqlite3;
private import dwin.database.sqlite.Base;


public alias int delegate(Connection con) DgOnProgress;
public alias int delegate(Connection con) DgOnCommit;
public alias void delegate(Connection con) DgOnRollback;
public alias void delegate(Connection con, int action, char[] database, char[] table, long rowid) DgOnUpdate;
public alias int delegate(Connection con, int time) DgOnBusy;
public alias void delegate(Connection con, char[] sql) DgOnTrace;
public alias void delegate(Connection con, char[] name, int encoding) DgOnCollationNeeded;

/// Action code for update event.
public enum SQLiteUpdateAction {
	INSERT = SQLITE_INSERT,
	DELETE = SQLITE_DELETE,
	UPDATE = SQLITE_UPDATE};

/// For SQLite3 DB event support, mixin to Connection.
package template TXEvent() {

	private DgOnProgress _onProgress;
	/// Get/Set progress event handler.
	public DgOnProgress onProgress() {
		return _onProgress;
	}
	public DgOnProgress onProgress(DgOnProgress dg) {
		_onProgress = dg;
		_checkConnectionAvailable();
		if(dg is null) {
			sqlite3_progress_handler(_pdb, _progressInterval, null, null);
		} else {
			//sqlite3_progress_handler(_pdb, _progressInterval, &_callback3_on_progress, this);
			sqlite3_progress_handler(_pdb, _progressInterval, &_callback3_on_progress, cast(void*)this);
		}
		return dg;
	}
	private int _progressInterval = 100;
	/// Get/Set progress interval in number of VM codes.
	public int progressInterval() {
		return _progressInterval;
	}
	public int progressInterval(int interval) {
		return _progressInterval = interval;
	}

	private DgOnCommit _onCommit;
	/// Get/Set commit event handler.
	public DgOnCommit onCommit() {
		return _onCommit;
	}
	public DgOnCommit onCommit(DgOnCommit dg) {
		_onCommit = dg;
		_checkConnectionAvailable();
		if(dg is null) {
			sqlite3_commit_hook(_pdb, null, null);
		} else {
			//sqlite3_commit_hook(_pdb, &_callback3_on_commit, this);
			sqlite3_commit_hook(_pdb, &_callback3_on_commit, cast(void*)this);
		}
		return dg;
	}

	private DgOnRollback _onRollback;
	/// Get/Set rollback event handler.
	public DgOnRollback onRollback() {
		return _onRollback;
	}
	public DgOnRollback onRollback(DgOnRollback dg) {
		_onRollback = dg;
		_checkConnectionAvailable();
		if(dg is null) {
			sqlite3_rollback_hook(_pdb, null, null);
		} else {
			//sqlite3_rollback_hook(_pdb, &_callback3_on_rollback, this);
			sqlite3_rollback_hook(_pdb, &_callback3_on_rollback, cast(void*)this);
		}
		return dg;
	}

	private DgOnUpdate _onUpdate;
	/// Get/Set update event handler.
	public DgOnUpdate onUpdate() {
		return _onUpdate;
	}
	public DgOnUpdate onUpdate(DgOnUpdate dg) {
		_onUpdate = dg;
		_checkConnectionAvailable();
		if(dg is null) {
			sqlite3_update_hook(_pdb, null, null);
		} else {
			//sqlite3_update_hook(_pdb, &_callback3_on_update, this);
			sqlite3_update_hook(_pdb, &_callback3_on_update, cast(void*)this);
		}
		return dg;
	}

	private DgOnBusy _onBusy;
	/// Get/Set busy event handler.
	public DgOnBusy onBusy() {
		return _onBusy;
	}
	public DgOnBusy onBusy(DgOnBusy dg) {
		_onBusy = dg;
		_checkConnectionAvailable();
		if(dg is null) {
			sqlite3_busy_handler(_pdb, null, null);
		} else {
			//sqlite3_busy_handler(_pdb, &_callback3_on_busy, this);
			sqlite3_busy_handler(_pdb, &_callback3_on_busy, cast(void*)this);
		}
		return dg;
	}

	private DgOnTrace _onTrace;
	/// Get/Set trace event handler.
	public DgOnTrace onTrace() {
		return _onTrace;
	}
	public DgOnTrace onTrace(DgOnTrace dg) {
		_onTrace = dg;
		_checkConnectionAvailable();
		if(dg is null) {
			sqlite3_trace(_pdb, null, null);
		} else {
			//sqlite3_trace(_pdb, &_callback3_on_trace, this);
			sqlite3_trace(_pdb, &_callback3_on_trace, cast(void*)this);
		}
		return dg;
	}

	private DgOnCollationNeeded _onCollationNeeded;
	/// Get/Set collation needed event handler.
	public DgOnCollationNeeded onCollationNeeded() {
		return _onCollationNeeded;
	}
	public DgOnCollationNeeded onCollationNeeded(DgOnCollationNeeded dg) {
		_onCollationNeeded = dg;
		_checkConnectionAvailable();
		if(dg is null) {
			sqlite3_collation_needed(_pdb, null, null);
		} else {
			//sqlite3_collation_needed(_pdb, this, &_callback3_on_collation_needed);
			sqlite3_collation_needed(_pdb, cast(void*)this, &_callback3_on_collation_needed);
		}
		return dg;
	}

}

extern(C) {

// EXPR:
int _callback3_on_progress(void* pu) {
	Connection con = cast(Connection)pu;
	return con.onProgress()(con);
	//return 0;
}

// EXPR:
int _callback3_on_commit(void* pu) {
	Connection con = cast(Connection)pu;
	return con.onCommit()(con);
	//return 0;
}

void _callback3_on_rollback(void* pu) {
	Connection con = cast(Connection)pu;
	con.onRollback()(con);
}

void _callback3_on_update(void* pu, int op, char* dbn, char* tbn, long oid) {
	Connection con = cast(Connection)pu;
	con.onUpdate()(con, op,
		dbn[0.._strlen(dbn)],
		tbn[0.._strlen(tbn)],
		oid);
}

int _callback3_on_busy(void* pu, int time) {
	Connection con = cast(Connection)pu;
	return con.onBusy()(con, time);
	//return 0;
}

void _callback3_on_trace(void* pu, char* sql) {
	Connection con = cast(Connection)pu;
	con.onTrace()(con, sql[0.._strlen(sql)]);
}

void _callback3_on_collation_needed(void* pu, sqlite3* pdb, int encoding, char* name) {
	Connection con = cast(Connection)pu;
	con.onCollationNeeded()(con, name[0.._strlen(name)], encoding);
}

}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
