
// Written in the D programming language.

/*******************************************************************************
        
        copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Initial release: Nov 2007

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/



module dwin.net.smtp.MailSender;

version(Win32):

    private import dwin.sys.win32.com.Core;
    private import dwin.sys.win32.com.Types;
    private import dwin.core.Exception;
    private import dwin.sys.win32.com.tlb.cdosys;
    private import dwin.sys.win32.com.tlb.adodb;
        
    private import tango.text.Ascii : toLower;
    private import tango.io.FilePath;
    private import tango.text.Util : delimit, trim;
    
    private import tango.sys.win32.Types;
        
    private import bstr = dwin.sys.win32.com.Bstr;    
    private import dwin.sys.win32.com.COMException;


/**
    simply send EMail via CDOSYS.dll
    Examples:
    ---
        scope ms = new MailSender();
        ms.subject = "test mail";
        ms.textBody = "hello, http://bbs.d-programming-language-china.org/";
        ms.from = "support@gmail.com";
        ms.to = "sales@gmail.com";
        ms.addAttachments(r"D:\test.txt;D:\test2.txt");
        ms.cc = "support@163.com";
        ms.server = "smtp.gmail.com";
        ms.port = 465;
        ms.authenticate();
        ms.username = "name";
        ms.password = "pass";
        ms.ssl = true;
        ms.send();
    ---
    
    See_Also:
    c++ version 
    http://groups.google.com/group/microsoft.public.cn.dotnet.languages.vc/browse_thread/thread/1e8f5954463a2b08/6f9969e529d5a8cf?lnk=st&q=IConfiguration++flds.get_Item#6f9969e529d5a8cf
    http://groups.google.com/group/microsoft.public.win32.programmer.messaging/browse_thread/thread/d38dba8595412166/685f452ec14f0dac?lnk=st&q=IConfiguration++flds.get_Item#685f452ec14f0dac
*/
class MailSender
{ 
    private
    {
        IMessage          msg;
        IBodyPart         bp;
        IConfiguration    cfg;
        Fields            flds;
        Field             fld;
        //_Stream           stm;
        int hr = E_FAIL; 
    }
    
    void exception(char[] msg)
    {
        throw new COMException(msg);
    }
    
    this()
    {
        msg = Message.coCreate!(IMessage)(ExecutionContext.InProcessServer);
        if(msg is null) exception("IMessage");
          
        msg.get_Configuration(cfg); /// 2008 11 08, tested works fine
        //cfg = Configuration.coCreate!(IConfiguration)(ExecutionContext.InProcessServer);
        if(cfg is null) exception("IConfiguration"); /// failed here ? August 28, 2008 by yidabu
            
        hr = cfg.get_Fields(flds);
        if(hr != S_OK) exception("Fileds");
            
        auto result = sendUsing();
        assert( result, "sendUsing" );
    }
    
    ~this()
    {
        tryRelease(flds); 
        flds = null;

        tryRelease(cfg);
        cfg = null;

        //msg.GetStream(&stm);
        //stm.SaveToFile(L"c:\\savemymessage.eml",adSaveCreateOverWrite);

        //stm.Release();
        tryRelease(msg);
        msg = null;
    }

