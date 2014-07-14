/*******************************************************************************
 * Copyright (c) 2003, 2005 IBM Corporation and others.
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
module org.eclipse.ui.internal.forms.widgets.IFocusSelectable;


import org.eclipse.swt.graphics.Rectangle;
import java.lang.all;
import java.util.Hashtable;
import java.util.Set;

public interface IFocusSelectable {
    bool isFocusSelectable(Hashtable resourceTable);
    bool setFocus(Hashtable resourceTable, bool direction);
    Rectangle getBounds();
}

version (build) {
    debug {
        pragma(link, "dwt2uiforms");
    } else {
        pragma(link, "dwt2uiforms");
    }
}
