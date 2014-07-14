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
module org.eclipse.jface.viewers.IInputSelectionProvider;

import java.lang.all;

import org.eclipse.jface.viewers.IInputProvider;
import org.eclipse.jface.viewers.ISelectionProvider;

/**
 * Interface common to all objects that provide both an input and
 * a selection.
 */
public interface IInputSelectionProvider : IInputProvider,
        ISelectionProvider {
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
