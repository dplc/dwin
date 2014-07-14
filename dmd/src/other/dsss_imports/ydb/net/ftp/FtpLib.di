// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2009  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: June 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

/**
    Example:
    ---
    scope ftp = new FtpLib;
        
    ftp.host = "www.domain.com";
    ftp.port = 21;
    ftp.username = "name";
    ftp.password = "pass";
    
    char[] remoteFile = r"webe.exe";
    char[] currentFile = r"E:\httproot\websitesoftware\download\websitesoftware.exe";

    ftplib_debug = 1;
        
    if (!ftp.connect())
    {
        Stdout.formatln("Unable to connect to node {} {}", ftp.host, ftp.lastResponse());
        return;
    }
    
    ftp.setActive();
    
    if (!ftp.login())
    {
        Stdout.formatln("Login failure {}", ftp.lastResponse());
        return;
    }  
    
    //must static for call from C CallBack function
    static fsz = 63554;
    static fnm = "FtpClient";  

    int log_progress(netbuf* ctl, int xfered, void* arg)
    {
        Stdout.formatln("{} {}/{}KB ", fnm, xfered/1024, fsz/1024);
        return 1;
    }
            
    
    FtpOptions(FTPLIB_CALLBACK, cast(int) null, ftp.conn);            
    FtpCallback callback = cast(FtpCallback) &log_progress;

    FtpOptions(FTPLIB_CALLBACK, cast(int) callback, ftp.conn);
    FtpOptions(FTPLIB_IDLETIME, 2000, ftp.conn);
    //FtpOptions(FTPLIB_CALLBACKARG, cast(int) cast(void*) (&rem), ftp.conn);
    FtpOptions(FTPLIB_CALLBACKBYTES, 10240, ftp.conn);        

    ftp.get(r"D:\FtpClient.d", fnm);    
    
    
    FtpFileInfo[] infos;
    ftp.ls("", infos);
    foreach(info; infos)
        Stdout.formatln("name {}, type {}, size {}, mtime {:s}", info.name, info.type == FtpFileType.dir ? "dir" : "file", info.size, info.modify);
    
    ---

*/


module ydb.net.ftp.FtpLib;



public import ydb.net.ftp.c.ftplib;
public import dwin.net.ftp.c.ftpparse;    
    
private import tango.stdc.stringz;
static import tango.stdc.stdlib; //fore free, malloc
private import tango.util.Convert;
private import tango.time.Time;
private import tango.net.ftp.FtpClient : FtpFileInfo, FtpFileType;
private import TextUtil = tango.text.Util;

version(Windows)
{
    pragma(lib, "ftplib.lib");
    pragma(lib, "ftpparse.lib");
//pragma(lib, "ydb.lib");
}

class FtpLib
{
    private NetBuf* conn;    
    private char[] remoteType; //e.g. UNIX, Windows_NT
    
    //int encoding;
    
    this()
    {
        init();
    }
    
    ~this()
    {
        close();
    }
        
    private void init()
    {
        version(Windows)
            FtpInit();        
    }
    
    synchronized bool connect(char[] host, int port = 21)
    {
        return FtpConnect(toStringz( host ~ ":" ~ to!(char[])(port) ), &this.conn) > 0;
    }
    
    
    ///Logs in using the specified username and password.  Returns success/fail.
    synchronized bool login(char[] username, char[] password)
    {
        bool result = FtpLogin(toStringz(username),toStringz(password), this.conn) > 0;
        if(result)
            sysType(remoteType);
        return result;
    }
    
    synchronized bool setActive()
    {
        return FtpOptions(FTPLIB_CONNMODE, FTPLIB_PORT, this.conn) > 0;        
    }
    
    synchronized bool setPassive()
    {
        return FtpOptions(FTPLIB_CONNMODE, FTPLIB_PASSIVE, this.conn) > 0;        
    }    
    
    //tested
    synchronized bool put(char[] localfile, char[] remote, char mode = FTPLIB_BINARY)
    {
        return FtpPut(toStringz(localfile), toStringz(remote), mode, this.conn) > 0;
    }
    
    /**
    Retreives the file specified by path and writes it to the file specified
    in outputfile.  Image or ASCII transfer mode can be specified by setting
    mode to FTPLIB_IMAGE or FTPLIB_ASCII, respectively.   
    Example:
    ---
    auto result = ftp.get(r"D:\testget", "test");
    Stdout.formatln("get {}", result);    
    ---
    */    
    synchronized bool get(char[] outputfile, char[] path, char mode = FTPLIB_BINARY)
    {
        return FtpGet(toStringz(outputfile), toStringz(path), mode, this.conn) > 0;
    }    
    
