
// Written in the D programming language.

/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        author:         yidabu ( D programming language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module ydb.Net;

public import   dwin.net.Uri,
                dwin.net.smtp.MailSender;

private import  tango.text.Util;

private import  dwin.text.Regex,
                dwin.text.Util;
    
private import tango.text.Ascii : toLower, compare;


/*
// need up to date with Tango new Regex
char[] urlReplace(char[] p, bool yidabu = true)
{
	char[] m0, m1;
	char[] re;
	char[] result;
	result = sub(p, `[^"'>=]((https?://)?(\w+\.)?(\w+\.)+(com|net|org|us)[/\w.#?&-=%]*)([\r\n]*)`,
		delegate char[] (Regex m)
		{
			m0 = m.match(0);
            m1 = toLower( m.match(1) );
            m1 = ( locatePattern(m1, "d-programming-language-china.org is 0 ) ? "www." ~ m1 : m1;
			m1 = ( locatePattern(m1, "http") is 0 ) ? m1 : "http://" ~ m1;
			re = m0[0] ~ "<a href=\"" ~ m1 ~ "\">" ~ m.match(1) ~ "</a>";
            if( m.match(6) && m.match(6).length )
                re ~= "</br>" ~ m.match(6);
			if (yidabu)
			{
				if ( containsPattern(m1, "yidabu") )
					return re;
			}
			else
			{
				return re;
			}
			return m.match(0);
		}, "ig"
	); 
	return result;
}
//

debug(UnitTest) unittest
{
	char[] s = " http://bbs.d-programming-language-china.org ";
	s = urlReplace(s);
	assert( s == ` <a href="http://bbs.d-programming-language-china.org ` ); 
	
	s = " d-programming-language-china.org ";
	s = urlReplace(s);
	assert( s == ` <a href="http://www.d-programming-language-china.org ` );
	
	char[] r = urlReplace(s);
	assert( compare(r, s) is 0 );
	
}
*/

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
