
// Written in the D programming language.

/*******************************************************************************
        Description:   The class file to encode string or decode string in base algorithm 
        
        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: Dec 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

        See_Also:       C# version http://blog.csdn.net/Knight94/archive/2006/07/04/876493.aspx
        
        Date:           Created  Oct.8, 2005, Modified: Jul.4, 2006
                        Modified by yidabu : 4 Dec 2007
        
       Examples:
        ---
            char[] src = "yidabu";
            char[] key = "hello";
            char[] strEncryptedData = Base64.encrypt( src, key );

            if( strEncryptedData )
                Stdout(strEncryptedData ).newline;

            //Decrypt data
            char[] strDecryptedData = Base64.decrypt(strEncryptedData, key );
            if(strDecryptedData)
                Stdout(strDecryptedData).newline;
        ---
*******************************************************************************/

module dwin.io.crypt.Base64;
 


public class Base64
{
    /// <summary>
    /// Create base64 char array using default base64 char array
    /// </summary>
    /// <param name="CreatePara"></param>
    /// <returns>return the new base64 char array</returns>

    private static char[] CreateBase64Char( ref char[] CreatePara )
    {
        char[64] BaseTable=[
            'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',

            'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',

            '0','1','2','3','4','5','6','7','8','9','+','/'];

        const int CREATE_TYPE = 8;
        byte bParaValue = 0;
        byte bTemp;

        for( int i = 0; i < CreatePara.length; i++ )
        {
            bTemp = cast(byte)( CreatePara[i] );
            switch( bTemp % CREATE_TYPE )
            {
                case 1:
                    // 00000001
                    bTemp =cast(byte)( bTemp ^ 0x01 );
                    break;
                case 2:
                    // 00000010
                    bTemp =cast(byte)( bTemp ^ 0x02 );
                    break;
                case 3:
                    // 00000100
                    bTemp =cast(byte)( bTemp ^ 0x04 );
                    break;
                case 4:
                    // 00001000
                    bTemp =cast(byte)( bTemp ^ 0x08 );
                    break;
                case 5:
                    // 00010000
                    bTemp =cast(byte)( bTemp ^ 0x10 );
                    break;
                case 6:
                    // 00100000
                    bTemp =cast(byte)( bTemp ^ 0x20 );
                    break;
                case 7:
                    // 01000000
                    bTemp =cast(byte)( bTemp ^ 0x40 );
                    break;
                default:
                    // 10000000
                    bTemp =cast(byte)( bTemp ^ 0x80 );
                    break;
            }
            bParaValue =cast(byte)( bParaValue ^ bTemp );
        }
        
        char chrTemp;
        int nIndex;
        switch( bParaValue % CREATE_TYPE )
        {
            case 1:
                // Exechange 0 <--> 1, 2 <--> 3, 4 <--> 5, 6 <--> 7
                for( int i = 0; i < BaseTable.length / CREATE_TYPE; i++ )
                {
                    nIndex = i * CREATE_TYPE;
                    chrTemp = BaseTable[nIndex];
                    BaseTable[nIndex] = BaseTable[nIndex + 1];
                    BaseTable[nIndex + 1] = chrTemp;
                    chrTemp = BaseTable[nIndex + 2];
                    BaseTable[nIndex + 2] = BaseTable[nIndex + 3];
                    BaseTable[nIndex + 3] = chrTemp;
                    chrTemp = BaseTable[nIndex + 4];
                    BaseTable[nIndex + 4] = BaseTable[nIndex + 5];
                    BaseTable[nIndex + 5] = chrTemp;
                    chrTemp = BaseTable[nIndex + 6];
                    BaseTable[nIndex + 6] = BaseTable[nIndex + 7];
                    BaseTable[nIndex + 7] = chrTemp;
                }
                break;

            case 2:
                // Exechange 0 <--> 2, 1 <--> 3, 4 <--> 6, 5 <--> 7
                for( int i = 0; i < BaseTable.length / CREATE_TYPE; i++ )
                {
                    nIndex = i * CREATE_TYPE;
                    chrTemp = BaseTable[nIndex];
                    BaseTable[nIndex] = BaseTable[nIndex + 2];
                    BaseTable[nIndex + 2] = chrTemp;
                    chrTemp = BaseTable[nIndex + 1];
                    BaseTable[nIndex + 1] = BaseTable[nIndex + 3];
                    BaseTable[nIndex + 3] = chrTemp;
                    chrTemp = BaseTable[nIndex + 4];
                    BaseTable[nIndex + 4] = BaseTable[nIndex + 6];
                    BaseTable[nIndex + 6] = chrTemp;
                    chrTemp = BaseTable[nIndex + 5];
                    BaseTable[nIndex + 5] = BaseTable[nIndex + 7];
                    BaseTable[nIndex + 7] = chrTemp;
                }
                break;

            case 3:
                // Exechange 0 <--> 3, 1 <--> 2, 4 <--> 7, 5 <--> 6
                for( int i = 0; i < BaseTable.length / CREATE_TYPE; i++ )
                {
                    nIndex = i * CREATE_TYPE;
                    chrTemp = BaseTable[nIndex];
                    BaseTable[nIndex] = BaseTable[nIndex + 3];
                    BaseTable[nIndex + 3] = chrTemp;
                    chrTemp = BaseTable[nIndex + 1];
                    BaseTable[nIndex + 1] = BaseTable[nIndex + 2];
                    BaseTable[nIndex + 2] = chrTemp;
                    chrTemp = BaseTable[nIndex + 4];
                    BaseTable[nIndex + 4] = BaseTable[nIndex + 7];
                    BaseTable[nIndex + 7] = chrTemp;
                    chrTemp = BaseTable[nIndex + 5];
                    BaseTable[nIndex + 5] = BaseTable[nIndex + 6];
                    BaseTable[nIndex + 6] = chrTemp;
                }
                break;

            case 4:
                // Mirror exechange
                for( int i = 0; i < BaseTable.length / CREATE_TYPE; i++ )
                {
                    nIndex = i * CREATE_TYPE;
                    chrTemp = BaseTable[nIndex];
                    BaseTable[nIndex] = BaseTable[nIndex + CREATE_TYPE - 1];
                    BaseTable[nIndex + CREATE_TYPE - 1] = chrTemp;
                    chrTemp = BaseTable[nIndex + 1];
                    BaseTable[nIndex + 1] = BaseTable[nIndex + CREATE_TYPE - 2];
                    BaseTable[nIndex + CREATE_TYPE - 2] = chrTemp;
                    chrTemp = BaseTable[nIndex + 2];
                    BaseTable[nIndex + 2] = BaseTable[nIndex + CREATE_TYPE - 3];
                    BaseTable[nIndex + CREATE_TYPE - 3] = chrTemp;
                    chrTemp = BaseTable[nIndex + 3];
                    BaseTable[nIndex + 3] = BaseTable[nIndex + CREATE_TYPE - 4];
                    BaseTable[nIndex + CREATE_TYPE - 4] = chrTemp;
                }
                break;

            case 5:
                // Exechange 0 <--> 4, 1 <--> 5, 2 <--> 6, 3 <--> 7
                for( int i = 0; i < BaseTable.length / CREATE_TYPE; i++ )
                {
                    nIndex = i * CREATE_TYPE;
                    chrTemp = BaseTable[nIndex];
                    BaseTable[nIndex] = BaseTable[nIndex + 4];
                    BaseTable[nIndex + 4] = chrTemp;
                    chrTemp = BaseTable[nIndex + 1];
                    BaseTable[nIndex + 1] = BaseTable[nIndex + 5];
                    BaseTable[nIndex + 5] = chrTemp;
                    chrTemp = BaseTable[nIndex + 2];
                    BaseTable[nIndex + 2] = BaseTable[nIndex + 6];
                    BaseTable[nIndex + 6] = chrTemp;
                    chrTemp = BaseTable[nIndex + 3];
                    BaseTable[nIndex + 3] = BaseTable[nIndex + 7];
                    BaseTable[nIndex + 7] = chrTemp;
                }
                break;

            case 6:
                // Exechange 0 <--> 5, 1 <--> 6, 2 <--> 7, 3 <--> 4
                for( int i = 0; i < BaseTable.length / CREATE_TYPE; i++ )
                {
                    nIndex = i * CREATE_TYPE;
                    chrTemp = BaseTable[nIndex];
                    BaseTable[nIndex] = BaseTable[nIndex + 5];
                    BaseTable[nIndex + 5] = chrTemp;
                    chrTemp = BaseTable[nIndex + 1];
                    BaseTable[nIndex + 1] = BaseTable[nIndex + 6];
                    BaseTable[nIndex + 6] = chrTemp;
                    chrTemp = BaseTable[nIndex + 2];
                    BaseTable[nIndex + 2] = BaseTable[nIndex + 7];
                    BaseTable[nIndex + 7] = chrTemp;
                    chrTemp = BaseTable[nIndex + 3];
                    BaseTable[nIndex + 3] = BaseTable[nIndex + 4];
                    BaseTable[nIndex + 4] = chrTemp;
                }
                break;

            case 7:
                // Exechange 0 <--> 6, 1 <--> 7, 2 <--> 4, 3 <--> 5
                for( int i = 0; i < BaseTable.length / CREATE_TYPE; i++ )
                {
                    nIndex = i * CREATE_TYPE;
                    chrTemp = BaseTable[nIndex];
                    BaseTable[nIndex] = BaseTable[nIndex + 6];
                    BaseTable[nIndex + 6] = chrTemp;
                    chrTemp = BaseTable[nIndex + 1];
                    BaseTable[nIndex + 1] = BaseTable[nIndex + 7];
                    BaseTable[nIndex + 7] = chrTemp;
                    chrTemp = BaseTable[nIndex + 2];
                    BaseTable[nIndex + 2] = BaseTable[nIndex + 4];
                    BaseTable[nIndex + 4] = chrTemp;
                    chrTemp = BaseTable[nIndex + 3];
                    BaseTable[nIndex + 3] = BaseTable[nIndex + 5];
                    BaseTable[nIndex + 5] = chrTemp;
                }
                break;

            default:
                break;

        }

        return BaseTable.dup;
    }





