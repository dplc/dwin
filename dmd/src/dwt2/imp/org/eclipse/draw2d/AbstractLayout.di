/*******************************************************************************
 * Copyright (c) 2000, 2005 IBM Corporation and others.
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
module org.eclipse.draw2d.AbstractLayout;

import java.lang.all;

import org.eclipse.draw2d.geometry.Dimension;
import org.eclipse.draw2d.IFigure;
import org.eclipse.draw2d.LayoutManager;

/**
 * Provides generic support for LayoutManagers.
 */
public abstract class AbstractLayout
    : LayoutManager
{

/**
 * The cached preferred size.
 */
protected Dimension preferredSize;

/**
 * Whether or not this layout pays attention to visiblity of figures when
 * calculating its bounds. By default, false.
 */
protected bool isObservingVisibility_ = false;

/**
 * This method is now {@link #calculatePreferredSize(IFigure, int, int)}.
 * @param container the figure
 */
protected final void calculatePreferredSize(IFigure container) { }

/**
 * Calculates the preferred size of the given figure, using width and height hints.
 * @param container The figure
 * @param wHint The width hint
 * @param hHint The height hint
 * @return The preferred size
 */
protected abstract Dimension calculatePreferredSize(IFigure container,
    int wHint, int hHint);

/**
 * Returns the preferred size of the figure's border.
 * @param container The figure that the border is on
 * @return The border's preferred size
 */
protected Dimension getBorderPreferredSize(IFigure container) {
    if (container.getBorder() is null)
        return new Dimension();
    return container.getBorder().getPreferredSize(container);
}

/**
 * Returns the constraint for the given figure.
 * @param child The figure
 * @return The constraint
 */
public Object getConstraint(IFigure child) {
    return null;
}

/**
 * This method is now {@link #getMinimumSize(IFigure, int, int)}.
 * @param container the figure
 */
public final void getMinimumSize(IFigure container) { }

/**
 * @see org.eclipse.draw2d.LayoutManager#getMinimumSize(IFigure, int, int)
 */
public Dimension getMinimumSize(IFigure container, int wHint, int hHint) {
    return getPreferredSize(container, wHint, hHint);
}

/**
 * Returns the preferred size of the given figure, using width and height hints.  If the
 * preferred size is cached, that size  is returned.  Otherwise, {@link
 * #calculatePreferredSize(IFigure, int, int)} is called.
 * @param container The figure
 * @param wHint The width hint
 * @param hHint The height hint
 * @return The preferred size
 */
public Dimension getPreferredSize(IFigure container, int wHint, int hHint) {
    if (preferredSize is null)
        preferredSize = calculatePreferredSize(container, wHint, hHint);
    return preferredSize;
}

/**
 * This method is now {@link #getPreferredSize(IFigure, int, int)}.
 * @param container the figure
 */
public final void getPreferredSize(IFigure container) { }


/**
 * @see org.eclipse.draw2d.LayoutManager#invalidate()
 */
public void invalidate() {
    preferredSize = null;
}

/**
 * Removes any cached information about the given figure.
 * @param child the child that is invalidated
 */
protected void invalidate(IFigure child) {
    invalidate();
}

/**
 * Returns whether or not this layout pays attention to visiblity when calculating its
 * bounds.
 * @return true if invisible figures should not contribute to this layout's bounds.
 */
public bool isObservingVisibility() {
    return isObservingVisibility_;
}

/**
 * Removes the given figure from this LayoutManager's list of figures.
 * @param child The figure to remove
 */
public void remove(IFigure child) {
    invalidate();
}

/**
 * Sets the constraint for the given figure.
 * @param child the child
 * @param constraint the child's new constraint
 */
public void setConstraint(IFigure child, Object constraint) {
    invalidate(child);
}

/**
 * Sets isObservingVisibility to the given value.
 * @param newValue <code>true</code> if visibility should be observed
 */
public void setObserveVisibility(bool newValue) {
    if (isObservingVisibility_ is newValue)
        return;
    isObservingVisibility_ = newValue;
}

}

version (build) {
    debug {
        pragma(link, "dwt2draw2d");
    } else {
        pragma(link, "dwt2draw2d");
    }
}
