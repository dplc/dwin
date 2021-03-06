/*******************************************************************************
 * Copyright (c) 2006, 2008 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation (original file org.eclipse.ui.texteditor.templates.ColumnLayout)
 *     Tom Schindl <tom.schindl@bestsolution.at> - refactored to be widget independent (bug 171824)
 *                                               - fix for bug 178280, 184342, 184045, 208014, 214532
 *     Micah Hainline <micah_hainline@yahoo.com> - fix in bug: 208335
 * Port to the D programming language:
 *     Frank Benoit <benoit@tionex.de>
 *******************************************************************************/
module org.eclipse.jface.layout.AbstractColumnLayout;


import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Layout;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Scrollable;
import org.eclipse.swt.widgets.Widget;
import org.eclipse.core.runtime.Assert;
import org.eclipse.jface.util.Policy;
import org.eclipse.jface.viewers.ColumnLayoutData;
import org.eclipse.jface.viewers.ColumnPixelData;
import org.eclipse.jface.viewers.ColumnWeightData;
import org.eclipse.jface.viewers.TableLayout;

import java.lang.all;
import java.util.Set;

/**
 * The AbstractColumnLayout is a {@link Layout} used to set the size of a table
 * in a consistent way even during a resize unlike a {@link TableLayout} which
 * only sets initial sizes.
 *
 * <p>
 * <b>You can only add the layout to a container whose only child is the
 * table/tree control you want the layouts applied to.</b>
 * </p>
 *
 * @since 3.4
 */
public abstract class AbstractColumnLayout : Layout {
    private static int COLUMN_TRIM;

    static const bool IS_GTK;

    static const String LAYOUT_DATA;

    static this() {
        if ("win32".equals(SWT.getPlatform())) { //$NON-NLS-1$
            COLUMN_TRIM = 4;
        } else if ("carbon".equals(SWT.getPlatform())) { //$NON-NLS-1$
            COLUMN_TRIM = 24;
        } else {
            COLUMN_TRIM = 3;
        }
        IS_GTK = "gtk".equals(SWT.getPlatform());//$NON-NLS-1$
        LAYOUT_DATA = Policy.JFACE ~ ".LAYOUT_DATA"; //$NON-NLS-1$
    }

    private bool inupdateMode = false;

    private bool relayout = true;

    private Listener resizeListener;
    private void init_resizeListener(){
        resizeListener = new class Listener {

            public void handleEvent(Event event) {
                if( ! inupdateMode ) {
                    updateColumnData(event.widget);
                }
            }

        };
    }
    public this(){
        init_resizeListener();
    }

    /**
     * Adds a new column of data to this table layout.
     *
     * @param column
     *            the column
     *
     * @param data
     *            the column layout data
     */
    public void setColumnData(Widget column, ColumnLayoutData data) {

        if (column.getData(LAYOUT_DATA) is null) {
            column.addListener(SWT.Resize, resizeListener);
        }

        column.setData(LAYOUT_DATA, data);
    }

    /**
     * Compute the size of the table or tree based on the ColumnLayoutData and
     * the width and height hint.
     *
     * @param scrollable
     *            the widget to compute
     * @param wHint
     *            the width hint
     * @param hHint
     *            the height hint
     * @return Point where x is the width and y is the height
     */
    private Point computeTableTreeSize(Scrollable scrollable, int wHint,
            int hHint) {
        Point result = scrollable.computeSize(wHint, hHint);

        int width = 0;
        int size = getColumnCount(scrollable);
        for (int i = 0; i < size; ++i) {
            ColumnLayoutData layoutData = getLayoutData(scrollable, i);
            if ( auto col = cast(ColumnPixelData)layoutData) {
                width += col.width;
                if (col.addTrim) {
                    width += getColumnTrim();
                }
            } else if ( auto col = cast(ColumnWeightData)layoutData ) {
                width += col.minimumWidth;
            } else {
                Assert.isTrue(false, "Unknown column layout data"); //$NON-NLS-1$
            }
        }
        if (width > result.x)
            result.x = width;

        return result;
    }

