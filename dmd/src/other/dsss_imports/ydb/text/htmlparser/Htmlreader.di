/**
    Authors: charles sanders, http://www.the-charlie.com/
*/

module ydb.text.htmlparser.Htmlreader;


private import ydb.text.htmlparser.model.Ireaderevent;
private import ydb.text.htmlparser.Htmltag;
private import ydb.text.htmlparser.Platform;

class HtmlReader
{
  
  size_t bufferPos = 0;
  char [] buffer;
  char [] charaterData;
  IHtmlReaderEvents events;

  this(char [] buffer, IHtmlReaderEvents events)
  {
    this.buffer = buffer;
    this.events = events;
    bufferPos = 0; // reset pos
    charaterData . length  = 0;

  }

  char skipWhiteSpace()
  {
    char ch = getChar();
    while ( isSpace(ch) ) { ch = getChar(); }
    return ch;
    

  }

  size_t parseDocument()
  {

    assert(buffer.length);
    bufferPos = 0; // reset pos


    bool abort = false;
    bool openingTag = false;
    bool closingTag = false;
    bool inScriptTag = false;

    char [] 	characters;			// character data 
    char [] 	comment;				// comment data
    char [] 	tempStr;					// temporary storage
    long	charDataStart = 0L;	// starting position of character data
    long	charDataLen = 0L;		// length of character data
    long	temp = 0L;				// temporary storage
    char	ch = '\0';					// character at current buffer position


    
    events.beginParse();

    ch = skipWhiteSpace();

//     ungetChar();
//     ch = getChar();

    while ( ch != '\0')
      {

	//	Stdout("Char: ")(ch)().newline;
	switch ( ch )
	  {
	  case '<':
	    {


	      ungetChar();
	      HtmlTag	tag;			// tag information
	      if ( parseComment(comment ) ) // parse the comment
		{

		  if ( charaterData.length )
		    {
		      
		      if ( !events.charaterData(charaterData) ) break;
		      charaterData.length = 0 ;
		      
		    }

		  events.comment(comment);
		}
	      else if ( parseTag(tag, inScriptTag, openingTag, closingTag  ) ) // parse the opening or closing tag , if its in <script> we need to ignore stray <'s
		{

		  if ( charaterData.length ) // if there is is a closing tag, we call charater data event
		    {
		      
		      if ( !events.charaterData(charaterData) ) break;
		      charaterData.length = 0 ;
		      
		    }


		  if ( openingTag ) 
		    {
		      if ( !events.openingTag(tag ) ) return 1; // call open tag event
		      if ( tag.name == "script" ) inScriptTag = true;
		    }
		  else if ( closingTag ) 
		    {
		      if (!events.closingTag(tag) ) return 1; // close tag event
		      if ( tag.name == "script" ) inScriptTag = false;
		      break;
		    }
		}

	      
	      break;
	    }
	  default: // collect charater data, and call the event when one of the other tasks is reached
	    {

		
	      charaterData ~= ch;

	      break;
	    }



	  }

	ch = getChar();
	openingTag = false;
	closingTag = false;

      }

    return 0;
  }

  char ungetChar() 
  { 
    //    Stdout("UngetChar: ")(buffer[bufferPos])(" : ")(bufferPos)().newline;
    if ( bufferPos - 1 >= 0 )     return buffer[--bufferPos]; 
    else return '\0';

  }
  char getChar()
  {

    //    Stdout("GetChar: ")(buffer[bufferPos])(" : ")(bufferPos)().newline;

    if( bufferPos >= buffer.length ) return '\0';
    else return buffer[bufferPos++];

  }

  bool parseComment(inout char [] comment )
  {

    char [] tempComment ;
    long posBegin, posEnd = 0;


    if ( bufferPos+4 > buffer.length ) return false;
    if ( buffer[bufferPos .. bufferPos+4] != "<!--") return false;

    //    if ( !Text.equal(buffer.ptr,"<!--",4) ) return false;

    posBegin = bufferPos+4;
    posEnd = locatePattern(buffer, "--", cast(uint)posBegin) - 1;


    if ( posEnd > 0 )
      {
	comment = buffer[posBegin .. posEnd].dup;
	bufferPos = posEnd + 2; // the + 2 is for the ending '--' comment ender
	return true;
      }
    else return false;
  }




