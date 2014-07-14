module ydb.net.ftp.FtpRmd;


private import ydb.net.ftp.FtpLib;
private import Path = tango.io.Path;

private import tango.io.Stdout;

class FtpRmd
{
    this(FtpLib ftp)
    {
        this.ftp = ftp;
    }
    
    private FtpLib ftp;

        FtpFileInfo[]      fileSet;
        char[][]        errorSet;
        FtpFileInfo[]      folderSet;     
        FtpFileInfo[]      failureSet;     
    
    bool justPrint;
    bool verbose;
    
    alias scan opCall;

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
        
        public FtpFileInfo[] failures ()
        {
                return failureSet;
        }        
    
        FtpRmd scan(char[] folder)
        {
              try {                    
                        FtpFileInfo[] infos;
                        ftp.ls(folder, infos);
                        foreach(info; infos)
                        {
                                                        
                            info.name = Path.standard(info.name);
                            info.name = (folder.length > 0 && folder[$-1] != '/') ? folder ~ "/" ~ info.name : info.name;
                            if(info.type == FtpFileType.dir)
                            {          
                                scan(info.name);
                                
                                if(justPrint)
                                    //Stdout.formatln(" found folder: '{}'", info.name);
                                    folderSet ~= info;
                                else
                                {

                                    if(ftp.rmdir(info.name))
                                    {
                                        if(verbose)
                                            Stdout.formatln(" removed folder {} ", info.name);
                                                                            
                                        folderSet ~= info;
                                    }
                                    else
                                    {
                                        if(verbose)
                                            Stdout.formatln(" remove folder {} failure", info.name);
                                                                                        
                                        failureSet ~= info;                                                                    
                                    }
                                }
                            }
                            else if(info.type == FtpFileType.file)
                            {
                                if(justPrint)
                                    //Stdout.formatln(" found file: {}", info.name);
                                    fileSet ~= info;
                                else
                                {
         
                                    if(ftp.del(info.name))
                                    {
                                        if(verbose)
                                            Stdout.formatln(" deleted file '{}'", info.name);
                                                                            
                                        fileSet ~= info;
                                    }
                                    else
                                    {
                                        if(verbose)
                                            Stdout.formatln(" delete file '{}' failure", info.name);
                                                                                    
                                        failureSet ~= info;
                                    }
                                }                                
                            }
                            else
                            {
                                debug Stdout.formatln(" not supported type for: {}", info.name);
                            }                
                            
                        } // foreach    
                    } catch (Exception e)
                    {
                        if(verbose)
                            Stdout.formatln(" delete '{}' catch {}", e.toString);
                        errorSet ~= e.toString;   
                    }
                return this;
        }
    
}
version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
