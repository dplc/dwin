/*******************************************************************************
 * Copyright (c) 2004, 2005 IBM Corporation and others.
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

module org.eclipse.draw2d.text.NestedLine;

import java.lang.all;
import org.eclipse.draw2d.text.LineBox;
import org.eclipse.draw2d.text.LineRoot;
import org.eclipse.draw2d.text.InlineFlow;
import org.eclipse.draw2d.text.FlowUtilities;
import org.eclipse.draw2d.text.FlowBox;

/**
 * @since 3.1
 */
public class NestedLine : LineBox {

InlineFlow owner;
private LineRoot root;

this(InlineFlow owner) {
    this.owner = owner;
}

/**
 * @see org.eclipse.draw2d.text.FlowBox#containsPoint(int, int)
 */
public bool containsPoint(int x, int y) {
    //$TODO should contains use LineRoot?
    return x >= getX()
        && x < getX() + getWidth()
        && y >= getBaseline() - getAscentWithBorder()
        && y < getBaseline() + getDescentWithBorder();
}

int getAscentWithBorder() {
    return contentAscent + FlowUtilities.getBorderAscent(owner);
}

int getDescentWithBorder() {
    return contentDescent + FlowUtilities.getBorderDescent(owner);
}

/**
 * @see org.eclipse.draw2d.text.FlowBox#getBaseline()
 */
public int getBaseline() {
    return root.getBaseline();
}

LineRoot getLineRoot() {
    return root;
}

//int getVisibleAscent() {
//  return contentAscent + FlowUtilities.getBorderAscent(owner);
//}
//
//int getVisibleDescent() {
//  return contentDescent + FlowUtilities.getBorderDescent(owner);
//}

/**
 * Returns the outer ascent of this box.  The outer ascent is the ascent above the
 * baseline including the border size and margin.  This is used when adding content into a
 * LineBox.  The linebox's own border must be drawn around the children.
 * @return the outer ascent of this box
 */
public int getOuterAscent() {
    return contentAscent + FlowUtilities.getBorderAscentWithMargin(owner);
}

/**
 * Returns the outer descent of this box. The outer descent is the space below the
 * baseline including the border size and margin. This is used when adding content into a
 * LineBox. The linebox's own border must be drawn around the children.
 * @return the outer descent of this box
 */
public int getOuterDescent() {
    return contentDescent + FlowUtilities.getBorderDescentWithMargin(owner);
}

void setLineRoot(LineRoot root) {
    this.root = root;
    for (int i = 0; i < fragments.size(); i++)
        (cast(FlowBox)fragments.get(i)).setLineRoot(root);
}

/**
 * @see org.eclipse.draw2d.text.CompositeBox#setLineTop(int)
 */
public void setLineTop(int top) {
    throw new RuntimeException("not supported"); //$NON-NLS-1$
}

}

version (build) {
    debug {
        pragma(link, "dwt2draw2d");
    } else {
        pragma(link, "dwt2draw2d");
    }
}