    /**
     * Layout the scrollable based on the supplied width and area. Only increase
     * the size of the scrollable if increase is <code>true</code>.
     *
     * @param scrollable
     * @param width
     * @param area
     * @param increase
     */
    private void layoutTableTree(Scrollable scrollable, int width,
            Rectangle area, bool increase) {
        int numberOfColumns = getColumnCount(scrollable);
        int[] widths = new int[numberOfColumns];

        int[] weightColumnIndices = new int[numberOfColumns];
        int numberOfWeightColumns = 0;

        int fixedWidth = 0;
        int totalWeight = 0;

        // First calc space occupied by fixed columns
        for (int i = 0; i < numberOfColumns; i++) {
            ColumnLayoutData col = getLayoutData(scrollable, i);
            if ( auto cpd = cast(ColumnPixelData)col ) {
                int pixels = cpd.width;
                if (cpd.addTrim) {
                    pixels += getColumnTrim();
                }
                widths[i] = pixels;
                fixedWidth += pixels;
            } else if ( auto cw = cast(ColumnWeightData) col ) {
                weightColumnIndices[numberOfWeightColumns] = i;
                numberOfWeightColumns++;
                totalWeight += cw.weight;
            } else {
                Assert.isTrue(false, "Unknown column layout data"); //$NON-NLS-1$
            }
        }

        bool recalculate;
        do {
            recalculate = false;
            for (int i = 0; i < numberOfWeightColumns; i++) {
                int colIndex = weightColumnIndices[i];
                ColumnWeightData cw = cast(ColumnWeightData) getLayoutData(
                        scrollable, colIndex);
                final int minWidth = cw.minimumWidth;
                final int allowedWidth = (width - fixedWidth) * cw.weight
                        / totalWeight;
                if (allowedWidth < minWidth) {
                    /*
                     * if the width assigned by weight is less than the minimum,
                     * then treat this column as fixed, remove it from weight
                     * calculations, and recalculate other weights.
                     */
                    numberOfWeightColumns--;
                    totalWeight -= cw.weight;
                    fixedWidth += minWidth;
                    widths[colIndex] = minWidth;
                    System.arraycopy(weightColumnIndices, i + 1,
                            weightColumnIndices, i, numberOfWeightColumns - i);
                    recalculate = true;
                    break;
                }
                widths[colIndex] = allowedWidth;
            }
        } while (recalculate);

        if (increase) {
            scrollable.setSize(area.width, area.height);
        }

        inupdateMode = true;
        setColumnWidths(scrollable, widths);
        scrollable.update();
        inupdateMode = false;

        if (!increase) {
            scrollable.setSize(area.width, area.height);
        }
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.swt.widgets.Layout#computeSize(org.eclipse.swt.widgets.Composite,
     *      int, int, bool)
     */
    protected override Point computeSize(Composite composite, int wHint, int hHint,
            bool flushCache) {
        return computeTableTreeSize(getControl(composite), wHint, hHint);
    }

    /*
     * (non-Javadoc)
     *
     * @see org.eclipse.swt.widgets.Layout#layout(org.eclipse.swt.widgets.Composite,
     *      bool)
     */
    protected override void layout(Composite composite, bool flushCache) {
        Rectangle area = composite.getClientArea();
        Scrollable table = getControl(composite);
        int tableWidth = table.getSize().x;
        int trim = computeTrim(area, table, tableWidth);
        int width = Math.max(0, area.width - trim);

        if (width > 1)
            layoutTableTree(table, width, area, tableWidth < area.width);

        // For the first time we need to relayout because Scrollbars are not
        // calculate appropriately
        if (relayout) {
            relayout = false;
            composite.layout();
        }
    }

    /**
     * Compute the area required for trim.
     *
     * @param area
     * @param scrollable
     * @param currentWidth
     * @return int
     */
    private int computeTrim(Rectangle area, Scrollable scrollable,
            int currentWidth) {
        int trim;

        if (currentWidth > 1) {
            trim = currentWidth - scrollable.getClientArea().width;
        } else {
            // initially, the table has no extend and no client area - use the
            // border with
            // plus some padding as educated guess
            trim = 2 * scrollable.getBorderWidth() + 1;
        }

        return trim;
    }

    /**
     * Get the control being laid out.
     *
     * @param composite
     *            the composite with the layout
     * @return {@link Scrollable}
     */
    Scrollable getControl(Composite composite) {
        return cast(Scrollable) composite.getChildren()[0];
    }

    /**
     * Get the number of columns for the receiver.
     *
     * @return the number of columns
     */
    abstract int getColumnCount(Scrollable tableTree);

    /**
     * Set the widths of the columns.
     *
     * @param widths
     */
    abstract void setColumnWidths(Scrollable tableTree, int[] widths);

    abstract ColumnLayoutData getLayoutData(Scrollable tableTree,
            int columnIndex);

    abstract void updateColumnData(Widget column);

    /**
     * The number of extra pixels taken as horizontal trim by the table column.
     * To ensure there are N pixels available for the content of the column,
     * assign N+COLUMN_TRIM for the column width.
     *
     * @return the trim used by the columns
     * @since 3.4
     */
    protected int getColumnTrim() {
        return COLUMN_TRIM;
    }
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
