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
module org.eclipse.jface.viewers.DoubleClickEvent;

import org.eclipse.jface.viewers.ISelection;
import org.eclipse.jface.viewers.Viewer;

import org.eclipse.core.runtime.Assert;

import java.lang.all;
import java.util.EventObject;

/**
 * Event object describing a double-click. The source of these
 * events is a viewer.
 *
 * @see IDoubleClickListener
 */
public class DoubleClickEvent : EventObject {

    /**
     * Generated serial version UID for this class.
     * @since 3.1
     */
    private static const long serialVersionUID = 3258408443605038133L;

    /**
     * The selection.
     */
    protected ISelection selection;

    /**
     * Creates a new event for the given source and selection.
     *
     * @param source the viewer
     * @param selection the selection
     */
    public this(Viewer source, ISelection selection) {
        super(source);
        Assert.isNotNull(cast(Object)selection);
        this.selection = selection;
    }

    /**
     * Returns the selection.
     *
     * @return the selection
     */
    public ISelection getSelection() {
        return selection;
    }

    /**
     * Returns the viewer that is the source of this event.
     *
     * @return the originating viewer
     */
    public Viewer getViewer() {
        return cast(Viewer) getSource();
    }
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
