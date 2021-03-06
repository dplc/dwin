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
module org.eclipse.jface.viewers.ICellEditorValidator;

import java.lang.all;

/**
 * An interface for validating a cell editor's input.
 * <p>
 * This interface should be implemented by classes that wish to
 * act as cell editor validators.
 * </p>
 */
public interface ICellEditorValidator {
    /**
     * Returns a string indicating whether the given value is valid;
     * <code>null</code> means valid, and non-<code>null</code> means
     * invalid, with the result being the error message to display
     * to the end user.
     * <p>
     * It is the responsibility of the implementor to fully format the
     * message before returning it.
     * </p>
     *
     * @param value the value to be validated
     * @return the error message, or <code>null</code> indicating
     *  that the value is valid
     */
    public String isValid(Object value);
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
