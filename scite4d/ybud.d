// Written in the D programming language.
/*******************************************************************************
        
        Simple build tool for SciTE4D .
        
        Copyright:      Copyright (c) 2007-2011  (dyuyan  gmail at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        October 2007: Initial release: 
                        Apr 2009: version 0.18
                        Feb 2011: version 0.19

        Authors:        yidabu ( D China : http://www.d-programming-language-china.org/ )
        History:
                        version 0.18, updated autocomplete for dwt2, tango 0.99.8
                        version 0.19 updated autocomplete for dwt2 tango 0.99.9, DWin 0.40, run postbuild.sh when exists with makefile        

*******************************************************************************/



module ybud;

private import  tango.io.FilePath,
        tango.io.device.File,
        tango.io.FileScan,
        tango.io.stream.Map,
        tango.io.Stdout,      
        tango.text.Arguments,
        tango.sys.Environment;
        
private import Path = tango.io.Path;        
private import TextUtil = tango.text.Util;
private import tango.stdc.stdlib : system ;

private import  dwin.sys.win32.SpecialPath : exeDir,exePath;       
private import  dwin.sys.win32.CodePage : toMbsz;
private import  dwin.text.pcre.RegExp;  // tango regex is pain slowly
private import dwin.text.Util : startsWith;
private import dwin.sys.Process : runSpecialFile;



/**
    F7          debug build.
    Ctrl + F7   release build.
    Ctrl + F5   dmd run file.d args
    F5          run the binary

    Params:
        args[1]     = full path of D source file
        args[2]     = build option, should be one of --doc --test --debug --modules, --run or none means release build
        args[3..$]  = if exists and find a correct dsss.conf file, All other options are passed through to dsss

    Examples:
    ---
    D:\d\dsss.conf:
    [test.d]
    debugflags=-g -debug=UnitTest -unittest
    releaseflags=-O -w -release

    Open test.d in scite4d, Press F7 on Scite4D, will run:
    ybud D:\d\test.d --debug
    ---
*/


int main(char[][] cmdArgs)
{
    try
    {        
        new Building(cmdArgs);
        return 0;
    
    }//try
    
    catch(Exception e)
    {
        Stdout.formatln ("Main Process execution failed: {}", e);
    }
    return 1;
}
//main



class Building
{
    /// ybud version number
    const char[] ybud_version = "0.19";    
    const char[] last_changed = "Februay 13, 2011";
    
    const char[] MODULES = "modules";
    const char[] VERSION = "version";
    const char[] MODULE_NAME = "moduleName";
    const char[] YBUD_CONF = "ybud.conf";
    const char[] BATFILE = "batfile";
    const char[] MAKEFILE = "makefile";
    const char[] MAKE = "make";
    const char[] POSTBUILD = "postbuild";
    
    /// ybud.exe path
    FilePath exepath;
    
    FilePath srcPath;

    /// array of ybud.conf 
    char[][char[]] aa;
    Arguments args;
    char[][] cmdArgs;
    
    this(char[][] cmdArgs)
    {
        this.cmdArgs = cmdArgs; //14 Apr 2009 fixed
        if(init(cmdArgs))
            building();
    }
    
    bool isDfile(FilePath p) { return p.ext == "d" || p.ext == "di"; }
    
    bool init(char[][] cmdArgs)
    {        
        try
        {
            args = new Arguments();      
            args.parse(cmdArgs.dup[1..$]);   
            
            if(cmdArgs.length == 1 || args("help").set ) { printUsage(); return false; }  
         
          ///for write module names to api\modules.api for AutoComplete
            exepath = FilePath(exePath());
            //exepath = exePath();
            loadConf();

            if(args(MODULES).set) { getModuleName(args(MODULES).assigned[0], Path.replace(aa[MODULE_NAME], '/', '\\'));  return false; }
            if(args(VERSION).set) { Stdout.formatln("SciTE4D version: {}, last changed date: {}", ybud_version, last_changed); return false; }
            
            srcPath = FilePath(cmdArgs[1]);
            if( !isDfile(srcPath) )
            {
                Stdout.formatln("Specified file is not a D source file: {}", srcPath.toString);
                return false;
            }
            
            if(!srcPath.exists)
            {
                Stdout.formatln("Specified file does not exists: {}", srcPath.toString);
                return false;
            }    
            return true;
        }            
        catch(Exception e)
        {
            Stdout.formatln("init catch {}", e.toString());
        }
        
        return false;
    }

        
    /// read ybud config from ybud.conf 
    /// edit ybud.conf to fit your needs          
    bool loadConf()
    {
        try
        {   
            auto ybudConf = exepath.pop.append(YBUD_CONF);

            scope conduit = new File(ybudConf.native.toString());
            scope input = new tango.io.stream.Map.MapInput!(char)(conduit);
            input.load(aa);    
            
            foreach(k, ref p; aa)
            {

                if(p.length < 2) continue;
                if( dwin.text.Util.startsWith(p, "..") )
                    p = exeDir() ~ p;
                p = Path.normalize(p);

            }        
            
            return true;
        }
        catch(Exception e)
        { Stdout.formatln("loadConf catch {}", e.toString()); }
        return false;
    }  
               
