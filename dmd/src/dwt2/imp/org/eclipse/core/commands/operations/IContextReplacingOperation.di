/*******************************************************************************
 * Copyright (c) 2005, 2006 IBM Corporation and others.
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
module org.eclipse.core.commands.operations.IContextReplacingOperation;

import org.eclipse.core.commands.operations.IUndoContext;

import java.lang.all;

/**
 * IContextReplacingOperation defines an interface for undoable operations that
 * can replace one undo context with another undo context. It is used by
 * operations, such as composite operations, where removing and adding an undo
 * context would not have the same semantic as replacing one undo context with
 * another.
 *
 * @since 3.2
 *
 */
public interface IContextReplacingOperation {

    /**
     * Replace the undo context of the receiver with the provided replacement
     * undo context.
     * <p>
     * This message has no effect if the original undo context is not present in
     * the receiver.
     *
     * @param original the undo context which is to be replaced
     * @param replacement the undo context which is replacing the original
     *
     */
    void replaceContext(IUndoContext original, IUndoContext replacement);
}

version (build) {
    debug {
        pragma(link, "dwt2corecommands");
    } else {
        pragma(link, "dwt2corecommands");
    }
}
