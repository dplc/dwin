/**
 * SQLiteD Data Classes.
 * http://iqk.sourceforge.net/
 * icee, 2006.
 */
 /*******************************************************************************

         Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved

         License:        BSD style: $(LICENSE)

         Version:        Initial release: April 2008

         Authors:        modified to with Tango by yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

 *******************************************************************************/


module dwin.database.sqlite.Data;


private import dwin.database.sqlite.Base;
private import dwin.database.sqlite.Util;

debug
{
    version(Phobos)
        private import std.stdio;
    else
    {
        private import tango.io.Stdout;
        alias Stdout writefln;
        alias Stdout write;
    }
}



// convert int to char[]:
package char[] _itoa(int v) {
	char[10] sds = 0; // 19 for long
	char[] ssign = "";
	if(v < 0) {
		ssign = "-";
		v = -v;
	}
	int i;
	for(i = sds.length-1; i >= 0; i--) {
		sds[i] = '0' + v%10;
		v /= 10;
		if(v == 0) break;
	}
	return ssign~sds[i .. $];
}

/**
 * SQLiteDataTableException.
 */
public class SQLiteDataTableException : Exception {
	public this(char[] msg) {
		super("SQLite DataTable Exception: " ~ msg);
	}
}

/// .
public enum DataRowState {
	DEFAULT = 0, // ORIGINAL
	PENDING_UPDATE = 1, // CHANGED
	PENDING_DELETE = 2,
	PENDING_INSERT = 4,
	TEMPORARY = 8};

/**
 * DataColumn.
 */
public class DataColumn {

	private DataTable _table;
	public DataTable table() {
		return _table;
	}
	private int _index = -1;
	public int index() {
		return _index;
	}

	private char[] _name = "";
	/// Column name.
	public char[] name() {
		return _name.dup;
	}
	/// .
	public char[] name(char[] v) {
		if(_table !is null) _table._nidict.remove(_name);
		_name = v.dup;
		if(_table !is null) _table._nidict[_name] = _index;
		return v;
	}

	private int _type = -1;
	/// Column type.
	public int type() {
		return _type;
	}
	/// .
	public int type(int v) {
		return _type = v;
	}

	private char[] _declType = "";
	/// Column decl type.
	public char[] declType() {
		return _declType.dup;
	}
	/// .
	public char[] declType(char[] v) {
		_declType = v.dup;
		return v;
	}

	private SQLiteData _defaultValue;
	/// Column default value.
	public SQLiteData defaultValue() {
		return _defaultValue;
	}
	/// .
	public SQLiteData defaultValue(SQLiteData v) {
		return _defaultValue = v;
	}

	/// Constructor.
	/// Params:
	///   name = Column name.
	///   type = Column type.
	public this(char[] name, int type = -1,
		char[] declType = null,
		SQLiteData defaultValue = SQLiteData.NULL) {
		_name = name.dup;
		_type = type;
		_declType = declType.dup;
		_defaultValue = defaultValue;
	}
	/// .
	public this() {
		_defaultValue = SQLiteData.create(); // NULL
	}

}

/**
 * DataRow.
 */
public class DataRow {

	private this(SQLiteData[] fields, DataTable table) {
		_fields = fields;
		_table = table;
	}
	private this(long id, SQLiteData[] fields, DataTable table) {
		_id = id;
		_fields = fields;
		_table = table;
	}
	// create a dummy row, for linked list head.
	private this() {
	}

	// link fields:
	private DataRow _previous;
	private DataRow _next;
	private DataRowSet _set;

	private SQLiteData[] _fields;
	private long _id;
	/// .
	public long id() {
		return _id;
	}
	//public long id(long v) {
	//	return _id = v;
	//}
	private int _state = DataRowState.DEFAULT;
	/// .
	public int state() {
		return _state;
	}

	private DataTable _table = null; // link to table.
	public DataTable table() {
		return _table;
	}

	/// Get field data.
	/// Params:
	///   index = Column index.
	public SQLiteData getField(int index) {
		if(index >= _table._width) throw new SQLiteDataTableException("Index Out Of Range");
		return _fields[index];
	}
	/// Get field data.
	/// Params:
	///   name = Column name.
	public SQLiteData getField(char[] name) {
		return getField(_table._nidict[name]);
	}
	/// Get field data.
	/// Params:
	///   col = Column.
	public SQLiteData getField(DataColumn col) {
		//assert(col._table is _table);
		if(col._table !is _table) throw new SQLiteDataTableException("Column / Table Mismatch");
		return getField(col._index);
	}

