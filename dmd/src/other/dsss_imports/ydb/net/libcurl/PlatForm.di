/** Platform specific imports / code */

module ydb.net.libcurl.PlatForm;
    
version ( Phobos )
{
    public import std.string;
    public import std.c.stdio;
    public import std.stream;

    alias  std.string.toStringz c_str;
    alias  std.string.toString d_str;
    
    private import std.uri;
    alias std.uri.encode UriEncode;


}
else version ( Tango )
{
    public import tango.stdc.stringz;
    public import tango.stdc.stdio;
    public import tango.io.device.File;
    public import tango.stdc.stdlib;

    alias  tango.stdc.stringz.toStringz c_str;
    alias  tango.stdc.stringz.fromStringz d_str;

    private import tango.net.Uri;
        
    char[] UriEncode(char[] str, int flags = Uri.IncQuery)
    {
        return Uri.encode(str, flags);
    }


}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
