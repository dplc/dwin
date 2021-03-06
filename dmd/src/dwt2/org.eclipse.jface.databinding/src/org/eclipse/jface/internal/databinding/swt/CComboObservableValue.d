/*******************************************************************************
 * Copyright (c) 2005, 2008 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *     Brad Reynolds - bug 164653
 *     Ashley Cambrell - bug 198904
 *     Matthew Hall - bug 118516
 *     Eric Rizzo - bug 134884
 *******************************************************************************/
module org.eclipse.jface.internal.databinding.swt.CComboObservableValue;
import org.eclipse.jface.internal.databinding.swt.SWTProperties;

import java.lang.all;

import org.eclipse.core.databinding.observable.Diffs;
import org.eclipse.core.databinding.observable.Realm;
import org.eclipse.core.runtime.Assert;
import org.eclipse.jface.internal.databinding.provisional.swt.AbstractSWTObservableValue;
import org.eclipse.swt.custom.CCombo;
import org.eclipse.swt.events.ModifyEvent;
import org.eclipse.swt.events.ModifyListener;

/**
 * @since 3.2
 * 
 */
public class CComboObservableValue : AbstractSWTObservableValue {

    /**
     * 
     */

    private final CCombo ccombo;

    private final String attribute;

    private bool updating = false;

    private String currentValue;

    private ModifyListener modifyListener;

    /**
     * @param ccombo
     * @param attribute
     */
    public this(CCombo ccombo, String attribute) {
        super(ccombo);
        this.ccombo = ccombo;
        this.attribute = attribute;
        init();
    }

    /**
     * @param realm
     * @param ccombo
     * @param attribute
     */
    public this(Realm realm, CCombo ccombo, String attribute) {
        super(realm, ccombo);
        this.ccombo = ccombo;
        this.attribute = attribute;
        init();
    }
    
    private void init() {       
        if (attribute.equals(SWTProperties.SELECTION)
                || attribute.equals(SWTProperties.TEXT)) {
            this.currentValue = ccombo.getText();
            modifyListener = new class() ModifyListener {

                public void modifyText(ModifyEvent e) {
                    if (!updating) {
                        String oldValue = currentValue;
                        currentValue = this.outer.ccombo
                                .getText();
                        
                        notifyIfChanged(oldValue, currentValue);
                    }
                }
            };
            ccombo.addModifyListener(modifyListener);
        } else
            throw new IllegalArgumentException(null);
    }

    public void doSetValue(Object value) {
        String oldValue = ccombo.getText();
        try {
            updating = true;
            if (attribute.equals(SWTProperties.TEXT)) {
                String stringValue = value !is null ? value.toString() : ""; //$NON-NLS-1$
                ccombo.setText(stringValue);
            } else if (attribute.equals(SWTProperties.SELECTION)) {
                String items[] = ccombo.getItems();
                int index = -1;
                if (value is null) {
                    ccombo.select(-1);
                } else if (items !is null) {
                    auto valueStr = stringcast(value);
                    for (int i = 0; i < items.length; i++) {
                        if (valueStr.equals(items[i])) {
                            index = i;
                            break;
                        }
                    }
                    if (index is -1) {
                        ccombo.setText(stringcast(value));
                    } else {
                        ccombo.select(index); // -1 will not "unselect"
                    }
                }
            }
        } finally {
            updating = false;
            currentValue = ccombo.getText();
        }
        
        notifyIfChanged(oldValue, currentValue);
    }

    public Object doGetValue() {
        if (attribute.equals(SWTProperties.TEXT))
            return stringcast(ccombo.getText());

        Assert.isTrue(attribute.equals(SWTProperties.SELECTION),
                "unexpected attribute: " ~ attribute); //$NON-NLS-1$
        // The problem with a ccombo, is that it changes the text and
        // fires before it update its selection index
        return stringcast(ccombo.getText());
    }

    public Object getValueType() {
        Assert.isTrue(attribute.equals(SWTProperties.TEXT)
                || attribute.equals(SWTProperties.SELECTION),
                Format("unexpected attribute: {}", attribute)); //$NON-NLS-1$
        return Class.fromType!(String);
    }

    /**
     * @return attribute being observed
     */
    public String getAttribute() {
        return attribute;
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.databinding.observable.value.AbstractObservableValue#dispose()
     */
    public synchronized void dispose() {
        super.dispose();

        if (modifyListener !is null && !ccombo.isDisposed()) {
            ccombo.removeModifyListener(modifyListener);
        }
    }
    
    private void notifyIfChanged(String oldValue, String newValue) {
        if (!oldValue.equals(newValue)) {
            fireValueChange(Diffs.createValueDiff(oldValue, ccombo.getText()));         
        }
    }
}