	/// Set field data.
	/// Params:
	///   index = Column index.
	///   data = Field data.
	public SQLiteData setField(int index, SQLiteData data) {
		if(_table) {
			if(index >= _table._width) throw new SQLiteDataTableException("Index Out Of Range");
		}
		return _fields[index] = data;
	}
	/// Set field data.
	/// Params:
	///   name = Column name.
	///   data = Field data.
	public SQLiteData setField(char[] name, SQLiteData data) {
		return setField(_table._nidict[name], data);
	}
	/// Set field data.
	/// Params:
	///   col = Column.
	///   data = Field data.
	public SQLiteData setField(DataColumn col, SQLiteData data) {
		//assert(col._table is _table);
		if(col._table !is _table) throw new SQLiteDataTableException("Column / Table Mismatch");
		return setField(col._index, data);
	}

	/// .
	public SQLiteData opIndex(int index) {
		return getField(index);
	}
	/// .
	public SQLiteData opIndex(char[] name) {
		return getField(name);
	}
	/// .
	public SQLiteData opIndex(DataColumn col) {
		return getField(col);
	}
	/// .
	public SQLiteData opIndexAssign(SQLiteData data, int index) {
		return setField(index, data);
	}
	/// .
	public SQLiteData opIndexAssign(SQLiteData data, char[] name) {
		return setField(name, data);
	}
	/// .
	public SQLiteData opIndexAssign(SQLiteData data, DataColumn col) {
		return setField(col, data);
	}

	/// .
	public void markInsert(bool merge = false) {
		_table.markInsert(this, merge);
	}
	/// .
	public void markDelete(bool separate = false) {
		_table.markDelete(this, separate);
	}
	/// .
	public void markUpdate() {
		_table.markUpdate(this);
	}

}

public enum DataRowSetType {CURRENT, DROPPED, PROPOSED};

/**
 * DataRowSet.
 */
public class DataRowSet {

	private this(DataRowSetType type = DataRowSetType.CURRENT) {
		_type = type;
		_head = new DataRow(); // dummy row for list head.
		_pr = _p = _head._next = _head._previous = _head; // link circular.
	}

	private DataRowSetType _type; // = DataRowSetType.CURRENT

	private DataRow _head; // list head.
	private DataRow _p; // current position.
	private DataRow _pr; // to store current _p value.

	/// Get the first row.
	public DataRow first() {
		if(_head._next is _head) return null;
		return _head._next;
	}
	/// Get the last row.
	public DataRow last() {
		if(_head._previous is _head) return null;
		return _head._previous;
	}
	/// Reset cursor.
	public void reset() {
		_p = _head;
	}
	/// Get the next row, and move cursor forward.
	public DataRow next() {
		if(_p._next is _head) return null;
		return _p = _p._next;
	}
	/// Get the previous row, and move cursor backward.
	public DataRow previous() {
		if(_p._previous is _head) return null;
		return _p = _p._previous;
	}
	/// Get the current row.
	public DataRow current() {
		if(_p is _head) return null;
		return _p;
	}
	/// Set the current row.
	public DataRow current(DataRow r) {
		assert(row !is _head);
		// row is not checked: ._set is this
		return _p = r;
	}
	public alias current row;
	/// Skip some rows.
	/// Params:
	///   n = Number of rows to be skipped, positive for forward, negative for backward.
	public int skip(int n) {
		int r = 0;
		if(n > 0) {
			for(size_t i= 0; i < n; i++) {
				if(!next()) break;
				r++;
			}
		} else if(n < 0) {
			for(size_t i= 0; i > n; i--) {
				if(!previous()) break;
				r++;
			}
		}
		return r;
	}
	private void savePosition() {
		_pr = _p;
	}
	private void restorePosition() {
		_p = _pr;
	}

	private int _length = 0;
	public int length() {
		//if(_length < 0) { // -1, for re-counting rows.
		//	_length = 0;
		//	for(size_t r= _head._next;
		//		r !is _head;
		//		r = r._next, _length++) {}
		//}
		return _length;
	}

