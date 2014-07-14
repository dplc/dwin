/**

    Bignum functions, and cent/ucent support.  Stolen from Python.
    modified by yidabu from dli.dbignum

*/



module ydb.math.Bignum;


private import tango.math.Math;
private import tango.stdc.string : memmove, memcmp;

debug(UnitTest) import tango.stdc.stdio : printf;

static const int shift = 8;
static const int mask = 255;
static const int base = 256;

//extern (C) void *_d_new (int count, int size);

/* Multiply by a single digit, ignoring the sign. */

static Bignum
mul1 (Bignum a, int n)
{
    return muladd1 (a, n, 0);
}

/* Multiply by a single digit and add a single digit, ignoring the sign. */

static Bignum
muladd1 (Bignum a, int n, int extra)
{
    int size_a = a.length ();
    int carry = extra, i;
    ubyte *a_data, z_data;
    Bignum z;
    
    z.setLength (size_a + 1);
    a_data = a.data ();
    z_data = z.data ();
    
    for (i = 0; i < size_a; i ++)
    {
        carry = carry + a_data [i] * n;
        z_data [i] = carry & mask;
        carry = carry >> shift;
    }
    
    z_data [i] = carry;
    return z.normalize ();
}

/* Divide long pin, w/ size digits, by non-zero digit n, storing quotient
   in pout, and returning the remainder.  pin and pout point at the LSD.
   It's OK for pin == pout on entry, which saves oodles of mallocs/frees in
   long_format, but that should be done with great care since longs are
   immutable. */

static int
inplace_divrem1 (ubyte *pout, ubyte *pin, int size, ubyte n)
{
    int rem = 0;

    assert (n > 0 && n <= mask);
    pin += size;
    pout += size;
    
    while (-- size >= 0)
    {
        int hi;
        
        pin --;
        pout --;
        rem = (rem << shift) + *pin;
        *pout = hi = rem / n;
        rem = rem - hi * n;
    }
    
    return rem;
}

/* Divide a long integer by a digit, returning both the quotient
   (as function result) and the remainder (through *prem).
   The sign of a is ignored; n should not be zero. */

static Bignum
divrem1 (Bignum a, int n, ubyte *prem)
{
    int size = a.length ();
    Bignum z;
    
    assert (n > 0 && n <= mask);
    z.setLength (size);
    
    *prem = inplace_divrem1 (z.data (), a.data (), size, n);
    return z.normalize ();
}

static int imin (int a, int b) { return a < b ? a : b; }
static int imax (int a, int b) { return a > b ? a : b; }

struct Bignum
{
    int hidden; /* Length of bignum, negative for negative value */
    
    union
    {
        ubyte *pointer; /* Data when abs (length) is greater than four */
        ubyte [4] small; /* Data used for small bignums, up to four bytes */
    };
    
    static Bignum fromLong (long value)
    {
        bool negative = false;
        int ndigits = 0;
        ulong ival;
        Bignum v;
        size_t t;

        if (value == long.min)
            throw new Exception ("Cannot get a bignum from long.min");
        if (value < 0)
            ival = -value, negative = true;
        else
            ival = value;
        
        t = ival;
        while (t)
        {
            ndigits ++;
            t = t >> shift;
        }
        
        v.setLength (ndigits);
        
        ubyte *p = v.data ();
        
        v.setSigned (negative);
        
        t = ival;
        while (t)
        {
            *p ++ = t & mask;
            t = t >> shift;
        }

        return v;
    }
    
    static Bignum fromReal (real value)
    {
        bool signed;
        int digits;
        Bignum v;
        
//        if (!value.isnormal)
  //          throw new Exception ("cannot convert a non-normal float to bignum");
        if (value < 0)
            signed = true, value = -value;
        if (value < 1)
            return v;
        digits = cast(int) (log (value) / log (base) + 1);
        v.setLength (digits);
        v.setSigned (signed);
        
        ubyte *p = v.data ();
        
        for (int c = 0; c < digits; c ++)
        {
            *p ++ = cast(ubyte) value % base;
            value /= base;
        }
        
        return v;
    }
    
