
// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: 2007

        Authors:        yidabu ( D programming language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module ydb.FileScan;

public import tango.io.FileScan;
private import tango.io.device.File;
    
alias FilePath.Filter Filter;


/+
    old code with Phobos
//
/*
* pathName =搜索目录
* pathPattern = 匹配路径的正则表达式
* pathExclude = 排除路径的正则表达式
* codePage = 源文件的代码页, 因为D中的正则比较只能用UTF-8
* subPattern = 匹配子串的正则表达式
* subAttributes = 搜索子串的特征
*/

int[char[]] findInFiles(char[] pathName, char[] pathPattern, char[] pathExclude, int codePage, char[] subPattern, char[] subAttributes = "i")
{
	int[char[]] result;
	try
	{
		char[][] files = ydb.file.listdir(pathName,pathPattern,pathExclude);
		if (!files) 
			return result;
		char[] src;
		char[] srcUTF8;
		int i;
			
		foreach(f;files)
		{
			src = cast(char[]) std.file.read(f);
			srcUTF8 = ydb.file.fromMBS(src, codePage);
			i = std.regexp.find(srcUTF8, subPattern, subAttributes);
			if ( i != -1 )
			{
				result[f] = i;
			}
			
		}
	}
	catch(Exception e)
	{
		printf("findInFiles catch %.*s\n",e.msg);
	}
	return result;
}
//=findInFiles

bool replaceInFiles(char[] pathName, char[] pathPattern, char[] pathExclude, int codePage, char[] subPattern, char[] replaceTo, char[] subAttributes = "ig")
{
	bool result;
	try
	{
		char[][] files = ydb.file.listdir(pathName,pathPattern,pathExclude);
		if (!files) 
			return result;
		char[] src;
		char[] srcUTF8;
			
		foreach(f;files)
		{
			src = cast(char[]) std.file.read(f);
			srcUTF8 = ydb.file.fromMBS(src, codePage);//codePage =65001, means no convert need
			srcUTF8 = std.regexp.sub(srcUTF8, subPattern,replaceTo, subAttributes);
			srcUTF8 = ydb.file.toMBS(srcUTF8, codePage);
			if (src != srcUTF8)
			{
				std.file.write(f,srcUTF8);
				debug printf("treated %.*s \n", f);
				result = true;
			}
		}
	}
	catch(Exception e)
	{
		printf("replaceInFiles catch %.*s\n",e.msg);
		return result;
	}
	return result;
}
//=replaceInFiles


// p = printf
bool pfindInFiles(char[] pathName, char[] pathPattern, char[] pathExclude, int codePage, char[] subPattern, char[] subAttributes = "i")
{
	int[char[]] result;
	try
	{
		result = findInFiles(pathName,pathPattern,pathExclude,codePage, subPattern, subAttributes);
		if (!result) return false;
		foreach(f,i;result)
		{
			printf("%.*s at %d \n",f,i);
		}
	}
	catch(Exception e)
	{
		printf("findInFiles catch %.*s\n",e.msg);
		return false;
	}
	return true;
}
//=pfindInFiles






+/

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
