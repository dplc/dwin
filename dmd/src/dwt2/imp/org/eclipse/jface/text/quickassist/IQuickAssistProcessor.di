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
module org.eclipse.jface.text.quickassist.IQuickAssistProcessor;

import org.eclipse.jface.text.quickassist.QuickAssistAssistant; // packageimport
import org.eclipse.jface.text.quickassist.IQuickAssistAssistant; // packageimport
import org.eclipse.jface.text.quickassist.IQuickAssistAssistantExtension; // packageimport
import org.eclipse.jface.text.quickassist.IQuickAssistInvocationContext; // packageimport
import org.eclipse.jface.text.quickassist.IQuickFixableAnnotation; // packageimport


import java.lang.all;

import org.eclipse.jface.text.contentassist.ICompletionProposal;
import org.eclipse.jface.text.source.Annotation;


/**
 * Quick assist processor for quick fixes and quick assists.
 * <p>
 * A processor can provide just quick fixes, just quick assists
 * or both.
 * </p>
 * <p>
 * This interface can be implemented by clients.</p>
 * 
 * @since 3.2
 */
public interface IQuickAssistProcessor {

    /**
     * Returns the reason why this quick assist processor
     * was unable to produce any completion proposals.
     *
     * @return an error message or <code>null</code> if no error occurred
     */
    String getErrorMessage();

    /**
     * Tells whether this processor has a fix for the given annotation.
     * <p>
     * <strong>Note:</strong> This test must be fast and optimistic i.e. it is OK to return
     * <code>true</code> even though there might be no quick fix.
     * </p>
     * 
     * @param annotation the annotation
     * @return <code>true</code> if the assistant has a fix for the given annotation
     */
    bool canFix(Annotation annotation);
    
    /**
     * Tells whether this assistant has assists for the given invocation context.
     * 
     * @param invocationContext the invocation context
     * @return <code>true</code> if the assistant has a fix for the given annotation
     */
    bool canAssist(IQuickAssistInvocationContext invocationContext);
    
    /**
     * Returns a list of quick assist and quick fix proposals for the
     * given invocation context.
     *
     * @param invocationContext the invocation context
     * @return an array of completion proposals or <code>null</code> if no proposals are available
     */
    ICompletionProposal[] computeQuickAssistProposals(IQuickAssistInvocationContext invocationContext);
    
}

version (build) {
    debug {
        pragma(link, "dwt2jfacetext");
    } else {
        pragma(link, "dwt2jfacetext");
    }
}
