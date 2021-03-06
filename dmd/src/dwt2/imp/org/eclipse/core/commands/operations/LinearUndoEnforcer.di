/*******************************************************************************
 * Copyright (c) 2005 IBM Corporation and others.
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
module org.eclipse.core.commands.operations.LinearUndoEnforcer;

import org.eclipse.core.runtime.IAdaptable;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Status;

import org.eclipse.core.commands.operations.LinearUndoViolationDetector;
import org.eclipse.core.commands.operations.IUndoableOperation;
import org.eclipse.core.commands.operations.IUndoContext;
import org.eclipse.core.commands.operations.IOperationHistory;

import java.lang.all;

/**
 * <p>
 * An operation approver that enforces a strict linear undo. It does not allow
 * the undo or redo of any operation that is not the latest available operation
 * in all of its undo contexts.  This class may be instantiated by clients.
 * </p>
 *
 * @since 3.1
 */
public final class LinearUndoEnforcer : LinearUndoViolationDetector {
    /**
     * Create an instance of LinearUndoEnforcer.
     */
    public this() {
        super();
    }

    /*
     * Return whether a linear redo violation is allowable.  A linear redo violation
     * is defined as a request to redo a particular operation even if it is not the most
     * recently added operation to the redo history.
     */
    protected override IStatus allowLinearRedoViolation(IUndoableOperation operation,
            IUndoContext context, IOperationHistory history, IAdaptable uiInfo) {
        return Status.CANCEL_STATUS;
    }

    /*
     * Return whether a linear undo violation is allowable.  A linear undo violation
     * is defined as a request to undo a particular operation even if it is not the most
     * recently added operation to the undo history.
     */
    protected override IStatus allowLinearUndoViolation(IUndoableOperation operation,
            IUndoContext context, IOperationHistory history, IAdaptable uiInfo) {
        return Status.CANCEL_STATUS;
    }

}

version (build) {
    debug {
        pragma(link, "dwt2corecommands");
    } else {
        pragma(link, "dwt2corecommands");
    }
}
