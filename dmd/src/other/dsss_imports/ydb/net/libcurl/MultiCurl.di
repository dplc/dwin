module ydb.net.libcurl.MultiCurl;

private import ydb.net.libcurl.model.IMultiCurl;

class MultiCurl : IMultiCurl
{


}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
