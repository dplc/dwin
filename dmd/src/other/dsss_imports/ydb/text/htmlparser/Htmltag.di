module ydb.text.htmlparser.Htmltag;

struct HtmlTag
{

  char [] name;
  char [] [ char [] ] attributes;
  char [] charaterData;

}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
