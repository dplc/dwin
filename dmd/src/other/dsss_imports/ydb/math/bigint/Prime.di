
module ydb.math.bigint.Prime;

private import ydb.math.bigint.Bigint;
private import ydb.math.bigint.Modexp;
private import ydb.math.bigint.MathPrime;
private import ydb.math.bigint.IntException;

private import std.intrinsic;
private import tango.math.random.Kiss;


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
	This is the all-important primality test
*/

enum { DEFINITELY_FALSE=0, PROBABLY_TRUE, DEFINITELY_TRUE };

int isProbablyPrime(Bigint p)
{
	return isProbablyPrime(p, 10);
}

int isProbablyPrime(Bigint p, size_t attempts)
out(r)
{
	switch (r)
	{
	case DEFINITELY_FALSE:
	case PROBABLY_TRUE:
	case DEFINITELY_TRUE:
		break;
	default:
		assert(false);
	}
	version(Paranoid)
	{
		// In the Paranoid build, we confirm that, for numbers < 0x100000000,
		// isPrime() and isProbablyPrime(), both agree with each other.

		if (p.isUint())
		{
			uint n = p.toUint();
			assert ((r!=0) == isPrime(n));
		}
	}
}
body
{
	if (p < 2) return DEFINITELY_FALSE;	// This takes care of 1, 0 and all negative numbers
										// What we are left with is guaranteed positiive
	if (p.isUint())
	{
		uint n = p.toUint();
		{
			version(Paranoid)
			{
				if (n < 4) return DEFINITELY_TRUE;	// In a paranoid build, we remain "unsure" about any
													// number bigger than 4.
			}
			else
			{
				// In a non-paranoid build, we can be certain about every uint.
				return isPrime(n) ? DEFINITELY_TRUE : DEFINITELY_FALSE;
			}
		}
	}
	if ((p & 1u) == 0)
	{
		return DEFINITELY_FALSE;
	}
	for (int i=attempts-1; i>=0; --i)
	{
		if (!isProbablyPrimeLegendre(p))
		{
			return DEFINITELY_FALSE;
		}
	}
	return PROBABLY_TRUE;
}

private
{
	bool isProbablyPrimeLegendre(Bigint p)
	in
	{
		assert(p > 4);
		assert((p & 1u) == 1);
	}
	body
	{
		Bigint a;
		uint[] z;
		z.length = p.end;
		uint mask = (1 << (bsr(p[p.end-1]) + 1)) - 1;
		do
		{
			for (int i=0; i<p.end; ++i)
			{
				//z[i] = rand(); // OK, because this does not need to be cryptographically strong
				z[i] = Kiss.instance.toInt(); // OK, because this does not need to be cryptographically strong
			}
			z[p.end-1] &= mask;
			a = new Bigint(z, false);
		}
		while (a >= p);

		int j = jacobi(a,p);
		Bigint lhs = (j<0) ? p+j : new Bigint(j);
		Bigint e = (p-1)>>>1;
		Bigint rhs = modPow(a,e,p);
		return (lhs == rhs) ? true : false;
	}
}

/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Functions to find nearby primes
*/

Bigint getProbablePrimeGreaterEqual(Bigint n)
{
	if (n <= 2) return Bigint.TWO;
	for (n=n|1; n!=1; n=n+2)
	{
		if (isProbablyPrime(n)) return n;
	}
}

Bigint getProbablePrimeGreaterEqual(Bigint n, size_t attempts)
{
	if (n <= 2) return Bigint.TWO;
	for (n=n|1; n!=1; n=n+2)
	{
		if (isProbablyPrime(n, attempts)) return n;
	}
}

Bigint getProbablePrimeLessEqual(Bigint n)
{
	if (n < 2) throw new IntException("getProbablePrimeLessEqual(n) not defined for n < 2");
	for (n=(n|1)-2; n!=1; n=n-2)
	{
		if (isProbablyPrime(n)) return n;
	}
	return Bigint.TWO;
}

Bigint getProbablePrimeLessEqual(Bigint n, size_t attempts)
{
	if (n < 2) throw new IntException("getProbablePrimeLessEqual(n) not defined for n < 2");
	for (n=(n|1)-2; n!=1; n=n-2)
	{
		if (isProbablyPrime(n, attempts)) return n;
	}
	return Bigint.TWO;
}

Bigint getProbablePrimeGreater(Bigint n)
{
	return getProbablePrimeGreaterEqual(n+1);
}

Bigint getProbablePrimeGreater(Bigint n, size_t attempts)
{
	return getProbablePrimeGreaterEqual(n+1, attempts);
}

Bigint getProbablePrimeLess(Bigint n)
{
	return getProbablePrimeLessEqual(n-1);
}

Bigint getProbablePrimeLess(Bigint n, size_t attempts)
{
	return getProbablePrimeLessEqual(n-1, attempts);
}

/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	The Jacobi symbol
*/

