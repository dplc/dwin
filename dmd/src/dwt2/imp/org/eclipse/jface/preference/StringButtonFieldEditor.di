/*******************************************************************************
 * Copyright (c) 2000, 2006 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *     Thierry Lach - thierry.lach@bbdodetroit.com - Fix for Bug 37155
 * Port to the D programming language:
 *     Frank Benoit <benoit@tionex.de>
 *******************************************************************************/
module org.eclipse.jface.preference.StringButtonFieldEditor;

import org.eclipse.jface.preference.StringFieldEditor;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.DisposeEvent;
import org.eclipse.swt.events.DisposeListener;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.core.runtime.Assert;
import org.eclipse.jface.dialogs.IDialogConstants;
import org.eclipse.jface.resource.JFaceResources;

import java.lang.all;
import java.util.Set;

/**
 * An abstract field editor for a string type preference that presents
 * a string input field with a change button to its right to edit the
 * input field's content. When the user presses the change button, the
 * abstract framework method <code>changePressed()</code> gets called
 * to compute a new string.
 */
public abstract class StringButtonFieldEditor : StringFieldEditor {

    /**
     * The change button, or <code>null</code> if none
     * (before creation and after disposal).
     */
    private Button changeButton;

    /**
     * The text for the change button, or <code>null</code> if missing.
     */
    private String changeButtonText;

    /**
     * Creates a new string button field editor
     */
    protected this() {
    }

    /**
     * Creates a string button field editor.
     *
     * @param name the name of the preference this field editor works on
     * @param labelText the label text of the field editor
     * @param parent the parent of the field editor's control
     */
    protected this(String name, String labelText,
            Composite parent) {
        init(name, labelText);
        createControl(parent);
    }

    /* (non-Javadoc)
     * Method declared on FieldEditor.
     */
    protected override void adjustForNumColumns(int numColumns) {
        (cast(GridData) getTextControl().getLayoutData()).horizontalSpan = numColumns - 2;
    }

    /**
     * Notifies that this field editor's change button has been pressed.
     * <p>
     * Subclasses must implement this method to provide a corresponding
     * new string for the text field. If the returned value is <code>null</code>,
     * the currently displayed value remains.
     * </p>
     *
     * @return the new string to display, or <code>null</code> to leave the
     *  old string showing
     */
    protected abstract String changePressed();

    /* (non-Javadoc)
     * Method declared on StringFieldEditor (and FieldEditor).
     */
    protected override void doFillIntoGrid(Composite parent, int numColumns) {
        super.doFillIntoGrid(parent, numColumns - 1);
        changeButton = getChangeControl(parent);
        GridData gd = new GridData();
        gd.horizontalAlignment = GridData.FILL;
        int widthHint = convertHorizontalDLUsToPixels(changeButton,
                IDialogConstants.BUTTON_WIDTH);
        gd.widthHint = Math.max(widthHint, changeButton.computeSize(
                SWT.DEFAULT, SWT.DEFAULT, true).x);
        changeButton.setLayoutData(gd);
    }

    /**
     * Get the change control. Create it in parent if required.
     * @param parent
     * @return Button
     */
    protected Button getChangeControl(Composite parent) {
        if (changeButton is null) {
            changeButton = new Button(parent, SWT.PUSH);
            if (changeButtonText is null) {
                changeButtonText = JFaceResources.getString("openChange"); //$NON-NLS-1$
            }
            changeButton.setText(changeButtonText);
            changeButton.setFont(parent.getFont());
            changeButton.addSelectionListener(new class SelectionAdapter {
                public void widgetSelected(SelectionEvent evt) {
                    String newValue = changePressed();
                    if (newValue !is null) {
                        setStringValue(newValue);
                    }
                }
            });
            changeButton.addDisposeListener(new class DisposeListener {
                public void widgetDisposed(DisposeEvent event) {
                    changeButton = null;
                }
            });
        } else {
            checkParent(changeButton, parent);
        }
        return changeButton;
    }

    /* (non-Javadoc)
     * Method declared on FieldEditor.
     */
    public override int getNumberOfControls() {
        return 3;
    }

    /**
     * Returns this field editor's shell.
     *
     * @return the shell
     */
    protected Shell getShell() {
        if (changeButton is null) {
            return null;
        }
        return changeButton.getShell();
    }

    /**
     * Sets the text of the change button.
     *
     * @param text the new text
     */
    public void setChangeButtonText(String text) {
        Assert.isNotNull(text);
        changeButtonText = text;
        if (changeButton !is null) {
            changeButton.setText(text);
            Point prefSize = changeButton.computeSize(SWT.DEFAULT, SWT.DEFAULT);
            GridData data = cast(GridData)changeButton.getLayoutData();
            data.widthHint = Math.max(SWT.DEFAULT, prefSize.x);
        }
    }

    /* (non-Javadoc)
     * @see org.eclipse.jface.preference.FieldEditor#setEnabled(bool, org.eclipse.swt.widgets.Composite)
     */
    public override void setEnabled(bool enabled, Composite parent) {
        super.setEnabled(enabled, parent);
        if (changeButton !is null) {
            changeButton.setEnabled(enabled);
        }
    }

}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
