
// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2008  (yidabu  g m a i l at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Mar 2008
                        rewrite: Apr 30, 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.io.PathScan;

private import tango.io.FilePath,
        tango.time.Clock,
        //tango.util.PathUtil,
        tango.core.Exception;

private import Path = tango.io.Path;
private import TextUtil = tango.text.Util;
    
debug import tango.io.Stdout;


/*******************************************************************************

        Recursively scan files and directories, adding filtered files to
        an output structure as we go. This can be used to produce a list
        of subdirectories and the files contained therein. 
        The following example lists all files with suffix ".d" located via the dwin
        directory and exclude that file path contains "\\lab\\" :
        ---
        PathScan scan = new PathScan();
        scan.include = ["*.d", "*.di"];
        scan.exclude = ["*\\test\\*", "*\\lab\\*"];
        scan.sizeAtLeast = 1024 * 10;
        auto result = scan(r"D:\path\to\dwin");

        Stdout.formatln ("\n{} Files", result.files.length);
        foreach(file; result.files)
            Stdout(file).newline;

        Stdout.formatln ("\n{} Folders", result.folders.length);
        foreach(folder; result.folders)
            Stdout(folder).newline;
        ---
        
        This is unlikely the most efficient method to scan a vast number of
        files, but operates in a convenient manner
        
        See_Also:
            http://www.nirsoft.net/utils/search_my_files.html

*******************************************************************************/


class PathScan
{
    this()
    {
        nowTicks = Clock.now.ticks;   /// time compare in ticks    
    }
    
    char[] root;
    bool recurse = false; /// recurse scan

    /// wildcard filter
    ///See_Also: tango.util.PathUtil
    char[][] include;
    char[][] exclude;
    

    ulong sizeAtLeast = SIZE_DEFAULT;  // in bytes
    ulong sizeAtMost = SIZE_DEFAULT;  // in bytes

    long modifiedAtLeast = TIME_DEFAULT; //in ticks   
    long modifiedAtMost = TIME_DEFAULT; //in ticks 

    long createdAtLeast = TIME_DEFAULT;
    long createdAtMost = TIME_DEFAULT;
    
    long accessedAtLeast = TIME_DEFAULT;
    long accessedAtMost = TIME_DEFAULT;

    long maxFiles = FILES_DEFAULT;
    long maxFolders = FOLDERS_DEFAULT;


        ulong bytes; /// available if sizeAtLeast or sizeAtMost setted
    
        //graped from tango.io.FileScan    
        alias sweep     opCall;

        FilePath[]      fileSet;
        char[][]        errorSet;
        FilePath[]      folderSet;     
    

        
        /***********************************************************************

            Alias for Filter delegate. Accepts a FilePath & a bool as 
            arguments and returns a bool.

            The FilePath argument represents a file found by the scan, 
            and the bool whether the FilePath represents a folder.

            The filter should return true, if matched by the filter. Note
            that returning false where the path is a folder will result 
            in all files contained being ignored. To always recurse folders, 
            do something like this:
            ---
            return (isDir || match (fp.name));
            ---

        ***********************************************************************/

        alias FilePath.Filter Filter;
        Filter filter;

       /***********************************************************************

                Return all the errors found in the last scan

        ***********************************************************************/

        public char[][] errors ()
        {
                return errorSet;
        }

        /***********************************************************************

                Return all the files found in the last scan

        ***********************************************************************/

        public FilePath[] files ()
        {
                return fileSet;
        }

        /***********************************************************************
        
                Return all directories found in the last scan

        ***********************************************************************/

        public FilePath[] folders ()
        {
                return folderSet;
        }

        
        PathScan sweep ()
        {
                return sweep (this.root, this.filter, this.recurse);
        }        
        
        /***********************************************************************

                Sweep a set of files and directories from the given parent
                path, with no filtering applied
        
        ***********************************************************************/
        //path without ending \\ or /
        PathScan sweep (char[] path, bool recurse=true)
        {
                return sweep (path, cast(Filter) null, recurse);
        }

        /***********************************************************************

                Sweep a set of files and directories from the given parent
                path, where the files are filtered by the given suffix
        
        ***********************************************************************/
        
        PathScan sweep (char[] path, char[] match, bool recurse=true)
        {
                return sweep (path, (FilePath fp, bool isDir)
                             {return isDir || fp.suffix == match;}, recurse);
        }

        /***********************************************************************

                Sweep a set of files and directories from the given parent
                path, where the files are filtered by the provided delegate

        ***********************************************************************/
        