    bool to(char[] s)
    {
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);
        hr = msg.put_To(bstring);
        return hr == S_OK;
    }
    
    bool from(char[] s)
    {
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);

        hr = msg.put_From(bstring);
        return hr == S_OK;
    }  
    
    bool sender(char[] s)
    {
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);            
        hr = msg.put_Sender(bstring);
        return hr == S_OK;
    }      
    
    bool subject(char[] s)
    {
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);
        hr = msg.put_Subject(bstring);
        return hr == S_OK;
    }    
    
    bool textBody(char[] s)
    {
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);
        hr = msg.put_TextBody(bstring);
        return hr == S_OK;
    }
    
    bool htmlBody(char[] s)
    {
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);
        hr = msg.put_HTMLBody(bstring);
        return hr == S_OK;
    }    
    
    bool keywords(char[] s)
    {
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);            
        hr = msg.put_Keywords(bstring);
        return hr == S_OK;
    }      
    
    bool cc(char[] s)
    {
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);
        hr = msg.put_CC(bstring);
        return hr == S_OK;
    }      
    
    bool bcc(char[] s)
    {
        wchar* bstring = bstr.fromString(s);
        scope(exit)
            bstr.free(bstring);            
        hr = msg.put_BCC(bstring);
        return hr == S_OK;
    }      
    

    char[] getMediaType(char[] url)
    {
        auto fp = new FilePath(url);
        switch ( toLower(fp.ext) )
        {
            case "doc":
                return "application/msword";
            case "html", "htm":
                return  "text/html";
            case "txt":
                return "text/plain";
            default :
                return "text/plain";
        }
    }
    bool addAttachment(char[] url)
    {
        wchar* bstring = bstr.fromString(url);
        scope(exit)
            bstr.free(bstring);

        hr = msg.AddAttachment(bstring, bstr.fromString(""c), bstr.fromString(""c), bp);
        assert(hr == S_OK, "addAttachment");
        
        wchar* bstring2 = bstr.fromString( getMediaType(url) );
        scope(exit)
            bstr.free(bstring2);
        hr = bp.put_ContentMediaType(bstring2);
        assert( hr == S_OK, "put ContentMediaType" );
        tryRelease(bp);
        return hr == S_OK;
    }
    
    bool addAttachments(char[] urls)
    {
        char[][] a = urls.delimit(";");
        bool result;
        foreach(url; a)
            if( trim(url).dup.length )
                result = addAttachment(url);
        return result;
    }
    
    

    ////////////////////////////////////////////////////////////////////////////////////////

    
    bool sendUsing()
    {
        DWINVARIANT item = DWINVARIANT(cdoSendUsingMethod);
        DWINVARIANT param = DWINVARIANT(cast(int)CdoSendUsing.cdoSendUsingPort);
        scope(exit)
        {
            item.clear();
            param.clear();
        }
        
        hr = flds.get_Item(item, fld);
        assert(hr == S_OK, "sendUsing get Item");
        
        hr = fld.put_Value(param);
        assert(hr == S_OK, "sendUsing put Value");
        tryRelease(fld);
        return hr == S_OK;
    }    
    
    bool server(char[] s = "smtp.gmail.com" )
    {
        DWINVARIANT item = DWINVARIANT(cdoSMTPServer);
        DWINVARIANT param = DWINVARIANT(s);
        scope(exit)
        {
            item.clear();
            param.clear();
        }
        
        hr = flds.get_Item(item, fld);
        assert(hr == S_OK, "server get_item");
        
        hr = fld.put_Value(param);
        assert(hr == S_OK, "server pub_value");
        tryRelease(fld);
        
        return hr == S_OK;        
    }
    
    
    bool port(int i = 465)    //gmail = 465, other 25
    {
        DWINVARIANT item = DWINVARIANT(cdoSMTPServerPort);
        DWINVARIANT param = DWINVARIANT(i);
        scope(exit)
        {
            item.clear();
            param.clear();
        }
        
        hr = flds.get_Item(item, fld);
        assert(hr == S_OK, "port get_item");
        
        hr = fld.put_Value(param);
        assert(hr == S_OK, "port put_value");
        tryRelease(fld);
        
        return hr == S_OK;        
    }

    
    bool authenticate(int i = cast(int)CdoProtocolsAuthentication.cdoBasic)   //gmail
    {
        DWINVARIANT item = DWINVARIANT(cdoSMTPAuthenticate);
        DWINVARIANT param = DWINVARIANT(i);
        scope(exit)
        {
            item.clear();
            param.clear();
        }
        
        hr = flds.get_Item(item, fld);
        assert(hr == S_OK, "smtpAuthenticate get item");
        
        hr = fld.put_Value(param);
        assert(hr == S_OK, "smtpAuthenticate put value");
        tryRelease(fld);
        
        return hr == S_OK;        
    }

    bool ssl(bool b = true)   //gmail
    {
        VARIANT_BOOL vb = (b == true) ? VARIANT_TRUE : VARIANT_FALSE;
        DWINVARIANT item = DWINVARIANT(cdoSMTPUseSSL);
        DWINVARIANT param = DWINVARIANT(vb);
        scope(exit)
        {
            item.clear();
            param.clear();
        }
        
        hr = flds.get_Item(item, fld);
        assert(hr == S_OK, "ssl get item");
        
        hr = fld.put_Value(param);
        assert(hr == S_OK, "ssl put value");
        tryRelease(fld);
        
        return hr == S_OK;        
    }
    
    bool username(char[] s)   //
    {
        DWINVARIANT item = DWINVARIANT(cdoSendUserName);
        DWINVARIANT param = DWINVARIANT(s);
        scope(exit)
        {
            item.clear();
            param.clear();
        }
        
        hr = flds.get_Item(item, fld);
        assert(hr == S_OK, "username get item");
        
        hr = fld.put_Value(param);
        assert(hr == S_OK, "username put value");
        tryRelease(fld);
        
        return hr == S_OK;        
    }    
    
    bool password(char[] s)   //
    {
        DWINVARIANT item = DWINVARIANT(cdoSendPassword);
        DWINVARIANT param = DWINVARIANT(s);
        scope(exit)
        {
            item.clear();
            param.clear();
        }
        
        hr = flds.get_Item(item, fld);
        assert(hr == S_OK, "password get item");
        
        hr = fld.put_Value(param);
        assert(hr == S_OK, "password put value");
        tryRelease(fld);
        
        return hr == S_OK;        
    }     

    bool send()
    {
        hr = flds.Update();
        assert( hr == S_OK, "send update");

        hr = msg.putref_Configuration(cfg);
        assert (hr == S_OK, "send putref");

        //msg.GetStream(&stm);
        //stm.SaveToFile(L"c:\\savemymessage.eml",adSaveCreateOverWrite);

        hr = msg.Send();
        assert( hr == S_OK, "send Send" );

        return hr == S_OK;
    }
  
}
    
    


version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
