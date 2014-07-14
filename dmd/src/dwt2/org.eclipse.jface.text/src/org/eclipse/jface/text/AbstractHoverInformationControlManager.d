/*******************************************************************************
 * Copyright (c) 2000, 2008 IBM Corporation and others.
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
module org.eclipse.jface.text.AbstractHoverInformationControlManager;

import org.eclipse.jface.text.IDocumentPartitioningListener; // packageimport
import org.eclipse.jface.text.DefaultTextHover; // packageimport
import org.eclipse.jface.text.AbstractInformationControl; // packageimport
import org.eclipse.jface.text.TextUtilities; // packageimport
import org.eclipse.jface.text.IInformationControlCreatorExtension; // packageimport
import org.eclipse.jface.text.AbstractInformationControlManager; // packageimport
import org.eclipse.jface.text.ITextViewerExtension2; // packageimport
import org.eclipse.jface.text.IDocumentPartitioner; // packageimport
import org.eclipse.jface.text.DefaultIndentLineAutoEditStrategy; // packageimport
import org.eclipse.jface.text.ITextSelection; // packageimport
import org.eclipse.jface.text.Document; // packageimport
import org.eclipse.jface.text.FindReplaceDocumentAdapterContentProposalProvider; // packageimport
import org.eclipse.jface.text.ITextListener; // packageimport
import org.eclipse.jface.text.BadPartitioningException; // packageimport
import org.eclipse.jface.text.ITextViewerExtension5; // packageimport
import org.eclipse.jface.text.IDocumentPartitionerExtension3; // packageimport
import org.eclipse.jface.text.IUndoManager; // packageimport
import org.eclipse.jface.text.ITextHoverExtension2; // packageimport
import org.eclipse.jface.text.IRepairableDocument; // packageimport
import org.eclipse.jface.text.IRewriteTarget; // packageimport
import org.eclipse.jface.text.DefaultPositionUpdater; // packageimport
import org.eclipse.jface.text.RewriteSessionEditProcessor; // packageimport
import org.eclipse.jface.text.TextViewerHoverManager; // packageimport
import org.eclipse.jface.text.DocumentRewriteSession; // packageimport
import org.eclipse.jface.text.TextViewer; // packageimport
import org.eclipse.jface.text.ITextViewerExtension8; // packageimport
import org.eclipse.jface.text.RegExMessages; // packageimport
import org.eclipse.jface.text.IDelayedInputChangeProvider; // packageimport
import org.eclipse.jface.text.ITextOperationTargetExtension; // packageimport
import org.eclipse.jface.text.IWidgetTokenOwner; // packageimport
import org.eclipse.jface.text.IViewportListener; // packageimport
import org.eclipse.jface.text.GapTextStore; // packageimport
import org.eclipse.jface.text.MarkSelection; // packageimport
import org.eclipse.jface.text.IDocumentPartitioningListenerExtension; // packageimport
import org.eclipse.jface.text.IDocumentAdapterExtension; // packageimport
import org.eclipse.jface.text.IInformationControlExtension; // packageimport
import org.eclipse.jface.text.IDocumentPartitioningListenerExtension2; // packageimport
import org.eclipse.jface.text.DefaultDocumentAdapter; // packageimport
import org.eclipse.jface.text.ITextViewerExtension3; // packageimport
import org.eclipse.jface.text.IInformationControlCreator; // packageimport
import org.eclipse.jface.text.TypedRegion; // packageimport
import org.eclipse.jface.text.ISynchronizable; // packageimport
import org.eclipse.jface.text.IMarkRegionTarget; // packageimport
import org.eclipse.jface.text.TextViewerUndoManager; // packageimport
import org.eclipse.jface.text.IRegion; // packageimport
import org.eclipse.jface.text.IInformationControlExtension2; // packageimport
import org.eclipse.jface.text.IDocumentExtension4; // packageimport
import org.eclipse.jface.text.IDocumentExtension2; // packageimport
import org.eclipse.jface.text.IDocumentPartitionerExtension2; // packageimport
import org.eclipse.jface.text.DefaultInformationControl; // packageimport
import org.eclipse.jface.text.IWidgetTokenOwnerExtension; // packageimport
import org.eclipse.jface.text.DocumentClone; // packageimport
import org.eclipse.jface.text.DefaultUndoManager; // packageimport
import org.eclipse.jface.text.IFindReplaceTarget; // packageimport
import org.eclipse.jface.text.IAutoEditStrategy; // packageimport
import org.eclipse.jface.text.ILineTrackerExtension; // packageimport
import org.eclipse.jface.text.IUndoManagerExtension; // packageimport
import org.eclipse.jface.text.TextSelection; // packageimport
import org.eclipse.jface.text.DefaultAutoIndentStrategy; // packageimport
import org.eclipse.jface.text.IAutoIndentStrategy; // packageimport
import org.eclipse.jface.text.IPainter; // packageimport
import org.eclipse.jface.text.IInformationControl; // packageimport
import org.eclipse.jface.text.IInformationControlExtension3; // packageimport
import org.eclipse.jface.text.ITextViewerExtension6; // packageimport
import org.eclipse.jface.text.IInformationControlExtension4; // packageimport
import org.eclipse.jface.text.DefaultLineTracker; // packageimport
import org.eclipse.jface.text.IDocumentInformationMappingExtension; // packageimport
import org.eclipse.jface.text.IRepairableDocumentExtension; // packageimport
import org.eclipse.jface.text.ITextHover; // packageimport
import org.eclipse.jface.text.FindReplaceDocumentAdapter; // packageimport
import org.eclipse.jface.text.ILineTracker; // packageimport
import org.eclipse.jface.text.Line; // packageimport
import org.eclipse.jface.text.ITextViewerExtension; // packageimport
import org.eclipse.jface.text.IDocumentAdapter; // packageimport
import org.eclipse.jface.text.TextEvent; // packageimport
import org.eclipse.jface.text.BadLocationException; // packageimport
import org.eclipse.jface.text.AbstractDocument; // packageimport
import org.eclipse.jface.text.AbstractLineTracker; // packageimport
import org.eclipse.jface.text.TreeLineTracker; // packageimport
import org.eclipse.jface.text.ITextPresentationListener; // packageimport
import org.eclipse.jface.text.Region; // packageimport
import org.eclipse.jface.text.ITextViewer; // packageimport
import org.eclipse.jface.text.IDocumentInformationMapping; // packageimport
import org.eclipse.jface.text.MarginPainter; // packageimport
import org.eclipse.jface.text.IPaintPositionManager; // packageimport
import org.eclipse.jface.text.TextPresentation; // packageimport
import org.eclipse.jface.text.IFindReplaceTargetExtension; // packageimport
import org.eclipse.jface.text.ISlaveDocumentManagerExtension; // packageimport
import org.eclipse.jface.text.ISelectionValidator; // packageimport
import org.eclipse.jface.text.IDocumentExtension; // packageimport
import org.eclipse.jface.text.PropagatingFontFieldEditor; // packageimport
import org.eclipse.jface.text.ConfigurableLineTracker; // packageimport
import org.eclipse.jface.text.SlaveDocumentEvent; // packageimport
import org.eclipse.jface.text.IDocumentListener; // packageimport
import org.eclipse.jface.text.PaintManager; // packageimport
import org.eclipse.jface.text.IFindReplaceTargetExtension3; // packageimport
import org.eclipse.jface.text.ITextDoubleClickStrategy; // packageimport
import org.eclipse.jface.text.IDocumentExtension3; // packageimport
import org.eclipse.jface.text.Position; // packageimport
import org.eclipse.jface.text.TextMessages; // packageimport
import org.eclipse.jface.text.CopyOnWriteTextStore; // packageimport
import org.eclipse.jface.text.WhitespaceCharacterPainter; // packageimport
import org.eclipse.jface.text.IPositionUpdater; // packageimport
import org.eclipse.jface.text.DefaultTextDoubleClickStrategy; // packageimport
import org.eclipse.jface.text.ListLineTracker; // packageimport
import org.eclipse.jface.text.ITextInputListener; // packageimport
import org.eclipse.jface.text.BadPositionCategoryException; // packageimport
import org.eclipse.jface.text.IWidgetTokenKeeperExtension; // packageimport
import org.eclipse.jface.text.IInputChangedListener; // packageimport
import org.eclipse.jface.text.ITextOperationTarget; // packageimport
import org.eclipse.jface.text.IDocumentInformationMappingExtension2; // packageimport
import org.eclipse.jface.text.ITextViewerExtension7; // packageimport
import org.eclipse.jface.text.IInformationControlExtension5; // packageimport
import org.eclipse.jface.text.IDocumentRewriteSessionListener; // packageimport
import org.eclipse.jface.text.JFaceTextUtil; // packageimport
import org.eclipse.jface.text.AbstractReusableInformationControlCreator; // packageimport
import org.eclipse.jface.text.TabsToSpacesConverter; // packageimport
import org.eclipse.jface.text.CursorLinePainter; // packageimport
import org.eclipse.jface.text.ITextHoverExtension; // packageimport
import org.eclipse.jface.text.IEventConsumer; // packageimport
import org.eclipse.jface.text.IDocument; // packageimport
import org.eclipse.jface.text.IWidgetTokenKeeper; // packageimport
import org.eclipse.jface.text.DocumentCommand; // packageimport
import org.eclipse.jface.text.TypedPosition; // packageimport
import org.eclipse.jface.text.IEditingSupportRegistry; // packageimport
import org.eclipse.jface.text.IDocumentPartitionerExtension; // packageimport
import org.eclipse.jface.text.IEditingSupport; // packageimport
import org.eclipse.jface.text.IMarkSelection; // packageimport
import org.eclipse.jface.text.ISlaveDocumentManager; // packageimport
import org.eclipse.jface.text.DocumentEvent; // packageimport
import org.eclipse.jface.text.DocumentPartitioningChangedEvent; // packageimport
import org.eclipse.jface.text.ITextStore; // packageimport
import org.eclipse.jface.text.JFaceTextMessages; // packageimport
import org.eclipse.jface.text.DocumentRewriteSessionEvent; // packageimport
import org.eclipse.jface.text.SequentialRewriteTextStore; // packageimport
import org.eclipse.jface.text.DocumentRewriteSessionType; // packageimport
import org.eclipse.jface.text.TextAttribute; // packageimport
import org.eclipse.jface.text.ITextViewerExtension4; // packageimport
import org.eclipse.jface.text.ITypedRegion; // packageimport

import java.lang.all;
import java.util.Set;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.ControlEvent;
import org.eclipse.swt.events.ControlListener;
import org.eclipse.swt.events.KeyEvent;
import org.eclipse.swt.events.KeyListener;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.events.MouseListener;
import org.eclipse.swt.events.MouseMoveListener;
import org.eclipse.swt.events.MouseTrackListener;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
import org.eclipse.swt.events.ShellAdapter;
import org.eclipse.swt.events.ShellEvent;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.ScrollBar;
import org.eclipse.swt.widgets.Scrollable;
import org.eclipse.core.runtime.Assert;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Status;
import org.eclipse.core.runtime.jobs.Job;
import org.eclipse.jface.internal.text.DelayedInputChangeListener;
import org.eclipse.jface.internal.text.InformationControlReplacer;
import org.eclipse.jface.internal.text.InternalAccessor;
import org.eclipse.jface.text.ITextViewerExtension8;
import org.eclipse.jface.text.source.AnnotationBarHoverManager;
import org.eclipse.jface.util.Geometry;


/**
 * An information control manager that shows information in response to mouse
 * hover events. The mouse hover events are caught by registering a
 * {@link org.eclipse.swt.events.MouseTrackListener} on the manager's subject
 * control. The manager has by default an information control closer that closes
 * the information control as soon as the mouse pointer leaves the subject area,
 * the user presses a key, or the subject control is resized, moved, or
 * deactivated.
 * <p>
 * When being activated by a mouse hover event, the manager disables itself,
 * until the mouse leaves the subject area. Thus, the manager is usually still
 * disabled, when the information control has already been closed by the closer.
 *
 * @see org.eclipse.swt.events.MouseTrackListener
 * @since 2.0
 */
