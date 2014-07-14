module ydb.text.htmlparser.Api;

public
{
  import ydb.text.htmlparser.Htmlreader;
  import ydb.text.htmlparser.Htmltag;
  import ydb.text.htmlparser.Platform;
  import ydb.text.htmlparser.model.Ireaderevent;
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
