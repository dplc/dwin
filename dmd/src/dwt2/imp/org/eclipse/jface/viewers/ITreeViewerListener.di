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
module org.eclipse.jface.viewers.ITreeViewerListener;

import java.lang.all;

import org.eclipse.jface.viewers.TreeExpansionEvent;

/**
 * A listener which is notified when a tree viewer expands or collapses
 * a node.
 */
public interface ITreeViewerListener {
    /**
     * Notifies that a node in the tree has been collapsed.
     *
     * @param event event object describing details
     */
    public void treeCollapsed(TreeExpansionEvent event);

    /**
     * Notifies that a node in the tree has been expanded.
     *
     * @param event event object describing details
     */
    public void treeExpanded(TreeExpansionEvent event);
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
