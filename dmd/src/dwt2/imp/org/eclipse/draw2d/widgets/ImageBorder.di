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
module org.eclipse.draw2d.widgets.ImageBorder;

import java.lang.all;



import org.eclipse.swt.graphics.Image;
import org.eclipse.draw2d.AbstractBorder;
import org.eclipse.draw2d.Graphics;
import org.eclipse.draw2d.IFigure;
import org.eclipse.draw2d.geometry.Dimension;
import org.eclipse.draw2d.geometry.Insets;
import org.eclipse.draw2d.geometry.Rectangle;

/**
 * @author Pratik Shah
 */
class ImageBorder
    : AbstractBorder
{

/*
 * @TODO:Pratik Need to test this class extensively
 * @TODO Test inside compound borders
 */

private Insets imgInsets;
private Image image;
private Dimension imageSize;

public this(Image image) {
    setImage(image);
}

public Insets getInsets(IFigure figure) {
    return imgInsets;
}

public Image getImage() {
    return image;
}

/**
 * @see org.eclipse.draw2d.AbstractBorder#getPreferredSize(org.eclipse.draw2d.IFigure)
 */
public Dimension getPreferredSize(IFigure f) {
    return imageSize;
}

public void paint(IFigure figure, Graphics graphics, Insets insets) {
    if (image is null)
        return;
    Rectangle rect = getPaintRectangle(figure, insets);
    int x = rect.x;
    int y = rect.y + (rect.height - imageSize.height) / 2;
    graphics.drawImage(getImage(), x, y);
}

public void setImage(Image img) {
    image = img;
    imageSize = new Dimension(image);
    imgInsets = new Insets();
    imgInsets.left = imageSize.width;
}

}

version (build) {
    debug {
        pragma(link, "dwt2draw2d");
    } else {
        pragma(link, "dwt2draw2d");
    }
}
