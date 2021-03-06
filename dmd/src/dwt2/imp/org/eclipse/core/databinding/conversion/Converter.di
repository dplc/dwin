/*******************************************************************************
 * Copyright (c) 2006, 2007 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *******************************************************************************/

module org.eclipse.core.databinding.conversion.Converter;
import org.eclipse.core.databinding.conversion.IConverter;

import java.lang.all;


/**
 * Abstract base class for converters.
 * 
 * @since 1.0
 *
 */
public abstract class Converter : IConverter {

    private Object fromType;
    private Object toType;

    /**
     * @param fromType
     * @param toType
     */
    public this(Object fromType, Object toType) {
        this.fromType = fromType;
        this.toType = toType;
    }

    public Object getFromType() {
        return fromType;
    }

    public Object getToType() {
        return toType;
    }

}

version (build) {
    debug {
        pragma(link, "dwt2coredatabinding");
    } else {
        pragma(link, "dwt2coredatabinding");
    }
}
