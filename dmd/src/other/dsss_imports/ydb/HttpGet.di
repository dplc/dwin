
// Written in the D programming language.

/*******************************************************************************

        copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        author:         yidabu ( D China : http://bbs.d-programming-language-china.org )

*******************************************************************************/

module ydb.HttpGet;

private import  tango.text.Regex,
                tango.text.Util;

private import  tango.net.http.HttpGet,
                tango.core.Array,
                tango.core.Exception,
                tango.sys.win32.CodePage,
                tango.util.Convert;

private import  tango.time.Time;

private import  dwin.text.Util,
                dwin.core.Exception;

private import dwin.net.Uri : uriEncode;
private import dwin.sys.Process : doEvents;

version(ydbVerbose) import tango.util.log.Trace;


/**
    get SEO keywords from search engine.
    Params:
        key     = what key to search
        must    = what word must appear in seo keywords
        exclude = exclude parts. mulit words separate by ,
        engine  = what search engine to use
    Examples:
    ---
        auto result = seoKeys("excel", "excel,word", null, "google");
    ---

*/
char[][] seoKeys(char[] key,  char[] must = null, char[] exclude = null, char[] engine = "baidu")
{
    char[][] result;
    key = trim(key);
    if(!key.length) return result;

    char[]  url,
            pattern;
    switch (engine)
    {
        case "baidu":
            key = uriEncode(key, 936);
            url = "http://www2.baidu.com/inquire/rsquery.php?submit=1&qstr=";
            pattern = "align=left width=150>&nbsp;([^<]+?)</td>" ;
            break;
        case "google":
            key = uriEncode(key, 936);
            url = "http://www.google.cn/search?hl=zh-CN&q=";
            pattern = "class=rsl>([^<]+?)</a>" ;
            break;
        default:
            throw new IllegalArgumentException("search engine " ~ engine ~ " not support");

    }

    url ~= key  ;
    char[] s = cast(char[]) (new HttpGet(url)).read;

    if(s.length < 300)
        return result;

    char[] tmp = new char[s.length *2];

    if(engine == "baidu" || engine == "google" )
        s = CodePage.from(s, tmp, 936);

    //version(netVerbose) Trace(s).newline;
    foreach( m; Regex(pattern).search(s) )
    {
        if(must)
            if ( !containsPatterns(m.match(1), must) )
                continue;
        if(exclude)
            if( containsPatterns(m.match(1), exclude) )
                continue;
        result ~= m.match(1);
    }
    if(!result)
        version(ydbVerbose) Trace.formatln("not got any keys", s);

    return result;
}
//getKeys


/**
    recursion get SeoKeys

*/
char[][] recurseSeoKeys(char[] key, char[] must = null, char[] exclude = null, char[] engine = "baidu")
{
    char[][] result;
    result = seoKeys(key, must, exclude, engine);
    if(result.length)
    {
        foreach(v; result.dup)
            result ~= seoKeys(v, must, exclude, engine);
    }
    if(result.length)
    {
        result.sort;
        size_t n = distinct(result) ;
        result = result[0 .. n];
        result = absUnique(result);
    }
    return result;
}
//recurseSeoKeys

/**
    get top search words from top.baidu.com
    <a href="http://image.baidu.com/i?ct=201326592&cl=2&lm=-1&tn=baiduimage&word=%D5%C5%F3%E3%D3%EA" target="_blank" class="p12blue"> 张筱雨</a>

    Examples:
    ---
    char[] url = "http://top.baidu.com/girls.html";
    TopInfo[] topInfo = baiduTop(url);
    foreach(v; topInfo)
    {
        Stdout(v.name ~ "=" ~ v.url).newline;
    }
    ---
*/

char[][char[]] [] baiduTop(char[] url, char[] pattern =
`(http://image\.baidu\.com/[^"]+?tn=baiduimage[^"]+)"[^>]+>\s*([^<]+)<`)
{
    char[][char[]] [] result;
    auto httpGet = new HttpGet(url);

    //TimeSpan timeSpan = TimeSpan.seconds(6);
    httpGet.setTimeout(6f);
    char[] s = cast(char[]) httpGet.read;

    if(s.length < 300)
        return result;
    s = CodePage.from(s, new char[s.length *2], 936);

    size_t i;
    foreach( m; Regex(pattern).search(s) )
    {
        ++i;
        char[][char[]] info;
        info["name"]   = m.match(2);
        info["url"]    = m.match(1);
        info["index"]  = to!(char[])(i);
        result ~= info;
    }
    return result;
}
//



struct ImageInfo
{
    char[]  fullsizeUrl;
    size_t    thumbWidth,
            thumbHeight,
            fullsizeWidth,
            fullsizeHeight;
    char[]  thumbUrl;
}
//ImageInfo

/**
    //todo: need up to date with Tango new Regex
    Examples:
    ---

        char[] listUrl = "http://images.google.com/images?imgsz=small%7Cmedium%7Clarge%7Cxlarge&svnum=100&hl=en&safe=off&q=%E5%BE%90%E8%8B%A5%E7%91%84&ndsp=20&start=";
        auto re = GoogleImage.getImagesFromList(listUrl);
        Stdout("length=",re.length).newline;
        foreach(v; re)
        {
            Stdout(v.fullsizeUrl, " ", v.fullsizeWidth, " ", v.fullsizeHeight, "\n");
        }
    ---

*/