	/// Determine whether a row belongs to the set.
	/// Params:
	///   row = .
	public bool has(DataRow row) {
		return row._set is this;
	}
	/// Append a row to set.
	/// Params:
	///   row = .
	public void append(DataRow row) {
		if(row._set !is null) throw new SQLiteDataTableException("Wrong DataRowSet Append");
		_invalidateIndex();
		_head._previous._next = row;
		row._previous = _head._previous;
		_head._previous = row;
		row._next = _head;
		row._set = this;
		_length++;
	}
	/+
	public void insertBefore(DataRow rowBefore, DataRow row) {
		// rowBefore is not checked: ._set is this
		// row is not checked: ._set is null
		_invalidateIndex();
		rowBefore._previous._next = row;
		row._previous = rowBefore._previous;
		rowBefore._previous = row;
		row._next = rowBefore;
		row._set = this;
		_length++;
	}
	+/
	/// Remove a row from the set.
	/// Params:
	///   row = .
	public void remove(DataRow row) {
		//assert(row !is _head);
		if(row._set !is this) throw new SQLiteDataTableException("Wrong DataRowSet Remove");
		_invalidateIndex();
		if(_p is row) _p = row._previous;
		row._previous._next = row._next;
		row._next._previous = row._previous;
		row._next = row._previous = null;
		row._set = null;
		_length--;
	}
	/// Clear all rows from the set.
	/// Params:
	///   destroyRows = Immediately destroy(delete) the rows.
	public void clear(bool destroyRows = false) {
		_invalidateIndex();
		_length = 0;
		_p = _head;
		if(destroyRows) {
			_p = _p._next;
			while(_p !is _head) {
				DataRow r = _p;
				_p = _p._next;
				// delete row and get memory back:
				delete r._fields;
				delete r;
			}
		} else {
			while((_p = _p._next) !is _head) {
				_p._previous._next = null;
				_p._previous = null;
				_p._set = null;
				_p._table = null;
			}
		}
		_p = _head._next = _head._previous = _head;
	}
	/// .
	public int opApply(int delegate(inout DataRow row) dg) {
		int r = 0;
		DataRow o;
		savePosition();
		reset();
		while((o = next()) !is null) {
			r = dg(o);
			if(r) break;
		}
		restorePosition();
		return r;
	}
	public int opApply(int delegate(inout DataRow row, inout int index) dg) {
		int r = 0;
		DataRow o;
		int i = 0;
		savePosition();
		reset();
		while((o = next()) !is null) {
			r = dg(o, i);
			if(r) break;
			i++;
		}
		restorePosition();
		return r;
	}

	// ++++++++ ++++++++

	private DataRow[] _rows; // for rows index.

	private void _buildIndex() {
		if(_rows is null) {
			_rows = new DataRow[length()];
			DataRow r;
			reset();
			int i = 0;
			while((r = next()) !is null) {
				_rows[i] = r;
				i++;
			}
		}
	}
	private void _invalidateIndex() {
		version(ExplicitDelete) {
			delete _rows;
		} else {
			_rows = null;
		}
	}
	/// .
	public void buildIndex(bool forced = false) {
		if(forced) _invalidateIndex();
		_buildIndex();
	}

	/// Get DataRow by index.
	/// Params:
	///   index = Row index.
	public DataRow row(int index) {
		if(_rows is null) _buildIndex();
		if(index >= length) throw new SQLiteDataTableException("Index Out Of Range");
		return _rows[index];
	}
	/// .
	public DataRow opIndex(int index) {
		return row(index);
	}
	/// .
	public SQLiteData opIndex(int ri, int fi) {
		return row(ri).getField(fi);
	}
	/// .
	public SQLiteData opIndex(int ri, char[] fn) {
		return row(ri).getField(fn);
	}
	/// .
	public SQLiteData opIndexAssign(SQLiteData data, int ri, int fi) {
		return row(ri).setField(fi, data);
	}
	/// .
	public SQLiteData opIndexAssign(SQLiteData data, int ri, char[] fn) {
		return row(ri).setField(fn, data);
	}

}

/**
 * DataTable.
 */
public class DataTable {

	/// .
	public this() {
		_current = new DataRowSet(DataRowSetType.CURRENT);
		_dropped = new DataRowSet(DataRowSetType.DROPPED);
		_proposed = new DataRowSet(DataRowSetType.PROPOSED);
	}
	/// .
	public this(char[] name) {
		this();
		_name = name.dup;
	}

	private DataRowSet _current; // current exist rows.
	private DataRowSet _dropped; // pending DELETE rows.
	private DataRowSet _proposed; // pending INSERT rows.
	public DataRowSet current() {
		return _current;
	}
	public DataRowSet dropped() {
		return _dropped;
	}
	public DataRowSet proposed() {
		return _proposed;
	}

	/// Number of rows.
	public int length() {
		return _current.length;
	}

	/// Check is empty.
	public bool isEmpty() {
		return _current.length == 0 && _dropped.length == 0 && _proposed.length == 0;
	}

