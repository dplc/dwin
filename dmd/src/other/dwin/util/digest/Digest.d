
// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Nov 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.util.digest.Digest;

private import  tango.util.digest.Md5,
                tango.util.digest.Crc32,
                tango.util.digest.Sha1,
                tango.util.digest.Sha256,
                tango.util.digest.Sha512,
                tango.util.digest.Tiger,

                tango.io.FilePath,
                tango.io.device.File;


//MySQL提供了4个函数用于哈希加密：PASSWORD, ENCRYPT, SHA1和MD5, 所以这里至少要提供sha1和md5的实现


Md5 getMd5(FilePath path)
{
    if(!path.exists)
        return null;
    ubyte[] result = cast(ubyte[]) File.get(path.dup.native.toString());
    return getMd5( result );
}

Md5 getMd5(char[] src)
{
    return getMd5(cast(ubyte[]) src);
}

Md5 getMd5(ubyte[] src)
{
    Md5 h = new Md5();
    h.update(src);
    return h;
}

debug(UnitTest) unittest
{

        static char[][] strings =
        [
                "",
                "a",
                "abc",
                "message digest",
                "abcdefghijklmnopqrstuvwxyz",
                "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789",
                "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
        ];

        static char[][] results =
        [
                "d41d8cd98f00b204e9800998ecf8427e",
                "0cc175b9c0f1b6a831c399e269772661",
                "900150983cd24fb0d6963f7d28e17f72",
                "f96b697d7cb7938d525a2f31aaf161d0",
                "c3fcd3d76192e4007dfb496cca67e13b",
                "d174ab98d277d9f5a5611c2c9f419d9f",
                "57edf4a22be3c955ac49da2e2107b67a"
        ];

        foreach(k,v; strings)
        {
            assert(getMd5(v).hexDigest == results[k] );
        }

}
//getMd5



Crc32 getCrc32(FilePath path)
{
    if(!path.exists)
        return null;
    ubyte[] result = cast(ubyte[]) File.get(path.dup.native.toString);
    return getCrc32( result );
}

Crc32 getCrc32(char[] src)
{
    return getCrc32(cast(ubyte[]) src);
}

Crc32 getCrc32(ubyte[] src)
{
    Crc32 h = new Crc32();
    h.update(src);
    return h;
}
//getCrc32



Tiger getTiger(FilePath path)
{
    if(!path.exists)
        return null;
    ubyte[] result = cast(ubyte[]) File.get(path.dup.native.toString);
    return getTiger( result );
}

Tiger getTiger(char[] src)
{
    return getTiger(cast(ubyte[]) src);
}

Tiger getTiger(ubyte[] src)
{
    Tiger h = new Tiger();
    h.update(src);
    return h;
}
debug(UnitTest) unittest
{
        static char[][] strings = [
                "",
                "abc",
                "Tiger",
                "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-",
                "ABCDEFGHIJKLMNOPQRSTUVWXYZ=abcdefghijklmnopqrstuvwxyz+0123456789",
                "Tiger - A Fast New Hash Function, by Ross Anderson and Eli Biham",
                "Tiger - A Fast New Hash Function, by Ross Anderson and Eli Biham, proceedings of Fast Software Encryption 3, Cambridge.",
                "Tiger - A Fast New Hash Function, by Ross Anderson and Eli Biham, proceedings of Fast Software Encryption 3, Cambridge, 1996.",
                "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-"
        ];
        static char[][] results = [
                "24f0130c63ac933216166e76b1bb925ff373de2d49584e7a",
                "f258c1e88414ab2a527ab541ffc5b8bf935f7b951c132951",
                "9f00f599072300dd276abb38c8eb6dec37790c116f9d2bdf",
                "87fb2a9083851cf7470d2cf810e6df9eb586445034a5a386",
                "467db80863ebce488df1cd1261655de957896565975f9197",
                "0c410a042968868a1671da5a3fd29a725ec1e457d3cdb303",
                "ebf591d5afa655ce7f22894ff87f54ac89c811b6b0da3193",
                "3d9aeb03d1bd1a6357b2774dfd6d5b24dd68151d503974fc",
                "00b83eb4e53440c576ac6aaee0a7485825fd15e70a59ffe4"
        ];
        foreach(k,v; strings)
            assert(getTiger(v).hexDigest == results[k]);

}
//getTiger



Sha1 getSha1(FilePath path)
{
    if(!path.exists)
        return null;
    ubyte[] result = cast(ubyte[]) File.get(path.dup.native.toString);
    return getSha1( result );
}

Sha1 getSha1(char[] src)
{
    return getSha1(cast(ubyte[]) src);
}

Sha1 getSha1(ubyte[] src)
{
    Sha1 h = new Sha1();
    h.update(src);
    return h;
}

debug(UnitTest) unittest
{


}
//getSha1


Sha256 getSha256(FilePath path)
{
    if(!path.exists)
        return null;
    ubyte[] result = cast(ubyte[]) File.get(path.dup.native.toString);
    return getSha256( result );
}

Sha256 getSha256(char[] src)
{
    return getSha256(cast(ubyte[]) src);
}

Sha256 getSha256(ubyte[] src)
{
    Sha256 h = new Sha256();
    h.update(src);
    return h;
}

debug(UnitTest) unittest
{
        static char[][] strings =
        [
                "abc",
                "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
        ];

        static char[][] results =
        [
                "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad",
                "248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1"
        ];

        foreach(k,v; strings)
            assert(getSha256(v).hexDigest == results[k]);

}
//getSha256




Sha512 getSha512(FilePath path)
{
    if(!path.exists)
        return null;
    ubyte[] result = cast(ubyte[]) File.get(path.dup.native.toString);
    return getSha512( result );
}

Sha512 getSha512(char[] src)
{
    return getSha512(cast(ubyte[]) src);
}

Sha512 getSha512(ubyte[] src)
{
    Sha512 h = new Sha512();
    h.update(src);
    return h;
}

debug(UnitTest) unittest
{
        static char[][] strings =
        [
                "",
                "abc",
                "abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu"
        ];

        static char[][] results =
        [
                "cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e",
                "ddaf35a193617abacc417349ae20413112e6fa4e89a97ea20a9eeee64b55d39a2192992a274fc1a836ba3c23a3feebbd454d4423643ce80e2a9ac94fa54ca49f",
                "8e959b75dae313da8cf4f72814fc143f8f7779c6eb9f7fa17299aeadb6889018501d289e4900f7e4331b99dec4b5433ac7d329eeb6dd26545e96e55b874be909"
        ];

        foreach(k,v; strings)
            assert(getSha512(v).hexDigest == results[k]);

}
//getSha512

