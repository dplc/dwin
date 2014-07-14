module ydb.net.libcurl.model.IMultiCurl;

interface IMultiCurl
{


}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