  bool parseTag( inout HtmlTag tag, bool mustBeScriptTag, inout bool openingTag, inout bool closingTag,  )
  {
    int revertBufferPos = bufferPos;
    char ch = buffer[bufferPos];
    
    ch = skipWhiteSpace();
    if (  ch != '<' ) return false; //its not a tag 
    ch = getChar();

    if ( ch == '>' )  // its an empty tag
      {
	return true;
      }
    else if ( ch == '/' ) // its a closing tag
      {
	closingTag = true;
	ch = getChar();
	//return true;
      }
    else
      {
	openingTag = true;


      }
    
    // this operation is for both opening and closing tags
    char [] tagName ;
    while ( ch == '-' || ch == '_' || ch == ':' || ch == '.' || isalnum(ch)  ) // now we collect the tag name
      {
	    
	tagName ~= ch;
	ch = getChar();

      }
    if ( mustBeScriptTag ) 
      {
	//	Stdout("Must be script, tagName[")(tagName)("]")().newline;
	if ( tagName != "script" )
	  {
	    bufferPos = revertBufferPos + 1; // skip the <
	    return false;
	  }
      }
	    

    ungetChar();

    tag.name = tagName;

    //    Stdout("TagName[" ) (tagName)("]")().newline;
    ch = skipWhiteSpace();
    char [] key, temp;
    char terminator;
    bool inAttributeValue = false;

    //    Stdout("In while loop [ ")(ch)(" ]")().newline;
    while ( ch != '\0') // now collect all the attributes
      {
	//Stdout("In while loop [ ")(ch)(" ]")().newline;

	if ( inAttributeValue ) // we are in either a quoted string or just a named attribute value
	  {

	    if ( ch == '\\' ) // escaping
	      {
		
		ch = getChar();
		if ( ch == terminator ) 
		  {
		    temp ~= ch;
		    ch = getChar();
		    continue;
		  }
		else ungetChar();
		
	      }


	    if ( terminator != '\0' ) // if we have a terminator , ' or "
	      {
		if ( ch == terminator ) 
		  {
		    
		    tag.attributes[key] = temp.dup;
		    temp.length = 0;
		    key.length = 0;
		    inAttributeValue = false;
		    
		  }
		else temp ~= ch;
	      }
	    else // otherwise there is no quotes, we test for space , > , or /
	      {
		if ( isspace(ch) || ch == '>' )
		  {
		    //Stdout("CH == > [")(ch)("] temp [")(temp)("]")().newline;
		    tag.attributes[key] = temp.dup;
		    temp.length = 0;
		    key.length = 0;
		    inAttributeValue = false;
		    if ( ch == '>') break;
		  }
		else 
		  {

		    temp ~= ch;
		    
		  }

	      }

	    	    ch = getChar();
	    //ch = skipWhiteSpace();
	    continue;
	  }
	else if ( ch == '>') // if attribues are finished we break out
	  {
	    break;
	  }

	else if ( ch == '=' ) // the equal sign starts the inAttributeValue = true part, we save the temp as the key and read the value
	  {
	    key = trim(temp).dup;
	    temp.length  = 0;
	    ch = getChar();

	    if ( ch == '\'' || ch == '"' ) 
	      {


		    terminator = ch;
		    inAttributeValue = true;
		  

	      }
	    else 
	      {
		terminator = '\0';
		inAttributeValue = true;
		ungetChar();
	      }

	  }
	else if ( ch == '/' ) // we test to see if its a self closing tag
	  {

	    char selfClosingTag = skipWhiteSpace();
	    if ( selfClosingTag == '>' )  // self closing tag
	      {
		openingTag = false;
		closingTag = true;
		break;
	      }
	    else 
	      {
		ungetChar();
		temp ~= ch;
	      }

	  }
	else // if all else fails we just appendn ch to temp , are key or are value
	  {
	    temp ~= ch;
	  }


	ch = getChar();
	//	Stdout("GetChar:[")(ch)("]")().newline;


      }

    if ( key.length) // one last value to set
      {
	tag.attributes[key] = temp.dup;
	//	Stdout("[")(key)("]=")(temp)();
	temp.length = 0;
	key.length = 0;
      }

    return true;
	
  }

}

