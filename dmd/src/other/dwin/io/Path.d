
// Written in the D programming language.

/*******************************************************************************

        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.io.Path;


private import tango.io.FilePath;
private import TPath = tango.io.Path;
private import tango.sys.Environment;
version(Windows)
    private import dwin.sys.win32.SpecialPath;

        /***********************************************************************

            Returns an absolute version of the provided path if exists, where cwd (exeDir on Windows) is used
            as the prefix.

            The provided path is returned as is if already absolute.

        ***********************************************************************/

char[] toAbsolute( char[] path )
{
    scope fp = new FilePath(path);
    if (fp.isAbsolute)
        return path;

    version(Windows)
    {
        if( TPath.exists( exeDir() ~ path) )        
            return exeDir() ~ path;        
    }
    
    fp.absolute(Environment.cwd());    
    return fp.exists() ? fp.toString : path;
}


/**
    Transfer the content of one file to another, if dst directory is not exists, then create it first
    Example:
    ---
        char[] src = "D:\\ip.txt";
        char[] dst = "D:\\notexists\\ip2.txt";
        absCopyFile(src, dst);
        Stdout.formatln("dst {}", dst);
    ---
**/
void absCopyFile(char[] src, char[] dst)
{
    dst = TPath.standard(dst.dup); // \ to /
    char[] dstDir = TPath.pop(dst); // /x/y/z to /x/y
    TPath.createPath(dstDir);  // be sure the dst directory exists
    TPath.copy(src, dst);
}



version(Win32):

private import  dwin.sys.win32.CodePage : toString16zz;
private import  dwin.sys.win32.Wrapper;
private import  dwin.sys.Common;

/**
    remove all files in directory
    Params:
        dir = Windows format full path e.g. D:\test.txt 
*/
bool removeDirTree(char[] dir)
{
    alias SHFILEOPSTRUCTW SHFILEOPSTRUCT;
    SHFILEOPSTRUCT FileOp;

    FileOp.fFlags = FOF_NOCONFIRMATION | FOF_SILENT | FOF_NOERRORUI;
    FileOp.hNameMappings = null;
    FileOp.hwnd = null;
    FileOp.lpszProgressTitle = null;
    FileOp.pFrom = toString16zz(dir);
    FileOp.pTo = null;
    FileOp.wFunc = FO_DELETE;
    //FileOp.fAnyOperationsAborted = FALSE;

    bool result;
    if( SHFileOperationW(&FileOp) == 0 )
        if( FileOp.fAnyOperationsAborted == FALSE )
            result = true;
    return result;

}


/**
    copy directory or file
    directory without ending \
    Example:
    ---
        copyDirectory(r"D:\movie", r"D:\my movie");
    ---
*/
bool copyDirectory(char[] from, char[] to)
{
    alias SHFILEOPSTRUCTW SHFILEOPSTRUCT;
    SHFILEOPSTRUCT FileOp;

    FileOp.fFlags = FOF_NOCONFIRMATION | FOF_SILENT | FOF_NOERRORUI | FOF_NOCONFIRMMKDIR;
    FileOp.hNameMappings = null;
    FileOp.hwnd = null;
    FileOp.lpszProgressTitle = null;
    FileOp.pFrom = toString16zz(from);
    FileOp.pTo = toString16zz(to);
    FileOp.wFunc = FO_COPY;
    //FileOp.fAnyOperationsAborted = FALSE;

    bool result;
    if( SHFileOperationW(&FileOp) == 0 )
        if( FileOp.fAnyOperationsAborted == FALSE )
            result = true;
    return result;

}



/**
    Examples:
    ---
        char[] p = "/a/b/c.txt";
        p = parent(p);
        assert(p == "/a/b");
    ---
    Tango solution:
    p = p.pop.replace('\\', '/');

*/
char[] parent(char[] fullname)
out (result)
{
    assert(result.length <= fullname.length);
}
body
{
    size_t i;

    for (i = fullname.length; i > 0; i--)
    {
        version(Win32)
        {
            if (fullname[i - 1] == ':')
                break;
            if (fullname[i - 1] == '\\')
            {   i--;
                break;
            }
            if (fullname[i - 1] == '/')//to support server path, by d-programming-language-china.org 20070718
            {   i--;
                break;
            }
        }
        version(linux)
        {
            if (fullname[i - 1] == '/')
            {   i--;
                break;
            }
        }
    }
    return fullname[0 .. i];
}
//parent
debug(UnitTest) unittest
{
	char[] p = "/a/b/c.txt";
	p = parent(p);
	assert(p == "/a/b");
}

/// ditto
char[] parent(char[] fullname, int back)
{
	char[] result = fullname;
	for(size_t i= 0; i < back; i++)
	{
		result = parent(result);
	}
	return result;
}
debug(UnitTest) unittest
{
	char[] p = r"D:\a\b\c.txt";
	assert(parent(p,1) == r"D:\a\b");
	assert(parent(p,2) == r"D:\a");
	assert(parent(p,3) == r"D:");
	assert(parent(p,4) == r"D:");
}





