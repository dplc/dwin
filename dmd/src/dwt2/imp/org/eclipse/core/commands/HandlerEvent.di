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
module org.eclipse.core.commands.HandlerEvent;

import org.eclipse.core.commands.common.AbstractBitSetEvent;
import org.eclipse.core.commands.IHandler;
import java.lang.all;

/**
 * An instance of this class describes changes to an instance of
 * <code>IHandler</code>.
 * <p>
 * This class is not intended to be extended by clients.
 * </p>
 *
 * @since 3.1
 * @see IHandlerListener#handlerChanged(HandlerEvent)
 */
public final class HandlerEvent : AbstractBitSetEvent {

    /**
     * The bit used to represent whether the handler has changed its enabled
     * state.
     */
    private static final int CHANGED_ENABLED = 1;

    /**
     * The bit used to represent whether the handler has changed its handled
     * state.
     */
    private static final int CHANGED_HANDLED = 1 << 1;

    /**
     * The handler that changed; this value is never <code>null</code>.
     */
    private final IHandler handler;

    /**
     * Creates a new instance of this class.
     *
     * @param handler
     *            the instance of the interface that changed; must not be
     *            <code>null</code>.
     * @param enabledChanged
     *            Whether the enabled state of the handler has changed.
     * @param handledChanged
     *            Whether the handled state of the handler has changed.
     */
    public this(IHandler handler, bool enabledChanged,
            bool handledChanged) {
        if (handler is null) {
            throw new NullPointerException();
        }
        this.handler = handler;

        if (enabledChanged) {
            changedValues |= CHANGED_ENABLED;
        }
        if (handledChanged) {
            changedValues |= CHANGED_HANDLED;
        }
    }

    /**
     * Returns the instance of the interface that changed.
     *
     * @return the instance of the interface that changed. Guaranteed not to be
     *         <code>null</code>.
     */
    public IHandler getHandler() {
        return handler;
    }

    /**
     * Returns whether or not the enabled property changed.
     *
     * @return <code>true</code>, iff the enabled property changed.
     */
    public bool isEnabledChanged() {
        return ((changedValues & CHANGED_ENABLED) !is 0);
    }

    /**
     * Returns whether or not the handled property changed.
     *
     * @return <code>true</code>, iff the handled property changed.
     */
    public bool isHandledChanged() {
        return ((changedValues & CHANGED_HANDLED) !is 0);
    }
}

version (build) {
    debug {
        pragma(link, "dwt2corecommands");
    } else {
        pragma(link, "dwt2corecommands");
    }
}
