/**
 * SQLiteD Bench Mark.
 * icee, 2006.
 */
 // Written in the D programming language.
 
 /*******************************************************************************
         
         Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved
 
         License:        BSD style: $(LICENSE)
 
         Version:        Initial release: April 2008
 
         Authors:        Modified to works with Tango by yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )
 
 *******************************************************************************/
 
 module dwin.lab.SqliteBench;
 
version(LAB):

version(Phobos)
{
    import std.stdio;
    import std.file;
    import std.process;
    import std.string;
    import std.date;
}
else
{
    import tango.io.Stdout;
    import  tango.io.FilePath;
    alias Stdout writefln;
    alias Stdout writef;
    
    import tango.text.Ascii;
    alias compare cmp;
    
    import tango.text.convert.Format;
    
    import  tango.time.Clock;
    
}

private import dwin.database.sqlite.All;
pragma(lib, "sqlite3.lib");

int SqliteBench() 
{
    version(Phobos)
        writefln("SQLiteD Bench Mark. [%s T %s]\n", __DATE__, __TIME__);
    else
        Stdout.formatln("SQLiteD Bench Mark. [{} T {}]\n", __DATE__, __TIME__);

	char[] databaseName = "bench.db";

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

	long ts;
	void bStart(char[] msg = ".0>") {
        version(Phobos)
            ts = getUTCtime();
        else
            ts = Clock.now.ticks;
		writefln(msg);
	}
	void bStop(char[] msg = "") {
        version(Phobos)
            writefln("[%s: %d ms]", msg, getUTCtime-ts);
        else
            Stdout.formatln("[{}: {} ms]", msg, Clock.now.ticks-ts);
	}

	Connection con = new Connection();
	con.open(databaseName);
	Cursor cur = con.createCursor();

	cur.execute("create table bench (a TEXT DEFAULT 'BEnCh TEsT', b INT);");

	Statement stmt = con.createStatement();
	stmt.compile("insert into bench (a, b) values (?, ?);"c);
	static char[][5] texta = [
		"ABCDEFTEST",
		"ghijklmntestopq",
		"rstuvTEST",
		"wxyztest",
		"TESTJUNKGHIJKLMNOPQRSTUVWXYZ"];
	int nrow = 50000;
	con.begin();
	bStart();
	for(size_t i= 0; i < nrow; i++) {
		stmt.reset();
		stmt.bindParameter(0, texta[i%5]);
		stmt.bindParameter(1, i);
		cur.execute(stmt);
	}
    version(Phobos)
        bStop(format("Insert %d In Transaction", nrow));
    else
        bStop(Format("Insert {} In Transaction", nrow)); 
	con.commit();
	bStop("Commit");

	/+
	bStart();
	for(size_t i= 0; i < nrow/1000; i++) {
		stmt.reset();
		stmt.bindParameter(0, texta[i%5]);
		stmt.bindParameter(1, i);
		cur.execute(stmt);
	}
	bStop(format("Insert %d With Auto Commit", nrow/1000));
	+/
	stmt.close();

	bStart();
	cur.execute("select * from bench;");
	cur.done();
	bStop("Select / Done");
	bStart();
	cur.execute("select * from bench where b >= 0;");
	cur.done();
	bStop("Select Where / Done");
	bStart();
	version(Phobos) cur.execute(format("select * from bench where b >= %d;", nrow/2));
               else cur.execute(Format("select * from bench where b >= {};", nrow/2));
                   
	cur.done();
	bStop("Select Where 50% / Done");
	bStart();
	cur.execute("select * from bench;");
	while(cur.isRow) {
		cur.getColumnText(0);
		cur.getColumnInt(1);
		cur.next();
	}
	bStop("Select / Get Column... (iCol), Loop");
	bStart();
	cur.execute("select * from bench;");
	while(cur.isRow) {
		cur.getColumnData(0);
		cur.getColumnData(1);
		cur.next();
	}
	bStop("Select / Get ColumnData (iCol, -1), Loop");

	bStart();
	cur.execute("select * from bench;");
	while(cur.isRow) {
		cur.fetchOne();
	}
	bStop("Select / Fetch One (null), Loop");
	bStart();
	cur.execute("select * from bench;");
	cur.fetchAll();
	bStop("Select / Fetch All (null)");

	bStart();
	cur.execute("update bench set a='TEXT UPdatEd' where b%5 > 1;");
	bStop("Update Where 60%");

	bStart();
	cur.execute("delete from bench where b%5 > 2;");
	bStop("Delete Where 40%");

	bStart();
	cur.execute("vacuum;");
	bStop("Vacuum");

	DataTable dtb = new DataTable("bench");
	dtb.retrieveColumns(con);
	bStart();
	dtb.fill(con);
    version(Phobos)
        bStop(format("Fill DataTable From Connection %d", dtb.length));
    else
        bStop(Format("Fill DataTable From Connection {}", dtb.length));
        
	bStart();
	//for(size_t i= 0; i < dtb.length; i++) {
	//	dtb[i, 1] = SQLiteData.create(i);
	//}
	foreach(DataRow row, int i; dtb) {
		row[1] = SQLiteData.create(i);
		row.markUpdate();
	}
    version(Phobos) bStop(format("Change DataTable Rows %d", dtb.length));
    else bStop(Format("Change DataTable Rows {}", dtb.length));
        
	for(size_t i= 0; i < nrow/5; i++) {
		DataRow row = dtb.createRow();
		row["a"] = SQLiteData.create(cast(char[])"BEnCh nEw InSeRTed");
		row["b"] = SQLiteData.create(1000000+i);
		row.markInsert(false);
	}
	version(Phobos) bStop(format("Insert DataTable Rows %d", nrow/5));
	else bStop(Format("Insert DataTable Rows {}", nrow/5));
        
	dtb.update(con);
	version(Phobos) bStop(format("Update DataTable Changes To Connection %d", dtb.length));
	else bStop(Format("Update DataTable Changes To Connection {}", dtb.length));

	cur.close();
	con.close();

	version(Phobos) system("pause");
	return 0;
}