    long toLong ()
    {
        int length = this.length ();
        bool negative = this.negative ();
        ubyte *data = this.data ();
        long value;
        int c;
        
        c = length > 7 ? 7 : length - 1;
        while (c >= 0)
            value = (value << shift) | data [c --];
        
        return negative ? -value : value;
    }
    
    real toReal ()
    {
        int length = this.length ();
        bool negative = this.negative ();
        ubyte *data = this.data ();
        real value = 0;
        int c = length;
        
        while (c >= 0)
            value = (value * base) + data [c --];
        
        return negative ? -value : value;
    }
    
    int toInt () { return toLong (); }
    
    Bignum toBignum () { return * cast(Bignum *) this; }

    int length () { return hidden < 0 ? -hidden : hidden; }
    bool negative () { return hidden < 0 ? true : false; }
    ubyte *data () { return length () <= 4 ? cast(ubyte *) small : pointer; }
        
    int eq (Bignum y)
    {
        if (hidden != y.hidden)
            return 0;
        return memcmp (data (), y.data (), length ()) == 0;
    }
    
    void dup (Bignum x)
    {
        int length = x.length ();
        
        setLength (length);
        hidden = x.hidden;
        memmove (data (), x.data (), length);
    }
        
    void setLength (int digits)
    {
        bool negative = this.negative ();
        int length = this.length ();
        ubyte *data = this.data ();
        ubyte *dest;
        
        if (digits == length)
            return;

        if (digits <= 4)
        {
            if (length <= 4)
            {
                hidden = negative ? -digits : digits;
                return;
            }
            
            dest = cast(ubyte *) small;
        }
        //else
            //dest = cast(ubyte *) _d_new (digits, 1);
        
        memmove (dest, data, length < digits ? length : digits);
        
        hidden = negative ? -digits : digits;
        if (digits > 4)
            pointer = dest;
    }
    
    /* Set or reset signed */
    void setSigned (bool value)
    {
        if (hidden < 0)
        {
            if (!value)
                hidden = -hidden;
        }
        else if (hidden == 0)
        {
            if (value)
                throw new Exception ("zero-length bignum cannot be signed");
        }
        else if (value)
            hidden = -hidden;
    }

    /* Reduce the length until it's zero or until the last byte is nonzero */
    Bignum normalize ()
    {
        ubyte *digits = data ();
        int j = length ();
        int i = j;
        
        while (i > 0 && !digits [i - 1])
            i --;
        setLength (i);
        /*if (i != j)
            hidden = hidden < 0 ? -i : i;*/
        return *this;
    }

    /* Absolute add */
    Bignum abs_add (Bignum b)
    {
        Bignum a = *this;
        int size_a = a.length (), size_b = b.length ();
        ubyte *data_z;
        int carry = 0;
        Bignum z;
        int i;

        /* Ensure a is the larger of the two: */
        if (size_a < size_b)
        {
            z = a; a = b; b = z;
            i = size_a; size_a = size_b; size_b = i;
        }

        ubyte *data_a = a.data ();
        ubyte *data_b = b.data ();
        
        z.setLength (size_a + 1);
        data_z = z.data ();
        
        for (i = 0; i < size_b; i ++)
        {
            carry = carry + data_a [i] + data_b [i];
            data_z [i] = carry & mask;
            carry = carry >> shift;
        }
        
        for (; i < size_a; i ++)
        {
            carry = carry + data_a [i];
            data_z [i] = carry & mask;
            carry = carry >> shift;
        }
        
        data_z [i] = carry;
        return z.normalize ();
    }
    
