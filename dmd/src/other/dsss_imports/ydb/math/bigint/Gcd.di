module ydb.math.bigint.Gcd;
private import ydb.math.bigint.Bigint;

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

/*  ------------------------------------------------------------------------------------
	Returns the lowest common multiple of a and b
*/
Bigint lcm(Bigint a, Bigint b)
{
	return (a * b) / gcd(a,b);
}

/*  ------------------------------------------------------------------------------------
	Returns the greatest common divisor of a and b
*/
Bigint gcd(Bigint a, Bigint b)
in
{
	assert(a.positive);
	assert(b.positive);
}
out(d)
{
	Bigint x;
	Bigint y;
	assert(d == gcd(a, b, x, y));
}
body
{
	uint i = ge2(a);
	uint j = ge2(b);
	if (i > j) i = j;
	Bigint u = a >> i;
	Bigint v = b >> i;
	while (!u.equalsZero())
	{
		u = u >> ge2(u);
		v = v >> ge2(v);
		if (u >= v)	u = u - v;
		else		v = v - u;
	}
	return v << i;
}

/*  ------------------------------------------------------------------------------------
	Returns the greatest common divisor, d, of a and b
	and also integers x and y such that a*x + b*y == d

	Note. As currently implemented, this is MUCH slower than gcd()
	because of the expensive call to divMod.
*/

Bigint gcd(Bigint a, Bigint b, out Bigint x, out Bigint y)
in
{
	assert(a > 0);
	assert(b > 0);
}
out(d)
{
	assert(a*x + b*y == d);
}
body
{
	if (a > b) return gcd(b, a, y, x);
	Bigint u = a;
	Bigint v = b;
	Bigint x1 = Bigint.ONE;
	Bigint y1 = Bigint.ZERO;
	Bigint x2 = Bigint.ZERO;
	Bigint y2 = Bigint.ONE;
	while (!u.equalsZero)
	{
		Bigint r;
		Bigint q = divMod(v, u, r);
		x = x2 - q * x1;
		y = y2 - q * y1;
		v = u;
		u = r;
		x2 = x1;
		x1 = x;
		y2 = y1;
		y1 = y;
	}
	x = x2;
	y = y2;
	return v;
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
