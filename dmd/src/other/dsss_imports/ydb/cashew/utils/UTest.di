/*****************************************************************************************
 *  Support for consistancy of output from unittests.
 *
 *  $(CASHEW_HEAD)
 *
 *  Version: 0.2.4
 *
 *  Authors:
 *    Reiner Pope <i>(initial concept and code)</i><br />
 *    Christopher Nicholson-Sauls
 *
 *  Date: Aug 18, 2007
 *
 *----------------------------------------------------------------------------------------
 *  module foo .bar ;
 *  
 *  static import UTest = ydb.cashew.utils .utest ;
 *
 *  unittest { UTest.beginModule("foo.bar"); }
 *
 *  int doStuff () {
 *    // ...
 *  }
 *  unittest {
 *    UTest.begin("doStuff()");
 *    assert(doStuff() == 0);
 *    UTest.end;
 *  }
 *
 *  unittest { UTest.beginSection("special"); }
 *
 *  int specialFunc () {
 *    // ...
 *  }
 *  unittest {
 *    UTest.begin("specialFunc()");
 *    assert(specialFunc() == 42);
 *    UTest.end;
 *  }
 *
 *  unittest {
 *    UTest.endSection;
 *    UTest.endModule;
 *  }
 *----------------------------------------------------------------------------------------
 */
module ydb.cashew.utils .UTest ;

/*****************************************************************************************
 *  Source for depth tabs.
 */
private const STR_TABS = "\t\t\t\t\t\t\t\t"c ;

/*****************************************************************************************
 *  Current depth.
 */
private size_t depth = 0_U ;

/*****************************************************************************************
 *  Source for item arrows.
 */
private const  ARROW     = "\t-----------------------------> "c ;
private char[] itemArrow ;

/*****************************************************************************************
 *  Current module name.
 */
private char[] moduleName ;

/*****************************************************************************************
 *  Import the preferred output functionality.  With Tango it uses io.Stdout, and with
 *  Phobos it uses std.stdio.
 */
version(Tango) { public import tango .io .Stdout ; }
else           { public import std       .stdio  ; }

/*****************************************************************************************
 *  Current depth string.
 */
private char[] depthString () {
  return STR_TABS[0 .. depth];
}

/*****************************************************************************************
 *  Control code for moduleOutput().
 */
private enum : size_t {
  HEADER = 0_U ,
  FOOTER = 1_U 
}

/*****************************************************************************************
 *  Output module header/footer.
 */
private void moduleOutput (size_t which) {
  static char[][] HDFT = ["begin"c, "end"c] ;

  version(Tango) { Stdout.formatln("Unittest: {0}: {1}"c, moduleName, HDFT[which]).flush; }
  else           {        writefln("Unittest: %s: %s"c  , moduleName, HDFT[which])      ; }
}

/*****************************************************************************************
 *  Call near the beginning of a module to header all unittest output.
 */
void beginModule (char[] name) {
  moduleName = name;
  depth = 0_U;
  moduleOutput(HEADER);
}

/*****************************************************************************************
 *  Call at the end of a module to footer output.
 */
void endModule () {
  moduleOutput(FOOTER);
}

/*****************************************************************************************
 *  Advance the depth and output a section title.
 */
void beginSection (char[] name) {
  ++depth;

  version(Tango) { Stdout.formatln("{0}[{1}]"c, depthString(), name).flush; }
  else           {        writefln("%s[%s]"c  , depthString(), name)      ; }
}

/*****************************************************************************************
 *  Retreat the depth.
 */
void endSection () {
  --depth;
}

/*****************************************************************************************
 *  Call at the beginning of a test item to output a name and arrow.
 */
void begin (char[] name) {
  itemArrow = ARROW.dup;
  itemArrow[1 .. name.length + 1] = name;

  version(Tango) { Stdout.format("{}{}"c , depthString(), itemArrow).flush; }
  else           {        writef("%s%s"c , depthString(), itemArrow)      ; }
}

/*****************************************************************************************
 *  Call at the _end of a test item to output the word 'Pass' since the test obviously did,
 *  or else it wouldn't reach this point!
 */
void end () {
  version(Tango) { Stdout  ("Pass"c).newline.flush; }
  else           { writefln("Pass"c)              ; }
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