    /* Absolute subtraction */
    Bignum abs_sub (Bignum b)
    {
        Bignum a = *this, z;
        int size_a = a.length (), size_b = b.length ();
        ubyte *a_data = a.data (), b_data = b.data (), z_data;
        bool signed = false;
        size_t borrow = 0;
        int i;
    
        /* Ensure a is the larger of the two: */
        if (size_a < size_b)
        {
            signed = true;
            z = a; a = b; b = z;
            i = size_a; size_a = size_b; size_b = i;
            z_data = a_data; a_data = b_data; b_data = z_data;
        }
        else if (size_a == size_b)
        {
            /* Find highest digit where a and b differ: */
            i = size_a;
            while (-- i >= 0 && a_data [i] == b_data [i])
                { }
            
            if (i < 0)
                return fromLong (0);
            
            if (a_data [i] < b_data [i])
            {
                signed = true;
                z = a; a = b; b = z;
                z_data = a_data; a_data = b_data; b_data = z_data;
            }
            
            size_a = size_b = i + 1;
        }
        
        z.setLength (size_a);
        z_data = z.data ();
        borrow = 0;
        
        for (i = 0; i < size_b; i ++)
        {
            borrow = a_data [i] - b_data [i] - borrow;
            z_data [i] = borrow & mask;
            borrow >>= shift;
            borrow &= 1;
        }
        
        for (; i < size_a; i ++)
        {
            borrow = a_data [i] - borrow;
            z_data [i] = borrow & mask;
            borrow >>= shift;
            borrow &= 1;
        }

        assert (borrow == 0);
        if (signed) z.setSigned (true);
        return z.normalize ();
    }
    
    /* Unsigned bignum division with remainder */
    
    Bignum x_divrem (Bignum w1, out Bignum rem)
    {
        Bignum v1 = *this;
        int size_v = v1.length (), size_w = w1.length ();
        ubyte *w_data = w1.data (), v_data = v1.data (), a_data;
        int d = base / (w_data [size_w - 1] + 1);
        Bignum v = mul1 (v1, d);
        Bignum w = mul1 (w1, d);
        Bignum a;
        int j, k;
        
        assert (size_v >= size_w && size_w > 1); /* Assert checks by div() */
        assert (size_w == w.length ()); /* That's how d was calculated */
        
        size_v = v.length ();
        a.setLength (size_v - size_w + 1);
        a_data = a.data ();
        
        for (j = size_v, k = a.length () - 1; k >= 0; j --, k --)
        {
            w_data = w.data (), v_data = v.data ();
            
            int vj = (j >= size_v) ? 0 : v_data [j];
            int carry = 0, q, i;
            
            if (vj == w_data [size_w - 1])
                q = mask;
            else
                q = ((vj << shift) + v_data [j - 1]) / w_data [size_w - 1];
            
            while (w_data [size_w - 2] * q > (((vj << shift) + v_data [j - 1] - q * w_data [size_w - 1]) << shift) + v_data [j - 2])
                q --;
            
            for (i = 0; i < size_w && i + k < size_v; ++i)
            {
                int z = w_data [i] * q;
                int zz = z >> shift;
                
                carry += v_data [i + k] - z + (zz << shift);
                v_data [i + k] = carry & mask;
                carry = carry >> shift;
                carry -= zz;
            }
            
            if (i + k < size_v)
            {
                carry += v_data [i + k];
                v_data [i + k] = 0;
            }
            
            if (carry == 0)
                a_data [k] = q;
            else
            {
                assert (carry == -1);
                a_data [k] = q - 1;
                carry = 0;
                
                for (i = 0; i < size_w && i + k < size_v; i ++)
                {
                    carry = carry + v_data [i + k] + w_data [i];
                    v_data [i + k] = carry & mask;
                    carry = carry >> shift;
                }
            }
        } /* for j, k */
        
        ubyte [64] unused;
        
        a = a.normalize ();
        rem = divrem1 (v, d, unused.ptr);
        /* d receives the (unused) remainder */
        
        return a;
    }
    
    
    /* |this| / |b|, storing the result in div and the remainder in rem */
    void abs_divrem (Bignum b, out Bignum div, out Bignum rem)
    {
        Bignum a = *this, z;
        int size_a = a.length (), size_b = b.length ();
        ubyte *a_data = a.data (), b_data = b.data ();
        
        if (size_b == 0)
            throw new Exception ("long division or modulo by zero");
        
        if (size_a < size_b || (size_a == size_b && a_data [size_a - 1] < b_data [size_b - 1]))
        {
            /* |a| < |b| */
            div = z;
            rem = a;
            return;
        }
        
        if (size_b == 1)
        {
            ubyte vrem = 0;
            
            z = divrem1 (a, b.data () [0], &vrem);
            rem = Bignum.fromLong (vrem);
        }
        else
            z = a.x_divrem (b, rem);
        
        /* Set the signs.
           The quotient z has the sign of a*b;
           the remainder r has the sign of a,
           so a = b*z + r. */
        
        if( (a.hidden < 0) != (b.hidden < 0) )
            z.hidden = -z.hidden;
        if (a.hidden < 0 && rem.hidden)
            rem.hidden = -rem.hidden;
        div = z;
    }

