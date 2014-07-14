
module ydb.math.bigint.Lowlevel;

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

// Written in the D programming language.

/// port to Tango by yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

/*

The functions in this file have no concept of an Int object, and they do
not deal in arrays of uints. Instead, they take raw pointers into arrays of uints,
along with an explicit length parameter. The uints pointed to are interpretted as
an UNSIGNED multi-precision integer.

*/

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = x + y
*/

// Add two unsigned bigints of different sizes
uint bigintLLAdd(uint* d, uint* x, size_t xLen, uint* y, size_t yLen)
in
{
	assert(xLen >= yLen);
}
body
{
	uint carry = bigintLLAdd(d, x, y, yLen);
	return bigintLLInc(d+yLen, x+yLen, carry, xLen-yLen);
}

// Add two unsigned bigints of the same size
uint bigintLLAdd(uint* d, uint* x, uint* y, size_t len)
{
	uint carry;
	ulong xVal, dVal;
	for (int i=len-1; i>=0; --i)
	{
		xVal = *x++;
		dVal = xVal + *y++ + carry;
		carry = dVal > 0xFFFFFFFF;
		*d++ = dVal;
	}
	return carry;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = x & y
*/

void bigintLLAnd(uint* d, uint* x, uint* y, size_t len)
{
	for (int i=len-1; i>=0; --i)
	{
		*d++ = *x++ & *y++;
	}
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = x
*/

void bigintLLAssign(uint* d, uint* x, size_t len)
{
	for (int i=len-1; i>=0; --i)
	{
		*d++ = *x++;
	}
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Compare two bigints of the same length
*/

int bigintLLCmp(uint* x, uint* y, size_t len)
{
	for (int i=len-1; i>=0; --i)
	{
		if (x[i] < y[i]) return -1;
		if (x[i] > y[i]) return  1;
	}
	return 0;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Compare two bigints of different lengths
*/

int bigintLLCmp(uint* x, size_t xLen, uint* y, size_t yLen)
{
	// Get the longest seqence into x
	bool swapped = (xLen < yLen);
	if (swapped)
	{
		uint* t = x;
		x = y;
		y = t;
		uint tLen = xLen;
		xLen = yLen;
		yLen = tLen;
	}

	// See if the high order part of x is zero
	if (!bigintLLEqualsZero(x+yLen, xLen-yLen))
	{
		return (swapped) ? -1 : 1;
	}

	// Compare the low order parts
	int n = bigintLLCmp(x, y, yLen);
	return (swapped) ? -n : n;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Compare all words of an bigint with a single value
*/

int bigintLLCmpAll(uint* x, size_t y, size_t len)
{
	for (int i=len-1; i>=0; --i)
	{
		if (x[i] < y) return -1;
		if (x[i] > y) return  1;
	}
	return 0;
}

int bigintLLCmpAll(uint x, uint* y, size_t len)
{
	return -bigintLLCmpAll(y, x, len);
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = ~x
*/
void bigintLLCom(uint* d, uint* x, size_t len)
{
	for (int i=len-1; i>=0; --i)
	{
		*d++ = ~(*x++);
	}
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	d = x - carry
	(carry may by in the range 0 <= carry < 0xFFFFFFFF)
*/
uint bigintLLDec(uint* d, uint* x, size_t carry, size_t len)
{
	return bigintLLDecV(d, x, 0, carry, len);
}

uint bigintLLDecV(uint* d, uint* x, size_t y, size_t carry, size_t len)
in
{
	assert(y == 0 || y == uint.max);
}
body
{
	ulong xVal, dVal;
	for (int i=len-1; i>=0; --i)
	{
		xVal = *x++;
		dVal = xVal - y - carry;
		carry = dVal > 0xFFFFFFFF;
		*d++ = dVal;
	}
	return carry;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = x / n
carry = x % n
*/
uint bigintLLDiv(uint* d, uint* x, size_t k, size_t len)
{
	uint carry, xVal, dVal;
	d += len;
	x += len;
	for (int i=len-1; i>=0; --i)
	{
		xVal = *--x;
		version(X86)
		{
			asm
			{
				mov EDX,carry;
				mov EAX,xVal;
				mov EBX,k;
				div EBX;
				mov dVal,EAX;
				mov carry,EDX;
			}
		}
		else
		{
			ulong val = (cast(ulong)carry)<<32 | xVal;
			dVal = val / k;
			carry = val - dVal * k;
		}
		*--d = dVal;
	}
	return carry;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
q = x / n
r = x % n
*/
void bigintDivMod(uint* q, size_t qLen, uint* r, size_t rLen, uint* x, size_t xLen, uint* y, size_t yLen)
in
{
	assert(xLen >= yLen);
	assert(qLen >= xLen - yLen + 1);
	assert(rLen >= yLen);
}
body
{
	// Normalize the operands x and y into xx and yy
	// and ensure that the xx bigintLL is big enough to hold the working data
	uint[] xx, yy, zz;
	xx.length = xLen + yLen + 1;
	yy.length = yLen;
	zz.length = yLen + 1;
	uint yHi = y[yLen - 1];
	uint shiftCount = 31 - bsr(yHi);
	bigintLLShl(yy.ptr, y, shiftCount, yLen);
	xx[xLen] = bigintLLShl(xx.ptr, x, shiftCount, xLen);

	// Zero the quotient
	bigintLLZero(q, qLen);

	// Now do the long division
	yHi = yy[yLen-1];
	for (int i=qLen-1; i>=0; --i)
	{
		// First, we ESTIMATE the next most significant size_t of the result (q)
		uint qi; // This is going to be an estimate of q[i];
		if (yHi == 0xFFFFFFFF)
		{
			qi = xx[yLen+i];
		}
		else
		{
			uint xHi = xx[yLen+i];
			uint xLo = xx[yLen+i-1];
			uint d = yHi + 1;
			version(X86)
			{
				asm
				{
					mov EDX,xHi;
					mov EAX,xLo;
					mov EBX,d;
					div EBX;
					mov qi,EAX;
				}
			}
			else
			{
				ulong x = ((cast(ulong) xHi) << 32) | xLo;
				qi = x / d;
			}
		}

		// Assuming qi to be correct, churn out the next row of the long division
		zz[yLen] = bigintLLMul(zz.ptr, yy.ptr, qi, yLen);
		bigintLLSub(&xx[i], &xx[i], zz.ptr, yLen+1);

		// Of course, qi may not have been correct.
		// So now we need to fix our estimate
		while ((xx[yLen+i] != 0) || (bigintLLCmp(&xx[i], yy.ptr, yLen) >= 0))
		{
			++qi;
			xx[yLen+i] -= bigintLLSub(&xx[i], &xx[i], yy.ptr, yLen);
		}

		// We have the next uint. Store it.
		q[i] = qi;
	}

	// We have now got the quotient in q.
	// All we have to do now is get the remainder.
	bigintLLShr(r, xx.ptr, shiftCount, yLen);

	// And for the security conscious...
	xx[] = 0;
	yy[] = 0;
	zz[] = 0;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Tests whether two bigints are equal
*/
bool bigintLLEquals(uint* x, uint* y, size_t len)
{
	for (int i=len-1; i>=0; --i)
	{
		if (*x++ != *y++) return false;
	}
	return true;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Tests whether an bigint size_t is zero
*/
bool bigintLLEqualsZero(uint* x, size_t len)
{
	for (int i=len-1; i>=0; --i)
	{
		if (*x++ != 0) return false;
	}
	return true;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Counts the number of 1 bits in a bigint
*/
uint bigintLLCountOnes(uint* x, size_t len)
{
	uint n = 0;
	for (int i=len-1; i>=0; --i)
	{
		uint xVal = *x++;
		if (xVal == 0) continue;
		for (uint j=0x80000000; j!=0; j>>>=1)
		{
			if ((xVal & j) != 0) ++n;
		}
	}
	return n;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	d = x + carry
	(carry may by in the range 0 <= carry < 0xFFFFFFFF)
*/
uint bigintLLInc(uint* d, uint* x, size_t carry, size_t len)
{
	return bigintLLIncV(d, x, 0, carry, len);
}

uint bigintLLIncV(uint* d, uint* x, size_t y, size_t carry, size_t len)
in
{
	assert(y == 0 || y == uint.max);
}
body
{
	ulong xVal, dVal;
	for (int i=len-1; i>=0; --i)
	{
		xVal = *x++;
		dVal = xVal + y + carry;
		carry = dVal > 0xFFFFFFFF;
		*d++ = dVal;
	}
	return carry;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Find the minimal storage required for an bigint uint
*/
uint bigintLLMinimize(uint* x, size_t len)
{
	return bigintLLMinimizeV(x, 0, len);
}

uint bigintLLMinimizeV(uint* x, size_t y, size_t len)
{
	for (; len>0; --len)
	{
		if (x[len-1] != y) break;
	}
	return len;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = x * k
*/
uint bigintLLMul(uint* d, uint* x, size_t k, size_t len)
{
	uint carry, xVal, dVal;
	for (int i=len-1; i>=0; --i)
	{
		xVal = *x++;
		version(X86)
		{
			asm
			{
				mov EAX,xVal;
				mov EBX,k;
				mul EBX;
				add EAX,carry;
				adc EDX,0;
				mov carry,EDX;
				mov dVal,EAX;
			}
		}
		else
		{
			ulong dVal = cast(ulong)xVal * cast(ulong)k + carry;
			carry = (dVal >> 32);
		}
		*d++ = dVal;
	}
	return carry;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = -x
*/

uint bigintLLNeg(uint* d, uint* x, size_t len)
{
	uint carry;
	ulong xVal, dVal;
	for (int i=len-1; i>=0; --i)
	{
		xVal = *x++;
		dVal = 0 - xVal - carry;
		carry = dVal > 0xFFFFFFFF;
		*d++ = dVal;
	}
	return carry;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = x & y
*/

void bigintLLOr(uint* d, uint* x, uint* y, size_t len)
{
	for (int i=len-1; i>=0; --i)
	{
		*d++ = *x++ | *y++;
	}
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = x << n
*/
uint bigintLLShl(uint* d, uint* x, size_t k, size_t len)
{
	if (k == 0)
	{
		bigintLLAssign(d, x, len);
		return 0;
	}
	uint carry, xVal;
	ulong dVal;
	for (int i=len-1; i>=0; --i)
	{
		xVal = *x++;
		dVal = (cast(ulong)xVal << k) | carry;
		carry = (dVal >> 32);
		*d++ = cast(uint) dVal;
	}
	return carry;
}


/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = x >>> n
*/
uint bigintLLShr(uint* d, uint* x, size_t k, size_t len)
{
	if (k == 0)
	{
		bigintLLAssign(d, x, len);
		return 0;
	}
	ulong carry;
	uint xVal, dVal;
	d += len;
	x += len;
	for (int i=len-1; i>=0; --i)
	{
		xVal = *--x;
		carry <<= 32;
		carry |= xVal;
		dVal = cast(uint) (carry >> k);
		carry = xVal;
		*--d = dVal;
	}
	return carry << (32-k);
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = x - y
*/
// Subtract two unsigned bigints of different sizes
uint bigintLLSub(uint* d, uint* x, size_t xLen, uint* y, size_t yLen)
in
{
	assert(xLen >= yLen);
}
body
{
	uint carry = bigintLLSub(d, x, y, yLen);
	return bigintLLDec(d+yLen, x+yLen, carry, xLen-yLen);
}

// Subtract two unsigned bigints of the same size
uint bigintLLSub(uint* d, uint* x, uint* y, size_t len)
{
	uint carry;
	ulong xVal, dVal;
	for (int i=len-1; i>=0; --i)
	{
		xVal = *x++;
		dVal = xVal - *y++ - carry;
		carry = dVal > 0xFFFFFFFF;
		*d++ = dVal;
	}
	return carry;
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = x ^ y
*/
void bigintLLXor(uint* d, uint* x, uint* y, size_t len)
{
	for (int i=len-1; i>=0; --i)
	{
		*d++ = *x++ ^ *y++;
	}
}

/*	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
d = 0
*/
void bigintLLZero(uint* d, size_t len)
{
	for (int i=len-1; i>=0; --i)
	{
		*d++ = 0;
	}
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