    /**
    Example:
    ---
    int size;
    if(ftp.size(remoteFile, &size))
        Stdout.formatln("{}", size);    
    ---
    
    */
    synchronized bool size(char[] path, int* s, char mode = FTPLIB_BINARY)
    {
        return FtpSize(toStringz(path), s, mode, this.conn) > 0;
    }
    
    
    
    /**
    返回GMT时间，20090531095741
    char[] sDate;
    if(ftp.modDate(remoteFile, sDate))
    { 
        Stdout.formatln("{}", sDate);
    }    
    
    */
    synchronized bool modDate(char[] path, out char[] resultDate)
    {
        const int len = 100;
        char[len] dt;
        bool result = FtpModDate(toStringz(path), dt.ptr, len, this.conn) > 0;
        if(result)
        {
            resultDate = dt;            
            foreach(i, c; resultDate)
                if(c == '\0' || c == '\r' || c == '\n')
                {
                    resultDate = resultDate[0..i].dup; //一定要dup
                    break;
                }
            
        }
        return result;        
    }
    
    /**
    Sends a create directory request to the server using the specified path. Returns success/fail.
    
    Example:
    ---
    if(!ftp.mkdir("/home/dplc/test dir")) //or ftp.mkdir("test dir")
        Stdout.formatln("failed mkdir");    
    ---
    */
    synchronized bool mkdir(char[] path)
    {
        return FtpMkdir(toStringz(path), this.conn) > 0;
    }
    
    /**
    Attempts to parse the system type out of the response from a SYST message
    and return up to 'max' bytes of the result to 'buf'.  The entire response
    can be retrieved using FtpLastResponse().  Returns success/fail.    
    
    Example:
    ---
    char[] type;
    if(ftp.sysType(type))
       Stdout.formatln(type);    //UNIX 
    Stdout.formatln(ftp.lastResponse); //215 UNIX Type: L8
    ---
    */
    synchronized bool sysType(out char[] type)
    {
        static const int len = 100;
        
        if(!remoteType.length)
        {
            char[len] buf;
            bool result = FtpSysType(buf.ptr, len, this.conn) > 0;
            if(result)            
                type = fromStringz(buf.ptr).dup; //msut dup
                
            return result;
        }
        else
        {
            type = remoteType;
            return true;
        }
    }
    
    bool isRemoteWindows()
    {
        return this.remoteType.length > 0 && TextUtil.containsPattern(this.remoteType, "Windows");
    }
    
    /**
    Sends a change working directory request to the server using the specified path.  Returns success/fail.
    */
    synchronized bool chdir(char[] path)
    {
        return FtpChdir(toStringz(path), this.conn) > 0;
    }
    
    // move to parent directory at remote
    synchronized bool cdup()
    {
        return FtpCDUp(this.conn) > 0;
    }
    
    synchronized bool del(char[] fnm)
    {
        return FtpDelete(toStringz(fnm), this.conn) > 0;
    }    
    
    //Sends a remove directory request to the server using the specified path.
    synchronized bool rmdir(char[] path)
    {
        return FtpRmdir(toStringz(path), this.conn) > 0;
    }
    
    /**
    get working directory at remote
    
    Example:
    ---
    char[] dir;
    ftp.pwd(dir);
    Stdout.formatln(dir);
    ftp.chdir("public_html");
    ftp.pwd(dir);
    Stdout.formatln(dir);    
    ---
    
    Result:
    /home/myname
    /home/myname/public_html    
    */
    synchronized bool pwd(out char[] dir)
    {
        char[256] buf;
        bool result = FtpPwd(buf.ptr, 256, this.conn) > 0;
        if(result)
            dir = fromStringz(buf.ptr).dup; //好像不dup也行
        return result;
    }
        
    synchronized char[] getPwd()
    {
        char[] dir;
        return pwd(dir) ? dir : "";
    }
    
    /**
    Sends an NLST command to the server with the specified path.  The
    response to this is a list of file names which will be written to the
    file named in outputfile.  If outputfile is specified as NULL, the list
    will be written to stdout.    
    */
    synchronized bool nlst(char[] outputfile, char[] path)
    {
        return FtpNlst(toStringz(outputfile), toStringz(path), this.conn) > 0;
    }

    //FtpDir - issue a LIST command and write response to output
    synchronized bool dir(char[] outputfile, char[] path)
    {
        return FtpDir(toStringz(outputfile), toStringz(path), this.conn) > 0;
    }    
    
