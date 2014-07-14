// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: April 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


/**
    bugs:
    
    moudule A(Like this module)
        import tango.net.http.HttpClient
    module B 
        import dwin.sys.win32.SpecialPath
    module C
        import A
        import B
        
    compile C by dmd 1042 causes "Unexpeted OPTLINK terminatied", what's the problem?
    
    add import tango.net.http.HttpClient to C to solve this problem

*/

module dwin.net.Net;

private import  tango.net.http.HttpClient;


/// timeOut: in seconds
bool isOnline(uint timeOut = 3)
{
    try
    {
        scope client = new HttpClient (HttpClient.Get, "http://www.google.com/");
        client.setTimeout(timeOut);
        client.open ();     
        scope(exit) client.close;
        // check return status for validity
        return client.isResponseOK;
    }
    catch(Exception e)
    {
        //debug Trace.formatln("config.isOnline catch {}", e.msg);
    }
    return false;
}



version(Windows):

private import  dwin.sys.win32.Wrapper;
private import  tango.sys.win32.Types;

/**
    Popup dial entry dialogs
    Example:
    ---
    dialUp("Broadband Connection");
    ---

*/

void dialUp(char[] entry = "Broadband Connection")
{
    return winExec("rasphone.exe -d \"" ~ entry ~ "\"", SW_HIDE);
    //return winExec("rasphone.exe -d " ~ entry, SW_HIDE);
}



/** quietly hang up the entry
    Example:
    ---
    hangUp("Broadband Connection");
    ---

    another way:
    拔号连接名 = "adsl"
    拔号用户名 = "username"
    拔号密码 = "password"

    --dial up：
    winExec(getSysDir().."\\rasdial.exe"," "..拔号连接名.." "..拔号用户名.." "..拔号密码);

    --hang up：
    winExec(getSysDir().."\\rasdial.exe"," "..拔号连接名.." /DISCONNECT");
*/

void hangUp(char[] entry = "Broadband Connection")
{
    //return winExec("rasphone.exe -h " ~ entry, SW_HIDE);
    return winExec("rasdial.exe \"" ~ entry ~ "\" /DISCONNECT", SW_HIDE);
    //return winExec("rasdial.exe " ~ entry ~ " /DISCONNECT", SW_HIDE);
}


version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
