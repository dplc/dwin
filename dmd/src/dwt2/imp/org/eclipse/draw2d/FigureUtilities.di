/*******************************************************************************
 * Copyright (c) 2000, 2007 IBM Corporation and others.
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
module org.eclipse.draw2d.FigureUtilities;

import java.lang.all;
import java.util.ArrayList;


import org.eclipse.swt.graphics.Color;
import org.eclipse.swt.graphics.Font;
import org.eclipse.swt.graphics.FontMetrics;
import org.eclipse.swt.graphics.GC;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.draw2d.geometry.Dimension;
import org.eclipse.draw2d.geometry.Rectangle;
import org.eclipse.draw2d.Shape;
import org.eclipse.draw2d.IFigure;
import org.eclipse.draw2d.Graphics;
static import org.eclipse.draw2d.geometry.Point;
/**
 * Provides miscellaneous Figure operations.
 */
public class FigureUtilities {

private static final float RGB_VALUE_MULTIPLIER = 0.6f;
private static GC gc;
private static Font appliedFont;
private static FontMetrics metrics;

private static Color ghostFillColor_;
private static Color ghostFillColor(){
    if( ghostFillColor_ is null ){
        synchronized( FigureUtilities.classinfo ){
            if( ghostFillColor_ is null ){
                ghostFillColor_ = new Color(null, 31, 31, 31);
            }
        }
    }
    return ghostFillColor_;
}

/**
 * Returns a new Color the same as the passed color in a darker hue.
 *
 * @param color the color to darken
 * @return the darkened color
 * @since 2.0
 */
public static Color darker(Color color) {
    return new Color(null,
        cast(int)(color.getRed()   * RGB_VALUE_MULTIPLIER),
        cast(int)(color.getGreen() * RGB_VALUE_MULTIPLIER),
        cast(int)(color.getBlue()  * RGB_VALUE_MULTIPLIER));
}

/**
 * Returns the FontMetrics associated with the passed Font.
 *
 * @param f the font
 * @return the FontMetrics for the given font
 * @see GC#getFontMetrics()
 * @since 2.0
 */
public static FontMetrics getFontMetrics(Font f) {
    setFont(f);
    if (metrics is null)
        metrics = getGC().getFontMetrics();
    return metrics;
}

/**
 * Returns the GC used for various utilities. Advanced graphics must not be switched on by
 * clients using this GC.
 * @deprecated do not mess with this GC
 * @return the GC
 */
protected static GC getGC() {
    if (gc is null) {
        gc = new GC(new Shell());
        appliedFont = gc.getFont();
    }
    return gc;
}

/**
 * Returns the dimensions of the String <i>s</i> using the font <i>f</i>.  Tab expansion
 * and carriage return processing are performed.
 * @param s the string
 * @param f the font
 * @return the text's dimensions
 * @see GC#textExtent(String)
 */
protected static org.eclipse.swt.graphics.Point.Point getTextDimension(String s, Font f) {
    setFont(f);
    return getGC().textExtent(s);
}

/**
 * Returns the highest ancestor for the given figure
 * @since 3.0
 * @param figure a figure
 * @return the root ancestor
 */
public static IFigure getRoot(IFigure figure) {
    while (figure.getParent() !is null)
        figure = figure.getParent();
    return figure;
}

/**
 * Returns the dimensions of the String <i>s</i> using the font <i>f</i>. No tab
 * expansion or carriage return processing will be performed.
 * @param s the string
 * @param f the font
 * @return the string's dimensions
 * @see GC#stringExtent(java.lang.String)
 */
protected static org.eclipse.swt.graphics.Point.Point getStringDimension(String s, Font f) {
    setFont(f);
    return getGC().stringExtent(s);
}

/**
 * Returns the Dimensions of the given text, converting newlines and tabs appropriately.
 *
 * @param text the text
 * @param f the font
 * @return the dimensions of the given text
 * @since 2.0
 */
public static Dimension getTextExtents(String text, Font f) {
    return new Dimension(getTextDimension(text, f));
}

/**
 * Returns the Dimensions of <i>s</i> in Font <i>f</i>.
 *
 * @param s the string
 * @param f the font
 * @return the dimensions of the given string
 * @since 2.0
 */
public static Dimension getStringExtents(String s, Font f) {
    return new Dimension(getStringDimension(s, f));
}

/**
 * Returns the Dimensions of the given text, converting newlines and tabs appropriately.
 *
 * @param s the string
 * @param f the font
 * @param result the Dimension that will contain the result of this calculation
 * @since 2.0
 */
public static void getTextExtents(String s, Font f, Dimension result) {
    org.eclipse.swt.graphics.Point.Point pt = getTextDimension(s, f);
    result.width = pt.x;
    result.height = pt.y;
}

/**
 * Returns the width of <i>s</i> in Font <i>f</i>.
 *
 * @param s the string
 * @param f the font
 * @return the width
 * @since 2.0
 */
public static int getTextWidth(String s, Font f) {
    return getTextDimension(s, f).x;
}

/**
 * Returns a Color the same as the passed color in a lighter hue.
 *
 * @param rgb the color
 * @return the lighter color
 * @since 2.0
 */
public static Color lighter(Color rgb) {
    int r = rgb.getRed(),
        g = rgb.getGreen(),
        b = rgb.getBlue();

    return new Color(null,
        Math.max(2, Math.min(cast(int)(r / RGB_VALUE_MULTIPLIER), 255)),
        Math.max(2, Math.min(cast(int)(g / RGB_VALUE_MULTIPLIER), 255)),
        Math.max(2, Math.min(cast(int)(b / RGB_VALUE_MULTIPLIER), 255))
    );
}

/**
 * Produces a ghosting effect on the shape <i>s</i>.
 *
 * @param s the shape
 * @return the ghosted shape
 * @since 2.0
 */
public static Shape makeGhostShape(Shape s) {
    s.setBackgroundColor(ghostFillColor);
    s.setFillXOR(true);
    s.setOutlineXOR(true);
    return s;
}

/**
 * Mixes the passed Colors and returns the resulting Color.
 *
 * @param c1 the first color
 * @param c2 the second color
 * @param weight the first color's weight from 0-1
 * @return the new color
 * @since 2.0
 */
public static Color mixColors(Color c1, Color c2, double weight) {
    return new Color(null,
            cast(int)(c1.getRed() * weight + c2.getRed() * (1 - weight)),
            cast(int)(c1.getGreen() * weight + c2.getGreen() * (1 - weight)),
            cast(int)(c1.getBlue() * weight + c2.getBlue() * (1 - weight)));
}


/**
 * Mixes the passed Colors and returns the resulting Color.
 *
 * @param c1 the first color
 * @param c2 the second color
 * @return the new color
 * @since 2.0
 */
public static Color mixColors(Color c1, Color c2) {
    return new Color(null,
        (c1.getRed() + c2.getRed()) / 2,
        (c1.getGreen() + c2.getGreen()) / 2,
        (c1.getBlue() + c2.getBlue()) / 2);
}

/**
 * Paints a border with an etching effect, having a shadow of Color <i>shadow</i> and
 * highlight of Color <i>highlight</i>.
 *
 * @param g the graphics object
 * @param r the bounds of the border
 * @param shadow the shadow color
 * @param highlight the highlight color
 * @since 2.0
 */
public static void paintEtchedBorder(Graphics g, Rectangle r,
                                        Color shadow, Color highlight) {
    int x = r.x,
        y = r.y,
        w = r.width,
        h = r.height;

    g.setLineStyle(Graphics.LINE_SOLID);
    g.setLineWidth(1);
    g.setXORMode(false);

    w -= 2;
    h -= 2;

    g.setForegroundColor(shadow);
    g.drawRectangle(x, y, w, h);

    x++;
    y++;
    g.setForegroundColor(highlight);
    g.drawRectangle(x, y, w, h);
}

/**
 * Helper method to paint a grid.  Painting is optimized as it is restricted to the
 * Graphics' clip.
 *
 * @param   g           The Graphics object to be used for painting
 * @param   f           The figure in which the grid is to be painted
 * @param   origin      Any point where the grid lines are expected to intersect
 * @param   distanceX   Distance between vertical grid lines; if 0 or less, vertical grid
 *                      lines will not be drawn
 * @param   distanceY   Distance between horizontal grid lines; if 0 or less, horizontal
 *                      grid lines will not be drawn
 *
 * @since 3.0
 */
public static void paintGrid(Graphics g, IFigure f,
        org.eclipse.draw2d.geometry.Point.Point origin, int distanceX, int distanceY) {
    Rectangle clip = g.getClip(Rectangle.SINGLETON);

    if (distanceX > 0) {
        if (origin.x >= clip.x)
            while (origin.x - distanceX >= clip.x)
                origin.x -= distanceX;
        else
            while (origin.x < clip.x)
                origin.x += distanceX;
        for (int i = origin.x; i < clip.x + clip.width; i += distanceX)
            g.drawLine(i, clip.y, i, clip.y + clip.height);
    }

    if (distanceY > 0) {
        if (origin.y >= clip.y)
            while (origin.y - distanceY >= clip.y)
                origin.y -= distanceY;
        else
            while (origin.y < clip.y)
                origin.y += distanceY;
        for (int i = origin.y; i < clip.y + clip.height; i += distanceY)
            g.drawLine(clip.x, i, clip.x + clip.width, i);
    }
}

/**
 * Paints a border with an etching effect, having a shadow of a darker version of g's
 * background color, and a highlight a lighter version of g's background color.
 *
 * @param g the graphics object
 * @param r the bounds of the border
 * @since 2.0
 */
public static void paintEtchedBorder(Graphics g, Rectangle r) {
    Color rgb = g.getBackgroundColor(),
        shadow = darker(rgb),
        highlight = lighter(rgb);
    paintEtchedBorder(g, r, shadow, highlight);
}

/**
 * Sets Font to passed value.
 *
 * @param f the new font
 * @since 2.0
 */
protected static void setFont(Font f) {
    if (appliedFont is f || f.opEquals(appliedFont))
        return;
    getGC().setFont(f);
    appliedFont = f;
    metrics = null;
}

/**
 * Returns the figure which is the ancestor of both figures, or <code>null</code>. A
 * figure is an ancestor if it is the parent of another figure, or if it is the ancestor
 * of that figure's parent. If one figure contains the other, <code>null</code> is
 * returned.
 * @since 3.1
 * @param l left
 * @param r right
 * @return the common ancestor
 */
public static IFigure findCommonAncestor(IFigure l, IFigure r) {
    if (l is r)
        return l;
    ArrayList left = new ArrayList();
    ArrayList right = new ArrayList();
    while (l !is null) {
        left.add(cast(Object)l);
        l = l.getParent();
    }
    while (r !is null) {
        right.add(cast(Object)r);
        r = r.getParent();
    }
    if (left.isEmpty() || right.isEmpty())
        return null;

    int il = left.size() - 1;
    int ir = right.size() - 1;
    do {
        if (left.get(il) !is right.get(ir))
                break;
        il--;
        ir--;
    } while (il >= 0 && ir >= 0);

    return cast(IFigure) left.get(il + 1);
}

/**
 *  Returns <code>true</code> if the ancestor contains the descendant, or is the ancestor
 *  of the descendant's parent.
 * @param ancestor the ancestor
 * @param descendant the descendant
 * @return <code>true</code> if ancestor
 * @since 3.2
 */
public static bool isAncestor(IFigure ancestor, IFigure descendant) {
    while (descendant !is null) {
        descendant = descendant.getParent();
        if (descendant is ancestor)
            return true;
    }
    return false;
}

}

version (build) {
    debug {
        pragma(link, "dwt2draw2d");
    } else {
        pragma(link, "dwt2draw2d");
    }
}