	/// .
	public void reset() {
		_current.reset();
	}
	/// .
	public DataRow next() {
		return _current.next();
	}
	/// .
	public DataRow previous() {
		return _current.previous();
	}
	/// .
	public DataRow row() {
		return _current.row();
	}
	/// .
	public DataRow row(DataRow row) {
		return _current.row(row);
	}
	/// .
	public int skip(int n) {
		return _current.skip(n);
	}
	/// .
	public int opApply(int delegate(inout DataRow row) dg) {
		return _current.opApply(dg);
	}
	public int opApply(int delegate(inout DataRow row, inout int index) dg) {
		return _current.opApply(dg);
	}

	// ++++++++ ++++++++

	private int _width = 0; // column count.
	/// Number of columns.
	public int width() {
		return _width;
	}

	private bool _usingDataRowId = false;
	/// .
	public bool usingDataRowId() {
		return _usingDataRowId;
	}
	public bool usingDataRowId(bool v) {
		return _usingDataRowId = v;
	}
	private char[] _oidName = "_rowid_";
	public char[] oidName() {
		return _oidName.dup;
	}
	public char[] oidName(char[] v) {
		_oidName = v.dup;
		return v;
	}

	private int _oidIndex = -1; // the rowid column index.
	/// OID index, must specified for update.
	public int oidIndex() {
		return _oidIndex;
	}
	/// .
	public int oidIndex(int index) {
		return _oidIndex = index;
	}

	private DataColumn[] _columns;
	private int[char[]] _nidict;
	private SQLiteData[] _dfields;
	/// .
	public DataColumn getColumn(int index) {
		if(index >= width) throw new SQLiteDataTableException("Index Out Of Range");
		return _columns[index];
	}
	/// .
	public DataColumn[] columns() {
		return _columns.dup;
	}
	/// Add column to DataTable.
	/// Params:
	///   col = DataColumn to be added.
	///   isOid = Is it a oid column, default to false.
	/// Return: Column added.
	public DataColumn addColumn(DataColumn col, bool isOid = false) {
		if(!isEmpty()) throw new SQLiteDataTableException("Can't Add Column To Table Not Empty");
		int i;
		_width = _dfields.length = _columns.length = (i = _columns.length) + 1;
		_columns[i] = col;
		_dfields[i] = col._defaultValue;
		col._table = this;
		col._index = i;
		_nidict[col._name] = i;
		if(isOid) _oidIndex = i;
		return col;
	}
	/// Remove column from DataTable.
	/// Params:
	///   i = Column index.
	/// Return: Column removed.
	public DataColumn removeColumn(int i) {
		if(!isEmpty()) throw new SQLiteDataTableException("Can't Remove Column From Table Not Empty");
		if(i < 0 || i >= _columns.length) throw new SQLiteDataTableException("Column Index Out Of Range");
		DataColumn col = _columns[i];
		col._table = null;
		col._index = -1;
		if(_oidIndex == i) _oidIndex = -1;
		_columns = _columns[0 .. i]~_columns[i+1 .. $];
		_dfields = _dfields[0 .. i]~_dfields[i+1 .. $];
		_width = _columns.length;
		for(size_t j= 0; j < _width; j++) {
			_columns[j]._index = j;
			_nidict[_columns[j]._name] = j;
		}
		_nidict.remove(col._name);
		return col;
	}
	/// Remove column from DataTable.
	/// Params:
	///   col = Column.
	/// Return: Column removed.
	public DataColumn removeColumn(DataColumn col) {
		if(col._table !is this) throw new SQLiteDataTableException("Column / Table Mismatch");
		return removeColumn(col._index);
	}
	/// .
	public void clearColumns() {
		if(!isEmpty()) throw new SQLiteDataTableException("Can't Remove Columns From Table Not Empty");
		_oidIndex = -1;
		foreach(DataColumn col; _columns) {
			col._table = null;
			col._index = -1;
			_nidict.remove(col._name);
		}
		//_columns = new DataColumn[0];
		_columns.length = 0;
		_dfields.length = 0;
		_width = 0;
	}

