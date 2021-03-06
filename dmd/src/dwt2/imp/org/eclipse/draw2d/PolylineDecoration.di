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
module org.eclipse.draw2d.PolylineDecoration;

import java.lang.all;

import org.eclipse.draw2d.geometry.Point;
import org.eclipse.draw2d.geometry.PointList;
import org.eclipse.draw2d.geometry.Transform;
import org.eclipse.draw2d.Polyline;
import org.eclipse.draw2d.RotatableDecoration;
import org.eclipse.draw2d.ColorConstants;

/**
 * A decorative Figure intended to be placed on a {@link Polyline}. It has the default
 * shape of right-pointing triangle.
 */
public class PolylineDecoration
    : Polyline
    , RotatableDecoration
{

/** A triangle template_ */
private static PointList TRIANGLE_TIP_;
public static PointList TRIANGLE_TIP(){
    if( TRIANGLE_TIP_ is null ){
        synchronized( PolylineDecoration.classinfo ){
            if( TRIANGLE_TIP_ is null ){
                PointList tmp = new PointList();
                tmp.addPoint(-1, 1);
                tmp.addPoint(0, 0);
                tmp.addPoint(-1, -1);
                TRIANGLE_TIP_ = tmp;
            }
        }
    }
    return TRIANGLE_TIP_;
}

private Point location;
private PointList template_;
private Transform transform;

/**
 * Constructs a PolylineDecoration. Defaults the PolylineDecoration to fill its region
 * with black.
 *
 * @since 2.0
 */
public this() {
    location = new Point();
    template_ = TRIANGLE_TIP;
    transform = new Transform();
    setBackgroundColor(ColorConstants.black);
    setScale(7, 3);
}

/**
 * @see Polyline#getPoints()
 */
public PointList getPoints() {
    if (points is null) {
        points = new PointList();
        for (int i = 0; i < template_.size(); i++)
            points.addPoint(transform.getTransformed(template_.getPoint(i)));
    }
    return points;
}

/**
 * @see IFigure#setLocation(Point)
 */
public void setLocation(Point p) {
    points = null;
    bounds = null;
    location.setLocation(p);
    transform.setTranslation(p.x, p.y);
}

/**
 * Sets the PolylineDecoration's point template_. This template_ is an outline of the
 * PolylineDecoration's region. (The default value is TRIANGLE_TIP which is a triangle
 * whose tip is pointing to the right).
 *
 * @param pl the template_
 * @since 2.0
 */
public void setTemplate(PointList pl) {
    erase();
    template_ = pl;
    points = null;
    bounds = null;
    repaint();
}

/**
 * Sets the amount of scaling to be done along X and Y axes on the PolylineDecoration's
 * template_.
 *
 * @param x the x scale
 * @param y the y scale
 * @since 2.0
 */
public void setScale(double x, double y) {
    points = null;
    bounds = null;
    transform.setScale(x, y);
}

/**
 * @see RotatableDecoration#setReferencePoint(Point)
 */
public void setReferencePoint(Point ref_) {
    Point pt = Point.SINGLETON;
    pt.setLocation(ref_);
    pt.negate().translate(location);
    setRotation(Math.atan2(pt.y, pt.x));
}

/**
 * Sets the angle by which rotation is to be done on the PolylineDecoration.
 *
 * @param angle the angle of rotation
 * @since 2.0
 */
public void setRotation(double angle) {
    points = null;
    bounds = null;
    transform.setRotation(angle);
}

}

version (build) {
    debug {
        pragma(link, "dwt2draw2d");
    } else {
        pragma(link, "dwt2draw2d");
    }
}
