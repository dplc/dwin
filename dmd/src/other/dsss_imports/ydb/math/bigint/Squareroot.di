
module ydb.math.bigint.Squareroot;

private import ydb.math.bigint.Bigint;
private import ydb.math.bigint.IntException;
private import std.intrinsic;

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

/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Returns the integer square root of x, ignoring the remainder
*/
Bigint sqrt(Bigint x)
{
	Bigint r;
	return sqrt(x, r);
}

/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Returns the integer square root of x, and the remainder
*/
Bigint sqrt(Bigint x, out Bigint r)
out(z)
{
	assert(z*z + r == x);
}
body
{
	if (x < 0) throw new IntException("sqrt(x) not defined for x < 0");
	if (x < 2) { r = Bigint.ZERO; return x; }

	Bigint q = Bigint.ZERO;
	r = Bigint.ZERO;

	uint msd = x[x.end-1];
	uint b = bsr(msd) & ~1u;
	msd <<= 30 - b;

	for (int j=b>>>1; j>=0; --j)
	{
		msd = sqrtInternal(q, r, msd);
	}

	for (int i=x.end-2; i>=0; --i)
	{
		msd = x[i];
		for (int j=15; j>=0; --j)
		{
			msd = sqrtInternal(q, r, msd);
		}
	}

	return q;
}

private
{
	uint sqrtInternal(inout Bigint q, inout Bigint r, size_t msd)
	{
		q = q + q;
		r = (r << 2) | (msd >> 30);
		Bigint divisor = new Bigint(q);
		divisor = (divisor + divisor) | 1u;
		if (divisor <= r)
		{
			r = r - divisor;
			q = q + 1;
		}
		return msd << 2;
	}
}

bool isSquare(Bigint x)
{
	// First test is modulo 0x1000
	if (x.negative) return false;
	if (x < 2) return true;
	uint n = x[0] & 0xFFFF;
	bool b = squareTableLookup(n);
	if (!b) return false;

	// Next we do a pseudosqaure test
	/**** NOT YET WRITTEN ****/

	// Finally, we give up and do a square root
	Bigint r;
	sqrt(x, r);
	return r.equalsZero;
}

private
{
	ubyte[64] SQUARE_TABLE =
	[
		0x05, 0x01, 0x04, 0x00, 0x05, 0x00, 0x04, 0x00,
		0x04, 0x01, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00,
		0x05, 0x01, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00,
		0x04, 0x01, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00,
		0x04, 0x01, 0x04, 0x00, 0x05, 0x00, 0x04, 0x00,
		0x04, 0x01, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00,
		0x04, 0x01, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00,
		0x04, 0x01, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00
	];

	bool squareTableLookup(uint n)
	in
	{
		assert(n < 0x10000);
	}
	body
	{
		uint bitnum = n & 7;
		uint col = (n >> 3) & 0x0F;
		uint row = n >> 7;
		uint lookup;
		switch (col)
		{
			case 1:
			case 3:
			case 5:
			case 6:
			case 7:
			case 9:
			case 10:
			case 11:
			case 13:
			case 14:
			case 15:
				lookup = 0x02;
				break;

			case 4:
			case 12:
				lookup = 0x12;
				break;

			case 2:
				lookup = 0x03;
				break;

			case 8:
				lookup = ((row & 3) == 0) ? 0x13 : 0x12;
				break;

			case 0:
				lookup = squareTableLookup2(col);
				break;
		}
		return (((1 << bitnum) & lookup) != 0);
	}

	ubyte squareTableLookup2(uint n)
	{
		uint bitnum = n & 7;
		uint col = n >> 3;
		ubyte lookup = SQUARE_TABLE[col];
		return (((1 << bitnum) & lookup) != 0) ? 0x13 : 0x12;
	}
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
