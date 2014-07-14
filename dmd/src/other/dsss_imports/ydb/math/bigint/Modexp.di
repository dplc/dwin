module ydb.math.bigint.Modexp;
private import ydb.math.bigint.Bigint;
private import ydb.math.bigint.Modinv;

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
	d = (x * y) % m
*/

Bigint modMul(Bigint x, Bigint y, Bigint m)
{
	return (x * y) % m;
}

/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	d = x ^ y
*/

private
{
	class ClassicMul : FMul
	{
		Bigint opCall(Bigint x, Bigint y)
		{
			return x * y;
		}
	}
}

Bigint pow(Bigint x, Bigint y)
{
	ClassicMul f = new ClassicMul;
	return x.powGen(y, Bigint.ONE, f);
}

/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	d = (x ^ y) % m
*/

private
{
	class ClassicModMul : FMul
	{
		this(Bigint m)
		{
			p = m;
		}

		Bigint opCall(Bigint x, Bigint y)
		{
			return (x * y) % p;
		}

		Bigint p;
	}

	class Barrett : FMul
	{
		this(Bigint m)
		{
			p = m;
			k = p.end;
			mu = shlWhole(1,k+k) / p;
		}

		Bigint opCall(Bigint x, Bigint y)
		{
			Bigint z = x * y;
			Bigint q = shrWhole(z, k-1);
			q = q * mu;
			q = shrWhole(q, k+1);
			Bigint r = lowWhole(z, k+1);
			r = r - lowWhole(q*p, k+1);
			if (r < 0)
			{
				r = r + shlWhole(1,k+1);
			}
			while (r >= p)
			{
				r = r - p;
			}
			return r;
		}

		uint k;
		Bigint mu;
		Bigint p;
	}

	class Montgomery : FMul
	{
		this(Bigint p)
		in
		{
			assert((p & 1u) == 1u);
		}
		body
		{
			rEnd_ = p.end;
			p_ = p;
			R_ = shlWhole(1,rEnd_);
			p1_ = modInv(p, R_);
			if (p1_ != 0) p1_ = R_ - p1_;
		}

		Bigint opCall(Bigint x)
		{
			Bigint c = shrWhole(x + lowWhole(x * p1, rEnd) * p, rEnd);
			if (c >= p) c = c - p;
			return c;
		}

		Bigint opCall(Bigint x, Bigint y)
		{
			return opCall(x * y);
		}

		uint rEnd() { return rEnd_; }
		Bigint R() { return R_; }
		Bigint p() { return p_; }
		Bigint p1() { return p1_; }

		private
		{
			uint rEnd_;
			Bigint R_;
			Bigint p_;
			Bigint p1_;
		}
	}
}

Bigint modPow(Bigint x, Bigint e, Bigint p)
in
{
	assert(e > 0);
	assert(p > 0);
}
body
{
	if ((x.sign!=0) || (x > p))
	{
		x = x % p; // Get x in range
	}

	version(DisableMontgomery)
	{
		// If the Montgomery algorithm is disabled, don't do it.
	}
	else
	{
		if (((p & 1u) == 1u))
		{
			Montgomery f = new Montgomery(p);
			Bigint x1 = shlWhole(x, f.rEnd) % p;
			Bigint A = f.R % p;
			A = x1.powGen(e, A, f);
			return f(A);
		}
	}

	version(DisableBarrett)
	{
		ClassicModMul f = new ClassicModMul(p);
		return x.powGen(e, Bigint.ONE, f);
	}
	else
	{
		Barrett f = new Barrett(p);
		return x.powGen(e, Bigint.ONE, f);
	}

}


version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
