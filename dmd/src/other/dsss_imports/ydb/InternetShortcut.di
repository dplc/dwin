
module ydb.InternetShortcut;

private import tango.io.device.File;
private import tango.io.FilePath;


debug import tango.io.Stdout;

struct InternetShortcut
{


    static:
    char[] BASEURL = "";
    char[] URL = "";
    char[] WorkingDirectory ="";
    char[] ShowCommand = "3";
    char[] IconIndex = "";
    char[] IconFile = "";
    char[] Modified = "";
    char[] HotKey = "";

    char[] directory;   //for Tango 0.995, directory must have not end with slash,
    char[] filename;

    char[] toString()
    {
        char[] s =
            "[DEFAULT]\r\n"
            "BASEURL=" ~ BASEURL ~  "\r\n"
            "[InternetShortcut]\r\n"
            "URL=" ~ URL ~ "\r\n"
            "WorkingDirectory=" ~ WorkingDirectory ~ "\r\n"
            "ShowCommand=" ~ ShowCommand ~ "\r\n"
            "IconIndex=" ~ IconIndex ~ "\r\n"
            "IconFile=" ~ IconFile ~ "\r\n"
            "Modified=" ~ Modified ~ "\r\n"
            "HotKey=" ~ HotKey;
        return s.dup;
    }

    void write()
    {
        if(!directory.length || !filename.length)
        {
            debug Stdout.formatln("InternetShortcut, you forgot to specfi the directory or filename".dup);
            return;
        }

        /// a bug with tango 0.995
        /*
        if( directory[$-1] == r'\' || directory[$-1] == '/' )
            directory.length = directory.length -1;
        */

        auto fp = FilePath(directory);
        try
        {
            if(!fp.exists)
                fp = fp.create;
            fp = fp.append( (filename ~ ".url").dup );
            write(fp);
        }
        catch(Exception e)
                debug Stdout.formatln("InternetShortcut.write catch {}".dup, e.msg);

    }

    void write(char[] dir,char[] name)
    {
        directory = dir;
        filename = name;
        return write();
    }

    void write(FilePath fp)
    {
        debug
            if(fp.exists)
            {
                fp.remove;
                assert(!fp.exists, fp.toString);
            }
        if(!fp.exists)
            (new File(fp.dup.native.toString)).write(toString);
        assert(fp.exists, fp.toString);
    }

}


/*

Internet快捷方式的格式, 后缀是url

[DEFAULT]
BASEURL=

[InternetShortcut]
URL=
WorkingDirectory=
ShowCommand=
IconIndex=
IconFile=
Modified=
HotKey=
其中BASEURL、URL和WorkingDirectory这3项的含义是不言而明的。ShowCommand规定Internet Explorer
启动后窗口的初始状态：7表示最小化，3表示最大化；如果没有ShowCommand这一项的话则表示正常大小。
IconFile和IconIndex用来为Internet快捷方式指定图标；如果你不想指定图标，Windows会使用缺省的
Internet快捷方式图标。HotKey指定一个整数值；HotKey的值及其含义如下：


833   - Ctrl + Shift + A
834   - Ctrl + Shift + B
835   - Ctrl + Shift + C
836   - Ctrl + Shift + D
837   - Ctrl + Shift + E
838   - Ctrl + Shift + F
…
1601 - Ctrl + Alt + A
1602 - Ctrl + Alt + B
1603 - Ctrl + Alt + C
1604 - Ctrl + Alt + D
1605 - Ctrl + Alt + E
1606 - Ctrl + Alt + F
...

一个简单的Internet快捷方式只需要在
[InternetShortcut]节中包含URL项就可以了，例：
[InternetShortcut]
URL=http://www.yahoo.com
ShowCommand=3
IconFile=C:\WINDOWS\system32\url.dll
IconIndex=1
快捷方式的创建

以下是代码：






*/
version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
