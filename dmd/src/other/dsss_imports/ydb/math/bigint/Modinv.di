
module ydb.math.bigint.Modinv;

private import ydb.math.bigint.Bigint;
private import ydb.math.bigint.Gcd;
private import ydb.math.bigint.IntException;

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
	Returns z such that ((a*z)%p == 1
*/
Bigint modInv(Bigint a, Bigint b)
in
{
	assert(a > 0);
	assert(b > 0);
}
out(z)
{
	assert((a*z)%b == 1);
}
body
{
	Bigint x, y;
	Bigint d = gcd(a, b, x, y);
	if (d != 1) throw new IntException("modInv(a,b) not defined for a, b such that gcd(a,b) != 1");
	if (x.negative) x = x + b;
	return x;
}

/*  ------------------------------------------------------------------------------------
	Returns z such that ((a*z)%p == 1 (given p is prime)

	WARNING - If you call this function with p not prime then you have a BUG! Do not do this.
	The in contract cannot test for this, because primality testing is a higher-level function and could lead to an infinite loop
*/
Bigint modInvPrime(Bigint a, Bigint p)
in
{
	assert(a > 0);
	assert(a < p);
	assert((p & 1u) == 1u); // NOTE: The REAL in condition is that p must be PRIME, not p must be odd.
							// Unfortunately we can't test that here without creating a circular dependency.
}
out(z)
{
	assert((a*z)%p == 1);
}
body
{
	Bigint u = a;
	Bigint v = p;
	Bigint x1 = Bigint.ONE;
	Bigint x2 = Bigint.ZERO;
	while (u != 1u && v != 1u)
	{
		modInvInternal(u, x1, p);
		modInvInternal(v, x2, p);
		if (u >= v)
		{
			u = u - v;
			x1 = x1 - x2;
		}
		else
		{
			v = v - u;
			x2 = x2 - x1;
		}
	}
	if (u == 1u)
	{
		return (x1 % p);
	}
	else
	{
		return (x2 % p);
	}
}

private
{
	void modInvInternal(inout Bigint u, inout Bigint x, in Bigint p)
	{
		while ((u & 1u) == 0)
		{
			u = u >> 1;
			if ((x & 1u) == 0)
			{
				x = x >> 1;
			}
			else
			{
				x = (x + p) >> 1;
			}
		}
	}
}


version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
