/*******************************************************************************
 * Copyright (c) 2004, 2006 IBM Corporation and others.
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
module org.eclipse.jface.viewers.IFontProvider;

import java.lang.all;

import org.eclipse.swt.graphics.Font;

/**
 * Interface to provide font representation for a given element.
 * @see org.eclipse.jface.viewers.IFontDecorator
 * 
 * @since 3.0
 */
public interface IFontProvider {

    /**
     * Provides a font for the given element.
     * 
     * @param element the element
     * @return the font for the element, or <code>null</code> 
     *   to use the default font
     */
    public Font getFont(Object element);
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