    Bignum add (Bignum b)
    {
        Bignum a = *this, z;
        
        if (a.hidden < 0)
        {
            if (b.hidden < 0)
            {
                z = a.abs_add (b);
                z.hidden = -z.hidden;
            }
            else
                z = b.abs_sub (a);
        }
        else
        {
            if (b.hidden < 0)
                z = a.abs_sub (b);
            else
                z = a.abs_add (b);
        }
        
        return z;
    }
    
    Bignum sub (Bignum b)
    {
        Bignum a = *this, z;

        if (a.hidden < 0)
        {
            if (b.hidden < 0)
                z = a.abs_sub (b);
            else
                z = a.abs_add (b);
            z.hidden = -z.hidden;
        }
        else
        {
            if (b.hidden < 0)
                z = a.abs_add (b);
            else
                z = a.abs_sub (b);
        }
        
        return z;
    }
    
    Bignum mul (Bignum b)
    {
        ubyte *a_data, b_data, z_data;
        int size_a, size_b;
        Bignum a = *this, z;
        int i;
        
        size_a = a.length ();
        size_b = b.length ();
        
        if (size_a > size_b)
        {
            /* we are faster with the small object on the left */
            i = size_a; size_a = size_b; size_b = i;
            z = a; a = b; b = z;
        }
        
        z.setLength (size_a + size_b);
        a_data = a.data ();
        b_data = b.data ();
        z_data = z.data ();
        
        for (i = 0; i < z.hidden; i ++)
            z_data [i] = 0;
        
        for (i = 0; i < size_a; i ++)
        {
            int carry = 0;
            int f = a_data [i];
            int j;
            
            for (j = 0; j < size_b; j ++)
            {
                carry = carry + z_data [i + j] + b_data [j] * f;
                z_data [i + j] = carry & mask;
                carry = carry >> shift;
            }
            
            for (; carry != 0; j ++)
            {
                assert (i + j < z.hidden);
                carry = carry + z_data [i + j];
                z_data [i + j] = carry & mask;
                carry = carry >> shift;
            }
        }
        
        if (a.hidden < 0) z.hidden = -z.hidden;
        if (b.hidden < 0) z.hidden = -z.hidden;
        
        return z.normalize ();
    }
    
    Bignum div (Bignum w)
    {
        Bignum v = *this, div, mod;
        
        v.abs_divrem (w, div, mod);
        return div;
    }
    
    Bignum mod (Bignum w)
    {
        Bignum v = *this, div, mod;
        
        v.abs_divrem (w, div, mod);
        return mod;
    }
    
