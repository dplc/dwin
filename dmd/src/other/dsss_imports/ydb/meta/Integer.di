/*******************************************************************************

	copyright:      Copyright (c) 2008 Matthias Walter. All rights reserved

    authors:        Matthias Walter

*******************************************************************************/

module ydb.meta.Integer;

private import ydb.meta.Char, ydb.meta.String;

/// Converts the given integer to its hexadecimal string.

char[] intToHex (long i)
{
	if (i < 0)
		return "-" ~ intToHex (-i);
	if (i < 16)
		return "" ~ intToHexDigit (i);
	else
		return intToHex (i / 16) ~ intToHexDigit (i % 16); 
}

/// Converts the given integer to its decimal string.

char[] intToDec (long i)
{
	if (i < 0)
		return "-" ~ intToDec (-i);
	if (i < 10)
		return "" ~ intToDecDigit (i);
	else
		return intToDec (i / 10) ~ intToDecDigit (i % 10);
}

alias intToDec itoa;

/// Parses a given string, beginning with a hexadecimal integer and returns it.

long parseHexInt (char[] str, out size_t index, char[] ignore = "_")
{
	if (str.length == 0)
		return 0;

	index = 0;
	int i = 0;
	byte sign = 1;
	if (str[0] == '+')
		i = 1;
	else if (str[0] == '-')
	{
		i = 1;
		sign = -1;
	}

	long result = 0;
	foreach (c; str[i .. $])
	{
		if (isHexDigit (c))
		{
			result *= 16;
			result += hexDigitToInt (c);
			i++;
			index = i;
		}
		else if (ignore.contains (c))
		{
			i++;
		}
		else
			break;
	}
	return sign * result;
}

/// Parses a given string, beginning with a decimal integer and returns it.

long parseDecInt (char[] str, out size_t index, char[] ignore = "_")
{
	if (str.length == 0)
		return 0;
	
	index = 0;
	int i = 0;
	byte sign = 1;
	if (str[0] == '+')
		i = 1;
	else if (str[0] == '-')
	{
		i = 1;
		sign = -1;
	}

	long result = 0;
	int last_ignored = 0;
	foreach (c; str[i .. $])
	{
		if (isDecDigit (c))
		{
			result *= 10;
			result += decDigitToInt (c);
			i++;
			index = i;
		}
		else if (ignore.contains (c))
		{
			i++;
		}
		else
			break;
	}
	return sign * result;
}

/// Converts a given hexadecimal string to an integer value.

long hexToInt (char[] str, char[] ignore = "_")
{
	uint index;
	return parseHexInt (str, index, ignore);
}

/// Converts a given decimal string to an integer value.

long decToInt (char[] str, char[] ignore = "_")
{
	uint index;
	return parseDecInt (str, index, ignore);
}

/// Returns true of the given string is a hexadecimal number.

bool isHexInt (char[] str, char[] ignore = "_")
{
	uint index;
	parseHexInt (str, index, ignore);
	return index == str.length;
}

/// Returns true of the given string is a decimal number.

bool isDecInt (char[] str, char[] ignore = "_")
{
	uint index;
	parseDecInt (str, index, ignore);
	return index == str.length;
}

/// Returns the remaining string after parsing a hexadecimal number.

char[] consumeHexInt (char[] str, char[] ignore = "_")
{
	uint index;
	parseHexInt (str, index, ignore);
	return str[index..$];
}

/// Returns the remaining string after parsing a decimal number.

char[] consumeDecInt (char[] str, char[] ignore = "_")
{
	uint index;
	parseDecInt (str, index, ignore);
	return str[index..$];
}

/// Returns the absolute value of a given integer.

long abs (long v)
{
	if (v >= 0)
		return v;
	else
		return -v;
}

unittest
{
	static assert (intToHex (0xFF) == "FF");
	static assert (intToDec (-255) == "-255");
	static assert (hexToInt ("FF") == 0xFF);
	static assert (decToInt ("-255") == -255);
	static assert (isHexInt ("FF"));
	static assert (!isDecInt ("FF"));
	static assert (isDecInt ("42"));
	static assert (isHexInt ("42"));
	static assert (consumeHexInt ("0123456789abcdefgh") == "gh");
	static assert (consumeDecInt ("0123456789abcdefgh") == "abcdefgh");
	static assert (abs(10) == 10);
	static assert (abs(-10) == 10);
}
version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