        PathScan sweep (char[] path, Filter filter, bool recurse=true)
        {
                errorSet = null, fileSet = folderSet = null;
                this.filter = filter;
                return scan (new FilePath(path), &filter_, recurse); // standard by FilePath
        }

        /***********************************************************************

                Internal routine to locate files and sub-directories. We
                skip entries with names composed only of '.' characters. 

        ***********************************************************************/

        private PathScan scan (FilePath folder, Filter filter, bool recurse) 
        {
                try {
                    auto paths = folder.toList (filter);
                
                    auto count = fileSet.length;
                    foreach (path; paths)
                    {
                            if(maxFiles != FILES_DEFAULT && fileSet.length >= maxFiles )
                                    return this;
                            if(maxFolders != FOLDERS_DEFAULT && folderSet.length >= maxFolders )
                                    return this;           
                            
                            if (! path.isFolder)
                                   fileSet ~= path;
                             else
                             {
                                folderSet ~= path.native;
                                if (recurse)
                                    scan (path, filter, recurse);
                             }
                    }

                    } catch (IOException e)
                             errorSet ~= e.toString;
                return this;
        }    
        
    private bool filter_(FilePath fp, bool isDir)
    {
        if(isDir) return true;
        
        char[] path = fp.native.toString;
        
        // wildcard path include and exclude filter
        if( include.length )
        {
            foreach(p; include)
                if( Path.patternMatch(path, TextUtil.trim(p)) )
                    goto EXCLUDE;
            return false;
        }

EXCLUDE:
        if( exclude.length )
        {
            foreach(p; exclude)
                if( Path.patternMatch(path, TextUtil.trim(p)) )
                    return false;
        }
        
        
        // file size filter
        ulong size;        
        if(sizeAtLeast != SIZE_DEFAULT || sizeAtMost != SIZE_DEFAULT)
        {
            size = fp.fileSize();            
            if(sizeAtLeast != SIZE_DEFAULT && size < sizeAtLeast)
            {
                debug Stdout.formatln("{} omitted, size < max file size", path);
                return false;
            }
            
            if(sizeAtMost != SIZE_DEFAULT && size > sizeAtMost)
            {
                debug Stdout.formatln("{} omitted, size > min file size", path);                
                return false;
            }
        }
            
        // time filter
        if(modifiedAtMost != TIME_DEFAULT || modifiedAtLeast != TIME_DEFAULT)
        {
            long modified = Path.modified(path).ticks;
            if( modifiedAtMost != TIME_DEFAULT && (nowTicks - modified)  > modifiedAtMost )
            {
                debug Stdout.formatln("{} omitted, modified time > min modified time", path);
                return false;
            }
            
            if( modifiedAtLeast != TIME_DEFAULT && (nowTicks - modified) < modifiedAtLeast )
            {
                debug Stdout.formatln("{} omitted, modified time < max modified time", path);
                return false;
            }      
        }        
        
        if(createdAtMost != TIME_DEFAULT || createdAtLeast != TIME_DEFAULT)
        {
            long created = Path.created(path).ticks;
            if( createdAtMost != TIME_DEFAULT && (nowTicks - created)  > createdAtMost )
            {
                debug Stdout.formatln("{} omitted, created time > min created time", path);
                return false;
            }
            
            if( createdAtLeast != TIME_DEFAULT && (nowTicks - created) < createdAtLeast )
            {
                debug Stdout.formatln("{} omitted, created time < max created time", path);
                return false;
            }      
        }          

        if(accessedAtMost != TIME_DEFAULT || accessedAtLeast != TIME_DEFAULT)
        {
            long accessed = Path.accessed(path).ticks;
            if( accessedAtMost != TIME_DEFAULT && (nowTicks - accessed)  > accessedAtMost )
            {
                debug Stdout.formatln("{} omitted, accessed time > min accessed time", path);
                return false;
            }
            
            if( accessedAtLeast != TIME_DEFAULT && (nowTicks - accessed) < accessedAtLeast )
            {
                debug Stdout.formatln("{} omitted, accessed time < max accessed time", path);
                return false;
            }      
        }          
        
        if(filter !is null)
            if(!filter(fp, isDir))
                return false;
            
        bytes += size;
        return true;
    }            
    //filter_        
    
        static const TIME_DEFAULT = long.max;
        static const SIZE_DEFAULT = ulong.max;    
        static const FILES_DEFAULT = long.max;
        static const FOLDERS_DEFAULT = long.max;
    private :    
        long nowTicks; //

}//PathScan


    // bugs with io.archive.Zip, MBCS(Chinese) is not supported yet
    /*
    bool isAscii(char[] str)
    {
        foreach(c; str)
            if(c>127) return false;
        return true;
    }
    */