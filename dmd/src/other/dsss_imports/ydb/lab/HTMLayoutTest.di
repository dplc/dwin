// Written in the D programming language.

/*******************************************************************************
        
        Copyright:      Copyright (c) 2008  (yidabu at gmail com) All rights reserved

        License:        BSD style: $(LICENSE)

        Version:        Initial release: April 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )
        
        Fore HTMLayout test 
        Example:
        ---
            MyForm myForm;
            myForm.htmSource = "<p>hello, world </p>";
            myForm = new MyForm();
            myForm.run;
        ---
        

*******************************************************************************/

module ydb.lab.HTMLayoutTest;

version(Win32):
version(DFL):
version(HTMLAYOUT):

private import flowerd.dfl;
//import tango.io.Stdout;
private import  dfl.all;
public import htmlayout.htmlayout;

class MyForm : HLayoutForm
{
    static this()
    {
        htmlayout.capi.loadHTMLayout();        
    }
    
    this()
    {
		super();
		form.text= "HLayout test";
        form.size = Size(800, 600); 
        form.formBorderStyle = FormBorderStyle.SIZABLE;
        form.centerToScreen(); 
        form.addShortcut(Keys.F5, &F5);
        loadHTML_();
    }
    
    void loadHTML_()
    {
        if(htmPath_.length)
            loadHTML(htmPath_);        
        else
            loadHTML(null, htmSource_);
    }
        
	private void F5(Object sender, FormShortcutEventArgs ea)
	{
        loadHTML_();
	}    
    
    
    static void htmPath(char[] str)
    {
        htmPath_ = str;
        htmSource_ = null;
    }
    
    static void htmSource(char[] str)
    {
        htmPath_ = null;
        htmSource_ = str;
    }    
    

    static private char[] htmPath_;
    static private char[] htmSource_;                
}


version (build) {
    debug {
        pragma(link, "debug-ydb");
    } else {
        pragma(link, "ydb");
    }
}