abstract public class AbstractHoverInformationControlManager : AbstractInformationControlManager {

    /**
     * The  information control closer for the hover information. Closes the information control as
     * soon as the mouse pointer leaves the subject area (unless "move into hover" is enabled),
     * a mouse button is pressed, the user presses a key, or the subject control is resized, moved, or loses focus.
     */
    class Closer : IInformationControlCloser, MouseListener, MouseMoveListener, ControlListener, KeyListener, SelectionListener, Listener {

        /** The closer's subject control */
        private Control fSubjectControl;
        /** The subject area */
        private Rectangle fSubjectArea;
        /** Indicates whether this closer is active */
        private bool fIsActive= false;
        /**
         * The cached display.
         * @since 3.1
         */
        private Display fDisplay;


        /**
         * Creates a new information control closer.
         */
        public this() {
        }

        /*
         * @see IInformationControlCloser#setSubjectControl(Control)
         */
        public void setSubjectControl(Control control) {
            fSubjectControl= control;
        }

        /*
         * @see IInformationControlCloser#setHoverControl(IHoverControl)
         */
        public void setInformationControl(IInformationControl control) {
            // NOTE: we use getCurrentInformationControl() from the outer class
        }

        /*
         * @see IInformationControlCloser#start(Rectangle)
         */
        public void start(Rectangle subjectArea) {

            if (fIsActive)
                return;
            fIsActive= true;
            fWaitForMouseUp= false;

            fSubjectArea= subjectArea;

            if (fSubjectControl !is null && !fSubjectControl.isDisposed()) {
                fSubjectControl.addMouseListener(this);
                fSubjectControl.addMouseMoveListener(this);
                fSubjectControl.addControlListener(this);
                fSubjectControl.addKeyListener(this);
                if ( cast(Scrollable)fSubjectControl ) {
                    Scrollable scrollable= cast(Scrollable) fSubjectControl;
                    ScrollBar vBar= scrollable.getVerticalBar();
                    if (vBar !is null)
                        vBar.addSelectionListener(this);
                    ScrollBar hBar= scrollable.getHorizontalBar();
                    if (hBar !is null)
                        hBar.addSelectionListener(this);
                }

                fDisplay= fSubjectControl.getDisplay();
                if (!fDisplay.isDisposed()) {
                    fDisplay.addFilter(SWT.Activate, this);
                    fDisplay.addFilter(SWT.MouseWheel, this);

                    fDisplay.addFilter(SWT.FocusOut, this);

                    fDisplay.addFilter(SWT.MouseDown, this);
                    fDisplay.addFilter(SWT.MouseUp, this);

                    fDisplay.addFilter(SWT.MouseMove, this);
                    fDisplay.addFilter(SWT.MouseEnter, this);
                    fDisplay.addFilter(SWT.MouseExit, this);
                }
            }
        }