	/// Retrieve all available columns of the DataTable from the Connection.
	/// Params:
	///   con = SQLite3 database Connection.
	///   name = The table name, if not null, set the DataTable name property.
	///   oidColName = The OID column name, null for using the PK or no OID column.
	///   oidColType = The OID column type.
	/// Returns: Nothing.
	public void retrieveColumns(Connection con, char[] name = null, char[] oidColName = "_rowid_", int oidColType = SQLiteDataType.INT64) {
		if(name.length > 0) _name = name.dup;
		ColumnItem[] cis = dwin.database.sqlite.Util.getColumnItems(con, _name);
		if(cis.length == 0) throw new SQLiteDataTableException("No Columns Available, Maybe Due To The Wrong Table Name");
		clearColumns(); // empty check included.
		_dfields.length = _columns.length = cis.length;
		for(size_t i= 0; i < cis.length; i++) {
			ColumnItem ci = cis[i];
			DataColumn col = new DataColumn();
			col._name = ci.name;
			col._declType = ci.declType;
			col._defaultValue = ci.defaultValue;
			col._table = this;
			col._index = i;
			_columns[i] = col;
			_dfields[i] = col._defaultValue;
			_nidict[col._name] = i;
			if(ci.isPrimaryKey) _oidIndex = i;
		}
		_width = cis.length;
		if(!_usingDataRowId) {
			if(oidColName.length) { // not null or "".
				addColumn(new DataColumn(oidColName, oidColType), true);
			}
		}
	}

	// ++++++++ ++++++++

	private char[] _name;
	/// Table name.
	public char[] name() {
		return _name.dup;
	}
	/// .
	public char[] name(char[] name) {
		_name = name.dup;
		return name;
	}

	private char[] _sqlFilter = "";
	/// SQL filter string for Table fill.
	public char[] sqlFilter() {
		return _sqlFilter.dup;
	}
	/// .
	public char[] sqlFilter(char[] sql) {
		_sqlFilter = sql.dup;
		return sql;
	}

	private char[] _sqlOrder = "";
	/// SQL order string for Table fill.
	public char[] sqlOrder() {
		return _sqlOrder.dup;
	}
	/// .
	public char[] sqlOrder(char[] sql) {
		_sqlOrder = sql.dup;
		return sql;
	}

	private int _limit = -1;
	/// The max Row limit for Table fill.
	public int limit() {
		return _limit;
	}
	/// .
	public int limit(int v) {
		return _limit = v;
	}

	private int _offset = 0;
	/// The Row offset for Table fill.
	public int offset() {
		return _offset;
	}
	/// .
	public int offset(int v) {
		return _offset = v;
	}

	private char[] _buildSqlSelect() {
		char[] sql = "SELECT ";
		if(_usingDataRowId) {
			sql ~= _oidName~", ";
		}
		for(size_t i= 0; i < _columns.length - 1; i++) {
			sql ~= _columns[i]._name~", ";
		}
		sql ~= _columns[$-1]._name;
		sql ~= " FROM "~_name;
		if(_sqlFilter.length > 0) sql ~= " WHERE "~_sqlFilter;
		if(_sqlOrder.length > 0) sql ~= " ORDER BY "~_sqlOrder;
		if(_limit >= 0) {
			sql ~= " LIMIT "~_itoa(_limit);
			if(_offset > 0) {
				sql ~= " OFFSET "~_itoa(_offset);
			}
		} else {
			if(_offset > 0) {
				sql ~= " LIMIT -1 OFFSET "~_itoa(_offset);
			}
		}
		sql ~= ";";
		return sql;
	}
	private char[] _buildSqlUpdate() {
		if(!_usingDataRowId && _oidIndex < 0) return "";
		char[] sql = "UPDATE "~_name~" SET ";
		DataColumn[] cols;
		if(_usingDataRowId) {
			cols = _columns;
		} else {
			cols = _columns[0 .. _oidIndex]~_columns[_oidIndex+1 .. $];
		}
		for(size_t i= 0; i < cols.length - 1; i++) {
			sql ~= cols[i]._name~" = ?, ";
		}
		sql ~= cols[$-1]._name~" = ?";
		if(_usingDataRowId) {
			sql ~= " WHERE "~_oidName~" = ?;";
		} else {
			sql ~= " WHERE "~_columns[_oidIndex]._name~" = ?;";
		}
		return sql;
	}
	private char[] _buildSqlDelete() {
		if(!_usingDataRowId && _oidIndex < 0) return "";
		char[] sql = "DELETE FROM "~_name~" WHERE "~(_usingDataRowId ?
			_oidName :
			_columns[_oidIndex]._name)~" = ?;";
		return sql;
	}
	private char[] _buildSqlInsert() {
		char[] sql = "INSERT INTO "~_name~" (";
		DataColumn[] cols = _columns;
		for(size_t i= 0; i < cols.length - 1; i++) {
			sql ~= cols[i]._name~", ";
		}
		sql ~= cols[$-1]._name~") VALUES (";
		for(size_t i= 0; i < cols.length - 1; i++) {
			sql ~= "?, ";
		}
		sql ~= "?);";
		return sql;
	}