int jacobi(Bigint a, Bigint n)
in
{
	assert(n >= 0);
	assert((n & 1u) == 1);
}
body
{
	Bigint b;
	int j = 1;
	uint n8;
	while (!a.equalsZero)
	{
		while ((a & 1u) == 0)
		{
			a = a >>> 1u;
			n8 = n & 7u;
			if ((n8 == 3u) || (n8 == 5u)) j = -j;
		}
		b = a;
		a = n;
		n = b;
		if (((a & 3u) == 3u) && ((n & 3u) == 3u)) j = -j;
		a = a % n;
	}
	return (n == 1) ? j : 0;
}

//=======================================================================================================

version(Paranoid)
{
	unittest
	{
		// Give the jacobi function a damn good test
		Bigint a,b;

		a = new Bigint("0xB491087F_5E666C48_96D44FDE_E6EEB574");
		b = new Bigint("0x74FB8A89_127E3A79_3622C8FB_85CD2847");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0x4AF1671C_077E3FB3_68FF7D90_3D953866");
		b = new Bigint("0x41971D2A_8E282742_C52C8E37_064B75CB");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x5B8512B9_4A5B7F70_A455910B_ECAF73E3");
		b = new Bigint("0x8D0B977C_FF670D67_56E7826C_D9DC3A5D");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0x4C49A1A1_F4048915_7E799556_6E1BB14B");
		b = new Bigint("0xCD0763B4_0D7394D3_2474EE00_D11D632B");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x5F559504_2F18DB9D_F18E5D5E_1195F82A");
		b = new Bigint("0xB2B0286A_DA9C4BE6_D3F12D6B_410D693F");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0xF5037185_7377BB04_D92E30E3_B6E3C9FD");
		b = new Bigint("0xFC769BDF_5CBB5AA7_3E686320_EB58403B");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0xB2A1C094_785D3393_79F7BC91_10098651");
		b = new Bigint("0x108E426F_9FBA3AF1_37031C6F_453DAFD7");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0xE96A98B0_DD5E858A_25FA7404_C02E85AB");
		b = new Bigint("0x96803860_A7337003_E2070241_47E0D119");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0xA7596AFD_5F8B5115_6B9A2110_FDE88145");
		b = new Bigint("0x1A66DF32_D4A14974_DDBD1217_D2A07F59");
		assert(jacobi(a,b) == 0);
		a = new Bigint("0xA7B9B5E7_A8B0BC33_BDE83F60_F66578D0");
		b = new Bigint("0x05A4028B_83740BEF_BDCD487D_73BD7169");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0xF6C77351_9C893E0D_C21B778A_15E098BA");
		b = new Bigint("0xF91A1784_DD65B896_DE50D24D_586B30F5");
		assert(jacobi(a,b) == 0);
		a = new Bigint("0x2B40C766_42736D1F_729AE1A6_CAF09121");
		b = new Bigint("0x51093349_B19E34EE_26410AC2_C5B3EF31");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0x01B33E51_F6430CDF_159785FF_B6EECADF");
		b = new Bigint("0x6C0F696F_EEDE49F4_00D3D17C_E421C727");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0x762F792F_FF57DF2B_2B49E8C5_6FCE7908");
		b = new Bigint("0xA835C636_64CEB4D5_66505CB8_9E9D7603");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x4722A982_CCE680C9_18FDA4EE_EEDB4F03");
		b = new Bigint("0xF99BF268_C4AE0931_73BD44FF_2A09334F");
		assert(jacobi(a,b) == 0);
		a = new Bigint("0x9DE41532_EE4ED214_36CB2F10_92F40D28");
		b = new Bigint("0xAFAB4F44_DE5248A9_B33910C6_E2872B91");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0x8472F4D0_A030C25D_DCA5E634_54316504");
		b = new Bigint("0x2E0A2913_8709D09C_A99B993B_7411F00D");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0x71E4E601_EFB6F31D_CB6EB1A0_80145940");
		b = new Bigint("0x799FB97E_833EDAE2_B2FFE313_DD15C29B");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0x89E95A10_EA7F090F_89643BCC_E1CBA334");
		b = new Bigint("0x9EFCF2F0_E9A5EA86_38F6DDCF_70D072C3");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x3553F530_A3CCE32B_1417D3AC_FAF4AA50");
		b = new Bigint("0x62B4B624_F2D6A117_E8AAA16A_4DAD2857");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0x78BF9779_D01631B6_57FB1F75_BB503B05");
		b = new Bigint("0xD2EE41AC_0F267F82_B608D8BD_5EAEC2A7");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0xBEC7C504_662EAC88_110F8E7F_41CF6716");
		b = new Bigint("0x9B2867AF_8B04E9DC_3A2CB599_FF88AC1B");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x88EBA6DC_68AE8A25_4F982831_ACD3EE37");
		b = new Bigint("0xB3B110DE_CF8AE31C_A2762C5B_DA7C2213");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0xBDA16A3A_21924BF8_8E4615B1_AEC224A6");
		b = new Bigint("0x63071AC6_D101CC44_9C311E22_C21B1325");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0xE7E37905_470BCEC5_387A2281_80722136");
		b = new Bigint("0x164C6650_3F788811_837B2BDC_7C81E791");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x06058196_FDFEC957_FF49624E_8F8046B6");
		b = new Bigint("0x1E3232DC_1F78C8E3_CC9B01FC_2C7E3387");
		assert(jacobi(a,b) == 0);
		a = new Bigint("0x344F20C1_95C1666C_6FE4E8E1_CF7148DD");
		b = new Bigint("0xB0927117_21B633E4_6D827CC0_7B5F1921");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0xAD87C698_08FB6D1E_D38E6697_5BE4DE28");
		b = new Bigint("0x522CDA03_19750539_30AD4238_CB2F4771");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0xC8F8D9B0_CB82E686_F6FA9581_A09E278F");
		b = new Bigint("0xF37979EF_062ED557_E5B2F0D2_CCA080CF");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0xFDA99FCB_74E6A156_052AD4AE_4608B8E2");
		b = new Bigint("0xC1713C5A_EFD30183_E7877937_5A6C809F");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0x5FCB6751_EE7929E3_FB85A93A_D74F9012");
		b = new Bigint("0x21739F10_3E8DB626_2CD355FA_83334A6F");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x09D8AF93_19F3EA16_1FF1DFB4_0F498670");
		b = new Bigint("0x3CFEFC1E_962526D5_F9319E3C_9B942461");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x75FD6803_868338E0_403E9FAC_38ED7AC1");
		b = new Bigint("0xC4505E5A_A3D1F623_6B481B80_B71E78A1");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0xC8C86E65_C0C58EEE_EC63AEE2_B2682CBA");
		b = new Bigint("0x2EACE0BF_BC270229_5767F1A0_1A22A209");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0xC57B8E02_EA42E821_CA01A42F_8C618E1F");
		b = new Bigint("0x8573627C_F0FD8735_29E580A6_12A9E975");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x22C5BEFE_A1364B1E_7B614CF2_E4FADF75");
		b = new Bigint("0x770000E8_D3ED7103_1B497D5C_D3969B81");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x4A279993_6B345BB8_7217CE93_82A33EC9");
		b = new Bigint("0x1CC25ECE_641199F5_C5788C02_D61F9A31");
		assert(jacobi(a,b) == 0);
		a = new Bigint("0x4727BCBF_A9C3FD02_C27F9710_E5F1F039");
		b = new Bigint("0x80BF9919_EC343F5C_2CD7E971_DA8ADF0D");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0x0E521046_75B30630_1DB4A9D4_5B4DA6F2");
		b = new Bigint("0x817B9B73_AF2194C0_7A305E46_4717EBF5");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x68B46BE1_7E692C63_2608CE5F_277F26FE");
		b = new Bigint("0x78F4F199_274B688C_DB8F28C5_9D18C5E3");
		assert(jacobi(a,b) == 0);
		a = new Bigint("0x344A01E8_BAEF8366_24CFCD49_CA532A2F");
		b = new Bigint("0xDAF1A2E3_AAD2D3C8_AA85B1C4_47283DAB");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0xEB53DA77_67205493_66CB5A7E_0947A58E");
		b = new Bigint("0x7ED21C8F_1BE47981_EF01BF9C_12DA0297");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0x916BB67B_1363CBC1_0FD1C5B5_7A018EFA");
		b = new Bigint("0xB4EEE085_71ABE95F_3130EC15_A83D19F3");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0xB073A95E_4A431DEB_5AC7B208_D92E74D6");
		b = new Bigint("0x241C1DB6_7CAE5C32_FD4D2ADB_49AE56C5");
		assert(jacobi(a,b) == 1);
		a = new Bigint("0x24795FBB_E2C87FF9_BB398AA4_73877D91");
		b = new Bigint("0xD9839622_B5420184_12E8333D_CC09C5AD");
		assert(jacobi(a,b) == 0);
		a = new Bigint("0x668AAFCE_F7958D99_FD13B620_1970C8F3");
		b = new Bigint("0x177063D0_7746E325_373A7774_49122A01");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x1E3D06DA_2E04958E_28042C2B_40CE928F");
		b = new Bigint("0xD3E919C8_696DA631_D829E9E8_3EFB301D");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x9275F823_8E6A96AC_08DC303F_4E1608CC");
		b = new Bigint("0xB3396244_95731110_4C9B5943_FEA76133");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0x1F86E171_C66697AC_DD8AC83D_663F1D6F");
		b = new Bigint("0x585CABB2_FD1692C3_EEC6C944_B62348F9");
		assert(jacobi(a,b) == -1);
		a = new Bigint("0xF8D6785F_659C6674_23E2D9DB_77162E9E");
		b = new Bigint("0x814510FC_ECFC266F_B55C81FA_576B4B8F");
		assert(jacobi(a,b) == 1);
	}
}


version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