        /*
         * @see IInformationControlCloser#stop()
         */
        public void stop() {
            if (!fIsActive)
                return;

            fIsActive= false;

            if (DEBUG)
                System.out_.println("AbstractHoverInformationControlManager.Closer stopped"); //$NON-NLS-1$

            if (fSubjectControl !is null && !fSubjectControl.isDisposed()) {
                fSubjectControl.removeMouseListener(this);
                fSubjectControl.removeMouseMoveListener(this);
                fSubjectControl.removeControlListener(this);
                fSubjectControl.removeKeyListener(this);
                if ( cast(Scrollable)fSubjectControl ) {
                    Scrollable scrollable= cast(Scrollable) fSubjectControl;
                    ScrollBar vBar= scrollable.getVerticalBar();
                    if (vBar !is null)
                        vBar.removeSelectionListener(this);
                    ScrollBar hBar= scrollable.getHorizontalBar();
                    if (hBar !is null)
                        hBar.removeSelectionListener(this);
                }
            }

            if (fDisplay !is null && !fDisplay.isDisposed()) {
                fDisplay.removeFilter(SWT.Activate, this);
                fDisplay.removeFilter(SWT.MouseWheel, this);

                fDisplay.removeFilter(SWT.FocusOut, this);

                fDisplay.removeFilter(SWT.MouseDown, this);
                fDisplay.removeFilter(SWT.MouseUp, this);

                fDisplay.removeFilter(SWT.MouseMove, this);
                fDisplay.removeFilter(SWT.MouseEnter, this);
                fDisplay.removeFilter(SWT.MouseExit, this);
            }
            fDisplay= null;
        }

