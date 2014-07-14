/*******************************************************************************

	copyright:      Copyright (c) 2008 Matthias Walter. All rights reserved

    authors:        Matthias Walter

*******************************************************************************/

module ydb.meta.Mixin;

/**
 * Escape any quotes and backslashes inside the given string,
 * prefixing them with the given escape sequence. Use `\` to escape
 * once, `\\\` to escape twice.
 * Params:
 * 		instr = given string 
 * 		escape = escape character
 * Returns:
 * 		enquoted string
 * Authors:
 * 		Don Clugston
 */

public char[] enquote (char[] instr, char[] escape = `\`)
{
	for (int i = 0; i < instr.length; ++i)
	{
		if (instr[i] == '"' || instr[i] == '\\')
		{
			char[] str = instr[0..i] ~ escape;
			int m = i;
			foreach (int k, char c; instr[i+1..$])
			{
				if (c == '"' || c == '\\')
				{
					str ~= instr[m..i+1+k] ~ escape;
					m = i+k+1;
				}
			}
			return str ~ instr[m..$];
		}
	}
	return instr;
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
