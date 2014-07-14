
// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2011  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: February 2011

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

/**
    useful module for writing Command Line based application
    
    Example:
    ---      
    void main(char[][] cmdArgs)
    {
        scope parser = new CommandlineApp(cmdsArgs[1..$]);    
        //parser.initLogger("D:\path\to\log.txt");
        parser.sloppy = true;
        parser.defaultCommand = "mycommand";
        parser.consoleTitle = "Great software write with DWin";
        parser.interactiveStr = "MySoftware>";
        parser.header = "Copyright (c) 2008-2011 by http://bbs.d-programming-language-china.org/";
        parser.help = "Application Usage";
        
        //bind Arguments
        parser.bind( (Arguments args, char[][] cmds) { args("command").params(0,1000).aliased(["CMD", "COMMAND"]); }  );
        
        /// bind Command 
        parser.bind(["exit","quit","end"], (char[][] args) { return true; }  );
        parser.bind([ "version" ], (char[][] args) { return true); }  );
        parser.parse();
    }
    ---
    
    TODO: how to disable logger via command argument ?
*/

module dwin.text.CommandlineApp;

private static import dwin.text.Util;
private import dwin.text.convert.UnicodeBom; //for bomToUtf8
private import dwin.text.Arguments; //for parseCommands
private import dwin.io.Path : toAbsolute;

private import tango.io.Stdout;
private import tango.io.Console;
private import Path = tango.io.Path;
private import tango.io.device.File;
private import tango.util.log.Log;
//private import tango.util.log.LayoutDate;
//private import tango.util.log.AppendFile;
private import textUtil = tango.text.Util;
private import Array = tango.core.Array;
private import tango.text.convert.Format;

version(Windows)
{
    private import dwin.sys.win32.SpecialPath;
    private import dwin.sys.win32.Window: standardConsoleWindow; 
    private import tango.sys.win32.UserGdi; //for SetConsoleTitleW,  SetConsoleCtrlHandler    
}

class CommandlineApp
{
    bool interactive = false;   /// true if user click on executable     
    bool dolog = true;
    bool sloppy = true; ///The 'sloppy' option allows for unexpected arguments without error.
    bool multiCommands = false;
    char[] sp = "-";
    char[] lp = "--";
    char eq = '=';
    char[] defaultCommand; //all command line starts with a command, if a line starts with a argument, append defaultCommand to beginning of the line
    char[] interactiveStr = "dwin>"c; 
    //char[][] exitStrArray = ["quit", "exit", "end"]; ///type one of the str to exit the interactive mode
    char[] consoleTitle = "dwin CommandlineApp"; /// title of the command line interactive window
    char fileSign = '@'; ///read commands from local file, e.g. @D:\cmdfile.txt means read commands from D:\cmdfile.txt
    char commentSign = '#'; ///line starts with commentSign in cmdfile means a comment line
    char[][] helpStrArray = ["help","?"]; /// type str in the helpStrArray to print help string, type help to print application help, type in [command|argument] help to print [command|argument] help
    char[] header = "Copyright (c) 2011 by http://bbs.d-programming-language-china.org/ written by yidabu"; /// header string in interactive mode
    char[] help; ///application help string
    char[] logpath; ///full path for log file
    
    alias void delegate(Arguments args, char[][] cmds) Inspector;
    private Inspector inspector;

    /**
    first argument in a line that without sp or lp that means a command, e.g. connect --host www.domain.com --port 21
    connect is a command
    */
    alias bool delegate(char[][] cmds) CmdDeg; 
    CmdDeg [ char[][] ] cmdsToExec;
    
    private char[][] cmdArgs;
    private Logger logger;
    //private AppendFile appendFile;    
    private Arguments args;
    private bool isKeepWindow = true;   // for interactive mode
    
    this(char[][] cmdArgs) { this.cmdArgs = cmdArgs; }
    //~this() {  if(appendFile)   appendFile.close();   }
    
