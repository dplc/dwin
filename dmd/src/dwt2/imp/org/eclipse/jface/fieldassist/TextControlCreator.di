/*******************************************************************************
 * Copyright (c) 2005, 2007 IBM Corporation and others.
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
module org.eclipse.jface.fieldassist.TextControlCreator;

import org.eclipse.jface.fieldassist.IControlCreator;

import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Text;

import java.lang.all;

/**
 * An {@link IControlCreator} for SWT Text controls. This is a convenience class
 * for creating text controls to be supplied to a decorated field.
 *
 * @since 3.2
 * @deprecated As of 3.3, clients should use {@link ControlDecoration} instead
 *             of {@link DecoratedField}.
 *
 */
public class TextControlCreator : IControlCreator {

    public Control createControl(Composite parent, int style) {
        return new Text(parent, style);
    }
}

version (build) {
    debug {
        pragma(link, "dwt2jface");
    } else {
        pragma(link, "dwt2jface");
    }
}
