// Written in the D programming language.

/*******************************************************************************

        Copyright:      Copyright (c) 2008  (yidabu  g m a i l at com) All rights reserved

        Version:        Initial release: July 25, 2008

        Authors:        yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )

*******************************************************************************/

/// dwtx form works with icu.dll, it takes more than 10MB space, it's too larger for small program

module dwin.gui.swt.LinkText;

version(SWT):

private import org.eclipse.swt.SWT;
private import org.eclipse.swt.custom.StyledText;
private import org.eclipse.swt.custom.StyleRange;
private import org.eclipse.swt.widgets.Composite;

private import org.eclipse.swt.widgets.Listener;

class LinkText : StyledText
{
    public this(Composite parent, int style, char[] url) {
        super(parent,style);
        setStyle(url);
    }

    void setStyle(char[] url)
    {
        setText(url);
        setToolTipText("Navigate to " ~ url);
        pack();

        auto style = new StyleRange();
        style.start = 0;
        style.length = url.length;
        style.foreground = display.getSystemColor(SWT.COLOR_BLUE);
        style.background = display.getSystemColor(SWT.COLOR_WIDGET_BACKGROUND);
        //style.underline = true;
        //style.underlineStyle = SWT.UNDERLINE_SINGLE;

        setStyleRange(style);
        setCursor(getDisplay.getSystemCursor(SWT.CURSOR_HAND));
    }

}
version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
