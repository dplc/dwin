
module ydb.math.bigint.Bigint;

private import  ydb.math.bigint.IntException,
                ydb.math.bigint.Multiply,
                ydb.math.bigint.Radix,
                ydb.math.bigint.Lowlevel;

private import tango.stdc.stdlib;
private import tango.math.Math;
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



class Bigint
{
	debug(UnitTest) unittest
	{
		Bigint a,b,c,d;

		//------------------------------------------
		// Test comparisons
		a = new Bigint(0xAAAAAAAA);
		b = new Bigint(0xAAAAAAAA);
		c = new Bigint(0xCCCCCCCC);
		d = new Bigint("0x00000001AAAAAAAA");
		assert(a == b);
		assert(a < c);
		assert(c > a);
		assert(a < d);
		assert(d > a);
		d = new Bigint(-1);
		assert(d < a);

		//------------------------------------------
		// Test add and subtract
		a = b + c;
		d = new Bigint("0x0000000177777776");
		assert(a == d);
		assert(a - b == c);
		c = -d;
		assert(c+d == 0);

		//------------------------------------------
		// Test multiply and divide for small values
		a = new Bigint(0x11111111);
		a = -a;
		b = a * a;
		c = new Bigint("0x0123456787654321");
		assert(b == c);
		b = b / a;
		assert(b == a);
		a = new Bigint(22);
		assert(a / 7 == 3);
		assert(a % 7 == 1);
		assert(a / -7 == -3);
		assert(a % -7 == 1);
		a = -a;
		assert(a / 7 == -3);
		assert(a % 7 == -1);
		assert(a / -7 == 3);
		assert(a % -7 == -1);
		a = -a;
		b = new Bigint(7);
		c = -b;
		assert(divMod(a, b, d, Round.TOWARD_MINUS_INFINITY) == 3);
		assert(d == 1);
		assert(divMod(a, c, d, Round.TOWARD_MINUS_INFINITY) == -4);
		assert(d == -6);
		a = -a;
		assert(divMod(a, b, d, Round.TOWARD_MINUS_INFINITY) == -4);
		assert(d == 6);
		assert(divMod(a, c, d, Round.TOWARD_MINUS_INFINITY) == 3);
		assert(d == -1);

		//------------------------------------------
		// Test multiply and divide for large values
		a = new Bigint("0x0111111111111111");
		b = a * a;
		c = new Bigint("0x000123456789ABCDEFEDCBA987654321");
		assert(b == c);
		b = b / a;
		assert(b == a);

		//------------------------------------------
		// Test binary operations
		a = new Bigint("0x1234567812345678");
		uint n = a & 0xFFFFu;
		assert(n == 0x5678);
		b = a & new Bigint(0xFF00FF);
		assert(b == new Bigint(0x340078));
		c = a | 0xFFFF;
		assert(c == new Bigint("0x123456781234FFFF"));
		d = a ^ 0xFFFFFFFF;
		assert (d == new Bigint("0x12345678EDCBA987"));
		c = d & -1;
		assert(c == d);
		c = ~d;
		assert((c ^ (-1)) == d);

		//------------------------------------------
		// Test shift left and shift right
		a = new Bigint(0x12345678);
		b = a << 40;
		c = new Bigint("0x000000123456780000000000");
		assert(b == c);
		d = c << -40;
		assert(d == a);
		d = c >>> 40;
		assert(d == a);
		c = -c;
		a = -a;
		d = c << -40;
		assert(d == a);
		try
		{
			d = c >>> 40;
		}
		catch (IntException)
		{
			b = ZERO;
		}
		assert(b == 0);
		d = c >>> 0;
		assert(c == d);

		//------------------------------------------
		// Test the array-like functions

		a = new Bigint("0xFEDCBA98_76543210_00000000_00000000_FEDCBA98_76543210");
		assert(a[1] == 0xFEDCBA98);
		assert(a[3000] == 0);
		assert(a[0..2] == a[4..6]);
		assert(a[100..115] == a[200..215]);
		assert(a[0..4] == a[4..8]);

		//------------------------------------------
		// Test formatting

		a = new Bigint(123);
		assert(a.format(10, 0, 0, false, SignMode.NORMAL)           ==   "123");
		assert(a.format(10, 0, 0, false, SignMode.MINUS_SPACE_PLUS) ==  "+123");
		assert(a.format(10, 0, 0, true,  SignMode.NORMAL)           ==   "123");
		assert(a.format(10, 0, 2, false, SignMode.NORMAL)           ==  "1_23");
		assert(a.format(10, 5, 0, false, SignMode.NORMAL)           == "  123");
		assert(a.format(10, 5, 0, false, SignMode.MINUS_SPACE_PLUS) == " +123");
		assert(a.format(10, 5, 0, true,  SignMode.NORMAL)           == "00123");
		assert(a.format(10, 5, 0, true,  SignMode.MINUS_SPACE_PLUS) == "+0123");
		assert(a.format(10, 5, 2, false, SignMode.NORMAL)           == " 1_23");
		a = -a;
		assert(a.format(10, 5, 0, false, SignMode.NORMAL)           == " -123");
		assert(a.format(10, 5, 0, true,  SignMode.NORMAL)           == "-0123");
		assert(a.format(10, 5, 2, false, SignMode.NORMAL)           == "-1_23");

		a = new Bigint("123456");
		//assert(a.toString() == "123456");
		assert(a.toString() == "123456");
		a = new Bigint("0x123456");
		assert(a.toHexString() == "123456");

		a = new Bigint("0");
		assert (a.toString == "0");
		assert (ZERO.toString == "0");
		assert (a == ZERO);
		assert (a == new Bigint(0));
	}

