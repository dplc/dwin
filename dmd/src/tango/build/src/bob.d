/*******************************************************************************

        copyright:      Copyright (c) 2009 Tango. All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Oct 2009: Initial release

        author:         larsivi, sleets, kris

*******************************************************************************/

private import tango.text.Util;
private import tango.io.Stdout;
private import tango.sys.Process;
private import tango.io.FileScan;
private import Path = tango.io.Path;
private import tango.io.device.Array;
private import tango.io.device.File;
private import tango.text.Arguments;
private import tango.sys.Environment;

/*******************************************************************************
      
*******************************************************************************/

void main (char[][] arg)
{
        Args args;

        if (args.populate (arg[1..$]))
           {
           try {
               Path.remove (args.lib);
               }catch (Object o){}
           new Linux (args);
           new FreeBSD (args);
           new Windows (args);
           stdout.formatln ("{} files", FileFilter.builder(args.os, args.compiler)());
           }
}

/*******************************************************************************
      
*******************************************************************************/

class Windows : FileFilter
{
        this (ref Args args)
        {
                super (args);
                exclude ("tango/stdc/posix");
                include ("tango/sys/win32");
                register ("windows", "dmd", &dmd);
        }

        int dmd ()
        {
                void compile (char[] cmd, FilePath file)
                {
                        auto temp = objname (file);
                        if (args.quick is false || isOverdue (file, temp))
                            exec (cmd~temp~" "~file.toString);
                        addToLib (temp);
                }

                auto dmd = "dmd -c -I"~args.root~"/tango/core -I"~args.root~" -I"~args.root~"/tango/core/vendor "~args.flags~" -of";
                libs ("-c -n -p256\n"~args.lib~"\n");

                exclude ("tango/core/rt/compiler/dmd/posix");
                foreach (file; scan(".d"))
                         compile (dmd, file);

                foreach (file; scan(".c"))
                         compile ("dmc -c -mn -6 -r -o", file);

                if (args.core)
                    addToLib (args.root~"/tango/core/rt/compiler/dmd/minit.obj");
                File.set("tango.lsp", libs.slice);
                exec ("lib @tango.lsp");

                // retain obj files only when -q is specified
                if (args.quick)
                    exec ("cmd /q /c del tango.lsp");
                else
                   exec ("cmd /q /c del tango.lsp *.obj");
                return count;
        }
}

/*******************************************************************************
      
*******************************************************************************/

class Linux : FileFilter
{
        this (ref Args args)
        {
                super (args);
                include ("tango/sys/linux");
                register ("linux", "dmd", &dmd);
                register ("linux", "ldc", &ldc);
                register ("linux", "gdc", &gdc);
        }

        private char[] compile (FilePath file, char[] cmd)
        {
                auto temp = objname (file, ".o");
                if (args.quick is false || isOverdue(file, temp))
                    exec (split(cmd~temp~" "~file.toString, " "), Environment.get, null);
                return temp;
        }

        private auto gcc = "gcc -c -o";
        private auto gcc32 = "gcc -c -m32 -o";

        int dmd ()
        {
                auto dmd = "dmd -c -I"~args.root~"/tango/core -I"~args.root~" -I"~args.root~"/tango/core/vendor "~args.flags~" -of";
                exclude ("tango/core/rt/compiler/dmd/windows");
                foreach (file; scan(".d")) {
                         auto obj = compile (file, dmd);
                         addToLib(obj);
                }

                if (args.core) {
                    foreach (file; scan(".c")) {
                             auto obj = compile (file, gcc32);
                             addToLib(obj);
                    }

                    foreach (file; scan(".S")) {
                            auto obj = compile (file, gcc32);
                            addToLib(obj);
                    }
                }

                makeLib;
                return count;
        }

        int ldc ()
        {
                auto ldc = "ldc -c -I"~args.root~"/tango/core -I"~args.root~"/tango/core/rt/compiler/ldc -I"~args.root~" -I"~args.root~"/tango/core/vendor "~args.flags~" -of";
                foreach (file; scan(".d")) {
                         auto obj = compile (file, ldc);
                         addToLib(obj);
                }

                if (args.core) {
                    foreach (file; scan(".c")) {
                             auto obj = compile (file, gcc);
                             addToLib(obj);
                    }

                    foreach (file; scan(".S")) {
                            auto obj = compile (file, gcc);
                            addToLib(obj);
                    }
                }

                makeLib;
                return count;
        }

        int gdc ()
        {
                auto gdc = "gdc -c -I"~args.root~"/tango/core -I"~args.root~" "~args.flags~" -of";
                foreach (file; scan(".d")) {
                         auto obj = compile (file, gdc);
                         addToLib(obj);
                }

                if (args.core) {
                    foreach (file; scan(".c")) {
                             auto obj = compile (file, gcc);
                             addToLib(obj);
                    }

                    foreach (file; scan(".S")) {
                            auto obj = compile (file, gcc);
                            addToLib(obj);
                    }
                }

                makeLib;
                return count;
        }


}

/*******************************************************************************
      
*******************************************************************************/

