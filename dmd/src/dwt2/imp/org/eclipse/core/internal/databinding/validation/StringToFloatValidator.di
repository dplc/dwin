/*******************************************************************************
 * Copyright (c) 2007 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 ******************************************************************************/

module org.eclipse.core.internal.databinding.validation.StringToFloatValidator;
import org.eclipse.core.internal.databinding.validation.NumberFormatConverter;
import org.eclipse.core.internal.databinding.validation.AbstractStringToNumberValidator;

import java.lang.all;

import org.eclipse.core.internal.databinding.conversion.StringToNumberParser;

/**
 * Validates that a string is of the appropriate format and is in the range of a
 * float.
 * 
 * @since 1.0
 */
public class StringToFloatValidator : AbstractStringToNumberValidator {

    private static Float MIN;
    private static Float MAX;

    /**
     * @param converter
     */
    public this(NumberFormatConverter converter) {
        if( MIN is null || MAX is null ){
            MIN = new Float(-Float.MAX_VALUE);
            MAX = new Float( Float.MAX_VALUE);
        }
        super(converter, MIN, MAX);
    }

    /*
     * (non-Javadoc)
     * 
     * @see org.eclipse.core.internal.databinding.validation.AbstractStringToNumberValidator#inRange(java.lang.Number)
     */
    protected bool isInRange(Number number) {
        return StringToNumberParser.inFloatRange(number);
    }
}

version (build) {
    debug {
        pragma(link, "dwt2coredatabinding");
    } else {
        pragma(link, "dwt2coredatabinding");
    }
}
