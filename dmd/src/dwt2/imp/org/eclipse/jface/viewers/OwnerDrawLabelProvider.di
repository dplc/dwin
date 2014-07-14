/*******************************************************************************
 * Copyright (c) 2006, 2008 IBM Corporation and others.
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

module org.eclipse.jface.viewers.OwnerDrawLabelProvider;

import org.eclipse.jface.viewers.CellLabelProvider;
import org.eclipse.jface.viewers.ColumnViewer;
import org.eclipse.jface.viewers.ViewerCell;
import org.eclipse.jface.viewers.ViewerColumn;

import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.Color;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Listener;

import java.lang.all;
import java.util.Set;
import java.util.HashSet;

/**
 * OwnerDrawLabelProvider is an abstract implementation of a label provider that
 * handles custom draw.
 *
 * <p>
 * <b>This class is intended to be subclassed by implementors.</b>
 * </p>
 *
 * @since 3.3
 *
 */
public abstract class OwnerDrawLabelProvider : CellLabelProvider {

    alias CellLabelProvider.dispose dispose;

    static class OwnerDrawListener : Listener {
        Set enabledColumns;
        int enabledGlobally = 0;
        private ColumnViewer viewer;

        this(ColumnViewer viewer) {
            enabledColumns = new HashSet();
            this.viewer = viewer;
        }

        public void handleEvent(Event event) {
            CellLabelProvider provider = viewer.getViewerColumn(event.index)
                    .getLabelProvider();
            ViewerColumn column = viewer.getViewerColumn(event.index);
            if (enabledGlobally > 0 || enabledColumns.contains(column)) {
                if (null !is cast(OwnerDrawLabelProvider)provider ) {
                    Object element = event.item.getData();
                    OwnerDrawLabelProvider ownerDrawProvider = cast(OwnerDrawLabelProvider) provider;
                    switch (event.type) {
                    case SWT.MeasureItem:
                        ownerDrawProvider.measure(event, element);
                        break;
                    case SWT.PaintItem:
                        ownerDrawProvider.paint(event, element);
                        break;
                    case SWT.EraseItem:
                        ownerDrawProvider.erase(event, element);
                        break;
                    default:
                    }
                }
            }
        }
    }

    private static const String OWNER_DRAW_LABEL_PROVIDER_LISTENER = "owner_draw_label_provider_listener"; //$NON-NLS-1$

    /**
     * Set up the owner draw callbacks for the viewer.
     *
     * @param viewer
     *            the viewer the owner draw is set up
     *
     * @deprecated Since 3.4, the default implementation of
     *             {@link CellLabelProvider#initialize(ColumnViewer, ViewerColumn)}
     *             in this class will set up the necessary owner draw callbacks
     *             automatically. Calls to this method can be removed.
     */
    public static void setUpOwnerDraw(ColumnViewer viewer) {
        getOrCreateOwnerDrawListener(viewer).enabledGlobally++;
    }

    /**
     * @param viewer
     * @param control
     * @return
     */
    private static OwnerDrawListener getOrCreateOwnerDrawListener(
            ColumnViewer viewer) {
        Control control = viewer.getControl();
        OwnerDrawListener listener = cast(OwnerDrawListener) control
                .getData(OWNER_DRAW_LABEL_PROVIDER_LISTENER);
        if (listener is null) {
            listener = new OwnerDrawListener(viewer);
            control.setData(OWNER_DRAW_LABEL_PROVIDER_LISTENER, listener);
            control.addListener(SWT.MeasureItem, listener);
            control.addListener(SWT.EraseItem, listener);
            control.addListener(SWT.PaintItem, listener);
        }
        return listener;
    }

    /**
     * Create a new instance of the receiver based on a column viewer.
     *
     */
    public this() {

    }

    public void dispose(ColumnViewer viewer, ViewerColumn column) {
        if (!viewer.getControl().isDisposed()) {
            setOwnerDrawEnabled(viewer, column, false);
        }
        super.dispose(viewer, column);
    }

    /**
     * This implementation of
     * {@link CellLabelProvider#initialize(ColumnViewer, ViewerColumn)}
     * delegates to {@link #initialize(ColumnViewer, ViewerColumn, bool)}
     * with a value of <code>true</code> for <code>enableOwnerDraw</code>.
     * Subclasses may override this method but should either call the super
     * implementation or, alternatively,
     * {@link #initialize(ColumnViewer, ViewerColumn, bool)}.
     */
    protected void initialize(ColumnViewer viewer, ViewerColumn column) {
        this.initialize(viewer, column, true);
    }

