module ydb.text.htmlparser.Basicevents;

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

class BasicHtmlEvents : IHtmlReaderEvents
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


version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