    int cmp (Bignum b)
    {
        Bignum a = *this;
        int sign;
        
        if (a.hidden != b.hidden)
        {
            if (!a.length () && !b.length ())
                sign = 0;
            else
                sign = a.hidden - b.hidden;
        }
        else
        {
            int i = a.length ();
            ubyte *a_data = a.data ();
            ubyte *b_data = b.data ();
            
            while (-- i >= 0 && a_data [i] == b_data [i])
                { }
                
            if (i < 0)
                sign = 0;
            else
            {
                sign = cast(int) a_data [i] - cast(int) b_data [i];
                if (a.hidden < 0)
                    sign = -sign;
            }
        }
        
        return sign;
    }
    
    /* this << z */
    Bignum shl (int z)
    {
        Bignum m, n;
        int y;
        
        if (!z)
            return *this;
        
        while (z)
        {
            if (z >= 31)
                y = 31, z -= 31;
            else
                y = z, z = 0;
            
            n = fromLong (1 << y);
            m = m.hidden ? m.mul (n) : n;
        }
        
        return mul (m);
    }
    
    /* this >> z */
    Bignum shr (int z)
    {
        Bignum m, n;
        int y;
        
        if (!z)
            return *this;
        
        while (z)
        {
            if (z >= 31)
                y = 31, z -= 31;
            else
                y = z, z = 0;
            
            n = fromLong (1 << y);
            m = m.hidden ? m.mul (n) : n;
        }
        
        return div (m);
    }
    
    /* ~this, implemented as -(this+1) */
    Bignum invert ()
    {
        Bignum y;
        
        y = add (Bignum.fromLong (1));
        y.hidden = -y.hidden;
        return y;
    }
    
    Bignum bitwise (Bignum b, char[] op) /* Where op is '&', '|', or '^' */
    {
        int sizea, sizeb, sizez;
        Bignum a = *this, z, v;
        int maska = 0, maskb = 0;
        ubyte *adata, bdata, zdata;
        int diga, digb;
        int negz, i;
        
        if (a.hidden < 0)
            a = a.invert (), maska = mask;
        if (b.hidden < 0)
            b = b.invert (), maskb = mask;
        
        negz = 0;
        if (op == "^")
        {
            if (maska != maskb)
                maska ^= mask, negz = -1;
        }
        else if (op == "&")
        {
            if (maska && maskb)
                op = "|", maska ^= mask, maskb ^= mask, negz = -1;
        }
        else if (op == "|")
        {
            if (maska || maskb)
                op = "&", maska ^= mask, maskb ^= mask, negz = -1;
        }
        
        sizea = a.hidden;
        sizeb = b.hidden;
        sizez = op == "&" ? (maska ? sizeb : (maskb ? sizea : imin (sizea, sizeb)))
                          : imax (sizea, sizeb);
        
        z.setLength (sizez);
        adata = a.data ();
        bdata = b.data ();
        zdata = z.data ();
        
        for (int ii = 0; ii < sizez; ii ++)
        {
            diga = (ii < sizea ? adata [ii] : 0) ^ maska;
            digb = (ii < sizeb ? bdata [ii] : 0) ^ maskb;
            switch (op)
            {
                case "&": zdata [ii] = diga & digb; break;
                case "|": zdata [ii] = diga | digb; break;
                case "^": zdata [ii] = diga ^ digb; break;
            }
        }
        
        z.normalize ();
        if (negz == 0)
            return z;
        return z.invert ();
    }
	
    Bignum or  (Bignum b) { return bitwise (b, "|"); } /* a | b */
    Bignum and (Bignum b) { return bitwise (b, "&"); } /* a & b */
    Bignum xor (Bignum b) { return bitwise (b, "^"); } /* a ^ b */
    Bignum com ()         { return invert ();        } /* ~a */
}

extern (C)
long _dcent_div (long ca, long cb)
{
    Bignum a, b, c;
    
    a.hidden = ca < 0 ? -16 : 16;
    a.pointer = cast(ubyte *) &ca;
    if (ca < 0) ca = -ca;
    a = a.normalize ();
        
    b.hidden = cb < 0 ? -16 : 16;
    b.pointer = cast(ubyte *) &cb;
    if (cb < 0) cb = -cb;
    b = b.normalize ();
    
    c = a.div (b);
    c.setLength (16);
    if (c.hidden < 0)
        return -*cast(long *) c.pointer;
    return *cast(long *) c.pointer;
}

