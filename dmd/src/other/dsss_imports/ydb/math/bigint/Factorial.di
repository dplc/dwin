
module ydb.math.bigint.Factorial;

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
	Returns z = x!
*/

Bigint factorial(Bigint n)
{
	if (n.isInt()) return factorial(n.toInt());
	if (n < 0) throw new IntException("Factorial(n) not defined for n < 0");
	throw new IntException("Overflow in Factorial(n)");
}

Bigint factorial(int n)
{
	if (n < 0) throw new IntException("Factorial(n) not defined for n < 0");
	if (n < 2) return Bigint.ONE;

	// Stage one. Here we use only uints, for speed.
	Bigint[] pool;
	uint a = 1;
	uint i;
	for (i=2; i<=n; ++i)
	{
		if ((bsr(i) + bsr(a)) <= 30)
		{
			a *= i;
		}
		else
		{
			pool.length = pool.length + 1;
			pool[pool.length-1] = new Bigint(a);
			a = i;
		}
	}
	pool.length = pool.length + 1;
	pool[pool.length-1] = new Bigint(a);

	// Stage two. Now multiply all the Ints together, trying to keep all the sizes balanced as we go.
	while (pool.length > 1)
	{
		for (i=0; i<(pool.length>>1); ++i)
		{
			pool[i] = pool[i+i] * pool[i+i+1];
		}
		if (pool.length == i+i)
		{
			pool.length = i;
		}
		else
		{
			pool[i] = pool[i+i];
			pool.length = i+1;
		}
	}

	// All done. We have our result
	return pool[0];
}

version(Paranoid) unittest
{
	assert(factorial(50) == new Bigint("30414093201713378043612608166064768844377641568960512000000000000"));
}





version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