	invariant() //added() by d-programming-language-china.org  20071025
	{
		if (d)
		{
			auto n = d.length;
			assert(n >= 2);					// array must be sufficiently large (2 uints)
			int s = d[n-1];
			assert((s == 0) || (s == -1));	// sign field may not contain rubbish
			if (n>2)
			{
				assert(d[n-2] != s);		// array must be minimal
			}
		}
	}

	public
	{

		// -------- Constants --------

		//enum Round { TOWARD_ZERO, TOWARD_INFINITY, TOWARD_MINUS_INFINITY }
		static enum Round { TOWARD_ZERO, TOWARD_INFINITY, TOWARD_MINUS_INFINITY } //added static by yidabu 20071025

		static
		{
			Bigint ZERO, ONE, TWO, MINUS_ONE;
		}

		static this()
		{
			ZERO = new Bigint(0);
			ONE = new Bigint(1);
			TWO = new Bigint(2);
			MINUS_ONE = new Bigint(-1);
		}

		// -------- Constructors --------

		// Construct from an int
		this(int n)
		{
			d.length = 2;
			d[0] = n;
			d[1] = n < 0 ? -1U : 0;
		}

		static Bigint opCall(int n) { return new Bigint(n); }

		// Construct from a uint
		this(uint n)
		{
			d.length = 2;
			d[0] = n;
		}

		static Bigint opCall(uint n) { return new Bigint(n); }

		// Construct from a long
		this(long n)
		{
			d.length = 3;
			*(cast(ulong*)d) = n;
			d[2] = n < 0 ? -1U : 0;
			minimize(this);
		}

		static Bigint opCall(long n) { return new Bigint(n); }

		// Construct from a ulong
		this(ulong n)
		{
			d.length = 3;
			*(cast(ulong*)d) = n;
			minimize(this);
		}

		static Bigint opCall(ulong n) { return new Bigint(n); }

		// Construct from a float
		this(float x)
		{
			this(cast(real) x);
		}

		static Bigint opCall(float x) { return new Bigint(x); }

		// Construct from a double
		this(double x)
		{
			this(cast(real) x);
		}

		static Bigint opCall(double x) { return new Bigint(x); }

		// Construct from a real
		this(real x)
		{
			uint i;
			d.length = 4;
			bool sign = (x < 0);
			if (sign) x = -x;
			while (x > 0)
			{
				real xq = floor(x / 4294967296.0);
				real xr = x - (xq * 4294967296.0);
				d[i++] = cast(uint) xr;
				if (i == d.length-1) d.length = d.length << 1;
				x = xq;
			}
			if (sign)
			{
				//bigintLLNeg(d, d, d.length);
				bigintLLNeg(d.ptr, d.ptr, d.length);
			}
			minimize(this);
		}

		static Bigint opCall(real x) { return new Bigint(x); }

		// Construct from a string.
		this(char[] s)
		{
			this(s, uint.max);
		}

		static Bigint opCall(char[] s) { return new Bigint(s); }

		this(char[] s, size_t radix)
		{
			bool isNegative = false;
			if (s.length > 1)
			{
				if (s[0] == '+')
				{
					s = s[1..s.length];
				}
				else if (s[0] == '-')
				{
					s = s[1..s.length];
					isNegative = true;
				}
			}
			d = bigintFromString(s, radix);

			//uint len = bigintLLMinimize(d, d.length);
			uint len = bigintLLMinimize(d.ptr, d.length);
			if (len == 0)
			{
				d.length = 2;
				d[] = isNegative ? -1U : 0;
			}
			else
			{
				d.length = len+1;
			}
			if (isNegative)
			{
				bigintLLNeg(d.ptr, d.ptr, d.length);
				minimize(this);
			}
		}

		static Bigint opCall(char[] s, size_t radix) { return new Bigint(s, radix); }

		// Construct from a size_t array. This copies by value, not by reference;
		this(uint[] x, bool isNegative)
		{
			d.length = x.length + 1;
			d[0..x.length] = x[0..x.length];
			d[x.length] = isNegative ? -1U : 0;
			minimize(this);
		}

		static Bigint opCall(uint[] x, bool isNegative) { return new Bigint(x, isNegative); }

		// -------- Conversions --------

		override
		{
			//char[] toString()
			char[] toString()
			out(s)
			{
				assert(this == new Bigint(s));
			}
			body
			{
				return format(10, 0, 0, false, SignMode.NORMAL);
			}
		}

		char[] toHexString()
		out(s)
		{
			assert(this == new Bigint(s,16));
		}
		body
		{
			return format(16, 0, 8, false, SignMode.NORMAL);
		}

		int toInt()
		{
			if (isInt()) return d[0];
			return (sign) ? int.min : int.max;
		}

		uint toUint()
		{
			if (isUint()) return d[0];
			return uint.max;
		}

		long toLong()
		{
			if (isLong())
			{
				ulong lo = d[0];
				ulong hi = d[1];
				return (hi << 32) | lo;
			}
			return (sign) ? long.min : long.max;
		}

		ulong toUlong()
		{
			if (isUlong())
			{
				ulong lo = d[0];
				ulong hi = d[1];
				return (hi << 32) | lo;
			}
			return ulong.max;
		}

		float toFloat()
		{
			return toReal();
		}

		double toDouble()
		{
			return toReal();
		}

		real toReal()
		{
			if (sign) return -((-this).toReal());
			real r = 0;
			for (uint i=0; i<end; ++i)
			{
				r *= 4294967296.0;
				r += d[i];
			}
			return r;
		}

		// -------- Tests --------

		bool isInt()
		{
			if (d.length > 2) return false;
			if (sign)
			{
				return (d[0] >= 0x80000000);
			}
			else
			{
				return (d[0] < 0x80000000);
			}
		}

		bool isUint()
		{
			if (sign) return false;
			return (d.length == 2);
		}

		bool isLong()
		{
			if (d.length > 3) return false;
			if (sign)
			{
				return (d[d.length-2] >= 0x80000000);
			}
			else
			{
				return (d[d.length-2] < 0x80000000);
			}
		}

		bool isUlong()
		{
			if (sign) return false;
			return (d.length <= 3);
		}

		override
		{
			int /*I wish this was bool*/ opEquals(Object obj)
			{
				Bigint y = cast(Bigint) obj;
				assert(y);
				return d == y.d;
			}
		}

		int /*I wish this was bool*/ opEquals(int n)
		{
			return isInt() ? (n == d[0]) : 0;
		}

		int /*I wish this was bool*/ opEquals(uint n)
		{
			return isUint() ? (n == d[0]) : 0;
		}

		override
		{
			int opCmp(Object obj)
			{
				Bigint y = cast(Bigint) obj;
				assert(y);

				Bigint x = this;
				if (x is y) return 0;  // == to is by d-programming-language-china.org 20071025
				int xSign = x.sign;
				int ySign = y.sign;
				if (xSign < ySign) return -1;
				if (xSign > ySign) return 1;

				int r;
				int n = x.d.length;
				if (x.d.length > y.d.length)
				{
					n = y.d.length;
					r = bigintLLCmpAll(&x.d[y.d.length], y.sign, x.d.length - y.d.length);
					if (r < 0) return -1;
					if (r > 0) return 1;
				}
				if (x.d.length < y.d.length)
				{
					r = bigintLLCmpAll(x.sign, &y.d[x.d.length], y.d.length - x.d.length);
					if (r < 0) return -1;
					if (r > 0) return 1;
				}
				r = bigintLLCmp(x.d.ptr, y.d.ptr, n);
				if (r < 0) return -1;
				if (r > 0) return 1;
				return 0;
			}
		}

		int opCmp(int y)
		{
			if (isInt())
			{
				int x = d[0];
				if (x == y) return 0;
				return (x < y) ? -1 : 1;
			}
			else
			{
				return opCmp(new Bigint(y));
			}
		}

		int opCmp(uint y)
		{
			if (isUint())
			{
				uint x = d[0];
				if (x == y) return 0;
				return (x < y) ? -1 : 1;
			}
			else
			{
				return opCmp(new Bigint(y));
			}
		}

		// -------- Addition --------

		Bigint opAdd(Bigint y)
		{
			if (y.equalsZero()) return this;

			Bigint x = this;
			if (x.d.length < y.d.length)
			{
				x = y;
				y = this;
			}
			Bigint r = new Bigint;
			r.d.length = x.d.length + 1;
			uint carry = bigintLLAdd(r.d.ptr, x.d.ptr, y.d.ptr, y.d.length);
			if (x.d.length > y.d.length)
			{
				carry = bigintLLIncV(&r.d[y.d.length], &x.d[y.d.length], y.sign, carry, x.d.length-y.d.length);
			}
			r.d[x.d.length] = x.d[x.d.length-1] + y.d[y.d.length-1] + carry;
			return minimize(r);
		}

		Bigint opAdd(int y)
		{
			if (y == 0) return this;

			Bigint x = this;
			Bigint r = new Bigint;
			r.d.length = x.d.length + 1;

			ulong t = x.d[0] + cast(ulong) cast(uint) y;
			r.d[0] = t;
			uint carry = t > 0xFFFFFFFF;

			carry = bigintLLIncV(&r.d[1], &x.d[1], cast(uint) (y<0?-1:0), carry, x.d.length-1);
			r.d[x.d.length] = x.d[x.d.length-1] + (y<0?-1:0) + carry;
			return minimize(r);
		}

		Bigint opAdd(uint y)
		{
			if (y == 0) return this;
			uint carry;

			Bigint x = this;
			Bigint r = new Bigint;
			r.d.length = x.d.length + 1;
			carry = bigintLLInc(r.d.ptr, x.d.ptr, y, x.d.length);
			r.d[x.d.length] = x.d[x.d.length-1] + carry;
			return minimize(r);
		}

		// -------- Subtraction --------

		Bigint opSub(Bigint y)
		{
			if (y.equalsZero()) return this;
			bool neg = false;

			Bigint x = this;
			if (x.d.length < y.d.length)
			{
				x = y;
				y = this;
				neg = true;
			}
			Bigint r = new Bigint;
			r.d.length = x.d.length + 1;

			uint carry = bigintLLSub(r.d.ptr, x.d.ptr, y.d.ptr, y.d.length);
			if (x.d.length > y.d.length)
			{
				carry = bigintLLDecV(&r.d[y.d.length], &x.d[y.d.length], y.sign, carry, x.d.length-y.d.length);
			}
			r.d[r.d.length-1] = x.d[x.d.length-1] - y.d[y.d.length-1] - carry;
			minimize(r);
			return neg ? -r : r;
		}

		Bigint opSub(int y)
		{
			if (y == 0) return this;

			Bigint x = this;
			Bigint r = new Bigint;
			r.d.length = x.d.length + 1;

			ulong t = x.d[0] - cast(ulong) cast(uint) y;
			r.d[0] = t;
			uint carry = t > 0xFFFFFFFF;

			carry = bigintLLDecV(&r.d[1], &x.d[1], cast(uint) (y<0?-1:0), carry, x.d.length-1);
			r.d[x.d.length] = x.d[x.d.length-1] - (y<0?-1:0) - carry;
			return minimize(r);
		}

		Bigint opSub(uint y)
		{
			if (y == 0) return this;
			uint carry;

			Bigint x = this;
			Bigint r = new Bigint;
			r.d.length = x.d.length + 1;

			carry = bigintLLDec(r.d.ptr, x.d.ptr, y, x.d.length);
			r.d[x.d.length] = x.d[x.d.length-1] - carry;
			return minimize(r);
		}

		Bigint opSub_r(uint n)
		{
			return new Bigint(n) - this;
		}

		Bigint opSub_r(int n)
		{
			return new Bigint(n) - this;
		}

		// -------- Negation --------

		Bigint opNeg()
		{
			if (equalsZero) return this;
			Bigint r = new Bigint;
			r.d.length = d.length + 1;
			uint carry = bigintLLNeg(r.d.ptr, d.ptr, d.length);
			r.d[r.d.length-1] = 0 - d[d.length-1] - carry;
			return minimize(r);
		}

		// -------- Multiplication --------

		Bigint opMul(Bigint y)
		{
			Bigint x = this;
			if (x.sign)
			{
				if (y.sign) return -x * -y;
				else return -(-x * y);
			}
			if (y.sign)
			{
				return -(x * -y);
			}
			if (x.d.length < y.d.length)
			{
				x = y;
				y = this;
			}
			if (y.isUint())
			{
				return x * y.d[0];
			}

			Bigint r = new Bigint;
			r.d.length = x.d.length + y.d.length - 1;

			bigintMul(r.d.ptr, r.d.length-1, x.d.ptr, x.d.length-1, y.d.ptr, y.d.length-1);
			return minimize(r);
		}

		Bigint opMul(int y)
		{
			return (y < 0) ? -opMul(cast(uint)-y) : opMul(cast(uint)y);
		}

		Bigint opMul(uint y)
		{
			switch (y)
			{
				case  0: return  ZERO;
				case  1: return  this;
				case  2: return  this        + this;
				case  3: return  this        + this + this;
				case  4: return  this << 2u;
				case  5: return (this << 2u) + this;
				case  6: return (this << 2u) + this + this;
				case  7: return (this << 3u) - this;
				case  8: return  this << 3u;
				case  9: return (this << 3u) + this;
				case 10: return (this << 3u) + this + this;
				default: break;
			}
			Bigint r = new Bigint;
			r.d.length = d.length + 1;

			r.d[d.length-1] = bigintLLMul(r.d.ptr, d.ptr, y, d.length-1);
			return minimize(r);
		}

		// -------- Division --------

		Bigint opDiv(Bigint n)
		{
			Bigint r;
			return divMod(this, n, r, Round.TOWARD_ZERO);
		}

		Bigint opDiv(int n)
		{
			Bigint r;
			return divMod(this, new Bigint(n), r, Round.TOWARD_ZERO);
		}

		Bigint opDiv(uint n)
		{
			Bigint r;
			return divMod(this, new Bigint(n), r, Round.TOWARD_ZERO);
		}

		Bigint opDiv_r(int n)
		{
			return new Bigint(n) / this;
		}

		Bigint opDiv_r(uint n)
		{
			return new Bigint(n) / this;
		}

		// -------- Remainder from division --------

		Bigint opMod(Bigint n)
		{
			Bigint r;
			divMod(this, n, r, Round.TOWARD_ZERO);
			return r;
		}

		Bigint opMod(int n)
		{
			Bigint r;
			divMod(this, new Bigint(n), r, Round.TOWARD_ZERO);
			return r;
		}

		Bigint opMod(uint n)
		{
			Bigint r;
			divMod(this, new Bigint(n), r, Round.TOWARD_ZERO);
			return r;
		}

		Bigint opMod_r(int n)
		{
			return new Bigint(n) % this;
		}

		Bigint opMod_r(uint n)
		{
			return new Bigint(n) % this;
		}

		// -------- Binary And  --------

		Bigint opAnd(Bigint y)
		{
			Bigint r = new Bigint;
			Bigint x = this;
			int s = x.sign & y.sign;
			uint minlen = x.d.length - 1;
			uint maxlen = minlen;
			if (x.d.length > y.d.length)
			{
				minlen = y.d.length - 1;
				if (y.sign)
				{
					r.d.length = maxlen+1;
					r.d[minlen..maxlen] = x.d[minlen..maxlen];
				}
				else
				{
					r.d.length = minlen+1;
				}
			}
			else if (x.d.length < y.d.length)
			{
				maxlen = y.d.length - 1;
				if (x.sign)
				{
					r.d.length = maxlen+1;
					r.d[minlen..maxlen] = y.d[minlen..maxlen];
				}
				else
				{
					r.d.length = minlen+1;
				}
			}
			else
			{
				r.d.length = minlen+1;
			}
			bigintLLAnd(r.d.ptr, x.d.ptr, y.d.ptr, minlen);
			r.d[r.d.length-1] = s;
			return minimize(r);
		}

		Bigint opAnd(int y)
		{
			if (y < 0)
			{
				uint n = d[0] & y;
				if (n == d[0]) return this;
				Bigint r = new Bigint(this);
				r.d[0] = n;
				return r;
			}
			else
			{
				return new Bigint(y & d[0]);
			}
		}

		uint opAnd(uint y)
		{
			return d[0] & y;
		}

		// -------- Binary Or --------

		Bigint opOr(Bigint y)
		{
			Bigint r = new Bigint;
			Bigint x = this;
			int s = x.sign | y.sign;
			uint minlen = x.d.length - 1;
			uint maxlen = minlen;
			if (x.d.length > y.d.length)
			{
				minlen = y.d.length - 1;
				if (y.sign)
				{
					r.d.length = minlen+1;
				}
				else
				{
					r.d.length = maxlen+1;
					r.d[minlen..maxlen] = x.d[minlen..maxlen];
				}
			}
			else if (x.d.length < y.d.length)
			{
				maxlen = y.d.length - 1;
				if (x.sign)
				{
					r.d.length = minlen+1;
				}
				else
				{
					r.d.length = maxlen+1;
					r.d[minlen..maxlen] = y.d[minlen..maxlen];
				}
			}
			else
			{
				r.d.length = minlen+1;
			}
			bigintLLOr(r.d.ptr, x.d.ptr, y.d.ptr, minlen);
			r.d[r.d.length-1] = s;
			return minimize(r);
		}

		Bigint opOr(int y)
		{
			if (y < 0)
			{
				return new Bigint(cast(int) (y | d[0]));
			}
			else
			{
				return this | (cast(uint) y);
			}
		}

		Bigint opOr(uint y)
		{
			uint n = d[0] | y;
			if (n == d[0]) return this;
			Bigint r = new Bigint(this);
			r.d[0] = n;
			return r;
		}


		// -------- Binary Exclusive Or --------

		Bigint opXor(Bigint y)
		{
			Bigint r = new Bigint;
			Bigint x = this;
			int s = x.sign ^ y.sign;
			uint minlen = x.d.length - 1;
			uint maxlen = minlen;
			if (x.d.length > y.d.length)
			{
				minlen = y.d.length - 1;
				r.d.length = maxlen + 1;

				if (y.sign)
				{
					bigintLLCom(&r.d[minlen], &x.d[minlen], maxlen-minlen);
				}
			}
			else if (x.d.length < y.d.length)
			{
				maxlen = y.d.length - 1;
				r.d.length = maxlen + 1;

				if (x.sign)
				{
					bigintLLCom(&r.d[minlen], &y.d[minlen], maxlen-minlen);
				}
			}
			else
			{
				r.d.length = minlen + 1;
			}
			bigintLLXor(r.d.ptr, x.d.ptr, y.d.ptr, minlen);
			r.d[maxlen] = s;
			return minimize(r);
		}

		Bigint opXor(int y)
		{
			if (y < 0)
			{
				Bigint r = new Bigint;
				r.d.length = d.length;

				r.d[0] = d[0] ^ y;
				bigintLLCom(&r.d[1], &d[1], d.length-1);
				return minimize(r);
			}
			else
			{
				return this ^ (cast(uint) y);
			}
		}

		Bigint opXor(uint y)
		{
			if (y == 0) return this;
			Bigint r = new Bigint(this);
			r.d[0] ^= y;
			return r;
		}

		// -------- Complement --------

		Bigint opCom()
		{
			Bigint r = new Bigint;
			r.d.length = d.length;
			bigintLLCom(r.d.ptr, d.ptr, d.length);
			return r;
		}

		// -------- Shift left --------

		Bigint opShl(Bigint y)
		{
			Bigint x = this;
			if (y.isInt())
			{
				int k = y.d[0];
				return x << k;
			}
			if (y.sign) return x >> (-y);
			if (x.equalsZero) return this;
			throw new IntException("(x << y) overflow: y too big");
		}

		Bigint opShl(int y)
		{
			if (y < 0) return this >> (cast(uint)-y);
			return this << (cast(uint)y);
		}

		Bigint opShl(uint y)
		{
			if (y == 0) return this;
			uint nDigits = y >> 5;
			uint nBits = y & 0x1F;

			int neg = sign;
			Bigint r = shlWhole(this, nDigits);
			Bigint s = new Bigint;
			s.d.length = r.d.length + 1;
			bigintLLShl(&s.d[nDigits], &r.d[nDigits], nBits, r.d.length-nDigits);
			s.d[s.d.length-1] = neg;
			return minimize(s);
		}

		Bigint opShl_r(int y)
		{
			return (new Bigint(y)) << this;
		}

		Bigint opShl_r(uint y)
		{
			return (new Bigint(y)) << this;
		}

		// -------- Shift right --------

		Bigint opShr(Bigint y)
		{
			if (y.isInt())
			{
				int k = y.d[0];
				return this >> k;
			}
			if (y.sign) return this << (-y);
			return new Bigint(sign());
		}

		Bigint opShr(int y)
		{
			if (y < 0) return this << (cast(uint)-y);
			return this >> (cast(uint)y);
		}

		Bigint opShr(uint y)
		{
			if (y == 0) return this;
			uint nDigits = y >> 5;
			uint nBits = y & 0x1F;

			Bigint r = shrWhole(this, nDigits);
			Bigint s = new Bigint;
			s.d.length = r.d.length;
			uint extraBits = (sign) ? (int.min >> nBits) << 1 : 0;
			bigintLLShr(s.d.ptr, r.d.ptr, nBits, r.d.length);
			s.d[s.d.length-1] |= extraBits;
			return minimize(s);
		}

		Bigint opShr_r(uint y)
		{
			return (new Bigint(y)) >> this;
		}

		Bigint opShr_r(int y)
		{
			return (new Bigint(y)) >> this;
		}

		// -------- Unsigned Shift right --------

		Bigint opUShr(Bigint y)
		{
			Bigint x = this;
			if (y.isInt())
			{
				int k = y.d[0];
				return x >>> k;
			}
			if (y.sign) return x << (-y);
			if (x.sign) throw new IntException("(x >>> y) not defined for x < 0");
			return ZERO;
		}

		Bigint opUShr(int y)
		{
			if (y < 0) return this << (cast(uint)-y);
			return this >>> (cast(uint)y);
		}

		Bigint opUShr(uint y)
		{
			if (y == 0) return this;
			if (sign) throw new IntException("(x >>> y) not defined for x < 0");
			return opShr(y);
		}

		Bigint opUShr_r(uint y)
		{
			return (new Bigint(y)) >>> this;
		}

		Bigint opUShr_r(int y)
		{
			return (new Bigint(y)) >>> this;
		}

		// -------- Array dereferencing --------
		//
		// These overloads are designed to give the illusion that an Bigint is actually an infinitely large array

		// size_t length() purposefully not overloaded, because you can't actually HAVE an infinitely large array
		// instead, we offer this:

		uint end()
		{
			return d.length - 1;
		}

		uint opIndex(int i)
		{
			return (i < d.length) ? d[i] : d[d.length-1];
		}

		// size_t opIndex(int i, int value) purposefully not overloaded because Ints are immutable

		// uint[] opSlice() purposefully not overloaded, because you can't actually HAVE an infinitely large array

		uint[] opSlice(int i, int j)
		{
			uint[] t;
			if (i >= j) return t; //empty array
			t.length = j-i;
			if (j <= d.length)
			{
				t[] = d[i..j];
			}
			else
			{
				uint s = sign;
				if (i >= d.length)
				{
					t[] = s;
				}
				else
				{
					t[0..d.length-i] = d[i..d.length];
					t[d.length-i..j-i] = s;
				}
			}
			return t;
		}

		/*
			And so end the operator overloads.

			Now, one big problem with big integers is that printf() doesn't recognise them.
			For this reason, we present a format function.
			Its parameter is a fragment of a printf() format string, starting with "%" and ending with "d".
		*/

		static enum SignMode { NORMAL, MINUS_SPACE, MINUS_SPACE_PLUS } // added static by d-programming-language-china.org 20071025
		char[] format(uint radix, size_t minWidth, size_t groupWidth, bool leadingZeroes, SignMode signMode)
		{
			// Get a positive version of this
			int actualSign = opCmp(0);
			Bigint t = (actualSign < 0) ? -this : this;
			char padChar = leadingZeroes ? '0' : ' ';
			char[] s = bigintToString(t.d, radix, groupWidth);

			// Now make somewhere for the final result
			char[] u;
			uint tLen = s.length + 1;
			if (tLen < minWidth) tLen = minWidth;
			u.length = tLen;

			// Copy in the string
			uint padSpace = u.length - s.length;
			u[0..padSpace] = padChar;
			u[padSpace..u.length] = s[0..s.length];

			// Write in the sign
			uint signPos = (leadingZeroes) ? 0 : padSpace-1;
			if (actualSign < 0)
			{
				u[signPos] = '-';
			}
			else if (signMode == SignMode.NORMAL)
			{
				uint realLength = (s.length > minWidth) ? s.length : minWidth;
				u = u[u.length-realLength..u.length];
			}
			else if (actualSign == 0 || signMode == SignMode.MINUS_SPACE)
			{
				u[signPos] = ' ';
			}
			else
			{
				u[signPos] = '+';
			}
			s[] = 0;
			return u;
		}

		/*
			The functions below are intended to be fast and simple.
		*/

		/* returns true if this is zero; false if this is non-zero */
		bool equalsZero()
		{
			return ((d[0]==0) && (d[1]==0) && (d.length == 2));
		}

		/* returns true if this is positive; false if this is negative or zero */
		bool positive()
		{
			if (sign) return false;
			return (!equalsZero());
		}

		/* returns true if this is negative; false if this is positive or zero */
		bool negative()
		{
			return (sign < 0);
		}

		/* returns -1 if this is sign; 0 if this is positive or zero */
		int sign()
		{
			return d[d.length-1];
		}

		// Change the sign field of a number without negating it. That is, change the interpretation of its bool pattern
		Bigint changeSign()
		{
			Bigint r = new Bigint(this);
			r.d[r.d.length-1] = ~r.d[r.d.length-1];
			return r;
		}
	}

