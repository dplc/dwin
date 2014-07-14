// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        Version:        Initial release: Apr 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.net.ftp.FtpConnection;

version(Win32)
    pragma(lib, "ftpparse.lib");

public import dwin.net.ftp.c.ftpparse;    
public import tango.net.ftp.FtpClient;    

private 
{
    //import tango.net.SocketConduit;
    import tango.time.Time;
    static import tango.stdc.stringz;
}


class FtpConnection: FTPConnection
{    
	public this() { super(); }
	public this(char[] hostname, char[] username = "anonymous", char[] password = "anonymous@anonymous", size_t port = 21) 
    {  super(hostname, username, password, port); }
	public this(FtpAddress fad) { super(fad); }    
    ~this() { close(); }
    
	protected FtpFileInfo parseListLine(char[] line) 
    {                       
		FtpFileInfo info;
        if(!line.length) return info;
            
        try
        {
            ftplistinfo listinfo;            
            if( !ftpparse(&listinfo, tango.stdc.stringz.toStringz(line), line.length) )
                return info;
            
            if(listinfo.mtimetype > 0)                
            {
                /*
                if(listinfo.mtimetype == FTPPARSE_MTIME_LOCAL)
                    Stdout.formatln("{} settime local", info.name);
                else if(listinfo.mtimetype == FTPPARSE_MTIME_UNKNOWN)
                    Stdout.formatln("{} settime unknon", info.name);
                else if(listinfo.mtimetype == FTPPARSE_MTIME_REMOTEMINUTE)
                    Stdout.formatln("{} settime remoteminute", info.name);
                else if(listinfo.mtimetype == FTPPARSE_MTIME_REMOTEDAY)
                    Stdout.formatln("{} settime remoteday", info.name);
                */
                Time t = {listinfo.mtime * TimeSpan.TicksPerSecond + TimeSpan.Epoch1970};
                info.modify = t;
                
            }    
            if(listinfo.namelen > 0)
                info.name = listinfo.name[0..listinfo.namelen].dup;
            
            if(listinfo.flagtrycwd == 1 && listinfo.flagtryretr == 1)
                info.type = FtpFileType.unknown;
            else if(listinfo.flagtrycwd == 1)
                info.type = FtpFileType.dir;
            else if(listinfo.flagtryretr == 1)
                info.type = FtpFileType.file;
            
            if(listinfo.sizetype != FTPPARSE_SIZE_UNKNOWN)
                info.size = listinfo.size;
            
            //if(listinfo.idlen > 0)
              //  Stdout.formatln("id {}", listinfo.id[0..listinfo.idlen].dup);                
            
            // Try to fix the type?
            if(info.name == ".")
                info.type = FtpFileType.cdir;
            else if(info.name == "..")
                info.type = FtpFileType.pdir;
            
            //Stdout.formatln("name {}, modify {}, type {}, size {}", info.name, sSortableDateTime(info.modify), (info.type == FtpFileType.file) ? "file" : "dir", info.size);                            
        }
        catch(Exception e)
        { 
            //Stdout.formatln(" catch {}", e.msg); 
        }        

		return info;
	}    
        
}