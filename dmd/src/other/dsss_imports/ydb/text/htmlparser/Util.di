module ydb.text.htmlparser.Util;

private import ydb.text.htmlparser.Htmltag;
private import ydb.text.htmlparser.model.Ireaderevent;
private import tango.io.Stdout;
// utility class for basic parsing capabilities


struct SelectTag
{
  // html tag
  char [] name;
  char [] [ char [] ] attributes;
  //  char [] charaterData;
  // ~ html tag
  HtmlTag [] options;

}

class CommonEvents : IHtmlReaderEvents
{

  HtmlTag[] [ char [] ] tags;
  HtmlTag tag ;
  SelectTag select;
  HtmlTag option;

  HtmlTag [] inputs;
  SelectTag [] selects;
  HtmlTag [] ps;
  HtmlTag [] as;
  HtmlTag [] divs;
  HtmlTag [] forms;
  
  bool optionClose = false;
  bool optionOpen = false;
  char [] charaterBuffer;

  bool beginParse(){ return true; }

  bool comment(in char [] buffer )
  {
    return true;
  }

  bool openingTag(HtmlTag t )
  {

    tags[t.name] ~= t;

    switch ( t.name )
      {
      case "input": inputs ~= t;break;
      case "select": 
	{
	  select.name = t.name;
	  select.attributes = t.attributes;
	  break;
	}
      case "a": as ~= t;break;
      case "p": ps ~= t;break;
      case "div": divs ~= t;break;
      case "form": forms ~= t;break;
      case "option":
	{
	  if ( !optionClose && optionOpen ) // then the last option was unclosed, we push the existing option onto the current select
	    {
	      //	      option.attributes = t.attributes;
	      option.charaterData = charaterBuffer.dup;
	      select.options ~= option;	      
	      optionClose = false;
	    }
	  optionOpen = true;
	  option = t;
	  break;
	}
      default: break;
      }

    return true;
  }

  bool closingTag(HtmlTag t )
  {
    switch ( t.name )
      {

      case "select":
	{
	  selects ~= select;
	  break;
	}
      case "option":
	{

	  option.charaterData = charaterBuffer.dup;
	  optionClose = true;
	  select.options ~= option;
	  optionOpen = false;
	  break;
	}
      default: break;
      }
    return true;

  }

  bool charaterData( char [] data )
  {
    charaterBuffer = data;
    return true;
  }

}
//CommonEvents

debug(htmlparser)
{
    
    import ydb.text.htmlparser.Api;
    import ydb.text.htmlparser.Platform;
    import ydb.text.htmlparser.Util;
    import tango.net.http.HttpGet;
    import tango.io.Stdout;
    import tango.stdc.stdio;    
    
    unittest
    {
        
        char [] url = "http://www.google.com";
        auto httpGet = new HttpGet(url);
        char [] buffer = cast(char[])httpGet.read();

        auto events = new CommonEvents();
        HtmlReader reader = new HtmlReader(buffer, events);
        reader.parseDocument();

        foreach ( tagName; events.tags.keys.sort ) // enumerate all keys in alphabetical order
        {

          //      Stdout("Tag [")(tagName)("]")().newline;
          HtmlTag [] tags = events.tags[tagName];

        foreach (tag;tags )
        {

            Stdout("Tag [")(tag.name)("]")().newline;	 
            if ( tag.name == "a" ) Stdout("LinkData[")(tag.charaterData)("]")().newline;
            foreach ( k;tag.attributes.keys )
            {
                Stdout("Attribute[")(k)("]=[")(tag.attributes[k])("]")().newline;
            }
            Stdout().newline;
        }

        }

        // now select's

        Stdout("========SELECTS========\n\n")();

        foreach ( select;events.selects )
        {
            Stdout("[" ~ select.attributes["name"] ~ "]")().newline;
            foreach ( option;select.options )
            {
                //foreach ( key;option.attributes.keys ) 
                Stdout(option.charaterData)();

                if ( "value" in option.attributes ) Stdout( " ======> " ) ( option.attributes["value"]) ();

                Stdout().newline;

            }
            Stdout("\n")().newline;
        }        
    
    }
    //unittest
    
}
//debug





version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
