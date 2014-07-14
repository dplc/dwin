/*******************************************************************************
 * Copyright (c) 2006, 2008 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *     Tom Schindl <tom.schindl@bestsolution.at> - initial API and implementation
 *                                                 bugfix in: 195137, 198089
 *     Fredy Dobler <fredy@dobler.net> - bug 159600
 *     Brock Janiczak <brockj@tpg.com.au> - bug 182443
 * Port to the D programming language:
 *     Frank Benoit <benoit@tionex.de>
 *******************************************************************************/

module org.eclipse.jface.viewers.ColumnViewerToolTipSupport;

import org.eclipse.jface.viewers.ColumnViewer;
import org.eclipse.jface.viewers.ViewerRow;
import org.eclipse.jface.viewers.ViewerColumn;
import org.eclipse.jface.viewers.ViewerCell;
import org.eclipse.jface.viewers.CellLabelProvider;
import org.eclipse.jface.viewers.StructuredSelection;

import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Event;
import org.eclipse.jface.util.Policy;
import org.eclipse.jface.window.DefaultToolTip;
import org.eclipse.jface.window.ToolTip;

import java.lang.all;
import java.util.Set;

/**
 * The ColumnViewerTooltipSupport is the class that provides tool tips for
 * ColumnViewers.
 *
 * @since 3.3
 *
 */
public class ColumnViewerToolTipSupport : DefaultToolTip {
    private ColumnViewer viewer;

    private static const String VIEWER_CELL_KEY = Policy.JFACE
            ~ "_VIEWER_CELL_KEY"; //$NON-NLS-1$

    private static const int DEFAULT_SHIFT_X = 10;

    private static const int DEFAULT_SHIFT_Y = 0;

    /**
     * Enable ToolTip support for the viewer by creating an instance from this
     * class. To get all necessary informations this support class consults the
     * {@link CellLabelProvider}.
     *
     * @param viewer
     *            the viewer the support is attached to
     * @param style
     *            style passed to control tool tip behavior
     *
     * @param manualActivation
     *            <code>true</code> if the activation is done manually using
     *            {@link #show(Point)}
     */
    protected this(ColumnViewer viewer, int style,
            bool manualActivation) {
        super(viewer.getControl(), style, manualActivation);
        this.viewer = viewer;
    }

    /**
     * Enable ToolTip support for the viewer by creating an instance from this
     * class. To get all necessary informations this support class consults the
     * {@link CellLabelProvider}.
     *
     * @param viewer
     *            the viewer the support is attached to
     */
    public static void enableFor(ColumnViewer viewer) {
        new ColumnViewerToolTipSupport(viewer, ToolTip.NO_RECREATE, false);
    }

    /**
     * Enable ToolTip support for the viewer by creating an instance from this
     * class. To get all necessary informations this support class consults the
     * {@link CellLabelProvider}.
     *
     * @param viewer
     *            the viewer the support is attached to
     * @param style
     *            style passed to control tool tip behavior
     *
     * @see ToolTip#RECREATE
     * @see ToolTip#NO_RECREATE
     */
    public static void enableFor(ColumnViewer viewer, int style) {
        new ColumnViewerToolTipSupport(viewer, style, false);
    }

    protected override Object getToolTipArea(Event event) {
        return viewer.getCell(new Point(event.x, event.y));
    }

    /**
     * Instead of overwriting this method subclasses should overwrite
     * {@link #createViewerToolTipContentArea(Event, ViewerCell, Composite)}
     */
    protected Composite createToolTipContentArea(Event event, Composite parent) {
        ViewerCell cell = cast(ViewerCell) getData(VIEWER_CELL_KEY);
        setData(VIEWER_CELL_KEY, null);

        return createViewerToolTipContentArea(event, cell, parent);
    }

    /**
     * Creates the content area of the tool tip giving access to the cell the
     * tip is shown for. Subclasses can overload this method to implement their
     * own tool tip design.
     *
     * <p>
     * This method is called from
     * {@link #createToolTipContentArea(Event, Composite)} and by default calls
     * the {@link DefaultToolTip#createToolTipContentArea(Event, Composite)}.
     * </p>
     *
     * @param event
     *            the event that which
     * @param cell
     *            the cell the tool tip is shown for
     * @param parent
     *            the parent of the control to create
     * @return the control to be displayed in the tool tip area
     * @since 3.4
     */
    protected Composite createViewerToolTipContentArea(Event event,
            ViewerCell cell, Composite parent) {
        return super.createToolTipContentArea(event, parent);
    }

    protected override bool shouldCreateToolTip(Event event) {
        if (!super.shouldCreateToolTip(event)) {
            return false;
        }

        bool rv = false;

        ViewerRow row = viewer.getViewerRow_package(new Point(event.x, event.y));

        viewer.getControl().setToolTipText(""); //$NON-NLS-1$
        Point point = new Point(event.x, event.y);

        if (row !is null) {
            Object element = row.getItem().getData();

            ViewerCell cell = row.getCell(point);
            ViewerColumn viewPart = viewer.getViewerColumn(cell
                    .getColumnIndex());

            if (viewPart is null) {
                return false;
            }

            CellLabelProvider labelProvider = viewPart.getLabelProvider();
            bool useNative = labelProvider.useNativeToolTip(element);

            String text = labelProvider.getToolTipText(element);
            Image img = null;

            if (!useNative) {
                img = labelProvider.getToolTipImage(element);
            }

            if (useNative || (text is null && img is null)) {
                viewer.getControl().setToolTipText(text);
                rv = false;
            } else {
                setPopupDelay(labelProvider.getToolTipDisplayDelayTime(element));
                setHideDelay(labelProvider.getToolTipTimeDisplayed(element));

                Point shift = labelProvider.getToolTipShift(element);

                if (shift is null) {
                    setShift(new Point(DEFAULT_SHIFT_X, DEFAULT_SHIFT_Y));
                } else {
                    setShift(new Point(shift.x, shift.y));
                }

                setData(VIEWER_CELL_KEY, cell);

                setText(text);
                setImage(img);
                setStyle(labelProvider.getToolTipStyle(element));
                setForegroundColor(labelProvider
                        .getToolTipForegroundColor(element));
                setBackgroundColor(labelProvider
                        .getToolTipBackgroundColor(element));
                setFont(labelProvider.getToolTipFont(element));

                // Check if at least one of the values is set
                rv = getText(event) !is null || getImage(event) !is null;
            }
        }

        return rv;
    }

    protected override void afterHideToolTip(Event event) {
        super.afterHideToolTip(event);
        // Clear the restored value else this could be a source of a leak
        setData(VIEWER_CELL_KEY, null);
        if (event !is null && event.widget !is viewer.getControl()) {
            viewer.getControl().setFocus();
        }
    }
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