    /**
     * May be called from subclasses that override
     * {@link #initialize(ColumnViewer, ViewerColumn)} but want to customize
     * whether owner draw will be enabled. This method calls
     * <code>super.initialize(ColumnViewer, ViewerColumn)</code>, and then
     * enables or disables owner draw by calling
     * {@link #setOwnerDrawEnabled(ColumnViewer, ViewerColumn, bool)}.
     *
     * @param viewer
     *            the viewer
     * @param column
     *            the column, or <code>null</code> if a column is not
     *            available.
     * @param enableOwnerDraw
     *            <code>true</code> if owner draw should be enabled for the
     *            given viewer and column, <code>false</code> otherwise.
     *
     * @since 3.4
     */
    final protected void initialize(ColumnViewer viewer, ViewerColumn column,
            bool enableOwnerDraw) {
        super.initialize(viewer, column);
        setOwnerDrawEnabled(viewer, column, enableOwnerDraw);
    }

    public void update(ViewerCell cell) {
        // Force a redraw
        Rectangle cellBounds = cell.getBounds();
        cell.getControl().redraw(cellBounds.x, cellBounds.y, cellBounds.width,
                cellBounds.height, true);

    }

    /**
     * Handle the erase event. The default implementation colors the background
     * of selected areas with {@link SWT#COLOR_LIST_SELECTION} and foregrounds
     * with {@link SWT#COLOR_LIST_SELECTION_TEXT}. Note that this
     * implementation causes non-native behavior on some platforms. Subclasses
     * should override this method and <b>not</b> call the super
     * implementation.
     *
     * @param event
     *            the erase event
     * @param element
     *            the model object
     * @see SWT#EraseItem
     * @see SWT#COLOR_LIST_SELECTION
     * @see SWT#COLOR_LIST_SELECTION_TEXT
     */
    protected void erase(Event event, Object element) {

        Rectangle bounds = event.getBounds();
        if ((event.detail & SWT.SELECTED) !is 0) {

            Color oldForeground = event.gc.getForeground();
            Color oldBackground = event.gc.getBackground();

            event.gc.setBackground(event.item.getDisplay().getSystemColor(
                    SWT.COLOR_LIST_SELECTION));
            event.gc.setForeground(event.item.getDisplay().getSystemColor(
                    SWT.COLOR_LIST_SELECTION_TEXT));
            event.gc.fillRectangle(bounds);
            /* restore the old GC colors */
            event.gc.setForeground(oldForeground);
            event.gc.setBackground(oldBackground);
            /* ensure that default selection is not drawn */
            event.detail &= ~SWT.SELECTED;

        }

    }

    /**
     * Handle the measure event.
     *
     * @param event
     *            the measure event
     * @param element
     *            the model element
     * @see SWT#MeasureItem
     */
    protected abstract void measure(Event event, Object element);

    /**
     * Handle the paint event.
     *
     * @param event
     *            the paint event
     * @param element
     *            the model element
     * @see SWT#PaintItem
     */
    protected abstract void paint(Event event, Object element);

    /**
     * Enables or disables owner draw for the given viewer and column. This
     * method will attach or remove a listener to the underlying control as
     * necessary. This method is called from
     * {@link #initialize(ColumnViewer, ViewerColumn)} and
     * {@link #dispose(ColumnViewer, ViewerColumn)} but may be called from
     * subclasses to enable or disable owner draw dynamically.
     *
     * @param viewer
     *            the viewer
     * @param column
     *            the column, or <code>null</code> if a column is not
     *            available
     * @param enabled
     *            <code>true</code> if owner draw should be enabled,
     *            <code>false</code> otherwise
     *
     * @since 3.4
     */
    protected void setOwnerDrawEnabled(ColumnViewer viewer,
            ViewerColumn column, bool enabled) {
        if (enabled) {
            OwnerDrawListener listener = getOrCreateOwnerDrawListener(viewer);
            if (column is null) {
                listener.enabledGlobally++;
            } else {
                listener.enabledColumns.add(column);
            }
        } else {
            OwnerDrawListener listener = cast(OwnerDrawListener) viewer
                    .getControl().getData(OWNER_DRAW_LABEL_PROVIDER_LISTENER);
            if (listener !is null) {
                if (column is null) {
                    listener.enabledGlobally--;
                } else {
                    listener.enabledColumns.remove(column);
                }
                if (listener.enabledColumns.isEmpty()
                        && listener.enabledGlobally <= 0) {
                    viewer.getControl().removeListener(SWT.MeasureItem,
                            listener);
                    viewer.getControl().removeListener(SWT.EraseItem, listener);
                    viewer.getControl().removeListener(SWT.PaintItem, listener);
                    viewer.getControl().setData(
                            OWNER_DRAW_LABEL_PROVIDER_LISTENER, null);
                }
            }
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
