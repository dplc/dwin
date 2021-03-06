/*******************************************************************************
 * Copyright (c) 2000, 2003 IBM Corporation and others.
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
module org.eclipse.swt.internal.image.JPEGComment;

import java.lang.all;

import org.eclipse.swt.internal.image.JPEGVariableSizeSegment;
import org.eclipse.swt.internal.image.JPEGFileFormat;
import org.eclipse.swt.internal.image.LEDataInputStream;

final class JPEGComment : JPEGVariableSizeSegment {

    public this(byte[] reference) {
        super(reference);
    }

    public this(LEDataInputStream byteStream) {
        super(byteStream);
    }

    public override int signature() {
        return JPEGFileFormat.COM;
    }
}