	private char[] _buildSqlCreate(bool withOid = false) {
		char[] sql = "CREATE TABLE ";
		sql ~= _name~" (";
		DataColumn col;
		for(size_t i= 0; i < _columns.length - 1; i++) {
			col = _columns[i];
			if(col._declType.length) {
				sql ~= col._name~" "~col._declType~", ";
			} else {
				sql ~= col._name~", ";
			}
		}
		col = _columns[$-1];
		if(col._declType.length) {
			sql ~= col._name~" "~col._declType~");";
		} else {
			sql ~= col._name~");";
		}
		return sql;
	}
	private char[] _buildSqlDrop() {
		char[] sql = "DROP TABLE ";
		sql ~= _name~";";
		return sql;
	}

	// ++++++++ ++++++++

	/// Create a new row.
	public DataRow createRow(bool blank = false) {
		SQLiteData[] fields;
		if(blank) {
			fields = new SQLiteData[_width];
			fields[] = SQLiteData.create(); // assign NULL to all fields.
		} else {
			fields = _dfields.dup;
		}
		DataRow row = new DataRow(fields, this);
		row._state = DataRowState.TEMPORARY;
		_proposed.append(row);
		return row;
	}
	/// Create a new row from a exist row (duplicated).
	public DataRow createRow(DataRow rowDup) {
		if(rowDup._table !is this) throw new SQLiteDataTableException("Row / Table Mismatch For Duplication");
		SQLiteData[] fields = rowDup._fields.dup;
		if(_oidIndex >= 0)
			fields[_oidIndex] = SQLiteData.create(); // assign NULL to the oid field.
		DataRow row = new DataRow(fields, this);
		row._state = DataRowState.TEMPORARY;
		_proposed.append(row);
		return row;
	}
	/// Mark a row to be deleted through Connection.
	/// Params:
	///   row = .
	public void markInsert(DataRow row, bool merge = false) {
		if(row._table !is this) throw new SQLiteDataTableException("Row / Table Mismatch For INSERT");
		if(row._state == DataRowState.TEMPORARY) {
			row._state = DataRowState.PENDING_INSERT;
			if(merge) {
				if(_proposed.has(row)) {
					_proposed.remove(row);
					_current.append(row);
				} else {
					throw new SQLiteDataTableException("Row / Set Mismatch For INSERT Merge");
				}
			}
		} else if(row._state == DataRowState.PENDING_INSERT) {
		} else {
			throw new SQLiteDataTableException("Wrong Row State");
		}
	}

	/// Mark a row to be deleted through Connection.
	/// Params:
	///   row = .
	public void markDelete(DataRow row, bool separate = false) {
		if(row._table !is this) throw new SQLiteDataTableException("Row / Table Mismatch For DELETE");
		if(row._state == DataRowState.DEFAULT ||
			row._state == DataRowState.PENDING_UPDATE) {
			row._state = DataRowState.PENDING_DELETE;
			if(separate) {
				if(_current.has(row)) {
					_current.remove(row);
					_dropped.append(row);
				} else {
					throw new SQLiteDataTableException("Row / Set Mismatch For DELETE Separate");
				}
			}
		} if(row._state == DataRowState.PENDING_INSERT) {
			row._state = DataRowState.TEMPORARY;
			if(separate) {
				if(_current.has(row)) {
					_current.remove(row);
					_proposed.append(row);
				} else {
					throw new SQLiteDataTableException("Row / Set Mismatch For DELETE Separate");
				}
			}
		} if(row._state == DataRowState.PENDING_DELETE ||
			row._state == DataRowState.TEMPORARY) {
			//throw new SQLiteDataTableException("Wrong Row State");
		} else {
			//throw new SQLiteDataTableException("Wrong Row State");
		}
	}

	/// Mark a row to be updated through Connection.
	/// Params:
	///   row = .
	public void markUpdate(DataRow row) {
		if(row._table !is this) throw new SQLiteDataTableException("Row / Table Mismatch For DELETE");
		if(row._state == DataRowState.DEFAULT) {
			row._state = DataRowState.PENDING_UPDATE;
		} else if(row._state == DataRowState.PENDING_UPDATE) {
		} else {
			//throw new SQLiteDataTableException("Wrong Row State");
		}
	}

