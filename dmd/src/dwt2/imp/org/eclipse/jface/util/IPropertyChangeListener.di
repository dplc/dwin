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
module org.eclipse.jface.util.IPropertyChangeListener;

import org.eclipse.jface.util.PropertyChangeEvent;

import java.lang.all;
import java.util.EventListener;

/**
 * Listener for property changes.
 * <p>
 * Usage:
 * <pre>
 * IPropertyChangeListener listener =
 *   new IPropertyChangeListener() {
 *      public void propertyChange(PropertyChangeEvent event) {
 *         ... // code to deal with occurrence of property change
 *      }
 *   };
 * emitter.addPropertyChangeListener(listener);
 * ...
 * emitter.removePropertyChangeListener(listener);
 * </pre>
 * </p>
 */
public interface IPropertyChangeListener : EventListener {
    /**
     * Notification that a property has changed.
     * <p>
     * This method gets called when the observed object fires a property
     * change event.
     * </p>
     *
     * @param event the property change event object describing which property
     * changed and how
     */
    public void propertyChange(PropertyChangeEvent event);
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
