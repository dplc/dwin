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
module org.eclipse.draw2d.PrinterGraphics;

import java.lang.all;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.eclipse.swt.graphics.Font;
import org.eclipse.swt.graphics.FontData;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.printing.Printer;
import org.eclipse.swt.widgets.Display;
import org.eclipse.draw2d.ScaledGraphics;
import org.eclipse.draw2d.Graphics;

/**
 * A scalable graphics object used to print to a printer.
 * @author danlee
 */
public class PrinterGraphics : ScaledGraphics {

Map imageCache;

Printer printer;

/**
 * Creates a new PrinterGraphics with Graphics g, using Printer p
 * @param g Graphics object to draw with
 * @param p Printer to print to
 */
public this(Graphics g, Printer p) {
    imageCache = new HashMap();
    super(g);
    printer = p;
}

Font createFont(FontData data) {
    return new Font(printer, data);
}

private Image printerImage(Image image) {
    Image result = cast(Image)imageCache.get(image);
    if (result !is null)
        return result;

    result = new Image(printer, image.getImageData());
    imageCache.put(image, result);
    return result;
}

/**
 * @see org.eclipse.draw2d.ScaledGraphics#dispose()
 */
public void dispose() {
    super.dispose();

    //Dispose printer images
    Iterator iter = imageCache.values().iterator();
    while (iter.hasNext()) {
        Image printerImage = (cast(Image)iter.next());
        printerImage.dispose();
    }

    imageCache.clear();
}

/**
 * @see org.eclipse.draw2d.Graphics#drawImage(Image, int, int)
 */
public void drawImage(Image srcImage, int x, int y) {
    super.drawImage(printerImage(srcImage), x, y);
}

/**
 * @see Graphics#drawImage(Image, int, int, int, int, int, int, int, int)
 */
public void drawImage(Image srcImage, int sx, int sy, int sw, int sh,
                                        int tx, int ty, int tw, int th) {
    super.drawImage(printerImage(srcImage), sx, sy, sw, sh, tx, ty, tw, th);
}

int zoomFontHeight(int height) {
    return cast(int)
        (height * zoom * Display.getCurrent().getDPI().y / printer.getDPI().y
            + 0.0000001);
}

int zoomLineWidth(int w) {
    return cast(int)(w * zoom);
}

}

version (build) {
    debug {
        pragma(link, "dwt2draw2d");
    } else {
        pragma(link, "dwt2draw2d");
    }
}