        /*
         * @see org.eclipse.swt.events.MouseMoveListener#mouseMove(org.eclipse.swt.events.MouseEvent)
         */
        public void mouseMove(MouseEvent event) {
            if (!hasInformationControlReplacer() || !canMoveIntoInformationControl(getCurrentInformationControl())) {
                if (!fSubjectArea.contains(event.x, event.y)) {
                    hideInformationControl();
                }

            } else if (getCurrentInformationControl() !is null && !getCurrentInformationControl().isFocusControl()) {
                if (!inKeepUpZone(event.x, event.y, fSubjectControl, fSubjectArea, true)) {
                    hideInformationControl();
                }
            }
        }

        /*
         * @see org.eclipse.swt.events.MouseListener#mouseUp(org.eclipse.swt.events.MouseEvent)
         */
        public void mouseUp(MouseEvent event) {
        }

        /*
         * @see MouseListener#mouseDown(MouseEvent)
         */
        public void mouseDown(MouseEvent event) {
            hideInformationControl();
        }

        /*
         * @see MouseListener#mouseDoubleClick(MouseEvent)
         */
        public void mouseDoubleClick(MouseEvent event) {
            hideInformationControl();
        }

        /*
         * @see ControlListener#controlResized(ControlEvent)
         */
        public void controlResized(ControlEvent event) {
            hideInformationControl();
        }

        /*
         * @see ControlListener#controlMoved(ControlEvent)
         */
        public void controlMoved(ControlEvent event) {
            hideInformationControl();
        }

        /*
         * @see KeyListener#keyReleased(KeyEvent)
         */
        public void keyReleased(KeyEvent event) {
        }

        /*
         * @see KeyListener#keyPressed(KeyEvent)
         */
        public void keyPressed(KeyEvent event) {
            hideInformationControl();
        }

        /*
         * @see org.eclipse.swt.events.SelectionListener#widgetSelected(org.eclipse.swt.events.SelectionEvent)
         */
        public void widgetSelected(SelectionEvent e) {
            hideInformationControl();
        }

        /*
         * @see org.eclipse.swt.events.SelectionListener#widgetDefaultSelected(org.eclipse.swt.events.SelectionEvent)
         */
        public void widgetDefaultSelected(SelectionEvent e) {
        }

        /*
         * @see org.eclipse.swt.widgets.Listener#handleEvent(org.eclipse.swt.widgets.Event)
         * @since 3.1
         */
        public void handleEvent(Event event) {
            switch (event.type) {
                case SWT.Activate:
                case SWT.MouseWheel:
                    if (!hasInformationControlReplacer())
                        hideInformationControl();
                    else if (!isReplaceInProgress()) {
                        IInformationControl infoControl= getCurrentInformationControl();
                        // During isReplaceInProgress(), events can come from the replacing information control
                        if ( cast(Control)event.widget  && cast(IInformationControlExtension5)infoControl ) {
                            Control control= cast(Control) event.widget;
                            IInformationControlExtension5 iControl5= cast(IInformationControlExtension5) infoControl;
                            if (!(iControl5.containsControl(control)))
                                hideInformationControl();
                            else if (event.type is SWT.MouseWheel && cancelReplacingDelay())
                                replaceInformationControl(false);
                        } else if (infoControl !is null && infoControl.isFocusControl() && cancelReplacingDelay()) {
                            replaceInformationControl(true);
                        }
                    }
                    break;

                case SWT.MouseUp:
                case SWT.MouseDown:
                    if (!hasInformationControlReplacer())
                        hideInformationControl();
                    else if (!isReplaceInProgress()) {
                        IInformationControl infoControl= getCurrentInformationControl();
                        if ( cast(Control)event.widget  && cast(IInformationControlExtension5)infoControl ) {
                            Control control= cast(Control) event.widget;
                            final IInformationControlExtension5 iControl5= cast(IInformationControlExtension5) infoControl;
                            if (!(iControl5.containsControl(control))) {
                                hideInformationControl();
                            } else if (cancelReplacingDelay()) {
                                if (event.type is SWT.MouseUp) {
                                    stop(); // avoid that someone else replaces the info control before the async is exec'd
                                    if ( cast(IDelayedInputChangeProvider)infoControl ) {
                                        final IDelayedInputChangeProvider delayedICP= cast(IDelayedInputChangeProvider) infoControl;
                                        final IInputChangedListener inputChangeListener= new DelayedInputChangeListener(delayedICP, getInformationControlReplacer());
                                        delayedICP.setDelayedInputChangeListener(inputChangeListener);
                                        // cancel automatic input updating after a small timeout:
                                        control.getShell().getDisplay().timerExec(1000, new class()  Runnable {
                                            public void run() {
                                                delayedICP.setDelayedInputChangeListener(null);
                                            }
                                        });
                                    }

                                    // XXX: workaround for https://bugs.eclipse.org/bugs/show_bug.cgi?id=212392 :
                                    control.getShell().getDisplay().asyncExec(new class()  Runnable {
                                        public void run() {
                                            replaceInformationControl(true);
                                        }
                                    });
                                } else {
                                    fWaitForMouseUp= true;
                                }
                            }
                        } else {
                            handleMouseMove(event);
                        }
                    }
                    break;

                case SWT.FocusOut:
                    IInformationControl iControl= getCurrentInformationControl();
                    if (iControl !is null && ! iControl.isFocusControl())
                        hideInformationControl();
                    break;

                case SWT.MouseMove:
                case SWT.MouseEnter:
                case SWT.MouseExit:
                    handleMouseMove(event);
                    break;
                default:
            }
        }

