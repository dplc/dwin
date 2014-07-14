    /**
 * For authorization.
 */

 /*******************************************************************************
         
         Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved
 
         License:        BSD style: $(LICENSE)
 
         Version:        Initial release: Appril 2008
 
         Authors:        modified to with Tango by yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )
 
 *******************************************************************************/
 
 

module dwin.database.sqlite._auth;

private import dwin.database.sqlite.c.sqlite3;
private import dwin.database.sqlite.Base;

/// .
public enum SQLiteAuthAction {
	/* from SQLITE_CREATE_INDEX to SQLITE_ANALYZE */ /* s1, s2      */

	CREATE_INDEX =          1,   /* Index Name      Table Name      */
	CREATE_TABLE =          2,   /* Table Name      NULL            */
	CREATE_TEMP_INDEX =     3,   /* Index Name      Table Name      */
	CREATE_TEMP_TABLE =     4,   /* Table Name      NULL            */
	CREATE_TEMP_TRIGGER =   5,   /* Trigger Name    Table Name      */
	CREATE_TEMP_VIEW =      6,   /* View Name       NULL            */
	CREATE_TRIGGER =        7,   /* Trigger Name    Table Name      */
	CREATE_VIEW =           8,   /* View Name       NULL            */
	DELETE =                9,   /* Table Name      NULL            */
	DROP_INDEX =           10,   /* Index Name      Table Name      */
	DROP_TABLE =           11,   /* Table Name      NULL            */
	DROP_TEMP_INDEX =      12,   /* Index Name      Table Name      */
	DROP_TEMP_TABLE =      13,   /* Table Name      NULL            */
	DROP_TEMP_TRIGGER =    14,   /* Trigger Name    Table Name      */
	DROP_TEMP_VIEW =       15,   /* View Name       NULL            */
	DROP_TRIGGER =         16,   /* Trigger Name    Table Name      */
	DROP_VIEW =            17,   /* View Name       NULL            */
	INSERT =               18,   /* Table Name      NULL            */
	PRAGMA =               19,   /* Pragma Name     1st arg or NULL */
	READ =                 20,   /* Table Name      Column Name     */
	SELECT =               21,   /* NULL            NULL            */
	TRANSACTION =          22,   /* NULL            NULL            */
	UPDATE =               23,   /* Table Name      Column Name     */
	ATTACH =               24,   /* Filename        NULL            */
	DETACH =               25,   /* Database Name   NULL            */
	ALTER_TABLE =          26,   /* Database Name   Table Name      */
	REINDEX =              27,   /* Index Name      NULL            */
	ANALYZE =              28,   /* Table Name      NULL            */
};

/// .
public enum SQLiteAuthCode {
	OK = SQLITE_OK, // 0
	DENY = SQLITE_DENY, // 1
	IGNORE = SQLITE_IGNORE, // 2
};

/// .
public interface IAuthorizer {
	public int authorize(int action, char[] s1, char[] s2, char[] s3, char[] s4);
}

/// .
package template TXAuth() {

	private IAuthorizer _authorizer;
	/// Get/Set authorizer.
	public IAuthorizer authorizer() {
		return _authorizer;
	}
	public IAuthorizer authorizer(IAuthorizer auth) {
		_authorizer = auth;
		_checkConnectionAvailable();
		if(auth is null) {
			sqlite3_set_authorizer(_pdb, null, null);
		} else {
			//sqlite3_set_authorizer(_pdb, &callback3_authorize, this);
			sqlite3_set_authorizer(_pdb, &callback3_authorize, cast(void*)this);
		}
		return auth;
	}

}

extern(C) int callback3_authorize(void* pu, int action, char* s1, char* s2, char* s3, char* s4) {
	Connection con = cast(Connection)pu;
	return con.authorizer().authorize(action,
		s1[0 .. _strlen(s1)],
		s2[0 .. _strlen(s2)],
		s3[0 .. _strlen(s3)],
		s4[0 .. _strlen(s4)]);
}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