class FreeBSD : FileFilter
{
        this (ref Args args)
        {
                super (args);
                include ("tango/sys/freebsd");
                register ("freebsd", "dmd", &dmd);
                register ("freebsd", "ldc", &ldc);
                register ("freebsd", "gdc", &gdc);
        }

        private char[] compile (FilePath file, char[] cmd)
        {
                auto temp = objname (file, ".o");
                if (args.quick is false || isOverdue(file, temp))
                    exec (split(cmd~temp~" "~file.toString, " "), Environment.get, null);
                return temp;
        }

        private auto gcc = "gcc -c -o";
        private auto gcc32 = "gcc -c -m32 -o";

        int dmd ()
        {
                auto dmd = "dmd -version=freebsd -c -I"~args.root~"/tango/core -I"~args.root~" -I"~args.root~"/tango/core/vendor "~args.flags~" -of";
                exclude ("tango/core/rt/compiler/dmd/windows"); 
                foreach (file; scan(".d")) {
                         auto obj = compile (file, dmd);
                         addToLib(obj);
                }

                if (args.core) {
                    foreach (file; scan(".c")) {
                             auto obj = compile (file, gcc32);
                             addToLib(obj);
                    }

                    foreach (file; scan(".S")) {
                            auto obj = compile (file, gcc32);
                            addToLib(obj);
                    }
                }

                makeLib;
                return count;
        }

        int ldc ()
        {
                auto ldc = "ldc -version=freebsd  -c -I"~args.root~"/tango/core -I"~args.root~"/tango/core/rt/compiler/ldc -I"~args.root~" -I"~args.root~"/tango/core/vendor "~args.flags~" -of";
                foreach (file; scan(".d")) {
                         auto obj = compile (file, ldc);
                         addToLib(obj);
                }

                if (args.core) {
                    foreach (file; scan(".c")) {
                             auto obj = compile (file, gcc);
                             addToLib(obj);
                    }

                    foreach (file; scan(".S")) {
                            auto obj = compile (file, gcc);
                            addToLib(obj);
                    }
                }

                makeLib;
                return count;
        }

        int gdc ()
        {
                auto gdc = "gdc -version=freebsd  -c -I"~args.root~"/tango/core -I"~args.root~" "~args.flags~" -of";
                foreach (file; scan(".d")) {
                         auto obj = compile (file, gdc);
                         addToLib(obj);
                }

                if (args.core) {
                    foreach (file; scan(".c")) {
                             auto obj = compile (file, gcc);
                             addToLib(obj);
                    }

                    foreach (file; scan(".S")) {
                            auto obj = compile (file, gcc);
                            addToLib(obj);
                    }
                }

                makeLib;
                return count;
        }


}

/*******************************************************************************
      
*******************************************************************************/

class FileFilter : FileScan
{
        alias int delegate()    Builder;

        Array                   libs;
        Args                    args;
        int                     count;
        char[]                  suffix;
        bool[char[]]            excluded;         
        static Builder[char[]]  builders;

        /***********************************************************************

        ***********************************************************************/

        static void register (char[] platform, char[] compiler, Builder builder)
        {
                builders [platform~compiler] = builder;
        }

        /***********************************************************************

        ***********************************************************************/

        static Builder builder (char[] platform, char[] compiler)
        {       
                auto s = platform~compiler;
                auto b = s in builders;
                if (b)
                    return *b;
                throw new Exception ("unsupported combination of "~platform~" and "~compiler);
        }

        /***********************************************************************

        ***********************************************************************/

        this (ref Args args)
        {
                this.args = args;

                libs = new Array (0, 1024 * 16);

                if (args.core is false)
                    exclude ("tango/core");

                exclude ("tango/net/cluster");
                exclude ("tango/io/protocol");

                exclude ("tango/sys/win32");
                exclude ("tango/sys/darwin");
                exclude ("tango/sys/freebsd");
                exclude ("tango/sys/linux");
                exclude ("tango/sys/solaris");

                exclude ("tango/core/rt/gc/stub");
                exclude ("tango/core/rt/compiler/dmd");
                exclude ("tango/core/rt/compiler/gdc");
                exclude ("tango/core/rt/compiler/ldc");
                exclude ("tango/core/vendor");
                include ("tango/core/rt/compiler/"~args.target);
                include ("tango/core/vendor/"~args.target);
        }
        
        /***********************************************************************

        ***********************************************************************/

        final int opApply (int delegate(ref FilePath) dg)
        {
                int result;
                foreach (path; super.files)  
                         if (args.user || containsPattern(path.folder, "core"))
                             if (++count, (result = dg(path)) != 0)
                                  break;
                return result;
        }

        /***********************************************************************

        ***********************************************************************/

        final FileFilter scan (char[] suffix)
        {
                this.suffix = suffix;
                super.sweep (args.root~"/tango", &filter);
                return this;
        }

        /***********************************************************************

        ***********************************************************************/

        final void exclude (char[] path)
        {
                excluded[path] = true;
        }

        /***********************************************************************

        ***********************************************************************/

        final void include (char[] path)
        {
                excluded.remove (path);
        }

        /***********************************************************************

        ***********************************************************************/