	package
	{

		this()
		{
		}

		this(uint[] t)
		{
			d = t;
			minimize(this);
		}

		this(Bigint n)
		{
			d.length = n.d.length;
			d[] = n.d[];
		}


		//-----------------------------------
		// The member variables of this class

		uint[] d;

		//==================================================

		// A generalization of this to the power of e.
		Bigint powGen(Bigint e, Bigint r, FMul f)
		in
		{
			assert(e >= 0);
		}
		body
		{
			Bigint x = this;
			if (x.equalsZero) return x;
			if (e.equalsZero) return r;

			// We unroll what would otherwise have been the first pass of the i-loop, for speed.
			// Note that i starts off at e.length-2, because:
			//		e.d[e.length-1] = the sign word, guaranteed to equal 0x00000000 in this case.
			//		e.d[e.length-2] = the most significant d of e.

			int i = e.d.length - 2;
			for (int j=bsr(e.d[i]); j>=0; --j)
			{
				r = f(r,r);
				if (bt(&e.d[i],j))
				{
					r = f(r,x);
				}
			}

			// Below is the rest of the i-loop. From now on, j has to test every single bit.
			// Note that i starts off at e.length-3, because the first pass of the loop was
			// unrolled, and carried out above.

			for (i=e.d.length-3; i>=0; --i)
			{
				for (int j=31; j>=0; --j)
				{
					r = f(r, r);
					if (bt(&e.d[i],j))
					{
						r = f(r, x);
					}
				}
			}
			return r;
		}
	}
}

