
module ydb.math.bigint.Multiply;
private import ydb.math.bigint.Lowlevel;

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
version(DisableKaratsuba)
{
}
else
{
	const int KARATSUBA_THRESHOLD = 10;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = x * y
*/

void bigintMul(uint* d, size_t D, uint* x, size_t X, uint* y, size_t Y)
in
{
	assert(D >= X + Y);
}
body
{
	// Zero the destination
	bigintLLZero(d, D);

	// Do the multiply
	bigintMulInternal(d, x, X, y, Y);
}

private
{
	void bigintMulInternal(uint* d, uint* x, size_t X, uint* y, size_t Y)
	{
		// Get things as simple as possible
		X = bigintLLMinimize(x, X);
		Y = bigintLLMinimize(y, Y);

		// Get the biggest of the two parameters into x
		if (X == Y)
		{
			version(DisableSquare)
			{
				// if squaring algorithm is disabled, do nothing
			}
			else
			{
				if (bigintLLEquals(x, y, X))
				{
					bigintSquareInternal(d, x, X);
					return;
				}
			}
		}
		else if (X < Y)
		{
			uint* t = x;
			x = y;
			y = t;
			uint tLen = X;
			X = Y;
			Y = tLen;
		}

		// Decide which algorithm to use...
		version(DisableKaratsuba)
		{
			bigintMulClassic(d, x, X, y, Y);
		}
		else
		{
			if (X+Y >= KARATSUBA_THRESHOLD)
			{
				bigintMulKaratsuba(d, x, X, y, Y);
			}
			else
			{
				bigintMulClassic(d, x, X, y, Y);
			}
		}

	}

	// The classic multiply algorithm
	void bigintMulClassic(uint* d, uint* x, size_t X, uint* y, size_t Y)
	{
		uint[] t;
		t.length = Y + 1;
		for (int i=0; i<X; ++i)
		{
			uint k = *x++;
			if (k != 0)
			{
				t[Y] = bigintLLMul(t.ptr, y, k, Y);
				bigintLLAdd(d, d, t.ptr, Y+1);
			}
			++d;
		}
		t[] = 0;
	}

	version(DisableKaratsuba)
	{
		// Don't need to compile the algorithm if we're not going to use it
	}
	else
	{
		// The Karatsuba multiply algorithm
		void bigintMulKaratsuba(uint* d, uint* x, size_t X, uint* y, size_t Y)
		out
		{
			uint[] check;
			check.length = X+Y;
			bigintMulClassic(check.ptr, x, X, y, Y);
			assert(bigintLLEquals(d, check.ptr, X+Y));
			check[] = 0;
		}
		body
		{
			// Find the split point
			uint L = X >>> 1;
			if (L > Y) L = Y;

			// Precalculate some numbers
			uint T0 = L + L;
			uint T1 = X + Y - L - L;
			uint TX = X - L > L ? X - L + 1 : L + 1;
			uint TY = Y - L > L ? Y - L + 1 : L + 1;
			uint TXY = TX + TY;
			uint X0 = L;
			uint Y0 = L;
			uint X1 = X - X0;
			uint Y1 = Y - Y0;

			// Make a scratch-buffer and make some pointers into it
			uint[] t;
			t.length = T0 + T1 + TX + TY + TXY;
			uint* t0 = t.ptr;
			uint* t1 = t0 + T0;
			uint* tx = t1 + T1;
			uint* ty = tx + TX;
			uint* txy = ty + TY;

			// Even more pointers
			uint* x0 = x;
			uint* x1 = x + L;
			uint* y0 = y;
			uint* y1 = y + L;

			// Do the low part
			bigintMulInternal(t0, x0, X0, y0, Y0);

			// Do the high part
			bigintMulInternal(t1, x1, X1, y0, Y1);

			// Calculate the temporary results
			tx[X1] = bigintLLAdd(tx, x1, X1, x0, X0);
			TX = bigintLLMinimize(tx, TX);
			if (Y0 > Y1)
			{
				ty[Y0] = bigintLLAdd(ty, y0, Y0, y1, Y1);
			}
			else
			{
				ty[Y1] = bigintLLAdd(ty, y1, Y1, y0, Y0);
			}
			TY = bigintLLMinimize(ty, TY);
			bigintMulInternal(txy, tx, TX, ty, TY);
			TXY = bigintLLMinimize(txy, TXY);

			// Add all the bits together
			d[0..L+L] = t0[0..L+L];
			d[L+L..X+Y] = t1[0..X+Y-L-L];

			bigintLLAdd(d+L, d+L, X+Y-L, txy, TXY);
			bigintLLSub(d+L, d+L, X+Y-L, t0, T0);
			bigintLLSub(d+L, d+L, X+Y-L, t1, T1);

			// All done. That was easy!
			t[] = 0;
		}
	}
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = x * x
*/

void bigintSquare(uint* d, size_t D, uint* x, size_t X)
in
{
	assert(D >= X + X);
}
body
{
	version(DisableSquare)
	{
		// If we can't use the square algorithm, do it the hard way
		bigintMul(d, D, x, X, x, X);
	}
	else
	{
		// Zero the destination
		bigintLLZero(d, D);

		// Do the multiply
		bigintSquareInternal(d, x, X);
	}
}

version(DisableSquare)
{
	// Don't compile the algorithm if we don't need it
}
else
{
	private
	{
		void bigintSquareInternal(uint* d, uint* x, size_t X)
		{
			// Get things as simple as possible
			X = bigintLLMinimize(x, X);

			// Decide which algorithm to use...
			version(DisableKaratsuba)
			{
				bigintSquareClassic(d, x, X);
			}
			else
			{
				if (X+X >= KARATSUBA_THRESHOLD)
				{
					bigintSquareKaratsuba(d, x, X);
				}
				else
				{
					bigintSquareClassic(d, x, X);
				}
			}
		}

		void bigintSquareClassic(uint* d, uint* x, size_t X)
		out
		{
			uint[] check;
			check.length = X+X;
			bigintMulClassic(check.ptr, x, X, x, X);
			assert(bigintLLEquals(d, check.ptr, X+X));
			check[] = 0;
		}
		body
		{
			uint[] t;
			t.length = X + X;
			for (int i=1; i<X; ++i)
			{
				t[i] = bigintLLMul(t.ptr, x, x[i], i);
				bigintLLAdd(d+i, d+i, t.ptr, X+1);
			}
			bigintLLAdd(d,d,d,X+X);
			for (int i=0; i<X; ++i)
			{
				uint dHi, dLo;
				version(X86)
				{
					uint xi = x[i];
					asm
					{
						mov EAX,xi;
						mov EBX,EAX;
						mul EBX;
						mov dHi,EDX;
						mov dLo,EAX;
					}
				}
				else
				{
					ulong xi = x[i];
					ulong di = xi * xi;
					dHi = cast(uint) (di >> 32);
					dLo = cast(uint) di;
				}
				t[i+i] = dLo;
				t[i+i+1] = dHi;
			}
			bigintLLAdd(d,d,t.ptr,X+X);
			t[] = 0;
		}

		void bigintSquareKaratsuba(uint* d, uint* x, size_t X)
		out
		{
			uint[] check;
			check.length = X+X;
			bigintSquareClassic(check.ptr, x, X);
			assert(bigintLLEquals(d, check.ptr, X+X));
			check[] = 0;
		}
		body
		{
			// Find the split point
			uint L = X >>> 1;

			// Precalculate some numbers
			uint T0 = L + L;
			uint T1 = X + X - L - L;
			uint TX = X - L + 1;
			uint TXX = TX + TX;
			uint X0 = L;
			uint X1 = X - X0;

			// Make a scratch-buffer and make some pointers into it
			uint[] t;
			t.length = T0 + T1 + TX + TXX;
			uint* t0 = t.ptr;
			uint* t1 = t0 + T0;
			uint* tx = t1 + T1;
			uint* txx = tx + TX;

			// Even more pointers
			uint* x0 = x;
			uint* x1 = x + L;

			// Do the low part
			bigintSquareInternal(t0, x0, X0);

			// Do the high part
			bigintSquareInternal(t1, x1, X1);

			// Calculate the temporary results
			tx[X1] = bigintLLAdd(tx, x1, X1, x0, X0);
			TX = bigintLLMinimize(tx, TX);
			bigintSquareInternal(txx, tx, TX);
			TXX = bigintLLMinimize(txx, TXX);

			// Add all the bits together
			d[0..L+L] = t0[0..L+L];
			d[L+L..X+X] = t1[0..X+X-L-L];

			bigintLLAdd(d+L, d+L, X+X-L, txx, TXX);
			bigintLLSub(d+L, d+L, X+X-L, t0, T0);
			bigintLLSub(d+L, d+L, X+X-L, t1, T1);

			// All done. That was easy!
			t[] = 0;
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