    /**
    
    Example:
    ---
    FtpFileInfo[] infos;
    ftp.ls("", infos);
    foreach(info; infos)
        Stdout.formatln("name {}, type {}, size {}, mtime {:s}", info.name, info.type == FtpFileType.dir ? "dir" : "file", info.size, info.modify);
    
    ---
    */
    synchronized bool ls(char[] path, out FtpFileInfo[] infos)
    {
        int l;
        char* dbuf;
        netbuf* nData;
        scope(exit)
        {
            if(dbuf)
                tango.stdc.stdlib.free(dbuf);
            if(nData)
                FtpClose(nData);             
        }

        if (!FtpAccess(toStringz(path), FTPLIB_DIR_VERBOSE, FTPLIB_ASCII, this.conn, &nData))
            return false;
        
        dbuf = cast(char*) tango.stdc.stdlib.malloc(FTPLIB_BUFSIZ);
        
        while ((l = FtpRead(dbuf, FTPLIB_BUFSIZ, nData)) > 0)
        {                        
            char[] line = dbuf[0..l-1].dup; //remove ending \n
            FtpFileInfo info = parseListLine(line);
            if(info.name.length)
                infos ~= info;
            
            //Stdout.formatln("'{}'", dbuf[0..l-1]);
        }

        return true;
    }
    
    
    synchronized bool rename(char[] src, char[] dst)
    {
        return FtpRename(toStringz(src), toStringz(dst), this.conn) > 0;
    }   


    synchronized char[] lastResponse()
    {
        return fromStringz( FtpLastResponse( (conn !is null) ? conn : DefaultNetbuf) ).dup;
    }
    

    /*
    //Call Back sample
    //must static for call from C CallBack function
    static fsz = 63554;
    static fnm = "FtpClient";  

    int log_progress(netbuf* ctl, int xfered, void* arg)
    {
        Stdout.formatln("{} {}/{}KB ", fnm, xfered/1024, fsz/1024);
        return 1;
    }
                
    FtpOptions(FTPLIB_CALLBACK, cast(int) null, ftp.conn);            
    FtpCallback callback = cast(FtpCallback) &log_progress;

    FtpOptions(FTPLIB_CALLBACK, cast(int) callback, ftp.conn);
    FtpOptions(FTPLIB_IDLETIME, 2000, ftp.conn);
    //FtpOptions(FTPLIB_CALLBACKARG, cast(int) cast(void*) (&rem), ftp.conn);
    FtpOptions(FTPLIB_CALLBACKBYTES, 10240, ftp.conn);        
    */
        
    
    // not work
    /*
    void callback(FtpCallback c, int idletime = 2000, int bytes = 10240)
    {
        //不调用null, callback 就不会得到调用
        FtpOptions(FTPLIB_CALLBACK, cast(int) null, this.conn);            
        //FtpCallback callback = cast(FtpCallback) &log_progress;

        FtpOptions(FTPLIB_CALLBACK, cast(int) c, this.conn);
        FtpOptions(FTPLIB_IDLETIME, idletime, this.conn);
        //FtpOptions(FTPLIB_CALLBACKARG, cast(int) cast(void*) (&rem), ftp.conn);
        FtpOptions(FTPLIB_CALLBACKBYTES, bytes, this.conn);          
    }
    */    
    
	private FtpFileInfo parseListLine(char[] line) 
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
                if(this.remoteType.length)
                {
                    //onlye tested with UNIX server, Windows client
                    // seems works with Windws_NT server
                    switch(this.remoteType)
                    {
                        case "Windows_NT":
                            Time t = {listinfo.mtime * TimeSpan.TicksPerSecond};
                            info.modify = t;
                            break;
                        default:
                            Time t = {listinfo.mtime * TimeSpan.TicksPerSecond + TimeSpan.Epoch1970};
                            info.modify = t;
                    }                    
                }                                
                
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
                /*
                Time t = {listinfo.mtime * TimeSpan.TicksPerSecond + TimeSpan.Epoch1970};
                info.modify = t;
                */
                
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
    
    //send a command and wait for expected response
    synchronized bool sendCmd(char[] cmd, char expresp = '2')
    {
       return FtpSendCmd(toStringz(cmd), expresp, this.conn) > 0; 
    }
    
    //D string literal is 0 terminated, toStringz(literal) will cause Access Violation
    synchronized bool sendCmd(char* cmd, char expresp = '2')
    {
       //return FtpSendCmd(toStringz(cmd), expresp, this.conn) > 0; 
       return FtpSendCmd(cmd, expresp, this.conn) > 0; 
    }    
    
    //Enable UTF8 on servers
	synchronized bool enableUTF8() 
    {
		return sendCmd("OPTS UTF8 ON".ptr, '2');
	}            
    
    synchronized void quit()
    {
        if(this.conn !is null)
        {
            FtpQuit(this.conn);
        }
    }
    
    synchronized void close()
    {
        if (conn !is null)
        {
            FtpClose(conn);          
            conn = null;
        }
    }
    
    //is it necessary?
    private void nativePath(char[] path)
    {
        //if(isRemoteWindows)
          //  Path.native(path);
    }

    private static const int FTPLIB_BUFSIZ = 8192;    
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