    void parse() 
    {                               
        //click on executable
        if(cmdArgs.length == 0) {    
            interactive = true;
            isKeepWindow = true;
            keepWindow();                  
        }
        else {                       
            interactive = false;
            this.parseArguments(TextUtil.join(this.cmdArgs, " "), this.cmdArgs);
        }            
    }        
    
    
    bool initLogger(Logger log)
    {
        this.logger = log;
        this.dolog = this.logger !is null;
        return this.dolog;
    }       
    /*
    private bool initLogger()
    {    
        try
        {
            if(!logpath.length || this.logger) return false;
            this.appendFile = new AppendFile(logpath, new LayoutDate());    
            this.logger = Log.getLogger(interactiveStr);
            debug 
                this.logger.level = Level.Trace;
            else
                this.logger.level = Level.Info;
                
            this.logger.add(appendFile);         
            this.dolog = this.logger !is null;
            return this.dolog;
        }
        catch(Exception e) { dolog = false; }        
        return this.dolog;
    }
    */
    
    //keep Commmand Window
    private void keepWindow()
    {
        try
        {            
            version(Windows)
            {
                if (SetConsoleCtrlHandler(cast(PHANDLER_ROUTINE)&ConsoleHandler, TRUE) == FALSE)
                {debug loggerError("Unable to install Console event handler"); }
                
                SetConsoleTitleW( dwin.sys.win32.CodePage.toString16z(this.consoleTitle) );
                standardConsoleWindow();
            }
            
            Cout(this.header).flush;
            
            do
            {                                
                char[] cmd = null;                
                Cout(interactiveStr).flush;
                this.isKeepWindow = Cin.readln(cmd);                
                
                if(this.isKeepWindow && cmd.length)
                {
                    char[][] cmds;
                    parseCommands(cmd, cmds);       
                    if(cmds.length)
                        parseArguments(cmd, cmds);                
                }
                if( !this.isKeepWindow )                    
                    this.close(true);
           }
           while(this.isKeepWindow);         
        }
        catch(Exception e)
        {
            loggerError("keepWindow catch {}", e.toString);
        }
    }    
    
    
    bool close(bool exit)
    {
        this.isKeepWindow = !exit;
        /*
        if(!this.isKeepWindow)
            if(this.onclose)
                this.onclose();            
        */
        return exit;
    }
    
    final CommandlineApp bind (Inspector inspector)
    {
            this.inspector = inspector;
            return this;
    }    
    
    /*
    final CommandlineApp bind(VoidDeg onclose_)
    {
        this.onclose = onclose_;    
        return this;
    }
    */
    
    final CommandlineApp bind(char[][] cmd, CmdDeg exec)
    {
        this.cmdsToExec[cmd] = exec;    
        return this;
    }    
    
    void loggerInfo(char[] fmt, ...)
    {
        if(dolog && logger !is null)
            logger.info( Format(_arguments, _argptr, fmt) );
        else
        {
            if(interactive)
                Cout( Format(_arguments, _argptr, fmt) ).newline.newline;        
        }
    }

    void loggerError(char[] fmt, ...)
    {
        if(dolog && logger !is null)
            logger.error( Format(_arguments, _argptr, fmt) );
        else
        {
            if(interactive)
                Cout( Format(_arguments, _argptr, fmt) ).newline.newline;        
        }
    }
    
    /*
    bool showResult(T)(bool re, char[] fmt, ...)
    {
        if(interactive)   Cout( Format(_arguments, _argptr, fmt) ).newline; //append newline is required
        //re ? loggerInfo( Format(_arguments, _argptr, fmt) ) : loggerError( Format(_arguments, _argptr, fmt) );
        return re;
    }
    */
        
    
    void printHelp()
    {
        if(!interactive) return;
        if( this.help.length )
            Cout(help).newline();
        else
        {
            if(args)
                args.help( (char[] name, char[] text ) { Stdout.formatln(" {}{}\n \t{}", this.lp, name, text); } );
        }
    }
    
    
    void print(char[] fmt, ...)
    {
        if(interactive)   Cout( Format(_arguments, _argptr, fmt) ).newline; //append newline is required
    }
    
    
    /**
    
    params:
        name = argument name
    */
    void printHelp(char[] name)
    {
        if(!args || !interactive) return;        
        char[] text = args(name).help();
        if( text.length )      Cout(text).newline().newline();               
    }
        
