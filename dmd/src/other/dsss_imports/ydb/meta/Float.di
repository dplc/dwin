/*******************************************************************************

	copyright:      Copyright (c) 2008 Matthias Walter. All rights reserved

    authors:        Matthias Walter

*******************************************************************************/

module ydb.meta.Float;

private import ydb.meta.Integer;
private import ydb.meta.Char;
private import ydb.meta.String;

private import tango.io.Stdout;

/// Converts a given float to a decimal string.

char[] floatToDec (real f)
{
	if (f !<>= 0)
		return "NaN";
	if (f < 0)
		return "-" ~ floatToDec (-f);
	if (f == real.infinity)
		return "infinity";
	if (f == 0.0)
		return "0.0";
	if (f < 0.001 || f >= 10000000)
	{
		int exponent = 0;
		while (f >= 10.0)
		{
			f /= 10.0;
			exponent++;
		}
		while (f < 1.0)
		{
			f *= 10.0;
			exponent--;
		}
		return floatToDec (f) ~ " E" ~ intToDec (exponent);
	}

	long mantissa = cast (long) f;
	f -= mantissa;
	
	char[] buffer = ".";
	while (f != 0 && buffer.length < real.dig)
	{
		f *= 10;
		buffer ~= intToDecDigit(cast (long) f);
		f -= cast (long) f;
	}
	buffer = intToDec (mantissa) ~ chomp (buffer ~ "0", '0');
	return (buffer[$-1] == '.') ? buffer ~ "0" : buffer;
}

/// Converts a given float to a hexadecimal string.

char[] floatToHex (real f)
{
	if (f !<>= 0)
		return "NaN";
	if (f < 0)
		return "-" ~ floatToHex (-f);
	if (f == real.infinity)
		return "infinity";
	if (f == 0.0)
		return "0.0";
	
	if (f < 0.00390625 || f >= 0xffffffff)
	{
		int exponent = 0;
		while (f >= 16.0)
		{
			f /= 16.0;
			exponent++;
		}
		while (f < 1.0)
		{
			f *= 16.0;
			exponent--;
		}
		return floatToHex (f) ~ " E" ~ intToHex (exponent);
	}

	long mantissa = cast (long) f;
	f -= mantissa;
	
	char[] buffer = ".";
	while (f != 0 && buffer.length < (4*real.dig)/5)
	{
		f *= 16;
		buffer ~= intToHexDigit(cast (long) f);
		f -= cast (long) f;
	}
	buffer = intToHex (mantissa) ~ chomp (buffer ~ "0", '0');
	return (buffer[$-1] == '.') ? buffer ~ "0" : buffer;
}

unittest
{
	/+
	static assert (floatToDec (0.0) == "0.0");
	static assert (floatToDec (real.nan) == "NaN");
	static assert (floatToDec (real.infinity) == "infinity");
	static assert (floatToDec (-real.infinity) == "-infinity");
	static assert (floatToDec (3.1456) == "3.1456");
	static assert (floatToDec (-3.1456) == "-3.1456");
	static assert (floatToDec (1200000000000) == "1.2 E12");
	static assert (floatToDec (-0.000000003145) == "-3.145 E-9");

	static assert (floatToHex (0xff) == "FF.0"); +/
}
version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
