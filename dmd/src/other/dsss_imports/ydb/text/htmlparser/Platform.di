module ydb.text.htmlparser.Platform;

public
{
      
      import tango.text.Util;
      import tango.io.Stdout;
      import tango.stdc.ctype;

}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
