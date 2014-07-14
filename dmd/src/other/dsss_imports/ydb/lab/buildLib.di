// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: July 25, 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

/**
    dsss builded lib has bugs, instead of with dmd -lib...
*/

module ydb.lab.buildLib;

private import  Path = tango.io.Path;
private import  tango.stdc.stdlib : system ;
private import  tango.io.vfs.FileFolder;
private import  tango.io.vfs.model.Vfs;
//import  tango.util.PathUtil;
private import  tango.util.log.Trace;

private import  dwin.sys.win32.CodePage : toMbsz;

/*
int main (char[][] args)
{
    try
    {
        if(args.length < 2) return error("main: args length must than 1");
        return buildLib(args[1..$]);
    }
    catch(Exception e)
    {
            debug error("main: ~ " ~ e.msg);
    }

}
*/

/**
    error:
    module Types.509 source file name '..\tango\tango\sys\win32\Types.di' must have .d extension

    solution: rename Types.di to Types.d

    Examples:
    ---
        char[][] myArgs =
        [
        r"D:\dwin".dup,
        "-version=DFL",
        "-version=DWT",
        "-version=DWTX",
        "-version=TANGOSVN",
        r"-JD:\dwt-addons\res",
        r"-JD:\dwt-samples\res",
        "-release",
        "-O",
        "-inline"
        r"-ofD:\tango\lib\dwin.lib"
        ];
        buildLib(myArgs);
    ---
*/

int buildLib(char[][] args)
{

        if(args.length < 2) return error("Usage:\r\n\tbuildLib directory args...");
        auto root = args[0];
        if(!Path.exists(root)) return error(root ~ " not exists");

        Trace.formatln ("Scanning '{}'", root);

        char[] command = "dmd -lib";

        auto scan = new FileFolder (root);
        auto tree = scan.tree;

        bool test (VfsInfo info)
        {
            char[] pattern = "*.d";
            bool result = Path.patternMatch (info.name, pattern);
            if(!result) return result;
            version(Win32) {}
            else
            {
                result = result && !Path.patternMatch (info.path, "dwin/sys/win32/");
            }

            return result;
        }
        auto catalog = tree.catalog (&test);

        foreach (file; catalog)
            command ~= " " ~ file.toString();

        if(args.length > 1)
            for(size_t i= 1; i < args.length; i++)
                command ~= " " ~ args[i];

        command = Path.native(command);
        Trace.formatln(command);
        system( toMbsz(command) );

        return 0;
}




    int error(char[] msg)
    {
        Trace.formatln(msg);
        return 1;
    }



version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
