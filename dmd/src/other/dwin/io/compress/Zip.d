// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: July 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

/// Tango Zip module has bugs, non-ASCII path is not supported
/// phobos version is simple and works fine

module dwin.io.compress.Zip;


version(PhobosCompatibility):

private import std.zip;
private import tango.io.device.File;
private import tango.io.FilePath;
private import Path = tango.io.Path;

version(Win32)
    pragma(lib, "tangobos.lib");


    void createArchive(char[] archive, FilePath[] files...)
    {
        auto zr = new ZipArchive();
        foreach( file ; files )
        {
            auto path = file.dup.native.toString();
            //auto name = CodePage.into(path.dup, new char[path.length*3]);   //
            auto am = new ArchiveMember();
            am.compressionMethod = 8;
            am.name = path;
            am.expandedData = cast(ubyte[]) File.get(path);
            am.expandedSize = am.expandedData.length;
            zr.addMember(am);
        }
        auto file = new File(archive, File.WriteCreate);
        scope(exit) file.close();
        file.write( cast(ubyte[]) zr.build() );
    }


    void extractArchive(char[] archive, char[] dest)
    {
        auto buffer = cast(ubyte[]) File.get(archive);
        auto zr = new ZipArchive( cast(void[])buffer );
        foreach(ArchiveMember am; zr.directory)
        {
            zr.expand(am);
            auto path = FilePath( Path.join(dest, am.name[3..$]) );   /// bug with tango zip, remove leading X:/
            path.dup.pop.create();
            auto file = new File(path.dup.native.toString);
            scope(exit) file.close();
            file.write(am.expandedData);
        }
    }




/+

/**
    Examples:
    ---
    char[] src = "yidabu";
    char[] des = zip(src);
    Stdout(src).newline;
    ---
*/

char[] toZip(char[] s)
{
    scope cond = new GrowBuffer;
    scope comp = new ZlibOutput(cond);
    comp.write(s);
    comp.close;
    return (cast(char[]) cond.slice);
}

/**

*/
char[] fromZip(char[] s)
{
    scope cond = new GrowBuffer;
    scope decomp = new ZlibInput(cond);
    cond.write(s);
    auto buffer = new ubyte[s.length * 6];
    buffer = buffer[0 .. decomp.read(buffer)];
    return cast(char[]) buffer;
}
debug(UnitTest) unittest
{
    assert(fromZip(toZip("yidabu"c)) == "yidabu"c);
}




/**
    Examples:
    ---
    char[] src = "yidabu";
    char[] des = bzip(src);
    Stdout(src).newline;
    ---
*/

char[] toBzip(char[] s)
{
    scope cond = new GrowBuffer;
    scope comp = new BzipOutput(cond);
    comp.write(s);
    comp.close;
    return (cast(char[]) cond.slice);
}

/**

*/
char[] fromBzip(char[] s)
{
    scope cond = new GrowBuffer;
    scope decomp = new BzipInput(cond);
    cond.write(s);
    auto buffer = new ubyte[s.length * 8];
    buffer = buffer[0 .. decomp.read(buffer)];
    return cast(char[]) buffer;
}
debug(UnitTest) unittest
{
    assert(fromBzip(toBzip("yidabu"c)) == "yidabu"c);

}

+/
