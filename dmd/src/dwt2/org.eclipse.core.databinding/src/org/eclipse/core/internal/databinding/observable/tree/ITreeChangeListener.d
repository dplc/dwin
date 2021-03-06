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

module org.eclipse.core.internal.databinding.observable.tree.ITreeChangeListener;
import org.eclipse.core.internal.databinding.observable.tree.TreeChangeEvent;

import java.lang.all;

/**
 * @since 3.3
 * 
 */
public interface ITreeChangeListener {
    /**
     * @param event
     */
    void handleTreeChange(TreeChangeEvent event);

}