        /**
         * Handle mouse movement events.
         *
         * @param event the event
         * @since 3.4
         */
        private void handleMouseMove(Event event) {
//          if (DEBUG)
//              System.out_.println("AbstractHoverInformationControl.Closer.handleMouseMove():" + event); //$NON-NLS-1$

            if (!( cast(Control)event.widget ))
                return;
            Control eventControl= cast(Control) event.widget;

            //transform coordinates to subject control:
            Point mouseLoc= event.display.map(eventControl, fSubjectControl, event.x, event.y);

            if (fSubjectArea.contains(mouseLoc))
                return;

            IInformationControl iControl= getCurrentInformationControl();
            if (!hasInformationControlReplacer() || !canMoveIntoInformationControl(iControl)) {
                if ( cast(AnnotationBarHoverManager)this.outer ) {
                    if (getInternalAccessor().getAllowMouseExit())
                        return;
                }
                hideInformationControl();
                return;
            }

            IInformationControlExtension3 iControl3= cast(IInformationControlExtension3) iControl;
            Rectangle controlBounds= iControl3.getBounds();
            if (controlBounds !is null) {
                Rectangle tooltipBounds= event.display.map(null, eventControl, controlBounds);
                if (tooltipBounds.contains(event.x, event.y)) {
                    if (!isReplaceInProgress() && event.type !is SWT.MouseExit)
                        startReplaceInformationControl(event.display);
                    return;
                }
                cancelReplacingDelay();
            }

            if (!fSubjectControl.getBounds().contains(mouseLoc)) {
                /*
                 *  Use inKeepUpZone() to make sure it also works when the hover is
                 *  completely outside of the subject control.
                 */
                if (!inKeepUpZone(mouseLoc.x, mouseLoc.y, fSubjectControl, fSubjectArea, true)) {
                    hideInformationControl();
                    return;
                }
            }
        }
    }

    /**
     * To be installed on the manager's subject control.  Serves two different purposes:
     * <ul>
     * <li> start function: initiates the computation of the information to be presented. This happens on
     *      receipt of a mouse hover event and disables the information control manager,
     * <li> restart function: tracks mouse move and shell activation event to determine when the information
     *      control manager needs to be reactivated.
     * </ul>
     */
    class MouseTracker : ShellAdapter , MouseTrackListener, MouseMoveListener {

        /** Margin around the original hover event location for computing the hover area. */
        private const static int EPSILON= 3;

        /** The area in which the original hover event occurred. */
        private Rectangle fHoverArea;
        /** The area for which is computed information is valid. */
        private Rectangle fSubjectArea;
        /** The tracker's subject control. */
        private Control fSubjectControl;

        /** Indicates whether the tracker is in restart mode ignoring hover events. */
        private bool fIsInRestartMode= false;
        /** Indicates whether the tracker is computing the information to be presented. */
        private bool fIsComputing= false;
        /** Indicates whether the mouse has been lost. */
        private bool fMouseLostWhileComputing= false;
        /** Indicates whether the subject control's shell has been deactivated. */
        private bool fShellDeactivatedWhileComputing= false;

        /**
         * Creates a new mouse tracker.
         */
        public this() {
        }

        /**
         * Sets this mouse tracker's subject area, the area to be tracked in order
         * to re-enable the information control manager.
         *
         * @param subjectArea the subject area
         */
        public void setSubjectArea(Rectangle subjectArea) {
            Assert.isNotNull(subjectArea);
            fSubjectArea= subjectArea;
        }

        /**
         * Starts this mouse tracker. The given control becomes this tracker's subject control.
         * Installs itself as mouse track listener on the subject control.
         *
         * @param subjectControl the subject control
         */
        public void start(Control subjectControl) {
            fSubjectControl= subjectControl;
            if (fSubjectControl !is null && !fSubjectControl.isDisposed())
                fSubjectControl.addMouseTrackListener(this);

            fIsInRestartMode= false;
            fIsComputing= false;
            fMouseLostWhileComputing= false;
            fShellDeactivatedWhileComputing= false;
        }

        /**
         * Stops this mouse tracker. Removes itself  as mouse track, mouse move, and
         * shell listener from the subject control.
         */
        public void stop() {
            if (fSubjectControl !is null && !fSubjectControl.isDisposed()) {
                fSubjectControl.removeMouseTrackListener(this);
                fSubjectControl.removeMouseMoveListener(this);
                fSubjectControl.getShell().removeShellListener(this);
            }
        }

        /**
         * Initiates the computation of the information to be presented. Sets the initial hover area
         * to a small rectangle around the hover event location. Adds mouse move and shell activation listeners
         * to track whether the computed information is, after completion, useful for presentation and to
         * implement the restart function.
         *
         * @param event the mouse hover event
         */
        public void mouseHover(MouseEvent event) {
            if (fIsComputing || fIsInRestartMode ||
                    (fSubjectControl !is null && !fSubjectControl.isDisposed() && fSubjectControl.getShell() !is fSubjectControl.getShell().getDisplay().getActiveShell())) {
                if (DEBUG)
                    System.out_.println(Format("AbstractHoverInformationControlManager...mouseHover: @ {}/{} : hover cancelled: fIsComputing= {}, fIsInRestartMode= {}", event.x, event.y, fIsComputing, fIsInRestartMode)); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$
                return;
            }

            fIsInRestartMode= true;
            fIsComputing= true;
            fMouseLostWhileComputing= false;
            fShellDeactivatedWhileComputing= false;

            fHoverEventStateMask= event.stateMask;
            fHoverEvent= event;
            fHoverArea= new Rectangle(event.x - EPSILON, event.y - EPSILON, 2 * EPSILON, 2 * EPSILON );
            if (fHoverArea.x < 0)
                fHoverArea.x= 0;
            if (fHoverArea.y < 0)
                fHoverArea.y= 0;
            setSubjectArea(fHoverArea);

            if (fSubjectControl !is null && !fSubjectControl.isDisposed()) {
                fSubjectControl.addMouseMoveListener(this);
                fSubjectControl.getShell().addShellListener(this);
            }
            doShowInformation();
        }