	public void flatten() {
		DataRow o;

		_current.reset();
		while((o = _current.next()) !is null) {
			if(o._state == DataRowState.PENDING_DELETE) {
				_current.remove(o);
				_dropped.append(o);
			} else if(o._state & DataRowState.TEMPORARY) {
				o._state = DataRowState.DEFAULT;
				_current.remove(o);
				o._table = null;
			}
		}
		_current.reset();

		_proposed.reset();
		while((o = _proposed.next()) !is null) {
			if(o._state == DataRowState.PENDING_INSERT) {
				_proposed.remove(row);
				_current.append(row);
			} else {
				row._state = DataRowState.DEFAULT;
				_proposed.remove(row);
				row._table = null;
			}
		}
		_proposed.reset();
	}

	// ++++++++ ++++++++

	/// Fill DataTable through the Connection specified.
	/// Params:
	///   con = SQLite3 database Connection.
	public void fill(Connection con) {
		debug writefln(_buildSqlSelect());
		Cursor cur = con.createCursor();
		try {

			cur.execute(_buildSqlSelect());
			int[] types;
			if(_usingDataRowId) {
				// TODO: no fetch oid:
				types = new int[_columns.length+1];
				types[0] = SQLiteDataType.INT64;
				foreach(int i, DataColumn col; _columns) {
					types[i+1] = col.type;
				}
				SQLiteData[] r;
				if(length) clear();
				while((r = cur.fetchOne(types)) !is null) {
					version(ExplicitDelete) {
						DataRow o = new DataRow(r[0].dataInt64, r[1..$].dup, this);
						delete r;
						o._state = DataRowState.DEFAULT;
						_current.append(o);
					} else {
						DataRow o = new DataRow(r[0].dataInt64, r[1..$], this);
						o._state = DataRowState.DEFAULT;
						_current.append(o);
					}
				}
			} else {
				types = new int[_columns.length];
				foreach(int i, DataColumn col; _columns) {
					types[i] = col.type;
				}
				SQLiteData[] r;
				if(length) clear();
				while((r = cur.fetchOne(types)) !is null) {
					DataRow o = new DataRow(r, this);
					o._state = DataRowState.DEFAULT;
					_current.append(o);
				}
			}

		} finally {
			cur.close();
		}
	}
	/// Fill DataTable with the Connection and SQL SELECT specified.
	/// Params:
	///   con = SQLite3 database Connection.
	///   sql = SQL SELECT statement.
	public void fill(Connection con, char[] sql) {
		Statement stmt = con.createStatement();
		stmt.compile(sql);
		fill(stmt);
		stmt.close();
	}
	/// Fill DataTable with compiled SQL Statement.
	/// Params:
	///   stmt = Compiled SQL Statement.
	public void fill(Statement stmt) {
		Connection con = stmt.connection;
		Cursor cur = con.createCursor();
		// build columns:
		int cc = stmt.getColumnCount();
		if(cc <= 0) throw new SQLiteDataTableException("No Columns Available");
		if(length) clear();
		clearColumns();
		_width = _dfields.length = _columns.length = cc;
		for(size_t i= 0; i < cc; i++) {
			DataColumn col = new DataColumn();
			col._name = stmt.getColumnName(i);
			col._declType = stmt.getColumnDeclType(i);
			col._defaultValue = SQLiteData.NULL; // can't get default value.
			col._table = this;
			col._index = i;
			_columns[i] = col;
			_dfields[i] = col._defaultValue;
			_nidict[col._name] = i;
		}
		_oidIndex = -1; // don't know OID.
		// fill data in:
		try {

			cur.execute(stmt);
			int[] types = new int[_columns.length];
			foreach(int i, DataColumn col; _columns) {
				types[i] = col.type;
			}
			SQLiteData[] r;
			while((r = cur.fetchOne(types)) !is null) {
				DataRow o = new DataRow(r, this);
				o._state = DataRowState.DEFAULT;
				_current.append(o);
			}

		} finally {
			cur.close();
		}
	}

	/// .
	public void clear(bool destroyRows = false) {
		_current.clear(destroyRows);
		_dropped.clear(destroyRows);
		_proposed.clear(destroyRows);

		//_current = new DataRowSet();
		//_dropped = new DataRowSet();
		//_proposed = new DataRowSet();
	}

