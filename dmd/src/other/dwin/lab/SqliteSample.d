/**
 * SQLiteD Sample.
 * icee, 2006.
 */

// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: April 2008

        Authors:        Modified to with Tango yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.lab.SqliteSample;

version(LAB):

version(Phobos)
{
    import std.stdio;
    import std.file;
    import std.process;
    import std.string; // for cmp in the user collation demo.
}
else
{
    import tango.io.Stdout;
    import  tango.io.FilePath;
    alias Stdout writefln;
    alias Stdout writef;

    import tango.text.Ascii;
    alias compare cmp;

}

private import dwin.database.sqlite.All;


int SqliteSample()
{
    version(Phobos)
        writefln("SQLiteD Sample. [%s T %s]\n", __DATE__, __TIME__);
    else
        Stdout.formatln("SQLiteD Sample. [{} T {}]\n", __DATE__, __TIME__);

	char[] databaseName = "sample.db";

    
    version(Phobos)
    {
        if(std.file.exists(databaseName))
            std.file.remove(databaseName);
    }
    else
    {
        FilePath fp = FilePath(databaseName);    // cause VM exception if exists
        if(fp.exists) fp.remove;
    }
    
	//sqlite3* pdb;
	//sqlite3_open("sample.db", &pdb);
	//sqlite3_close(pdb);

	try {
            writefln("[Open Connection:]\n");

            Connection con = new Connection();
            con.open(databaseName);

		/++

		con.onCommit = delegate int(Connection con) {
			writefln("SQLite3: Commit!");
			return 0;
		};
		con.onUpdate = delegate void(Connection con, int op, char[] dbn, char[] tbn, long oid) {
			writefln("SQLite3: Update! [%d] [%s.%s %d]", op, dbn, tbn, oid);
			return 0;
		};
		con.onCollationNeeded = delegate void(Connection con, char[] name, int encoding) {
			writefln("SQLite3: Collation Needed! [%s] [%d]", name, encoding);
		};

		++/

		Cursor cur = con.createCursor();

		writefln("[Create Table And Insert Rows:]\n");

		cur.execute("create table IF NOT EXISTS sample (title TEXT, author TEXT, rank INT);"c);
		cur.execute("insert into sample (title, author, rank) values ('First Look', 'icee', 4);"c);
		cur.execute("insert into sample (title, author, rank) values ('Second Look', 'icee', 5);"c);

        /*
        /// not works with dmd 1.035 yidabu 2008 09 15
		Statement stmt = con.createStatement();
		stmt.compile("insert into sample (title, author, rank) values (?, ?, ?);"c);
		static SQLiteData[][] ds = [
			[{dataText: "Story I", type: SQLiteDataType.TEXT},
				{dataText: "lyne", type: SQLiteDataType.TEXT},
				{dataInt: 5, type: SQLiteDataType.INT}],
			[{dataText: "Story II", type: SQLiteDataType.TEXT},
				{dataText: "icee", type: SQLiteDataType.TEXT},
				{dataInt: 2, type: SQLiteDataType.INT}],
			[{dataText: "Story IV", type: SQLiteDataType.TEXT},
				{dataText: "icee", type: SQLiteDataType.TEXT},
				{dataInt: 4, type: SQLiteDataType.INT}],
			[{dataText: "Story III", type: SQLiteDataType.TEXT},
				{dataText: "icee", type: SQLiteDataType.TEXT},
				{dataInt: 3, type: SQLiteDataType.INT}]];
		con.begin();
		foreach(SQLiteData[] ps; ds) {
			stmt.reset();
			stmt.bindParameters(ps);
			//writefln(cur.execute(stmt));
            stmt.step();    // should be step ?
		}
		con.commit();
		stmt.close();

		writefln("\n[Query 1:]\n");
        */
        
		cur.execute("select title, author, rank, _rowid_ from sample;"c);
		while(cur.isRow) {
			writef(cur.getColumnText(0), \t, cur.getColumnDeclType(0));
			writefln(\t, cur.getColumnInt(2), \t, cur.getColumnDeclType(2));
			cur.next();
		}

		writefln("\n[Use DataTable:]\n");

		DataTable dtb = new DataTable();
		dtb.name = "sample";
		//dtb.addColumn(new DataColumn("rowid", SQLiteDataType.INT), true);
		dtb.usingDataRowId = true;
		dtb.addColumn(new DataColumn("title", SQLiteDataType.TEXT));
		dtb.addColumn(new DataColumn("author", SQLiteDataType.TEXT));
		dtb.addColumn(new DataColumn("rank", SQLiteDataType.INT));
		dtb.sqlFilter = "rank >= 3";
		dtb.sqlOrder = "rank desc, title asc";
		//dtb.limit = 100;
		//dtb.offset = 10;
		dtb.fill(con);
		writefln("DataTable Length: ", dtb.length, \n);
		//for(size_t i=0; i<dtb.length; i++) {
		//	writefln(dtb[i][0].dataText, "\t(%d)", dtb[i, 2].dataInt);
		//}
		foreach(DataRow row; dtb) {
            version(Phobos)
                writefln(row[0].dataText, "\t(%d)", row[2].dataInt);
            else
                Stdout.formatln("{}\t({})", row[0].dataText, row[2].dataInt);

		}

		static SQLiteData f1 = {dataText: "First Look 2nd Edition", type: SQLiteDataType.TEXT};
		DataRow row;

		//dtb[2, 0] = f1;
		row = dtb.next();
		row.markDelete();

		dtb.skip(1);
		row = dtb.next();
		row[0] = f1;
		row.markUpdate();

		row = dtb.createRow();
		static SQLiteData[] dx = [
			{dataText: "A Brand New World", type: SQLiteDataType.TEXT},
			{dataText: "lyne", type: SQLiteDataType.TEXT},
			{dataInt: 4, type: SQLiteDataType.INT}];
		row[0] = dx[0];
		row[1] = dx[1];
		row[2] = dx[2];
		row.markInsert();

		dtb.update(con);

		writefln("\n[Query 2:]\n");

		cur.execute("select title, author, rank from sample"c
			" where rank >= 3 order by rank desc, title asc;"c);

		static int[] ts1 = [
			SQLiteDataType.TEXT,
			SQLiteDataType.TEXT,
			SQLiteDataType.INT];

		SQLiteData[][] rs1 = cur.fetchAll(ts1);
		foreach(SQLiteData[] r; rs1) {
            version(Phobos)
                writefln(r[0].unpack!(char[])(), "\t(%d)", r[2].unpack!(int)());
            else
                Stdout.formatln( "{}\t({})", r[0].unpack!(char[])(), r[2].unpack!(int)());

		}

		writefln("\n[User Function And Aggregate:]\n");

		con.registerUserFunction(
			delegate SQLiteData(SQLiteData[] args) {
				SQLiteData r;
				r.dataText = "Hello World!";
				r.type = SQLiteDataType.TEXT;
				return r;
			}, "hello", -1);
		con.registerUserFunction(
			delegate SQLiteData(SQLiteData[] args) {
				double[2] d;
				for(size_t i= 0; i < 2; i++) {
					if(args[i].type == SQLiteDataType.DOUBLE)
						d[i] = args[i].dataDouble;
					else if(args[i].type == SQLiteDataType.INT64)
						d[i] = args[i].dataInt64;
					else d[i] = 0;
				}
				SQLiteData r;
				r.dataDouble = d[0] * d[1];
				r.type = SQLiteDataType.DOUBLE;
				return r;
			}, "mul", 2);
		cur.execute("select hello('nothing', 'something', 'anything'), mul(3, 5), mul(4.7, 5.5);"c);
		writefln(cur.getColumnText(0), \t, cur.getColumnDouble(1), \t, cur.getColumnDouble(2));
		cur.done();
		con.unregisterUserFunction("hello", -1);

		int x = 1;
		con.registerUserAggregate(
			delegate (SQLiteData[] args) {
				x *= args[0].dataInt64;
			},
			delegate SQLiteData() {
				SQLiteData r;
				r.dataInt64 = x;
				r.type = SQLiteDataType.INT64;
				x = 1;
				return r;
			}, "xmul", 1);
		cur.execute("select xmul(rank), xmul(rank) from sample;"c);
		writefln(cur.getColumnInt(0), \t, cur.getColumnInt(1));
		cur.done();
		con.unregisterUserAggregate("xmul", 1);

		writefln("\n[User Collation:]\n");

		con.registerUserCollation(delegate int(void[] s1, void[] s2) {
			//return -std.string.cmp(cast(char[])s1, cast(char[])s2);
			return -cmp(cast(char[])s1, cast(char[])s2);
		}, "xcmp");
		writefln("<order by title asc>");
		cur.execute("select title from sample order by title asc;"c);
		while(cur.isRow) {
			writefln(\t, cur.getColumnText(0));
			cur.next();
		}
		writefln("\n<order by title collate xcmp asc>");
		cur.execute("select title from sample order by title collate xcmp asc;"c);
		while(cur.isRow) {
			writefln(\t, cur.getColumnText(0));
			cur.next();
		}
		con.unregisterUserCollation("xcmp");

		writefln("\n[Script (Batch):]\n");
		cur.executeScript("begin;"
			"create table sx (a, b);"
			"insert into sx (a, b) values ('sx tx 1', 100);"
			"insert into sx (a, b) values ('sx tx 2', 200);"
			"insert into sx (a, b) values ('sx tx 3', 300);"
			"insert into sx (a, b) values ('sx tx 4', 400);"
			"select * from sx;"
			"drop table sx;"
			"commit;",
			delegate (Cursor cur) {
				int cc = cur.getColumnCount();
				if(cur.affectedRows == 1) {
					for(size_t i=0; i<cc; i++)
                    {
                        version(Phobos)
                            writef("(%s)", cur.getColumnName(i));
                        else
                            Stdout.format("({})", cur.getColumnName(i));
                    }
                    writefln();
				}
				for(size_t i=0; i<cc; i++) writef("|", cur.getColumnText(i));
				writefln("|");
			});

		writefln("\n[Utils Test:]");

		cur.execute("create table IF NOT EXISTS tx1 (a TEXT DEFAULT 'TX1TX1', b REAL NOT NULL, c INT DEFAULT 100);"c);
		cur.execute("create index idx_tx1_ab on tx1(a, b);"c);
		cur.execute("create view vx1 as select b as vb, c as vc from tx1;"c);
		cur.execute("create trigger trg_vx1_insert instead of insert on vx1 begin"c
			" insert into tx1 (b, c) values (new.vb, new.vc);"c
			" end;"c);

		writefln("\nDatabase Items:\n");
		foreach(DatabaseItem i; getDatabaseItems(con)) {
			writefln(i);
		}
		writefln("\nMaster Items:\n");
		foreach(MasterItem i; getMasterItems(con)) {
			writefln(i);
		}
		writefln("\nColumn Items [tx1]:\n");
		foreach(ColumnItem i; getColumnItems(con, "tx1")) {
			writefln(i);
		}
		writefln("\nColumn Items Simple [tx1]:\n");
		foreach(ColumnItem i; getColumnItemsSimple(con, "tx1")) {
			writefln(i);
		}
		writefln("\nIndex Items [tx1]:\n");
		foreach(IndexItem i; getIndexItems(con, "tx1")) {
			writefln(i);
		}
		writefln("\nIndex Info Items [idx_tx1_ab]:\n");
		foreach(IndexInfoItem i; getIndexInfoItems(con, "idx_tx1_ab")) {
			writefln(i);
		}
		writefln();

		cur.close();
		con.close();

	} catch(SQLiteVMException e) {
		writefln("Exception: ", e.msg, ". ErrorCode: ", e.code);
	} catch(SQLiteDException e) {
		writefln("Exception: ", e.msg);
	} catch(Exception e) {
		writefln("Exception: ", e.msg);
	}

    version(Phobos) system("pause");
	return 0;
}
