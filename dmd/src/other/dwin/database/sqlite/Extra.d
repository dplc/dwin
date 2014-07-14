
// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: May 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.database.sqlite.Extra;

private import dwin.database.sqlite.All;

debug import tango.util.log.Trace;

private bool exists(Connection con, char[] name, char[] dbName = null, bool temp = false, char[] type = "table")
{
    if(!name.length || con.closed) return false;
    bool result;

    Cursor cur = con.createCursor();
    scope(exit) cur.close;

    char[] sql;
    if(dbName.length > 0)
        sql = "SELECT * FROM "~dbName~".sqlite_master ";
    else if(!temp)
        sql = "SELECT * FROM sqlite_master ";
    else
        sql = "SELECT * FROM sqlite_temp_master ";

    sql ~= "WHERE (type = '" ~ type ~ "') AND (name = '" ~ name ~ "');"; /// no ' cause VM exception

    try
    {
        cur.execute(sql);
        result = cur.isRow;
    }
    catch(SQLiteVMException e)
        debug Trace.formatln("tableExists catch", e.msg);

	return result;
}

public bool tableExists(Connection con, char[] name, char[] dbName = null, bool temp = false)
{
	return exists(con, name, dbName, temp, "table");
}