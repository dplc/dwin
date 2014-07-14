
// Written in the D programming language.

/*******************************************************************************

        a simple Text-to-Speech Class
        
        copyright:      Copyright (c) 2009  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: June 2009

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

module dwin.sys.win32.Speak;


public import dwin.sys.win32.com.tlb.speech.sapi;
    
private import bstr = dwin.sys.win32.com.Bstr;
private import dwin.sys.win32.com.Core;
private import ComUtil = dwin.sys.win32.com.Util; //for SUCCEEDED


/**
     
    Example:
    ---
        scope speak = new Speak();
        //Note the use of the SVSFPurgeBeforeSpeak flag; it is there to ensure that the speaker will finish the last statement before progressing on to the next one.
        speak.speak("<VOLUME LEVEL ='100' /> <rate speed='-10'/> <lang langid='804' />abcd<silence msec='5000' />def<silence msec='5000' />23", SpeechVoiceSpeakFlags.SVSFIsXML | SpeechVoiceSpeakFlags.SVSFPurgeBeforeSpeak);
        speak.speak("<VOICE REQUIRED='NAME=Microsoft Simplified Chinese'/>11511+1=", SpeechVoiceSpeakFlags.SVSFIsXML | SpeechVoiceSpeakFlags.SVSFPurgeBeforeSpeak);
        speak.speak("<voice required='gender=female'>Gold</voice>", SpeechVoiceSpeakFlags.SVSFIsXML | SpeechVoiceSpeakFlags.SVSFPurgeBeforeSpeak);
        speak.speak("This sounds normal <pitch middle = '-10'/> but the pitch drops half way through", SpeechVoiceSpeakFlags.SVSFIsXML | SpeechVoiceSpeakFlags.SVSFPurgeBeforeSpeak);
  
    ---

    reference:
        download text speech sdk:

        http://www.microsoft.com/downloads/details.aspx?FamilyID=5e86ec97-40a7-453f-b0ee-6583171b4530&DisplayLang=en

        # If you want to download sample code, documentation, SAPI, and the U.S. English Speech engines for development purposes, download the Speech SDK 5.1 file (SpeechSDK51.exe).

        # If you want to use the Japanese and Simplified Chinese engines for development purposes, download the Speech SDK 5.1 Language Pack file (SpeechSDK51LangPack.exe) in addition to the Speech SDK 5.1 file.

        http://download.microsoft.com/download/B/4/3/B4314928-7B71-4336-9DE7-6FA4CF00B7B3/SpeechSDK51.exe

        http://download.microsoft.com/download/B/4/3/B4314928-7B71-4336-9DE7-6FA4CF00B7B3/SpeechSDK51LangPack.exe

        Text-to-Speech Tutorial (SAPI 5.3)
        http://msdn.microsoft.com/en-us/library/ms720163(VS.85).aspx

        Simple Program for Text to Speech Using SAPI (English Version)
        http://www.codeproject.com/KB/audio-video/speech.aspx

        Text to Speech with the Microsoft Speech Library and SDK version 5.1
        http://www.codeproject.com/KB/audio-video/TTSinVBpackage.aspx

        关于TTS，网上几个例子都是用speech sdk，朗读英文单词的
        http://topic.csdn.net/t/20050303/17/3822247.html

        Hello World by Microsoft Speech SDK 5.1
        http://blog.csdn.net/In355Hz/archive/2003/07/04/5142.aspx

        用TTS技术开发具有文本朗读功能的应用程序
        http://blog.csdn.net/ttfish/archive/2006/01/19/583658.aspx

        sapi.dll position:
        C:\Program Files\Common Files\Microsoft Shared\Speech\sapi.dll 
    
*/

class Speak
{
    private ISpVoice spVoice;
    
    this()
    {
        spVoice =  SpVoice.coCreate!(ISpVoice)(ExecutionContext.InProcessServer);          
        if(spVoice is null)
            throw new Exception("SpVoice coCreate failed");
    }
    
    ~this()
    {
        tryRelease(spVoice);
    }
    
    bool speak(char[] words, uint flags = SpeechVoiceSpeakFlags.SVSFDefault)
    {
        auto bwords = bstr.fromString(words);
        scope(exit)
            bstr.free(bwords);        
        uint t;
        
        return ComUtil.SUCCEEDED(spVoice.Speak(bwords, flags, t));        
    }
    
}
    
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
