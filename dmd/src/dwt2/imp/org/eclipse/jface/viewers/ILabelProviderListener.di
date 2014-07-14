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
module org.eclipse.jface.viewers.ILabelProviderListener;

import java.lang.all;

import org.eclipse.jface.viewers.LabelProviderChangedEvent;

/**
 * A listener which is notified when a label provider's state changes.
 *
 * @see IBaseLabelProvider#addListener
 * @see IBaseLabelProvider#removeListener
 */
public interface ILabelProviderListener {
    /**
     * Notifies this listener that the state of the label provider
     * has changed in a way that affects the labels it computes.
     * <p>
     * A typical response would be to refresh all labels by
     * re-requesting them from the label provider.
     * </p>
     *
     * @param event the label provider change event
     */
    public void labelProviderChanged(LabelProviderChangedEvent event);
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}