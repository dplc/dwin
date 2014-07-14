// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2008  (yidabu  g m a i l at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: June 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module ydb.net.GoogleSearch;

private import tango.net.http.HttpGet;
private import tango.time.Time;
private import tango.util.Convert;
private import tango.text.Ascii;
private import TextUtil = tango.text.Util;

private import dwin.text.scregexp;
private import dwin.sys.Process;
private import dwin.net.Uri;

debug import tango.util.log.Trace;


/**
    if inurl in query, some times ,must re connect to internet
    Example:
    ---
    char[] text = "Program PAD URL inurl:submit.php";
    auto search = new GoogleSearch(text);
    auto all = search.onePerSite();
    foreach(url; all)
        Stdout(url).newline;
    ---
    http://www.google.com/codesearch?hl=en&q=show:0HjXRXBufQ4:k7RiVOhWvEg:ZrdQ5ePC76o&sa=N&ct=rd&cs_p=http://nlp.stanford.edu/software/StanfordTagger.tar.gz&cs_f=tagger-2004-08-16/src/edu/stanford/nlp/web/websearch.init&start=1
    GoogleKey = 91d6BIFBeAu5AIk3qwLz2H/TmkF90x/X

*/

class GoogleSearch
{

    this(char[] q_)
    {
        this.q = q_;
    }

    private static float                timeout = 5;

    static void setTimeout (float seconds)
    {
            timeout = seconds;
    }

    int totalResultsAvailable;

    //http://www.fravia.com/google.htm
    private static char[] base = "http://www.google.com/search";
    char[] q;
    char[] start = "0";             //The point in the search results where Google should start. Result 0 is the first result on the first page
    char[] num = "100";             //Number of results presented per page (MAX 100)

    char[] hl = "en";               //interface language code
    char[] as_qdr = "all";          //m3 = past 3 months; m6 = past 6 months; y = past year
    char[] sa = "N";               //Enables or disables "safe search" (Autocensoring)

    bool validQueryUrl()
    {
        return q.length && q.length > 5 ;
    }

    char[] getQueryUrl()
    {
        return base ~ "?" ~
        "q=" ~ uriEncode(q, 65001) ~ "&" ~
        "num=" ~ num ~ "&" ~
        "hl=" ~ hl ~ "&" ~
        "as_qdr=" ~ as_qdr ~ "&" ~
        "start=" ~ start ~ "&" ~
        "sa=" ~ sa ;
    }

    char[] get()
    {
        if(!validQueryUrl())
            return null;
        auto query = getQueryUrl();
        char[] result;
        try
        {
            scope page = new HttpGet(query);    //will throw IOException here if not connected to the internet
            page.setTimeout(timeout);

            result = cast(char[]) page.read;
        }
        catch(Exception e)
                debug Trace.formatln("{} get catch {}", this.classinfo.name, e.msg);
        return result;
    }

    static bool validResult(char[] result)
    {
        return result !is null && result.length && TextUtil.containsPattern(result, "seconds)");
    }

    //移除网址前缀，以简明显示
    static char[] getDomain(char[] s)
    {
        auto result = s;
        result = TextUtil.chopl( result, "http://" );
        result = TextUtil.chopl( result, "https://" );
        result = TextUtil.chopl( result, "www." );
        result = TextUtil.chopr( result, "/" );
        result = TextUtil.delimit(result, "/")[0];
        return toLower(result);
    }
    //

    char[][char[]] onePerSite()
    {
        char[][char[]] result;

        auto all = parse();
        if(!all.length) return null;
        foreach(url; all)
        {
            auto domain = getDomain(url);
            if((domain in result) is null)
                result[domain] = url;
            else
            {
                if(result[domain].length > url.length)
                    result[domain] = url;
            }
        }
        return result;
    }

    char[][] parse()
    {
        char[][] result;

        num = "1";
        start = "0";
        auto strGet = get();

        if(!validResult(strGet))
        {
            return null;
        }
        //of about <b>718,000,000</b> for
        //of <b>28</b> for
        scope regex = new screg!(r"of (?:about )<b>([\d,]+)</b> for");
        if(!regex.match(strGet))
        {
            return null;
        }
        totalResultsAvailable = to!(int)( TextUtil.substitute(regex._(1),",", "") );
        strGet = "";
        num = "100";
        auto end = totalResultsAvailable > 1000 ? 1000 : totalResultsAvailable;
        for(size_t i= 0; i < end; i += 100)
        {
            start = to!(char[])(i);
            auto tmp = get();
            if(!validResult(tmp)) break;
            strGet ~= tmp;
            doEvents(50);
        }

        if(!validResult(strGet)) return null;
        //<a href="http://www.leokrut.com/leofiles/submit.php" target=_blank class=l
        scope regex2 = new screg!("href=.([^ ]+?). target=_blank class=l");
        while(regex2.match(strGet))
        {
            result ~= regex2._(1);
        }
        return result;
    }

}
version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
