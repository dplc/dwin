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
module org.eclipse.draw2d.ArrowButton;

import java.lang.all;

import org.eclipse.draw2d.geometry.Insets;
import org.eclipse.draw2d.Button;
import org.eclipse.draw2d.Orientable;
import org.eclipse.draw2d.Triangle;
import org.eclipse.draw2d.MarginBorder;
import org.eclipse.draw2d.ColorConstants;

/**
 * A Button which displays a triangle pointing in a specified direction. This class is
 * used by the {@link ScrollBar} figure.
 */
public class ArrowButton
    : Button
    , Orientable
{

/**
 * Constructs a default ArrowButton with the arrow pointing north.
 *
 * @since 2.0
 */
public this() {
    createTriangle();
    setRequestFocusEnabled(false);
    setFocusTraversable(false);
}

/**
 * Constructs an ArrowButton with the arrow having the direction given in the input.
 * The direction can be one of many directional constants defined in
 * {@link PositionConstants}.
 *
 * @param direction  Direction of the arrow
 * @since 2.0
 */
public this(int direction) {
    this();
    setDirection(direction);
}

/**
 * Contructs a triangle with a black background pointing north, and sets it as the
 * contents of the button.
 *
 * @since 2.0
 */
protected void createTriangle() {
    Triangle tri = new Triangle();
    tri.setOutline(true);
    tri.setBackgroundColor(ColorConstants.listForeground);
    tri.setForegroundColor(ColorConstants.listForeground);
    tri.setBorder(new MarginBorder(new Insets(2)));
    setContents(tri);
}

/**
 * @see org.eclipse.draw2d.Orientable#setDirection(int)
 */
public void setDirection(int value) {
    setChildrenDirection(value);
}

/**
 * @see org.eclipse.draw2d.Orientable#setOrientation(int)
 */
public void setOrientation(int value) {
    setChildrenOrientation(value);
}

}

version (build) {
    debug {
        pragma(link, "dwt2draw2d");
    } else {
        pragma(link, "dwt2draw2d");
    }
}
