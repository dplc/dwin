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

module org.eclipse.core.internal.databinding.validation.StringToIntegerValidator;
import org.eclipse.core.internal.databinding.validation.NumberFormatConverter;
import org.eclipse.core.internal.databinding.validation.AbstractStringToNumberValidator;

import java.lang.all;

import org.eclipse.core.internal.databinding.conversion.StringToNumberParser;


/**
 * Validates that a string is of the appropriate format and is in the range of
 * an integer.
 * 
 * @since 1.0
 */
public class StringToIntegerValidator : AbstractStringToNumberValidator {
    private static Integer MIN;
    private static Integer MAX;

    /**
     * @param converter
     */
    public this(NumberFormatConverter converter) {
        if( MIN is null || MAX is null ){
            MIN = new Integer(Integer.MIN_VALUE);
            MAX = new Integer(Integer.MAX_VALUE);
        }
        super(converter, MIN, MAX);
    }

    /* (non-Javadoc)
     * @see org.eclipse.core.internal.databinding.validation.AbstractStringToNumberValidator#inRange(java.lang.Number)
     */
    protected bool isInRange(Number number) {
        return StringToNumberParser.inIntegerRange(number);
    }
}
