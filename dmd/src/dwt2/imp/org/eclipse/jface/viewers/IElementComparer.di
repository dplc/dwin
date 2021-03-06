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

module org.eclipse.jface.viewers.IElementComparer;

import java.lang.all;

/**
 * This interface is used to compare elements in a viewer for equality,
 * and to provide the hash code for an element.
 * This allows the client of the viewer to specify different equality criteria
 * and a different hash code implementation than the
 * <code>equals</code> and <code>hashCode</code> implementations of the
 * elements themselves.
 *
 * @see StructuredViewer#setComparer
 */
public interface IElementComparer {

    /**
     * Compares two elements for equality
     *
     * @param a the first element
     * @param b the second element
     * @return whether a is equal to b
     */
    int opEquals(Object a, Object b);

    /**
     * Returns the hash code for the given element.
     * @param element the element the hash code is calculated for
     *
     * @return the hash code for the given element
     */
    hash_t toHash(Object element);
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
