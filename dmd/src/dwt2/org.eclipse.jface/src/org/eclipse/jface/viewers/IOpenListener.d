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
module org.eclipse.jface.viewers.IOpenListener;

import java.lang.all;

import org.eclipse.jface.viewers.OpenEvent;

/**
 * A listener which is notified of open events on viewers.
 */
public interface IOpenListener {
    /**
     * Notifies of an open event.
     *
     * @param event event object describing the open event
     */
    public void open(OpenEvent event);
}
