/*******************************************************************************
 * Copyright (c) 2005, 2007 IBM Corporation and others.
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
module org.eclipse.core.commands.operations.DefaultOperationHistory;

import org.eclipse.core.commands.ExecutionException;
import org.eclipse.core.commands.util.Tracing;
import org.eclipse.core.runtime.Assert;
import org.eclipse.core.runtime.IAdaptable;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.ISafeRunnable;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.ListenerList;
import org.eclipse.core.runtime.OperationCanceledException;
import org.eclipse.core.runtime.SafeRunner;
import org.eclipse.core.runtime.Status;

import org.eclipse.core.commands.operations.IOperationHistory;
import org.eclipse.core.commands.operations.IUndoContext;
import org.eclipse.core.commands.operations.IUndoableOperation;
import org.eclipse.core.commands.operations.ICompositeOperation;
import org.eclipse.core.commands.operations.IOperationApprover;
import org.eclipse.core.commands.operations.IOperationApprover2;
import org.eclipse.core.commands.operations.IOperationHistoryListener;
import org.eclipse.core.commands.operations.OperationHistoryEvent;
import org.eclipse.core.commands.operations.IAdvancedUndoableOperation;

import java.lang.all;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

/**
 * <p>
 * A base implementation of IOperationHistory that implements a linear undo and
 * redo model . The most recently added operation is available for undo, and the
 * most recently undone operation is available for redo.
 * </p>
 * <p>
 * If the operation eligible for undo is not in a state where it can be undone,
 * then no undo is available. No other operations are considered. Likewise, if
 * the operation available for redo cannot be redone, then no redo is available.
 * </p>
 * <p>
 * Implementations for the direct undo and redo of a specified operation are
 * available. If a strict linear undo is to be enforced, than an
 * IOperationApprover should be installed that prevents undo and redo of any
 * operation that is not the most recently undone or redone operation in all of
 * its undo contexts.
 * </p>
 * <p>
 * The data structures used by the DefaultOperationHistory are synchronized, and
 * entry points that modify the undo and redo history concurrently are also
 * synchronized. This means that the DefaultOperationHistory is relatively
 * "thread-friendly" in its implementation. Outbound notifications or operation
 * approval requests will occur on the thread that initiated the request.
 * Clients may use DefaultOperationHistory API from any thread; however,
 * listeners or operation approvers that receive notifications from the
 * DefaultOperationHistory must be prepared to receive these notifications from
 * a background thread. Any UI access occurring inside these notifications must
 * be properly synchronized using the techniques specified by the client's
 * widget library.
 * </p>
 *
 * <p>
 * This implementation is not intended to be subclassed.
 * </p>
 *
 * @see org.eclipse.core.commands.operations.IOperationHistory
 * @see org.eclipse.core.commands.operations.IOperationApprover
 *
 * @since 3.1
 */
public final class DefaultOperationHistory : IOperationHistory {
    /**
     * This flag can be set to <code>true</code> if the history should print
     * information to <code>System.out</code> whenever notifications about
     * changes to the history occur. This flag should be used for debug purposes
     * only.
     */
    public static bool DEBUG_OPERATION_HISTORY_NOTIFICATION = false;

    /**
     * This flag can be set to <code>true</code> if the history should print
     * information to <code>System.out</code> whenever an unexpected condition
     * arises. This flag should be used for debug purposes only.
     */
    public static bool DEBUG_OPERATION_HISTORY_UNEXPECTED = false;

    /**
     * This flag can be set to <code>true</code> if the history should print
     * information to <code>System.out</code> whenever an undo context is
     * disposed. This flag should be used for debug purposes only.
     */
    public static bool DEBUG_OPERATION_HISTORY_DISPOSE = false;

    /**
     * This flag can be set to <code>true</code> if the history should print
     * information to <code>System.out</code> during the open/close sequence.
     * This flag should be used for debug purposes only.
     */
    public static bool DEBUG_OPERATION_HISTORY_OPENOPERATION = false;

    /**
     * This flag can be set to <code>true</code> if the history should print
     * information to <code>System.out</code> whenever an operation is not
     * approved. This flag should be used for debug purposes only.
     */
    public static bool DEBUG_OPERATION_HISTORY_APPROVAL = false;

    static const int DEFAULT_LIMIT = 20;

    /**
     * the list of {@link IOperationApprover}s
     */
    ListenerList approvers;

    /**
     * a map of undo limits per context
     */
    private Map limits;

    /**
     * the list of {@link IOperationHistoryListener}s
     */
    ListenerList listeners;

    /**
     * the list of operations available for redo, LIFO
     */
    private List redoList;

    /**
     * the list of operations available for undo, LIFO
     */
    private List undoList;

    /**
     * a lock that is used to synchronize access between the undo and redo
     * history
     */
    final Object undoRedoHistoryLock;

    /**
     * An operation that is "absorbing" all other operations while it is open.
     * When this is not null, other operations added or executed are added to
     * this composite.
     *
     */
    private ICompositeOperation openComposite = null;

    /**
     * a lock that is used to synchronize access to the open composite.
     */
    const Object openCompositeLock;