        /**
         * Deactivates this tracker's restart function and enables the information control
         * manager. Does not have any effect if the tracker is still executing the start function (i.e.
         * computing the information to be presented.
         */
        protected void deactivate() {
            if (fIsComputing)
                return;

            fIsInRestartMode= false;
            if (fSubjectControl !is null && !fSubjectControl.isDisposed()) {
                fSubjectControl.removeMouseMoveListener(this);
                fSubjectControl.getShell().removeShellListener(this);
            }
        }

        /*
         * @see MouseTrackListener#mouseEnter(MouseEvent)
         */
        public void mouseEnter(MouseEvent e) {
        }

        /*
         * @see MouseTrackListener#mouseExit(MouseEvent)
         */
        public void mouseExit(MouseEvent e) {
            if (!hasInformationControlReplacer() || !canMoveIntoInformationControl(getCurrentInformationControl()) || !inKeepUpZone(e.x, e.y, fSubjectControl, fSubjectArea, false)) {
                fMouseLostWhileComputing= true;
                deactivate();
            }
        }

        /*
         * @see MouseMoveListener#mouseMove(MouseEvent)
         */
        public void mouseMove(MouseEvent event) {
            if (!hasInformationControlReplacer() || !canMoveIntoInformationControl(getCurrentInformationControl())) {
                if (!fSubjectArea.contains(event.x, event.y))
                    deactivate();
            } else {
                if (!inKeepUpZone(event.x, event.y, fSubjectControl, fSubjectArea, false))
                    deactivate();
            }
        }

        /*
         * @see ShellListener#shellDeactivated(ShellEvent)
         */
        public void shellDeactivated(ShellEvent e) {
            fShellDeactivatedWhileComputing= true;
            deactivate();
        }

        /*
         * @see ShellListener#shellIconified(ShellEvent)
         */
        public void shellIconified(ShellEvent e) {
            fShellDeactivatedWhileComputing= true;
            deactivate();
        }

        /**
         * Tells this tracker that the start function processing has been completed.
         */
        public void computationCompleted() {
            fIsComputing= false;
            fMouseLostWhileComputing= false;
            fShellDeactivatedWhileComputing= false;
        }

        /**
         * Determines whether the computed information is still useful for presentation.
         * This is not the case, if the shell of the subject control has been deactivated, the mouse
         * left the subject control, or the mouse moved on, so that it is no longer in the subject
         * area.
         *
         * @return <code>true</code> if information is still useful for presentation, <code>false</code> otherwise
         */
        public bool isMouseLost() {

            if (fMouseLostWhileComputing || fShellDeactivatedWhileComputing)
                return true;

            if (fSubjectControl !is null && !fSubjectControl.isDisposed()) {
                Display display= fSubjectControl.getDisplay();
                Point p= display.getCursorLocation();
                p= fSubjectControl.toControl(p);
                if (!fSubjectArea.contains(p) && !fHoverArea.contains(p))
                    return true;
            }

            return false;
        }
    }

    /**
     * The delay in {@link ITextViewerExtension8.EnrichMode#AFTER_DELAY} mode after which
     * the hover is enriched when the mouse has stopped moving inside the hover.
     * @since 3.4
     */
    private static const long HOVER_AUTO_REPLACING_DELAY= 200;

    /** The mouse tracker on the subject control */
    private MouseTracker fMouseTracker;
    /**
     * The remembered hover event.
     * @since 3.0
     */
    private MouseEvent fHoverEvent= null;
    /** The remembered hover event state mask of the keyboard modifiers */
    private int fHoverEventStateMask= 0;
    /**
     * The thread that delays replacing of the hover information control.
     * To be accessed in the UI thread only!
     *
     * @since 3.4
     */
    private Job fReplacingDelayJob;

    /**
     * The {@link ITextViewerExtension8.EnrichMode}, may be <code>null</code>.
     * @since 3.4
     */
    private ITextViewerExtension8_EnrichMode fEnrichMode;

    /**
     * Indicates whether we have received a MouseDown event and are waiting for a MouseUp
     * (and don't replace the information control until that happened).
     * @since 3.4
     */
    private bool fWaitForMouseUp= false;

    /**
     * Creates a new hover information control manager using the given information control creator.
     * By default a <code>Closer</code> instance is set as this manager's closer.
     *
     * @param creator the information control creator
     */
    protected this(IInformationControlCreator creator) {
        fMouseTracker= new MouseTracker();
        super(creator);
        setCloser(new Closer());
        setHoverEnrichMode(ITextViewerExtension8_EnrichMode.AFTER_DELAY);
    }

