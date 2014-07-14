// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: April 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.lab.Misc;

private import  dwin.text.pcre.RegExp;
private import  TextUtil = tango.text.Util;
private import  tango.io.device.File;
private import  tango.util.log.Trace;
private import  tango.io.FileScan;
private import Path = tango.io.Path;

version(LAB):

/**
    some Tango modules have Ansi Windows API implementation only,
    and tango pass (char[] ~ '\') to the API, this may cause problem
    I writeen this function to find the moudles
    Example
    ---
        char[] path = r"pathto\tango\tango\";
        auto fs = findAnsiWinAPI(path);
    ---

    Thre result is (Tagno 0.995)

    tango/tango/io/FileRoots.d contains GetLogicalDriveStringsA, but not contains GetLogicalDriveStringsW
    tango/tango/io/Console.d contains CreateFileA, but not contains CreateFileW
    tango/tango/io/MappedBuffer.d contains CreateFileMappingA, but not contains CreateFileMappingW
    tango/tango/core/sync/Semaphore.d contains CreateSemaphoreA, but not contains CreateSemaphoreW
    tango/tango/core/sync/Condition.d contains CreateSemaphoreA, but not contains CreateSemaphoreW
    tango/tango/sys/Process.d contains CreateProcessA, but not contains CreateProcessW
    tango/tango/sys/SharedLib.d contains LoadLibraryA, but not contains LoadLibraryW

*/

FileScan findContains(char[] path, char[] str)
{
    auto scan = new FileScan;
    scan
    (
        Path.standard(path),
        (FilePath fp, bool isDir)
        {
            if(isDir) return true;
            if(fp.suffix != ".d") return false;
            auto content = cast(char[]) File.get(fp.toString);
            if(TextUtil.containsPattern(content, str))
            {
                Trace.formatln("{} contains {},", fp.toString, str);
                return true;
            }
            return false;
        }
    );

    return scan;
}



FileScan findAnsiWinAPI(char[] path)
{
    auto regex = RegExp(r"\b([A-Z][a-z][a-zA-Z]+?)A\b\s*\(");
    auto scan = new FileScan;
    scan
    (
        Path.standard(path),
        (FilePath fp, bool isDir)
        {
            if(isDir) return true;
            if(fp.suffix != ".d") return false;
            auto content = cast(char[]) File.get(fp.dup.native.toString);
            if(auto m = regex.execute(content))
            {
                if(!TextUtil.containsPattern(content, m[1] ~ "W"))
                {
                    Trace.formatln("{} contains {}, but not contains {}", fp.toString, m[1] ~ "A", m[1] ~ "W");
                    return true;
                }
            }
            return false;
        }
    );

    return scan;
}


/**
    replac string and write to locale file

*/
char[] replaceWrite(char[] what, char[] from, char[] to, char[] writeto)
{
    auto result = TextUtil.substitute(what, from, to);
    if(writeto.length)
        (new File(writeto)).write(result);

    return result;
}





