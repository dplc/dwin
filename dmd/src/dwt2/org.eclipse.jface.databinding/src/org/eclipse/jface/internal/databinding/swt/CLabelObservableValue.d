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
 *******************************************************************************/
module org.eclipse.jface.internal.databinding.swt.CLabelObservableValue;

import java.lang.all;

import org.eclipse.core.databinding.observable.Diffs;
import org.eclipse.core.databinding.observable.Realm;
import org.eclipse.jface.internal.databinding.provisional.swt.AbstractSWTObservableValue;
import org.eclipse.swt.custom.CLabel;

/**
 * @since 1.0
 * 
 */
public class CLabelObservableValue : AbstractSWTObservableValue {

    private final CLabel label;

    /**
     * @param label
     */
    public this(CLabel label) {
        super(label);
        this.label = label;
    }
    
    /**
     * @param realm
     * @param label
     */
    public this(Realm realm, CLabel label) {
        super(realm, label);
        this.label = label;
    }

    public void doSetValue(Object value) {
        String oldValue = label.getText();
        String newValue = value is null ? "" : value.toString();  //$NON-NLS-1$
        label.setText(newValue);

        if (!newValue.equals(oldValue)) {
            fireValueChange(Diffs.createValueDiff(oldValue, newValue));
        }
    }

    public Object doGetValue() {
        return stringcast(label.getText());
    }

    public Object getValueType() {
        return Class.fromType!(String);
    }

}
