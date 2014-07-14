/**********************************************************************
 * Copyright (c) 2004 BitMethods Inc and others.
 * All rights reserved.   This program and the accompanying materials
 * are made available under the terms of the Common Public License v0.5
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/cpl-v05.html
 *
 * Contributors:
 * BitMethods Inc - Initial API and implementation
 * Ported to the D programming language
 *     yidabu ( D Programming Language China : http://www.d-programming-language-china.org/ )
 ***********************************************************************/
module dwin.gui.swt.PasswordFieldEditor;

version(SWT):

/// https://bugs.eclipse.org/bugs/attachment.cgi?id=33204
/// https://bugs.eclipse.org/bugs/show_bug.cgi?id=23495

private import org.eclipse.core.runtime.Assert;
private import org.eclipse.swt.SWT;
private import org.eclipse.swt.events.DisposeEvent;
private import org.eclipse.swt.events.DisposeListener;
private import org.eclipse.swt.events.FocusAdapter;
private import org.eclipse.swt.events.FocusEvent;
private import org.eclipse.swt.events.KeyAdapter;
private import org.eclipse.swt.events.KeyEvent;
private import org.eclipse.swt.widgets.Composite;
private import org.eclipse.swt.widgets.Text;

private import java.lang.all;
private import org.eclipse.jface.preference.StringFieldEditor;

/**
 * A field editor for a password type preference. This is essentially
 * a StringFieldEditor, but will replace each character in the input
 * box with an '*'.
 * <p>
 * This class may be used as is, or subclassed as required.
 * </p>
 */
public class PasswordFieldEditor : StringFieldEditor {

    /**
     * The validation strategy;
     * <code>VALIDATE_ON_KEY_STROKE</code> by default.
     */
    private int validateStrategy;

    /**
     * Text limit of text field in characters; initially unlimited.
     */
    private int textLimit;

    /**
     * The text field, or <code>null</code> if none.
     */
    Text textField;

    /**
     * Creates a new password field editor
     */
    protected this() {
        //widthInChars = UNLIMITED;
        textLimit = UNLIMITED;
        validateStrategy = VALIDATE_ON_KEY_STROKE;
    }

    /**
     * Creates a password field editor.
     * Use the method <code>setTextLimit</code> to limit the text.
     *
     * @param name the name of the preference this field editor works on
     * @param labelText the label text of the field editor
     * @param width the width of the text input field in characters,
     *  or <code>UNLIMITED</code> for no limit
     * @param strategy either <code>VALIDATE_ON_KEY_STROKE</code> to perform
     *  on the fly checking (the default), or <code>VALIDATE_ON_FOCUS_LOST</code> to
     *  perform validation only after the text has been typed in
     * @param parent the parent of the field editor's control
     */
    public this(String name, String labelText, int width,
            int strategy, Composite parent) {
        super(name, labelText, width, strategy, parent);
    }

    /**
     * Creates a password field editor.
     * Use the method <code>setTextLimit</code> to limit the text.
     *
     * @param name the name of the preference this field editor works on
     * @param labelText the label text of the field editor
     * @param width the width of the text input field in characters,
     *  or <code>UNLIMITED</code> for no limit
     * @param parent the parent of the field editor's control
     */
    public this(String name, String labelText, int width,
            Composite parent) {
        this(name, labelText, width, VALIDATE_ON_KEY_STROKE, parent);
    }

    /**
     * Creates a password field editor of unlimited width.
     * Use the method <code>setTextLimit</code> to limit the text.
     *
     * @param name the name of the preference this field editor works on
     * @param labelText the label text of the field editor
     * @param parent the parent of the field editor's control
     */
    public this(String name, String labelText, Composite parent) {
        this(name, labelText, UNLIMITED, parent);
    }



    /**
     * Returns this field editor's text control.
     * <p>
     * The control is created if it does not yet exist
     * </p>
     *
     * @param parent the parent
     * @return the text control
     */
    public Text getTextControl(Composite parent) {
        if (textField is null) {
            textField = new Text(parent, SWT.PASSWORD | SWT.SINGLE | SWT.BORDER);
            textField.setFont(parent.getFont());
            switch (validateStrategy) {
            case VALIDATE_ON_KEY_STROKE:
                textField.addKeyListener(new class() KeyAdapter {

                    /* (non-Javadoc)
                     * @see org.eclipse.events.KeyAdapter#keyReleased(org.eclipse.events.KeyEvent)
                     */
                    public void keyReleased(KeyEvent e) {
                        valueChanged();
                    }
                });

                break;
            case VALIDATE_ON_FOCUS_LOST:
                textField.addKeyListener(new class() KeyAdapter {
                    public void keyPressed(KeyEvent e) {
                        clearErrorMessage();
                    }
                });
                textField.addFocusListener(new class() FocusAdapter {
                    public void focusGained(FocusEvent e) {
                        refreshValidState();
                    }

                    public void focusLost(FocusEvent e) {
                        valueChanged();
                        clearErrorMessage();
                    }
                });
                break;
            default:
                Assert.isTrue(false, "Unknown validate strategy");//$NON-NLS-1$
            }
            textField.addDisposeListener(new class() DisposeListener {
                public void widgetDisposed(DisposeEvent event) {
                    textField = null;
                }
            });
            if (textLimit > 0) {//Only set limits above 0 - see SWT spec
                textField.setTextLimit(textLimit);
            }
        } else {
            checkParent(textField, parent);
        }
        return textField;
    }

}

version (build) {
    debug {
        pragma(link, "debug-dwin");
    } else {
        pragma(link, "dwin");
    }
}
