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
module org.eclipse.draw2d.ConnectionLayer;

import java.lang.all;

import org.eclipse.swt.SWT;
import org.eclipse.draw2d.FreeformLayer;
import org.eclipse.draw2d.IFigure;
import org.eclipse.draw2d.Graphics;
import org.eclipse.draw2d.ConnectionRouter;
import org.eclipse.draw2d.Connection;

/**
 * Layer designed specifically to handle the presence of connections. This is done due to
 * the necessity of having a router for the connections added.
 */
public class ConnectionLayer
    : FreeformLayer
{

int antialias = SWT.DEFAULT;

/**
 * The ConnectionRouter used to route all connections on this layer.
 */
protected ConnectionRouter connectionRouter;

/**
 * Adds the given figure with the given contraint at the given index. If the figure is a
 * {@link Connection}, its {@link ConnectionRouter} is set.
 *
 * @param figure  Figure being added
 * @param constraint  Constraint of the figure being added
 * @param index  Index where the figure is to be added
 * @since 2.0
 */
public void add(IFigure figure, Object constraint, int index) {
    super.add(figure, constraint, index);

    // If the connection layout manager is set, then every
    // figure added should use this layout manager.
    if (null !is cast(Connection )figure && getConnectionRouter() !is null)
        (cast(Connection)figure).setConnectionRouter(getConnectionRouter());
}

/**
 * Returns the ConnectionRouter being used by this layer.
 *
 * @return  ConnectionRouter being used by this layer
 * @since 2.0
 */
public ConnectionRouter getConnectionRouter() {
    return connectionRouter;
}

/**
 * @see IFigure#paint(Graphics)
 */
public void paint(Graphics graphics) {
    if (antialias !is SWT.DEFAULT)
        graphics.setAntialias(antialias);
    super.paint(graphics);
}

/**
 * Removes the figure from this Layer.  If the figure is a {@link Connection}, that
 * Connection's {@link ConnectionRouter} is set to <code>null</code>.
 *
 * @param figure The figure to remove
 */
public void remove(IFigure figure) {
    if ( auto f = cast(Connection)figure )
        f.setConnectionRouter(null);
    super.remove(figure);
}

/**
 * Sets the ConnectionRouter for this layer. This router is set as the ConnectionRouter
 * for all the child connections of this Layer.
 *
 * @param router  The ConnectionRouter to set for this Layer
 * @since 2.0
 */
public void setConnectionRouter(ConnectionRouter router) {
    connectionRouter = router;
    FigureIterator iter = new FigureIterator(this);
    IFigure figure;
    while (iter.hasNext()) {
        figure = iter.nextFigure();
        if ( auto f = cast(Connection)figure )
            f.setConnectionRouter(router);
    }
}

/**
 * Sets whether antialiasing should be enabled for the connection layer. If this value is
 * set to something other than {@link SWT#DEFAULT}, {@link Graphics#setAntialias(int)}
 * will be called with the given value when painting this layer.
 * @param antialias the antialias setting
 * @since 3.1
 */
public void setAntialias(int antialias) {
    this.antialias = antialias;
}

}

version (build) {
    debug {
        pragma(link, "dwt2draw2d");
    } else {
        pragma(link, "dwt2draw2d");
    }
}
