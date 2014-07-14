/**
 * Utility Classes and Functions.
 * http://iqk.sourceforge.net/
 * https://iqk.svn.sourceforge.net/svnroot/iqk
 * icee, 2006.
 */

 // Written in the D programming language.

 /*******************************************************************************

         Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved

         License:        BSD style: $(LICENSE)

         Version:        Initial release: April 2008

         Authors:        modified to works with Tango by yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

         bugfixed:
            getMasterItem
                sql ~= "WHERE name = "~name~";" to sql ~= "WHERE name = '"~name~"';"

 *******************************************************************************/



module dwin.database.sqlite.Util;

private import dwin.database.sqlite.Base;
version(Phobos)
    private import std.string;
else
{
    import tango.text.Util;
    import  tango.text.convert.Format;
}


public char[] sqlTextQuote(char[] v)
{
    version(Phobos)
        return "'"~std.string.replace(v, "'", "''")~"'";
    else
        return "'" ~ tango.text.Util.substitute(v, "'", "''") ~ "'";
}
public char[] sqlBlobQuote(ubyte[] v) {
	char[] r = new char[v.length*2+3];
	r[0] = 'x';
	r[$-1] = r[1] = '\'';
	for(size_t i= 0; i < v.length; i++) {
		ubyte d = cast(ubyte)(v[i]/16); // high.
		r[i*2+2] = cast(int)d < 10 ?  cast(char)('0' + d) : cast(char)('A' + d - 10);
		d = cast(ubyte)(v[i]%16); // low.
		r[i*2+3] = d < 10 ? cast(char)('0'+d) : cast(char)('A'+d-10);
	}
	return r;
}

/// .
public class DatabaseItem {
	public int seq;
	public char[] name;
	public char[] file;
	public this(int seq, char[] name, char[] file) {
		this.seq = seq;
		this.name = name;
		this.file = file;
	}
	public char[] toString() {
        version(Phobos)
            return std.string.format("<class: %s, seq = %d, name = \"%s\", file = \"%s\">",
                this.classinfo.name, seq, name, file);
        else
                       return Format("<class: {}, seq = {}, name = \"{}\", file = \"{}\">",
                            this.classinfo.name, seq, name, file);
	}

	// extra field for linking a master table:
	//MasterTable master;
}

// SQL: PRAGMA database_list;
// columns: seq, name, file.

/// .
public DatabaseItem[] getDatabaseItems(Connection con) {
	mixin TXArrayEx!(DatabaseItem);
	Cursor cur = con.createCursor();
	cur.execute("PRAGMA database_list;");
	while(cur.isRow()) {
		push(new DatabaseItem(cur.getColumnInt(0),
			cur.getColumnText(1),
			cur.getColumnText(2)));
		cur.next();
	}
	cur.close();
	return pack();
}

/// .
public class MasterItem {
	public /+MasterItemType+/int type;
	public char[] typeText;
	public char[] name;
	public char[] tableName;
	public int rootpage;
	public char[] sql;
	public this(int type, char[] typeText, char[] name,
		char[] tableName, int rootpage, char[] sql) {
		this.type = type;
		this.typeText = typeText;
		this.name = name;
		this.tableName = tableName;
		this.rootpage = rootpage;
		this.sql = sql;
	}
	public char[] toString() {
        version(Phobos)
            return std.string.format("<class: %s, type = %d, typeText = \"%s\" name = \"%s\","
			" tableName = \"%s\", rootpage = %d, sql = \"%s\">",
			this.classinfo.name, type, typeText, name, tableName, rootpage, sql);
        else
            return Format("<class: {}, type = {}, typeText = \"{}\" name = \"{}\","
			" tableName = \"{}\", rootpage = {}, sql = \"{}\">",
			this.classinfo.name, type, typeText, name, tableName, rootpage, sql);
	}
}

/// .
public enum MasterItemType {
	TABLE = 1,
	INDEX,
	VIEW,
	TRIGGER};

/// .
public class MasterTable {
	public MasterItem[] tables;
	public MasterItem[] indexes;
	public MasterItem[] views;
	public MasterItem[] triggers;
	// all items:
	public MasterItem[] items;
}

// SQL: SELECT * FROM dbName.sqlite_master;
// columns: type, name, tbl_name, rootpage, sql.

