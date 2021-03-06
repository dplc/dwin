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
module org.eclipse.jface.internal.text.link.contentassist.IContentAssistListener2;

import org.eclipse.jface.internal.text.link.contentassist.IProposalListener; // packageimport
import org.eclipse.jface.internal.text.link.contentassist.LineBreakingReader; // packageimport
import org.eclipse.jface.internal.text.link.contentassist.CompletionProposalPopup2; // packageimport
import org.eclipse.jface.internal.text.link.contentassist.ContextInformationPopup2; // packageimport
import org.eclipse.jface.internal.text.link.contentassist.ContentAssistMessages; // packageimport
import org.eclipse.jface.internal.text.link.contentassist.Helper2; // packageimport
import org.eclipse.jface.internal.text.link.contentassist.PopupCloser2; // packageimport
import org.eclipse.jface.internal.text.link.contentassist.ContentAssistant2; // packageimport
import org.eclipse.jface.internal.text.link.contentassist.AdditionalInfoController2; // packageimport


import java.lang.all;





import org.eclipse.swt.events.VerifyEvent;
import org.eclipse.jface.text.IEventConsumer;



/**
 * An interface whereby listeners can not only receive key events,
 * but can also consume them to prevent subsequent listeners from
 * processing the event.
 */
interface IContentAssistListener2 : IEventConsumer {

    /**
     * Verifies the key event.
     *
     * @param event the key event
     * @return <code>true</code> if processing should be continued by additional listeners
     * @see org.eclipse.swt.custom.VerifyKeyListener#verifyKey(VerifyEvent)
     */
    public bool verifyKey(VerifyEvent event);
}

version (build) {
    debug {
        pragma(link, "dwt2jfacetext");
    } else {
        pragma(link, "dwt2jfacetext");
    }
}