extern (C)
long _dcent_mul (long ca, long cb)
{
    Bignum a, b, c;
    
    a.hidden = ca < 0 ? -16 : 16;
    a.pointer = cast(ubyte *) &ca;
    if (ca < 0) ca = -ca;
    a = a.normalize ();
        
    b.hidden = cb < 0 ? -16 : 16;
    b.pointer = cast(ubyte *) &cb;
    if (cb < 0) cb = -cb;
    b = b.normalize ();
    
    c = a.mul (b);
    c.setLength (16);
    
    if (c.hidden < 0)
        return -*cast(long *) c.pointer;
    return *cast(long *) c.pointer;
}

extern (C)
long _dcent_shr (int bits, long a)
{
    long *b = cast(long *) &a;
    
    if (bits < 64)
    {
        b [0] = (b [0] >>> bits) | (b [1] << (64 - bits));
        b [1] = b [1] >> bits;
    }
    else
    {
        b [0] = b [1] >> (bits - 64);
        b [1] = b [1] < 0 ? -1 : 0;
    }
    
    return a;
}

extern (C)
int _dcent_compare (long a, long b)
{
    long d = a - b;
    
    if (cast(long) d < 0)
        return -1;
    if (cast(long) d > 0)
        return 1;
    return 0;
}

/* Some of these are stack behaviour-dependent */

extern (C) Bignum _dbignum_from_int (int y) { return Bignum.fromLong (y); }
extern (C) Bignum _dbignum_from_long (long y) { return Bignum.fromLong (y); }
extern (C) Bignum _dbignum_from_real (real y) { return Bignum.fromReal (y); }
    
extern (C) int _dbignum_to_int (Bignum x) { return x.toInt (); }
extern (C) real _dbignum_to_real (Bignum x) { return x.toReal (); }

extern (C) Bignum _dbignum_add (Bignum x, Bignum y) { return x.add (y); }
extern (C) Bignum _dbignum_sub (Bignum x, Bignum y) { return y.sub (x); }
extern (C) Bignum _dbignum_rsub(Bignum x, Bignum y) { return x.sub (y); }
extern (C) Bignum _dbignum_mod (Bignum x, Bignum y) { return x.mod (y); }
extern (C) Bignum _dbignum_mul (Bignum x, Bignum y) { return x.mul (y); }
extern (C) Bignum _dbignum_div (Bignum x, Bignum y) { return x.div (y); }
extern (C) int    _dbignum_cmp (Bignum x, Bignum y) { return y.cmp (x); }
extern (C) Bignum _dbignum_shl (Bignum x, int y)    { return x.shl (y); }
extern (C) Bignum _dbignum_shr (Bignum x, int y)    { return x.shr (y); }
extern (C) Bignum _dbignum_and (Bignum x, Bignum y) { return x.and (y); }
extern (C) Bignum _dbignum_or  (Bignum x, Bignum y) { return x.or  (y); }
extern (C) Bignum _dbignum_xor (Bignum x, Bignum y) { return x.xor (y); }
extern (C) Bignum _dbignum_com (Bignum x)           { return x.com ();  }

extern (C) int _dbignum_eq (Bignum x, Bignum y) { return x.eq (y); }

debug( UnitTest ) unittest
{

    
    int a = 43288;
    int b = 3292;
    Bignum v = Bignum.fromLong (a);
    Bignum w = Bignum.fromLong (b);
    Bignum x = v.mod (w);
    
    printf ("Yay %d %% %d = %d\n", v.toInt (), w.toInt (), x.toInt ());
    printf ("Yog %d %% %d = %d\n", a, b, a % b);
}

version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
