/*******************************************************************************
 * Copyright (c) 2007, 2008 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *     Tom Schindl <tom.schindl@bestsolution.at> - initial API and implementation
 *                                                 fixes in bug: 178946
 * Port to the D programming language:
 *     Frank Benoit <benoit@tionex.de>
 *******************************************************************************/

module org.eclipse.jface.viewers.ColumnViewerEditorDeactivationEvent;

import java.lang.all;
import java.util.EventObject;

/**
 * This event is fired when an editor deactivated
 *
 * @since 3.3
 * @noextend This class is not intended to be subclassed by clients.
 *
 */
public class ColumnViewerEditorDeactivationEvent : EventObject {

    /**
     *
     */
    private static const long serialVersionUID = 1L;

    /**
     * The event type
     * @since 3.4
     */
    public int eventType;

    /**
     * Event when editor is canceled
     * @since 3.4
     */
    public static final int EDITOR_CANCELED = 1;

    /**
     * Event when editor is saved
     * @since 3.4
     */
    public static final int EDITOR_SAVED = 2;

    /**
     * @param source
     */
    public this(Object source) {
        super(source);
    }
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
