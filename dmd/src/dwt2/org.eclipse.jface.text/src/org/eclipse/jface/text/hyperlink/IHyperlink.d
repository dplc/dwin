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
module org.eclipse.jface.text.hyperlink.IHyperlink;

import org.eclipse.jface.text.hyperlink.IHyperlinkPresenterExtension; // packageimport
import org.eclipse.jface.text.hyperlink.MultipleHyperlinkPresenter; // packageimport
import org.eclipse.jface.text.hyperlink.HyperlinkManager; // packageimport
import org.eclipse.jface.text.hyperlink.URLHyperlink; // packageimport
import org.eclipse.jface.text.hyperlink.IHyperlinkDetectorExtension2; // packageimport
import org.eclipse.jface.text.hyperlink.IHyperlinkDetector; // packageimport
import org.eclipse.jface.text.hyperlink.IHyperlinkPresenter; // packageimport
import org.eclipse.jface.text.hyperlink.URLHyperlinkDetector; // packageimport
import org.eclipse.jface.text.hyperlink.DefaultHyperlinkPresenter; // packageimport
import org.eclipse.jface.text.hyperlink.AbstractHyperlinkDetector; // packageimport
import org.eclipse.jface.text.hyperlink.IHyperlinkDetectorExtension; // packageimport
import org.eclipse.jface.text.hyperlink.HyperlinkMessages; // packageimport


import java.lang.all;

import org.eclipse.jface.text.IRegion;


/**
 * Represents a hyperlink.
 * <p>
 * Clients may implement this interface.
 * </p>
 *
 * @since 3.1
 */
public interface IHyperlink {

    /**
     * The region covered by this type of hyperlink.
     *
     * @return the hyperlink region
     */
    IRegion getHyperlinkRegion();

    /**
     * Optional label for this type of hyperlink.
     * <p>
     * This type label can be used by {@link IHyperlinkPresenter}s
     * which show several hyperlinks at once.
     * </p>
     *
     * @return the type label or <code>null</code> if none
     */
    String getTypeLabel();

    /**
     * Optional text for this hyperlink.
     * <p>
     * This can be used in situations where there are
     * several targets for the same hyperlink location.
     * </p>
     *
     * @return the text or <code>null</code> if none
     */
    String getHyperlinkText();

    /**
     * Opens the given hyperlink.
     */
    void open();
}
