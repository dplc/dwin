
// Written in the D programming language.

/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu  g m a i l at com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: 2007

        author:         yidabu ( D programming language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module ydb.Regex;

public import dwin.text.Regex;
    

/*
* pathName =搜索目录
* pathPattern = 匹配路径的正则表达式
* pathExclude = 排除路径的正则表达式
* codePage = 源文件的代码页, 因为D中的正则比较只能用UTF-8
* subPattern = 匹配子串的正则表达式
* subAttributes = 搜索子串的特征
*/

/*
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
			i = find(srcUTF8, subPattern, subAttributes);
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
*/

/*
char[][] replaceInFiles(char[] pathName, char[] pathPattern, char[] pathExclude, char[] subPattern, char[] replaceTo, char[] subAttributes = "i", int codePage = 0)
{
	char[][] result;
	try
	{
		char[][] files = ydb.file.listdir(pathName,pathPattern,pathExclude);
		if (!files) 
			return null;
		
		char[] srcUTF8;		
		foreach(f;files)
		{
			srcUTF8 = ydb.file.fromMBS( cast(char[]) std.file.read(f), codePage );
			if (!search(srcUTF8, subPattern, subAttributes)) 
			{
				debug printf("ydb.regexp.replaceInFiles not need %.*s \n", f);
				continue;
			}
			srcUTF8 = sub(srcUTF8, subPattern, replaceTo, subAttributes);
			std.file.write(f, ydb.file.toMBS(srcUTF8) );
			result ~= f;
			
		}
	}
	catch(Exception e)
	{
		printf("findInFiles catch %.*s\n",e.msg);
	}
	return result;
}
//=replaceInFiles
*/

/*
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
*/

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