// Private helper functions follow

private
{
	Bigint minimize(Bigint x)
	{
		uint len = bigintLLMinimizeV(x.d.ptr, x.d[x.d.length-1], x.d.length);
		if (len <= 1)
		{
			x.d.length = 2;
		}
		else
		{
			x.d.length = len + 1;
		}
		return x;
	}
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Public helper functions follow
*/

// get the absolute value of a number
Bigint abs(Bigint x)
{
	return (x.sign) ? -x : x;
}

// Returns -1, 0 or +1 according to the sign of x
int sgn(Bigint x)
{
	if (x.sign) return -1;
	return (x.equalsZero) ? 0 : 1;
}

// test a bool
bool bitTest(Bigint x, size_t n)
{
	uint nDigits = n >>> 5;
	uint nBits = n & 0x1F;
	if (nDigits >= x.d.length) return (x.sign == 0) ? 0 : 1;
	return (bts(&x.d[nDigits], nBits) == 0) ? 0 : 1;
}

// set a bit. (More precisely, return a copy of x, with the appropriate bool set).
Bigint bitSet(Bigint x, int n)
{
	return x | pow2(n);
}

// reset a bit.  (More precisely, return a copy of x, with the appropriate bool set).
Bigint bitClear(Bigint x, int n)
{
	return x & ~pow2(n);
}

// get the number of trailing zero bits in this (ge2 means Greatest Power of 2)
uint ge2(Bigint x)
{
	for (uint i=0; i<x.d.length; ++i)
	{
		int n = bsf(x.d[i]);
		if (n >= 0) return n;
	}
	throw new IntException("ge2(x) not defined for x == 0");
}

uint ge2(int x)
{
	return ge2(cast(uint) x);
}

uint ge2(uint x)
{
	int n = bsf(x);
	if (n >= 0) return n;
	throw new IntException("ge2(x) not defined for x == 0");
}


// get the number of bits in this (less one)
uint log2(Bigint x)
{
	if (!x.positive) throw new IntException("log2(x) not defined for x <= 0");
	return bsr(x.d[x.d.length-2]) + ((x.d.length-2)<<5);
}

uint log2(int x)
{
	if (x <= 0) throw new IntException("log2(x) not defined for x <= 0");
	return bsr(x);
}

uint log2(uint x)
{
	if (x == 0) throw new IntException("log2(x) not defined for x == 0");
	return bsr(x);
}

// returns two to a given power
Bigint pow2(int x)
{
	if (x < 0) throw new IntException("pow2(x) not defined for x < 0");
	uint nDigits = x >>> 5;
	uint nBits = x & 0x1F;
	Bigint r = new Bigint();
	r.d.length = nDigits + 2;
	r.d[nDigits] = 1 << nBits;
	return r;
}

// test whether or not a bigint is an exact power of two
bool isPow2(Bigint x)
{
	if (!x.positive) return false;
	if (isPow2(x.d[x.d.length-2]))
	{
		return bigintLLEqualsZero(x.d.ptr, x.d.length-2);
	}
	return false;
}

bool isPow2(int x)
{
	if (x <= 0) return false;
	return isPow2(cast(uint) x);
}

bool isPow2(uint x)
{
	return (log2Exact(x) >= 0);
}

// Count the number of one bits in a uint
uint countOnes(Bigint x)
{
	if (x.sign) throw new IntException("countOnes(x) not defined for x < 0");
	return bigintLLCountOnes(x.d.ptr, x.d.length-1);
}

uint countOnes(int x)
{
	if (x < 0) throw new IntException("countOnes(x) not defined for x < 0");
	return countOnes(cast(uint) x);
}

uint countOnes(uint x)
{
	return bigintLLCountOnes(&x, 1);
}

// Shift one number left by a whole number of uints. That is, perform x << (32*y).
Bigint shlWhole(Bigint x, size_t y)
{
	if (y == 0) return x;
	Bigint r = new Bigint;
	r.d.length = x.d.length + y;
	r.d[y..r.d.length] = x[0..x.d.length];
	return r;
}

Bigint shlWhole(int x, size_t y)
{
	Bigint r = new Bigint;
	r.d.length = y + 2;
	r.d[y] = x;
	r.d[y+1] = x<0 ? -1U : 0;
	return r;
}

Bigint shrWhole(Bigint x, size_t y)
{
	if (y == 0) return x;
	Bigint r = new Bigint;
	if (x.d.length > y+2)
	{
		r.d.length = x.d.length - y;
		r.d[] = x.d[y..x.d.length];
	}
	else
	{
		r.d.length = 2;
		r.d[] = x.d[x.d.length-2..x.d.length];
	}
	return r;
}

// Return the low part of a number. That is, x & (1<<(32*y))-1
Bigint lowWhole(Bigint x, size_t y)
{
	if (y == x.end) return x;
	Bigint r = new Bigint;
	r.d.length = y + 1;
	r.d[0..y] = x[0..y];
	return minimize(r);
}

//	Return x / y and assign d = x % y
Bigint divMod(Bigint x, Bigint y, out Bigint r)
{
	return divMod(x, y, r, Bigint.Round.TOWARD_ZERO);
}

Bigint divMod(Bigint x, Bigint y, out Bigint r, Bigint.Round mode)
out(q)
{
	assert(y*q+r == x);
}
body
{
	if (y.equalsZero()) throw new IntException("Divide by zero");

	int xSign = x.sign;
	int ySign = y.sign;
	Bigint xa = (xSign < 0) ? -x : x;
	Bigint ya = (ySign < 0) ? -y : y;

	Bigint q;
	if (xa < ya)
	{
		q = Bigint.ZERO;
		r = xa;
	}
	else
	{
		q = new Bigint;
		q.d.length = xa.d.length - ya.d.length + 2;
		r = new Bigint;
		r.d.length = ya.d.length;
		bigintDivMod(q.d.ptr, q.d.length-1, r.d.ptr, r.d.length-1, xa.d.ptr, xa.d.length-1, ya.d.ptr, ya.d.length-1);
		minimize(q);
		minimize(r);
	}

	if (xSign != ySign) q = -q;
	if (xSign < 0) r = -r;

	if (!r.equalsZero())
	{
		switch (mode)
		{
		case Bigint.Round.TOWARD_ZERO:
			break;

		case Bigint.Round.TOWARD_INFINITY:
			if (xSign == ySign)
			{
				q = q + 1;
				r = r - y;
			}
			break;

		case Bigint.Round.TOWARD_MINUS_INFINITY:
			if (xSign != ySign)
			{
				q = q - 1;
				r = r + y;
			}
			break;
		}
	}
	return q;
}

package class FMul
{
	abstract Bigint opCall(Bigint x, Bigint y);
}


version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
