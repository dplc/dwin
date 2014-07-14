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


module org.eclipse.jface.text.rules.ITokenScanner;

import org.eclipse.jface.text.rules.FastPartitioner; // packageimport
import org.eclipse.jface.text.rules.Token; // packageimport
import org.eclipse.jface.text.rules.RuleBasedScanner; // packageimport
import org.eclipse.jface.text.rules.EndOfLineRule; // packageimport
import org.eclipse.jface.text.rules.WordRule; // packageimport
import org.eclipse.jface.text.rules.WhitespaceRule; // packageimport
import org.eclipse.jface.text.rules.WordPatternRule; // packageimport
import org.eclipse.jface.text.rules.IPredicateRule; // packageimport
import org.eclipse.jface.text.rules.DefaultPartitioner; // packageimport
import org.eclipse.jface.text.rules.NumberRule; // packageimport
import org.eclipse.jface.text.rules.SingleLineRule; // packageimport
import org.eclipse.jface.text.rules.PatternRule; // packageimport
import org.eclipse.jface.text.rules.RuleBasedDamagerRepairer; // packageimport
import org.eclipse.jface.text.rules.ICharacterScanner; // packageimport
import org.eclipse.jface.text.rules.IRule; // packageimport
import org.eclipse.jface.text.rules.DefaultDamagerRepairer; // packageimport
import org.eclipse.jface.text.rules.IToken; // packageimport
import org.eclipse.jface.text.rules.IPartitionTokenScanner; // packageimport
import org.eclipse.jface.text.rules.MultiLineRule; // packageimport
import org.eclipse.jface.text.rules.RuleBasedPartitioner; // packageimport
import org.eclipse.jface.text.rules.RuleBasedPartitionScanner; // packageimport
import org.eclipse.jface.text.rules.BufferedRuleBasedScanner; // packageimport
import org.eclipse.jface.text.rules.IWhitespaceDetector; // packageimport

import java.lang.all;
import java.util.Set;


import org.eclipse.jface.text.IDocument;


/**
 * A token scanner scans a range of a document and reports about the token it finds.
 * A scanner has state. When asked, the scanner returns the offset and the length of the
 * last found token.
 *
 * @see org.eclipse.jface.text.rules.IToken
 * @since 2.0
 */
public interface ITokenScanner {

    /**
     * Configures the scanner by providing access to the document range that should
     * be scanned.
     *
     * @param document the document to scan
     * @param offset the offset of the document range to scan
     * @param length the length of the document range to scan
     */
    void setRange(IDocument document, int offset, int length);

    /**
     * Returns the next token in the document.
     *
     * @return the next token in the document
     */
    IToken nextToken();

    /**
     * Returns the offset of the last token read by this scanner.
     *
     * @return the offset of the last token read by this scanner
     */
    int getTokenOffset();

    /**
     * Returns the length of the last token read by this scanner.
     *
     * @return the length of the last token read by this scanner
     */
    int getTokenLength();
}

version (build) {
    debug {
        pragma(link, "dwt2jfacetext");
    } else {
        pragma(link, "dwt2jfacetext");
    }
}
