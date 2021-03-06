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
module org.eclipse.draw2d.Locator;

import java.lang.all;
import org.eclipse.draw2d.IFigure;

/**
 * Controls the location of an IFigure.
 */
public interface Locator {

/**
 * Relocates the given IFigure.
 * @param target The figure to relocate
 */
void relocate(IFigure target);

}
