module ydb.net.ftp.FtpScan;


private import tango.io.FilePath,
        tango.time.Clock,
        //tango.util.PathUtil,
        tango.core.Exception;

private import ydb.net.ftp.FtpLib;

private import Path = tango.io.Path;
private import TextUtil = tango.text.Util;

private import tango.io.Stdout;


/*******************************************************************************

        Recursively scan files and directories, adding filtered files to
        an output structure as we go. This can be used to produce a list
        of subdirectories and the files contained therein. 
        The following example lists all files with suffix ".d" located via the dwin
        directory and exclude that file path contains "\\lab\\" :
        ---
        FtpScan scan = new FtpScan();
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


class FtpScan
{
    this(FtpLib ftp)
    {
        this.ftp = ftp;
        nowTicks = Clock.now.ticks;   /// time compare in ticks    
    }
    
    private FtpLib ftp;
    
    char[] root;
    bool recurse = false; /// recurse scan
    //bool justPrint;

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

        FtpFileInfo[]      fileSet;
        char[][]        errorSet;
        FtpFileInfo[]      folderSet;     
    

        
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
        public alias bool delegate (FtpFileInfo) Filter;
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

        public FtpFileInfo[] files ()
        {
                return fileSet;
        }

        /***********************************************************************
        
                Return all directories found in the last scan

        ***********************************************************************/

        public FtpFileInfo[] folders ()
        {
                return folderSet;
        }

        
        FtpScan sweep ()
        {
                return sweep (this.root, this.filter, this.recurse);
        }        
        
        /***********************************************************************

                Sweep a set of files and directories from the given parent
                path, with no filtering applied
        
        ***********************************************************************/
        //path without ending \\ or /
        FtpScan sweep (char[] path, bool recurse=true)
        {
                return sweep (path, cast(Filter) null, recurse);
        }

        /***********************************************************************

                Sweep a set of files and directories from the given parent
                path, where the files are filtered by the given suffix
        
        ***********************************************************************/
        
        FtpScan sweep (char[] path, char[] match, bool recurse=true)
        {
                return sweep (path, (FtpFileInfo fp)
                             {return FilePath(fp.name).suffix == match;}, recurse);
        }

        /***********************************************************************

                Sweep a set of files and directories from the given parent
                path, where the files are filtered by the provided delegate

        ***********************************************************************/
        
        FtpScan sweep (char[] path, Filter filter, bool recurse=true)
        {
                errorSet = null, fileSet = folderSet = null;
                this.filter = filter;
                return scan (path, &filter_, recurse); // standard by FilePath
        }

        /***********************************************************************

                Internal routine to locate files and sub-directories. We
                skip entries with names composed only of '.' characters. 

        ***********************************************************************/

        
        
        private FtpScan scan (char[] folder, Filter filter, bool recurse) 
        {
                try {
                    
                        FtpFileInfo[] infos;
                        ftp.ls(folder, infos);
                        
                        foreach(info; infos)
                        {
                            
                            if(maxFiles != FILES_DEFAULT && fileSet.length >= maxFiles )
                                    return this;
                            if(maxFolders != FOLDERS_DEFAULT && folderSet.length >= maxFolders )
                                    return this;     
                            
                            info.name = Path.standard(info.name);
                            info.name = (folder.length > 0 && folder[$-1] != '/') ? folder ~ "/" ~ info.name : info.name;
                            if(info.type == FtpFileType.dir)
                            {          
                                folderSet ~= info;                                
                                if(recurse)
                                    scan( info.name, filter, recurse );
                            }
                            else if(info.type == FtpFileType.file)
                            {
                                if(filter_(info))
                                {
                                    //if(justPrint)
                                        //Stdout.formatln("   Found: {}", info.name);
                                    fileSet ~= info;                
                                }
                            }
                            else
                            {
                                debug Stdout.formatln("not supported type for: {}", info.name);
                            }                
                            
                        } // foreach    
                    } catch (Exception e)
                    {
                             errorSet ~= e.toString;
                    }
                return this;
        }    
        
        
  
    // for mget
    private bool filter_(FtpFileInfo info)
    {
            if(this.include.length)
            {
                foreach(p; this.include)
                {
                    if( Path.patternMatch(info.name, TextUtil.trim(p)) ) 
                        goto EXCLUDE;
                }
                debug Stdout.formatln("{} not match {}", info.name, include);
                return false;
            }
              
    EXCLUDE:
            foreach(p; this.exclude)
            {
                if( Path.patternMatch(info.name, TextUtil.trim(p)) )
                {
                    debug Stdout.formatln("{} match exclude: {}", info.name, exclude);
                    return false;
                }
            }

            // file size filter
            if(this.sizeAtLeast != this.SIZE_DEFAULT && info.size != this.SIZE_DEFAULT && info.size < this.sizeAtLeast)
            {
                debug Stdout.formatln("{} omitted, size < max file size", info.name);
                return false;
            }
            
            if(this.sizeAtMost != this.SIZE_DEFAULT && info.size != this.SIZE_DEFAULT && info.size > sizeAtMost)
            {
                debug Stdout.formatln("{} omitted, size > min file size", info.name);                
                return false;
            }
                
            // last-modification time filter            
            if( (this.modifiedAtMost != this.TIME_DEFAULT || this.modifiedAtLeast != this.TIME_DEFAULT) )
            {
                if(info.modify != Time.max)
                {
                    if( modifiedAtMost != this.TIME_DEFAULT && 
                        (nowTicks - info.modify.ticks) > modifiedAtMost )
                    {
                       //debug Stdout.formatln("{} omitted, modified time {} > modified time at most {}", info.name, nowMinutes - remoteMinutes, modifiedAtMost);
                        return false;
                    }
                    
                    if( this.modifiedAtLeast != this.TIME_DEFAULT && 
                        (nowTicks - info.modify.ticks) < this.modifiedAtLeast )
                    {
                        //debug Stdout.formatln("{} omitted, modified time {} < modified time at least {}", info.name, nowMinutes - remoteMinutes, modifiedAtLeast);
                        return false;
                    }    
                }
                else
                {                    
                    //debug Stdout.formatln("{} remote modify is max time: {}, now {}", info.name, info.modify.span.minutes, nowMinutes);
                }
            }
            
        if(filter !is null)
            if(!filter(info))
                return false;            
            
            bytes += info.size;
            
            return true;
        
    }        
        
        static const TIME_DEFAULT = long.max;
        static const SIZE_DEFAULT = ulong.max;    
        static const FILES_DEFAULT = long.max;
        static const FOLDERS_DEFAULT = long.max;
    private :    
        long nowTicks; //

}//FtpScan


version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
