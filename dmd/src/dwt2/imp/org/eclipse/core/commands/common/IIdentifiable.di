/*******************************************************************************
 * Copyright (c) 2006, 2007 IBM Corporation and others.
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
module org.eclipse.core.commands.common.IIdentifiable;
import java.lang.all;
/**
 * <p>
 * An object that is unique identifiable based on the combination of its class
 * and its identifier.
 * </p>
 *
 * @see HandleObject
 * @since 3.2
 */
public interface IIdentifiable {

    /**
     * Returns the identifier for this object.
     *
     * @return The identifier; never <code>null</code>.
     */
    String getId();
}

version (build) {
    debug {
        pragma(link, "dwt2corecommands");
    } else {
        pragma(link, "dwt2corecommands");
    }
}