        //if(cmdArgs.length > 3 && cmdArgs[2] == "--modules")
                //return getModuleName(cmdArgs[3]);        
    
    void building()
    {          
        /// same as: dmd -run srcfile cmdArgs...
        if( args("run").set && ("dmd" in aa) !is null )
        {
            char[] command = aa["dmd"] ~ " -run " ~ srcPath.file.dup;
            if(cmdArgs.length > 2)
            {
                command = command ~ " " ~ tango.text.Util.join(cmdArgs[2..$], " ");            
                Stdout.formatln("comamnd: {}", command);
                execCommand(command);
            }
            return;
        }
        
        do
        {
            // e.g. source.d
            char[] file = srcPath.file.dup;        //must dup
            //e.g. source
            char[] name = srcPath.name.dup; 
            /// search bat file first, since this is simplest way on Windows
            if( (BATFILE in aa) !is null )
            {
                    // must dup
                    FilePath batPath1 = srcPath.dup.pop.append(aa[BATFILE] ~ "-" ~ name ~ ".bat"); //2009 03 25
                    FilePath batPath2 = srcPath.dup.pop.append(aa[BATFILE] ~ ".bat" );
                    debug Stdout.formatln("batPath1: {}, batPath2: {}", batPath1.toString, batPath2.toString);
                    FilePath batPath;
                    if(batPath1.exists)
                        batPath = batPath1;
                    else if(batPath2.exists && TextUtil.containsPattern( cast(char[]) File.get(batPath2.toString), file ))
                        batPath = batPath2;
                    
                    debug if(batPath) Stdout.formatln("treate path: {}", batPath.toString);
                    
                    if(batPath)
                    {
                            //done = true;
                            Stdout.formatln("command: {}", batPath.toString);
                            execCommand(batPath.toString);    //must fullpath here
                        
                            runSpecialFile(batPath.pop.toString(), aa[POSTBUILD]);
                            break;
                    }
            }
            
            /// use GNU make to build binary file is a good idea, too slow if use dsss to build binary
            if ( (MAKE in aa)        !is null &&
                      (MAKEFILE in aa)    !is null     )
            {
                    FilePath makefilePath1 = srcPath.dup.pop.append(aa[MAKEFILE] ~ "-" ~ name); //2009 03 25
                    FilePath makefilePath2 = srcPath.dup.pop.append(aa[MAKEFILE]);                
                    FilePath makefilePath;
                    if(makefilePath1.exists)
                        makefilePath = makefilePath1;
                    else if(makefilePath2.exists() && TextUtil.containsPattern( cast(char[]) File.get(makefilePath2.toString), name ) )
                        makefilePath = makefilePath2;
                    
                    
                    debug Stdout("make path " ~ makefilePath.toString).newline;
                    
                    if( makefilePath )
                    {
                        char[] mingwMake = aa[MAKE];
                        if(mingwMake.length > 2 && mingwMake[1] == ':' && !Path.exists(mingwMake))
                        {
                            Stdout.formatln("Specified Make does not exists: {}", mingwMake);
                            break;
                        }
                        if(Path.exists(exeDir() ~ mingwMake))
                            mingwMake = exeDir() ~ mingwMake;
                        char[] command = mingwMake ~ " -f " ~ makefilePath.toString;
                        Stdout.formatln("command: {}", command);                                
                        execCommand(command);      
                        
                        runSpecialFile(makefilePath.pop.toString(), aa[POSTBUILD]);                        
                        break;                                
                    }
                    
            }
            
            /// use dsss to build library is a good idea
            if( ("dsss" in aa) !is null)
            {
                    FilePath dsssconfPath = srcPath.pop.append("dsss.conf");
                    debug Stdout.formatln("treate path: {}", dsssconfPath.toString);
                    
                    if(dsssconfPath.exists)
                    {
                        char[] section = "[" ~ file ~ "]";
                        if( TextUtil.containsPattern( cast(char[]) File.get(dsssconfPath.toString), section ) )
                        {
                            debug Stdout.formatln("dsss build: {}", file);
                            
                            char[] command = aa["dsss"] ~ " build " ~ file;

                            if(cmdArgs.length > 2)
                                command = command ~ " " ~ tango.text.Util.join(cmdArgs[2..$], " ");                            
                            Stdout.formatln("command: {}", command);
                            execCommand(command);
                            break;
                        }
                    }
            
            }
            
            srcPath = srcPath.pop;
            
        } while (srcPath.toString.length > 2)  
    }//building        