    version(Windows)
    {
        //extern(Windows) BOOL ConsoleHandler(DWORD CEvent)
        BOOL ConsoleHandler(DWORD CEvent)
        {
            switch(CEvent)
            {
                case CTRL_C_EVENT,          //一個Ctrl + C的信號被接收，該信號或來自鍵盤，或來自GenerateConsoleCtrlEvent 函數
                     CTRL_BREAK_EVENT,      //一個 Ctrl + Break 信號被接收，該信號或來自鍵盤，或來自GenerateConsoleCtrlEvent 函數
                     CTRL_CLOSE_EVENT,      //當用戶系統關閉Console時，系統會發送此信號到此
                     CTRL_LOGOFF_EVENT,     //當用戶退出系統時系統會發送這個信號給所有的Console程序。該信號不能顯示是哪個用戶退出。
                     CTRL_SHUTDOWN_EVENT:   //當系統將要關閉時會發送此信號到所有Console程序
                
                    this.close(true);
                
                    return TRUE;
                default:
                    return FALSE;
            }
        } 
    }    
    
    //exec one line code
    private bool execLine(char[] cmd, char[][] cmds)
    {
        try
        {
            this.args = new Arguments(this.sp, this.lp, this.eq);
            
            //this.initLogger();
            
            if(inspector)
            {
                inspector(args, cmds);                
            }
            
            if (!args.parse (cmds, this.sloppy))
            {
                tango.io.Stdout.stdout (args.errors(&tango.io.Stdout.stdout.layout.sprint));        
                return false;
            }            
            
            /*
            args(arglogdir).params(0,1000).bind ( (char[] param) 
            { 
                if( param.length && Path.exists(param) && Path.isfolder(param) )
                    this.logdir = param;
                //else
                    //return Format("Invalud {}{} value:{}"
            });
        */
            
            //fire when type in: command help
            if(interactive && cmds.length == 2 && Array.find(this.helpStrArray, cmds[1]) != this.helpStrArray.length)
            {
                printHelp(cmds[0]);
                return true;
            }
            
            //fire when type in: help
            if(interactive && cmds.length == 1 && Array.find(this.helpStrArray, cmds[0]) != this.helpStrArray.length)
            {
                this.printHelp();
                return true;
            }
            
                /*
                CmdDeg* a;
                if(cmds.length > 1)
                {
                    a = TextUtil.chopl(cmds[1], this.lp) in cmdsToExec;
                }
                
                if(a is null)
                    a = cmds[0] in cmdsToExec;                    
                if(a !is null)                        
                        (*a)(cmds);  
            */ 
            
            
            char[] fcmd = getFirstCmd(cmds);
            if(fcmd.length)
            {
                foreach(a,f; cmdsToExec)
                {
                    if( Array.find(a,fcmd) != a.length )
                        return f(cmds);
                }
            }
            
            return true;
        }
        catch(Exception e)
        { loggerError("parseArguments catch {}", e.toString()); }      
        return false;
    }
    
    
    private bool parseArguments(char[] cmd, char[][] cmds)
    {               
        try
        {            
            char[][] [char[]] [] commands;
            
            if( startsWithCommand(cmd) )
            {                
                
                if( startsWithFileSign(cmds[0]) )
                {                    
                    
                    if(multiCommands)
                    {
                        parseSignMulti(cmds, commands);
                    }
                    else
                    {
                        parseSignSingle(cmds, commands);                                                                        
                    }
                }
                else
                {
                    commands.length = 1;
                    commands[0][cmd] = cmds;
                }
            }
            else
            {
                if(this.defaultCommand.length)
                {
                    cmds.length = cmds.length + 1;
                    cmds[1..$] = cmds[0..$-1];
                    cmds[0] = this.defaultCommand;
                    commands.length = 1;
                    commands[0][cmd] = cmds;
                }                
            }
            
            foreach(cmdArray; commands)
            {
                foreach(k,v; cmdArray)
                {
                    if( !execLine(k,v) )
                        break;
                }                
            }
                                
            return true;
        }
        catch(Exception e)
        { loggerError("parseArguments catch {}", e.toString()); }
        return false;
    }    
    
