/*******************************************************************************
 * Copyright (c) 2004, 2008 IBM Corporation and others.
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
module org.eclipse.core.commands.common.CommandException;

import java.lang.all;

/**
 * Signals that an exception occured within the command architecture.
 * <p>
 * This class is not intended to be extended by clients.
 * </p>
 *
 * @since 3.1
 * @noextend This class is not intended to be subclassed by clients.
 */
public abstract class CommandException : Exception {

    /**
     * Generated serial version UID for this class.
     * 
     * @since 3.4
     */
    private static final long serialVersionUID = 5389763628699257234L;
    
    /**
     * This member variable is required here to allow us to compile against JCL
     * foundation libraries.  The value may be <code>null</code>.
     */
//     private Exception cause;

    /**
     * Creates a new instance of this class with the specified detail message.
     *
     * @param message
     *            the detail message; may be <code>null</code>.
     */
    public this(String message) {
        super(message);
    }

    /**
     * Creates a new instance of this class with the specified detail message
     * and cause.
     *
     * @param message
     *            the detail message; may be <code>null</code>.
     * @param cause
     *            the cause; may be <code>null</code>.
     */
    public this(String message, Exception cause) {
        super(message);
        // don't pass the cause to super, to allow compilation against JCL Foundation
        this.next = cause;
    }

    /**
     * Returns the cause of this throwable or <code>null</code> if the
     * cause is nonexistent or unknown.
     *
     * @return the cause or <code>null</code>
     */
    public /+override+/ Exception getCause() {
        return next;
    }

}
