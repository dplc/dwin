
module ydb.math.bigint.Radix;

private import ydb.math.bigint.IntException;
private import ydb.math.bigint.Lowlevel;

private import tango.text.convert.Utf;

/*

Copyright (c) 2004, Arcane Jill

All rights reserved. Intellectual Property Me Arse!

Redistribution and use in source and binary forms, with or without modification, are permitted
provided that the following conditions are met:

   * Redistributions of source code must retain the above copyright notice, the phrase
     "Intellectual Property Me Arse!", this list of conditions, and the following disclaimer.
   * Redistributions in binary form must reproduce the above copyright notice, the phrase
     "Intellectual Property Me Arse!", this list of conditions and the following disclaimer
     in the documentation and/or other materials provided with the distribution.
   * The name Arcane Jill may not be used to endorse or promote products derived from this
     software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS
OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER,
OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED, AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
OF SUCH DAMAGE.

*/

/// port to Tango by yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

private
{
	struct RadixData
	{
		// These constants are pre-initialized for radix 10
		uint a = 1000000000;	// = biggest power of 10 which will fit in a uint
		uint n = 9;				// = log base 10 of the above
		ulong m = 0x19999999;	// = (1<<32) / 10

		// This function sets things up for any other arbitrary base
		void initialize(uint radix)
		{
			m = 0x100000000;
			ulong a1 = 1;
			uint n1 = 0;
			while (a1 < m)
			{
				a = cast(uint) a1;
				n = n1;
				a1 *= radix;
				++n1;
			}
			m /= radix;
		}
	}
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Construct a sting from a big integer array using default parameters
*/
char[] bigintToString(uint[] x, size_t radix, size_t groupWidth)
in
{
	assert(radix > 1 && radix <= 16);
}
body
{
	dchar[] hex = "0123456789ABCDEF";
	return toString(bigintToString(x, radix, hex, groupWidth, '_'));
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Construct a sting from a big integer array
*/
dchar[] bigintToString(uint[] x, size_t radix, dchar[] digits, size_t groupWidth, dchar groupChar)
in
{
	assert(radix > 1);
	assert(digits.length >= radix);
}
body
{
	uint[] t = bigintToRadix(x, radix);
	dchar[] d;
	d.length = t.length;
	for (int i=0; i<t.length; ++i)
	{
		d[i] = digits[t[i]];
	}
	t[] = 0;
	if (groupWidth == 0)
	{
		return d.reverse;
	}
	else
	{
		dchar[] g;
		g.length = 2 * d.length;
		uint gx = 0;
		uint ix = 0;
		for (int i=0; i<d.length; ++i)
		{
			if (ix == groupWidth)
			{
				g[gx++] = groupChar;
				ix = 0;
			}
			g[gx++] = d[i];
			++ix;
		}
		g.length = gx;
		d[] = 0;
		return g.reverse;
	}
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Construct a big integer array from a string using default parameters
*/
uint[] bigintFromString(char[] s, size_t radix)
in
{
	assert((radix == uint.max) || (radix > 1 && radix <= 16));
}
body
{
	if (s.length == 0)
	{
		uint[] r;
		r.length = 1;
		return r;
	}
	if (radix == uint.max)
	{
		if (s.length > 2)
		{
			switch(s[0..2])
			{
				case "0x":
				case "0X": s = s[2..s.length]; radix = 16; break;
				case "0d":
				case "0D": s = s[2..s.length]; radix = 10; break;
				case "0o":
				case "0O": s = s[2..s.length]; radix =  8; break;
				case "0b":
				case "0B": s = s[2..s.length]; radix =  2; break;
				default:
				{
					if (s[0] == '0') throw new IntException("Leading zero not permitted if radix unspecified");
					radix = 10;
				}
			}
		}
		else (radix = 10);
	}
	dchar[] hex = "0123456789ABCDEF";
	return bigintFromString(toString32(s), radix, hex, '_');
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Construct a big integer array from a string
*/
uint[] bigintFromString(dchar[] s, size_t radix, dchar[] digits, dchar groupChar)
in
{
	assert(radix > 1);
	assert(digits.length >= radix);
}
body
{
	// Reverse the string and translate it into an array
	uint[] x;
	x.length = s.length;
	uint xi = 0;
	for (int si = s.length-1; si>=0; --si)
	{
		dchar c = s[si];
		if (c == groupChar) continue;
		x[xi++] = translateDigit(c, digits);
	}

	// Now convert it
	x.length = xi;
	uint[] r = bigintFromRadix(x, radix);
	x[] = 0;
	return r;
}

private
{
	uint translateDigit(dchar c, dchar[] digits)
	{
		for (int i=0; i<digits.length; ++i)
		{
			if (digits[i] == c) return i;
		}
		throw new IntException("Invalid digit encountered during radix conversion");
	}
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Construct an array of base radix digits from a big integer array
*/
uint[] bigintToRadix(uint[] x, size_t radix)
in
{
	assert(radix > 1);
}
body
{
	uint[] r;
	x.length = bigintLLMinimize(x.ptr, x.length);
	if (x.length == 0)
	{
		r.length = 1;
	}
	else
	{
		int shiftCount = log2Exact(radix);
		if (shiftCount >= 0)
		{
			if (log2Exact(shiftCount) >= 0)
			{
				r = bigintToRadixFastShift(x, shiftCount);
			}
			else
			{
				r = bigintToRadixSlowShift(x, shiftCount);
			}
		}
		else
		{
			r = bigintToRadixDivide(x, radix);
		}
		r.length = bigintLLMinimize(r.ptr, r.length);
	}
	return r;
}

private
{
	uint[] bigintToRadixFastShift(uint[] x, size_t shiftCount)
	{
		uint mask = (1 << shiftCount) - 1;
		uint k = 32 / shiftCount;
		uint[] r;
		r.length = k * x.length;
		uint rx = 0;
		for (uint i=0; i<x.length; ++i)
		{
			uint n = x[i];
			for (uint j=0; j<k; ++j)
			{
				r[rx++] = n & mask;
				n >>= shiftCount;
			}
		}
		return r;
	}

	uint[] bigintToRadixSlowShift(uint[] x_, size_t shiftCount)
	{
		uint[] x;
		auto len = x_.length;
		x.length = len;
		x[] = x_[];

		uint mask = (1 << shiftCount) - 1;
		uint k = 32 / shiftCount + 1;
		uint[] r;
		r.length = k * x.length;
		uint rx = 0;
		while (!bigintLLEqualsZero(x.ptr, len))
		{
			r[rx++] = x[0] & mask;
			bigintLLShr(x.ptr, x.ptr, shiftCount, len);
			if (x[len-1] == 0) --len;
		}
		return r;
	}

	uint[] bigintToRadixDivide(uint[] x_, size_t radix)
	{
		// Make a copy of x to avoid corrupting the original
		uint[] x;
		auto len = x_.length;
		x.length = len;
		x[] = x_[];

		// Figure out how many radix digits we can fit in a uint
		RadixData rd;
		if (radix != 10)
		{
			rd.initialize(radix);
		}

		// Now divide the number down into groups of digits
		uint[] g;
		g.length = len + len;
		uint gx = 0;
		while (!bigintLLEqualsZero(x.ptr, len))
		{
			g[gx++] = bigintLLDiv(x.ptr, x.ptr, rd.a, len);
			if (x[len-1] == 0) --len;
		}

		// Finally split the groups of digits into single digits
		uint[] r;
		r.length = (rd.n + 1) * gx;
		uint rx = 0;
		for (int i=0; i<gx; ++i)
		{
			ulong gn = g[i];
			for (int j=0; j<rd.n; ++j)
			{
				ulong gq = gn * rd.m;
				gq >>= 32;
				ulong gr = gn - radix * gq;
				while (gr >= radix)
				{
					gr -= radix;
					++gq;
				}
				r[rx++] = gr;
				gn = gq;
			}
		}
		g[] = 0;
		return r;
	}
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Construct a big integer array from an array of base radix digits
*/
uint[] bigintFromRadix(uint[] x, size_t radix)
in
{
	assert(radix > 1);
}
body
{
	uint[] r;
	x.length = bigintLLMinimize(x.ptr, x.length);
	if (x.length == 0)
	{
		r.length = 1;
	}
	else
	{
		int shiftCount = log2Exact(radix);
		if (shiftCount >= 0)
		{
			if (log2Exact(shiftCount) >= 0)
			{
				r = bigintFromRadixFastShift(x, shiftCount);
			}
			else
			{
				r = bigintFromRadixSlowShift(x, shiftCount);
			}
		}
		else
		{
			r = bigintFromRadixMultiply(x, radix);
		}
		r.length = bigintLLMinimize(r.ptr, r.length);
	}
	return r;
}

private
{
	uint[] bigintFromRadixFastShift(uint[] x, size_t shiftCount)
	{
		debug size_t mask = ~((1 << shiftCount) - 1);
		uint k = 32 / shiftCount;
		uint[] r;
		r.length = x.length / k + 1;
		uint rx = 0;
		uint xx = 0;
		uint n = 0;
		for (uint i=0; i<x.length; ++i)
		{
			debug assert((x[i] & mask) == 0);
			n >>= shiftCount;
			n |= x[i] << (32-shiftCount);
			++xx;
			if (xx == k)
			{
				r[rx++] = n;
				n = xx = 0;
			}
		}
		if (xx != 0)
		{
			r[rx++] = n >> (32 - xx*shiftCount);
		}
		r.length = rx;
		return r;
	}

	uint[] bigintFromRadixSlowShift(uint[] x, size_t shiftCount)
	{
		uint[] t = bigintFromRadixFastShift(x, shiftCount);
		uint k = 32 % shiftCount;
		for (uint i=t.length-1; i!=0; --i)
		{
			uint carry = bigintLLShr(&t[i], &t[i], k, t.length-i);
			t[i-1] |=  carry;
		}
		return t;
	}

	uint[] bigintFromRadixMultiply(uint[] x, size_t radix)
	{
		// Figure out how many radix digits we can fit in a uint
		RadixData rd;
		if (radix != 10)
		{
			rd.initialize(radix);
		}

		// Make room for the answer
		uint[] r;
		r.length = x.length / rd.n + 1;

		// Now calculate the answer
		uint p = x.length % rd.n;
		uint n = 0;
		auto i = x.length;
		int j;
		for (j=p-1; j>=0; --j)
		{
			n *= radix;
			n += x[--i];
			assert(x[i] < radix);
		}
		r[0] = n;
		while (i>0)
		{
			n = 0;
			for (j=rd.n-1; j>=0; --j)
			{
				n *= radix;
				n += x[--i];
				assert(x[i] < radix);
			}
			bigintLLMul(r.ptr, r.ptr, rd.a, r.length);
			bigintLLInc(r.ptr, r.ptr, n, r.length);
		}
		return r;
	}

}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Get the value n for which (1<<n) == x, or -1 if this is not possible
*/
int log2Exact(uint x)
{
	switch (x)
	{
		case 0x00000001: return  0;
		case 0x00000002: return  1;
		case 0x00000004: return  2;
		case 0x00000008: return  3;
		case 0x00000010: return  4;
		case 0x00000020: return  5;
		case 0x00000040: return  6;
		case 0x00000080: return  7;
		case 0x00000100: return  8;
		case 0x00000200: return  9;
		case 0x00000400: return 10;
		case 0x00000800: return 11;
		case 0x00001000: return 12;
		case 0x00002000: return 13;
		case 0x00004000: return 14;
		case 0x00008000: return 15;
		case 0x00010000: return 16;
		case 0x00020000: return 17;
		case 0x00040000: return 18;
		case 0x00080000: return 19;
		case 0x00100000: return 20;
		case 0x00200000: return 21;
		case 0x00400000: return 22;
		case 0x00800000: return 23;
		case 0x01000000: return 24;
		case 0x02000000: return 25;
		case 0x04000000: return 26;
		case 0x08000000: return 27;
		case 0x10000000: return 28;
		case 0x20000000: return 29;
		case 0x40000000: return 30;
		case 0x80000000: return 31;
		default:		 return -1;
	}
}


version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
