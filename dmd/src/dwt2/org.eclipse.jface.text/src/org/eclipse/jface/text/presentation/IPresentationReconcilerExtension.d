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
module org.eclipse.jface.text.presentation.IPresentationReconcilerExtension;

import org.eclipse.jface.text.presentation.IPresentationDamager; // packageimport
import org.eclipse.jface.text.presentation.IPresentationReconciler; // packageimport
import org.eclipse.jface.text.presentation.PresentationReconciler; // packageimport
import org.eclipse.jface.text.presentation.IPresentationRepairer; // packageimport


import java.lang.all;

/**
 * Extension interface for {@link IPresentationReconciler}. Adds awareness of
 * documents with multiple partitions.
 *
 * @since 3.0
 */
public interface IPresentationReconcilerExtension {

    /**
     * Returns the document partitioning this presentation reconciler is using.
     *
     * @return the document partitioning this presentation reconciler is using
     */
    String getDocumentPartitioning();
}