struct GoogleImage
{
    /*
        fullsizeUrl:
//"_kx7ViBUGPi8tM:","http://www.xuruoxuan.mobi/up_files/image/2007-7-3/4b1d0a6e02000nx7.jpg","130","98","传艾迴高层不满\x3cb\x3e徐若瑄\x3c/b\x3e不打.","","","500 x 375
        http://tbn0.google.com/images?q=tbn:AbfY_siQcG9gtM:http://cimg2.163.com/ent/2007/6/14/2007061413412986ab5.jpg
    */
    static char[] pattern =`"([^"]+?:)","([^"]+)","(\d+)","(\d+)"[^\r\n]+?"(\d+)\x20+x\x20+(\d+)[^\r\n]+?"(http[^"]+?google[^"]+)"`;

    static ImageInfo[]  getImagesFromList(char[] listUrl)
    {
        ImageInfo[] result;

        if(!listUrl.length || listUrl.length < 10 || listUrl[0..4] != "http")
        {
            version(ydbVerbose) Trace.formatln("invalid listUrl {} at GoogleImage", listUrl);
            return result;
        }

        try
        {

        auto httpGet = new HttpGet(listUrl);
        //TimeSpan timeSpan = TimeSpan.seconds(5);
        httpGet.setTimeout(5);
        char[] s = cast(char[]) httpGet.read;

        if(s.length < 300)
        {
            version(ydbVerbose) Trace.formatln("too short result length {} at GoogleImage", s.length);
            return result;      //TODO : add Trace code
        }


        foreach( m; Regex(pattern,"ig").search(s) )
        {
            ImageInfo image;
            char[] q                = m.match(1);
            image.fullsizeUrl       = m.match(2);
            image.thumbWidth        = to!(uint)(m.match(3));
            image.thumbHeight       = to!(uint)(m.match(4));
            image.fullsizeWidth     = to!(uint)(m.match(5));
            image.fullsizeHeight    = to!(uint)(m.match(6));
            char[] imageServer      = m.match(7);
            image.thumbUrl          = imageServer ~ "?q=tbn:" ~ q ~ image.fullsizeUrl;
            result  ~= image;

        }
        }//try
        catch(Exception e)
        {
            version(ydbVerbose)
                Trace.formatln("GoogleImage getImagesFromList catch {}", e.msg);
        }
        return result;
    }


}
debug(UnitTest) unittest
{
    char[] htmlSource = `dyn.Img("http://hi.baidu.com/liuyifei/blog/category/%25B7%25C6%25B7%25C6%25BD%25FC%25BF%25F6&h=332&w=500&sz=27&hl=en&start=1","","AbfY_siQcG9gtM:","http://cimg2.163.com/ent/2007/6/14/2007061413412986ab5.jpg","130","86","\x3cb\x3e...\x3c/b\x3e 连杰、\x3cb\x3e刘亦菲\x3c/b\x3e、李冰冰等倾巢而出。","","","500 x 332 - 27k","jpg","hi.baidu.com","","","http://tbn0.google.com/images","1")`;
    auto r = Regex(GoogleImage.pattern, "i");
    assert( r.test(htmlSource) );
}
//




/+
// Phobos version of html get, no more need with Tango
char[] htmlget(char[] url = "http://www.baidu.com")
{
	char[] result;
	char[] domain;
	ushort port;
	char[] line;

	try
	{

	int i;
	i = std.string.find(url, "://");
	if(i != -1)
	{
		if(icmp(url[0 .. i], "http"))
			throw new Exception("http:// expected");
		url = url[i + 3 .. url.length]; // Strip off protocol. d\samples lack the line, then can't use http...
	}

	i = std.string.find(url, '#');
	if(i != -1) // Remove anchor ref.
		url = url[0 .. i];

	i = std.string.find(url, '/');

	if(i == -1)
	{
		domain = url;
		url = "/";
	}
	else
	{
		domain = url[0 .. i];
		url = url[i .. url.length];
	}

	i = std.string.find(domain, ':');
	if(i == -1)
	{
		port = 80; // Default HTTP port.
	}
	else
	{
		char[] t = domain[i + 1 .. domain.length];
		port = std.conv.toUshort(t);

		domain = domain[0 .. i];
	}
	debug(HTMLGET)
		printf("Connecting to " ~ domain ~ " on port " ~ std.string.toString(port) ~ "...\n");

	auto Socket sock = new TcpSocket(new InternetAddress(domain, port));  //www.d-programming-language-china.org 80
	Stream ss = new SocketStream(sock);

	debug(HTMLGET)
		printf("Connected!\nRequesting URL \"" ~ url ~ "\"...\n");


	if(port != 80)
		domain = domain ~ ":" ~ std.string.toString(port);
	ss.writeString("GET " ~ url ~ " HTTP/1.1\r\n"
		"Host: " ~ domain ~ "\r\n"
		"\r\n");

	// Skip HTTP header.
	//~ char[] line;
	for(;;)
	{
		line = ss.readLine();
		if(!line.length)
			break;

		const char[] CONTENT_TYPE_NAME = "Content-Type: ";
		if(line.length > CONTENT_TYPE_NAME.length &&
			!icmp(CONTENT_TYPE_NAME, line[0 .. CONTENT_TYPE_NAME.length]))
		{
			char[] type;
			type = line[CONTENT_TYPE_NAME.length .. line.length];
			if(type.length <= 5 || icmp("text/", type[0 .. 5]))
				throw new Exception("URL is not text");
		}
	}

	print_lines:
	while(!ss.eof())
	{
		line = ss.readLine();
		result ~= line ~ "\r\n";

		//if(std.string.ifind(line, "</html>") != -1)
		//	break;
		size_t iw;
		for(iw = 0; iw != line.length; iw++)
		{
			if(!icmp("</html>", line[iw .. line.length]))
				break print_lines;
		}
	}
	}//try
	catch(Exception e)
	{
		printf("htmlget catch %.*s\n",e.msg);
		return null;
	}
	return result;
}
//htmlget

+/
version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