	/// Update database through the Connection specified.
	/// Params:
	///   con = SQLite3 database Connection.
	///   refresh = Refresh Table after update to Connection.
	public void update(Connection con, bool refresh = false) {
		debug writefln(_buildSqlUpdate());
		debug writefln(_buildSqlDelete());
		debug writefln(_buildSqlInsert());

		Statement si = con.createStatement();
		si.compile(_buildSqlInsert());
		Statement sd = con.createStatement();
		sd.compile(_buildSqlDelete());
		Statement su = con.createStatement();
		su.compile(_buildSqlUpdate());

		Cursor cur = con.createCursor();

		try {
			cur.execute("BEGIN;");

			DataRow row;
			_current.reset();
			while((row = _current.next()) !is null) {
				if(row._state & DataRowState.PENDING_DELETE) {
					if(_usingDataRowId) {
						sd.bindParameter(0, SQLiteData.create(row._id));
					} else {
						sd.bindParameter(0, row._fields[_oidIndex]);
					}
					cur.execute(sd);
					sd.reset();
					row._state = DataRowState.DEFAULT;
					_current.remove(row);
					row._table = null;
				} else if(row._state & DataRowState.PENDING_INSERT) {
					si.bindParameters(row._fields);
					cur.execute(si);
					si.reset();
					row._state = DataRowState.DEFAULT;
				} else if(row._state & DataRowState.PENDING_UPDATE) {
					if(_usingDataRowId) {
						su.bindParameters(row._fields~=SQLiteData.create(row._id));
					} else {
						su.bindParameters(row._fields[0 .. _oidIndex]~row._fields[_oidIndex+1 .. $]~row._fields[_oidIndex .. _oidIndex+1]);
					}
					cur.execute(su);
					su.reset();
					row._state = DataRowState.DEFAULT;
				}
			}
			_current.reset();

			_dropped.reset();
			while((row = _dropped.next()) !is null) {
				if(row._state & DataRowState.PENDING_DELETE) {
					if(_usingDataRowId) {
						sd.bindParameter(0, SQLiteData.create(row._id));
					} else {
						sd.bindParameter(0, row._fields[_oidIndex]);
					}
					cur.execute(sd);
					sd.reset();
					row._state = DataRowState.DEFAULT;
					_dropped.remove(row);
					row._table = null;
				} else {
					row._state = DataRowState.DEFAULT;
					_dropped.remove(row);
					row._table = null;
				}
			}
			_dropped.reset();

			_proposed.reset();
			while((row = _proposed.next()) !is null) {
				if(row._state & DataRowState.PENDING_INSERT) {
					si.bindParameters(row._fields);
					cur.execute(si);
					si.reset();
					row._state = DataRowState.DEFAULT;
					_proposed.remove(row);
					_current.append(row);
				} else {
					row._state = DataRowState.DEFAULT;
					_proposed.remove(row);
					row._table = null;
				}
			}
			_proposed.reset();

			cur.execute("COMMIT;");
		} catch {
			cur.execute("ROLLBACK;");
		} finally {
			su.close();
			sd.close();
			si.close();

			cur.close();
		}

		if(refresh) fill(con);
	}

	/// Create Table through the Connection specified.
	/// Params:
	///   con = SQLite3 database Connection.
	///   withOid = Create the OID Column.
	public void create(Connection con, bool withOid = false) {
		debug writefln(_buildSqlCreate(withOid));
		Cursor cur = con.createCursor();
		try {
			cur.execute(_buildSqlCreate(withOid));
		} finally {
			cur.close();
		}
	}

	/// Drop Table from the Connection specified.
	/// Params:
	///   con = SQLite3 database Connection.
	public void drop(Connection con) {
		debug writefln(_buildSqlDrop());
		Cursor cur = con.createCursor();
		try {
			cur.execute(_buildSqlDrop());
		} finally {
			cur.close();
		}
	}

	// ++++++++ ++++++++

	/// .
	public void buildIndex(bool forced = false) {
		_current.buildIndex(forced);
	}

	/// Get DataRow by index.
	/// Params:
	///   index = Row index.
	public DataRow row(int index) {
		return _current.row(index);
	}
	/// .
	public DataRow opIndex(int index) {
		return _current.row(index);
	}
	/// .
	public SQLiteData opIndex(int ri, int fi) {
		return _current.row(ri).getField(fi);
	}
	/// .
	public SQLiteData opIndex(int ri, char[] fn) {
		return _current.row(ri).getField(fn);
	}
	/// .
	public SQLiteData opIndexAssign(SQLiteData data, int ri, int fi) {
		return _current.row(ri).setField(fi, data);
	}
	/// .
	public SQLiteData opIndexAssign(SQLiteData data, int ri, char[] fn) {
		return _current.row(ri).setField(fn, data);
	}

}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
