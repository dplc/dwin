
// Written in the D programming language.

/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        author:         yidabu ( D China : http://bbs.d-programming-language-china.org )

*******************************************************************************/

module ydb.Misc;

private import ydb.HttpGet;
private import  tango.io.device.File;
    
private import  Util = tango.text.Util,
                tango.text.convert.Integer,
                tango.text.Regex;
    
version(ydbVerbose) import tango.util.log.Trace;


/**
    Examples:
    ---
        auto page = recuSeoKeys ("中医", "医,养,健,针,刮,药,推,科,美,减", "大学,社,院,局,报,校,志,中心,协会,纲,考,所,聘,科,部", "baidu");
        writeSeoKeys(page, "zhongyi");
    ---
*/
bool writeSeoKeys(char[][] keys, char[] varname, char[] fullpath = r"D:\d\dmd\src\other\ydb\SeoKeys.d")
{    
    //if give varname , write result to file
    try
    {    
        char[] sappend = "char[][] " ~ varname ~ "Keys = [" ;            
        foreach(k,v; keys)    
        {
            sappend ~= "\"" ~ v ~ "\", ";
            if(k % 8 == 5) sappend ~= "\r\n\t";
        }
        sappend = Util.trim(sappend);
        sappend = sappend[0..$-1];      //delete traling ,
        sappend ~= "];\r\n";
        
        auto f = new File(fullpath);
        char[] src = cast(char[]) f.load;
        src = Regex(r"char\[\]\[\]\s*" ~ varname ~ r"Keys(.|\s)+?;").replaceAll(src, "");
        src = Util.trim(src);
        f.write(src ~ "\r\n\r\n" ~ sappend);
        return true;
    }
    catch(Exception e)
    {
       version(ydbVerbose) Trace.formatln("writeSeoKeys catch",e.msg);
   }
    //eturn false;
}
//writeSeoKeys



/**
    from
        http://msdn2.microsoft.com/en-us/library/ms776446.aspx
    then copy to dreamweaver, and tidy
*/
int [char[]] getCodePageIdentifier()
{
	char[] codePageIdentifier=`
	<table>
	  <tr>
		<th>Identifier</th>
		<th>.NET Name</th>
		<th>Additional information</th>
	  </tr>
	  <tr>
		<td>037</td>
		<td>IBM037</td>
		<td>IBM EBCDIC US-Canada</td>
	  </tr>
	  <tr>
		<td>437</td>
		<td>IBM437</td>
		<td>OEM United States</td>
	  </tr>
	  <tr>
		<td>500</td>
		<td>IBM500</td>
		<td>IBM EBCDIC International</td>
	  </tr>
	  <tr>
		<td>708</td>
		<td>ASMO-708</td>
		<td>Arabic (ASMO 708)</td>
	  </tr>
	  <tr>
		<td>709</td>
		<td><!----></td>
		<td>Arabic (ASMO-449+, BCON V4)</td>
	  </tr>
	  <tr>
		<td>710</td>
		<td><!----></td>
		<td>Arabic - Transparent Arabic</td>
	  </tr>
	  <tr>
		<td>720</td>
		<td>DOS-720</td>
		<td>Arabic (Transparent ASMO); Arabic (DOS)</td>
	  </tr>
	  <tr>
		<td>737</td>
		<td>ibm737</td>
		<td>OEM Greek (formerly 437G); Greek (DOS)</td>
	  </tr>
	  <tr>
		<td>775</td>
		<td>ibm775</td>
		<td>OEM Baltic; Baltic (DOS)</td>
	  </tr>
	  <tr>
		<td>850</td>
		<td>ibm850</td>
		<td>OEM Multilingual Latin 1; Western European (DOS)</td>
	  </tr>
	  <tr>
		<td>852</td>
		<td>ibm852</td>
		<td>OEM Latin 2; Central European (DOS)</td>
	  </tr>
	  <tr>
		<td>855</td>
		<td>IBM855</td>
		<td>OEM Cyrillic (primarily Russian)</td>
	  </tr>
	  <tr>
		<td>857</td>
		<td>ibm857</td>
		<td>OEM Turkish; Turkish (DOS)</td>
	  </tr>
	  <tr>
		<td>858</td>
		<td>IBM00858</td>
		<td>OEM Multilingual Latin 1 + Euro symbol</td>
	  </tr>
	  <tr>
		<td>860</td>
		<td>IBM860</td>
		<td>OEM Portuguese; Portuguese (DOS)</td>
	  </tr>
	  <tr>
		<td>861</td>
		<td>ibm861</td>
		<td>OEM Icelandic; Icelandic (DOS)</td>
	  </tr>
	  <tr>
		<td>862</td>
		<td>DOS-862</td>
		<td>OEM Hebrew; Hebrew (DOS)</td>
	  </tr>
	  <tr>
		<td>863</td>
		<td>IBM863</td>
		<td>OEM French Canadian; French Canadian (DOS)</td>
	  </tr>
	  <tr>
		<td>864</td>
		<td>IBM864</td>
		<td>OEM Arabic; Arabic (864)</td>
	  </tr>
	  <tr>
		<td>865</td>
		<td>IBM865</td>
		<td>OEM Nordic; Nordic (DOS)</td>
	  </tr>
	  <tr>
		<td>866</td>
		<td>cp866</td>
		<td>OEM Russian; Cyrillic (DOS)</td>
	  </tr>
	  <tr>
		<td>869</td>
		<td>ibm869</td>
		<td>OEM Modern Greek; Greek, Modern (DOS)</td>
	  </tr>
	  <tr>
		<td>870</td>
		<td>IBM870</td>
		<td>IBM EBCDIC Multilingual/ROECE (Latin 2); IBM EBCDIC Multilingual Latin 2</td>
	  </tr>
	  <tr>
		<td>874</td>
		<td>windows-874</td>
		<td>ANSI/OEM Thai (same as 28605, ISO 8859-15); Thai (Windows)</td>
	  </tr>
	  <tr>
		<td>875</td>
		<td>cp875</td>
		<td>IBM EBCDIC Greek Modern</td>
	  </tr>
	  <tr>
		<td>932</td>
		<td>shift_jis</td>
		<td>ANSI/OEM Japanese; Japanese (Shift-JIS)</td>
	  </tr>
	  <tr>
		<td>936</td>
		<td>gb2312</td>
		<td>ANSI/OEM Simplified Chinese (PRC, Singapore); Chinese Simplified (GB2312)</td>
	  </tr>
	  <tr>
		<td>949</td>
		<td>ks_c_5601-1987</td>
		<td>ANSI/OEM Korean (Unified Hangul Code)</td>
	  </tr>
	  <tr>
		<td>950</td>
		<td>big5</td>
		<td>ANSI/OEM Traditional Chinese (Taiwan; Hong Kong SAR, PRC); Chinese Traditional (Big5)</td>
	  </tr>
	  <tr>
		<td>1026</td>
		<td>IBM1026</td>
		<td>IBM EBCDIC Turkish (Latin 5)</td>
	  </tr>
	  <tr>
		<td>1047</td>
		<td>IBM01047</td>
		<td>IBM EBCDIC Latin 1/Open System</td>
	  </tr>
	  <tr>
		<td>1140</td>
		<td>IBM01140</td>
		<td>IBM EBCDIC US-Canada (037 + Euro symbol); IBM EBCDIC (US-Canada-Euro) </td>
	  </tr>
	  <tr>
		<td>1141</td>
		<td>IBM01141</td>
		<td>IBM EBCDIC Germany (20273 + Euro symbol); IBM EBCDIC (Germany-Euro)</td>
	  </tr>
	  <tr>
		<td>1142</td>
		<td>IBM01142</td>
		<td>IBM EBCDIC Denmark-Norway (20277 + Euro symbol); IBM EBCDIC (Denmark-Norway-Euro)</td>
	  </tr>
	  <tr>
		<td>1143</td>
		<td>IBM01143</td>
		<td>IBM EBCDIC Finland-Sweden (20278 + Euro symbol); IBM EBCDIC (Finland-Sweden-Euro)</td>
	  </tr>
	  <tr>
		<td>1144</td>
		<td>IBM01144</td>
		<td>IBM EBCDIC Italy (20280 + Euro symbol); IBM EBCDIC (Italy-Euro)</td>
	  </tr>
	  <tr>
		<td>1145</td>
		<td>IBM01145</td>
		<td>IBM EBCDIC Latin America-Spain (20284 + Euro symbol); IBM EBCDIC (Spain-Euro)</td>
	  </tr>
	  <tr>
		<td>1146</td>
		<td>IBM01146</td>
		<td>IBM EBCDIC United Kingdom (20285 + Euro symbol); IBM EBCDIC (UK-Euro)</td>
	  </tr>
	  <tr>
		<td>1147</td>
		<td>IBM01147</td>
		<td>IBM EBCDIC France (20297 + Euro symbol); IBM EBCDIC (France-Euro)</td>
	  </tr>
	  <tr>
		<td>1148</td>
		<td>IBM01148</td>
		<td>IBM EBCDIC International (500 + Euro symbol); IBM EBCDIC (International-Euro)</td>
	  </tr>
	  <tr>
		<td>1149</td>
		<td>IBM01149</td>
		<td>IBM EBCDIC Icelandic (20871 + Euro symbol); IBM EBCDIC (Icelandic-Euro)</td>
	  </tr>
	  <tr>
		<td>1200</td>
		<td>utf-16</td>
		<td>Unicode UTF-16, little endian byte order (BMP of ISO 10646); available only to managed applications</td>
	  </tr>
	  <tr>
		<td>1201</td>
		<td>unicodeFFFE</td>
		<td>Unicode UTF-16, big endian byte order; available only to managed applications </td>
	  </tr>
	  <tr>
		<td>1250</td>
		<td>windows-1250</td>
		<td>ANSI Central European; Central European (Windows) </td>
	  </tr>
	  <tr>
		<td>1251</td>
		<td>windows-1251</td>
		<td>ANSI Cyrillic; Cyrillic (Windows)</td>
	  </tr>
	  <tr>
		<td>1252</td>
		<td>windows-1252</td>
		<td>ANSI Latin 1; Western European (Windows) </td>
	  </tr>
	  <tr>
		<td>1253</td>
		<td>windows-1253</td>
		<td>ANSI Greek; Greek (Windows)</td>
	  </tr>
	  <tr>
		<td>1254</td>
		<td>windows-1254</td>
		<td>ANSI Turkish; Turkish (Windows)</td>
	  </tr>
	  <tr>
		<td>1255</td>
		<td>windows-1255</td>
		<td>ANSI Hebrew; Hebrew (Windows)</td>
	  </tr>
	  <tr>
		<td>1256</td>
		<td>windows-1256</td>
		<td>ANSI Arabic; Arabic (Windows)</td>
	  </tr>
	  <tr>
		<td>1257</td>
		<td>windows-1257</td>
		<td>ANSI Baltic; Baltic (Windows)</td>
	  </tr>
	  <tr>
		<td>1258</td>
		<td>windows-1258</td>
		<td>ANSI/OEM Vietnamese; Vietnamese (Windows)</td>
	  </tr>
	  <tr>
		<td>1361</td>
		<td>Johab</td>
		<td>Korean (Johab)</td>
	  </tr>
	  <tr>
		<td>10000</td>
		<td>macintosh</td>
		<td>MAC Roman; Western European (Mac)</td>
	  </tr>
	  <tr>
		<td>10001</td>
		<td>x-mac-japanese</td>
		<td>Japanese (Mac)</td>
	  </tr>
	  <tr>
		<td>10002</td>
		<td>x-mac-chinesetrad</td>
		<td>MAC Traditional Chinese (Big5); Chinese Traditional (Mac)</td>
	  </tr>
	  <tr>
		<td>10003</td>
		<td>x-mac-korean</td>
		<td>Korean (Mac)</td>
	  </tr>
	  <tr>
		<td>10004</td>
		<td>x-mac-arabic</td>
		<td>Arabic (Mac)</td>
	  </tr>
	  <tr>
		<td>10005</td>
		<td>x-mac-hebrew</td>
		<td>Hebrew (Mac)</td>
	  </tr>
	  <tr>
		<td>10006</td>
		<td>x-mac-greek</td>
		<td>Greek (Mac)</td>
	  </tr>
	  <tr>
		<td>10007</td>
		<td>x-mac-cyrillic</td>
		<td>Cyrillic (Mac)</td>
	  </tr>
	  <tr>
		<td>10008</td>
		<td>x-mac-chinesesimp</td>
		<td>MAC Simplified Chinese (GB 2312); Chinese Simplified (Mac)</td>
	  </tr>
	  <tr>
		<td>10010</td>
		<td>x-mac-romanian</td>
		<td>Romanian (Mac)</td>
	  </tr>
	  <tr>
		<td>10017</td>
		<td>x-mac-ukrainian</td>
		<td>Ukrainian (Mac)</td>
	  </tr>
	  <tr>
		<td>10021</td>
		<td>x-mac-thai</td>
		<td>Thai (Mac)</td>
	  </tr>
	  <tr>
		<td>10029</td>
		<td>x-mac-ce</td>
		<td>MAC Latin 2; Central European (Mac)</td>
	  </tr>
	  <tr>
		<td>10079</td>
		<td>x-mac-icelandic</td>
		<td>Icelandic (Mac)</td>
	  </tr>
	  <tr>
		<td>10081</td>
		<td>x-mac-turkish</td>
		<td>Turkish (Mac)</td>
	  </tr>
	  <tr>
		<td>10082</td>
		<td>x-mac-croatian</td>
		<td>Croatian (Mac)</td>
	  </tr>
	  <tr>
		<td>12000</td>
		<td>utf-32</td>
		<td>Unicode UTF-32, little endian byte order; available only to managed applications</td>
	  </tr>
	  <tr>
		<td>12001</td>
		<td>utf-32BE</td>
		<td>Unicode UTF-32, big endian byte order; available only to managed applications</td>
	  </tr>
	  <tr>
		<td>20000</td>
		<td>x-Chinese_CNS</td>
		<td>CNS Taiwan; Chinese Traditional (CNS) </td>
	  </tr>
	  <tr>
		<td>20001</td>
		<td>x-cp20001</td>
		<td>TCA Taiwan</td>
	  </tr>
	  <tr>
		<td>20002</td>
		<td>x_Chinese-Eten</td>
		<td>Eten Taiwan; Chinese Traditional (Eten) </td>
	  </tr>
	  <tr>
		<td>20003</td>
		<td>x-cp20003</td>
		<td>IBM5550 Taiwan</td>
	  </tr>
	  <tr>
		<td>20004</td>
		<td>x-cp20004</td>
		<td>TeleText Taiwan </td>
	  </tr>
	  <tr>
		<td>20005</td>
		<td>x-cp20005</td>
		<td>Wang Taiwan </td>
	  </tr>
	  <tr>
		<td>20105</td>
		<td>x-IA5</td>
		<td>IA5 (IRV International Alphabet No. 5, 7-bit); Western European (IA5)</td>
	  </tr>
	  <tr>
		<td>20106</td>
		<td>x-IA5-German</td>
		<td>IA5 German (7-bit)</td>
	  </tr>
	  <tr>
		<td>20107</td>
		<td>x-IA5-Swedish</td>
		<td>IA5 Swedish (7-bit)</td>
	  </tr>
	  <tr>
		<td>20108</td>
		<td>x-IA5-Norwegian</td>
		<td>IA5 Norwegian (7-bit)</td>
	  </tr>
	  <tr>
		<td>20127</td>
		<td>us-ascii</td>
		<td>US-ASCII (7-bit)</td>
	  </tr>
	  <tr>
		<td>20261</td>
		<td>x-cp20261</td>
		<td>T.61</td>
	  </tr>
	  <tr>
		<td>20269</td>
		<td>x-cp20269</td>
		<td>ISO 6937 Non-Spacing Accent</td>
	  </tr>
	  <tr>
		<td>20273</td>
		<td>IBM273</td>
		<td>IBM EBCDIC Germany</td>
	  </tr>
	  <tr>
		<td>20277</td>
		<td>IBM277</td>
		<td>IBM EBCDIC Denmark-Norway</td>
	  </tr>
	  <tr>
		<td>20278</td>
		<td>IBM278</td>
		<td>IBM EBCDIC Finland-Sweden</td>
	  </tr>
	  <tr>
		<td>20280</td>
		<td>IBM280</td>
		<td>IBM EBCDIC Italy</td>
	  </tr>
	  <tr>
		<td>20284</td>
		<td>IBM284</td>
		<td>IBM EBCDIC Latin America-Spain</td>
	  </tr>
	  <tr>
		<td>20285</td>
		<td>IBM285</td>
		<td>IBM EBCDIC United Kingdom</td>
	  </tr>
	  <tr>
		<td>20290</td>
		<td>IBM290</td>
		<td>IBM EBCDIC Japanese Katakana Extended</td>
	  </tr>
	  <tr>
		<td>20297</td>
		<td>IBM297</td>
		<td>IBM EBCDIC France</td>
	  </tr>
	  <tr>
		<td>20420</td>
		<td>IBM420</td>
		<td>IBM EBCDIC Arabic</td>
	  </tr>
	  <tr>
		<td>20423</td>
		<td>IBM423</td>
		<td>IBM EBCDIC Greek</td>
	  </tr>
	  <tr>
		<td>20424</td>
		<td>IBM424</td>
		<td>IBM EBCDIC Hebrew</td>
	  </tr>
	  <tr>
		<td>20833</td>
		<td>x-EBCDIC-KoreanExtended</td>
		<td>IBM EBCDIC Korean Extended</td>
	  </tr>
	  <tr>
		<td>20838</td>
		<td>IBM-Thai</td>
		<td>IBM EBCDIC Thai</td>
	  </tr>
	  <tr>
		<td>20866</td>
		<td>koi8-r</td>
		<td>Russian (KOI8-R); Cyrillic (KOI8-R)</td>
	  </tr>
	  <tr>
		<td>20871</td>
		<td>IBM871</td>
		<td>IBM EBCDIC Icelandic</td>
	  </tr>
	  <tr>
		<td>20880</td>
		<td>IBM880</td>
		<td>IBM EBCDIC Cyrillic Russian</td>
	  </tr>
	  <tr>
		<td>20905</td>
		<td>IBM905</td>
		<td>IBM EBCDIC Turkish</td>
	  </tr>
	  <tr>
		<td>20924</td>
		<td>IBM00924</td>
		<td>IBM EBCDIC Latin 1/Open System (1047 + Euro symbol)</td>
	  </tr>
	  <tr>
		<td>20932</td>
		<td>EUC-JP</td>
		<td>Japanese (JIS 0208-1990 and 0121-1990)</td>
	  </tr>
	  <tr>
		<td>20936</td>
		<td>x-cp20936</td>
		<td>Simplified Chinese (GB2312); Chinese Simplified (GB2312-80)</td>
	  </tr>
	  <tr>
		<td>20949</td>
		<td>x-cp20949</td>
		<td>Korean Wansung</td>
	  </tr>
	  <tr>
		<td>21025</td>
		<td>cp1025</td>
		<td>IBM EBCDIC Cyrillic Serbian-Bulgarian</td>
	  </tr>
	  <tr>
		<td>21027</td>
		<td><!----></td>
		<td>(deprecated)</td>
	  </tr>
	  <tr>
		<td>21866</td>
		<td>koi8-u</td>
		<td>Ukrainian (KOI8-U); Cyrillic (KOI8-U)</td>
	  </tr>
	  <tr>
		<td>28591</td>
		<td>iso-8859-1</td>
		<td>ISO 8859-1 Latin 1; Western European (ISO)</td>
	  </tr>
	  <tr>
		<td>28592</td>
		<td>iso-8859-2</td>
		<td>ISO 8859-2 Central European; Central European (ISO)</td>
	  </tr>
	  <tr>
		<td>28593</td>
		<td>iso-8859-3</td>
		<td>ISO 8859-3 Latin 3</td>
	  </tr>
	  <tr>
		<td>28594</td>
		<td>iso-8859-4</td>
		<td>ISO 8859-4 Baltic</td>
	  </tr>
	  <tr>
		<td>28595</td>
		<td>iso-8859-5</td>
		<td>ISO 8859-5 Cyrillic</td>
	  </tr>
	  <tr>
		<td>28596</td>
		<td>iso-8859-6</td>
		<td>ISO 8859-6 Arabic</td>
	  </tr>
	  <tr>
		<td>28597</td>
		<td>iso-8859-7</td>
		<td>ISO 8859-7 Greek</td>
	  </tr>
	  <tr>
		<td>28598</td>
		<td>iso-8859-8</td>
		<td>ISO 8859-8 Hebrew; Hebrew (ISO-Visual)</td>
	  </tr>
	  <tr>
		<td>28599</td>
		<td>iso-8859-9</td>
		<td>ISO 8859-9 Turkish</td>
	  </tr>
	  <tr>
		<td>28603</td>
		<td>iso-8859-13</td>
		<td>ISO 8859-13 Estonian</td>
	  </tr>
	  <tr>
		<td>28605</td>
		<td>iso-8859-15</td>
		<td>ISO 8859-15 Latin 9</td>
	  </tr>
	  <tr>
		<td>29001</td>
		<td>x-Europa</td>
		<td>Europa 3</td>
	  </tr>
	  <tr>
		<td>38598</td>
		<td>iso-8859-8-i</td>
		<td>ISO 8859-8 Hebrew; Hebrew (ISO-Logical)</td>
	  </tr>
	  <tr>
		<td>50220</td>
		<td>iso-2022-jp</td>
		<td>ISO 2022 Japanese with no halfwidth Katakana; Japanese (JIS)</td>
	  </tr>
	  <tr>
		<td>50221</td>
		<td>csISO2022JP</td>
		<td>ISO 2022 Japanese with halfwidth Katakana; Japanese (JIS-Allow 1 byte Kana)</td>
	  </tr>
	  <tr>
		<td>50222</td>
		<td>iso-2022-jp</td>
		<td>ISO 2022 Japanese JIS X 0201-1989; Japanese (JIS-Allow 1 byte Kana - SO/SI)</td>
	  </tr>
	  <tr>
		<td>50225</td>
		<td>iso-2022-kr</td>
		<td>ISO 2022 Korean </td>
	  </tr>
	  <tr>
		<td>50227</td>
		<td>x-cp50227</td>
		<td>ISO 2022 Simplified Chinese; Chinese Simplified (ISO 2022)</td>
	  </tr>
	  <tr>
		<td>50229</td>
		<td><!----></td>
		<td>ISO 2022 Traditional Chinese</td>
	  </tr>
	  <tr>
		<td>50930</td>
		<td><!----></td>
		<td>EBCDIC Japanese (Katakana) Extended</td>
	  </tr>
	  <tr>
		<td>50931</td>
		<td><!----></td>
		<td>EBCDIC US-Canada and Japanese</td>
	  </tr>
	  <tr>
		<td>50933</td>
		<td><!----></td>
		<td>EBCDIC Korean Extended and Korean</td>
	  </tr>
	  <tr>
		<td>50935</td>
		<td><!----></td>
		<td>EBCDIC Simplified Chinese Extended and Simplified Chinese</td>
	  </tr>
	  <tr>
		<td>50936</td>
		<td><!----></td>
		<td>EBCDIC Simplified Chinese</td>
	  </tr>
	  <tr>
		<td>50937</td>
		<td><!----></td>
		<td>EBCDIC US-Canada and Traditional Chinese</td>
	  </tr>
	  <tr>
		<td>50939</td>
		<td><!----></td>
		<td>EBCDIC Japanese (Latin) Extended and Japanese</td>
	  </tr>
	  <tr>
		<td>51932</td>
		<td>euc-jp</td>
		<td>EUC Japanese</td>
	  </tr>
	  <tr>
		<td>51936</td>
		<td>EUC-CN</td>
		<td>EUC Simplified Chinese; Chinese Simplified (EUC)</td>
	  </tr>
	  <tr>
		<td>51949</td>
		<td>euc-kr</td>
		<td>EUC Korean</td>
	  </tr>
	  <tr>
		<td>51950</td>
		<td><!----></td>
		<td>EUC Traditional Chinese</td>
	  </tr>
	  <tr>
		<td>52936</td>
		<td>hz-gb-2312</td>
		<td>HZ-GB2312 Simplified Chinese; Chinese Simplified (HZ) </td>
	  </tr>
	  <tr>
		<td>54936</td>
		<td>GB18030</td>
		<td><b>Windows XP and later:</b> GB18030 Simplified Chinese (4 byte); Chinese Simplified (GB18030) </td>
	  </tr>
	  <tr>
		<td>57002</td>
		<td>x-iscii-de</td>
		<td>ISCII Devanagari</td>
	  </tr>
	  <tr>
		<td>57003</td>
		<td>x-iscii-be</td>
		<td>ISCII Bengali</td>
	  </tr>
	  <tr>
		<td>57004</td>
		<td>x-iscii-ta</td>
		<td>ISCII Tamil</td>
	  </tr>
	  <tr>
		<td>57005</td>
		<td>x-iscii-te</td>
		<td>ISCII Telugu</td>
	  </tr>
	  <tr>
		<td>57006</td>
		<td>x-iscii-as</td>
		<td>ISCII Assamese</td>
	  </tr>
	  <tr>
		<td>57007</td>
		<td>x-iscii-or</td>
		<td>ISCII Oriya</td>
	  </tr>
	  <tr>
		<td>57008</td>
		<td>x-iscii-ka</td>
		<td>ISCII Kannada</td>
	  </tr>
	  <tr>
		<td>57009</td>
		<td>x-iscii-ma</td>
		<td>ISCII Malayalam</td>
	  </tr>
	  <tr>
		<td>57010</td>
		<td>x-iscii-gu</td>
		<td>ISCII Gujarati</td>
	  </tr>
	  <tr>
		<td>57011</td>
		<td>x-iscii-pa</td>
		<td>ISCII Punjabi</td>
	  </tr>
	  <tr>
		<td>65000</td>
		<td>utf-7</td>
		<td>Unicode (UTF-7)</td>
	  </tr>
	  <tr>
		<td>65001</td>
		<td>utf-8</td>
		<td>Unicode (UTF-8)</td>
	  </tr>
	</table>

`;
	int [char[]] a;
	
	foreach(m; Regex(r"<tr>\s+<td>(\d+)</td>\s+<td>(.+?)</td>","g").search(codePageIdentifier))
	{
		a[m.match(2)] = toInt(m.match(1));
	}
	foreach(char[] k,int v;a)
	{
		version(ydbVerbose) Trace.formatln("aCodePage[{}] = {};",k,v);
	}
	return a;
	
}



//


version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