    bool printUsage()
    {
        Stdout(helpText).newline;
        return false;
    }
    
    /// execute build commands
    void execCommand(char[] command)
    {
        char[] workDir = Environment.cwd();
        Environment.cwd(srcPath.path);
        
        system( toMbsz(command) );
        
        Environment.cwd(workDir);            
    }      
    
        /// ybud --help to show ybud usage
        const char[] helpText =  `ybud version ` ~ ybud_version ~ `
Usage:  ybud <.d file> [options]
        ybud --modules importPath1;path2;path3 

ybud Options:
    --debug:    debug modle build
    --doc:      Generate/install documentation for libraries
    --test:     all of the unit tests to be run
    --run:      same as: dmd -run file.d
    --modules   to get AutoComplete apis
    none:       means release modle build

All other options are passed through to dsss.`;     
             
    
}
//Building

/**
    write module's name to api\modlues.api for scite4d AutoComplete functionality
    Params:
        dir = ; separator dirs

    Examples:
    ---
    getModuleName(r"D:\d\dmd\src\phobos\std;D:\d\dmd\tango;D:\d\dmd\src\other\dwin");
    ---
        
*/
void getModuleName(char[] dir, char[] modulePattern)
{
    try
    {
        debug Stdout(dir).newline;
        
        bool[char[]] result;
        
        char[] apipath() { return exeDir ~ r"api\modules.api"; }
        void loadApis()  // load old apis
        {
            auto path = apipath();
            if( Path.exists(path) )             
            {
                auto content = cast(char[]) File.get(path);
                char[][] lines = TextUtil.splitLines(content);
                foreach(line; lines)
                {
                    auto tmp = TextUtil.trim(line);
                    if( !tmp.length || !TextUtil.containsPattern(tmp, ".") || TextUtil.containsPattern(tmp, "Snippet") ) continue;
                    result[tmp] = true;                    
                }    
            }            
        }        
        
        loadApis();
        
        // get all .d .di files
        FilePath[] files;
        auto fs = new FileScan;
        foreach( d; TextUtil.delimit(dir, ";") )
        {
            if( !Path.exists(d) ) 
            {
                Stdout.formatln("Specified path does not exists: {}", d).newline;
                continue;
            }
            fs(d, (FilePath fp, bool isDir) 
                        { return isDir || fp.ext == "d" || fp.ext == "di"; }, true);
            files ~= fs.files;
        }
        
        if(!files.length)
            return Stdout.formatln("getModuleName failed to get files from {}", dir);
        
        Stdout.formatln("D fiels {}", files.length);
        
        //char[] modulePattern = aa[MODULE_NAME];
        if(!modulePattern.length) 
            return Stdout.formatln("Invalid moduleName value in ybud.conf: {}", modulePattern);
            
        scope regex = new RegExp(modulePattern, PCRE_UTF8);
        int matched = 0;
        foreach(file; files)
        {
            char[] content;
            try{ content = cast(char[]) File.get(file.native.toString); }
            catch(Exception e) 
            { 
                Stdout.formatln("read {} failed", file.toString);
                continue;
            }
            RegMatch match;
            try
            { match = regex.execute(content); }
            catch(Exception e)
            {
                Stdout.formatln("RegExp execute catch: {}, file {}", e.msg, file.toString);
                continue;
            }
            
            if(!match) 
            {
                Stdout.formatln("RegExp not matched: {}, {}", file.toString, modulePattern);
                continue;
            }
            auto moduleName = match[1];
            if(!moduleName.length || TextUtil.containsPattern(moduleName, "Snippet"))
            {
                Stdout.formatln("RegExp ignored: {}", file.toString);
                continue;
            }
            moduleName = TextUtil.substitute(moduleName, " ", "");
            result[moduleName] = true;
            ++matched;
        }
        
        Stdout.formatln("RegExp matched {} modules", matched);
        if(!result.length) { return Stdout("not got any module of getModuleName").newline; }
        
        (new File(apipath(), File.WriteCreate)).write( tango.text.Util.join(result.keys.sort, "\r\n") );            
        
    }
    catch(Exception e)
    {  Stdout.formatln("get moduleName catch {}", e.msg).newline; }
}