    /**
     * Create an instance of DefaultOperationHistory.
     */
    public this() {
        openCompositeLock = new Object();
        undoRedoHistoryLock = new Object();
        approvers = new ListenerList(ListenerList.IDENTITY);
        limits =  Collections.synchronizedMap(new HashMap());
        listeners = new ListenerList(ListenerList.IDENTITY);
        redoList = Collections.synchronizedList(new ArrayList());
        undoList = Collections.synchronizedList(new ArrayList());
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#add(org.eclipse.core.commands.operations.IUndoableOperation)
     */
    public void add(IUndoableOperation operation) {
        Assert.isNotNull( cast(Object)operation);

        /*
         * If we are in the middle of executing an open batching operation, and
         * this is not that operation, then we need only add the context of the
         * new operation to the batch. The operation itself is disposed since we
         * will never undo or redo it. We consider it to be triggered by the
         * batching operation and assume that its undo will be triggered by the
         * batching operation undo.
         */
        synchronized (openCompositeLock) {
            if (openComposite !is null && openComposite !is operation) {
                openComposite.add(operation);
                return;
            }
        }

        if (checkUndoLimit(operation)) {
            synchronized (undoRedoHistoryLock) {
                undoList.add(cast(Object)operation);
            }
            notifyAdd(operation);

            // flush redo stack for related contexts
            IUndoContext[] contexts = operation.getContexts();
            for (int i = 0; i < contexts.length; i++) {
                flushRedo(contexts[i]);
            }
        } else {
            // Dispose the operation since we will not have a reference to it.
            operation.dispose();
        }
    }

    /**
     * <p>
     * Add the specified approver to the list of operation approvers consulted
     * by the operation history before an undo or redo is allowed to proceed.
     * This method has no effect if the instance being added is already in the
     * list.
     * </p>
     * <p>
     * Operation approvers must be prepared to receive these the operation
     * approval messages from a background thread. Any UI access occurring
     * inside the implementation must be properly synchronized using the
     * techniques specified by the client's widget library.
     * </p>
     *
     * @param approver
     *            the IOperationApprover to be added as an approver.
     *
     */

    public void addOperationApprover(IOperationApprover approver) {
        approvers.add(cast(Object)approver);
    }

    /**
     * <p>
     * Add the specified listener to the list of operation history listeners
     * that are notified about changes in the history or operations that are
     * executed, undone, or redone. This method has no effect if the instance
     * being added is already in the list.
     * </p>
     * <p>
     * Operation history listeners must be prepared to receive notifications
     * from a background thread. Any UI access occurring inside the
     * implementation must be properly synchronized using the techniques
     * specified by the client's widget library.
     * </p>
     *
     * @param listener
     *            the IOperationHistoryListener to be added as a listener.
     *
     * @see org.eclipse.core.commands.operations.IOperationHistoryListener
     * @see org.eclipse.core.commands.operations.OperationHistoryEvent
     */
    public void addOperationHistoryListener(IOperationHistoryListener listener) {
        listeners.add(cast(Object)listener);
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#canRedo(org.eclipse.core.commands.operations.IUndoContext)
     */
    public bool canRedo(IUndoContext context) {
        // null context is allowed and passed through
        IUndoableOperation operation = getRedoOperation(context);
        return (operation !is null && operation.canRedo());
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#canUndo(org.eclipse.core.commands.operations.IUndoContext)
     */
    public bool canUndo(IUndoContext context) {
        // null context is allowed and passed through
        IUndoableOperation operation = getUndoOperation(context);
        return (operation !is null && operation.canUndo());
    }

    /**
     * Check the redo limit before adding an operation. In theory the redo limit
     * should never be reached, because the redo items are transferred from the
     * undo history, which has the same limit. The redo history is cleared
     * whenever a new operation is added. We check for completeness since
     * implementations may change over time.
     *
     * Return a bool indicating whether the redo should proceed.
     */
    private bool checkRedoLimit(IUndoableOperation operation) {
        IUndoContext[] contexts = operation.getContexts();
        for (int i = 0; i < contexts.length; i++) {
            int limit = getLimit(contexts[i]);
            if (limit > 0) {
                forceRedoLimit(contexts[i], limit - 1);
            } else {
                // this context has a 0 limit
                operation.removeContext(contexts[i]);
            }
        }
        return operation.getContexts().length > 0;
    }

    /**
     * Check the undo limit before adding an operation. Return a bool
     * indicating whether the undo should proceed.
     */
    private bool checkUndoLimit(IUndoableOperation operation) {
        IUndoContext[] contexts = operation.getContexts();
        for (int i = 0; i < contexts.length; i++) {
            int limit = getLimit(contexts[i]);
            if (limit > 0) {
                forceUndoLimit(contexts[i], limit - 1);
            } else {
                // this context has a 0 limit
                operation.removeContext(contexts[i]);
            }
        }
        return operation.getContexts().length > 0;
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#dispose(org.eclipse.core.commands.operations.IUndoContext,
     *      bool, bool, bool)
     */
    public void dispose(IUndoContext context, bool flushUndo_,
            bool flushRedo_, bool flushContext_) {
        // dispose of any limit that was set for the context if it is not to be
        // used again.
        if (flushContext_) {
            if (DEBUG_OPERATION_HISTORY_DISPOSE) {
                Tracing.printTrace("OPERATIONHISTORY", "Flushing context " //$NON-NLS-1$//$NON-NLS-2$
                        ~ (cast(Object)context).toString );
            }
            flushUndo(context);
            flushRedo(context);
            limits.remove(cast(Object)context);
            return;
        }
        if (flushUndo_) {
            flushUndo(context);
        }
        if (flushRedo_) {
            flushRedo(context);
        }

    }

    /**
     * Perform the redo. All validity checks have already occurred.
     *
     * @param monitor
     * @param operation
     */
    private IStatus doRedo(IProgressMonitor monitor, IAdaptable info,
            IUndoableOperation operation) {

        IStatus status = getRedoApproval(operation, info);
        if (status.isOK()) {
            notifyAboutToRedo(operation);
            try {
                status = operation.redo(monitor, info);
            } catch (OperationCanceledException e) {
                status = Status.CANCEL_STATUS;
            } catch (ExecutionException e) {
                notifyNotOK(operation);
                if (DEBUG_OPERATION_HISTORY_UNEXPECTED) {
                    Tracing.printTrace("OPERATIONHISTORY", //$NON-NLS-1$
                            "ExecutionException while redoing " ~ (cast(Object)operation).toString ); //$NON-NLS-1$
                }
                throw e;
            } catch (Exception e) {
                notifyNotOK(operation);
                if (DEBUG_OPERATION_HISTORY_UNEXPECTED) {
                    Tracing.printTrace("OPERATIONHISTORY", //$NON-NLS-1$
                            "Exception while redoing " ~ (cast(Object)operation).toString); //$NON-NLS-1$
                }
                throw new ExecutionException(
                        "While redoing the operation, an exception occurred", e); //$NON-NLS-1$
            }
        }

        // if successful, the operation is removed from the redo history and
        // placed back in the undo history.
        if (status.isOK()) {
            bool addedToUndo = true;
            synchronized (undoRedoHistoryLock) {
                redoList.remove(cast(Object)operation);
                if (checkUndoLimit(operation)) {
                    undoList.add(cast(Object)operation);
                } else {
                    addedToUndo = false;
                }
            }
            // dispose the operation since we could not add it to the
            // stack and will no longer have a reference to it.
            if (!addedToUndo) {
                operation.dispose();
            }

            // notify listeners must happen after history is updated
            notifyRedone(operation);
        } else {
            notifyNotOK(operation, status);
        }

        return status;
    }

    /**
     * Perform the undo. All validity checks have already occurred.
     *
     * @param monitor
     * @param operation
     */
    private IStatus doUndo(IProgressMonitor monitor, IAdaptable info,
            IUndoableOperation operation) {
        IStatus status = getUndoApproval(operation, info);
        if (status.isOK()) {
            notifyAboutToUndo(operation);
            try {
                status = operation.undo(monitor, info);
            } catch (OperationCanceledException e) {
                status = Status.CANCEL_STATUS;
            } catch (ExecutionException e) {
                notifyNotOK(operation);
                if (DEBUG_OPERATION_HISTORY_UNEXPECTED) {
                    Tracing.printTrace("OPERATIONHISTORY", //$NON-NLS-1$
                            "ExecutionException while undoing " ~ (cast(Object)operation).toString); //$NON-NLS-1$
                }
                throw e;
            } catch (Exception e) {
                notifyNotOK(operation);
                if (DEBUG_OPERATION_HISTORY_UNEXPECTED) {
                    Tracing.printTrace("OPERATIONHISTORY", //$NON-NLS-1$
                            "Exception while undoing " ~ (cast(Object)operation).toString); //$NON-NLS-1$
                }
                throw new ExecutionException(
                        "While undoing the operation, an exception occurred", e); //$NON-NLS-1$
            }
        }
        // if successful, the operation is removed from the undo history and
        // placed in the redo history.
        if (status.isOK()) {
            bool addedToRedo = true;
            synchronized (undoRedoHistoryLock) {
                undoList.remove(cast(Object)operation);
                if (checkRedoLimit(operation)) {
                    redoList.add(cast(Object)operation);
                } else {
                    addedToRedo = false;
                }
            }
            // dispose the operation since we could not add it to the
            // stack and will no longer have a reference to it.
            if (!addedToRedo) {
                operation.dispose();
            }
            // notification occurs after the undo and redo histories are
            // adjusted
            notifyUndone(operation);
        } else {
            notifyNotOK(operation, status);
        }
        return status;
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#execute(org.eclipse.core.commands.operations.IUndoableOperation,
     *      org.eclipse.core.runtime.IProgressMonitor,
     *      org.eclipse.core.runtime.IAdaptable)
     */
    public IStatus execute(IUndoableOperation operation,
            IProgressMonitor monitor, IAdaptable info) {
        Assert.isNotNull(cast(Object)operation);

        // error if operation is invalid
        if (!operation.canExecute()) {
            return IOperationHistory.OPERATION_INVALID_STATUS;
        }

        // check with the operation approvers
        IStatus status = getExecuteApproval(operation, info);
        if (!status.isOK()) {
            // not approved. No notifications are sent, just return the status.
            return status;
        }

        /*
         * If we are in the middle of an open composite, then we will add this
         * operation to the open operation rather than add the operation to the
         * history. We will still execute it.
         */
        bool merging = false;
        synchronized (openCompositeLock) {
            if (openComposite !is null) {
                // the composite shouldn't be executed explicitly while it is
                // still
                // open
                if (openComposite is operation) {
                    return IOperationHistory.OPERATION_INVALID_STATUS;
                }
                openComposite.add(operation);
                merging = true;
            }
        }

        /*
         * Execute the operation
         */
        if (!merging) {
            notifyAboutToExecute(operation);
        }
        try {
            status = operation.execute(monitor, info);
        } catch (OperationCanceledException e) {
            status = Status.CANCEL_STATUS;
        } catch (ExecutionException e) {
            notifyNotOK(operation);
            throw e;
        } catch (Exception e) {
            notifyNotOK(operation);
            throw new ExecutionException(
                    "While executing the operation, an exception occurred", e); //$NON-NLS-1$
        }

        // if successful, the notify listeners are notified and the operation is
        // added to the history
        if (!merging) {
            if (status.isOK()) {
                notifyDone(operation);
                add(operation);
            } else {
                notifyNotOK(operation, status);
                // dispose the operation since we did not add it to the stack
                // and will no longer have a reference to it.
                operation.dispose();
            }
        }
        // all other severities are not interpreted. Simply return the status.
        return status;
    }

    /*
     * Filter the specified list to include only the specified undo context.
     */
    private IUndoableOperation[] filter(List list, IUndoContext context) {
        /*
         * This method is used whenever there is a need to filter the undo or
         * redo history on a particular context. Currently there are no caches
         * kept to optimize repeated requests for the same filter. If benchmarks
         * show this to be a common pattern that causes performances problems,
         * we could implement a filtered cache here that is nullified whenever
         * the global history changes.
         */

        List filtered = new ArrayList();
        Iterator iterator = list.iterator();
        synchronized (undoRedoHistoryLock) {
            while (iterator.hasNext()) {
                IUndoableOperation operation = cast(IUndoableOperation) iterator
                        .next();
                if (operation.hasContext(context)) {
                    filtered.add(cast(Object)operation);
                }
            }
        }
        return arraycast!(IUndoableOperation)( filtered
                .toArray());
    }

    /*
     * Flush the redo stack of all operations that have the given context.
     */
    private void flushRedo(IUndoContext context) {
        if (DEBUG_OPERATION_HISTORY_DISPOSE) {
            Tracing.printTrace("OPERATIONHISTORY", "Flushing redo history for " //$NON-NLS-1$ //$NON-NLS-2$
                    ~ (cast(Object)context).toString );
        }

        IUndoableOperation[] filtered = filter(redoList, context);
        for (int i = 0; i < filtered.length; i++) {
            IUndoableOperation operation =  cast(IUndoableOperation) filtered[i];
            if (context is GLOBAL_UNDO_CONTEXT
                    || operation.getContexts().length is 1) {
                // remove the operation if it only has the context or we are
                // flushing all
                redoList.remove(cast(Object)operation);
                internalRemove(operation);
            } else {
                // remove the reference to the context.
                // See https://bugs.eclipse.org/bugs/show_bug.cgi?id=161786
                // It is not enough to simply remove the context. There could
                // be one or more contexts that match the one we are trying to
                // dispose.
                IUndoContext[] contexts = operation.getContexts();
                for (int j = 0; j < contexts.length; j++) {
                    if (contexts[j].matches(context)) {
                        operation.removeContext(contexts[j]);
                    }
                }
                if (operation.getContexts().length is 0) {
                    redoList.remove(cast(Object)operation);
                    internalRemove(operation);
                }
            }
        }
    }

    /*
     * Flush the undo stack of all operations that have the given context.
     */
    private void flushUndo(IUndoContext context) {
        if (DEBUG_OPERATION_HISTORY_DISPOSE) {
            Tracing.printTrace("OPERATIONHISTORY", "Flushing undo history for " //$NON-NLS-1$ //$NON-NLS-2$
                    ~ (cast(Object)context).toString );
        }

        // Get all operations that have the context (or one that matches)
        IUndoableOperation[] filtered = filter(undoList, context);
        for (int i = 0; i < filtered.length; i++) {
            IUndoableOperation operation = cast(IUndoableOperation) filtered[i];
            if (context is GLOBAL_UNDO_CONTEXT
                    || operation.getContexts().length is 1) {
                // remove the operation if it only has the context or we are
                // flushing all
                undoList.remove(cast(Object)operation);
                internalRemove(operation);
            } else {
                // remove the reference to the context.
                // See https://bugs.eclipse.org/bugs/show_bug.cgi?id=161786
                // It is not enough to simply remove the context. There could
                // be one or more contexts that match the one we are trying to
                // dispose.
                IUndoContext[] contexts = operation.getContexts();
                for (int j = 0; j < contexts.length; j++) {
                    if (contexts[j].matches(context)) {
                        operation.removeContext(contexts[j]);
                    }
                }
                if (operation.getContexts().length is 0) {
                    undoList.remove(cast(Object)operation);
                    internalRemove(operation);
                }
            }
        }
        /*
         * There may be an open composite. If it has this context, then the
         * context must be removed. If it has only this context or we are
         * flushing all operations, then null it out and notify that we are
         * ending it. We don't remove it since it was never added.
         */
        ICompositeOperation endedComposite = null;
        synchronized (openCompositeLock) {
            if (openComposite !is null) {
                if (openComposite.hasContext(context)) {
                    if (context is GLOBAL_UNDO_CONTEXT
                            || openComposite.getContexts().length is 1) {
                        endedComposite = openComposite;
                        openComposite = null;
                    } else {
                        openComposite.removeContext(context);
                    }
                }
            }
        }
        // notify outside of the synchronized block.
        if (endedComposite !is null) {
            notifyNotOK(endedComposite);
        }
    }

    /*
     * Force the redo history for the given context to contain max or less
     * items.
     */
    private void forceRedoLimit(IUndoContext context, int max) {
        IUndoableOperation[] filtered = filter(redoList, context);
        int size = filtered.length;
        if (size > 0) {
            int index = 0;
            while (size > max) {
                IUndoableOperation removed = cast(IUndoableOperation)filtered[index];
                if (context is GLOBAL_UNDO_CONTEXT
                        || removed.getContexts().length is 1) {
                    /*
                     * remove the operation if we are enforcing a global limit
                     * or if the operation only has the specified context
                     */
                    redoList.remove(cast(Object)removed);
                    internalRemove(removed);
                } else {
                    /*
                     * if the operation has multiple contexts and we've reached
                     * the limit for only one of them, then just remove the
                     * context, not the operation.
                     */
                    removed.removeContext(context);
                }
                size--;
                index++;
            }
        }
    }

    /*
     * Force the undo history for the given context to contain max or less
     * items.
     */
    private void forceUndoLimit(IUndoContext context, int max) {
        IUndoableOperation[] filtered = filter(undoList, context);
        int size = filtered.length;
        if (size > 0) {
            int index = 0;
            while (size > max) {
                IUndoableOperation removed = cast(IUndoableOperation)filtered[index];
                if (context is GLOBAL_UNDO_CONTEXT
                        || removed.getContexts().length is 1) {
                    /*
                     * remove the operation if we are enforcing a global limit
                     * or if the operation only has the specified context
                     */
                    undoList.remove(cast(Object)removed);
                    internalRemove(removed);
                } else {
                    /*
                     * if the operation has multiple contexts and we've reached
                     * the limit for only one of them, then just remove the
                     * context, not the operation.
                     */
                    removed.removeContext(context);
                }
                size--;
                index++;
            }
        }
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#getLimit()
     */
    public int getLimit(IUndoContext context) {
        if (!limits.containsKey(cast(Object)context)) {
            return DEFAULT_LIMIT;
        }
        return (cast(Integer) (limits.get(cast(Object)context))).intValue();
    }

    /*
     * Consult the IOperationApprovers to see if the proposed redo should be
     * allowed.
     */
    private IStatus getRedoApproval(IUndoableOperation operation,
            IAdaptable info) {

        Object[] approverArray = approvers.getListeners();

        for (int i = 0; i < approverArray.length; i++) {
            IOperationApprover approver = cast(IOperationApprover) approverArray[i];
            IStatus approval = approver.proceedRedoing(operation, this, info);
            if (!approval.isOK()) {
                if (DEBUG_OPERATION_HISTORY_APPROVAL) {
                    Tracing.printTrace("OPERATIONHISTORY", //$NON-NLS-1$
                            "Redo not approved by " ~ (cast(Object)approver).toString //$NON-NLS-1$
                                    ~ "for operation " ~ (cast(Object)operation).toString //$NON-NLS-1$
                                    ~ " approved by " ~ (cast(Object)approval).toString); //$NON-NLS-1$
                }
                return approval;
            }
        }
        return Status.OK_STATUS;
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#getRedoHistory(org.eclipse.core.commands.operations.IUndoContext)
     */
    public IUndoableOperation[] getRedoHistory(IUndoContext context) {
        Assert.isNotNull(cast(Object)context);
        return filter(redoList, context);
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#getOperation(org.eclipse.core.commands.operations.IUndoContext)
     */
    public IUndoableOperation getRedoOperation(IUndoContext context) {
        Assert.isNotNull(cast(Object)context);
        synchronized (undoRedoHistoryLock) {
            for (int i = redoList.size() - 1; i >= 0; i--) {
                IUndoableOperation operation = cast(IUndoableOperation) redoList
                        .get(i);
                if (operation.hasContext(context)) {
                    return operation;
                }
            }
        }
        return null;
    }

    /*
     * Consult the IOperationApprovers to see if the proposed undo should be
     * allowed.
     */
    private IStatus getUndoApproval(IUndoableOperation operation,
            IAdaptable info) {

        final Object[] approverArray = approvers.getListeners();

        for (int i = 0; i < approverArray.length; i++) {
            IOperationApprover approver = cast(IOperationApprover) approverArray[i];
            IStatus approval = approver.proceedUndoing(operation, this, info);
            if (!approval.isOK()) {
                if (DEBUG_OPERATION_HISTORY_APPROVAL) {
                    Tracing.printTrace("OPERATIONHISTORY", //$NON-NLS-1$
                            "Undo not approved by " ~ (cast(Object)approver).toString //$NON-NLS-1$
                                    ~ "for operation " ~ (cast(Object)operation ).toString//$NON-NLS-1$
                                    ~ " with status " ~ (cast(Object)approval).toString); //$NON-NLS-1$
                }
                return approval;
            }
        }
        return Status.OK_STATUS;
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#getUndoHistory(org.eclipse.core.commands.operations.IUndoContext)
     */
    public IUndoableOperation[] getUndoHistory(IUndoContext context) {
        Assert.isNotNull(cast(Object)context);
        return filter(undoList, context);
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#getUndoOperation(org.eclipse.core.commands.operations.IUndoContext)
     */
    public IUndoableOperation getUndoOperation(IUndoContext context) {
        Assert.isNotNull(cast(Object)context);
        synchronized (undoRedoHistoryLock) {
            for (int i = undoList.size() - 1; i >= 0; i--) {
                IUndoableOperation operation = cast(IUndoableOperation) undoList
                        .get(i);
                if (operation.hasContext(context)) {
                    return operation;
                }
            }
        }
        return null;
    }

    /*
     * Consult the IOperationApprovers to see if the proposed execution should
     * be allowed.
     *
     * @since 3.2
     */
    private IStatus getExecuteApproval(IUndoableOperation operation,
            IAdaptable info) {

        final Object[] approverArray = approvers.getListeners();

        for (int i = 0; i < approverArray.length; i++) {
            if ( auto apro = cast(IOperationApprover2)approverArray[i]  ) {
                IOperationApprover2 approver = apro;
                IStatus approval = approver.proceedExecuting(operation, this,
                        info);
                if (!approval.isOK()) {
                    if (DEBUG_OPERATION_HISTORY_APPROVAL) {
                        Tracing.printTrace("OPERATIONHISTORY", //$NON-NLS-1$
                                "Execute not approved by " ~ (cast(Object)approver).toString //$NON-NLS-1$
                                        ~ "for operation " ~ (cast(Object)operation).toString //$NON-NLS-1$
                                        ~ " with status " ~ (cast(Object)approval).toString); //$NON-NLS-1$
                    }
                    return approval;
                }
            }
        }
        return Status.OK_STATUS;
    }

    /*
     * Remove the operation by disposing it and notifying listeners.
     */
    private void internalRemove(IUndoableOperation operation) {
        operation.dispose();
        notifyRemoved(operation);
    }

    /*
     * Notify listeners of an operation event.
     */
    private void notifyListeners(OperationHistoryEvent event) {
        if ( auto e = cast(IAdvancedUndoableOperation)event.getOperation()  ) {
            IAdvancedUndoableOperation advancedOp = e;
            SafeRunner.run(new class(advancedOp) ISafeRunnable {
                IAdvancedUndoableOperation advancedOp_;
                this(IAdvancedUndoableOperation a){ advancedOp_=a;}
                public void handleException(Exception exception) {
                    if (DEBUG_OPERATION_HISTORY_UNEXPECTED) {
                        Tracing.printTrace(
                                        "OPERATIONHISTORY", //$NON-NLS-1$
                                        "Exception during notification callback " ~ exception.toString); //$NON-NLS-1$
                    }
                }

                public void run() {
                    advancedOp_.aboutToNotify(event);
                }
            });
        }
        Object[] listenerArray = listeners.getListeners();
        for (int i = 0; i < listenerArray.length; i++) {
            IOperationHistoryListener listener = cast(IOperationHistoryListener) listenerArray[i];
            SafeRunner.run(new class(listener) ISafeRunnable {
                IOperationHistoryListener listener_;
                this(IOperationHistoryListener a){ listener_=a; }
                public void handleException(Exception exception) {
                    if (DEBUG_OPERATION_HISTORY_UNEXPECTED) {
                        Tracing.printTrace(
                                        "OPERATIONHISTORY", //$NON-NLS-1$
                                        "Exception during notification callback " ~ exception.toString); //$NON-NLS-1$
                    }
                }

                public void run() {
                    listener_.historyNotification(event);
                }
            });
        }
    }

    private void notifyAboutToExecute(IUndoableOperation operation) {
        if (DEBUG_OPERATION_HISTORY_NOTIFICATION) {
            Tracing.printTrace("OPERATIONHISTORY", "ABOUT_TO_EXECUTE " //$NON-NLS-1$ //$NON-NLS-2$
                    ~ (cast(Object)operation).toString);
        }

        notifyListeners(new OperationHistoryEvent(
                OperationHistoryEvent.ABOUT_TO_EXECUTE, this, operation));
    }

    /*
     * Notify listeners that an operation is about to redo.
     */
    private void notifyAboutToRedo(IUndoableOperation operation) {
        if (DEBUG_OPERATION_HISTORY_NOTIFICATION) {
            Tracing.printTrace("OPERATIONHISTORY", "ABOUT_TO_REDO " //$NON-NLS-1$ //$NON-NLS-2$
                    ~ (cast(Object)operation).toString);
        }

        notifyListeners(new OperationHistoryEvent(
                OperationHistoryEvent.ABOUT_TO_REDO, this, operation));
    }

    /*
     * Notify listeners that an operation is about to undo.
     */
    private void notifyAboutToUndo(IUndoableOperation operation) {
        if (DEBUG_OPERATION_HISTORY_NOTIFICATION) {
            Tracing.printTrace("OPERATIONHISTORY", "ABOUT_TO_UNDO " //$NON-NLS-1$ //$NON-NLS-2$
                    ~ (cast(Object)operation).toString);
        }

        notifyListeners(new OperationHistoryEvent(
                OperationHistoryEvent.ABOUT_TO_UNDO, this, operation));
    }

    /*
     * Notify listeners that an operation has been added.
     */
    private void notifyAdd(IUndoableOperation operation) {
        if (DEBUG_OPERATION_HISTORY_NOTIFICATION) {
            Tracing.printTrace("OPERATIONHISTORY", "OPERATION_ADDED " //$NON-NLS-1$ //$NON-NLS-2$
                    ~ (cast(Object)operation).toString);
        }

        notifyListeners(new OperationHistoryEvent(
                OperationHistoryEvent.OPERATION_ADDED, this, operation));
    }

    /*
     * Notify listeners that an operation is done executing.
     */
    private void notifyDone(IUndoableOperation operation) {
        if (DEBUG_OPERATION_HISTORY_NOTIFICATION) {
            Tracing.printTrace("OPERATIONHISTORY", "DONE " ~ (cast(Object)operation).toString); //$NON-NLS-1$ //$NON-NLS-2$
        }

        notifyListeners(new OperationHistoryEvent(OperationHistoryEvent.DONE,
                this, operation));
    }

    /*
     * Notify listeners that an operation did not succeed after an attempt to
     * execute, undo, or redo was made.
     */
    private void notifyNotOK(IUndoableOperation operation) {
        notifyNotOK(operation, null);
    }

    /*
     * Notify listeners that an operation did not succeed after an attempt to
     * execute, undo, or redo was made. Include the status associated with the
     * attempt.
     *
     * @since 3.2
     */
    private void notifyNotOK(IUndoableOperation operation, IStatus status) {
        if (DEBUG_OPERATION_HISTORY_NOTIFICATION) {
            Tracing.printTrace("OPERATIONHISTORY", "OPERATION_NOT_OK " //$NON-NLS-1$ //$NON-NLS-2$
                    ~ (cast(Object)operation).toString);
        }

        notifyListeners(new OperationHistoryEvent(
                OperationHistoryEvent.OPERATION_NOT_OK, this, operation, status));
    }

    /*
     * Notify listeners that an operation was redone.
     */
    private void notifyRedone(IUndoableOperation operation) {
        if (DEBUG_OPERATION_HISTORY_NOTIFICATION) {
            Tracing.printTrace("OPERATIONHISTORY", "REDONE " ~ (cast(Object)operation).toString); //$NON-NLS-1$ //$NON-NLS-2$
        }

        notifyListeners(new OperationHistoryEvent(OperationHistoryEvent.REDONE,
                this, operation));
    }

    /*
     * Notify listeners that an operation has been removed from the history.
     */
    private void notifyRemoved(IUndoableOperation operation) {
        if (DEBUG_OPERATION_HISTORY_NOTIFICATION) {
            Tracing.printTrace("OPERATIONHISTORY", "OPERATION_REMOVED " //$NON-NLS-1$ //$NON-NLS-2$
                    ~ (cast(Object)operation).toString);
        }

        notifyListeners(new OperationHistoryEvent(
                OperationHistoryEvent.OPERATION_REMOVED, this, operation));
    }

    /*
     * Notify listeners that an operation has been undone.
     */
    private void notifyUndone(IUndoableOperation operation) {
        if (DEBUG_OPERATION_HISTORY_NOTIFICATION) {
            Tracing.printTrace("OPERATIONHISTORY", "UNDONE " ~ (cast(Object)operation).toString); //$NON-NLS-1$ //$NON-NLS-2$
        }

        notifyListeners(new OperationHistoryEvent(OperationHistoryEvent.UNDONE,
                this, operation));
    }

    /*
     * Notify listeners that an operation has been undone.
     */
    private void notifyChanged(IUndoableOperation operation) {
        if (DEBUG_OPERATION_HISTORY_NOTIFICATION) {
            Tracing.printTrace("OPERATIONHISTORY", "OPERATION_CHANGED " //$NON-NLS-1$//$NON-NLS-2$
                    ~ (cast(Object)operation).toString);
        }

        notifyListeners(new OperationHistoryEvent(
                OperationHistoryEvent.OPERATION_CHANGED, this, operation));
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#redo(org.eclipse.core.commands.operations.IUndoContext,
     *      org.eclipse.core.runtime.IProgressMonitor,
     *      org.eclipse.core.runtime.IAdaptable)
     */
    public IStatus redo(IUndoContext context, IProgressMonitor monitor,
            IAdaptable info) {
        Assert.isNotNull(cast(Object)context);
        IUndoableOperation operation = getRedoOperation(context);

        // info if there is no operation
        if (operation is null) {
            return IOperationHistory.NOTHING_TO_REDO_STATUS;
        }

        // error if operation is invalid
        if (!operation.canRedo()) {
            if (DEBUG_OPERATION_HISTORY_UNEXPECTED) {
                Tracing.printTrace("OPERATIONHISTORY", //$NON-NLS-1$
                        "Redo operation not valid - " ~ (cast(Object)operation).toString); //$NON-NLS-1$
            }

            return IOperationHistory.OPERATION_INVALID_STATUS;
        }

        return doRedo(monitor, info, operation);
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#redoOperation(org.eclipse.core.commands.operations.IUndoableOperation,
     *      org.eclipse.core.runtime.IProgressMonitor,
     *      org.eclipse.core.runtime.IAdaptable)
     */

    public IStatus redoOperation(IUndoableOperation operation,
            IProgressMonitor monitor, IAdaptable info) {
        Assert.isNotNull(cast(Object)operation);
        IStatus status;
        if (operation.canRedo()) {
            status = doRedo(monitor, info, operation);
        } else {
            if (DEBUG_OPERATION_HISTORY_UNEXPECTED) {
                Tracing.printTrace("OPERATIONHISTORY", //$NON-NLS-1$
                        "Redo operation not valid - " ~ (cast(Object)operation).toString); //$NON-NLS-1$
            }
            status = IOperationHistory.OPERATION_INVALID_STATUS;
        }
        return status;
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#removeOperationApprover(org.eclipse.core.commands.operations.IOperationApprover)
     */
    public void removeOperationApprover(IOperationApprover approver) {
        approvers.remove(cast(Object)approver);
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#removeOperationHistoryListener(org.eclipse.core.commands.operations.IOperationHistoryListener)
     */
    public void removeOperationHistoryListener(
            IOperationHistoryListener listener) {
        listeners.remove(cast(Object)listener);
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#replaceOperation(org.eclipse.core.commands.operations.IUndoableOperation,
     *      org.eclipse.core.commands.operations.IUndoableOperation [])
     */
    public void replaceOperation(IUndoableOperation operation,
            IUndoableOperation[] replacements) {
        // check the undo history first.
        bool inUndo = false;
        synchronized (undoRedoHistoryLock) {
            int index = undoList.indexOf(cast(Object)operation);
            if (index > -1) {
                inUndo = true;
                undoList.remove(cast(Object)operation);
                // notify listeners after the lock on undoList is released
                ArrayList allContexts = new ArrayList(replacements.length);
                for (int i = 0; i < replacements.length; i++) {
                    IUndoContext[] opContexts = replacements[i].getContexts();
                    for (int j = 0; j < opContexts.length; j++) {
                        allContexts.add(cast(Object)opContexts[j]);
                    }
                    undoList.add(index, cast(Object)replacements[i]);
                    // notify listeners after the lock on the history is
                    // released
                }
                // recheck all the limits. We do this at the end so the index
                // doesn't change during replacement
                for (int i = 0; i < allContexts.size(); i++) {
                    IUndoContext context = cast(IUndoContext) allContexts.get(i);
                    forceUndoLimit(context, getLimit(context));
                }
            }
        }
        if (inUndo) {
            // notify listeners of operations added and removed
            internalRemove(operation);
            for (int i = 0; i < replacements.length; i++) {
                notifyAdd(replacements[i]);
            }
            return;
        }

        // operation was not in the undo history. Check the redo history.

        synchronized (undoRedoHistoryLock) {
            int index = redoList.indexOf(cast(Object)operation);
            if (index is -1) {
                return;
            }
            ArrayList allContexts = new ArrayList(replacements.length);
            redoList.remove(cast(Object)operation);
            // notify listeners after we release the lock on redoList
            for (int i = 0; i < replacements.length; i++) {
                IUndoContext[] opContexts = replacements[i].getContexts();
                for (int j = 0; j < opContexts.length; j++) {
                    allContexts.add(cast(Object)opContexts[j]);
                }
                redoList.add(index, cast(Object)replacements[i]);
                // notify listeners after we release the lock on redoList
            }
            // recheck all the limits. We do this at the end so the index
            // doesn't change during replacement
            for (int i = 0; i < allContexts.size(); i++) {
                IUndoContext context = cast(IUndoContext) allContexts.get(i);
                forceRedoLimit(context, getLimit(context));
            }
        }
        // send listener notifications after we release the lock on the history
        internalRemove(operation);
        for (int i = 0; i < replacements.length; i++) {
            notifyAdd(replacements[i]);
        }
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#setLimit(org.eclipse.core.commands.operations.IUndoContext,
     *      int)
     */
    public void setLimit(IUndoContext context, int limit) {
        Assert.isTrue(limit >= 0);
        /*
         * The limit checking methods interpret a null context as a global limit
         * to be enforced. We do not wish to support a global limit in this
         * implementation, so we throw an exception for a null context. The rest
         * of the implementation can handle a null context, so subclasses can
         * override this if a global limit is desired.
         */
        Assert.isNotNull(cast(Object)context);
        limits.put(cast(Object)context, new Integer(limit));
        forceUndoLimit(context, limit);
        forceRedoLimit(context, limit);

    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#undo(org.eclipse.core.commands.operations.IUndoContext,
     *      org.eclipse.core.runtime.IProgressMonitor,
     *      org.eclipse.core.runtime.IAdaptable)
     */
    public IStatus undo(IUndoContext context, IProgressMonitor monitor,
            IAdaptable info) {
        Assert.isNotNull(cast(Object)context);
        IUndoableOperation operation = getUndoOperation(context);

        // info if there is no operation
        if (operation is null) {
            return IOperationHistory.NOTHING_TO_UNDO_STATUS;
        }

        // error if operation is invalid
        if (!operation.canUndo()) {
            if (DEBUG_OPERATION_HISTORY_UNEXPECTED) {
                Tracing.printTrace("OPERATIONHISTORY", //$NON-NLS-1$
                        "Undo operation not valid - " ~ (cast(Object)operation).toString); //$NON-NLS-1$
            }
            return IOperationHistory.OPERATION_INVALID_STATUS;
        }

        return doUndo(monitor, info, operation);
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#undoOperation(org.eclipse.core.commands.operations.IUndoableOperation,
     *      org.eclipse.core.runtime.IProgressMonitor,
     *      org.eclipse.core.runtime.IAdaptable)
     */
    public IStatus undoOperation(IUndoableOperation operation,
            IProgressMonitor monitor, IAdaptable info) {
        Assert.isNotNull(cast(Object)operation);
        IStatus status;
        if (operation.canUndo()) {
            status = doUndo(monitor, info, operation);
        } else {
            if (DEBUG_OPERATION_HISTORY_UNEXPECTED) {
                Tracing.printTrace("OPERATIONHISTORY", //$NON-NLS-1$
                        "Undo operation not valid - " ~ (cast(Object)operation).toString); //$NON-NLS-1$
            }
            status = IOperationHistory.OPERATION_INVALID_STATUS;
        }
        return status;
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#openOperation(org.eclipse.core.commands.operations.ICompositeOperation)
     */
    public void openOperation(ICompositeOperation operation, int mode) {
        synchronized (openCompositeLock) {
            if (openComposite !is null && openComposite !is operation) {
                // unexpected nesting of operations.
                if (DEBUG_OPERATION_HISTORY_UNEXPECTED) {
                    Tracing.printTrace("OPERATIONHISTORY", //$NON-NLS-1$
                            "Open operation called while another operation is open.  old: " //$NON-NLS-1$
                                    ~ (cast(Object)openComposite).toString ~ "; new:  " ~ (cast(Object)operation).toString); //$NON-NLS-1$
                }

                throw new IllegalStateException(
                        "Cannot open an operation while one is already open"); //$NON-NLS-1$
            }
            openComposite = operation;
        }
        if (DEBUG_OPERATION_HISTORY_OPENOPERATION) {
            Tracing.printTrace("OPERATIONHISTORY", "Opening operation " //$NON-NLS-1$ //$NON-NLS-2$
                    ~ (cast(Object)openComposite).toString);
        }

        if (mode is EXECUTE) {
            notifyAboutToExecute(openComposite);
        }
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#closeOperation(bool,
     *      bool)
     */
    public void closeOperation(bool operationOK, bool addToHistory,
            int mode) {
        ICompositeOperation endedComposite = null;

        synchronized (openCompositeLock) {
            if (DEBUG_OPERATION_HISTORY_UNEXPECTED) {
                if (openComposite is null) {
                    Tracing.printTrace("OPERATIONHISTORY", //$NON-NLS-1$
                            "Attempted to close operation when none was open"); //$NON-NLS-1$
                    return;
                }
            }
            // notifications will occur outside the synchonized block
            if (openComposite !is null) {
                if (DEBUG_OPERATION_HISTORY_OPENOPERATION) {
                    Tracing.printTrace("OPERATIONHISTORY", "Closing operation " //$NON-NLS-1$ //$NON-NLS-2$
                            ~ (cast(Object)openComposite).toString);
                }
                endedComposite = openComposite;
                openComposite = null;
            }
        }
        // any mode other than EXECUTE was triggered by a request to undo or
        // redo something already in the history, so undo and redo
        // notification will occur at the end of that sequence.
        if (endedComposite !is null) {
            if (operationOK) {
                if (mode is EXECUTE) {
                    notifyDone(endedComposite);
                }
                if (addToHistory) {
                    add(endedComposite);
                }
            } else {
                if (mode is EXECUTE) {
                    notifyNotOK(endedComposite);
                }
            }
        }
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.core.commands.operations.IOperationHistory#operationChanged(org.eclipse.core.commands.operations.IUndoableOperation)
     */
    public void operationChanged(IUndoableOperation operation) {
        if (undoList.contains(cast(Object)operation) || redoList.contains(cast(Object)operation)) {
            notifyChanged(operation);
        }
    }
}
