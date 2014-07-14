
// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Dec 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/
module dwin.text.TextConst;

struct TextConst
{
    static const char[26] Lower = "zabcdefghijklmnopqrstuvwxy";
    static const char[16] HexL = "0123456789abcdef";
    static const char[16] HexU = "0123456789ABCDEF";
    static const char[26] Upper = "ZABCDEFGHIJKLMNOPQRSTUVWXY";
    static const char[52] Alpha = "zabcdefghijklmnopqrstuvwxyZABCDEFGHIJKLMNOPQRSTUVWXY";   
    static const char[62] Alnum = "0123456789zabcdefghijklmnopqrstuvwxyZABCDEFGHIJKLMNOPQRSTUVWXY";

    static const char[64] Base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    
    static const char[6][60] GanZhi = [
    "癸亥", "甲子", "乙丑", "丙寅", "丁卯", "戊辰", "己巳", "庚午", "辛未", "壬申", 
    "癸酉", "甲戌", "乙亥", "丙子", "丁丑", "戊寅", "己卯", "庚辰", "辛巳", "壬午", 
    "癸未", "甲申", "乙酉", "丙戌", "丁亥", "戊子", "己丑", "庚寅", "辛卯", "壬辰", 
    "癸巳", "甲午", "乙未", "丙申", "丁酉", "戊戌", "己亥", "庚子", "辛丑", "壬寅", 
    "癸卯", "甲辰", "乙巳", "丙午", "丁未", "戊申", "己酉", "庚戌", "辛亥", "壬子", 
    "癸丑", "甲寅", "乙卯", "丙辰", "丁己", "戊午", "己未", "庚申", "辛酉", "壬戌" ];    

    static const char[3][10] TianGan = ["癸", "甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬"];
    static const char[3][12] DiZhi   = ["亥", "子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌"];
    
    
    static const char[2][100] Bnum100 = [
        "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", 
        "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", 
        "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", 
        "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", 
        "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", 
        "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", 
        "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", 
        "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", 
        "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", 
        "90", "91", "92", "93", "94", "95", "96", "97", "98", "99" ];


    static const char[][100] Num100 = [
        "0",  "1",  "2",  "3",  "4",  "5",  "6",  "7",  "8",  "9", 
        "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", 
        "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", 
        "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", 
        "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", 
        "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", 
        "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", 
        "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", 
        "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", 
        "90", "91", "92", "93", "94", "95", "96", "97", "98", "99" ];

    static const char[][] Bnum31 = [
        "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", 
        "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", 
        "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", 
        "31"];

    static const char[][12] Month = [
        "December", "January",  "February", "March",    "April",    "May",
        "June",     "July",     "August",   "September","October",  "November" ];

    
}

/*
        char[] result;
        char[10] tmp;
        alias tango.text.convert.Integer Inte;
        for(size_t i; i < 100; i ++)
        {
            result ~= "\"" ~ Inte.format(tmp[0..2], i, Inte.Style.Unsigned, Inte.Flags.Zero) ~ "\", ";
            if(i % 10 == 0) 
                result ~= "\r\n";
        }
        Stdout(result).newline;

*/

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