    /**
     * Tests whether a given mouse location is within the keep-up zone.
     * The hover should not be hidden as long as the mouse stays inside this zone.
     *
     * @param x the x coordinate, relative to the <em>subject control</em>
     * @param y the y coordinate, relative to the <em>subject control</em>
     * @param subjectControl the subject control
     * @param subjectArea the area for which the presented information is valid
     * @param blowUp If <code>true</code>, then calculate for the closer, i.e. blow up the keepUp area.
     *        If <code>false</code>, then use tight bounds for hover detection.
     *
     * @return <code>true</code> iff the mouse event occurred in the keep-up zone
     * @since 3.4
     */
    private bool inKeepUpZone(int x, int y, Control subjectControl, Rectangle subjectArea, bool blowUp) {
        if (subjectArea.contains(x, y))
            return true;

        IInformationControl iControl= getCurrentInformationControl();
        if (( cast(IInformationControlExtension5)iControl  && !(cast(IInformationControlExtension5) iControl).isVisible())) {
            iControl= null;
            if (getInformationControlReplacer() !is null) {
                iControl= getInformationControlReplacer().getCurrentInformationControl2();
                if (( cast(IInformationControlExtension5)iControl  && !(cast(IInformationControlExtension5) iControl).isVisible())) {
                    return false;
                }
            }
        }
        if ( cast(IInformationControlExtension3)iControl ) {
            IInformationControlExtension3 iControl3= cast(IInformationControlExtension3) iControl;

            Rectangle iControlBounds= subjectControl.getDisplay().map(null, subjectControl, iControl3.getBounds());
            Rectangle totalBounds= Geometry.copy(iControlBounds);
            if (blowUp && isReplaceInProgress()) {
                //Problem: blown up iControl overlaps rest of subjectArea's line
                // solution for now: only blow up for keep up (closer), but not for further hover detection
                int margin= getInformationControlReplacer().getKeepUpMargin();
                Geometry.expand(totalBounds, margin, margin, margin, margin);
            }

            if (!blowUp) {
                if (iControlBounds.contains(x, y))
                    return true;

                if (subjectArea.y + subjectArea.height < iControlBounds.y) {
                    // special case for hover events: subjectArea totally above iControl:
                    //  +-----------+
                    //  |subjectArea|
                    //  +-----------+
                    //  |also keepUp|
                    // ++-----------+-------+
                    // | InformationControl |
                    // +--------------------+
                    if (subjectArea.y + subjectArea.height <= y && y <= totalBounds.y) {
                        // is vertically between subject area and iControl
                        if (subjectArea.x <= x && x <= subjectArea.x + subjectArea.width) {
                            // is below subject area (in a vertical projection)
                            return true;
                        }
                        // FIXME: cases when subjectArea extends to left or right of iControl?
                    }
                    return false;

                } else if (iControlBounds.x + iControlBounds.width < subjectArea.x) {
                    // special case for hover events (e.g. in overview ruler): iControl totally left of subjectArea
                    // +--------------------+-----------+
                    // |                    |           +-----------+
                    // | InformationControl |also keepUp|subjectArea|
                    // |                    |           +-----------+
                    // +--------------------+-----------+
                    if (iControlBounds.x + iControlBounds.width <= x && x <= subjectArea.x) {
                        // is horizontally between iControl and subject area
                        if (iControlBounds.y <= y && y <= iControlBounds.y + iControlBounds.height) {
                            // is to the right of iControl (in a horizontal projection)
                            return true;
                        }
                    }
                    return false;

                } else if (subjectArea.x + subjectArea.width < iControlBounds.x) {
                    // special case for hover events (e.g. in annotation ruler): subjectArea totally left of iControl
                    //             +-----------+--------------------+
                    // +-----------+           |                    |
                    // |subjectArea|also keepUp| InformationControl |
                    // +-----------+           |                    |
                    //             +-----------+--------------------+
                    if (subjectArea.x + subjectArea.width <= x && x <= iControlBounds.x) {
                        // is horizontally between subject area and iControl
                        if (iControlBounds.y <= y && y <= iControlBounds.y + iControlBounds.height) {
                            // is to the left of iControl (in a horizontal projection)
                            return true;
                        }
                    }
                    return false;
                }
            }

            // FIXME: should maybe use convex hull, not bounding box
            totalBounds.add(subjectArea);
            if (totalBounds.contains(x, y))
                return true;
        }
        return false;
    }

    /**
     * Tests whether the given information control allows the mouse to be moved
     * into it.
     *
     * @param iControl information control or <code>null</code> if none
     * @return <code>true</code> if information control allows mouse move into
     *         control, <code>false</code> otherwise
     */
    bool canMoveIntoInformationControl(IInformationControl iControl) {
        return fEnrichMode !is null && canReplace(iControl);
    }

    /*
     * @see org.eclipse.jface.text.AbstractInformationControlManager#hideInformationControl()
     */
    protected void hideInformationControl() {
        cancelReplacingDelay();
        super.hideInformationControl();
    }

    /**
     * Sets the hover enrich mode. Only applicable when an information
     * control replacer has been set with
     * {@link #setInformationControlReplacer(InformationControlReplacer)} .
     *
     * @param mode the enrich mode
     * @since 3.4
     * @see ITextViewerExtension8#setHoverEnrichMode(org.eclipse.jface.text.ITextViewerExtension8.EnrichMode)
     */
    void setHoverEnrichMode(ITextViewerExtension8_EnrichMode mode) {
        fEnrichMode= mode;
    }

    /*
     * @see org.eclipse.jface.text.AbstractInformationControlManager#replaceInformationControl(bool)
     */
    void replaceInformationControl(bool takeFocus) {
        fWaitForMouseUp= false;
        super.replaceInformationControl(takeFocus);
    }

    /**
     * Cancels the replacing delay job.
     * @return <code>true</code> iff canceling was successful, <code>false</code> if replacing has already started
     */
    bool cancelReplacingDelay() {
        fWaitForMouseUp= false;
        if (fReplacingDelayJob !is null && fReplacingDelayJob.getState() !is Job.RUNNING) {
            bool cancelled= fReplacingDelayJob.cancel();
            fReplacingDelayJob= null;
//          if (DEBUG)
//              System.out_.println("AbstractHoverInformationControlManager.cancelReplacingDelay(): cancelled=" + cancelled); //$NON-NLS-1$
            return cancelled;
        }
//      if (DEBUG)
//          System.out_.println("AbstractHoverInformationControlManager.cancelReplacingDelay(): not delayed"); //$NON-NLS-1$
        return true;
    }