/// .
public MasterItem[] getMasterItems(Connection con, char[] dbName = null, bool temp = false) {
	mixin TXArrayEx!(MasterItem);
	Cursor cur = con.createCursor();
	char[] sql;
	if(dbName.length > 0) {
		sql = "SELECT * FROM "~dbName~".sqlite_master;";
	} else if(!temp) {
		sql = "SELECT * FROM sqlite_master;";
	} else {
		sql = "SELECT * FROM sqlite_temp_master;";
	}
	try {
		cur.execute(sql);
		while(cur.isRow()) {
			int type;
			char[] typeText = cur.getColumnText(0);
			switch(typeText[1]) {
				case 'a':
					type = MasterItemType.TABLE;
					break;
				case 'n':
					type = MasterItemType.INDEX;
					break;
				case 'i':
					type = MasterItemType.VIEW;
					break;
				case 'r':
					type = MasterItemType.TRIGGER;
					break;
				default:
			}
			push(new MasterItem(type, typeText,
				cur.getColumnText(1),
				cur.getColumnText(2),
				cur.getColumnInt(3),
				cur.getColumnText(4)));
			cur.next();
		}
	} catch(SQLiteVMException e) {
	} finally {
		cur.close();
	}
	return pack();
}

/// .
public MasterItem getMasterItem(Connection con, char[] name, char[] dbName = null, bool temp = false) {
	MasterItem mi;

	if(name.length > 0) {
		Cursor cur = con.createCursor();
		char[] sql;
		if(dbName.length > 0) {
			sql = "SELECT * FROM "~dbName~".sqlite_master ";
		} else if(!temp) {
			sql = "SELECT * FROM sqlite_master ";
		} else {
			sql = "SELECT * FROM sqlite_temp_master ";
		}
		sql ~= "WHERE name = '"~name~"';";
		try {
			cur.execute(sql);
			if(cur.isRow()) {
				int type;
				char[] typeText = cur.getColumnText(0);
				switch(typeText[1]) {
					case 'a':
						type = MasterItemType.TABLE;
						break;
					case 'n':
						type = MasterItemType.INDEX;
						break;
					case 'i':
						type = MasterItemType.VIEW;
						break;
					case 'r':
						type = MasterItemType.TRIGGER;
						break;
					default:
				}
				mi = new MasterItem(type, typeText,
					cur.getColumnText(1),
					cur.getColumnText(2),
					cur.getColumnInt(3),
					cur.getColumnText(4));
			}
		} catch(SQLiteVMException e) {
		} finally {
			cur.close();
		}
	}

	return mi;
}

/// .
/*
// Compiler warning: mixin is not a variable, 2009 04 02
public MasterTable getMasterTable(Connection con, char[] dbName = "main", bool temp = false) {
	MasterTable mt = new MasterTable();
	mixin TXArrayEx!(MasterItem) tables;
	mixin TXArrayEx!(MasterItem) indexes;
	mixin TXArrayEx!(MasterItem) views;
	mixin TXArrayEx!(MasterItem) triggers;
	mixin TXArrayEx!(MasterItem) items;
	Cursor cur = con.createCursor();
	char[] sql;
	if(dbName.length > 0) {
		sql = "SELECT * FROM "~dbName~".sqlite_master;";
	} else if(!temp) {
		sql = "SELECT * FROM sqlite_master;";
	} else {
		sql = "SELECT * FROM sqlite_temp_master;";
	}
	try {
		cur.execute(sql);
		while(cur.isRow()) {
			char[] typeText = cur.getColumnText(0);
			MasterItem mi = new MasterItem(-1, typeText,
				cur.getColumnText(1),
				cur.getColumnText(2),
				cur.getColumnInt(3),
				cur.getColumnText(4));
			switch(typeText[1]) {
				case 'a':
					mi.type = MasterItemType.TABLE;
					tables.push(mi);
					break;
				case 'n':
					mi.type = MasterItemType.INDEX;
					indexes.push(mi);
					break;
				case 'i':
					mi.type = MasterItemType.VIEW;
					views.push(mi);
					break;
				case 'r':
					mi.type = MasterItemType.TRIGGER;
					triggers.push(mi);
					break;
				default:
			}
			items.push(mi);
			cur.next();
		}
	} catch(SQLiteVMException e) {
	} finally {
		cur.close();
	}
	mt.tables = tables.pack();
	mt.indexes = indexes.pack();
	mt.views = views.pack();
	mt.triggers = triggers.pack();
	mt.items = items.pack();
	return mt;
}
*/

