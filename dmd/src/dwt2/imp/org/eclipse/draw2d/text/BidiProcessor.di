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
module org.eclipse.draw2d.text.BidiProcessor;

import java.lang.all;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.TextLayout;
import org.eclipse.draw2d.text.FlowFigure;
import org.eclipse.draw2d.text.BidiInfo;
import org.eclipse.draw2d.text.FlowUtilities;

class Bidi{
    public static bool requiresBidi( char[], int, int ){
        return false;
    }
}

/**
 * A helper class for a BlockFlow that does Bidi evaluation of all the text in that block.
 * <p>
 * WARNING: This class is for INTERNAL use only.
 * @author Pratik Shah
 * @since 3.1
 */
public final class BidiProcessor {

/*
 * $TODO Workaround for Carbon.  AWT DLL cannot start properly on carbon.
 * Waiting for bug 82104
 */
private static bool isMacOS(){
    return SWT.getPlatform().equals("carbon"); //$NON-NLS-1$
}

/**
 * A helper class to hold information about contributions made to this processor.
 *
 * @author Pratik Shah
 * @since 3.1
 */
private static class BidiEntry {
    int begin, end;
    FlowFigure fig;
    this(FlowFigure fig, int offset, int length) {
        this.fig = fig;
        this.begin = offset;
        this.end = offset + length;
    }
}

/**
 * A singleton instance.
 */
private static BidiProcessor INSTANCE_;
public static BidiProcessor INSTANCE(){
    if( INSTANCE_ is null ){
        synchronized( BidiProcessor.classinfo ){
            if( INSTANCE_ is null ){
                INSTANCE_ = new BidiProcessor();
            }
        }
    }
    return INSTANCE_;
}

private StringBuffer bidiText;
private List list;
private int orientation = SWT.LEFT_TO_RIGHT;

private this() {
    list = new ArrayList();
}

/**
 * Records a String contribution for this bidi context. Contributions are
 * concatenated (in the order that they were contributed) to make the final
 * String which will determine the bidi info for all contributors.
 * @param fig the figure that is contributing the given text
 * @param str the text contributed by the given figure
 * @see #addControlChar(char)
 */
public void add(FlowFigure fig, String str) {
    //We are currently tracking empty contributions ("")
    list.add(new BidiEntry(fig, bidiText.length(), str.length));
    bidiText.append(str);
}

/**
 * Records a character contribution for this bidi context. Contributions are
 * concatenated (in the order that they were contributed) to make the final
 * String which will determine the bidi info for all contributors.
 * @param fig the figure that is contributing the given text
 * @param c the character being added
 * @see #addControlChar(char)
 */
public void add(FlowFigure fig, dchar c) {
    auto str = dcharToString(c);
    list.add(new BidiEntry(fig, bidiText.length(), str.length));
    bidiText.append(str);
}

/**
 * This methods allows FlowFigures to contribute text that may effect the bidi evaluation,
 * but is not text that is visible on the screen.  The bidi level of such text is
 * reported back to the contributing figure.
 *
 * @param c the control character
 */
public void addControlChar(dchar c) {
    bidiText.append(dcharToString(c));
}

/**
 * Breaks the given int array into bidi levels for each figure based on their
 * contributed text, and assigns those levels to each figure.  Also determines
 * if shaping needs to occur between figures and sets the appendJoiner, prependJoiner
 * accordingly.
 *
 * @param levels the calculated levels of all the text in the block
 */
private void assignResults(int[] levels) {
    BidiEntry prevEntry = null, entry = null;
    BidiInfo prevInfo = null, info = null;
    int end = 2, start = 0;
    for (int i = 0; i < list.size(); i++) {
        entry = cast(BidiEntry)list.get(i);
        info = new BidiInfo();

        while (levels[end] < entry.end)
            end += 2;

        int levelInfo[];
        if (end is start) {
            levelInfo = new int[1];
            if (prevInfo !is null)
                levelInfo[0] = prevInfo.levelInfo[prevInfo.levelInfo.length - 1];
            else
                levelInfo[0] = (orientation is SWT.LEFT_TO_RIGHT) ? 0 : 1;
        } else {
            levelInfo = new int[end - start - 1];
            System.arraycopy(levels, start + 1, levelInfo, 0, levelInfo.length);
        }
        for (int j = 1; j < levelInfo.length; j += 2)
            levelInfo[j] -= entry.begin;
        info.levelInfo = levelInfo;

        // Compare current and previous for joiners, and commit previous BidiInfo.
        if (prevEntry !is null) {
            if (// if we started in the middle of a level run
                    levels[start] < entry.begin
                    // and the level run is odd
                    && levels[start + 1] % 2 is 1
                    // and the first character of this figure is Arabic
                    && isJoiner(entry.begin)
                    // and the last character of the previous figure was Arabic
                    && isPrecedingJoiner(entry.begin))
                prevInfo.trailingJoiner = info.leadingJoiner = true;
            prevEntry.fig.setBidiInfo(prevInfo);
        }
        prevEntry = entry;
        prevInfo = info;
        if (entry.end is levels[end])
            start = end;
        else
            start = end - 2;
    }
    if (entry !is null)
        entry.fig.setBidiInfo(info);
}

private bool isJoiner(int begin) {
    return begin < bidiText.length && isJoiningCharacter(bidiText.slice()[begin.. $].firstCodePoint());
}

/**
 * @param the character to be evaluated
 * @return <code>true</code> if the given character is Arabic or ZWJ
 */
private bool isJoiningCharacter(dchar c) {
    return false;
    //FIXME: SWT Missing functionality
//     return Character.getDirectionality(c) is Character.DIRECTIONALITY_RIGHT_TO_LEFT_ARABIC
//             || c is BidiChars.ZWJ;
}

private bool isPrecedingJoiner(int begin) {
    return begin > 0 && isJoiningCharacter(bidiText.slice()[begin - 1..$].firstCodePoint());
}

/**
 * Processes the contributed text, determines the Bidi levels, and assigns them to
 * the FlowFigures that made thet contributions. This class is for INTERNAL use
 * only. Shaping of visually contiguous Arabic characters that are split in different
 * figures is also handled. This method will do nothing if the contributed text does not
 * require Bidi  evaluation. All contributions are discarded at the end of this method.
 */
public void process() {
    try {
        if (bidiText.length is 0 || isMacOS)
            return;
        char[] chars = bidiText.slice().dup;

        if (orientation !is SWT.RIGHT_TO_LEFT
                && !Bidi.requiresBidi(chars, 0, chars.length - 1))
            return;

        int[] levels = new int[15];
        TextLayout layout = FlowUtilities.getTextLayout();

        layout.setOrientation(orientation);
        layout.setText(bidiText.toString());
        int j = 0, offset, prevLevel = -1;
        for (offset = 0; offset < chars.length; offset++) {
            int newLevel = layout.getLevel(offset);
            if (newLevel !is prevLevel) {
                if (j + 3 > levels.length) {
                    int temp[] = levels;
                    levels = new int[levels.length * 2 + 1];
                    System.arraycopy(temp, 0, levels, 0, temp.length);
                }
                levels[j++] = offset;
                levels[j++] = newLevel;
                prevLevel = newLevel;
            }
        }
        levels[j++] = offset;

        if (j !is levels.length) {
            int[] newLevels = new int[j];
            System.arraycopy(levels, 0, newLevels, 0, j);
            levels = newLevels;
        }
        assignResults(levels);

        // reset the orientation of the layout, in case it was set to RTL
        layout.setOrientation(SWT.LEFT_TO_RIGHT);
    } finally {
        //will cause the fields to be reset for the next string to be processed
        bidiText = null;
        list.clear();
    }
}

/**
 * Sets the paragraph embedding.  The given orientation will be used on TextLayout
 * when determining the Bidi levels.
 *
 * @param newOrientation SWT.LEFT_TO_RIGHT or SWT.RIGHT_TO_LEFT
 */
public void setOrientation(int newOrientation) {
    bidiText = new StringBuffer();
    list.clear();
    orientation = newOrientation;
}

}

version (build) {
    debug {
        pragma(link, "dwt2draw2d");
    } else {
        pragma(link, "dwt2draw2d");
    }
}