    /// <summary>
    /// Encode string at specific parameter
    /// </summary>
    /// <param name="Para"></param>
    /// <param name="input"></param>
    /// <returns>return encoded string</returns>

    private static char[] GetEncoded( char[] Para, byte[] input )
    {
        char[] lookupTable;
        int len, len2;
        int blockCount;
        int paddingCount;

        len = input.length;
        if((len % 3)==0)
        {
            paddingCount = 0;
            blockCount = len / 3;
        }
        else
        {
            paddingCount = 3 - (len % 3);//need to add padding
            blockCount=(len+paddingCount) / 3;
        }
        len2=len+paddingCount;//or blockCount *3
        
        byte[] source2 = input.dup;
        source2.length = len2;
        if(paddingCount)
            source2[len .. len2] = 0;
        /*
        byte[] source2;
        source2=new byte[len2];
        
        //copy data over insert padding
        for (int x=0; x<len2; x++)
        {
            if (x<len)
            {
                source2[x] = input[x];
            }
            else
            {
                source2[x] = 0;
            }
        }
        */
        byte b1, b2, b3;
        byte temp, temp1, temp2, temp3, temp4;
        byte[] buffer=new byte[blockCount*4];
        char[] result=new char[blockCount*4];
        for (int x=0;x<blockCount;x++)
        {
            b1=source2[x*3];
            b2=source2[x*3+1];
            b3=source2[x*3+2];
            temp1=cast(byte)((b1 & 252)>>2);//first
            temp=cast(byte)((b1 & 3)<<4);
            temp2=cast(byte)((b2 & 240)>>4);
            temp2+=temp; //second
            temp=cast(byte)((b2 & 15)<<2);
            temp3=cast(byte)((b3 & 192)>>6);
            temp3 +=temp; //third
            temp4=cast(byte)(b3 & 63); //fourth

            buffer[x*4]=temp1;
            buffer[x*4+1]=temp2;
            buffer[x*4+2]=temp3;
            buffer[x*4+3]=temp4;
        }

        lookupTable = CreateBase64Char( Para );
        for (int x=0; x<blockCount*4;x++)
        {
            result[x] = sixbit2char( lookupTable, buffer[x]);
        }

        //covert last "A"s to "=", based on paddingCount
        switch (paddingCount)
        {
            case 0:break;
            case 1:result[blockCount*4-1]='=';break;
            case 2:result[blockCount*4-1]='=';
                result[blockCount*4-2]='=';
                break;
            default:break;
        }
        return result;
    }



