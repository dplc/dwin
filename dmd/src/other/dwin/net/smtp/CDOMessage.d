// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2007  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: April 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/


module dwin.net.smtp.CDOMessage;

    private import dwin.sys.win32.com.Core;
    private import dwin.sys.win32.com.Client;
    private import dwin.sys.win32.com.tlb.cdosys;


/*
    later binding version of MailSender
    ---
        scope m = new CDO.Message;
        m.subject = "test CDO.Message";
        m.textBody = "hello, http://bbs.d-programming-language-china.org";
        m.from = "bbs.d-programming-language-china.org@gmail.com";
        m.to = "bbs.d-programming-language-china.org@gmail.com";
        m.addAttachment(r"D:\test.rar");    //not zip
        m.cc = "bbs.d-programming-language-china.org@163.com";
        m.server = "smtp.gmail.com";
        m.port = 465;
        m.authenticate = 1;
        m.username = "";
        m.password = "";
        m.ssl = true;
        m.send();
    ---

*/    


class CDO {

  static class Message : DispatchObject {
	  
	private DispatchObject fields, config;

    ~this()
    {
        delete fields;
        delete config;    
    }
    
	this() {
	  super("CDO.Message");
		
		// Configure CDOSYS to send via a remote SMTP server 
		config = get("Configuration"); 
		// Call config's Fields property and get a reference to its Fields instance 
		fields = get("Fields"); 
        
        // old version
        //config = new DispatchObject(get("Configuration")); 
		//fields = new DispatchObject(config.get("Fields")); 
		
		sendUsing(2);
	}
    
	
	void sendUsing(int p)
	{
		//static char[] pp = "http://schemas.microsoft.com/cdo/configuration/sendusing";
		config.set("Fields", cdoSendUsingMethod, p);		
		
	}
	
	void subject(char[] s)
	{
		set("Subject",s);
	}
	
	void textBody(char[] b)
	{
		set("TextBody",b);
	}
	
	void htmlBody(char[] h)
	{
		set("HTMLBody",h);
	}
	
	void from(char[] f)
	{
		set("From",f);
	}
	
	void to(char[] t)
	{
		set("To",t);
	}
	
	void cc(char[] sc)
	{
		//if (!sc || sc == "") return;
		set("Cc",sc);
	}
	
	void bcc(char[] b)
	{
		//if (!b || b == "") return;
		set("Bcc",b);
	}
	
	void addAttachment(char[] a)
	{
		//if (std.file.exists(a))
        call("AddAttachment",a) ;
	}
	
    
	void addAttachments(char[][] files)
	{        
		foreach(f;files)
			addAttachment(f);
	}
    
    
	void server(char[] p)
	{
		//static char[] pp = "http://schemas.microsoft.com/cdo/configuration/smtpserver";
		config.set("Fields", cdoSMTPServer, p);		
	}	
	
	void port(int p)
	{
		//static char[] pp = "http://schemas.microsoft.com/cdo/configuration/smtpserverport";
		config.set("Fields", cdoSMTPServerPort, p);
		
	}
	
	void authenticate(int p)
	{
		//static char[] pp = "http://schemas.microsoft.com/cdo/configuration/smtpauthenticate";
		config.set("Fields", cdoSMTPAuthenticate, p);
		
	}
	
	// Set the authentication type, user name and password 
	void username(char[] p)
	{
		//static char[] pp = "http://schemas.microsoft.com/cdo/configuration/sendusername";
		config.set("Fields", cdoSendUserName, p);
		
	}
	
	void password(char[] p)
	{
		//static char[] pp = "http://schemas.microsoft.com/cdo/configuration/sendpassword";
		config.set("Fields", cdoSendPassword, p);
		
	}
	
	void ssl(bool p)
	{
		//static char[] pp = "http://schemas.microsoft.com/cdo/configuration/smtpusessl";
		config.set("Fields", cdoSMTPUseSSL, p);		
		
	}

	void update()
	{
		fields.call("Update"); 		
	}

	bool send()
	{
        try
        {        
            update();
            call("Send"); 		
            return true;
        }
        catch(Exception e)
        {
            //(" catch {}", e.msg);
        }
        return false;
	}


  }//Message

}//CDO
//
