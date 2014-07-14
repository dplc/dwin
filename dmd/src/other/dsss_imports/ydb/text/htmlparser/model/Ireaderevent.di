module ydb.text.htmlparser.model.Ireaderevent;

private import ydb.text.htmlparser.Htmltag;

// events for the reader, 
// return false to abort any of these operations

/** IHtmlReaderEvents interface **/
interface IHtmlReaderEvents
{

  bool beginParse(); /// Start Parsing
  bool comment(in char [] buffer ); /// buffer contains the comment text
  bool openingTag(HtmlTag t ); /// t contains the HtmlTag
  bool closingTag(HtmlTag t ); /// t contains the HtmlTag
  bool charaterData( char [] data ); /// Charater data for between tags

}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