        private bool filter (FilePath fp, bool isDir)
        {
                if (isDir)
                   {    
                   auto tango = locatePatternPrior (fp.path, "tango");
                   if (tango < fp.path.length)
                       return ! (fp.toString[tango..$] in excluded);
                   return false;
                   }

                return fp.suffix == suffix;
        }

        /***********************************************************************
              
        ***********************************************************************/
        
        private char[] objname (FilePath fp, char[] ext=".obj")
        {
                auto tmp = fp.folder [args.root.length+1 .. $] ~ fp.name ~ args.flags;
                foreach (i, ref c; tmp)
                         if (c is '.' || c is '/' || c is '=' || c is ' ' || c is '"')
                             c = '-';  
                return tmp ~ ext ;
        }

        /***********************************************************************
              
        ***********************************************************************/
        
        private bool isOverdue (FilePath fp, char[] objfile)
        {
                if (! Path.exists (objfile))
                      return true;

                auto src = fp.timeStamps.modified;
                auto obj = Path.modified (objfile);
                return src >= obj;
        }
        
        /***********************************************************************

        ***********************************************************************/

        private void addToLib (char[] obj)
        {
                version (Windows)
                         const Eol = "\r\n";
                else
                         const Eol = " ";
                if (Path.exists (obj))
                    libs (obj)(Eol);
        }

        /***********************************************************************

        ***********************************************************************/

        private void makeLib ()
        {
                if (libs.readable > 2)
                   {
                   auto files = cast(char[]) libs.slice [0..$-1];
                   exec ("ar -r "~args.lib~" "~ files);
        
                   if (args.quick is false)
                       // TODO: remove the list of filenames in 'files' 
                      {}
                   }
        }

        /***********************************************************************
              
        ***********************************************************************/
        
        void exec (char[] cmd)
        {
                exec (split(cmd, " "), null, null);
        }
        
        /***********************************************************************
              
        ***********************************************************************/
        
        void exec (char[][] cmd, char[][char[]] env, char[] workDir)
        {
                if (args.verbose)
                   {
                   foreach (str; cmd)
                            stdout (str)(' ');
                   stdout.newline;
                   }  
                         
                if (! args.inhibit)
                   {
                   scope proc = new Process (cmd, env);
                   scope (exit) proc.close;
                   if (workDir) 
                       proc.workDir = workDir;
                   if (env is null)
                       proc.copyEnv (true);

                   proc.execute();
                   stdout.stream.copy (proc.stderr);
                   stdout.stream.copy (proc.stdout);
                   auto result = proc.wait;
                   if (result.reason != Process.Result.Exit)
                       throw new Exception (result.toString);
                   }
        }
}


/*******************************************************************************
      
*******************************************************************************/

struct Args
{
        bool    core,
                user,
                quick,
                inhibit,
                verbose;

        char[]  os,
                lib,
                root,
                flags,
                target,
                compiler;

        char[]  usage = "usage: bob tango-path\n"
                        "\t[-v]\t\t\tverbose output\n"
                        "\t[-q]\t\t\tquick execution\n"
                        "\t[-i]\t\t\tinhibit execution\n"
                        "\t[-u]\t\t\tinclude user modules\n"
                        "\t[-r=dmd|gdc|ldc]\tinclude a runtime target\n"
                        "\t[-c=dmd|gdc|ldc]\tspecify a compiler to use\n"
                        "\t[-o=\"options\"]\t\tspecify D compiler options\n"
                        "\t[-l=libname]\t\tspecify lib name (sans .ext)\n"
                        "\t[-p=sysname]\t\tdetermines package filtering (windows|linux|freebsd)\n";

        bool populate (char[][] arg)
        {       
                auto args = new Arguments;
                auto q = args('q');
                auto u = args('u');
                auto i = args('i');
                auto v = args('v');
                auto l = args('l').smush.params(1);
                auto p = args('p').smush.params(1);
                auto o = args('o').smush.params(1).defaults("-release");
                auto c = args('c').smush.params(1).defaults("dmd").restrict("dmd", "gdc", "ldc");
                auto r = args('r').smush.params(1).defaults("dmd").restrict("dmd", "gdc", "ldc");
                auto n = args(null).params(1).required.title("tango-path");
                auto h = args("help").aliased('h').aliased('?').halt;

                version (Windows)
                         p.defaults("windows");
                else
                version (linux)
                         p.defaults("linux");
                else
                version (freebsd)
                         p.defaults("freebsd");
                else
                   p.required;
                
                version (Windows)
                        {
                        l.defaults("tango");
                        auto libext = ".lib";
                        }
                     else
                        {
                        l.defaults("libtango");
                        auto libext = ".a";
                        }

                if (args.parse (arg))
                   {
                   user = u.set;
                   core = r.set;
                   quick = q.set;
                   inhibit = i.set;
                   verbose = v.set;
                   os = p.assigned[0];
                   root = n.assigned[0];
                   flags = o.assigned[0];
                   target = r.assigned[0];
                   compiler = c.assigned[0];
                   lib = l.assigned[0]~libext;
                   return true;
                   }

                stdout (usage);
                if (! h.set)
                      stdout (args.errors (&stdout.layout.sprint));
                return false;
        }
}

