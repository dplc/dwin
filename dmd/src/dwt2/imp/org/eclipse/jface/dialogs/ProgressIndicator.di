/*******************************************************************************
 * Copyright (c) 2000, 2008 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *     Mark Siegel <mark.siegel@businessobjects.com> - Fix for Bug 184533
 *              [Progress] ProgressIndicator uses hardcoded style for ProgressBar
 * Port to the D programming language:
 *     Frank Benoit <benoit@tionex.de>
 *******************************************************************************/
module org.eclipse.jface.dialogs.ProgressIndicator;

import org.eclipse.jface.dialogs.IDialogConstants;

import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.StackLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.ProgressBar;

import java.lang.all;
import java.util.Set;

/**
 * A control for showing progress feedback for a long running operation. This
 * control supports both determinate and indeterminate SWT progress bars. For
 * indeterminate progress, we don't have to know the total amount of work in
 * advance and no <code>worked</code> method needs to be called.
 */
public class ProgressIndicator : Composite {
    private const static int PROGRESS_MAX = 1000; // value to use for max in

    // progress bar
    private bool animated = true;

    private StackLayout layout_;

    private ProgressBar determinateProgressBar;

    private ProgressBar indeterminateProgressBar;

    private double totalWork;

    private double sumWorked;

    /**
     * Create a ProgressIndicator as a child under the given parent.
     *
     * @param parent
     *            The widgets parent
     */
    public this(Composite parent) {
        this(parent, SWT.NONE);
    }

    /**
     * Create a ProgressIndicator as a child under the given parent.
     *
     * @param parent
     *            The widgets parent
     * @param style the SWT style constants for progress monitors created
     *  by the receiver.
     * @since 3.4
     */
    public this(Composite parent, int style) {
        super(parent, SWT.NULL);

         // Enforce horizontal only if vertical isn't set
        if ((style & SWT.VERTICAL) is 0)
            style |= SWT.HORIZONTAL;

        determinateProgressBar = new ProgressBar(this, style);
        indeterminateProgressBar = new ProgressBar(this, style
                | SWT.INDETERMINATE);
        layout_ = new StackLayout();
        setLayout(layout_);
    }

    /**
     * Initialize the progress bar to be animated.
     */
    public void beginAnimatedTask() {
        done();
        layout_.topControl = indeterminateProgressBar;
        layout();
        animated = true;
    }

    /**
     * Initialize the progress bar.
     *
     * @param max
     *            The maximum value.
     */
    public void beginTask(int max) {
        done();
        this.totalWork = max;
        this.sumWorked = 0;
        determinateProgressBar.setMinimum(0);
        determinateProgressBar.setMaximum(PROGRESS_MAX);
        determinateProgressBar.setSelection(0);
        layout_.topControl = determinateProgressBar;
        layout();
        animated = false;
    }

    /**
     * Progress is done.
     */
    public void done() {
        if (!animated) {
            determinateProgressBar.setMinimum(0);
            determinateProgressBar.setMaximum(0);
            determinateProgressBar.setSelection(0);
        }
        layout_.topControl = null;
        layout();
    }

    /**
     * Moves the progress indicator to the end.
     */
    public void sendRemainingWork() {
        worked(totalWork - sumWorked);
    }

    /**
     * Moves the progress indicator by the given amount of work units
     * @param work the amount of work to increment by.
     */
    public void worked(double work) {
        if (work is 0 || animated) {
            return;
        }
        sumWorked += work;
        if (sumWorked > totalWork) {
            sumWorked = totalWork;
        }
        if (sumWorked < 0) {
            sumWorked = 0;
        }
        int value = cast(int) (sumWorked / totalWork * PROGRESS_MAX);
        if (determinateProgressBar.getSelection() < value) {
            determinateProgressBar.setSelection(value);
        }
    }

    /**
     * Show the receiver as showing an error.
     * @since 3.4
     */
    public void showError() {
        determinateProgressBar.setState(SWT.ERROR);
        indeterminateProgressBar.setState(SWT.ERROR);
    }

    /**
     * Show the receiver as being paused.
     * @since 3.4
     */
    public void showPaused() {
        determinateProgressBar.setState(SWT.PAUSED);
        indeterminateProgressBar.setState(SWT.PAUSED);
    }

    /**
     * Reset the progress bar to it's normal style.
     * @since 3.4
     */
    public void showNormal() {
        determinateProgressBar.setState(SWT.NORMAL);
        indeterminateProgressBar.setState(SWT.NORMAL);

    }
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
