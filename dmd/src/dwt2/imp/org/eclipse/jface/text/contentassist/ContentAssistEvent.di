/*******************************************************************************
 * Copyright (c) 2005, 2008 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *     Anton Leherbauer (Wind River Systems) - [content assist][api] ContentAssistEvent should contain information about auto activation - https://bugs.eclipse.org/bugs/show_bug.cgi?id=193728
 * Port to the D programming language:
 *     Frank Benoit <benoit@tionex.de>
 *******************************************************************************/
module org.eclipse.jface.text.contentassist.ContentAssistEvent;

import org.eclipse.jface.text.contentassist.Helper; // packageimport
import org.eclipse.jface.text.contentassist.PopupCloser; // packageimport
import org.eclipse.jface.text.contentassist.IContentAssistant; // packageimport
import org.eclipse.jface.text.contentassist.CompletionProposal; // packageimport
import org.eclipse.jface.text.contentassist.ICompletionProposalExtension5; // packageimport
import org.eclipse.jface.text.contentassist.IContextInformationValidator; // packageimport
import org.eclipse.jface.text.contentassist.IContentAssistListener; // packageimport
import org.eclipse.jface.text.contentassist.ICompletionProposalExtension6; // packageimport
import org.eclipse.jface.text.contentassist.ICompletionListener; // packageimport
import org.eclipse.jface.text.contentassist.ICompletionProposalExtension2; // packageimport
import org.eclipse.jface.text.contentassist.IContentAssistantExtension4; // packageimport
import org.eclipse.jface.text.contentassist.ContextInformation; // packageimport
import org.eclipse.jface.text.contentassist.ICompletionProposalExtension3; // packageimport
import org.eclipse.jface.text.contentassist.ContextInformationValidator; // packageimport
import org.eclipse.jface.text.contentassist.ICompletionProposal; // packageimport
import org.eclipse.jface.text.contentassist.IContentAssistProcessor; // packageimport
import org.eclipse.jface.text.contentassist.AdditionalInfoController; // packageimport
import org.eclipse.jface.text.contentassist.IContextInformationPresenter; // packageimport
import org.eclipse.jface.text.contentassist.ICompletionProposalExtension4; // packageimport
import org.eclipse.jface.text.contentassist.ICompletionListenerExtension; // packageimport
import org.eclipse.jface.text.contentassist.ContextInformationPopup; // packageimport
import org.eclipse.jface.text.contentassist.IContextInformationExtension; // packageimport
import org.eclipse.jface.text.contentassist.IContentAssistantExtension2; // packageimport
import org.eclipse.jface.text.contentassist.ContentAssistSubjectControlAdapter; // packageimport
import org.eclipse.jface.text.contentassist.CompletionProposalPopup; // packageimport
import org.eclipse.jface.text.contentassist.ICompletionProposalExtension; // packageimport
import org.eclipse.jface.text.contentassist.IContextInformation; // packageimport
import org.eclipse.jface.text.contentassist.IContentAssistantExtension3; // packageimport
import org.eclipse.jface.text.contentassist.ContentAssistant; // packageimport
import org.eclipse.jface.text.contentassist.IContentAssistantExtension; // packageimport
import org.eclipse.jface.text.contentassist.JFaceTextMessages; // packageimport


import java.lang.all;


/**
 * Describes the state that the content assistant is in when completing proposals.
 * <p>
 * Clients may use this class.
 * </p>
 * 
 * @since 3.2
 * @see ICompletionListener
 * @noinstantiate This class is not intended to be instantiated by clients.
 */
public final class ContentAssistEvent {
    /**
     * Creates a new event.
     * 
     * @param ca the assistant
     * @param proc the processor
     * @param isAutoActivated whether content assist was triggered by auto activation
     * @since 3.4
     */
    this(IContentAssistant ca, IContentAssistProcessor proc, bool isAutoActivated) {
        assistant= ca;
        processor= proc;
        this.isAutoActivated= isAutoActivated;
    }

    /**
     * Creates a new event.
     * 
     * @param ca the assistant
     * @param proc the processor
     */
    this(ContentAssistant ca, IContentAssistProcessor proc) {
        this(ca, proc, false);
    }

    /**
     * The content assistant computing proposals.
     */
    public const IContentAssistant assistant;
    /**
     * The processor for the current partition.
     */
    public const IContentAssistProcessor processor;
    /**
     * Tells, whether content assist was triggered by auto activation.
     * <p>
     * <strong>Note:</strong> This flag is only valid in {@link ICompletionListener#assistSessionStarted(ContentAssistEvent)}.
     * </p>
     * 
     * @since 3.4
     */
    public const bool isAutoActivated;
}

version (build) {
    debug {
        pragma(link, "dwt2jfacetext");
    } else {
        pragma(link, "dwt2jfacetext");
    }
}
