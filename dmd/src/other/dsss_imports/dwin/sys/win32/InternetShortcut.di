// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2008  (yidabu  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Apr 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.sys.win32.InternetShortcut;

private import tango.io.device.File;
private import dwin.sys.win32.SpecialPath : systemPath;
private import Path = tango.io.Path;

/**
    Create a Internet Shortcut
    
    Example:
    ---
    auto shortcut = new InternetShortcut();
    shortcut.URL = "http://www.d-programming-language-china.org/";
    shortcut.create(r"D:\D China");
    ---
    

*/

class InternetShortcut
{
    this()
    {
        IconFile = systemPath() ~ "\\url.dll";
    }
    
    this(char[] url)
    {
        this();
        URL = url;
    }
    
    char[] BASEURL = "";
    char[] URL = "";
    char[] WorkingDirectory ="";
    char[] ShowCommand = "3";
    char[] IconIndex = "1";
    char[] IconFile = "";
    char[] Modified = "";
    char[] HotKey = "";

    
    static InternetShortcut opCall() { return new InternetShortcut(); }        
    static InternetShortcut opCall(char[] url) { return new InternetShortcut(url); }    
    


    void create(char[] file, bool force = false)
    {
        file = file ~ ".url";
        if(!force && Path.exists(file))
            return;
        
        File shortcut = new File(file, File.WriteCreate);
        scope(exit) shortcut.close();
        shortcut.write(this.toString());        
    }
    
    private char[] toString()
    {
        char[] s =
            "[DEFAULT]\r\n"
            "BASEURL=" ~ BASEURL ~  "\r\n"
            "[InternetShortcut]\r\n"
            "URL=" ~ URL ~ "\r\n"
            "WorkingDirectory=" ~ WorkingDirectory ~ "\r\n"
            "ShowCommand=" ~ ShowCommand ~ "\r\n"
            "IconFile=" ~ IconFile ~ "\r\n"        
            "IconIndex=" ~ IconIndex ~ "\r\n"
            "Modified=" ~ Modified ~ "\r\n"
            "HotKey=" ~ HotKey;
        return s;
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
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
