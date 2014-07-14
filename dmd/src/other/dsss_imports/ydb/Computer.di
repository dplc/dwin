
// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: 30 Nov 2007

        Authors:        yidabu ( D Programming Language China : http://bbs.d-programming-language-china.org )

*******************************************************************************/

module ydb.Computer;


private import  dwin.sys.win32.Registry,
                dwin.sys.win32.UserGdi,
                dwin.sys.win32.Wrapper,
                dwin.sys.win32.SpecialPath,
                dwin.time.WallClock,
                dwin.text.Util,
                dwin.io.FileRoots;


private import  tango.util.Convert,
                tango.net.Uri,
                tango.io.FilePath;

private import tango.sys.win32.Macros;
private import tango.sys.win32.UserGdi;
//private import  dfl.environment,
                //dfl.application;

/**
    get Computer information

    Examples:
    ---
    auto comp = Computer();
    Stdout(comp.toPostData).newline;
    ---
*/

    /// wait dfl update to with tango 0.99.7
class Computer
{

    char[] [ushort] langId;
    static char[] dirSign = r"D:\d\";


    this()
    {
        langIdInit();
    }
        static Computer opCall()
        {
            return new Computer();
        }

    /// for use with IE post method
    char[] toStringPost()
    {
        char[] result;
        try
        {
            void cat(char[] pre, char[] s)
            {
                if(s.length)
                    result ~= pre ~ "=" ~ s ~ "&";
            }

            cat("name", to!(char[])(name.length) );
            cat("drivefix", to!(char[])(fixedDrives) );
            cat("xfull", to!(char[])(xfullScreen) );
            cat("yfull", to!(char[])(yfullScreen) );
            cat("syslang", this.sysLang() );
            cat("userlang", this.userLang() );
            cat("ie", ieVer);
            cat("os", osVer);
            cat("time", time);

            result.length = result.length -1;
        }
        catch(Exception e)
            version(ydbVerbose)
                Trace.formatln("catch {} at Computer class toStringRemote func", e.msg);

        return result;
    }

    /// sign of Computer, used for xor key param
    static char[] sign()
    {
        char[] result;

        char[] na = to!(char[])(name.length);
        char[] df = to!(char[])(fixedDrives);
        char[] ti = time;


        result ~= na;   //
        result ~= df;
        if(ti.length)
            result ~= ti;

        return result;
    }

    static char[] time()
    {
        char[] result = "";
        try
        {
            result = sYearMonthDay();
        }
        catch(Exception e)
        {}

        return result;
    }

    static size_t fixedDrives()
    {
        size_t result = 0;
        try
        {
            result = .fixedDrives.length;
        }
        catch(Exception e)
        {}

        return result;
    }


    //for use with POST method, uri.encode is necessary
    static char[] name()
    {
        char[] result = "" ;
        try
        {
            result = getComputerName();
        }
        catch(Exception e)
        {
        }
        return result;
    }

    static char[] userName()
    {
        return getUserName();
    }

    static char[] osVer()
    {
       //return dfl.environment.Environment.osVersion.ver.toString();
        return "";
    }

    /**
        See_Also:
        Determine the version of Internet Explorer installed on a local machine
        http://www.codeproject.com/shell/detectie.asp?df=100&forumid=2925&select=539675#xx539675xx

        before IE 4.0:
        HKEY_LOCAL_MACHINE\Software\Microsoft\Internet   Explorer\Desktop\Components\DeskHtmlMinorVersion

    */
    
    static char[] ieVer()
    {
        char[] result="";
        //scope iekey = RegistryKey.localMachine.openSubKey(r"SOFTWARE\Microsoft\Internet Explorer");
        //if(iekey !is null)
            //result = iekey.getValue!(char[])("Version");
        return result;
    }
    

    //grabbed from juno.base.navite
    static bool isVista()
    {
        return (LOBYTE(LOWORD(GetVersion())) >= 6);
    }

    static int xfullScreen()
    {
        return GetSystemMetrics(SM_CXFULLSCREEN);
    }

    static int yfullScreen()
    {
        return GetSystemMetrics(SM_CYFULLSCREEN);
    }

    /**
        See_Also:
        GetSystemDefaultLangID
        http://msdn2.microsoft.com/en-us/library/ms776282.aspx
        http://msdn2.microsoft.com/en-us/library/ms776294.aspx
    */

    static bool isSimplified()
    {
        ushort d = GetSystemDefaultLangID();
        ushort u = GetUserDefaultLangID();

        return (d != 0x0804 && u != 0x0804);
    }

    /*
        langId[0x0c04]="CHINESE_HONGKONG";
        langId[0x1404]="CHINESE_MACAU";
        langId[0x1004]="CHINESE_SINGAPORE";
        langId[0x0804]="CHINESE_SIMPLIFIED";
        langId[0x0404]="CHINESE_TRADITIONAL";
    */
    static bool isChinese()
    {
        ushort d = GetSystemDefaultLangID();
        ushort u = GetUserDefaultLangID();
        ushort[] a = [0x0c04, 0x1404, 0x1004, 0x0804, 0x0404];
        foreach(v; a)
            if( d == v || u == v)
                return true;

        return false;
    }

    static bool isChinese(char[] dir)
    {
        if(!dir.length)
            dir = dirSign;

        if( FilePath(dir).exists )
            return false;

        return isChinese();
    }

    static void exitIfChinese()
    {
        //if( isChinese(dirSign) )
           // Application.exitThread();
    }

    static ushort sysDefaultLangId()
    {
        return GetSystemDefaultLangID();
    }

    static ushort userDefaultLangId()
    {
        return GetUserDefaultLangID();
    }

    char[] sysLang()
    {
        auto id = GetSystemDefaultLangID();
        char[]* p = ( id in langId );
        return (p != null) ? *p : itoa(id);
    }

    char[] userLang()
    {
        auto id =  GetSystemDefaultLangID() ;
        char[]* p = ( id in langId );
        return (p != null) ? *p : itoa(id);
    }



    static size_t desktopFiles()
    {
        return FilePath(desktopPath).toList.length;
    }

    static size_t favoritesFiles()
    {
        return FilePath(favoritesPath).toList.length;
    }

    static size_t programFiles()
    {
        return FilePath(programFilesPath).toList.length;
    }


    private void langIdInit()
    {
        langId[0x1000]="CUSTOM_UNSPECIFIED";
        langId[0x0C00]="CUSTOM_DEFAULT";
        langId[0x1400]="UI_CUSTOM_DEFAULT";
        langId[0x007f]="NEUTRAL";
        langId[0x0000]="NEUTRAL";
        langId[0x0800]="SYS_DEFAULT";
        langId[0x0400]="DEFAULT";
        langId[0x0436]="AFRIKAANS_SOUTH_AFRICA";
        langId[0x041c]="ALBANIAN_ALBANIA";
        langId[0x0484]="ALSATIAN_FRANCE";
        langId[0x045e]="AMHARIC_ETHIOPIA";
        langId[0x1401]="ARABIC_ALGERIA";
        langId[0x3c01]="ARABIC_BAHRAIN";
        langId[0x0c01]="ARABIC_EGYPT";
        langId[0x0801]="ARABIC_IRAQ";
        langId[0x2c01]="ARABIC_JORDAN";
        langId[0x3401]="ARABIC_KUWAIT";
        langId[0x3001]="ARABIC_LEBANON";
        langId[0x1001]="ARABIC_LIBYA";
        langId[0x1801]="ARABIC_MOROCCO";
        langId[0x2001]="ARABIC_OMAN";
        langId[0x4001]="ARABIC_QATAR";
        langId[0x0401]="ARABIC_SAUDI_ARABIA";
        langId[0x2801]="ARABIC_SYRIA";
        langId[0x1c01]="ARABIC_TUNISIA";
        langId[0x3801]="ARABIC_UAE";
        langId[0x2401]="ARABIC_YEMEN";
        langId[0x042b]="ARMENIAN_ARMENIA";
        langId[0x044d]="ASSAMESE_INDIA";
        langId[0x082c]="AZERI_CYRILLIC";
        langId[0x042c]="AZERI_LATIN";
        langId[0x046d]="BASHKIR_RUSSIA";
        langId[0x042d]="BASQUE_BASQUE";
        langId[0x0423]="BELARUSIAN_BELARUS";
        langId[0x0445]="BENGALI_BANGLADESH";
        langId[0x201a]="BOSNIAN_BOSNIA_HERZEGOVINA_CYRILLIC";
        langId[0x141a]="BOSNIAN_BOSNIA_HERZEGOVINA_LATIN";
        langId[0x047e]="BRETON_FRANCE";
        langId[0x0402]="BULGARIAN_BULGARIA";
        langId[0x0403]="CATALAN_CATALAN";
        langId[0x0c04]="CHINESE_HONGKONG";
        langId[0x1404]="CHINESE_MACAU";
        langId[0x1004]="CHINESE_SINGAPORE";
        langId[0x0804]="CHINESE_SIMPLIFIED";
        langId[0x0404]="CHINESE_TRADITIONAL";
        langId[0x0483]="CORSICAN_FRANCE";
        langId[0x101a]="CROATIAN_BOSNIA_HERZEGOVINA_LATIN";
        langId[0x041a]="CROATIAN_CROATIA";
        langId[0x0405]="CZECH_CZECH_REPUBLIC";
        langId[0x0406]="DANISH_DENMARK";
        langId[0x048c]="DARI_AFGHANISTAN";
        langId[0x0465]="DIVEHI_MALDIVES";
        langId[0x0813]="DUTCH_BELGIAN";
        langId[0x0413]="DUTCH";
        langId[0x0c09]="ENGLISH_AUS";
        langId[0x2809]="ENGLISH_BELIZE";
        langId[0x1009]="ENGLISH_CAN";
        langId[0x2409]="ENGLISH_CARIBBEAN";
        langId[0x4009]="ENGLISH_INDIA";
        langId[0x1809]="ENGLISH_EIRE";
        langId[0x1809]="ENGLISH_IRELAND";
        langId[0x2009]="ENGLISH_JAMAICA";
        langId[0x4409]="ENGLISH_MALAYSIA";
        langId[0x1409]="ENGLISH_NZ";
        langId[0x3409]="ENGLISH_PHILIPPINES";
        langId[0x4809]="ENGLISH_SINGAPORE";
        langId[0x1c09]="ENGLISH_SOUTH_AFRICA";
        langId[0x2c09]="ENGLISH_TRINIDAD";
        langId[0x0809]="ENGLISH_UK";
        langId[0x0409]="ENGLISH_US";
        langId[0x3009]="ENGLISH_ZIMBABWE";
        langId[0x0425]="ESTONIAN_ESTONIA";
        langId[0x0438]="FAEROESE_FAROE_ISLANDS";
        langId[0x0464]="FILIPINO_PHILIPPINES";
        langId[0x040b]="FINNISH_FINLAND";
        langId[0x080c]="FRENCH_BELGIAN";
        langId[0x0c0c]="FRENCH_CANADIAN";
        langId[0x040c]="FRENCH";
        langId[0x140c]="FRENCH_LUXEMBOURG";
        langId[0x180c]="FRENCH_MONACO";
        langId[0x100c]="FRENCH_SWISS";
        langId[0x0462]="FRISIAN_NETHERLANDS";
        langId[0x0456]="GALICIAN_GALICIAN";
        langId[0x0437]="GEORGIAN_GEORGIA";
        langId[0x0c07]="GERMAN_AUSTRIAN";
        langId[0x0407]="GERMAN";
        langId[0x1407]="GERMAN_LIECHTENSTEIN";
        langId[0x1007]="GERMAN_LUXEMBOURG";
        langId[0x0807]="GERMAN_SWISS";
        langId[0x0408]="GREEK_GREECE";
        langId[0x046f]="GREENLANDIC_GREENLAND";
        langId[0x0447]="GUJARATI_INDIA";
        langId[0x0468]="HAUSA_NIGERIA_LATIN";
        langId[0x040d]="HEBREW_ISRAEL";
        langId[0x0439]="HINDI_INDIA";
        langId[0x040e]="HUNGARIAN_HUNGARY";
        langId[0x040f]="ICELANDIC_ICELAND";
        langId[0x0470]="IGBO_NIGERIA";
        langId[0x0421]="INDONESIAN_INDONESIA";
        langId[0x085d]="INUKTITUT_CANADA_LATIN";
        langId[0x045d]="INUKTITUT_CANADA";
        langId[0x083c]="IRISH_IRELAND";
        langId[0x0410]="ITALIAN";
        langId[0x0810]="ITALIAN_SWISS";
        langId[0x0411]="JAPANESE_JAPAN";
        langId[0x044b]="KANNADA_INDIA";
        langId[0x043f]="KAZAK_KAZAKHSTAN";
        langId[0x0453]="KHMER_CAMBODIA";
        langId[0x0486]="KICHE_GUATEMALA";
        langId[0x0487]="KINYARWANDA_RWANDA";
        langId[0x0457]="KONKANI_INDIA";
        langId[0x0412]="KOREAN";
        langId[0x0440]="KYRGYZ_KYRGYZSTAN";
        langId[0x0454]="LAO_LAO";
        langId[0x0426]="LATVIAN_LATVIA";
        langId[0x0427]="LITHUANIAN_LITHUANIA";
        langId[0x082e]="LOWER_SORBIAN_GERMANY";
        langId[0x046e]="LUXEMBOURGISH_LUXEMBOURG";
        langId[0x042f]="MACEDONIAN_MACEDONIA";
        langId[0x083e]="MALAY_BRUNEI_DARUSSALAM";
        langId[0x043e]="MALAY_MALAYSIA";
        langId[0x044c]="MALAYALAM_INDIA";
        langId[0x043a]="MALTESE_MALTA";
        langId[0x0481]="MAORI_NEW_ZEALAND";
        langId[0x047a]="MAPUDUNGUN_CHILE";
        langId[0x044e]="MARATHI_INDIA";
        langId[0x047c]="MOHAWK_MOHAWK";
        langId[0x0450]="MONGOLIAN_CYRILLIC_MONGOLIA";
        langId[0x0850]="MONGOLIAN_PRC";
        langId[0x0461]="NEPALI_NEPAL";
        langId[0x0414]="NORWEGIAN_BOKMAL";
        langId[0x0814]="NORWEGIAN_NYNORSK";
        langId[0x0482]="OCCITAN_FRANCE";
        langId[0x0448]="ORIYA_INDIA";
        langId[0x0463]="PASHTO_AFGHANISTAN";
        langId[0x0429]="PERSIAN_IRAN";
        langId[0x0415]="POLISH_POLAND";
        langId[0x0416]="PORTUGUESE_BRAZILIAN";
        langId[0x0816]="PORTUGUESE";
        langId[0x0816]="PORTUGUESE_PORTUGAL";
        langId[0x0446]="PUNJABI_INDIA";
        langId[0x046b]="QUECHUA_BOLIVIA";
        langId[0x086b]="QUECHUA_ECUADOR";
        langId[0x0c6b]="QUECHUA_PERU";
        langId[0x0418]="ROMANIAN_ROMANIA";
        langId[0x0417]="ROMANSH_SWITZERLAND";
        langId[0x0419]="RUSSIAN_RUSSIA";
        langId[0x243b]="SAMI_INARI_FINLAND";
        langId[0x103b]="SAMI_LULE_NORWAY";
        langId[0x143b]="SAMI_LULE_SWEDEN";
        langId[0x0c3b]="SAMI_NORTHERN_FINLAND";
        langId[0x043b]="SAMI_NORTHERN_NORWAY";
        langId[0x083b]="SAMI_NORTHERN_SWEDEN";
        langId[0x203b]="SAMI_SKOLT_FINLAND";
        langId[0x183b]="SAMI_SOUTHERN_NORWAY";
        langId[0x1c3b]="SAMI_SOUTHERN_SWEDEN";
        langId[0x044f]="SANSKRIT_INDIA";
        langId[0x0c1a]="SERBIAN_CYRILLIC";
        langId[0x081a]="SERBIAN_LATIN";
        langId[0x046c]="SOTHO_NORTHERN_SOUTH_AFRICA";
        langId[0x0432]="TSWANA_SOUTH_AFRICA";
        langId[0x045b]="SINHALESE_SRI_LANKA";
        langId[0x041b]="SLOVAK_SLOVAKIA";
        langId[0x0424]="SLOVENIAN_SLOVENIA";
        langId[0x2c0a]="SPANISH_ARGENTINA";
        langId[0x400a]="SPANISH_BOLIVIA";
        langId[0x340a]="SPANISH_CHILE";
        langId[0x240a]="SPANISH_COLOMBIA";
        langId[0x140a]="SPANISH_COSTA_RICA";
        langId[0x1c0a]="SPANISH_DOMINICAN_REPUBLIC";
        langId[0x300a]="SPANISH_ECUADOR";
        langId[0x440a]="SPANISH_EL_SALVADOR";
        langId[0x100a]="SPANISH_GUATEMALA";
        langId[0x480a]="SPANISH_HONDURAS";
        langId[0x080a]="SPANISH_MEXICAN";
        langId[0x4c0a]="SPANISH_NICARAGUA";
        langId[0x180a]="SPANISH_PANAMA";
        langId[0x3c0a]="SPANISH_PARAGUAY";
        langId[0x280a]="SPANISH_PERU";
        langId[0x500a]="SPANISH_PUERTO_RICO";
        langId[0x0c0a]="SPANISH";
        langId[0x380a]="SPANISH_URUGUAY";
        langId[0x200a]="SPANISH_VENEZUELA";
        langId[0x0441]="SWAHILI";
        langId[0x081d]="SWEDISH_FINLAND";
        langId[0x041d]="SWEDISH";
        langId[0x041d]="SWEDISH_SWEDEN";
        langId[0x045a]="SYRIAC";
        langId[0x0428]="TAJIK_TAJIKISTAN";
        langId[0x085f]="TAMAZIGHT_ALGERIA_LATIN";
        langId[0x0449]="TAMIL_INDIA";
        langId[0x0444]="TATAR_RUSSIA";
        langId[0x044a]="TELUGU_INDIA";
        langId[0x041e]="THAI_THAILAND";
        langId[0x0451]="TIBETAN_PRC";
        langId[0x041f]="TURKISH_TURKEY";
        langId[0x0442]="TURKMEN_TURKMENISTAN";
        langId[0x0480]="UIGHUR_PRC";
        langId[0x0422]="UKRAINIAN_UKRAINE";
        langId[0x042e]="UPPER_SORBIAN_GERMANY";
        langId[0x0820]="URDU_INDIA";
        langId[0x0420]="URDU_PAKISTAN";
        langId[0x0843]="UZBEK_CYRILLIC";
        langId[0x0443]="UZBEK_LATIN";
        langId[0x042a]="VIETNAMESE_VIETNAM";
        langId[0x0452]="WELSH_UNITED_KINGDOM";
        langId[0x0488]="WOLOF_SENEGAL";
        langId[0x0434]="XHOSA_SOUTH_AFRICA";
        langId[0x0485]="YAKUT_RUSSIA";
        langId[0x0478]="YI_PRC";
        langId[0x046a]="YORUBA_NIGERIA";
        langId[0x0435]="ZULU_SOUTH_AFRICA";
    }

    /*
    //no more need
    static size_t removableDrives()
    {
        return .removableDrives.length;
    }


    static size_t remoteDrives()
    {
        return .remoteDrives.length;
    }

    static size_t cdDrives()
    {
        return .cdDrives.length;
    }

    static size_t ramDrives()
    {
        return .ramDrives.length;
    }
    */
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
