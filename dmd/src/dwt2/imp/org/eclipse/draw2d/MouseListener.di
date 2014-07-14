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
module org.eclipse.draw2d.MouseListener;

import java.lang.all;
import org.eclipse.draw2d.MouseEvent;

/**
 * A listener interface for receiving mouse button events.
 */
public interface MouseListener {

/**
 * Called when a mouse button has been pressed while over the listened to object.
 * @param me The MouseEvent object
 */
void mousePressed(MouseEvent me);

/**
 * Called when a pressed mouse button has been released.
 * @param me The MouseEvent object
 */
void mouseReleased(MouseEvent me);

/**
 * Called when a mouse button has been double clicked over the listened to object.
 * @param me The MouseEvent object
 */
void mouseDoubleClicked(MouseEvent me);

/**
 * An empty implementation of MouseListener for convenience.
 */
public class Stub
    : MouseListener
{
    /**
     * @see org.eclipse.draw2d.MouseListener#mousePressed(MouseEvent)
     */
    public void mousePressed(MouseEvent me) { }
    /**
     * @see org.eclipse.draw2d.MouseListener#mouseReleased(MouseEvent)
     */
    public void mouseReleased(MouseEvent me) { }
    /**
     * @see org.eclipse.draw2d.MouseListener#mouseDoubleClicked(MouseEvent)
     */
    public void mouseDoubleClicked(MouseEvent me) { }
}

}

version (build) {
    debug {
        pragma(link, "dwt2draw2d");
    } else {
        pragma(link, "dwt2draw2d");
    }
}