    private static char sixbit2char(char[] lookupTable, byte b)
    {
        if((b>=0) &&(b<=63))
        {
            return lookupTable[cast(int)b];
        }
        else
        {
            //should not happen;
            return ' ';
        }

    }

    /// <summary>
    /// Decode string using specific parameter
    /// </summary>
    /// <param name="Para"></param>
    /// <param name="input"></param>
    /// <returns>If decoded successfully, return the decoded string; else return NULL</returns>
    private static byte[] GetDecoded( char[] Para, char[] input )
    {
        char[] source;
        char[] lookupTable;
        int len, len2, len3;
        int blockCount;
        int paddingCount;

        int temp=0;
        source = input;
        len = input.length;
        if( ( len % 4 ) != 0 ) return null; // The string is not encoded with my base64;
        //find how many padding there are
        while( input[len - temp - 1] == '=' && temp < 3 )
        {
            temp++;
        }

        if( temp == 3 ) return null; // The string is not encoded with my base64;

        paddingCount=temp;
        //calculate the blockCount;
        //assuming all whitespace and carriage returns/newline were removed.
        blockCount=len/4;
        len2=blockCount*3;

        byte[] buffer=new byte[len];//first conversion result
        byte[] buffer2=new byte[len2];//decoded array with padding

        lookupTable = CreateBase64Char( Para );
        for(size_t x=0;x<len;x++)
        {
            buffer[x] = char2sixbit( lookupTable, source[x]);
        }

        byte b, b1,b2,b3;
        byte temp1, temp2, temp3, temp4;
        for(size_t x=0;x<blockCount;x++)
        {
            temp1=buffer[x*4];
            temp2=buffer[x*4+1];
            temp3=buffer[x*4+2];
            temp4=buffer[x*4+3];                

            b=cast(byte)(temp1<<2);
            b1=cast(byte)((temp2 & 48)>>4);
            b1+=b;
            b=cast(byte)((temp2 & 15)<<4);
            b2=cast(byte)((temp3 & 60)>>2);
            b2+=b;

            b=cast(byte)((temp3 & 3)<<6);
            b3=temp4;
            b3+=b;
            buffer2[x*3]=b1;
            buffer2[x*3+1]=b2;
            buffer2[x*3+2]=b3;
        }

        //remove paddings
        len3=len2-paddingCount;
        byte[] result=new byte[len3];
        for(size_t x=0;x<len3;x++)
        {
            result[x]=buffer2[x];
        }

        return result;
    }

