/*******************************************************************************
 * Copyright (c) 2000, 2005 IBM Corporation and others.
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
module org.eclipse.jface.window.IShellProvider;

import java.lang.all;

import org.eclipse.swt.widgets.Shell;

/**
 * Interface for objects that can return a shell. This is normally used for 
 * opening child windows. An object that wants to open child shells can take 
 * an IShellProvider in its constructor, and the object that implements IShellProvider
 * can dynamically choose where child shells should be opened.  
 * 
 * @since 3.1
 */
public interface IShellProvider {
    /**
     * Returns the current shell (or null if none). This return value may
     * change over time, and should not be cached.
     * 
     * @return the current shell or null if none
     */
    Shell getShell();
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