debug(UnitTest)
{
    
    import ydb.text.htmlparser.Api;
    import ydb.text.htmlparser.Platform;

    unittest
    {
        class HtmlEvents : IHtmlReaderEvents
        {

              HtmlTag[] [ char [] ] tags;
              HtmlTag tag ;

              bool beginParse(){ return true; }

              bool comment(in char [] buffer )
              {
                return true;
              }

              bool openingTag(HtmlTag t )
              {
                //    Stdout("Opening Tag[")(t.name)("]")().newline;
                if ( t.name == "a" ) tag = t; // we capture the charater data for <a href's , one of the few tags we know uses closing tags
                else tags[t.name] ~= t;

                return true;
              }

              bool closingTag(HtmlTag t )
              {
                Stdout("Closing Tag[")(t.name)("]")().newline;
                if ( t.name == "a" ) tags[t.name] ~= t;
                return true;

              }

              bool charaterData( char [] data )
              {

                if ( tag.charaterData.length ) { 

                  tag.charaterData = data.dup;
                  tag.charaterData.length = 0;
                }
                
                return true;
              }

        }//HtmlEvents

        auto events = new HtmlEvents;
        char[] buffer;
        HtmlReader r = new HtmlReader(buffer, events);
        r.parseDocument();

        foreach ( tagName; events.tags.keys ) // enumerate a hrefs
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
    
    }//unittest
}//debug

/*
result:
Closing Tag[meta]
Closing Tag[title]
Closing Tag[script]
Closing Tag[script]
Closing Tag[script]
Closing Tag[head]
Closing Tag[frameset]
Closing Tag[frameset]
Closing Tag[html]
Tag []

Tag [head]

Tag [html]

Tag [frameset]
Attribute[framespacing]=[0]
Attribute[border]=[0]
Attribute[rows]=[50,*]
Attribute[frameborder]=[0]

Tag [frameset]
Attribute[framespacing]=[0]
Attribute[border]=[0]
Attribute[cols]=[210,*]
Attribute[frameborder]=[0]

Tag [frame]
Attribute[framespacing]=[0]
Attribute[border]=[0]
Attribute[marginwidth]=[0]
Attribute[marginheight]=[0]
Attribute[src]=[/top.php3]
Attribute[frameborder]=[0]
Attribute[name]=[topFrame]
Attribute[scrolling]=[No]

Tag [frame]
Attribute[border]=[0]
Attribute[src]=[/left.php3]
Attribute[frameborder]=[0]
Attribute[name]=[leftFrame]

Tag [frame]
Attribute[framespacing]=[0]
Attribute[border]=[0]
Attribute[marginwidth]=[7]
Attribute[marginheight]=[7]
Attribute[src]=[/clients/clients.php3]
Attribute[noresize scrolling]=[yes]
Attribute[frameborder]=[0]
Attribute[name]=[workFrame]

Tag [link]
Attribute[href]=[/favicon.ico]
Attribute[rel]=[shortcut icon]

Tag [title]

Tag [script]
Attribute[language]=[javascript]
Attribute[type]=[text/javascript]
Attribute[src]=[/javascript/common.js?plesk_version=psa-7.5.4-75060413.12]

Tag [script]
Attribute[language]=[javascript]
Attribute[type]=[text/javascript]
Attribute[src]=[/javascript/chk.js.php]

Tag [script]
Attribute[language]=[javascript]



*/




version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