    private static byte char2sixbit( char[] lookupTable, char c)
    {
        if( c =='=' )
            return 0;
        else
        {
            for (int x=0;x<64;x++)
            {
                if (lookupTable[x]==c)
                    return cast(byte)x;
            }
            //should not reach here
            return 0;
        }
    }
    

    /// <summary>
    /// Encrypt data based on specific key
    /// </summary>
    /// <param name="Data">the data to be encrypted</param>
    /// <param name="Key">key data</param>
    /// <returns>If successfully, return encrypted string; else return NULL</returns>
    public static char[] encrypt( char[] Data, char[] Key )
    {
        if( !Data.length || !Key.length ) 
            return null;
        char[] chrEncrypted = GetEncoded( Key,  cast(byte[])( Data ) );

        if( chrEncrypted !is null )
            //return new string( chrEncrypted );
            return chrEncrypted.dup;
        else
            return null;

    }


    /// <summary>
    /// Decrypt data based on specific key
    /// </summary>
    /// <param name="Data">the data to be decrypted</param>
    /// <param name="Key">key data</param>
    /// <returns>If successfully, return decrypted string; else return NULL</returns>

    public static char[] decrypt( char[] Data, char[] Key )
    {
        if( !Data.length || !Key.length ) 
            return null;

        byte[] bDecrypted = GetDecoded( Key, Data );
        if( bDecrypted !is null )
            return cast(char[]) (bDecrypted) ;
        else
            return null;
    }

}//Base64crypt

debug(UnitTest) unittest
{
    char[] src = "yidabu";
    char[] key = "hello";
    char[] des = Base64.encrypt(src,key);
    assert( Base64.decrypt(des, key) == src );
    
}


version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