    private bool startsWithCommand(char[] str)
    {
         return !dwin.text.Util.startsWith(str, this.lp) && !dwin.text.Util.startsWith(str, this.sp);
    }    
    
    private char[] getFirstCmd(char[][] cmds)
    {
        if( cmds.length && this.startsWithCommand(cmds[0]) )
            return cmds[0];
        return null;
    }
    
    private bool startsWithFileSign(char[] str)
    {
        return str.length > 1 && str[0] == fileSign;
    }    

    
    private char[][] [char[]] [] parseSignMulti(char[][] cmdargs, ref char[][] [char[]] [] result)
    {
            char[] cmdfile = cmdargs[0][1..$];
        
            try
            {    
                
                cmdfile = toAbsolute(cmdfile);
                if(!Path.exists(cmdfile)) {
                    loggerError("Specified path does not exists: '{}'", cmdfile) ;
                    return result;
                }
                        
                char[] tmp = cast(char[]) File.get(cmdfile);
                tmp = TextUtil.trim(tmp);
                if(!tmp.length)  {
                    loggerError("empty file: {}", cmdfile);
                    return result;                
                }
                
                tmp = bomToUtf8(tmp); //convert to utf8, since console is utf8 mode                
                char[][] lines = TextUtil.splitLines(tmp);                
                
                //away of tango StackMap, we may have same key
                result = new char[][] [char[]] [100000];;
                
                size_t i;                                
                bool added = false;
                foreach(cmd; lines)
                {
                    cmd = TextUtil.trim(cmd); //不删除空格会出错
                    cmd = dwin.text.Util.stripQuote(cmd);                    
                    if(!cmd.length || cmd[0] is commentSign) //# comment
                        continue;
                                        
                    char[][] cmds;
                    parseCommands(cmd, cmds);
                    
                    if(!added && cmdargs.length > 1)
                    {
                        added = true;
                        cmds ~= cmdargs[1..$];
                    }
                        
                    if(cmds.length)
                        result[i++][cmd] = cmds;
                }
                result.length = i;
                
                return result;                                
            }
            catch(Exception e){ loggerError("parstAt catch {}", e.msg); }                                    
     
        return null;
    }
    
    
    private char[][] [char[]] [] parseSignSingle(char[][] cmdargs, ref char[][] [char[]] [] result)
    {
            char[] cmdfile = cmdargs[0][1..$];        
            //cmdfile = dwin.text.Util.stripQuote(cmdfile);            
        
            char[][] resultVal;
            resultVal ~= defaultCommand;
            try
            {                    
                cmdfile = toAbsolute(cmdfile);
                if(!Path.exists(cmdfile)) {
                    loggerError("Specified path does not exists: '{}'", cmdfile);
                    return result;
                }
                        
                char[] tmp = cast(char[]) File.get(cmdfile);
                tmp = TextUtil.trim(tmp);
                if(!tmp.length) {
                    loggerError("empty file: {}", cmdfile);
                    return result;                
                }
                tmp = bomToUtf8(tmp); //convert to utf8, since console is utf8 mode                
                char[][] lines = TextUtil.splitLines(tmp);                
                
                foreach(cmd; lines)
                {
                    cmd = TextUtil.trim(cmd); 
                    cmd = dwin.text.Util.stripQuote(cmd);                    
                    if(!cmd.length || cmd[0] is commentSign) //# comment
                        continue;
                    
                    resultVal ~= cmd;
                }
                
                if(cmdargs.length > 1)
                    resultVal ~= cmdargs[1..$];
                
                char[][] [char[]] tmpresult;
                tmpresult[""] = resultVal;
                result ~= tmpresult;
                return result;                                
            }
            catch(Exception e){ loggerError("parstSignSingle catch {}", e.msg); }                                    
     
        return result;
    }    
    
}


version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
