/*******************************************************************************
 * Copyright (c) 2004, 2007 IBM Corporation and others.
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
module org.eclipse.jface.viewers.IFilter;

import java.lang.all;

/**
 * Interface for filters. Can accept or reject items.
 * 
 * @since 3.1
 */
public interface IFilter {
    /**
     * Determines if the given object passes this filter.
     * 
     * @param toTest object to compare against the filter 
     * 
     * @return <code>true</code> if the object is accepted by the filter.
     */
    public bool select(Object toTest);
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
