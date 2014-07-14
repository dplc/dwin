/*******************************************************************************
 * Copyright (c) 2000, 2006 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 * Port to the D programming language:
 *     Frank Benoit <benoit@tionex.de>
 *******************************************************************************/
module org.eclipse.jface.util.PropertyChangeEvent;

import org.eclipse.core.runtime.Assert;

import java.lang.all;
import java.util.EventObject;

/**
 * An event object describing a change to a named property.
 * <p>
 * This concrete class was designed to be instantiated, but may
 * also be subclassed if required.
 * </p>
 * <p>
 * The JFace frameworks contain classes that report property
 * change events for internal state changes that may be of interest
 * to external parties. A special listener interface
 * (<code>IPropertyChangeListener</code>) is defined for this purpose,
 * and a typical class allow listeners to be registered via
 * an <code>addPropertyChangeListener</code> method.
 * </p>
 *
 * @see IPropertyChangeListener
 */
public class PropertyChangeEvent : EventObject {

    /**
     * Generated serial version UID for this class.
     * @since 3.1
     */
    private static final long serialVersionUID = 3256726173533811256L;

    /**
     * The name of the changed property.
     */
    private String propertyName;

    /**
     * The old value of the changed property, or <code>null</code> if
     * not known or not relevant.
     */
    private Object oldValue;

    /**
     * The new value of the changed property, or <code>null</code> if
     * not known or not relevant.
     */
    private Object newValue;

    /**
     * Creates a new property change event.
     *
     * @param source the object whose property has changed
     * @param property the property that has changed (must not be <code>null</code>)
     * @param oldValue the old value of the property, or <code>null</code> if none
     * @param newValue the new value of the property, or <code>null</code> if none
     */
    public this(Object source, String property, Object oldValue,
            Object newValue) {
        super(source);
        Assert.isTrue( property.length > 0 );
        this.propertyName = property;
        this.oldValue = oldValue;
        this.newValue = newValue;
    }

    /**
     * Returns the new value of the property.
     *
     * @return the new value, or <code>null</code> if not known
     *  or not relevant (for instance if the property was removed).
     */
    public Object getNewValue() {
        return newValue;
    }

    /**
     * Returns the old value of the property.
     *
     * @return the old value, or <code>null</code> if not known
     *  or not relevant (for instance if the property was just
     *  added and there was no old value).
     */
    public Object getOldValue() {
        return oldValue;
    }

    /**
     * Returns the name of the property that changed.
     * <p>
     * Warning: there is no guarantee that the property name returned
     * is a constant string.  Callers must compare property names using
     * equals, not is.
     * </p>
     *
     * @return the name of the property that changed
     */
    public String getProperty() {
        return propertyName;
    }
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