    /**
     * Starts replacing the information control, considering the current
     * {@link ITextViewerExtension8.EnrichMode}.
     * If set to {@link ITextViewerExtension8.EnrichMode#AFTER_DELAY}, this
     * method cancels previous requests and restarts the delay timer.
     *
     * @param display the display to be used for the call to
     *        {@link #replaceInformationControl(bool)} in the UI thread
     */
    private void startReplaceInformationControl(Display display) {
        if (fEnrichMode is ITextViewerExtension8_EnrichMode.ON_CLICK)
            return;

        if (fReplacingDelayJob !is null) {
            if (fReplacingDelayJob.getState() !is Job.RUNNING) {
                if (fReplacingDelayJob.cancel()) {
                    if (fEnrichMode is ITextViewerExtension8_EnrichMode.IMMEDIATELY) {
                        fReplacingDelayJob= null;
                        if (! fWaitForMouseUp)
                            replaceInformationControl(false);
                    } else {
//                      if (DEBUG)
//                          System.out_.println("AbstractHoverInformationControlManager.startReplaceInformationControl(): rescheduled"); //$NON-NLS-1$
                        fReplacingDelayJob.schedule(HOVER_AUTO_REPLACING_DELAY);
                    }
                }
            }
            return;
        }

        fReplacingDelayJob= new class("AbstractHoverInformationControlManager Replace Delayer", display) Job { //$NON-NLS-1$
            Display display_;
            this( String str, Display b){
                super(str);
                display_=b;
            }
            public IStatus run(IProgressMonitor monitor) {
                if (monitor.isCanceled() || display_.isDisposed()) {
                    return Status.CANCEL_STATUS;
                }
                display_.syncExec(dgRunnable( (IProgressMonitor monitor_) {
                    fReplacingDelayJob= null;
                    if (monitor_.isCanceled())
                        return;
                    if (! fWaitForMouseUp)
                        replaceInformationControl(false);
                }, monitor ));
                return Status.OK_STATUS;
            }
        };
        fReplacingDelayJob.setSystem(true);
        fReplacingDelayJob.setPriority(Job.INTERACTIVE);
//      if (DEBUG)
//          System.out_.println("AbstractHoverInformationControlManager.startReplaceInformationControl(): scheduled"); //$NON-NLS-1$
        fReplacingDelayJob.schedule(HOVER_AUTO_REPLACING_DELAY);
    }

    /*
     * @see org.eclipse.jface.text.AbstractInformationControlManager#presentInformation()
     */
    protected void presentInformation() {
        if (fMouseTracker is null) {
            super.presentInformation();
            return;
        }

        Rectangle area= getSubjectArea();
        if (area !is null)
            fMouseTracker.setSubjectArea(area);

        if (fMouseTracker.isMouseLost()) {
            fMouseTracker.computationCompleted();
            fMouseTracker.deactivate();
        } else {
            fMouseTracker.computationCompleted();
            super.presentInformation();
        }
    }

    /**
     * {@inheritDoc}
     * @deprecated visibility will be changed to protected
     */
    public void setEnabled(bool enabled) {

        bool was= isEnabled();
        super.setEnabled(enabled);
        bool is_= isEnabled();

        if (was !is is_ && fMouseTracker !is null) {
            if (is_)
                fMouseTracker.start(getSubjectControl());
            else
                fMouseTracker.stop();
        }
    }

    /**
     * Disposes this manager's information control.
     */
    public void dispose() {
        if (fMouseTracker !is null) {
            fMouseTracker.stop();
            fMouseTracker.fSubjectControl= null;
            fMouseTracker= null;
        }
        super.dispose();
    }

    /**
     * Returns the location at which the most recent mouse hover event
     * has been issued.
     *
     * @return the location of the most recent mouse hover event
     */
    protected Point getHoverEventLocation() {
        return fHoverEvent !is null ? new Point(fHoverEvent.x, fHoverEvent.y) : new Point(-1, -1);
    }
    package Point getHoverEventLocation_package() {
        return getHoverEventLocation();
    }

    /**
     * Returns the most recent mouse hover event.
     *
     * @return the most recent mouse hover event or <code>null</code>
     * @since 3.0
     */
    protected MouseEvent getHoverEvent() {
        return fHoverEvent;
    }

    /**
     * Returns the SWT event state of the most recent mouse hover event.
     *
     * @return the SWT event state of the most recent mouse hover event
     */
    protected int getHoverEventStateMask() {
        return fHoverEventStateMask;
    }

    /**
     * Returns an adapter that gives access to internal methods.
     * <p>
     * <strong>Note:</strong> This method is not intended to be referenced or overridden by clients.</p>
     *
     * @return the replaceable information control accessor
     * @since 3.4
     * @noreference This method is not intended to be referenced by clients.
     * @nooverride This method is not intended to be re-implemented or extended by clients.
     */
    public InternalAccessor getInternalAccessor() {
        return new MyInternalAccessor2(this);
    }
        static class MyInternalAccessor2 : MyInternalAccessor {
            AbstractHoverInformationControlManager outer_;
            this( AbstractHoverInformationControlManager a ){
                outer_=a;
                super(a);
            }
            public void setHoverEnrichMode(ITextViewerExtension8_EnrichMode mode) {
                outer_.setHoverEnrichMode(mode);
            }
        }

}
