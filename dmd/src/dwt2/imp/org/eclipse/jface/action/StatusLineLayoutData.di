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

module org.eclipse.jface.action.StatusLineLayoutData;

import org.eclipse.swt.SWT;

import java.lang.all;
import java.util.Set;

/**
 * Represents the layout data object for <code>Control</code> within the status line.
 * To set a <code>StatusLineLayoutData</code> object into a <code>Control</code>, use
 * the <code>setLayoutData()</code> method.
 * <p>
 * NOTE: Do not reuse <code>StatusLineLayoutData</code> objects. Every control in the
 * status line must have a unique <code>StatusLineLayoutData</code> instance or
 * <code>null</code>.
 * </p>
 *
 * @since 2.1
 */
public class StatusLineLayoutData {
    /**
     * The <code>widthHint</code> specifies a minimum width for
     * the <code>Control</code>. A value of <code>SWT.DEFAULT</code>
     * indicates that no minimum width is specified.
     *
     * The default value is <code>SWT.DEFAULT</code>.
     */
    public int widthHint = SWT.DEFAULT;

    /**
     * The <code>heightHint</code> specifies a minimum height for
     * the <code>Control</code>. A value of <code>SWT.DEFAULT</code>
     * indicates that no minimum height is specified.
     *
     * The default value is <code>SWT.DEFAULT</code>.
     */
    public int heightHint = SWT.DEFAULT;

    /**
     * Creates an initial status line layout data object.
     */
    public this() {
        //super();
    }
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