/// .
public class ColumnItem {
	public int cid;
	public char[] name;
	public char[] declType;
	public bool isNotNull;
	public bool isPrimaryKey;
	public SQLiteData defaultValue;
	public this(int cid, char[] name, char[] declType,
		bool isNotNull, bool isPrimaryKey, SQLiteData defaultValue) {
		this.cid = cid;
		this.name = name;
		this.declType = declType;
		this.isNotNull = isNotNull;
		this.isPrimaryKey = isPrimaryKey;
		this.defaultValue = defaultValue;
	}
	public char[] toString() {
		char[] f(SQLiteData d) {
			switch(d.type) { // no INT and TEXT16 here, see [.base.mapIToDType].
				case SQLiteDataType.INT64:
                    version(Phobos)
                        return std.string.format("%d", d.dataInt64);
                    else
                        return Format("{}", d.dataInt64);

				case SQLiteDataType.DOUBLE:
                    version(Phobos)
                        return std.string.format("%d", d.dataDouble);
                    else
                        return Format("{}", d.dataDouble);
				case SQLiteDataType.TEXT:
                    version(Phobos)
                        return std.string.format("\"%s\"", d.dataText);
                    else
                        return Format("\"{}\"", d.dataText);
				case SQLiteDataType.BLOB:
					//return std.string.format("\"%s\"", d.dataBlob);
					return "[BLOB]";
				case SQLiteDataType.NULL:
					return "[NULL]";
				default:
			}
			return "";
		}
        version(Phobos)
            return std.string.format("<class: %s, cid = %d, name = \"%s\", declType = \"%s\""
			" isNotNull = %s, isPrimaryKey = %s, defaultValue = %s>",
                this.classinfo.name, cid, name, declType, isNotNull, isPrimaryKey, f(defaultValue));
        else
            return Format("<class: {}, cid = {}, name = \"{}\", declType = \"{}\""
			" isNotNull = {}, isPrimaryKey = {}, defaultValue = {}>",
                this.classinfo.name, cid, name, declType, isNotNull, isPrimaryKey, f(defaultValue));
	}
}

// SQL: PRAGMA table_info(name);
// name: a table or view name.
// columns: cid, name, type, notnull, dflt_value, pk.

/// .
public ColumnItem[] getColumnItems(Connection con, char[] name) {
	mixin TXArrayEx!(ColumnItem);
	Cursor cur = con.createCursor();
	cur.execute("PRAGMA table_info("~name~");");
	while(cur.isRow()) {
		push(new ColumnItem(cur.getColumnInt(0),
			cur.getColumnText(1),
			cur.getColumnText(2),
			cur.getColumnInt(3)>0,
			cur.getColumnInt(5)>0,
			cur.getColumnData(4)));
		cur.next();
	}
	cur.close();
	return pack();
}

// SQL: SELECT * FROM name;
/// Simple, ONLY the cid, name, declType is available.
public ColumnItem[] getColumnItemsSimple(Connection con, char[] name) {
	Statement stmt = con.createStatement();
	ColumnItem[] rs;
	try {
		stmt.compile("SELECT * FROM "~name~";");
		int c = stmt.getColumnCount();
		rs = new ColumnItem[c];
		foreach(int i, inout ColumnItem r; rs) {
			r = new ColumnItem(i, stmt.getColumnName(i), stmt.getColumnDeclType(i),
				false, false, SQLiteData.NULL);
		}
	} catch(SQLiteVMException e) {
	} finally {
		stmt.close();
	}
	return rs;
}

/// .
public class IndexItem {
	public int seq;
	public char[] name;
	public bool isUnique;
	public this(int seq, char[] name, bool isUnique) {
		this.seq = seq;
		this.name = name;
		this.isUnique = isUnique;
	}
	public char[] toString() {
        version(Phobos)
            return std.string.format("<class: %s, seq = %d, name = \"%s\", isUnique = %s>",
                this.classinfo.name, seq, name, isUnique);
        else
            return Format("<class: {}, seq = {}, name = \"{}\", isUnique = {}>",
                this.classinfo.name, seq, name, isUnique);
	}
}

// SQL: PRAGMA index_list(name);
// table name.
// columns: seq, name, unique.

/// .
public IndexItem[] getIndexItems(Connection con, char[] name) {
	mixin TXArrayEx!(IndexItem);
	Cursor cur = con.createCursor();
	cur.execute("PRAGMA index_list("~name~");");
	while(cur.isRow()) {
		push(new IndexItem(cur.getColumnInt(0),
			cur.getColumnText(1),
			cur.getColumnInt(2)>0));
		cur.next();
	}
	cur.close();
	return pack();
}

// SQL: PRAGMA index_info(name);
// index name.
// columns: seqno, cid, name.

/// .
public class IndexInfoItem {
	public int seq;
	public int cid;
	public char[] name;
	public this(int seq, int cid, char[] name) {
		this.seq = seq;
		this.cid = cid;
		this.name = name;
	}
	public char[] toString() {
        version(Phobos)
            return std.string.format("<class: %s, seq = %d, cid = %d, name = \"%s\">",
                this.classinfo.name, seq, cid, name);
        else
                       return Format("<class: {}, seq = {}, cid = {}, name = \"{}\">",
                            this.classinfo.name, seq, cid, name);
	}
}

/// .
public IndexInfoItem[] getIndexInfoItems(Connection con, char[] name) {
	mixin TXArrayEx!(IndexInfoItem);
	Cursor cur = con.createCursor();
	cur.execute("PRAGMA index_info("~name~");");
	while(cur.isRow()) {
		push(new IndexInfoItem(cur.getColumnInt(0),
			cur.getColumnInt(1),
			cur.getColumnText(2)));
		cur.next();
	}
	cur.close();
	return pack();
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
