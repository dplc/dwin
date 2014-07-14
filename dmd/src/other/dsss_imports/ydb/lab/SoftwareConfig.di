// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Mar 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module ydb.lab.SoftwareConfig;
/+
version(Win32):
version(DFL):

private import  tango.text.Properties,  tango.util.Convert, tango.io.FilePath,
        tango.io.File,          tango.time.WallClock;
private import  Util = tango.text.Util;
private import  dfl.application;
private import  dwin.text.Locale;
debug(UnitTest)   import tango.util.log.Trace;


/**
    load and save softeare config file, for use with HTMLayout
    example:
    ---
    class Config : SoftwareConfig
    {
        this()
        {
            super("softconfig.txt");
        }
    }
    auto config = new Config();
    Trace.formatln("exeDirectoy {}", config.exeDirectory);
    config.save;

    ---
*/
abstract class SoftwareConfig
{
    static bool config_modified = false;

    size_t UI_width()
    {
        static size_t width;
        if(!width)  width = to!(uint)(get("UI_width"));
        return width;
    }

    size_t UI_height()
    {
        static size_t height;
        if(!height) height = to!(uint)(get("UI_height"));
        return height;
    }

        private char[] cultureName()
        {
            static char[] name;
            if(!name.length)
            {
                static char[] ui = "UI_language";
                if( aa[ui] == "auto" )
                    name = userDefalutCultureName;
                else
                    name = aa[ui];
            }
            assert(name.length, "culture.name.length");
            return name ;
        }

    //html User Interface for HTMLayout based program
    char[] main_htm()
    {
        static char[] htm;
        if(!htm.length)
        {
            scope path = FilePath(exeDirectory).append( "UI/" ~ (cultureName()) ~ ".htm" );
            htm = path.exists ?
                    path.toString :
                        exeDirectory ~ "UI/en-US.htm";      //default locale is en-US
        }
        assert(htm.length, "path.length");
        return htm;
    }

    char[] UI_directory()
    {
        static char[] dir;
        if(!dir.length)
            dir = exeDirectory ~ "UI/";
        return dir;
    }



    /// days after installed
    long run_days()
    {
        static long days;
        if(!days)
            days = (WallClock.now - FilePath(executablePath).created).days ;
        debug Trace.formatln("run days {}", days);
        return days;
    }


    void save()
    {
        debug Trace.formatln("SoftwareConfig save called");
        ///save settings if changed
        if(config_modified)
        {
            props.save( FilePath(exeDirectory ~ configFileName), aa );
            debug(UnitTest) Trace.formatln("config saved");
        }
        //else
            //debug Trace.formatln("config not modifed");
    }

    void load()
    {
        //debug Trace.formatln("SofteareConfig load called");
        props = new Properties!(char);
        props.load
        ( FilePath(exeDirectory ~ configFileName),
            (char[] key, char[] value)
            {
                aa[key] = value;
            }
        );
        assert(aa.length, "aa.length");
    }

    static char[] exeDirectory()
    {
        static char[] dir;
        if(!dir.length)
            dir = Application.startupPath;
        return dir;
    }

    static char[] executablePath()
    {
        static char[] path;
        if(!path.length)
            path = Application.executablePath;
        return path;
    }

    char[] get(char[] keyName)
    {
        return ((keyName in aa) !is null)  ? Util.trim(aa[keyName]).dup : null;
    }
    void set(char[] keyName, char[] newValue)
    {
        newValue = Util.trim(newValue).dup;
        if(!newValue.length)
        {
            return remove(keyName);
        }
        if( (keyName in aa) is null || aa[keyName] != newValue )
        {
            config_modified = true;
            aa[keyName] = newValue;
        }
    }

    ///remove a key
    void remove(char[] key)
    {
        if( (key in aa) !is null )
        {
            aa.remove(key);
            this.config_modified = true;    /// save to locale file
        }
    }

    this(char[] configFileName_)
    {
        //debug Trace.formatln("SoftwareConfig this called");
        configFileName = configFileName_;
        load;
    }

    ~this()
    {
        //debug Trace.formatln("SofteareConfig ~this called");
    }

    protected:
        char[][char[]] aa;
        Properties!(char) props;
        char[] configFileName;      //e.g. config.ini
}
//
+/
version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
